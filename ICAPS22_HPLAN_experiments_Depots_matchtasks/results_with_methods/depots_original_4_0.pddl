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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5380 - SURFACE
      ?auto_5381 - SURFACE
    )
    :vars
    (
      ?auto_5382 - HOIST
      ?auto_5383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5382 ?auto_5383 ) ( SURFACE-AT ?auto_5380 ?auto_5383 ) ( CLEAR ?auto_5380 ) ( LIFTING ?auto_5382 ?auto_5381 ) ( IS-CRATE ?auto_5381 ) ( not ( = ?auto_5380 ?auto_5381 ) ) )
    :subtasks
    ( ( !DROP ?auto_5382 ?auto_5381 ?auto_5380 ?auto_5383 )
      ( MAKE-1CRATE-VERIFY ?auto_5380 ?auto_5381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5384 - SURFACE
      ?auto_5385 - SURFACE
    )
    :vars
    (
      ?auto_5387 - HOIST
      ?auto_5386 - PLACE
      ?auto_5388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5387 ?auto_5386 ) ( SURFACE-AT ?auto_5384 ?auto_5386 ) ( CLEAR ?auto_5384 ) ( IS-CRATE ?auto_5385 ) ( not ( = ?auto_5384 ?auto_5385 ) ) ( TRUCK-AT ?auto_5388 ?auto_5386 ) ( AVAILABLE ?auto_5387 ) ( IN ?auto_5385 ?auto_5388 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5387 ?auto_5385 ?auto_5388 ?auto_5386 )
      ( MAKE-1CRATE ?auto_5384 ?auto_5385 )
      ( MAKE-1CRATE-VERIFY ?auto_5384 ?auto_5385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5389 - SURFACE
      ?auto_5390 - SURFACE
    )
    :vars
    (
      ?auto_5393 - HOIST
      ?auto_5392 - PLACE
      ?auto_5391 - TRUCK
      ?auto_5394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5393 ?auto_5392 ) ( SURFACE-AT ?auto_5389 ?auto_5392 ) ( CLEAR ?auto_5389 ) ( IS-CRATE ?auto_5390 ) ( not ( = ?auto_5389 ?auto_5390 ) ) ( AVAILABLE ?auto_5393 ) ( IN ?auto_5390 ?auto_5391 ) ( TRUCK-AT ?auto_5391 ?auto_5394 ) ( not ( = ?auto_5394 ?auto_5392 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5391 ?auto_5394 ?auto_5392 )
      ( MAKE-1CRATE ?auto_5389 ?auto_5390 )
      ( MAKE-1CRATE-VERIFY ?auto_5389 ?auto_5390 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5395 - SURFACE
      ?auto_5396 - SURFACE
    )
    :vars
    (
      ?auto_5398 - HOIST
      ?auto_5397 - PLACE
      ?auto_5399 - TRUCK
      ?auto_5400 - PLACE
      ?auto_5401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5398 ?auto_5397 ) ( SURFACE-AT ?auto_5395 ?auto_5397 ) ( CLEAR ?auto_5395 ) ( IS-CRATE ?auto_5396 ) ( not ( = ?auto_5395 ?auto_5396 ) ) ( AVAILABLE ?auto_5398 ) ( TRUCK-AT ?auto_5399 ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5397 ) ) ( HOIST-AT ?auto_5401 ?auto_5400 ) ( LIFTING ?auto_5401 ?auto_5396 ) ( not ( = ?auto_5398 ?auto_5401 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5401 ?auto_5396 ?auto_5399 ?auto_5400 )
      ( MAKE-1CRATE ?auto_5395 ?auto_5396 )
      ( MAKE-1CRATE-VERIFY ?auto_5395 ?auto_5396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5402 - SURFACE
      ?auto_5403 - SURFACE
    )
    :vars
    (
      ?auto_5407 - HOIST
      ?auto_5408 - PLACE
      ?auto_5406 - TRUCK
      ?auto_5405 - PLACE
      ?auto_5404 - HOIST
      ?auto_5409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5407 ?auto_5408 ) ( SURFACE-AT ?auto_5402 ?auto_5408 ) ( CLEAR ?auto_5402 ) ( IS-CRATE ?auto_5403 ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( AVAILABLE ?auto_5407 ) ( TRUCK-AT ?auto_5406 ?auto_5405 ) ( not ( = ?auto_5405 ?auto_5408 ) ) ( HOIST-AT ?auto_5404 ?auto_5405 ) ( not ( = ?auto_5407 ?auto_5404 ) ) ( AVAILABLE ?auto_5404 ) ( SURFACE-AT ?auto_5403 ?auto_5405 ) ( ON ?auto_5403 ?auto_5409 ) ( CLEAR ?auto_5403 ) ( not ( = ?auto_5402 ?auto_5409 ) ) ( not ( = ?auto_5403 ?auto_5409 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5404 ?auto_5403 ?auto_5409 ?auto_5405 )
      ( MAKE-1CRATE ?auto_5402 ?auto_5403 )
      ( MAKE-1CRATE-VERIFY ?auto_5402 ?auto_5403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5410 - SURFACE
      ?auto_5411 - SURFACE
    )
    :vars
    (
      ?auto_5414 - HOIST
      ?auto_5412 - PLACE
      ?auto_5415 - PLACE
      ?auto_5417 - HOIST
      ?auto_5416 - SURFACE
      ?auto_5413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5414 ?auto_5412 ) ( SURFACE-AT ?auto_5410 ?auto_5412 ) ( CLEAR ?auto_5410 ) ( IS-CRATE ?auto_5411 ) ( not ( = ?auto_5410 ?auto_5411 ) ) ( AVAILABLE ?auto_5414 ) ( not ( = ?auto_5415 ?auto_5412 ) ) ( HOIST-AT ?auto_5417 ?auto_5415 ) ( not ( = ?auto_5414 ?auto_5417 ) ) ( AVAILABLE ?auto_5417 ) ( SURFACE-AT ?auto_5411 ?auto_5415 ) ( ON ?auto_5411 ?auto_5416 ) ( CLEAR ?auto_5411 ) ( not ( = ?auto_5410 ?auto_5416 ) ) ( not ( = ?auto_5411 ?auto_5416 ) ) ( TRUCK-AT ?auto_5413 ?auto_5412 ) )
    :subtasks
    ( ( !DRIVE ?auto_5413 ?auto_5412 ?auto_5415 )
      ( MAKE-1CRATE ?auto_5410 ?auto_5411 )
      ( MAKE-1CRATE-VERIFY ?auto_5410 ?auto_5411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5423 - SURFACE
      ?auto_5424 - SURFACE
    )
    :vars
    (
      ?auto_5425 - HOIST
      ?auto_5426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5425 ?auto_5426 ) ( SURFACE-AT ?auto_5423 ?auto_5426 ) ( CLEAR ?auto_5423 ) ( LIFTING ?auto_5425 ?auto_5424 ) ( IS-CRATE ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) )
    :subtasks
    ( ( !DROP ?auto_5425 ?auto_5424 ?auto_5423 ?auto_5426 )
      ( MAKE-1CRATE-VERIFY ?auto_5423 ?auto_5424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5427 - SURFACE
      ?auto_5428 - SURFACE
      ?auto_5429 - SURFACE
    )
    :vars
    (
      ?auto_5431 - HOIST
      ?auto_5430 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5431 ?auto_5430 ) ( SURFACE-AT ?auto_5428 ?auto_5430 ) ( CLEAR ?auto_5428 ) ( LIFTING ?auto_5431 ?auto_5429 ) ( IS-CRATE ?auto_5429 ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( ON ?auto_5428 ?auto_5427 ) ( not ( = ?auto_5427 ?auto_5428 ) ) ( not ( = ?auto_5427 ?auto_5429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5428 ?auto_5429 )
      ( MAKE-2CRATE-VERIFY ?auto_5427 ?auto_5428 ?auto_5429 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5432 - SURFACE
      ?auto_5433 - SURFACE
    )
    :vars
    (
      ?auto_5435 - HOIST
      ?auto_5434 - PLACE
      ?auto_5436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5435 ?auto_5434 ) ( SURFACE-AT ?auto_5432 ?auto_5434 ) ( CLEAR ?auto_5432 ) ( IS-CRATE ?auto_5433 ) ( not ( = ?auto_5432 ?auto_5433 ) ) ( TRUCK-AT ?auto_5436 ?auto_5434 ) ( AVAILABLE ?auto_5435 ) ( IN ?auto_5433 ?auto_5436 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5435 ?auto_5433 ?auto_5436 ?auto_5434 )
      ( MAKE-1CRATE ?auto_5432 ?auto_5433 )
      ( MAKE-1CRATE-VERIFY ?auto_5432 ?auto_5433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5437 - SURFACE
      ?auto_5438 - SURFACE
      ?auto_5439 - SURFACE
    )
    :vars
    (
      ?auto_5442 - HOIST
      ?auto_5440 - PLACE
      ?auto_5441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5442 ?auto_5440 ) ( SURFACE-AT ?auto_5438 ?auto_5440 ) ( CLEAR ?auto_5438 ) ( IS-CRATE ?auto_5439 ) ( not ( = ?auto_5438 ?auto_5439 ) ) ( TRUCK-AT ?auto_5441 ?auto_5440 ) ( AVAILABLE ?auto_5442 ) ( IN ?auto_5439 ?auto_5441 ) ( ON ?auto_5438 ?auto_5437 ) ( not ( = ?auto_5437 ?auto_5438 ) ) ( not ( = ?auto_5437 ?auto_5439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5438 ?auto_5439 )
      ( MAKE-2CRATE-VERIFY ?auto_5437 ?auto_5438 ?auto_5439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5443 - SURFACE
      ?auto_5444 - SURFACE
    )
    :vars
    (
      ?auto_5447 - HOIST
      ?auto_5448 - PLACE
      ?auto_5445 - TRUCK
      ?auto_5446 - SURFACE
      ?auto_5449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5447 ?auto_5448 ) ( SURFACE-AT ?auto_5443 ?auto_5448 ) ( CLEAR ?auto_5443 ) ( IS-CRATE ?auto_5444 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( AVAILABLE ?auto_5447 ) ( IN ?auto_5444 ?auto_5445 ) ( ON ?auto_5443 ?auto_5446 ) ( not ( = ?auto_5446 ?auto_5443 ) ) ( not ( = ?auto_5446 ?auto_5444 ) ) ( TRUCK-AT ?auto_5445 ?auto_5449 ) ( not ( = ?auto_5449 ?auto_5448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5445 ?auto_5449 ?auto_5448 )
      ( MAKE-2CRATE ?auto_5446 ?auto_5443 ?auto_5444 )
      ( MAKE-1CRATE-VERIFY ?auto_5443 ?auto_5444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5450 - SURFACE
      ?auto_5451 - SURFACE
      ?auto_5452 - SURFACE
    )
    :vars
    (
      ?auto_5454 - HOIST
      ?auto_5453 - PLACE
      ?auto_5455 - TRUCK
      ?auto_5456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5454 ?auto_5453 ) ( SURFACE-AT ?auto_5451 ?auto_5453 ) ( CLEAR ?auto_5451 ) ( IS-CRATE ?auto_5452 ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( AVAILABLE ?auto_5454 ) ( IN ?auto_5452 ?auto_5455 ) ( ON ?auto_5451 ?auto_5450 ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) ( TRUCK-AT ?auto_5455 ?auto_5456 ) ( not ( = ?auto_5456 ?auto_5453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5451 ?auto_5452 )
      ( MAKE-2CRATE-VERIFY ?auto_5450 ?auto_5451 ?auto_5452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5457 - SURFACE
      ?auto_5458 - SURFACE
    )
    :vars
    (
      ?auto_5461 - HOIST
      ?auto_5463 - PLACE
      ?auto_5459 - SURFACE
      ?auto_5460 - TRUCK
      ?auto_5462 - PLACE
      ?auto_5464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5461 ?auto_5463 ) ( SURFACE-AT ?auto_5457 ?auto_5463 ) ( CLEAR ?auto_5457 ) ( IS-CRATE ?auto_5458 ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( AVAILABLE ?auto_5461 ) ( ON ?auto_5457 ?auto_5459 ) ( not ( = ?auto_5459 ?auto_5457 ) ) ( not ( = ?auto_5459 ?auto_5458 ) ) ( TRUCK-AT ?auto_5460 ?auto_5462 ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( HOIST-AT ?auto_5464 ?auto_5462 ) ( LIFTING ?auto_5464 ?auto_5458 ) ( not ( = ?auto_5461 ?auto_5464 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5464 ?auto_5458 ?auto_5460 ?auto_5462 )
      ( MAKE-2CRATE ?auto_5459 ?auto_5457 ?auto_5458 )
      ( MAKE-1CRATE-VERIFY ?auto_5457 ?auto_5458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5465 - SURFACE
      ?auto_5466 - SURFACE
      ?auto_5467 - SURFACE
    )
    :vars
    (
      ?auto_5471 - HOIST
      ?auto_5472 - PLACE
      ?auto_5468 - TRUCK
      ?auto_5469 - PLACE
      ?auto_5470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5471 ?auto_5472 ) ( SURFACE-AT ?auto_5466 ?auto_5472 ) ( CLEAR ?auto_5466 ) ( IS-CRATE ?auto_5467 ) ( not ( = ?auto_5466 ?auto_5467 ) ) ( AVAILABLE ?auto_5471 ) ( ON ?auto_5466 ?auto_5465 ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( not ( = ?auto_5465 ?auto_5467 ) ) ( TRUCK-AT ?auto_5468 ?auto_5469 ) ( not ( = ?auto_5469 ?auto_5472 ) ) ( HOIST-AT ?auto_5470 ?auto_5469 ) ( LIFTING ?auto_5470 ?auto_5467 ) ( not ( = ?auto_5471 ?auto_5470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5466 ?auto_5467 )
      ( MAKE-2CRATE-VERIFY ?auto_5465 ?auto_5466 ?auto_5467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5473 - SURFACE
      ?auto_5474 - SURFACE
    )
    :vars
    (
      ?auto_5478 - HOIST
      ?auto_5477 - PLACE
      ?auto_5480 - SURFACE
      ?auto_5476 - TRUCK
      ?auto_5479 - PLACE
      ?auto_5475 - HOIST
      ?auto_5481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5478 ?auto_5477 ) ( SURFACE-AT ?auto_5473 ?auto_5477 ) ( CLEAR ?auto_5473 ) ( IS-CRATE ?auto_5474 ) ( not ( = ?auto_5473 ?auto_5474 ) ) ( AVAILABLE ?auto_5478 ) ( ON ?auto_5473 ?auto_5480 ) ( not ( = ?auto_5480 ?auto_5473 ) ) ( not ( = ?auto_5480 ?auto_5474 ) ) ( TRUCK-AT ?auto_5476 ?auto_5479 ) ( not ( = ?auto_5479 ?auto_5477 ) ) ( HOIST-AT ?auto_5475 ?auto_5479 ) ( not ( = ?auto_5478 ?auto_5475 ) ) ( AVAILABLE ?auto_5475 ) ( SURFACE-AT ?auto_5474 ?auto_5479 ) ( ON ?auto_5474 ?auto_5481 ) ( CLEAR ?auto_5474 ) ( not ( = ?auto_5473 ?auto_5481 ) ) ( not ( = ?auto_5474 ?auto_5481 ) ) ( not ( = ?auto_5480 ?auto_5481 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5475 ?auto_5474 ?auto_5481 ?auto_5479 )
      ( MAKE-2CRATE ?auto_5480 ?auto_5473 ?auto_5474 )
      ( MAKE-1CRATE-VERIFY ?auto_5473 ?auto_5474 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5482 - SURFACE
      ?auto_5483 - SURFACE
      ?auto_5484 - SURFACE
    )
    :vars
    (
      ?auto_5485 - HOIST
      ?auto_5486 - PLACE
      ?auto_5489 - TRUCK
      ?auto_5487 - PLACE
      ?auto_5488 - HOIST
      ?auto_5490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5485 ?auto_5486 ) ( SURFACE-AT ?auto_5483 ?auto_5486 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5484 ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( AVAILABLE ?auto_5485 ) ( ON ?auto_5483 ?auto_5482 ) ( not ( = ?auto_5482 ?auto_5483 ) ) ( not ( = ?auto_5482 ?auto_5484 ) ) ( TRUCK-AT ?auto_5489 ?auto_5487 ) ( not ( = ?auto_5487 ?auto_5486 ) ) ( HOIST-AT ?auto_5488 ?auto_5487 ) ( not ( = ?auto_5485 ?auto_5488 ) ) ( AVAILABLE ?auto_5488 ) ( SURFACE-AT ?auto_5484 ?auto_5487 ) ( ON ?auto_5484 ?auto_5490 ) ( CLEAR ?auto_5484 ) ( not ( = ?auto_5483 ?auto_5490 ) ) ( not ( = ?auto_5484 ?auto_5490 ) ) ( not ( = ?auto_5482 ?auto_5490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5483 ?auto_5484 )
      ( MAKE-2CRATE-VERIFY ?auto_5482 ?auto_5483 ?auto_5484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5491 - SURFACE
      ?auto_5492 - SURFACE
    )
    :vars
    (
      ?auto_5496 - HOIST
      ?auto_5495 - PLACE
      ?auto_5493 - SURFACE
      ?auto_5497 - PLACE
      ?auto_5498 - HOIST
      ?auto_5499 - SURFACE
      ?auto_5494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5496 ?auto_5495 ) ( SURFACE-AT ?auto_5491 ?auto_5495 ) ( CLEAR ?auto_5491 ) ( IS-CRATE ?auto_5492 ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( AVAILABLE ?auto_5496 ) ( ON ?auto_5491 ?auto_5493 ) ( not ( = ?auto_5493 ?auto_5491 ) ) ( not ( = ?auto_5493 ?auto_5492 ) ) ( not ( = ?auto_5497 ?auto_5495 ) ) ( HOIST-AT ?auto_5498 ?auto_5497 ) ( not ( = ?auto_5496 ?auto_5498 ) ) ( AVAILABLE ?auto_5498 ) ( SURFACE-AT ?auto_5492 ?auto_5497 ) ( ON ?auto_5492 ?auto_5499 ) ( CLEAR ?auto_5492 ) ( not ( = ?auto_5491 ?auto_5499 ) ) ( not ( = ?auto_5492 ?auto_5499 ) ) ( not ( = ?auto_5493 ?auto_5499 ) ) ( TRUCK-AT ?auto_5494 ?auto_5495 ) )
    :subtasks
    ( ( !DRIVE ?auto_5494 ?auto_5495 ?auto_5497 )
      ( MAKE-2CRATE ?auto_5493 ?auto_5491 ?auto_5492 )
      ( MAKE-1CRATE-VERIFY ?auto_5491 ?auto_5492 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5500 - SURFACE
      ?auto_5501 - SURFACE
      ?auto_5502 - SURFACE
    )
    :vars
    (
      ?auto_5507 - HOIST
      ?auto_5506 - PLACE
      ?auto_5504 - PLACE
      ?auto_5503 - HOIST
      ?auto_5508 - SURFACE
      ?auto_5505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5507 ?auto_5506 ) ( SURFACE-AT ?auto_5501 ?auto_5506 ) ( CLEAR ?auto_5501 ) ( IS-CRATE ?auto_5502 ) ( not ( = ?auto_5501 ?auto_5502 ) ) ( AVAILABLE ?auto_5507 ) ( ON ?auto_5501 ?auto_5500 ) ( not ( = ?auto_5500 ?auto_5501 ) ) ( not ( = ?auto_5500 ?auto_5502 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( HOIST-AT ?auto_5503 ?auto_5504 ) ( not ( = ?auto_5507 ?auto_5503 ) ) ( AVAILABLE ?auto_5503 ) ( SURFACE-AT ?auto_5502 ?auto_5504 ) ( ON ?auto_5502 ?auto_5508 ) ( CLEAR ?auto_5502 ) ( not ( = ?auto_5501 ?auto_5508 ) ) ( not ( = ?auto_5502 ?auto_5508 ) ) ( not ( = ?auto_5500 ?auto_5508 ) ) ( TRUCK-AT ?auto_5505 ?auto_5506 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5501 ?auto_5502 )
      ( MAKE-2CRATE-VERIFY ?auto_5500 ?auto_5501 ?auto_5502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5509 - SURFACE
      ?auto_5510 - SURFACE
    )
    :vars
    (
      ?auto_5514 - HOIST
      ?auto_5513 - PLACE
      ?auto_5512 - SURFACE
      ?auto_5511 - PLACE
      ?auto_5515 - HOIST
      ?auto_5517 - SURFACE
      ?auto_5516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5514 ?auto_5513 ) ( IS-CRATE ?auto_5510 ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5512 ?auto_5509 ) ) ( not ( = ?auto_5512 ?auto_5510 ) ) ( not ( = ?auto_5511 ?auto_5513 ) ) ( HOIST-AT ?auto_5515 ?auto_5511 ) ( not ( = ?auto_5514 ?auto_5515 ) ) ( AVAILABLE ?auto_5515 ) ( SURFACE-AT ?auto_5510 ?auto_5511 ) ( ON ?auto_5510 ?auto_5517 ) ( CLEAR ?auto_5510 ) ( not ( = ?auto_5509 ?auto_5517 ) ) ( not ( = ?auto_5510 ?auto_5517 ) ) ( not ( = ?auto_5512 ?auto_5517 ) ) ( TRUCK-AT ?auto_5516 ?auto_5513 ) ( SURFACE-AT ?auto_5512 ?auto_5513 ) ( CLEAR ?auto_5512 ) ( LIFTING ?auto_5514 ?auto_5509 ) ( IS-CRATE ?auto_5509 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5512 ?auto_5509 )
      ( MAKE-2CRATE ?auto_5512 ?auto_5509 ?auto_5510 )
      ( MAKE-1CRATE-VERIFY ?auto_5509 ?auto_5510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5518 - SURFACE
      ?auto_5519 - SURFACE
      ?auto_5520 - SURFACE
    )
    :vars
    (
      ?auto_5524 - HOIST
      ?auto_5522 - PLACE
      ?auto_5521 - PLACE
      ?auto_5525 - HOIST
      ?auto_5523 - SURFACE
      ?auto_5526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5524 ?auto_5522 ) ( IS-CRATE ?auto_5520 ) ( not ( = ?auto_5519 ?auto_5520 ) ) ( not ( = ?auto_5518 ?auto_5519 ) ) ( not ( = ?auto_5518 ?auto_5520 ) ) ( not ( = ?auto_5521 ?auto_5522 ) ) ( HOIST-AT ?auto_5525 ?auto_5521 ) ( not ( = ?auto_5524 ?auto_5525 ) ) ( AVAILABLE ?auto_5525 ) ( SURFACE-AT ?auto_5520 ?auto_5521 ) ( ON ?auto_5520 ?auto_5523 ) ( CLEAR ?auto_5520 ) ( not ( = ?auto_5519 ?auto_5523 ) ) ( not ( = ?auto_5520 ?auto_5523 ) ) ( not ( = ?auto_5518 ?auto_5523 ) ) ( TRUCK-AT ?auto_5526 ?auto_5522 ) ( SURFACE-AT ?auto_5518 ?auto_5522 ) ( CLEAR ?auto_5518 ) ( LIFTING ?auto_5524 ?auto_5519 ) ( IS-CRATE ?auto_5519 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5519 ?auto_5520 )
      ( MAKE-2CRATE-VERIFY ?auto_5518 ?auto_5519 ?auto_5520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5527 - SURFACE
      ?auto_5528 - SURFACE
    )
    :vars
    (
      ?auto_5531 - HOIST
      ?auto_5529 - PLACE
      ?auto_5533 - SURFACE
      ?auto_5534 - PLACE
      ?auto_5530 - HOIST
      ?auto_5532 - SURFACE
      ?auto_5535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5531 ?auto_5529 ) ( IS-CRATE ?auto_5528 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5533 ?auto_5527 ) ) ( not ( = ?auto_5533 ?auto_5528 ) ) ( not ( = ?auto_5534 ?auto_5529 ) ) ( HOIST-AT ?auto_5530 ?auto_5534 ) ( not ( = ?auto_5531 ?auto_5530 ) ) ( AVAILABLE ?auto_5530 ) ( SURFACE-AT ?auto_5528 ?auto_5534 ) ( ON ?auto_5528 ?auto_5532 ) ( CLEAR ?auto_5528 ) ( not ( = ?auto_5527 ?auto_5532 ) ) ( not ( = ?auto_5528 ?auto_5532 ) ) ( not ( = ?auto_5533 ?auto_5532 ) ) ( TRUCK-AT ?auto_5535 ?auto_5529 ) ( SURFACE-AT ?auto_5533 ?auto_5529 ) ( CLEAR ?auto_5533 ) ( IS-CRATE ?auto_5527 ) ( AVAILABLE ?auto_5531 ) ( IN ?auto_5527 ?auto_5535 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5531 ?auto_5527 ?auto_5535 ?auto_5529 )
      ( MAKE-2CRATE ?auto_5533 ?auto_5527 ?auto_5528 )
      ( MAKE-1CRATE-VERIFY ?auto_5527 ?auto_5528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5536 - SURFACE
      ?auto_5537 - SURFACE
      ?auto_5538 - SURFACE
    )
    :vars
    (
      ?auto_5542 - HOIST
      ?auto_5540 - PLACE
      ?auto_5543 - PLACE
      ?auto_5544 - HOIST
      ?auto_5541 - SURFACE
      ?auto_5539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5542 ?auto_5540 ) ( IS-CRATE ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5538 ) ) ( not ( = ?auto_5536 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5538 ) ) ( not ( = ?auto_5543 ?auto_5540 ) ) ( HOIST-AT ?auto_5544 ?auto_5543 ) ( not ( = ?auto_5542 ?auto_5544 ) ) ( AVAILABLE ?auto_5544 ) ( SURFACE-AT ?auto_5538 ?auto_5543 ) ( ON ?auto_5538 ?auto_5541 ) ( CLEAR ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5541 ) ) ( not ( = ?auto_5538 ?auto_5541 ) ) ( not ( = ?auto_5536 ?auto_5541 ) ) ( TRUCK-AT ?auto_5539 ?auto_5540 ) ( SURFACE-AT ?auto_5536 ?auto_5540 ) ( CLEAR ?auto_5536 ) ( IS-CRATE ?auto_5537 ) ( AVAILABLE ?auto_5542 ) ( IN ?auto_5537 ?auto_5539 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5537 ?auto_5538 )
      ( MAKE-2CRATE-VERIFY ?auto_5536 ?auto_5537 ?auto_5538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5545 - SURFACE
      ?auto_5546 - SURFACE
    )
    :vars
    (
      ?auto_5552 - HOIST
      ?auto_5547 - PLACE
      ?auto_5553 - SURFACE
      ?auto_5549 - PLACE
      ?auto_5551 - HOIST
      ?auto_5548 - SURFACE
      ?auto_5550 - TRUCK
      ?auto_5554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5552 ?auto_5547 ) ( IS-CRATE ?auto_5546 ) ( not ( = ?auto_5545 ?auto_5546 ) ) ( not ( = ?auto_5553 ?auto_5545 ) ) ( not ( = ?auto_5553 ?auto_5546 ) ) ( not ( = ?auto_5549 ?auto_5547 ) ) ( HOIST-AT ?auto_5551 ?auto_5549 ) ( not ( = ?auto_5552 ?auto_5551 ) ) ( AVAILABLE ?auto_5551 ) ( SURFACE-AT ?auto_5546 ?auto_5549 ) ( ON ?auto_5546 ?auto_5548 ) ( CLEAR ?auto_5546 ) ( not ( = ?auto_5545 ?auto_5548 ) ) ( not ( = ?auto_5546 ?auto_5548 ) ) ( not ( = ?auto_5553 ?auto_5548 ) ) ( SURFACE-AT ?auto_5553 ?auto_5547 ) ( CLEAR ?auto_5553 ) ( IS-CRATE ?auto_5545 ) ( AVAILABLE ?auto_5552 ) ( IN ?auto_5545 ?auto_5550 ) ( TRUCK-AT ?auto_5550 ?auto_5554 ) ( not ( = ?auto_5554 ?auto_5547 ) ) ( not ( = ?auto_5549 ?auto_5554 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5550 ?auto_5554 ?auto_5547 )
      ( MAKE-2CRATE ?auto_5553 ?auto_5545 ?auto_5546 )
      ( MAKE-1CRATE-VERIFY ?auto_5545 ?auto_5546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5555 - SURFACE
      ?auto_5556 - SURFACE
      ?auto_5557 - SURFACE
    )
    :vars
    (
      ?auto_5562 - HOIST
      ?auto_5560 - PLACE
      ?auto_5559 - PLACE
      ?auto_5561 - HOIST
      ?auto_5558 - SURFACE
      ?auto_5564 - TRUCK
      ?auto_5563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5562 ?auto_5560 ) ( IS-CRATE ?auto_5557 ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( not ( = ?auto_5555 ?auto_5556 ) ) ( not ( = ?auto_5555 ?auto_5557 ) ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( HOIST-AT ?auto_5561 ?auto_5559 ) ( not ( = ?auto_5562 ?auto_5561 ) ) ( AVAILABLE ?auto_5561 ) ( SURFACE-AT ?auto_5557 ?auto_5559 ) ( ON ?auto_5557 ?auto_5558 ) ( CLEAR ?auto_5557 ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( not ( = ?auto_5555 ?auto_5558 ) ) ( SURFACE-AT ?auto_5555 ?auto_5560 ) ( CLEAR ?auto_5555 ) ( IS-CRATE ?auto_5556 ) ( AVAILABLE ?auto_5562 ) ( IN ?auto_5556 ?auto_5564 ) ( TRUCK-AT ?auto_5564 ?auto_5563 ) ( not ( = ?auto_5563 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5563 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5556 ?auto_5557 )
      ( MAKE-2CRATE-VERIFY ?auto_5555 ?auto_5556 ?auto_5557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5565 - SURFACE
      ?auto_5566 - SURFACE
    )
    :vars
    (
      ?auto_5573 - HOIST
      ?auto_5572 - PLACE
      ?auto_5570 - SURFACE
      ?auto_5567 - PLACE
      ?auto_5569 - HOIST
      ?auto_5568 - SURFACE
      ?auto_5571 - TRUCK
      ?auto_5574 - PLACE
      ?auto_5575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5573 ?auto_5572 ) ( IS-CRATE ?auto_5566 ) ( not ( = ?auto_5565 ?auto_5566 ) ) ( not ( = ?auto_5570 ?auto_5565 ) ) ( not ( = ?auto_5570 ?auto_5566 ) ) ( not ( = ?auto_5567 ?auto_5572 ) ) ( HOIST-AT ?auto_5569 ?auto_5567 ) ( not ( = ?auto_5573 ?auto_5569 ) ) ( AVAILABLE ?auto_5569 ) ( SURFACE-AT ?auto_5566 ?auto_5567 ) ( ON ?auto_5566 ?auto_5568 ) ( CLEAR ?auto_5566 ) ( not ( = ?auto_5565 ?auto_5568 ) ) ( not ( = ?auto_5566 ?auto_5568 ) ) ( not ( = ?auto_5570 ?auto_5568 ) ) ( SURFACE-AT ?auto_5570 ?auto_5572 ) ( CLEAR ?auto_5570 ) ( IS-CRATE ?auto_5565 ) ( AVAILABLE ?auto_5573 ) ( TRUCK-AT ?auto_5571 ?auto_5574 ) ( not ( = ?auto_5574 ?auto_5572 ) ) ( not ( = ?auto_5567 ?auto_5574 ) ) ( HOIST-AT ?auto_5575 ?auto_5574 ) ( LIFTING ?auto_5575 ?auto_5565 ) ( not ( = ?auto_5573 ?auto_5575 ) ) ( not ( = ?auto_5569 ?auto_5575 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5575 ?auto_5565 ?auto_5571 ?auto_5574 )
      ( MAKE-2CRATE ?auto_5570 ?auto_5565 ?auto_5566 )
      ( MAKE-1CRATE-VERIFY ?auto_5565 ?auto_5566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5576 - SURFACE
      ?auto_5577 - SURFACE
      ?auto_5578 - SURFACE
    )
    :vars
    (
      ?auto_5580 - HOIST
      ?auto_5582 - PLACE
      ?auto_5584 - PLACE
      ?auto_5581 - HOIST
      ?auto_5586 - SURFACE
      ?auto_5579 - TRUCK
      ?auto_5585 - PLACE
      ?auto_5583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5580 ?auto_5582 ) ( IS-CRATE ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5584 ?auto_5582 ) ) ( HOIST-AT ?auto_5581 ?auto_5584 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( AVAILABLE ?auto_5581 ) ( SURFACE-AT ?auto_5578 ?auto_5584 ) ( ON ?auto_5578 ?auto_5586 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5586 ) ) ( not ( = ?auto_5578 ?auto_5586 ) ) ( not ( = ?auto_5576 ?auto_5586 ) ) ( SURFACE-AT ?auto_5576 ?auto_5582 ) ( CLEAR ?auto_5576 ) ( IS-CRATE ?auto_5577 ) ( AVAILABLE ?auto_5580 ) ( TRUCK-AT ?auto_5579 ?auto_5585 ) ( not ( = ?auto_5585 ?auto_5582 ) ) ( not ( = ?auto_5584 ?auto_5585 ) ) ( HOIST-AT ?auto_5583 ?auto_5585 ) ( LIFTING ?auto_5583 ?auto_5577 ) ( not ( = ?auto_5580 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5577 ?auto_5578 )
      ( MAKE-2CRATE-VERIFY ?auto_5576 ?auto_5577 ?auto_5578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5587 - SURFACE
      ?auto_5588 - SURFACE
    )
    :vars
    (
      ?auto_5594 - HOIST
      ?auto_5591 - PLACE
      ?auto_5597 - SURFACE
      ?auto_5589 - PLACE
      ?auto_5592 - HOIST
      ?auto_5596 - SURFACE
      ?auto_5593 - TRUCK
      ?auto_5595 - PLACE
      ?auto_5590 - HOIST
      ?auto_5598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5594 ?auto_5591 ) ( IS-CRATE ?auto_5588 ) ( not ( = ?auto_5587 ?auto_5588 ) ) ( not ( = ?auto_5597 ?auto_5587 ) ) ( not ( = ?auto_5597 ?auto_5588 ) ) ( not ( = ?auto_5589 ?auto_5591 ) ) ( HOIST-AT ?auto_5592 ?auto_5589 ) ( not ( = ?auto_5594 ?auto_5592 ) ) ( AVAILABLE ?auto_5592 ) ( SURFACE-AT ?auto_5588 ?auto_5589 ) ( ON ?auto_5588 ?auto_5596 ) ( CLEAR ?auto_5588 ) ( not ( = ?auto_5587 ?auto_5596 ) ) ( not ( = ?auto_5588 ?auto_5596 ) ) ( not ( = ?auto_5597 ?auto_5596 ) ) ( SURFACE-AT ?auto_5597 ?auto_5591 ) ( CLEAR ?auto_5597 ) ( IS-CRATE ?auto_5587 ) ( AVAILABLE ?auto_5594 ) ( TRUCK-AT ?auto_5593 ?auto_5595 ) ( not ( = ?auto_5595 ?auto_5591 ) ) ( not ( = ?auto_5589 ?auto_5595 ) ) ( HOIST-AT ?auto_5590 ?auto_5595 ) ( not ( = ?auto_5594 ?auto_5590 ) ) ( not ( = ?auto_5592 ?auto_5590 ) ) ( AVAILABLE ?auto_5590 ) ( SURFACE-AT ?auto_5587 ?auto_5595 ) ( ON ?auto_5587 ?auto_5598 ) ( CLEAR ?auto_5587 ) ( not ( = ?auto_5587 ?auto_5598 ) ) ( not ( = ?auto_5588 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5598 ) ) ( not ( = ?auto_5596 ?auto_5598 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5590 ?auto_5587 ?auto_5598 ?auto_5595 )
      ( MAKE-2CRATE ?auto_5597 ?auto_5587 ?auto_5588 )
      ( MAKE-1CRATE-VERIFY ?auto_5587 ?auto_5588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5599 - SURFACE
      ?auto_5600 - SURFACE
      ?auto_5601 - SURFACE
    )
    :vars
    (
      ?auto_5606 - HOIST
      ?auto_5602 - PLACE
      ?auto_5608 - PLACE
      ?auto_5607 - HOIST
      ?auto_5603 - SURFACE
      ?auto_5610 - TRUCK
      ?auto_5609 - PLACE
      ?auto_5605 - HOIST
      ?auto_5604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5606 ?auto_5602 ) ( IS-CRATE ?auto_5601 ) ( not ( = ?auto_5600 ?auto_5601 ) ) ( not ( = ?auto_5599 ?auto_5600 ) ) ( not ( = ?auto_5599 ?auto_5601 ) ) ( not ( = ?auto_5608 ?auto_5602 ) ) ( HOIST-AT ?auto_5607 ?auto_5608 ) ( not ( = ?auto_5606 ?auto_5607 ) ) ( AVAILABLE ?auto_5607 ) ( SURFACE-AT ?auto_5601 ?auto_5608 ) ( ON ?auto_5601 ?auto_5603 ) ( CLEAR ?auto_5601 ) ( not ( = ?auto_5600 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5599 ?auto_5603 ) ) ( SURFACE-AT ?auto_5599 ?auto_5602 ) ( CLEAR ?auto_5599 ) ( IS-CRATE ?auto_5600 ) ( AVAILABLE ?auto_5606 ) ( TRUCK-AT ?auto_5610 ?auto_5609 ) ( not ( = ?auto_5609 ?auto_5602 ) ) ( not ( = ?auto_5608 ?auto_5609 ) ) ( HOIST-AT ?auto_5605 ?auto_5609 ) ( not ( = ?auto_5606 ?auto_5605 ) ) ( not ( = ?auto_5607 ?auto_5605 ) ) ( AVAILABLE ?auto_5605 ) ( SURFACE-AT ?auto_5600 ?auto_5609 ) ( ON ?auto_5600 ?auto_5604 ) ( CLEAR ?auto_5600 ) ( not ( = ?auto_5600 ?auto_5604 ) ) ( not ( = ?auto_5601 ?auto_5604 ) ) ( not ( = ?auto_5599 ?auto_5604 ) ) ( not ( = ?auto_5603 ?auto_5604 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5600 ?auto_5601 )
      ( MAKE-2CRATE-VERIFY ?auto_5599 ?auto_5600 ?auto_5601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5611 - SURFACE
      ?auto_5612 - SURFACE
    )
    :vars
    (
      ?auto_5621 - HOIST
      ?auto_5614 - PLACE
      ?auto_5618 - SURFACE
      ?auto_5616 - PLACE
      ?auto_5617 - HOIST
      ?auto_5622 - SURFACE
      ?auto_5619 - PLACE
      ?auto_5613 - HOIST
      ?auto_5615 - SURFACE
      ?auto_5620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5621 ?auto_5614 ) ( IS-CRATE ?auto_5612 ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5618 ?auto_5611 ) ) ( not ( = ?auto_5618 ?auto_5612 ) ) ( not ( = ?auto_5616 ?auto_5614 ) ) ( HOIST-AT ?auto_5617 ?auto_5616 ) ( not ( = ?auto_5621 ?auto_5617 ) ) ( AVAILABLE ?auto_5617 ) ( SURFACE-AT ?auto_5612 ?auto_5616 ) ( ON ?auto_5612 ?auto_5622 ) ( CLEAR ?auto_5612 ) ( not ( = ?auto_5611 ?auto_5622 ) ) ( not ( = ?auto_5612 ?auto_5622 ) ) ( not ( = ?auto_5618 ?auto_5622 ) ) ( SURFACE-AT ?auto_5618 ?auto_5614 ) ( CLEAR ?auto_5618 ) ( IS-CRATE ?auto_5611 ) ( AVAILABLE ?auto_5621 ) ( not ( = ?auto_5619 ?auto_5614 ) ) ( not ( = ?auto_5616 ?auto_5619 ) ) ( HOIST-AT ?auto_5613 ?auto_5619 ) ( not ( = ?auto_5621 ?auto_5613 ) ) ( not ( = ?auto_5617 ?auto_5613 ) ) ( AVAILABLE ?auto_5613 ) ( SURFACE-AT ?auto_5611 ?auto_5619 ) ( ON ?auto_5611 ?auto_5615 ) ( CLEAR ?auto_5611 ) ( not ( = ?auto_5611 ?auto_5615 ) ) ( not ( = ?auto_5612 ?auto_5615 ) ) ( not ( = ?auto_5618 ?auto_5615 ) ) ( not ( = ?auto_5622 ?auto_5615 ) ) ( TRUCK-AT ?auto_5620 ?auto_5614 ) )
    :subtasks
    ( ( !DRIVE ?auto_5620 ?auto_5614 ?auto_5619 )
      ( MAKE-2CRATE ?auto_5618 ?auto_5611 ?auto_5612 )
      ( MAKE-1CRATE-VERIFY ?auto_5611 ?auto_5612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5623 - SURFACE
      ?auto_5624 - SURFACE
      ?auto_5625 - SURFACE
    )
    :vars
    (
      ?auto_5626 - HOIST
      ?auto_5630 - PLACE
      ?auto_5633 - PLACE
      ?auto_5629 - HOIST
      ?auto_5631 - SURFACE
      ?auto_5627 - PLACE
      ?auto_5634 - HOIST
      ?auto_5628 - SURFACE
      ?auto_5632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5626 ?auto_5630 ) ( IS-CRATE ?auto_5625 ) ( not ( = ?auto_5624 ?auto_5625 ) ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5625 ) ) ( not ( = ?auto_5633 ?auto_5630 ) ) ( HOIST-AT ?auto_5629 ?auto_5633 ) ( not ( = ?auto_5626 ?auto_5629 ) ) ( AVAILABLE ?auto_5629 ) ( SURFACE-AT ?auto_5625 ?auto_5633 ) ( ON ?auto_5625 ?auto_5631 ) ( CLEAR ?auto_5625 ) ( not ( = ?auto_5624 ?auto_5631 ) ) ( not ( = ?auto_5625 ?auto_5631 ) ) ( not ( = ?auto_5623 ?auto_5631 ) ) ( SURFACE-AT ?auto_5623 ?auto_5630 ) ( CLEAR ?auto_5623 ) ( IS-CRATE ?auto_5624 ) ( AVAILABLE ?auto_5626 ) ( not ( = ?auto_5627 ?auto_5630 ) ) ( not ( = ?auto_5633 ?auto_5627 ) ) ( HOIST-AT ?auto_5634 ?auto_5627 ) ( not ( = ?auto_5626 ?auto_5634 ) ) ( not ( = ?auto_5629 ?auto_5634 ) ) ( AVAILABLE ?auto_5634 ) ( SURFACE-AT ?auto_5624 ?auto_5627 ) ( ON ?auto_5624 ?auto_5628 ) ( CLEAR ?auto_5624 ) ( not ( = ?auto_5624 ?auto_5628 ) ) ( not ( = ?auto_5625 ?auto_5628 ) ) ( not ( = ?auto_5623 ?auto_5628 ) ) ( not ( = ?auto_5631 ?auto_5628 ) ) ( TRUCK-AT ?auto_5632 ?auto_5630 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5624 ?auto_5625 )
      ( MAKE-2CRATE-VERIFY ?auto_5623 ?auto_5624 ?auto_5625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5644 - SURFACE
      ?auto_5645 - SURFACE
    )
    :vars
    (
      ?auto_5646 - HOIST
      ?auto_5647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5646 ?auto_5647 ) ( SURFACE-AT ?auto_5644 ?auto_5647 ) ( CLEAR ?auto_5644 ) ( LIFTING ?auto_5646 ?auto_5645 ) ( IS-CRATE ?auto_5645 ) ( not ( = ?auto_5644 ?auto_5645 ) ) )
    :subtasks
    ( ( !DROP ?auto_5646 ?auto_5645 ?auto_5644 ?auto_5647 )
      ( MAKE-1CRATE-VERIFY ?auto_5644 ?auto_5645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5648 - SURFACE
      ?auto_5649 - SURFACE
      ?auto_5650 - SURFACE
    )
    :vars
    (
      ?auto_5651 - HOIST
      ?auto_5652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5651 ?auto_5652 ) ( SURFACE-AT ?auto_5649 ?auto_5652 ) ( CLEAR ?auto_5649 ) ( LIFTING ?auto_5651 ?auto_5650 ) ( IS-CRATE ?auto_5650 ) ( not ( = ?auto_5649 ?auto_5650 ) ) ( ON ?auto_5649 ?auto_5648 ) ( not ( = ?auto_5648 ?auto_5649 ) ) ( not ( = ?auto_5648 ?auto_5650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5649 ?auto_5650 )
      ( MAKE-2CRATE-VERIFY ?auto_5648 ?auto_5649 ?auto_5650 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5653 - SURFACE
      ?auto_5654 - SURFACE
      ?auto_5655 - SURFACE
      ?auto_5656 - SURFACE
    )
    :vars
    (
      ?auto_5657 - HOIST
      ?auto_5658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5657 ?auto_5658 ) ( SURFACE-AT ?auto_5655 ?auto_5658 ) ( CLEAR ?auto_5655 ) ( LIFTING ?auto_5657 ?auto_5656 ) ( IS-CRATE ?auto_5656 ) ( not ( = ?auto_5655 ?auto_5656 ) ) ( ON ?auto_5654 ?auto_5653 ) ( ON ?auto_5655 ?auto_5654 ) ( not ( = ?auto_5653 ?auto_5654 ) ) ( not ( = ?auto_5653 ?auto_5655 ) ) ( not ( = ?auto_5653 ?auto_5656 ) ) ( not ( = ?auto_5654 ?auto_5655 ) ) ( not ( = ?auto_5654 ?auto_5656 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5655 ?auto_5656 )
      ( MAKE-3CRATE-VERIFY ?auto_5653 ?auto_5654 ?auto_5655 ?auto_5656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5659 - SURFACE
      ?auto_5660 - SURFACE
    )
    :vars
    (
      ?auto_5661 - HOIST
      ?auto_5662 - PLACE
      ?auto_5663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5661 ?auto_5662 ) ( SURFACE-AT ?auto_5659 ?auto_5662 ) ( CLEAR ?auto_5659 ) ( IS-CRATE ?auto_5660 ) ( not ( = ?auto_5659 ?auto_5660 ) ) ( TRUCK-AT ?auto_5663 ?auto_5662 ) ( AVAILABLE ?auto_5661 ) ( IN ?auto_5660 ?auto_5663 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5661 ?auto_5660 ?auto_5663 ?auto_5662 )
      ( MAKE-1CRATE ?auto_5659 ?auto_5660 )
      ( MAKE-1CRATE-VERIFY ?auto_5659 ?auto_5660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5664 - SURFACE
      ?auto_5665 - SURFACE
      ?auto_5666 - SURFACE
    )
    :vars
    (
      ?auto_5668 - HOIST
      ?auto_5669 - PLACE
      ?auto_5667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5668 ?auto_5669 ) ( SURFACE-AT ?auto_5665 ?auto_5669 ) ( CLEAR ?auto_5665 ) ( IS-CRATE ?auto_5666 ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( TRUCK-AT ?auto_5667 ?auto_5669 ) ( AVAILABLE ?auto_5668 ) ( IN ?auto_5666 ?auto_5667 ) ( ON ?auto_5665 ?auto_5664 ) ( not ( = ?auto_5664 ?auto_5665 ) ) ( not ( = ?auto_5664 ?auto_5666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5665 ?auto_5666 )
      ( MAKE-2CRATE-VERIFY ?auto_5664 ?auto_5665 ?auto_5666 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5670 - SURFACE
      ?auto_5671 - SURFACE
      ?auto_5672 - SURFACE
      ?auto_5673 - SURFACE
    )
    :vars
    (
      ?auto_5674 - HOIST
      ?auto_5676 - PLACE
      ?auto_5675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5674 ?auto_5676 ) ( SURFACE-AT ?auto_5672 ?auto_5676 ) ( CLEAR ?auto_5672 ) ( IS-CRATE ?auto_5673 ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( TRUCK-AT ?auto_5675 ?auto_5676 ) ( AVAILABLE ?auto_5674 ) ( IN ?auto_5673 ?auto_5675 ) ( ON ?auto_5672 ?auto_5671 ) ( not ( = ?auto_5671 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5673 ) ) ( ON ?auto_5671 ?auto_5670 ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5670 ?auto_5673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5671 ?auto_5672 ?auto_5673 )
      ( MAKE-3CRATE-VERIFY ?auto_5670 ?auto_5671 ?auto_5672 ?auto_5673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5677 - SURFACE
      ?auto_5678 - SURFACE
    )
    :vars
    (
      ?auto_5679 - HOIST
      ?auto_5681 - PLACE
      ?auto_5680 - TRUCK
      ?auto_5682 - SURFACE
      ?auto_5683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5679 ?auto_5681 ) ( SURFACE-AT ?auto_5677 ?auto_5681 ) ( CLEAR ?auto_5677 ) ( IS-CRATE ?auto_5678 ) ( not ( = ?auto_5677 ?auto_5678 ) ) ( AVAILABLE ?auto_5679 ) ( IN ?auto_5678 ?auto_5680 ) ( ON ?auto_5677 ?auto_5682 ) ( not ( = ?auto_5682 ?auto_5677 ) ) ( not ( = ?auto_5682 ?auto_5678 ) ) ( TRUCK-AT ?auto_5680 ?auto_5683 ) ( not ( = ?auto_5683 ?auto_5681 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5680 ?auto_5683 ?auto_5681 )
      ( MAKE-2CRATE ?auto_5682 ?auto_5677 ?auto_5678 )
      ( MAKE-1CRATE-VERIFY ?auto_5677 ?auto_5678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5684 - SURFACE
      ?auto_5685 - SURFACE
      ?auto_5686 - SURFACE
    )
    :vars
    (
      ?auto_5687 - HOIST
      ?auto_5690 - PLACE
      ?auto_5689 - TRUCK
      ?auto_5688 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5687 ?auto_5690 ) ( SURFACE-AT ?auto_5685 ?auto_5690 ) ( CLEAR ?auto_5685 ) ( IS-CRATE ?auto_5686 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( AVAILABLE ?auto_5687 ) ( IN ?auto_5686 ?auto_5689 ) ( ON ?auto_5685 ?auto_5684 ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5686 ) ) ( TRUCK-AT ?auto_5689 ?auto_5688 ) ( not ( = ?auto_5688 ?auto_5690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5685 ?auto_5686 )
      ( MAKE-2CRATE-VERIFY ?auto_5684 ?auto_5685 ?auto_5686 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5691 - SURFACE
      ?auto_5692 - SURFACE
      ?auto_5693 - SURFACE
      ?auto_5694 - SURFACE
    )
    :vars
    (
      ?auto_5696 - HOIST
      ?auto_5698 - PLACE
      ?auto_5697 - TRUCK
      ?auto_5695 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5696 ?auto_5698 ) ( SURFACE-AT ?auto_5693 ?auto_5698 ) ( CLEAR ?auto_5693 ) ( IS-CRATE ?auto_5694 ) ( not ( = ?auto_5693 ?auto_5694 ) ) ( AVAILABLE ?auto_5696 ) ( IN ?auto_5694 ?auto_5697 ) ( ON ?auto_5693 ?auto_5692 ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5694 ) ) ( TRUCK-AT ?auto_5697 ?auto_5695 ) ( not ( = ?auto_5695 ?auto_5698 ) ) ( ON ?auto_5692 ?auto_5691 ) ( not ( = ?auto_5691 ?auto_5692 ) ) ( not ( = ?auto_5691 ?auto_5693 ) ) ( not ( = ?auto_5691 ?auto_5694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5692 ?auto_5693 ?auto_5694 )
      ( MAKE-3CRATE-VERIFY ?auto_5691 ?auto_5692 ?auto_5693 ?auto_5694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5699 - SURFACE
      ?auto_5700 - SURFACE
    )
    :vars
    (
      ?auto_5702 - HOIST
      ?auto_5705 - PLACE
      ?auto_5703 - SURFACE
      ?auto_5704 - TRUCK
      ?auto_5701 - PLACE
      ?auto_5706 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5702 ?auto_5705 ) ( SURFACE-AT ?auto_5699 ?auto_5705 ) ( CLEAR ?auto_5699 ) ( IS-CRATE ?auto_5700 ) ( not ( = ?auto_5699 ?auto_5700 ) ) ( AVAILABLE ?auto_5702 ) ( ON ?auto_5699 ?auto_5703 ) ( not ( = ?auto_5703 ?auto_5699 ) ) ( not ( = ?auto_5703 ?auto_5700 ) ) ( TRUCK-AT ?auto_5704 ?auto_5701 ) ( not ( = ?auto_5701 ?auto_5705 ) ) ( HOIST-AT ?auto_5706 ?auto_5701 ) ( LIFTING ?auto_5706 ?auto_5700 ) ( not ( = ?auto_5702 ?auto_5706 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5706 ?auto_5700 ?auto_5704 ?auto_5701 )
      ( MAKE-2CRATE ?auto_5703 ?auto_5699 ?auto_5700 )
      ( MAKE-1CRATE-VERIFY ?auto_5699 ?auto_5700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5707 - SURFACE
      ?auto_5708 - SURFACE
      ?auto_5709 - SURFACE
    )
    :vars
    (
      ?auto_5710 - HOIST
      ?auto_5713 - PLACE
      ?auto_5714 - TRUCK
      ?auto_5712 - PLACE
      ?auto_5711 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5710 ?auto_5713 ) ( SURFACE-AT ?auto_5708 ?auto_5713 ) ( CLEAR ?auto_5708 ) ( IS-CRATE ?auto_5709 ) ( not ( = ?auto_5708 ?auto_5709 ) ) ( AVAILABLE ?auto_5710 ) ( ON ?auto_5708 ?auto_5707 ) ( not ( = ?auto_5707 ?auto_5708 ) ) ( not ( = ?auto_5707 ?auto_5709 ) ) ( TRUCK-AT ?auto_5714 ?auto_5712 ) ( not ( = ?auto_5712 ?auto_5713 ) ) ( HOIST-AT ?auto_5711 ?auto_5712 ) ( LIFTING ?auto_5711 ?auto_5709 ) ( not ( = ?auto_5710 ?auto_5711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5708 ?auto_5709 )
      ( MAKE-2CRATE-VERIFY ?auto_5707 ?auto_5708 ?auto_5709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5715 - SURFACE
      ?auto_5716 - SURFACE
      ?auto_5717 - SURFACE
      ?auto_5718 - SURFACE
    )
    :vars
    (
      ?auto_5722 - HOIST
      ?auto_5720 - PLACE
      ?auto_5721 - TRUCK
      ?auto_5723 - PLACE
      ?auto_5719 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5722 ?auto_5720 ) ( SURFACE-AT ?auto_5717 ?auto_5720 ) ( CLEAR ?auto_5717 ) ( IS-CRATE ?auto_5718 ) ( not ( = ?auto_5717 ?auto_5718 ) ) ( AVAILABLE ?auto_5722 ) ( ON ?auto_5717 ?auto_5716 ) ( not ( = ?auto_5716 ?auto_5717 ) ) ( not ( = ?auto_5716 ?auto_5718 ) ) ( TRUCK-AT ?auto_5721 ?auto_5723 ) ( not ( = ?auto_5723 ?auto_5720 ) ) ( HOIST-AT ?auto_5719 ?auto_5723 ) ( LIFTING ?auto_5719 ?auto_5718 ) ( not ( = ?auto_5722 ?auto_5719 ) ) ( ON ?auto_5716 ?auto_5715 ) ( not ( = ?auto_5715 ?auto_5716 ) ) ( not ( = ?auto_5715 ?auto_5717 ) ) ( not ( = ?auto_5715 ?auto_5718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5716 ?auto_5717 ?auto_5718 )
      ( MAKE-3CRATE-VERIFY ?auto_5715 ?auto_5716 ?auto_5717 ?auto_5718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5724 - SURFACE
      ?auto_5725 - SURFACE
    )
    :vars
    (
      ?auto_5730 - HOIST
      ?auto_5728 - PLACE
      ?auto_5726 - SURFACE
      ?auto_5729 - TRUCK
      ?auto_5731 - PLACE
      ?auto_5727 - HOIST
      ?auto_5732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5730 ?auto_5728 ) ( SURFACE-AT ?auto_5724 ?auto_5728 ) ( CLEAR ?auto_5724 ) ( IS-CRATE ?auto_5725 ) ( not ( = ?auto_5724 ?auto_5725 ) ) ( AVAILABLE ?auto_5730 ) ( ON ?auto_5724 ?auto_5726 ) ( not ( = ?auto_5726 ?auto_5724 ) ) ( not ( = ?auto_5726 ?auto_5725 ) ) ( TRUCK-AT ?auto_5729 ?auto_5731 ) ( not ( = ?auto_5731 ?auto_5728 ) ) ( HOIST-AT ?auto_5727 ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5727 ) ) ( AVAILABLE ?auto_5727 ) ( SURFACE-AT ?auto_5725 ?auto_5731 ) ( ON ?auto_5725 ?auto_5732 ) ( CLEAR ?auto_5725 ) ( not ( = ?auto_5724 ?auto_5732 ) ) ( not ( = ?auto_5725 ?auto_5732 ) ) ( not ( = ?auto_5726 ?auto_5732 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5727 ?auto_5725 ?auto_5732 ?auto_5731 )
      ( MAKE-2CRATE ?auto_5726 ?auto_5724 ?auto_5725 )
      ( MAKE-1CRATE-VERIFY ?auto_5724 ?auto_5725 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5733 - SURFACE
      ?auto_5734 - SURFACE
      ?auto_5735 - SURFACE
    )
    :vars
    (
      ?auto_5738 - HOIST
      ?auto_5740 - PLACE
      ?auto_5737 - TRUCK
      ?auto_5739 - PLACE
      ?auto_5741 - HOIST
      ?auto_5736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5738 ?auto_5740 ) ( SURFACE-AT ?auto_5734 ?auto_5740 ) ( CLEAR ?auto_5734 ) ( IS-CRATE ?auto_5735 ) ( not ( = ?auto_5734 ?auto_5735 ) ) ( AVAILABLE ?auto_5738 ) ( ON ?auto_5734 ?auto_5733 ) ( not ( = ?auto_5733 ?auto_5734 ) ) ( not ( = ?auto_5733 ?auto_5735 ) ) ( TRUCK-AT ?auto_5737 ?auto_5739 ) ( not ( = ?auto_5739 ?auto_5740 ) ) ( HOIST-AT ?auto_5741 ?auto_5739 ) ( not ( = ?auto_5738 ?auto_5741 ) ) ( AVAILABLE ?auto_5741 ) ( SURFACE-AT ?auto_5735 ?auto_5739 ) ( ON ?auto_5735 ?auto_5736 ) ( CLEAR ?auto_5735 ) ( not ( = ?auto_5734 ?auto_5736 ) ) ( not ( = ?auto_5735 ?auto_5736 ) ) ( not ( = ?auto_5733 ?auto_5736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5734 ?auto_5735 )
      ( MAKE-2CRATE-VERIFY ?auto_5733 ?auto_5734 ?auto_5735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5742 - SURFACE
      ?auto_5743 - SURFACE
      ?auto_5744 - SURFACE
      ?auto_5745 - SURFACE
    )
    :vars
    (
      ?auto_5747 - HOIST
      ?auto_5751 - PLACE
      ?auto_5750 - TRUCK
      ?auto_5746 - PLACE
      ?auto_5748 - HOIST
      ?auto_5749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5747 ?auto_5751 ) ( SURFACE-AT ?auto_5744 ?auto_5751 ) ( CLEAR ?auto_5744 ) ( IS-CRATE ?auto_5745 ) ( not ( = ?auto_5744 ?auto_5745 ) ) ( AVAILABLE ?auto_5747 ) ( ON ?auto_5744 ?auto_5743 ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( not ( = ?auto_5743 ?auto_5745 ) ) ( TRUCK-AT ?auto_5750 ?auto_5746 ) ( not ( = ?auto_5746 ?auto_5751 ) ) ( HOIST-AT ?auto_5748 ?auto_5746 ) ( not ( = ?auto_5747 ?auto_5748 ) ) ( AVAILABLE ?auto_5748 ) ( SURFACE-AT ?auto_5745 ?auto_5746 ) ( ON ?auto_5745 ?auto_5749 ) ( CLEAR ?auto_5745 ) ( not ( = ?auto_5744 ?auto_5749 ) ) ( not ( = ?auto_5745 ?auto_5749 ) ) ( not ( = ?auto_5743 ?auto_5749 ) ) ( ON ?auto_5743 ?auto_5742 ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( not ( = ?auto_5742 ?auto_5745 ) ) ( not ( = ?auto_5742 ?auto_5749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5743 ?auto_5744 ?auto_5745 )
      ( MAKE-3CRATE-VERIFY ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5752 - SURFACE
      ?auto_5753 - SURFACE
    )
    :vars
    (
      ?auto_5755 - HOIST
      ?auto_5760 - PLACE
      ?auto_5758 - SURFACE
      ?auto_5754 - PLACE
      ?auto_5756 - HOIST
      ?auto_5757 - SURFACE
      ?auto_5759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5755 ?auto_5760 ) ( SURFACE-AT ?auto_5752 ?auto_5760 ) ( CLEAR ?auto_5752 ) ( IS-CRATE ?auto_5753 ) ( not ( = ?auto_5752 ?auto_5753 ) ) ( AVAILABLE ?auto_5755 ) ( ON ?auto_5752 ?auto_5758 ) ( not ( = ?auto_5758 ?auto_5752 ) ) ( not ( = ?auto_5758 ?auto_5753 ) ) ( not ( = ?auto_5754 ?auto_5760 ) ) ( HOIST-AT ?auto_5756 ?auto_5754 ) ( not ( = ?auto_5755 ?auto_5756 ) ) ( AVAILABLE ?auto_5756 ) ( SURFACE-AT ?auto_5753 ?auto_5754 ) ( ON ?auto_5753 ?auto_5757 ) ( CLEAR ?auto_5753 ) ( not ( = ?auto_5752 ?auto_5757 ) ) ( not ( = ?auto_5753 ?auto_5757 ) ) ( not ( = ?auto_5758 ?auto_5757 ) ) ( TRUCK-AT ?auto_5759 ?auto_5760 ) )
    :subtasks
    ( ( !DRIVE ?auto_5759 ?auto_5760 ?auto_5754 )
      ( MAKE-2CRATE ?auto_5758 ?auto_5752 ?auto_5753 )
      ( MAKE-1CRATE-VERIFY ?auto_5752 ?auto_5753 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5761 - SURFACE
      ?auto_5762 - SURFACE
      ?auto_5763 - SURFACE
    )
    :vars
    (
      ?auto_5764 - HOIST
      ?auto_5766 - PLACE
      ?auto_5767 - PLACE
      ?auto_5769 - HOIST
      ?auto_5765 - SURFACE
      ?auto_5768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5764 ?auto_5766 ) ( SURFACE-AT ?auto_5762 ?auto_5766 ) ( CLEAR ?auto_5762 ) ( IS-CRATE ?auto_5763 ) ( not ( = ?auto_5762 ?auto_5763 ) ) ( AVAILABLE ?auto_5764 ) ( ON ?auto_5762 ?auto_5761 ) ( not ( = ?auto_5761 ?auto_5762 ) ) ( not ( = ?auto_5761 ?auto_5763 ) ) ( not ( = ?auto_5767 ?auto_5766 ) ) ( HOIST-AT ?auto_5769 ?auto_5767 ) ( not ( = ?auto_5764 ?auto_5769 ) ) ( AVAILABLE ?auto_5769 ) ( SURFACE-AT ?auto_5763 ?auto_5767 ) ( ON ?auto_5763 ?auto_5765 ) ( CLEAR ?auto_5763 ) ( not ( = ?auto_5762 ?auto_5765 ) ) ( not ( = ?auto_5763 ?auto_5765 ) ) ( not ( = ?auto_5761 ?auto_5765 ) ) ( TRUCK-AT ?auto_5768 ?auto_5766 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5762 ?auto_5763 )
      ( MAKE-2CRATE-VERIFY ?auto_5761 ?auto_5762 ?auto_5763 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5770 - SURFACE
      ?auto_5771 - SURFACE
      ?auto_5772 - SURFACE
      ?auto_5773 - SURFACE
    )
    :vars
    (
      ?auto_5777 - HOIST
      ?auto_5776 - PLACE
      ?auto_5778 - PLACE
      ?auto_5779 - HOIST
      ?auto_5775 - SURFACE
      ?auto_5774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5777 ?auto_5776 ) ( SURFACE-AT ?auto_5772 ?auto_5776 ) ( CLEAR ?auto_5772 ) ( IS-CRATE ?auto_5773 ) ( not ( = ?auto_5772 ?auto_5773 ) ) ( AVAILABLE ?auto_5777 ) ( ON ?auto_5772 ?auto_5771 ) ( not ( = ?auto_5771 ?auto_5772 ) ) ( not ( = ?auto_5771 ?auto_5773 ) ) ( not ( = ?auto_5778 ?auto_5776 ) ) ( HOIST-AT ?auto_5779 ?auto_5778 ) ( not ( = ?auto_5777 ?auto_5779 ) ) ( AVAILABLE ?auto_5779 ) ( SURFACE-AT ?auto_5773 ?auto_5778 ) ( ON ?auto_5773 ?auto_5775 ) ( CLEAR ?auto_5773 ) ( not ( = ?auto_5772 ?auto_5775 ) ) ( not ( = ?auto_5773 ?auto_5775 ) ) ( not ( = ?auto_5771 ?auto_5775 ) ) ( TRUCK-AT ?auto_5774 ?auto_5776 ) ( ON ?auto_5771 ?auto_5770 ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5772 ) ) ( not ( = ?auto_5770 ?auto_5773 ) ) ( not ( = ?auto_5770 ?auto_5775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5771 ?auto_5772 ?auto_5773 )
      ( MAKE-3CRATE-VERIFY ?auto_5770 ?auto_5771 ?auto_5772 ?auto_5773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5780 - SURFACE
      ?auto_5781 - SURFACE
    )
    :vars
    (
      ?auto_5785 - HOIST
      ?auto_5784 - PLACE
      ?auto_5788 - SURFACE
      ?auto_5786 - PLACE
      ?auto_5787 - HOIST
      ?auto_5783 - SURFACE
      ?auto_5782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5785 ?auto_5784 ) ( IS-CRATE ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( not ( = ?auto_5788 ?auto_5780 ) ) ( not ( = ?auto_5788 ?auto_5781 ) ) ( not ( = ?auto_5786 ?auto_5784 ) ) ( HOIST-AT ?auto_5787 ?auto_5786 ) ( not ( = ?auto_5785 ?auto_5787 ) ) ( AVAILABLE ?auto_5787 ) ( SURFACE-AT ?auto_5781 ?auto_5786 ) ( ON ?auto_5781 ?auto_5783 ) ( CLEAR ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5783 ) ) ( not ( = ?auto_5781 ?auto_5783 ) ) ( not ( = ?auto_5788 ?auto_5783 ) ) ( TRUCK-AT ?auto_5782 ?auto_5784 ) ( SURFACE-AT ?auto_5788 ?auto_5784 ) ( CLEAR ?auto_5788 ) ( LIFTING ?auto_5785 ?auto_5780 ) ( IS-CRATE ?auto_5780 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5788 ?auto_5780 )
      ( MAKE-2CRATE ?auto_5788 ?auto_5780 ?auto_5781 )
      ( MAKE-1CRATE-VERIFY ?auto_5780 ?auto_5781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5789 - SURFACE
      ?auto_5790 - SURFACE
      ?auto_5791 - SURFACE
    )
    :vars
    (
      ?auto_5797 - HOIST
      ?auto_5793 - PLACE
      ?auto_5795 - PLACE
      ?auto_5792 - HOIST
      ?auto_5796 - SURFACE
      ?auto_5794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5797 ?auto_5793 ) ( IS-CRATE ?auto_5791 ) ( not ( = ?auto_5790 ?auto_5791 ) ) ( not ( = ?auto_5789 ?auto_5790 ) ) ( not ( = ?auto_5789 ?auto_5791 ) ) ( not ( = ?auto_5795 ?auto_5793 ) ) ( HOIST-AT ?auto_5792 ?auto_5795 ) ( not ( = ?auto_5797 ?auto_5792 ) ) ( AVAILABLE ?auto_5792 ) ( SURFACE-AT ?auto_5791 ?auto_5795 ) ( ON ?auto_5791 ?auto_5796 ) ( CLEAR ?auto_5791 ) ( not ( = ?auto_5790 ?auto_5796 ) ) ( not ( = ?auto_5791 ?auto_5796 ) ) ( not ( = ?auto_5789 ?auto_5796 ) ) ( TRUCK-AT ?auto_5794 ?auto_5793 ) ( SURFACE-AT ?auto_5789 ?auto_5793 ) ( CLEAR ?auto_5789 ) ( LIFTING ?auto_5797 ?auto_5790 ) ( IS-CRATE ?auto_5790 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5790 ?auto_5791 )
      ( MAKE-2CRATE-VERIFY ?auto_5789 ?auto_5790 ?auto_5791 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5798 - SURFACE
      ?auto_5799 - SURFACE
      ?auto_5800 - SURFACE
      ?auto_5801 - SURFACE
    )
    :vars
    (
      ?auto_5803 - HOIST
      ?auto_5802 - PLACE
      ?auto_5804 - PLACE
      ?auto_5807 - HOIST
      ?auto_5805 - SURFACE
      ?auto_5806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5803 ?auto_5802 ) ( IS-CRATE ?auto_5801 ) ( not ( = ?auto_5800 ?auto_5801 ) ) ( not ( = ?auto_5799 ?auto_5800 ) ) ( not ( = ?auto_5799 ?auto_5801 ) ) ( not ( = ?auto_5804 ?auto_5802 ) ) ( HOIST-AT ?auto_5807 ?auto_5804 ) ( not ( = ?auto_5803 ?auto_5807 ) ) ( AVAILABLE ?auto_5807 ) ( SURFACE-AT ?auto_5801 ?auto_5804 ) ( ON ?auto_5801 ?auto_5805 ) ( CLEAR ?auto_5801 ) ( not ( = ?auto_5800 ?auto_5805 ) ) ( not ( = ?auto_5801 ?auto_5805 ) ) ( not ( = ?auto_5799 ?auto_5805 ) ) ( TRUCK-AT ?auto_5806 ?auto_5802 ) ( SURFACE-AT ?auto_5799 ?auto_5802 ) ( CLEAR ?auto_5799 ) ( LIFTING ?auto_5803 ?auto_5800 ) ( IS-CRATE ?auto_5800 ) ( ON ?auto_5799 ?auto_5798 ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5800 ) ) ( not ( = ?auto_5798 ?auto_5801 ) ) ( not ( = ?auto_5798 ?auto_5805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5799 ?auto_5800 ?auto_5801 )
      ( MAKE-3CRATE-VERIFY ?auto_5798 ?auto_5799 ?auto_5800 ?auto_5801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5808 - SURFACE
      ?auto_5809 - SURFACE
    )
    :vars
    (
      ?auto_5811 - HOIST
      ?auto_5810 - PLACE
      ?auto_5812 - SURFACE
      ?auto_5813 - PLACE
      ?auto_5816 - HOIST
      ?auto_5814 - SURFACE
      ?auto_5815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5811 ?auto_5810 ) ( IS-CRATE ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5812 ?auto_5808 ) ) ( not ( = ?auto_5812 ?auto_5809 ) ) ( not ( = ?auto_5813 ?auto_5810 ) ) ( HOIST-AT ?auto_5816 ?auto_5813 ) ( not ( = ?auto_5811 ?auto_5816 ) ) ( AVAILABLE ?auto_5816 ) ( SURFACE-AT ?auto_5809 ?auto_5813 ) ( ON ?auto_5809 ?auto_5814 ) ( CLEAR ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5814 ) ) ( not ( = ?auto_5809 ?auto_5814 ) ) ( not ( = ?auto_5812 ?auto_5814 ) ) ( TRUCK-AT ?auto_5815 ?auto_5810 ) ( SURFACE-AT ?auto_5812 ?auto_5810 ) ( CLEAR ?auto_5812 ) ( IS-CRATE ?auto_5808 ) ( AVAILABLE ?auto_5811 ) ( IN ?auto_5808 ?auto_5815 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5811 ?auto_5808 ?auto_5815 ?auto_5810 )
      ( MAKE-2CRATE ?auto_5812 ?auto_5808 ?auto_5809 )
      ( MAKE-1CRATE-VERIFY ?auto_5808 ?auto_5809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5817 - SURFACE
      ?auto_5818 - SURFACE
      ?auto_5819 - SURFACE
    )
    :vars
    (
      ?auto_5824 - HOIST
      ?auto_5825 - PLACE
      ?auto_5820 - PLACE
      ?auto_5823 - HOIST
      ?auto_5821 - SURFACE
      ?auto_5822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5824 ?auto_5825 ) ( IS-CRATE ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5819 ) ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5819 ) ) ( not ( = ?auto_5820 ?auto_5825 ) ) ( HOIST-AT ?auto_5823 ?auto_5820 ) ( not ( = ?auto_5824 ?auto_5823 ) ) ( AVAILABLE ?auto_5823 ) ( SURFACE-AT ?auto_5819 ?auto_5820 ) ( ON ?auto_5819 ?auto_5821 ) ( CLEAR ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5821 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5817 ?auto_5821 ) ) ( TRUCK-AT ?auto_5822 ?auto_5825 ) ( SURFACE-AT ?auto_5817 ?auto_5825 ) ( CLEAR ?auto_5817 ) ( IS-CRATE ?auto_5818 ) ( AVAILABLE ?auto_5824 ) ( IN ?auto_5818 ?auto_5822 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5818 ?auto_5819 )
      ( MAKE-2CRATE-VERIFY ?auto_5817 ?auto_5818 ?auto_5819 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5826 - SURFACE
      ?auto_5827 - SURFACE
      ?auto_5828 - SURFACE
      ?auto_5829 - SURFACE
    )
    :vars
    (
      ?auto_5831 - HOIST
      ?auto_5833 - PLACE
      ?auto_5835 - PLACE
      ?auto_5832 - HOIST
      ?auto_5830 - SURFACE
      ?auto_5834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5831 ?auto_5833 ) ( IS-CRATE ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( not ( = ?auto_5827 ?auto_5828 ) ) ( not ( = ?auto_5827 ?auto_5829 ) ) ( not ( = ?auto_5835 ?auto_5833 ) ) ( HOIST-AT ?auto_5832 ?auto_5835 ) ( not ( = ?auto_5831 ?auto_5832 ) ) ( AVAILABLE ?auto_5832 ) ( SURFACE-AT ?auto_5829 ?auto_5835 ) ( ON ?auto_5829 ?auto_5830 ) ( CLEAR ?auto_5829 ) ( not ( = ?auto_5828 ?auto_5830 ) ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( not ( = ?auto_5827 ?auto_5830 ) ) ( TRUCK-AT ?auto_5834 ?auto_5833 ) ( SURFACE-AT ?auto_5827 ?auto_5833 ) ( CLEAR ?auto_5827 ) ( IS-CRATE ?auto_5828 ) ( AVAILABLE ?auto_5831 ) ( IN ?auto_5828 ?auto_5834 ) ( ON ?auto_5827 ?auto_5826 ) ( not ( = ?auto_5826 ?auto_5827 ) ) ( not ( = ?auto_5826 ?auto_5828 ) ) ( not ( = ?auto_5826 ?auto_5829 ) ) ( not ( = ?auto_5826 ?auto_5830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5827 ?auto_5828 ?auto_5829 )
      ( MAKE-3CRATE-VERIFY ?auto_5826 ?auto_5827 ?auto_5828 ?auto_5829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5836 - SURFACE
      ?auto_5837 - SURFACE
    )
    :vars
    (
      ?auto_5839 - HOIST
      ?auto_5842 - PLACE
      ?auto_5840 - SURFACE
      ?auto_5844 - PLACE
      ?auto_5841 - HOIST
      ?auto_5838 - SURFACE
      ?auto_5843 - TRUCK
      ?auto_5845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5839 ?auto_5842 ) ( IS-CRATE ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5840 ?auto_5836 ) ) ( not ( = ?auto_5840 ?auto_5837 ) ) ( not ( = ?auto_5844 ?auto_5842 ) ) ( HOIST-AT ?auto_5841 ?auto_5844 ) ( not ( = ?auto_5839 ?auto_5841 ) ) ( AVAILABLE ?auto_5841 ) ( SURFACE-AT ?auto_5837 ?auto_5844 ) ( ON ?auto_5837 ?auto_5838 ) ( CLEAR ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5838 ) ) ( not ( = ?auto_5837 ?auto_5838 ) ) ( not ( = ?auto_5840 ?auto_5838 ) ) ( SURFACE-AT ?auto_5840 ?auto_5842 ) ( CLEAR ?auto_5840 ) ( IS-CRATE ?auto_5836 ) ( AVAILABLE ?auto_5839 ) ( IN ?auto_5836 ?auto_5843 ) ( TRUCK-AT ?auto_5843 ?auto_5845 ) ( not ( = ?auto_5845 ?auto_5842 ) ) ( not ( = ?auto_5844 ?auto_5845 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5843 ?auto_5845 ?auto_5842 )
      ( MAKE-2CRATE ?auto_5840 ?auto_5836 ?auto_5837 )
      ( MAKE-1CRATE-VERIFY ?auto_5836 ?auto_5837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5846 - SURFACE
      ?auto_5847 - SURFACE
      ?auto_5848 - SURFACE
    )
    :vars
    (
      ?auto_5849 - HOIST
      ?auto_5853 - PLACE
      ?auto_5850 - PLACE
      ?auto_5851 - HOIST
      ?auto_5855 - SURFACE
      ?auto_5852 - TRUCK
      ?auto_5854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5849 ?auto_5853 ) ( IS-CRATE ?auto_5848 ) ( not ( = ?auto_5847 ?auto_5848 ) ) ( not ( = ?auto_5846 ?auto_5847 ) ) ( not ( = ?auto_5846 ?auto_5848 ) ) ( not ( = ?auto_5850 ?auto_5853 ) ) ( HOIST-AT ?auto_5851 ?auto_5850 ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( AVAILABLE ?auto_5851 ) ( SURFACE-AT ?auto_5848 ?auto_5850 ) ( ON ?auto_5848 ?auto_5855 ) ( CLEAR ?auto_5848 ) ( not ( = ?auto_5847 ?auto_5855 ) ) ( not ( = ?auto_5848 ?auto_5855 ) ) ( not ( = ?auto_5846 ?auto_5855 ) ) ( SURFACE-AT ?auto_5846 ?auto_5853 ) ( CLEAR ?auto_5846 ) ( IS-CRATE ?auto_5847 ) ( AVAILABLE ?auto_5849 ) ( IN ?auto_5847 ?auto_5852 ) ( TRUCK-AT ?auto_5852 ?auto_5854 ) ( not ( = ?auto_5854 ?auto_5853 ) ) ( not ( = ?auto_5850 ?auto_5854 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5847 ?auto_5848 )
      ( MAKE-2CRATE-VERIFY ?auto_5846 ?auto_5847 ?auto_5848 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5856 - SURFACE
      ?auto_5857 - SURFACE
      ?auto_5858 - SURFACE
      ?auto_5859 - SURFACE
    )
    :vars
    (
      ?auto_5860 - HOIST
      ?auto_5865 - PLACE
      ?auto_5862 - PLACE
      ?auto_5863 - HOIST
      ?auto_5861 - SURFACE
      ?auto_5866 - TRUCK
      ?auto_5864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5860 ?auto_5865 ) ( IS-CRATE ?auto_5859 ) ( not ( = ?auto_5858 ?auto_5859 ) ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( HOIST-AT ?auto_5863 ?auto_5862 ) ( not ( = ?auto_5860 ?auto_5863 ) ) ( AVAILABLE ?auto_5863 ) ( SURFACE-AT ?auto_5859 ?auto_5862 ) ( ON ?auto_5859 ?auto_5861 ) ( CLEAR ?auto_5859 ) ( not ( = ?auto_5858 ?auto_5861 ) ) ( not ( = ?auto_5859 ?auto_5861 ) ) ( not ( = ?auto_5857 ?auto_5861 ) ) ( SURFACE-AT ?auto_5857 ?auto_5865 ) ( CLEAR ?auto_5857 ) ( IS-CRATE ?auto_5858 ) ( AVAILABLE ?auto_5860 ) ( IN ?auto_5858 ?auto_5866 ) ( TRUCK-AT ?auto_5866 ?auto_5864 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5862 ?auto_5864 ) ) ( ON ?auto_5857 ?auto_5856 ) ( not ( = ?auto_5856 ?auto_5857 ) ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5856 ?auto_5859 ) ) ( not ( = ?auto_5856 ?auto_5861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5857 ?auto_5858 ?auto_5859 )
      ( MAKE-3CRATE-VERIFY ?auto_5856 ?auto_5857 ?auto_5858 ?auto_5859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5867 - SURFACE
      ?auto_5868 - SURFACE
    )
    :vars
    (
      ?auto_5869 - HOIST
      ?auto_5875 - PLACE
      ?auto_5872 - SURFACE
      ?auto_5871 - PLACE
      ?auto_5873 - HOIST
      ?auto_5870 - SURFACE
      ?auto_5876 - TRUCK
      ?auto_5874 - PLACE
      ?auto_5877 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5869 ?auto_5875 ) ( IS-CRATE ?auto_5868 ) ( not ( = ?auto_5867 ?auto_5868 ) ) ( not ( = ?auto_5872 ?auto_5867 ) ) ( not ( = ?auto_5872 ?auto_5868 ) ) ( not ( = ?auto_5871 ?auto_5875 ) ) ( HOIST-AT ?auto_5873 ?auto_5871 ) ( not ( = ?auto_5869 ?auto_5873 ) ) ( AVAILABLE ?auto_5873 ) ( SURFACE-AT ?auto_5868 ?auto_5871 ) ( ON ?auto_5868 ?auto_5870 ) ( CLEAR ?auto_5868 ) ( not ( = ?auto_5867 ?auto_5870 ) ) ( not ( = ?auto_5868 ?auto_5870 ) ) ( not ( = ?auto_5872 ?auto_5870 ) ) ( SURFACE-AT ?auto_5872 ?auto_5875 ) ( CLEAR ?auto_5872 ) ( IS-CRATE ?auto_5867 ) ( AVAILABLE ?auto_5869 ) ( TRUCK-AT ?auto_5876 ?auto_5874 ) ( not ( = ?auto_5874 ?auto_5875 ) ) ( not ( = ?auto_5871 ?auto_5874 ) ) ( HOIST-AT ?auto_5877 ?auto_5874 ) ( LIFTING ?auto_5877 ?auto_5867 ) ( not ( = ?auto_5869 ?auto_5877 ) ) ( not ( = ?auto_5873 ?auto_5877 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5877 ?auto_5867 ?auto_5876 ?auto_5874 )
      ( MAKE-2CRATE ?auto_5872 ?auto_5867 ?auto_5868 )
      ( MAKE-1CRATE-VERIFY ?auto_5867 ?auto_5868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5878 - SURFACE
      ?auto_5879 - SURFACE
      ?auto_5880 - SURFACE
    )
    :vars
    (
      ?auto_5882 - HOIST
      ?auto_5881 - PLACE
      ?auto_5885 - PLACE
      ?auto_5886 - HOIST
      ?auto_5888 - SURFACE
      ?auto_5887 - TRUCK
      ?auto_5884 - PLACE
      ?auto_5883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5882 ?auto_5881 ) ( IS-CRATE ?auto_5880 ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( not ( = ?auto_5878 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5880 ) ) ( not ( = ?auto_5885 ?auto_5881 ) ) ( HOIST-AT ?auto_5886 ?auto_5885 ) ( not ( = ?auto_5882 ?auto_5886 ) ) ( AVAILABLE ?auto_5886 ) ( SURFACE-AT ?auto_5880 ?auto_5885 ) ( ON ?auto_5880 ?auto_5888 ) ( CLEAR ?auto_5880 ) ( not ( = ?auto_5879 ?auto_5888 ) ) ( not ( = ?auto_5880 ?auto_5888 ) ) ( not ( = ?auto_5878 ?auto_5888 ) ) ( SURFACE-AT ?auto_5878 ?auto_5881 ) ( CLEAR ?auto_5878 ) ( IS-CRATE ?auto_5879 ) ( AVAILABLE ?auto_5882 ) ( TRUCK-AT ?auto_5887 ?auto_5884 ) ( not ( = ?auto_5884 ?auto_5881 ) ) ( not ( = ?auto_5885 ?auto_5884 ) ) ( HOIST-AT ?auto_5883 ?auto_5884 ) ( LIFTING ?auto_5883 ?auto_5879 ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5886 ?auto_5883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5879 ?auto_5880 )
      ( MAKE-2CRATE-VERIFY ?auto_5878 ?auto_5879 ?auto_5880 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5889 - SURFACE
      ?auto_5890 - SURFACE
      ?auto_5891 - SURFACE
      ?auto_5892 - SURFACE
    )
    :vars
    (
      ?auto_5893 - HOIST
      ?auto_5894 - PLACE
      ?auto_5899 - PLACE
      ?auto_5896 - HOIST
      ?auto_5897 - SURFACE
      ?auto_5898 - TRUCK
      ?auto_5900 - PLACE
      ?auto_5895 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5893 ?auto_5894 ) ( IS-CRATE ?auto_5892 ) ( not ( = ?auto_5891 ?auto_5892 ) ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( not ( = ?auto_5899 ?auto_5894 ) ) ( HOIST-AT ?auto_5896 ?auto_5899 ) ( not ( = ?auto_5893 ?auto_5896 ) ) ( AVAILABLE ?auto_5896 ) ( SURFACE-AT ?auto_5892 ?auto_5899 ) ( ON ?auto_5892 ?auto_5897 ) ( CLEAR ?auto_5892 ) ( not ( = ?auto_5891 ?auto_5897 ) ) ( not ( = ?auto_5892 ?auto_5897 ) ) ( not ( = ?auto_5890 ?auto_5897 ) ) ( SURFACE-AT ?auto_5890 ?auto_5894 ) ( CLEAR ?auto_5890 ) ( IS-CRATE ?auto_5891 ) ( AVAILABLE ?auto_5893 ) ( TRUCK-AT ?auto_5898 ?auto_5900 ) ( not ( = ?auto_5900 ?auto_5894 ) ) ( not ( = ?auto_5899 ?auto_5900 ) ) ( HOIST-AT ?auto_5895 ?auto_5900 ) ( LIFTING ?auto_5895 ?auto_5891 ) ( not ( = ?auto_5893 ?auto_5895 ) ) ( not ( = ?auto_5896 ?auto_5895 ) ) ( ON ?auto_5890 ?auto_5889 ) ( not ( = ?auto_5889 ?auto_5890 ) ) ( not ( = ?auto_5889 ?auto_5891 ) ) ( not ( = ?auto_5889 ?auto_5892 ) ) ( not ( = ?auto_5889 ?auto_5897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5890 ?auto_5891 ?auto_5892 )
      ( MAKE-3CRATE-VERIFY ?auto_5889 ?auto_5890 ?auto_5891 ?auto_5892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5901 - SURFACE
      ?auto_5902 - SURFACE
    )
    :vars
    (
      ?auto_5903 - HOIST
      ?auto_5904 - PLACE
      ?auto_5910 - SURFACE
      ?auto_5909 - PLACE
      ?auto_5906 - HOIST
      ?auto_5907 - SURFACE
      ?auto_5908 - TRUCK
      ?auto_5911 - PLACE
      ?auto_5905 - HOIST
      ?auto_5912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5903 ?auto_5904 ) ( IS-CRATE ?auto_5902 ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( not ( = ?auto_5910 ?auto_5901 ) ) ( not ( = ?auto_5910 ?auto_5902 ) ) ( not ( = ?auto_5909 ?auto_5904 ) ) ( HOIST-AT ?auto_5906 ?auto_5909 ) ( not ( = ?auto_5903 ?auto_5906 ) ) ( AVAILABLE ?auto_5906 ) ( SURFACE-AT ?auto_5902 ?auto_5909 ) ( ON ?auto_5902 ?auto_5907 ) ( CLEAR ?auto_5902 ) ( not ( = ?auto_5901 ?auto_5907 ) ) ( not ( = ?auto_5902 ?auto_5907 ) ) ( not ( = ?auto_5910 ?auto_5907 ) ) ( SURFACE-AT ?auto_5910 ?auto_5904 ) ( CLEAR ?auto_5910 ) ( IS-CRATE ?auto_5901 ) ( AVAILABLE ?auto_5903 ) ( TRUCK-AT ?auto_5908 ?auto_5911 ) ( not ( = ?auto_5911 ?auto_5904 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( HOIST-AT ?auto_5905 ?auto_5911 ) ( not ( = ?auto_5903 ?auto_5905 ) ) ( not ( = ?auto_5906 ?auto_5905 ) ) ( AVAILABLE ?auto_5905 ) ( SURFACE-AT ?auto_5901 ?auto_5911 ) ( ON ?auto_5901 ?auto_5912 ) ( CLEAR ?auto_5901 ) ( not ( = ?auto_5901 ?auto_5912 ) ) ( not ( = ?auto_5902 ?auto_5912 ) ) ( not ( = ?auto_5910 ?auto_5912 ) ) ( not ( = ?auto_5907 ?auto_5912 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5905 ?auto_5901 ?auto_5912 ?auto_5911 )
      ( MAKE-2CRATE ?auto_5910 ?auto_5901 ?auto_5902 )
      ( MAKE-1CRATE-VERIFY ?auto_5901 ?auto_5902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5913 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5915 - SURFACE
    )
    :vars
    (
      ?auto_5924 - HOIST
      ?auto_5920 - PLACE
      ?auto_5916 - PLACE
      ?auto_5919 - HOIST
      ?auto_5923 - SURFACE
      ?auto_5917 - TRUCK
      ?auto_5922 - PLACE
      ?auto_5918 - HOIST
      ?auto_5921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5924 ?auto_5920 ) ( IS-CRATE ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5915 ) ) ( not ( = ?auto_5913 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5915 ) ) ( not ( = ?auto_5916 ?auto_5920 ) ) ( HOIST-AT ?auto_5919 ?auto_5916 ) ( not ( = ?auto_5924 ?auto_5919 ) ) ( AVAILABLE ?auto_5919 ) ( SURFACE-AT ?auto_5915 ?auto_5916 ) ( ON ?auto_5915 ?auto_5923 ) ( CLEAR ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5923 ) ) ( not ( = ?auto_5915 ?auto_5923 ) ) ( not ( = ?auto_5913 ?auto_5923 ) ) ( SURFACE-AT ?auto_5913 ?auto_5920 ) ( CLEAR ?auto_5913 ) ( IS-CRATE ?auto_5914 ) ( AVAILABLE ?auto_5924 ) ( TRUCK-AT ?auto_5917 ?auto_5922 ) ( not ( = ?auto_5922 ?auto_5920 ) ) ( not ( = ?auto_5916 ?auto_5922 ) ) ( HOIST-AT ?auto_5918 ?auto_5922 ) ( not ( = ?auto_5924 ?auto_5918 ) ) ( not ( = ?auto_5919 ?auto_5918 ) ) ( AVAILABLE ?auto_5918 ) ( SURFACE-AT ?auto_5914 ?auto_5922 ) ( ON ?auto_5914 ?auto_5921 ) ( CLEAR ?auto_5914 ) ( not ( = ?auto_5914 ?auto_5921 ) ) ( not ( = ?auto_5915 ?auto_5921 ) ) ( not ( = ?auto_5913 ?auto_5921 ) ) ( not ( = ?auto_5923 ?auto_5921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5914 ?auto_5915 )
      ( MAKE-2CRATE-VERIFY ?auto_5913 ?auto_5914 ?auto_5915 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5925 - SURFACE
      ?auto_5926 - SURFACE
      ?auto_5927 - SURFACE
      ?auto_5928 - SURFACE
    )
    :vars
    (
      ?auto_5930 - HOIST
      ?auto_5933 - PLACE
      ?auto_5934 - PLACE
      ?auto_5936 - HOIST
      ?auto_5929 - SURFACE
      ?auto_5931 - TRUCK
      ?auto_5932 - PLACE
      ?auto_5935 - HOIST
      ?auto_5937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5930 ?auto_5933 ) ( IS-CRATE ?auto_5928 ) ( not ( = ?auto_5927 ?auto_5928 ) ) ( not ( = ?auto_5926 ?auto_5927 ) ) ( not ( = ?auto_5926 ?auto_5928 ) ) ( not ( = ?auto_5934 ?auto_5933 ) ) ( HOIST-AT ?auto_5936 ?auto_5934 ) ( not ( = ?auto_5930 ?auto_5936 ) ) ( AVAILABLE ?auto_5936 ) ( SURFACE-AT ?auto_5928 ?auto_5934 ) ( ON ?auto_5928 ?auto_5929 ) ( CLEAR ?auto_5928 ) ( not ( = ?auto_5927 ?auto_5929 ) ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5926 ?auto_5929 ) ) ( SURFACE-AT ?auto_5926 ?auto_5933 ) ( CLEAR ?auto_5926 ) ( IS-CRATE ?auto_5927 ) ( AVAILABLE ?auto_5930 ) ( TRUCK-AT ?auto_5931 ?auto_5932 ) ( not ( = ?auto_5932 ?auto_5933 ) ) ( not ( = ?auto_5934 ?auto_5932 ) ) ( HOIST-AT ?auto_5935 ?auto_5932 ) ( not ( = ?auto_5930 ?auto_5935 ) ) ( not ( = ?auto_5936 ?auto_5935 ) ) ( AVAILABLE ?auto_5935 ) ( SURFACE-AT ?auto_5927 ?auto_5932 ) ( ON ?auto_5927 ?auto_5937 ) ( CLEAR ?auto_5927 ) ( not ( = ?auto_5927 ?auto_5937 ) ) ( not ( = ?auto_5928 ?auto_5937 ) ) ( not ( = ?auto_5926 ?auto_5937 ) ) ( not ( = ?auto_5929 ?auto_5937 ) ) ( ON ?auto_5926 ?auto_5925 ) ( not ( = ?auto_5925 ?auto_5926 ) ) ( not ( = ?auto_5925 ?auto_5927 ) ) ( not ( = ?auto_5925 ?auto_5928 ) ) ( not ( = ?auto_5925 ?auto_5929 ) ) ( not ( = ?auto_5925 ?auto_5937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5926 ?auto_5927 ?auto_5928 )
      ( MAKE-3CRATE-VERIFY ?auto_5925 ?auto_5926 ?auto_5927 ?auto_5928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5938 - SURFACE
      ?auto_5939 - SURFACE
    )
    :vars
    (
      ?auto_5941 - HOIST
      ?auto_5944 - PLACE
      ?auto_5945 - SURFACE
      ?auto_5946 - PLACE
      ?auto_5948 - HOIST
      ?auto_5940 - SURFACE
      ?auto_5943 - PLACE
      ?auto_5947 - HOIST
      ?auto_5949 - SURFACE
      ?auto_5942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5941 ?auto_5944 ) ( IS-CRATE ?auto_5939 ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5945 ?auto_5938 ) ) ( not ( = ?auto_5945 ?auto_5939 ) ) ( not ( = ?auto_5946 ?auto_5944 ) ) ( HOIST-AT ?auto_5948 ?auto_5946 ) ( not ( = ?auto_5941 ?auto_5948 ) ) ( AVAILABLE ?auto_5948 ) ( SURFACE-AT ?auto_5939 ?auto_5946 ) ( ON ?auto_5939 ?auto_5940 ) ( CLEAR ?auto_5939 ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( not ( = ?auto_5945 ?auto_5940 ) ) ( SURFACE-AT ?auto_5945 ?auto_5944 ) ( CLEAR ?auto_5945 ) ( IS-CRATE ?auto_5938 ) ( AVAILABLE ?auto_5941 ) ( not ( = ?auto_5943 ?auto_5944 ) ) ( not ( = ?auto_5946 ?auto_5943 ) ) ( HOIST-AT ?auto_5947 ?auto_5943 ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5948 ?auto_5947 ) ) ( AVAILABLE ?auto_5947 ) ( SURFACE-AT ?auto_5938 ?auto_5943 ) ( ON ?auto_5938 ?auto_5949 ) ( CLEAR ?auto_5938 ) ( not ( = ?auto_5938 ?auto_5949 ) ) ( not ( = ?auto_5939 ?auto_5949 ) ) ( not ( = ?auto_5945 ?auto_5949 ) ) ( not ( = ?auto_5940 ?auto_5949 ) ) ( TRUCK-AT ?auto_5942 ?auto_5944 ) )
    :subtasks
    ( ( !DRIVE ?auto_5942 ?auto_5944 ?auto_5943 )
      ( MAKE-2CRATE ?auto_5945 ?auto_5938 ?auto_5939 )
      ( MAKE-1CRATE-VERIFY ?auto_5938 ?auto_5939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5950 - SURFACE
      ?auto_5951 - SURFACE
      ?auto_5952 - SURFACE
    )
    :vars
    (
      ?auto_5953 - HOIST
      ?auto_5955 - PLACE
      ?auto_5954 - PLACE
      ?auto_5959 - HOIST
      ?auto_5961 - SURFACE
      ?auto_5958 - PLACE
      ?auto_5957 - HOIST
      ?auto_5956 - SURFACE
      ?auto_5960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5953 ?auto_5955 ) ( IS-CRATE ?auto_5952 ) ( not ( = ?auto_5951 ?auto_5952 ) ) ( not ( = ?auto_5950 ?auto_5951 ) ) ( not ( = ?auto_5950 ?auto_5952 ) ) ( not ( = ?auto_5954 ?auto_5955 ) ) ( HOIST-AT ?auto_5959 ?auto_5954 ) ( not ( = ?auto_5953 ?auto_5959 ) ) ( AVAILABLE ?auto_5959 ) ( SURFACE-AT ?auto_5952 ?auto_5954 ) ( ON ?auto_5952 ?auto_5961 ) ( CLEAR ?auto_5952 ) ( not ( = ?auto_5951 ?auto_5961 ) ) ( not ( = ?auto_5952 ?auto_5961 ) ) ( not ( = ?auto_5950 ?auto_5961 ) ) ( SURFACE-AT ?auto_5950 ?auto_5955 ) ( CLEAR ?auto_5950 ) ( IS-CRATE ?auto_5951 ) ( AVAILABLE ?auto_5953 ) ( not ( = ?auto_5958 ?auto_5955 ) ) ( not ( = ?auto_5954 ?auto_5958 ) ) ( HOIST-AT ?auto_5957 ?auto_5958 ) ( not ( = ?auto_5953 ?auto_5957 ) ) ( not ( = ?auto_5959 ?auto_5957 ) ) ( AVAILABLE ?auto_5957 ) ( SURFACE-AT ?auto_5951 ?auto_5958 ) ( ON ?auto_5951 ?auto_5956 ) ( CLEAR ?auto_5951 ) ( not ( = ?auto_5951 ?auto_5956 ) ) ( not ( = ?auto_5952 ?auto_5956 ) ) ( not ( = ?auto_5950 ?auto_5956 ) ) ( not ( = ?auto_5961 ?auto_5956 ) ) ( TRUCK-AT ?auto_5960 ?auto_5955 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5951 ?auto_5952 )
      ( MAKE-2CRATE-VERIFY ?auto_5950 ?auto_5951 ?auto_5952 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5962 - SURFACE
      ?auto_5963 - SURFACE
      ?auto_5964 - SURFACE
      ?auto_5965 - SURFACE
    )
    :vars
    (
      ?auto_5968 - HOIST
      ?auto_5967 - PLACE
      ?auto_5974 - PLACE
      ?auto_5969 - HOIST
      ?auto_5970 - SURFACE
      ?auto_5972 - PLACE
      ?auto_5973 - HOIST
      ?auto_5971 - SURFACE
      ?auto_5966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5968 ?auto_5967 ) ( IS-CRATE ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5965 ) ) ( not ( = ?auto_5974 ?auto_5967 ) ) ( HOIST-AT ?auto_5969 ?auto_5974 ) ( not ( = ?auto_5968 ?auto_5969 ) ) ( AVAILABLE ?auto_5969 ) ( SURFACE-AT ?auto_5965 ?auto_5974 ) ( ON ?auto_5965 ?auto_5970 ) ( CLEAR ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5970 ) ) ( not ( = ?auto_5965 ?auto_5970 ) ) ( not ( = ?auto_5963 ?auto_5970 ) ) ( SURFACE-AT ?auto_5963 ?auto_5967 ) ( CLEAR ?auto_5963 ) ( IS-CRATE ?auto_5964 ) ( AVAILABLE ?auto_5968 ) ( not ( = ?auto_5972 ?auto_5967 ) ) ( not ( = ?auto_5974 ?auto_5972 ) ) ( HOIST-AT ?auto_5973 ?auto_5972 ) ( not ( = ?auto_5968 ?auto_5973 ) ) ( not ( = ?auto_5969 ?auto_5973 ) ) ( AVAILABLE ?auto_5973 ) ( SURFACE-AT ?auto_5964 ?auto_5972 ) ( ON ?auto_5964 ?auto_5971 ) ( CLEAR ?auto_5964 ) ( not ( = ?auto_5964 ?auto_5971 ) ) ( not ( = ?auto_5965 ?auto_5971 ) ) ( not ( = ?auto_5963 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( TRUCK-AT ?auto_5966 ?auto_5967 ) ( ON ?auto_5963 ?auto_5962 ) ( not ( = ?auto_5962 ?auto_5963 ) ) ( not ( = ?auto_5962 ?auto_5964 ) ) ( not ( = ?auto_5962 ?auto_5965 ) ) ( not ( = ?auto_5962 ?auto_5970 ) ) ( not ( = ?auto_5962 ?auto_5971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5963 ?auto_5964 ?auto_5965 )
      ( MAKE-3CRATE-VERIFY ?auto_5962 ?auto_5963 ?auto_5964 ?auto_5965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5975 - SURFACE
      ?auto_5976 - SURFACE
    )
    :vars
    (
      ?auto_5979 - HOIST
      ?auto_5978 - PLACE
      ?auto_5981 - SURFACE
      ?auto_5986 - PLACE
      ?auto_5980 - HOIST
      ?auto_5982 - SURFACE
      ?auto_5984 - PLACE
      ?auto_5985 - HOIST
      ?auto_5983 - SURFACE
      ?auto_5977 - TRUCK
      ?auto_5987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5979 ?auto_5978 ) ( IS-CRATE ?auto_5976 ) ( not ( = ?auto_5975 ?auto_5976 ) ) ( not ( = ?auto_5981 ?auto_5975 ) ) ( not ( = ?auto_5981 ?auto_5976 ) ) ( not ( = ?auto_5986 ?auto_5978 ) ) ( HOIST-AT ?auto_5980 ?auto_5986 ) ( not ( = ?auto_5979 ?auto_5980 ) ) ( AVAILABLE ?auto_5980 ) ( SURFACE-AT ?auto_5976 ?auto_5986 ) ( ON ?auto_5976 ?auto_5982 ) ( CLEAR ?auto_5976 ) ( not ( = ?auto_5975 ?auto_5982 ) ) ( not ( = ?auto_5976 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( IS-CRATE ?auto_5975 ) ( not ( = ?auto_5984 ?auto_5978 ) ) ( not ( = ?auto_5986 ?auto_5984 ) ) ( HOIST-AT ?auto_5985 ?auto_5984 ) ( not ( = ?auto_5979 ?auto_5985 ) ) ( not ( = ?auto_5980 ?auto_5985 ) ) ( AVAILABLE ?auto_5985 ) ( SURFACE-AT ?auto_5975 ?auto_5984 ) ( ON ?auto_5975 ?auto_5983 ) ( CLEAR ?auto_5975 ) ( not ( = ?auto_5975 ?auto_5983 ) ) ( not ( = ?auto_5976 ?auto_5983 ) ) ( not ( = ?auto_5981 ?auto_5983 ) ) ( not ( = ?auto_5982 ?auto_5983 ) ) ( TRUCK-AT ?auto_5977 ?auto_5978 ) ( SURFACE-AT ?auto_5987 ?auto_5978 ) ( CLEAR ?auto_5987 ) ( LIFTING ?auto_5979 ?auto_5981 ) ( IS-CRATE ?auto_5981 ) ( not ( = ?auto_5987 ?auto_5981 ) ) ( not ( = ?auto_5975 ?auto_5987 ) ) ( not ( = ?auto_5976 ?auto_5987 ) ) ( not ( = ?auto_5982 ?auto_5987 ) ) ( not ( = ?auto_5983 ?auto_5987 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5987 ?auto_5981 )
      ( MAKE-2CRATE ?auto_5981 ?auto_5975 ?auto_5976 )
      ( MAKE-1CRATE-VERIFY ?auto_5975 ?auto_5976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5988 - SURFACE
      ?auto_5989 - SURFACE
      ?auto_5990 - SURFACE
    )
    :vars
    (
      ?auto_5991 - HOIST
      ?auto_6000 - PLACE
      ?auto_5993 - PLACE
      ?auto_5996 - HOIST
      ?auto_5997 - SURFACE
      ?auto_5994 - PLACE
      ?auto_5999 - HOIST
      ?auto_5998 - SURFACE
      ?auto_5992 - TRUCK
      ?auto_5995 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5991 ?auto_6000 ) ( IS-CRATE ?auto_5990 ) ( not ( = ?auto_5989 ?auto_5990 ) ) ( not ( = ?auto_5988 ?auto_5989 ) ) ( not ( = ?auto_5988 ?auto_5990 ) ) ( not ( = ?auto_5993 ?auto_6000 ) ) ( HOIST-AT ?auto_5996 ?auto_5993 ) ( not ( = ?auto_5991 ?auto_5996 ) ) ( AVAILABLE ?auto_5996 ) ( SURFACE-AT ?auto_5990 ?auto_5993 ) ( ON ?auto_5990 ?auto_5997 ) ( CLEAR ?auto_5990 ) ( not ( = ?auto_5989 ?auto_5997 ) ) ( not ( = ?auto_5990 ?auto_5997 ) ) ( not ( = ?auto_5988 ?auto_5997 ) ) ( IS-CRATE ?auto_5989 ) ( not ( = ?auto_5994 ?auto_6000 ) ) ( not ( = ?auto_5993 ?auto_5994 ) ) ( HOIST-AT ?auto_5999 ?auto_5994 ) ( not ( = ?auto_5991 ?auto_5999 ) ) ( not ( = ?auto_5996 ?auto_5999 ) ) ( AVAILABLE ?auto_5999 ) ( SURFACE-AT ?auto_5989 ?auto_5994 ) ( ON ?auto_5989 ?auto_5998 ) ( CLEAR ?auto_5989 ) ( not ( = ?auto_5989 ?auto_5998 ) ) ( not ( = ?auto_5990 ?auto_5998 ) ) ( not ( = ?auto_5988 ?auto_5998 ) ) ( not ( = ?auto_5997 ?auto_5998 ) ) ( TRUCK-AT ?auto_5992 ?auto_6000 ) ( SURFACE-AT ?auto_5995 ?auto_6000 ) ( CLEAR ?auto_5995 ) ( LIFTING ?auto_5991 ?auto_5988 ) ( IS-CRATE ?auto_5988 ) ( not ( = ?auto_5995 ?auto_5988 ) ) ( not ( = ?auto_5989 ?auto_5995 ) ) ( not ( = ?auto_5990 ?auto_5995 ) ) ( not ( = ?auto_5997 ?auto_5995 ) ) ( not ( = ?auto_5998 ?auto_5995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5989 ?auto_5990 )
      ( MAKE-2CRATE-VERIFY ?auto_5988 ?auto_5989 ?auto_5990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6001 - SURFACE
      ?auto_6002 - SURFACE
      ?auto_6003 - SURFACE
      ?auto_6004 - SURFACE
    )
    :vars
    (
      ?auto_6005 - HOIST
      ?auto_6010 - PLACE
      ?auto_6008 - PLACE
      ?auto_6011 - HOIST
      ?auto_6009 - SURFACE
      ?auto_6006 - PLACE
      ?auto_6013 - HOIST
      ?auto_6007 - SURFACE
      ?auto_6012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6005 ?auto_6010 ) ( IS-CRATE ?auto_6004 ) ( not ( = ?auto_6003 ?auto_6004 ) ) ( not ( = ?auto_6002 ?auto_6003 ) ) ( not ( = ?auto_6002 ?auto_6004 ) ) ( not ( = ?auto_6008 ?auto_6010 ) ) ( HOIST-AT ?auto_6011 ?auto_6008 ) ( not ( = ?auto_6005 ?auto_6011 ) ) ( AVAILABLE ?auto_6011 ) ( SURFACE-AT ?auto_6004 ?auto_6008 ) ( ON ?auto_6004 ?auto_6009 ) ( CLEAR ?auto_6004 ) ( not ( = ?auto_6003 ?auto_6009 ) ) ( not ( = ?auto_6004 ?auto_6009 ) ) ( not ( = ?auto_6002 ?auto_6009 ) ) ( IS-CRATE ?auto_6003 ) ( not ( = ?auto_6006 ?auto_6010 ) ) ( not ( = ?auto_6008 ?auto_6006 ) ) ( HOIST-AT ?auto_6013 ?auto_6006 ) ( not ( = ?auto_6005 ?auto_6013 ) ) ( not ( = ?auto_6011 ?auto_6013 ) ) ( AVAILABLE ?auto_6013 ) ( SURFACE-AT ?auto_6003 ?auto_6006 ) ( ON ?auto_6003 ?auto_6007 ) ( CLEAR ?auto_6003 ) ( not ( = ?auto_6003 ?auto_6007 ) ) ( not ( = ?auto_6004 ?auto_6007 ) ) ( not ( = ?auto_6002 ?auto_6007 ) ) ( not ( = ?auto_6009 ?auto_6007 ) ) ( TRUCK-AT ?auto_6012 ?auto_6010 ) ( SURFACE-AT ?auto_6001 ?auto_6010 ) ( CLEAR ?auto_6001 ) ( LIFTING ?auto_6005 ?auto_6002 ) ( IS-CRATE ?auto_6002 ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6003 ?auto_6001 ) ) ( not ( = ?auto_6004 ?auto_6001 ) ) ( not ( = ?auto_6009 ?auto_6001 ) ) ( not ( = ?auto_6007 ?auto_6001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6002 ?auto_6003 ?auto_6004 )
      ( MAKE-3CRATE-VERIFY ?auto_6001 ?auto_6002 ?auto_6003 ?auto_6004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6014 - SURFACE
      ?auto_6015 - SURFACE
    )
    :vars
    (
      ?auto_6016 - HOIST
      ?auto_6022 - PLACE
      ?auto_6018 - SURFACE
      ?auto_6020 - PLACE
      ?auto_6023 - HOIST
      ?auto_6021 - SURFACE
      ?auto_6017 - PLACE
      ?auto_6026 - HOIST
      ?auto_6019 - SURFACE
      ?auto_6025 - TRUCK
      ?auto_6024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6016 ?auto_6022 ) ( IS-CRATE ?auto_6015 ) ( not ( = ?auto_6014 ?auto_6015 ) ) ( not ( = ?auto_6018 ?auto_6014 ) ) ( not ( = ?auto_6018 ?auto_6015 ) ) ( not ( = ?auto_6020 ?auto_6022 ) ) ( HOIST-AT ?auto_6023 ?auto_6020 ) ( not ( = ?auto_6016 ?auto_6023 ) ) ( AVAILABLE ?auto_6023 ) ( SURFACE-AT ?auto_6015 ?auto_6020 ) ( ON ?auto_6015 ?auto_6021 ) ( CLEAR ?auto_6015 ) ( not ( = ?auto_6014 ?auto_6021 ) ) ( not ( = ?auto_6015 ?auto_6021 ) ) ( not ( = ?auto_6018 ?auto_6021 ) ) ( IS-CRATE ?auto_6014 ) ( not ( = ?auto_6017 ?auto_6022 ) ) ( not ( = ?auto_6020 ?auto_6017 ) ) ( HOIST-AT ?auto_6026 ?auto_6017 ) ( not ( = ?auto_6016 ?auto_6026 ) ) ( not ( = ?auto_6023 ?auto_6026 ) ) ( AVAILABLE ?auto_6026 ) ( SURFACE-AT ?auto_6014 ?auto_6017 ) ( ON ?auto_6014 ?auto_6019 ) ( CLEAR ?auto_6014 ) ( not ( = ?auto_6014 ?auto_6019 ) ) ( not ( = ?auto_6015 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6021 ?auto_6019 ) ) ( TRUCK-AT ?auto_6025 ?auto_6022 ) ( SURFACE-AT ?auto_6024 ?auto_6022 ) ( CLEAR ?auto_6024 ) ( IS-CRATE ?auto_6018 ) ( not ( = ?auto_6024 ?auto_6018 ) ) ( not ( = ?auto_6014 ?auto_6024 ) ) ( not ( = ?auto_6015 ?auto_6024 ) ) ( not ( = ?auto_6021 ?auto_6024 ) ) ( not ( = ?auto_6019 ?auto_6024 ) ) ( AVAILABLE ?auto_6016 ) ( IN ?auto_6018 ?auto_6025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6016 ?auto_6018 ?auto_6025 ?auto_6022 )
      ( MAKE-2CRATE ?auto_6018 ?auto_6014 ?auto_6015 )
      ( MAKE-1CRATE-VERIFY ?auto_6014 ?auto_6015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6027 - SURFACE
      ?auto_6028 - SURFACE
      ?auto_6029 - SURFACE
    )
    :vars
    (
      ?auto_6035 - HOIST
      ?auto_6030 - PLACE
      ?auto_6033 - PLACE
      ?auto_6037 - HOIST
      ?auto_6032 - SURFACE
      ?auto_6031 - PLACE
      ?auto_6039 - HOIST
      ?auto_6038 - SURFACE
      ?auto_6034 - TRUCK
      ?auto_6036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6035 ?auto_6030 ) ( IS-CRATE ?auto_6029 ) ( not ( = ?auto_6028 ?auto_6029 ) ) ( not ( = ?auto_6027 ?auto_6028 ) ) ( not ( = ?auto_6027 ?auto_6029 ) ) ( not ( = ?auto_6033 ?auto_6030 ) ) ( HOIST-AT ?auto_6037 ?auto_6033 ) ( not ( = ?auto_6035 ?auto_6037 ) ) ( AVAILABLE ?auto_6037 ) ( SURFACE-AT ?auto_6029 ?auto_6033 ) ( ON ?auto_6029 ?auto_6032 ) ( CLEAR ?auto_6029 ) ( not ( = ?auto_6028 ?auto_6032 ) ) ( not ( = ?auto_6029 ?auto_6032 ) ) ( not ( = ?auto_6027 ?auto_6032 ) ) ( IS-CRATE ?auto_6028 ) ( not ( = ?auto_6031 ?auto_6030 ) ) ( not ( = ?auto_6033 ?auto_6031 ) ) ( HOIST-AT ?auto_6039 ?auto_6031 ) ( not ( = ?auto_6035 ?auto_6039 ) ) ( not ( = ?auto_6037 ?auto_6039 ) ) ( AVAILABLE ?auto_6039 ) ( SURFACE-AT ?auto_6028 ?auto_6031 ) ( ON ?auto_6028 ?auto_6038 ) ( CLEAR ?auto_6028 ) ( not ( = ?auto_6028 ?auto_6038 ) ) ( not ( = ?auto_6029 ?auto_6038 ) ) ( not ( = ?auto_6027 ?auto_6038 ) ) ( not ( = ?auto_6032 ?auto_6038 ) ) ( TRUCK-AT ?auto_6034 ?auto_6030 ) ( SURFACE-AT ?auto_6036 ?auto_6030 ) ( CLEAR ?auto_6036 ) ( IS-CRATE ?auto_6027 ) ( not ( = ?auto_6036 ?auto_6027 ) ) ( not ( = ?auto_6028 ?auto_6036 ) ) ( not ( = ?auto_6029 ?auto_6036 ) ) ( not ( = ?auto_6032 ?auto_6036 ) ) ( not ( = ?auto_6038 ?auto_6036 ) ) ( AVAILABLE ?auto_6035 ) ( IN ?auto_6027 ?auto_6034 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6028 ?auto_6029 )
      ( MAKE-2CRATE-VERIFY ?auto_6027 ?auto_6028 ?auto_6029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6040 - SURFACE
      ?auto_6041 - SURFACE
      ?auto_6042 - SURFACE
      ?auto_6043 - SURFACE
    )
    :vars
    (
      ?auto_6046 - HOIST
      ?auto_6045 - PLACE
      ?auto_6052 - PLACE
      ?auto_6044 - HOIST
      ?auto_6050 - SURFACE
      ?auto_6047 - PLACE
      ?auto_6048 - HOIST
      ?auto_6051 - SURFACE
      ?auto_6049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6046 ?auto_6045 ) ( IS-CRATE ?auto_6043 ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6042 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6052 ?auto_6045 ) ) ( HOIST-AT ?auto_6044 ?auto_6052 ) ( not ( = ?auto_6046 ?auto_6044 ) ) ( AVAILABLE ?auto_6044 ) ( SURFACE-AT ?auto_6043 ?auto_6052 ) ( ON ?auto_6043 ?auto_6050 ) ( CLEAR ?auto_6043 ) ( not ( = ?auto_6042 ?auto_6050 ) ) ( not ( = ?auto_6043 ?auto_6050 ) ) ( not ( = ?auto_6041 ?auto_6050 ) ) ( IS-CRATE ?auto_6042 ) ( not ( = ?auto_6047 ?auto_6045 ) ) ( not ( = ?auto_6052 ?auto_6047 ) ) ( HOIST-AT ?auto_6048 ?auto_6047 ) ( not ( = ?auto_6046 ?auto_6048 ) ) ( not ( = ?auto_6044 ?auto_6048 ) ) ( AVAILABLE ?auto_6048 ) ( SURFACE-AT ?auto_6042 ?auto_6047 ) ( ON ?auto_6042 ?auto_6051 ) ( CLEAR ?auto_6042 ) ( not ( = ?auto_6042 ?auto_6051 ) ) ( not ( = ?auto_6043 ?auto_6051 ) ) ( not ( = ?auto_6041 ?auto_6051 ) ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( TRUCK-AT ?auto_6049 ?auto_6045 ) ( SURFACE-AT ?auto_6040 ?auto_6045 ) ( CLEAR ?auto_6040 ) ( IS-CRATE ?auto_6041 ) ( not ( = ?auto_6040 ?auto_6041 ) ) ( not ( = ?auto_6042 ?auto_6040 ) ) ( not ( = ?auto_6043 ?auto_6040 ) ) ( not ( = ?auto_6050 ?auto_6040 ) ) ( not ( = ?auto_6051 ?auto_6040 ) ) ( AVAILABLE ?auto_6046 ) ( IN ?auto_6041 ?auto_6049 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6041 ?auto_6042 ?auto_6043 )
      ( MAKE-3CRATE-VERIFY ?auto_6040 ?auto_6041 ?auto_6042 ?auto_6043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6053 - SURFACE
      ?auto_6054 - SURFACE
    )
    :vars
    (
      ?auto_6058 - HOIST
      ?auto_6056 - PLACE
      ?auto_6060 - SURFACE
      ?auto_6065 - PLACE
      ?auto_6055 - HOIST
      ?auto_6063 - SURFACE
      ?auto_6059 - PLACE
      ?auto_6061 - HOIST
      ?auto_6064 - SURFACE
      ?auto_6057 - SURFACE
      ?auto_6062 - TRUCK
      ?auto_6066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6058 ?auto_6056 ) ( IS-CRATE ?auto_6054 ) ( not ( = ?auto_6053 ?auto_6054 ) ) ( not ( = ?auto_6060 ?auto_6053 ) ) ( not ( = ?auto_6060 ?auto_6054 ) ) ( not ( = ?auto_6065 ?auto_6056 ) ) ( HOIST-AT ?auto_6055 ?auto_6065 ) ( not ( = ?auto_6058 ?auto_6055 ) ) ( AVAILABLE ?auto_6055 ) ( SURFACE-AT ?auto_6054 ?auto_6065 ) ( ON ?auto_6054 ?auto_6063 ) ( CLEAR ?auto_6054 ) ( not ( = ?auto_6053 ?auto_6063 ) ) ( not ( = ?auto_6054 ?auto_6063 ) ) ( not ( = ?auto_6060 ?auto_6063 ) ) ( IS-CRATE ?auto_6053 ) ( not ( = ?auto_6059 ?auto_6056 ) ) ( not ( = ?auto_6065 ?auto_6059 ) ) ( HOIST-AT ?auto_6061 ?auto_6059 ) ( not ( = ?auto_6058 ?auto_6061 ) ) ( not ( = ?auto_6055 ?auto_6061 ) ) ( AVAILABLE ?auto_6061 ) ( SURFACE-AT ?auto_6053 ?auto_6059 ) ( ON ?auto_6053 ?auto_6064 ) ( CLEAR ?auto_6053 ) ( not ( = ?auto_6053 ?auto_6064 ) ) ( not ( = ?auto_6054 ?auto_6064 ) ) ( not ( = ?auto_6060 ?auto_6064 ) ) ( not ( = ?auto_6063 ?auto_6064 ) ) ( SURFACE-AT ?auto_6057 ?auto_6056 ) ( CLEAR ?auto_6057 ) ( IS-CRATE ?auto_6060 ) ( not ( = ?auto_6057 ?auto_6060 ) ) ( not ( = ?auto_6053 ?auto_6057 ) ) ( not ( = ?auto_6054 ?auto_6057 ) ) ( not ( = ?auto_6063 ?auto_6057 ) ) ( not ( = ?auto_6064 ?auto_6057 ) ) ( AVAILABLE ?auto_6058 ) ( IN ?auto_6060 ?auto_6062 ) ( TRUCK-AT ?auto_6062 ?auto_6066 ) ( not ( = ?auto_6066 ?auto_6056 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) ( not ( = ?auto_6059 ?auto_6066 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6062 ?auto_6066 ?auto_6056 )
      ( MAKE-2CRATE ?auto_6060 ?auto_6053 ?auto_6054 )
      ( MAKE-1CRATE-VERIFY ?auto_6053 ?auto_6054 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6067 - SURFACE
      ?auto_6068 - SURFACE
      ?auto_6069 - SURFACE
    )
    :vars
    (
      ?auto_6075 - HOIST
      ?auto_6073 - PLACE
      ?auto_6079 - PLACE
      ?auto_6072 - HOIST
      ?auto_6071 - SURFACE
      ?auto_6076 - PLACE
      ?auto_6074 - HOIST
      ?auto_6080 - SURFACE
      ?auto_6077 - SURFACE
      ?auto_6078 - TRUCK
      ?auto_6070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6075 ?auto_6073 ) ( IS-CRATE ?auto_6069 ) ( not ( = ?auto_6068 ?auto_6069 ) ) ( not ( = ?auto_6067 ?auto_6068 ) ) ( not ( = ?auto_6067 ?auto_6069 ) ) ( not ( = ?auto_6079 ?auto_6073 ) ) ( HOIST-AT ?auto_6072 ?auto_6079 ) ( not ( = ?auto_6075 ?auto_6072 ) ) ( AVAILABLE ?auto_6072 ) ( SURFACE-AT ?auto_6069 ?auto_6079 ) ( ON ?auto_6069 ?auto_6071 ) ( CLEAR ?auto_6069 ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6069 ?auto_6071 ) ) ( not ( = ?auto_6067 ?auto_6071 ) ) ( IS-CRATE ?auto_6068 ) ( not ( = ?auto_6076 ?auto_6073 ) ) ( not ( = ?auto_6079 ?auto_6076 ) ) ( HOIST-AT ?auto_6074 ?auto_6076 ) ( not ( = ?auto_6075 ?auto_6074 ) ) ( not ( = ?auto_6072 ?auto_6074 ) ) ( AVAILABLE ?auto_6074 ) ( SURFACE-AT ?auto_6068 ?auto_6076 ) ( ON ?auto_6068 ?auto_6080 ) ( CLEAR ?auto_6068 ) ( not ( = ?auto_6068 ?auto_6080 ) ) ( not ( = ?auto_6069 ?auto_6080 ) ) ( not ( = ?auto_6067 ?auto_6080 ) ) ( not ( = ?auto_6071 ?auto_6080 ) ) ( SURFACE-AT ?auto_6077 ?auto_6073 ) ( CLEAR ?auto_6077 ) ( IS-CRATE ?auto_6067 ) ( not ( = ?auto_6077 ?auto_6067 ) ) ( not ( = ?auto_6068 ?auto_6077 ) ) ( not ( = ?auto_6069 ?auto_6077 ) ) ( not ( = ?auto_6071 ?auto_6077 ) ) ( not ( = ?auto_6080 ?auto_6077 ) ) ( AVAILABLE ?auto_6075 ) ( IN ?auto_6067 ?auto_6078 ) ( TRUCK-AT ?auto_6078 ?auto_6070 ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6079 ?auto_6070 ) ) ( not ( = ?auto_6076 ?auto_6070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6068 ?auto_6069 )
      ( MAKE-2CRATE-VERIFY ?auto_6067 ?auto_6068 ?auto_6069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6081 - SURFACE
      ?auto_6082 - SURFACE
      ?auto_6083 - SURFACE
      ?auto_6084 - SURFACE
    )
    :vars
    (
      ?auto_6092 - HOIST
      ?auto_6093 - PLACE
      ?auto_6085 - PLACE
      ?auto_6088 - HOIST
      ?auto_6091 - SURFACE
      ?auto_6090 - PLACE
      ?auto_6094 - HOIST
      ?auto_6086 - SURFACE
      ?auto_6089 - TRUCK
      ?auto_6087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6092 ?auto_6093 ) ( IS-CRATE ?auto_6084 ) ( not ( = ?auto_6083 ?auto_6084 ) ) ( not ( = ?auto_6082 ?auto_6083 ) ) ( not ( = ?auto_6082 ?auto_6084 ) ) ( not ( = ?auto_6085 ?auto_6093 ) ) ( HOIST-AT ?auto_6088 ?auto_6085 ) ( not ( = ?auto_6092 ?auto_6088 ) ) ( AVAILABLE ?auto_6088 ) ( SURFACE-AT ?auto_6084 ?auto_6085 ) ( ON ?auto_6084 ?auto_6091 ) ( CLEAR ?auto_6084 ) ( not ( = ?auto_6083 ?auto_6091 ) ) ( not ( = ?auto_6084 ?auto_6091 ) ) ( not ( = ?auto_6082 ?auto_6091 ) ) ( IS-CRATE ?auto_6083 ) ( not ( = ?auto_6090 ?auto_6093 ) ) ( not ( = ?auto_6085 ?auto_6090 ) ) ( HOIST-AT ?auto_6094 ?auto_6090 ) ( not ( = ?auto_6092 ?auto_6094 ) ) ( not ( = ?auto_6088 ?auto_6094 ) ) ( AVAILABLE ?auto_6094 ) ( SURFACE-AT ?auto_6083 ?auto_6090 ) ( ON ?auto_6083 ?auto_6086 ) ( CLEAR ?auto_6083 ) ( not ( = ?auto_6083 ?auto_6086 ) ) ( not ( = ?auto_6084 ?auto_6086 ) ) ( not ( = ?auto_6082 ?auto_6086 ) ) ( not ( = ?auto_6091 ?auto_6086 ) ) ( SURFACE-AT ?auto_6081 ?auto_6093 ) ( CLEAR ?auto_6081 ) ( IS-CRATE ?auto_6082 ) ( not ( = ?auto_6081 ?auto_6082 ) ) ( not ( = ?auto_6083 ?auto_6081 ) ) ( not ( = ?auto_6084 ?auto_6081 ) ) ( not ( = ?auto_6091 ?auto_6081 ) ) ( not ( = ?auto_6086 ?auto_6081 ) ) ( AVAILABLE ?auto_6092 ) ( IN ?auto_6082 ?auto_6089 ) ( TRUCK-AT ?auto_6089 ?auto_6087 ) ( not ( = ?auto_6087 ?auto_6093 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6090 ?auto_6087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6082 ?auto_6083 ?auto_6084 )
      ( MAKE-3CRATE-VERIFY ?auto_6081 ?auto_6082 ?auto_6083 ?auto_6084 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6095 - SURFACE
      ?auto_6096 - SURFACE
    )
    :vars
    (
      ?auto_6105 - HOIST
      ?auto_6106 - PLACE
      ?auto_6108 - SURFACE
      ?auto_6097 - PLACE
      ?auto_6100 - HOIST
      ?auto_6104 - SURFACE
      ?auto_6102 - PLACE
      ?auto_6107 - HOIST
      ?auto_6098 - SURFACE
      ?auto_6103 - SURFACE
      ?auto_6101 - TRUCK
      ?auto_6099 - PLACE
      ?auto_6109 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6105 ?auto_6106 ) ( IS-CRATE ?auto_6096 ) ( not ( = ?auto_6095 ?auto_6096 ) ) ( not ( = ?auto_6108 ?auto_6095 ) ) ( not ( = ?auto_6108 ?auto_6096 ) ) ( not ( = ?auto_6097 ?auto_6106 ) ) ( HOIST-AT ?auto_6100 ?auto_6097 ) ( not ( = ?auto_6105 ?auto_6100 ) ) ( AVAILABLE ?auto_6100 ) ( SURFACE-AT ?auto_6096 ?auto_6097 ) ( ON ?auto_6096 ?auto_6104 ) ( CLEAR ?auto_6096 ) ( not ( = ?auto_6095 ?auto_6104 ) ) ( not ( = ?auto_6096 ?auto_6104 ) ) ( not ( = ?auto_6108 ?auto_6104 ) ) ( IS-CRATE ?auto_6095 ) ( not ( = ?auto_6102 ?auto_6106 ) ) ( not ( = ?auto_6097 ?auto_6102 ) ) ( HOIST-AT ?auto_6107 ?auto_6102 ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6100 ?auto_6107 ) ) ( AVAILABLE ?auto_6107 ) ( SURFACE-AT ?auto_6095 ?auto_6102 ) ( ON ?auto_6095 ?auto_6098 ) ( CLEAR ?auto_6095 ) ( not ( = ?auto_6095 ?auto_6098 ) ) ( not ( = ?auto_6096 ?auto_6098 ) ) ( not ( = ?auto_6108 ?auto_6098 ) ) ( not ( = ?auto_6104 ?auto_6098 ) ) ( SURFACE-AT ?auto_6103 ?auto_6106 ) ( CLEAR ?auto_6103 ) ( IS-CRATE ?auto_6108 ) ( not ( = ?auto_6103 ?auto_6108 ) ) ( not ( = ?auto_6095 ?auto_6103 ) ) ( not ( = ?auto_6096 ?auto_6103 ) ) ( not ( = ?auto_6104 ?auto_6103 ) ) ( not ( = ?auto_6098 ?auto_6103 ) ) ( AVAILABLE ?auto_6105 ) ( TRUCK-AT ?auto_6101 ?auto_6099 ) ( not ( = ?auto_6099 ?auto_6106 ) ) ( not ( = ?auto_6097 ?auto_6099 ) ) ( not ( = ?auto_6102 ?auto_6099 ) ) ( HOIST-AT ?auto_6109 ?auto_6099 ) ( LIFTING ?auto_6109 ?auto_6108 ) ( not ( = ?auto_6105 ?auto_6109 ) ) ( not ( = ?auto_6100 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6109 ?auto_6108 ?auto_6101 ?auto_6099 )
      ( MAKE-2CRATE ?auto_6108 ?auto_6095 ?auto_6096 )
      ( MAKE-1CRATE-VERIFY ?auto_6095 ?auto_6096 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6110 - SURFACE
      ?auto_6111 - SURFACE
      ?auto_6112 - SURFACE
    )
    :vars
    (
      ?auto_6121 - HOIST
      ?auto_6114 - PLACE
      ?auto_6124 - PLACE
      ?auto_6116 - HOIST
      ?auto_6122 - SURFACE
      ?auto_6120 - PLACE
      ?auto_6115 - HOIST
      ?auto_6113 - SURFACE
      ?auto_6117 - SURFACE
      ?auto_6119 - TRUCK
      ?auto_6118 - PLACE
      ?auto_6123 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6121 ?auto_6114 ) ( IS-CRATE ?auto_6112 ) ( not ( = ?auto_6111 ?auto_6112 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6124 ?auto_6114 ) ) ( HOIST-AT ?auto_6116 ?auto_6124 ) ( not ( = ?auto_6121 ?auto_6116 ) ) ( AVAILABLE ?auto_6116 ) ( SURFACE-AT ?auto_6112 ?auto_6124 ) ( ON ?auto_6112 ?auto_6122 ) ( CLEAR ?auto_6112 ) ( not ( = ?auto_6111 ?auto_6122 ) ) ( not ( = ?auto_6112 ?auto_6122 ) ) ( not ( = ?auto_6110 ?auto_6122 ) ) ( IS-CRATE ?auto_6111 ) ( not ( = ?auto_6120 ?auto_6114 ) ) ( not ( = ?auto_6124 ?auto_6120 ) ) ( HOIST-AT ?auto_6115 ?auto_6120 ) ( not ( = ?auto_6121 ?auto_6115 ) ) ( not ( = ?auto_6116 ?auto_6115 ) ) ( AVAILABLE ?auto_6115 ) ( SURFACE-AT ?auto_6111 ?auto_6120 ) ( ON ?auto_6111 ?auto_6113 ) ( CLEAR ?auto_6111 ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( not ( = ?auto_6112 ?auto_6113 ) ) ( not ( = ?auto_6110 ?auto_6113 ) ) ( not ( = ?auto_6122 ?auto_6113 ) ) ( SURFACE-AT ?auto_6117 ?auto_6114 ) ( CLEAR ?auto_6117 ) ( IS-CRATE ?auto_6110 ) ( not ( = ?auto_6117 ?auto_6110 ) ) ( not ( = ?auto_6111 ?auto_6117 ) ) ( not ( = ?auto_6112 ?auto_6117 ) ) ( not ( = ?auto_6122 ?auto_6117 ) ) ( not ( = ?auto_6113 ?auto_6117 ) ) ( AVAILABLE ?auto_6121 ) ( TRUCK-AT ?auto_6119 ?auto_6118 ) ( not ( = ?auto_6118 ?auto_6114 ) ) ( not ( = ?auto_6124 ?auto_6118 ) ) ( not ( = ?auto_6120 ?auto_6118 ) ) ( HOIST-AT ?auto_6123 ?auto_6118 ) ( LIFTING ?auto_6123 ?auto_6110 ) ( not ( = ?auto_6121 ?auto_6123 ) ) ( not ( = ?auto_6116 ?auto_6123 ) ) ( not ( = ?auto_6115 ?auto_6123 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6111 ?auto_6112 )
      ( MAKE-2CRATE-VERIFY ?auto_6110 ?auto_6111 ?auto_6112 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6125 - SURFACE
      ?auto_6126 - SURFACE
      ?auto_6127 - SURFACE
      ?auto_6128 - SURFACE
    )
    :vars
    (
      ?auto_6133 - HOIST
      ?auto_6138 - PLACE
      ?auto_6131 - PLACE
      ?auto_6136 - HOIST
      ?auto_6134 - SURFACE
      ?auto_6135 - PLACE
      ?auto_6139 - HOIST
      ?auto_6137 - SURFACE
      ?auto_6132 - TRUCK
      ?auto_6130 - PLACE
      ?auto_6129 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6133 ?auto_6138 ) ( IS-CRATE ?auto_6128 ) ( not ( = ?auto_6127 ?auto_6128 ) ) ( not ( = ?auto_6126 ?auto_6127 ) ) ( not ( = ?auto_6126 ?auto_6128 ) ) ( not ( = ?auto_6131 ?auto_6138 ) ) ( HOIST-AT ?auto_6136 ?auto_6131 ) ( not ( = ?auto_6133 ?auto_6136 ) ) ( AVAILABLE ?auto_6136 ) ( SURFACE-AT ?auto_6128 ?auto_6131 ) ( ON ?auto_6128 ?auto_6134 ) ( CLEAR ?auto_6128 ) ( not ( = ?auto_6127 ?auto_6134 ) ) ( not ( = ?auto_6128 ?auto_6134 ) ) ( not ( = ?auto_6126 ?auto_6134 ) ) ( IS-CRATE ?auto_6127 ) ( not ( = ?auto_6135 ?auto_6138 ) ) ( not ( = ?auto_6131 ?auto_6135 ) ) ( HOIST-AT ?auto_6139 ?auto_6135 ) ( not ( = ?auto_6133 ?auto_6139 ) ) ( not ( = ?auto_6136 ?auto_6139 ) ) ( AVAILABLE ?auto_6139 ) ( SURFACE-AT ?auto_6127 ?auto_6135 ) ( ON ?auto_6127 ?auto_6137 ) ( CLEAR ?auto_6127 ) ( not ( = ?auto_6127 ?auto_6137 ) ) ( not ( = ?auto_6128 ?auto_6137 ) ) ( not ( = ?auto_6126 ?auto_6137 ) ) ( not ( = ?auto_6134 ?auto_6137 ) ) ( SURFACE-AT ?auto_6125 ?auto_6138 ) ( CLEAR ?auto_6125 ) ( IS-CRATE ?auto_6126 ) ( not ( = ?auto_6125 ?auto_6126 ) ) ( not ( = ?auto_6127 ?auto_6125 ) ) ( not ( = ?auto_6128 ?auto_6125 ) ) ( not ( = ?auto_6134 ?auto_6125 ) ) ( not ( = ?auto_6137 ?auto_6125 ) ) ( AVAILABLE ?auto_6133 ) ( TRUCK-AT ?auto_6132 ?auto_6130 ) ( not ( = ?auto_6130 ?auto_6138 ) ) ( not ( = ?auto_6131 ?auto_6130 ) ) ( not ( = ?auto_6135 ?auto_6130 ) ) ( HOIST-AT ?auto_6129 ?auto_6130 ) ( LIFTING ?auto_6129 ?auto_6126 ) ( not ( = ?auto_6133 ?auto_6129 ) ) ( not ( = ?auto_6136 ?auto_6129 ) ) ( not ( = ?auto_6139 ?auto_6129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6126 ?auto_6127 ?auto_6128 )
      ( MAKE-3CRATE-VERIFY ?auto_6125 ?auto_6126 ?auto_6127 ?auto_6128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6140 - SURFACE
      ?auto_6141 - SURFACE
    )
    :vars
    (
      ?auto_6147 - HOIST
      ?auto_6152 - PLACE
      ?auto_6154 - SURFACE
      ?auto_6144 - PLACE
      ?auto_6150 - HOIST
      ?auto_6148 - SURFACE
      ?auto_6149 - PLACE
      ?auto_6153 - HOIST
      ?auto_6151 - SURFACE
      ?auto_6145 - SURFACE
      ?auto_6146 - TRUCK
      ?auto_6143 - PLACE
      ?auto_6142 - HOIST
      ?auto_6155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6147 ?auto_6152 ) ( IS-CRATE ?auto_6141 ) ( not ( = ?auto_6140 ?auto_6141 ) ) ( not ( = ?auto_6154 ?auto_6140 ) ) ( not ( = ?auto_6154 ?auto_6141 ) ) ( not ( = ?auto_6144 ?auto_6152 ) ) ( HOIST-AT ?auto_6150 ?auto_6144 ) ( not ( = ?auto_6147 ?auto_6150 ) ) ( AVAILABLE ?auto_6150 ) ( SURFACE-AT ?auto_6141 ?auto_6144 ) ( ON ?auto_6141 ?auto_6148 ) ( CLEAR ?auto_6141 ) ( not ( = ?auto_6140 ?auto_6148 ) ) ( not ( = ?auto_6141 ?auto_6148 ) ) ( not ( = ?auto_6154 ?auto_6148 ) ) ( IS-CRATE ?auto_6140 ) ( not ( = ?auto_6149 ?auto_6152 ) ) ( not ( = ?auto_6144 ?auto_6149 ) ) ( HOIST-AT ?auto_6153 ?auto_6149 ) ( not ( = ?auto_6147 ?auto_6153 ) ) ( not ( = ?auto_6150 ?auto_6153 ) ) ( AVAILABLE ?auto_6153 ) ( SURFACE-AT ?auto_6140 ?auto_6149 ) ( ON ?auto_6140 ?auto_6151 ) ( CLEAR ?auto_6140 ) ( not ( = ?auto_6140 ?auto_6151 ) ) ( not ( = ?auto_6141 ?auto_6151 ) ) ( not ( = ?auto_6154 ?auto_6151 ) ) ( not ( = ?auto_6148 ?auto_6151 ) ) ( SURFACE-AT ?auto_6145 ?auto_6152 ) ( CLEAR ?auto_6145 ) ( IS-CRATE ?auto_6154 ) ( not ( = ?auto_6145 ?auto_6154 ) ) ( not ( = ?auto_6140 ?auto_6145 ) ) ( not ( = ?auto_6141 ?auto_6145 ) ) ( not ( = ?auto_6148 ?auto_6145 ) ) ( not ( = ?auto_6151 ?auto_6145 ) ) ( AVAILABLE ?auto_6147 ) ( TRUCK-AT ?auto_6146 ?auto_6143 ) ( not ( = ?auto_6143 ?auto_6152 ) ) ( not ( = ?auto_6144 ?auto_6143 ) ) ( not ( = ?auto_6149 ?auto_6143 ) ) ( HOIST-AT ?auto_6142 ?auto_6143 ) ( not ( = ?auto_6147 ?auto_6142 ) ) ( not ( = ?auto_6150 ?auto_6142 ) ) ( not ( = ?auto_6153 ?auto_6142 ) ) ( AVAILABLE ?auto_6142 ) ( SURFACE-AT ?auto_6154 ?auto_6143 ) ( ON ?auto_6154 ?auto_6155 ) ( CLEAR ?auto_6154 ) ( not ( = ?auto_6140 ?auto_6155 ) ) ( not ( = ?auto_6141 ?auto_6155 ) ) ( not ( = ?auto_6154 ?auto_6155 ) ) ( not ( = ?auto_6148 ?auto_6155 ) ) ( not ( = ?auto_6151 ?auto_6155 ) ) ( not ( = ?auto_6145 ?auto_6155 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6142 ?auto_6154 ?auto_6155 ?auto_6143 )
      ( MAKE-2CRATE ?auto_6154 ?auto_6140 ?auto_6141 )
      ( MAKE-1CRATE-VERIFY ?auto_6140 ?auto_6141 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6156 - SURFACE
      ?auto_6157 - SURFACE
      ?auto_6158 - SURFACE
    )
    :vars
    (
      ?auto_6159 - HOIST
      ?auto_6161 - PLACE
      ?auto_6162 - PLACE
      ?auto_6171 - HOIST
      ?auto_6167 - SURFACE
      ?auto_6165 - PLACE
      ?auto_6160 - HOIST
      ?auto_6168 - SURFACE
      ?auto_6166 - SURFACE
      ?auto_6163 - TRUCK
      ?auto_6170 - PLACE
      ?auto_6164 - HOIST
      ?auto_6169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6159 ?auto_6161 ) ( IS-CRATE ?auto_6158 ) ( not ( = ?auto_6157 ?auto_6158 ) ) ( not ( = ?auto_6156 ?auto_6157 ) ) ( not ( = ?auto_6156 ?auto_6158 ) ) ( not ( = ?auto_6162 ?auto_6161 ) ) ( HOIST-AT ?auto_6171 ?auto_6162 ) ( not ( = ?auto_6159 ?auto_6171 ) ) ( AVAILABLE ?auto_6171 ) ( SURFACE-AT ?auto_6158 ?auto_6162 ) ( ON ?auto_6158 ?auto_6167 ) ( CLEAR ?auto_6158 ) ( not ( = ?auto_6157 ?auto_6167 ) ) ( not ( = ?auto_6158 ?auto_6167 ) ) ( not ( = ?auto_6156 ?auto_6167 ) ) ( IS-CRATE ?auto_6157 ) ( not ( = ?auto_6165 ?auto_6161 ) ) ( not ( = ?auto_6162 ?auto_6165 ) ) ( HOIST-AT ?auto_6160 ?auto_6165 ) ( not ( = ?auto_6159 ?auto_6160 ) ) ( not ( = ?auto_6171 ?auto_6160 ) ) ( AVAILABLE ?auto_6160 ) ( SURFACE-AT ?auto_6157 ?auto_6165 ) ( ON ?auto_6157 ?auto_6168 ) ( CLEAR ?auto_6157 ) ( not ( = ?auto_6157 ?auto_6168 ) ) ( not ( = ?auto_6158 ?auto_6168 ) ) ( not ( = ?auto_6156 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( SURFACE-AT ?auto_6166 ?auto_6161 ) ( CLEAR ?auto_6166 ) ( IS-CRATE ?auto_6156 ) ( not ( = ?auto_6166 ?auto_6156 ) ) ( not ( = ?auto_6157 ?auto_6166 ) ) ( not ( = ?auto_6158 ?auto_6166 ) ) ( not ( = ?auto_6167 ?auto_6166 ) ) ( not ( = ?auto_6168 ?auto_6166 ) ) ( AVAILABLE ?auto_6159 ) ( TRUCK-AT ?auto_6163 ?auto_6170 ) ( not ( = ?auto_6170 ?auto_6161 ) ) ( not ( = ?auto_6162 ?auto_6170 ) ) ( not ( = ?auto_6165 ?auto_6170 ) ) ( HOIST-AT ?auto_6164 ?auto_6170 ) ( not ( = ?auto_6159 ?auto_6164 ) ) ( not ( = ?auto_6171 ?auto_6164 ) ) ( not ( = ?auto_6160 ?auto_6164 ) ) ( AVAILABLE ?auto_6164 ) ( SURFACE-AT ?auto_6156 ?auto_6170 ) ( ON ?auto_6156 ?auto_6169 ) ( CLEAR ?auto_6156 ) ( not ( = ?auto_6157 ?auto_6169 ) ) ( not ( = ?auto_6158 ?auto_6169 ) ) ( not ( = ?auto_6156 ?auto_6169 ) ) ( not ( = ?auto_6167 ?auto_6169 ) ) ( not ( = ?auto_6168 ?auto_6169 ) ) ( not ( = ?auto_6166 ?auto_6169 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6157 ?auto_6158 )
      ( MAKE-2CRATE-VERIFY ?auto_6156 ?auto_6157 ?auto_6158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6172 - SURFACE
      ?auto_6173 - SURFACE
      ?auto_6174 - SURFACE
      ?auto_6175 - SURFACE
    )
    :vars
    (
      ?auto_6184 - HOIST
      ?auto_6178 - PLACE
      ?auto_6185 - PLACE
      ?auto_6179 - HOIST
      ?auto_6176 - SURFACE
      ?auto_6187 - PLACE
      ?auto_6183 - HOIST
      ?auto_6181 - SURFACE
      ?auto_6182 - TRUCK
      ?auto_6177 - PLACE
      ?auto_6186 - HOIST
      ?auto_6180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6184 ?auto_6178 ) ( IS-CRATE ?auto_6175 ) ( not ( = ?auto_6174 ?auto_6175 ) ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6173 ?auto_6175 ) ) ( not ( = ?auto_6185 ?auto_6178 ) ) ( HOIST-AT ?auto_6179 ?auto_6185 ) ( not ( = ?auto_6184 ?auto_6179 ) ) ( AVAILABLE ?auto_6179 ) ( SURFACE-AT ?auto_6175 ?auto_6185 ) ( ON ?auto_6175 ?auto_6176 ) ( CLEAR ?auto_6175 ) ( not ( = ?auto_6174 ?auto_6176 ) ) ( not ( = ?auto_6175 ?auto_6176 ) ) ( not ( = ?auto_6173 ?auto_6176 ) ) ( IS-CRATE ?auto_6174 ) ( not ( = ?auto_6187 ?auto_6178 ) ) ( not ( = ?auto_6185 ?auto_6187 ) ) ( HOIST-AT ?auto_6183 ?auto_6187 ) ( not ( = ?auto_6184 ?auto_6183 ) ) ( not ( = ?auto_6179 ?auto_6183 ) ) ( AVAILABLE ?auto_6183 ) ( SURFACE-AT ?auto_6174 ?auto_6187 ) ( ON ?auto_6174 ?auto_6181 ) ( CLEAR ?auto_6174 ) ( not ( = ?auto_6174 ?auto_6181 ) ) ( not ( = ?auto_6175 ?auto_6181 ) ) ( not ( = ?auto_6173 ?auto_6181 ) ) ( not ( = ?auto_6176 ?auto_6181 ) ) ( SURFACE-AT ?auto_6172 ?auto_6178 ) ( CLEAR ?auto_6172 ) ( IS-CRATE ?auto_6173 ) ( not ( = ?auto_6172 ?auto_6173 ) ) ( not ( = ?auto_6174 ?auto_6172 ) ) ( not ( = ?auto_6175 ?auto_6172 ) ) ( not ( = ?auto_6176 ?auto_6172 ) ) ( not ( = ?auto_6181 ?auto_6172 ) ) ( AVAILABLE ?auto_6184 ) ( TRUCK-AT ?auto_6182 ?auto_6177 ) ( not ( = ?auto_6177 ?auto_6178 ) ) ( not ( = ?auto_6185 ?auto_6177 ) ) ( not ( = ?auto_6187 ?auto_6177 ) ) ( HOIST-AT ?auto_6186 ?auto_6177 ) ( not ( = ?auto_6184 ?auto_6186 ) ) ( not ( = ?auto_6179 ?auto_6186 ) ) ( not ( = ?auto_6183 ?auto_6186 ) ) ( AVAILABLE ?auto_6186 ) ( SURFACE-AT ?auto_6173 ?auto_6177 ) ( ON ?auto_6173 ?auto_6180 ) ( CLEAR ?auto_6173 ) ( not ( = ?auto_6174 ?auto_6180 ) ) ( not ( = ?auto_6175 ?auto_6180 ) ) ( not ( = ?auto_6173 ?auto_6180 ) ) ( not ( = ?auto_6176 ?auto_6180 ) ) ( not ( = ?auto_6181 ?auto_6180 ) ) ( not ( = ?auto_6172 ?auto_6180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6173 ?auto_6174 ?auto_6175 )
      ( MAKE-3CRATE-VERIFY ?auto_6172 ?auto_6173 ?auto_6174 ?auto_6175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6188 - SURFACE
      ?auto_6189 - SURFACE
    )
    :vars
    (
      ?auto_6199 - HOIST
      ?auto_6192 - PLACE
      ?auto_6203 - SURFACE
      ?auto_6200 - PLACE
      ?auto_6193 - HOIST
      ?auto_6190 - SURFACE
      ?auto_6202 - PLACE
      ?auto_6198 - HOIST
      ?auto_6196 - SURFACE
      ?auto_6194 - SURFACE
      ?auto_6191 - PLACE
      ?auto_6201 - HOIST
      ?auto_6195 - SURFACE
      ?auto_6197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6199 ?auto_6192 ) ( IS-CRATE ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6203 ?auto_6188 ) ) ( not ( = ?auto_6203 ?auto_6189 ) ) ( not ( = ?auto_6200 ?auto_6192 ) ) ( HOIST-AT ?auto_6193 ?auto_6200 ) ( not ( = ?auto_6199 ?auto_6193 ) ) ( AVAILABLE ?auto_6193 ) ( SURFACE-AT ?auto_6189 ?auto_6200 ) ( ON ?auto_6189 ?auto_6190 ) ( CLEAR ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6190 ) ) ( not ( = ?auto_6189 ?auto_6190 ) ) ( not ( = ?auto_6203 ?auto_6190 ) ) ( IS-CRATE ?auto_6188 ) ( not ( = ?auto_6202 ?auto_6192 ) ) ( not ( = ?auto_6200 ?auto_6202 ) ) ( HOIST-AT ?auto_6198 ?auto_6202 ) ( not ( = ?auto_6199 ?auto_6198 ) ) ( not ( = ?auto_6193 ?auto_6198 ) ) ( AVAILABLE ?auto_6198 ) ( SURFACE-AT ?auto_6188 ?auto_6202 ) ( ON ?auto_6188 ?auto_6196 ) ( CLEAR ?auto_6188 ) ( not ( = ?auto_6188 ?auto_6196 ) ) ( not ( = ?auto_6189 ?auto_6196 ) ) ( not ( = ?auto_6203 ?auto_6196 ) ) ( not ( = ?auto_6190 ?auto_6196 ) ) ( SURFACE-AT ?auto_6194 ?auto_6192 ) ( CLEAR ?auto_6194 ) ( IS-CRATE ?auto_6203 ) ( not ( = ?auto_6194 ?auto_6203 ) ) ( not ( = ?auto_6188 ?auto_6194 ) ) ( not ( = ?auto_6189 ?auto_6194 ) ) ( not ( = ?auto_6190 ?auto_6194 ) ) ( not ( = ?auto_6196 ?auto_6194 ) ) ( AVAILABLE ?auto_6199 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6200 ?auto_6191 ) ) ( not ( = ?auto_6202 ?auto_6191 ) ) ( HOIST-AT ?auto_6201 ?auto_6191 ) ( not ( = ?auto_6199 ?auto_6201 ) ) ( not ( = ?auto_6193 ?auto_6201 ) ) ( not ( = ?auto_6198 ?auto_6201 ) ) ( AVAILABLE ?auto_6201 ) ( SURFACE-AT ?auto_6203 ?auto_6191 ) ( ON ?auto_6203 ?auto_6195 ) ( CLEAR ?auto_6203 ) ( not ( = ?auto_6188 ?auto_6195 ) ) ( not ( = ?auto_6189 ?auto_6195 ) ) ( not ( = ?auto_6203 ?auto_6195 ) ) ( not ( = ?auto_6190 ?auto_6195 ) ) ( not ( = ?auto_6196 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6195 ) ) ( TRUCK-AT ?auto_6197 ?auto_6192 ) )
    :subtasks
    ( ( !DRIVE ?auto_6197 ?auto_6192 ?auto_6191 )
      ( MAKE-2CRATE ?auto_6203 ?auto_6188 ?auto_6189 )
      ( MAKE-1CRATE-VERIFY ?auto_6188 ?auto_6189 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6204 - SURFACE
      ?auto_6205 - SURFACE
      ?auto_6206 - SURFACE
    )
    :vars
    (
      ?auto_6218 - HOIST
      ?auto_6211 - PLACE
      ?auto_6216 - PLACE
      ?auto_6209 - HOIST
      ?auto_6215 - SURFACE
      ?auto_6219 - PLACE
      ?auto_6212 - HOIST
      ?auto_6207 - SURFACE
      ?auto_6208 - SURFACE
      ?auto_6213 - PLACE
      ?auto_6217 - HOIST
      ?auto_6214 - SURFACE
      ?auto_6210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6218 ?auto_6211 ) ( IS-CRATE ?auto_6206 ) ( not ( = ?auto_6205 ?auto_6206 ) ) ( not ( = ?auto_6204 ?auto_6205 ) ) ( not ( = ?auto_6204 ?auto_6206 ) ) ( not ( = ?auto_6216 ?auto_6211 ) ) ( HOIST-AT ?auto_6209 ?auto_6216 ) ( not ( = ?auto_6218 ?auto_6209 ) ) ( AVAILABLE ?auto_6209 ) ( SURFACE-AT ?auto_6206 ?auto_6216 ) ( ON ?auto_6206 ?auto_6215 ) ( CLEAR ?auto_6206 ) ( not ( = ?auto_6205 ?auto_6215 ) ) ( not ( = ?auto_6206 ?auto_6215 ) ) ( not ( = ?auto_6204 ?auto_6215 ) ) ( IS-CRATE ?auto_6205 ) ( not ( = ?auto_6219 ?auto_6211 ) ) ( not ( = ?auto_6216 ?auto_6219 ) ) ( HOIST-AT ?auto_6212 ?auto_6219 ) ( not ( = ?auto_6218 ?auto_6212 ) ) ( not ( = ?auto_6209 ?auto_6212 ) ) ( AVAILABLE ?auto_6212 ) ( SURFACE-AT ?auto_6205 ?auto_6219 ) ( ON ?auto_6205 ?auto_6207 ) ( CLEAR ?auto_6205 ) ( not ( = ?auto_6205 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6204 ?auto_6207 ) ) ( not ( = ?auto_6215 ?auto_6207 ) ) ( SURFACE-AT ?auto_6208 ?auto_6211 ) ( CLEAR ?auto_6208 ) ( IS-CRATE ?auto_6204 ) ( not ( = ?auto_6208 ?auto_6204 ) ) ( not ( = ?auto_6205 ?auto_6208 ) ) ( not ( = ?auto_6206 ?auto_6208 ) ) ( not ( = ?auto_6215 ?auto_6208 ) ) ( not ( = ?auto_6207 ?auto_6208 ) ) ( AVAILABLE ?auto_6218 ) ( not ( = ?auto_6213 ?auto_6211 ) ) ( not ( = ?auto_6216 ?auto_6213 ) ) ( not ( = ?auto_6219 ?auto_6213 ) ) ( HOIST-AT ?auto_6217 ?auto_6213 ) ( not ( = ?auto_6218 ?auto_6217 ) ) ( not ( = ?auto_6209 ?auto_6217 ) ) ( not ( = ?auto_6212 ?auto_6217 ) ) ( AVAILABLE ?auto_6217 ) ( SURFACE-AT ?auto_6204 ?auto_6213 ) ( ON ?auto_6204 ?auto_6214 ) ( CLEAR ?auto_6204 ) ( not ( = ?auto_6205 ?auto_6214 ) ) ( not ( = ?auto_6206 ?auto_6214 ) ) ( not ( = ?auto_6204 ?auto_6214 ) ) ( not ( = ?auto_6215 ?auto_6214 ) ) ( not ( = ?auto_6207 ?auto_6214 ) ) ( not ( = ?auto_6208 ?auto_6214 ) ) ( TRUCK-AT ?auto_6210 ?auto_6211 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6205 ?auto_6206 )
      ( MAKE-2CRATE-VERIFY ?auto_6204 ?auto_6205 ?auto_6206 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6220 - SURFACE
      ?auto_6221 - SURFACE
      ?auto_6222 - SURFACE
      ?auto_6223 - SURFACE
    )
    :vars
    (
      ?auto_6224 - HOIST
      ?auto_6235 - PLACE
      ?auto_6226 - PLACE
      ?auto_6228 - HOIST
      ?auto_6229 - SURFACE
      ?auto_6227 - PLACE
      ?auto_6225 - HOIST
      ?auto_6232 - SURFACE
      ?auto_6233 - PLACE
      ?auto_6230 - HOIST
      ?auto_6234 - SURFACE
      ?auto_6231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6224 ?auto_6235 ) ( IS-CRATE ?auto_6223 ) ( not ( = ?auto_6222 ?auto_6223 ) ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( not ( = ?auto_6221 ?auto_6223 ) ) ( not ( = ?auto_6226 ?auto_6235 ) ) ( HOIST-AT ?auto_6228 ?auto_6226 ) ( not ( = ?auto_6224 ?auto_6228 ) ) ( AVAILABLE ?auto_6228 ) ( SURFACE-AT ?auto_6223 ?auto_6226 ) ( ON ?auto_6223 ?auto_6229 ) ( CLEAR ?auto_6223 ) ( not ( = ?auto_6222 ?auto_6229 ) ) ( not ( = ?auto_6223 ?auto_6229 ) ) ( not ( = ?auto_6221 ?auto_6229 ) ) ( IS-CRATE ?auto_6222 ) ( not ( = ?auto_6227 ?auto_6235 ) ) ( not ( = ?auto_6226 ?auto_6227 ) ) ( HOIST-AT ?auto_6225 ?auto_6227 ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( not ( = ?auto_6228 ?auto_6225 ) ) ( AVAILABLE ?auto_6225 ) ( SURFACE-AT ?auto_6222 ?auto_6227 ) ( ON ?auto_6222 ?auto_6232 ) ( CLEAR ?auto_6222 ) ( not ( = ?auto_6222 ?auto_6232 ) ) ( not ( = ?auto_6223 ?auto_6232 ) ) ( not ( = ?auto_6221 ?auto_6232 ) ) ( not ( = ?auto_6229 ?auto_6232 ) ) ( SURFACE-AT ?auto_6220 ?auto_6235 ) ( CLEAR ?auto_6220 ) ( IS-CRATE ?auto_6221 ) ( not ( = ?auto_6220 ?auto_6221 ) ) ( not ( = ?auto_6222 ?auto_6220 ) ) ( not ( = ?auto_6223 ?auto_6220 ) ) ( not ( = ?auto_6229 ?auto_6220 ) ) ( not ( = ?auto_6232 ?auto_6220 ) ) ( AVAILABLE ?auto_6224 ) ( not ( = ?auto_6233 ?auto_6235 ) ) ( not ( = ?auto_6226 ?auto_6233 ) ) ( not ( = ?auto_6227 ?auto_6233 ) ) ( HOIST-AT ?auto_6230 ?auto_6233 ) ( not ( = ?auto_6224 ?auto_6230 ) ) ( not ( = ?auto_6228 ?auto_6230 ) ) ( not ( = ?auto_6225 ?auto_6230 ) ) ( AVAILABLE ?auto_6230 ) ( SURFACE-AT ?auto_6221 ?auto_6233 ) ( ON ?auto_6221 ?auto_6234 ) ( CLEAR ?auto_6221 ) ( not ( = ?auto_6222 ?auto_6234 ) ) ( not ( = ?auto_6223 ?auto_6234 ) ) ( not ( = ?auto_6221 ?auto_6234 ) ) ( not ( = ?auto_6229 ?auto_6234 ) ) ( not ( = ?auto_6232 ?auto_6234 ) ) ( not ( = ?auto_6220 ?auto_6234 ) ) ( TRUCK-AT ?auto_6231 ?auto_6235 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6221 ?auto_6222 ?auto_6223 )
      ( MAKE-3CRATE-VERIFY ?auto_6220 ?auto_6221 ?auto_6222 ?auto_6223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6250 - SURFACE
      ?auto_6251 - SURFACE
    )
    :vars
    (
      ?auto_6252 - HOIST
      ?auto_6253 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6252 ?auto_6253 ) ( SURFACE-AT ?auto_6250 ?auto_6253 ) ( CLEAR ?auto_6250 ) ( LIFTING ?auto_6252 ?auto_6251 ) ( IS-CRATE ?auto_6251 ) ( not ( = ?auto_6250 ?auto_6251 ) ) )
    :subtasks
    ( ( !DROP ?auto_6252 ?auto_6251 ?auto_6250 ?auto_6253 )
      ( MAKE-1CRATE-VERIFY ?auto_6250 ?auto_6251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6254 - SURFACE
      ?auto_6255 - SURFACE
      ?auto_6256 - SURFACE
    )
    :vars
    (
      ?auto_6258 - HOIST
      ?auto_6257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6258 ?auto_6257 ) ( SURFACE-AT ?auto_6255 ?auto_6257 ) ( CLEAR ?auto_6255 ) ( LIFTING ?auto_6258 ?auto_6256 ) ( IS-CRATE ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( ON ?auto_6255 ?auto_6254 ) ( not ( = ?auto_6254 ?auto_6255 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6255 ?auto_6256 )
      ( MAKE-2CRATE-VERIFY ?auto_6254 ?auto_6255 ?auto_6256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6259 - SURFACE
      ?auto_6260 - SURFACE
      ?auto_6261 - SURFACE
      ?auto_6262 - SURFACE
    )
    :vars
    (
      ?auto_6264 - HOIST
      ?auto_6263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6264 ?auto_6263 ) ( SURFACE-AT ?auto_6261 ?auto_6263 ) ( CLEAR ?auto_6261 ) ( LIFTING ?auto_6264 ?auto_6262 ) ( IS-CRATE ?auto_6262 ) ( not ( = ?auto_6261 ?auto_6262 ) ) ( ON ?auto_6260 ?auto_6259 ) ( ON ?auto_6261 ?auto_6260 ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6262 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6261 ?auto_6262 )
      ( MAKE-3CRATE-VERIFY ?auto_6259 ?auto_6260 ?auto_6261 ?auto_6262 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6265 - SURFACE
      ?auto_6266 - SURFACE
      ?auto_6267 - SURFACE
      ?auto_6268 - SURFACE
      ?auto_6269 - SURFACE
    )
    :vars
    (
      ?auto_6271 - HOIST
      ?auto_6270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6271 ?auto_6270 ) ( SURFACE-AT ?auto_6268 ?auto_6270 ) ( CLEAR ?auto_6268 ) ( LIFTING ?auto_6271 ?auto_6269 ) ( IS-CRATE ?auto_6269 ) ( not ( = ?auto_6268 ?auto_6269 ) ) ( ON ?auto_6266 ?auto_6265 ) ( ON ?auto_6267 ?auto_6266 ) ( ON ?auto_6268 ?auto_6267 ) ( not ( = ?auto_6265 ?auto_6266 ) ) ( not ( = ?auto_6265 ?auto_6267 ) ) ( not ( = ?auto_6265 ?auto_6268 ) ) ( not ( = ?auto_6265 ?auto_6269 ) ) ( not ( = ?auto_6266 ?auto_6267 ) ) ( not ( = ?auto_6266 ?auto_6268 ) ) ( not ( = ?auto_6266 ?auto_6269 ) ) ( not ( = ?auto_6267 ?auto_6268 ) ) ( not ( = ?auto_6267 ?auto_6269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6268 ?auto_6269 )
      ( MAKE-4CRATE-VERIFY ?auto_6265 ?auto_6266 ?auto_6267 ?auto_6268 ?auto_6269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6272 - SURFACE
      ?auto_6273 - SURFACE
    )
    :vars
    (
      ?auto_6275 - HOIST
      ?auto_6274 - PLACE
      ?auto_6276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6275 ?auto_6274 ) ( SURFACE-AT ?auto_6272 ?auto_6274 ) ( CLEAR ?auto_6272 ) ( IS-CRATE ?auto_6273 ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( TRUCK-AT ?auto_6276 ?auto_6274 ) ( AVAILABLE ?auto_6275 ) ( IN ?auto_6273 ?auto_6276 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6275 ?auto_6273 ?auto_6276 ?auto_6274 )
      ( MAKE-1CRATE ?auto_6272 ?auto_6273 )
      ( MAKE-1CRATE-VERIFY ?auto_6272 ?auto_6273 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6277 - SURFACE
      ?auto_6278 - SURFACE
      ?auto_6279 - SURFACE
    )
    :vars
    (
      ?auto_6281 - HOIST
      ?auto_6282 - PLACE
      ?auto_6280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6281 ?auto_6282 ) ( SURFACE-AT ?auto_6278 ?auto_6282 ) ( CLEAR ?auto_6278 ) ( IS-CRATE ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( TRUCK-AT ?auto_6280 ?auto_6282 ) ( AVAILABLE ?auto_6281 ) ( IN ?auto_6279 ?auto_6280 ) ( ON ?auto_6278 ?auto_6277 ) ( not ( = ?auto_6277 ?auto_6278 ) ) ( not ( = ?auto_6277 ?auto_6279 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6278 ?auto_6279 )
      ( MAKE-2CRATE-VERIFY ?auto_6277 ?auto_6278 ?auto_6279 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6283 - SURFACE
      ?auto_6284 - SURFACE
      ?auto_6285 - SURFACE
      ?auto_6286 - SURFACE
    )
    :vars
    (
      ?auto_6289 - HOIST
      ?auto_6287 - PLACE
      ?auto_6288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6289 ?auto_6287 ) ( SURFACE-AT ?auto_6285 ?auto_6287 ) ( CLEAR ?auto_6285 ) ( IS-CRATE ?auto_6286 ) ( not ( = ?auto_6285 ?auto_6286 ) ) ( TRUCK-AT ?auto_6288 ?auto_6287 ) ( AVAILABLE ?auto_6289 ) ( IN ?auto_6286 ?auto_6288 ) ( ON ?auto_6285 ?auto_6284 ) ( not ( = ?auto_6284 ?auto_6285 ) ) ( not ( = ?auto_6284 ?auto_6286 ) ) ( ON ?auto_6284 ?auto_6283 ) ( not ( = ?auto_6283 ?auto_6284 ) ) ( not ( = ?auto_6283 ?auto_6285 ) ) ( not ( = ?auto_6283 ?auto_6286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6284 ?auto_6285 ?auto_6286 )
      ( MAKE-3CRATE-VERIFY ?auto_6283 ?auto_6284 ?auto_6285 ?auto_6286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6290 - SURFACE
      ?auto_6291 - SURFACE
      ?auto_6292 - SURFACE
      ?auto_6293 - SURFACE
      ?auto_6294 - SURFACE
    )
    :vars
    (
      ?auto_6297 - HOIST
      ?auto_6295 - PLACE
      ?auto_6296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6297 ?auto_6295 ) ( SURFACE-AT ?auto_6293 ?auto_6295 ) ( CLEAR ?auto_6293 ) ( IS-CRATE ?auto_6294 ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( TRUCK-AT ?auto_6296 ?auto_6295 ) ( AVAILABLE ?auto_6297 ) ( IN ?auto_6294 ?auto_6296 ) ( ON ?auto_6293 ?auto_6292 ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( ON ?auto_6291 ?auto_6290 ) ( ON ?auto_6292 ?auto_6291 ) ( not ( = ?auto_6290 ?auto_6291 ) ) ( not ( = ?auto_6290 ?auto_6292 ) ) ( not ( = ?auto_6290 ?auto_6293 ) ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6292 ?auto_6293 ?auto_6294 )
      ( MAKE-4CRATE-VERIFY ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ?auto_6294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6298 - SURFACE
      ?auto_6299 - SURFACE
    )
    :vars
    (
      ?auto_6302 - HOIST
      ?auto_6300 - PLACE
      ?auto_6301 - TRUCK
      ?auto_6303 - SURFACE
      ?auto_6304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6302 ?auto_6300 ) ( SURFACE-AT ?auto_6298 ?auto_6300 ) ( CLEAR ?auto_6298 ) ( IS-CRATE ?auto_6299 ) ( not ( = ?auto_6298 ?auto_6299 ) ) ( AVAILABLE ?auto_6302 ) ( IN ?auto_6299 ?auto_6301 ) ( ON ?auto_6298 ?auto_6303 ) ( not ( = ?auto_6303 ?auto_6298 ) ) ( not ( = ?auto_6303 ?auto_6299 ) ) ( TRUCK-AT ?auto_6301 ?auto_6304 ) ( not ( = ?auto_6304 ?auto_6300 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6301 ?auto_6304 ?auto_6300 )
      ( MAKE-2CRATE ?auto_6303 ?auto_6298 ?auto_6299 )
      ( MAKE-1CRATE-VERIFY ?auto_6298 ?auto_6299 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6305 - SURFACE
      ?auto_6306 - SURFACE
      ?auto_6307 - SURFACE
    )
    :vars
    (
      ?auto_6309 - HOIST
      ?auto_6311 - PLACE
      ?auto_6308 - TRUCK
      ?auto_6310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6309 ?auto_6311 ) ( SURFACE-AT ?auto_6306 ?auto_6311 ) ( CLEAR ?auto_6306 ) ( IS-CRATE ?auto_6307 ) ( not ( = ?auto_6306 ?auto_6307 ) ) ( AVAILABLE ?auto_6309 ) ( IN ?auto_6307 ?auto_6308 ) ( ON ?auto_6306 ?auto_6305 ) ( not ( = ?auto_6305 ?auto_6306 ) ) ( not ( = ?auto_6305 ?auto_6307 ) ) ( TRUCK-AT ?auto_6308 ?auto_6310 ) ( not ( = ?auto_6310 ?auto_6311 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6306 ?auto_6307 )
      ( MAKE-2CRATE-VERIFY ?auto_6305 ?auto_6306 ?auto_6307 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6312 - SURFACE
      ?auto_6313 - SURFACE
      ?auto_6314 - SURFACE
      ?auto_6315 - SURFACE
    )
    :vars
    (
      ?auto_6317 - HOIST
      ?auto_6316 - PLACE
      ?auto_6319 - TRUCK
      ?auto_6318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6317 ?auto_6316 ) ( SURFACE-AT ?auto_6314 ?auto_6316 ) ( CLEAR ?auto_6314 ) ( IS-CRATE ?auto_6315 ) ( not ( = ?auto_6314 ?auto_6315 ) ) ( AVAILABLE ?auto_6317 ) ( IN ?auto_6315 ?auto_6319 ) ( ON ?auto_6314 ?auto_6313 ) ( not ( = ?auto_6313 ?auto_6314 ) ) ( not ( = ?auto_6313 ?auto_6315 ) ) ( TRUCK-AT ?auto_6319 ?auto_6318 ) ( not ( = ?auto_6318 ?auto_6316 ) ) ( ON ?auto_6313 ?auto_6312 ) ( not ( = ?auto_6312 ?auto_6313 ) ) ( not ( = ?auto_6312 ?auto_6314 ) ) ( not ( = ?auto_6312 ?auto_6315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6313 ?auto_6314 ?auto_6315 )
      ( MAKE-3CRATE-VERIFY ?auto_6312 ?auto_6313 ?auto_6314 ?auto_6315 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6320 - SURFACE
      ?auto_6321 - SURFACE
      ?auto_6322 - SURFACE
      ?auto_6323 - SURFACE
      ?auto_6324 - SURFACE
    )
    :vars
    (
      ?auto_6326 - HOIST
      ?auto_6325 - PLACE
      ?auto_6328 - TRUCK
      ?auto_6327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6326 ?auto_6325 ) ( SURFACE-AT ?auto_6323 ?auto_6325 ) ( CLEAR ?auto_6323 ) ( IS-CRATE ?auto_6324 ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( AVAILABLE ?auto_6326 ) ( IN ?auto_6324 ?auto_6328 ) ( ON ?auto_6323 ?auto_6322 ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( TRUCK-AT ?auto_6328 ?auto_6327 ) ( not ( = ?auto_6327 ?auto_6325 ) ) ( ON ?auto_6321 ?auto_6320 ) ( ON ?auto_6322 ?auto_6321 ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( not ( = ?auto_6320 ?auto_6322 ) ) ( not ( = ?auto_6320 ?auto_6323 ) ) ( not ( = ?auto_6320 ?auto_6324 ) ) ( not ( = ?auto_6321 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6323 ) ) ( not ( = ?auto_6321 ?auto_6324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6322 ?auto_6323 ?auto_6324 )
      ( MAKE-4CRATE-VERIFY ?auto_6320 ?auto_6321 ?auto_6322 ?auto_6323 ?auto_6324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6329 - SURFACE
      ?auto_6330 - SURFACE
    )
    :vars
    (
      ?auto_6332 - HOIST
      ?auto_6331 - PLACE
      ?auto_6335 - SURFACE
      ?auto_6334 - TRUCK
      ?auto_6333 - PLACE
      ?auto_6336 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6332 ?auto_6331 ) ( SURFACE-AT ?auto_6329 ?auto_6331 ) ( CLEAR ?auto_6329 ) ( IS-CRATE ?auto_6330 ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( AVAILABLE ?auto_6332 ) ( ON ?auto_6329 ?auto_6335 ) ( not ( = ?auto_6335 ?auto_6329 ) ) ( not ( = ?auto_6335 ?auto_6330 ) ) ( TRUCK-AT ?auto_6334 ?auto_6333 ) ( not ( = ?auto_6333 ?auto_6331 ) ) ( HOIST-AT ?auto_6336 ?auto_6333 ) ( LIFTING ?auto_6336 ?auto_6330 ) ( not ( = ?auto_6332 ?auto_6336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6336 ?auto_6330 ?auto_6334 ?auto_6333 )
      ( MAKE-2CRATE ?auto_6335 ?auto_6329 ?auto_6330 )
      ( MAKE-1CRATE-VERIFY ?auto_6329 ?auto_6330 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6337 - SURFACE
      ?auto_6338 - SURFACE
      ?auto_6339 - SURFACE
    )
    :vars
    (
      ?auto_6344 - HOIST
      ?auto_6340 - PLACE
      ?auto_6341 - TRUCK
      ?auto_6342 - PLACE
      ?auto_6343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6344 ?auto_6340 ) ( SURFACE-AT ?auto_6338 ?auto_6340 ) ( CLEAR ?auto_6338 ) ( IS-CRATE ?auto_6339 ) ( not ( = ?auto_6338 ?auto_6339 ) ) ( AVAILABLE ?auto_6344 ) ( ON ?auto_6338 ?auto_6337 ) ( not ( = ?auto_6337 ?auto_6338 ) ) ( not ( = ?auto_6337 ?auto_6339 ) ) ( TRUCK-AT ?auto_6341 ?auto_6342 ) ( not ( = ?auto_6342 ?auto_6340 ) ) ( HOIST-AT ?auto_6343 ?auto_6342 ) ( LIFTING ?auto_6343 ?auto_6339 ) ( not ( = ?auto_6344 ?auto_6343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6338 ?auto_6339 )
      ( MAKE-2CRATE-VERIFY ?auto_6337 ?auto_6338 ?auto_6339 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6345 - SURFACE
      ?auto_6346 - SURFACE
      ?auto_6347 - SURFACE
      ?auto_6348 - SURFACE
    )
    :vars
    (
      ?auto_6350 - HOIST
      ?auto_6349 - PLACE
      ?auto_6353 - TRUCK
      ?auto_6351 - PLACE
      ?auto_6352 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6350 ?auto_6349 ) ( SURFACE-AT ?auto_6347 ?auto_6349 ) ( CLEAR ?auto_6347 ) ( IS-CRATE ?auto_6348 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( AVAILABLE ?auto_6350 ) ( ON ?auto_6347 ?auto_6346 ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( TRUCK-AT ?auto_6353 ?auto_6351 ) ( not ( = ?auto_6351 ?auto_6349 ) ) ( HOIST-AT ?auto_6352 ?auto_6351 ) ( LIFTING ?auto_6352 ?auto_6348 ) ( not ( = ?auto_6350 ?auto_6352 ) ) ( ON ?auto_6346 ?auto_6345 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6345 ?auto_6348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6346 ?auto_6347 ?auto_6348 )
      ( MAKE-3CRATE-VERIFY ?auto_6345 ?auto_6346 ?auto_6347 ?auto_6348 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6354 - SURFACE
      ?auto_6355 - SURFACE
      ?auto_6356 - SURFACE
      ?auto_6357 - SURFACE
      ?auto_6358 - SURFACE
    )
    :vars
    (
      ?auto_6360 - HOIST
      ?auto_6359 - PLACE
      ?auto_6363 - TRUCK
      ?auto_6361 - PLACE
      ?auto_6362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6360 ?auto_6359 ) ( SURFACE-AT ?auto_6357 ?auto_6359 ) ( CLEAR ?auto_6357 ) ( IS-CRATE ?auto_6358 ) ( not ( = ?auto_6357 ?auto_6358 ) ) ( AVAILABLE ?auto_6360 ) ( ON ?auto_6357 ?auto_6356 ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( not ( = ?auto_6356 ?auto_6358 ) ) ( TRUCK-AT ?auto_6363 ?auto_6361 ) ( not ( = ?auto_6361 ?auto_6359 ) ) ( HOIST-AT ?auto_6362 ?auto_6361 ) ( LIFTING ?auto_6362 ?auto_6358 ) ( not ( = ?auto_6360 ?auto_6362 ) ) ( ON ?auto_6355 ?auto_6354 ) ( ON ?auto_6356 ?auto_6355 ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( not ( = ?auto_6354 ?auto_6356 ) ) ( not ( = ?auto_6354 ?auto_6357 ) ) ( not ( = ?auto_6354 ?auto_6358 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( not ( = ?auto_6355 ?auto_6357 ) ) ( not ( = ?auto_6355 ?auto_6358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6356 ?auto_6357 ?auto_6358 )
      ( MAKE-4CRATE-VERIFY ?auto_6354 ?auto_6355 ?auto_6356 ?auto_6357 ?auto_6358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6364 - SURFACE
      ?auto_6365 - SURFACE
    )
    :vars
    (
      ?auto_6367 - HOIST
      ?auto_6366 - PLACE
      ?auto_6371 - SURFACE
      ?auto_6370 - TRUCK
      ?auto_6368 - PLACE
      ?auto_6369 - HOIST
      ?auto_6372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6367 ?auto_6366 ) ( SURFACE-AT ?auto_6364 ?auto_6366 ) ( CLEAR ?auto_6364 ) ( IS-CRATE ?auto_6365 ) ( not ( = ?auto_6364 ?auto_6365 ) ) ( AVAILABLE ?auto_6367 ) ( ON ?auto_6364 ?auto_6371 ) ( not ( = ?auto_6371 ?auto_6364 ) ) ( not ( = ?auto_6371 ?auto_6365 ) ) ( TRUCK-AT ?auto_6370 ?auto_6368 ) ( not ( = ?auto_6368 ?auto_6366 ) ) ( HOIST-AT ?auto_6369 ?auto_6368 ) ( not ( = ?auto_6367 ?auto_6369 ) ) ( AVAILABLE ?auto_6369 ) ( SURFACE-AT ?auto_6365 ?auto_6368 ) ( ON ?auto_6365 ?auto_6372 ) ( CLEAR ?auto_6365 ) ( not ( = ?auto_6364 ?auto_6372 ) ) ( not ( = ?auto_6365 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6372 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6369 ?auto_6365 ?auto_6372 ?auto_6368 )
      ( MAKE-2CRATE ?auto_6371 ?auto_6364 ?auto_6365 )
      ( MAKE-1CRATE-VERIFY ?auto_6364 ?auto_6365 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6373 - SURFACE
      ?auto_6374 - SURFACE
      ?auto_6375 - SURFACE
    )
    :vars
    (
      ?auto_6378 - HOIST
      ?auto_6376 - PLACE
      ?auto_6380 - TRUCK
      ?auto_6381 - PLACE
      ?auto_6379 - HOIST
      ?auto_6377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6378 ?auto_6376 ) ( SURFACE-AT ?auto_6374 ?auto_6376 ) ( CLEAR ?auto_6374 ) ( IS-CRATE ?auto_6375 ) ( not ( = ?auto_6374 ?auto_6375 ) ) ( AVAILABLE ?auto_6378 ) ( ON ?auto_6374 ?auto_6373 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( TRUCK-AT ?auto_6380 ?auto_6381 ) ( not ( = ?auto_6381 ?auto_6376 ) ) ( HOIST-AT ?auto_6379 ?auto_6381 ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( AVAILABLE ?auto_6379 ) ( SURFACE-AT ?auto_6375 ?auto_6381 ) ( ON ?auto_6375 ?auto_6377 ) ( CLEAR ?auto_6375 ) ( not ( = ?auto_6374 ?auto_6377 ) ) ( not ( = ?auto_6375 ?auto_6377 ) ) ( not ( = ?auto_6373 ?auto_6377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6374 ?auto_6375 )
      ( MAKE-2CRATE-VERIFY ?auto_6373 ?auto_6374 ?auto_6375 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6382 - SURFACE
      ?auto_6383 - SURFACE
      ?auto_6384 - SURFACE
      ?auto_6385 - SURFACE
    )
    :vars
    (
      ?auto_6390 - HOIST
      ?auto_6389 - PLACE
      ?auto_6387 - TRUCK
      ?auto_6391 - PLACE
      ?auto_6388 - HOIST
      ?auto_6386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6390 ?auto_6389 ) ( SURFACE-AT ?auto_6384 ?auto_6389 ) ( CLEAR ?auto_6384 ) ( IS-CRATE ?auto_6385 ) ( not ( = ?auto_6384 ?auto_6385 ) ) ( AVAILABLE ?auto_6390 ) ( ON ?auto_6384 ?auto_6383 ) ( not ( = ?auto_6383 ?auto_6384 ) ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( TRUCK-AT ?auto_6387 ?auto_6391 ) ( not ( = ?auto_6391 ?auto_6389 ) ) ( HOIST-AT ?auto_6388 ?auto_6391 ) ( not ( = ?auto_6390 ?auto_6388 ) ) ( AVAILABLE ?auto_6388 ) ( SURFACE-AT ?auto_6385 ?auto_6391 ) ( ON ?auto_6385 ?auto_6386 ) ( CLEAR ?auto_6385 ) ( not ( = ?auto_6384 ?auto_6386 ) ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( ON ?auto_6383 ?auto_6382 ) ( not ( = ?auto_6382 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( not ( = ?auto_6382 ?auto_6385 ) ) ( not ( = ?auto_6382 ?auto_6386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6383 ?auto_6384 ?auto_6385 )
      ( MAKE-3CRATE-VERIFY ?auto_6382 ?auto_6383 ?auto_6384 ?auto_6385 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6392 - SURFACE
      ?auto_6393 - SURFACE
      ?auto_6394 - SURFACE
      ?auto_6395 - SURFACE
      ?auto_6396 - SURFACE
    )
    :vars
    (
      ?auto_6401 - HOIST
      ?auto_6400 - PLACE
      ?auto_6398 - TRUCK
      ?auto_6402 - PLACE
      ?auto_6399 - HOIST
      ?auto_6397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6401 ?auto_6400 ) ( SURFACE-AT ?auto_6395 ?auto_6400 ) ( CLEAR ?auto_6395 ) ( IS-CRATE ?auto_6396 ) ( not ( = ?auto_6395 ?auto_6396 ) ) ( AVAILABLE ?auto_6401 ) ( ON ?auto_6395 ?auto_6394 ) ( not ( = ?auto_6394 ?auto_6395 ) ) ( not ( = ?auto_6394 ?auto_6396 ) ) ( TRUCK-AT ?auto_6398 ?auto_6402 ) ( not ( = ?auto_6402 ?auto_6400 ) ) ( HOIST-AT ?auto_6399 ?auto_6402 ) ( not ( = ?auto_6401 ?auto_6399 ) ) ( AVAILABLE ?auto_6399 ) ( SURFACE-AT ?auto_6396 ?auto_6402 ) ( ON ?auto_6396 ?auto_6397 ) ( CLEAR ?auto_6396 ) ( not ( = ?auto_6395 ?auto_6397 ) ) ( not ( = ?auto_6396 ?auto_6397 ) ) ( not ( = ?auto_6394 ?auto_6397 ) ) ( ON ?auto_6393 ?auto_6392 ) ( ON ?auto_6394 ?auto_6393 ) ( not ( = ?auto_6392 ?auto_6393 ) ) ( not ( = ?auto_6392 ?auto_6394 ) ) ( not ( = ?auto_6392 ?auto_6395 ) ) ( not ( = ?auto_6392 ?auto_6396 ) ) ( not ( = ?auto_6392 ?auto_6397 ) ) ( not ( = ?auto_6393 ?auto_6394 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6393 ?auto_6396 ) ) ( not ( = ?auto_6393 ?auto_6397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6394 ?auto_6395 ?auto_6396 )
      ( MAKE-4CRATE-VERIFY ?auto_6392 ?auto_6393 ?auto_6394 ?auto_6395 ?auto_6396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6403 - SURFACE
      ?auto_6404 - SURFACE
    )
    :vars
    (
      ?auto_6409 - HOIST
      ?auto_6408 - PLACE
      ?auto_6411 - SURFACE
      ?auto_6410 - PLACE
      ?auto_6407 - HOIST
      ?auto_6405 - SURFACE
      ?auto_6406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6409 ?auto_6408 ) ( SURFACE-AT ?auto_6403 ?auto_6408 ) ( CLEAR ?auto_6403 ) ( IS-CRATE ?auto_6404 ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( AVAILABLE ?auto_6409 ) ( ON ?auto_6403 ?auto_6411 ) ( not ( = ?auto_6411 ?auto_6403 ) ) ( not ( = ?auto_6411 ?auto_6404 ) ) ( not ( = ?auto_6410 ?auto_6408 ) ) ( HOIST-AT ?auto_6407 ?auto_6410 ) ( not ( = ?auto_6409 ?auto_6407 ) ) ( AVAILABLE ?auto_6407 ) ( SURFACE-AT ?auto_6404 ?auto_6410 ) ( ON ?auto_6404 ?auto_6405 ) ( CLEAR ?auto_6404 ) ( not ( = ?auto_6403 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( not ( = ?auto_6411 ?auto_6405 ) ) ( TRUCK-AT ?auto_6406 ?auto_6408 ) )
    :subtasks
    ( ( !DRIVE ?auto_6406 ?auto_6408 ?auto_6410 )
      ( MAKE-2CRATE ?auto_6411 ?auto_6403 ?auto_6404 )
      ( MAKE-1CRATE-VERIFY ?auto_6403 ?auto_6404 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6412 - SURFACE
      ?auto_6413 - SURFACE
      ?auto_6414 - SURFACE
    )
    :vars
    (
      ?auto_6415 - HOIST
      ?auto_6420 - PLACE
      ?auto_6417 - PLACE
      ?auto_6416 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6415 ?auto_6420 ) ( SURFACE-AT ?auto_6413 ?auto_6420 ) ( CLEAR ?auto_6413 ) ( IS-CRATE ?auto_6414 ) ( not ( = ?auto_6413 ?auto_6414 ) ) ( AVAILABLE ?auto_6415 ) ( ON ?auto_6413 ?auto_6412 ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6414 ) ) ( not ( = ?auto_6417 ?auto_6420 ) ) ( HOIST-AT ?auto_6416 ?auto_6417 ) ( not ( = ?auto_6415 ?auto_6416 ) ) ( AVAILABLE ?auto_6416 ) ( SURFACE-AT ?auto_6414 ?auto_6417 ) ( ON ?auto_6414 ?auto_6418 ) ( CLEAR ?auto_6414 ) ( not ( = ?auto_6413 ?auto_6418 ) ) ( not ( = ?auto_6414 ?auto_6418 ) ) ( not ( = ?auto_6412 ?auto_6418 ) ) ( TRUCK-AT ?auto_6419 ?auto_6420 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6413 ?auto_6414 )
      ( MAKE-2CRATE-VERIFY ?auto_6412 ?auto_6413 ?auto_6414 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6421 - SURFACE
      ?auto_6422 - SURFACE
      ?auto_6423 - SURFACE
      ?auto_6424 - SURFACE
    )
    :vars
    (
      ?auto_6427 - HOIST
      ?auto_6429 - PLACE
      ?auto_6430 - PLACE
      ?auto_6428 - HOIST
      ?auto_6426 - SURFACE
      ?auto_6425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6427 ?auto_6429 ) ( SURFACE-AT ?auto_6423 ?auto_6429 ) ( CLEAR ?auto_6423 ) ( IS-CRATE ?auto_6424 ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( AVAILABLE ?auto_6427 ) ( ON ?auto_6423 ?auto_6422 ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6424 ) ) ( not ( = ?auto_6430 ?auto_6429 ) ) ( HOIST-AT ?auto_6428 ?auto_6430 ) ( not ( = ?auto_6427 ?auto_6428 ) ) ( AVAILABLE ?auto_6428 ) ( SURFACE-AT ?auto_6424 ?auto_6430 ) ( ON ?auto_6424 ?auto_6426 ) ( CLEAR ?auto_6424 ) ( not ( = ?auto_6423 ?auto_6426 ) ) ( not ( = ?auto_6424 ?auto_6426 ) ) ( not ( = ?auto_6422 ?auto_6426 ) ) ( TRUCK-AT ?auto_6425 ?auto_6429 ) ( ON ?auto_6422 ?auto_6421 ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6424 ) ) ( not ( = ?auto_6421 ?auto_6426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6422 ?auto_6423 ?auto_6424 )
      ( MAKE-3CRATE-VERIFY ?auto_6421 ?auto_6422 ?auto_6423 ?auto_6424 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6431 - SURFACE
      ?auto_6432 - SURFACE
      ?auto_6433 - SURFACE
      ?auto_6434 - SURFACE
      ?auto_6435 - SURFACE
    )
    :vars
    (
      ?auto_6438 - HOIST
      ?auto_6440 - PLACE
      ?auto_6441 - PLACE
      ?auto_6439 - HOIST
      ?auto_6437 - SURFACE
      ?auto_6436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6438 ?auto_6440 ) ( SURFACE-AT ?auto_6434 ?auto_6440 ) ( CLEAR ?auto_6434 ) ( IS-CRATE ?auto_6435 ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( AVAILABLE ?auto_6438 ) ( ON ?auto_6434 ?auto_6433 ) ( not ( = ?auto_6433 ?auto_6434 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6441 ?auto_6440 ) ) ( HOIST-AT ?auto_6439 ?auto_6441 ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( AVAILABLE ?auto_6439 ) ( SURFACE-AT ?auto_6435 ?auto_6441 ) ( ON ?auto_6435 ?auto_6437 ) ( CLEAR ?auto_6435 ) ( not ( = ?auto_6434 ?auto_6437 ) ) ( not ( = ?auto_6435 ?auto_6437 ) ) ( not ( = ?auto_6433 ?auto_6437 ) ) ( TRUCK-AT ?auto_6436 ?auto_6440 ) ( ON ?auto_6432 ?auto_6431 ) ( ON ?auto_6433 ?auto_6432 ) ( not ( = ?auto_6431 ?auto_6432 ) ) ( not ( = ?auto_6431 ?auto_6433 ) ) ( not ( = ?auto_6431 ?auto_6434 ) ) ( not ( = ?auto_6431 ?auto_6435 ) ) ( not ( = ?auto_6431 ?auto_6437 ) ) ( not ( = ?auto_6432 ?auto_6433 ) ) ( not ( = ?auto_6432 ?auto_6434 ) ) ( not ( = ?auto_6432 ?auto_6435 ) ) ( not ( = ?auto_6432 ?auto_6437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6433 ?auto_6434 ?auto_6435 )
      ( MAKE-4CRATE-VERIFY ?auto_6431 ?auto_6432 ?auto_6433 ?auto_6434 ?auto_6435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6442 - SURFACE
      ?auto_6443 - SURFACE
    )
    :vars
    (
      ?auto_6446 - HOIST
      ?auto_6448 - PLACE
      ?auto_6450 - SURFACE
      ?auto_6449 - PLACE
      ?auto_6447 - HOIST
      ?auto_6445 - SURFACE
      ?auto_6444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6446 ?auto_6448 ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6450 ?auto_6442 ) ) ( not ( = ?auto_6450 ?auto_6443 ) ) ( not ( = ?auto_6449 ?auto_6448 ) ) ( HOIST-AT ?auto_6447 ?auto_6449 ) ( not ( = ?auto_6446 ?auto_6447 ) ) ( AVAILABLE ?auto_6447 ) ( SURFACE-AT ?auto_6443 ?auto_6449 ) ( ON ?auto_6443 ?auto_6445 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6450 ?auto_6445 ) ) ( TRUCK-AT ?auto_6444 ?auto_6448 ) ( SURFACE-AT ?auto_6450 ?auto_6448 ) ( CLEAR ?auto_6450 ) ( LIFTING ?auto_6446 ?auto_6442 ) ( IS-CRATE ?auto_6442 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6450 ?auto_6442 )
      ( MAKE-2CRATE ?auto_6450 ?auto_6442 ?auto_6443 )
      ( MAKE-1CRATE-VERIFY ?auto_6442 ?auto_6443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6451 - SURFACE
      ?auto_6452 - SURFACE
      ?auto_6453 - SURFACE
    )
    :vars
    (
      ?auto_6457 - HOIST
      ?auto_6456 - PLACE
      ?auto_6454 - PLACE
      ?auto_6455 - HOIST
      ?auto_6458 - SURFACE
      ?auto_6459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6457 ?auto_6456 ) ( IS-CRATE ?auto_6453 ) ( not ( = ?auto_6452 ?auto_6453 ) ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( not ( = ?auto_6451 ?auto_6453 ) ) ( not ( = ?auto_6454 ?auto_6456 ) ) ( HOIST-AT ?auto_6455 ?auto_6454 ) ( not ( = ?auto_6457 ?auto_6455 ) ) ( AVAILABLE ?auto_6455 ) ( SURFACE-AT ?auto_6453 ?auto_6454 ) ( ON ?auto_6453 ?auto_6458 ) ( CLEAR ?auto_6453 ) ( not ( = ?auto_6452 ?auto_6458 ) ) ( not ( = ?auto_6453 ?auto_6458 ) ) ( not ( = ?auto_6451 ?auto_6458 ) ) ( TRUCK-AT ?auto_6459 ?auto_6456 ) ( SURFACE-AT ?auto_6451 ?auto_6456 ) ( CLEAR ?auto_6451 ) ( LIFTING ?auto_6457 ?auto_6452 ) ( IS-CRATE ?auto_6452 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6452 ?auto_6453 )
      ( MAKE-2CRATE-VERIFY ?auto_6451 ?auto_6452 ?auto_6453 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6460 - SURFACE
      ?auto_6461 - SURFACE
      ?auto_6462 - SURFACE
      ?auto_6463 - SURFACE
    )
    :vars
    (
      ?auto_6469 - HOIST
      ?auto_6467 - PLACE
      ?auto_6464 - PLACE
      ?auto_6466 - HOIST
      ?auto_6468 - SURFACE
      ?auto_6465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6469 ?auto_6467 ) ( IS-CRATE ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6464 ?auto_6467 ) ) ( HOIST-AT ?auto_6466 ?auto_6464 ) ( not ( = ?auto_6469 ?auto_6466 ) ) ( AVAILABLE ?auto_6466 ) ( SURFACE-AT ?auto_6463 ?auto_6464 ) ( ON ?auto_6463 ?auto_6468 ) ( CLEAR ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6468 ) ) ( not ( = ?auto_6463 ?auto_6468 ) ) ( not ( = ?auto_6461 ?auto_6468 ) ) ( TRUCK-AT ?auto_6465 ?auto_6467 ) ( SURFACE-AT ?auto_6461 ?auto_6467 ) ( CLEAR ?auto_6461 ) ( LIFTING ?auto_6469 ?auto_6462 ) ( IS-CRATE ?auto_6462 ) ( ON ?auto_6461 ?auto_6460 ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( not ( = ?auto_6460 ?auto_6463 ) ) ( not ( = ?auto_6460 ?auto_6468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6461 ?auto_6462 ?auto_6463 )
      ( MAKE-3CRATE-VERIFY ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6470 - SURFACE
      ?auto_6471 - SURFACE
      ?auto_6472 - SURFACE
      ?auto_6473 - SURFACE
      ?auto_6474 - SURFACE
    )
    :vars
    (
      ?auto_6480 - HOIST
      ?auto_6478 - PLACE
      ?auto_6475 - PLACE
      ?auto_6477 - HOIST
      ?auto_6479 - SURFACE
      ?auto_6476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6480 ?auto_6478 ) ( IS-CRATE ?auto_6474 ) ( not ( = ?auto_6473 ?auto_6474 ) ) ( not ( = ?auto_6472 ?auto_6473 ) ) ( not ( = ?auto_6472 ?auto_6474 ) ) ( not ( = ?auto_6475 ?auto_6478 ) ) ( HOIST-AT ?auto_6477 ?auto_6475 ) ( not ( = ?auto_6480 ?auto_6477 ) ) ( AVAILABLE ?auto_6477 ) ( SURFACE-AT ?auto_6474 ?auto_6475 ) ( ON ?auto_6474 ?auto_6479 ) ( CLEAR ?auto_6474 ) ( not ( = ?auto_6473 ?auto_6479 ) ) ( not ( = ?auto_6474 ?auto_6479 ) ) ( not ( = ?auto_6472 ?auto_6479 ) ) ( TRUCK-AT ?auto_6476 ?auto_6478 ) ( SURFACE-AT ?auto_6472 ?auto_6478 ) ( CLEAR ?auto_6472 ) ( LIFTING ?auto_6480 ?auto_6473 ) ( IS-CRATE ?auto_6473 ) ( ON ?auto_6471 ?auto_6470 ) ( ON ?auto_6472 ?auto_6471 ) ( not ( = ?auto_6470 ?auto_6471 ) ) ( not ( = ?auto_6470 ?auto_6472 ) ) ( not ( = ?auto_6470 ?auto_6473 ) ) ( not ( = ?auto_6470 ?auto_6474 ) ) ( not ( = ?auto_6470 ?auto_6479 ) ) ( not ( = ?auto_6471 ?auto_6472 ) ) ( not ( = ?auto_6471 ?auto_6473 ) ) ( not ( = ?auto_6471 ?auto_6474 ) ) ( not ( = ?auto_6471 ?auto_6479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6472 ?auto_6473 ?auto_6474 )
      ( MAKE-4CRATE-VERIFY ?auto_6470 ?auto_6471 ?auto_6472 ?auto_6473 ?auto_6474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6481 - SURFACE
      ?auto_6482 - SURFACE
    )
    :vars
    (
      ?auto_6488 - HOIST
      ?auto_6486 - PLACE
      ?auto_6489 - SURFACE
      ?auto_6483 - PLACE
      ?auto_6485 - HOIST
      ?auto_6487 - SURFACE
      ?auto_6484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6488 ?auto_6486 ) ( IS-CRATE ?auto_6482 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6489 ?auto_6481 ) ) ( not ( = ?auto_6489 ?auto_6482 ) ) ( not ( = ?auto_6483 ?auto_6486 ) ) ( HOIST-AT ?auto_6485 ?auto_6483 ) ( not ( = ?auto_6488 ?auto_6485 ) ) ( AVAILABLE ?auto_6485 ) ( SURFACE-AT ?auto_6482 ?auto_6483 ) ( ON ?auto_6482 ?auto_6487 ) ( CLEAR ?auto_6482 ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6489 ?auto_6487 ) ) ( TRUCK-AT ?auto_6484 ?auto_6486 ) ( SURFACE-AT ?auto_6489 ?auto_6486 ) ( CLEAR ?auto_6489 ) ( IS-CRATE ?auto_6481 ) ( AVAILABLE ?auto_6488 ) ( IN ?auto_6481 ?auto_6484 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6488 ?auto_6481 ?auto_6484 ?auto_6486 )
      ( MAKE-2CRATE ?auto_6489 ?auto_6481 ?auto_6482 )
      ( MAKE-1CRATE-VERIFY ?auto_6481 ?auto_6482 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6490 - SURFACE
      ?auto_6491 - SURFACE
      ?auto_6492 - SURFACE
    )
    :vars
    (
      ?auto_6495 - HOIST
      ?auto_6493 - PLACE
      ?auto_6496 - PLACE
      ?auto_6498 - HOIST
      ?auto_6494 - SURFACE
      ?auto_6497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6495 ?auto_6493 ) ( IS-CRATE ?auto_6492 ) ( not ( = ?auto_6491 ?auto_6492 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6492 ) ) ( not ( = ?auto_6496 ?auto_6493 ) ) ( HOIST-AT ?auto_6498 ?auto_6496 ) ( not ( = ?auto_6495 ?auto_6498 ) ) ( AVAILABLE ?auto_6498 ) ( SURFACE-AT ?auto_6492 ?auto_6496 ) ( ON ?auto_6492 ?auto_6494 ) ( CLEAR ?auto_6492 ) ( not ( = ?auto_6491 ?auto_6494 ) ) ( not ( = ?auto_6492 ?auto_6494 ) ) ( not ( = ?auto_6490 ?auto_6494 ) ) ( TRUCK-AT ?auto_6497 ?auto_6493 ) ( SURFACE-AT ?auto_6490 ?auto_6493 ) ( CLEAR ?auto_6490 ) ( IS-CRATE ?auto_6491 ) ( AVAILABLE ?auto_6495 ) ( IN ?auto_6491 ?auto_6497 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6491 ?auto_6492 )
      ( MAKE-2CRATE-VERIFY ?auto_6490 ?auto_6491 ?auto_6492 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6499 - SURFACE
      ?auto_6500 - SURFACE
      ?auto_6501 - SURFACE
      ?auto_6502 - SURFACE
    )
    :vars
    (
      ?auto_6503 - HOIST
      ?auto_6504 - PLACE
      ?auto_6508 - PLACE
      ?auto_6505 - HOIST
      ?auto_6507 - SURFACE
      ?auto_6506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6503 ?auto_6504 ) ( IS-CRATE ?auto_6502 ) ( not ( = ?auto_6501 ?auto_6502 ) ) ( not ( = ?auto_6500 ?auto_6501 ) ) ( not ( = ?auto_6500 ?auto_6502 ) ) ( not ( = ?auto_6508 ?auto_6504 ) ) ( HOIST-AT ?auto_6505 ?auto_6508 ) ( not ( = ?auto_6503 ?auto_6505 ) ) ( AVAILABLE ?auto_6505 ) ( SURFACE-AT ?auto_6502 ?auto_6508 ) ( ON ?auto_6502 ?auto_6507 ) ( CLEAR ?auto_6502 ) ( not ( = ?auto_6501 ?auto_6507 ) ) ( not ( = ?auto_6502 ?auto_6507 ) ) ( not ( = ?auto_6500 ?auto_6507 ) ) ( TRUCK-AT ?auto_6506 ?auto_6504 ) ( SURFACE-AT ?auto_6500 ?auto_6504 ) ( CLEAR ?auto_6500 ) ( IS-CRATE ?auto_6501 ) ( AVAILABLE ?auto_6503 ) ( IN ?auto_6501 ?auto_6506 ) ( ON ?auto_6500 ?auto_6499 ) ( not ( = ?auto_6499 ?auto_6500 ) ) ( not ( = ?auto_6499 ?auto_6501 ) ) ( not ( = ?auto_6499 ?auto_6502 ) ) ( not ( = ?auto_6499 ?auto_6507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6500 ?auto_6501 ?auto_6502 )
      ( MAKE-3CRATE-VERIFY ?auto_6499 ?auto_6500 ?auto_6501 ?auto_6502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6509 - SURFACE
      ?auto_6510 - SURFACE
      ?auto_6511 - SURFACE
      ?auto_6512 - SURFACE
      ?auto_6513 - SURFACE
    )
    :vars
    (
      ?auto_6514 - HOIST
      ?auto_6515 - PLACE
      ?auto_6519 - PLACE
      ?auto_6516 - HOIST
      ?auto_6518 - SURFACE
      ?auto_6517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6514 ?auto_6515 ) ( IS-CRATE ?auto_6513 ) ( not ( = ?auto_6512 ?auto_6513 ) ) ( not ( = ?auto_6511 ?auto_6512 ) ) ( not ( = ?auto_6511 ?auto_6513 ) ) ( not ( = ?auto_6519 ?auto_6515 ) ) ( HOIST-AT ?auto_6516 ?auto_6519 ) ( not ( = ?auto_6514 ?auto_6516 ) ) ( AVAILABLE ?auto_6516 ) ( SURFACE-AT ?auto_6513 ?auto_6519 ) ( ON ?auto_6513 ?auto_6518 ) ( CLEAR ?auto_6513 ) ( not ( = ?auto_6512 ?auto_6518 ) ) ( not ( = ?auto_6513 ?auto_6518 ) ) ( not ( = ?auto_6511 ?auto_6518 ) ) ( TRUCK-AT ?auto_6517 ?auto_6515 ) ( SURFACE-AT ?auto_6511 ?auto_6515 ) ( CLEAR ?auto_6511 ) ( IS-CRATE ?auto_6512 ) ( AVAILABLE ?auto_6514 ) ( IN ?auto_6512 ?auto_6517 ) ( ON ?auto_6510 ?auto_6509 ) ( ON ?auto_6511 ?auto_6510 ) ( not ( = ?auto_6509 ?auto_6510 ) ) ( not ( = ?auto_6509 ?auto_6511 ) ) ( not ( = ?auto_6509 ?auto_6512 ) ) ( not ( = ?auto_6509 ?auto_6513 ) ) ( not ( = ?auto_6509 ?auto_6518 ) ) ( not ( = ?auto_6510 ?auto_6511 ) ) ( not ( = ?auto_6510 ?auto_6512 ) ) ( not ( = ?auto_6510 ?auto_6513 ) ) ( not ( = ?auto_6510 ?auto_6518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6511 ?auto_6512 ?auto_6513 )
      ( MAKE-4CRATE-VERIFY ?auto_6509 ?auto_6510 ?auto_6511 ?auto_6512 ?auto_6513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6520 - SURFACE
      ?auto_6521 - SURFACE
    )
    :vars
    (
      ?auto_6522 - HOIST
      ?auto_6523 - PLACE
      ?auto_6528 - SURFACE
      ?auto_6527 - PLACE
      ?auto_6524 - HOIST
      ?auto_6526 - SURFACE
      ?auto_6525 - TRUCK
      ?auto_6529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6522 ?auto_6523 ) ( IS-CRATE ?auto_6521 ) ( not ( = ?auto_6520 ?auto_6521 ) ) ( not ( = ?auto_6528 ?auto_6520 ) ) ( not ( = ?auto_6528 ?auto_6521 ) ) ( not ( = ?auto_6527 ?auto_6523 ) ) ( HOIST-AT ?auto_6524 ?auto_6527 ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( AVAILABLE ?auto_6524 ) ( SURFACE-AT ?auto_6521 ?auto_6527 ) ( ON ?auto_6521 ?auto_6526 ) ( CLEAR ?auto_6521 ) ( not ( = ?auto_6520 ?auto_6526 ) ) ( not ( = ?auto_6521 ?auto_6526 ) ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( SURFACE-AT ?auto_6528 ?auto_6523 ) ( CLEAR ?auto_6528 ) ( IS-CRATE ?auto_6520 ) ( AVAILABLE ?auto_6522 ) ( IN ?auto_6520 ?auto_6525 ) ( TRUCK-AT ?auto_6525 ?auto_6529 ) ( not ( = ?auto_6529 ?auto_6523 ) ) ( not ( = ?auto_6527 ?auto_6529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6525 ?auto_6529 ?auto_6523 )
      ( MAKE-2CRATE ?auto_6528 ?auto_6520 ?auto_6521 )
      ( MAKE-1CRATE-VERIFY ?auto_6520 ?auto_6521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6530 - SURFACE
      ?auto_6531 - SURFACE
      ?auto_6532 - SURFACE
    )
    :vars
    (
      ?auto_6539 - HOIST
      ?auto_6536 - PLACE
      ?auto_6534 - PLACE
      ?auto_6533 - HOIST
      ?auto_6535 - SURFACE
      ?auto_6537 - TRUCK
      ?auto_6538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6539 ?auto_6536 ) ( IS-CRATE ?auto_6532 ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6531 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( not ( = ?auto_6534 ?auto_6536 ) ) ( HOIST-AT ?auto_6533 ?auto_6534 ) ( not ( = ?auto_6539 ?auto_6533 ) ) ( AVAILABLE ?auto_6533 ) ( SURFACE-AT ?auto_6532 ?auto_6534 ) ( ON ?auto_6532 ?auto_6535 ) ( CLEAR ?auto_6532 ) ( not ( = ?auto_6531 ?auto_6535 ) ) ( not ( = ?auto_6532 ?auto_6535 ) ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( SURFACE-AT ?auto_6530 ?auto_6536 ) ( CLEAR ?auto_6530 ) ( IS-CRATE ?auto_6531 ) ( AVAILABLE ?auto_6539 ) ( IN ?auto_6531 ?auto_6537 ) ( TRUCK-AT ?auto_6537 ?auto_6538 ) ( not ( = ?auto_6538 ?auto_6536 ) ) ( not ( = ?auto_6534 ?auto_6538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6531 ?auto_6532 )
      ( MAKE-2CRATE-VERIFY ?auto_6530 ?auto_6531 ?auto_6532 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6540 - SURFACE
      ?auto_6541 - SURFACE
      ?auto_6542 - SURFACE
      ?auto_6543 - SURFACE
    )
    :vars
    (
      ?auto_6545 - HOIST
      ?auto_6547 - PLACE
      ?auto_6546 - PLACE
      ?auto_6544 - HOIST
      ?auto_6549 - SURFACE
      ?auto_6550 - TRUCK
      ?auto_6548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6545 ?auto_6547 ) ( IS-CRATE ?auto_6543 ) ( not ( = ?auto_6542 ?auto_6543 ) ) ( not ( = ?auto_6541 ?auto_6542 ) ) ( not ( = ?auto_6541 ?auto_6543 ) ) ( not ( = ?auto_6546 ?auto_6547 ) ) ( HOIST-AT ?auto_6544 ?auto_6546 ) ( not ( = ?auto_6545 ?auto_6544 ) ) ( AVAILABLE ?auto_6544 ) ( SURFACE-AT ?auto_6543 ?auto_6546 ) ( ON ?auto_6543 ?auto_6549 ) ( CLEAR ?auto_6543 ) ( not ( = ?auto_6542 ?auto_6549 ) ) ( not ( = ?auto_6543 ?auto_6549 ) ) ( not ( = ?auto_6541 ?auto_6549 ) ) ( SURFACE-AT ?auto_6541 ?auto_6547 ) ( CLEAR ?auto_6541 ) ( IS-CRATE ?auto_6542 ) ( AVAILABLE ?auto_6545 ) ( IN ?auto_6542 ?auto_6550 ) ( TRUCK-AT ?auto_6550 ?auto_6548 ) ( not ( = ?auto_6548 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6548 ) ) ( ON ?auto_6541 ?auto_6540 ) ( not ( = ?auto_6540 ?auto_6541 ) ) ( not ( = ?auto_6540 ?auto_6542 ) ) ( not ( = ?auto_6540 ?auto_6543 ) ) ( not ( = ?auto_6540 ?auto_6549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6541 ?auto_6542 ?auto_6543 )
      ( MAKE-3CRATE-VERIFY ?auto_6540 ?auto_6541 ?auto_6542 ?auto_6543 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6551 - SURFACE
      ?auto_6552 - SURFACE
      ?auto_6553 - SURFACE
      ?auto_6554 - SURFACE
      ?auto_6555 - SURFACE
    )
    :vars
    (
      ?auto_6557 - HOIST
      ?auto_6559 - PLACE
      ?auto_6558 - PLACE
      ?auto_6556 - HOIST
      ?auto_6561 - SURFACE
      ?auto_6562 - TRUCK
      ?auto_6560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6557 ?auto_6559 ) ( IS-CRATE ?auto_6555 ) ( not ( = ?auto_6554 ?auto_6555 ) ) ( not ( = ?auto_6553 ?auto_6554 ) ) ( not ( = ?auto_6553 ?auto_6555 ) ) ( not ( = ?auto_6558 ?auto_6559 ) ) ( HOIST-AT ?auto_6556 ?auto_6558 ) ( not ( = ?auto_6557 ?auto_6556 ) ) ( AVAILABLE ?auto_6556 ) ( SURFACE-AT ?auto_6555 ?auto_6558 ) ( ON ?auto_6555 ?auto_6561 ) ( CLEAR ?auto_6555 ) ( not ( = ?auto_6554 ?auto_6561 ) ) ( not ( = ?auto_6555 ?auto_6561 ) ) ( not ( = ?auto_6553 ?auto_6561 ) ) ( SURFACE-AT ?auto_6553 ?auto_6559 ) ( CLEAR ?auto_6553 ) ( IS-CRATE ?auto_6554 ) ( AVAILABLE ?auto_6557 ) ( IN ?auto_6554 ?auto_6562 ) ( TRUCK-AT ?auto_6562 ?auto_6560 ) ( not ( = ?auto_6560 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6560 ) ) ( ON ?auto_6552 ?auto_6551 ) ( ON ?auto_6553 ?auto_6552 ) ( not ( = ?auto_6551 ?auto_6552 ) ) ( not ( = ?auto_6551 ?auto_6553 ) ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( not ( = ?auto_6551 ?auto_6555 ) ) ( not ( = ?auto_6551 ?auto_6561 ) ) ( not ( = ?auto_6552 ?auto_6553 ) ) ( not ( = ?auto_6552 ?auto_6554 ) ) ( not ( = ?auto_6552 ?auto_6555 ) ) ( not ( = ?auto_6552 ?auto_6561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6553 ?auto_6554 ?auto_6555 )
      ( MAKE-4CRATE-VERIFY ?auto_6551 ?auto_6552 ?auto_6553 ?auto_6554 ?auto_6555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6563 - SURFACE
      ?auto_6564 - SURFACE
    )
    :vars
    (
      ?auto_6566 - HOIST
      ?auto_6568 - PLACE
      ?auto_6572 - SURFACE
      ?auto_6567 - PLACE
      ?auto_6565 - HOIST
      ?auto_6570 - SURFACE
      ?auto_6571 - TRUCK
      ?auto_6569 - PLACE
      ?auto_6573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6566 ?auto_6568 ) ( IS-CRATE ?auto_6564 ) ( not ( = ?auto_6563 ?auto_6564 ) ) ( not ( = ?auto_6572 ?auto_6563 ) ) ( not ( = ?auto_6572 ?auto_6564 ) ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( HOIST-AT ?auto_6565 ?auto_6567 ) ( not ( = ?auto_6566 ?auto_6565 ) ) ( AVAILABLE ?auto_6565 ) ( SURFACE-AT ?auto_6564 ?auto_6567 ) ( ON ?auto_6564 ?auto_6570 ) ( CLEAR ?auto_6564 ) ( not ( = ?auto_6563 ?auto_6570 ) ) ( not ( = ?auto_6564 ?auto_6570 ) ) ( not ( = ?auto_6572 ?auto_6570 ) ) ( SURFACE-AT ?auto_6572 ?auto_6568 ) ( CLEAR ?auto_6572 ) ( IS-CRATE ?auto_6563 ) ( AVAILABLE ?auto_6566 ) ( TRUCK-AT ?auto_6571 ?auto_6569 ) ( not ( = ?auto_6569 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( HOIST-AT ?auto_6573 ?auto_6569 ) ( LIFTING ?auto_6573 ?auto_6563 ) ( not ( = ?auto_6566 ?auto_6573 ) ) ( not ( = ?auto_6565 ?auto_6573 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6573 ?auto_6563 ?auto_6571 ?auto_6569 )
      ( MAKE-2CRATE ?auto_6572 ?auto_6563 ?auto_6564 )
      ( MAKE-1CRATE-VERIFY ?auto_6563 ?auto_6564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6574 - SURFACE
      ?auto_6575 - SURFACE
      ?auto_6576 - SURFACE
    )
    :vars
    (
      ?auto_6584 - HOIST
      ?auto_6577 - PLACE
      ?auto_6581 - PLACE
      ?auto_6578 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6579 - TRUCK
      ?auto_6580 - PLACE
      ?auto_6583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6584 ?auto_6577 ) ( IS-CRATE ?auto_6576 ) ( not ( = ?auto_6575 ?auto_6576 ) ) ( not ( = ?auto_6574 ?auto_6575 ) ) ( not ( = ?auto_6574 ?auto_6576 ) ) ( not ( = ?auto_6581 ?auto_6577 ) ) ( HOIST-AT ?auto_6578 ?auto_6581 ) ( not ( = ?auto_6584 ?auto_6578 ) ) ( AVAILABLE ?auto_6578 ) ( SURFACE-AT ?auto_6576 ?auto_6581 ) ( ON ?auto_6576 ?auto_6582 ) ( CLEAR ?auto_6576 ) ( not ( = ?auto_6575 ?auto_6582 ) ) ( not ( = ?auto_6576 ?auto_6582 ) ) ( not ( = ?auto_6574 ?auto_6582 ) ) ( SURFACE-AT ?auto_6574 ?auto_6577 ) ( CLEAR ?auto_6574 ) ( IS-CRATE ?auto_6575 ) ( AVAILABLE ?auto_6584 ) ( TRUCK-AT ?auto_6579 ?auto_6580 ) ( not ( = ?auto_6580 ?auto_6577 ) ) ( not ( = ?auto_6581 ?auto_6580 ) ) ( HOIST-AT ?auto_6583 ?auto_6580 ) ( LIFTING ?auto_6583 ?auto_6575 ) ( not ( = ?auto_6584 ?auto_6583 ) ) ( not ( = ?auto_6578 ?auto_6583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6575 ?auto_6576 )
      ( MAKE-2CRATE-VERIFY ?auto_6574 ?auto_6575 ?auto_6576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6585 - SURFACE
      ?auto_6586 - SURFACE
      ?auto_6587 - SURFACE
      ?auto_6588 - SURFACE
    )
    :vars
    (
      ?auto_6590 - HOIST
      ?auto_6594 - PLACE
      ?auto_6595 - PLACE
      ?auto_6591 - HOIST
      ?auto_6589 - SURFACE
      ?auto_6593 - TRUCK
      ?auto_6596 - PLACE
      ?auto_6592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6590 ?auto_6594 ) ( IS-CRATE ?auto_6588 ) ( not ( = ?auto_6587 ?auto_6588 ) ) ( not ( = ?auto_6586 ?auto_6587 ) ) ( not ( = ?auto_6586 ?auto_6588 ) ) ( not ( = ?auto_6595 ?auto_6594 ) ) ( HOIST-AT ?auto_6591 ?auto_6595 ) ( not ( = ?auto_6590 ?auto_6591 ) ) ( AVAILABLE ?auto_6591 ) ( SURFACE-AT ?auto_6588 ?auto_6595 ) ( ON ?auto_6588 ?auto_6589 ) ( CLEAR ?auto_6588 ) ( not ( = ?auto_6587 ?auto_6589 ) ) ( not ( = ?auto_6588 ?auto_6589 ) ) ( not ( = ?auto_6586 ?auto_6589 ) ) ( SURFACE-AT ?auto_6586 ?auto_6594 ) ( CLEAR ?auto_6586 ) ( IS-CRATE ?auto_6587 ) ( AVAILABLE ?auto_6590 ) ( TRUCK-AT ?auto_6593 ?auto_6596 ) ( not ( = ?auto_6596 ?auto_6594 ) ) ( not ( = ?auto_6595 ?auto_6596 ) ) ( HOIST-AT ?auto_6592 ?auto_6596 ) ( LIFTING ?auto_6592 ?auto_6587 ) ( not ( = ?auto_6590 ?auto_6592 ) ) ( not ( = ?auto_6591 ?auto_6592 ) ) ( ON ?auto_6586 ?auto_6585 ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( not ( = ?auto_6585 ?auto_6587 ) ) ( not ( = ?auto_6585 ?auto_6588 ) ) ( not ( = ?auto_6585 ?auto_6589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6586 ?auto_6587 ?auto_6588 )
      ( MAKE-3CRATE-VERIFY ?auto_6585 ?auto_6586 ?auto_6587 ?auto_6588 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6597 - SURFACE
      ?auto_6598 - SURFACE
      ?auto_6599 - SURFACE
      ?auto_6600 - SURFACE
      ?auto_6601 - SURFACE
    )
    :vars
    (
      ?auto_6603 - HOIST
      ?auto_6607 - PLACE
      ?auto_6608 - PLACE
      ?auto_6604 - HOIST
      ?auto_6602 - SURFACE
      ?auto_6606 - TRUCK
      ?auto_6609 - PLACE
      ?auto_6605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6603 ?auto_6607 ) ( IS-CRATE ?auto_6601 ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6599 ?auto_6600 ) ) ( not ( = ?auto_6599 ?auto_6601 ) ) ( not ( = ?auto_6608 ?auto_6607 ) ) ( HOIST-AT ?auto_6604 ?auto_6608 ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( AVAILABLE ?auto_6604 ) ( SURFACE-AT ?auto_6601 ?auto_6608 ) ( ON ?auto_6601 ?auto_6602 ) ( CLEAR ?auto_6601 ) ( not ( = ?auto_6600 ?auto_6602 ) ) ( not ( = ?auto_6601 ?auto_6602 ) ) ( not ( = ?auto_6599 ?auto_6602 ) ) ( SURFACE-AT ?auto_6599 ?auto_6607 ) ( CLEAR ?auto_6599 ) ( IS-CRATE ?auto_6600 ) ( AVAILABLE ?auto_6603 ) ( TRUCK-AT ?auto_6606 ?auto_6609 ) ( not ( = ?auto_6609 ?auto_6607 ) ) ( not ( = ?auto_6608 ?auto_6609 ) ) ( HOIST-AT ?auto_6605 ?auto_6609 ) ( LIFTING ?auto_6605 ?auto_6600 ) ( not ( = ?auto_6603 ?auto_6605 ) ) ( not ( = ?auto_6604 ?auto_6605 ) ) ( ON ?auto_6598 ?auto_6597 ) ( ON ?auto_6599 ?auto_6598 ) ( not ( = ?auto_6597 ?auto_6598 ) ) ( not ( = ?auto_6597 ?auto_6599 ) ) ( not ( = ?auto_6597 ?auto_6600 ) ) ( not ( = ?auto_6597 ?auto_6601 ) ) ( not ( = ?auto_6597 ?auto_6602 ) ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6600 ) ) ( not ( = ?auto_6598 ?auto_6601 ) ) ( not ( = ?auto_6598 ?auto_6602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6599 ?auto_6600 ?auto_6601 )
      ( MAKE-4CRATE-VERIFY ?auto_6597 ?auto_6598 ?auto_6599 ?auto_6600 ?auto_6601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6610 - SURFACE
      ?auto_6611 - SURFACE
    )
    :vars
    (
      ?auto_6613 - HOIST
      ?auto_6617 - PLACE
      ?auto_6620 - SURFACE
      ?auto_6618 - PLACE
      ?auto_6614 - HOIST
      ?auto_6612 - SURFACE
      ?auto_6616 - TRUCK
      ?auto_6619 - PLACE
      ?auto_6615 - HOIST
      ?auto_6621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6613 ?auto_6617 ) ( IS-CRATE ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( not ( = ?auto_6620 ?auto_6610 ) ) ( not ( = ?auto_6620 ?auto_6611 ) ) ( not ( = ?auto_6618 ?auto_6617 ) ) ( HOIST-AT ?auto_6614 ?auto_6618 ) ( not ( = ?auto_6613 ?auto_6614 ) ) ( AVAILABLE ?auto_6614 ) ( SURFACE-AT ?auto_6611 ?auto_6618 ) ( ON ?auto_6611 ?auto_6612 ) ( CLEAR ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6612 ) ) ( not ( = ?auto_6611 ?auto_6612 ) ) ( not ( = ?auto_6620 ?auto_6612 ) ) ( SURFACE-AT ?auto_6620 ?auto_6617 ) ( CLEAR ?auto_6620 ) ( IS-CRATE ?auto_6610 ) ( AVAILABLE ?auto_6613 ) ( TRUCK-AT ?auto_6616 ?auto_6619 ) ( not ( = ?auto_6619 ?auto_6617 ) ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( HOIST-AT ?auto_6615 ?auto_6619 ) ( not ( = ?auto_6613 ?auto_6615 ) ) ( not ( = ?auto_6614 ?auto_6615 ) ) ( AVAILABLE ?auto_6615 ) ( SURFACE-AT ?auto_6610 ?auto_6619 ) ( ON ?auto_6610 ?auto_6621 ) ( CLEAR ?auto_6610 ) ( not ( = ?auto_6610 ?auto_6621 ) ) ( not ( = ?auto_6611 ?auto_6621 ) ) ( not ( = ?auto_6620 ?auto_6621 ) ) ( not ( = ?auto_6612 ?auto_6621 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6615 ?auto_6610 ?auto_6621 ?auto_6619 )
      ( MAKE-2CRATE ?auto_6620 ?auto_6610 ?auto_6611 )
      ( MAKE-1CRATE-VERIFY ?auto_6610 ?auto_6611 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6622 - SURFACE
      ?auto_6623 - SURFACE
      ?auto_6624 - SURFACE
    )
    :vars
    (
      ?auto_6631 - HOIST
      ?auto_6625 - PLACE
      ?auto_6626 - PLACE
      ?auto_6632 - HOIST
      ?auto_6633 - SURFACE
      ?auto_6627 - TRUCK
      ?auto_6628 - PLACE
      ?auto_6629 - HOIST
      ?auto_6630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6631 ?auto_6625 ) ( IS-CRATE ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6626 ?auto_6625 ) ) ( HOIST-AT ?auto_6632 ?auto_6626 ) ( not ( = ?auto_6631 ?auto_6632 ) ) ( AVAILABLE ?auto_6632 ) ( SURFACE-AT ?auto_6624 ?auto_6626 ) ( ON ?auto_6624 ?auto_6633 ) ( CLEAR ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6633 ) ) ( not ( = ?auto_6624 ?auto_6633 ) ) ( not ( = ?auto_6622 ?auto_6633 ) ) ( SURFACE-AT ?auto_6622 ?auto_6625 ) ( CLEAR ?auto_6622 ) ( IS-CRATE ?auto_6623 ) ( AVAILABLE ?auto_6631 ) ( TRUCK-AT ?auto_6627 ?auto_6628 ) ( not ( = ?auto_6628 ?auto_6625 ) ) ( not ( = ?auto_6626 ?auto_6628 ) ) ( HOIST-AT ?auto_6629 ?auto_6628 ) ( not ( = ?auto_6631 ?auto_6629 ) ) ( not ( = ?auto_6632 ?auto_6629 ) ) ( AVAILABLE ?auto_6629 ) ( SURFACE-AT ?auto_6623 ?auto_6628 ) ( ON ?auto_6623 ?auto_6630 ) ( CLEAR ?auto_6623 ) ( not ( = ?auto_6623 ?auto_6630 ) ) ( not ( = ?auto_6624 ?auto_6630 ) ) ( not ( = ?auto_6622 ?auto_6630 ) ) ( not ( = ?auto_6633 ?auto_6630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6623 ?auto_6624 )
      ( MAKE-2CRATE-VERIFY ?auto_6622 ?auto_6623 ?auto_6624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6634 - SURFACE
      ?auto_6635 - SURFACE
      ?auto_6636 - SURFACE
      ?auto_6637 - SURFACE
    )
    :vars
    (
      ?auto_6645 - HOIST
      ?auto_6644 - PLACE
      ?auto_6643 - PLACE
      ?auto_6646 - HOIST
      ?auto_6640 - SURFACE
      ?auto_6638 - TRUCK
      ?auto_6641 - PLACE
      ?auto_6642 - HOIST
      ?auto_6639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6645 ?auto_6644 ) ( IS-CRATE ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( HOIST-AT ?auto_6646 ?auto_6643 ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( AVAILABLE ?auto_6646 ) ( SURFACE-AT ?auto_6637 ?auto_6643 ) ( ON ?auto_6637 ?auto_6640 ) ( CLEAR ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6640 ) ) ( not ( = ?auto_6637 ?auto_6640 ) ) ( not ( = ?auto_6635 ?auto_6640 ) ) ( SURFACE-AT ?auto_6635 ?auto_6644 ) ( CLEAR ?auto_6635 ) ( IS-CRATE ?auto_6636 ) ( AVAILABLE ?auto_6645 ) ( TRUCK-AT ?auto_6638 ?auto_6641 ) ( not ( = ?auto_6641 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6641 ) ) ( HOIST-AT ?auto_6642 ?auto_6641 ) ( not ( = ?auto_6645 ?auto_6642 ) ) ( not ( = ?auto_6646 ?auto_6642 ) ) ( AVAILABLE ?auto_6642 ) ( SURFACE-AT ?auto_6636 ?auto_6641 ) ( ON ?auto_6636 ?auto_6639 ) ( CLEAR ?auto_6636 ) ( not ( = ?auto_6636 ?auto_6639 ) ) ( not ( = ?auto_6637 ?auto_6639 ) ) ( not ( = ?auto_6635 ?auto_6639 ) ) ( not ( = ?auto_6640 ?auto_6639 ) ) ( ON ?auto_6635 ?auto_6634 ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6634 ?auto_6637 ) ) ( not ( = ?auto_6634 ?auto_6640 ) ) ( not ( = ?auto_6634 ?auto_6639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6635 ?auto_6636 ?auto_6637 )
      ( MAKE-3CRATE-VERIFY ?auto_6634 ?auto_6635 ?auto_6636 ?auto_6637 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6647 - SURFACE
      ?auto_6648 - SURFACE
      ?auto_6649 - SURFACE
      ?auto_6650 - SURFACE
      ?auto_6651 - SURFACE
    )
    :vars
    (
      ?auto_6659 - HOIST
      ?auto_6658 - PLACE
      ?auto_6657 - PLACE
      ?auto_6660 - HOIST
      ?auto_6654 - SURFACE
      ?auto_6652 - TRUCK
      ?auto_6655 - PLACE
      ?auto_6656 - HOIST
      ?auto_6653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6659 ?auto_6658 ) ( IS-CRATE ?auto_6651 ) ( not ( = ?auto_6650 ?auto_6651 ) ) ( not ( = ?auto_6649 ?auto_6650 ) ) ( not ( = ?auto_6649 ?auto_6651 ) ) ( not ( = ?auto_6657 ?auto_6658 ) ) ( HOIST-AT ?auto_6660 ?auto_6657 ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( AVAILABLE ?auto_6660 ) ( SURFACE-AT ?auto_6651 ?auto_6657 ) ( ON ?auto_6651 ?auto_6654 ) ( CLEAR ?auto_6651 ) ( not ( = ?auto_6650 ?auto_6654 ) ) ( not ( = ?auto_6651 ?auto_6654 ) ) ( not ( = ?auto_6649 ?auto_6654 ) ) ( SURFACE-AT ?auto_6649 ?auto_6658 ) ( CLEAR ?auto_6649 ) ( IS-CRATE ?auto_6650 ) ( AVAILABLE ?auto_6659 ) ( TRUCK-AT ?auto_6652 ?auto_6655 ) ( not ( = ?auto_6655 ?auto_6658 ) ) ( not ( = ?auto_6657 ?auto_6655 ) ) ( HOIST-AT ?auto_6656 ?auto_6655 ) ( not ( = ?auto_6659 ?auto_6656 ) ) ( not ( = ?auto_6660 ?auto_6656 ) ) ( AVAILABLE ?auto_6656 ) ( SURFACE-AT ?auto_6650 ?auto_6655 ) ( ON ?auto_6650 ?auto_6653 ) ( CLEAR ?auto_6650 ) ( not ( = ?auto_6650 ?auto_6653 ) ) ( not ( = ?auto_6651 ?auto_6653 ) ) ( not ( = ?auto_6649 ?auto_6653 ) ) ( not ( = ?auto_6654 ?auto_6653 ) ) ( ON ?auto_6648 ?auto_6647 ) ( ON ?auto_6649 ?auto_6648 ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6649 ) ) ( not ( = ?auto_6647 ?auto_6650 ) ) ( not ( = ?auto_6647 ?auto_6651 ) ) ( not ( = ?auto_6647 ?auto_6654 ) ) ( not ( = ?auto_6647 ?auto_6653 ) ) ( not ( = ?auto_6648 ?auto_6649 ) ) ( not ( = ?auto_6648 ?auto_6650 ) ) ( not ( = ?auto_6648 ?auto_6651 ) ) ( not ( = ?auto_6648 ?auto_6654 ) ) ( not ( = ?auto_6648 ?auto_6653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6649 ?auto_6650 ?auto_6651 )
      ( MAKE-4CRATE-VERIFY ?auto_6647 ?auto_6648 ?auto_6649 ?auto_6650 ?auto_6651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6661 - SURFACE
      ?auto_6662 - SURFACE
    )
    :vars
    (
      ?auto_6670 - HOIST
      ?auto_6669 - PLACE
      ?auto_6672 - SURFACE
      ?auto_6668 - PLACE
      ?auto_6671 - HOIST
      ?auto_6665 - SURFACE
      ?auto_6666 - PLACE
      ?auto_6667 - HOIST
      ?auto_6664 - SURFACE
      ?auto_6663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6670 ?auto_6669 ) ( IS-CRATE ?auto_6662 ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( not ( = ?auto_6672 ?auto_6661 ) ) ( not ( = ?auto_6672 ?auto_6662 ) ) ( not ( = ?auto_6668 ?auto_6669 ) ) ( HOIST-AT ?auto_6671 ?auto_6668 ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( AVAILABLE ?auto_6671 ) ( SURFACE-AT ?auto_6662 ?auto_6668 ) ( ON ?auto_6662 ?auto_6665 ) ( CLEAR ?auto_6662 ) ( not ( = ?auto_6661 ?auto_6665 ) ) ( not ( = ?auto_6662 ?auto_6665 ) ) ( not ( = ?auto_6672 ?auto_6665 ) ) ( SURFACE-AT ?auto_6672 ?auto_6669 ) ( CLEAR ?auto_6672 ) ( IS-CRATE ?auto_6661 ) ( AVAILABLE ?auto_6670 ) ( not ( = ?auto_6666 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6666 ) ) ( HOIST-AT ?auto_6667 ?auto_6666 ) ( not ( = ?auto_6670 ?auto_6667 ) ) ( not ( = ?auto_6671 ?auto_6667 ) ) ( AVAILABLE ?auto_6667 ) ( SURFACE-AT ?auto_6661 ?auto_6666 ) ( ON ?auto_6661 ?auto_6664 ) ( CLEAR ?auto_6661 ) ( not ( = ?auto_6661 ?auto_6664 ) ) ( not ( = ?auto_6662 ?auto_6664 ) ) ( not ( = ?auto_6672 ?auto_6664 ) ) ( not ( = ?auto_6665 ?auto_6664 ) ) ( TRUCK-AT ?auto_6663 ?auto_6669 ) )
    :subtasks
    ( ( !DRIVE ?auto_6663 ?auto_6669 ?auto_6666 )
      ( MAKE-2CRATE ?auto_6672 ?auto_6661 ?auto_6662 )
      ( MAKE-1CRATE-VERIFY ?auto_6661 ?auto_6662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6673 - SURFACE
      ?auto_6674 - SURFACE
      ?auto_6675 - SURFACE
    )
    :vars
    (
      ?auto_6682 - HOIST
      ?auto_6680 - PLACE
      ?auto_6684 - PLACE
      ?auto_6681 - HOIST
      ?auto_6676 - SURFACE
      ?auto_6678 - PLACE
      ?auto_6679 - HOIST
      ?auto_6683 - SURFACE
      ?auto_6677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6682 ?auto_6680 ) ( IS-CRATE ?auto_6675 ) ( not ( = ?auto_6674 ?auto_6675 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6675 ) ) ( not ( = ?auto_6684 ?auto_6680 ) ) ( HOIST-AT ?auto_6681 ?auto_6684 ) ( not ( = ?auto_6682 ?auto_6681 ) ) ( AVAILABLE ?auto_6681 ) ( SURFACE-AT ?auto_6675 ?auto_6684 ) ( ON ?auto_6675 ?auto_6676 ) ( CLEAR ?auto_6675 ) ( not ( = ?auto_6674 ?auto_6676 ) ) ( not ( = ?auto_6675 ?auto_6676 ) ) ( not ( = ?auto_6673 ?auto_6676 ) ) ( SURFACE-AT ?auto_6673 ?auto_6680 ) ( CLEAR ?auto_6673 ) ( IS-CRATE ?auto_6674 ) ( AVAILABLE ?auto_6682 ) ( not ( = ?auto_6678 ?auto_6680 ) ) ( not ( = ?auto_6684 ?auto_6678 ) ) ( HOIST-AT ?auto_6679 ?auto_6678 ) ( not ( = ?auto_6682 ?auto_6679 ) ) ( not ( = ?auto_6681 ?auto_6679 ) ) ( AVAILABLE ?auto_6679 ) ( SURFACE-AT ?auto_6674 ?auto_6678 ) ( ON ?auto_6674 ?auto_6683 ) ( CLEAR ?auto_6674 ) ( not ( = ?auto_6674 ?auto_6683 ) ) ( not ( = ?auto_6675 ?auto_6683 ) ) ( not ( = ?auto_6673 ?auto_6683 ) ) ( not ( = ?auto_6676 ?auto_6683 ) ) ( TRUCK-AT ?auto_6677 ?auto_6680 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6674 ?auto_6675 )
      ( MAKE-2CRATE-VERIFY ?auto_6673 ?auto_6674 ?auto_6675 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6685 - SURFACE
      ?auto_6686 - SURFACE
      ?auto_6687 - SURFACE
      ?auto_6688 - SURFACE
    )
    :vars
    (
      ?auto_6693 - HOIST
      ?auto_6692 - PLACE
      ?auto_6690 - PLACE
      ?auto_6694 - HOIST
      ?auto_6695 - SURFACE
      ?auto_6697 - PLACE
      ?auto_6691 - HOIST
      ?auto_6696 - SURFACE
      ?auto_6689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6693 ?auto_6692 ) ( IS-CRATE ?auto_6688 ) ( not ( = ?auto_6687 ?auto_6688 ) ) ( not ( = ?auto_6686 ?auto_6687 ) ) ( not ( = ?auto_6686 ?auto_6688 ) ) ( not ( = ?auto_6690 ?auto_6692 ) ) ( HOIST-AT ?auto_6694 ?auto_6690 ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( AVAILABLE ?auto_6694 ) ( SURFACE-AT ?auto_6688 ?auto_6690 ) ( ON ?auto_6688 ?auto_6695 ) ( CLEAR ?auto_6688 ) ( not ( = ?auto_6687 ?auto_6695 ) ) ( not ( = ?auto_6688 ?auto_6695 ) ) ( not ( = ?auto_6686 ?auto_6695 ) ) ( SURFACE-AT ?auto_6686 ?auto_6692 ) ( CLEAR ?auto_6686 ) ( IS-CRATE ?auto_6687 ) ( AVAILABLE ?auto_6693 ) ( not ( = ?auto_6697 ?auto_6692 ) ) ( not ( = ?auto_6690 ?auto_6697 ) ) ( HOIST-AT ?auto_6691 ?auto_6697 ) ( not ( = ?auto_6693 ?auto_6691 ) ) ( not ( = ?auto_6694 ?auto_6691 ) ) ( AVAILABLE ?auto_6691 ) ( SURFACE-AT ?auto_6687 ?auto_6697 ) ( ON ?auto_6687 ?auto_6696 ) ( CLEAR ?auto_6687 ) ( not ( = ?auto_6687 ?auto_6696 ) ) ( not ( = ?auto_6688 ?auto_6696 ) ) ( not ( = ?auto_6686 ?auto_6696 ) ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( TRUCK-AT ?auto_6689 ?auto_6692 ) ( ON ?auto_6686 ?auto_6685 ) ( not ( = ?auto_6685 ?auto_6686 ) ) ( not ( = ?auto_6685 ?auto_6687 ) ) ( not ( = ?auto_6685 ?auto_6688 ) ) ( not ( = ?auto_6685 ?auto_6695 ) ) ( not ( = ?auto_6685 ?auto_6696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6686 ?auto_6687 ?auto_6688 )
      ( MAKE-3CRATE-VERIFY ?auto_6685 ?auto_6686 ?auto_6687 ?auto_6688 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6698 - SURFACE
      ?auto_6699 - SURFACE
      ?auto_6700 - SURFACE
      ?auto_6701 - SURFACE
      ?auto_6702 - SURFACE
    )
    :vars
    (
      ?auto_6707 - HOIST
      ?auto_6706 - PLACE
      ?auto_6704 - PLACE
      ?auto_6708 - HOIST
      ?auto_6709 - SURFACE
      ?auto_6711 - PLACE
      ?auto_6705 - HOIST
      ?auto_6710 - SURFACE
      ?auto_6703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6707 ?auto_6706 ) ( IS-CRATE ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6704 ?auto_6706 ) ) ( HOIST-AT ?auto_6708 ?auto_6704 ) ( not ( = ?auto_6707 ?auto_6708 ) ) ( AVAILABLE ?auto_6708 ) ( SURFACE-AT ?auto_6702 ?auto_6704 ) ( ON ?auto_6702 ?auto_6709 ) ( CLEAR ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6709 ) ) ( not ( = ?auto_6702 ?auto_6709 ) ) ( not ( = ?auto_6700 ?auto_6709 ) ) ( SURFACE-AT ?auto_6700 ?auto_6706 ) ( CLEAR ?auto_6700 ) ( IS-CRATE ?auto_6701 ) ( AVAILABLE ?auto_6707 ) ( not ( = ?auto_6711 ?auto_6706 ) ) ( not ( = ?auto_6704 ?auto_6711 ) ) ( HOIST-AT ?auto_6705 ?auto_6711 ) ( not ( = ?auto_6707 ?auto_6705 ) ) ( not ( = ?auto_6708 ?auto_6705 ) ) ( AVAILABLE ?auto_6705 ) ( SURFACE-AT ?auto_6701 ?auto_6711 ) ( ON ?auto_6701 ?auto_6710 ) ( CLEAR ?auto_6701 ) ( not ( = ?auto_6701 ?auto_6710 ) ) ( not ( = ?auto_6702 ?auto_6710 ) ) ( not ( = ?auto_6700 ?auto_6710 ) ) ( not ( = ?auto_6709 ?auto_6710 ) ) ( TRUCK-AT ?auto_6703 ?auto_6706 ) ( ON ?auto_6699 ?auto_6698 ) ( ON ?auto_6700 ?auto_6699 ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( not ( = ?auto_6698 ?auto_6709 ) ) ( not ( = ?auto_6698 ?auto_6710 ) ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6701 ) ) ( not ( = ?auto_6699 ?auto_6702 ) ) ( not ( = ?auto_6699 ?auto_6709 ) ) ( not ( = ?auto_6699 ?auto_6710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6700 ?auto_6701 ?auto_6702 )
      ( MAKE-4CRATE-VERIFY ?auto_6698 ?auto_6699 ?auto_6700 ?auto_6701 ?auto_6702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6712 - SURFACE
      ?auto_6713 - SURFACE
    )
    :vars
    (
      ?auto_6718 - HOIST
      ?auto_6717 - PLACE
      ?auto_6723 - SURFACE
      ?auto_6715 - PLACE
      ?auto_6719 - HOIST
      ?auto_6720 - SURFACE
      ?auto_6722 - PLACE
      ?auto_6716 - HOIST
      ?auto_6721 - SURFACE
      ?auto_6714 - TRUCK
      ?auto_6724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6718 ?auto_6717 ) ( IS-CRATE ?auto_6713 ) ( not ( = ?auto_6712 ?auto_6713 ) ) ( not ( = ?auto_6723 ?auto_6712 ) ) ( not ( = ?auto_6723 ?auto_6713 ) ) ( not ( = ?auto_6715 ?auto_6717 ) ) ( HOIST-AT ?auto_6719 ?auto_6715 ) ( not ( = ?auto_6718 ?auto_6719 ) ) ( AVAILABLE ?auto_6719 ) ( SURFACE-AT ?auto_6713 ?auto_6715 ) ( ON ?auto_6713 ?auto_6720 ) ( CLEAR ?auto_6713 ) ( not ( = ?auto_6712 ?auto_6720 ) ) ( not ( = ?auto_6713 ?auto_6720 ) ) ( not ( = ?auto_6723 ?auto_6720 ) ) ( IS-CRATE ?auto_6712 ) ( not ( = ?auto_6722 ?auto_6717 ) ) ( not ( = ?auto_6715 ?auto_6722 ) ) ( HOIST-AT ?auto_6716 ?auto_6722 ) ( not ( = ?auto_6718 ?auto_6716 ) ) ( not ( = ?auto_6719 ?auto_6716 ) ) ( AVAILABLE ?auto_6716 ) ( SURFACE-AT ?auto_6712 ?auto_6722 ) ( ON ?auto_6712 ?auto_6721 ) ( CLEAR ?auto_6712 ) ( not ( = ?auto_6712 ?auto_6721 ) ) ( not ( = ?auto_6713 ?auto_6721 ) ) ( not ( = ?auto_6723 ?auto_6721 ) ) ( not ( = ?auto_6720 ?auto_6721 ) ) ( TRUCK-AT ?auto_6714 ?auto_6717 ) ( SURFACE-AT ?auto_6724 ?auto_6717 ) ( CLEAR ?auto_6724 ) ( LIFTING ?auto_6718 ?auto_6723 ) ( IS-CRATE ?auto_6723 ) ( not ( = ?auto_6724 ?auto_6723 ) ) ( not ( = ?auto_6712 ?auto_6724 ) ) ( not ( = ?auto_6713 ?auto_6724 ) ) ( not ( = ?auto_6720 ?auto_6724 ) ) ( not ( = ?auto_6721 ?auto_6724 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6724 ?auto_6723 )
      ( MAKE-2CRATE ?auto_6723 ?auto_6712 ?auto_6713 )
      ( MAKE-1CRATE-VERIFY ?auto_6712 ?auto_6713 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6725 - SURFACE
      ?auto_6726 - SURFACE
      ?auto_6727 - SURFACE
    )
    :vars
    (
      ?auto_6733 - HOIST
      ?auto_6735 - PLACE
      ?auto_6736 - PLACE
      ?auto_6728 - HOIST
      ?auto_6730 - SURFACE
      ?auto_6731 - PLACE
      ?auto_6734 - HOIST
      ?auto_6729 - SURFACE
      ?auto_6737 - TRUCK
      ?auto_6732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6733 ?auto_6735 ) ( IS-CRATE ?auto_6727 ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6725 ?auto_6726 ) ) ( not ( = ?auto_6725 ?auto_6727 ) ) ( not ( = ?auto_6736 ?auto_6735 ) ) ( HOIST-AT ?auto_6728 ?auto_6736 ) ( not ( = ?auto_6733 ?auto_6728 ) ) ( AVAILABLE ?auto_6728 ) ( SURFACE-AT ?auto_6727 ?auto_6736 ) ( ON ?auto_6727 ?auto_6730 ) ( CLEAR ?auto_6727 ) ( not ( = ?auto_6726 ?auto_6730 ) ) ( not ( = ?auto_6727 ?auto_6730 ) ) ( not ( = ?auto_6725 ?auto_6730 ) ) ( IS-CRATE ?auto_6726 ) ( not ( = ?auto_6731 ?auto_6735 ) ) ( not ( = ?auto_6736 ?auto_6731 ) ) ( HOIST-AT ?auto_6734 ?auto_6731 ) ( not ( = ?auto_6733 ?auto_6734 ) ) ( not ( = ?auto_6728 ?auto_6734 ) ) ( AVAILABLE ?auto_6734 ) ( SURFACE-AT ?auto_6726 ?auto_6731 ) ( ON ?auto_6726 ?auto_6729 ) ( CLEAR ?auto_6726 ) ( not ( = ?auto_6726 ?auto_6729 ) ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( not ( = ?auto_6725 ?auto_6729 ) ) ( not ( = ?auto_6730 ?auto_6729 ) ) ( TRUCK-AT ?auto_6737 ?auto_6735 ) ( SURFACE-AT ?auto_6732 ?auto_6735 ) ( CLEAR ?auto_6732 ) ( LIFTING ?auto_6733 ?auto_6725 ) ( IS-CRATE ?auto_6725 ) ( not ( = ?auto_6732 ?auto_6725 ) ) ( not ( = ?auto_6726 ?auto_6732 ) ) ( not ( = ?auto_6727 ?auto_6732 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6729 ?auto_6732 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6726 ?auto_6727 )
      ( MAKE-2CRATE-VERIFY ?auto_6725 ?auto_6726 ?auto_6727 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6738 - SURFACE
      ?auto_6739 - SURFACE
      ?auto_6740 - SURFACE
      ?auto_6741 - SURFACE
    )
    :vars
    (
      ?auto_6746 - HOIST
      ?auto_6744 - PLACE
      ?auto_6747 - PLACE
      ?auto_6748 - HOIST
      ?auto_6743 - SURFACE
      ?auto_6742 - PLACE
      ?auto_6750 - HOIST
      ?auto_6749 - SURFACE
      ?auto_6745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6746 ?auto_6744 ) ( IS-CRATE ?auto_6741 ) ( not ( = ?auto_6740 ?auto_6741 ) ) ( not ( = ?auto_6739 ?auto_6740 ) ) ( not ( = ?auto_6739 ?auto_6741 ) ) ( not ( = ?auto_6747 ?auto_6744 ) ) ( HOIST-AT ?auto_6748 ?auto_6747 ) ( not ( = ?auto_6746 ?auto_6748 ) ) ( AVAILABLE ?auto_6748 ) ( SURFACE-AT ?auto_6741 ?auto_6747 ) ( ON ?auto_6741 ?auto_6743 ) ( CLEAR ?auto_6741 ) ( not ( = ?auto_6740 ?auto_6743 ) ) ( not ( = ?auto_6741 ?auto_6743 ) ) ( not ( = ?auto_6739 ?auto_6743 ) ) ( IS-CRATE ?auto_6740 ) ( not ( = ?auto_6742 ?auto_6744 ) ) ( not ( = ?auto_6747 ?auto_6742 ) ) ( HOIST-AT ?auto_6750 ?auto_6742 ) ( not ( = ?auto_6746 ?auto_6750 ) ) ( not ( = ?auto_6748 ?auto_6750 ) ) ( AVAILABLE ?auto_6750 ) ( SURFACE-AT ?auto_6740 ?auto_6742 ) ( ON ?auto_6740 ?auto_6749 ) ( CLEAR ?auto_6740 ) ( not ( = ?auto_6740 ?auto_6749 ) ) ( not ( = ?auto_6741 ?auto_6749 ) ) ( not ( = ?auto_6739 ?auto_6749 ) ) ( not ( = ?auto_6743 ?auto_6749 ) ) ( TRUCK-AT ?auto_6745 ?auto_6744 ) ( SURFACE-AT ?auto_6738 ?auto_6744 ) ( CLEAR ?auto_6738 ) ( LIFTING ?auto_6746 ?auto_6739 ) ( IS-CRATE ?auto_6739 ) ( not ( = ?auto_6738 ?auto_6739 ) ) ( not ( = ?auto_6740 ?auto_6738 ) ) ( not ( = ?auto_6741 ?auto_6738 ) ) ( not ( = ?auto_6743 ?auto_6738 ) ) ( not ( = ?auto_6749 ?auto_6738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6739 ?auto_6740 ?auto_6741 )
      ( MAKE-3CRATE-VERIFY ?auto_6738 ?auto_6739 ?auto_6740 ?auto_6741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6751 - SURFACE
      ?auto_6752 - SURFACE
      ?auto_6753 - SURFACE
      ?auto_6754 - SURFACE
      ?auto_6755 - SURFACE
    )
    :vars
    (
      ?auto_6760 - HOIST
      ?auto_6758 - PLACE
      ?auto_6761 - PLACE
      ?auto_6762 - HOIST
      ?auto_6757 - SURFACE
      ?auto_6756 - PLACE
      ?auto_6764 - HOIST
      ?auto_6763 - SURFACE
      ?auto_6759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6760 ?auto_6758 ) ( IS-CRATE ?auto_6755 ) ( not ( = ?auto_6754 ?auto_6755 ) ) ( not ( = ?auto_6753 ?auto_6754 ) ) ( not ( = ?auto_6753 ?auto_6755 ) ) ( not ( = ?auto_6761 ?auto_6758 ) ) ( HOIST-AT ?auto_6762 ?auto_6761 ) ( not ( = ?auto_6760 ?auto_6762 ) ) ( AVAILABLE ?auto_6762 ) ( SURFACE-AT ?auto_6755 ?auto_6761 ) ( ON ?auto_6755 ?auto_6757 ) ( CLEAR ?auto_6755 ) ( not ( = ?auto_6754 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6753 ?auto_6757 ) ) ( IS-CRATE ?auto_6754 ) ( not ( = ?auto_6756 ?auto_6758 ) ) ( not ( = ?auto_6761 ?auto_6756 ) ) ( HOIST-AT ?auto_6764 ?auto_6756 ) ( not ( = ?auto_6760 ?auto_6764 ) ) ( not ( = ?auto_6762 ?auto_6764 ) ) ( AVAILABLE ?auto_6764 ) ( SURFACE-AT ?auto_6754 ?auto_6756 ) ( ON ?auto_6754 ?auto_6763 ) ( CLEAR ?auto_6754 ) ( not ( = ?auto_6754 ?auto_6763 ) ) ( not ( = ?auto_6755 ?auto_6763 ) ) ( not ( = ?auto_6753 ?auto_6763 ) ) ( not ( = ?auto_6757 ?auto_6763 ) ) ( TRUCK-AT ?auto_6759 ?auto_6758 ) ( SURFACE-AT ?auto_6752 ?auto_6758 ) ( CLEAR ?auto_6752 ) ( LIFTING ?auto_6760 ?auto_6753 ) ( IS-CRATE ?auto_6753 ) ( not ( = ?auto_6752 ?auto_6753 ) ) ( not ( = ?auto_6754 ?auto_6752 ) ) ( not ( = ?auto_6755 ?auto_6752 ) ) ( not ( = ?auto_6757 ?auto_6752 ) ) ( not ( = ?auto_6763 ?auto_6752 ) ) ( ON ?auto_6752 ?auto_6751 ) ( not ( = ?auto_6751 ?auto_6752 ) ) ( not ( = ?auto_6751 ?auto_6753 ) ) ( not ( = ?auto_6751 ?auto_6754 ) ) ( not ( = ?auto_6751 ?auto_6755 ) ) ( not ( = ?auto_6751 ?auto_6757 ) ) ( not ( = ?auto_6751 ?auto_6763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6753 ?auto_6754 ?auto_6755 )
      ( MAKE-4CRATE-VERIFY ?auto_6751 ?auto_6752 ?auto_6753 ?auto_6754 ?auto_6755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6765 - SURFACE
      ?auto_6766 - SURFACE
    )
    :vars
    (
      ?auto_6771 - HOIST
      ?auto_6769 - PLACE
      ?auto_6777 - SURFACE
      ?auto_6772 - PLACE
      ?auto_6773 - HOIST
      ?auto_6768 - SURFACE
      ?auto_6767 - PLACE
      ?auto_6776 - HOIST
      ?auto_6774 - SURFACE
      ?auto_6770 - TRUCK
      ?auto_6775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6771 ?auto_6769 ) ( IS-CRATE ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( not ( = ?auto_6777 ?auto_6765 ) ) ( not ( = ?auto_6777 ?auto_6766 ) ) ( not ( = ?auto_6772 ?auto_6769 ) ) ( HOIST-AT ?auto_6773 ?auto_6772 ) ( not ( = ?auto_6771 ?auto_6773 ) ) ( AVAILABLE ?auto_6773 ) ( SURFACE-AT ?auto_6766 ?auto_6772 ) ( ON ?auto_6766 ?auto_6768 ) ( CLEAR ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6768 ) ) ( not ( = ?auto_6766 ?auto_6768 ) ) ( not ( = ?auto_6777 ?auto_6768 ) ) ( IS-CRATE ?auto_6765 ) ( not ( = ?auto_6767 ?auto_6769 ) ) ( not ( = ?auto_6772 ?auto_6767 ) ) ( HOIST-AT ?auto_6776 ?auto_6767 ) ( not ( = ?auto_6771 ?auto_6776 ) ) ( not ( = ?auto_6773 ?auto_6776 ) ) ( AVAILABLE ?auto_6776 ) ( SURFACE-AT ?auto_6765 ?auto_6767 ) ( ON ?auto_6765 ?auto_6774 ) ( CLEAR ?auto_6765 ) ( not ( = ?auto_6765 ?auto_6774 ) ) ( not ( = ?auto_6766 ?auto_6774 ) ) ( not ( = ?auto_6777 ?auto_6774 ) ) ( not ( = ?auto_6768 ?auto_6774 ) ) ( TRUCK-AT ?auto_6770 ?auto_6769 ) ( SURFACE-AT ?auto_6775 ?auto_6769 ) ( CLEAR ?auto_6775 ) ( IS-CRATE ?auto_6777 ) ( not ( = ?auto_6775 ?auto_6777 ) ) ( not ( = ?auto_6765 ?auto_6775 ) ) ( not ( = ?auto_6766 ?auto_6775 ) ) ( not ( = ?auto_6768 ?auto_6775 ) ) ( not ( = ?auto_6774 ?auto_6775 ) ) ( AVAILABLE ?auto_6771 ) ( IN ?auto_6777 ?auto_6770 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6771 ?auto_6777 ?auto_6770 ?auto_6769 )
      ( MAKE-2CRATE ?auto_6777 ?auto_6765 ?auto_6766 )
      ( MAKE-1CRATE-VERIFY ?auto_6765 ?auto_6766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6778 - SURFACE
      ?auto_6779 - SURFACE
      ?auto_6780 - SURFACE
    )
    :vars
    (
      ?auto_6786 - HOIST
      ?auto_6790 - PLACE
      ?auto_6781 - PLACE
      ?auto_6789 - HOIST
      ?auto_6783 - SURFACE
      ?auto_6784 - PLACE
      ?auto_6785 - HOIST
      ?auto_6782 - SURFACE
      ?auto_6788 - TRUCK
      ?auto_6787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6786 ?auto_6790 ) ( IS-CRATE ?auto_6780 ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6778 ?auto_6779 ) ) ( not ( = ?auto_6778 ?auto_6780 ) ) ( not ( = ?auto_6781 ?auto_6790 ) ) ( HOIST-AT ?auto_6789 ?auto_6781 ) ( not ( = ?auto_6786 ?auto_6789 ) ) ( AVAILABLE ?auto_6789 ) ( SURFACE-AT ?auto_6780 ?auto_6781 ) ( ON ?auto_6780 ?auto_6783 ) ( CLEAR ?auto_6780 ) ( not ( = ?auto_6779 ?auto_6783 ) ) ( not ( = ?auto_6780 ?auto_6783 ) ) ( not ( = ?auto_6778 ?auto_6783 ) ) ( IS-CRATE ?auto_6779 ) ( not ( = ?auto_6784 ?auto_6790 ) ) ( not ( = ?auto_6781 ?auto_6784 ) ) ( HOIST-AT ?auto_6785 ?auto_6784 ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( not ( = ?auto_6789 ?auto_6785 ) ) ( AVAILABLE ?auto_6785 ) ( SURFACE-AT ?auto_6779 ?auto_6784 ) ( ON ?auto_6779 ?auto_6782 ) ( CLEAR ?auto_6779 ) ( not ( = ?auto_6779 ?auto_6782 ) ) ( not ( = ?auto_6780 ?auto_6782 ) ) ( not ( = ?auto_6778 ?auto_6782 ) ) ( not ( = ?auto_6783 ?auto_6782 ) ) ( TRUCK-AT ?auto_6788 ?auto_6790 ) ( SURFACE-AT ?auto_6787 ?auto_6790 ) ( CLEAR ?auto_6787 ) ( IS-CRATE ?auto_6778 ) ( not ( = ?auto_6787 ?auto_6778 ) ) ( not ( = ?auto_6779 ?auto_6787 ) ) ( not ( = ?auto_6780 ?auto_6787 ) ) ( not ( = ?auto_6783 ?auto_6787 ) ) ( not ( = ?auto_6782 ?auto_6787 ) ) ( AVAILABLE ?auto_6786 ) ( IN ?auto_6778 ?auto_6788 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6779 ?auto_6780 )
      ( MAKE-2CRATE-VERIFY ?auto_6778 ?auto_6779 ?auto_6780 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6791 - SURFACE
      ?auto_6792 - SURFACE
      ?auto_6793 - SURFACE
      ?auto_6794 - SURFACE
    )
    :vars
    (
      ?auto_6800 - HOIST
      ?auto_6798 - PLACE
      ?auto_6802 - PLACE
      ?auto_6795 - HOIST
      ?auto_6796 - SURFACE
      ?auto_6799 - PLACE
      ?auto_6801 - HOIST
      ?auto_6797 - SURFACE
      ?auto_6803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6800 ?auto_6798 ) ( IS-CRATE ?auto_6794 ) ( not ( = ?auto_6793 ?auto_6794 ) ) ( not ( = ?auto_6792 ?auto_6793 ) ) ( not ( = ?auto_6792 ?auto_6794 ) ) ( not ( = ?auto_6802 ?auto_6798 ) ) ( HOIST-AT ?auto_6795 ?auto_6802 ) ( not ( = ?auto_6800 ?auto_6795 ) ) ( AVAILABLE ?auto_6795 ) ( SURFACE-AT ?auto_6794 ?auto_6802 ) ( ON ?auto_6794 ?auto_6796 ) ( CLEAR ?auto_6794 ) ( not ( = ?auto_6793 ?auto_6796 ) ) ( not ( = ?auto_6794 ?auto_6796 ) ) ( not ( = ?auto_6792 ?auto_6796 ) ) ( IS-CRATE ?auto_6793 ) ( not ( = ?auto_6799 ?auto_6798 ) ) ( not ( = ?auto_6802 ?auto_6799 ) ) ( HOIST-AT ?auto_6801 ?auto_6799 ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( not ( = ?auto_6795 ?auto_6801 ) ) ( AVAILABLE ?auto_6801 ) ( SURFACE-AT ?auto_6793 ?auto_6799 ) ( ON ?auto_6793 ?auto_6797 ) ( CLEAR ?auto_6793 ) ( not ( = ?auto_6793 ?auto_6797 ) ) ( not ( = ?auto_6794 ?auto_6797 ) ) ( not ( = ?auto_6792 ?auto_6797 ) ) ( not ( = ?auto_6796 ?auto_6797 ) ) ( TRUCK-AT ?auto_6803 ?auto_6798 ) ( SURFACE-AT ?auto_6791 ?auto_6798 ) ( CLEAR ?auto_6791 ) ( IS-CRATE ?auto_6792 ) ( not ( = ?auto_6791 ?auto_6792 ) ) ( not ( = ?auto_6793 ?auto_6791 ) ) ( not ( = ?auto_6794 ?auto_6791 ) ) ( not ( = ?auto_6796 ?auto_6791 ) ) ( not ( = ?auto_6797 ?auto_6791 ) ) ( AVAILABLE ?auto_6800 ) ( IN ?auto_6792 ?auto_6803 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6792 ?auto_6793 ?auto_6794 )
      ( MAKE-3CRATE-VERIFY ?auto_6791 ?auto_6792 ?auto_6793 ?auto_6794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6804 - SURFACE
      ?auto_6805 - SURFACE
      ?auto_6806 - SURFACE
      ?auto_6807 - SURFACE
      ?auto_6808 - SURFACE
    )
    :vars
    (
      ?auto_6814 - HOIST
      ?auto_6812 - PLACE
      ?auto_6816 - PLACE
      ?auto_6809 - HOIST
      ?auto_6810 - SURFACE
      ?auto_6813 - PLACE
      ?auto_6815 - HOIST
      ?auto_6811 - SURFACE
      ?auto_6817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6814 ?auto_6812 ) ( IS-CRATE ?auto_6808 ) ( not ( = ?auto_6807 ?auto_6808 ) ) ( not ( = ?auto_6806 ?auto_6807 ) ) ( not ( = ?auto_6806 ?auto_6808 ) ) ( not ( = ?auto_6816 ?auto_6812 ) ) ( HOIST-AT ?auto_6809 ?auto_6816 ) ( not ( = ?auto_6814 ?auto_6809 ) ) ( AVAILABLE ?auto_6809 ) ( SURFACE-AT ?auto_6808 ?auto_6816 ) ( ON ?auto_6808 ?auto_6810 ) ( CLEAR ?auto_6808 ) ( not ( = ?auto_6807 ?auto_6810 ) ) ( not ( = ?auto_6808 ?auto_6810 ) ) ( not ( = ?auto_6806 ?auto_6810 ) ) ( IS-CRATE ?auto_6807 ) ( not ( = ?auto_6813 ?auto_6812 ) ) ( not ( = ?auto_6816 ?auto_6813 ) ) ( HOIST-AT ?auto_6815 ?auto_6813 ) ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6809 ?auto_6815 ) ) ( AVAILABLE ?auto_6815 ) ( SURFACE-AT ?auto_6807 ?auto_6813 ) ( ON ?auto_6807 ?auto_6811 ) ( CLEAR ?auto_6807 ) ( not ( = ?auto_6807 ?auto_6811 ) ) ( not ( = ?auto_6808 ?auto_6811 ) ) ( not ( = ?auto_6806 ?auto_6811 ) ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( TRUCK-AT ?auto_6817 ?auto_6812 ) ( SURFACE-AT ?auto_6805 ?auto_6812 ) ( CLEAR ?auto_6805 ) ( IS-CRATE ?auto_6806 ) ( not ( = ?auto_6805 ?auto_6806 ) ) ( not ( = ?auto_6807 ?auto_6805 ) ) ( not ( = ?auto_6808 ?auto_6805 ) ) ( not ( = ?auto_6810 ?auto_6805 ) ) ( not ( = ?auto_6811 ?auto_6805 ) ) ( AVAILABLE ?auto_6814 ) ( IN ?auto_6806 ?auto_6817 ) ( ON ?auto_6805 ?auto_6804 ) ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( not ( = ?auto_6804 ?auto_6807 ) ) ( not ( = ?auto_6804 ?auto_6808 ) ) ( not ( = ?auto_6804 ?auto_6810 ) ) ( not ( = ?auto_6804 ?auto_6811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6806 ?auto_6807 ?auto_6808 )
      ( MAKE-4CRATE-VERIFY ?auto_6804 ?auto_6805 ?auto_6806 ?auto_6807 ?auto_6808 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6818 - SURFACE
      ?auto_6819 - SURFACE
    )
    :vars
    (
      ?auto_6826 - HOIST
      ?auto_6823 - PLACE
      ?auto_6830 - SURFACE
      ?auto_6828 - PLACE
      ?auto_6820 - HOIST
      ?auto_6821 - SURFACE
      ?auto_6824 - PLACE
      ?auto_6827 - HOIST
      ?auto_6822 - SURFACE
      ?auto_6825 - SURFACE
      ?auto_6829 - TRUCK
      ?auto_6831 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6826 ?auto_6823 ) ( IS-CRATE ?auto_6819 ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( not ( = ?auto_6830 ?auto_6818 ) ) ( not ( = ?auto_6830 ?auto_6819 ) ) ( not ( = ?auto_6828 ?auto_6823 ) ) ( HOIST-AT ?auto_6820 ?auto_6828 ) ( not ( = ?auto_6826 ?auto_6820 ) ) ( AVAILABLE ?auto_6820 ) ( SURFACE-AT ?auto_6819 ?auto_6828 ) ( ON ?auto_6819 ?auto_6821 ) ( CLEAR ?auto_6819 ) ( not ( = ?auto_6818 ?auto_6821 ) ) ( not ( = ?auto_6819 ?auto_6821 ) ) ( not ( = ?auto_6830 ?auto_6821 ) ) ( IS-CRATE ?auto_6818 ) ( not ( = ?auto_6824 ?auto_6823 ) ) ( not ( = ?auto_6828 ?auto_6824 ) ) ( HOIST-AT ?auto_6827 ?auto_6824 ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( not ( = ?auto_6820 ?auto_6827 ) ) ( AVAILABLE ?auto_6827 ) ( SURFACE-AT ?auto_6818 ?auto_6824 ) ( ON ?auto_6818 ?auto_6822 ) ( CLEAR ?auto_6818 ) ( not ( = ?auto_6818 ?auto_6822 ) ) ( not ( = ?auto_6819 ?auto_6822 ) ) ( not ( = ?auto_6830 ?auto_6822 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( SURFACE-AT ?auto_6825 ?auto_6823 ) ( CLEAR ?auto_6825 ) ( IS-CRATE ?auto_6830 ) ( not ( = ?auto_6825 ?auto_6830 ) ) ( not ( = ?auto_6818 ?auto_6825 ) ) ( not ( = ?auto_6819 ?auto_6825 ) ) ( not ( = ?auto_6821 ?auto_6825 ) ) ( not ( = ?auto_6822 ?auto_6825 ) ) ( AVAILABLE ?auto_6826 ) ( IN ?auto_6830 ?auto_6829 ) ( TRUCK-AT ?auto_6829 ?auto_6831 ) ( not ( = ?auto_6831 ?auto_6823 ) ) ( not ( = ?auto_6828 ?auto_6831 ) ) ( not ( = ?auto_6824 ?auto_6831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6829 ?auto_6831 ?auto_6823 )
      ( MAKE-2CRATE ?auto_6830 ?auto_6818 ?auto_6819 )
      ( MAKE-1CRATE-VERIFY ?auto_6818 ?auto_6819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6832 - SURFACE
      ?auto_6833 - SURFACE
      ?auto_6834 - SURFACE
    )
    :vars
    (
      ?auto_6843 - HOIST
      ?auto_6840 - PLACE
      ?auto_6838 - PLACE
      ?auto_6845 - HOIST
      ?auto_6835 - SURFACE
      ?auto_6836 - PLACE
      ?auto_6841 - HOIST
      ?auto_6839 - SURFACE
      ?auto_6842 - SURFACE
      ?auto_6837 - TRUCK
      ?auto_6844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6843 ?auto_6840 ) ( IS-CRATE ?auto_6834 ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( not ( = ?auto_6832 ?auto_6833 ) ) ( not ( = ?auto_6832 ?auto_6834 ) ) ( not ( = ?auto_6838 ?auto_6840 ) ) ( HOIST-AT ?auto_6845 ?auto_6838 ) ( not ( = ?auto_6843 ?auto_6845 ) ) ( AVAILABLE ?auto_6845 ) ( SURFACE-AT ?auto_6834 ?auto_6838 ) ( ON ?auto_6834 ?auto_6835 ) ( CLEAR ?auto_6834 ) ( not ( = ?auto_6833 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6832 ?auto_6835 ) ) ( IS-CRATE ?auto_6833 ) ( not ( = ?auto_6836 ?auto_6840 ) ) ( not ( = ?auto_6838 ?auto_6836 ) ) ( HOIST-AT ?auto_6841 ?auto_6836 ) ( not ( = ?auto_6843 ?auto_6841 ) ) ( not ( = ?auto_6845 ?auto_6841 ) ) ( AVAILABLE ?auto_6841 ) ( SURFACE-AT ?auto_6833 ?auto_6836 ) ( ON ?auto_6833 ?auto_6839 ) ( CLEAR ?auto_6833 ) ( not ( = ?auto_6833 ?auto_6839 ) ) ( not ( = ?auto_6834 ?auto_6839 ) ) ( not ( = ?auto_6832 ?auto_6839 ) ) ( not ( = ?auto_6835 ?auto_6839 ) ) ( SURFACE-AT ?auto_6842 ?auto_6840 ) ( CLEAR ?auto_6842 ) ( IS-CRATE ?auto_6832 ) ( not ( = ?auto_6842 ?auto_6832 ) ) ( not ( = ?auto_6833 ?auto_6842 ) ) ( not ( = ?auto_6834 ?auto_6842 ) ) ( not ( = ?auto_6835 ?auto_6842 ) ) ( not ( = ?auto_6839 ?auto_6842 ) ) ( AVAILABLE ?auto_6843 ) ( IN ?auto_6832 ?auto_6837 ) ( TRUCK-AT ?auto_6837 ?auto_6844 ) ( not ( = ?auto_6844 ?auto_6840 ) ) ( not ( = ?auto_6838 ?auto_6844 ) ) ( not ( = ?auto_6836 ?auto_6844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6833 ?auto_6834 )
      ( MAKE-2CRATE-VERIFY ?auto_6832 ?auto_6833 ?auto_6834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6846 - SURFACE
      ?auto_6847 - SURFACE
      ?auto_6848 - SURFACE
      ?auto_6849 - SURFACE
    )
    :vars
    (
      ?auto_6854 - HOIST
      ?auto_6853 - PLACE
      ?auto_6856 - PLACE
      ?auto_6855 - HOIST
      ?auto_6857 - SURFACE
      ?auto_6850 - PLACE
      ?auto_6852 - HOIST
      ?auto_6851 - SURFACE
      ?auto_6859 - TRUCK
      ?auto_6858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6854 ?auto_6853 ) ( IS-CRATE ?auto_6849 ) ( not ( = ?auto_6848 ?auto_6849 ) ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( not ( = ?auto_6847 ?auto_6849 ) ) ( not ( = ?auto_6856 ?auto_6853 ) ) ( HOIST-AT ?auto_6855 ?auto_6856 ) ( not ( = ?auto_6854 ?auto_6855 ) ) ( AVAILABLE ?auto_6855 ) ( SURFACE-AT ?auto_6849 ?auto_6856 ) ( ON ?auto_6849 ?auto_6857 ) ( CLEAR ?auto_6849 ) ( not ( = ?auto_6848 ?auto_6857 ) ) ( not ( = ?auto_6849 ?auto_6857 ) ) ( not ( = ?auto_6847 ?auto_6857 ) ) ( IS-CRATE ?auto_6848 ) ( not ( = ?auto_6850 ?auto_6853 ) ) ( not ( = ?auto_6856 ?auto_6850 ) ) ( HOIST-AT ?auto_6852 ?auto_6850 ) ( not ( = ?auto_6854 ?auto_6852 ) ) ( not ( = ?auto_6855 ?auto_6852 ) ) ( AVAILABLE ?auto_6852 ) ( SURFACE-AT ?auto_6848 ?auto_6850 ) ( ON ?auto_6848 ?auto_6851 ) ( CLEAR ?auto_6848 ) ( not ( = ?auto_6848 ?auto_6851 ) ) ( not ( = ?auto_6849 ?auto_6851 ) ) ( not ( = ?auto_6847 ?auto_6851 ) ) ( not ( = ?auto_6857 ?auto_6851 ) ) ( SURFACE-AT ?auto_6846 ?auto_6853 ) ( CLEAR ?auto_6846 ) ( IS-CRATE ?auto_6847 ) ( not ( = ?auto_6846 ?auto_6847 ) ) ( not ( = ?auto_6848 ?auto_6846 ) ) ( not ( = ?auto_6849 ?auto_6846 ) ) ( not ( = ?auto_6857 ?auto_6846 ) ) ( not ( = ?auto_6851 ?auto_6846 ) ) ( AVAILABLE ?auto_6854 ) ( IN ?auto_6847 ?auto_6859 ) ( TRUCK-AT ?auto_6859 ?auto_6858 ) ( not ( = ?auto_6858 ?auto_6853 ) ) ( not ( = ?auto_6856 ?auto_6858 ) ) ( not ( = ?auto_6850 ?auto_6858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6847 ?auto_6848 ?auto_6849 )
      ( MAKE-3CRATE-VERIFY ?auto_6846 ?auto_6847 ?auto_6848 ?auto_6849 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6860 - SURFACE
      ?auto_6861 - SURFACE
      ?auto_6862 - SURFACE
      ?auto_6863 - SURFACE
      ?auto_6864 - SURFACE
    )
    :vars
    (
      ?auto_6869 - HOIST
      ?auto_6868 - PLACE
      ?auto_6871 - PLACE
      ?auto_6870 - HOIST
      ?auto_6872 - SURFACE
      ?auto_6865 - PLACE
      ?auto_6867 - HOIST
      ?auto_6866 - SURFACE
      ?auto_6874 - TRUCK
      ?auto_6873 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6869 ?auto_6868 ) ( IS-CRATE ?auto_6864 ) ( not ( = ?auto_6863 ?auto_6864 ) ) ( not ( = ?auto_6862 ?auto_6863 ) ) ( not ( = ?auto_6862 ?auto_6864 ) ) ( not ( = ?auto_6871 ?auto_6868 ) ) ( HOIST-AT ?auto_6870 ?auto_6871 ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( AVAILABLE ?auto_6870 ) ( SURFACE-AT ?auto_6864 ?auto_6871 ) ( ON ?auto_6864 ?auto_6872 ) ( CLEAR ?auto_6864 ) ( not ( = ?auto_6863 ?auto_6872 ) ) ( not ( = ?auto_6864 ?auto_6872 ) ) ( not ( = ?auto_6862 ?auto_6872 ) ) ( IS-CRATE ?auto_6863 ) ( not ( = ?auto_6865 ?auto_6868 ) ) ( not ( = ?auto_6871 ?auto_6865 ) ) ( HOIST-AT ?auto_6867 ?auto_6865 ) ( not ( = ?auto_6869 ?auto_6867 ) ) ( not ( = ?auto_6870 ?auto_6867 ) ) ( AVAILABLE ?auto_6867 ) ( SURFACE-AT ?auto_6863 ?auto_6865 ) ( ON ?auto_6863 ?auto_6866 ) ( CLEAR ?auto_6863 ) ( not ( = ?auto_6863 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6866 ) ) ( not ( = ?auto_6862 ?auto_6866 ) ) ( not ( = ?auto_6872 ?auto_6866 ) ) ( SURFACE-AT ?auto_6861 ?auto_6868 ) ( CLEAR ?auto_6861 ) ( IS-CRATE ?auto_6862 ) ( not ( = ?auto_6861 ?auto_6862 ) ) ( not ( = ?auto_6863 ?auto_6861 ) ) ( not ( = ?auto_6864 ?auto_6861 ) ) ( not ( = ?auto_6872 ?auto_6861 ) ) ( not ( = ?auto_6866 ?auto_6861 ) ) ( AVAILABLE ?auto_6869 ) ( IN ?auto_6862 ?auto_6874 ) ( TRUCK-AT ?auto_6874 ?auto_6873 ) ( not ( = ?auto_6873 ?auto_6868 ) ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6865 ?auto_6873 ) ) ( ON ?auto_6861 ?auto_6860 ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6862 ) ) ( not ( = ?auto_6860 ?auto_6863 ) ) ( not ( = ?auto_6860 ?auto_6864 ) ) ( not ( = ?auto_6860 ?auto_6872 ) ) ( not ( = ?auto_6860 ?auto_6866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6862 ?auto_6863 ?auto_6864 )
      ( MAKE-4CRATE-VERIFY ?auto_6860 ?auto_6861 ?auto_6862 ?auto_6863 ?auto_6864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6875 - SURFACE
      ?auto_6876 - SURFACE
    )
    :vars
    (
      ?auto_6882 - HOIST
      ?auto_6881 - PLACE
      ?auto_6888 - SURFACE
      ?auto_6884 - PLACE
      ?auto_6883 - HOIST
      ?auto_6885 - SURFACE
      ?auto_6877 - PLACE
      ?auto_6880 - HOIST
      ?auto_6879 - SURFACE
      ?auto_6878 - SURFACE
      ?auto_6887 - TRUCK
      ?auto_6886 - PLACE
      ?auto_6889 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6882 ?auto_6881 ) ( IS-CRATE ?auto_6876 ) ( not ( = ?auto_6875 ?auto_6876 ) ) ( not ( = ?auto_6888 ?auto_6875 ) ) ( not ( = ?auto_6888 ?auto_6876 ) ) ( not ( = ?auto_6884 ?auto_6881 ) ) ( HOIST-AT ?auto_6883 ?auto_6884 ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( AVAILABLE ?auto_6883 ) ( SURFACE-AT ?auto_6876 ?auto_6884 ) ( ON ?auto_6876 ?auto_6885 ) ( CLEAR ?auto_6876 ) ( not ( = ?auto_6875 ?auto_6885 ) ) ( not ( = ?auto_6876 ?auto_6885 ) ) ( not ( = ?auto_6888 ?auto_6885 ) ) ( IS-CRATE ?auto_6875 ) ( not ( = ?auto_6877 ?auto_6881 ) ) ( not ( = ?auto_6884 ?auto_6877 ) ) ( HOIST-AT ?auto_6880 ?auto_6877 ) ( not ( = ?auto_6882 ?auto_6880 ) ) ( not ( = ?auto_6883 ?auto_6880 ) ) ( AVAILABLE ?auto_6880 ) ( SURFACE-AT ?auto_6875 ?auto_6877 ) ( ON ?auto_6875 ?auto_6879 ) ( CLEAR ?auto_6875 ) ( not ( = ?auto_6875 ?auto_6879 ) ) ( not ( = ?auto_6876 ?auto_6879 ) ) ( not ( = ?auto_6888 ?auto_6879 ) ) ( not ( = ?auto_6885 ?auto_6879 ) ) ( SURFACE-AT ?auto_6878 ?auto_6881 ) ( CLEAR ?auto_6878 ) ( IS-CRATE ?auto_6888 ) ( not ( = ?auto_6878 ?auto_6888 ) ) ( not ( = ?auto_6875 ?auto_6878 ) ) ( not ( = ?auto_6876 ?auto_6878 ) ) ( not ( = ?auto_6885 ?auto_6878 ) ) ( not ( = ?auto_6879 ?auto_6878 ) ) ( AVAILABLE ?auto_6882 ) ( TRUCK-AT ?auto_6887 ?auto_6886 ) ( not ( = ?auto_6886 ?auto_6881 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6877 ?auto_6886 ) ) ( HOIST-AT ?auto_6889 ?auto_6886 ) ( LIFTING ?auto_6889 ?auto_6888 ) ( not ( = ?auto_6882 ?auto_6889 ) ) ( not ( = ?auto_6883 ?auto_6889 ) ) ( not ( = ?auto_6880 ?auto_6889 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6889 ?auto_6888 ?auto_6887 ?auto_6886 )
      ( MAKE-2CRATE ?auto_6888 ?auto_6875 ?auto_6876 )
      ( MAKE-1CRATE-VERIFY ?auto_6875 ?auto_6876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6890 - SURFACE
      ?auto_6891 - SURFACE
      ?auto_6892 - SURFACE
    )
    :vars
    (
      ?auto_6900 - HOIST
      ?auto_6896 - PLACE
      ?auto_6895 - PLACE
      ?auto_6902 - HOIST
      ?auto_6899 - SURFACE
      ?auto_6894 - PLACE
      ?auto_6901 - HOIST
      ?auto_6893 - SURFACE
      ?auto_6904 - SURFACE
      ?auto_6897 - TRUCK
      ?auto_6898 - PLACE
      ?auto_6903 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6900 ?auto_6896 ) ( IS-CRATE ?auto_6892 ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( HOIST-AT ?auto_6902 ?auto_6895 ) ( not ( = ?auto_6900 ?auto_6902 ) ) ( AVAILABLE ?auto_6902 ) ( SURFACE-AT ?auto_6892 ?auto_6895 ) ( ON ?auto_6892 ?auto_6899 ) ( CLEAR ?auto_6892 ) ( not ( = ?auto_6891 ?auto_6899 ) ) ( not ( = ?auto_6892 ?auto_6899 ) ) ( not ( = ?auto_6890 ?auto_6899 ) ) ( IS-CRATE ?auto_6891 ) ( not ( = ?auto_6894 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6894 ) ) ( HOIST-AT ?auto_6901 ?auto_6894 ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( not ( = ?auto_6902 ?auto_6901 ) ) ( AVAILABLE ?auto_6901 ) ( SURFACE-AT ?auto_6891 ?auto_6894 ) ( ON ?auto_6891 ?auto_6893 ) ( CLEAR ?auto_6891 ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6893 ) ) ( not ( = ?auto_6899 ?auto_6893 ) ) ( SURFACE-AT ?auto_6904 ?auto_6896 ) ( CLEAR ?auto_6904 ) ( IS-CRATE ?auto_6890 ) ( not ( = ?auto_6904 ?auto_6890 ) ) ( not ( = ?auto_6891 ?auto_6904 ) ) ( not ( = ?auto_6892 ?auto_6904 ) ) ( not ( = ?auto_6899 ?auto_6904 ) ) ( not ( = ?auto_6893 ?auto_6904 ) ) ( AVAILABLE ?auto_6900 ) ( TRUCK-AT ?auto_6897 ?auto_6898 ) ( not ( = ?auto_6898 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6898 ) ) ( not ( = ?auto_6894 ?auto_6898 ) ) ( HOIST-AT ?auto_6903 ?auto_6898 ) ( LIFTING ?auto_6903 ?auto_6890 ) ( not ( = ?auto_6900 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( not ( = ?auto_6901 ?auto_6903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6891 ?auto_6892 )
      ( MAKE-2CRATE-VERIFY ?auto_6890 ?auto_6891 ?auto_6892 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6905 - SURFACE
      ?auto_6906 - SURFACE
      ?auto_6907 - SURFACE
      ?auto_6908 - SURFACE
    )
    :vars
    (
      ?auto_6917 - HOIST
      ?auto_6918 - PLACE
      ?auto_6916 - PLACE
      ?auto_6913 - HOIST
      ?auto_6910 - SURFACE
      ?auto_6919 - PLACE
      ?auto_6915 - HOIST
      ?auto_6914 - SURFACE
      ?auto_6911 - TRUCK
      ?auto_6909 - PLACE
      ?auto_6912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6917 ?auto_6918 ) ( IS-CRATE ?auto_6908 ) ( not ( = ?auto_6907 ?auto_6908 ) ) ( not ( = ?auto_6906 ?auto_6907 ) ) ( not ( = ?auto_6906 ?auto_6908 ) ) ( not ( = ?auto_6916 ?auto_6918 ) ) ( HOIST-AT ?auto_6913 ?auto_6916 ) ( not ( = ?auto_6917 ?auto_6913 ) ) ( AVAILABLE ?auto_6913 ) ( SURFACE-AT ?auto_6908 ?auto_6916 ) ( ON ?auto_6908 ?auto_6910 ) ( CLEAR ?auto_6908 ) ( not ( = ?auto_6907 ?auto_6910 ) ) ( not ( = ?auto_6908 ?auto_6910 ) ) ( not ( = ?auto_6906 ?auto_6910 ) ) ( IS-CRATE ?auto_6907 ) ( not ( = ?auto_6919 ?auto_6918 ) ) ( not ( = ?auto_6916 ?auto_6919 ) ) ( HOIST-AT ?auto_6915 ?auto_6919 ) ( not ( = ?auto_6917 ?auto_6915 ) ) ( not ( = ?auto_6913 ?auto_6915 ) ) ( AVAILABLE ?auto_6915 ) ( SURFACE-AT ?auto_6907 ?auto_6919 ) ( ON ?auto_6907 ?auto_6914 ) ( CLEAR ?auto_6907 ) ( not ( = ?auto_6907 ?auto_6914 ) ) ( not ( = ?auto_6908 ?auto_6914 ) ) ( not ( = ?auto_6906 ?auto_6914 ) ) ( not ( = ?auto_6910 ?auto_6914 ) ) ( SURFACE-AT ?auto_6905 ?auto_6918 ) ( CLEAR ?auto_6905 ) ( IS-CRATE ?auto_6906 ) ( not ( = ?auto_6905 ?auto_6906 ) ) ( not ( = ?auto_6907 ?auto_6905 ) ) ( not ( = ?auto_6908 ?auto_6905 ) ) ( not ( = ?auto_6910 ?auto_6905 ) ) ( not ( = ?auto_6914 ?auto_6905 ) ) ( AVAILABLE ?auto_6917 ) ( TRUCK-AT ?auto_6911 ?auto_6909 ) ( not ( = ?auto_6909 ?auto_6918 ) ) ( not ( = ?auto_6916 ?auto_6909 ) ) ( not ( = ?auto_6919 ?auto_6909 ) ) ( HOIST-AT ?auto_6912 ?auto_6909 ) ( LIFTING ?auto_6912 ?auto_6906 ) ( not ( = ?auto_6917 ?auto_6912 ) ) ( not ( = ?auto_6913 ?auto_6912 ) ) ( not ( = ?auto_6915 ?auto_6912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6906 ?auto_6907 ?auto_6908 )
      ( MAKE-3CRATE-VERIFY ?auto_6905 ?auto_6906 ?auto_6907 ?auto_6908 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6920 - SURFACE
      ?auto_6921 - SURFACE
      ?auto_6922 - SURFACE
      ?auto_6923 - SURFACE
      ?auto_6924 - SURFACE
    )
    :vars
    (
      ?auto_6933 - HOIST
      ?auto_6934 - PLACE
      ?auto_6932 - PLACE
      ?auto_6929 - HOIST
      ?auto_6926 - SURFACE
      ?auto_6935 - PLACE
      ?auto_6931 - HOIST
      ?auto_6930 - SURFACE
      ?auto_6927 - TRUCK
      ?auto_6925 - PLACE
      ?auto_6928 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6933 ?auto_6934 ) ( IS-CRATE ?auto_6924 ) ( not ( = ?auto_6923 ?auto_6924 ) ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( not ( = ?auto_6932 ?auto_6934 ) ) ( HOIST-AT ?auto_6929 ?auto_6932 ) ( not ( = ?auto_6933 ?auto_6929 ) ) ( AVAILABLE ?auto_6929 ) ( SURFACE-AT ?auto_6924 ?auto_6932 ) ( ON ?auto_6924 ?auto_6926 ) ( CLEAR ?auto_6924 ) ( not ( = ?auto_6923 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( IS-CRATE ?auto_6923 ) ( not ( = ?auto_6935 ?auto_6934 ) ) ( not ( = ?auto_6932 ?auto_6935 ) ) ( HOIST-AT ?auto_6931 ?auto_6935 ) ( not ( = ?auto_6933 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( AVAILABLE ?auto_6931 ) ( SURFACE-AT ?auto_6923 ?auto_6935 ) ( ON ?auto_6923 ?auto_6930 ) ( CLEAR ?auto_6923 ) ( not ( = ?auto_6923 ?auto_6930 ) ) ( not ( = ?auto_6924 ?auto_6930 ) ) ( not ( = ?auto_6922 ?auto_6930 ) ) ( not ( = ?auto_6926 ?auto_6930 ) ) ( SURFACE-AT ?auto_6921 ?auto_6934 ) ( CLEAR ?auto_6921 ) ( IS-CRATE ?auto_6922 ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6923 ?auto_6921 ) ) ( not ( = ?auto_6924 ?auto_6921 ) ) ( not ( = ?auto_6926 ?auto_6921 ) ) ( not ( = ?auto_6930 ?auto_6921 ) ) ( AVAILABLE ?auto_6933 ) ( TRUCK-AT ?auto_6927 ?auto_6925 ) ( not ( = ?auto_6925 ?auto_6934 ) ) ( not ( = ?auto_6932 ?auto_6925 ) ) ( not ( = ?auto_6935 ?auto_6925 ) ) ( HOIST-AT ?auto_6928 ?auto_6925 ) ( LIFTING ?auto_6928 ?auto_6922 ) ( not ( = ?auto_6933 ?auto_6928 ) ) ( not ( = ?auto_6929 ?auto_6928 ) ) ( not ( = ?auto_6931 ?auto_6928 ) ) ( ON ?auto_6921 ?auto_6920 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6924 ) ) ( not ( = ?auto_6920 ?auto_6926 ) ) ( not ( = ?auto_6920 ?auto_6930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6922 ?auto_6923 ?auto_6924 )
      ( MAKE-4CRATE-VERIFY ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6936 - SURFACE
      ?auto_6937 - SURFACE
    )
    :vars
    (
      ?auto_6946 - HOIST
      ?auto_6948 - PLACE
      ?auto_6950 - SURFACE
      ?auto_6945 - PLACE
      ?auto_6942 - HOIST
      ?auto_6939 - SURFACE
      ?auto_6949 - PLACE
      ?auto_6944 - HOIST
      ?auto_6943 - SURFACE
      ?auto_6947 - SURFACE
      ?auto_6940 - TRUCK
      ?auto_6938 - PLACE
      ?auto_6941 - HOIST
      ?auto_6951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6946 ?auto_6948 ) ( IS-CRATE ?auto_6937 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6950 ?auto_6936 ) ) ( not ( = ?auto_6950 ?auto_6937 ) ) ( not ( = ?auto_6945 ?auto_6948 ) ) ( HOIST-AT ?auto_6942 ?auto_6945 ) ( not ( = ?auto_6946 ?auto_6942 ) ) ( AVAILABLE ?auto_6942 ) ( SURFACE-AT ?auto_6937 ?auto_6945 ) ( ON ?auto_6937 ?auto_6939 ) ( CLEAR ?auto_6937 ) ( not ( = ?auto_6936 ?auto_6939 ) ) ( not ( = ?auto_6937 ?auto_6939 ) ) ( not ( = ?auto_6950 ?auto_6939 ) ) ( IS-CRATE ?auto_6936 ) ( not ( = ?auto_6949 ?auto_6948 ) ) ( not ( = ?auto_6945 ?auto_6949 ) ) ( HOIST-AT ?auto_6944 ?auto_6949 ) ( not ( = ?auto_6946 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( AVAILABLE ?auto_6944 ) ( SURFACE-AT ?auto_6936 ?auto_6949 ) ( ON ?auto_6936 ?auto_6943 ) ( CLEAR ?auto_6936 ) ( not ( = ?auto_6936 ?auto_6943 ) ) ( not ( = ?auto_6937 ?auto_6943 ) ) ( not ( = ?auto_6950 ?auto_6943 ) ) ( not ( = ?auto_6939 ?auto_6943 ) ) ( SURFACE-AT ?auto_6947 ?auto_6948 ) ( CLEAR ?auto_6947 ) ( IS-CRATE ?auto_6950 ) ( not ( = ?auto_6947 ?auto_6950 ) ) ( not ( = ?auto_6936 ?auto_6947 ) ) ( not ( = ?auto_6937 ?auto_6947 ) ) ( not ( = ?auto_6939 ?auto_6947 ) ) ( not ( = ?auto_6943 ?auto_6947 ) ) ( AVAILABLE ?auto_6946 ) ( TRUCK-AT ?auto_6940 ?auto_6938 ) ( not ( = ?auto_6938 ?auto_6948 ) ) ( not ( = ?auto_6945 ?auto_6938 ) ) ( not ( = ?auto_6949 ?auto_6938 ) ) ( HOIST-AT ?auto_6941 ?auto_6938 ) ( not ( = ?auto_6946 ?auto_6941 ) ) ( not ( = ?auto_6942 ?auto_6941 ) ) ( not ( = ?auto_6944 ?auto_6941 ) ) ( AVAILABLE ?auto_6941 ) ( SURFACE-AT ?auto_6950 ?auto_6938 ) ( ON ?auto_6950 ?auto_6951 ) ( CLEAR ?auto_6950 ) ( not ( = ?auto_6936 ?auto_6951 ) ) ( not ( = ?auto_6937 ?auto_6951 ) ) ( not ( = ?auto_6950 ?auto_6951 ) ) ( not ( = ?auto_6939 ?auto_6951 ) ) ( not ( = ?auto_6943 ?auto_6951 ) ) ( not ( = ?auto_6947 ?auto_6951 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6941 ?auto_6950 ?auto_6951 ?auto_6938 )
      ( MAKE-2CRATE ?auto_6950 ?auto_6936 ?auto_6937 )
      ( MAKE-1CRATE-VERIFY ?auto_6936 ?auto_6937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6952 - SURFACE
      ?auto_6953 - SURFACE
      ?auto_6954 - SURFACE
    )
    :vars
    (
      ?auto_6956 - HOIST
      ?auto_6957 - PLACE
      ?auto_6955 - PLACE
      ?auto_6958 - HOIST
      ?auto_6960 - SURFACE
      ?auto_6961 - PLACE
      ?auto_6964 - HOIST
      ?auto_6963 - SURFACE
      ?auto_6959 - SURFACE
      ?auto_6966 - TRUCK
      ?auto_6967 - PLACE
      ?auto_6962 - HOIST
      ?auto_6965 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6956 ?auto_6957 ) ( IS-CRATE ?auto_6954 ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( not ( = ?auto_6952 ?auto_6953 ) ) ( not ( = ?auto_6952 ?auto_6954 ) ) ( not ( = ?auto_6955 ?auto_6957 ) ) ( HOIST-AT ?auto_6958 ?auto_6955 ) ( not ( = ?auto_6956 ?auto_6958 ) ) ( AVAILABLE ?auto_6958 ) ( SURFACE-AT ?auto_6954 ?auto_6955 ) ( ON ?auto_6954 ?auto_6960 ) ( CLEAR ?auto_6954 ) ( not ( = ?auto_6953 ?auto_6960 ) ) ( not ( = ?auto_6954 ?auto_6960 ) ) ( not ( = ?auto_6952 ?auto_6960 ) ) ( IS-CRATE ?auto_6953 ) ( not ( = ?auto_6961 ?auto_6957 ) ) ( not ( = ?auto_6955 ?auto_6961 ) ) ( HOIST-AT ?auto_6964 ?auto_6961 ) ( not ( = ?auto_6956 ?auto_6964 ) ) ( not ( = ?auto_6958 ?auto_6964 ) ) ( AVAILABLE ?auto_6964 ) ( SURFACE-AT ?auto_6953 ?auto_6961 ) ( ON ?auto_6953 ?auto_6963 ) ( CLEAR ?auto_6953 ) ( not ( = ?auto_6953 ?auto_6963 ) ) ( not ( = ?auto_6954 ?auto_6963 ) ) ( not ( = ?auto_6952 ?auto_6963 ) ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( SURFACE-AT ?auto_6959 ?auto_6957 ) ( CLEAR ?auto_6959 ) ( IS-CRATE ?auto_6952 ) ( not ( = ?auto_6959 ?auto_6952 ) ) ( not ( = ?auto_6953 ?auto_6959 ) ) ( not ( = ?auto_6954 ?auto_6959 ) ) ( not ( = ?auto_6960 ?auto_6959 ) ) ( not ( = ?auto_6963 ?auto_6959 ) ) ( AVAILABLE ?auto_6956 ) ( TRUCK-AT ?auto_6966 ?auto_6967 ) ( not ( = ?auto_6967 ?auto_6957 ) ) ( not ( = ?auto_6955 ?auto_6967 ) ) ( not ( = ?auto_6961 ?auto_6967 ) ) ( HOIST-AT ?auto_6962 ?auto_6967 ) ( not ( = ?auto_6956 ?auto_6962 ) ) ( not ( = ?auto_6958 ?auto_6962 ) ) ( not ( = ?auto_6964 ?auto_6962 ) ) ( AVAILABLE ?auto_6962 ) ( SURFACE-AT ?auto_6952 ?auto_6967 ) ( ON ?auto_6952 ?auto_6965 ) ( CLEAR ?auto_6952 ) ( not ( = ?auto_6953 ?auto_6965 ) ) ( not ( = ?auto_6954 ?auto_6965 ) ) ( not ( = ?auto_6952 ?auto_6965 ) ) ( not ( = ?auto_6960 ?auto_6965 ) ) ( not ( = ?auto_6963 ?auto_6965 ) ) ( not ( = ?auto_6959 ?auto_6965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6953 ?auto_6954 )
      ( MAKE-2CRATE-VERIFY ?auto_6952 ?auto_6953 ?auto_6954 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6968 - SURFACE
      ?auto_6969 - SURFACE
      ?auto_6970 - SURFACE
      ?auto_6971 - SURFACE
    )
    :vars
    (
      ?auto_6981 - HOIST
      ?auto_6983 - PLACE
      ?auto_6976 - PLACE
      ?auto_6979 - HOIST
      ?auto_6980 - SURFACE
      ?auto_6972 - PLACE
      ?auto_6973 - HOIST
      ?auto_6982 - SURFACE
      ?auto_6975 - TRUCK
      ?auto_6977 - PLACE
      ?auto_6978 - HOIST
      ?auto_6974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6981 ?auto_6983 ) ( IS-CRATE ?auto_6971 ) ( not ( = ?auto_6970 ?auto_6971 ) ) ( not ( = ?auto_6969 ?auto_6970 ) ) ( not ( = ?auto_6969 ?auto_6971 ) ) ( not ( = ?auto_6976 ?auto_6983 ) ) ( HOIST-AT ?auto_6979 ?auto_6976 ) ( not ( = ?auto_6981 ?auto_6979 ) ) ( AVAILABLE ?auto_6979 ) ( SURFACE-AT ?auto_6971 ?auto_6976 ) ( ON ?auto_6971 ?auto_6980 ) ( CLEAR ?auto_6971 ) ( not ( = ?auto_6970 ?auto_6980 ) ) ( not ( = ?auto_6971 ?auto_6980 ) ) ( not ( = ?auto_6969 ?auto_6980 ) ) ( IS-CRATE ?auto_6970 ) ( not ( = ?auto_6972 ?auto_6983 ) ) ( not ( = ?auto_6976 ?auto_6972 ) ) ( HOIST-AT ?auto_6973 ?auto_6972 ) ( not ( = ?auto_6981 ?auto_6973 ) ) ( not ( = ?auto_6979 ?auto_6973 ) ) ( AVAILABLE ?auto_6973 ) ( SURFACE-AT ?auto_6970 ?auto_6972 ) ( ON ?auto_6970 ?auto_6982 ) ( CLEAR ?auto_6970 ) ( not ( = ?auto_6970 ?auto_6982 ) ) ( not ( = ?auto_6971 ?auto_6982 ) ) ( not ( = ?auto_6969 ?auto_6982 ) ) ( not ( = ?auto_6980 ?auto_6982 ) ) ( SURFACE-AT ?auto_6968 ?auto_6983 ) ( CLEAR ?auto_6968 ) ( IS-CRATE ?auto_6969 ) ( not ( = ?auto_6968 ?auto_6969 ) ) ( not ( = ?auto_6970 ?auto_6968 ) ) ( not ( = ?auto_6971 ?auto_6968 ) ) ( not ( = ?auto_6980 ?auto_6968 ) ) ( not ( = ?auto_6982 ?auto_6968 ) ) ( AVAILABLE ?auto_6981 ) ( TRUCK-AT ?auto_6975 ?auto_6977 ) ( not ( = ?auto_6977 ?auto_6983 ) ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6972 ?auto_6977 ) ) ( HOIST-AT ?auto_6978 ?auto_6977 ) ( not ( = ?auto_6981 ?auto_6978 ) ) ( not ( = ?auto_6979 ?auto_6978 ) ) ( not ( = ?auto_6973 ?auto_6978 ) ) ( AVAILABLE ?auto_6978 ) ( SURFACE-AT ?auto_6969 ?auto_6977 ) ( ON ?auto_6969 ?auto_6974 ) ( CLEAR ?auto_6969 ) ( not ( = ?auto_6970 ?auto_6974 ) ) ( not ( = ?auto_6971 ?auto_6974 ) ) ( not ( = ?auto_6969 ?auto_6974 ) ) ( not ( = ?auto_6980 ?auto_6974 ) ) ( not ( = ?auto_6982 ?auto_6974 ) ) ( not ( = ?auto_6968 ?auto_6974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6969 ?auto_6970 ?auto_6971 )
      ( MAKE-3CRATE-VERIFY ?auto_6968 ?auto_6969 ?auto_6970 ?auto_6971 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6984 - SURFACE
      ?auto_6985 - SURFACE
      ?auto_6986 - SURFACE
      ?auto_6987 - SURFACE
      ?auto_6988 - SURFACE
    )
    :vars
    (
      ?auto_6998 - HOIST
      ?auto_7000 - PLACE
      ?auto_6993 - PLACE
      ?auto_6996 - HOIST
      ?auto_6997 - SURFACE
      ?auto_6989 - PLACE
      ?auto_6990 - HOIST
      ?auto_6999 - SURFACE
      ?auto_6992 - TRUCK
      ?auto_6994 - PLACE
      ?auto_6995 - HOIST
      ?auto_6991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6998 ?auto_7000 ) ( IS-CRATE ?auto_6988 ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_6988 ) ) ( not ( = ?auto_6993 ?auto_7000 ) ) ( HOIST-AT ?auto_6996 ?auto_6993 ) ( not ( = ?auto_6998 ?auto_6996 ) ) ( AVAILABLE ?auto_6996 ) ( SURFACE-AT ?auto_6988 ?auto_6993 ) ( ON ?auto_6988 ?auto_6997 ) ( CLEAR ?auto_6988 ) ( not ( = ?auto_6987 ?auto_6997 ) ) ( not ( = ?auto_6988 ?auto_6997 ) ) ( not ( = ?auto_6986 ?auto_6997 ) ) ( IS-CRATE ?auto_6987 ) ( not ( = ?auto_6989 ?auto_7000 ) ) ( not ( = ?auto_6993 ?auto_6989 ) ) ( HOIST-AT ?auto_6990 ?auto_6989 ) ( not ( = ?auto_6998 ?auto_6990 ) ) ( not ( = ?auto_6996 ?auto_6990 ) ) ( AVAILABLE ?auto_6990 ) ( SURFACE-AT ?auto_6987 ?auto_6989 ) ( ON ?auto_6987 ?auto_6999 ) ( CLEAR ?auto_6987 ) ( not ( = ?auto_6987 ?auto_6999 ) ) ( not ( = ?auto_6988 ?auto_6999 ) ) ( not ( = ?auto_6986 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( SURFACE-AT ?auto_6985 ?auto_7000 ) ( CLEAR ?auto_6985 ) ( IS-CRATE ?auto_6986 ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( not ( = ?auto_6987 ?auto_6985 ) ) ( not ( = ?auto_6988 ?auto_6985 ) ) ( not ( = ?auto_6997 ?auto_6985 ) ) ( not ( = ?auto_6999 ?auto_6985 ) ) ( AVAILABLE ?auto_6998 ) ( TRUCK-AT ?auto_6992 ?auto_6994 ) ( not ( = ?auto_6994 ?auto_7000 ) ) ( not ( = ?auto_6993 ?auto_6994 ) ) ( not ( = ?auto_6989 ?auto_6994 ) ) ( HOIST-AT ?auto_6995 ?auto_6994 ) ( not ( = ?auto_6998 ?auto_6995 ) ) ( not ( = ?auto_6996 ?auto_6995 ) ) ( not ( = ?auto_6990 ?auto_6995 ) ) ( AVAILABLE ?auto_6995 ) ( SURFACE-AT ?auto_6986 ?auto_6994 ) ( ON ?auto_6986 ?auto_6991 ) ( CLEAR ?auto_6986 ) ( not ( = ?auto_6987 ?auto_6991 ) ) ( not ( = ?auto_6988 ?auto_6991 ) ) ( not ( = ?auto_6986 ?auto_6991 ) ) ( not ( = ?auto_6997 ?auto_6991 ) ) ( not ( = ?auto_6999 ?auto_6991 ) ) ( not ( = ?auto_6985 ?auto_6991 ) ) ( ON ?auto_6985 ?auto_6984 ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6984 ?auto_6986 ) ) ( not ( = ?auto_6984 ?auto_6987 ) ) ( not ( = ?auto_6984 ?auto_6988 ) ) ( not ( = ?auto_6984 ?auto_6997 ) ) ( not ( = ?auto_6984 ?auto_6999 ) ) ( not ( = ?auto_6984 ?auto_6991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6986 ?auto_6987 ?auto_6988 )
      ( MAKE-4CRATE-VERIFY ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6988 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7001 - SURFACE
      ?auto_7002 - SURFACE
    )
    :vars
    (
      ?auto_7013 - HOIST
      ?auto_7015 - PLACE
      ?auto_7016 - SURFACE
      ?auto_7008 - PLACE
      ?auto_7011 - HOIST
      ?auto_7012 - SURFACE
      ?auto_7003 - PLACE
      ?auto_7004 - HOIST
      ?auto_7014 - SURFACE
      ?auto_7006 - SURFACE
      ?auto_7009 - PLACE
      ?auto_7010 - HOIST
      ?auto_7005 - SURFACE
      ?auto_7007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7013 ?auto_7015 ) ( IS-CRATE ?auto_7002 ) ( not ( = ?auto_7001 ?auto_7002 ) ) ( not ( = ?auto_7016 ?auto_7001 ) ) ( not ( = ?auto_7016 ?auto_7002 ) ) ( not ( = ?auto_7008 ?auto_7015 ) ) ( HOIST-AT ?auto_7011 ?auto_7008 ) ( not ( = ?auto_7013 ?auto_7011 ) ) ( AVAILABLE ?auto_7011 ) ( SURFACE-AT ?auto_7002 ?auto_7008 ) ( ON ?auto_7002 ?auto_7012 ) ( CLEAR ?auto_7002 ) ( not ( = ?auto_7001 ?auto_7012 ) ) ( not ( = ?auto_7002 ?auto_7012 ) ) ( not ( = ?auto_7016 ?auto_7012 ) ) ( IS-CRATE ?auto_7001 ) ( not ( = ?auto_7003 ?auto_7015 ) ) ( not ( = ?auto_7008 ?auto_7003 ) ) ( HOIST-AT ?auto_7004 ?auto_7003 ) ( not ( = ?auto_7013 ?auto_7004 ) ) ( not ( = ?auto_7011 ?auto_7004 ) ) ( AVAILABLE ?auto_7004 ) ( SURFACE-AT ?auto_7001 ?auto_7003 ) ( ON ?auto_7001 ?auto_7014 ) ( CLEAR ?auto_7001 ) ( not ( = ?auto_7001 ?auto_7014 ) ) ( not ( = ?auto_7002 ?auto_7014 ) ) ( not ( = ?auto_7016 ?auto_7014 ) ) ( not ( = ?auto_7012 ?auto_7014 ) ) ( SURFACE-AT ?auto_7006 ?auto_7015 ) ( CLEAR ?auto_7006 ) ( IS-CRATE ?auto_7016 ) ( not ( = ?auto_7006 ?auto_7016 ) ) ( not ( = ?auto_7001 ?auto_7006 ) ) ( not ( = ?auto_7002 ?auto_7006 ) ) ( not ( = ?auto_7012 ?auto_7006 ) ) ( not ( = ?auto_7014 ?auto_7006 ) ) ( AVAILABLE ?auto_7013 ) ( not ( = ?auto_7009 ?auto_7015 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( not ( = ?auto_7003 ?auto_7009 ) ) ( HOIST-AT ?auto_7010 ?auto_7009 ) ( not ( = ?auto_7013 ?auto_7010 ) ) ( not ( = ?auto_7011 ?auto_7010 ) ) ( not ( = ?auto_7004 ?auto_7010 ) ) ( AVAILABLE ?auto_7010 ) ( SURFACE-AT ?auto_7016 ?auto_7009 ) ( ON ?auto_7016 ?auto_7005 ) ( CLEAR ?auto_7016 ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7016 ?auto_7005 ) ) ( not ( = ?auto_7012 ?auto_7005 ) ) ( not ( = ?auto_7014 ?auto_7005 ) ) ( not ( = ?auto_7006 ?auto_7005 ) ) ( TRUCK-AT ?auto_7007 ?auto_7015 ) )
    :subtasks
    ( ( !DRIVE ?auto_7007 ?auto_7015 ?auto_7009 )
      ( MAKE-2CRATE ?auto_7016 ?auto_7001 ?auto_7002 )
      ( MAKE-1CRATE-VERIFY ?auto_7001 ?auto_7002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7017 - SURFACE
      ?auto_7018 - SURFACE
      ?auto_7019 - SURFACE
    )
    :vars
    (
      ?auto_7032 - HOIST
      ?auto_7024 - PLACE
      ?auto_7021 - PLACE
      ?auto_7029 - HOIST
      ?auto_7025 - SURFACE
      ?auto_7026 - PLACE
      ?auto_7028 - HOIST
      ?auto_7020 - SURFACE
      ?auto_7030 - SURFACE
      ?auto_7031 - PLACE
      ?auto_7023 - HOIST
      ?auto_7022 - SURFACE
      ?auto_7027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7032 ?auto_7024 ) ( IS-CRATE ?auto_7019 ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7017 ?auto_7018 ) ) ( not ( = ?auto_7017 ?auto_7019 ) ) ( not ( = ?auto_7021 ?auto_7024 ) ) ( HOIST-AT ?auto_7029 ?auto_7021 ) ( not ( = ?auto_7032 ?auto_7029 ) ) ( AVAILABLE ?auto_7029 ) ( SURFACE-AT ?auto_7019 ?auto_7021 ) ( ON ?auto_7019 ?auto_7025 ) ( CLEAR ?auto_7019 ) ( not ( = ?auto_7018 ?auto_7025 ) ) ( not ( = ?auto_7019 ?auto_7025 ) ) ( not ( = ?auto_7017 ?auto_7025 ) ) ( IS-CRATE ?auto_7018 ) ( not ( = ?auto_7026 ?auto_7024 ) ) ( not ( = ?auto_7021 ?auto_7026 ) ) ( HOIST-AT ?auto_7028 ?auto_7026 ) ( not ( = ?auto_7032 ?auto_7028 ) ) ( not ( = ?auto_7029 ?auto_7028 ) ) ( AVAILABLE ?auto_7028 ) ( SURFACE-AT ?auto_7018 ?auto_7026 ) ( ON ?auto_7018 ?auto_7020 ) ( CLEAR ?auto_7018 ) ( not ( = ?auto_7018 ?auto_7020 ) ) ( not ( = ?auto_7019 ?auto_7020 ) ) ( not ( = ?auto_7017 ?auto_7020 ) ) ( not ( = ?auto_7025 ?auto_7020 ) ) ( SURFACE-AT ?auto_7030 ?auto_7024 ) ( CLEAR ?auto_7030 ) ( IS-CRATE ?auto_7017 ) ( not ( = ?auto_7030 ?auto_7017 ) ) ( not ( = ?auto_7018 ?auto_7030 ) ) ( not ( = ?auto_7019 ?auto_7030 ) ) ( not ( = ?auto_7025 ?auto_7030 ) ) ( not ( = ?auto_7020 ?auto_7030 ) ) ( AVAILABLE ?auto_7032 ) ( not ( = ?auto_7031 ?auto_7024 ) ) ( not ( = ?auto_7021 ?auto_7031 ) ) ( not ( = ?auto_7026 ?auto_7031 ) ) ( HOIST-AT ?auto_7023 ?auto_7031 ) ( not ( = ?auto_7032 ?auto_7023 ) ) ( not ( = ?auto_7029 ?auto_7023 ) ) ( not ( = ?auto_7028 ?auto_7023 ) ) ( AVAILABLE ?auto_7023 ) ( SURFACE-AT ?auto_7017 ?auto_7031 ) ( ON ?auto_7017 ?auto_7022 ) ( CLEAR ?auto_7017 ) ( not ( = ?auto_7018 ?auto_7022 ) ) ( not ( = ?auto_7019 ?auto_7022 ) ) ( not ( = ?auto_7017 ?auto_7022 ) ) ( not ( = ?auto_7025 ?auto_7022 ) ) ( not ( = ?auto_7020 ?auto_7022 ) ) ( not ( = ?auto_7030 ?auto_7022 ) ) ( TRUCK-AT ?auto_7027 ?auto_7024 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7018 ?auto_7019 )
      ( MAKE-2CRATE-VERIFY ?auto_7017 ?auto_7018 ?auto_7019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7033 - SURFACE
      ?auto_7034 - SURFACE
      ?auto_7035 - SURFACE
      ?auto_7036 - SURFACE
    )
    :vars
    (
      ?auto_7047 - HOIST
      ?auto_7040 - PLACE
      ?auto_7046 - PLACE
      ?auto_7039 - HOIST
      ?auto_7043 - SURFACE
      ?auto_7038 - PLACE
      ?auto_7045 - HOIST
      ?auto_7042 - SURFACE
      ?auto_7037 - PLACE
      ?auto_7041 - HOIST
      ?auto_7044 - SURFACE
      ?auto_7048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7047 ?auto_7040 ) ( IS-CRATE ?auto_7036 ) ( not ( = ?auto_7035 ?auto_7036 ) ) ( not ( = ?auto_7034 ?auto_7035 ) ) ( not ( = ?auto_7034 ?auto_7036 ) ) ( not ( = ?auto_7046 ?auto_7040 ) ) ( HOIST-AT ?auto_7039 ?auto_7046 ) ( not ( = ?auto_7047 ?auto_7039 ) ) ( AVAILABLE ?auto_7039 ) ( SURFACE-AT ?auto_7036 ?auto_7046 ) ( ON ?auto_7036 ?auto_7043 ) ( CLEAR ?auto_7036 ) ( not ( = ?auto_7035 ?auto_7043 ) ) ( not ( = ?auto_7036 ?auto_7043 ) ) ( not ( = ?auto_7034 ?auto_7043 ) ) ( IS-CRATE ?auto_7035 ) ( not ( = ?auto_7038 ?auto_7040 ) ) ( not ( = ?auto_7046 ?auto_7038 ) ) ( HOIST-AT ?auto_7045 ?auto_7038 ) ( not ( = ?auto_7047 ?auto_7045 ) ) ( not ( = ?auto_7039 ?auto_7045 ) ) ( AVAILABLE ?auto_7045 ) ( SURFACE-AT ?auto_7035 ?auto_7038 ) ( ON ?auto_7035 ?auto_7042 ) ( CLEAR ?auto_7035 ) ( not ( = ?auto_7035 ?auto_7042 ) ) ( not ( = ?auto_7036 ?auto_7042 ) ) ( not ( = ?auto_7034 ?auto_7042 ) ) ( not ( = ?auto_7043 ?auto_7042 ) ) ( SURFACE-AT ?auto_7033 ?auto_7040 ) ( CLEAR ?auto_7033 ) ( IS-CRATE ?auto_7034 ) ( not ( = ?auto_7033 ?auto_7034 ) ) ( not ( = ?auto_7035 ?auto_7033 ) ) ( not ( = ?auto_7036 ?auto_7033 ) ) ( not ( = ?auto_7043 ?auto_7033 ) ) ( not ( = ?auto_7042 ?auto_7033 ) ) ( AVAILABLE ?auto_7047 ) ( not ( = ?auto_7037 ?auto_7040 ) ) ( not ( = ?auto_7046 ?auto_7037 ) ) ( not ( = ?auto_7038 ?auto_7037 ) ) ( HOIST-AT ?auto_7041 ?auto_7037 ) ( not ( = ?auto_7047 ?auto_7041 ) ) ( not ( = ?auto_7039 ?auto_7041 ) ) ( not ( = ?auto_7045 ?auto_7041 ) ) ( AVAILABLE ?auto_7041 ) ( SURFACE-AT ?auto_7034 ?auto_7037 ) ( ON ?auto_7034 ?auto_7044 ) ( CLEAR ?auto_7034 ) ( not ( = ?auto_7035 ?auto_7044 ) ) ( not ( = ?auto_7036 ?auto_7044 ) ) ( not ( = ?auto_7034 ?auto_7044 ) ) ( not ( = ?auto_7043 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( not ( = ?auto_7033 ?auto_7044 ) ) ( TRUCK-AT ?auto_7048 ?auto_7040 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7034 ?auto_7035 ?auto_7036 )
      ( MAKE-3CRATE-VERIFY ?auto_7033 ?auto_7034 ?auto_7035 ?auto_7036 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7049 - SURFACE
      ?auto_7050 - SURFACE
      ?auto_7051 - SURFACE
      ?auto_7052 - SURFACE
      ?auto_7053 - SURFACE
    )
    :vars
    (
      ?auto_7064 - HOIST
      ?auto_7057 - PLACE
      ?auto_7063 - PLACE
      ?auto_7056 - HOIST
      ?auto_7060 - SURFACE
      ?auto_7055 - PLACE
      ?auto_7062 - HOIST
      ?auto_7059 - SURFACE
      ?auto_7054 - PLACE
      ?auto_7058 - HOIST
      ?auto_7061 - SURFACE
      ?auto_7065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7064 ?auto_7057 ) ( IS-CRATE ?auto_7053 ) ( not ( = ?auto_7052 ?auto_7053 ) ) ( not ( = ?auto_7051 ?auto_7052 ) ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( not ( = ?auto_7063 ?auto_7057 ) ) ( HOIST-AT ?auto_7056 ?auto_7063 ) ( not ( = ?auto_7064 ?auto_7056 ) ) ( AVAILABLE ?auto_7056 ) ( SURFACE-AT ?auto_7053 ?auto_7063 ) ( ON ?auto_7053 ?auto_7060 ) ( CLEAR ?auto_7053 ) ( not ( = ?auto_7052 ?auto_7060 ) ) ( not ( = ?auto_7053 ?auto_7060 ) ) ( not ( = ?auto_7051 ?auto_7060 ) ) ( IS-CRATE ?auto_7052 ) ( not ( = ?auto_7055 ?auto_7057 ) ) ( not ( = ?auto_7063 ?auto_7055 ) ) ( HOIST-AT ?auto_7062 ?auto_7055 ) ( not ( = ?auto_7064 ?auto_7062 ) ) ( not ( = ?auto_7056 ?auto_7062 ) ) ( AVAILABLE ?auto_7062 ) ( SURFACE-AT ?auto_7052 ?auto_7055 ) ( ON ?auto_7052 ?auto_7059 ) ( CLEAR ?auto_7052 ) ( not ( = ?auto_7052 ?auto_7059 ) ) ( not ( = ?auto_7053 ?auto_7059 ) ) ( not ( = ?auto_7051 ?auto_7059 ) ) ( not ( = ?auto_7060 ?auto_7059 ) ) ( SURFACE-AT ?auto_7050 ?auto_7057 ) ( CLEAR ?auto_7050 ) ( IS-CRATE ?auto_7051 ) ( not ( = ?auto_7050 ?auto_7051 ) ) ( not ( = ?auto_7052 ?auto_7050 ) ) ( not ( = ?auto_7053 ?auto_7050 ) ) ( not ( = ?auto_7060 ?auto_7050 ) ) ( not ( = ?auto_7059 ?auto_7050 ) ) ( AVAILABLE ?auto_7064 ) ( not ( = ?auto_7054 ?auto_7057 ) ) ( not ( = ?auto_7063 ?auto_7054 ) ) ( not ( = ?auto_7055 ?auto_7054 ) ) ( HOIST-AT ?auto_7058 ?auto_7054 ) ( not ( = ?auto_7064 ?auto_7058 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) ( not ( = ?auto_7062 ?auto_7058 ) ) ( AVAILABLE ?auto_7058 ) ( SURFACE-AT ?auto_7051 ?auto_7054 ) ( ON ?auto_7051 ?auto_7061 ) ( CLEAR ?auto_7051 ) ( not ( = ?auto_7052 ?auto_7061 ) ) ( not ( = ?auto_7053 ?auto_7061 ) ) ( not ( = ?auto_7051 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( not ( = ?auto_7059 ?auto_7061 ) ) ( not ( = ?auto_7050 ?auto_7061 ) ) ( TRUCK-AT ?auto_7065 ?auto_7057 ) ( ON ?auto_7050 ?auto_7049 ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( not ( = ?auto_7049 ?auto_7051 ) ) ( not ( = ?auto_7049 ?auto_7052 ) ) ( not ( = ?auto_7049 ?auto_7053 ) ) ( not ( = ?auto_7049 ?auto_7060 ) ) ( not ( = ?auto_7049 ?auto_7059 ) ) ( not ( = ?auto_7049 ?auto_7061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7051 ?auto_7052 ?auto_7053 )
      ( MAKE-4CRATE-VERIFY ?auto_7049 ?auto_7050 ?auto_7051 ?auto_7052 ?auto_7053 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7066 - SURFACE
      ?auto_7067 - SURFACE
    )
    :vars
    (
      ?auto_7079 - HOIST
      ?auto_7071 - PLACE
      ?auto_7081 - SURFACE
      ?auto_7078 - PLACE
      ?auto_7070 - HOIST
      ?auto_7074 - SURFACE
      ?auto_7069 - PLACE
      ?auto_7077 - HOIST
      ?auto_7073 - SURFACE
      ?auto_7075 - SURFACE
      ?auto_7068 - PLACE
      ?auto_7072 - HOIST
      ?auto_7076 - SURFACE
      ?auto_7080 - TRUCK
      ?auto_7082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7079 ?auto_7071 ) ( IS-CRATE ?auto_7067 ) ( not ( = ?auto_7066 ?auto_7067 ) ) ( not ( = ?auto_7081 ?auto_7066 ) ) ( not ( = ?auto_7081 ?auto_7067 ) ) ( not ( = ?auto_7078 ?auto_7071 ) ) ( HOIST-AT ?auto_7070 ?auto_7078 ) ( not ( = ?auto_7079 ?auto_7070 ) ) ( AVAILABLE ?auto_7070 ) ( SURFACE-AT ?auto_7067 ?auto_7078 ) ( ON ?auto_7067 ?auto_7074 ) ( CLEAR ?auto_7067 ) ( not ( = ?auto_7066 ?auto_7074 ) ) ( not ( = ?auto_7067 ?auto_7074 ) ) ( not ( = ?auto_7081 ?auto_7074 ) ) ( IS-CRATE ?auto_7066 ) ( not ( = ?auto_7069 ?auto_7071 ) ) ( not ( = ?auto_7078 ?auto_7069 ) ) ( HOIST-AT ?auto_7077 ?auto_7069 ) ( not ( = ?auto_7079 ?auto_7077 ) ) ( not ( = ?auto_7070 ?auto_7077 ) ) ( AVAILABLE ?auto_7077 ) ( SURFACE-AT ?auto_7066 ?auto_7069 ) ( ON ?auto_7066 ?auto_7073 ) ( CLEAR ?auto_7066 ) ( not ( = ?auto_7066 ?auto_7073 ) ) ( not ( = ?auto_7067 ?auto_7073 ) ) ( not ( = ?auto_7081 ?auto_7073 ) ) ( not ( = ?auto_7074 ?auto_7073 ) ) ( IS-CRATE ?auto_7081 ) ( not ( = ?auto_7075 ?auto_7081 ) ) ( not ( = ?auto_7066 ?auto_7075 ) ) ( not ( = ?auto_7067 ?auto_7075 ) ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( not ( = ?auto_7073 ?auto_7075 ) ) ( not ( = ?auto_7068 ?auto_7071 ) ) ( not ( = ?auto_7078 ?auto_7068 ) ) ( not ( = ?auto_7069 ?auto_7068 ) ) ( HOIST-AT ?auto_7072 ?auto_7068 ) ( not ( = ?auto_7079 ?auto_7072 ) ) ( not ( = ?auto_7070 ?auto_7072 ) ) ( not ( = ?auto_7077 ?auto_7072 ) ) ( AVAILABLE ?auto_7072 ) ( SURFACE-AT ?auto_7081 ?auto_7068 ) ( ON ?auto_7081 ?auto_7076 ) ( CLEAR ?auto_7081 ) ( not ( = ?auto_7066 ?auto_7076 ) ) ( not ( = ?auto_7067 ?auto_7076 ) ) ( not ( = ?auto_7081 ?auto_7076 ) ) ( not ( = ?auto_7074 ?auto_7076 ) ) ( not ( = ?auto_7073 ?auto_7076 ) ) ( not ( = ?auto_7075 ?auto_7076 ) ) ( TRUCK-AT ?auto_7080 ?auto_7071 ) ( SURFACE-AT ?auto_7082 ?auto_7071 ) ( CLEAR ?auto_7082 ) ( LIFTING ?auto_7079 ?auto_7075 ) ( IS-CRATE ?auto_7075 ) ( not ( = ?auto_7082 ?auto_7075 ) ) ( not ( = ?auto_7066 ?auto_7082 ) ) ( not ( = ?auto_7067 ?auto_7082 ) ) ( not ( = ?auto_7081 ?auto_7082 ) ) ( not ( = ?auto_7074 ?auto_7082 ) ) ( not ( = ?auto_7073 ?auto_7082 ) ) ( not ( = ?auto_7076 ?auto_7082 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7082 ?auto_7075 )
      ( MAKE-2CRATE ?auto_7081 ?auto_7066 ?auto_7067 )
      ( MAKE-1CRATE-VERIFY ?auto_7066 ?auto_7067 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7083 - SURFACE
      ?auto_7084 - SURFACE
      ?auto_7085 - SURFACE
    )
    :vars
    (
      ?auto_7086 - HOIST
      ?auto_7094 - PLACE
      ?auto_7091 - PLACE
      ?auto_7093 - HOIST
      ?auto_7096 - SURFACE
      ?auto_7098 - PLACE
      ?auto_7088 - HOIST
      ?auto_7095 - SURFACE
      ?auto_7092 - SURFACE
      ?auto_7099 - PLACE
      ?auto_7089 - HOIST
      ?auto_7090 - SURFACE
      ?auto_7087 - TRUCK
      ?auto_7097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7086 ?auto_7094 ) ( IS-CRATE ?auto_7085 ) ( not ( = ?auto_7084 ?auto_7085 ) ) ( not ( = ?auto_7083 ?auto_7084 ) ) ( not ( = ?auto_7083 ?auto_7085 ) ) ( not ( = ?auto_7091 ?auto_7094 ) ) ( HOIST-AT ?auto_7093 ?auto_7091 ) ( not ( = ?auto_7086 ?auto_7093 ) ) ( AVAILABLE ?auto_7093 ) ( SURFACE-AT ?auto_7085 ?auto_7091 ) ( ON ?auto_7085 ?auto_7096 ) ( CLEAR ?auto_7085 ) ( not ( = ?auto_7084 ?auto_7096 ) ) ( not ( = ?auto_7085 ?auto_7096 ) ) ( not ( = ?auto_7083 ?auto_7096 ) ) ( IS-CRATE ?auto_7084 ) ( not ( = ?auto_7098 ?auto_7094 ) ) ( not ( = ?auto_7091 ?auto_7098 ) ) ( HOIST-AT ?auto_7088 ?auto_7098 ) ( not ( = ?auto_7086 ?auto_7088 ) ) ( not ( = ?auto_7093 ?auto_7088 ) ) ( AVAILABLE ?auto_7088 ) ( SURFACE-AT ?auto_7084 ?auto_7098 ) ( ON ?auto_7084 ?auto_7095 ) ( CLEAR ?auto_7084 ) ( not ( = ?auto_7084 ?auto_7095 ) ) ( not ( = ?auto_7085 ?auto_7095 ) ) ( not ( = ?auto_7083 ?auto_7095 ) ) ( not ( = ?auto_7096 ?auto_7095 ) ) ( IS-CRATE ?auto_7083 ) ( not ( = ?auto_7092 ?auto_7083 ) ) ( not ( = ?auto_7084 ?auto_7092 ) ) ( not ( = ?auto_7085 ?auto_7092 ) ) ( not ( = ?auto_7096 ?auto_7092 ) ) ( not ( = ?auto_7095 ?auto_7092 ) ) ( not ( = ?auto_7099 ?auto_7094 ) ) ( not ( = ?auto_7091 ?auto_7099 ) ) ( not ( = ?auto_7098 ?auto_7099 ) ) ( HOIST-AT ?auto_7089 ?auto_7099 ) ( not ( = ?auto_7086 ?auto_7089 ) ) ( not ( = ?auto_7093 ?auto_7089 ) ) ( not ( = ?auto_7088 ?auto_7089 ) ) ( AVAILABLE ?auto_7089 ) ( SURFACE-AT ?auto_7083 ?auto_7099 ) ( ON ?auto_7083 ?auto_7090 ) ( CLEAR ?auto_7083 ) ( not ( = ?auto_7084 ?auto_7090 ) ) ( not ( = ?auto_7085 ?auto_7090 ) ) ( not ( = ?auto_7083 ?auto_7090 ) ) ( not ( = ?auto_7096 ?auto_7090 ) ) ( not ( = ?auto_7095 ?auto_7090 ) ) ( not ( = ?auto_7092 ?auto_7090 ) ) ( TRUCK-AT ?auto_7087 ?auto_7094 ) ( SURFACE-AT ?auto_7097 ?auto_7094 ) ( CLEAR ?auto_7097 ) ( LIFTING ?auto_7086 ?auto_7092 ) ( IS-CRATE ?auto_7092 ) ( not ( = ?auto_7097 ?auto_7092 ) ) ( not ( = ?auto_7084 ?auto_7097 ) ) ( not ( = ?auto_7085 ?auto_7097 ) ) ( not ( = ?auto_7083 ?auto_7097 ) ) ( not ( = ?auto_7096 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7090 ?auto_7097 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7084 ?auto_7085 )
      ( MAKE-2CRATE-VERIFY ?auto_7083 ?auto_7084 ?auto_7085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7100 - SURFACE
      ?auto_7101 - SURFACE
      ?auto_7102 - SURFACE
      ?auto_7103 - SURFACE
    )
    :vars
    (
      ?auto_7110 - HOIST
      ?auto_7109 - PLACE
      ?auto_7116 - PLACE
      ?auto_7105 - HOIST
      ?auto_7115 - SURFACE
      ?auto_7114 - PLACE
      ?auto_7107 - HOIST
      ?auto_7108 - SURFACE
      ?auto_7112 - PLACE
      ?auto_7113 - HOIST
      ?auto_7104 - SURFACE
      ?auto_7111 - TRUCK
      ?auto_7106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7110 ?auto_7109 ) ( IS-CRATE ?auto_7103 ) ( not ( = ?auto_7102 ?auto_7103 ) ) ( not ( = ?auto_7101 ?auto_7102 ) ) ( not ( = ?auto_7101 ?auto_7103 ) ) ( not ( = ?auto_7116 ?auto_7109 ) ) ( HOIST-AT ?auto_7105 ?auto_7116 ) ( not ( = ?auto_7110 ?auto_7105 ) ) ( AVAILABLE ?auto_7105 ) ( SURFACE-AT ?auto_7103 ?auto_7116 ) ( ON ?auto_7103 ?auto_7115 ) ( CLEAR ?auto_7103 ) ( not ( = ?auto_7102 ?auto_7115 ) ) ( not ( = ?auto_7103 ?auto_7115 ) ) ( not ( = ?auto_7101 ?auto_7115 ) ) ( IS-CRATE ?auto_7102 ) ( not ( = ?auto_7114 ?auto_7109 ) ) ( not ( = ?auto_7116 ?auto_7114 ) ) ( HOIST-AT ?auto_7107 ?auto_7114 ) ( not ( = ?auto_7110 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( AVAILABLE ?auto_7107 ) ( SURFACE-AT ?auto_7102 ?auto_7114 ) ( ON ?auto_7102 ?auto_7108 ) ( CLEAR ?auto_7102 ) ( not ( = ?auto_7102 ?auto_7108 ) ) ( not ( = ?auto_7103 ?auto_7108 ) ) ( not ( = ?auto_7101 ?auto_7108 ) ) ( not ( = ?auto_7115 ?auto_7108 ) ) ( IS-CRATE ?auto_7101 ) ( not ( = ?auto_7100 ?auto_7101 ) ) ( not ( = ?auto_7102 ?auto_7100 ) ) ( not ( = ?auto_7103 ?auto_7100 ) ) ( not ( = ?auto_7115 ?auto_7100 ) ) ( not ( = ?auto_7108 ?auto_7100 ) ) ( not ( = ?auto_7112 ?auto_7109 ) ) ( not ( = ?auto_7116 ?auto_7112 ) ) ( not ( = ?auto_7114 ?auto_7112 ) ) ( HOIST-AT ?auto_7113 ?auto_7112 ) ( not ( = ?auto_7110 ?auto_7113 ) ) ( not ( = ?auto_7105 ?auto_7113 ) ) ( not ( = ?auto_7107 ?auto_7113 ) ) ( AVAILABLE ?auto_7113 ) ( SURFACE-AT ?auto_7101 ?auto_7112 ) ( ON ?auto_7101 ?auto_7104 ) ( CLEAR ?auto_7101 ) ( not ( = ?auto_7102 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7104 ) ) ( not ( = ?auto_7101 ?auto_7104 ) ) ( not ( = ?auto_7115 ?auto_7104 ) ) ( not ( = ?auto_7108 ?auto_7104 ) ) ( not ( = ?auto_7100 ?auto_7104 ) ) ( TRUCK-AT ?auto_7111 ?auto_7109 ) ( SURFACE-AT ?auto_7106 ?auto_7109 ) ( CLEAR ?auto_7106 ) ( LIFTING ?auto_7110 ?auto_7100 ) ( IS-CRATE ?auto_7100 ) ( not ( = ?auto_7106 ?auto_7100 ) ) ( not ( = ?auto_7102 ?auto_7106 ) ) ( not ( = ?auto_7103 ?auto_7106 ) ) ( not ( = ?auto_7101 ?auto_7106 ) ) ( not ( = ?auto_7115 ?auto_7106 ) ) ( not ( = ?auto_7108 ?auto_7106 ) ) ( not ( = ?auto_7104 ?auto_7106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7101 ?auto_7102 ?auto_7103 )
      ( MAKE-3CRATE-VERIFY ?auto_7100 ?auto_7101 ?auto_7102 ?auto_7103 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7117 - SURFACE
      ?auto_7118 - SURFACE
      ?auto_7119 - SURFACE
      ?auto_7120 - SURFACE
      ?auto_7121 - SURFACE
    )
    :vars
    (
      ?auto_7127 - HOIST
      ?auto_7126 - PLACE
      ?auto_7133 - PLACE
      ?auto_7123 - HOIST
      ?auto_7132 - SURFACE
      ?auto_7131 - PLACE
      ?auto_7124 - HOIST
      ?auto_7125 - SURFACE
      ?auto_7129 - PLACE
      ?auto_7130 - HOIST
      ?auto_7122 - SURFACE
      ?auto_7128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7127 ?auto_7126 ) ( IS-CRATE ?auto_7121 ) ( not ( = ?auto_7120 ?auto_7121 ) ) ( not ( = ?auto_7119 ?auto_7120 ) ) ( not ( = ?auto_7119 ?auto_7121 ) ) ( not ( = ?auto_7133 ?auto_7126 ) ) ( HOIST-AT ?auto_7123 ?auto_7133 ) ( not ( = ?auto_7127 ?auto_7123 ) ) ( AVAILABLE ?auto_7123 ) ( SURFACE-AT ?auto_7121 ?auto_7133 ) ( ON ?auto_7121 ?auto_7132 ) ( CLEAR ?auto_7121 ) ( not ( = ?auto_7120 ?auto_7132 ) ) ( not ( = ?auto_7121 ?auto_7132 ) ) ( not ( = ?auto_7119 ?auto_7132 ) ) ( IS-CRATE ?auto_7120 ) ( not ( = ?auto_7131 ?auto_7126 ) ) ( not ( = ?auto_7133 ?auto_7131 ) ) ( HOIST-AT ?auto_7124 ?auto_7131 ) ( not ( = ?auto_7127 ?auto_7124 ) ) ( not ( = ?auto_7123 ?auto_7124 ) ) ( AVAILABLE ?auto_7124 ) ( SURFACE-AT ?auto_7120 ?auto_7131 ) ( ON ?auto_7120 ?auto_7125 ) ( CLEAR ?auto_7120 ) ( not ( = ?auto_7120 ?auto_7125 ) ) ( not ( = ?auto_7121 ?auto_7125 ) ) ( not ( = ?auto_7119 ?auto_7125 ) ) ( not ( = ?auto_7132 ?auto_7125 ) ) ( IS-CRATE ?auto_7119 ) ( not ( = ?auto_7118 ?auto_7119 ) ) ( not ( = ?auto_7120 ?auto_7118 ) ) ( not ( = ?auto_7121 ?auto_7118 ) ) ( not ( = ?auto_7132 ?auto_7118 ) ) ( not ( = ?auto_7125 ?auto_7118 ) ) ( not ( = ?auto_7129 ?auto_7126 ) ) ( not ( = ?auto_7133 ?auto_7129 ) ) ( not ( = ?auto_7131 ?auto_7129 ) ) ( HOIST-AT ?auto_7130 ?auto_7129 ) ( not ( = ?auto_7127 ?auto_7130 ) ) ( not ( = ?auto_7123 ?auto_7130 ) ) ( not ( = ?auto_7124 ?auto_7130 ) ) ( AVAILABLE ?auto_7130 ) ( SURFACE-AT ?auto_7119 ?auto_7129 ) ( ON ?auto_7119 ?auto_7122 ) ( CLEAR ?auto_7119 ) ( not ( = ?auto_7120 ?auto_7122 ) ) ( not ( = ?auto_7121 ?auto_7122 ) ) ( not ( = ?auto_7119 ?auto_7122 ) ) ( not ( = ?auto_7132 ?auto_7122 ) ) ( not ( = ?auto_7125 ?auto_7122 ) ) ( not ( = ?auto_7118 ?auto_7122 ) ) ( TRUCK-AT ?auto_7128 ?auto_7126 ) ( SURFACE-AT ?auto_7117 ?auto_7126 ) ( CLEAR ?auto_7117 ) ( LIFTING ?auto_7127 ?auto_7118 ) ( IS-CRATE ?auto_7118 ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( not ( = ?auto_7120 ?auto_7117 ) ) ( not ( = ?auto_7121 ?auto_7117 ) ) ( not ( = ?auto_7119 ?auto_7117 ) ) ( not ( = ?auto_7132 ?auto_7117 ) ) ( not ( = ?auto_7125 ?auto_7117 ) ) ( not ( = ?auto_7122 ?auto_7117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7119 ?auto_7120 ?auto_7121 )
      ( MAKE-4CRATE-VERIFY ?auto_7117 ?auto_7118 ?auto_7119 ?auto_7120 ?auto_7121 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7134 - SURFACE
      ?auto_7135 - SURFACE
    )
    :vars
    (
      ?auto_7143 - HOIST
      ?auto_7142 - PLACE
      ?auto_7150 - SURFACE
      ?auto_7149 - PLACE
      ?auto_7137 - HOIST
      ?auto_7148 - SURFACE
      ?auto_7147 - PLACE
      ?auto_7140 - HOIST
      ?auto_7141 - SURFACE
      ?auto_7138 - SURFACE
      ?auto_7145 - PLACE
      ?auto_7146 - HOIST
      ?auto_7136 - SURFACE
      ?auto_7144 - TRUCK
      ?auto_7139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7143 ?auto_7142 ) ( IS-CRATE ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( not ( = ?auto_7150 ?auto_7134 ) ) ( not ( = ?auto_7150 ?auto_7135 ) ) ( not ( = ?auto_7149 ?auto_7142 ) ) ( HOIST-AT ?auto_7137 ?auto_7149 ) ( not ( = ?auto_7143 ?auto_7137 ) ) ( AVAILABLE ?auto_7137 ) ( SURFACE-AT ?auto_7135 ?auto_7149 ) ( ON ?auto_7135 ?auto_7148 ) ( CLEAR ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7148 ) ) ( not ( = ?auto_7135 ?auto_7148 ) ) ( not ( = ?auto_7150 ?auto_7148 ) ) ( IS-CRATE ?auto_7134 ) ( not ( = ?auto_7147 ?auto_7142 ) ) ( not ( = ?auto_7149 ?auto_7147 ) ) ( HOIST-AT ?auto_7140 ?auto_7147 ) ( not ( = ?auto_7143 ?auto_7140 ) ) ( not ( = ?auto_7137 ?auto_7140 ) ) ( AVAILABLE ?auto_7140 ) ( SURFACE-AT ?auto_7134 ?auto_7147 ) ( ON ?auto_7134 ?auto_7141 ) ( CLEAR ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7141 ) ) ( not ( = ?auto_7135 ?auto_7141 ) ) ( not ( = ?auto_7150 ?auto_7141 ) ) ( not ( = ?auto_7148 ?auto_7141 ) ) ( IS-CRATE ?auto_7150 ) ( not ( = ?auto_7138 ?auto_7150 ) ) ( not ( = ?auto_7134 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7148 ?auto_7138 ) ) ( not ( = ?auto_7141 ?auto_7138 ) ) ( not ( = ?auto_7145 ?auto_7142 ) ) ( not ( = ?auto_7149 ?auto_7145 ) ) ( not ( = ?auto_7147 ?auto_7145 ) ) ( HOIST-AT ?auto_7146 ?auto_7145 ) ( not ( = ?auto_7143 ?auto_7146 ) ) ( not ( = ?auto_7137 ?auto_7146 ) ) ( not ( = ?auto_7140 ?auto_7146 ) ) ( AVAILABLE ?auto_7146 ) ( SURFACE-AT ?auto_7150 ?auto_7145 ) ( ON ?auto_7150 ?auto_7136 ) ( CLEAR ?auto_7150 ) ( not ( = ?auto_7134 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7150 ?auto_7136 ) ) ( not ( = ?auto_7148 ?auto_7136 ) ) ( not ( = ?auto_7141 ?auto_7136 ) ) ( not ( = ?auto_7138 ?auto_7136 ) ) ( TRUCK-AT ?auto_7144 ?auto_7142 ) ( SURFACE-AT ?auto_7139 ?auto_7142 ) ( CLEAR ?auto_7139 ) ( IS-CRATE ?auto_7138 ) ( not ( = ?auto_7139 ?auto_7138 ) ) ( not ( = ?auto_7134 ?auto_7139 ) ) ( not ( = ?auto_7135 ?auto_7139 ) ) ( not ( = ?auto_7150 ?auto_7139 ) ) ( not ( = ?auto_7148 ?auto_7139 ) ) ( not ( = ?auto_7141 ?auto_7139 ) ) ( not ( = ?auto_7136 ?auto_7139 ) ) ( AVAILABLE ?auto_7143 ) ( IN ?auto_7138 ?auto_7144 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7143 ?auto_7138 ?auto_7144 ?auto_7142 )
      ( MAKE-2CRATE ?auto_7150 ?auto_7134 ?auto_7135 )
      ( MAKE-1CRATE-VERIFY ?auto_7134 ?auto_7135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7151 - SURFACE
      ?auto_7152 - SURFACE
      ?auto_7153 - SURFACE
    )
    :vars
    (
      ?auto_7160 - HOIST
      ?auto_7165 - PLACE
      ?auto_7162 - PLACE
      ?auto_7156 - HOIST
      ?auto_7154 - SURFACE
      ?auto_7159 - PLACE
      ?auto_7155 - HOIST
      ?auto_7164 - SURFACE
      ?auto_7167 - SURFACE
      ?auto_7157 - PLACE
      ?auto_7163 - HOIST
      ?auto_7158 - SURFACE
      ?auto_7161 - TRUCK
      ?auto_7166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7160 ?auto_7165 ) ( IS-CRATE ?auto_7153 ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7162 ?auto_7165 ) ) ( HOIST-AT ?auto_7156 ?auto_7162 ) ( not ( = ?auto_7160 ?auto_7156 ) ) ( AVAILABLE ?auto_7156 ) ( SURFACE-AT ?auto_7153 ?auto_7162 ) ( ON ?auto_7153 ?auto_7154 ) ( CLEAR ?auto_7153 ) ( not ( = ?auto_7152 ?auto_7154 ) ) ( not ( = ?auto_7153 ?auto_7154 ) ) ( not ( = ?auto_7151 ?auto_7154 ) ) ( IS-CRATE ?auto_7152 ) ( not ( = ?auto_7159 ?auto_7165 ) ) ( not ( = ?auto_7162 ?auto_7159 ) ) ( HOIST-AT ?auto_7155 ?auto_7159 ) ( not ( = ?auto_7160 ?auto_7155 ) ) ( not ( = ?auto_7156 ?auto_7155 ) ) ( AVAILABLE ?auto_7155 ) ( SURFACE-AT ?auto_7152 ?auto_7159 ) ( ON ?auto_7152 ?auto_7164 ) ( CLEAR ?auto_7152 ) ( not ( = ?auto_7152 ?auto_7164 ) ) ( not ( = ?auto_7153 ?auto_7164 ) ) ( not ( = ?auto_7151 ?auto_7164 ) ) ( not ( = ?auto_7154 ?auto_7164 ) ) ( IS-CRATE ?auto_7151 ) ( not ( = ?auto_7167 ?auto_7151 ) ) ( not ( = ?auto_7152 ?auto_7167 ) ) ( not ( = ?auto_7153 ?auto_7167 ) ) ( not ( = ?auto_7154 ?auto_7167 ) ) ( not ( = ?auto_7164 ?auto_7167 ) ) ( not ( = ?auto_7157 ?auto_7165 ) ) ( not ( = ?auto_7162 ?auto_7157 ) ) ( not ( = ?auto_7159 ?auto_7157 ) ) ( HOIST-AT ?auto_7163 ?auto_7157 ) ( not ( = ?auto_7160 ?auto_7163 ) ) ( not ( = ?auto_7156 ?auto_7163 ) ) ( not ( = ?auto_7155 ?auto_7163 ) ) ( AVAILABLE ?auto_7163 ) ( SURFACE-AT ?auto_7151 ?auto_7157 ) ( ON ?auto_7151 ?auto_7158 ) ( CLEAR ?auto_7151 ) ( not ( = ?auto_7152 ?auto_7158 ) ) ( not ( = ?auto_7153 ?auto_7158 ) ) ( not ( = ?auto_7151 ?auto_7158 ) ) ( not ( = ?auto_7154 ?auto_7158 ) ) ( not ( = ?auto_7164 ?auto_7158 ) ) ( not ( = ?auto_7167 ?auto_7158 ) ) ( TRUCK-AT ?auto_7161 ?auto_7165 ) ( SURFACE-AT ?auto_7166 ?auto_7165 ) ( CLEAR ?auto_7166 ) ( IS-CRATE ?auto_7167 ) ( not ( = ?auto_7166 ?auto_7167 ) ) ( not ( = ?auto_7152 ?auto_7166 ) ) ( not ( = ?auto_7153 ?auto_7166 ) ) ( not ( = ?auto_7151 ?auto_7166 ) ) ( not ( = ?auto_7154 ?auto_7166 ) ) ( not ( = ?auto_7164 ?auto_7166 ) ) ( not ( = ?auto_7158 ?auto_7166 ) ) ( AVAILABLE ?auto_7160 ) ( IN ?auto_7167 ?auto_7161 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7152 ?auto_7153 )
      ( MAKE-2CRATE-VERIFY ?auto_7151 ?auto_7152 ?auto_7153 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7168 - SURFACE
      ?auto_7169 - SURFACE
      ?auto_7170 - SURFACE
      ?auto_7171 - SURFACE
    )
    :vars
    (
      ?auto_7175 - HOIST
      ?auto_7181 - PLACE
      ?auto_7176 - PLACE
      ?auto_7182 - HOIST
      ?auto_7174 - SURFACE
      ?auto_7178 - PLACE
      ?auto_7173 - HOIST
      ?auto_7179 - SURFACE
      ?auto_7184 - PLACE
      ?auto_7172 - HOIST
      ?auto_7177 - SURFACE
      ?auto_7183 - TRUCK
      ?auto_7180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7175 ?auto_7181 ) ( IS-CRATE ?auto_7171 ) ( not ( = ?auto_7170 ?auto_7171 ) ) ( not ( = ?auto_7169 ?auto_7170 ) ) ( not ( = ?auto_7169 ?auto_7171 ) ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( HOIST-AT ?auto_7182 ?auto_7176 ) ( not ( = ?auto_7175 ?auto_7182 ) ) ( AVAILABLE ?auto_7182 ) ( SURFACE-AT ?auto_7171 ?auto_7176 ) ( ON ?auto_7171 ?auto_7174 ) ( CLEAR ?auto_7171 ) ( not ( = ?auto_7170 ?auto_7174 ) ) ( not ( = ?auto_7171 ?auto_7174 ) ) ( not ( = ?auto_7169 ?auto_7174 ) ) ( IS-CRATE ?auto_7170 ) ( not ( = ?auto_7178 ?auto_7181 ) ) ( not ( = ?auto_7176 ?auto_7178 ) ) ( HOIST-AT ?auto_7173 ?auto_7178 ) ( not ( = ?auto_7175 ?auto_7173 ) ) ( not ( = ?auto_7182 ?auto_7173 ) ) ( AVAILABLE ?auto_7173 ) ( SURFACE-AT ?auto_7170 ?auto_7178 ) ( ON ?auto_7170 ?auto_7179 ) ( CLEAR ?auto_7170 ) ( not ( = ?auto_7170 ?auto_7179 ) ) ( not ( = ?auto_7171 ?auto_7179 ) ) ( not ( = ?auto_7169 ?auto_7179 ) ) ( not ( = ?auto_7174 ?auto_7179 ) ) ( IS-CRATE ?auto_7169 ) ( not ( = ?auto_7168 ?auto_7169 ) ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( not ( = ?auto_7171 ?auto_7168 ) ) ( not ( = ?auto_7174 ?auto_7168 ) ) ( not ( = ?auto_7179 ?auto_7168 ) ) ( not ( = ?auto_7184 ?auto_7181 ) ) ( not ( = ?auto_7176 ?auto_7184 ) ) ( not ( = ?auto_7178 ?auto_7184 ) ) ( HOIST-AT ?auto_7172 ?auto_7184 ) ( not ( = ?auto_7175 ?auto_7172 ) ) ( not ( = ?auto_7182 ?auto_7172 ) ) ( not ( = ?auto_7173 ?auto_7172 ) ) ( AVAILABLE ?auto_7172 ) ( SURFACE-AT ?auto_7169 ?auto_7184 ) ( ON ?auto_7169 ?auto_7177 ) ( CLEAR ?auto_7169 ) ( not ( = ?auto_7170 ?auto_7177 ) ) ( not ( = ?auto_7171 ?auto_7177 ) ) ( not ( = ?auto_7169 ?auto_7177 ) ) ( not ( = ?auto_7174 ?auto_7177 ) ) ( not ( = ?auto_7179 ?auto_7177 ) ) ( not ( = ?auto_7168 ?auto_7177 ) ) ( TRUCK-AT ?auto_7183 ?auto_7181 ) ( SURFACE-AT ?auto_7180 ?auto_7181 ) ( CLEAR ?auto_7180 ) ( IS-CRATE ?auto_7168 ) ( not ( = ?auto_7180 ?auto_7168 ) ) ( not ( = ?auto_7170 ?auto_7180 ) ) ( not ( = ?auto_7171 ?auto_7180 ) ) ( not ( = ?auto_7169 ?auto_7180 ) ) ( not ( = ?auto_7174 ?auto_7180 ) ) ( not ( = ?auto_7179 ?auto_7180 ) ) ( not ( = ?auto_7177 ?auto_7180 ) ) ( AVAILABLE ?auto_7175 ) ( IN ?auto_7168 ?auto_7183 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7169 ?auto_7170 ?auto_7171 )
      ( MAKE-3CRATE-VERIFY ?auto_7168 ?auto_7169 ?auto_7170 ?auto_7171 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7185 - SURFACE
      ?auto_7186 - SURFACE
      ?auto_7187 - SURFACE
      ?auto_7188 - SURFACE
      ?auto_7189 - SURFACE
    )
    :vars
    (
      ?auto_7193 - HOIST
      ?auto_7198 - PLACE
      ?auto_7194 - PLACE
      ?auto_7199 - HOIST
      ?auto_7192 - SURFACE
      ?auto_7196 - PLACE
      ?auto_7191 - HOIST
      ?auto_7197 - SURFACE
      ?auto_7201 - PLACE
      ?auto_7190 - HOIST
      ?auto_7195 - SURFACE
      ?auto_7200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7193 ?auto_7198 ) ( IS-CRATE ?auto_7189 ) ( not ( = ?auto_7188 ?auto_7189 ) ) ( not ( = ?auto_7187 ?auto_7188 ) ) ( not ( = ?auto_7187 ?auto_7189 ) ) ( not ( = ?auto_7194 ?auto_7198 ) ) ( HOIST-AT ?auto_7199 ?auto_7194 ) ( not ( = ?auto_7193 ?auto_7199 ) ) ( AVAILABLE ?auto_7199 ) ( SURFACE-AT ?auto_7189 ?auto_7194 ) ( ON ?auto_7189 ?auto_7192 ) ( CLEAR ?auto_7189 ) ( not ( = ?auto_7188 ?auto_7192 ) ) ( not ( = ?auto_7189 ?auto_7192 ) ) ( not ( = ?auto_7187 ?auto_7192 ) ) ( IS-CRATE ?auto_7188 ) ( not ( = ?auto_7196 ?auto_7198 ) ) ( not ( = ?auto_7194 ?auto_7196 ) ) ( HOIST-AT ?auto_7191 ?auto_7196 ) ( not ( = ?auto_7193 ?auto_7191 ) ) ( not ( = ?auto_7199 ?auto_7191 ) ) ( AVAILABLE ?auto_7191 ) ( SURFACE-AT ?auto_7188 ?auto_7196 ) ( ON ?auto_7188 ?auto_7197 ) ( CLEAR ?auto_7188 ) ( not ( = ?auto_7188 ?auto_7197 ) ) ( not ( = ?auto_7189 ?auto_7197 ) ) ( not ( = ?auto_7187 ?auto_7197 ) ) ( not ( = ?auto_7192 ?auto_7197 ) ) ( IS-CRATE ?auto_7187 ) ( not ( = ?auto_7186 ?auto_7187 ) ) ( not ( = ?auto_7188 ?auto_7186 ) ) ( not ( = ?auto_7189 ?auto_7186 ) ) ( not ( = ?auto_7192 ?auto_7186 ) ) ( not ( = ?auto_7197 ?auto_7186 ) ) ( not ( = ?auto_7201 ?auto_7198 ) ) ( not ( = ?auto_7194 ?auto_7201 ) ) ( not ( = ?auto_7196 ?auto_7201 ) ) ( HOIST-AT ?auto_7190 ?auto_7201 ) ( not ( = ?auto_7193 ?auto_7190 ) ) ( not ( = ?auto_7199 ?auto_7190 ) ) ( not ( = ?auto_7191 ?auto_7190 ) ) ( AVAILABLE ?auto_7190 ) ( SURFACE-AT ?auto_7187 ?auto_7201 ) ( ON ?auto_7187 ?auto_7195 ) ( CLEAR ?auto_7187 ) ( not ( = ?auto_7188 ?auto_7195 ) ) ( not ( = ?auto_7189 ?auto_7195 ) ) ( not ( = ?auto_7187 ?auto_7195 ) ) ( not ( = ?auto_7192 ?auto_7195 ) ) ( not ( = ?auto_7197 ?auto_7195 ) ) ( not ( = ?auto_7186 ?auto_7195 ) ) ( TRUCK-AT ?auto_7200 ?auto_7198 ) ( SURFACE-AT ?auto_7185 ?auto_7198 ) ( CLEAR ?auto_7185 ) ( IS-CRATE ?auto_7186 ) ( not ( = ?auto_7185 ?auto_7186 ) ) ( not ( = ?auto_7188 ?auto_7185 ) ) ( not ( = ?auto_7189 ?auto_7185 ) ) ( not ( = ?auto_7187 ?auto_7185 ) ) ( not ( = ?auto_7192 ?auto_7185 ) ) ( not ( = ?auto_7197 ?auto_7185 ) ) ( not ( = ?auto_7195 ?auto_7185 ) ) ( AVAILABLE ?auto_7193 ) ( IN ?auto_7186 ?auto_7200 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7187 ?auto_7188 ?auto_7189 )
      ( MAKE-4CRATE-VERIFY ?auto_7185 ?auto_7186 ?auto_7187 ?auto_7188 ?auto_7189 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7202 - SURFACE
      ?auto_7203 - SURFACE
    )
    :vars
    (
      ?auto_7207 - HOIST
      ?auto_7214 - PLACE
      ?auto_7218 - SURFACE
      ?auto_7208 - PLACE
      ?auto_7215 - HOIST
      ?auto_7206 - SURFACE
      ?auto_7210 - PLACE
      ?auto_7205 - HOIST
      ?auto_7211 - SURFACE
      ?auto_7212 - SURFACE
      ?auto_7217 - PLACE
      ?auto_7204 - HOIST
      ?auto_7209 - SURFACE
      ?auto_7213 - SURFACE
      ?auto_7216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7207 ?auto_7214 ) ( IS-CRATE ?auto_7203 ) ( not ( = ?auto_7202 ?auto_7203 ) ) ( not ( = ?auto_7218 ?auto_7202 ) ) ( not ( = ?auto_7218 ?auto_7203 ) ) ( not ( = ?auto_7208 ?auto_7214 ) ) ( HOIST-AT ?auto_7215 ?auto_7208 ) ( not ( = ?auto_7207 ?auto_7215 ) ) ( AVAILABLE ?auto_7215 ) ( SURFACE-AT ?auto_7203 ?auto_7208 ) ( ON ?auto_7203 ?auto_7206 ) ( CLEAR ?auto_7203 ) ( not ( = ?auto_7202 ?auto_7206 ) ) ( not ( = ?auto_7203 ?auto_7206 ) ) ( not ( = ?auto_7218 ?auto_7206 ) ) ( IS-CRATE ?auto_7202 ) ( not ( = ?auto_7210 ?auto_7214 ) ) ( not ( = ?auto_7208 ?auto_7210 ) ) ( HOIST-AT ?auto_7205 ?auto_7210 ) ( not ( = ?auto_7207 ?auto_7205 ) ) ( not ( = ?auto_7215 ?auto_7205 ) ) ( AVAILABLE ?auto_7205 ) ( SURFACE-AT ?auto_7202 ?auto_7210 ) ( ON ?auto_7202 ?auto_7211 ) ( CLEAR ?auto_7202 ) ( not ( = ?auto_7202 ?auto_7211 ) ) ( not ( = ?auto_7203 ?auto_7211 ) ) ( not ( = ?auto_7218 ?auto_7211 ) ) ( not ( = ?auto_7206 ?auto_7211 ) ) ( IS-CRATE ?auto_7218 ) ( not ( = ?auto_7212 ?auto_7218 ) ) ( not ( = ?auto_7202 ?auto_7212 ) ) ( not ( = ?auto_7203 ?auto_7212 ) ) ( not ( = ?auto_7206 ?auto_7212 ) ) ( not ( = ?auto_7211 ?auto_7212 ) ) ( not ( = ?auto_7217 ?auto_7214 ) ) ( not ( = ?auto_7208 ?auto_7217 ) ) ( not ( = ?auto_7210 ?auto_7217 ) ) ( HOIST-AT ?auto_7204 ?auto_7217 ) ( not ( = ?auto_7207 ?auto_7204 ) ) ( not ( = ?auto_7215 ?auto_7204 ) ) ( not ( = ?auto_7205 ?auto_7204 ) ) ( AVAILABLE ?auto_7204 ) ( SURFACE-AT ?auto_7218 ?auto_7217 ) ( ON ?auto_7218 ?auto_7209 ) ( CLEAR ?auto_7218 ) ( not ( = ?auto_7202 ?auto_7209 ) ) ( not ( = ?auto_7203 ?auto_7209 ) ) ( not ( = ?auto_7218 ?auto_7209 ) ) ( not ( = ?auto_7206 ?auto_7209 ) ) ( not ( = ?auto_7211 ?auto_7209 ) ) ( not ( = ?auto_7212 ?auto_7209 ) ) ( SURFACE-AT ?auto_7213 ?auto_7214 ) ( CLEAR ?auto_7213 ) ( IS-CRATE ?auto_7212 ) ( not ( = ?auto_7213 ?auto_7212 ) ) ( not ( = ?auto_7202 ?auto_7213 ) ) ( not ( = ?auto_7203 ?auto_7213 ) ) ( not ( = ?auto_7218 ?auto_7213 ) ) ( not ( = ?auto_7206 ?auto_7213 ) ) ( not ( = ?auto_7211 ?auto_7213 ) ) ( not ( = ?auto_7209 ?auto_7213 ) ) ( AVAILABLE ?auto_7207 ) ( IN ?auto_7212 ?auto_7216 ) ( TRUCK-AT ?auto_7216 ?auto_7208 ) )
    :subtasks
    ( ( !DRIVE ?auto_7216 ?auto_7208 ?auto_7214 )
      ( MAKE-2CRATE ?auto_7218 ?auto_7202 ?auto_7203 )
      ( MAKE-1CRATE-VERIFY ?auto_7202 ?auto_7203 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7219 - SURFACE
      ?auto_7220 - SURFACE
      ?auto_7221 - SURFACE
    )
    :vars
    (
      ?auto_7227 - HOIST
      ?auto_7234 - PLACE
      ?auto_7223 - PLACE
      ?auto_7229 - HOIST
      ?auto_7231 - SURFACE
      ?auto_7225 - PLACE
      ?auto_7226 - HOIST
      ?auto_7228 - SURFACE
      ?auto_7224 - SURFACE
      ?auto_7233 - PLACE
      ?auto_7235 - HOIST
      ?auto_7222 - SURFACE
      ?auto_7230 - SURFACE
      ?auto_7232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7227 ?auto_7234 ) ( IS-CRATE ?auto_7221 ) ( not ( = ?auto_7220 ?auto_7221 ) ) ( not ( = ?auto_7219 ?auto_7220 ) ) ( not ( = ?auto_7219 ?auto_7221 ) ) ( not ( = ?auto_7223 ?auto_7234 ) ) ( HOIST-AT ?auto_7229 ?auto_7223 ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( AVAILABLE ?auto_7229 ) ( SURFACE-AT ?auto_7221 ?auto_7223 ) ( ON ?auto_7221 ?auto_7231 ) ( CLEAR ?auto_7221 ) ( not ( = ?auto_7220 ?auto_7231 ) ) ( not ( = ?auto_7221 ?auto_7231 ) ) ( not ( = ?auto_7219 ?auto_7231 ) ) ( IS-CRATE ?auto_7220 ) ( not ( = ?auto_7225 ?auto_7234 ) ) ( not ( = ?auto_7223 ?auto_7225 ) ) ( HOIST-AT ?auto_7226 ?auto_7225 ) ( not ( = ?auto_7227 ?auto_7226 ) ) ( not ( = ?auto_7229 ?auto_7226 ) ) ( AVAILABLE ?auto_7226 ) ( SURFACE-AT ?auto_7220 ?auto_7225 ) ( ON ?auto_7220 ?auto_7228 ) ( CLEAR ?auto_7220 ) ( not ( = ?auto_7220 ?auto_7228 ) ) ( not ( = ?auto_7221 ?auto_7228 ) ) ( not ( = ?auto_7219 ?auto_7228 ) ) ( not ( = ?auto_7231 ?auto_7228 ) ) ( IS-CRATE ?auto_7219 ) ( not ( = ?auto_7224 ?auto_7219 ) ) ( not ( = ?auto_7220 ?auto_7224 ) ) ( not ( = ?auto_7221 ?auto_7224 ) ) ( not ( = ?auto_7231 ?auto_7224 ) ) ( not ( = ?auto_7228 ?auto_7224 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( not ( = ?auto_7223 ?auto_7233 ) ) ( not ( = ?auto_7225 ?auto_7233 ) ) ( HOIST-AT ?auto_7235 ?auto_7233 ) ( not ( = ?auto_7227 ?auto_7235 ) ) ( not ( = ?auto_7229 ?auto_7235 ) ) ( not ( = ?auto_7226 ?auto_7235 ) ) ( AVAILABLE ?auto_7235 ) ( SURFACE-AT ?auto_7219 ?auto_7233 ) ( ON ?auto_7219 ?auto_7222 ) ( CLEAR ?auto_7219 ) ( not ( = ?auto_7220 ?auto_7222 ) ) ( not ( = ?auto_7221 ?auto_7222 ) ) ( not ( = ?auto_7219 ?auto_7222 ) ) ( not ( = ?auto_7231 ?auto_7222 ) ) ( not ( = ?auto_7228 ?auto_7222 ) ) ( not ( = ?auto_7224 ?auto_7222 ) ) ( SURFACE-AT ?auto_7230 ?auto_7234 ) ( CLEAR ?auto_7230 ) ( IS-CRATE ?auto_7224 ) ( not ( = ?auto_7230 ?auto_7224 ) ) ( not ( = ?auto_7220 ?auto_7230 ) ) ( not ( = ?auto_7221 ?auto_7230 ) ) ( not ( = ?auto_7219 ?auto_7230 ) ) ( not ( = ?auto_7231 ?auto_7230 ) ) ( not ( = ?auto_7228 ?auto_7230 ) ) ( not ( = ?auto_7222 ?auto_7230 ) ) ( AVAILABLE ?auto_7227 ) ( IN ?auto_7224 ?auto_7232 ) ( TRUCK-AT ?auto_7232 ?auto_7223 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7220 ?auto_7221 )
      ( MAKE-2CRATE-VERIFY ?auto_7219 ?auto_7220 ?auto_7221 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7236 - SURFACE
      ?auto_7237 - SURFACE
      ?auto_7238 - SURFACE
      ?auto_7239 - SURFACE
    )
    :vars
    (
      ?auto_7243 - HOIST
      ?auto_7250 - PLACE
      ?auto_7244 - PLACE
      ?auto_7252 - HOIST
      ?auto_7247 - SURFACE
      ?auto_7242 - PLACE
      ?auto_7245 - HOIST
      ?auto_7248 - SURFACE
      ?auto_7240 - PLACE
      ?auto_7251 - HOIST
      ?auto_7241 - SURFACE
      ?auto_7246 - SURFACE
      ?auto_7249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7243 ?auto_7250 ) ( IS-CRATE ?auto_7239 ) ( not ( = ?auto_7238 ?auto_7239 ) ) ( not ( = ?auto_7237 ?auto_7238 ) ) ( not ( = ?auto_7237 ?auto_7239 ) ) ( not ( = ?auto_7244 ?auto_7250 ) ) ( HOIST-AT ?auto_7252 ?auto_7244 ) ( not ( = ?auto_7243 ?auto_7252 ) ) ( AVAILABLE ?auto_7252 ) ( SURFACE-AT ?auto_7239 ?auto_7244 ) ( ON ?auto_7239 ?auto_7247 ) ( CLEAR ?auto_7239 ) ( not ( = ?auto_7238 ?auto_7247 ) ) ( not ( = ?auto_7239 ?auto_7247 ) ) ( not ( = ?auto_7237 ?auto_7247 ) ) ( IS-CRATE ?auto_7238 ) ( not ( = ?auto_7242 ?auto_7250 ) ) ( not ( = ?auto_7244 ?auto_7242 ) ) ( HOIST-AT ?auto_7245 ?auto_7242 ) ( not ( = ?auto_7243 ?auto_7245 ) ) ( not ( = ?auto_7252 ?auto_7245 ) ) ( AVAILABLE ?auto_7245 ) ( SURFACE-AT ?auto_7238 ?auto_7242 ) ( ON ?auto_7238 ?auto_7248 ) ( CLEAR ?auto_7238 ) ( not ( = ?auto_7238 ?auto_7248 ) ) ( not ( = ?auto_7239 ?auto_7248 ) ) ( not ( = ?auto_7237 ?auto_7248 ) ) ( not ( = ?auto_7247 ?auto_7248 ) ) ( IS-CRATE ?auto_7237 ) ( not ( = ?auto_7236 ?auto_7237 ) ) ( not ( = ?auto_7238 ?auto_7236 ) ) ( not ( = ?auto_7239 ?auto_7236 ) ) ( not ( = ?auto_7247 ?auto_7236 ) ) ( not ( = ?auto_7248 ?auto_7236 ) ) ( not ( = ?auto_7240 ?auto_7250 ) ) ( not ( = ?auto_7244 ?auto_7240 ) ) ( not ( = ?auto_7242 ?auto_7240 ) ) ( HOIST-AT ?auto_7251 ?auto_7240 ) ( not ( = ?auto_7243 ?auto_7251 ) ) ( not ( = ?auto_7252 ?auto_7251 ) ) ( not ( = ?auto_7245 ?auto_7251 ) ) ( AVAILABLE ?auto_7251 ) ( SURFACE-AT ?auto_7237 ?auto_7240 ) ( ON ?auto_7237 ?auto_7241 ) ( CLEAR ?auto_7237 ) ( not ( = ?auto_7238 ?auto_7241 ) ) ( not ( = ?auto_7239 ?auto_7241 ) ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( not ( = ?auto_7247 ?auto_7241 ) ) ( not ( = ?auto_7248 ?auto_7241 ) ) ( not ( = ?auto_7236 ?auto_7241 ) ) ( SURFACE-AT ?auto_7246 ?auto_7250 ) ( CLEAR ?auto_7246 ) ( IS-CRATE ?auto_7236 ) ( not ( = ?auto_7246 ?auto_7236 ) ) ( not ( = ?auto_7238 ?auto_7246 ) ) ( not ( = ?auto_7239 ?auto_7246 ) ) ( not ( = ?auto_7237 ?auto_7246 ) ) ( not ( = ?auto_7247 ?auto_7246 ) ) ( not ( = ?auto_7248 ?auto_7246 ) ) ( not ( = ?auto_7241 ?auto_7246 ) ) ( AVAILABLE ?auto_7243 ) ( IN ?auto_7236 ?auto_7249 ) ( TRUCK-AT ?auto_7249 ?auto_7244 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7237 ?auto_7238 ?auto_7239 )
      ( MAKE-3CRATE-VERIFY ?auto_7236 ?auto_7237 ?auto_7238 ?auto_7239 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7253 - SURFACE
      ?auto_7254 - SURFACE
      ?auto_7255 - SURFACE
      ?auto_7256 - SURFACE
      ?auto_7257 - SURFACE
    )
    :vars
    (
      ?auto_7261 - HOIST
      ?auto_7267 - PLACE
      ?auto_7262 - PLACE
      ?auto_7269 - HOIST
      ?auto_7264 - SURFACE
      ?auto_7260 - PLACE
      ?auto_7263 - HOIST
      ?auto_7265 - SURFACE
      ?auto_7258 - PLACE
      ?auto_7268 - HOIST
      ?auto_7259 - SURFACE
      ?auto_7266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7261 ?auto_7267 ) ( IS-CRATE ?auto_7257 ) ( not ( = ?auto_7256 ?auto_7257 ) ) ( not ( = ?auto_7255 ?auto_7256 ) ) ( not ( = ?auto_7255 ?auto_7257 ) ) ( not ( = ?auto_7262 ?auto_7267 ) ) ( HOIST-AT ?auto_7269 ?auto_7262 ) ( not ( = ?auto_7261 ?auto_7269 ) ) ( AVAILABLE ?auto_7269 ) ( SURFACE-AT ?auto_7257 ?auto_7262 ) ( ON ?auto_7257 ?auto_7264 ) ( CLEAR ?auto_7257 ) ( not ( = ?auto_7256 ?auto_7264 ) ) ( not ( = ?auto_7257 ?auto_7264 ) ) ( not ( = ?auto_7255 ?auto_7264 ) ) ( IS-CRATE ?auto_7256 ) ( not ( = ?auto_7260 ?auto_7267 ) ) ( not ( = ?auto_7262 ?auto_7260 ) ) ( HOIST-AT ?auto_7263 ?auto_7260 ) ( not ( = ?auto_7261 ?auto_7263 ) ) ( not ( = ?auto_7269 ?auto_7263 ) ) ( AVAILABLE ?auto_7263 ) ( SURFACE-AT ?auto_7256 ?auto_7260 ) ( ON ?auto_7256 ?auto_7265 ) ( CLEAR ?auto_7256 ) ( not ( = ?auto_7256 ?auto_7265 ) ) ( not ( = ?auto_7257 ?auto_7265 ) ) ( not ( = ?auto_7255 ?auto_7265 ) ) ( not ( = ?auto_7264 ?auto_7265 ) ) ( IS-CRATE ?auto_7255 ) ( not ( = ?auto_7254 ?auto_7255 ) ) ( not ( = ?auto_7256 ?auto_7254 ) ) ( not ( = ?auto_7257 ?auto_7254 ) ) ( not ( = ?auto_7264 ?auto_7254 ) ) ( not ( = ?auto_7265 ?auto_7254 ) ) ( not ( = ?auto_7258 ?auto_7267 ) ) ( not ( = ?auto_7262 ?auto_7258 ) ) ( not ( = ?auto_7260 ?auto_7258 ) ) ( HOIST-AT ?auto_7268 ?auto_7258 ) ( not ( = ?auto_7261 ?auto_7268 ) ) ( not ( = ?auto_7269 ?auto_7268 ) ) ( not ( = ?auto_7263 ?auto_7268 ) ) ( AVAILABLE ?auto_7268 ) ( SURFACE-AT ?auto_7255 ?auto_7258 ) ( ON ?auto_7255 ?auto_7259 ) ( CLEAR ?auto_7255 ) ( not ( = ?auto_7256 ?auto_7259 ) ) ( not ( = ?auto_7257 ?auto_7259 ) ) ( not ( = ?auto_7255 ?auto_7259 ) ) ( not ( = ?auto_7264 ?auto_7259 ) ) ( not ( = ?auto_7265 ?auto_7259 ) ) ( not ( = ?auto_7254 ?auto_7259 ) ) ( SURFACE-AT ?auto_7253 ?auto_7267 ) ( CLEAR ?auto_7253 ) ( IS-CRATE ?auto_7254 ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( not ( = ?auto_7256 ?auto_7253 ) ) ( not ( = ?auto_7257 ?auto_7253 ) ) ( not ( = ?auto_7255 ?auto_7253 ) ) ( not ( = ?auto_7264 ?auto_7253 ) ) ( not ( = ?auto_7265 ?auto_7253 ) ) ( not ( = ?auto_7259 ?auto_7253 ) ) ( AVAILABLE ?auto_7261 ) ( IN ?auto_7254 ?auto_7266 ) ( TRUCK-AT ?auto_7266 ?auto_7262 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7255 ?auto_7256 ?auto_7257 )
      ( MAKE-4CRATE-VERIFY ?auto_7253 ?auto_7254 ?auto_7255 ?auto_7256 ?auto_7257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7270 - SURFACE
      ?auto_7271 - SURFACE
    )
    :vars
    (
      ?auto_7275 - HOIST
      ?auto_7284 - PLACE
      ?auto_7276 - SURFACE
      ?auto_7277 - PLACE
      ?auto_7286 - HOIST
      ?auto_7281 - SURFACE
      ?auto_7274 - PLACE
      ?auto_7279 - HOIST
      ?auto_7282 - SURFACE
      ?auto_7278 - SURFACE
      ?auto_7272 - PLACE
      ?auto_7285 - HOIST
      ?auto_7273 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7275 ?auto_7284 ) ( IS-CRATE ?auto_7271 ) ( not ( = ?auto_7270 ?auto_7271 ) ) ( not ( = ?auto_7276 ?auto_7270 ) ) ( not ( = ?auto_7276 ?auto_7271 ) ) ( not ( = ?auto_7277 ?auto_7284 ) ) ( HOIST-AT ?auto_7286 ?auto_7277 ) ( not ( = ?auto_7275 ?auto_7286 ) ) ( SURFACE-AT ?auto_7271 ?auto_7277 ) ( ON ?auto_7271 ?auto_7281 ) ( CLEAR ?auto_7271 ) ( not ( = ?auto_7270 ?auto_7281 ) ) ( not ( = ?auto_7271 ?auto_7281 ) ) ( not ( = ?auto_7276 ?auto_7281 ) ) ( IS-CRATE ?auto_7270 ) ( not ( = ?auto_7274 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7274 ) ) ( HOIST-AT ?auto_7279 ?auto_7274 ) ( not ( = ?auto_7275 ?auto_7279 ) ) ( not ( = ?auto_7286 ?auto_7279 ) ) ( AVAILABLE ?auto_7279 ) ( SURFACE-AT ?auto_7270 ?auto_7274 ) ( ON ?auto_7270 ?auto_7282 ) ( CLEAR ?auto_7270 ) ( not ( = ?auto_7270 ?auto_7282 ) ) ( not ( = ?auto_7271 ?auto_7282 ) ) ( not ( = ?auto_7276 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( IS-CRATE ?auto_7276 ) ( not ( = ?auto_7278 ?auto_7276 ) ) ( not ( = ?auto_7270 ?auto_7278 ) ) ( not ( = ?auto_7271 ?auto_7278 ) ) ( not ( = ?auto_7281 ?auto_7278 ) ) ( not ( = ?auto_7282 ?auto_7278 ) ) ( not ( = ?auto_7272 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7272 ) ) ( not ( = ?auto_7274 ?auto_7272 ) ) ( HOIST-AT ?auto_7285 ?auto_7272 ) ( not ( = ?auto_7275 ?auto_7285 ) ) ( not ( = ?auto_7286 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( AVAILABLE ?auto_7285 ) ( SURFACE-AT ?auto_7276 ?auto_7272 ) ( ON ?auto_7276 ?auto_7273 ) ( CLEAR ?auto_7276 ) ( not ( = ?auto_7270 ?auto_7273 ) ) ( not ( = ?auto_7271 ?auto_7273 ) ) ( not ( = ?auto_7276 ?auto_7273 ) ) ( not ( = ?auto_7281 ?auto_7273 ) ) ( not ( = ?auto_7282 ?auto_7273 ) ) ( not ( = ?auto_7278 ?auto_7273 ) ) ( SURFACE-AT ?auto_7280 ?auto_7284 ) ( CLEAR ?auto_7280 ) ( IS-CRATE ?auto_7278 ) ( not ( = ?auto_7280 ?auto_7278 ) ) ( not ( = ?auto_7270 ?auto_7280 ) ) ( not ( = ?auto_7271 ?auto_7280 ) ) ( not ( = ?auto_7276 ?auto_7280 ) ) ( not ( = ?auto_7281 ?auto_7280 ) ) ( not ( = ?auto_7282 ?auto_7280 ) ) ( not ( = ?auto_7273 ?auto_7280 ) ) ( AVAILABLE ?auto_7275 ) ( TRUCK-AT ?auto_7283 ?auto_7277 ) ( LIFTING ?auto_7286 ?auto_7278 ) )
    :subtasks
    ( ( !LOAD ?auto_7286 ?auto_7278 ?auto_7283 ?auto_7277 )
      ( MAKE-2CRATE ?auto_7276 ?auto_7270 ?auto_7271 )
      ( MAKE-1CRATE-VERIFY ?auto_7270 ?auto_7271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7287 - SURFACE
      ?auto_7288 - SURFACE
      ?auto_7289 - SURFACE
    )
    :vars
    (
      ?auto_7302 - HOIST
      ?auto_7293 - PLACE
      ?auto_7299 - PLACE
      ?auto_7295 - HOIST
      ?auto_7294 - SURFACE
      ?auto_7300 - PLACE
      ?auto_7297 - HOIST
      ?auto_7296 - SURFACE
      ?auto_7301 - SURFACE
      ?auto_7290 - PLACE
      ?auto_7291 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7298 - SURFACE
      ?auto_7292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7302 ?auto_7293 ) ( IS-CRATE ?auto_7289 ) ( not ( = ?auto_7288 ?auto_7289 ) ) ( not ( = ?auto_7287 ?auto_7288 ) ) ( not ( = ?auto_7287 ?auto_7289 ) ) ( not ( = ?auto_7299 ?auto_7293 ) ) ( HOIST-AT ?auto_7295 ?auto_7299 ) ( not ( = ?auto_7302 ?auto_7295 ) ) ( SURFACE-AT ?auto_7289 ?auto_7299 ) ( ON ?auto_7289 ?auto_7294 ) ( CLEAR ?auto_7289 ) ( not ( = ?auto_7288 ?auto_7294 ) ) ( not ( = ?auto_7289 ?auto_7294 ) ) ( not ( = ?auto_7287 ?auto_7294 ) ) ( IS-CRATE ?auto_7288 ) ( not ( = ?auto_7300 ?auto_7293 ) ) ( not ( = ?auto_7299 ?auto_7300 ) ) ( HOIST-AT ?auto_7297 ?auto_7300 ) ( not ( = ?auto_7302 ?auto_7297 ) ) ( not ( = ?auto_7295 ?auto_7297 ) ) ( AVAILABLE ?auto_7297 ) ( SURFACE-AT ?auto_7288 ?auto_7300 ) ( ON ?auto_7288 ?auto_7296 ) ( CLEAR ?auto_7288 ) ( not ( = ?auto_7288 ?auto_7296 ) ) ( not ( = ?auto_7289 ?auto_7296 ) ) ( not ( = ?auto_7287 ?auto_7296 ) ) ( not ( = ?auto_7294 ?auto_7296 ) ) ( IS-CRATE ?auto_7287 ) ( not ( = ?auto_7301 ?auto_7287 ) ) ( not ( = ?auto_7288 ?auto_7301 ) ) ( not ( = ?auto_7289 ?auto_7301 ) ) ( not ( = ?auto_7294 ?auto_7301 ) ) ( not ( = ?auto_7296 ?auto_7301 ) ) ( not ( = ?auto_7290 ?auto_7293 ) ) ( not ( = ?auto_7299 ?auto_7290 ) ) ( not ( = ?auto_7300 ?auto_7290 ) ) ( HOIST-AT ?auto_7291 ?auto_7290 ) ( not ( = ?auto_7302 ?auto_7291 ) ) ( not ( = ?auto_7295 ?auto_7291 ) ) ( not ( = ?auto_7297 ?auto_7291 ) ) ( AVAILABLE ?auto_7291 ) ( SURFACE-AT ?auto_7287 ?auto_7290 ) ( ON ?auto_7287 ?auto_7303 ) ( CLEAR ?auto_7287 ) ( not ( = ?auto_7288 ?auto_7303 ) ) ( not ( = ?auto_7289 ?auto_7303 ) ) ( not ( = ?auto_7287 ?auto_7303 ) ) ( not ( = ?auto_7294 ?auto_7303 ) ) ( not ( = ?auto_7296 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( SURFACE-AT ?auto_7298 ?auto_7293 ) ( CLEAR ?auto_7298 ) ( IS-CRATE ?auto_7301 ) ( not ( = ?auto_7298 ?auto_7301 ) ) ( not ( = ?auto_7288 ?auto_7298 ) ) ( not ( = ?auto_7289 ?auto_7298 ) ) ( not ( = ?auto_7287 ?auto_7298 ) ) ( not ( = ?auto_7294 ?auto_7298 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7303 ?auto_7298 ) ) ( AVAILABLE ?auto_7302 ) ( TRUCK-AT ?auto_7292 ?auto_7299 ) ( LIFTING ?auto_7295 ?auto_7301 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7288 ?auto_7289 )
      ( MAKE-2CRATE-VERIFY ?auto_7287 ?auto_7288 ?auto_7289 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7304 - SURFACE
      ?auto_7305 - SURFACE
      ?auto_7306 - SURFACE
      ?auto_7307 - SURFACE
    )
    :vars
    (
      ?auto_7316 - HOIST
      ?auto_7317 - PLACE
      ?auto_7318 - PLACE
      ?auto_7313 - HOIST
      ?auto_7308 - SURFACE
      ?auto_7319 - PLACE
      ?auto_7320 - HOIST
      ?auto_7315 - SURFACE
      ?auto_7309 - PLACE
      ?auto_7314 - HOIST
      ?auto_7312 - SURFACE
      ?auto_7311 - SURFACE
      ?auto_7310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7316 ?auto_7317 ) ( IS-CRATE ?auto_7307 ) ( not ( = ?auto_7306 ?auto_7307 ) ) ( not ( = ?auto_7305 ?auto_7306 ) ) ( not ( = ?auto_7305 ?auto_7307 ) ) ( not ( = ?auto_7318 ?auto_7317 ) ) ( HOIST-AT ?auto_7313 ?auto_7318 ) ( not ( = ?auto_7316 ?auto_7313 ) ) ( SURFACE-AT ?auto_7307 ?auto_7318 ) ( ON ?auto_7307 ?auto_7308 ) ( CLEAR ?auto_7307 ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7307 ?auto_7308 ) ) ( not ( = ?auto_7305 ?auto_7308 ) ) ( IS-CRATE ?auto_7306 ) ( not ( = ?auto_7319 ?auto_7317 ) ) ( not ( = ?auto_7318 ?auto_7319 ) ) ( HOIST-AT ?auto_7320 ?auto_7319 ) ( not ( = ?auto_7316 ?auto_7320 ) ) ( not ( = ?auto_7313 ?auto_7320 ) ) ( AVAILABLE ?auto_7320 ) ( SURFACE-AT ?auto_7306 ?auto_7319 ) ( ON ?auto_7306 ?auto_7315 ) ( CLEAR ?auto_7306 ) ( not ( = ?auto_7306 ?auto_7315 ) ) ( not ( = ?auto_7307 ?auto_7315 ) ) ( not ( = ?auto_7305 ?auto_7315 ) ) ( not ( = ?auto_7308 ?auto_7315 ) ) ( IS-CRATE ?auto_7305 ) ( not ( = ?auto_7304 ?auto_7305 ) ) ( not ( = ?auto_7306 ?auto_7304 ) ) ( not ( = ?auto_7307 ?auto_7304 ) ) ( not ( = ?auto_7308 ?auto_7304 ) ) ( not ( = ?auto_7315 ?auto_7304 ) ) ( not ( = ?auto_7309 ?auto_7317 ) ) ( not ( = ?auto_7318 ?auto_7309 ) ) ( not ( = ?auto_7319 ?auto_7309 ) ) ( HOIST-AT ?auto_7314 ?auto_7309 ) ( not ( = ?auto_7316 ?auto_7314 ) ) ( not ( = ?auto_7313 ?auto_7314 ) ) ( not ( = ?auto_7320 ?auto_7314 ) ) ( AVAILABLE ?auto_7314 ) ( SURFACE-AT ?auto_7305 ?auto_7309 ) ( ON ?auto_7305 ?auto_7312 ) ( CLEAR ?auto_7305 ) ( not ( = ?auto_7306 ?auto_7312 ) ) ( not ( = ?auto_7307 ?auto_7312 ) ) ( not ( = ?auto_7305 ?auto_7312 ) ) ( not ( = ?auto_7308 ?auto_7312 ) ) ( not ( = ?auto_7315 ?auto_7312 ) ) ( not ( = ?auto_7304 ?auto_7312 ) ) ( SURFACE-AT ?auto_7311 ?auto_7317 ) ( CLEAR ?auto_7311 ) ( IS-CRATE ?auto_7304 ) ( not ( = ?auto_7311 ?auto_7304 ) ) ( not ( = ?auto_7306 ?auto_7311 ) ) ( not ( = ?auto_7307 ?auto_7311 ) ) ( not ( = ?auto_7305 ?auto_7311 ) ) ( not ( = ?auto_7308 ?auto_7311 ) ) ( not ( = ?auto_7315 ?auto_7311 ) ) ( not ( = ?auto_7312 ?auto_7311 ) ) ( AVAILABLE ?auto_7316 ) ( TRUCK-AT ?auto_7310 ?auto_7318 ) ( LIFTING ?auto_7313 ?auto_7304 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7305 ?auto_7306 ?auto_7307 )
      ( MAKE-3CRATE-VERIFY ?auto_7304 ?auto_7305 ?auto_7306 ?auto_7307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7321 - SURFACE
      ?auto_7322 - SURFACE
      ?auto_7323 - SURFACE
      ?auto_7324 - SURFACE
      ?auto_7325 - SURFACE
    )
    :vars
    (
      ?auto_7333 - HOIST
      ?auto_7334 - PLACE
      ?auto_7335 - PLACE
      ?auto_7330 - HOIST
      ?auto_7326 - SURFACE
      ?auto_7336 - PLACE
      ?auto_7337 - HOIST
      ?auto_7332 - SURFACE
      ?auto_7327 - PLACE
      ?auto_7331 - HOIST
      ?auto_7329 - SURFACE
      ?auto_7328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7333 ?auto_7334 ) ( IS-CRATE ?auto_7325 ) ( not ( = ?auto_7324 ?auto_7325 ) ) ( not ( = ?auto_7323 ?auto_7324 ) ) ( not ( = ?auto_7323 ?auto_7325 ) ) ( not ( = ?auto_7335 ?auto_7334 ) ) ( HOIST-AT ?auto_7330 ?auto_7335 ) ( not ( = ?auto_7333 ?auto_7330 ) ) ( SURFACE-AT ?auto_7325 ?auto_7335 ) ( ON ?auto_7325 ?auto_7326 ) ( CLEAR ?auto_7325 ) ( not ( = ?auto_7324 ?auto_7326 ) ) ( not ( = ?auto_7325 ?auto_7326 ) ) ( not ( = ?auto_7323 ?auto_7326 ) ) ( IS-CRATE ?auto_7324 ) ( not ( = ?auto_7336 ?auto_7334 ) ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( HOIST-AT ?auto_7337 ?auto_7336 ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7330 ?auto_7337 ) ) ( AVAILABLE ?auto_7337 ) ( SURFACE-AT ?auto_7324 ?auto_7336 ) ( ON ?auto_7324 ?auto_7332 ) ( CLEAR ?auto_7324 ) ( not ( = ?auto_7324 ?auto_7332 ) ) ( not ( = ?auto_7325 ?auto_7332 ) ) ( not ( = ?auto_7323 ?auto_7332 ) ) ( not ( = ?auto_7326 ?auto_7332 ) ) ( IS-CRATE ?auto_7323 ) ( not ( = ?auto_7322 ?auto_7323 ) ) ( not ( = ?auto_7324 ?auto_7322 ) ) ( not ( = ?auto_7325 ?auto_7322 ) ) ( not ( = ?auto_7326 ?auto_7322 ) ) ( not ( = ?auto_7332 ?auto_7322 ) ) ( not ( = ?auto_7327 ?auto_7334 ) ) ( not ( = ?auto_7335 ?auto_7327 ) ) ( not ( = ?auto_7336 ?auto_7327 ) ) ( HOIST-AT ?auto_7331 ?auto_7327 ) ( not ( = ?auto_7333 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( not ( = ?auto_7337 ?auto_7331 ) ) ( AVAILABLE ?auto_7331 ) ( SURFACE-AT ?auto_7323 ?auto_7327 ) ( ON ?auto_7323 ?auto_7329 ) ( CLEAR ?auto_7323 ) ( not ( = ?auto_7324 ?auto_7329 ) ) ( not ( = ?auto_7325 ?auto_7329 ) ) ( not ( = ?auto_7323 ?auto_7329 ) ) ( not ( = ?auto_7326 ?auto_7329 ) ) ( not ( = ?auto_7332 ?auto_7329 ) ) ( not ( = ?auto_7322 ?auto_7329 ) ) ( SURFACE-AT ?auto_7321 ?auto_7334 ) ( CLEAR ?auto_7321 ) ( IS-CRATE ?auto_7322 ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( not ( = ?auto_7324 ?auto_7321 ) ) ( not ( = ?auto_7325 ?auto_7321 ) ) ( not ( = ?auto_7323 ?auto_7321 ) ) ( not ( = ?auto_7326 ?auto_7321 ) ) ( not ( = ?auto_7332 ?auto_7321 ) ) ( not ( = ?auto_7329 ?auto_7321 ) ) ( AVAILABLE ?auto_7333 ) ( TRUCK-AT ?auto_7328 ?auto_7335 ) ( LIFTING ?auto_7330 ?auto_7322 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7323 ?auto_7324 ?auto_7325 )
      ( MAKE-4CRATE-VERIFY ?auto_7321 ?auto_7322 ?auto_7323 ?auto_7324 ?auto_7325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7338 - SURFACE
      ?auto_7339 - SURFACE
    )
    :vars
    (
      ?auto_7349 - HOIST
      ?auto_7350 - PLACE
      ?auto_7353 - SURFACE
      ?auto_7351 - PLACE
      ?auto_7346 - HOIST
      ?auto_7340 - SURFACE
      ?auto_7352 - PLACE
      ?auto_7354 - HOIST
      ?auto_7348 - SURFACE
      ?auto_7341 - SURFACE
      ?auto_7342 - PLACE
      ?auto_7347 - HOIST
      ?auto_7345 - SURFACE
      ?auto_7344 - SURFACE
      ?auto_7343 - TRUCK
      ?auto_7355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7349 ?auto_7350 ) ( IS-CRATE ?auto_7339 ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7353 ?auto_7338 ) ) ( not ( = ?auto_7353 ?auto_7339 ) ) ( not ( = ?auto_7351 ?auto_7350 ) ) ( HOIST-AT ?auto_7346 ?auto_7351 ) ( not ( = ?auto_7349 ?auto_7346 ) ) ( SURFACE-AT ?auto_7339 ?auto_7351 ) ( ON ?auto_7339 ?auto_7340 ) ( CLEAR ?auto_7339 ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7340 ) ) ( not ( = ?auto_7353 ?auto_7340 ) ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7352 ?auto_7350 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( HOIST-AT ?auto_7354 ?auto_7352 ) ( not ( = ?auto_7349 ?auto_7354 ) ) ( not ( = ?auto_7346 ?auto_7354 ) ) ( AVAILABLE ?auto_7354 ) ( SURFACE-AT ?auto_7338 ?auto_7352 ) ( ON ?auto_7338 ?auto_7348 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7338 ?auto_7348 ) ) ( not ( = ?auto_7339 ?auto_7348 ) ) ( not ( = ?auto_7353 ?auto_7348 ) ) ( not ( = ?auto_7340 ?auto_7348 ) ) ( IS-CRATE ?auto_7353 ) ( not ( = ?auto_7341 ?auto_7353 ) ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7339 ?auto_7341 ) ) ( not ( = ?auto_7340 ?auto_7341 ) ) ( not ( = ?auto_7348 ?auto_7341 ) ) ( not ( = ?auto_7342 ?auto_7350 ) ) ( not ( = ?auto_7351 ?auto_7342 ) ) ( not ( = ?auto_7352 ?auto_7342 ) ) ( HOIST-AT ?auto_7347 ?auto_7342 ) ( not ( = ?auto_7349 ?auto_7347 ) ) ( not ( = ?auto_7346 ?auto_7347 ) ) ( not ( = ?auto_7354 ?auto_7347 ) ) ( AVAILABLE ?auto_7347 ) ( SURFACE-AT ?auto_7353 ?auto_7342 ) ( ON ?auto_7353 ?auto_7345 ) ( CLEAR ?auto_7353 ) ( not ( = ?auto_7338 ?auto_7345 ) ) ( not ( = ?auto_7339 ?auto_7345 ) ) ( not ( = ?auto_7353 ?auto_7345 ) ) ( not ( = ?auto_7340 ?auto_7345 ) ) ( not ( = ?auto_7348 ?auto_7345 ) ) ( not ( = ?auto_7341 ?auto_7345 ) ) ( SURFACE-AT ?auto_7344 ?auto_7350 ) ( CLEAR ?auto_7344 ) ( IS-CRATE ?auto_7341 ) ( not ( = ?auto_7344 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7344 ) ) ( not ( = ?auto_7339 ?auto_7344 ) ) ( not ( = ?auto_7353 ?auto_7344 ) ) ( not ( = ?auto_7340 ?auto_7344 ) ) ( not ( = ?auto_7348 ?auto_7344 ) ) ( not ( = ?auto_7345 ?auto_7344 ) ) ( AVAILABLE ?auto_7349 ) ( TRUCK-AT ?auto_7343 ?auto_7351 ) ( AVAILABLE ?auto_7346 ) ( SURFACE-AT ?auto_7341 ?auto_7351 ) ( ON ?auto_7341 ?auto_7355 ) ( CLEAR ?auto_7341 ) ( not ( = ?auto_7338 ?auto_7355 ) ) ( not ( = ?auto_7339 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7355 ) ) ( not ( = ?auto_7340 ?auto_7355 ) ) ( not ( = ?auto_7348 ?auto_7355 ) ) ( not ( = ?auto_7341 ?auto_7355 ) ) ( not ( = ?auto_7345 ?auto_7355 ) ) ( not ( = ?auto_7344 ?auto_7355 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7346 ?auto_7341 ?auto_7355 ?auto_7351 )
      ( MAKE-2CRATE ?auto_7353 ?auto_7338 ?auto_7339 )
      ( MAKE-1CRATE-VERIFY ?auto_7338 ?auto_7339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7356 - SURFACE
      ?auto_7357 - SURFACE
      ?auto_7358 - SURFACE
    )
    :vars
    (
      ?auto_7363 - HOIST
      ?auto_7367 - PLACE
      ?auto_7359 - PLACE
      ?auto_7369 - HOIST
      ?auto_7373 - SURFACE
      ?auto_7370 - PLACE
      ?auto_7364 - HOIST
      ?auto_7361 - SURFACE
      ?auto_7362 - SURFACE
      ?auto_7372 - PLACE
      ?auto_7365 - HOIST
      ?auto_7368 - SURFACE
      ?auto_7366 - SURFACE
      ?auto_7360 - TRUCK
      ?auto_7371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7363 ?auto_7367 ) ( IS-CRATE ?auto_7358 ) ( not ( = ?auto_7357 ?auto_7358 ) ) ( not ( = ?auto_7356 ?auto_7357 ) ) ( not ( = ?auto_7356 ?auto_7358 ) ) ( not ( = ?auto_7359 ?auto_7367 ) ) ( HOIST-AT ?auto_7369 ?auto_7359 ) ( not ( = ?auto_7363 ?auto_7369 ) ) ( SURFACE-AT ?auto_7358 ?auto_7359 ) ( ON ?auto_7358 ?auto_7373 ) ( CLEAR ?auto_7358 ) ( not ( = ?auto_7357 ?auto_7373 ) ) ( not ( = ?auto_7358 ?auto_7373 ) ) ( not ( = ?auto_7356 ?auto_7373 ) ) ( IS-CRATE ?auto_7357 ) ( not ( = ?auto_7370 ?auto_7367 ) ) ( not ( = ?auto_7359 ?auto_7370 ) ) ( HOIST-AT ?auto_7364 ?auto_7370 ) ( not ( = ?auto_7363 ?auto_7364 ) ) ( not ( = ?auto_7369 ?auto_7364 ) ) ( AVAILABLE ?auto_7364 ) ( SURFACE-AT ?auto_7357 ?auto_7370 ) ( ON ?auto_7357 ?auto_7361 ) ( CLEAR ?auto_7357 ) ( not ( = ?auto_7357 ?auto_7361 ) ) ( not ( = ?auto_7358 ?auto_7361 ) ) ( not ( = ?auto_7356 ?auto_7361 ) ) ( not ( = ?auto_7373 ?auto_7361 ) ) ( IS-CRATE ?auto_7356 ) ( not ( = ?auto_7362 ?auto_7356 ) ) ( not ( = ?auto_7357 ?auto_7362 ) ) ( not ( = ?auto_7358 ?auto_7362 ) ) ( not ( = ?auto_7373 ?auto_7362 ) ) ( not ( = ?auto_7361 ?auto_7362 ) ) ( not ( = ?auto_7372 ?auto_7367 ) ) ( not ( = ?auto_7359 ?auto_7372 ) ) ( not ( = ?auto_7370 ?auto_7372 ) ) ( HOIST-AT ?auto_7365 ?auto_7372 ) ( not ( = ?auto_7363 ?auto_7365 ) ) ( not ( = ?auto_7369 ?auto_7365 ) ) ( not ( = ?auto_7364 ?auto_7365 ) ) ( AVAILABLE ?auto_7365 ) ( SURFACE-AT ?auto_7356 ?auto_7372 ) ( ON ?auto_7356 ?auto_7368 ) ( CLEAR ?auto_7356 ) ( not ( = ?auto_7357 ?auto_7368 ) ) ( not ( = ?auto_7358 ?auto_7368 ) ) ( not ( = ?auto_7356 ?auto_7368 ) ) ( not ( = ?auto_7373 ?auto_7368 ) ) ( not ( = ?auto_7361 ?auto_7368 ) ) ( not ( = ?auto_7362 ?auto_7368 ) ) ( SURFACE-AT ?auto_7366 ?auto_7367 ) ( CLEAR ?auto_7366 ) ( IS-CRATE ?auto_7362 ) ( not ( = ?auto_7366 ?auto_7362 ) ) ( not ( = ?auto_7357 ?auto_7366 ) ) ( not ( = ?auto_7358 ?auto_7366 ) ) ( not ( = ?auto_7356 ?auto_7366 ) ) ( not ( = ?auto_7373 ?auto_7366 ) ) ( not ( = ?auto_7361 ?auto_7366 ) ) ( not ( = ?auto_7368 ?auto_7366 ) ) ( AVAILABLE ?auto_7363 ) ( TRUCK-AT ?auto_7360 ?auto_7359 ) ( AVAILABLE ?auto_7369 ) ( SURFACE-AT ?auto_7362 ?auto_7359 ) ( ON ?auto_7362 ?auto_7371 ) ( CLEAR ?auto_7362 ) ( not ( = ?auto_7357 ?auto_7371 ) ) ( not ( = ?auto_7358 ?auto_7371 ) ) ( not ( = ?auto_7356 ?auto_7371 ) ) ( not ( = ?auto_7373 ?auto_7371 ) ) ( not ( = ?auto_7361 ?auto_7371 ) ) ( not ( = ?auto_7362 ?auto_7371 ) ) ( not ( = ?auto_7368 ?auto_7371 ) ) ( not ( = ?auto_7366 ?auto_7371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7357 ?auto_7358 )
      ( MAKE-2CRATE-VERIFY ?auto_7356 ?auto_7357 ?auto_7358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7374 - SURFACE
      ?auto_7375 - SURFACE
      ?auto_7376 - SURFACE
      ?auto_7377 - SURFACE
    )
    :vars
    (
      ?auto_7379 - HOIST
      ?auto_7389 - PLACE
      ?auto_7381 - PLACE
      ?auto_7380 - HOIST
      ?auto_7388 - SURFACE
      ?auto_7386 - PLACE
      ?auto_7383 - HOIST
      ?auto_7387 - SURFACE
      ?auto_7378 - PLACE
      ?auto_7385 - HOIST
      ?auto_7390 - SURFACE
      ?auto_7391 - SURFACE
      ?auto_7382 - TRUCK
      ?auto_7384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7379 ?auto_7389 ) ( IS-CRATE ?auto_7377 ) ( not ( = ?auto_7376 ?auto_7377 ) ) ( not ( = ?auto_7375 ?auto_7376 ) ) ( not ( = ?auto_7375 ?auto_7377 ) ) ( not ( = ?auto_7381 ?auto_7389 ) ) ( HOIST-AT ?auto_7380 ?auto_7381 ) ( not ( = ?auto_7379 ?auto_7380 ) ) ( SURFACE-AT ?auto_7377 ?auto_7381 ) ( ON ?auto_7377 ?auto_7388 ) ( CLEAR ?auto_7377 ) ( not ( = ?auto_7376 ?auto_7388 ) ) ( not ( = ?auto_7377 ?auto_7388 ) ) ( not ( = ?auto_7375 ?auto_7388 ) ) ( IS-CRATE ?auto_7376 ) ( not ( = ?auto_7386 ?auto_7389 ) ) ( not ( = ?auto_7381 ?auto_7386 ) ) ( HOIST-AT ?auto_7383 ?auto_7386 ) ( not ( = ?auto_7379 ?auto_7383 ) ) ( not ( = ?auto_7380 ?auto_7383 ) ) ( AVAILABLE ?auto_7383 ) ( SURFACE-AT ?auto_7376 ?auto_7386 ) ( ON ?auto_7376 ?auto_7387 ) ( CLEAR ?auto_7376 ) ( not ( = ?auto_7376 ?auto_7387 ) ) ( not ( = ?auto_7377 ?auto_7387 ) ) ( not ( = ?auto_7375 ?auto_7387 ) ) ( not ( = ?auto_7388 ?auto_7387 ) ) ( IS-CRATE ?auto_7375 ) ( not ( = ?auto_7374 ?auto_7375 ) ) ( not ( = ?auto_7376 ?auto_7374 ) ) ( not ( = ?auto_7377 ?auto_7374 ) ) ( not ( = ?auto_7388 ?auto_7374 ) ) ( not ( = ?auto_7387 ?auto_7374 ) ) ( not ( = ?auto_7378 ?auto_7389 ) ) ( not ( = ?auto_7381 ?auto_7378 ) ) ( not ( = ?auto_7386 ?auto_7378 ) ) ( HOIST-AT ?auto_7385 ?auto_7378 ) ( not ( = ?auto_7379 ?auto_7385 ) ) ( not ( = ?auto_7380 ?auto_7385 ) ) ( not ( = ?auto_7383 ?auto_7385 ) ) ( AVAILABLE ?auto_7385 ) ( SURFACE-AT ?auto_7375 ?auto_7378 ) ( ON ?auto_7375 ?auto_7390 ) ( CLEAR ?auto_7375 ) ( not ( = ?auto_7376 ?auto_7390 ) ) ( not ( = ?auto_7377 ?auto_7390 ) ) ( not ( = ?auto_7375 ?auto_7390 ) ) ( not ( = ?auto_7388 ?auto_7390 ) ) ( not ( = ?auto_7387 ?auto_7390 ) ) ( not ( = ?auto_7374 ?auto_7390 ) ) ( SURFACE-AT ?auto_7391 ?auto_7389 ) ( CLEAR ?auto_7391 ) ( IS-CRATE ?auto_7374 ) ( not ( = ?auto_7391 ?auto_7374 ) ) ( not ( = ?auto_7376 ?auto_7391 ) ) ( not ( = ?auto_7377 ?auto_7391 ) ) ( not ( = ?auto_7375 ?auto_7391 ) ) ( not ( = ?auto_7388 ?auto_7391 ) ) ( not ( = ?auto_7387 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( AVAILABLE ?auto_7379 ) ( TRUCK-AT ?auto_7382 ?auto_7381 ) ( AVAILABLE ?auto_7380 ) ( SURFACE-AT ?auto_7374 ?auto_7381 ) ( ON ?auto_7374 ?auto_7384 ) ( CLEAR ?auto_7374 ) ( not ( = ?auto_7376 ?auto_7384 ) ) ( not ( = ?auto_7377 ?auto_7384 ) ) ( not ( = ?auto_7375 ?auto_7384 ) ) ( not ( = ?auto_7388 ?auto_7384 ) ) ( not ( = ?auto_7387 ?auto_7384 ) ) ( not ( = ?auto_7374 ?auto_7384 ) ) ( not ( = ?auto_7390 ?auto_7384 ) ) ( not ( = ?auto_7391 ?auto_7384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7375 ?auto_7376 ?auto_7377 )
      ( MAKE-3CRATE-VERIFY ?auto_7374 ?auto_7375 ?auto_7376 ?auto_7377 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7392 - SURFACE
      ?auto_7393 - SURFACE
      ?auto_7394 - SURFACE
      ?auto_7395 - SURFACE
      ?auto_7396 - SURFACE
    )
    :vars
    (
      ?auto_7398 - HOIST
      ?auto_7408 - PLACE
      ?auto_7400 - PLACE
      ?auto_7399 - HOIST
      ?auto_7407 - SURFACE
      ?auto_7405 - PLACE
      ?auto_7402 - HOIST
      ?auto_7406 - SURFACE
      ?auto_7397 - PLACE
      ?auto_7404 - HOIST
      ?auto_7409 - SURFACE
      ?auto_7401 - TRUCK
      ?auto_7403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7398 ?auto_7408 ) ( IS-CRATE ?auto_7396 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( not ( = ?auto_7400 ?auto_7408 ) ) ( HOIST-AT ?auto_7399 ?auto_7400 ) ( not ( = ?auto_7398 ?auto_7399 ) ) ( SURFACE-AT ?auto_7396 ?auto_7400 ) ( ON ?auto_7396 ?auto_7407 ) ( CLEAR ?auto_7396 ) ( not ( = ?auto_7395 ?auto_7407 ) ) ( not ( = ?auto_7396 ?auto_7407 ) ) ( not ( = ?auto_7394 ?auto_7407 ) ) ( IS-CRATE ?auto_7395 ) ( not ( = ?auto_7405 ?auto_7408 ) ) ( not ( = ?auto_7400 ?auto_7405 ) ) ( HOIST-AT ?auto_7402 ?auto_7405 ) ( not ( = ?auto_7398 ?auto_7402 ) ) ( not ( = ?auto_7399 ?auto_7402 ) ) ( AVAILABLE ?auto_7402 ) ( SURFACE-AT ?auto_7395 ?auto_7405 ) ( ON ?auto_7395 ?auto_7406 ) ( CLEAR ?auto_7395 ) ( not ( = ?auto_7395 ?auto_7406 ) ) ( not ( = ?auto_7396 ?auto_7406 ) ) ( not ( = ?auto_7394 ?auto_7406 ) ) ( not ( = ?auto_7407 ?auto_7406 ) ) ( IS-CRATE ?auto_7394 ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( not ( = ?auto_7395 ?auto_7393 ) ) ( not ( = ?auto_7396 ?auto_7393 ) ) ( not ( = ?auto_7407 ?auto_7393 ) ) ( not ( = ?auto_7406 ?auto_7393 ) ) ( not ( = ?auto_7397 ?auto_7408 ) ) ( not ( = ?auto_7400 ?auto_7397 ) ) ( not ( = ?auto_7405 ?auto_7397 ) ) ( HOIST-AT ?auto_7404 ?auto_7397 ) ( not ( = ?auto_7398 ?auto_7404 ) ) ( not ( = ?auto_7399 ?auto_7404 ) ) ( not ( = ?auto_7402 ?auto_7404 ) ) ( AVAILABLE ?auto_7404 ) ( SURFACE-AT ?auto_7394 ?auto_7397 ) ( ON ?auto_7394 ?auto_7409 ) ( CLEAR ?auto_7394 ) ( not ( = ?auto_7395 ?auto_7409 ) ) ( not ( = ?auto_7396 ?auto_7409 ) ) ( not ( = ?auto_7394 ?auto_7409 ) ) ( not ( = ?auto_7407 ?auto_7409 ) ) ( not ( = ?auto_7406 ?auto_7409 ) ) ( not ( = ?auto_7393 ?auto_7409 ) ) ( SURFACE-AT ?auto_7392 ?auto_7408 ) ( CLEAR ?auto_7392 ) ( IS-CRATE ?auto_7393 ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( not ( = ?auto_7395 ?auto_7392 ) ) ( not ( = ?auto_7396 ?auto_7392 ) ) ( not ( = ?auto_7394 ?auto_7392 ) ) ( not ( = ?auto_7407 ?auto_7392 ) ) ( not ( = ?auto_7406 ?auto_7392 ) ) ( not ( = ?auto_7409 ?auto_7392 ) ) ( AVAILABLE ?auto_7398 ) ( TRUCK-AT ?auto_7401 ?auto_7400 ) ( AVAILABLE ?auto_7399 ) ( SURFACE-AT ?auto_7393 ?auto_7400 ) ( ON ?auto_7393 ?auto_7403 ) ( CLEAR ?auto_7393 ) ( not ( = ?auto_7395 ?auto_7403 ) ) ( not ( = ?auto_7396 ?auto_7403 ) ) ( not ( = ?auto_7394 ?auto_7403 ) ) ( not ( = ?auto_7407 ?auto_7403 ) ) ( not ( = ?auto_7406 ?auto_7403 ) ) ( not ( = ?auto_7393 ?auto_7403 ) ) ( not ( = ?auto_7409 ?auto_7403 ) ) ( not ( = ?auto_7392 ?auto_7403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7394 ?auto_7395 ?auto_7396 )
      ( MAKE-4CRATE-VERIFY ?auto_7392 ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7410 - SURFACE
      ?auto_7411 - SURFACE
    )
    :vars
    (
      ?auto_7413 - HOIST
      ?auto_7424 - PLACE
      ?auto_7427 - SURFACE
      ?auto_7415 - PLACE
      ?auto_7414 - HOIST
      ?auto_7423 - SURFACE
      ?auto_7421 - PLACE
      ?auto_7417 - HOIST
      ?auto_7422 - SURFACE
      ?auto_7420 - SURFACE
      ?auto_7412 - PLACE
      ?auto_7419 - HOIST
      ?auto_7425 - SURFACE
      ?auto_7426 - SURFACE
      ?auto_7418 - SURFACE
      ?auto_7416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7413 ?auto_7424 ) ( IS-CRATE ?auto_7411 ) ( not ( = ?auto_7410 ?auto_7411 ) ) ( not ( = ?auto_7427 ?auto_7410 ) ) ( not ( = ?auto_7427 ?auto_7411 ) ) ( not ( = ?auto_7415 ?auto_7424 ) ) ( HOIST-AT ?auto_7414 ?auto_7415 ) ( not ( = ?auto_7413 ?auto_7414 ) ) ( SURFACE-AT ?auto_7411 ?auto_7415 ) ( ON ?auto_7411 ?auto_7423 ) ( CLEAR ?auto_7411 ) ( not ( = ?auto_7410 ?auto_7423 ) ) ( not ( = ?auto_7411 ?auto_7423 ) ) ( not ( = ?auto_7427 ?auto_7423 ) ) ( IS-CRATE ?auto_7410 ) ( not ( = ?auto_7421 ?auto_7424 ) ) ( not ( = ?auto_7415 ?auto_7421 ) ) ( HOIST-AT ?auto_7417 ?auto_7421 ) ( not ( = ?auto_7413 ?auto_7417 ) ) ( not ( = ?auto_7414 ?auto_7417 ) ) ( AVAILABLE ?auto_7417 ) ( SURFACE-AT ?auto_7410 ?auto_7421 ) ( ON ?auto_7410 ?auto_7422 ) ( CLEAR ?auto_7410 ) ( not ( = ?auto_7410 ?auto_7422 ) ) ( not ( = ?auto_7411 ?auto_7422 ) ) ( not ( = ?auto_7427 ?auto_7422 ) ) ( not ( = ?auto_7423 ?auto_7422 ) ) ( IS-CRATE ?auto_7427 ) ( not ( = ?auto_7420 ?auto_7427 ) ) ( not ( = ?auto_7410 ?auto_7420 ) ) ( not ( = ?auto_7411 ?auto_7420 ) ) ( not ( = ?auto_7423 ?auto_7420 ) ) ( not ( = ?auto_7422 ?auto_7420 ) ) ( not ( = ?auto_7412 ?auto_7424 ) ) ( not ( = ?auto_7415 ?auto_7412 ) ) ( not ( = ?auto_7421 ?auto_7412 ) ) ( HOIST-AT ?auto_7419 ?auto_7412 ) ( not ( = ?auto_7413 ?auto_7419 ) ) ( not ( = ?auto_7414 ?auto_7419 ) ) ( not ( = ?auto_7417 ?auto_7419 ) ) ( AVAILABLE ?auto_7419 ) ( SURFACE-AT ?auto_7427 ?auto_7412 ) ( ON ?auto_7427 ?auto_7425 ) ( CLEAR ?auto_7427 ) ( not ( = ?auto_7410 ?auto_7425 ) ) ( not ( = ?auto_7411 ?auto_7425 ) ) ( not ( = ?auto_7427 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7422 ?auto_7425 ) ) ( not ( = ?auto_7420 ?auto_7425 ) ) ( SURFACE-AT ?auto_7426 ?auto_7424 ) ( CLEAR ?auto_7426 ) ( IS-CRATE ?auto_7420 ) ( not ( = ?auto_7426 ?auto_7420 ) ) ( not ( = ?auto_7410 ?auto_7426 ) ) ( not ( = ?auto_7411 ?auto_7426 ) ) ( not ( = ?auto_7427 ?auto_7426 ) ) ( not ( = ?auto_7423 ?auto_7426 ) ) ( not ( = ?auto_7422 ?auto_7426 ) ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( AVAILABLE ?auto_7413 ) ( AVAILABLE ?auto_7414 ) ( SURFACE-AT ?auto_7420 ?auto_7415 ) ( ON ?auto_7420 ?auto_7418 ) ( CLEAR ?auto_7420 ) ( not ( = ?auto_7410 ?auto_7418 ) ) ( not ( = ?auto_7411 ?auto_7418 ) ) ( not ( = ?auto_7427 ?auto_7418 ) ) ( not ( = ?auto_7423 ?auto_7418 ) ) ( not ( = ?auto_7422 ?auto_7418 ) ) ( not ( = ?auto_7420 ?auto_7418 ) ) ( not ( = ?auto_7425 ?auto_7418 ) ) ( not ( = ?auto_7426 ?auto_7418 ) ) ( TRUCK-AT ?auto_7416 ?auto_7424 ) )
    :subtasks
    ( ( !DRIVE ?auto_7416 ?auto_7424 ?auto_7415 )
      ( MAKE-2CRATE ?auto_7427 ?auto_7410 ?auto_7411 )
      ( MAKE-1CRATE-VERIFY ?auto_7410 ?auto_7411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7428 - SURFACE
      ?auto_7429 - SURFACE
      ?auto_7430 - SURFACE
    )
    :vars
    (
      ?auto_7438 - HOIST
      ?auto_7444 - PLACE
      ?auto_7434 - PLACE
      ?auto_7441 - HOIST
      ?auto_7432 - SURFACE
      ?auto_7442 - PLACE
      ?auto_7436 - HOIST
      ?auto_7445 - SURFACE
      ?auto_7437 - SURFACE
      ?auto_7439 - PLACE
      ?auto_7443 - HOIST
      ?auto_7433 - SURFACE
      ?auto_7435 - SURFACE
      ?auto_7431 - SURFACE
      ?auto_7440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7438 ?auto_7444 ) ( IS-CRATE ?auto_7430 ) ( not ( = ?auto_7429 ?auto_7430 ) ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( not ( = ?auto_7428 ?auto_7430 ) ) ( not ( = ?auto_7434 ?auto_7444 ) ) ( HOIST-AT ?auto_7441 ?auto_7434 ) ( not ( = ?auto_7438 ?auto_7441 ) ) ( SURFACE-AT ?auto_7430 ?auto_7434 ) ( ON ?auto_7430 ?auto_7432 ) ( CLEAR ?auto_7430 ) ( not ( = ?auto_7429 ?auto_7432 ) ) ( not ( = ?auto_7430 ?auto_7432 ) ) ( not ( = ?auto_7428 ?auto_7432 ) ) ( IS-CRATE ?auto_7429 ) ( not ( = ?auto_7442 ?auto_7444 ) ) ( not ( = ?auto_7434 ?auto_7442 ) ) ( HOIST-AT ?auto_7436 ?auto_7442 ) ( not ( = ?auto_7438 ?auto_7436 ) ) ( not ( = ?auto_7441 ?auto_7436 ) ) ( AVAILABLE ?auto_7436 ) ( SURFACE-AT ?auto_7429 ?auto_7442 ) ( ON ?auto_7429 ?auto_7445 ) ( CLEAR ?auto_7429 ) ( not ( = ?auto_7429 ?auto_7445 ) ) ( not ( = ?auto_7430 ?auto_7445 ) ) ( not ( = ?auto_7428 ?auto_7445 ) ) ( not ( = ?auto_7432 ?auto_7445 ) ) ( IS-CRATE ?auto_7428 ) ( not ( = ?auto_7437 ?auto_7428 ) ) ( not ( = ?auto_7429 ?auto_7437 ) ) ( not ( = ?auto_7430 ?auto_7437 ) ) ( not ( = ?auto_7432 ?auto_7437 ) ) ( not ( = ?auto_7445 ?auto_7437 ) ) ( not ( = ?auto_7439 ?auto_7444 ) ) ( not ( = ?auto_7434 ?auto_7439 ) ) ( not ( = ?auto_7442 ?auto_7439 ) ) ( HOIST-AT ?auto_7443 ?auto_7439 ) ( not ( = ?auto_7438 ?auto_7443 ) ) ( not ( = ?auto_7441 ?auto_7443 ) ) ( not ( = ?auto_7436 ?auto_7443 ) ) ( AVAILABLE ?auto_7443 ) ( SURFACE-AT ?auto_7428 ?auto_7439 ) ( ON ?auto_7428 ?auto_7433 ) ( CLEAR ?auto_7428 ) ( not ( = ?auto_7429 ?auto_7433 ) ) ( not ( = ?auto_7430 ?auto_7433 ) ) ( not ( = ?auto_7428 ?auto_7433 ) ) ( not ( = ?auto_7432 ?auto_7433 ) ) ( not ( = ?auto_7445 ?auto_7433 ) ) ( not ( = ?auto_7437 ?auto_7433 ) ) ( SURFACE-AT ?auto_7435 ?auto_7444 ) ( CLEAR ?auto_7435 ) ( IS-CRATE ?auto_7437 ) ( not ( = ?auto_7435 ?auto_7437 ) ) ( not ( = ?auto_7429 ?auto_7435 ) ) ( not ( = ?auto_7430 ?auto_7435 ) ) ( not ( = ?auto_7428 ?auto_7435 ) ) ( not ( = ?auto_7432 ?auto_7435 ) ) ( not ( = ?auto_7445 ?auto_7435 ) ) ( not ( = ?auto_7433 ?auto_7435 ) ) ( AVAILABLE ?auto_7438 ) ( AVAILABLE ?auto_7441 ) ( SURFACE-AT ?auto_7437 ?auto_7434 ) ( ON ?auto_7437 ?auto_7431 ) ( CLEAR ?auto_7437 ) ( not ( = ?auto_7429 ?auto_7431 ) ) ( not ( = ?auto_7430 ?auto_7431 ) ) ( not ( = ?auto_7428 ?auto_7431 ) ) ( not ( = ?auto_7432 ?auto_7431 ) ) ( not ( = ?auto_7445 ?auto_7431 ) ) ( not ( = ?auto_7437 ?auto_7431 ) ) ( not ( = ?auto_7433 ?auto_7431 ) ) ( not ( = ?auto_7435 ?auto_7431 ) ) ( TRUCK-AT ?auto_7440 ?auto_7444 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7429 ?auto_7430 )
      ( MAKE-2CRATE-VERIFY ?auto_7428 ?auto_7429 ?auto_7430 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7446 - SURFACE
      ?auto_7447 - SURFACE
      ?auto_7448 - SURFACE
      ?auto_7449 - SURFACE
    )
    :vars
    (
      ?auto_7462 - HOIST
      ?auto_7459 - PLACE
      ?auto_7454 - PLACE
      ?auto_7458 - HOIST
      ?auto_7461 - SURFACE
      ?auto_7460 - PLACE
      ?auto_7450 - HOIST
      ?auto_7451 - SURFACE
      ?auto_7453 - PLACE
      ?auto_7457 - HOIST
      ?auto_7463 - SURFACE
      ?auto_7452 - SURFACE
      ?auto_7456 - SURFACE
      ?auto_7455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7462 ?auto_7459 ) ( IS-CRATE ?auto_7449 ) ( not ( = ?auto_7448 ?auto_7449 ) ) ( not ( = ?auto_7447 ?auto_7448 ) ) ( not ( = ?auto_7447 ?auto_7449 ) ) ( not ( = ?auto_7454 ?auto_7459 ) ) ( HOIST-AT ?auto_7458 ?auto_7454 ) ( not ( = ?auto_7462 ?auto_7458 ) ) ( SURFACE-AT ?auto_7449 ?auto_7454 ) ( ON ?auto_7449 ?auto_7461 ) ( CLEAR ?auto_7449 ) ( not ( = ?auto_7448 ?auto_7461 ) ) ( not ( = ?auto_7449 ?auto_7461 ) ) ( not ( = ?auto_7447 ?auto_7461 ) ) ( IS-CRATE ?auto_7448 ) ( not ( = ?auto_7460 ?auto_7459 ) ) ( not ( = ?auto_7454 ?auto_7460 ) ) ( HOIST-AT ?auto_7450 ?auto_7460 ) ( not ( = ?auto_7462 ?auto_7450 ) ) ( not ( = ?auto_7458 ?auto_7450 ) ) ( AVAILABLE ?auto_7450 ) ( SURFACE-AT ?auto_7448 ?auto_7460 ) ( ON ?auto_7448 ?auto_7451 ) ( CLEAR ?auto_7448 ) ( not ( = ?auto_7448 ?auto_7451 ) ) ( not ( = ?auto_7449 ?auto_7451 ) ) ( not ( = ?auto_7447 ?auto_7451 ) ) ( not ( = ?auto_7461 ?auto_7451 ) ) ( IS-CRATE ?auto_7447 ) ( not ( = ?auto_7446 ?auto_7447 ) ) ( not ( = ?auto_7448 ?auto_7446 ) ) ( not ( = ?auto_7449 ?auto_7446 ) ) ( not ( = ?auto_7461 ?auto_7446 ) ) ( not ( = ?auto_7451 ?auto_7446 ) ) ( not ( = ?auto_7453 ?auto_7459 ) ) ( not ( = ?auto_7454 ?auto_7453 ) ) ( not ( = ?auto_7460 ?auto_7453 ) ) ( HOIST-AT ?auto_7457 ?auto_7453 ) ( not ( = ?auto_7462 ?auto_7457 ) ) ( not ( = ?auto_7458 ?auto_7457 ) ) ( not ( = ?auto_7450 ?auto_7457 ) ) ( AVAILABLE ?auto_7457 ) ( SURFACE-AT ?auto_7447 ?auto_7453 ) ( ON ?auto_7447 ?auto_7463 ) ( CLEAR ?auto_7447 ) ( not ( = ?auto_7448 ?auto_7463 ) ) ( not ( = ?auto_7449 ?auto_7463 ) ) ( not ( = ?auto_7447 ?auto_7463 ) ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( not ( = ?auto_7451 ?auto_7463 ) ) ( not ( = ?auto_7446 ?auto_7463 ) ) ( SURFACE-AT ?auto_7452 ?auto_7459 ) ( CLEAR ?auto_7452 ) ( IS-CRATE ?auto_7446 ) ( not ( = ?auto_7452 ?auto_7446 ) ) ( not ( = ?auto_7448 ?auto_7452 ) ) ( not ( = ?auto_7449 ?auto_7452 ) ) ( not ( = ?auto_7447 ?auto_7452 ) ) ( not ( = ?auto_7461 ?auto_7452 ) ) ( not ( = ?auto_7451 ?auto_7452 ) ) ( not ( = ?auto_7463 ?auto_7452 ) ) ( AVAILABLE ?auto_7462 ) ( AVAILABLE ?auto_7458 ) ( SURFACE-AT ?auto_7446 ?auto_7454 ) ( ON ?auto_7446 ?auto_7456 ) ( CLEAR ?auto_7446 ) ( not ( = ?auto_7448 ?auto_7456 ) ) ( not ( = ?auto_7449 ?auto_7456 ) ) ( not ( = ?auto_7447 ?auto_7456 ) ) ( not ( = ?auto_7461 ?auto_7456 ) ) ( not ( = ?auto_7451 ?auto_7456 ) ) ( not ( = ?auto_7446 ?auto_7456 ) ) ( not ( = ?auto_7463 ?auto_7456 ) ) ( not ( = ?auto_7452 ?auto_7456 ) ) ( TRUCK-AT ?auto_7455 ?auto_7459 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7447 ?auto_7448 ?auto_7449 )
      ( MAKE-3CRATE-VERIFY ?auto_7446 ?auto_7447 ?auto_7448 ?auto_7449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7464 - SURFACE
      ?auto_7465 - SURFACE
      ?auto_7466 - SURFACE
      ?auto_7467 - SURFACE
      ?auto_7468 - SURFACE
    )
    :vars
    (
      ?auto_7480 - HOIST
      ?auto_7477 - PLACE
      ?auto_7472 - PLACE
      ?auto_7476 - HOIST
      ?auto_7479 - SURFACE
      ?auto_7478 - PLACE
      ?auto_7469 - HOIST
      ?auto_7470 - SURFACE
      ?auto_7471 - PLACE
      ?auto_7475 - HOIST
      ?auto_7481 - SURFACE
      ?auto_7474 - SURFACE
      ?auto_7473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7480 ?auto_7477 ) ( IS-CRATE ?auto_7468 ) ( not ( = ?auto_7467 ?auto_7468 ) ) ( not ( = ?auto_7466 ?auto_7467 ) ) ( not ( = ?auto_7466 ?auto_7468 ) ) ( not ( = ?auto_7472 ?auto_7477 ) ) ( HOIST-AT ?auto_7476 ?auto_7472 ) ( not ( = ?auto_7480 ?auto_7476 ) ) ( SURFACE-AT ?auto_7468 ?auto_7472 ) ( ON ?auto_7468 ?auto_7479 ) ( CLEAR ?auto_7468 ) ( not ( = ?auto_7467 ?auto_7479 ) ) ( not ( = ?auto_7468 ?auto_7479 ) ) ( not ( = ?auto_7466 ?auto_7479 ) ) ( IS-CRATE ?auto_7467 ) ( not ( = ?auto_7478 ?auto_7477 ) ) ( not ( = ?auto_7472 ?auto_7478 ) ) ( HOIST-AT ?auto_7469 ?auto_7478 ) ( not ( = ?auto_7480 ?auto_7469 ) ) ( not ( = ?auto_7476 ?auto_7469 ) ) ( AVAILABLE ?auto_7469 ) ( SURFACE-AT ?auto_7467 ?auto_7478 ) ( ON ?auto_7467 ?auto_7470 ) ( CLEAR ?auto_7467 ) ( not ( = ?auto_7467 ?auto_7470 ) ) ( not ( = ?auto_7468 ?auto_7470 ) ) ( not ( = ?auto_7466 ?auto_7470 ) ) ( not ( = ?auto_7479 ?auto_7470 ) ) ( IS-CRATE ?auto_7466 ) ( not ( = ?auto_7465 ?auto_7466 ) ) ( not ( = ?auto_7467 ?auto_7465 ) ) ( not ( = ?auto_7468 ?auto_7465 ) ) ( not ( = ?auto_7479 ?auto_7465 ) ) ( not ( = ?auto_7470 ?auto_7465 ) ) ( not ( = ?auto_7471 ?auto_7477 ) ) ( not ( = ?auto_7472 ?auto_7471 ) ) ( not ( = ?auto_7478 ?auto_7471 ) ) ( HOIST-AT ?auto_7475 ?auto_7471 ) ( not ( = ?auto_7480 ?auto_7475 ) ) ( not ( = ?auto_7476 ?auto_7475 ) ) ( not ( = ?auto_7469 ?auto_7475 ) ) ( AVAILABLE ?auto_7475 ) ( SURFACE-AT ?auto_7466 ?auto_7471 ) ( ON ?auto_7466 ?auto_7481 ) ( CLEAR ?auto_7466 ) ( not ( = ?auto_7467 ?auto_7481 ) ) ( not ( = ?auto_7468 ?auto_7481 ) ) ( not ( = ?auto_7466 ?auto_7481 ) ) ( not ( = ?auto_7479 ?auto_7481 ) ) ( not ( = ?auto_7470 ?auto_7481 ) ) ( not ( = ?auto_7465 ?auto_7481 ) ) ( SURFACE-AT ?auto_7464 ?auto_7477 ) ( CLEAR ?auto_7464 ) ( IS-CRATE ?auto_7465 ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7467 ?auto_7464 ) ) ( not ( = ?auto_7468 ?auto_7464 ) ) ( not ( = ?auto_7466 ?auto_7464 ) ) ( not ( = ?auto_7479 ?auto_7464 ) ) ( not ( = ?auto_7470 ?auto_7464 ) ) ( not ( = ?auto_7481 ?auto_7464 ) ) ( AVAILABLE ?auto_7480 ) ( AVAILABLE ?auto_7476 ) ( SURFACE-AT ?auto_7465 ?auto_7472 ) ( ON ?auto_7465 ?auto_7474 ) ( CLEAR ?auto_7465 ) ( not ( = ?auto_7467 ?auto_7474 ) ) ( not ( = ?auto_7468 ?auto_7474 ) ) ( not ( = ?auto_7466 ?auto_7474 ) ) ( not ( = ?auto_7479 ?auto_7474 ) ) ( not ( = ?auto_7470 ?auto_7474 ) ) ( not ( = ?auto_7465 ?auto_7474 ) ) ( not ( = ?auto_7481 ?auto_7474 ) ) ( not ( = ?auto_7464 ?auto_7474 ) ) ( TRUCK-AT ?auto_7473 ?auto_7477 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7466 ?auto_7467 ?auto_7468 )
      ( MAKE-4CRATE-VERIFY ?auto_7464 ?auto_7465 ?auto_7466 ?auto_7467 ?auto_7468 ) )
  )

)

