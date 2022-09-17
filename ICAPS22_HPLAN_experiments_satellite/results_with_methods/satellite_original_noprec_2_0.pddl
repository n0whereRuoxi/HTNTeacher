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
      ?auto_165 - INSTRUMENT
      ?auto_167 - SATELLITE
      ?auto_166 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_165 ?auto_167 ) ( SUPPORTS ?auto_165 ?auto_164 ) ( POWER_ON ?auto_165 ) ( POINTING ?auto_167 ?auto_166 ) ( not ( = ?auto_163 ?auto_166 ) ) ( CALIBRATION_TARGET ?auto_165 ?auto_166 ) ( NOT_CALIBRATED ?auto_165 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_167 ?auto_165 ?auto_166 )
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
      ?auto_177 - INSTRUMENT
      ?auto_179 - SATELLITE
      ?auto_178 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_177 ?auto_179 ) ( SUPPORTS ?auto_177 ?auto_176 ) ( POINTING ?auto_179 ?auto_178 ) ( not ( = ?auto_175 ?auto_178 ) ) ( CALIBRATION_TARGET ?auto_177 ?auto_178 ) ( POWER_AVAIL ?auto_179 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_177 ?auto_179 )
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
      ?auto_189 - INSTRUMENT
      ?auto_191 - SATELLITE
      ?auto_190 - DIRECTION
      ?auto_192 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_189 ?auto_191 ) ( SUPPORTS ?auto_189 ?auto_188 ) ( not ( = ?auto_187 ?auto_190 ) ) ( CALIBRATION_TARGET ?auto_189 ?auto_190 ) ( POWER_AVAIL ?auto_191 ) ( POINTING ?auto_191 ?auto_192 ) ( not ( = ?auto_190 ?auto_192 ) ) ( not ( = ?auto_187 ?auto_192 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_191 ?auto_190 ?auto_192 )
      ( GET-1IMAGE ?auto_187 ?auto_188 )
      ( GET-1IMAGE-VERIFY ?auto_187 ?auto_188 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_215 - DIRECTION
      ?auto_216 - MODE
    )
    :vars
    (
      ?auto_217 - INSTRUMENT
      ?auto_218 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_217 ) ( ON_BOARD ?auto_217 ?auto_218 ) ( SUPPORTS ?auto_217 ?auto_216 ) ( POWER_ON ?auto_217 ) ( POINTING ?auto_218 ?auto_215 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_218 ?auto_215 ?auto_217 ?auto_216 )
      ( GET-1IMAGE-VERIFY ?auto_215 ?auto_216 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_219 - DIRECTION
      ?auto_220 - MODE
      ?auto_222 - DIRECTION
      ?auto_221 - MODE
    )
    :vars
    (
      ?auto_224 - INSTRUMENT
      ?auto_223 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_224 ) ( ON_BOARD ?auto_224 ?auto_223 ) ( SUPPORTS ?auto_224 ?auto_221 ) ( POWER_ON ?auto_224 ) ( POINTING ?auto_223 ?auto_222 ) ( HAVE_IMAGE ?auto_219 ?auto_220 ) ( not ( = ?auto_219 ?auto_222 ) ) ( not ( = ?auto_220 ?auto_221 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_222 ?auto_221 )
      ( GET-2IMAGE-VERIFY ?auto_219 ?auto_220 ?auto_222 ?auto_221 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_225 - DIRECTION
      ?auto_226 - MODE
      ?auto_228 - DIRECTION
      ?auto_227 - MODE
    )
    :vars
    (
      ?auto_230 - INSTRUMENT
      ?auto_229 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_230 ) ( ON_BOARD ?auto_230 ?auto_229 ) ( SUPPORTS ?auto_230 ?auto_226 ) ( POWER_ON ?auto_230 ) ( POINTING ?auto_229 ?auto_225 ) ( HAVE_IMAGE ?auto_228 ?auto_227 ) ( not ( = ?auto_225 ?auto_228 ) ) ( not ( = ?auto_226 ?auto_227 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_225 ?auto_226 )
      ( GET-2IMAGE-VERIFY ?auto_225 ?auto_226 ?auto_228 ?auto_227 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_237 - DIRECTION
      ?auto_238 - MODE
    )
    :vars
    (
      ?auto_240 - INSTRUMENT
      ?auto_239 - SATELLITE
      ?auto_241 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_240 ) ( ON_BOARD ?auto_240 ?auto_239 ) ( SUPPORTS ?auto_240 ?auto_238 ) ( POWER_ON ?auto_240 ) ( POINTING ?auto_239 ?auto_241 ) ( not ( = ?auto_237 ?auto_241 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_239 ?auto_237 ?auto_241 )
      ( GET-1IMAGE ?auto_237 ?auto_238 )
      ( GET-1IMAGE-VERIFY ?auto_237 ?auto_238 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_242 - DIRECTION
      ?auto_243 - MODE
      ?auto_245 - DIRECTION
      ?auto_244 - MODE
    )
    :vars
    (
      ?auto_247 - INSTRUMENT
      ?auto_246 - SATELLITE
      ?auto_248 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_247 ) ( ON_BOARD ?auto_247 ?auto_246 ) ( SUPPORTS ?auto_247 ?auto_244 ) ( POWER_ON ?auto_247 ) ( POINTING ?auto_246 ?auto_248 ) ( not ( = ?auto_245 ?auto_248 ) ) ( HAVE_IMAGE ?auto_242 ?auto_243 ) ( not ( = ?auto_242 ?auto_245 ) ) ( not ( = ?auto_242 ?auto_248 ) ) ( not ( = ?auto_243 ?auto_244 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_245 ?auto_244 )
      ( GET-2IMAGE-VERIFY ?auto_242 ?auto_243 ?auto_245 ?auto_244 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_249 - DIRECTION
      ?auto_250 - MODE
      ?auto_252 - DIRECTION
      ?auto_251 - MODE
    )
    :vars
    (
      ?auto_254 - INSTRUMENT
      ?auto_255 - SATELLITE
      ?auto_253 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_254 ) ( ON_BOARD ?auto_254 ?auto_255 ) ( SUPPORTS ?auto_254 ?auto_250 ) ( POWER_ON ?auto_254 ) ( POINTING ?auto_255 ?auto_253 ) ( not ( = ?auto_249 ?auto_253 ) ) ( HAVE_IMAGE ?auto_252 ?auto_251 ) ( not ( = ?auto_252 ?auto_249 ) ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_251 ?auto_250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_252 ?auto_251 ?auto_249 ?auto_250 )
      ( GET-2IMAGE-VERIFY ?auto_249 ?auto_250 ?auto_252 ?auto_251 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_265 - DIRECTION
      ?auto_266 - MODE
    )
    :vars
    (
      ?auto_268 - INSTRUMENT
      ?auto_269 - SATELLITE
      ?auto_267 - DIRECTION
      ?auto_271 - DIRECTION
      ?auto_270 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_268 ?auto_269 ) ( SUPPORTS ?auto_268 ?auto_266 ) ( POWER_ON ?auto_268 ) ( POINTING ?auto_269 ?auto_267 ) ( not ( = ?auto_265 ?auto_267 ) ) ( HAVE_IMAGE ?auto_271 ?auto_270 ) ( not ( = ?auto_271 ?auto_265 ) ) ( not ( = ?auto_271 ?auto_267 ) ) ( not ( = ?auto_270 ?auto_266 ) ) ( CALIBRATION_TARGET ?auto_268 ?auto_267 ) ( NOT_CALIBRATED ?auto_268 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_269 ?auto_268 ?auto_267 )
      ( GET-2IMAGE ?auto_271 ?auto_270 ?auto_265 ?auto_266 )
      ( GET-1IMAGE-VERIFY ?auto_265 ?auto_266 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_272 - DIRECTION
      ?auto_273 - MODE
      ?auto_275 - DIRECTION
      ?auto_274 - MODE
    )
    :vars
    (
      ?auto_276 - INSTRUMENT
      ?auto_278 - SATELLITE
      ?auto_277 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276 ?auto_278 ) ( SUPPORTS ?auto_276 ?auto_274 ) ( POWER_ON ?auto_276 ) ( POINTING ?auto_278 ?auto_277 ) ( not ( = ?auto_275 ?auto_277 ) ) ( HAVE_IMAGE ?auto_272 ?auto_273 ) ( not ( = ?auto_272 ?auto_275 ) ) ( not ( = ?auto_272 ?auto_277 ) ) ( not ( = ?auto_273 ?auto_274 ) ) ( CALIBRATION_TARGET ?auto_276 ?auto_277 ) ( NOT_CALIBRATED ?auto_276 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275 ?auto_274 )
      ( GET-2IMAGE-VERIFY ?auto_272 ?auto_273 ?auto_275 ?auto_274 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_279 - DIRECTION
      ?auto_280 - MODE
      ?auto_282 - DIRECTION
      ?auto_281 - MODE
    )
    :vars
    (
      ?auto_285 - INSTRUMENT
      ?auto_283 - SATELLITE
      ?auto_284 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_285 ?auto_283 ) ( SUPPORTS ?auto_285 ?auto_280 ) ( POWER_ON ?auto_285 ) ( POINTING ?auto_283 ?auto_284 ) ( not ( = ?auto_279 ?auto_284 ) ) ( HAVE_IMAGE ?auto_282 ?auto_281 ) ( not ( = ?auto_282 ?auto_279 ) ) ( not ( = ?auto_282 ?auto_284 ) ) ( not ( = ?auto_281 ?auto_280 ) ) ( CALIBRATION_TARGET ?auto_285 ?auto_284 ) ( NOT_CALIBRATED ?auto_285 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282 ?auto_281 ?auto_279 ?auto_280 )
      ( GET-2IMAGE-VERIFY ?auto_279 ?auto_280 ?auto_282 ?auto_281 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_295 - DIRECTION
      ?auto_296 - MODE
    )
    :vars
    (
      ?auto_299 - INSTRUMENT
      ?auto_297 - SATELLITE
      ?auto_298 - DIRECTION
      ?auto_301 - DIRECTION
      ?auto_300 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_299 ?auto_297 ) ( SUPPORTS ?auto_299 ?auto_296 ) ( POINTING ?auto_297 ?auto_298 ) ( not ( = ?auto_295 ?auto_298 ) ) ( HAVE_IMAGE ?auto_301 ?auto_300 ) ( not ( = ?auto_301 ?auto_295 ) ) ( not ( = ?auto_301 ?auto_298 ) ) ( not ( = ?auto_300 ?auto_296 ) ) ( CALIBRATION_TARGET ?auto_299 ?auto_298 ) ( POWER_AVAIL ?auto_297 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_299 ?auto_297 )
      ( GET-2IMAGE ?auto_301 ?auto_300 ?auto_295 ?auto_296 )
      ( GET-1IMAGE-VERIFY ?auto_295 ?auto_296 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_302 - DIRECTION
      ?auto_303 - MODE
      ?auto_305 - DIRECTION
      ?auto_304 - MODE
    )
    :vars
    (
      ?auto_307 - INSTRUMENT
      ?auto_308 - SATELLITE
      ?auto_306 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307 ?auto_308 ) ( SUPPORTS ?auto_307 ?auto_304 ) ( POINTING ?auto_308 ?auto_306 ) ( not ( = ?auto_305 ?auto_306 ) ) ( HAVE_IMAGE ?auto_302 ?auto_303 ) ( not ( = ?auto_302 ?auto_305 ) ) ( not ( = ?auto_302 ?auto_306 ) ) ( not ( = ?auto_303 ?auto_304 ) ) ( CALIBRATION_TARGET ?auto_307 ?auto_306 ) ( POWER_AVAIL ?auto_308 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_305 ?auto_304 )
      ( GET-2IMAGE-VERIFY ?auto_302 ?auto_303 ?auto_305 ?auto_304 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_309 - DIRECTION
      ?auto_310 - MODE
      ?auto_312 - DIRECTION
      ?auto_311 - MODE
    )
    :vars
    (
      ?auto_313 - INSTRUMENT
      ?auto_314 - SATELLITE
      ?auto_315 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_313 ?auto_314 ) ( SUPPORTS ?auto_313 ?auto_310 ) ( POINTING ?auto_314 ?auto_315 ) ( not ( = ?auto_309 ?auto_315 ) ) ( HAVE_IMAGE ?auto_312 ?auto_311 ) ( not ( = ?auto_312 ?auto_309 ) ) ( not ( = ?auto_312 ?auto_315 ) ) ( not ( = ?auto_311 ?auto_310 ) ) ( CALIBRATION_TARGET ?auto_313 ?auto_315 ) ( POWER_AVAIL ?auto_314 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_312 ?auto_311 ?auto_309 ?auto_310 )
      ( GET-2IMAGE-VERIFY ?auto_309 ?auto_310 ?auto_312 ?auto_311 ) )
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
      ?auto_328 - SATELLITE
      ?auto_329 - DIRECTION
      ?auto_331 - DIRECTION
      ?auto_330 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_327 ?auto_328 ) ( SUPPORTS ?auto_327 ?auto_326 ) ( not ( = ?auto_325 ?auto_329 ) ) ( HAVE_IMAGE ?auto_331 ?auto_330 ) ( not ( = ?auto_331 ?auto_325 ) ) ( not ( = ?auto_331 ?auto_329 ) ) ( not ( = ?auto_330 ?auto_326 ) ) ( CALIBRATION_TARGET ?auto_327 ?auto_329 ) ( POWER_AVAIL ?auto_328 ) ( POINTING ?auto_328 ?auto_331 ) )
    :subtasks
    ( ( !TURN_TO ?auto_328 ?auto_329 ?auto_331 )
      ( GET-2IMAGE ?auto_331 ?auto_330 ?auto_325 ?auto_326 )
      ( GET-1IMAGE-VERIFY ?auto_325 ?auto_326 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_332 - DIRECTION
      ?auto_333 - MODE
      ?auto_335 - DIRECTION
      ?auto_334 - MODE
    )
    :vars
    (
      ?auto_337 - INSTRUMENT
      ?auto_336 - SATELLITE
      ?auto_338 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_337 ?auto_336 ) ( SUPPORTS ?auto_337 ?auto_334 ) ( not ( = ?auto_335 ?auto_338 ) ) ( HAVE_IMAGE ?auto_332 ?auto_333 ) ( not ( = ?auto_332 ?auto_335 ) ) ( not ( = ?auto_332 ?auto_338 ) ) ( not ( = ?auto_333 ?auto_334 ) ) ( CALIBRATION_TARGET ?auto_337 ?auto_338 ) ( POWER_AVAIL ?auto_336 ) ( POINTING ?auto_336 ?auto_332 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_335 ?auto_334 )
      ( GET-2IMAGE-VERIFY ?auto_332 ?auto_333 ?auto_335 ?auto_334 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_339 - DIRECTION
      ?auto_340 - MODE
      ?auto_342 - DIRECTION
      ?auto_341 - MODE
    )
    :vars
    (
      ?auto_345 - INSTRUMENT
      ?auto_343 - SATELLITE
      ?auto_344 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_345 ?auto_343 ) ( SUPPORTS ?auto_345 ?auto_340 ) ( not ( = ?auto_339 ?auto_344 ) ) ( HAVE_IMAGE ?auto_342 ?auto_341 ) ( not ( = ?auto_342 ?auto_339 ) ) ( not ( = ?auto_342 ?auto_344 ) ) ( not ( = ?auto_341 ?auto_340 ) ) ( CALIBRATION_TARGET ?auto_345 ?auto_344 ) ( POWER_AVAIL ?auto_343 ) ( POINTING ?auto_343 ?auto_342 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_342 ?auto_341 ?auto_339 ?auto_340 )
      ( GET-2IMAGE-VERIFY ?auto_339 ?auto_340 ?auto_342 ?auto_341 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_355 - DIRECTION
      ?auto_356 - MODE
    )
    :vars
    (
      ?auto_359 - INSTRUMENT
      ?auto_357 - SATELLITE
      ?auto_358 - DIRECTION
      ?auto_361 - DIRECTION
      ?auto_360 - MODE
      ?auto_362 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_359 ?auto_357 ) ( SUPPORTS ?auto_359 ?auto_356 ) ( not ( = ?auto_355 ?auto_358 ) ) ( HAVE_IMAGE ?auto_361 ?auto_360 ) ( not ( = ?auto_361 ?auto_355 ) ) ( not ( = ?auto_361 ?auto_358 ) ) ( not ( = ?auto_360 ?auto_356 ) ) ( CALIBRATION_TARGET ?auto_359 ?auto_358 ) ( POINTING ?auto_357 ?auto_361 ) ( ON_BOARD ?auto_362 ?auto_357 ) ( POWER_ON ?auto_362 ) ( not ( = ?auto_359 ?auto_362 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_362 ?auto_357 )
      ( GET-2IMAGE ?auto_361 ?auto_360 ?auto_355 ?auto_356 )
      ( GET-1IMAGE-VERIFY ?auto_355 ?auto_356 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_363 - DIRECTION
      ?auto_364 - MODE
      ?auto_366 - DIRECTION
      ?auto_365 - MODE
    )
    :vars
    (
      ?auto_369 - INSTRUMENT
      ?auto_367 - SATELLITE
      ?auto_368 - DIRECTION
      ?auto_370 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_369 ?auto_367 ) ( SUPPORTS ?auto_369 ?auto_365 ) ( not ( = ?auto_366 ?auto_368 ) ) ( HAVE_IMAGE ?auto_363 ?auto_364 ) ( not ( = ?auto_363 ?auto_366 ) ) ( not ( = ?auto_363 ?auto_368 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( CALIBRATION_TARGET ?auto_369 ?auto_368 ) ( POINTING ?auto_367 ?auto_363 ) ( ON_BOARD ?auto_370 ?auto_367 ) ( POWER_ON ?auto_370 ) ( not ( = ?auto_369 ?auto_370 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_366 ?auto_365 )
      ( GET-2IMAGE-VERIFY ?auto_363 ?auto_364 ?auto_366 ?auto_365 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_371 - DIRECTION
      ?auto_372 - MODE
      ?auto_374 - DIRECTION
      ?auto_373 - MODE
    )
    :vars
    (
      ?auto_376 - INSTRUMENT
      ?auto_377 - SATELLITE
      ?auto_378 - DIRECTION
      ?auto_375 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_376 ?auto_377 ) ( SUPPORTS ?auto_376 ?auto_372 ) ( not ( = ?auto_371 ?auto_378 ) ) ( HAVE_IMAGE ?auto_374 ?auto_373 ) ( not ( = ?auto_374 ?auto_371 ) ) ( not ( = ?auto_374 ?auto_378 ) ) ( not ( = ?auto_373 ?auto_372 ) ) ( CALIBRATION_TARGET ?auto_376 ?auto_378 ) ( POINTING ?auto_377 ?auto_374 ) ( ON_BOARD ?auto_375 ?auto_377 ) ( POWER_ON ?auto_375 ) ( not ( = ?auto_376 ?auto_375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_374 ?auto_373 ?auto_371 ?auto_372 )
      ( GET-2IMAGE-VERIFY ?auto_371 ?auto_372 ?auto_374 ?auto_373 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_389 - DIRECTION
      ?auto_390 - MODE
    )
    :vars
    (
      ?auto_392 - INSTRUMENT
      ?auto_393 - SATELLITE
      ?auto_394 - DIRECTION
      ?auto_396 - DIRECTION
      ?auto_395 - MODE
      ?auto_391 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392 ?auto_393 ) ( SUPPORTS ?auto_392 ?auto_390 ) ( not ( = ?auto_389 ?auto_394 ) ) ( not ( = ?auto_396 ?auto_389 ) ) ( not ( = ?auto_396 ?auto_394 ) ) ( not ( = ?auto_395 ?auto_390 ) ) ( CALIBRATION_TARGET ?auto_392 ?auto_394 ) ( POINTING ?auto_393 ?auto_396 ) ( ON_BOARD ?auto_391 ?auto_393 ) ( POWER_ON ?auto_391 ) ( not ( = ?auto_392 ?auto_391 ) ) ( CALIBRATED ?auto_391 ) ( SUPPORTS ?auto_391 ?auto_395 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_396 ?auto_395 )
      ( GET-2IMAGE ?auto_396 ?auto_395 ?auto_389 ?auto_390 )
      ( GET-1IMAGE-VERIFY ?auto_389 ?auto_390 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_397 - DIRECTION
      ?auto_398 - MODE
      ?auto_400 - DIRECTION
      ?auto_399 - MODE
    )
    :vars
    (
      ?auto_401 - INSTRUMENT
      ?auto_403 - SATELLITE
      ?auto_404 - DIRECTION
      ?auto_402 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_401 ?auto_403 ) ( SUPPORTS ?auto_401 ?auto_399 ) ( not ( = ?auto_400 ?auto_404 ) ) ( not ( = ?auto_397 ?auto_400 ) ) ( not ( = ?auto_397 ?auto_404 ) ) ( not ( = ?auto_398 ?auto_399 ) ) ( CALIBRATION_TARGET ?auto_401 ?auto_404 ) ( POINTING ?auto_403 ?auto_397 ) ( ON_BOARD ?auto_402 ?auto_403 ) ( POWER_ON ?auto_402 ) ( not ( = ?auto_401 ?auto_402 ) ) ( CALIBRATED ?auto_402 ) ( SUPPORTS ?auto_402 ?auto_398 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_400 ?auto_399 )
      ( GET-2IMAGE-VERIFY ?auto_397 ?auto_398 ?auto_400 ?auto_399 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_405 - DIRECTION
      ?auto_406 - MODE
      ?auto_408 - DIRECTION
      ?auto_407 - MODE
    )
    :vars
    (
      ?auto_412 - INSTRUMENT
      ?auto_410 - SATELLITE
      ?auto_409 - DIRECTION
      ?auto_411 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_412 ?auto_410 ) ( SUPPORTS ?auto_412 ?auto_406 ) ( not ( = ?auto_405 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_405 ) ) ( not ( = ?auto_408 ?auto_409 ) ) ( not ( = ?auto_407 ?auto_406 ) ) ( CALIBRATION_TARGET ?auto_412 ?auto_409 ) ( POINTING ?auto_410 ?auto_408 ) ( ON_BOARD ?auto_411 ?auto_410 ) ( POWER_ON ?auto_411 ) ( not ( = ?auto_412 ?auto_411 ) ) ( CALIBRATED ?auto_411 ) ( SUPPORTS ?auto_411 ?auto_407 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_408 ?auto_407 ?auto_405 ?auto_406 )
      ( GET-2IMAGE-VERIFY ?auto_405 ?auto_406 ?auto_408 ?auto_407 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_423 - DIRECTION
      ?auto_424 - MODE
    )
    :vars
    (
      ?auto_428 - INSTRUMENT
      ?auto_426 - SATELLITE
      ?auto_425 - DIRECTION
      ?auto_430 - DIRECTION
      ?auto_429 - MODE
      ?auto_427 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_428 ?auto_426 ) ( SUPPORTS ?auto_428 ?auto_424 ) ( not ( = ?auto_423 ?auto_425 ) ) ( not ( = ?auto_430 ?auto_423 ) ) ( not ( = ?auto_430 ?auto_425 ) ) ( not ( = ?auto_429 ?auto_424 ) ) ( CALIBRATION_TARGET ?auto_428 ?auto_425 ) ( ON_BOARD ?auto_427 ?auto_426 ) ( POWER_ON ?auto_427 ) ( not ( = ?auto_428 ?auto_427 ) ) ( CALIBRATED ?auto_427 ) ( SUPPORTS ?auto_427 ?auto_429 ) ( POINTING ?auto_426 ?auto_425 ) )
    :subtasks
    ( ( !TURN_TO ?auto_426 ?auto_430 ?auto_425 )
      ( GET-2IMAGE ?auto_430 ?auto_429 ?auto_423 ?auto_424 )
      ( GET-1IMAGE-VERIFY ?auto_423 ?auto_424 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_431 - DIRECTION
      ?auto_432 - MODE
      ?auto_434 - DIRECTION
      ?auto_433 - MODE
    )
    :vars
    (
      ?auto_437 - INSTRUMENT
      ?auto_435 - SATELLITE
      ?auto_436 - DIRECTION
      ?auto_438 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_437 ?auto_435 ) ( SUPPORTS ?auto_437 ?auto_433 ) ( not ( = ?auto_434 ?auto_436 ) ) ( not ( = ?auto_431 ?auto_434 ) ) ( not ( = ?auto_431 ?auto_436 ) ) ( not ( = ?auto_432 ?auto_433 ) ) ( CALIBRATION_TARGET ?auto_437 ?auto_436 ) ( ON_BOARD ?auto_438 ?auto_435 ) ( POWER_ON ?auto_438 ) ( not ( = ?auto_437 ?auto_438 ) ) ( CALIBRATED ?auto_438 ) ( SUPPORTS ?auto_438 ?auto_432 ) ( POINTING ?auto_435 ?auto_436 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_434 ?auto_433 )
      ( GET-2IMAGE-VERIFY ?auto_431 ?auto_432 ?auto_434 ?auto_433 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_439 - DIRECTION
      ?auto_440 - MODE
      ?auto_442 - DIRECTION
      ?auto_441 - MODE
    )
    :vars
    (
      ?auto_446 - INSTRUMENT
      ?auto_444 - SATELLITE
      ?auto_445 - DIRECTION
      ?auto_443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_446 ?auto_444 ) ( SUPPORTS ?auto_446 ?auto_440 ) ( not ( = ?auto_439 ?auto_445 ) ) ( not ( = ?auto_442 ?auto_439 ) ) ( not ( = ?auto_442 ?auto_445 ) ) ( not ( = ?auto_441 ?auto_440 ) ) ( CALIBRATION_TARGET ?auto_446 ?auto_445 ) ( ON_BOARD ?auto_443 ?auto_444 ) ( POWER_ON ?auto_443 ) ( not ( = ?auto_446 ?auto_443 ) ) ( CALIBRATED ?auto_443 ) ( SUPPORTS ?auto_443 ?auto_441 ) ( POINTING ?auto_444 ?auto_445 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_442 ?auto_441 ?auto_439 ?auto_440 )
      ( GET-2IMAGE-VERIFY ?auto_439 ?auto_440 ?auto_442 ?auto_441 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_457 - DIRECTION
      ?auto_458 - MODE
    )
    :vars
    (
      ?auto_462 - INSTRUMENT
      ?auto_460 - SATELLITE
      ?auto_461 - DIRECTION
      ?auto_464 - DIRECTION
      ?auto_463 - MODE
      ?auto_459 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_462 ?auto_460 ) ( SUPPORTS ?auto_462 ?auto_458 ) ( not ( = ?auto_457 ?auto_461 ) ) ( not ( = ?auto_464 ?auto_457 ) ) ( not ( = ?auto_464 ?auto_461 ) ) ( not ( = ?auto_463 ?auto_458 ) ) ( CALIBRATION_TARGET ?auto_462 ?auto_461 ) ( ON_BOARD ?auto_459 ?auto_460 ) ( POWER_ON ?auto_459 ) ( not ( = ?auto_462 ?auto_459 ) ) ( SUPPORTS ?auto_459 ?auto_463 ) ( POINTING ?auto_460 ?auto_461 ) ( CALIBRATION_TARGET ?auto_459 ?auto_461 ) ( NOT_CALIBRATED ?auto_459 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_460 ?auto_459 ?auto_461 )
      ( GET-2IMAGE ?auto_464 ?auto_463 ?auto_457 ?auto_458 )
      ( GET-1IMAGE-VERIFY ?auto_457 ?auto_458 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_465 - DIRECTION
      ?auto_466 - MODE
      ?auto_468 - DIRECTION
      ?auto_467 - MODE
    )
    :vars
    (
      ?auto_471 - INSTRUMENT
      ?auto_470 - SATELLITE
      ?auto_469 - DIRECTION
      ?auto_472 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_471 ?auto_470 ) ( SUPPORTS ?auto_471 ?auto_467 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_465 ?auto_468 ) ) ( not ( = ?auto_465 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_467 ) ) ( CALIBRATION_TARGET ?auto_471 ?auto_469 ) ( ON_BOARD ?auto_472 ?auto_470 ) ( POWER_ON ?auto_472 ) ( not ( = ?auto_471 ?auto_472 ) ) ( SUPPORTS ?auto_472 ?auto_466 ) ( POINTING ?auto_470 ?auto_469 ) ( CALIBRATION_TARGET ?auto_472 ?auto_469 ) ( NOT_CALIBRATED ?auto_472 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_468 ?auto_467 )
      ( GET-2IMAGE-VERIFY ?auto_465 ?auto_466 ?auto_468 ?auto_467 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_473 - DIRECTION
      ?auto_474 - MODE
      ?auto_476 - DIRECTION
      ?auto_475 - MODE
    )
    :vars
    (
      ?auto_477 - INSTRUMENT
      ?auto_480 - SATELLITE
      ?auto_479 - DIRECTION
      ?auto_478 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_477 ?auto_480 ) ( SUPPORTS ?auto_477 ?auto_474 ) ( not ( = ?auto_473 ?auto_479 ) ) ( not ( = ?auto_476 ?auto_473 ) ) ( not ( = ?auto_476 ?auto_479 ) ) ( not ( = ?auto_475 ?auto_474 ) ) ( CALIBRATION_TARGET ?auto_477 ?auto_479 ) ( ON_BOARD ?auto_478 ?auto_480 ) ( POWER_ON ?auto_478 ) ( not ( = ?auto_477 ?auto_478 ) ) ( SUPPORTS ?auto_478 ?auto_475 ) ( POINTING ?auto_480 ?auto_479 ) ( CALIBRATION_TARGET ?auto_478 ?auto_479 ) ( NOT_CALIBRATED ?auto_478 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_476 ?auto_475 ?auto_473 ?auto_474 )
      ( GET-2IMAGE-VERIFY ?auto_473 ?auto_474 ?auto_476 ?auto_475 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_491 - DIRECTION
      ?auto_492 - MODE
    )
    :vars
    (
      ?auto_495 - INSTRUMENT
      ?auto_498 - SATELLITE
      ?auto_497 - DIRECTION
      ?auto_494 - DIRECTION
      ?auto_493 - MODE
      ?auto_496 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_495 ?auto_498 ) ( SUPPORTS ?auto_495 ?auto_492 ) ( not ( = ?auto_491 ?auto_497 ) ) ( not ( = ?auto_494 ?auto_491 ) ) ( not ( = ?auto_494 ?auto_497 ) ) ( not ( = ?auto_493 ?auto_492 ) ) ( CALIBRATION_TARGET ?auto_495 ?auto_497 ) ( ON_BOARD ?auto_496 ?auto_498 ) ( not ( = ?auto_495 ?auto_496 ) ) ( SUPPORTS ?auto_496 ?auto_493 ) ( POINTING ?auto_498 ?auto_497 ) ( CALIBRATION_TARGET ?auto_496 ?auto_497 ) ( POWER_AVAIL ?auto_498 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_496 ?auto_498 )
      ( GET-2IMAGE ?auto_494 ?auto_493 ?auto_491 ?auto_492 )
      ( GET-1IMAGE-VERIFY ?auto_491 ?auto_492 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_499 - DIRECTION
      ?auto_500 - MODE
      ?auto_502 - DIRECTION
      ?auto_501 - MODE
    )
    :vars
    (
      ?auto_504 - INSTRUMENT
      ?auto_506 - SATELLITE
      ?auto_505 - DIRECTION
      ?auto_503 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_504 ?auto_506 ) ( SUPPORTS ?auto_504 ?auto_501 ) ( not ( = ?auto_502 ?auto_505 ) ) ( not ( = ?auto_499 ?auto_502 ) ) ( not ( = ?auto_499 ?auto_505 ) ) ( not ( = ?auto_500 ?auto_501 ) ) ( CALIBRATION_TARGET ?auto_504 ?auto_505 ) ( ON_BOARD ?auto_503 ?auto_506 ) ( not ( = ?auto_504 ?auto_503 ) ) ( SUPPORTS ?auto_503 ?auto_500 ) ( POINTING ?auto_506 ?auto_505 ) ( CALIBRATION_TARGET ?auto_503 ?auto_505 ) ( POWER_AVAIL ?auto_506 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_502 ?auto_501 )
      ( GET-2IMAGE-VERIFY ?auto_499 ?auto_500 ?auto_502 ?auto_501 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_507 - DIRECTION
      ?auto_508 - MODE
      ?auto_510 - DIRECTION
      ?auto_509 - MODE
    )
    :vars
    (
      ?auto_512 - INSTRUMENT
      ?auto_511 - SATELLITE
      ?auto_513 - DIRECTION
      ?auto_514 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_512 ?auto_511 ) ( SUPPORTS ?auto_512 ?auto_508 ) ( not ( = ?auto_507 ?auto_513 ) ) ( not ( = ?auto_510 ?auto_507 ) ) ( not ( = ?auto_510 ?auto_513 ) ) ( not ( = ?auto_509 ?auto_508 ) ) ( CALIBRATION_TARGET ?auto_512 ?auto_513 ) ( ON_BOARD ?auto_514 ?auto_511 ) ( not ( = ?auto_512 ?auto_514 ) ) ( SUPPORTS ?auto_514 ?auto_509 ) ( POINTING ?auto_511 ?auto_513 ) ( CALIBRATION_TARGET ?auto_514 ?auto_513 ) ( POWER_AVAIL ?auto_511 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_510 ?auto_509 ?auto_507 ?auto_508 )
      ( GET-2IMAGE-VERIFY ?auto_507 ?auto_508 ?auto_510 ?auto_509 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_525 - DIRECTION
      ?auto_526 - MODE
    )
    :vars
    (
      ?auto_528 - INSTRUMENT
      ?auto_527 - SATELLITE
      ?auto_529 - DIRECTION
      ?auto_532 - DIRECTION
      ?auto_531 - MODE
      ?auto_530 - INSTRUMENT
      ?auto_533 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_528 ?auto_527 ) ( SUPPORTS ?auto_528 ?auto_526 ) ( not ( = ?auto_525 ?auto_529 ) ) ( not ( = ?auto_532 ?auto_525 ) ) ( not ( = ?auto_532 ?auto_529 ) ) ( not ( = ?auto_531 ?auto_526 ) ) ( CALIBRATION_TARGET ?auto_528 ?auto_529 ) ( ON_BOARD ?auto_530 ?auto_527 ) ( not ( = ?auto_528 ?auto_530 ) ) ( SUPPORTS ?auto_530 ?auto_531 ) ( CALIBRATION_TARGET ?auto_530 ?auto_529 ) ( POWER_AVAIL ?auto_527 ) ( POINTING ?auto_527 ?auto_533 ) ( not ( = ?auto_529 ?auto_533 ) ) ( not ( = ?auto_525 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_533 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_527 ?auto_529 ?auto_533 )
      ( GET-2IMAGE ?auto_532 ?auto_531 ?auto_525 ?auto_526 )
      ( GET-1IMAGE-VERIFY ?auto_525 ?auto_526 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_534 - DIRECTION
      ?auto_535 - MODE
      ?auto_537 - DIRECTION
      ?auto_536 - MODE
    )
    :vars
    (
      ?auto_539 - INSTRUMENT
      ?auto_542 - SATELLITE
      ?auto_540 - DIRECTION
      ?auto_538 - INSTRUMENT
      ?auto_541 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_539 ?auto_542 ) ( SUPPORTS ?auto_539 ?auto_536 ) ( not ( = ?auto_537 ?auto_540 ) ) ( not ( = ?auto_534 ?auto_537 ) ) ( not ( = ?auto_534 ?auto_540 ) ) ( not ( = ?auto_535 ?auto_536 ) ) ( CALIBRATION_TARGET ?auto_539 ?auto_540 ) ( ON_BOARD ?auto_538 ?auto_542 ) ( not ( = ?auto_539 ?auto_538 ) ) ( SUPPORTS ?auto_538 ?auto_535 ) ( CALIBRATION_TARGET ?auto_538 ?auto_540 ) ( POWER_AVAIL ?auto_542 ) ( POINTING ?auto_542 ?auto_541 ) ( not ( = ?auto_540 ?auto_541 ) ) ( not ( = ?auto_537 ?auto_541 ) ) ( not ( = ?auto_534 ?auto_541 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_537 ?auto_536 )
      ( GET-2IMAGE-VERIFY ?auto_534 ?auto_535 ?auto_537 ?auto_536 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_543 - DIRECTION
      ?auto_544 - MODE
      ?auto_546 - DIRECTION
      ?auto_545 - MODE
    )
    :vars
    (
      ?auto_551 - INSTRUMENT
      ?auto_550 - SATELLITE
      ?auto_547 - DIRECTION
      ?auto_548 - INSTRUMENT
      ?auto_549 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_551 ?auto_550 ) ( SUPPORTS ?auto_551 ?auto_544 ) ( not ( = ?auto_543 ?auto_547 ) ) ( not ( = ?auto_546 ?auto_543 ) ) ( not ( = ?auto_546 ?auto_547 ) ) ( not ( = ?auto_545 ?auto_544 ) ) ( CALIBRATION_TARGET ?auto_551 ?auto_547 ) ( ON_BOARD ?auto_548 ?auto_550 ) ( not ( = ?auto_551 ?auto_548 ) ) ( SUPPORTS ?auto_548 ?auto_545 ) ( CALIBRATION_TARGET ?auto_548 ?auto_547 ) ( POWER_AVAIL ?auto_550 ) ( POINTING ?auto_550 ?auto_549 ) ( not ( = ?auto_547 ?auto_549 ) ) ( not ( = ?auto_543 ?auto_549 ) ) ( not ( = ?auto_546 ?auto_549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_546 ?auto_545 ?auto_543 ?auto_544 )
      ( GET-2IMAGE-VERIFY ?auto_543 ?auto_544 ?auto_546 ?auto_545 ) )
  )

)

