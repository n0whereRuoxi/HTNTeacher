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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5310 - SURFACE
      ?auto_5311 - SURFACE
    )
    :vars
    (
      ?auto_5312 - HOIST
      ?auto_5313 - PLACE
      ?auto_5315 - PLACE
      ?auto_5316 - HOIST
      ?auto_5317 - SURFACE
      ?auto_5314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5312 ?auto_5313 ) ( SURFACE-AT ?auto_5310 ?auto_5313 ) ( CLEAR ?auto_5310 ) ( IS-CRATE ?auto_5311 ) ( AVAILABLE ?auto_5312 ) ( not ( = ?auto_5315 ?auto_5313 ) ) ( HOIST-AT ?auto_5316 ?auto_5315 ) ( AVAILABLE ?auto_5316 ) ( SURFACE-AT ?auto_5311 ?auto_5315 ) ( ON ?auto_5311 ?auto_5317 ) ( CLEAR ?auto_5311 ) ( TRUCK-AT ?auto_5314 ?auto_5313 ) ( not ( = ?auto_5310 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5317 ) ) ( not ( = ?auto_5311 ?auto_5317 ) ) ( not ( = ?auto_5312 ?auto_5316 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5314 ?auto_5313 ?auto_5315 )
      ( !LIFT ?auto_5316 ?auto_5311 ?auto_5317 ?auto_5315 )
      ( !LOAD ?auto_5316 ?auto_5311 ?auto_5314 ?auto_5315 )
      ( !DRIVE ?auto_5314 ?auto_5315 ?auto_5313 )
      ( !UNLOAD ?auto_5312 ?auto_5311 ?auto_5314 ?auto_5313 )
      ( !DROP ?auto_5312 ?auto_5311 ?auto_5310 ?auto_5313 )
      ( MAKE-1CRATE-VERIFY ?auto_5310 ?auto_5311 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5331 - SURFACE
      ?auto_5332 - SURFACE
      ?auto_5333 - SURFACE
    )
    :vars
    (
      ?auto_5339 - HOIST
      ?auto_5336 - PLACE
      ?auto_5335 - PLACE
      ?auto_5337 - HOIST
      ?auto_5338 - SURFACE
      ?auto_5341 - PLACE
      ?auto_5340 - HOIST
      ?auto_5342 - SURFACE
      ?auto_5334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5339 ?auto_5336 ) ( IS-CRATE ?auto_5333 ) ( not ( = ?auto_5335 ?auto_5336 ) ) ( HOIST-AT ?auto_5337 ?auto_5335 ) ( AVAILABLE ?auto_5337 ) ( SURFACE-AT ?auto_5333 ?auto_5335 ) ( ON ?auto_5333 ?auto_5338 ) ( CLEAR ?auto_5333 ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5338 ) ) ( not ( = ?auto_5333 ?auto_5338 ) ) ( not ( = ?auto_5339 ?auto_5337 ) ) ( SURFACE-AT ?auto_5331 ?auto_5336 ) ( CLEAR ?auto_5331 ) ( IS-CRATE ?auto_5332 ) ( AVAILABLE ?auto_5339 ) ( not ( = ?auto_5341 ?auto_5336 ) ) ( HOIST-AT ?auto_5340 ?auto_5341 ) ( AVAILABLE ?auto_5340 ) ( SURFACE-AT ?auto_5332 ?auto_5341 ) ( ON ?auto_5332 ?auto_5342 ) ( CLEAR ?auto_5332 ) ( TRUCK-AT ?auto_5334 ?auto_5336 ) ( not ( = ?auto_5331 ?auto_5332 ) ) ( not ( = ?auto_5331 ?auto_5342 ) ) ( not ( = ?auto_5332 ?auto_5342 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5331 ?auto_5333 ) ) ( not ( = ?auto_5331 ?auto_5338 ) ) ( not ( = ?auto_5333 ?auto_5342 ) ) ( not ( = ?auto_5335 ?auto_5341 ) ) ( not ( = ?auto_5337 ?auto_5340 ) ) ( not ( = ?auto_5338 ?auto_5342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5331 ?auto_5332 )
      ( MAKE-1CRATE ?auto_5332 ?auto_5333 )
      ( MAKE-2CRATE-VERIFY ?auto_5331 ?auto_5332 ?auto_5333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5357 - SURFACE
      ?auto_5358 - SURFACE
      ?auto_5359 - SURFACE
      ?auto_5360 - SURFACE
    )
    :vars
    (
      ?auto_5362 - HOIST
      ?auto_5364 - PLACE
      ?auto_5365 - PLACE
      ?auto_5363 - HOIST
      ?auto_5361 - SURFACE
      ?auto_5369 - SURFACE
      ?auto_5367 - PLACE
      ?auto_5370 - HOIST
      ?auto_5368 - SURFACE
      ?auto_5366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5362 ?auto_5364 ) ( IS-CRATE ?auto_5360 ) ( not ( = ?auto_5365 ?auto_5364 ) ) ( HOIST-AT ?auto_5363 ?auto_5365 ) ( SURFACE-AT ?auto_5360 ?auto_5365 ) ( ON ?auto_5360 ?auto_5361 ) ( CLEAR ?auto_5360 ) ( not ( = ?auto_5359 ?auto_5360 ) ) ( not ( = ?auto_5359 ?auto_5361 ) ) ( not ( = ?auto_5360 ?auto_5361 ) ) ( not ( = ?auto_5362 ?auto_5363 ) ) ( IS-CRATE ?auto_5359 ) ( AVAILABLE ?auto_5363 ) ( SURFACE-AT ?auto_5359 ?auto_5365 ) ( ON ?auto_5359 ?auto_5369 ) ( CLEAR ?auto_5359 ) ( not ( = ?auto_5358 ?auto_5359 ) ) ( not ( = ?auto_5358 ?auto_5369 ) ) ( not ( = ?auto_5359 ?auto_5369 ) ) ( SURFACE-AT ?auto_5357 ?auto_5364 ) ( CLEAR ?auto_5357 ) ( IS-CRATE ?auto_5358 ) ( AVAILABLE ?auto_5362 ) ( not ( = ?auto_5367 ?auto_5364 ) ) ( HOIST-AT ?auto_5370 ?auto_5367 ) ( AVAILABLE ?auto_5370 ) ( SURFACE-AT ?auto_5358 ?auto_5367 ) ( ON ?auto_5358 ?auto_5368 ) ( CLEAR ?auto_5358 ) ( TRUCK-AT ?auto_5366 ?auto_5364 ) ( not ( = ?auto_5357 ?auto_5358 ) ) ( not ( = ?auto_5357 ?auto_5368 ) ) ( not ( = ?auto_5358 ?auto_5368 ) ) ( not ( = ?auto_5362 ?auto_5370 ) ) ( not ( = ?auto_5357 ?auto_5359 ) ) ( not ( = ?auto_5357 ?auto_5369 ) ) ( not ( = ?auto_5359 ?auto_5368 ) ) ( not ( = ?auto_5365 ?auto_5367 ) ) ( not ( = ?auto_5363 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5368 ) ) ( not ( = ?auto_5357 ?auto_5360 ) ) ( not ( = ?auto_5357 ?auto_5361 ) ) ( not ( = ?auto_5358 ?auto_5360 ) ) ( not ( = ?auto_5358 ?auto_5361 ) ) ( not ( = ?auto_5360 ?auto_5369 ) ) ( not ( = ?auto_5360 ?auto_5368 ) ) ( not ( = ?auto_5361 ?auto_5369 ) ) ( not ( = ?auto_5361 ?auto_5368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5357 ?auto_5358 ?auto_5359 )
      ( MAKE-1CRATE ?auto_5359 ?auto_5360 )
      ( MAKE-3CRATE-VERIFY ?auto_5357 ?auto_5358 ?auto_5359 ?auto_5360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5386 - SURFACE
      ?auto_5387 - SURFACE
      ?auto_5388 - SURFACE
      ?auto_5389 - SURFACE
      ?auto_5390 - SURFACE
    )
    :vars
    (
      ?auto_5392 - HOIST
      ?auto_5393 - PLACE
      ?auto_5394 - PLACE
      ?auto_5391 - HOIST
      ?auto_5395 - SURFACE
      ?auto_5402 - PLACE
      ?auto_5403 - HOIST
      ?auto_5397 - SURFACE
      ?auto_5398 - SURFACE
      ?auto_5401 - PLACE
      ?auto_5399 - HOIST
      ?auto_5400 - SURFACE
      ?auto_5396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5392 ?auto_5393 ) ( IS-CRATE ?auto_5390 ) ( not ( = ?auto_5394 ?auto_5393 ) ) ( HOIST-AT ?auto_5391 ?auto_5394 ) ( AVAILABLE ?auto_5391 ) ( SURFACE-AT ?auto_5390 ?auto_5394 ) ( ON ?auto_5390 ?auto_5395 ) ( CLEAR ?auto_5390 ) ( not ( = ?auto_5389 ?auto_5390 ) ) ( not ( = ?auto_5389 ?auto_5395 ) ) ( not ( = ?auto_5390 ?auto_5395 ) ) ( not ( = ?auto_5392 ?auto_5391 ) ) ( IS-CRATE ?auto_5389 ) ( not ( = ?auto_5402 ?auto_5393 ) ) ( HOIST-AT ?auto_5403 ?auto_5402 ) ( SURFACE-AT ?auto_5389 ?auto_5402 ) ( ON ?auto_5389 ?auto_5397 ) ( CLEAR ?auto_5389 ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5397 ) ) ( not ( = ?auto_5389 ?auto_5397 ) ) ( not ( = ?auto_5392 ?auto_5403 ) ) ( IS-CRATE ?auto_5388 ) ( AVAILABLE ?auto_5403 ) ( SURFACE-AT ?auto_5388 ?auto_5402 ) ( ON ?auto_5388 ?auto_5398 ) ( CLEAR ?auto_5388 ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5398 ) ) ( not ( = ?auto_5388 ?auto_5398 ) ) ( SURFACE-AT ?auto_5386 ?auto_5393 ) ( CLEAR ?auto_5386 ) ( IS-CRATE ?auto_5387 ) ( AVAILABLE ?auto_5392 ) ( not ( = ?auto_5401 ?auto_5393 ) ) ( HOIST-AT ?auto_5399 ?auto_5401 ) ( AVAILABLE ?auto_5399 ) ( SURFACE-AT ?auto_5387 ?auto_5401 ) ( ON ?auto_5387 ?auto_5400 ) ( CLEAR ?auto_5387 ) ( TRUCK-AT ?auto_5396 ?auto_5393 ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5400 ) ) ( not ( = ?auto_5387 ?auto_5400 ) ) ( not ( = ?auto_5392 ?auto_5399 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5386 ?auto_5398 ) ) ( not ( = ?auto_5388 ?auto_5400 ) ) ( not ( = ?auto_5402 ?auto_5401 ) ) ( not ( = ?auto_5403 ?auto_5399 ) ) ( not ( = ?auto_5398 ?auto_5400 ) ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( not ( = ?auto_5386 ?auto_5397 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5397 ) ) ( not ( = ?auto_5389 ?auto_5398 ) ) ( not ( = ?auto_5389 ?auto_5400 ) ) ( not ( = ?auto_5397 ?auto_5398 ) ) ( not ( = ?auto_5397 ?auto_5400 ) ) ( not ( = ?auto_5386 ?auto_5390 ) ) ( not ( = ?auto_5386 ?auto_5395 ) ) ( not ( = ?auto_5387 ?auto_5390 ) ) ( not ( = ?auto_5387 ?auto_5395 ) ) ( not ( = ?auto_5388 ?auto_5390 ) ) ( not ( = ?auto_5388 ?auto_5395 ) ) ( not ( = ?auto_5390 ?auto_5397 ) ) ( not ( = ?auto_5390 ?auto_5398 ) ) ( not ( = ?auto_5390 ?auto_5400 ) ) ( not ( = ?auto_5394 ?auto_5402 ) ) ( not ( = ?auto_5394 ?auto_5401 ) ) ( not ( = ?auto_5391 ?auto_5403 ) ) ( not ( = ?auto_5391 ?auto_5399 ) ) ( not ( = ?auto_5395 ?auto_5397 ) ) ( not ( = ?auto_5395 ?auto_5398 ) ) ( not ( = ?auto_5395 ?auto_5400 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5389 )
      ( MAKE-1CRATE ?auto_5389 ?auto_5390 )
      ( MAKE-4CRATE-VERIFY ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5389 ?auto_5390 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5420 - SURFACE
      ?auto_5421 - SURFACE
      ?auto_5422 - SURFACE
      ?auto_5423 - SURFACE
      ?auto_5424 - SURFACE
      ?auto_5425 - SURFACE
    )
    :vars
    (
      ?auto_5429 - HOIST
      ?auto_5430 - PLACE
      ?auto_5431 - PLACE
      ?auto_5426 - HOIST
      ?auto_5427 - SURFACE
      ?auto_5441 - PLACE
      ?auto_5438 - HOIST
      ?auto_5433 - SURFACE
      ?auto_5436 - PLACE
      ?auto_5437 - HOIST
      ?auto_5432 - SURFACE
      ?auto_5435 - SURFACE
      ?auto_5440 - PLACE
      ?auto_5434 - HOIST
      ?auto_5439 - SURFACE
      ?auto_5428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5429 ?auto_5430 ) ( IS-CRATE ?auto_5425 ) ( not ( = ?auto_5431 ?auto_5430 ) ) ( HOIST-AT ?auto_5426 ?auto_5431 ) ( AVAILABLE ?auto_5426 ) ( SURFACE-AT ?auto_5425 ?auto_5431 ) ( ON ?auto_5425 ?auto_5427 ) ( CLEAR ?auto_5425 ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5427 ) ) ( not ( = ?auto_5425 ?auto_5427 ) ) ( not ( = ?auto_5429 ?auto_5426 ) ) ( IS-CRATE ?auto_5424 ) ( not ( = ?auto_5441 ?auto_5430 ) ) ( HOIST-AT ?auto_5438 ?auto_5441 ) ( AVAILABLE ?auto_5438 ) ( SURFACE-AT ?auto_5424 ?auto_5441 ) ( ON ?auto_5424 ?auto_5433 ) ( CLEAR ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( not ( = ?auto_5423 ?auto_5433 ) ) ( not ( = ?auto_5424 ?auto_5433 ) ) ( not ( = ?auto_5429 ?auto_5438 ) ) ( IS-CRATE ?auto_5423 ) ( not ( = ?auto_5436 ?auto_5430 ) ) ( HOIST-AT ?auto_5437 ?auto_5436 ) ( SURFACE-AT ?auto_5423 ?auto_5436 ) ( ON ?auto_5423 ?auto_5432 ) ( CLEAR ?auto_5423 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5432 ) ) ( not ( = ?auto_5423 ?auto_5432 ) ) ( not ( = ?auto_5429 ?auto_5437 ) ) ( IS-CRATE ?auto_5422 ) ( AVAILABLE ?auto_5437 ) ( SURFACE-AT ?auto_5422 ?auto_5436 ) ( ON ?auto_5422 ?auto_5435 ) ( CLEAR ?auto_5422 ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5435 ) ) ( not ( = ?auto_5422 ?auto_5435 ) ) ( SURFACE-AT ?auto_5420 ?auto_5430 ) ( CLEAR ?auto_5420 ) ( IS-CRATE ?auto_5421 ) ( AVAILABLE ?auto_5429 ) ( not ( = ?auto_5440 ?auto_5430 ) ) ( HOIST-AT ?auto_5434 ?auto_5440 ) ( AVAILABLE ?auto_5434 ) ( SURFACE-AT ?auto_5421 ?auto_5440 ) ( ON ?auto_5421 ?auto_5439 ) ( CLEAR ?auto_5421 ) ( TRUCK-AT ?auto_5428 ?auto_5430 ) ( not ( = ?auto_5420 ?auto_5421 ) ) ( not ( = ?auto_5420 ?auto_5439 ) ) ( not ( = ?auto_5421 ?auto_5439 ) ) ( not ( = ?auto_5429 ?auto_5434 ) ) ( not ( = ?auto_5420 ?auto_5422 ) ) ( not ( = ?auto_5420 ?auto_5435 ) ) ( not ( = ?auto_5422 ?auto_5439 ) ) ( not ( = ?auto_5436 ?auto_5440 ) ) ( not ( = ?auto_5437 ?auto_5434 ) ) ( not ( = ?auto_5435 ?auto_5439 ) ) ( not ( = ?auto_5420 ?auto_5423 ) ) ( not ( = ?auto_5420 ?auto_5432 ) ) ( not ( = ?auto_5421 ?auto_5423 ) ) ( not ( = ?auto_5421 ?auto_5432 ) ) ( not ( = ?auto_5423 ?auto_5435 ) ) ( not ( = ?auto_5423 ?auto_5439 ) ) ( not ( = ?auto_5432 ?auto_5435 ) ) ( not ( = ?auto_5432 ?auto_5439 ) ) ( not ( = ?auto_5420 ?auto_5424 ) ) ( not ( = ?auto_5420 ?auto_5433 ) ) ( not ( = ?auto_5421 ?auto_5424 ) ) ( not ( = ?auto_5421 ?auto_5433 ) ) ( not ( = ?auto_5422 ?auto_5424 ) ) ( not ( = ?auto_5422 ?auto_5433 ) ) ( not ( = ?auto_5424 ?auto_5432 ) ) ( not ( = ?auto_5424 ?auto_5435 ) ) ( not ( = ?auto_5424 ?auto_5439 ) ) ( not ( = ?auto_5441 ?auto_5436 ) ) ( not ( = ?auto_5441 ?auto_5440 ) ) ( not ( = ?auto_5438 ?auto_5437 ) ) ( not ( = ?auto_5438 ?auto_5434 ) ) ( not ( = ?auto_5433 ?auto_5432 ) ) ( not ( = ?auto_5433 ?auto_5435 ) ) ( not ( = ?auto_5433 ?auto_5439 ) ) ( not ( = ?auto_5420 ?auto_5425 ) ) ( not ( = ?auto_5420 ?auto_5427 ) ) ( not ( = ?auto_5421 ?auto_5425 ) ) ( not ( = ?auto_5421 ?auto_5427 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5427 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5427 ) ) ( not ( = ?auto_5425 ?auto_5433 ) ) ( not ( = ?auto_5425 ?auto_5432 ) ) ( not ( = ?auto_5425 ?auto_5435 ) ) ( not ( = ?auto_5425 ?auto_5439 ) ) ( not ( = ?auto_5431 ?auto_5441 ) ) ( not ( = ?auto_5431 ?auto_5436 ) ) ( not ( = ?auto_5431 ?auto_5440 ) ) ( not ( = ?auto_5426 ?auto_5438 ) ) ( not ( = ?auto_5426 ?auto_5437 ) ) ( not ( = ?auto_5426 ?auto_5434 ) ) ( not ( = ?auto_5427 ?auto_5433 ) ) ( not ( = ?auto_5427 ?auto_5432 ) ) ( not ( = ?auto_5427 ?auto_5435 ) ) ( not ( = ?auto_5427 ?auto_5439 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5420 ?auto_5421 ?auto_5422 ?auto_5423 ?auto_5424 )
      ( MAKE-1CRATE ?auto_5424 ?auto_5425 )
      ( MAKE-5CRATE-VERIFY ?auto_5420 ?auto_5421 ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5459 - SURFACE
      ?auto_5460 - SURFACE
      ?auto_5461 - SURFACE
      ?auto_5462 - SURFACE
      ?auto_5463 - SURFACE
      ?auto_5464 - SURFACE
      ?auto_5465 - SURFACE
    )
    :vars
    (
      ?auto_5470 - HOIST
      ?auto_5466 - PLACE
      ?auto_5467 - PLACE
      ?auto_5471 - HOIST
      ?auto_5469 - SURFACE
      ?auto_5477 - PLACE
      ?auto_5479 - HOIST
      ?auto_5483 - SURFACE
      ?auto_5478 - PLACE
      ?auto_5482 - HOIST
      ?auto_5480 - SURFACE
      ?auto_5481 - PLACE
      ?auto_5472 - HOIST
      ?auto_5475 - SURFACE
      ?auto_5484 - SURFACE
      ?auto_5473 - PLACE
      ?auto_5474 - HOIST
      ?auto_5476 - SURFACE
      ?auto_5468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5470 ?auto_5466 ) ( IS-CRATE ?auto_5465 ) ( not ( = ?auto_5467 ?auto_5466 ) ) ( HOIST-AT ?auto_5471 ?auto_5467 ) ( AVAILABLE ?auto_5471 ) ( SURFACE-AT ?auto_5465 ?auto_5467 ) ( ON ?auto_5465 ?auto_5469 ) ( CLEAR ?auto_5465 ) ( not ( = ?auto_5464 ?auto_5465 ) ) ( not ( = ?auto_5464 ?auto_5469 ) ) ( not ( = ?auto_5465 ?auto_5469 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( IS-CRATE ?auto_5464 ) ( not ( = ?auto_5477 ?auto_5466 ) ) ( HOIST-AT ?auto_5479 ?auto_5477 ) ( AVAILABLE ?auto_5479 ) ( SURFACE-AT ?auto_5464 ?auto_5477 ) ( ON ?auto_5464 ?auto_5483 ) ( CLEAR ?auto_5464 ) ( not ( = ?auto_5463 ?auto_5464 ) ) ( not ( = ?auto_5463 ?auto_5483 ) ) ( not ( = ?auto_5464 ?auto_5483 ) ) ( not ( = ?auto_5470 ?auto_5479 ) ) ( IS-CRATE ?auto_5463 ) ( not ( = ?auto_5478 ?auto_5466 ) ) ( HOIST-AT ?auto_5482 ?auto_5478 ) ( AVAILABLE ?auto_5482 ) ( SURFACE-AT ?auto_5463 ?auto_5478 ) ( ON ?auto_5463 ?auto_5480 ) ( CLEAR ?auto_5463 ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5480 ) ) ( not ( = ?auto_5463 ?auto_5480 ) ) ( not ( = ?auto_5470 ?auto_5482 ) ) ( IS-CRATE ?auto_5462 ) ( not ( = ?auto_5481 ?auto_5466 ) ) ( HOIST-AT ?auto_5472 ?auto_5481 ) ( SURFACE-AT ?auto_5462 ?auto_5481 ) ( ON ?auto_5462 ?auto_5475 ) ( CLEAR ?auto_5462 ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( not ( = ?auto_5461 ?auto_5475 ) ) ( not ( = ?auto_5462 ?auto_5475 ) ) ( not ( = ?auto_5470 ?auto_5472 ) ) ( IS-CRATE ?auto_5461 ) ( AVAILABLE ?auto_5472 ) ( SURFACE-AT ?auto_5461 ?auto_5481 ) ( ON ?auto_5461 ?auto_5484 ) ( CLEAR ?auto_5461 ) ( not ( = ?auto_5460 ?auto_5461 ) ) ( not ( = ?auto_5460 ?auto_5484 ) ) ( not ( = ?auto_5461 ?auto_5484 ) ) ( SURFACE-AT ?auto_5459 ?auto_5466 ) ( CLEAR ?auto_5459 ) ( IS-CRATE ?auto_5460 ) ( AVAILABLE ?auto_5470 ) ( not ( = ?auto_5473 ?auto_5466 ) ) ( HOIST-AT ?auto_5474 ?auto_5473 ) ( AVAILABLE ?auto_5474 ) ( SURFACE-AT ?auto_5460 ?auto_5473 ) ( ON ?auto_5460 ?auto_5476 ) ( CLEAR ?auto_5460 ) ( TRUCK-AT ?auto_5468 ?auto_5466 ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( not ( = ?auto_5459 ?auto_5476 ) ) ( not ( = ?auto_5460 ?auto_5476 ) ) ( not ( = ?auto_5470 ?auto_5474 ) ) ( not ( = ?auto_5459 ?auto_5461 ) ) ( not ( = ?auto_5459 ?auto_5484 ) ) ( not ( = ?auto_5461 ?auto_5476 ) ) ( not ( = ?auto_5481 ?auto_5473 ) ) ( not ( = ?auto_5472 ?auto_5474 ) ) ( not ( = ?auto_5484 ?auto_5476 ) ) ( not ( = ?auto_5459 ?auto_5462 ) ) ( not ( = ?auto_5459 ?auto_5475 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( not ( = ?auto_5460 ?auto_5475 ) ) ( not ( = ?auto_5462 ?auto_5484 ) ) ( not ( = ?auto_5462 ?auto_5476 ) ) ( not ( = ?auto_5475 ?auto_5484 ) ) ( not ( = ?auto_5475 ?auto_5476 ) ) ( not ( = ?auto_5459 ?auto_5463 ) ) ( not ( = ?auto_5459 ?auto_5480 ) ) ( not ( = ?auto_5460 ?auto_5463 ) ) ( not ( = ?auto_5460 ?auto_5480 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5480 ) ) ( not ( = ?auto_5463 ?auto_5475 ) ) ( not ( = ?auto_5463 ?auto_5484 ) ) ( not ( = ?auto_5463 ?auto_5476 ) ) ( not ( = ?auto_5478 ?auto_5481 ) ) ( not ( = ?auto_5478 ?auto_5473 ) ) ( not ( = ?auto_5482 ?auto_5472 ) ) ( not ( = ?auto_5482 ?auto_5474 ) ) ( not ( = ?auto_5480 ?auto_5475 ) ) ( not ( = ?auto_5480 ?auto_5484 ) ) ( not ( = ?auto_5480 ?auto_5476 ) ) ( not ( = ?auto_5459 ?auto_5464 ) ) ( not ( = ?auto_5459 ?auto_5483 ) ) ( not ( = ?auto_5460 ?auto_5464 ) ) ( not ( = ?auto_5460 ?auto_5483 ) ) ( not ( = ?auto_5461 ?auto_5464 ) ) ( not ( = ?auto_5461 ?auto_5483 ) ) ( not ( = ?auto_5462 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5483 ) ) ( not ( = ?auto_5464 ?auto_5480 ) ) ( not ( = ?auto_5464 ?auto_5475 ) ) ( not ( = ?auto_5464 ?auto_5484 ) ) ( not ( = ?auto_5464 ?auto_5476 ) ) ( not ( = ?auto_5477 ?auto_5478 ) ) ( not ( = ?auto_5477 ?auto_5481 ) ) ( not ( = ?auto_5477 ?auto_5473 ) ) ( not ( = ?auto_5479 ?auto_5482 ) ) ( not ( = ?auto_5479 ?auto_5472 ) ) ( not ( = ?auto_5479 ?auto_5474 ) ) ( not ( = ?auto_5483 ?auto_5480 ) ) ( not ( = ?auto_5483 ?auto_5475 ) ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( not ( = ?auto_5483 ?auto_5476 ) ) ( not ( = ?auto_5459 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5469 ) ) ( not ( = ?auto_5460 ?auto_5465 ) ) ( not ( = ?auto_5460 ?auto_5469 ) ) ( not ( = ?auto_5461 ?auto_5465 ) ) ( not ( = ?auto_5461 ?auto_5469 ) ) ( not ( = ?auto_5462 ?auto_5465 ) ) ( not ( = ?auto_5462 ?auto_5469 ) ) ( not ( = ?auto_5463 ?auto_5465 ) ) ( not ( = ?auto_5463 ?auto_5469 ) ) ( not ( = ?auto_5465 ?auto_5483 ) ) ( not ( = ?auto_5465 ?auto_5480 ) ) ( not ( = ?auto_5465 ?auto_5475 ) ) ( not ( = ?auto_5465 ?auto_5484 ) ) ( not ( = ?auto_5465 ?auto_5476 ) ) ( not ( = ?auto_5467 ?auto_5477 ) ) ( not ( = ?auto_5467 ?auto_5478 ) ) ( not ( = ?auto_5467 ?auto_5481 ) ) ( not ( = ?auto_5467 ?auto_5473 ) ) ( not ( = ?auto_5471 ?auto_5479 ) ) ( not ( = ?auto_5471 ?auto_5482 ) ) ( not ( = ?auto_5471 ?auto_5472 ) ) ( not ( = ?auto_5471 ?auto_5474 ) ) ( not ( = ?auto_5469 ?auto_5483 ) ) ( not ( = ?auto_5469 ?auto_5480 ) ) ( not ( = ?auto_5469 ?auto_5475 ) ) ( not ( = ?auto_5469 ?auto_5484 ) ) ( not ( = ?auto_5469 ?auto_5476 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5459 ?auto_5460 ?auto_5461 ?auto_5462 ?auto_5463 ?auto_5464 )
      ( MAKE-1CRATE ?auto_5464 ?auto_5465 )
      ( MAKE-6CRATE-VERIFY ?auto_5459 ?auto_5460 ?auto_5461 ?auto_5462 ?auto_5463 ?auto_5464 ?auto_5465 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5503 - SURFACE
      ?auto_5504 - SURFACE
      ?auto_5505 - SURFACE
      ?auto_5506 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5508 - SURFACE
      ?auto_5509 - SURFACE
      ?auto_5510 - SURFACE
    )
    :vars
    (
      ?auto_5512 - HOIST
      ?auto_5514 - PLACE
      ?auto_5511 - PLACE
      ?auto_5516 - HOIST
      ?auto_5513 - SURFACE
      ?auto_5528 - PLACE
      ?auto_5520 - HOIST
      ?auto_5521 - SURFACE
      ?auto_5519 - PLACE
      ?auto_5524 - HOIST
      ?auto_5530 - SURFACE
      ?auto_5529 - PLACE
      ?auto_5517 - HOIST
      ?auto_5531 - SURFACE
      ?auto_5526 - PLACE
      ?auto_5518 - HOIST
      ?auto_5525 - SURFACE
      ?auto_5522 - SURFACE
      ?auto_5523 - PLACE
      ?auto_5532 - HOIST
      ?auto_5527 - SURFACE
      ?auto_5515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5512 ?auto_5514 ) ( IS-CRATE ?auto_5510 ) ( not ( = ?auto_5511 ?auto_5514 ) ) ( HOIST-AT ?auto_5516 ?auto_5511 ) ( AVAILABLE ?auto_5516 ) ( SURFACE-AT ?auto_5510 ?auto_5511 ) ( ON ?auto_5510 ?auto_5513 ) ( CLEAR ?auto_5510 ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5513 ) ) ( not ( = ?auto_5510 ?auto_5513 ) ) ( not ( = ?auto_5512 ?auto_5516 ) ) ( IS-CRATE ?auto_5509 ) ( not ( = ?auto_5528 ?auto_5514 ) ) ( HOIST-AT ?auto_5520 ?auto_5528 ) ( AVAILABLE ?auto_5520 ) ( SURFACE-AT ?auto_5509 ?auto_5528 ) ( ON ?auto_5509 ?auto_5521 ) ( CLEAR ?auto_5509 ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5521 ) ) ( not ( = ?auto_5509 ?auto_5521 ) ) ( not ( = ?auto_5512 ?auto_5520 ) ) ( IS-CRATE ?auto_5508 ) ( not ( = ?auto_5519 ?auto_5514 ) ) ( HOIST-AT ?auto_5524 ?auto_5519 ) ( AVAILABLE ?auto_5524 ) ( SURFACE-AT ?auto_5508 ?auto_5519 ) ( ON ?auto_5508 ?auto_5530 ) ( CLEAR ?auto_5508 ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( not ( = ?auto_5507 ?auto_5530 ) ) ( not ( = ?auto_5508 ?auto_5530 ) ) ( not ( = ?auto_5512 ?auto_5524 ) ) ( IS-CRATE ?auto_5507 ) ( not ( = ?auto_5529 ?auto_5514 ) ) ( HOIST-AT ?auto_5517 ?auto_5529 ) ( AVAILABLE ?auto_5517 ) ( SURFACE-AT ?auto_5507 ?auto_5529 ) ( ON ?auto_5507 ?auto_5531 ) ( CLEAR ?auto_5507 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5531 ) ) ( not ( = ?auto_5507 ?auto_5531 ) ) ( not ( = ?auto_5512 ?auto_5517 ) ) ( IS-CRATE ?auto_5506 ) ( not ( = ?auto_5526 ?auto_5514 ) ) ( HOIST-AT ?auto_5518 ?auto_5526 ) ( SURFACE-AT ?auto_5506 ?auto_5526 ) ( ON ?auto_5506 ?auto_5525 ) ( CLEAR ?auto_5506 ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5525 ) ) ( not ( = ?auto_5506 ?auto_5525 ) ) ( not ( = ?auto_5512 ?auto_5518 ) ) ( IS-CRATE ?auto_5505 ) ( AVAILABLE ?auto_5518 ) ( SURFACE-AT ?auto_5505 ?auto_5526 ) ( ON ?auto_5505 ?auto_5522 ) ( CLEAR ?auto_5505 ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( not ( = ?auto_5504 ?auto_5522 ) ) ( not ( = ?auto_5505 ?auto_5522 ) ) ( SURFACE-AT ?auto_5503 ?auto_5514 ) ( CLEAR ?auto_5503 ) ( IS-CRATE ?auto_5504 ) ( AVAILABLE ?auto_5512 ) ( not ( = ?auto_5523 ?auto_5514 ) ) ( HOIST-AT ?auto_5532 ?auto_5523 ) ( AVAILABLE ?auto_5532 ) ( SURFACE-AT ?auto_5504 ?auto_5523 ) ( ON ?auto_5504 ?auto_5527 ) ( CLEAR ?auto_5504 ) ( TRUCK-AT ?auto_5515 ?auto_5514 ) ( not ( = ?auto_5503 ?auto_5504 ) ) ( not ( = ?auto_5503 ?auto_5527 ) ) ( not ( = ?auto_5504 ?auto_5527 ) ) ( not ( = ?auto_5512 ?auto_5532 ) ) ( not ( = ?auto_5503 ?auto_5505 ) ) ( not ( = ?auto_5503 ?auto_5522 ) ) ( not ( = ?auto_5505 ?auto_5527 ) ) ( not ( = ?auto_5526 ?auto_5523 ) ) ( not ( = ?auto_5518 ?auto_5532 ) ) ( not ( = ?auto_5522 ?auto_5527 ) ) ( not ( = ?auto_5503 ?auto_5506 ) ) ( not ( = ?auto_5503 ?auto_5525 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5504 ?auto_5525 ) ) ( not ( = ?auto_5506 ?auto_5522 ) ) ( not ( = ?auto_5506 ?auto_5527 ) ) ( not ( = ?auto_5525 ?auto_5522 ) ) ( not ( = ?auto_5525 ?auto_5527 ) ) ( not ( = ?auto_5503 ?auto_5507 ) ) ( not ( = ?auto_5503 ?auto_5531 ) ) ( not ( = ?auto_5504 ?auto_5507 ) ) ( not ( = ?auto_5504 ?auto_5531 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5531 ) ) ( not ( = ?auto_5507 ?auto_5525 ) ) ( not ( = ?auto_5507 ?auto_5522 ) ) ( not ( = ?auto_5507 ?auto_5527 ) ) ( not ( = ?auto_5529 ?auto_5526 ) ) ( not ( = ?auto_5529 ?auto_5523 ) ) ( not ( = ?auto_5517 ?auto_5518 ) ) ( not ( = ?auto_5517 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5525 ) ) ( not ( = ?auto_5531 ?auto_5522 ) ) ( not ( = ?auto_5531 ?auto_5527 ) ) ( not ( = ?auto_5503 ?auto_5508 ) ) ( not ( = ?auto_5503 ?auto_5530 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) ( not ( = ?auto_5504 ?auto_5530 ) ) ( not ( = ?auto_5505 ?auto_5508 ) ) ( not ( = ?auto_5505 ?auto_5530 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5530 ) ) ( not ( = ?auto_5508 ?auto_5531 ) ) ( not ( = ?auto_5508 ?auto_5525 ) ) ( not ( = ?auto_5508 ?auto_5522 ) ) ( not ( = ?auto_5508 ?auto_5527 ) ) ( not ( = ?auto_5519 ?auto_5529 ) ) ( not ( = ?auto_5519 ?auto_5526 ) ) ( not ( = ?auto_5519 ?auto_5523 ) ) ( not ( = ?auto_5524 ?auto_5517 ) ) ( not ( = ?auto_5524 ?auto_5518 ) ) ( not ( = ?auto_5524 ?auto_5532 ) ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5525 ) ) ( not ( = ?auto_5530 ?auto_5522 ) ) ( not ( = ?auto_5530 ?auto_5527 ) ) ( not ( = ?auto_5503 ?auto_5509 ) ) ( not ( = ?auto_5503 ?auto_5521 ) ) ( not ( = ?auto_5504 ?auto_5509 ) ) ( not ( = ?auto_5504 ?auto_5521 ) ) ( not ( = ?auto_5505 ?auto_5509 ) ) ( not ( = ?auto_5505 ?auto_5521 ) ) ( not ( = ?auto_5506 ?auto_5509 ) ) ( not ( = ?auto_5506 ?auto_5521 ) ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( not ( = ?auto_5507 ?auto_5521 ) ) ( not ( = ?auto_5509 ?auto_5530 ) ) ( not ( = ?auto_5509 ?auto_5531 ) ) ( not ( = ?auto_5509 ?auto_5525 ) ) ( not ( = ?auto_5509 ?auto_5522 ) ) ( not ( = ?auto_5509 ?auto_5527 ) ) ( not ( = ?auto_5528 ?auto_5519 ) ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( not ( = ?auto_5528 ?auto_5526 ) ) ( not ( = ?auto_5528 ?auto_5523 ) ) ( not ( = ?auto_5520 ?auto_5524 ) ) ( not ( = ?auto_5520 ?auto_5517 ) ) ( not ( = ?auto_5520 ?auto_5518 ) ) ( not ( = ?auto_5520 ?auto_5532 ) ) ( not ( = ?auto_5521 ?auto_5530 ) ) ( not ( = ?auto_5521 ?auto_5531 ) ) ( not ( = ?auto_5521 ?auto_5525 ) ) ( not ( = ?auto_5521 ?auto_5522 ) ) ( not ( = ?auto_5521 ?auto_5527 ) ) ( not ( = ?auto_5503 ?auto_5510 ) ) ( not ( = ?auto_5503 ?auto_5513 ) ) ( not ( = ?auto_5504 ?auto_5510 ) ) ( not ( = ?auto_5504 ?auto_5513 ) ) ( not ( = ?auto_5505 ?auto_5510 ) ) ( not ( = ?auto_5505 ?auto_5513 ) ) ( not ( = ?auto_5506 ?auto_5510 ) ) ( not ( = ?auto_5506 ?auto_5513 ) ) ( not ( = ?auto_5507 ?auto_5510 ) ) ( not ( = ?auto_5507 ?auto_5513 ) ) ( not ( = ?auto_5508 ?auto_5510 ) ) ( not ( = ?auto_5508 ?auto_5513 ) ) ( not ( = ?auto_5510 ?auto_5521 ) ) ( not ( = ?auto_5510 ?auto_5530 ) ) ( not ( = ?auto_5510 ?auto_5531 ) ) ( not ( = ?auto_5510 ?auto_5525 ) ) ( not ( = ?auto_5510 ?auto_5522 ) ) ( not ( = ?auto_5510 ?auto_5527 ) ) ( not ( = ?auto_5511 ?auto_5528 ) ) ( not ( = ?auto_5511 ?auto_5519 ) ) ( not ( = ?auto_5511 ?auto_5529 ) ) ( not ( = ?auto_5511 ?auto_5526 ) ) ( not ( = ?auto_5511 ?auto_5523 ) ) ( not ( = ?auto_5516 ?auto_5520 ) ) ( not ( = ?auto_5516 ?auto_5524 ) ) ( not ( = ?auto_5516 ?auto_5517 ) ) ( not ( = ?auto_5516 ?auto_5518 ) ) ( not ( = ?auto_5516 ?auto_5532 ) ) ( not ( = ?auto_5513 ?auto_5521 ) ) ( not ( = ?auto_5513 ?auto_5530 ) ) ( not ( = ?auto_5513 ?auto_5531 ) ) ( not ( = ?auto_5513 ?auto_5525 ) ) ( not ( = ?auto_5513 ?auto_5522 ) ) ( not ( = ?auto_5513 ?auto_5527 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5508 ?auto_5509 )
      ( MAKE-1CRATE ?auto_5509 ?auto_5510 )
      ( MAKE-7CRATE-VERIFY ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5508 ?auto_5509 ?auto_5510 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5552 - SURFACE
      ?auto_5553 - SURFACE
      ?auto_5554 - SURFACE
      ?auto_5555 - SURFACE
      ?auto_5556 - SURFACE
      ?auto_5557 - SURFACE
      ?auto_5558 - SURFACE
      ?auto_5559 - SURFACE
      ?auto_5560 - SURFACE
    )
    :vars
    (
      ?auto_5564 - HOIST
      ?auto_5562 - PLACE
      ?auto_5563 - PLACE
      ?auto_5561 - HOIST
      ?auto_5565 - SURFACE
      ?auto_5577 - PLACE
      ?auto_5571 - HOIST
      ?auto_5579 - SURFACE
      ?auto_5567 - PLACE
      ?auto_5580 - HOIST
      ?auto_5575 - SURFACE
      ?auto_5581 - SURFACE
      ?auto_5574 - PLACE
      ?auto_5572 - HOIST
      ?auto_5583 - SURFACE
      ?auto_5582 - PLACE
      ?auto_5569 - HOIST
      ?auto_5570 - SURFACE
      ?auto_5573 - SURFACE
      ?auto_5578 - PLACE
      ?auto_5568 - HOIST
      ?auto_5576 - SURFACE
      ?auto_5566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5564 ?auto_5562 ) ( IS-CRATE ?auto_5560 ) ( not ( = ?auto_5563 ?auto_5562 ) ) ( HOIST-AT ?auto_5561 ?auto_5563 ) ( SURFACE-AT ?auto_5560 ?auto_5563 ) ( ON ?auto_5560 ?auto_5565 ) ( CLEAR ?auto_5560 ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5565 ) ) ( not ( = ?auto_5560 ?auto_5565 ) ) ( not ( = ?auto_5564 ?auto_5561 ) ) ( IS-CRATE ?auto_5559 ) ( not ( = ?auto_5577 ?auto_5562 ) ) ( HOIST-AT ?auto_5571 ?auto_5577 ) ( AVAILABLE ?auto_5571 ) ( SURFACE-AT ?auto_5559 ?auto_5577 ) ( ON ?auto_5559 ?auto_5579 ) ( CLEAR ?auto_5559 ) ( not ( = ?auto_5558 ?auto_5559 ) ) ( not ( = ?auto_5558 ?auto_5579 ) ) ( not ( = ?auto_5559 ?auto_5579 ) ) ( not ( = ?auto_5564 ?auto_5571 ) ) ( IS-CRATE ?auto_5558 ) ( not ( = ?auto_5567 ?auto_5562 ) ) ( HOIST-AT ?auto_5580 ?auto_5567 ) ( AVAILABLE ?auto_5580 ) ( SURFACE-AT ?auto_5558 ?auto_5567 ) ( ON ?auto_5558 ?auto_5575 ) ( CLEAR ?auto_5558 ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5575 ) ) ( not ( = ?auto_5558 ?auto_5575 ) ) ( not ( = ?auto_5564 ?auto_5580 ) ) ( IS-CRATE ?auto_5557 ) ( AVAILABLE ?auto_5561 ) ( SURFACE-AT ?auto_5557 ?auto_5563 ) ( ON ?auto_5557 ?auto_5581 ) ( CLEAR ?auto_5557 ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( not ( = ?auto_5556 ?auto_5581 ) ) ( not ( = ?auto_5557 ?auto_5581 ) ) ( IS-CRATE ?auto_5556 ) ( not ( = ?auto_5574 ?auto_5562 ) ) ( HOIST-AT ?auto_5572 ?auto_5574 ) ( AVAILABLE ?auto_5572 ) ( SURFACE-AT ?auto_5556 ?auto_5574 ) ( ON ?auto_5556 ?auto_5583 ) ( CLEAR ?auto_5556 ) ( not ( = ?auto_5555 ?auto_5556 ) ) ( not ( = ?auto_5555 ?auto_5583 ) ) ( not ( = ?auto_5556 ?auto_5583 ) ) ( not ( = ?auto_5564 ?auto_5572 ) ) ( IS-CRATE ?auto_5555 ) ( not ( = ?auto_5582 ?auto_5562 ) ) ( HOIST-AT ?auto_5569 ?auto_5582 ) ( SURFACE-AT ?auto_5555 ?auto_5582 ) ( ON ?auto_5555 ?auto_5570 ) ( CLEAR ?auto_5555 ) ( not ( = ?auto_5554 ?auto_5555 ) ) ( not ( = ?auto_5554 ?auto_5570 ) ) ( not ( = ?auto_5555 ?auto_5570 ) ) ( not ( = ?auto_5564 ?auto_5569 ) ) ( IS-CRATE ?auto_5554 ) ( AVAILABLE ?auto_5569 ) ( SURFACE-AT ?auto_5554 ?auto_5582 ) ( ON ?auto_5554 ?auto_5573 ) ( CLEAR ?auto_5554 ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( not ( = ?auto_5553 ?auto_5573 ) ) ( not ( = ?auto_5554 ?auto_5573 ) ) ( SURFACE-AT ?auto_5552 ?auto_5562 ) ( CLEAR ?auto_5552 ) ( IS-CRATE ?auto_5553 ) ( AVAILABLE ?auto_5564 ) ( not ( = ?auto_5578 ?auto_5562 ) ) ( HOIST-AT ?auto_5568 ?auto_5578 ) ( AVAILABLE ?auto_5568 ) ( SURFACE-AT ?auto_5553 ?auto_5578 ) ( ON ?auto_5553 ?auto_5576 ) ( CLEAR ?auto_5553 ) ( TRUCK-AT ?auto_5566 ?auto_5562 ) ( not ( = ?auto_5552 ?auto_5553 ) ) ( not ( = ?auto_5552 ?auto_5576 ) ) ( not ( = ?auto_5553 ?auto_5576 ) ) ( not ( = ?auto_5564 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5573 ) ) ( not ( = ?auto_5554 ?auto_5576 ) ) ( not ( = ?auto_5582 ?auto_5578 ) ) ( not ( = ?auto_5569 ?auto_5568 ) ) ( not ( = ?auto_5573 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5555 ) ) ( not ( = ?auto_5552 ?auto_5570 ) ) ( not ( = ?auto_5553 ?auto_5555 ) ) ( not ( = ?auto_5553 ?auto_5570 ) ) ( not ( = ?auto_5555 ?auto_5573 ) ) ( not ( = ?auto_5555 ?auto_5576 ) ) ( not ( = ?auto_5570 ?auto_5573 ) ) ( not ( = ?auto_5570 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5556 ) ) ( not ( = ?auto_5552 ?auto_5583 ) ) ( not ( = ?auto_5553 ?auto_5556 ) ) ( not ( = ?auto_5553 ?auto_5583 ) ) ( not ( = ?auto_5554 ?auto_5556 ) ) ( not ( = ?auto_5554 ?auto_5583 ) ) ( not ( = ?auto_5556 ?auto_5570 ) ) ( not ( = ?auto_5556 ?auto_5573 ) ) ( not ( = ?auto_5556 ?auto_5576 ) ) ( not ( = ?auto_5574 ?auto_5582 ) ) ( not ( = ?auto_5574 ?auto_5578 ) ) ( not ( = ?auto_5572 ?auto_5569 ) ) ( not ( = ?auto_5572 ?auto_5568 ) ) ( not ( = ?auto_5583 ?auto_5570 ) ) ( not ( = ?auto_5583 ?auto_5573 ) ) ( not ( = ?auto_5583 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5557 ) ) ( not ( = ?auto_5552 ?auto_5581 ) ) ( not ( = ?auto_5553 ?auto_5557 ) ) ( not ( = ?auto_5553 ?auto_5581 ) ) ( not ( = ?auto_5554 ?auto_5557 ) ) ( not ( = ?auto_5554 ?auto_5581 ) ) ( not ( = ?auto_5555 ?auto_5557 ) ) ( not ( = ?auto_5555 ?auto_5581 ) ) ( not ( = ?auto_5557 ?auto_5583 ) ) ( not ( = ?auto_5557 ?auto_5570 ) ) ( not ( = ?auto_5557 ?auto_5573 ) ) ( not ( = ?auto_5557 ?auto_5576 ) ) ( not ( = ?auto_5563 ?auto_5574 ) ) ( not ( = ?auto_5563 ?auto_5582 ) ) ( not ( = ?auto_5563 ?auto_5578 ) ) ( not ( = ?auto_5561 ?auto_5572 ) ) ( not ( = ?auto_5561 ?auto_5569 ) ) ( not ( = ?auto_5561 ?auto_5568 ) ) ( not ( = ?auto_5581 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5570 ) ) ( not ( = ?auto_5581 ?auto_5573 ) ) ( not ( = ?auto_5581 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5558 ) ) ( not ( = ?auto_5552 ?auto_5575 ) ) ( not ( = ?auto_5553 ?auto_5558 ) ) ( not ( = ?auto_5553 ?auto_5575 ) ) ( not ( = ?auto_5554 ?auto_5558 ) ) ( not ( = ?auto_5554 ?auto_5575 ) ) ( not ( = ?auto_5555 ?auto_5558 ) ) ( not ( = ?auto_5555 ?auto_5575 ) ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5556 ?auto_5575 ) ) ( not ( = ?auto_5558 ?auto_5581 ) ) ( not ( = ?auto_5558 ?auto_5583 ) ) ( not ( = ?auto_5558 ?auto_5570 ) ) ( not ( = ?auto_5558 ?auto_5573 ) ) ( not ( = ?auto_5558 ?auto_5576 ) ) ( not ( = ?auto_5567 ?auto_5563 ) ) ( not ( = ?auto_5567 ?auto_5574 ) ) ( not ( = ?auto_5567 ?auto_5582 ) ) ( not ( = ?auto_5567 ?auto_5578 ) ) ( not ( = ?auto_5580 ?auto_5561 ) ) ( not ( = ?auto_5580 ?auto_5572 ) ) ( not ( = ?auto_5580 ?auto_5569 ) ) ( not ( = ?auto_5580 ?auto_5568 ) ) ( not ( = ?auto_5575 ?auto_5581 ) ) ( not ( = ?auto_5575 ?auto_5583 ) ) ( not ( = ?auto_5575 ?auto_5570 ) ) ( not ( = ?auto_5575 ?auto_5573 ) ) ( not ( = ?auto_5575 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5559 ) ) ( not ( = ?auto_5552 ?auto_5579 ) ) ( not ( = ?auto_5553 ?auto_5559 ) ) ( not ( = ?auto_5553 ?auto_5579 ) ) ( not ( = ?auto_5554 ?auto_5559 ) ) ( not ( = ?auto_5554 ?auto_5579 ) ) ( not ( = ?auto_5555 ?auto_5559 ) ) ( not ( = ?auto_5555 ?auto_5579 ) ) ( not ( = ?auto_5556 ?auto_5559 ) ) ( not ( = ?auto_5556 ?auto_5579 ) ) ( not ( = ?auto_5557 ?auto_5559 ) ) ( not ( = ?auto_5557 ?auto_5579 ) ) ( not ( = ?auto_5559 ?auto_5575 ) ) ( not ( = ?auto_5559 ?auto_5581 ) ) ( not ( = ?auto_5559 ?auto_5583 ) ) ( not ( = ?auto_5559 ?auto_5570 ) ) ( not ( = ?auto_5559 ?auto_5573 ) ) ( not ( = ?auto_5559 ?auto_5576 ) ) ( not ( = ?auto_5577 ?auto_5567 ) ) ( not ( = ?auto_5577 ?auto_5563 ) ) ( not ( = ?auto_5577 ?auto_5574 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5571 ?auto_5580 ) ) ( not ( = ?auto_5571 ?auto_5561 ) ) ( not ( = ?auto_5571 ?auto_5572 ) ) ( not ( = ?auto_5571 ?auto_5569 ) ) ( not ( = ?auto_5571 ?auto_5568 ) ) ( not ( = ?auto_5579 ?auto_5575 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5583 ) ) ( not ( = ?auto_5579 ?auto_5570 ) ) ( not ( = ?auto_5579 ?auto_5573 ) ) ( not ( = ?auto_5579 ?auto_5576 ) ) ( not ( = ?auto_5552 ?auto_5560 ) ) ( not ( = ?auto_5552 ?auto_5565 ) ) ( not ( = ?auto_5553 ?auto_5560 ) ) ( not ( = ?auto_5553 ?auto_5565 ) ) ( not ( = ?auto_5554 ?auto_5560 ) ) ( not ( = ?auto_5554 ?auto_5565 ) ) ( not ( = ?auto_5555 ?auto_5560 ) ) ( not ( = ?auto_5555 ?auto_5565 ) ) ( not ( = ?auto_5556 ?auto_5560 ) ) ( not ( = ?auto_5556 ?auto_5565 ) ) ( not ( = ?auto_5557 ?auto_5560 ) ) ( not ( = ?auto_5557 ?auto_5565 ) ) ( not ( = ?auto_5558 ?auto_5560 ) ) ( not ( = ?auto_5558 ?auto_5565 ) ) ( not ( = ?auto_5560 ?auto_5579 ) ) ( not ( = ?auto_5560 ?auto_5575 ) ) ( not ( = ?auto_5560 ?auto_5581 ) ) ( not ( = ?auto_5560 ?auto_5583 ) ) ( not ( = ?auto_5560 ?auto_5570 ) ) ( not ( = ?auto_5560 ?auto_5573 ) ) ( not ( = ?auto_5560 ?auto_5576 ) ) ( not ( = ?auto_5565 ?auto_5579 ) ) ( not ( = ?auto_5565 ?auto_5575 ) ) ( not ( = ?auto_5565 ?auto_5581 ) ) ( not ( = ?auto_5565 ?auto_5583 ) ) ( not ( = ?auto_5565 ?auto_5570 ) ) ( not ( = ?auto_5565 ?auto_5573 ) ) ( not ( = ?auto_5565 ?auto_5576 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5552 ?auto_5553 ?auto_5554 ?auto_5555 ?auto_5556 ?auto_5557 ?auto_5558 ?auto_5559 )
      ( MAKE-1CRATE ?auto_5559 ?auto_5560 )
      ( MAKE-8CRATE-VERIFY ?auto_5552 ?auto_5553 ?auto_5554 ?auto_5555 ?auto_5556 ?auto_5557 ?auto_5558 ?auto_5559 ?auto_5560 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5604 - SURFACE
      ?auto_5605 - SURFACE
      ?auto_5606 - SURFACE
      ?auto_5607 - SURFACE
      ?auto_5608 - SURFACE
      ?auto_5609 - SURFACE
      ?auto_5610 - SURFACE
      ?auto_5611 - SURFACE
      ?auto_5612 - SURFACE
      ?auto_5613 - SURFACE
    )
    :vars
    (
      ?auto_5614 - HOIST
      ?auto_5616 - PLACE
      ?auto_5615 - PLACE
      ?auto_5619 - HOIST
      ?auto_5618 - SURFACE
      ?auto_5632 - PLACE
      ?auto_5628 - HOIST
      ?auto_5630 - SURFACE
      ?auto_5622 - PLACE
      ?auto_5636 - HOIST
      ?auto_5637 - SURFACE
      ?auto_5629 - PLACE
      ?auto_5633 - HOIST
      ?auto_5620 - SURFACE
      ?auto_5623 - SURFACE
      ?auto_5631 - SURFACE
      ?auto_5624 - PLACE
      ?auto_5626 - HOIST
      ?auto_5627 - SURFACE
      ?auto_5634 - SURFACE
      ?auto_5625 - PLACE
      ?auto_5621 - HOIST
      ?auto_5635 - SURFACE
      ?auto_5617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5614 ?auto_5616 ) ( IS-CRATE ?auto_5613 ) ( not ( = ?auto_5615 ?auto_5616 ) ) ( HOIST-AT ?auto_5619 ?auto_5615 ) ( SURFACE-AT ?auto_5613 ?auto_5615 ) ( ON ?auto_5613 ?auto_5618 ) ( CLEAR ?auto_5613 ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5612 ?auto_5618 ) ) ( not ( = ?auto_5613 ?auto_5618 ) ) ( not ( = ?auto_5614 ?auto_5619 ) ) ( IS-CRATE ?auto_5612 ) ( not ( = ?auto_5632 ?auto_5616 ) ) ( HOIST-AT ?auto_5628 ?auto_5632 ) ( SURFACE-AT ?auto_5612 ?auto_5632 ) ( ON ?auto_5612 ?auto_5630 ) ( CLEAR ?auto_5612 ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5611 ?auto_5630 ) ) ( not ( = ?auto_5612 ?auto_5630 ) ) ( not ( = ?auto_5614 ?auto_5628 ) ) ( IS-CRATE ?auto_5611 ) ( not ( = ?auto_5622 ?auto_5616 ) ) ( HOIST-AT ?auto_5636 ?auto_5622 ) ( AVAILABLE ?auto_5636 ) ( SURFACE-AT ?auto_5611 ?auto_5622 ) ( ON ?auto_5611 ?auto_5637 ) ( CLEAR ?auto_5611 ) ( not ( = ?auto_5610 ?auto_5611 ) ) ( not ( = ?auto_5610 ?auto_5637 ) ) ( not ( = ?auto_5611 ?auto_5637 ) ) ( not ( = ?auto_5614 ?auto_5636 ) ) ( IS-CRATE ?auto_5610 ) ( not ( = ?auto_5629 ?auto_5616 ) ) ( HOIST-AT ?auto_5633 ?auto_5629 ) ( AVAILABLE ?auto_5633 ) ( SURFACE-AT ?auto_5610 ?auto_5629 ) ( ON ?auto_5610 ?auto_5620 ) ( CLEAR ?auto_5610 ) ( not ( = ?auto_5609 ?auto_5610 ) ) ( not ( = ?auto_5609 ?auto_5620 ) ) ( not ( = ?auto_5610 ?auto_5620 ) ) ( not ( = ?auto_5614 ?auto_5633 ) ) ( IS-CRATE ?auto_5609 ) ( AVAILABLE ?auto_5628 ) ( SURFACE-AT ?auto_5609 ?auto_5632 ) ( ON ?auto_5609 ?auto_5623 ) ( CLEAR ?auto_5609 ) ( not ( = ?auto_5608 ?auto_5609 ) ) ( not ( = ?auto_5608 ?auto_5623 ) ) ( not ( = ?auto_5609 ?auto_5623 ) ) ( IS-CRATE ?auto_5608 ) ( AVAILABLE ?auto_5619 ) ( SURFACE-AT ?auto_5608 ?auto_5615 ) ( ON ?auto_5608 ?auto_5631 ) ( CLEAR ?auto_5608 ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( not ( = ?auto_5607 ?auto_5631 ) ) ( not ( = ?auto_5608 ?auto_5631 ) ) ( IS-CRATE ?auto_5607 ) ( not ( = ?auto_5624 ?auto_5616 ) ) ( HOIST-AT ?auto_5626 ?auto_5624 ) ( SURFACE-AT ?auto_5607 ?auto_5624 ) ( ON ?auto_5607 ?auto_5627 ) ( CLEAR ?auto_5607 ) ( not ( = ?auto_5606 ?auto_5607 ) ) ( not ( = ?auto_5606 ?auto_5627 ) ) ( not ( = ?auto_5607 ?auto_5627 ) ) ( not ( = ?auto_5614 ?auto_5626 ) ) ( IS-CRATE ?auto_5606 ) ( AVAILABLE ?auto_5626 ) ( SURFACE-AT ?auto_5606 ?auto_5624 ) ( ON ?auto_5606 ?auto_5634 ) ( CLEAR ?auto_5606 ) ( not ( = ?auto_5605 ?auto_5606 ) ) ( not ( = ?auto_5605 ?auto_5634 ) ) ( not ( = ?auto_5606 ?auto_5634 ) ) ( SURFACE-AT ?auto_5604 ?auto_5616 ) ( CLEAR ?auto_5604 ) ( IS-CRATE ?auto_5605 ) ( AVAILABLE ?auto_5614 ) ( not ( = ?auto_5625 ?auto_5616 ) ) ( HOIST-AT ?auto_5621 ?auto_5625 ) ( AVAILABLE ?auto_5621 ) ( SURFACE-AT ?auto_5605 ?auto_5625 ) ( ON ?auto_5605 ?auto_5635 ) ( CLEAR ?auto_5605 ) ( TRUCK-AT ?auto_5617 ?auto_5616 ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5604 ?auto_5635 ) ) ( not ( = ?auto_5605 ?auto_5635 ) ) ( not ( = ?auto_5614 ?auto_5621 ) ) ( not ( = ?auto_5604 ?auto_5606 ) ) ( not ( = ?auto_5604 ?auto_5634 ) ) ( not ( = ?auto_5606 ?auto_5635 ) ) ( not ( = ?auto_5624 ?auto_5625 ) ) ( not ( = ?auto_5626 ?auto_5621 ) ) ( not ( = ?auto_5634 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5607 ) ) ( not ( = ?auto_5604 ?auto_5627 ) ) ( not ( = ?auto_5605 ?auto_5607 ) ) ( not ( = ?auto_5605 ?auto_5627 ) ) ( not ( = ?auto_5607 ?auto_5634 ) ) ( not ( = ?auto_5607 ?auto_5635 ) ) ( not ( = ?auto_5627 ?auto_5634 ) ) ( not ( = ?auto_5627 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5608 ) ) ( not ( = ?auto_5604 ?auto_5631 ) ) ( not ( = ?auto_5605 ?auto_5608 ) ) ( not ( = ?auto_5605 ?auto_5631 ) ) ( not ( = ?auto_5606 ?auto_5608 ) ) ( not ( = ?auto_5606 ?auto_5631 ) ) ( not ( = ?auto_5608 ?auto_5627 ) ) ( not ( = ?auto_5608 ?auto_5634 ) ) ( not ( = ?auto_5608 ?auto_5635 ) ) ( not ( = ?auto_5615 ?auto_5624 ) ) ( not ( = ?auto_5615 ?auto_5625 ) ) ( not ( = ?auto_5619 ?auto_5626 ) ) ( not ( = ?auto_5619 ?auto_5621 ) ) ( not ( = ?auto_5631 ?auto_5627 ) ) ( not ( = ?auto_5631 ?auto_5634 ) ) ( not ( = ?auto_5631 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5609 ) ) ( not ( = ?auto_5604 ?auto_5623 ) ) ( not ( = ?auto_5605 ?auto_5609 ) ) ( not ( = ?auto_5605 ?auto_5623 ) ) ( not ( = ?auto_5606 ?auto_5609 ) ) ( not ( = ?auto_5606 ?auto_5623 ) ) ( not ( = ?auto_5607 ?auto_5609 ) ) ( not ( = ?auto_5607 ?auto_5623 ) ) ( not ( = ?auto_5609 ?auto_5631 ) ) ( not ( = ?auto_5609 ?auto_5627 ) ) ( not ( = ?auto_5609 ?auto_5634 ) ) ( not ( = ?auto_5609 ?auto_5635 ) ) ( not ( = ?auto_5632 ?auto_5615 ) ) ( not ( = ?auto_5632 ?auto_5624 ) ) ( not ( = ?auto_5632 ?auto_5625 ) ) ( not ( = ?auto_5628 ?auto_5619 ) ) ( not ( = ?auto_5628 ?auto_5626 ) ) ( not ( = ?auto_5628 ?auto_5621 ) ) ( not ( = ?auto_5623 ?auto_5631 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( not ( = ?auto_5623 ?auto_5634 ) ) ( not ( = ?auto_5623 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5610 ) ) ( not ( = ?auto_5604 ?auto_5620 ) ) ( not ( = ?auto_5605 ?auto_5610 ) ) ( not ( = ?auto_5605 ?auto_5620 ) ) ( not ( = ?auto_5606 ?auto_5610 ) ) ( not ( = ?auto_5606 ?auto_5620 ) ) ( not ( = ?auto_5607 ?auto_5610 ) ) ( not ( = ?auto_5607 ?auto_5620 ) ) ( not ( = ?auto_5608 ?auto_5610 ) ) ( not ( = ?auto_5608 ?auto_5620 ) ) ( not ( = ?auto_5610 ?auto_5623 ) ) ( not ( = ?auto_5610 ?auto_5631 ) ) ( not ( = ?auto_5610 ?auto_5627 ) ) ( not ( = ?auto_5610 ?auto_5634 ) ) ( not ( = ?auto_5610 ?auto_5635 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5615 ) ) ( not ( = ?auto_5629 ?auto_5624 ) ) ( not ( = ?auto_5629 ?auto_5625 ) ) ( not ( = ?auto_5633 ?auto_5628 ) ) ( not ( = ?auto_5633 ?auto_5619 ) ) ( not ( = ?auto_5633 ?auto_5626 ) ) ( not ( = ?auto_5633 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5623 ) ) ( not ( = ?auto_5620 ?auto_5631 ) ) ( not ( = ?auto_5620 ?auto_5627 ) ) ( not ( = ?auto_5620 ?auto_5634 ) ) ( not ( = ?auto_5620 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5611 ) ) ( not ( = ?auto_5604 ?auto_5637 ) ) ( not ( = ?auto_5605 ?auto_5611 ) ) ( not ( = ?auto_5605 ?auto_5637 ) ) ( not ( = ?auto_5606 ?auto_5611 ) ) ( not ( = ?auto_5606 ?auto_5637 ) ) ( not ( = ?auto_5607 ?auto_5611 ) ) ( not ( = ?auto_5607 ?auto_5637 ) ) ( not ( = ?auto_5608 ?auto_5611 ) ) ( not ( = ?auto_5608 ?auto_5637 ) ) ( not ( = ?auto_5609 ?auto_5611 ) ) ( not ( = ?auto_5609 ?auto_5637 ) ) ( not ( = ?auto_5611 ?auto_5620 ) ) ( not ( = ?auto_5611 ?auto_5623 ) ) ( not ( = ?auto_5611 ?auto_5631 ) ) ( not ( = ?auto_5611 ?auto_5627 ) ) ( not ( = ?auto_5611 ?auto_5634 ) ) ( not ( = ?auto_5611 ?auto_5635 ) ) ( not ( = ?auto_5622 ?auto_5629 ) ) ( not ( = ?auto_5622 ?auto_5632 ) ) ( not ( = ?auto_5622 ?auto_5615 ) ) ( not ( = ?auto_5622 ?auto_5624 ) ) ( not ( = ?auto_5622 ?auto_5625 ) ) ( not ( = ?auto_5636 ?auto_5633 ) ) ( not ( = ?auto_5636 ?auto_5628 ) ) ( not ( = ?auto_5636 ?auto_5619 ) ) ( not ( = ?auto_5636 ?auto_5626 ) ) ( not ( = ?auto_5636 ?auto_5621 ) ) ( not ( = ?auto_5637 ?auto_5620 ) ) ( not ( = ?auto_5637 ?auto_5623 ) ) ( not ( = ?auto_5637 ?auto_5631 ) ) ( not ( = ?auto_5637 ?auto_5627 ) ) ( not ( = ?auto_5637 ?auto_5634 ) ) ( not ( = ?auto_5637 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5612 ) ) ( not ( = ?auto_5604 ?auto_5630 ) ) ( not ( = ?auto_5605 ?auto_5612 ) ) ( not ( = ?auto_5605 ?auto_5630 ) ) ( not ( = ?auto_5606 ?auto_5612 ) ) ( not ( = ?auto_5606 ?auto_5630 ) ) ( not ( = ?auto_5607 ?auto_5612 ) ) ( not ( = ?auto_5607 ?auto_5630 ) ) ( not ( = ?auto_5608 ?auto_5612 ) ) ( not ( = ?auto_5608 ?auto_5630 ) ) ( not ( = ?auto_5609 ?auto_5612 ) ) ( not ( = ?auto_5609 ?auto_5630 ) ) ( not ( = ?auto_5610 ?auto_5612 ) ) ( not ( = ?auto_5610 ?auto_5630 ) ) ( not ( = ?auto_5612 ?auto_5637 ) ) ( not ( = ?auto_5612 ?auto_5620 ) ) ( not ( = ?auto_5612 ?auto_5623 ) ) ( not ( = ?auto_5612 ?auto_5631 ) ) ( not ( = ?auto_5612 ?auto_5627 ) ) ( not ( = ?auto_5612 ?auto_5634 ) ) ( not ( = ?auto_5612 ?auto_5635 ) ) ( not ( = ?auto_5630 ?auto_5637 ) ) ( not ( = ?auto_5630 ?auto_5620 ) ) ( not ( = ?auto_5630 ?auto_5623 ) ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5627 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5630 ?auto_5635 ) ) ( not ( = ?auto_5604 ?auto_5613 ) ) ( not ( = ?auto_5604 ?auto_5618 ) ) ( not ( = ?auto_5605 ?auto_5613 ) ) ( not ( = ?auto_5605 ?auto_5618 ) ) ( not ( = ?auto_5606 ?auto_5613 ) ) ( not ( = ?auto_5606 ?auto_5618 ) ) ( not ( = ?auto_5607 ?auto_5613 ) ) ( not ( = ?auto_5607 ?auto_5618 ) ) ( not ( = ?auto_5608 ?auto_5613 ) ) ( not ( = ?auto_5608 ?auto_5618 ) ) ( not ( = ?auto_5609 ?auto_5613 ) ) ( not ( = ?auto_5609 ?auto_5618 ) ) ( not ( = ?auto_5610 ?auto_5613 ) ) ( not ( = ?auto_5610 ?auto_5618 ) ) ( not ( = ?auto_5611 ?auto_5613 ) ) ( not ( = ?auto_5611 ?auto_5618 ) ) ( not ( = ?auto_5613 ?auto_5630 ) ) ( not ( = ?auto_5613 ?auto_5637 ) ) ( not ( = ?auto_5613 ?auto_5620 ) ) ( not ( = ?auto_5613 ?auto_5623 ) ) ( not ( = ?auto_5613 ?auto_5631 ) ) ( not ( = ?auto_5613 ?auto_5627 ) ) ( not ( = ?auto_5613 ?auto_5634 ) ) ( not ( = ?auto_5613 ?auto_5635 ) ) ( not ( = ?auto_5618 ?auto_5630 ) ) ( not ( = ?auto_5618 ?auto_5637 ) ) ( not ( = ?auto_5618 ?auto_5620 ) ) ( not ( = ?auto_5618 ?auto_5623 ) ) ( not ( = ?auto_5618 ?auto_5631 ) ) ( not ( = ?auto_5618 ?auto_5627 ) ) ( not ( = ?auto_5618 ?auto_5634 ) ) ( not ( = ?auto_5618 ?auto_5635 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5604 ?auto_5605 ?auto_5606 ?auto_5607 ?auto_5608 ?auto_5609 ?auto_5610 ?auto_5611 ?auto_5612 )
      ( MAKE-1CRATE ?auto_5612 ?auto_5613 )
      ( MAKE-9CRATE-VERIFY ?auto_5604 ?auto_5605 ?auto_5606 ?auto_5607 ?auto_5608 ?auto_5609 ?auto_5610 ?auto_5611 ?auto_5612 ?auto_5613 ) )
  )

)

