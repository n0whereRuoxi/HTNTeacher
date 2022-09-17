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
      ?auto_14074 - OBJ
      ?auto_14073 - LOCATION
    )
    :vars
    (
      ?auto_14076 - LOCATION
      ?auto_14077 - CITY
      ?auto_14075 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14076 ?auto_14077 ) ( IN-CITY ?auto_14073 ?auto_14077 ) ( not ( = ?auto_14073 ?auto_14076 ) ) ( OBJ-AT ?auto_14074 ?auto_14076 ) ( TRUCK-AT ?auto_14075 ?auto_14073 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14075 ?auto_14073 ?auto_14076 ?auto_14077 )
      ( !LOAD-TRUCK ?auto_14074 ?auto_14075 ?auto_14076 )
      ( !DRIVE-TRUCK ?auto_14075 ?auto_14076 ?auto_14073 ?auto_14077 )
      ( !UNLOAD-TRUCK ?auto_14074 ?auto_14075 ?auto_14073 )
      ( DELIVER-1PKG-VERIFY ?auto_14074 ?auto_14073 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14081 - OBJ
      ?auto_14080 - LOCATION
    )
    :vars
    (
      ?auto_14083 - LOCATION
      ?auto_14084 - CITY
      ?auto_14082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14083 ?auto_14084 ) ( IN-CITY ?auto_14080 ?auto_14084 ) ( not ( = ?auto_14080 ?auto_14083 ) ) ( OBJ-AT ?auto_14081 ?auto_14083 ) ( TRUCK-AT ?auto_14082 ?auto_14080 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14082 ?auto_14080 ?auto_14083 ?auto_14084 )
      ( !LOAD-TRUCK ?auto_14081 ?auto_14082 ?auto_14083 )
      ( !DRIVE-TRUCK ?auto_14082 ?auto_14083 ?auto_14080 ?auto_14084 )
      ( !UNLOAD-TRUCK ?auto_14081 ?auto_14082 ?auto_14080 )
      ( DELIVER-1PKG-VERIFY ?auto_14081 ?auto_14080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14095 - OBJ
      ?auto_14096 - OBJ
      ?auto_14094 - LOCATION
    )
    :vars
    (
      ?auto_14099 - LOCATION
      ?auto_14098 - CITY
      ?auto_14100 - LOCATION
      ?auto_14097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14099 ?auto_14098 ) ( IN-CITY ?auto_14094 ?auto_14098 ) ( not ( = ?auto_14094 ?auto_14099 ) ) ( OBJ-AT ?auto_14096 ?auto_14099 ) ( IN-CITY ?auto_14100 ?auto_14098 ) ( not ( = ?auto_14094 ?auto_14100 ) ) ( OBJ-AT ?auto_14095 ?auto_14100 ) ( TRUCK-AT ?auto_14097 ?auto_14094 ) ( not ( = ?auto_14095 ?auto_14096 ) ) ( not ( = ?auto_14099 ?auto_14100 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14095 ?auto_14094 )
      ( DELIVER-1PKG ?auto_14096 ?auto_14094 )
      ( DELIVER-2PKG-VERIFY ?auto_14095 ?auto_14096 ?auto_14094 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14102 - OBJ
      ?auto_14103 - OBJ
      ?auto_14101 - LOCATION
    )
    :vars
    (
      ?auto_14104 - LOCATION
      ?auto_14107 - CITY
      ?auto_14106 - LOCATION
      ?auto_14105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14104 ?auto_14107 ) ( IN-CITY ?auto_14101 ?auto_14107 ) ( not ( = ?auto_14101 ?auto_14104 ) ) ( OBJ-AT ?auto_14102 ?auto_14104 ) ( IN-CITY ?auto_14106 ?auto_14107 ) ( not ( = ?auto_14101 ?auto_14106 ) ) ( OBJ-AT ?auto_14103 ?auto_14106 ) ( TRUCK-AT ?auto_14105 ?auto_14101 ) ( not ( = ?auto_14103 ?auto_14102 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14103 ?auto_14102 ?auto_14101 )
      ( DELIVER-2PKG-VERIFY ?auto_14102 ?auto_14103 ?auto_14101 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14119 - OBJ
      ?auto_14118 - LOCATION
    )
    :vars
    (
      ?auto_14121 - LOCATION
      ?auto_14122 - CITY
      ?auto_14120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14121 ?auto_14122 ) ( IN-CITY ?auto_14118 ?auto_14122 ) ( not ( = ?auto_14118 ?auto_14121 ) ) ( OBJ-AT ?auto_14119 ?auto_14121 ) ( TRUCK-AT ?auto_14120 ?auto_14118 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14120 ?auto_14118 ?auto_14121 ?auto_14122 )
      ( !LOAD-TRUCK ?auto_14119 ?auto_14120 ?auto_14121 )
      ( !DRIVE-TRUCK ?auto_14120 ?auto_14121 ?auto_14118 ?auto_14122 )
      ( !UNLOAD-TRUCK ?auto_14119 ?auto_14120 ?auto_14118 )
      ( DELIVER-1PKG-VERIFY ?auto_14119 ?auto_14118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14210 - OBJ
      ?auto_14211 - OBJ
      ?auto_14212 - OBJ
      ?auto_14209 - LOCATION
    )
    :vars
    (
      ?auto_14215 - LOCATION
      ?auto_14214 - CITY
      ?auto_14217 - LOCATION
      ?auto_14216 - LOCATION
      ?auto_14213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14215 ?auto_14214 ) ( IN-CITY ?auto_14209 ?auto_14214 ) ( not ( = ?auto_14209 ?auto_14215 ) ) ( OBJ-AT ?auto_14212 ?auto_14215 ) ( IN-CITY ?auto_14217 ?auto_14214 ) ( not ( = ?auto_14209 ?auto_14217 ) ) ( OBJ-AT ?auto_14211 ?auto_14217 ) ( IN-CITY ?auto_14216 ?auto_14214 ) ( not ( = ?auto_14209 ?auto_14216 ) ) ( OBJ-AT ?auto_14210 ?auto_14216 ) ( TRUCK-AT ?auto_14213 ?auto_14209 ) ( not ( = ?auto_14210 ?auto_14211 ) ) ( not ( = ?auto_14217 ?auto_14216 ) ) ( not ( = ?auto_14210 ?auto_14212 ) ) ( not ( = ?auto_14211 ?auto_14212 ) ) ( not ( = ?auto_14215 ?auto_14217 ) ) ( not ( = ?auto_14215 ?auto_14216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14211 ?auto_14210 ?auto_14209 )
      ( DELIVER-1PKG ?auto_14212 ?auto_14209 )
      ( DELIVER-3PKG-VERIFY ?auto_14210 ?auto_14211 ?auto_14212 ?auto_14209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14229 - OBJ
      ?auto_14230 - OBJ
      ?auto_14231 - OBJ
      ?auto_14228 - LOCATION
    )
    :vars
    (
      ?auto_14233 - LOCATION
      ?auto_14235 - CITY
      ?auto_14234 - LOCATION
      ?auto_14236 - LOCATION
      ?auto_14232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14233 ?auto_14235 ) ( IN-CITY ?auto_14228 ?auto_14235 ) ( not ( = ?auto_14228 ?auto_14233 ) ) ( OBJ-AT ?auto_14230 ?auto_14233 ) ( IN-CITY ?auto_14234 ?auto_14235 ) ( not ( = ?auto_14228 ?auto_14234 ) ) ( OBJ-AT ?auto_14231 ?auto_14234 ) ( IN-CITY ?auto_14236 ?auto_14235 ) ( not ( = ?auto_14228 ?auto_14236 ) ) ( OBJ-AT ?auto_14229 ?auto_14236 ) ( TRUCK-AT ?auto_14232 ?auto_14228 ) ( not ( = ?auto_14229 ?auto_14231 ) ) ( not ( = ?auto_14234 ?auto_14236 ) ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( not ( = ?auto_14231 ?auto_14230 ) ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14236 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14229 ?auto_14231 ?auto_14230 ?auto_14228 )
      ( DELIVER-3PKG-VERIFY ?auto_14229 ?auto_14230 ?auto_14231 ?auto_14228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14248 - OBJ
      ?auto_14249 - OBJ
      ?auto_14250 - OBJ
      ?auto_14247 - LOCATION
    )
    :vars
    (
      ?auto_14255 - LOCATION
      ?auto_14253 - CITY
      ?auto_14254 - LOCATION
      ?auto_14251 - LOCATION
      ?auto_14252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14255 ?auto_14253 ) ( IN-CITY ?auto_14247 ?auto_14253 ) ( not ( = ?auto_14247 ?auto_14255 ) ) ( OBJ-AT ?auto_14250 ?auto_14255 ) ( IN-CITY ?auto_14254 ?auto_14253 ) ( not ( = ?auto_14247 ?auto_14254 ) ) ( OBJ-AT ?auto_14248 ?auto_14254 ) ( IN-CITY ?auto_14251 ?auto_14253 ) ( not ( = ?auto_14247 ?auto_14251 ) ) ( OBJ-AT ?auto_14249 ?auto_14251 ) ( TRUCK-AT ?auto_14252 ?auto_14247 ) ( not ( = ?auto_14249 ?auto_14248 ) ) ( not ( = ?auto_14254 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14248 ?auto_14250 ) ) ( not ( = ?auto_14255 ?auto_14254 ) ) ( not ( = ?auto_14255 ?auto_14251 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14249 ?auto_14250 ?auto_14248 ?auto_14247 )
      ( DELIVER-3PKG-VERIFY ?auto_14248 ?auto_14249 ?auto_14250 ?auto_14247 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14267 - OBJ
      ?auto_14268 - OBJ
      ?auto_14269 - OBJ
      ?auto_14266 - LOCATION
    )
    :vars
    (
      ?auto_14274 - LOCATION
      ?auto_14272 - CITY
      ?auto_14273 - LOCATION
      ?auto_14270 - LOCATION
      ?auto_14271 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14274 ?auto_14272 ) ( IN-CITY ?auto_14266 ?auto_14272 ) ( not ( = ?auto_14266 ?auto_14274 ) ) ( OBJ-AT ?auto_14268 ?auto_14274 ) ( IN-CITY ?auto_14273 ?auto_14272 ) ( not ( = ?auto_14266 ?auto_14273 ) ) ( OBJ-AT ?auto_14267 ?auto_14273 ) ( IN-CITY ?auto_14270 ?auto_14272 ) ( not ( = ?auto_14266 ?auto_14270 ) ) ( OBJ-AT ?auto_14269 ?auto_14270 ) ( TRUCK-AT ?auto_14271 ?auto_14266 ) ( not ( = ?auto_14269 ?auto_14267 ) ) ( not ( = ?auto_14273 ?auto_14270 ) ) ( not ( = ?auto_14269 ?auto_14268 ) ) ( not ( = ?auto_14267 ?auto_14268 ) ) ( not ( = ?auto_14274 ?auto_14273 ) ) ( not ( = ?auto_14274 ?auto_14270 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14269 ?auto_14268 ?auto_14267 ?auto_14266 )
      ( DELIVER-3PKG-VERIFY ?auto_14267 ?auto_14268 ?auto_14269 ?auto_14266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14306 - OBJ
      ?auto_14307 - OBJ
      ?auto_14308 - OBJ
      ?auto_14305 - LOCATION
    )
    :vars
    (
      ?auto_14313 - LOCATION
      ?auto_14311 - CITY
      ?auto_14312 - LOCATION
      ?auto_14309 - LOCATION
      ?auto_14310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14313 ?auto_14311 ) ( IN-CITY ?auto_14305 ?auto_14311 ) ( not ( = ?auto_14305 ?auto_14313 ) ) ( OBJ-AT ?auto_14306 ?auto_14313 ) ( IN-CITY ?auto_14312 ?auto_14311 ) ( not ( = ?auto_14305 ?auto_14312 ) ) ( OBJ-AT ?auto_14308 ?auto_14312 ) ( IN-CITY ?auto_14309 ?auto_14311 ) ( not ( = ?auto_14305 ?auto_14309 ) ) ( OBJ-AT ?auto_14307 ?auto_14309 ) ( TRUCK-AT ?auto_14310 ?auto_14305 ) ( not ( = ?auto_14307 ?auto_14308 ) ) ( not ( = ?auto_14312 ?auto_14309 ) ) ( not ( = ?auto_14307 ?auto_14306 ) ) ( not ( = ?auto_14308 ?auto_14306 ) ) ( not ( = ?auto_14313 ?auto_14312 ) ) ( not ( = ?auto_14313 ?auto_14309 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14307 ?auto_14306 ?auto_14308 ?auto_14305 )
      ( DELIVER-3PKG-VERIFY ?auto_14306 ?auto_14307 ?auto_14308 ?auto_14305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14325 - OBJ
      ?auto_14326 - OBJ
      ?auto_14327 - OBJ
      ?auto_14324 - LOCATION
    )
    :vars
    (
      ?auto_14332 - LOCATION
      ?auto_14330 - CITY
      ?auto_14331 - LOCATION
      ?auto_14328 - LOCATION
      ?auto_14329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14332 ?auto_14330 ) ( IN-CITY ?auto_14324 ?auto_14330 ) ( not ( = ?auto_14324 ?auto_14332 ) ) ( OBJ-AT ?auto_14325 ?auto_14332 ) ( IN-CITY ?auto_14331 ?auto_14330 ) ( not ( = ?auto_14324 ?auto_14331 ) ) ( OBJ-AT ?auto_14326 ?auto_14331 ) ( IN-CITY ?auto_14328 ?auto_14330 ) ( not ( = ?auto_14324 ?auto_14328 ) ) ( OBJ-AT ?auto_14327 ?auto_14328 ) ( TRUCK-AT ?auto_14329 ?auto_14324 ) ( not ( = ?auto_14327 ?auto_14326 ) ) ( not ( = ?auto_14331 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14325 ) ) ( not ( = ?auto_14326 ?auto_14325 ) ) ( not ( = ?auto_14332 ?auto_14331 ) ) ( not ( = ?auto_14332 ?auto_14328 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14327 ?auto_14325 ?auto_14326 ?auto_14324 )
      ( DELIVER-3PKG-VERIFY ?auto_14325 ?auto_14326 ?auto_14327 ?auto_14324 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14387 - OBJ
      ?auto_14386 - LOCATION
    )
    :vars
    (
      ?auto_14389 - LOCATION
      ?auto_14390 - CITY
      ?auto_14388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14389 ?auto_14390 ) ( IN-CITY ?auto_14386 ?auto_14390 ) ( not ( = ?auto_14386 ?auto_14389 ) ) ( OBJ-AT ?auto_14387 ?auto_14389 ) ( TRUCK-AT ?auto_14388 ?auto_14386 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14388 ?auto_14386 ?auto_14389 ?auto_14390 )
      ( !LOAD-TRUCK ?auto_14387 ?auto_14388 ?auto_14389 )
      ( !DRIVE-TRUCK ?auto_14388 ?auto_14389 ?auto_14386 ?auto_14390 )
      ( !UNLOAD-TRUCK ?auto_14387 ?auto_14388 ?auto_14386 )
      ( DELIVER-1PKG-VERIFY ?auto_14387 ?auto_14386 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15369 - OBJ
      ?auto_15370 - OBJ
      ?auto_15371 - OBJ
      ?auto_15372 - OBJ
      ?auto_15368 - LOCATION
    )
    :vars
    (
      ?auto_15373 - LOCATION
      ?auto_15374 - CITY
      ?auto_15377 - LOCATION
      ?auto_15376 - LOCATION
      ?auto_15375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15373 ?auto_15374 ) ( IN-CITY ?auto_15368 ?auto_15374 ) ( not ( = ?auto_15368 ?auto_15373 ) ) ( OBJ-AT ?auto_15372 ?auto_15373 ) ( IN-CITY ?auto_15377 ?auto_15374 ) ( not ( = ?auto_15368 ?auto_15377 ) ) ( OBJ-AT ?auto_15371 ?auto_15377 ) ( IN-CITY ?auto_15376 ?auto_15374 ) ( not ( = ?auto_15368 ?auto_15376 ) ) ( OBJ-AT ?auto_15370 ?auto_15376 ) ( OBJ-AT ?auto_15369 ?auto_15373 ) ( TRUCK-AT ?auto_15375 ?auto_15368 ) ( not ( = ?auto_15369 ?auto_15370 ) ) ( not ( = ?auto_15376 ?auto_15373 ) ) ( not ( = ?auto_15369 ?auto_15371 ) ) ( not ( = ?auto_15370 ?auto_15371 ) ) ( not ( = ?auto_15377 ?auto_15376 ) ) ( not ( = ?auto_15377 ?auto_15373 ) ) ( not ( = ?auto_15369 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15372 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_15369 ?auto_15371 ?auto_15370 ?auto_15368 )
      ( DELIVER-1PKG ?auto_15372 ?auto_15368 )
      ( DELIVER-4PKG-VERIFY ?auto_15369 ?auto_15370 ?auto_15371 ?auto_15372 ?auto_15368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15401 - OBJ
      ?auto_15402 - OBJ
      ?auto_15403 - OBJ
      ?auto_15404 - OBJ
      ?auto_15400 - LOCATION
    )
    :vars
    (
      ?auto_15409 - LOCATION
      ?auto_15406 - CITY
      ?auto_15407 - LOCATION
      ?auto_15405 - LOCATION
      ?auto_15408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15409 ?auto_15406 ) ( IN-CITY ?auto_15400 ?auto_15406 ) ( not ( = ?auto_15400 ?auto_15409 ) ) ( OBJ-AT ?auto_15403 ?auto_15409 ) ( IN-CITY ?auto_15407 ?auto_15406 ) ( not ( = ?auto_15400 ?auto_15407 ) ) ( OBJ-AT ?auto_15404 ?auto_15407 ) ( IN-CITY ?auto_15405 ?auto_15406 ) ( not ( = ?auto_15400 ?auto_15405 ) ) ( OBJ-AT ?auto_15402 ?auto_15405 ) ( OBJ-AT ?auto_15401 ?auto_15409 ) ( TRUCK-AT ?auto_15408 ?auto_15400 ) ( not ( = ?auto_15401 ?auto_15402 ) ) ( not ( = ?auto_15405 ?auto_15409 ) ) ( not ( = ?auto_15401 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15407 ?auto_15405 ) ) ( not ( = ?auto_15407 ?auto_15409 ) ) ( not ( = ?auto_15401 ?auto_15403 ) ) ( not ( = ?auto_15402 ?auto_15403 ) ) ( not ( = ?auto_15404 ?auto_15403 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15401 ?auto_15402 ?auto_15404 ?auto_15403 ?auto_15400 )
      ( DELIVER-4PKG-VERIFY ?auto_15401 ?auto_15402 ?auto_15403 ?auto_15404 ?auto_15400 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15433 - OBJ
      ?auto_15434 - OBJ
      ?auto_15435 - OBJ
      ?auto_15436 - OBJ
      ?auto_15432 - LOCATION
    )
    :vars
    (
      ?auto_15440 - LOCATION
      ?auto_15441 - CITY
      ?auto_15438 - LOCATION
      ?auto_15437 - LOCATION
      ?auto_15439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15440 ?auto_15441 ) ( IN-CITY ?auto_15432 ?auto_15441 ) ( not ( = ?auto_15432 ?auto_15440 ) ) ( OBJ-AT ?auto_15436 ?auto_15440 ) ( IN-CITY ?auto_15438 ?auto_15441 ) ( not ( = ?auto_15432 ?auto_15438 ) ) ( OBJ-AT ?auto_15434 ?auto_15438 ) ( IN-CITY ?auto_15437 ?auto_15441 ) ( not ( = ?auto_15432 ?auto_15437 ) ) ( OBJ-AT ?auto_15435 ?auto_15437 ) ( OBJ-AT ?auto_15433 ?auto_15440 ) ( TRUCK-AT ?auto_15439 ?auto_15432 ) ( not ( = ?auto_15433 ?auto_15435 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15433 ?auto_15434 ) ) ( not ( = ?auto_15435 ?auto_15434 ) ) ( not ( = ?auto_15438 ?auto_15437 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15433 ?auto_15436 ) ) ( not ( = ?auto_15435 ?auto_15436 ) ) ( not ( = ?auto_15434 ?auto_15436 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15433 ?auto_15435 ?auto_15436 ?auto_15434 ?auto_15432 )
      ( DELIVER-4PKG-VERIFY ?auto_15433 ?auto_15434 ?auto_15435 ?auto_15436 ?auto_15432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15465 - OBJ
      ?auto_15466 - OBJ
      ?auto_15467 - OBJ
      ?auto_15468 - OBJ
      ?auto_15464 - LOCATION
    )
    :vars
    (
      ?auto_15472 - LOCATION
      ?auto_15473 - CITY
      ?auto_15470 - LOCATION
      ?auto_15469 - LOCATION
      ?auto_15471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15472 ?auto_15473 ) ( IN-CITY ?auto_15464 ?auto_15473 ) ( not ( = ?auto_15464 ?auto_15472 ) ) ( OBJ-AT ?auto_15467 ?auto_15472 ) ( IN-CITY ?auto_15470 ?auto_15473 ) ( not ( = ?auto_15464 ?auto_15470 ) ) ( OBJ-AT ?auto_15466 ?auto_15470 ) ( IN-CITY ?auto_15469 ?auto_15473 ) ( not ( = ?auto_15464 ?auto_15469 ) ) ( OBJ-AT ?auto_15468 ?auto_15469 ) ( OBJ-AT ?auto_15465 ?auto_15472 ) ( TRUCK-AT ?auto_15471 ?auto_15464 ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15468 ?auto_15466 ) ) ( not ( = ?auto_15470 ?auto_15469 ) ) ( not ( = ?auto_15470 ?auto_15472 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15468 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15467 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15465 ?auto_15468 ?auto_15467 ?auto_15466 ?auto_15464 )
      ( DELIVER-4PKG-VERIFY ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ?auto_15464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15565 - OBJ
      ?auto_15566 - OBJ
      ?auto_15567 - OBJ
      ?auto_15568 - OBJ
      ?auto_15564 - LOCATION
    )
    :vars
    (
      ?auto_15572 - LOCATION
      ?auto_15573 - CITY
      ?auto_15570 - LOCATION
      ?auto_15569 - LOCATION
      ?auto_15571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15572 ?auto_15573 ) ( IN-CITY ?auto_15564 ?auto_15573 ) ( not ( = ?auto_15564 ?auto_15572 ) ) ( OBJ-AT ?auto_15566 ?auto_15572 ) ( IN-CITY ?auto_15570 ?auto_15573 ) ( not ( = ?auto_15564 ?auto_15570 ) ) ( OBJ-AT ?auto_15568 ?auto_15570 ) ( IN-CITY ?auto_15569 ?auto_15573 ) ( not ( = ?auto_15564 ?auto_15569 ) ) ( OBJ-AT ?auto_15567 ?auto_15569 ) ( OBJ-AT ?auto_15565 ?auto_15572 ) ( TRUCK-AT ?auto_15571 ?auto_15564 ) ( not ( = ?auto_15565 ?auto_15567 ) ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15570 ?auto_15569 ) ) ( not ( = ?auto_15570 ?auto_15572 ) ) ( not ( = ?auto_15565 ?auto_15566 ) ) ( not ( = ?auto_15567 ?auto_15566 ) ) ( not ( = ?auto_15568 ?auto_15566 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15565 ?auto_15567 ?auto_15566 ?auto_15568 ?auto_15564 )
      ( DELIVER-4PKG-VERIFY ?auto_15565 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15597 - OBJ
      ?auto_15598 - OBJ
      ?auto_15599 - OBJ
      ?auto_15600 - OBJ
      ?auto_15596 - LOCATION
    )
    :vars
    (
      ?auto_15604 - LOCATION
      ?auto_15605 - CITY
      ?auto_15602 - LOCATION
      ?auto_15601 - LOCATION
      ?auto_15603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15604 ?auto_15605 ) ( IN-CITY ?auto_15596 ?auto_15605 ) ( not ( = ?auto_15596 ?auto_15604 ) ) ( OBJ-AT ?auto_15598 ?auto_15604 ) ( IN-CITY ?auto_15602 ?auto_15605 ) ( not ( = ?auto_15596 ?auto_15602 ) ) ( OBJ-AT ?auto_15599 ?auto_15602 ) ( IN-CITY ?auto_15601 ?auto_15605 ) ( not ( = ?auto_15596 ?auto_15601 ) ) ( OBJ-AT ?auto_15600 ?auto_15601 ) ( OBJ-AT ?auto_15597 ?auto_15604 ) ( TRUCK-AT ?auto_15603 ?auto_15596 ) ( not ( = ?auto_15597 ?auto_15600 ) ) ( not ( = ?auto_15601 ?auto_15604 ) ) ( not ( = ?auto_15597 ?auto_15599 ) ) ( not ( = ?auto_15600 ?auto_15599 ) ) ( not ( = ?auto_15602 ?auto_15601 ) ) ( not ( = ?auto_15602 ?auto_15604 ) ) ( not ( = ?auto_15597 ?auto_15598 ) ) ( not ( = ?auto_15600 ?auto_15598 ) ) ( not ( = ?auto_15599 ?auto_15598 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15597 ?auto_15600 ?auto_15598 ?auto_15599 ?auto_15596 )
      ( DELIVER-4PKG-VERIFY ?auto_15597 ?auto_15598 ?auto_15599 ?auto_15600 ?auto_15596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15697 - OBJ
      ?auto_15698 - OBJ
      ?auto_15699 - OBJ
      ?auto_15700 - OBJ
      ?auto_15696 - LOCATION
    )
    :vars
    (
      ?auto_15704 - LOCATION
      ?auto_15705 - CITY
      ?auto_15702 - LOCATION
      ?auto_15701 - LOCATION
      ?auto_15703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15704 ?auto_15705 ) ( IN-CITY ?auto_15696 ?auto_15705 ) ( not ( = ?auto_15696 ?auto_15704 ) ) ( OBJ-AT ?auto_15700 ?auto_15704 ) ( IN-CITY ?auto_15702 ?auto_15705 ) ( not ( = ?auto_15696 ?auto_15702 ) ) ( OBJ-AT ?auto_15699 ?auto_15702 ) ( IN-CITY ?auto_15701 ?auto_15705 ) ( not ( = ?auto_15696 ?auto_15701 ) ) ( OBJ-AT ?auto_15697 ?auto_15701 ) ( OBJ-AT ?auto_15698 ?auto_15704 ) ( TRUCK-AT ?auto_15703 ?auto_15696 ) ( not ( = ?auto_15698 ?auto_15697 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15697 ?auto_15699 ) ) ( not ( = ?auto_15702 ?auto_15701 ) ) ( not ( = ?auto_15702 ?auto_15704 ) ) ( not ( = ?auto_15698 ?auto_15700 ) ) ( not ( = ?auto_15697 ?auto_15700 ) ) ( not ( = ?auto_15699 ?auto_15700 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15698 ?auto_15697 ?auto_15700 ?auto_15699 ?auto_15696 )
      ( DELIVER-4PKG-VERIFY ?auto_15697 ?auto_15698 ?auto_15699 ?auto_15700 ?auto_15696 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15729 - OBJ
      ?auto_15730 - OBJ
      ?auto_15731 - OBJ
      ?auto_15732 - OBJ
      ?auto_15728 - LOCATION
    )
    :vars
    (
      ?auto_15736 - LOCATION
      ?auto_15737 - CITY
      ?auto_15734 - LOCATION
      ?auto_15733 - LOCATION
      ?auto_15735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15736 ?auto_15737 ) ( IN-CITY ?auto_15728 ?auto_15737 ) ( not ( = ?auto_15728 ?auto_15736 ) ) ( OBJ-AT ?auto_15731 ?auto_15736 ) ( IN-CITY ?auto_15734 ?auto_15737 ) ( not ( = ?auto_15728 ?auto_15734 ) ) ( OBJ-AT ?auto_15732 ?auto_15734 ) ( IN-CITY ?auto_15733 ?auto_15737 ) ( not ( = ?auto_15728 ?auto_15733 ) ) ( OBJ-AT ?auto_15729 ?auto_15733 ) ( OBJ-AT ?auto_15730 ?auto_15736 ) ( TRUCK-AT ?auto_15735 ?auto_15728 ) ( not ( = ?auto_15730 ?auto_15729 ) ) ( not ( = ?auto_15733 ?auto_15736 ) ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( not ( = ?auto_15729 ?auto_15732 ) ) ( not ( = ?auto_15734 ?auto_15733 ) ) ( not ( = ?auto_15734 ?auto_15736 ) ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15732 ?auto_15731 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15730 ?auto_15729 ?auto_15731 ?auto_15732 ?auto_15728 )
      ( DELIVER-4PKG-VERIFY ?auto_15729 ?auto_15730 ?auto_15731 ?auto_15732 ?auto_15728 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15830 - OBJ
      ?auto_15831 - OBJ
      ?auto_15832 - OBJ
      ?auto_15833 - OBJ
      ?auto_15829 - LOCATION
    )
    :vars
    (
      ?auto_15837 - LOCATION
      ?auto_15838 - CITY
      ?auto_15835 - LOCATION
      ?auto_15834 - LOCATION
      ?auto_15836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15837 ?auto_15838 ) ( IN-CITY ?auto_15829 ?auto_15838 ) ( not ( = ?auto_15829 ?auto_15837 ) ) ( OBJ-AT ?auto_15833 ?auto_15837 ) ( IN-CITY ?auto_15835 ?auto_15838 ) ( not ( = ?auto_15829 ?auto_15835 ) ) ( OBJ-AT ?auto_15831 ?auto_15835 ) ( IN-CITY ?auto_15834 ?auto_15838 ) ( not ( = ?auto_15829 ?auto_15834 ) ) ( OBJ-AT ?auto_15830 ?auto_15834 ) ( OBJ-AT ?auto_15832 ?auto_15837 ) ( TRUCK-AT ?auto_15836 ?auto_15829 ) ( not ( = ?auto_15832 ?auto_15830 ) ) ( not ( = ?auto_15834 ?auto_15837 ) ) ( not ( = ?auto_15832 ?auto_15831 ) ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( not ( = ?auto_15835 ?auto_15834 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15832 ?auto_15833 ) ) ( not ( = ?auto_15830 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15832 ?auto_15830 ?auto_15833 ?auto_15831 ?auto_15829 )
      ( DELIVER-4PKG-VERIFY ?auto_15830 ?auto_15831 ?auto_15832 ?auto_15833 ?auto_15829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15862 - OBJ
      ?auto_15863 - OBJ
      ?auto_15864 - OBJ
      ?auto_15865 - OBJ
      ?auto_15861 - LOCATION
    )
    :vars
    (
      ?auto_15869 - LOCATION
      ?auto_15870 - CITY
      ?auto_15867 - LOCATION
      ?auto_15866 - LOCATION
      ?auto_15868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15869 ?auto_15870 ) ( IN-CITY ?auto_15861 ?auto_15870 ) ( not ( = ?auto_15861 ?auto_15869 ) ) ( OBJ-AT ?auto_15864 ?auto_15869 ) ( IN-CITY ?auto_15867 ?auto_15870 ) ( not ( = ?auto_15861 ?auto_15867 ) ) ( OBJ-AT ?auto_15863 ?auto_15867 ) ( IN-CITY ?auto_15866 ?auto_15870 ) ( not ( = ?auto_15861 ?auto_15866 ) ) ( OBJ-AT ?auto_15862 ?auto_15866 ) ( OBJ-AT ?auto_15865 ?auto_15869 ) ( TRUCK-AT ?auto_15868 ?auto_15861 ) ( not ( = ?auto_15865 ?auto_15862 ) ) ( not ( = ?auto_15866 ?auto_15869 ) ) ( not ( = ?auto_15865 ?auto_15863 ) ) ( not ( = ?auto_15862 ?auto_15863 ) ) ( not ( = ?auto_15867 ?auto_15866 ) ) ( not ( = ?auto_15867 ?auto_15869 ) ) ( not ( = ?auto_15865 ?auto_15864 ) ) ( not ( = ?auto_15862 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15864 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15865 ?auto_15862 ?auto_15864 ?auto_15863 ?auto_15861 )
      ( DELIVER-4PKG-VERIFY ?auto_15862 ?auto_15863 ?auto_15864 ?auto_15865 ?auto_15861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15927 - OBJ
      ?auto_15928 - OBJ
      ?auto_15929 - OBJ
      ?auto_15930 - OBJ
      ?auto_15926 - LOCATION
    )
    :vars
    (
      ?auto_15934 - LOCATION
      ?auto_15935 - CITY
      ?auto_15932 - LOCATION
      ?auto_15931 - LOCATION
      ?auto_15933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15934 ?auto_15935 ) ( IN-CITY ?auto_15926 ?auto_15935 ) ( not ( = ?auto_15926 ?auto_15934 ) ) ( OBJ-AT ?auto_15928 ?auto_15934 ) ( IN-CITY ?auto_15932 ?auto_15935 ) ( not ( = ?auto_15926 ?auto_15932 ) ) ( OBJ-AT ?auto_15930 ?auto_15932 ) ( IN-CITY ?auto_15931 ?auto_15935 ) ( not ( = ?auto_15926 ?auto_15931 ) ) ( OBJ-AT ?auto_15927 ?auto_15931 ) ( OBJ-AT ?auto_15929 ?auto_15934 ) ( TRUCK-AT ?auto_15933 ?auto_15926 ) ( not ( = ?auto_15929 ?auto_15927 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( not ( = ?auto_15927 ?auto_15930 ) ) ( not ( = ?auto_15932 ?auto_15931 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15929 ?auto_15928 ) ) ( not ( = ?auto_15927 ?auto_15928 ) ) ( not ( = ?auto_15930 ?auto_15928 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15929 ?auto_15927 ?auto_15928 ?auto_15930 ?auto_15926 )
      ( DELIVER-4PKG-VERIFY ?auto_15927 ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15994 - OBJ
      ?auto_15995 - OBJ
      ?auto_15996 - OBJ
      ?auto_15997 - OBJ
      ?auto_15993 - LOCATION
    )
    :vars
    (
      ?auto_16001 - LOCATION
      ?auto_16002 - CITY
      ?auto_15999 - LOCATION
      ?auto_15998 - LOCATION
      ?auto_16000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16001 ?auto_16002 ) ( IN-CITY ?auto_15993 ?auto_16002 ) ( not ( = ?auto_15993 ?auto_16001 ) ) ( OBJ-AT ?auto_15995 ?auto_16001 ) ( IN-CITY ?auto_15999 ?auto_16002 ) ( not ( = ?auto_15993 ?auto_15999 ) ) ( OBJ-AT ?auto_15996 ?auto_15999 ) ( IN-CITY ?auto_15998 ?auto_16002 ) ( not ( = ?auto_15993 ?auto_15998 ) ) ( OBJ-AT ?auto_15994 ?auto_15998 ) ( OBJ-AT ?auto_15997 ?auto_16001 ) ( TRUCK-AT ?auto_16000 ?auto_15993 ) ( not ( = ?auto_15997 ?auto_15994 ) ) ( not ( = ?auto_15998 ?auto_16001 ) ) ( not ( = ?auto_15997 ?auto_15996 ) ) ( not ( = ?auto_15994 ?auto_15996 ) ) ( not ( = ?auto_15999 ?auto_15998 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_15997 ?auto_15995 ) ) ( not ( = ?auto_15994 ?auto_15995 ) ) ( not ( = ?auto_15996 ?auto_15995 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15997 ?auto_15994 ?auto_15995 ?auto_15996 ?auto_15993 )
      ( DELIVER-4PKG-VERIFY ?auto_15994 ?auto_15995 ?auto_15996 ?auto_15997 ?auto_15993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16094 - OBJ
      ?auto_16095 - OBJ
      ?auto_16096 - OBJ
      ?auto_16097 - OBJ
      ?auto_16093 - LOCATION
    )
    :vars
    (
      ?auto_16101 - LOCATION
      ?auto_16102 - CITY
      ?auto_16099 - LOCATION
      ?auto_16098 - LOCATION
      ?auto_16100 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16101 ?auto_16102 ) ( IN-CITY ?auto_16093 ?auto_16102 ) ( not ( = ?auto_16093 ?auto_16101 ) ) ( OBJ-AT ?auto_16097 ?auto_16101 ) ( IN-CITY ?auto_16099 ?auto_16102 ) ( not ( = ?auto_16093 ?auto_16099 ) ) ( OBJ-AT ?auto_16094 ?auto_16099 ) ( IN-CITY ?auto_16098 ?auto_16102 ) ( not ( = ?auto_16093 ?auto_16098 ) ) ( OBJ-AT ?auto_16096 ?auto_16098 ) ( OBJ-AT ?auto_16095 ?auto_16101 ) ( TRUCK-AT ?auto_16100 ?auto_16093 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( not ( = ?auto_16098 ?auto_16101 ) ) ( not ( = ?auto_16095 ?auto_16094 ) ) ( not ( = ?auto_16096 ?auto_16094 ) ) ( not ( = ?auto_16099 ?auto_16098 ) ) ( not ( = ?auto_16099 ?auto_16101 ) ) ( not ( = ?auto_16095 ?auto_16097 ) ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( not ( = ?auto_16094 ?auto_16097 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16095 ?auto_16096 ?auto_16097 ?auto_16094 ?auto_16093 )
      ( DELIVER-4PKG-VERIFY ?auto_16094 ?auto_16095 ?auto_16096 ?auto_16097 ?auto_16093 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16126 - OBJ
      ?auto_16127 - OBJ
      ?auto_16128 - OBJ
      ?auto_16129 - OBJ
      ?auto_16125 - LOCATION
    )
    :vars
    (
      ?auto_16133 - LOCATION
      ?auto_16134 - CITY
      ?auto_16131 - LOCATION
      ?auto_16130 - LOCATION
      ?auto_16132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16133 ?auto_16134 ) ( IN-CITY ?auto_16125 ?auto_16134 ) ( not ( = ?auto_16125 ?auto_16133 ) ) ( OBJ-AT ?auto_16128 ?auto_16133 ) ( IN-CITY ?auto_16131 ?auto_16134 ) ( not ( = ?auto_16125 ?auto_16131 ) ) ( OBJ-AT ?auto_16126 ?auto_16131 ) ( IN-CITY ?auto_16130 ?auto_16134 ) ( not ( = ?auto_16125 ?auto_16130 ) ) ( OBJ-AT ?auto_16129 ?auto_16130 ) ( OBJ-AT ?auto_16127 ?auto_16133 ) ( TRUCK-AT ?auto_16132 ?auto_16125 ) ( not ( = ?auto_16127 ?auto_16129 ) ) ( not ( = ?auto_16130 ?auto_16133 ) ) ( not ( = ?auto_16127 ?auto_16126 ) ) ( not ( = ?auto_16129 ?auto_16126 ) ) ( not ( = ?auto_16131 ?auto_16130 ) ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16127 ?auto_16128 ) ) ( not ( = ?auto_16129 ?auto_16128 ) ) ( not ( = ?auto_16126 ?auto_16128 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16127 ?auto_16129 ?auto_16128 ?auto_16126 ?auto_16125 )
      ( DELIVER-4PKG-VERIFY ?auto_16126 ?auto_16127 ?auto_16128 ?auto_16129 ?auto_16125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16158 - OBJ
      ?auto_16159 - OBJ
      ?auto_16160 - OBJ
      ?auto_16161 - OBJ
      ?auto_16157 - LOCATION
    )
    :vars
    (
      ?auto_16165 - LOCATION
      ?auto_16166 - CITY
      ?auto_16163 - LOCATION
      ?auto_16162 - LOCATION
      ?auto_16164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16165 ?auto_16166 ) ( IN-CITY ?auto_16157 ?auto_16166 ) ( not ( = ?auto_16157 ?auto_16165 ) ) ( OBJ-AT ?auto_16161 ?auto_16165 ) ( IN-CITY ?auto_16163 ?auto_16166 ) ( not ( = ?auto_16157 ?auto_16163 ) ) ( OBJ-AT ?auto_16158 ?auto_16163 ) ( IN-CITY ?auto_16162 ?auto_16166 ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( OBJ-AT ?auto_16159 ?auto_16162 ) ( OBJ-AT ?auto_16160 ?auto_16165 ) ( TRUCK-AT ?auto_16164 ?auto_16157 ) ( not ( = ?auto_16160 ?auto_16159 ) ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16158 ) ) ( not ( = ?auto_16159 ?auto_16158 ) ) ( not ( = ?auto_16163 ?auto_16162 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16160 ?auto_16159 ?auto_16161 ?auto_16158 ?auto_16157 )
      ( DELIVER-4PKG-VERIFY ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16190 - OBJ
      ?auto_16191 - OBJ
      ?auto_16192 - OBJ
      ?auto_16193 - OBJ
      ?auto_16189 - LOCATION
    )
    :vars
    (
      ?auto_16197 - LOCATION
      ?auto_16198 - CITY
      ?auto_16195 - LOCATION
      ?auto_16194 - LOCATION
      ?auto_16196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16197 ?auto_16198 ) ( IN-CITY ?auto_16189 ?auto_16198 ) ( not ( = ?auto_16189 ?auto_16197 ) ) ( OBJ-AT ?auto_16192 ?auto_16197 ) ( IN-CITY ?auto_16195 ?auto_16198 ) ( not ( = ?auto_16189 ?auto_16195 ) ) ( OBJ-AT ?auto_16190 ?auto_16195 ) ( IN-CITY ?auto_16194 ?auto_16198 ) ( not ( = ?auto_16189 ?auto_16194 ) ) ( OBJ-AT ?auto_16191 ?auto_16194 ) ( OBJ-AT ?auto_16193 ?auto_16197 ) ( TRUCK-AT ?auto_16196 ?auto_16189 ) ( not ( = ?auto_16193 ?auto_16191 ) ) ( not ( = ?auto_16194 ?auto_16197 ) ) ( not ( = ?auto_16193 ?auto_16190 ) ) ( not ( = ?auto_16191 ?auto_16190 ) ) ( not ( = ?auto_16195 ?auto_16194 ) ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16193 ?auto_16192 ) ) ( not ( = ?auto_16191 ?auto_16192 ) ) ( not ( = ?auto_16190 ?auto_16192 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16193 ?auto_16191 ?auto_16192 ?auto_16190 ?auto_16189 )
      ( DELIVER-4PKG-VERIFY ?auto_16190 ?auto_16191 ?auto_16192 ?auto_16193 ?auto_16189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16324 - OBJ
      ?auto_16325 - OBJ
      ?auto_16326 - OBJ
      ?auto_16327 - OBJ
      ?auto_16323 - LOCATION
    )
    :vars
    (
      ?auto_16331 - LOCATION
      ?auto_16332 - CITY
      ?auto_16329 - LOCATION
      ?auto_16328 - LOCATION
      ?auto_16330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16331 ?auto_16332 ) ( IN-CITY ?auto_16323 ?auto_16332 ) ( not ( = ?auto_16323 ?auto_16331 ) ) ( OBJ-AT ?auto_16325 ?auto_16331 ) ( IN-CITY ?auto_16329 ?auto_16332 ) ( not ( = ?auto_16323 ?auto_16329 ) ) ( OBJ-AT ?auto_16324 ?auto_16329 ) ( IN-CITY ?auto_16328 ?auto_16332 ) ( not ( = ?auto_16323 ?auto_16328 ) ) ( OBJ-AT ?auto_16327 ?auto_16328 ) ( OBJ-AT ?auto_16326 ?auto_16331 ) ( TRUCK-AT ?auto_16330 ?auto_16323 ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16328 ?auto_16331 ) ) ( not ( = ?auto_16326 ?auto_16324 ) ) ( not ( = ?auto_16327 ?auto_16324 ) ) ( not ( = ?auto_16329 ?auto_16328 ) ) ( not ( = ?auto_16329 ?auto_16331 ) ) ( not ( = ?auto_16326 ?auto_16325 ) ) ( not ( = ?auto_16327 ?auto_16325 ) ) ( not ( = ?auto_16324 ?auto_16325 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16326 ?auto_16327 ?auto_16325 ?auto_16324 ?auto_16323 )
      ( DELIVER-4PKG-VERIFY ?auto_16324 ?auto_16325 ?auto_16326 ?auto_16327 ?auto_16323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16356 - OBJ
      ?auto_16357 - OBJ
      ?auto_16358 - OBJ
      ?auto_16359 - OBJ
      ?auto_16355 - LOCATION
    )
    :vars
    (
      ?auto_16363 - LOCATION
      ?auto_16364 - CITY
      ?auto_16361 - LOCATION
      ?auto_16360 - LOCATION
      ?auto_16362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16363 ?auto_16364 ) ( IN-CITY ?auto_16355 ?auto_16364 ) ( not ( = ?auto_16355 ?auto_16363 ) ) ( OBJ-AT ?auto_16357 ?auto_16363 ) ( IN-CITY ?auto_16361 ?auto_16364 ) ( not ( = ?auto_16355 ?auto_16361 ) ) ( OBJ-AT ?auto_16356 ?auto_16361 ) ( IN-CITY ?auto_16360 ?auto_16364 ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( OBJ-AT ?auto_16358 ?auto_16360 ) ( OBJ-AT ?auto_16359 ?auto_16363 ) ( TRUCK-AT ?auto_16362 ?auto_16355 ) ( not ( = ?auto_16359 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16363 ) ) ( not ( = ?auto_16359 ?auto_16356 ) ) ( not ( = ?auto_16358 ?auto_16356 ) ) ( not ( = ?auto_16361 ?auto_16360 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16359 ?auto_16357 ) ) ( not ( = ?auto_16358 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16357 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16359 ?auto_16358 ?auto_16357 ?auto_16356 ?auto_16355 )
      ( DELIVER-4PKG-VERIFY ?auto_16356 ?auto_16357 ?auto_16358 ?auto_16359 ?auto_16355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16559 - OBJ
      ?auto_16560 - OBJ
      ?auto_16561 - OBJ
      ?auto_16562 - OBJ
      ?auto_16558 - LOCATION
    )
    :vars
    (
      ?auto_16566 - LOCATION
      ?auto_16567 - CITY
      ?auto_16564 - LOCATION
      ?auto_16563 - LOCATION
      ?auto_16565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16566 ?auto_16567 ) ( IN-CITY ?auto_16558 ?auto_16567 ) ( not ( = ?auto_16558 ?auto_16566 ) ) ( OBJ-AT ?auto_16559 ?auto_16566 ) ( IN-CITY ?auto_16564 ?auto_16567 ) ( not ( = ?auto_16558 ?auto_16564 ) ) ( OBJ-AT ?auto_16562 ?auto_16564 ) ( IN-CITY ?auto_16563 ?auto_16567 ) ( not ( = ?auto_16558 ?auto_16563 ) ) ( OBJ-AT ?auto_16561 ?auto_16563 ) ( OBJ-AT ?auto_16560 ?auto_16566 ) ( TRUCK-AT ?auto_16565 ?auto_16558 ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( not ( = ?auto_16563 ?auto_16566 ) ) ( not ( = ?auto_16560 ?auto_16562 ) ) ( not ( = ?auto_16561 ?auto_16562 ) ) ( not ( = ?auto_16564 ?auto_16563 ) ) ( not ( = ?auto_16564 ?auto_16566 ) ) ( not ( = ?auto_16560 ?auto_16559 ) ) ( not ( = ?auto_16561 ?auto_16559 ) ) ( not ( = ?auto_16562 ?auto_16559 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16560 ?auto_16561 ?auto_16559 ?auto_16562 ?auto_16558 )
      ( DELIVER-4PKG-VERIFY ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ?auto_16558 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16591 - OBJ
      ?auto_16592 - OBJ
      ?auto_16593 - OBJ
      ?auto_16594 - OBJ
      ?auto_16590 - LOCATION
    )
    :vars
    (
      ?auto_16598 - LOCATION
      ?auto_16599 - CITY
      ?auto_16596 - LOCATION
      ?auto_16595 - LOCATION
      ?auto_16597 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16598 ?auto_16599 ) ( IN-CITY ?auto_16590 ?auto_16599 ) ( not ( = ?auto_16590 ?auto_16598 ) ) ( OBJ-AT ?auto_16591 ?auto_16598 ) ( IN-CITY ?auto_16596 ?auto_16599 ) ( not ( = ?auto_16590 ?auto_16596 ) ) ( OBJ-AT ?auto_16593 ?auto_16596 ) ( IN-CITY ?auto_16595 ?auto_16599 ) ( not ( = ?auto_16590 ?auto_16595 ) ) ( OBJ-AT ?auto_16594 ?auto_16595 ) ( OBJ-AT ?auto_16592 ?auto_16598 ) ( TRUCK-AT ?auto_16597 ?auto_16590 ) ( not ( = ?auto_16592 ?auto_16594 ) ) ( not ( = ?auto_16595 ?auto_16598 ) ) ( not ( = ?auto_16592 ?auto_16593 ) ) ( not ( = ?auto_16594 ?auto_16593 ) ) ( not ( = ?auto_16596 ?auto_16595 ) ) ( not ( = ?auto_16596 ?auto_16598 ) ) ( not ( = ?auto_16592 ?auto_16591 ) ) ( not ( = ?auto_16594 ?auto_16591 ) ) ( not ( = ?auto_16593 ?auto_16591 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16592 ?auto_16594 ?auto_16591 ?auto_16593 ?auto_16590 )
      ( DELIVER-4PKG-VERIFY ?auto_16591 ?auto_16592 ?auto_16593 ?auto_16594 ?auto_16590 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16691 - OBJ
      ?auto_16692 - OBJ
      ?auto_16693 - OBJ
      ?auto_16694 - OBJ
      ?auto_16690 - LOCATION
    )
    :vars
    (
      ?auto_16698 - LOCATION
      ?auto_16699 - CITY
      ?auto_16696 - LOCATION
      ?auto_16695 - LOCATION
      ?auto_16697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16698 ?auto_16699 ) ( IN-CITY ?auto_16690 ?auto_16699 ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( OBJ-AT ?auto_16691 ?auto_16698 ) ( IN-CITY ?auto_16696 ?auto_16699 ) ( not ( = ?auto_16690 ?auto_16696 ) ) ( OBJ-AT ?auto_16694 ?auto_16696 ) ( IN-CITY ?auto_16695 ?auto_16699 ) ( not ( = ?auto_16690 ?auto_16695 ) ) ( OBJ-AT ?auto_16692 ?auto_16695 ) ( OBJ-AT ?auto_16693 ?auto_16698 ) ( TRUCK-AT ?auto_16697 ?auto_16690 ) ( not ( = ?auto_16693 ?auto_16692 ) ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16695 ) ) ( not ( = ?auto_16696 ?auto_16698 ) ) ( not ( = ?auto_16693 ?auto_16691 ) ) ( not ( = ?auto_16692 ?auto_16691 ) ) ( not ( = ?auto_16694 ?auto_16691 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16693 ?auto_16692 ?auto_16691 ?auto_16694 ?auto_16690 )
      ( DELIVER-4PKG-VERIFY ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16690 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16758 - OBJ
      ?auto_16759 - OBJ
      ?auto_16760 - OBJ
      ?auto_16761 - OBJ
      ?auto_16757 - LOCATION
    )
    :vars
    (
      ?auto_16765 - LOCATION
      ?auto_16766 - CITY
      ?auto_16763 - LOCATION
      ?auto_16762 - LOCATION
      ?auto_16764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16765 ?auto_16766 ) ( IN-CITY ?auto_16757 ?auto_16766 ) ( not ( = ?auto_16757 ?auto_16765 ) ) ( OBJ-AT ?auto_16758 ?auto_16765 ) ( IN-CITY ?auto_16763 ?auto_16766 ) ( not ( = ?auto_16757 ?auto_16763 ) ) ( OBJ-AT ?auto_16760 ?auto_16763 ) ( IN-CITY ?auto_16762 ?auto_16766 ) ( not ( = ?auto_16757 ?auto_16762 ) ) ( OBJ-AT ?auto_16759 ?auto_16762 ) ( OBJ-AT ?auto_16761 ?auto_16765 ) ( TRUCK-AT ?auto_16764 ?auto_16757 ) ( not ( = ?auto_16761 ?auto_16759 ) ) ( not ( = ?auto_16762 ?auto_16765 ) ) ( not ( = ?auto_16761 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16763 ?auto_16762 ) ) ( not ( = ?auto_16763 ?auto_16765 ) ) ( not ( = ?auto_16761 ?auto_16758 ) ) ( not ( = ?auto_16759 ?auto_16758 ) ) ( not ( = ?auto_16760 ?auto_16758 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16761 ?auto_16759 ?auto_16758 ?auto_16760 ?auto_16757 )
      ( DELIVER-4PKG-VERIFY ?auto_16758 ?auto_16759 ?auto_16760 ?auto_16761 ?auto_16757 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16858 - OBJ
      ?auto_16859 - OBJ
      ?auto_16860 - OBJ
      ?auto_16861 - OBJ
      ?auto_16857 - LOCATION
    )
    :vars
    (
      ?auto_16865 - LOCATION
      ?auto_16866 - CITY
      ?auto_16863 - LOCATION
      ?auto_16862 - LOCATION
      ?auto_16864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16865 ?auto_16866 ) ( IN-CITY ?auto_16857 ?auto_16866 ) ( not ( = ?auto_16857 ?auto_16865 ) ) ( OBJ-AT ?auto_16858 ?auto_16865 ) ( IN-CITY ?auto_16863 ?auto_16866 ) ( not ( = ?auto_16857 ?auto_16863 ) ) ( OBJ-AT ?auto_16859 ?auto_16863 ) ( IN-CITY ?auto_16862 ?auto_16866 ) ( not ( = ?auto_16857 ?auto_16862 ) ) ( OBJ-AT ?auto_16861 ?auto_16862 ) ( OBJ-AT ?auto_16860 ?auto_16865 ) ( TRUCK-AT ?auto_16864 ?auto_16857 ) ( not ( = ?auto_16860 ?auto_16861 ) ) ( not ( = ?auto_16862 ?auto_16865 ) ) ( not ( = ?auto_16860 ?auto_16859 ) ) ( not ( = ?auto_16861 ?auto_16859 ) ) ( not ( = ?auto_16863 ?auto_16862 ) ) ( not ( = ?auto_16863 ?auto_16865 ) ) ( not ( = ?auto_16860 ?auto_16858 ) ) ( not ( = ?auto_16861 ?auto_16858 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16860 ?auto_16861 ?auto_16858 ?auto_16859 ?auto_16857 )
      ( DELIVER-4PKG-VERIFY ?auto_16858 ?auto_16859 ?auto_16860 ?auto_16861 ?auto_16857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16890 - OBJ
      ?auto_16891 - OBJ
      ?auto_16892 - OBJ
      ?auto_16893 - OBJ
      ?auto_16889 - LOCATION
    )
    :vars
    (
      ?auto_16897 - LOCATION
      ?auto_16898 - CITY
      ?auto_16895 - LOCATION
      ?auto_16894 - LOCATION
      ?auto_16896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16897 ?auto_16898 ) ( IN-CITY ?auto_16889 ?auto_16898 ) ( not ( = ?auto_16889 ?auto_16897 ) ) ( OBJ-AT ?auto_16890 ?auto_16897 ) ( IN-CITY ?auto_16895 ?auto_16898 ) ( not ( = ?auto_16889 ?auto_16895 ) ) ( OBJ-AT ?auto_16891 ?auto_16895 ) ( IN-CITY ?auto_16894 ?auto_16898 ) ( not ( = ?auto_16889 ?auto_16894 ) ) ( OBJ-AT ?auto_16892 ?auto_16894 ) ( OBJ-AT ?auto_16893 ?auto_16897 ) ( TRUCK-AT ?auto_16896 ?auto_16889 ) ( not ( = ?auto_16893 ?auto_16892 ) ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16891 ) ) ( not ( = ?auto_16892 ?auto_16891 ) ) ( not ( = ?auto_16895 ?auto_16894 ) ) ( not ( = ?auto_16895 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16890 ) ) ( not ( = ?auto_16892 ?auto_16890 ) ) ( not ( = ?auto_16891 ?auto_16890 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16893 ?auto_16892 ?auto_16890 ?auto_16891 ?auto_16889 )
      ( DELIVER-4PKG-VERIFY ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16889 ) )
  )

)

