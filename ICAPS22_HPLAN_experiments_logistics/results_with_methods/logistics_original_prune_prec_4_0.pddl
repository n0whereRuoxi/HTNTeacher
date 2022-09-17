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
      ?auto_25397 - OBJ
      ?auto_25398 - LOCATION
    )
    :vars
    (
      ?auto_25399 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_25399 ?auto_25398 ) ( IN-TRUCK ?auto_25397 ?auto_25399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_25397 ?auto_25399 ?auto_25398 )
      ( DELIVER-1PKG-VERIFY ?auto_25397 ?auto_25398 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_25423 - OBJ
      ?auto_25424 - LOCATION
    )
    :vars
    (
      ?auto_25427 - TRUCK
      ?auto_25429 - LOCATION
      ?auto_25430 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_25423 ?auto_25427 ) ( TRUCK-AT ?auto_25427 ?auto_25429 ) ( IN-CITY ?auto_25429 ?auto_25430 ) ( IN-CITY ?auto_25424 ?auto_25430 ) ( not ( = ?auto_25424 ?auto_25429 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_25427 ?auto_25429 ?auto_25424 ?auto_25430 )
      ( DELIVER-1PKG ?auto_25423 ?auto_25424 )
      ( DELIVER-1PKG-VERIFY ?auto_25423 ?auto_25424 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_25459 - OBJ
      ?auto_25460 - LOCATION
    )
    :vars
    (
      ?auto_25461 - TRUCK
      ?auto_25464 - LOCATION
      ?auto_25463 - CITY
      ?auto_25467 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_25461 ?auto_25464 ) ( IN-CITY ?auto_25464 ?auto_25463 ) ( IN-CITY ?auto_25460 ?auto_25463 ) ( not ( = ?auto_25460 ?auto_25464 ) ) ( TRUCK-AT ?auto_25461 ?auto_25467 ) ( OBJ-AT ?auto_25459 ?auto_25467 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_25459 ?auto_25461 ?auto_25467 )
      ( DELIVER-1PKG ?auto_25459 ?auto_25460 )
      ( DELIVER-1PKG-VERIFY ?auto_25459 ?auto_25460 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_25499 - OBJ
      ?auto_25500 - LOCATION
    )
    :vars
    (
      ?auto_25506 - LOCATION
      ?auto_25502 - CITY
      ?auto_25505 - TRUCK
      ?auto_25508 - LOCATION
      ?auto_25509 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_25506 ?auto_25502 ) ( IN-CITY ?auto_25500 ?auto_25502 ) ( not ( = ?auto_25500 ?auto_25506 ) ) ( OBJ-AT ?auto_25499 ?auto_25506 ) ( TRUCK-AT ?auto_25505 ?auto_25508 ) ( IN-CITY ?auto_25508 ?auto_25509 ) ( IN-CITY ?auto_25506 ?auto_25509 ) ( not ( = ?auto_25506 ?auto_25508 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_25505 ?auto_25508 ?auto_25506 ?auto_25509 )
      ( DELIVER-1PKG ?auto_25499 ?auto_25500 )
      ( DELIVER-1PKG-VERIFY ?auto_25499 ?auto_25500 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25663 - OBJ
      ?auto_25665 - OBJ
      ?auto_25664 - LOCATION
    )
    :vars
    (
      ?auto_25668 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_25665 ?auto_25663 ) ( TRUCK-AT ?auto_25668 ?auto_25664 ) ( IN-TRUCK ?auto_25665 ?auto_25668 ) ( OBJ-AT ?auto_25663 ?auto_25664 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_25665 ?auto_25664 )
      ( DELIVER-2PKG-VERIFY ?auto_25663 ?auto_25665 ?auto_25664 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25859 - OBJ
      ?auto_25861 - OBJ
      ?auto_25860 - LOCATION
    )
    :vars
    (
      ?auto_25865 - TRUCK
      ?auto_25866 - LOCATION
      ?auto_25862 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_25861 ?auto_25859 ) ( IN-TRUCK ?auto_25861 ?auto_25865 ) ( TRUCK-AT ?auto_25865 ?auto_25866 ) ( IN-CITY ?auto_25866 ?auto_25862 ) ( IN-CITY ?auto_25860 ?auto_25862 ) ( not ( = ?auto_25860 ?auto_25866 ) ) ( OBJ-AT ?auto_25859 ?auto_25860 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_25861 ?auto_25860 )
      ( DELIVER-2PKG-VERIFY ?auto_25859 ?auto_25861 ?auto_25860 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_26120 - OBJ
      ?auto_26121 - LOCATION
    )
    :vars
    (
      ?auto_26123 - OBJ
      ?auto_26127 - TRUCK
      ?auto_26125 - LOCATION
      ?auto_26126 - CITY
      ?auto_26129 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26120 ?auto_26123 ) ( TRUCK-AT ?auto_26127 ?auto_26125 ) ( IN-CITY ?auto_26125 ?auto_26126 ) ( IN-CITY ?auto_26121 ?auto_26126 ) ( not ( = ?auto_26121 ?auto_26125 ) ) ( OBJ-AT ?auto_26123 ?auto_26121 ) ( TRUCK-AT ?auto_26127 ?auto_26129 ) ( OBJ-AT ?auto_26120 ?auto_26129 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_26120 ?auto_26127 ?auto_26129 )
      ( DELIVER-2PKG ?auto_26123 ?auto_26120 ?auto_26121 )
      ( DELIVER-1PKG-VERIFY ?auto_26120 ?auto_26121 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26131 - OBJ
      ?auto_26133 - OBJ
      ?auto_26132 - LOCATION
    )
    :vars
    (
      ?auto_26140 - OBJ
      ?auto_26134 - TRUCK
      ?auto_26138 - LOCATION
      ?auto_26139 - CITY
      ?auto_26136 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26133 ?auto_26131 ) ( GREATER-THAN ?auto_26133 ?auto_26140 ) ( TRUCK-AT ?auto_26134 ?auto_26138 ) ( IN-CITY ?auto_26138 ?auto_26139 ) ( IN-CITY ?auto_26132 ?auto_26139 ) ( not ( = ?auto_26132 ?auto_26138 ) ) ( OBJ-AT ?auto_26140 ?auto_26132 ) ( TRUCK-AT ?auto_26134 ?auto_26136 ) ( OBJ-AT ?auto_26133 ?auto_26136 ) ( OBJ-AT ?auto_26131 ?auto_26132 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_26133 ?auto_26132 )
      ( DELIVER-2PKG-VERIFY ?auto_26131 ?auto_26133 ?auto_26132 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_26442 - OBJ
      ?auto_26443 - LOCATION
    )
    :vars
    (
      ?auto_26451 - OBJ
      ?auto_26447 - OBJ
      ?auto_26444 - LOCATION
      ?auto_26445 - CITY
      ?auto_26446 - TRUCK
      ?auto_26453 - LOCATION
      ?auto_26454 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26442 ?auto_26451 ) ( GREATER-THAN ?auto_26442 ?auto_26447 ) ( IN-CITY ?auto_26444 ?auto_26445 ) ( IN-CITY ?auto_26443 ?auto_26445 ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( OBJ-AT ?auto_26447 ?auto_26443 ) ( OBJ-AT ?auto_26442 ?auto_26444 ) ( OBJ-AT ?auto_26451 ?auto_26443 ) ( TRUCK-AT ?auto_26446 ?auto_26453 ) ( IN-CITY ?auto_26453 ?auto_26454 ) ( IN-CITY ?auto_26444 ?auto_26454 ) ( not ( = ?auto_26444 ?auto_26453 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_26446 ?auto_26453 ?auto_26444 ?auto_26454 )
      ( DELIVER-2PKG ?auto_26451 ?auto_26442 ?auto_26443 )
      ( DELIVER-1PKG-VERIFY ?auto_26442 ?auto_26443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26456 - OBJ
      ?auto_26458 - OBJ
      ?auto_26457 - LOCATION
    )
    :vars
    (
      ?auto_26460 - OBJ
      ?auto_26466 - OBJ
      ?auto_26465 - LOCATION
      ?auto_26464 - CITY
      ?auto_26459 - TRUCK
      ?auto_26467 - LOCATION
      ?auto_26461 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26458 ?auto_26456 ) ( GREATER-THAN ?auto_26458 ?auto_26460 ) ( GREATER-THAN ?auto_26458 ?auto_26466 ) ( IN-CITY ?auto_26465 ?auto_26464 ) ( IN-CITY ?auto_26457 ?auto_26464 ) ( not ( = ?auto_26457 ?auto_26465 ) ) ( OBJ-AT ?auto_26466 ?auto_26457 ) ( OBJ-AT ?auto_26458 ?auto_26465 ) ( OBJ-AT ?auto_26460 ?auto_26457 ) ( TRUCK-AT ?auto_26459 ?auto_26467 ) ( IN-CITY ?auto_26467 ?auto_26461 ) ( IN-CITY ?auto_26465 ?auto_26461 ) ( not ( = ?auto_26465 ?auto_26467 ) ) ( OBJ-AT ?auto_26456 ?auto_26457 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_26458 ?auto_26457 )
      ( DELIVER-2PKG-VERIFY ?auto_26456 ?auto_26458 ?auto_26457 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_26817 - OBJ
      ?auto_26818 - LOCATION
    )
    :vars
    (
      ?auto_26820 - OBJ
      ?auto_26822 - LOCATION
      ?auto_26824 - CITY
      ?auto_26821 - TRUCK
      ?auto_26823 - LOCATION
      ?auto_26826 - CITY
      ?auto_26831 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26817 ?auto_26820 ) ( IN-CITY ?auto_26822 ?auto_26824 ) ( IN-CITY ?auto_26818 ?auto_26824 ) ( not ( = ?auto_26818 ?auto_26822 ) ) ( OBJ-AT ?auto_26817 ?auto_26822 ) ( TRUCK-AT ?auto_26821 ?auto_26823 ) ( IN-CITY ?auto_26823 ?auto_26826 ) ( IN-CITY ?auto_26822 ?auto_26826 ) ( not ( = ?auto_26822 ?auto_26823 ) ) ( TRUCK-AT ?auto_26831 ?auto_26818 ) ( IN-TRUCK ?auto_26820 ?auto_26831 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_26820 ?auto_26818 )
      ( DELIVER-2PKG ?auto_26820 ?auto_26817 ?auto_26818 )
      ( DELIVER-1PKG-VERIFY ?auto_26817 ?auto_26818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26832 - OBJ
      ?auto_26834 - OBJ
      ?auto_26833 - LOCATION
    )
    :vars
    (
      ?auto_26840 - LOCATION
      ?auto_26841 - CITY
      ?auto_26838 - TRUCK
      ?auto_26839 - LOCATION
      ?auto_26835 - CITY
      ?auto_26837 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_26834 ?auto_26832 ) ( IN-CITY ?auto_26840 ?auto_26841 ) ( IN-CITY ?auto_26833 ?auto_26841 ) ( not ( = ?auto_26833 ?auto_26840 ) ) ( OBJ-AT ?auto_26834 ?auto_26840 ) ( TRUCK-AT ?auto_26838 ?auto_26839 ) ( IN-CITY ?auto_26839 ?auto_26835 ) ( IN-CITY ?auto_26840 ?auto_26835 ) ( not ( = ?auto_26840 ?auto_26839 ) ) ( TRUCK-AT ?auto_26837 ?auto_26833 ) ( IN-TRUCK ?auto_26832 ?auto_26837 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_26834 ?auto_26833 )
      ( DELIVER-2PKG-VERIFY ?auto_26832 ?auto_26834 ?auto_26833 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_27169 - OBJ
      ?auto_27170 - LOCATION
    )
    :vars
    (
      ?auto_27179 - OBJ
      ?auto_27174 - LOCATION
      ?auto_27176 - CITY
      ?auto_27172 - CITY
      ?auto_27171 - TRUCK
      ?auto_27181 - LOCATION
      ?auto_27182 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_27169 ?auto_27179 ) ( IN-CITY ?auto_27174 ?auto_27176 ) ( IN-CITY ?auto_27170 ?auto_27176 ) ( not ( = ?auto_27170 ?auto_27174 ) ) ( OBJ-AT ?auto_27169 ?auto_27174 ) ( IN-CITY ?auto_27170 ?auto_27172 ) ( IN-CITY ?auto_27174 ?auto_27172 ) ( IN-TRUCK ?auto_27179 ?auto_27171 ) ( TRUCK-AT ?auto_27171 ?auto_27181 ) ( IN-CITY ?auto_27181 ?auto_27182 ) ( IN-CITY ?auto_27170 ?auto_27182 ) ( not ( = ?auto_27170 ?auto_27181 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_27171 ?auto_27181 ?auto_27170 ?auto_27182 )
      ( DELIVER-2PKG ?auto_27179 ?auto_27169 ?auto_27170 )
      ( DELIVER-1PKG-VERIFY ?auto_27169 ?auto_27170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_27184 - OBJ
      ?auto_27186 - OBJ
      ?auto_27185 - LOCATION
    )
    :vars
    (
      ?auto_27188 - LOCATION
      ?auto_27189 - CITY
      ?auto_27190 - CITY
      ?auto_27187 - TRUCK
      ?auto_27193 - LOCATION
      ?auto_27195 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_27186 ?auto_27184 ) ( IN-CITY ?auto_27188 ?auto_27189 ) ( IN-CITY ?auto_27185 ?auto_27189 ) ( not ( = ?auto_27185 ?auto_27188 ) ) ( OBJ-AT ?auto_27186 ?auto_27188 ) ( IN-CITY ?auto_27185 ?auto_27190 ) ( IN-CITY ?auto_27188 ?auto_27190 ) ( IN-TRUCK ?auto_27184 ?auto_27187 ) ( TRUCK-AT ?auto_27187 ?auto_27193 ) ( IN-CITY ?auto_27193 ?auto_27195 ) ( IN-CITY ?auto_27185 ?auto_27195 ) ( not ( = ?auto_27185 ?auto_27193 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27186 ?auto_27185 )
      ( DELIVER-2PKG-VERIFY ?auto_27184 ?auto_27186 ?auto_27185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_28531 - OBJ
      ?auto_28533 - OBJ
      ?auto_28534 - OBJ
      ?auto_28532 - LOCATION
    )
    :vars
    (
      ?auto_28536 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_28533 ?auto_28531 ) ( GREATER-THAN ?auto_28534 ?auto_28531 ) ( GREATER-THAN ?auto_28534 ?auto_28533 ) ( TRUCK-AT ?auto_28536 ?auto_28532 ) ( IN-TRUCK ?auto_28534 ?auto_28536 ) ( OBJ-AT ?auto_28531 ?auto_28532 ) ( OBJ-AT ?auto_28533 ?auto_28532 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_28534 ?auto_28532 )
      ( DELIVER-3PKG-VERIFY ?auto_28531 ?auto_28533 ?auto_28534 ?auto_28532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29234 - OBJ
      ?auto_29236 - OBJ
      ?auto_29237 - OBJ
      ?auto_29235 - LOCATION
    )
    :vars
    (
      ?auto_29241 - OBJ
      ?auto_29243 - TRUCK
      ?auto_29239 - LOCATION
      ?auto_29238 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_29236 ?auto_29234 ) ( GREATER-THAN ?auto_29237 ?auto_29234 ) ( GREATER-THAN ?auto_29237 ?auto_29236 ) ( GREATER-THAN ?auto_29237 ?auto_29241 ) ( IN-TRUCK ?auto_29237 ?auto_29243 ) ( TRUCK-AT ?auto_29243 ?auto_29239 ) ( IN-CITY ?auto_29239 ?auto_29238 ) ( IN-CITY ?auto_29235 ?auto_29238 ) ( not ( = ?auto_29235 ?auto_29239 ) ) ( OBJ-AT ?auto_29241 ?auto_29235 ) ( OBJ-AT ?auto_29234 ?auto_29235 ) ( OBJ-AT ?auto_29236 ?auto_29235 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_29241 ?auto_29237 ?auto_29235 )
      ( DELIVER-3PKG-VERIFY ?auto_29234 ?auto_29236 ?auto_29237 ?auto_29235 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30198 - OBJ
      ?auto_30200 - OBJ
      ?auto_30201 - OBJ
      ?auto_30199 - LOCATION
    )
    :vars
    (
      ?auto_30203 - OBJ
      ?auto_30209 - OBJ
      ?auto_30204 - TRUCK
      ?auto_30205 - LOCATION
      ?auto_30208 - CITY
      ?auto_30207 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30200 ?auto_30198 ) ( GREATER-THAN ?auto_30201 ?auto_30198 ) ( GREATER-THAN ?auto_30201 ?auto_30200 ) ( GREATER-THAN ?auto_30201 ?auto_30203 ) ( GREATER-THAN ?auto_30201 ?auto_30209 ) ( TRUCK-AT ?auto_30204 ?auto_30205 ) ( IN-CITY ?auto_30205 ?auto_30208 ) ( IN-CITY ?auto_30199 ?auto_30208 ) ( not ( = ?auto_30199 ?auto_30205 ) ) ( OBJ-AT ?auto_30209 ?auto_30199 ) ( TRUCK-AT ?auto_30204 ?auto_30207 ) ( OBJ-AT ?auto_30201 ?auto_30207 ) ( OBJ-AT ?auto_30203 ?auto_30199 ) ( OBJ-AT ?auto_30198 ?auto_30199 ) ( OBJ-AT ?auto_30200 ?auto_30199 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30203 ?auto_30201 ?auto_30199 )
      ( DELIVER-3PKG-VERIFY ?auto_30198 ?auto_30200 ?auto_30201 ?auto_30199 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_31341 - OBJ
      ?auto_31343 - OBJ
      ?auto_31344 - OBJ
      ?auto_31342 - LOCATION
    )
    :vars
    (
      ?auto_31348 - OBJ
      ?auto_31353 - OBJ
      ?auto_31351 - OBJ
      ?auto_31346 - LOCATION
      ?auto_31354 - CITY
      ?auto_31352 - TRUCK
      ?auto_31350 - LOCATION
      ?auto_31345 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31343 ?auto_31341 ) ( GREATER-THAN ?auto_31344 ?auto_31341 ) ( GREATER-THAN ?auto_31344 ?auto_31343 ) ( GREATER-THAN ?auto_31344 ?auto_31348 ) ( GREATER-THAN ?auto_31344 ?auto_31353 ) ( GREATER-THAN ?auto_31344 ?auto_31351 ) ( IN-CITY ?auto_31346 ?auto_31354 ) ( IN-CITY ?auto_31342 ?auto_31354 ) ( not ( = ?auto_31342 ?auto_31346 ) ) ( OBJ-AT ?auto_31351 ?auto_31342 ) ( OBJ-AT ?auto_31344 ?auto_31346 ) ( OBJ-AT ?auto_31353 ?auto_31342 ) ( TRUCK-AT ?auto_31352 ?auto_31350 ) ( IN-CITY ?auto_31350 ?auto_31345 ) ( IN-CITY ?auto_31346 ?auto_31345 ) ( not ( = ?auto_31346 ?auto_31350 ) ) ( OBJ-AT ?auto_31348 ?auto_31342 ) ( OBJ-AT ?auto_31341 ?auto_31342 ) ( OBJ-AT ?auto_31343 ?auto_31342 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31348 ?auto_31344 ?auto_31342 )
      ( DELIVER-3PKG-VERIFY ?auto_31341 ?auto_31343 ?auto_31344 ?auto_31342 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_40180 - OBJ
      ?auto_40181 - LOCATION
    )
    :vars
    (
      ?auto_40190 - OBJ
      ?auto_40186 - LOCATION
      ?auto_40187 - CITY
      ?auto_40189 - CITY
      ?auto_40185 - TRUCK
      ?auto_40184 - LOCATION
      ?auto_40188 - CITY
      ?auto_40192 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_40180 ?auto_40190 ) ( IN-CITY ?auto_40186 ?auto_40187 ) ( IN-CITY ?auto_40181 ?auto_40187 ) ( not ( = ?auto_40181 ?auto_40186 ) ) ( OBJ-AT ?auto_40180 ?auto_40186 ) ( IN-CITY ?auto_40181 ?auto_40189 ) ( IN-CITY ?auto_40186 ?auto_40189 ) ( TRUCK-AT ?auto_40185 ?auto_40184 ) ( IN-CITY ?auto_40184 ?auto_40188 ) ( IN-CITY ?auto_40181 ?auto_40188 ) ( not ( = ?auto_40181 ?auto_40184 ) ) ( TRUCK-AT ?auto_40185 ?auto_40192 ) ( OBJ-AT ?auto_40190 ?auto_40192 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_40190 ?auto_40185 ?auto_40192 )
      ( DELIVER-2PKG ?auto_40190 ?auto_40180 ?auto_40181 )
      ( DELIVER-1PKG-VERIFY ?auto_40180 ?auto_40181 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_40194 - OBJ
      ?auto_40196 - OBJ
      ?auto_40195 - LOCATION
    )
    :vars
    (
      ?auto_40197 - LOCATION
      ?auto_40199 - CITY
      ?auto_40201 - CITY
      ?auto_40205 - TRUCK
      ?auto_40200 - LOCATION
      ?auto_40198 - CITY
      ?auto_40206 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_40196 ?auto_40194 ) ( IN-CITY ?auto_40197 ?auto_40199 ) ( IN-CITY ?auto_40195 ?auto_40199 ) ( not ( = ?auto_40195 ?auto_40197 ) ) ( OBJ-AT ?auto_40196 ?auto_40197 ) ( IN-CITY ?auto_40195 ?auto_40201 ) ( IN-CITY ?auto_40197 ?auto_40201 ) ( TRUCK-AT ?auto_40205 ?auto_40200 ) ( IN-CITY ?auto_40200 ?auto_40198 ) ( IN-CITY ?auto_40195 ?auto_40198 ) ( not ( = ?auto_40195 ?auto_40200 ) ) ( TRUCK-AT ?auto_40205 ?auto_40206 ) ( OBJ-AT ?auto_40194 ?auto_40206 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_40196 ?auto_40195 )
      ( DELIVER-2PKG-VERIFY ?auto_40194 ?auto_40196 ?auto_40195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43943 - OBJ
      ?auto_43945 - OBJ
      ?auto_43946 - OBJ
      ?auto_43947 - OBJ
      ?auto_43944 - LOCATION
    )
    :vars
    (
      ?auto_43949 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43945 ?auto_43943 ) ( GREATER-THAN ?auto_43946 ?auto_43943 ) ( GREATER-THAN ?auto_43946 ?auto_43945 ) ( GREATER-THAN ?auto_43947 ?auto_43943 ) ( GREATER-THAN ?auto_43947 ?auto_43945 ) ( GREATER-THAN ?auto_43947 ?auto_43946 ) ( TRUCK-AT ?auto_43949 ?auto_43944 ) ( IN-TRUCK ?auto_43947 ?auto_43949 ) ( OBJ-AT ?auto_43943 ?auto_43944 ) ( OBJ-AT ?auto_43945 ?auto_43944 ) ( OBJ-AT ?auto_43946 ?auto_43944 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43947 ?auto_43944 )
      ( DELIVER-4PKG-VERIFY ?auto_43943 ?auto_43945 ?auto_43946 ?auto_43947 ?auto_43944 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45787 - OBJ
      ?auto_45789 - OBJ
      ?auto_45790 - OBJ
      ?auto_45791 - OBJ
      ?auto_45788 - LOCATION
    )
    :vars
    (
      ?auto_45795 - OBJ
      ?auto_45793 - TRUCK
      ?auto_45792 - LOCATION
      ?auto_45797 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_45789 ?auto_45787 ) ( GREATER-THAN ?auto_45790 ?auto_45787 ) ( GREATER-THAN ?auto_45790 ?auto_45789 ) ( GREATER-THAN ?auto_45791 ?auto_45787 ) ( GREATER-THAN ?auto_45791 ?auto_45789 ) ( GREATER-THAN ?auto_45791 ?auto_45790 ) ( GREATER-THAN ?auto_45791 ?auto_45795 ) ( IN-TRUCK ?auto_45791 ?auto_45793 ) ( TRUCK-AT ?auto_45793 ?auto_45792 ) ( IN-CITY ?auto_45792 ?auto_45797 ) ( IN-CITY ?auto_45788 ?auto_45797 ) ( not ( = ?auto_45788 ?auto_45792 ) ) ( OBJ-AT ?auto_45795 ?auto_45788 ) ( OBJ-AT ?auto_45787 ?auto_45788 ) ( OBJ-AT ?auto_45789 ?auto_45788 ) ( OBJ-AT ?auto_45790 ?auto_45788 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45795 ?auto_45791 ?auto_45788 )
      ( DELIVER-4PKG-VERIFY ?auto_45787 ?auto_45789 ?auto_45790 ?auto_45791 ?auto_45788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48229 - OBJ
      ?auto_48231 - OBJ
      ?auto_48232 - OBJ
      ?auto_48233 - OBJ
      ?auto_48230 - LOCATION
    )
    :vars
    (
      ?auto_48235 - OBJ
      ?auto_48237 - OBJ
      ?auto_48236 - TRUCK
      ?auto_48240 - LOCATION
      ?auto_48241 - CITY
      ?auto_48239 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_48231 ?auto_48229 ) ( GREATER-THAN ?auto_48232 ?auto_48229 ) ( GREATER-THAN ?auto_48232 ?auto_48231 ) ( GREATER-THAN ?auto_48233 ?auto_48229 ) ( GREATER-THAN ?auto_48233 ?auto_48231 ) ( GREATER-THAN ?auto_48233 ?auto_48232 ) ( GREATER-THAN ?auto_48233 ?auto_48235 ) ( GREATER-THAN ?auto_48233 ?auto_48237 ) ( TRUCK-AT ?auto_48236 ?auto_48240 ) ( IN-CITY ?auto_48240 ?auto_48241 ) ( IN-CITY ?auto_48230 ?auto_48241 ) ( not ( = ?auto_48230 ?auto_48240 ) ) ( OBJ-AT ?auto_48237 ?auto_48230 ) ( TRUCK-AT ?auto_48236 ?auto_48239 ) ( OBJ-AT ?auto_48233 ?auto_48239 ) ( OBJ-AT ?auto_48235 ?auto_48230 ) ( OBJ-AT ?auto_48229 ?auto_48230 ) ( OBJ-AT ?auto_48231 ?auto_48230 ) ( OBJ-AT ?auto_48232 ?auto_48230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48235 ?auto_48233 ?auto_48230 )
      ( DELIVER-4PKG-VERIFY ?auto_48229 ?auto_48231 ?auto_48232 ?auto_48233 ?auto_48230 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51104 - OBJ
      ?auto_51106 - OBJ
      ?auto_51107 - OBJ
      ?auto_51108 - OBJ
      ?auto_51105 - LOCATION
    )
    :vars
    (
      ?auto_51112 - OBJ
      ?auto_51114 - OBJ
      ?auto_51117 - OBJ
      ?auto_51116 - LOCATION
      ?auto_51118 - CITY
      ?auto_51109 - TRUCK
      ?auto_51110 - LOCATION
      ?auto_51115 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_51106 ?auto_51104 ) ( GREATER-THAN ?auto_51107 ?auto_51104 ) ( GREATER-THAN ?auto_51107 ?auto_51106 ) ( GREATER-THAN ?auto_51108 ?auto_51104 ) ( GREATER-THAN ?auto_51108 ?auto_51106 ) ( GREATER-THAN ?auto_51108 ?auto_51107 ) ( GREATER-THAN ?auto_51108 ?auto_51112 ) ( GREATER-THAN ?auto_51108 ?auto_51114 ) ( GREATER-THAN ?auto_51108 ?auto_51117 ) ( IN-CITY ?auto_51116 ?auto_51118 ) ( IN-CITY ?auto_51105 ?auto_51118 ) ( not ( = ?auto_51105 ?auto_51116 ) ) ( OBJ-AT ?auto_51117 ?auto_51105 ) ( OBJ-AT ?auto_51108 ?auto_51116 ) ( OBJ-AT ?auto_51114 ?auto_51105 ) ( TRUCK-AT ?auto_51109 ?auto_51110 ) ( IN-CITY ?auto_51110 ?auto_51115 ) ( IN-CITY ?auto_51116 ?auto_51115 ) ( not ( = ?auto_51116 ?auto_51110 ) ) ( OBJ-AT ?auto_51112 ?auto_51105 ) ( OBJ-AT ?auto_51104 ?auto_51105 ) ( OBJ-AT ?auto_51106 ?auto_51105 ) ( OBJ-AT ?auto_51107 ?auto_51105 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51112 ?auto_51108 ?auto_51105 )
      ( DELIVER-4PKG-VERIFY ?auto_51104 ?auto_51106 ?auto_51107 ?auto_51108 ?auto_51105 ) )
  )

)

