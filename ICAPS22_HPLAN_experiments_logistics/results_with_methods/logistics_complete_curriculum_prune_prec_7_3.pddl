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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4254 - OBJ
      ?auto_4255 - LOCATION
    )
    :vars
    (
      ?auto_4256 - TRUCK
      ?auto_4257 - LOCATION
      ?auto_4258 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4256 ?auto_4257 ) ( IN-CITY ?auto_4257 ?auto_4258 ) ( IN-CITY ?auto_4255 ?auto_4258 ) ( not ( = ?auto_4255 ?auto_4257 ) ) ( OBJ-AT ?auto_4254 ?auto_4257 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4254 ?auto_4256 ?auto_4257 )
      ( !DRIVE-TRUCK ?auto_4256 ?auto_4257 ?auto_4255 ?auto_4258 )
      ( !UNLOAD-TRUCK ?auto_4254 ?auto_4256 ?auto_4255 )
      ( DELIVER-1PKG-VERIFY ?auto_4254 ?auto_4255 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4261 - OBJ
      ?auto_4262 - LOCATION
    )
    :vars
    (
      ?auto_4263 - LOCATION
      ?auto_4265 - CITY
      ?auto_4264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4263 ?auto_4265 ) ( IN-CITY ?auto_4262 ?auto_4265 ) ( not ( = ?auto_4262 ?auto_4263 ) ) ( OBJ-AT ?auto_4261 ?auto_4263 ) ( TRUCK-AT ?auto_4264 ?auto_4262 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4264 ?auto_4262 ?auto_4263 ?auto_4265 )
      ( DELIVER-1PKG ?auto_4261 ?auto_4262 )
      ( DELIVER-1PKG-VERIFY ?auto_4261 ?auto_4262 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4283 - OBJ
      ?auto_4285 - OBJ
      ?auto_4284 - LOCATION
    )
    :vars
    (
      ?auto_4287 - LOCATION
      ?auto_4286 - CITY
      ?auto_4288 - TRUCK
      ?auto_4289 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4285 ?auto_4283 ) ( IN-CITY ?auto_4287 ?auto_4286 ) ( IN-CITY ?auto_4284 ?auto_4286 ) ( not ( = ?auto_4284 ?auto_4287 ) ) ( OBJ-AT ?auto_4285 ?auto_4287 ) ( TRUCK-AT ?auto_4288 ?auto_4289 ) ( IN-CITY ?auto_4289 ?auto_4286 ) ( not ( = ?auto_4284 ?auto_4289 ) ) ( OBJ-AT ?auto_4283 ?auto_4289 ) ( not ( = ?auto_4283 ?auto_4285 ) ) ( not ( = ?auto_4287 ?auto_4289 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4283 ?auto_4284 )
      ( DELIVER-1PKG ?auto_4285 ?auto_4284 )
      ( DELIVER-2PKG-VERIFY ?auto_4283 ?auto_4285 ?auto_4284 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4293 - OBJ
      ?auto_4295 - OBJ
      ?auto_4294 - LOCATION
    )
    :vars
    (
      ?auto_4299 - LOCATION
      ?auto_4298 - CITY
      ?auto_4296 - LOCATION
      ?auto_4297 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4295 ?auto_4293 ) ( IN-CITY ?auto_4299 ?auto_4298 ) ( IN-CITY ?auto_4294 ?auto_4298 ) ( not ( = ?auto_4294 ?auto_4299 ) ) ( OBJ-AT ?auto_4295 ?auto_4299 ) ( IN-CITY ?auto_4296 ?auto_4298 ) ( not ( = ?auto_4294 ?auto_4296 ) ) ( OBJ-AT ?auto_4293 ?auto_4296 ) ( not ( = ?auto_4293 ?auto_4295 ) ) ( not ( = ?auto_4299 ?auto_4296 ) ) ( TRUCK-AT ?auto_4297 ?auto_4294 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4297 ?auto_4294 ?auto_4296 ?auto_4298 )
      ( DELIVER-2PKG ?auto_4293 ?auto_4295 ?auto_4294 )
      ( DELIVER-2PKG-VERIFY ?auto_4293 ?auto_4295 ?auto_4294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4319 - OBJ
      ?auto_4321 - OBJ
      ?auto_4318 - OBJ
      ?auto_4320 - LOCATION
    )
    :vars
    (
      ?auto_4322 - LOCATION
      ?auto_4324 - CITY
      ?auto_4326 - LOCATION
      ?auto_4323 - TRUCK
      ?auto_4325 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4321 ?auto_4319 ) ( GREATER-THAN ?auto_4318 ?auto_4319 ) ( GREATER-THAN ?auto_4318 ?auto_4321 ) ( IN-CITY ?auto_4322 ?auto_4324 ) ( IN-CITY ?auto_4320 ?auto_4324 ) ( not ( = ?auto_4320 ?auto_4322 ) ) ( OBJ-AT ?auto_4318 ?auto_4322 ) ( IN-CITY ?auto_4326 ?auto_4324 ) ( not ( = ?auto_4320 ?auto_4326 ) ) ( OBJ-AT ?auto_4321 ?auto_4326 ) ( TRUCK-AT ?auto_4323 ?auto_4325 ) ( IN-CITY ?auto_4325 ?auto_4324 ) ( not ( = ?auto_4320 ?auto_4325 ) ) ( OBJ-AT ?auto_4319 ?auto_4325 ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4326 ?auto_4325 ) ) ( not ( = ?auto_4319 ?auto_4318 ) ) ( not ( = ?auto_4321 ?auto_4318 ) ) ( not ( = ?auto_4322 ?auto_4326 ) ) ( not ( = ?auto_4322 ?auto_4325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4319 ?auto_4321 ?auto_4320 )
      ( DELIVER-1PKG ?auto_4318 ?auto_4320 )
      ( DELIVER-3PKG-VERIFY ?auto_4319 ?auto_4321 ?auto_4318 ?auto_4320 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4332 - OBJ
      ?auto_4334 - OBJ
      ?auto_4331 - OBJ
      ?auto_4333 - LOCATION
    )
    :vars
    (
      ?auto_4337 - LOCATION
      ?auto_4338 - CITY
      ?auto_4335 - LOCATION
      ?auto_4336 - LOCATION
      ?auto_4339 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4334 ?auto_4332 ) ( GREATER-THAN ?auto_4331 ?auto_4332 ) ( GREATER-THAN ?auto_4331 ?auto_4334 ) ( IN-CITY ?auto_4337 ?auto_4338 ) ( IN-CITY ?auto_4333 ?auto_4338 ) ( not ( = ?auto_4333 ?auto_4337 ) ) ( OBJ-AT ?auto_4331 ?auto_4337 ) ( IN-CITY ?auto_4335 ?auto_4338 ) ( not ( = ?auto_4333 ?auto_4335 ) ) ( OBJ-AT ?auto_4334 ?auto_4335 ) ( IN-CITY ?auto_4336 ?auto_4338 ) ( not ( = ?auto_4333 ?auto_4336 ) ) ( OBJ-AT ?auto_4332 ?auto_4336 ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4335 ?auto_4336 ) ) ( not ( = ?auto_4332 ?auto_4331 ) ) ( not ( = ?auto_4334 ?auto_4331 ) ) ( not ( = ?auto_4337 ?auto_4335 ) ) ( not ( = ?auto_4337 ?auto_4336 ) ) ( TRUCK-AT ?auto_4339 ?auto_4333 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4339 ?auto_4333 ?auto_4336 ?auto_4338 )
      ( DELIVER-3PKG ?auto_4332 ?auto_4334 ?auto_4331 ?auto_4333 )
      ( DELIVER-3PKG-VERIFY ?auto_4332 ?auto_4334 ?auto_4331 ?auto_4333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4360 - OBJ
      ?auto_4362 - OBJ
      ?auto_4359 - OBJ
      ?auto_4363 - OBJ
      ?auto_4361 - LOCATION
    )
    :vars
    (
      ?auto_4365 - LOCATION
      ?auto_4366 - CITY
      ?auto_4369 - LOCATION
      ?auto_4367 - LOCATION
      ?auto_4364 - TRUCK
      ?auto_4368 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4362 ?auto_4360 ) ( GREATER-THAN ?auto_4359 ?auto_4360 ) ( GREATER-THAN ?auto_4359 ?auto_4362 ) ( GREATER-THAN ?auto_4363 ?auto_4360 ) ( GREATER-THAN ?auto_4363 ?auto_4362 ) ( GREATER-THAN ?auto_4363 ?auto_4359 ) ( IN-CITY ?auto_4365 ?auto_4366 ) ( IN-CITY ?auto_4361 ?auto_4366 ) ( not ( = ?auto_4361 ?auto_4365 ) ) ( OBJ-AT ?auto_4363 ?auto_4365 ) ( IN-CITY ?auto_4369 ?auto_4366 ) ( not ( = ?auto_4361 ?auto_4369 ) ) ( OBJ-AT ?auto_4359 ?auto_4369 ) ( IN-CITY ?auto_4367 ?auto_4366 ) ( not ( = ?auto_4361 ?auto_4367 ) ) ( OBJ-AT ?auto_4362 ?auto_4367 ) ( TRUCK-AT ?auto_4364 ?auto_4368 ) ( IN-CITY ?auto_4368 ?auto_4366 ) ( not ( = ?auto_4361 ?auto_4368 ) ) ( OBJ-AT ?auto_4360 ?auto_4368 ) ( not ( = ?auto_4360 ?auto_4362 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( not ( = ?auto_4360 ?auto_4359 ) ) ( not ( = ?auto_4362 ?auto_4359 ) ) ( not ( = ?auto_4369 ?auto_4367 ) ) ( not ( = ?auto_4369 ?auto_4368 ) ) ( not ( = ?auto_4360 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4359 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4369 ) ) ( not ( = ?auto_4365 ?auto_4367 ) ) ( not ( = ?auto_4365 ?auto_4368 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4360 ?auto_4362 ?auto_4359 ?auto_4361 )
      ( DELIVER-1PKG ?auto_4363 ?auto_4361 )
      ( DELIVER-4PKG-VERIFY ?auto_4360 ?auto_4362 ?auto_4359 ?auto_4363 ?auto_4361 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4376 - OBJ
      ?auto_4378 - OBJ
      ?auto_4375 - OBJ
      ?auto_4379 - OBJ
      ?auto_4377 - LOCATION
    )
    :vars
    (
      ?auto_4383 - LOCATION
      ?auto_4380 - CITY
      ?auto_4384 - LOCATION
      ?auto_4382 - LOCATION
      ?auto_4381 - LOCATION
      ?auto_4385 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4378 ?auto_4376 ) ( GREATER-THAN ?auto_4375 ?auto_4376 ) ( GREATER-THAN ?auto_4375 ?auto_4378 ) ( GREATER-THAN ?auto_4379 ?auto_4376 ) ( GREATER-THAN ?auto_4379 ?auto_4378 ) ( GREATER-THAN ?auto_4379 ?auto_4375 ) ( IN-CITY ?auto_4383 ?auto_4380 ) ( IN-CITY ?auto_4377 ?auto_4380 ) ( not ( = ?auto_4377 ?auto_4383 ) ) ( OBJ-AT ?auto_4379 ?auto_4383 ) ( IN-CITY ?auto_4384 ?auto_4380 ) ( not ( = ?auto_4377 ?auto_4384 ) ) ( OBJ-AT ?auto_4375 ?auto_4384 ) ( IN-CITY ?auto_4382 ?auto_4380 ) ( not ( = ?auto_4377 ?auto_4382 ) ) ( OBJ-AT ?auto_4378 ?auto_4382 ) ( IN-CITY ?auto_4381 ?auto_4380 ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( OBJ-AT ?auto_4376 ?auto_4381 ) ( not ( = ?auto_4376 ?auto_4378 ) ) ( not ( = ?auto_4382 ?auto_4381 ) ) ( not ( = ?auto_4376 ?auto_4375 ) ) ( not ( = ?auto_4378 ?auto_4375 ) ) ( not ( = ?auto_4384 ?auto_4382 ) ) ( not ( = ?auto_4384 ?auto_4381 ) ) ( not ( = ?auto_4376 ?auto_4379 ) ) ( not ( = ?auto_4378 ?auto_4379 ) ) ( not ( = ?auto_4375 ?auto_4379 ) ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4382 ) ) ( not ( = ?auto_4383 ?auto_4381 ) ) ( TRUCK-AT ?auto_4385 ?auto_4377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4385 ?auto_4377 ?auto_4381 ?auto_4380 )
      ( DELIVER-4PKG ?auto_4376 ?auto_4378 ?auto_4375 ?auto_4379 ?auto_4377 )
      ( DELIVER-4PKG-VERIFY ?auto_4376 ?auto_4378 ?auto_4375 ?auto_4379 ?auto_4377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4407 - OBJ
      ?auto_4409 - OBJ
      ?auto_4406 - OBJ
      ?auto_4410 - OBJ
      ?auto_4411 - OBJ
      ?auto_4408 - LOCATION
    )
    :vars
    (
      ?auto_4412 - LOCATION
      ?auto_4414 - CITY
      ?auto_4417 - LOCATION
      ?auto_4418 - LOCATION
      ?auto_4416 - LOCATION
      ?auto_4413 - TRUCK
      ?auto_4415 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4409 ?auto_4407 ) ( GREATER-THAN ?auto_4406 ?auto_4407 ) ( GREATER-THAN ?auto_4406 ?auto_4409 ) ( GREATER-THAN ?auto_4410 ?auto_4407 ) ( GREATER-THAN ?auto_4410 ?auto_4409 ) ( GREATER-THAN ?auto_4410 ?auto_4406 ) ( GREATER-THAN ?auto_4411 ?auto_4407 ) ( GREATER-THAN ?auto_4411 ?auto_4409 ) ( GREATER-THAN ?auto_4411 ?auto_4406 ) ( GREATER-THAN ?auto_4411 ?auto_4410 ) ( IN-CITY ?auto_4412 ?auto_4414 ) ( IN-CITY ?auto_4408 ?auto_4414 ) ( not ( = ?auto_4408 ?auto_4412 ) ) ( OBJ-AT ?auto_4411 ?auto_4412 ) ( IN-CITY ?auto_4417 ?auto_4414 ) ( not ( = ?auto_4408 ?auto_4417 ) ) ( OBJ-AT ?auto_4410 ?auto_4417 ) ( IN-CITY ?auto_4418 ?auto_4414 ) ( not ( = ?auto_4408 ?auto_4418 ) ) ( OBJ-AT ?auto_4406 ?auto_4418 ) ( IN-CITY ?auto_4416 ?auto_4414 ) ( not ( = ?auto_4408 ?auto_4416 ) ) ( OBJ-AT ?auto_4409 ?auto_4416 ) ( TRUCK-AT ?auto_4413 ?auto_4415 ) ( IN-CITY ?auto_4415 ?auto_4414 ) ( not ( = ?auto_4408 ?auto_4415 ) ) ( OBJ-AT ?auto_4407 ?auto_4415 ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4416 ?auto_4415 ) ) ( not ( = ?auto_4407 ?auto_4406 ) ) ( not ( = ?auto_4409 ?auto_4406 ) ) ( not ( = ?auto_4418 ?auto_4416 ) ) ( not ( = ?auto_4418 ?auto_4415 ) ) ( not ( = ?auto_4407 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( not ( = ?auto_4406 ?auto_4410 ) ) ( not ( = ?auto_4417 ?auto_4418 ) ) ( not ( = ?auto_4417 ?auto_4416 ) ) ( not ( = ?auto_4417 ?auto_4415 ) ) ( not ( = ?auto_4407 ?auto_4411 ) ) ( not ( = ?auto_4409 ?auto_4411 ) ) ( not ( = ?auto_4406 ?auto_4411 ) ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4412 ?auto_4417 ) ) ( not ( = ?auto_4412 ?auto_4418 ) ) ( not ( = ?auto_4412 ?auto_4416 ) ) ( not ( = ?auto_4412 ?auto_4415 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4407 ?auto_4409 ?auto_4406 ?auto_4410 ?auto_4408 )
      ( DELIVER-1PKG ?auto_4411 ?auto_4408 )
      ( DELIVER-5PKG-VERIFY ?auto_4407 ?auto_4409 ?auto_4406 ?auto_4410 ?auto_4411 ?auto_4408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4426 - OBJ
      ?auto_4428 - OBJ
      ?auto_4425 - OBJ
      ?auto_4429 - OBJ
      ?auto_4430 - OBJ
      ?auto_4427 - LOCATION
    )
    :vars
    (
      ?auto_4432 - LOCATION
      ?auto_4436 - CITY
      ?auto_4431 - LOCATION
      ?auto_4437 - LOCATION
      ?auto_4435 - LOCATION
      ?auto_4433 - LOCATION
      ?auto_4434 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4428 ?auto_4426 ) ( GREATER-THAN ?auto_4425 ?auto_4426 ) ( GREATER-THAN ?auto_4425 ?auto_4428 ) ( GREATER-THAN ?auto_4429 ?auto_4426 ) ( GREATER-THAN ?auto_4429 ?auto_4428 ) ( GREATER-THAN ?auto_4429 ?auto_4425 ) ( GREATER-THAN ?auto_4430 ?auto_4426 ) ( GREATER-THAN ?auto_4430 ?auto_4428 ) ( GREATER-THAN ?auto_4430 ?auto_4425 ) ( GREATER-THAN ?auto_4430 ?auto_4429 ) ( IN-CITY ?auto_4432 ?auto_4436 ) ( IN-CITY ?auto_4427 ?auto_4436 ) ( not ( = ?auto_4427 ?auto_4432 ) ) ( OBJ-AT ?auto_4430 ?auto_4432 ) ( IN-CITY ?auto_4431 ?auto_4436 ) ( not ( = ?auto_4427 ?auto_4431 ) ) ( OBJ-AT ?auto_4429 ?auto_4431 ) ( IN-CITY ?auto_4437 ?auto_4436 ) ( not ( = ?auto_4427 ?auto_4437 ) ) ( OBJ-AT ?auto_4425 ?auto_4437 ) ( IN-CITY ?auto_4435 ?auto_4436 ) ( not ( = ?auto_4427 ?auto_4435 ) ) ( OBJ-AT ?auto_4428 ?auto_4435 ) ( IN-CITY ?auto_4433 ?auto_4436 ) ( not ( = ?auto_4427 ?auto_4433 ) ) ( OBJ-AT ?auto_4426 ?auto_4433 ) ( not ( = ?auto_4426 ?auto_4428 ) ) ( not ( = ?auto_4435 ?auto_4433 ) ) ( not ( = ?auto_4426 ?auto_4425 ) ) ( not ( = ?auto_4428 ?auto_4425 ) ) ( not ( = ?auto_4437 ?auto_4435 ) ) ( not ( = ?auto_4437 ?auto_4433 ) ) ( not ( = ?auto_4426 ?auto_4429 ) ) ( not ( = ?auto_4428 ?auto_4429 ) ) ( not ( = ?auto_4425 ?auto_4429 ) ) ( not ( = ?auto_4431 ?auto_4437 ) ) ( not ( = ?auto_4431 ?auto_4435 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( not ( = ?auto_4426 ?auto_4430 ) ) ( not ( = ?auto_4428 ?auto_4430 ) ) ( not ( = ?auto_4425 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4432 ?auto_4431 ) ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4432 ?auto_4435 ) ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( TRUCK-AT ?auto_4434 ?auto_4427 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4434 ?auto_4427 ?auto_4433 ?auto_4436 )
      ( DELIVER-5PKG ?auto_4426 ?auto_4428 ?auto_4425 ?auto_4429 ?auto_4430 ?auto_4427 )
      ( DELIVER-5PKG-VERIFY ?auto_4426 ?auto_4428 ?auto_4425 ?auto_4429 ?auto_4430 ?auto_4427 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4460 - OBJ
      ?auto_4462 - OBJ
      ?auto_4459 - OBJ
      ?auto_4463 - OBJ
      ?auto_4465 - OBJ
      ?auto_4464 - OBJ
      ?auto_4461 - LOCATION
    )
    :vars
    (
      ?auto_4466 - LOCATION
      ?auto_4468 - CITY
      ?auto_4470 - LOCATION
      ?auto_4469 - LOCATION
      ?auto_4473 - LOCATION
      ?auto_4472 - LOCATION
      ?auto_4467 - TRUCK
      ?auto_4471 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4462 ?auto_4460 ) ( GREATER-THAN ?auto_4459 ?auto_4460 ) ( GREATER-THAN ?auto_4459 ?auto_4462 ) ( GREATER-THAN ?auto_4463 ?auto_4460 ) ( GREATER-THAN ?auto_4463 ?auto_4462 ) ( GREATER-THAN ?auto_4463 ?auto_4459 ) ( GREATER-THAN ?auto_4465 ?auto_4460 ) ( GREATER-THAN ?auto_4465 ?auto_4462 ) ( GREATER-THAN ?auto_4465 ?auto_4459 ) ( GREATER-THAN ?auto_4465 ?auto_4463 ) ( GREATER-THAN ?auto_4464 ?auto_4460 ) ( GREATER-THAN ?auto_4464 ?auto_4462 ) ( GREATER-THAN ?auto_4464 ?auto_4459 ) ( GREATER-THAN ?auto_4464 ?auto_4463 ) ( GREATER-THAN ?auto_4464 ?auto_4465 ) ( IN-CITY ?auto_4466 ?auto_4468 ) ( IN-CITY ?auto_4461 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4466 ) ) ( OBJ-AT ?auto_4464 ?auto_4466 ) ( IN-CITY ?auto_4470 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4470 ) ) ( OBJ-AT ?auto_4465 ?auto_4470 ) ( IN-CITY ?auto_4469 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4469 ) ) ( OBJ-AT ?auto_4463 ?auto_4469 ) ( IN-CITY ?auto_4473 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4473 ) ) ( OBJ-AT ?auto_4459 ?auto_4473 ) ( IN-CITY ?auto_4472 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4472 ) ) ( OBJ-AT ?auto_4462 ?auto_4472 ) ( TRUCK-AT ?auto_4467 ?auto_4471 ) ( IN-CITY ?auto_4471 ?auto_4468 ) ( not ( = ?auto_4461 ?auto_4471 ) ) ( OBJ-AT ?auto_4460 ?auto_4471 ) ( not ( = ?auto_4460 ?auto_4462 ) ) ( not ( = ?auto_4472 ?auto_4471 ) ) ( not ( = ?auto_4460 ?auto_4459 ) ) ( not ( = ?auto_4462 ?auto_4459 ) ) ( not ( = ?auto_4473 ?auto_4472 ) ) ( not ( = ?auto_4473 ?auto_4471 ) ) ( not ( = ?auto_4460 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4463 ) ) ( not ( = ?auto_4459 ?auto_4463 ) ) ( not ( = ?auto_4469 ?auto_4473 ) ) ( not ( = ?auto_4469 ?auto_4472 ) ) ( not ( = ?auto_4469 ?auto_4471 ) ) ( not ( = ?auto_4460 ?auto_4465 ) ) ( not ( = ?auto_4462 ?auto_4465 ) ) ( not ( = ?auto_4459 ?auto_4465 ) ) ( not ( = ?auto_4463 ?auto_4465 ) ) ( not ( = ?auto_4470 ?auto_4469 ) ) ( not ( = ?auto_4470 ?auto_4473 ) ) ( not ( = ?auto_4470 ?auto_4472 ) ) ( not ( = ?auto_4470 ?auto_4471 ) ) ( not ( = ?auto_4460 ?auto_4464 ) ) ( not ( = ?auto_4462 ?auto_4464 ) ) ( not ( = ?auto_4459 ?auto_4464 ) ) ( not ( = ?auto_4463 ?auto_4464 ) ) ( not ( = ?auto_4465 ?auto_4464 ) ) ( not ( = ?auto_4466 ?auto_4470 ) ) ( not ( = ?auto_4466 ?auto_4469 ) ) ( not ( = ?auto_4466 ?auto_4473 ) ) ( not ( = ?auto_4466 ?auto_4472 ) ) ( not ( = ?auto_4466 ?auto_4471 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_4460 ?auto_4462 ?auto_4459 ?auto_4463 ?auto_4465 ?auto_4461 )
      ( DELIVER-1PKG ?auto_4464 ?auto_4461 )
      ( DELIVER-6PKG-VERIFY ?auto_4460 ?auto_4462 ?auto_4459 ?auto_4463 ?auto_4465 ?auto_4464 ?auto_4461 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4482 - OBJ
      ?auto_4484 - OBJ
      ?auto_4481 - OBJ
      ?auto_4485 - OBJ
      ?auto_4487 - OBJ
      ?auto_4486 - OBJ
      ?auto_4483 - LOCATION
    )
    :vars
    (
      ?auto_4495 - LOCATION
      ?auto_4494 - CITY
      ?auto_4493 - LOCATION
      ?auto_4490 - LOCATION
      ?auto_4489 - LOCATION
      ?auto_4488 - LOCATION
      ?auto_4491 - LOCATION
      ?auto_4492 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4484 ?auto_4482 ) ( GREATER-THAN ?auto_4481 ?auto_4482 ) ( GREATER-THAN ?auto_4481 ?auto_4484 ) ( GREATER-THAN ?auto_4485 ?auto_4482 ) ( GREATER-THAN ?auto_4485 ?auto_4484 ) ( GREATER-THAN ?auto_4485 ?auto_4481 ) ( GREATER-THAN ?auto_4487 ?auto_4482 ) ( GREATER-THAN ?auto_4487 ?auto_4484 ) ( GREATER-THAN ?auto_4487 ?auto_4481 ) ( GREATER-THAN ?auto_4487 ?auto_4485 ) ( GREATER-THAN ?auto_4486 ?auto_4482 ) ( GREATER-THAN ?auto_4486 ?auto_4484 ) ( GREATER-THAN ?auto_4486 ?auto_4481 ) ( GREATER-THAN ?auto_4486 ?auto_4485 ) ( GREATER-THAN ?auto_4486 ?auto_4487 ) ( IN-CITY ?auto_4495 ?auto_4494 ) ( IN-CITY ?auto_4483 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4495 ) ) ( OBJ-AT ?auto_4486 ?auto_4495 ) ( IN-CITY ?auto_4493 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4493 ) ) ( OBJ-AT ?auto_4487 ?auto_4493 ) ( IN-CITY ?auto_4490 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4490 ) ) ( OBJ-AT ?auto_4485 ?auto_4490 ) ( IN-CITY ?auto_4489 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4489 ) ) ( OBJ-AT ?auto_4481 ?auto_4489 ) ( IN-CITY ?auto_4488 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4488 ) ) ( OBJ-AT ?auto_4484 ?auto_4488 ) ( IN-CITY ?auto_4491 ?auto_4494 ) ( not ( = ?auto_4483 ?auto_4491 ) ) ( OBJ-AT ?auto_4482 ?auto_4491 ) ( not ( = ?auto_4482 ?auto_4484 ) ) ( not ( = ?auto_4488 ?auto_4491 ) ) ( not ( = ?auto_4482 ?auto_4481 ) ) ( not ( = ?auto_4484 ?auto_4481 ) ) ( not ( = ?auto_4489 ?auto_4488 ) ) ( not ( = ?auto_4489 ?auto_4491 ) ) ( not ( = ?auto_4482 ?auto_4485 ) ) ( not ( = ?auto_4484 ?auto_4485 ) ) ( not ( = ?auto_4481 ?auto_4485 ) ) ( not ( = ?auto_4490 ?auto_4489 ) ) ( not ( = ?auto_4490 ?auto_4488 ) ) ( not ( = ?auto_4490 ?auto_4491 ) ) ( not ( = ?auto_4482 ?auto_4487 ) ) ( not ( = ?auto_4484 ?auto_4487 ) ) ( not ( = ?auto_4481 ?auto_4487 ) ) ( not ( = ?auto_4485 ?auto_4487 ) ) ( not ( = ?auto_4493 ?auto_4490 ) ) ( not ( = ?auto_4493 ?auto_4489 ) ) ( not ( = ?auto_4493 ?auto_4488 ) ) ( not ( = ?auto_4493 ?auto_4491 ) ) ( not ( = ?auto_4482 ?auto_4486 ) ) ( not ( = ?auto_4484 ?auto_4486 ) ) ( not ( = ?auto_4481 ?auto_4486 ) ) ( not ( = ?auto_4485 ?auto_4486 ) ) ( not ( = ?auto_4487 ?auto_4486 ) ) ( not ( = ?auto_4495 ?auto_4493 ) ) ( not ( = ?auto_4495 ?auto_4490 ) ) ( not ( = ?auto_4495 ?auto_4489 ) ) ( not ( = ?auto_4495 ?auto_4488 ) ) ( not ( = ?auto_4495 ?auto_4491 ) ) ( TRUCK-AT ?auto_4492 ?auto_4483 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4492 ?auto_4483 ?auto_4491 ?auto_4494 )
      ( DELIVER-6PKG ?auto_4482 ?auto_4484 ?auto_4481 ?auto_4485 ?auto_4487 ?auto_4486 ?auto_4483 )
      ( DELIVER-6PKG-VERIFY ?auto_4482 ?auto_4484 ?auto_4481 ?auto_4485 ?auto_4487 ?auto_4486 ?auto_4483 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4519 - OBJ
      ?auto_4521 - OBJ
      ?auto_4518 - OBJ
      ?auto_4522 - OBJ
      ?auto_4524 - OBJ
      ?auto_4523 - OBJ
      ?auto_4525 - OBJ
      ?auto_4520 - LOCATION
    )
    :vars
    (
      ?auto_4528 - LOCATION
      ?auto_4526 - CITY
      ?auto_4534 - LOCATION
      ?auto_4533 - LOCATION
      ?auto_4531 - LOCATION
      ?auto_4530 - LOCATION
      ?auto_4529 - LOCATION
      ?auto_4527 - TRUCK
      ?auto_4532 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4521 ?auto_4519 ) ( GREATER-THAN ?auto_4518 ?auto_4519 ) ( GREATER-THAN ?auto_4518 ?auto_4521 ) ( GREATER-THAN ?auto_4522 ?auto_4519 ) ( GREATER-THAN ?auto_4522 ?auto_4521 ) ( GREATER-THAN ?auto_4522 ?auto_4518 ) ( GREATER-THAN ?auto_4524 ?auto_4519 ) ( GREATER-THAN ?auto_4524 ?auto_4521 ) ( GREATER-THAN ?auto_4524 ?auto_4518 ) ( GREATER-THAN ?auto_4524 ?auto_4522 ) ( GREATER-THAN ?auto_4523 ?auto_4519 ) ( GREATER-THAN ?auto_4523 ?auto_4521 ) ( GREATER-THAN ?auto_4523 ?auto_4518 ) ( GREATER-THAN ?auto_4523 ?auto_4522 ) ( GREATER-THAN ?auto_4523 ?auto_4524 ) ( GREATER-THAN ?auto_4525 ?auto_4519 ) ( GREATER-THAN ?auto_4525 ?auto_4521 ) ( GREATER-THAN ?auto_4525 ?auto_4518 ) ( GREATER-THAN ?auto_4525 ?auto_4522 ) ( GREATER-THAN ?auto_4525 ?auto_4524 ) ( GREATER-THAN ?auto_4525 ?auto_4523 ) ( IN-CITY ?auto_4528 ?auto_4526 ) ( IN-CITY ?auto_4520 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4528 ) ) ( OBJ-AT ?auto_4525 ?auto_4528 ) ( IN-CITY ?auto_4534 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4534 ) ) ( OBJ-AT ?auto_4523 ?auto_4534 ) ( IN-CITY ?auto_4533 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4533 ) ) ( OBJ-AT ?auto_4524 ?auto_4533 ) ( IN-CITY ?auto_4531 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4531 ) ) ( OBJ-AT ?auto_4522 ?auto_4531 ) ( IN-CITY ?auto_4530 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4530 ) ) ( OBJ-AT ?auto_4518 ?auto_4530 ) ( IN-CITY ?auto_4529 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4529 ) ) ( OBJ-AT ?auto_4521 ?auto_4529 ) ( TRUCK-AT ?auto_4527 ?auto_4532 ) ( IN-CITY ?auto_4532 ?auto_4526 ) ( not ( = ?auto_4520 ?auto_4532 ) ) ( OBJ-AT ?auto_4519 ?auto_4532 ) ( not ( = ?auto_4519 ?auto_4521 ) ) ( not ( = ?auto_4529 ?auto_4532 ) ) ( not ( = ?auto_4519 ?auto_4518 ) ) ( not ( = ?auto_4521 ?auto_4518 ) ) ( not ( = ?auto_4530 ?auto_4529 ) ) ( not ( = ?auto_4530 ?auto_4532 ) ) ( not ( = ?auto_4519 ?auto_4522 ) ) ( not ( = ?auto_4521 ?auto_4522 ) ) ( not ( = ?auto_4518 ?auto_4522 ) ) ( not ( = ?auto_4531 ?auto_4530 ) ) ( not ( = ?auto_4531 ?auto_4529 ) ) ( not ( = ?auto_4531 ?auto_4532 ) ) ( not ( = ?auto_4519 ?auto_4524 ) ) ( not ( = ?auto_4521 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4524 ) ) ( not ( = ?auto_4522 ?auto_4524 ) ) ( not ( = ?auto_4533 ?auto_4531 ) ) ( not ( = ?auto_4533 ?auto_4530 ) ) ( not ( = ?auto_4533 ?auto_4529 ) ) ( not ( = ?auto_4533 ?auto_4532 ) ) ( not ( = ?auto_4519 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( not ( = ?auto_4518 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4523 ) ) ( not ( = ?auto_4524 ?auto_4523 ) ) ( not ( = ?auto_4534 ?auto_4533 ) ) ( not ( = ?auto_4534 ?auto_4531 ) ) ( not ( = ?auto_4534 ?auto_4530 ) ) ( not ( = ?auto_4534 ?auto_4529 ) ) ( not ( = ?auto_4534 ?auto_4532 ) ) ( not ( = ?auto_4519 ?auto_4525 ) ) ( not ( = ?auto_4521 ?auto_4525 ) ) ( not ( = ?auto_4518 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4525 ) ) ( not ( = ?auto_4524 ?auto_4525 ) ) ( not ( = ?auto_4523 ?auto_4525 ) ) ( not ( = ?auto_4528 ?auto_4534 ) ) ( not ( = ?auto_4528 ?auto_4533 ) ) ( not ( = ?auto_4528 ?auto_4531 ) ) ( not ( = ?auto_4528 ?auto_4530 ) ) ( not ( = ?auto_4528 ?auto_4529 ) ) ( not ( = ?auto_4528 ?auto_4532 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_4519 ?auto_4521 ?auto_4518 ?auto_4522 ?auto_4524 ?auto_4523 ?auto_4520 )
      ( DELIVER-1PKG ?auto_4525 ?auto_4520 )
      ( DELIVER-7PKG-VERIFY ?auto_4519 ?auto_4521 ?auto_4518 ?auto_4522 ?auto_4524 ?auto_4523 ?auto_4525 ?auto_4520 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4544 - OBJ
      ?auto_4546 - OBJ
      ?auto_4543 - OBJ
      ?auto_4547 - OBJ
      ?auto_4549 - OBJ
      ?auto_4548 - OBJ
      ?auto_4550 - OBJ
      ?auto_4545 - LOCATION
    )
    :vars
    (
      ?auto_4556 - LOCATION
      ?auto_4558 - CITY
      ?auto_4552 - LOCATION
      ?auto_4551 - LOCATION
      ?auto_4553 - LOCATION
      ?auto_4557 - LOCATION
      ?auto_4559 - LOCATION
      ?auto_4554 - LOCATION
      ?auto_4555 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4546 ?auto_4544 ) ( GREATER-THAN ?auto_4543 ?auto_4544 ) ( GREATER-THAN ?auto_4543 ?auto_4546 ) ( GREATER-THAN ?auto_4547 ?auto_4544 ) ( GREATER-THAN ?auto_4547 ?auto_4546 ) ( GREATER-THAN ?auto_4547 ?auto_4543 ) ( GREATER-THAN ?auto_4549 ?auto_4544 ) ( GREATER-THAN ?auto_4549 ?auto_4546 ) ( GREATER-THAN ?auto_4549 ?auto_4543 ) ( GREATER-THAN ?auto_4549 ?auto_4547 ) ( GREATER-THAN ?auto_4548 ?auto_4544 ) ( GREATER-THAN ?auto_4548 ?auto_4546 ) ( GREATER-THAN ?auto_4548 ?auto_4543 ) ( GREATER-THAN ?auto_4548 ?auto_4547 ) ( GREATER-THAN ?auto_4548 ?auto_4549 ) ( GREATER-THAN ?auto_4550 ?auto_4544 ) ( GREATER-THAN ?auto_4550 ?auto_4546 ) ( GREATER-THAN ?auto_4550 ?auto_4543 ) ( GREATER-THAN ?auto_4550 ?auto_4547 ) ( GREATER-THAN ?auto_4550 ?auto_4549 ) ( GREATER-THAN ?auto_4550 ?auto_4548 ) ( IN-CITY ?auto_4556 ?auto_4558 ) ( IN-CITY ?auto_4545 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4556 ) ) ( OBJ-AT ?auto_4550 ?auto_4556 ) ( IN-CITY ?auto_4552 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4552 ) ) ( OBJ-AT ?auto_4548 ?auto_4552 ) ( IN-CITY ?auto_4551 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4551 ) ) ( OBJ-AT ?auto_4549 ?auto_4551 ) ( IN-CITY ?auto_4553 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4553 ) ) ( OBJ-AT ?auto_4547 ?auto_4553 ) ( IN-CITY ?auto_4557 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4557 ) ) ( OBJ-AT ?auto_4543 ?auto_4557 ) ( IN-CITY ?auto_4559 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4559 ) ) ( OBJ-AT ?auto_4546 ?auto_4559 ) ( IN-CITY ?auto_4554 ?auto_4558 ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( OBJ-AT ?auto_4544 ?auto_4554 ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4559 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4543 ) ) ( not ( = ?auto_4546 ?auto_4543 ) ) ( not ( = ?auto_4557 ?auto_4559 ) ) ( not ( = ?auto_4557 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4543 ?auto_4547 ) ) ( not ( = ?auto_4553 ?auto_4557 ) ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( not ( = ?auto_4553 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4549 ) ) ( not ( = ?auto_4546 ?auto_4549 ) ) ( not ( = ?auto_4543 ?auto_4549 ) ) ( not ( = ?auto_4547 ?auto_4549 ) ) ( not ( = ?auto_4551 ?auto_4553 ) ) ( not ( = ?auto_4551 ?auto_4557 ) ) ( not ( = ?auto_4551 ?auto_4559 ) ) ( not ( = ?auto_4551 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4548 ) ) ( not ( = ?auto_4546 ?auto_4548 ) ) ( not ( = ?auto_4543 ?auto_4548 ) ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( not ( = ?auto_4549 ?auto_4548 ) ) ( not ( = ?auto_4552 ?auto_4551 ) ) ( not ( = ?auto_4552 ?auto_4553 ) ) ( not ( = ?auto_4552 ?auto_4557 ) ) ( not ( = ?auto_4552 ?auto_4559 ) ) ( not ( = ?auto_4552 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4550 ) ) ( not ( = ?auto_4543 ?auto_4550 ) ) ( not ( = ?auto_4547 ?auto_4550 ) ) ( not ( = ?auto_4549 ?auto_4550 ) ) ( not ( = ?auto_4548 ?auto_4550 ) ) ( not ( = ?auto_4556 ?auto_4552 ) ) ( not ( = ?auto_4556 ?auto_4551 ) ) ( not ( = ?auto_4556 ?auto_4553 ) ) ( not ( = ?auto_4556 ?auto_4557 ) ) ( not ( = ?auto_4556 ?auto_4559 ) ) ( not ( = ?auto_4556 ?auto_4554 ) ) ( TRUCK-AT ?auto_4555 ?auto_4545 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4555 ?auto_4545 ?auto_4554 ?auto_4558 )
      ( DELIVER-7PKG ?auto_4544 ?auto_4546 ?auto_4543 ?auto_4547 ?auto_4549 ?auto_4548 ?auto_4550 ?auto_4545 )
      ( DELIVER-7PKG-VERIFY ?auto_4544 ?auto_4546 ?auto_4543 ?auto_4547 ?auto_4549 ?auto_4548 ?auto_4550 ?auto_4545 ) )
  )

)

