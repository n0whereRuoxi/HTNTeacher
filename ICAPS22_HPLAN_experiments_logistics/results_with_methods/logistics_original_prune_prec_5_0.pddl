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
      ?auto_219103 - OBJ
      ?auto_219104 - LOCATION
    )
    :vars
    (
      ?auto_219105 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_219105 ?auto_219104 ) ( IN-TRUCK ?auto_219103 ?auto_219105 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_219103 ?auto_219105 ?auto_219104 )
      ( DELIVER-1PKG-VERIFY ?auto_219103 ?auto_219104 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_219128 - OBJ
      ?auto_219129 - LOCATION
    )
    :vars
    (
      ?auto_219130 - TRUCK
      ?auto_219131 - LOCATION
      ?auto_219132 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_219128 ?auto_219130 ) ( TRUCK-AT ?auto_219130 ?auto_219131 ) ( IN-CITY ?auto_219131 ?auto_219132 ) ( IN-CITY ?auto_219129 ?auto_219132 ) ( not ( = ?auto_219129 ?auto_219131 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_219130 ?auto_219131 ?auto_219129 ?auto_219132 )
      ( DELIVER-1PKG ?auto_219128 ?auto_219129 )
      ( DELIVER-1PKG-VERIFY ?auto_219128 ?auto_219129 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_219163 - OBJ
      ?auto_219164 - LOCATION
    )
    :vars
    (
      ?auto_219165 - TRUCK
      ?auto_219166 - LOCATION
      ?auto_219167 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_219165 ?auto_219166 ) ( IN-CITY ?auto_219166 ?auto_219167 ) ( IN-CITY ?auto_219164 ?auto_219167 ) ( not ( = ?auto_219164 ?auto_219166 ) ) ( OBJ-AT ?auto_219163 ?auto_219166 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_219163 ?auto_219165 ?auto_219166 )
      ( DELIVER-1PKG ?auto_219163 ?auto_219164 )
      ( DELIVER-1PKG-VERIFY ?auto_219163 ?auto_219164 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_219198 - OBJ
      ?auto_219199 - LOCATION
    )
    :vars
    (
      ?auto_219202 - LOCATION
      ?auto_219201 - CITY
      ?auto_219200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219202 ?auto_219201 ) ( IN-CITY ?auto_219199 ?auto_219201 ) ( not ( = ?auto_219199 ?auto_219202 ) ) ( OBJ-AT ?auto_219198 ?auto_219202 ) ( TRUCK-AT ?auto_219200 ?auto_219199 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_219200 ?auto_219199 ?auto_219202 ?auto_219201 )
      ( DELIVER-1PKG ?auto_219198 ?auto_219199 )
      ( DELIVER-1PKG-VERIFY ?auto_219198 ?auto_219199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219536 - OBJ
      ?auto_219538 - OBJ
      ?auto_219537 - LOCATION
    )
    :vars
    (
      ?auto_219539 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_219538 ?auto_219536 ) ( TRUCK-AT ?auto_219539 ?auto_219537 ) ( IN-TRUCK ?auto_219538 ?auto_219539 ) ( OBJ-AT ?auto_219536 ?auto_219537 ) ( not ( = ?auto_219536 ?auto_219538 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_219538 ?auto_219537 )
      ( DELIVER-2PKG-VERIFY ?auto_219536 ?auto_219538 ?auto_219537 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219895 - OBJ
      ?auto_219897 - OBJ
      ?auto_219896 - LOCATION
    )
    :vars
    (
      ?auto_219899 - TRUCK
      ?auto_219900 - LOCATION
      ?auto_219898 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_219897 ?auto_219895 ) ( IN-TRUCK ?auto_219897 ?auto_219899 ) ( TRUCK-AT ?auto_219899 ?auto_219900 ) ( IN-CITY ?auto_219900 ?auto_219898 ) ( IN-CITY ?auto_219896 ?auto_219898 ) ( not ( = ?auto_219896 ?auto_219900 ) ) ( OBJ-AT ?auto_219895 ?auto_219896 ) ( not ( = ?auto_219895 ?auto_219897 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_219897 ?auto_219896 )
      ( DELIVER-2PKG-VERIFY ?auto_219895 ?auto_219897 ?auto_219896 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_220365 - OBJ
      ?auto_220366 - LOCATION
    )
    :vars
    (
      ?auto_220368 - OBJ
      ?auto_220369 - TRUCK
      ?auto_220370 - LOCATION
      ?auto_220367 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_220365 ?auto_220368 ) ( TRUCK-AT ?auto_220369 ?auto_220370 ) ( IN-CITY ?auto_220370 ?auto_220367 ) ( IN-CITY ?auto_220366 ?auto_220367 ) ( not ( = ?auto_220366 ?auto_220370 ) ) ( OBJ-AT ?auto_220368 ?auto_220366 ) ( not ( = ?auto_220368 ?auto_220365 ) ) ( OBJ-AT ?auto_220365 ?auto_220370 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_220365 ?auto_220369 ?auto_220370 )
      ( DELIVER-2PKG ?auto_220368 ?auto_220365 ?auto_220366 )
      ( DELIVER-1PKG-VERIFY ?auto_220365 ?auto_220366 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_220371 - OBJ
      ?auto_220373 - OBJ
      ?auto_220372 - LOCATION
    )
    :vars
    (
      ?auto_220374 - TRUCK
      ?auto_220375 - LOCATION
      ?auto_220376 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_220373 ?auto_220371 ) ( TRUCK-AT ?auto_220374 ?auto_220375 ) ( IN-CITY ?auto_220375 ?auto_220376 ) ( IN-CITY ?auto_220372 ?auto_220376 ) ( not ( = ?auto_220372 ?auto_220375 ) ) ( OBJ-AT ?auto_220371 ?auto_220372 ) ( not ( = ?auto_220371 ?auto_220373 ) ) ( OBJ-AT ?auto_220373 ?auto_220375 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_220373 ?auto_220372 )
      ( DELIVER-2PKG-VERIFY ?auto_220371 ?auto_220373 ?auto_220372 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_220841 - OBJ
      ?auto_220842 - LOCATION
    )
    :vars
    (
      ?auto_220844 - OBJ
      ?auto_220845 - LOCATION
      ?auto_220843 - CITY
      ?auto_220846 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_220841 ?auto_220844 ) ( IN-CITY ?auto_220845 ?auto_220843 ) ( IN-CITY ?auto_220842 ?auto_220843 ) ( not ( = ?auto_220842 ?auto_220845 ) ) ( OBJ-AT ?auto_220844 ?auto_220842 ) ( not ( = ?auto_220844 ?auto_220841 ) ) ( OBJ-AT ?auto_220841 ?auto_220845 ) ( TRUCK-AT ?auto_220846 ?auto_220842 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_220846 ?auto_220842 ?auto_220845 ?auto_220843 )
      ( DELIVER-2PKG ?auto_220844 ?auto_220841 ?auto_220842 )
      ( DELIVER-1PKG-VERIFY ?auto_220841 ?auto_220842 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_220847 - OBJ
      ?auto_220849 - OBJ
      ?auto_220848 - LOCATION
    )
    :vars
    (
      ?auto_220851 - LOCATION
      ?auto_220850 - CITY
      ?auto_220852 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_220849 ?auto_220847 ) ( IN-CITY ?auto_220851 ?auto_220850 ) ( IN-CITY ?auto_220848 ?auto_220850 ) ( not ( = ?auto_220848 ?auto_220851 ) ) ( OBJ-AT ?auto_220847 ?auto_220848 ) ( not ( = ?auto_220847 ?auto_220849 ) ) ( OBJ-AT ?auto_220849 ?auto_220851 ) ( TRUCK-AT ?auto_220852 ?auto_220848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_220849 ?auto_220848 )
      ( DELIVER-2PKG-VERIFY ?auto_220847 ?auto_220849 ?auto_220848 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_221317 - OBJ
      ?auto_221318 - LOCATION
    )
    :vars
    (
      ?auto_221321 - OBJ
      ?auto_221322 - LOCATION
      ?auto_221320 - CITY
      ?auto_221319 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_221317 ?auto_221321 ) ( IN-CITY ?auto_221322 ?auto_221320 ) ( IN-CITY ?auto_221318 ?auto_221320 ) ( not ( = ?auto_221318 ?auto_221322 ) ) ( not ( = ?auto_221321 ?auto_221317 ) ) ( OBJ-AT ?auto_221317 ?auto_221322 ) ( TRUCK-AT ?auto_221319 ?auto_221318 ) ( IN-TRUCK ?auto_221321 ?auto_221319 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_221321 ?auto_221318 )
      ( DELIVER-2PKG ?auto_221321 ?auto_221317 ?auto_221318 )
      ( DELIVER-1PKG-VERIFY ?auto_221317 ?auto_221318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_221323 - OBJ
      ?auto_221325 - OBJ
      ?auto_221324 - LOCATION
    )
    :vars
    (
      ?auto_221326 - LOCATION
      ?auto_221327 - CITY
      ?auto_221328 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_221325 ?auto_221323 ) ( IN-CITY ?auto_221326 ?auto_221327 ) ( IN-CITY ?auto_221324 ?auto_221327 ) ( not ( = ?auto_221324 ?auto_221326 ) ) ( not ( = ?auto_221323 ?auto_221325 ) ) ( OBJ-AT ?auto_221325 ?auto_221326 ) ( TRUCK-AT ?auto_221328 ?auto_221324 ) ( IN-TRUCK ?auto_221323 ?auto_221328 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_221325 ?auto_221324 )
      ( DELIVER-2PKG-VERIFY ?auto_221323 ?auto_221325 ?auto_221324 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_221793 - OBJ
      ?auto_221794 - LOCATION
    )
    :vars
    (
      ?auto_221797 - OBJ
      ?auto_221795 - LOCATION
      ?auto_221796 - CITY
      ?auto_221798 - TRUCK
      ?auto_221799 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_221793 ?auto_221797 ) ( IN-CITY ?auto_221795 ?auto_221796 ) ( IN-CITY ?auto_221794 ?auto_221796 ) ( not ( = ?auto_221794 ?auto_221795 ) ) ( not ( = ?auto_221797 ?auto_221793 ) ) ( OBJ-AT ?auto_221793 ?auto_221795 ) ( IN-TRUCK ?auto_221797 ?auto_221798 ) ( TRUCK-AT ?auto_221798 ?auto_221799 ) ( IN-CITY ?auto_221799 ?auto_221796 ) ( not ( = ?auto_221794 ?auto_221799 ) ) ( not ( = ?auto_221795 ?auto_221799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_221798 ?auto_221799 ?auto_221794 ?auto_221796 )
      ( DELIVER-2PKG ?auto_221797 ?auto_221793 ?auto_221794 )
      ( DELIVER-1PKG-VERIFY ?auto_221793 ?auto_221794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_221800 - OBJ
      ?auto_221802 - OBJ
      ?auto_221801 - LOCATION
    )
    :vars
    (
      ?auto_221805 - LOCATION
      ?auto_221806 - CITY
      ?auto_221803 - TRUCK
      ?auto_221804 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_221802 ?auto_221800 ) ( IN-CITY ?auto_221805 ?auto_221806 ) ( IN-CITY ?auto_221801 ?auto_221806 ) ( not ( = ?auto_221801 ?auto_221805 ) ) ( not ( = ?auto_221800 ?auto_221802 ) ) ( OBJ-AT ?auto_221802 ?auto_221805 ) ( IN-TRUCK ?auto_221800 ?auto_221803 ) ( TRUCK-AT ?auto_221803 ?auto_221804 ) ( IN-CITY ?auto_221804 ?auto_221806 ) ( not ( = ?auto_221801 ?auto_221804 ) ) ( not ( = ?auto_221805 ?auto_221804 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_221802 ?auto_221801 )
      ( DELIVER-2PKG-VERIFY ?auto_221800 ?auto_221802 ?auto_221801 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_222326 - OBJ
      ?auto_222327 - LOCATION
    )
    :vars
    (
      ?auto_222330 - OBJ
      ?auto_222328 - LOCATION
      ?auto_222332 - CITY
      ?auto_222331 - TRUCK
      ?auto_222329 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_222326 ?auto_222330 ) ( IN-CITY ?auto_222328 ?auto_222332 ) ( IN-CITY ?auto_222327 ?auto_222332 ) ( not ( = ?auto_222327 ?auto_222328 ) ) ( not ( = ?auto_222330 ?auto_222326 ) ) ( OBJ-AT ?auto_222326 ?auto_222328 ) ( TRUCK-AT ?auto_222331 ?auto_222329 ) ( IN-CITY ?auto_222329 ?auto_222332 ) ( not ( = ?auto_222327 ?auto_222329 ) ) ( not ( = ?auto_222328 ?auto_222329 ) ) ( OBJ-AT ?auto_222330 ?auto_222329 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_222330 ?auto_222331 ?auto_222329 )
      ( DELIVER-2PKG ?auto_222330 ?auto_222326 ?auto_222327 )
      ( DELIVER-1PKG-VERIFY ?auto_222326 ?auto_222327 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_222333 - OBJ
      ?auto_222335 - OBJ
      ?auto_222334 - LOCATION
    )
    :vars
    (
      ?auto_222337 - LOCATION
      ?auto_222338 - CITY
      ?auto_222339 - TRUCK
      ?auto_222336 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_222335 ?auto_222333 ) ( IN-CITY ?auto_222337 ?auto_222338 ) ( IN-CITY ?auto_222334 ?auto_222338 ) ( not ( = ?auto_222334 ?auto_222337 ) ) ( not ( = ?auto_222333 ?auto_222335 ) ) ( OBJ-AT ?auto_222335 ?auto_222337 ) ( TRUCK-AT ?auto_222339 ?auto_222336 ) ( IN-CITY ?auto_222336 ?auto_222338 ) ( not ( = ?auto_222334 ?auto_222336 ) ) ( not ( = ?auto_222337 ?auto_222336 ) ) ( OBJ-AT ?auto_222333 ?auto_222336 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_222335 ?auto_222334 )
      ( DELIVER-2PKG-VERIFY ?auto_222333 ?auto_222335 ?auto_222334 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_225038 - OBJ
      ?auto_225040 - OBJ
      ?auto_225041 - OBJ
      ?auto_225039 - LOCATION
    )
    :vars
    (
      ?auto_225042 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_225040 ?auto_225038 ) ( GREATER-THAN ?auto_225041 ?auto_225038 ) ( GREATER-THAN ?auto_225041 ?auto_225040 ) ( TRUCK-AT ?auto_225042 ?auto_225039 ) ( IN-TRUCK ?auto_225041 ?auto_225042 ) ( OBJ-AT ?auto_225038 ?auto_225039 ) ( OBJ-AT ?auto_225040 ?auto_225039 ) ( not ( = ?auto_225038 ?auto_225040 ) ) ( not ( = ?auto_225038 ?auto_225041 ) ) ( not ( = ?auto_225040 ?auto_225041 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_225041 ?auto_225039 )
      ( DELIVER-3PKG-VERIFY ?auto_225038 ?auto_225040 ?auto_225041 ?auto_225039 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_227036 - OBJ
      ?auto_227038 - OBJ
      ?auto_227039 - OBJ
      ?auto_227037 - LOCATION
    )
    :vars
    (
      ?auto_227041 - TRUCK
      ?auto_227040 - LOCATION
      ?auto_227042 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_227038 ?auto_227036 ) ( GREATER-THAN ?auto_227039 ?auto_227036 ) ( GREATER-THAN ?auto_227039 ?auto_227038 ) ( IN-TRUCK ?auto_227039 ?auto_227041 ) ( TRUCK-AT ?auto_227041 ?auto_227040 ) ( IN-CITY ?auto_227040 ?auto_227042 ) ( IN-CITY ?auto_227037 ?auto_227042 ) ( not ( = ?auto_227037 ?auto_227040 ) ) ( OBJ-AT ?auto_227036 ?auto_227037 ) ( not ( = ?auto_227036 ?auto_227039 ) ) ( OBJ-AT ?auto_227038 ?auto_227037 ) ( not ( = ?auto_227036 ?auto_227038 ) ) ( not ( = ?auto_227038 ?auto_227039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227036 ?auto_227039 ?auto_227037 )
      ( DELIVER-3PKG-VERIFY ?auto_227036 ?auto_227038 ?auto_227039 ?auto_227037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229676 - OBJ
      ?auto_229678 - OBJ
      ?auto_229679 - OBJ
      ?auto_229677 - LOCATION
    )
    :vars
    (
      ?auto_229681 - TRUCK
      ?auto_229682 - LOCATION
      ?auto_229680 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_229678 ?auto_229676 ) ( GREATER-THAN ?auto_229679 ?auto_229676 ) ( GREATER-THAN ?auto_229679 ?auto_229678 ) ( TRUCK-AT ?auto_229681 ?auto_229682 ) ( IN-CITY ?auto_229682 ?auto_229680 ) ( IN-CITY ?auto_229677 ?auto_229680 ) ( not ( = ?auto_229677 ?auto_229682 ) ) ( OBJ-AT ?auto_229676 ?auto_229677 ) ( not ( = ?auto_229676 ?auto_229679 ) ) ( OBJ-AT ?auto_229679 ?auto_229682 ) ( OBJ-AT ?auto_229678 ?auto_229677 ) ( not ( = ?auto_229676 ?auto_229678 ) ) ( not ( = ?auto_229678 ?auto_229679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229676 ?auto_229679 ?auto_229677 )
      ( DELIVER-3PKG-VERIFY ?auto_229676 ?auto_229678 ?auto_229679 ?auto_229677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_232316 - OBJ
      ?auto_232318 - OBJ
      ?auto_232319 - OBJ
      ?auto_232317 - LOCATION
    )
    :vars
    (
      ?auto_232321 - LOCATION
      ?auto_232320 - CITY
      ?auto_232322 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_232318 ?auto_232316 ) ( GREATER-THAN ?auto_232319 ?auto_232316 ) ( GREATER-THAN ?auto_232319 ?auto_232318 ) ( IN-CITY ?auto_232321 ?auto_232320 ) ( IN-CITY ?auto_232317 ?auto_232320 ) ( not ( = ?auto_232317 ?auto_232321 ) ) ( OBJ-AT ?auto_232316 ?auto_232317 ) ( not ( = ?auto_232316 ?auto_232319 ) ) ( OBJ-AT ?auto_232319 ?auto_232321 ) ( TRUCK-AT ?auto_232322 ?auto_232317 ) ( OBJ-AT ?auto_232318 ?auto_232317 ) ( not ( = ?auto_232316 ?auto_232318 ) ) ( not ( = ?auto_232318 ?auto_232319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_232316 ?auto_232319 ?auto_232317 )
      ( DELIVER-3PKG-VERIFY ?auto_232316 ?auto_232318 ?auto_232319 ?auto_232317 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_237551 - OBJ
      ?auto_237552 - LOCATION
    )
    :vars
    (
      ?auto_237556 - OBJ
      ?auto_237555 - LOCATION
      ?auto_237554 - CITY
      ?auto_237553 - TRUCK
      ?auto_237557 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_237551 ?auto_237556 ) ( IN-CITY ?auto_237555 ?auto_237554 ) ( IN-CITY ?auto_237552 ?auto_237554 ) ( not ( = ?auto_237552 ?auto_237555 ) ) ( OBJ-AT ?auto_237556 ?auto_237552 ) ( not ( = ?auto_237556 ?auto_237551 ) ) ( OBJ-AT ?auto_237551 ?auto_237555 ) ( TRUCK-AT ?auto_237553 ?auto_237557 ) ( IN-CITY ?auto_237557 ?auto_237554 ) ( not ( = ?auto_237552 ?auto_237557 ) ) ( not ( = ?auto_237555 ?auto_237557 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_237553 ?auto_237557 ?auto_237552 ?auto_237554 )
      ( DELIVER-2PKG ?auto_237556 ?auto_237551 ?auto_237552 )
      ( DELIVER-1PKG-VERIFY ?auto_237551 ?auto_237552 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_237558 - OBJ
      ?auto_237560 - OBJ
      ?auto_237559 - LOCATION
    )
    :vars
    (
      ?auto_237562 - LOCATION
      ?auto_237564 - CITY
      ?auto_237563 - TRUCK
      ?auto_237561 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_237560 ?auto_237558 ) ( IN-CITY ?auto_237562 ?auto_237564 ) ( IN-CITY ?auto_237559 ?auto_237564 ) ( not ( = ?auto_237559 ?auto_237562 ) ) ( OBJ-AT ?auto_237558 ?auto_237559 ) ( not ( = ?auto_237558 ?auto_237560 ) ) ( OBJ-AT ?auto_237560 ?auto_237562 ) ( TRUCK-AT ?auto_237563 ?auto_237561 ) ( IN-CITY ?auto_237561 ?auto_237564 ) ( not ( = ?auto_237559 ?auto_237561 ) ) ( not ( = ?auto_237562 ?auto_237561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_237560 ?auto_237559 )
      ( DELIVER-2PKG-VERIFY ?auto_237558 ?auto_237560 ?auto_237559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_263160 - OBJ
      ?auto_263162 - OBJ
      ?auto_263163 - OBJ
      ?auto_263164 - OBJ
      ?auto_263161 - LOCATION
    )
    :vars
    (
      ?auto_263165 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_263162 ?auto_263160 ) ( GREATER-THAN ?auto_263163 ?auto_263160 ) ( GREATER-THAN ?auto_263163 ?auto_263162 ) ( GREATER-THAN ?auto_263164 ?auto_263160 ) ( GREATER-THAN ?auto_263164 ?auto_263162 ) ( GREATER-THAN ?auto_263164 ?auto_263163 ) ( TRUCK-AT ?auto_263165 ?auto_263161 ) ( IN-TRUCK ?auto_263164 ?auto_263165 ) ( OBJ-AT ?auto_263160 ?auto_263161 ) ( OBJ-AT ?auto_263162 ?auto_263161 ) ( OBJ-AT ?auto_263163 ?auto_263161 ) ( not ( = ?auto_263160 ?auto_263162 ) ) ( not ( = ?auto_263160 ?auto_263163 ) ) ( not ( = ?auto_263160 ?auto_263164 ) ) ( not ( = ?auto_263162 ?auto_263163 ) ) ( not ( = ?auto_263162 ?auto_263164 ) ) ( not ( = ?auto_263163 ?auto_263164 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_263164 ?auto_263161 )
      ( DELIVER-4PKG-VERIFY ?auto_263160 ?auto_263162 ?auto_263163 ?auto_263164 ?auto_263161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_270010 - OBJ
      ?auto_270012 - OBJ
      ?auto_270013 - OBJ
      ?auto_270014 - OBJ
      ?auto_270011 - LOCATION
    )
    :vars
    (
      ?auto_270017 - TRUCK
      ?auto_270015 - LOCATION
      ?auto_270016 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_270012 ?auto_270010 ) ( GREATER-THAN ?auto_270013 ?auto_270010 ) ( GREATER-THAN ?auto_270013 ?auto_270012 ) ( GREATER-THAN ?auto_270014 ?auto_270010 ) ( GREATER-THAN ?auto_270014 ?auto_270012 ) ( GREATER-THAN ?auto_270014 ?auto_270013 ) ( IN-TRUCK ?auto_270014 ?auto_270017 ) ( TRUCK-AT ?auto_270017 ?auto_270015 ) ( IN-CITY ?auto_270015 ?auto_270016 ) ( IN-CITY ?auto_270011 ?auto_270016 ) ( not ( = ?auto_270011 ?auto_270015 ) ) ( OBJ-AT ?auto_270010 ?auto_270011 ) ( not ( = ?auto_270010 ?auto_270014 ) ) ( OBJ-AT ?auto_270012 ?auto_270011 ) ( OBJ-AT ?auto_270013 ?auto_270011 ) ( not ( = ?auto_270010 ?auto_270012 ) ) ( not ( = ?auto_270010 ?auto_270013 ) ) ( not ( = ?auto_270012 ?auto_270013 ) ) ( not ( = ?auto_270012 ?auto_270014 ) ) ( not ( = ?auto_270013 ?auto_270014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_270010 ?auto_270014 ?auto_270011 )
      ( DELIVER-4PKG-VERIFY ?auto_270010 ?auto_270012 ?auto_270013 ?auto_270014 ?auto_270011 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_279031 - OBJ
      ?auto_279033 - OBJ
      ?auto_279034 - OBJ
      ?auto_279035 - OBJ
      ?auto_279032 - LOCATION
    )
    :vars
    (
      ?auto_279038 - TRUCK
      ?auto_279037 - LOCATION
      ?auto_279036 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_279033 ?auto_279031 ) ( GREATER-THAN ?auto_279034 ?auto_279031 ) ( GREATER-THAN ?auto_279034 ?auto_279033 ) ( GREATER-THAN ?auto_279035 ?auto_279031 ) ( GREATER-THAN ?auto_279035 ?auto_279033 ) ( GREATER-THAN ?auto_279035 ?auto_279034 ) ( TRUCK-AT ?auto_279038 ?auto_279037 ) ( IN-CITY ?auto_279037 ?auto_279036 ) ( IN-CITY ?auto_279032 ?auto_279036 ) ( not ( = ?auto_279032 ?auto_279037 ) ) ( OBJ-AT ?auto_279031 ?auto_279032 ) ( not ( = ?auto_279031 ?auto_279035 ) ) ( OBJ-AT ?auto_279035 ?auto_279037 ) ( OBJ-AT ?auto_279033 ?auto_279032 ) ( OBJ-AT ?auto_279034 ?auto_279032 ) ( not ( = ?auto_279031 ?auto_279033 ) ) ( not ( = ?auto_279031 ?auto_279034 ) ) ( not ( = ?auto_279033 ?auto_279034 ) ) ( not ( = ?auto_279033 ?auto_279035 ) ) ( not ( = ?auto_279034 ?auto_279035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_279031 ?auto_279035 ?auto_279032 )
      ( DELIVER-4PKG-VERIFY ?auto_279031 ?auto_279033 ?auto_279034 ?auto_279035 ?auto_279032 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_288052 - OBJ
      ?auto_288054 - OBJ
      ?auto_288055 - OBJ
      ?auto_288056 - OBJ
      ?auto_288053 - LOCATION
    )
    :vars
    (
      ?auto_288058 - LOCATION
      ?auto_288057 - CITY
      ?auto_288059 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_288054 ?auto_288052 ) ( GREATER-THAN ?auto_288055 ?auto_288052 ) ( GREATER-THAN ?auto_288055 ?auto_288054 ) ( GREATER-THAN ?auto_288056 ?auto_288052 ) ( GREATER-THAN ?auto_288056 ?auto_288054 ) ( GREATER-THAN ?auto_288056 ?auto_288055 ) ( IN-CITY ?auto_288058 ?auto_288057 ) ( IN-CITY ?auto_288053 ?auto_288057 ) ( not ( = ?auto_288053 ?auto_288058 ) ) ( OBJ-AT ?auto_288052 ?auto_288053 ) ( not ( = ?auto_288052 ?auto_288056 ) ) ( OBJ-AT ?auto_288056 ?auto_288058 ) ( TRUCK-AT ?auto_288059 ?auto_288053 ) ( OBJ-AT ?auto_288054 ?auto_288053 ) ( OBJ-AT ?auto_288055 ?auto_288053 ) ( not ( = ?auto_288052 ?auto_288054 ) ) ( not ( = ?auto_288052 ?auto_288055 ) ) ( not ( = ?auto_288054 ?auto_288055 ) ) ( not ( = ?auto_288054 ?auto_288056 ) ) ( not ( = ?auto_288055 ?auto_288056 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_288052 ?auto_288056 ?auto_288053 )
      ( DELIVER-4PKG-VERIFY ?auto_288052 ?auto_288054 ?auto_288055 ?auto_288056 ?auto_288053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_305771 - OBJ
      ?auto_305773 - OBJ
      ?auto_305774 - OBJ
      ?auto_305772 - LOCATION
    )
    :vars
    (
      ?auto_305776 - LOCATION
      ?auto_305777 - CITY
      ?auto_305778 - TRUCK
      ?auto_305775 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_305773 ?auto_305771 ) ( GREATER-THAN ?auto_305774 ?auto_305771 ) ( GREATER-THAN ?auto_305774 ?auto_305773 ) ( IN-CITY ?auto_305776 ?auto_305777 ) ( IN-CITY ?auto_305772 ?auto_305777 ) ( not ( = ?auto_305772 ?auto_305776 ) ) ( OBJ-AT ?auto_305771 ?auto_305772 ) ( not ( = ?auto_305771 ?auto_305774 ) ) ( OBJ-AT ?auto_305774 ?auto_305776 ) ( TRUCK-AT ?auto_305778 ?auto_305775 ) ( IN-CITY ?auto_305775 ?auto_305777 ) ( not ( = ?auto_305772 ?auto_305775 ) ) ( not ( = ?auto_305776 ?auto_305775 ) ) ( OBJ-AT ?auto_305773 ?auto_305772 ) ( not ( = ?auto_305771 ?auto_305773 ) ) ( not ( = ?auto_305773 ?auto_305774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305771 ?auto_305774 ?auto_305772 )
      ( DELIVER-3PKG-VERIFY ?auto_305771 ?auto_305773 ?auto_305774 ?auto_305772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_428556 - OBJ
      ?auto_428558 - OBJ
      ?auto_428559 - OBJ
      ?auto_428560 - OBJ
      ?auto_428561 - OBJ
      ?auto_428557 - LOCATION
    )
    :vars
    (
      ?auto_428562 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_428558 ?auto_428556 ) ( GREATER-THAN ?auto_428559 ?auto_428556 ) ( GREATER-THAN ?auto_428559 ?auto_428558 ) ( GREATER-THAN ?auto_428560 ?auto_428556 ) ( GREATER-THAN ?auto_428560 ?auto_428558 ) ( GREATER-THAN ?auto_428560 ?auto_428559 ) ( GREATER-THAN ?auto_428561 ?auto_428556 ) ( GREATER-THAN ?auto_428561 ?auto_428558 ) ( GREATER-THAN ?auto_428561 ?auto_428559 ) ( GREATER-THAN ?auto_428561 ?auto_428560 ) ( TRUCK-AT ?auto_428562 ?auto_428557 ) ( IN-TRUCK ?auto_428561 ?auto_428562 ) ( OBJ-AT ?auto_428556 ?auto_428557 ) ( OBJ-AT ?auto_428558 ?auto_428557 ) ( OBJ-AT ?auto_428559 ?auto_428557 ) ( OBJ-AT ?auto_428560 ?auto_428557 ) ( not ( = ?auto_428556 ?auto_428558 ) ) ( not ( = ?auto_428556 ?auto_428559 ) ) ( not ( = ?auto_428556 ?auto_428560 ) ) ( not ( = ?auto_428556 ?auto_428561 ) ) ( not ( = ?auto_428558 ?auto_428559 ) ) ( not ( = ?auto_428558 ?auto_428560 ) ) ( not ( = ?auto_428558 ?auto_428561 ) ) ( not ( = ?auto_428559 ?auto_428560 ) ) ( not ( = ?auto_428559 ?auto_428561 ) ) ( not ( = ?auto_428560 ?auto_428561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_428561 ?auto_428557 )
      ( DELIVER-5PKG-VERIFY ?auto_428556 ?auto_428558 ?auto_428559 ?auto_428560 ?auto_428561 ?auto_428557 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_447044 - OBJ
      ?auto_447046 - OBJ
      ?auto_447047 - OBJ
      ?auto_447048 - OBJ
      ?auto_447049 - OBJ
      ?auto_447045 - LOCATION
    )
    :vars
    (
      ?auto_447052 - TRUCK
      ?auto_447050 - LOCATION
      ?auto_447051 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_447046 ?auto_447044 ) ( GREATER-THAN ?auto_447047 ?auto_447044 ) ( GREATER-THAN ?auto_447047 ?auto_447046 ) ( GREATER-THAN ?auto_447048 ?auto_447044 ) ( GREATER-THAN ?auto_447048 ?auto_447046 ) ( GREATER-THAN ?auto_447048 ?auto_447047 ) ( GREATER-THAN ?auto_447049 ?auto_447044 ) ( GREATER-THAN ?auto_447049 ?auto_447046 ) ( GREATER-THAN ?auto_447049 ?auto_447047 ) ( GREATER-THAN ?auto_447049 ?auto_447048 ) ( IN-TRUCK ?auto_447049 ?auto_447052 ) ( TRUCK-AT ?auto_447052 ?auto_447050 ) ( IN-CITY ?auto_447050 ?auto_447051 ) ( IN-CITY ?auto_447045 ?auto_447051 ) ( not ( = ?auto_447045 ?auto_447050 ) ) ( OBJ-AT ?auto_447044 ?auto_447045 ) ( not ( = ?auto_447044 ?auto_447049 ) ) ( OBJ-AT ?auto_447046 ?auto_447045 ) ( OBJ-AT ?auto_447047 ?auto_447045 ) ( OBJ-AT ?auto_447048 ?auto_447045 ) ( not ( = ?auto_447044 ?auto_447046 ) ) ( not ( = ?auto_447044 ?auto_447047 ) ) ( not ( = ?auto_447044 ?auto_447048 ) ) ( not ( = ?auto_447046 ?auto_447047 ) ) ( not ( = ?auto_447046 ?auto_447048 ) ) ( not ( = ?auto_447046 ?auto_447049 ) ) ( not ( = ?auto_447047 ?auto_447048 ) ) ( not ( = ?auto_447047 ?auto_447049 ) ) ( not ( = ?auto_447048 ?auto_447049 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_447044 ?auto_447049 ?auto_447045 )
      ( DELIVER-5PKG-VERIFY ?auto_447044 ?auto_447046 ?auto_447047 ?auto_447048 ?auto_447049 ?auto_447045 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_470352 - OBJ
      ?auto_470354 - OBJ
      ?auto_470355 - OBJ
      ?auto_470356 - OBJ
      ?auto_470357 - OBJ
      ?auto_470353 - LOCATION
    )
    :vars
    (
      ?auto_470358 - TRUCK
      ?auto_470360 - LOCATION
      ?auto_470359 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_470354 ?auto_470352 ) ( GREATER-THAN ?auto_470355 ?auto_470352 ) ( GREATER-THAN ?auto_470355 ?auto_470354 ) ( GREATER-THAN ?auto_470356 ?auto_470352 ) ( GREATER-THAN ?auto_470356 ?auto_470354 ) ( GREATER-THAN ?auto_470356 ?auto_470355 ) ( GREATER-THAN ?auto_470357 ?auto_470352 ) ( GREATER-THAN ?auto_470357 ?auto_470354 ) ( GREATER-THAN ?auto_470357 ?auto_470355 ) ( GREATER-THAN ?auto_470357 ?auto_470356 ) ( TRUCK-AT ?auto_470358 ?auto_470360 ) ( IN-CITY ?auto_470360 ?auto_470359 ) ( IN-CITY ?auto_470353 ?auto_470359 ) ( not ( = ?auto_470353 ?auto_470360 ) ) ( OBJ-AT ?auto_470352 ?auto_470353 ) ( not ( = ?auto_470352 ?auto_470357 ) ) ( OBJ-AT ?auto_470357 ?auto_470360 ) ( OBJ-AT ?auto_470354 ?auto_470353 ) ( OBJ-AT ?auto_470355 ?auto_470353 ) ( OBJ-AT ?auto_470356 ?auto_470353 ) ( not ( = ?auto_470352 ?auto_470354 ) ) ( not ( = ?auto_470352 ?auto_470355 ) ) ( not ( = ?auto_470352 ?auto_470356 ) ) ( not ( = ?auto_470354 ?auto_470355 ) ) ( not ( = ?auto_470354 ?auto_470356 ) ) ( not ( = ?auto_470354 ?auto_470357 ) ) ( not ( = ?auto_470355 ?auto_470356 ) ) ( not ( = ?auto_470355 ?auto_470357 ) ) ( not ( = ?auto_470356 ?auto_470357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_470352 ?auto_470357 ?auto_470353 )
      ( DELIVER-5PKG-VERIFY ?auto_470352 ?auto_470354 ?auto_470355 ?auto_470356 ?auto_470357 ?auto_470353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_493660 - OBJ
      ?auto_493662 - OBJ
      ?auto_493663 - OBJ
      ?auto_493664 - OBJ
      ?auto_493665 - OBJ
      ?auto_493661 - LOCATION
    )
    :vars
    (
      ?auto_493666 - LOCATION
      ?auto_493667 - CITY
      ?auto_493668 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_493662 ?auto_493660 ) ( GREATER-THAN ?auto_493663 ?auto_493660 ) ( GREATER-THAN ?auto_493663 ?auto_493662 ) ( GREATER-THAN ?auto_493664 ?auto_493660 ) ( GREATER-THAN ?auto_493664 ?auto_493662 ) ( GREATER-THAN ?auto_493664 ?auto_493663 ) ( GREATER-THAN ?auto_493665 ?auto_493660 ) ( GREATER-THAN ?auto_493665 ?auto_493662 ) ( GREATER-THAN ?auto_493665 ?auto_493663 ) ( GREATER-THAN ?auto_493665 ?auto_493664 ) ( IN-CITY ?auto_493666 ?auto_493667 ) ( IN-CITY ?auto_493661 ?auto_493667 ) ( not ( = ?auto_493661 ?auto_493666 ) ) ( OBJ-AT ?auto_493660 ?auto_493661 ) ( not ( = ?auto_493660 ?auto_493665 ) ) ( OBJ-AT ?auto_493665 ?auto_493666 ) ( TRUCK-AT ?auto_493668 ?auto_493661 ) ( OBJ-AT ?auto_493662 ?auto_493661 ) ( OBJ-AT ?auto_493663 ?auto_493661 ) ( OBJ-AT ?auto_493664 ?auto_493661 ) ( not ( = ?auto_493660 ?auto_493662 ) ) ( not ( = ?auto_493660 ?auto_493663 ) ) ( not ( = ?auto_493660 ?auto_493664 ) ) ( not ( = ?auto_493662 ?auto_493663 ) ) ( not ( = ?auto_493662 ?auto_493664 ) ) ( not ( = ?auto_493662 ?auto_493665 ) ) ( not ( = ?auto_493663 ?auto_493664 ) ) ( not ( = ?auto_493663 ?auto_493665 ) ) ( not ( = ?auto_493664 ?auto_493665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_493660 ?auto_493665 ?auto_493661 )
      ( DELIVER-5PKG-VERIFY ?auto_493660 ?auto_493662 ?auto_493663 ?auto_493664 ?auto_493665 ?auto_493661 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_536614 - OBJ
      ?auto_536616 - OBJ
      ?auto_536617 - OBJ
      ?auto_536618 - OBJ
      ?auto_536615 - LOCATION
    )
    :vars
    (
      ?auto_536621 - LOCATION
      ?auto_536622 - CITY
      ?auto_536620 - TRUCK
      ?auto_536619 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_536616 ?auto_536614 ) ( GREATER-THAN ?auto_536617 ?auto_536614 ) ( GREATER-THAN ?auto_536617 ?auto_536616 ) ( GREATER-THAN ?auto_536618 ?auto_536614 ) ( GREATER-THAN ?auto_536618 ?auto_536616 ) ( GREATER-THAN ?auto_536618 ?auto_536617 ) ( IN-CITY ?auto_536621 ?auto_536622 ) ( IN-CITY ?auto_536615 ?auto_536622 ) ( not ( = ?auto_536615 ?auto_536621 ) ) ( OBJ-AT ?auto_536614 ?auto_536615 ) ( not ( = ?auto_536614 ?auto_536618 ) ) ( OBJ-AT ?auto_536618 ?auto_536621 ) ( TRUCK-AT ?auto_536620 ?auto_536619 ) ( IN-CITY ?auto_536619 ?auto_536622 ) ( not ( = ?auto_536615 ?auto_536619 ) ) ( not ( = ?auto_536621 ?auto_536619 ) ) ( OBJ-AT ?auto_536616 ?auto_536615 ) ( OBJ-AT ?auto_536617 ?auto_536615 ) ( not ( = ?auto_536614 ?auto_536616 ) ) ( not ( = ?auto_536614 ?auto_536617 ) ) ( not ( = ?auto_536616 ?auto_536617 ) ) ( not ( = ?auto_536616 ?auto_536618 ) ) ( not ( = ?auto_536617 ?auto_536618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_536614 ?auto_536618 ?auto_536615 )
      ( DELIVER-4PKG-VERIFY ?auto_536614 ?auto_536616 ?auto_536617 ?auto_536618 ?auto_536615 ) )
  )

)

