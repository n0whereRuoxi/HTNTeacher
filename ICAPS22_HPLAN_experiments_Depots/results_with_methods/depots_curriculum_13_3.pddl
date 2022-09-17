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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4242 - SURFACE
      ?auto_4243 - SURFACE
    )
    :vars
    (
      ?auto_4244 - HOIST
      ?auto_4245 - PLACE
      ?auto_4247 - PLACE
      ?auto_4248 - HOIST
      ?auto_4249 - SURFACE
      ?auto_4246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4244 ?auto_4245 ) ( SURFACE-AT ?auto_4243 ?auto_4245 ) ( CLEAR ?auto_4243 ) ( IS-CRATE ?auto_4242 ) ( AVAILABLE ?auto_4244 ) ( not ( = ?auto_4247 ?auto_4245 ) ) ( HOIST-AT ?auto_4248 ?auto_4247 ) ( AVAILABLE ?auto_4248 ) ( SURFACE-AT ?auto_4242 ?auto_4247 ) ( ON ?auto_4242 ?auto_4249 ) ( CLEAR ?auto_4242 ) ( TRUCK-AT ?auto_4246 ?auto_4245 ) ( not ( = ?auto_4242 ?auto_4243 ) ) ( not ( = ?auto_4242 ?auto_4249 ) ) ( not ( = ?auto_4243 ?auto_4249 ) ) ( not ( = ?auto_4244 ?auto_4248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4246 ?auto_4245 ?auto_4247 )
      ( !LIFT ?auto_4248 ?auto_4242 ?auto_4249 ?auto_4247 )
      ( !LOAD ?auto_4248 ?auto_4242 ?auto_4246 ?auto_4247 )
      ( !DRIVE ?auto_4246 ?auto_4247 ?auto_4245 )
      ( !UNLOAD ?auto_4244 ?auto_4242 ?auto_4246 ?auto_4245 )
      ( !DROP ?auto_4244 ?auto_4242 ?auto_4243 ?auto_4245 )
      ( MAKE-ON-VERIFY ?auto_4242 ?auto_4243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4252 - SURFACE
      ?auto_4253 - SURFACE
    )
    :vars
    (
      ?auto_4254 - HOIST
      ?auto_4255 - PLACE
      ?auto_4257 - PLACE
      ?auto_4258 - HOIST
      ?auto_4259 - SURFACE
      ?auto_4256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4254 ?auto_4255 ) ( SURFACE-AT ?auto_4253 ?auto_4255 ) ( CLEAR ?auto_4253 ) ( IS-CRATE ?auto_4252 ) ( AVAILABLE ?auto_4254 ) ( not ( = ?auto_4257 ?auto_4255 ) ) ( HOIST-AT ?auto_4258 ?auto_4257 ) ( AVAILABLE ?auto_4258 ) ( SURFACE-AT ?auto_4252 ?auto_4257 ) ( ON ?auto_4252 ?auto_4259 ) ( CLEAR ?auto_4252 ) ( TRUCK-AT ?auto_4256 ?auto_4255 ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4259 ) ) ( not ( = ?auto_4253 ?auto_4259 ) ) ( not ( = ?auto_4254 ?auto_4258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4256 ?auto_4255 ?auto_4257 )
      ( !LIFT ?auto_4258 ?auto_4252 ?auto_4259 ?auto_4257 )
      ( !LOAD ?auto_4258 ?auto_4252 ?auto_4256 ?auto_4257 )
      ( !DRIVE ?auto_4256 ?auto_4257 ?auto_4255 )
      ( !UNLOAD ?auto_4254 ?auto_4252 ?auto_4256 ?auto_4255 )
      ( !DROP ?auto_4254 ?auto_4252 ?auto_4253 ?auto_4255 )
      ( MAKE-ON-VERIFY ?auto_4252 ?auto_4253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4262 - SURFACE
      ?auto_4263 - SURFACE
    )
    :vars
    (
      ?auto_4264 - HOIST
      ?auto_4265 - PLACE
      ?auto_4267 - PLACE
      ?auto_4268 - HOIST
      ?auto_4269 - SURFACE
      ?auto_4266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4264 ?auto_4265 ) ( SURFACE-AT ?auto_4263 ?auto_4265 ) ( CLEAR ?auto_4263 ) ( IS-CRATE ?auto_4262 ) ( AVAILABLE ?auto_4264 ) ( not ( = ?auto_4267 ?auto_4265 ) ) ( HOIST-AT ?auto_4268 ?auto_4267 ) ( AVAILABLE ?auto_4268 ) ( SURFACE-AT ?auto_4262 ?auto_4267 ) ( ON ?auto_4262 ?auto_4269 ) ( CLEAR ?auto_4262 ) ( TRUCK-AT ?auto_4266 ?auto_4265 ) ( not ( = ?auto_4262 ?auto_4263 ) ) ( not ( = ?auto_4262 ?auto_4269 ) ) ( not ( = ?auto_4263 ?auto_4269 ) ) ( not ( = ?auto_4264 ?auto_4268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4266 ?auto_4265 ?auto_4267 )
      ( !LIFT ?auto_4268 ?auto_4262 ?auto_4269 ?auto_4267 )
      ( !LOAD ?auto_4268 ?auto_4262 ?auto_4266 ?auto_4267 )
      ( !DRIVE ?auto_4266 ?auto_4267 ?auto_4265 )
      ( !UNLOAD ?auto_4264 ?auto_4262 ?auto_4266 ?auto_4265 )
      ( !DROP ?auto_4264 ?auto_4262 ?auto_4263 ?auto_4265 )
      ( MAKE-ON-VERIFY ?auto_4262 ?auto_4263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4272 - SURFACE
      ?auto_4273 - SURFACE
    )
    :vars
    (
      ?auto_4274 - HOIST
      ?auto_4275 - PLACE
      ?auto_4277 - PLACE
      ?auto_4278 - HOIST
      ?auto_4279 - SURFACE
      ?auto_4276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4274 ?auto_4275 ) ( SURFACE-AT ?auto_4273 ?auto_4275 ) ( CLEAR ?auto_4273 ) ( IS-CRATE ?auto_4272 ) ( AVAILABLE ?auto_4274 ) ( not ( = ?auto_4277 ?auto_4275 ) ) ( HOIST-AT ?auto_4278 ?auto_4277 ) ( AVAILABLE ?auto_4278 ) ( SURFACE-AT ?auto_4272 ?auto_4277 ) ( ON ?auto_4272 ?auto_4279 ) ( CLEAR ?auto_4272 ) ( TRUCK-AT ?auto_4276 ?auto_4275 ) ( not ( = ?auto_4272 ?auto_4273 ) ) ( not ( = ?auto_4272 ?auto_4279 ) ) ( not ( = ?auto_4273 ?auto_4279 ) ) ( not ( = ?auto_4274 ?auto_4278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4276 ?auto_4275 ?auto_4277 )
      ( !LIFT ?auto_4278 ?auto_4272 ?auto_4279 ?auto_4277 )
      ( !LOAD ?auto_4278 ?auto_4272 ?auto_4276 ?auto_4277 )
      ( !DRIVE ?auto_4276 ?auto_4277 ?auto_4275 )
      ( !UNLOAD ?auto_4274 ?auto_4272 ?auto_4276 ?auto_4275 )
      ( !DROP ?auto_4274 ?auto_4272 ?auto_4273 ?auto_4275 )
      ( MAKE-ON-VERIFY ?auto_4272 ?auto_4273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4282 - SURFACE
      ?auto_4283 - SURFACE
    )
    :vars
    (
      ?auto_4284 - HOIST
      ?auto_4285 - PLACE
      ?auto_4287 - PLACE
      ?auto_4288 - HOIST
      ?auto_4289 - SURFACE
      ?auto_4286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4284 ?auto_4285 ) ( SURFACE-AT ?auto_4283 ?auto_4285 ) ( CLEAR ?auto_4283 ) ( IS-CRATE ?auto_4282 ) ( AVAILABLE ?auto_4284 ) ( not ( = ?auto_4287 ?auto_4285 ) ) ( HOIST-AT ?auto_4288 ?auto_4287 ) ( AVAILABLE ?auto_4288 ) ( SURFACE-AT ?auto_4282 ?auto_4287 ) ( ON ?auto_4282 ?auto_4289 ) ( CLEAR ?auto_4282 ) ( TRUCK-AT ?auto_4286 ?auto_4285 ) ( not ( = ?auto_4282 ?auto_4283 ) ) ( not ( = ?auto_4282 ?auto_4289 ) ) ( not ( = ?auto_4283 ?auto_4289 ) ) ( not ( = ?auto_4284 ?auto_4288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4286 ?auto_4285 ?auto_4287 )
      ( !LIFT ?auto_4288 ?auto_4282 ?auto_4289 ?auto_4287 )
      ( !LOAD ?auto_4288 ?auto_4282 ?auto_4286 ?auto_4287 )
      ( !DRIVE ?auto_4286 ?auto_4287 ?auto_4285 )
      ( !UNLOAD ?auto_4284 ?auto_4282 ?auto_4286 ?auto_4285 )
      ( !DROP ?auto_4284 ?auto_4282 ?auto_4283 ?auto_4285 )
      ( MAKE-ON-VERIFY ?auto_4282 ?auto_4283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4292 - SURFACE
      ?auto_4293 - SURFACE
    )
    :vars
    (
      ?auto_4294 - HOIST
      ?auto_4295 - PLACE
      ?auto_4297 - PLACE
      ?auto_4298 - HOIST
      ?auto_4299 - SURFACE
      ?auto_4296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4294 ?auto_4295 ) ( SURFACE-AT ?auto_4293 ?auto_4295 ) ( CLEAR ?auto_4293 ) ( IS-CRATE ?auto_4292 ) ( AVAILABLE ?auto_4294 ) ( not ( = ?auto_4297 ?auto_4295 ) ) ( HOIST-AT ?auto_4298 ?auto_4297 ) ( AVAILABLE ?auto_4298 ) ( SURFACE-AT ?auto_4292 ?auto_4297 ) ( ON ?auto_4292 ?auto_4299 ) ( CLEAR ?auto_4292 ) ( TRUCK-AT ?auto_4296 ?auto_4295 ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4299 ) ) ( not ( = ?auto_4293 ?auto_4299 ) ) ( not ( = ?auto_4294 ?auto_4298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4296 ?auto_4295 ?auto_4297 )
      ( !LIFT ?auto_4298 ?auto_4292 ?auto_4299 ?auto_4297 )
      ( !LOAD ?auto_4298 ?auto_4292 ?auto_4296 ?auto_4297 )
      ( !DRIVE ?auto_4296 ?auto_4297 ?auto_4295 )
      ( !UNLOAD ?auto_4294 ?auto_4292 ?auto_4296 ?auto_4295 )
      ( !DROP ?auto_4294 ?auto_4292 ?auto_4293 ?auto_4295 )
      ( MAKE-ON-VERIFY ?auto_4292 ?auto_4293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4302 - SURFACE
      ?auto_4303 - SURFACE
    )
    :vars
    (
      ?auto_4304 - HOIST
      ?auto_4305 - PLACE
      ?auto_4307 - PLACE
      ?auto_4308 - HOIST
      ?auto_4309 - SURFACE
      ?auto_4306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4304 ?auto_4305 ) ( SURFACE-AT ?auto_4303 ?auto_4305 ) ( CLEAR ?auto_4303 ) ( IS-CRATE ?auto_4302 ) ( AVAILABLE ?auto_4304 ) ( not ( = ?auto_4307 ?auto_4305 ) ) ( HOIST-AT ?auto_4308 ?auto_4307 ) ( AVAILABLE ?auto_4308 ) ( SURFACE-AT ?auto_4302 ?auto_4307 ) ( ON ?auto_4302 ?auto_4309 ) ( CLEAR ?auto_4302 ) ( TRUCK-AT ?auto_4306 ?auto_4305 ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4302 ?auto_4309 ) ) ( not ( = ?auto_4303 ?auto_4309 ) ) ( not ( = ?auto_4304 ?auto_4308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4306 ?auto_4305 ?auto_4307 )
      ( !LIFT ?auto_4308 ?auto_4302 ?auto_4309 ?auto_4307 )
      ( !LOAD ?auto_4308 ?auto_4302 ?auto_4306 ?auto_4307 )
      ( !DRIVE ?auto_4306 ?auto_4307 ?auto_4305 )
      ( !UNLOAD ?auto_4304 ?auto_4302 ?auto_4306 ?auto_4305 )
      ( !DROP ?auto_4304 ?auto_4302 ?auto_4303 ?auto_4305 )
      ( MAKE-ON-VERIFY ?auto_4302 ?auto_4303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4312 - SURFACE
      ?auto_4313 - SURFACE
    )
    :vars
    (
      ?auto_4314 - HOIST
      ?auto_4315 - PLACE
      ?auto_4317 - PLACE
      ?auto_4318 - HOIST
      ?auto_4319 - SURFACE
      ?auto_4316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4314 ?auto_4315 ) ( SURFACE-AT ?auto_4313 ?auto_4315 ) ( CLEAR ?auto_4313 ) ( IS-CRATE ?auto_4312 ) ( AVAILABLE ?auto_4314 ) ( not ( = ?auto_4317 ?auto_4315 ) ) ( HOIST-AT ?auto_4318 ?auto_4317 ) ( AVAILABLE ?auto_4318 ) ( SURFACE-AT ?auto_4312 ?auto_4317 ) ( ON ?auto_4312 ?auto_4319 ) ( CLEAR ?auto_4312 ) ( TRUCK-AT ?auto_4316 ?auto_4315 ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4319 ) ) ( not ( = ?auto_4313 ?auto_4319 ) ) ( not ( = ?auto_4314 ?auto_4318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4316 ?auto_4315 ?auto_4317 )
      ( !LIFT ?auto_4318 ?auto_4312 ?auto_4319 ?auto_4317 )
      ( !LOAD ?auto_4318 ?auto_4312 ?auto_4316 ?auto_4317 )
      ( !DRIVE ?auto_4316 ?auto_4317 ?auto_4315 )
      ( !UNLOAD ?auto_4314 ?auto_4312 ?auto_4316 ?auto_4315 )
      ( !DROP ?auto_4314 ?auto_4312 ?auto_4313 ?auto_4315 )
      ( MAKE-ON-VERIFY ?auto_4312 ?auto_4313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4322 - SURFACE
      ?auto_4323 - SURFACE
    )
    :vars
    (
      ?auto_4324 - HOIST
      ?auto_4325 - PLACE
      ?auto_4327 - PLACE
      ?auto_4328 - HOIST
      ?auto_4329 - SURFACE
      ?auto_4326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4324 ?auto_4325 ) ( SURFACE-AT ?auto_4323 ?auto_4325 ) ( CLEAR ?auto_4323 ) ( IS-CRATE ?auto_4322 ) ( AVAILABLE ?auto_4324 ) ( not ( = ?auto_4327 ?auto_4325 ) ) ( HOIST-AT ?auto_4328 ?auto_4327 ) ( AVAILABLE ?auto_4328 ) ( SURFACE-AT ?auto_4322 ?auto_4327 ) ( ON ?auto_4322 ?auto_4329 ) ( CLEAR ?auto_4322 ) ( TRUCK-AT ?auto_4326 ?auto_4325 ) ( not ( = ?auto_4322 ?auto_4323 ) ) ( not ( = ?auto_4322 ?auto_4329 ) ) ( not ( = ?auto_4323 ?auto_4329 ) ) ( not ( = ?auto_4324 ?auto_4328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4326 ?auto_4325 ?auto_4327 )
      ( !LIFT ?auto_4328 ?auto_4322 ?auto_4329 ?auto_4327 )
      ( !LOAD ?auto_4328 ?auto_4322 ?auto_4326 ?auto_4327 )
      ( !DRIVE ?auto_4326 ?auto_4327 ?auto_4325 )
      ( !UNLOAD ?auto_4324 ?auto_4322 ?auto_4326 ?auto_4325 )
      ( !DROP ?auto_4324 ?auto_4322 ?auto_4323 ?auto_4325 )
      ( MAKE-ON-VERIFY ?auto_4322 ?auto_4323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
    )
    :vars
    (
      ?auto_4334 - HOIST
      ?auto_4335 - PLACE
      ?auto_4337 - PLACE
      ?auto_4338 - HOIST
      ?auto_4339 - SURFACE
      ?auto_4336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4334 ?auto_4335 ) ( SURFACE-AT ?auto_4333 ?auto_4335 ) ( CLEAR ?auto_4333 ) ( IS-CRATE ?auto_4332 ) ( AVAILABLE ?auto_4334 ) ( not ( = ?auto_4337 ?auto_4335 ) ) ( HOIST-AT ?auto_4338 ?auto_4337 ) ( AVAILABLE ?auto_4338 ) ( SURFACE-AT ?auto_4332 ?auto_4337 ) ( ON ?auto_4332 ?auto_4339 ) ( CLEAR ?auto_4332 ) ( TRUCK-AT ?auto_4336 ?auto_4335 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4339 ) ) ( not ( = ?auto_4333 ?auto_4339 ) ) ( not ( = ?auto_4334 ?auto_4338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4336 ?auto_4335 ?auto_4337 )
      ( !LIFT ?auto_4338 ?auto_4332 ?auto_4339 ?auto_4337 )
      ( !LOAD ?auto_4338 ?auto_4332 ?auto_4336 ?auto_4337 )
      ( !DRIVE ?auto_4336 ?auto_4337 ?auto_4335 )
      ( !UNLOAD ?auto_4334 ?auto_4332 ?auto_4336 ?auto_4335 )
      ( !DROP ?auto_4334 ?auto_4332 ?auto_4333 ?auto_4335 )
      ( MAKE-ON-VERIFY ?auto_4332 ?auto_4333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4342 - SURFACE
      ?auto_4343 - SURFACE
    )
    :vars
    (
      ?auto_4344 - HOIST
      ?auto_4345 - PLACE
      ?auto_4347 - PLACE
      ?auto_4348 - HOIST
      ?auto_4349 - SURFACE
      ?auto_4346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4344 ?auto_4345 ) ( SURFACE-AT ?auto_4343 ?auto_4345 ) ( CLEAR ?auto_4343 ) ( IS-CRATE ?auto_4342 ) ( AVAILABLE ?auto_4344 ) ( not ( = ?auto_4347 ?auto_4345 ) ) ( HOIST-AT ?auto_4348 ?auto_4347 ) ( AVAILABLE ?auto_4348 ) ( SURFACE-AT ?auto_4342 ?auto_4347 ) ( ON ?auto_4342 ?auto_4349 ) ( CLEAR ?auto_4342 ) ( TRUCK-AT ?auto_4346 ?auto_4345 ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( not ( = ?auto_4342 ?auto_4349 ) ) ( not ( = ?auto_4343 ?auto_4349 ) ) ( not ( = ?auto_4344 ?auto_4348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4346 ?auto_4345 ?auto_4347 )
      ( !LIFT ?auto_4348 ?auto_4342 ?auto_4349 ?auto_4347 )
      ( !LOAD ?auto_4348 ?auto_4342 ?auto_4346 ?auto_4347 )
      ( !DRIVE ?auto_4346 ?auto_4347 ?auto_4345 )
      ( !UNLOAD ?auto_4344 ?auto_4342 ?auto_4346 ?auto_4345 )
      ( !DROP ?auto_4344 ?auto_4342 ?auto_4343 ?auto_4345 )
      ( MAKE-ON-VERIFY ?auto_4342 ?auto_4343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4352 - SURFACE
      ?auto_4353 - SURFACE
    )
    :vars
    (
      ?auto_4354 - HOIST
      ?auto_4355 - PLACE
      ?auto_4357 - PLACE
      ?auto_4358 - HOIST
      ?auto_4359 - SURFACE
      ?auto_4356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4354 ?auto_4355 ) ( SURFACE-AT ?auto_4353 ?auto_4355 ) ( CLEAR ?auto_4353 ) ( IS-CRATE ?auto_4352 ) ( AVAILABLE ?auto_4354 ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( HOIST-AT ?auto_4358 ?auto_4357 ) ( AVAILABLE ?auto_4358 ) ( SURFACE-AT ?auto_4352 ?auto_4357 ) ( ON ?auto_4352 ?auto_4359 ) ( CLEAR ?auto_4352 ) ( TRUCK-AT ?auto_4356 ?auto_4355 ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4359 ) ) ( not ( = ?auto_4353 ?auto_4359 ) ) ( not ( = ?auto_4354 ?auto_4358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4356 ?auto_4355 ?auto_4357 )
      ( !LIFT ?auto_4358 ?auto_4352 ?auto_4359 ?auto_4357 )
      ( !LOAD ?auto_4358 ?auto_4352 ?auto_4356 ?auto_4357 )
      ( !DRIVE ?auto_4356 ?auto_4357 ?auto_4355 )
      ( !UNLOAD ?auto_4354 ?auto_4352 ?auto_4356 ?auto_4355 )
      ( !DROP ?auto_4354 ?auto_4352 ?auto_4353 ?auto_4355 )
      ( MAKE-ON-VERIFY ?auto_4352 ?auto_4353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4362 - SURFACE
      ?auto_4363 - SURFACE
    )
    :vars
    (
      ?auto_4364 - HOIST
      ?auto_4365 - PLACE
      ?auto_4367 - PLACE
      ?auto_4368 - HOIST
      ?auto_4369 - SURFACE
      ?auto_4366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4364 ?auto_4365 ) ( SURFACE-AT ?auto_4363 ?auto_4365 ) ( CLEAR ?auto_4363 ) ( IS-CRATE ?auto_4362 ) ( AVAILABLE ?auto_4364 ) ( not ( = ?auto_4367 ?auto_4365 ) ) ( HOIST-AT ?auto_4368 ?auto_4367 ) ( AVAILABLE ?auto_4368 ) ( SURFACE-AT ?auto_4362 ?auto_4367 ) ( ON ?auto_4362 ?auto_4369 ) ( CLEAR ?auto_4362 ) ( TRUCK-AT ?auto_4366 ?auto_4365 ) ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4369 ) ) ( not ( = ?auto_4363 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4366 ?auto_4365 ?auto_4367 )
      ( !LIFT ?auto_4368 ?auto_4362 ?auto_4369 ?auto_4367 )
      ( !LOAD ?auto_4368 ?auto_4362 ?auto_4366 ?auto_4367 )
      ( !DRIVE ?auto_4366 ?auto_4367 ?auto_4365 )
      ( !UNLOAD ?auto_4364 ?auto_4362 ?auto_4366 ?auto_4365 )
      ( !DROP ?auto_4364 ?auto_4362 ?auto_4363 ?auto_4365 )
      ( MAKE-ON-VERIFY ?auto_4362 ?auto_4363 ) )
  )

)

