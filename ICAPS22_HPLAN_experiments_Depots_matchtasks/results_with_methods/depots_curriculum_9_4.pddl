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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6280 - SURFACE
      ?auto_6281 - SURFACE
    )
    :vars
    (
      ?auto_6282 - HOIST
      ?auto_6283 - PLACE
      ?auto_6285 - PLACE
      ?auto_6286 - HOIST
      ?auto_6287 - SURFACE
      ?auto_6284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6282 ?auto_6283 ) ( SURFACE-AT ?auto_6280 ?auto_6283 ) ( CLEAR ?auto_6280 ) ( IS-CRATE ?auto_6281 ) ( AVAILABLE ?auto_6282 ) ( not ( = ?auto_6285 ?auto_6283 ) ) ( HOIST-AT ?auto_6286 ?auto_6285 ) ( AVAILABLE ?auto_6286 ) ( SURFACE-AT ?auto_6281 ?auto_6285 ) ( ON ?auto_6281 ?auto_6287 ) ( CLEAR ?auto_6281 ) ( TRUCK-AT ?auto_6284 ?auto_6283 ) ( not ( = ?auto_6280 ?auto_6281 ) ) ( not ( = ?auto_6280 ?auto_6287 ) ) ( not ( = ?auto_6281 ?auto_6287 ) ) ( not ( = ?auto_6282 ?auto_6286 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6284 ?auto_6283 ?auto_6285 )
      ( !LIFT ?auto_6286 ?auto_6281 ?auto_6287 ?auto_6285 )
      ( !LOAD ?auto_6286 ?auto_6281 ?auto_6284 ?auto_6285 )
      ( !DRIVE ?auto_6284 ?auto_6285 ?auto_6283 )
      ( !UNLOAD ?auto_6282 ?auto_6281 ?auto_6284 ?auto_6283 )
      ( !DROP ?auto_6282 ?auto_6281 ?auto_6280 ?auto_6283 )
      ( MAKE-1CRATE-VERIFY ?auto_6280 ?auto_6281 ) )
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
      ?auto_6295 - HOIST
      ?auto_6297 - PLACE
      ?auto_6299 - PLACE
      ?auto_6298 - HOIST
      ?auto_6296 - SURFACE
      ?auto_6300 - SURFACE
      ?auto_6294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6295 ?auto_6297 ) ( IS-CRATE ?auto_6293 ) ( not ( = ?auto_6299 ?auto_6297 ) ) ( HOIST-AT ?auto_6298 ?auto_6299 ) ( SURFACE-AT ?auto_6293 ?auto_6299 ) ( ON ?auto_6293 ?auto_6296 ) ( CLEAR ?auto_6293 ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6296 ) ) ( not ( = ?auto_6293 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6298 ) ) ( SURFACE-AT ?auto_6291 ?auto_6297 ) ( CLEAR ?auto_6291 ) ( IS-CRATE ?auto_6292 ) ( AVAILABLE ?auto_6295 ) ( AVAILABLE ?auto_6298 ) ( SURFACE-AT ?auto_6292 ?auto_6299 ) ( ON ?auto_6292 ?auto_6300 ) ( CLEAR ?auto_6292 ) ( TRUCK-AT ?auto_6294 ?auto_6297 ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6300 ) ) ( not ( = ?auto_6292 ?auto_6300 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6296 ) ) ( not ( = ?auto_6293 ?auto_6300 ) ) ( not ( = ?auto_6296 ?auto_6300 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6291 ?auto_6292 )
      ( MAKE-1CRATE ?auto_6292 ?auto_6293 )
      ( MAKE-2CRATE-VERIFY ?auto_6291 ?auto_6292 ?auto_6293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6303 - SURFACE
      ?auto_6304 - SURFACE
    )
    :vars
    (
      ?auto_6305 - HOIST
      ?auto_6306 - PLACE
      ?auto_6308 - PLACE
      ?auto_6309 - HOIST
      ?auto_6310 - SURFACE
      ?auto_6307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6305 ?auto_6306 ) ( SURFACE-AT ?auto_6303 ?auto_6306 ) ( CLEAR ?auto_6303 ) ( IS-CRATE ?auto_6304 ) ( AVAILABLE ?auto_6305 ) ( not ( = ?auto_6308 ?auto_6306 ) ) ( HOIST-AT ?auto_6309 ?auto_6308 ) ( AVAILABLE ?auto_6309 ) ( SURFACE-AT ?auto_6304 ?auto_6308 ) ( ON ?auto_6304 ?auto_6310 ) ( CLEAR ?auto_6304 ) ( TRUCK-AT ?auto_6307 ?auto_6306 ) ( not ( = ?auto_6303 ?auto_6304 ) ) ( not ( = ?auto_6303 ?auto_6310 ) ) ( not ( = ?auto_6304 ?auto_6310 ) ) ( not ( = ?auto_6305 ?auto_6309 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6307 ?auto_6306 ?auto_6308 )
      ( !LIFT ?auto_6309 ?auto_6304 ?auto_6310 ?auto_6308 )
      ( !LOAD ?auto_6309 ?auto_6304 ?auto_6307 ?auto_6308 )
      ( !DRIVE ?auto_6307 ?auto_6308 ?auto_6306 )
      ( !UNLOAD ?auto_6305 ?auto_6304 ?auto_6307 ?auto_6306 )
      ( !DROP ?auto_6305 ?auto_6304 ?auto_6303 ?auto_6306 )
      ( MAKE-1CRATE-VERIFY ?auto_6303 ?auto_6304 ) )
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
      ?auto_6322 - HOIST
      ?auto_6319 - PLACE
      ?auto_6321 - PLACE
      ?auto_6323 - HOIST
      ?auto_6324 - SURFACE
      ?auto_6325 - PLACE
      ?auto_6327 - HOIST
      ?auto_6328 - SURFACE
      ?auto_6326 - SURFACE
      ?auto_6320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6322 ?auto_6319 ) ( IS-CRATE ?auto_6318 ) ( not ( = ?auto_6321 ?auto_6319 ) ) ( HOIST-AT ?auto_6323 ?auto_6321 ) ( AVAILABLE ?auto_6323 ) ( SURFACE-AT ?auto_6318 ?auto_6321 ) ( ON ?auto_6318 ?auto_6324 ) ( CLEAR ?auto_6318 ) ( not ( = ?auto_6317 ?auto_6318 ) ) ( not ( = ?auto_6317 ?auto_6324 ) ) ( not ( = ?auto_6318 ?auto_6324 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( IS-CRATE ?auto_6317 ) ( not ( = ?auto_6325 ?auto_6319 ) ) ( HOIST-AT ?auto_6327 ?auto_6325 ) ( SURFACE-AT ?auto_6317 ?auto_6325 ) ( ON ?auto_6317 ?auto_6328 ) ( CLEAR ?auto_6317 ) ( not ( = ?auto_6316 ?auto_6317 ) ) ( not ( = ?auto_6316 ?auto_6328 ) ) ( not ( = ?auto_6317 ?auto_6328 ) ) ( not ( = ?auto_6322 ?auto_6327 ) ) ( SURFACE-AT ?auto_6315 ?auto_6319 ) ( CLEAR ?auto_6315 ) ( IS-CRATE ?auto_6316 ) ( AVAILABLE ?auto_6322 ) ( AVAILABLE ?auto_6327 ) ( SURFACE-AT ?auto_6316 ?auto_6325 ) ( ON ?auto_6316 ?auto_6326 ) ( CLEAR ?auto_6316 ) ( TRUCK-AT ?auto_6320 ?auto_6319 ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6326 ) ) ( not ( = ?auto_6316 ?auto_6326 ) ) ( not ( = ?auto_6315 ?auto_6317 ) ) ( not ( = ?auto_6315 ?auto_6328 ) ) ( not ( = ?auto_6317 ?auto_6326 ) ) ( not ( = ?auto_6328 ?auto_6326 ) ) ( not ( = ?auto_6315 ?auto_6318 ) ) ( not ( = ?auto_6315 ?auto_6324 ) ) ( not ( = ?auto_6316 ?auto_6318 ) ) ( not ( = ?auto_6316 ?auto_6324 ) ) ( not ( = ?auto_6318 ?auto_6328 ) ) ( not ( = ?auto_6318 ?auto_6326 ) ) ( not ( = ?auto_6321 ?auto_6325 ) ) ( not ( = ?auto_6323 ?auto_6327 ) ) ( not ( = ?auto_6324 ?auto_6328 ) ) ( not ( = ?auto_6324 ?auto_6326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6315 ?auto_6316 ?auto_6317 )
      ( MAKE-1CRATE ?auto_6317 ?auto_6318 )
      ( MAKE-3CRATE-VERIFY ?auto_6315 ?auto_6316 ?auto_6317 ?auto_6318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6331 - SURFACE
      ?auto_6332 - SURFACE
    )
    :vars
    (
      ?auto_6333 - HOIST
      ?auto_6334 - PLACE
      ?auto_6336 - PLACE
      ?auto_6337 - HOIST
      ?auto_6338 - SURFACE
      ?auto_6335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6333 ?auto_6334 ) ( SURFACE-AT ?auto_6331 ?auto_6334 ) ( CLEAR ?auto_6331 ) ( IS-CRATE ?auto_6332 ) ( AVAILABLE ?auto_6333 ) ( not ( = ?auto_6336 ?auto_6334 ) ) ( HOIST-AT ?auto_6337 ?auto_6336 ) ( AVAILABLE ?auto_6337 ) ( SURFACE-AT ?auto_6332 ?auto_6336 ) ( ON ?auto_6332 ?auto_6338 ) ( CLEAR ?auto_6332 ) ( TRUCK-AT ?auto_6335 ?auto_6334 ) ( not ( = ?auto_6331 ?auto_6332 ) ) ( not ( = ?auto_6331 ?auto_6338 ) ) ( not ( = ?auto_6332 ?auto_6338 ) ) ( not ( = ?auto_6333 ?auto_6337 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6335 ?auto_6334 ?auto_6336 )
      ( !LIFT ?auto_6337 ?auto_6332 ?auto_6338 ?auto_6336 )
      ( !LOAD ?auto_6337 ?auto_6332 ?auto_6335 ?auto_6336 )
      ( !DRIVE ?auto_6335 ?auto_6336 ?auto_6334 )
      ( !UNLOAD ?auto_6333 ?auto_6332 ?auto_6335 ?auto_6334 )
      ( !DROP ?auto_6333 ?auto_6332 ?auto_6331 ?auto_6334 )
      ( MAKE-1CRATE-VERIFY ?auto_6331 ?auto_6332 ) )
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
      ?auto_6352 - HOIST
      ?auto_6354 - PLACE
      ?auto_6353 - PLACE
      ?auto_6351 - HOIST
      ?auto_6350 - SURFACE
      ?auto_6355 - PLACE
      ?auto_6361 - HOIST
      ?auto_6360 - SURFACE
      ?auto_6356 - PLACE
      ?auto_6359 - HOIST
      ?auto_6358 - SURFACE
      ?auto_6357 - SURFACE
      ?auto_6349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6352 ?auto_6354 ) ( IS-CRATE ?auto_6348 ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( HOIST-AT ?auto_6351 ?auto_6353 ) ( AVAILABLE ?auto_6351 ) ( SURFACE-AT ?auto_6348 ?auto_6353 ) ( ON ?auto_6348 ?auto_6350 ) ( CLEAR ?auto_6348 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6352 ?auto_6351 ) ) ( IS-CRATE ?auto_6347 ) ( not ( = ?auto_6355 ?auto_6354 ) ) ( HOIST-AT ?auto_6361 ?auto_6355 ) ( AVAILABLE ?auto_6361 ) ( SURFACE-AT ?auto_6347 ?auto_6355 ) ( ON ?auto_6347 ?auto_6360 ) ( CLEAR ?auto_6347 ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6360 ) ) ( not ( = ?auto_6347 ?auto_6360 ) ) ( not ( = ?auto_6352 ?auto_6361 ) ) ( IS-CRATE ?auto_6346 ) ( not ( = ?auto_6356 ?auto_6354 ) ) ( HOIST-AT ?auto_6359 ?auto_6356 ) ( SURFACE-AT ?auto_6346 ?auto_6356 ) ( ON ?auto_6346 ?auto_6358 ) ( CLEAR ?auto_6346 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6358 ) ) ( not ( = ?auto_6346 ?auto_6358 ) ) ( not ( = ?auto_6352 ?auto_6359 ) ) ( SURFACE-AT ?auto_6344 ?auto_6354 ) ( CLEAR ?auto_6344 ) ( IS-CRATE ?auto_6345 ) ( AVAILABLE ?auto_6352 ) ( AVAILABLE ?auto_6359 ) ( SURFACE-AT ?auto_6345 ?auto_6356 ) ( ON ?auto_6345 ?auto_6357 ) ( CLEAR ?auto_6345 ) ( TRUCK-AT ?auto_6349 ?auto_6354 ) ( not ( = ?auto_6344 ?auto_6345 ) ) ( not ( = ?auto_6344 ?auto_6357 ) ) ( not ( = ?auto_6345 ?auto_6357 ) ) ( not ( = ?auto_6344 ?auto_6346 ) ) ( not ( = ?auto_6344 ?auto_6358 ) ) ( not ( = ?auto_6346 ?auto_6357 ) ) ( not ( = ?auto_6358 ?auto_6357 ) ) ( not ( = ?auto_6344 ?auto_6347 ) ) ( not ( = ?auto_6344 ?auto_6360 ) ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6345 ?auto_6360 ) ) ( not ( = ?auto_6347 ?auto_6358 ) ) ( not ( = ?auto_6347 ?auto_6357 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( not ( = ?auto_6361 ?auto_6359 ) ) ( not ( = ?auto_6360 ?auto_6358 ) ) ( not ( = ?auto_6360 ?auto_6357 ) ) ( not ( = ?auto_6344 ?auto_6348 ) ) ( not ( = ?auto_6344 ?auto_6350 ) ) ( not ( = ?auto_6345 ?auto_6348 ) ) ( not ( = ?auto_6345 ?auto_6350 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6360 ) ) ( not ( = ?auto_6348 ?auto_6358 ) ) ( not ( = ?auto_6348 ?auto_6357 ) ) ( not ( = ?auto_6353 ?auto_6355 ) ) ( not ( = ?auto_6353 ?auto_6356 ) ) ( not ( = ?auto_6351 ?auto_6361 ) ) ( not ( = ?auto_6351 ?auto_6359 ) ) ( not ( = ?auto_6350 ?auto_6360 ) ) ( not ( = ?auto_6350 ?auto_6358 ) ) ( not ( = ?auto_6350 ?auto_6357 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6344 ?auto_6345 ?auto_6346 ?auto_6347 )
      ( MAKE-1CRATE ?auto_6347 ?auto_6348 )
      ( MAKE-4CRATE-VERIFY ?auto_6344 ?auto_6345 ?auto_6346 ?auto_6347 ?auto_6348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6364 - SURFACE
      ?auto_6365 - SURFACE
    )
    :vars
    (
      ?auto_6366 - HOIST
      ?auto_6367 - PLACE
      ?auto_6369 - PLACE
      ?auto_6370 - HOIST
      ?auto_6371 - SURFACE
      ?auto_6368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6366 ?auto_6367 ) ( SURFACE-AT ?auto_6364 ?auto_6367 ) ( CLEAR ?auto_6364 ) ( IS-CRATE ?auto_6365 ) ( AVAILABLE ?auto_6366 ) ( not ( = ?auto_6369 ?auto_6367 ) ) ( HOIST-AT ?auto_6370 ?auto_6369 ) ( AVAILABLE ?auto_6370 ) ( SURFACE-AT ?auto_6365 ?auto_6369 ) ( ON ?auto_6365 ?auto_6371 ) ( CLEAR ?auto_6365 ) ( TRUCK-AT ?auto_6368 ?auto_6367 ) ( not ( = ?auto_6364 ?auto_6365 ) ) ( not ( = ?auto_6364 ?auto_6371 ) ) ( not ( = ?auto_6365 ?auto_6371 ) ) ( not ( = ?auto_6366 ?auto_6370 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6368 ?auto_6367 ?auto_6369 )
      ( !LIFT ?auto_6370 ?auto_6365 ?auto_6371 ?auto_6369 )
      ( !LOAD ?auto_6370 ?auto_6365 ?auto_6368 ?auto_6369 )
      ( !DRIVE ?auto_6368 ?auto_6369 ?auto_6367 )
      ( !UNLOAD ?auto_6366 ?auto_6365 ?auto_6368 ?auto_6367 )
      ( !DROP ?auto_6366 ?auto_6365 ?auto_6364 ?auto_6367 )
      ( MAKE-1CRATE-VERIFY ?auto_6364 ?auto_6365 ) )
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
      ?auto_6386 - PLACE
      ?auto_6388 - PLACE
      ?auto_6389 - HOIST
      ?auto_6387 - SURFACE
      ?auto_6396 - PLACE
      ?auto_6399 - HOIST
      ?auto_6393 - SURFACE
      ?auto_6390 - PLACE
      ?auto_6398 - HOIST
      ?auto_6391 - SURFACE
      ?auto_6394 - PLACE
      ?auto_6392 - HOIST
      ?auto_6395 - SURFACE
      ?auto_6397 - SURFACE
      ?auto_6385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6384 ?auto_6386 ) ( IS-CRATE ?auto_6383 ) ( not ( = ?auto_6388 ?auto_6386 ) ) ( HOIST-AT ?auto_6389 ?auto_6388 ) ( AVAILABLE ?auto_6389 ) ( SURFACE-AT ?auto_6383 ?auto_6388 ) ( ON ?auto_6383 ?auto_6387 ) ( CLEAR ?auto_6383 ) ( not ( = ?auto_6382 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6387 ) ) ( not ( = ?auto_6383 ?auto_6387 ) ) ( not ( = ?auto_6384 ?auto_6389 ) ) ( IS-CRATE ?auto_6382 ) ( not ( = ?auto_6396 ?auto_6386 ) ) ( HOIST-AT ?auto_6399 ?auto_6396 ) ( AVAILABLE ?auto_6399 ) ( SURFACE-AT ?auto_6382 ?auto_6396 ) ( ON ?auto_6382 ?auto_6393 ) ( CLEAR ?auto_6382 ) ( not ( = ?auto_6381 ?auto_6382 ) ) ( not ( = ?auto_6381 ?auto_6393 ) ) ( not ( = ?auto_6382 ?auto_6393 ) ) ( not ( = ?auto_6384 ?auto_6399 ) ) ( IS-CRATE ?auto_6381 ) ( not ( = ?auto_6390 ?auto_6386 ) ) ( HOIST-AT ?auto_6398 ?auto_6390 ) ( AVAILABLE ?auto_6398 ) ( SURFACE-AT ?auto_6381 ?auto_6390 ) ( ON ?auto_6381 ?auto_6391 ) ( CLEAR ?auto_6381 ) ( not ( = ?auto_6380 ?auto_6381 ) ) ( not ( = ?auto_6380 ?auto_6391 ) ) ( not ( = ?auto_6381 ?auto_6391 ) ) ( not ( = ?auto_6384 ?auto_6398 ) ) ( IS-CRATE ?auto_6380 ) ( not ( = ?auto_6394 ?auto_6386 ) ) ( HOIST-AT ?auto_6392 ?auto_6394 ) ( SURFACE-AT ?auto_6380 ?auto_6394 ) ( ON ?auto_6380 ?auto_6395 ) ( CLEAR ?auto_6380 ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( not ( = ?auto_6379 ?auto_6395 ) ) ( not ( = ?auto_6380 ?auto_6395 ) ) ( not ( = ?auto_6384 ?auto_6392 ) ) ( SURFACE-AT ?auto_6378 ?auto_6386 ) ( CLEAR ?auto_6378 ) ( IS-CRATE ?auto_6379 ) ( AVAILABLE ?auto_6384 ) ( AVAILABLE ?auto_6392 ) ( SURFACE-AT ?auto_6379 ?auto_6394 ) ( ON ?auto_6379 ?auto_6397 ) ( CLEAR ?auto_6379 ) ( TRUCK-AT ?auto_6385 ?auto_6386 ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6378 ?auto_6397 ) ) ( not ( = ?auto_6379 ?auto_6397 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6395 ) ) ( not ( = ?auto_6380 ?auto_6397 ) ) ( not ( = ?auto_6395 ?auto_6397 ) ) ( not ( = ?auto_6378 ?auto_6381 ) ) ( not ( = ?auto_6378 ?auto_6391 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6391 ) ) ( not ( = ?auto_6381 ?auto_6395 ) ) ( not ( = ?auto_6381 ?auto_6397 ) ) ( not ( = ?auto_6390 ?auto_6394 ) ) ( not ( = ?auto_6398 ?auto_6392 ) ) ( not ( = ?auto_6391 ?auto_6395 ) ) ( not ( = ?auto_6391 ?auto_6397 ) ) ( not ( = ?auto_6378 ?auto_6382 ) ) ( not ( = ?auto_6378 ?auto_6393 ) ) ( not ( = ?auto_6379 ?auto_6382 ) ) ( not ( = ?auto_6379 ?auto_6393 ) ) ( not ( = ?auto_6380 ?auto_6382 ) ) ( not ( = ?auto_6380 ?auto_6393 ) ) ( not ( = ?auto_6382 ?auto_6391 ) ) ( not ( = ?auto_6382 ?auto_6395 ) ) ( not ( = ?auto_6382 ?auto_6397 ) ) ( not ( = ?auto_6396 ?auto_6390 ) ) ( not ( = ?auto_6396 ?auto_6394 ) ) ( not ( = ?auto_6399 ?auto_6398 ) ) ( not ( = ?auto_6399 ?auto_6392 ) ) ( not ( = ?auto_6393 ?auto_6391 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6393 ?auto_6397 ) ) ( not ( = ?auto_6378 ?auto_6383 ) ) ( not ( = ?auto_6378 ?auto_6387 ) ) ( not ( = ?auto_6379 ?auto_6383 ) ) ( not ( = ?auto_6379 ?auto_6387 ) ) ( not ( = ?auto_6380 ?auto_6383 ) ) ( not ( = ?auto_6380 ?auto_6387 ) ) ( not ( = ?auto_6381 ?auto_6383 ) ) ( not ( = ?auto_6381 ?auto_6387 ) ) ( not ( = ?auto_6383 ?auto_6393 ) ) ( not ( = ?auto_6383 ?auto_6391 ) ) ( not ( = ?auto_6383 ?auto_6395 ) ) ( not ( = ?auto_6383 ?auto_6397 ) ) ( not ( = ?auto_6388 ?auto_6396 ) ) ( not ( = ?auto_6388 ?auto_6390 ) ) ( not ( = ?auto_6388 ?auto_6394 ) ) ( not ( = ?auto_6389 ?auto_6399 ) ) ( not ( = ?auto_6389 ?auto_6398 ) ) ( not ( = ?auto_6389 ?auto_6392 ) ) ( not ( = ?auto_6387 ?auto_6393 ) ) ( not ( = ?auto_6387 ?auto_6391 ) ) ( not ( = ?auto_6387 ?auto_6395 ) ) ( not ( = ?auto_6387 ?auto_6397 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6378 ?auto_6379 ?auto_6380 ?auto_6381 ?auto_6382 )
      ( MAKE-1CRATE ?auto_6382 ?auto_6383 )
      ( MAKE-5CRATE-VERIFY ?auto_6378 ?auto_6379 ?auto_6380 ?auto_6381 ?auto_6382 ?auto_6383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6402 - SURFACE
      ?auto_6403 - SURFACE
    )
    :vars
    (
      ?auto_6404 - HOIST
      ?auto_6405 - PLACE
      ?auto_6407 - PLACE
      ?auto_6408 - HOIST
      ?auto_6409 - SURFACE
      ?auto_6406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6404 ?auto_6405 ) ( SURFACE-AT ?auto_6402 ?auto_6405 ) ( CLEAR ?auto_6402 ) ( IS-CRATE ?auto_6403 ) ( AVAILABLE ?auto_6404 ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( HOIST-AT ?auto_6408 ?auto_6407 ) ( AVAILABLE ?auto_6408 ) ( SURFACE-AT ?auto_6403 ?auto_6407 ) ( ON ?auto_6403 ?auto_6409 ) ( CLEAR ?auto_6403 ) ( TRUCK-AT ?auto_6406 ?auto_6405 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6409 ) ) ( not ( = ?auto_6403 ?auto_6409 ) ) ( not ( = ?auto_6404 ?auto_6408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6406 ?auto_6405 ?auto_6407 )
      ( !LIFT ?auto_6408 ?auto_6403 ?auto_6409 ?auto_6407 )
      ( !LOAD ?auto_6408 ?auto_6403 ?auto_6406 ?auto_6407 )
      ( !DRIVE ?auto_6406 ?auto_6407 ?auto_6405 )
      ( !UNLOAD ?auto_6404 ?auto_6403 ?auto_6406 ?auto_6405 )
      ( !DROP ?auto_6404 ?auto_6403 ?auto_6402 ?auto_6405 )
      ( MAKE-1CRATE-VERIFY ?auto_6402 ?auto_6403 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6417 - SURFACE
      ?auto_6418 - SURFACE
      ?auto_6419 - SURFACE
      ?auto_6420 - SURFACE
      ?auto_6421 - SURFACE
      ?auto_6423 - SURFACE
      ?auto_6422 - SURFACE
    )
    :vars
    (
      ?auto_6428 - HOIST
      ?auto_6429 - PLACE
      ?auto_6427 - PLACE
      ?auto_6426 - HOIST
      ?auto_6425 - SURFACE
      ?auto_6431 - PLACE
      ?auto_6439 - HOIST
      ?auto_6432 - SURFACE
      ?auto_6433 - SURFACE
      ?auto_6438 - PLACE
      ?auto_6434 - HOIST
      ?auto_6440 - SURFACE
      ?auto_6430 - PLACE
      ?auto_6437 - HOIST
      ?auto_6435 - SURFACE
      ?auto_6436 - SURFACE
      ?auto_6424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6428 ?auto_6429 ) ( IS-CRATE ?auto_6422 ) ( not ( = ?auto_6427 ?auto_6429 ) ) ( HOIST-AT ?auto_6426 ?auto_6427 ) ( SURFACE-AT ?auto_6422 ?auto_6427 ) ( ON ?auto_6422 ?auto_6425 ) ( CLEAR ?auto_6422 ) ( not ( = ?auto_6423 ?auto_6422 ) ) ( not ( = ?auto_6423 ?auto_6425 ) ) ( not ( = ?auto_6422 ?auto_6425 ) ) ( not ( = ?auto_6428 ?auto_6426 ) ) ( IS-CRATE ?auto_6423 ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( HOIST-AT ?auto_6439 ?auto_6431 ) ( AVAILABLE ?auto_6439 ) ( SURFACE-AT ?auto_6423 ?auto_6431 ) ( ON ?auto_6423 ?auto_6432 ) ( CLEAR ?auto_6423 ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6432 ) ) ( not ( = ?auto_6423 ?auto_6432 ) ) ( not ( = ?auto_6428 ?auto_6439 ) ) ( IS-CRATE ?auto_6421 ) ( AVAILABLE ?auto_6426 ) ( SURFACE-AT ?auto_6421 ?auto_6427 ) ( ON ?auto_6421 ?auto_6433 ) ( CLEAR ?auto_6421 ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6433 ) ) ( not ( = ?auto_6421 ?auto_6433 ) ) ( IS-CRATE ?auto_6420 ) ( not ( = ?auto_6438 ?auto_6429 ) ) ( HOIST-AT ?auto_6434 ?auto_6438 ) ( AVAILABLE ?auto_6434 ) ( SURFACE-AT ?auto_6420 ?auto_6438 ) ( ON ?auto_6420 ?auto_6440 ) ( CLEAR ?auto_6420 ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6440 ) ) ( not ( = ?auto_6420 ?auto_6440 ) ) ( not ( = ?auto_6428 ?auto_6434 ) ) ( IS-CRATE ?auto_6419 ) ( not ( = ?auto_6430 ?auto_6429 ) ) ( HOIST-AT ?auto_6437 ?auto_6430 ) ( SURFACE-AT ?auto_6419 ?auto_6430 ) ( ON ?auto_6419 ?auto_6435 ) ( CLEAR ?auto_6419 ) ( not ( = ?auto_6418 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6435 ) ) ( not ( = ?auto_6419 ?auto_6435 ) ) ( not ( = ?auto_6428 ?auto_6437 ) ) ( SURFACE-AT ?auto_6417 ?auto_6429 ) ( CLEAR ?auto_6417 ) ( IS-CRATE ?auto_6418 ) ( AVAILABLE ?auto_6428 ) ( AVAILABLE ?auto_6437 ) ( SURFACE-AT ?auto_6418 ?auto_6430 ) ( ON ?auto_6418 ?auto_6436 ) ( CLEAR ?auto_6418 ) ( TRUCK-AT ?auto_6424 ?auto_6429 ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6436 ) ) ( not ( = ?auto_6418 ?auto_6436 ) ) ( not ( = ?auto_6417 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6435 ) ) ( not ( = ?auto_6419 ?auto_6436 ) ) ( not ( = ?auto_6435 ?auto_6436 ) ) ( not ( = ?auto_6417 ?auto_6420 ) ) ( not ( = ?auto_6417 ?auto_6440 ) ) ( not ( = ?auto_6418 ?auto_6420 ) ) ( not ( = ?auto_6418 ?auto_6440 ) ) ( not ( = ?auto_6420 ?auto_6435 ) ) ( not ( = ?auto_6420 ?auto_6436 ) ) ( not ( = ?auto_6438 ?auto_6430 ) ) ( not ( = ?auto_6434 ?auto_6437 ) ) ( not ( = ?auto_6440 ?auto_6435 ) ) ( not ( = ?auto_6440 ?auto_6436 ) ) ( not ( = ?auto_6417 ?auto_6421 ) ) ( not ( = ?auto_6417 ?auto_6433 ) ) ( not ( = ?auto_6418 ?auto_6421 ) ) ( not ( = ?auto_6418 ?auto_6433 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6433 ) ) ( not ( = ?auto_6421 ?auto_6440 ) ) ( not ( = ?auto_6421 ?auto_6435 ) ) ( not ( = ?auto_6421 ?auto_6436 ) ) ( not ( = ?auto_6427 ?auto_6438 ) ) ( not ( = ?auto_6427 ?auto_6430 ) ) ( not ( = ?auto_6426 ?auto_6434 ) ) ( not ( = ?auto_6426 ?auto_6437 ) ) ( not ( = ?auto_6433 ?auto_6440 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6433 ?auto_6436 ) ) ( not ( = ?auto_6417 ?auto_6423 ) ) ( not ( = ?auto_6417 ?auto_6432 ) ) ( not ( = ?auto_6418 ?auto_6423 ) ) ( not ( = ?auto_6418 ?auto_6432 ) ) ( not ( = ?auto_6419 ?auto_6423 ) ) ( not ( = ?auto_6419 ?auto_6432 ) ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( not ( = ?auto_6420 ?auto_6432 ) ) ( not ( = ?auto_6423 ?auto_6433 ) ) ( not ( = ?auto_6423 ?auto_6440 ) ) ( not ( = ?auto_6423 ?auto_6435 ) ) ( not ( = ?auto_6423 ?auto_6436 ) ) ( not ( = ?auto_6431 ?auto_6427 ) ) ( not ( = ?auto_6431 ?auto_6438 ) ) ( not ( = ?auto_6431 ?auto_6430 ) ) ( not ( = ?auto_6439 ?auto_6426 ) ) ( not ( = ?auto_6439 ?auto_6434 ) ) ( not ( = ?auto_6439 ?auto_6437 ) ) ( not ( = ?auto_6432 ?auto_6433 ) ) ( not ( = ?auto_6432 ?auto_6440 ) ) ( not ( = ?auto_6432 ?auto_6435 ) ) ( not ( = ?auto_6432 ?auto_6436 ) ) ( not ( = ?auto_6417 ?auto_6422 ) ) ( not ( = ?auto_6417 ?auto_6425 ) ) ( not ( = ?auto_6418 ?auto_6422 ) ) ( not ( = ?auto_6418 ?auto_6425 ) ) ( not ( = ?auto_6419 ?auto_6422 ) ) ( not ( = ?auto_6419 ?auto_6425 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( not ( = ?auto_6420 ?auto_6425 ) ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6425 ) ) ( not ( = ?auto_6422 ?auto_6432 ) ) ( not ( = ?auto_6422 ?auto_6433 ) ) ( not ( = ?auto_6422 ?auto_6440 ) ) ( not ( = ?auto_6422 ?auto_6435 ) ) ( not ( = ?auto_6422 ?auto_6436 ) ) ( not ( = ?auto_6425 ?auto_6432 ) ) ( not ( = ?auto_6425 ?auto_6433 ) ) ( not ( = ?auto_6425 ?auto_6440 ) ) ( not ( = ?auto_6425 ?auto_6435 ) ) ( not ( = ?auto_6425 ?auto_6436 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6417 ?auto_6418 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6423 )
      ( MAKE-1CRATE ?auto_6423 ?auto_6422 )
      ( MAKE-6CRATE-VERIFY ?auto_6417 ?auto_6418 ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6423 ?auto_6422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6443 - SURFACE
      ?auto_6444 - SURFACE
    )
    :vars
    (
      ?auto_6445 - HOIST
      ?auto_6446 - PLACE
      ?auto_6448 - PLACE
      ?auto_6449 - HOIST
      ?auto_6450 - SURFACE
      ?auto_6447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6445 ?auto_6446 ) ( SURFACE-AT ?auto_6443 ?auto_6446 ) ( CLEAR ?auto_6443 ) ( IS-CRATE ?auto_6444 ) ( AVAILABLE ?auto_6445 ) ( not ( = ?auto_6448 ?auto_6446 ) ) ( HOIST-AT ?auto_6449 ?auto_6448 ) ( AVAILABLE ?auto_6449 ) ( SURFACE-AT ?auto_6444 ?auto_6448 ) ( ON ?auto_6444 ?auto_6450 ) ( CLEAR ?auto_6444 ) ( TRUCK-AT ?auto_6447 ?auto_6446 ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6450 ) ) ( not ( = ?auto_6444 ?auto_6450 ) ) ( not ( = ?auto_6445 ?auto_6449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6447 ?auto_6446 ?auto_6448 )
      ( !LIFT ?auto_6449 ?auto_6444 ?auto_6450 ?auto_6448 )
      ( !LOAD ?auto_6449 ?auto_6444 ?auto_6447 ?auto_6448 )
      ( !DRIVE ?auto_6447 ?auto_6448 ?auto_6446 )
      ( !UNLOAD ?auto_6445 ?auto_6444 ?auto_6447 ?auto_6446 )
      ( !DROP ?auto_6445 ?auto_6444 ?auto_6443 ?auto_6446 )
      ( MAKE-1CRATE-VERIFY ?auto_6443 ?auto_6444 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
      ?auto_6461 - SURFACE
      ?auto_6462 - SURFACE
      ?auto_6463 - SURFACE
      ?auto_6465 - SURFACE
      ?auto_6464 - SURFACE
      ?auto_6466 - SURFACE
    )
    :vars
    (
      ?auto_6472 - HOIST
      ?auto_6467 - PLACE
      ?auto_6471 - PLACE
      ?auto_6470 - HOIST
      ?auto_6469 - SURFACE
      ?auto_6481 - PLACE
      ?auto_6474 - HOIST
      ?auto_6475 - SURFACE
      ?auto_6482 - PLACE
      ?auto_6477 - HOIST
      ?auto_6483 - SURFACE
      ?auto_6473 - SURFACE
      ?auto_6476 - SURFACE
      ?auto_6484 - PLACE
      ?auto_6478 - HOIST
      ?auto_6480 - SURFACE
      ?auto_6479 - SURFACE
      ?auto_6468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6472 ?auto_6467 ) ( IS-CRATE ?auto_6466 ) ( not ( = ?auto_6471 ?auto_6467 ) ) ( HOIST-AT ?auto_6470 ?auto_6471 ) ( SURFACE-AT ?auto_6466 ?auto_6471 ) ( ON ?auto_6466 ?auto_6469 ) ( CLEAR ?auto_6466 ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( not ( = ?auto_6464 ?auto_6469 ) ) ( not ( = ?auto_6466 ?auto_6469 ) ) ( not ( = ?auto_6472 ?auto_6470 ) ) ( IS-CRATE ?auto_6464 ) ( not ( = ?auto_6481 ?auto_6467 ) ) ( HOIST-AT ?auto_6474 ?auto_6481 ) ( SURFACE-AT ?auto_6464 ?auto_6481 ) ( ON ?auto_6464 ?auto_6475 ) ( CLEAR ?auto_6464 ) ( not ( = ?auto_6465 ?auto_6464 ) ) ( not ( = ?auto_6465 ?auto_6475 ) ) ( not ( = ?auto_6464 ?auto_6475 ) ) ( not ( = ?auto_6472 ?auto_6474 ) ) ( IS-CRATE ?auto_6465 ) ( not ( = ?auto_6482 ?auto_6467 ) ) ( HOIST-AT ?auto_6477 ?auto_6482 ) ( AVAILABLE ?auto_6477 ) ( SURFACE-AT ?auto_6465 ?auto_6482 ) ( ON ?auto_6465 ?auto_6483 ) ( CLEAR ?auto_6465 ) ( not ( = ?auto_6463 ?auto_6465 ) ) ( not ( = ?auto_6463 ?auto_6483 ) ) ( not ( = ?auto_6465 ?auto_6483 ) ) ( not ( = ?auto_6472 ?auto_6477 ) ) ( IS-CRATE ?auto_6463 ) ( AVAILABLE ?auto_6474 ) ( SURFACE-AT ?auto_6463 ?auto_6481 ) ( ON ?auto_6463 ?auto_6473 ) ( CLEAR ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6463 ) ) ( not ( = ?auto_6462 ?auto_6473 ) ) ( not ( = ?auto_6463 ?auto_6473 ) ) ( IS-CRATE ?auto_6462 ) ( AVAILABLE ?auto_6470 ) ( SURFACE-AT ?auto_6462 ?auto_6471 ) ( ON ?auto_6462 ?auto_6476 ) ( CLEAR ?auto_6462 ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6476 ) ) ( not ( = ?auto_6462 ?auto_6476 ) ) ( IS-CRATE ?auto_6461 ) ( not ( = ?auto_6484 ?auto_6467 ) ) ( HOIST-AT ?auto_6478 ?auto_6484 ) ( SURFACE-AT ?auto_6461 ?auto_6484 ) ( ON ?auto_6461 ?auto_6480 ) ( CLEAR ?auto_6461 ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6480 ) ) ( not ( = ?auto_6461 ?auto_6480 ) ) ( not ( = ?auto_6472 ?auto_6478 ) ) ( SURFACE-AT ?auto_6459 ?auto_6467 ) ( CLEAR ?auto_6459 ) ( IS-CRATE ?auto_6460 ) ( AVAILABLE ?auto_6472 ) ( AVAILABLE ?auto_6478 ) ( SURFACE-AT ?auto_6460 ?auto_6484 ) ( ON ?auto_6460 ?auto_6479 ) ( CLEAR ?auto_6460 ) ( TRUCK-AT ?auto_6468 ?auto_6467 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6459 ?auto_6479 ) ) ( not ( = ?auto_6460 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6459 ?auto_6480 ) ) ( not ( = ?auto_6461 ?auto_6479 ) ) ( not ( = ?auto_6480 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) ( not ( = ?auto_6459 ?auto_6476 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( not ( = ?auto_6460 ?auto_6476 ) ) ( not ( = ?auto_6462 ?auto_6480 ) ) ( not ( = ?auto_6462 ?auto_6479 ) ) ( not ( = ?auto_6471 ?auto_6484 ) ) ( not ( = ?auto_6470 ?auto_6478 ) ) ( not ( = ?auto_6476 ?auto_6480 ) ) ( not ( = ?auto_6476 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6463 ) ) ( not ( = ?auto_6459 ?auto_6473 ) ) ( not ( = ?auto_6460 ?auto_6463 ) ) ( not ( = ?auto_6460 ?auto_6473 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6473 ) ) ( not ( = ?auto_6463 ?auto_6476 ) ) ( not ( = ?auto_6463 ?auto_6480 ) ) ( not ( = ?auto_6463 ?auto_6479 ) ) ( not ( = ?auto_6481 ?auto_6471 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6474 ?auto_6470 ) ) ( not ( = ?auto_6474 ?auto_6478 ) ) ( not ( = ?auto_6473 ?auto_6476 ) ) ( not ( = ?auto_6473 ?auto_6480 ) ) ( not ( = ?auto_6473 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6465 ) ) ( not ( = ?auto_6459 ?auto_6483 ) ) ( not ( = ?auto_6460 ?auto_6465 ) ) ( not ( = ?auto_6460 ?auto_6483 ) ) ( not ( = ?auto_6461 ?auto_6465 ) ) ( not ( = ?auto_6461 ?auto_6483 ) ) ( not ( = ?auto_6462 ?auto_6465 ) ) ( not ( = ?auto_6462 ?auto_6483 ) ) ( not ( = ?auto_6465 ?auto_6473 ) ) ( not ( = ?auto_6465 ?auto_6476 ) ) ( not ( = ?auto_6465 ?auto_6480 ) ) ( not ( = ?auto_6465 ?auto_6479 ) ) ( not ( = ?auto_6482 ?auto_6481 ) ) ( not ( = ?auto_6482 ?auto_6471 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6477 ?auto_6474 ) ) ( not ( = ?auto_6477 ?auto_6470 ) ) ( not ( = ?auto_6477 ?auto_6478 ) ) ( not ( = ?auto_6483 ?auto_6473 ) ) ( not ( = ?auto_6483 ?auto_6476 ) ) ( not ( = ?auto_6483 ?auto_6480 ) ) ( not ( = ?auto_6483 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6464 ) ) ( not ( = ?auto_6459 ?auto_6475 ) ) ( not ( = ?auto_6460 ?auto_6464 ) ) ( not ( = ?auto_6460 ?auto_6475 ) ) ( not ( = ?auto_6461 ?auto_6464 ) ) ( not ( = ?auto_6461 ?auto_6475 ) ) ( not ( = ?auto_6462 ?auto_6464 ) ) ( not ( = ?auto_6462 ?auto_6475 ) ) ( not ( = ?auto_6463 ?auto_6464 ) ) ( not ( = ?auto_6463 ?auto_6475 ) ) ( not ( = ?auto_6464 ?auto_6483 ) ) ( not ( = ?auto_6464 ?auto_6473 ) ) ( not ( = ?auto_6464 ?auto_6476 ) ) ( not ( = ?auto_6464 ?auto_6480 ) ) ( not ( = ?auto_6464 ?auto_6479 ) ) ( not ( = ?auto_6475 ?auto_6483 ) ) ( not ( = ?auto_6475 ?auto_6473 ) ) ( not ( = ?auto_6475 ?auto_6476 ) ) ( not ( = ?auto_6475 ?auto_6480 ) ) ( not ( = ?auto_6475 ?auto_6479 ) ) ( not ( = ?auto_6459 ?auto_6466 ) ) ( not ( = ?auto_6459 ?auto_6469 ) ) ( not ( = ?auto_6460 ?auto_6466 ) ) ( not ( = ?auto_6460 ?auto_6469 ) ) ( not ( = ?auto_6461 ?auto_6466 ) ) ( not ( = ?auto_6461 ?auto_6469 ) ) ( not ( = ?auto_6462 ?auto_6466 ) ) ( not ( = ?auto_6462 ?auto_6469 ) ) ( not ( = ?auto_6463 ?auto_6466 ) ) ( not ( = ?auto_6463 ?auto_6469 ) ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6469 ) ) ( not ( = ?auto_6466 ?auto_6475 ) ) ( not ( = ?auto_6466 ?auto_6483 ) ) ( not ( = ?auto_6466 ?auto_6473 ) ) ( not ( = ?auto_6466 ?auto_6476 ) ) ( not ( = ?auto_6466 ?auto_6480 ) ) ( not ( = ?auto_6466 ?auto_6479 ) ) ( not ( = ?auto_6469 ?auto_6475 ) ) ( not ( = ?auto_6469 ?auto_6483 ) ) ( not ( = ?auto_6469 ?auto_6473 ) ) ( not ( = ?auto_6469 ?auto_6476 ) ) ( not ( = ?auto_6469 ?auto_6480 ) ) ( not ( = ?auto_6469 ?auto_6479 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ?auto_6465 ?auto_6464 )
      ( MAKE-1CRATE ?auto_6464 ?auto_6466 )
      ( MAKE-7CRATE-VERIFY ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ?auto_6465 ?auto_6464 ?auto_6466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6487 - SURFACE
      ?auto_6488 - SURFACE
    )
    :vars
    (
      ?auto_6489 - HOIST
      ?auto_6490 - PLACE
      ?auto_6492 - PLACE
      ?auto_6493 - HOIST
      ?auto_6494 - SURFACE
      ?auto_6491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6489 ?auto_6490 ) ( SURFACE-AT ?auto_6487 ?auto_6490 ) ( CLEAR ?auto_6487 ) ( IS-CRATE ?auto_6488 ) ( AVAILABLE ?auto_6489 ) ( not ( = ?auto_6492 ?auto_6490 ) ) ( HOIST-AT ?auto_6493 ?auto_6492 ) ( AVAILABLE ?auto_6493 ) ( SURFACE-AT ?auto_6488 ?auto_6492 ) ( ON ?auto_6488 ?auto_6494 ) ( CLEAR ?auto_6488 ) ( TRUCK-AT ?auto_6491 ?auto_6490 ) ( not ( = ?auto_6487 ?auto_6488 ) ) ( not ( = ?auto_6487 ?auto_6494 ) ) ( not ( = ?auto_6488 ?auto_6494 ) ) ( not ( = ?auto_6489 ?auto_6493 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6491 ?auto_6490 ?auto_6492 )
      ( !LIFT ?auto_6493 ?auto_6488 ?auto_6494 ?auto_6492 )
      ( !LOAD ?auto_6493 ?auto_6488 ?auto_6491 ?auto_6492 )
      ( !DRIVE ?auto_6491 ?auto_6492 ?auto_6490 )
      ( !UNLOAD ?auto_6489 ?auto_6488 ?auto_6491 ?auto_6490 )
      ( !DROP ?auto_6489 ?auto_6488 ?auto_6487 ?auto_6490 )
      ( MAKE-1CRATE-VERIFY ?auto_6487 ?auto_6488 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6504 - SURFACE
      ?auto_6505 - SURFACE
      ?auto_6506 - SURFACE
      ?auto_6507 - SURFACE
      ?auto_6508 - SURFACE
      ?auto_6510 - SURFACE
      ?auto_6509 - SURFACE
      ?auto_6512 - SURFACE
      ?auto_6511 - SURFACE
    )
    :vars
    (
      ?auto_6515 - HOIST
      ?auto_6514 - PLACE
      ?auto_6513 - PLACE
      ?auto_6516 - HOIST
      ?auto_6517 - SURFACE
      ?auto_6519 - PLACE
      ?auto_6520 - HOIST
      ?auto_6521 - SURFACE
      ?auto_6526 - PLACE
      ?auto_6523 - HOIST
      ?auto_6524 - SURFACE
      ?auto_6528 - PLACE
      ?auto_6533 - HOIST
      ?auto_6527 - SURFACE
      ?auto_6525 - SURFACE
      ?auto_6522 - SURFACE
      ?auto_6529 - PLACE
      ?auto_6532 - HOIST
      ?auto_6530 - SURFACE
      ?auto_6531 - SURFACE
      ?auto_6518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6515 ?auto_6514 ) ( IS-CRATE ?auto_6511 ) ( not ( = ?auto_6513 ?auto_6514 ) ) ( HOIST-AT ?auto_6516 ?auto_6513 ) ( AVAILABLE ?auto_6516 ) ( SURFACE-AT ?auto_6511 ?auto_6513 ) ( ON ?auto_6511 ?auto_6517 ) ( CLEAR ?auto_6511 ) ( not ( = ?auto_6512 ?auto_6511 ) ) ( not ( = ?auto_6512 ?auto_6517 ) ) ( not ( = ?auto_6511 ?auto_6517 ) ) ( not ( = ?auto_6515 ?auto_6516 ) ) ( IS-CRATE ?auto_6512 ) ( not ( = ?auto_6519 ?auto_6514 ) ) ( HOIST-AT ?auto_6520 ?auto_6519 ) ( SURFACE-AT ?auto_6512 ?auto_6519 ) ( ON ?auto_6512 ?auto_6521 ) ( CLEAR ?auto_6512 ) ( not ( = ?auto_6509 ?auto_6512 ) ) ( not ( = ?auto_6509 ?auto_6521 ) ) ( not ( = ?auto_6512 ?auto_6521 ) ) ( not ( = ?auto_6515 ?auto_6520 ) ) ( IS-CRATE ?auto_6509 ) ( not ( = ?auto_6526 ?auto_6514 ) ) ( HOIST-AT ?auto_6523 ?auto_6526 ) ( SURFACE-AT ?auto_6509 ?auto_6526 ) ( ON ?auto_6509 ?auto_6524 ) ( CLEAR ?auto_6509 ) ( not ( = ?auto_6510 ?auto_6509 ) ) ( not ( = ?auto_6510 ?auto_6524 ) ) ( not ( = ?auto_6509 ?auto_6524 ) ) ( not ( = ?auto_6515 ?auto_6523 ) ) ( IS-CRATE ?auto_6510 ) ( not ( = ?auto_6528 ?auto_6514 ) ) ( HOIST-AT ?auto_6533 ?auto_6528 ) ( AVAILABLE ?auto_6533 ) ( SURFACE-AT ?auto_6510 ?auto_6528 ) ( ON ?auto_6510 ?auto_6527 ) ( CLEAR ?auto_6510 ) ( not ( = ?auto_6508 ?auto_6510 ) ) ( not ( = ?auto_6508 ?auto_6527 ) ) ( not ( = ?auto_6510 ?auto_6527 ) ) ( not ( = ?auto_6515 ?auto_6533 ) ) ( IS-CRATE ?auto_6508 ) ( AVAILABLE ?auto_6523 ) ( SURFACE-AT ?auto_6508 ?auto_6526 ) ( ON ?auto_6508 ?auto_6525 ) ( CLEAR ?auto_6508 ) ( not ( = ?auto_6507 ?auto_6508 ) ) ( not ( = ?auto_6507 ?auto_6525 ) ) ( not ( = ?auto_6508 ?auto_6525 ) ) ( IS-CRATE ?auto_6507 ) ( AVAILABLE ?auto_6520 ) ( SURFACE-AT ?auto_6507 ?auto_6519 ) ( ON ?auto_6507 ?auto_6522 ) ( CLEAR ?auto_6507 ) ( not ( = ?auto_6506 ?auto_6507 ) ) ( not ( = ?auto_6506 ?auto_6522 ) ) ( not ( = ?auto_6507 ?auto_6522 ) ) ( IS-CRATE ?auto_6506 ) ( not ( = ?auto_6529 ?auto_6514 ) ) ( HOIST-AT ?auto_6532 ?auto_6529 ) ( SURFACE-AT ?auto_6506 ?auto_6529 ) ( ON ?auto_6506 ?auto_6530 ) ( CLEAR ?auto_6506 ) ( not ( = ?auto_6505 ?auto_6506 ) ) ( not ( = ?auto_6505 ?auto_6530 ) ) ( not ( = ?auto_6506 ?auto_6530 ) ) ( not ( = ?auto_6515 ?auto_6532 ) ) ( SURFACE-AT ?auto_6504 ?auto_6514 ) ( CLEAR ?auto_6504 ) ( IS-CRATE ?auto_6505 ) ( AVAILABLE ?auto_6515 ) ( AVAILABLE ?auto_6532 ) ( SURFACE-AT ?auto_6505 ?auto_6529 ) ( ON ?auto_6505 ?auto_6531 ) ( CLEAR ?auto_6505 ) ( TRUCK-AT ?auto_6518 ?auto_6514 ) ( not ( = ?auto_6504 ?auto_6505 ) ) ( not ( = ?auto_6504 ?auto_6531 ) ) ( not ( = ?auto_6505 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6506 ) ) ( not ( = ?auto_6504 ?auto_6530 ) ) ( not ( = ?auto_6506 ?auto_6531 ) ) ( not ( = ?auto_6530 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6507 ) ) ( not ( = ?auto_6504 ?auto_6522 ) ) ( not ( = ?auto_6505 ?auto_6507 ) ) ( not ( = ?auto_6505 ?auto_6522 ) ) ( not ( = ?auto_6507 ?auto_6530 ) ) ( not ( = ?auto_6507 ?auto_6531 ) ) ( not ( = ?auto_6519 ?auto_6529 ) ) ( not ( = ?auto_6520 ?auto_6532 ) ) ( not ( = ?auto_6522 ?auto_6530 ) ) ( not ( = ?auto_6522 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6508 ) ) ( not ( = ?auto_6504 ?auto_6525 ) ) ( not ( = ?auto_6505 ?auto_6508 ) ) ( not ( = ?auto_6505 ?auto_6525 ) ) ( not ( = ?auto_6506 ?auto_6508 ) ) ( not ( = ?auto_6506 ?auto_6525 ) ) ( not ( = ?auto_6508 ?auto_6522 ) ) ( not ( = ?auto_6508 ?auto_6530 ) ) ( not ( = ?auto_6508 ?auto_6531 ) ) ( not ( = ?auto_6526 ?auto_6519 ) ) ( not ( = ?auto_6526 ?auto_6529 ) ) ( not ( = ?auto_6523 ?auto_6520 ) ) ( not ( = ?auto_6523 ?auto_6532 ) ) ( not ( = ?auto_6525 ?auto_6522 ) ) ( not ( = ?auto_6525 ?auto_6530 ) ) ( not ( = ?auto_6525 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6510 ) ) ( not ( = ?auto_6504 ?auto_6527 ) ) ( not ( = ?auto_6505 ?auto_6510 ) ) ( not ( = ?auto_6505 ?auto_6527 ) ) ( not ( = ?auto_6506 ?auto_6510 ) ) ( not ( = ?auto_6506 ?auto_6527 ) ) ( not ( = ?auto_6507 ?auto_6510 ) ) ( not ( = ?auto_6507 ?auto_6527 ) ) ( not ( = ?auto_6510 ?auto_6525 ) ) ( not ( = ?auto_6510 ?auto_6522 ) ) ( not ( = ?auto_6510 ?auto_6530 ) ) ( not ( = ?auto_6510 ?auto_6531 ) ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( not ( = ?auto_6528 ?auto_6519 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6533 ?auto_6523 ) ) ( not ( = ?auto_6533 ?auto_6520 ) ) ( not ( = ?auto_6533 ?auto_6532 ) ) ( not ( = ?auto_6527 ?auto_6525 ) ) ( not ( = ?auto_6527 ?auto_6522 ) ) ( not ( = ?auto_6527 ?auto_6530 ) ) ( not ( = ?auto_6527 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6509 ) ) ( not ( = ?auto_6504 ?auto_6524 ) ) ( not ( = ?auto_6505 ?auto_6509 ) ) ( not ( = ?auto_6505 ?auto_6524 ) ) ( not ( = ?auto_6506 ?auto_6509 ) ) ( not ( = ?auto_6506 ?auto_6524 ) ) ( not ( = ?auto_6507 ?auto_6509 ) ) ( not ( = ?auto_6507 ?auto_6524 ) ) ( not ( = ?auto_6508 ?auto_6509 ) ) ( not ( = ?auto_6508 ?auto_6524 ) ) ( not ( = ?auto_6509 ?auto_6527 ) ) ( not ( = ?auto_6509 ?auto_6525 ) ) ( not ( = ?auto_6509 ?auto_6522 ) ) ( not ( = ?auto_6509 ?auto_6530 ) ) ( not ( = ?auto_6509 ?auto_6531 ) ) ( not ( = ?auto_6524 ?auto_6527 ) ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6524 ?auto_6522 ) ) ( not ( = ?auto_6524 ?auto_6530 ) ) ( not ( = ?auto_6524 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6512 ) ) ( not ( = ?auto_6504 ?auto_6521 ) ) ( not ( = ?auto_6505 ?auto_6512 ) ) ( not ( = ?auto_6505 ?auto_6521 ) ) ( not ( = ?auto_6506 ?auto_6512 ) ) ( not ( = ?auto_6506 ?auto_6521 ) ) ( not ( = ?auto_6507 ?auto_6512 ) ) ( not ( = ?auto_6507 ?auto_6521 ) ) ( not ( = ?auto_6508 ?auto_6512 ) ) ( not ( = ?auto_6508 ?auto_6521 ) ) ( not ( = ?auto_6510 ?auto_6512 ) ) ( not ( = ?auto_6510 ?auto_6521 ) ) ( not ( = ?auto_6512 ?auto_6524 ) ) ( not ( = ?auto_6512 ?auto_6527 ) ) ( not ( = ?auto_6512 ?auto_6525 ) ) ( not ( = ?auto_6512 ?auto_6522 ) ) ( not ( = ?auto_6512 ?auto_6530 ) ) ( not ( = ?auto_6512 ?auto_6531 ) ) ( not ( = ?auto_6521 ?auto_6524 ) ) ( not ( = ?auto_6521 ?auto_6527 ) ) ( not ( = ?auto_6521 ?auto_6525 ) ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( not ( = ?auto_6521 ?auto_6530 ) ) ( not ( = ?auto_6521 ?auto_6531 ) ) ( not ( = ?auto_6504 ?auto_6511 ) ) ( not ( = ?auto_6504 ?auto_6517 ) ) ( not ( = ?auto_6505 ?auto_6511 ) ) ( not ( = ?auto_6505 ?auto_6517 ) ) ( not ( = ?auto_6506 ?auto_6511 ) ) ( not ( = ?auto_6506 ?auto_6517 ) ) ( not ( = ?auto_6507 ?auto_6511 ) ) ( not ( = ?auto_6507 ?auto_6517 ) ) ( not ( = ?auto_6508 ?auto_6511 ) ) ( not ( = ?auto_6508 ?auto_6517 ) ) ( not ( = ?auto_6510 ?auto_6511 ) ) ( not ( = ?auto_6510 ?auto_6517 ) ) ( not ( = ?auto_6509 ?auto_6511 ) ) ( not ( = ?auto_6509 ?auto_6517 ) ) ( not ( = ?auto_6511 ?auto_6521 ) ) ( not ( = ?auto_6511 ?auto_6524 ) ) ( not ( = ?auto_6511 ?auto_6527 ) ) ( not ( = ?auto_6511 ?auto_6525 ) ) ( not ( = ?auto_6511 ?auto_6522 ) ) ( not ( = ?auto_6511 ?auto_6530 ) ) ( not ( = ?auto_6511 ?auto_6531 ) ) ( not ( = ?auto_6513 ?auto_6519 ) ) ( not ( = ?auto_6513 ?auto_6526 ) ) ( not ( = ?auto_6513 ?auto_6528 ) ) ( not ( = ?auto_6513 ?auto_6529 ) ) ( not ( = ?auto_6516 ?auto_6520 ) ) ( not ( = ?auto_6516 ?auto_6523 ) ) ( not ( = ?auto_6516 ?auto_6533 ) ) ( not ( = ?auto_6516 ?auto_6532 ) ) ( not ( = ?auto_6517 ?auto_6521 ) ) ( not ( = ?auto_6517 ?auto_6524 ) ) ( not ( = ?auto_6517 ?auto_6527 ) ) ( not ( = ?auto_6517 ?auto_6525 ) ) ( not ( = ?auto_6517 ?auto_6522 ) ) ( not ( = ?auto_6517 ?auto_6530 ) ) ( not ( = ?auto_6517 ?auto_6531 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6504 ?auto_6505 ?auto_6506 ?auto_6507 ?auto_6508 ?auto_6510 ?auto_6509 ?auto_6512 )
      ( MAKE-1CRATE ?auto_6512 ?auto_6511 )
      ( MAKE-8CRATE-VERIFY ?auto_6504 ?auto_6505 ?auto_6506 ?auto_6507 ?auto_6508 ?auto_6510 ?auto_6509 ?auto_6512 ?auto_6511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6536 - SURFACE
      ?auto_6537 - SURFACE
    )
    :vars
    (
      ?auto_6538 - HOIST
      ?auto_6539 - PLACE
      ?auto_6541 - PLACE
      ?auto_6542 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6538 ?auto_6539 ) ( SURFACE-AT ?auto_6536 ?auto_6539 ) ( CLEAR ?auto_6536 ) ( IS-CRATE ?auto_6537 ) ( AVAILABLE ?auto_6538 ) ( not ( = ?auto_6541 ?auto_6539 ) ) ( HOIST-AT ?auto_6542 ?auto_6541 ) ( AVAILABLE ?auto_6542 ) ( SURFACE-AT ?auto_6537 ?auto_6541 ) ( ON ?auto_6537 ?auto_6543 ) ( CLEAR ?auto_6537 ) ( TRUCK-AT ?auto_6540 ?auto_6539 ) ( not ( = ?auto_6536 ?auto_6537 ) ) ( not ( = ?auto_6536 ?auto_6543 ) ) ( not ( = ?auto_6537 ?auto_6543 ) ) ( not ( = ?auto_6538 ?auto_6542 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6540 ?auto_6539 ?auto_6541 )
      ( !LIFT ?auto_6542 ?auto_6537 ?auto_6543 ?auto_6541 )
      ( !LOAD ?auto_6542 ?auto_6537 ?auto_6540 ?auto_6541 )
      ( !DRIVE ?auto_6540 ?auto_6541 ?auto_6539 )
      ( !UNLOAD ?auto_6538 ?auto_6537 ?auto_6540 ?auto_6539 )
      ( !DROP ?auto_6538 ?auto_6537 ?auto_6536 ?auto_6539 )
      ( MAKE-1CRATE-VERIFY ?auto_6536 ?auto_6537 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6554 - SURFACE
      ?auto_6555 - SURFACE
      ?auto_6556 - SURFACE
      ?auto_6557 - SURFACE
      ?auto_6558 - SURFACE
      ?auto_6561 - SURFACE
      ?auto_6559 - SURFACE
      ?auto_6563 - SURFACE
      ?auto_6562 - SURFACE
      ?auto_6560 - SURFACE
    )
    :vars
    (
      ?auto_6569 - HOIST
      ?auto_6567 - PLACE
      ?auto_6565 - PLACE
      ?auto_6568 - HOIST
      ?auto_6564 - SURFACE
      ?auto_6585 - PLACE
      ?auto_6570 - HOIST
      ?auto_6584 - SURFACE
      ?auto_6573 - PLACE
      ?auto_6572 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6581 - SURFACE
      ?auto_6576 - PLACE
      ?auto_6571 - HOIST
      ?auto_6574 - SURFACE
      ?auto_6580 - SURFACE
      ?auto_6583 - SURFACE
      ?auto_6575 - PLACE
      ?auto_6579 - HOIST
      ?auto_6577 - SURFACE
      ?auto_6578 - SURFACE
      ?auto_6566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6569 ?auto_6567 ) ( IS-CRATE ?auto_6560 ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( HOIST-AT ?auto_6568 ?auto_6565 ) ( SURFACE-AT ?auto_6560 ?auto_6565 ) ( ON ?auto_6560 ?auto_6564 ) ( CLEAR ?auto_6560 ) ( not ( = ?auto_6562 ?auto_6560 ) ) ( not ( = ?auto_6562 ?auto_6564 ) ) ( not ( = ?auto_6560 ?auto_6564 ) ) ( not ( = ?auto_6569 ?auto_6568 ) ) ( IS-CRATE ?auto_6562 ) ( not ( = ?auto_6585 ?auto_6567 ) ) ( HOIST-AT ?auto_6570 ?auto_6585 ) ( AVAILABLE ?auto_6570 ) ( SURFACE-AT ?auto_6562 ?auto_6585 ) ( ON ?auto_6562 ?auto_6584 ) ( CLEAR ?auto_6562 ) ( not ( = ?auto_6563 ?auto_6562 ) ) ( not ( = ?auto_6563 ?auto_6584 ) ) ( not ( = ?auto_6562 ?auto_6584 ) ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( IS-CRATE ?auto_6563 ) ( not ( = ?auto_6573 ?auto_6567 ) ) ( HOIST-AT ?auto_6572 ?auto_6573 ) ( SURFACE-AT ?auto_6563 ?auto_6573 ) ( ON ?auto_6563 ?auto_6582 ) ( CLEAR ?auto_6563 ) ( not ( = ?auto_6559 ?auto_6563 ) ) ( not ( = ?auto_6559 ?auto_6582 ) ) ( not ( = ?auto_6563 ?auto_6582 ) ) ( not ( = ?auto_6569 ?auto_6572 ) ) ( IS-CRATE ?auto_6559 ) ( SURFACE-AT ?auto_6559 ?auto_6565 ) ( ON ?auto_6559 ?auto_6581 ) ( CLEAR ?auto_6559 ) ( not ( = ?auto_6561 ?auto_6559 ) ) ( not ( = ?auto_6561 ?auto_6581 ) ) ( not ( = ?auto_6559 ?auto_6581 ) ) ( IS-CRATE ?auto_6561 ) ( not ( = ?auto_6576 ?auto_6567 ) ) ( HOIST-AT ?auto_6571 ?auto_6576 ) ( AVAILABLE ?auto_6571 ) ( SURFACE-AT ?auto_6561 ?auto_6576 ) ( ON ?auto_6561 ?auto_6574 ) ( CLEAR ?auto_6561 ) ( not ( = ?auto_6558 ?auto_6561 ) ) ( not ( = ?auto_6558 ?auto_6574 ) ) ( not ( = ?auto_6561 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( IS-CRATE ?auto_6558 ) ( AVAILABLE ?auto_6568 ) ( SURFACE-AT ?auto_6558 ?auto_6565 ) ( ON ?auto_6558 ?auto_6580 ) ( CLEAR ?auto_6558 ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6580 ) ) ( not ( = ?auto_6558 ?auto_6580 ) ) ( IS-CRATE ?auto_6557 ) ( AVAILABLE ?auto_6572 ) ( SURFACE-AT ?auto_6557 ?auto_6573 ) ( ON ?auto_6557 ?auto_6583 ) ( CLEAR ?auto_6557 ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6583 ) ) ( not ( = ?auto_6557 ?auto_6583 ) ) ( IS-CRATE ?auto_6556 ) ( not ( = ?auto_6575 ?auto_6567 ) ) ( HOIST-AT ?auto_6579 ?auto_6575 ) ( SURFACE-AT ?auto_6556 ?auto_6575 ) ( ON ?auto_6556 ?auto_6577 ) ( CLEAR ?auto_6556 ) ( not ( = ?auto_6555 ?auto_6556 ) ) ( not ( = ?auto_6555 ?auto_6577 ) ) ( not ( = ?auto_6556 ?auto_6577 ) ) ( not ( = ?auto_6569 ?auto_6579 ) ) ( SURFACE-AT ?auto_6554 ?auto_6567 ) ( CLEAR ?auto_6554 ) ( IS-CRATE ?auto_6555 ) ( AVAILABLE ?auto_6569 ) ( AVAILABLE ?auto_6579 ) ( SURFACE-AT ?auto_6555 ?auto_6575 ) ( ON ?auto_6555 ?auto_6578 ) ( CLEAR ?auto_6555 ) ( TRUCK-AT ?auto_6566 ?auto_6567 ) ( not ( = ?auto_6554 ?auto_6555 ) ) ( not ( = ?auto_6554 ?auto_6578 ) ) ( not ( = ?auto_6555 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6556 ) ) ( not ( = ?auto_6554 ?auto_6577 ) ) ( not ( = ?auto_6556 ?auto_6578 ) ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6557 ) ) ( not ( = ?auto_6554 ?auto_6583 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6583 ) ) ( not ( = ?auto_6557 ?auto_6577 ) ) ( not ( = ?auto_6557 ?auto_6578 ) ) ( not ( = ?auto_6573 ?auto_6575 ) ) ( not ( = ?auto_6572 ?auto_6579 ) ) ( not ( = ?auto_6583 ?auto_6577 ) ) ( not ( = ?auto_6583 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6558 ) ) ( not ( = ?auto_6554 ?auto_6580 ) ) ( not ( = ?auto_6555 ?auto_6558 ) ) ( not ( = ?auto_6555 ?auto_6580 ) ) ( not ( = ?auto_6556 ?auto_6558 ) ) ( not ( = ?auto_6556 ?auto_6580 ) ) ( not ( = ?auto_6558 ?auto_6583 ) ) ( not ( = ?auto_6558 ?auto_6577 ) ) ( not ( = ?auto_6558 ?auto_6578 ) ) ( not ( = ?auto_6565 ?auto_6573 ) ) ( not ( = ?auto_6565 ?auto_6575 ) ) ( not ( = ?auto_6568 ?auto_6572 ) ) ( not ( = ?auto_6568 ?auto_6579 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6580 ?auto_6577 ) ) ( not ( = ?auto_6580 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6561 ) ) ( not ( = ?auto_6554 ?auto_6574 ) ) ( not ( = ?auto_6555 ?auto_6561 ) ) ( not ( = ?auto_6555 ?auto_6574 ) ) ( not ( = ?auto_6556 ?auto_6561 ) ) ( not ( = ?auto_6556 ?auto_6574 ) ) ( not ( = ?auto_6557 ?auto_6561 ) ) ( not ( = ?auto_6557 ?auto_6574 ) ) ( not ( = ?auto_6561 ?auto_6580 ) ) ( not ( = ?auto_6561 ?auto_6583 ) ) ( not ( = ?auto_6561 ?auto_6577 ) ) ( not ( = ?auto_6561 ?auto_6578 ) ) ( not ( = ?auto_6576 ?auto_6565 ) ) ( not ( = ?auto_6576 ?auto_6573 ) ) ( not ( = ?auto_6576 ?auto_6575 ) ) ( not ( = ?auto_6571 ?auto_6568 ) ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6579 ) ) ( not ( = ?auto_6574 ?auto_6580 ) ) ( not ( = ?auto_6574 ?auto_6583 ) ) ( not ( = ?auto_6574 ?auto_6577 ) ) ( not ( = ?auto_6574 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6559 ) ) ( not ( = ?auto_6554 ?auto_6581 ) ) ( not ( = ?auto_6555 ?auto_6559 ) ) ( not ( = ?auto_6555 ?auto_6581 ) ) ( not ( = ?auto_6556 ?auto_6559 ) ) ( not ( = ?auto_6556 ?auto_6581 ) ) ( not ( = ?auto_6557 ?auto_6559 ) ) ( not ( = ?auto_6557 ?auto_6581 ) ) ( not ( = ?auto_6558 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6581 ) ) ( not ( = ?auto_6559 ?auto_6574 ) ) ( not ( = ?auto_6559 ?auto_6580 ) ) ( not ( = ?auto_6559 ?auto_6583 ) ) ( not ( = ?auto_6559 ?auto_6577 ) ) ( not ( = ?auto_6559 ?auto_6578 ) ) ( not ( = ?auto_6581 ?auto_6574 ) ) ( not ( = ?auto_6581 ?auto_6580 ) ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( not ( = ?auto_6581 ?auto_6577 ) ) ( not ( = ?auto_6581 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6563 ) ) ( not ( = ?auto_6554 ?auto_6582 ) ) ( not ( = ?auto_6555 ?auto_6563 ) ) ( not ( = ?auto_6555 ?auto_6582 ) ) ( not ( = ?auto_6556 ?auto_6563 ) ) ( not ( = ?auto_6556 ?auto_6582 ) ) ( not ( = ?auto_6557 ?auto_6563 ) ) ( not ( = ?auto_6557 ?auto_6582 ) ) ( not ( = ?auto_6558 ?auto_6563 ) ) ( not ( = ?auto_6558 ?auto_6582 ) ) ( not ( = ?auto_6561 ?auto_6563 ) ) ( not ( = ?auto_6561 ?auto_6582 ) ) ( not ( = ?auto_6563 ?auto_6581 ) ) ( not ( = ?auto_6563 ?auto_6574 ) ) ( not ( = ?auto_6563 ?auto_6580 ) ) ( not ( = ?auto_6563 ?auto_6583 ) ) ( not ( = ?auto_6563 ?auto_6577 ) ) ( not ( = ?auto_6563 ?auto_6578 ) ) ( not ( = ?auto_6582 ?auto_6581 ) ) ( not ( = ?auto_6582 ?auto_6574 ) ) ( not ( = ?auto_6582 ?auto_6580 ) ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6577 ) ) ( not ( = ?auto_6582 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6562 ) ) ( not ( = ?auto_6554 ?auto_6584 ) ) ( not ( = ?auto_6555 ?auto_6562 ) ) ( not ( = ?auto_6555 ?auto_6584 ) ) ( not ( = ?auto_6556 ?auto_6562 ) ) ( not ( = ?auto_6556 ?auto_6584 ) ) ( not ( = ?auto_6557 ?auto_6562 ) ) ( not ( = ?auto_6557 ?auto_6584 ) ) ( not ( = ?auto_6558 ?auto_6562 ) ) ( not ( = ?auto_6558 ?auto_6584 ) ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( not ( = ?auto_6561 ?auto_6584 ) ) ( not ( = ?auto_6559 ?auto_6562 ) ) ( not ( = ?auto_6559 ?auto_6584 ) ) ( not ( = ?auto_6562 ?auto_6582 ) ) ( not ( = ?auto_6562 ?auto_6581 ) ) ( not ( = ?auto_6562 ?auto_6574 ) ) ( not ( = ?auto_6562 ?auto_6580 ) ) ( not ( = ?auto_6562 ?auto_6583 ) ) ( not ( = ?auto_6562 ?auto_6577 ) ) ( not ( = ?auto_6562 ?auto_6578 ) ) ( not ( = ?auto_6585 ?auto_6573 ) ) ( not ( = ?auto_6585 ?auto_6565 ) ) ( not ( = ?auto_6585 ?auto_6576 ) ) ( not ( = ?auto_6585 ?auto_6575 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6568 ) ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6579 ) ) ( not ( = ?auto_6584 ?auto_6582 ) ) ( not ( = ?auto_6584 ?auto_6581 ) ) ( not ( = ?auto_6584 ?auto_6574 ) ) ( not ( = ?auto_6584 ?auto_6580 ) ) ( not ( = ?auto_6584 ?auto_6583 ) ) ( not ( = ?auto_6584 ?auto_6577 ) ) ( not ( = ?auto_6584 ?auto_6578 ) ) ( not ( = ?auto_6554 ?auto_6560 ) ) ( not ( = ?auto_6554 ?auto_6564 ) ) ( not ( = ?auto_6555 ?auto_6560 ) ) ( not ( = ?auto_6555 ?auto_6564 ) ) ( not ( = ?auto_6556 ?auto_6560 ) ) ( not ( = ?auto_6556 ?auto_6564 ) ) ( not ( = ?auto_6557 ?auto_6560 ) ) ( not ( = ?auto_6557 ?auto_6564 ) ) ( not ( = ?auto_6558 ?auto_6560 ) ) ( not ( = ?auto_6558 ?auto_6564 ) ) ( not ( = ?auto_6561 ?auto_6560 ) ) ( not ( = ?auto_6561 ?auto_6564 ) ) ( not ( = ?auto_6559 ?auto_6560 ) ) ( not ( = ?auto_6559 ?auto_6564 ) ) ( not ( = ?auto_6563 ?auto_6560 ) ) ( not ( = ?auto_6563 ?auto_6564 ) ) ( not ( = ?auto_6560 ?auto_6584 ) ) ( not ( = ?auto_6560 ?auto_6582 ) ) ( not ( = ?auto_6560 ?auto_6581 ) ) ( not ( = ?auto_6560 ?auto_6574 ) ) ( not ( = ?auto_6560 ?auto_6580 ) ) ( not ( = ?auto_6560 ?auto_6583 ) ) ( not ( = ?auto_6560 ?auto_6577 ) ) ( not ( = ?auto_6560 ?auto_6578 ) ) ( not ( = ?auto_6564 ?auto_6584 ) ) ( not ( = ?auto_6564 ?auto_6582 ) ) ( not ( = ?auto_6564 ?auto_6581 ) ) ( not ( = ?auto_6564 ?auto_6574 ) ) ( not ( = ?auto_6564 ?auto_6580 ) ) ( not ( = ?auto_6564 ?auto_6583 ) ) ( not ( = ?auto_6564 ?auto_6577 ) ) ( not ( = ?auto_6564 ?auto_6578 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6554 ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ?auto_6561 ?auto_6559 ?auto_6563 ?auto_6562 )
      ( MAKE-1CRATE ?auto_6562 ?auto_6560 )
      ( MAKE-9CRATE-VERIFY ?auto_6554 ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ?auto_6561 ?auto_6559 ?auto_6563 ?auto_6562 ?auto_6560 ) )
  )

)

