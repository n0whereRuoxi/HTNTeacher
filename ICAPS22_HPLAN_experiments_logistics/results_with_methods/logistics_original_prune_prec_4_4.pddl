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
      ?auto_178951 - OBJ
      ?auto_178952 - LOCATION
    )
    :vars
    (
      ?auto_178953 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178953 ?auto_178952 ) ( IN-TRUCK ?auto_178951 ?auto_178953 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_178951 ?auto_178953 ?auto_178952 )
      ( DELIVER-1PKG-VERIFY ?auto_178951 ?auto_178952 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_178969 - OBJ
      ?auto_178970 - LOCATION
    )
    :vars
    (
      ?auto_178971 - TRUCK
      ?auto_178972 - LOCATION
      ?auto_178973 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178969 ?auto_178971 ) ( TRUCK-AT ?auto_178971 ?auto_178972 ) ( IN-CITY ?auto_178972 ?auto_178973 ) ( IN-CITY ?auto_178970 ?auto_178973 ) ( not ( = ?auto_178970 ?auto_178972 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_178971 ?auto_178972 ?auto_178970 ?auto_178973 )
      ( DELIVER-1PKG ?auto_178969 ?auto_178970 )
      ( DELIVER-1PKG-VERIFY ?auto_178969 ?auto_178970 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_178995 - OBJ
      ?auto_178996 - LOCATION
    )
    :vars
    (
      ?auto_178997 - TRUCK
      ?auto_178998 - LOCATION
      ?auto_178999 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178997 ?auto_178998 ) ( IN-CITY ?auto_178998 ?auto_178999 ) ( IN-CITY ?auto_178996 ?auto_178999 ) ( not ( = ?auto_178996 ?auto_178998 ) ) ( OBJ-AT ?auto_178995 ?auto_178998 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_178995 ?auto_178997 ?auto_178998 )
      ( DELIVER-1PKG ?auto_178995 ?auto_178996 )
      ( DELIVER-1PKG-VERIFY ?auto_178995 ?auto_178996 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_179021 - OBJ
      ?auto_179022 - LOCATION
    )
    :vars
    (
      ?auto_179025 - LOCATION
      ?auto_179023 - CITY
      ?auto_179024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179025 ?auto_179023 ) ( IN-CITY ?auto_179022 ?auto_179023 ) ( not ( = ?auto_179022 ?auto_179025 ) ) ( OBJ-AT ?auto_179021 ?auto_179025 ) ( TRUCK-AT ?auto_179024 ?auto_179022 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_179024 ?auto_179022 ?auto_179025 ?auto_179023 )
      ( DELIVER-1PKG ?auto_179021 ?auto_179022 )
      ( DELIVER-1PKG-VERIFY ?auto_179021 ?auto_179022 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179164 - OBJ
      ?auto_179166 - OBJ
      ?auto_179165 - LOCATION
    )
    :vars
    (
      ?auto_179167 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179166 ?auto_179164 ) ( TRUCK-AT ?auto_179167 ?auto_179165 ) ( IN-TRUCK ?auto_179166 ?auto_179167 ) ( OBJ-AT ?auto_179164 ?auto_179165 ) ( not ( = ?auto_179164 ?auto_179166 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179166 ?auto_179165 )
      ( DELIVER-2PKG-VERIFY ?auto_179164 ?auto_179166 ?auto_179165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179306 - OBJ
      ?auto_179308 - OBJ
      ?auto_179307 - LOCATION
    )
    :vars
    (
      ?auto_179311 - TRUCK
      ?auto_179309 - LOCATION
      ?auto_179310 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179308 ?auto_179306 ) ( IN-TRUCK ?auto_179308 ?auto_179311 ) ( TRUCK-AT ?auto_179311 ?auto_179309 ) ( IN-CITY ?auto_179309 ?auto_179310 ) ( IN-CITY ?auto_179307 ?auto_179310 ) ( not ( = ?auto_179307 ?auto_179309 ) ) ( OBJ-AT ?auto_179306 ?auto_179307 ) ( not ( = ?auto_179306 ?auto_179308 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179308 ?auto_179307 )
      ( DELIVER-2PKG-VERIFY ?auto_179306 ?auto_179308 ?auto_179307 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_179496 - OBJ
      ?auto_179497 - LOCATION
    )
    :vars
    (
      ?auto_179499 - OBJ
      ?auto_179500 - TRUCK
      ?auto_179498 - LOCATION
      ?auto_179501 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179496 ?auto_179499 ) ( TRUCK-AT ?auto_179500 ?auto_179498 ) ( IN-CITY ?auto_179498 ?auto_179501 ) ( IN-CITY ?auto_179497 ?auto_179501 ) ( not ( = ?auto_179497 ?auto_179498 ) ) ( OBJ-AT ?auto_179499 ?auto_179497 ) ( not ( = ?auto_179499 ?auto_179496 ) ) ( OBJ-AT ?auto_179496 ?auto_179498 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_179496 ?auto_179500 ?auto_179498 )
      ( DELIVER-2PKG ?auto_179499 ?auto_179496 ?auto_179497 )
      ( DELIVER-1PKG-VERIFY ?auto_179496 ?auto_179497 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179502 - OBJ
      ?auto_179504 - OBJ
      ?auto_179503 - LOCATION
    )
    :vars
    (
      ?auto_179506 - TRUCK
      ?auto_179507 - LOCATION
      ?auto_179505 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179504 ?auto_179502 ) ( TRUCK-AT ?auto_179506 ?auto_179507 ) ( IN-CITY ?auto_179507 ?auto_179505 ) ( IN-CITY ?auto_179503 ?auto_179505 ) ( not ( = ?auto_179503 ?auto_179507 ) ) ( OBJ-AT ?auto_179502 ?auto_179503 ) ( not ( = ?auto_179502 ?auto_179504 ) ) ( OBJ-AT ?auto_179504 ?auto_179507 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179504 ?auto_179503 )
      ( DELIVER-2PKG-VERIFY ?auto_179502 ?auto_179504 ?auto_179503 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_179692 - OBJ
      ?auto_179693 - LOCATION
    )
    :vars
    (
      ?auto_179694 - OBJ
      ?auto_179695 - LOCATION
      ?auto_179697 - CITY
      ?auto_179696 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179692 ?auto_179694 ) ( IN-CITY ?auto_179695 ?auto_179697 ) ( IN-CITY ?auto_179693 ?auto_179697 ) ( not ( = ?auto_179693 ?auto_179695 ) ) ( OBJ-AT ?auto_179694 ?auto_179693 ) ( not ( = ?auto_179694 ?auto_179692 ) ) ( OBJ-AT ?auto_179692 ?auto_179695 ) ( TRUCK-AT ?auto_179696 ?auto_179693 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_179696 ?auto_179693 ?auto_179695 ?auto_179697 )
      ( DELIVER-2PKG ?auto_179694 ?auto_179692 ?auto_179693 )
      ( DELIVER-1PKG-VERIFY ?auto_179692 ?auto_179693 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179698 - OBJ
      ?auto_179700 - OBJ
      ?auto_179699 - LOCATION
    )
    :vars
    (
      ?auto_179701 - LOCATION
      ?auto_179702 - CITY
      ?auto_179703 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179700 ?auto_179698 ) ( IN-CITY ?auto_179701 ?auto_179702 ) ( IN-CITY ?auto_179699 ?auto_179702 ) ( not ( = ?auto_179699 ?auto_179701 ) ) ( OBJ-AT ?auto_179698 ?auto_179699 ) ( not ( = ?auto_179698 ?auto_179700 ) ) ( OBJ-AT ?auto_179700 ?auto_179701 ) ( TRUCK-AT ?auto_179703 ?auto_179699 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179700 ?auto_179699 )
      ( DELIVER-2PKG-VERIFY ?auto_179698 ?auto_179700 ?auto_179699 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_179888 - OBJ
      ?auto_179889 - LOCATION
    )
    :vars
    (
      ?auto_179892 - OBJ
      ?auto_179891 - LOCATION
      ?auto_179893 - CITY
      ?auto_179890 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179888 ?auto_179892 ) ( IN-CITY ?auto_179891 ?auto_179893 ) ( IN-CITY ?auto_179889 ?auto_179893 ) ( not ( = ?auto_179889 ?auto_179891 ) ) ( not ( = ?auto_179892 ?auto_179888 ) ) ( OBJ-AT ?auto_179888 ?auto_179891 ) ( TRUCK-AT ?auto_179890 ?auto_179889 ) ( IN-TRUCK ?auto_179892 ?auto_179890 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179892 ?auto_179889 )
      ( DELIVER-2PKG ?auto_179892 ?auto_179888 ?auto_179889 )
      ( DELIVER-1PKG-VERIFY ?auto_179888 ?auto_179889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179894 - OBJ
      ?auto_179896 - OBJ
      ?auto_179895 - LOCATION
    )
    :vars
    (
      ?auto_179897 - LOCATION
      ?auto_179898 - CITY
      ?auto_179899 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179896 ?auto_179894 ) ( IN-CITY ?auto_179897 ?auto_179898 ) ( IN-CITY ?auto_179895 ?auto_179898 ) ( not ( = ?auto_179895 ?auto_179897 ) ) ( not ( = ?auto_179894 ?auto_179896 ) ) ( OBJ-AT ?auto_179896 ?auto_179897 ) ( TRUCK-AT ?auto_179899 ?auto_179895 ) ( IN-TRUCK ?auto_179894 ?auto_179899 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179896 ?auto_179895 )
      ( DELIVER-2PKG-VERIFY ?auto_179894 ?auto_179896 ?auto_179895 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_180084 - OBJ
      ?auto_180085 - LOCATION
    )
    :vars
    (
      ?auto_180089 - OBJ
      ?auto_180086 - LOCATION
      ?auto_180088 - CITY
      ?auto_180087 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_180084 ?auto_180089 ) ( IN-CITY ?auto_180086 ?auto_180088 ) ( IN-CITY ?auto_180085 ?auto_180088 ) ( not ( = ?auto_180085 ?auto_180086 ) ) ( not ( = ?auto_180089 ?auto_180084 ) ) ( OBJ-AT ?auto_180084 ?auto_180086 ) ( IN-TRUCK ?auto_180089 ?auto_180087 ) ( TRUCK-AT ?auto_180087 ?auto_180086 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_180087 ?auto_180086 ?auto_180085 ?auto_180088 )
      ( DELIVER-2PKG ?auto_180089 ?auto_180084 ?auto_180085 )
      ( DELIVER-1PKG-VERIFY ?auto_180084 ?auto_180085 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180090 - OBJ
      ?auto_180092 - OBJ
      ?auto_180091 - LOCATION
    )
    :vars
    (
      ?auto_180094 - LOCATION
      ?auto_180095 - CITY
      ?auto_180093 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_180092 ?auto_180090 ) ( IN-CITY ?auto_180094 ?auto_180095 ) ( IN-CITY ?auto_180091 ?auto_180095 ) ( not ( = ?auto_180091 ?auto_180094 ) ) ( not ( = ?auto_180090 ?auto_180092 ) ) ( OBJ-AT ?auto_180092 ?auto_180094 ) ( IN-TRUCK ?auto_180090 ?auto_180093 ) ( TRUCK-AT ?auto_180093 ?auto_180094 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_180092 ?auto_180091 )
      ( DELIVER-2PKG-VERIFY ?auto_180090 ?auto_180092 ?auto_180091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181103 - OBJ
      ?auto_181105 - OBJ
      ?auto_181106 - OBJ
      ?auto_181104 - LOCATION
    )
    :vars
    (
      ?auto_181107 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_181105 ?auto_181103 ) ( GREATER-THAN ?auto_181106 ?auto_181103 ) ( GREATER-THAN ?auto_181106 ?auto_181105 ) ( TRUCK-AT ?auto_181107 ?auto_181104 ) ( IN-TRUCK ?auto_181106 ?auto_181107 ) ( OBJ-AT ?auto_181103 ?auto_181104 ) ( OBJ-AT ?auto_181105 ?auto_181104 ) ( not ( = ?auto_181103 ?auto_181105 ) ) ( not ( = ?auto_181103 ?auto_181106 ) ) ( not ( = ?auto_181105 ?auto_181106 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_181106 ?auto_181104 )
      ( DELIVER-3PKG-VERIFY ?auto_181103 ?auto_181105 ?auto_181106 ?auto_181104 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181624 - OBJ
      ?auto_181626 - OBJ
      ?auto_181627 - OBJ
      ?auto_181625 - LOCATION
    )
    :vars
    (
      ?auto_181628 - TRUCK
      ?auto_181630 - LOCATION
      ?auto_181629 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_181626 ?auto_181624 ) ( GREATER-THAN ?auto_181627 ?auto_181624 ) ( GREATER-THAN ?auto_181627 ?auto_181626 ) ( IN-TRUCK ?auto_181627 ?auto_181628 ) ( TRUCK-AT ?auto_181628 ?auto_181630 ) ( IN-CITY ?auto_181630 ?auto_181629 ) ( IN-CITY ?auto_181625 ?auto_181629 ) ( not ( = ?auto_181625 ?auto_181630 ) ) ( OBJ-AT ?auto_181624 ?auto_181625 ) ( not ( = ?auto_181624 ?auto_181627 ) ) ( OBJ-AT ?auto_181626 ?auto_181625 ) ( not ( = ?auto_181624 ?auto_181626 ) ) ( not ( = ?auto_181626 ?auto_181627 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181624 ?auto_181627 ?auto_181625 )
      ( DELIVER-3PKG-VERIFY ?auto_181624 ?auto_181626 ?auto_181627 ?auto_181625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_182334 - OBJ
      ?auto_182336 - OBJ
      ?auto_182337 - OBJ
      ?auto_182335 - LOCATION
    )
    :vars
    (
      ?auto_182340 - TRUCK
      ?auto_182339 - LOCATION
      ?auto_182338 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_182336 ?auto_182334 ) ( GREATER-THAN ?auto_182337 ?auto_182334 ) ( GREATER-THAN ?auto_182337 ?auto_182336 ) ( TRUCK-AT ?auto_182340 ?auto_182339 ) ( IN-CITY ?auto_182339 ?auto_182338 ) ( IN-CITY ?auto_182335 ?auto_182338 ) ( not ( = ?auto_182335 ?auto_182339 ) ) ( OBJ-AT ?auto_182334 ?auto_182335 ) ( not ( = ?auto_182334 ?auto_182337 ) ) ( OBJ-AT ?auto_182337 ?auto_182339 ) ( OBJ-AT ?auto_182336 ?auto_182335 ) ( not ( = ?auto_182334 ?auto_182336 ) ) ( not ( = ?auto_182336 ?auto_182337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182334 ?auto_182337 ?auto_182335 )
      ( DELIVER-3PKG-VERIFY ?auto_182334 ?auto_182336 ?auto_182337 ?auto_182335 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183044 - OBJ
      ?auto_183046 - OBJ
      ?auto_183047 - OBJ
      ?auto_183045 - LOCATION
    )
    :vars
    (
      ?auto_183050 - LOCATION
      ?auto_183049 - CITY
      ?auto_183048 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_183046 ?auto_183044 ) ( GREATER-THAN ?auto_183047 ?auto_183044 ) ( GREATER-THAN ?auto_183047 ?auto_183046 ) ( IN-CITY ?auto_183050 ?auto_183049 ) ( IN-CITY ?auto_183045 ?auto_183049 ) ( not ( = ?auto_183045 ?auto_183050 ) ) ( OBJ-AT ?auto_183044 ?auto_183045 ) ( not ( = ?auto_183044 ?auto_183047 ) ) ( OBJ-AT ?auto_183047 ?auto_183050 ) ( TRUCK-AT ?auto_183048 ?auto_183045 ) ( OBJ-AT ?auto_183046 ?auto_183045 ) ( not ( = ?auto_183044 ?auto_183046 ) ) ( not ( = ?auto_183046 ?auto_183047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183044 ?auto_183047 ?auto_183045 )
      ( DELIVER-3PKG-VERIFY ?auto_183044 ?auto_183046 ?auto_183047 ?auto_183045 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_184419 - OBJ
      ?auto_184420 - LOCATION
    )
    :vars
    (
      ?auto_184423 - OBJ
      ?auto_184421 - LOCATION
      ?auto_184422 - CITY
      ?auto_184424 - TRUCK
      ?auto_184425 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_184419 ?auto_184423 ) ( IN-CITY ?auto_184421 ?auto_184422 ) ( IN-CITY ?auto_184420 ?auto_184422 ) ( not ( = ?auto_184420 ?auto_184421 ) ) ( OBJ-AT ?auto_184423 ?auto_184420 ) ( not ( = ?auto_184423 ?auto_184419 ) ) ( OBJ-AT ?auto_184419 ?auto_184421 ) ( TRUCK-AT ?auto_184424 ?auto_184425 ) ( IN-CITY ?auto_184425 ?auto_184422 ) ( not ( = ?auto_184420 ?auto_184425 ) ) ( not ( = ?auto_184421 ?auto_184425 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_184424 ?auto_184425 ?auto_184420 ?auto_184422 )
      ( DELIVER-2PKG ?auto_184423 ?auto_184419 ?auto_184420 )
      ( DELIVER-1PKG-VERIFY ?auto_184419 ?auto_184420 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_184426 - OBJ
      ?auto_184428 - OBJ
      ?auto_184427 - LOCATION
    )
    :vars
    (
      ?auto_184432 - LOCATION
      ?auto_184429 - CITY
      ?auto_184431 - TRUCK
      ?auto_184430 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_184428 ?auto_184426 ) ( IN-CITY ?auto_184432 ?auto_184429 ) ( IN-CITY ?auto_184427 ?auto_184429 ) ( not ( = ?auto_184427 ?auto_184432 ) ) ( OBJ-AT ?auto_184426 ?auto_184427 ) ( not ( = ?auto_184426 ?auto_184428 ) ) ( OBJ-AT ?auto_184428 ?auto_184432 ) ( TRUCK-AT ?auto_184431 ?auto_184430 ) ( IN-CITY ?auto_184430 ?auto_184429 ) ( not ( = ?auto_184427 ?auto_184430 ) ) ( not ( = ?auto_184432 ?auto_184430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_184428 ?auto_184427 )
      ( DELIVER-2PKG-VERIFY ?auto_184426 ?auto_184428 ?auto_184427 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_187432 - OBJ
      ?auto_187433 - LOCATION
    )
    :vars
    (
      ?auto_187437 - OBJ
      ?auto_187436 - LOCATION
      ?auto_187435 - CITY
      ?auto_187434 - TRUCK
      ?auto_187438 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_187432 ?auto_187437 ) ( IN-CITY ?auto_187436 ?auto_187435 ) ( IN-CITY ?auto_187433 ?auto_187435 ) ( not ( = ?auto_187433 ?auto_187436 ) ) ( not ( = ?auto_187437 ?auto_187432 ) ) ( OBJ-AT ?auto_187432 ?auto_187436 ) ( IN-TRUCK ?auto_187437 ?auto_187434 ) ( TRUCK-AT ?auto_187434 ?auto_187438 ) ( IN-CITY ?auto_187438 ?auto_187435 ) ( not ( = ?auto_187433 ?auto_187438 ) ) ( not ( = ?auto_187436 ?auto_187438 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_187434 ?auto_187438 ?auto_187433 ?auto_187435 )
      ( DELIVER-2PKG ?auto_187437 ?auto_187432 ?auto_187433 )
      ( DELIVER-1PKG-VERIFY ?auto_187432 ?auto_187433 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_187439 - OBJ
      ?auto_187441 - OBJ
      ?auto_187440 - LOCATION
    )
    :vars
    (
      ?auto_187443 - LOCATION
      ?auto_187444 - CITY
      ?auto_187445 - TRUCK
      ?auto_187442 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_187441 ?auto_187439 ) ( IN-CITY ?auto_187443 ?auto_187444 ) ( IN-CITY ?auto_187440 ?auto_187444 ) ( not ( = ?auto_187440 ?auto_187443 ) ) ( not ( = ?auto_187439 ?auto_187441 ) ) ( OBJ-AT ?auto_187441 ?auto_187443 ) ( IN-TRUCK ?auto_187439 ?auto_187445 ) ( TRUCK-AT ?auto_187445 ?auto_187442 ) ( IN-CITY ?auto_187442 ?auto_187444 ) ( not ( = ?auto_187440 ?auto_187442 ) ) ( not ( = ?auto_187443 ?auto_187442 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_187441 ?auto_187440 )
      ( DELIVER-2PKG-VERIFY ?auto_187439 ?auto_187441 ?auto_187440 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_188236 - OBJ
      ?auto_188237 - LOCATION
    )
    :vars
    (
      ?auto_188239 - OBJ
      ?auto_188241 - LOCATION
      ?auto_188238 - CITY
      ?auto_188242 - TRUCK
      ?auto_188240 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_188236 ?auto_188239 ) ( IN-CITY ?auto_188241 ?auto_188238 ) ( IN-CITY ?auto_188237 ?auto_188238 ) ( not ( = ?auto_188237 ?auto_188241 ) ) ( not ( = ?auto_188239 ?auto_188236 ) ) ( OBJ-AT ?auto_188236 ?auto_188241 ) ( TRUCK-AT ?auto_188242 ?auto_188240 ) ( IN-CITY ?auto_188240 ?auto_188238 ) ( not ( = ?auto_188237 ?auto_188240 ) ) ( not ( = ?auto_188241 ?auto_188240 ) ) ( OBJ-AT ?auto_188239 ?auto_188240 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_188239 ?auto_188242 ?auto_188240 )
      ( DELIVER-2PKG ?auto_188239 ?auto_188236 ?auto_188237 )
      ( DELIVER-1PKG-VERIFY ?auto_188236 ?auto_188237 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188243 - OBJ
      ?auto_188245 - OBJ
      ?auto_188244 - LOCATION
    )
    :vars
    (
      ?auto_188247 - LOCATION
      ?auto_188249 - CITY
      ?auto_188246 - TRUCK
      ?auto_188248 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_188245 ?auto_188243 ) ( IN-CITY ?auto_188247 ?auto_188249 ) ( IN-CITY ?auto_188244 ?auto_188249 ) ( not ( = ?auto_188244 ?auto_188247 ) ) ( not ( = ?auto_188243 ?auto_188245 ) ) ( OBJ-AT ?auto_188245 ?auto_188247 ) ( TRUCK-AT ?auto_188246 ?auto_188248 ) ( IN-CITY ?auto_188248 ?auto_188249 ) ( not ( = ?auto_188244 ?auto_188248 ) ) ( not ( = ?auto_188247 ?auto_188248 ) ) ( OBJ-AT ?auto_188243 ?auto_188248 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188245 ?auto_188244 )
      ( DELIVER-2PKG-VERIFY ?auto_188243 ?auto_188245 ?auto_188244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191032 - OBJ
      ?auto_191034 - OBJ
      ?auto_191035 - OBJ
      ?auto_191036 - OBJ
      ?auto_191033 - LOCATION
    )
    :vars
    (
      ?auto_191037 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_191034 ?auto_191032 ) ( GREATER-THAN ?auto_191035 ?auto_191032 ) ( GREATER-THAN ?auto_191035 ?auto_191034 ) ( GREATER-THAN ?auto_191036 ?auto_191032 ) ( GREATER-THAN ?auto_191036 ?auto_191034 ) ( GREATER-THAN ?auto_191036 ?auto_191035 ) ( TRUCK-AT ?auto_191037 ?auto_191033 ) ( IN-TRUCK ?auto_191036 ?auto_191037 ) ( OBJ-AT ?auto_191032 ?auto_191033 ) ( OBJ-AT ?auto_191034 ?auto_191033 ) ( OBJ-AT ?auto_191035 ?auto_191033 ) ( not ( = ?auto_191032 ?auto_191034 ) ) ( not ( = ?auto_191032 ?auto_191035 ) ) ( not ( = ?auto_191032 ?auto_191036 ) ) ( not ( = ?auto_191034 ?auto_191035 ) ) ( not ( = ?auto_191034 ?auto_191036 ) ) ( not ( = ?auto_191035 ?auto_191036 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_191036 ?auto_191033 )
      ( DELIVER-4PKG-VERIFY ?auto_191032 ?auto_191034 ?auto_191035 ?auto_191036 ?auto_191033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192415 - OBJ
      ?auto_192417 - OBJ
      ?auto_192418 - OBJ
      ?auto_192419 - OBJ
      ?auto_192416 - LOCATION
    )
    :vars
    (
      ?auto_192420 - TRUCK
      ?auto_192422 - LOCATION
      ?auto_192421 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_192417 ?auto_192415 ) ( GREATER-THAN ?auto_192418 ?auto_192415 ) ( GREATER-THAN ?auto_192418 ?auto_192417 ) ( GREATER-THAN ?auto_192419 ?auto_192415 ) ( GREATER-THAN ?auto_192419 ?auto_192417 ) ( GREATER-THAN ?auto_192419 ?auto_192418 ) ( IN-TRUCK ?auto_192419 ?auto_192420 ) ( TRUCK-AT ?auto_192420 ?auto_192422 ) ( IN-CITY ?auto_192422 ?auto_192421 ) ( IN-CITY ?auto_192416 ?auto_192421 ) ( not ( = ?auto_192416 ?auto_192422 ) ) ( OBJ-AT ?auto_192415 ?auto_192416 ) ( not ( = ?auto_192415 ?auto_192419 ) ) ( OBJ-AT ?auto_192417 ?auto_192416 ) ( OBJ-AT ?auto_192418 ?auto_192416 ) ( not ( = ?auto_192415 ?auto_192417 ) ) ( not ( = ?auto_192415 ?auto_192418 ) ) ( not ( = ?auto_192417 ?auto_192418 ) ) ( not ( = ?auto_192417 ?auto_192419 ) ) ( not ( = ?auto_192418 ?auto_192419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192415 ?auto_192419 ?auto_192416 )
      ( DELIVER-4PKG-VERIFY ?auto_192415 ?auto_192417 ?auto_192418 ?auto_192419 ?auto_192416 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194196 - OBJ
      ?auto_194198 - OBJ
      ?auto_194199 - OBJ
      ?auto_194200 - OBJ
      ?auto_194197 - LOCATION
    )
    :vars
    (
      ?auto_194201 - TRUCK
      ?auto_194202 - LOCATION
      ?auto_194203 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_194198 ?auto_194196 ) ( GREATER-THAN ?auto_194199 ?auto_194196 ) ( GREATER-THAN ?auto_194199 ?auto_194198 ) ( GREATER-THAN ?auto_194200 ?auto_194196 ) ( GREATER-THAN ?auto_194200 ?auto_194198 ) ( GREATER-THAN ?auto_194200 ?auto_194199 ) ( TRUCK-AT ?auto_194201 ?auto_194202 ) ( IN-CITY ?auto_194202 ?auto_194203 ) ( IN-CITY ?auto_194197 ?auto_194203 ) ( not ( = ?auto_194197 ?auto_194202 ) ) ( OBJ-AT ?auto_194196 ?auto_194197 ) ( not ( = ?auto_194196 ?auto_194200 ) ) ( OBJ-AT ?auto_194200 ?auto_194202 ) ( OBJ-AT ?auto_194198 ?auto_194197 ) ( OBJ-AT ?auto_194199 ?auto_194197 ) ( not ( = ?auto_194196 ?auto_194198 ) ) ( not ( = ?auto_194196 ?auto_194199 ) ) ( not ( = ?auto_194198 ?auto_194199 ) ) ( not ( = ?auto_194198 ?auto_194200 ) ) ( not ( = ?auto_194199 ?auto_194200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194196 ?auto_194200 ?auto_194197 )
      ( DELIVER-4PKG-VERIFY ?auto_194196 ?auto_194198 ?auto_194199 ?auto_194200 ?auto_194197 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195977 - OBJ
      ?auto_195979 - OBJ
      ?auto_195980 - OBJ
      ?auto_195981 - OBJ
      ?auto_195978 - LOCATION
    )
    :vars
    (
      ?auto_195984 - LOCATION
      ?auto_195982 - CITY
      ?auto_195983 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_195979 ?auto_195977 ) ( GREATER-THAN ?auto_195980 ?auto_195977 ) ( GREATER-THAN ?auto_195980 ?auto_195979 ) ( GREATER-THAN ?auto_195981 ?auto_195977 ) ( GREATER-THAN ?auto_195981 ?auto_195979 ) ( GREATER-THAN ?auto_195981 ?auto_195980 ) ( IN-CITY ?auto_195984 ?auto_195982 ) ( IN-CITY ?auto_195978 ?auto_195982 ) ( not ( = ?auto_195978 ?auto_195984 ) ) ( OBJ-AT ?auto_195977 ?auto_195978 ) ( not ( = ?auto_195977 ?auto_195981 ) ) ( OBJ-AT ?auto_195981 ?auto_195984 ) ( TRUCK-AT ?auto_195983 ?auto_195978 ) ( OBJ-AT ?auto_195979 ?auto_195978 ) ( OBJ-AT ?auto_195980 ?auto_195978 ) ( not ( = ?auto_195977 ?auto_195979 ) ) ( not ( = ?auto_195977 ?auto_195980 ) ) ( not ( = ?auto_195979 ?auto_195980 ) ) ( not ( = ?auto_195979 ?auto_195981 ) ) ( not ( = ?auto_195980 ?auto_195981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195977 ?auto_195981 ?auto_195978 )
      ( DELIVER-4PKG-VERIFY ?auto_195977 ?auto_195979 ?auto_195980 ?auto_195981 ?auto_195978 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_199216 - OBJ
      ?auto_199218 - OBJ
      ?auto_199219 - OBJ
      ?auto_199217 - LOCATION
    )
    :vars
    (
      ?auto_199222 - LOCATION
      ?auto_199220 - CITY
      ?auto_199221 - TRUCK
      ?auto_199223 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_199218 ?auto_199216 ) ( GREATER-THAN ?auto_199219 ?auto_199216 ) ( GREATER-THAN ?auto_199219 ?auto_199218 ) ( IN-CITY ?auto_199222 ?auto_199220 ) ( IN-CITY ?auto_199217 ?auto_199220 ) ( not ( = ?auto_199217 ?auto_199222 ) ) ( OBJ-AT ?auto_199216 ?auto_199217 ) ( not ( = ?auto_199216 ?auto_199219 ) ) ( OBJ-AT ?auto_199219 ?auto_199222 ) ( TRUCK-AT ?auto_199221 ?auto_199223 ) ( IN-CITY ?auto_199223 ?auto_199220 ) ( not ( = ?auto_199217 ?auto_199223 ) ) ( not ( = ?auto_199222 ?auto_199223 ) ) ( OBJ-AT ?auto_199218 ?auto_199217 ) ( not ( = ?auto_199216 ?auto_199218 ) ) ( not ( = ?auto_199218 ?auto_199219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_199216 ?auto_199219 ?auto_199217 )
      ( DELIVER-3PKG-VERIFY ?auto_199216 ?auto_199218 ?auto_199219 ?auto_199217 ) )
  )

)

