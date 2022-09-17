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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5320 - SURFACE
      ?auto_5321 - SURFACE
    )
    :vars
    (
      ?auto_5322 - HOIST
      ?auto_5323 - PLACE
      ?auto_5325 - PLACE
      ?auto_5326 - HOIST
      ?auto_5327 - SURFACE
      ?auto_5324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5322 ?auto_5323 ) ( SURFACE-AT ?auto_5320 ?auto_5323 ) ( CLEAR ?auto_5320 ) ( IS-CRATE ?auto_5321 ) ( AVAILABLE ?auto_5322 ) ( not ( = ?auto_5325 ?auto_5323 ) ) ( HOIST-AT ?auto_5326 ?auto_5325 ) ( AVAILABLE ?auto_5326 ) ( SURFACE-AT ?auto_5321 ?auto_5325 ) ( ON ?auto_5321 ?auto_5327 ) ( CLEAR ?auto_5321 ) ( TRUCK-AT ?auto_5324 ?auto_5323 ) ( not ( = ?auto_5320 ?auto_5321 ) ) ( not ( = ?auto_5320 ?auto_5327 ) ) ( not ( = ?auto_5321 ?auto_5327 ) ) ( not ( = ?auto_5322 ?auto_5326 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5324 ?auto_5323 ?auto_5325 )
      ( !LIFT ?auto_5326 ?auto_5321 ?auto_5327 ?auto_5325 )
      ( !LOAD ?auto_5326 ?auto_5321 ?auto_5324 ?auto_5325 )
      ( !DRIVE ?auto_5324 ?auto_5325 ?auto_5323 )
      ( !UNLOAD ?auto_5322 ?auto_5321 ?auto_5324 ?auto_5323 )
      ( !DROP ?auto_5322 ?auto_5321 ?auto_5320 ?auto_5323 )
      ( MAKE-1CRATE-VERIFY ?auto_5320 ?auto_5321 ) )
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
      ?auto_5334 - HOIST
      ?auto_5338 - PLACE
      ?auto_5336 - PLACE
      ?auto_5339 - HOIST
      ?auto_5335 - SURFACE
      ?auto_5342 - PLACE
      ?auto_5340 - HOIST
      ?auto_5341 - SURFACE
      ?auto_5337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5334 ?auto_5338 ) ( IS-CRATE ?auto_5333 ) ( not ( = ?auto_5336 ?auto_5338 ) ) ( HOIST-AT ?auto_5339 ?auto_5336 ) ( AVAILABLE ?auto_5339 ) ( SURFACE-AT ?auto_5333 ?auto_5336 ) ( ON ?auto_5333 ?auto_5335 ) ( CLEAR ?auto_5333 ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5335 ) ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( not ( = ?auto_5334 ?auto_5339 ) ) ( SURFACE-AT ?auto_5331 ?auto_5338 ) ( CLEAR ?auto_5331 ) ( IS-CRATE ?auto_5332 ) ( AVAILABLE ?auto_5334 ) ( not ( = ?auto_5342 ?auto_5338 ) ) ( HOIST-AT ?auto_5340 ?auto_5342 ) ( AVAILABLE ?auto_5340 ) ( SURFACE-AT ?auto_5332 ?auto_5342 ) ( ON ?auto_5332 ?auto_5341 ) ( CLEAR ?auto_5332 ) ( TRUCK-AT ?auto_5337 ?auto_5338 ) ( not ( = ?auto_5331 ?auto_5332 ) ) ( not ( = ?auto_5331 ?auto_5341 ) ) ( not ( = ?auto_5332 ?auto_5341 ) ) ( not ( = ?auto_5334 ?auto_5340 ) ) ( not ( = ?auto_5331 ?auto_5333 ) ) ( not ( = ?auto_5331 ?auto_5335 ) ) ( not ( = ?auto_5333 ?auto_5341 ) ) ( not ( = ?auto_5336 ?auto_5342 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5335 ?auto_5341 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5331 ?auto_5332 )
      ( MAKE-1CRATE ?auto_5332 ?auto_5333 )
      ( MAKE-2CRATE-VERIFY ?auto_5331 ?auto_5332 ?auto_5333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5345 - SURFACE
      ?auto_5346 - SURFACE
    )
    :vars
    (
      ?auto_5347 - HOIST
      ?auto_5348 - PLACE
      ?auto_5350 - PLACE
      ?auto_5351 - HOIST
      ?auto_5352 - SURFACE
      ?auto_5349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5347 ?auto_5348 ) ( SURFACE-AT ?auto_5345 ?auto_5348 ) ( CLEAR ?auto_5345 ) ( IS-CRATE ?auto_5346 ) ( AVAILABLE ?auto_5347 ) ( not ( = ?auto_5350 ?auto_5348 ) ) ( HOIST-AT ?auto_5351 ?auto_5350 ) ( AVAILABLE ?auto_5351 ) ( SURFACE-AT ?auto_5346 ?auto_5350 ) ( ON ?auto_5346 ?auto_5352 ) ( CLEAR ?auto_5346 ) ( TRUCK-AT ?auto_5349 ?auto_5348 ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5352 ) ) ( not ( = ?auto_5346 ?auto_5352 ) ) ( not ( = ?auto_5347 ?auto_5351 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5349 ?auto_5348 ?auto_5350 )
      ( !LIFT ?auto_5351 ?auto_5346 ?auto_5352 ?auto_5350 )
      ( !LOAD ?auto_5351 ?auto_5346 ?auto_5349 ?auto_5350 )
      ( !DRIVE ?auto_5349 ?auto_5350 ?auto_5348 )
      ( !UNLOAD ?auto_5347 ?auto_5346 ?auto_5349 ?auto_5348 )
      ( !DROP ?auto_5347 ?auto_5346 ?auto_5345 ?auto_5348 )
      ( MAKE-1CRATE-VERIFY ?auto_5345 ?auto_5346 ) )
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
      ?auto_5365 - HOIST
      ?auto_5361 - PLACE
      ?auto_5364 - PLACE
      ?auto_5363 - HOIST
      ?auto_5362 - SURFACE
      ?auto_5368 - SURFACE
      ?auto_5370 - PLACE
      ?auto_5367 - HOIST
      ?auto_5369 - SURFACE
      ?auto_5366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5365 ?auto_5361 ) ( IS-CRATE ?auto_5360 ) ( not ( = ?auto_5364 ?auto_5361 ) ) ( HOIST-AT ?auto_5363 ?auto_5364 ) ( SURFACE-AT ?auto_5360 ?auto_5364 ) ( ON ?auto_5360 ?auto_5362 ) ( CLEAR ?auto_5360 ) ( not ( = ?auto_5359 ?auto_5360 ) ) ( not ( = ?auto_5359 ?auto_5362 ) ) ( not ( = ?auto_5360 ?auto_5362 ) ) ( not ( = ?auto_5365 ?auto_5363 ) ) ( IS-CRATE ?auto_5359 ) ( AVAILABLE ?auto_5363 ) ( SURFACE-AT ?auto_5359 ?auto_5364 ) ( ON ?auto_5359 ?auto_5368 ) ( CLEAR ?auto_5359 ) ( not ( = ?auto_5358 ?auto_5359 ) ) ( not ( = ?auto_5358 ?auto_5368 ) ) ( not ( = ?auto_5359 ?auto_5368 ) ) ( SURFACE-AT ?auto_5357 ?auto_5361 ) ( CLEAR ?auto_5357 ) ( IS-CRATE ?auto_5358 ) ( AVAILABLE ?auto_5365 ) ( not ( = ?auto_5370 ?auto_5361 ) ) ( HOIST-AT ?auto_5367 ?auto_5370 ) ( AVAILABLE ?auto_5367 ) ( SURFACE-AT ?auto_5358 ?auto_5370 ) ( ON ?auto_5358 ?auto_5369 ) ( CLEAR ?auto_5358 ) ( TRUCK-AT ?auto_5366 ?auto_5361 ) ( not ( = ?auto_5357 ?auto_5358 ) ) ( not ( = ?auto_5357 ?auto_5369 ) ) ( not ( = ?auto_5358 ?auto_5369 ) ) ( not ( = ?auto_5365 ?auto_5367 ) ) ( not ( = ?auto_5357 ?auto_5359 ) ) ( not ( = ?auto_5357 ?auto_5368 ) ) ( not ( = ?auto_5359 ?auto_5369 ) ) ( not ( = ?auto_5364 ?auto_5370 ) ) ( not ( = ?auto_5363 ?auto_5367 ) ) ( not ( = ?auto_5368 ?auto_5369 ) ) ( not ( = ?auto_5357 ?auto_5360 ) ) ( not ( = ?auto_5357 ?auto_5362 ) ) ( not ( = ?auto_5358 ?auto_5360 ) ) ( not ( = ?auto_5358 ?auto_5362 ) ) ( not ( = ?auto_5360 ?auto_5368 ) ) ( not ( = ?auto_5360 ?auto_5369 ) ) ( not ( = ?auto_5362 ?auto_5368 ) ) ( not ( = ?auto_5362 ?auto_5369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5357 ?auto_5358 ?auto_5359 )
      ( MAKE-1CRATE ?auto_5359 ?auto_5360 )
      ( MAKE-3CRATE-VERIFY ?auto_5357 ?auto_5358 ?auto_5359 ?auto_5360 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5373 - SURFACE
      ?auto_5374 - SURFACE
    )
    :vars
    (
      ?auto_5375 - HOIST
      ?auto_5376 - PLACE
      ?auto_5378 - PLACE
      ?auto_5379 - HOIST
      ?auto_5380 - SURFACE
      ?auto_5377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5375 ?auto_5376 ) ( SURFACE-AT ?auto_5373 ?auto_5376 ) ( CLEAR ?auto_5373 ) ( IS-CRATE ?auto_5374 ) ( AVAILABLE ?auto_5375 ) ( not ( = ?auto_5378 ?auto_5376 ) ) ( HOIST-AT ?auto_5379 ?auto_5378 ) ( AVAILABLE ?auto_5379 ) ( SURFACE-AT ?auto_5374 ?auto_5378 ) ( ON ?auto_5374 ?auto_5380 ) ( CLEAR ?auto_5374 ) ( TRUCK-AT ?auto_5377 ?auto_5376 ) ( not ( = ?auto_5373 ?auto_5374 ) ) ( not ( = ?auto_5373 ?auto_5380 ) ) ( not ( = ?auto_5374 ?auto_5380 ) ) ( not ( = ?auto_5375 ?auto_5379 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5377 ?auto_5376 ?auto_5378 )
      ( !LIFT ?auto_5379 ?auto_5374 ?auto_5380 ?auto_5378 )
      ( !LOAD ?auto_5379 ?auto_5374 ?auto_5377 ?auto_5378 )
      ( !DRIVE ?auto_5377 ?auto_5378 ?auto_5376 )
      ( !UNLOAD ?auto_5375 ?auto_5374 ?auto_5377 ?auto_5376 )
      ( !DROP ?auto_5375 ?auto_5374 ?auto_5373 ?auto_5376 )
      ( MAKE-1CRATE-VERIFY ?auto_5373 ?auto_5374 ) )
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
      ?auto_5395 - PLACE
      ?auto_5394 - PLACE
      ?auto_5393 - HOIST
      ?auto_5391 - SURFACE
      ?auto_5400 - PLACE
      ?auto_5401 - HOIST
      ?auto_5399 - SURFACE
      ?auto_5403 - SURFACE
      ?auto_5398 - PLACE
      ?auto_5397 - HOIST
      ?auto_5402 - SURFACE
      ?auto_5396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5392 ?auto_5395 ) ( IS-CRATE ?auto_5390 ) ( not ( = ?auto_5394 ?auto_5395 ) ) ( HOIST-AT ?auto_5393 ?auto_5394 ) ( AVAILABLE ?auto_5393 ) ( SURFACE-AT ?auto_5390 ?auto_5394 ) ( ON ?auto_5390 ?auto_5391 ) ( CLEAR ?auto_5390 ) ( not ( = ?auto_5389 ?auto_5390 ) ) ( not ( = ?auto_5389 ?auto_5391 ) ) ( not ( = ?auto_5390 ?auto_5391 ) ) ( not ( = ?auto_5392 ?auto_5393 ) ) ( IS-CRATE ?auto_5389 ) ( not ( = ?auto_5400 ?auto_5395 ) ) ( HOIST-AT ?auto_5401 ?auto_5400 ) ( SURFACE-AT ?auto_5389 ?auto_5400 ) ( ON ?auto_5389 ?auto_5399 ) ( CLEAR ?auto_5389 ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5399 ) ) ( not ( = ?auto_5389 ?auto_5399 ) ) ( not ( = ?auto_5392 ?auto_5401 ) ) ( IS-CRATE ?auto_5388 ) ( AVAILABLE ?auto_5401 ) ( SURFACE-AT ?auto_5388 ?auto_5400 ) ( ON ?auto_5388 ?auto_5403 ) ( CLEAR ?auto_5388 ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5403 ) ) ( not ( = ?auto_5388 ?auto_5403 ) ) ( SURFACE-AT ?auto_5386 ?auto_5395 ) ( CLEAR ?auto_5386 ) ( IS-CRATE ?auto_5387 ) ( AVAILABLE ?auto_5392 ) ( not ( = ?auto_5398 ?auto_5395 ) ) ( HOIST-AT ?auto_5397 ?auto_5398 ) ( AVAILABLE ?auto_5397 ) ( SURFACE-AT ?auto_5387 ?auto_5398 ) ( ON ?auto_5387 ?auto_5402 ) ( CLEAR ?auto_5387 ) ( TRUCK-AT ?auto_5396 ?auto_5395 ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5402 ) ) ( not ( = ?auto_5387 ?auto_5402 ) ) ( not ( = ?auto_5392 ?auto_5397 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5386 ?auto_5403 ) ) ( not ( = ?auto_5388 ?auto_5402 ) ) ( not ( = ?auto_5400 ?auto_5398 ) ) ( not ( = ?auto_5401 ?auto_5397 ) ) ( not ( = ?auto_5403 ?auto_5402 ) ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( not ( = ?auto_5386 ?auto_5399 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5399 ) ) ( not ( = ?auto_5389 ?auto_5403 ) ) ( not ( = ?auto_5389 ?auto_5402 ) ) ( not ( = ?auto_5399 ?auto_5403 ) ) ( not ( = ?auto_5399 ?auto_5402 ) ) ( not ( = ?auto_5386 ?auto_5390 ) ) ( not ( = ?auto_5386 ?auto_5391 ) ) ( not ( = ?auto_5387 ?auto_5390 ) ) ( not ( = ?auto_5387 ?auto_5391 ) ) ( not ( = ?auto_5388 ?auto_5390 ) ) ( not ( = ?auto_5388 ?auto_5391 ) ) ( not ( = ?auto_5390 ?auto_5399 ) ) ( not ( = ?auto_5390 ?auto_5403 ) ) ( not ( = ?auto_5390 ?auto_5402 ) ) ( not ( = ?auto_5394 ?auto_5400 ) ) ( not ( = ?auto_5394 ?auto_5398 ) ) ( not ( = ?auto_5393 ?auto_5401 ) ) ( not ( = ?auto_5393 ?auto_5397 ) ) ( not ( = ?auto_5391 ?auto_5399 ) ) ( not ( = ?auto_5391 ?auto_5403 ) ) ( not ( = ?auto_5391 ?auto_5402 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5389 )
      ( MAKE-1CRATE ?auto_5389 ?auto_5390 )
      ( MAKE-4CRATE-VERIFY ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5389 ?auto_5390 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5406 - SURFACE
      ?auto_5407 - SURFACE
    )
    :vars
    (
      ?auto_5408 - HOIST
      ?auto_5409 - PLACE
      ?auto_5411 - PLACE
      ?auto_5412 - HOIST
      ?auto_5413 - SURFACE
      ?auto_5410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5408 ?auto_5409 ) ( SURFACE-AT ?auto_5406 ?auto_5409 ) ( CLEAR ?auto_5406 ) ( IS-CRATE ?auto_5407 ) ( AVAILABLE ?auto_5408 ) ( not ( = ?auto_5411 ?auto_5409 ) ) ( HOIST-AT ?auto_5412 ?auto_5411 ) ( AVAILABLE ?auto_5412 ) ( SURFACE-AT ?auto_5407 ?auto_5411 ) ( ON ?auto_5407 ?auto_5413 ) ( CLEAR ?auto_5407 ) ( TRUCK-AT ?auto_5410 ?auto_5409 ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5413 ) ) ( not ( = ?auto_5407 ?auto_5413 ) ) ( not ( = ?auto_5408 ?auto_5412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5410 ?auto_5409 ?auto_5411 )
      ( !LIFT ?auto_5412 ?auto_5407 ?auto_5413 ?auto_5411 )
      ( !LOAD ?auto_5412 ?auto_5407 ?auto_5410 ?auto_5411 )
      ( !DRIVE ?auto_5410 ?auto_5411 ?auto_5409 )
      ( !UNLOAD ?auto_5408 ?auto_5407 ?auto_5410 ?auto_5409 )
      ( !DROP ?auto_5408 ?auto_5407 ?auto_5406 ?auto_5409 )
      ( MAKE-1CRATE-VERIFY ?auto_5406 ?auto_5407 ) )
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
      ?auto_5426 - HOIST
      ?auto_5428 - PLACE
      ?auto_5427 - PLACE
      ?auto_5431 - HOIST
      ?auto_5430 - SURFACE
      ?auto_5433 - PLACE
      ?auto_5439 - HOIST
      ?auto_5432 - SURFACE
      ?auto_5441 - PLACE
      ?auto_5436 - HOIST
      ?auto_5435 - SURFACE
      ?auto_5438 - SURFACE
      ?auto_5440 - PLACE
      ?auto_5434 - HOIST
      ?auto_5437 - SURFACE
      ?auto_5429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5426 ?auto_5428 ) ( IS-CRATE ?auto_5425 ) ( not ( = ?auto_5427 ?auto_5428 ) ) ( HOIST-AT ?auto_5431 ?auto_5427 ) ( AVAILABLE ?auto_5431 ) ( SURFACE-AT ?auto_5425 ?auto_5427 ) ( ON ?auto_5425 ?auto_5430 ) ( CLEAR ?auto_5425 ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5430 ) ) ( not ( = ?auto_5425 ?auto_5430 ) ) ( not ( = ?auto_5426 ?auto_5431 ) ) ( IS-CRATE ?auto_5424 ) ( not ( = ?auto_5433 ?auto_5428 ) ) ( HOIST-AT ?auto_5439 ?auto_5433 ) ( AVAILABLE ?auto_5439 ) ( SURFACE-AT ?auto_5424 ?auto_5433 ) ( ON ?auto_5424 ?auto_5432 ) ( CLEAR ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( not ( = ?auto_5423 ?auto_5432 ) ) ( not ( = ?auto_5424 ?auto_5432 ) ) ( not ( = ?auto_5426 ?auto_5439 ) ) ( IS-CRATE ?auto_5423 ) ( not ( = ?auto_5441 ?auto_5428 ) ) ( HOIST-AT ?auto_5436 ?auto_5441 ) ( SURFACE-AT ?auto_5423 ?auto_5441 ) ( ON ?auto_5423 ?auto_5435 ) ( CLEAR ?auto_5423 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5435 ) ) ( not ( = ?auto_5423 ?auto_5435 ) ) ( not ( = ?auto_5426 ?auto_5436 ) ) ( IS-CRATE ?auto_5422 ) ( AVAILABLE ?auto_5436 ) ( SURFACE-AT ?auto_5422 ?auto_5441 ) ( ON ?auto_5422 ?auto_5438 ) ( CLEAR ?auto_5422 ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5438 ) ) ( not ( = ?auto_5422 ?auto_5438 ) ) ( SURFACE-AT ?auto_5420 ?auto_5428 ) ( CLEAR ?auto_5420 ) ( IS-CRATE ?auto_5421 ) ( AVAILABLE ?auto_5426 ) ( not ( = ?auto_5440 ?auto_5428 ) ) ( HOIST-AT ?auto_5434 ?auto_5440 ) ( AVAILABLE ?auto_5434 ) ( SURFACE-AT ?auto_5421 ?auto_5440 ) ( ON ?auto_5421 ?auto_5437 ) ( CLEAR ?auto_5421 ) ( TRUCK-AT ?auto_5429 ?auto_5428 ) ( not ( = ?auto_5420 ?auto_5421 ) ) ( not ( = ?auto_5420 ?auto_5437 ) ) ( not ( = ?auto_5421 ?auto_5437 ) ) ( not ( = ?auto_5426 ?auto_5434 ) ) ( not ( = ?auto_5420 ?auto_5422 ) ) ( not ( = ?auto_5420 ?auto_5438 ) ) ( not ( = ?auto_5422 ?auto_5437 ) ) ( not ( = ?auto_5441 ?auto_5440 ) ) ( not ( = ?auto_5436 ?auto_5434 ) ) ( not ( = ?auto_5438 ?auto_5437 ) ) ( not ( = ?auto_5420 ?auto_5423 ) ) ( not ( = ?auto_5420 ?auto_5435 ) ) ( not ( = ?auto_5421 ?auto_5423 ) ) ( not ( = ?auto_5421 ?auto_5435 ) ) ( not ( = ?auto_5423 ?auto_5438 ) ) ( not ( = ?auto_5423 ?auto_5437 ) ) ( not ( = ?auto_5435 ?auto_5438 ) ) ( not ( = ?auto_5435 ?auto_5437 ) ) ( not ( = ?auto_5420 ?auto_5424 ) ) ( not ( = ?auto_5420 ?auto_5432 ) ) ( not ( = ?auto_5421 ?auto_5424 ) ) ( not ( = ?auto_5421 ?auto_5432 ) ) ( not ( = ?auto_5422 ?auto_5424 ) ) ( not ( = ?auto_5422 ?auto_5432 ) ) ( not ( = ?auto_5424 ?auto_5435 ) ) ( not ( = ?auto_5424 ?auto_5438 ) ) ( not ( = ?auto_5424 ?auto_5437 ) ) ( not ( = ?auto_5433 ?auto_5441 ) ) ( not ( = ?auto_5433 ?auto_5440 ) ) ( not ( = ?auto_5439 ?auto_5436 ) ) ( not ( = ?auto_5439 ?auto_5434 ) ) ( not ( = ?auto_5432 ?auto_5435 ) ) ( not ( = ?auto_5432 ?auto_5438 ) ) ( not ( = ?auto_5432 ?auto_5437 ) ) ( not ( = ?auto_5420 ?auto_5425 ) ) ( not ( = ?auto_5420 ?auto_5430 ) ) ( not ( = ?auto_5421 ?auto_5425 ) ) ( not ( = ?auto_5421 ?auto_5430 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5430 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5430 ) ) ( not ( = ?auto_5425 ?auto_5432 ) ) ( not ( = ?auto_5425 ?auto_5435 ) ) ( not ( = ?auto_5425 ?auto_5438 ) ) ( not ( = ?auto_5425 ?auto_5437 ) ) ( not ( = ?auto_5427 ?auto_5433 ) ) ( not ( = ?auto_5427 ?auto_5441 ) ) ( not ( = ?auto_5427 ?auto_5440 ) ) ( not ( = ?auto_5431 ?auto_5439 ) ) ( not ( = ?auto_5431 ?auto_5436 ) ) ( not ( = ?auto_5431 ?auto_5434 ) ) ( not ( = ?auto_5430 ?auto_5432 ) ) ( not ( = ?auto_5430 ?auto_5435 ) ) ( not ( = ?auto_5430 ?auto_5438 ) ) ( not ( = ?auto_5430 ?auto_5437 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5420 ?auto_5421 ?auto_5422 ?auto_5423 ?auto_5424 )
      ( MAKE-1CRATE ?auto_5424 ?auto_5425 )
      ( MAKE-5CRATE-VERIFY ?auto_5420 ?auto_5421 ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5444 - SURFACE
      ?auto_5445 - SURFACE
    )
    :vars
    (
      ?auto_5446 - HOIST
      ?auto_5447 - PLACE
      ?auto_5449 - PLACE
      ?auto_5450 - HOIST
      ?auto_5451 - SURFACE
      ?auto_5448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5446 ?auto_5447 ) ( SURFACE-AT ?auto_5444 ?auto_5447 ) ( CLEAR ?auto_5444 ) ( IS-CRATE ?auto_5445 ) ( AVAILABLE ?auto_5446 ) ( not ( = ?auto_5449 ?auto_5447 ) ) ( HOIST-AT ?auto_5450 ?auto_5449 ) ( AVAILABLE ?auto_5450 ) ( SURFACE-AT ?auto_5445 ?auto_5449 ) ( ON ?auto_5445 ?auto_5451 ) ( CLEAR ?auto_5445 ) ( TRUCK-AT ?auto_5448 ?auto_5447 ) ( not ( = ?auto_5444 ?auto_5445 ) ) ( not ( = ?auto_5444 ?auto_5451 ) ) ( not ( = ?auto_5445 ?auto_5451 ) ) ( not ( = ?auto_5446 ?auto_5450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5448 ?auto_5447 ?auto_5449 )
      ( !LIFT ?auto_5450 ?auto_5445 ?auto_5451 ?auto_5449 )
      ( !LOAD ?auto_5450 ?auto_5445 ?auto_5448 ?auto_5449 )
      ( !DRIVE ?auto_5448 ?auto_5449 ?auto_5447 )
      ( !UNLOAD ?auto_5446 ?auto_5445 ?auto_5448 ?auto_5447 )
      ( !DROP ?auto_5446 ?auto_5445 ?auto_5444 ?auto_5447 )
      ( MAKE-1CRATE-VERIFY ?auto_5444 ?auto_5445 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5459 - SURFACE
      ?auto_5460 - SURFACE
      ?auto_5461 - SURFACE
      ?auto_5462 - SURFACE
      ?auto_5463 - SURFACE
      ?auto_5465 - SURFACE
      ?auto_5464 - SURFACE
    )
    :vars
    (
      ?auto_5471 - HOIST
      ?auto_5467 - PLACE
      ?auto_5468 - PLACE
      ?auto_5466 - HOIST
      ?auto_5470 - SURFACE
      ?auto_5472 - PLACE
      ?auto_5477 - HOIST
      ?auto_5476 - SURFACE
      ?auto_5479 - PLACE
      ?auto_5481 - HOIST
      ?auto_5478 - SURFACE
      ?auto_5480 - PLACE
      ?auto_5484 - HOIST
      ?auto_5475 - SURFACE
      ?auto_5483 - SURFACE
      ?auto_5473 - PLACE
      ?auto_5474 - HOIST
      ?auto_5482 - SURFACE
      ?auto_5469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5471 ?auto_5467 ) ( IS-CRATE ?auto_5464 ) ( not ( = ?auto_5468 ?auto_5467 ) ) ( HOIST-AT ?auto_5466 ?auto_5468 ) ( AVAILABLE ?auto_5466 ) ( SURFACE-AT ?auto_5464 ?auto_5468 ) ( ON ?auto_5464 ?auto_5470 ) ( CLEAR ?auto_5464 ) ( not ( = ?auto_5465 ?auto_5464 ) ) ( not ( = ?auto_5465 ?auto_5470 ) ) ( not ( = ?auto_5464 ?auto_5470 ) ) ( not ( = ?auto_5471 ?auto_5466 ) ) ( IS-CRATE ?auto_5465 ) ( not ( = ?auto_5472 ?auto_5467 ) ) ( HOIST-AT ?auto_5477 ?auto_5472 ) ( AVAILABLE ?auto_5477 ) ( SURFACE-AT ?auto_5465 ?auto_5472 ) ( ON ?auto_5465 ?auto_5476 ) ( CLEAR ?auto_5465 ) ( not ( = ?auto_5463 ?auto_5465 ) ) ( not ( = ?auto_5463 ?auto_5476 ) ) ( not ( = ?auto_5465 ?auto_5476 ) ) ( not ( = ?auto_5471 ?auto_5477 ) ) ( IS-CRATE ?auto_5463 ) ( not ( = ?auto_5479 ?auto_5467 ) ) ( HOIST-AT ?auto_5481 ?auto_5479 ) ( AVAILABLE ?auto_5481 ) ( SURFACE-AT ?auto_5463 ?auto_5479 ) ( ON ?auto_5463 ?auto_5478 ) ( CLEAR ?auto_5463 ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5478 ) ) ( not ( = ?auto_5463 ?auto_5478 ) ) ( not ( = ?auto_5471 ?auto_5481 ) ) ( IS-CRATE ?auto_5462 ) ( not ( = ?auto_5480 ?auto_5467 ) ) ( HOIST-AT ?auto_5484 ?auto_5480 ) ( SURFACE-AT ?auto_5462 ?auto_5480 ) ( ON ?auto_5462 ?auto_5475 ) ( CLEAR ?auto_5462 ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( not ( = ?auto_5461 ?auto_5475 ) ) ( not ( = ?auto_5462 ?auto_5475 ) ) ( not ( = ?auto_5471 ?auto_5484 ) ) ( IS-CRATE ?auto_5461 ) ( AVAILABLE ?auto_5484 ) ( SURFACE-AT ?auto_5461 ?auto_5480 ) ( ON ?auto_5461 ?auto_5483 ) ( CLEAR ?auto_5461 ) ( not ( = ?auto_5460 ?auto_5461 ) ) ( not ( = ?auto_5460 ?auto_5483 ) ) ( not ( = ?auto_5461 ?auto_5483 ) ) ( SURFACE-AT ?auto_5459 ?auto_5467 ) ( CLEAR ?auto_5459 ) ( IS-CRATE ?auto_5460 ) ( AVAILABLE ?auto_5471 ) ( not ( = ?auto_5473 ?auto_5467 ) ) ( HOIST-AT ?auto_5474 ?auto_5473 ) ( AVAILABLE ?auto_5474 ) ( SURFACE-AT ?auto_5460 ?auto_5473 ) ( ON ?auto_5460 ?auto_5482 ) ( CLEAR ?auto_5460 ) ( TRUCK-AT ?auto_5469 ?auto_5467 ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( not ( = ?auto_5459 ?auto_5482 ) ) ( not ( = ?auto_5460 ?auto_5482 ) ) ( not ( = ?auto_5471 ?auto_5474 ) ) ( not ( = ?auto_5459 ?auto_5461 ) ) ( not ( = ?auto_5459 ?auto_5483 ) ) ( not ( = ?auto_5461 ?auto_5482 ) ) ( not ( = ?auto_5480 ?auto_5473 ) ) ( not ( = ?auto_5484 ?auto_5474 ) ) ( not ( = ?auto_5483 ?auto_5482 ) ) ( not ( = ?auto_5459 ?auto_5462 ) ) ( not ( = ?auto_5459 ?auto_5475 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( not ( = ?auto_5460 ?auto_5475 ) ) ( not ( = ?auto_5462 ?auto_5483 ) ) ( not ( = ?auto_5462 ?auto_5482 ) ) ( not ( = ?auto_5475 ?auto_5483 ) ) ( not ( = ?auto_5475 ?auto_5482 ) ) ( not ( = ?auto_5459 ?auto_5463 ) ) ( not ( = ?auto_5459 ?auto_5478 ) ) ( not ( = ?auto_5460 ?auto_5463 ) ) ( not ( = ?auto_5460 ?auto_5478 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5478 ) ) ( not ( = ?auto_5463 ?auto_5475 ) ) ( not ( = ?auto_5463 ?auto_5483 ) ) ( not ( = ?auto_5463 ?auto_5482 ) ) ( not ( = ?auto_5479 ?auto_5480 ) ) ( not ( = ?auto_5479 ?auto_5473 ) ) ( not ( = ?auto_5481 ?auto_5484 ) ) ( not ( = ?auto_5481 ?auto_5474 ) ) ( not ( = ?auto_5478 ?auto_5475 ) ) ( not ( = ?auto_5478 ?auto_5483 ) ) ( not ( = ?auto_5478 ?auto_5482 ) ) ( not ( = ?auto_5459 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5476 ) ) ( not ( = ?auto_5460 ?auto_5465 ) ) ( not ( = ?auto_5460 ?auto_5476 ) ) ( not ( = ?auto_5461 ?auto_5465 ) ) ( not ( = ?auto_5461 ?auto_5476 ) ) ( not ( = ?auto_5462 ?auto_5465 ) ) ( not ( = ?auto_5462 ?auto_5476 ) ) ( not ( = ?auto_5465 ?auto_5478 ) ) ( not ( = ?auto_5465 ?auto_5475 ) ) ( not ( = ?auto_5465 ?auto_5483 ) ) ( not ( = ?auto_5465 ?auto_5482 ) ) ( not ( = ?auto_5472 ?auto_5479 ) ) ( not ( = ?auto_5472 ?auto_5480 ) ) ( not ( = ?auto_5472 ?auto_5473 ) ) ( not ( = ?auto_5477 ?auto_5481 ) ) ( not ( = ?auto_5477 ?auto_5484 ) ) ( not ( = ?auto_5477 ?auto_5474 ) ) ( not ( = ?auto_5476 ?auto_5478 ) ) ( not ( = ?auto_5476 ?auto_5475 ) ) ( not ( = ?auto_5476 ?auto_5483 ) ) ( not ( = ?auto_5476 ?auto_5482 ) ) ( not ( = ?auto_5459 ?auto_5464 ) ) ( not ( = ?auto_5459 ?auto_5470 ) ) ( not ( = ?auto_5460 ?auto_5464 ) ) ( not ( = ?auto_5460 ?auto_5470 ) ) ( not ( = ?auto_5461 ?auto_5464 ) ) ( not ( = ?auto_5461 ?auto_5470 ) ) ( not ( = ?auto_5462 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5470 ) ) ( not ( = ?auto_5463 ?auto_5464 ) ) ( not ( = ?auto_5463 ?auto_5470 ) ) ( not ( = ?auto_5464 ?auto_5476 ) ) ( not ( = ?auto_5464 ?auto_5478 ) ) ( not ( = ?auto_5464 ?auto_5475 ) ) ( not ( = ?auto_5464 ?auto_5483 ) ) ( not ( = ?auto_5464 ?auto_5482 ) ) ( not ( = ?auto_5468 ?auto_5472 ) ) ( not ( = ?auto_5468 ?auto_5479 ) ) ( not ( = ?auto_5468 ?auto_5480 ) ) ( not ( = ?auto_5468 ?auto_5473 ) ) ( not ( = ?auto_5466 ?auto_5477 ) ) ( not ( = ?auto_5466 ?auto_5481 ) ) ( not ( = ?auto_5466 ?auto_5484 ) ) ( not ( = ?auto_5466 ?auto_5474 ) ) ( not ( = ?auto_5470 ?auto_5476 ) ) ( not ( = ?auto_5470 ?auto_5478 ) ) ( not ( = ?auto_5470 ?auto_5475 ) ) ( not ( = ?auto_5470 ?auto_5483 ) ) ( not ( = ?auto_5470 ?auto_5482 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5459 ?auto_5460 ?auto_5461 ?auto_5462 ?auto_5463 ?auto_5465 )
      ( MAKE-1CRATE ?auto_5465 ?auto_5464 )
      ( MAKE-6CRATE-VERIFY ?auto_5459 ?auto_5460 ?auto_5461 ?auto_5462 ?auto_5463 ?auto_5465 ?auto_5464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5487 - SURFACE
      ?auto_5488 - SURFACE
    )
    :vars
    (
      ?auto_5489 - HOIST
      ?auto_5490 - PLACE
      ?auto_5492 - PLACE
      ?auto_5493 - HOIST
      ?auto_5494 - SURFACE
      ?auto_5491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5489 ?auto_5490 ) ( SURFACE-AT ?auto_5487 ?auto_5490 ) ( CLEAR ?auto_5487 ) ( IS-CRATE ?auto_5488 ) ( AVAILABLE ?auto_5489 ) ( not ( = ?auto_5492 ?auto_5490 ) ) ( HOIST-AT ?auto_5493 ?auto_5492 ) ( AVAILABLE ?auto_5493 ) ( SURFACE-AT ?auto_5488 ?auto_5492 ) ( ON ?auto_5488 ?auto_5494 ) ( CLEAR ?auto_5488 ) ( TRUCK-AT ?auto_5491 ?auto_5490 ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( not ( = ?auto_5487 ?auto_5494 ) ) ( not ( = ?auto_5488 ?auto_5494 ) ) ( not ( = ?auto_5489 ?auto_5493 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5491 ?auto_5490 ?auto_5492 )
      ( !LIFT ?auto_5493 ?auto_5488 ?auto_5494 ?auto_5492 )
      ( !LOAD ?auto_5493 ?auto_5488 ?auto_5491 ?auto_5492 )
      ( !DRIVE ?auto_5491 ?auto_5492 ?auto_5490 )
      ( !UNLOAD ?auto_5489 ?auto_5488 ?auto_5491 ?auto_5490 )
      ( !DROP ?auto_5489 ?auto_5488 ?auto_5487 ?auto_5490 )
      ( MAKE-1CRATE-VERIFY ?auto_5487 ?auto_5488 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5503 - SURFACE
      ?auto_5504 - SURFACE
      ?auto_5505 - SURFACE
      ?auto_5506 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5509 - SURFACE
      ?auto_5508 - SURFACE
      ?auto_5510 - SURFACE
    )
    :vars
    (
      ?auto_5515 - HOIST
      ?auto_5516 - PLACE
      ?auto_5514 - PLACE
      ?auto_5513 - HOIST
      ?auto_5511 - SURFACE
      ?auto_5528 - PLACE
      ?auto_5529 - HOIST
      ?auto_5518 - SURFACE
      ?auto_5530 - PLACE
      ?auto_5526 - HOIST
      ?auto_5527 - SURFACE
      ?auto_5524 - PLACE
      ?auto_5521 - HOIST
      ?auto_5525 - SURFACE
      ?auto_5519 - PLACE
      ?auto_5523 - HOIST
      ?auto_5532 - SURFACE
      ?auto_5522 - SURFACE
      ?auto_5531 - PLACE
      ?auto_5517 - HOIST
      ?auto_5520 - SURFACE
      ?auto_5512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5515 ?auto_5516 ) ( IS-CRATE ?auto_5510 ) ( not ( = ?auto_5514 ?auto_5516 ) ) ( HOIST-AT ?auto_5513 ?auto_5514 ) ( AVAILABLE ?auto_5513 ) ( SURFACE-AT ?auto_5510 ?auto_5514 ) ( ON ?auto_5510 ?auto_5511 ) ( CLEAR ?auto_5510 ) ( not ( = ?auto_5508 ?auto_5510 ) ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( not ( = ?auto_5510 ?auto_5511 ) ) ( not ( = ?auto_5515 ?auto_5513 ) ) ( IS-CRATE ?auto_5508 ) ( not ( = ?auto_5528 ?auto_5516 ) ) ( HOIST-AT ?auto_5529 ?auto_5528 ) ( AVAILABLE ?auto_5529 ) ( SURFACE-AT ?auto_5508 ?auto_5528 ) ( ON ?auto_5508 ?auto_5518 ) ( CLEAR ?auto_5508 ) ( not ( = ?auto_5509 ?auto_5508 ) ) ( not ( = ?auto_5509 ?auto_5518 ) ) ( not ( = ?auto_5508 ?auto_5518 ) ) ( not ( = ?auto_5515 ?auto_5529 ) ) ( IS-CRATE ?auto_5509 ) ( not ( = ?auto_5530 ?auto_5516 ) ) ( HOIST-AT ?auto_5526 ?auto_5530 ) ( AVAILABLE ?auto_5526 ) ( SURFACE-AT ?auto_5509 ?auto_5530 ) ( ON ?auto_5509 ?auto_5527 ) ( CLEAR ?auto_5509 ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( not ( = ?auto_5507 ?auto_5527 ) ) ( not ( = ?auto_5509 ?auto_5527 ) ) ( not ( = ?auto_5515 ?auto_5526 ) ) ( IS-CRATE ?auto_5507 ) ( not ( = ?auto_5524 ?auto_5516 ) ) ( HOIST-AT ?auto_5521 ?auto_5524 ) ( AVAILABLE ?auto_5521 ) ( SURFACE-AT ?auto_5507 ?auto_5524 ) ( ON ?auto_5507 ?auto_5525 ) ( CLEAR ?auto_5507 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5525 ) ) ( not ( = ?auto_5507 ?auto_5525 ) ) ( not ( = ?auto_5515 ?auto_5521 ) ) ( IS-CRATE ?auto_5506 ) ( not ( = ?auto_5519 ?auto_5516 ) ) ( HOIST-AT ?auto_5523 ?auto_5519 ) ( SURFACE-AT ?auto_5506 ?auto_5519 ) ( ON ?auto_5506 ?auto_5532 ) ( CLEAR ?auto_5506 ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5532 ) ) ( not ( = ?auto_5506 ?auto_5532 ) ) ( not ( = ?auto_5515 ?auto_5523 ) ) ( IS-CRATE ?auto_5505 ) ( AVAILABLE ?auto_5523 ) ( SURFACE-AT ?auto_5505 ?auto_5519 ) ( ON ?auto_5505 ?auto_5522 ) ( CLEAR ?auto_5505 ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( not ( = ?auto_5504 ?auto_5522 ) ) ( not ( = ?auto_5505 ?auto_5522 ) ) ( SURFACE-AT ?auto_5503 ?auto_5516 ) ( CLEAR ?auto_5503 ) ( IS-CRATE ?auto_5504 ) ( AVAILABLE ?auto_5515 ) ( not ( = ?auto_5531 ?auto_5516 ) ) ( HOIST-AT ?auto_5517 ?auto_5531 ) ( AVAILABLE ?auto_5517 ) ( SURFACE-AT ?auto_5504 ?auto_5531 ) ( ON ?auto_5504 ?auto_5520 ) ( CLEAR ?auto_5504 ) ( TRUCK-AT ?auto_5512 ?auto_5516 ) ( not ( = ?auto_5503 ?auto_5504 ) ) ( not ( = ?auto_5503 ?auto_5520 ) ) ( not ( = ?auto_5504 ?auto_5520 ) ) ( not ( = ?auto_5515 ?auto_5517 ) ) ( not ( = ?auto_5503 ?auto_5505 ) ) ( not ( = ?auto_5503 ?auto_5522 ) ) ( not ( = ?auto_5505 ?auto_5520 ) ) ( not ( = ?auto_5519 ?auto_5531 ) ) ( not ( = ?auto_5523 ?auto_5517 ) ) ( not ( = ?auto_5522 ?auto_5520 ) ) ( not ( = ?auto_5503 ?auto_5506 ) ) ( not ( = ?auto_5503 ?auto_5532 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5504 ?auto_5532 ) ) ( not ( = ?auto_5506 ?auto_5522 ) ) ( not ( = ?auto_5506 ?auto_5520 ) ) ( not ( = ?auto_5532 ?auto_5522 ) ) ( not ( = ?auto_5532 ?auto_5520 ) ) ( not ( = ?auto_5503 ?auto_5507 ) ) ( not ( = ?auto_5503 ?auto_5525 ) ) ( not ( = ?auto_5504 ?auto_5507 ) ) ( not ( = ?auto_5504 ?auto_5525 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5525 ) ) ( not ( = ?auto_5507 ?auto_5532 ) ) ( not ( = ?auto_5507 ?auto_5522 ) ) ( not ( = ?auto_5507 ?auto_5520 ) ) ( not ( = ?auto_5524 ?auto_5519 ) ) ( not ( = ?auto_5524 ?auto_5531 ) ) ( not ( = ?auto_5521 ?auto_5523 ) ) ( not ( = ?auto_5521 ?auto_5517 ) ) ( not ( = ?auto_5525 ?auto_5532 ) ) ( not ( = ?auto_5525 ?auto_5522 ) ) ( not ( = ?auto_5525 ?auto_5520 ) ) ( not ( = ?auto_5503 ?auto_5509 ) ) ( not ( = ?auto_5503 ?auto_5527 ) ) ( not ( = ?auto_5504 ?auto_5509 ) ) ( not ( = ?auto_5504 ?auto_5527 ) ) ( not ( = ?auto_5505 ?auto_5509 ) ) ( not ( = ?auto_5505 ?auto_5527 ) ) ( not ( = ?auto_5506 ?auto_5509 ) ) ( not ( = ?auto_5506 ?auto_5527 ) ) ( not ( = ?auto_5509 ?auto_5525 ) ) ( not ( = ?auto_5509 ?auto_5532 ) ) ( not ( = ?auto_5509 ?auto_5522 ) ) ( not ( = ?auto_5509 ?auto_5520 ) ) ( not ( = ?auto_5530 ?auto_5524 ) ) ( not ( = ?auto_5530 ?auto_5519 ) ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5526 ?auto_5521 ) ) ( not ( = ?auto_5526 ?auto_5523 ) ) ( not ( = ?auto_5526 ?auto_5517 ) ) ( not ( = ?auto_5527 ?auto_5525 ) ) ( not ( = ?auto_5527 ?auto_5532 ) ) ( not ( = ?auto_5527 ?auto_5522 ) ) ( not ( = ?auto_5527 ?auto_5520 ) ) ( not ( = ?auto_5503 ?auto_5508 ) ) ( not ( = ?auto_5503 ?auto_5518 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) ( not ( = ?auto_5504 ?auto_5518 ) ) ( not ( = ?auto_5505 ?auto_5508 ) ) ( not ( = ?auto_5505 ?auto_5518 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5518 ) ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( not ( = ?auto_5507 ?auto_5518 ) ) ( not ( = ?auto_5508 ?auto_5527 ) ) ( not ( = ?auto_5508 ?auto_5525 ) ) ( not ( = ?auto_5508 ?auto_5532 ) ) ( not ( = ?auto_5508 ?auto_5522 ) ) ( not ( = ?auto_5508 ?auto_5520 ) ) ( not ( = ?auto_5528 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5524 ) ) ( not ( = ?auto_5528 ?auto_5519 ) ) ( not ( = ?auto_5528 ?auto_5531 ) ) ( not ( = ?auto_5529 ?auto_5526 ) ) ( not ( = ?auto_5529 ?auto_5521 ) ) ( not ( = ?auto_5529 ?auto_5523 ) ) ( not ( = ?auto_5529 ?auto_5517 ) ) ( not ( = ?auto_5518 ?auto_5527 ) ) ( not ( = ?auto_5518 ?auto_5525 ) ) ( not ( = ?auto_5518 ?auto_5532 ) ) ( not ( = ?auto_5518 ?auto_5522 ) ) ( not ( = ?auto_5518 ?auto_5520 ) ) ( not ( = ?auto_5503 ?auto_5510 ) ) ( not ( = ?auto_5503 ?auto_5511 ) ) ( not ( = ?auto_5504 ?auto_5510 ) ) ( not ( = ?auto_5504 ?auto_5511 ) ) ( not ( = ?auto_5505 ?auto_5510 ) ) ( not ( = ?auto_5505 ?auto_5511 ) ) ( not ( = ?auto_5506 ?auto_5510 ) ) ( not ( = ?auto_5506 ?auto_5511 ) ) ( not ( = ?auto_5507 ?auto_5510 ) ) ( not ( = ?auto_5507 ?auto_5511 ) ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5511 ) ) ( not ( = ?auto_5510 ?auto_5518 ) ) ( not ( = ?auto_5510 ?auto_5527 ) ) ( not ( = ?auto_5510 ?auto_5525 ) ) ( not ( = ?auto_5510 ?auto_5532 ) ) ( not ( = ?auto_5510 ?auto_5522 ) ) ( not ( = ?auto_5510 ?auto_5520 ) ) ( not ( = ?auto_5514 ?auto_5528 ) ) ( not ( = ?auto_5514 ?auto_5530 ) ) ( not ( = ?auto_5514 ?auto_5524 ) ) ( not ( = ?auto_5514 ?auto_5519 ) ) ( not ( = ?auto_5514 ?auto_5531 ) ) ( not ( = ?auto_5513 ?auto_5529 ) ) ( not ( = ?auto_5513 ?auto_5526 ) ) ( not ( = ?auto_5513 ?auto_5521 ) ) ( not ( = ?auto_5513 ?auto_5523 ) ) ( not ( = ?auto_5513 ?auto_5517 ) ) ( not ( = ?auto_5511 ?auto_5518 ) ) ( not ( = ?auto_5511 ?auto_5527 ) ) ( not ( = ?auto_5511 ?auto_5525 ) ) ( not ( = ?auto_5511 ?auto_5532 ) ) ( not ( = ?auto_5511 ?auto_5522 ) ) ( not ( = ?auto_5511 ?auto_5520 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5509 ?auto_5508 )
      ( MAKE-1CRATE ?auto_5508 ?auto_5510 )
      ( MAKE-7CRATE-VERIFY ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5509 ?auto_5508 ?auto_5510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5535 - SURFACE
      ?auto_5536 - SURFACE
    )
    :vars
    (
      ?auto_5537 - HOIST
      ?auto_5538 - PLACE
      ?auto_5540 - PLACE
      ?auto_5541 - HOIST
      ?auto_5542 - SURFACE
      ?auto_5539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5537 ?auto_5538 ) ( SURFACE-AT ?auto_5535 ?auto_5538 ) ( CLEAR ?auto_5535 ) ( IS-CRATE ?auto_5536 ) ( AVAILABLE ?auto_5537 ) ( not ( = ?auto_5540 ?auto_5538 ) ) ( HOIST-AT ?auto_5541 ?auto_5540 ) ( AVAILABLE ?auto_5541 ) ( SURFACE-AT ?auto_5536 ?auto_5540 ) ( ON ?auto_5536 ?auto_5542 ) ( CLEAR ?auto_5536 ) ( TRUCK-AT ?auto_5539 ?auto_5538 ) ( not ( = ?auto_5535 ?auto_5536 ) ) ( not ( = ?auto_5535 ?auto_5542 ) ) ( not ( = ?auto_5536 ?auto_5542 ) ) ( not ( = ?auto_5537 ?auto_5541 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5539 ?auto_5538 ?auto_5540 )
      ( !LIFT ?auto_5541 ?auto_5536 ?auto_5542 ?auto_5540 )
      ( !LOAD ?auto_5541 ?auto_5536 ?auto_5539 ?auto_5540 )
      ( !DRIVE ?auto_5539 ?auto_5540 ?auto_5538 )
      ( !UNLOAD ?auto_5537 ?auto_5536 ?auto_5539 ?auto_5538 )
      ( !DROP ?auto_5537 ?auto_5536 ?auto_5535 ?auto_5538 )
      ( MAKE-1CRATE-VERIFY ?auto_5535 ?auto_5536 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5552 - SURFACE
      ?auto_5553 - SURFACE
      ?auto_5554 - SURFACE
      ?auto_5555 - SURFACE
      ?auto_5556 - SURFACE
      ?auto_5558 - SURFACE
      ?auto_5557 - SURFACE
      ?auto_5560 - SURFACE
      ?auto_5559 - SURFACE
    )
    :vars
    (
      ?auto_5565 - HOIST
      ?auto_5561 - PLACE
      ?auto_5563 - PLACE
      ?auto_5564 - HOIST
      ?auto_5562 - SURFACE
      ?auto_5576 - PLACE
      ?auto_5578 - HOIST
      ?auto_5569 - SURFACE
      ?auto_5570 - PLACE
      ?auto_5571 - HOIST
      ?auto_5577 - SURFACE
      ?auto_5579 - SURFACE
      ?auto_5572 - PLACE
      ?auto_5575 - HOIST
      ?auto_5580 - SURFACE
      ?auto_5567 - PLACE
      ?auto_5573 - HOIST
      ?auto_5581 - SURFACE
      ?auto_5574 - SURFACE
      ?auto_5583 - PLACE
      ?auto_5582 - HOIST
      ?auto_5568 - SURFACE
      ?auto_5566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5565 ?auto_5561 ) ( IS-CRATE ?auto_5559 ) ( not ( = ?auto_5563 ?auto_5561 ) ) ( HOIST-AT ?auto_5564 ?auto_5563 ) ( SURFACE-AT ?auto_5559 ?auto_5563 ) ( ON ?auto_5559 ?auto_5562 ) ( CLEAR ?auto_5559 ) ( not ( = ?auto_5560 ?auto_5559 ) ) ( not ( = ?auto_5560 ?auto_5562 ) ) ( not ( = ?auto_5559 ?auto_5562 ) ) ( not ( = ?auto_5565 ?auto_5564 ) ) ( IS-CRATE ?auto_5560 ) ( not ( = ?auto_5576 ?auto_5561 ) ) ( HOIST-AT ?auto_5578 ?auto_5576 ) ( AVAILABLE ?auto_5578 ) ( SURFACE-AT ?auto_5560 ?auto_5576 ) ( ON ?auto_5560 ?auto_5569 ) ( CLEAR ?auto_5560 ) ( not ( = ?auto_5557 ?auto_5560 ) ) ( not ( = ?auto_5557 ?auto_5569 ) ) ( not ( = ?auto_5560 ?auto_5569 ) ) ( not ( = ?auto_5565 ?auto_5578 ) ) ( IS-CRATE ?auto_5557 ) ( not ( = ?auto_5570 ?auto_5561 ) ) ( HOIST-AT ?auto_5571 ?auto_5570 ) ( AVAILABLE ?auto_5571 ) ( SURFACE-AT ?auto_5557 ?auto_5570 ) ( ON ?auto_5557 ?auto_5577 ) ( CLEAR ?auto_5557 ) ( not ( = ?auto_5558 ?auto_5557 ) ) ( not ( = ?auto_5558 ?auto_5577 ) ) ( not ( = ?auto_5557 ?auto_5577 ) ) ( not ( = ?auto_5565 ?auto_5571 ) ) ( IS-CRATE ?auto_5558 ) ( AVAILABLE ?auto_5564 ) ( SURFACE-AT ?auto_5558 ?auto_5563 ) ( ON ?auto_5558 ?auto_5579 ) ( CLEAR ?auto_5558 ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5556 ?auto_5579 ) ) ( not ( = ?auto_5558 ?auto_5579 ) ) ( IS-CRATE ?auto_5556 ) ( not ( = ?auto_5572 ?auto_5561 ) ) ( HOIST-AT ?auto_5575 ?auto_5572 ) ( AVAILABLE ?auto_5575 ) ( SURFACE-AT ?auto_5556 ?auto_5572 ) ( ON ?auto_5556 ?auto_5580 ) ( CLEAR ?auto_5556 ) ( not ( = ?auto_5555 ?auto_5556 ) ) ( not ( = ?auto_5555 ?auto_5580 ) ) ( not ( = ?auto_5556 ?auto_5580 ) ) ( not ( = ?auto_5565 ?auto_5575 ) ) ( IS-CRATE ?auto_5555 ) ( not ( = ?auto_5567 ?auto_5561 ) ) ( HOIST-AT ?auto_5573 ?auto_5567 ) ( SURFACE-AT ?auto_5555 ?auto_5567 ) ( ON ?auto_5555 ?auto_5581 ) ( CLEAR ?auto_5555 ) ( not ( = ?auto_5554 ?auto_5555 ) ) ( not ( = ?auto_5554 ?auto_5581 ) ) ( not ( = ?auto_5555 ?auto_5581 ) ) ( not ( = ?auto_5565 ?auto_5573 ) ) ( IS-CRATE ?auto_5554 ) ( AVAILABLE ?auto_5573 ) ( SURFACE-AT ?auto_5554 ?auto_5567 ) ( ON ?auto_5554 ?auto_5574 ) ( CLEAR ?auto_5554 ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( not ( = ?auto_5553 ?auto_5574 ) ) ( not ( = ?auto_5554 ?auto_5574 ) ) ( SURFACE-AT ?auto_5552 ?auto_5561 ) ( CLEAR ?auto_5552 ) ( IS-CRATE ?auto_5553 ) ( AVAILABLE ?auto_5565 ) ( not ( = ?auto_5583 ?auto_5561 ) ) ( HOIST-AT ?auto_5582 ?auto_5583 ) ( AVAILABLE ?auto_5582 ) ( SURFACE-AT ?auto_5553 ?auto_5583 ) ( ON ?auto_5553 ?auto_5568 ) ( CLEAR ?auto_5553 ) ( TRUCK-AT ?auto_5566 ?auto_5561 ) ( not ( = ?auto_5552 ?auto_5553 ) ) ( not ( = ?auto_5552 ?auto_5568 ) ) ( not ( = ?auto_5553 ?auto_5568 ) ) ( not ( = ?auto_5565 ?auto_5582 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5574 ) ) ( not ( = ?auto_5554 ?auto_5568 ) ) ( not ( = ?auto_5567 ?auto_5583 ) ) ( not ( = ?auto_5573 ?auto_5582 ) ) ( not ( = ?auto_5574 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5555 ) ) ( not ( = ?auto_5552 ?auto_5581 ) ) ( not ( = ?auto_5553 ?auto_5555 ) ) ( not ( = ?auto_5553 ?auto_5581 ) ) ( not ( = ?auto_5555 ?auto_5574 ) ) ( not ( = ?auto_5555 ?auto_5568 ) ) ( not ( = ?auto_5581 ?auto_5574 ) ) ( not ( = ?auto_5581 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5556 ) ) ( not ( = ?auto_5552 ?auto_5580 ) ) ( not ( = ?auto_5553 ?auto_5556 ) ) ( not ( = ?auto_5553 ?auto_5580 ) ) ( not ( = ?auto_5554 ?auto_5556 ) ) ( not ( = ?auto_5554 ?auto_5580 ) ) ( not ( = ?auto_5556 ?auto_5581 ) ) ( not ( = ?auto_5556 ?auto_5574 ) ) ( not ( = ?auto_5556 ?auto_5568 ) ) ( not ( = ?auto_5572 ?auto_5567 ) ) ( not ( = ?auto_5572 ?auto_5583 ) ) ( not ( = ?auto_5575 ?auto_5573 ) ) ( not ( = ?auto_5575 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5574 ) ) ( not ( = ?auto_5580 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5558 ) ) ( not ( = ?auto_5552 ?auto_5579 ) ) ( not ( = ?auto_5553 ?auto_5558 ) ) ( not ( = ?auto_5553 ?auto_5579 ) ) ( not ( = ?auto_5554 ?auto_5558 ) ) ( not ( = ?auto_5554 ?auto_5579 ) ) ( not ( = ?auto_5555 ?auto_5558 ) ) ( not ( = ?auto_5555 ?auto_5579 ) ) ( not ( = ?auto_5558 ?auto_5580 ) ) ( not ( = ?auto_5558 ?auto_5581 ) ) ( not ( = ?auto_5558 ?auto_5574 ) ) ( not ( = ?auto_5558 ?auto_5568 ) ) ( not ( = ?auto_5563 ?auto_5572 ) ) ( not ( = ?auto_5563 ?auto_5567 ) ) ( not ( = ?auto_5563 ?auto_5583 ) ) ( not ( = ?auto_5564 ?auto_5575 ) ) ( not ( = ?auto_5564 ?auto_5573 ) ) ( not ( = ?auto_5564 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5574 ) ) ( not ( = ?auto_5579 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5557 ) ) ( not ( = ?auto_5552 ?auto_5577 ) ) ( not ( = ?auto_5553 ?auto_5557 ) ) ( not ( = ?auto_5553 ?auto_5577 ) ) ( not ( = ?auto_5554 ?auto_5557 ) ) ( not ( = ?auto_5554 ?auto_5577 ) ) ( not ( = ?auto_5555 ?auto_5557 ) ) ( not ( = ?auto_5555 ?auto_5577 ) ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( not ( = ?auto_5556 ?auto_5577 ) ) ( not ( = ?auto_5557 ?auto_5579 ) ) ( not ( = ?auto_5557 ?auto_5580 ) ) ( not ( = ?auto_5557 ?auto_5581 ) ) ( not ( = ?auto_5557 ?auto_5574 ) ) ( not ( = ?auto_5557 ?auto_5568 ) ) ( not ( = ?auto_5570 ?auto_5563 ) ) ( not ( = ?auto_5570 ?auto_5572 ) ) ( not ( = ?auto_5570 ?auto_5567 ) ) ( not ( = ?auto_5570 ?auto_5583 ) ) ( not ( = ?auto_5571 ?auto_5564 ) ) ( not ( = ?auto_5571 ?auto_5575 ) ) ( not ( = ?auto_5571 ?auto_5573 ) ) ( not ( = ?auto_5571 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5574 ) ) ( not ( = ?auto_5577 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5560 ) ) ( not ( = ?auto_5552 ?auto_5569 ) ) ( not ( = ?auto_5553 ?auto_5560 ) ) ( not ( = ?auto_5553 ?auto_5569 ) ) ( not ( = ?auto_5554 ?auto_5560 ) ) ( not ( = ?auto_5554 ?auto_5569 ) ) ( not ( = ?auto_5555 ?auto_5560 ) ) ( not ( = ?auto_5555 ?auto_5569 ) ) ( not ( = ?auto_5556 ?auto_5560 ) ) ( not ( = ?auto_5556 ?auto_5569 ) ) ( not ( = ?auto_5558 ?auto_5560 ) ) ( not ( = ?auto_5558 ?auto_5569 ) ) ( not ( = ?auto_5560 ?auto_5577 ) ) ( not ( = ?auto_5560 ?auto_5579 ) ) ( not ( = ?auto_5560 ?auto_5580 ) ) ( not ( = ?auto_5560 ?auto_5581 ) ) ( not ( = ?auto_5560 ?auto_5574 ) ) ( not ( = ?auto_5560 ?auto_5568 ) ) ( not ( = ?auto_5576 ?auto_5570 ) ) ( not ( = ?auto_5576 ?auto_5563 ) ) ( not ( = ?auto_5576 ?auto_5572 ) ) ( not ( = ?auto_5576 ?auto_5567 ) ) ( not ( = ?auto_5576 ?auto_5583 ) ) ( not ( = ?auto_5578 ?auto_5571 ) ) ( not ( = ?auto_5578 ?auto_5564 ) ) ( not ( = ?auto_5578 ?auto_5575 ) ) ( not ( = ?auto_5578 ?auto_5573 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5569 ?auto_5577 ) ) ( not ( = ?auto_5569 ?auto_5579 ) ) ( not ( = ?auto_5569 ?auto_5580 ) ) ( not ( = ?auto_5569 ?auto_5581 ) ) ( not ( = ?auto_5569 ?auto_5574 ) ) ( not ( = ?auto_5569 ?auto_5568 ) ) ( not ( = ?auto_5552 ?auto_5559 ) ) ( not ( = ?auto_5552 ?auto_5562 ) ) ( not ( = ?auto_5553 ?auto_5559 ) ) ( not ( = ?auto_5553 ?auto_5562 ) ) ( not ( = ?auto_5554 ?auto_5559 ) ) ( not ( = ?auto_5554 ?auto_5562 ) ) ( not ( = ?auto_5555 ?auto_5559 ) ) ( not ( = ?auto_5555 ?auto_5562 ) ) ( not ( = ?auto_5556 ?auto_5559 ) ) ( not ( = ?auto_5556 ?auto_5562 ) ) ( not ( = ?auto_5558 ?auto_5559 ) ) ( not ( = ?auto_5558 ?auto_5562 ) ) ( not ( = ?auto_5557 ?auto_5559 ) ) ( not ( = ?auto_5557 ?auto_5562 ) ) ( not ( = ?auto_5559 ?auto_5569 ) ) ( not ( = ?auto_5559 ?auto_5577 ) ) ( not ( = ?auto_5559 ?auto_5579 ) ) ( not ( = ?auto_5559 ?auto_5580 ) ) ( not ( = ?auto_5559 ?auto_5581 ) ) ( not ( = ?auto_5559 ?auto_5574 ) ) ( not ( = ?auto_5559 ?auto_5568 ) ) ( not ( = ?auto_5562 ?auto_5569 ) ) ( not ( = ?auto_5562 ?auto_5577 ) ) ( not ( = ?auto_5562 ?auto_5579 ) ) ( not ( = ?auto_5562 ?auto_5580 ) ) ( not ( = ?auto_5562 ?auto_5581 ) ) ( not ( = ?auto_5562 ?auto_5574 ) ) ( not ( = ?auto_5562 ?auto_5568 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5552 ?auto_5553 ?auto_5554 ?auto_5555 ?auto_5556 ?auto_5558 ?auto_5557 ?auto_5560 )
      ( MAKE-1CRATE ?auto_5560 ?auto_5559 )
      ( MAKE-8CRATE-VERIFY ?auto_5552 ?auto_5553 ?auto_5554 ?auto_5555 ?auto_5556 ?auto_5558 ?auto_5557 ?auto_5560 ?auto_5559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5586 - SURFACE
      ?auto_5587 - SURFACE
    )
    :vars
    (
      ?auto_5588 - HOIST
      ?auto_5589 - PLACE
      ?auto_5591 - PLACE
      ?auto_5592 - HOIST
      ?auto_5593 - SURFACE
      ?auto_5590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5588 ?auto_5589 ) ( SURFACE-AT ?auto_5586 ?auto_5589 ) ( CLEAR ?auto_5586 ) ( IS-CRATE ?auto_5587 ) ( AVAILABLE ?auto_5588 ) ( not ( = ?auto_5591 ?auto_5589 ) ) ( HOIST-AT ?auto_5592 ?auto_5591 ) ( AVAILABLE ?auto_5592 ) ( SURFACE-AT ?auto_5587 ?auto_5591 ) ( ON ?auto_5587 ?auto_5593 ) ( CLEAR ?auto_5587 ) ( TRUCK-AT ?auto_5590 ?auto_5589 ) ( not ( = ?auto_5586 ?auto_5587 ) ) ( not ( = ?auto_5586 ?auto_5593 ) ) ( not ( = ?auto_5587 ?auto_5593 ) ) ( not ( = ?auto_5588 ?auto_5592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5590 ?auto_5589 ?auto_5591 )
      ( !LIFT ?auto_5592 ?auto_5587 ?auto_5593 ?auto_5591 )
      ( !LOAD ?auto_5592 ?auto_5587 ?auto_5590 ?auto_5591 )
      ( !DRIVE ?auto_5590 ?auto_5591 ?auto_5589 )
      ( !UNLOAD ?auto_5588 ?auto_5587 ?auto_5590 ?auto_5589 )
      ( !DROP ?auto_5588 ?auto_5587 ?auto_5586 ?auto_5589 )
      ( MAKE-1CRATE-VERIFY ?auto_5586 ?auto_5587 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5604 - SURFACE
      ?auto_5605 - SURFACE
      ?auto_5606 - SURFACE
      ?auto_5607 - SURFACE
      ?auto_5608 - SURFACE
      ?auto_5611 - SURFACE
      ?auto_5609 - SURFACE
      ?auto_5613 - SURFACE
      ?auto_5612 - SURFACE
      ?auto_5610 - SURFACE
    )
    :vars
    (
      ?auto_5614 - HOIST
      ?auto_5618 - PLACE
      ?auto_5615 - PLACE
      ?auto_5616 - HOIST
      ?auto_5617 - SURFACE
      ?auto_5623 - PLACE
      ?auto_5622 - HOIST
      ?auto_5636 - SURFACE
      ?auto_5629 - PLACE
      ?auto_5630 - HOIST
      ?auto_5625 - SURFACE
      ?auto_5637 - PLACE
      ?auto_5635 - HOIST
      ?auto_5628 - SURFACE
      ?auto_5631 - SURFACE
      ?auto_5632 - SURFACE
      ?auto_5621 - PLACE
      ?auto_5634 - HOIST
      ?auto_5620 - SURFACE
      ?auto_5633 - SURFACE
      ?auto_5626 - PLACE
      ?auto_5627 - HOIST
      ?auto_5624 - SURFACE
      ?auto_5619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5614 ?auto_5618 ) ( IS-CRATE ?auto_5610 ) ( not ( = ?auto_5615 ?auto_5618 ) ) ( HOIST-AT ?auto_5616 ?auto_5615 ) ( SURFACE-AT ?auto_5610 ?auto_5615 ) ( ON ?auto_5610 ?auto_5617 ) ( CLEAR ?auto_5610 ) ( not ( = ?auto_5612 ?auto_5610 ) ) ( not ( = ?auto_5612 ?auto_5617 ) ) ( not ( = ?auto_5610 ?auto_5617 ) ) ( not ( = ?auto_5614 ?auto_5616 ) ) ( IS-CRATE ?auto_5612 ) ( not ( = ?auto_5623 ?auto_5618 ) ) ( HOIST-AT ?auto_5622 ?auto_5623 ) ( SURFACE-AT ?auto_5612 ?auto_5623 ) ( ON ?auto_5612 ?auto_5636 ) ( CLEAR ?auto_5612 ) ( not ( = ?auto_5613 ?auto_5612 ) ) ( not ( = ?auto_5613 ?auto_5636 ) ) ( not ( = ?auto_5612 ?auto_5636 ) ) ( not ( = ?auto_5614 ?auto_5622 ) ) ( IS-CRATE ?auto_5613 ) ( not ( = ?auto_5629 ?auto_5618 ) ) ( HOIST-AT ?auto_5630 ?auto_5629 ) ( AVAILABLE ?auto_5630 ) ( SURFACE-AT ?auto_5613 ?auto_5629 ) ( ON ?auto_5613 ?auto_5625 ) ( CLEAR ?auto_5613 ) ( not ( = ?auto_5609 ?auto_5613 ) ) ( not ( = ?auto_5609 ?auto_5625 ) ) ( not ( = ?auto_5613 ?auto_5625 ) ) ( not ( = ?auto_5614 ?auto_5630 ) ) ( IS-CRATE ?auto_5609 ) ( not ( = ?auto_5637 ?auto_5618 ) ) ( HOIST-AT ?auto_5635 ?auto_5637 ) ( AVAILABLE ?auto_5635 ) ( SURFACE-AT ?auto_5609 ?auto_5637 ) ( ON ?auto_5609 ?auto_5628 ) ( CLEAR ?auto_5609 ) ( not ( = ?auto_5611 ?auto_5609 ) ) ( not ( = ?auto_5611 ?auto_5628 ) ) ( not ( = ?auto_5609 ?auto_5628 ) ) ( not ( = ?auto_5614 ?auto_5635 ) ) ( IS-CRATE ?auto_5611 ) ( AVAILABLE ?auto_5622 ) ( SURFACE-AT ?auto_5611 ?auto_5623 ) ( ON ?auto_5611 ?auto_5631 ) ( CLEAR ?auto_5611 ) ( not ( = ?auto_5608 ?auto_5611 ) ) ( not ( = ?auto_5608 ?auto_5631 ) ) ( not ( = ?auto_5611 ?auto_5631 ) ) ( IS-CRATE ?auto_5608 ) ( AVAILABLE ?auto_5616 ) ( SURFACE-AT ?auto_5608 ?auto_5615 ) ( ON ?auto_5608 ?auto_5632 ) ( CLEAR ?auto_5608 ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( not ( = ?auto_5607 ?auto_5632 ) ) ( not ( = ?auto_5608 ?auto_5632 ) ) ( IS-CRATE ?auto_5607 ) ( not ( = ?auto_5621 ?auto_5618 ) ) ( HOIST-AT ?auto_5634 ?auto_5621 ) ( SURFACE-AT ?auto_5607 ?auto_5621 ) ( ON ?auto_5607 ?auto_5620 ) ( CLEAR ?auto_5607 ) ( not ( = ?auto_5606 ?auto_5607 ) ) ( not ( = ?auto_5606 ?auto_5620 ) ) ( not ( = ?auto_5607 ?auto_5620 ) ) ( not ( = ?auto_5614 ?auto_5634 ) ) ( IS-CRATE ?auto_5606 ) ( AVAILABLE ?auto_5634 ) ( SURFACE-AT ?auto_5606 ?auto_5621 ) ( ON ?auto_5606 ?auto_5633 ) ( CLEAR ?auto_5606 ) ( not ( = ?auto_5605 ?auto_5606 ) ) ( not ( = ?auto_5605 ?auto_5633 ) ) ( not ( = ?auto_5606 ?auto_5633 ) ) ( SURFACE-AT ?auto_5604 ?auto_5618 ) ( CLEAR ?auto_5604 ) ( IS-CRATE ?auto_5605 ) ( AVAILABLE ?auto_5614 ) ( not ( = ?auto_5626 ?auto_5618 ) ) ( HOIST-AT ?auto_5627 ?auto_5626 ) ( AVAILABLE ?auto_5627 ) ( SURFACE-AT ?auto_5605 ?auto_5626 ) ( ON ?auto_5605 ?auto_5624 ) ( CLEAR ?auto_5605 ) ( TRUCK-AT ?auto_5619 ?auto_5618 ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5604 ?auto_5624 ) ) ( not ( = ?auto_5605 ?auto_5624 ) ) ( not ( = ?auto_5614 ?auto_5627 ) ) ( not ( = ?auto_5604 ?auto_5606 ) ) ( not ( = ?auto_5604 ?auto_5633 ) ) ( not ( = ?auto_5606 ?auto_5624 ) ) ( not ( = ?auto_5621 ?auto_5626 ) ) ( not ( = ?auto_5634 ?auto_5627 ) ) ( not ( = ?auto_5633 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5607 ) ) ( not ( = ?auto_5604 ?auto_5620 ) ) ( not ( = ?auto_5605 ?auto_5607 ) ) ( not ( = ?auto_5605 ?auto_5620 ) ) ( not ( = ?auto_5607 ?auto_5633 ) ) ( not ( = ?auto_5607 ?auto_5624 ) ) ( not ( = ?auto_5620 ?auto_5633 ) ) ( not ( = ?auto_5620 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5608 ) ) ( not ( = ?auto_5604 ?auto_5632 ) ) ( not ( = ?auto_5605 ?auto_5608 ) ) ( not ( = ?auto_5605 ?auto_5632 ) ) ( not ( = ?auto_5606 ?auto_5608 ) ) ( not ( = ?auto_5606 ?auto_5632 ) ) ( not ( = ?auto_5608 ?auto_5620 ) ) ( not ( = ?auto_5608 ?auto_5633 ) ) ( not ( = ?auto_5608 ?auto_5624 ) ) ( not ( = ?auto_5615 ?auto_5621 ) ) ( not ( = ?auto_5615 ?auto_5626 ) ) ( not ( = ?auto_5616 ?auto_5634 ) ) ( not ( = ?auto_5616 ?auto_5627 ) ) ( not ( = ?auto_5632 ?auto_5620 ) ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5611 ) ) ( not ( = ?auto_5604 ?auto_5631 ) ) ( not ( = ?auto_5605 ?auto_5611 ) ) ( not ( = ?auto_5605 ?auto_5631 ) ) ( not ( = ?auto_5606 ?auto_5611 ) ) ( not ( = ?auto_5606 ?auto_5631 ) ) ( not ( = ?auto_5607 ?auto_5611 ) ) ( not ( = ?auto_5607 ?auto_5631 ) ) ( not ( = ?auto_5611 ?auto_5632 ) ) ( not ( = ?auto_5611 ?auto_5620 ) ) ( not ( = ?auto_5611 ?auto_5633 ) ) ( not ( = ?auto_5611 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5615 ) ) ( not ( = ?auto_5623 ?auto_5621 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( not ( = ?auto_5622 ?auto_5616 ) ) ( not ( = ?auto_5622 ?auto_5634 ) ) ( not ( = ?auto_5622 ?auto_5627 ) ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5620 ) ) ( not ( = ?auto_5631 ?auto_5633 ) ) ( not ( = ?auto_5631 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5609 ) ) ( not ( = ?auto_5604 ?auto_5628 ) ) ( not ( = ?auto_5605 ?auto_5609 ) ) ( not ( = ?auto_5605 ?auto_5628 ) ) ( not ( = ?auto_5606 ?auto_5609 ) ) ( not ( = ?auto_5606 ?auto_5628 ) ) ( not ( = ?auto_5607 ?auto_5609 ) ) ( not ( = ?auto_5607 ?auto_5628 ) ) ( not ( = ?auto_5608 ?auto_5609 ) ) ( not ( = ?auto_5608 ?auto_5628 ) ) ( not ( = ?auto_5609 ?auto_5631 ) ) ( not ( = ?auto_5609 ?auto_5632 ) ) ( not ( = ?auto_5609 ?auto_5620 ) ) ( not ( = ?auto_5609 ?auto_5633 ) ) ( not ( = ?auto_5609 ?auto_5624 ) ) ( not ( = ?auto_5637 ?auto_5623 ) ) ( not ( = ?auto_5637 ?auto_5615 ) ) ( not ( = ?auto_5637 ?auto_5621 ) ) ( not ( = ?auto_5637 ?auto_5626 ) ) ( not ( = ?auto_5635 ?auto_5622 ) ) ( not ( = ?auto_5635 ?auto_5616 ) ) ( not ( = ?auto_5635 ?auto_5634 ) ) ( not ( = ?auto_5635 ?auto_5627 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( not ( = ?auto_5628 ?auto_5620 ) ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( not ( = ?auto_5628 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5613 ) ) ( not ( = ?auto_5604 ?auto_5625 ) ) ( not ( = ?auto_5605 ?auto_5613 ) ) ( not ( = ?auto_5605 ?auto_5625 ) ) ( not ( = ?auto_5606 ?auto_5613 ) ) ( not ( = ?auto_5606 ?auto_5625 ) ) ( not ( = ?auto_5607 ?auto_5613 ) ) ( not ( = ?auto_5607 ?auto_5625 ) ) ( not ( = ?auto_5608 ?auto_5613 ) ) ( not ( = ?auto_5608 ?auto_5625 ) ) ( not ( = ?auto_5611 ?auto_5613 ) ) ( not ( = ?auto_5611 ?auto_5625 ) ) ( not ( = ?auto_5613 ?auto_5628 ) ) ( not ( = ?auto_5613 ?auto_5631 ) ) ( not ( = ?auto_5613 ?auto_5632 ) ) ( not ( = ?auto_5613 ?auto_5620 ) ) ( not ( = ?auto_5613 ?auto_5633 ) ) ( not ( = ?auto_5613 ?auto_5624 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5623 ) ) ( not ( = ?auto_5629 ?auto_5615 ) ) ( not ( = ?auto_5629 ?auto_5621 ) ) ( not ( = ?auto_5629 ?auto_5626 ) ) ( not ( = ?auto_5630 ?auto_5635 ) ) ( not ( = ?auto_5630 ?auto_5622 ) ) ( not ( = ?auto_5630 ?auto_5616 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5630 ?auto_5627 ) ) ( not ( = ?auto_5625 ?auto_5628 ) ) ( not ( = ?auto_5625 ?auto_5631 ) ) ( not ( = ?auto_5625 ?auto_5632 ) ) ( not ( = ?auto_5625 ?auto_5620 ) ) ( not ( = ?auto_5625 ?auto_5633 ) ) ( not ( = ?auto_5625 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5612 ) ) ( not ( = ?auto_5604 ?auto_5636 ) ) ( not ( = ?auto_5605 ?auto_5612 ) ) ( not ( = ?auto_5605 ?auto_5636 ) ) ( not ( = ?auto_5606 ?auto_5612 ) ) ( not ( = ?auto_5606 ?auto_5636 ) ) ( not ( = ?auto_5607 ?auto_5612 ) ) ( not ( = ?auto_5607 ?auto_5636 ) ) ( not ( = ?auto_5608 ?auto_5612 ) ) ( not ( = ?auto_5608 ?auto_5636 ) ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5611 ?auto_5636 ) ) ( not ( = ?auto_5609 ?auto_5612 ) ) ( not ( = ?auto_5609 ?auto_5636 ) ) ( not ( = ?auto_5612 ?auto_5625 ) ) ( not ( = ?auto_5612 ?auto_5628 ) ) ( not ( = ?auto_5612 ?auto_5631 ) ) ( not ( = ?auto_5612 ?auto_5632 ) ) ( not ( = ?auto_5612 ?auto_5620 ) ) ( not ( = ?auto_5612 ?auto_5633 ) ) ( not ( = ?auto_5612 ?auto_5624 ) ) ( not ( = ?auto_5636 ?auto_5625 ) ) ( not ( = ?auto_5636 ?auto_5628 ) ) ( not ( = ?auto_5636 ?auto_5631 ) ) ( not ( = ?auto_5636 ?auto_5632 ) ) ( not ( = ?auto_5636 ?auto_5620 ) ) ( not ( = ?auto_5636 ?auto_5633 ) ) ( not ( = ?auto_5636 ?auto_5624 ) ) ( not ( = ?auto_5604 ?auto_5610 ) ) ( not ( = ?auto_5604 ?auto_5617 ) ) ( not ( = ?auto_5605 ?auto_5610 ) ) ( not ( = ?auto_5605 ?auto_5617 ) ) ( not ( = ?auto_5606 ?auto_5610 ) ) ( not ( = ?auto_5606 ?auto_5617 ) ) ( not ( = ?auto_5607 ?auto_5610 ) ) ( not ( = ?auto_5607 ?auto_5617 ) ) ( not ( = ?auto_5608 ?auto_5610 ) ) ( not ( = ?auto_5608 ?auto_5617 ) ) ( not ( = ?auto_5611 ?auto_5610 ) ) ( not ( = ?auto_5611 ?auto_5617 ) ) ( not ( = ?auto_5609 ?auto_5610 ) ) ( not ( = ?auto_5609 ?auto_5617 ) ) ( not ( = ?auto_5613 ?auto_5610 ) ) ( not ( = ?auto_5613 ?auto_5617 ) ) ( not ( = ?auto_5610 ?auto_5636 ) ) ( not ( = ?auto_5610 ?auto_5625 ) ) ( not ( = ?auto_5610 ?auto_5628 ) ) ( not ( = ?auto_5610 ?auto_5631 ) ) ( not ( = ?auto_5610 ?auto_5632 ) ) ( not ( = ?auto_5610 ?auto_5620 ) ) ( not ( = ?auto_5610 ?auto_5633 ) ) ( not ( = ?auto_5610 ?auto_5624 ) ) ( not ( = ?auto_5617 ?auto_5636 ) ) ( not ( = ?auto_5617 ?auto_5625 ) ) ( not ( = ?auto_5617 ?auto_5628 ) ) ( not ( = ?auto_5617 ?auto_5631 ) ) ( not ( = ?auto_5617 ?auto_5632 ) ) ( not ( = ?auto_5617 ?auto_5620 ) ) ( not ( = ?auto_5617 ?auto_5633 ) ) ( not ( = ?auto_5617 ?auto_5624 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5604 ?auto_5605 ?auto_5606 ?auto_5607 ?auto_5608 ?auto_5611 ?auto_5609 ?auto_5613 ?auto_5612 )
      ( MAKE-1CRATE ?auto_5612 ?auto_5610 )
      ( MAKE-9CRATE-VERIFY ?auto_5604 ?auto_5605 ?auto_5606 ?auto_5607 ?auto_5608 ?auto_5611 ?auto_5609 ?auto_5613 ?auto_5612 ?auto_5610 ) )
  )

)

