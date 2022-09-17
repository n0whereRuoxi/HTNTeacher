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
      ?auto_6270 - SURFACE
      ?auto_6271 - SURFACE
    )
    :vars
    (
      ?auto_6272 - HOIST
      ?auto_6273 - PLACE
      ?auto_6275 - PLACE
      ?auto_6276 - HOIST
      ?auto_6277 - SURFACE
      ?auto_6274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6272 ?auto_6273 ) ( SURFACE-AT ?auto_6270 ?auto_6273 ) ( CLEAR ?auto_6270 ) ( IS-CRATE ?auto_6271 ) ( AVAILABLE ?auto_6272 ) ( not ( = ?auto_6275 ?auto_6273 ) ) ( HOIST-AT ?auto_6276 ?auto_6275 ) ( AVAILABLE ?auto_6276 ) ( SURFACE-AT ?auto_6271 ?auto_6275 ) ( ON ?auto_6271 ?auto_6277 ) ( CLEAR ?auto_6271 ) ( TRUCK-AT ?auto_6274 ?auto_6273 ) ( not ( = ?auto_6270 ?auto_6271 ) ) ( not ( = ?auto_6270 ?auto_6277 ) ) ( not ( = ?auto_6271 ?auto_6277 ) ) ( not ( = ?auto_6272 ?auto_6276 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6274 ?auto_6273 ?auto_6275 )
      ( !LIFT ?auto_6276 ?auto_6271 ?auto_6277 ?auto_6275 )
      ( !LOAD ?auto_6276 ?auto_6271 ?auto_6274 ?auto_6275 )
      ( !DRIVE ?auto_6274 ?auto_6275 ?auto_6273 )
      ( !UNLOAD ?auto_6272 ?auto_6271 ?auto_6274 ?auto_6273 )
      ( !DROP ?auto_6272 ?auto_6271 ?auto_6270 ?auto_6273 )
      ( MAKE-1CRATE-VERIFY ?auto_6270 ?auto_6271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6291 - SURFACE
      ?auto_6292 - SURFACE
      ?auto_6293 - SURFACE
    )
    :vars
    (
      ?auto_6296 - HOIST
      ?auto_6299 - PLACE
      ?auto_6295 - PLACE
      ?auto_6294 - HOIST
      ?auto_6298 - SURFACE
      ?auto_6300 - SURFACE
      ?auto_6297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6296 ?auto_6299 ) ( IS-CRATE ?auto_6293 ) ( not ( = ?auto_6295 ?auto_6299 ) ) ( HOIST-AT ?auto_6294 ?auto_6295 ) ( SURFACE-AT ?auto_6293 ?auto_6295 ) ( ON ?auto_6293 ?auto_6298 ) ( CLEAR ?auto_6293 ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6298 ) ) ( not ( = ?auto_6293 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6294 ) ) ( SURFACE-AT ?auto_6291 ?auto_6299 ) ( CLEAR ?auto_6291 ) ( IS-CRATE ?auto_6292 ) ( AVAILABLE ?auto_6296 ) ( AVAILABLE ?auto_6294 ) ( SURFACE-AT ?auto_6292 ?auto_6295 ) ( ON ?auto_6292 ?auto_6300 ) ( CLEAR ?auto_6292 ) ( TRUCK-AT ?auto_6297 ?auto_6299 ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6300 ) ) ( not ( = ?auto_6292 ?auto_6300 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6298 ) ) ( not ( = ?auto_6293 ?auto_6300 ) ) ( not ( = ?auto_6298 ?auto_6300 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6291 ?auto_6292 )
      ( MAKE-1CRATE ?auto_6292 ?auto_6293 )
      ( MAKE-2CRATE-VERIFY ?auto_6291 ?auto_6292 ?auto_6293 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6315 - SURFACE
      ?auto_6316 - SURFACE
      ?auto_6317 - SURFACE
      ?auto_6318 - SURFACE
    )
    :vars
    (
      ?auto_6323 - HOIST
      ?auto_6321 - PLACE
      ?auto_6319 - PLACE
      ?auto_6320 - HOIST
      ?auto_6324 - SURFACE
      ?auto_6326 - PLACE
      ?auto_6327 - HOIST
      ?auto_6325 - SURFACE
      ?auto_6328 - SURFACE
      ?auto_6322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6323 ?auto_6321 ) ( IS-CRATE ?auto_6318 ) ( not ( = ?auto_6319 ?auto_6321 ) ) ( HOIST-AT ?auto_6320 ?auto_6319 ) ( AVAILABLE ?auto_6320 ) ( SURFACE-AT ?auto_6318 ?auto_6319 ) ( ON ?auto_6318 ?auto_6324 ) ( CLEAR ?auto_6318 ) ( not ( = ?auto_6317 ?auto_6318 ) ) ( not ( = ?auto_6317 ?auto_6324 ) ) ( not ( = ?auto_6318 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6320 ) ) ( IS-CRATE ?auto_6317 ) ( not ( = ?auto_6326 ?auto_6321 ) ) ( HOIST-AT ?auto_6327 ?auto_6326 ) ( SURFACE-AT ?auto_6317 ?auto_6326 ) ( ON ?auto_6317 ?auto_6325 ) ( CLEAR ?auto_6317 ) ( not ( = ?auto_6316 ?auto_6317 ) ) ( not ( = ?auto_6316 ?auto_6325 ) ) ( not ( = ?auto_6317 ?auto_6325 ) ) ( not ( = ?auto_6323 ?auto_6327 ) ) ( SURFACE-AT ?auto_6315 ?auto_6321 ) ( CLEAR ?auto_6315 ) ( IS-CRATE ?auto_6316 ) ( AVAILABLE ?auto_6323 ) ( AVAILABLE ?auto_6327 ) ( SURFACE-AT ?auto_6316 ?auto_6326 ) ( ON ?auto_6316 ?auto_6328 ) ( CLEAR ?auto_6316 ) ( TRUCK-AT ?auto_6322 ?auto_6321 ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6328 ) ) ( not ( = ?auto_6316 ?auto_6328 ) ) ( not ( = ?auto_6315 ?auto_6317 ) ) ( not ( = ?auto_6315 ?auto_6325 ) ) ( not ( = ?auto_6317 ?auto_6328 ) ) ( not ( = ?auto_6325 ?auto_6328 ) ) ( not ( = ?auto_6315 ?auto_6318 ) ) ( not ( = ?auto_6315 ?auto_6324 ) ) ( not ( = ?auto_6316 ?auto_6318 ) ) ( not ( = ?auto_6316 ?auto_6324 ) ) ( not ( = ?auto_6318 ?auto_6325 ) ) ( not ( = ?auto_6318 ?auto_6328 ) ) ( not ( = ?auto_6319 ?auto_6326 ) ) ( not ( = ?auto_6320 ?auto_6327 ) ) ( not ( = ?auto_6324 ?auto_6325 ) ) ( not ( = ?auto_6324 ?auto_6328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6315 ?auto_6316 ?auto_6317 )
      ( MAKE-1CRATE ?auto_6317 ?auto_6318 )
      ( MAKE-3CRATE-VERIFY ?auto_6315 ?auto_6316 ?auto_6317 ?auto_6318 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6344 - SURFACE
      ?auto_6345 - SURFACE
      ?auto_6346 - SURFACE
      ?auto_6347 - SURFACE
      ?auto_6348 - SURFACE
    )
    :vars
    (
      ?auto_6349 - HOIST
      ?auto_6352 - PLACE
      ?auto_6353 - PLACE
      ?auto_6354 - HOIST
      ?auto_6350 - SURFACE
      ?auto_6358 - PLACE
      ?auto_6357 - HOIST
      ?auto_6359 - SURFACE
      ?auto_6356 - PLACE
      ?auto_6361 - HOIST
      ?auto_6355 - SURFACE
      ?auto_6360 - SURFACE
      ?auto_6351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6349 ?auto_6352 ) ( IS-CRATE ?auto_6348 ) ( not ( = ?auto_6353 ?auto_6352 ) ) ( HOIST-AT ?auto_6354 ?auto_6353 ) ( AVAILABLE ?auto_6354 ) ( SURFACE-AT ?auto_6348 ?auto_6353 ) ( ON ?auto_6348 ?auto_6350 ) ( CLEAR ?auto_6348 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6354 ) ) ( IS-CRATE ?auto_6347 ) ( not ( = ?auto_6358 ?auto_6352 ) ) ( HOIST-AT ?auto_6357 ?auto_6358 ) ( AVAILABLE ?auto_6357 ) ( SURFACE-AT ?auto_6347 ?auto_6358 ) ( ON ?auto_6347 ?auto_6359 ) ( CLEAR ?auto_6347 ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6359 ) ) ( not ( = ?auto_6347 ?auto_6359 ) ) ( not ( = ?auto_6349 ?auto_6357 ) ) ( IS-CRATE ?auto_6346 ) ( not ( = ?auto_6356 ?auto_6352 ) ) ( HOIST-AT ?auto_6361 ?auto_6356 ) ( SURFACE-AT ?auto_6346 ?auto_6356 ) ( ON ?auto_6346 ?auto_6355 ) ( CLEAR ?auto_6346 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6355 ) ) ( not ( = ?auto_6346 ?auto_6355 ) ) ( not ( = ?auto_6349 ?auto_6361 ) ) ( SURFACE-AT ?auto_6344 ?auto_6352 ) ( CLEAR ?auto_6344 ) ( IS-CRATE ?auto_6345 ) ( AVAILABLE ?auto_6349 ) ( AVAILABLE ?auto_6361 ) ( SURFACE-AT ?auto_6345 ?auto_6356 ) ( ON ?auto_6345 ?auto_6360 ) ( CLEAR ?auto_6345 ) ( TRUCK-AT ?auto_6351 ?auto_6352 ) ( not ( = ?auto_6344 ?auto_6345 ) ) ( not ( = ?auto_6344 ?auto_6360 ) ) ( not ( = ?auto_6345 ?auto_6360 ) ) ( not ( = ?auto_6344 ?auto_6346 ) ) ( not ( = ?auto_6344 ?auto_6355 ) ) ( not ( = ?auto_6346 ?auto_6360 ) ) ( not ( = ?auto_6355 ?auto_6360 ) ) ( not ( = ?auto_6344 ?auto_6347 ) ) ( not ( = ?auto_6344 ?auto_6359 ) ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6345 ?auto_6359 ) ) ( not ( = ?auto_6347 ?auto_6355 ) ) ( not ( = ?auto_6347 ?auto_6360 ) ) ( not ( = ?auto_6358 ?auto_6356 ) ) ( not ( = ?auto_6357 ?auto_6361 ) ) ( not ( = ?auto_6359 ?auto_6355 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6344 ?auto_6348 ) ) ( not ( = ?auto_6344 ?auto_6350 ) ) ( not ( = ?auto_6345 ?auto_6348 ) ) ( not ( = ?auto_6345 ?auto_6350 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6359 ) ) ( not ( = ?auto_6348 ?auto_6355 ) ) ( not ( = ?auto_6348 ?auto_6360 ) ) ( not ( = ?auto_6353 ?auto_6358 ) ) ( not ( = ?auto_6353 ?auto_6356 ) ) ( not ( = ?auto_6354 ?auto_6357 ) ) ( not ( = ?auto_6354 ?auto_6361 ) ) ( not ( = ?auto_6350 ?auto_6359 ) ) ( not ( = ?auto_6350 ?auto_6355 ) ) ( not ( = ?auto_6350 ?auto_6360 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6344 ?auto_6345 ?auto_6346 ?auto_6347 )
      ( MAKE-1CRATE ?auto_6347 ?auto_6348 )
      ( MAKE-4CRATE-VERIFY ?auto_6344 ?auto_6345 ?auto_6346 ?auto_6347 ?auto_6348 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6378 - SURFACE
      ?auto_6379 - SURFACE
      ?auto_6380 - SURFACE
      ?auto_6381 - SURFACE
      ?auto_6382 - SURFACE
      ?auto_6383 - SURFACE
    )
    :vars
    (
      ?auto_6384 - HOIST
      ?auto_6385 - PLACE
      ?auto_6389 - PLACE
      ?auto_6387 - HOIST
      ?auto_6386 - SURFACE
      ?auto_6398 - PLACE
      ?auto_6399 - HOIST
      ?auto_6397 - SURFACE
      ?auto_6394 - PLACE
      ?auto_6390 - HOIST
      ?auto_6395 - SURFACE
      ?auto_6393 - PLACE
      ?auto_6392 - HOIST
      ?auto_6391 - SURFACE
      ?auto_6396 - SURFACE
      ?auto_6388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6384 ?auto_6385 ) ( IS-CRATE ?auto_6383 ) ( not ( = ?auto_6389 ?auto_6385 ) ) ( HOIST-AT ?auto_6387 ?auto_6389 ) ( AVAILABLE ?auto_6387 ) ( SURFACE-AT ?auto_6383 ?auto_6389 ) ( ON ?auto_6383 ?auto_6386 ) ( CLEAR ?auto_6383 ) ( not ( = ?auto_6382 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( not ( = ?auto_6384 ?auto_6387 ) ) ( IS-CRATE ?auto_6382 ) ( not ( = ?auto_6398 ?auto_6385 ) ) ( HOIST-AT ?auto_6399 ?auto_6398 ) ( AVAILABLE ?auto_6399 ) ( SURFACE-AT ?auto_6382 ?auto_6398 ) ( ON ?auto_6382 ?auto_6397 ) ( CLEAR ?auto_6382 ) ( not ( = ?auto_6381 ?auto_6382 ) ) ( not ( = ?auto_6381 ?auto_6397 ) ) ( not ( = ?auto_6382 ?auto_6397 ) ) ( not ( = ?auto_6384 ?auto_6399 ) ) ( IS-CRATE ?auto_6381 ) ( not ( = ?auto_6394 ?auto_6385 ) ) ( HOIST-AT ?auto_6390 ?auto_6394 ) ( AVAILABLE ?auto_6390 ) ( SURFACE-AT ?auto_6381 ?auto_6394 ) ( ON ?auto_6381 ?auto_6395 ) ( CLEAR ?auto_6381 ) ( not ( = ?auto_6380 ?auto_6381 ) ) ( not ( = ?auto_6380 ?auto_6395 ) ) ( not ( = ?auto_6381 ?auto_6395 ) ) ( not ( = ?auto_6384 ?auto_6390 ) ) ( IS-CRATE ?auto_6380 ) ( not ( = ?auto_6393 ?auto_6385 ) ) ( HOIST-AT ?auto_6392 ?auto_6393 ) ( SURFACE-AT ?auto_6380 ?auto_6393 ) ( ON ?auto_6380 ?auto_6391 ) ( CLEAR ?auto_6380 ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( not ( = ?auto_6379 ?auto_6391 ) ) ( not ( = ?auto_6380 ?auto_6391 ) ) ( not ( = ?auto_6384 ?auto_6392 ) ) ( SURFACE-AT ?auto_6378 ?auto_6385 ) ( CLEAR ?auto_6378 ) ( IS-CRATE ?auto_6379 ) ( AVAILABLE ?auto_6384 ) ( AVAILABLE ?auto_6392 ) ( SURFACE-AT ?auto_6379 ?auto_6393 ) ( ON ?auto_6379 ?auto_6396 ) ( CLEAR ?auto_6379 ) ( TRUCK-AT ?auto_6388 ?auto_6385 ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6378 ?auto_6396 ) ) ( not ( = ?auto_6379 ?auto_6396 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6391 ) ) ( not ( = ?auto_6380 ?auto_6396 ) ) ( not ( = ?auto_6391 ?auto_6396 ) ) ( not ( = ?auto_6378 ?auto_6381 ) ) ( not ( = ?auto_6378 ?auto_6395 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6395 ) ) ( not ( = ?auto_6381 ?auto_6391 ) ) ( not ( = ?auto_6381 ?auto_6396 ) ) ( not ( = ?auto_6394 ?auto_6393 ) ) ( not ( = ?auto_6390 ?auto_6392 ) ) ( not ( = ?auto_6395 ?auto_6391 ) ) ( not ( = ?auto_6395 ?auto_6396 ) ) ( not ( = ?auto_6378 ?auto_6382 ) ) ( not ( = ?auto_6378 ?auto_6397 ) ) ( not ( = ?auto_6379 ?auto_6382 ) ) ( not ( = ?auto_6379 ?auto_6397 ) ) ( not ( = ?auto_6380 ?auto_6382 ) ) ( not ( = ?auto_6380 ?auto_6397 ) ) ( not ( = ?auto_6382 ?auto_6395 ) ) ( not ( = ?auto_6382 ?auto_6391 ) ) ( not ( = ?auto_6382 ?auto_6396 ) ) ( not ( = ?auto_6398 ?auto_6394 ) ) ( not ( = ?auto_6398 ?auto_6393 ) ) ( not ( = ?auto_6399 ?auto_6390 ) ) ( not ( = ?auto_6399 ?auto_6392 ) ) ( not ( = ?auto_6397 ?auto_6395 ) ) ( not ( = ?auto_6397 ?auto_6391 ) ) ( not ( = ?auto_6397 ?auto_6396 ) ) ( not ( = ?auto_6378 ?auto_6383 ) ) ( not ( = ?auto_6378 ?auto_6386 ) ) ( not ( = ?auto_6379 ?auto_6383 ) ) ( not ( = ?auto_6379 ?auto_6386 ) ) ( not ( = ?auto_6380 ?auto_6383 ) ) ( not ( = ?auto_6380 ?auto_6386 ) ) ( not ( = ?auto_6381 ?auto_6383 ) ) ( not ( = ?auto_6381 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6397 ) ) ( not ( = ?auto_6383 ?auto_6395 ) ) ( not ( = ?auto_6383 ?auto_6391 ) ) ( not ( = ?auto_6383 ?auto_6396 ) ) ( not ( = ?auto_6389 ?auto_6398 ) ) ( not ( = ?auto_6389 ?auto_6394 ) ) ( not ( = ?auto_6389 ?auto_6393 ) ) ( not ( = ?auto_6387 ?auto_6399 ) ) ( not ( = ?auto_6387 ?auto_6390 ) ) ( not ( = ?auto_6387 ?auto_6392 ) ) ( not ( = ?auto_6386 ?auto_6397 ) ) ( not ( = ?auto_6386 ?auto_6395 ) ) ( not ( = ?auto_6386 ?auto_6391 ) ) ( not ( = ?auto_6386 ?auto_6396 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6378 ?auto_6379 ?auto_6380 ?auto_6381 ?auto_6382 )
      ( MAKE-1CRATE ?auto_6382 ?auto_6383 )
      ( MAKE-5CRATE-VERIFY ?auto_6378 ?auto_6379 ?auto_6380 ?auto_6381 ?auto_6382 ?auto_6383 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6417 - SURFACE
      ?auto_6418 - SURFACE
      ?auto_6419 - SURFACE
      ?auto_6420 - SURFACE
      ?auto_6421 - SURFACE
      ?auto_6422 - SURFACE
      ?auto_6423 - SURFACE
    )
    :vars
    (
      ?auto_6424 - HOIST
      ?auto_6428 - PLACE
      ?auto_6425 - PLACE
      ?auto_6427 - HOIST
      ?auto_6429 - SURFACE
      ?auto_6432 - PLACE
      ?auto_6431 - HOIST
      ?auto_6430 - SURFACE
      ?auto_6436 - SURFACE
      ?auto_6433 - PLACE
      ?auto_6440 - HOIST
      ?auto_6435 - SURFACE
      ?auto_6439 - PLACE
      ?auto_6437 - HOIST
      ?auto_6438 - SURFACE
      ?auto_6434 - SURFACE
      ?auto_6426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6424 ?auto_6428 ) ( IS-CRATE ?auto_6423 ) ( not ( = ?auto_6425 ?auto_6428 ) ) ( HOIST-AT ?auto_6427 ?auto_6425 ) ( SURFACE-AT ?auto_6423 ?auto_6425 ) ( ON ?auto_6423 ?auto_6429 ) ( CLEAR ?auto_6423 ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6429 ) ) ( not ( = ?auto_6423 ?auto_6429 ) ) ( not ( = ?auto_6424 ?auto_6427 ) ) ( IS-CRATE ?auto_6422 ) ( not ( = ?auto_6432 ?auto_6428 ) ) ( HOIST-AT ?auto_6431 ?auto_6432 ) ( AVAILABLE ?auto_6431 ) ( SURFACE-AT ?auto_6422 ?auto_6432 ) ( ON ?auto_6422 ?auto_6430 ) ( CLEAR ?auto_6422 ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6430 ) ) ( not ( = ?auto_6422 ?auto_6430 ) ) ( not ( = ?auto_6424 ?auto_6431 ) ) ( IS-CRATE ?auto_6421 ) ( AVAILABLE ?auto_6427 ) ( SURFACE-AT ?auto_6421 ?auto_6425 ) ( ON ?auto_6421 ?auto_6436 ) ( CLEAR ?auto_6421 ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6436 ) ) ( not ( = ?auto_6421 ?auto_6436 ) ) ( IS-CRATE ?auto_6420 ) ( not ( = ?auto_6433 ?auto_6428 ) ) ( HOIST-AT ?auto_6440 ?auto_6433 ) ( AVAILABLE ?auto_6440 ) ( SURFACE-AT ?auto_6420 ?auto_6433 ) ( ON ?auto_6420 ?auto_6435 ) ( CLEAR ?auto_6420 ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6435 ) ) ( not ( = ?auto_6420 ?auto_6435 ) ) ( not ( = ?auto_6424 ?auto_6440 ) ) ( IS-CRATE ?auto_6419 ) ( not ( = ?auto_6439 ?auto_6428 ) ) ( HOIST-AT ?auto_6437 ?auto_6439 ) ( SURFACE-AT ?auto_6419 ?auto_6439 ) ( ON ?auto_6419 ?auto_6438 ) ( CLEAR ?auto_6419 ) ( not ( = ?auto_6418 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6438 ) ) ( not ( = ?auto_6419 ?auto_6438 ) ) ( not ( = ?auto_6424 ?auto_6437 ) ) ( SURFACE-AT ?auto_6417 ?auto_6428 ) ( CLEAR ?auto_6417 ) ( IS-CRATE ?auto_6418 ) ( AVAILABLE ?auto_6424 ) ( AVAILABLE ?auto_6437 ) ( SURFACE-AT ?auto_6418 ?auto_6439 ) ( ON ?auto_6418 ?auto_6434 ) ( CLEAR ?auto_6418 ) ( TRUCK-AT ?auto_6426 ?auto_6428 ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6434 ) ) ( not ( = ?auto_6418 ?auto_6434 ) ) ( not ( = ?auto_6417 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6438 ) ) ( not ( = ?auto_6419 ?auto_6434 ) ) ( not ( = ?auto_6438 ?auto_6434 ) ) ( not ( = ?auto_6417 ?auto_6420 ) ) ( not ( = ?auto_6417 ?auto_6435 ) ) ( not ( = ?auto_6418 ?auto_6420 ) ) ( not ( = ?auto_6418 ?auto_6435 ) ) ( not ( = ?auto_6420 ?auto_6438 ) ) ( not ( = ?auto_6420 ?auto_6434 ) ) ( not ( = ?auto_6433 ?auto_6439 ) ) ( not ( = ?auto_6440 ?auto_6437 ) ) ( not ( = ?auto_6435 ?auto_6438 ) ) ( not ( = ?auto_6435 ?auto_6434 ) ) ( not ( = ?auto_6417 ?auto_6421 ) ) ( not ( = ?auto_6417 ?auto_6436 ) ) ( not ( = ?auto_6418 ?auto_6421 ) ) ( not ( = ?auto_6418 ?auto_6436 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6436 ) ) ( not ( = ?auto_6421 ?auto_6435 ) ) ( not ( = ?auto_6421 ?auto_6438 ) ) ( not ( = ?auto_6421 ?auto_6434 ) ) ( not ( = ?auto_6425 ?auto_6433 ) ) ( not ( = ?auto_6425 ?auto_6439 ) ) ( not ( = ?auto_6427 ?auto_6440 ) ) ( not ( = ?auto_6427 ?auto_6437 ) ) ( not ( = ?auto_6436 ?auto_6435 ) ) ( not ( = ?auto_6436 ?auto_6438 ) ) ( not ( = ?auto_6436 ?auto_6434 ) ) ( not ( = ?auto_6417 ?auto_6422 ) ) ( not ( = ?auto_6417 ?auto_6430 ) ) ( not ( = ?auto_6418 ?auto_6422 ) ) ( not ( = ?auto_6418 ?auto_6430 ) ) ( not ( = ?auto_6419 ?auto_6422 ) ) ( not ( = ?auto_6419 ?auto_6430 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( not ( = ?auto_6420 ?auto_6430 ) ) ( not ( = ?auto_6422 ?auto_6436 ) ) ( not ( = ?auto_6422 ?auto_6435 ) ) ( not ( = ?auto_6422 ?auto_6438 ) ) ( not ( = ?auto_6422 ?auto_6434 ) ) ( not ( = ?auto_6432 ?auto_6425 ) ) ( not ( = ?auto_6432 ?auto_6433 ) ) ( not ( = ?auto_6432 ?auto_6439 ) ) ( not ( = ?auto_6431 ?auto_6427 ) ) ( not ( = ?auto_6431 ?auto_6440 ) ) ( not ( = ?auto_6431 ?auto_6437 ) ) ( not ( = ?auto_6430 ?auto_6436 ) ) ( not ( = ?auto_6430 ?auto_6435 ) ) ( not ( = ?auto_6430 ?auto_6438 ) ) ( not ( = ?auto_6430 ?auto_6434 ) ) ( not ( = ?auto_6417 ?auto_6423 ) ) ( not ( = ?auto_6417 ?auto_6429 ) ) ( not ( = ?auto_6418 ?auto_6423 ) ) ( not ( = ?auto_6418 ?auto_6429 ) ) ( not ( = ?auto_6419 ?auto_6423 ) ) ( not ( = ?auto_6419 ?auto_6429 ) ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( not ( = ?auto_6420 ?auto_6429 ) ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6429 ) ) ( not ( = ?auto_6423 ?auto_6430 ) ) ( not ( = ?auto_6423 ?auto_6436 ) ) ( not ( = ?auto_6423 ?auto_6435 ) ) ( not ( = ?auto_6423 ?auto_6438 ) ) ( not ( = ?auto_6423 ?auto_6434 ) ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6436 ) ) ( not ( = ?auto_6429 ?auto_6435 ) ) ( not ( = ?auto_6429 ?auto_6438 ) ) ( not ( = ?auto_6429 ?auto_6434 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6417 ?auto_6418 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 )
      ( MAKE-1CRATE ?auto_6422 ?auto_6423 )
      ( MAKE-6CRATE-VERIFY ?auto_6417 ?auto_6418 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 ?auto_6423 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
      ?auto_6461 - SURFACE
      ?auto_6462 - SURFACE
      ?auto_6463 - SURFACE
      ?auto_6464 - SURFACE
      ?auto_6465 - SURFACE
      ?auto_6466 - SURFACE
    )
    :vars
    (
      ?auto_6472 - HOIST
      ?auto_6468 - PLACE
      ?auto_6471 - PLACE
      ?auto_6467 - HOIST
      ?auto_6469 - SURFACE
      ?auto_6481 - PLACE
      ?auto_6478 - HOIST
      ?auto_6477 - SURFACE
      ?auto_6484 - PLACE
      ?auto_6483 - HOIST
      ?auto_6474 - SURFACE
      ?auto_6482 - SURFACE
      ?auto_6473 - SURFACE
      ?auto_6475 - PLACE
      ?auto_6480 - HOIST
      ?auto_6479 - SURFACE
      ?auto_6476 - SURFACE
      ?auto_6470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6472 ?auto_6468 ) ( IS-CRATE ?auto_6466 ) ( not ( = ?auto_6471 ?auto_6468 ) ) ( HOIST-AT ?auto_6467 ?auto_6471 ) ( SURFACE-AT ?auto_6466 ?auto_6471 ) ( ON ?auto_6466 ?auto_6469 ) ( CLEAR ?auto_6466 ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6469 ) ) ( not ( = ?auto_6466 ?auto_6469 ) ) ( not ( = ?auto_6472 ?auto_6467 ) ) ( IS-CRATE ?auto_6465 ) ( not ( = ?auto_6481 ?auto_6468 ) ) ( HOIST-AT ?auto_6478 ?auto_6481 ) ( SURFACE-AT ?auto_6465 ?auto_6481 ) ( ON ?auto_6465 ?auto_6477 ) ( CLEAR ?auto_6465 ) ( not ( = ?auto_6464 ?auto_6465 ) ) ( not ( = ?auto_6464 ?auto_6477 ) ) ( not ( = ?auto_6465 ?auto_6477 ) ) ( not ( = ?auto_6472 ?auto_6478 ) ) ( IS-CRATE ?auto_6464 ) ( not ( = ?auto_6484 ?auto_6468 ) ) ( HOIST-AT ?auto_6483 ?auto_6484 ) ( AVAILABLE ?auto_6483 ) ( SURFACE-AT ?auto_6464 ?auto_6484 ) ( ON ?auto_6464 ?auto_6474 ) ( CLEAR ?auto_6464 ) ( not ( = ?auto_6463 ?auto_6464 ) ) ( not ( = ?auto_6463 ?auto_6474 ) ) ( not ( = ?auto_6464 ?auto_6474 ) ) ( not ( = ?auto_6472 ?auto_6483 ) ) ( IS-CRATE ?auto_6463 ) ( AVAILABLE ?auto_6478 ) ( SURFACE-AT ?auto_6463 ?auto_6481 ) ( ON ?auto_6463 ?auto_6482 ) ( CLEAR ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6463 ) ) ( not ( = ?auto_6462 ?auto_6482 ) ) ( not ( = ?auto_6463 ?auto_6482 ) ) ( IS-CRATE ?auto_6462 ) ( AVAILABLE ?auto_6467 ) ( SURFACE-AT ?auto_6462 ?auto_6471 ) ( ON ?auto_6462 ?auto_6473 ) ( CLEAR ?auto_6462 ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6473 ) ) ( not ( = ?auto_6462 ?auto_6473 ) ) ( IS-CRATE ?auto_6461 ) ( not ( = ?auto_6475 ?auto_6468 ) ) ( HOIST-AT ?auto_6480 ?auto_6475 ) ( SURFACE-AT ?auto_6461 ?auto_6475 ) ( ON ?auto_6461 ?auto_6479 ) ( CLEAR ?auto_6461 ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6479 ) ) ( not ( = ?auto_6461 ?auto_6479 ) ) ( not ( = ?auto_6472 ?auto_6480 ) ) ( SURFACE-AT ?auto_6459 ?auto_6468 ) ( CLEAR ?auto_6459 ) ( IS-CRATE ?auto_6460 ) ( AVAILABLE ?auto_6472 ) ( AVAILABLE ?auto_6480 ) ( SURFACE-AT ?auto_6460 ?auto_6475 ) ( ON ?auto_6460 ?auto_6476 ) ( CLEAR ?auto_6460 ) ( TRUCK-AT ?auto_6470 ?auto_6468 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6459 ?auto_6476 ) ) ( not ( = ?auto_6460 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6459 ?auto_6479 ) ) ( not ( = ?auto_6461 ?auto_6476 ) ) ( not ( = ?auto_6479 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) ( not ( = ?auto_6459 ?auto_6473 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( not ( = ?auto_6460 ?auto_6473 ) ) ( not ( = ?auto_6462 ?auto_6479 ) ) ( not ( = ?auto_6462 ?auto_6476 ) ) ( not ( = ?auto_6471 ?auto_6475 ) ) ( not ( = ?auto_6467 ?auto_6480 ) ) ( not ( = ?auto_6473 ?auto_6479 ) ) ( not ( = ?auto_6473 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6463 ) ) ( not ( = ?auto_6459 ?auto_6482 ) ) ( not ( = ?auto_6460 ?auto_6463 ) ) ( not ( = ?auto_6460 ?auto_6482 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6482 ) ) ( not ( = ?auto_6463 ?auto_6473 ) ) ( not ( = ?auto_6463 ?auto_6479 ) ) ( not ( = ?auto_6463 ?auto_6476 ) ) ( not ( = ?auto_6481 ?auto_6471 ) ) ( not ( = ?auto_6481 ?auto_6475 ) ) ( not ( = ?auto_6478 ?auto_6467 ) ) ( not ( = ?auto_6478 ?auto_6480 ) ) ( not ( = ?auto_6482 ?auto_6473 ) ) ( not ( = ?auto_6482 ?auto_6479 ) ) ( not ( = ?auto_6482 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6464 ) ) ( not ( = ?auto_6459 ?auto_6474 ) ) ( not ( = ?auto_6460 ?auto_6464 ) ) ( not ( = ?auto_6460 ?auto_6474 ) ) ( not ( = ?auto_6461 ?auto_6464 ) ) ( not ( = ?auto_6461 ?auto_6474 ) ) ( not ( = ?auto_6462 ?auto_6464 ) ) ( not ( = ?auto_6462 ?auto_6474 ) ) ( not ( = ?auto_6464 ?auto_6482 ) ) ( not ( = ?auto_6464 ?auto_6473 ) ) ( not ( = ?auto_6464 ?auto_6479 ) ) ( not ( = ?auto_6464 ?auto_6476 ) ) ( not ( = ?auto_6484 ?auto_6481 ) ) ( not ( = ?auto_6484 ?auto_6471 ) ) ( not ( = ?auto_6484 ?auto_6475 ) ) ( not ( = ?auto_6483 ?auto_6478 ) ) ( not ( = ?auto_6483 ?auto_6467 ) ) ( not ( = ?auto_6483 ?auto_6480 ) ) ( not ( = ?auto_6474 ?auto_6482 ) ) ( not ( = ?auto_6474 ?auto_6473 ) ) ( not ( = ?auto_6474 ?auto_6479 ) ) ( not ( = ?auto_6474 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6465 ) ) ( not ( = ?auto_6459 ?auto_6477 ) ) ( not ( = ?auto_6460 ?auto_6465 ) ) ( not ( = ?auto_6460 ?auto_6477 ) ) ( not ( = ?auto_6461 ?auto_6465 ) ) ( not ( = ?auto_6461 ?auto_6477 ) ) ( not ( = ?auto_6462 ?auto_6465 ) ) ( not ( = ?auto_6462 ?auto_6477 ) ) ( not ( = ?auto_6463 ?auto_6465 ) ) ( not ( = ?auto_6463 ?auto_6477 ) ) ( not ( = ?auto_6465 ?auto_6474 ) ) ( not ( = ?auto_6465 ?auto_6482 ) ) ( not ( = ?auto_6465 ?auto_6473 ) ) ( not ( = ?auto_6465 ?auto_6479 ) ) ( not ( = ?auto_6465 ?auto_6476 ) ) ( not ( = ?auto_6477 ?auto_6474 ) ) ( not ( = ?auto_6477 ?auto_6482 ) ) ( not ( = ?auto_6477 ?auto_6473 ) ) ( not ( = ?auto_6477 ?auto_6479 ) ) ( not ( = ?auto_6477 ?auto_6476 ) ) ( not ( = ?auto_6459 ?auto_6466 ) ) ( not ( = ?auto_6459 ?auto_6469 ) ) ( not ( = ?auto_6460 ?auto_6466 ) ) ( not ( = ?auto_6460 ?auto_6469 ) ) ( not ( = ?auto_6461 ?auto_6466 ) ) ( not ( = ?auto_6461 ?auto_6469 ) ) ( not ( = ?auto_6462 ?auto_6466 ) ) ( not ( = ?auto_6462 ?auto_6469 ) ) ( not ( = ?auto_6463 ?auto_6466 ) ) ( not ( = ?auto_6463 ?auto_6469 ) ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( not ( = ?auto_6464 ?auto_6469 ) ) ( not ( = ?auto_6466 ?auto_6477 ) ) ( not ( = ?auto_6466 ?auto_6474 ) ) ( not ( = ?auto_6466 ?auto_6482 ) ) ( not ( = ?auto_6466 ?auto_6473 ) ) ( not ( = ?auto_6466 ?auto_6479 ) ) ( not ( = ?auto_6466 ?auto_6476 ) ) ( not ( = ?auto_6469 ?auto_6477 ) ) ( not ( = ?auto_6469 ?auto_6474 ) ) ( not ( = ?auto_6469 ?auto_6482 ) ) ( not ( = ?auto_6469 ?auto_6473 ) ) ( not ( = ?auto_6469 ?auto_6479 ) ) ( not ( = ?auto_6469 ?auto_6476 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ?auto_6464 ?auto_6465 )
      ( MAKE-1CRATE ?auto_6465 ?auto_6466 )
      ( MAKE-7CRATE-VERIFY ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ?auto_6464 ?auto_6465 ?auto_6466 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6504 - SURFACE
      ?auto_6505 - SURFACE
      ?auto_6506 - SURFACE
      ?auto_6507 - SURFACE
      ?auto_6508 - SURFACE
      ?auto_6509 - SURFACE
      ?auto_6510 - SURFACE
      ?auto_6511 - SURFACE
      ?auto_6512 - SURFACE
    )
    :vars
    (
      ?auto_6516 - HOIST
      ?auto_6517 - PLACE
      ?auto_6515 - PLACE
      ?auto_6513 - HOIST
      ?auto_6518 - SURFACE
      ?auto_6530 - PLACE
      ?auto_6520 - HOIST
      ?auto_6528 - SURFACE
      ?auto_6525 - PLACE
      ?auto_6523 - HOIST
      ?auto_6529 - SURFACE
      ?auto_6533 - PLACE
      ?auto_6524 - HOIST
      ?auto_6532 - SURFACE
      ?auto_6527 - SURFACE
      ?auto_6526 - SURFACE
      ?auto_6522 - PLACE
      ?auto_6531 - HOIST
      ?auto_6519 - SURFACE
      ?auto_6521 - SURFACE
      ?auto_6514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6516 ?auto_6517 ) ( IS-CRATE ?auto_6512 ) ( not ( = ?auto_6515 ?auto_6517 ) ) ( HOIST-AT ?auto_6513 ?auto_6515 ) ( AVAILABLE ?auto_6513 ) ( SURFACE-AT ?auto_6512 ?auto_6515 ) ( ON ?auto_6512 ?auto_6518 ) ( CLEAR ?auto_6512 ) ( not ( = ?auto_6511 ?auto_6512 ) ) ( not ( = ?auto_6511 ?auto_6518 ) ) ( not ( = ?auto_6512 ?auto_6518 ) ) ( not ( = ?auto_6516 ?auto_6513 ) ) ( IS-CRATE ?auto_6511 ) ( not ( = ?auto_6530 ?auto_6517 ) ) ( HOIST-AT ?auto_6520 ?auto_6530 ) ( SURFACE-AT ?auto_6511 ?auto_6530 ) ( ON ?auto_6511 ?auto_6528 ) ( CLEAR ?auto_6511 ) ( not ( = ?auto_6510 ?auto_6511 ) ) ( not ( = ?auto_6510 ?auto_6528 ) ) ( not ( = ?auto_6511 ?auto_6528 ) ) ( not ( = ?auto_6516 ?auto_6520 ) ) ( IS-CRATE ?auto_6510 ) ( not ( = ?auto_6525 ?auto_6517 ) ) ( HOIST-AT ?auto_6523 ?auto_6525 ) ( SURFACE-AT ?auto_6510 ?auto_6525 ) ( ON ?auto_6510 ?auto_6529 ) ( CLEAR ?auto_6510 ) ( not ( = ?auto_6509 ?auto_6510 ) ) ( not ( = ?auto_6509 ?auto_6529 ) ) ( not ( = ?auto_6510 ?auto_6529 ) ) ( not ( = ?auto_6516 ?auto_6523 ) ) ( IS-CRATE ?auto_6509 ) ( not ( = ?auto_6533 ?auto_6517 ) ) ( HOIST-AT ?auto_6524 ?auto_6533 ) ( AVAILABLE ?auto_6524 ) ( SURFACE-AT ?auto_6509 ?auto_6533 ) ( ON ?auto_6509 ?auto_6532 ) ( CLEAR ?auto_6509 ) ( not ( = ?auto_6508 ?auto_6509 ) ) ( not ( = ?auto_6508 ?auto_6532 ) ) ( not ( = ?auto_6509 ?auto_6532 ) ) ( not ( = ?auto_6516 ?auto_6524 ) ) ( IS-CRATE ?auto_6508 ) ( AVAILABLE ?auto_6523 ) ( SURFACE-AT ?auto_6508 ?auto_6525 ) ( ON ?auto_6508 ?auto_6527 ) ( CLEAR ?auto_6508 ) ( not ( = ?auto_6507 ?auto_6508 ) ) ( not ( = ?auto_6507 ?auto_6527 ) ) ( not ( = ?auto_6508 ?auto_6527 ) ) ( IS-CRATE ?auto_6507 ) ( AVAILABLE ?auto_6520 ) ( SURFACE-AT ?auto_6507 ?auto_6530 ) ( ON ?auto_6507 ?auto_6526 ) ( CLEAR ?auto_6507 ) ( not ( = ?auto_6506 ?auto_6507 ) ) ( not ( = ?auto_6506 ?auto_6526 ) ) ( not ( = ?auto_6507 ?auto_6526 ) ) ( IS-CRATE ?auto_6506 ) ( not ( = ?auto_6522 ?auto_6517 ) ) ( HOIST-AT ?auto_6531 ?auto_6522 ) ( SURFACE-AT ?auto_6506 ?auto_6522 ) ( ON ?auto_6506 ?auto_6519 ) ( CLEAR ?auto_6506 ) ( not ( = ?auto_6505 ?auto_6506 ) ) ( not ( = ?auto_6505 ?auto_6519 ) ) ( not ( = ?auto_6506 ?auto_6519 ) ) ( not ( = ?auto_6516 ?auto_6531 ) ) ( SURFACE-AT ?auto_6504 ?auto_6517 ) ( CLEAR ?auto_6504 ) ( IS-CRATE ?auto_6505 ) ( AVAILABLE ?auto_6516 ) ( AVAILABLE ?auto_6531 ) ( SURFACE-AT ?auto_6505 ?auto_6522 ) ( ON ?auto_6505 ?auto_6521 ) ( CLEAR ?auto_6505 ) ( TRUCK-AT ?auto_6514 ?auto_6517 ) ( not ( = ?auto_6504 ?auto_6505 ) ) ( not ( = ?auto_6504 ?auto_6521 ) ) ( not ( = ?auto_6505 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6506 ) ) ( not ( = ?auto_6504 ?auto_6519 ) ) ( not ( = ?auto_6506 ?auto_6521 ) ) ( not ( = ?auto_6519 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6507 ) ) ( not ( = ?auto_6504 ?auto_6526 ) ) ( not ( = ?auto_6505 ?auto_6507 ) ) ( not ( = ?auto_6505 ?auto_6526 ) ) ( not ( = ?auto_6507 ?auto_6519 ) ) ( not ( = ?auto_6507 ?auto_6521 ) ) ( not ( = ?auto_6530 ?auto_6522 ) ) ( not ( = ?auto_6520 ?auto_6531 ) ) ( not ( = ?auto_6526 ?auto_6519 ) ) ( not ( = ?auto_6526 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6508 ) ) ( not ( = ?auto_6504 ?auto_6527 ) ) ( not ( = ?auto_6505 ?auto_6508 ) ) ( not ( = ?auto_6505 ?auto_6527 ) ) ( not ( = ?auto_6506 ?auto_6508 ) ) ( not ( = ?auto_6506 ?auto_6527 ) ) ( not ( = ?auto_6508 ?auto_6526 ) ) ( not ( = ?auto_6508 ?auto_6519 ) ) ( not ( = ?auto_6508 ?auto_6521 ) ) ( not ( = ?auto_6525 ?auto_6530 ) ) ( not ( = ?auto_6525 ?auto_6522 ) ) ( not ( = ?auto_6523 ?auto_6520 ) ) ( not ( = ?auto_6523 ?auto_6531 ) ) ( not ( = ?auto_6527 ?auto_6526 ) ) ( not ( = ?auto_6527 ?auto_6519 ) ) ( not ( = ?auto_6527 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6509 ) ) ( not ( = ?auto_6504 ?auto_6532 ) ) ( not ( = ?auto_6505 ?auto_6509 ) ) ( not ( = ?auto_6505 ?auto_6532 ) ) ( not ( = ?auto_6506 ?auto_6509 ) ) ( not ( = ?auto_6506 ?auto_6532 ) ) ( not ( = ?auto_6507 ?auto_6509 ) ) ( not ( = ?auto_6507 ?auto_6532 ) ) ( not ( = ?auto_6509 ?auto_6527 ) ) ( not ( = ?auto_6509 ?auto_6526 ) ) ( not ( = ?auto_6509 ?auto_6519 ) ) ( not ( = ?auto_6509 ?auto_6521 ) ) ( not ( = ?auto_6533 ?auto_6525 ) ) ( not ( = ?auto_6533 ?auto_6530 ) ) ( not ( = ?auto_6533 ?auto_6522 ) ) ( not ( = ?auto_6524 ?auto_6523 ) ) ( not ( = ?auto_6524 ?auto_6520 ) ) ( not ( = ?auto_6524 ?auto_6531 ) ) ( not ( = ?auto_6532 ?auto_6527 ) ) ( not ( = ?auto_6532 ?auto_6526 ) ) ( not ( = ?auto_6532 ?auto_6519 ) ) ( not ( = ?auto_6532 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6510 ) ) ( not ( = ?auto_6504 ?auto_6529 ) ) ( not ( = ?auto_6505 ?auto_6510 ) ) ( not ( = ?auto_6505 ?auto_6529 ) ) ( not ( = ?auto_6506 ?auto_6510 ) ) ( not ( = ?auto_6506 ?auto_6529 ) ) ( not ( = ?auto_6507 ?auto_6510 ) ) ( not ( = ?auto_6507 ?auto_6529 ) ) ( not ( = ?auto_6508 ?auto_6510 ) ) ( not ( = ?auto_6508 ?auto_6529 ) ) ( not ( = ?auto_6510 ?auto_6532 ) ) ( not ( = ?auto_6510 ?auto_6527 ) ) ( not ( = ?auto_6510 ?auto_6526 ) ) ( not ( = ?auto_6510 ?auto_6519 ) ) ( not ( = ?auto_6510 ?auto_6521 ) ) ( not ( = ?auto_6529 ?auto_6532 ) ) ( not ( = ?auto_6529 ?auto_6527 ) ) ( not ( = ?auto_6529 ?auto_6526 ) ) ( not ( = ?auto_6529 ?auto_6519 ) ) ( not ( = ?auto_6529 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6511 ) ) ( not ( = ?auto_6504 ?auto_6528 ) ) ( not ( = ?auto_6505 ?auto_6511 ) ) ( not ( = ?auto_6505 ?auto_6528 ) ) ( not ( = ?auto_6506 ?auto_6511 ) ) ( not ( = ?auto_6506 ?auto_6528 ) ) ( not ( = ?auto_6507 ?auto_6511 ) ) ( not ( = ?auto_6507 ?auto_6528 ) ) ( not ( = ?auto_6508 ?auto_6511 ) ) ( not ( = ?auto_6508 ?auto_6528 ) ) ( not ( = ?auto_6509 ?auto_6511 ) ) ( not ( = ?auto_6509 ?auto_6528 ) ) ( not ( = ?auto_6511 ?auto_6529 ) ) ( not ( = ?auto_6511 ?auto_6532 ) ) ( not ( = ?auto_6511 ?auto_6527 ) ) ( not ( = ?auto_6511 ?auto_6526 ) ) ( not ( = ?auto_6511 ?auto_6519 ) ) ( not ( = ?auto_6511 ?auto_6521 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6532 ) ) ( not ( = ?auto_6528 ?auto_6527 ) ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( not ( = ?auto_6528 ?auto_6519 ) ) ( not ( = ?auto_6528 ?auto_6521 ) ) ( not ( = ?auto_6504 ?auto_6512 ) ) ( not ( = ?auto_6504 ?auto_6518 ) ) ( not ( = ?auto_6505 ?auto_6512 ) ) ( not ( = ?auto_6505 ?auto_6518 ) ) ( not ( = ?auto_6506 ?auto_6512 ) ) ( not ( = ?auto_6506 ?auto_6518 ) ) ( not ( = ?auto_6507 ?auto_6512 ) ) ( not ( = ?auto_6507 ?auto_6518 ) ) ( not ( = ?auto_6508 ?auto_6512 ) ) ( not ( = ?auto_6508 ?auto_6518 ) ) ( not ( = ?auto_6509 ?auto_6512 ) ) ( not ( = ?auto_6509 ?auto_6518 ) ) ( not ( = ?auto_6510 ?auto_6512 ) ) ( not ( = ?auto_6510 ?auto_6518 ) ) ( not ( = ?auto_6512 ?auto_6528 ) ) ( not ( = ?auto_6512 ?auto_6529 ) ) ( not ( = ?auto_6512 ?auto_6532 ) ) ( not ( = ?auto_6512 ?auto_6527 ) ) ( not ( = ?auto_6512 ?auto_6526 ) ) ( not ( = ?auto_6512 ?auto_6519 ) ) ( not ( = ?auto_6512 ?auto_6521 ) ) ( not ( = ?auto_6515 ?auto_6530 ) ) ( not ( = ?auto_6515 ?auto_6525 ) ) ( not ( = ?auto_6515 ?auto_6533 ) ) ( not ( = ?auto_6515 ?auto_6522 ) ) ( not ( = ?auto_6513 ?auto_6520 ) ) ( not ( = ?auto_6513 ?auto_6523 ) ) ( not ( = ?auto_6513 ?auto_6524 ) ) ( not ( = ?auto_6513 ?auto_6531 ) ) ( not ( = ?auto_6518 ?auto_6528 ) ) ( not ( = ?auto_6518 ?auto_6529 ) ) ( not ( = ?auto_6518 ?auto_6532 ) ) ( not ( = ?auto_6518 ?auto_6527 ) ) ( not ( = ?auto_6518 ?auto_6526 ) ) ( not ( = ?auto_6518 ?auto_6519 ) ) ( not ( = ?auto_6518 ?auto_6521 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6504 ?auto_6505 ?auto_6506 ?auto_6507 ?auto_6508 ?auto_6509 ?auto_6510 ?auto_6511 )
      ( MAKE-1CRATE ?auto_6511 ?auto_6512 )
      ( MAKE-8CRATE-VERIFY ?auto_6504 ?auto_6505 ?auto_6506 ?auto_6507 ?auto_6508 ?auto_6509 ?auto_6510 ?auto_6511 ?auto_6512 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6554 - SURFACE
      ?auto_6555 - SURFACE
      ?auto_6556 - SURFACE
      ?auto_6557 - SURFACE
      ?auto_6558 - SURFACE
      ?auto_6559 - SURFACE
      ?auto_6560 - SURFACE
      ?auto_6561 - SURFACE
      ?auto_6562 - SURFACE
      ?auto_6563 - SURFACE
    )
    :vars
    (
      ?auto_6567 - HOIST
      ?auto_6569 - PLACE
      ?auto_6568 - PLACE
      ?auto_6564 - HOIST
      ?auto_6566 - SURFACE
      ?auto_6585 - PLACE
      ?auto_6577 - HOIST
      ?auto_6578 - SURFACE
      ?auto_6579 - PLACE
      ?auto_6583 - HOIST
      ?auto_6576 - SURFACE
      ?auto_6580 - SURFACE
      ?auto_6581 - PLACE
      ?auto_6574 - HOIST
      ?auto_6570 - SURFACE
      ?auto_6584 - SURFACE
      ?auto_6571 - SURFACE
      ?auto_6573 - PLACE
      ?auto_6575 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6572 - SURFACE
      ?auto_6565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6567 ?auto_6569 ) ( IS-CRATE ?auto_6563 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( HOIST-AT ?auto_6564 ?auto_6568 ) ( SURFACE-AT ?auto_6563 ?auto_6568 ) ( ON ?auto_6563 ?auto_6566 ) ( CLEAR ?auto_6563 ) ( not ( = ?auto_6562 ?auto_6563 ) ) ( not ( = ?auto_6562 ?auto_6566 ) ) ( not ( = ?auto_6563 ?auto_6566 ) ) ( not ( = ?auto_6567 ?auto_6564 ) ) ( IS-CRATE ?auto_6562 ) ( not ( = ?auto_6585 ?auto_6569 ) ) ( HOIST-AT ?auto_6577 ?auto_6585 ) ( AVAILABLE ?auto_6577 ) ( SURFACE-AT ?auto_6562 ?auto_6585 ) ( ON ?auto_6562 ?auto_6578 ) ( CLEAR ?auto_6562 ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( not ( = ?auto_6561 ?auto_6578 ) ) ( not ( = ?auto_6562 ?auto_6578 ) ) ( not ( = ?auto_6567 ?auto_6577 ) ) ( IS-CRATE ?auto_6561 ) ( not ( = ?auto_6579 ?auto_6569 ) ) ( HOIST-AT ?auto_6583 ?auto_6579 ) ( SURFACE-AT ?auto_6561 ?auto_6579 ) ( ON ?auto_6561 ?auto_6576 ) ( CLEAR ?auto_6561 ) ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6560 ?auto_6576 ) ) ( not ( = ?auto_6561 ?auto_6576 ) ) ( not ( = ?auto_6567 ?auto_6583 ) ) ( IS-CRATE ?auto_6560 ) ( SURFACE-AT ?auto_6560 ?auto_6568 ) ( ON ?auto_6560 ?auto_6580 ) ( CLEAR ?auto_6560 ) ( not ( = ?auto_6559 ?auto_6560 ) ) ( not ( = ?auto_6559 ?auto_6580 ) ) ( not ( = ?auto_6560 ?auto_6580 ) ) ( IS-CRATE ?auto_6559 ) ( not ( = ?auto_6581 ?auto_6569 ) ) ( HOIST-AT ?auto_6574 ?auto_6581 ) ( AVAILABLE ?auto_6574 ) ( SURFACE-AT ?auto_6559 ?auto_6581 ) ( ON ?auto_6559 ?auto_6570 ) ( CLEAR ?auto_6559 ) ( not ( = ?auto_6558 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6570 ) ) ( not ( = ?auto_6559 ?auto_6570 ) ) ( not ( = ?auto_6567 ?auto_6574 ) ) ( IS-CRATE ?auto_6558 ) ( AVAILABLE ?auto_6564 ) ( SURFACE-AT ?auto_6558 ?auto_6568 ) ( ON ?auto_6558 ?auto_6584 ) ( CLEAR ?auto_6558 ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6584 ) ) ( not ( = ?auto_6558 ?auto_6584 ) ) ( IS-CRATE ?auto_6557 ) ( AVAILABLE ?auto_6583 ) ( SURFACE-AT ?auto_6557 ?auto_6579 ) ( ON ?auto_6557 ?auto_6571 ) ( CLEAR ?auto_6557 ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6571 ) ) ( not ( = ?auto_6557 ?auto_6571 ) ) ( IS-CRATE ?auto_6556 ) ( not ( = ?auto_6573 ?auto_6569 ) ) ( HOIST-AT ?auto_6575 ?auto_6573 ) ( SURFACE-AT ?auto_6556 ?auto_6573 ) ( ON ?auto_6556 ?auto_6582 ) ( CLEAR ?auto_6556 ) ( not ( = ?auto_6555 ?auto_6556 ) ) ( not ( = ?auto_6555 ?auto_6582 ) ) ( not ( = ?auto_6556 ?auto_6582 ) ) ( not ( = ?auto_6567 ?auto_6575 ) ) ( SURFACE-AT ?auto_6554 ?auto_6569 ) ( CLEAR ?auto_6554 ) ( IS-CRATE ?auto_6555 ) ( AVAILABLE ?auto_6567 ) ( AVAILABLE ?auto_6575 ) ( SURFACE-AT ?auto_6555 ?auto_6573 ) ( ON ?auto_6555 ?auto_6572 ) ( CLEAR ?auto_6555 ) ( TRUCK-AT ?auto_6565 ?auto_6569 ) ( not ( = ?auto_6554 ?auto_6555 ) ) ( not ( = ?auto_6554 ?auto_6572 ) ) ( not ( = ?auto_6555 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6556 ) ) ( not ( = ?auto_6554 ?auto_6582 ) ) ( not ( = ?auto_6556 ?auto_6572 ) ) ( not ( = ?auto_6582 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6557 ) ) ( not ( = ?auto_6554 ?auto_6571 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6571 ) ) ( not ( = ?auto_6557 ?auto_6582 ) ) ( not ( = ?auto_6557 ?auto_6572 ) ) ( not ( = ?auto_6579 ?auto_6573 ) ) ( not ( = ?auto_6583 ?auto_6575 ) ) ( not ( = ?auto_6571 ?auto_6582 ) ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6558 ) ) ( not ( = ?auto_6554 ?auto_6584 ) ) ( not ( = ?auto_6555 ?auto_6558 ) ) ( not ( = ?auto_6555 ?auto_6584 ) ) ( not ( = ?auto_6556 ?auto_6558 ) ) ( not ( = ?auto_6556 ?auto_6584 ) ) ( not ( = ?auto_6558 ?auto_6571 ) ) ( not ( = ?auto_6558 ?auto_6582 ) ) ( not ( = ?auto_6558 ?auto_6572 ) ) ( not ( = ?auto_6568 ?auto_6579 ) ) ( not ( = ?auto_6568 ?auto_6573 ) ) ( not ( = ?auto_6564 ?auto_6583 ) ) ( not ( = ?auto_6564 ?auto_6575 ) ) ( not ( = ?auto_6584 ?auto_6571 ) ) ( not ( = ?auto_6584 ?auto_6582 ) ) ( not ( = ?auto_6584 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6559 ) ) ( not ( = ?auto_6554 ?auto_6570 ) ) ( not ( = ?auto_6555 ?auto_6559 ) ) ( not ( = ?auto_6555 ?auto_6570 ) ) ( not ( = ?auto_6556 ?auto_6559 ) ) ( not ( = ?auto_6556 ?auto_6570 ) ) ( not ( = ?auto_6557 ?auto_6559 ) ) ( not ( = ?auto_6557 ?auto_6570 ) ) ( not ( = ?auto_6559 ?auto_6584 ) ) ( not ( = ?auto_6559 ?auto_6571 ) ) ( not ( = ?auto_6559 ?auto_6582 ) ) ( not ( = ?auto_6559 ?auto_6572 ) ) ( not ( = ?auto_6581 ?auto_6568 ) ) ( not ( = ?auto_6581 ?auto_6579 ) ) ( not ( = ?auto_6581 ?auto_6573 ) ) ( not ( = ?auto_6574 ?auto_6564 ) ) ( not ( = ?auto_6574 ?auto_6583 ) ) ( not ( = ?auto_6574 ?auto_6575 ) ) ( not ( = ?auto_6570 ?auto_6584 ) ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6560 ) ) ( not ( = ?auto_6554 ?auto_6580 ) ) ( not ( = ?auto_6555 ?auto_6560 ) ) ( not ( = ?auto_6555 ?auto_6580 ) ) ( not ( = ?auto_6556 ?auto_6560 ) ) ( not ( = ?auto_6556 ?auto_6580 ) ) ( not ( = ?auto_6557 ?auto_6560 ) ) ( not ( = ?auto_6557 ?auto_6580 ) ) ( not ( = ?auto_6558 ?auto_6560 ) ) ( not ( = ?auto_6558 ?auto_6580 ) ) ( not ( = ?auto_6560 ?auto_6570 ) ) ( not ( = ?auto_6560 ?auto_6584 ) ) ( not ( = ?auto_6560 ?auto_6571 ) ) ( not ( = ?auto_6560 ?auto_6582 ) ) ( not ( = ?auto_6560 ?auto_6572 ) ) ( not ( = ?auto_6580 ?auto_6570 ) ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( not ( = ?auto_6580 ?auto_6571 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6561 ) ) ( not ( = ?auto_6554 ?auto_6576 ) ) ( not ( = ?auto_6555 ?auto_6561 ) ) ( not ( = ?auto_6555 ?auto_6576 ) ) ( not ( = ?auto_6556 ?auto_6561 ) ) ( not ( = ?auto_6556 ?auto_6576 ) ) ( not ( = ?auto_6557 ?auto_6561 ) ) ( not ( = ?auto_6557 ?auto_6576 ) ) ( not ( = ?auto_6558 ?auto_6561 ) ) ( not ( = ?auto_6558 ?auto_6576 ) ) ( not ( = ?auto_6559 ?auto_6561 ) ) ( not ( = ?auto_6559 ?auto_6576 ) ) ( not ( = ?auto_6561 ?auto_6580 ) ) ( not ( = ?auto_6561 ?auto_6570 ) ) ( not ( = ?auto_6561 ?auto_6584 ) ) ( not ( = ?auto_6561 ?auto_6571 ) ) ( not ( = ?auto_6561 ?auto_6582 ) ) ( not ( = ?auto_6561 ?auto_6572 ) ) ( not ( = ?auto_6576 ?auto_6580 ) ) ( not ( = ?auto_6576 ?auto_6570 ) ) ( not ( = ?auto_6576 ?auto_6584 ) ) ( not ( = ?auto_6576 ?auto_6571 ) ) ( not ( = ?auto_6576 ?auto_6582 ) ) ( not ( = ?auto_6576 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6562 ) ) ( not ( = ?auto_6554 ?auto_6578 ) ) ( not ( = ?auto_6555 ?auto_6562 ) ) ( not ( = ?auto_6555 ?auto_6578 ) ) ( not ( = ?auto_6556 ?auto_6562 ) ) ( not ( = ?auto_6556 ?auto_6578 ) ) ( not ( = ?auto_6557 ?auto_6562 ) ) ( not ( = ?auto_6557 ?auto_6578 ) ) ( not ( = ?auto_6558 ?auto_6562 ) ) ( not ( = ?auto_6558 ?auto_6578 ) ) ( not ( = ?auto_6559 ?auto_6562 ) ) ( not ( = ?auto_6559 ?auto_6578 ) ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( not ( = ?auto_6560 ?auto_6578 ) ) ( not ( = ?auto_6562 ?auto_6576 ) ) ( not ( = ?auto_6562 ?auto_6580 ) ) ( not ( = ?auto_6562 ?auto_6570 ) ) ( not ( = ?auto_6562 ?auto_6584 ) ) ( not ( = ?auto_6562 ?auto_6571 ) ) ( not ( = ?auto_6562 ?auto_6582 ) ) ( not ( = ?auto_6562 ?auto_6572 ) ) ( not ( = ?auto_6585 ?auto_6579 ) ) ( not ( = ?auto_6585 ?auto_6568 ) ) ( not ( = ?auto_6585 ?auto_6581 ) ) ( not ( = ?auto_6585 ?auto_6573 ) ) ( not ( = ?auto_6577 ?auto_6583 ) ) ( not ( = ?auto_6577 ?auto_6564 ) ) ( not ( = ?auto_6577 ?auto_6574 ) ) ( not ( = ?auto_6577 ?auto_6575 ) ) ( not ( = ?auto_6578 ?auto_6576 ) ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( not ( = ?auto_6578 ?auto_6570 ) ) ( not ( = ?auto_6578 ?auto_6584 ) ) ( not ( = ?auto_6578 ?auto_6571 ) ) ( not ( = ?auto_6578 ?auto_6582 ) ) ( not ( = ?auto_6578 ?auto_6572 ) ) ( not ( = ?auto_6554 ?auto_6563 ) ) ( not ( = ?auto_6554 ?auto_6566 ) ) ( not ( = ?auto_6555 ?auto_6563 ) ) ( not ( = ?auto_6555 ?auto_6566 ) ) ( not ( = ?auto_6556 ?auto_6563 ) ) ( not ( = ?auto_6556 ?auto_6566 ) ) ( not ( = ?auto_6557 ?auto_6563 ) ) ( not ( = ?auto_6557 ?auto_6566 ) ) ( not ( = ?auto_6558 ?auto_6563 ) ) ( not ( = ?auto_6558 ?auto_6566 ) ) ( not ( = ?auto_6559 ?auto_6563 ) ) ( not ( = ?auto_6559 ?auto_6566 ) ) ( not ( = ?auto_6560 ?auto_6563 ) ) ( not ( = ?auto_6560 ?auto_6566 ) ) ( not ( = ?auto_6561 ?auto_6563 ) ) ( not ( = ?auto_6561 ?auto_6566 ) ) ( not ( = ?auto_6563 ?auto_6578 ) ) ( not ( = ?auto_6563 ?auto_6576 ) ) ( not ( = ?auto_6563 ?auto_6580 ) ) ( not ( = ?auto_6563 ?auto_6570 ) ) ( not ( = ?auto_6563 ?auto_6584 ) ) ( not ( = ?auto_6563 ?auto_6571 ) ) ( not ( = ?auto_6563 ?auto_6582 ) ) ( not ( = ?auto_6563 ?auto_6572 ) ) ( not ( = ?auto_6566 ?auto_6578 ) ) ( not ( = ?auto_6566 ?auto_6576 ) ) ( not ( = ?auto_6566 ?auto_6580 ) ) ( not ( = ?auto_6566 ?auto_6570 ) ) ( not ( = ?auto_6566 ?auto_6584 ) ) ( not ( = ?auto_6566 ?auto_6571 ) ) ( not ( = ?auto_6566 ?auto_6582 ) ) ( not ( = ?auto_6566 ?auto_6572 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6554 ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ?auto_6559 ?auto_6560 ?auto_6561 ?auto_6562 )
      ( MAKE-1CRATE ?auto_6562 ?auto_6563 )
      ( MAKE-9CRATE-VERIFY ?auto_6554 ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ?auto_6559 ?auto_6560 ?auto_6561 ?auto_6562 ?auto_6563 ) )
  )

)

