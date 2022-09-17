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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138316 - OBJ
      ?auto_138317 - LOCATION
    )
    :vars
    (
      ?auto_138318 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138318 ?auto_138317 ) ( IN-TRUCK ?auto_138316 ?auto_138318 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_138316 ?auto_138318 ?auto_138317 )
      ( DELIVER-1PKG-VERIFY ?auto_138316 ?auto_138317 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138334 - OBJ
      ?auto_138335 - LOCATION
    )
    :vars
    (
      ?auto_138336 - TRUCK
      ?auto_138337 - LOCATION
      ?auto_138338 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138334 ?auto_138336 ) ( TRUCK-AT ?auto_138336 ?auto_138337 ) ( IN-CITY ?auto_138337 ?auto_138338 ) ( IN-CITY ?auto_138335 ?auto_138338 ) ( not ( = ?auto_138335 ?auto_138337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_138336 ?auto_138337 ?auto_138335 ?auto_138338 )
      ( DELIVER-1PKG ?auto_138334 ?auto_138335 )
      ( DELIVER-1PKG-VERIFY ?auto_138334 ?auto_138335 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138360 - OBJ
      ?auto_138361 - LOCATION
    )
    :vars
    (
      ?auto_138363 - TRUCK
      ?auto_138364 - LOCATION
      ?auto_138362 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138363 ?auto_138364 ) ( IN-CITY ?auto_138364 ?auto_138362 ) ( IN-CITY ?auto_138361 ?auto_138362 ) ( not ( = ?auto_138361 ?auto_138364 ) ) ( OBJ-AT ?auto_138360 ?auto_138364 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_138360 ?auto_138363 ?auto_138364 )
      ( DELIVER-1PKG ?auto_138360 ?auto_138361 )
      ( DELIVER-1PKG-VERIFY ?auto_138360 ?auto_138361 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138386 - OBJ
      ?auto_138387 - LOCATION
    )
    :vars
    (
      ?auto_138390 - LOCATION
      ?auto_138389 - CITY
      ?auto_138388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138390 ?auto_138389 ) ( IN-CITY ?auto_138387 ?auto_138389 ) ( not ( = ?auto_138387 ?auto_138390 ) ) ( OBJ-AT ?auto_138386 ?auto_138390 ) ( TRUCK-AT ?auto_138388 ?auto_138387 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_138388 ?auto_138387 ?auto_138390 ?auto_138389 )
      ( DELIVER-1PKG ?auto_138386 ?auto_138387 )
      ( DELIVER-1PKG-VERIFY ?auto_138386 ?auto_138387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_138529 - OBJ
      ?auto_138531 - OBJ
      ?auto_138530 - LOCATION
    )
    :vars
    (
      ?auto_138532 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_138531 ?auto_138529 ) ( TRUCK-AT ?auto_138532 ?auto_138530 ) ( IN-TRUCK ?auto_138531 ?auto_138532 ) ( OBJ-AT ?auto_138529 ?auto_138530 ) ( not ( = ?auto_138529 ?auto_138531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138531 ?auto_138530 )
      ( DELIVER-2PKG-VERIFY ?auto_138529 ?auto_138531 ?auto_138530 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_138671 - OBJ
      ?auto_138673 - OBJ
      ?auto_138672 - LOCATION
    )
    :vars
    (
      ?auto_138674 - TRUCK
      ?auto_138675 - LOCATION
      ?auto_138676 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_138673 ?auto_138671 ) ( IN-TRUCK ?auto_138673 ?auto_138674 ) ( TRUCK-AT ?auto_138674 ?auto_138675 ) ( IN-CITY ?auto_138675 ?auto_138676 ) ( IN-CITY ?auto_138672 ?auto_138676 ) ( not ( = ?auto_138672 ?auto_138675 ) ) ( OBJ-AT ?auto_138671 ?auto_138672 ) ( not ( = ?auto_138671 ?auto_138673 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138673 ?auto_138672 )
      ( DELIVER-2PKG-VERIFY ?auto_138671 ?auto_138673 ?auto_138672 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138861 - OBJ
      ?auto_138862 - LOCATION
    )
    :vars
    (
      ?auto_138864 - OBJ
      ?auto_138863 - TRUCK
      ?auto_138865 - LOCATION
      ?auto_138866 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_138861 ?auto_138864 ) ( TRUCK-AT ?auto_138863 ?auto_138865 ) ( IN-CITY ?auto_138865 ?auto_138866 ) ( IN-CITY ?auto_138862 ?auto_138866 ) ( not ( = ?auto_138862 ?auto_138865 ) ) ( OBJ-AT ?auto_138864 ?auto_138862 ) ( not ( = ?auto_138864 ?auto_138861 ) ) ( OBJ-AT ?auto_138861 ?auto_138865 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_138861 ?auto_138863 ?auto_138865 )
      ( DELIVER-2PKG ?auto_138864 ?auto_138861 ?auto_138862 )
      ( DELIVER-1PKG-VERIFY ?auto_138861 ?auto_138862 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_138867 - OBJ
      ?auto_138869 - OBJ
      ?auto_138868 - LOCATION
    )
    :vars
    (
      ?auto_138870 - TRUCK
      ?auto_138872 - LOCATION
      ?auto_138871 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_138869 ?auto_138867 ) ( TRUCK-AT ?auto_138870 ?auto_138872 ) ( IN-CITY ?auto_138872 ?auto_138871 ) ( IN-CITY ?auto_138868 ?auto_138871 ) ( not ( = ?auto_138868 ?auto_138872 ) ) ( OBJ-AT ?auto_138867 ?auto_138868 ) ( not ( = ?auto_138867 ?auto_138869 ) ) ( OBJ-AT ?auto_138869 ?auto_138872 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138869 ?auto_138868 )
      ( DELIVER-2PKG-VERIFY ?auto_138867 ?auto_138869 ?auto_138868 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_139057 - OBJ
      ?auto_139058 - LOCATION
    )
    :vars
    (
      ?auto_139061 - OBJ
      ?auto_139060 - LOCATION
      ?auto_139059 - CITY
      ?auto_139062 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139057 ?auto_139061 ) ( IN-CITY ?auto_139060 ?auto_139059 ) ( IN-CITY ?auto_139058 ?auto_139059 ) ( not ( = ?auto_139058 ?auto_139060 ) ) ( OBJ-AT ?auto_139061 ?auto_139058 ) ( not ( = ?auto_139061 ?auto_139057 ) ) ( OBJ-AT ?auto_139057 ?auto_139060 ) ( TRUCK-AT ?auto_139062 ?auto_139058 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_139062 ?auto_139058 ?auto_139060 ?auto_139059 )
      ( DELIVER-2PKG ?auto_139061 ?auto_139057 ?auto_139058 )
      ( DELIVER-1PKG-VERIFY ?auto_139057 ?auto_139058 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_139063 - OBJ
      ?auto_139065 - OBJ
      ?auto_139064 - LOCATION
    )
    :vars
    (
      ?auto_139066 - LOCATION
      ?auto_139067 - CITY
      ?auto_139068 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139065 ?auto_139063 ) ( IN-CITY ?auto_139066 ?auto_139067 ) ( IN-CITY ?auto_139064 ?auto_139067 ) ( not ( = ?auto_139064 ?auto_139066 ) ) ( OBJ-AT ?auto_139063 ?auto_139064 ) ( not ( = ?auto_139063 ?auto_139065 ) ) ( OBJ-AT ?auto_139065 ?auto_139066 ) ( TRUCK-AT ?auto_139068 ?auto_139064 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_139065 ?auto_139064 )
      ( DELIVER-2PKG-VERIFY ?auto_139063 ?auto_139065 ?auto_139064 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_139253 - OBJ
      ?auto_139254 - LOCATION
    )
    :vars
    (
      ?auto_139255 - OBJ
      ?auto_139257 - LOCATION
      ?auto_139258 - CITY
      ?auto_139256 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139253 ?auto_139255 ) ( IN-CITY ?auto_139257 ?auto_139258 ) ( IN-CITY ?auto_139254 ?auto_139258 ) ( not ( = ?auto_139254 ?auto_139257 ) ) ( not ( = ?auto_139255 ?auto_139253 ) ) ( OBJ-AT ?auto_139253 ?auto_139257 ) ( TRUCK-AT ?auto_139256 ?auto_139254 ) ( IN-TRUCK ?auto_139255 ?auto_139256 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_139255 ?auto_139254 )
      ( DELIVER-2PKG ?auto_139255 ?auto_139253 ?auto_139254 )
      ( DELIVER-1PKG-VERIFY ?auto_139253 ?auto_139254 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_139259 - OBJ
      ?auto_139261 - OBJ
      ?auto_139260 - LOCATION
    )
    :vars
    (
      ?auto_139262 - LOCATION
      ?auto_139264 - CITY
      ?auto_139263 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139261 ?auto_139259 ) ( IN-CITY ?auto_139262 ?auto_139264 ) ( IN-CITY ?auto_139260 ?auto_139264 ) ( not ( = ?auto_139260 ?auto_139262 ) ) ( not ( = ?auto_139259 ?auto_139261 ) ) ( OBJ-AT ?auto_139261 ?auto_139262 ) ( TRUCK-AT ?auto_139263 ?auto_139260 ) ( IN-TRUCK ?auto_139259 ?auto_139263 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_139261 ?auto_139260 )
      ( DELIVER-2PKG-VERIFY ?auto_139259 ?auto_139261 ?auto_139260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_139449 - OBJ
      ?auto_139450 - LOCATION
    )
    :vars
    (
      ?auto_139451 - OBJ
      ?auto_139453 - LOCATION
      ?auto_139454 - CITY
      ?auto_139452 - TRUCK
      ?auto_139455 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139449 ?auto_139451 ) ( IN-CITY ?auto_139453 ?auto_139454 ) ( IN-CITY ?auto_139450 ?auto_139454 ) ( not ( = ?auto_139450 ?auto_139453 ) ) ( not ( = ?auto_139451 ?auto_139449 ) ) ( OBJ-AT ?auto_139449 ?auto_139453 ) ( IN-TRUCK ?auto_139451 ?auto_139452 ) ( TRUCK-AT ?auto_139452 ?auto_139455 ) ( IN-CITY ?auto_139455 ?auto_139454 ) ( not ( = ?auto_139450 ?auto_139455 ) ) ( not ( = ?auto_139453 ?auto_139455 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_139452 ?auto_139455 ?auto_139450 ?auto_139454 )
      ( DELIVER-2PKG ?auto_139451 ?auto_139449 ?auto_139450 )
      ( DELIVER-1PKG-VERIFY ?auto_139449 ?auto_139450 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_139456 - OBJ
      ?auto_139458 - OBJ
      ?auto_139457 - LOCATION
    )
    :vars
    (
      ?auto_139462 - LOCATION
      ?auto_139460 - CITY
      ?auto_139461 - TRUCK
      ?auto_139459 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139458 ?auto_139456 ) ( IN-CITY ?auto_139462 ?auto_139460 ) ( IN-CITY ?auto_139457 ?auto_139460 ) ( not ( = ?auto_139457 ?auto_139462 ) ) ( not ( = ?auto_139456 ?auto_139458 ) ) ( OBJ-AT ?auto_139458 ?auto_139462 ) ( IN-TRUCK ?auto_139456 ?auto_139461 ) ( TRUCK-AT ?auto_139461 ?auto_139459 ) ( IN-CITY ?auto_139459 ?auto_139460 ) ( not ( = ?auto_139457 ?auto_139459 ) ) ( not ( = ?auto_139462 ?auto_139459 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_139458 ?auto_139457 )
      ( DELIVER-2PKG-VERIFY ?auto_139456 ?auto_139458 ?auto_139457 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_139671 - OBJ
      ?auto_139672 - LOCATION
    )
    :vars
    (
      ?auto_139673 - OBJ
      ?auto_139674 - LOCATION
      ?auto_139675 - CITY
      ?auto_139677 - TRUCK
      ?auto_139676 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139671 ?auto_139673 ) ( IN-CITY ?auto_139674 ?auto_139675 ) ( IN-CITY ?auto_139672 ?auto_139675 ) ( not ( = ?auto_139672 ?auto_139674 ) ) ( not ( = ?auto_139673 ?auto_139671 ) ) ( OBJ-AT ?auto_139671 ?auto_139674 ) ( TRUCK-AT ?auto_139677 ?auto_139676 ) ( IN-CITY ?auto_139676 ?auto_139675 ) ( not ( = ?auto_139672 ?auto_139676 ) ) ( not ( = ?auto_139674 ?auto_139676 ) ) ( OBJ-AT ?auto_139673 ?auto_139676 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_139673 ?auto_139677 ?auto_139676 )
      ( DELIVER-2PKG ?auto_139673 ?auto_139671 ?auto_139672 )
      ( DELIVER-1PKG-VERIFY ?auto_139671 ?auto_139672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_139678 - OBJ
      ?auto_139680 - OBJ
      ?auto_139679 - LOCATION
    )
    :vars
    (
      ?auto_139683 - LOCATION
      ?auto_139684 - CITY
      ?auto_139682 - TRUCK
      ?auto_139681 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_139680 ?auto_139678 ) ( IN-CITY ?auto_139683 ?auto_139684 ) ( IN-CITY ?auto_139679 ?auto_139684 ) ( not ( = ?auto_139679 ?auto_139683 ) ) ( not ( = ?auto_139678 ?auto_139680 ) ) ( OBJ-AT ?auto_139680 ?auto_139683 ) ( TRUCK-AT ?auto_139682 ?auto_139681 ) ( IN-CITY ?auto_139681 ?auto_139684 ) ( not ( = ?auto_139679 ?auto_139681 ) ) ( not ( = ?auto_139683 ?auto_139681 ) ) ( OBJ-AT ?auto_139678 ?auto_139681 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_139680 ?auto_139679 )
      ( DELIVER-2PKG-VERIFY ?auto_139678 ?auto_139680 ?auto_139679 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140527 - OBJ
      ?auto_140529 - OBJ
      ?auto_140530 - OBJ
      ?auto_140528 - LOCATION
    )
    :vars
    (
      ?auto_140531 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_140529 ?auto_140527 ) ( GREATER-THAN ?auto_140530 ?auto_140527 ) ( GREATER-THAN ?auto_140530 ?auto_140529 ) ( TRUCK-AT ?auto_140531 ?auto_140528 ) ( IN-TRUCK ?auto_140530 ?auto_140531 ) ( OBJ-AT ?auto_140527 ?auto_140528 ) ( OBJ-AT ?auto_140529 ?auto_140528 ) ( not ( = ?auto_140527 ?auto_140529 ) ) ( not ( = ?auto_140527 ?auto_140530 ) ) ( not ( = ?auto_140529 ?auto_140530 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_140530 ?auto_140528 )
      ( DELIVER-3PKG-VERIFY ?auto_140527 ?auto_140529 ?auto_140530 ?auto_140528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141048 - OBJ
      ?auto_141050 - OBJ
      ?auto_141051 - OBJ
      ?auto_141049 - LOCATION
    )
    :vars
    (
      ?auto_141053 - TRUCK
      ?auto_141054 - LOCATION
      ?auto_141052 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_141050 ?auto_141048 ) ( GREATER-THAN ?auto_141051 ?auto_141048 ) ( GREATER-THAN ?auto_141051 ?auto_141050 ) ( IN-TRUCK ?auto_141051 ?auto_141053 ) ( TRUCK-AT ?auto_141053 ?auto_141054 ) ( IN-CITY ?auto_141054 ?auto_141052 ) ( IN-CITY ?auto_141049 ?auto_141052 ) ( not ( = ?auto_141049 ?auto_141054 ) ) ( OBJ-AT ?auto_141048 ?auto_141049 ) ( not ( = ?auto_141048 ?auto_141051 ) ) ( OBJ-AT ?auto_141050 ?auto_141049 ) ( not ( = ?auto_141048 ?auto_141050 ) ) ( not ( = ?auto_141050 ?auto_141051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141048 ?auto_141051 ?auto_141049 )
      ( DELIVER-3PKG-VERIFY ?auto_141048 ?auto_141050 ?auto_141051 ?auto_141049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141758 - OBJ
      ?auto_141760 - OBJ
      ?auto_141761 - OBJ
      ?auto_141759 - LOCATION
    )
    :vars
    (
      ?auto_141762 - TRUCK
      ?auto_141764 - LOCATION
      ?auto_141763 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_141760 ?auto_141758 ) ( GREATER-THAN ?auto_141761 ?auto_141758 ) ( GREATER-THAN ?auto_141761 ?auto_141760 ) ( TRUCK-AT ?auto_141762 ?auto_141764 ) ( IN-CITY ?auto_141764 ?auto_141763 ) ( IN-CITY ?auto_141759 ?auto_141763 ) ( not ( = ?auto_141759 ?auto_141764 ) ) ( OBJ-AT ?auto_141758 ?auto_141759 ) ( not ( = ?auto_141758 ?auto_141761 ) ) ( OBJ-AT ?auto_141761 ?auto_141764 ) ( OBJ-AT ?auto_141760 ?auto_141759 ) ( not ( = ?auto_141758 ?auto_141760 ) ) ( not ( = ?auto_141760 ?auto_141761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141758 ?auto_141761 ?auto_141759 )
      ( DELIVER-3PKG-VERIFY ?auto_141758 ?auto_141760 ?auto_141761 ?auto_141759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_142468 - OBJ
      ?auto_142470 - OBJ
      ?auto_142471 - OBJ
      ?auto_142469 - LOCATION
    )
    :vars
    (
      ?auto_142472 - LOCATION
      ?auto_142474 - CITY
      ?auto_142473 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_142470 ?auto_142468 ) ( GREATER-THAN ?auto_142471 ?auto_142468 ) ( GREATER-THAN ?auto_142471 ?auto_142470 ) ( IN-CITY ?auto_142472 ?auto_142474 ) ( IN-CITY ?auto_142469 ?auto_142474 ) ( not ( = ?auto_142469 ?auto_142472 ) ) ( OBJ-AT ?auto_142468 ?auto_142469 ) ( not ( = ?auto_142468 ?auto_142471 ) ) ( OBJ-AT ?auto_142471 ?auto_142472 ) ( TRUCK-AT ?auto_142473 ?auto_142469 ) ( OBJ-AT ?auto_142470 ?auto_142469 ) ( not ( = ?auto_142468 ?auto_142470 ) ) ( not ( = ?auto_142470 ?auto_142471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142468 ?auto_142471 ?auto_142469 )
      ( DELIVER-3PKG-VERIFY ?auto_142468 ?auto_142470 ?auto_142471 ?auto_142469 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_143843 - OBJ
      ?auto_143844 - LOCATION
    )
    :vars
    (
      ?auto_143846 - OBJ
      ?auto_143845 - LOCATION
      ?auto_143847 - CITY
      ?auto_143848 - TRUCK
      ?auto_143849 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_143843 ?auto_143846 ) ( IN-CITY ?auto_143845 ?auto_143847 ) ( IN-CITY ?auto_143844 ?auto_143847 ) ( not ( = ?auto_143844 ?auto_143845 ) ) ( OBJ-AT ?auto_143846 ?auto_143844 ) ( not ( = ?auto_143846 ?auto_143843 ) ) ( OBJ-AT ?auto_143843 ?auto_143845 ) ( TRUCK-AT ?auto_143848 ?auto_143849 ) ( IN-CITY ?auto_143849 ?auto_143847 ) ( not ( = ?auto_143844 ?auto_143849 ) ) ( not ( = ?auto_143845 ?auto_143849 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_143848 ?auto_143849 ?auto_143844 ?auto_143847 )
      ( DELIVER-2PKG ?auto_143846 ?auto_143843 ?auto_143844 )
      ( DELIVER-1PKG-VERIFY ?auto_143843 ?auto_143844 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_143850 - OBJ
      ?auto_143852 - OBJ
      ?auto_143851 - LOCATION
    )
    :vars
    (
      ?auto_143853 - LOCATION
      ?auto_143854 - CITY
      ?auto_143856 - TRUCK
      ?auto_143855 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_143852 ?auto_143850 ) ( IN-CITY ?auto_143853 ?auto_143854 ) ( IN-CITY ?auto_143851 ?auto_143854 ) ( not ( = ?auto_143851 ?auto_143853 ) ) ( OBJ-AT ?auto_143850 ?auto_143851 ) ( not ( = ?auto_143850 ?auto_143852 ) ) ( OBJ-AT ?auto_143852 ?auto_143853 ) ( TRUCK-AT ?auto_143856 ?auto_143855 ) ( IN-CITY ?auto_143855 ?auto_143854 ) ( not ( = ?auto_143851 ?auto_143855 ) ) ( not ( = ?auto_143853 ?auto_143855 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_143852 ?auto_143851 )
      ( DELIVER-2PKG-VERIFY ?auto_143850 ?auto_143852 ?auto_143851 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150443 - OBJ
      ?auto_150445 - OBJ
      ?auto_150446 - OBJ
      ?auto_150447 - OBJ
      ?auto_150444 - LOCATION
    )
    :vars
    (
      ?auto_150448 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_150445 ?auto_150443 ) ( GREATER-THAN ?auto_150446 ?auto_150443 ) ( GREATER-THAN ?auto_150446 ?auto_150445 ) ( GREATER-THAN ?auto_150447 ?auto_150443 ) ( GREATER-THAN ?auto_150447 ?auto_150445 ) ( GREATER-THAN ?auto_150447 ?auto_150446 ) ( TRUCK-AT ?auto_150448 ?auto_150444 ) ( IN-TRUCK ?auto_150447 ?auto_150448 ) ( OBJ-AT ?auto_150443 ?auto_150444 ) ( OBJ-AT ?auto_150445 ?auto_150444 ) ( OBJ-AT ?auto_150446 ?auto_150444 ) ( not ( = ?auto_150443 ?auto_150445 ) ) ( not ( = ?auto_150443 ?auto_150446 ) ) ( not ( = ?auto_150443 ?auto_150447 ) ) ( not ( = ?auto_150445 ?auto_150446 ) ) ( not ( = ?auto_150445 ?auto_150447 ) ) ( not ( = ?auto_150446 ?auto_150447 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_150447 ?auto_150444 )
      ( DELIVER-4PKG-VERIFY ?auto_150443 ?auto_150445 ?auto_150446 ?auto_150447 ?auto_150444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151826 - OBJ
      ?auto_151828 - OBJ
      ?auto_151829 - OBJ
      ?auto_151830 - OBJ
      ?auto_151827 - LOCATION
    )
    :vars
    (
      ?auto_151833 - TRUCK
      ?auto_151832 - LOCATION
      ?auto_151831 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_151828 ?auto_151826 ) ( GREATER-THAN ?auto_151829 ?auto_151826 ) ( GREATER-THAN ?auto_151829 ?auto_151828 ) ( GREATER-THAN ?auto_151830 ?auto_151826 ) ( GREATER-THAN ?auto_151830 ?auto_151828 ) ( GREATER-THAN ?auto_151830 ?auto_151829 ) ( IN-TRUCK ?auto_151830 ?auto_151833 ) ( TRUCK-AT ?auto_151833 ?auto_151832 ) ( IN-CITY ?auto_151832 ?auto_151831 ) ( IN-CITY ?auto_151827 ?auto_151831 ) ( not ( = ?auto_151827 ?auto_151832 ) ) ( OBJ-AT ?auto_151826 ?auto_151827 ) ( not ( = ?auto_151826 ?auto_151830 ) ) ( OBJ-AT ?auto_151828 ?auto_151827 ) ( OBJ-AT ?auto_151829 ?auto_151827 ) ( not ( = ?auto_151826 ?auto_151828 ) ) ( not ( = ?auto_151826 ?auto_151829 ) ) ( not ( = ?auto_151828 ?auto_151829 ) ) ( not ( = ?auto_151828 ?auto_151830 ) ) ( not ( = ?auto_151829 ?auto_151830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_151826 ?auto_151830 ?auto_151827 )
      ( DELIVER-4PKG-VERIFY ?auto_151826 ?auto_151828 ?auto_151829 ?auto_151830 ?auto_151827 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_153607 - OBJ
      ?auto_153609 - OBJ
      ?auto_153610 - OBJ
      ?auto_153611 - OBJ
      ?auto_153608 - LOCATION
    )
    :vars
    (
      ?auto_153613 - TRUCK
      ?auto_153614 - LOCATION
      ?auto_153612 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_153609 ?auto_153607 ) ( GREATER-THAN ?auto_153610 ?auto_153607 ) ( GREATER-THAN ?auto_153610 ?auto_153609 ) ( GREATER-THAN ?auto_153611 ?auto_153607 ) ( GREATER-THAN ?auto_153611 ?auto_153609 ) ( GREATER-THAN ?auto_153611 ?auto_153610 ) ( TRUCK-AT ?auto_153613 ?auto_153614 ) ( IN-CITY ?auto_153614 ?auto_153612 ) ( IN-CITY ?auto_153608 ?auto_153612 ) ( not ( = ?auto_153608 ?auto_153614 ) ) ( OBJ-AT ?auto_153607 ?auto_153608 ) ( not ( = ?auto_153607 ?auto_153611 ) ) ( OBJ-AT ?auto_153611 ?auto_153614 ) ( OBJ-AT ?auto_153609 ?auto_153608 ) ( OBJ-AT ?auto_153610 ?auto_153608 ) ( not ( = ?auto_153607 ?auto_153609 ) ) ( not ( = ?auto_153607 ?auto_153610 ) ) ( not ( = ?auto_153609 ?auto_153610 ) ) ( not ( = ?auto_153609 ?auto_153611 ) ) ( not ( = ?auto_153610 ?auto_153611 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153607 ?auto_153611 ?auto_153608 )
      ( DELIVER-4PKG-VERIFY ?auto_153607 ?auto_153609 ?auto_153610 ?auto_153611 ?auto_153608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155388 - OBJ
      ?auto_155390 - OBJ
      ?auto_155391 - OBJ
      ?auto_155392 - OBJ
      ?auto_155389 - LOCATION
    )
    :vars
    (
      ?auto_155393 - LOCATION
      ?auto_155394 - CITY
      ?auto_155395 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_155390 ?auto_155388 ) ( GREATER-THAN ?auto_155391 ?auto_155388 ) ( GREATER-THAN ?auto_155391 ?auto_155390 ) ( GREATER-THAN ?auto_155392 ?auto_155388 ) ( GREATER-THAN ?auto_155392 ?auto_155390 ) ( GREATER-THAN ?auto_155392 ?auto_155391 ) ( IN-CITY ?auto_155393 ?auto_155394 ) ( IN-CITY ?auto_155389 ?auto_155394 ) ( not ( = ?auto_155389 ?auto_155393 ) ) ( OBJ-AT ?auto_155388 ?auto_155389 ) ( not ( = ?auto_155388 ?auto_155392 ) ) ( OBJ-AT ?auto_155392 ?auto_155393 ) ( TRUCK-AT ?auto_155395 ?auto_155389 ) ( OBJ-AT ?auto_155390 ?auto_155389 ) ( OBJ-AT ?auto_155391 ?auto_155389 ) ( not ( = ?auto_155388 ?auto_155390 ) ) ( not ( = ?auto_155388 ?auto_155391 ) ) ( not ( = ?auto_155390 ?auto_155391 ) ) ( not ( = ?auto_155390 ?auto_155392 ) ) ( not ( = ?auto_155391 ?auto_155392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155388 ?auto_155392 ?auto_155389 )
      ( DELIVER-4PKG-VERIFY ?auto_155388 ?auto_155390 ?auto_155391 ?auto_155392 ?auto_155389 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158627 - OBJ
      ?auto_158629 - OBJ
      ?auto_158630 - OBJ
      ?auto_158628 - LOCATION
    )
    :vars
    (
      ?auto_158634 - LOCATION
      ?auto_158633 - CITY
      ?auto_158631 - TRUCK
      ?auto_158632 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_158629 ?auto_158627 ) ( GREATER-THAN ?auto_158630 ?auto_158627 ) ( GREATER-THAN ?auto_158630 ?auto_158629 ) ( IN-CITY ?auto_158634 ?auto_158633 ) ( IN-CITY ?auto_158628 ?auto_158633 ) ( not ( = ?auto_158628 ?auto_158634 ) ) ( OBJ-AT ?auto_158627 ?auto_158628 ) ( not ( = ?auto_158627 ?auto_158630 ) ) ( OBJ-AT ?auto_158630 ?auto_158634 ) ( TRUCK-AT ?auto_158631 ?auto_158632 ) ( IN-CITY ?auto_158632 ?auto_158633 ) ( not ( = ?auto_158628 ?auto_158632 ) ) ( not ( = ?auto_158634 ?auto_158632 ) ) ( OBJ-AT ?auto_158629 ?auto_158628 ) ( not ( = ?auto_158627 ?auto_158629 ) ) ( not ( = ?auto_158629 ?auto_158630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158627 ?auto_158630 ?auto_158628 )
      ( DELIVER-3PKG-VERIFY ?auto_158627 ?auto_158629 ?auto_158630 ?auto_158628 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_173735 - OBJ
      ?auto_173736 - LOCATION
    )
    :vars
    (
      ?auto_173737 - OBJ
      ?auto_173739 - LOCATION
      ?auto_173740 - CITY
      ?auto_173738 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_173735 ?auto_173737 ) ( IN-CITY ?auto_173739 ?auto_173740 ) ( IN-CITY ?auto_173736 ?auto_173740 ) ( not ( = ?auto_173736 ?auto_173739 ) ) ( not ( = ?auto_173737 ?auto_173735 ) ) ( OBJ-AT ?auto_173735 ?auto_173739 ) ( IN-TRUCK ?auto_173737 ?auto_173738 ) ( TRUCK-AT ?auto_173738 ?auto_173739 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_173738 ?auto_173739 ?auto_173736 ?auto_173740 )
      ( DELIVER-2PKG ?auto_173737 ?auto_173735 ?auto_173736 )
      ( DELIVER-1PKG-VERIFY ?auto_173735 ?auto_173736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173741 - OBJ
      ?auto_173743 - OBJ
      ?auto_173742 - LOCATION
    )
    :vars
    (
      ?auto_173744 - LOCATION
      ?auto_173746 - CITY
      ?auto_173745 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_173743 ?auto_173741 ) ( IN-CITY ?auto_173744 ?auto_173746 ) ( IN-CITY ?auto_173742 ?auto_173746 ) ( not ( = ?auto_173742 ?auto_173744 ) ) ( not ( = ?auto_173741 ?auto_173743 ) ) ( OBJ-AT ?auto_173743 ?auto_173744 ) ( IN-TRUCK ?auto_173741 ?auto_173745 ) ( TRUCK-AT ?auto_173745 ?auto_173744 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_173743 ?auto_173742 )
      ( DELIVER-2PKG-VERIFY ?auto_173741 ?auto_173743 ?auto_173742 ) )
  )

)

