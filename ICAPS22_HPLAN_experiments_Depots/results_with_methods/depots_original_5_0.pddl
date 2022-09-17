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
      ?auto_5420 - SURFACE
      ?auto_5421 - SURFACE
    )
    :vars
    (
      ?auto_5422 - HOIST
      ?auto_5423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5422 ?auto_5423 ) ( SURFACE-AT ?auto_5421 ?auto_5423 ) ( CLEAR ?auto_5421 ) ( LIFTING ?auto_5422 ?auto_5420 ) ( IS-CRATE ?auto_5420 ) ( not ( = ?auto_5420 ?auto_5421 ) ) )
    :subtasks
    ( ( !DROP ?auto_5422 ?auto_5420 ?auto_5421 ?auto_5423 )
      ( MAKE-ON-VERIFY ?auto_5420 ?auto_5421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5424 - SURFACE
      ?auto_5425 - SURFACE
    )
    :vars
    (
      ?auto_5427 - HOIST
      ?auto_5426 - PLACE
      ?auto_5428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5427 ?auto_5426 ) ( SURFACE-AT ?auto_5425 ?auto_5426 ) ( CLEAR ?auto_5425 ) ( IS-CRATE ?auto_5424 ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( TRUCK-AT ?auto_5428 ?auto_5426 ) ( AVAILABLE ?auto_5427 ) ( IN ?auto_5424 ?auto_5428 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5427 ?auto_5424 ?auto_5428 ?auto_5426 )
      ( MAKE-ON ?auto_5424 ?auto_5425 )
      ( MAKE-ON-VERIFY ?auto_5424 ?auto_5425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5429 - SURFACE
      ?auto_5430 - SURFACE
    )
    :vars
    (
      ?auto_5432 - HOIST
      ?auto_5431 - PLACE
      ?auto_5433 - TRUCK
      ?auto_5434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5432 ?auto_5431 ) ( SURFACE-AT ?auto_5430 ?auto_5431 ) ( CLEAR ?auto_5430 ) ( IS-CRATE ?auto_5429 ) ( not ( = ?auto_5429 ?auto_5430 ) ) ( AVAILABLE ?auto_5432 ) ( IN ?auto_5429 ?auto_5433 ) ( TRUCK-AT ?auto_5433 ?auto_5434 ) ( not ( = ?auto_5434 ?auto_5431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5433 ?auto_5434 ?auto_5431 )
      ( MAKE-ON ?auto_5429 ?auto_5430 )
      ( MAKE-ON-VERIFY ?auto_5429 ?auto_5430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5435 - SURFACE
      ?auto_5436 - SURFACE
    )
    :vars
    (
      ?auto_5439 - HOIST
      ?auto_5440 - PLACE
      ?auto_5437 - TRUCK
      ?auto_5438 - PLACE
      ?auto_5441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5439 ?auto_5440 ) ( SURFACE-AT ?auto_5436 ?auto_5440 ) ( CLEAR ?auto_5436 ) ( IS-CRATE ?auto_5435 ) ( not ( = ?auto_5435 ?auto_5436 ) ) ( AVAILABLE ?auto_5439 ) ( TRUCK-AT ?auto_5437 ?auto_5438 ) ( not ( = ?auto_5438 ?auto_5440 ) ) ( HOIST-AT ?auto_5441 ?auto_5438 ) ( LIFTING ?auto_5441 ?auto_5435 ) ( not ( = ?auto_5439 ?auto_5441 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5441 ?auto_5435 ?auto_5437 ?auto_5438 )
      ( MAKE-ON ?auto_5435 ?auto_5436 )
      ( MAKE-ON-VERIFY ?auto_5435 ?auto_5436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5442 - SURFACE
      ?auto_5443 - SURFACE
    )
    :vars
    (
      ?auto_5446 - HOIST
      ?auto_5447 - PLACE
      ?auto_5448 - TRUCK
      ?auto_5445 - PLACE
      ?auto_5444 - HOIST
      ?auto_5449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5446 ?auto_5447 ) ( SURFACE-AT ?auto_5443 ?auto_5447 ) ( CLEAR ?auto_5443 ) ( IS-CRATE ?auto_5442 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( AVAILABLE ?auto_5446 ) ( TRUCK-AT ?auto_5448 ?auto_5445 ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( HOIST-AT ?auto_5444 ?auto_5445 ) ( not ( = ?auto_5446 ?auto_5444 ) ) ( AVAILABLE ?auto_5444 ) ( SURFACE-AT ?auto_5442 ?auto_5445 ) ( ON ?auto_5442 ?auto_5449 ) ( CLEAR ?auto_5442 ) ( not ( = ?auto_5442 ?auto_5449 ) ) ( not ( = ?auto_5443 ?auto_5449 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5444 ?auto_5442 ?auto_5449 ?auto_5445 )
      ( MAKE-ON ?auto_5442 ?auto_5443 )
      ( MAKE-ON-VERIFY ?auto_5442 ?auto_5443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5450 - SURFACE
      ?auto_5451 - SURFACE
    )
    :vars
    (
      ?auto_5456 - HOIST
      ?auto_5454 - PLACE
      ?auto_5455 - PLACE
      ?auto_5452 - HOIST
      ?auto_5453 - SURFACE
      ?auto_5457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5456 ?auto_5454 ) ( SURFACE-AT ?auto_5451 ?auto_5454 ) ( CLEAR ?auto_5451 ) ( IS-CRATE ?auto_5450 ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( AVAILABLE ?auto_5456 ) ( not ( = ?auto_5455 ?auto_5454 ) ) ( HOIST-AT ?auto_5452 ?auto_5455 ) ( not ( = ?auto_5456 ?auto_5452 ) ) ( AVAILABLE ?auto_5452 ) ( SURFACE-AT ?auto_5450 ?auto_5455 ) ( ON ?auto_5450 ?auto_5453 ) ( CLEAR ?auto_5450 ) ( not ( = ?auto_5450 ?auto_5453 ) ) ( not ( = ?auto_5451 ?auto_5453 ) ) ( TRUCK-AT ?auto_5457 ?auto_5454 ) )
    :subtasks
    ( ( !DRIVE ?auto_5457 ?auto_5454 ?auto_5455 )
      ( MAKE-ON ?auto_5450 ?auto_5451 )
      ( MAKE-ON-VERIFY ?auto_5450 ?auto_5451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5460 - SURFACE
      ?auto_5461 - SURFACE
    )
    :vars
    (
      ?auto_5462 - HOIST
      ?auto_5463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5462 ?auto_5463 ) ( SURFACE-AT ?auto_5461 ?auto_5463 ) ( CLEAR ?auto_5461 ) ( LIFTING ?auto_5462 ?auto_5460 ) ( IS-CRATE ?auto_5460 ) ( not ( = ?auto_5460 ?auto_5461 ) ) )
    :subtasks
    ( ( !DROP ?auto_5462 ?auto_5460 ?auto_5461 ?auto_5463 )
      ( MAKE-ON-VERIFY ?auto_5460 ?auto_5461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5464 - SURFACE
      ?auto_5465 - SURFACE
    )
    :vars
    (
      ?auto_5466 - HOIST
      ?auto_5467 - PLACE
      ?auto_5468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5466 ?auto_5467 ) ( SURFACE-AT ?auto_5465 ?auto_5467 ) ( CLEAR ?auto_5465 ) ( IS-CRATE ?auto_5464 ) ( not ( = ?auto_5464 ?auto_5465 ) ) ( TRUCK-AT ?auto_5468 ?auto_5467 ) ( AVAILABLE ?auto_5466 ) ( IN ?auto_5464 ?auto_5468 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5466 ?auto_5464 ?auto_5468 ?auto_5467 )
      ( MAKE-ON ?auto_5464 ?auto_5465 )
      ( MAKE-ON-VERIFY ?auto_5464 ?auto_5465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5469 - SURFACE
      ?auto_5470 - SURFACE
    )
    :vars
    (
      ?auto_5472 - HOIST
      ?auto_5471 - PLACE
      ?auto_5473 - TRUCK
      ?auto_5474 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5472 ?auto_5471 ) ( SURFACE-AT ?auto_5470 ?auto_5471 ) ( CLEAR ?auto_5470 ) ( IS-CRATE ?auto_5469 ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( AVAILABLE ?auto_5472 ) ( IN ?auto_5469 ?auto_5473 ) ( TRUCK-AT ?auto_5473 ?auto_5474 ) ( not ( = ?auto_5474 ?auto_5471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5473 ?auto_5474 ?auto_5471 )
      ( MAKE-ON ?auto_5469 ?auto_5470 )
      ( MAKE-ON-VERIFY ?auto_5469 ?auto_5470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5475 - SURFACE
      ?auto_5476 - SURFACE
    )
    :vars
    (
      ?auto_5480 - HOIST
      ?auto_5479 - PLACE
      ?auto_5477 - TRUCK
      ?auto_5478 - PLACE
      ?auto_5481 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5480 ?auto_5479 ) ( SURFACE-AT ?auto_5476 ?auto_5479 ) ( CLEAR ?auto_5476 ) ( IS-CRATE ?auto_5475 ) ( not ( = ?auto_5475 ?auto_5476 ) ) ( AVAILABLE ?auto_5480 ) ( TRUCK-AT ?auto_5477 ?auto_5478 ) ( not ( = ?auto_5478 ?auto_5479 ) ) ( HOIST-AT ?auto_5481 ?auto_5478 ) ( LIFTING ?auto_5481 ?auto_5475 ) ( not ( = ?auto_5480 ?auto_5481 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5481 ?auto_5475 ?auto_5477 ?auto_5478 )
      ( MAKE-ON ?auto_5475 ?auto_5476 )
      ( MAKE-ON-VERIFY ?auto_5475 ?auto_5476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5482 - SURFACE
      ?auto_5483 - SURFACE
    )
    :vars
    (
      ?auto_5488 - HOIST
      ?auto_5484 - PLACE
      ?auto_5487 - TRUCK
      ?auto_5485 - PLACE
      ?auto_5486 - HOIST
      ?auto_5489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5488 ?auto_5484 ) ( SURFACE-AT ?auto_5483 ?auto_5484 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5482 ) ( not ( = ?auto_5482 ?auto_5483 ) ) ( AVAILABLE ?auto_5488 ) ( TRUCK-AT ?auto_5487 ?auto_5485 ) ( not ( = ?auto_5485 ?auto_5484 ) ) ( HOIST-AT ?auto_5486 ?auto_5485 ) ( not ( = ?auto_5488 ?auto_5486 ) ) ( AVAILABLE ?auto_5486 ) ( SURFACE-AT ?auto_5482 ?auto_5485 ) ( ON ?auto_5482 ?auto_5489 ) ( CLEAR ?auto_5482 ) ( not ( = ?auto_5482 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5489 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5486 ?auto_5482 ?auto_5489 ?auto_5485 )
      ( MAKE-ON ?auto_5482 ?auto_5483 )
      ( MAKE-ON-VERIFY ?auto_5482 ?auto_5483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5490 - SURFACE
      ?auto_5491 - SURFACE
    )
    :vars
    (
      ?auto_5494 - HOIST
      ?auto_5492 - PLACE
      ?auto_5496 - PLACE
      ?auto_5497 - HOIST
      ?auto_5495 - SURFACE
      ?auto_5493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5494 ?auto_5492 ) ( SURFACE-AT ?auto_5491 ?auto_5492 ) ( CLEAR ?auto_5491 ) ( IS-CRATE ?auto_5490 ) ( not ( = ?auto_5490 ?auto_5491 ) ) ( AVAILABLE ?auto_5494 ) ( not ( = ?auto_5496 ?auto_5492 ) ) ( HOIST-AT ?auto_5497 ?auto_5496 ) ( not ( = ?auto_5494 ?auto_5497 ) ) ( AVAILABLE ?auto_5497 ) ( SURFACE-AT ?auto_5490 ?auto_5496 ) ( ON ?auto_5490 ?auto_5495 ) ( CLEAR ?auto_5490 ) ( not ( = ?auto_5490 ?auto_5495 ) ) ( not ( = ?auto_5491 ?auto_5495 ) ) ( TRUCK-AT ?auto_5493 ?auto_5492 ) )
    :subtasks
    ( ( !DRIVE ?auto_5493 ?auto_5492 ?auto_5496 )
      ( MAKE-ON ?auto_5490 ?auto_5491 )
      ( MAKE-ON-VERIFY ?auto_5490 ?auto_5491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5498 - SURFACE
      ?auto_5499 - SURFACE
    )
    :vars
    (
      ?auto_5502 - HOIST
      ?auto_5503 - PLACE
      ?auto_5501 - PLACE
      ?auto_5505 - HOIST
      ?auto_5500 - SURFACE
      ?auto_5504 - TRUCK
      ?auto_5506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5502 ?auto_5503 ) ( IS-CRATE ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5499 ) ) ( not ( = ?auto_5501 ?auto_5503 ) ) ( HOIST-AT ?auto_5505 ?auto_5501 ) ( not ( = ?auto_5502 ?auto_5505 ) ) ( AVAILABLE ?auto_5505 ) ( SURFACE-AT ?auto_5498 ?auto_5501 ) ( ON ?auto_5498 ?auto_5500 ) ( CLEAR ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5500 ) ) ( not ( = ?auto_5499 ?auto_5500 ) ) ( TRUCK-AT ?auto_5504 ?auto_5503 ) ( SURFACE-AT ?auto_5506 ?auto_5503 ) ( CLEAR ?auto_5506 ) ( LIFTING ?auto_5502 ?auto_5499 ) ( IS-CRATE ?auto_5499 ) ( not ( = ?auto_5498 ?auto_5506 ) ) ( not ( = ?auto_5499 ?auto_5506 ) ) ( not ( = ?auto_5500 ?auto_5506 ) ) )
    :subtasks
    ( ( !DROP ?auto_5502 ?auto_5499 ?auto_5506 ?auto_5503 )
      ( MAKE-ON ?auto_5498 ?auto_5499 )
      ( MAKE-ON-VERIFY ?auto_5498 ?auto_5499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5507 - SURFACE
      ?auto_5508 - SURFACE
    )
    :vars
    (
      ?auto_5510 - HOIST
      ?auto_5515 - PLACE
      ?auto_5511 - PLACE
      ?auto_5513 - HOIST
      ?auto_5512 - SURFACE
      ?auto_5509 - TRUCK
      ?auto_5514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5510 ?auto_5515 ) ( IS-CRATE ?auto_5507 ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( not ( = ?auto_5511 ?auto_5515 ) ) ( HOIST-AT ?auto_5513 ?auto_5511 ) ( not ( = ?auto_5510 ?auto_5513 ) ) ( AVAILABLE ?auto_5513 ) ( SURFACE-AT ?auto_5507 ?auto_5511 ) ( ON ?auto_5507 ?auto_5512 ) ( CLEAR ?auto_5507 ) ( not ( = ?auto_5507 ?auto_5512 ) ) ( not ( = ?auto_5508 ?auto_5512 ) ) ( TRUCK-AT ?auto_5509 ?auto_5515 ) ( SURFACE-AT ?auto_5514 ?auto_5515 ) ( CLEAR ?auto_5514 ) ( IS-CRATE ?auto_5508 ) ( not ( = ?auto_5507 ?auto_5514 ) ) ( not ( = ?auto_5508 ?auto_5514 ) ) ( not ( = ?auto_5512 ?auto_5514 ) ) ( AVAILABLE ?auto_5510 ) ( IN ?auto_5508 ?auto_5509 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5510 ?auto_5508 ?auto_5509 ?auto_5515 )
      ( MAKE-ON ?auto_5507 ?auto_5508 )
      ( MAKE-ON-VERIFY ?auto_5507 ?auto_5508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5516 - SURFACE
      ?auto_5517 - SURFACE
    )
    :vars
    (
      ?auto_5523 - HOIST
      ?auto_5522 - PLACE
      ?auto_5519 - PLACE
      ?auto_5521 - HOIST
      ?auto_5524 - SURFACE
      ?auto_5520 - SURFACE
      ?auto_5518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5523 ?auto_5522 ) ( IS-CRATE ?auto_5516 ) ( not ( = ?auto_5516 ?auto_5517 ) ) ( not ( = ?auto_5519 ?auto_5522 ) ) ( HOIST-AT ?auto_5521 ?auto_5519 ) ( not ( = ?auto_5523 ?auto_5521 ) ) ( AVAILABLE ?auto_5521 ) ( SURFACE-AT ?auto_5516 ?auto_5519 ) ( ON ?auto_5516 ?auto_5524 ) ( CLEAR ?auto_5516 ) ( not ( = ?auto_5516 ?auto_5524 ) ) ( not ( = ?auto_5517 ?auto_5524 ) ) ( SURFACE-AT ?auto_5520 ?auto_5522 ) ( CLEAR ?auto_5520 ) ( IS-CRATE ?auto_5517 ) ( not ( = ?auto_5516 ?auto_5520 ) ) ( not ( = ?auto_5517 ?auto_5520 ) ) ( not ( = ?auto_5524 ?auto_5520 ) ) ( AVAILABLE ?auto_5523 ) ( IN ?auto_5517 ?auto_5518 ) ( TRUCK-AT ?auto_5518 ?auto_5519 ) )
    :subtasks
    ( ( !DRIVE ?auto_5518 ?auto_5519 ?auto_5522 )
      ( MAKE-ON ?auto_5516 ?auto_5517 )
      ( MAKE-ON-VERIFY ?auto_5516 ?auto_5517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5525 - SURFACE
      ?auto_5526 - SURFACE
    )
    :vars
    (
      ?auto_5528 - HOIST
      ?auto_5530 - PLACE
      ?auto_5532 - PLACE
      ?auto_5533 - HOIST
      ?auto_5531 - SURFACE
      ?auto_5529 - SURFACE
      ?auto_5527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5528 ?auto_5530 ) ( IS-CRATE ?auto_5525 ) ( not ( = ?auto_5525 ?auto_5526 ) ) ( not ( = ?auto_5532 ?auto_5530 ) ) ( HOIST-AT ?auto_5533 ?auto_5532 ) ( not ( = ?auto_5528 ?auto_5533 ) ) ( SURFACE-AT ?auto_5525 ?auto_5532 ) ( ON ?auto_5525 ?auto_5531 ) ( CLEAR ?auto_5525 ) ( not ( = ?auto_5525 ?auto_5531 ) ) ( not ( = ?auto_5526 ?auto_5531 ) ) ( SURFACE-AT ?auto_5529 ?auto_5530 ) ( CLEAR ?auto_5529 ) ( IS-CRATE ?auto_5526 ) ( not ( = ?auto_5525 ?auto_5529 ) ) ( not ( = ?auto_5526 ?auto_5529 ) ) ( not ( = ?auto_5531 ?auto_5529 ) ) ( AVAILABLE ?auto_5528 ) ( TRUCK-AT ?auto_5527 ?auto_5532 ) ( LIFTING ?auto_5533 ?auto_5526 ) )
    :subtasks
    ( ( !LOAD ?auto_5533 ?auto_5526 ?auto_5527 ?auto_5532 )
      ( MAKE-ON ?auto_5525 ?auto_5526 )
      ( MAKE-ON-VERIFY ?auto_5525 ?auto_5526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5534 - SURFACE
      ?auto_5535 - SURFACE
    )
    :vars
    (
      ?auto_5539 - HOIST
      ?auto_5536 - PLACE
      ?auto_5540 - PLACE
      ?auto_5542 - HOIST
      ?auto_5541 - SURFACE
      ?auto_5538 - SURFACE
      ?auto_5537 - TRUCK
      ?auto_5543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5539 ?auto_5536 ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5534 ?auto_5535 ) ) ( not ( = ?auto_5540 ?auto_5536 ) ) ( HOIST-AT ?auto_5542 ?auto_5540 ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( SURFACE-AT ?auto_5534 ?auto_5540 ) ( ON ?auto_5534 ?auto_5541 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5534 ?auto_5541 ) ) ( not ( = ?auto_5535 ?auto_5541 ) ) ( SURFACE-AT ?auto_5538 ?auto_5536 ) ( CLEAR ?auto_5538 ) ( IS-CRATE ?auto_5535 ) ( not ( = ?auto_5534 ?auto_5538 ) ) ( not ( = ?auto_5535 ?auto_5538 ) ) ( not ( = ?auto_5541 ?auto_5538 ) ) ( AVAILABLE ?auto_5539 ) ( TRUCK-AT ?auto_5537 ?auto_5540 ) ( AVAILABLE ?auto_5542 ) ( SURFACE-AT ?auto_5535 ?auto_5540 ) ( ON ?auto_5535 ?auto_5543 ) ( CLEAR ?auto_5535 ) ( not ( = ?auto_5534 ?auto_5543 ) ) ( not ( = ?auto_5535 ?auto_5543 ) ) ( not ( = ?auto_5541 ?auto_5543 ) ) ( not ( = ?auto_5538 ?auto_5543 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5542 ?auto_5535 ?auto_5543 ?auto_5540 )
      ( MAKE-ON ?auto_5534 ?auto_5535 )
      ( MAKE-ON-VERIFY ?auto_5534 ?auto_5535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5544 - SURFACE
      ?auto_5545 - SURFACE
    )
    :vars
    (
      ?auto_5552 - HOIST
      ?auto_5547 - PLACE
      ?auto_5548 - PLACE
      ?auto_5553 - HOIST
      ?auto_5551 - SURFACE
      ?auto_5550 - SURFACE
      ?auto_5546 - SURFACE
      ?auto_5549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5552 ?auto_5547 ) ( IS-CRATE ?auto_5544 ) ( not ( = ?auto_5544 ?auto_5545 ) ) ( not ( = ?auto_5548 ?auto_5547 ) ) ( HOIST-AT ?auto_5553 ?auto_5548 ) ( not ( = ?auto_5552 ?auto_5553 ) ) ( SURFACE-AT ?auto_5544 ?auto_5548 ) ( ON ?auto_5544 ?auto_5551 ) ( CLEAR ?auto_5544 ) ( not ( = ?auto_5544 ?auto_5551 ) ) ( not ( = ?auto_5545 ?auto_5551 ) ) ( SURFACE-AT ?auto_5550 ?auto_5547 ) ( CLEAR ?auto_5550 ) ( IS-CRATE ?auto_5545 ) ( not ( = ?auto_5544 ?auto_5550 ) ) ( not ( = ?auto_5545 ?auto_5550 ) ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( AVAILABLE ?auto_5552 ) ( AVAILABLE ?auto_5553 ) ( SURFACE-AT ?auto_5545 ?auto_5548 ) ( ON ?auto_5545 ?auto_5546 ) ( CLEAR ?auto_5545 ) ( not ( = ?auto_5544 ?auto_5546 ) ) ( not ( = ?auto_5545 ?auto_5546 ) ) ( not ( = ?auto_5551 ?auto_5546 ) ) ( not ( = ?auto_5550 ?auto_5546 ) ) ( TRUCK-AT ?auto_5549 ?auto_5547 ) )
    :subtasks
    ( ( !DRIVE ?auto_5549 ?auto_5547 ?auto_5548 )
      ( MAKE-ON ?auto_5544 ?auto_5545 )
      ( MAKE-ON-VERIFY ?auto_5544 ?auto_5545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5556 - SURFACE
      ?auto_5557 - SURFACE
    )
    :vars
    (
      ?auto_5558 - HOIST
      ?auto_5559 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5558 ?auto_5559 ) ( SURFACE-AT ?auto_5557 ?auto_5559 ) ( CLEAR ?auto_5557 ) ( LIFTING ?auto_5558 ?auto_5556 ) ( IS-CRATE ?auto_5556 ) ( not ( = ?auto_5556 ?auto_5557 ) ) )
    :subtasks
    ( ( !DROP ?auto_5558 ?auto_5556 ?auto_5557 ?auto_5559 )
      ( MAKE-ON-VERIFY ?auto_5556 ?auto_5557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5560 - SURFACE
      ?auto_5561 - SURFACE
    )
    :vars
    (
      ?auto_5563 - HOIST
      ?auto_5562 - PLACE
      ?auto_5564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5563 ?auto_5562 ) ( SURFACE-AT ?auto_5561 ?auto_5562 ) ( CLEAR ?auto_5561 ) ( IS-CRATE ?auto_5560 ) ( not ( = ?auto_5560 ?auto_5561 ) ) ( TRUCK-AT ?auto_5564 ?auto_5562 ) ( AVAILABLE ?auto_5563 ) ( IN ?auto_5560 ?auto_5564 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5563 ?auto_5560 ?auto_5564 ?auto_5562 )
      ( MAKE-ON ?auto_5560 ?auto_5561 )
      ( MAKE-ON-VERIFY ?auto_5560 ?auto_5561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5565 - SURFACE
      ?auto_5566 - SURFACE
    )
    :vars
    (
      ?auto_5567 - HOIST
      ?auto_5569 - PLACE
      ?auto_5568 - TRUCK
      ?auto_5570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5567 ?auto_5569 ) ( SURFACE-AT ?auto_5566 ?auto_5569 ) ( CLEAR ?auto_5566 ) ( IS-CRATE ?auto_5565 ) ( not ( = ?auto_5565 ?auto_5566 ) ) ( AVAILABLE ?auto_5567 ) ( IN ?auto_5565 ?auto_5568 ) ( TRUCK-AT ?auto_5568 ?auto_5570 ) ( not ( = ?auto_5570 ?auto_5569 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5568 ?auto_5570 ?auto_5569 )
      ( MAKE-ON ?auto_5565 ?auto_5566 )
      ( MAKE-ON-VERIFY ?auto_5565 ?auto_5566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5571 - SURFACE
      ?auto_5572 - SURFACE
    )
    :vars
    (
      ?auto_5574 - HOIST
      ?auto_5576 - PLACE
      ?auto_5573 - TRUCK
      ?auto_5575 - PLACE
      ?auto_5577 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5574 ?auto_5576 ) ( SURFACE-AT ?auto_5572 ?auto_5576 ) ( CLEAR ?auto_5572 ) ( IS-CRATE ?auto_5571 ) ( not ( = ?auto_5571 ?auto_5572 ) ) ( AVAILABLE ?auto_5574 ) ( TRUCK-AT ?auto_5573 ?auto_5575 ) ( not ( = ?auto_5575 ?auto_5576 ) ) ( HOIST-AT ?auto_5577 ?auto_5575 ) ( LIFTING ?auto_5577 ?auto_5571 ) ( not ( = ?auto_5574 ?auto_5577 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5577 ?auto_5571 ?auto_5573 ?auto_5575 )
      ( MAKE-ON ?auto_5571 ?auto_5572 )
      ( MAKE-ON-VERIFY ?auto_5571 ?auto_5572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5578 - SURFACE
      ?auto_5579 - SURFACE
    )
    :vars
    (
      ?auto_5584 - HOIST
      ?auto_5582 - PLACE
      ?auto_5580 - TRUCK
      ?auto_5581 - PLACE
      ?auto_5583 - HOIST
      ?auto_5585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5584 ?auto_5582 ) ( SURFACE-AT ?auto_5579 ?auto_5582 ) ( CLEAR ?auto_5579 ) ( IS-CRATE ?auto_5578 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( AVAILABLE ?auto_5584 ) ( TRUCK-AT ?auto_5580 ?auto_5581 ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( HOIST-AT ?auto_5583 ?auto_5581 ) ( not ( = ?auto_5584 ?auto_5583 ) ) ( AVAILABLE ?auto_5583 ) ( SURFACE-AT ?auto_5578 ?auto_5581 ) ( ON ?auto_5578 ?auto_5585 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5578 ?auto_5585 ) ) ( not ( = ?auto_5579 ?auto_5585 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5583 ?auto_5578 ?auto_5585 ?auto_5581 )
      ( MAKE-ON ?auto_5578 ?auto_5579 )
      ( MAKE-ON-VERIFY ?auto_5578 ?auto_5579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5586 - SURFACE
      ?auto_5587 - SURFACE
    )
    :vars
    (
      ?auto_5591 - HOIST
      ?auto_5592 - PLACE
      ?auto_5589 - PLACE
      ?auto_5588 - HOIST
      ?auto_5590 - SURFACE
      ?auto_5593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5591 ?auto_5592 ) ( SURFACE-AT ?auto_5587 ?auto_5592 ) ( CLEAR ?auto_5587 ) ( IS-CRATE ?auto_5586 ) ( not ( = ?auto_5586 ?auto_5587 ) ) ( AVAILABLE ?auto_5591 ) ( not ( = ?auto_5589 ?auto_5592 ) ) ( HOIST-AT ?auto_5588 ?auto_5589 ) ( not ( = ?auto_5591 ?auto_5588 ) ) ( AVAILABLE ?auto_5588 ) ( SURFACE-AT ?auto_5586 ?auto_5589 ) ( ON ?auto_5586 ?auto_5590 ) ( CLEAR ?auto_5586 ) ( not ( = ?auto_5586 ?auto_5590 ) ) ( not ( = ?auto_5587 ?auto_5590 ) ) ( TRUCK-AT ?auto_5593 ?auto_5592 ) )
    :subtasks
    ( ( !DRIVE ?auto_5593 ?auto_5592 ?auto_5589 )
      ( MAKE-ON ?auto_5586 ?auto_5587 )
      ( MAKE-ON-VERIFY ?auto_5586 ?auto_5587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5594 - SURFACE
      ?auto_5595 - SURFACE
    )
    :vars
    (
      ?auto_5597 - HOIST
      ?auto_5596 - PLACE
      ?auto_5598 - PLACE
      ?auto_5599 - HOIST
      ?auto_5600 - SURFACE
      ?auto_5601 - TRUCK
      ?auto_5602 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5597 ?auto_5596 ) ( IS-CRATE ?auto_5594 ) ( not ( = ?auto_5594 ?auto_5595 ) ) ( not ( = ?auto_5598 ?auto_5596 ) ) ( HOIST-AT ?auto_5599 ?auto_5598 ) ( not ( = ?auto_5597 ?auto_5599 ) ) ( AVAILABLE ?auto_5599 ) ( SURFACE-AT ?auto_5594 ?auto_5598 ) ( ON ?auto_5594 ?auto_5600 ) ( CLEAR ?auto_5594 ) ( not ( = ?auto_5594 ?auto_5600 ) ) ( not ( = ?auto_5595 ?auto_5600 ) ) ( TRUCK-AT ?auto_5601 ?auto_5596 ) ( SURFACE-AT ?auto_5602 ?auto_5596 ) ( CLEAR ?auto_5602 ) ( LIFTING ?auto_5597 ?auto_5595 ) ( IS-CRATE ?auto_5595 ) ( not ( = ?auto_5594 ?auto_5602 ) ) ( not ( = ?auto_5595 ?auto_5602 ) ) ( not ( = ?auto_5600 ?auto_5602 ) ) )
    :subtasks
    ( ( !DROP ?auto_5597 ?auto_5595 ?auto_5602 ?auto_5596 )
      ( MAKE-ON ?auto_5594 ?auto_5595 )
      ( MAKE-ON-VERIFY ?auto_5594 ?auto_5595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5603 - SURFACE
      ?auto_5604 - SURFACE
    )
    :vars
    (
      ?auto_5605 - HOIST
      ?auto_5606 - PLACE
      ?auto_5610 - PLACE
      ?auto_5607 - HOIST
      ?auto_5609 - SURFACE
      ?auto_5611 - TRUCK
      ?auto_5608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5605 ?auto_5606 ) ( IS-CRATE ?auto_5603 ) ( not ( = ?auto_5603 ?auto_5604 ) ) ( not ( = ?auto_5610 ?auto_5606 ) ) ( HOIST-AT ?auto_5607 ?auto_5610 ) ( not ( = ?auto_5605 ?auto_5607 ) ) ( AVAILABLE ?auto_5607 ) ( SURFACE-AT ?auto_5603 ?auto_5610 ) ( ON ?auto_5603 ?auto_5609 ) ( CLEAR ?auto_5603 ) ( not ( = ?auto_5603 ?auto_5609 ) ) ( not ( = ?auto_5604 ?auto_5609 ) ) ( TRUCK-AT ?auto_5611 ?auto_5606 ) ( SURFACE-AT ?auto_5608 ?auto_5606 ) ( CLEAR ?auto_5608 ) ( IS-CRATE ?auto_5604 ) ( not ( = ?auto_5603 ?auto_5608 ) ) ( not ( = ?auto_5604 ?auto_5608 ) ) ( not ( = ?auto_5609 ?auto_5608 ) ) ( AVAILABLE ?auto_5605 ) ( IN ?auto_5604 ?auto_5611 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5605 ?auto_5604 ?auto_5611 ?auto_5606 )
      ( MAKE-ON ?auto_5603 ?auto_5604 )
      ( MAKE-ON-VERIFY ?auto_5603 ?auto_5604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5612 - SURFACE
      ?auto_5613 - SURFACE
    )
    :vars
    (
      ?auto_5616 - HOIST
      ?auto_5617 - PLACE
      ?auto_5618 - PLACE
      ?auto_5620 - HOIST
      ?auto_5619 - SURFACE
      ?auto_5615 - SURFACE
      ?auto_5614 - TRUCK
      ?auto_5621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5616 ?auto_5617 ) ( IS-CRATE ?auto_5612 ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5618 ?auto_5617 ) ) ( HOIST-AT ?auto_5620 ?auto_5618 ) ( not ( = ?auto_5616 ?auto_5620 ) ) ( AVAILABLE ?auto_5620 ) ( SURFACE-AT ?auto_5612 ?auto_5618 ) ( ON ?auto_5612 ?auto_5619 ) ( CLEAR ?auto_5612 ) ( not ( = ?auto_5612 ?auto_5619 ) ) ( not ( = ?auto_5613 ?auto_5619 ) ) ( SURFACE-AT ?auto_5615 ?auto_5617 ) ( CLEAR ?auto_5615 ) ( IS-CRATE ?auto_5613 ) ( not ( = ?auto_5612 ?auto_5615 ) ) ( not ( = ?auto_5613 ?auto_5615 ) ) ( not ( = ?auto_5619 ?auto_5615 ) ) ( AVAILABLE ?auto_5616 ) ( IN ?auto_5613 ?auto_5614 ) ( TRUCK-AT ?auto_5614 ?auto_5621 ) ( not ( = ?auto_5621 ?auto_5617 ) ) ( not ( = ?auto_5618 ?auto_5621 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5614 ?auto_5621 ?auto_5617 )
      ( MAKE-ON ?auto_5612 ?auto_5613 )
      ( MAKE-ON-VERIFY ?auto_5612 ?auto_5613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5622 - SURFACE
      ?auto_5623 - SURFACE
    )
    :vars
    (
      ?auto_5631 - HOIST
      ?auto_5630 - PLACE
      ?auto_5628 - PLACE
      ?auto_5629 - HOIST
      ?auto_5626 - SURFACE
      ?auto_5627 - SURFACE
      ?auto_5624 - TRUCK
      ?auto_5625 - PLACE
      ?auto_5632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5631 ?auto_5630 ) ( IS-CRATE ?auto_5622 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( HOIST-AT ?auto_5629 ?auto_5628 ) ( not ( = ?auto_5631 ?auto_5629 ) ) ( AVAILABLE ?auto_5629 ) ( SURFACE-AT ?auto_5622 ?auto_5628 ) ( ON ?auto_5622 ?auto_5626 ) ( CLEAR ?auto_5622 ) ( not ( = ?auto_5622 ?auto_5626 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( SURFACE-AT ?auto_5627 ?auto_5630 ) ( CLEAR ?auto_5627 ) ( IS-CRATE ?auto_5623 ) ( not ( = ?auto_5622 ?auto_5627 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( not ( = ?auto_5626 ?auto_5627 ) ) ( AVAILABLE ?auto_5631 ) ( TRUCK-AT ?auto_5624 ?auto_5625 ) ( not ( = ?auto_5625 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5625 ) ) ( HOIST-AT ?auto_5632 ?auto_5625 ) ( LIFTING ?auto_5632 ?auto_5623 ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5632 ?auto_5623 ?auto_5624 ?auto_5625 )
      ( MAKE-ON ?auto_5622 ?auto_5623 )
      ( MAKE-ON-VERIFY ?auto_5622 ?auto_5623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5633 - SURFACE
      ?auto_5634 - SURFACE
    )
    :vars
    (
      ?auto_5639 - HOIST
      ?auto_5643 - PLACE
      ?auto_5641 - PLACE
      ?auto_5638 - HOIST
      ?auto_5640 - SURFACE
      ?auto_5635 - SURFACE
      ?auto_5637 - TRUCK
      ?auto_5642 - PLACE
      ?auto_5636 - HOIST
      ?auto_5644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5639 ?auto_5643 ) ( IS-CRATE ?auto_5633 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5641 ?auto_5643 ) ) ( HOIST-AT ?auto_5638 ?auto_5641 ) ( not ( = ?auto_5639 ?auto_5638 ) ) ( AVAILABLE ?auto_5638 ) ( SURFACE-AT ?auto_5633 ?auto_5641 ) ( ON ?auto_5633 ?auto_5640 ) ( CLEAR ?auto_5633 ) ( not ( = ?auto_5633 ?auto_5640 ) ) ( not ( = ?auto_5634 ?auto_5640 ) ) ( SURFACE-AT ?auto_5635 ?auto_5643 ) ( CLEAR ?auto_5635 ) ( IS-CRATE ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5635 ) ) ( not ( = ?auto_5634 ?auto_5635 ) ) ( not ( = ?auto_5640 ?auto_5635 ) ) ( AVAILABLE ?auto_5639 ) ( TRUCK-AT ?auto_5637 ?auto_5642 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5641 ?auto_5642 ) ) ( HOIST-AT ?auto_5636 ?auto_5642 ) ( not ( = ?auto_5639 ?auto_5636 ) ) ( not ( = ?auto_5638 ?auto_5636 ) ) ( AVAILABLE ?auto_5636 ) ( SURFACE-AT ?auto_5634 ?auto_5642 ) ( ON ?auto_5634 ?auto_5644 ) ( CLEAR ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5644 ) ) ( not ( = ?auto_5634 ?auto_5644 ) ) ( not ( = ?auto_5640 ?auto_5644 ) ) ( not ( = ?auto_5635 ?auto_5644 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5636 ?auto_5634 ?auto_5644 ?auto_5642 )
      ( MAKE-ON ?auto_5633 ?auto_5634 )
      ( MAKE-ON-VERIFY ?auto_5633 ?auto_5634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5645 - SURFACE
      ?auto_5646 - SURFACE
    )
    :vars
    (
      ?auto_5651 - HOIST
      ?auto_5654 - PLACE
      ?auto_5647 - PLACE
      ?auto_5648 - HOIST
      ?auto_5653 - SURFACE
      ?auto_5650 - SURFACE
      ?auto_5656 - PLACE
      ?auto_5655 - HOIST
      ?auto_5649 - SURFACE
      ?auto_5652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5651 ?auto_5654 ) ( IS-CRATE ?auto_5645 ) ( not ( = ?auto_5645 ?auto_5646 ) ) ( not ( = ?auto_5647 ?auto_5654 ) ) ( HOIST-AT ?auto_5648 ?auto_5647 ) ( not ( = ?auto_5651 ?auto_5648 ) ) ( AVAILABLE ?auto_5648 ) ( SURFACE-AT ?auto_5645 ?auto_5647 ) ( ON ?auto_5645 ?auto_5653 ) ( CLEAR ?auto_5645 ) ( not ( = ?auto_5645 ?auto_5653 ) ) ( not ( = ?auto_5646 ?auto_5653 ) ) ( SURFACE-AT ?auto_5650 ?auto_5654 ) ( CLEAR ?auto_5650 ) ( IS-CRATE ?auto_5646 ) ( not ( = ?auto_5645 ?auto_5650 ) ) ( not ( = ?auto_5646 ?auto_5650 ) ) ( not ( = ?auto_5653 ?auto_5650 ) ) ( AVAILABLE ?auto_5651 ) ( not ( = ?auto_5656 ?auto_5654 ) ) ( not ( = ?auto_5647 ?auto_5656 ) ) ( HOIST-AT ?auto_5655 ?auto_5656 ) ( not ( = ?auto_5651 ?auto_5655 ) ) ( not ( = ?auto_5648 ?auto_5655 ) ) ( AVAILABLE ?auto_5655 ) ( SURFACE-AT ?auto_5646 ?auto_5656 ) ( ON ?auto_5646 ?auto_5649 ) ( CLEAR ?auto_5646 ) ( not ( = ?auto_5645 ?auto_5649 ) ) ( not ( = ?auto_5646 ?auto_5649 ) ) ( not ( = ?auto_5653 ?auto_5649 ) ) ( not ( = ?auto_5650 ?auto_5649 ) ) ( TRUCK-AT ?auto_5652 ?auto_5654 ) )
    :subtasks
    ( ( !DRIVE ?auto_5652 ?auto_5654 ?auto_5656 )
      ( MAKE-ON ?auto_5645 ?auto_5646 )
      ( MAKE-ON-VERIFY ?auto_5645 ?auto_5646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5657 - SURFACE
      ?auto_5658 - SURFACE
    )
    :vars
    (
      ?auto_5668 - HOIST
      ?auto_5661 - PLACE
      ?auto_5665 - PLACE
      ?auto_5666 - HOIST
      ?auto_5662 - SURFACE
      ?auto_5660 - SURFACE
      ?auto_5664 - PLACE
      ?auto_5667 - HOIST
      ?auto_5659 - SURFACE
      ?auto_5663 - TRUCK
      ?auto_5669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5668 ?auto_5661 ) ( IS-CRATE ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5658 ) ) ( not ( = ?auto_5665 ?auto_5661 ) ) ( HOIST-AT ?auto_5666 ?auto_5665 ) ( not ( = ?auto_5668 ?auto_5666 ) ) ( AVAILABLE ?auto_5666 ) ( SURFACE-AT ?auto_5657 ?auto_5665 ) ( ON ?auto_5657 ?auto_5662 ) ( CLEAR ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5662 ) ) ( not ( = ?auto_5658 ?auto_5662 ) ) ( IS-CRATE ?auto_5658 ) ( not ( = ?auto_5657 ?auto_5660 ) ) ( not ( = ?auto_5658 ?auto_5660 ) ) ( not ( = ?auto_5662 ?auto_5660 ) ) ( not ( = ?auto_5664 ?auto_5661 ) ) ( not ( = ?auto_5665 ?auto_5664 ) ) ( HOIST-AT ?auto_5667 ?auto_5664 ) ( not ( = ?auto_5668 ?auto_5667 ) ) ( not ( = ?auto_5666 ?auto_5667 ) ) ( AVAILABLE ?auto_5667 ) ( SURFACE-AT ?auto_5658 ?auto_5664 ) ( ON ?auto_5658 ?auto_5659 ) ( CLEAR ?auto_5658 ) ( not ( = ?auto_5657 ?auto_5659 ) ) ( not ( = ?auto_5658 ?auto_5659 ) ) ( not ( = ?auto_5662 ?auto_5659 ) ) ( not ( = ?auto_5660 ?auto_5659 ) ) ( TRUCK-AT ?auto_5663 ?auto_5661 ) ( SURFACE-AT ?auto_5669 ?auto_5661 ) ( CLEAR ?auto_5669 ) ( LIFTING ?auto_5668 ?auto_5660 ) ( IS-CRATE ?auto_5660 ) ( not ( = ?auto_5657 ?auto_5669 ) ) ( not ( = ?auto_5658 ?auto_5669 ) ) ( not ( = ?auto_5662 ?auto_5669 ) ) ( not ( = ?auto_5660 ?auto_5669 ) ) ( not ( = ?auto_5659 ?auto_5669 ) ) )
    :subtasks
    ( ( !DROP ?auto_5668 ?auto_5660 ?auto_5669 ?auto_5661 )
      ( MAKE-ON ?auto_5657 ?auto_5658 )
      ( MAKE-ON-VERIFY ?auto_5657 ?auto_5658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5670 - SURFACE
      ?auto_5671 - SURFACE
    )
    :vars
    (
      ?auto_5681 - HOIST
      ?auto_5675 - PLACE
      ?auto_5682 - PLACE
      ?auto_5679 - HOIST
      ?auto_5673 - SURFACE
      ?auto_5676 - SURFACE
      ?auto_5677 - PLACE
      ?auto_5678 - HOIST
      ?auto_5672 - SURFACE
      ?auto_5674 - TRUCK
      ?auto_5680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5681 ?auto_5675 ) ( IS-CRATE ?auto_5670 ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( not ( = ?auto_5682 ?auto_5675 ) ) ( HOIST-AT ?auto_5679 ?auto_5682 ) ( not ( = ?auto_5681 ?auto_5679 ) ) ( AVAILABLE ?auto_5679 ) ( SURFACE-AT ?auto_5670 ?auto_5682 ) ( ON ?auto_5670 ?auto_5673 ) ( CLEAR ?auto_5670 ) ( not ( = ?auto_5670 ?auto_5673 ) ) ( not ( = ?auto_5671 ?auto_5673 ) ) ( IS-CRATE ?auto_5671 ) ( not ( = ?auto_5670 ?auto_5676 ) ) ( not ( = ?auto_5671 ?auto_5676 ) ) ( not ( = ?auto_5673 ?auto_5676 ) ) ( not ( = ?auto_5677 ?auto_5675 ) ) ( not ( = ?auto_5682 ?auto_5677 ) ) ( HOIST-AT ?auto_5678 ?auto_5677 ) ( not ( = ?auto_5681 ?auto_5678 ) ) ( not ( = ?auto_5679 ?auto_5678 ) ) ( AVAILABLE ?auto_5678 ) ( SURFACE-AT ?auto_5671 ?auto_5677 ) ( ON ?auto_5671 ?auto_5672 ) ( CLEAR ?auto_5671 ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5672 ) ) ( not ( = ?auto_5673 ?auto_5672 ) ) ( not ( = ?auto_5676 ?auto_5672 ) ) ( TRUCK-AT ?auto_5674 ?auto_5675 ) ( SURFACE-AT ?auto_5680 ?auto_5675 ) ( CLEAR ?auto_5680 ) ( IS-CRATE ?auto_5676 ) ( not ( = ?auto_5670 ?auto_5680 ) ) ( not ( = ?auto_5671 ?auto_5680 ) ) ( not ( = ?auto_5673 ?auto_5680 ) ) ( not ( = ?auto_5676 ?auto_5680 ) ) ( not ( = ?auto_5672 ?auto_5680 ) ) ( AVAILABLE ?auto_5681 ) ( IN ?auto_5676 ?auto_5674 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5681 ?auto_5676 ?auto_5674 ?auto_5675 )
      ( MAKE-ON ?auto_5670 ?auto_5671 )
      ( MAKE-ON-VERIFY ?auto_5670 ?auto_5671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5683 - SURFACE
      ?auto_5684 - SURFACE
    )
    :vars
    (
      ?auto_5691 - HOIST
      ?auto_5693 - PLACE
      ?auto_5686 - PLACE
      ?auto_5690 - HOIST
      ?auto_5687 - SURFACE
      ?auto_5695 - SURFACE
      ?auto_5694 - PLACE
      ?auto_5692 - HOIST
      ?auto_5685 - SURFACE
      ?auto_5688 - SURFACE
      ?auto_5689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5691 ?auto_5693 ) ( IS-CRATE ?auto_5683 ) ( not ( = ?auto_5683 ?auto_5684 ) ) ( not ( = ?auto_5686 ?auto_5693 ) ) ( HOIST-AT ?auto_5690 ?auto_5686 ) ( not ( = ?auto_5691 ?auto_5690 ) ) ( AVAILABLE ?auto_5690 ) ( SURFACE-AT ?auto_5683 ?auto_5686 ) ( ON ?auto_5683 ?auto_5687 ) ( CLEAR ?auto_5683 ) ( not ( = ?auto_5683 ?auto_5687 ) ) ( not ( = ?auto_5684 ?auto_5687 ) ) ( IS-CRATE ?auto_5684 ) ( not ( = ?auto_5683 ?auto_5695 ) ) ( not ( = ?auto_5684 ?auto_5695 ) ) ( not ( = ?auto_5687 ?auto_5695 ) ) ( not ( = ?auto_5694 ?auto_5693 ) ) ( not ( = ?auto_5686 ?auto_5694 ) ) ( HOIST-AT ?auto_5692 ?auto_5694 ) ( not ( = ?auto_5691 ?auto_5692 ) ) ( not ( = ?auto_5690 ?auto_5692 ) ) ( AVAILABLE ?auto_5692 ) ( SURFACE-AT ?auto_5684 ?auto_5694 ) ( ON ?auto_5684 ?auto_5685 ) ( CLEAR ?auto_5684 ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( not ( = ?auto_5687 ?auto_5685 ) ) ( not ( = ?auto_5695 ?auto_5685 ) ) ( SURFACE-AT ?auto_5688 ?auto_5693 ) ( CLEAR ?auto_5688 ) ( IS-CRATE ?auto_5695 ) ( not ( = ?auto_5683 ?auto_5688 ) ) ( not ( = ?auto_5684 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5695 ?auto_5688 ) ) ( not ( = ?auto_5685 ?auto_5688 ) ) ( AVAILABLE ?auto_5691 ) ( IN ?auto_5695 ?auto_5689 ) ( TRUCK-AT ?auto_5689 ?auto_5694 ) )
    :subtasks
    ( ( !DRIVE ?auto_5689 ?auto_5694 ?auto_5693 )
      ( MAKE-ON ?auto_5683 ?auto_5684 )
      ( MAKE-ON-VERIFY ?auto_5683 ?auto_5684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5696 - SURFACE
      ?auto_5697 - SURFACE
    )
    :vars
    (
      ?auto_5708 - HOIST
      ?auto_5704 - PLACE
      ?auto_5707 - PLACE
      ?auto_5700 - HOIST
      ?auto_5703 - SURFACE
      ?auto_5706 - SURFACE
      ?auto_5702 - PLACE
      ?auto_5701 - HOIST
      ?auto_5698 - SURFACE
      ?auto_5705 - SURFACE
      ?auto_5699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5708 ?auto_5704 ) ( IS-CRATE ?auto_5696 ) ( not ( = ?auto_5696 ?auto_5697 ) ) ( not ( = ?auto_5707 ?auto_5704 ) ) ( HOIST-AT ?auto_5700 ?auto_5707 ) ( not ( = ?auto_5708 ?auto_5700 ) ) ( AVAILABLE ?auto_5700 ) ( SURFACE-AT ?auto_5696 ?auto_5707 ) ( ON ?auto_5696 ?auto_5703 ) ( CLEAR ?auto_5696 ) ( not ( = ?auto_5696 ?auto_5703 ) ) ( not ( = ?auto_5697 ?auto_5703 ) ) ( IS-CRATE ?auto_5697 ) ( not ( = ?auto_5696 ?auto_5706 ) ) ( not ( = ?auto_5697 ?auto_5706 ) ) ( not ( = ?auto_5703 ?auto_5706 ) ) ( not ( = ?auto_5702 ?auto_5704 ) ) ( not ( = ?auto_5707 ?auto_5702 ) ) ( HOIST-AT ?auto_5701 ?auto_5702 ) ( not ( = ?auto_5708 ?auto_5701 ) ) ( not ( = ?auto_5700 ?auto_5701 ) ) ( SURFACE-AT ?auto_5697 ?auto_5702 ) ( ON ?auto_5697 ?auto_5698 ) ( CLEAR ?auto_5697 ) ( not ( = ?auto_5696 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( not ( = ?auto_5703 ?auto_5698 ) ) ( not ( = ?auto_5706 ?auto_5698 ) ) ( SURFACE-AT ?auto_5705 ?auto_5704 ) ( CLEAR ?auto_5705 ) ( IS-CRATE ?auto_5706 ) ( not ( = ?auto_5696 ?auto_5705 ) ) ( not ( = ?auto_5697 ?auto_5705 ) ) ( not ( = ?auto_5703 ?auto_5705 ) ) ( not ( = ?auto_5706 ?auto_5705 ) ) ( not ( = ?auto_5698 ?auto_5705 ) ) ( AVAILABLE ?auto_5708 ) ( TRUCK-AT ?auto_5699 ?auto_5702 ) ( LIFTING ?auto_5701 ?auto_5706 ) )
    :subtasks
    ( ( !LOAD ?auto_5701 ?auto_5706 ?auto_5699 ?auto_5702 )
      ( MAKE-ON ?auto_5696 ?auto_5697 )
      ( MAKE-ON-VERIFY ?auto_5696 ?auto_5697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5709 - SURFACE
      ?auto_5710 - SURFACE
    )
    :vars
    (
      ?auto_5718 - HOIST
      ?auto_5713 - PLACE
      ?auto_5714 - PLACE
      ?auto_5719 - HOIST
      ?auto_5711 - SURFACE
      ?auto_5720 - SURFACE
      ?auto_5716 - PLACE
      ?auto_5717 - HOIST
      ?auto_5712 - SURFACE
      ?auto_5721 - SURFACE
      ?auto_5715 - TRUCK
      ?auto_5722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5718 ?auto_5713 ) ( IS-CRATE ?auto_5709 ) ( not ( = ?auto_5709 ?auto_5710 ) ) ( not ( = ?auto_5714 ?auto_5713 ) ) ( HOIST-AT ?auto_5719 ?auto_5714 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( AVAILABLE ?auto_5719 ) ( SURFACE-AT ?auto_5709 ?auto_5714 ) ( ON ?auto_5709 ?auto_5711 ) ( CLEAR ?auto_5709 ) ( not ( = ?auto_5709 ?auto_5711 ) ) ( not ( = ?auto_5710 ?auto_5711 ) ) ( IS-CRATE ?auto_5710 ) ( not ( = ?auto_5709 ?auto_5720 ) ) ( not ( = ?auto_5710 ?auto_5720 ) ) ( not ( = ?auto_5711 ?auto_5720 ) ) ( not ( = ?auto_5716 ?auto_5713 ) ) ( not ( = ?auto_5714 ?auto_5716 ) ) ( HOIST-AT ?auto_5717 ?auto_5716 ) ( not ( = ?auto_5718 ?auto_5717 ) ) ( not ( = ?auto_5719 ?auto_5717 ) ) ( SURFACE-AT ?auto_5710 ?auto_5716 ) ( ON ?auto_5710 ?auto_5712 ) ( CLEAR ?auto_5710 ) ( not ( = ?auto_5709 ?auto_5712 ) ) ( not ( = ?auto_5710 ?auto_5712 ) ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5720 ?auto_5712 ) ) ( SURFACE-AT ?auto_5721 ?auto_5713 ) ( CLEAR ?auto_5721 ) ( IS-CRATE ?auto_5720 ) ( not ( = ?auto_5709 ?auto_5721 ) ) ( not ( = ?auto_5710 ?auto_5721 ) ) ( not ( = ?auto_5711 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5712 ?auto_5721 ) ) ( AVAILABLE ?auto_5718 ) ( TRUCK-AT ?auto_5715 ?auto_5716 ) ( AVAILABLE ?auto_5717 ) ( SURFACE-AT ?auto_5720 ?auto_5716 ) ( ON ?auto_5720 ?auto_5722 ) ( CLEAR ?auto_5720 ) ( not ( = ?auto_5709 ?auto_5722 ) ) ( not ( = ?auto_5710 ?auto_5722 ) ) ( not ( = ?auto_5711 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( not ( = ?auto_5712 ?auto_5722 ) ) ( not ( = ?auto_5721 ?auto_5722 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5717 ?auto_5720 ?auto_5722 ?auto_5716 )
      ( MAKE-ON ?auto_5709 ?auto_5710 )
      ( MAKE-ON-VERIFY ?auto_5709 ?auto_5710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5723 - SURFACE
      ?auto_5724 - SURFACE
    )
    :vars
    (
      ?auto_5729 - HOIST
      ?auto_5725 - PLACE
      ?auto_5728 - PLACE
      ?auto_5727 - HOIST
      ?auto_5726 - SURFACE
      ?auto_5736 - SURFACE
      ?auto_5732 - PLACE
      ?auto_5730 - HOIST
      ?auto_5733 - SURFACE
      ?auto_5731 - SURFACE
      ?auto_5735 - SURFACE
      ?auto_5734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5729 ?auto_5725 ) ( IS-CRATE ?auto_5723 ) ( not ( = ?auto_5723 ?auto_5724 ) ) ( not ( = ?auto_5728 ?auto_5725 ) ) ( HOIST-AT ?auto_5727 ?auto_5728 ) ( not ( = ?auto_5729 ?auto_5727 ) ) ( AVAILABLE ?auto_5727 ) ( SURFACE-AT ?auto_5723 ?auto_5728 ) ( ON ?auto_5723 ?auto_5726 ) ( CLEAR ?auto_5723 ) ( not ( = ?auto_5723 ?auto_5726 ) ) ( not ( = ?auto_5724 ?auto_5726 ) ) ( IS-CRATE ?auto_5724 ) ( not ( = ?auto_5723 ?auto_5736 ) ) ( not ( = ?auto_5724 ?auto_5736 ) ) ( not ( = ?auto_5726 ?auto_5736 ) ) ( not ( = ?auto_5732 ?auto_5725 ) ) ( not ( = ?auto_5728 ?auto_5732 ) ) ( HOIST-AT ?auto_5730 ?auto_5732 ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5727 ?auto_5730 ) ) ( SURFACE-AT ?auto_5724 ?auto_5732 ) ( ON ?auto_5724 ?auto_5733 ) ( CLEAR ?auto_5724 ) ( not ( = ?auto_5723 ?auto_5733 ) ) ( not ( = ?auto_5724 ?auto_5733 ) ) ( not ( = ?auto_5726 ?auto_5733 ) ) ( not ( = ?auto_5736 ?auto_5733 ) ) ( SURFACE-AT ?auto_5731 ?auto_5725 ) ( CLEAR ?auto_5731 ) ( IS-CRATE ?auto_5736 ) ( not ( = ?auto_5723 ?auto_5731 ) ) ( not ( = ?auto_5724 ?auto_5731 ) ) ( not ( = ?auto_5726 ?auto_5731 ) ) ( not ( = ?auto_5736 ?auto_5731 ) ) ( not ( = ?auto_5733 ?auto_5731 ) ) ( AVAILABLE ?auto_5729 ) ( AVAILABLE ?auto_5730 ) ( SURFACE-AT ?auto_5736 ?auto_5732 ) ( ON ?auto_5736 ?auto_5735 ) ( CLEAR ?auto_5736 ) ( not ( = ?auto_5723 ?auto_5735 ) ) ( not ( = ?auto_5724 ?auto_5735 ) ) ( not ( = ?auto_5726 ?auto_5735 ) ) ( not ( = ?auto_5736 ?auto_5735 ) ) ( not ( = ?auto_5733 ?auto_5735 ) ) ( not ( = ?auto_5731 ?auto_5735 ) ) ( TRUCK-AT ?auto_5734 ?auto_5725 ) )
    :subtasks
    ( ( !DRIVE ?auto_5734 ?auto_5725 ?auto_5732 )
      ( MAKE-ON ?auto_5723 ?auto_5724 )
      ( MAKE-ON-VERIFY ?auto_5723 ?auto_5724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5739 - SURFACE
      ?auto_5740 - SURFACE
    )
    :vars
    (
      ?auto_5741 - HOIST
      ?auto_5742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5741 ?auto_5742 ) ( SURFACE-AT ?auto_5740 ?auto_5742 ) ( CLEAR ?auto_5740 ) ( LIFTING ?auto_5741 ?auto_5739 ) ( IS-CRATE ?auto_5739 ) ( not ( = ?auto_5739 ?auto_5740 ) ) )
    :subtasks
    ( ( !DROP ?auto_5741 ?auto_5739 ?auto_5740 ?auto_5742 )
      ( MAKE-ON-VERIFY ?auto_5739 ?auto_5740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5743 - SURFACE
      ?auto_5744 - SURFACE
    )
    :vars
    (
      ?auto_5746 - HOIST
      ?auto_5745 - PLACE
      ?auto_5747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5746 ?auto_5745 ) ( SURFACE-AT ?auto_5744 ?auto_5745 ) ( CLEAR ?auto_5744 ) ( IS-CRATE ?auto_5743 ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( TRUCK-AT ?auto_5747 ?auto_5745 ) ( AVAILABLE ?auto_5746 ) ( IN ?auto_5743 ?auto_5747 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5746 ?auto_5743 ?auto_5747 ?auto_5745 )
      ( MAKE-ON ?auto_5743 ?auto_5744 )
      ( MAKE-ON-VERIFY ?auto_5743 ?auto_5744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5748 - SURFACE
      ?auto_5749 - SURFACE
    )
    :vars
    (
      ?auto_5751 - HOIST
      ?auto_5752 - PLACE
      ?auto_5750 - TRUCK
      ?auto_5753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5751 ?auto_5752 ) ( SURFACE-AT ?auto_5749 ?auto_5752 ) ( CLEAR ?auto_5749 ) ( IS-CRATE ?auto_5748 ) ( not ( = ?auto_5748 ?auto_5749 ) ) ( AVAILABLE ?auto_5751 ) ( IN ?auto_5748 ?auto_5750 ) ( TRUCK-AT ?auto_5750 ?auto_5753 ) ( not ( = ?auto_5753 ?auto_5752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5750 ?auto_5753 ?auto_5752 )
      ( MAKE-ON ?auto_5748 ?auto_5749 )
      ( MAKE-ON-VERIFY ?auto_5748 ?auto_5749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5754 - SURFACE
      ?auto_5755 - SURFACE
    )
    :vars
    (
      ?auto_5758 - HOIST
      ?auto_5757 - PLACE
      ?auto_5756 - TRUCK
      ?auto_5759 - PLACE
      ?auto_5760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5758 ?auto_5757 ) ( SURFACE-AT ?auto_5755 ?auto_5757 ) ( CLEAR ?auto_5755 ) ( IS-CRATE ?auto_5754 ) ( not ( = ?auto_5754 ?auto_5755 ) ) ( AVAILABLE ?auto_5758 ) ( TRUCK-AT ?auto_5756 ?auto_5759 ) ( not ( = ?auto_5759 ?auto_5757 ) ) ( HOIST-AT ?auto_5760 ?auto_5759 ) ( LIFTING ?auto_5760 ?auto_5754 ) ( not ( = ?auto_5758 ?auto_5760 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5760 ?auto_5754 ?auto_5756 ?auto_5759 )
      ( MAKE-ON ?auto_5754 ?auto_5755 )
      ( MAKE-ON-VERIFY ?auto_5754 ?auto_5755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5761 - SURFACE
      ?auto_5762 - SURFACE
    )
    :vars
    (
      ?auto_5765 - HOIST
      ?auto_5766 - PLACE
      ?auto_5764 - TRUCK
      ?auto_5763 - PLACE
      ?auto_5767 - HOIST
      ?auto_5768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5765 ?auto_5766 ) ( SURFACE-AT ?auto_5762 ?auto_5766 ) ( CLEAR ?auto_5762 ) ( IS-CRATE ?auto_5761 ) ( not ( = ?auto_5761 ?auto_5762 ) ) ( AVAILABLE ?auto_5765 ) ( TRUCK-AT ?auto_5764 ?auto_5763 ) ( not ( = ?auto_5763 ?auto_5766 ) ) ( HOIST-AT ?auto_5767 ?auto_5763 ) ( not ( = ?auto_5765 ?auto_5767 ) ) ( AVAILABLE ?auto_5767 ) ( SURFACE-AT ?auto_5761 ?auto_5763 ) ( ON ?auto_5761 ?auto_5768 ) ( CLEAR ?auto_5761 ) ( not ( = ?auto_5761 ?auto_5768 ) ) ( not ( = ?auto_5762 ?auto_5768 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5767 ?auto_5761 ?auto_5768 ?auto_5763 )
      ( MAKE-ON ?auto_5761 ?auto_5762 )
      ( MAKE-ON-VERIFY ?auto_5761 ?auto_5762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5769 - SURFACE
      ?auto_5770 - SURFACE
    )
    :vars
    (
      ?auto_5773 - HOIST
      ?auto_5772 - PLACE
      ?auto_5776 - PLACE
      ?auto_5774 - HOIST
      ?auto_5771 - SURFACE
      ?auto_5775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5773 ?auto_5772 ) ( SURFACE-AT ?auto_5770 ?auto_5772 ) ( CLEAR ?auto_5770 ) ( IS-CRATE ?auto_5769 ) ( not ( = ?auto_5769 ?auto_5770 ) ) ( AVAILABLE ?auto_5773 ) ( not ( = ?auto_5776 ?auto_5772 ) ) ( HOIST-AT ?auto_5774 ?auto_5776 ) ( not ( = ?auto_5773 ?auto_5774 ) ) ( AVAILABLE ?auto_5774 ) ( SURFACE-AT ?auto_5769 ?auto_5776 ) ( ON ?auto_5769 ?auto_5771 ) ( CLEAR ?auto_5769 ) ( not ( = ?auto_5769 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( TRUCK-AT ?auto_5775 ?auto_5772 ) )
    :subtasks
    ( ( !DRIVE ?auto_5775 ?auto_5772 ?auto_5776 )
      ( MAKE-ON ?auto_5769 ?auto_5770 )
      ( MAKE-ON-VERIFY ?auto_5769 ?auto_5770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5777 - SURFACE
      ?auto_5778 - SURFACE
    )
    :vars
    (
      ?auto_5780 - HOIST
      ?auto_5782 - PLACE
      ?auto_5784 - PLACE
      ?auto_5779 - HOIST
      ?auto_5781 - SURFACE
      ?auto_5783 - TRUCK
      ?auto_5785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5780 ?auto_5782 ) ( IS-CRATE ?auto_5777 ) ( not ( = ?auto_5777 ?auto_5778 ) ) ( not ( = ?auto_5784 ?auto_5782 ) ) ( HOIST-AT ?auto_5779 ?auto_5784 ) ( not ( = ?auto_5780 ?auto_5779 ) ) ( AVAILABLE ?auto_5779 ) ( SURFACE-AT ?auto_5777 ?auto_5784 ) ( ON ?auto_5777 ?auto_5781 ) ( CLEAR ?auto_5777 ) ( not ( = ?auto_5777 ?auto_5781 ) ) ( not ( = ?auto_5778 ?auto_5781 ) ) ( TRUCK-AT ?auto_5783 ?auto_5782 ) ( SURFACE-AT ?auto_5785 ?auto_5782 ) ( CLEAR ?auto_5785 ) ( LIFTING ?auto_5780 ?auto_5778 ) ( IS-CRATE ?auto_5778 ) ( not ( = ?auto_5777 ?auto_5785 ) ) ( not ( = ?auto_5778 ?auto_5785 ) ) ( not ( = ?auto_5781 ?auto_5785 ) ) )
    :subtasks
    ( ( !DROP ?auto_5780 ?auto_5778 ?auto_5785 ?auto_5782 )
      ( MAKE-ON ?auto_5777 ?auto_5778 )
      ( MAKE-ON-VERIFY ?auto_5777 ?auto_5778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5786 - SURFACE
      ?auto_5787 - SURFACE
    )
    :vars
    (
      ?auto_5789 - HOIST
      ?auto_5791 - PLACE
      ?auto_5788 - PLACE
      ?auto_5793 - HOIST
      ?auto_5790 - SURFACE
      ?auto_5792 - TRUCK
      ?auto_5794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5789 ?auto_5791 ) ( IS-CRATE ?auto_5786 ) ( not ( = ?auto_5786 ?auto_5787 ) ) ( not ( = ?auto_5788 ?auto_5791 ) ) ( HOIST-AT ?auto_5793 ?auto_5788 ) ( not ( = ?auto_5789 ?auto_5793 ) ) ( AVAILABLE ?auto_5793 ) ( SURFACE-AT ?auto_5786 ?auto_5788 ) ( ON ?auto_5786 ?auto_5790 ) ( CLEAR ?auto_5786 ) ( not ( = ?auto_5786 ?auto_5790 ) ) ( not ( = ?auto_5787 ?auto_5790 ) ) ( TRUCK-AT ?auto_5792 ?auto_5791 ) ( SURFACE-AT ?auto_5794 ?auto_5791 ) ( CLEAR ?auto_5794 ) ( IS-CRATE ?auto_5787 ) ( not ( = ?auto_5786 ?auto_5794 ) ) ( not ( = ?auto_5787 ?auto_5794 ) ) ( not ( = ?auto_5790 ?auto_5794 ) ) ( AVAILABLE ?auto_5789 ) ( IN ?auto_5787 ?auto_5792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5789 ?auto_5787 ?auto_5792 ?auto_5791 )
      ( MAKE-ON ?auto_5786 ?auto_5787 )
      ( MAKE-ON-VERIFY ?auto_5786 ?auto_5787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5795 - SURFACE
      ?auto_5796 - SURFACE
    )
    :vars
    (
      ?auto_5798 - HOIST
      ?auto_5802 - PLACE
      ?auto_5800 - PLACE
      ?auto_5797 - HOIST
      ?auto_5799 - SURFACE
      ?auto_5803 - SURFACE
      ?auto_5801 - TRUCK
      ?auto_5804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5798 ?auto_5802 ) ( IS-CRATE ?auto_5795 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( not ( = ?auto_5800 ?auto_5802 ) ) ( HOIST-AT ?auto_5797 ?auto_5800 ) ( not ( = ?auto_5798 ?auto_5797 ) ) ( AVAILABLE ?auto_5797 ) ( SURFACE-AT ?auto_5795 ?auto_5800 ) ( ON ?auto_5795 ?auto_5799 ) ( CLEAR ?auto_5795 ) ( not ( = ?auto_5795 ?auto_5799 ) ) ( not ( = ?auto_5796 ?auto_5799 ) ) ( SURFACE-AT ?auto_5803 ?auto_5802 ) ( CLEAR ?auto_5803 ) ( IS-CRATE ?auto_5796 ) ( not ( = ?auto_5795 ?auto_5803 ) ) ( not ( = ?auto_5796 ?auto_5803 ) ) ( not ( = ?auto_5799 ?auto_5803 ) ) ( AVAILABLE ?auto_5798 ) ( IN ?auto_5796 ?auto_5801 ) ( TRUCK-AT ?auto_5801 ?auto_5804 ) ( not ( = ?auto_5804 ?auto_5802 ) ) ( not ( = ?auto_5800 ?auto_5804 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5801 ?auto_5804 ?auto_5802 )
      ( MAKE-ON ?auto_5795 ?auto_5796 )
      ( MAKE-ON-VERIFY ?auto_5795 ?auto_5796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5805 - SURFACE
      ?auto_5806 - SURFACE
    )
    :vars
    (
      ?auto_5810 - HOIST
      ?auto_5807 - PLACE
      ?auto_5813 - PLACE
      ?auto_5812 - HOIST
      ?auto_5814 - SURFACE
      ?auto_5808 - SURFACE
      ?auto_5809 - TRUCK
      ?auto_5811 - PLACE
      ?auto_5815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5810 ?auto_5807 ) ( IS-CRATE ?auto_5805 ) ( not ( = ?auto_5805 ?auto_5806 ) ) ( not ( = ?auto_5813 ?auto_5807 ) ) ( HOIST-AT ?auto_5812 ?auto_5813 ) ( not ( = ?auto_5810 ?auto_5812 ) ) ( AVAILABLE ?auto_5812 ) ( SURFACE-AT ?auto_5805 ?auto_5813 ) ( ON ?auto_5805 ?auto_5814 ) ( CLEAR ?auto_5805 ) ( not ( = ?auto_5805 ?auto_5814 ) ) ( not ( = ?auto_5806 ?auto_5814 ) ) ( SURFACE-AT ?auto_5808 ?auto_5807 ) ( CLEAR ?auto_5808 ) ( IS-CRATE ?auto_5806 ) ( not ( = ?auto_5805 ?auto_5808 ) ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( not ( = ?auto_5814 ?auto_5808 ) ) ( AVAILABLE ?auto_5810 ) ( TRUCK-AT ?auto_5809 ?auto_5811 ) ( not ( = ?auto_5811 ?auto_5807 ) ) ( not ( = ?auto_5813 ?auto_5811 ) ) ( HOIST-AT ?auto_5815 ?auto_5811 ) ( LIFTING ?auto_5815 ?auto_5806 ) ( not ( = ?auto_5810 ?auto_5815 ) ) ( not ( = ?auto_5812 ?auto_5815 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5815 ?auto_5806 ?auto_5809 ?auto_5811 )
      ( MAKE-ON ?auto_5805 ?auto_5806 )
      ( MAKE-ON-VERIFY ?auto_5805 ?auto_5806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5816 - SURFACE
      ?auto_5817 - SURFACE
    )
    :vars
    (
      ?auto_5826 - HOIST
      ?auto_5824 - PLACE
      ?auto_5823 - PLACE
      ?auto_5821 - HOIST
      ?auto_5825 - SURFACE
      ?auto_5819 - SURFACE
      ?auto_5820 - TRUCK
      ?auto_5818 - PLACE
      ?auto_5822 - HOIST
      ?auto_5827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5826 ?auto_5824 ) ( IS-CRATE ?auto_5816 ) ( not ( = ?auto_5816 ?auto_5817 ) ) ( not ( = ?auto_5823 ?auto_5824 ) ) ( HOIST-AT ?auto_5821 ?auto_5823 ) ( not ( = ?auto_5826 ?auto_5821 ) ) ( AVAILABLE ?auto_5821 ) ( SURFACE-AT ?auto_5816 ?auto_5823 ) ( ON ?auto_5816 ?auto_5825 ) ( CLEAR ?auto_5816 ) ( not ( = ?auto_5816 ?auto_5825 ) ) ( not ( = ?auto_5817 ?auto_5825 ) ) ( SURFACE-AT ?auto_5819 ?auto_5824 ) ( CLEAR ?auto_5819 ) ( IS-CRATE ?auto_5817 ) ( not ( = ?auto_5816 ?auto_5819 ) ) ( not ( = ?auto_5817 ?auto_5819 ) ) ( not ( = ?auto_5825 ?auto_5819 ) ) ( AVAILABLE ?auto_5826 ) ( TRUCK-AT ?auto_5820 ?auto_5818 ) ( not ( = ?auto_5818 ?auto_5824 ) ) ( not ( = ?auto_5823 ?auto_5818 ) ) ( HOIST-AT ?auto_5822 ?auto_5818 ) ( not ( = ?auto_5826 ?auto_5822 ) ) ( not ( = ?auto_5821 ?auto_5822 ) ) ( AVAILABLE ?auto_5822 ) ( SURFACE-AT ?auto_5817 ?auto_5818 ) ( ON ?auto_5817 ?auto_5827 ) ( CLEAR ?auto_5817 ) ( not ( = ?auto_5816 ?auto_5827 ) ) ( not ( = ?auto_5817 ?auto_5827 ) ) ( not ( = ?auto_5825 ?auto_5827 ) ) ( not ( = ?auto_5819 ?auto_5827 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5822 ?auto_5817 ?auto_5827 ?auto_5818 )
      ( MAKE-ON ?auto_5816 ?auto_5817 )
      ( MAKE-ON-VERIFY ?auto_5816 ?auto_5817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5828 - SURFACE
      ?auto_5829 - SURFACE
    )
    :vars
    (
      ?auto_5837 - HOIST
      ?auto_5839 - PLACE
      ?auto_5835 - PLACE
      ?auto_5834 - HOIST
      ?auto_5838 - SURFACE
      ?auto_5831 - SURFACE
      ?auto_5833 - PLACE
      ?auto_5830 - HOIST
      ?auto_5836 - SURFACE
      ?auto_5832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5837 ?auto_5839 ) ( IS-CRATE ?auto_5828 ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( not ( = ?auto_5835 ?auto_5839 ) ) ( HOIST-AT ?auto_5834 ?auto_5835 ) ( not ( = ?auto_5837 ?auto_5834 ) ) ( AVAILABLE ?auto_5834 ) ( SURFACE-AT ?auto_5828 ?auto_5835 ) ( ON ?auto_5828 ?auto_5838 ) ( CLEAR ?auto_5828 ) ( not ( = ?auto_5828 ?auto_5838 ) ) ( not ( = ?auto_5829 ?auto_5838 ) ) ( SURFACE-AT ?auto_5831 ?auto_5839 ) ( CLEAR ?auto_5831 ) ( IS-CRATE ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5831 ) ) ( not ( = ?auto_5829 ?auto_5831 ) ) ( not ( = ?auto_5838 ?auto_5831 ) ) ( AVAILABLE ?auto_5837 ) ( not ( = ?auto_5833 ?auto_5839 ) ) ( not ( = ?auto_5835 ?auto_5833 ) ) ( HOIST-AT ?auto_5830 ?auto_5833 ) ( not ( = ?auto_5837 ?auto_5830 ) ) ( not ( = ?auto_5834 ?auto_5830 ) ) ( AVAILABLE ?auto_5830 ) ( SURFACE-AT ?auto_5829 ?auto_5833 ) ( ON ?auto_5829 ?auto_5836 ) ( CLEAR ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5836 ) ) ( not ( = ?auto_5829 ?auto_5836 ) ) ( not ( = ?auto_5838 ?auto_5836 ) ) ( not ( = ?auto_5831 ?auto_5836 ) ) ( TRUCK-AT ?auto_5832 ?auto_5839 ) )
    :subtasks
    ( ( !DRIVE ?auto_5832 ?auto_5839 ?auto_5833 )
      ( MAKE-ON ?auto_5828 ?auto_5829 )
      ( MAKE-ON-VERIFY ?auto_5828 ?auto_5829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5840 - SURFACE
      ?auto_5841 - SURFACE
    )
    :vars
    (
      ?auto_5850 - HOIST
      ?auto_5846 - PLACE
      ?auto_5849 - PLACE
      ?auto_5842 - HOIST
      ?auto_5848 - SURFACE
      ?auto_5845 - SURFACE
      ?auto_5851 - PLACE
      ?auto_5847 - HOIST
      ?auto_5843 - SURFACE
      ?auto_5844 - TRUCK
      ?auto_5852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5850 ?auto_5846 ) ( IS-CRATE ?auto_5840 ) ( not ( = ?auto_5840 ?auto_5841 ) ) ( not ( = ?auto_5849 ?auto_5846 ) ) ( HOIST-AT ?auto_5842 ?auto_5849 ) ( not ( = ?auto_5850 ?auto_5842 ) ) ( AVAILABLE ?auto_5842 ) ( SURFACE-AT ?auto_5840 ?auto_5849 ) ( ON ?auto_5840 ?auto_5848 ) ( CLEAR ?auto_5840 ) ( not ( = ?auto_5840 ?auto_5848 ) ) ( not ( = ?auto_5841 ?auto_5848 ) ) ( IS-CRATE ?auto_5841 ) ( not ( = ?auto_5840 ?auto_5845 ) ) ( not ( = ?auto_5841 ?auto_5845 ) ) ( not ( = ?auto_5848 ?auto_5845 ) ) ( not ( = ?auto_5851 ?auto_5846 ) ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( HOIST-AT ?auto_5847 ?auto_5851 ) ( not ( = ?auto_5850 ?auto_5847 ) ) ( not ( = ?auto_5842 ?auto_5847 ) ) ( AVAILABLE ?auto_5847 ) ( SURFACE-AT ?auto_5841 ?auto_5851 ) ( ON ?auto_5841 ?auto_5843 ) ( CLEAR ?auto_5841 ) ( not ( = ?auto_5840 ?auto_5843 ) ) ( not ( = ?auto_5841 ?auto_5843 ) ) ( not ( = ?auto_5848 ?auto_5843 ) ) ( not ( = ?auto_5845 ?auto_5843 ) ) ( TRUCK-AT ?auto_5844 ?auto_5846 ) ( SURFACE-AT ?auto_5852 ?auto_5846 ) ( CLEAR ?auto_5852 ) ( LIFTING ?auto_5850 ?auto_5845 ) ( IS-CRATE ?auto_5845 ) ( not ( = ?auto_5840 ?auto_5852 ) ) ( not ( = ?auto_5841 ?auto_5852 ) ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( not ( = ?auto_5845 ?auto_5852 ) ) ( not ( = ?auto_5843 ?auto_5852 ) ) )
    :subtasks
    ( ( !DROP ?auto_5850 ?auto_5845 ?auto_5852 ?auto_5846 )
      ( MAKE-ON ?auto_5840 ?auto_5841 )
      ( MAKE-ON-VERIFY ?auto_5840 ?auto_5841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5853 - SURFACE
      ?auto_5854 - SURFACE
    )
    :vars
    (
      ?auto_5860 - HOIST
      ?auto_5859 - PLACE
      ?auto_5864 - PLACE
      ?auto_5861 - HOIST
      ?auto_5862 - SURFACE
      ?auto_5855 - SURFACE
      ?auto_5863 - PLACE
      ?auto_5857 - HOIST
      ?auto_5856 - SURFACE
      ?auto_5858 - TRUCK
      ?auto_5865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5860 ?auto_5859 ) ( IS-CRATE ?auto_5853 ) ( not ( = ?auto_5853 ?auto_5854 ) ) ( not ( = ?auto_5864 ?auto_5859 ) ) ( HOIST-AT ?auto_5861 ?auto_5864 ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( AVAILABLE ?auto_5861 ) ( SURFACE-AT ?auto_5853 ?auto_5864 ) ( ON ?auto_5853 ?auto_5862 ) ( CLEAR ?auto_5853 ) ( not ( = ?auto_5853 ?auto_5862 ) ) ( not ( = ?auto_5854 ?auto_5862 ) ) ( IS-CRATE ?auto_5854 ) ( not ( = ?auto_5853 ?auto_5855 ) ) ( not ( = ?auto_5854 ?auto_5855 ) ) ( not ( = ?auto_5862 ?auto_5855 ) ) ( not ( = ?auto_5863 ?auto_5859 ) ) ( not ( = ?auto_5864 ?auto_5863 ) ) ( HOIST-AT ?auto_5857 ?auto_5863 ) ( not ( = ?auto_5860 ?auto_5857 ) ) ( not ( = ?auto_5861 ?auto_5857 ) ) ( AVAILABLE ?auto_5857 ) ( SURFACE-AT ?auto_5854 ?auto_5863 ) ( ON ?auto_5854 ?auto_5856 ) ( CLEAR ?auto_5854 ) ( not ( = ?auto_5853 ?auto_5856 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( not ( = ?auto_5862 ?auto_5856 ) ) ( not ( = ?auto_5855 ?auto_5856 ) ) ( TRUCK-AT ?auto_5858 ?auto_5859 ) ( SURFACE-AT ?auto_5865 ?auto_5859 ) ( CLEAR ?auto_5865 ) ( IS-CRATE ?auto_5855 ) ( not ( = ?auto_5853 ?auto_5865 ) ) ( not ( = ?auto_5854 ?auto_5865 ) ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( not ( = ?auto_5855 ?auto_5865 ) ) ( not ( = ?auto_5856 ?auto_5865 ) ) ( AVAILABLE ?auto_5860 ) ( IN ?auto_5855 ?auto_5858 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5860 ?auto_5855 ?auto_5858 ?auto_5859 )
      ( MAKE-ON ?auto_5853 ?auto_5854 )
      ( MAKE-ON-VERIFY ?auto_5853 ?auto_5854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5866 - SURFACE
      ?auto_5867 - SURFACE
    )
    :vars
    (
      ?auto_5870 - HOIST
      ?auto_5871 - PLACE
      ?auto_5868 - PLACE
      ?auto_5876 - HOIST
      ?auto_5869 - SURFACE
      ?auto_5872 - SURFACE
      ?auto_5878 - PLACE
      ?auto_5875 - HOIST
      ?auto_5877 - SURFACE
      ?auto_5874 - SURFACE
      ?auto_5873 - TRUCK
      ?auto_5879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5870 ?auto_5871 ) ( IS-CRATE ?auto_5866 ) ( not ( = ?auto_5866 ?auto_5867 ) ) ( not ( = ?auto_5868 ?auto_5871 ) ) ( HOIST-AT ?auto_5876 ?auto_5868 ) ( not ( = ?auto_5870 ?auto_5876 ) ) ( AVAILABLE ?auto_5876 ) ( SURFACE-AT ?auto_5866 ?auto_5868 ) ( ON ?auto_5866 ?auto_5869 ) ( CLEAR ?auto_5866 ) ( not ( = ?auto_5866 ?auto_5869 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( IS-CRATE ?auto_5867 ) ( not ( = ?auto_5866 ?auto_5872 ) ) ( not ( = ?auto_5867 ?auto_5872 ) ) ( not ( = ?auto_5869 ?auto_5872 ) ) ( not ( = ?auto_5878 ?auto_5871 ) ) ( not ( = ?auto_5868 ?auto_5878 ) ) ( HOIST-AT ?auto_5875 ?auto_5878 ) ( not ( = ?auto_5870 ?auto_5875 ) ) ( not ( = ?auto_5876 ?auto_5875 ) ) ( AVAILABLE ?auto_5875 ) ( SURFACE-AT ?auto_5867 ?auto_5878 ) ( ON ?auto_5867 ?auto_5877 ) ( CLEAR ?auto_5867 ) ( not ( = ?auto_5866 ?auto_5877 ) ) ( not ( = ?auto_5867 ?auto_5877 ) ) ( not ( = ?auto_5869 ?auto_5877 ) ) ( not ( = ?auto_5872 ?auto_5877 ) ) ( SURFACE-AT ?auto_5874 ?auto_5871 ) ( CLEAR ?auto_5874 ) ( IS-CRATE ?auto_5872 ) ( not ( = ?auto_5866 ?auto_5874 ) ) ( not ( = ?auto_5867 ?auto_5874 ) ) ( not ( = ?auto_5869 ?auto_5874 ) ) ( not ( = ?auto_5872 ?auto_5874 ) ) ( not ( = ?auto_5877 ?auto_5874 ) ) ( AVAILABLE ?auto_5870 ) ( IN ?auto_5872 ?auto_5873 ) ( TRUCK-AT ?auto_5873 ?auto_5879 ) ( not ( = ?auto_5879 ?auto_5871 ) ) ( not ( = ?auto_5868 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5879 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5873 ?auto_5879 ?auto_5871 )
      ( MAKE-ON ?auto_5866 ?auto_5867 )
      ( MAKE-ON-VERIFY ?auto_5866 ?auto_5867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5880 - SURFACE
      ?auto_5881 - SURFACE
    )
    :vars
    (
      ?auto_5887 - HOIST
      ?auto_5890 - PLACE
      ?auto_5893 - PLACE
      ?auto_5884 - HOIST
      ?auto_5891 - SURFACE
      ?auto_5882 - SURFACE
      ?auto_5889 - PLACE
      ?auto_5885 - HOIST
      ?auto_5886 - SURFACE
      ?auto_5888 - SURFACE
      ?auto_5883 - TRUCK
      ?auto_5892 - PLACE
      ?auto_5894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5887 ?auto_5890 ) ( IS-CRATE ?auto_5880 ) ( not ( = ?auto_5880 ?auto_5881 ) ) ( not ( = ?auto_5893 ?auto_5890 ) ) ( HOIST-AT ?auto_5884 ?auto_5893 ) ( not ( = ?auto_5887 ?auto_5884 ) ) ( AVAILABLE ?auto_5884 ) ( SURFACE-AT ?auto_5880 ?auto_5893 ) ( ON ?auto_5880 ?auto_5891 ) ( CLEAR ?auto_5880 ) ( not ( = ?auto_5880 ?auto_5891 ) ) ( not ( = ?auto_5881 ?auto_5891 ) ) ( IS-CRATE ?auto_5881 ) ( not ( = ?auto_5880 ?auto_5882 ) ) ( not ( = ?auto_5881 ?auto_5882 ) ) ( not ( = ?auto_5891 ?auto_5882 ) ) ( not ( = ?auto_5889 ?auto_5890 ) ) ( not ( = ?auto_5893 ?auto_5889 ) ) ( HOIST-AT ?auto_5885 ?auto_5889 ) ( not ( = ?auto_5887 ?auto_5885 ) ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( AVAILABLE ?auto_5885 ) ( SURFACE-AT ?auto_5881 ?auto_5889 ) ( ON ?auto_5881 ?auto_5886 ) ( CLEAR ?auto_5881 ) ( not ( = ?auto_5880 ?auto_5886 ) ) ( not ( = ?auto_5881 ?auto_5886 ) ) ( not ( = ?auto_5891 ?auto_5886 ) ) ( not ( = ?auto_5882 ?auto_5886 ) ) ( SURFACE-AT ?auto_5888 ?auto_5890 ) ( CLEAR ?auto_5888 ) ( IS-CRATE ?auto_5882 ) ( not ( = ?auto_5880 ?auto_5888 ) ) ( not ( = ?auto_5881 ?auto_5888 ) ) ( not ( = ?auto_5891 ?auto_5888 ) ) ( not ( = ?auto_5882 ?auto_5888 ) ) ( not ( = ?auto_5886 ?auto_5888 ) ) ( AVAILABLE ?auto_5887 ) ( TRUCK-AT ?auto_5883 ?auto_5892 ) ( not ( = ?auto_5892 ?auto_5890 ) ) ( not ( = ?auto_5893 ?auto_5892 ) ) ( not ( = ?auto_5889 ?auto_5892 ) ) ( HOIST-AT ?auto_5894 ?auto_5892 ) ( LIFTING ?auto_5894 ?auto_5882 ) ( not ( = ?auto_5887 ?auto_5894 ) ) ( not ( = ?auto_5884 ?auto_5894 ) ) ( not ( = ?auto_5885 ?auto_5894 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5894 ?auto_5882 ?auto_5883 ?auto_5892 )
      ( MAKE-ON ?auto_5880 ?auto_5881 )
      ( MAKE-ON-VERIFY ?auto_5880 ?auto_5881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5895 - SURFACE
      ?auto_5896 - SURFACE
    )
    :vars
    (
      ?auto_5902 - HOIST
      ?auto_5905 - PLACE
      ?auto_5906 - PLACE
      ?auto_5901 - HOIST
      ?auto_5900 - SURFACE
      ?auto_5899 - SURFACE
      ?auto_5909 - PLACE
      ?auto_5897 - HOIST
      ?auto_5907 - SURFACE
      ?auto_5904 - SURFACE
      ?auto_5898 - TRUCK
      ?auto_5908 - PLACE
      ?auto_5903 - HOIST
      ?auto_5910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5902 ?auto_5905 ) ( IS-CRATE ?auto_5895 ) ( not ( = ?auto_5895 ?auto_5896 ) ) ( not ( = ?auto_5906 ?auto_5905 ) ) ( HOIST-AT ?auto_5901 ?auto_5906 ) ( not ( = ?auto_5902 ?auto_5901 ) ) ( AVAILABLE ?auto_5901 ) ( SURFACE-AT ?auto_5895 ?auto_5906 ) ( ON ?auto_5895 ?auto_5900 ) ( CLEAR ?auto_5895 ) ( not ( = ?auto_5895 ?auto_5900 ) ) ( not ( = ?auto_5896 ?auto_5900 ) ) ( IS-CRATE ?auto_5896 ) ( not ( = ?auto_5895 ?auto_5899 ) ) ( not ( = ?auto_5896 ?auto_5899 ) ) ( not ( = ?auto_5900 ?auto_5899 ) ) ( not ( = ?auto_5909 ?auto_5905 ) ) ( not ( = ?auto_5906 ?auto_5909 ) ) ( HOIST-AT ?auto_5897 ?auto_5909 ) ( not ( = ?auto_5902 ?auto_5897 ) ) ( not ( = ?auto_5901 ?auto_5897 ) ) ( AVAILABLE ?auto_5897 ) ( SURFACE-AT ?auto_5896 ?auto_5909 ) ( ON ?auto_5896 ?auto_5907 ) ( CLEAR ?auto_5896 ) ( not ( = ?auto_5895 ?auto_5907 ) ) ( not ( = ?auto_5896 ?auto_5907 ) ) ( not ( = ?auto_5900 ?auto_5907 ) ) ( not ( = ?auto_5899 ?auto_5907 ) ) ( SURFACE-AT ?auto_5904 ?auto_5905 ) ( CLEAR ?auto_5904 ) ( IS-CRATE ?auto_5899 ) ( not ( = ?auto_5895 ?auto_5904 ) ) ( not ( = ?auto_5896 ?auto_5904 ) ) ( not ( = ?auto_5900 ?auto_5904 ) ) ( not ( = ?auto_5899 ?auto_5904 ) ) ( not ( = ?auto_5907 ?auto_5904 ) ) ( AVAILABLE ?auto_5902 ) ( TRUCK-AT ?auto_5898 ?auto_5908 ) ( not ( = ?auto_5908 ?auto_5905 ) ) ( not ( = ?auto_5906 ?auto_5908 ) ) ( not ( = ?auto_5909 ?auto_5908 ) ) ( HOIST-AT ?auto_5903 ?auto_5908 ) ( not ( = ?auto_5902 ?auto_5903 ) ) ( not ( = ?auto_5901 ?auto_5903 ) ) ( not ( = ?auto_5897 ?auto_5903 ) ) ( AVAILABLE ?auto_5903 ) ( SURFACE-AT ?auto_5899 ?auto_5908 ) ( ON ?auto_5899 ?auto_5910 ) ( CLEAR ?auto_5899 ) ( not ( = ?auto_5895 ?auto_5910 ) ) ( not ( = ?auto_5896 ?auto_5910 ) ) ( not ( = ?auto_5900 ?auto_5910 ) ) ( not ( = ?auto_5899 ?auto_5910 ) ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5904 ?auto_5910 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5903 ?auto_5899 ?auto_5910 ?auto_5908 )
      ( MAKE-ON ?auto_5895 ?auto_5896 )
      ( MAKE-ON-VERIFY ?auto_5895 ?auto_5896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5911 - SURFACE
      ?auto_5912 - SURFACE
    )
    :vars
    (
      ?auto_5914 - HOIST
      ?auto_5924 - PLACE
      ?auto_5917 - PLACE
      ?auto_5921 - HOIST
      ?auto_5920 - SURFACE
      ?auto_5918 - SURFACE
      ?auto_5913 - PLACE
      ?auto_5925 - HOIST
      ?auto_5919 - SURFACE
      ?auto_5923 - SURFACE
      ?auto_5916 - PLACE
      ?auto_5922 - HOIST
      ?auto_5926 - SURFACE
      ?auto_5915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5914 ?auto_5924 ) ( IS-CRATE ?auto_5911 ) ( not ( = ?auto_5911 ?auto_5912 ) ) ( not ( = ?auto_5917 ?auto_5924 ) ) ( HOIST-AT ?auto_5921 ?auto_5917 ) ( not ( = ?auto_5914 ?auto_5921 ) ) ( AVAILABLE ?auto_5921 ) ( SURFACE-AT ?auto_5911 ?auto_5917 ) ( ON ?auto_5911 ?auto_5920 ) ( CLEAR ?auto_5911 ) ( not ( = ?auto_5911 ?auto_5920 ) ) ( not ( = ?auto_5912 ?auto_5920 ) ) ( IS-CRATE ?auto_5912 ) ( not ( = ?auto_5911 ?auto_5918 ) ) ( not ( = ?auto_5912 ?auto_5918 ) ) ( not ( = ?auto_5920 ?auto_5918 ) ) ( not ( = ?auto_5913 ?auto_5924 ) ) ( not ( = ?auto_5917 ?auto_5913 ) ) ( HOIST-AT ?auto_5925 ?auto_5913 ) ( not ( = ?auto_5914 ?auto_5925 ) ) ( not ( = ?auto_5921 ?auto_5925 ) ) ( AVAILABLE ?auto_5925 ) ( SURFACE-AT ?auto_5912 ?auto_5913 ) ( ON ?auto_5912 ?auto_5919 ) ( CLEAR ?auto_5912 ) ( not ( = ?auto_5911 ?auto_5919 ) ) ( not ( = ?auto_5912 ?auto_5919 ) ) ( not ( = ?auto_5920 ?auto_5919 ) ) ( not ( = ?auto_5918 ?auto_5919 ) ) ( SURFACE-AT ?auto_5923 ?auto_5924 ) ( CLEAR ?auto_5923 ) ( IS-CRATE ?auto_5918 ) ( not ( = ?auto_5911 ?auto_5923 ) ) ( not ( = ?auto_5912 ?auto_5923 ) ) ( not ( = ?auto_5920 ?auto_5923 ) ) ( not ( = ?auto_5918 ?auto_5923 ) ) ( not ( = ?auto_5919 ?auto_5923 ) ) ( AVAILABLE ?auto_5914 ) ( not ( = ?auto_5916 ?auto_5924 ) ) ( not ( = ?auto_5917 ?auto_5916 ) ) ( not ( = ?auto_5913 ?auto_5916 ) ) ( HOIST-AT ?auto_5922 ?auto_5916 ) ( not ( = ?auto_5914 ?auto_5922 ) ) ( not ( = ?auto_5921 ?auto_5922 ) ) ( not ( = ?auto_5925 ?auto_5922 ) ) ( AVAILABLE ?auto_5922 ) ( SURFACE-AT ?auto_5918 ?auto_5916 ) ( ON ?auto_5918 ?auto_5926 ) ( CLEAR ?auto_5918 ) ( not ( = ?auto_5911 ?auto_5926 ) ) ( not ( = ?auto_5912 ?auto_5926 ) ) ( not ( = ?auto_5920 ?auto_5926 ) ) ( not ( = ?auto_5918 ?auto_5926 ) ) ( not ( = ?auto_5919 ?auto_5926 ) ) ( not ( = ?auto_5923 ?auto_5926 ) ) ( TRUCK-AT ?auto_5915 ?auto_5924 ) )
    :subtasks
    ( ( !DRIVE ?auto_5915 ?auto_5924 ?auto_5916 )
      ( MAKE-ON ?auto_5911 ?auto_5912 )
      ( MAKE-ON-VERIFY ?auto_5911 ?auto_5912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5927 - SURFACE
      ?auto_5928 - SURFACE
    )
    :vars
    (
      ?auto_5938 - HOIST
      ?auto_5939 - PLACE
      ?auto_5931 - PLACE
      ?auto_5942 - HOIST
      ?auto_5937 - SURFACE
      ?auto_5933 - SURFACE
      ?auto_5932 - PLACE
      ?auto_5929 - HOIST
      ?auto_5936 - SURFACE
      ?auto_5930 - SURFACE
      ?auto_5941 - PLACE
      ?auto_5934 - HOIST
      ?auto_5940 - SURFACE
      ?auto_5935 - TRUCK
      ?auto_5943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5938 ?auto_5939 ) ( IS-CRATE ?auto_5927 ) ( not ( = ?auto_5927 ?auto_5928 ) ) ( not ( = ?auto_5931 ?auto_5939 ) ) ( HOIST-AT ?auto_5942 ?auto_5931 ) ( not ( = ?auto_5938 ?auto_5942 ) ) ( AVAILABLE ?auto_5942 ) ( SURFACE-AT ?auto_5927 ?auto_5931 ) ( ON ?auto_5927 ?auto_5937 ) ( CLEAR ?auto_5927 ) ( not ( = ?auto_5927 ?auto_5937 ) ) ( not ( = ?auto_5928 ?auto_5937 ) ) ( IS-CRATE ?auto_5928 ) ( not ( = ?auto_5927 ?auto_5933 ) ) ( not ( = ?auto_5928 ?auto_5933 ) ) ( not ( = ?auto_5937 ?auto_5933 ) ) ( not ( = ?auto_5932 ?auto_5939 ) ) ( not ( = ?auto_5931 ?auto_5932 ) ) ( HOIST-AT ?auto_5929 ?auto_5932 ) ( not ( = ?auto_5938 ?auto_5929 ) ) ( not ( = ?auto_5942 ?auto_5929 ) ) ( AVAILABLE ?auto_5929 ) ( SURFACE-AT ?auto_5928 ?auto_5932 ) ( ON ?auto_5928 ?auto_5936 ) ( CLEAR ?auto_5928 ) ( not ( = ?auto_5927 ?auto_5936 ) ) ( not ( = ?auto_5928 ?auto_5936 ) ) ( not ( = ?auto_5937 ?auto_5936 ) ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( IS-CRATE ?auto_5933 ) ( not ( = ?auto_5927 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5937 ?auto_5930 ) ) ( not ( = ?auto_5933 ?auto_5930 ) ) ( not ( = ?auto_5936 ?auto_5930 ) ) ( not ( = ?auto_5941 ?auto_5939 ) ) ( not ( = ?auto_5931 ?auto_5941 ) ) ( not ( = ?auto_5932 ?auto_5941 ) ) ( HOIST-AT ?auto_5934 ?auto_5941 ) ( not ( = ?auto_5938 ?auto_5934 ) ) ( not ( = ?auto_5942 ?auto_5934 ) ) ( not ( = ?auto_5929 ?auto_5934 ) ) ( AVAILABLE ?auto_5934 ) ( SURFACE-AT ?auto_5933 ?auto_5941 ) ( ON ?auto_5933 ?auto_5940 ) ( CLEAR ?auto_5933 ) ( not ( = ?auto_5927 ?auto_5940 ) ) ( not ( = ?auto_5928 ?auto_5940 ) ) ( not ( = ?auto_5937 ?auto_5940 ) ) ( not ( = ?auto_5933 ?auto_5940 ) ) ( not ( = ?auto_5936 ?auto_5940 ) ) ( not ( = ?auto_5930 ?auto_5940 ) ) ( TRUCK-AT ?auto_5935 ?auto_5939 ) ( SURFACE-AT ?auto_5943 ?auto_5939 ) ( CLEAR ?auto_5943 ) ( LIFTING ?auto_5938 ?auto_5930 ) ( IS-CRATE ?auto_5930 ) ( not ( = ?auto_5927 ?auto_5943 ) ) ( not ( = ?auto_5928 ?auto_5943 ) ) ( not ( = ?auto_5937 ?auto_5943 ) ) ( not ( = ?auto_5933 ?auto_5943 ) ) ( not ( = ?auto_5936 ?auto_5943 ) ) ( not ( = ?auto_5930 ?auto_5943 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) )
    :subtasks
    ( ( !DROP ?auto_5938 ?auto_5930 ?auto_5943 ?auto_5939 )
      ( MAKE-ON ?auto_5927 ?auto_5928 )
      ( MAKE-ON-VERIFY ?auto_5927 ?auto_5928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5944 - SURFACE
      ?auto_5945 - SURFACE
    )
    :vars
    (
      ?auto_5956 - HOIST
      ?auto_5947 - PLACE
      ?auto_5954 - PLACE
      ?auto_5951 - HOIST
      ?auto_5948 - SURFACE
      ?auto_5957 - SURFACE
      ?auto_5958 - PLACE
      ?auto_5955 - HOIST
      ?auto_5946 - SURFACE
      ?auto_5952 - SURFACE
      ?auto_5953 - PLACE
      ?auto_5950 - HOIST
      ?auto_5949 - SURFACE
      ?auto_5959 - TRUCK
      ?auto_5960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5956 ?auto_5947 ) ( IS-CRATE ?auto_5944 ) ( not ( = ?auto_5944 ?auto_5945 ) ) ( not ( = ?auto_5954 ?auto_5947 ) ) ( HOIST-AT ?auto_5951 ?auto_5954 ) ( not ( = ?auto_5956 ?auto_5951 ) ) ( AVAILABLE ?auto_5951 ) ( SURFACE-AT ?auto_5944 ?auto_5954 ) ( ON ?auto_5944 ?auto_5948 ) ( CLEAR ?auto_5944 ) ( not ( = ?auto_5944 ?auto_5948 ) ) ( not ( = ?auto_5945 ?auto_5948 ) ) ( IS-CRATE ?auto_5945 ) ( not ( = ?auto_5944 ?auto_5957 ) ) ( not ( = ?auto_5945 ?auto_5957 ) ) ( not ( = ?auto_5948 ?auto_5957 ) ) ( not ( = ?auto_5958 ?auto_5947 ) ) ( not ( = ?auto_5954 ?auto_5958 ) ) ( HOIST-AT ?auto_5955 ?auto_5958 ) ( not ( = ?auto_5956 ?auto_5955 ) ) ( not ( = ?auto_5951 ?auto_5955 ) ) ( AVAILABLE ?auto_5955 ) ( SURFACE-AT ?auto_5945 ?auto_5958 ) ( ON ?auto_5945 ?auto_5946 ) ( CLEAR ?auto_5945 ) ( not ( = ?auto_5944 ?auto_5946 ) ) ( not ( = ?auto_5945 ?auto_5946 ) ) ( not ( = ?auto_5948 ?auto_5946 ) ) ( not ( = ?auto_5957 ?auto_5946 ) ) ( IS-CRATE ?auto_5957 ) ( not ( = ?auto_5944 ?auto_5952 ) ) ( not ( = ?auto_5945 ?auto_5952 ) ) ( not ( = ?auto_5948 ?auto_5952 ) ) ( not ( = ?auto_5957 ?auto_5952 ) ) ( not ( = ?auto_5946 ?auto_5952 ) ) ( not ( = ?auto_5953 ?auto_5947 ) ) ( not ( = ?auto_5954 ?auto_5953 ) ) ( not ( = ?auto_5958 ?auto_5953 ) ) ( HOIST-AT ?auto_5950 ?auto_5953 ) ( not ( = ?auto_5956 ?auto_5950 ) ) ( not ( = ?auto_5951 ?auto_5950 ) ) ( not ( = ?auto_5955 ?auto_5950 ) ) ( AVAILABLE ?auto_5950 ) ( SURFACE-AT ?auto_5957 ?auto_5953 ) ( ON ?auto_5957 ?auto_5949 ) ( CLEAR ?auto_5957 ) ( not ( = ?auto_5944 ?auto_5949 ) ) ( not ( = ?auto_5945 ?auto_5949 ) ) ( not ( = ?auto_5948 ?auto_5949 ) ) ( not ( = ?auto_5957 ?auto_5949 ) ) ( not ( = ?auto_5946 ?auto_5949 ) ) ( not ( = ?auto_5952 ?auto_5949 ) ) ( TRUCK-AT ?auto_5959 ?auto_5947 ) ( SURFACE-AT ?auto_5960 ?auto_5947 ) ( CLEAR ?auto_5960 ) ( IS-CRATE ?auto_5952 ) ( not ( = ?auto_5944 ?auto_5960 ) ) ( not ( = ?auto_5945 ?auto_5960 ) ) ( not ( = ?auto_5948 ?auto_5960 ) ) ( not ( = ?auto_5957 ?auto_5960 ) ) ( not ( = ?auto_5946 ?auto_5960 ) ) ( not ( = ?auto_5952 ?auto_5960 ) ) ( not ( = ?auto_5949 ?auto_5960 ) ) ( AVAILABLE ?auto_5956 ) ( IN ?auto_5952 ?auto_5959 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5956 ?auto_5952 ?auto_5959 ?auto_5947 )
      ( MAKE-ON ?auto_5944 ?auto_5945 )
      ( MAKE-ON-VERIFY ?auto_5944 ?auto_5945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5961 - SURFACE
      ?auto_5962 - SURFACE
    )
    :vars
    (
      ?auto_5967 - HOIST
      ?auto_5971 - PLACE
      ?auto_5970 - PLACE
      ?auto_5977 - HOIST
      ?auto_5976 - SURFACE
      ?auto_5974 - SURFACE
      ?auto_5965 - PLACE
      ?auto_5964 - HOIST
      ?auto_5972 - SURFACE
      ?auto_5969 - SURFACE
      ?auto_5968 - PLACE
      ?auto_5963 - HOIST
      ?auto_5973 - SURFACE
      ?auto_5975 - SURFACE
      ?auto_5966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5967 ?auto_5971 ) ( IS-CRATE ?auto_5961 ) ( not ( = ?auto_5961 ?auto_5962 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( HOIST-AT ?auto_5977 ?auto_5970 ) ( not ( = ?auto_5967 ?auto_5977 ) ) ( AVAILABLE ?auto_5977 ) ( SURFACE-AT ?auto_5961 ?auto_5970 ) ( ON ?auto_5961 ?auto_5976 ) ( CLEAR ?auto_5961 ) ( not ( = ?auto_5961 ?auto_5976 ) ) ( not ( = ?auto_5962 ?auto_5976 ) ) ( IS-CRATE ?auto_5962 ) ( not ( = ?auto_5961 ?auto_5974 ) ) ( not ( = ?auto_5962 ?auto_5974 ) ) ( not ( = ?auto_5976 ?auto_5974 ) ) ( not ( = ?auto_5965 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5965 ) ) ( HOIST-AT ?auto_5964 ?auto_5965 ) ( not ( = ?auto_5967 ?auto_5964 ) ) ( not ( = ?auto_5977 ?auto_5964 ) ) ( AVAILABLE ?auto_5964 ) ( SURFACE-AT ?auto_5962 ?auto_5965 ) ( ON ?auto_5962 ?auto_5972 ) ( CLEAR ?auto_5962 ) ( not ( = ?auto_5961 ?auto_5972 ) ) ( not ( = ?auto_5962 ?auto_5972 ) ) ( not ( = ?auto_5976 ?auto_5972 ) ) ( not ( = ?auto_5974 ?auto_5972 ) ) ( IS-CRATE ?auto_5974 ) ( not ( = ?auto_5961 ?auto_5969 ) ) ( not ( = ?auto_5962 ?auto_5969 ) ) ( not ( = ?auto_5976 ?auto_5969 ) ) ( not ( = ?auto_5974 ?auto_5969 ) ) ( not ( = ?auto_5972 ?auto_5969 ) ) ( not ( = ?auto_5968 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5968 ) ) ( not ( = ?auto_5965 ?auto_5968 ) ) ( HOIST-AT ?auto_5963 ?auto_5968 ) ( not ( = ?auto_5967 ?auto_5963 ) ) ( not ( = ?auto_5977 ?auto_5963 ) ) ( not ( = ?auto_5964 ?auto_5963 ) ) ( AVAILABLE ?auto_5963 ) ( SURFACE-AT ?auto_5974 ?auto_5968 ) ( ON ?auto_5974 ?auto_5973 ) ( CLEAR ?auto_5974 ) ( not ( = ?auto_5961 ?auto_5973 ) ) ( not ( = ?auto_5962 ?auto_5973 ) ) ( not ( = ?auto_5976 ?auto_5973 ) ) ( not ( = ?auto_5974 ?auto_5973 ) ) ( not ( = ?auto_5972 ?auto_5973 ) ) ( not ( = ?auto_5969 ?auto_5973 ) ) ( SURFACE-AT ?auto_5975 ?auto_5971 ) ( CLEAR ?auto_5975 ) ( IS-CRATE ?auto_5969 ) ( not ( = ?auto_5961 ?auto_5975 ) ) ( not ( = ?auto_5962 ?auto_5975 ) ) ( not ( = ?auto_5976 ?auto_5975 ) ) ( not ( = ?auto_5974 ?auto_5975 ) ) ( not ( = ?auto_5972 ?auto_5975 ) ) ( not ( = ?auto_5969 ?auto_5975 ) ) ( not ( = ?auto_5973 ?auto_5975 ) ) ( AVAILABLE ?auto_5967 ) ( IN ?auto_5969 ?auto_5966 ) ( TRUCK-AT ?auto_5966 ?auto_5968 ) )
    :subtasks
    ( ( !DRIVE ?auto_5966 ?auto_5968 ?auto_5971 )
      ( MAKE-ON ?auto_5961 ?auto_5962 )
      ( MAKE-ON-VERIFY ?auto_5961 ?auto_5962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5978 - SURFACE
      ?auto_5979 - SURFACE
    )
    :vars
    (
      ?auto_5986 - HOIST
      ?auto_5993 - PLACE
      ?auto_5980 - PLACE
      ?auto_5984 - HOIST
      ?auto_5983 - SURFACE
      ?auto_5992 - SURFACE
      ?auto_5988 - PLACE
      ?auto_5981 - HOIST
      ?auto_5987 - SURFACE
      ?auto_5991 - SURFACE
      ?auto_5982 - PLACE
      ?auto_5994 - HOIST
      ?auto_5989 - SURFACE
      ?auto_5985 - SURFACE
      ?auto_5990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5986 ?auto_5993 ) ( IS-CRATE ?auto_5978 ) ( not ( = ?auto_5978 ?auto_5979 ) ) ( not ( = ?auto_5980 ?auto_5993 ) ) ( HOIST-AT ?auto_5984 ?auto_5980 ) ( not ( = ?auto_5986 ?auto_5984 ) ) ( AVAILABLE ?auto_5984 ) ( SURFACE-AT ?auto_5978 ?auto_5980 ) ( ON ?auto_5978 ?auto_5983 ) ( CLEAR ?auto_5978 ) ( not ( = ?auto_5978 ?auto_5983 ) ) ( not ( = ?auto_5979 ?auto_5983 ) ) ( IS-CRATE ?auto_5979 ) ( not ( = ?auto_5978 ?auto_5992 ) ) ( not ( = ?auto_5979 ?auto_5992 ) ) ( not ( = ?auto_5983 ?auto_5992 ) ) ( not ( = ?auto_5988 ?auto_5993 ) ) ( not ( = ?auto_5980 ?auto_5988 ) ) ( HOIST-AT ?auto_5981 ?auto_5988 ) ( not ( = ?auto_5986 ?auto_5981 ) ) ( not ( = ?auto_5984 ?auto_5981 ) ) ( AVAILABLE ?auto_5981 ) ( SURFACE-AT ?auto_5979 ?auto_5988 ) ( ON ?auto_5979 ?auto_5987 ) ( CLEAR ?auto_5979 ) ( not ( = ?auto_5978 ?auto_5987 ) ) ( not ( = ?auto_5979 ?auto_5987 ) ) ( not ( = ?auto_5983 ?auto_5987 ) ) ( not ( = ?auto_5992 ?auto_5987 ) ) ( IS-CRATE ?auto_5992 ) ( not ( = ?auto_5978 ?auto_5991 ) ) ( not ( = ?auto_5979 ?auto_5991 ) ) ( not ( = ?auto_5983 ?auto_5991 ) ) ( not ( = ?auto_5992 ?auto_5991 ) ) ( not ( = ?auto_5987 ?auto_5991 ) ) ( not ( = ?auto_5982 ?auto_5993 ) ) ( not ( = ?auto_5980 ?auto_5982 ) ) ( not ( = ?auto_5988 ?auto_5982 ) ) ( HOIST-AT ?auto_5994 ?auto_5982 ) ( not ( = ?auto_5986 ?auto_5994 ) ) ( not ( = ?auto_5984 ?auto_5994 ) ) ( not ( = ?auto_5981 ?auto_5994 ) ) ( SURFACE-AT ?auto_5992 ?auto_5982 ) ( ON ?auto_5992 ?auto_5989 ) ( CLEAR ?auto_5992 ) ( not ( = ?auto_5978 ?auto_5989 ) ) ( not ( = ?auto_5979 ?auto_5989 ) ) ( not ( = ?auto_5983 ?auto_5989 ) ) ( not ( = ?auto_5992 ?auto_5989 ) ) ( not ( = ?auto_5987 ?auto_5989 ) ) ( not ( = ?auto_5991 ?auto_5989 ) ) ( SURFACE-AT ?auto_5985 ?auto_5993 ) ( CLEAR ?auto_5985 ) ( IS-CRATE ?auto_5991 ) ( not ( = ?auto_5978 ?auto_5985 ) ) ( not ( = ?auto_5979 ?auto_5985 ) ) ( not ( = ?auto_5983 ?auto_5985 ) ) ( not ( = ?auto_5992 ?auto_5985 ) ) ( not ( = ?auto_5987 ?auto_5985 ) ) ( not ( = ?auto_5991 ?auto_5985 ) ) ( not ( = ?auto_5989 ?auto_5985 ) ) ( AVAILABLE ?auto_5986 ) ( TRUCK-AT ?auto_5990 ?auto_5982 ) ( LIFTING ?auto_5994 ?auto_5991 ) )
    :subtasks
    ( ( !LOAD ?auto_5994 ?auto_5991 ?auto_5990 ?auto_5982 )
      ( MAKE-ON ?auto_5978 ?auto_5979 )
      ( MAKE-ON-VERIFY ?auto_5978 ?auto_5979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5995 - SURFACE
      ?auto_5996 - SURFACE
    )
    :vars
    (
      ?auto_6003 - HOIST
      ?auto_6000 - PLACE
      ?auto_6006 - PLACE
      ?auto_5999 - HOIST
      ?auto_5998 - SURFACE
      ?auto_6005 - SURFACE
      ?auto_5997 - PLACE
      ?auto_6010 - HOIST
      ?auto_6001 - SURFACE
      ?auto_6004 - SURFACE
      ?auto_6011 - PLACE
      ?auto_6007 - HOIST
      ?auto_6009 - SURFACE
      ?auto_6002 - SURFACE
      ?auto_6008 - TRUCK
      ?auto_6012 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6003 ?auto_6000 ) ( IS-CRATE ?auto_5995 ) ( not ( = ?auto_5995 ?auto_5996 ) ) ( not ( = ?auto_6006 ?auto_6000 ) ) ( HOIST-AT ?auto_5999 ?auto_6006 ) ( not ( = ?auto_6003 ?auto_5999 ) ) ( AVAILABLE ?auto_5999 ) ( SURFACE-AT ?auto_5995 ?auto_6006 ) ( ON ?auto_5995 ?auto_5998 ) ( CLEAR ?auto_5995 ) ( not ( = ?auto_5995 ?auto_5998 ) ) ( not ( = ?auto_5996 ?auto_5998 ) ) ( IS-CRATE ?auto_5996 ) ( not ( = ?auto_5995 ?auto_6005 ) ) ( not ( = ?auto_5996 ?auto_6005 ) ) ( not ( = ?auto_5998 ?auto_6005 ) ) ( not ( = ?auto_5997 ?auto_6000 ) ) ( not ( = ?auto_6006 ?auto_5997 ) ) ( HOIST-AT ?auto_6010 ?auto_5997 ) ( not ( = ?auto_6003 ?auto_6010 ) ) ( not ( = ?auto_5999 ?auto_6010 ) ) ( AVAILABLE ?auto_6010 ) ( SURFACE-AT ?auto_5996 ?auto_5997 ) ( ON ?auto_5996 ?auto_6001 ) ( CLEAR ?auto_5996 ) ( not ( = ?auto_5995 ?auto_6001 ) ) ( not ( = ?auto_5996 ?auto_6001 ) ) ( not ( = ?auto_5998 ?auto_6001 ) ) ( not ( = ?auto_6005 ?auto_6001 ) ) ( IS-CRATE ?auto_6005 ) ( not ( = ?auto_5995 ?auto_6004 ) ) ( not ( = ?auto_5996 ?auto_6004 ) ) ( not ( = ?auto_5998 ?auto_6004 ) ) ( not ( = ?auto_6005 ?auto_6004 ) ) ( not ( = ?auto_6001 ?auto_6004 ) ) ( not ( = ?auto_6011 ?auto_6000 ) ) ( not ( = ?auto_6006 ?auto_6011 ) ) ( not ( = ?auto_5997 ?auto_6011 ) ) ( HOIST-AT ?auto_6007 ?auto_6011 ) ( not ( = ?auto_6003 ?auto_6007 ) ) ( not ( = ?auto_5999 ?auto_6007 ) ) ( not ( = ?auto_6010 ?auto_6007 ) ) ( SURFACE-AT ?auto_6005 ?auto_6011 ) ( ON ?auto_6005 ?auto_6009 ) ( CLEAR ?auto_6005 ) ( not ( = ?auto_5995 ?auto_6009 ) ) ( not ( = ?auto_5996 ?auto_6009 ) ) ( not ( = ?auto_5998 ?auto_6009 ) ) ( not ( = ?auto_6005 ?auto_6009 ) ) ( not ( = ?auto_6001 ?auto_6009 ) ) ( not ( = ?auto_6004 ?auto_6009 ) ) ( SURFACE-AT ?auto_6002 ?auto_6000 ) ( CLEAR ?auto_6002 ) ( IS-CRATE ?auto_6004 ) ( not ( = ?auto_5995 ?auto_6002 ) ) ( not ( = ?auto_5996 ?auto_6002 ) ) ( not ( = ?auto_5998 ?auto_6002 ) ) ( not ( = ?auto_6005 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6004 ?auto_6002 ) ) ( not ( = ?auto_6009 ?auto_6002 ) ) ( AVAILABLE ?auto_6003 ) ( TRUCK-AT ?auto_6008 ?auto_6011 ) ( AVAILABLE ?auto_6007 ) ( SURFACE-AT ?auto_6004 ?auto_6011 ) ( ON ?auto_6004 ?auto_6012 ) ( CLEAR ?auto_6004 ) ( not ( = ?auto_5995 ?auto_6012 ) ) ( not ( = ?auto_5996 ?auto_6012 ) ) ( not ( = ?auto_5998 ?auto_6012 ) ) ( not ( = ?auto_6005 ?auto_6012 ) ) ( not ( = ?auto_6001 ?auto_6012 ) ) ( not ( = ?auto_6004 ?auto_6012 ) ) ( not ( = ?auto_6009 ?auto_6012 ) ) ( not ( = ?auto_6002 ?auto_6012 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6007 ?auto_6004 ?auto_6012 ?auto_6011 )
      ( MAKE-ON ?auto_5995 ?auto_5996 )
      ( MAKE-ON-VERIFY ?auto_5995 ?auto_5996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6013 - SURFACE
      ?auto_6014 - SURFACE
    )
    :vars
    (
      ?auto_6026 - HOIST
      ?auto_6015 - PLACE
      ?auto_6017 - PLACE
      ?auto_6021 - HOIST
      ?auto_6022 - SURFACE
      ?auto_6030 - SURFACE
      ?auto_6020 - PLACE
      ?auto_6023 - HOIST
      ?auto_6024 - SURFACE
      ?auto_6018 - SURFACE
      ?auto_6025 - PLACE
      ?auto_6016 - HOIST
      ?auto_6028 - SURFACE
      ?auto_6019 - SURFACE
      ?auto_6027 - SURFACE
      ?auto_6029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6026 ?auto_6015 ) ( IS-CRATE ?auto_6013 ) ( not ( = ?auto_6013 ?auto_6014 ) ) ( not ( = ?auto_6017 ?auto_6015 ) ) ( HOIST-AT ?auto_6021 ?auto_6017 ) ( not ( = ?auto_6026 ?auto_6021 ) ) ( AVAILABLE ?auto_6021 ) ( SURFACE-AT ?auto_6013 ?auto_6017 ) ( ON ?auto_6013 ?auto_6022 ) ( CLEAR ?auto_6013 ) ( not ( = ?auto_6013 ?auto_6022 ) ) ( not ( = ?auto_6014 ?auto_6022 ) ) ( IS-CRATE ?auto_6014 ) ( not ( = ?auto_6013 ?auto_6030 ) ) ( not ( = ?auto_6014 ?auto_6030 ) ) ( not ( = ?auto_6022 ?auto_6030 ) ) ( not ( = ?auto_6020 ?auto_6015 ) ) ( not ( = ?auto_6017 ?auto_6020 ) ) ( HOIST-AT ?auto_6023 ?auto_6020 ) ( not ( = ?auto_6026 ?auto_6023 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( AVAILABLE ?auto_6023 ) ( SURFACE-AT ?auto_6014 ?auto_6020 ) ( ON ?auto_6014 ?auto_6024 ) ( CLEAR ?auto_6014 ) ( not ( = ?auto_6013 ?auto_6024 ) ) ( not ( = ?auto_6014 ?auto_6024 ) ) ( not ( = ?auto_6022 ?auto_6024 ) ) ( not ( = ?auto_6030 ?auto_6024 ) ) ( IS-CRATE ?auto_6030 ) ( not ( = ?auto_6013 ?auto_6018 ) ) ( not ( = ?auto_6014 ?auto_6018 ) ) ( not ( = ?auto_6022 ?auto_6018 ) ) ( not ( = ?auto_6030 ?auto_6018 ) ) ( not ( = ?auto_6024 ?auto_6018 ) ) ( not ( = ?auto_6025 ?auto_6015 ) ) ( not ( = ?auto_6017 ?auto_6025 ) ) ( not ( = ?auto_6020 ?auto_6025 ) ) ( HOIST-AT ?auto_6016 ?auto_6025 ) ( not ( = ?auto_6026 ?auto_6016 ) ) ( not ( = ?auto_6021 ?auto_6016 ) ) ( not ( = ?auto_6023 ?auto_6016 ) ) ( SURFACE-AT ?auto_6030 ?auto_6025 ) ( ON ?auto_6030 ?auto_6028 ) ( CLEAR ?auto_6030 ) ( not ( = ?auto_6013 ?auto_6028 ) ) ( not ( = ?auto_6014 ?auto_6028 ) ) ( not ( = ?auto_6022 ?auto_6028 ) ) ( not ( = ?auto_6030 ?auto_6028 ) ) ( not ( = ?auto_6024 ?auto_6028 ) ) ( not ( = ?auto_6018 ?auto_6028 ) ) ( SURFACE-AT ?auto_6019 ?auto_6015 ) ( CLEAR ?auto_6019 ) ( IS-CRATE ?auto_6018 ) ( not ( = ?auto_6013 ?auto_6019 ) ) ( not ( = ?auto_6014 ?auto_6019 ) ) ( not ( = ?auto_6022 ?auto_6019 ) ) ( not ( = ?auto_6030 ?auto_6019 ) ) ( not ( = ?auto_6024 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6028 ?auto_6019 ) ) ( AVAILABLE ?auto_6026 ) ( AVAILABLE ?auto_6016 ) ( SURFACE-AT ?auto_6018 ?auto_6025 ) ( ON ?auto_6018 ?auto_6027 ) ( CLEAR ?auto_6018 ) ( not ( = ?auto_6013 ?auto_6027 ) ) ( not ( = ?auto_6014 ?auto_6027 ) ) ( not ( = ?auto_6022 ?auto_6027 ) ) ( not ( = ?auto_6030 ?auto_6027 ) ) ( not ( = ?auto_6024 ?auto_6027 ) ) ( not ( = ?auto_6018 ?auto_6027 ) ) ( not ( = ?auto_6028 ?auto_6027 ) ) ( not ( = ?auto_6019 ?auto_6027 ) ) ( TRUCK-AT ?auto_6029 ?auto_6015 ) )
    :subtasks
    ( ( !DRIVE ?auto_6029 ?auto_6015 ?auto_6025 )
      ( MAKE-ON ?auto_6013 ?auto_6014 )
      ( MAKE-ON-VERIFY ?auto_6013 ?auto_6014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6033 - SURFACE
      ?auto_6034 - SURFACE
    )
    :vars
    (
      ?auto_6035 - HOIST
      ?auto_6036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6035 ?auto_6036 ) ( SURFACE-AT ?auto_6034 ?auto_6036 ) ( CLEAR ?auto_6034 ) ( LIFTING ?auto_6035 ?auto_6033 ) ( IS-CRATE ?auto_6033 ) ( not ( = ?auto_6033 ?auto_6034 ) ) )
    :subtasks
    ( ( !DROP ?auto_6035 ?auto_6033 ?auto_6034 ?auto_6036 )
      ( MAKE-ON-VERIFY ?auto_6033 ?auto_6034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6037 - SURFACE
      ?auto_6038 - SURFACE
    )
    :vars
    (
      ?auto_6039 - HOIST
      ?auto_6040 - PLACE
      ?auto_6041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6039 ?auto_6040 ) ( SURFACE-AT ?auto_6038 ?auto_6040 ) ( CLEAR ?auto_6038 ) ( IS-CRATE ?auto_6037 ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( TRUCK-AT ?auto_6041 ?auto_6040 ) ( AVAILABLE ?auto_6039 ) ( IN ?auto_6037 ?auto_6041 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6039 ?auto_6037 ?auto_6041 ?auto_6040 )
      ( MAKE-ON ?auto_6037 ?auto_6038 )
      ( MAKE-ON-VERIFY ?auto_6037 ?auto_6038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6042 - SURFACE
      ?auto_6043 - SURFACE
    )
    :vars
    (
      ?auto_6044 - HOIST
      ?auto_6045 - PLACE
      ?auto_6046 - TRUCK
      ?auto_6047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6044 ?auto_6045 ) ( SURFACE-AT ?auto_6043 ?auto_6045 ) ( CLEAR ?auto_6043 ) ( IS-CRATE ?auto_6042 ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( AVAILABLE ?auto_6044 ) ( IN ?auto_6042 ?auto_6046 ) ( TRUCK-AT ?auto_6046 ?auto_6047 ) ( not ( = ?auto_6047 ?auto_6045 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6046 ?auto_6047 ?auto_6045 )
      ( MAKE-ON ?auto_6042 ?auto_6043 )
      ( MAKE-ON-VERIFY ?auto_6042 ?auto_6043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6048 - SURFACE
      ?auto_6049 - SURFACE
    )
    :vars
    (
      ?auto_6052 - HOIST
      ?auto_6051 - PLACE
      ?auto_6053 - TRUCK
      ?auto_6050 - PLACE
      ?auto_6054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6052 ?auto_6051 ) ( SURFACE-AT ?auto_6049 ?auto_6051 ) ( CLEAR ?auto_6049 ) ( IS-CRATE ?auto_6048 ) ( not ( = ?auto_6048 ?auto_6049 ) ) ( AVAILABLE ?auto_6052 ) ( TRUCK-AT ?auto_6053 ?auto_6050 ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( HOIST-AT ?auto_6054 ?auto_6050 ) ( LIFTING ?auto_6054 ?auto_6048 ) ( not ( = ?auto_6052 ?auto_6054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6054 ?auto_6048 ?auto_6053 ?auto_6050 )
      ( MAKE-ON ?auto_6048 ?auto_6049 )
      ( MAKE-ON-VERIFY ?auto_6048 ?auto_6049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6055 - SURFACE
      ?auto_6056 - SURFACE
    )
    :vars
    (
      ?auto_6059 - HOIST
      ?auto_6060 - PLACE
      ?auto_6058 - TRUCK
      ?auto_6057 - PLACE
      ?auto_6061 - HOIST
      ?auto_6062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6059 ?auto_6060 ) ( SURFACE-AT ?auto_6056 ?auto_6060 ) ( CLEAR ?auto_6056 ) ( IS-CRATE ?auto_6055 ) ( not ( = ?auto_6055 ?auto_6056 ) ) ( AVAILABLE ?auto_6059 ) ( TRUCK-AT ?auto_6058 ?auto_6057 ) ( not ( = ?auto_6057 ?auto_6060 ) ) ( HOIST-AT ?auto_6061 ?auto_6057 ) ( not ( = ?auto_6059 ?auto_6061 ) ) ( AVAILABLE ?auto_6061 ) ( SURFACE-AT ?auto_6055 ?auto_6057 ) ( ON ?auto_6055 ?auto_6062 ) ( CLEAR ?auto_6055 ) ( not ( = ?auto_6055 ?auto_6062 ) ) ( not ( = ?auto_6056 ?auto_6062 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6061 ?auto_6055 ?auto_6062 ?auto_6057 )
      ( MAKE-ON ?auto_6055 ?auto_6056 )
      ( MAKE-ON-VERIFY ?auto_6055 ?auto_6056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6063 - SURFACE
      ?auto_6064 - SURFACE
    )
    :vars
    (
      ?auto_6066 - HOIST
      ?auto_6068 - PLACE
      ?auto_6070 - PLACE
      ?auto_6067 - HOIST
      ?auto_6065 - SURFACE
      ?auto_6069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6066 ?auto_6068 ) ( SURFACE-AT ?auto_6064 ?auto_6068 ) ( CLEAR ?auto_6064 ) ( IS-CRATE ?auto_6063 ) ( not ( = ?auto_6063 ?auto_6064 ) ) ( AVAILABLE ?auto_6066 ) ( not ( = ?auto_6070 ?auto_6068 ) ) ( HOIST-AT ?auto_6067 ?auto_6070 ) ( not ( = ?auto_6066 ?auto_6067 ) ) ( AVAILABLE ?auto_6067 ) ( SURFACE-AT ?auto_6063 ?auto_6070 ) ( ON ?auto_6063 ?auto_6065 ) ( CLEAR ?auto_6063 ) ( not ( = ?auto_6063 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( TRUCK-AT ?auto_6069 ?auto_6068 ) )
    :subtasks
    ( ( !DRIVE ?auto_6069 ?auto_6068 ?auto_6070 )
      ( MAKE-ON ?auto_6063 ?auto_6064 )
      ( MAKE-ON-VERIFY ?auto_6063 ?auto_6064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6071 - SURFACE
      ?auto_6072 - SURFACE
    )
    :vars
    (
      ?auto_6077 - HOIST
      ?auto_6073 - PLACE
      ?auto_6076 - PLACE
      ?auto_6074 - HOIST
      ?auto_6078 - SURFACE
      ?auto_6075 - TRUCK
      ?auto_6079 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6077 ?auto_6073 ) ( IS-CRATE ?auto_6071 ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6076 ?auto_6073 ) ) ( HOIST-AT ?auto_6074 ?auto_6076 ) ( not ( = ?auto_6077 ?auto_6074 ) ) ( AVAILABLE ?auto_6074 ) ( SURFACE-AT ?auto_6071 ?auto_6076 ) ( ON ?auto_6071 ?auto_6078 ) ( CLEAR ?auto_6071 ) ( not ( = ?auto_6071 ?auto_6078 ) ) ( not ( = ?auto_6072 ?auto_6078 ) ) ( TRUCK-AT ?auto_6075 ?auto_6073 ) ( SURFACE-AT ?auto_6079 ?auto_6073 ) ( CLEAR ?auto_6079 ) ( LIFTING ?auto_6077 ?auto_6072 ) ( IS-CRATE ?auto_6072 ) ( not ( = ?auto_6071 ?auto_6079 ) ) ( not ( = ?auto_6072 ?auto_6079 ) ) ( not ( = ?auto_6078 ?auto_6079 ) ) )
    :subtasks
    ( ( !DROP ?auto_6077 ?auto_6072 ?auto_6079 ?auto_6073 )
      ( MAKE-ON ?auto_6071 ?auto_6072 )
      ( MAKE-ON-VERIFY ?auto_6071 ?auto_6072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6080 - SURFACE
      ?auto_6081 - SURFACE
    )
    :vars
    (
      ?auto_6085 - HOIST
      ?auto_6087 - PLACE
      ?auto_6086 - PLACE
      ?auto_6083 - HOIST
      ?auto_6082 - SURFACE
      ?auto_6084 - TRUCK
      ?auto_6088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6085 ?auto_6087 ) ( IS-CRATE ?auto_6080 ) ( not ( = ?auto_6080 ?auto_6081 ) ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( HOIST-AT ?auto_6083 ?auto_6086 ) ( not ( = ?auto_6085 ?auto_6083 ) ) ( AVAILABLE ?auto_6083 ) ( SURFACE-AT ?auto_6080 ?auto_6086 ) ( ON ?auto_6080 ?auto_6082 ) ( CLEAR ?auto_6080 ) ( not ( = ?auto_6080 ?auto_6082 ) ) ( not ( = ?auto_6081 ?auto_6082 ) ) ( TRUCK-AT ?auto_6084 ?auto_6087 ) ( SURFACE-AT ?auto_6088 ?auto_6087 ) ( CLEAR ?auto_6088 ) ( IS-CRATE ?auto_6081 ) ( not ( = ?auto_6080 ?auto_6088 ) ) ( not ( = ?auto_6081 ?auto_6088 ) ) ( not ( = ?auto_6082 ?auto_6088 ) ) ( AVAILABLE ?auto_6085 ) ( IN ?auto_6081 ?auto_6084 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6085 ?auto_6081 ?auto_6084 ?auto_6087 )
      ( MAKE-ON ?auto_6080 ?auto_6081 )
      ( MAKE-ON-VERIFY ?auto_6080 ?auto_6081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6089 - SURFACE
      ?auto_6090 - SURFACE
    )
    :vars
    (
      ?auto_6092 - HOIST
      ?auto_6096 - PLACE
      ?auto_6093 - PLACE
      ?auto_6095 - HOIST
      ?auto_6094 - SURFACE
      ?auto_6097 - SURFACE
      ?auto_6091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6092 ?auto_6096 ) ( IS-CRATE ?auto_6089 ) ( not ( = ?auto_6089 ?auto_6090 ) ) ( not ( = ?auto_6093 ?auto_6096 ) ) ( HOIST-AT ?auto_6095 ?auto_6093 ) ( not ( = ?auto_6092 ?auto_6095 ) ) ( AVAILABLE ?auto_6095 ) ( SURFACE-AT ?auto_6089 ?auto_6093 ) ( ON ?auto_6089 ?auto_6094 ) ( CLEAR ?auto_6089 ) ( not ( = ?auto_6089 ?auto_6094 ) ) ( not ( = ?auto_6090 ?auto_6094 ) ) ( SURFACE-AT ?auto_6097 ?auto_6096 ) ( CLEAR ?auto_6097 ) ( IS-CRATE ?auto_6090 ) ( not ( = ?auto_6089 ?auto_6097 ) ) ( not ( = ?auto_6090 ?auto_6097 ) ) ( not ( = ?auto_6094 ?auto_6097 ) ) ( AVAILABLE ?auto_6092 ) ( IN ?auto_6090 ?auto_6091 ) ( TRUCK-AT ?auto_6091 ?auto_6093 ) )
    :subtasks
    ( ( !DRIVE ?auto_6091 ?auto_6093 ?auto_6096 )
      ( MAKE-ON ?auto_6089 ?auto_6090 )
      ( MAKE-ON-VERIFY ?auto_6089 ?auto_6090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6098 - SURFACE
      ?auto_6099 - SURFACE
    )
    :vars
    (
      ?auto_6100 - HOIST
      ?auto_6105 - PLACE
      ?auto_6103 - PLACE
      ?auto_6101 - HOIST
      ?auto_6104 - SURFACE
      ?auto_6102 - SURFACE
      ?auto_6106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6100 ?auto_6105 ) ( IS-CRATE ?auto_6098 ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( not ( = ?auto_6103 ?auto_6105 ) ) ( HOIST-AT ?auto_6101 ?auto_6103 ) ( not ( = ?auto_6100 ?auto_6101 ) ) ( SURFACE-AT ?auto_6098 ?auto_6103 ) ( ON ?auto_6098 ?auto_6104 ) ( CLEAR ?auto_6098 ) ( not ( = ?auto_6098 ?auto_6104 ) ) ( not ( = ?auto_6099 ?auto_6104 ) ) ( SURFACE-AT ?auto_6102 ?auto_6105 ) ( CLEAR ?auto_6102 ) ( IS-CRATE ?auto_6099 ) ( not ( = ?auto_6098 ?auto_6102 ) ) ( not ( = ?auto_6099 ?auto_6102 ) ) ( not ( = ?auto_6104 ?auto_6102 ) ) ( AVAILABLE ?auto_6100 ) ( TRUCK-AT ?auto_6106 ?auto_6103 ) ( LIFTING ?auto_6101 ?auto_6099 ) )
    :subtasks
    ( ( !LOAD ?auto_6101 ?auto_6099 ?auto_6106 ?auto_6103 )
      ( MAKE-ON ?auto_6098 ?auto_6099 )
      ( MAKE-ON-VERIFY ?auto_6098 ?auto_6099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6107 - SURFACE
      ?auto_6108 - SURFACE
    )
    :vars
    (
      ?auto_6115 - HOIST
      ?auto_6111 - PLACE
      ?auto_6109 - PLACE
      ?auto_6112 - HOIST
      ?auto_6114 - SURFACE
      ?auto_6113 - SURFACE
      ?auto_6110 - TRUCK
      ?auto_6116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6115 ?auto_6111 ) ( IS-CRATE ?auto_6107 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6109 ?auto_6111 ) ) ( HOIST-AT ?auto_6112 ?auto_6109 ) ( not ( = ?auto_6115 ?auto_6112 ) ) ( SURFACE-AT ?auto_6107 ?auto_6109 ) ( ON ?auto_6107 ?auto_6114 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6107 ?auto_6114 ) ) ( not ( = ?auto_6108 ?auto_6114 ) ) ( SURFACE-AT ?auto_6113 ?auto_6111 ) ( CLEAR ?auto_6113 ) ( IS-CRATE ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6113 ) ) ( not ( = ?auto_6108 ?auto_6113 ) ) ( not ( = ?auto_6114 ?auto_6113 ) ) ( AVAILABLE ?auto_6115 ) ( TRUCK-AT ?auto_6110 ?auto_6109 ) ( AVAILABLE ?auto_6112 ) ( SURFACE-AT ?auto_6108 ?auto_6109 ) ( ON ?auto_6108 ?auto_6116 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6116 ) ) ( not ( = ?auto_6108 ?auto_6116 ) ) ( not ( = ?auto_6114 ?auto_6116 ) ) ( not ( = ?auto_6113 ?auto_6116 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6112 ?auto_6108 ?auto_6116 ?auto_6109 )
      ( MAKE-ON ?auto_6107 ?auto_6108 )
      ( MAKE-ON-VERIFY ?auto_6107 ?auto_6108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6117 - SURFACE
      ?auto_6118 - SURFACE
    )
    :vars
    (
      ?auto_6125 - HOIST
      ?auto_6120 - PLACE
      ?auto_6123 - PLACE
      ?auto_6124 - HOIST
      ?auto_6119 - SURFACE
      ?auto_6121 - SURFACE
      ?auto_6126 - SURFACE
      ?auto_6122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6125 ?auto_6120 ) ( IS-CRATE ?auto_6117 ) ( not ( = ?auto_6117 ?auto_6118 ) ) ( not ( = ?auto_6123 ?auto_6120 ) ) ( HOIST-AT ?auto_6124 ?auto_6123 ) ( not ( = ?auto_6125 ?auto_6124 ) ) ( SURFACE-AT ?auto_6117 ?auto_6123 ) ( ON ?auto_6117 ?auto_6119 ) ( CLEAR ?auto_6117 ) ( not ( = ?auto_6117 ?auto_6119 ) ) ( not ( = ?auto_6118 ?auto_6119 ) ) ( SURFACE-AT ?auto_6121 ?auto_6120 ) ( CLEAR ?auto_6121 ) ( IS-CRATE ?auto_6118 ) ( not ( = ?auto_6117 ?auto_6121 ) ) ( not ( = ?auto_6118 ?auto_6121 ) ) ( not ( = ?auto_6119 ?auto_6121 ) ) ( AVAILABLE ?auto_6125 ) ( AVAILABLE ?auto_6124 ) ( SURFACE-AT ?auto_6118 ?auto_6123 ) ( ON ?auto_6118 ?auto_6126 ) ( CLEAR ?auto_6118 ) ( not ( = ?auto_6117 ?auto_6126 ) ) ( not ( = ?auto_6118 ?auto_6126 ) ) ( not ( = ?auto_6119 ?auto_6126 ) ) ( not ( = ?auto_6121 ?auto_6126 ) ) ( TRUCK-AT ?auto_6122 ?auto_6120 ) )
    :subtasks
    ( ( !DRIVE ?auto_6122 ?auto_6120 ?auto_6123 )
      ( MAKE-ON ?auto_6117 ?auto_6118 )
      ( MAKE-ON-VERIFY ?auto_6117 ?auto_6118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6127 - SURFACE
      ?auto_6128 - SURFACE
    )
    :vars
    (
      ?auto_6130 - HOIST
      ?auto_6135 - PLACE
      ?auto_6133 - PLACE
      ?auto_6134 - HOIST
      ?auto_6136 - SURFACE
      ?auto_6131 - SURFACE
      ?auto_6129 - SURFACE
      ?auto_6132 - TRUCK
      ?auto_6137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6130 ?auto_6135 ) ( IS-CRATE ?auto_6127 ) ( not ( = ?auto_6127 ?auto_6128 ) ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( HOIST-AT ?auto_6134 ?auto_6133 ) ( not ( = ?auto_6130 ?auto_6134 ) ) ( SURFACE-AT ?auto_6127 ?auto_6133 ) ( ON ?auto_6127 ?auto_6136 ) ( CLEAR ?auto_6127 ) ( not ( = ?auto_6127 ?auto_6136 ) ) ( not ( = ?auto_6128 ?auto_6136 ) ) ( IS-CRATE ?auto_6128 ) ( not ( = ?auto_6127 ?auto_6131 ) ) ( not ( = ?auto_6128 ?auto_6131 ) ) ( not ( = ?auto_6136 ?auto_6131 ) ) ( AVAILABLE ?auto_6134 ) ( SURFACE-AT ?auto_6128 ?auto_6133 ) ( ON ?auto_6128 ?auto_6129 ) ( CLEAR ?auto_6128 ) ( not ( = ?auto_6127 ?auto_6129 ) ) ( not ( = ?auto_6128 ?auto_6129 ) ) ( not ( = ?auto_6136 ?auto_6129 ) ) ( not ( = ?auto_6131 ?auto_6129 ) ) ( TRUCK-AT ?auto_6132 ?auto_6135 ) ( SURFACE-AT ?auto_6137 ?auto_6135 ) ( CLEAR ?auto_6137 ) ( LIFTING ?auto_6130 ?auto_6131 ) ( IS-CRATE ?auto_6131 ) ( not ( = ?auto_6127 ?auto_6137 ) ) ( not ( = ?auto_6128 ?auto_6137 ) ) ( not ( = ?auto_6136 ?auto_6137 ) ) ( not ( = ?auto_6131 ?auto_6137 ) ) ( not ( = ?auto_6129 ?auto_6137 ) ) )
    :subtasks
    ( ( !DROP ?auto_6130 ?auto_6131 ?auto_6137 ?auto_6135 )
      ( MAKE-ON ?auto_6127 ?auto_6128 )
      ( MAKE-ON-VERIFY ?auto_6127 ?auto_6128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6138 - SURFACE
      ?auto_6139 - SURFACE
    )
    :vars
    (
      ?auto_6144 - HOIST
      ?auto_6141 - PLACE
      ?auto_6147 - PLACE
      ?auto_6146 - HOIST
      ?auto_6142 - SURFACE
      ?auto_6145 - SURFACE
      ?auto_6143 - SURFACE
      ?auto_6140 - TRUCK
      ?auto_6148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6144 ?auto_6141 ) ( IS-CRATE ?auto_6138 ) ( not ( = ?auto_6138 ?auto_6139 ) ) ( not ( = ?auto_6147 ?auto_6141 ) ) ( HOIST-AT ?auto_6146 ?auto_6147 ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( SURFACE-AT ?auto_6138 ?auto_6147 ) ( ON ?auto_6138 ?auto_6142 ) ( CLEAR ?auto_6138 ) ( not ( = ?auto_6138 ?auto_6142 ) ) ( not ( = ?auto_6139 ?auto_6142 ) ) ( IS-CRATE ?auto_6139 ) ( not ( = ?auto_6138 ?auto_6145 ) ) ( not ( = ?auto_6139 ?auto_6145 ) ) ( not ( = ?auto_6142 ?auto_6145 ) ) ( AVAILABLE ?auto_6146 ) ( SURFACE-AT ?auto_6139 ?auto_6147 ) ( ON ?auto_6139 ?auto_6143 ) ( CLEAR ?auto_6139 ) ( not ( = ?auto_6138 ?auto_6143 ) ) ( not ( = ?auto_6139 ?auto_6143 ) ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( not ( = ?auto_6145 ?auto_6143 ) ) ( TRUCK-AT ?auto_6140 ?auto_6141 ) ( SURFACE-AT ?auto_6148 ?auto_6141 ) ( CLEAR ?auto_6148 ) ( IS-CRATE ?auto_6145 ) ( not ( = ?auto_6138 ?auto_6148 ) ) ( not ( = ?auto_6139 ?auto_6148 ) ) ( not ( = ?auto_6142 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( AVAILABLE ?auto_6144 ) ( IN ?auto_6145 ?auto_6140 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6144 ?auto_6145 ?auto_6140 ?auto_6141 )
      ( MAKE-ON ?auto_6138 ?auto_6139 )
      ( MAKE-ON-VERIFY ?auto_6138 ?auto_6139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6149 - SURFACE
      ?auto_6150 - SURFACE
    )
    :vars
    (
      ?auto_6153 - HOIST
      ?auto_6152 - PLACE
      ?auto_6158 - PLACE
      ?auto_6157 - HOIST
      ?auto_6151 - SURFACE
      ?auto_6156 - SURFACE
      ?auto_6155 - SURFACE
      ?auto_6154 - SURFACE
      ?auto_6159 - TRUCK
      ?auto_6160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6153 ?auto_6152 ) ( IS-CRATE ?auto_6149 ) ( not ( = ?auto_6149 ?auto_6150 ) ) ( not ( = ?auto_6158 ?auto_6152 ) ) ( HOIST-AT ?auto_6157 ?auto_6158 ) ( not ( = ?auto_6153 ?auto_6157 ) ) ( SURFACE-AT ?auto_6149 ?auto_6158 ) ( ON ?auto_6149 ?auto_6151 ) ( CLEAR ?auto_6149 ) ( not ( = ?auto_6149 ?auto_6151 ) ) ( not ( = ?auto_6150 ?auto_6151 ) ) ( IS-CRATE ?auto_6150 ) ( not ( = ?auto_6149 ?auto_6156 ) ) ( not ( = ?auto_6150 ?auto_6156 ) ) ( not ( = ?auto_6151 ?auto_6156 ) ) ( AVAILABLE ?auto_6157 ) ( SURFACE-AT ?auto_6150 ?auto_6158 ) ( ON ?auto_6150 ?auto_6155 ) ( CLEAR ?auto_6150 ) ( not ( = ?auto_6149 ?auto_6155 ) ) ( not ( = ?auto_6150 ?auto_6155 ) ) ( not ( = ?auto_6151 ?auto_6155 ) ) ( not ( = ?auto_6156 ?auto_6155 ) ) ( SURFACE-AT ?auto_6154 ?auto_6152 ) ( CLEAR ?auto_6154 ) ( IS-CRATE ?auto_6156 ) ( not ( = ?auto_6149 ?auto_6154 ) ) ( not ( = ?auto_6150 ?auto_6154 ) ) ( not ( = ?auto_6151 ?auto_6154 ) ) ( not ( = ?auto_6156 ?auto_6154 ) ) ( not ( = ?auto_6155 ?auto_6154 ) ) ( AVAILABLE ?auto_6153 ) ( IN ?auto_6156 ?auto_6159 ) ( TRUCK-AT ?auto_6159 ?auto_6160 ) ( not ( = ?auto_6160 ?auto_6152 ) ) ( not ( = ?auto_6158 ?auto_6160 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6159 ?auto_6160 ?auto_6152 )
      ( MAKE-ON ?auto_6149 ?auto_6150 )
      ( MAKE-ON-VERIFY ?auto_6149 ?auto_6150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6161 - SURFACE
      ?auto_6162 - SURFACE
    )
    :vars
    (
      ?auto_6170 - HOIST
      ?auto_6166 - PLACE
      ?auto_6169 - PLACE
      ?auto_6171 - HOIST
      ?auto_6164 - SURFACE
      ?auto_6168 - SURFACE
      ?auto_6165 - SURFACE
      ?auto_6167 - SURFACE
      ?auto_6163 - TRUCK
      ?auto_6172 - PLACE
      ?auto_6173 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6170 ?auto_6166 ) ( IS-CRATE ?auto_6161 ) ( not ( = ?auto_6161 ?auto_6162 ) ) ( not ( = ?auto_6169 ?auto_6166 ) ) ( HOIST-AT ?auto_6171 ?auto_6169 ) ( not ( = ?auto_6170 ?auto_6171 ) ) ( SURFACE-AT ?auto_6161 ?auto_6169 ) ( ON ?auto_6161 ?auto_6164 ) ( CLEAR ?auto_6161 ) ( not ( = ?auto_6161 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( IS-CRATE ?auto_6162 ) ( not ( = ?auto_6161 ?auto_6168 ) ) ( not ( = ?auto_6162 ?auto_6168 ) ) ( not ( = ?auto_6164 ?auto_6168 ) ) ( AVAILABLE ?auto_6171 ) ( SURFACE-AT ?auto_6162 ?auto_6169 ) ( ON ?auto_6162 ?auto_6165 ) ( CLEAR ?auto_6162 ) ( not ( = ?auto_6161 ?auto_6165 ) ) ( not ( = ?auto_6162 ?auto_6165 ) ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6168 ?auto_6165 ) ) ( SURFACE-AT ?auto_6167 ?auto_6166 ) ( CLEAR ?auto_6167 ) ( IS-CRATE ?auto_6168 ) ( not ( = ?auto_6161 ?auto_6167 ) ) ( not ( = ?auto_6162 ?auto_6167 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6168 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( AVAILABLE ?auto_6170 ) ( TRUCK-AT ?auto_6163 ?auto_6172 ) ( not ( = ?auto_6172 ?auto_6166 ) ) ( not ( = ?auto_6169 ?auto_6172 ) ) ( HOIST-AT ?auto_6173 ?auto_6172 ) ( LIFTING ?auto_6173 ?auto_6168 ) ( not ( = ?auto_6170 ?auto_6173 ) ) ( not ( = ?auto_6171 ?auto_6173 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6173 ?auto_6168 ?auto_6163 ?auto_6172 )
      ( MAKE-ON ?auto_6161 ?auto_6162 )
      ( MAKE-ON-VERIFY ?auto_6161 ?auto_6162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6174 - SURFACE
      ?auto_6175 - SURFACE
    )
    :vars
    (
      ?auto_6181 - HOIST
      ?auto_6177 - PLACE
      ?auto_6184 - PLACE
      ?auto_6185 - HOIST
      ?auto_6179 - SURFACE
      ?auto_6182 - SURFACE
      ?auto_6183 - SURFACE
      ?auto_6176 - SURFACE
      ?auto_6180 - TRUCK
      ?auto_6178 - PLACE
      ?auto_6186 - HOIST
      ?auto_6187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6181 ?auto_6177 ) ( IS-CRATE ?auto_6174 ) ( not ( = ?auto_6174 ?auto_6175 ) ) ( not ( = ?auto_6184 ?auto_6177 ) ) ( HOIST-AT ?auto_6185 ?auto_6184 ) ( not ( = ?auto_6181 ?auto_6185 ) ) ( SURFACE-AT ?auto_6174 ?auto_6184 ) ( ON ?auto_6174 ?auto_6179 ) ( CLEAR ?auto_6174 ) ( not ( = ?auto_6174 ?auto_6179 ) ) ( not ( = ?auto_6175 ?auto_6179 ) ) ( IS-CRATE ?auto_6175 ) ( not ( = ?auto_6174 ?auto_6182 ) ) ( not ( = ?auto_6175 ?auto_6182 ) ) ( not ( = ?auto_6179 ?auto_6182 ) ) ( AVAILABLE ?auto_6185 ) ( SURFACE-AT ?auto_6175 ?auto_6184 ) ( ON ?auto_6175 ?auto_6183 ) ( CLEAR ?auto_6175 ) ( not ( = ?auto_6174 ?auto_6183 ) ) ( not ( = ?auto_6175 ?auto_6183 ) ) ( not ( = ?auto_6179 ?auto_6183 ) ) ( not ( = ?auto_6182 ?auto_6183 ) ) ( SURFACE-AT ?auto_6176 ?auto_6177 ) ( CLEAR ?auto_6176 ) ( IS-CRATE ?auto_6182 ) ( not ( = ?auto_6174 ?auto_6176 ) ) ( not ( = ?auto_6175 ?auto_6176 ) ) ( not ( = ?auto_6179 ?auto_6176 ) ) ( not ( = ?auto_6182 ?auto_6176 ) ) ( not ( = ?auto_6183 ?auto_6176 ) ) ( AVAILABLE ?auto_6181 ) ( TRUCK-AT ?auto_6180 ?auto_6178 ) ( not ( = ?auto_6178 ?auto_6177 ) ) ( not ( = ?auto_6184 ?auto_6178 ) ) ( HOIST-AT ?auto_6186 ?auto_6178 ) ( not ( = ?auto_6181 ?auto_6186 ) ) ( not ( = ?auto_6185 ?auto_6186 ) ) ( AVAILABLE ?auto_6186 ) ( SURFACE-AT ?auto_6182 ?auto_6178 ) ( ON ?auto_6182 ?auto_6187 ) ( CLEAR ?auto_6182 ) ( not ( = ?auto_6174 ?auto_6187 ) ) ( not ( = ?auto_6175 ?auto_6187 ) ) ( not ( = ?auto_6179 ?auto_6187 ) ) ( not ( = ?auto_6182 ?auto_6187 ) ) ( not ( = ?auto_6183 ?auto_6187 ) ) ( not ( = ?auto_6176 ?auto_6187 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6186 ?auto_6182 ?auto_6187 ?auto_6178 )
      ( MAKE-ON ?auto_6174 ?auto_6175 )
      ( MAKE-ON-VERIFY ?auto_6174 ?auto_6175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6188 - SURFACE
      ?auto_6189 - SURFACE
    )
    :vars
    (
      ?auto_6199 - HOIST
      ?auto_6200 - PLACE
      ?auto_6196 - PLACE
      ?auto_6190 - HOIST
      ?auto_6197 - SURFACE
      ?auto_6193 - SURFACE
      ?auto_6192 - SURFACE
      ?auto_6198 - SURFACE
      ?auto_6191 - PLACE
      ?auto_6195 - HOIST
      ?auto_6201 - SURFACE
      ?auto_6194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6199 ?auto_6200 ) ( IS-CRATE ?auto_6188 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6196 ?auto_6200 ) ) ( HOIST-AT ?auto_6190 ?auto_6196 ) ( not ( = ?auto_6199 ?auto_6190 ) ) ( SURFACE-AT ?auto_6188 ?auto_6196 ) ( ON ?auto_6188 ?auto_6197 ) ( CLEAR ?auto_6188 ) ( not ( = ?auto_6188 ?auto_6197 ) ) ( not ( = ?auto_6189 ?auto_6197 ) ) ( IS-CRATE ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6193 ) ) ( not ( = ?auto_6189 ?auto_6193 ) ) ( not ( = ?auto_6197 ?auto_6193 ) ) ( AVAILABLE ?auto_6190 ) ( SURFACE-AT ?auto_6189 ?auto_6196 ) ( ON ?auto_6189 ?auto_6192 ) ( CLEAR ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6192 ) ) ( not ( = ?auto_6189 ?auto_6192 ) ) ( not ( = ?auto_6197 ?auto_6192 ) ) ( not ( = ?auto_6193 ?auto_6192 ) ) ( SURFACE-AT ?auto_6198 ?auto_6200 ) ( CLEAR ?auto_6198 ) ( IS-CRATE ?auto_6193 ) ( not ( = ?auto_6188 ?auto_6198 ) ) ( not ( = ?auto_6189 ?auto_6198 ) ) ( not ( = ?auto_6197 ?auto_6198 ) ) ( not ( = ?auto_6193 ?auto_6198 ) ) ( not ( = ?auto_6192 ?auto_6198 ) ) ( AVAILABLE ?auto_6199 ) ( not ( = ?auto_6191 ?auto_6200 ) ) ( not ( = ?auto_6196 ?auto_6191 ) ) ( HOIST-AT ?auto_6195 ?auto_6191 ) ( not ( = ?auto_6199 ?auto_6195 ) ) ( not ( = ?auto_6190 ?auto_6195 ) ) ( AVAILABLE ?auto_6195 ) ( SURFACE-AT ?auto_6193 ?auto_6191 ) ( ON ?auto_6193 ?auto_6201 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6188 ?auto_6201 ) ) ( not ( = ?auto_6189 ?auto_6201 ) ) ( not ( = ?auto_6197 ?auto_6201 ) ) ( not ( = ?auto_6193 ?auto_6201 ) ) ( not ( = ?auto_6192 ?auto_6201 ) ) ( not ( = ?auto_6198 ?auto_6201 ) ) ( TRUCK-AT ?auto_6194 ?auto_6200 ) )
    :subtasks
    ( ( !DRIVE ?auto_6194 ?auto_6200 ?auto_6191 )
      ( MAKE-ON ?auto_6188 ?auto_6189 )
      ( MAKE-ON-VERIFY ?auto_6188 ?auto_6189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6202 - SURFACE
      ?auto_6203 - SURFACE
    )
    :vars
    (
      ?auto_6206 - HOIST
      ?auto_6204 - PLACE
      ?auto_6211 - PLACE
      ?auto_6215 - HOIST
      ?auto_6205 - SURFACE
      ?auto_6214 - SURFACE
      ?auto_6210 - SURFACE
      ?auto_6208 - SURFACE
      ?auto_6212 - PLACE
      ?auto_6207 - HOIST
      ?auto_6213 - SURFACE
      ?auto_6209 - TRUCK
      ?auto_6216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6206 ?auto_6204 ) ( IS-CRATE ?auto_6202 ) ( not ( = ?auto_6202 ?auto_6203 ) ) ( not ( = ?auto_6211 ?auto_6204 ) ) ( HOIST-AT ?auto_6215 ?auto_6211 ) ( not ( = ?auto_6206 ?auto_6215 ) ) ( SURFACE-AT ?auto_6202 ?auto_6211 ) ( ON ?auto_6202 ?auto_6205 ) ( CLEAR ?auto_6202 ) ( not ( = ?auto_6202 ?auto_6205 ) ) ( not ( = ?auto_6203 ?auto_6205 ) ) ( IS-CRATE ?auto_6203 ) ( not ( = ?auto_6202 ?auto_6214 ) ) ( not ( = ?auto_6203 ?auto_6214 ) ) ( not ( = ?auto_6205 ?auto_6214 ) ) ( AVAILABLE ?auto_6215 ) ( SURFACE-AT ?auto_6203 ?auto_6211 ) ( ON ?auto_6203 ?auto_6210 ) ( CLEAR ?auto_6203 ) ( not ( = ?auto_6202 ?auto_6210 ) ) ( not ( = ?auto_6203 ?auto_6210 ) ) ( not ( = ?auto_6205 ?auto_6210 ) ) ( not ( = ?auto_6214 ?auto_6210 ) ) ( IS-CRATE ?auto_6214 ) ( not ( = ?auto_6202 ?auto_6208 ) ) ( not ( = ?auto_6203 ?auto_6208 ) ) ( not ( = ?auto_6205 ?auto_6208 ) ) ( not ( = ?auto_6214 ?auto_6208 ) ) ( not ( = ?auto_6210 ?auto_6208 ) ) ( not ( = ?auto_6212 ?auto_6204 ) ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( HOIST-AT ?auto_6207 ?auto_6212 ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6215 ?auto_6207 ) ) ( AVAILABLE ?auto_6207 ) ( SURFACE-AT ?auto_6214 ?auto_6212 ) ( ON ?auto_6214 ?auto_6213 ) ( CLEAR ?auto_6214 ) ( not ( = ?auto_6202 ?auto_6213 ) ) ( not ( = ?auto_6203 ?auto_6213 ) ) ( not ( = ?auto_6205 ?auto_6213 ) ) ( not ( = ?auto_6214 ?auto_6213 ) ) ( not ( = ?auto_6210 ?auto_6213 ) ) ( not ( = ?auto_6208 ?auto_6213 ) ) ( TRUCK-AT ?auto_6209 ?auto_6204 ) ( SURFACE-AT ?auto_6216 ?auto_6204 ) ( CLEAR ?auto_6216 ) ( LIFTING ?auto_6206 ?auto_6208 ) ( IS-CRATE ?auto_6208 ) ( not ( = ?auto_6202 ?auto_6216 ) ) ( not ( = ?auto_6203 ?auto_6216 ) ) ( not ( = ?auto_6205 ?auto_6216 ) ) ( not ( = ?auto_6214 ?auto_6216 ) ) ( not ( = ?auto_6210 ?auto_6216 ) ) ( not ( = ?auto_6208 ?auto_6216 ) ) ( not ( = ?auto_6213 ?auto_6216 ) ) )
    :subtasks
    ( ( !DROP ?auto_6206 ?auto_6208 ?auto_6216 ?auto_6204 )
      ( MAKE-ON ?auto_6202 ?auto_6203 )
      ( MAKE-ON-VERIFY ?auto_6202 ?auto_6203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6217 - SURFACE
      ?auto_6218 - SURFACE
    )
    :vars
    (
      ?auto_6220 - HOIST
      ?auto_6221 - PLACE
      ?auto_6226 - PLACE
      ?auto_6222 - HOIST
      ?auto_6227 - SURFACE
      ?auto_6224 - SURFACE
      ?auto_6223 - SURFACE
      ?auto_6230 - SURFACE
      ?auto_6225 - PLACE
      ?auto_6228 - HOIST
      ?auto_6219 - SURFACE
      ?auto_6229 - TRUCK
      ?auto_6231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6220 ?auto_6221 ) ( IS-CRATE ?auto_6217 ) ( not ( = ?auto_6217 ?auto_6218 ) ) ( not ( = ?auto_6226 ?auto_6221 ) ) ( HOIST-AT ?auto_6222 ?auto_6226 ) ( not ( = ?auto_6220 ?auto_6222 ) ) ( SURFACE-AT ?auto_6217 ?auto_6226 ) ( ON ?auto_6217 ?auto_6227 ) ( CLEAR ?auto_6217 ) ( not ( = ?auto_6217 ?auto_6227 ) ) ( not ( = ?auto_6218 ?auto_6227 ) ) ( IS-CRATE ?auto_6218 ) ( not ( = ?auto_6217 ?auto_6224 ) ) ( not ( = ?auto_6218 ?auto_6224 ) ) ( not ( = ?auto_6227 ?auto_6224 ) ) ( AVAILABLE ?auto_6222 ) ( SURFACE-AT ?auto_6218 ?auto_6226 ) ( ON ?auto_6218 ?auto_6223 ) ( CLEAR ?auto_6218 ) ( not ( = ?auto_6217 ?auto_6223 ) ) ( not ( = ?auto_6218 ?auto_6223 ) ) ( not ( = ?auto_6227 ?auto_6223 ) ) ( not ( = ?auto_6224 ?auto_6223 ) ) ( IS-CRATE ?auto_6224 ) ( not ( = ?auto_6217 ?auto_6230 ) ) ( not ( = ?auto_6218 ?auto_6230 ) ) ( not ( = ?auto_6227 ?auto_6230 ) ) ( not ( = ?auto_6224 ?auto_6230 ) ) ( not ( = ?auto_6223 ?auto_6230 ) ) ( not ( = ?auto_6225 ?auto_6221 ) ) ( not ( = ?auto_6226 ?auto_6225 ) ) ( HOIST-AT ?auto_6228 ?auto_6225 ) ( not ( = ?auto_6220 ?auto_6228 ) ) ( not ( = ?auto_6222 ?auto_6228 ) ) ( AVAILABLE ?auto_6228 ) ( SURFACE-AT ?auto_6224 ?auto_6225 ) ( ON ?auto_6224 ?auto_6219 ) ( CLEAR ?auto_6224 ) ( not ( = ?auto_6217 ?auto_6219 ) ) ( not ( = ?auto_6218 ?auto_6219 ) ) ( not ( = ?auto_6227 ?auto_6219 ) ) ( not ( = ?auto_6224 ?auto_6219 ) ) ( not ( = ?auto_6223 ?auto_6219 ) ) ( not ( = ?auto_6230 ?auto_6219 ) ) ( TRUCK-AT ?auto_6229 ?auto_6221 ) ( SURFACE-AT ?auto_6231 ?auto_6221 ) ( CLEAR ?auto_6231 ) ( IS-CRATE ?auto_6230 ) ( not ( = ?auto_6217 ?auto_6231 ) ) ( not ( = ?auto_6218 ?auto_6231 ) ) ( not ( = ?auto_6227 ?auto_6231 ) ) ( not ( = ?auto_6224 ?auto_6231 ) ) ( not ( = ?auto_6223 ?auto_6231 ) ) ( not ( = ?auto_6230 ?auto_6231 ) ) ( not ( = ?auto_6219 ?auto_6231 ) ) ( AVAILABLE ?auto_6220 ) ( IN ?auto_6230 ?auto_6229 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6220 ?auto_6230 ?auto_6229 ?auto_6221 )
      ( MAKE-ON ?auto_6217 ?auto_6218 )
      ( MAKE-ON-VERIFY ?auto_6217 ?auto_6218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6232 - SURFACE
      ?auto_6233 - SURFACE
    )
    :vars
    (
      ?auto_6237 - HOIST
      ?auto_6243 - PLACE
      ?auto_6236 - PLACE
      ?auto_6241 - HOIST
      ?auto_6246 - SURFACE
      ?auto_6244 - SURFACE
      ?auto_6238 - SURFACE
      ?auto_6242 - SURFACE
      ?auto_6245 - PLACE
      ?auto_6239 - HOIST
      ?auto_6240 - SURFACE
      ?auto_6235 - SURFACE
      ?auto_6234 - TRUCK
      ?auto_6247 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6237 ?auto_6243 ) ( IS-CRATE ?auto_6232 ) ( not ( = ?auto_6232 ?auto_6233 ) ) ( not ( = ?auto_6236 ?auto_6243 ) ) ( HOIST-AT ?auto_6241 ?auto_6236 ) ( not ( = ?auto_6237 ?auto_6241 ) ) ( SURFACE-AT ?auto_6232 ?auto_6236 ) ( ON ?auto_6232 ?auto_6246 ) ( CLEAR ?auto_6232 ) ( not ( = ?auto_6232 ?auto_6246 ) ) ( not ( = ?auto_6233 ?auto_6246 ) ) ( IS-CRATE ?auto_6233 ) ( not ( = ?auto_6232 ?auto_6244 ) ) ( not ( = ?auto_6233 ?auto_6244 ) ) ( not ( = ?auto_6246 ?auto_6244 ) ) ( AVAILABLE ?auto_6241 ) ( SURFACE-AT ?auto_6233 ?auto_6236 ) ( ON ?auto_6233 ?auto_6238 ) ( CLEAR ?auto_6233 ) ( not ( = ?auto_6232 ?auto_6238 ) ) ( not ( = ?auto_6233 ?auto_6238 ) ) ( not ( = ?auto_6246 ?auto_6238 ) ) ( not ( = ?auto_6244 ?auto_6238 ) ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6232 ?auto_6242 ) ) ( not ( = ?auto_6233 ?auto_6242 ) ) ( not ( = ?auto_6246 ?auto_6242 ) ) ( not ( = ?auto_6244 ?auto_6242 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6245 ?auto_6243 ) ) ( not ( = ?auto_6236 ?auto_6245 ) ) ( HOIST-AT ?auto_6239 ?auto_6245 ) ( not ( = ?auto_6237 ?auto_6239 ) ) ( not ( = ?auto_6241 ?auto_6239 ) ) ( AVAILABLE ?auto_6239 ) ( SURFACE-AT ?auto_6244 ?auto_6245 ) ( ON ?auto_6244 ?auto_6240 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6232 ?auto_6240 ) ) ( not ( = ?auto_6233 ?auto_6240 ) ) ( not ( = ?auto_6246 ?auto_6240 ) ) ( not ( = ?auto_6244 ?auto_6240 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6242 ?auto_6240 ) ) ( SURFACE-AT ?auto_6235 ?auto_6243 ) ( CLEAR ?auto_6235 ) ( IS-CRATE ?auto_6242 ) ( not ( = ?auto_6232 ?auto_6235 ) ) ( not ( = ?auto_6233 ?auto_6235 ) ) ( not ( = ?auto_6246 ?auto_6235 ) ) ( not ( = ?auto_6244 ?auto_6235 ) ) ( not ( = ?auto_6238 ?auto_6235 ) ) ( not ( = ?auto_6242 ?auto_6235 ) ) ( not ( = ?auto_6240 ?auto_6235 ) ) ( AVAILABLE ?auto_6237 ) ( IN ?auto_6242 ?auto_6234 ) ( TRUCK-AT ?auto_6234 ?auto_6247 ) ( not ( = ?auto_6247 ?auto_6243 ) ) ( not ( = ?auto_6236 ?auto_6247 ) ) ( not ( = ?auto_6245 ?auto_6247 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6234 ?auto_6247 ?auto_6243 )
      ( MAKE-ON ?auto_6232 ?auto_6233 )
      ( MAKE-ON-VERIFY ?auto_6232 ?auto_6233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6248 - SURFACE
      ?auto_6249 - SURFACE
    )
    :vars
    (
      ?auto_6260 - HOIST
      ?auto_6254 - PLACE
      ?auto_6258 - PLACE
      ?auto_6256 - HOIST
      ?auto_6255 - SURFACE
      ?auto_6259 - SURFACE
      ?auto_6253 - SURFACE
      ?auto_6261 - SURFACE
      ?auto_6252 - PLACE
      ?auto_6257 - HOIST
      ?auto_6250 - SURFACE
      ?auto_6251 - SURFACE
      ?auto_6262 - TRUCK
      ?auto_6263 - PLACE
      ?auto_6264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6260 ?auto_6254 ) ( IS-CRATE ?auto_6248 ) ( not ( = ?auto_6248 ?auto_6249 ) ) ( not ( = ?auto_6258 ?auto_6254 ) ) ( HOIST-AT ?auto_6256 ?auto_6258 ) ( not ( = ?auto_6260 ?auto_6256 ) ) ( SURFACE-AT ?auto_6248 ?auto_6258 ) ( ON ?auto_6248 ?auto_6255 ) ( CLEAR ?auto_6248 ) ( not ( = ?auto_6248 ?auto_6255 ) ) ( not ( = ?auto_6249 ?auto_6255 ) ) ( IS-CRATE ?auto_6249 ) ( not ( = ?auto_6248 ?auto_6259 ) ) ( not ( = ?auto_6249 ?auto_6259 ) ) ( not ( = ?auto_6255 ?auto_6259 ) ) ( AVAILABLE ?auto_6256 ) ( SURFACE-AT ?auto_6249 ?auto_6258 ) ( ON ?auto_6249 ?auto_6253 ) ( CLEAR ?auto_6249 ) ( not ( = ?auto_6248 ?auto_6253 ) ) ( not ( = ?auto_6249 ?auto_6253 ) ) ( not ( = ?auto_6255 ?auto_6253 ) ) ( not ( = ?auto_6259 ?auto_6253 ) ) ( IS-CRATE ?auto_6259 ) ( not ( = ?auto_6248 ?auto_6261 ) ) ( not ( = ?auto_6249 ?auto_6261 ) ) ( not ( = ?auto_6255 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6253 ?auto_6261 ) ) ( not ( = ?auto_6252 ?auto_6254 ) ) ( not ( = ?auto_6258 ?auto_6252 ) ) ( HOIST-AT ?auto_6257 ?auto_6252 ) ( not ( = ?auto_6260 ?auto_6257 ) ) ( not ( = ?auto_6256 ?auto_6257 ) ) ( AVAILABLE ?auto_6257 ) ( SURFACE-AT ?auto_6259 ?auto_6252 ) ( ON ?auto_6259 ?auto_6250 ) ( CLEAR ?auto_6259 ) ( not ( = ?auto_6248 ?auto_6250 ) ) ( not ( = ?auto_6249 ?auto_6250 ) ) ( not ( = ?auto_6255 ?auto_6250 ) ) ( not ( = ?auto_6259 ?auto_6250 ) ) ( not ( = ?auto_6253 ?auto_6250 ) ) ( not ( = ?auto_6261 ?auto_6250 ) ) ( SURFACE-AT ?auto_6251 ?auto_6254 ) ( CLEAR ?auto_6251 ) ( IS-CRATE ?auto_6261 ) ( not ( = ?auto_6248 ?auto_6251 ) ) ( not ( = ?auto_6249 ?auto_6251 ) ) ( not ( = ?auto_6255 ?auto_6251 ) ) ( not ( = ?auto_6259 ?auto_6251 ) ) ( not ( = ?auto_6253 ?auto_6251 ) ) ( not ( = ?auto_6261 ?auto_6251 ) ) ( not ( = ?auto_6250 ?auto_6251 ) ) ( AVAILABLE ?auto_6260 ) ( TRUCK-AT ?auto_6262 ?auto_6263 ) ( not ( = ?auto_6263 ?auto_6254 ) ) ( not ( = ?auto_6258 ?auto_6263 ) ) ( not ( = ?auto_6252 ?auto_6263 ) ) ( HOIST-AT ?auto_6264 ?auto_6263 ) ( LIFTING ?auto_6264 ?auto_6261 ) ( not ( = ?auto_6260 ?auto_6264 ) ) ( not ( = ?auto_6256 ?auto_6264 ) ) ( not ( = ?auto_6257 ?auto_6264 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6264 ?auto_6261 ?auto_6262 ?auto_6263 )
      ( MAKE-ON ?auto_6248 ?auto_6249 )
      ( MAKE-ON-VERIFY ?auto_6248 ?auto_6249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6265 - SURFACE
      ?auto_6266 - SURFACE
    )
    :vars
    (
      ?auto_6278 - HOIST
      ?auto_6272 - PLACE
      ?auto_6271 - PLACE
      ?auto_6267 - HOIST
      ?auto_6268 - SURFACE
      ?auto_6273 - SURFACE
      ?auto_6269 - SURFACE
      ?auto_6274 - SURFACE
      ?auto_6279 - PLACE
      ?auto_6280 - HOIST
      ?auto_6277 - SURFACE
      ?auto_6275 - SURFACE
      ?auto_6276 - TRUCK
      ?auto_6270 - PLACE
      ?auto_6281 - HOIST
      ?auto_6282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6278 ?auto_6272 ) ( IS-CRATE ?auto_6265 ) ( not ( = ?auto_6265 ?auto_6266 ) ) ( not ( = ?auto_6271 ?auto_6272 ) ) ( HOIST-AT ?auto_6267 ?auto_6271 ) ( not ( = ?auto_6278 ?auto_6267 ) ) ( SURFACE-AT ?auto_6265 ?auto_6271 ) ( ON ?auto_6265 ?auto_6268 ) ( CLEAR ?auto_6265 ) ( not ( = ?auto_6265 ?auto_6268 ) ) ( not ( = ?auto_6266 ?auto_6268 ) ) ( IS-CRATE ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6273 ) ) ( not ( = ?auto_6266 ?auto_6273 ) ) ( not ( = ?auto_6268 ?auto_6273 ) ) ( AVAILABLE ?auto_6267 ) ( SURFACE-AT ?auto_6266 ?auto_6271 ) ( ON ?auto_6266 ?auto_6269 ) ( CLEAR ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6269 ) ) ( not ( = ?auto_6266 ?auto_6269 ) ) ( not ( = ?auto_6268 ?auto_6269 ) ) ( not ( = ?auto_6273 ?auto_6269 ) ) ( IS-CRATE ?auto_6273 ) ( not ( = ?auto_6265 ?auto_6274 ) ) ( not ( = ?auto_6266 ?auto_6274 ) ) ( not ( = ?auto_6268 ?auto_6274 ) ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( not ( = ?auto_6269 ?auto_6274 ) ) ( not ( = ?auto_6279 ?auto_6272 ) ) ( not ( = ?auto_6271 ?auto_6279 ) ) ( HOIST-AT ?auto_6280 ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6280 ) ) ( not ( = ?auto_6267 ?auto_6280 ) ) ( AVAILABLE ?auto_6280 ) ( SURFACE-AT ?auto_6273 ?auto_6279 ) ( ON ?auto_6273 ?auto_6277 ) ( CLEAR ?auto_6273 ) ( not ( = ?auto_6265 ?auto_6277 ) ) ( not ( = ?auto_6266 ?auto_6277 ) ) ( not ( = ?auto_6268 ?auto_6277 ) ) ( not ( = ?auto_6273 ?auto_6277 ) ) ( not ( = ?auto_6269 ?auto_6277 ) ) ( not ( = ?auto_6274 ?auto_6277 ) ) ( SURFACE-AT ?auto_6275 ?auto_6272 ) ( CLEAR ?auto_6275 ) ( IS-CRATE ?auto_6274 ) ( not ( = ?auto_6265 ?auto_6275 ) ) ( not ( = ?auto_6266 ?auto_6275 ) ) ( not ( = ?auto_6268 ?auto_6275 ) ) ( not ( = ?auto_6273 ?auto_6275 ) ) ( not ( = ?auto_6269 ?auto_6275 ) ) ( not ( = ?auto_6274 ?auto_6275 ) ) ( not ( = ?auto_6277 ?auto_6275 ) ) ( AVAILABLE ?auto_6278 ) ( TRUCK-AT ?auto_6276 ?auto_6270 ) ( not ( = ?auto_6270 ?auto_6272 ) ) ( not ( = ?auto_6271 ?auto_6270 ) ) ( not ( = ?auto_6279 ?auto_6270 ) ) ( HOIST-AT ?auto_6281 ?auto_6270 ) ( not ( = ?auto_6278 ?auto_6281 ) ) ( not ( = ?auto_6267 ?auto_6281 ) ) ( not ( = ?auto_6280 ?auto_6281 ) ) ( AVAILABLE ?auto_6281 ) ( SURFACE-AT ?auto_6274 ?auto_6270 ) ( ON ?auto_6274 ?auto_6282 ) ( CLEAR ?auto_6274 ) ( not ( = ?auto_6265 ?auto_6282 ) ) ( not ( = ?auto_6266 ?auto_6282 ) ) ( not ( = ?auto_6268 ?auto_6282 ) ) ( not ( = ?auto_6273 ?auto_6282 ) ) ( not ( = ?auto_6269 ?auto_6282 ) ) ( not ( = ?auto_6274 ?auto_6282 ) ) ( not ( = ?auto_6277 ?auto_6282 ) ) ( not ( = ?auto_6275 ?auto_6282 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6281 ?auto_6274 ?auto_6282 ?auto_6270 )
      ( MAKE-ON ?auto_6265 ?auto_6266 )
      ( MAKE-ON-VERIFY ?auto_6265 ?auto_6266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6283 - SURFACE
      ?auto_6284 - SURFACE
    )
    :vars
    (
      ?auto_6291 - HOIST
      ?auto_6289 - PLACE
      ?auto_6297 - PLACE
      ?auto_6288 - HOIST
      ?auto_6290 - SURFACE
      ?auto_6299 - SURFACE
      ?auto_6293 - SURFACE
      ?auto_6287 - SURFACE
      ?auto_6292 - PLACE
      ?auto_6285 - HOIST
      ?auto_6294 - SURFACE
      ?auto_6296 - SURFACE
      ?auto_6286 - PLACE
      ?auto_6298 - HOIST
      ?auto_6300 - SURFACE
      ?auto_6295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6291 ?auto_6289 ) ( IS-CRATE ?auto_6283 ) ( not ( = ?auto_6283 ?auto_6284 ) ) ( not ( = ?auto_6297 ?auto_6289 ) ) ( HOIST-AT ?auto_6288 ?auto_6297 ) ( not ( = ?auto_6291 ?auto_6288 ) ) ( SURFACE-AT ?auto_6283 ?auto_6297 ) ( ON ?auto_6283 ?auto_6290 ) ( CLEAR ?auto_6283 ) ( not ( = ?auto_6283 ?auto_6290 ) ) ( not ( = ?auto_6284 ?auto_6290 ) ) ( IS-CRATE ?auto_6284 ) ( not ( = ?auto_6283 ?auto_6299 ) ) ( not ( = ?auto_6284 ?auto_6299 ) ) ( not ( = ?auto_6290 ?auto_6299 ) ) ( AVAILABLE ?auto_6288 ) ( SURFACE-AT ?auto_6284 ?auto_6297 ) ( ON ?auto_6284 ?auto_6293 ) ( CLEAR ?auto_6284 ) ( not ( = ?auto_6283 ?auto_6293 ) ) ( not ( = ?auto_6284 ?auto_6293 ) ) ( not ( = ?auto_6290 ?auto_6293 ) ) ( not ( = ?auto_6299 ?auto_6293 ) ) ( IS-CRATE ?auto_6299 ) ( not ( = ?auto_6283 ?auto_6287 ) ) ( not ( = ?auto_6284 ?auto_6287 ) ) ( not ( = ?auto_6290 ?auto_6287 ) ) ( not ( = ?auto_6299 ?auto_6287 ) ) ( not ( = ?auto_6293 ?auto_6287 ) ) ( not ( = ?auto_6292 ?auto_6289 ) ) ( not ( = ?auto_6297 ?auto_6292 ) ) ( HOIST-AT ?auto_6285 ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6285 ) ) ( not ( = ?auto_6288 ?auto_6285 ) ) ( AVAILABLE ?auto_6285 ) ( SURFACE-AT ?auto_6299 ?auto_6292 ) ( ON ?auto_6299 ?auto_6294 ) ( CLEAR ?auto_6299 ) ( not ( = ?auto_6283 ?auto_6294 ) ) ( not ( = ?auto_6284 ?auto_6294 ) ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( not ( = ?auto_6299 ?auto_6294 ) ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( not ( = ?auto_6287 ?auto_6294 ) ) ( SURFACE-AT ?auto_6296 ?auto_6289 ) ( CLEAR ?auto_6296 ) ( IS-CRATE ?auto_6287 ) ( not ( = ?auto_6283 ?auto_6296 ) ) ( not ( = ?auto_6284 ?auto_6296 ) ) ( not ( = ?auto_6290 ?auto_6296 ) ) ( not ( = ?auto_6299 ?auto_6296 ) ) ( not ( = ?auto_6293 ?auto_6296 ) ) ( not ( = ?auto_6287 ?auto_6296 ) ) ( not ( = ?auto_6294 ?auto_6296 ) ) ( AVAILABLE ?auto_6291 ) ( not ( = ?auto_6286 ?auto_6289 ) ) ( not ( = ?auto_6297 ?auto_6286 ) ) ( not ( = ?auto_6292 ?auto_6286 ) ) ( HOIST-AT ?auto_6298 ?auto_6286 ) ( not ( = ?auto_6291 ?auto_6298 ) ) ( not ( = ?auto_6288 ?auto_6298 ) ) ( not ( = ?auto_6285 ?auto_6298 ) ) ( AVAILABLE ?auto_6298 ) ( SURFACE-AT ?auto_6287 ?auto_6286 ) ( ON ?auto_6287 ?auto_6300 ) ( CLEAR ?auto_6287 ) ( not ( = ?auto_6283 ?auto_6300 ) ) ( not ( = ?auto_6284 ?auto_6300 ) ) ( not ( = ?auto_6290 ?auto_6300 ) ) ( not ( = ?auto_6299 ?auto_6300 ) ) ( not ( = ?auto_6293 ?auto_6300 ) ) ( not ( = ?auto_6287 ?auto_6300 ) ) ( not ( = ?auto_6294 ?auto_6300 ) ) ( not ( = ?auto_6296 ?auto_6300 ) ) ( TRUCK-AT ?auto_6295 ?auto_6289 ) )
    :subtasks
    ( ( !DRIVE ?auto_6295 ?auto_6289 ?auto_6286 )
      ( MAKE-ON ?auto_6283 ?auto_6284 )
      ( MAKE-ON-VERIFY ?auto_6283 ?auto_6284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6301 - SURFACE
      ?auto_6302 - SURFACE
    )
    :vars
    (
      ?auto_6311 - HOIST
      ?auto_6316 - PLACE
      ?auto_6315 - PLACE
      ?auto_6306 - HOIST
      ?auto_6304 - SURFACE
      ?auto_6317 - SURFACE
      ?auto_6312 - SURFACE
      ?auto_6305 - SURFACE
      ?auto_6314 - PLACE
      ?auto_6308 - HOIST
      ?auto_6309 - SURFACE
      ?auto_6313 - SURFACE
      ?auto_6307 - PLACE
      ?auto_6303 - HOIST
      ?auto_6318 - SURFACE
      ?auto_6310 - TRUCK
      ?auto_6319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6311 ?auto_6316 ) ( IS-CRATE ?auto_6301 ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( HOIST-AT ?auto_6306 ?auto_6315 ) ( not ( = ?auto_6311 ?auto_6306 ) ) ( SURFACE-AT ?auto_6301 ?auto_6315 ) ( ON ?auto_6301 ?auto_6304 ) ( CLEAR ?auto_6301 ) ( not ( = ?auto_6301 ?auto_6304 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( IS-CRATE ?auto_6302 ) ( not ( = ?auto_6301 ?auto_6317 ) ) ( not ( = ?auto_6302 ?auto_6317 ) ) ( not ( = ?auto_6304 ?auto_6317 ) ) ( AVAILABLE ?auto_6306 ) ( SURFACE-AT ?auto_6302 ?auto_6315 ) ( ON ?auto_6302 ?auto_6312 ) ( CLEAR ?auto_6302 ) ( not ( = ?auto_6301 ?auto_6312 ) ) ( not ( = ?auto_6302 ?auto_6312 ) ) ( not ( = ?auto_6304 ?auto_6312 ) ) ( not ( = ?auto_6317 ?auto_6312 ) ) ( IS-CRATE ?auto_6317 ) ( not ( = ?auto_6301 ?auto_6305 ) ) ( not ( = ?auto_6302 ?auto_6305 ) ) ( not ( = ?auto_6304 ?auto_6305 ) ) ( not ( = ?auto_6317 ?auto_6305 ) ) ( not ( = ?auto_6312 ?auto_6305 ) ) ( not ( = ?auto_6314 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6314 ) ) ( HOIST-AT ?auto_6308 ?auto_6314 ) ( not ( = ?auto_6311 ?auto_6308 ) ) ( not ( = ?auto_6306 ?auto_6308 ) ) ( AVAILABLE ?auto_6308 ) ( SURFACE-AT ?auto_6317 ?auto_6314 ) ( ON ?auto_6317 ?auto_6309 ) ( CLEAR ?auto_6317 ) ( not ( = ?auto_6301 ?auto_6309 ) ) ( not ( = ?auto_6302 ?auto_6309 ) ) ( not ( = ?auto_6304 ?auto_6309 ) ) ( not ( = ?auto_6317 ?auto_6309 ) ) ( not ( = ?auto_6312 ?auto_6309 ) ) ( not ( = ?auto_6305 ?auto_6309 ) ) ( IS-CRATE ?auto_6305 ) ( not ( = ?auto_6301 ?auto_6313 ) ) ( not ( = ?auto_6302 ?auto_6313 ) ) ( not ( = ?auto_6304 ?auto_6313 ) ) ( not ( = ?auto_6317 ?auto_6313 ) ) ( not ( = ?auto_6312 ?auto_6313 ) ) ( not ( = ?auto_6305 ?auto_6313 ) ) ( not ( = ?auto_6309 ?auto_6313 ) ) ( not ( = ?auto_6307 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6307 ) ) ( not ( = ?auto_6314 ?auto_6307 ) ) ( HOIST-AT ?auto_6303 ?auto_6307 ) ( not ( = ?auto_6311 ?auto_6303 ) ) ( not ( = ?auto_6306 ?auto_6303 ) ) ( not ( = ?auto_6308 ?auto_6303 ) ) ( AVAILABLE ?auto_6303 ) ( SURFACE-AT ?auto_6305 ?auto_6307 ) ( ON ?auto_6305 ?auto_6318 ) ( CLEAR ?auto_6305 ) ( not ( = ?auto_6301 ?auto_6318 ) ) ( not ( = ?auto_6302 ?auto_6318 ) ) ( not ( = ?auto_6304 ?auto_6318 ) ) ( not ( = ?auto_6317 ?auto_6318 ) ) ( not ( = ?auto_6312 ?auto_6318 ) ) ( not ( = ?auto_6305 ?auto_6318 ) ) ( not ( = ?auto_6309 ?auto_6318 ) ) ( not ( = ?auto_6313 ?auto_6318 ) ) ( TRUCK-AT ?auto_6310 ?auto_6316 ) ( SURFACE-AT ?auto_6319 ?auto_6316 ) ( CLEAR ?auto_6319 ) ( LIFTING ?auto_6311 ?auto_6313 ) ( IS-CRATE ?auto_6313 ) ( not ( = ?auto_6301 ?auto_6319 ) ) ( not ( = ?auto_6302 ?auto_6319 ) ) ( not ( = ?auto_6304 ?auto_6319 ) ) ( not ( = ?auto_6317 ?auto_6319 ) ) ( not ( = ?auto_6312 ?auto_6319 ) ) ( not ( = ?auto_6305 ?auto_6319 ) ) ( not ( = ?auto_6309 ?auto_6319 ) ) ( not ( = ?auto_6313 ?auto_6319 ) ) ( not ( = ?auto_6318 ?auto_6319 ) ) )
    :subtasks
    ( ( !DROP ?auto_6311 ?auto_6313 ?auto_6319 ?auto_6316 )
      ( MAKE-ON ?auto_6301 ?auto_6302 )
      ( MAKE-ON-VERIFY ?auto_6301 ?auto_6302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6320 - SURFACE
      ?auto_6321 - SURFACE
    )
    :vars
    (
      ?auto_6336 - HOIST
      ?auto_6328 - PLACE
      ?auto_6333 - PLACE
      ?auto_6323 - HOIST
      ?auto_6325 - SURFACE
      ?auto_6335 - SURFACE
      ?auto_6334 - SURFACE
      ?auto_6324 - SURFACE
      ?auto_6330 - PLACE
      ?auto_6326 - HOIST
      ?auto_6332 - SURFACE
      ?auto_6327 - SURFACE
      ?auto_6322 - PLACE
      ?auto_6337 - HOIST
      ?auto_6331 - SURFACE
      ?auto_6329 - TRUCK
      ?auto_6338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6336 ?auto_6328 ) ( IS-CRATE ?auto_6320 ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( not ( = ?auto_6333 ?auto_6328 ) ) ( HOIST-AT ?auto_6323 ?auto_6333 ) ( not ( = ?auto_6336 ?auto_6323 ) ) ( SURFACE-AT ?auto_6320 ?auto_6333 ) ( ON ?auto_6320 ?auto_6325 ) ( CLEAR ?auto_6320 ) ( not ( = ?auto_6320 ?auto_6325 ) ) ( not ( = ?auto_6321 ?auto_6325 ) ) ( IS-CRATE ?auto_6321 ) ( not ( = ?auto_6320 ?auto_6335 ) ) ( not ( = ?auto_6321 ?auto_6335 ) ) ( not ( = ?auto_6325 ?auto_6335 ) ) ( AVAILABLE ?auto_6323 ) ( SURFACE-AT ?auto_6321 ?auto_6333 ) ( ON ?auto_6321 ?auto_6334 ) ( CLEAR ?auto_6321 ) ( not ( = ?auto_6320 ?auto_6334 ) ) ( not ( = ?auto_6321 ?auto_6334 ) ) ( not ( = ?auto_6325 ?auto_6334 ) ) ( not ( = ?auto_6335 ?auto_6334 ) ) ( IS-CRATE ?auto_6335 ) ( not ( = ?auto_6320 ?auto_6324 ) ) ( not ( = ?auto_6321 ?auto_6324 ) ) ( not ( = ?auto_6325 ?auto_6324 ) ) ( not ( = ?auto_6335 ?auto_6324 ) ) ( not ( = ?auto_6334 ?auto_6324 ) ) ( not ( = ?auto_6330 ?auto_6328 ) ) ( not ( = ?auto_6333 ?auto_6330 ) ) ( HOIST-AT ?auto_6326 ?auto_6330 ) ( not ( = ?auto_6336 ?auto_6326 ) ) ( not ( = ?auto_6323 ?auto_6326 ) ) ( AVAILABLE ?auto_6326 ) ( SURFACE-AT ?auto_6335 ?auto_6330 ) ( ON ?auto_6335 ?auto_6332 ) ( CLEAR ?auto_6335 ) ( not ( = ?auto_6320 ?auto_6332 ) ) ( not ( = ?auto_6321 ?auto_6332 ) ) ( not ( = ?auto_6325 ?auto_6332 ) ) ( not ( = ?auto_6335 ?auto_6332 ) ) ( not ( = ?auto_6334 ?auto_6332 ) ) ( not ( = ?auto_6324 ?auto_6332 ) ) ( IS-CRATE ?auto_6324 ) ( not ( = ?auto_6320 ?auto_6327 ) ) ( not ( = ?auto_6321 ?auto_6327 ) ) ( not ( = ?auto_6325 ?auto_6327 ) ) ( not ( = ?auto_6335 ?auto_6327 ) ) ( not ( = ?auto_6334 ?auto_6327 ) ) ( not ( = ?auto_6324 ?auto_6327 ) ) ( not ( = ?auto_6332 ?auto_6327 ) ) ( not ( = ?auto_6322 ?auto_6328 ) ) ( not ( = ?auto_6333 ?auto_6322 ) ) ( not ( = ?auto_6330 ?auto_6322 ) ) ( HOIST-AT ?auto_6337 ?auto_6322 ) ( not ( = ?auto_6336 ?auto_6337 ) ) ( not ( = ?auto_6323 ?auto_6337 ) ) ( not ( = ?auto_6326 ?auto_6337 ) ) ( AVAILABLE ?auto_6337 ) ( SURFACE-AT ?auto_6324 ?auto_6322 ) ( ON ?auto_6324 ?auto_6331 ) ( CLEAR ?auto_6324 ) ( not ( = ?auto_6320 ?auto_6331 ) ) ( not ( = ?auto_6321 ?auto_6331 ) ) ( not ( = ?auto_6325 ?auto_6331 ) ) ( not ( = ?auto_6335 ?auto_6331 ) ) ( not ( = ?auto_6334 ?auto_6331 ) ) ( not ( = ?auto_6324 ?auto_6331 ) ) ( not ( = ?auto_6332 ?auto_6331 ) ) ( not ( = ?auto_6327 ?auto_6331 ) ) ( TRUCK-AT ?auto_6329 ?auto_6328 ) ( SURFACE-AT ?auto_6338 ?auto_6328 ) ( CLEAR ?auto_6338 ) ( IS-CRATE ?auto_6327 ) ( not ( = ?auto_6320 ?auto_6338 ) ) ( not ( = ?auto_6321 ?auto_6338 ) ) ( not ( = ?auto_6325 ?auto_6338 ) ) ( not ( = ?auto_6335 ?auto_6338 ) ) ( not ( = ?auto_6334 ?auto_6338 ) ) ( not ( = ?auto_6324 ?auto_6338 ) ) ( not ( = ?auto_6332 ?auto_6338 ) ) ( not ( = ?auto_6327 ?auto_6338 ) ) ( not ( = ?auto_6331 ?auto_6338 ) ) ( AVAILABLE ?auto_6336 ) ( IN ?auto_6327 ?auto_6329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6336 ?auto_6327 ?auto_6329 ?auto_6328 )
      ( MAKE-ON ?auto_6320 ?auto_6321 )
      ( MAKE-ON-VERIFY ?auto_6320 ?auto_6321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6339 - SURFACE
      ?auto_6340 - SURFACE
    )
    :vars
    (
      ?auto_6356 - HOIST
      ?auto_6350 - PLACE
      ?auto_6351 - PLACE
      ?auto_6353 - HOIST
      ?auto_6343 - SURFACE
      ?auto_6352 - SURFACE
      ?auto_6347 - SURFACE
      ?auto_6345 - SURFACE
      ?auto_6348 - PLACE
      ?auto_6354 - HOIST
      ?auto_6349 - SURFACE
      ?auto_6342 - SURFACE
      ?auto_6355 - PLACE
      ?auto_6346 - HOIST
      ?auto_6341 - SURFACE
      ?auto_6357 - SURFACE
      ?auto_6344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6356 ?auto_6350 ) ( IS-CRATE ?auto_6339 ) ( not ( = ?auto_6339 ?auto_6340 ) ) ( not ( = ?auto_6351 ?auto_6350 ) ) ( HOIST-AT ?auto_6353 ?auto_6351 ) ( not ( = ?auto_6356 ?auto_6353 ) ) ( SURFACE-AT ?auto_6339 ?auto_6351 ) ( ON ?auto_6339 ?auto_6343 ) ( CLEAR ?auto_6339 ) ( not ( = ?auto_6339 ?auto_6343 ) ) ( not ( = ?auto_6340 ?auto_6343 ) ) ( IS-CRATE ?auto_6340 ) ( not ( = ?auto_6339 ?auto_6352 ) ) ( not ( = ?auto_6340 ?auto_6352 ) ) ( not ( = ?auto_6343 ?auto_6352 ) ) ( AVAILABLE ?auto_6353 ) ( SURFACE-AT ?auto_6340 ?auto_6351 ) ( ON ?auto_6340 ?auto_6347 ) ( CLEAR ?auto_6340 ) ( not ( = ?auto_6339 ?auto_6347 ) ) ( not ( = ?auto_6340 ?auto_6347 ) ) ( not ( = ?auto_6343 ?auto_6347 ) ) ( not ( = ?auto_6352 ?auto_6347 ) ) ( IS-CRATE ?auto_6352 ) ( not ( = ?auto_6339 ?auto_6345 ) ) ( not ( = ?auto_6340 ?auto_6345 ) ) ( not ( = ?auto_6343 ?auto_6345 ) ) ( not ( = ?auto_6352 ?auto_6345 ) ) ( not ( = ?auto_6347 ?auto_6345 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6351 ?auto_6348 ) ) ( HOIST-AT ?auto_6354 ?auto_6348 ) ( not ( = ?auto_6356 ?auto_6354 ) ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( AVAILABLE ?auto_6354 ) ( SURFACE-AT ?auto_6352 ?auto_6348 ) ( ON ?auto_6352 ?auto_6349 ) ( CLEAR ?auto_6352 ) ( not ( = ?auto_6339 ?auto_6349 ) ) ( not ( = ?auto_6340 ?auto_6349 ) ) ( not ( = ?auto_6343 ?auto_6349 ) ) ( not ( = ?auto_6352 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6345 ?auto_6349 ) ) ( IS-CRATE ?auto_6345 ) ( not ( = ?auto_6339 ?auto_6342 ) ) ( not ( = ?auto_6340 ?auto_6342 ) ) ( not ( = ?auto_6343 ?auto_6342 ) ) ( not ( = ?auto_6352 ?auto_6342 ) ) ( not ( = ?auto_6347 ?auto_6342 ) ) ( not ( = ?auto_6345 ?auto_6342 ) ) ( not ( = ?auto_6349 ?auto_6342 ) ) ( not ( = ?auto_6355 ?auto_6350 ) ) ( not ( = ?auto_6351 ?auto_6355 ) ) ( not ( = ?auto_6348 ?auto_6355 ) ) ( HOIST-AT ?auto_6346 ?auto_6355 ) ( not ( = ?auto_6356 ?auto_6346 ) ) ( not ( = ?auto_6353 ?auto_6346 ) ) ( not ( = ?auto_6354 ?auto_6346 ) ) ( AVAILABLE ?auto_6346 ) ( SURFACE-AT ?auto_6345 ?auto_6355 ) ( ON ?auto_6345 ?auto_6341 ) ( CLEAR ?auto_6345 ) ( not ( = ?auto_6339 ?auto_6341 ) ) ( not ( = ?auto_6340 ?auto_6341 ) ) ( not ( = ?auto_6343 ?auto_6341 ) ) ( not ( = ?auto_6352 ?auto_6341 ) ) ( not ( = ?auto_6347 ?auto_6341 ) ) ( not ( = ?auto_6345 ?auto_6341 ) ) ( not ( = ?auto_6349 ?auto_6341 ) ) ( not ( = ?auto_6342 ?auto_6341 ) ) ( SURFACE-AT ?auto_6357 ?auto_6350 ) ( CLEAR ?auto_6357 ) ( IS-CRATE ?auto_6342 ) ( not ( = ?auto_6339 ?auto_6357 ) ) ( not ( = ?auto_6340 ?auto_6357 ) ) ( not ( = ?auto_6343 ?auto_6357 ) ) ( not ( = ?auto_6352 ?auto_6357 ) ) ( not ( = ?auto_6347 ?auto_6357 ) ) ( not ( = ?auto_6345 ?auto_6357 ) ) ( not ( = ?auto_6349 ?auto_6357 ) ) ( not ( = ?auto_6342 ?auto_6357 ) ) ( not ( = ?auto_6341 ?auto_6357 ) ) ( AVAILABLE ?auto_6356 ) ( IN ?auto_6342 ?auto_6344 ) ( TRUCK-AT ?auto_6344 ?auto_6355 ) )
    :subtasks
    ( ( !DRIVE ?auto_6344 ?auto_6355 ?auto_6350 )
      ( MAKE-ON ?auto_6339 ?auto_6340 )
      ( MAKE-ON-VERIFY ?auto_6339 ?auto_6340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6358 - SURFACE
      ?auto_6359 - SURFACE
    )
    :vars
    (
      ?auto_6363 - HOIST
      ?auto_6366 - PLACE
      ?auto_6374 - PLACE
      ?auto_6372 - HOIST
      ?auto_6368 - SURFACE
      ?auto_6376 - SURFACE
      ?auto_6371 - SURFACE
      ?auto_6362 - SURFACE
      ?auto_6364 - PLACE
      ?auto_6369 - HOIST
      ?auto_6361 - SURFACE
      ?auto_6375 - SURFACE
      ?auto_6370 - PLACE
      ?auto_6373 - HOIST
      ?auto_6360 - SURFACE
      ?auto_6365 - SURFACE
      ?auto_6367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6363 ?auto_6366 ) ( IS-CRATE ?auto_6358 ) ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6374 ?auto_6366 ) ) ( HOIST-AT ?auto_6372 ?auto_6374 ) ( not ( = ?auto_6363 ?auto_6372 ) ) ( SURFACE-AT ?auto_6358 ?auto_6374 ) ( ON ?auto_6358 ?auto_6368 ) ( CLEAR ?auto_6358 ) ( not ( = ?auto_6358 ?auto_6368 ) ) ( not ( = ?auto_6359 ?auto_6368 ) ) ( IS-CRATE ?auto_6359 ) ( not ( = ?auto_6358 ?auto_6376 ) ) ( not ( = ?auto_6359 ?auto_6376 ) ) ( not ( = ?auto_6368 ?auto_6376 ) ) ( AVAILABLE ?auto_6372 ) ( SURFACE-AT ?auto_6359 ?auto_6374 ) ( ON ?auto_6359 ?auto_6371 ) ( CLEAR ?auto_6359 ) ( not ( = ?auto_6358 ?auto_6371 ) ) ( not ( = ?auto_6359 ?auto_6371 ) ) ( not ( = ?auto_6368 ?auto_6371 ) ) ( not ( = ?auto_6376 ?auto_6371 ) ) ( IS-CRATE ?auto_6376 ) ( not ( = ?auto_6358 ?auto_6362 ) ) ( not ( = ?auto_6359 ?auto_6362 ) ) ( not ( = ?auto_6368 ?auto_6362 ) ) ( not ( = ?auto_6376 ?auto_6362 ) ) ( not ( = ?auto_6371 ?auto_6362 ) ) ( not ( = ?auto_6364 ?auto_6366 ) ) ( not ( = ?auto_6374 ?auto_6364 ) ) ( HOIST-AT ?auto_6369 ?auto_6364 ) ( not ( = ?auto_6363 ?auto_6369 ) ) ( not ( = ?auto_6372 ?auto_6369 ) ) ( AVAILABLE ?auto_6369 ) ( SURFACE-AT ?auto_6376 ?auto_6364 ) ( ON ?auto_6376 ?auto_6361 ) ( CLEAR ?auto_6376 ) ( not ( = ?auto_6358 ?auto_6361 ) ) ( not ( = ?auto_6359 ?auto_6361 ) ) ( not ( = ?auto_6368 ?auto_6361 ) ) ( not ( = ?auto_6376 ?auto_6361 ) ) ( not ( = ?auto_6371 ?auto_6361 ) ) ( not ( = ?auto_6362 ?auto_6361 ) ) ( IS-CRATE ?auto_6362 ) ( not ( = ?auto_6358 ?auto_6375 ) ) ( not ( = ?auto_6359 ?auto_6375 ) ) ( not ( = ?auto_6368 ?auto_6375 ) ) ( not ( = ?auto_6376 ?auto_6375 ) ) ( not ( = ?auto_6371 ?auto_6375 ) ) ( not ( = ?auto_6362 ?auto_6375 ) ) ( not ( = ?auto_6361 ?auto_6375 ) ) ( not ( = ?auto_6370 ?auto_6366 ) ) ( not ( = ?auto_6374 ?auto_6370 ) ) ( not ( = ?auto_6364 ?auto_6370 ) ) ( HOIST-AT ?auto_6373 ?auto_6370 ) ( not ( = ?auto_6363 ?auto_6373 ) ) ( not ( = ?auto_6372 ?auto_6373 ) ) ( not ( = ?auto_6369 ?auto_6373 ) ) ( SURFACE-AT ?auto_6362 ?auto_6370 ) ( ON ?auto_6362 ?auto_6360 ) ( CLEAR ?auto_6362 ) ( not ( = ?auto_6358 ?auto_6360 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6368 ?auto_6360 ) ) ( not ( = ?auto_6376 ?auto_6360 ) ) ( not ( = ?auto_6371 ?auto_6360 ) ) ( not ( = ?auto_6362 ?auto_6360 ) ) ( not ( = ?auto_6361 ?auto_6360 ) ) ( not ( = ?auto_6375 ?auto_6360 ) ) ( SURFACE-AT ?auto_6365 ?auto_6366 ) ( CLEAR ?auto_6365 ) ( IS-CRATE ?auto_6375 ) ( not ( = ?auto_6358 ?auto_6365 ) ) ( not ( = ?auto_6359 ?auto_6365 ) ) ( not ( = ?auto_6368 ?auto_6365 ) ) ( not ( = ?auto_6376 ?auto_6365 ) ) ( not ( = ?auto_6371 ?auto_6365 ) ) ( not ( = ?auto_6362 ?auto_6365 ) ) ( not ( = ?auto_6361 ?auto_6365 ) ) ( not ( = ?auto_6375 ?auto_6365 ) ) ( not ( = ?auto_6360 ?auto_6365 ) ) ( AVAILABLE ?auto_6363 ) ( TRUCK-AT ?auto_6367 ?auto_6370 ) ( LIFTING ?auto_6373 ?auto_6375 ) )
    :subtasks
    ( ( !LOAD ?auto_6373 ?auto_6375 ?auto_6367 ?auto_6370 )
      ( MAKE-ON ?auto_6358 ?auto_6359 )
      ( MAKE-ON-VERIFY ?auto_6358 ?auto_6359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6377 - SURFACE
      ?auto_6378 - SURFACE
    )
    :vars
    (
      ?auto_6392 - HOIST
      ?auto_6387 - PLACE
      ?auto_6381 - PLACE
      ?auto_6391 - HOIST
      ?auto_6388 - SURFACE
      ?auto_6380 - SURFACE
      ?auto_6393 - SURFACE
      ?auto_6390 - SURFACE
      ?auto_6386 - PLACE
      ?auto_6389 - HOIST
      ?auto_6394 - SURFACE
      ?auto_6382 - SURFACE
      ?auto_6385 - PLACE
      ?auto_6379 - HOIST
      ?auto_6384 - SURFACE
      ?auto_6395 - SURFACE
      ?auto_6383 - TRUCK
      ?auto_6396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6392 ?auto_6387 ) ( IS-CRATE ?auto_6377 ) ( not ( = ?auto_6377 ?auto_6378 ) ) ( not ( = ?auto_6381 ?auto_6387 ) ) ( HOIST-AT ?auto_6391 ?auto_6381 ) ( not ( = ?auto_6392 ?auto_6391 ) ) ( SURFACE-AT ?auto_6377 ?auto_6381 ) ( ON ?auto_6377 ?auto_6388 ) ( CLEAR ?auto_6377 ) ( not ( = ?auto_6377 ?auto_6388 ) ) ( not ( = ?auto_6378 ?auto_6388 ) ) ( IS-CRATE ?auto_6378 ) ( not ( = ?auto_6377 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6388 ?auto_6380 ) ) ( AVAILABLE ?auto_6391 ) ( SURFACE-AT ?auto_6378 ?auto_6381 ) ( ON ?auto_6378 ?auto_6393 ) ( CLEAR ?auto_6378 ) ( not ( = ?auto_6377 ?auto_6393 ) ) ( not ( = ?auto_6378 ?auto_6393 ) ) ( not ( = ?auto_6388 ?auto_6393 ) ) ( not ( = ?auto_6380 ?auto_6393 ) ) ( IS-CRATE ?auto_6380 ) ( not ( = ?auto_6377 ?auto_6390 ) ) ( not ( = ?auto_6378 ?auto_6390 ) ) ( not ( = ?auto_6388 ?auto_6390 ) ) ( not ( = ?auto_6380 ?auto_6390 ) ) ( not ( = ?auto_6393 ?auto_6390 ) ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( not ( = ?auto_6381 ?auto_6386 ) ) ( HOIST-AT ?auto_6389 ?auto_6386 ) ( not ( = ?auto_6392 ?auto_6389 ) ) ( not ( = ?auto_6391 ?auto_6389 ) ) ( AVAILABLE ?auto_6389 ) ( SURFACE-AT ?auto_6380 ?auto_6386 ) ( ON ?auto_6380 ?auto_6394 ) ( CLEAR ?auto_6380 ) ( not ( = ?auto_6377 ?auto_6394 ) ) ( not ( = ?auto_6378 ?auto_6394 ) ) ( not ( = ?auto_6388 ?auto_6394 ) ) ( not ( = ?auto_6380 ?auto_6394 ) ) ( not ( = ?auto_6393 ?auto_6394 ) ) ( not ( = ?auto_6390 ?auto_6394 ) ) ( IS-CRATE ?auto_6390 ) ( not ( = ?auto_6377 ?auto_6382 ) ) ( not ( = ?auto_6378 ?auto_6382 ) ) ( not ( = ?auto_6388 ?auto_6382 ) ) ( not ( = ?auto_6380 ?auto_6382 ) ) ( not ( = ?auto_6393 ?auto_6382 ) ) ( not ( = ?auto_6390 ?auto_6382 ) ) ( not ( = ?auto_6394 ?auto_6382 ) ) ( not ( = ?auto_6385 ?auto_6387 ) ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6386 ?auto_6385 ) ) ( HOIST-AT ?auto_6379 ?auto_6385 ) ( not ( = ?auto_6392 ?auto_6379 ) ) ( not ( = ?auto_6391 ?auto_6379 ) ) ( not ( = ?auto_6389 ?auto_6379 ) ) ( SURFACE-AT ?auto_6390 ?auto_6385 ) ( ON ?auto_6390 ?auto_6384 ) ( CLEAR ?auto_6390 ) ( not ( = ?auto_6377 ?auto_6384 ) ) ( not ( = ?auto_6378 ?auto_6384 ) ) ( not ( = ?auto_6388 ?auto_6384 ) ) ( not ( = ?auto_6380 ?auto_6384 ) ) ( not ( = ?auto_6393 ?auto_6384 ) ) ( not ( = ?auto_6390 ?auto_6384 ) ) ( not ( = ?auto_6394 ?auto_6384 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( SURFACE-AT ?auto_6395 ?auto_6387 ) ( CLEAR ?auto_6395 ) ( IS-CRATE ?auto_6382 ) ( not ( = ?auto_6377 ?auto_6395 ) ) ( not ( = ?auto_6378 ?auto_6395 ) ) ( not ( = ?auto_6388 ?auto_6395 ) ) ( not ( = ?auto_6380 ?auto_6395 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6390 ?auto_6395 ) ) ( not ( = ?auto_6394 ?auto_6395 ) ) ( not ( = ?auto_6382 ?auto_6395 ) ) ( not ( = ?auto_6384 ?auto_6395 ) ) ( AVAILABLE ?auto_6392 ) ( TRUCK-AT ?auto_6383 ?auto_6385 ) ( AVAILABLE ?auto_6379 ) ( SURFACE-AT ?auto_6382 ?auto_6385 ) ( ON ?auto_6382 ?auto_6396 ) ( CLEAR ?auto_6382 ) ( not ( = ?auto_6377 ?auto_6396 ) ) ( not ( = ?auto_6378 ?auto_6396 ) ) ( not ( = ?auto_6388 ?auto_6396 ) ) ( not ( = ?auto_6380 ?auto_6396 ) ) ( not ( = ?auto_6393 ?auto_6396 ) ) ( not ( = ?auto_6390 ?auto_6396 ) ) ( not ( = ?auto_6394 ?auto_6396 ) ) ( not ( = ?auto_6382 ?auto_6396 ) ) ( not ( = ?auto_6384 ?auto_6396 ) ) ( not ( = ?auto_6395 ?auto_6396 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6379 ?auto_6382 ?auto_6396 ?auto_6385 )
      ( MAKE-ON ?auto_6377 ?auto_6378 )
      ( MAKE-ON-VERIFY ?auto_6377 ?auto_6378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6397 - SURFACE
      ?auto_6398 - SURFACE
    )
    :vars
    (
      ?auto_6403 - HOIST
      ?auto_6415 - PLACE
      ?auto_6413 - PLACE
      ?auto_6401 - HOIST
      ?auto_6400 - SURFACE
      ?auto_6406 - SURFACE
      ?auto_6412 - SURFACE
      ?auto_6407 - SURFACE
      ?auto_6411 - PLACE
      ?auto_6399 - HOIST
      ?auto_6408 - SURFACE
      ?auto_6410 - SURFACE
      ?auto_6409 - PLACE
      ?auto_6416 - HOIST
      ?auto_6405 - SURFACE
      ?auto_6402 - SURFACE
      ?auto_6414 - SURFACE
      ?auto_6404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6403 ?auto_6415 ) ( IS-CRATE ?auto_6397 ) ( not ( = ?auto_6397 ?auto_6398 ) ) ( not ( = ?auto_6413 ?auto_6415 ) ) ( HOIST-AT ?auto_6401 ?auto_6413 ) ( not ( = ?auto_6403 ?auto_6401 ) ) ( SURFACE-AT ?auto_6397 ?auto_6413 ) ( ON ?auto_6397 ?auto_6400 ) ( CLEAR ?auto_6397 ) ( not ( = ?auto_6397 ?auto_6400 ) ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( IS-CRATE ?auto_6398 ) ( not ( = ?auto_6397 ?auto_6406 ) ) ( not ( = ?auto_6398 ?auto_6406 ) ) ( not ( = ?auto_6400 ?auto_6406 ) ) ( AVAILABLE ?auto_6401 ) ( SURFACE-AT ?auto_6398 ?auto_6413 ) ( ON ?auto_6398 ?auto_6412 ) ( CLEAR ?auto_6398 ) ( not ( = ?auto_6397 ?auto_6412 ) ) ( not ( = ?auto_6398 ?auto_6412 ) ) ( not ( = ?auto_6400 ?auto_6412 ) ) ( not ( = ?auto_6406 ?auto_6412 ) ) ( IS-CRATE ?auto_6406 ) ( not ( = ?auto_6397 ?auto_6407 ) ) ( not ( = ?auto_6398 ?auto_6407 ) ) ( not ( = ?auto_6400 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6412 ?auto_6407 ) ) ( not ( = ?auto_6411 ?auto_6415 ) ) ( not ( = ?auto_6413 ?auto_6411 ) ) ( HOIST-AT ?auto_6399 ?auto_6411 ) ( not ( = ?auto_6403 ?auto_6399 ) ) ( not ( = ?auto_6401 ?auto_6399 ) ) ( AVAILABLE ?auto_6399 ) ( SURFACE-AT ?auto_6406 ?auto_6411 ) ( ON ?auto_6406 ?auto_6408 ) ( CLEAR ?auto_6406 ) ( not ( = ?auto_6397 ?auto_6408 ) ) ( not ( = ?auto_6398 ?auto_6408 ) ) ( not ( = ?auto_6400 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( not ( = ?auto_6412 ?auto_6408 ) ) ( not ( = ?auto_6407 ?auto_6408 ) ) ( IS-CRATE ?auto_6407 ) ( not ( = ?auto_6397 ?auto_6410 ) ) ( not ( = ?auto_6398 ?auto_6410 ) ) ( not ( = ?auto_6400 ?auto_6410 ) ) ( not ( = ?auto_6406 ?auto_6410 ) ) ( not ( = ?auto_6412 ?auto_6410 ) ) ( not ( = ?auto_6407 ?auto_6410 ) ) ( not ( = ?auto_6408 ?auto_6410 ) ) ( not ( = ?auto_6409 ?auto_6415 ) ) ( not ( = ?auto_6413 ?auto_6409 ) ) ( not ( = ?auto_6411 ?auto_6409 ) ) ( HOIST-AT ?auto_6416 ?auto_6409 ) ( not ( = ?auto_6403 ?auto_6416 ) ) ( not ( = ?auto_6401 ?auto_6416 ) ) ( not ( = ?auto_6399 ?auto_6416 ) ) ( SURFACE-AT ?auto_6407 ?auto_6409 ) ( ON ?auto_6407 ?auto_6405 ) ( CLEAR ?auto_6407 ) ( not ( = ?auto_6397 ?auto_6405 ) ) ( not ( = ?auto_6398 ?auto_6405 ) ) ( not ( = ?auto_6400 ?auto_6405 ) ) ( not ( = ?auto_6406 ?auto_6405 ) ) ( not ( = ?auto_6412 ?auto_6405 ) ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( not ( = ?auto_6408 ?auto_6405 ) ) ( not ( = ?auto_6410 ?auto_6405 ) ) ( SURFACE-AT ?auto_6402 ?auto_6415 ) ( CLEAR ?auto_6402 ) ( IS-CRATE ?auto_6410 ) ( not ( = ?auto_6397 ?auto_6402 ) ) ( not ( = ?auto_6398 ?auto_6402 ) ) ( not ( = ?auto_6400 ?auto_6402 ) ) ( not ( = ?auto_6406 ?auto_6402 ) ) ( not ( = ?auto_6412 ?auto_6402 ) ) ( not ( = ?auto_6407 ?auto_6402 ) ) ( not ( = ?auto_6408 ?auto_6402 ) ) ( not ( = ?auto_6410 ?auto_6402 ) ) ( not ( = ?auto_6405 ?auto_6402 ) ) ( AVAILABLE ?auto_6403 ) ( AVAILABLE ?auto_6416 ) ( SURFACE-AT ?auto_6410 ?auto_6409 ) ( ON ?auto_6410 ?auto_6414 ) ( CLEAR ?auto_6410 ) ( not ( = ?auto_6397 ?auto_6414 ) ) ( not ( = ?auto_6398 ?auto_6414 ) ) ( not ( = ?auto_6400 ?auto_6414 ) ) ( not ( = ?auto_6406 ?auto_6414 ) ) ( not ( = ?auto_6412 ?auto_6414 ) ) ( not ( = ?auto_6407 ?auto_6414 ) ) ( not ( = ?auto_6408 ?auto_6414 ) ) ( not ( = ?auto_6410 ?auto_6414 ) ) ( not ( = ?auto_6405 ?auto_6414 ) ) ( not ( = ?auto_6402 ?auto_6414 ) ) ( TRUCK-AT ?auto_6404 ?auto_6415 ) )
    :subtasks
    ( ( !DRIVE ?auto_6404 ?auto_6415 ?auto_6409 )
      ( MAKE-ON ?auto_6397 ?auto_6398 )
      ( MAKE-ON-VERIFY ?auto_6397 ?auto_6398 ) )
  )

)

