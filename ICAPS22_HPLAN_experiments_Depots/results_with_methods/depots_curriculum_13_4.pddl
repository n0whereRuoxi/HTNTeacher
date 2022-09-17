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
      ?auto_4372 - SURFACE
      ?auto_4373 - SURFACE
    )
    :vars
    (
      ?auto_4374 - HOIST
      ?auto_4375 - PLACE
      ?auto_4377 - PLACE
      ?auto_4378 - HOIST
      ?auto_4379 - SURFACE
      ?auto_4376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4374 ?auto_4375 ) ( SURFACE-AT ?auto_4373 ?auto_4375 ) ( CLEAR ?auto_4373 ) ( IS-CRATE ?auto_4372 ) ( AVAILABLE ?auto_4374 ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( HOIST-AT ?auto_4378 ?auto_4377 ) ( AVAILABLE ?auto_4378 ) ( SURFACE-AT ?auto_4372 ?auto_4377 ) ( ON ?auto_4372 ?auto_4379 ) ( CLEAR ?auto_4372 ) ( TRUCK-AT ?auto_4376 ?auto_4375 ) ( not ( = ?auto_4372 ?auto_4373 ) ) ( not ( = ?auto_4372 ?auto_4379 ) ) ( not ( = ?auto_4373 ?auto_4379 ) ) ( not ( = ?auto_4374 ?auto_4378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4376 ?auto_4375 ?auto_4377 )
      ( !LIFT ?auto_4378 ?auto_4372 ?auto_4379 ?auto_4377 )
      ( !LOAD ?auto_4378 ?auto_4372 ?auto_4376 ?auto_4377 )
      ( !DRIVE ?auto_4376 ?auto_4377 ?auto_4375 )
      ( !UNLOAD ?auto_4374 ?auto_4372 ?auto_4376 ?auto_4375 )
      ( !DROP ?auto_4374 ?auto_4372 ?auto_4373 ?auto_4375 )
      ( MAKE-ON-VERIFY ?auto_4372 ?auto_4373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4382 - SURFACE
      ?auto_4383 - SURFACE
    )
    :vars
    (
      ?auto_4384 - HOIST
      ?auto_4385 - PLACE
      ?auto_4387 - PLACE
      ?auto_4388 - HOIST
      ?auto_4389 - SURFACE
      ?auto_4386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4384 ?auto_4385 ) ( SURFACE-AT ?auto_4383 ?auto_4385 ) ( CLEAR ?auto_4383 ) ( IS-CRATE ?auto_4382 ) ( AVAILABLE ?auto_4384 ) ( not ( = ?auto_4387 ?auto_4385 ) ) ( HOIST-AT ?auto_4388 ?auto_4387 ) ( AVAILABLE ?auto_4388 ) ( SURFACE-AT ?auto_4382 ?auto_4387 ) ( ON ?auto_4382 ?auto_4389 ) ( CLEAR ?auto_4382 ) ( TRUCK-AT ?auto_4386 ?auto_4385 ) ( not ( = ?auto_4382 ?auto_4383 ) ) ( not ( = ?auto_4382 ?auto_4389 ) ) ( not ( = ?auto_4383 ?auto_4389 ) ) ( not ( = ?auto_4384 ?auto_4388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4386 ?auto_4385 ?auto_4387 )
      ( !LIFT ?auto_4388 ?auto_4382 ?auto_4389 ?auto_4387 )
      ( !LOAD ?auto_4388 ?auto_4382 ?auto_4386 ?auto_4387 )
      ( !DRIVE ?auto_4386 ?auto_4387 ?auto_4385 )
      ( !UNLOAD ?auto_4384 ?auto_4382 ?auto_4386 ?auto_4385 )
      ( !DROP ?auto_4384 ?auto_4382 ?auto_4383 ?auto_4385 )
      ( MAKE-ON-VERIFY ?auto_4382 ?auto_4383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4392 - SURFACE
      ?auto_4393 - SURFACE
    )
    :vars
    (
      ?auto_4394 - HOIST
      ?auto_4395 - PLACE
      ?auto_4397 - PLACE
      ?auto_4398 - HOIST
      ?auto_4399 - SURFACE
      ?auto_4396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4394 ?auto_4395 ) ( SURFACE-AT ?auto_4393 ?auto_4395 ) ( CLEAR ?auto_4393 ) ( IS-CRATE ?auto_4392 ) ( AVAILABLE ?auto_4394 ) ( not ( = ?auto_4397 ?auto_4395 ) ) ( HOIST-AT ?auto_4398 ?auto_4397 ) ( AVAILABLE ?auto_4398 ) ( SURFACE-AT ?auto_4392 ?auto_4397 ) ( ON ?auto_4392 ?auto_4399 ) ( CLEAR ?auto_4392 ) ( TRUCK-AT ?auto_4396 ?auto_4395 ) ( not ( = ?auto_4392 ?auto_4393 ) ) ( not ( = ?auto_4392 ?auto_4399 ) ) ( not ( = ?auto_4393 ?auto_4399 ) ) ( not ( = ?auto_4394 ?auto_4398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4396 ?auto_4395 ?auto_4397 )
      ( !LIFT ?auto_4398 ?auto_4392 ?auto_4399 ?auto_4397 )
      ( !LOAD ?auto_4398 ?auto_4392 ?auto_4396 ?auto_4397 )
      ( !DRIVE ?auto_4396 ?auto_4397 ?auto_4395 )
      ( !UNLOAD ?auto_4394 ?auto_4392 ?auto_4396 ?auto_4395 )
      ( !DROP ?auto_4394 ?auto_4392 ?auto_4393 ?auto_4395 )
      ( MAKE-ON-VERIFY ?auto_4392 ?auto_4393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4402 - SURFACE
      ?auto_4403 - SURFACE
    )
    :vars
    (
      ?auto_4404 - HOIST
      ?auto_4405 - PLACE
      ?auto_4407 - PLACE
      ?auto_4408 - HOIST
      ?auto_4409 - SURFACE
      ?auto_4406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4404 ?auto_4405 ) ( SURFACE-AT ?auto_4403 ?auto_4405 ) ( CLEAR ?auto_4403 ) ( IS-CRATE ?auto_4402 ) ( AVAILABLE ?auto_4404 ) ( not ( = ?auto_4407 ?auto_4405 ) ) ( HOIST-AT ?auto_4408 ?auto_4407 ) ( AVAILABLE ?auto_4408 ) ( SURFACE-AT ?auto_4402 ?auto_4407 ) ( ON ?auto_4402 ?auto_4409 ) ( CLEAR ?auto_4402 ) ( TRUCK-AT ?auto_4406 ?auto_4405 ) ( not ( = ?auto_4402 ?auto_4403 ) ) ( not ( = ?auto_4402 ?auto_4409 ) ) ( not ( = ?auto_4403 ?auto_4409 ) ) ( not ( = ?auto_4404 ?auto_4408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4406 ?auto_4405 ?auto_4407 )
      ( !LIFT ?auto_4408 ?auto_4402 ?auto_4409 ?auto_4407 )
      ( !LOAD ?auto_4408 ?auto_4402 ?auto_4406 ?auto_4407 )
      ( !DRIVE ?auto_4406 ?auto_4407 ?auto_4405 )
      ( !UNLOAD ?auto_4404 ?auto_4402 ?auto_4406 ?auto_4405 )
      ( !DROP ?auto_4404 ?auto_4402 ?auto_4403 ?auto_4405 )
      ( MAKE-ON-VERIFY ?auto_4402 ?auto_4403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4412 - SURFACE
      ?auto_4413 - SURFACE
    )
    :vars
    (
      ?auto_4414 - HOIST
      ?auto_4415 - PLACE
      ?auto_4417 - PLACE
      ?auto_4418 - HOIST
      ?auto_4419 - SURFACE
      ?auto_4416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4414 ?auto_4415 ) ( SURFACE-AT ?auto_4413 ?auto_4415 ) ( CLEAR ?auto_4413 ) ( IS-CRATE ?auto_4412 ) ( AVAILABLE ?auto_4414 ) ( not ( = ?auto_4417 ?auto_4415 ) ) ( HOIST-AT ?auto_4418 ?auto_4417 ) ( AVAILABLE ?auto_4418 ) ( SURFACE-AT ?auto_4412 ?auto_4417 ) ( ON ?auto_4412 ?auto_4419 ) ( CLEAR ?auto_4412 ) ( TRUCK-AT ?auto_4416 ?auto_4415 ) ( not ( = ?auto_4412 ?auto_4413 ) ) ( not ( = ?auto_4412 ?auto_4419 ) ) ( not ( = ?auto_4413 ?auto_4419 ) ) ( not ( = ?auto_4414 ?auto_4418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4416 ?auto_4415 ?auto_4417 )
      ( !LIFT ?auto_4418 ?auto_4412 ?auto_4419 ?auto_4417 )
      ( !LOAD ?auto_4418 ?auto_4412 ?auto_4416 ?auto_4417 )
      ( !DRIVE ?auto_4416 ?auto_4417 ?auto_4415 )
      ( !UNLOAD ?auto_4414 ?auto_4412 ?auto_4416 ?auto_4415 )
      ( !DROP ?auto_4414 ?auto_4412 ?auto_4413 ?auto_4415 )
      ( MAKE-ON-VERIFY ?auto_4412 ?auto_4413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4422 - SURFACE
      ?auto_4423 - SURFACE
    )
    :vars
    (
      ?auto_4424 - HOIST
      ?auto_4425 - PLACE
      ?auto_4427 - PLACE
      ?auto_4428 - HOIST
      ?auto_4429 - SURFACE
      ?auto_4426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4424 ?auto_4425 ) ( SURFACE-AT ?auto_4423 ?auto_4425 ) ( CLEAR ?auto_4423 ) ( IS-CRATE ?auto_4422 ) ( AVAILABLE ?auto_4424 ) ( not ( = ?auto_4427 ?auto_4425 ) ) ( HOIST-AT ?auto_4428 ?auto_4427 ) ( AVAILABLE ?auto_4428 ) ( SURFACE-AT ?auto_4422 ?auto_4427 ) ( ON ?auto_4422 ?auto_4429 ) ( CLEAR ?auto_4422 ) ( TRUCK-AT ?auto_4426 ?auto_4425 ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4422 ?auto_4429 ) ) ( not ( = ?auto_4423 ?auto_4429 ) ) ( not ( = ?auto_4424 ?auto_4428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4426 ?auto_4425 ?auto_4427 )
      ( !LIFT ?auto_4428 ?auto_4422 ?auto_4429 ?auto_4427 )
      ( !LOAD ?auto_4428 ?auto_4422 ?auto_4426 ?auto_4427 )
      ( !DRIVE ?auto_4426 ?auto_4427 ?auto_4425 )
      ( !UNLOAD ?auto_4424 ?auto_4422 ?auto_4426 ?auto_4425 )
      ( !DROP ?auto_4424 ?auto_4422 ?auto_4423 ?auto_4425 )
      ( MAKE-ON-VERIFY ?auto_4422 ?auto_4423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4432 - SURFACE
      ?auto_4433 - SURFACE
    )
    :vars
    (
      ?auto_4434 - HOIST
      ?auto_4435 - PLACE
      ?auto_4437 - PLACE
      ?auto_4438 - HOIST
      ?auto_4439 - SURFACE
      ?auto_4436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4434 ?auto_4435 ) ( SURFACE-AT ?auto_4433 ?auto_4435 ) ( CLEAR ?auto_4433 ) ( IS-CRATE ?auto_4432 ) ( AVAILABLE ?auto_4434 ) ( not ( = ?auto_4437 ?auto_4435 ) ) ( HOIST-AT ?auto_4438 ?auto_4437 ) ( AVAILABLE ?auto_4438 ) ( SURFACE-AT ?auto_4432 ?auto_4437 ) ( ON ?auto_4432 ?auto_4439 ) ( CLEAR ?auto_4432 ) ( TRUCK-AT ?auto_4436 ?auto_4435 ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4432 ?auto_4439 ) ) ( not ( = ?auto_4433 ?auto_4439 ) ) ( not ( = ?auto_4434 ?auto_4438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4436 ?auto_4435 ?auto_4437 )
      ( !LIFT ?auto_4438 ?auto_4432 ?auto_4439 ?auto_4437 )
      ( !LOAD ?auto_4438 ?auto_4432 ?auto_4436 ?auto_4437 )
      ( !DRIVE ?auto_4436 ?auto_4437 ?auto_4435 )
      ( !UNLOAD ?auto_4434 ?auto_4432 ?auto_4436 ?auto_4435 )
      ( !DROP ?auto_4434 ?auto_4432 ?auto_4433 ?auto_4435 )
      ( MAKE-ON-VERIFY ?auto_4432 ?auto_4433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4442 - SURFACE
      ?auto_4443 - SURFACE
    )
    :vars
    (
      ?auto_4444 - HOIST
      ?auto_4445 - PLACE
      ?auto_4447 - PLACE
      ?auto_4448 - HOIST
      ?auto_4449 - SURFACE
      ?auto_4446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4444 ?auto_4445 ) ( SURFACE-AT ?auto_4443 ?auto_4445 ) ( CLEAR ?auto_4443 ) ( IS-CRATE ?auto_4442 ) ( AVAILABLE ?auto_4444 ) ( not ( = ?auto_4447 ?auto_4445 ) ) ( HOIST-AT ?auto_4448 ?auto_4447 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4442 ?auto_4447 ) ( ON ?auto_4442 ?auto_4449 ) ( CLEAR ?auto_4442 ) ( TRUCK-AT ?auto_4446 ?auto_4445 ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4443 ?auto_4449 ) ) ( not ( = ?auto_4444 ?auto_4448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4446 ?auto_4445 ?auto_4447 )
      ( !LIFT ?auto_4448 ?auto_4442 ?auto_4449 ?auto_4447 )
      ( !LOAD ?auto_4448 ?auto_4442 ?auto_4446 ?auto_4447 )
      ( !DRIVE ?auto_4446 ?auto_4447 ?auto_4445 )
      ( !UNLOAD ?auto_4444 ?auto_4442 ?auto_4446 ?auto_4445 )
      ( !DROP ?auto_4444 ?auto_4442 ?auto_4443 ?auto_4445 )
      ( MAKE-ON-VERIFY ?auto_4442 ?auto_4443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4452 - SURFACE
      ?auto_4453 - SURFACE
    )
    :vars
    (
      ?auto_4454 - HOIST
      ?auto_4455 - PLACE
      ?auto_4457 - PLACE
      ?auto_4458 - HOIST
      ?auto_4459 - SURFACE
      ?auto_4456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4454 ?auto_4455 ) ( SURFACE-AT ?auto_4453 ?auto_4455 ) ( CLEAR ?auto_4453 ) ( IS-CRATE ?auto_4452 ) ( AVAILABLE ?auto_4454 ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( HOIST-AT ?auto_4458 ?auto_4457 ) ( AVAILABLE ?auto_4458 ) ( SURFACE-AT ?auto_4452 ?auto_4457 ) ( ON ?auto_4452 ?auto_4459 ) ( CLEAR ?auto_4452 ) ( TRUCK-AT ?auto_4456 ?auto_4455 ) ( not ( = ?auto_4452 ?auto_4453 ) ) ( not ( = ?auto_4452 ?auto_4459 ) ) ( not ( = ?auto_4453 ?auto_4459 ) ) ( not ( = ?auto_4454 ?auto_4458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4456 ?auto_4455 ?auto_4457 )
      ( !LIFT ?auto_4458 ?auto_4452 ?auto_4459 ?auto_4457 )
      ( !LOAD ?auto_4458 ?auto_4452 ?auto_4456 ?auto_4457 )
      ( !DRIVE ?auto_4456 ?auto_4457 ?auto_4455 )
      ( !UNLOAD ?auto_4454 ?auto_4452 ?auto_4456 ?auto_4455 )
      ( !DROP ?auto_4454 ?auto_4452 ?auto_4453 ?auto_4455 )
      ( MAKE-ON-VERIFY ?auto_4452 ?auto_4453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4462 - SURFACE
      ?auto_4463 - SURFACE
    )
    :vars
    (
      ?auto_4464 - HOIST
      ?auto_4465 - PLACE
      ?auto_4467 - PLACE
      ?auto_4468 - HOIST
      ?auto_4469 - SURFACE
      ?auto_4466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4464 ?auto_4465 ) ( SURFACE-AT ?auto_4463 ?auto_4465 ) ( CLEAR ?auto_4463 ) ( IS-CRATE ?auto_4462 ) ( AVAILABLE ?auto_4464 ) ( not ( = ?auto_4467 ?auto_4465 ) ) ( HOIST-AT ?auto_4468 ?auto_4467 ) ( AVAILABLE ?auto_4468 ) ( SURFACE-AT ?auto_4462 ?auto_4467 ) ( ON ?auto_4462 ?auto_4469 ) ( CLEAR ?auto_4462 ) ( TRUCK-AT ?auto_4466 ?auto_4465 ) ( not ( = ?auto_4462 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4469 ) ) ( not ( = ?auto_4463 ?auto_4469 ) ) ( not ( = ?auto_4464 ?auto_4468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4466 ?auto_4465 ?auto_4467 )
      ( !LIFT ?auto_4468 ?auto_4462 ?auto_4469 ?auto_4467 )
      ( !LOAD ?auto_4468 ?auto_4462 ?auto_4466 ?auto_4467 )
      ( !DRIVE ?auto_4466 ?auto_4467 ?auto_4465 )
      ( !UNLOAD ?auto_4464 ?auto_4462 ?auto_4466 ?auto_4465 )
      ( !DROP ?auto_4464 ?auto_4462 ?auto_4463 ?auto_4465 )
      ( MAKE-ON-VERIFY ?auto_4462 ?auto_4463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4472 - SURFACE
      ?auto_4473 - SURFACE
    )
    :vars
    (
      ?auto_4474 - HOIST
      ?auto_4475 - PLACE
      ?auto_4477 - PLACE
      ?auto_4478 - HOIST
      ?auto_4479 - SURFACE
      ?auto_4476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4474 ?auto_4475 ) ( SURFACE-AT ?auto_4473 ?auto_4475 ) ( CLEAR ?auto_4473 ) ( IS-CRATE ?auto_4472 ) ( AVAILABLE ?auto_4474 ) ( not ( = ?auto_4477 ?auto_4475 ) ) ( HOIST-AT ?auto_4478 ?auto_4477 ) ( AVAILABLE ?auto_4478 ) ( SURFACE-AT ?auto_4472 ?auto_4477 ) ( ON ?auto_4472 ?auto_4479 ) ( CLEAR ?auto_4472 ) ( TRUCK-AT ?auto_4476 ?auto_4475 ) ( not ( = ?auto_4472 ?auto_4473 ) ) ( not ( = ?auto_4472 ?auto_4479 ) ) ( not ( = ?auto_4473 ?auto_4479 ) ) ( not ( = ?auto_4474 ?auto_4478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4476 ?auto_4475 ?auto_4477 )
      ( !LIFT ?auto_4478 ?auto_4472 ?auto_4479 ?auto_4477 )
      ( !LOAD ?auto_4478 ?auto_4472 ?auto_4476 ?auto_4477 )
      ( !DRIVE ?auto_4476 ?auto_4477 ?auto_4475 )
      ( !UNLOAD ?auto_4474 ?auto_4472 ?auto_4476 ?auto_4475 )
      ( !DROP ?auto_4474 ?auto_4472 ?auto_4473 ?auto_4475 )
      ( MAKE-ON-VERIFY ?auto_4472 ?auto_4473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4482 - SURFACE
      ?auto_4483 - SURFACE
    )
    :vars
    (
      ?auto_4484 - HOIST
      ?auto_4485 - PLACE
      ?auto_4487 - PLACE
      ?auto_4488 - HOIST
      ?auto_4489 - SURFACE
      ?auto_4486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4484 ?auto_4485 ) ( SURFACE-AT ?auto_4483 ?auto_4485 ) ( CLEAR ?auto_4483 ) ( IS-CRATE ?auto_4482 ) ( AVAILABLE ?auto_4484 ) ( not ( = ?auto_4487 ?auto_4485 ) ) ( HOIST-AT ?auto_4488 ?auto_4487 ) ( AVAILABLE ?auto_4488 ) ( SURFACE-AT ?auto_4482 ?auto_4487 ) ( ON ?auto_4482 ?auto_4489 ) ( CLEAR ?auto_4482 ) ( TRUCK-AT ?auto_4486 ?auto_4485 ) ( not ( = ?auto_4482 ?auto_4483 ) ) ( not ( = ?auto_4482 ?auto_4489 ) ) ( not ( = ?auto_4483 ?auto_4489 ) ) ( not ( = ?auto_4484 ?auto_4488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4486 ?auto_4485 ?auto_4487 )
      ( !LIFT ?auto_4488 ?auto_4482 ?auto_4489 ?auto_4487 )
      ( !LOAD ?auto_4488 ?auto_4482 ?auto_4486 ?auto_4487 )
      ( !DRIVE ?auto_4486 ?auto_4487 ?auto_4485 )
      ( !UNLOAD ?auto_4484 ?auto_4482 ?auto_4486 ?auto_4485 )
      ( !DROP ?auto_4484 ?auto_4482 ?auto_4483 ?auto_4485 )
      ( MAKE-ON-VERIFY ?auto_4482 ?auto_4483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4492 - SURFACE
      ?auto_4493 - SURFACE
    )
    :vars
    (
      ?auto_4494 - HOIST
      ?auto_4495 - PLACE
      ?auto_4497 - PLACE
      ?auto_4498 - HOIST
      ?auto_4499 - SURFACE
      ?auto_4496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4494 ?auto_4495 ) ( SURFACE-AT ?auto_4493 ?auto_4495 ) ( CLEAR ?auto_4493 ) ( IS-CRATE ?auto_4492 ) ( AVAILABLE ?auto_4494 ) ( not ( = ?auto_4497 ?auto_4495 ) ) ( HOIST-AT ?auto_4498 ?auto_4497 ) ( AVAILABLE ?auto_4498 ) ( SURFACE-AT ?auto_4492 ?auto_4497 ) ( ON ?auto_4492 ?auto_4499 ) ( CLEAR ?auto_4492 ) ( TRUCK-AT ?auto_4496 ?auto_4495 ) ( not ( = ?auto_4492 ?auto_4493 ) ) ( not ( = ?auto_4492 ?auto_4499 ) ) ( not ( = ?auto_4493 ?auto_4499 ) ) ( not ( = ?auto_4494 ?auto_4498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4496 ?auto_4495 ?auto_4497 )
      ( !LIFT ?auto_4498 ?auto_4492 ?auto_4499 ?auto_4497 )
      ( !LOAD ?auto_4498 ?auto_4492 ?auto_4496 ?auto_4497 )
      ( !DRIVE ?auto_4496 ?auto_4497 ?auto_4495 )
      ( !UNLOAD ?auto_4494 ?auto_4492 ?auto_4496 ?auto_4495 )
      ( !DROP ?auto_4494 ?auto_4492 ?auto_4493 ?auto_4495 )
      ( MAKE-ON-VERIFY ?auto_4492 ?auto_4493 ) )
  )

)

