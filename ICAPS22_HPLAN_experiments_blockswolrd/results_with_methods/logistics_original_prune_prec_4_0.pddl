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
      ?auto_15259 - OBJ
      ?auto_15258 - LOCATION
    )
    :vars
    (
      ?auto_15260 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15260 ?auto_15258 ) ( IN-TRUCK ?auto_15259 ?auto_15260 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_15259 ?auto_15260 ?auto_15258 )
      ( DELIVER-1PKG-VERIFY ?auto_15259 ?auto_15258 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15277 - OBJ
      ?auto_15276 - LOCATION
    )
    :vars
    (
      ?auto_15278 - TRUCK
      ?auto_15279 - LOCATION
      ?auto_15280 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15277 ?auto_15278 ) ( TRUCK-AT ?auto_15278 ?auto_15279 ) ( IN-CITY ?auto_15279 ?auto_15280 ) ( IN-CITY ?auto_15276 ?auto_15280 ) ( not ( = ?auto_15276 ?auto_15279 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15278 ?auto_15279 ?auto_15276 ?auto_15280 )
      ( DELIVER-1PKG ?auto_15277 ?auto_15276 )
      ( DELIVER-1PKG-VERIFY ?auto_15277 ?auto_15276 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15303 - OBJ
      ?auto_15302 - LOCATION
    )
    :vars
    (
      ?auto_15306 - TRUCK
      ?auto_15304 - LOCATION
      ?auto_15305 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15306 ?auto_15304 ) ( IN-CITY ?auto_15304 ?auto_15305 ) ( IN-CITY ?auto_15302 ?auto_15305 ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( OBJ-AT ?auto_15303 ?auto_15304 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15303 ?auto_15306 ?auto_15304 )
      ( DELIVER-1PKG ?auto_15303 ?auto_15302 )
      ( DELIVER-1PKG-VERIFY ?auto_15303 ?auto_15302 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15329 - OBJ
      ?auto_15328 - LOCATION
    )
    :vars
    (
      ?auto_15331 - LOCATION
      ?auto_15332 - CITY
      ?auto_15330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15331 ?auto_15332 ) ( IN-CITY ?auto_15328 ?auto_15332 ) ( not ( = ?auto_15328 ?auto_15331 ) ) ( OBJ-AT ?auto_15329 ?auto_15331 ) ( TRUCK-AT ?auto_15330 ?auto_15328 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15330 ?auto_15328 ?auto_15331 ?auto_15332 )
      ( DELIVER-1PKG ?auto_15329 ?auto_15328 )
      ( DELIVER-1PKG-VERIFY ?auto_15329 ?auto_15328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15472 - OBJ
      ?auto_15473 - OBJ
      ?auto_15471 - LOCATION
    )
    :vars
    (
      ?auto_15474 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15473 ?auto_15472 ) ) ( TRUCK-AT ?auto_15474 ?auto_15471 ) ( IN-TRUCK ?auto_15473 ?auto_15474 ) ( OBJ-AT ?auto_15472 ?auto_15471 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15473 ?auto_15471 )
      ( DELIVER-2PKG-VERIFY ?auto_15472 ?auto_15473 ?auto_15471 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15476 - OBJ
      ?auto_15477 - OBJ
      ?auto_15475 - LOCATION
    )
    :vars
    (
      ?auto_15478 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15477 ?auto_15476 ) ) ( TRUCK-AT ?auto_15478 ?auto_15475 ) ( IN-TRUCK ?auto_15476 ?auto_15478 ) ( OBJ-AT ?auto_15477 ?auto_15475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15476 ?auto_15475 )
      ( DELIVER-2PKG-VERIFY ?auto_15476 ?auto_15477 ?auto_15475 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15614 - OBJ
      ?auto_15615 - OBJ
      ?auto_15613 - LOCATION
    )
    :vars
    (
      ?auto_15616 - TRUCK
      ?auto_15617 - LOCATION
      ?auto_15618 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15615 ?auto_15614 ) ) ( IN-TRUCK ?auto_15615 ?auto_15616 ) ( TRUCK-AT ?auto_15616 ?auto_15617 ) ( IN-CITY ?auto_15617 ?auto_15618 ) ( IN-CITY ?auto_15613 ?auto_15618 ) ( not ( = ?auto_15613 ?auto_15617 ) ) ( OBJ-AT ?auto_15614 ?auto_15613 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15615 ?auto_15613 )
      ( DELIVER-2PKG-VERIFY ?auto_15614 ?auto_15615 ?auto_15613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15620 - OBJ
      ?auto_15621 - OBJ
      ?auto_15619 - LOCATION
    )
    :vars
    (
      ?auto_15623 - TRUCK
      ?auto_15624 - LOCATION
      ?auto_15622 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15621 ?auto_15620 ) ) ( IN-TRUCK ?auto_15620 ?auto_15623 ) ( TRUCK-AT ?auto_15623 ?auto_15624 ) ( IN-CITY ?auto_15624 ?auto_15622 ) ( IN-CITY ?auto_15619 ?auto_15622 ) ( not ( = ?auto_15619 ?auto_15624 ) ) ( OBJ-AT ?auto_15621 ?auto_15619 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15621 ?auto_15620 ?auto_15619 )
      ( DELIVER-2PKG-VERIFY ?auto_15620 ?auto_15621 ?auto_15619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15804 - OBJ
      ?auto_15803 - LOCATION
    )
    :vars
    (
      ?auto_15808 - OBJ
      ?auto_15806 - TRUCK
      ?auto_15807 - LOCATION
      ?auto_15805 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15804 ?auto_15808 ) ) ( TRUCK-AT ?auto_15806 ?auto_15807 ) ( IN-CITY ?auto_15807 ?auto_15805 ) ( IN-CITY ?auto_15803 ?auto_15805 ) ( not ( = ?auto_15803 ?auto_15807 ) ) ( OBJ-AT ?auto_15808 ?auto_15803 ) ( OBJ-AT ?auto_15804 ?auto_15807 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15804 ?auto_15806 ?auto_15807 )
      ( DELIVER-2PKG ?auto_15808 ?auto_15804 ?auto_15803 )
      ( DELIVER-1PKG-VERIFY ?auto_15804 ?auto_15803 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15810 - OBJ
      ?auto_15811 - OBJ
      ?auto_15809 - LOCATION
    )
    :vars
    (
      ?auto_15813 - TRUCK
      ?auto_15812 - LOCATION
      ?auto_15814 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15811 ?auto_15810 ) ) ( TRUCK-AT ?auto_15813 ?auto_15812 ) ( IN-CITY ?auto_15812 ?auto_15814 ) ( IN-CITY ?auto_15809 ?auto_15814 ) ( not ( = ?auto_15809 ?auto_15812 ) ) ( OBJ-AT ?auto_15810 ?auto_15809 ) ( OBJ-AT ?auto_15811 ?auto_15812 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15811 ?auto_15809 )
      ( DELIVER-2PKG-VERIFY ?auto_15810 ?auto_15811 ?auto_15809 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15816 - OBJ
      ?auto_15817 - OBJ
      ?auto_15815 - LOCATION
    )
    :vars
    (
      ?auto_15820 - TRUCK
      ?auto_15818 - LOCATION
      ?auto_15819 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15817 ?auto_15816 ) ) ( TRUCK-AT ?auto_15820 ?auto_15818 ) ( IN-CITY ?auto_15818 ?auto_15819 ) ( IN-CITY ?auto_15815 ?auto_15819 ) ( not ( = ?auto_15815 ?auto_15818 ) ) ( OBJ-AT ?auto_15817 ?auto_15815 ) ( OBJ-AT ?auto_15816 ?auto_15818 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15817 ?auto_15816 ?auto_15815 )
      ( DELIVER-2PKG-VERIFY ?auto_15816 ?auto_15817 ?auto_15815 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16000 - OBJ
      ?auto_15999 - LOCATION
    )
    :vars
    (
      ?auto_16003 - OBJ
      ?auto_16001 - LOCATION
      ?auto_16002 - CITY
      ?auto_16004 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16000 ?auto_16003 ) ) ( IN-CITY ?auto_16001 ?auto_16002 ) ( IN-CITY ?auto_15999 ?auto_16002 ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( OBJ-AT ?auto_16003 ?auto_15999 ) ( OBJ-AT ?auto_16000 ?auto_16001 ) ( TRUCK-AT ?auto_16004 ?auto_15999 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16004 ?auto_15999 ?auto_16001 ?auto_16002 )
      ( DELIVER-2PKG ?auto_16003 ?auto_16000 ?auto_15999 )
      ( DELIVER-1PKG-VERIFY ?auto_16000 ?auto_15999 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16006 - OBJ
      ?auto_16007 - OBJ
      ?auto_16005 - LOCATION
    )
    :vars
    (
      ?auto_16009 - LOCATION
      ?auto_16010 - CITY
      ?auto_16008 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16007 ?auto_16006 ) ) ( IN-CITY ?auto_16009 ?auto_16010 ) ( IN-CITY ?auto_16005 ?auto_16010 ) ( not ( = ?auto_16005 ?auto_16009 ) ) ( OBJ-AT ?auto_16006 ?auto_16005 ) ( OBJ-AT ?auto_16007 ?auto_16009 ) ( TRUCK-AT ?auto_16008 ?auto_16005 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16007 ?auto_16005 )
      ( DELIVER-2PKG-VERIFY ?auto_16006 ?auto_16007 ?auto_16005 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16012 - OBJ
      ?auto_16013 - OBJ
      ?auto_16011 - LOCATION
    )
    :vars
    (
      ?auto_16014 - LOCATION
      ?auto_16016 - CITY
      ?auto_16015 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16013 ?auto_16012 ) ) ( IN-CITY ?auto_16014 ?auto_16016 ) ( IN-CITY ?auto_16011 ?auto_16016 ) ( not ( = ?auto_16011 ?auto_16014 ) ) ( OBJ-AT ?auto_16013 ?auto_16011 ) ( OBJ-AT ?auto_16012 ?auto_16014 ) ( TRUCK-AT ?auto_16015 ?auto_16011 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16013 ?auto_16012 ?auto_16011 )
      ( DELIVER-2PKG-VERIFY ?auto_16012 ?auto_16013 ?auto_16011 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16196 - OBJ
      ?auto_16195 - LOCATION
    )
    :vars
    (
      ?auto_16198 - OBJ
      ?auto_16197 - LOCATION
      ?auto_16200 - CITY
      ?auto_16199 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16196 ?auto_16198 ) ) ( IN-CITY ?auto_16197 ?auto_16200 ) ( IN-CITY ?auto_16195 ?auto_16200 ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( OBJ-AT ?auto_16196 ?auto_16197 ) ( TRUCK-AT ?auto_16199 ?auto_16195 ) ( IN-TRUCK ?auto_16198 ?auto_16199 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16198 ?auto_16195 )
      ( DELIVER-2PKG ?auto_16198 ?auto_16196 ?auto_16195 )
      ( DELIVER-1PKG-VERIFY ?auto_16196 ?auto_16195 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16202 - OBJ
      ?auto_16203 - OBJ
      ?auto_16201 - LOCATION
    )
    :vars
    (
      ?auto_16205 - LOCATION
      ?auto_16206 - CITY
      ?auto_16204 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16203 ?auto_16202 ) ) ( IN-CITY ?auto_16205 ?auto_16206 ) ( IN-CITY ?auto_16201 ?auto_16206 ) ( not ( = ?auto_16201 ?auto_16205 ) ) ( OBJ-AT ?auto_16203 ?auto_16205 ) ( TRUCK-AT ?auto_16204 ?auto_16201 ) ( IN-TRUCK ?auto_16202 ?auto_16204 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16203 ?auto_16201 )
      ( DELIVER-2PKG-VERIFY ?auto_16202 ?auto_16203 ?auto_16201 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16208 - OBJ
      ?auto_16209 - OBJ
      ?auto_16207 - LOCATION
    )
    :vars
    (
      ?auto_16211 - LOCATION
      ?auto_16210 - CITY
      ?auto_16212 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16209 ?auto_16208 ) ) ( IN-CITY ?auto_16211 ?auto_16210 ) ( IN-CITY ?auto_16207 ?auto_16210 ) ( not ( = ?auto_16207 ?auto_16211 ) ) ( OBJ-AT ?auto_16208 ?auto_16211 ) ( TRUCK-AT ?auto_16212 ?auto_16207 ) ( IN-TRUCK ?auto_16209 ?auto_16212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16209 ?auto_16208 ?auto_16207 )
      ( DELIVER-2PKG-VERIFY ?auto_16208 ?auto_16209 ?auto_16207 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16392 - OBJ
      ?auto_16391 - LOCATION
    )
    :vars
    (
      ?auto_16394 - OBJ
      ?auto_16395 - LOCATION
      ?auto_16393 - CITY
      ?auto_16396 - TRUCK
      ?auto_16397 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16392 ?auto_16394 ) ) ( IN-CITY ?auto_16395 ?auto_16393 ) ( IN-CITY ?auto_16391 ?auto_16393 ) ( not ( = ?auto_16391 ?auto_16395 ) ) ( OBJ-AT ?auto_16392 ?auto_16395 ) ( IN-TRUCK ?auto_16394 ?auto_16396 ) ( TRUCK-AT ?auto_16396 ?auto_16397 ) ( IN-CITY ?auto_16397 ?auto_16393 ) ( not ( = ?auto_16391 ?auto_16397 ) ) ( not ( = ?auto_16395 ?auto_16397 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16396 ?auto_16397 ?auto_16391 ?auto_16393 )
      ( DELIVER-2PKG ?auto_16394 ?auto_16392 ?auto_16391 )
      ( DELIVER-1PKG-VERIFY ?auto_16392 ?auto_16391 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16399 - OBJ
      ?auto_16400 - OBJ
      ?auto_16398 - LOCATION
    )
    :vars
    (
      ?auto_16403 - LOCATION
      ?auto_16402 - CITY
      ?auto_16401 - TRUCK
      ?auto_16404 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16400 ?auto_16399 ) ) ( IN-CITY ?auto_16403 ?auto_16402 ) ( IN-CITY ?auto_16398 ?auto_16402 ) ( not ( = ?auto_16398 ?auto_16403 ) ) ( OBJ-AT ?auto_16400 ?auto_16403 ) ( IN-TRUCK ?auto_16399 ?auto_16401 ) ( TRUCK-AT ?auto_16401 ?auto_16404 ) ( IN-CITY ?auto_16404 ?auto_16402 ) ( not ( = ?auto_16398 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16404 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16400 ?auto_16398 )
      ( DELIVER-2PKG-VERIFY ?auto_16399 ?auto_16400 ?auto_16398 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16406 - OBJ
      ?auto_16407 - OBJ
      ?auto_16405 - LOCATION
    )
    :vars
    (
      ?auto_16411 - LOCATION
      ?auto_16408 - CITY
      ?auto_16409 - TRUCK
      ?auto_16410 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16407 ?auto_16406 ) ) ( IN-CITY ?auto_16411 ?auto_16408 ) ( IN-CITY ?auto_16405 ?auto_16408 ) ( not ( = ?auto_16405 ?auto_16411 ) ) ( OBJ-AT ?auto_16406 ?auto_16411 ) ( IN-TRUCK ?auto_16407 ?auto_16409 ) ( TRUCK-AT ?auto_16409 ?auto_16410 ) ( IN-CITY ?auto_16410 ?auto_16408 ) ( not ( = ?auto_16405 ?auto_16410 ) ) ( not ( = ?auto_16411 ?auto_16410 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16407 ?auto_16406 ?auto_16405 )
      ( DELIVER-2PKG-VERIFY ?auto_16406 ?auto_16407 ?auto_16405 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16614 - OBJ
      ?auto_16613 - LOCATION
    )
    :vars
    (
      ?auto_16618 - OBJ
      ?auto_16619 - LOCATION
      ?auto_16615 - CITY
      ?auto_16616 - TRUCK
      ?auto_16617 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16614 ?auto_16618 ) ) ( IN-CITY ?auto_16619 ?auto_16615 ) ( IN-CITY ?auto_16613 ?auto_16615 ) ( not ( = ?auto_16613 ?auto_16619 ) ) ( OBJ-AT ?auto_16614 ?auto_16619 ) ( TRUCK-AT ?auto_16616 ?auto_16617 ) ( IN-CITY ?auto_16617 ?auto_16615 ) ( not ( = ?auto_16613 ?auto_16617 ) ) ( not ( = ?auto_16619 ?auto_16617 ) ) ( OBJ-AT ?auto_16618 ?auto_16617 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16618 ?auto_16616 ?auto_16617 )
      ( DELIVER-2PKG ?auto_16618 ?auto_16614 ?auto_16613 )
      ( DELIVER-1PKG-VERIFY ?auto_16614 ?auto_16613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16621 - OBJ
      ?auto_16622 - OBJ
      ?auto_16620 - LOCATION
    )
    :vars
    (
      ?auto_16624 - LOCATION
      ?auto_16626 - CITY
      ?auto_16623 - TRUCK
      ?auto_16625 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16622 ?auto_16621 ) ) ( IN-CITY ?auto_16624 ?auto_16626 ) ( IN-CITY ?auto_16620 ?auto_16626 ) ( not ( = ?auto_16620 ?auto_16624 ) ) ( OBJ-AT ?auto_16622 ?auto_16624 ) ( TRUCK-AT ?auto_16623 ?auto_16625 ) ( IN-CITY ?auto_16625 ?auto_16626 ) ( not ( = ?auto_16620 ?auto_16625 ) ) ( not ( = ?auto_16624 ?auto_16625 ) ) ( OBJ-AT ?auto_16621 ?auto_16625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16622 ?auto_16620 )
      ( DELIVER-2PKG-VERIFY ?auto_16621 ?auto_16622 ?auto_16620 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16628 - OBJ
      ?auto_16629 - OBJ
      ?auto_16627 - LOCATION
    )
    :vars
    (
      ?auto_16633 - LOCATION
      ?auto_16632 - CITY
      ?auto_16631 - TRUCK
      ?auto_16630 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16629 ?auto_16628 ) ) ( IN-CITY ?auto_16633 ?auto_16632 ) ( IN-CITY ?auto_16627 ?auto_16632 ) ( not ( = ?auto_16627 ?auto_16633 ) ) ( OBJ-AT ?auto_16628 ?auto_16633 ) ( TRUCK-AT ?auto_16631 ?auto_16630 ) ( IN-CITY ?auto_16630 ?auto_16632 ) ( not ( = ?auto_16627 ?auto_16630 ) ) ( not ( = ?auto_16633 ?auto_16630 ) ) ( OBJ-AT ?auto_16629 ?auto_16630 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16629 ?auto_16628 ?auto_16627 )
      ( DELIVER-2PKG-VERIFY ?auto_16628 ?auto_16629 ?auto_16627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17469 - OBJ
      ?auto_17470 - OBJ
      ?auto_17471 - OBJ
      ?auto_17468 - LOCATION
    )
    :vars
    (
      ?auto_17472 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17470 ?auto_17469 ) ) ( not ( = ?auto_17471 ?auto_17469 ) ) ( not ( = ?auto_17471 ?auto_17470 ) ) ( TRUCK-AT ?auto_17472 ?auto_17468 ) ( IN-TRUCK ?auto_17471 ?auto_17472 ) ( OBJ-AT ?auto_17469 ?auto_17468 ) ( OBJ-AT ?auto_17470 ?auto_17468 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17471 ?auto_17468 )
      ( DELIVER-3PKG-VERIFY ?auto_17469 ?auto_17470 ?auto_17471 ?auto_17468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17479 - OBJ
      ?auto_17480 - OBJ
      ?auto_17481 - OBJ
      ?auto_17478 - LOCATION
    )
    :vars
    (
      ?auto_17482 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17480 ?auto_17479 ) ) ( not ( = ?auto_17481 ?auto_17479 ) ) ( not ( = ?auto_17481 ?auto_17480 ) ) ( TRUCK-AT ?auto_17482 ?auto_17478 ) ( IN-TRUCK ?auto_17480 ?auto_17482 ) ( OBJ-AT ?auto_17479 ?auto_17478 ) ( OBJ-AT ?auto_17481 ?auto_17478 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17480 ?auto_17478 )
      ( DELIVER-3PKG-VERIFY ?auto_17479 ?auto_17480 ?auto_17481 ?auto_17478 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17517 - OBJ
      ?auto_17518 - OBJ
      ?auto_17519 - OBJ
      ?auto_17516 - LOCATION
    )
    :vars
    (
      ?auto_17520 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17518 ?auto_17517 ) ) ( not ( = ?auto_17519 ?auto_17517 ) ) ( not ( = ?auto_17519 ?auto_17518 ) ) ( TRUCK-AT ?auto_17520 ?auto_17516 ) ( IN-TRUCK ?auto_17517 ?auto_17520 ) ( OBJ-AT ?auto_17518 ?auto_17516 ) ( OBJ-AT ?auto_17519 ?auto_17516 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17517 ?auto_17516 )
      ( DELIVER-3PKG-VERIFY ?auto_17517 ?auto_17518 ?auto_17519 ?auto_17516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17983 - OBJ
      ?auto_17984 - OBJ
      ?auto_17985 - OBJ
      ?auto_17982 - LOCATION
    )
    :vars
    (
      ?auto_17987 - TRUCK
      ?auto_17986 - LOCATION
      ?auto_17988 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17984 ?auto_17983 ) ) ( not ( = ?auto_17985 ?auto_17983 ) ) ( not ( = ?auto_17985 ?auto_17984 ) ) ( IN-TRUCK ?auto_17985 ?auto_17987 ) ( TRUCK-AT ?auto_17987 ?auto_17986 ) ( IN-CITY ?auto_17986 ?auto_17988 ) ( IN-CITY ?auto_17982 ?auto_17988 ) ( not ( = ?auto_17982 ?auto_17986 ) ) ( OBJ-AT ?auto_17983 ?auto_17982 ) ( OBJ-AT ?auto_17984 ?auto_17982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17983 ?auto_17985 ?auto_17982 )
      ( DELIVER-3PKG-VERIFY ?auto_17983 ?auto_17984 ?auto_17985 ?auto_17982 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17997 - OBJ
      ?auto_17998 - OBJ
      ?auto_17999 - OBJ
      ?auto_17996 - LOCATION
    )
    :vars
    (
      ?auto_18001 - TRUCK
      ?auto_18000 - LOCATION
      ?auto_18002 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17998 ?auto_17997 ) ) ( not ( = ?auto_17999 ?auto_17997 ) ) ( not ( = ?auto_17999 ?auto_17998 ) ) ( IN-TRUCK ?auto_17998 ?auto_18001 ) ( TRUCK-AT ?auto_18001 ?auto_18000 ) ( IN-CITY ?auto_18000 ?auto_18002 ) ( IN-CITY ?auto_17996 ?auto_18002 ) ( not ( = ?auto_17996 ?auto_18000 ) ) ( OBJ-AT ?auto_17997 ?auto_17996 ) ( OBJ-AT ?auto_17999 ?auto_17996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17997 ?auto_17998 ?auto_17996 )
      ( DELIVER-3PKG-VERIFY ?auto_17997 ?auto_17998 ?auto_17999 ?auto_17996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18050 - OBJ
      ?auto_18051 - OBJ
      ?auto_18052 - OBJ
      ?auto_18049 - LOCATION
    )
    :vars
    (
      ?auto_18054 - TRUCK
      ?auto_18053 - LOCATION
      ?auto_18055 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_18051 ?auto_18050 ) ) ( not ( = ?auto_18052 ?auto_18050 ) ) ( not ( = ?auto_18052 ?auto_18051 ) ) ( IN-TRUCK ?auto_18050 ?auto_18054 ) ( TRUCK-AT ?auto_18054 ?auto_18053 ) ( IN-CITY ?auto_18053 ?auto_18055 ) ( IN-CITY ?auto_18049 ?auto_18055 ) ( not ( = ?auto_18049 ?auto_18053 ) ) ( OBJ-AT ?auto_18051 ?auto_18049 ) ( OBJ-AT ?auto_18052 ?auto_18049 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18051 ?auto_18050 ?auto_18049 )
      ( DELIVER-3PKG-VERIFY ?auto_18050 ?auto_18051 ?auto_18052 ?auto_18049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18680 - OBJ
      ?auto_18681 - OBJ
      ?auto_18682 - OBJ
      ?auto_18679 - LOCATION
    )
    :vars
    (
      ?auto_18685 - TRUCK
      ?auto_18684 - LOCATION
      ?auto_18683 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_18681 ?auto_18680 ) ) ( not ( = ?auto_18682 ?auto_18680 ) ) ( not ( = ?auto_18682 ?auto_18681 ) ) ( TRUCK-AT ?auto_18685 ?auto_18684 ) ( IN-CITY ?auto_18684 ?auto_18683 ) ( IN-CITY ?auto_18679 ?auto_18683 ) ( not ( = ?auto_18679 ?auto_18684 ) ) ( OBJ-AT ?auto_18680 ?auto_18679 ) ( OBJ-AT ?auto_18682 ?auto_18684 ) ( OBJ-AT ?auto_18681 ?auto_18679 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18680 ?auto_18682 ?auto_18679 )
      ( DELIVER-3PKG-VERIFY ?auto_18680 ?auto_18681 ?auto_18682 ?auto_18679 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18694 - OBJ
      ?auto_18695 - OBJ
      ?auto_18696 - OBJ
      ?auto_18693 - LOCATION
    )
    :vars
    (
      ?auto_18699 - TRUCK
      ?auto_18698 - LOCATION
      ?auto_18697 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_18695 ?auto_18694 ) ) ( not ( = ?auto_18696 ?auto_18694 ) ) ( not ( = ?auto_18696 ?auto_18695 ) ) ( TRUCK-AT ?auto_18699 ?auto_18698 ) ( IN-CITY ?auto_18698 ?auto_18697 ) ( IN-CITY ?auto_18693 ?auto_18697 ) ( not ( = ?auto_18693 ?auto_18698 ) ) ( OBJ-AT ?auto_18694 ?auto_18693 ) ( OBJ-AT ?auto_18695 ?auto_18698 ) ( OBJ-AT ?auto_18696 ?auto_18693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18694 ?auto_18695 ?auto_18693 )
      ( DELIVER-3PKG-VERIFY ?auto_18694 ?auto_18695 ?auto_18696 ?auto_18693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18747 - OBJ
      ?auto_18748 - OBJ
      ?auto_18749 - OBJ
      ?auto_18746 - LOCATION
    )
    :vars
    (
      ?auto_18752 - TRUCK
      ?auto_18751 - LOCATION
      ?auto_18750 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_18748 ?auto_18747 ) ) ( not ( = ?auto_18749 ?auto_18747 ) ) ( not ( = ?auto_18749 ?auto_18748 ) ) ( TRUCK-AT ?auto_18752 ?auto_18751 ) ( IN-CITY ?auto_18751 ?auto_18750 ) ( IN-CITY ?auto_18746 ?auto_18750 ) ( not ( = ?auto_18746 ?auto_18751 ) ) ( OBJ-AT ?auto_18748 ?auto_18746 ) ( OBJ-AT ?auto_18747 ?auto_18751 ) ( OBJ-AT ?auto_18749 ?auto_18746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18748 ?auto_18747 ?auto_18746 )
      ( DELIVER-3PKG-VERIFY ?auto_18747 ?auto_18748 ?auto_18749 ?auto_18746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19377 - OBJ
      ?auto_19378 - OBJ
      ?auto_19379 - OBJ
      ?auto_19376 - LOCATION
    )
    :vars
    (
      ?auto_19380 - LOCATION
      ?auto_19381 - CITY
      ?auto_19382 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19378 ?auto_19377 ) ) ( not ( = ?auto_19379 ?auto_19377 ) ) ( not ( = ?auto_19379 ?auto_19378 ) ) ( IN-CITY ?auto_19380 ?auto_19381 ) ( IN-CITY ?auto_19376 ?auto_19381 ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( OBJ-AT ?auto_19377 ?auto_19376 ) ( OBJ-AT ?auto_19379 ?auto_19380 ) ( TRUCK-AT ?auto_19382 ?auto_19376 ) ( OBJ-AT ?auto_19378 ?auto_19376 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19377 ?auto_19379 ?auto_19376 )
      ( DELIVER-3PKG-VERIFY ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19391 - OBJ
      ?auto_19392 - OBJ
      ?auto_19393 - OBJ
      ?auto_19390 - LOCATION
    )
    :vars
    (
      ?auto_19394 - LOCATION
      ?auto_19395 - CITY
      ?auto_19396 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19392 ?auto_19391 ) ) ( not ( = ?auto_19393 ?auto_19391 ) ) ( not ( = ?auto_19393 ?auto_19392 ) ) ( IN-CITY ?auto_19394 ?auto_19395 ) ( IN-CITY ?auto_19390 ?auto_19395 ) ( not ( = ?auto_19390 ?auto_19394 ) ) ( OBJ-AT ?auto_19391 ?auto_19390 ) ( OBJ-AT ?auto_19392 ?auto_19394 ) ( TRUCK-AT ?auto_19396 ?auto_19390 ) ( OBJ-AT ?auto_19393 ?auto_19390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19391 ?auto_19392 ?auto_19390 )
      ( DELIVER-3PKG-VERIFY ?auto_19391 ?auto_19392 ?auto_19393 ?auto_19390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19444 - OBJ
      ?auto_19445 - OBJ
      ?auto_19446 - OBJ
      ?auto_19443 - LOCATION
    )
    :vars
    (
      ?auto_19447 - LOCATION
      ?auto_19448 - CITY
      ?auto_19449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19445 ?auto_19444 ) ) ( not ( = ?auto_19446 ?auto_19444 ) ) ( not ( = ?auto_19446 ?auto_19445 ) ) ( IN-CITY ?auto_19447 ?auto_19448 ) ( IN-CITY ?auto_19443 ?auto_19448 ) ( not ( = ?auto_19443 ?auto_19447 ) ) ( OBJ-AT ?auto_19445 ?auto_19443 ) ( OBJ-AT ?auto_19444 ?auto_19447 ) ( TRUCK-AT ?auto_19449 ?auto_19443 ) ( OBJ-AT ?auto_19446 ?auto_19443 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19445 ?auto_19444 ?auto_19443 )
      ( DELIVER-3PKG-VERIFY ?auto_19444 ?auto_19445 ?auto_19446 ?auto_19443 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20740 - OBJ
      ?auto_20739 - LOCATION
    )
    :vars
    (
      ?auto_20742 - OBJ
      ?auto_20744 - LOCATION
      ?auto_20743 - CITY
      ?auto_20741 - TRUCK
      ?auto_20745 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_20740 ?auto_20742 ) ) ( IN-CITY ?auto_20744 ?auto_20743 ) ( IN-CITY ?auto_20739 ?auto_20743 ) ( not ( = ?auto_20739 ?auto_20744 ) ) ( OBJ-AT ?auto_20742 ?auto_20739 ) ( OBJ-AT ?auto_20740 ?auto_20744 ) ( TRUCK-AT ?auto_20741 ?auto_20745 ) ( IN-CITY ?auto_20745 ?auto_20743 ) ( not ( = ?auto_20739 ?auto_20745 ) ) ( not ( = ?auto_20744 ?auto_20745 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20741 ?auto_20745 ?auto_20739 ?auto_20743 )
      ( DELIVER-2PKG ?auto_20742 ?auto_20740 ?auto_20739 )
      ( DELIVER-1PKG-VERIFY ?auto_20740 ?auto_20739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20747 - OBJ
      ?auto_20748 - OBJ
      ?auto_20746 - LOCATION
    )
    :vars
    (
      ?auto_20749 - LOCATION
      ?auto_20750 - CITY
      ?auto_20751 - TRUCK
      ?auto_20752 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_20748 ?auto_20747 ) ) ( IN-CITY ?auto_20749 ?auto_20750 ) ( IN-CITY ?auto_20746 ?auto_20750 ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( OBJ-AT ?auto_20747 ?auto_20746 ) ( OBJ-AT ?auto_20748 ?auto_20749 ) ( TRUCK-AT ?auto_20751 ?auto_20752 ) ( IN-CITY ?auto_20752 ?auto_20750 ) ( not ( = ?auto_20746 ?auto_20752 ) ) ( not ( = ?auto_20749 ?auto_20752 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20748 ?auto_20746 )
      ( DELIVER-2PKG-VERIFY ?auto_20747 ?auto_20748 ?auto_20746 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20762 - OBJ
      ?auto_20763 - OBJ
      ?auto_20761 - LOCATION
    )
    :vars
    (
      ?auto_20764 - LOCATION
      ?auto_20767 - CITY
      ?auto_20766 - TRUCK
      ?auto_20765 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_20763 ?auto_20762 ) ) ( IN-CITY ?auto_20764 ?auto_20767 ) ( IN-CITY ?auto_20761 ?auto_20767 ) ( not ( = ?auto_20761 ?auto_20764 ) ) ( OBJ-AT ?auto_20763 ?auto_20761 ) ( OBJ-AT ?auto_20762 ?auto_20764 ) ( TRUCK-AT ?auto_20766 ?auto_20765 ) ( IN-CITY ?auto_20765 ?auto_20767 ) ( not ( = ?auto_20761 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20763 ?auto_20762 ?auto_20761 )
      ( DELIVER-2PKG-VERIFY ?auto_20762 ?auto_20763 ?auto_20761 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_23743 - OBJ
      ?auto_23742 - LOCATION
    )
    :vars
    (
      ?auto_23744 - OBJ
      ?auto_23746 - LOCATION
      ?auto_23745 - CITY
      ?auto_23747 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_23743 ?auto_23744 ) ) ( IN-CITY ?auto_23746 ?auto_23745 ) ( IN-CITY ?auto_23742 ?auto_23745 ) ( not ( = ?auto_23742 ?auto_23746 ) ) ( OBJ-AT ?auto_23743 ?auto_23746 ) ( IN-TRUCK ?auto_23744 ?auto_23747 ) ( TRUCK-AT ?auto_23747 ?auto_23746 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_23747 ?auto_23746 ?auto_23742 ?auto_23745 )
      ( DELIVER-2PKG ?auto_23744 ?auto_23743 ?auto_23742 )
      ( DELIVER-1PKG-VERIFY ?auto_23743 ?auto_23742 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23749 - OBJ
      ?auto_23750 - OBJ
      ?auto_23748 - LOCATION
    )
    :vars
    (
      ?auto_23753 - LOCATION
      ?auto_23751 - CITY
      ?auto_23752 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_23750 ?auto_23749 ) ) ( IN-CITY ?auto_23753 ?auto_23751 ) ( IN-CITY ?auto_23748 ?auto_23751 ) ( not ( = ?auto_23748 ?auto_23753 ) ) ( OBJ-AT ?auto_23750 ?auto_23753 ) ( IN-TRUCK ?auto_23749 ?auto_23752 ) ( TRUCK-AT ?auto_23752 ?auto_23753 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_23750 ?auto_23748 )
      ( DELIVER-2PKG-VERIFY ?auto_23749 ?auto_23750 ?auto_23748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23762 - OBJ
      ?auto_23763 - OBJ
      ?auto_23761 - LOCATION
    )
    :vars
    (
      ?auto_23765 - LOCATION
      ?auto_23764 - CITY
      ?auto_23766 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_23763 ?auto_23762 ) ) ( IN-CITY ?auto_23765 ?auto_23764 ) ( IN-CITY ?auto_23761 ?auto_23764 ) ( not ( = ?auto_23761 ?auto_23765 ) ) ( OBJ-AT ?auto_23762 ?auto_23765 ) ( IN-TRUCK ?auto_23763 ?auto_23766 ) ( TRUCK-AT ?auto_23766 ?auto_23765 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23763 ?auto_23762 ?auto_23761 )
      ( DELIVER-2PKG-VERIFY ?auto_23762 ?auto_23763 ?auto_23761 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_27228 - OBJ
      ?auto_27229 - OBJ
      ?auto_27230 - OBJ
      ?auto_27231 - OBJ
      ?auto_27227 - LOCATION
    )
    :vars
    (
      ?auto_27232 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27229 ?auto_27228 ) ) ( not ( = ?auto_27230 ?auto_27228 ) ) ( not ( = ?auto_27230 ?auto_27229 ) ) ( not ( = ?auto_27231 ?auto_27228 ) ) ( not ( = ?auto_27231 ?auto_27229 ) ) ( not ( = ?auto_27231 ?auto_27230 ) ) ( TRUCK-AT ?auto_27232 ?auto_27227 ) ( IN-TRUCK ?auto_27231 ?auto_27232 ) ( OBJ-AT ?auto_27228 ?auto_27227 ) ( OBJ-AT ?auto_27229 ?auto_27227 ) ( OBJ-AT ?auto_27230 ?auto_27227 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27231 ?auto_27227 )
      ( DELIVER-4PKG-VERIFY ?auto_27228 ?auto_27229 ?auto_27230 ?auto_27231 ?auto_27227 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_27246 - OBJ
      ?auto_27247 - OBJ
      ?auto_27248 - OBJ
      ?auto_27249 - OBJ
      ?auto_27245 - LOCATION
    )
    :vars
    (
      ?auto_27250 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27247 ?auto_27246 ) ) ( not ( = ?auto_27248 ?auto_27246 ) ) ( not ( = ?auto_27248 ?auto_27247 ) ) ( not ( = ?auto_27249 ?auto_27246 ) ) ( not ( = ?auto_27249 ?auto_27247 ) ) ( not ( = ?auto_27249 ?auto_27248 ) ) ( TRUCK-AT ?auto_27250 ?auto_27245 ) ( IN-TRUCK ?auto_27248 ?auto_27250 ) ( OBJ-AT ?auto_27246 ?auto_27245 ) ( OBJ-AT ?auto_27247 ?auto_27245 ) ( OBJ-AT ?auto_27249 ?auto_27245 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27248 ?auto_27245 )
      ( DELIVER-4PKG-VERIFY ?auto_27246 ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27245 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_27334 - OBJ
      ?auto_27335 - OBJ
      ?auto_27336 - OBJ
      ?auto_27337 - OBJ
      ?auto_27333 - LOCATION
    )
    :vars
    (
      ?auto_27338 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27335 ?auto_27334 ) ) ( not ( = ?auto_27336 ?auto_27334 ) ) ( not ( = ?auto_27336 ?auto_27335 ) ) ( not ( = ?auto_27337 ?auto_27334 ) ) ( not ( = ?auto_27337 ?auto_27335 ) ) ( not ( = ?auto_27337 ?auto_27336 ) ) ( TRUCK-AT ?auto_27338 ?auto_27333 ) ( IN-TRUCK ?auto_27335 ?auto_27338 ) ( OBJ-AT ?auto_27334 ?auto_27333 ) ( OBJ-AT ?auto_27336 ?auto_27333 ) ( OBJ-AT ?auto_27337 ?auto_27333 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27335 ?auto_27333 )
      ( DELIVER-4PKG-VERIFY ?auto_27334 ?auto_27335 ?auto_27336 ?auto_27337 ?auto_27333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_27861 - OBJ
      ?auto_27862 - OBJ
      ?auto_27863 - OBJ
      ?auto_27864 - OBJ
      ?auto_27860 - LOCATION
    )
    :vars
    (
      ?auto_27865 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27862 ?auto_27861 ) ) ( not ( = ?auto_27863 ?auto_27861 ) ) ( not ( = ?auto_27863 ?auto_27862 ) ) ( not ( = ?auto_27864 ?auto_27861 ) ) ( not ( = ?auto_27864 ?auto_27862 ) ) ( not ( = ?auto_27864 ?auto_27863 ) ) ( TRUCK-AT ?auto_27865 ?auto_27860 ) ( IN-TRUCK ?auto_27861 ?auto_27865 ) ( OBJ-AT ?auto_27862 ?auto_27860 ) ( OBJ-AT ?auto_27863 ?auto_27860 ) ( OBJ-AT ?auto_27864 ?auto_27860 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27861 ?auto_27860 )
      ( DELIVER-4PKG-VERIFY ?auto_27861 ?auto_27862 ?auto_27863 ?auto_27864 ?auto_27860 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_28539 - OBJ
      ?auto_28540 - OBJ
      ?auto_28541 - OBJ
      ?auto_28542 - OBJ
      ?auto_28538 - LOCATION
    )
    :vars
    (
      ?auto_28543 - TRUCK
      ?auto_28545 - LOCATION
      ?auto_28544 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_28540 ?auto_28539 ) ) ( not ( = ?auto_28541 ?auto_28539 ) ) ( not ( = ?auto_28541 ?auto_28540 ) ) ( not ( = ?auto_28542 ?auto_28539 ) ) ( not ( = ?auto_28542 ?auto_28540 ) ) ( not ( = ?auto_28542 ?auto_28541 ) ) ( IN-TRUCK ?auto_28542 ?auto_28543 ) ( TRUCK-AT ?auto_28543 ?auto_28545 ) ( IN-CITY ?auto_28545 ?auto_28544 ) ( IN-CITY ?auto_28538 ?auto_28544 ) ( not ( = ?auto_28538 ?auto_28545 ) ) ( OBJ-AT ?auto_28539 ?auto_28538 ) ( OBJ-AT ?auto_28540 ?auto_28538 ) ( OBJ-AT ?auto_28541 ?auto_28538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28539 ?auto_28542 ?auto_28538 )
      ( DELIVER-4PKG-VERIFY ?auto_28539 ?auto_28540 ?auto_28541 ?auto_28542 ?auto_28538 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_28563 - OBJ
      ?auto_28564 - OBJ
      ?auto_28565 - OBJ
      ?auto_28566 - OBJ
      ?auto_28562 - LOCATION
    )
    :vars
    (
      ?auto_28567 - TRUCK
      ?auto_28569 - LOCATION
      ?auto_28568 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_28564 ?auto_28563 ) ) ( not ( = ?auto_28565 ?auto_28563 ) ) ( not ( = ?auto_28565 ?auto_28564 ) ) ( not ( = ?auto_28566 ?auto_28563 ) ) ( not ( = ?auto_28566 ?auto_28564 ) ) ( not ( = ?auto_28566 ?auto_28565 ) ) ( IN-TRUCK ?auto_28565 ?auto_28567 ) ( TRUCK-AT ?auto_28567 ?auto_28569 ) ( IN-CITY ?auto_28569 ?auto_28568 ) ( IN-CITY ?auto_28562 ?auto_28568 ) ( not ( = ?auto_28562 ?auto_28569 ) ) ( OBJ-AT ?auto_28563 ?auto_28562 ) ( OBJ-AT ?auto_28564 ?auto_28562 ) ( OBJ-AT ?auto_28566 ?auto_28562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28563 ?auto_28565 ?auto_28562 )
      ( DELIVER-4PKG-VERIFY ?auto_28563 ?auto_28564 ?auto_28565 ?auto_28566 ?auto_28562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_28677 - OBJ
      ?auto_28678 - OBJ
      ?auto_28679 - OBJ
      ?auto_28680 - OBJ
      ?auto_28676 - LOCATION
    )
    :vars
    (
      ?auto_28681 - TRUCK
      ?auto_28683 - LOCATION
      ?auto_28682 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_28678 ?auto_28677 ) ) ( not ( = ?auto_28679 ?auto_28677 ) ) ( not ( = ?auto_28679 ?auto_28678 ) ) ( not ( = ?auto_28680 ?auto_28677 ) ) ( not ( = ?auto_28680 ?auto_28678 ) ) ( not ( = ?auto_28680 ?auto_28679 ) ) ( IN-TRUCK ?auto_28678 ?auto_28681 ) ( TRUCK-AT ?auto_28681 ?auto_28683 ) ( IN-CITY ?auto_28683 ?auto_28682 ) ( IN-CITY ?auto_28676 ?auto_28682 ) ( not ( = ?auto_28676 ?auto_28683 ) ) ( OBJ-AT ?auto_28677 ?auto_28676 ) ( OBJ-AT ?auto_28679 ?auto_28676 ) ( OBJ-AT ?auto_28680 ?auto_28676 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28677 ?auto_28678 ?auto_28676 )
      ( DELIVER-4PKG-VERIFY ?auto_28677 ?auto_28678 ?auto_28679 ?auto_28680 ?auto_28676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29396 - OBJ
      ?auto_29397 - OBJ
      ?auto_29398 - OBJ
      ?auto_29399 - OBJ
      ?auto_29395 - LOCATION
    )
    :vars
    (
      ?auto_29400 - TRUCK
      ?auto_29402 - LOCATION
      ?auto_29401 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_29397 ?auto_29396 ) ) ( not ( = ?auto_29398 ?auto_29396 ) ) ( not ( = ?auto_29398 ?auto_29397 ) ) ( not ( = ?auto_29399 ?auto_29396 ) ) ( not ( = ?auto_29399 ?auto_29397 ) ) ( not ( = ?auto_29399 ?auto_29398 ) ) ( IN-TRUCK ?auto_29396 ?auto_29400 ) ( TRUCK-AT ?auto_29400 ?auto_29402 ) ( IN-CITY ?auto_29402 ?auto_29401 ) ( IN-CITY ?auto_29395 ?auto_29401 ) ( not ( = ?auto_29395 ?auto_29402 ) ) ( OBJ-AT ?auto_29397 ?auto_29395 ) ( OBJ-AT ?auto_29398 ?auto_29395 ) ( OBJ-AT ?auto_29399 ?auto_29395 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_29397 ?auto_29396 ?auto_29395 )
      ( DELIVER-4PKG-VERIFY ?auto_29396 ?auto_29397 ?auto_29398 ?auto_29399 ?auto_29395 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30208 - OBJ
      ?auto_30209 - OBJ
      ?auto_30210 - OBJ
      ?auto_30211 - OBJ
      ?auto_30207 - LOCATION
    )
    :vars
    (
      ?auto_30214 - TRUCK
      ?auto_30212 - LOCATION
      ?auto_30213 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30209 ?auto_30208 ) ) ( not ( = ?auto_30210 ?auto_30208 ) ) ( not ( = ?auto_30210 ?auto_30209 ) ) ( not ( = ?auto_30211 ?auto_30208 ) ) ( not ( = ?auto_30211 ?auto_30209 ) ) ( not ( = ?auto_30211 ?auto_30210 ) ) ( TRUCK-AT ?auto_30214 ?auto_30212 ) ( IN-CITY ?auto_30212 ?auto_30213 ) ( IN-CITY ?auto_30207 ?auto_30213 ) ( not ( = ?auto_30207 ?auto_30212 ) ) ( OBJ-AT ?auto_30208 ?auto_30207 ) ( OBJ-AT ?auto_30211 ?auto_30212 ) ( OBJ-AT ?auto_30209 ?auto_30207 ) ( OBJ-AT ?auto_30210 ?auto_30207 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30208 ?auto_30211 ?auto_30207 )
      ( DELIVER-4PKG-VERIFY ?auto_30208 ?auto_30209 ?auto_30210 ?auto_30211 ?auto_30207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30232 - OBJ
      ?auto_30233 - OBJ
      ?auto_30234 - OBJ
      ?auto_30235 - OBJ
      ?auto_30231 - LOCATION
    )
    :vars
    (
      ?auto_30238 - TRUCK
      ?auto_30236 - LOCATION
      ?auto_30237 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30233 ?auto_30232 ) ) ( not ( = ?auto_30234 ?auto_30232 ) ) ( not ( = ?auto_30234 ?auto_30233 ) ) ( not ( = ?auto_30235 ?auto_30232 ) ) ( not ( = ?auto_30235 ?auto_30233 ) ) ( not ( = ?auto_30235 ?auto_30234 ) ) ( TRUCK-AT ?auto_30238 ?auto_30236 ) ( IN-CITY ?auto_30236 ?auto_30237 ) ( IN-CITY ?auto_30231 ?auto_30237 ) ( not ( = ?auto_30231 ?auto_30236 ) ) ( OBJ-AT ?auto_30232 ?auto_30231 ) ( OBJ-AT ?auto_30234 ?auto_30236 ) ( OBJ-AT ?auto_30233 ?auto_30231 ) ( OBJ-AT ?auto_30235 ?auto_30231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30232 ?auto_30234 ?auto_30231 )
      ( DELIVER-4PKG-VERIFY ?auto_30232 ?auto_30233 ?auto_30234 ?auto_30235 ?auto_30231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30346 - OBJ
      ?auto_30347 - OBJ
      ?auto_30348 - OBJ
      ?auto_30349 - OBJ
      ?auto_30345 - LOCATION
    )
    :vars
    (
      ?auto_30352 - TRUCK
      ?auto_30350 - LOCATION
      ?auto_30351 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30347 ?auto_30346 ) ) ( not ( = ?auto_30348 ?auto_30346 ) ) ( not ( = ?auto_30348 ?auto_30347 ) ) ( not ( = ?auto_30349 ?auto_30346 ) ) ( not ( = ?auto_30349 ?auto_30347 ) ) ( not ( = ?auto_30349 ?auto_30348 ) ) ( TRUCK-AT ?auto_30352 ?auto_30350 ) ( IN-CITY ?auto_30350 ?auto_30351 ) ( IN-CITY ?auto_30345 ?auto_30351 ) ( not ( = ?auto_30345 ?auto_30350 ) ) ( OBJ-AT ?auto_30346 ?auto_30345 ) ( OBJ-AT ?auto_30347 ?auto_30350 ) ( OBJ-AT ?auto_30348 ?auto_30345 ) ( OBJ-AT ?auto_30349 ?auto_30345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30346 ?auto_30347 ?auto_30345 )
      ( DELIVER-4PKG-VERIFY ?auto_30346 ?auto_30347 ?auto_30348 ?auto_30349 ?auto_30345 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31065 - OBJ
      ?auto_31066 - OBJ
      ?auto_31067 - OBJ
      ?auto_31068 - OBJ
      ?auto_31064 - LOCATION
    )
    :vars
    (
      ?auto_31071 - TRUCK
      ?auto_31069 - LOCATION
      ?auto_31070 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31066 ?auto_31065 ) ) ( not ( = ?auto_31067 ?auto_31065 ) ) ( not ( = ?auto_31067 ?auto_31066 ) ) ( not ( = ?auto_31068 ?auto_31065 ) ) ( not ( = ?auto_31068 ?auto_31066 ) ) ( not ( = ?auto_31068 ?auto_31067 ) ) ( TRUCK-AT ?auto_31071 ?auto_31069 ) ( IN-CITY ?auto_31069 ?auto_31070 ) ( IN-CITY ?auto_31064 ?auto_31070 ) ( not ( = ?auto_31064 ?auto_31069 ) ) ( OBJ-AT ?auto_31066 ?auto_31064 ) ( OBJ-AT ?auto_31065 ?auto_31069 ) ( OBJ-AT ?auto_31067 ?auto_31064 ) ( OBJ-AT ?auto_31068 ?auto_31064 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31066 ?auto_31065 ?auto_31064 )
      ( DELIVER-4PKG-VERIFY ?auto_31065 ?auto_31066 ?auto_31067 ?auto_31068 ?auto_31064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31877 - OBJ
      ?auto_31878 - OBJ
      ?auto_31879 - OBJ
      ?auto_31880 - OBJ
      ?auto_31876 - LOCATION
    )
    :vars
    (
      ?auto_31883 - LOCATION
      ?auto_31882 - CITY
      ?auto_31881 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_31878 ?auto_31877 ) ) ( not ( = ?auto_31879 ?auto_31877 ) ) ( not ( = ?auto_31879 ?auto_31878 ) ) ( not ( = ?auto_31880 ?auto_31877 ) ) ( not ( = ?auto_31880 ?auto_31878 ) ) ( not ( = ?auto_31880 ?auto_31879 ) ) ( IN-CITY ?auto_31883 ?auto_31882 ) ( IN-CITY ?auto_31876 ?auto_31882 ) ( not ( = ?auto_31876 ?auto_31883 ) ) ( OBJ-AT ?auto_31877 ?auto_31876 ) ( OBJ-AT ?auto_31880 ?auto_31883 ) ( TRUCK-AT ?auto_31881 ?auto_31876 ) ( OBJ-AT ?auto_31878 ?auto_31876 ) ( OBJ-AT ?auto_31879 ?auto_31876 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31877 ?auto_31880 ?auto_31876 )
      ( DELIVER-4PKG-VERIFY ?auto_31877 ?auto_31878 ?auto_31879 ?auto_31880 ?auto_31876 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31901 - OBJ
      ?auto_31902 - OBJ
      ?auto_31903 - OBJ
      ?auto_31904 - OBJ
      ?auto_31900 - LOCATION
    )
    :vars
    (
      ?auto_31907 - LOCATION
      ?auto_31906 - CITY
      ?auto_31905 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_31902 ?auto_31901 ) ) ( not ( = ?auto_31903 ?auto_31901 ) ) ( not ( = ?auto_31903 ?auto_31902 ) ) ( not ( = ?auto_31904 ?auto_31901 ) ) ( not ( = ?auto_31904 ?auto_31902 ) ) ( not ( = ?auto_31904 ?auto_31903 ) ) ( IN-CITY ?auto_31907 ?auto_31906 ) ( IN-CITY ?auto_31900 ?auto_31906 ) ( not ( = ?auto_31900 ?auto_31907 ) ) ( OBJ-AT ?auto_31901 ?auto_31900 ) ( OBJ-AT ?auto_31903 ?auto_31907 ) ( TRUCK-AT ?auto_31905 ?auto_31900 ) ( OBJ-AT ?auto_31902 ?auto_31900 ) ( OBJ-AT ?auto_31904 ?auto_31900 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31901 ?auto_31903 ?auto_31900 )
      ( DELIVER-4PKG-VERIFY ?auto_31901 ?auto_31902 ?auto_31903 ?auto_31904 ?auto_31900 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32015 - OBJ
      ?auto_32016 - OBJ
      ?auto_32017 - OBJ
      ?auto_32018 - OBJ
      ?auto_32014 - LOCATION
    )
    :vars
    (
      ?auto_32021 - LOCATION
      ?auto_32020 - CITY
      ?auto_32019 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_32016 ?auto_32015 ) ) ( not ( = ?auto_32017 ?auto_32015 ) ) ( not ( = ?auto_32017 ?auto_32016 ) ) ( not ( = ?auto_32018 ?auto_32015 ) ) ( not ( = ?auto_32018 ?auto_32016 ) ) ( not ( = ?auto_32018 ?auto_32017 ) ) ( IN-CITY ?auto_32021 ?auto_32020 ) ( IN-CITY ?auto_32014 ?auto_32020 ) ( not ( = ?auto_32014 ?auto_32021 ) ) ( OBJ-AT ?auto_32015 ?auto_32014 ) ( OBJ-AT ?auto_32016 ?auto_32021 ) ( TRUCK-AT ?auto_32019 ?auto_32014 ) ( OBJ-AT ?auto_32017 ?auto_32014 ) ( OBJ-AT ?auto_32018 ?auto_32014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32015 ?auto_32016 ?auto_32014 )
      ( DELIVER-4PKG-VERIFY ?auto_32015 ?auto_32016 ?auto_32017 ?auto_32018 ?auto_32014 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32734 - OBJ
      ?auto_32735 - OBJ
      ?auto_32736 - OBJ
      ?auto_32737 - OBJ
      ?auto_32733 - LOCATION
    )
    :vars
    (
      ?auto_32740 - LOCATION
      ?auto_32739 - CITY
      ?auto_32738 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_32735 ?auto_32734 ) ) ( not ( = ?auto_32736 ?auto_32734 ) ) ( not ( = ?auto_32736 ?auto_32735 ) ) ( not ( = ?auto_32737 ?auto_32734 ) ) ( not ( = ?auto_32737 ?auto_32735 ) ) ( not ( = ?auto_32737 ?auto_32736 ) ) ( IN-CITY ?auto_32740 ?auto_32739 ) ( IN-CITY ?auto_32733 ?auto_32739 ) ( not ( = ?auto_32733 ?auto_32740 ) ) ( OBJ-AT ?auto_32735 ?auto_32733 ) ( OBJ-AT ?auto_32734 ?auto_32740 ) ( TRUCK-AT ?auto_32738 ?auto_32733 ) ( OBJ-AT ?auto_32736 ?auto_32733 ) ( OBJ-AT ?auto_32737 ?auto_32733 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32735 ?auto_32734 ?auto_32733 )
      ( DELIVER-4PKG-VERIFY ?auto_32734 ?auto_32735 ?auto_32736 ?auto_32737 ?auto_32733 ) )
  )

)

