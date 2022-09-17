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
      ?auto_154 - INSTRUMENT
      ?auto_153 - SATELLITE
      ?auto_155 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_154 ) ( ON_BOARD ?auto_154 ?auto_153 ) ( SUPPORTS ?auto_154 ?auto_152 ) ( POWER_ON ?auto_154 ) ( POINTING ?auto_153 ?auto_155 ) ( not ( = ?auto_151 ?auto_155 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_153 ?auto_151 ?auto_155 )
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
    ( and ( CALIBRATED ?auto_224 ) ( ON_BOARD ?auto_224 ?auto_223 ) ( SUPPORTS ?auto_224 ?auto_219 ) ( POWER_ON ?auto_224 ) ( POINTING ?auto_223 ?auto_222 ) ( HAVE_IMAGE ?auto_220 ?auto_221 ) ( not ( = ?auto_220 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_219 ) ) )
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
    ( and ( CALIBRATED ?auto_230 ) ( ON_BOARD ?auto_230 ?auto_229 ) ( SUPPORTS ?auto_230 ?auto_227 ) ( POWER_ON ?auto_230 ) ( POINTING ?auto_229 ?auto_226 ) ( HAVE_IMAGE ?auto_228 ?auto_225 ) ( not ( = ?auto_226 ?auto_228 ) ) ( not ( = ?auto_227 ?auto_225 ) ) )
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
    ( and ( CALIBRATED ?auto_247 ) ( ON_BOARD ?auto_247 ?auto_246 ) ( SUPPORTS ?auto_247 ?auto_242 ) ( POWER_ON ?auto_247 ) ( POINTING ?auto_246 ?auto_248 ) ( not ( = ?auto_245 ?auto_248 ) ) ( HAVE_IMAGE ?auto_243 ?auto_244 ) ( not ( = ?auto_243 ?auto_245 ) ) ( not ( = ?auto_243 ?auto_248 ) ) ( not ( = ?auto_244 ?auto_242 ) ) )
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
      ?auto_255 - INSTRUMENT
      ?auto_254 - SATELLITE
      ?auto_253 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_255 ) ( ON_BOARD ?auto_255 ?auto_254 ) ( SUPPORTS ?auto_255 ?auto_251 ) ( POWER_ON ?auto_255 ) ( POINTING ?auto_254 ?auto_253 ) ( not ( = ?auto_250 ?auto_253 ) ) ( HAVE_IMAGE ?auto_252 ?auto_249 ) ( not ( = ?auto_252 ?auto_250 ) ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_249 ?auto_251 ) ) )
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
      ?auto_269 - INSTRUMENT
      ?auto_268 - SATELLITE
      ?auto_267 - DIRECTION
      ?auto_270 - DIRECTION
      ?auto_271 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_269 ?auto_268 ) ( SUPPORTS ?auto_269 ?auto_266 ) ( POWER_ON ?auto_269 ) ( POINTING ?auto_268 ?auto_267 ) ( not ( = ?auto_265 ?auto_267 ) ) ( HAVE_IMAGE ?auto_270 ?auto_271 ) ( not ( = ?auto_270 ?auto_265 ) ) ( not ( = ?auto_270 ?auto_267 ) ) ( not ( = ?auto_271 ?auto_266 ) ) ( CALIBRATION_TARGET ?auto_269 ?auto_267 ) ( NOT_CALIBRATED ?auto_269 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_268 ?auto_269 ?auto_267 )
      ( GET-2IMAGE ?auto_270 ?auto_271 ?auto_265 ?auto_266 )
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
      ?auto_277 - SATELLITE
      ?auto_278 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276 ?auto_277 ) ( SUPPORTS ?auto_276 ?auto_272 ) ( POWER_ON ?auto_276 ) ( POINTING ?auto_277 ?auto_278 ) ( not ( = ?auto_275 ?auto_278 ) ) ( HAVE_IMAGE ?auto_273 ?auto_274 ) ( not ( = ?auto_273 ?auto_275 ) ) ( not ( = ?auto_273 ?auto_278 ) ) ( not ( = ?auto_274 ?auto_272 ) ) ( CALIBRATION_TARGET ?auto_276 ?auto_278 ) ( NOT_CALIBRATED ?auto_276 ) )
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
      ?auto_283 - SATELLITE
      ?auto_285 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_284 ?auto_283 ) ( SUPPORTS ?auto_284 ?auto_281 ) ( POWER_ON ?auto_284 ) ( POINTING ?auto_283 ?auto_285 ) ( not ( = ?auto_280 ?auto_285 ) ) ( HAVE_IMAGE ?auto_282 ?auto_279 ) ( not ( = ?auto_282 ?auto_280 ) ) ( not ( = ?auto_282 ?auto_285 ) ) ( not ( = ?auto_279 ?auto_281 ) ) ( CALIBRATION_TARGET ?auto_284 ?auto_285 ) ( NOT_CALIBRATED ?auto_284 ) )
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
      ?auto_298 - INSTRUMENT
      ?auto_297 - SATELLITE
      ?auto_299 - DIRECTION
      ?auto_300 - DIRECTION
      ?auto_301 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_298 ?auto_297 ) ( SUPPORTS ?auto_298 ?auto_296 ) ( POINTING ?auto_297 ?auto_299 ) ( not ( = ?auto_295 ?auto_299 ) ) ( HAVE_IMAGE ?auto_300 ?auto_301 ) ( not ( = ?auto_300 ?auto_295 ) ) ( not ( = ?auto_300 ?auto_299 ) ) ( not ( = ?auto_301 ?auto_296 ) ) ( CALIBRATION_TARGET ?auto_298 ?auto_299 ) ( POWER_AVAIL ?auto_297 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_298 ?auto_297 )
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
      ?auto_308 - INSTRUMENT
      ?auto_306 - SATELLITE
      ?auto_307 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308 ?auto_306 ) ( SUPPORTS ?auto_308 ?auto_302 ) ( POINTING ?auto_306 ?auto_307 ) ( not ( = ?auto_305 ?auto_307 ) ) ( HAVE_IMAGE ?auto_303 ?auto_304 ) ( not ( = ?auto_303 ?auto_305 ) ) ( not ( = ?auto_303 ?auto_307 ) ) ( not ( = ?auto_304 ?auto_302 ) ) ( CALIBRATION_TARGET ?auto_308 ?auto_307 ) ( POWER_AVAIL ?auto_306 ) )
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
      ?auto_313 - INSTRUMENT
      ?auto_315 - SATELLITE
      ?auto_314 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_313 ?auto_315 ) ( SUPPORTS ?auto_313 ?auto_311 ) ( POINTING ?auto_315 ?auto_314 ) ( not ( = ?auto_310 ?auto_314 ) ) ( HAVE_IMAGE ?auto_312 ?auto_309 ) ( not ( = ?auto_312 ?auto_310 ) ) ( not ( = ?auto_312 ?auto_314 ) ) ( not ( = ?auto_309 ?auto_311 ) ) ( CALIBRATION_TARGET ?auto_313 ?auto_314 ) ( POWER_AVAIL ?auto_315 ) )
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
      ?auto_327 - INSTRUMENT
      ?auto_329 - SATELLITE
      ?auto_328 - DIRECTION
      ?auto_331 - DIRECTION
      ?auto_330 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_327 ?auto_329 ) ( SUPPORTS ?auto_327 ?auto_326 ) ( not ( = ?auto_325 ?auto_328 ) ) ( HAVE_IMAGE ?auto_331 ?auto_330 ) ( not ( = ?auto_331 ?auto_325 ) ) ( not ( = ?auto_331 ?auto_328 ) ) ( not ( = ?auto_330 ?auto_326 ) ) ( CALIBRATION_TARGET ?auto_327 ?auto_328 ) ( POWER_AVAIL ?auto_329 ) ( POINTING ?auto_329 ?auto_331 ) )
    :subtasks
    ( ( !TURN_TO ?auto_329 ?auto_328 ?auto_331 )
      ( GET-2IMAGE ?auto_331 ?auto_330 ?auto_325 ?auto_326 )
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
      ?auto_337 - SATELLITE
      ?auto_336 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_338 ?auto_337 ) ( SUPPORTS ?auto_338 ?auto_332 ) ( not ( = ?auto_335 ?auto_336 ) ) ( HAVE_IMAGE ?auto_333 ?auto_334 ) ( not ( = ?auto_333 ?auto_335 ) ) ( not ( = ?auto_333 ?auto_336 ) ) ( not ( = ?auto_334 ?auto_332 ) ) ( CALIBRATION_TARGET ?auto_338 ?auto_336 ) ( POWER_AVAIL ?auto_337 ) ( POINTING ?auto_337 ?auto_333 ) )
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
      ?auto_343 - INSTRUMENT
      ?auto_344 - SATELLITE
      ?auto_345 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_343 ?auto_344 ) ( SUPPORTS ?auto_343 ?auto_341 ) ( not ( = ?auto_340 ?auto_345 ) ) ( HAVE_IMAGE ?auto_342 ?auto_339 ) ( not ( = ?auto_342 ?auto_340 ) ) ( not ( = ?auto_342 ?auto_345 ) ) ( not ( = ?auto_339 ?auto_341 ) ) ( CALIBRATION_TARGET ?auto_343 ?auto_345 ) ( POWER_AVAIL ?auto_344 ) ( POINTING ?auto_344 ?auto_342 ) )
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
      ?auto_357 - INSTRUMENT
      ?auto_358 - SATELLITE
      ?auto_359 - DIRECTION
      ?auto_361 - DIRECTION
      ?auto_360 - MODE
      ?auto_362 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_357 ?auto_358 ) ( SUPPORTS ?auto_357 ?auto_356 ) ( not ( = ?auto_355 ?auto_359 ) ) ( HAVE_IMAGE ?auto_361 ?auto_360 ) ( not ( = ?auto_361 ?auto_355 ) ) ( not ( = ?auto_361 ?auto_359 ) ) ( not ( = ?auto_360 ?auto_356 ) ) ( CALIBRATION_TARGET ?auto_357 ?auto_359 ) ( POINTING ?auto_358 ?auto_361 ) ( ON_BOARD ?auto_362 ?auto_358 ) ( POWER_ON ?auto_362 ) ( not ( = ?auto_357 ?auto_362 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_362 ?auto_358 )
      ( GET-2IMAGE ?auto_361 ?auto_360 ?auto_355 ?auto_356 )
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
      ?auto_368 - SATELLITE
      ?auto_369 - DIRECTION
      ?auto_370 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367 ?auto_368 ) ( SUPPORTS ?auto_367 ?auto_363 ) ( not ( = ?auto_366 ?auto_369 ) ) ( HAVE_IMAGE ?auto_364 ?auto_365 ) ( not ( = ?auto_364 ?auto_366 ) ) ( not ( = ?auto_364 ?auto_369 ) ) ( not ( = ?auto_365 ?auto_363 ) ) ( CALIBRATION_TARGET ?auto_367 ?auto_369 ) ( POINTING ?auto_368 ?auto_364 ) ( ON_BOARD ?auto_370 ?auto_368 ) ( POWER_ON ?auto_370 ) ( not ( = ?auto_367 ?auto_370 ) ) )
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
      ?auto_377 - INSTRUMENT
      ?auto_375 - SATELLITE
      ?auto_376 - DIRECTION
      ?auto_378 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_377 ?auto_375 ) ( SUPPORTS ?auto_377 ?auto_373 ) ( not ( = ?auto_372 ?auto_376 ) ) ( HAVE_IMAGE ?auto_374 ?auto_371 ) ( not ( = ?auto_374 ?auto_372 ) ) ( not ( = ?auto_374 ?auto_376 ) ) ( not ( = ?auto_371 ?auto_373 ) ) ( CALIBRATION_TARGET ?auto_377 ?auto_376 ) ( POINTING ?auto_375 ?auto_374 ) ( ON_BOARD ?auto_378 ?auto_375 ) ( POWER_ON ?auto_378 ) ( not ( = ?auto_377 ?auto_378 ) ) )
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
      ?auto_393 - INSTRUMENT
      ?auto_391 - SATELLITE
      ?auto_392 - DIRECTION
      ?auto_395 - DIRECTION
      ?auto_396 - MODE
      ?auto_394 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_393 ?auto_391 ) ( SUPPORTS ?auto_393 ?auto_390 ) ( not ( = ?auto_389 ?auto_392 ) ) ( not ( = ?auto_395 ?auto_389 ) ) ( not ( = ?auto_395 ?auto_392 ) ) ( not ( = ?auto_396 ?auto_390 ) ) ( CALIBRATION_TARGET ?auto_393 ?auto_392 ) ( POINTING ?auto_391 ?auto_395 ) ( ON_BOARD ?auto_394 ?auto_391 ) ( POWER_ON ?auto_394 ) ( not ( = ?auto_393 ?auto_394 ) ) ( CALIBRATED ?auto_394 ) ( SUPPORTS ?auto_394 ?auto_396 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_395 ?auto_396 )
      ( GET-2IMAGE ?auto_395 ?auto_396 ?auto_389 ?auto_390 )
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
      ?auto_401 - SATELLITE
      ?auto_402 - DIRECTION
      ?auto_404 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_403 ?auto_401 ) ( SUPPORTS ?auto_403 ?auto_397 ) ( not ( = ?auto_400 ?auto_402 ) ) ( not ( = ?auto_398 ?auto_400 ) ) ( not ( = ?auto_398 ?auto_402 ) ) ( not ( = ?auto_399 ?auto_397 ) ) ( CALIBRATION_TARGET ?auto_403 ?auto_402 ) ( POINTING ?auto_401 ?auto_398 ) ( ON_BOARD ?auto_404 ?auto_401 ) ( POWER_ON ?auto_404 ) ( not ( = ?auto_403 ?auto_404 ) ) ( CALIBRATED ?auto_404 ) ( SUPPORTS ?auto_404 ?auto_399 ) )
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
      ?auto_409 - INSTRUMENT
      ?auto_412 - SATELLITE
      ?auto_410 - DIRECTION
      ?auto_411 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_409 ?auto_412 ) ( SUPPORTS ?auto_409 ?auto_407 ) ( not ( = ?auto_406 ?auto_410 ) ) ( not ( = ?auto_408 ?auto_406 ) ) ( not ( = ?auto_408 ?auto_410 ) ) ( not ( = ?auto_405 ?auto_407 ) ) ( CALIBRATION_TARGET ?auto_409 ?auto_410 ) ( POINTING ?auto_412 ?auto_408 ) ( ON_BOARD ?auto_411 ?auto_412 ) ( POWER_ON ?auto_411 ) ( not ( = ?auto_409 ?auto_411 ) ) ( CALIBRATED ?auto_411 ) ( SUPPORTS ?auto_411 ?auto_405 ) )
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
      ?auto_425 - INSTRUMENT
      ?auto_428 - SATELLITE
      ?auto_426 - DIRECTION
      ?auto_429 - DIRECTION
      ?auto_430 - MODE
      ?auto_427 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_425 ?auto_428 ) ( SUPPORTS ?auto_425 ?auto_424 ) ( not ( = ?auto_423 ?auto_426 ) ) ( not ( = ?auto_429 ?auto_423 ) ) ( not ( = ?auto_429 ?auto_426 ) ) ( not ( = ?auto_430 ?auto_424 ) ) ( CALIBRATION_TARGET ?auto_425 ?auto_426 ) ( ON_BOARD ?auto_427 ?auto_428 ) ( POWER_ON ?auto_427 ) ( not ( = ?auto_425 ?auto_427 ) ) ( CALIBRATED ?auto_427 ) ( SUPPORTS ?auto_427 ?auto_430 ) ( POINTING ?auto_428 ?auto_426 ) )
    :subtasks
    ( ( !TURN_TO ?auto_428 ?auto_429 ?auto_426 )
      ( GET-2IMAGE ?auto_429 ?auto_430 ?auto_423 ?auto_424 )
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
      ?auto_438 - INSTRUMENT
      ?auto_435 - SATELLITE
      ?auto_437 - DIRECTION
      ?auto_436 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_438 ?auto_435 ) ( SUPPORTS ?auto_438 ?auto_431 ) ( not ( = ?auto_434 ?auto_437 ) ) ( not ( = ?auto_432 ?auto_434 ) ) ( not ( = ?auto_432 ?auto_437 ) ) ( not ( = ?auto_433 ?auto_431 ) ) ( CALIBRATION_TARGET ?auto_438 ?auto_437 ) ( ON_BOARD ?auto_436 ?auto_435 ) ( POWER_ON ?auto_436 ) ( not ( = ?auto_438 ?auto_436 ) ) ( CALIBRATED ?auto_436 ) ( SUPPORTS ?auto_436 ?auto_433 ) ( POINTING ?auto_435 ?auto_437 ) )
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
      ?auto_443 - INSTRUMENT
      ?auto_445 - SATELLITE
      ?auto_446 - DIRECTION
      ?auto_444 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_443 ?auto_445 ) ( SUPPORTS ?auto_443 ?auto_441 ) ( not ( = ?auto_440 ?auto_446 ) ) ( not ( = ?auto_442 ?auto_440 ) ) ( not ( = ?auto_442 ?auto_446 ) ) ( not ( = ?auto_439 ?auto_441 ) ) ( CALIBRATION_TARGET ?auto_443 ?auto_446 ) ( ON_BOARD ?auto_444 ?auto_445 ) ( POWER_ON ?auto_444 ) ( not ( = ?auto_443 ?auto_444 ) ) ( CALIBRATED ?auto_444 ) ( SUPPORTS ?auto_444 ?auto_439 ) ( POINTING ?auto_445 ?auto_446 ) )
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
      ?auto_459 - INSTRUMENT
      ?auto_461 - SATELLITE
      ?auto_464 - DIRECTION
      ?auto_463 - DIRECTION
      ?auto_462 - MODE
      ?auto_460 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_459 ?auto_461 ) ( SUPPORTS ?auto_459 ?auto_458 ) ( not ( = ?auto_457 ?auto_464 ) ) ( not ( = ?auto_463 ?auto_457 ) ) ( not ( = ?auto_463 ?auto_464 ) ) ( not ( = ?auto_462 ?auto_458 ) ) ( CALIBRATION_TARGET ?auto_459 ?auto_464 ) ( ON_BOARD ?auto_460 ?auto_461 ) ( POWER_ON ?auto_460 ) ( not ( = ?auto_459 ?auto_460 ) ) ( SUPPORTS ?auto_460 ?auto_462 ) ( POINTING ?auto_461 ?auto_464 ) ( CALIBRATION_TARGET ?auto_460 ?auto_464 ) ( NOT_CALIBRATED ?auto_460 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_461 ?auto_460 ?auto_464 )
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
      ?auto_470 - INSTRUMENT
      ?auto_471 - SATELLITE
      ?auto_469 - DIRECTION
      ?auto_472 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_470 ?auto_471 ) ( SUPPORTS ?auto_470 ?auto_465 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_467 ?auto_465 ) ) ( CALIBRATION_TARGET ?auto_470 ?auto_469 ) ( ON_BOARD ?auto_472 ?auto_471 ) ( POWER_ON ?auto_472 ) ( not ( = ?auto_470 ?auto_472 ) ) ( SUPPORTS ?auto_472 ?auto_467 ) ( POINTING ?auto_471 ?auto_469 ) ( CALIBRATION_TARGET ?auto_472 ?auto_469 ) ( NOT_CALIBRATED ?auto_472 ) )
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
    ( and ( ON_BOARD ?auto_477 ?auto_480 ) ( SUPPORTS ?auto_477 ?auto_475 ) ( not ( = ?auto_474 ?auto_478 ) ) ( not ( = ?auto_476 ?auto_474 ) ) ( not ( = ?auto_476 ?auto_478 ) ) ( not ( = ?auto_473 ?auto_475 ) ) ( CALIBRATION_TARGET ?auto_477 ?auto_478 ) ( ON_BOARD ?auto_479 ?auto_480 ) ( POWER_ON ?auto_479 ) ( not ( = ?auto_477 ?auto_479 ) ) ( SUPPORTS ?auto_479 ?auto_473 ) ( POINTING ?auto_480 ?auto_478 ) ( CALIBRATION_TARGET ?auto_479 ?auto_478 ) ( NOT_CALIBRATED ?auto_479 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_476 ?auto_473 ?auto_474 ?auto_475 )
      ( GET-2IMAGE-VERIFY ?auto_474 ?auto_475 ?auto_476 ?auto_473 ) )
  )

)

