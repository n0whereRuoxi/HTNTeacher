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
      ?auto_209 - OBJ
      ?auto_210 - LOCATION
    )
    :vars
    (
      ?auto_211 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_211 ?auto_210 ) ( IN-TRUCK ?auto_209 ?auto_211 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_209 ?auto_211 ?auto_210 )
      ( DELIVER-1PKG-VERIFY ?auto_209 ?auto_210 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216 - OBJ
      ?auto_217 - LOCATION
    )
    :vars
    (
      ?auto_218 - TRUCK
      ?auto_222 - LOCATION
      ?auto_223 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216 ?auto_218 ) ( TRUCK-AT ?auto_218 ?auto_222 ) ( IN-CITY ?auto_222 ?auto_223 ) ( IN-CITY ?auto_217 ?auto_223 ) ( not ( = ?auto_217 ?auto_222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_218 ?auto_222 ?auto_217 ?auto_223 )
      ( DELIVER-1PKG ?auto_216 ?auto_217 )
      ( DELIVER-1PKG-VERIFY ?auto_216 ?auto_217 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_227 - OBJ
      ?auto_228 - LOCATION
    )
    :vars
    (
      ?auto_232 - TRUCK
      ?auto_229 - LOCATION
      ?auto_233 - CITY
      ?auto_235 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_232 ?auto_229 ) ( IN-CITY ?auto_229 ?auto_233 ) ( IN-CITY ?auto_228 ?auto_233 ) ( not ( = ?auto_228 ?auto_229 ) ) ( TRUCK-AT ?auto_232 ?auto_235 ) ( OBJ-AT ?auto_227 ?auto_235 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_227 ?auto_232 ?auto_235 )
      ( DELIVER-1PKG ?auto_227 ?auto_228 )
      ( DELIVER-1PKG-VERIFY ?auto_227 ?auto_228 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_239 - OBJ
      ?auto_240 - LOCATION
    )
    :vars
    (
      ?auto_245 - LOCATION
      ?auto_244 - CITY
      ?auto_243 - TRUCK
      ?auto_248 - LOCATION
      ?auto_249 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_245 ?auto_244 ) ( IN-CITY ?auto_240 ?auto_244 ) ( not ( = ?auto_240 ?auto_245 ) ) ( OBJ-AT ?auto_239 ?auto_245 ) ( TRUCK-AT ?auto_243 ?auto_248 ) ( IN-CITY ?auto_248 ?auto_249 ) ( IN-CITY ?auto_245 ?auto_249 ) ( not ( = ?auto_245 ?auto_248 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_243 ?auto_248 ?auto_245 ?auto_249 )
      ( DELIVER-1PKG ?auto_239 ?auto_240 )
      ( DELIVER-1PKG-VERIFY ?auto_239 ?auto_240 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_298 - OBJ
      ?auto_300 - OBJ
      ?auto_299 - LOCATION
    )
    :vars
    (
      ?auto_302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_300 ?auto_298 ) ( TRUCK-AT ?auto_302 ?auto_299 ) ( IN-TRUCK ?auto_300 ?auto_302 ) ( OBJ-AT ?auto_298 ?auto_299 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_300 ?auto_299 )
      ( DELIVER-2PKG-VERIFY ?auto_298 ?auto_300 ?auto_299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_307 - OBJ
      ?auto_309 - OBJ
      ?auto_308 - LOCATION
    )
    :vars
    (
      ?auto_311 - TRUCK
      ?auto_313 - LOCATION
      ?auto_310 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_309 ?auto_307 ) ( IN-TRUCK ?auto_309 ?auto_311 ) ( TRUCK-AT ?auto_311 ?auto_313 ) ( IN-CITY ?auto_313 ?auto_310 ) ( IN-CITY ?auto_308 ?auto_310 ) ( not ( = ?auto_308 ?auto_313 ) ) ( OBJ-AT ?auto_307 ?auto_308 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_309 ?auto_308 )
      ( DELIVER-2PKG-VERIFY ?auto_307 ?auto_309 ?auto_308 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_318 - OBJ
      ?auto_320 - OBJ
      ?auto_319 - LOCATION
    )
    :vars
    (
      ?auto_325 - TRUCK
      ?auto_326 - LOCATION
      ?auto_322 - CITY
      ?auto_324 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_320 ?auto_318 ) ( TRUCK-AT ?auto_325 ?auto_326 ) ( IN-CITY ?auto_326 ?auto_322 ) ( IN-CITY ?auto_319 ?auto_322 ) ( not ( = ?auto_319 ?auto_326 ) ) ( TRUCK-AT ?auto_325 ?auto_324 ) ( OBJ-AT ?auto_320 ?auto_324 ) ( OBJ-AT ?auto_318 ?auto_319 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_320 ?auto_319 )
      ( DELIVER-2PKG-VERIFY ?auto_318 ?auto_320 ?auto_319 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_330 - OBJ
      ?auto_332 - OBJ
      ?auto_331 - LOCATION
    )
    :vars
    (
      ?auto_333 - LOCATION
      ?auto_335 - CITY
      ?auto_338 - TRUCK
      ?auto_334 - LOCATION
      ?auto_336 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_332 ?auto_330 ) ( IN-CITY ?auto_333 ?auto_335 ) ( IN-CITY ?auto_331 ?auto_335 ) ( not ( = ?auto_331 ?auto_333 ) ) ( OBJ-AT ?auto_332 ?auto_333 ) ( TRUCK-AT ?auto_338 ?auto_334 ) ( IN-CITY ?auto_334 ?auto_336 ) ( IN-CITY ?auto_333 ?auto_336 ) ( not ( = ?auto_333 ?auto_334 ) ) ( OBJ-AT ?auto_330 ?auto_331 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_332 ?auto_331 )
      ( DELIVER-2PKG-VERIFY ?auto_330 ?auto_332 ?auto_331 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_351 - OBJ
      ?auto_345 - OBJ
      ?auto_344 - LOCATION
    )
    :vars
    (
      ?auto_352 - LOCATION
      ?auto_347 - CITY
      ?auto_346 - TRUCK
      ?auto_349 - LOCATION
      ?auto_353 - CITY
      ?auto_354 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_345 ?auto_351 ) ( IN-CITY ?auto_352 ?auto_347 ) ( IN-CITY ?auto_344 ?auto_347 ) ( not ( = ?auto_344 ?auto_352 ) ) ( OBJ-AT ?auto_345 ?auto_352 ) ( TRUCK-AT ?auto_346 ?auto_349 ) ( IN-CITY ?auto_349 ?auto_353 ) ( IN-CITY ?auto_352 ?auto_353 ) ( not ( = ?auto_352 ?auto_349 ) ) ( TRUCK-AT ?auto_354 ?auto_344 ) ( IN-TRUCK ?auto_351 ?auto_354 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_351 ?auto_344 )
      ( DELIVER-2PKG ?auto_351 ?auto_345 ?auto_344 )
      ( DELIVER-2PKG-VERIFY ?auto_351 ?auto_345 ?auto_344 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_360 - OBJ
      ?auto_362 - OBJ
      ?auto_361 - LOCATION
    )
    :vars
    (
      ?auto_369 - LOCATION
      ?auto_365 - CITY
      ?auto_363 - CITY
      ?auto_368 - TRUCK
      ?auto_373 - LOCATION
      ?auto_374 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_362 ?auto_360 ) ( IN-CITY ?auto_369 ?auto_365 ) ( IN-CITY ?auto_361 ?auto_365 ) ( not ( = ?auto_361 ?auto_369 ) ) ( OBJ-AT ?auto_362 ?auto_369 ) ( IN-CITY ?auto_361 ?auto_363 ) ( IN-CITY ?auto_369 ?auto_363 ) ( IN-TRUCK ?auto_360 ?auto_368 ) ( TRUCK-AT ?auto_368 ?auto_373 ) ( IN-CITY ?auto_373 ?auto_374 ) ( IN-CITY ?auto_361 ?auto_374 ) ( not ( = ?auto_361 ?auto_373 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_368 ?auto_373 ?auto_361 ?auto_374 )
      ( DELIVER-2PKG ?auto_360 ?auto_362 ?auto_361 )
      ( DELIVER-2PKG-VERIFY ?auto_360 ?auto_362 ?auto_361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_379 - OBJ
      ?auto_381 - OBJ
      ?auto_380 - LOCATION
    )
    :vars
    (
      ?auto_386 - LOCATION
      ?auto_385 - CITY
      ?auto_383 - CITY
      ?auto_387 - TRUCK
      ?auto_389 - LOCATION
      ?auto_388 - CITY
      ?auto_392 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_381 ?auto_379 ) ( IN-CITY ?auto_386 ?auto_385 ) ( IN-CITY ?auto_380 ?auto_385 ) ( not ( = ?auto_380 ?auto_386 ) ) ( OBJ-AT ?auto_381 ?auto_386 ) ( IN-CITY ?auto_380 ?auto_383 ) ( IN-CITY ?auto_386 ?auto_383 ) ( TRUCK-AT ?auto_387 ?auto_389 ) ( IN-CITY ?auto_389 ?auto_388 ) ( IN-CITY ?auto_380 ?auto_388 ) ( not ( = ?auto_380 ?auto_389 ) ) ( TRUCK-AT ?auto_387 ?auto_392 ) ( OBJ-AT ?auto_379 ?auto_392 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_379 ?auto_387 ?auto_392 )
      ( DELIVER-2PKG ?auto_379 ?auto_381 ?auto_380 )
      ( DELIVER-2PKG-VERIFY ?auto_379 ?auto_381 ?auto_380 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_397 - OBJ
      ?auto_399 - OBJ
      ?auto_398 - LOCATION
    )
    :vars
    (
      ?auto_401 - LOCATION
      ?auto_407 - CITY
      ?auto_400 - CITY
      ?auto_409 - LOCATION
      ?auto_406 - CITY
      ?auto_408 - TRUCK
      ?auto_411 - LOCATION
      ?auto_412 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_399 ?auto_397 ) ( IN-CITY ?auto_401 ?auto_407 ) ( IN-CITY ?auto_398 ?auto_407 ) ( not ( = ?auto_398 ?auto_401 ) ) ( OBJ-AT ?auto_399 ?auto_401 ) ( IN-CITY ?auto_398 ?auto_400 ) ( IN-CITY ?auto_401 ?auto_400 ) ( IN-CITY ?auto_409 ?auto_406 ) ( IN-CITY ?auto_398 ?auto_406 ) ( not ( = ?auto_398 ?auto_409 ) ) ( OBJ-AT ?auto_397 ?auto_409 ) ( TRUCK-AT ?auto_408 ?auto_411 ) ( IN-CITY ?auto_411 ?auto_412 ) ( IN-CITY ?auto_409 ?auto_412 ) ( not ( = ?auto_409 ?auto_411 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_408 ?auto_411 ?auto_409 ?auto_412 )
      ( DELIVER-2PKG ?auto_397 ?auto_399 ?auto_398 )
      ( DELIVER-2PKG-VERIFY ?auto_397 ?auto_399 ?auto_398 ) )
  )

)

