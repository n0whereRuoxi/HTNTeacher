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

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_4444 ?auto_4445 ) ( SURFACE-AT ?auto_4442 ?auto_4445 ) ( CLEAR ?auto_4442 ) ( IS-CRATE ?auto_4443 ) ( AVAILABLE ?auto_4444 ) ( not ( = ?auto_4447 ?auto_4445 ) ) ( HOIST-AT ?auto_4448 ?auto_4447 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4443 ?auto_4447 ) ( ON ?auto_4443 ?auto_4449 ) ( CLEAR ?auto_4443 ) ( TRUCK-AT ?auto_4446 ?auto_4445 ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4443 ?auto_4449 ) ) ( not ( = ?auto_4444 ?auto_4448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4446 ?auto_4445 ?auto_4447 )
      ( !LIFT ?auto_4448 ?auto_4443 ?auto_4449 ?auto_4447 )
      ( !LOAD ?auto_4448 ?auto_4443 ?auto_4446 ?auto_4447 )
      ( !DRIVE ?auto_4446 ?auto_4447 ?auto_4445 )
      ( !UNLOAD ?auto_4444 ?auto_4443 ?auto_4446 ?auto_4445 )
      ( !DROP ?auto_4444 ?auto_4443 ?auto_4442 ?auto_4445 )
      ( MAKE-1CRATE-VERIFY ?auto_4442 ?auto_4443 ) )
  )

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_4454 ?auto_4455 ) ( SURFACE-AT ?auto_4452 ?auto_4455 ) ( CLEAR ?auto_4452 ) ( IS-CRATE ?auto_4453 ) ( AVAILABLE ?auto_4454 ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( HOIST-AT ?auto_4458 ?auto_4457 ) ( AVAILABLE ?auto_4458 ) ( SURFACE-AT ?auto_4453 ?auto_4457 ) ( ON ?auto_4453 ?auto_4459 ) ( CLEAR ?auto_4453 ) ( TRUCK-AT ?auto_4456 ?auto_4455 ) ( not ( = ?auto_4452 ?auto_4453 ) ) ( not ( = ?auto_4452 ?auto_4459 ) ) ( not ( = ?auto_4453 ?auto_4459 ) ) ( not ( = ?auto_4454 ?auto_4458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4456 ?auto_4455 ?auto_4457 )
      ( !LIFT ?auto_4458 ?auto_4453 ?auto_4459 ?auto_4457 )
      ( !LOAD ?auto_4458 ?auto_4453 ?auto_4456 ?auto_4457 )
      ( !DRIVE ?auto_4456 ?auto_4457 ?auto_4455 )
      ( !UNLOAD ?auto_4454 ?auto_4453 ?auto_4456 ?auto_4455 )
      ( !DROP ?auto_4454 ?auto_4453 ?auto_4452 ?auto_4455 )
      ( MAKE-1CRATE-VERIFY ?auto_4452 ?auto_4453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4463 - SURFACE
      ?auto_4464 - SURFACE
      ?auto_4465 - SURFACE
    )
    :vars
    (
      ?auto_4469 - HOIST
      ?auto_4466 - PLACE
      ?auto_4467 - PLACE
      ?auto_4468 - HOIST
      ?auto_4471 - SURFACE
      ?auto_4472 - SURFACE
      ?auto_4470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4469 ?auto_4466 ) ( IS-CRATE ?auto_4465 ) ( not ( = ?auto_4467 ?auto_4466 ) ) ( HOIST-AT ?auto_4468 ?auto_4467 ) ( SURFACE-AT ?auto_4465 ?auto_4467 ) ( ON ?auto_4465 ?auto_4471 ) ( CLEAR ?auto_4465 ) ( not ( = ?auto_4464 ?auto_4465 ) ) ( not ( = ?auto_4464 ?auto_4471 ) ) ( not ( = ?auto_4465 ?auto_4471 ) ) ( not ( = ?auto_4469 ?auto_4468 ) ) ( SURFACE-AT ?auto_4463 ?auto_4466 ) ( CLEAR ?auto_4463 ) ( IS-CRATE ?auto_4464 ) ( AVAILABLE ?auto_4469 ) ( AVAILABLE ?auto_4468 ) ( SURFACE-AT ?auto_4464 ?auto_4467 ) ( ON ?auto_4464 ?auto_4472 ) ( CLEAR ?auto_4464 ) ( TRUCK-AT ?auto_4470 ?auto_4466 ) ( not ( = ?auto_4463 ?auto_4464 ) ) ( not ( = ?auto_4463 ?auto_4472 ) ) ( not ( = ?auto_4464 ?auto_4472 ) ) ( not ( = ?auto_4463 ?auto_4465 ) ) ( not ( = ?auto_4463 ?auto_4471 ) ) ( not ( = ?auto_4465 ?auto_4472 ) ) ( not ( = ?auto_4471 ?auto_4472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4463 ?auto_4464 )
      ( MAKE-1CRATE ?auto_4464 ?auto_4465 )
      ( MAKE-2CRATE-VERIFY ?auto_4463 ?auto_4464 ?auto_4465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4475 - SURFACE
      ?auto_4476 - SURFACE
    )
    :vars
    (
      ?auto_4477 - HOIST
      ?auto_4478 - PLACE
      ?auto_4480 - PLACE
      ?auto_4481 - HOIST
      ?auto_4482 - SURFACE
      ?auto_4479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4477 ?auto_4478 ) ( SURFACE-AT ?auto_4475 ?auto_4478 ) ( CLEAR ?auto_4475 ) ( IS-CRATE ?auto_4476 ) ( AVAILABLE ?auto_4477 ) ( not ( = ?auto_4480 ?auto_4478 ) ) ( HOIST-AT ?auto_4481 ?auto_4480 ) ( AVAILABLE ?auto_4481 ) ( SURFACE-AT ?auto_4476 ?auto_4480 ) ( ON ?auto_4476 ?auto_4482 ) ( CLEAR ?auto_4476 ) ( TRUCK-AT ?auto_4479 ?auto_4478 ) ( not ( = ?auto_4475 ?auto_4476 ) ) ( not ( = ?auto_4475 ?auto_4482 ) ) ( not ( = ?auto_4476 ?auto_4482 ) ) ( not ( = ?auto_4477 ?auto_4481 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4479 ?auto_4478 ?auto_4480 )
      ( !LIFT ?auto_4481 ?auto_4476 ?auto_4482 ?auto_4480 )
      ( !LOAD ?auto_4481 ?auto_4476 ?auto_4479 ?auto_4480 )
      ( !DRIVE ?auto_4479 ?auto_4480 ?auto_4478 )
      ( !UNLOAD ?auto_4477 ?auto_4476 ?auto_4479 ?auto_4478 )
      ( !DROP ?auto_4477 ?auto_4476 ?auto_4475 ?auto_4478 )
      ( MAKE-1CRATE-VERIFY ?auto_4475 ?auto_4476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4487 - SURFACE
      ?auto_4488 - SURFACE
      ?auto_4489 - SURFACE
      ?auto_4490 - SURFACE
    )
    :vars
    (
      ?auto_4493 - HOIST
      ?auto_4495 - PLACE
      ?auto_4496 - PLACE
      ?auto_4494 - HOIST
      ?auto_4491 - SURFACE
      ?auto_4498 - SURFACE
      ?auto_4497 - SURFACE
      ?auto_4492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4493 ?auto_4495 ) ( IS-CRATE ?auto_4490 ) ( not ( = ?auto_4496 ?auto_4495 ) ) ( HOIST-AT ?auto_4494 ?auto_4496 ) ( SURFACE-AT ?auto_4490 ?auto_4496 ) ( ON ?auto_4490 ?auto_4491 ) ( CLEAR ?auto_4490 ) ( not ( = ?auto_4489 ?auto_4490 ) ) ( not ( = ?auto_4489 ?auto_4491 ) ) ( not ( = ?auto_4490 ?auto_4491 ) ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( IS-CRATE ?auto_4489 ) ( SURFACE-AT ?auto_4489 ?auto_4496 ) ( ON ?auto_4489 ?auto_4498 ) ( CLEAR ?auto_4489 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( not ( = ?auto_4488 ?auto_4498 ) ) ( not ( = ?auto_4489 ?auto_4498 ) ) ( SURFACE-AT ?auto_4487 ?auto_4495 ) ( CLEAR ?auto_4487 ) ( IS-CRATE ?auto_4488 ) ( AVAILABLE ?auto_4493 ) ( AVAILABLE ?auto_4494 ) ( SURFACE-AT ?auto_4488 ?auto_4496 ) ( ON ?auto_4488 ?auto_4497 ) ( CLEAR ?auto_4488 ) ( TRUCK-AT ?auto_4492 ?auto_4495 ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4497 ) ) ( not ( = ?auto_4488 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4498 ) ) ( not ( = ?auto_4489 ?auto_4497 ) ) ( not ( = ?auto_4498 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4490 ) ) ( not ( = ?auto_4487 ?auto_4491 ) ) ( not ( = ?auto_4488 ?auto_4490 ) ) ( not ( = ?auto_4488 ?auto_4491 ) ) ( not ( = ?auto_4490 ?auto_4498 ) ) ( not ( = ?auto_4490 ?auto_4497 ) ) ( not ( = ?auto_4491 ?auto_4498 ) ) ( not ( = ?auto_4491 ?auto_4497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4487 ?auto_4488 ?auto_4489 )
      ( MAKE-1CRATE ?auto_4489 ?auto_4490 )
      ( MAKE-3CRATE-VERIFY ?auto_4487 ?auto_4488 ?auto_4489 ?auto_4490 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4501 - SURFACE
      ?auto_4502 - SURFACE
    )
    :vars
    (
      ?auto_4503 - HOIST
      ?auto_4504 - PLACE
      ?auto_4506 - PLACE
      ?auto_4507 - HOIST
      ?auto_4508 - SURFACE
      ?auto_4505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4503 ?auto_4504 ) ( SURFACE-AT ?auto_4501 ?auto_4504 ) ( CLEAR ?auto_4501 ) ( IS-CRATE ?auto_4502 ) ( AVAILABLE ?auto_4503 ) ( not ( = ?auto_4506 ?auto_4504 ) ) ( HOIST-AT ?auto_4507 ?auto_4506 ) ( AVAILABLE ?auto_4507 ) ( SURFACE-AT ?auto_4502 ?auto_4506 ) ( ON ?auto_4502 ?auto_4508 ) ( CLEAR ?auto_4502 ) ( TRUCK-AT ?auto_4505 ?auto_4504 ) ( not ( = ?auto_4501 ?auto_4502 ) ) ( not ( = ?auto_4501 ?auto_4508 ) ) ( not ( = ?auto_4502 ?auto_4508 ) ) ( not ( = ?auto_4503 ?auto_4507 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4505 ?auto_4504 ?auto_4506 )
      ( !LIFT ?auto_4507 ?auto_4502 ?auto_4508 ?auto_4506 )
      ( !LOAD ?auto_4507 ?auto_4502 ?auto_4505 ?auto_4506 )
      ( !DRIVE ?auto_4505 ?auto_4506 ?auto_4504 )
      ( !UNLOAD ?auto_4503 ?auto_4502 ?auto_4505 ?auto_4504 )
      ( !DROP ?auto_4503 ?auto_4502 ?auto_4501 ?auto_4504 )
      ( MAKE-1CRATE-VERIFY ?auto_4501 ?auto_4502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4514 - SURFACE
      ?auto_4515 - SURFACE
      ?auto_4516 - SURFACE
      ?auto_4517 - SURFACE
      ?auto_4518 - SURFACE
    )
    :vars
    (
      ?auto_4522 - HOIST
      ?auto_4520 - PLACE
      ?auto_4521 - PLACE
      ?auto_4519 - HOIST
      ?auto_4523 - SURFACE
      ?auto_4528 - PLACE
      ?auto_4525 - HOIST
      ?auto_4526 - SURFACE
      ?auto_4529 - SURFACE
      ?auto_4527 - SURFACE
      ?auto_4524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4522 ?auto_4520 ) ( IS-CRATE ?auto_4518 ) ( not ( = ?auto_4521 ?auto_4520 ) ) ( HOIST-AT ?auto_4519 ?auto_4521 ) ( AVAILABLE ?auto_4519 ) ( SURFACE-AT ?auto_4518 ?auto_4521 ) ( ON ?auto_4518 ?auto_4523 ) ( CLEAR ?auto_4518 ) ( not ( = ?auto_4517 ?auto_4518 ) ) ( not ( = ?auto_4517 ?auto_4523 ) ) ( not ( = ?auto_4518 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4519 ) ) ( IS-CRATE ?auto_4517 ) ( not ( = ?auto_4528 ?auto_4520 ) ) ( HOIST-AT ?auto_4525 ?auto_4528 ) ( SURFACE-AT ?auto_4517 ?auto_4528 ) ( ON ?auto_4517 ?auto_4526 ) ( CLEAR ?auto_4517 ) ( not ( = ?auto_4516 ?auto_4517 ) ) ( not ( = ?auto_4516 ?auto_4526 ) ) ( not ( = ?auto_4517 ?auto_4526 ) ) ( not ( = ?auto_4522 ?auto_4525 ) ) ( IS-CRATE ?auto_4516 ) ( SURFACE-AT ?auto_4516 ?auto_4528 ) ( ON ?auto_4516 ?auto_4529 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( not ( = ?auto_4515 ?auto_4529 ) ) ( not ( = ?auto_4516 ?auto_4529 ) ) ( SURFACE-AT ?auto_4514 ?auto_4520 ) ( CLEAR ?auto_4514 ) ( IS-CRATE ?auto_4515 ) ( AVAILABLE ?auto_4522 ) ( AVAILABLE ?auto_4525 ) ( SURFACE-AT ?auto_4515 ?auto_4528 ) ( ON ?auto_4515 ?auto_4527 ) ( CLEAR ?auto_4515 ) ( TRUCK-AT ?auto_4524 ?auto_4520 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4527 ) ) ( not ( = ?auto_4515 ?auto_4527 ) ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4529 ) ) ( not ( = ?auto_4516 ?auto_4527 ) ) ( not ( = ?auto_4529 ?auto_4527 ) ) ( not ( = ?auto_4514 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4526 ) ) ( not ( = ?auto_4515 ?auto_4517 ) ) ( not ( = ?auto_4515 ?auto_4526 ) ) ( not ( = ?auto_4517 ?auto_4529 ) ) ( not ( = ?auto_4517 ?auto_4527 ) ) ( not ( = ?auto_4526 ?auto_4529 ) ) ( not ( = ?auto_4526 ?auto_4527 ) ) ( not ( = ?auto_4514 ?auto_4518 ) ) ( not ( = ?auto_4514 ?auto_4523 ) ) ( not ( = ?auto_4515 ?auto_4518 ) ) ( not ( = ?auto_4515 ?auto_4523 ) ) ( not ( = ?auto_4516 ?auto_4518 ) ) ( not ( = ?auto_4516 ?auto_4523 ) ) ( not ( = ?auto_4518 ?auto_4526 ) ) ( not ( = ?auto_4518 ?auto_4529 ) ) ( not ( = ?auto_4518 ?auto_4527 ) ) ( not ( = ?auto_4521 ?auto_4528 ) ) ( not ( = ?auto_4519 ?auto_4525 ) ) ( not ( = ?auto_4523 ?auto_4526 ) ) ( not ( = ?auto_4523 ?auto_4529 ) ) ( not ( = ?auto_4523 ?auto_4527 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4514 ?auto_4515 ?auto_4516 ?auto_4517 )
      ( MAKE-1CRATE ?auto_4517 ?auto_4518 )
      ( MAKE-4CRATE-VERIFY ?auto_4514 ?auto_4515 ?auto_4516 ?auto_4517 ?auto_4518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4532 - SURFACE
      ?auto_4533 - SURFACE
    )
    :vars
    (
      ?auto_4534 - HOIST
      ?auto_4535 - PLACE
      ?auto_4537 - PLACE
      ?auto_4538 - HOIST
      ?auto_4539 - SURFACE
      ?auto_4536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4534 ?auto_4535 ) ( SURFACE-AT ?auto_4532 ?auto_4535 ) ( CLEAR ?auto_4532 ) ( IS-CRATE ?auto_4533 ) ( AVAILABLE ?auto_4534 ) ( not ( = ?auto_4537 ?auto_4535 ) ) ( HOIST-AT ?auto_4538 ?auto_4537 ) ( AVAILABLE ?auto_4538 ) ( SURFACE-AT ?auto_4533 ?auto_4537 ) ( ON ?auto_4533 ?auto_4539 ) ( CLEAR ?auto_4533 ) ( TRUCK-AT ?auto_4536 ?auto_4535 ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( not ( = ?auto_4532 ?auto_4539 ) ) ( not ( = ?auto_4533 ?auto_4539 ) ) ( not ( = ?auto_4534 ?auto_4538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4536 ?auto_4535 ?auto_4537 )
      ( !LIFT ?auto_4538 ?auto_4533 ?auto_4539 ?auto_4537 )
      ( !LOAD ?auto_4538 ?auto_4533 ?auto_4536 ?auto_4537 )
      ( !DRIVE ?auto_4536 ?auto_4537 ?auto_4535 )
      ( !UNLOAD ?auto_4534 ?auto_4533 ?auto_4536 ?auto_4535 )
      ( !DROP ?auto_4534 ?auto_4533 ?auto_4532 ?auto_4535 )
      ( MAKE-1CRATE-VERIFY ?auto_4532 ?auto_4533 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4546 - SURFACE
      ?auto_4547 - SURFACE
      ?auto_4548 - SURFACE
      ?auto_4549 - SURFACE
      ?auto_4550 - SURFACE
      ?auto_4551 - SURFACE
    )
    :vars
    (
      ?auto_4555 - HOIST
      ?auto_4556 - PLACE
      ?auto_4554 - PLACE
      ?auto_4553 - HOIST
      ?auto_4557 - SURFACE
      ?auto_4558 - PLACE
      ?auto_4564 - HOIST
      ?auto_4565 - SURFACE
      ?auto_4563 - PLACE
      ?auto_4559 - HOIST
      ?auto_4562 - SURFACE
      ?auto_4560 - SURFACE
      ?auto_4561 - SURFACE
      ?auto_4552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4555 ?auto_4556 ) ( IS-CRATE ?auto_4551 ) ( not ( = ?auto_4554 ?auto_4556 ) ) ( HOIST-AT ?auto_4553 ?auto_4554 ) ( AVAILABLE ?auto_4553 ) ( SURFACE-AT ?auto_4551 ?auto_4554 ) ( ON ?auto_4551 ?auto_4557 ) ( CLEAR ?auto_4551 ) ( not ( = ?auto_4550 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4557 ) ) ( not ( = ?auto_4551 ?auto_4557 ) ) ( not ( = ?auto_4555 ?auto_4553 ) ) ( IS-CRATE ?auto_4550 ) ( not ( = ?auto_4558 ?auto_4556 ) ) ( HOIST-AT ?auto_4564 ?auto_4558 ) ( AVAILABLE ?auto_4564 ) ( SURFACE-AT ?auto_4550 ?auto_4558 ) ( ON ?auto_4550 ?auto_4565 ) ( CLEAR ?auto_4550 ) ( not ( = ?auto_4549 ?auto_4550 ) ) ( not ( = ?auto_4549 ?auto_4565 ) ) ( not ( = ?auto_4550 ?auto_4565 ) ) ( not ( = ?auto_4555 ?auto_4564 ) ) ( IS-CRATE ?auto_4549 ) ( not ( = ?auto_4563 ?auto_4556 ) ) ( HOIST-AT ?auto_4559 ?auto_4563 ) ( SURFACE-AT ?auto_4549 ?auto_4563 ) ( ON ?auto_4549 ?auto_4562 ) ( CLEAR ?auto_4549 ) ( not ( = ?auto_4548 ?auto_4549 ) ) ( not ( = ?auto_4548 ?auto_4562 ) ) ( not ( = ?auto_4549 ?auto_4562 ) ) ( not ( = ?auto_4555 ?auto_4559 ) ) ( IS-CRATE ?auto_4548 ) ( SURFACE-AT ?auto_4548 ?auto_4563 ) ( ON ?auto_4548 ?auto_4560 ) ( CLEAR ?auto_4548 ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( not ( = ?auto_4547 ?auto_4560 ) ) ( not ( = ?auto_4548 ?auto_4560 ) ) ( SURFACE-AT ?auto_4546 ?auto_4556 ) ( CLEAR ?auto_4546 ) ( IS-CRATE ?auto_4547 ) ( AVAILABLE ?auto_4555 ) ( AVAILABLE ?auto_4559 ) ( SURFACE-AT ?auto_4547 ?auto_4563 ) ( ON ?auto_4547 ?auto_4561 ) ( CLEAR ?auto_4547 ) ( TRUCK-AT ?auto_4552 ?auto_4556 ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4561 ) ) ( not ( = ?auto_4547 ?auto_4561 ) ) ( not ( = ?auto_4546 ?auto_4548 ) ) ( not ( = ?auto_4546 ?auto_4560 ) ) ( not ( = ?auto_4548 ?auto_4561 ) ) ( not ( = ?auto_4560 ?auto_4561 ) ) ( not ( = ?auto_4546 ?auto_4549 ) ) ( not ( = ?auto_4546 ?auto_4562 ) ) ( not ( = ?auto_4547 ?auto_4549 ) ) ( not ( = ?auto_4547 ?auto_4562 ) ) ( not ( = ?auto_4549 ?auto_4560 ) ) ( not ( = ?auto_4549 ?auto_4561 ) ) ( not ( = ?auto_4562 ?auto_4560 ) ) ( not ( = ?auto_4562 ?auto_4561 ) ) ( not ( = ?auto_4546 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4565 ) ) ( not ( = ?auto_4547 ?auto_4550 ) ) ( not ( = ?auto_4547 ?auto_4565 ) ) ( not ( = ?auto_4548 ?auto_4550 ) ) ( not ( = ?auto_4548 ?auto_4565 ) ) ( not ( = ?auto_4550 ?auto_4562 ) ) ( not ( = ?auto_4550 ?auto_4560 ) ) ( not ( = ?auto_4550 ?auto_4561 ) ) ( not ( = ?auto_4558 ?auto_4563 ) ) ( not ( = ?auto_4564 ?auto_4559 ) ) ( not ( = ?auto_4565 ?auto_4562 ) ) ( not ( = ?auto_4565 ?auto_4560 ) ) ( not ( = ?auto_4565 ?auto_4561 ) ) ( not ( = ?auto_4546 ?auto_4551 ) ) ( not ( = ?auto_4546 ?auto_4557 ) ) ( not ( = ?auto_4547 ?auto_4551 ) ) ( not ( = ?auto_4547 ?auto_4557 ) ) ( not ( = ?auto_4548 ?auto_4551 ) ) ( not ( = ?auto_4548 ?auto_4557 ) ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( not ( = ?auto_4549 ?auto_4557 ) ) ( not ( = ?auto_4551 ?auto_4565 ) ) ( not ( = ?auto_4551 ?auto_4562 ) ) ( not ( = ?auto_4551 ?auto_4560 ) ) ( not ( = ?auto_4551 ?auto_4561 ) ) ( not ( = ?auto_4554 ?auto_4558 ) ) ( not ( = ?auto_4554 ?auto_4563 ) ) ( not ( = ?auto_4553 ?auto_4564 ) ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( not ( = ?auto_4557 ?auto_4565 ) ) ( not ( = ?auto_4557 ?auto_4562 ) ) ( not ( = ?auto_4557 ?auto_4560 ) ) ( not ( = ?auto_4557 ?auto_4561 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4546 ?auto_4547 ?auto_4548 ?auto_4549 ?auto_4550 )
      ( MAKE-1CRATE ?auto_4550 ?auto_4551 )
      ( MAKE-5CRATE-VERIFY ?auto_4546 ?auto_4547 ?auto_4548 ?auto_4549 ?auto_4550 ?auto_4551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4568 - SURFACE
      ?auto_4569 - SURFACE
    )
    :vars
    (
      ?auto_4570 - HOIST
      ?auto_4571 - PLACE
      ?auto_4573 - PLACE
      ?auto_4574 - HOIST
      ?auto_4575 - SURFACE
      ?auto_4572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4570 ?auto_4571 ) ( SURFACE-AT ?auto_4568 ?auto_4571 ) ( CLEAR ?auto_4568 ) ( IS-CRATE ?auto_4569 ) ( AVAILABLE ?auto_4570 ) ( not ( = ?auto_4573 ?auto_4571 ) ) ( HOIST-AT ?auto_4574 ?auto_4573 ) ( AVAILABLE ?auto_4574 ) ( SURFACE-AT ?auto_4569 ?auto_4573 ) ( ON ?auto_4569 ?auto_4575 ) ( CLEAR ?auto_4569 ) ( TRUCK-AT ?auto_4572 ?auto_4571 ) ( not ( = ?auto_4568 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4575 ) ) ( not ( = ?auto_4569 ?auto_4575 ) ) ( not ( = ?auto_4570 ?auto_4574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4572 ?auto_4571 ?auto_4573 )
      ( !LIFT ?auto_4574 ?auto_4569 ?auto_4575 ?auto_4573 )
      ( !LOAD ?auto_4574 ?auto_4569 ?auto_4572 ?auto_4573 )
      ( !DRIVE ?auto_4572 ?auto_4573 ?auto_4571 )
      ( !UNLOAD ?auto_4570 ?auto_4569 ?auto_4572 ?auto_4571 )
      ( !DROP ?auto_4570 ?auto_4569 ?auto_4568 ?auto_4571 )
      ( MAKE-1CRATE-VERIFY ?auto_4568 ?auto_4569 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4583 - SURFACE
      ?auto_4584 - SURFACE
      ?auto_4585 - SURFACE
      ?auto_4586 - SURFACE
      ?auto_4587 - SURFACE
      ?auto_4589 - SURFACE
      ?auto_4588 - SURFACE
    )
    :vars
    (
      ?auto_4591 - HOIST
      ?auto_4590 - PLACE
      ?auto_4592 - PLACE
      ?auto_4595 - HOIST
      ?auto_4594 - SURFACE
      ?auto_4600 - PLACE
      ?auto_4604 - HOIST
      ?auto_4599 - SURFACE
      ?auto_4598 - PLACE
      ?auto_4605 - HOIST
      ?auto_4601 - SURFACE
      ?auto_4596 - PLACE
      ?auto_4597 - HOIST
      ?auto_4606 - SURFACE
      ?auto_4602 - SURFACE
      ?auto_4603 - SURFACE
      ?auto_4593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4591 ?auto_4590 ) ( IS-CRATE ?auto_4588 ) ( not ( = ?auto_4592 ?auto_4590 ) ) ( HOIST-AT ?auto_4595 ?auto_4592 ) ( AVAILABLE ?auto_4595 ) ( SURFACE-AT ?auto_4588 ?auto_4592 ) ( ON ?auto_4588 ?auto_4594 ) ( CLEAR ?auto_4588 ) ( not ( = ?auto_4589 ?auto_4588 ) ) ( not ( = ?auto_4589 ?auto_4594 ) ) ( not ( = ?auto_4588 ?auto_4594 ) ) ( not ( = ?auto_4591 ?auto_4595 ) ) ( IS-CRATE ?auto_4589 ) ( not ( = ?auto_4600 ?auto_4590 ) ) ( HOIST-AT ?auto_4604 ?auto_4600 ) ( AVAILABLE ?auto_4604 ) ( SURFACE-AT ?auto_4589 ?auto_4600 ) ( ON ?auto_4589 ?auto_4599 ) ( CLEAR ?auto_4589 ) ( not ( = ?auto_4587 ?auto_4589 ) ) ( not ( = ?auto_4587 ?auto_4599 ) ) ( not ( = ?auto_4589 ?auto_4599 ) ) ( not ( = ?auto_4591 ?auto_4604 ) ) ( IS-CRATE ?auto_4587 ) ( not ( = ?auto_4598 ?auto_4590 ) ) ( HOIST-AT ?auto_4605 ?auto_4598 ) ( AVAILABLE ?auto_4605 ) ( SURFACE-AT ?auto_4587 ?auto_4598 ) ( ON ?auto_4587 ?auto_4601 ) ( CLEAR ?auto_4587 ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( not ( = ?auto_4586 ?auto_4601 ) ) ( not ( = ?auto_4587 ?auto_4601 ) ) ( not ( = ?auto_4591 ?auto_4605 ) ) ( IS-CRATE ?auto_4586 ) ( not ( = ?auto_4596 ?auto_4590 ) ) ( HOIST-AT ?auto_4597 ?auto_4596 ) ( SURFACE-AT ?auto_4586 ?auto_4596 ) ( ON ?auto_4586 ?auto_4606 ) ( CLEAR ?auto_4586 ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4606 ) ) ( not ( = ?auto_4586 ?auto_4606 ) ) ( not ( = ?auto_4591 ?auto_4597 ) ) ( IS-CRATE ?auto_4585 ) ( SURFACE-AT ?auto_4585 ?auto_4596 ) ( ON ?auto_4585 ?auto_4602 ) ( CLEAR ?auto_4585 ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4602 ) ) ( not ( = ?auto_4585 ?auto_4602 ) ) ( SURFACE-AT ?auto_4583 ?auto_4590 ) ( CLEAR ?auto_4583 ) ( IS-CRATE ?auto_4584 ) ( AVAILABLE ?auto_4591 ) ( AVAILABLE ?auto_4597 ) ( SURFACE-AT ?auto_4584 ?auto_4596 ) ( ON ?auto_4584 ?auto_4603 ) ( CLEAR ?auto_4584 ) ( TRUCK-AT ?auto_4593 ?auto_4590 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4603 ) ) ( not ( = ?auto_4584 ?auto_4603 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4602 ) ) ( not ( = ?auto_4585 ?auto_4603 ) ) ( not ( = ?auto_4602 ?auto_4603 ) ) ( not ( = ?auto_4583 ?auto_4586 ) ) ( not ( = ?auto_4583 ?auto_4606 ) ) ( not ( = ?auto_4584 ?auto_4586 ) ) ( not ( = ?auto_4584 ?auto_4606 ) ) ( not ( = ?auto_4586 ?auto_4602 ) ) ( not ( = ?auto_4586 ?auto_4603 ) ) ( not ( = ?auto_4606 ?auto_4602 ) ) ( not ( = ?auto_4606 ?auto_4603 ) ) ( not ( = ?auto_4583 ?auto_4587 ) ) ( not ( = ?auto_4583 ?auto_4601 ) ) ( not ( = ?auto_4584 ?auto_4587 ) ) ( not ( = ?auto_4584 ?auto_4601 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4601 ) ) ( not ( = ?auto_4587 ?auto_4606 ) ) ( not ( = ?auto_4587 ?auto_4602 ) ) ( not ( = ?auto_4587 ?auto_4603 ) ) ( not ( = ?auto_4598 ?auto_4596 ) ) ( not ( = ?auto_4605 ?auto_4597 ) ) ( not ( = ?auto_4601 ?auto_4606 ) ) ( not ( = ?auto_4601 ?auto_4602 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4583 ?auto_4599 ) ) ( not ( = ?auto_4584 ?auto_4589 ) ) ( not ( = ?auto_4584 ?auto_4599 ) ) ( not ( = ?auto_4585 ?auto_4589 ) ) ( not ( = ?auto_4585 ?auto_4599 ) ) ( not ( = ?auto_4586 ?auto_4589 ) ) ( not ( = ?auto_4586 ?auto_4599 ) ) ( not ( = ?auto_4589 ?auto_4601 ) ) ( not ( = ?auto_4589 ?auto_4606 ) ) ( not ( = ?auto_4589 ?auto_4602 ) ) ( not ( = ?auto_4589 ?auto_4603 ) ) ( not ( = ?auto_4600 ?auto_4598 ) ) ( not ( = ?auto_4600 ?auto_4596 ) ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4604 ?auto_4597 ) ) ( not ( = ?auto_4599 ?auto_4601 ) ) ( not ( = ?auto_4599 ?auto_4606 ) ) ( not ( = ?auto_4599 ?auto_4602 ) ) ( not ( = ?auto_4599 ?auto_4603 ) ) ( not ( = ?auto_4583 ?auto_4588 ) ) ( not ( = ?auto_4583 ?auto_4594 ) ) ( not ( = ?auto_4584 ?auto_4588 ) ) ( not ( = ?auto_4584 ?auto_4594 ) ) ( not ( = ?auto_4585 ?auto_4588 ) ) ( not ( = ?auto_4585 ?auto_4594 ) ) ( not ( = ?auto_4586 ?auto_4588 ) ) ( not ( = ?auto_4586 ?auto_4594 ) ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( not ( = ?auto_4587 ?auto_4594 ) ) ( not ( = ?auto_4588 ?auto_4599 ) ) ( not ( = ?auto_4588 ?auto_4601 ) ) ( not ( = ?auto_4588 ?auto_4606 ) ) ( not ( = ?auto_4588 ?auto_4602 ) ) ( not ( = ?auto_4588 ?auto_4603 ) ) ( not ( = ?auto_4592 ?auto_4600 ) ) ( not ( = ?auto_4592 ?auto_4598 ) ) ( not ( = ?auto_4592 ?auto_4596 ) ) ( not ( = ?auto_4595 ?auto_4604 ) ) ( not ( = ?auto_4595 ?auto_4605 ) ) ( not ( = ?auto_4595 ?auto_4597 ) ) ( not ( = ?auto_4594 ?auto_4599 ) ) ( not ( = ?auto_4594 ?auto_4601 ) ) ( not ( = ?auto_4594 ?auto_4606 ) ) ( not ( = ?auto_4594 ?auto_4602 ) ) ( not ( = ?auto_4594 ?auto_4603 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4586 ?auto_4587 ?auto_4589 )
      ( MAKE-1CRATE ?auto_4589 ?auto_4588 )
      ( MAKE-6CRATE-VERIFY ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4586 ?auto_4587 ?auto_4589 ?auto_4588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4609 - SURFACE
      ?auto_4610 - SURFACE
    )
    :vars
    (
      ?auto_4611 - HOIST
      ?auto_4612 - PLACE
      ?auto_4614 - PLACE
      ?auto_4615 - HOIST
      ?auto_4616 - SURFACE
      ?auto_4613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4611 ?auto_4612 ) ( SURFACE-AT ?auto_4609 ?auto_4612 ) ( CLEAR ?auto_4609 ) ( IS-CRATE ?auto_4610 ) ( AVAILABLE ?auto_4611 ) ( not ( = ?auto_4614 ?auto_4612 ) ) ( HOIST-AT ?auto_4615 ?auto_4614 ) ( AVAILABLE ?auto_4615 ) ( SURFACE-AT ?auto_4610 ?auto_4614 ) ( ON ?auto_4610 ?auto_4616 ) ( CLEAR ?auto_4610 ) ( TRUCK-AT ?auto_4613 ?auto_4612 ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( not ( = ?auto_4609 ?auto_4616 ) ) ( not ( = ?auto_4610 ?auto_4616 ) ) ( not ( = ?auto_4611 ?auto_4615 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4613 ?auto_4612 ?auto_4614 )
      ( !LIFT ?auto_4615 ?auto_4610 ?auto_4616 ?auto_4614 )
      ( !LOAD ?auto_4615 ?auto_4610 ?auto_4613 ?auto_4614 )
      ( !DRIVE ?auto_4613 ?auto_4614 ?auto_4612 )
      ( !UNLOAD ?auto_4611 ?auto_4610 ?auto_4613 ?auto_4612 )
      ( !DROP ?auto_4611 ?auto_4610 ?auto_4609 ?auto_4612 )
      ( MAKE-1CRATE-VERIFY ?auto_4609 ?auto_4610 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4625 - SURFACE
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
      ?auto_4628 - SURFACE
      ?auto_4629 - SURFACE
      ?auto_4631 - SURFACE
      ?auto_4630 - SURFACE
      ?auto_4632 - SURFACE
    )
    :vars
    (
      ?auto_4638 - HOIST
      ?auto_4637 - PLACE
      ?auto_4635 - PLACE
      ?auto_4633 - HOIST
      ?auto_4634 - SURFACE
      ?auto_4640 - PLACE
      ?auto_4642 - HOIST
      ?auto_4643 - SURFACE
      ?auto_4650 - PLACE
      ?auto_4644 - HOIST
      ?auto_4641 - SURFACE
      ?auto_4639 - PLACE
      ?auto_4646 - HOIST
      ?auto_4649 - SURFACE
      ?auto_4645 - SURFACE
      ?auto_4648 - SURFACE
      ?auto_4647 - SURFACE
      ?auto_4636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4638 ?auto_4637 ) ( IS-CRATE ?auto_4632 ) ( not ( = ?auto_4635 ?auto_4637 ) ) ( HOIST-AT ?auto_4633 ?auto_4635 ) ( SURFACE-AT ?auto_4632 ?auto_4635 ) ( ON ?auto_4632 ?auto_4634 ) ( CLEAR ?auto_4632 ) ( not ( = ?auto_4630 ?auto_4632 ) ) ( not ( = ?auto_4630 ?auto_4634 ) ) ( not ( = ?auto_4632 ?auto_4634 ) ) ( not ( = ?auto_4638 ?auto_4633 ) ) ( IS-CRATE ?auto_4630 ) ( not ( = ?auto_4640 ?auto_4637 ) ) ( HOIST-AT ?auto_4642 ?auto_4640 ) ( AVAILABLE ?auto_4642 ) ( SURFACE-AT ?auto_4630 ?auto_4640 ) ( ON ?auto_4630 ?auto_4643 ) ( CLEAR ?auto_4630 ) ( not ( = ?auto_4631 ?auto_4630 ) ) ( not ( = ?auto_4631 ?auto_4643 ) ) ( not ( = ?auto_4630 ?auto_4643 ) ) ( not ( = ?auto_4638 ?auto_4642 ) ) ( IS-CRATE ?auto_4631 ) ( not ( = ?auto_4650 ?auto_4637 ) ) ( HOIST-AT ?auto_4644 ?auto_4650 ) ( AVAILABLE ?auto_4644 ) ( SURFACE-AT ?auto_4631 ?auto_4650 ) ( ON ?auto_4631 ?auto_4641 ) ( CLEAR ?auto_4631 ) ( not ( = ?auto_4629 ?auto_4631 ) ) ( not ( = ?auto_4629 ?auto_4641 ) ) ( not ( = ?auto_4631 ?auto_4641 ) ) ( not ( = ?auto_4638 ?auto_4644 ) ) ( IS-CRATE ?auto_4629 ) ( not ( = ?auto_4639 ?auto_4637 ) ) ( HOIST-AT ?auto_4646 ?auto_4639 ) ( AVAILABLE ?auto_4646 ) ( SURFACE-AT ?auto_4629 ?auto_4639 ) ( ON ?auto_4629 ?auto_4649 ) ( CLEAR ?auto_4629 ) ( not ( = ?auto_4628 ?auto_4629 ) ) ( not ( = ?auto_4628 ?auto_4649 ) ) ( not ( = ?auto_4629 ?auto_4649 ) ) ( not ( = ?auto_4638 ?auto_4646 ) ) ( IS-CRATE ?auto_4628 ) ( SURFACE-AT ?auto_4628 ?auto_4635 ) ( ON ?auto_4628 ?auto_4645 ) ( CLEAR ?auto_4628 ) ( not ( = ?auto_4627 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4645 ) ) ( not ( = ?auto_4628 ?auto_4645 ) ) ( IS-CRATE ?auto_4627 ) ( SURFACE-AT ?auto_4627 ?auto_4635 ) ( ON ?auto_4627 ?auto_4648 ) ( CLEAR ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4648 ) ) ( not ( = ?auto_4627 ?auto_4648 ) ) ( SURFACE-AT ?auto_4625 ?auto_4637 ) ( CLEAR ?auto_4625 ) ( IS-CRATE ?auto_4626 ) ( AVAILABLE ?auto_4638 ) ( AVAILABLE ?auto_4633 ) ( SURFACE-AT ?auto_4626 ?auto_4635 ) ( ON ?auto_4626 ?auto_4647 ) ( CLEAR ?auto_4626 ) ( TRUCK-AT ?auto_4636 ?auto_4637 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4647 ) ) ( not ( = ?auto_4626 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4648 ) ) ( not ( = ?auto_4627 ?auto_4647 ) ) ( not ( = ?auto_4648 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4628 ) ) ( not ( = ?auto_4625 ?auto_4645 ) ) ( not ( = ?auto_4626 ?auto_4628 ) ) ( not ( = ?auto_4626 ?auto_4645 ) ) ( not ( = ?auto_4628 ?auto_4648 ) ) ( not ( = ?auto_4628 ?auto_4647 ) ) ( not ( = ?auto_4645 ?auto_4648 ) ) ( not ( = ?auto_4645 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4629 ) ) ( not ( = ?auto_4625 ?auto_4649 ) ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4626 ?auto_4649 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4649 ) ) ( not ( = ?auto_4629 ?auto_4645 ) ) ( not ( = ?auto_4629 ?auto_4648 ) ) ( not ( = ?auto_4629 ?auto_4647 ) ) ( not ( = ?auto_4639 ?auto_4635 ) ) ( not ( = ?auto_4646 ?auto_4633 ) ) ( not ( = ?auto_4649 ?auto_4645 ) ) ( not ( = ?auto_4649 ?auto_4648 ) ) ( not ( = ?auto_4649 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4631 ) ) ( not ( = ?auto_4625 ?auto_4641 ) ) ( not ( = ?auto_4626 ?auto_4631 ) ) ( not ( = ?auto_4626 ?auto_4641 ) ) ( not ( = ?auto_4627 ?auto_4631 ) ) ( not ( = ?auto_4627 ?auto_4641 ) ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( not ( = ?auto_4628 ?auto_4641 ) ) ( not ( = ?auto_4631 ?auto_4649 ) ) ( not ( = ?auto_4631 ?auto_4645 ) ) ( not ( = ?auto_4631 ?auto_4648 ) ) ( not ( = ?auto_4631 ?auto_4647 ) ) ( not ( = ?auto_4650 ?auto_4639 ) ) ( not ( = ?auto_4650 ?auto_4635 ) ) ( not ( = ?auto_4644 ?auto_4646 ) ) ( not ( = ?auto_4644 ?auto_4633 ) ) ( not ( = ?auto_4641 ?auto_4649 ) ) ( not ( = ?auto_4641 ?auto_4645 ) ) ( not ( = ?auto_4641 ?auto_4648 ) ) ( not ( = ?auto_4641 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4630 ) ) ( not ( = ?auto_4625 ?auto_4643 ) ) ( not ( = ?auto_4626 ?auto_4630 ) ) ( not ( = ?auto_4626 ?auto_4643 ) ) ( not ( = ?auto_4627 ?auto_4630 ) ) ( not ( = ?auto_4627 ?auto_4643 ) ) ( not ( = ?auto_4628 ?auto_4630 ) ) ( not ( = ?auto_4628 ?auto_4643 ) ) ( not ( = ?auto_4629 ?auto_4630 ) ) ( not ( = ?auto_4629 ?auto_4643 ) ) ( not ( = ?auto_4630 ?auto_4641 ) ) ( not ( = ?auto_4630 ?auto_4649 ) ) ( not ( = ?auto_4630 ?auto_4645 ) ) ( not ( = ?auto_4630 ?auto_4648 ) ) ( not ( = ?auto_4630 ?auto_4647 ) ) ( not ( = ?auto_4640 ?auto_4650 ) ) ( not ( = ?auto_4640 ?auto_4639 ) ) ( not ( = ?auto_4640 ?auto_4635 ) ) ( not ( = ?auto_4642 ?auto_4644 ) ) ( not ( = ?auto_4642 ?auto_4646 ) ) ( not ( = ?auto_4642 ?auto_4633 ) ) ( not ( = ?auto_4643 ?auto_4641 ) ) ( not ( = ?auto_4643 ?auto_4649 ) ) ( not ( = ?auto_4643 ?auto_4645 ) ) ( not ( = ?auto_4643 ?auto_4648 ) ) ( not ( = ?auto_4643 ?auto_4647 ) ) ( not ( = ?auto_4625 ?auto_4632 ) ) ( not ( = ?auto_4625 ?auto_4634 ) ) ( not ( = ?auto_4626 ?auto_4632 ) ) ( not ( = ?auto_4626 ?auto_4634 ) ) ( not ( = ?auto_4627 ?auto_4632 ) ) ( not ( = ?auto_4627 ?auto_4634 ) ) ( not ( = ?auto_4628 ?auto_4632 ) ) ( not ( = ?auto_4628 ?auto_4634 ) ) ( not ( = ?auto_4629 ?auto_4632 ) ) ( not ( = ?auto_4629 ?auto_4634 ) ) ( not ( = ?auto_4631 ?auto_4632 ) ) ( not ( = ?auto_4631 ?auto_4634 ) ) ( not ( = ?auto_4632 ?auto_4643 ) ) ( not ( = ?auto_4632 ?auto_4641 ) ) ( not ( = ?auto_4632 ?auto_4649 ) ) ( not ( = ?auto_4632 ?auto_4645 ) ) ( not ( = ?auto_4632 ?auto_4648 ) ) ( not ( = ?auto_4632 ?auto_4647 ) ) ( not ( = ?auto_4634 ?auto_4643 ) ) ( not ( = ?auto_4634 ?auto_4641 ) ) ( not ( = ?auto_4634 ?auto_4649 ) ) ( not ( = ?auto_4634 ?auto_4645 ) ) ( not ( = ?auto_4634 ?auto_4648 ) ) ( not ( = ?auto_4634 ?auto_4647 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4628 ?auto_4629 ?auto_4631 ?auto_4630 )
      ( MAKE-1CRATE ?auto_4630 ?auto_4632 )
      ( MAKE-7CRATE-VERIFY ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4628 ?auto_4629 ?auto_4631 ?auto_4630 ?auto_4632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4653 - SURFACE
      ?auto_4654 - SURFACE
    )
    :vars
    (
      ?auto_4655 - HOIST
      ?auto_4656 - PLACE
      ?auto_4658 - PLACE
      ?auto_4659 - HOIST
      ?auto_4660 - SURFACE
      ?auto_4657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4655 ?auto_4656 ) ( SURFACE-AT ?auto_4653 ?auto_4656 ) ( CLEAR ?auto_4653 ) ( IS-CRATE ?auto_4654 ) ( AVAILABLE ?auto_4655 ) ( not ( = ?auto_4658 ?auto_4656 ) ) ( HOIST-AT ?auto_4659 ?auto_4658 ) ( AVAILABLE ?auto_4659 ) ( SURFACE-AT ?auto_4654 ?auto_4658 ) ( ON ?auto_4654 ?auto_4660 ) ( CLEAR ?auto_4654 ) ( TRUCK-AT ?auto_4657 ?auto_4656 ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4660 ) ) ( not ( = ?auto_4654 ?auto_4660 ) ) ( not ( = ?auto_4655 ?auto_4659 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4657 ?auto_4656 ?auto_4658 )
      ( !LIFT ?auto_4659 ?auto_4654 ?auto_4660 ?auto_4658 )
      ( !LOAD ?auto_4659 ?auto_4654 ?auto_4657 ?auto_4658 )
      ( !DRIVE ?auto_4657 ?auto_4658 ?auto_4656 )
      ( !UNLOAD ?auto_4655 ?auto_4654 ?auto_4657 ?auto_4656 )
      ( !DROP ?auto_4655 ?auto_4654 ?auto_4653 ?auto_4656 )
      ( MAKE-1CRATE-VERIFY ?auto_4653 ?auto_4654 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4670 - SURFACE
      ?auto_4671 - SURFACE
      ?auto_4672 - SURFACE
      ?auto_4673 - SURFACE
      ?auto_4674 - SURFACE
      ?auto_4676 - SURFACE
      ?auto_4675 - SURFACE
      ?auto_4678 - SURFACE
      ?auto_4677 - SURFACE
    )
    :vars
    (
      ?auto_4684 - HOIST
      ?auto_4682 - PLACE
      ?auto_4680 - PLACE
      ?auto_4681 - HOIST
      ?auto_4683 - SURFACE
      ?auto_4688 - PLACE
      ?auto_4689 - HOIST
      ?auto_4687 - SURFACE
      ?auto_4696 - SURFACE
      ?auto_4692 - PLACE
      ?auto_4695 - HOIST
      ?auto_4685 - SURFACE
      ?auto_4686 - PLACE
      ?auto_4693 - HOIST
      ?auto_4690 - SURFACE
      ?auto_4694 - SURFACE
      ?auto_4691 - SURFACE
      ?auto_4697 - SURFACE
      ?auto_4679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4684 ?auto_4682 ) ( IS-CRATE ?auto_4677 ) ( not ( = ?auto_4680 ?auto_4682 ) ) ( HOIST-AT ?auto_4681 ?auto_4680 ) ( SURFACE-AT ?auto_4677 ?auto_4680 ) ( ON ?auto_4677 ?auto_4683 ) ( CLEAR ?auto_4677 ) ( not ( = ?auto_4678 ?auto_4677 ) ) ( not ( = ?auto_4678 ?auto_4683 ) ) ( not ( = ?auto_4677 ?auto_4683 ) ) ( not ( = ?auto_4684 ?auto_4681 ) ) ( IS-CRATE ?auto_4678 ) ( not ( = ?auto_4688 ?auto_4682 ) ) ( HOIST-AT ?auto_4689 ?auto_4688 ) ( SURFACE-AT ?auto_4678 ?auto_4688 ) ( ON ?auto_4678 ?auto_4687 ) ( CLEAR ?auto_4678 ) ( not ( = ?auto_4675 ?auto_4678 ) ) ( not ( = ?auto_4675 ?auto_4687 ) ) ( not ( = ?auto_4678 ?auto_4687 ) ) ( not ( = ?auto_4684 ?auto_4689 ) ) ( IS-CRATE ?auto_4675 ) ( AVAILABLE ?auto_4681 ) ( SURFACE-AT ?auto_4675 ?auto_4680 ) ( ON ?auto_4675 ?auto_4696 ) ( CLEAR ?auto_4675 ) ( not ( = ?auto_4676 ?auto_4675 ) ) ( not ( = ?auto_4676 ?auto_4696 ) ) ( not ( = ?auto_4675 ?auto_4696 ) ) ( IS-CRATE ?auto_4676 ) ( not ( = ?auto_4692 ?auto_4682 ) ) ( HOIST-AT ?auto_4695 ?auto_4692 ) ( AVAILABLE ?auto_4695 ) ( SURFACE-AT ?auto_4676 ?auto_4692 ) ( ON ?auto_4676 ?auto_4685 ) ( CLEAR ?auto_4676 ) ( not ( = ?auto_4674 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4685 ) ) ( not ( = ?auto_4676 ?auto_4685 ) ) ( not ( = ?auto_4684 ?auto_4695 ) ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4686 ?auto_4682 ) ) ( HOIST-AT ?auto_4693 ?auto_4686 ) ( AVAILABLE ?auto_4693 ) ( SURFACE-AT ?auto_4674 ?auto_4686 ) ( ON ?auto_4674 ?auto_4690 ) ( CLEAR ?auto_4674 ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4690 ) ) ( not ( = ?auto_4674 ?auto_4690 ) ) ( not ( = ?auto_4684 ?auto_4693 ) ) ( IS-CRATE ?auto_4673 ) ( SURFACE-AT ?auto_4673 ?auto_4688 ) ( ON ?auto_4673 ?auto_4694 ) ( CLEAR ?auto_4673 ) ( not ( = ?auto_4672 ?auto_4673 ) ) ( not ( = ?auto_4672 ?auto_4694 ) ) ( not ( = ?auto_4673 ?auto_4694 ) ) ( IS-CRATE ?auto_4672 ) ( SURFACE-AT ?auto_4672 ?auto_4688 ) ( ON ?auto_4672 ?auto_4691 ) ( CLEAR ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4691 ) ) ( not ( = ?auto_4672 ?auto_4691 ) ) ( SURFACE-AT ?auto_4670 ?auto_4682 ) ( CLEAR ?auto_4670 ) ( IS-CRATE ?auto_4671 ) ( AVAILABLE ?auto_4684 ) ( AVAILABLE ?auto_4689 ) ( SURFACE-AT ?auto_4671 ?auto_4688 ) ( ON ?auto_4671 ?auto_4697 ) ( CLEAR ?auto_4671 ) ( TRUCK-AT ?auto_4679 ?auto_4682 ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4697 ) ) ( not ( = ?auto_4671 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( not ( = ?auto_4670 ?auto_4691 ) ) ( not ( = ?auto_4672 ?auto_4697 ) ) ( not ( = ?auto_4691 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4673 ) ) ( not ( = ?auto_4670 ?auto_4694 ) ) ( not ( = ?auto_4671 ?auto_4673 ) ) ( not ( = ?auto_4671 ?auto_4694 ) ) ( not ( = ?auto_4673 ?auto_4691 ) ) ( not ( = ?auto_4673 ?auto_4697 ) ) ( not ( = ?auto_4694 ?auto_4691 ) ) ( not ( = ?auto_4694 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4674 ) ) ( not ( = ?auto_4670 ?auto_4690 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) ( not ( = ?auto_4671 ?auto_4690 ) ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( not ( = ?auto_4672 ?auto_4690 ) ) ( not ( = ?auto_4674 ?auto_4694 ) ) ( not ( = ?auto_4674 ?auto_4691 ) ) ( not ( = ?auto_4674 ?auto_4697 ) ) ( not ( = ?auto_4686 ?auto_4688 ) ) ( not ( = ?auto_4693 ?auto_4689 ) ) ( not ( = ?auto_4690 ?auto_4694 ) ) ( not ( = ?auto_4690 ?auto_4691 ) ) ( not ( = ?auto_4690 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4676 ) ) ( not ( = ?auto_4670 ?auto_4685 ) ) ( not ( = ?auto_4671 ?auto_4676 ) ) ( not ( = ?auto_4671 ?auto_4685 ) ) ( not ( = ?auto_4672 ?auto_4676 ) ) ( not ( = ?auto_4672 ?auto_4685 ) ) ( not ( = ?auto_4673 ?auto_4676 ) ) ( not ( = ?auto_4673 ?auto_4685 ) ) ( not ( = ?auto_4676 ?auto_4690 ) ) ( not ( = ?auto_4676 ?auto_4694 ) ) ( not ( = ?auto_4676 ?auto_4691 ) ) ( not ( = ?auto_4676 ?auto_4697 ) ) ( not ( = ?auto_4692 ?auto_4686 ) ) ( not ( = ?auto_4692 ?auto_4688 ) ) ( not ( = ?auto_4695 ?auto_4693 ) ) ( not ( = ?auto_4695 ?auto_4689 ) ) ( not ( = ?auto_4685 ?auto_4690 ) ) ( not ( = ?auto_4685 ?auto_4694 ) ) ( not ( = ?auto_4685 ?auto_4691 ) ) ( not ( = ?auto_4685 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4675 ) ) ( not ( = ?auto_4670 ?auto_4696 ) ) ( not ( = ?auto_4671 ?auto_4675 ) ) ( not ( = ?auto_4671 ?auto_4696 ) ) ( not ( = ?auto_4672 ?auto_4675 ) ) ( not ( = ?auto_4672 ?auto_4696 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( not ( = ?auto_4673 ?auto_4696 ) ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( not ( = ?auto_4674 ?auto_4696 ) ) ( not ( = ?auto_4675 ?auto_4685 ) ) ( not ( = ?auto_4675 ?auto_4690 ) ) ( not ( = ?auto_4675 ?auto_4694 ) ) ( not ( = ?auto_4675 ?auto_4691 ) ) ( not ( = ?auto_4675 ?auto_4697 ) ) ( not ( = ?auto_4680 ?auto_4692 ) ) ( not ( = ?auto_4680 ?auto_4686 ) ) ( not ( = ?auto_4680 ?auto_4688 ) ) ( not ( = ?auto_4681 ?auto_4695 ) ) ( not ( = ?auto_4681 ?auto_4693 ) ) ( not ( = ?auto_4681 ?auto_4689 ) ) ( not ( = ?auto_4696 ?auto_4685 ) ) ( not ( = ?auto_4696 ?auto_4690 ) ) ( not ( = ?auto_4696 ?auto_4694 ) ) ( not ( = ?auto_4696 ?auto_4691 ) ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4678 ) ) ( not ( = ?auto_4670 ?auto_4687 ) ) ( not ( = ?auto_4671 ?auto_4678 ) ) ( not ( = ?auto_4671 ?auto_4687 ) ) ( not ( = ?auto_4672 ?auto_4678 ) ) ( not ( = ?auto_4672 ?auto_4687 ) ) ( not ( = ?auto_4673 ?auto_4678 ) ) ( not ( = ?auto_4673 ?auto_4687 ) ) ( not ( = ?auto_4674 ?auto_4678 ) ) ( not ( = ?auto_4674 ?auto_4687 ) ) ( not ( = ?auto_4676 ?auto_4678 ) ) ( not ( = ?auto_4676 ?auto_4687 ) ) ( not ( = ?auto_4678 ?auto_4696 ) ) ( not ( = ?auto_4678 ?auto_4685 ) ) ( not ( = ?auto_4678 ?auto_4690 ) ) ( not ( = ?auto_4678 ?auto_4694 ) ) ( not ( = ?auto_4678 ?auto_4691 ) ) ( not ( = ?auto_4678 ?auto_4697 ) ) ( not ( = ?auto_4687 ?auto_4696 ) ) ( not ( = ?auto_4687 ?auto_4685 ) ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( not ( = ?auto_4687 ?auto_4694 ) ) ( not ( = ?auto_4687 ?auto_4691 ) ) ( not ( = ?auto_4687 ?auto_4697 ) ) ( not ( = ?auto_4670 ?auto_4677 ) ) ( not ( = ?auto_4670 ?auto_4683 ) ) ( not ( = ?auto_4671 ?auto_4677 ) ) ( not ( = ?auto_4671 ?auto_4683 ) ) ( not ( = ?auto_4672 ?auto_4677 ) ) ( not ( = ?auto_4672 ?auto_4683 ) ) ( not ( = ?auto_4673 ?auto_4677 ) ) ( not ( = ?auto_4673 ?auto_4683 ) ) ( not ( = ?auto_4674 ?auto_4677 ) ) ( not ( = ?auto_4674 ?auto_4683 ) ) ( not ( = ?auto_4676 ?auto_4677 ) ) ( not ( = ?auto_4676 ?auto_4683 ) ) ( not ( = ?auto_4675 ?auto_4677 ) ) ( not ( = ?auto_4675 ?auto_4683 ) ) ( not ( = ?auto_4677 ?auto_4687 ) ) ( not ( = ?auto_4677 ?auto_4696 ) ) ( not ( = ?auto_4677 ?auto_4685 ) ) ( not ( = ?auto_4677 ?auto_4690 ) ) ( not ( = ?auto_4677 ?auto_4694 ) ) ( not ( = ?auto_4677 ?auto_4691 ) ) ( not ( = ?auto_4677 ?auto_4697 ) ) ( not ( = ?auto_4683 ?auto_4687 ) ) ( not ( = ?auto_4683 ?auto_4696 ) ) ( not ( = ?auto_4683 ?auto_4685 ) ) ( not ( = ?auto_4683 ?auto_4690 ) ) ( not ( = ?auto_4683 ?auto_4694 ) ) ( not ( = ?auto_4683 ?auto_4691 ) ) ( not ( = ?auto_4683 ?auto_4697 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ?auto_4676 ?auto_4675 ?auto_4678 )
      ( MAKE-1CRATE ?auto_4678 ?auto_4677 )
      ( MAKE-8CRATE-VERIFY ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ?auto_4676 ?auto_4675 ?auto_4678 ?auto_4677 ) )
  )

)

