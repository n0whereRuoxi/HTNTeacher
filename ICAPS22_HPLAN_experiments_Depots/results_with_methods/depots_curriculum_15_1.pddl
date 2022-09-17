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
      ?auto_5352 - SURFACE
      ?auto_5353 - SURFACE
    )
    :vars
    (
      ?auto_5354 - HOIST
      ?auto_5355 - PLACE
      ?auto_5357 - PLACE
      ?auto_5358 - HOIST
      ?auto_5359 - SURFACE
      ?auto_5356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5354 ?auto_5355 ) ( SURFACE-AT ?auto_5353 ?auto_5355 ) ( CLEAR ?auto_5353 ) ( IS-CRATE ?auto_5352 ) ( AVAILABLE ?auto_5354 ) ( not ( = ?auto_5357 ?auto_5355 ) ) ( HOIST-AT ?auto_5358 ?auto_5357 ) ( AVAILABLE ?auto_5358 ) ( SURFACE-AT ?auto_5352 ?auto_5357 ) ( ON ?auto_5352 ?auto_5359 ) ( CLEAR ?auto_5352 ) ( TRUCK-AT ?auto_5356 ?auto_5355 ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5359 ) ) ( not ( = ?auto_5353 ?auto_5359 ) ) ( not ( = ?auto_5354 ?auto_5358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5356 ?auto_5355 ?auto_5357 )
      ( !LIFT ?auto_5358 ?auto_5352 ?auto_5359 ?auto_5357 )
      ( !LOAD ?auto_5358 ?auto_5352 ?auto_5356 ?auto_5357 )
      ( !DRIVE ?auto_5356 ?auto_5357 ?auto_5355 )
      ( !UNLOAD ?auto_5354 ?auto_5352 ?auto_5356 ?auto_5355 )
      ( !DROP ?auto_5354 ?auto_5352 ?auto_5353 ?auto_5355 )
      ( MAKE-ON-VERIFY ?auto_5352 ?auto_5353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5362 - SURFACE
      ?auto_5363 - SURFACE
    )
    :vars
    (
      ?auto_5364 - HOIST
      ?auto_5365 - PLACE
      ?auto_5367 - PLACE
      ?auto_5368 - HOIST
      ?auto_5369 - SURFACE
      ?auto_5366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5364 ?auto_5365 ) ( SURFACE-AT ?auto_5363 ?auto_5365 ) ( CLEAR ?auto_5363 ) ( IS-CRATE ?auto_5362 ) ( AVAILABLE ?auto_5364 ) ( not ( = ?auto_5367 ?auto_5365 ) ) ( HOIST-AT ?auto_5368 ?auto_5367 ) ( AVAILABLE ?auto_5368 ) ( SURFACE-AT ?auto_5362 ?auto_5367 ) ( ON ?auto_5362 ?auto_5369 ) ( CLEAR ?auto_5362 ) ( TRUCK-AT ?auto_5366 ?auto_5365 ) ( not ( = ?auto_5362 ?auto_5363 ) ) ( not ( = ?auto_5362 ?auto_5369 ) ) ( not ( = ?auto_5363 ?auto_5369 ) ) ( not ( = ?auto_5364 ?auto_5368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5366 ?auto_5365 ?auto_5367 )
      ( !LIFT ?auto_5368 ?auto_5362 ?auto_5369 ?auto_5367 )
      ( !LOAD ?auto_5368 ?auto_5362 ?auto_5366 ?auto_5367 )
      ( !DRIVE ?auto_5366 ?auto_5367 ?auto_5365 )
      ( !UNLOAD ?auto_5364 ?auto_5362 ?auto_5366 ?auto_5365 )
      ( !DROP ?auto_5364 ?auto_5362 ?auto_5363 ?auto_5365 )
      ( MAKE-ON-VERIFY ?auto_5362 ?auto_5363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5372 - SURFACE
      ?auto_5373 - SURFACE
    )
    :vars
    (
      ?auto_5374 - HOIST
      ?auto_5375 - PLACE
      ?auto_5377 - PLACE
      ?auto_5378 - HOIST
      ?auto_5379 - SURFACE
      ?auto_5376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5374 ?auto_5375 ) ( SURFACE-AT ?auto_5373 ?auto_5375 ) ( CLEAR ?auto_5373 ) ( IS-CRATE ?auto_5372 ) ( AVAILABLE ?auto_5374 ) ( not ( = ?auto_5377 ?auto_5375 ) ) ( HOIST-AT ?auto_5378 ?auto_5377 ) ( AVAILABLE ?auto_5378 ) ( SURFACE-AT ?auto_5372 ?auto_5377 ) ( ON ?auto_5372 ?auto_5379 ) ( CLEAR ?auto_5372 ) ( TRUCK-AT ?auto_5376 ?auto_5375 ) ( not ( = ?auto_5372 ?auto_5373 ) ) ( not ( = ?auto_5372 ?auto_5379 ) ) ( not ( = ?auto_5373 ?auto_5379 ) ) ( not ( = ?auto_5374 ?auto_5378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5376 ?auto_5375 ?auto_5377 )
      ( !LIFT ?auto_5378 ?auto_5372 ?auto_5379 ?auto_5377 )
      ( !LOAD ?auto_5378 ?auto_5372 ?auto_5376 ?auto_5377 )
      ( !DRIVE ?auto_5376 ?auto_5377 ?auto_5375 )
      ( !UNLOAD ?auto_5374 ?auto_5372 ?auto_5376 ?auto_5375 )
      ( !DROP ?auto_5374 ?auto_5372 ?auto_5373 ?auto_5375 )
      ( MAKE-ON-VERIFY ?auto_5372 ?auto_5373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5382 - SURFACE
      ?auto_5383 - SURFACE
    )
    :vars
    (
      ?auto_5384 - HOIST
      ?auto_5385 - PLACE
      ?auto_5387 - PLACE
      ?auto_5388 - HOIST
      ?auto_5389 - SURFACE
      ?auto_5386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5384 ?auto_5385 ) ( SURFACE-AT ?auto_5383 ?auto_5385 ) ( CLEAR ?auto_5383 ) ( IS-CRATE ?auto_5382 ) ( AVAILABLE ?auto_5384 ) ( not ( = ?auto_5387 ?auto_5385 ) ) ( HOIST-AT ?auto_5388 ?auto_5387 ) ( AVAILABLE ?auto_5388 ) ( SURFACE-AT ?auto_5382 ?auto_5387 ) ( ON ?auto_5382 ?auto_5389 ) ( CLEAR ?auto_5382 ) ( TRUCK-AT ?auto_5386 ?auto_5385 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( not ( = ?auto_5382 ?auto_5389 ) ) ( not ( = ?auto_5383 ?auto_5389 ) ) ( not ( = ?auto_5384 ?auto_5388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5386 ?auto_5385 ?auto_5387 )
      ( !LIFT ?auto_5388 ?auto_5382 ?auto_5389 ?auto_5387 )
      ( !LOAD ?auto_5388 ?auto_5382 ?auto_5386 ?auto_5387 )
      ( !DRIVE ?auto_5386 ?auto_5387 ?auto_5385 )
      ( !UNLOAD ?auto_5384 ?auto_5382 ?auto_5386 ?auto_5385 )
      ( !DROP ?auto_5384 ?auto_5382 ?auto_5383 ?auto_5385 )
      ( MAKE-ON-VERIFY ?auto_5382 ?auto_5383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5392 - SURFACE
      ?auto_5393 - SURFACE
    )
    :vars
    (
      ?auto_5394 - HOIST
      ?auto_5395 - PLACE
      ?auto_5397 - PLACE
      ?auto_5398 - HOIST
      ?auto_5399 - SURFACE
      ?auto_5396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5394 ?auto_5395 ) ( SURFACE-AT ?auto_5393 ?auto_5395 ) ( CLEAR ?auto_5393 ) ( IS-CRATE ?auto_5392 ) ( AVAILABLE ?auto_5394 ) ( not ( = ?auto_5397 ?auto_5395 ) ) ( HOIST-AT ?auto_5398 ?auto_5397 ) ( AVAILABLE ?auto_5398 ) ( SURFACE-AT ?auto_5392 ?auto_5397 ) ( ON ?auto_5392 ?auto_5399 ) ( CLEAR ?auto_5392 ) ( TRUCK-AT ?auto_5396 ?auto_5395 ) ( not ( = ?auto_5392 ?auto_5393 ) ) ( not ( = ?auto_5392 ?auto_5399 ) ) ( not ( = ?auto_5393 ?auto_5399 ) ) ( not ( = ?auto_5394 ?auto_5398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5396 ?auto_5395 ?auto_5397 )
      ( !LIFT ?auto_5398 ?auto_5392 ?auto_5399 ?auto_5397 )
      ( !LOAD ?auto_5398 ?auto_5392 ?auto_5396 ?auto_5397 )
      ( !DRIVE ?auto_5396 ?auto_5397 ?auto_5395 )
      ( !UNLOAD ?auto_5394 ?auto_5392 ?auto_5396 ?auto_5395 )
      ( !DROP ?auto_5394 ?auto_5392 ?auto_5393 ?auto_5395 )
      ( MAKE-ON-VERIFY ?auto_5392 ?auto_5393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5402 - SURFACE
      ?auto_5403 - SURFACE
    )
    :vars
    (
      ?auto_5404 - HOIST
      ?auto_5405 - PLACE
      ?auto_5407 - PLACE
      ?auto_5408 - HOIST
      ?auto_5409 - SURFACE
      ?auto_5406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5404 ?auto_5405 ) ( SURFACE-AT ?auto_5403 ?auto_5405 ) ( CLEAR ?auto_5403 ) ( IS-CRATE ?auto_5402 ) ( AVAILABLE ?auto_5404 ) ( not ( = ?auto_5407 ?auto_5405 ) ) ( HOIST-AT ?auto_5408 ?auto_5407 ) ( AVAILABLE ?auto_5408 ) ( SURFACE-AT ?auto_5402 ?auto_5407 ) ( ON ?auto_5402 ?auto_5409 ) ( CLEAR ?auto_5402 ) ( TRUCK-AT ?auto_5406 ?auto_5405 ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5409 ) ) ( not ( = ?auto_5403 ?auto_5409 ) ) ( not ( = ?auto_5404 ?auto_5408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5406 ?auto_5405 ?auto_5407 )
      ( !LIFT ?auto_5408 ?auto_5402 ?auto_5409 ?auto_5407 )
      ( !LOAD ?auto_5408 ?auto_5402 ?auto_5406 ?auto_5407 )
      ( !DRIVE ?auto_5406 ?auto_5407 ?auto_5405 )
      ( !UNLOAD ?auto_5404 ?auto_5402 ?auto_5406 ?auto_5405 )
      ( !DROP ?auto_5404 ?auto_5402 ?auto_5403 ?auto_5405 )
      ( MAKE-ON-VERIFY ?auto_5402 ?auto_5403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5412 - SURFACE
      ?auto_5413 - SURFACE
    )
    :vars
    (
      ?auto_5414 - HOIST
      ?auto_5415 - PLACE
      ?auto_5417 - PLACE
      ?auto_5418 - HOIST
      ?auto_5419 - SURFACE
      ?auto_5416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5414 ?auto_5415 ) ( SURFACE-AT ?auto_5413 ?auto_5415 ) ( CLEAR ?auto_5413 ) ( IS-CRATE ?auto_5412 ) ( AVAILABLE ?auto_5414 ) ( not ( = ?auto_5417 ?auto_5415 ) ) ( HOIST-AT ?auto_5418 ?auto_5417 ) ( AVAILABLE ?auto_5418 ) ( SURFACE-AT ?auto_5412 ?auto_5417 ) ( ON ?auto_5412 ?auto_5419 ) ( CLEAR ?auto_5412 ) ( TRUCK-AT ?auto_5416 ?auto_5415 ) ( not ( = ?auto_5412 ?auto_5413 ) ) ( not ( = ?auto_5412 ?auto_5419 ) ) ( not ( = ?auto_5413 ?auto_5419 ) ) ( not ( = ?auto_5414 ?auto_5418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5416 ?auto_5415 ?auto_5417 )
      ( !LIFT ?auto_5418 ?auto_5412 ?auto_5419 ?auto_5417 )
      ( !LOAD ?auto_5418 ?auto_5412 ?auto_5416 ?auto_5417 )
      ( !DRIVE ?auto_5416 ?auto_5417 ?auto_5415 )
      ( !UNLOAD ?auto_5414 ?auto_5412 ?auto_5416 ?auto_5415 )
      ( !DROP ?auto_5414 ?auto_5412 ?auto_5413 ?auto_5415 )
      ( MAKE-ON-VERIFY ?auto_5412 ?auto_5413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5422 - SURFACE
      ?auto_5423 - SURFACE
    )
    :vars
    (
      ?auto_5424 - HOIST
      ?auto_5425 - PLACE
      ?auto_5427 - PLACE
      ?auto_5428 - HOIST
      ?auto_5429 - SURFACE
      ?auto_5426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5424 ?auto_5425 ) ( SURFACE-AT ?auto_5423 ?auto_5425 ) ( CLEAR ?auto_5423 ) ( IS-CRATE ?auto_5422 ) ( AVAILABLE ?auto_5424 ) ( not ( = ?auto_5427 ?auto_5425 ) ) ( HOIST-AT ?auto_5428 ?auto_5427 ) ( AVAILABLE ?auto_5428 ) ( SURFACE-AT ?auto_5422 ?auto_5427 ) ( ON ?auto_5422 ?auto_5429 ) ( CLEAR ?auto_5422 ) ( TRUCK-AT ?auto_5426 ?auto_5425 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5429 ) ) ( not ( = ?auto_5423 ?auto_5429 ) ) ( not ( = ?auto_5424 ?auto_5428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5426 ?auto_5425 ?auto_5427 )
      ( !LIFT ?auto_5428 ?auto_5422 ?auto_5429 ?auto_5427 )
      ( !LOAD ?auto_5428 ?auto_5422 ?auto_5426 ?auto_5427 )
      ( !DRIVE ?auto_5426 ?auto_5427 ?auto_5425 )
      ( !UNLOAD ?auto_5424 ?auto_5422 ?auto_5426 ?auto_5425 )
      ( !DROP ?auto_5424 ?auto_5422 ?auto_5423 ?auto_5425 )
      ( MAKE-ON-VERIFY ?auto_5422 ?auto_5423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5432 - SURFACE
      ?auto_5433 - SURFACE
    )
    :vars
    (
      ?auto_5434 - HOIST
      ?auto_5435 - PLACE
      ?auto_5437 - PLACE
      ?auto_5438 - HOIST
      ?auto_5439 - SURFACE
      ?auto_5436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5434 ?auto_5435 ) ( SURFACE-AT ?auto_5433 ?auto_5435 ) ( CLEAR ?auto_5433 ) ( IS-CRATE ?auto_5432 ) ( AVAILABLE ?auto_5434 ) ( not ( = ?auto_5437 ?auto_5435 ) ) ( HOIST-AT ?auto_5438 ?auto_5437 ) ( AVAILABLE ?auto_5438 ) ( SURFACE-AT ?auto_5432 ?auto_5437 ) ( ON ?auto_5432 ?auto_5439 ) ( CLEAR ?auto_5432 ) ( TRUCK-AT ?auto_5436 ?auto_5435 ) ( not ( = ?auto_5432 ?auto_5433 ) ) ( not ( = ?auto_5432 ?auto_5439 ) ) ( not ( = ?auto_5433 ?auto_5439 ) ) ( not ( = ?auto_5434 ?auto_5438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5436 ?auto_5435 ?auto_5437 )
      ( !LIFT ?auto_5438 ?auto_5432 ?auto_5439 ?auto_5437 )
      ( !LOAD ?auto_5438 ?auto_5432 ?auto_5436 ?auto_5437 )
      ( !DRIVE ?auto_5436 ?auto_5437 ?auto_5435 )
      ( !UNLOAD ?auto_5434 ?auto_5432 ?auto_5436 ?auto_5435 )
      ( !DROP ?auto_5434 ?auto_5432 ?auto_5433 ?auto_5435 )
      ( MAKE-ON-VERIFY ?auto_5432 ?auto_5433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5442 - SURFACE
      ?auto_5443 - SURFACE
    )
    :vars
    (
      ?auto_5444 - HOIST
      ?auto_5445 - PLACE
      ?auto_5447 - PLACE
      ?auto_5448 - HOIST
      ?auto_5449 - SURFACE
      ?auto_5446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5444 ?auto_5445 ) ( SURFACE-AT ?auto_5443 ?auto_5445 ) ( CLEAR ?auto_5443 ) ( IS-CRATE ?auto_5442 ) ( AVAILABLE ?auto_5444 ) ( not ( = ?auto_5447 ?auto_5445 ) ) ( HOIST-AT ?auto_5448 ?auto_5447 ) ( AVAILABLE ?auto_5448 ) ( SURFACE-AT ?auto_5442 ?auto_5447 ) ( ON ?auto_5442 ?auto_5449 ) ( CLEAR ?auto_5442 ) ( TRUCK-AT ?auto_5446 ?auto_5445 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5449 ) ) ( not ( = ?auto_5443 ?auto_5449 ) ) ( not ( = ?auto_5444 ?auto_5448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5446 ?auto_5445 ?auto_5447 )
      ( !LIFT ?auto_5448 ?auto_5442 ?auto_5449 ?auto_5447 )
      ( !LOAD ?auto_5448 ?auto_5442 ?auto_5446 ?auto_5447 )
      ( !DRIVE ?auto_5446 ?auto_5447 ?auto_5445 )
      ( !UNLOAD ?auto_5444 ?auto_5442 ?auto_5446 ?auto_5445 )
      ( !DROP ?auto_5444 ?auto_5442 ?auto_5443 ?auto_5445 )
      ( MAKE-ON-VERIFY ?auto_5442 ?auto_5443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5452 - SURFACE
      ?auto_5453 - SURFACE
    )
    :vars
    (
      ?auto_5454 - HOIST
      ?auto_5455 - PLACE
      ?auto_5457 - PLACE
      ?auto_5458 - HOIST
      ?auto_5459 - SURFACE
      ?auto_5456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5454 ?auto_5455 ) ( SURFACE-AT ?auto_5453 ?auto_5455 ) ( CLEAR ?auto_5453 ) ( IS-CRATE ?auto_5452 ) ( AVAILABLE ?auto_5454 ) ( not ( = ?auto_5457 ?auto_5455 ) ) ( HOIST-AT ?auto_5458 ?auto_5457 ) ( AVAILABLE ?auto_5458 ) ( SURFACE-AT ?auto_5452 ?auto_5457 ) ( ON ?auto_5452 ?auto_5459 ) ( CLEAR ?auto_5452 ) ( TRUCK-AT ?auto_5456 ?auto_5455 ) ( not ( = ?auto_5452 ?auto_5453 ) ) ( not ( = ?auto_5452 ?auto_5459 ) ) ( not ( = ?auto_5453 ?auto_5459 ) ) ( not ( = ?auto_5454 ?auto_5458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5456 ?auto_5455 ?auto_5457 )
      ( !LIFT ?auto_5458 ?auto_5452 ?auto_5459 ?auto_5457 )
      ( !LOAD ?auto_5458 ?auto_5452 ?auto_5456 ?auto_5457 )
      ( !DRIVE ?auto_5456 ?auto_5457 ?auto_5455 )
      ( !UNLOAD ?auto_5454 ?auto_5452 ?auto_5456 ?auto_5455 )
      ( !DROP ?auto_5454 ?auto_5452 ?auto_5453 ?auto_5455 )
      ( MAKE-ON-VERIFY ?auto_5452 ?auto_5453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5462 - SURFACE
      ?auto_5463 - SURFACE
    )
    :vars
    (
      ?auto_5464 - HOIST
      ?auto_5465 - PLACE
      ?auto_5467 - PLACE
      ?auto_5468 - HOIST
      ?auto_5469 - SURFACE
      ?auto_5466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5464 ?auto_5465 ) ( SURFACE-AT ?auto_5463 ?auto_5465 ) ( CLEAR ?auto_5463 ) ( IS-CRATE ?auto_5462 ) ( AVAILABLE ?auto_5464 ) ( not ( = ?auto_5467 ?auto_5465 ) ) ( HOIST-AT ?auto_5468 ?auto_5467 ) ( AVAILABLE ?auto_5468 ) ( SURFACE-AT ?auto_5462 ?auto_5467 ) ( ON ?auto_5462 ?auto_5469 ) ( CLEAR ?auto_5462 ) ( TRUCK-AT ?auto_5466 ?auto_5465 ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5469 ) ) ( not ( = ?auto_5463 ?auto_5469 ) ) ( not ( = ?auto_5464 ?auto_5468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5466 ?auto_5465 ?auto_5467 )
      ( !LIFT ?auto_5468 ?auto_5462 ?auto_5469 ?auto_5467 )
      ( !LOAD ?auto_5468 ?auto_5462 ?auto_5466 ?auto_5467 )
      ( !DRIVE ?auto_5466 ?auto_5467 ?auto_5465 )
      ( !UNLOAD ?auto_5464 ?auto_5462 ?auto_5466 ?auto_5465 )
      ( !DROP ?auto_5464 ?auto_5462 ?auto_5463 ?auto_5465 )
      ( MAKE-ON-VERIFY ?auto_5462 ?auto_5463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5472 - SURFACE
      ?auto_5473 - SURFACE
    )
    :vars
    (
      ?auto_5474 - HOIST
      ?auto_5475 - PLACE
      ?auto_5477 - PLACE
      ?auto_5478 - HOIST
      ?auto_5479 - SURFACE
      ?auto_5476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5474 ?auto_5475 ) ( SURFACE-AT ?auto_5473 ?auto_5475 ) ( CLEAR ?auto_5473 ) ( IS-CRATE ?auto_5472 ) ( AVAILABLE ?auto_5474 ) ( not ( = ?auto_5477 ?auto_5475 ) ) ( HOIST-AT ?auto_5478 ?auto_5477 ) ( AVAILABLE ?auto_5478 ) ( SURFACE-AT ?auto_5472 ?auto_5477 ) ( ON ?auto_5472 ?auto_5479 ) ( CLEAR ?auto_5472 ) ( TRUCK-AT ?auto_5476 ?auto_5475 ) ( not ( = ?auto_5472 ?auto_5473 ) ) ( not ( = ?auto_5472 ?auto_5479 ) ) ( not ( = ?auto_5473 ?auto_5479 ) ) ( not ( = ?auto_5474 ?auto_5478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5476 ?auto_5475 ?auto_5477 )
      ( !LIFT ?auto_5478 ?auto_5472 ?auto_5479 ?auto_5477 )
      ( !LOAD ?auto_5478 ?auto_5472 ?auto_5476 ?auto_5477 )
      ( !DRIVE ?auto_5476 ?auto_5477 ?auto_5475 )
      ( !UNLOAD ?auto_5474 ?auto_5472 ?auto_5476 ?auto_5475 )
      ( !DROP ?auto_5474 ?auto_5472 ?auto_5473 ?auto_5475 )
      ( MAKE-ON-VERIFY ?auto_5472 ?auto_5473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5482 - SURFACE
      ?auto_5483 - SURFACE
    )
    :vars
    (
      ?auto_5484 - HOIST
      ?auto_5485 - PLACE
      ?auto_5487 - PLACE
      ?auto_5488 - HOIST
      ?auto_5489 - SURFACE
      ?auto_5486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5484 ?auto_5485 ) ( SURFACE-AT ?auto_5483 ?auto_5485 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5482 ) ( AVAILABLE ?auto_5484 ) ( not ( = ?auto_5487 ?auto_5485 ) ) ( HOIST-AT ?auto_5488 ?auto_5487 ) ( AVAILABLE ?auto_5488 ) ( SURFACE-AT ?auto_5482 ?auto_5487 ) ( ON ?auto_5482 ?auto_5489 ) ( CLEAR ?auto_5482 ) ( TRUCK-AT ?auto_5486 ?auto_5485 ) ( not ( = ?auto_5482 ?auto_5483 ) ) ( not ( = ?auto_5482 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5489 ) ) ( not ( = ?auto_5484 ?auto_5488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5486 ?auto_5485 ?auto_5487 )
      ( !LIFT ?auto_5488 ?auto_5482 ?auto_5489 ?auto_5487 )
      ( !LOAD ?auto_5488 ?auto_5482 ?auto_5486 ?auto_5487 )
      ( !DRIVE ?auto_5486 ?auto_5487 ?auto_5485 )
      ( !UNLOAD ?auto_5484 ?auto_5482 ?auto_5486 ?auto_5485 )
      ( !DROP ?auto_5484 ?auto_5482 ?auto_5483 ?auto_5485 )
      ( MAKE-ON-VERIFY ?auto_5482 ?auto_5483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5492 - SURFACE
      ?auto_5493 - SURFACE
    )
    :vars
    (
      ?auto_5494 - HOIST
      ?auto_5495 - PLACE
      ?auto_5497 - PLACE
      ?auto_5498 - HOIST
      ?auto_5499 - SURFACE
      ?auto_5496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5494 ?auto_5495 ) ( SURFACE-AT ?auto_5493 ?auto_5495 ) ( CLEAR ?auto_5493 ) ( IS-CRATE ?auto_5492 ) ( AVAILABLE ?auto_5494 ) ( not ( = ?auto_5497 ?auto_5495 ) ) ( HOIST-AT ?auto_5498 ?auto_5497 ) ( AVAILABLE ?auto_5498 ) ( SURFACE-AT ?auto_5492 ?auto_5497 ) ( ON ?auto_5492 ?auto_5499 ) ( CLEAR ?auto_5492 ) ( TRUCK-AT ?auto_5496 ?auto_5495 ) ( not ( = ?auto_5492 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5499 ) ) ( not ( = ?auto_5493 ?auto_5499 ) ) ( not ( = ?auto_5494 ?auto_5498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5496 ?auto_5495 ?auto_5497 )
      ( !LIFT ?auto_5498 ?auto_5492 ?auto_5499 ?auto_5497 )
      ( !LOAD ?auto_5498 ?auto_5492 ?auto_5496 ?auto_5497 )
      ( !DRIVE ?auto_5496 ?auto_5497 ?auto_5495 )
      ( !UNLOAD ?auto_5494 ?auto_5492 ?auto_5496 ?auto_5495 )
      ( !DROP ?auto_5494 ?auto_5492 ?auto_5493 ?auto_5495 )
      ( MAKE-ON-VERIFY ?auto_5492 ?auto_5493 ) )
  )

)

