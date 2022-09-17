( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226 - SURFACE
      ?auto_227 - SURFACE
    )
    :vars
    (
      ?auto_228 - HOIST
      ?auto_229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228 ?auto_229 ) ( SURFACE-AT ?auto_226 ?auto_229 ) ( CLEAR ?auto_226 ) ( LIFTING ?auto_228 ?auto_227 ) ( IS-CRATE ?auto_227 ) ( not ( = ?auto_226 ?auto_227 ) ) )
    :subtasks
    ( ( !DROP ?auto_228 ?auto_227 ?auto_226 ?auto_229 )
      ( MAKE-1CRATE-VERIFY ?auto_226 ?auto_227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_230 - SURFACE
      ?auto_231 - SURFACE
    )
    :vars
    (
      ?auto_233 - HOIST
      ?auto_232 - PLACE
      ?auto_234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_233 ?auto_232 ) ( SURFACE-AT ?auto_230 ?auto_232 ) ( CLEAR ?auto_230 ) ( IS-CRATE ?auto_231 ) ( not ( = ?auto_230 ?auto_231 ) ) ( TRUCK-AT ?auto_234 ?auto_232 ) ( AVAILABLE ?auto_233 ) ( IN ?auto_231 ?auto_234 ) )
    :subtasks
    ( ( !UNLOAD ?auto_233 ?auto_231 ?auto_234 ?auto_232 )
      ( MAKE-1CRATE ?auto_230 ?auto_231 )
      ( MAKE-1CRATE-VERIFY ?auto_230 ?auto_231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_235 - SURFACE
      ?auto_236 - SURFACE
    )
    :vars
    (
      ?auto_238 - HOIST
      ?auto_239 - PLACE
      ?auto_237 - TRUCK
      ?auto_240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238 ?auto_239 ) ( SURFACE-AT ?auto_235 ?auto_239 ) ( CLEAR ?auto_235 ) ( IS-CRATE ?auto_236 ) ( not ( = ?auto_235 ?auto_236 ) ) ( AVAILABLE ?auto_238 ) ( IN ?auto_236 ?auto_237 ) ( TRUCK-AT ?auto_237 ?auto_240 ) ( not ( = ?auto_240 ?auto_239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_237 ?auto_240 ?auto_239 )
      ( MAKE-1CRATE ?auto_235 ?auto_236 )
      ( MAKE-1CRATE-VERIFY ?auto_235 ?auto_236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_241 - SURFACE
      ?auto_242 - SURFACE
    )
    :vars
    (
      ?auto_246 - HOIST
      ?auto_243 - PLACE
      ?auto_245 - TRUCK
      ?auto_244 - PLACE
      ?auto_247 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_246 ?auto_243 ) ( SURFACE-AT ?auto_241 ?auto_243 ) ( CLEAR ?auto_241 ) ( IS-CRATE ?auto_242 ) ( not ( = ?auto_241 ?auto_242 ) ) ( AVAILABLE ?auto_246 ) ( TRUCK-AT ?auto_245 ?auto_244 ) ( not ( = ?auto_244 ?auto_243 ) ) ( HOIST-AT ?auto_247 ?auto_244 ) ( LIFTING ?auto_247 ?auto_242 ) ( not ( = ?auto_246 ?auto_247 ) ) )
    :subtasks
    ( ( !LOAD ?auto_247 ?auto_242 ?auto_245 ?auto_244 )
      ( MAKE-1CRATE ?auto_241 ?auto_242 )
      ( MAKE-1CRATE-VERIFY ?auto_241 ?auto_242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_248 - SURFACE
      ?auto_249 - SURFACE
    )
    :vars
    (
      ?auto_253 - HOIST
      ?auto_254 - PLACE
      ?auto_252 - TRUCK
      ?auto_250 - PLACE
      ?auto_251 - HOIST
      ?auto_255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253 ?auto_254 ) ( SURFACE-AT ?auto_248 ?auto_254 ) ( CLEAR ?auto_248 ) ( IS-CRATE ?auto_249 ) ( not ( = ?auto_248 ?auto_249 ) ) ( AVAILABLE ?auto_253 ) ( TRUCK-AT ?auto_252 ?auto_250 ) ( not ( = ?auto_250 ?auto_254 ) ) ( HOIST-AT ?auto_251 ?auto_250 ) ( not ( = ?auto_253 ?auto_251 ) ) ( AVAILABLE ?auto_251 ) ( SURFACE-AT ?auto_249 ?auto_250 ) ( ON ?auto_249 ?auto_255 ) ( CLEAR ?auto_249 ) ( not ( = ?auto_248 ?auto_255 ) ) ( not ( = ?auto_249 ?auto_255 ) ) )
    :subtasks
    ( ( !LIFT ?auto_251 ?auto_249 ?auto_255 ?auto_250 )
      ( MAKE-1CRATE ?auto_248 ?auto_249 )
      ( MAKE-1CRATE-VERIFY ?auto_248 ?auto_249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_256 - SURFACE
      ?auto_257 - SURFACE
    )
    :vars
    (
      ?auto_263 - HOIST
      ?auto_262 - PLACE
      ?auto_260 - PLACE
      ?auto_259 - HOIST
      ?auto_261 - SURFACE
      ?auto_258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_263 ?auto_262 ) ( SURFACE-AT ?auto_256 ?auto_262 ) ( CLEAR ?auto_256 ) ( IS-CRATE ?auto_257 ) ( not ( = ?auto_256 ?auto_257 ) ) ( AVAILABLE ?auto_263 ) ( not ( = ?auto_260 ?auto_262 ) ) ( HOIST-AT ?auto_259 ?auto_260 ) ( not ( = ?auto_263 ?auto_259 ) ) ( AVAILABLE ?auto_259 ) ( SURFACE-AT ?auto_257 ?auto_260 ) ( ON ?auto_257 ?auto_261 ) ( CLEAR ?auto_257 ) ( not ( = ?auto_256 ?auto_261 ) ) ( not ( = ?auto_257 ?auto_261 ) ) ( TRUCK-AT ?auto_258 ?auto_262 ) )
    :subtasks
    ( ( !DRIVE ?auto_258 ?auto_262 ?auto_260 )
      ( MAKE-1CRATE ?auto_256 ?auto_257 )
      ( MAKE-1CRATE-VERIFY ?auto_256 ?auto_257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_273 - SURFACE
      ?auto_274 - SURFACE
      ?auto_275 - SURFACE
    )
    :vars
    (
      ?auto_276 - HOIST
      ?auto_277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_276 ?auto_277 ) ( SURFACE-AT ?auto_274 ?auto_277 ) ( CLEAR ?auto_274 ) ( LIFTING ?auto_276 ?auto_275 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( ON ?auto_274 ?auto_273 ) ( not ( = ?auto_273 ?auto_274 ) ) ( not ( = ?auto_273 ?auto_275 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_274 ?auto_275 )
      ( MAKE-2CRATE-VERIFY ?auto_273 ?auto_274 ?auto_275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_283 - SURFACE
      ?auto_284 - SURFACE
      ?auto_285 - SURFACE
    )
    :vars
    (
      ?auto_286 - HOIST
      ?auto_287 - PLACE
      ?auto_288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_286 ?auto_287 ) ( SURFACE-AT ?auto_284 ?auto_287 ) ( CLEAR ?auto_284 ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_284 ?auto_285 ) ) ( TRUCK-AT ?auto_288 ?auto_287 ) ( AVAILABLE ?auto_286 ) ( IN ?auto_285 ?auto_288 ) ( ON ?auto_284 ?auto_283 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_284 ?auto_285 )
      ( MAKE-2CRATE-VERIFY ?auto_283 ?auto_284 ?auto_285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_289 - SURFACE
      ?auto_290 - SURFACE
    )
    :vars
    (
      ?auto_292 - HOIST
      ?auto_293 - PLACE
      ?auto_291 - TRUCK
      ?auto_294 - SURFACE
      ?auto_295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292 ?auto_293 ) ( SURFACE-AT ?auto_289 ?auto_293 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_292 ) ( IN ?auto_290 ?auto_291 ) ( ON ?auto_289 ?auto_294 ) ( not ( = ?auto_294 ?auto_289 ) ) ( not ( = ?auto_294 ?auto_290 ) ) ( TRUCK-AT ?auto_291 ?auto_295 ) ( not ( = ?auto_295 ?auto_293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_291 ?auto_295 ?auto_293 )
      ( MAKE-2CRATE ?auto_294 ?auto_289 ?auto_290 )
      ( MAKE-1CRATE-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_296 - SURFACE
      ?auto_297 - SURFACE
      ?auto_298 - SURFACE
    )
    :vars
    (
      ?auto_302 - HOIST
      ?auto_299 - PLACE
      ?auto_301 - TRUCK
      ?auto_300 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302 ?auto_299 ) ( SURFACE-AT ?auto_297 ?auto_299 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( not ( = ?auto_297 ?auto_298 ) ) ( AVAILABLE ?auto_302 ) ( IN ?auto_298 ?auto_301 ) ( ON ?auto_297 ?auto_296 ) ( not ( = ?auto_296 ?auto_297 ) ) ( not ( = ?auto_296 ?auto_298 ) ) ( TRUCK-AT ?auto_301 ?auto_300 ) ( not ( = ?auto_300 ?auto_299 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_297 ?auto_298 )
      ( MAKE-2CRATE-VERIFY ?auto_296 ?auto_297 ?auto_298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_303 - SURFACE
      ?auto_304 - SURFACE
    )
    :vars
    (
      ?auto_307 - HOIST
      ?auto_306 - PLACE
      ?auto_305 - SURFACE
      ?auto_309 - TRUCK
      ?auto_308 - PLACE
      ?auto_310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_307 ?auto_306 ) ( SURFACE-AT ?auto_303 ?auto_306 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_303 ?auto_304 ) ) ( AVAILABLE ?auto_307 ) ( ON ?auto_303 ?auto_305 ) ( not ( = ?auto_305 ?auto_303 ) ) ( not ( = ?auto_305 ?auto_304 ) ) ( TRUCK-AT ?auto_309 ?auto_308 ) ( not ( = ?auto_308 ?auto_306 ) ) ( HOIST-AT ?auto_310 ?auto_308 ) ( LIFTING ?auto_310 ?auto_304 ) ( not ( = ?auto_307 ?auto_310 ) ) )
    :subtasks
    ( ( !LOAD ?auto_310 ?auto_304 ?auto_309 ?auto_308 )
      ( MAKE-2CRATE ?auto_305 ?auto_303 ?auto_304 )
      ( MAKE-1CRATE-VERIFY ?auto_303 ?auto_304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
      ?auto_313 - SURFACE
    )
    :vars
    (
      ?auto_317 - HOIST
      ?auto_318 - PLACE
      ?auto_316 - TRUCK
      ?auto_315 - PLACE
      ?auto_314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_317 ?auto_318 ) ( SURFACE-AT ?auto_312 ?auto_318 ) ( CLEAR ?auto_312 ) ( IS-CRATE ?auto_313 ) ( not ( = ?auto_312 ?auto_313 ) ) ( AVAILABLE ?auto_317 ) ( ON ?auto_312 ?auto_311 ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_311 ?auto_313 ) ) ( TRUCK-AT ?auto_316 ?auto_315 ) ( not ( = ?auto_315 ?auto_318 ) ) ( HOIST-AT ?auto_314 ?auto_315 ) ( LIFTING ?auto_314 ?auto_313 ) ( not ( = ?auto_317 ?auto_314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312 ?auto_313 )
      ( MAKE-2CRATE-VERIFY ?auto_311 ?auto_312 ?auto_313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319 - SURFACE
      ?auto_320 - SURFACE
    )
    :vars
    (
      ?auto_325 - HOIST
      ?auto_323 - PLACE
      ?auto_326 - SURFACE
      ?auto_324 - TRUCK
      ?auto_322 - PLACE
      ?auto_321 - HOIST
      ?auto_327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325 ?auto_323 ) ( SURFACE-AT ?auto_319 ?auto_323 ) ( CLEAR ?auto_319 ) ( IS-CRATE ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( AVAILABLE ?auto_325 ) ( ON ?auto_319 ?auto_326 ) ( not ( = ?auto_326 ?auto_319 ) ) ( not ( = ?auto_326 ?auto_320 ) ) ( TRUCK-AT ?auto_324 ?auto_322 ) ( not ( = ?auto_322 ?auto_323 ) ) ( HOIST-AT ?auto_321 ?auto_322 ) ( not ( = ?auto_325 ?auto_321 ) ) ( AVAILABLE ?auto_321 ) ( SURFACE-AT ?auto_320 ?auto_322 ) ( ON ?auto_320 ?auto_327 ) ( CLEAR ?auto_320 ) ( not ( = ?auto_319 ?auto_327 ) ) ( not ( = ?auto_320 ?auto_327 ) ) ( not ( = ?auto_326 ?auto_327 ) ) )
    :subtasks
    ( ( !LIFT ?auto_321 ?auto_320 ?auto_327 ?auto_322 )
      ( MAKE-2CRATE ?auto_326 ?auto_319 ?auto_320 )
      ( MAKE-1CRATE-VERIFY ?auto_319 ?auto_320 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_328 - SURFACE
      ?auto_329 - SURFACE
      ?auto_330 - SURFACE
    )
    :vars
    (
      ?auto_331 - HOIST
      ?auto_333 - PLACE
      ?auto_334 - TRUCK
      ?auto_335 - PLACE
      ?auto_336 - HOIST
      ?auto_332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_331 ?auto_333 ) ( SURFACE-AT ?auto_329 ?auto_333 ) ( CLEAR ?auto_329 ) ( IS-CRATE ?auto_330 ) ( not ( = ?auto_329 ?auto_330 ) ) ( AVAILABLE ?auto_331 ) ( ON ?auto_329 ?auto_328 ) ( not ( = ?auto_328 ?auto_329 ) ) ( not ( = ?auto_328 ?auto_330 ) ) ( TRUCK-AT ?auto_334 ?auto_335 ) ( not ( = ?auto_335 ?auto_333 ) ) ( HOIST-AT ?auto_336 ?auto_335 ) ( not ( = ?auto_331 ?auto_336 ) ) ( AVAILABLE ?auto_336 ) ( SURFACE-AT ?auto_330 ?auto_335 ) ( ON ?auto_330 ?auto_332 ) ( CLEAR ?auto_330 ) ( not ( = ?auto_329 ?auto_332 ) ) ( not ( = ?auto_330 ?auto_332 ) ) ( not ( = ?auto_328 ?auto_332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_329 ?auto_330 )
      ( MAKE-2CRATE-VERIFY ?auto_328 ?auto_329 ?auto_330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_337 - SURFACE
      ?auto_338 - SURFACE
    )
    :vars
    (
      ?auto_340 - HOIST
      ?auto_343 - PLACE
      ?auto_345 - SURFACE
      ?auto_344 - PLACE
      ?auto_341 - HOIST
      ?auto_339 - SURFACE
      ?auto_342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340 ?auto_343 ) ( SURFACE-AT ?auto_337 ?auto_343 ) ( CLEAR ?auto_337 ) ( IS-CRATE ?auto_338 ) ( not ( = ?auto_337 ?auto_338 ) ) ( AVAILABLE ?auto_340 ) ( ON ?auto_337 ?auto_345 ) ( not ( = ?auto_345 ?auto_337 ) ) ( not ( = ?auto_345 ?auto_338 ) ) ( not ( = ?auto_344 ?auto_343 ) ) ( HOIST-AT ?auto_341 ?auto_344 ) ( not ( = ?auto_340 ?auto_341 ) ) ( AVAILABLE ?auto_341 ) ( SURFACE-AT ?auto_338 ?auto_344 ) ( ON ?auto_338 ?auto_339 ) ( CLEAR ?auto_338 ) ( not ( = ?auto_337 ?auto_339 ) ) ( not ( = ?auto_338 ?auto_339 ) ) ( not ( = ?auto_345 ?auto_339 ) ) ( TRUCK-AT ?auto_342 ?auto_343 ) )
    :subtasks
    ( ( !DRIVE ?auto_342 ?auto_343 ?auto_344 )
      ( MAKE-2CRATE ?auto_345 ?auto_337 ?auto_338 )
      ( MAKE-1CRATE-VERIFY ?auto_337 ?auto_338 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_346 - SURFACE
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
    )
    :vars
    (
      ?auto_351 - HOIST
      ?auto_350 - PLACE
      ?auto_349 - PLACE
      ?auto_352 - HOIST
      ?auto_354 - SURFACE
      ?auto_353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351 ?auto_350 ) ( SURFACE-AT ?auto_347 ?auto_350 ) ( CLEAR ?auto_347 ) ( IS-CRATE ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( AVAILABLE ?auto_351 ) ( ON ?auto_347 ?auto_346 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_349 ?auto_350 ) ) ( HOIST-AT ?auto_352 ?auto_349 ) ( not ( = ?auto_351 ?auto_352 ) ) ( AVAILABLE ?auto_352 ) ( SURFACE-AT ?auto_348 ?auto_349 ) ( ON ?auto_348 ?auto_354 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_354 ) ) ( not ( = ?auto_348 ?auto_354 ) ) ( not ( = ?auto_346 ?auto_354 ) ) ( TRUCK-AT ?auto_353 ?auto_350 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347 ?auto_348 )
      ( MAKE-2CRATE-VERIFY ?auto_346 ?auto_347 ?auto_348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_355 - SURFACE
      ?auto_356 - SURFACE
    )
    :vars
    (
      ?auto_361 - HOIST
      ?auto_358 - PLACE
      ?auto_362 - SURFACE
      ?auto_359 - PLACE
      ?auto_360 - HOIST
      ?auto_363 - SURFACE
      ?auto_357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361 ?auto_358 ) ( IS-CRATE ?auto_356 ) ( not ( = ?auto_355 ?auto_356 ) ) ( not ( = ?auto_362 ?auto_355 ) ) ( not ( = ?auto_362 ?auto_356 ) ) ( not ( = ?auto_359 ?auto_358 ) ) ( HOIST-AT ?auto_360 ?auto_359 ) ( not ( = ?auto_361 ?auto_360 ) ) ( AVAILABLE ?auto_360 ) ( SURFACE-AT ?auto_356 ?auto_359 ) ( ON ?auto_356 ?auto_363 ) ( CLEAR ?auto_356 ) ( not ( = ?auto_355 ?auto_363 ) ) ( not ( = ?auto_356 ?auto_363 ) ) ( not ( = ?auto_362 ?auto_363 ) ) ( TRUCK-AT ?auto_357 ?auto_358 ) ( SURFACE-AT ?auto_362 ?auto_358 ) ( CLEAR ?auto_362 ) ( LIFTING ?auto_361 ?auto_355 ) ( IS-CRATE ?auto_355 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_362 ?auto_355 )
      ( MAKE-2CRATE ?auto_362 ?auto_355 ?auto_356 )
      ( MAKE-1CRATE-VERIFY ?auto_355 ?auto_356 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_364 - SURFACE
      ?auto_365 - SURFACE
      ?auto_366 - SURFACE
    )
    :vars
    (
      ?auto_367 - HOIST
      ?auto_368 - PLACE
      ?auto_372 - PLACE
      ?auto_369 - HOIST
      ?auto_370 - SURFACE
      ?auto_371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367 ?auto_368 ) ( IS-CRATE ?auto_366 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( not ( = ?auto_364 ?auto_366 ) ) ( not ( = ?auto_372 ?auto_368 ) ) ( HOIST-AT ?auto_369 ?auto_372 ) ( not ( = ?auto_367 ?auto_369 ) ) ( AVAILABLE ?auto_369 ) ( SURFACE-AT ?auto_366 ?auto_372 ) ( ON ?auto_366 ?auto_370 ) ( CLEAR ?auto_366 ) ( not ( = ?auto_365 ?auto_370 ) ) ( not ( = ?auto_366 ?auto_370 ) ) ( not ( = ?auto_364 ?auto_370 ) ) ( TRUCK-AT ?auto_371 ?auto_368 ) ( SURFACE-AT ?auto_364 ?auto_368 ) ( CLEAR ?auto_364 ) ( LIFTING ?auto_367 ?auto_365 ) ( IS-CRATE ?auto_365 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_365 ?auto_366 )
      ( MAKE-2CRATE-VERIFY ?auto_364 ?auto_365 ?auto_366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_373 - SURFACE
      ?auto_374 - SURFACE
    )
    :vars
    (
      ?auto_379 - HOIST
      ?auto_377 - PLACE
      ?auto_381 - SURFACE
      ?auto_375 - PLACE
      ?auto_378 - HOIST
      ?auto_380 - SURFACE
      ?auto_376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379 ?auto_377 ) ( IS-CRATE ?auto_374 ) ( not ( = ?auto_373 ?auto_374 ) ) ( not ( = ?auto_381 ?auto_373 ) ) ( not ( = ?auto_381 ?auto_374 ) ) ( not ( = ?auto_375 ?auto_377 ) ) ( HOIST-AT ?auto_378 ?auto_375 ) ( not ( = ?auto_379 ?auto_378 ) ) ( AVAILABLE ?auto_378 ) ( SURFACE-AT ?auto_374 ?auto_375 ) ( ON ?auto_374 ?auto_380 ) ( CLEAR ?auto_374 ) ( not ( = ?auto_373 ?auto_380 ) ) ( not ( = ?auto_374 ?auto_380 ) ) ( not ( = ?auto_381 ?auto_380 ) ) ( TRUCK-AT ?auto_376 ?auto_377 ) ( SURFACE-AT ?auto_381 ?auto_377 ) ( CLEAR ?auto_381 ) ( IS-CRATE ?auto_373 ) ( AVAILABLE ?auto_379 ) ( IN ?auto_373 ?auto_376 ) )
    :subtasks
    ( ( !UNLOAD ?auto_379 ?auto_373 ?auto_376 ?auto_377 )
      ( MAKE-2CRATE ?auto_381 ?auto_373 ?auto_374 )
      ( MAKE-1CRATE-VERIFY ?auto_373 ?auto_374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_382 - SURFACE
      ?auto_383 - SURFACE
      ?auto_384 - SURFACE
    )
    :vars
    (
      ?auto_386 - HOIST
      ?auto_390 - PLACE
      ?auto_385 - PLACE
      ?auto_389 - HOIST
      ?auto_387 - SURFACE
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_386 ?auto_390 ) ( IS-CRATE ?auto_384 ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( not ( = ?auto_385 ?auto_390 ) ) ( HOIST-AT ?auto_389 ?auto_385 ) ( not ( = ?auto_386 ?auto_389 ) ) ( AVAILABLE ?auto_389 ) ( SURFACE-AT ?auto_384 ?auto_385 ) ( ON ?auto_384 ?auto_387 ) ( CLEAR ?auto_384 ) ( not ( = ?auto_383 ?auto_387 ) ) ( not ( = ?auto_384 ?auto_387 ) ) ( not ( = ?auto_382 ?auto_387 ) ) ( TRUCK-AT ?auto_388 ?auto_390 ) ( SURFACE-AT ?auto_382 ?auto_390 ) ( CLEAR ?auto_382 ) ( IS-CRATE ?auto_383 ) ( AVAILABLE ?auto_386 ) ( IN ?auto_383 ?auto_388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_383 ?auto_384 )
      ( MAKE-2CRATE-VERIFY ?auto_382 ?auto_383 ?auto_384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_427 - SURFACE
      ?auto_428 - SURFACE
    )
    :vars
    (
      ?auto_431 - HOIST
      ?auto_433 - PLACE
      ?auto_429 - SURFACE
      ?auto_432 - PLACE
      ?auto_435 - HOIST
      ?auto_430 - SURFACE
      ?auto_434 - TRUCK
      ?auto_436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431 ?auto_433 ) ( SURFACE-AT ?auto_427 ?auto_433 ) ( CLEAR ?auto_427 ) ( IS-CRATE ?auto_428 ) ( not ( = ?auto_427 ?auto_428 ) ) ( AVAILABLE ?auto_431 ) ( ON ?auto_427 ?auto_429 ) ( not ( = ?auto_429 ?auto_427 ) ) ( not ( = ?auto_429 ?auto_428 ) ) ( not ( = ?auto_432 ?auto_433 ) ) ( HOIST-AT ?auto_435 ?auto_432 ) ( not ( = ?auto_431 ?auto_435 ) ) ( AVAILABLE ?auto_435 ) ( SURFACE-AT ?auto_428 ?auto_432 ) ( ON ?auto_428 ?auto_430 ) ( CLEAR ?auto_428 ) ( not ( = ?auto_427 ?auto_430 ) ) ( not ( = ?auto_428 ?auto_430 ) ) ( not ( = ?auto_429 ?auto_430 ) ) ( TRUCK-AT ?auto_434 ?auto_436 ) ( not ( = ?auto_436 ?auto_433 ) ) ( not ( = ?auto_432 ?auto_436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_434 ?auto_436 ?auto_433 )
      ( MAKE-1CRATE ?auto_427 ?auto_428 )
      ( MAKE-1CRATE-VERIFY ?auto_427 ?auto_428 ) )
  )

)

