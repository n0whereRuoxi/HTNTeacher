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
      ?auto_246 - OBJ
      ?auto_247 - LOCATION
    )
    :vars
    (
      ?auto_248 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_248 ?auto_247 ) ( IN-TRUCK ?auto_246 ?auto_248 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_246 ?auto_248 ?auto_247 )
      ( DELIVER-1PKG-VERIFY ?auto_246 ?auto_247 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_251 - OBJ
      ?auto_252 - LOCATION
    )
    :vars
    (
      ?auto_253 - TRUCK
      ?auto_254 - LOCATION
      ?auto_255 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_251 ?auto_253 ) ( TRUCK-AT ?auto_253 ?auto_254 ) ( IN-CITY ?auto_254 ?auto_255 ) ( IN-CITY ?auto_252 ?auto_255 ) ( not ( = ?auto_252 ?auto_254 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_253 ?auto_254 ?auto_252 ?auto_255 )
      ( DELIVER-1PKG ?auto_251 ?auto_252 )
      ( DELIVER-1PKG-VERIFY ?auto_251 ?auto_252 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_258 - OBJ
      ?auto_259 - LOCATION
    )
    :vars
    (
      ?auto_260 - TRUCK
      ?auto_262 - LOCATION
      ?auto_261 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_260 ?auto_262 ) ( IN-CITY ?auto_262 ?auto_261 ) ( IN-CITY ?auto_259 ?auto_261 ) ( not ( = ?auto_259 ?auto_262 ) ) ( OBJ-AT ?auto_258 ?auto_262 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_258 ?auto_260 ?auto_262 )
      ( DELIVER-1PKG ?auto_258 ?auto_259 )
      ( DELIVER-1PKG-VERIFY ?auto_258 ?auto_259 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_265 - OBJ
      ?auto_266 - LOCATION
    )
    :vars
    (
      ?auto_267 - LOCATION
      ?auto_269 - CITY
      ?auto_268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_267 ?auto_269 ) ( IN-CITY ?auto_266 ?auto_269 ) ( not ( = ?auto_266 ?auto_267 ) ) ( OBJ-AT ?auto_265 ?auto_267 ) ( TRUCK-AT ?auto_268 ?auto_266 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_268 ?auto_266 ?auto_267 ?auto_269 )
      ( DELIVER-1PKG ?auto_265 ?auto_266 )
      ( DELIVER-1PKG-VERIFY ?auto_265 ?auto_266 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_272 - OBJ
      ?auto_273 - LOCATION
    )
    :vars
    (
      ?auto_274 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_274 ?auto_273 ) ( IN-TRUCK ?auto_272 ?auto_274 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_272 ?auto_274 ?auto_273 )
      ( DELIVER-1PKG-VERIFY ?auto_272 ?auto_273 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_277 - OBJ
      ?auto_278 - LOCATION
    )
    :vars
    (
      ?auto_279 - TRUCK
      ?auto_280 - LOCATION
      ?auto_281 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_277 ?auto_279 ) ( TRUCK-AT ?auto_279 ?auto_280 ) ( IN-CITY ?auto_280 ?auto_281 ) ( IN-CITY ?auto_278 ?auto_281 ) ( not ( = ?auto_278 ?auto_280 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_279 ?auto_280 ?auto_278 ?auto_281 )
      ( DELIVER-1PKG ?auto_277 ?auto_278 )
      ( DELIVER-1PKG-VERIFY ?auto_277 ?auto_278 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_284 - OBJ
      ?auto_285 - LOCATION
    )
    :vars
    (
      ?auto_287 - TRUCK
      ?auto_288 - LOCATION
      ?auto_286 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_287 ?auto_288 ) ( IN-CITY ?auto_288 ?auto_286 ) ( IN-CITY ?auto_285 ?auto_286 ) ( not ( = ?auto_285 ?auto_288 ) ) ( OBJ-AT ?auto_284 ?auto_288 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_284 ?auto_287 ?auto_288 )
      ( DELIVER-1PKG ?auto_284 ?auto_285 )
      ( DELIVER-1PKG-VERIFY ?auto_284 ?auto_285 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_291 - OBJ
      ?auto_292 - LOCATION
    )
    :vars
    (
      ?auto_294 - LOCATION
      ?auto_293 - CITY
      ?auto_295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_294 ?auto_293 ) ( IN-CITY ?auto_292 ?auto_293 ) ( not ( = ?auto_292 ?auto_294 ) ) ( OBJ-AT ?auto_291 ?auto_294 ) ( TRUCK-AT ?auto_295 ?auto_292 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_295 ?auto_292 ?auto_294 ?auto_293 )
      ( DELIVER-1PKG ?auto_291 ?auto_292 )
      ( DELIVER-1PKG-VERIFY ?auto_291 ?auto_292 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_299 - OBJ
      ?auto_301 - OBJ
      ?auto_300 - LOCATION
    )
    :vars
    (
      ?auto_302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_301 ?auto_299 ) ( TRUCK-AT ?auto_302 ?auto_300 ) ( IN-TRUCK ?auto_301 ?auto_302 ) ( OBJ-AT ?auto_299 ?auto_300 ) ( not ( = ?auto_299 ?auto_301 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_301 ?auto_300 )
      ( DELIVER-2PKG-VERIFY ?auto_299 ?auto_301 ?auto_300 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_306 - OBJ
      ?auto_308 - OBJ
      ?auto_307 - LOCATION
    )
    :vars
    (
      ?auto_310 - TRUCK
      ?auto_311 - LOCATION
      ?auto_309 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_308 ?auto_306 ) ( IN-TRUCK ?auto_308 ?auto_310 ) ( TRUCK-AT ?auto_310 ?auto_311 ) ( IN-CITY ?auto_311 ?auto_309 ) ( IN-CITY ?auto_307 ?auto_309 ) ( not ( = ?auto_307 ?auto_311 ) ) ( OBJ-AT ?auto_306 ?auto_307 ) ( not ( = ?auto_306 ?auto_308 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_308 ?auto_307 )
      ( DELIVER-2PKG-VERIFY ?auto_306 ?auto_308 ?auto_307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_315 - OBJ
      ?auto_317 - OBJ
      ?auto_316 - LOCATION
    )
    :vars
    (
      ?auto_320 - TRUCK
      ?auto_319 - LOCATION
      ?auto_318 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_317 ?auto_315 ) ( TRUCK-AT ?auto_320 ?auto_319 ) ( IN-CITY ?auto_319 ?auto_318 ) ( IN-CITY ?auto_316 ?auto_318 ) ( not ( = ?auto_316 ?auto_319 ) ) ( OBJ-AT ?auto_317 ?auto_319 ) ( OBJ-AT ?auto_315 ?auto_316 ) ( not ( = ?auto_315 ?auto_317 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_317 ?auto_316 )
      ( DELIVER-2PKG-VERIFY ?auto_315 ?auto_317 ?auto_316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_324 - OBJ
      ?auto_326 - OBJ
      ?auto_325 - LOCATION
    )
    :vars
    (
      ?auto_327 - LOCATION
      ?auto_328 - CITY
      ?auto_329 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_326 ?auto_324 ) ( IN-CITY ?auto_327 ?auto_328 ) ( IN-CITY ?auto_325 ?auto_328 ) ( not ( = ?auto_325 ?auto_327 ) ) ( OBJ-AT ?auto_326 ?auto_327 ) ( TRUCK-AT ?auto_329 ?auto_325 ) ( OBJ-AT ?auto_324 ?auto_325 ) ( not ( = ?auto_324 ?auto_326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_326 ?auto_325 )
      ( DELIVER-2PKG-VERIFY ?auto_324 ?auto_326 ?auto_325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_333 - OBJ
      ?auto_335 - OBJ
      ?auto_334 - LOCATION
    )
    :vars
    (
      ?auto_336 - LOCATION
      ?auto_337 - CITY
      ?auto_338 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_335 ?auto_333 ) ( IN-CITY ?auto_336 ?auto_337 ) ( IN-CITY ?auto_334 ?auto_337 ) ( not ( = ?auto_334 ?auto_336 ) ) ( OBJ-AT ?auto_335 ?auto_336 ) ( TRUCK-AT ?auto_338 ?auto_334 ) ( not ( = ?auto_333 ?auto_335 ) ) ( IN-TRUCK ?auto_333 ?auto_338 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_333 ?auto_334 )
      ( DELIVER-2PKG ?auto_333 ?auto_335 ?auto_334 )
      ( DELIVER-2PKG-VERIFY ?auto_333 ?auto_335 ?auto_334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_342 - OBJ
      ?auto_344 - OBJ
      ?auto_343 - LOCATION
    )
    :vars
    (
      ?auto_345 - LOCATION
      ?auto_347 - CITY
      ?auto_346 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_344 ?auto_342 ) ( IN-CITY ?auto_345 ?auto_347 ) ( IN-CITY ?auto_343 ?auto_347 ) ( not ( = ?auto_343 ?auto_345 ) ) ( OBJ-AT ?auto_344 ?auto_345 ) ( not ( = ?auto_342 ?auto_344 ) ) ( IN-TRUCK ?auto_342 ?auto_346 ) ( TRUCK-AT ?auto_346 ?auto_345 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_346 ?auto_345 ?auto_343 ?auto_347 )
      ( DELIVER-2PKG ?auto_342 ?auto_344 ?auto_343 )
      ( DELIVER-2PKG-VERIFY ?auto_342 ?auto_344 ?auto_343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_351 - OBJ
      ?auto_353 - OBJ
      ?auto_352 - LOCATION
    )
    :vars
    (
      ?auto_354 - LOCATION
      ?auto_356 - CITY
      ?auto_355 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_353 ?auto_351 ) ( IN-CITY ?auto_354 ?auto_356 ) ( IN-CITY ?auto_352 ?auto_356 ) ( not ( = ?auto_352 ?auto_354 ) ) ( OBJ-AT ?auto_353 ?auto_354 ) ( not ( = ?auto_351 ?auto_353 ) ) ( TRUCK-AT ?auto_355 ?auto_354 ) ( OBJ-AT ?auto_351 ?auto_354 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_351 ?auto_355 ?auto_354 )
      ( DELIVER-2PKG ?auto_351 ?auto_353 ?auto_352 )
      ( DELIVER-2PKG-VERIFY ?auto_351 ?auto_353 ?auto_352 ) )
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
      ?auto_363 - LOCATION
      ?auto_364 - CITY
      ?auto_365 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_362 ?auto_360 ) ( IN-CITY ?auto_363 ?auto_364 ) ( IN-CITY ?auto_361 ?auto_364 ) ( not ( = ?auto_361 ?auto_363 ) ) ( OBJ-AT ?auto_362 ?auto_363 ) ( not ( = ?auto_360 ?auto_362 ) ) ( OBJ-AT ?auto_360 ?auto_363 ) ( TRUCK-AT ?auto_365 ?auto_361 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_365 ?auto_361 ?auto_363 ?auto_364 )
      ( DELIVER-2PKG ?auto_360 ?auto_362 ?auto_361 )
      ( DELIVER-2PKG-VERIFY ?auto_360 ?auto_362 ?auto_361 ) )
  )

)

