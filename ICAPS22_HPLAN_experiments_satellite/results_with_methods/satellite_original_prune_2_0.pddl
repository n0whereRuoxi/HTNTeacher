( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_141 - DIRECTION
      ?auto_142 - MODE
    )
    :vars
    (
      ?auto_143 - INSTRUMENT
      ?auto_144 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_143 ) ( ON_BOARD ?auto_143 ?auto_144 ) ( SUPPORTS ?auto_143 ?auto_142 ) ( POWER_ON ?auto_143 ) ( POINTING ?auto_144 ?auto_141 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_144 ?auto_141 ?auto_143 ?auto_142 )
      ( GET-1IMAGE-VERIFY ?auto_141 ?auto_142 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_151 - DIRECTION
      ?auto_152 - MODE
    )
    :vars
    (
      ?auto_153 - INSTRUMENT
      ?auto_154 - SATELLITE
      ?auto_155 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_153 ) ( ON_BOARD ?auto_153 ?auto_154 ) ( SUPPORTS ?auto_153 ?auto_152 ) ( POWER_ON ?auto_153 ) ( POINTING ?auto_154 ?auto_155 ) ( not ( = ?auto_151 ?auto_155 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_154 ?auto_151 ?auto_155 )
      ( GET-1IMAGE ?auto_151 ?auto_152 )
      ( GET-1IMAGE-VERIFY ?auto_151 ?auto_152 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_163 - DIRECTION
      ?auto_164 - MODE
    )
    :vars
    (
      ?auto_166 - INSTRUMENT
      ?auto_165 - SATELLITE
      ?auto_167 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_166 ?auto_165 ) ( SUPPORTS ?auto_166 ?auto_164 ) ( POWER_ON ?auto_166 ) ( POINTING ?auto_165 ?auto_167 ) ( not ( = ?auto_163 ?auto_167 ) ) ( CALIBRATION_TARGET ?auto_166 ?auto_167 ) ( NOT_CALIBRATED ?auto_166 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_165 ?auto_166 ?auto_167 )
      ( GET-1IMAGE ?auto_163 ?auto_164 )
      ( GET-1IMAGE-VERIFY ?auto_163 ?auto_164 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_175 - DIRECTION
      ?auto_176 - MODE
    )
    :vars
    (
      ?auto_178 - INSTRUMENT
      ?auto_179 - SATELLITE
      ?auto_177 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_178 ?auto_179 ) ( SUPPORTS ?auto_178 ?auto_176 ) ( POINTING ?auto_179 ?auto_177 ) ( not ( = ?auto_175 ?auto_177 ) ) ( CALIBRATION_TARGET ?auto_178 ?auto_177 ) ( POWER_AVAIL ?auto_179 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_178 ?auto_179 )
      ( GET-1IMAGE ?auto_175 ?auto_176 )
      ( GET-1IMAGE-VERIFY ?auto_175 ?auto_176 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_187 - DIRECTION
      ?auto_188 - MODE
    )
    :vars
    (
      ?auto_191 - INSTRUMENT
      ?auto_189 - SATELLITE
      ?auto_190 - DIRECTION
      ?auto_192 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_191 ?auto_189 ) ( SUPPORTS ?auto_191 ?auto_188 ) ( not ( = ?auto_187 ?auto_190 ) ) ( CALIBRATION_TARGET ?auto_191 ?auto_190 ) ( POWER_AVAIL ?auto_189 ) ( POINTING ?auto_189 ?auto_192 ) ( not ( = ?auto_190 ?auto_192 ) ) ( not ( = ?auto_187 ?auto_192 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_189 ?auto_190 ?auto_192 )
      ( GET-1IMAGE ?auto_187 ?auto_188 )
      ( GET-1IMAGE-VERIFY ?auto_187 ?auto_188 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_220 - DIRECTION
      ?auto_221 - MODE
      ?auto_222 - DIRECTION
      ?auto_219 - MODE
    )
    :vars
    (
      ?auto_224 - INSTRUMENT
      ?auto_223 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_222 ?auto_220 ) ) ( CALIBRATED ?auto_224 ) ( ON_BOARD ?auto_224 ?auto_223 ) ( SUPPORTS ?auto_224 ?auto_219 ) ( POWER_ON ?auto_224 ) ( POINTING ?auto_223 ?auto_222 ) ( HAVE_IMAGE ?auto_220 ?auto_221 ) ( not ( = ?auto_221 ?auto_219 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_222 ?auto_219 )
      ( GET-2IMAGE-VERIFY ?auto_220 ?auto_221 ?auto_222 ?auto_219 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_226 - DIRECTION
      ?auto_227 - MODE
      ?auto_228 - DIRECTION
      ?auto_225 - MODE
    )
    :vars
    (
      ?auto_230 - INSTRUMENT
      ?auto_229 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_228 ?auto_226 ) ) ( CALIBRATED ?auto_230 ) ( ON_BOARD ?auto_230 ?auto_229 ) ( SUPPORTS ?auto_230 ?auto_227 ) ( POWER_ON ?auto_230 ) ( POINTING ?auto_229 ?auto_226 ) ( HAVE_IMAGE ?auto_228 ?auto_225 ) ( not ( = ?auto_227 ?auto_225 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_226 ?auto_227 )
      ( GET-2IMAGE-VERIFY ?auto_226 ?auto_227 ?auto_228 ?auto_225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_243 - DIRECTION
      ?auto_244 - MODE
      ?auto_245 - DIRECTION
      ?auto_242 - MODE
    )
    :vars
    (
      ?auto_247 - INSTRUMENT
      ?auto_246 - SATELLITE
      ?auto_248 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_245 ?auto_243 ) ) ( CALIBRATED ?auto_247 ) ( ON_BOARD ?auto_247 ?auto_246 ) ( SUPPORTS ?auto_247 ?auto_242 ) ( POWER_ON ?auto_247 ) ( POINTING ?auto_246 ?auto_248 ) ( not ( = ?auto_245 ?auto_248 ) ) ( HAVE_IMAGE ?auto_243 ?auto_244 ) ( not ( = ?auto_243 ?auto_248 ) ) ( not ( = ?auto_244 ?auto_242 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_245 ?auto_242 )
      ( GET-2IMAGE-VERIFY ?auto_243 ?auto_244 ?auto_245 ?auto_242 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_250 - DIRECTION
      ?auto_251 - MODE
      ?auto_252 - DIRECTION
      ?auto_249 - MODE
    )
    :vars
    (
      ?auto_254 - INSTRUMENT
      ?auto_253 - SATELLITE
      ?auto_255 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_252 ?auto_250 ) ) ( CALIBRATED ?auto_254 ) ( ON_BOARD ?auto_254 ?auto_253 ) ( SUPPORTS ?auto_254 ?auto_251 ) ( POWER_ON ?auto_254 ) ( POINTING ?auto_253 ?auto_255 ) ( not ( = ?auto_250 ?auto_255 ) ) ( HAVE_IMAGE ?auto_252 ?auto_249 ) ( not ( = ?auto_252 ?auto_255 ) ) ( not ( = ?auto_249 ?auto_251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_252 ?auto_249 ?auto_250 ?auto_251 )
      ( GET-2IMAGE-VERIFY ?auto_250 ?auto_251 ?auto_252 ?auto_249 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_265 - DIRECTION
      ?auto_266 - MODE
    )
    :vars
    (
      ?auto_269 - DIRECTION
      ?auto_268 - INSTRUMENT
      ?auto_267 - SATELLITE
      ?auto_271 - DIRECTION
      ?auto_270 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_265 ?auto_269 ) ) ( ON_BOARD ?auto_268 ?auto_267 ) ( SUPPORTS ?auto_268 ?auto_266 ) ( POWER_ON ?auto_268 ) ( POINTING ?auto_267 ?auto_271 ) ( not ( = ?auto_265 ?auto_271 ) ) ( HAVE_IMAGE ?auto_269 ?auto_270 ) ( not ( = ?auto_269 ?auto_271 ) ) ( not ( = ?auto_270 ?auto_266 ) ) ( CALIBRATION_TARGET ?auto_268 ?auto_271 ) ( NOT_CALIBRATED ?auto_268 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_267 ?auto_268 ?auto_271 )
      ( GET-2IMAGE ?auto_269 ?auto_270 ?auto_265 ?auto_266 )
      ( GET-1IMAGE-VERIFY ?auto_265 ?auto_266 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_273 - DIRECTION
      ?auto_274 - MODE
      ?auto_275 - DIRECTION
      ?auto_272 - MODE
    )
    :vars
    (
      ?auto_276 - INSTRUMENT
      ?auto_278 - SATELLITE
      ?auto_277 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_275 ?auto_273 ) ) ( ON_BOARD ?auto_276 ?auto_278 ) ( SUPPORTS ?auto_276 ?auto_272 ) ( POWER_ON ?auto_276 ) ( POINTING ?auto_278 ?auto_277 ) ( not ( = ?auto_275 ?auto_277 ) ) ( HAVE_IMAGE ?auto_273 ?auto_274 ) ( not ( = ?auto_273 ?auto_277 ) ) ( not ( = ?auto_274 ?auto_272 ) ) ( CALIBRATION_TARGET ?auto_276 ?auto_277 ) ( NOT_CALIBRATED ?auto_276 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275 ?auto_272 )
      ( GET-2IMAGE-VERIFY ?auto_273 ?auto_274 ?auto_275 ?auto_272 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_280 - DIRECTION
      ?auto_281 - MODE
      ?auto_282 - DIRECTION
      ?auto_279 - MODE
    )
    :vars
    (
      ?auto_284 - INSTRUMENT
      ?auto_285 - SATELLITE
      ?auto_283 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282 ?auto_280 ) ) ( ON_BOARD ?auto_284 ?auto_285 ) ( SUPPORTS ?auto_284 ?auto_281 ) ( POWER_ON ?auto_284 ) ( POINTING ?auto_285 ?auto_283 ) ( not ( = ?auto_280 ?auto_283 ) ) ( HAVE_IMAGE ?auto_282 ?auto_279 ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_279 ?auto_281 ) ) ( CALIBRATION_TARGET ?auto_284 ?auto_283 ) ( NOT_CALIBRATED ?auto_284 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282 ?auto_279 ?auto_280 ?auto_281 )
      ( GET-2IMAGE-VERIFY ?auto_280 ?auto_281 ?auto_282 ?auto_279 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_295 - DIRECTION
      ?auto_296 - MODE
    )
    :vars
    (
      ?auto_300 - DIRECTION
      ?auto_298 - INSTRUMENT
      ?auto_299 - SATELLITE
      ?auto_297 - DIRECTION
      ?auto_301 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_295 ?auto_300 ) ) ( ON_BOARD ?auto_298 ?auto_299 ) ( SUPPORTS ?auto_298 ?auto_296 ) ( POINTING ?auto_299 ?auto_297 ) ( not ( = ?auto_295 ?auto_297 ) ) ( HAVE_IMAGE ?auto_300 ?auto_301 ) ( not ( = ?auto_300 ?auto_297 ) ) ( not ( = ?auto_301 ?auto_296 ) ) ( CALIBRATION_TARGET ?auto_298 ?auto_297 ) ( POWER_AVAIL ?auto_299 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_298 ?auto_299 )
      ( GET-2IMAGE ?auto_300 ?auto_301 ?auto_295 ?auto_296 )
      ( GET-1IMAGE-VERIFY ?auto_295 ?auto_296 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_303 - DIRECTION
      ?auto_304 - MODE
      ?auto_305 - DIRECTION
      ?auto_302 - MODE
    )
    :vars
    (
      ?auto_306 - INSTRUMENT
      ?auto_307 - SATELLITE
      ?auto_308 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_305 ?auto_303 ) ) ( ON_BOARD ?auto_306 ?auto_307 ) ( SUPPORTS ?auto_306 ?auto_302 ) ( POINTING ?auto_307 ?auto_308 ) ( not ( = ?auto_305 ?auto_308 ) ) ( HAVE_IMAGE ?auto_303 ?auto_304 ) ( not ( = ?auto_303 ?auto_308 ) ) ( not ( = ?auto_304 ?auto_302 ) ) ( CALIBRATION_TARGET ?auto_306 ?auto_308 ) ( POWER_AVAIL ?auto_307 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_305 ?auto_302 )
      ( GET-2IMAGE-VERIFY ?auto_303 ?auto_304 ?auto_305 ?auto_302 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_310 - DIRECTION
      ?auto_311 - MODE
      ?auto_312 - DIRECTION
      ?auto_309 - MODE
    )
    :vars
    (
      ?auto_315 - INSTRUMENT
      ?auto_313 - SATELLITE
      ?auto_314 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_312 ?auto_310 ) ) ( ON_BOARD ?auto_315 ?auto_313 ) ( SUPPORTS ?auto_315 ?auto_311 ) ( POINTING ?auto_313 ?auto_314 ) ( not ( = ?auto_310 ?auto_314 ) ) ( HAVE_IMAGE ?auto_312 ?auto_309 ) ( not ( = ?auto_312 ?auto_314 ) ) ( not ( = ?auto_309 ?auto_311 ) ) ( CALIBRATION_TARGET ?auto_315 ?auto_314 ) ( POWER_AVAIL ?auto_313 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_312 ?auto_309 ?auto_310 ?auto_311 )
      ( GET-2IMAGE-VERIFY ?auto_310 ?auto_311 ?auto_312 ?auto_309 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_325 - DIRECTION
      ?auto_326 - MODE
    )
    :vars
    (
      ?auto_330 - DIRECTION
      ?auto_329 - INSTRUMENT
      ?auto_327 - SATELLITE
      ?auto_328 - DIRECTION
      ?auto_331 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_325 ?auto_330 ) ) ( ON_BOARD ?auto_329 ?auto_327 ) ( SUPPORTS ?auto_329 ?auto_326 ) ( not ( = ?auto_325 ?auto_328 ) ) ( HAVE_IMAGE ?auto_330 ?auto_331 ) ( not ( = ?auto_330 ?auto_328 ) ) ( not ( = ?auto_331 ?auto_326 ) ) ( CALIBRATION_TARGET ?auto_329 ?auto_328 ) ( POWER_AVAIL ?auto_327 ) ( POINTING ?auto_327 ?auto_330 ) )
    :subtasks
    ( ( !TURN_TO ?auto_327 ?auto_328 ?auto_330 )
      ( GET-2IMAGE ?auto_330 ?auto_331 ?auto_325 ?auto_326 )
      ( GET-1IMAGE-VERIFY ?auto_325 ?auto_326 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_333 - DIRECTION
      ?auto_334 - MODE
      ?auto_335 - DIRECTION
      ?auto_332 - MODE
    )
    :vars
    (
      ?auto_338 - INSTRUMENT
      ?auto_336 - SATELLITE
      ?auto_337 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335 ?auto_333 ) ) ( ON_BOARD ?auto_338 ?auto_336 ) ( SUPPORTS ?auto_338 ?auto_332 ) ( not ( = ?auto_335 ?auto_337 ) ) ( HAVE_IMAGE ?auto_333 ?auto_334 ) ( not ( = ?auto_333 ?auto_337 ) ) ( not ( = ?auto_334 ?auto_332 ) ) ( CALIBRATION_TARGET ?auto_338 ?auto_337 ) ( POWER_AVAIL ?auto_336 ) ( POINTING ?auto_336 ?auto_333 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_335 ?auto_332 )
      ( GET-2IMAGE-VERIFY ?auto_333 ?auto_334 ?auto_335 ?auto_332 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_340 - DIRECTION
      ?auto_341 - MODE
      ?auto_342 - DIRECTION
      ?auto_339 - MODE
    )
    :vars
    (
      ?auto_345 - INSTRUMENT
      ?auto_343 - SATELLITE
      ?auto_344 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_342 ?auto_340 ) ) ( ON_BOARD ?auto_345 ?auto_343 ) ( SUPPORTS ?auto_345 ?auto_341 ) ( not ( = ?auto_340 ?auto_344 ) ) ( HAVE_IMAGE ?auto_342 ?auto_339 ) ( not ( = ?auto_342 ?auto_344 ) ) ( not ( = ?auto_339 ?auto_341 ) ) ( CALIBRATION_TARGET ?auto_345 ?auto_344 ) ( POWER_AVAIL ?auto_343 ) ( POINTING ?auto_343 ?auto_342 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_342 ?auto_339 ?auto_340 ?auto_341 )
      ( GET-2IMAGE-VERIFY ?auto_340 ?auto_341 ?auto_342 ?auto_339 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_355 - DIRECTION
      ?auto_356 - MODE
    )
    :vars
    (
      ?auto_358 - DIRECTION
      ?auto_361 - INSTRUMENT
      ?auto_357 - SATELLITE
      ?auto_360 - DIRECTION
      ?auto_359 - MODE
      ?auto_362 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_355 ?auto_358 ) ) ( ON_BOARD ?auto_361 ?auto_357 ) ( SUPPORTS ?auto_361 ?auto_356 ) ( not ( = ?auto_355 ?auto_360 ) ) ( HAVE_IMAGE ?auto_358 ?auto_359 ) ( not ( = ?auto_358 ?auto_360 ) ) ( not ( = ?auto_359 ?auto_356 ) ) ( CALIBRATION_TARGET ?auto_361 ?auto_360 ) ( POINTING ?auto_357 ?auto_358 ) ( ON_BOARD ?auto_362 ?auto_357 ) ( POWER_ON ?auto_362 ) ( not ( = ?auto_361 ?auto_362 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_362 ?auto_357 )
      ( GET-2IMAGE ?auto_358 ?auto_359 ?auto_355 ?auto_356 )
      ( GET-1IMAGE-VERIFY ?auto_355 ?auto_356 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364 - DIRECTION
      ?auto_365 - MODE
      ?auto_366 - DIRECTION
      ?auto_363 - MODE
    )
    :vars
    (
      ?auto_367 - INSTRUMENT
      ?auto_369 - SATELLITE
      ?auto_370 - DIRECTION
      ?auto_368 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_366 ?auto_364 ) ) ( ON_BOARD ?auto_367 ?auto_369 ) ( SUPPORTS ?auto_367 ?auto_363 ) ( not ( = ?auto_366 ?auto_370 ) ) ( HAVE_IMAGE ?auto_364 ?auto_365 ) ( not ( = ?auto_364 ?auto_370 ) ) ( not ( = ?auto_365 ?auto_363 ) ) ( CALIBRATION_TARGET ?auto_367 ?auto_370 ) ( POINTING ?auto_369 ?auto_364 ) ( ON_BOARD ?auto_368 ?auto_369 ) ( POWER_ON ?auto_368 ) ( not ( = ?auto_367 ?auto_368 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_366 ?auto_363 )
      ( GET-2IMAGE-VERIFY ?auto_364 ?auto_365 ?auto_366 ?auto_363 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_372 - DIRECTION
      ?auto_373 - MODE
      ?auto_374 - DIRECTION
      ?auto_371 - MODE
    )
    :vars
    (
      ?auto_375 - INSTRUMENT
      ?auto_376 - SATELLITE
      ?auto_377 - DIRECTION
      ?auto_378 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_374 ?auto_372 ) ) ( ON_BOARD ?auto_375 ?auto_376 ) ( SUPPORTS ?auto_375 ?auto_373 ) ( not ( = ?auto_372 ?auto_377 ) ) ( HAVE_IMAGE ?auto_374 ?auto_371 ) ( not ( = ?auto_374 ?auto_377 ) ) ( not ( = ?auto_371 ?auto_373 ) ) ( CALIBRATION_TARGET ?auto_375 ?auto_377 ) ( POINTING ?auto_376 ?auto_374 ) ( ON_BOARD ?auto_378 ?auto_376 ) ( POWER_ON ?auto_378 ) ( not ( = ?auto_375 ?auto_378 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_374 ?auto_371 ?auto_372 ?auto_373 )
      ( GET-2IMAGE-VERIFY ?auto_372 ?auto_373 ?auto_374 ?auto_371 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_389 - DIRECTION
      ?auto_390 - MODE
    )
    :vars
    (
      ?auto_395 - DIRECTION
      ?auto_391 - INSTRUMENT
      ?auto_392 - SATELLITE
      ?auto_393 - DIRECTION
      ?auto_394 - MODE
      ?auto_396 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_389 ?auto_395 ) ) ( ON_BOARD ?auto_391 ?auto_392 ) ( SUPPORTS ?auto_391 ?auto_390 ) ( not ( = ?auto_389 ?auto_393 ) ) ( not ( = ?auto_395 ?auto_393 ) ) ( not ( = ?auto_394 ?auto_390 ) ) ( CALIBRATION_TARGET ?auto_391 ?auto_393 ) ( POINTING ?auto_392 ?auto_395 ) ( ON_BOARD ?auto_396 ?auto_392 ) ( POWER_ON ?auto_396 ) ( not ( = ?auto_391 ?auto_396 ) ) ( CALIBRATED ?auto_396 ) ( SUPPORTS ?auto_396 ?auto_394 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_395 ?auto_394 )
      ( GET-2IMAGE ?auto_395 ?auto_394 ?auto_389 ?auto_390 )
      ( GET-1IMAGE-VERIFY ?auto_389 ?auto_390 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_398 - DIRECTION
      ?auto_399 - MODE
      ?auto_400 - DIRECTION
      ?auto_397 - MODE
    )
    :vars
    (
      ?auto_403 - INSTRUMENT
      ?auto_402 - SATELLITE
      ?auto_404 - DIRECTION
      ?auto_401 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_400 ?auto_398 ) ) ( ON_BOARD ?auto_403 ?auto_402 ) ( SUPPORTS ?auto_403 ?auto_397 ) ( not ( = ?auto_400 ?auto_404 ) ) ( not ( = ?auto_398 ?auto_404 ) ) ( not ( = ?auto_399 ?auto_397 ) ) ( CALIBRATION_TARGET ?auto_403 ?auto_404 ) ( POINTING ?auto_402 ?auto_398 ) ( ON_BOARD ?auto_401 ?auto_402 ) ( POWER_ON ?auto_401 ) ( not ( = ?auto_403 ?auto_401 ) ) ( CALIBRATED ?auto_401 ) ( SUPPORTS ?auto_401 ?auto_399 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_400 ?auto_397 )
      ( GET-2IMAGE-VERIFY ?auto_398 ?auto_399 ?auto_400 ?auto_397 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_406 - DIRECTION
      ?auto_407 - MODE
      ?auto_408 - DIRECTION
      ?auto_405 - MODE
    )
    :vars
    (
      ?auto_411 - INSTRUMENT
      ?auto_409 - SATELLITE
      ?auto_412 - DIRECTION
      ?auto_410 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_408 ?auto_406 ) ) ( ON_BOARD ?auto_411 ?auto_409 ) ( SUPPORTS ?auto_411 ?auto_407 ) ( not ( = ?auto_406 ?auto_412 ) ) ( not ( = ?auto_408 ?auto_412 ) ) ( not ( = ?auto_405 ?auto_407 ) ) ( CALIBRATION_TARGET ?auto_411 ?auto_412 ) ( POINTING ?auto_409 ?auto_408 ) ( ON_BOARD ?auto_410 ?auto_409 ) ( POWER_ON ?auto_410 ) ( not ( = ?auto_411 ?auto_410 ) ) ( CALIBRATED ?auto_410 ) ( SUPPORTS ?auto_410 ?auto_405 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_408 ?auto_405 ?auto_406 ?auto_407 )
      ( GET-2IMAGE-VERIFY ?auto_406 ?auto_407 ?auto_408 ?auto_405 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_423 - DIRECTION
      ?auto_424 - MODE
    )
    :vars
    (
      ?auto_430 - DIRECTION
      ?auto_427 - INSTRUMENT
      ?auto_425 - SATELLITE
      ?auto_428 - DIRECTION
      ?auto_429 - MODE
      ?auto_426 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_423 ?auto_430 ) ) ( ON_BOARD ?auto_427 ?auto_425 ) ( SUPPORTS ?auto_427 ?auto_424 ) ( not ( = ?auto_423 ?auto_428 ) ) ( not ( = ?auto_430 ?auto_428 ) ) ( not ( = ?auto_429 ?auto_424 ) ) ( CALIBRATION_TARGET ?auto_427 ?auto_428 ) ( ON_BOARD ?auto_426 ?auto_425 ) ( POWER_ON ?auto_426 ) ( not ( = ?auto_427 ?auto_426 ) ) ( CALIBRATED ?auto_426 ) ( SUPPORTS ?auto_426 ?auto_429 ) ( POINTING ?auto_425 ?auto_428 ) )
    :subtasks
    ( ( !TURN_TO ?auto_425 ?auto_430 ?auto_428 )
      ( GET-2IMAGE ?auto_430 ?auto_429 ?auto_423 ?auto_424 )
      ( GET-1IMAGE-VERIFY ?auto_423 ?auto_424 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_432 - DIRECTION
      ?auto_433 - MODE
      ?auto_434 - DIRECTION
      ?auto_431 - MODE
    )
    :vars
    (
      ?auto_437 - INSTRUMENT
      ?auto_436 - SATELLITE
      ?auto_435 - DIRECTION
      ?auto_438 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_434 ?auto_432 ) ) ( ON_BOARD ?auto_437 ?auto_436 ) ( SUPPORTS ?auto_437 ?auto_431 ) ( not ( = ?auto_434 ?auto_435 ) ) ( not ( = ?auto_432 ?auto_435 ) ) ( not ( = ?auto_433 ?auto_431 ) ) ( CALIBRATION_TARGET ?auto_437 ?auto_435 ) ( ON_BOARD ?auto_438 ?auto_436 ) ( POWER_ON ?auto_438 ) ( not ( = ?auto_437 ?auto_438 ) ) ( CALIBRATED ?auto_438 ) ( SUPPORTS ?auto_438 ?auto_433 ) ( POINTING ?auto_436 ?auto_435 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_434 ?auto_431 )
      ( GET-2IMAGE-VERIFY ?auto_432 ?auto_433 ?auto_434 ?auto_431 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_440 - DIRECTION
      ?auto_441 - MODE
      ?auto_442 - DIRECTION
      ?auto_439 - MODE
    )
    :vars
    (
      ?auto_446 - INSTRUMENT
      ?auto_445 - SATELLITE
      ?auto_444 - DIRECTION
      ?auto_443 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_442 ?auto_440 ) ) ( ON_BOARD ?auto_446 ?auto_445 ) ( SUPPORTS ?auto_446 ?auto_441 ) ( not ( = ?auto_440 ?auto_444 ) ) ( not ( = ?auto_442 ?auto_444 ) ) ( not ( = ?auto_439 ?auto_441 ) ) ( CALIBRATION_TARGET ?auto_446 ?auto_444 ) ( ON_BOARD ?auto_443 ?auto_445 ) ( POWER_ON ?auto_443 ) ( not ( = ?auto_446 ?auto_443 ) ) ( CALIBRATED ?auto_443 ) ( SUPPORTS ?auto_443 ?auto_439 ) ( POINTING ?auto_445 ?auto_444 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_442 ?auto_439 ?auto_440 ?auto_441 )
      ( GET-2IMAGE-VERIFY ?auto_440 ?auto_441 ?auto_442 ?auto_439 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_457 - DIRECTION
      ?auto_458 - MODE
    )
    :vars
    (
      ?auto_463 - DIRECTION
      ?auto_464 - INSTRUMENT
      ?auto_461 - SATELLITE
      ?auto_460 - DIRECTION
      ?auto_462 - MODE
      ?auto_459 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_457 ?auto_463 ) ) ( ON_BOARD ?auto_464 ?auto_461 ) ( SUPPORTS ?auto_464 ?auto_458 ) ( not ( = ?auto_457 ?auto_460 ) ) ( not ( = ?auto_463 ?auto_460 ) ) ( not ( = ?auto_462 ?auto_458 ) ) ( CALIBRATION_TARGET ?auto_464 ?auto_460 ) ( ON_BOARD ?auto_459 ?auto_461 ) ( POWER_ON ?auto_459 ) ( not ( = ?auto_464 ?auto_459 ) ) ( SUPPORTS ?auto_459 ?auto_462 ) ( POINTING ?auto_461 ?auto_460 ) ( CALIBRATION_TARGET ?auto_459 ?auto_460 ) ( NOT_CALIBRATED ?auto_459 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_461 ?auto_459 ?auto_460 )
      ( GET-2IMAGE ?auto_463 ?auto_462 ?auto_457 ?auto_458 )
      ( GET-1IMAGE-VERIFY ?auto_457 ?auto_458 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_466 - DIRECTION
      ?auto_467 - MODE
      ?auto_468 - DIRECTION
      ?auto_465 - MODE
    )
    :vars
    (
      ?auto_472 - INSTRUMENT
      ?auto_471 - SATELLITE
      ?auto_469 - DIRECTION
      ?auto_470 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468 ?auto_466 ) ) ( ON_BOARD ?auto_472 ?auto_471 ) ( SUPPORTS ?auto_472 ?auto_465 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_467 ?auto_465 ) ) ( CALIBRATION_TARGET ?auto_472 ?auto_469 ) ( ON_BOARD ?auto_470 ?auto_471 ) ( POWER_ON ?auto_470 ) ( not ( = ?auto_472 ?auto_470 ) ) ( SUPPORTS ?auto_470 ?auto_467 ) ( POINTING ?auto_471 ?auto_469 ) ( CALIBRATION_TARGET ?auto_470 ?auto_469 ) ( NOT_CALIBRATED ?auto_470 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_468 ?auto_465 )
      ( GET-2IMAGE-VERIFY ?auto_466 ?auto_467 ?auto_468 ?auto_465 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_474 - DIRECTION
      ?auto_475 - MODE
      ?auto_476 - DIRECTION
      ?auto_473 - MODE
    )
    :vars
    (
      ?auto_477 - INSTRUMENT
      ?auto_480 - SATELLITE
      ?auto_478 - DIRECTION
      ?auto_479 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_476 ?auto_474 ) ) ( ON_BOARD ?auto_477 ?auto_480 ) ( SUPPORTS ?auto_477 ?auto_475 ) ( not ( = ?auto_474 ?auto_478 ) ) ( not ( = ?auto_476 ?auto_478 ) ) ( not ( = ?auto_473 ?auto_475 ) ) ( CALIBRATION_TARGET ?auto_477 ?auto_478 ) ( ON_BOARD ?auto_479 ?auto_480 ) ( POWER_ON ?auto_479 ) ( not ( = ?auto_477 ?auto_479 ) ) ( SUPPORTS ?auto_479 ?auto_473 ) ( POINTING ?auto_480 ?auto_478 ) ( CALIBRATION_TARGET ?auto_479 ?auto_478 ) ( NOT_CALIBRATED ?auto_479 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_476 ?auto_473 ?auto_474 ?auto_475 )
      ( GET-2IMAGE-VERIFY ?auto_474 ?auto_475 ?auto_476 ?auto_473 ) )
  )

)

