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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2267518 - OBJ
      ?auto_2267519 - LOCATION
    )
    :vars
    (
      ?auto_2267520 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2267520 ?auto_2267519 ) ( IN-TRUCK ?auto_2267518 ?auto_2267520 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2267518 ?auto_2267520 ?auto_2267519 )
      ( DELIVER-1PKG-VERIFY ?auto_2267518 ?auto_2267519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2267543 - OBJ
      ?auto_2267544 - LOCATION
    )
    :vars
    (
      ?auto_2267545 - TRUCK
      ?auto_2267546 - LOCATION
      ?auto_2267547 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2267543 ?auto_2267545 ) ( TRUCK-AT ?auto_2267545 ?auto_2267546 ) ( IN-CITY ?auto_2267546 ?auto_2267547 ) ( IN-CITY ?auto_2267544 ?auto_2267547 ) ( not ( = ?auto_2267544 ?auto_2267546 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2267545 ?auto_2267546 ?auto_2267544 ?auto_2267547 )
      ( DELIVER-1PKG ?auto_2267543 ?auto_2267544 )
      ( DELIVER-1PKG-VERIFY ?auto_2267543 ?auto_2267544 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2267578 - OBJ
      ?auto_2267579 - LOCATION
    )
    :vars
    (
      ?auto_2267582 - TRUCK
      ?auto_2267581 - LOCATION
      ?auto_2267580 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2267582 ?auto_2267581 ) ( IN-CITY ?auto_2267581 ?auto_2267580 ) ( IN-CITY ?auto_2267579 ?auto_2267580 ) ( not ( = ?auto_2267579 ?auto_2267581 ) ) ( OBJ-AT ?auto_2267578 ?auto_2267581 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2267578 ?auto_2267582 ?auto_2267581 )
      ( DELIVER-1PKG ?auto_2267578 ?auto_2267579 )
      ( DELIVER-1PKG-VERIFY ?auto_2267578 ?auto_2267579 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2267613 - OBJ
      ?auto_2267614 - LOCATION
    )
    :vars
    (
      ?auto_2267617 - LOCATION
      ?auto_2267615 - CITY
      ?auto_2267616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2267617 ?auto_2267615 ) ( IN-CITY ?auto_2267614 ?auto_2267615 ) ( not ( = ?auto_2267614 ?auto_2267617 ) ) ( OBJ-AT ?auto_2267613 ?auto_2267617 ) ( TRUCK-AT ?auto_2267616 ?auto_2267614 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2267616 ?auto_2267614 ?auto_2267617 ?auto_2267615 )
      ( DELIVER-1PKG ?auto_2267613 ?auto_2267614 )
      ( DELIVER-1PKG-VERIFY ?auto_2267613 ?auto_2267614 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2267951 - OBJ
      ?auto_2267953 - OBJ
      ?auto_2267952 - LOCATION
    )
    :vars
    (
      ?auto_2267954 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2267953 ?auto_2267951 ) ( TRUCK-AT ?auto_2267954 ?auto_2267952 ) ( IN-TRUCK ?auto_2267953 ?auto_2267954 ) ( OBJ-AT ?auto_2267951 ?auto_2267952 ) ( not ( = ?auto_2267951 ?auto_2267953 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2267953 ?auto_2267952 )
      ( DELIVER-2PKG-VERIFY ?auto_2267951 ?auto_2267953 ?auto_2267952 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2268310 - OBJ
      ?auto_2268312 - OBJ
      ?auto_2268311 - LOCATION
    )
    :vars
    (
      ?auto_2268313 - TRUCK
      ?auto_2268314 - LOCATION
      ?auto_2268315 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2268312 ?auto_2268310 ) ( IN-TRUCK ?auto_2268312 ?auto_2268313 ) ( TRUCK-AT ?auto_2268313 ?auto_2268314 ) ( IN-CITY ?auto_2268314 ?auto_2268315 ) ( IN-CITY ?auto_2268311 ?auto_2268315 ) ( not ( = ?auto_2268311 ?auto_2268314 ) ) ( OBJ-AT ?auto_2268310 ?auto_2268311 ) ( not ( = ?auto_2268310 ?auto_2268312 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2268312 ?auto_2268311 )
      ( DELIVER-2PKG-VERIFY ?auto_2268310 ?auto_2268312 ?auto_2268311 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2268780 - OBJ
      ?auto_2268781 - LOCATION
    )
    :vars
    (
      ?auto_2268783 - OBJ
      ?auto_2268785 - TRUCK
      ?auto_2268784 - LOCATION
      ?auto_2268782 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2268780 ?auto_2268783 ) ( TRUCK-AT ?auto_2268785 ?auto_2268784 ) ( IN-CITY ?auto_2268784 ?auto_2268782 ) ( IN-CITY ?auto_2268781 ?auto_2268782 ) ( not ( = ?auto_2268781 ?auto_2268784 ) ) ( OBJ-AT ?auto_2268783 ?auto_2268781 ) ( not ( = ?auto_2268783 ?auto_2268780 ) ) ( OBJ-AT ?auto_2268780 ?auto_2268784 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2268780 ?auto_2268785 ?auto_2268784 )
      ( DELIVER-2PKG ?auto_2268783 ?auto_2268780 ?auto_2268781 )
      ( DELIVER-1PKG-VERIFY ?auto_2268780 ?auto_2268781 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2268786 - OBJ
      ?auto_2268788 - OBJ
      ?auto_2268787 - LOCATION
    )
    :vars
    (
      ?auto_2268790 - TRUCK
      ?auto_2268789 - LOCATION
      ?auto_2268791 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2268788 ?auto_2268786 ) ( TRUCK-AT ?auto_2268790 ?auto_2268789 ) ( IN-CITY ?auto_2268789 ?auto_2268791 ) ( IN-CITY ?auto_2268787 ?auto_2268791 ) ( not ( = ?auto_2268787 ?auto_2268789 ) ) ( OBJ-AT ?auto_2268786 ?auto_2268787 ) ( not ( = ?auto_2268786 ?auto_2268788 ) ) ( OBJ-AT ?auto_2268788 ?auto_2268789 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2268788 ?auto_2268787 )
      ( DELIVER-2PKG-VERIFY ?auto_2268786 ?auto_2268788 ?auto_2268787 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2269256 - OBJ
      ?auto_2269257 - LOCATION
    )
    :vars
    (
      ?auto_2269260 - OBJ
      ?auto_2269259 - LOCATION
      ?auto_2269258 - CITY
      ?auto_2269261 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2269256 ?auto_2269260 ) ( IN-CITY ?auto_2269259 ?auto_2269258 ) ( IN-CITY ?auto_2269257 ?auto_2269258 ) ( not ( = ?auto_2269257 ?auto_2269259 ) ) ( OBJ-AT ?auto_2269260 ?auto_2269257 ) ( not ( = ?auto_2269260 ?auto_2269256 ) ) ( OBJ-AT ?auto_2269256 ?auto_2269259 ) ( TRUCK-AT ?auto_2269261 ?auto_2269257 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2269261 ?auto_2269257 ?auto_2269259 ?auto_2269258 )
      ( DELIVER-2PKG ?auto_2269260 ?auto_2269256 ?auto_2269257 )
      ( DELIVER-1PKG-VERIFY ?auto_2269256 ?auto_2269257 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2269262 - OBJ
      ?auto_2269264 - OBJ
      ?auto_2269263 - LOCATION
    )
    :vars
    (
      ?auto_2269265 - LOCATION
      ?auto_2269266 - CITY
      ?auto_2269267 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2269264 ?auto_2269262 ) ( IN-CITY ?auto_2269265 ?auto_2269266 ) ( IN-CITY ?auto_2269263 ?auto_2269266 ) ( not ( = ?auto_2269263 ?auto_2269265 ) ) ( OBJ-AT ?auto_2269262 ?auto_2269263 ) ( not ( = ?auto_2269262 ?auto_2269264 ) ) ( OBJ-AT ?auto_2269264 ?auto_2269265 ) ( TRUCK-AT ?auto_2269267 ?auto_2269263 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2269264 ?auto_2269263 )
      ( DELIVER-2PKG-VERIFY ?auto_2269262 ?auto_2269264 ?auto_2269263 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2269732 - OBJ
      ?auto_2269733 - LOCATION
    )
    :vars
    (
      ?auto_2269737 - OBJ
      ?auto_2269734 - LOCATION
      ?auto_2269736 - CITY
      ?auto_2269735 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2269732 ?auto_2269737 ) ( IN-CITY ?auto_2269734 ?auto_2269736 ) ( IN-CITY ?auto_2269733 ?auto_2269736 ) ( not ( = ?auto_2269733 ?auto_2269734 ) ) ( not ( = ?auto_2269737 ?auto_2269732 ) ) ( OBJ-AT ?auto_2269732 ?auto_2269734 ) ( TRUCK-AT ?auto_2269735 ?auto_2269733 ) ( IN-TRUCK ?auto_2269737 ?auto_2269735 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2269737 ?auto_2269733 )
      ( DELIVER-2PKG ?auto_2269737 ?auto_2269732 ?auto_2269733 )
      ( DELIVER-1PKG-VERIFY ?auto_2269732 ?auto_2269733 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2269738 - OBJ
      ?auto_2269740 - OBJ
      ?auto_2269739 - LOCATION
    )
    :vars
    (
      ?auto_2269743 - LOCATION
      ?auto_2269741 - CITY
      ?auto_2269742 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2269740 ?auto_2269738 ) ( IN-CITY ?auto_2269743 ?auto_2269741 ) ( IN-CITY ?auto_2269739 ?auto_2269741 ) ( not ( = ?auto_2269739 ?auto_2269743 ) ) ( not ( = ?auto_2269738 ?auto_2269740 ) ) ( OBJ-AT ?auto_2269740 ?auto_2269743 ) ( TRUCK-AT ?auto_2269742 ?auto_2269739 ) ( IN-TRUCK ?auto_2269738 ?auto_2269742 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2269740 ?auto_2269739 )
      ( DELIVER-2PKG-VERIFY ?auto_2269738 ?auto_2269740 ?auto_2269739 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2270208 - OBJ
      ?auto_2270209 - LOCATION
    )
    :vars
    (
      ?auto_2270213 - OBJ
      ?auto_2270212 - LOCATION
      ?auto_2270211 - CITY
      ?auto_2270210 - TRUCK
      ?auto_2270214 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2270208 ?auto_2270213 ) ( IN-CITY ?auto_2270212 ?auto_2270211 ) ( IN-CITY ?auto_2270209 ?auto_2270211 ) ( not ( = ?auto_2270209 ?auto_2270212 ) ) ( not ( = ?auto_2270213 ?auto_2270208 ) ) ( OBJ-AT ?auto_2270208 ?auto_2270212 ) ( IN-TRUCK ?auto_2270213 ?auto_2270210 ) ( TRUCK-AT ?auto_2270210 ?auto_2270214 ) ( IN-CITY ?auto_2270214 ?auto_2270211 ) ( not ( = ?auto_2270209 ?auto_2270214 ) ) ( not ( = ?auto_2270212 ?auto_2270214 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2270210 ?auto_2270214 ?auto_2270209 ?auto_2270211 )
      ( DELIVER-2PKG ?auto_2270213 ?auto_2270208 ?auto_2270209 )
      ( DELIVER-1PKG-VERIFY ?auto_2270208 ?auto_2270209 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2270215 - OBJ
      ?auto_2270217 - OBJ
      ?auto_2270216 - LOCATION
    )
    :vars
    (
      ?auto_2270221 - LOCATION
      ?auto_2270219 - CITY
      ?auto_2270218 - TRUCK
      ?auto_2270220 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2270217 ?auto_2270215 ) ( IN-CITY ?auto_2270221 ?auto_2270219 ) ( IN-CITY ?auto_2270216 ?auto_2270219 ) ( not ( = ?auto_2270216 ?auto_2270221 ) ) ( not ( = ?auto_2270215 ?auto_2270217 ) ) ( OBJ-AT ?auto_2270217 ?auto_2270221 ) ( IN-TRUCK ?auto_2270215 ?auto_2270218 ) ( TRUCK-AT ?auto_2270218 ?auto_2270220 ) ( IN-CITY ?auto_2270220 ?auto_2270219 ) ( not ( = ?auto_2270216 ?auto_2270220 ) ) ( not ( = ?auto_2270221 ?auto_2270220 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2270217 ?auto_2270216 )
      ( DELIVER-2PKG-VERIFY ?auto_2270215 ?auto_2270217 ?auto_2270216 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2270741 - OBJ
      ?auto_2270742 - LOCATION
    )
    :vars
    (
      ?auto_2270743 - OBJ
      ?auto_2270747 - LOCATION
      ?auto_2270745 - CITY
      ?auto_2270746 - TRUCK
      ?auto_2270744 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2270741 ?auto_2270743 ) ( IN-CITY ?auto_2270747 ?auto_2270745 ) ( IN-CITY ?auto_2270742 ?auto_2270745 ) ( not ( = ?auto_2270742 ?auto_2270747 ) ) ( not ( = ?auto_2270743 ?auto_2270741 ) ) ( OBJ-AT ?auto_2270741 ?auto_2270747 ) ( TRUCK-AT ?auto_2270746 ?auto_2270744 ) ( IN-CITY ?auto_2270744 ?auto_2270745 ) ( not ( = ?auto_2270742 ?auto_2270744 ) ) ( not ( = ?auto_2270747 ?auto_2270744 ) ) ( OBJ-AT ?auto_2270743 ?auto_2270744 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2270743 ?auto_2270746 ?auto_2270744 )
      ( DELIVER-2PKG ?auto_2270743 ?auto_2270741 ?auto_2270742 )
      ( DELIVER-1PKG-VERIFY ?auto_2270741 ?auto_2270742 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2270748 - OBJ
      ?auto_2270750 - OBJ
      ?auto_2270749 - LOCATION
    )
    :vars
    (
      ?auto_2270752 - LOCATION
      ?auto_2270751 - CITY
      ?auto_2270754 - TRUCK
      ?auto_2270753 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2270750 ?auto_2270748 ) ( IN-CITY ?auto_2270752 ?auto_2270751 ) ( IN-CITY ?auto_2270749 ?auto_2270751 ) ( not ( = ?auto_2270749 ?auto_2270752 ) ) ( not ( = ?auto_2270748 ?auto_2270750 ) ) ( OBJ-AT ?auto_2270750 ?auto_2270752 ) ( TRUCK-AT ?auto_2270754 ?auto_2270753 ) ( IN-CITY ?auto_2270753 ?auto_2270751 ) ( not ( = ?auto_2270749 ?auto_2270753 ) ) ( not ( = ?auto_2270752 ?auto_2270753 ) ) ( OBJ-AT ?auto_2270748 ?auto_2270753 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2270750 ?auto_2270749 )
      ( DELIVER-2PKG-VERIFY ?auto_2270748 ?auto_2270750 ?auto_2270749 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2273453 - OBJ
      ?auto_2273455 - OBJ
      ?auto_2273456 - OBJ
      ?auto_2273454 - LOCATION
    )
    :vars
    (
      ?auto_2273457 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2273455 ?auto_2273453 ) ( GREATER-THAN ?auto_2273456 ?auto_2273453 ) ( GREATER-THAN ?auto_2273456 ?auto_2273455 ) ( TRUCK-AT ?auto_2273457 ?auto_2273454 ) ( IN-TRUCK ?auto_2273456 ?auto_2273457 ) ( OBJ-AT ?auto_2273453 ?auto_2273454 ) ( OBJ-AT ?auto_2273455 ?auto_2273454 ) ( not ( = ?auto_2273453 ?auto_2273455 ) ) ( not ( = ?auto_2273453 ?auto_2273456 ) ) ( not ( = ?auto_2273455 ?auto_2273456 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2273456 ?auto_2273454 )
      ( DELIVER-3PKG-VERIFY ?auto_2273453 ?auto_2273455 ?auto_2273456 ?auto_2273454 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2275451 - OBJ
      ?auto_2275453 - OBJ
      ?auto_2275454 - OBJ
      ?auto_2275452 - LOCATION
    )
    :vars
    (
      ?auto_2275455 - TRUCK
      ?auto_2275456 - LOCATION
      ?auto_2275457 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2275453 ?auto_2275451 ) ( GREATER-THAN ?auto_2275454 ?auto_2275451 ) ( GREATER-THAN ?auto_2275454 ?auto_2275453 ) ( IN-TRUCK ?auto_2275454 ?auto_2275455 ) ( TRUCK-AT ?auto_2275455 ?auto_2275456 ) ( IN-CITY ?auto_2275456 ?auto_2275457 ) ( IN-CITY ?auto_2275452 ?auto_2275457 ) ( not ( = ?auto_2275452 ?auto_2275456 ) ) ( OBJ-AT ?auto_2275451 ?auto_2275452 ) ( not ( = ?auto_2275451 ?auto_2275454 ) ) ( OBJ-AT ?auto_2275453 ?auto_2275452 ) ( not ( = ?auto_2275451 ?auto_2275453 ) ) ( not ( = ?auto_2275453 ?auto_2275454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2275451 ?auto_2275454 ?auto_2275452 )
      ( DELIVER-3PKG-VERIFY ?auto_2275451 ?auto_2275453 ?auto_2275454 ?auto_2275452 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2278091 - OBJ
      ?auto_2278093 - OBJ
      ?auto_2278094 - OBJ
      ?auto_2278092 - LOCATION
    )
    :vars
    (
      ?auto_2278097 - TRUCK
      ?auto_2278095 - LOCATION
      ?auto_2278096 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2278093 ?auto_2278091 ) ( GREATER-THAN ?auto_2278094 ?auto_2278091 ) ( GREATER-THAN ?auto_2278094 ?auto_2278093 ) ( TRUCK-AT ?auto_2278097 ?auto_2278095 ) ( IN-CITY ?auto_2278095 ?auto_2278096 ) ( IN-CITY ?auto_2278092 ?auto_2278096 ) ( not ( = ?auto_2278092 ?auto_2278095 ) ) ( OBJ-AT ?auto_2278091 ?auto_2278092 ) ( not ( = ?auto_2278091 ?auto_2278094 ) ) ( OBJ-AT ?auto_2278094 ?auto_2278095 ) ( OBJ-AT ?auto_2278093 ?auto_2278092 ) ( not ( = ?auto_2278091 ?auto_2278093 ) ) ( not ( = ?auto_2278093 ?auto_2278094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2278091 ?auto_2278094 ?auto_2278092 )
      ( DELIVER-3PKG-VERIFY ?auto_2278091 ?auto_2278093 ?auto_2278094 ?auto_2278092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2280731 - OBJ
      ?auto_2280733 - OBJ
      ?auto_2280734 - OBJ
      ?auto_2280732 - LOCATION
    )
    :vars
    (
      ?auto_2280736 - LOCATION
      ?auto_2280735 - CITY
      ?auto_2280737 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2280733 ?auto_2280731 ) ( GREATER-THAN ?auto_2280734 ?auto_2280731 ) ( GREATER-THAN ?auto_2280734 ?auto_2280733 ) ( IN-CITY ?auto_2280736 ?auto_2280735 ) ( IN-CITY ?auto_2280732 ?auto_2280735 ) ( not ( = ?auto_2280732 ?auto_2280736 ) ) ( OBJ-AT ?auto_2280731 ?auto_2280732 ) ( not ( = ?auto_2280731 ?auto_2280734 ) ) ( OBJ-AT ?auto_2280734 ?auto_2280736 ) ( TRUCK-AT ?auto_2280737 ?auto_2280732 ) ( OBJ-AT ?auto_2280733 ?auto_2280732 ) ( not ( = ?auto_2280731 ?auto_2280733 ) ) ( not ( = ?auto_2280733 ?auto_2280734 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2280731 ?auto_2280734 ?auto_2280732 )
      ( DELIVER-3PKG-VERIFY ?auto_2280731 ?auto_2280733 ?auto_2280734 ?auto_2280732 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2285966 - OBJ
      ?auto_2285967 - LOCATION
    )
    :vars
    (
      ?auto_2285969 - OBJ
      ?auto_2285971 - LOCATION
      ?auto_2285970 - CITY
      ?auto_2285968 - TRUCK
      ?auto_2285972 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2285966 ?auto_2285969 ) ( IN-CITY ?auto_2285971 ?auto_2285970 ) ( IN-CITY ?auto_2285967 ?auto_2285970 ) ( not ( = ?auto_2285967 ?auto_2285971 ) ) ( OBJ-AT ?auto_2285969 ?auto_2285967 ) ( not ( = ?auto_2285969 ?auto_2285966 ) ) ( OBJ-AT ?auto_2285966 ?auto_2285971 ) ( TRUCK-AT ?auto_2285968 ?auto_2285972 ) ( IN-CITY ?auto_2285972 ?auto_2285970 ) ( not ( = ?auto_2285967 ?auto_2285972 ) ) ( not ( = ?auto_2285971 ?auto_2285972 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2285968 ?auto_2285972 ?auto_2285967 ?auto_2285970 )
      ( DELIVER-2PKG ?auto_2285969 ?auto_2285966 ?auto_2285967 )
      ( DELIVER-1PKG-VERIFY ?auto_2285966 ?auto_2285967 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2285973 - OBJ
      ?auto_2285975 - OBJ
      ?auto_2285974 - LOCATION
    )
    :vars
    (
      ?auto_2285979 - LOCATION
      ?auto_2285976 - CITY
      ?auto_2285978 - TRUCK
      ?auto_2285977 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2285975 ?auto_2285973 ) ( IN-CITY ?auto_2285979 ?auto_2285976 ) ( IN-CITY ?auto_2285974 ?auto_2285976 ) ( not ( = ?auto_2285974 ?auto_2285979 ) ) ( OBJ-AT ?auto_2285973 ?auto_2285974 ) ( not ( = ?auto_2285973 ?auto_2285975 ) ) ( OBJ-AT ?auto_2285975 ?auto_2285979 ) ( TRUCK-AT ?auto_2285978 ?auto_2285977 ) ( IN-CITY ?auto_2285977 ?auto_2285976 ) ( not ( = ?auto_2285974 ?auto_2285977 ) ) ( not ( = ?auto_2285979 ?auto_2285977 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2285975 ?auto_2285974 )
      ( DELIVER-2PKG-VERIFY ?auto_2285973 ?auto_2285975 ?auto_2285974 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2297121 - OBJ
      ?auto_2297122 - LOCATION
    )
    :vars
    (
      ?auto_2297126 - OBJ
      ?auto_2297123 - LOCATION
      ?auto_2297125 - CITY
      ?auto_2297124 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2297121 ?auto_2297126 ) ( IN-CITY ?auto_2297123 ?auto_2297125 ) ( IN-CITY ?auto_2297122 ?auto_2297125 ) ( not ( = ?auto_2297122 ?auto_2297123 ) ) ( not ( = ?auto_2297126 ?auto_2297121 ) ) ( OBJ-AT ?auto_2297121 ?auto_2297123 ) ( IN-TRUCK ?auto_2297126 ?auto_2297124 ) ( TRUCK-AT ?auto_2297124 ?auto_2297123 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2297124 ?auto_2297123 ?auto_2297122 ?auto_2297125 )
      ( DELIVER-2PKG ?auto_2297126 ?auto_2297121 ?auto_2297122 )
      ( DELIVER-1PKG-VERIFY ?auto_2297121 ?auto_2297122 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2297127 - OBJ
      ?auto_2297129 - OBJ
      ?auto_2297128 - LOCATION
    )
    :vars
    (
      ?auto_2297130 - LOCATION
      ?auto_2297131 - CITY
      ?auto_2297132 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2297129 ?auto_2297127 ) ( IN-CITY ?auto_2297130 ?auto_2297131 ) ( IN-CITY ?auto_2297128 ?auto_2297131 ) ( not ( = ?auto_2297128 ?auto_2297130 ) ) ( not ( = ?auto_2297127 ?auto_2297129 ) ) ( OBJ-AT ?auto_2297129 ?auto_2297130 ) ( IN-TRUCK ?auto_2297127 ?auto_2297132 ) ( TRUCK-AT ?auto_2297132 ?auto_2297130 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2297129 ?auto_2297128 )
      ( DELIVER-2PKG-VERIFY ?auto_2297127 ?auto_2297129 ?auto_2297128 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2310931 - OBJ
      ?auto_2310933 - OBJ
      ?auto_2310934 - OBJ
      ?auto_2310935 - OBJ
      ?auto_2310932 - LOCATION
    )
    :vars
    (
      ?auto_2310936 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2310933 ?auto_2310931 ) ( GREATER-THAN ?auto_2310934 ?auto_2310931 ) ( GREATER-THAN ?auto_2310934 ?auto_2310933 ) ( GREATER-THAN ?auto_2310935 ?auto_2310931 ) ( GREATER-THAN ?auto_2310935 ?auto_2310933 ) ( GREATER-THAN ?auto_2310935 ?auto_2310934 ) ( TRUCK-AT ?auto_2310936 ?auto_2310932 ) ( IN-TRUCK ?auto_2310935 ?auto_2310936 ) ( OBJ-AT ?auto_2310931 ?auto_2310932 ) ( OBJ-AT ?auto_2310933 ?auto_2310932 ) ( OBJ-AT ?auto_2310934 ?auto_2310932 ) ( not ( = ?auto_2310931 ?auto_2310933 ) ) ( not ( = ?auto_2310931 ?auto_2310934 ) ) ( not ( = ?auto_2310931 ?auto_2310935 ) ) ( not ( = ?auto_2310933 ?auto_2310934 ) ) ( not ( = ?auto_2310933 ?auto_2310935 ) ) ( not ( = ?auto_2310934 ?auto_2310935 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2310935 ?auto_2310932 )
      ( DELIVER-4PKG-VERIFY ?auto_2310931 ?auto_2310933 ?auto_2310934 ?auto_2310935 ?auto_2310932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2317781 - OBJ
      ?auto_2317783 - OBJ
      ?auto_2317784 - OBJ
      ?auto_2317785 - OBJ
      ?auto_2317782 - LOCATION
    )
    :vars
    (
      ?auto_2317787 - TRUCK
      ?auto_2317788 - LOCATION
      ?auto_2317786 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2317783 ?auto_2317781 ) ( GREATER-THAN ?auto_2317784 ?auto_2317781 ) ( GREATER-THAN ?auto_2317784 ?auto_2317783 ) ( GREATER-THAN ?auto_2317785 ?auto_2317781 ) ( GREATER-THAN ?auto_2317785 ?auto_2317783 ) ( GREATER-THAN ?auto_2317785 ?auto_2317784 ) ( IN-TRUCK ?auto_2317785 ?auto_2317787 ) ( TRUCK-AT ?auto_2317787 ?auto_2317788 ) ( IN-CITY ?auto_2317788 ?auto_2317786 ) ( IN-CITY ?auto_2317782 ?auto_2317786 ) ( not ( = ?auto_2317782 ?auto_2317788 ) ) ( OBJ-AT ?auto_2317781 ?auto_2317782 ) ( not ( = ?auto_2317781 ?auto_2317785 ) ) ( OBJ-AT ?auto_2317783 ?auto_2317782 ) ( OBJ-AT ?auto_2317784 ?auto_2317782 ) ( not ( = ?auto_2317781 ?auto_2317783 ) ) ( not ( = ?auto_2317781 ?auto_2317784 ) ) ( not ( = ?auto_2317783 ?auto_2317784 ) ) ( not ( = ?auto_2317783 ?auto_2317785 ) ) ( not ( = ?auto_2317784 ?auto_2317785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2317781 ?auto_2317785 ?auto_2317782 )
      ( DELIVER-4PKG-VERIFY ?auto_2317781 ?auto_2317783 ?auto_2317784 ?auto_2317785 ?auto_2317782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2326802 - OBJ
      ?auto_2326804 - OBJ
      ?auto_2326805 - OBJ
      ?auto_2326806 - OBJ
      ?auto_2326803 - LOCATION
    )
    :vars
    (
      ?auto_2326807 - TRUCK
      ?auto_2326809 - LOCATION
      ?auto_2326808 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2326804 ?auto_2326802 ) ( GREATER-THAN ?auto_2326805 ?auto_2326802 ) ( GREATER-THAN ?auto_2326805 ?auto_2326804 ) ( GREATER-THAN ?auto_2326806 ?auto_2326802 ) ( GREATER-THAN ?auto_2326806 ?auto_2326804 ) ( GREATER-THAN ?auto_2326806 ?auto_2326805 ) ( TRUCK-AT ?auto_2326807 ?auto_2326809 ) ( IN-CITY ?auto_2326809 ?auto_2326808 ) ( IN-CITY ?auto_2326803 ?auto_2326808 ) ( not ( = ?auto_2326803 ?auto_2326809 ) ) ( OBJ-AT ?auto_2326802 ?auto_2326803 ) ( not ( = ?auto_2326802 ?auto_2326806 ) ) ( OBJ-AT ?auto_2326806 ?auto_2326809 ) ( OBJ-AT ?auto_2326804 ?auto_2326803 ) ( OBJ-AT ?auto_2326805 ?auto_2326803 ) ( not ( = ?auto_2326802 ?auto_2326804 ) ) ( not ( = ?auto_2326802 ?auto_2326805 ) ) ( not ( = ?auto_2326804 ?auto_2326805 ) ) ( not ( = ?auto_2326804 ?auto_2326806 ) ) ( not ( = ?auto_2326805 ?auto_2326806 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2326802 ?auto_2326806 ?auto_2326803 )
      ( DELIVER-4PKG-VERIFY ?auto_2326802 ?auto_2326804 ?auto_2326805 ?auto_2326806 ?auto_2326803 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2335823 - OBJ
      ?auto_2335825 - OBJ
      ?auto_2335826 - OBJ
      ?auto_2335827 - OBJ
      ?auto_2335824 - LOCATION
    )
    :vars
    (
      ?auto_2335830 - LOCATION
      ?auto_2335829 - CITY
      ?auto_2335828 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2335825 ?auto_2335823 ) ( GREATER-THAN ?auto_2335826 ?auto_2335823 ) ( GREATER-THAN ?auto_2335826 ?auto_2335825 ) ( GREATER-THAN ?auto_2335827 ?auto_2335823 ) ( GREATER-THAN ?auto_2335827 ?auto_2335825 ) ( GREATER-THAN ?auto_2335827 ?auto_2335826 ) ( IN-CITY ?auto_2335830 ?auto_2335829 ) ( IN-CITY ?auto_2335824 ?auto_2335829 ) ( not ( = ?auto_2335824 ?auto_2335830 ) ) ( OBJ-AT ?auto_2335823 ?auto_2335824 ) ( not ( = ?auto_2335823 ?auto_2335827 ) ) ( OBJ-AT ?auto_2335827 ?auto_2335830 ) ( TRUCK-AT ?auto_2335828 ?auto_2335824 ) ( OBJ-AT ?auto_2335825 ?auto_2335824 ) ( OBJ-AT ?auto_2335826 ?auto_2335824 ) ( not ( = ?auto_2335823 ?auto_2335825 ) ) ( not ( = ?auto_2335823 ?auto_2335826 ) ) ( not ( = ?auto_2335825 ?auto_2335826 ) ) ( not ( = ?auto_2335825 ?auto_2335827 ) ) ( not ( = ?auto_2335826 ?auto_2335827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2335823 ?auto_2335827 ?auto_2335824 )
      ( DELIVER-4PKG-VERIFY ?auto_2335823 ?auto_2335825 ?auto_2335826 ?auto_2335827 ?auto_2335824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2353542 - OBJ
      ?auto_2353544 - OBJ
      ?auto_2353545 - OBJ
      ?auto_2353543 - LOCATION
    )
    :vars
    (
      ?auto_2353548 - LOCATION
      ?auto_2353546 - CITY
      ?auto_2353549 - TRUCK
      ?auto_2353547 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2353544 ?auto_2353542 ) ( GREATER-THAN ?auto_2353545 ?auto_2353542 ) ( GREATER-THAN ?auto_2353545 ?auto_2353544 ) ( IN-CITY ?auto_2353548 ?auto_2353546 ) ( IN-CITY ?auto_2353543 ?auto_2353546 ) ( not ( = ?auto_2353543 ?auto_2353548 ) ) ( OBJ-AT ?auto_2353542 ?auto_2353543 ) ( not ( = ?auto_2353542 ?auto_2353545 ) ) ( OBJ-AT ?auto_2353545 ?auto_2353548 ) ( TRUCK-AT ?auto_2353549 ?auto_2353547 ) ( IN-CITY ?auto_2353547 ?auto_2353546 ) ( not ( = ?auto_2353543 ?auto_2353547 ) ) ( not ( = ?auto_2353548 ?auto_2353547 ) ) ( OBJ-AT ?auto_2353544 ?auto_2353543 ) ( not ( = ?auto_2353542 ?auto_2353544 ) ) ( not ( = ?auto_2353544 ?auto_2353545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2353542 ?auto_2353545 ?auto_2353543 )
      ( DELIVER-3PKG-VERIFY ?auto_2353542 ?auto_2353544 ?auto_2353545 ?auto_2353543 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2474324 - OBJ
      ?auto_2474326 - OBJ
      ?auto_2474327 - OBJ
      ?auto_2474328 - OBJ
      ?auto_2474329 - OBJ
      ?auto_2474325 - LOCATION
    )
    :vars
    (
      ?auto_2474330 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2474326 ?auto_2474324 ) ( GREATER-THAN ?auto_2474327 ?auto_2474324 ) ( GREATER-THAN ?auto_2474327 ?auto_2474326 ) ( GREATER-THAN ?auto_2474328 ?auto_2474324 ) ( GREATER-THAN ?auto_2474328 ?auto_2474326 ) ( GREATER-THAN ?auto_2474328 ?auto_2474327 ) ( GREATER-THAN ?auto_2474329 ?auto_2474324 ) ( GREATER-THAN ?auto_2474329 ?auto_2474326 ) ( GREATER-THAN ?auto_2474329 ?auto_2474327 ) ( GREATER-THAN ?auto_2474329 ?auto_2474328 ) ( TRUCK-AT ?auto_2474330 ?auto_2474325 ) ( IN-TRUCK ?auto_2474329 ?auto_2474330 ) ( OBJ-AT ?auto_2474324 ?auto_2474325 ) ( OBJ-AT ?auto_2474326 ?auto_2474325 ) ( OBJ-AT ?auto_2474327 ?auto_2474325 ) ( OBJ-AT ?auto_2474328 ?auto_2474325 ) ( not ( = ?auto_2474324 ?auto_2474326 ) ) ( not ( = ?auto_2474324 ?auto_2474327 ) ) ( not ( = ?auto_2474324 ?auto_2474328 ) ) ( not ( = ?auto_2474324 ?auto_2474329 ) ) ( not ( = ?auto_2474326 ?auto_2474327 ) ) ( not ( = ?auto_2474326 ?auto_2474328 ) ) ( not ( = ?auto_2474326 ?auto_2474329 ) ) ( not ( = ?auto_2474327 ?auto_2474328 ) ) ( not ( = ?auto_2474327 ?auto_2474329 ) ) ( not ( = ?auto_2474328 ?auto_2474329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2474329 ?auto_2474325 )
      ( DELIVER-5PKG-VERIFY ?auto_2474324 ?auto_2474326 ?auto_2474327 ?auto_2474328 ?auto_2474329 ?auto_2474325 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2492812 - OBJ
      ?auto_2492814 - OBJ
      ?auto_2492815 - OBJ
      ?auto_2492816 - OBJ
      ?auto_2492817 - OBJ
      ?auto_2492813 - LOCATION
    )
    :vars
    (
      ?auto_2492818 - TRUCK
      ?auto_2492819 - LOCATION
      ?auto_2492820 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2492814 ?auto_2492812 ) ( GREATER-THAN ?auto_2492815 ?auto_2492812 ) ( GREATER-THAN ?auto_2492815 ?auto_2492814 ) ( GREATER-THAN ?auto_2492816 ?auto_2492812 ) ( GREATER-THAN ?auto_2492816 ?auto_2492814 ) ( GREATER-THAN ?auto_2492816 ?auto_2492815 ) ( GREATER-THAN ?auto_2492817 ?auto_2492812 ) ( GREATER-THAN ?auto_2492817 ?auto_2492814 ) ( GREATER-THAN ?auto_2492817 ?auto_2492815 ) ( GREATER-THAN ?auto_2492817 ?auto_2492816 ) ( IN-TRUCK ?auto_2492817 ?auto_2492818 ) ( TRUCK-AT ?auto_2492818 ?auto_2492819 ) ( IN-CITY ?auto_2492819 ?auto_2492820 ) ( IN-CITY ?auto_2492813 ?auto_2492820 ) ( not ( = ?auto_2492813 ?auto_2492819 ) ) ( OBJ-AT ?auto_2492812 ?auto_2492813 ) ( not ( = ?auto_2492812 ?auto_2492817 ) ) ( OBJ-AT ?auto_2492814 ?auto_2492813 ) ( OBJ-AT ?auto_2492815 ?auto_2492813 ) ( OBJ-AT ?auto_2492816 ?auto_2492813 ) ( not ( = ?auto_2492812 ?auto_2492814 ) ) ( not ( = ?auto_2492812 ?auto_2492815 ) ) ( not ( = ?auto_2492812 ?auto_2492816 ) ) ( not ( = ?auto_2492814 ?auto_2492815 ) ) ( not ( = ?auto_2492814 ?auto_2492816 ) ) ( not ( = ?auto_2492814 ?auto_2492817 ) ) ( not ( = ?auto_2492815 ?auto_2492816 ) ) ( not ( = ?auto_2492815 ?auto_2492817 ) ) ( not ( = ?auto_2492816 ?auto_2492817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2492812 ?auto_2492817 ?auto_2492813 )
      ( DELIVER-5PKG-VERIFY ?auto_2492812 ?auto_2492814 ?auto_2492815 ?auto_2492816 ?auto_2492817 ?auto_2492813 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2516120 - OBJ
      ?auto_2516122 - OBJ
      ?auto_2516123 - OBJ
      ?auto_2516124 - OBJ
      ?auto_2516125 - OBJ
      ?auto_2516121 - LOCATION
    )
    :vars
    (
      ?auto_2516128 - TRUCK
      ?auto_2516127 - LOCATION
      ?auto_2516126 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2516122 ?auto_2516120 ) ( GREATER-THAN ?auto_2516123 ?auto_2516120 ) ( GREATER-THAN ?auto_2516123 ?auto_2516122 ) ( GREATER-THAN ?auto_2516124 ?auto_2516120 ) ( GREATER-THAN ?auto_2516124 ?auto_2516122 ) ( GREATER-THAN ?auto_2516124 ?auto_2516123 ) ( GREATER-THAN ?auto_2516125 ?auto_2516120 ) ( GREATER-THAN ?auto_2516125 ?auto_2516122 ) ( GREATER-THAN ?auto_2516125 ?auto_2516123 ) ( GREATER-THAN ?auto_2516125 ?auto_2516124 ) ( TRUCK-AT ?auto_2516128 ?auto_2516127 ) ( IN-CITY ?auto_2516127 ?auto_2516126 ) ( IN-CITY ?auto_2516121 ?auto_2516126 ) ( not ( = ?auto_2516121 ?auto_2516127 ) ) ( OBJ-AT ?auto_2516120 ?auto_2516121 ) ( not ( = ?auto_2516120 ?auto_2516125 ) ) ( OBJ-AT ?auto_2516125 ?auto_2516127 ) ( OBJ-AT ?auto_2516122 ?auto_2516121 ) ( OBJ-AT ?auto_2516123 ?auto_2516121 ) ( OBJ-AT ?auto_2516124 ?auto_2516121 ) ( not ( = ?auto_2516120 ?auto_2516122 ) ) ( not ( = ?auto_2516120 ?auto_2516123 ) ) ( not ( = ?auto_2516120 ?auto_2516124 ) ) ( not ( = ?auto_2516122 ?auto_2516123 ) ) ( not ( = ?auto_2516122 ?auto_2516124 ) ) ( not ( = ?auto_2516122 ?auto_2516125 ) ) ( not ( = ?auto_2516123 ?auto_2516124 ) ) ( not ( = ?auto_2516123 ?auto_2516125 ) ) ( not ( = ?auto_2516124 ?auto_2516125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2516120 ?auto_2516125 ?auto_2516121 )
      ( DELIVER-5PKG-VERIFY ?auto_2516120 ?auto_2516122 ?auto_2516123 ?auto_2516124 ?auto_2516125 ?auto_2516121 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2539428 - OBJ
      ?auto_2539430 - OBJ
      ?auto_2539431 - OBJ
      ?auto_2539432 - OBJ
      ?auto_2539433 - OBJ
      ?auto_2539429 - LOCATION
    )
    :vars
    (
      ?auto_2539436 - LOCATION
      ?auto_2539434 - CITY
      ?auto_2539435 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2539430 ?auto_2539428 ) ( GREATER-THAN ?auto_2539431 ?auto_2539428 ) ( GREATER-THAN ?auto_2539431 ?auto_2539430 ) ( GREATER-THAN ?auto_2539432 ?auto_2539428 ) ( GREATER-THAN ?auto_2539432 ?auto_2539430 ) ( GREATER-THAN ?auto_2539432 ?auto_2539431 ) ( GREATER-THAN ?auto_2539433 ?auto_2539428 ) ( GREATER-THAN ?auto_2539433 ?auto_2539430 ) ( GREATER-THAN ?auto_2539433 ?auto_2539431 ) ( GREATER-THAN ?auto_2539433 ?auto_2539432 ) ( IN-CITY ?auto_2539436 ?auto_2539434 ) ( IN-CITY ?auto_2539429 ?auto_2539434 ) ( not ( = ?auto_2539429 ?auto_2539436 ) ) ( OBJ-AT ?auto_2539428 ?auto_2539429 ) ( not ( = ?auto_2539428 ?auto_2539433 ) ) ( OBJ-AT ?auto_2539433 ?auto_2539436 ) ( TRUCK-AT ?auto_2539435 ?auto_2539429 ) ( OBJ-AT ?auto_2539430 ?auto_2539429 ) ( OBJ-AT ?auto_2539431 ?auto_2539429 ) ( OBJ-AT ?auto_2539432 ?auto_2539429 ) ( not ( = ?auto_2539428 ?auto_2539430 ) ) ( not ( = ?auto_2539428 ?auto_2539431 ) ) ( not ( = ?auto_2539428 ?auto_2539432 ) ) ( not ( = ?auto_2539430 ?auto_2539431 ) ) ( not ( = ?auto_2539430 ?auto_2539432 ) ) ( not ( = ?auto_2539430 ?auto_2539433 ) ) ( not ( = ?auto_2539431 ?auto_2539432 ) ) ( not ( = ?auto_2539431 ?auto_2539433 ) ) ( not ( = ?auto_2539432 ?auto_2539433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2539428 ?auto_2539433 ?auto_2539429 )
      ( DELIVER-5PKG-VERIFY ?auto_2539428 ?auto_2539430 ?auto_2539431 ?auto_2539432 ?auto_2539433 ?auto_2539429 ) )
  )

)

