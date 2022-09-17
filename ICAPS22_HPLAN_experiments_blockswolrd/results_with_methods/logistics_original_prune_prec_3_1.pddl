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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4068 - OBJ
      ?auto_4067 - LOCATION
    )
    :vars
    (
      ?auto_4069 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4069 ?auto_4067 ) ( IN-TRUCK ?auto_4068 ?auto_4069 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4068 ?auto_4069 ?auto_4067 )
      ( DELIVER-1PKG-VERIFY ?auto_4068 ?auto_4067 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4080 - OBJ
      ?auto_4079 - LOCATION
    )
    :vars
    (
      ?auto_4081 - TRUCK
      ?auto_4082 - LOCATION
      ?auto_4083 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4080 ?auto_4081 ) ( TRUCK-AT ?auto_4081 ?auto_4082 ) ( IN-CITY ?auto_4082 ?auto_4083 ) ( IN-CITY ?auto_4079 ?auto_4083 ) ( not ( = ?auto_4079 ?auto_4082 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4081 ?auto_4082 ?auto_4079 ?auto_4083 )
      ( DELIVER-1PKG ?auto_4080 ?auto_4079 )
      ( DELIVER-1PKG-VERIFY ?auto_4080 ?auto_4079 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4098 - OBJ
      ?auto_4097 - LOCATION
    )
    :vars
    (
      ?auto_4099 - TRUCK
      ?auto_4100 - LOCATION
      ?auto_4101 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4099 ?auto_4100 ) ( IN-CITY ?auto_4100 ?auto_4101 ) ( IN-CITY ?auto_4097 ?auto_4101 ) ( not ( = ?auto_4097 ?auto_4100 ) ) ( OBJ-AT ?auto_4098 ?auto_4100 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4098 ?auto_4099 ?auto_4100 )
      ( DELIVER-1PKG ?auto_4098 ?auto_4097 )
      ( DELIVER-1PKG-VERIFY ?auto_4098 ?auto_4097 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4116 - OBJ
      ?auto_4115 - LOCATION
    )
    :vars
    (
      ?auto_4118 - LOCATION
      ?auto_4117 - CITY
      ?auto_4119 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4118 ?auto_4117 ) ( IN-CITY ?auto_4115 ?auto_4117 ) ( not ( = ?auto_4115 ?auto_4118 ) ) ( OBJ-AT ?auto_4116 ?auto_4118 ) ( TRUCK-AT ?auto_4119 ?auto_4115 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4119 ?auto_4115 ?auto_4118 ?auto_4117 )
      ( DELIVER-1PKG ?auto_4116 ?auto_4115 )
      ( DELIVER-1PKG-VERIFY ?auto_4116 ?auto_4115 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4176 - OBJ
      ?auto_4177 - OBJ
      ?auto_4175 - LOCATION
    )
    :vars
    (
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4177 ?auto_4176 ) ) ( TRUCK-AT ?auto_4178 ?auto_4175 ) ( IN-TRUCK ?auto_4177 ?auto_4178 ) ( OBJ-AT ?auto_4176 ?auto_4175 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4177 ?auto_4175 )
      ( DELIVER-2PKG-VERIFY ?auto_4176 ?auto_4177 ?auto_4175 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4180 - OBJ
      ?auto_4181 - OBJ
      ?auto_4179 - LOCATION
    )
    :vars
    (
      ?auto_4182 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4181 ?auto_4180 ) ) ( TRUCK-AT ?auto_4182 ?auto_4179 ) ( IN-TRUCK ?auto_4180 ?auto_4182 ) ( OBJ-AT ?auto_4181 ?auto_4179 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4180 ?auto_4179 )
      ( DELIVER-2PKG-VERIFY ?auto_4180 ?auto_4181 ?auto_4179 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4228 - OBJ
      ?auto_4229 - OBJ
      ?auto_4227 - LOCATION
    )
    :vars
    (
      ?auto_4232 - TRUCK
      ?auto_4231 - LOCATION
      ?auto_4230 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4229 ?auto_4228 ) ) ( IN-TRUCK ?auto_4229 ?auto_4232 ) ( TRUCK-AT ?auto_4232 ?auto_4231 ) ( IN-CITY ?auto_4231 ?auto_4230 ) ( IN-CITY ?auto_4227 ?auto_4230 ) ( not ( = ?auto_4227 ?auto_4231 ) ) ( OBJ-AT ?auto_4228 ?auto_4227 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4229 ?auto_4227 )
      ( DELIVER-2PKG-VERIFY ?auto_4228 ?auto_4229 ?auto_4227 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4234 - OBJ
      ?auto_4235 - OBJ
      ?auto_4233 - LOCATION
    )
    :vars
    (
      ?auto_4238 - TRUCK
      ?auto_4237 - LOCATION
      ?auto_4236 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4235 ?auto_4234 ) ) ( IN-TRUCK ?auto_4234 ?auto_4238 ) ( TRUCK-AT ?auto_4238 ?auto_4237 ) ( IN-CITY ?auto_4237 ?auto_4236 ) ( IN-CITY ?auto_4233 ?auto_4236 ) ( not ( = ?auto_4233 ?auto_4237 ) ) ( OBJ-AT ?auto_4235 ?auto_4233 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4235 ?auto_4234 ?auto_4233 )
      ( DELIVER-2PKG-VERIFY ?auto_4234 ?auto_4235 ?auto_4233 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4297 - OBJ
      ?auto_4296 - LOCATION
    )
    :vars
    (
      ?auto_4300 - OBJ
      ?auto_4301 - TRUCK
      ?auto_4299 - LOCATION
      ?auto_4298 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4297 ?auto_4300 ) ) ( TRUCK-AT ?auto_4301 ?auto_4299 ) ( IN-CITY ?auto_4299 ?auto_4298 ) ( IN-CITY ?auto_4296 ?auto_4298 ) ( not ( = ?auto_4296 ?auto_4299 ) ) ( OBJ-AT ?auto_4300 ?auto_4296 ) ( OBJ-AT ?auto_4297 ?auto_4299 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4297 ?auto_4301 ?auto_4299 )
      ( DELIVER-2PKG ?auto_4300 ?auto_4297 ?auto_4296 )
      ( DELIVER-1PKG-VERIFY ?auto_4297 ?auto_4296 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4303 - OBJ
      ?auto_4304 - OBJ
      ?auto_4302 - LOCATION
    )
    :vars
    (
      ?auto_4305 - TRUCK
      ?auto_4307 - LOCATION
      ?auto_4306 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4304 ?auto_4303 ) ) ( TRUCK-AT ?auto_4305 ?auto_4307 ) ( IN-CITY ?auto_4307 ?auto_4306 ) ( IN-CITY ?auto_4302 ?auto_4306 ) ( not ( = ?auto_4302 ?auto_4307 ) ) ( OBJ-AT ?auto_4303 ?auto_4302 ) ( OBJ-AT ?auto_4304 ?auto_4307 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4304 ?auto_4302 )
      ( DELIVER-2PKG-VERIFY ?auto_4303 ?auto_4304 ?auto_4302 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4309 - OBJ
      ?auto_4310 - OBJ
      ?auto_4308 - LOCATION
    )
    :vars
    (
      ?auto_4311 - TRUCK
      ?auto_4312 - LOCATION
      ?auto_4313 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4310 ?auto_4309 ) ) ( TRUCK-AT ?auto_4311 ?auto_4312 ) ( IN-CITY ?auto_4312 ?auto_4313 ) ( IN-CITY ?auto_4308 ?auto_4313 ) ( not ( = ?auto_4308 ?auto_4312 ) ) ( OBJ-AT ?auto_4310 ?auto_4308 ) ( OBJ-AT ?auto_4309 ?auto_4312 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4310 ?auto_4309 ?auto_4308 )
      ( DELIVER-2PKG-VERIFY ?auto_4309 ?auto_4310 ?auto_4308 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4372 - OBJ
      ?auto_4371 - LOCATION
    )
    :vars
    (
      ?auto_4374 - OBJ
      ?auto_4375 - LOCATION
      ?auto_4376 - CITY
      ?auto_4373 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4372 ?auto_4374 ) ) ( IN-CITY ?auto_4375 ?auto_4376 ) ( IN-CITY ?auto_4371 ?auto_4376 ) ( not ( = ?auto_4371 ?auto_4375 ) ) ( OBJ-AT ?auto_4374 ?auto_4371 ) ( OBJ-AT ?auto_4372 ?auto_4375 ) ( TRUCK-AT ?auto_4373 ?auto_4371 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4373 ?auto_4371 ?auto_4375 ?auto_4376 )
      ( DELIVER-2PKG ?auto_4374 ?auto_4372 ?auto_4371 )
      ( DELIVER-1PKG-VERIFY ?auto_4372 ?auto_4371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4378 - OBJ
      ?auto_4379 - OBJ
      ?auto_4377 - LOCATION
    )
    :vars
    (
      ?auto_4380 - LOCATION
      ?auto_4381 - CITY
      ?auto_4382 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4379 ?auto_4378 ) ) ( IN-CITY ?auto_4380 ?auto_4381 ) ( IN-CITY ?auto_4377 ?auto_4381 ) ( not ( = ?auto_4377 ?auto_4380 ) ) ( OBJ-AT ?auto_4378 ?auto_4377 ) ( OBJ-AT ?auto_4379 ?auto_4380 ) ( TRUCK-AT ?auto_4382 ?auto_4377 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4379 ?auto_4377 )
      ( DELIVER-2PKG-VERIFY ?auto_4378 ?auto_4379 ?auto_4377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4384 - OBJ
      ?auto_4385 - OBJ
      ?auto_4383 - LOCATION
    )
    :vars
    (
      ?auto_4386 - LOCATION
      ?auto_4388 - CITY
      ?auto_4387 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4385 ?auto_4384 ) ) ( IN-CITY ?auto_4386 ?auto_4388 ) ( IN-CITY ?auto_4383 ?auto_4388 ) ( not ( = ?auto_4383 ?auto_4386 ) ) ( OBJ-AT ?auto_4385 ?auto_4383 ) ( OBJ-AT ?auto_4384 ?auto_4386 ) ( TRUCK-AT ?auto_4387 ?auto_4383 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4385 ?auto_4384 ?auto_4383 )
      ( DELIVER-2PKG-VERIFY ?auto_4384 ?auto_4385 ?auto_4383 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4447 - OBJ
      ?auto_4446 - LOCATION
    )
    :vars
    (
      ?auto_4451 - OBJ
      ?auto_4448 - LOCATION
      ?auto_4450 - CITY
      ?auto_4449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4447 ?auto_4451 ) ) ( IN-CITY ?auto_4448 ?auto_4450 ) ( IN-CITY ?auto_4446 ?auto_4450 ) ( not ( = ?auto_4446 ?auto_4448 ) ) ( OBJ-AT ?auto_4447 ?auto_4448 ) ( TRUCK-AT ?auto_4449 ?auto_4446 ) ( IN-TRUCK ?auto_4451 ?auto_4449 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4451 ?auto_4446 )
      ( DELIVER-2PKG ?auto_4451 ?auto_4447 ?auto_4446 )
      ( DELIVER-1PKG-VERIFY ?auto_4447 ?auto_4446 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4453 - OBJ
      ?auto_4454 - OBJ
      ?auto_4452 - LOCATION
    )
    :vars
    (
      ?auto_4457 - LOCATION
      ?auto_4455 - CITY
      ?auto_4456 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4454 ?auto_4453 ) ) ( IN-CITY ?auto_4457 ?auto_4455 ) ( IN-CITY ?auto_4452 ?auto_4455 ) ( not ( = ?auto_4452 ?auto_4457 ) ) ( OBJ-AT ?auto_4454 ?auto_4457 ) ( TRUCK-AT ?auto_4456 ?auto_4452 ) ( IN-TRUCK ?auto_4453 ?auto_4456 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4454 ?auto_4452 )
      ( DELIVER-2PKG-VERIFY ?auto_4453 ?auto_4454 ?auto_4452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4459 - OBJ
      ?auto_4460 - OBJ
      ?auto_4458 - LOCATION
    )
    :vars
    (
      ?auto_4461 - LOCATION
      ?auto_4462 - CITY
      ?auto_4463 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4460 ?auto_4459 ) ) ( IN-CITY ?auto_4461 ?auto_4462 ) ( IN-CITY ?auto_4458 ?auto_4462 ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( OBJ-AT ?auto_4459 ?auto_4461 ) ( TRUCK-AT ?auto_4463 ?auto_4458 ) ( IN-TRUCK ?auto_4460 ?auto_4463 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4460 ?auto_4459 ?auto_4458 )
      ( DELIVER-2PKG-VERIFY ?auto_4459 ?auto_4460 ?auto_4458 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4522 - OBJ
      ?auto_4521 - LOCATION
    )
    :vars
    (
      ?auto_4525 - OBJ
      ?auto_4523 - LOCATION
      ?auto_4524 - CITY
      ?auto_4526 - TRUCK
      ?auto_4527 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4522 ?auto_4525 ) ) ( IN-CITY ?auto_4523 ?auto_4524 ) ( IN-CITY ?auto_4521 ?auto_4524 ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( OBJ-AT ?auto_4522 ?auto_4523 ) ( IN-TRUCK ?auto_4525 ?auto_4526 ) ( TRUCK-AT ?auto_4526 ?auto_4527 ) ( IN-CITY ?auto_4527 ?auto_4524 ) ( not ( = ?auto_4521 ?auto_4527 ) ) ( not ( = ?auto_4523 ?auto_4527 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4526 ?auto_4527 ?auto_4521 ?auto_4524 )
      ( DELIVER-2PKG ?auto_4525 ?auto_4522 ?auto_4521 )
      ( DELIVER-1PKG-VERIFY ?auto_4522 ?auto_4521 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4529 - OBJ
      ?auto_4530 - OBJ
      ?auto_4528 - LOCATION
    )
    :vars
    (
      ?auto_4533 - LOCATION
      ?auto_4534 - CITY
      ?auto_4531 - TRUCK
      ?auto_4532 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4530 ?auto_4529 ) ) ( IN-CITY ?auto_4533 ?auto_4534 ) ( IN-CITY ?auto_4528 ?auto_4534 ) ( not ( = ?auto_4528 ?auto_4533 ) ) ( OBJ-AT ?auto_4530 ?auto_4533 ) ( IN-TRUCK ?auto_4529 ?auto_4531 ) ( TRUCK-AT ?auto_4531 ?auto_4532 ) ( IN-CITY ?auto_4532 ?auto_4534 ) ( not ( = ?auto_4528 ?auto_4532 ) ) ( not ( = ?auto_4533 ?auto_4532 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4530 ?auto_4528 )
      ( DELIVER-2PKG-VERIFY ?auto_4529 ?auto_4530 ?auto_4528 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4536 - OBJ
      ?auto_4537 - OBJ
      ?auto_4535 - LOCATION
    )
    :vars
    (
      ?auto_4540 - LOCATION
      ?auto_4541 - CITY
      ?auto_4538 - TRUCK
      ?auto_4539 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4537 ?auto_4536 ) ) ( IN-CITY ?auto_4540 ?auto_4541 ) ( IN-CITY ?auto_4535 ?auto_4541 ) ( not ( = ?auto_4535 ?auto_4540 ) ) ( OBJ-AT ?auto_4536 ?auto_4540 ) ( IN-TRUCK ?auto_4537 ?auto_4538 ) ( TRUCK-AT ?auto_4538 ?auto_4539 ) ( IN-CITY ?auto_4539 ?auto_4541 ) ( not ( = ?auto_4535 ?auto_4539 ) ) ( not ( = ?auto_4540 ?auto_4539 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4537 ?auto_4536 ?auto_4535 )
      ( DELIVER-2PKG-VERIFY ?auto_4536 ?auto_4537 ?auto_4535 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4608 - OBJ
      ?auto_4607 - LOCATION
    )
    :vars
    (
      ?auto_4610 - OBJ
      ?auto_4612 - LOCATION
      ?auto_4613 - CITY
      ?auto_4609 - TRUCK
      ?auto_4611 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4608 ?auto_4610 ) ) ( IN-CITY ?auto_4612 ?auto_4613 ) ( IN-CITY ?auto_4607 ?auto_4613 ) ( not ( = ?auto_4607 ?auto_4612 ) ) ( OBJ-AT ?auto_4608 ?auto_4612 ) ( TRUCK-AT ?auto_4609 ?auto_4611 ) ( IN-CITY ?auto_4611 ?auto_4613 ) ( not ( = ?auto_4607 ?auto_4611 ) ) ( not ( = ?auto_4612 ?auto_4611 ) ) ( OBJ-AT ?auto_4610 ?auto_4611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4610 ?auto_4609 ?auto_4611 )
      ( DELIVER-2PKG ?auto_4610 ?auto_4608 ?auto_4607 )
      ( DELIVER-1PKG-VERIFY ?auto_4608 ?auto_4607 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4615 - OBJ
      ?auto_4616 - OBJ
      ?auto_4614 - LOCATION
    )
    :vars
    (
      ?auto_4620 - LOCATION
      ?auto_4617 - CITY
      ?auto_4618 - TRUCK
      ?auto_4619 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4616 ?auto_4615 ) ) ( IN-CITY ?auto_4620 ?auto_4617 ) ( IN-CITY ?auto_4614 ?auto_4617 ) ( not ( = ?auto_4614 ?auto_4620 ) ) ( OBJ-AT ?auto_4616 ?auto_4620 ) ( TRUCK-AT ?auto_4618 ?auto_4619 ) ( IN-CITY ?auto_4619 ?auto_4617 ) ( not ( = ?auto_4614 ?auto_4619 ) ) ( not ( = ?auto_4620 ?auto_4619 ) ) ( OBJ-AT ?auto_4615 ?auto_4619 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4616 ?auto_4614 )
      ( DELIVER-2PKG-VERIFY ?auto_4615 ?auto_4616 ?auto_4614 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4622 - OBJ
      ?auto_4623 - OBJ
      ?auto_4621 - LOCATION
    )
    :vars
    (
      ?auto_4626 - LOCATION
      ?auto_4627 - CITY
      ?auto_4624 - TRUCK
      ?auto_4625 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4623 ?auto_4622 ) ) ( IN-CITY ?auto_4626 ?auto_4627 ) ( IN-CITY ?auto_4621 ?auto_4627 ) ( not ( = ?auto_4621 ?auto_4626 ) ) ( OBJ-AT ?auto_4622 ?auto_4626 ) ( TRUCK-AT ?auto_4624 ?auto_4625 ) ( IN-CITY ?auto_4625 ?auto_4627 ) ( not ( = ?auto_4621 ?auto_4625 ) ) ( not ( = ?auto_4626 ?auto_4625 ) ) ( OBJ-AT ?auto_4623 ?auto_4625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4623 ?auto_4622 ?auto_4621 )
      ( DELIVER-2PKG-VERIFY ?auto_4622 ?auto_4623 ?auto_4621 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4882 - OBJ
      ?auto_4883 - OBJ
      ?auto_4884 - OBJ
      ?auto_4881 - LOCATION
    )
    :vars
    (
      ?auto_4885 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4883 ?auto_4882 ) ) ( not ( = ?auto_4884 ?auto_4882 ) ) ( not ( = ?auto_4884 ?auto_4883 ) ) ( TRUCK-AT ?auto_4885 ?auto_4881 ) ( IN-TRUCK ?auto_4884 ?auto_4885 ) ( OBJ-AT ?auto_4882 ?auto_4881 ) ( OBJ-AT ?auto_4883 ?auto_4881 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4884 ?auto_4881 )
      ( DELIVER-3PKG-VERIFY ?auto_4882 ?auto_4883 ?auto_4884 ?auto_4881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4892 - OBJ
      ?auto_4893 - OBJ
      ?auto_4894 - OBJ
      ?auto_4891 - LOCATION
    )
    :vars
    (
      ?auto_4895 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4893 ?auto_4892 ) ) ( not ( = ?auto_4894 ?auto_4892 ) ) ( not ( = ?auto_4894 ?auto_4893 ) ) ( TRUCK-AT ?auto_4895 ?auto_4891 ) ( IN-TRUCK ?auto_4893 ?auto_4895 ) ( OBJ-AT ?auto_4892 ?auto_4891 ) ( OBJ-AT ?auto_4894 ?auto_4891 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4893 ?auto_4891 )
      ( DELIVER-3PKG-VERIFY ?auto_4892 ?auto_4893 ?auto_4894 ?auto_4891 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4930 - OBJ
      ?auto_4931 - OBJ
      ?auto_4932 - OBJ
      ?auto_4929 - LOCATION
    )
    :vars
    (
      ?auto_4933 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4931 ?auto_4930 ) ) ( not ( = ?auto_4932 ?auto_4930 ) ) ( not ( = ?auto_4932 ?auto_4931 ) ) ( TRUCK-AT ?auto_4933 ?auto_4929 ) ( IN-TRUCK ?auto_4930 ?auto_4933 ) ( OBJ-AT ?auto_4931 ?auto_4929 ) ( OBJ-AT ?auto_4932 ?auto_4929 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4930 ?auto_4929 )
      ( DELIVER-3PKG-VERIFY ?auto_4930 ?auto_4931 ?auto_4932 ?auto_4929 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5006 - OBJ
      ?auto_5007 - OBJ
      ?auto_5008 - OBJ
      ?auto_5005 - LOCATION
    )
    :vars
    (
      ?auto_5010 - TRUCK
      ?auto_5009 - LOCATION
      ?auto_5011 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5007 ?auto_5006 ) ) ( not ( = ?auto_5008 ?auto_5006 ) ) ( not ( = ?auto_5008 ?auto_5007 ) ) ( IN-TRUCK ?auto_5008 ?auto_5010 ) ( TRUCK-AT ?auto_5010 ?auto_5009 ) ( IN-CITY ?auto_5009 ?auto_5011 ) ( IN-CITY ?auto_5005 ?auto_5011 ) ( not ( = ?auto_5005 ?auto_5009 ) ) ( OBJ-AT ?auto_5006 ?auto_5005 ) ( OBJ-AT ?auto_5007 ?auto_5005 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5006 ?auto_5008 ?auto_5005 )
      ( DELIVER-3PKG-VERIFY ?auto_5006 ?auto_5007 ?auto_5008 ?auto_5005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5020 - OBJ
      ?auto_5021 - OBJ
      ?auto_5022 - OBJ
      ?auto_5019 - LOCATION
    )
    :vars
    (
      ?auto_5024 - TRUCK
      ?auto_5023 - LOCATION
      ?auto_5025 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5021 ?auto_5020 ) ) ( not ( = ?auto_5022 ?auto_5020 ) ) ( not ( = ?auto_5022 ?auto_5021 ) ) ( IN-TRUCK ?auto_5021 ?auto_5024 ) ( TRUCK-AT ?auto_5024 ?auto_5023 ) ( IN-CITY ?auto_5023 ?auto_5025 ) ( IN-CITY ?auto_5019 ?auto_5025 ) ( not ( = ?auto_5019 ?auto_5023 ) ) ( OBJ-AT ?auto_5020 ?auto_5019 ) ( OBJ-AT ?auto_5022 ?auto_5019 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5020 ?auto_5021 ?auto_5019 )
      ( DELIVER-3PKG-VERIFY ?auto_5020 ?auto_5021 ?auto_5022 ?auto_5019 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5073 - OBJ
      ?auto_5074 - OBJ
      ?auto_5075 - OBJ
      ?auto_5072 - LOCATION
    )
    :vars
    (
      ?auto_5077 - TRUCK
      ?auto_5076 - LOCATION
      ?auto_5078 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5074 ?auto_5073 ) ) ( not ( = ?auto_5075 ?auto_5073 ) ) ( not ( = ?auto_5075 ?auto_5074 ) ) ( IN-TRUCK ?auto_5073 ?auto_5077 ) ( TRUCK-AT ?auto_5077 ?auto_5076 ) ( IN-CITY ?auto_5076 ?auto_5078 ) ( IN-CITY ?auto_5072 ?auto_5078 ) ( not ( = ?auto_5072 ?auto_5076 ) ) ( OBJ-AT ?auto_5074 ?auto_5072 ) ( OBJ-AT ?auto_5075 ?auto_5072 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5074 ?auto_5073 ?auto_5072 )
      ( DELIVER-3PKG-VERIFY ?auto_5073 ?auto_5074 ?auto_5075 ?auto_5072 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5168 - OBJ
      ?auto_5169 - OBJ
      ?auto_5170 - OBJ
      ?auto_5167 - LOCATION
    )
    :vars
    (
      ?auto_5172 - TRUCK
      ?auto_5173 - LOCATION
      ?auto_5171 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5169 ?auto_5168 ) ) ( not ( = ?auto_5170 ?auto_5168 ) ) ( not ( = ?auto_5170 ?auto_5169 ) ) ( TRUCK-AT ?auto_5172 ?auto_5173 ) ( IN-CITY ?auto_5173 ?auto_5171 ) ( IN-CITY ?auto_5167 ?auto_5171 ) ( not ( = ?auto_5167 ?auto_5173 ) ) ( OBJ-AT ?auto_5168 ?auto_5167 ) ( OBJ-AT ?auto_5170 ?auto_5173 ) ( OBJ-AT ?auto_5169 ?auto_5167 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5168 ?auto_5170 ?auto_5167 )
      ( DELIVER-3PKG-VERIFY ?auto_5168 ?auto_5169 ?auto_5170 ?auto_5167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5182 - OBJ
      ?auto_5183 - OBJ
      ?auto_5184 - OBJ
      ?auto_5181 - LOCATION
    )
    :vars
    (
      ?auto_5186 - TRUCK
      ?auto_5187 - LOCATION
      ?auto_5185 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5183 ?auto_5182 ) ) ( not ( = ?auto_5184 ?auto_5182 ) ) ( not ( = ?auto_5184 ?auto_5183 ) ) ( TRUCK-AT ?auto_5186 ?auto_5187 ) ( IN-CITY ?auto_5187 ?auto_5185 ) ( IN-CITY ?auto_5181 ?auto_5185 ) ( not ( = ?auto_5181 ?auto_5187 ) ) ( OBJ-AT ?auto_5182 ?auto_5181 ) ( OBJ-AT ?auto_5183 ?auto_5187 ) ( OBJ-AT ?auto_5184 ?auto_5181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5182 ?auto_5183 ?auto_5181 )
      ( DELIVER-3PKG-VERIFY ?auto_5182 ?auto_5183 ?auto_5184 ?auto_5181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5235 - OBJ
      ?auto_5236 - OBJ
      ?auto_5237 - OBJ
      ?auto_5234 - LOCATION
    )
    :vars
    (
      ?auto_5239 - TRUCK
      ?auto_5240 - LOCATION
      ?auto_5238 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5236 ?auto_5235 ) ) ( not ( = ?auto_5237 ?auto_5235 ) ) ( not ( = ?auto_5237 ?auto_5236 ) ) ( TRUCK-AT ?auto_5239 ?auto_5240 ) ( IN-CITY ?auto_5240 ?auto_5238 ) ( IN-CITY ?auto_5234 ?auto_5238 ) ( not ( = ?auto_5234 ?auto_5240 ) ) ( OBJ-AT ?auto_5236 ?auto_5234 ) ( OBJ-AT ?auto_5235 ?auto_5240 ) ( OBJ-AT ?auto_5237 ?auto_5234 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5236 ?auto_5235 ?auto_5234 )
      ( DELIVER-3PKG-VERIFY ?auto_5235 ?auto_5236 ?auto_5237 ?auto_5234 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5330 - OBJ
      ?auto_5331 - OBJ
      ?auto_5332 - OBJ
      ?auto_5329 - LOCATION
    )
    :vars
    (
      ?auto_5334 - LOCATION
      ?auto_5333 - CITY
      ?auto_5335 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5331 ?auto_5330 ) ) ( not ( = ?auto_5332 ?auto_5330 ) ) ( not ( = ?auto_5332 ?auto_5331 ) ) ( IN-CITY ?auto_5334 ?auto_5333 ) ( IN-CITY ?auto_5329 ?auto_5333 ) ( not ( = ?auto_5329 ?auto_5334 ) ) ( OBJ-AT ?auto_5330 ?auto_5329 ) ( OBJ-AT ?auto_5332 ?auto_5334 ) ( TRUCK-AT ?auto_5335 ?auto_5329 ) ( OBJ-AT ?auto_5331 ?auto_5329 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5330 ?auto_5332 ?auto_5329 )
      ( DELIVER-3PKG-VERIFY ?auto_5330 ?auto_5331 ?auto_5332 ?auto_5329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5344 - OBJ
      ?auto_5345 - OBJ
      ?auto_5346 - OBJ
      ?auto_5343 - LOCATION
    )
    :vars
    (
      ?auto_5348 - LOCATION
      ?auto_5347 - CITY
      ?auto_5349 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5345 ?auto_5344 ) ) ( not ( = ?auto_5346 ?auto_5344 ) ) ( not ( = ?auto_5346 ?auto_5345 ) ) ( IN-CITY ?auto_5348 ?auto_5347 ) ( IN-CITY ?auto_5343 ?auto_5347 ) ( not ( = ?auto_5343 ?auto_5348 ) ) ( OBJ-AT ?auto_5344 ?auto_5343 ) ( OBJ-AT ?auto_5345 ?auto_5348 ) ( TRUCK-AT ?auto_5349 ?auto_5343 ) ( OBJ-AT ?auto_5346 ?auto_5343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5344 ?auto_5345 ?auto_5343 )
      ( DELIVER-3PKG-VERIFY ?auto_5344 ?auto_5345 ?auto_5346 ?auto_5343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5397 - OBJ
      ?auto_5398 - OBJ
      ?auto_5399 - OBJ
      ?auto_5396 - LOCATION
    )
    :vars
    (
      ?auto_5401 - LOCATION
      ?auto_5400 - CITY
      ?auto_5402 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5398 ?auto_5397 ) ) ( not ( = ?auto_5399 ?auto_5397 ) ) ( not ( = ?auto_5399 ?auto_5398 ) ) ( IN-CITY ?auto_5401 ?auto_5400 ) ( IN-CITY ?auto_5396 ?auto_5400 ) ( not ( = ?auto_5396 ?auto_5401 ) ) ( OBJ-AT ?auto_5398 ?auto_5396 ) ( OBJ-AT ?auto_5397 ?auto_5401 ) ( TRUCK-AT ?auto_5402 ?auto_5396 ) ( OBJ-AT ?auto_5399 ?auto_5396 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5398 ?auto_5397 ?auto_5396 )
      ( DELIVER-3PKG-VERIFY ?auto_5397 ?auto_5398 ?auto_5399 ?auto_5396 ) )
  )

)

