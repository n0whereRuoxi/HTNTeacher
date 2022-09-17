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
      ?auto_2 - OBJ
      ?auto_3 - LOCATION
    )
    :vars
    (
      ?auto_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4 ?auto_3 ) ( IN-TRUCK ?auto_2 ?auto_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2 ?auto_4 ?auto_3 )
      ( DELIVER-1PKG-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7 - OBJ
      ?auto_8 - LOCATION
    )
    :vars
    (
      ?auto_9 - TRUCK
      ?auto_10 - LOCATION
      ?auto_11 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7 ?auto_9 ) ( TRUCK-AT ?auto_9 ?auto_10 ) ( IN-CITY ?auto_10 ?auto_11 ) ( IN-CITY ?auto_8 ?auto_11 ) ( not ( = ?auto_8 ?auto_10 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9 ?auto_10 ?auto_8 ?auto_11 )
      ( DELIVER-1PKG ?auto_7 ?auto_8 )
      ( DELIVER-1PKG-VERIFY ?auto_7 ?auto_8 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14 - OBJ
      ?auto_15 - LOCATION
    )
    :vars
    (
      ?auto_16 - TRUCK
      ?auto_18 - LOCATION
      ?auto_17 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_16 ?auto_18 ) ( IN-CITY ?auto_18 ?auto_17 ) ( IN-CITY ?auto_15 ?auto_17 ) ( not ( = ?auto_15 ?auto_18 ) ) ( OBJ-AT ?auto_14 ?auto_18 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14 ?auto_16 ?auto_18 )
      ( DELIVER-1PKG ?auto_14 ?auto_15 )
      ( DELIVER-1PKG-VERIFY ?auto_14 ?auto_15 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21 - OBJ
      ?auto_22 - LOCATION
    )
    :vars
    (
      ?auto_24 - LOCATION
      ?auto_23 - CITY
      ?auto_25 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_24 ?auto_23 ) ( IN-CITY ?auto_22 ?auto_23 ) ( not ( = ?auto_22 ?auto_24 ) ) ( OBJ-AT ?auto_21 ?auto_24 ) ( TRUCK-AT ?auto_25 ?auto_22 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_25 ?auto_22 ?auto_24 ?auto_23 )
      ( DELIVER-1PKG ?auto_21 ?auto_22 )
      ( DELIVER-1PKG-VERIFY ?auto_21 ?auto_22 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_28 - OBJ
      ?auto_29 - LOCATION
    )
    :vars
    (
      ?auto_30 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_30 ?auto_29 ) ( IN-TRUCK ?auto_28 ?auto_30 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_28 ?auto_30 ?auto_29 )
      ( DELIVER-1PKG-VERIFY ?auto_28 ?auto_29 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_33 - OBJ
      ?auto_34 - LOCATION
    )
    :vars
    (
      ?auto_35 - TRUCK
      ?auto_36 - LOCATION
      ?auto_37 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_33 ?auto_35 ) ( TRUCK-AT ?auto_35 ?auto_36 ) ( IN-CITY ?auto_36 ?auto_37 ) ( IN-CITY ?auto_34 ?auto_37 ) ( not ( = ?auto_34 ?auto_36 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_35 ?auto_36 ?auto_34 ?auto_37 )
      ( DELIVER-1PKG ?auto_33 ?auto_34 )
      ( DELIVER-1PKG-VERIFY ?auto_33 ?auto_34 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_40 - OBJ
      ?auto_41 - LOCATION
    )
    :vars
    (
      ?auto_43 - TRUCK
      ?auto_44 - LOCATION
      ?auto_42 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_43 ?auto_44 ) ( IN-CITY ?auto_44 ?auto_42 ) ( IN-CITY ?auto_41 ?auto_42 ) ( not ( = ?auto_41 ?auto_44 ) ) ( OBJ-AT ?auto_40 ?auto_44 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_40 ?auto_43 ?auto_44 )
      ( DELIVER-1PKG ?auto_40 ?auto_41 )
      ( DELIVER-1PKG-VERIFY ?auto_40 ?auto_41 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_47 - OBJ
      ?auto_48 - LOCATION
    )
    :vars
    (
      ?auto_50 - LOCATION
      ?auto_49 - CITY
      ?auto_51 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50 ?auto_49 ) ( IN-CITY ?auto_48 ?auto_49 ) ( not ( = ?auto_48 ?auto_50 ) ) ( OBJ-AT ?auto_47 ?auto_50 ) ( TRUCK-AT ?auto_51 ?auto_48 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_51 ?auto_48 ?auto_50 ?auto_49 )
      ( DELIVER-1PKG ?auto_47 ?auto_48 )
      ( DELIVER-1PKG-VERIFY ?auto_47 ?auto_48 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55 - OBJ
      ?auto_57 - OBJ
      ?auto_56 - LOCATION
    )
    :vars
    (
      ?auto_58 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_57 ?auto_55 ) ( TRUCK-AT ?auto_58 ?auto_56 ) ( IN-TRUCK ?auto_57 ?auto_58 ) ( OBJ-AT ?auto_55 ?auto_56 ) ( not ( = ?auto_55 ?auto_57 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57 ?auto_56 )
      ( DELIVER-2PKG-VERIFY ?auto_55 ?auto_57 ?auto_56 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62 - OBJ
      ?auto_64 - OBJ
      ?auto_63 - LOCATION
    )
    :vars
    (
      ?auto_66 - TRUCK
      ?auto_67 - LOCATION
      ?auto_65 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_64 ?auto_62 ) ( IN-TRUCK ?auto_64 ?auto_66 ) ( TRUCK-AT ?auto_66 ?auto_67 ) ( IN-CITY ?auto_67 ?auto_65 ) ( IN-CITY ?auto_63 ?auto_65 ) ( not ( = ?auto_63 ?auto_67 ) ) ( OBJ-AT ?auto_62 ?auto_63 ) ( not ( = ?auto_62 ?auto_64 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64 ?auto_63 )
      ( DELIVER-2PKG-VERIFY ?auto_62 ?auto_64 ?auto_63 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_71 - OBJ
      ?auto_73 - OBJ
      ?auto_72 - LOCATION
    )
    :vars
    (
      ?auto_76 - TRUCK
      ?auto_75 - LOCATION
      ?auto_74 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_73 ?auto_71 ) ( TRUCK-AT ?auto_76 ?auto_75 ) ( IN-CITY ?auto_75 ?auto_74 ) ( IN-CITY ?auto_72 ?auto_74 ) ( not ( = ?auto_72 ?auto_75 ) ) ( OBJ-AT ?auto_73 ?auto_75 ) ( OBJ-AT ?auto_71 ?auto_72 ) ( not ( = ?auto_71 ?auto_73 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73 ?auto_72 )
      ( DELIVER-2PKG-VERIFY ?auto_71 ?auto_73 ?auto_72 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80 - OBJ
      ?auto_82 - OBJ
      ?auto_81 - LOCATION
    )
    :vars
    (
      ?auto_83 - LOCATION
      ?auto_84 - CITY
      ?auto_85 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_82 ?auto_80 ) ( IN-CITY ?auto_83 ?auto_84 ) ( IN-CITY ?auto_81 ?auto_84 ) ( not ( = ?auto_81 ?auto_83 ) ) ( OBJ-AT ?auto_82 ?auto_83 ) ( TRUCK-AT ?auto_85 ?auto_81 ) ( OBJ-AT ?auto_80 ?auto_81 ) ( not ( = ?auto_80 ?auto_82 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_82 ?auto_81 )
      ( DELIVER-2PKG-VERIFY ?auto_80 ?auto_82 ?auto_81 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_89 - OBJ
      ?auto_91 - OBJ
      ?auto_90 - LOCATION
    )
    :vars
    (
      ?auto_93 - LOCATION
      ?auto_94 - CITY
      ?auto_92 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91 ?auto_89 ) ( IN-CITY ?auto_93 ?auto_94 ) ( IN-CITY ?auto_90 ?auto_94 ) ( not ( = ?auto_90 ?auto_93 ) ) ( OBJ-AT ?auto_91 ?auto_93 ) ( TRUCK-AT ?auto_92 ?auto_90 ) ( not ( = ?auto_89 ?auto_91 ) ) ( IN-TRUCK ?auto_89 ?auto_92 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_89 ?auto_90 )
      ( DELIVER-2PKG ?auto_89 ?auto_91 ?auto_90 )
      ( DELIVER-2PKG-VERIFY ?auto_89 ?auto_91 ?auto_90 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_98 - OBJ
      ?auto_100 - OBJ
      ?auto_99 - LOCATION
    )
    :vars
    (
      ?auto_103 - LOCATION
      ?auto_102 - CITY
      ?auto_101 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_100 ?auto_98 ) ( IN-CITY ?auto_103 ?auto_102 ) ( IN-CITY ?auto_99 ?auto_102 ) ( not ( = ?auto_99 ?auto_103 ) ) ( OBJ-AT ?auto_100 ?auto_103 ) ( not ( = ?auto_98 ?auto_100 ) ) ( IN-TRUCK ?auto_98 ?auto_101 ) ( TRUCK-AT ?auto_101 ?auto_103 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101 ?auto_103 ?auto_99 ?auto_102 )
      ( DELIVER-2PKG ?auto_98 ?auto_100 ?auto_99 )
      ( DELIVER-2PKG-VERIFY ?auto_98 ?auto_100 ?auto_99 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_107 - OBJ
      ?auto_109 - OBJ
      ?auto_108 - LOCATION
    )
    :vars
    (
      ?auto_112 - LOCATION
      ?auto_111 - CITY
      ?auto_110 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_109 ?auto_107 ) ( IN-CITY ?auto_112 ?auto_111 ) ( IN-CITY ?auto_108 ?auto_111 ) ( not ( = ?auto_108 ?auto_112 ) ) ( OBJ-AT ?auto_109 ?auto_112 ) ( not ( = ?auto_107 ?auto_109 ) ) ( TRUCK-AT ?auto_110 ?auto_112 ) ( OBJ-AT ?auto_107 ?auto_112 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_107 ?auto_110 ?auto_112 )
      ( DELIVER-2PKG ?auto_107 ?auto_109 ?auto_108 )
      ( DELIVER-2PKG-VERIFY ?auto_107 ?auto_109 ?auto_108 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_116 - OBJ
      ?auto_118 - OBJ
      ?auto_117 - LOCATION
    )
    :vars
    (
      ?auto_120 - LOCATION
      ?auto_121 - CITY
      ?auto_119 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_118 ?auto_116 ) ( IN-CITY ?auto_120 ?auto_121 ) ( IN-CITY ?auto_117 ?auto_121 ) ( not ( = ?auto_117 ?auto_120 ) ) ( OBJ-AT ?auto_118 ?auto_120 ) ( not ( = ?auto_116 ?auto_118 ) ) ( OBJ-AT ?auto_116 ?auto_120 ) ( TRUCK-AT ?auto_119 ?auto_117 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_119 ?auto_117 ?auto_120 ?auto_121 )
      ( DELIVER-2PKG ?auto_116 ?auto_118 ?auto_117 )
      ( DELIVER-2PKG-VERIFY ?auto_116 ?auto_118 ?auto_117 ) )
  )

)

