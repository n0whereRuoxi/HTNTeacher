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
      ?auto_177 - INSTRUMENT
      ?auto_178 - SATELLITE
      ?auto_179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_177 ?auto_178 ) ( SUPPORTS ?auto_177 ?auto_176 ) ( POINTING ?auto_178 ?auto_179 ) ( not ( = ?auto_175 ?auto_179 ) ) ( CALIBRATION_TARGET ?auto_177 ?auto_179 ) ( POWER_AVAIL ?auto_178 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_177 ?auto_178 )
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
    ( and ( not ( = ?auto_222 ?auto_219 ) ) ( CALIBRATED ?auto_224 ) ( ON_BOARD ?auto_224 ?auto_223 ) ( SUPPORTS ?auto_224 ?auto_221 ) ( POWER_ON ?auto_224 ) ( POINTING ?auto_223 ?auto_222 ) ( HAVE_IMAGE ?auto_219 ?auto_220 ) ( not ( = ?auto_220 ?auto_221 ) ) )
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
    ( and ( not ( = ?auto_228 ?auto_225 ) ) ( CALIBRATED ?auto_230 ) ( ON_BOARD ?auto_230 ?auto_229 ) ( SUPPORTS ?auto_230 ?auto_226 ) ( POWER_ON ?auto_230 ) ( POINTING ?auto_229 ?auto_225 ) ( HAVE_IMAGE ?auto_228 ?auto_227 ) ( not ( = ?auto_226 ?auto_227 ) ) )
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
    ( and ( not ( = ?auto_245 ?auto_242 ) ) ( CALIBRATED ?auto_247 ) ( ON_BOARD ?auto_247 ?auto_246 ) ( SUPPORTS ?auto_247 ?auto_244 ) ( POWER_ON ?auto_247 ) ( POINTING ?auto_246 ?auto_248 ) ( not ( = ?auto_245 ?auto_248 ) ) ( HAVE_IMAGE ?auto_242 ?auto_243 ) ( not ( = ?auto_242 ?auto_248 ) ) ( not ( = ?auto_243 ?auto_244 ) ) )
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
      ?auto_255 - INSTRUMENT
      ?auto_254 - SATELLITE
      ?auto_253 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_252 ?auto_249 ) ) ( CALIBRATED ?auto_255 ) ( ON_BOARD ?auto_255 ?auto_254 ) ( SUPPORTS ?auto_255 ?auto_250 ) ( POWER_ON ?auto_255 ) ( POINTING ?auto_254 ?auto_253 ) ( not ( = ?auto_249 ?auto_253 ) ) ( HAVE_IMAGE ?auto_252 ?auto_251 ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_251 ?auto_250 ) ) )
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
      ?auto_271 - DIRECTION
      ?auto_269 - INSTRUMENT
      ?auto_268 - SATELLITE
      ?auto_267 - DIRECTION
      ?auto_270 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_265 ?auto_271 ) ) ( ON_BOARD ?auto_269 ?auto_268 ) ( SUPPORTS ?auto_269 ?auto_266 ) ( POWER_ON ?auto_269 ) ( POINTING ?auto_268 ?auto_267 ) ( not ( = ?auto_265 ?auto_267 ) ) ( HAVE_IMAGE ?auto_271 ?auto_270 ) ( not ( = ?auto_271 ?auto_267 ) ) ( not ( = ?auto_270 ?auto_266 ) ) ( CALIBRATION_TARGET ?auto_269 ?auto_267 ) ( NOT_CALIBRATED ?auto_269 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_268 ?auto_269 ?auto_267 )
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
    ( and ( not ( = ?auto_275 ?auto_272 ) ) ( ON_BOARD ?auto_276 ?auto_278 ) ( SUPPORTS ?auto_276 ?auto_274 ) ( POWER_ON ?auto_276 ) ( POINTING ?auto_278 ?auto_277 ) ( not ( = ?auto_275 ?auto_277 ) ) ( HAVE_IMAGE ?auto_272 ?auto_273 ) ( not ( = ?auto_272 ?auto_277 ) ) ( not ( = ?auto_273 ?auto_274 ) ) ( CALIBRATION_TARGET ?auto_276 ?auto_277 ) ( NOT_CALIBRATED ?auto_276 ) )
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
      ?auto_284 - INSTRUMENT
      ?auto_285 - SATELLITE
      ?auto_283 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282 ?auto_279 ) ) ( ON_BOARD ?auto_284 ?auto_285 ) ( SUPPORTS ?auto_284 ?auto_280 ) ( POWER_ON ?auto_284 ) ( POINTING ?auto_285 ?auto_283 ) ( not ( = ?auto_279 ?auto_283 ) ) ( HAVE_IMAGE ?auto_282 ?auto_281 ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_281 ?auto_280 ) ) ( CALIBRATION_TARGET ?auto_284 ?auto_283 ) ( NOT_CALIBRATED ?auto_284 ) )
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
      ?auto_301 - DIRECTION
      ?auto_298 - INSTRUMENT
      ?auto_299 - SATELLITE
      ?auto_297 - DIRECTION
      ?auto_300 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_295 ?auto_301 ) ) ( ON_BOARD ?auto_298 ?auto_299 ) ( SUPPORTS ?auto_298 ?auto_296 ) ( POINTING ?auto_299 ?auto_297 ) ( not ( = ?auto_295 ?auto_297 ) ) ( HAVE_IMAGE ?auto_301 ?auto_300 ) ( not ( = ?auto_301 ?auto_297 ) ) ( not ( = ?auto_300 ?auto_296 ) ) ( CALIBRATION_TARGET ?auto_298 ?auto_297 ) ( POWER_AVAIL ?auto_299 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_298 ?auto_299 )
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
      ?auto_306 - INSTRUMENT
      ?auto_308 - SATELLITE
      ?auto_307 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_305 ?auto_302 ) ) ( ON_BOARD ?auto_306 ?auto_308 ) ( SUPPORTS ?auto_306 ?auto_304 ) ( POINTING ?auto_308 ?auto_307 ) ( not ( = ?auto_305 ?auto_307 ) ) ( HAVE_IMAGE ?auto_302 ?auto_303 ) ( not ( = ?auto_302 ?auto_307 ) ) ( not ( = ?auto_303 ?auto_304 ) ) ( CALIBRATION_TARGET ?auto_306 ?auto_307 ) ( POWER_AVAIL ?auto_308 ) )
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
      ?auto_315 - INSTRUMENT
      ?auto_314 - SATELLITE
      ?auto_313 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_312 ?auto_309 ) ) ( ON_BOARD ?auto_315 ?auto_314 ) ( SUPPORTS ?auto_315 ?auto_310 ) ( POINTING ?auto_314 ?auto_313 ) ( not ( = ?auto_309 ?auto_313 ) ) ( HAVE_IMAGE ?auto_312 ?auto_311 ) ( not ( = ?auto_312 ?auto_313 ) ) ( not ( = ?auto_311 ?auto_310 ) ) ( CALIBRATION_TARGET ?auto_315 ?auto_313 ) ( POWER_AVAIL ?auto_314 ) )
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
      ?auto_331 - DIRECTION
      ?auto_329 - INSTRUMENT
      ?auto_328 - SATELLITE
      ?auto_327 - DIRECTION
      ?auto_330 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_325 ?auto_331 ) ) ( ON_BOARD ?auto_329 ?auto_328 ) ( SUPPORTS ?auto_329 ?auto_326 ) ( not ( = ?auto_325 ?auto_327 ) ) ( HAVE_IMAGE ?auto_331 ?auto_330 ) ( not ( = ?auto_331 ?auto_327 ) ) ( not ( = ?auto_330 ?auto_326 ) ) ( CALIBRATION_TARGET ?auto_329 ?auto_327 ) ( POWER_AVAIL ?auto_328 ) ( POINTING ?auto_328 ?auto_331 ) )
    :subtasks
    ( ( !TURN_TO ?auto_328 ?auto_327 ?auto_331 )
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
      ?auto_338 - SATELLITE
      ?auto_336 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335 ?auto_332 ) ) ( ON_BOARD ?auto_337 ?auto_338 ) ( SUPPORTS ?auto_337 ?auto_334 ) ( not ( = ?auto_335 ?auto_336 ) ) ( HAVE_IMAGE ?auto_332 ?auto_333 ) ( not ( = ?auto_332 ?auto_336 ) ) ( not ( = ?auto_333 ?auto_334 ) ) ( CALIBRATION_TARGET ?auto_337 ?auto_336 ) ( POWER_AVAIL ?auto_338 ) ( POINTING ?auto_338 ?auto_332 ) )
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
      ?auto_344 - INSTRUMENT
      ?auto_345 - SATELLITE
      ?auto_343 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_342 ?auto_339 ) ) ( ON_BOARD ?auto_344 ?auto_345 ) ( SUPPORTS ?auto_344 ?auto_340 ) ( not ( = ?auto_339 ?auto_343 ) ) ( HAVE_IMAGE ?auto_342 ?auto_341 ) ( not ( = ?auto_342 ?auto_343 ) ) ( not ( = ?auto_341 ?auto_340 ) ) ( CALIBRATION_TARGET ?auto_344 ?auto_343 ) ( POWER_AVAIL ?auto_345 ) ( POINTING ?auto_345 ?auto_342 ) )
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
      ?auto_361 - DIRECTION
      ?auto_358 - INSTRUMENT
      ?auto_359 - SATELLITE
      ?auto_357 - DIRECTION
      ?auto_360 - MODE
      ?auto_362 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_355 ?auto_361 ) ) ( ON_BOARD ?auto_358 ?auto_359 ) ( SUPPORTS ?auto_358 ?auto_356 ) ( not ( = ?auto_355 ?auto_357 ) ) ( HAVE_IMAGE ?auto_361 ?auto_360 ) ( not ( = ?auto_361 ?auto_357 ) ) ( not ( = ?auto_360 ?auto_356 ) ) ( CALIBRATION_TARGET ?auto_358 ?auto_357 ) ( POINTING ?auto_359 ?auto_361 ) ( ON_BOARD ?auto_362 ?auto_359 ) ( POWER_ON ?auto_362 ) ( not ( = ?auto_358 ?auto_362 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_362 ?auto_359 )
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
      ?auto_368 - INSTRUMENT
      ?auto_369 - SATELLITE
      ?auto_367 - DIRECTION
      ?auto_370 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_366 ?auto_363 ) ) ( ON_BOARD ?auto_368 ?auto_369 ) ( SUPPORTS ?auto_368 ?auto_365 ) ( not ( = ?auto_366 ?auto_367 ) ) ( HAVE_IMAGE ?auto_363 ?auto_364 ) ( not ( = ?auto_363 ?auto_367 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( CALIBRATION_TARGET ?auto_368 ?auto_367 ) ( POINTING ?auto_369 ?auto_363 ) ( ON_BOARD ?auto_370 ?auto_369 ) ( POWER_ON ?auto_370 ) ( not ( = ?auto_368 ?auto_370 ) ) )
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
      ?auto_378 - INSTRUMENT
      ?auto_377 - SATELLITE
      ?auto_376 - DIRECTION
      ?auto_375 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_374 ?auto_371 ) ) ( ON_BOARD ?auto_378 ?auto_377 ) ( SUPPORTS ?auto_378 ?auto_372 ) ( not ( = ?auto_371 ?auto_376 ) ) ( HAVE_IMAGE ?auto_374 ?auto_373 ) ( not ( = ?auto_374 ?auto_376 ) ) ( not ( = ?auto_373 ?auto_372 ) ) ( CALIBRATION_TARGET ?auto_378 ?auto_376 ) ( POINTING ?auto_377 ?auto_374 ) ( ON_BOARD ?auto_375 ?auto_377 ) ( POWER_ON ?auto_375 ) ( not ( = ?auto_378 ?auto_375 ) ) )
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
      ?auto_396 - DIRECTION
      ?auto_394 - INSTRUMENT
      ?auto_393 - SATELLITE
      ?auto_392 - DIRECTION
      ?auto_395 - MODE
      ?auto_391 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_389 ?auto_396 ) ) ( ON_BOARD ?auto_394 ?auto_393 ) ( SUPPORTS ?auto_394 ?auto_390 ) ( not ( = ?auto_389 ?auto_392 ) ) ( not ( = ?auto_396 ?auto_392 ) ) ( not ( = ?auto_395 ?auto_390 ) ) ( CALIBRATION_TARGET ?auto_394 ?auto_392 ) ( POINTING ?auto_393 ?auto_396 ) ( ON_BOARD ?auto_391 ?auto_393 ) ( POWER_ON ?auto_391 ) ( not ( = ?auto_394 ?auto_391 ) ) ( CALIBRATED ?auto_391 ) ( SUPPORTS ?auto_391 ?auto_395 ) )
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
      ?auto_404 - INSTRUMENT
      ?auto_403 - SATELLITE
      ?auto_401 - DIRECTION
      ?auto_402 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_400 ?auto_397 ) ) ( ON_BOARD ?auto_404 ?auto_403 ) ( SUPPORTS ?auto_404 ?auto_399 ) ( not ( = ?auto_400 ?auto_401 ) ) ( not ( = ?auto_397 ?auto_401 ) ) ( not ( = ?auto_398 ?auto_399 ) ) ( CALIBRATION_TARGET ?auto_404 ?auto_401 ) ( POINTING ?auto_403 ?auto_397 ) ( ON_BOARD ?auto_402 ?auto_403 ) ( POWER_ON ?auto_402 ) ( not ( = ?auto_404 ?auto_402 ) ) ( CALIBRATED ?auto_402 ) ( SUPPORTS ?auto_402 ?auto_398 ) )
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
      ?auto_409 - SATELLITE
      ?auto_410 - DIRECTION
      ?auto_411 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_408 ?auto_405 ) ) ( ON_BOARD ?auto_412 ?auto_409 ) ( SUPPORTS ?auto_412 ?auto_406 ) ( not ( = ?auto_405 ?auto_410 ) ) ( not ( = ?auto_408 ?auto_410 ) ) ( not ( = ?auto_407 ?auto_406 ) ) ( CALIBRATION_TARGET ?auto_412 ?auto_410 ) ( POINTING ?auto_409 ?auto_408 ) ( ON_BOARD ?auto_411 ?auto_409 ) ( POWER_ON ?auto_411 ) ( not ( = ?auto_412 ?auto_411 ) ) ( CALIBRATED ?auto_411 ) ( SUPPORTS ?auto_411 ?auto_407 ) )
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
      ?auto_430 - DIRECTION
      ?auto_428 - INSTRUMENT
      ?auto_425 - SATELLITE
      ?auto_426 - DIRECTION
      ?auto_429 - MODE
      ?auto_427 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_423 ?auto_430 ) ) ( ON_BOARD ?auto_428 ?auto_425 ) ( SUPPORTS ?auto_428 ?auto_424 ) ( not ( = ?auto_423 ?auto_426 ) ) ( not ( = ?auto_430 ?auto_426 ) ) ( not ( = ?auto_429 ?auto_424 ) ) ( CALIBRATION_TARGET ?auto_428 ?auto_426 ) ( ON_BOARD ?auto_427 ?auto_425 ) ( POWER_ON ?auto_427 ) ( not ( = ?auto_428 ?auto_427 ) ) ( CALIBRATED ?auto_427 ) ( SUPPORTS ?auto_427 ?auto_429 ) ( POINTING ?auto_425 ?auto_426 ) )
    :subtasks
    ( ( !TURN_TO ?auto_425 ?auto_430 ?auto_426 )
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
      ?auto_436 - INSTRUMENT
      ?auto_435 - SATELLITE
      ?auto_438 - DIRECTION
      ?auto_437 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_434 ?auto_431 ) ) ( ON_BOARD ?auto_436 ?auto_435 ) ( SUPPORTS ?auto_436 ?auto_433 ) ( not ( = ?auto_434 ?auto_438 ) ) ( not ( = ?auto_431 ?auto_438 ) ) ( not ( = ?auto_432 ?auto_433 ) ) ( CALIBRATION_TARGET ?auto_436 ?auto_438 ) ( ON_BOARD ?auto_437 ?auto_435 ) ( POWER_ON ?auto_437 ) ( not ( = ?auto_436 ?auto_437 ) ) ( CALIBRATED ?auto_437 ) ( SUPPORTS ?auto_437 ?auto_432 ) ( POINTING ?auto_435 ?auto_438 ) )
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
      ?auto_445 - INSTRUMENT
      ?auto_443 - SATELLITE
      ?auto_444 - DIRECTION
      ?auto_446 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_442 ?auto_439 ) ) ( ON_BOARD ?auto_445 ?auto_443 ) ( SUPPORTS ?auto_445 ?auto_440 ) ( not ( = ?auto_439 ?auto_444 ) ) ( not ( = ?auto_442 ?auto_444 ) ) ( not ( = ?auto_441 ?auto_440 ) ) ( CALIBRATION_TARGET ?auto_445 ?auto_444 ) ( ON_BOARD ?auto_446 ?auto_443 ) ( POWER_ON ?auto_446 ) ( not ( = ?auto_445 ?auto_446 ) ) ( CALIBRATED ?auto_446 ) ( SUPPORTS ?auto_446 ?auto_441 ) ( POINTING ?auto_443 ?auto_444 ) )
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
      ?auto_464 - DIRECTION
      ?auto_461 - INSTRUMENT
      ?auto_459 - SATELLITE
      ?auto_460 - DIRECTION
      ?auto_463 - MODE
      ?auto_462 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_457 ?auto_464 ) ) ( ON_BOARD ?auto_461 ?auto_459 ) ( SUPPORTS ?auto_461 ?auto_458 ) ( not ( = ?auto_457 ?auto_460 ) ) ( not ( = ?auto_464 ?auto_460 ) ) ( not ( = ?auto_463 ?auto_458 ) ) ( CALIBRATION_TARGET ?auto_461 ?auto_460 ) ( ON_BOARD ?auto_462 ?auto_459 ) ( POWER_ON ?auto_462 ) ( not ( = ?auto_461 ?auto_462 ) ) ( SUPPORTS ?auto_462 ?auto_463 ) ( POINTING ?auto_459 ?auto_460 ) ( CALIBRATION_TARGET ?auto_462 ?auto_460 ) ( NOT_CALIBRATED ?auto_462 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_459 ?auto_462 ?auto_460 )
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
      ?auto_472 - SATELLITE
      ?auto_469 - DIRECTION
      ?auto_470 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468 ?auto_465 ) ) ( ON_BOARD ?auto_471 ?auto_472 ) ( SUPPORTS ?auto_471 ?auto_467 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_465 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_467 ) ) ( CALIBRATION_TARGET ?auto_471 ?auto_469 ) ( ON_BOARD ?auto_470 ?auto_472 ) ( POWER_ON ?auto_470 ) ( not ( = ?auto_471 ?auto_470 ) ) ( SUPPORTS ?auto_470 ?auto_466 ) ( POINTING ?auto_472 ?auto_469 ) ( CALIBRATION_TARGET ?auto_470 ?auto_469 ) ( NOT_CALIBRATED ?auto_470 ) )
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
      ?auto_479 - SATELLITE
      ?auto_478 - DIRECTION
      ?auto_480 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_476 ?auto_473 ) ) ( ON_BOARD ?auto_477 ?auto_479 ) ( SUPPORTS ?auto_477 ?auto_474 ) ( not ( = ?auto_473 ?auto_478 ) ) ( not ( = ?auto_476 ?auto_478 ) ) ( not ( = ?auto_475 ?auto_474 ) ) ( CALIBRATION_TARGET ?auto_477 ?auto_478 ) ( ON_BOARD ?auto_480 ?auto_479 ) ( POWER_ON ?auto_480 ) ( not ( = ?auto_477 ?auto_480 ) ) ( SUPPORTS ?auto_480 ?auto_475 ) ( POINTING ?auto_479 ?auto_478 ) ( CALIBRATION_TARGET ?auto_480 ?auto_478 ) ( NOT_CALIBRATED ?auto_480 ) )
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
      ?auto_494 - DIRECTION
      ?auto_495 - INSTRUMENT
      ?auto_497 - SATELLITE
      ?auto_496 - DIRECTION
      ?auto_493 - MODE
      ?auto_498 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_491 ?auto_494 ) ) ( ON_BOARD ?auto_495 ?auto_497 ) ( SUPPORTS ?auto_495 ?auto_492 ) ( not ( = ?auto_491 ?auto_496 ) ) ( not ( = ?auto_494 ?auto_496 ) ) ( not ( = ?auto_493 ?auto_492 ) ) ( CALIBRATION_TARGET ?auto_495 ?auto_496 ) ( ON_BOARD ?auto_498 ?auto_497 ) ( not ( = ?auto_495 ?auto_498 ) ) ( SUPPORTS ?auto_498 ?auto_493 ) ( POINTING ?auto_497 ?auto_496 ) ( CALIBRATION_TARGET ?auto_498 ?auto_496 ) ( POWER_AVAIL ?auto_497 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_498 ?auto_497 )
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
      ?auto_503 - INSTRUMENT
      ?auto_504 - SATELLITE
      ?auto_505 - DIRECTION
      ?auto_506 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_502 ?auto_499 ) ) ( ON_BOARD ?auto_503 ?auto_504 ) ( SUPPORTS ?auto_503 ?auto_501 ) ( not ( = ?auto_502 ?auto_505 ) ) ( not ( = ?auto_499 ?auto_505 ) ) ( not ( = ?auto_500 ?auto_501 ) ) ( CALIBRATION_TARGET ?auto_503 ?auto_505 ) ( ON_BOARD ?auto_506 ?auto_504 ) ( not ( = ?auto_503 ?auto_506 ) ) ( SUPPORTS ?auto_506 ?auto_500 ) ( POINTING ?auto_504 ?auto_505 ) ( CALIBRATION_TARGET ?auto_506 ?auto_505 ) ( POWER_AVAIL ?auto_504 ) )
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
      ?auto_514 - INSTRUMENT
      ?auto_512 - SATELLITE
      ?auto_513 - DIRECTION
      ?auto_511 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_510 ?auto_507 ) ) ( ON_BOARD ?auto_514 ?auto_512 ) ( SUPPORTS ?auto_514 ?auto_508 ) ( not ( = ?auto_507 ?auto_513 ) ) ( not ( = ?auto_510 ?auto_513 ) ) ( not ( = ?auto_509 ?auto_508 ) ) ( CALIBRATION_TARGET ?auto_514 ?auto_513 ) ( ON_BOARD ?auto_511 ?auto_512 ) ( not ( = ?auto_514 ?auto_511 ) ) ( SUPPORTS ?auto_511 ?auto_509 ) ( POINTING ?auto_512 ?auto_513 ) ( CALIBRATION_TARGET ?auto_511 ?auto_513 ) ( POWER_AVAIL ?auto_512 ) )
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
      ?auto_532 - DIRECTION
      ?auto_530 - INSTRUMENT
      ?auto_528 - SATELLITE
      ?auto_529 - DIRECTION
      ?auto_531 - MODE
      ?auto_527 - INSTRUMENT
      ?auto_533 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_525 ?auto_532 ) ) ( ON_BOARD ?auto_530 ?auto_528 ) ( SUPPORTS ?auto_530 ?auto_526 ) ( not ( = ?auto_525 ?auto_529 ) ) ( not ( = ?auto_532 ?auto_529 ) ) ( not ( = ?auto_531 ?auto_526 ) ) ( CALIBRATION_TARGET ?auto_530 ?auto_529 ) ( ON_BOARD ?auto_527 ?auto_528 ) ( not ( = ?auto_530 ?auto_527 ) ) ( SUPPORTS ?auto_527 ?auto_531 ) ( CALIBRATION_TARGET ?auto_527 ?auto_529 ) ( POWER_AVAIL ?auto_528 ) ( POINTING ?auto_528 ?auto_533 ) ( not ( = ?auto_529 ?auto_533 ) ) ( not ( = ?auto_525 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_533 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_528 ?auto_529 ?auto_533 )
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
      ?auto_540 - INSTRUMENT
      ?auto_538 - SATELLITE
      ?auto_539 - DIRECTION
      ?auto_542 - INSTRUMENT
      ?auto_541 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_537 ?auto_534 ) ) ( ON_BOARD ?auto_540 ?auto_538 ) ( SUPPORTS ?auto_540 ?auto_536 ) ( not ( = ?auto_537 ?auto_539 ) ) ( not ( = ?auto_534 ?auto_539 ) ) ( not ( = ?auto_535 ?auto_536 ) ) ( CALIBRATION_TARGET ?auto_540 ?auto_539 ) ( ON_BOARD ?auto_542 ?auto_538 ) ( not ( = ?auto_540 ?auto_542 ) ) ( SUPPORTS ?auto_542 ?auto_535 ) ( CALIBRATION_TARGET ?auto_542 ?auto_539 ) ( POWER_AVAIL ?auto_538 ) ( POINTING ?auto_538 ?auto_541 ) ( not ( = ?auto_539 ?auto_541 ) ) ( not ( = ?auto_537 ?auto_541 ) ) ( not ( = ?auto_534 ?auto_541 ) ) )
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
      ?auto_548 - INSTRUMENT
      ?auto_547 - SATELLITE
      ?auto_551 - DIRECTION
      ?auto_550 - INSTRUMENT
      ?auto_549 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_546 ?auto_543 ) ) ( ON_BOARD ?auto_548 ?auto_547 ) ( SUPPORTS ?auto_548 ?auto_544 ) ( not ( = ?auto_543 ?auto_551 ) ) ( not ( = ?auto_546 ?auto_551 ) ) ( not ( = ?auto_545 ?auto_544 ) ) ( CALIBRATION_TARGET ?auto_548 ?auto_551 ) ( ON_BOARD ?auto_550 ?auto_547 ) ( not ( = ?auto_548 ?auto_550 ) ) ( SUPPORTS ?auto_550 ?auto_545 ) ( CALIBRATION_TARGET ?auto_550 ?auto_551 ) ( POWER_AVAIL ?auto_547 ) ( POINTING ?auto_547 ?auto_549 ) ( not ( = ?auto_551 ?auto_549 ) ) ( not ( = ?auto_543 ?auto_549 ) ) ( not ( = ?auto_546 ?auto_549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_546 ?auto_545 ?auto_543 ?auto_544 )
      ( GET-2IMAGE-VERIFY ?auto_543 ?auto_544 ?auto_546 ?auto_545 ) )
  )

)

