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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_90 - OBJ
      ?auto_89 - LOCATION
    )
    :vars
    (
      ?auto_92 - LOCATION
      ?auto_93 - CITY
      ?auto_91 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92 ?auto_93 ) ( IN-CITY ?auto_89 ?auto_93 ) ( not ( = ?auto_89 ?auto_92 ) ) ( OBJ-AT ?auto_90 ?auto_92 ) ( TRUCK-AT ?auto_91 ?auto_89 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_91 ?auto_89 ?auto_92 ?auto_93 )
      ( !LOAD-TRUCK ?auto_90 ?auto_91 ?auto_92 )
      ( !DRIVE-TRUCK ?auto_91 ?auto_92 ?auto_89 ?auto_93 )
      ( !UNLOAD-TRUCK ?auto_90 ?auto_91 ?auto_89 )
      ( DELIVER-1PKG-VERIFY ?auto_90 ?auto_89 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_97 - OBJ
      ?auto_96 - LOCATION
    )
    :vars
    (
      ?auto_99 - LOCATION
      ?auto_100 - CITY
      ?auto_98 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99 ?auto_100 ) ( IN-CITY ?auto_96 ?auto_100 ) ( not ( = ?auto_96 ?auto_99 ) ) ( OBJ-AT ?auto_97 ?auto_99 ) ( TRUCK-AT ?auto_98 ?auto_96 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_98 ?auto_96 ?auto_99 ?auto_100 )
      ( !LOAD-TRUCK ?auto_97 ?auto_98 ?auto_99 )
      ( !DRIVE-TRUCK ?auto_98 ?auto_99 ?auto_96 ?auto_100 )
      ( !UNLOAD-TRUCK ?auto_97 ?auto_98 ?auto_96 )
      ( DELIVER-1PKG-VERIFY ?auto_97 ?auto_96 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_111 - OBJ
      ?auto_112 - OBJ
      ?auto_110 - LOCATION
    )
    :vars
    (
      ?auto_113 - LOCATION
      ?auto_114 - CITY
      ?auto_116 - LOCATION
      ?auto_115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_113 ?auto_114 ) ( IN-CITY ?auto_110 ?auto_114 ) ( not ( = ?auto_110 ?auto_113 ) ) ( OBJ-AT ?auto_112 ?auto_113 ) ( IN-CITY ?auto_116 ?auto_114 ) ( not ( = ?auto_110 ?auto_116 ) ) ( OBJ-AT ?auto_111 ?auto_116 ) ( TRUCK-AT ?auto_115 ?auto_110 ) ( not ( = ?auto_111 ?auto_112 ) ) ( not ( = ?auto_113 ?auto_116 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_111 ?auto_110 )
      ( DELIVER-1PKG ?auto_112 ?auto_110 )
      ( DELIVER-2PKG-VERIFY ?auto_111 ?auto_112 ?auto_110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_118 - OBJ
      ?auto_119 - OBJ
      ?auto_117 - LOCATION
    )
    :vars
    (
      ?auto_121 - LOCATION
      ?auto_122 - CITY
      ?auto_123 - LOCATION
      ?auto_120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121 ?auto_122 ) ( IN-CITY ?auto_117 ?auto_122 ) ( not ( = ?auto_117 ?auto_121 ) ) ( OBJ-AT ?auto_118 ?auto_121 ) ( IN-CITY ?auto_123 ?auto_122 ) ( not ( = ?auto_117 ?auto_123 ) ) ( OBJ-AT ?auto_119 ?auto_123 ) ( TRUCK-AT ?auto_120 ?auto_117 ) ( not ( = ?auto_119 ?auto_118 ) ) ( not ( = ?auto_121 ?auto_123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_119 ?auto_118 ?auto_117 )
      ( DELIVER-2PKG-VERIFY ?auto_118 ?auto_119 ?auto_117 ) )
  )

)

