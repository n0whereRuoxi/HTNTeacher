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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4176 - OBJ
      ?auto_4177 - LOCATION
    )
    :vars
    (
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4178 ?auto_4177 ) ( IN-TRUCK ?auto_4176 ?auto_4178 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4176 ?auto_4178 ?auto_4177 )
      ( DELIVER-1PKG-VERIFY ?auto_4176 ?auto_4177 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4181 - OBJ
      ?auto_4182 - LOCATION
    )
    :vars
    (
      ?auto_4183 - TRUCK
      ?auto_4184 - LOCATION
      ?auto_4185 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4181 ?auto_4183 ) ( TRUCK-AT ?auto_4183 ?auto_4184 ) ( IN-CITY ?auto_4184 ?auto_4185 ) ( IN-CITY ?auto_4182 ?auto_4185 ) ( not ( = ?auto_4182 ?auto_4184 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4183 ?auto_4184 ?auto_4182 ?auto_4185 )
      ( DELIVER-1PKG ?auto_4181 ?auto_4182 )
      ( DELIVER-1PKG-VERIFY ?auto_4181 ?auto_4182 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4188 - OBJ
      ?auto_4189 - LOCATION
    )
    :vars
    (
      ?auto_4191 - TRUCK
      ?auto_4192 - LOCATION
      ?auto_4190 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4191 ?auto_4192 ) ( IN-CITY ?auto_4192 ?auto_4190 ) ( IN-CITY ?auto_4189 ?auto_4190 ) ( not ( = ?auto_4189 ?auto_4192 ) ) ( OBJ-AT ?auto_4188 ?auto_4192 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4188 ?auto_4191 ?auto_4192 )
      ( DELIVER-1PKG ?auto_4188 ?auto_4189 )
      ( DELIVER-1PKG-VERIFY ?auto_4188 ?auto_4189 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4195 - OBJ
      ?auto_4196 - LOCATION
    )
    :vars
    (
      ?auto_4198 - LOCATION
      ?auto_4197 - CITY
      ?auto_4199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4198 ?auto_4197 ) ( IN-CITY ?auto_4196 ?auto_4197 ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( OBJ-AT ?auto_4195 ?auto_4198 ) ( TRUCK-AT ?auto_4199 ?auto_4196 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4199 ?auto_4196 ?auto_4198 ?auto_4197 )
      ( DELIVER-1PKG ?auto_4195 ?auto_4196 )
      ( DELIVER-1PKG-VERIFY ?auto_4195 ?auto_4196 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4229 - OBJ
      ?auto_4231 - OBJ
      ?auto_4230 - LOCATION
    )
    :vars
    (
      ?auto_4232 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4231 ?auto_4229 ) ( TRUCK-AT ?auto_4232 ?auto_4230 ) ( IN-TRUCK ?auto_4231 ?auto_4232 ) ( OBJ-AT ?auto_4229 ?auto_4230 ) ( not ( = ?auto_4229 ?auto_4231 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4231 ?auto_4230 )
      ( DELIVER-2PKG-VERIFY ?auto_4229 ?auto_4231 ?auto_4230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4236 - OBJ
      ?auto_4238 - OBJ
      ?auto_4237 - LOCATION
    )
    :vars
    (
      ?auto_4240 - TRUCK
      ?auto_4239 - LOCATION
      ?auto_4241 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4238 ?auto_4236 ) ( IN-TRUCK ?auto_4238 ?auto_4240 ) ( TRUCK-AT ?auto_4240 ?auto_4239 ) ( IN-CITY ?auto_4239 ?auto_4241 ) ( IN-CITY ?auto_4237 ?auto_4241 ) ( not ( = ?auto_4237 ?auto_4239 ) ) ( OBJ-AT ?auto_4236 ?auto_4237 ) ( not ( = ?auto_4236 ?auto_4238 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4238 ?auto_4237 )
      ( DELIVER-2PKG-VERIFY ?auto_4236 ?auto_4238 ?auto_4237 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4245 - OBJ
      ?auto_4247 - OBJ
      ?auto_4246 - LOCATION
    )
    :vars
    (
      ?auto_4249 - TRUCK
      ?auto_4250 - LOCATION
      ?auto_4248 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4247 ?auto_4245 ) ( TRUCK-AT ?auto_4249 ?auto_4250 ) ( IN-CITY ?auto_4250 ?auto_4248 ) ( IN-CITY ?auto_4246 ?auto_4248 ) ( not ( = ?auto_4246 ?auto_4250 ) ) ( OBJ-AT ?auto_4247 ?auto_4250 ) ( OBJ-AT ?auto_4245 ?auto_4246 ) ( not ( = ?auto_4245 ?auto_4247 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4247 ?auto_4246 )
      ( DELIVER-2PKG-VERIFY ?auto_4245 ?auto_4247 ?auto_4246 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4254 - OBJ
      ?auto_4256 - OBJ
      ?auto_4255 - LOCATION
    )
    :vars
    (
      ?auto_4258 - LOCATION
      ?auto_4257 - CITY
      ?auto_4259 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4256 ?auto_4254 ) ( IN-CITY ?auto_4258 ?auto_4257 ) ( IN-CITY ?auto_4255 ?auto_4257 ) ( not ( = ?auto_4255 ?auto_4258 ) ) ( OBJ-AT ?auto_4256 ?auto_4258 ) ( TRUCK-AT ?auto_4259 ?auto_4255 ) ( OBJ-AT ?auto_4254 ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4256 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4256 ?auto_4255 )
      ( DELIVER-2PKG-VERIFY ?auto_4254 ?auto_4256 ?auto_4255 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4263 - OBJ
      ?auto_4265 - OBJ
      ?auto_4264 - LOCATION
    )
    :vars
    (
      ?auto_4267 - LOCATION
      ?auto_4266 - CITY
      ?auto_4268 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4265 ?auto_4263 ) ( IN-CITY ?auto_4267 ?auto_4266 ) ( IN-CITY ?auto_4264 ?auto_4266 ) ( not ( = ?auto_4264 ?auto_4267 ) ) ( OBJ-AT ?auto_4265 ?auto_4267 ) ( TRUCK-AT ?auto_4268 ?auto_4264 ) ( not ( = ?auto_4263 ?auto_4265 ) ) ( IN-TRUCK ?auto_4263 ?auto_4268 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4263 ?auto_4264 )
      ( DELIVER-2PKG ?auto_4263 ?auto_4265 ?auto_4264 )
      ( DELIVER-2PKG-VERIFY ?auto_4263 ?auto_4265 ?auto_4264 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4272 - OBJ
      ?auto_4274 - OBJ
      ?auto_4273 - LOCATION
    )
    :vars
    (
      ?auto_4277 - LOCATION
      ?auto_4276 - CITY
      ?auto_4275 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4274 ?auto_4272 ) ( IN-CITY ?auto_4277 ?auto_4276 ) ( IN-CITY ?auto_4273 ?auto_4276 ) ( not ( = ?auto_4273 ?auto_4277 ) ) ( OBJ-AT ?auto_4274 ?auto_4277 ) ( not ( = ?auto_4272 ?auto_4274 ) ) ( IN-TRUCK ?auto_4272 ?auto_4275 ) ( TRUCK-AT ?auto_4275 ?auto_4277 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4275 ?auto_4277 ?auto_4273 ?auto_4276 )
      ( DELIVER-2PKG ?auto_4272 ?auto_4274 ?auto_4273 )
      ( DELIVER-2PKG-VERIFY ?auto_4272 ?auto_4274 ?auto_4273 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4281 - OBJ
      ?auto_4283 - OBJ
      ?auto_4282 - LOCATION
    )
    :vars
    (
      ?auto_4285 - LOCATION
      ?auto_4284 - CITY
      ?auto_4286 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4283 ?auto_4281 ) ( IN-CITY ?auto_4285 ?auto_4284 ) ( IN-CITY ?auto_4282 ?auto_4284 ) ( not ( = ?auto_4282 ?auto_4285 ) ) ( OBJ-AT ?auto_4283 ?auto_4285 ) ( not ( = ?auto_4281 ?auto_4283 ) ) ( TRUCK-AT ?auto_4286 ?auto_4285 ) ( OBJ-AT ?auto_4281 ?auto_4285 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4281 ?auto_4286 ?auto_4285 )
      ( DELIVER-2PKG ?auto_4281 ?auto_4283 ?auto_4282 )
      ( DELIVER-2PKG-VERIFY ?auto_4281 ?auto_4283 ?auto_4282 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4290 - OBJ
      ?auto_4292 - OBJ
      ?auto_4291 - LOCATION
    )
    :vars
    (
      ?auto_4294 - LOCATION
      ?auto_4293 - CITY
      ?auto_4295 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4292 ?auto_4290 ) ( IN-CITY ?auto_4294 ?auto_4293 ) ( IN-CITY ?auto_4291 ?auto_4293 ) ( not ( = ?auto_4291 ?auto_4294 ) ) ( OBJ-AT ?auto_4292 ?auto_4294 ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( OBJ-AT ?auto_4290 ?auto_4294 ) ( TRUCK-AT ?auto_4295 ?auto_4291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4295 ?auto_4291 ?auto_4294 ?auto_4293 )
      ( DELIVER-2PKG ?auto_4290 ?auto_4292 ?auto_4291 )
      ( DELIVER-2PKG-VERIFY ?auto_4290 ?auto_4292 ?auto_4291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4326 - OBJ
      ?auto_4328 - OBJ
      ?auto_4329 - OBJ
      ?auto_4327 - LOCATION
    )
    :vars
    (
      ?auto_4330 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4328 ?auto_4326 ) ( GREATER-THAN ?auto_4329 ?auto_4326 ) ( GREATER-THAN ?auto_4329 ?auto_4328 ) ( TRUCK-AT ?auto_4330 ?auto_4327 ) ( IN-TRUCK ?auto_4329 ?auto_4330 ) ( OBJ-AT ?auto_4326 ?auto_4327 ) ( OBJ-AT ?auto_4328 ?auto_4327 ) ( not ( = ?auto_4326 ?auto_4328 ) ) ( not ( = ?auto_4326 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4329 ?auto_4327 )
      ( DELIVER-3PKG-VERIFY ?auto_4326 ?auto_4328 ?auto_4329 ?auto_4327 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4335 - OBJ
      ?auto_4337 - OBJ
      ?auto_4338 - OBJ
      ?auto_4336 - LOCATION
    )
    :vars
    (
      ?auto_4340 - TRUCK
      ?auto_4339 - LOCATION
      ?auto_4341 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4337 ?auto_4335 ) ( GREATER-THAN ?auto_4338 ?auto_4335 ) ( GREATER-THAN ?auto_4338 ?auto_4337 ) ( IN-TRUCK ?auto_4338 ?auto_4340 ) ( TRUCK-AT ?auto_4340 ?auto_4339 ) ( IN-CITY ?auto_4339 ?auto_4341 ) ( IN-CITY ?auto_4336 ?auto_4341 ) ( not ( = ?auto_4336 ?auto_4339 ) ) ( OBJ-AT ?auto_4335 ?auto_4336 ) ( OBJ-AT ?auto_4337 ?auto_4336 ) ( not ( = ?auto_4335 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4338 ) ) ( not ( = ?auto_4337 ?auto_4338 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4338 ?auto_4336 )
      ( DELIVER-3PKG-VERIFY ?auto_4335 ?auto_4337 ?auto_4338 ?auto_4336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4346 - OBJ
      ?auto_4348 - OBJ
      ?auto_4349 - OBJ
      ?auto_4347 - LOCATION
    )
    :vars
    (
      ?auto_4352 - TRUCK
      ?auto_4351 - LOCATION
      ?auto_4350 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4348 ?auto_4346 ) ( GREATER-THAN ?auto_4349 ?auto_4346 ) ( GREATER-THAN ?auto_4349 ?auto_4348 ) ( TRUCK-AT ?auto_4352 ?auto_4351 ) ( IN-CITY ?auto_4351 ?auto_4350 ) ( IN-CITY ?auto_4347 ?auto_4350 ) ( not ( = ?auto_4347 ?auto_4351 ) ) ( OBJ-AT ?auto_4349 ?auto_4351 ) ( OBJ-AT ?auto_4346 ?auto_4347 ) ( OBJ-AT ?auto_4348 ?auto_4347 ) ( not ( = ?auto_4346 ?auto_4348 ) ) ( not ( = ?auto_4346 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4349 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4349 ?auto_4347 )
      ( DELIVER-3PKG-VERIFY ?auto_4346 ?auto_4348 ?auto_4349 ?auto_4347 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4357 - OBJ
      ?auto_4359 - OBJ
      ?auto_4360 - OBJ
      ?auto_4358 - LOCATION
    )
    :vars
    (
      ?auto_4363 - LOCATION
      ?auto_4361 - CITY
      ?auto_4362 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4359 ?auto_4357 ) ( GREATER-THAN ?auto_4360 ?auto_4357 ) ( GREATER-THAN ?auto_4360 ?auto_4359 ) ( IN-CITY ?auto_4363 ?auto_4361 ) ( IN-CITY ?auto_4358 ?auto_4361 ) ( not ( = ?auto_4358 ?auto_4363 ) ) ( OBJ-AT ?auto_4360 ?auto_4363 ) ( TRUCK-AT ?auto_4362 ?auto_4358 ) ( OBJ-AT ?auto_4357 ?auto_4358 ) ( OBJ-AT ?auto_4359 ?auto_4358 ) ( not ( = ?auto_4357 ?auto_4359 ) ) ( not ( = ?auto_4357 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4360 ?auto_4358 )
      ( DELIVER-3PKG-VERIFY ?auto_4357 ?auto_4359 ?auto_4360 ?auto_4358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4368 - OBJ
      ?auto_4370 - OBJ
      ?auto_4371 - OBJ
      ?auto_4369 - LOCATION
    )
    :vars
    (
      ?auto_4372 - LOCATION
      ?auto_4374 - CITY
      ?auto_4373 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4370 ?auto_4368 ) ( GREATER-THAN ?auto_4371 ?auto_4368 ) ( GREATER-THAN ?auto_4371 ?auto_4370 ) ( IN-CITY ?auto_4372 ?auto_4374 ) ( IN-CITY ?auto_4369 ?auto_4374 ) ( not ( = ?auto_4369 ?auto_4372 ) ) ( OBJ-AT ?auto_4371 ?auto_4372 ) ( TRUCK-AT ?auto_4373 ?auto_4369 ) ( OBJ-AT ?auto_4368 ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4370 ) ) ( not ( = ?auto_4368 ?auto_4371 ) ) ( not ( = ?auto_4370 ?auto_4371 ) ) ( IN-TRUCK ?auto_4370 ?auto_4373 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4370 ?auto_4369 )
      ( DELIVER-3PKG ?auto_4368 ?auto_4370 ?auto_4371 ?auto_4369 )
      ( DELIVER-3PKG-VERIFY ?auto_4368 ?auto_4370 ?auto_4371 ?auto_4369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4379 - OBJ
      ?auto_4381 - OBJ
      ?auto_4382 - OBJ
      ?auto_4380 - LOCATION
    )
    :vars
    (
      ?auto_4384 - LOCATION
      ?auto_4385 - CITY
      ?auto_4383 - TRUCK
      ?auto_4386 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4381 ?auto_4379 ) ( GREATER-THAN ?auto_4382 ?auto_4379 ) ( GREATER-THAN ?auto_4382 ?auto_4381 ) ( IN-CITY ?auto_4384 ?auto_4385 ) ( IN-CITY ?auto_4380 ?auto_4385 ) ( not ( = ?auto_4380 ?auto_4384 ) ) ( OBJ-AT ?auto_4382 ?auto_4384 ) ( OBJ-AT ?auto_4379 ?auto_4380 ) ( not ( = ?auto_4379 ?auto_4381 ) ) ( not ( = ?auto_4379 ?auto_4382 ) ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( IN-TRUCK ?auto_4381 ?auto_4383 ) ( TRUCK-AT ?auto_4383 ?auto_4386 ) ( IN-CITY ?auto_4386 ?auto_4385 ) ( not ( = ?auto_4380 ?auto_4386 ) ) ( not ( = ?auto_4384 ?auto_4386 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4383 ?auto_4386 ?auto_4380 ?auto_4385 )
      ( DELIVER-3PKG ?auto_4379 ?auto_4381 ?auto_4382 ?auto_4380 )
      ( DELIVER-3PKG-VERIFY ?auto_4379 ?auto_4381 ?auto_4382 ?auto_4380 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4391 - OBJ
      ?auto_4393 - OBJ
      ?auto_4394 - OBJ
      ?auto_4392 - LOCATION
    )
    :vars
    (
      ?auto_4397 - LOCATION
      ?auto_4395 - CITY
      ?auto_4396 - TRUCK
      ?auto_4398 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4393 ?auto_4391 ) ( GREATER-THAN ?auto_4394 ?auto_4391 ) ( GREATER-THAN ?auto_4394 ?auto_4393 ) ( IN-CITY ?auto_4397 ?auto_4395 ) ( IN-CITY ?auto_4392 ?auto_4395 ) ( not ( = ?auto_4392 ?auto_4397 ) ) ( OBJ-AT ?auto_4394 ?auto_4397 ) ( OBJ-AT ?auto_4391 ?auto_4392 ) ( not ( = ?auto_4391 ?auto_4393 ) ) ( not ( = ?auto_4391 ?auto_4394 ) ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( TRUCK-AT ?auto_4396 ?auto_4398 ) ( IN-CITY ?auto_4398 ?auto_4395 ) ( not ( = ?auto_4392 ?auto_4398 ) ) ( not ( = ?auto_4397 ?auto_4398 ) ) ( OBJ-AT ?auto_4393 ?auto_4398 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4393 ?auto_4396 ?auto_4398 )
      ( DELIVER-3PKG ?auto_4391 ?auto_4393 ?auto_4394 ?auto_4392 )
      ( DELIVER-3PKG-VERIFY ?auto_4391 ?auto_4393 ?auto_4394 ?auto_4392 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4403 - OBJ
      ?auto_4405 - OBJ
      ?auto_4406 - OBJ
      ?auto_4404 - LOCATION
    )
    :vars
    (
      ?auto_4409 - LOCATION
      ?auto_4408 - CITY
      ?auto_4410 - LOCATION
      ?auto_4407 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4405 ?auto_4403 ) ( GREATER-THAN ?auto_4406 ?auto_4403 ) ( GREATER-THAN ?auto_4406 ?auto_4405 ) ( IN-CITY ?auto_4409 ?auto_4408 ) ( IN-CITY ?auto_4404 ?auto_4408 ) ( not ( = ?auto_4404 ?auto_4409 ) ) ( OBJ-AT ?auto_4406 ?auto_4409 ) ( OBJ-AT ?auto_4403 ?auto_4404 ) ( not ( = ?auto_4403 ?auto_4405 ) ) ( not ( = ?auto_4403 ?auto_4406 ) ) ( not ( = ?auto_4405 ?auto_4406 ) ) ( IN-CITY ?auto_4410 ?auto_4408 ) ( not ( = ?auto_4404 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( OBJ-AT ?auto_4405 ?auto_4410 ) ( TRUCK-AT ?auto_4407 ?auto_4404 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4407 ?auto_4404 ?auto_4410 ?auto_4408 )
      ( DELIVER-3PKG ?auto_4403 ?auto_4405 ?auto_4406 ?auto_4404 )
      ( DELIVER-3PKG-VERIFY ?auto_4403 ?auto_4405 ?auto_4406 ?auto_4404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4415 - OBJ
      ?auto_4417 - OBJ
      ?auto_4418 - OBJ
      ?auto_4416 - LOCATION
    )
    :vars
    (
      ?auto_4421 - LOCATION
      ?auto_4422 - CITY
      ?auto_4420 - LOCATION
      ?auto_4419 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4417 ?auto_4415 ) ( GREATER-THAN ?auto_4418 ?auto_4415 ) ( GREATER-THAN ?auto_4418 ?auto_4417 ) ( IN-CITY ?auto_4421 ?auto_4422 ) ( IN-CITY ?auto_4416 ?auto_4422 ) ( not ( = ?auto_4416 ?auto_4421 ) ) ( OBJ-AT ?auto_4418 ?auto_4421 ) ( not ( = ?auto_4415 ?auto_4417 ) ) ( not ( = ?auto_4415 ?auto_4418 ) ) ( not ( = ?auto_4417 ?auto_4418 ) ) ( IN-CITY ?auto_4420 ?auto_4422 ) ( not ( = ?auto_4416 ?auto_4420 ) ) ( not ( = ?auto_4421 ?auto_4420 ) ) ( OBJ-AT ?auto_4417 ?auto_4420 ) ( TRUCK-AT ?auto_4419 ?auto_4416 ) ( IN-TRUCK ?auto_4415 ?auto_4419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4415 ?auto_4416 )
      ( DELIVER-3PKG ?auto_4415 ?auto_4417 ?auto_4418 ?auto_4416 )
      ( DELIVER-3PKG-VERIFY ?auto_4415 ?auto_4417 ?auto_4418 ?auto_4416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4427 - OBJ
      ?auto_4429 - OBJ
      ?auto_4430 - OBJ
      ?auto_4428 - LOCATION
    )
    :vars
    (
      ?auto_4433 - LOCATION
      ?auto_4431 - CITY
      ?auto_4434 - LOCATION
      ?auto_4432 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4429 ?auto_4427 ) ( GREATER-THAN ?auto_4430 ?auto_4427 ) ( GREATER-THAN ?auto_4430 ?auto_4429 ) ( IN-CITY ?auto_4433 ?auto_4431 ) ( IN-CITY ?auto_4428 ?auto_4431 ) ( not ( = ?auto_4428 ?auto_4433 ) ) ( OBJ-AT ?auto_4430 ?auto_4433 ) ( not ( = ?auto_4427 ?auto_4429 ) ) ( not ( = ?auto_4427 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( IN-CITY ?auto_4434 ?auto_4431 ) ( not ( = ?auto_4428 ?auto_4434 ) ) ( not ( = ?auto_4433 ?auto_4434 ) ) ( OBJ-AT ?auto_4429 ?auto_4434 ) ( IN-TRUCK ?auto_4427 ?auto_4432 ) ( TRUCK-AT ?auto_4432 ?auto_4434 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4432 ?auto_4434 ?auto_4428 ?auto_4431 )
      ( DELIVER-3PKG ?auto_4427 ?auto_4429 ?auto_4430 ?auto_4428 )
      ( DELIVER-3PKG-VERIFY ?auto_4427 ?auto_4429 ?auto_4430 ?auto_4428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4439 - OBJ
      ?auto_4441 - OBJ
      ?auto_4442 - OBJ
      ?auto_4440 - LOCATION
    )
    :vars
    (
      ?auto_4443 - LOCATION
      ?auto_4444 - CITY
      ?auto_4446 - LOCATION
      ?auto_4445 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4441 ?auto_4439 ) ( GREATER-THAN ?auto_4442 ?auto_4439 ) ( GREATER-THAN ?auto_4442 ?auto_4441 ) ( IN-CITY ?auto_4443 ?auto_4444 ) ( IN-CITY ?auto_4440 ?auto_4444 ) ( not ( = ?auto_4440 ?auto_4443 ) ) ( OBJ-AT ?auto_4442 ?auto_4443 ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4442 ) ) ( IN-CITY ?auto_4446 ?auto_4444 ) ( not ( = ?auto_4440 ?auto_4446 ) ) ( not ( = ?auto_4443 ?auto_4446 ) ) ( OBJ-AT ?auto_4441 ?auto_4446 ) ( TRUCK-AT ?auto_4445 ?auto_4446 ) ( OBJ-AT ?auto_4439 ?auto_4446 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4439 ?auto_4445 ?auto_4446 )
      ( DELIVER-3PKG ?auto_4439 ?auto_4441 ?auto_4442 ?auto_4440 )
      ( DELIVER-3PKG-VERIFY ?auto_4439 ?auto_4441 ?auto_4442 ?auto_4440 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4451 - OBJ
      ?auto_4453 - OBJ
      ?auto_4454 - OBJ
      ?auto_4452 - LOCATION
    )
    :vars
    (
      ?auto_4456 - LOCATION
      ?auto_4458 - CITY
      ?auto_4457 - LOCATION
      ?auto_4455 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4453 ?auto_4451 ) ( GREATER-THAN ?auto_4454 ?auto_4451 ) ( GREATER-THAN ?auto_4454 ?auto_4453 ) ( IN-CITY ?auto_4456 ?auto_4458 ) ( IN-CITY ?auto_4452 ?auto_4458 ) ( not ( = ?auto_4452 ?auto_4456 ) ) ( OBJ-AT ?auto_4454 ?auto_4456 ) ( not ( = ?auto_4451 ?auto_4453 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) ( not ( = ?auto_4453 ?auto_4454 ) ) ( IN-CITY ?auto_4457 ?auto_4458 ) ( not ( = ?auto_4452 ?auto_4457 ) ) ( not ( = ?auto_4456 ?auto_4457 ) ) ( OBJ-AT ?auto_4453 ?auto_4457 ) ( OBJ-AT ?auto_4451 ?auto_4457 ) ( TRUCK-AT ?auto_4455 ?auto_4452 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4455 ?auto_4452 ?auto_4457 ?auto_4458 )
      ( DELIVER-3PKG ?auto_4451 ?auto_4453 ?auto_4454 ?auto_4452 )
      ( DELIVER-3PKG-VERIFY ?auto_4451 ?auto_4453 ?auto_4454 ?auto_4452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4490 - OBJ
      ?auto_4492 - OBJ
      ?auto_4493 - OBJ
      ?auto_4494 - OBJ
      ?auto_4491 - LOCATION
    )
    :vars
    (
      ?auto_4495 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4492 ?auto_4490 ) ( GREATER-THAN ?auto_4493 ?auto_4490 ) ( GREATER-THAN ?auto_4493 ?auto_4492 ) ( GREATER-THAN ?auto_4494 ?auto_4490 ) ( GREATER-THAN ?auto_4494 ?auto_4492 ) ( GREATER-THAN ?auto_4494 ?auto_4493 ) ( TRUCK-AT ?auto_4495 ?auto_4491 ) ( IN-TRUCK ?auto_4494 ?auto_4495 ) ( OBJ-AT ?auto_4490 ?auto_4491 ) ( OBJ-AT ?auto_4492 ?auto_4491 ) ( OBJ-AT ?auto_4493 ?auto_4491 ) ( not ( = ?auto_4490 ?auto_4492 ) ) ( not ( = ?auto_4490 ?auto_4493 ) ) ( not ( = ?auto_4490 ?auto_4494 ) ) ( not ( = ?auto_4492 ?auto_4493 ) ) ( not ( = ?auto_4492 ?auto_4494 ) ) ( not ( = ?auto_4493 ?auto_4494 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4494 ?auto_4491 )
      ( DELIVER-4PKG-VERIFY ?auto_4490 ?auto_4492 ?auto_4493 ?auto_4494 ?auto_4491 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4501 - OBJ
      ?auto_4503 - OBJ
      ?auto_4504 - OBJ
      ?auto_4505 - OBJ
      ?auto_4502 - LOCATION
    )
    :vars
    (
      ?auto_4508 - TRUCK
      ?auto_4507 - LOCATION
      ?auto_4506 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4503 ?auto_4501 ) ( GREATER-THAN ?auto_4504 ?auto_4501 ) ( GREATER-THAN ?auto_4504 ?auto_4503 ) ( GREATER-THAN ?auto_4505 ?auto_4501 ) ( GREATER-THAN ?auto_4505 ?auto_4503 ) ( GREATER-THAN ?auto_4505 ?auto_4504 ) ( IN-TRUCK ?auto_4505 ?auto_4508 ) ( TRUCK-AT ?auto_4508 ?auto_4507 ) ( IN-CITY ?auto_4507 ?auto_4506 ) ( IN-CITY ?auto_4502 ?auto_4506 ) ( not ( = ?auto_4502 ?auto_4507 ) ) ( OBJ-AT ?auto_4501 ?auto_4502 ) ( OBJ-AT ?auto_4503 ?auto_4502 ) ( OBJ-AT ?auto_4504 ?auto_4502 ) ( not ( = ?auto_4501 ?auto_4503 ) ) ( not ( = ?auto_4501 ?auto_4504 ) ) ( not ( = ?auto_4501 ?auto_4505 ) ) ( not ( = ?auto_4503 ?auto_4504 ) ) ( not ( = ?auto_4503 ?auto_4505 ) ) ( not ( = ?auto_4504 ?auto_4505 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4505 ?auto_4502 )
      ( DELIVER-4PKG-VERIFY ?auto_4501 ?auto_4503 ?auto_4504 ?auto_4505 ?auto_4502 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4514 - OBJ
      ?auto_4516 - OBJ
      ?auto_4517 - OBJ
      ?auto_4518 - OBJ
      ?auto_4515 - LOCATION
    )
    :vars
    (
      ?auto_4521 - TRUCK
      ?auto_4519 - LOCATION
      ?auto_4520 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4516 ?auto_4514 ) ( GREATER-THAN ?auto_4517 ?auto_4514 ) ( GREATER-THAN ?auto_4517 ?auto_4516 ) ( GREATER-THAN ?auto_4518 ?auto_4514 ) ( GREATER-THAN ?auto_4518 ?auto_4516 ) ( GREATER-THAN ?auto_4518 ?auto_4517 ) ( TRUCK-AT ?auto_4521 ?auto_4519 ) ( IN-CITY ?auto_4519 ?auto_4520 ) ( IN-CITY ?auto_4515 ?auto_4520 ) ( not ( = ?auto_4515 ?auto_4519 ) ) ( OBJ-AT ?auto_4518 ?auto_4519 ) ( OBJ-AT ?auto_4514 ?auto_4515 ) ( OBJ-AT ?auto_4516 ?auto_4515 ) ( OBJ-AT ?auto_4517 ?auto_4515 ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4518 ) ) ( not ( = ?auto_4516 ?auto_4517 ) ) ( not ( = ?auto_4516 ?auto_4518 ) ) ( not ( = ?auto_4517 ?auto_4518 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4518 ?auto_4515 )
      ( DELIVER-4PKG-VERIFY ?auto_4514 ?auto_4516 ?auto_4517 ?auto_4518 ?auto_4515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4527 - OBJ
      ?auto_4529 - OBJ
      ?auto_4530 - OBJ
      ?auto_4531 - OBJ
      ?auto_4528 - LOCATION
    )
    :vars
    (
      ?auto_4533 - LOCATION
      ?auto_4532 - CITY
      ?auto_4534 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4529 ?auto_4527 ) ( GREATER-THAN ?auto_4530 ?auto_4527 ) ( GREATER-THAN ?auto_4530 ?auto_4529 ) ( GREATER-THAN ?auto_4531 ?auto_4527 ) ( GREATER-THAN ?auto_4531 ?auto_4529 ) ( GREATER-THAN ?auto_4531 ?auto_4530 ) ( IN-CITY ?auto_4533 ?auto_4532 ) ( IN-CITY ?auto_4528 ?auto_4532 ) ( not ( = ?auto_4528 ?auto_4533 ) ) ( OBJ-AT ?auto_4531 ?auto_4533 ) ( TRUCK-AT ?auto_4534 ?auto_4528 ) ( OBJ-AT ?auto_4527 ?auto_4528 ) ( OBJ-AT ?auto_4529 ?auto_4528 ) ( OBJ-AT ?auto_4530 ?auto_4528 ) ( not ( = ?auto_4527 ?auto_4529 ) ) ( not ( = ?auto_4527 ?auto_4530 ) ) ( not ( = ?auto_4527 ?auto_4531 ) ) ( not ( = ?auto_4529 ?auto_4530 ) ) ( not ( = ?auto_4529 ?auto_4531 ) ) ( not ( = ?auto_4530 ?auto_4531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4531 ?auto_4528 )
      ( DELIVER-4PKG-VERIFY ?auto_4527 ?auto_4529 ?auto_4530 ?auto_4531 ?auto_4528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4540 - OBJ
      ?auto_4542 - OBJ
      ?auto_4543 - OBJ
      ?auto_4544 - OBJ
      ?auto_4541 - LOCATION
    )
    :vars
    (
      ?auto_4546 - LOCATION
      ?auto_4547 - CITY
      ?auto_4545 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4542 ?auto_4540 ) ( GREATER-THAN ?auto_4543 ?auto_4540 ) ( GREATER-THAN ?auto_4543 ?auto_4542 ) ( GREATER-THAN ?auto_4544 ?auto_4540 ) ( GREATER-THAN ?auto_4544 ?auto_4542 ) ( GREATER-THAN ?auto_4544 ?auto_4543 ) ( IN-CITY ?auto_4546 ?auto_4547 ) ( IN-CITY ?auto_4541 ?auto_4547 ) ( not ( = ?auto_4541 ?auto_4546 ) ) ( OBJ-AT ?auto_4544 ?auto_4546 ) ( TRUCK-AT ?auto_4545 ?auto_4541 ) ( OBJ-AT ?auto_4540 ?auto_4541 ) ( OBJ-AT ?auto_4542 ?auto_4541 ) ( not ( = ?auto_4540 ?auto_4542 ) ) ( not ( = ?auto_4540 ?auto_4543 ) ) ( not ( = ?auto_4540 ?auto_4544 ) ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4544 ) ) ( not ( = ?auto_4543 ?auto_4544 ) ) ( IN-TRUCK ?auto_4543 ?auto_4545 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4543 ?auto_4541 )
      ( DELIVER-4PKG ?auto_4540 ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4541 )
      ( DELIVER-4PKG-VERIFY ?auto_4540 ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4553 - OBJ
      ?auto_4555 - OBJ
      ?auto_4556 - OBJ
      ?auto_4557 - OBJ
      ?auto_4554 - LOCATION
    )
    :vars
    (
      ?auto_4558 - LOCATION
      ?auto_4559 - CITY
      ?auto_4560 - TRUCK
      ?auto_4561 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4555 ?auto_4553 ) ( GREATER-THAN ?auto_4556 ?auto_4553 ) ( GREATER-THAN ?auto_4556 ?auto_4555 ) ( GREATER-THAN ?auto_4557 ?auto_4553 ) ( GREATER-THAN ?auto_4557 ?auto_4555 ) ( GREATER-THAN ?auto_4557 ?auto_4556 ) ( IN-CITY ?auto_4558 ?auto_4559 ) ( IN-CITY ?auto_4554 ?auto_4559 ) ( not ( = ?auto_4554 ?auto_4558 ) ) ( OBJ-AT ?auto_4557 ?auto_4558 ) ( OBJ-AT ?auto_4553 ?auto_4554 ) ( OBJ-AT ?auto_4555 ?auto_4554 ) ( not ( = ?auto_4553 ?auto_4555 ) ) ( not ( = ?auto_4553 ?auto_4556 ) ) ( not ( = ?auto_4553 ?auto_4557 ) ) ( not ( = ?auto_4555 ?auto_4556 ) ) ( not ( = ?auto_4555 ?auto_4557 ) ) ( not ( = ?auto_4556 ?auto_4557 ) ) ( IN-TRUCK ?auto_4556 ?auto_4560 ) ( TRUCK-AT ?auto_4560 ?auto_4561 ) ( IN-CITY ?auto_4561 ?auto_4559 ) ( not ( = ?auto_4554 ?auto_4561 ) ) ( not ( = ?auto_4558 ?auto_4561 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4560 ?auto_4561 ?auto_4554 ?auto_4559 )
      ( DELIVER-4PKG ?auto_4553 ?auto_4555 ?auto_4556 ?auto_4557 ?auto_4554 )
      ( DELIVER-4PKG-VERIFY ?auto_4553 ?auto_4555 ?auto_4556 ?auto_4557 ?auto_4554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4567 - OBJ
      ?auto_4569 - OBJ
      ?auto_4570 - OBJ
      ?auto_4571 - OBJ
      ?auto_4568 - LOCATION
    )
    :vars
    (
      ?auto_4572 - LOCATION
      ?auto_4573 - CITY
      ?auto_4574 - TRUCK
      ?auto_4575 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4569 ?auto_4567 ) ( GREATER-THAN ?auto_4570 ?auto_4567 ) ( GREATER-THAN ?auto_4570 ?auto_4569 ) ( GREATER-THAN ?auto_4571 ?auto_4567 ) ( GREATER-THAN ?auto_4571 ?auto_4569 ) ( GREATER-THAN ?auto_4571 ?auto_4570 ) ( IN-CITY ?auto_4572 ?auto_4573 ) ( IN-CITY ?auto_4568 ?auto_4573 ) ( not ( = ?auto_4568 ?auto_4572 ) ) ( OBJ-AT ?auto_4571 ?auto_4572 ) ( OBJ-AT ?auto_4567 ?auto_4568 ) ( OBJ-AT ?auto_4569 ?auto_4568 ) ( not ( = ?auto_4567 ?auto_4569 ) ) ( not ( = ?auto_4567 ?auto_4570 ) ) ( not ( = ?auto_4567 ?auto_4571 ) ) ( not ( = ?auto_4569 ?auto_4570 ) ) ( not ( = ?auto_4569 ?auto_4571 ) ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( TRUCK-AT ?auto_4574 ?auto_4575 ) ( IN-CITY ?auto_4575 ?auto_4573 ) ( not ( = ?auto_4568 ?auto_4575 ) ) ( not ( = ?auto_4572 ?auto_4575 ) ) ( OBJ-AT ?auto_4570 ?auto_4575 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4570 ?auto_4574 ?auto_4575 )
      ( DELIVER-4PKG ?auto_4567 ?auto_4569 ?auto_4570 ?auto_4571 ?auto_4568 )
      ( DELIVER-4PKG-VERIFY ?auto_4567 ?auto_4569 ?auto_4570 ?auto_4571 ?auto_4568 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4581 - OBJ
      ?auto_4583 - OBJ
      ?auto_4584 - OBJ
      ?auto_4585 - OBJ
      ?auto_4582 - LOCATION
    )
    :vars
    (
      ?auto_4587 - LOCATION
      ?auto_4588 - CITY
      ?auto_4586 - LOCATION
      ?auto_4589 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4583 ?auto_4581 ) ( GREATER-THAN ?auto_4584 ?auto_4581 ) ( GREATER-THAN ?auto_4584 ?auto_4583 ) ( GREATER-THAN ?auto_4585 ?auto_4581 ) ( GREATER-THAN ?auto_4585 ?auto_4583 ) ( GREATER-THAN ?auto_4585 ?auto_4584 ) ( IN-CITY ?auto_4587 ?auto_4588 ) ( IN-CITY ?auto_4582 ?auto_4588 ) ( not ( = ?auto_4582 ?auto_4587 ) ) ( OBJ-AT ?auto_4585 ?auto_4587 ) ( OBJ-AT ?auto_4581 ?auto_4582 ) ( OBJ-AT ?auto_4583 ?auto_4582 ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( IN-CITY ?auto_4586 ?auto_4588 ) ( not ( = ?auto_4582 ?auto_4586 ) ) ( not ( = ?auto_4587 ?auto_4586 ) ) ( OBJ-AT ?auto_4584 ?auto_4586 ) ( TRUCK-AT ?auto_4589 ?auto_4582 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4589 ?auto_4582 ?auto_4586 ?auto_4588 )
      ( DELIVER-4PKG ?auto_4581 ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4582 )
      ( DELIVER-4PKG-VERIFY ?auto_4581 ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4595 - OBJ
      ?auto_4597 - OBJ
      ?auto_4598 - OBJ
      ?auto_4599 - OBJ
      ?auto_4596 - LOCATION
    )
    :vars
    (
      ?auto_4600 - LOCATION
      ?auto_4603 - CITY
      ?auto_4601 - LOCATION
      ?auto_4602 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4597 ?auto_4595 ) ( GREATER-THAN ?auto_4598 ?auto_4595 ) ( GREATER-THAN ?auto_4598 ?auto_4597 ) ( GREATER-THAN ?auto_4599 ?auto_4595 ) ( GREATER-THAN ?auto_4599 ?auto_4597 ) ( GREATER-THAN ?auto_4599 ?auto_4598 ) ( IN-CITY ?auto_4600 ?auto_4603 ) ( IN-CITY ?auto_4596 ?auto_4603 ) ( not ( = ?auto_4596 ?auto_4600 ) ) ( OBJ-AT ?auto_4599 ?auto_4600 ) ( OBJ-AT ?auto_4595 ?auto_4596 ) ( not ( = ?auto_4595 ?auto_4597 ) ) ( not ( = ?auto_4595 ?auto_4598 ) ) ( not ( = ?auto_4595 ?auto_4599 ) ) ( not ( = ?auto_4597 ?auto_4598 ) ) ( not ( = ?auto_4597 ?auto_4599 ) ) ( not ( = ?auto_4598 ?auto_4599 ) ) ( IN-CITY ?auto_4601 ?auto_4603 ) ( not ( = ?auto_4596 ?auto_4601 ) ) ( not ( = ?auto_4600 ?auto_4601 ) ) ( OBJ-AT ?auto_4598 ?auto_4601 ) ( TRUCK-AT ?auto_4602 ?auto_4596 ) ( IN-TRUCK ?auto_4597 ?auto_4602 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4597 ?auto_4596 )
      ( DELIVER-4PKG ?auto_4595 ?auto_4597 ?auto_4598 ?auto_4599 ?auto_4596 )
      ( DELIVER-4PKG-VERIFY ?auto_4595 ?auto_4597 ?auto_4598 ?auto_4599 ?auto_4596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4609 - OBJ
      ?auto_4611 - OBJ
      ?auto_4612 - OBJ
      ?auto_4613 - OBJ
      ?auto_4610 - LOCATION
    )
    :vars
    (
      ?auto_4616 - LOCATION
      ?auto_4617 - CITY
      ?auto_4615 - LOCATION
      ?auto_4614 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4611 ?auto_4609 ) ( GREATER-THAN ?auto_4612 ?auto_4609 ) ( GREATER-THAN ?auto_4612 ?auto_4611 ) ( GREATER-THAN ?auto_4613 ?auto_4609 ) ( GREATER-THAN ?auto_4613 ?auto_4611 ) ( GREATER-THAN ?auto_4613 ?auto_4612 ) ( IN-CITY ?auto_4616 ?auto_4617 ) ( IN-CITY ?auto_4610 ?auto_4617 ) ( not ( = ?auto_4610 ?auto_4616 ) ) ( OBJ-AT ?auto_4613 ?auto_4616 ) ( OBJ-AT ?auto_4609 ?auto_4610 ) ( not ( = ?auto_4609 ?auto_4611 ) ) ( not ( = ?auto_4609 ?auto_4612 ) ) ( not ( = ?auto_4609 ?auto_4613 ) ) ( not ( = ?auto_4611 ?auto_4612 ) ) ( not ( = ?auto_4611 ?auto_4613 ) ) ( not ( = ?auto_4612 ?auto_4613 ) ) ( IN-CITY ?auto_4615 ?auto_4617 ) ( not ( = ?auto_4610 ?auto_4615 ) ) ( not ( = ?auto_4616 ?auto_4615 ) ) ( OBJ-AT ?auto_4612 ?auto_4615 ) ( IN-TRUCK ?auto_4611 ?auto_4614 ) ( TRUCK-AT ?auto_4614 ?auto_4616 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4614 ?auto_4616 ?auto_4610 ?auto_4617 )
      ( DELIVER-4PKG ?auto_4609 ?auto_4611 ?auto_4612 ?auto_4613 ?auto_4610 )
      ( DELIVER-4PKG-VERIFY ?auto_4609 ?auto_4611 ?auto_4612 ?auto_4613 ?auto_4610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4623 - OBJ
      ?auto_4625 - OBJ
      ?auto_4626 - OBJ
      ?auto_4627 - OBJ
      ?auto_4624 - LOCATION
    )
    :vars
    (
      ?auto_4628 - LOCATION
      ?auto_4630 - CITY
      ?auto_4631 - LOCATION
      ?auto_4629 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4625 ?auto_4623 ) ( GREATER-THAN ?auto_4626 ?auto_4623 ) ( GREATER-THAN ?auto_4626 ?auto_4625 ) ( GREATER-THAN ?auto_4627 ?auto_4623 ) ( GREATER-THAN ?auto_4627 ?auto_4625 ) ( GREATER-THAN ?auto_4627 ?auto_4626 ) ( IN-CITY ?auto_4628 ?auto_4630 ) ( IN-CITY ?auto_4624 ?auto_4630 ) ( not ( = ?auto_4624 ?auto_4628 ) ) ( OBJ-AT ?auto_4627 ?auto_4628 ) ( OBJ-AT ?auto_4623 ?auto_4624 ) ( not ( = ?auto_4623 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( not ( = ?auto_4623 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( IN-CITY ?auto_4631 ?auto_4630 ) ( not ( = ?auto_4624 ?auto_4631 ) ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( OBJ-AT ?auto_4626 ?auto_4631 ) ( TRUCK-AT ?auto_4629 ?auto_4628 ) ( OBJ-AT ?auto_4625 ?auto_4628 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4625 ?auto_4629 ?auto_4628 )
      ( DELIVER-4PKG ?auto_4623 ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4624 )
      ( DELIVER-4PKG-VERIFY ?auto_4623 ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4637 - OBJ
      ?auto_4639 - OBJ
      ?auto_4640 - OBJ
      ?auto_4641 - OBJ
      ?auto_4638 - LOCATION
    )
    :vars
    (
      ?auto_4643 - LOCATION
      ?auto_4642 - CITY
      ?auto_4644 - LOCATION
      ?auto_4645 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4639 ?auto_4637 ) ( GREATER-THAN ?auto_4640 ?auto_4637 ) ( GREATER-THAN ?auto_4640 ?auto_4639 ) ( GREATER-THAN ?auto_4641 ?auto_4637 ) ( GREATER-THAN ?auto_4641 ?auto_4639 ) ( GREATER-THAN ?auto_4641 ?auto_4640 ) ( IN-CITY ?auto_4643 ?auto_4642 ) ( IN-CITY ?auto_4638 ?auto_4642 ) ( not ( = ?auto_4638 ?auto_4643 ) ) ( OBJ-AT ?auto_4641 ?auto_4643 ) ( OBJ-AT ?auto_4637 ?auto_4638 ) ( not ( = ?auto_4637 ?auto_4639 ) ) ( not ( = ?auto_4637 ?auto_4640 ) ) ( not ( = ?auto_4637 ?auto_4641 ) ) ( not ( = ?auto_4639 ?auto_4640 ) ) ( not ( = ?auto_4639 ?auto_4641 ) ) ( not ( = ?auto_4640 ?auto_4641 ) ) ( IN-CITY ?auto_4644 ?auto_4642 ) ( not ( = ?auto_4638 ?auto_4644 ) ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( OBJ-AT ?auto_4640 ?auto_4644 ) ( OBJ-AT ?auto_4639 ?auto_4643 ) ( TRUCK-AT ?auto_4645 ?auto_4638 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4645 ?auto_4638 ?auto_4643 ?auto_4642 )
      ( DELIVER-4PKG ?auto_4637 ?auto_4639 ?auto_4640 ?auto_4641 ?auto_4638 )
      ( DELIVER-4PKG-VERIFY ?auto_4637 ?auto_4639 ?auto_4640 ?auto_4641 ?auto_4638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4651 - OBJ
      ?auto_4653 - OBJ
      ?auto_4654 - OBJ
      ?auto_4655 - OBJ
      ?auto_4652 - LOCATION
    )
    :vars
    (
      ?auto_4659 - LOCATION
      ?auto_4657 - CITY
      ?auto_4656 - LOCATION
      ?auto_4658 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4653 ?auto_4651 ) ( GREATER-THAN ?auto_4654 ?auto_4651 ) ( GREATER-THAN ?auto_4654 ?auto_4653 ) ( GREATER-THAN ?auto_4655 ?auto_4651 ) ( GREATER-THAN ?auto_4655 ?auto_4653 ) ( GREATER-THAN ?auto_4655 ?auto_4654 ) ( IN-CITY ?auto_4659 ?auto_4657 ) ( IN-CITY ?auto_4652 ?auto_4657 ) ( not ( = ?auto_4652 ?auto_4659 ) ) ( OBJ-AT ?auto_4655 ?auto_4659 ) ( not ( = ?auto_4651 ?auto_4653 ) ) ( not ( = ?auto_4651 ?auto_4654 ) ) ( not ( = ?auto_4651 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) ( not ( = ?auto_4654 ?auto_4655 ) ) ( IN-CITY ?auto_4656 ?auto_4657 ) ( not ( = ?auto_4652 ?auto_4656 ) ) ( not ( = ?auto_4659 ?auto_4656 ) ) ( OBJ-AT ?auto_4654 ?auto_4656 ) ( OBJ-AT ?auto_4653 ?auto_4659 ) ( TRUCK-AT ?auto_4658 ?auto_4652 ) ( IN-TRUCK ?auto_4651 ?auto_4658 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4651 ?auto_4652 )
      ( DELIVER-4PKG ?auto_4651 ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4652 )
      ( DELIVER-4PKG-VERIFY ?auto_4651 ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4665 - OBJ
      ?auto_4667 - OBJ
      ?auto_4668 - OBJ
      ?auto_4669 - OBJ
      ?auto_4666 - LOCATION
    )
    :vars
    (
      ?auto_4671 - LOCATION
      ?auto_4672 - CITY
      ?auto_4670 - LOCATION
      ?auto_4673 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4667 ?auto_4665 ) ( GREATER-THAN ?auto_4668 ?auto_4665 ) ( GREATER-THAN ?auto_4668 ?auto_4667 ) ( GREATER-THAN ?auto_4669 ?auto_4665 ) ( GREATER-THAN ?auto_4669 ?auto_4667 ) ( GREATER-THAN ?auto_4669 ?auto_4668 ) ( IN-CITY ?auto_4671 ?auto_4672 ) ( IN-CITY ?auto_4666 ?auto_4672 ) ( not ( = ?auto_4666 ?auto_4671 ) ) ( OBJ-AT ?auto_4669 ?auto_4671 ) ( not ( = ?auto_4665 ?auto_4667 ) ) ( not ( = ?auto_4665 ?auto_4668 ) ) ( not ( = ?auto_4665 ?auto_4669 ) ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4669 ) ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( IN-CITY ?auto_4670 ?auto_4672 ) ( not ( = ?auto_4666 ?auto_4670 ) ) ( not ( = ?auto_4671 ?auto_4670 ) ) ( OBJ-AT ?auto_4668 ?auto_4670 ) ( OBJ-AT ?auto_4667 ?auto_4671 ) ( IN-TRUCK ?auto_4665 ?auto_4673 ) ( TRUCK-AT ?auto_4673 ?auto_4671 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4673 ?auto_4671 ?auto_4666 ?auto_4672 )
      ( DELIVER-4PKG ?auto_4665 ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4666 )
      ( DELIVER-4PKG-VERIFY ?auto_4665 ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4679 - OBJ
      ?auto_4681 - OBJ
      ?auto_4682 - OBJ
      ?auto_4683 - OBJ
      ?auto_4680 - LOCATION
    )
    :vars
    (
      ?auto_4684 - LOCATION
      ?auto_4687 - CITY
      ?auto_4686 - LOCATION
      ?auto_4685 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4681 ?auto_4679 ) ( GREATER-THAN ?auto_4682 ?auto_4679 ) ( GREATER-THAN ?auto_4682 ?auto_4681 ) ( GREATER-THAN ?auto_4683 ?auto_4679 ) ( GREATER-THAN ?auto_4683 ?auto_4681 ) ( GREATER-THAN ?auto_4683 ?auto_4682 ) ( IN-CITY ?auto_4684 ?auto_4687 ) ( IN-CITY ?auto_4680 ?auto_4687 ) ( not ( = ?auto_4680 ?auto_4684 ) ) ( OBJ-AT ?auto_4683 ?auto_4684 ) ( not ( = ?auto_4679 ?auto_4681 ) ) ( not ( = ?auto_4679 ?auto_4682 ) ) ( not ( = ?auto_4679 ?auto_4683 ) ) ( not ( = ?auto_4681 ?auto_4682 ) ) ( not ( = ?auto_4681 ?auto_4683 ) ) ( not ( = ?auto_4682 ?auto_4683 ) ) ( IN-CITY ?auto_4686 ?auto_4687 ) ( not ( = ?auto_4680 ?auto_4686 ) ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( OBJ-AT ?auto_4682 ?auto_4686 ) ( OBJ-AT ?auto_4681 ?auto_4684 ) ( TRUCK-AT ?auto_4685 ?auto_4684 ) ( OBJ-AT ?auto_4679 ?auto_4684 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4679 ?auto_4685 ?auto_4684 )
      ( DELIVER-4PKG ?auto_4679 ?auto_4681 ?auto_4682 ?auto_4683 ?auto_4680 )
      ( DELIVER-4PKG-VERIFY ?auto_4679 ?auto_4681 ?auto_4682 ?auto_4683 ?auto_4680 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4693 - OBJ
      ?auto_4695 - OBJ
      ?auto_4696 - OBJ
      ?auto_4697 - OBJ
      ?auto_4694 - LOCATION
    )
    :vars
    (
      ?auto_4699 - LOCATION
      ?auto_4701 - CITY
      ?auto_4700 - LOCATION
      ?auto_4698 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4695 ?auto_4693 ) ( GREATER-THAN ?auto_4696 ?auto_4693 ) ( GREATER-THAN ?auto_4696 ?auto_4695 ) ( GREATER-THAN ?auto_4697 ?auto_4693 ) ( GREATER-THAN ?auto_4697 ?auto_4695 ) ( GREATER-THAN ?auto_4697 ?auto_4696 ) ( IN-CITY ?auto_4699 ?auto_4701 ) ( IN-CITY ?auto_4694 ?auto_4701 ) ( not ( = ?auto_4694 ?auto_4699 ) ) ( OBJ-AT ?auto_4697 ?auto_4699 ) ( not ( = ?auto_4693 ?auto_4695 ) ) ( not ( = ?auto_4693 ?auto_4696 ) ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( not ( = ?auto_4695 ?auto_4696 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( IN-CITY ?auto_4700 ?auto_4701 ) ( not ( = ?auto_4694 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( OBJ-AT ?auto_4696 ?auto_4700 ) ( OBJ-AT ?auto_4695 ?auto_4699 ) ( OBJ-AT ?auto_4693 ?auto_4699 ) ( TRUCK-AT ?auto_4698 ?auto_4694 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4698 ?auto_4694 ?auto_4699 ?auto_4701 )
      ( DELIVER-4PKG ?auto_4693 ?auto_4695 ?auto_4696 ?auto_4697 ?auto_4694 )
      ( DELIVER-4PKG-VERIFY ?auto_4693 ?auto_4695 ?auto_4696 ?auto_4697 ?auto_4694 ) )
  )

)

