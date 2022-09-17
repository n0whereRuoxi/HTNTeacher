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
      ?auto_18278 - SURFACE
      ?auto_18279 - SURFACE
    )
    :vars
    (
      ?auto_18280 - HOIST
      ?auto_18281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18280 ?auto_18281 ) ( SURFACE-AT ?auto_18279 ?auto_18281 ) ( CLEAR ?auto_18279 ) ( LIFTING ?auto_18280 ?auto_18278 ) ( IS-CRATE ?auto_18278 ) ( not ( = ?auto_18278 ?auto_18279 ) ) )
    :subtasks
    ( ( !DROP ?auto_18280 ?auto_18278 ?auto_18279 ?auto_18281 )
      ( MAKE-ON-VERIFY ?auto_18278 ?auto_18279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18282 - SURFACE
      ?auto_18283 - SURFACE
    )
    :vars
    (
      ?auto_18284 - HOIST
      ?auto_18285 - PLACE
      ?auto_18286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18284 ?auto_18285 ) ( SURFACE-AT ?auto_18283 ?auto_18285 ) ( CLEAR ?auto_18283 ) ( IS-CRATE ?auto_18282 ) ( not ( = ?auto_18282 ?auto_18283 ) ) ( TRUCK-AT ?auto_18286 ?auto_18285 ) ( AVAILABLE ?auto_18284 ) ( IN ?auto_18282 ?auto_18286 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18284 ?auto_18282 ?auto_18286 ?auto_18285 )
      ( MAKE-ON ?auto_18282 ?auto_18283 )
      ( MAKE-ON-VERIFY ?auto_18282 ?auto_18283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18287 - SURFACE
      ?auto_18288 - SURFACE
    )
    :vars
    (
      ?auto_18291 - HOIST
      ?auto_18289 - PLACE
      ?auto_18290 - TRUCK
      ?auto_18292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18291 ?auto_18289 ) ( SURFACE-AT ?auto_18288 ?auto_18289 ) ( CLEAR ?auto_18288 ) ( IS-CRATE ?auto_18287 ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( AVAILABLE ?auto_18291 ) ( IN ?auto_18287 ?auto_18290 ) ( TRUCK-AT ?auto_18290 ?auto_18292 ) ( not ( = ?auto_18292 ?auto_18289 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18290 ?auto_18292 ?auto_18289 )
      ( MAKE-ON ?auto_18287 ?auto_18288 )
      ( MAKE-ON-VERIFY ?auto_18287 ?auto_18288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18293 - SURFACE
      ?auto_18294 - SURFACE
    )
    :vars
    (
      ?auto_18298 - HOIST
      ?auto_18296 - PLACE
      ?auto_18297 - TRUCK
      ?auto_18295 - PLACE
      ?auto_18299 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18298 ?auto_18296 ) ( SURFACE-AT ?auto_18294 ?auto_18296 ) ( CLEAR ?auto_18294 ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( AVAILABLE ?auto_18298 ) ( TRUCK-AT ?auto_18297 ?auto_18295 ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( HOIST-AT ?auto_18299 ?auto_18295 ) ( LIFTING ?auto_18299 ?auto_18293 ) ( not ( = ?auto_18298 ?auto_18299 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18299 ?auto_18293 ?auto_18297 ?auto_18295 )
      ( MAKE-ON ?auto_18293 ?auto_18294 )
      ( MAKE-ON-VERIFY ?auto_18293 ?auto_18294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18300 - SURFACE
      ?auto_18301 - SURFACE
    )
    :vars
    (
      ?auto_18303 - HOIST
      ?auto_18304 - PLACE
      ?auto_18306 - TRUCK
      ?auto_18302 - PLACE
      ?auto_18305 - HOIST
      ?auto_18307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18303 ?auto_18304 ) ( SURFACE-AT ?auto_18301 ?auto_18304 ) ( CLEAR ?auto_18301 ) ( IS-CRATE ?auto_18300 ) ( not ( = ?auto_18300 ?auto_18301 ) ) ( AVAILABLE ?auto_18303 ) ( TRUCK-AT ?auto_18306 ?auto_18302 ) ( not ( = ?auto_18302 ?auto_18304 ) ) ( HOIST-AT ?auto_18305 ?auto_18302 ) ( not ( = ?auto_18303 ?auto_18305 ) ) ( AVAILABLE ?auto_18305 ) ( SURFACE-AT ?auto_18300 ?auto_18302 ) ( ON ?auto_18300 ?auto_18307 ) ( CLEAR ?auto_18300 ) ( not ( = ?auto_18300 ?auto_18307 ) ) ( not ( = ?auto_18301 ?auto_18307 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18305 ?auto_18300 ?auto_18307 ?auto_18302 )
      ( MAKE-ON ?auto_18300 ?auto_18301 )
      ( MAKE-ON-VERIFY ?auto_18300 ?auto_18301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18308 - SURFACE
      ?auto_18309 - SURFACE
    )
    :vars
    (
      ?auto_18315 - HOIST
      ?auto_18313 - PLACE
      ?auto_18311 - PLACE
      ?auto_18310 - HOIST
      ?auto_18314 - SURFACE
      ?auto_18312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18315 ?auto_18313 ) ( SURFACE-AT ?auto_18309 ?auto_18313 ) ( CLEAR ?auto_18309 ) ( IS-CRATE ?auto_18308 ) ( not ( = ?auto_18308 ?auto_18309 ) ) ( AVAILABLE ?auto_18315 ) ( not ( = ?auto_18311 ?auto_18313 ) ) ( HOIST-AT ?auto_18310 ?auto_18311 ) ( not ( = ?auto_18315 ?auto_18310 ) ) ( AVAILABLE ?auto_18310 ) ( SURFACE-AT ?auto_18308 ?auto_18311 ) ( ON ?auto_18308 ?auto_18314 ) ( CLEAR ?auto_18308 ) ( not ( = ?auto_18308 ?auto_18314 ) ) ( not ( = ?auto_18309 ?auto_18314 ) ) ( TRUCK-AT ?auto_18312 ?auto_18313 ) )
    :subtasks
    ( ( !DRIVE ?auto_18312 ?auto_18313 ?auto_18311 )
      ( MAKE-ON ?auto_18308 ?auto_18309 )
      ( MAKE-ON-VERIFY ?auto_18308 ?auto_18309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18318 - SURFACE
      ?auto_18319 - SURFACE
    )
    :vars
    (
      ?auto_18320 - HOIST
      ?auto_18321 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18320 ?auto_18321 ) ( SURFACE-AT ?auto_18319 ?auto_18321 ) ( CLEAR ?auto_18319 ) ( LIFTING ?auto_18320 ?auto_18318 ) ( IS-CRATE ?auto_18318 ) ( not ( = ?auto_18318 ?auto_18319 ) ) )
    :subtasks
    ( ( !DROP ?auto_18320 ?auto_18318 ?auto_18319 ?auto_18321 )
      ( MAKE-ON-VERIFY ?auto_18318 ?auto_18319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18322 - SURFACE
      ?auto_18323 - SURFACE
    )
    :vars
    (
      ?auto_18324 - HOIST
      ?auto_18325 - PLACE
      ?auto_18326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18324 ?auto_18325 ) ( SURFACE-AT ?auto_18323 ?auto_18325 ) ( CLEAR ?auto_18323 ) ( IS-CRATE ?auto_18322 ) ( not ( = ?auto_18322 ?auto_18323 ) ) ( TRUCK-AT ?auto_18326 ?auto_18325 ) ( AVAILABLE ?auto_18324 ) ( IN ?auto_18322 ?auto_18326 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18324 ?auto_18322 ?auto_18326 ?auto_18325 )
      ( MAKE-ON ?auto_18322 ?auto_18323 )
      ( MAKE-ON-VERIFY ?auto_18322 ?auto_18323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18327 - SURFACE
      ?auto_18328 - SURFACE
    )
    :vars
    (
      ?auto_18330 - HOIST
      ?auto_18329 - PLACE
      ?auto_18331 - TRUCK
      ?auto_18332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18330 ?auto_18329 ) ( SURFACE-AT ?auto_18328 ?auto_18329 ) ( CLEAR ?auto_18328 ) ( IS-CRATE ?auto_18327 ) ( not ( = ?auto_18327 ?auto_18328 ) ) ( AVAILABLE ?auto_18330 ) ( IN ?auto_18327 ?auto_18331 ) ( TRUCK-AT ?auto_18331 ?auto_18332 ) ( not ( = ?auto_18332 ?auto_18329 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18331 ?auto_18332 ?auto_18329 )
      ( MAKE-ON ?auto_18327 ?auto_18328 )
      ( MAKE-ON-VERIFY ?auto_18327 ?auto_18328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18333 - SURFACE
      ?auto_18334 - SURFACE
    )
    :vars
    (
      ?auto_18336 - HOIST
      ?auto_18335 - PLACE
      ?auto_18337 - TRUCK
      ?auto_18338 - PLACE
      ?auto_18339 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18336 ?auto_18335 ) ( SURFACE-AT ?auto_18334 ?auto_18335 ) ( CLEAR ?auto_18334 ) ( IS-CRATE ?auto_18333 ) ( not ( = ?auto_18333 ?auto_18334 ) ) ( AVAILABLE ?auto_18336 ) ( TRUCK-AT ?auto_18337 ?auto_18338 ) ( not ( = ?auto_18338 ?auto_18335 ) ) ( HOIST-AT ?auto_18339 ?auto_18338 ) ( LIFTING ?auto_18339 ?auto_18333 ) ( not ( = ?auto_18336 ?auto_18339 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18339 ?auto_18333 ?auto_18337 ?auto_18338 )
      ( MAKE-ON ?auto_18333 ?auto_18334 )
      ( MAKE-ON-VERIFY ?auto_18333 ?auto_18334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18340 - SURFACE
      ?auto_18341 - SURFACE
    )
    :vars
    (
      ?auto_18344 - HOIST
      ?auto_18342 - PLACE
      ?auto_18346 - TRUCK
      ?auto_18345 - PLACE
      ?auto_18343 - HOIST
      ?auto_18347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18344 ?auto_18342 ) ( SURFACE-AT ?auto_18341 ?auto_18342 ) ( CLEAR ?auto_18341 ) ( IS-CRATE ?auto_18340 ) ( not ( = ?auto_18340 ?auto_18341 ) ) ( AVAILABLE ?auto_18344 ) ( TRUCK-AT ?auto_18346 ?auto_18345 ) ( not ( = ?auto_18345 ?auto_18342 ) ) ( HOIST-AT ?auto_18343 ?auto_18345 ) ( not ( = ?auto_18344 ?auto_18343 ) ) ( AVAILABLE ?auto_18343 ) ( SURFACE-AT ?auto_18340 ?auto_18345 ) ( ON ?auto_18340 ?auto_18347 ) ( CLEAR ?auto_18340 ) ( not ( = ?auto_18340 ?auto_18347 ) ) ( not ( = ?auto_18341 ?auto_18347 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18343 ?auto_18340 ?auto_18347 ?auto_18345 )
      ( MAKE-ON ?auto_18340 ?auto_18341 )
      ( MAKE-ON-VERIFY ?auto_18340 ?auto_18341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18348 - SURFACE
      ?auto_18349 - SURFACE
    )
    :vars
    (
      ?auto_18353 - HOIST
      ?auto_18354 - PLACE
      ?auto_18352 - PLACE
      ?auto_18350 - HOIST
      ?auto_18355 - SURFACE
      ?auto_18351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18353 ?auto_18354 ) ( SURFACE-AT ?auto_18349 ?auto_18354 ) ( CLEAR ?auto_18349 ) ( IS-CRATE ?auto_18348 ) ( not ( = ?auto_18348 ?auto_18349 ) ) ( AVAILABLE ?auto_18353 ) ( not ( = ?auto_18352 ?auto_18354 ) ) ( HOIST-AT ?auto_18350 ?auto_18352 ) ( not ( = ?auto_18353 ?auto_18350 ) ) ( AVAILABLE ?auto_18350 ) ( SURFACE-AT ?auto_18348 ?auto_18352 ) ( ON ?auto_18348 ?auto_18355 ) ( CLEAR ?auto_18348 ) ( not ( = ?auto_18348 ?auto_18355 ) ) ( not ( = ?auto_18349 ?auto_18355 ) ) ( TRUCK-AT ?auto_18351 ?auto_18354 ) )
    :subtasks
    ( ( !DRIVE ?auto_18351 ?auto_18354 ?auto_18352 )
      ( MAKE-ON ?auto_18348 ?auto_18349 )
      ( MAKE-ON-VERIFY ?auto_18348 ?auto_18349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18356 - SURFACE
      ?auto_18357 - SURFACE
    )
    :vars
    (
      ?auto_18358 - HOIST
      ?auto_18362 - PLACE
      ?auto_18363 - PLACE
      ?auto_18361 - HOIST
      ?auto_18360 - SURFACE
      ?auto_18359 - TRUCK
      ?auto_18364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18358 ?auto_18362 ) ( IS-CRATE ?auto_18356 ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18363 ?auto_18362 ) ) ( HOIST-AT ?auto_18361 ?auto_18363 ) ( not ( = ?auto_18358 ?auto_18361 ) ) ( AVAILABLE ?auto_18361 ) ( SURFACE-AT ?auto_18356 ?auto_18363 ) ( ON ?auto_18356 ?auto_18360 ) ( CLEAR ?auto_18356 ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( TRUCK-AT ?auto_18359 ?auto_18362 ) ( SURFACE-AT ?auto_18364 ?auto_18362 ) ( CLEAR ?auto_18364 ) ( LIFTING ?auto_18358 ?auto_18357 ) ( IS-CRATE ?auto_18357 ) ( not ( = ?auto_18356 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) )
    :subtasks
    ( ( !DROP ?auto_18358 ?auto_18357 ?auto_18364 ?auto_18362 )
      ( MAKE-ON ?auto_18356 ?auto_18357 )
      ( MAKE-ON-VERIFY ?auto_18356 ?auto_18357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18365 - SURFACE
      ?auto_18366 - SURFACE
    )
    :vars
    (
      ?auto_18371 - HOIST
      ?auto_18367 - PLACE
      ?auto_18368 - PLACE
      ?auto_18373 - HOIST
      ?auto_18370 - SURFACE
      ?auto_18372 - TRUCK
      ?auto_18369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18371 ?auto_18367 ) ( IS-CRATE ?auto_18365 ) ( not ( = ?auto_18365 ?auto_18366 ) ) ( not ( = ?auto_18368 ?auto_18367 ) ) ( HOIST-AT ?auto_18373 ?auto_18368 ) ( not ( = ?auto_18371 ?auto_18373 ) ) ( AVAILABLE ?auto_18373 ) ( SURFACE-AT ?auto_18365 ?auto_18368 ) ( ON ?auto_18365 ?auto_18370 ) ( CLEAR ?auto_18365 ) ( not ( = ?auto_18365 ?auto_18370 ) ) ( not ( = ?auto_18366 ?auto_18370 ) ) ( TRUCK-AT ?auto_18372 ?auto_18367 ) ( SURFACE-AT ?auto_18369 ?auto_18367 ) ( CLEAR ?auto_18369 ) ( IS-CRATE ?auto_18366 ) ( not ( = ?auto_18365 ?auto_18369 ) ) ( not ( = ?auto_18366 ?auto_18369 ) ) ( not ( = ?auto_18370 ?auto_18369 ) ) ( AVAILABLE ?auto_18371 ) ( IN ?auto_18366 ?auto_18372 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18371 ?auto_18366 ?auto_18372 ?auto_18367 )
      ( MAKE-ON ?auto_18365 ?auto_18366 )
      ( MAKE-ON-VERIFY ?auto_18365 ?auto_18366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18374 - SURFACE
      ?auto_18375 - SURFACE
    )
    :vars
    (
      ?auto_18376 - HOIST
      ?auto_18382 - PLACE
      ?auto_18381 - PLACE
      ?auto_18380 - HOIST
      ?auto_18379 - SURFACE
      ?auto_18378 - SURFACE
      ?auto_18377 - TRUCK
      ?auto_18383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18376 ?auto_18382 ) ( IS-CRATE ?auto_18374 ) ( not ( = ?auto_18374 ?auto_18375 ) ) ( not ( = ?auto_18381 ?auto_18382 ) ) ( HOIST-AT ?auto_18380 ?auto_18381 ) ( not ( = ?auto_18376 ?auto_18380 ) ) ( AVAILABLE ?auto_18380 ) ( SURFACE-AT ?auto_18374 ?auto_18381 ) ( ON ?auto_18374 ?auto_18379 ) ( CLEAR ?auto_18374 ) ( not ( = ?auto_18374 ?auto_18379 ) ) ( not ( = ?auto_18375 ?auto_18379 ) ) ( SURFACE-AT ?auto_18378 ?auto_18382 ) ( CLEAR ?auto_18378 ) ( IS-CRATE ?auto_18375 ) ( not ( = ?auto_18374 ?auto_18378 ) ) ( not ( = ?auto_18375 ?auto_18378 ) ) ( not ( = ?auto_18379 ?auto_18378 ) ) ( AVAILABLE ?auto_18376 ) ( IN ?auto_18375 ?auto_18377 ) ( TRUCK-AT ?auto_18377 ?auto_18383 ) ( not ( = ?auto_18383 ?auto_18382 ) ) ( not ( = ?auto_18381 ?auto_18383 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18377 ?auto_18383 ?auto_18382 )
      ( MAKE-ON ?auto_18374 ?auto_18375 )
      ( MAKE-ON-VERIFY ?auto_18374 ?auto_18375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18384 - SURFACE
      ?auto_18385 - SURFACE
    )
    :vars
    (
      ?auto_18390 - HOIST
      ?auto_18391 - PLACE
      ?auto_18386 - PLACE
      ?auto_18387 - HOIST
      ?auto_18389 - SURFACE
      ?auto_18393 - SURFACE
      ?auto_18392 - TRUCK
      ?auto_18388 - PLACE
      ?auto_18394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18390 ?auto_18391 ) ( IS-CRATE ?auto_18384 ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18386 ?auto_18391 ) ) ( HOIST-AT ?auto_18387 ?auto_18386 ) ( not ( = ?auto_18390 ?auto_18387 ) ) ( AVAILABLE ?auto_18387 ) ( SURFACE-AT ?auto_18384 ?auto_18386 ) ( ON ?auto_18384 ?auto_18389 ) ( CLEAR ?auto_18384 ) ( not ( = ?auto_18384 ?auto_18389 ) ) ( not ( = ?auto_18385 ?auto_18389 ) ) ( SURFACE-AT ?auto_18393 ?auto_18391 ) ( CLEAR ?auto_18393 ) ( IS-CRATE ?auto_18385 ) ( not ( = ?auto_18384 ?auto_18393 ) ) ( not ( = ?auto_18385 ?auto_18393 ) ) ( not ( = ?auto_18389 ?auto_18393 ) ) ( AVAILABLE ?auto_18390 ) ( TRUCK-AT ?auto_18392 ?auto_18388 ) ( not ( = ?auto_18388 ?auto_18391 ) ) ( not ( = ?auto_18386 ?auto_18388 ) ) ( HOIST-AT ?auto_18394 ?auto_18388 ) ( LIFTING ?auto_18394 ?auto_18385 ) ( not ( = ?auto_18390 ?auto_18394 ) ) ( not ( = ?auto_18387 ?auto_18394 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18394 ?auto_18385 ?auto_18392 ?auto_18388 )
      ( MAKE-ON ?auto_18384 ?auto_18385 )
      ( MAKE-ON-VERIFY ?auto_18384 ?auto_18385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18395 - SURFACE
      ?auto_18396 - SURFACE
    )
    :vars
    (
      ?auto_18405 - HOIST
      ?auto_18397 - PLACE
      ?auto_18398 - PLACE
      ?auto_18401 - HOIST
      ?auto_18402 - SURFACE
      ?auto_18404 - SURFACE
      ?auto_18403 - TRUCK
      ?auto_18399 - PLACE
      ?auto_18400 - HOIST
      ?auto_18406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18405 ?auto_18397 ) ( IS-CRATE ?auto_18395 ) ( not ( = ?auto_18395 ?auto_18396 ) ) ( not ( = ?auto_18398 ?auto_18397 ) ) ( HOIST-AT ?auto_18401 ?auto_18398 ) ( not ( = ?auto_18405 ?auto_18401 ) ) ( AVAILABLE ?auto_18401 ) ( SURFACE-AT ?auto_18395 ?auto_18398 ) ( ON ?auto_18395 ?auto_18402 ) ( CLEAR ?auto_18395 ) ( not ( = ?auto_18395 ?auto_18402 ) ) ( not ( = ?auto_18396 ?auto_18402 ) ) ( SURFACE-AT ?auto_18404 ?auto_18397 ) ( CLEAR ?auto_18404 ) ( IS-CRATE ?auto_18396 ) ( not ( = ?auto_18395 ?auto_18404 ) ) ( not ( = ?auto_18396 ?auto_18404 ) ) ( not ( = ?auto_18402 ?auto_18404 ) ) ( AVAILABLE ?auto_18405 ) ( TRUCK-AT ?auto_18403 ?auto_18399 ) ( not ( = ?auto_18399 ?auto_18397 ) ) ( not ( = ?auto_18398 ?auto_18399 ) ) ( HOIST-AT ?auto_18400 ?auto_18399 ) ( not ( = ?auto_18405 ?auto_18400 ) ) ( not ( = ?auto_18401 ?auto_18400 ) ) ( AVAILABLE ?auto_18400 ) ( SURFACE-AT ?auto_18396 ?auto_18399 ) ( ON ?auto_18396 ?auto_18406 ) ( CLEAR ?auto_18396 ) ( not ( = ?auto_18395 ?auto_18406 ) ) ( not ( = ?auto_18396 ?auto_18406 ) ) ( not ( = ?auto_18402 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18400 ?auto_18396 ?auto_18406 ?auto_18399 )
      ( MAKE-ON ?auto_18395 ?auto_18396 )
      ( MAKE-ON-VERIFY ?auto_18395 ?auto_18396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18407 - SURFACE
      ?auto_18408 - SURFACE
    )
    :vars
    (
      ?auto_18412 - HOIST
      ?auto_18409 - PLACE
      ?auto_18418 - PLACE
      ?auto_18417 - HOIST
      ?auto_18411 - SURFACE
      ?auto_18415 - SURFACE
      ?auto_18410 - PLACE
      ?auto_18416 - HOIST
      ?auto_18413 - SURFACE
      ?auto_18414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18412 ?auto_18409 ) ( IS-CRATE ?auto_18407 ) ( not ( = ?auto_18407 ?auto_18408 ) ) ( not ( = ?auto_18418 ?auto_18409 ) ) ( HOIST-AT ?auto_18417 ?auto_18418 ) ( not ( = ?auto_18412 ?auto_18417 ) ) ( AVAILABLE ?auto_18417 ) ( SURFACE-AT ?auto_18407 ?auto_18418 ) ( ON ?auto_18407 ?auto_18411 ) ( CLEAR ?auto_18407 ) ( not ( = ?auto_18407 ?auto_18411 ) ) ( not ( = ?auto_18408 ?auto_18411 ) ) ( SURFACE-AT ?auto_18415 ?auto_18409 ) ( CLEAR ?auto_18415 ) ( IS-CRATE ?auto_18408 ) ( not ( = ?auto_18407 ?auto_18415 ) ) ( not ( = ?auto_18408 ?auto_18415 ) ) ( not ( = ?auto_18411 ?auto_18415 ) ) ( AVAILABLE ?auto_18412 ) ( not ( = ?auto_18410 ?auto_18409 ) ) ( not ( = ?auto_18418 ?auto_18410 ) ) ( HOIST-AT ?auto_18416 ?auto_18410 ) ( not ( = ?auto_18412 ?auto_18416 ) ) ( not ( = ?auto_18417 ?auto_18416 ) ) ( AVAILABLE ?auto_18416 ) ( SURFACE-AT ?auto_18408 ?auto_18410 ) ( ON ?auto_18408 ?auto_18413 ) ( CLEAR ?auto_18408 ) ( not ( = ?auto_18407 ?auto_18413 ) ) ( not ( = ?auto_18408 ?auto_18413 ) ) ( not ( = ?auto_18411 ?auto_18413 ) ) ( not ( = ?auto_18415 ?auto_18413 ) ) ( TRUCK-AT ?auto_18414 ?auto_18409 ) )
    :subtasks
    ( ( !DRIVE ?auto_18414 ?auto_18409 ?auto_18410 )
      ( MAKE-ON ?auto_18407 ?auto_18408 )
      ( MAKE-ON-VERIFY ?auto_18407 ?auto_18408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18421 - SURFACE
      ?auto_18422 - SURFACE
    )
    :vars
    (
      ?auto_18423 - HOIST
      ?auto_18424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18423 ?auto_18424 ) ( SURFACE-AT ?auto_18422 ?auto_18424 ) ( CLEAR ?auto_18422 ) ( LIFTING ?auto_18423 ?auto_18421 ) ( IS-CRATE ?auto_18421 ) ( not ( = ?auto_18421 ?auto_18422 ) ) )
    :subtasks
    ( ( !DROP ?auto_18423 ?auto_18421 ?auto_18422 ?auto_18424 )
      ( MAKE-ON-VERIFY ?auto_18421 ?auto_18422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18425 - SURFACE
      ?auto_18426 - SURFACE
    )
    :vars
    (
      ?auto_18427 - HOIST
      ?auto_18428 - PLACE
      ?auto_18429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18427 ?auto_18428 ) ( SURFACE-AT ?auto_18426 ?auto_18428 ) ( CLEAR ?auto_18426 ) ( IS-CRATE ?auto_18425 ) ( not ( = ?auto_18425 ?auto_18426 ) ) ( TRUCK-AT ?auto_18429 ?auto_18428 ) ( AVAILABLE ?auto_18427 ) ( IN ?auto_18425 ?auto_18429 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18427 ?auto_18425 ?auto_18429 ?auto_18428 )
      ( MAKE-ON ?auto_18425 ?auto_18426 )
      ( MAKE-ON-VERIFY ?auto_18425 ?auto_18426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18430 - SURFACE
      ?auto_18431 - SURFACE
    )
    :vars
    (
      ?auto_18434 - HOIST
      ?auto_18432 - PLACE
      ?auto_18433 - TRUCK
      ?auto_18435 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18434 ?auto_18432 ) ( SURFACE-AT ?auto_18431 ?auto_18432 ) ( CLEAR ?auto_18431 ) ( IS-CRATE ?auto_18430 ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( AVAILABLE ?auto_18434 ) ( IN ?auto_18430 ?auto_18433 ) ( TRUCK-AT ?auto_18433 ?auto_18435 ) ( not ( = ?auto_18435 ?auto_18432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18433 ?auto_18435 ?auto_18432 )
      ( MAKE-ON ?auto_18430 ?auto_18431 )
      ( MAKE-ON-VERIFY ?auto_18430 ?auto_18431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18436 - SURFACE
      ?auto_18437 - SURFACE
    )
    :vars
    (
      ?auto_18440 - HOIST
      ?auto_18438 - PLACE
      ?auto_18439 - TRUCK
      ?auto_18441 - PLACE
      ?auto_18442 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18440 ?auto_18438 ) ( SURFACE-AT ?auto_18437 ?auto_18438 ) ( CLEAR ?auto_18437 ) ( IS-CRATE ?auto_18436 ) ( not ( = ?auto_18436 ?auto_18437 ) ) ( AVAILABLE ?auto_18440 ) ( TRUCK-AT ?auto_18439 ?auto_18441 ) ( not ( = ?auto_18441 ?auto_18438 ) ) ( HOIST-AT ?auto_18442 ?auto_18441 ) ( LIFTING ?auto_18442 ?auto_18436 ) ( not ( = ?auto_18440 ?auto_18442 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18442 ?auto_18436 ?auto_18439 ?auto_18441 )
      ( MAKE-ON ?auto_18436 ?auto_18437 )
      ( MAKE-ON-VERIFY ?auto_18436 ?auto_18437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18443 - SURFACE
      ?auto_18444 - SURFACE
    )
    :vars
    (
      ?auto_18449 - HOIST
      ?auto_18445 - PLACE
      ?auto_18447 - TRUCK
      ?auto_18446 - PLACE
      ?auto_18448 - HOIST
      ?auto_18450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18449 ?auto_18445 ) ( SURFACE-AT ?auto_18444 ?auto_18445 ) ( CLEAR ?auto_18444 ) ( IS-CRATE ?auto_18443 ) ( not ( = ?auto_18443 ?auto_18444 ) ) ( AVAILABLE ?auto_18449 ) ( TRUCK-AT ?auto_18447 ?auto_18446 ) ( not ( = ?auto_18446 ?auto_18445 ) ) ( HOIST-AT ?auto_18448 ?auto_18446 ) ( not ( = ?auto_18449 ?auto_18448 ) ) ( AVAILABLE ?auto_18448 ) ( SURFACE-AT ?auto_18443 ?auto_18446 ) ( ON ?auto_18443 ?auto_18450 ) ( CLEAR ?auto_18443 ) ( not ( = ?auto_18443 ?auto_18450 ) ) ( not ( = ?auto_18444 ?auto_18450 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18448 ?auto_18443 ?auto_18450 ?auto_18446 )
      ( MAKE-ON ?auto_18443 ?auto_18444 )
      ( MAKE-ON-VERIFY ?auto_18443 ?auto_18444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18451 - SURFACE
      ?auto_18452 - SURFACE
    )
    :vars
    (
      ?auto_18457 - HOIST
      ?auto_18458 - PLACE
      ?auto_18454 - PLACE
      ?auto_18456 - HOIST
      ?auto_18455 - SURFACE
      ?auto_18453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18457 ?auto_18458 ) ( SURFACE-AT ?auto_18452 ?auto_18458 ) ( CLEAR ?auto_18452 ) ( IS-CRATE ?auto_18451 ) ( not ( = ?auto_18451 ?auto_18452 ) ) ( AVAILABLE ?auto_18457 ) ( not ( = ?auto_18454 ?auto_18458 ) ) ( HOIST-AT ?auto_18456 ?auto_18454 ) ( not ( = ?auto_18457 ?auto_18456 ) ) ( AVAILABLE ?auto_18456 ) ( SURFACE-AT ?auto_18451 ?auto_18454 ) ( ON ?auto_18451 ?auto_18455 ) ( CLEAR ?auto_18451 ) ( not ( = ?auto_18451 ?auto_18455 ) ) ( not ( = ?auto_18452 ?auto_18455 ) ) ( TRUCK-AT ?auto_18453 ?auto_18458 ) )
    :subtasks
    ( ( !DRIVE ?auto_18453 ?auto_18458 ?auto_18454 )
      ( MAKE-ON ?auto_18451 ?auto_18452 )
      ( MAKE-ON-VERIFY ?auto_18451 ?auto_18452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18459 - SURFACE
      ?auto_18460 - SURFACE
    )
    :vars
    (
      ?auto_18464 - HOIST
      ?auto_18465 - PLACE
      ?auto_18463 - PLACE
      ?auto_18461 - HOIST
      ?auto_18466 - SURFACE
      ?auto_18462 - TRUCK
      ?auto_18467 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18464 ?auto_18465 ) ( IS-CRATE ?auto_18459 ) ( not ( = ?auto_18459 ?auto_18460 ) ) ( not ( = ?auto_18463 ?auto_18465 ) ) ( HOIST-AT ?auto_18461 ?auto_18463 ) ( not ( = ?auto_18464 ?auto_18461 ) ) ( AVAILABLE ?auto_18461 ) ( SURFACE-AT ?auto_18459 ?auto_18463 ) ( ON ?auto_18459 ?auto_18466 ) ( CLEAR ?auto_18459 ) ( not ( = ?auto_18459 ?auto_18466 ) ) ( not ( = ?auto_18460 ?auto_18466 ) ) ( TRUCK-AT ?auto_18462 ?auto_18465 ) ( SURFACE-AT ?auto_18467 ?auto_18465 ) ( CLEAR ?auto_18467 ) ( LIFTING ?auto_18464 ?auto_18460 ) ( IS-CRATE ?auto_18460 ) ( not ( = ?auto_18459 ?auto_18467 ) ) ( not ( = ?auto_18460 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18467 ) ) )
    :subtasks
    ( ( !DROP ?auto_18464 ?auto_18460 ?auto_18467 ?auto_18465 )
      ( MAKE-ON ?auto_18459 ?auto_18460 )
      ( MAKE-ON-VERIFY ?auto_18459 ?auto_18460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18468 - SURFACE
      ?auto_18469 - SURFACE
    )
    :vars
    (
      ?auto_18471 - HOIST
      ?auto_18474 - PLACE
      ?auto_18476 - PLACE
      ?auto_18473 - HOIST
      ?auto_18472 - SURFACE
      ?auto_18475 - TRUCK
      ?auto_18470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18471 ?auto_18474 ) ( IS-CRATE ?auto_18468 ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18476 ?auto_18474 ) ) ( HOIST-AT ?auto_18473 ?auto_18476 ) ( not ( = ?auto_18471 ?auto_18473 ) ) ( AVAILABLE ?auto_18473 ) ( SURFACE-AT ?auto_18468 ?auto_18476 ) ( ON ?auto_18468 ?auto_18472 ) ( CLEAR ?auto_18468 ) ( not ( = ?auto_18468 ?auto_18472 ) ) ( not ( = ?auto_18469 ?auto_18472 ) ) ( TRUCK-AT ?auto_18475 ?auto_18474 ) ( SURFACE-AT ?auto_18470 ?auto_18474 ) ( CLEAR ?auto_18470 ) ( IS-CRATE ?auto_18469 ) ( not ( = ?auto_18468 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18472 ?auto_18470 ) ) ( AVAILABLE ?auto_18471 ) ( IN ?auto_18469 ?auto_18475 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18471 ?auto_18469 ?auto_18475 ?auto_18474 )
      ( MAKE-ON ?auto_18468 ?auto_18469 )
      ( MAKE-ON-VERIFY ?auto_18468 ?auto_18469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18477 - SURFACE
      ?auto_18478 - SURFACE
    )
    :vars
    (
      ?auto_18480 - HOIST
      ?auto_18485 - PLACE
      ?auto_18483 - PLACE
      ?auto_18479 - HOIST
      ?auto_18482 - SURFACE
      ?auto_18481 - SURFACE
      ?auto_18484 - TRUCK
      ?auto_18486 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18480 ?auto_18485 ) ( IS-CRATE ?auto_18477 ) ( not ( = ?auto_18477 ?auto_18478 ) ) ( not ( = ?auto_18483 ?auto_18485 ) ) ( HOIST-AT ?auto_18479 ?auto_18483 ) ( not ( = ?auto_18480 ?auto_18479 ) ) ( AVAILABLE ?auto_18479 ) ( SURFACE-AT ?auto_18477 ?auto_18483 ) ( ON ?auto_18477 ?auto_18482 ) ( CLEAR ?auto_18477 ) ( not ( = ?auto_18477 ?auto_18482 ) ) ( not ( = ?auto_18478 ?auto_18482 ) ) ( SURFACE-AT ?auto_18481 ?auto_18485 ) ( CLEAR ?auto_18481 ) ( IS-CRATE ?auto_18478 ) ( not ( = ?auto_18477 ?auto_18481 ) ) ( not ( = ?auto_18478 ?auto_18481 ) ) ( not ( = ?auto_18482 ?auto_18481 ) ) ( AVAILABLE ?auto_18480 ) ( IN ?auto_18478 ?auto_18484 ) ( TRUCK-AT ?auto_18484 ?auto_18486 ) ( not ( = ?auto_18486 ?auto_18485 ) ) ( not ( = ?auto_18483 ?auto_18486 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18484 ?auto_18486 ?auto_18485 )
      ( MAKE-ON ?auto_18477 ?auto_18478 )
      ( MAKE-ON-VERIFY ?auto_18477 ?auto_18478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18487 - SURFACE
      ?auto_18488 - SURFACE
    )
    :vars
    (
      ?auto_18490 - HOIST
      ?auto_18489 - PLACE
      ?auto_18494 - PLACE
      ?auto_18496 - HOIST
      ?auto_18495 - SURFACE
      ?auto_18492 - SURFACE
      ?auto_18491 - TRUCK
      ?auto_18493 - PLACE
      ?auto_18497 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18490 ?auto_18489 ) ( IS-CRATE ?auto_18487 ) ( not ( = ?auto_18487 ?auto_18488 ) ) ( not ( = ?auto_18494 ?auto_18489 ) ) ( HOIST-AT ?auto_18496 ?auto_18494 ) ( not ( = ?auto_18490 ?auto_18496 ) ) ( AVAILABLE ?auto_18496 ) ( SURFACE-AT ?auto_18487 ?auto_18494 ) ( ON ?auto_18487 ?auto_18495 ) ( CLEAR ?auto_18487 ) ( not ( = ?auto_18487 ?auto_18495 ) ) ( not ( = ?auto_18488 ?auto_18495 ) ) ( SURFACE-AT ?auto_18492 ?auto_18489 ) ( CLEAR ?auto_18492 ) ( IS-CRATE ?auto_18488 ) ( not ( = ?auto_18487 ?auto_18492 ) ) ( not ( = ?auto_18488 ?auto_18492 ) ) ( not ( = ?auto_18495 ?auto_18492 ) ) ( AVAILABLE ?auto_18490 ) ( TRUCK-AT ?auto_18491 ?auto_18493 ) ( not ( = ?auto_18493 ?auto_18489 ) ) ( not ( = ?auto_18494 ?auto_18493 ) ) ( HOIST-AT ?auto_18497 ?auto_18493 ) ( LIFTING ?auto_18497 ?auto_18488 ) ( not ( = ?auto_18490 ?auto_18497 ) ) ( not ( = ?auto_18496 ?auto_18497 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18497 ?auto_18488 ?auto_18491 ?auto_18493 )
      ( MAKE-ON ?auto_18487 ?auto_18488 )
      ( MAKE-ON-VERIFY ?auto_18487 ?auto_18488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18498 - SURFACE
      ?auto_18499 - SURFACE
    )
    :vars
    (
      ?auto_18505 - HOIST
      ?auto_18501 - PLACE
      ?auto_18502 - PLACE
      ?auto_18507 - HOIST
      ?auto_18503 - SURFACE
      ?auto_18500 - SURFACE
      ?auto_18506 - TRUCK
      ?auto_18504 - PLACE
      ?auto_18508 - HOIST
      ?auto_18509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18505 ?auto_18501 ) ( IS-CRATE ?auto_18498 ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18502 ?auto_18501 ) ) ( HOIST-AT ?auto_18507 ?auto_18502 ) ( not ( = ?auto_18505 ?auto_18507 ) ) ( AVAILABLE ?auto_18507 ) ( SURFACE-AT ?auto_18498 ?auto_18502 ) ( ON ?auto_18498 ?auto_18503 ) ( CLEAR ?auto_18498 ) ( not ( = ?auto_18498 ?auto_18503 ) ) ( not ( = ?auto_18499 ?auto_18503 ) ) ( SURFACE-AT ?auto_18500 ?auto_18501 ) ( CLEAR ?auto_18500 ) ( IS-CRATE ?auto_18499 ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18499 ?auto_18500 ) ) ( not ( = ?auto_18503 ?auto_18500 ) ) ( AVAILABLE ?auto_18505 ) ( TRUCK-AT ?auto_18506 ?auto_18504 ) ( not ( = ?auto_18504 ?auto_18501 ) ) ( not ( = ?auto_18502 ?auto_18504 ) ) ( HOIST-AT ?auto_18508 ?auto_18504 ) ( not ( = ?auto_18505 ?auto_18508 ) ) ( not ( = ?auto_18507 ?auto_18508 ) ) ( AVAILABLE ?auto_18508 ) ( SURFACE-AT ?auto_18499 ?auto_18504 ) ( ON ?auto_18499 ?auto_18509 ) ( CLEAR ?auto_18499 ) ( not ( = ?auto_18498 ?auto_18509 ) ) ( not ( = ?auto_18499 ?auto_18509 ) ) ( not ( = ?auto_18503 ?auto_18509 ) ) ( not ( = ?auto_18500 ?auto_18509 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18508 ?auto_18499 ?auto_18509 ?auto_18504 )
      ( MAKE-ON ?auto_18498 ?auto_18499 )
      ( MAKE-ON-VERIFY ?auto_18498 ?auto_18499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18510 - SURFACE
      ?auto_18511 - SURFACE
    )
    :vars
    (
      ?auto_18520 - HOIST
      ?auto_18515 - PLACE
      ?auto_18512 - PLACE
      ?auto_18516 - HOIST
      ?auto_18521 - SURFACE
      ?auto_18518 - SURFACE
      ?auto_18513 - PLACE
      ?auto_18519 - HOIST
      ?auto_18517 - SURFACE
      ?auto_18514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18520 ?auto_18515 ) ( IS-CRATE ?auto_18510 ) ( not ( = ?auto_18510 ?auto_18511 ) ) ( not ( = ?auto_18512 ?auto_18515 ) ) ( HOIST-AT ?auto_18516 ?auto_18512 ) ( not ( = ?auto_18520 ?auto_18516 ) ) ( AVAILABLE ?auto_18516 ) ( SURFACE-AT ?auto_18510 ?auto_18512 ) ( ON ?auto_18510 ?auto_18521 ) ( CLEAR ?auto_18510 ) ( not ( = ?auto_18510 ?auto_18521 ) ) ( not ( = ?auto_18511 ?auto_18521 ) ) ( SURFACE-AT ?auto_18518 ?auto_18515 ) ( CLEAR ?auto_18518 ) ( IS-CRATE ?auto_18511 ) ( not ( = ?auto_18510 ?auto_18518 ) ) ( not ( = ?auto_18511 ?auto_18518 ) ) ( not ( = ?auto_18521 ?auto_18518 ) ) ( AVAILABLE ?auto_18520 ) ( not ( = ?auto_18513 ?auto_18515 ) ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( HOIST-AT ?auto_18519 ?auto_18513 ) ( not ( = ?auto_18520 ?auto_18519 ) ) ( not ( = ?auto_18516 ?auto_18519 ) ) ( AVAILABLE ?auto_18519 ) ( SURFACE-AT ?auto_18511 ?auto_18513 ) ( ON ?auto_18511 ?auto_18517 ) ( CLEAR ?auto_18511 ) ( not ( = ?auto_18510 ?auto_18517 ) ) ( not ( = ?auto_18511 ?auto_18517 ) ) ( not ( = ?auto_18521 ?auto_18517 ) ) ( not ( = ?auto_18518 ?auto_18517 ) ) ( TRUCK-AT ?auto_18514 ?auto_18515 ) )
    :subtasks
    ( ( !DRIVE ?auto_18514 ?auto_18515 ?auto_18513 )
      ( MAKE-ON ?auto_18510 ?auto_18511 )
      ( MAKE-ON-VERIFY ?auto_18510 ?auto_18511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18522 - SURFACE
      ?auto_18523 - SURFACE
    )
    :vars
    (
      ?auto_18530 - HOIST
      ?auto_18525 - PLACE
      ?auto_18532 - PLACE
      ?auto_18526 - HOIST
      ?auto_18527 - SURFACE
      ?auto_18528 - SURFACE
      ?auto_18533 - PLACE
      ?auto_18531 - HOIST
      ?auto_18529 - SURFACE
      ?auto_18524 - TRUCK
      ?auto_18534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18530 ?auto_18525 ) ( IS-CRATE ?auto_18522 ) ( not ( = ?auto_18522 ?auto_18523 ) ) ( not ( = ?auto_18532 ?auto_18525 ) ) ( HOIST-AT ?auto_18526 ?auto_18532 ) ( not ( = ?auto_18530 ?auto_18526 ) ) ( AVAILABLE ?auto_18526 ) ( SURFACE-AT ?auto_18522 ?auto_18532 ) ( ON ?auto_18522 ?auto_18527 ) ( CLEAR ?auto_18522 ) ( not ( = ?auto_18522 ?auto_18527 ) ) ( not ( = ?auto_18523 ?auto_18527 ) ) ( IS-CRATE ?auto_18523 ) ( not ( = ?auto_18522 ?auto_18528 ) ) ( not ( = ?auto_18523 ?auto_18528 ) ) ( not ( = ?auto_18527 ?auto_18528 ) ) ( not ( = ?auto_18533 ?auto_18525 ) ) ( not ( = ?auto_18532 ?auto_18533 ) ) ( HOIST-AT ?auto_18531 ?auto_18533 ) ( not ( = ?auto_18530 ?auto_18531 ) ) ( not ( = ?auto_18526 ?auto_18531 ) ) ( AVAILABLE ?auto_18531 ) ( SURFACE-AT ?auto_18523 ?auto_18533 ) ( ON ?auto_18523 ?auto_18529 ) ( CLEAR ?auto_18523 ) ( not ( = ?auto_18522 ?auto_18529 ) ) ( not ( = ?auto_18523 ?auto_18529 ) ) ( not ( = ?auto_18527 ?auto_18529 ) ) ( not ( = ?auto_18528 ?auto_18529 ) ) ( TRUCK-AT ?auto_18524 ?auto_18525 ) ( SURFACE-AT ?auto_18534 ?auto_18525 ) ( CLEAR ?auto_18534 ) ( LIFTING ?auto_18530 ?auto_18528 ) ( IS-CRATE ?auto_18528 ) ( not ( = ?auto_18522 ?auto_18534 ) ) ( not ( = ?auto_18523 ?auto_18534 ) ) ( not ( = ?auto_18527 ?auto_18534 ) ) ( not ( = ?auto_18528 ?auto_18534 ) ) ( not ( = ?auto_18529 ?auto_18534 ) ) )
    :subtasks
    ( ( !DROP ?auto_18530 ?auto_18528 ?auto_18534 ?auto_18525 )
      ( MAKE-ON ?auto_18522 ?auto_18523 )
      ( MAKE-ON-VERIFY ?auto_18522 ?auto_18523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18535 - SURFACE
      ?auto_18536 - SURFACE
    )
    :vars
    (
      ?auto_18541 - HOIST
      ?auto_18538 - PLACE
      ?auto_18540 - PLACE
      ?auto_18539 - HOIST
      ?auto_18544 - SURFACE
      ?auto_18537 - SURFACE
      ?auto_18542 - PLACE
      ?auto_18547 - HOIST
      ?auto_18545 - SURFACE
      ?auto_18543 - TRUCK
      ?auto_18546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18541 ?auto_18538 ) ( IS-CRATE ?auto_18535 ) ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18540 ?auto_18538 ) ) ( HOIST-AT ?auto_18539 ?auto_18540 ) ( not ( = ?auto_18541 ?auto_18539 ) ) ( AVAILABLE ?auto_18539 ) ( SURFACE-AT ?auto_18535 ?auto_18540 ) ( ON ?auto_18535 ?auto_18544 ) ( CLEAR ?auto_18535 ) ( not ( = ?auto_18535 ?auto_18544 ) ) ( not ( = ?auto_18536 ?auto_18544 ) ) ( IS-CRATE ?auto_18536 ) ( not ( = ?auto_18535 ?auto_18537 ) ) ( not ( = ?auto_18536 ?auto_18537 ) ) ( not ( = ?auto_18544 ?auto_18537 ) ) ( not ( = ?auto_18542 ?auto_18538 ) ) ( not ( = ?auto_18540 ?auto_18542 ) ) ( HOIST-AT ?auto_18547 ?auto_18542 ) ( not ( = ?auto_18541 ?auto_18547 ) ) ( not ( = ?auto_18539 ?auto_18547 ) ) ( AVAILABLE ?auto_18547 ) ( SURFACE-AT ?auto_18536 ?auto_18542 ) ( ON ?auto_18536 ?auto_18545 ) ( CLEAR ?auto_18536 ) ( not ( = ?auto_18535 ?auto_18545 ) ) ( not ( = ?auto_18536 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( not ( = ?auto_18537 ?auto_18545 ) ) ( TRUCK-AT ?auto_18543 ?auto_18538 ) ( SURFACE-AT ?auto_18546 ?auto_18538 ) ( CLEAR ?auto_18546 ) ( IS-CRATE ?auto_18537 ) ( not ( = ?auto_18535 ?auto_18546 ) ) ( not ( = ?auto_18536 ?auto_18546 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18537 ?auto_18546 ) ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( AVAILABLE ?auto_18541 ) ( IN ?auto_18537 ?auto_18543 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18541 ?auto_18537 ?auto_18543 ?auto_18538 )
      ( MAKE-ON ?auto_18535 ?auto_18536 )
      ( MAKE-ON-VERIFY ?auto_18535 ?auto_18536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18548 - SURFACE
      ?auto_18549 - SURFACE
    )
    :vars
    (
      ?auto_18554 - HOIST
      ?auto_18559 - PLACE
      ?auto_18550 - PLACE
      ?auto_18555 - HOIST
      ?auto_18558 - SURFACE
      ?auto_18553 - SURFACE
      ?auto_18556 - PLACE
      ?auto_18557 - HOIST
      ?auto_18560 - SURFACE
      ?auto_18551 - SURFACE
      ?auto_18552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18554 ?auto_18559 ) ( IS-CRATE ?auto_18548 ) ( not ( = ?auto_18548 ?auto_18549 ) ) ( not ( = ?auto_18550 ?auto_18559 ) ) ( HOIST-AT ?auto_18555 ?auto_18550 ) ( not ( = ?auto_18554 ?auto_18555 ) ) ( AVAILABLE ?auto_18555 ) ( SURFACE-AT ?auto_18548 ?auto_18550 ) ( ON ?auto_18548 ?auto_18558 ) ( CLEAR ?auto_18548 ) ( not ( = ?auto_18548 ?auto_18558 ) ) ( not ( = ?auto_18549 ?auto_18558 ) ) ( IS-CRATE ?auto_18549 ) ( not ( = ?auto_18548 ?auto_18553 ) ) ( not ( = ?auto_18549 ?auto_18553 ) ) ( not ( = ?auto_18558 ?auto_18553 ) ) ( not ( = ?auto_18556 ?auto_18559 ) ) ( not ( = ?auto_18550 ?auto_18556 ) ) ( HOIST-AT ?auto_18557 ?auto_18556 ) ( not ( = ?auto_18554 ?auto_18557 ) ) ( not ( = ?auto_18555 ?auto_18557 ) ) ( AVAILABLE ?auto_18557 ) ( SURFACE-AT ?auto_18549 ?auto_18556 ) ( ON ?auto_18549 ?auto_18560 ) ( CLEAR ?auto_18549 ) ( not ( = ?auto_18548 ?auto_18560 ) ) ( not ( = ?auto_18549 ?auto_18560 ) ) ( not ( = ?auto_18558 ?auto_18560 ) ) ( not ( = ?auto_18553 ?auto_18560 ) ) ( SURFACE-AT ?auto_18551 ?auto_18559 ) ( CLEAR ?auto_18551 ) ( IS-CRATE ?auto_18553 ) ( not ( = ?auto_18548 ?auto_18551 ) ) ( not ( = ?auto_18549 ?auto_18551 ) ) ( not ( = ?auto_18558 ?auto_18551 ) ) ( not ( = ?auto_18553 ?auto_18551 ) ) ( not ( = ?auto_18560 ?auto_18551 ) ) ( AVAILABLE ?auto_18554 ) ( IN ?auto_18553 ?auto_18552 ) ( TRUCK-AT ?auto_18552 ?auto_18550 ) )
    :subtasks
    ( ( !DRIVE ?auto_18552 ?auto_18550 ?auto_18559 )
      ( MAKE-ON ?auto_18548 ?auto_18549 )
      ( MAKE-ON-VERIFY ?auto_18548 ?auto_18549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18561 - SURFACE
      ?auto_18562 - SURFACE
    )
    :vars
    (
      ?auto_18563 - HOIST
      ?auto_18568 - PLACE
      ?auto_18569 - PLACE
      ?auto_18566 - HOIST
      ?auto_18564 - SURFACE
      ?auto_18567 - SURFACE
      ?auto_18571 - PLACE
      ?auto_18570 - HOIST
      ?auto_18573 - SURFACE
      ?auto_18572 - SURFACE
      ?auto_18565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18563 ?auto_18568 ) ( IS-CRATE ?auto_18561 ) ( not ( = ?auto_18561 ?auto_18562 ) ) ( not ( = ?auto_18569 ?auto_18568 ) ) ( HOIST-AT ?auto_18566 ?auto_18569 ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( SURFACE-AT ?auto_18561 ?auto_18569 ) ( ON ?auto_18561 ?auto_18564 ) ( CLEAR ?auto_18561 ) ( not ( = ?auto_18561 ?auto_18564 ) ) ( not ( = ?auto_18562 ?auto_18564 ) ) ( IS-CRATE ?auto_18562 ) ( not ( = ?auto_18561 ?auto_18567 ) ) ( not ( = ?auto_18562 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18571 ?auto_18568 ) ) ( not ( = ?auto_18569 ?auto_18571 ) ) ( HOIST-AT ?auto_18570 ?auto_18571 ) ( not ( = ?auto_18563 ?auto_18570 ) ) ( not ( = ?auto_18566 ?auto_18570 ) ) ( AVAILABLE ?auto_18570 ) ( SURFACE-AT ?auto_18562 ?auto_18571 ) ( ON ?auto_18562 ?auto_18573 ) ( CLEAR ?auto_18562 ) ( not ( = ?auto_18561 ?auto_18573 ) ) ( not ( = ?auto_18562 ?auto_18573 ) ) ( not ( = ?auto_18564 ?auto_18573 ) ) ( not ( = ?auto_18567 ?auto_18573 ) ) ( SURFACE-AT ?auto_18572 ?auto_18568 ) ( CLEAR ?auto_18572 ) ( IS-CRATE ?auto_18567 ) ( not ( = ?auto_18561 ?auto_18572 ) ) ( not ( = ?auto_18562 ?auto_18572 ) ) ( not ( = ?auto_18564 ?auto_18572 ) ) ( not ( = ?auto_18567 ?auto_18572 ) ) ( not ( = ?auto_18573 ?auto_18572 ) ) ( AVAILABLE ?auto_18563 ) ( TRUCK-AT ?auto_18565 ?auto_18569 ) ( LIFTING ?auto_18566 ?auto_18567 ) )
    :subtasks
    ( ( !LOAD ?auto_18566 ?auto_18567 ?auto_18565 ?auto_18569 )
      ( MAKE-ON ?auto_18561 ?auto_18562 )
      ( MAKE-ON-VERIFY ?auto_18561 ?auto_18562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18574 - SURFACE
      ?auto_18575 - SURFACE
    )
    :vars
    (
      ?auto_18586 - HOIST
      ?auto_18583 - PLACE
      ?auto_18576 - PLACE
      ?auto_18581 - HOIST
      ?auto_18578 - SURFACE
      ?auto_18585 - SURFACE
      ?auto_18580 - PLACE
      ?auto_18582 - HOIST
      ?auto_18584 - SURFACE
      ?auto_18579 - SURFACE
      ?auto_18577 - TRUCK
      ?auto_18587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18586 ?auto_18583 ) ( IS-CRATE ?auto_18574 ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18576 ?auto_18583 ) ) ( HOIST-AT ?auto_18581 ?auto_18576 ) ( not ( = ?auto_18586 ?auto_18581 ) ) ( SURFACE-AT ?auto_18574 ?auto_18576 ) ( ON ?auto_18574 ?auto_18578 ) ( CLEAR ?auto_18574 ) ( not ( = ?auto_18574 ?auto_18578 ) ) ( not ( = ?auto_18575 ?auto_18578 ) ) ( IS-CRATE ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18585 ) ) ( not ( = ?auto_18575 ?auto_18585 ) ) ( not ( = ?auto_18578 ?auto_18585 ) ) ( not ( = ?auto_18580 ?auto_18583 ) ) ( not ( = ?auto_18576 ?auto_18580 ) ) ( HOIST-AT ?auto_18582 ?auto_18580 ) ( not ( = ?auto_18586 ?auto_18582 ) ) ( not ( = ?auto_18581 ?auto_18582 ) ) ( AVAILABLE ?auto_18582 ) ( SURFACE-AT ?auto_18575 ?auto_18580 ) ( ON ?auto_18575 ?auto_18584 ) ( CLEAR ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18584 ) ) ( not ( = ?auto_18575 ?auto_18584 ) ) ( not ( = ?auto_18578 ?auto_18584 ) ) ( not ( = ?auto_18585 ?auto_18584 ) ) ( SURFACE-AT ?auto_18579 ?auto_18583 ) ( CLEAR ?auto_18579 ) ( IS-CRATE ?auto_18585 ) ( not ( = ?auto_18574 ?auto_18579 ) ) ( not ( = ?auto_18575 ?auto_18579 ) ) ( not ( = ?auto_18578 ?auto_18579 ) ) ( not ( = ?auto_18585 ?auto_18579 ) ) ( not ( = ?auto_18584 ?auto_18579 ) ) ( AVAILABLE ?auto_18586 ) ( TRUCK-AT ?auto_18577 ?auto_18576 ) ( AVAILABLE ?auto_18581 ) ( SURFACE-AT ?auto_18585 ?auto_18576 ) ( ON ?auto_18585 ?auto_18587 ) ( CLEAR ?auto_18585 ) ( not ( = ?auto_18574 ?auto_18587 ) ) ( not ( = ?auto_18575 ?auto_18587 ) ) ( not ( = ?auto_18578 ?auto_18587 ) ) ( not ( = ?auto_18585 ?auto_18587 ) ) ( not ( = ?auto_18584 ?auto_18587 ) ) ( not ( = ?auto_18579 ?auto_18587 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18581 ?auto_18585 ?auto_18587 ?auto_18576 )
      ( MAKE-ON ?auto_18574 ?auto_18575 )
      ( MAKE-ON-VERIFY ?auto_18574 ?auto_18575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18588 - SURFACE
      ?auto_18589 - SURFACE
    )
    :vars
    (
      ?auto_18595 - HOIST
      ?auto_18592 - PLACE
      ?auto_18594 - PLACE
      ?auto_18596 - HOIST
      ?auto_18601 - SURFACE
      ?auto_18600 - SURFACE
      ?auto_18599 - PLACE
      ?auto_18590 - HOIST
      ?auto_18593 - SURFACE
      ?auto_18598 - SURFACE
      ?auto_18597 - SURFACE
      ?auto_18591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18595 ?auto_18592 ) ( IS-CRATE ?auto_18588 ) ( not ( = ?auto_18588 ?auto_18589 ) ) ( not ( = ?auto_18594 ?auto_18592 ) ) ( HOIST-AT ?auto_18596 ?auto_18594 ) ( not ( = ?auto_18595 ?auto_18596 ) ) ( SURFACE-AT ?auto_18588 ?auto_18594 ) ( ON ?auto_18588 ?auto_18601 ) ( CLEAR ?auto_18588 ) ( not ( = ?auto_18588 ?auto_18601 ) ) ( not ( = ?auto_18589 ?auto_18601 ) ) ( IS-CRATE ?auto_18589 ) ( not ( = ?auto_18588 ?auto_18600 ) ) ( not ( = ?auto_18589 ?auto_18600 ) ) ( not ( = ?auto_18601 ?auto_18600 ) ) ( not ( = ?auto_18599 ?auto_18592 ) ) ( not ( = ?auto_18594 ?auto_18599 ) ) ( HOIST-AT ?auto_18590 ?auto_18599 ) ( not ( = ?auto_18595 ?auto_18590 ) ) ( not ( = ?auto_18596 ?auto_18590 ) ) ( AVAILABLE ?auto_18590 ) ( SURFACE-AT ?auto_18589 ?auto_18599 ) ( ON ?auto_18589 ?auto_18593 ) ( CLEAR ?auto_18589 ) ( not ( = ?auto_18588 ?auto_18593 ) ) ( not ( = ?auto_18589 ?auto_18593 ) ) ( not ( = ?auto_18601 ?auto_18593 ) ) ( not ( = ?auto_18600 ?auto_18593 ) ) ( SURFACE-AT ?auto_18598 ?auto_18592 ) ( CLEAR ?auto_18598 ) ( IS-CRATE ?auto_18600 ) ( not ( = ?auto_18588 ?auto_18598 ) ) ( not ( = ?auto_18589 ?auto_18598 ) ) ( not ( = ?auto_18601 ?auto_18598 ) ) ( not ( = ?auto_18600 ?auto_18598 ) ) ( not ( = ?auto_18593 ?auto_18598 ) ) ( AVAILABLE ?auto_18595 ) ( AVAILABLE ?auto_18596 ) ( SURFACE-AT ?auto_18600 ?auto_18594 ) ( ON ?auto_18600 ?auto_18597 ) ( CLEAR ?auto_18600 ) ( not ( = ?auto_18588 ?auto_18597 ) ) ( not ( = ?auto_18589 ?auto_18597 ) ) ( not ( = ?auto_18601 ?auto_18597 ) ) ( not ( = ?auto_18600 ?auto_18597 ) ) ( not ( = ?auto_18593 ?auto_18597 ) ) ( not ( = ?auto_18598 ?auto_18597 ) ) ( TRUCK-AT ?auto_18591 ?auto_18592 ) )
    :subtasks
    ( ( !DRIVE ?auto_18591 ?auto_18592 ?auto_18594 )
      ( MAKE-ON ?auto_18588 ?auto_18589 )
      ( MAKE-ON-VERIFY ?auto_18588 ?auto_18589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18604 - SURFACE
      ?auto_18605 - SURFACE
    )
    :vars
    (
      ?auto_18606 - HOIST
      ?auto_18607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18606 ?auto_18607 ) ( SURFACE-AT ?auto_18605 ?auto_18607 ) ( CLEAR ?auto_18605 ) ( LIFTING ?auto_18606 ?auto_18604 ) ( IS-CRATE ?auto_18604 ) ( not ( = ?auto_18604 ?auto_18605 ) ) )
    :subtasks
    ( ( !DROP ?auto_18606 ?auto_18604 ?auto_18605 ?auto_18607 )
      ( MAKE-ON-VERIFY ?auto_18604 ?auto_18605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18608 - SURFACE
      ?auto_18609 - SURFACE
    )
    :vars
    (
      ?auto_18610 - HOIST
      ?auto_18611 - PLACE
      ?auto_18612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18610 ?auto_18611 ) ( SURFACE-AT ?auto_18609 ?auto_18611 ) ( CLEAR ?auto_18609 ) ( IS-CRATE ?auto_18608 ) ( not ( = ?auto_18608 ?auto_18609 ) ) ( TRUCK-AT ?auto_18612 ?auto_18611 ) ( AVAILABLE ?auto_18610 ) ( IN ?auto_18608 ?auto_18612 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18610 ?auto_18608 ?auto_18612 ?auto_18611 )
      ( MAKE-ON ?auto_18608 ?auto_18609 )
      ( MAKE-ON-VERIFY ?auto_18608 ?auto_18609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18613 - SURFACE
      ?auto_18614 - SURFACE
    )
    :vars
    (
      ?auto_18615 - HOIST
      ?auto_18616 - PLACE
      ?auto_18617 - TRUCK
      ?auto_18618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18615 ?auto_18616 ) ( SURFACE-AT ?auto_18614 ?auto_18616 ) ( CLEAR ?auto_18614 ) ( IS-CRATE ?auto_18613 ) ( not ( = ?auto_18613 ?auto_18614 ) ) ( AVAILABLE ?auto_18615 ) ( IN ?auto_18613 ?auto_18617 ) ( TRUCK-AT ?auto_18617 ?auto_18618 ) ( not ( = ?auto_18618 ?auto_18616 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18617 ?auto_18618 ?auto_18616 )
      ( MAKE-ON ?auto_18613 ?auto_18614 )
      ( MAKE-ON-VERIFY ?auto_18613 ?auto_18614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18619 - SURFACE
      ?auto_18620 - SURFACE
    )
    :vars
    (
      ?auto_18624 - HOIST
      ?auto_18621 - PLACE
      ?auto_18623 - TRUCK
      ?auto_18622 - PLACE
      ?auto_18625 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18624 ?auto_18621 ) ( SURFACE-AT ?auto_18620 ?auto_18621 ) ( CLEAR ?auto_18620 ) ( IS-CRATE ?auto_18619 ) ( not ( = ?auto_18619 ?auto_18620 ) ) ( AVAILABLE ?auto_18624 ) ( TRUCK-AT ?auto_18623 ?auto_18622 ) ( not ( = ?auto_18622 ?auto_18621 ) ) ( HOIST-AT ?auto_18625 ?auto_18622 ) ( LIFTING ?auto_18625 ?auto_18619 ) ( not ( = ?auto_18624 ?auto_18625 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18625 ?auto_18619 ?auto_18623 ?auto_18622 )
      ( MAKE-ON ?auto_18619 ?auto_18620 )
      ( MAKE-ON-VERIFY ?auto_18619 ?auto_18620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18626 - SURFACE
      ?auto_18627 - SURFACE
    )
    :vars
    (
      ?auto_18628 - HOIST
      ?auto_18630 - PLACE
      ?auto_18632 - TRUCK
      ?auto_18631 - PLACE
      ?auto_18629 - HOIST
      ?auto_18633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18628 ?auto_18630 ) ( SURFACE-AT ?auto_18627 ?auto_18630 ) ( CLEAR ?auto_18627 ) ( IS-CRATE ?auto_18626 ) ( not ( = ?auto_18626 ?auto_18627 ) ) ( AVAILABLE ?auto_18628 ) ( TRUCK-AT ?auto_18632 ?auto_18631 ) ( not ( = ?auto_18631 ?auto_18630 ) ) ( HOIST-AT ?auto_18629 ?auto_18631 ) ( not ( = ?auto_18628 ?auto_18629 ) ) ( AVAILABLE ?auto_18629 ) ( SURFACE-AT ?auto_18626 ?auto_18631 ) ( ON ?auto_18626 ?auto_18633 ) ( CLEAR ?auto_18626 ) ( not ( = ?auto_18626 ?auto_18633 ) ) ( not ( = ?auto_18627 ?auto_18633 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18629 ?auto_18626 ?auto_18633 ?auto_18631 )
      ( MAKE-ON ?auto_18626 ?auto_18627 )
      ( MAKE-ON-VERIFY ?auto_18626 ?auto_18627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18634 - SURFACE
      ?auto_18635 - SURFACE
    )
    :vars
    (
      ?auto_18637 - HOIST
      ?auto_18638 - PLACE
      ?auto_18641 - PLACE
      ?auto_18639 - HOIST
      ?auto_18640 - SURFACE
      ?auto_18636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18637 ?auto_18638 ) ( SURFACE-AT ?auto_18635 ?auto_18638 ) ( CLEAR ?auto_18635 ) ( IS-CRATE ?auto_18634 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( AVAILABLE ?auto_18637 ) ( not ( = ?auto_18641 ?auto_18638 ) ) ( HOIST-AT ?auto_18639 ?auto_18641 ) ( not ( = ?auto_18637 ?auto_18639 ) ) ( AVAILABLE ?auto_18639 ) ( SURFACE-AT ?auto_18634 ?auto_18641 ) ( ON ?auto_18634 ?auto_18640 ) ( CLEAR ?auto_18634 ) ( not ( = ?auto_18634 ?auto_18640 ) ) ( not ( = ?auto_18635 ?auto_18640 ) ) ( TRUCK-AT ?auto_18636 ?auto_18638 ) )
    :subtasks
    ( ( !DRIVE ?auto_18636 ?auto_18638 ?auto_18641 )
      ( MAKE-ON ?auto_18634 ?auto_18635 )
      ( MAKE-ON-VERIFY ?auto_18634 ?auto_18635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18642 - SURFACE
      ?auto_18643 - SURFACE
    )
    :vars
    (
      ?auto_18648 - HOIST
      ?auto_18646 - PLACE
      ?auto_18649 - PLACE
      ?auto_18647 - HOIST
      ?auto_18645 - SURFACE
      ?auto_18644 - TRUCK
      ?auto_18650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18648 ?auto_18646 ) ( IS-CRATE ?auto_18642 ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( not ( = ?auto_18649 ?auto_18646 ) ) ( HOIST-AT ?auto_18647 ?auto_18649 ) ( not ( = ?auto_18648 ?auto_18647 ) ) ( AVAILABLE ?auto_18647 ) ( SURFACE-AT ?auto_18642 ?auto_18649 ) ( ON ?auto_18642 ?auto_18645 ) ( CLEAR ?auto_18642 ) ( not ( = ?auto_18642 ?auto_18645 ) ) ( not ( = ?auto_18643 ?auto_18645 ) ) ( TRUCK-AT ?auto_18644 ?auto_18646 ) ( SURFACE-AT ?auto_18650 ?auto_18646 ) ( CLEAR ?auto_18650 ) ( LIFTING ?auto_18648 ?auto_18643 ) ( IS-CRATE ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18650 ) ) ( not ( = ?auto_18643 ?auto_18650 ) ) ( not ( = ?auto_18645 ?auto_18650 ) ) )
    :subtasks
    ( ( !DROP ?auto_18648 ?auto_18643 ?auto_18650 ?auto_18646 )
      ( MAKE-ON ?auto_18642 ?auto_18643 )
      ( MAKE-ON-VERIFY ?auto_18642 ?auto_18643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18651 - SURFACE
      ?auto_18652 - SURFACE
    )
    :vars
    (
      ?auto_18657 - HOIST
      ?auto_18655 - PLACE
      ?auto_18653 - PLACE
      ?auto_18656 - HOIST
      ?auto_18654 - SURFACE
      ?auto_18658 - TRUCK
      ?auto_18659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18657 ?auto_18655 ) ( IS-CRATE ?auto_18651 ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18653 ?auto_18655 ) ) ( HOIST-AT ?auto_18656 ?auto_18653 ) ( not ( = ?auto_18657 ?auto_18656 ) ) ( AVAILABLE ?auto_18656 ) ( SURFACE-AT ?auto_18651 ?auto_18653 ) ( ON ?auto_18651 ?auto_18654 ) ( CLEAR ?auto_18651 ) ( not ( = ?auto_18651 ?auto_18654 ) ) ( not ( = ?auto_18652 ?auto_18654 ) ) ( TRUCK-AT ?auto_18658 ?auto_18655 ) ( SURFACE-AT ?auto_18659 ?auto_18655 ) ( CLEAR ?auto_18659 ) ( IS-CRATE ?auto_18652 ) ( not ( = ?auto_18651 ?auto_18659 ) ) ( not ( = ?auto_18652 ?auto_18659 ) ) ( not ( = ?auto_18654 ?auto_18659 ) ) ( AVAILABLE ?auto_18657 ) ( IN ?auto_18652 ?auto_18658 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18657 ?auto_18652 ?auto_18658 ?auto_18655 )
      ( MAKE-ON ?auto_18651 ?auto_18652 )
      ( MAKE-ON-VERIFY ?auto_18651 ?auto_18652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18660 - SURFACE
      ?auto_18661 - SURFACE
    )
    :vars
    (
      ?auto_18662 - HOIST
      ?auto_18666 - PLACE
      ?auto_18668 - PLACE
      ?auto_18667 - HOIST
      ?auto_18663 - SURFACE
      ?auto_18664 - SURFACE
      ?auto_18665 - TRUCK
      ?auto_18669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18662 ?auto_18666 ) ( IS-CRATE ?auto_18660 ) ( not ( = ?auto_18660 ?auto_18661 ) ) ( not ( = ?auto_18668 ?auto_18666 ) ) ( HOIST-AT ?auto_18667 ?auto_18668 ) ( not ( = ?auto_18662 ?auto_18667 ) ) ( AVAILABLE ?auto_18667 ) ( SURFACE-AT ?auto_18660 ?auto_18668 ) ( ON ?auto_18660 ?auto_18663 ) ( CLEAR ?auto_18660 ) ( not ( = ?auto_18660 ?auto_18663 ) ) ( not ( = ?auto_18661 ?auto_18663 ) ) ( SURFACE-AT ?auto_18664 ?auto_18666 ) ( CLEAR ?auto_18664 ) ( IS-CRATE ?auto_18661 ) ( not ( = ?auto_18660 ?auto_18664 ) ) ( not ( = ?auto_18661 ?auto_18664 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( AVAILABLE ?auto_18662 ) ( IN ?auto_18661 ?auto_18665 ) ( TRUCK-AT ?auto_18665 ?auto_18669 ) ( not ( = ?auto_18669 ?auto_18666 ) ) ( not ( = ?auto_18668 ?auto_18669 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18665 ?auto_18669 ?auto_18666 )
      ( MAKE-ON ?auto_18660 ?auto_18661 )
      ( MAKE-ON-VERIFY ?auto_18660 ?auto_18661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18670 - SURFACE
      ?auto_18671 - SURFACE
    )
    :vars
    (
      ?auto_18672 - HOIST
      ?auto_18673 - PLACE
      ?auto_18677 - PLACE
      ?auto_18678 - HOIST
      ?auto_18676 - SURFACE
      ?auto_18675 - SURFACE
      ?auto_18674 - TRUCK
      ?auto_18679 - PLACE
      ?auto_18680 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18672 ?auto_18673 ) ( IS-CRATE ?auto_18670 ) ( not ( = ?auto_18670 ?auto_18671 ) ) ( not ( = ?auto_18677 ?auto_18673 ) ) ( HOIST-AT ?auto_18678 ?auto_18677 ) ( not ( = ?auto_18672 ?auto_18678 ) ) ( AVAILABLE ?auto_18678 ) ( SURFACE-AT ?auto_18670 ?auto_18677 ) ( ON ?auto_18670 ?auto_18676 ) ( CLEAR ?auto_18670 ) ( not ( = ?auto_18670 ?auto_18676 ) ) ( not ( = ?auto_18671 ?auto_18676 ) ) ( SURFACE-AT ?auto_18675 ?auto_18673 ) ( CLEAR ?auto_18675 ) ( IS-CRATE ?auto_18671 ) ( not ( = ?auto_18670 ?auto_18675 ) ) ( not ( = ?auto_18671 ?auto_18675 ) ) ( not ( = ?auto_18676 ?auto_18675 ) ) ( AVAILABLE ?auto_18672 ) ( TRUCK-AT ?auto_18674 ?auto_18679 ) ( not ( = ?auto_18679 ?auto_18673 ) ) ( not ( = ?auto_18677 ?auto_18679 ) ) ( HOIST-AT ?auto_18680 ?auto_18679 ) ( LIFTING ?auto_18680 ?auto_18671 ) ( not ( = ?auto_18672 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18680 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18680 ?auto_18671 ?auto_18674 ?auto_18679 )
      ( MAKE-ON ?auto_18670 ?auto_18671 )
      ( MAKE-ON-VERIFY ?auto_18670 ?auto_18671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18681 - SURFACE
      ?auto_18682 - SURFACE
    )
    :vars
    (
      ?auto_18689 - HOIST
      ?auto_18683 - PLACE
      ?auto_18690 - PLACE
      ?auto_18685 - HOIST
      ?auto_18691 - SURFACE
      ?auto_18687 - SURFACE
      ?auto_18688 - TRUCK
      ?auto_18684 - PLACE
      ?auto_18686 - HOIST
      ?auto_18692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18689 ?auto_18683 ) ( IS-CRATE ?auto_18681 ) ( not ( = ?auto_18681 ?auto_18682 ) ) ( not ( = ?auto_18690 ?auto_18683 ) ) ( HOIST-AT ?auto_18685 ?auto_18690 ) ( not ( = ?auto_18689 ?auto_18685 ) ) ( AVAILABLE ?auto_18685 ) ( SURFACE-AT ?auto_18681 ?auto_18690 ) ( ON ?auto_18681 ?auto_18691 ) ( CLEAR ?auto_18681 ) ( not ( = ?auto_18681 ?auto_18691 ) ) ( not ( = ?auto_18682 ?auto_18691 ) ) ( SURFACE-AT ?auto_18687 ?auto_18683 ) ( CLEAR ?auto_18687 ) ( IS-CRATE ?auto_18682 ) ( not ( = ?auto_18681 ?auto_18687 ) ) ( not ( = ?auto_18682 ?auto_18687 ) ) ( not ( = ?auto_18691 ?auto_18687 ) ) ( AVAILABLE ?auto_18689 ) ( TRUCK-AT ?auto_18688 ?auto_18684 ) ( not ( = ?auto_18684 ?auto_18683 ) ) ( not ( = ?auto_18690 ?auto_18684 ) ) ( HOIST-AT ?auto_18686 ?auto_18684 ) ( not ( = ?auto_18689 ?auto_18686 ) ) ( not ( = ?auto_18685 ?auto_18686 ) ) ( AVAILABLE ?auto_18686 ) ( SURFACE-AT ?auto_18682 ?auto_18684 ) ( ON ?auto_18682 ?auto_18692 ) ( CLEAR ?auto_18682 ) ( not ( = ?auto_18681 ?auto_18692 ) ) ( not ( = ?auto_18682 ?auto_18692 ) ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18687 ?auto_18692 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18686 ?auto_18682 ?auto_18692 ?auto_18684 )
      ( MAKE-ON ?auto_18681 ?auto_18682 )
      ( MAKE-ON-VERIFY ?auto_18681 ?auto_18682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18693 - SURFACE
      ?auto_18694 - SURFACE
    )
    :vars
    (
      ?auto_18701 - HOIST
      ?auto_18698 - PLACE
      ?auto_18699 - PLACE
      ?auto_18695 - HOIST
      ?auto_18702 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18700 - PLACE
      ?auto_18703 - HOIST
      ?auto_18704 - SURFACE
      ?auto_18697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18701 ?auto_18698 ) ( IS-CRATE ?auto_18693 ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18699 ?auto_18698 ) ) ( HOIST-AT ?auto_18695 ?auto_18699 ) ( not ( = ?auto_18701 ?auto_18695 ) ) ( AVAILABLE ?auto_18695 ) ( SURFACE-AT ?auto_18693 ?auto_18699 ) ( ON ?auto_18693 ?auto_18702 ) ( CLEAR ?auto_18693 ) ( not ( = ?auto_18693 ?auto_18702 ) ) ( not ( = ?auto_18694 ?auto_18702 ) ) ( SURFACE-AT ?auto_18696 ?auto_18698 ) ( CLEAR ?auto_18696 ) ( IS-CRATE ?auto_18694 ) ( not ( = ?auto_18693 ?auto_18696 ) ) ( not ( = ?auto_18694 ?auto_18696 ) ) ( not ( = ?auto_18702 ?auto_18696 ) ) ( AVAILABLE ?auto_18701 ) ( not ( = ?auto_18700 ?auto_18698 ) ) ( not ( = ?auto_18699 ?auto_18700 ) ) ( HOIST-AT ?auto_18703 ?auto_18700 ) ( not ( = ?auto_18701 ?auto_18703 ) ) ( not ( = ?auto_18695 ?auto_18703 ) ) ( AVAILABLE ?auto_18703 ) ( SURFACE-AT ?auto_18694 ?auto_18700 ) ( ON ?auto_18694 ?auto_18704 ) ( CLEAR ?auto_18694 ) ( not ( = ?auto_18693 ?auto_18704 ) ) ( not ( = ?auto_18694 ?auto_18704 ) ) ( not ( = ?auto_18702 ?auto_18704 ) ) ( not ( = ?auto_18696 ?auto_18704 ) ) ( TRUCK-AT ?auto_18697 ?auto_18698 ) )
    :subtasks
    ( ( !DRIVE ?auto_18697 ?auto_18698 ?auto_18700 )
      ( MAKE-ON ?auto_18693 ?auto_18694 )
      ( MAKE-ON-VERIFY ?auto_18693 ?auto_18694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18705 - SURFACE
      ?auto_18706 - SURFACE
    )
    :vars
    (
      ?auto_18709 - HOIST
      ?auto_18710 - PLACE
      ?auto_18712 - PLACE
      ?auto_18707 - HOIST
      ?auto_18711 - SURFACE
      ?auto_18708 - SURFACE
      ?auto_18716 - PLACE
      ?auto_18714 - HOIST
      ?auto_18715 - SURFACE
      ?auto_18713 - TRUCK
      ?auto_18717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18709 ?auto_18710 ) ( IS-CRATE ?auto_18705 ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18712 ?auto_18710 ) ) ( HOIST-AT ?auto_18707 ?auto_18712 ) ( not ( = ?auto_18709 ?auto_18707 ) ) ( AVAILABLE ?auto_18707 ) ( SURFACE-AT ?auto_18705 ?auto_18712 ) ( ON ?auto_18705 ?auto_18711 ) ( CLEAR ?auto_18705 ) ( not ( = ?auto_18705 ?auto_18711 ) ) ( not ( = ?auto_18706 ?auto_18711 ) ) ( IS-CRATE ?auto_18706 ) ( not ( = ?auto_18705 ?auto_18708 ) ) ( not ( = ?auto_18706 ?auto_18708 ) ) ( not ( = ?auto_18711 ?auto_18708 ) ) ( not ( = ?auto_18716 ?auto_18710 ) ) ( not ( = ?auto_18712 ?auto_18716 ) ) ( HOIST-AT ?auto_18714 ?auto_18716 ) ( not ( = ?auto_18709 ?auto_18714 ) ) ( not ( = ?auto_18707 ?auto_18714 ) ) ( AVAILABLE ?auto_18714 ) ( SURFACE-AT ?auto_18706 ?auto_18716 ) ( ON ?auto_18706 ?auto_18715 ) ( CLEAR ?auto_18706 ) ( not ( = ?auto_18705 ?auto_18715 ) ) ( not ( = ?auto_18706 ?auto_18715 ) ) ( not ( = ?auto_18711 ?auto_18715 ) ) ( not ( = ?auto_18708 ?auto_18715 ) ) ( TRUCK-AT ?auto_18713 ?auto_18710 ) ( SURFACE-AT ?auto_18717 ?auto_18710 ) ( CLEAR ?auto_18717 ) ( LIFTING ?auto_18709 ?auto_18708 ) ( IS-CRATE ?auto_18708 ) ( not ( = ?auto_18705 ?auto_18717 ) ) ( not ( = ?auto_18706 ?auto_18717 ) ) ( not ( = ?auto_18711 ?auto_18717 ) ) ( not ( = ?auto_18708 ?auto_18717 ) ) ( not ( = ?auto_18715 ?auto_18717 ) ) )
    :subtasks
    ( ( !DROP ?auto_18709 ?auto_18708 ?auto_18717 ?auto_18710 )
      ( MAKE-ON ?auto_18705 ?auto_18706 )
      ( MAKE-ON-VERIFY ?auto_18705 ?auto_18706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18718 - SURFACE
      ?auto_18719 - SURFACE
    )
    :vars
    (
      ?auto_18728 - HOIST
      ?auto_18722 - PLACE
      ?auto_18721 - PLACE
      ?auto_18730 - HOIST
      ?auto_18727 - SURFACE
      ?auto_18726 - SURFACE
      ?auto_18725 - PLACE
      ?auto_18720 - HOIST
      ?auto_18723 - SURFACE
      ?auto_18724 - TRUCK
      ?auto_18729 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18728 ?auto_18722 ) ( IS-CRATE ?auto_18718 ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( HOIST-AT ?auto_18730 ?auto_18721 ) ( not ( = ?auto_18728 ?auto_18730 ) ) ( AVAILABLE ?auto_18730 ) ( SURFACE-AT ?auto_18718 ?auto_18721 ) ( ON ?auto_18718 ?auto_18727 ) ( CLEAR ?auto_18718 ) ( not ( = ?auto_18718 ?auto_18727 ) ) ( not ( = ?auto_18719 ?auto_18727 ) ) ( IS-CRATE ?auto_18719 ) ( not ( = ?auto_18718 ?auto_18726 ) ) ( not ( = ?auto_18719 ?auto_18726 ) ) ( not ( = ?auto_18727 ?auto_18726 ) ) ( not ( = ?auto_18725 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18725 ) ) ( HOIST-AT ?auto_18720 ?auto_18725 ) ( not ( = ?auto_18728 ?auto_18720 ) ) ( not ( = ?auto_18730 ?auto_18720 ) ) ( AVAILABLE ?auto_18720 ) ( SURFACE-AT ?auto_18719 ?auto_18725 ) ( ON ?auto_18719 ?auto_18723 ) ( CLEAR ?auto_18719 ) ( not ( = ?auto_18718 ?auto_18723 ) ) ( not ( = ?auto_18719 ?auto_18723 ) ) ( not ( = ?auto_18727 ?auto_18723 ) ) ( not ( = ?auto_18726 ?auto_18723 ) ) ( TRUCK-AT ?auto_18724 ?auto_18722 ) ( SURFACE-AT ?auto_18729 ?auto_18722 ) ( CLEAR ?auto_18729 ) ( IS-CRATE ?auto_18726 ) ( not ( = ?auto_18718 ?auto_18729 ) ) ( not ( = ?auto_18719 ?auto_18729 ) ) ( not ( = ?auto_18727 ?auto_18729 ) ) ( not ( = ?auto_18726 ?auto_18729 ) ) ( not ( = ?auto_18723 ?auto_18729 ) ) ( AVAILABLE ?auto_18728 ) ( IN ?auto_18726 ?auto_18724 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18728 ?auto_18726 ?auto_18724 ?auto_18722 )
      ( MAKE-ON ?auto_18718 ?auto_18719 )
      ( MAKE-ON-VERIFY ?auto_18718 ?auto_18719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18731 - SURFACE
      ?auto_18732 - SURFACE
    )
    :vars
    (
      ?auto_18733 - HOIST
      ?auto_18740 - PLACE
      ?auto_18743 - PLACE
      ?auto_18741 - HOIST
      ?auto_18738 - SURFACE
      ?auto_18734 - SURFACE
      ?auto_18742 - PLACE
      ?auto_18736 - HOIST
      ?auto_18735 - SURFACE
      ?auto_18739 - SURFACE
      ?auto_18737 - TRUCK
      ?auto_18744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18733 ?auto_18740 ) ( IS-CRATE ?auto_18731 ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18743 ?auto_18740 ) ) ( HOIST-AT ?auto_18741 ?auto_18743 ) ( not ( = ?auto_18733 ?auto_18741 ) ) ( AVAILABLE ?auto_18741 ) ( SURFACE-AT ?auto_18731 ?auto_18743 ) ( ON ?auto_18731 ?auto_18738 ) ( CLEAR ?auto_18731 ) ( not ( = ?auto_18731 ?auto_18738 ) ) ( not ( = ?auto_18732 ?auto_18738 ) ) ( IS-CRATE ?auto_18732 ) ( not ( = ?auto_18731 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( not ( = ?auto_18738 ?auto_18734 ) ) ( not ( = ?auto_18742 ?auto_18740 ) ) ( not ( = ?auto_18743 ?auto_18742 ) ) ( HOIST-AT ?auto_18736 ?auto_18742 ) ( not ( = ?auto_18733 ?auto_18736 ) ) ( not ( = ?auto_18741 ?auto_18736 ) ) ( AVAILABLE ?auto_18736 ) ( SURFACE-AT ?auto_18732 ?auto_18742 ) ( ON ?auto_18732 ?auto_18735 ) ( CLEAR ?auto_18732 ) ( not ( = ?auto_18731 ?auto_18735 ) ) ( not ( = ?auto_18732 ?auto_18735 ) ) ( not ( = ?auto_18738 ?auto_18735 ) ) ( not ( = ?auto_18734 ?auto_18735 ) ) ( SURFACE-AT ?auto_18739 ?auto_18740 ) ( CLEAR ?auto_18739 ) ( IS-CRATE ?auto_18734 ) ( not ( = ?auto_18731 ?auto_18739 ) ) ( not ( = ?auto_18732 ?auto_18739 ) ) ( not ( = ?auto_18738 ?auto_18739 ) ) ( not ( = ?auto_18734 ?auto_18739 ) ) ( not ( = ?auto_18735 ?auto_18739 ) ) ( AVAILABLE ?auto_18733 ) ( IN ?auto_18734 ?auto_18737 ) ( TRUCK-AT ?auto_18737 ?auto_18744 ) ( not ( = ?auto_18744 ?auto_18740 ) ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( not ( = ?auto_18742 ?auto_18744 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18737 ?auto_18744 ?auto_18740 )
      ( MAKE-ON ?auto_18731 ?auto_18732 )
      ( MAKE-ON-VERIFY ?auto_18731 ?auto_18732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18745 - SURFACE
      ?auto_18746 - SURFACE
    )
    :vars
    (
      ?auto_18753 - HOIST
      ?auto_18754 - PLACE
      ?auto_18750 - PLACE
      ?auto_18748 - HOIST
      ?auto_18747 - SURFACE
      ?auto_18749 - SURFACE
      ?auto_18755 - PLACE
      ?auto_18751 - HOIST
      ?auto_18752 - SURFACE
      ?auto_18757 - SURFACE
      ?auto_18758 - TRUCK
      ?auto_18756 - PLACE
      ?auto_18759 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18753 ?auto_18754 ) ( IS-CRATE ?auto_18745 ) ( not ( = ?auto_18745 ?auto_18746 ) ) ( not ( = ?auto_18750 ?auto_18754 ) ) ( HOIST-AT ?auto_18748 ?auto_18750 ) ( not ( = ?auto_18753 ?auto_18748 ) ) ( AVAILABLE ?auto_18748 ) ( SURFACE-AT ?auto_18745 ?auto_18750 ) ( ON ?auto_18745 ?auto_18747 ) ( CLEAR ?auto_18745 ) ( not ( = ?auto_18745 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( IS-CRATE ?auto_18746 ) ( not ( = ?auto_18745 ?auto_18749 ) ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( not ( = ?auto_18747 ?auto_18749 ) ) ( not ( = ?auto_18755 ?auto_18754 ) ) ( not ( = ?auto_18750 ?auto_18755 ) ) ( HOIST-AT ?auto_18751 ?auto_18755 ) ( not ( = ?auto_18753 ?auto_18751 ) ) ( not ( = ?auto_18748 ?auto_18751 ) ) ( AVAILABLE ?auto_18751 ) ( SURFACE-AT ?auto_18746 ?auto_18755 ) ( ON ?auto_18746 ?auto_18752 ) ( CLEAR ?auto_18746 ) ( not ( = ?auto_18745 ?auto_18752 ) ) ( not ( = ?auto_18746 ?auto_18752 ) ) ( not ( = ?auto_18747 ?auto_18752 ) ) ( not ( = ?auto_18749 ?auto_18752 ) ) ( SURFACE-AT ?auto_18757 ?auto_18754 ) ( CLEAR ?auto_18757 ) ( IS-CRATE ?auto_18749 ) ( not ( = ?auto_18745 ?auto_18757 ) ) ( not ( = ?auto_18746 ?auto_18757 ) ) ( not ( = ?auto_18747 ?auto_18757 ) ) ( not ( = ?auto_18749 ?auto_18757 ) ) ( not ( = ?auto_18752 ?auto_18757 ) ) ( AVAILABLE ?auto_18753 ) ( TRUCK-AT ?auto_18758 ?auto_18756 ) ( not ( = ?auto_18756 ?auto_18754 ) ) ( not ( = ?auto_18750 ?auto_18756 ) ) ( not ( = ?auto_18755 ?auto_18756 ) ) ( HOIST-AT ?auto_18759 ?auto_18756 ) ( LIFTING ?auto_18759 ?auto_18749 ) ( not ( = ?auto_18753 ?auto_18759 ) ) ( not ( = ?auto_18748 ?auto_18759 ) ) ( not ( = ?auto_18751 ?auto_18759 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18759 ?auto_18749 ?auto_18758 ?auto_18756 )
      ( MAKE-ON ?auto_18745 ?auto_18746 )
      ( MAKE-ON-VERIFY ?auto_18745 ?auto_18746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18760 - SURFACE
      ?auto_18761 - SURFACE
    )
    :vars
    (
      ?auto_18764 - HOIST
      ?auto_18766 - PLACE
      ?auto_18768 - PLACE
      ?auto_18774 - HOIST
      ?auto_18772 - SURFACE
      ?auto_18767 - SURFACE
      ?auto_18773 - PLACE
      ?auto_18769 - HOIST
      ?auto_18765 - SURFACE
      ?auto_18770 - SURFACE
      ?auto_18771 - TRUCK
      ?auto_18763 - PLACE
      ?auto_18762 - HOIST
      ?auto_18775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18764 ?auto_18766 ) ( IS-CRATE ?auto_18760 ) ( not ( = ?auto_18760 ?auto_18761 ) ) ( not ( = ?auto_18768 ?auto_18766 ) ) ( HOIST-AT ?auto_18774 ?auto_18768 ) ( not ( = ?auto_18764 ?auto_18774 ) ) ( AVAILABLE ?auto_18774 ) ( SURFACE-AT ?auto_18760 ?auto_18768 ) ( ON ?auto_18760 ?auto_18772 ) ( CLEAR ?auto_18760 ) ( not ( = ?auto_18760 ?auto_18772 ) ) ( not ( = ?auto_18761 ?auto_18772 ) ) ( IS-CRATE ?auto_18761 ) ( not ( = ?auto_18760 ?auto_18767 ) ) ( not ( = ?auto_18761 ?auto_18767 ) ) ( not ( = ?auto_18772 ?auto_18767 ) ) ( not ( = ?auto_18773 ?auto_18766 ) ) ( not ( = ?auto_18768 ?auto_18773 ) ) ( HOIST-AT ?auto_18769 ?auto_18773 ) ( not ( = ?auto_18764 ?auto_18769 ) ) ( not ( = ?auto_18774 ?auto_18769 ) ) ( AVAILABLE ?auto_18769 ) ( SURFACE-AT ?auto_18761 ?auto_18773 ) ( ON ?auto_18761 ?auto_18765 ) ( CLEAR ?auto_18761 ) ( not ( = ?auto_18760 ?auto_18765 ) ) ( not ( = ?auto_18761 ?auto_18765 ) ) ( not ( = ?auto_18772 ?auto_18765 ) ) ( not ( = ?auto_18767 ?auto_18765 ) ) ( SURFACE-AT ?auto_18770 ?auto_18766 ) ( CLEAR ?auto_18770 ) ( IS-CRATE ?auto_18767 ) ( not ( = ?auto_18760 ?auto_18770 ) ) ( not ( = ?auto_18761 ?auto_18770 ) ) ( not ( = ?auto_18772 ?auto_18770 ) ) ( not ( = ?auto_18767 ?auto_18770 ) ) ( not ( = ?auto_18765 ?auto_18770 ) ) ( AVAILABLE ?auto_18764 ) ( TRUCK-AT ?auto_18771 ?auto_18763 ) ( not ( = ?auto_18763 ?auto_18766 ) ) ( not ( = ?auto_18768 ?auto_18763 ) ) ( not ( = ?auto_18773 ?auto_18763 ) ) ( HOIST-AT ?auto_18762 ?auto_18763 ) ( not ( = ?auto_18764 ?auto_18762 ) ) ( not ( = ?auto_18774 ?auto_18762 ) ) ( not ( = ?auto_18769 ?auto_18762 ) ) ( AVAILABLE ?auto_18762 ) ( SURFACE-AT ?auto_18767 ?auto_18763 ) ( ON ?auto_18767 ?auto_18775 ) ( CLEAR ?auto_18767 ) ( not ( = ?auto_18760 ?auto_18775 ) ) ( not ( = ?auto_18761 ?auto_18775 ) ) ( not ( = ?auto_18772 ?auto_18775 ) ) ( not ( = ?auto_18767 ?auto_18775 ) ) ( not ( = ?auto_18765 ?auto_18775 ) ) ( not ( = ?auto_18770 ?auto_18775 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18762 ?auto_18767 ?auto_18775 ?auto_18763 )
      ( MAKE-ON ?auto_18760 ?auto_18761 )
      ( MAKE-ON-VERIFY ?auto_18760 ?auto_18761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18776 - SURFACE
      ?auto_18777 - SURFACE
    )
    :vars
    (
      ?auto_18781 - HOIST
      ?auto_18785 - PLACE
      ?auto_18790 - PLACE
      ?auto_18789 - HOIST
      ?auto_18784 - SURFACE
      ?auto_18787 - SURFACE
      ?auto_18786 - PLACE
      ?auto_18783 - HOIST
      ?auto_18791 - SURFACE
      ?auto_18779 - SURFACE
      ?auto_18788 - PLACE
      ?auto_18780 - HOIST
      ?auto_18778 - SURFACE
      ?auto_18782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18781 ?auto_18785 ) ( IS-CRATE ?auto_18776 ) ( not ( = ?auto_18776 ?auto_18777 ) ) ( not ( = ?auto_18790 ?auto_18785 ) ) ( HOIST-AT ?auto_18789 ?auto_18790 ) ( not ( = ?auto_18781 ?auto_18789 ) ) ( AVAILABLE ?auto_18789 ) ( SURFACE-AT ?auto_18776 ?auto_18790 ) ( ON ?auto_18776 ?auto_18784 ) ( CLEAR ?auto_18776 ) ( not ( = ?auto_18776 ?auto_18784 ) ) ( not ( = ?auto_18777 ?auto_18784 ) ) ( IS-CRATE ?auto_18777 ) ( not ( = ?auto_18776 ?auto_18787 ) ) ( not ( = ?auto_18777 ?auto_18787 ) ) ( not ( = ?auto_18784 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18785 ) ) ( not ( = ?auto_18790 ?auto_18786 ) ) ( HOIST-AT ?auto_18783 ?auto_18786 ) ( not ( = ?auto_18781 ?auto_18783 ) ) ( not ( = ?auto_18789 ?auto_18783 ) ) ( AVAILABLE ?auto_18783 ) ( SURFACE-AT ?auto_18777 ?auto_18786 ) ( ON ?auto_18777 ?auto_18791 ) ( CLEAR ?auto_18777 ) ( not ( = ?auto_18776 ?auto_18791 ) ) ( not ( = ?auto_18777 ?auto_18791 ) ) ( not ( = ?auto_18784 ?auto_18791 ) ) ( not ( = ?auto_18787 ?auto_18791 ) ) ( SURFACE-AT ?auto_18779 ?auto_18785 ) ( CLEAR ?auto_18779 ) ( IS-CRATE ?auto_18787 ) ( not ( = ?auto_18776 ?auto_18779 ) ) ( not ( = ?auto_18777 ?auto_18779 ) ) ( not ( = ?auto_18784 ?auto_18779 ) ) ( not ( = ?auto_18787 ?auto_18779 ) ) ( not ( = ?auto_18791 ?auto_18779 ) ) ( AVAILABLE ?auto_18781 ) ( not ( = ?auto_18788 ?auto_18785 ) ) ( not ( = ?auto_18790 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( HOIST-AT ?auto_18780 ?auto_18788 ) ( not ( = ?auto_18781 ?auto_18780 ) ) ( not ( = ?auto_18789 ?auto_18780 ) ) ( not ( = ?auto_18783 ?auto_18780 ) ) ( AVAILABLE ?auto_18780 ) ( SURFACE-AT ?auto_18787 ?auto_18788 ) ( ON ?auto_18787 ?auto_18778 ) ( CLEAR ?auto_18787 ) ( not ( = ?auto_18776 ?auto_18778 ) ) ( not ( = ?auto_18777 ?auto_18778 ) ) ( not ( = ?auto_18784 ?auto_18778 ) ) ( not ( = ?auto_18787 ?auto_18778 ) ) ( not ( = ?auto_18791 ?auto_18778 ) ) ( not ( = ?auto_18779 ?auto_18778 ) ) ( TRUCK-AT ?auto_18782 ?auto_18785 ) )
    :subtasks
    ( ( !DRIVE ?auto_18782 ?auto_18785 ?auto_18788 )
      ( MAKE-ON ?auto_18776 ?auto_18777 )
      ( MAKE-ON-VERIFY ?auto_18776 ?auto_18777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18792 - SURFACE
      ?auto_18793 - SURFACE
    )
    :vars
    (
      ?auto_18804 - HOIST
      ?auto_18801 - PLACE
      ?auto_18807 - PLACE
      ?auto_18800 - HOIST
      ?auto_18802 - SURFACE
      ?auto_18795 - SURFACE
      ?auto_18799 - PLACE
      ?auto_18796 - HOIST
      ?auto_18805 - SURFACE
      ?auto_18797 - SURFACE
      ?auto_18798 - PLACE
      ?auto_18803 - HOIST
      ?auto_18806 - SURFACE
      ?auto_18794 - TRUCK
      ?auto_18808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18804 ?auto_18801 ) ( IS-CRATE ?auto_18792 ) ( not ( = ?auto_18792 ?auto_18793 ) ) ( not ( = ?auto_18807 ?auto_18801 ) ) ( HOIST-AT ?auto_18800 ?auto_18807 ) ( not ( = ?auto_18804 ?auto_18800 ) ) ( AVAILABLE ?auto_18800 ) ( SURFACE-AT ?auto_18792 ?auto_18807 ) ( ON ?auto_18792 ?auto_18802 ) ( CLEAR ?auto_18792 ) ( not ( = ?auto_18792 ?auto_18802 ) ) ( not ( = ?auto_18793 ?auto_18802 ) ) ( IS-CRATE ?auto_18793 ) ( not ( = ?auto_18792 ?auto_18795 ) ) ( not ( = ?auto_18793 ?auto_18795 ) ) ( not ( = ?auto_18802 ?auto_18795 ) ) ( not ( = ?auto_18799 ?auto_18801 ) ) ( not ( = ?auto_18807 ?auto_18799 ) ) ( HOIST-AT ?auto_18796 ?auto_18799 ) ( not ( = ?auto_18804 ?auto_18796 ) ) ( not ( = ?auto_18800 ?auto_18796 ) ) ( AVAILABLE ?auto_18796 ) ( SURFACE-AT ?auto_18793 ?auto_18799 ) ( ON ?auto_18793 ?auto_18805 ) ( CLEAR ?auto_18793 ) ( not ( = ?auto_18792 ?auto_18805 ) ) ( not ( = ?auto_18793 ?auto_18805 ) ) ( not ( = ?auto_18802 ?auto_18805 ) ) ( not ( = ?auto_18795 ?auto_18805 ) ) ( IS-CRATE ?auto_18795 ) ( not ( = ?auto_18792 ?auto_18797 ) ) ( not ( = ?auto_18793 ?auto_18797 ) ) ( not ( = ?auto_18802 ?auto_18797 ) ) ( not ( = ?auto_18795 ?auto_18797 ) ) ( not ( = ?auto_18805 ?auto_18797 ) ) ( not ( = ?auto_18798 ?auto_18801 ) ) ( not ( = ?auto_18807 ?auto_18798 ) ) ( not ( = ?auto_18799 ?auto_18798 ) ) ( HOIST-AT ?auto_18803 ?auto_18798 ) ( not ( = ?auto_18804 ?auto_18803 ) ) ( not ( = ?auto_18800 ?auto_18803 ) ) ( not ( = ?auto_18796 ?auto_18803 ) ) ( AVAILABLE ?auto_18803 ) ( SURFACE-AT ?auto_18795 ?auto_18798 ) ( ON ?auto_18795 ?auto_18806 ) ( CLEAR ?auto_18795 ) ( not ( = ?auto_18792 ?auto_18806 ) ) ( not ( = ?auto_18793 ?auto_18806 ) ) ( not ( = ?auto_18802 ?auto_18806 ) ) ( not ( = ?auto_18795 ?auto_18806 ) ) ( not ( = ?auto_18805 ?auto_18806 ) ) ( not ( = ?auto_18797 ?auto_18806 ) ) ( TRUCK-AT ?auto_18794 ?auto_18801 ) ( SURFACE-AT ?auto_18808 ?auto_18801 ) ( CLEAR ?auto_18808 ) ( LIFTING ?auto_18804 ?auto_18797 ) ( IS-CRATE ?auto_18797 ) ( not ( = ?auto_18792 ?auto_18808 ) ) ( not ( = ?auto_18793 ?auto_18808 ) ) ( not ( = ?auto_18802 ?auto_18808 ) ) ( not ( = ?auto_18795 ?auto_18808 ) ) ( not ( = ?auto_18805 ?auto_18808 ) ) ( not ( = ?auto_18797 ?auto_18808 ) ) ( not ( = ?auto_18806 ?auto_18808 ) ) )
    :subtasks
    ( ( !DROP ?auto_18804 ?auto_18797 ?auto_18808 ?auto_18801 )
      ( MAKE-ON ?auto_18792 ?auto_18793 )
      ( MAKE-ON-VERIFY ?auto_18792 ?auto_18793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18809 - SURFACE
      ?auto_18810 - SURFACE
    )
    :vars
    (
      ?auto_18824 - HOIST
      ?auto_18821 - PLACE
      ?auto_18823 - PLACE
      ?auto_18814 - HOIST
      ?auto_18825 - SURFACE
      ?auto_18819 - SURFACE
      ?auto_18822 - PLACE
      ?auto_18817 - HOIST
      ?auto_18813 - SURFACE
      ?auto_18820 - SURFACE
      ?auto_18815 - PLACE
      ?auto_18812 - HOIST
      ?auto_18816 - SURFACE
      ?auto_18811 - TRUCK
      ?auto_18818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18824 ?auto_18821 ) ( IS-CRATE ?auto_18809 ) ( not ( = ?auto_18809 ?auto_18810 ) ) ( not ( = ?auto_18823 ?auto_18821 ) ) ( HOIST-AT ?auto_18814 ?auto_18823 ) ( not ( = ?auto_18824 ?auto_18814 ) ) ( AVAILABLE ?auto_18814 ) ( SURFACE-AT ?auto_18809 ?auto_18823 ) ( ON ?auto_18809 ?auto_18825 ) ( CLEAR ?auto_18809 ) ( not ( = ?auto_18809 ?auto_18825 ) ) ( not ( = ?auto_18810 ?auto_18825 ) ) ( IS-CRATE ?auto_18810 ) ( not ( = ?auto_18809 ?auto_18819 ) ) ( not ( = ?auto_18810 ?auto_18819 ) ) ( not ( = ?auto_18825 ?auto_18819 ) ) ( not ( = ?auto_18822 ?auto_18821 ) ) ( not ( = ?auto_18823 ?auto_18822 ) ) ( HOIST-AT ?auto_18817 ?auto_18822 ) ( not ( = ?auto_18824 ?auto_18817 ) ) ( not ( = ?auto_18814 ?auto_18817 ) ) ( AVAILABLE ?auto_18817 ) ( SURFACE-AT ?auto_18810 ?auto_18822 ) ( ON ?auto_18810 ?auto_18813 ) ( CLEAR ?auto_18810 ) ( not ( = ?auto_18809 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( not ( = ?auto_18825 ?auto_18813 ) ) ( not ( = ?auto_18819 ?auto_18813 ) ) ( IS-CRATE ?auto_18819 ) ( not ( = ?auto_18809 ?auto_18820 ) ) ( not ( = ?auto_18810 ?auto_18820 ) ) ( not ( = ?auto_18825 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18813 ?auto_18820 ) ) ( not ( = ?auto_18815 ?auto_18821 ) ) ( not ( = ?auto_18823 ?auto_18815 ) ) ( not ( = ?auto_18822 ?auto_18815 ) ) ( HOIST-AT ?auto_18812 ?auto_18815 ) ( not ( = ?auto_18824 ?auto_18812 ) ) ( not ( = ?auto_18814 ?auto_18812 ) ) ( not ( = ?auto_18817 ?auto_18812 ) ) ( AVAILABLE ?auto_18812 ) ( SURFACE-AT ?auto_18819 ?auto_18815 ) ( ON ?auto_18819 ?auto_18816 ) ( CLEAR ?auto_18819 ) ( not ( = ?auto_18809 ?auto_18816 ) ) ( not ( = ?auto_18810 ?auto_18816 ) ) ( not ( = ?auto_18825 ?auto_18816 ) ) ( not ( = ?auto_18819 ?auto_18816 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( not ( = ?auto_18820 ?auto_18816 ) ) ( TRUCK-AT ?auto_18811 ?auto_18821 ) ( SURFACE-AT ?auto_18818 ?auto_18821 ) ( CLEAR ?auto_18818 ) ( IS-CRATE ?auto_18820 ) ( not ( = ?auto_18809 ?auto_18818 ) ) ( not ( = ?auto_18810 ?auto_18818 ) ) ( not ( = ?auto_18825 ?auto_18818 ) ) ( not ( = ?auto_18819 ?auto_18818 ) ) ( not ( = ?auto_18813 ?auto_18818 ) ) ( not ( = ?auto_18820 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( AVAILABLE ?auto_18824 ) ( IN ?auto_18820 ?auto_18811 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18824 ?auto_18820 ?auto_18811 ?auto_18821 )
      ( MAKE-ON ?auto_18809 ?auto_18810 )
      ( MAKE-ON-VERIFY ?auto_18809 ?auto_18810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18826 - SURFACE
      ?auto_18827 - SURFACE
    )
    :vars
    (
      ?auto_18838 - HOIST
      ?auto_18840 - PLACE
      ?auto_18837 - PLACE
      ?auto_18828 - HOIST
      ?auto_18836 - SURFACE
      ?auto_18834 - SURFACE
      ?auto_18835 - PLACE
      ?auto_18833 - HOIST
      ?auto_18841 - SURFACE
      ?auto_18831 - SURFACE
      ?auto_18829 - PLACE
      ?auto_18830 - HOIST
      ?auto_18842 - SURFACE
      ?auto_18839 - SURFACE
      ?auto_18832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18838 ?auto_18840 ) ( IS-CRATE ?auto_18826 ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18837 ?auto_18840 ) ) ( HOIST-AT ?auto_18828 ?auto_18837 ) ( not ( = ?auto_18838 ?auto_18828 ) ) ( AVAILABLE ?auto_18828 ) ( SURFACE-AT ?auto_18826 ?auto_18837 ) ( ON ?auto_18826 ?auto_18836 ) ( CLEAR ?auto_18826 ) ( not ( = ?auto_18826 ?auto_18836 ) ) ( not ( = ?auto_18827 ?auto_18836 ) ) ( IS-CRATE ?auto_18827 ) ( not ( = ?auto_18826 ?auto_18834 ) ) ( not ( = ?auto_18827 ?auto_18834 ) ) ( not ( = ?auto_18836 ?auto_18834 ) ) ( not ( = ?auto_18835 ?auto_18840 ) ) ( not ( = ?auto_18837 ?auto_18835 ) ) ( HOIST-AT ?auto_18833 ?auto_18835 ) ( not ( = ?auto_18838 ?auto_18833 ) ) ( not ( = ?auto_18828 ?auto_18833 ) ) ( AVAILABLE ?auto_18833 ) ( SURFACE-AT ?auto_18827 ?auto_18835 ) ( ON ?auto_18827 ?auto_18841 ) ( CLEAR ?auto_18827 ) ( not ( = ?auto_18826 ?auto_18841 ) ) ( not ( = ?auto_18827 ?auto_18841 ) ) ( not ( = ?auto_18836 ?auto_18841 ) ) ( not ( = ?auto_18834 ?auto_18841 ) ) ( IS-CRATE ?auto_18834 ) ( not ( = ?auto_18826 ?auto_18831 ) ) ( not ( = ?auto_18827 ?auto_18831 ) ) ( not ( = ?auto_18836 ?auto_18831 ) ) ( not ( = ?auto_18834 ?auto_18831 ) ) ( not ( = ?auto_18841 ?auto_18831 ) ) ( not ( = ?auto_18829 ?auto_18840 ) ) ( not ( = ?auto_18837 ?auto_18829 ) ) ( not ( = ?auto_18835 ?auto_18829 ) ) ( HOIST-AT ?auto_18830 ?auto_18829 ) ( not ( = ?auto_18838 ?auto_18830 ) ) ( not ( = ?auto_18828 ?auto_18830 ) ) ( not ( = ?auto_18833 ?auto_18830 ) ) ( AVAILABLE ?auto_18830 ) ( SURFACE-AT ?auto_18834 ?auto_18829 ) ( ON ?auto_18834 ?auto_18842 ) ( CLEAR ?auto_18834 ) ( not ( = ?auto_18826 ?auto_18842 ) ) ( not ( = ?auto_18827 ?auto_18842 ) ) ( not ( = ?auto_18836 ?auto_18842 ) ) ( not ( = ?auto_18834 ?auto_18842 ) ) ( not ( = ?auto_18841 ?auto_18842 ) ) ( not ( = ?auto_18831 ?auto_18842 ) ) ( SURFACE-AT ?auto_18839 ?auto_18840 ) ( CLEAR ?auto_18839 ) ( IS-CRATE ?auto_18831 ) ( not ( = ?auto_18826 ?auto_18839 ) ) ( not ( = ?auto_18827 ?auto_18839 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18834 ?auto_18839 ) ) ( not ( = ?auto_18841 ?auto_18839 ) ) ( not ( = ?auto_18831 ?auto_18839 ) ) ( not ( = ?auto_18842 ?auto_18839 ) ) ( AVAILABLE ?auto_18838 ) ( IN ?auto_18831 ?auto_18832 ) ( TRUCK-AT ?auto_18832 ?auto_18835 ) )
    :subtasks
    ( ( !DRIVE ?auto_18832 ?auto_18835 ?auto_18840 )
      ( MAKE-ON ?auto_18826 ?auto_18827 )
      ( MAKE-ON-VERIFY ?auto_18826 ?auto_18827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18843 - SURFACE
      ?auto_18844 - SURFACE
    )
    :vars
    (
      ?auto_18858 - HOIST
      ?auto_18856 - PLACE
      ?auto_18851 - PLACE
      ?auto_18850 - HOIST
      ?auto_18846 - SURFACE
      ?auto_18857 - SURFACE
      ?auto_18849 - PLACE
      ?auto_18848 - HOIST
      ?auto_18845 - SURFACE
      ?auto_18854 - SURFACE
      ?auto_18855 - PLACE
      ?auto_18859 - HOIST
      ?auto_18847 - SURFACE
      ?auto_18853 - SURFACE
      ?auto_18852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18858 ?auto_18856 ) ( IS-CRATE ?auto_18843 ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18851 ?auto_18856 ) ) ( HOIST-AT ?auto_18850 ?auto_18851 ) ( not ( = ?auto_18858 ?auto_18850 ) ) ( AVAILABLE ?auto_18850 ) ( SURFACE-AT ?auto_18843 ?auto_18851 ) ( ON ?auto_18843 ?auto_18846 ) ( CLEAR ?auto_18843 ) ( not ( = ?auto_18843 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( IS-CRATE ?auto_18844 ) ( not ( = ?auto_18843 ?auto_18857 ) ) ( not ( = ?auto_18844 ?auto_18857 ) ) ( not ( = ?auto_18846 ?auto_18857 ) ) ( not ( = ?auto_18849 ?auto_18856 ) ) ( not ( = ?auto_18851 ?auto_18849 ) ) ( HOIST-AT ?auto_18848 ?auto_18849 ) ( not ( = ?auto_18858 ?auto_18848 ) ) ( not ( = ?auto_18850 ?auto_18848 ) ) ( SURFACE-AT ?auto_18844 ?auto_18849 ) ( ON ?auto_18844 ?auto_18845 ) ( CLEAR ?auto_18844 ) ( not ( = ?auto_18843 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( not ( = ?auto_18846 ?auto_18845 ) ) ( not ( = ?auto_18857 ?auto_18845 ) ) ( IS-CRATE ?auto_18857 ) ( not ( = ?auto_18843 ?auto_18854 ) ) ( not ( = ?auto_18844 ?auto_18854 ) ) ( not ( = ?auto_18846 ?auto_18854 ) ) ( not ( = ?auto_18857 ?auto_18854 ) ) ( not ( = ?auto_18845 ?auto_18854 ) ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18851 ?auto_18855 ) ) ( not ( = ?auto_18849 ?auto_18855 ) ) ( HOIST-AT ?auto_18859 ?auto_18855 ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( not ( = ?auto_18850 ?auto_18859 ) ) ( not ( = ?auto_18848 ?auto_18859 ) ) ( AVAILABLE ?auto_18859 ) ( SURFACE-AT ?auto_18857 ?auto_18855 ) ( ON ?auto_18857 ?auto_18847 ) ( CLEAR ?auto_18857 ) ( not ( = ?auto_18843 ?auto_18847 ) ) ( not ( = ?auto_18844 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( not ( = ?auto_18857 ?auto_18847 ) ) ( not ( = ?auto_18845 ?auto_18847 ) ) ( not ( = ?auto_18854 ?auto_18847 ) ) ( SURFACE-AT ?auto_18853 ?auto_18856 ) ( CLEAR ?auto_18853 ) ( IS-CRATE ?auto_18854 ) ( not ( = ?auto_18843 ?auto_18853 ) ) ( not ( = ?auto_18844 ?auto_18853 ) ) ( not ( = ?auto_18846 ?auto_18853 ) ) ( not ( = ?auto_18857 ?auto_18853 ) ) ( not ( = ?auto_18845 ?auto_18853 ) ) ( not ( = ?auto_18854 ?auto_18853 ) ) ( not ( = ?auto_18847 ?auto_18853 ) ) ( AVAILABLE ?auto_18858 ) ( TRUCK-AT ?auto_18852 ?auto_18849 ) ( LIFTING ?auto_18848 ?auto_18854 ) )
    :subtasks
    ( ( !LOAD ?auto_18848 ?auto_18854 ?auto_18852 ?auto_18849 )
      ( MAKE-ON ?auto_18843 ?auto_18844 )
      ( MAKE-ON-VERIFY ?auto_18843 ?auto_18844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18860 - SURFACE
      ?auto_18861 - SURFACE
    )
    :vars
    (
      ?auto_18876 - HOIST
      ?auto_18872 - PLACE
      ?auto_18868 - PLACE
      ?auto_18867 - HOIST
      ?auto_18865 - SURFACE
      ?auto_18873 - SURFACE
      ?auto_18875 - PLACE
      ?auto_18869 - HOIST
      ?auto_18870 - SURFACE
      ?auto_18863 - SURFACE
      ?auto_18871 - PLACE
      ?auto_18862 - HOIST
      ?auto_18866 - SURFACE
      ?auto_18874 - SURFACE
      ?auto_18864 - TRUCK
      ?auto_18877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18876 ?auto_18872 ) ( IS-CRATE ?auto_18860 ) ( not ( = ?auto_18860 ?auto_18861 ) ) ( not ( = ?auto_18868 ?auto_18872 ) ) ( HOIST-AT ?auto_18867 ?auto_18868 ) ( not ( = ?auto_18876 ?auto_18867 ) ) ( AVAILABLE ?auto_18867 ) ( SURFACE-AT ?auto_18860 ?auto_18868 ) ( ON ?auto_18860 ?auto_18865 ) ( CLEAR ?auto_18860 ) ( not ( = ?auto_18860 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( IS-CRATE ?auto_18861 ) ( not ( = ?auto_18860 ?auto_18873 ) ) ( not ( = ?auto_18861 ?auto_18873 ) ) ( not ( = ?auto_18865 ?auto_18873 ) ) ( not ( = ?auto_18875 ?auto_18872 ) ) ( not ( = ?auto_18868 ?auto_18875 ) ) ( HOIST-AT ?auto_18869 ?auto_18875 ) ( not ( = ?auto_18876 ?auto_18869 ) ) ( not ( = ?auto_18867 ?auto_18869 ) ) ( SURFACE-AT ?auto_18861 ?auto_18875 ) ( ON ?auto_18861 ?auto_18870 ) ( CLEAR ?auto_18861 ) ( not ( = ?auto_18860 ?auto_18870 ) ) ( not ( = ?auto_18861 ?auto_18870 ) ) ( not ( = ?auto_18865 ?auto_18870 ) ) ( not ( = ?auto_18873 ?auto_18870 ) ) ( IS-CRATE ?auto_18873 ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18865 ?auto_18863 ) ) ( not ( = ?auto_18873 ?auto_18863 ) ) ( not ( = ?auto_18870 ?auto_18863 ) ) ( not ( = ?auto_18871 ?auto_18872 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18875 ?auto_18871 ) ) ( HOIST-AT ?auto_18862 ?auto_18871 ) ( not ( = ?auto_18876 ?auto_18862 ) ) ( not ( = ?auto_18867 ?auto_18862 ) ) ( not ( = ?auto_18869 ?auto_18862 ) ) ( AVAILABLE ?auto_18862 ) ( SURFACE-AT ?auto_18873 ?auto_18871 ) ( ON ?auto_18873 ?auto_18866 ) ( CLEAR ?auto_18873 ) ( not ( = ?auto_18860 ?auto_18866 ) ) ( not ( = ?auto_18861 ?auto_18866 ) ) ( not ( = ?auto_18865 ?auto_18866 ) ) ( not ( = ?auto_18873 ?auto_18866 ) ) ( not ( = ?auto_18870 ?auto_18866 ) ) ( not ( = ?auto_18863 ?auto_18866 ) ) ( SURFACE-AT ?auto_18874 ?auto_18872 ) ( CLEAR ?auto_18874 ) ( IS-CRATE ?auto_18863 ) ( not ( = ?auto_18860 ?auto_18874 ) ) ( not ( = ?auto_18861 ?auto_18874 ) ) ( not ( = ?auto_18865 ?auto_18874 ) ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( not ( = ?auto_18870 ?auto_18874 ) ) ( not ( = ?auto_18863 ?auto_18874 ) ) ( not ( = ?auto_18866 ?auto_18874 ) ) ( AVAILABLE ?auto_18876 ) ( TRUCK-AT ?auto_18864 ?auto_18875 ) ( AVAILABLE ?auto_18869 ) ( SURFACE-AT ?auto_18863 ?auto_18875 ) ( ON ?auto_18863 ?auto_18877 ) ( CLEAR ?auto_18863 ) ( not ( = ?auto_18860 ?auto_18877 ) ) ( not ( = ?auto_18861 ?auto_18877 ) ) ( not ( = ?auto_18865 ?auto_18877 ) ) ( not ( = ?auto_18873 ?auto_18877 ) ) ( not ( = ?auto_18870 ?auto_18877 ) ) ( not ( = ?auto_18863 ?auto_18877 ) ) ( not ( = ?auto_18866 ?auto_18877 ) ) ( not ( = ?auto_18874 ?auto_18877 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18869 ?auto_18863 ?auto_18877 ?auto_18875 )
      ( MAKE-ON ?auto_18860 ?auto_18861 )
      ( MAKE-ON-VERIFY ?auto_18860 ?auto_18861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18878 - SURFACE
      ?auto_18879 - SURFACE
    )
    :vars
    (
      ?auto_18893 - HOIST
      ?auto_18887 - PLACE
      ?auto_18894 - PLACE
      ?auto_18895 - HOIST
      ?auto_18880 - SURFACE
      ?auto_18883 - SURFACE
      ?auto_18890 - PLACE
      ?auto_18889 - HOIST
      ?auto_18891 - SURFACE
      ?auto_18888 - SURFACE
      ?auto_18882 - PLACE
      ?auto_18886 - HOIST
      ?auto_18885 - SURFACE
      ?auto_18884 - SURFACE
      ?auto_18892 - SURFACE
      ?auto_18881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18893 ?auto_18887 ) ( IS-CRATE ?auto_18878 ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18894 ?auto_18887 ) ) ( HOIST-AT ?auto_18895 ?auto_18894 ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( AVAILABLE ?auto_18895 ) ( SURFACE-AT ?auto_18878 ?auto_18894 ) ( ON ?auto_18878 ?auto_18880 ) ( CLEAR ?auto_18878 ) ( not ( = ?auto_18878 ?auto_18880 ) ) ( not ( = ?auto_18879 ?auto_18880 ) ) ( IS-CRATE ?auto_18879 ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18879 ?auto_18883 ) ) ( not ( = ?auto_18880 ?auto_18883 ) ) ( not ( = ?auto_18890 ?auto_18887 ) ) ( not ( = ?auto_18894 ?auto_18890 ) ) ( HOIST-AT ?auto_18889 ?auto_18890 ) ( not ( = ?auto_18893 ?auto_18889 ) ) ( not ( = ?auto_18895 ?auto_18889 ) ) ( SURFACE-AT ?auto_18879 ?auto_18890 ) ( ON ?auto_18879 ?auto_18891 ) ( CLEAR ?auto_18879 ) ( not ( = ?auto_18878 ?auto_18891 ) ) ( not ( = ?auto_18879 ?auto_18891 ) ) ( not ( = ?auto_18880 ?auto_18891 ) ) ( not ( = ?auto_18883 ?auto_18891 ) ) ( IS-CRATE ?auto_18883 ) ( not ( = ?auto_18878 ?auto_18888 ) ) ( not ( = ?auto_18879 ?auto_18888 ) ) ( not ( = ?auto_18880 ?auto_18888 ) ) ( not ( = ?auto_18883 ?auto_18888 ) ) ( not ( = ?auto_18891 ?auto_18888 ) ) ( not ( = ?auto_18882 ?auto_18887 ) ) ( not ( = ?auto_18894 ?auto_18882 ) ) ( not ( = ?auto_18890 ?auto_18882 ) ) ( HOIST-AT ?auto_18886 ?auto_18882 ) ( not ( = ?auto_18893 ?auto_18886 ) ) ( not ( = ?auto_18895 ?auto_18886 ) ) ( not ( = ?auto_18889 ?auto_18886 ) ) ( AVAILABLE ?auto_18886 ) ( SURFACE-AT ?auto_18883 ?auto_18882 ) ( ON ?auto_18883 ?auto_18885 ) ( CLEAR ?auto_18883 ) ( not ( = ?auto_18878 ?auto_18885 ) ) ( not ( = ?auto_18879 ?auto_18885 ) ) ( not ( = ?auto_18880 ?auto_18885 ) ) ( not ( = ?auto_18883 ?auto_18885 ) ) ( not ( = ?auto_18891 ?auto_18885 ) ) ( not ( = ?auto_18888 ?auto_18885 ) ) ( SURFACE-AT ?auto_18884 ?auto_18887 ) ( CLEAR ?auto_18884 ) ( IS-CRATE ?auto_18888 ) ( not ( = ?auto_18878 ?auto_18884 ) ) ( not ( = ?auto_18879 ?auto_18884 ) ) ( not ( = ?auto_18880 ?auto_18884 ) ) ( not ( = ?auto_18883 ?auto_18884 ) ) ( not ( = ?auto_18891 ?auto_18884 ) ) ( not ( = ?auto_18888 ?auto_18884 ) ) ( not ( = ?auto_18885 ?auto_18884 ) ) ( AVAILABLE ?auto_18893 ) ( AVAILABLE ?auto_18889 ) ( SURFACE-AT ?auto_18888 ?auto_18890 ) ( ON ?auto_18888 ?auto_18892 ) ( CLEAR ?auto_18888 ) ( not ( = ?auto_18878 ?auto_18892 ) ) ( not ( = ?auto_18879 ?auto_18892 ) ) ( not ( = ?auto_18880 ?auto_18892 ) ) ( not ( = ?auto_18883 ?auto_18892 ) ) ( not ( = ?auto_18891 ?auto_18892 ) ) ( not ( = ?auto_18888 ?auto_18892 ) ) ( not ( = ?auto_18885 ?auto_18892 ) ) ( not ( = ?auto_18884 ?auto_18892 ) ) ( TRUCK-AT ?auto_18881 ?auto_18887 ) )
    :subtasks
    ( ( !DRIVE ?auto_18881 ?auto_18887 ?auto_18890 )
      ( MAKE-ON ?auto_18878 ?auto_18879 )
      ( MAKE-ON-VERIFY ?auto_18878 ?auto_18879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18898 - SURFACE
      ?auto_18899 - SURFACE
    )
    :vars
    (
      ?auto_18900 - HOIST
      ?auto_18901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18900 ?auto_18901 ) ( SURFACE-AT ?auto_18899 ?auto_18901 ) ( CLEAR ?auto_18899 ) ( LIFTING ?auto_18900 ?auto_18898 ) ( IS-CRATE ?auto_18898 ) ( not ( = ?auto_18898 ?auto_18899 ) ) )
    :subtasks
    ( ( !DROP ?auto_18900 ?auto_18898 ?auto_18899 ?auto_18901 )
      ( MAKE-ON-VERIFY ?auto_18898 ?auto_18899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18902 - SURFACE
      ?auto_18903 - SURFACE
    )
    :vars
    (
      ?auto_18905 - HOIST
      ?auto_18904 - PLACE
      ?auto_18906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18905 ?auto_18904 ) ( SURFACE-AT ?auto_18903 ?auto_18904 ) ( CLEAR ?auto_18903 ) ( IS-CRATE ?auto_18902 ) ( not ( = ?auto_18902 ?auto_18903 ) ) ( TRUCK-AT ?auto_18906 ?auto_18904 ) ( AVAILABLE ?auto_18905 ) ( IN ?auto_18902 ?auto_18906 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18905 ?auto_18902 ?auto_18906 ?auto_18904 )
      ( MAKE-ON ?auto_18902 ?auto_18903 )
      ( MAKE-ON-VERIFY ?auto_18902 ?auto_18903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18907 - SURFACE
      ?auto_18908 - SURFACE
    )
    :vars
    (
      ?auto_18910 - HOIST
      ?auto_18909 - PLACE
      ?auto_18911 - TRUCK
      ?auto_18912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18910 ?auto_18909 ) ( SURFACE-AT ?auto_18908 ?auto_18909 ) ( CLEAR ?auto_18908 ) ( IS-CRATE ?auto_18907 ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( AVAILABLE ?auto_18910 ) ( IN ?auto_18907 ?auto_18911 ) ( TRUCK-AT ?auto_18911 ?auto_18912 ) ( not ( = ?auto_18912 ?auto_18909 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18911 ?auto_18912 ?auto_18909 )
      ( MAKE-ON ?auto_18907 ?auto_18908 )
      ( MAKE-ON-VERIFY ?auto_18907 ?auto_18908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18913 - SURFACE
      ?auto_18914 - SURFACE
    )
    :vars
    (
      ?auto_18917 - HOIST
      ?auto_18918 - PLACE
      ?auto_18915 - TRUCK
      ?auto_18916 - PLACE
      ?auto_18919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18917 ?auto_18918 ) ( SURFACE-AT ?auto_18914 ?auto_18918 ) ( CLEAR ?auto_18914 ) ( IS-CRATE ?auto_18913 ) ( not ( = ?auto_18913 ?auto_18914 ) ) ( AVAILABLE ?auto_18917 ) ( TRUCK-AT ?auto_18915 ?auto_18916 ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( HOIST-AT ?auto_18919 ?auto_18916 ) ( LIFTING ?auto_18919 ?auto_18913 ) ( not ( = ?auto_18917 ?auto_18919 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18919 ?auto_18913 ?auto_18915 ?auto_18916 )
      ( MAKE-ON ?auto_18913 ?auto_18914 )
      ( MAKE-ON-VERIFY ?auto_18913 ?auto_18914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18920 - SURFACE
      ?auto_18921 - SURFACE
    )
    :vars
    (
      ?auto_18925 - HOIST
      ?auto_18922 - PLACE
      ?auto_18924 - TRUCK
      ?auto_18926 - PLACE
      ?auto_18923 - HOIST
      ?auto_18927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18925 ?auto_18922 ) ( SURFACE-AT ?auto_18921 ?auto_18922 ) ( CLEAR ?auto_18921 ) ( IS-CRATE ?auto_18920 ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( AVAILABLE ?auto_18925 ) ( TRUCK-AT ?auto_18924 ?auto_18926 ) ( not ( = ?auto_18926 ?auto_18922 ) ) ( HOIST-AT ?auto_18923 ?auto_18926 ) ( not ( = ?auto_18925 ?auto_18923 ) ) ( AVAILABLE ?auto_18923 ) ( SURFACE-AT ?auto_18920 ?auto_18926 ) ( ON ?auto_18920 ?auto_18927 ) ( CLEAR ?auto_18920 ) ( not ( = ?auto_18920 ?auto_18927 ) ) ( not ( = ?auto_18921 ?auto_18927 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18923 ?auto_18920 ?auto_18927 ?auto_18926 )
      ( MAKE-ON ?auto_18920 ?auto_18921 )
      ( MAKE-ON-VERIFY ?auto_18920 ?auto_18921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18928 - SURFACE
      ?auto_18929 - SURFACE
    )
    :vars
    (
      ?auto_18935 - HOIST
      ?auto_18930 - PLACE
      ?auto_18931 - PLACE
      ?auto_18932 - HOIST
      ?auto_18933 - SURFACE
      ?auto_18934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18935 ?auto_18930 ) ( SURFACE-AT ?auto_18929 ?auto_18930 ) ( CLEAR ?auto_18929 ) ( IS-CRATE ?auto_18928 ) ( not ( = ?auto_18928 ?auto_18929 ) ) ( AVAILABLE ?auto_18935 ) ( not ( = ?auto_18931 ?auto_18930 ) ) ( HOIST-AT ?auto_18932 ?auto_18931 ) ( not ( = ?auto_18935 ?auto_18932 ) ) ( AVAILABLE ?auto_18932 ) ( SURFACE-AT ?auto_18928 ?auto_18931 ) ( ON ?auto_18928 ?auto_18933 ) ( CLEAR ?auto_18928 ) ( not ( = ?auto_18928 ?auto_18933 ) ) ( not ( = ?auto_18929 ?auto_18933 ) ) ( TRUCK-AT ?auto_18934 ?auto_18930 ) )
    :subtasks
    ( ( !DRIVE ?auto_18934 ?auto_18930 ?auto_18931 )
      ( MAKE-ON ?auto_18928 ?auto_18929 )
      ( MAKE-ON-VERIFY ?auto_18928 ?auto_18929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18936 - SURFACE
      ?auto_18937 - SURFACE
    )
    :vars
    (
      ?auto_18940 - HOIST
      ?auto_18939 - PLACE
      ?auto_18942 - PLACE
      ?auto_18938 - HOIST
      ?auto_18943 - SURFACE
      ?auto_18941 - TRUCK
      ?auto_18944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18940 ?auto_18939 ) ( IS-CRATE ?auto_18936 ) ( not ( = ?auto_18936 ?auto_18937 ) ) ( not ( = ?auto_18942 ?auto_18939 ) ) ( HOIST-AT ?auto_18938 ?auto_18942 ) ( not ( = ?auto_18940 ?auto_18938 ) ) ( AVAILABLE ?auto_18938 ) ( SURFACE-AT ?auto_18936 ?auto_18942 ) ( ON ?auto_18936 ?auto_18943 ) ( CLEAR ?auto_18936 ) ( not ( = ?auto_18936 ?auto_18943 ) ) ( not ( = ?auto_18937 ?auto_18943 ) ) ( TRUCK-AT ?auto_18941 ?auto_18939 ) ( SURFACE-AT ?auto_18944 ?auto_18939 ) ( CLEAR ?auto_18944 ) ( LIFTING ?auto_18940 ?auto_18937 ) ( IS-CRATE ?auto_18937 ) ( not ( = ?auto_18936 ?auto_18944 ) ) ( not ( = ?auto_18937 ?auto_18944 ) ) ( not ( = ?auto_18943 ?auto_18944 ) ) )
    :subtasks
    ( ( !DROP ?auto_18940 ?auto_18937 ?auto_18944 ?auto_18939 )
      ( MAKE-ON ?auto_18936 ?auto_18937 )
      ( MAKE-ON-VERIFY ?auto_18936 ?auto_18937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18945 - SURFACE
      ?auto_18946 - SURFACE
    )
    :vars
    (
      ?auto_18950 - HOIST
      ?auto_18948 - PLACE
      ?auto_18947 - PLACE
      ?auto_18952 - HOIST
      ?auto_18949 - SURFACE
      ?auto_18951 - TRUCK
      ?auto_18953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18950 ?auto_18948 ) ( IS-CRATE ?auto_18945 ) ( not ( = ?auto_18945 ?auto_18946 ) ) ( not ( = ?auto_18947 ?auto_18948 ) ) ( HOIST-AT ?auto_18952 ?auto_18947 ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( AVAILABLE ?auto_18952 ) ( SURFACE-AT ?auto_18945 ?auto_18947 ) ( ON ?auto_18945 ?auto_18949 ) ( CLEAR ?auto_18945 ) ( not ( = ?auto_18945 ?auto_18949 ) ) ( not ( = ?auto_18946 ?auto_18949 ) ) ( TRUCK-AT ?auto_18951 ?auto_18948 ) ( SURFACE-AT ?auto_18953 ?auto_18948 ) ( CLEAR ?auto_18953 ) ( IS-CRATE ?auto_18946 ) ( not ( = ?auto_18945 ?auto_18953 ) ) ( not ( = ?auto_18946 ?auto_18953 ) ) ( not ( = ?auto_18949 ?auto_18953 ) ) ( AVAILABLE ?auto_18950 ) ( IN ?auto_18946 ?auto_18951 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18950 ?auto_18946 ?auto_18951 ?auto_18948 )
      ( MAKE-ON ?auto_18945 ?auto_18946 )
      ( MAKE-ON-VERIFY ?auto_18945 ?auto_18946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18954 - SURFACE
      ?auto_18955 - SURFACE
    )
    :vars
    (
      ?auto_18962 - HOIST
      ?auto_18956 - PLACE
      ?auto_18958 - PLACE
      ?auto_18960 - HOIST
      ?auto_18957 - SURFACE
      ?auto_18959 - SURFACE
      ?auto_18961 - TRUCK
      ?auto_18963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18962 ?auto_18956 ) ( IS-CRATE ?auto_18954 ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( not ( = ?auto_18958 ?auto_18956 ) ) ( HOIST-AT ?auto_18960 ?auto_18958 ) ( not ( = ?auto_18962 ?auto_18960 ) ) ( AVAILABLE ?auto_18960 ) ( SURFACE-AT ?auto_18954 ?auto_18958 ) ( ON ?auto_18954 ?auto_18957 ) ( CLEAR ?auto_18954 ) ( not ( = ?auto_18954 ?auto_18957 ) ) ( not ( = ?auto_18955 ?auto_18957 ) ) ( SURFACE-AT ?auto_18959 ?auto_18956 ) ( CLEAR ?auto_18959 ) ( IS-CRATE ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18959 ) ) ( not ( = ?auto_18955 ?auto_18959 ) ) ( not ( = ?auto_18957 ?auto_18959 ) ) ( AVAILABLE ?auto_18962 ) ( IN ?auto_18955 ?auto_18961 ) ( TRUCK-AT ?auto_18961 ?auto_18963 ) ( not ( = ?auto_18963 ?auto_18956 ) ) ( not ( = ?auto_18958 ?auto_18963 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18961 ?auto_18963 ?auto_18956 )
      ( MAKE-ON ?auto_18954 ?auto_18955 )
      ( MAKE-ON-VERIFY ?auto_18954 ?auto_18955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18964 - SURFACE
      ?auto_18965 - SURFACE
    )
    :vars
    (
      ?auto_18972 - HOIST
      ?auto_18969 - PLACE
      ?auto_18968 - PLACE
      ?auto_18966 - HOIST
      ?auto_18973 - SURFACE
      ?auto_18967 - SURFACE
      ?auto_18971 - TRUCK
      ?auto_18970 - PLACE
      ?auto_18974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18972 ?auto_18969 ) ( IS-CRATE ?auto_18964 ) ( not ( = ?auto_18964 ?auto_18965 ) ) ( not ( = ?auto_18968 ?auto_18969 ) ) ( HOIST-AT ?auto_18966 ?auto_18968 ) ( not ( = ?auto_18972 ?auto_18966 ) ) ( AVAILABLE ?auto_18966 ) ( SURFACE-AT ?auto_18964 ?auto_18968 ) ( ON ?auto_18964 ?auto_18973 ) ( CLEAR ?auto_18964 ) ( not ( = ?auto_18964 ?auto_18973 ) ) ( not ( = ?auto_18965 ?auto_18973 ) ) ( SURFACE-AT ?auto_18967 ?auto_18969 ) ( CLEAR ?auto_18967 ) ( IS-CRATE ?auto_18965 ) ( not ( = ?auto_18964 ?auto_18967 ) ) ( not ( = ?auto_18965 ?auto_18967 ) ) ( not ( = ?auto_18973 ?auto_18967 ) ) ( AVAILABLE ?auto_18972 ) ( TRUCK-AT ?auto_18971 ?auto_18970 ) ( not ( = ?auto_18970 ?auto_18969 ) ) ( not ( = ?auto_18968 ?auto_18970 ) ) ( HOIST-AT ?auto_18974 ?auto_18970 ) ( LIFTING ?auto_18974 ?auto_18965 ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18966 ?auto_18974 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18974 ?auto_18965 ?auto_18971 ?auto_18970 )
      ( MAKE-ON ?auto_18964 ?auto_18965 )
      ( MAKE-ON-VERIFY ?auto_18964 ?auto_18965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18975 - SURFACE
      ?auto_18976 - SURFACE
    )
    :vars
    (
      ?auto_18981 - HOIST
      ?auto_18985 - PLACE
      ?auto_18978 - PLACE
      ?auto_18983 - HOIST
      ?auto_18977 - SURFACE
      ?auto_18979 - SURFACE
      ?auto_18980 - TRUCK
      ?auto_18984 - PLACE
      ?auto_18982 - HOIST
      ?auto_18986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18981 ?auto_18985 ) ( IS-CRATE ?auto_18975 ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18978 ?auto_18985 ) ) ( HOIST-AT ?auto_18983 ?auto_18978 ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( AVAILABLE ?auto_18983 ) ( SURFACE-AT ?auto_18975 ?auto_18978 ) ( ON ?auto_18975 ?auto_18977 ) ( CLEAR ?auto_18975 ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( SURFACE-AT ?auto_18979 ?auto_18985 ) ( CLEAR ?auto_18979 ) ( IS-CRATE ?auto_18976 ) ( not ( = ?auto_18975 ?auto_18979 ) ) ( not ( = ?auto_18976 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( AVAILABLE ?auto_18981 ) ( TRUCK-AT ?auto_18980 ?auto_18984 ) ( not ( = ?auto_18984 ?auto_18985 ) ) ( not ( = ?auto_18978 ?auto_18984 ) ) ( HOIST-AT ?auto_18982 ?auto_18984 ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18983 ?auto_18982 ) ) ( AVAILABLE ?auto_18982 ) ( SURFACE-AT ?auto_18976 ?auto_18984 ) ( ON ?auto_18976 ?auto_18986 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18975 ?auto_18986 ) ) ( not ( = ?auto_18976 ?auto_18986 ) ) ( not ( = ?auto_18977 ?auto_18986 ) ) ( not ( = ?auto_18979 ?auto_18986 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18982 ?auto_18976 ?auto_18986 ?auto_18984 )
      ( MAKE-ON ?auto_18975 ?auto_18976 )
      ( MAKE-ON-VERIFY ?auto_18975 ?auto_18976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18987 - SURFACE
      ?auto_18988 - SURFACE
    )
    :vars
    (
      ?auto_18993 - HOIST
      ?auto_18991 - PLACE
      ?auto_18995 - PLACE
      ?auto_18989 - HOIST
      ?auto_18992 - SURFACE
      ?auto_18997 - SURFACE
      ?auto_18996 - PLACE
      ?auto_18994 - HOIST
      ?auto_18990 - SURFACE
      ?auto_18998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18993 ?auto_18991 ) ( IS-CRATE ?auto_18987 ) ( not ( = ?auto_18987 ?auto_18988 ) ) ( not ( = ?auto_18995 ?auto_18991 ) ) ( HOIST-AT ?auto_18989 ?auto_18995 ) ( not ( = ?auto_18993 ?auto_18989 ) ) ( AVAILABLE ?auto_18989 ) ( SURFACE-AT ?auto_18987 ?auto_18995 ) ( ON ?auto_18987 ?auto_18992 ) ( CLEAR ?auto_18987 ) ( not ( = ?auto_18987 ?auto_18992 ) ) ( not ( = ?auto_18988 ?auto_18992 ) ) ( SURFACE-AT ?auto_18997 ?auto_18991 ) ( CLEAR ?auto_18997 ) ( IS-CRATE ?auto_18988 ) ( not ( = ?auto_18987 ?auto_18997 ) ) ( not ( = ?auto_18988 ?auto_18997 ) ) ( not ( = ?auto_18992 ?auto_18997 ) ) ( AVAILABLE ?auto_18993 ) ( not ( = ?auto_18996 ?auto_18991 ) ) ( not ( = ?auto_18995 ?auto_18996 ) ) ( HOIST-AT ?auto_18994 ?auto_18996 ) ( not ( = ?auto_18993 ?auto_18994 ) ) ( not ( = ?auto_18989 ?auto_18994 ) ) ( AVAILABLE ?auto_18994 ) ( SURFACE-AT ?auto_18988 ?auto_18996 ) ( ON ?auto_18988 ?auto_18990 ) ( CLEAR ?auto_18988 ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( not ( = ?auto_18988 ?auto_18990 ) ) ( not ( = ?auto_18992 ?auto_18990 ) ) ( not ( = ?auto_18997 ?auto_18990 ) ) ( TRUCK-AT ?auto_18998 ?auto_18991 ) )
    :subtasks
    ( ( !DRIVE ?auto_18998 ?auto_18991 ?auto_18996 )
      ( MAKE-ON ?auto_18987 ?auto_18988 )
      ( MAKE-ON-VERIFY ?auto_18987 ?auto_18988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18999 - SURFACE
      ?auto_19000 - SURFACE
    )
    :vars
    (
      ?auto_19001 - HOIST
      ?auto_19006 - PLACE
      ?auto_19010 - PLACE
      ?auto_19008 - HOIST
      ?auto_19004 - SURFACE
      ?auto_19002 - SURFACE
      ?auto_19003 - PLACE
      ?auto_19009 - HOIST
      ?auto_19005 - SURFACE
      ?auto_19007 - TRUCK
      ?auto_19011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19001 ?auto_19006 ) ( IS-CRATE ?auto_18999 ) ( not ( = ?auto_18999 ?auto_19000 ) ) ( not ( = ?auto_19010 ?auto_19006 ) ) ( HOIST-AT ?auto_19008 ?auto_19010 ) ( not ( = ?auto_19001 ?auto_19008 ) ) ( AVAILABLE ?auto_19008 ) ( SURFACE-AT ?auto_18999 ?auto_19010 ) ( ON ?auto_18999 ?auto_19004 ) ( CLEAR ?auto_18999 ) ( not ( = ?auto_18999 ?auto_19004 ) ) ( not ( = ?auto_19000 ?auto_19004 ) ) ( IS-CRATE ?auto_19000 ) ( not ( = ?auto_18999 ?auto_19002 ) ) ( not ( = ?auto_19000 ?auto_19002 ) ) ( not ( = ?auto_19004 ?auto_19002 ) ) ( not ( = ?auto_19003 ?auto_19006 ) ) ( not ( = ?auto_19010 ?auto_19003 ) ) ( HOIST-AT ?auto_19009 ?auto_19003 ) ( not ( = ?auto_19001 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19009 ) ) ( AVAILABLE ?auto_19009 ) ( SURFACE-AT ?auto_19000 ?auto_19003 ) ( ON ?auto_19000 ?auto_19005 ) ( CLEAR ?auto_19000 ) ( not ( = ?auto_18999 ?auto_19005 ) ) ( not ( = ?auto_19000 ?auto_19005 ) ) ( not ( = ?auto_19004 ?auto_19005 ) ) ( not ( = ?auto_19002 ?auto_19005 ) ) ( TRUCK-AT ?auto_19007 ?auto_19006 ) ( SURFACE-AT ?auto_19011 ?auto_19006 ) ( CLEAR ?auto_19011 ) ( LIFTING ?auto_19001 ?auto_19002 ) ( IS-CRATE ?auto_19002 ) ( not ( = ?auto_18999 ?auto_19011 ) ) ( not ( = ?auto_19000 ?auto_19011 ) ) ( not ( = ?auto_19004 ?auto_19011 ) ) ( not ( = ?auto_19002 ?auto_19011 ) ) ( not ( = ?auto_19005 ?auto_19011 ) ) )
    :subtasks
    ( ( !DROP ?auto_19001 ?auto_19002 ?auto_19011 ?auto_19006 )
      ( MAKE-ON ?auto_18999 ?auto_19000 )
      ( MAKE-ON-VERIFY ?auto_18999 ?auto_19000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19012 - SURFACE
      ?auto_19013 - SURFACE
    )
    :vars
    (
      ?auto_19023 - HOIST
      ?auto_19019 - PLACE
      ?auto_19015 - PLACE
      ?auto_19016 - HOIST
      ?auto_19021 - SURFACE
      ?auto_19020 - SURFACE
      ?auto_19018 - PLACE
      ?auto_19024 - HOIST
      ?auto_19022 - SURFACE
      ?auto_19014 - TRUCK
      ?auto_19017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19023 ?auto_19019 ) ( IS-CRATE ?auto_19012 ) ( not ( = ?auto_19012 ?auto_19013 ) ) ( not ( = ?auto_19015 ?auto_19019 ) ) ( HOIST-AT ?auto_19016 ?auto_19015 ) ( not ( = ?auto_19023 ?auto_19016 ) ) ( AVAILABLE ?auto_19016 ) ( SURFACE-AT ?auto_19012 ?auto_19015 ) ( ON ?auto_19012 ?auto_19021 ) ( CLEAR ?auto_19012 ) ( not ( = ?auto_19012 ?auto_19021 ) ) ( not ( = ?auto_19013 ?auto_19021 ) ) ( IS-CRATE ?auto_19013 ) ( not ( = ?auto_19012 ?auto_19020 ) ) ( not ( = ?auto_19013 ?auto_19020 ) ) ( not ( = ?auto_19021 ?auto_19020 ) ) ( not ( = ?auto_19018 ?auto_19019 ) ) ( not ( = ?auto_19015 ?auto_19018 ) ) ( HOIST-AT ?auto_19024 ?auto_19018 ) ( not ( = ?auto_19023 ?auto_19024 ) ) ( not ( = ?auto_19016 ?auto_19024 ) ) ( AVAILABLE ?auto_19024 ) ( SURFACE-AT ?auto_19013 ?auto_19018 ) ( ON ?auto_19013 ?auto_19022 ) ( CLEAR ?auto_19013 ) ( not ( = ?auto_19012 ?auto_19022 ) ) ( not ( = ?auto_19013 ?auto_19022 ) ) ( not ( = ?auto_19021 ?auto_19022 ) ) ( not ( = ?auto_19020 ?auto_19022 ) ) ( TRUCK-AT ?auto_19014 ?auto_19019 ) ( SURFACE-AT ?auto_19017 ?auto_19019 ) ( CLEAR ?auto_19017 ) ( IS-CRATE ?auto_19020 ) ( not ( = ?auto_19012 ?auto_19017 ) ) ( not ( = ?auto_19013 ?auto_19017 ) ) ( not ( = ?auto_19021 ?auto_19017 ) ) ( not ( = ?auto_19020 ?auto_19017 ) ) ( not ( = ?auto_19022 ?auto_19017 ) ) ( AVAILABLE ?auto_19023 ) ( IN ?auto_19020 ?auto_19014 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19023 ?auto_19020 ?auto_19014 ?auto_19019 )
      ( MAKE-ON ?auto_19012 ?auto_19013 )
      ( MAKE-ON-VERIFY ?auto_19012 ?auto_19013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19025 - SURFACE
      ?auto_19026 - SURFACE
    )
    :vars
    (
      ?auto_19034 - HOIST
      ?auto_19030 - PLACE
      ?auto_19037 - PLACE
      ?auto_19032 - HOIST
      ?auto_19035 - SURFACE
      ?auto_19033 - SURFACE
      ?auto_19036 - PLACE
      ?auto_19031 - HOIST
      ?auto_19028 - SURFACE
      ?auto_19029 - SURFACE
      ?auto_19027 - TRUCK
      ?auto_19038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19034 ?auto_19030 ) ( IS-CRATE ?auto_19025 ) ( not ( = ?auto_19025 ?auto_19026 ) ) ( not ( = ?auto_19037 ?auto_19030 ) ) ( HOIST-AT ?auto_19032 ?auto_19037 ) ( not ( = ?auto_19034 ?auto_19032 ) ) ( AVAILABLE ?auto_19032 ) ( SURFACE-AT ?auto_19025 ?auto_19037 ) ( ON ?auto_19025 ?auto_19035 ) ( CLEAR ?auto_19025 ) ( not ( = ?auto_19025 ?auto_19035 ) ) ( not ( = ?auto_19026 ?auto_19035 ) ) ( IS-CRATE ?auto_19026 ) ( not ( = ?auto_19025 ?auto_19033 ) ) ( not ( = ?auto_19026 ?auto_19033 ) ) ( not ( = ?auto_19035 ?auto_19033 ) ) ( not ( = ?auto_19036 ?auto_19030 ) ) ( not ( = ?auto_19037 ?auto_19036 ) ) ( HOIST-AT ?auto_19031 ?auto_19036 ) ( not ( = ?auto_19034 ?auto_19031 ) ) ( not ( = ?auto_19032 ?auto_19031 ) ) ( AVAILABLE ?auto_19031 ) ( SURFACE-AT ?auto_19026 ?auto_19036 ) ( ON ?auto_19026 ?auto_19028 ) ( CLEAR ?auto_19026 ) ( not ( = ?auto_19025 ?auto_19028 ) ) ( not ( = ?auto_19026 ?auto_19028 ) ) ( not ( = ?auto_19035 ?auto_19028 ) ) ( not ( = ?auto_19033 ?auto_19028 ) ) ( SURFACE-AT ?auto_19029 ?auto_19030 ) ( CLEAR ?auto_19029 ) ( IS-CRATE ?auto_19033 ) ( not ( = ?auto_19025 ?auto_19029 ) ) ( not ( = ?auto_19026 ?auto_19029 ) ) ( not ( = ?auto_19035 ?auto_19029 ) ) ( not ( = ?auto_19033 ?auto_19029 ) ) ( not ( = ?auto_19028 ?auto_19029 ) ) ( AVAILABLE ?auto_19034 ) ( IN ?auto_19033 ?auto_19027 ) ( TRUCK-AT ?auto_19027 ?auto_19038 ) ( not ( = ?auto_19038 ?auto_19030 ) ) ( not ( = ?auto_19037 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19027 ?auto_19038 ?auto_19030 )
      ( MAKE-ON ?auto_19025 ?auto_19026 )
      ( MAKE-ON-VERIFY ?auto_19025 ?auto_19026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19039 - SURFACE
      ?auto_19040 - SURFACE
    )
    :vars
    (
      ?auto_19042 - HOIST
      ?auto_19047 - PLACE
      ?auto_19046 - PLACE
      ?auto_19050 - HOIST
      ?auto_19051 - SURFACE
      ?auto_19041 - SURFACE
      ?auto_19043 - PLACE
      ?auto_19049 - HOIST
      ?auto_19048 - SURFACE
      ?auto_19044 - SURFACE
      ?auto_19052 - TRUCK
      ?auto_19045 - PLACE
      ?auto_19053 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19042 ?auto_19047 ) ( IS-CRATE ?auto_19039 ) ( not ( = ?auto_19039 ?auto_19040 ) ) ( not ( = ?auto_19046 ?auto_19047 ) ) ( HOIST-AT ?auto_19050 ?auto_19046 ) ( not ( = ?auto_19042 ?auto_19050 ) ) ( AVAILABLE ?auto_19050 ) ( SURFACE-AT ?auto_19039 ?auto_19046 ) ( ON ?auto_19039 ?auto_19051 ) ( CLEAR ?auto_19039 ) ( not ( = ?auto_19039 ?auto_19051 ) ) ( not ( = ?auto_19040 ?auto_19051 ) ) ( IS-CRATE ?auto_19040 ) ( not ( = ?auto_19039 ?auto_19041 ) ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( not ( = ?auto_19051 ?auto_19041 ) ) ( not ( = ?auto_19043 ?auto_19047 ) ) ( not ( = ?auto_19046 ?auto_19043 ) ) ( HOIST-AT ?auto_19049 ?auto_19043 ) ( not ( = ?auto_19042 ?auto_19049 ) ) ( not ( = ?auto_19050 ?auto_19049 ) ) ( AVAILABLE ?auto_19049 ) ( SURFACE-AT ?auto_19040 ?auto_19043 ) ( ON ?auto_19040 ?auto_19048 ) ( CLEAR ?auto_19040 ) ( not ( = ?auto_19039 ?auto_19048 ) ) ( not ( = ?auto_19040 ?auto_19048 ) ) ( not ( = ?auto_19051 ?auto_19048 ) ) ( not ( = ?auto_19041 ?auto_19048 ) ) ( SURFACE-AT ?auto_19044 ?auto_19047 ) ( CLEAR ?auto_19044 ) ( IS-CRATE ?auto_19041 ) ( not ( = ?auto_19039 ?auto_19044 ) ) ( not ( = ?auto_19040 ?auto_19044 ) ) ( not ( = ?auto_19051 ?auto_19044 ) ) ( not ( = ?auto_19041 ?auto_19044 ) ) ( not ( = ?auto_19048 ?auto_19044 ) ) ( AVAILABLE ?auto_19042 ) ( TRUCK-AT ?auto_19052 ?auto_19045 ) ( not ( = ?auto_19045 ?auto_19047 ) ) ( not ( = ?auto_19046 ?auto_19045 ) ) ( not ( = ?auto_19043 ?auto_19045 ) ) ( HOIST-AT ?auto_19053 ?auto_19045 ) ( LIFTING ?auto_19053 ?auto_19041 ) ( not ( = ?auto_19042 ?auto_19053 ) ) ( not ( = ?auto_19050 ?auto_19053 ) ) ( not ( = ?auto_19049 ?auto_19053 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19053 ?auto_19041 ?auto_19052 ?auto_19045 )
      ( MAKE-ON ?auto_19039 ?auto_19040 )
      ( MAKE-ON-VERIFY ?auto_19039 ?auto_19040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19054 - SURFACE
      ?auto_19055 - SURFACE
    )
    :vars
    (
      ?auto_19067 - HOIST
      ?auto_19060 - PLACE
      ?auto_19056 - PLACE
      ?auto_19057 - HOIST
      ?auto_19068 - SURFACE
      ?auto_19064 - SURFACE
      ?auto_19059 - PLACE
      ?auto_19063 - HOIST
      ?auto_19058 - SURFACE
      ?auto_19066 - SURFACE
      ?auto_19061 - TRUCK
      ?auto_19065 - PLACE
      ?auto_19062 - HOIST
      ?auto_19069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19067 ?auto_19060 ) ( IS-CRATE ?auto_19054 ) ( not ( = ?auto_19054 ?auto_19055 ) ) ( not ( = ?auto_19056 ?auto_19060 ) ) ( HOIST-AT ?auto_19057 ?auto_19056 ) ( not ( = ?auto_19067 ?auto_19057 ) ) ( AVAILABLE ?auto_19057 ) ( SURFACE-AT ?auto_19054 ?auto_19056 ) ( ON ?auto_19054 ?auto_19068 ) ( CLEAR ?auto_19054 ) ( not ( = ?auto_19054 ?auto_19068 ) ) ( not ( = ?auto_19055 ?auto_19068 ) ) ( IS-CRATE ?auto_19055 ) ( not ( = ?auto_19054 ?auto_19064 ) ) ( not ( = ?auto_19055 ?auto_19064 ) ) ( not ( = ?auto_19068 ?auto_19064 ) ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( not ( = ?auto_19056 ?auto_19059 ) ) ( HOIST-AT ?auto_19063 ?auto_19059 ) ( not ( = ?auto_19067 ?auto_19063 ) ) ( not ( = ?auto_19057 ?auto_19063 ) ) ( AVAILABLE ?auto_19063 ) ( SURFACE-AT ?auto_19055 ?auto_19059 ) ( ON ?auto_19055 ?auto_19058 ) ( CLEAR ?auto_19055 ) ( not ( = ?auto_19054 ?auto_19058 ) ) ( not ( = ?auto_19055 ?auto_19058 ) ) ( not ( = ?auto_19068 ?auto_19058 ) ) ( not ( = ?auto_19064 ?auto_19058 ) ) ( SURFACE-AT ?auto_19066 ?auto_19060 ) ( CLEAR ?auto_19066 ) ( IS-CRATE ?auto_19064 ) ( not ( = ?auto_19054 ?auto_19066 ) ) ( not ( = ?auto_19055 ?auto_19066 ) ) ( not ( = ?auto_19068 ?auto_19066 ) ) ( not ( = ?auto_19064 ?auto_19066 ) ) ( not ( = ?auto_19058 ?auto_19066 ) ) ( AVAILABLE ?auto_19067 ) ( TRUCK-AT ?auto_19061 ?auto_19065 ) ( not ( = ?auto_19065 ?auto_19060 ) ) ( not ( = ?auto_19056 ?auto_19065 ) ) ( not ( = ?auto_19059 ?auto_19065 ) ) ( HOIST-AT ?auto_19062 ?auto_19065 ) ( not ( = ?auto_19067 ?auto_19062 ) ) ( not ( = ?auto_19057 ?auto_19062 ) ) ( not ( = ?auto_19063 ?auto_19062 ) ) ( AVAILABLE ?auto_19062 ) ( SURFACE-AT ?auto_19064 ?auto_19065 ) ( ON ?auto_19064 ?auto_19069 ) ( CLEAR ?auto_19064 ) ( not ( = ?auto_19054 ?auto_19069 ) ) ( not ( = ?auto_19055 ?auto_19069 ) ) ( not ( = ?auto_19068 ?auto_19069 ) ) ( not ( = ?auto_19064 ?auto_19069 ) ) ( not ( = ?auto_19058 ?auto_19069 ) ) ( not ( = ?auto_19066 ?auto_19069 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19062 ?auto_19064 ?auto_19069 ?auto_19065 )
      ( MAKE-ON ?auto_19054 ?auto_19055 )
      ( MAKE-ON-VERIFY ?auto_19054 ?auto_19055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19070 - SURFACE
      ?auto_19071 - SURFACE
    )
    :vars
    (
      ?auto_19073 - HOIST
      ?auto_19082 - PLACE
      ?auto_19072 - PLACE
      ?auto_19079 - HOIST
      ?auto_19074 - SURFACE
      ?auto_19085 - SURFACE
      ?auto_19084 - PLACE
      ?auto_19075 - HOIST
      ?auto_19077 - SURFACE
      ?auto_19083 - SURFACE
      ?auto_19076 - PLACE
      ?auto_19081 - HOIST
      ?auto_19078 - SURFACE
      ?auto_19080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19073 ?auto_19082 ) ( IS-CRATE ?auto_19070 ) ( not ( = ?auto_19070 ?auto_19071 ) ) ( not ( = ?auto_19072 ?auto_19082 ) ) ( HOIST-AT ?auto_19079 ?auto_19072 ) ( not ( = ?auto_19073 ?auto_19079 ) ) ( AVAILABLE ?auto_19079 ) ( SURFACE-AT ?auto_19070 ?auto_19072 ) ( ON ?auto_19070 ?auto_19074 ) ( CLEAR ?auto_19070 ) ( not ( = ?auto_19070 ?auto_19074 ) ) ( not ( = ?auto_19071 ?auto_19074 ) ) ( IS-CRATE ?auto_19071 ) ( not ( = ?auto_19070 ?auto_19085 ) ) ( not ( = ?auto_19071 ?auto_19085 ) ) ( not ( = ?auto_19074 ?auto_19085 ) ) ( not ( = ?auto_19084 ?auto_19082 ) ) ( not ( = ?auto_19072 ?auto_19084 ) ) ( HOIST-AT ?auto_19075 ?auto_19084 ) ( not ( = ?auto_19073 ?auto_19075 ) ) ( not ( = ?auto_19079 ?auto_19075 ) ) ( AVAILABLE ?auto_19075 ) ( SURFACE-AT ?auto_19071 ?auto_19084 ) ( ON ?auto_19071 ?auto_19077 ) ( CLEAR ?auto_19071 ) ( not ( = ?auto_19070 ?auto_19077 ) ) ( not ( = ?auto_19071 ?auto_19077 ) ) ( not ( = ?auto_19074 ?auto_19077 ) ) ( not ( = ?auto_19085 ?auto_19077 ) ) ( SURFACE-AT ?auto_19083 ?auto_19082 ) ( CLEAR ?auto_19083 ) ( IS-CRATE ?auto_19085 ) ( not ( = ?auto_19070 ?auto_19083 ) ) ( not ( = ?auto_19071 ?auto_19083 ) ) ( not ( = ?auto_19074 ?auto_19083 ) ) ( not ( = ?auto_19085 ?auto_19083 ) ) ( not ( = ?auto_19077 ?auto_19083 ) ) ( AVAILABLE ?auto_19073 ) ( not ( = ?auto_19076 ?auto_19082 ) ) ( not ( = ?auto_19072 ?auto_19076 ) ) ( not ( = ?auto_19084 ?auto_19076 ) ) ( HOIST-AT ?auto_19081 ?auto_19076 ) ( not ( = ?auto_19073 ?auto_19081 ) ) ( not ( = ?auto_19079 ?auto_19081 ) ) ( not ( = ?auto_19075 ?auto_19081 ) ) ( AVAILABLE ?auto_19081 ) ( SURFACE-AT ?auto_19085 ?auto_19076 ) ( ON ?auto_19085 ?auto_19078 ) ( CLEAR ?auto_19085 ) ( not ( = ?auto_19070 ?auto_19078 ) ) ( not ( = ?auto_19071 ?auto_19078 ) ) ( not ( = ?auto_19074 ?auto_19078 ) ) ( not ( = ?auto_19085 ?auto_19078 ) ) ( not ( = ?auto_19077 ?auto_19078 ) ) ( not ( = ?auto_19083 ?auto_19078 ) ) ( TRUCK-AT ?auto_19080 ?auto_19082 ) )
    :subtasks
    ( ( !DRIVE ?auto_19080 ?auto_19082 ?auto_19076 )
      ( MAKE-ON ?auto_19070 ?auto_19071 )
      ( MAKE-ON-VERIFY ?auto_19070 ?auto_19071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19086 - SURFACE
      ?auto_19087 - SURFACE
    )
    :vars
    (
      ?auto_19099 - HOIST
      ?auto_19098 - PLACE
      ?auto_19090 - PLACE
      ?auto_19100 - HOIST
      ?auto_19101 - SURFACE
      ?auto_19091 - SURFACE
      ?auto_19094 - PLACE
      ?auto_19092 - HOIST
      ?auto_19097 - SURFACE
      ?auto_19088 - SURFACE
      ?auto_19095 - PLACE
      ?auto_19096 - HOIST
      ?auto_19089 - SURFACE
      ?auto_19093 - TRUCK
      ?auto_19102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19099 ?auto_19098 ) ( IS-CRATE ?auto_19086 ) ( not ( = ?auto_19086 ?auto_19087 ) ) ( not ( = ?auto_19090 ?auto_19098 ) ) ( HOIST-AT ?auto_19100 ?auto_19090 ) ( not ( = ?auto_19099 ?auto_19100 ) ) ( AVAILABLE ?auto_19100 ) ( SURFACE-AT ?auto_19086 ?auto_19090 ) ( ON ?auto_19086 ?auto_19101 ) ( CLEAR ?auto_19086 ) ( not ( = ?auto_19086 ?auto_19101 ) ) ( not ( = ?auto_19087 ?auto_19101 ) ) ( IS-CRATE ?auto_19087 ) ( not ( = ?auto_19086 ?auto_19091 ) ) ( not ( = ?auto_19087 ?auto_19091 ) ) ( not ( = ?auto_19101 ?auto_19091 ) ) ( not ( = ?auto_19094 ?auto_19098 ) ) ( not ( = ?auto_19090 ?auto_19094 ) ) ( HOIST-AT ?auto_19092 ?auto_19094 ) ( not ( = ?auto_19099 ?auto_19092 ) ) ( not ( = ?auto_19100 ?auto_19092 ) ) ( AVAILABLE ?auto_19092 ) ( SURFACE-AT ?auto_19087 ?auto_19094 ) ( ON ?auto_19087 ?auto_19097 ) ( CLEAR ?auto_19087 ) ( not ( = ?auto_19086 ?auto_19097 ) ) ( not ( = ?auto_19087 ?auto_19097 ) ) ( not ( = ?auto_19101 ?auto_19097 ) ) ( not ( = ?auto_19091 ?auto_19097 ) ) ( IS-CRATE ?auto_19091 ) ( not ( = ?auto_19086 ?auto_19088 ) ) ( not ( = ?auto_19087 ?auto_19088 ) ) ( not ( = ?auto_19101 ?auto_19088 ) ) ( not ( = ?auto_19091 ?auto_19088 ) ) ( not ( = ?auto_19097 ?auto_19088 ) ) ( not ( = ?auto_19095 ?auto_19098 ) ) ( not ( = ?auto_19090 ?auto_19095 ) ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( HOIST-AT ?auto_19096 ?auto_19095 ) ( not ( = ?auto_19099 ?auto_19096 ) ) ( not ( = ?auto_19100 ?auto_19096 ) ) ( not ( = ?auto_19092 ?auto_19096 ) ) ( AVAILABLE ?auto_19096 ) ( SURFACE-AT ?auto_19091 ?auto_19095 ) ( ON ?auto_19091 ?auto_19089 ) ( CLEAR ?auto_19091 ) ( not ( = ?auto_19086 ?auto_19089 ) ) ( not ( = ?auto_19087 ?auto_19089 ) ) ( not ( = ?auto_19101 ?auto_19089 ) ) ( not ( = ?auto_19091 ?auto_19089 ) ) ( not ( = ?auto_19097 ?auto_19089 ) ) ( not ( = ?auto_19088 ?auto_19089 ) ) ( TRUCK-AT ?auto_19093 ?auto_19098 ) ( SURFACE-AT ?auto_19102 ?auto_19098 ) ( CLEAR ?auto_19102 ) ( LIFTING ?auto_19099 ?auto_19088 ) ( IS-CRATE ?auto_19088 ) ( not ( = ?auto_19086 ?auto_19102 ) ) ( not ( = ?auto_19087 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19091 ?auto_19102 ) ) ( not ( = ?auto_19097 ?auto_19102 ) ) ( not ( = ?auto_19088 ?auto_19102 ) ) ( not ( = ?auto_19089 ?auto_19102 ) ) )
    :subtasks
    ( ( !DROP ?auto_19099 ?auto_19088 ?auto_19102 ?auto_19098 )
      ( MAKE-ON ?auto_19086 ?auto_19087 )
      ( MAKE-ON-VERIFY ?auto_19086 ?auto_19087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19103 - SURFACE
      ?auto_19104 - SURFACE
    )
    :vars
    (
      ?auto_19115 - HOIST
      ?auto_19111 - PLACE
      ?auto_19118 - PLACE
      ?auto_19119 - HOIST
      ?auto_19107 - SURFACE
      ?auto_19109 - SURFACE
      ?auto_19114 - PLACE
      ?auto_19110 - HOIST
      ?auto_19116 - SURFACE
      ?auto_19117 - SURFACE
      ?auto_19105 - PLACE
      ?auto_19113 - HOIST
      ?auto_19108 - SURFACE
      ?auto_19106 - TRUCK
      ?auto_19112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19115 ?auto_19111 ) ( IS-CRATE ?auto_19103 ) ( not ( = ?auto_19103 ?auto_19104 ) ) ( not ( = ?auto_19118 ?auto_19111 ) ) ( HOIST-AT ?auto_19119 ?auto_19118 ) ( not ( = ?auto_19115 ?auto_19119 ) ) ( AVAILABLE ?auto_19119 ) ( SURFACE-AT ?auto_19103 ?auto_19118 ) ( ON ?auto_19103 ?auto_19107 ) ( CLEAR ?auto_19103 ) ( not ( = ?auto_19103 ?auto_19107 ) ) ( not ( = ?auto_19104 ?auto_19107 ) ) ( IS-CRATE ?auto_19104 ) ( not ( = ?auto_19103 ?auto_19109 ) ) ( not ( = ?auto_19104 ?auto_19109 ) ) ( not ( = ?auto_19107 ?auto_19109 ) ) ( not ( = ?auto_19114 ?auto_19111 ) ) ( not ( = ?auto_19118 ?auto_19114 ) ) ( HOIST-AT ?auto_19110 ?auto_19114 ) ( not ( = ?auto_19115 ?auto_19110 ) ) ( not ( = ?auto_19119 ?auto_19110 ) ) ( AVAILABLE ?auto_19110 ) ( SURFACE-AT ?auto_19104 ?auto_19114 ) ( ON ?auto_19104 ?auto_19116 ) ( CLEAR ?auto_19104 ) ( not ( = ?auto_19103 ?auto_19116 ) ) ( not ( = ?auto_19104 ?auto_19116 ) ) ( not ( = ?auto_19107 ?auto_19116 ) ) ( not ( = ?auto_19109 ?auto_19116 ) ) ( IS-CRATE ?auto_19109 ) ( not ( = ?auto_19103 ?auto_19117 ) ) ( not ( = ?auto_19104 ?auto_19117 ) ) ( not ( = ?auto_19107 ?auto_19117 ) ) ( not ( = ?auto_19109 ?auto_19117 ) ) ( not ( = ?auto_19116 ?auto_19117 ) ) ( not ( = ?auto_19105 ?auto_19111 ) ) ( not ( = ?auto_19118 ?auto_19105 ) ) ( not ( = ?auto_19114 ?auto_19105 ) ) ( HOIST-AT ?auto_19113 ?auto_19105 ) ( not ( = ?auto_19115 ?auto_19113 ) ) ( not ( = ?auto_19119 ?auto_19113 ) ) ( not ( = ?auto_19110 ?auto_19113 ) ) ( AVAILABLE ?auto_19113 ) ( SURFACE-AT ?auto_19109 ?auto_19105 ) ( ON ?auto_19109 ?auto_19108 ) ( CLEAR ?auto_19109 ) ( not ( = ?auto_19103 ?auto_19108 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19107 ?auto_19108 ) ) ( not ( = ?auto_19109 ?auto_19108 ) ) ( not ( = ?auto_19116 ?auto_19108 ) ) ( not ( = ?auto_19117 ?auto_19108 ) ) ( TRUCK-AT ?auto_19106 ?auto_19111 ) ( SURFACE-AT ?auto_19112 ?auto_19111 ) ( CLEAR ?auto_19112 ) ( IS-CRATE ?auto_19117 ) ( not ( = ?auto_19103 ?auto_19112 ) ) ( not ( = ?auto_19104 ?auto_19112 ) ) ( not ( = ?auto_19107 ?auto_19112 ) ) ( not ( = ?auto_19109 ?auto_19112 ) ) ( not ( = ?auto_19116 ?auto_19112 ) ) ( not ( = ?auto_19117 ?auto_19112 ) ) ( not ( = ?auto_19108 ?auto_19112 ) ) ( AVAILABLE ?auto_19115 ) ( IN ?auto_19117 ?auto_19106 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19115 ?auto_19117 ?auto_19106 ?auto_19111 )
      ( MAKE-ON ?auto_19103 ?auto_19104 )
      ( MAKE-ON-VERIFY ?auto_19103 ?auto_19104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19120 - SURFACE
      ?auto_19121 - SURFACE
    )
    :vars
    (
      ?auto_19124 - HOIST
      ?auto_19122 - PLACE
      ?auto_19134 - PLACE
      ?auto_19127 - HOIST
      ?auto_19129 - SURFACE
      ?auto_19135 - SURFACE
      ?auto_19133 - PLACE
      ?auto_19132 - HOIST
      ?auto_19126 - SURFACE
      ?auto_19125 - SURFACE
      ?auto_19131 - PLACE
      ?auto_19123 - HOIST
      ?auto_19130 - SURFACE
      ?auto_19128 - SURFACE
      ?auto_19136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19124 ?auto_19122 ) ( IS-CRATE ?auto_19120 ) ( not ( = ?auto_19120 ?auto_19121 ) ) ( not ( = ?auto_19134 ?auto_19122 ) ) ( HOIST-AT ?auto_19127 ?auto_19134 ) ( not ( = ?auto_19124 ?auto_19127 ) ) ( AVAILABLE ?auto_19127 ) ( SURFACE-AT ?auto_19120 ?auto_19134 ) ( ON ?auto_19120 ?auto_19129 ) ( CLEAR ?auto_19120 ) ( not ( = ?auto_19120 ?auto_19129 ) ) ( not ( = ?auto_19121 ?auto_19129 ) ) ( IS-CRATE ?auto_19121 ) ( not ( = ?auto_19120 ?auto_19135 ) ) ( not ( = ?auto_19121 ?auto_19135 ) ) ( not ( = ?auto_19129 ?auto_19135 ) ) ( not ( = ?auto_19133 ?auto_19122 ) ) ( not ( = ?auto_19134 ?auto_19133 ) ) ( HOIST-AT ?auto_19132 ?auto_19133 ) ( not ( = ?auto_19124 ?auto_19132 ) ) ( not ( = ?auto_19127 ?auto_19132 ) ) ( AVAILABLE ?auto_19132 ) ( SURFACE-AT ?auto_19121 ?auto_19133 ) ( ON ?auto_19121 ?auto_19126 ) ( CLEAR ?auto_19121 ) ( not ( = ?auto_19120 ?auto_19126 ) ) ( not ( = ?auto_19121 ?auto_19126 ) ) ( not ( = ?auto_19129 ?auto_19126 ) ) ( not ( = ?auto_19135 ?auto_19126 ) ) ( IS-CRATE ?auto_19135 ) ( not ( = ?auto_19120 ?auto_19125 ) ) ( not ( = ?auto_19121 ?auto_19125 ) ) ( not ( = ?auto_19129 ?auto_19125 ) ) ( not ( = ?auto_19135 ?auto_19125 ) ) ( not ( = ?auto_19126 ?auto_19125 ) ) ( not ( = ?auto_19131 ?auto_19122 ) ) ( not ( = ?auto_19134 ?auto_19131 ) ) ( not ( = ?auto_19133 ?auto_19131 ) ) ( HOIST-AT ?auto_19123 ?auto_19131 ) ( not ( = ?auto_19124 ?auto_19123 ) ) ( not ( = ?auto_19127 ?auto_19123 ) ) ( not ( = ?auto_19132 ?auto_19123 ) ) ( AVAILABLE ?auto_19123 ) ( SURFACE-AT ?auto_19135 ?auto_19131 ) ( ON ?auto_19135 ?auto_19130 ) ( CLEAR ?auto_19135 ) ( not ( = ?auto_19120 ?auto_19130 ) ) ( not ( = ?auto_19121 ?auto_19130 ) ) ( not ( = ?auto_19129 ?auto_19130 ) ) ( not ( = ?auto_19135 ?auto_19130 ) ) ( not ( = ?auto_19126 ?auto_19130 ) ) ( not ( = ?auto_19125 ?auto_19130 ) ) ( SURFACE-AT ?auto_19128 ?auto_19122 ) ( CLEAR ?auto_19128 ) ( IS-CRATE ?auto_19125 ) ( not ( = ?auto_19120 ?auto_19128 ) ) ( not ( = ?auto_19121 ?auto_19128 ) ) ( not ( = ?auto_19129 ?auto_19128 ) ) ( not ( = ?auto_19135 ?auto_19128 ) ) ( not ( = ?auto_19126 ?auto_19128 ) ) ( not ( = ?auto_19125 ?auto_19128 ) ) ( not ( = ?auto_19130 ?auto_19128 ) ) ( AVAILABLE ?auto_19124 ) ( IN ?auto_19125 ?auto_19136 ) ( TRUCK-AT ?auto_19136 ?auto_19134 ) )
    :subtasks
    ( ( !DRIVE ?auto_19136 ?auto_19134 ?auto_19122 )
      ( MAKE-ON ?auto_19120 ?auto_19121 )
      ( MAKE-ON-VERIFY ?auto_19120 ?auto_19121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19137 - SURFACE
      ?auto_19138 - SURFACE
    )
    :vars
    (
      ?auto_19152 - HOIST
      ?auto_19142 - PLACE
      ?auto_19153 - PLACE
      ?auto_19150 - HOIST
      ?auto_19149 - SURFACE
      ?auto_19147 - SURFACE
      ?auto_19144 - PLACE
      ?auto_19139 - HOIST
      ?auto_19145 - SURFACE
      ?auto_19140 - SURFACE
      ?auto_19146 - PLACE
      ?auto_19151 - HOIST
      ?auto_19143 - SURFACE
      ?auto_19141 - SURFACE
      ?auto_19148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19152 ?auto_19142 ) ( IS-CRATE ?auto_19137 ) ( not ( = ?auto_19137 ?auto_19138 ) ) ( not ( = ?auto_19153 ?auto_19142 ) ) ( HOIST-AT ?auto_19150 ?auto_19153 ) ( not ( = ?auto_19152 ?auto_19150 ) ) ( SURFACE-AT ?auto_19137 ?auto_19153 ) ( ON ?auto_19137 ?auto_19149 ) ( CLEAR ?auto_19137 ) ( not ( = ?auto_19137 ?auto_19149 ) ) ( not ( = ?auto_19138 ?auto_19149 ) ) ( IS-CRATE ?auto_19138 ) ( not ( = ?auto_19137 ?auto_19147 ) ) ( not ( = ?auto_19138 ?auto_19147 ) ) ( not ( = ?auto_19149 ?auto_19147 ) ) ( not ( = ?auto_19144 ?auto_19142 ) ) ( not ( = ?auto_19153 ?auto_19144 ) ) ( HOIST-AT ?auto_19139 ?auto_19144 ) ( not ( = ?auto_19152 ?auto_19139 ) ) ( not ( = ?auto_19150 ?auto_19139 ) ) ( AVAILABLE ?auto_19139 ) ( SURFACE-AT ?auto_19138 ?auto_19144 ) ( ON ?auto_19138 ?auto_19145 ) ( CLEAR ?auto_19138 ) ( not ( = ?auto_19137 ?auto_19145 ) ) ( not ( = ?auto_19138 ?auto_19145 ) ) ( not ( = ?auto_19149 ?auto_19145 ) ) ( not ( = ?auto_19147 ?auto_19145 ) ) ( IS-CRATE ?auto_19147 ) ( not ( = ?auto_19137 ?auto_19140 ) ) ( not ( = ?auto_19138 ?auto_19140 ) ) ( not ( = ?auto_19149 ?auto_19140 ) ) ( not ( = ?auto_19147 ?auto_19140 ) ) ( not ( = ?auto_19145 ?auto_19140 ) ) ( not ( = ?auto_19146 ?auto_19142 ) ) ( not ( = ?auto_19153 ?auto_19146 ) ) ( not ( = ?auto_19144 ?auto_19146 ) ) ( HOIST-AT ?auto_19151 ?auto_19146 ) ( not ( = ?auto_19152 ?auto_19151 ) ) ( not ( = ?auto_19150 ?auto_19151 ) ) ( not ( = ?auto_19139 ?auto_19151 ) ) ( AVAILABLE ?auto_19151 ) ( SURFACE-AT ?auto_19147 ?auto_19146 ) ( ON ?auto_19147 ?auto_19143 ) ( CLEAR ?auto_19147 ) ( not ( = ?auto_19137 ?auto_19143 ) ) ( not ( = ?auto_19138 ?auto_19143 ) ) ( not ( = ?auto_19149 ?auto_19143 ) ) ( not ( = ?auto_19147 ?auto_19143 ) ) ( not ( = ?auto_19145 ?auto_19143 ) ) ( not ( = ?auto_19140 ?auto_19143 ) ) ( SURFACE-AT ?auto_19141 ?auto_19142 ) ( CLEAR ?auto_19141 ) ( IS-CRATE ?auto_19140 ) ( not ( = ?auto_19137 ?auto_19141 ) ) ( not ( = ?auto_19138 ?auto_19141 ) ) ( not ( = ?auto_19149 ?auto_19141 ) ) ( not ( = ?auto_19147 ?auto_19141 ) ) ( not ( = ?auto_19145 ?auto_19141 ) ) ( not ( = ?auto_19140 ?auto_19141 ) ) ( not ( = ?auto_19143 ?auto_19141 ) ) ( AVAILABLE ?auto_19152 ) ( TRUCK-AT ?auto_19148 ?auto_19153 ) ( LIFTING ?auto_19150 ?auto_19140 ) )
    :subtasks
    ( ( !LOAD ?auto_19150 ?auto_19140 ?auto_19148 ?auto_19153 )
      ( MAKE-ON ?auto_19137 ?auto_19138 )
      ( MAKE-ON-VERIFY ?auto_19137 ?auto_19138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19154 - SURFACE
      ?auto_19155 - SURFACE
    )
    :vars
    (
      ?auto_19163 - HOIST
      ?auto_19161 - PLACE
      ?auto_19170 - PLACE
      ?auto_19167 - HOIST
      ?auto_19165 - SURFACE
      ?auto_19162 - SURFACE
      ?auto_19156 - PLACE
      ?auto_19169 - HOIST
      ?auto_19157 - SURFACE
      ?auto_19160 - SURFACE
      ?auto_19158 - PLACE
      ?auto_19168 - HOIST
      ?auto_19164 - SURFACE
      ?auto_19159 - SURFACE
      ?auto_19166 - TRUCK
      ?auto_19171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19163 ?auto_19161 ) ( IS-CRATE ?auto_19154 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( not ( = ?auto_19170 ?auto_19161 ) ) ( HOIST-AT ?auto_19167 ?auto_19170 ) ( not ( = ?auto_19163 ?auto_19167 ) ) ( SURFACE-AT ?auto_19154 ?auto_19170 ) ( ON ?auto_19154 ?auto_19165 ) ( CLEAR ?auto_19154 ) ( not ( = ?auto_19154 ?auto_19165 ) ) ( not ( = ?auto_19155 ?auto_19165 ) ) ( IS-CRATE ?auto_19155 ) ( not ( = ?auto_19154 ?auto_19162 ) ) ( not ( = ?auto_19155 ?auto_19162 ) ) ( not ( = ?auto_19165 ?auto_19162 ) ) ( not ( = ?auto_19156 ?auto_19161 ) ) ( not ( = ?auto_19170 ?auto_19156 ) ) ( HOIST-AT ?auto_19169 ?auto_19156 ) ( not ( = ?auto_19163 ?auto_19169 ) ) ( not ( = ?auto_19167 ?auto_19169 ) ) ( AVAILABLE ?auto_19169 ) ( SURFACE-AT ?auto_19155 ?auto_19156 ) ( ON ?auto_19155 ?auto_19157 ) ( CLEAR ?auto_19155 ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( not ( = ?auto_19165 ?auto_19157 ) ) ( not ( = ?auto_19162 ?auto_19157 ) ) ( IS-CRATE ?auto_19162 ) ( not ( = ?auto_19154 ?auto_19160 ) ) ( not ( = ?auto_19155 ?auto_19160 ) ) ( not ( = ?auto_19165 ?auto_19160 ) ) ( not ( = ?auto_19162 ?auto_19160 ) ) ( not ( = ?auto_19157 ?auto_19160 ) ) ( not ( = ?auto_19158 ?auto_19161 ) ) ( not ( = ?auto_19170 ?auto_19158 ) ) ( not ( = ?auto_19156 ?auto_19158 ) ) ( HOIST-AT ?auto_19168 ?auto_19158 ) ( not ( = ?auto_19163 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19168 ) ) ( not ( = ?auto_19169 ?auto_19168 ) ) ( AVAILABLE ?auto_19168 ) ( SURFACE-AT ?auto_19162 ?auto_19158 ) ( ON ?auto_19162 ?auto_19164 ) ( CLEAR ?auto_19162 ) ( not ( = ?auto_19154 ?auto_19164 ) ) ( not ( = ?auto_19155 ?auto_19164 ) ) ( not ( = ?auto_19165 ?auto_19164 ) ) ( not ( = ?auto_19162 ?auto_19164 ) ) ( not ( = ?auto_19157 ?auto_19164 ) ) ( not ( = ?auto_19160 ?auto_19164 ) ) ( SURFACE-AT ?auto_19159 ?auto_19161 ) ( CLEAR ?auto_19159 ) ( IS-CRATE ?auto_19160 ) ( not ( = ?auto_19154 ?auto_19159 ) ) ( not ( = ?auto_19155 ?auto_19159 ) ) ( not ( = ?auto_19165 ?auto_19159 ) ) ( not ( = ?auto_19162 ?auto_19159 ) ) ( not ( = ?auto_19157 ?auto_19159 ) ) ( not ( = ?auto_19160 ?auto_19159 ) ) ( not ( = ?auto_19164 ?auto_19159 ) ) ( AVAILABLE ?auto_19163 ) ( TRUCK-AT ?auto_19166 ?auto_19170 ) ( AVAILABLE ?auto_19167 ) ( SURFACE-AT ?auto_19160 ?auto_19170 ) ( ON ?auto_19160 ?auto_19171 ) ( CLEAR ?auto_19160 ) ( not ( = ?auto_19154 ?auto_19171 ) ) ( not ( = ?auto_19155 ?auto_19171 ) ) ( not ( = ?auto_19165 ?auto_19171 ) ) ( not ( = ?auto_19162 ?auto_19171 ) ) ( not ( = ?auto_19157 ?auto_19171 ) ) ( not ( = ?auto_19160 ?auto_19171 ) ) ( not ( = ?auto_19164 ?auto_19171 ) ) ( not ( = ?auto_19159 ?auto_19171 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19167 ?auto_19160 ?auto_19171 ?auto_19170 )
      ( MAKE-ON ?auto_19154 ?auto_19155 )
      ( MAKE-ON-VERIFY ?auto_19154 ?auto_19155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19172 - SURFACE
      ?auto_19173 - SURFACE
    )
    :vars
    (
      ?auto_19175 - HOIST
      ?auto_19174 - PLACE
      ?auto_19182 - PLACE
      ?auto_19185 - HOIST
      ?auto_19180 - SURFACE
      ?auto_19186 - SURFACE
      ?auto_19183 - PLACE
      ?auto_19177 - HOIST
      ?auto_19181 - SURFACE
      ?auto_19189 - SURFACE
      ?auto_19176 - PLACE
      ?auto_19179 - HOIST
      ?auto_19178 - SURFACE
      ?auto_19188 - SURFACE
      ?auto_19187 - SURFACE
      ?auto_19184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19175 ?auto_19174 ) ( IS-CRATE ?auto_19172 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19182 ?auto_19174 ) ) ( HOIST-AT ?auto_19185 ?auto_19182 ) ( not ( = ?auto_19175 ?auto_19185 ) ) ( SURFACE-AT ?auto_19172 ?auto_19182 ) ( ON ?auto_19172 ?auto_19180 ) ( CLEAR ?auto_19172 ) ( not ( = ?auto_19172 ?auto_19180 ) ) ( not ( = ?auto_19173 ?auto_19180 ) ) ( IS-CRATE ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19186 ) ) ( not ( = ?auto_19173 ?auto_19186 ) ) ( not ( = ?auto_19180 ?auto_19186 ) ) ( not ( = ?auto_19183 ?auto_19174 ) ) ( not ( = ?auto_19182 ?auto_19183 ) ) ( HOIST-AT ?auto_19177 ?auto_19183 ) ( not ( = ?auto_19175 ?auto_19177 ) ) ( not ( = ?auto_19185 ?auto_19177 ) ) ( AVAILABLE ?auto_19177 ) ( SURFACE-AT ?auto_19173 ?auto_19183 ) ( ON ?auto_19173 ?auto_19181 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19181 ) ) ( not ( = ?auto_19173 ?auto_19181 ) ) ( not ( = ?auto_19180 ?auto_19181 ) ) ( not ( = ?auto_19186 ?auto_19181 ) ) ( IS-CRATE ?auto_19186 ) ( not ( = ?auto_19172 ?auto_19189 ) ) ( not ( = ?auto_19173 ?auto_19189 ) ) ( not ( = ?auto_19180 ?auto_19189 ) ) ( not ( = ?auto_19186 ?auto_19189 ) ) ( not ( = ?auto_19181 ?auto_19189 ) ) ( not ( = ?auto_19176 ?auto_19174 ) ) ( not ( = ?auto_19182 ?auto_19176 ) ) ( not ( = ?auto_19183 ?auto_19176 ) ) ( HOIST-AT ?auto_19179 ?auto_19176 ) ( not ( = ?auto_19175 ?auto_19179 ) ) ( not ( = ?auto_19185 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( AVAILABLE ?auto_19179 ) ( SURFACE-AT ?auto_19186 ?auto_19176 ) ( ON ?auto_19186 ?auto_19178 ) ( CLEAR ?auto_19186 ) ( not ( = ?auto_19172 ?auto_19178 ) ) ( not ( = ?auto_19173 ?auto_19178 ) ) ( not ( = ?auto_19180 ?auto_19178 ) ) ( not ( = ?auto_19186 ?auto_19178 ) ) ( not ( = ?auto_19181 ?auto_19178 ) ) ( not ( = ?auto_19189 ?auto_19178 ) ) ( SURFACE-AT ?auto_19188 ?auto_19174 ) ( CLEAR ?auto_19188 ) ( IS-CRATE ?auto_19189 ) ( not ( = ?auto_19172 ?auto_19188 ) ) ( not ( = ?auto_19173 ?auto_19188 ) ) ( not ( = ?auto_19180 ?auto_19188 ) ) ( not ( = ?auto_19186 ?auto_19188 ) ) ( not ( = ?auto_19181 ?auto_19188 ) ) ( not ( = ?auto_19189 ?auto_19188 ) ) ( not ( = ?auto_19178 ?auto_19188 ) ) ( AVAILABLE ?auto_19175 ) ( AVAILABLE ?auto_19185 ) ( SURFACE-AT ?auto_19189 ?auto_19182 ) ( ON ?auto_19189 ?auto_19187 ) ( CLEAR ?auto_19189 ) ( not ( = ?auto_19172 ?auto_19187 ) ) ( not ( = ?auto_19173 ?auto_19187 ) ) ( not ( = ?auto_19180 ?auto_19187 ) ) ( not ( = ?auto_19186 ?auto_19187 ) ) ( not ( = ?auto_19181 ?auto_19187 ) ) ( not ( = ?auto_19189 ?auto_19187 ) ) ( not ( = ?auto_19178 ?auto_19187 ) ) ( not ( = ?auto_19188 ?auto_19187 ) ) ( TRUCK-AT ?auto_19184 ?auto_19174 ) )
    :subtasks
    ( ( !DRIVE ?auto_19184 ?auto_19174 ?auto_19182 )
      ( MAKE-ON ?auto_19172 ?auto_19173 )
      ( MAKE-ON-VERIFY ?auto_19172 ?auto_19173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19190 - SURFACE
      ?auto_19191 - SURFACE
    )
    :vars
    (
      ?auto_19199 - HOIST
      ?auto_19200 - PLACE
      ?auto_19206 - PLACE
      ?auto_19205 - HOIST
      ?auto_19201 - SURFACE
      ?auto_19203 - SURFACE
      ?auto_19193 - PLACE
      ?auto_19196 - HOIST
      ?auto_19204 - SURFACE
      ?auto_19192 - SURFACE
      ?auto_19197 - PLACE
      ?auto_19207 - HOIST
      ?auto_19202 - SURFACE
      ?auto_19194 - SURFACE
      ?auto_19198 - SURFACE
      ?auto_19195 - TRUCK
      ?auto_19208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19199 ?auto_19200 ) ( IS-CRATE ?auto_19190 ) ( not ( = ?auto_19190 ?auto_19191 ) ) ( not ( = ?auto_19206 ?auto_19200 ) ) ( HOIST-AT ?auto_19205 ?auto_19206 ) ( not ( = ?auto_19199 ?auto_19205 ) ) ( SURFACE-AT ?auto_19190 ?auto_19206 ) ( ON ?auto_19190 ?auto_19201 ) ( CLEAR ?auto_19190 ) ( not ( = ?auto_19190 ?auto_19201 ) ) ( not ( = ?auto_19191 ?auto_19201 ) ) ( IS-CRATE ?auto_19191 ) ( not ( = ?auto_19190 ?auto_19203 ) ) ( not ( = ?auto_19191 ?auto_19203 ) ) ( not ( = ?auto_19201 ?auto_19203 ) ) ( not ( = ?auto_19193 ?auto_19200 ) ) ( not ( = ?auto_19206 ?auto_19193 ) ) ( HOIST-AT ?auto_19196 ?auto_19193 ) ( not ( = ?auto_19199 ?auto_19196 ) ) ( not ( = ?auto_19205 ?auto_19196 ) ) ( AVAILABLE ?auto_19196 ) ( SURFACE-AT ?auto_19191 ?auto_19193 ) ( ON ?auto_19191 ?auto_19204 ) ( CLEAR ?auto_19191 ) ( not ( = ?auto_19190 ?auto_19204 ) ) ( not ( = ?auto_19191 ?auto_19204 ) ) ( not ( = ?auto_19201 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19204 ) ) ( IS-CRATE ?auto_19203 ) ( not ( = ?auto_19190 ?auto_19192 ) ) ( not ( = ?auto_19191 ?auto_19192 ) ) ( not ( = ?auto_19201 ?auto_19192 ) ) ( not ( = ?auto_19203 ?auto_19192 ) ) ( not ( = ?auto_19204 ?auto_19192 ) ) ( not ( = ?auto_19197 ?auto_19200 ) ) ( not ( = ?auto_19206 ?auto_19197 ) ) ( not ( = ?auto_19193 ?auto_19197 ) ) ( HOIST-AT ?auto_19207 ?auto_19197 ) ( not ( = ?auto_19199 ?auto_19207 ) ) ( not ( = ?auto_19205 ?auto_19207 ) ) ( not ( = ?auto_19196 ?auto_19207 ) ) ( AVAILABLE ?auto_19207 ) ( SURFACE-AT ?auto_19203 ?auto_19197 ) ( ON ?auto_19203 ?auto_19202 ) ( CLEAR ?auto_19203 ) ( not ( = ?auto_19190 ?auto_19202 ) ) ( not ( = ?auto_19191 ?auto_19202 ) ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( not ( = ?auto_19203 ?auto_19202 ) ) ( not ( = ?auto_19204 ?auto_19202 ) ) ( not ( = ?auto_19192 ?auto_19202 ) ) ( IS-CRATE ?auto_19192 ) ( not ( = ?auto_19190 ?auto_19194 ) ) ( not ( = ?auto_19191 ?auto_19194 ) ) ( not ( = ?auto_19201 ?auto_19194 ) ) ( not ( = ?auto_19203 ?auto_19194 ) ) ( not ( = ?auto_19204 ?auto_19194 ) ) ( not ( = ?auto_19192 ?auto_19194 ) ) ( not ( = ?auto_19202 ?auto_19194 ) ) ( AVAILABLE ?auto_19205 ) ( SURFACE-AT ?auto_19192 ?auto_19206 ) ( ON ?auto_19192 ?auto_19198 ) ( CLEAR ?auto_19192 ) ( not ( = ?auto_19190 ?auto_19198 ) ) ( not ( = ?auto_19191 ?auto_19198 ) ) ( not ( = ?auto_19201 ?auto_19198 ) ) ( not ( = ?auto_19203 ?auto_19198 ) ) ( not ( = ?auto_19204 ?auto_19198 ) ) ( not ( = ?auto_19192 ?auto_19198 ) ) ( not ( = ?auto_19202 ?auto_19198 ) ) ( not ( = ?auto_19194 ?auto_19198 ) ) ( TRUCK-AT ?auto_19195 ?auto_19200 ) ( SURFACE-AT ?auto_19208 ?auto_19200 ) ( CLEAR ?auto_19208 ) ( LIFTING ?auto_19199 ?auto_19194 ) ( IS-CRATE ?auto_19194 ) ( not ( = ?auto_19190 ?auto_19208 ) ) ( not ( = ?auto_19191 ?auto_19208 ) ) ( not ( = ?auto_19201 ?auto_19208 ) ) ( not ( = ?auto_19203 ?auto_19208 ) ) ( not ( = ?auto_19204 ?auto_19208 ) ) ( not ( = ?auto_19192 ?auto_19208 ) ) ( not ( = ?auto_19202 ?auto_19208 ) ) ( not ( = ?auto_19194 ?auto_19208 ) ) ( not ( = ?auto_19198 ?auto_19208 ) ) )
    :subtasks
    ( ( !DROP ?auto_19199 ?auto_19194 ?auto_19208 ?auto_19200 )
      ( MAKE-ON ?auto_19190 ?auto_19191 )
      ( MAKE-ON-VERIFY ?auto_19190 ?auto_19191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19209 - SURFACE
      ?auto_19210 - SURFACE
    )
    :vars
    (
      ?auto_19225 - HOIST
      ?auto_19220 - PLACE
      ?auto_19218 - PLACE
      ?auto_19224 - HOIST
      ?auto_19211 - SURFACE
      ?auto_19226 - SURFACE
      ?auto_19213 - PLACE
      ?auto_19215 - HOIST
      ?auto_19219 - SURFACE
      ?auto_19221 - SURFACE
      ?auto_19216 - PLACE
      ?auto_19217 - HOIST
      ?auto_19223 - SURFACE
      ?auto_19212 - SURFACE
      ?auto_19214 - SURFACE
      ?auto_19227 - TRUCK
      ?auto_19222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19225 ?auto_19220 ) ( IS-CRATE ?auto_19209 ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19218 ?auto_19220 ) ) ( HOIST-AT ?auto_19224 ?auto_19218 ) ( not ( = ?auto_19225 ?auto_19224 ) ) ( SURFACE-AT ?auto_19209 ?auto_19218 ) ( ON ?auto_19209 ?auto_19211 ) ( CLEAR ?auto_19209 ) ( not ( = ?auto_19209 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( IS-CRATE ?auto_19210 ) ( not ( = ?auto_19209 ?auto_19226 ) ) ( not ( = ?auto_19210 ?auto_19226 ) ) ( not ( = ?auto_19211 ?auto_19226 ) ) ( not ( = ?auto_19213 ?auto_19220 ) ) ( not ( = ?auto_19218 ?auto_19213 ) ) ( HOIST-AT ?auto_19215 ?auto_19213 ) ( not ( = ?auto_19225 ?auto_19215 ) ) ( not ( = ?auto_19224 ?auto_19215 ) ) ( AVAILABLE ?auto_19215 ) ( SURFACE-AT ?auto_19210 ?auto_19213 ) ( ON ?auto_19210 ?auto_19219 ) ( CLEAR ?auto_19210 ) ( not ( = ?auto_19209 ?auto_19219 ) ) ( not ( = ?auto_19210 ?auto_19219 ) ) ( not ( = ?auto_19211 ?auto_19219 ) ) ( not ( = ?auto_19226 ?auto_19219 ) ) ( IS-CRATE ?auto_19226 ) ( not ( = ?auto_19209 ?auto_19221 ) ) ( not ( = ?auto_19210 ?auto_19221 ) ) ( not ( = ?auto_19211 ?auto_19221 ) ) ( not ( = ?auto_19226 ?auto_19221 ) ) ( not ( = ?auto_19219 ?auto_19221 ) ) ( not ( = ?auto_19216 ?auto_19220 ) ) ( not ( = ?auto_19218 ?auto_19216 ) ) ( not ( = ?auto_19213 ?auto_19216 ) ) ( HOIST-AT ?auto_19217 ?auto_19216 ) ( not ( = ?auto_19225 ?auto_19217 ) ) ( not ( = ?auto_19224 ?auto_19217 ) ) ( not ( = ?auto_19215 ?auto_19217 ) ) ( AVAILABLE ?auto_19217 ) ( SURFACE-AT ?auto_19226 ?auto_19216 ) ( ON ?auto_19226 ?auto_19223 ) ( CLEAR ?auto_19226 ) ( not ( = ?auto_19209 ?auto_19223 ) ) ( not ( = ?auto_19210 ?auto_19223 ) ) ( not ( = ?auto_19211 ?auto_19223 ) ) ( not ( = ?auto_19226 ?auto_19223 ) ) ( not ( = ?auto_19219 ?auto_19223 ) ) ( not ( = ?auto_19221 ?auto_19223 ) ) ( IS-CRATE ?auto_19221 ) ( not ( = ?auto_19209 ?auto_19212 ) ) ( not ( = ?auto_19210 ?auto_19212 ) ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( not ( = ?auto_19226 ?auto_19212 ) ) ( not ( = ?auto_19219 ?auto_19212 ) ) ( not ( = ?auto_19221 ?auto_19212 ) ) ( not ( = ?auto_19223 ?auto_19212 ) ) ( AVAILABLE ?auto_19224 ) ( SURFACE-AT ?auto_19221 ?auto_19218 ) ( ON ?auto_19221 ?auto_19214 ) ( CLEAR ?auto_19221 ) ( not ( = ?auto_19209 ?auto_19214 ) ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( not ( = ?auto_19211 ?auto_19214 ) ) ( not ( = ?auto_19226 ?auto_19214 ) ) ( not ( = ?auto_19219 ?auto_19214 ) ) ( not ( = ?auto_19221 ?auto_19214 ) ) ( not ( = ?auto_19223 ?auto_19214 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( TRUCK-AT ?auto_19227 ?auto_19220 ) ( SURFACE-AT ?auto_19222 ?auto_19220 ) ( CLEAR ?auto_19222 ) ( IS-CRATE ?auto_19212 ) ( not ( = ?auto_19209 ?auto_19222 ) ) ( not ( = ?auto_19210 ?auto_19222 ) ) ( not ( = ?auto_19211 ?auto_19222 ) ) ( not ( = ?auto_19226 ?auto_19222 ) ) ( not ( = ?auto_19219 ?auto_19222 ) ) ( not ( = ?auto_19221 ?auto_19222 ) ) ( not ( = ?auto_19223 ?auto_19222 ) ) ( not ( = ?auto_19212 ?auto_19222 ) ) ( not ( = ?auto_19214 ?auto_19222 ) ) ( AVAILABLE ?auto_19225 ) ( IN ?auto_19212 ?auto_19227 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19225 ?auto_19212 ?auto_19227 ?auto_19220 )
      ( MAKE-ON ?auto_19209 ?auto_19210 )
      ( MAKE-ON-VERIFY ?auto_19209 ?auto_19210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19228 - SURFACE
      ?auto_19229 - SURFACE
    )
    :vars
    (
      ?auto_19245 - HOIST
      ?auto_19236 - PLACE
      ?auto_19231 - PLACE
      ?auto_19241 - HOIST
      ?auto_19244 - SURFACE
      ?auto_19235 - SURFACE
      ?auto_19233 - PLACE
      ?auto_19242 - HOIST
      ?auto_19238 - SURFACE
      ?auto_19230 - SURFACE
      ?auto_19243 - PLACE
      ?auto_19232 - HOIST
      ?auto_19237 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19246 - SURFACE
      ?auto_19234 - SURFACE
      ?auto_19239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19245 ?auto_19236 ) ( IS-CRATE ?auto_19228 ) ( not ( = ?auto_19228 ?auto_19229 ) ) ( not ( = ?auto_19231 ?auto_19236 ) ) ( HOIST-AT ?auto_19241 ?auto_19231 ) ( not ( = ?auto_19245 ?auto_19241 ) ) ( SURFACE-AT ?auto_19228 ?auto_19231 ) ( ON ?auto_19228 ?auto_19244 ) ( CLEAR ?auto_19228 ) ( not ( = ?auto_19228 ?auto_19244 ) ) ( not ( = ?auto_19229 ?auto_19244 ) ) ( IS-CRATE ?auto_19229 ) ( not ( = ?auto_19228 ?auto_19235 ) ) ( not ( = ?auto_19229 ?auto_19235 ) ) ( not ( = ?auto_19244 ?auto_19235 ) ) ( not ( = ?auto_19233 ?auto_19236 ) ) ( not ( = ?auto_19231 ?auto_19233 ) ) ( HOIST-AT ?auto_19242 ?auto_19233 ) ( not ( = ?auto_19245 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( AVAILABLE ?auto_19242 ) ( SURFACE-AT ?auto_19229 ?auto_19233 ) ( ON ?auto_19229 ?auto_19238 ) ( CLEAR ?auto_19229 ) ( not ( = ?auto_19228 ?auto_19238 ) ) ( not ( = ?auto_19229 ?auto_19238 ) ) ( not ( = ?auto_19244 ?auto_19238 ) ) ( not ( = ?auto_19235 ?auto_19238 ) ) ( IS-CRATE ?auto_19235 ) ( not ( = ?auto_19228 ?auto_19230 ) ) ( not ( = ?auto_19229 ?auto_19230 ) ) ( not ( = ?auto_19244 ?auto_19230 ) ) ( not ( = ?auto_19235 ?auto_19230 ) ) ( not ( = ?auto_19238 ?auto_19230 ) ) ( not ( = ?auto_19243 ?auto_19236 ) ) ( not ( = ?auto_19231 ?auto_19243 ) ) ( not ( = ?auto_19233 ?auto_19243 ) ) ( HOIST-AT ?auto_19232 ?auto_19243 ) ( not ( = ?auto_19245 ?auto_19232 ) ) ( not ( = ?auto_19241 ?auto_19232 ) ) ( not ( = ?auto_19242 ?auto_19232 ) ) ( AVAILABLE ?auto_19232 ) ( SURFACE-AT ?auto_19235 ?auto_19243 ) ( ON ?auto_19235 ?auto_19237 ) ( CLEAR ?auto_19235 ) ( not ( = ?auto_19228 ?auto_19237 ) ) ( not ( = ?auto_19229 ?auto_19237 ) ) ( not ( = ?auto_19244 ?auto_19237 ) ) ( not ( = ?auto_19235 ?auto_19237 ) ) ( not ( = ?auto_19238 ?auto_19237 ) ) ( not ( = ?auto_19230 ?auto_19237 ) ) ( IS-CRATE ?auto_19230 ) ( not ( = ?auto_19228 ?auto_19240 ) ) ( not ( = ?auto_19229 ?auto_19240 ) ) ( not ( = ?auto_19244 ?auto_19240 ) ) ( not ( = ?auto_19235 ?auto_19240 ) ) ( not ( = ?auto_19238 ?auto_19240 ) ) ( not ( = ?auto_19230 ?auto_19240 ) ) ( not ( = ?auto_19237 ?auto_19240 ) ) ( AVAILABLE ?auto_19241 ) ( SURFACE-AT ?auto_19230 ?auto_19231 ) ( ON ?auto_19230 ?auto_19246 ) ( CLEAR ?auto_19230 ) ( not ( = ?auto_19228 ?auto_19246 ) ) ( not ( = ?auto_19229 ?auto_19246 ) ) ( not ( = ?auto_19244 ?auto_19246 ) ) ( not ( = ?auto_19235 ?auto_19246 ) ) ( not ( = ?auto_19238 ?auto_19246 ) ) ( not ( = ?auto_19230 ?auto_19246 ) ) ( not ( = ?auto_19237 ?auto_19246 ) ) ( not ( = ?auto_19240 ?auto_19246 ) ) ( SURFACE-AT ?auto_19234 ?auto_19236 ) ( CLEAR ?auto_19234 ) ( IS-CRATE ?auto_19240 ) ( not ( = ?auto_19228 ?auto_19234 ) ) ( not ( = ?auto_19229 ?auto_19234 ) ) ( not ( = ?auto_19244 ?auto_19234 ) ) ( not ( = ?auto_19235 ?auto_19234 ) ) ( not ( = ?auto_19238 ?auto_19234 ) ) ( not ( = ?auto_19230 ?auto_19234 ) ) ( not ( = ?auto_19237 ?auto_19234 ) ) ( not ( = ?auto_19240 ?auto_19234 ) ) ( not ( = ?auto_19246 ?auto_19234 ) ) ( AVAILABLE ?auto_19245 ) ( IN ?auto_19240 ?auto_19239 ) ( TRUCK-AT ?auto_19239 ?auto_19243 ) )
    :subtasks
    ( ( !DRIVE ?auto_19239 ?auto_19243 ?auto_19236 )
      ( MAKE-ON ?auto_19228 ?auto_19229 )
      ( MAKE-ON-VERIFY ?auto_19228 ?auto_19229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19247 - SURFACE
      ?auto_19248 - SURFACE
    )
    :vars
    (
      ?auto_19260 - HOIST
      ?auto_19252 - PLACE
      ?auto_19264 - PLACE
      ?auto_19259 - HOIST
      ?auto_19251 - SURFACE
      ?auto_19257 - SURFACE
      ?auto_19256 - PLACE
      ?auto_19253 - HOIST
      ?auto_19262 - SURFACE
      ?auto_19254 - SURFACE
      ?auto_19249 - PLACE
      ?auto_19261 - HOIST
      ?auto_19258 - SURFACE
      ?auto_19265 - SURFACE
      ?auto_19263 - SURFACE
      ?auto_19255 - SURFACE
      ?auto_19250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19260 ?auto_19252 ) ( IS-CRATE ?auto_19247 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19264 ?auto_19252 ) ) ( HOIST-AT ?auto_19259 ?auto_19264 ) ( not ( = ?auto_19260 ?auto_19259 ) ) ( SURFACE-AT ?auto_19247 ?auto_19264 ) ( ON ?auto_19247 ?auto_19251 ) ( CLEAR ?auto_19247 ) ( not ( = ?auto_19247 ?auto_19251 ) ) ( not ( = ?auto_19248 ?auto_19251 ) ) ( IS-CRATE ?auto_19248 ) ( not ( = ?auto_19247 ?auto_19257 ) ) ( not ( = ?auto_19248 ?auto_19257 ) ) ( not ( = ?auto_19251 ?auto_19257 ) ) ( not ( = ?auto_19256 ?auto_19252 ) ) ( not ( = ?auto_19264 ?auto_19256 ) ) ( HOIST-AT ?auto_19253 ?auto_19256 ) ( not ( = ?auto_19260 ?auto_19253 ) ) ( not ( = ?auto_19259 ?auto_19253 ) ) ( AVAILABLE ?auto_19253 ) ( SURFACE-AT ?auto_19248 ?auto_19256 ) ( ON ?auto_19248 ?auto_19262 ) ( CLEAR ?auto_19248 ) ( not ( = ?auto_19247 ?auto_19262 ) ) ( not ( = ?auto_19248 ?auto_19262 ) ) ( not ( = ?auto_19251 ?auto_19262 ) ) ( not ( = ?auto_19257 ?auto_19262 ) ) ( IS-CRATE ?auto_19257 ) ( not ( = ?auto_19247 ?auto_19254 ) ) ( not ( = ?auto_19248 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19257 ?auto_19254 ) ) ( not ( = ?auto_19262 ?auto_19254 ) ) ( not ( = ?auto_19249 ?auto_19252 ) ) ( not ( = ?auto_19264 ?auto_19249 ) ) ( not ( = ?auto_19256 ?auto_19249 ) ) ( HOIST-AT ?auto_19261 ?auto_19249 ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19259 ?auto_19261 ) ) ( not ( = ?auto_19253 ?auto_19261 ) ) ( SURFACE-AT ?auto_19257 ?auto_19249 ) ( ON ?auto_19257 ?auto_19258 ) ( CLEAR ?auto_19257 ) ( not ( = ?auto_19247 ?auto_19258 ) ) ( not ( = ?auto_19248 ?auto_19258 ) ) ( not ( = ?auto_19251 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19262 ?auto_19258 ) ) ( not ( = ?auto_19254 ?auto_19258 ) ) ( IS-CRATE ?auto_19254 ) ( not ( = ?auto_19247 ?auto_19265 ) ) ( not ( = ?auto_19248 ?auto_19265 ) ) ( not ( = ?auto_19251 ?auto_19265 ) ) ( not ( = ?auto_19257 ?auto_19265 ) ) ( not ( = ?auto_19262 ?auto_19265 ) ) ( not ( = ?auto_19254 ?auto_19265 ) ) ( not ( = ?auto_19258 ?auto_19265 ) ) ( AVAILABLE ?auto_19259 ) ( SURFACE-AT ?auto_19254 ?auto_19264 ) ( ON ?auto_19254 ?auto_19263 ) ( CLEAR ?auto_19254 ) ( not ( = ?auto_19247 ?auto_19263 ) ) ( not ( = ?auto_19248 ?auto_19263 ) ) ( not ( = ?auto_19251 ?auto_19263 ) ) ( not ( = ?auto_19257 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19263 ) ) ( not ( = ?auto_19254 ?auto_19263 ) ) ( not ( = ?auto_19258 ?auto_19263 ) ) ( not ( = ?auto_19265 ?auto_19263 ) ) ( SURFACE-AT ?auto_19255 ?auto_19252 ) ( CLEAR ?auto_19255 ) ( IS-CRATE ?auto_19265 ) ( not ( = ?auto_19247 ?auto_19255 ) ) ( not ( = ?auto_19248 ?auto_19255 ) ) ( not ( = ?auto_19251 ?auto_19255 ) ) ( not ( = ?auto_19257 ?auto_19255 ) ) ( not ( = ?auto_19262 ?auto_19255 ) ) ( not ( = ?auto_19254 ?auto_19255 ) ) ( not ( = ?auto_19258 ?auto_19255 ) ) ( not ( = ?auto_19265 ?auto_19255 ) ) ( not ( = ?auto_19263 ?auto_19255 ) ) ( AVAILABLE ?auto_19260 ) ( TRUCK-AT ?auto_19250 ?auto_19249 ) ( LIFTING ?auto_19261 ?auto_19265 ) )
    :subtasks
    ( ( !LOAD ?auto_19261 ?auto_19265 ?auto_19250 ?auto_19249 )
      ( MAKE-ON ?auto_19247 ?auto_19248 )
      ( MAKE-ON-VERIFY ?auto_19247 ?auto_19248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19266 - SURFACE
      ?auto_19267 - SURFACE
    )
    :vars
    (
      ?auto_19283 - HOIST
      ?auto_19282 - PLACE
      ?auto_19269 - PLACE
      ?auto_19275 - HOIST
      ?auto_19280 - SURFACE
      ?auto_19271 - SURFACE
      ?auto_19277 - PLACE
      ?auto_19276 - HOIST
      ?auto_19278 - SURFACE
      ?auto_19268 - SURFACE
      ?auto_19274 - PLACE
      ?auto_19281 - HOIST
      ?auto_19279 - SURFACE
      ?auto_19270 - SURFACE
      ?auto_19272 - SURFACE
      ?auto_19273 - SURFACE
      ?auto_19284 - TRUCK
      ?auto_19285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19283 ?auto_19282 ) ( IS-CRATE ?auto_19266 ) ( not ( = ?auto_19266 ?auto_19267 ) ) ( not ( = ?auto_19269 ?auto_19282 ) ) ( HOIST-AT ?auto_19275 ?auto_19269 ) ( not ( = ?auto_19283 ?auto_19275 ) ) ( SURFACE-AT ?auto_19266 ?auto_19269 ) ( ON ?auto_19266 ?auto_19280 ) ( CLEAR ?auto_19266 ) ( not ( = ?auto_19266 ?auto_19280 ) ) ( not ( = ?auto_19267 ?auto_19280 ) ) ( IS-CRATE ?auto_19267 ) ( not ( = ?auto_19266 ?auto_19271 ) ) ( not ( = ?auto_19267 ?auto_19271 ) ) ( not ( = ?auto_19280 ?auto_19271 ) ) ( not ( = ?auto_19277 ?auto_19282 ) ) ( not ( = ?auto_19269 ?auto_19277 ) ) ( HOIST-AT ?auto_19276 ?auto_19277 ) ( not ( = ?auto_19283 ?auto_19276 ) ) ( not ( = ?auto_19275 ?auto_19276 ) ) ( AVAILABLE ?auto_19276 ) ( SURFACE-AT ?auto_19267 ?auto_19277 ) ( ON ?auto_19267 ?auto_19278 ) ( CLEAR ?auto_19267 ) ( not ( = ?auto_19266 ?auto_19278 ) ) ( not ( = ?auto_19267 ?auto_19278 ) ) ( not ( = ?auto_19280 ?auto_19278 ) ) ( not ( = ?auto_19271 ?auto_19278 ) ) ( IS-CRATE ?auto_19271 ) ( not ( = ?auto_19266 ?auto_19268 ) ) ( not ( = ?auto_19267 ?auto_19268 ) ) ( not ( = ?auto_19280 ?auto_19268 ) ) ( not ( = ?auto_19271 ?auto_19268 ) ) ( not ( = ?auto_19278 ?auto_19268 ) ) ( not ( = ?auto_19274 ?auto_19282 ) ) ( not ( = ?auto_19269 ?auto_19274 ) ) ( not ( = ?auto_19277 ?auto_19274 ) ) ( HOIST-AT ?auto_19281 ?auto_19274 ) ( not ( = ?auto_19283 ?auto_19281 ) ) ( not ( = ?auto_19275 ?auto_19281 ) ) ( not ( = ?auto_19276 ?auto_19281 ) ) ( SURFACE-AT ?auto_19271 ?auto_19274 ) ( ON ?auto_19271 ?auto_19279 ) ( CLEAR ?auto_19271 ) ( not ( = ?auto_19266 ?auto_19279 ) ) ( not ( = ?auto_19267 ?auto_19279 ) ) ( not ( = ?auto_19280 ?auto_19279 ) ) ( not ( = ?auto_19271 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19268 ?auto_19279 ) ) ( IS-CRATE ?auto_19268 ) ( not ( = ?auto_19266 ?auto_19270 ) ) ( not ( = ?auto_19267 ?auto_19270 ) ) ( not ( = ?auto_19280 ?auto_19270 ) ) ( not ( = ?auto_19271 ?auto_19270 ) ) ( not ( = ?auto_19278 ?auto_19270 ) ) ( not ( = ?auto_19268 ?auto_19270 ) ) ( not ( = ?auto_19279 ?auto_19270 ) ) ( AVAILABLE ?auto_19275 ) ( SURFACE-AT ?auto_19268 ?auto_19269 ) ( ON ?auto_19268 ?auto_19272 ) ( CLEAR ?auto_19268 ) ( not ( = ?auto_19266 ?auto_19272 ) ) ( not ( = ?auto_19267 ?auto_19272 ) ) ( not ( = ?auto_19280 ?auto_19272 ) ) ( not ( = ?auto_19271 ?auto_19272 ) ) ( not ( = ?auto_19278 ?auto_19272 ) ) ( not ( = ?auto_19268 ?auto_19272 ) ) ( not ( = ?auto_19279 ?auto_19272 ) ) ( not ( = ?auto_19270 ?auto_19272 ) ) ( SURFACE-AT ?auto_19273 ?auto_19282 ) ( CLEAR ?auto_19273 ) ( IS-CRATE ?auto_19270 ) ( not ( = ?auto_19266 ?auto_19273 ) ) ( not ( = ?auto_19267 ?auto_19273 ) ) ( not ( = ?auto_19280 ?auto_19273 ) ) ( not ( = ?auto_19271 ?auto_19273 ) ) ( not ( = ?auto_19278 ?auto_19273 ) ) ( not ( = ?auto_19268 ?auto_19273 ) ) ( not ( = ?auto_19279 ?auto_19273 ) ) ( not ( = ?auto_19270 ?auto_19273 ) ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( AVAILABLE ?auto_19283 ) ( TRUCK-AT ?auto_19284 ?auto_19274 ) ( AVAILABLE ?auto_19281 ) ( SURFACE-AT ?auto_19270 ?auto_19274 ) ( ON ?auto_19270 ?auto_19285 ) ( CLEAR ?auto_19270 ) ( not ( = ?auto_19266 ?auto_19285 ) ) ( not ( = ?auto_19267 ?auto_19285 ) ) ( not ( = ?auto_19280 ?auto_19285 ) ) ( not ( = ?auto_19271 ?auto_19285 ) ) ( not ( = ?auto_19278 ?auto_19285 ) ) ( not ( = ?auto_19268 ?auto_19285 ) ) ( not ( = ?auto_19279 ?auto_19285 ) ) ( not ( = ?auto_19270 ?auto_19285 ) ) ( not ( = ?auto_19272 ?auto_19285 ) ) ( not ( = ?auto_19273 ?auto_19285 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19281 ?auto_19270 ?auto_19285 ?auto_19274 )
      ( MAKE-ON ?auto_19266 ?auto_19267 )
      ( MAKE-ON-VERIFY ?auto_19266 ?auto_19267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19286 - SURFACE
      ?auto_19287 - SURFACE
    )
    :vars
    (
      ?auto_19296 - HOIST
      ?auto_19299 - PLACE
      ?auto_19288 - PLACE
      ?auto_19298 - HOIST
      ?auto_19292 - SURFACE
      ?auto_19293 - SURFACE
      ?auto_19305 - PLACE
      ?auto_19300 - HOIST
      ?auto_19304 - SURFACE
      ?auto_19301 - SURFACE
      ?auto_19303 - PLACE
      ?auto_19295 - HOIST
      ?auto_19291 - SURFACE
      ?auto_19302 - SURFACE
      ?auto_19290 - SURFACE
      ?auto_19289 - SURFACE
      ?auto_19297 - SURFACE
      ?auto_19294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19296 ?auto_19299 ) ( IS-CRATE ?auto_19286 ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19288 ?auto_19299 ) ) ( HOIST-AT ?auto_19298 ?auto_19288 ) ( not ( = ?auto_19296 ?auto_19298 ) ) ( SURFACE-AT ?auto_19286 ?auto_19288 ) ( ON ?auto_19286 ?auto_19292 ) ( CLEAR ?auto_19286 ) ( not ( = ?auto_19286 ?auto_19292 ) ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( IS-CRATE ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19293 ) ) ( not ( = ?auto_19287 ?auto_19293 ) ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19305 ?auto_19299 ) ) ( not ( = ?auto_19288 ?auto_19305 ) ) ( HOIST-AT ?auto_19300 ?auto_19305 ) ( not ( = ?auto_19296 ?auto_19300 ) ) ( not ( = ?auto_19298 ?auto_19300 ) ) ( AVAILABLE ?auto_19300 ) ( SURFACE-AT ?auto_19287 ?auto_19305 ) ( ON ?auto_19287 ?auto_19304 ) ( CLEAR ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19304 ) ) ( not ( = ?auto_19287 ?auto_19304 ) ) ( not ( = ?auto_19292 ?auto_19304 ) ) ( not ( = ?auto_19293 ?auto_19304 ) ) ( IS-CRATE ?auto_19293 ) ( not ( = ?auto_19286 ?auto_19301 ) ) ( not ( = ?auto_19287 ?auto_19301 ) ) ( not ( = ?auto_19292 ?auto_19301 ) ) ( not ( = ?auto_19293 ?auto_19301 ) ) ( not ( = ?auto_19304 ?auto_19301 ) ) ( not ( = ?auto_19303 ?auto_19299 ) ) ( not ( = ?auto_19288 ?auto_19303 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( HOIST-AT ?auto_19295 ?auto_19303 ) ( not ( = ?auto_19296 ?auto_19295 ) ) ( not ( = ?auto_19298 ?auto_19295 ) ) ( not ( = ?auto_19300 ?auto_19295 ) ) ( SURFACE-AT ?auto_19293 ?auto_19303 ) ( ON ?auto_19293 ?auto_19291 ) ( CLEAR ?auto_19293 ) ( not ( = ?auto_19286 ?auto_19291 ) ) ( not ( = ?auto_19287 ?auto_19291 ) ) ( not ( = ?auto_19292 ?auto_19291 ) ) ( not ( = ?auto_19293 ?auto_19291 ) ) ( not ( = ?auto_19304 ?auto_19291 ) ) ( not ( = ?auto_19301 ?auto_19291 ) ) ( IS-CRATE ?auto_19301 ) ( not ( = ?auto_19286 ?auto_19302 ) ) ( not ( = ?auto_19287 ?auto_19302 ) ) ( not ( = ?auto_19292 ?auto_19302 ) ) ( not ( = ?auto_19293 ?auto_19302 ) ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19291 ?auto_19302 ) ) ( AVAILABLE ?auto_19298 ) ( SURFACE-AT ?auto_19301 ?auto_19288 ) ( ON ?auto_19301 ?auto_19290 ) ( CLEAR ?auto_19301 ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( not ( = ?auto_19292 ?auto_19290 ) ) ( not ( = ?auto_19293 ?auto_19290 ) ) ( not ( = ?auto_19304 ?auto_19290 ) ) ( not ( = ?auto_19301 ?auto_19290 ) ) ( not ( = ?auto_19291 ?auto_19290 ) ) ( not ( = ?auto_19302 ?auto_19290 ) ) ( SURFACE-AT ?auto_19289 ?auto_19299 ) ( CLEAR ?auto_19289 ) ( IS-CRATE ?auto_19302 ) ( not ( = ?auto_19286 ?auto_19289 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19292 ?auto_19289 ) ) ( not ( = ?auto_19293 ?auto_19289 ) ) ( not ( = ?auto_19304 ?auto_19289 ) ) ( not ( = ?auto_19301 ?auto_19289 ) ) ( not ( = ?auto_19291 ?auto_19289 ) ) ( not ( = ?auto_19302 ?auto_19289 ) ) ( not ( = ?auto_19290 ?auto_19289 ) ) ( AVAILABLE ?auto_19296 ) ( AVAILABLE ?auto_19295 ) ( SURFACE-AT ?auto_19302 ?auto_19303 ) ( ON ?auto_19302 ?auto_19297 ) ( CLEAR ?auto_19302 ) ( not ( = ?auto_19286 ?auto_19297 ) ) ( not ( = ?auto_19287 ?auto_19297 ) ) ( not ( = ?auto_19292 ?auto_19297 ) ) ( not ( = ?auto_19293 ?auto_19297 ) ) ( not ( = ?auto_19304 ?auto_19297 ) ) ( not ( = ?auto_19301 ?auto_19297 ) ) ( not ( = ?auto_19291 ?auto_19297 ) ) ( not ( = ?auto_19302 ?auto_19297 ) ) ( not ( = ?auto_19290 ?auto_19297 ) ) ( not ( = ?auto_19289 ?auto_19297 ) ) ( TRUCK-AT ?auto_19294 ?auto_19299 ) )
    :subtasks
    ( ( !DRIVE ?auto_19294 ?auto_19299 ?auto_19303 )
      ( MAKE-ON ?auto_19286 ?auto_19287 )
      ( MAKE-ON-VERIFY ?auto_19286 ?auto_19287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19308 - SURFACE
      ?auto_19309 - SURFACE
    )
    :vars
    (
      ?auto_19310 - HOIST
      ?auto_19311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19310 ?auto_19311 ) ( SURFACE-AT ?auto_19309 ?auto_19311 ) ( CLEAR ?auto_19309 ) ( LIFTING ?auto_19310 ?auto_19308 ) ( IS-CRATE ?auto_19308 ) ( not ( = ?auto_19308 ?auto_19309 ) ) )
    :subtasks
    ( ( !DROP ?auto_19310 ?auto_19308 ?auto_19309 ?auto_19311 )
      ( MAKE-ON-VERIFY ?auto_19308 ?auto_19309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19312 - SURFACE
      ?auto_19313 - SURFACE
    )
    :vars
    (
      ?auto_19314 - HOIST
      ?auto_19315 - PLACE
      ?auto_19316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19314 ?auto_19315 ) ( SURFACE-AT ?auto_19313 ?auto_19315 ) ( CLEAR ?auto_19313 ) ( IS-CRATE ?auto_19312 ) ( not ( = ?auto_19312 ?auto_19313 ) ) ( TRUCK-AT ?auto_19316 ?auto_19315 ) ( AVAILABLE ?auto_19314 ) ( IN ?auto_19312 ?auto_19316 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19314 ?auto_19312 ?auto_19316 ?auto_19315 )
      ( MAKE-ON ?auto_19312 ?auto_19313 )
      ( MAKE-ON-VERIFY ?auto_19312 ?auto_19313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19317 - SURFACE
      ?auto_19318 - SURFACE
    )
    :vars
    (
      ?auto_19320 - HOIST
      ?auto_19319 - PLACE
      ?auto_19321 - TRUCK
      ?auto_19322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19320 ?auto_19319 ) ( SURFACE-AT ?auto_19318 ?auto_19319 ) ( CLEAR ?auto_19318 ) ( IS-CRATE ?auto_19317 ) ( not ( = ?auto_19317 ?auto_19318 ) ) ( AVAILABLE ?auto_19320 ) ( IN ?auto_19317 ?auto_19321 ) ( TRUCK-AT ?auto_19321 ?auto_19322 ) ( not ( = ?auto_19322 ?auto_19319 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19321 ?auto_19322 ?auto_19319 )
      ( MAKE-ON ?auto_19317 ?auto_19318 )
      ( MAKE-ON-VERIFY ?auto_19317 ?auto_19318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19323 - SURFACE
      ?auto_19324 - SURFACE
    )
    :vars
    (
      ?auto_19328 - HOIST
      ?auto_19325 - PLACE
      ?auto_19326 - TRUCK
      ?auto_19327 - PLACE
      ?auto_19329 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19328 ?auto_19325 ) ( SURFACE-AT ?auto_19324 ?auto_19325 ) ( CLEAR ?auto_19324 ) ( IS-CRATE ?auto_19323 ) ( not ( = ?auto_19323 ?auto_19324 ) ) ( AVAILABLE ?auto_19328 ) ( TRUCK-AT ?auto_19326 ?auto_19327 ) ( not ( = ?auto_19327 ?auto_19325 ) ) ( HOIST-AT ?auto_19329 ?auto_19327 ) ( LIFTING ?auto_19329 ?auto_19323 ) ( not ( = ?auto_19328 ?auto_19329 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19329 ?auto_19323 ?auto_19326 ?auto_19327 )
      ( MAKE-ON ?auto_19323 ?auto_19324 )
      ( MAKE-ON-VERIFY ?auto_19323 ?auto_19324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19330 - SURFACE
      ?auto_19331 - SURFACE
    )
    :vars
    (
      ?auto_19333 - HOIST
      ?auto_19335 - PLACE
      ?auto_19332 - TRUCK
      ?auto_19334 - PLACE
      ?auto_19336 - HOIST
      ?auto_19337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19333 ?auto_19335 ) ( SURFACE-AT ?auto_19331 ?auto_19335 ) ( CLEAR ?auto_19331 ) ( IS-CRATE ?auto_19330 ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( AVAILABLE ?auto_19333 ) ( TRUCK-AT ?auto_19332 ?auto_19334 ) ( not ( = ?auto_19334 ?auto_19335 ) ) ( HOIST-AT ?auto_19336 ?auto_19334 ) ( not ( = ?auto_19333 ?auto_19336 ) ) ( AVAILABLE ?auto_19336 ) ( SURFACE-AT ?auto_19330 ?auto_19334 ) ( ON ?auto_19330 ?auto_19337 ) ( CLEAR ?auto_19330 ) ( not ( = ?auto_19330 ?auto_19337 ) ) ( not ( = ?auto_19331 ?auto_19337 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19336 ?auto_19330 ?auto_19337 ?auto_19334 )
      ( MAKE-ON ?auto_19330 ?auto_19331 )
      ( MAKE-ON-VERIFY ?auto_19330 ?auto_19331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19338 - SURFACE
      ?auto_19339 - SURFACE
    )
    :vars
    (
      ?auto_19341 - HOIST
      ?auto_19343 - PLACE
      ?auto_19344 - PLACE
      ?auto_19342 - HOIST
      ?auto_19345 - SURFACE
      ?auto_19340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19341 ?auto_19343 ) ( SURFACE-AT ?auto_19339 ?auto_19343 ) ( CLEAR ?auto_19339 ) ( IS-CRATE ?auto_19338 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( AVAILABLE ?auto_19341 ) ( not ( = ?auto_19344 ?auto_19343 ) ) ( HOIST-AT ?auto_19342 ?auto_19344 ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( AVAILABLE ?auto_19342 ) ( SURFACE-AT ?auto_19338 ?auto_19344 ) ( ON ?auto_19338 ?auto_19345 ) ( CLEAR ?auto_19338 ) ( not ( = ?auto_19338 ?auto_19345 ) ) ( not ( = ?auto_19339 ?auto_19345 ) ) ( TRUCK-AT ?auto_19340 ?auto_19343 ) )
    :subtasks
    ( ( !DRIVE ?auto_19340 ?auto_19343 ?auto_19344 )
      ( MAKE-ON ?auto_19338 ?auto_19339 )
      ( MAKE-ON-VERIFY ?auto_19338 ?auto_19339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19346 - SURFACE
      ?auto_19347 - SURFACE
    )
    :vars
    (
      ?auto_19353 - HOIST
      ?auto_19351 - PLACE
      ?auto_19350 - PLACE
      ?auto_19352 - HOIST
      ?auto_19348 - SURFACE
      ?auto_19349 - TRUCK
      ?auto_19354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19353 ?auto_19351 ) ( IS-CRATE ?auto_19346 ) ( not ( = ?auto_19346 ?auto_19347 ) ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( HOIST-AT ?auto_19352 ?auto_19350 ) ( not ( = ?auto_19353 ?auto_19352 ) ) ( AVAILABLE ?auto_19352 ) ( SURFACE-AT ?auto_19346 ?auto_19350 ) ( ON ?auto_19346 ?auto_19348 ) ( CLEAR ?auto_19346 ) ( not ( = ?auto_19346 ?auto_19348 ) ) ( not ( = ?auto_19347 ?auto_19348 ) ) ( TRUCK-AT ?auto_19349 ?auto_19351 ) ( SURFACE-AT ?auto_19354 ?auto_19351 ) ( CLEAR ?auto_19354 ) ( LIFTING ?auto_19353 ?auto_19347 ) ( IS-CRATE ?auto_19347 ) ( not ( = ?auto_19346 ?auto_19354 ) ) ( not ( = ?auto_19347 ?auto_19354 ) ) ( not ( = ?auto_19348 ?auto_19354 ) ) )
    :subtasks
    ( ( !DROP ?auto_19353 ?auto_19347 ?auto_19354 ?auto_19351 )
      ( MAKE-ON ?auto_19346 ?auto_19347 )
      ( MAKE-ON-VERIFY ?auto_19346 ?auto_19347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19355 - SURFACE
      ?auto_19356 - SURFACE
    )
    :vars
    (
      ?auto_19363 - HOIST
      ?auto_19357 - PLACE
      ?auto_19361 - PLACE
      ?auto_19358 - HOIST
      ?auto_19360 - SURFACE
      ?auto_19362 - TRUCK
      ?auto_19359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19363 ?auto_19357 ) ( IS-CRATE ?auto_19355 ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( not ( = ?auto_19361 ?auto_19357 ) ) ( HOIST-AT ?auto_19358 ?auto_19361 ) ( not ( = ?auto_19363 ?auto_19358 ) ) ( AVAILABLE ?auto_19358 ) ( SURFACE-AT ?auto_19355 ?auto_19361 ) ( ON ?auto_19355 ?auto_19360 ) ( CLEAR ?auto_19355 ) ( not ( = ?auto_19355 ?auto_19360 ) ) ( not ( = ?auto_19356 ?auto_19360 ) ) ( TRUCK-AT ?auto_19362 ?auto_19357 ) ( SURFACE-AT ?auto_19359 ?auto_19357 ) ( CLEAR ?auto_19359 ) ( IS-CRATE ?auto_19356 ) ( not ( = ?auto_19355 ?auto_19359 ) ) ( not ( = ?auto_19356 ?auto_19359 ) ) ( not ( = ?auto_19360 ?auto_19359 ) ) ( AVAILABLE ?auto_19363 ) ( IN ?auto_19356 ?auto_19362 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19363 ?auto_19356 ?auto_19362 ?auto_19357 )
      ( MAKE-ON ?auto_19355 ?auto_19356 )
      ( MAKE-ON-VERIFY ?auto_19355 ?auto_19356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19364 - SURFACE
      ?auto_19365 - SURFACE
    )
    :vars
    (
      ?auto_19368 - HOIST
      ?auto_19367 - PLACE
      ?auto_19369 - PLACE
      ?auto_19366 - HOIST
      ?auto_19370 - SURFACE
      ?auto_19371 - SURFACE
      ?auto_19372 - TRUCK
      ?auto_19373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19368 ?auto_19367 ) ( IS-CRATE ?auto_19364 ) ( not ( = ?auto_19364 ?auto_19365 ) ) ( not ( = ?auto_19369 ?auto_19367 ) ) ( HOIST-AT ?auto_19366 ?auto_19369 ) ( not ( = ?auto_19368 ?auto_19366 ) ) ( AVAILABLE ?auto_19366 ) ( SURFACE-AT ?auto_19364 ?auto_19369 ) ( ON ?auto_19364 ?auto_19370 ) ( CLEAR ?auto_19364 ) ( not ( = ?auto_19364 ?auto_19370 ) ) ( not ( = ?auto_19365 ?auto_19370 ) ) ( SURFACE-AT ?auto_19371 ?auto_19367 ) ( CLEAR ?auto_19371 ) ( IS-CRATE ?auto_19365 ) ( not ( = ?auto_19364 ?auto_19371 ) ) ( not ( = ?auto_19365 ?auto_19371 ) ) ( not ( = ?auto_19370 ?auto_19371 ) ) ( AVAILABLE ?auto_19368 ) ( IN ?auto_19365 ?auto_19372 ) ( TRUCK-AT ?auto_19372 ?auto_19373 ) ( not ( = ?auto_19373 ?auto_19367 ) ) ( not ( = ?auto_19369 ?auto_19373 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19372 ?auto_19373 ?auto_19367 )
      ( MAKE-ON ?auto_19364 ?auto_19365 )
      ( MAKE-ON-VERIFY ?auto_19364 ?auto_19365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19374 - SURFACE
      ?auto_19375 - SURFACE
    )
    :vars
    (
      ?auto_19383 - HOIST
      ?auto_19378 - PLACE
      ?auto_19380 - PLACE
      ?auto_19382 - HOIST
      ?auto_19376 - SURFACE
      ?auto_19379 - SURFACE
      ?auto_19377 - TRUCK
      ?auto_19381 - PLACE
      ?auto_19384 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19383 ?auto_19378 ) ( IS-CRATE ?auto_19374 ) ( not ( = ?auto_19374 ?auto_19375 ) ) ( not ( = ?auto_19380 ?auto_19378 ) ) ( HOIST-AT ?auto_19382 ?auto_19380 ) ( not ( = ?auto_19383 ?auto_19382 ) ) ( AVAILABLE ?auto_19382 ) ( SURFACE-AT ?auto_19374 ?auto_19380 ) ( ON ?auto_19374 ?auto_19376 ) ( CLEAR ?auto_19374 ) ( not ( = ?auto_19374 ?auto_19376 ) ) ( not ( = ?auto_19375 ?auto_19376 ) ) ( SURFACE-AT ?auto_19379 ?auto_19378 ) ( CLEAR ?auto_19379 ) ( IS-CRATE ?auto_19375 ) ( not ( = ?auto_19374 ?auto_19379 ) ) ( not ( = ?auto_19375 ?auto_19379 ) ) ( not ( = ?auto_19376 ?auto_19379 ) ) ( AVAILABLE ?auto_19383 ) ( TRUCK-AT ?auto_19377 ?auto_19381 ) ( not ( = ?auto_19381 ?auto_19378 ) ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( HOIST-AT ?auto_19384 ?auto_19381 ) ( LIFTING ?auto_19384 ?auto_19375 ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19382 ?auto_19384 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19384 ?auto_19375 ?auto_19377 ?auto_19381 )
      ( MAKE-ON ?auto_19374 ?auto_19375 )
      ( MAKE-ON-VERIFY ?auto_19374 ?auto_19375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19385 - SURFACE
      ?auto_19386 - SURFACE
    )
    :vars
    (
      ?auto_19395 - HOIST
      ?auto_19394 - PLACE
      ?auto_19387 - PLACE
      ?auto_19389 - HOIST
      ?auto_19390 - SURFACE
      ?auto_19393 - SURFACE
      ?auto_19388 - TRUCK
      ?auto_19392 - PLACE
      ?auto_19391 - HOIST
      ?auto_19396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19395 ?auto_19394 ) ( IS-CRATE ?auto_19385 ) ( not ( = ?auto_19385 ?auto_19386 ) ) ( not ( = ?auto_19387 ?auto_19394 ) ) ( HOIST-AT ?auto_19389 ?auto_19387 ) ( not ( = ?auto_19395 ?auto_19389 ) ) ( AVAILABLE ?auto_19389 ) ( SURFACE-AT ?auto_19385 ?auto_19387 ) ( ON ?auto_19385 ?auto_19390 ) ( CLEAR ?auto_19385 ) ( not ( = ?auto_19385 ?auto_19390 ) ) ( not ( = ?auto_19386 ?auto_19390 ) ) ( SURFACE-AT ?auto_19393 ?auto_19394 ) ( CLEAR ?auto_19393 ) ( IS-CRATE ?auto_19386 ) ( not ( = ?auto_19385 ?auto_19393 ) ) ( not ( = ?auto_19386 ?auto_19393 ) ) ( not ( = ?auto_19390 ?auto_19393 ) ) ( AVAILABLE ?auto_19395 ) ( TRUCK-AT ?auto_19388 ?auto_19392 ) ( not ( = ?auto_19392 ?auto_19394 ) ) ( not ( = ?auto_19387 ?auto_19392 ) ) ( HOIST-AT ?auto_19391 ?auto_19392 ) ( not ( = ?auto_19395 ?auto_19391 ) ) ( not ( = ?auto_19389 ?auto_19391 ) ) ( AVAILABLE ?auto_19391 ) ( SURFACE-AT ?auto_19386 ?auto_19392 ) ( ON ?auto_19386 ?auto_19396 ) ( CLEAR ?auto_19386 ) ( not ( = ?auto_19385 ?auto_19396 ) ) ( not ( = ?auto_19386 ?auto_19396 ) ) ( not ( = ?auto_19390 ?auto_19396 ) ) ( not ( = ?auto_19393 ?auto_19396 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19391 ?auto_19386 ?auto_19396 ?auto_19392 )
      ( MAKE-ON ?auto_19385 ?auto_19386 )
      ( MAKE-ON-VERIFY ?auto_19385 ?auto_19386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19397 - SURFACE
      ?auto_19398 - SURFACE
    )
    :vars
    (
      ?auto_19404 - HOIST
      ?auto_19401 - PLACE
      ?auto_19400 - PLACE
      ?auto_19403 - HOIST
      ?auto_19406 - SURFACE
      ?auto_19407 - SURFACE
      ?auto_19399 - PLACE
      ?auto_19405 - HOIST
      ?auto_19408 - SURFACE
      ?auto_19402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19404 ?auto_19401 ) ( IS-CRATE ?auto_19397 ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( not ( = ?auto_19400 ?auto_19401 ) ) ( HOIST-AT ?auto_19403 ?auto_19400 ) ( not ( = ?auto_19404 ?auto_19403 ) ) ( AVAILABLE ?auto_19403 ) ( SURFACE-AT ?auto_19397 ?auto_19400 ) ( ON ?auto_19397 ?auto_19406 ) ( CLEAR ?auto_19397 ) ( not ( = ?auto_19397 ?auto_19406 ) ) ( not ( = ?auto_19398 ?auto_19406 ) ) ( SURFACE-AT ?auto_19407 ?auto_19401 ) ( CLEAR ?auto_19407 ) ( IS-CRATE ?auto_19398 ) ( not ( = ?auto_19397 ?auto_19407 ) ) ( not ( = ?auto_19398 ?auto_19407 ) ) ( not ( = ?auto_19406 ?auto_19407 ) ) ( AVAILABLE ?auto_19404 ) ( not ( = ?auto_19399 ?auto_19401 ) ) ( not ( = ?auto_19400 ?auto_19399 ) ) ( HOIST-AT ?auto_19405 ?auto_19399 ) ( not ( = ?auto_19404 ?auto_19405 ) ) ( not ( = ?auto_19403 ?auto_19405 ) ) ( AVAILABLE ?auto_19405 ) ( SURFACE-AT ?auto_19398 ?auto_19399 ) ( ON ?auto_19398 ?auto_19408 ) ( CLEAR ?auto_19398 ) ( not ( = ?auto_19397 ?auto_19408 ) ) ( not ( = ?auto_19398 ?auto_19408 ) ) ( not ( = ?auto_19406 ?auto_19408 ) ) ( not ( = ?auto_19407 ?auto_19408 ) ) ( TRUCK-AT ?auto_19402 ?auto_19401 ) )
    :subtasks
    ( ( !DRIVE ?auto_19402 ?auto_19401 ?auto_19399 )
      ( MAKE-ON ?auto_19397 ?auto_19398 )
      ( MAKE-ON-VERIFY ?auto_19397 ?auto_19398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19409 - SURFACE
      ?auto_19410 - SURFACE
    )
    :vars
    (
      ?auto_19412 - HOIST
      ?auto_19413 - PLACE
      ?auto_19411 - PLACE
      ?auto_19416 - HOIST
      ?auto_19418 - SURFACE
      ?auto_19419 - SURFACE
      ?auto_19415 - PLACE
      ?auto_19414 - HOIST
      ?auto_19420 - SURFACE
      ?auto_19417 - TRUCK
      ?auto_19421 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19412 ?auto_19413 ) ( IS-CRATE ?auto_19409 ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( HOIST-AT ?auto_19416 ?auto_19411 ) ( not ( = ?auto_19412 ?auto_19416 ) ) ( AVAILABLE ?auto_19416 ) ( SURFACE-AT ?auto_19409 ?auto_19411 ) ( ON ?auto_19409 ?auto_19418 ) ( CLEAR ?auto_19409 ) ( not ( = ?auto_19409 ?auto_19418 ) ) ( not ( = ?auto_19410 ?auto_19418 ) ) ( IS-CRATE ?auto_19410 ) ( not ( = ?auto_19409 ?auto_19419 ) ) ( not ( = ?auto_19410 ?auto_19419 ) ) ( not ( = ?auto_19418 ?auto_19419 ) ) ( not ( = ?auto_19415 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19415 ) ) ( HOIST-AT ?auto_19414 ?auto_19415 ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19416 ?auto_19414 ) ) ( AVAILABLE ?auto_19414 ) ( SURFACE-AT ?auto_19410 ?auto_19415 ) ( ON ?auto_19410 ?auto_19420 ) ( CLEAR ?auto_19410 ) ( not ( = ?auto_19409 ?auto_19420 ) ) ( not ( = ?auto_19410 ?auto_19420 ) ) ( not ( = ?auto_19418 ?auto_19420 ) ) ( not ( = ?auto_19419 ?auto_19420 ) ) ( TRUCK-AT ?auto_19417 ?auto_19413 ) ( SURFACE-AT ?auto_19421 ?auto_19413 ) ( CLEAR ?auto_19421 ) ( LIFTING ?auto_19412 ?auto_19419 ) ( IS-CRATE ?auto_19419 ) ( not ( = ?auto_19409 ?auto_19421 ) ) ( not ( = ?auto_19410 ?auto_19421 ) ) ( not ( = ?auto_19418 ?auto_19421 ) ) ( not ( = ?auto_19419 ?auto_19421 ) ) ( not ( = ?auto_19420 ?auto_19421 ) ) )
    :subtasks
    ( ( !DROP ?auto_19412 ?auto_19419 ?auto_19421 ?auto_19413 )
      ( MAKE-ON ?auto_19409 ?auto_19410 )
      ( MAKE-ON-VERIFY ?auto_19409 ?auto_19410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19422 - SURFACE
      ?auto_19423 - SURFACE
    )
    :vars
    (
      ?auto_19429 - HOIST
      ?auto_19432 - PLACE
      ?auto_19427 - PLACE
      ?auto_19431 - HOIST
      ?auto_19425 - SURFACE
      ?auto_19426 - SURFACE
      ?auto_19433 - PLACE
      ?auto_19430 - HOIST
      ?auto_19424 - SURFACE
      ?auto_19434 - TRUCK
      ?auto_19428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19429 ?auto_19432 ) ( IS-CRATE ?auto_19422 ) ( not ( = ?auto_19422 ?auto_19423 ) ) ( not ( = ?auto_19427 ?auto_19432 ) ) ( HOIST-AT ?auto_19431 ?auto_19427 ) ( not ( = ?auto_19429 ?auto_19431 ) ) ( AVAILABLE ?auto_19431 ) ( SURFACE-AT ?auto_19422 ?auto_19427 ) ( ON ?auto_19422 ?auto_19425 ) ( CLEAR ?auto_19422 ) ( not ( = ?auto_19422 ?auto_19425 ) ) ( not ( = ?auto_19423 ?auto_19425 ) ) ( IS-CRATE ?auto_19423 ) ( not ( = ?auto_19422 ?auto_19426 ) ) ( not ( = ?auto_19423 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19426 ) ) ( not ( = ?auto_19433 ?auto_19432 ) ) ( not ( = ?auto_19427 ?auto_19433 ) ) ( HOIST-AT ?auto_19430 ?auto_19433 ) ( not ( = ?auto_19429 ?auto_19430 ) ) ( not ( = ?auto_19431 ?auto_19430 ) ) ( AVAILABLE ?auto_19430 ) ( SURFACE-AT ?auto_19423 ?auto_19433 ) ( ON ?auto_19423 ?auto_19424 ) ( CLEAR ?auto_19423 ) ( not ( = ?auto_19422 ?auto_19424 ) ) ( not ( = ?auto_19423 ?auto_19424 ) ) ( not ( = ?auto_19425 ?auto_19424 ) ) ( not ( = ?auto_19426 ?auto_19424 ) ) ( TRUCK-AT ?auto_19434 ?auto_19432 ) ( SURFACE-AT ?auto_19428 ?auto_19432 ) ( CLEAR ?auto_19428 ) ( IS-CRATE ?auto_19426 ) ( not ( = ?auto_19422 ?auto_19428 ) ) ( not ( = ?auto_19423 ?auto_19428 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19426 ?auto_19428 ) ) ( not ( = ?auto_19424 ?auto_19428 ) ) ( AVAILABLE ?auto_19429 ) ( IN ?auto_19426 ?auto_19434 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19429 ?auto_19426 ?auto_19434 ?auto_19432 )
      ( MAKE-ON ?auto_19422 ?auto_19423 )
      ( MAKE-ON-VERIFY ?auto_19422 ?auto_19423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19435 - SURFACE
      ?auto_19436 - SURFACE
    )
    :vars
    (
      ?auto_19439 - HOIST
      ?auto_19443 - PLACE
      ?auto_19442 - PLACE
      ?auto_19447 - HOIST
      ?auto_19440 - SURFACE
      ?auto_19438 - SURFACE
      ?auto_19446 - PLACE
      ?auto_19445 - HOIST
      ?auto_19444 - SURFACE
      ?auto_19437 - SURFACE
      ?auto_19441 - TRUCK
      ?auto_19448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19439 ?auto_19443 ) ( IS-CRATE ?auto_19435 ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( HOIST-AT ?auto_19447 ?auto_19442 ) ( not ( = ?auto_19439 ?auto_19447 ) ) ( AVAILABLE ?auto_19447 ) ( SURFACE-AT ?auto_19435 ?auto_19442 ) ( ON ?auto_19435 ?auto_19440 ) ( CLEAR ?auto_19435 ) ( not ( = ?auto_19435 ?auto_19440 ) ) ( not ( = ?auto_19436 ?auto_19440 ) ) ( IS-CRATE ?auto_19436 ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( not ( = ?auto_19440 ?auto_19438 ) ) ( not ( = ?auto_19446 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19446 ) ) ( HOIST-AT ?auto_19445 ?auto_19446 ) ( not ( = ?auto_19439 ?auto_19445 ) ) ( not ( = ?auto_19447 ?auto_19445 ) ) ( AVAILABLE ?auto_19445 ) ( SURFACE-AT ?auto_19436 ?auto_19446 ) ( ON ?auto_19436 ?auto_19444 ) ( CLEAR ?auto_19436 ) ( not ( = ?auto_19435 ?auto_19444 ) ) ( not ( = ?auto_19436 ?auto_19444 ) ) ( not ( = ?auto_19440 ?auto_19444 ) ) ( not ( = ?auto_19438 ?auto_19444 ) ) ( SURFACE-AT ?auto_19437 ?auto_19443 ) ( CLEAR ?auto_19437 ) ( IS-CRATE ?auto_19438 ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19440 ?auto_19437 ) ) ( not ( = ?auto_19438 ?auto_19437 ) ) ( not ( = ?auto_19444 ?auto_19437 ) ) ( AVAILABLE ?auto_19439 ) ( IN ?auto_19438 ?auto_19441 ) ( TRUCK-AT ?auto_19441 ?auto_19448 ) ( not ( = ?auto_19448 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19448 ) ) ( not ( = ?auto_19446 ?auto_19448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19441 ?auto_19448 ?auto_19443 )
      ( MAKE-ON ?auto_19435 ?auto_19436 )
      ( MAKE-ON-VERIFY ?auto_19435 ?auto_19436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19449 - SURFACE
      ?auto_19450 - SURFACE
    )
    :vars
    (
      ?auto_19452 - HOIST
      ?auto_19458 - PLACE
      ?auto_19459 - PLACE
      ?auto_19455 - HOIST
      ?auto_19456 - SURFACE
      ?auto_19457 - SURFACE
      ?auto_19451 - PLACE
      ?auto_19462 - HOIST
      ?auto_19460 - SURFACE
      ?auto_19453 - SURFACE
      ?auto_19461 - TRUCK
      ?auto_19454 - PLACE
      ?auto_19463 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19452 ?auto_19458 ) ( IS-CRATE ?auto_19449 ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( not ( = ?auto_19459 ?auto_19458 ) ) ( HOIST-AT ?auto_19455 ?auto_19459 ) ( not ( = ?auto_19452 ?auto_19455 ) ) ( AVAILABLE ?auto_19455 ) ( SURFACE-AT ?auto_19449 ?auto_19459 ) ( ON ?auto_19449 ?auto_19456 ) ( CLEAR ?auto_19449 ) ( not ( = ?auto_19449 ?auto_19456 ) ) ( not ( = ?auto_19450 ?auto_19456 ) ) ( IS-CRATE ?auto_19450 ) ( not ( = ?auto_19449 ?auto_19457 ) ) ( not ( = ?auto_19450 ?auto_19457 ) ) ( not ( = ?auto_19456 ?auto_19457 ) ) ( not ( = ?auto_19451 ?auto_19458 ) ) ( not ( = ?auto_19459 ?auto_19451 ) ) ( HOIST-AT ?auto_19462 ?auto_19451 ) ( not ( = ?auto_19452 ?auto_19462 ) ) ( not ( = ?auto_19455 ?auto_19462 ) ) ( AVAILABLE ?auto_19462 ) ( SURFACE-AT ?auto_19450 ?auto_19451 ) ( ON ?auto_19450 ?auto_19460 ) ( CLEAR ?auto_19450 ) ( not ( = ?auto_19449 ?auto_19460 ) ) ( not ( = ?auto_19450 ?auto_19460 ) ) ( not ( = ?auto_19456 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( SURFACE-AT ?auto_19453 ?auto_19458 ) ( CLEAR ?auto_19453 ) ( IS-CRATE ?auto_19457 ) ( not ( = ?auto_19449 ?auto_19453 ) ) ( not ( = ?auto_19450 ?auto_19453 ) ) ( not ( = ?auto_19456 ?auto_19453 ) ) ( not ( = ?auto_19457 ?auto_19453 ) ) ( not ( = ?auto_19460 ?auto_19453 ) ) ( AVAILABLE ?auto_19452 ) ( TRUCK-AT ?auto_19461 ?auto_19454 ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19459 ?auto_19454 ) ) ( not ( = ?auto_19451 ?auto_19454 ) ) ( HOIST-AT ?auto_19463 ?auto_19454 ) ( LIFTING ?auto_19463 ?auto_19457 ) ( not ( = ?auto_19452 ?auto_19463 ) ) ( not ( = ?auto_19455 ?auto_19463 ) ) ( not ( = ?auto_19462 ?auto_19463 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19463 ?auto_19457 ?auto_19461 ?auto_19454 )
      ( MAKE-ON ?auto_19449 ?auto_19450 )
      ( MAKE-ON-VERIFY ?auto_19449 ?auto_19450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19464 - SURFACE
      ?auto_19465 - SURFACE
    )
    :vars
    (
      ?auto_19473 - HOIST
      ?auto_19468 - PLACE
      ?auto_19475 - PLACE
      ?auto_19470 - HOIST
      ?auto_19478 - SURFACE
      ?auto_19474 - SURFACE
      ?auto_19469 - PLACE
      ?auto_19467 - HOIST
      ?auto_19476 - SURFACE
      ?auto_19477 - SURFACE
      ?auto_19471 - TRUCK
      ?auto_19472 - PLACE
      ?auto_19466 - HOIST
      ?auto_19479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19473 ?auto_19468 ) ( IS-CRATE ?auto_19464 ) ( not ( = ?auto_19464 ?auto_19465 ) ) ( not ( = ?auto_19475 ?auto_19468 ) ) ( HOIST-AT ?auto_19470 ?auto_19475 ) ( not ( = ?auto_19473 ?auto_19470 ) ) ( AVAILABLE ?auto_19470 ) ( SURFACE-AT ?auto_19464 ?auto_19475 ) ( ON ?auto_19464 ?auto_19478 ) ( CLEAR ?auto_19464 ) ( not ( = ?auto_19464 ?auto_19478 ) ) ( not ( = ?auto_19465 ?auto_19478 ) ) ( IS-CRATE ?auto_19465 ) ( not ( = ?auto_19464 ?auto_19474 ) ) ( not ( = ?auto_19465 ?auto_19474 ) ) ( not ( = ?auto_19478 ?auto_19474 ) ) ( not ( = ?auto_19469 ?auto_19468 ) ) ( not ( = ?auto_19475 ?auto_19469 ) ) ( HOIST-AT ?auto_19467 ?auto_19469 ) ( not ( = ?auto_19473 ?auto_19467 ) ) ( not ( = ?auto_19470 ?auto_19467 ) ) ( AVAILABLE ?auto_19467 ) ( SURFACE-AT ?auto_19465 ?auto_19469 ) ( ON ?auto_19465 ?auto_19476 ) ( CLEAR ?auto_19465 ) ( not ( = ?auto_19464 ?auto_19476 ) ) ( not ( = ?auto_19465 ?auto_19476 ) ) ( not ( = ?auto_19478 ?auto_19476 ) ) ( not ( = ?auto_19474 ?auto_19476 ) ) ( SURFACE-AT ?auto_19477 ?auto_19468 ) ( CLEAR ?auto_19477 ) ( IS-CRATE ?auto_19474 ) ( not ( = ?auto_19464 ?auto_19477 ) ) ( not ( = ?auto_19465 ?auto_19477 ) ) ( not ( = ?auto_19478 ?auto_19477 ) ) ( not ( = ?auto_19474 ?auto_19477 ) ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( AVAILABLE ?auto_19473 ) ( TRUCK-AT ?auto_19471 ?auto_19472 ) ( not ( = ?auto_19472 ?auto_19468 ) ) ( not ( = ?auto_19475 ?auto_19472 ) ) ( not ( = ?auto_19469 ?auto_19472 ) ) ( HOIST-AT ?auto_19466 ?auto_19472 ) ( not ( = ?auto_19473 ?auto_19466 ) ) ( not ( = ?auto_19470 ?auto_19466 ) ) ( not ( = ?auto_19467 ?auto_19466 ) ) ( AVAILABLE ?auto_19466 ) ( SURFACE-AT ?auto_19474 ?auto_19472 ) ( ON ?auto_19474 ?auto_19479 ) ( CLEAR ?auto_19474 ) ( not ( = ?auto_19464 ?auto_19479 ) ) ( not ( = ?auto_19465 ?auto_19479 ) ) ( not ( = ?auto_19478 ?auto_19479 ) ) ( not ( = ?auto_19474 ?auto_19479 ) ) ( not ( = ?auto_19476 ?auto_19479 ) ) ( not ( = ?auto_19477 ?auto_19479 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19466 ?auto_19474 ?auto_19479 ?auto_19472 )
      ( MAKE-ON ?auto_19464 ?auto_19465 )
      ( MAKE-ON-VERIFY ?auto_19464 ?auto_19465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19480 - SURFACE
      ?auto_19481 - SURFACE
    )
    :vars
    (
      ?auto_19491 - HOIST
      ?auto_19492 - PLACE
      ?auto_19493 - PLACE
      ?auto_19484 - HOIST
      ?auto_19488 - SURFACE
      ?auto_19494 - SURFACE
      ?auto_19490 - PLACE
      ?auto_19487 - HOIST
      ?auto_19483 - SURFACE
      ?auto_19485 - SURFACE
      ?auto_19489 - PLACE
      ?auto_19495 - HOIST
      ?auto_19482 - SURFACE
      ?auto_19486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19491 ?auto_19492 ) ( IS-CRATE ?auto_19480 ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( not ( = ?auto_19493 ?auto_19492 ) ) ( HOIST-AT ?auto_19484 ?auto_19493 ) ( not ( = ?auto_19491 ?auto_19484 ) ) ( AVAILABLE ?auto_19484 ) ( SURFACE-AT ?auto_19480 ?auto_19493 ) ( ON ?auto_19480 ?auto_19488 ) ( CLEAR ?auto_19480 ) ( not ( = ?auto_19480 ?auto_19488 ) ) ( not ( = ?auto_19481 ?auto_19488 ) ) ( IS-CRATE ?auto_19481 ) ( not ( = ?auto_19480 ?auto_19494 ) ) ( not ( = ?auto_19481 ?auto_19494 ) ) ( not ( = ?auto_19488 ?auto_19494 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19493 ?auto_19490 ) ) ( HOIST-AT ?auto_19487 ?auto_19490 ) ( not ( = ?auto_19491 ?auto_19487 ) ) ( not ( = ?auto_19484 ?auto_19487 ) ) ( AVAILABLE ?auto_19487 ) ( SURFACE-AT ?auto_19481 ?auto_19490 ) ( ON ?auto_19481 ?auto_19483 ) ( CLEAR ?auto_19481 ) ( not ( = ?auto_19480 ?auto_19483 ) ) ( not ( = ?auto_19481 ?auto_19483 ) ) ( not ( = ?auto_19488 ?auto_19483 ) ) ( not ( = ?auto_19494 ?auto_19483 ) ) ( SURFACE-AT ?auto_19485 ?auto_19492 ) ( CLEAR ?auto_19485 ) ( IS-CRATE ?auto_19494 ) ( not ( = ?auto_19480 ?auto_19485 ) ) ( not ( = ?auto_19481 ?auto_19485 ) ) ( not ( = ?auto_19488 ?auto_19485 ) ) ( not ( = ?auto_19494 ?auto_19485 ) ) ( not ( = ?auto_19483 ?auto_19485 ) ) ( AVAILABLE ?auto_19491 ) ( not ( = ?auto_19489 ?auto_19492 ) ) ( not ( = ?auto_19493 ?auto_19489 ) ) ( not ( = ?auto_19490 ?auto_19489 ) ) ( HOIST-AT ?auto_19495 ?auto_19489 ) ( not ( = ?auto_19491 ?auto_19495 ) ) ( not ( = ?auto_19484 ?auto_19495 ) ) ( not ( = ?auto_19487 ?auto_19495 ) ) ( AVAILABLE ?auto_19495 ) ( SURFACE-AT ?auto_19494 ?auto_19489 ) ( ON ?auto_19494 ?auto_19482 ) ( CLEAR ?auto_19494 ) ( not ( = ?auto_19480 ?auto_19482 ) ) ( not ( = ?auto_19481 ?auto_19482 ) ) ( not ( = ?auto_19488 ?auto_19482 ) ) ( not ( = ?auto_19494 ?auto_19482 ) ) ( not ( = ?auto_19483 ?auto_19482 ) ) ( not ( = ?auto_19485 ?auto_19482 ) ) ( TRUCK-AT ?auto_19486 ?auto_19492 ) )
    :subtasks
    ( ( !DRIVE ?auto_19486 ?auto_19492 ?auto_19489 )
      ( MAKE-ON ?auto_19480 ?auto_19481 )
      ( MAKE-ON-VERIFY ?auto_19480 ?auto_19481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19496 - SURFACE
      ?auto_19497 - SURFACE
    )
    :vars
    (
      ?auto_19507 - HOIST
      ?auto_19509 - PLACE
      ?auto_19499 - PLACE
      ?auto_19502 - HOIST
      ?auto_19501 - SURFACE
      ?auto_19505 - SURFACE
      ?auto_19498 - PLACE
      ?auto_19508 - HOIST
      ?auto_19511 - SURFACE
      ?auto_19503 - SURFACE
      ?auto_19500 - PLACE
      ?auto_19504 - HOIST
      ?auto_19510 - SURFACE
      ?auto_19506 - TRUCK
      ?auto_19512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19507 ?auto_19509 ) ( IS-CRATE ?auto_19496 ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19499 ?auto_19509 ) ) ( HOIST-AT ?auto_19502 ?auto_19499 ) ( not ( = ?auto_19507 ?auto_19502 ) ) ( AVAILABLE ?auto_19502 ) ( SURFACE-AT ?auto_19496 ?auto_19499 ) ( ON ?auto_19496 ?auto_19501 ) ( CLEAR ?auto_19496 ) ( not ( = ?auto_19496 ?auto_19501 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) ( IS-CRATE ?auto_19497 ) ( not ( = ?auto_19496 ?auto_19505 ) ) ( not ( = ?auto_19497 ?auto_19505 ) ) ( not ( = ?auto_19501 ?auto_19505 ) ) ( not ( = ?auto_19498 ?auto_19509 ) ) ( not ( = ?auto_19499 ?auto_19498 ) ) ( HOIST-AT ?auto_19508 ?auto_19498 ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( not ( = ?auto_19502 ?auto_19508 ) ) ( AVAILABLE ?auto_19508 ) ( SURFACE-AT ?auto_19497 ?auto_19498 ) ( ON ?auto_19497 ?auto_19511 ) ( CLEAR ?auto_19497 ) ( not ( = ?auto_19496 ?auto_19511 ) ) ( not ( = ?auto_19497 ?auto_19511 ) ) ( not ( = ?auto_19501 ?auto_19511 ) ) ( not ( = ?auto_19505 ?auto_19511 ) ) ( IS-CRATE ?auto_19505 ) ( not ( = ?auto_19496 ?auto_19503 ) ) ( not ( = ?auto_19497 ?auto_19503 ) ) ( not ( = ?auto_19501 ?auto_19503 ) ) ( not ( = ?auto_19505 ?auto_19503 ) ) ( not ( = ?auto_19511 ?auto_19503 ) ) ( not ( = ?auto_19500 ?auto_19509 ) ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( HOIST-AT ?auto_19504 ?auto_19500 ) ( not ( = ?auto_19507 ?auto_19504 ) ) ( not ( = ?auto_19502 ?auto_19504 ) ) ( not ( = ?auto_19508 ?auto_19504 ) ) ( AVAILABLE ?auto_19504 ) ( SURFACE-AT ?auto_19505 ?auto_19500 ) ( ON ?auto_19505 ?auto_19510 ) ( CLEAR ?auto_19505 ) ( not ( = ?auto_19496 ?auto_19510 ) ) ( not ( = ?auto_19497 ?auto_19510 ) ) ( not ( = ?auto_19501 ?auto_19510 ) ) ( not ( = ?auto_19505 ?auto_19510 ) ) ( not ( = ?auto_19511 ?auto_19510 ) ) ( not ( = ?auto_19503 ?auto_19510 ) ) ( TRUCK-AT ?auto_19506 ?auto_19509 ) ( SURFACE-AT ?auto_19512 ?auto_19509 ) ( CLEAR ?auto_19512 ) ( LIFTING ?auto_19507 ?auto_19503 ) ( IS-CRATE ?auto_19503 ) ( not ( = ?auto_19496 ?auto_19512 ) ) ( not ( = ?auto_19497 ?auto_19512 ) ) ( not ( = ?auto_19501 ?auto_19512 ) ) ( not ( = ?auto_19505 ?auto_19512 ) ) ( not ( = ?auto_19511 ?auto_19512 ) ) ( not ( = ?auto_19503 ?auto_19512 ) ) ( not ( = ?auto_19510 ?auto_19512 ) ) )
    :subtasks
    ( ( !DROP ?auto_19507 ?auto_19503 ?auto_19512 ?auto_19509 )
      ( MAKE-ON ?auto_19496 ?auto_19497 )
      ( MAKE-ON-VERIFY ?auto_19496 ?auto_19497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19513 - SURFACE
      ?auto_19514 - SURFACE
    )
    :vars
    (
      ?auto_19520 - HOIST
      ?auto_19518 - PLACE
      ?auto_19526 - PLACE
      ?auto_19521 - HOIST
      ?auto_19527 - SURFACE
      ?auto_19523 - SURFACE
      ?auto_19519 - PLACE
      ?auto_19516 - HOIST
      ?auto_19525 - SURFACE
      ?auto_19524 - SURFACE
      ?auto_19515 - PLACE
      ?auto_19522 - HOIST
      ?auto_19528 - SURFACE
      ?auto_19517 - TRUCK
      ?auto_19529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19520 ?auto_19518 ) ( IS-CRATE ?auto_19513 ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19526 ?auto_19518 ) ) ( HOIST-AT ?auto_19521 ?auto_19526 ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( AVAILABLE ?auto_19521 ) ( SURFACE-AT ?auto_19513 ?auto_19526 ) ( ON ?auto_19513 ?auto_19527 ) ( CLEAR ?auto_19513 ) ( not ( = ?auto_19513 ?auto_19527 ) ) ( not ( = ?auto_19514 ?auto_19527 ) ) ( IS-CRATE ?auto_19514 ) ( not ( = ?auto_19513 ?auto_19523 ) ) ( not ( = ?auto_19514 ?auto_19523 ) ) ( not ( = ?auto_19527 ?auto_19523 ) ) ( not ( = ?auto_19519 ?auto_19518 ) ) ( not ( = ?auto_19526 ?auto_19519 ) ) ( HOIST-AT ?auto_19516 ?auto_19519 ) ( not ( = ?auto_19520 ?auto_19516 ) ) ( not ( = ?auto_19521 ?auto_19516 ) ) ( AVAILABLE ?auto_19516 ) ( SURFACE-AT ?auto_19514 ?auto_19519 ) ( ON ?auto_19514 ?auto_19525 ) ( CLEAR ?auto_19514 ) ( not ( = ?auto_19513 ?auto_19525 ) ) ( not ( = ?auto_19514 ?auto_19525 ) ) ( not ( = ?auto_19527 ?auto_19525 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( IS-CRATE ?auto_19523 ) ( not ( = ?auto_19513 ?auto_19524 ) ) ( not ( = ?auto_19514 ?auto_19524 ) ) ( not ( = ?auto_19527 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( not ( = ?auto_19525 ?auto_19524 ) ) ( not ( = ?auto_19515 ?auto_19518 ) ) ( not ( = ?auto_19526 ?auto_19515 ) ) ( not ( = ?auto_19519 ?auto_19515 ) ) ( HOIST-AT ?auto_19522 ?auto_19515 ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( not ( = ?auto_19516 ?auto_19522 ) ) ( AVAILABLE ?auto_19522 ) ( SURFACE-AT ?auto_19523 ?auto_19515 ) ( ON ?auto_19523 ?auto_19528 ) ( CLEAR ?auto_19523 ) ( not ( = ?auto_19513 ?auto_19528 ) ) ( not ( = ?auto_19514 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19523 ?auto_19528 ) ) ( not ( = ?auto_19525 ?auto_19528 ) ) ( not ( = ?auto_19524 ?auto_19528 ) ) ( TRUCK-AT ?auto_19517 ?auto_19518 ) ( SURFACE-AT ?auto_19529 ?auto_19518 ) ( CLEAR ?auto_19529 ) ( IS-CRATE ?auto_19524 ) ( not ( = ?auto_19513 ?auto_19529 ) ) ( not ( = ?auto_19514 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19523 ?auto_19529 ) ) ( not ( = ?auto_19525 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( AVAILABLE ?auto_19520 ) ( IN ?auto_19524 ?auto_19517 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19520 ?auto_19524 ?auto_19517 ?auto_19518 )
      ( MAKE-ON ?auto_19513 ?auto_19514 )
      ( MAKE-ON-VERIFY ?auto_19513 ?auto_19514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19530 - SURFACE
      ?auto_19531 - SURFACE
    )
    :vars
    (
      ?auto_19533 - HOIST
      ?auto_19544 - PLACE
      ?auto_19540 - PLACE
      ?auto_19545 - HOIST
      ?auto_19539 - SURFACE
      ?auto_19546 - SURFACE
      ?auto_19535 - PLACE
      ?auto_19542 - HOIST
      ?auto_19538 - SURFACE
      ?auto_19537 - SURFACE
      ?auto_19543 - PLACE
      ?auto_19532 - HOIST
      ?auto_19536 - SURFACE
      ?auto_19541 - SURFACE
      ?auto_19534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19533 ?auto_19544 ) ( IS-CRATE ?auto_19530 ) ( not ( = ?auto_19530 ?auto_19531 ) ) ( not ( = ?auto_19540 ?auto_19544 ) ) ( HOIST-AT ?auto_19545 ?auto_19540 ) ( not ( = ?auto_19533 ?auto_19545 ) ) ( AVAILABLE ?auto_19545 ) ( SURFACE-AT ?auto_19530 ?auto_19540 ) ( ON ?auto_19530 ?auto_19539 ) ( CLEAR ?auto_19530 ) ( not ( = ?auto_19530 ?auto_19539 ) ) ( not ( = ?auto_19531 ?auto_19539 ) ) ( IS-CRATE ?auto_19531 ) ( not ( = ?auto_19530 ?auto_19546 ) ) ( not ( = ?auto_19531 ?auto_19546 ) ) ( not ( = ?auto_19539 ?auto_19546 ) ) ( not ( = ?auto_19535 ?auto_19544 ) ) ( not ( = ?auto_19540 ?auto_19535 ) ) ( HOIST-AT ?auto_19542 ?auto_19535 ) ( not ( = ?auto_19533 ?auto_19542 ) ) ( not ( = ?auto_19545 ?auto_19542 ) ) ( AVAILABLE ?auto_19542 ) ( SURFACE-AT ?auto_19531 ?auto_19535 ) ( ON ?auto_19531 ?auto_19538 ) ( CLEAR ?auto_19531 ) ( not ( = ?auto_19530 ?auto_19538 ) ) ( not ( = ?auto_19531 ?auto_19538 ) ) ( not ( = ?auto_19539 ?auto_19538 ) ) ( not ( = ?auto_19546 ?auto_19538 ) ) ( IS-CRATE ?auto_19546 ) ( not ( = ?auto_19530 ?auto_19537 ) ) ( not ( = ?auto_19531 ?auto_19537 ) ) ( not ( = ?auto_19539 ?auto_19537 ) ) ( not ( = ?auto_19546 ?auto_19537 ) ) ( not ( = ?auto_19538 ?auto_19537 ) ) ( not ( = ?auto_19543 ?auto_19544 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19535 ?auto_19543 ) ) ( HOIST-AT ?auto_19532 ?auto_19543 ) ( not ( = ?auto_19533 ?auto_19532 ) ) ( not ( = ?auto_19545 ?auto_19532 ) ) ( not ( = ?auto_19542 ?auto_19532 ) ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19546 ?auto_19543 ) ( ON ?auto_19546 ?auto_19536 ) ( CLEAR ?auto_19546 ) ( not ( = ?auto_19530 ?auto_19536 ) ) ( not ( = ?auto_19531 ?auto_19536 ) ) ( not ( = ?auto_19539 ?auto_19536 ) ) ( not ( = ?auto_19546 ?auto_19536 ) ) ( not ( = ?auto_19538 ?auto_19536 ) ) ( not ( = ?auto_19537 ?auto_19536 ) ) ( SURFACE-AT ?auto_19541 ?auto_19544 ) ( CLEAR ?auto_19541 ) ( IS-CRATE ?auto_19537 ) ( not ( = ?auto_19530 ?auto_19541 ) ) ( not ( = ?auto_19531 ?auto_19541 ) ) ( not ( = ?auto_19539 ?auto_19541 ) ) ( not ( = ?auto_19546 ?auto_19541 ) ) ( not ( = ?auto_19538 ?auto_19541 ) ) ( not ( = ?auto_19537 ?auto_19541 ) ) ( not ( = ?auto_19536 ?auto_19541 ) ) ( AVAILABLE ?auto_19533 ) ( IN ?auto_19537 ?auto_19534 ) ( TRUCK-AT ?auto_19534 ?auto_19540 ) )
    :subtasks
    ( ( !DRIVE ?auto_19534 ?auto_19540 ?auto_19544 )
      ( MAKE-ON ?auto_19530 ?auto_19531 )
      ( MAKE-ON-VERIFY ?auto_19530 ?auto_19531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19547 - SURFACE
      ?auto_19548 - SURFACE
    )
    :vars
    (
      ?auto_19563 - HOIST
      ?auto_19555 - PLACE
      ?auto_19550 - PLACE
      ?auto_19558 - HOIST
      ?auto_19560 - SURFACE
      ?auto_19559 - SURFACE
      ?auto_19552 - PLACE
      ?auto_19553 - HOIST
      ?auto_19549 - SURFACE
      ?auto_19561 - SURFACE
      ?auto_19554 - PLACE
      ?auto_19557 - HOIST
      ?auto_19556 - SURFACE
      ?auto_19551 - SURFACE
      ?auto_19562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19563 ?auto_19555 ) ( IS-CRATE ?auto_19547 ) ( not ( = ?auto_19547 ?auto_19548 ) ) ( not ( = ?auto_19550 ?auto_19555 ) ) ( HOIST-AT ?auto_19558 ?auto_19550 ) ( not ( = ?auto_19563 ?auto_19558 ) ) ( SURFACE-AT ?auto_19547 ?auto_19550 ) ( ON ?auto_19547 ?auto_19560 ) ( CLEAR ?auto_19547 ) ( not ( = ?auto_19547 ?auto_19560 ) ) ( not ( = ?auto_19548 ?auto_19560 ) ) ( IS-CRATE ?auto_19548 ) ( not ( = ?auto_19547 ?auto_19559 ) ) ( not ( = ?auto_19548 ?auto_19559 ) ) ( not ( = ?auto_19560 ?auto_19559 ) ) ( not ( = ?auto_19552 ?auto_19555 ) ) ( not ( = ?auto_19550 ?auto_19552 ) ) ( HOIST-AT ?auto_19553 ?auto_19552 ) ( not ( = ?auto_19563 ?auto_19553 ) ) ( not ( = ?auto_19558 ?auto_19553 ) ) ( AVAILABLE ?auto_19553 ) ( SURFACE-AT ?auto_19548 ?auto_19552 ) ( ON ?auto_19548 ?auto_19549 ) ( CLEAR ?auto_19548 ) ( not ( = ?auto_19547 ?auto_19549 ) ) ( not ( = ?auto_19548 ?auto_19549 ) ) ( not ( = ?auto_19560 ?auto_19549 ) ) ( not ( = ?auto_19559 ?auto_19549 ) ) ( IS-CRATE ?auto_19559 ) ( not ( = ?auto_19547 ?auto_19561 ) ) ( not ( = ?auto_19548 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19559 ?auto_19561 ) ) ( not ( = ?auto_19549 ?auto_19561 ) ) ( not ( = ?auto_19554 ?auto_19555 ) ) ( not ( = ?auto_19550 ?auto_19554 ) ) ( not ( = ?auto_19552 ?auto_19554 ) ) ( HOIST-AT ?auto_19557 ?auto_19554 ) ( not ( = ?auto_19563 ?auto_19557 ) ) ( not ( = ?auto_19558 ?auto_19557 ) ) ( not ( = ?auto_19553 ?auto_19557 ) ) ( AVAILABLE ?auto_19557 ) ( SURFACE-AT ?auto_19559 ?auto_19554 ) ( ON ?auto_19559 ?auto_19556 ) ( CLEAR ?auto_19559 ) ( not ( = ?auto_19547 ?auto_19556 ) ) ( not ( = ?auto_19548 ?auto_19556 ) ) ( not ( = ?auto_19560 ?auto_19556 ) ) ( not ( = ?auto_19559 ?auto_19556 ) ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( not ( = ?auto_19561 ?auto_19556 ) ) ( SURFACE-AT ?auto_19551 ?auto_19555 ) ( CLEAR ?auto_19551 ) ( IS-CRATE ?auto_19561 ) ( not ( = ?auto_19547 ?auto_19551 ) ) ( not ( = ?auto_19548 ?auto_19551 ) ) ( not ( = ?auto_19560 ?auto_19551 ) ) ( not ( = ?auto_19559 ?auto_19551 ) ) ( not ( = ?auto_19549 ?auto_19551 ) ) ( not ( = ?auto_19561 ?auto_19551 ) ) ( not ( = ?auto_19556 ?auto_19551 ) ) ( AVAILABLE ?auto_19563 ) ( TRUCK-AT ?auto_19562 ?auto_19550 ) ( LIFTING ?auto_19558 ?auto_19561 ) )
    :subtasks
    ( ( !LOAD ?auto_19558 ?auto_19561 ?auto_19562 ?auto_19550 )
      ( MAKE-ON ?auto_19547 ?auto_19548 )
      ( MAKE-ON-VERIFY ?auto_19547 ?auto_19548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19564 - SURFACE
      ?auto_19565 - SURFACE
    )
    :vars
    (
      ?auto_19566 - HOIST
      ?auto_19577 - PLACE
      ?auto_19580 - PLACE
      ?auto_19575 - HOIST
      ?auto_19570 - SURFACE
      ?auto_19574 - SURFACE
      ?auto_19578 - PLACE
      ?auto_19569 - HOIST
      ?auto_19568 - SURFACE
      ?auto_19571 - SURFACE
      ?auto_19576 - PLACE
      ?auto_19579 - HOIST
      ?auto_19573 - SURFACE
      ?auto_19572 - SURFACE
      ?auto_19567 - TRUCK
      ?auto_19581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19566 ?auto_19577 ) ( IS-CRATE ?auto_19564 ) ( not ( = ?auto_19564 ?auto_19565 ) ) ( not ( = ?auto_19580 ?auto_19577 ) ) ( HOIST-AT ?auto_19575 ?auto_19580 ) ( not ( = ?auto_19566 ?auto_19575 ) ) ( SURFACE-AT ?auto_19564 ?auto_19580 ) ( ON ?auto_19564 ?auto_19570 ) ( CLEAR ?auto_19564 ) ( not ( = ?auto_19564 ?auto_19570 ) ) ( not ( = ?auto_19565 ?auto_19570 ) ) ( IS-CRATE ?auto_19565 ) ( not ( = ?auto_19564 ?auto_19574 ) ) ( not ( = ?auto_19565 ?auto_19574 ) ) ( not ( = ?auto_19570 ?auto_19574 ) ) ( not ( = ?auto_19578 ?auto_19577 ) ) ( not ( = ?auto_19580 ?auto_19578 ) ) ( HOIST-AT ?auto_19569 ?auto_19578 ) ( not ( = ?auto_19566 ?auto_19569 ) ) ( not ( = ?auto_19575 ?auto_19569 ) ) ( AVAILABLE ?auto_19569 ) ( SURFACE-AT ?auto_19565 ?auto_19578 ) ( ON ?auto_19565 ?auto_19568 ) ( CLEAR ?auto_19565 ) ( not ( = ?auto_19564 ?auto_19568 ) ) ( not ( = ?auto_19565 ?auto_19568 ) ) ( not ( = ?auto_19570 ?auto_19568 ) ) ( not ( = ?auto_19574 ?auto_19568 ) ) ( IS-CRATE ?auto_19574 ) ( not ( = ?auto_19564 ?auto_19571 ) ) ( not ( = ?auto_19565 ?auto_19571 ) ) ( not ( = ?auto_19570 ?auto_19571 ) ) ( not ( = ?auto_19574 ?auto_19571 ) ) ( not ( = ?auto_19568 ?auto_19571 ) ) ( not ( = ?auto_19576 ?auto_19577 ) ) ( not ( = ?auto_19580 ?auto_19576 ) ) ( not ( = ?auto_19578 ?auto_19576 ) ) ( HOIST-AT ?auto_19579 ?auto_19576 ) ( not ( = ?auto_19566 ?auto_19579 ) ) ( not ( = ?auto_19575 ?auto_19579 ) ) ( not ( = ?auto_19569 ?auto_19579 ) ) ( AVAILABLE ?auto_19579 ) ( SURFACE-AT ?auto_19574 ?auto_19576 ) ( ON ?auto_19574 ?auto_19573 ) ( CLEAR ?auto_19574 ) ( not ( = ?auto_19564 ?auto_19573 ) ) ( not ( = ?auto_19565 ?auto_19573 ) ) ( not ( = ?auto_19570 ?auto_19573 ) ) ( not ( = ?auto_19574 ?auto_19573 ) ) ( not ( = ?auto_19568 ?auto_19573 ) ) ( not ( = ?auto_19571 ?auto_19573 ) ) ( SURFACE-AT ?auto_19572 ?auto_19577 ) ( CLEAR ?auto_19572 ) ( IS-CRATE ?auto_19571 ) ( not ( = ?auto_19564 ?auto_19572 ) ) ( not ( = ?auto_19565 ?auto_19572 ) ) ( not ( = ?auto_19570 ?auto_19572 ) ) ( not ( = ?auto_19574 ?auto_19572 ) ) ( not ( = ?auto_19568 ?auto_19572 ) ) ( not ( = ?auto_19571 ?auto_19572 ) ) ( not ( = ?auto_19573 ?auto_19572 ) ) ( AVAILABLE ?auto_19566 ) ( TRUCK-AT ?auto_19567 ?auto_19580 ) ( AVAILABLE ?auto_19575 ) ( SURFACE-AT ?auto_19571 ?auto_19580 ) ( ON ?auto_19571 ?auto_19581 ) ( CLEAR ?auto_19571 ) ( not ( = ?auto_19564 ?auto_19581 ) ) ( not ( = ?auto_19565 ?auto_19581 ) ) ( not ( = ?auto_19570 ?auto_19581 ) ) ( not ( = ?auto_19574 ?auto_19581 ) ) ( not ( = ?auto_19568 ?auto_19581 ) ) ( not ( = ?auto_19571 ?auto_19581 ) ) ( not ( = ?auto_19573 ?auto_19581 ) ) ( not ( = ?auto_19572 ?auto_19581 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19575 ?auto_19571 ?auto_19581 ?auto_19580 )
      ( MAKE-ON ?auto_19564 ?auto_19565 )
      ( MAKE-ON-VERIFY ?auto_19564 ?auto_19565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19582 - SURFACE
      ?auto_19583 - SURFACE
    )
    :vars
    (
      ?auto_19599 - HOIST
      ?auto_19584 - PLACE
      ?auto_19585 - PLACE
      ?auto_19598 - HOIST
      ?auto_19594 - SURFACE
      ?auto_19586 - SURFACE
      ?auto_19589 - PLACE
      ?auto_19593 - HOIST
      ?auto_19597 - SURFACE
      ?auto_19595 - SURFACE
      ?auto_19591 - PLACE
      ?auto_19587 - HOIST
      ?auto_19596 - SURFACE
      ?auto_19590 - SURFACE
      ?auto_19588 - SURFACE
      ?auto_19592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19599 ?auto_19584 ) ( IS-CRATE ?auto_19582 ) ( not ( = ?auto_19582 ?auto_19583 ) ) ( not ( = ?auto_19585 ?auto_19584 ) ) ( HOIST-AT ?auto_19598 ?auto_19585 ) ( not ( = ?auto_19599 ?auto_19598 ) ) ( SURFACE-AT ?auto_19582 ?auto_19585 ) ( ON ?auto_19582 ?auto_19594 ) ( CLEAR ?auto_19582 ) ( not ( = ?auto_19582 ?auto_19594 ) ) ( not ( = ?auto_19583 ?auto_19594 ) ) ( IS-CRATE ?auto_19583 ) ( not ( = ?auto_19582 ?auto_19586 ) ) ( not ( = ?auto_19583 ?auto_19586 ) ) ( not ( = ?auto_19594 ?auto_19586 ) ) ( not ( = ?auto_19589 ?auto_19584 ) ) ( not ( = ?auto_19585 ?auto_19589 ) ) ( HOIST-AT ?auto_19593 ?auto_19589 ) ( not ( = ?auto_19599 ?auto_19593 ) ) ( not ( = ?auto_19598 ?auto_19593 ) ) ( AVAILABLE ?auto_19593 ) ( SURFACE-AT ?auto_19583 ?auto_19589 ) ( ON ?auto_19583 ?auto_19597 ) ( CLEAR ?auto_19583 ) ( not ( = ?auto_19582 ?auto_19597 ) ) ( not ( = ?auto_19583 ?auto_19597 ) ) ( not ( = ?auto_19594 ?auto_19597 ) ) ( not ( = ?auto_19586 ?auto_19597 ) ) ( IS-CRATE ?auto_19586 ) ( not ( = ?auto_19582 ?auto_19595 ) ) ( not ( = ?auto_19583 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19586 ?auto_19595 ) ) ( not ( = ?auto_19597 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19584 ) ) ( not ( = ?auto_19585 ?auto_19591 ) ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( HOIST-AT ?auto_19587 ?auto_19591 ) ( not ( = ?auto_19599 ?auto_19587 ) ) ( not ( = ?auto_19598 ?auto_19587 ) ) ( not ( = ?auto_19593 ?auto_19587 ) ) ( AVAILABLE ?auto_19587 ) ( SURFACE-AT ?auto_19586 ?auto_19591 ) ( ON ?auto_19586 ?auto_19596 ) ( CLEAR ?auto_19586 ) ( not ( = ?auto_19582 ?auto_19596 ) ) ( not ( = ?auto_19583 ?auto_19596 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19586 ?auto_19596 ) ) ( not ( = ?auto_19597 ?auto_19596 ) ) ( not ( = ?auto_19595 ?auto_19596 ) ) ( SURFACE-AT ?auto_19590 ?auto_19584 ) ( CLEAR ?auto_19590 ) ( IS-CRATE ?auto_19595 ) ( not ( = ?auto_19582 ?auto_19590 ) ) ( not ( = ?auto_19583 ?auto_19590 ) ) ( not ( = ?auto_19594 ?auto_19590 ) ) ( not ( = ?auto_19586 ?auto_19590 ) ) ( not ( = ?auto_19597 ?auto_19590 ) ) ( not ( = ?auto_19595 ?auto_19590 ) ) ( not ( = ?auto_19596 ?auto_19590 ) ) ( AVAILABLE ?auto_19599 ) ( AVAILABLE ?auto_19598 ) ( SURFACE-AT ?auto_19595 ?auto_19585 ) ( ON ?auto_19595 ?auto_19588 ) ( CLEAR ?auto_19595 ) ( not ( = ?auto_19582 ?auto_19588 ) ) ( not ( = ?auto_19583 ?auto_19588 ) ) ( not ( = ?auto_19594 ?auto_19588 ) ) ( not ( = ?auto_19586 ?auto_19588 ) ) ( not ( = ?auto_19597 ?auto_19588 ) ) ( not ( = ?auto_19595 ?auto_19588 ) ) ( not ( = ?auto_19596 ?auto_19588 ) ) ( not ( = ?auto_19590 ?auto_19588 ) ) ( TRUCK-AT ?auto_19592 ?auto_19584 ) )
    :subtasks
    ( ( !DRIVE ?auto_19592 ?auto_19584 ?auto_19585 )
      ( MAKE-ON ?auto_19582 ?auto_19583 )
      ( MAKE-ON-VERIFY ?auto_19582 ?auto_19583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19600 - SURFACE
      ?auto_19601 - SURFACE
    )
    :vars
    (
      ?auto_19607 - HOIST
      ?auto_19616 - PLACE
      ?auto_19603 - PLACE
      ?auto_19605 - HOIST
      ?auto_19602 - SURFACE
      ?auto_19609 - SURFACE
      ?auto_19617 - PLACE
      ?auto_19606 - HOIST
      ?auto_19608 - SURFACE
      ?auto_19610 - SURFACE
      ?auto_19611 - PLACE
      ?auto_19604 - HOIST
      ?auto_19612 - SURFACE
      ?auto_19613 - SURFACE
      ?auto_19615 - SURFACE
      ?auto_19614 - TRUCK
      ?auto_19618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19607 ?auto_19616 ) ( IS-CRATE ?auto_19600 ) ( not ( = ?auto_19600 ?auto_19601 ) ) ( not ( = ?auto_19603 ?auto_19616 ) ) ( HOIST-AT ?auto_19605 ?auto_19603 ) ( not ( = ?auto_19607 ?auto_19605 ) ) ( SURFACE-AT ?auto_19600 ?auto_19603 ) ( ON ?auto_19600 ?auto_19602 ) ( CLEAR ?auto_19600 ) ( not ( = ?auto_19600 ?auto_19602 ) ) ( not ( = ?auto_19601 ?auto_19602 ) ) ( IS-CRATE ?auto_19601 ) ( not ( = ?auto_19600 ?auto_19609 ) ) ( not ( = ?auto_19601 ?auto_19609 ) ) ( not ( = ?auto_19602 ?auto_19609 ) ) ( not ( = ?auto_19617 ?auto_19616 ) ) ( not ( = ?auto_19603 ?auto_19617 ) ) ( HOIST-AT ?auto_19606 ?auto_19617 ) ( not ( = ?auto_19607 ?auto_19606 ) ) ( not ( = ?auto_19605 ?auto_19606 ) ) ( AVAILABLE ?auto_19606 ) ( SURFACE-AT ?auto_19601 ?auto_19617 ) ( ON ?auto_19601 ?auto_19608 ) ( CLEAR ?auto_19601 ) ( not ( = ?auto_19600 ?auto_19608 ) ) ( not ( = ?auto_19601 ?auto_19608 ) ) ( not ( = ?auto_19602 ?auto_19608 ) ) ( not ( = ?auto_19609 ?auto_19608 ) ) ( IS-CRATE ?auto_19609 ) ( not ( = ?auto_19600 ?auto_19610 ) ) ( not ( = ?auto_19601 ?auto_19610 ) ) ( not ( = ?auto_19602 ?auto_19610 ) ) ( not ( = ?auto_19609 ?auto_19610 ) ) ( not ( = ?auto_19608 ?auto_19610 ) ) ( not ( = ?auto_19611 ?auto_19616 ) ) ( not ( = ?auto_19603 ?auto_19611 ) ) ( not ( = ?auto_19617 ?auto_19611 ) ) ( HOIST-AT ?auto_19604 ?auto_19611 ) ( not ( = ?auto_19607 ?auto_19604 ) ) ( not ( = ?auto_19605 ?auto_19604 ) ) ( not ( = ?auto_19606 ?auto_19604 ) ) ( AVAILABLE ?auto_19604 ) ( SURFACE-AT ?auto_19609 ?auto_19611 ) ( ON ?auto_19609 ?auto_19612 ) ( CLEAR ?auto_19609 ) ( not ( = ?auto_19600 ?auto_19612 ) ) ( not ( = ?auto_19601 ?auto_19612 ) ) ( not ( = ?auto_19602 ?auto_19612 ) ) ( not ( = ?auto_19609 ?auto_19612 ) ) ( not ( = ?auto_19608 ?auto_19612 ) ) ( not ( = ?auto_19610 ?auto_19612 ) ) ( IS-CRATE ?auto_19610 ) ( not ( = ?auto_19600 ?auto_19613 ) ) ( not ( = ?auto_19601 ?auto_19613 ) ) ( not ( = ?auto_19602 ?auto_19613 ) ) ( not ( = ?auto_19609 ?auto_19613 ) ) ( not ( = ?auto_19608 ?auto_19613 ) ) ( not ( = ?auto_19610 ?auto_19613 ) ) ( not ( = ?auto_19612 ?auto_19613 ) ) ( AVAILABLE ?auto_19605 ) ( SURFACE-AT ?auto_19610 ?auto_19603 ) ( ON ?auto_19610 ?auto_19615 ) ( CLEAR ?auto_19610 ) ( not ( = ?auto_19600 ?auto_19615 ) ) ( not ( = ?auto_19601 ?auto_19615 ) ) ( not ( = ?auto_19602 ?auto_19615 ) ) ( not ( = ?auto_19609 ?auto_19615 ) ) ( not ( = ?auto_19608 ?auto_19615 ) ) ( not ( = ?auto_19610 ?auto_19615 ) ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( TRUCK-AT ?auto_19614 ?auto_19616 ) ( SURFACE-AT ?auto_19618 ?auto_19616 ) ( CLEAR ?auto_19618 ) ( LIFTING ?auto_19607 ?auto_19613 ) ( IS-CRATE ?auto_19613 ) ( not ( = ?auto_19600 ?auto_19618 ) ) ( not ( = ?auto_19601 ?auto_19618 ) ) ( not ( = ?auto_19602 ?auto_19618 ) ) ( not ( = ?auto_19609 ?auto_19618 ) ) ( not ( = ?auto_19608 ?auto_19618 ) ) ( not ( = ?auto_19610 ?auto_19618 ) ) ( not ( = ?auto_19612 ?auto_19618 ) ) ( not ( = ?auto_19613 ?auto_19618 ) ) ( not ( = ?auto_19615 ?auto_19618 ) ) )
    :subtasks
    ( ( !DROP ?auto_19607 ?auto_19613 ?auto_19618 ?auto_19616 )
      ( MAKE-ON ?auto_19600 ?auto_19601 )
      ( MAKE-ON-VERIFY ?auto_19600 ?auto_19601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19619 - SURFACE
      ?auto_19620 - SURFACE
    )
    :vars
    (
      ?auto_19637 - HOIST
      ?auto_19631 - PLACE
      ?auto_19627 - PLACE
      ?auto_19623 - HOIST
      ?auto_19635 - SURFACE
      ?auto_19622 - SURFACE
      ?auto_19625 - PLACE
      ?auto_19636 - HOIST
      ?auto_19626 - SURFACE
      ?auto_19634 - SURFACE
      ?auto_19630 - PLACE
      ?auto_19624 - HOIST
      ?auto_19628 - SURFACE
      ?auto_19621 - SURFACE
      ?auto_19629 - SURFACE
      ?auto_19632 - TRUCK
      ?auto_19633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19637 ?auto_19631 ) ( IS-CRATE ?auto_19619 ) ( not ( = ?auto_19619 ?auto_19620 ) ) ( not ( = ?auto_19627 ?auto_19631 ) ) ( HOIST-AT ?auto_19623 ?auto_19627 ) ( not ( = ?auto_19637 ?auto_19623 ) ) ( SURFACE-AT ?auto_19619 ?auto_19627 ) ( ON ?auto_19619 ?auto_19635 ) ( CLEAR ?auto_19619 ) ( not ( = ?auto_19619 ?auto_19635 ) ) ( not ( = ?auto_19620 ?auto_19635 ) ) ( IS-CRATE ?auto_19620 ) ( not ( = ?auto_19619 ?auto_19622 ) ) ( not ( = ?auto_19620 ?auto_19622 ) ) ( not ( = ?auto_19635 ?auto_19622 ) ) ( not ( = ?auto_19625 ?auto_19631 ) ) ( not ( = ?auto_19627 ?auto_19625 ) ) ( HOIST-AT ?auto_19636 ?auto_19625 ) ( not ( = ?auto_19637 ?auto_19636 ) ) ( not ( = ?auto_19623 ?auto_19636 ) ) ( AVAILABLE ?auto_19636 ) ( SURFACE-AT ?auto_19620 ?auto_19625 ) ( ON ?auto_19620 ?auto_19626 ) ( CLEAR ?auto_19620 ) ( not ( = ?auto_19619 ?auto_19626 ) ) ( not ( = ?auto_19620 ?auto_19626 ) ) ( not ( = ?auto_19635 ?auto_19626 ) ) ( not ( = ?auto_19622 ?auto_19626 ) ) ( IS-CRATE ?auto_19622 ) ( not ( = ?auto_19619 ?auto_19634 ) ) ( not ( = ?auto_19620 ?auto_19634 ) ) ( not ( = ?auto_19635 ?auto_19634 ) ) ( not ( = ?auto_19622 ?auto_19634 ) ) ( not ( = ?auto_19626 ?auto_19634 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19627 ?auto_19630 ) ) ( not ( = ?auto_19625 ?auto_19630 ) ) ( HOIST-AT ?auto_19624 ?auto_19630 ) ( not ( = ?auto_19637 ?auto_19624 ) ) ( not ( = ?auto_19623 ?auto_19624 ) ) ( not ( = ?auto_19636 ?auto_19624 ) ) ( AVAILABLE ?auto_19624 ) ( SURFACE-AT ?auto_19622 ?auto_19630 ) ( ON ?auto_19622 ?auto_19628 ) ( CLEAR ?auto_19622 ) ( not ( = ?auto_19619 ?auto_19628 ) ) ( not ( = ?auto_19620 ?auto_19628 ) ) ( not ( = ?auto_19635 ?auto_19628 ) ) ( not ( = ?auto_19622 ?auto_19628 ) ) ( not ( = ?auto_19626 ?auto_19628 ) ) ( not ( = ?auto_19634 ?auto_19628 ) ) ( IS-CRATE ?auto_19634 ) ( not ( = ?auto_19619 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19635 ?auto_19621 ) ) ( not ( = ?auto_19622 ?auto_19621 ) ) ( not ( = ?auto_19626 ?auto_19621 ) ) ( not ( = ?auto_19634 ?auto_19621 ) ) ( not ( = ?auto_19628 ?auto_19621 ) ) ( AVAILABLE ?auto_19623 ) ( SURFACE-AT ?auto_19634 ?auto_19627 ) ( ON ?auto_19634 ?auto_19629 ) ( CLEAR ?auto_19634 ) ( not ( = ?auto_19619 ?auto_19629 ) ) ( not ( = ?auto_19620 ?auto_19629 ) ) ( not ( = ?auto_19635 ?auto_19629 ) ) ( not ( = ?auto_19622 ?auto_19629 ) ) ( not ( = ?auto_19626 ?auto_19629 ) ) ( not ( = ?auto_19634 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19621 ?auto_19629 ) ) ( TRUCK-AT ?auto_19632 ?auto_19631 ) ( SURFACE-AT ?auto_19633 ?auto_19631 ) ( CLEAR ?auto_19633 ) ( IS-CRATE ?auto_19621 ) ( not ( = ?auto_19619 ?auto_19633 ) ) ( not ( = ?auto_19620 ?auto_19633 ) ) ( not ( = ?auto_19635 ?auto_19633 ) ) ( not ( = ?auto_19622 ?auto_19633 ) ) ( not ( = ?auto_19626 ?auto_19633 ) ) ( not ( = ?auto_19634 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19621 ?auto_19633 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( AVAILABLE ?auto_19637 ) ( IN ?auto_19621 ?auto_19632 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19637 ?auto_19621 ?auto_19632 ?auto_19631 )
      ( MAKE-ON ?auto_19619 ?auto_19620 )
      ( MAKE-ON-VERIFY ?auto_19619 ?auto_19620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19638 - SURFACE
      ?auto_19639 - SURFACE
    )
    :vars
    (
      ?auto_19655 - HOIST
      ?auto_19640 - PLACE
      ?auto_19656 - PLACE
      ?auto_19651 - HOIST
      ?auto_19654 - SURFACE
      ?auto_19647 - SURFACE
      ?auto_19649 - PLACE
      ?auto_19642 - HOIST
      ?auto_19650 - SURFACE
      ?auto_19648 - SURFACE
      ?auto_19644 - PLACE
      ?auto_19645 - HOIST
      ?auto_19641 - SURFACE
      ?auto_19653 - SURFACE
      ?auto_19646 - SURFACE
      ?auto_19643 - SURFACE
      ?auto_19652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19655 ?auto_19640 ) ( IS-CRATE ?auto_19638 ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( not ( = ?auto_19656 ?auto_19640 ) ) ( HOIST-AT ?auto_19651 ?auto_19656 ) ( not ( = ?auto_19655 ?auto_19651 ) ) ( SURFACE-AT ?auto_19638 ?auto_19656 ) ( ON ?auto_19638 ?auto_19654 ) ( CLEAR ?auto_19638 ) ( not ( = ?auto_19638 ?auto_19654 ) ) ( not ( = ?auto_19639 ?auto_19654 ) ) ( IS-CRATE ?auto_19639 ) ( not ( = ?auto_19638 ?auto_19647 ) ) ( not ( = ?auto_19639 ?auto_19647 ) ) ( not ( = ?auto_19654 ?auto_19647 ) ) ( not ( = ?auto_19649 ?auto_19640 ) ) ( not ( = ?auto_19656 ?auto_19649 ) ) ( HOIST-AT ?auto_19642 ?auto_19649 ) ( not ( = ?auto_19655 ?auto_19642 ) ) ( not ( = ?auto_19651 ?auto_19642 ) ) ( AVAILABLE ?auto_19642 ) ( SURFACE-AT ?auto_19639 ?auto_19649 ) ( ON ?auto_19639 ?auto_19650 ) ( CLEAR ?auto_19639 ) ( not ( = ?auto_19638 ?auto_19650 ) ) ( not ( = ?auto_19639 ?auto_19650 ) ) ( not ( = ?auto_19654 ?auto_19650 ) ) ( not ( = ?auto_19647 ?auto_19650 ) ) ( IS-CRATE ?auto_19647 ) ( not ( = ?auto_19638 ?auto_19648 ) ) ( not ( = ?auto_19639 ?auto_19648 ) ) ( not ( = ?auto_19654 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19650 ?auto_19648 ) ) ( not ( = ?auto_19644 ?auto_19640 ) ) ( not ( = ?auto_19656 ?auto_19644 ) ) ( not ( = ?auto_19649 ?auto_19644 ) ) ( HOIST-AT ?auto_19645 ?auto_19644 ) ( not ( = ?auto_19655 ?auto_19645 ) ) ( not ( = ?auto_19651 ?auto_19645 ) ) ( not ( = ?auto_19642 ?auto_19645 ) ) ( AVAILABLE ?auto_19645 ) ( SURFACE-AT ?auto_19647 ?auto_19644 ) ( ON ?auto_19647 ?auto_19641 ) ( CLEAR ?auto_19647 ) ( not ( = ?auto_19638 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( not ( = ?auto_19654 ?auto_19641 ) ) ( not ( = ?auto_19647 ?auto_19641 ) ) ( not ( = ?auto_19650 ?auto_19641 ) ) ( not ( = ?auto_19648 ?auto_19641 ) ) ( IS-CRATE ?auto_19648 ) ( not ( = ?auto_19638 ?auto_19653 ) ) ( not ( = ?auto_19639 ?auto_19653 ) ) ( not ( = ?auto_19654 ?auto_19653 ) ) ( not ( = ?auto_19647 ?auto_19653 ) ) ( not ( = ?auto_19650 ?auto_19653 ) ) ( not ( = ?auto_19648 ?auto_19653 ) ) ( not ( = ?auto_19641 ?auto_19653 ) ) ( AVAILABLE ?auto_19651 ) ( SURFACE-AT ?auto_19648 ?auto_19656 ) ( ON ?auto_19648 ?auto_19646 ) ( CLEAR ?auto_19648 ) ( not ( = ?auto_19638 ?auto_19646 ) ) ( not ( = ?auto_19639 ?auto_19646 ) ) ( not ( = ?auto_19654 ?auto_19646 ) ) ( not ( = ?auto_19647 ?auto_19646 ) ) ( not ( = ?auto_19650 ?auto_19646 ) ) ( not ( = ?auto_19648 ?auto_19646 ) ) ( not ( = ?auto_19641 ?auto_19646 ) ) ( not ( = ?auto_19653 ?auto_19646 ) ) ( SURFACE-AT ?auto_19643 ?auto_19640 ) ( CLEAR ?auto_19643 ) ( IS-CRATE ?auto_19653 ) ( not ( = ?auto_19638 ?auto_19643 ) ) ( not ( = ?auto_19639 ?auto_19643 ) ) ( not ( = ?auto_19654 ?auto_19643 ) ) ( not ( = ?auto_19647 ?auto_19643 ) ) ( not ( = ?auto_19650 ?auto_19643 ) ) ( not ( = ?auto_19648 ?auto_19643 ) ) ( not ( = ?auto_19641 ?auto_19643 ) ) ( not ( = ?auto_19653 ?auto_19643 ) ) ( not ( = ?auto_19646 ?auto_19643 ) ) ( AVAILABLE ?auto_19655 ) ( IN ?auto_19653 ?auto_19652 ) ( TRUCK-AT ?auto_19652 ?auto_19649 ) )
    :subtasks
    ( ( !DRIVE ?auto_19652 ?auto_19649 ?auto_19640 )
      ( MAKE-ON ?auto_19638 ?auto_19639 )
      ( MAKE-ON-VERIFY ?auto_19638 ?auto_19639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19657 - SURFACE
      ?auto_19658 - SURFACE
    )
    :vars
    (
      ?auto_19667 - HOIST
      ?auto_19663 - PLACE
      ?auto_19671 - PLACE
      ?auto_19659 - HOIST
      ?auto_19664 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19660 - PLACE
      ?auto_19670 - HOIST
      ?auto_19673 - SURFACE
      ?auto_19668 - SURFACE
      ?auto_19662 - PLACE
      ?auto_19672 - HOIST
      ?auto_19674 - SURFACE
      ?auto_19669 - SURFACE
      ?auto_19666 - SURFACE
      ?auto_19661 - SURFACE
      ?auto_19665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19667 ?auto_19663 ) ( IS-CRATE ?auto_19657 ) ( not ( = ?auto_19657 ?auto_19658 ) ) ( not ( = ?auto_19671 ?auto_19663 ) ) ( HOIST-AT ?auto_19659 ?auto_19671 ) ( not ( = ?auto_19667 ?auto_19659 ) ) ( SURFACE-AT ?auto_19657 ?auto_19671 ) ( ON ?auto_19657 ?auto_19664 ) ( CLEAR ?auto_19657 ) ( not ( = ?auto_19657 ?auto_19664 ) ) ( not ( = ?auto_19658 ?auto_19664 ) ) ( IS-CRATE ?auto_19658 ) ( not ( = ?auto_19657 ?auto_19675 ) ) ( not ( = ?auto_19658 ?auto_19675 ) ) ( not ( = ?auto_19664 ?auto_19675 ) ) ( not ( = ?auto_19660 ?auto_19663 ) ) ( not ( = ?auto_19671 ?auto_19660 ) ) ( HOIST-AT ?auto_19670 ?auto_19660 ) ( not ( = ?auto_19667 ?auto_19670 ) ) ( not ( = ?auto_19659 ?auto_19670 ) ) ( SURFACE-AT ?auto_19658 ?auto_19660 ) ( ON ?auto_19658 ?auto_19673 ) ( CLEAR ?auto_19658 ) ( not ( = ?auto_19657 ?auto_19673 ) ) ( not ( = ?auto_19658 ?auto_19673 ) ) ( not ( = ?auto_19664 ?auto_19673 ) ) ( not ( = ?auto_19675 ?auto_19673 ) ) ( IS-CRATE ?auto_19675 ) ( not ( = ?auto_19657 ?auto_19668 ) ) ( not ( = ?auto_19658 ?auto_19668 ) ) ( not ( = ?auto_19664 ?auto_19668 ) ) ( not ( = ?auto_19675 ?auto_19668 ) ) ( not ( = ?auto_19673 ?auto_19668 ) ) ( not ( = ?auto_19662 ?auto_19663 ) ) ( not ( = ?auto_19671 ?auto_19662 ) ) ( not ( = ?auto_19660 ?auto_19662 ) ) ( HOIST-AT ?auto_19672 ?auto_19662 ) ( not ( = ?auto_19667 ?auto_19672 ) ) ( not ( = ?auto_19659 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19672 ) ) ( AVAILABLE ?auto_19672 ) ( SURFACE-AT ?auto_19675 ?auto_19662 ) ( ON ?auto_19675 ?auto_19674 ) ( CLEAR ?auto_19675 ) ( not ( = ?auto_19657 ?auto_19674 ) ) ( not ( = ?auto_19658 ?auto_19674 ) ) ( not ( = ?auto_19664 ?auto_19674 ) ) ( not ( = ?auto_19675 ?auto_19674 ) ) ( not ( = ?auto_19673 ?auto_19674 ) ) ( not ( = ?auto_19668 ?auto_19674 ) ) ( IS-CRATE ?auto_19668 ) ( not ( = ?auto_19657 ?auto_19669 ) ) ( not ( = ?auto_19658 ?auto_19669 ) ) ( not ( = ?auto_19664 ?auto_19669 ) ) ( not ( = ?auto_19675 ?auto_19669 ) ) ( not ( = ?auto_19673 ?auto_19669 ) ) ( not ( = ?auto_19668 ?auto_19669 ) ) ( not ( = ?auto_19674 ?auto_19669 ) ) ( AVAILABLE ?auto_19659 ) ( SURFACE-AT ?auto_19668 ?auto_19671 ) ( ON ?auto_19668 ?auto_19666 ) ( CLEAR ?auto_19668 ) ( not ( = ?auto_19657 ?auto_19666 ) ) ( not ( = ?auto_19658 ?auto_19666 ) ) ( not ( = ?auto_19664 ?auto_19666 ) ) ( not ( = ?auto_19675 ?auto_19666 ) ) ( not ( = ?auto_19673 ?auto_19666 ) ) ( not ( = ?auto_19668 ?auto_19666 ) ) ( not ( = ?auto_19674 ?auto_19666 ) ) ( not ( = ?auto_19669 ?auto_19666 ) ) ( SURFACE-AT ?auto_19661 ?auto_19663 ) ( CLEAR ?auto_19661 ) ( IS-CRATE ?auto_19669 ) ( not ( = ?auto_19657 ?auto_19661 ) ) ( not ( = ?auto_19658 ?auto_19661 ) ) ( not ( = ?auto_19664 ?auto_19661 ) ) ( not ( = ?auto_19675 ?auto_19661 ) ) ( not ( = ?auto_19673 ?auto_19661 ) ) ( not ( = ?auto_19668 ?auto_19661 ) ) ( not ( = ?auto_19674 ?auto_19661 ) ) ( not ( = ?auto_19669 ?auto_19661 ) ) ( not ( = ?auto_19666 ?auto_19661 ) ) ( AVAILABLE ?auto_19667 ) ( TRUCK-AT ?auto_19665 ?auto_19660 ) ( LIFTING ?auto_19670 ?auto_19669 ) )
    :subtasks
    ( ( !LOAD ?auto_19670 ?auto_19669 ?auto_19665 ?auto_19660 )
      ( MAKE-ON ?auto_19657 ?auto_19658 )
      ( MAKE-ON-VERIFY ?auto_19657 ?auto_19658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19676 - SURFACE
      ?auto_19677 - SURFACE
    )
    :vars
    (
      ?auto_19692 - HOIST
      ?auto_19686 - PLACE
      ?auto_19681 - PLACE
      ?auto_19687 - HOIST
      ?auto_19679 - SURFACE
      ?auto_19689 - SURFACE
      ?auto_19684 - PLACE
      ?auto_19685 - HOIST
      ?auto_19693 - SURFACE
      ?auto_19682 - SURFACE
      ?auto_19690 - PLACE
      ?auto_19678 - HOIST
      ?auto_19680 - SURFACE
      ?auto_19688 - SURFACE
      ?auto_19683 - SURFACE
      ?auto_19694 - SURFACE
      ?auto_19691 - TRUCK
      ?auto_19695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19692 ?auto_19686 ) ( IS-CRATE ?auto_19676 ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19681 ?auto_19686 ) ) ( HOIST-AT ?auto_19687 ?auto_19681 ) ( not ( = ?auto_19692 ?auto_19687 ) ) ( SURFACE-AT ?auto_19676 ?auto_19681 ) ( ON ?auto_19676 ?auto_19679 ) ( CLEAR ?auto_19676 ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( IS-CRATE ?auto_19677 ) ( not ( = ?auto_19676 ?auto_19689 ) ) ( not ( = ?auto_19677 ?auto_19689 ) ) ( not ( = ?auto_19679 ?auto_19689 ) ) ( not ( = ?auto_19684 ?auto_19686 ) ) ( not ( = ?auto_19681 ?auto_19684 ) ) ( HOIST-AT ?auto_19685 ?auto_19684 ) ( not ( = ?auto_19692 ?auto_19685 ) ) ( not ( = ?auto_19687 ?auto_19685 ) ) ( SURFACE-AT ?auto_19677 ?auto_19684 ) ( ON ?auto_19677 ?auto_19693 ) ( CLEAR ?auto_19677 ) ( not ( = ?auto_19676 ?auto_19693 ) ) ( not ( = ?auto_19677 ?auto_19693 ) ) ( not ( = ?auto_19679 ?auto_19693 ) ) ( not ( = ?auto_19689 ?auto_19693 ) ) ( IS-CRATE ?auto_19689 ) ( not ( = ?auto_19676 ?auto_19682 ) ) ( not ( = ?auto_19677 ?auto_19682 ) ) ( not ( = ?auto_19679 ?auto_19682 ) ) ( not ( = ?auto_19689 ?auto_19682 ) ) ( not ( = ?auto_19693 ?auto_19682 ) ) ( not ( = ?auto_19690 ?auto_19686 ) ) ( not ( = ?auto_19681 ?auto_19690 ) ) ( not ( = ?auto_19684 ?auto_19690 ) ) ( HOIST-AT ?auto_19678 ?auto_19690 ) ( not ( = ?auto_19692 ?auto_19678 ) ) ( not ( = ?auto_19687 ?auto_19678 ) ) ( not ( = ?auto_19685 ?auto_19678 ) ) ( AVAILABLE ?auto_19678 ) ( SURFACE-AT ?auto_19689 ?auto_19690 ) ( ON ?auto_19689 ?auto_19680 ) ( CLEAR ?auto_19689 ) ( not ( = ?auto_19676 ?auto_19680 ) ) ( not ( = ?auto_19677 ?auto_19680 ) ) ( not ( = ?auto_19679 ?auto_19680 ) ) ( not ( = ?auto_19689 ?auto_19680 ) ) ( not ( = ?auto_19693 ?auto_19680 ) ) ( not ( = ?auto_19682 ?auto_19680 ) ) ( IS-CRATE ?auto_19682 ) ( not ( = ?auto_19676 ?auto_19688 ) ) ( not ( = ?auto_19677 ?auto_19688 ) ) ( not ( = ?auto_19679 ?auto_19688 ) ) ( not ( = ?auto_19689 ?auto_19688 ) ) ( not ( = ?auto_19693 ?auto_19688 ) ) ( not ( = ?auto_19682 ?auto_19688 ) ) ( not ( = ?auto_19680 ?auto_19688 ) ) ( AVAILABLE ?auto_19687 ) ( SURFACE-AT ?auto_19682 ?auto_19681 ) ( ON ?auto_19682 ?auto_19683 ) ( CLEAR ?auto_19682 ) ( not ( = ?auto_19676 ?auto_19683 ) ) ( not ( = ?auto_19677 ?auto_19683 ) ) ( not ( = ?auto_19679 ?auto_19683 ) ) ( not ( = ?auto_19689 ?auto_19683 ) ) ( not ( = ?auto_19693 ?auto_19683 ) ) ( not ( = ?auto_19682 ?auto_19683 ) ) ( not ( = ?auto_19680 ?auto_19683 ) ) ( not ( = ?auto_19688 ?auto_19683 ) ) ( SURFACE-AT ?auto_19694 ?auto_19686 ) ( CLEAR ?auto_19694 ) ( IS-CRATE ?auto_19688 ) ( not ( = ?auto_19676 ?auto_19694 ) ) ( not ( = ?auto_19677 ?auto_19694 ) ) ( not ( = ?auto_19679 ?auto_19694 ) ) ( not ( = ?auto_19689 ?auto_19694 ) ) ( not ( = ?auto_19693 ?auto_19694 ) ) ( not ( = ?auto_19682 ?auto_19694 ) ) ( not ( = ?auto_19680 ?auto_19694 ) ) ( not ( = ?auto_19688 ?auto_19694 ) ) ( not ( = ?auto_19683 ?auto_19694 ) ) ( AVAILABLE ?auto_19692 ) ( TRUCK-AT ?auto_19691 ?auto_19684 ) ( AVAILABLE ?auto_19685 ) ( SURFACE-AT ?auto_19688 ?auto_19684 ) ( ON ?auto_19688 ?auto_19695 ) ( CLEAR ?auto_19688 ) ( not ( = ?auto_19676 ?auto_19695 ) ) ( not ( = ?auto_19677 ?auto_19695 ) ) ( not ( = ?auto_19679 ?auto_19695 ) ) ( not ( = ?auto_19689 ?auto_19695 ) ) ( not ( = ?auto_19693 ?auto_19695 ) ) ( not ( = ?auto_19682 ?auto_19695 ) ) ( not ( = ?auto_19680 ?auto_19695 ) ) ( not ( = ?auto_19688 ?auto_19695 ) ) ( not ( = ?auto_19683 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19695 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19685 ?auto_19688 ?auto_19695 ?auto_19684 )
      ( MAKE-ON ?auto_19676 ?auto_19677 )
      ( MAKE-ON-VERIFY ?auto_19676 ?auto_19677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19696 - SURFACE
      ?auto_19697 - SURFACE
    )
    :vars
    (
      ?auto_19701 - HOIST
      ?auto_19706 - PLACE
      ?auto_19699 - PLACE
      ?auto_19712 - HOIST
      ?auto_19698 - SURFACE
      ?auto_19711 - SURFACE
      ?auto_19702 - PLACE
      ?auto_19714 - HOIST
      ?auto_19709 - SURFACE
      ?auto_19710 - SURFACE
      ?auto_19700 - PLACE
      ?auto_19707 - HOIST
      ?auto_19704 - SURFACE
      ?auto_19703 - SURFACE
      ?auto_19715 - SURFACE
      ?auto_19705 - SURFACE
      ?auto_19708 - SURFACE
      ?auto_19713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19701 ?auto_19706 ) ( IS-CRATE ?auto_19696 ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19699 ?auto_19706 ) ) ( HOIST-AT ?auto_19712 ?auto_19699 ) ( not ( = ?auto_19701 ?auto_19712 ) ) ( SURFACE-AT ?auto_19696 ?auto_19699 ) ( ON ?auto_19696 ?auto_19698 ) ( CLEAR ?auto_19696 ) ( not ( = ?auto_19696 ?auto_19698 ) ) ( not ( = ?auto_19697 ?auto_19698 ) ) ( IS-CRATE ?auto_19697 ) ( not ( = ?auto_19696 ?auto_19711 ) ) ( not ( = ?auto_19697 ?auto_19711 ) ) ( not ( = ?auto_19698 ?auto_19711 ) ) ( not ( = ?auto_19702 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( HOIST-AT ?auto_19714 ?auto_19702 ) ( not ( = ?auto_19701 ?auto_19714 ) ) ( not ( = ?auto_19712 ?auto_19714 ) ) ( SURFACE-AT ?auto_19697 ?auto_19702 ) ( ON ?auto_19697 ?auto_19709 ) ( CLEAR ?auto_19697 ) ( not ( = ?auto_19696 ?auto_19709 ) ) ( not ( = ?auto_19697 ?auto_19709 ) ) ( not ( = ?auto_19698 ?auto_19709 ) ) ( not ( = ?auto_19711 ?auto_19709 ) ) ( IS-CRATE ?auto_19711 ) ( not ( = ?auto_19696 ?auto_19710 ) ) ( not ( = ?auto_19697 ?auto_19710 ) ) ( not ( = ?auto_19698 ?auto_19710 ) ) ( not ( = ?auto_19711 ?auto_19710 ) ) ( not ( = ?auto_19709 ?auto_19710 ) ) ( not ( = ?auto_19700 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19702 ?auto_19700 ) ) ( HOIST-AT ?auto_19707 ?auto_19700 ) ( not ( = ?auto_19701 ?auto_19707 ) ) ( not ( = ?auto_19712 ?auto_19707 ) ) ( not ( = ?auto_19714 ?auto_19707 ) ) ( AVAILABLE ?auto_19707 ) ( SURFACE-AT ?auto_19711 ?auto_19700 ) ( ON ?auto_19711 ?auto_19704 ) ( CLEAR ?auto_19711 ) ( not ( = ?auto_19696 ?auto_19704 ) ) ( not ( = ?auto_19697 ?auto_19704 ) ) ( not ( = ?auto_19698 ?auto_19704 ) ) ( not ( = ?auto_19711 ?auto_19704 ) ) ( not ( = ?auto_19709 ?auto_19704 ) ) ( not ( = ?auto_19710 ?auto_19704 ) ) ( IS-CRATE ?auto_19710 ) ( not ( = ?auto_19696 ?auto_19703 ) ) ( not ( = ?auto_19697 ?auto_19703 ) ) ( not ( = ?auto_19698 ?auto_19703 ) ) ( not ( = ?auto_19711 ?auto_19703 ) ) ( not ( = ?auto_19709 ?auto_19703 ) ) ( not ( = ?auto_19710 ?auto_19703 ) ) ( not ( = ?auto_19704 ?auto_19703 ) ) ( AVAILABLE ?auto_19712 ) ( SURFACE-AT ?auto_19710 ?auto_19699 ) ( ON ?auto_19710 ?auto_19715 ) ( CLEAR ?auto_19710 ) ( not ( = ?auto_19696 ?auto_19715 ) ) ( not ( = ?auto_19697 ?auto_19715 ) ) ( not ( = ?auto_19698 ?auto_19715 ) ) ( not ( = ?auto_19711 ?auto_19715 ) ) ( not ( = ?auto_19709 ?auto_19715 ) ) ( not ( = ?auto_19710 ?auto_19715 ) ) ( not ( = ?auto_19704 ?auto_19715 ) ) ( not ( = ?auto_19703 ?auto_19715 ) ) ( SURFACE-AT ?auto_19705 ?auto_19706 ) ( CLEAR ?auto_19705 ) ( IS-CRATE ?auto_19703 ) ( not ( = ?auto_19696 ?auto_19705 ) ) ( not ( = ?auto_19697 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19711 ?auto_19705 ) ) ( not ( = ?auto_19709 ?auto_19705 ) ) ( not ( = ?auto_19710 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19703 ?auto_19705 ) ) ( not ( = ?auto_19715 ?auto_19705 ) ) ( AVAILABLE ?auto_19701 ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19703 ?auto_19702 ) ( ON ?auto_19703 ?auto_19708 ) ( CLEAR ?auto_19703 ) ( not ( = ?auto_19696 ?auto_19708 ) ) ( not ( = ?auto_19697 ?auto_19708 ) ) ( not ( = ?auto_19698 ?auto_19708 ) ) ( not ( = ?auto_19711 ?auto_19708 ) ) ( not ( = ?auto_19709 ?auto_19708 ) ) ( not ( = ?auto_19710 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19703 ?auto_19708 ) ) ( not ( = ?auto_19715 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( TRUCK-AT ?auto_19713 ?auto_19706 ) )
    :subtasks
    ( ( !DRIVE ?auto_19713 ?auto_19706 ?auto_19702 )
      ( MAKE-ON ?auto_19696 ?auto_19697 )
      ( MAKE-ON-VERIFY ?auto_19696 ?auto_19697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19716 - SURFACE
      ?auto_19717 - SURFACE
    )
    :vars
    (
      ?auto_19726 - HOIST
      ?auto_19721 - PLACE
      ?auto_19719 - PLACE
      ?auto_19735 - HOIST
      ?auto_19734 - SURFACE
      ?auto_19727 - SURFACE
      ?auto_19733 - PLACE
      ?auto_19723 - HOIST
      ?auto_19730 - SURFACE
      ?auto_19731 - SURFACE
      ?auto_19718 - PLACE
      ?auto_19725 - HOIST
      ?auto_19729 - SURFACE
      ?auto_19732 - SURFACE
      ?auto_19720 - SURFACE
      ?auto_19724 - SURFACE
      ?auto_19728 - SURFACE
      ?auto_19722 - TRUCK
      ?auto_19736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19726 ?auto_19721 ) ( IS-CRATE ?auto_19716 ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19719 ?auto_19721 ) ) ( HOIST-AT ?auto_19735 ?auto_19719 ) ( not ( = ?auto_19726 ?auto_19735 ) ) ( SURFACE-AT ?auto_19716 ?auto_19719 ) ( ON ?auto_19716 ?auto_19734 ) ( CLEAR ?auto_19716 ) ( not ( = ?auto_19716 ?auto_19734 ) ) ( not ( = ?auto_19717 ?auto_19734 ) ) ( IS-CRATE ?auto_19717 ) ( not ( = ?auto_19716 ?auto_19727 ) ) ( not ( = ?auto_19717 ?auto_19727 ) ) ( not ( = ?auto_19734 ?auto_19727 ) ) ( not ( = ?auto_19733 ?auto_19721 ) ) ( not ( = ?auto_19719 ?auto_19733 ) ) ( HOIST-AT ?auto_19723 ?auto_19733 ) ( not ( = ?auto_19726 ?auto_19723 ) ) ( not ( = ?auto_19735 ?auto_19723 ) ) ( SURFACE-AT ?auto_19717 ?auto_19733 ) ( ON ?auto_19717 ?auto_19730 ) ( CLEAR ?auto_19717 ) ( not ( = ?auto_19716 ?auto_19730 ) ) ( not ( = ?auto_19717 ?auto_19730 ) ) ( not ( = ?auto_19734 ?auto_19730 ) ) ( not ( = ?auto_19727 ?auto_19730 ) ) ( IS-CRATE ?auto_19727 ) ( not ( = ?auto_19716 ?auto_19731 ) ) ( not ( = ?auto_19717 ?auto_19731 ) ) ( not ( = ?auto_19734 ?auto_19731 ) ) ( not ( = ?auto_19727 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( not ( = ?auto_19718 ?auto_19721 ) ) ( not ( = ?auto_19719 ?auto_19718 ) ) ( not ( = ?auto_19733 ?auto_19718 ) ) ( HOIST-AT ?auto_19725 ?auto_19718 ) ( not ( = ?auto_19726 ?auto_19725 ) ) ( not ( = ?auto_19735 ?auto_19725 ) ) ( not ( = ?auto_19723 ?auto_19725 ) ) ( AVAILABLE ?auto_19725 ) ( SURFACE-AT ?auto_19727 ?auto_19718 ) ( ON ?auto_19727 ?auto_19729 ) ( CLEAR ?auto_19727 ) ( not ( = ?auto_19716 ?auto_19729 ) ) ( not ( = ?auto_19717 ?auto_19729 ) ) ( not ( = ?auto_19734 ?auto_19729 ) ) ( not ( = ?auto_19727 ?auto_19729 ) ) ( not ( = ?auto_19730 ?auto_19729 ) ) ( not ( = ?auto_19731 ?auto_19729 ) ) ( IS-CRATE ?auto_19731 ) ( not ( = ?auto_19716 ?auto_19732 ) ) ( not ( = ?auto_19717 ?auto_19732 ) ) ( not ( = ?auto_19734 ?auto_19732 ) ) ( not ( = ?auto_19727 ?auto_19732 ) ) ( not ( = ?auto_19730 ?auto_19732 ) ) ( not ( = ?auto_19731 ?auto_19732 ) ) ( not ( = ?auto_19729 ?auto_19732 ) ) ( AVAILABLE ?auto_19735 ) ( SURFACE-AT ?auto_19731 ?auto_19719 ) ( ON ?auto_19731 ?auto_19720 ) ( CLEAR ?auto_19731 ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19717 ?auto_19720 ) ) ( not ( = ?auto_19734 ?auto_19720 ) ) ( not ( = ?auto_19727 ?auto_19720 ) ) ( not ( = ?auto_19730 ?auto_19720 ) ) ( not ( = ?auto_19731 ?auto_19720 ) ) ( not ( = ?auto_19729 ?auto_19720 ) ) ( not ( = ?auto_19732 ?auto_19720 ) ) ( IS-CRATE ?auto_19732 ) ( not ( = ?auto_19716 ?auto_19724 ) ) ( not ( = ?auto_19717 ?auto_19724 ) ) ( not ( = ?auto_19734 ?auto_19724 ) ) ( not ( = ?auto_19727 ?auto_19724 ) ) ( not ( = ?auto_19730 ?auto_19724 ) ) ( not ( = ?auto_19731 ?auto_19724 ) ) ( not ( = ?auto_19729 ?auto_19724 ) ) ( not ( = ?auto_19732 ?auto_19724 ) ) ( not ( = ?auto_19720 ?auto_19724 ) ) ( AVAILABLE ?auto_19723 ) ( SURFACE-AT ?auto_19732 ?auto_19733 ) ( ON ?auto_19732 ?auto_19728 ) ( CLEAR ?auto_19732 ) ( not ( = ?auto_19716 ?auto_19728 ) ) ( not ( = ?auto_19717 ?auto_19728 ) ) ( not ( = ?auto_19734 ?auto_19728 ) ) ( not ( = ?auto_19727 ?auto_19728 ) ) ( not ( = ?auto_19730 ?auto_19728 ) ) ( not ( = ?auto_19731 ?auto_19728 ) ) ( not ( = ?auto_19729 ?auto_19728 ) ) ( not ( = ?auto_19732 ?auto_19728 ) ) ( not ( = ?auto_19720 ?auto_19728 ) ) ( not ( = ?auto_19724 ?auto_19728 ) ) ( TRUCK-AT ?auto_19722 ?auto_19721 ) ( SURFACE-AT ?auto_19736 ?auto_19721 ) ( CLEAR ?auto_19736 ) ( LIFTING ?auto_19726 ?auto_19724 ) ( IS-CRATE ?auto_19724 ) ( not ( = ?auto_19716 ?auto_19736 ) ) ( not ( = ?auto_19717 ?auto_19736 ) ) ( not ( = ?auto_19734 ?auto_19736 ) ) ( not ( = ?auto_19727 ?auto_19736 ) ) ( not ( = ?auto_19730 ?auto_19736 ) ) ( not ( = ?auto_19731 ?auto_19736 ) ) ( not ( = ?auto_19729 ?auto_19736 ) ) ( not ( = ?auto_19732 ?auto_19736 ) ) ( not ( = ?auto_19720 ?auto_19736 ) ) ( not ( = ?auto_19724 ?auto_19736 ) ) ( not ( = ?auto_19728 ?auto_19736 ) ) )
    :subtasks
    ( ( !DROP ?auto_19726 ?auto_19724 ?auto_19736 ?auto_19721 )
      ( MAKE-ON ?auto_19716 ?auto_19717 )
      ( MAKE-ON-VERIFY ?auto_19716 ?auto_19717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19737 - SURFACE
      ?auto_19738 - SURFACE
    )
    :vars
    (
      ?auto_19754 - HOIST
      ?auto_19753 - PLACE
      ?auto_19741 - PLACE
      ?auto_19740 - HOIST
      ?auto_19744 - SURFACE
      ?auto_19748 - SURFACE
      ?auto_19739 - PLACE
      ?auto_19750 - HOIST
      ?auto_19751 - SURFACE
      ?auto_19746 - SURFACE
      ?auto_19743 - PLACE
      ?auto_19749 - HOIST
      ?auto_19742 - SURFACE
      ?auto_19756 - SURFACE
      ?auto_19752 - SURFACE
      ?auto_19757 - SURFACE
      ?auto_19747 - SURFACE
      ?auto_19745 - TRUCK
      ?auto_19755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19754 ?auto_19753 ) ( IS-CRATE ?auto_19737 ) ( not ( = ?auto_19737 ?auto_19738 ) ) ( not ( = ?auto_19741 ?auto_19753 ) ) ( HOIST-AT ?auto_19740 ?auto_19741 ) ( not ( = ?auto_19754 ?auto_19740 ) ) ( SURFACE-AT ?auto_19737 ?auto_19741 ) ( ON ?auto_19737 ?auto_19744 ) ( CLEAR ?auto_19737 ) ( not ( = ?auto_19737 ?auto_19744 ) ) ( not ( = ?auto_19738 ?auto_19744 ) ) ( IS-CRATE ?auto_19738 ) ( not ( = ?auto_19737 ?auto_19748 ) ) ( not ( = ?auto_19738 ?auto_19748 ) ) ( not ( = ?auto_19744 ?auto_19748 ) ) ( not ( = ?auto_19739 ?auto_19753 ) ) ( not ( = ?auto_19741 ?auto_19739 ) ) ( HOIST-AT ?auto_19750 ?auto_19739 ) ( not ( = ?auto_19754 ?auto_19750 ) ) ( not ( = ?auto_19740 ?auto_19750 ) ) ( SURFACE-AT ?auto_19738 ?auto_19739 ) ( ON ?auto_19738 ?auto_19751 ) ( CLEAR ?auto_19738 ) ( not ( = ?auto_19737 ?auto_19751 ) ) ( not ( = ?auto_19738 ?auto_19751 ) ) ( not ( = ?auto_19744 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( IS-CRATE ?auto_19748 ) ( not ( = ?auto_19737 ?auto_19746 ) ) ( not ( = ?auto_19738 ?auto_19746 ) ) ( not ( = ?auto_19744 ?auto_19746 ) ) ( not ( = ?auto_19748 ?auto_19746 ) ) ( not ( = ?auto_19751 ?auto_19746 ) ) ( not ( = ?auto_19743 ?auto_19753 ) ) ( not ( = ?auto_19741 ?auto_19743 ) ) ( not ( = ?auto_19739 ?auto_19743 ) ) ( HOIST-AT ?auto_19749 ?auto_19743 ) ( not ( = ?auto_19754 ?auto_19749 ) ) ( not ( = ?auto_19740 ?auto_19749 ) ) ( not ( = ?auto_19750 ?auto_19749 ) ) ( AVAILABLE ?auto_19749 ) ( SURFACE-AT ?auto_19748 ?auto_19743 ) ( ON ?auto_19748 ?auto_19742 ) ( CLEAR ?auto_19748 ) ( not ( = ?auto_19737 ?auto_19742 ) ) ( not ( = ?auto_19738 ?auto_19742 ) ) ( not ( = ?auto_19744 ?auto_19742 ) ) ( not ( = ?auto_19748 ?auto_19742 ) ) ( not ( = ?auto_19751 ?auto_19742 ) ) ( not ( = ?auto_19746 ?auto_19742 ) ) ( IS-CRATE ?auto_19746 ) ( not ( = ?auto_19737 ?auto_19756 ) ) ( not ( = ?auto_19738 ?auto_19756 ) ) ( not ( = ?auto_19744 ?auto_19756 ) ) ( not ( = ?auto_19748 ?auto_19756 ) ) ( not ( = ?auto_19751 ?auto_19756 ) ) ( not ( = ?auto_19746 ?auto_19756 ) ) ( not ( = ?auto_19742 ?auto_19756 ) ) ( AVAILABLE ?auto_19740 ) ( SURFACE-AT ?auto_19746 ?auto_19741 ) ( ON ?auto_19746 ?auto_19752 ) ( CLEAR ?auto_19746 ) ( not ( = ?auto_19737 ?auto_19752 ) ) ( not ( = ?auto_19738 ?auto_19752 ) ) ( not ( = ?auto_19744 ?auto_19752 ) ) ( not ( = ?auto_19748 ?auto_19752 ) ) ( not ( = ?auto_19751 ?auto_19752 ) ) ( not ( = ?auto_19746 ?auto_19752 ) ) ( not ( = ?auto_19742 ?auto_19752 ) ) ( not ( = ?auto_19756 ?auto_19752 ) ) ( IS-CRATE ?auto_19756 ) ( not ( = ?auto_19737 ?auto_19757 ) ) ( not ( = ?auto_19738 ?auto_19757 ) ) ( not ( = ?auto_19744 ?auto_19757 ) ) ( not ( = ?auto_19748 ?auto_19757 ) ) ( not ( = ?auto_19751 ?auto_19757 ) ) ( not ( = ?auto_19746 ?auto_19757 ) ) ( not ( = ?auto_19742 ?auto_19757 ) ) ( not ( = ?auto_19756 ?auto_19757 ) ) ( not ( = ?auto_19752 ?auto_19757 ) ) ( AVAILABLE ?auto_19750 ) ( SURFACE-AT ?auto_19756 ?auto_19739 ) ( ON ?auto_19756 ?auto_19747 ) ( CLEAR ?auto_19756 ) ( not ( = ?auto_19737 ?auto_19747 ) ) ( not ( = ?auto_19738 ?auto_19747 ) ) ( not ( = ?auto_19744 ?auto_19747 ) ) ( not ( = ?auto_19748 ?auto_19747 ) ) ( not ( = ?auto_19751 ?auto_19747 ) ) ( not ( = ?auto_19746 ?auto_19747 ) ) ( not ( = ?auto_19742 ?auto_19747 ) ) ( not ( = ?auto_19756 ?auto_19747 ) ) ( not ( = ?auto_19752 ?auto_19747 ) ) ( not ( = ?auto_19757 ?auto_19747 ) ) ( TRUCK-AT ?auto_19745 ?auto_19753 ) ( SURFACE-AT ?auto_19755 ?auto_19753 ) ( CLEAR ?auto_19755 ) ( IS-CRATE ?auto_19757 ) ( not ( = ?auto_19737 ?auto_19755 ) ) ( not ( = ?auto_19738 ?auto_19755 ) ) ( not ( = ?auto_19744 ?auto_19755 ) ) ( not ( = ?auto_19748 ?auto_19755 ) ) ( not ( = ?auto_19751 ?auto_19755 ) ) ( not ( = ?auto_19746 ?auto_19755 ) ) ( not ( = ?auto_19742 ?auto_19755 ) ) ( not ( = ?auto_19756 ?auto_19755 ) ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( not ( = ?auto_19757 ?auto_19755 ) ) ( not ( = ?auto_19747 ?auto_19755 ) ) ( AVAILABLE ?auto_19754 ) ( IN ?auto_19757 ?auto_19745 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19754 ?auto_19757 ?auto_19745 ?auto_19753 )
      ( MAKE-ON ?auto_19737 ?auto_19738 )
      ( MAKE-ON-VERIFY ?auto_19737 ?auto_19738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19758 - SURFACE
      ?auto_19759 - SURFACE
    )
    :vars
    (
      ?auto_19772 - HOIST
      ?auto_19774 - PLACE
      ?auto_19764 - PLACE
      ?auto_19767 - HOIST
      ?auto_19768 - SURFACE
      ?auto_19762 - SURFACE
      ?auto_19760 - PLACE
      ?auto_19777 - HOIST
      ?auto_19775 - SURFACE
      ?auto_19776 - SURFACE
      ?auto_19765 - PLACE
      ?auto_19766 - HOIST
      ?auto_19773 - SURFACE
      ?auto_19769 - SURFACE
      ?auto_19778 - SURFACE
      ?auto_19763 - SURFACE
      ?auto_19771 - SURFACE
      ?auto_19761 - SURFACE
      ?auto_19770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19772 ?auto_19774 ) ( IS-CRATE ?auto_19758 ) ( not ( = ?auto_19758 ?auto_19759 ) ) ( not ( = ?auto_19764 ?auto_19774 ) ) ( HOIST-AT ?auto_19767 ?auto_19764 ) ( not ( = ?auto_19772 ?auto_19767 ) ) ( SURFACE-AT ?auto_19758 ?auto_19764 ) ( ON ?auto_19758 ?auto_19768 ) ( CLEAR ?auto_19758 ) ( not ( = ?auto_19758 ?auto_19768 ) ) ( not ( = ?auto_19759 ?auto_19768 ) ) ( IS-CRATE ?auto_19759 ) ( not ( = ?auto_19758 ?auto_19762 ) ) ( not ( = ?auto_19759 ?auto_19762 ) ) ( not ( = ?auto_19768 ?auto_19762 ) ) ( not ( = ?auto_19760 ?auto_19774 ) ) ( not ( = ?auto_19764 ?auto_19760 ) ) ( HOIST-AT ?auto_19777 ?auto_19760 ) ( not ( = ?auto_19772 ?auto_19777 ) ) ( not ( = ?auto_19767 ?auto_19777 ) ) ( SURFACE-AT ?auto_19759 ?auto_19760 ) ( ON ?auto_19759 ?auto_19775 ) ( CLEAR ?auto_19759 ) ( not ( = ?auto_19758 ?auto_19775 ) ) ( not ( = ?auto_19759 ?auto_19775 ) ) ( not ( = ?auto_19768 ?auto_19775 ) ) ( not ( = ?auto_19762 ?auto_19775 ) ) ( IS-CRATE ?auto_19762 ) ( not ( = ?auto_19758 ?auto_19776 ) ) ( not ( = ?auto_19759 ?auto_19776 ) ) ( not ( = ?auto_19768 ?auto_19776 ) ) ( not ( = ?auto_19762 ?auto_19776 ) ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19765 ?auto_19774 ) ) ( not ( = ?auto_19764 ?auto_19765 ) ) ( not ( = ?auto_19760 ?auto_19765 ) ) ( HOIST-AT ?auto_19766 ?auto_19765 ) ( not ( = ?auto_19772 ?auto_19766 ) ) ( not ( = ?auto_19767 ?auto_19766 ) ) ( not ( = ?auto_19777 ?auto_19766 ) ) ( AVAILABLE ?auto_19766 ) ( SURFACE-AT ?auto_19762 ?auto_19765 ) ( ON ?auto_19762 ?auto_19773 ) ( CLEAR ?auto_19762 ) ( not ( = ?auto_19758 ?auto_19773 ) ) ( not ( = ?auto_19759 ?auto_19773 ) ) ( not ( = ?auto_19768 ?auto_19773 ) ) ( not ( = ?auto_19762 ?auto_19773 ) ) ( not ( = ?auto_19775 ?auto_19773 ) ) ( not ( = ?auto_19776 ?auto_19773 ) ) ( IS-CRATE ?auto_19776 ) ( not ( = ?auto_19758 ?auto_19769 ) ) ( not ( = ?auto_19759 ?auto_19769 ) ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( not ( = ?auto_19762 ?auto_19769 ) ) ( not ( = ?auto_19775 ?auto_19769 ) ) ( not ( = ?auto_19776 ?auto_19769 ) ) ( not ( = ?auto_19773 ?auto_19769 ) ) ( AVAILABLE ?auto_19767 ) ( SURFACE-AT ?auto_19776 ?auto_19764 ) ( ON ?auto_19776 ?auto_19778 ) ( CLEAR ?auto_19776 ) ( not ( = ?auto_19758 ?auto_19778 ) ) ( not ( = ?auto_19759 ?auto_19778 ) ) ( not ( = ?auto_19768 ?auto_19778 ) ) ( not ( = ?auto_19762 ?auto_19778 ) ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( not ( = ?auto_19776 ?auto_19778 ) ) ( not ( = ?auto_19773 ?auto_19778 ) ) ( not ( = ?auto_19769 ?auto_19778 ) ) ( IS-CRATE ?auto_19769 ) ( not ( = ?auto_19758 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19768 ?auto_19763 ) ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19775 ?auto_19763 ) ) ( not ( = ?auto_19776 ?auto_19763 ) ) ( not ( = ?auto_19773 ?auto_19763 ) ) ( not ( = ?auto_19769 ?auto_19763 ) ) ( not ( = ?auto_19778 ?auto_19763 ) ) ( AVAILABLE ?auto_19777 ) ( SURFACE-AT ?auto_19769 ?auto_19760 ) ( ON ?auto_19769 ?auto_19771 ) ( CLEAR ?auto_19769 ) ( not ( = ?auto_19758 ?auto_19771 ) ) ( not ( = ?auto_19759 ?auto_19771 ) ) ( not ( = ?auto_19768 ?auto_19771 ) ) ( not ( = ?auto_19762 ?auto_19771 ) ) ( not ( = ?auto_19775 ?auto_19771 ) ) ( not ( = ?auto_19776 ?auto_19771 ) ) ( not ( = ?auto_19773 ?auto_19771 ) ) ( not ( = ?auto_19769 ?auto_19771 ) ) ( not ( = ?auto_19778 ?auto_19771 ) ) ( not ( = ?auto_19763 ?auto_19771 ) ) ( SURFACE-AT ?auto_19761 ?auto_19774 ) ( CLEAR ?auto_19761 ) ( IS-CRATE ?auto_19763 ) ( not ( = ?auto_19758 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19768 ?auto_19761 ) ) ( not ( = ?auto_19762 ?auto_19761 ) ) ( not ( = ?auto_19775 ?auto_19761 ) ) ( not ( = ?auto_19776 ?auto_19761 ) ) ( not ( = ?auto_19773 ?auto_19761 ) ) ( not ( = ?auto_19769 ?auto_19761 ) ) ( not ( = ?auto_19778 ?auto_19761 ) ) ( not ( = ?auto_19763 ?auto_19761 ) ) ( not ( = ?auto_19771 ?auto_19761 ) ) ( AVAILABLE ?auto_19772 ) ( IN ?auto_19763 ?auto_19770 ) ( TRUCK-AT ?auto_19770 ?auto_19764 ) )
    :subtasks
    ( ( !DRIVE ?auto_19770 ?auto_19764 ?auto_19774 )
      ( MAKE-ON ?auto_19758 ?auto_19759 )
      ( MAKE-ON-VERIFY ?auto_19758 ?auto_19759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19779 - SURFACE
      ?auto_19780 - SURFACE
    )
    :vars
    (
      ?auto_19789 - HOIST
      ?auto_19781 - PLACE
      ?auto_19792 - PLACE
      ?auto_19783 - HOIST
      ?auto_19796 - SURFACE
      ?auto_19790 - SURFACE
      ?auto_19797 - PLACE
      ?auto_19799 - HOIST
      ?auto_19794 - SURFACE
      ?auto_19798 - SURFACE
      ?auto_19785 - PLACE
      ?auto_19795 - HOIST
      ?auto_19791 - SURFACE
      ?auto_19787 - SURFACE
      ?auto_19786 - SURFACE
      ?auto_19784 - SURFACE
      ?auto_19782 - SURFACE
      ?auto_19788 - SURFACE
      ?auto_19793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19789 ?auto_19781 ) ( IS-CRATE ?auto_19779 ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19792 ?auto_19781 ) ) ( HOIST-AT ?auto_19783 ?auto_19792 ) ( not ( = ?auto_19789 ?auto_19783 ) ) ( SURFACE-AT ?auto_19779 ?auto_19792 ) ( ON ?auto_19779 ?auto_19796 ) ( CLEAR ?auto_19779 ) ( not ( = ?auto_19779 ?auto_19796 ) ) ( not ( = ?auto_19780 ?auto_19796 ) ) ( IS-CRATE ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19790 ) ) ( not ( = ?auto_19780 ?auto_19790 ) ) ( not ( = ?auto_19796 ?auto_19790 ) ) ( not ( = ?auto_19797 ?auto_19781 ) ) ( not ( = ?auto_19792 ?auto_19797 ) ) ( HOIST-AT ?auto_19799 ?auto_19797 ) ( not ( = ?auto_19789 ?auto_19799 ) ) ( not ( = ?auto_19783 ?auto_19799 ) ) ( SURFACE-AT ?auto_19780 ?auto_19797 ) ( ON ?auto_19780 ?auto_19794 ) ( CLEAR ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19794 ) ) ( not ( = ?auto_19780 ?auto_19794 ) ) ( not ( = ?auto_19796 ?auto_19794 ) ) ( not ( = ?auto_19790 ?auto_19794 ) ) ( IS-CRATE ?auto_19790 ) ( not ( = ?auto_19779 ?auto_19798 ) ) ( not ( = ?auto_19780 ?auto_19798 ) ) ( not ( = ?auto_19796 ?auto_19798 ) ) ( not ( = ?auto_19790 ?auto_19798 ) ) ( not ( = ?auto_19794 ?auto_19798 ) ) ( not ( = ?auto_19785 ?auto_19781 ) ) ( not ( = ?auto_19792 ?auto_19785 ) ) ( not ( = ?auto_19797 ?auto_19785 ) ) ( HOIST-AT ?auto_19795 ?auto_19785 ) ( not ( = ?auto_19789 ?auto_19795 ) ) ( not ( = ?auto_19783 ?auto_19795 ) ) ( not ( = ?auto_19799 ?auto_19795 ) ) ( AVAILABLE ?auto_19795 ) ( SURFACE-AT ?auto_19790 ?auto_19785 ) ( ON ?auto_19790 ?auto_19791 ) ( CLEAR ?auto_19790 ) ( not ( = ?auto_19779 ?auto_19791 ) ) ( not ( = ?auto_19780 ?auto_19791 ) ) ( not ( = ?auto_19796 ?auto_19791 ) ) ( not ( = ?auto_19790 ?auto_19791 ) ) ( not ( = ?auto_19794 ?auto_19791 ) ) ( not ( = ?auto_19798 ?auto_19791 ) ) ( IS-CRATE ?auto_19798 ) ( not ( = ?auto_19779 ?auto_19787 ) ) ( not ( = ?auto_19780 ?auto_19787 ) ) ( not ( = ?auto_19796 ?auto_19787 ) ) ( not ( = ?auto_19790 ?auto_19787 ) ) ( not ( = ?auto_19794 ?auto_19787 ) ) ( not ( = ?auto_19798 ?auto_19787 ) ) ( not ( = ?auto_19791 ?auto_19787 ) ) ( SURFACE-AT ?auto_19798 ?auto_19792 ) ( ON ?auto_19798 ?auto_19786 ) ( CLEAR ?auto_19798 ) ( not ( = ?auto_19779 ?auto_19786 ) ) ( not ( = ?auto_19780 ?auto_19786 ) ) ( not ( = ?auto_19796 ?auto_19786 ) ) ( not ( = ?auto_19790 ?auto_19786 ) ) ( not ( = ?auto_19794 ?auto_19786 ) ) ( not ( = ?auto_19798 ?auto_19786 ) ) ( not ( = ?auto_19791 ?auto_19786 ) ) ( not ( = ?auto_19787 ?auto_19786 ) ) ( IS-CRATE ?auto_19787 ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( not ( = ?auto_19796 ?auto_19784 ) ) ( not ( = ?auto_19790 ?auto_19784 ) ) ( not ( = ?auto_19794 ?auto_19784 ) ) ( not ( = ?auto_19798 ?auto_19784 ) ) ( not ( = ?auto_19791 ?auto_19784 ) ) ( not ( = ?auto_19787 ?auto_19784 ) ) ( not ( = ?auto_19786 ?auto_19784 ) ) ( AVAILABLE ?auto_19799 ) ( SURFACE-AT ?auto_19787 ?auto_19797 ) ( ON ?auto_19787 ?auto_19782 ) ( CLEAR ?auto_19787 ) ( not ( = ?auto_19779 ?auto_19782 ) ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( not ( = ?auto_19796 ?auto_19782 ) ) ( not ( = ?auto_19790 ?auto_19782 ) ) ( not ( = ?auto_19794 ?auto_19782 ) ) ( not ( = ?auto_19798 ?auto_19782 ) ) ( not ( = ?auto_19791 ?auto_19782 ) ) ( not ( = ?auto_19787 ?auto_19782 ) ) ( not ( = ?auto_19786 ?auto_19782 ) ) ( not ( = ?auto_19784 ?auto_19782 ) ) ( SURFACE-AT ?auto_19788 ?auto_19781 ) ( CLEAR ?auto_19788 ) ( IS-CRATE ?auto_19784 ) ( not ( = ?auto_19779 ?auto_19788 ) ) ( not ( = ?auto_19780 ?auto_19788 ) ) ( not ( = ?auto_19796 ?auto_19788 ) ) ( not ( = ?auto_19790 ?auto_19788 ) ) ( not ( = ?auto_19794 ?auto_19788 ) ) ( not ( = ?auto_19798 ?auto_19788 ) ) ( not ( = ?auto_19791 ?auto_19788 ) ) ( not ( = ?auto_19787 ?auto_19788 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( not ( = ?auto_19784 ?auto_19788 ) ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( AVAILABLE ?auto_19789 ) ( TRUCK-AT ?auto_19793 ?auto_19792 ) ( LIFTING ?auto_19783 ?auto_19784 ) )
    :subtasks
    ( ( !LOAD ?auto_19783 ?auto_19784 ?auto_19793 ?auto_19792 )
      ( MAKE-ON ?auto_19779 ?auto_19780 )
      ( MAKE-ON-VERIFY ?auto_19779 ?auto_19780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19800 - SURFACE
      ?auto_19801 - SURFACE
    )
    :vars
    (
      ?auto_19812 - HOIST
      ?auto_19813 - PLACE
      ?auto_19818 - PLACE
      ?auto_19804 - HOIST
      ?auto_19806 - SURFACE
      ?auto_19811 - SURFACE
      ?auto_19805 - PLACE
      ?auto_19807 - HOIST
      ?auto_19810 - SURFACE
      ?auto_19820 - SURFACE
      ?auto_19816 - PLACE
      ?auto_19814 - HOIST
      ?auto_19819 - SURFACE
      ?auto_19809 - SURFACE
      ?auto_19808 - SURFACE
      ?auto_19815 - SURFACE
      ?auto_19802 - SURFACE
      ?auto_19803 - SURFACE
      ?auto_19817 - TRUCK
      ?auto_19821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19812 ?auto_19813 ) ( IS-CRATE ?auto_19800 ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( not ( = ?auto_19818 ?auto_19813 ) ) ( HOIST-AT ?auto_19804 ?auto_19818 ) ( not ( = ?auto_19812 ?auto_19804 ) ) ( SURFACE-AT ?auto_19800 ?auto_19818 ) ( ON ?auto_19800 ?auto_19806 ) ( CLEAR ?auto_19800 ) ( not ( = ?auto_19800 ?auto_19806 ) ) ( not ( = ?auto_19801 ?auto_19806 ) ) ( IS-CRATE ?auto_19801 ) ( not ( = ?auto_19800 ?auto_19811 ) ) ( not ( = ?auto_19801 ?auto_19811 ) ) ( not ( = ?auto_19806 ?auto_19811 ) ) ( not ( = ?auto_19805 ?auto_19813 ) ) ( not ( = ?auto_19818 ?auto_19805 ) ) ( HOIST-AT ?auto_19807 ?auto_19805 ) ( not ( = ?auto_19812 ?auto_19807 ) ) ( not ( = ?auto_19804 ?auto_19807 ) ) ( SURFACE-AT ?auto_19801 ?auto_19805 ) ( ON ?auto_19801 ?auto_19810 ) ( CLEAR ?auto_19801 ) ( not ( = ?auto_19800 ?auto_19810 ) ) ( not ( = ?auto_19801 ?auto_19810 ) ) ( not ( = ?auto_19806 ?auto_19810 ) ) ( not ( = ?auto_19811 ?auto_19810 ) ) ( IS-CRATE ?auto_19811 ) ( not ( = ?auto_19800 ?auto_19820 ) ) ( not ( = ?auto_19801 ?auto_19820 ) ) ( not ( = ?auto_19806 ?auto_19820 ) ) ( not ( = ?auto_19811 ?auto_19820 ) ) ( not ( = ?auto_19810 ?auto_19820 ) ) ( not ( = ?auto_19816 ?auto_19813 ) ) ( not ( = ?auto_19818 ?auto_19816 ) ) ( not ( = ?auto_19805 ?auto_19816 ) ) ( HOIST-AT ?auto_19814 ?auto_19816 ) ( not ( = ?auto_19812 ?auto_19814 ) ) ( not ( = ?auto_19804 ?auto_19814 ) ) ( not ( = ?auto_19807 ?auto_19814 ) ) ( AVAILABLE ?auto_19814 ) ( SURFACE-AT ?auto_19811 ?auto_19816 ) ( ON ?auto_19811 ?auto_19819 ) ( CLEAR ?auto_19811 ) ( not ( = ?auto_19800 ?auto_19819 ) ) ( not ( = ?auto_19801 ?auto_19819 ) ) ( not ( = ?auto_19806 ?auto_19819 ) ) ( not ( = ?auto_19811 ?auto_19819 ) ) ( not ( = ?auto_19810 ?auto_19819 ) ) ( not ( = ?auto_19820 ?auto_19819 ) ) ( IS-CRATE ?auto_19820 ) ( not ( = ?auto_19800 ?auto_19809 ) ) ( not ( = ?auto_19801 ?auto_19809 ) ) ( not ( = ?auto_19806 ?auto_19809 ) ) ( not ( = ?auto_19811 ?auto_19809 ) ) ( not ( = ?auto_19810 ?auto_19809 ) ) ( not ( = ?auto_19820 ?auto_19809 ) ) ( not ( = ?auto_19819 ?auto_19809 ) ) ( SURFACE-AT ?auto_19820 ?auto_19818 ) ( ON ?auto_19820 ?auto_19808 ) ( CLEAR ?auto_19820 ) ( not ( = ?auto_19800 ?auto_19808 ) ) ( not ( = ?auto_19801 ?auto_19808 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19811 ?auto_19808 ) ) ( not ( = ?auto_19810 ?auto_19808 ) ) ( not ( = ?auto_19820 ?auto_19808 ) ) ( not ( = ?auto_19819 ?auto_19808 ) ) ( not ( = ?auto_19809 ?auto_19808 ) ) ( IS-CRATE ?auto_19809 ) ( not ( = ?auto_19800 ?auto_19815 ) ) ( not ( = ?auto_19801 ?auto_19815 ) ) ( not ( = ?auto_19806 ?auto_19815 ) ) ( not ( = ?auto_19811 ?auto_19815 ) ) ( not ( = ?auto_19810 ?auto_19815 ) ) ( not ( = ?auto_19820 ?auto_19815 ) ) ( not ( = ?auto_19819 ?auto_19815 ) ) ( not ( = ?auto_19809 ?auto_19815 ) ) ( not ( = ?auto_19808 ?auto_19815 ) ) ( AVAILABLE ?auto_19807 ) ( SURFACE-AT ?auto_19809 ?auto_19805 ) ( ON ?auto_19809 ?auto_19802 ) ( CLEAR ?auto_19809 ) ( not ( = ?auto_19800 ?auto_19802 ) ) ( not ( = ?auto_19801 ?auto_19802 ) ) ( not ( = ?auto_19806 ?auto_19802 ) ) ( not ( = ?auto_19811 ?auto_19802 ) ) ( not ( = ?auto_19810 ?auto_19802 ) ) ( not ( = ?auto_19820 ?auto_19802 ) ) ( not ( = ?auto_19819 ?auto_19802 ) ) ( not ( = ?auto_19809 ?auto_19802 ) ) ( not ( = ?auto_19808 ?auto_19802 ) ) ( not ( = ?auto_19815 ?auto_19802 ) ) ( SURFACE-AT ?auto_19803 ?auto_19813 ) ( CLEAR ?auto_19803 ) ( IS-CRATE ?auto_19815 ) ( not ( = ?auto_19800 ?auto_19803 ) ) ( not ( = ?auto_19801 ?auto_19803 ) ) ( not ( = ?auto_19806 ?auto_19803 ) ) ( not ( = ?auto_19811 ?auto_19803 ) ) ( not ( = ?auto_19810 ?auto_19803 ) ) ( not ( = ?auto_19820 ?auto_19803 ) ) ( not ( = ?auto_19819 ?auto_19803 ) ) ( not ( = ?auto_19809 ?auto_19803 ) ) ( not ( = ?auto_19808 ?auto_19803 ) ) ( not ( = ?auto_19815 ?auto_19803 ) ) ( not ( = ?auto_19802 ?auto_19803 ) ) ( AVAILABLE ?auto_19812 ) ( TRUCK-AT ?auto_19817 ?auto_19818 ) ( AVAILABLE ?auto_19804 ) ( SURFACE-AT ?auto_19815 ?auto_19818 ) ( ON ?auto_19815 ?auto_19821 ) ( CLEAR ?auto_19815 ) ( not ( = ?auto_19800 ?auto_19821 ) ) ( not ( = ?auto_19801 ?auto_19821 ) ) ( not ( = ?auto_19806 ?auto_19821 ) ) ( not ( = ?auto_19811 ?auto_19821 ) ) ( not ( = ?auto_19810 ?auto_19821 ) ) ( not ( = ?auto_19820 ?auto_19821 ) ) ( not ( = ?auto_19819 ?auto_19821 ) ) ( not ( = ?auto_19809 ?auto_19821 ) ) ( not ( = ?auto_19808 ?auto_19821 ) ) ( not ( = ?auto_19815 ?auto_19821 ) ) ( not ( = ?auto_19802 ?auto_19821 ) ) ( not ( = ?auto_19803 ?auto_19821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19804 ?auto_19815 ?auto_19821 ?auto_19818 )
      ( MAKE-ON ?auto_19800 ?auto_19801 )
      ( MAKE-ON-VERIFY ?auto_19800 ?auto_19801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19822 - SURFACE
      ?auto_19823 - SURFACE
    )
    :vars
    (
      ?auto_19842 - HOIST
      ?auto_19843 - PLACE
      ?auto_19836 - PLACE
      ?auto_19831 - HOIST
      ?auto_19832 - SURFACE
      ?auto_19841 - SURFACE
      ?auto_19830 - PLACE
      ?auto_19825 - HOIST
      ?auto_19826 - SURFACE
      ?auto_19838 - SURFACE
      ?auto_19834 - PLACE
      ?auto_19829 - HOIST
      ?auto_19837 - SURFACE
      ?auto_19827 - SURFACE
      ?auto_19835 - SURFACE
      ?auto_19828 - SURFACE
      ?auto_19840 - SURFACE
      ?auto_19824 - SURFACE
      ?auto_19833 - SURFACE
      ?auto_19839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19842 ?auto_19843 ) ( IS-CRATE ?auto_19822 ) ( not ( = ?auto_19822 ?auto_19823 ) ) ( not ( = ?auto_19836 ?auto_19843 ) ) ( HOIST-AT ?auto_19831 ?auto_19836 ) ( not ( = ?auto_19842 ?auto_19831 ) ) ( SURFACE-AT ?auto_19822 ?auto_19836 ) ( ON ?auto_19822 ?auto_19832 ) ( CLEAR ?auto_19822 ) ( not ( = ?auto_19822 ?auto_19832 ) ) ( not ( = ?auto_19823 ?auto_19832 ) ) ( IS-CRATE ?auto_19823 ) ( not ( = ?auto_19822 ?auto_19841 ) ) ( not ( = ?auto_19823 ?auto_19841 ) ) ( not ( = ?auto_19832 ?auto_19841 ) ) ( not ( = ?auto_19830 ?auto_19843 ) ) ( not ( = ?auto_19836 ?auto_19830 ) ) ( HOIST-AT ?auto_19825 ?auto_19830 ) ( not ( = ?auto_19842 ?auto_19825 ) ) ( not ( = ?auto_19831 ?auto_19825 ) ) ( SURFACE-AT ?auto_19823 ?auto_19830 ) ( ON ?auto_19823 ?auto_19826 ) ( CLEAR ?auto_19823 ) ( not ( = ?auto_19822 ?auto_19826 ) ) ( not ( = ?auto_19823 ?auto_19826 ) ) ( not ( = ?auto_19832 ?auto_19826 ) ) ( not ( = ?auto_19841 ?auto_19826 ) ) ( IS-CRATE ?auto_19841 ) ( not ( = ?auto_19822 ?auto_19838 ) ) ( not ( = ?auto_19823 ?auto_19838 ) ) ( not ( = ?auto_19832 ?auto_19838 ) ) ( not ( = ?auto_19841 ?auto_19838 ) ) ( not ( = ?auto_19826 ?auto_19838 ) ) ( not ( = ?auto_19834 ?auto_19843 ) ) ( not ( = ?auto_19836 ?auto_19834 ) ) ( not ( = ?auto_19830 ?auto_19834 ) ) ( HOIST-AT ?auto_19829 ?auto_19834 ) ( not ( = ?auto_19842 ?auto_19829 ) ) ( not ( = ?auto_19831 ?auto_19829 ) ) ( not ( = ?auto_19825 ?auto_19829 ) ) ( AVAILABLE ?auto_19829 ) ( SURFACE-AT ?auto_19841 ?auto_19834 ) ( ON ?auto_19841 ?auto_19837 ) ( CLEAR ?auto_19841 ) ( not ( = ?auto_19822 ?auto_19837 ) ) ( not ( = ?auto_19823 ?auto_19837 ) ) ( not ( = ?auto_19832 ?auto_19837 ) ) ( not ( = ?auto_19841 ?auto_19837 ) ) ( not ( = ?auto_19826 ?auto_19837 ) ) ( not ( = ?auto_19838 ?auto_19837 ) ) ( IS-CRATE ?auto_19838 ) ( not ( = ?auto_19822 ?auto_19827 ) ) ( not ( = ?auto_19823 ?auto_19827 ) ) ( not ( = ?auto_19832 ?auto_19827 ) ) ( not ( = ?auto_19841 ?auto_19827 ) ) ( not ( = ?auto_19826 ?auto_19827 ) ) ( not ( = ?auto_19838 ?auto_19827 ) ) ( not ( = ?auto_19837 ?auto_19827 ) ) ( SURFACE-AT ?auto_19838 ?auto_19836 ) ( ON ?auto_19838 ?auto_19835 ) ( CLEAR ?auto_19838 ) ( not ( = ?auto_19822 ?auto_19835 ) ) ( not ( = ?auto_19823 ?auto_19835 ) ) ( not ( = ?auto_19832 ?auto_19835 ) ) ( not ( = ?auto_19841 ?auto_19835 ) ) ( not ( = ?auto_19826 ?auto_19835 ) ) ( not ( = ?auto_19838 ?auto_19835 ) ) ( not ( = ?auto_19837 ?auto_19835 ) ) ( not ( = ?auto_19827 ?auto_19835 ) ) ( IS-CRATE ?auto_19827 ) ( not ( = ?auto_19822 ?auto_19828 ) ) ( not ( = ?auto_19823 ?auto_19828 ) ) ( not ( = ?auto_19832 ?auto_19828 ) ) ( not ( = ?auto_19841 ?auto_19828 ) ) ( not ( = ?auto_19826 ?auto_19828 ) ) ( not ( = ?auto_19838 ?auto_19828 ) ) ( not ( = ?auto_19837 ?auto_19828 ) ) ( not ( = ?auto_19827 ?auto_19828 ) ) ( not ( = ?auto_19835 ?auto_19828 ) ) ( AVAILABLE ?auto_19825 ) ( SURFACE-AT ?auto_19827 ?auto_19830 ) ( ON ?auto_19827 ?auto_19840 ) ( CLEAR ?auto_19827 ) ( not ( = ?auto_19822 ?auto_19840 ) ) ( not ( = ?auto_19823 ?auto_19840 ) ) ( not ( = ?auto_19832 ?auto_19840 ) ) ( not ( = ?auto_19841 ?auto_19840 ) ) ( not ( = ?auto_19826 ?auto_19840 ) ) ( not ( = ?auto_19838 ?auto_19840 ) ) ( not ( = ?auto_19837 ?auto_19840 ) ) ( not ( = ?auto_19827 ?auto_19840 ) ) ( not ( = ?auto_19835 ?auto_19840 ) ) ( not ( = ?auto_19828 ?auto_19840 ) ) ( SURFACE-AT ?auto_19824 ?auto_19843 ) ( CLEAR ?auto_19824 ) ( IS-CRATE ?auto_19828 ) ( not ( = ?auto_19822 ?auto_19824 ) ) ( not ( = ?auto_19823 ?auto_19824 ) ) ( not ( = ?auto_19832 ?auto_19824 ) ) ( not ( = ?auto_19841 ?auto_19824 ) ) ( not ( = ?auto_19826 ?auto_19824 ) ) ( not ( = ?auto_19838 ?auto_19824 ) ) ( not ( = ?auto_19837 ?auto_19824 ) ) ( not ( = ?auto_19827 ?auto_19824 ) ) ( not ( = ?auto_19835 ?auto_19824 ) ) ( not ( = ?auto_19828 ?auto_19824 ) ) ( not ( = ?auto_19840 ?auto_19824 ) ) ( AVAILABLE ?auto_19842 ) ( AVAILABLE ?auto_19831 ) ( SURFACE-AT ?auto_19828 ?auto_19836 ) ( ON ?auto_19828 ?auto_19833 ) ( CLEAR ?auto_19828 ) ( not ( = ?auto_19822 ?auto_19833 ) ) ( not ( = ?auto_19823 ?auto_19833 ) ) ( not ( = ?auto_19832 ?auto_19833 ) ) ( not ( = ?auto_19841 ?auto_19833 ) ) ( not ( = ?auto_19826 ?auto_19833 ) ) ( not ( = ?auto_19838 ?auto_19833 ) ) ( not ( = ?auto_19837 ?auto_19833 ) ) ( not ( = ?auto_19827 ?auto_19833 ) ) ( not ( = ?auto_19835 ?auto_19833 ) ) ( not ( = ?auto_19828 ?auto_19833 ) ) ( not ( = ?auto_19840 ?auto_19833 ) ) ( not ( = ?auto_19824 ?auto_19833 ) ) ( TRUCK-AT ?auto_19839 ?auto_19843 ) )
    :subtasks
    ( ( !DRIVE ?auto_19839 ?auto_19843 ?auto_19836 )
      ( MAKE-ON ?auto_19822 ?auto_19823 )
      ( MAKE-ON-VERIFY ?auto_19822 ?auto_19823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19846 - SURFACE
      ?auto_19847 - SURFACE
    )
    :vars
    (
      ?auto_19848 - HOIST
      ?auto_19849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19848 ?auto_19849 ) ( SURFACE-AT ?auto_19847 ?auto_19849 ) ( CLEAR ?auto_19847 ) ( LIFTING ?auto_19848 ?auto_19846 ) ( IS-CRATE ?auto_19846 ) ( not ( = ?auto_19846 ?auto_19847 ) ) )
    :subtasks
    ( ( !DROP ?auto_19848 ?auto_19846 ?auto_19847 ?auto_19849 )
      ( MAKE-ON-VERIFY ?auto_19846 ?auto_19847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19850 - SURFACE
      ?auto_19851 - SURFACE
    )
    :vars
    (
      ?auto_19853 - HOIST
      ?auto_19852 - PLACE
      ?auto_19854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19853 ?auto_19852 ) ( SURFACE-AT ?auto_19851 ?auto_19852 ) ( CLEAR ?auto_19851 ) ( IS-CRATE ?auto_19850 ) ( not ( = ?auto_19850 ?auto_19851 ) ) ( TRUCK-AT ?auto_19854 ?auto_19852 ) ( AVAILABLE ?auto_19853 ) ( IN ?auto_19850 ?auto_19854 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19853 ?auto_19850 ?auto_19854 ?auto_19852 )
      ( MAKE-ON ?auto_19850 ?auto_19851 )
      ( MAKE-ON-VERIFY ?auto_19850 ?auto_19851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19855 - SURFACE
      ?auto_19856 - SURFACE
    )
    :vars
    (
      ?auto_19859 - HOIST
      ?auto_19857 - PLACE
      ?auto_19858 - TRUCK
      ?auto_19860 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19859 ?auto_19857 ) ( SURFACE-AT ?auto_19856 ?auto_19857 ) ( CLEAR ?auto_19856 ) ( IS-CRATE ?auto_19855 ) ( not ( = ?auto_19855 ?auto_19856 ) ) ( AVAILABLE ?auto_19859 ) ( IN ?auto_19855 ?auto_19858 ) ( TRUCK-AT ?auto_19858 ?auto_19860 ) ( not ( = ?auto_19860 ?auto_19857 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19858 ?auto_19860 ?auto_19857 )
      ( MAKE-ON ?auto_19855 ?auto_19856 )
      ( MAKE-ON-VERIFY ?auto_19855 ?auto_19856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19861 - SURFACE
      ?auto_19862 - SURFACE
    )
    :vars
    (
      ?auto_19864 - HOIST
      ?auto_19866 - PLACE
      ?auto_19863 - TRUCK
      ?auto_19865 - PLACE
      ?auto_19867 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19864 ?auto_19866 ) ( SURFACE-AT ?auto_19862 ?auto_19866 ) ( CLEAR ?auto_19862 ) ( IS-CRATE ?auto_19861 ) ( not ( = ?auto_19861 ?auto_19862 ) ) ( AVAILABLE ?auto_19864 ) ( TRUCK-AT ?auto_19863 ?auto_19865 ) ( not ( = ?auto_19865 ?auto_19866 ) ) ( HOIST-AT ?auto_19867 ?auto_19865 ) ( LIFTING ?auto_19867 ?auto_19861 ) ( not ( = ?auto_19864 ?auto_19867 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19867 ?auto_19861 ?auto_19863 ?auto_19865 )
      ( MAKE-ON ?auto_19861 ?auto_19862 )
      ( MAKE-ON-VERIFY ?auto_19861 ?auto_19862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19868 - SURFACE
      ?auto_19869 - SURFACE
    )
    :vars
    (
      ?auto_19872 - HOIST
      ?auto_19874 - PLACE
      ?auto_19870 - TRUCK
      ?auto_19871 - PLACE
      ?auto_19873 - HOIST
      ?auto_19875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19872 ?auto_19874 ) ( SURFACE-AT ?auto_19869 ?auto_19874 ) ( CLEAR ?auto_19869 ) ( IS-CRATE ?auto_19868 ) ( not ( = ?auto_19868 ?auto_19869 ) ) ( AVAILABLE ?auto_19872 ) ( TRUCK-AT ?auto_19870 ?auto_19871 ) ( not ( = ?auto_19871 ?auto_19874 ) ) ( HOIST-AT ?auto_19873 ?auto_19871 ) ( not ( = ?auto_19872 ?auto_19873 ) ) ( AVAILABLE ?auto_19873 ) ( SURFACE-AT ?auto_19868 ?auto_19871 ) ( ON ?auto_19868 ?auto_19875 ) ( CLEAR ?auto_19868 ) ( not ( = ?auto_19868 ?auto_19875 ) ) ( not ( = ?auto_19869 ?auto_19875 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19873 ?auto_19868 ?auto_19875 ?auto_19871 )
      ( MAKE-ON ?auto_19868 ?auto_19869 )
      ( MAKE-ON-VERIFY ?auto_19868 ?auto_19869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19876 - SURFACE
      ?auto_19877 - SURFACE
    )
    :vars
    (
      ?auto_19882 - HOIST
      ?auto_19879 - PLACE
      ?auto_19880 - PLACE
      ?auto_19881 - HOIST
      ?auto_19878 - SURFACE
      ?auto_19883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19882 ?auto_19879 ) ( SURFACE-AT ?auto_19877 ?auto_19879 ) ( CLEAR ?auto_19877 ) ( IS-CRATE ?auto_19876 ) ( not ( = ?auto_19876 ?auto_19877 ) ) ( AVAILABLE ?auto_19882 ) ( not ( = ?auto_19880 ?auto_19879 ) ) ( HOIST-AT ?auto_19881 ?auto_19880 ) ( not ( = ?auto_19882 ?auto_19881 ) ) ( AVAILABLE ?auto_19881 ) ( SURFACE-AT ?auto_19876 ?auto_19880 ) ( ON ?auto_19876 ?auto_19878 ) ( CLEAR ?auto_19876 ) ( not ( = ?auto_19876 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( TRUCK-AT ?auto_19883 ?auto_19879 ) )
    :subtasks
    ( ( !DRIVE ?auto_19883 ?auto_19879 ?auto_19880 )
      ( MAKE-ON ?auto_19876 ?auto_19877 )
      ( MAKE-ON-VERIFY ?auto_19876 ?auto_19877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19884 - SURFACE
      ?auto_19885 - SURFACE
    )
    :vars
    (
      ?auto_19888 - HOIST
      ?auto_19890 - PLACE
      ?auto_19887 - PLACE
      ?auto_19886 - HOIST
      ?auto_19891 - SURFACE
      ?auto_19889 - TRUCK
      ?auto_19892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19888 ?auto_19890 ) ( IS-CRATE ?auto_19884 ) ( not ( = ?auto_19884 ?auto_19885 ) ) ( not ( = ?auto_19887 ?auto_19890 ) ) ( HOIST-AT ?auto_19886 ?auto_19887 ) ( not ( = ?auto_19888 ?auto_19886 ) ) ( AVAILABLE ?auto_19886 ) ( SURFACE-AT ?auto_19884 ?auto_19887 ) ( ON ?auto_19884 ?auto_19891 ) ( CLEAR ?auto_19884 ) ( not ( = ?auto_19884 ?auto_19891 ) ) ( not ( = ?auto_19885 ?auto_19891 ) ) ( TRUCK-AT ?auto_19889 ?auto_19890 ) ( SURFACE-AT ?auto_19892 ?auto_19890 ) ( CLEAR ?auto_19892 ) ( LIFTING ?auto_19888 ?auto_19885 ) ( IS-CRATE ?auto_19885 ) ( not ( = ?auto_19884 ?auto_19892 ) ) ( not ( = ?auto_19885 ?auto_19892 ) ) ( not ( = ?auto_19891 ?auto_19892 ) ) )
    :subtasks
    ( ( !DROP ?auto_19888 ?auto_19885 ?auto_19892 ?auto_19890 )
      ( MAKE-ON ?auto_19884 ?auto_19885 )
      ( MAKE-ON-VERIFY ?auto_19884 ?auto_19885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19893 - SURFACE
      ?auto_19894 - SURFACE
    )
    :vars
    (
      ?auto_19897 - HOIST
      ?auto_19898 - PLACE
      ?auto_19896 - PLACE
      ?auto_19900 - HOIST
      ?auto_19895 - SURFACE
      ?auto_19899 - TRUCK
      ?auto_19901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19897 ?auto_19898 ) ( IS-CRATE ?auto_19893 ) ( not ( = ?auto_19893 ?auto_19894 ) ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( HOIST-AT ?auto_19900 ?auto_19896 ) ( not ( = ?auto_19897 ?auto_19900 ) ) ( AVAILABLE ?auto_19900 ) ( SURFACE-AT ?auto_19893 ?auto_19896 ) ( ON ?auto_19893 ?auto_19895 ) ( CLEAR ?auto_19893 ) ( not ( = ?auto_19893 ?auto_19895 ) ) ( not ( = ?auto_19894 ?auto_19895 ) ) ( TRUCK-AT ?auto_19899 ?auto_19898 ) ( SURFACE-AT ?auto_19901 ?auto_19898 ) ( CLEAR ?auto_19901 ) ( IS-CRATE ?auto_19894 ) ( not ( = ?auto_19893 ?auto_19901 ) ) ( not ( = ?auto_19894 ?auto_19901 ) ) ( not ( = ?auto_19895 ?auto_19901 ) ) ( AVAILABLE ?auto_19897 ) ( IN ?auto_19894 ?auto_19899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19897 ?auto_19894 ?auto_19899 ?auto_19898 )
      ( MAKE-ON ?auto_19893 ?auto_19894 )
      ( MAKE-ON-VERIFY ?auto_19893 ?auto_19894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19902 - SURFACE
      ?auto_19903 - SURFACE
    )
    :vars
    (
      ?auto_19904 - HOIST
      ?auto_19905 - PLACE
      ?auto_19908 - PLACE
      ?auto_19909 - HOIST
      ?auto_19907 - SURFACE
      ?auto_19910 - SURFACE
      ?auto_19906 - TRUCK
      ?auto_19911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19904 ?auto_19905 ) ( IS-CRATE ?auto_19902 ) ( not ( = ?auto_19902 ?auto_19903 ) ) ( not ( = ?auto_19908 ?auto_19905 ) ) ( HOIST-AT ?auto_19909 ?auto_19908 ) ( not ( = ?auto_19904 ?auto_19909 ) ) ( AVAILABLE ?auto_19909 ) ( SURFACE-AT ?auto_19902 ?auto_19908 ) ( ON ?auto_19902 ?auto_19907 ) ( CLEAR ?auto_19902 ) ( not ( = ?auto_19902 ?auto_19907 ) ) ( not ( = ?auto_19903 ?auto_19907 ) ) ( SURFACE-AT ?auto_19910 ?auto_19905 ) ( CLEAR ?auto_19910 ) ( IS-CRATE ?auto_19903 ) ( not ( = ?auto_19902 ?auto_19910 ) ) ( not ( = ?auto_19903 ?auto_19910 ) ) ( not ( = ?auto_19907 ?auto_19910 ) ) ( AVAILABLE ?auto_19904 ) ( IN ?auto_19903 ?auto_19906 ) ( TRUCK-AT ?auto_19906 ?auto_19911 ) ( not ( = ?auto_19911 ?auto_19905 ) ) ( not ( = ?auto_19908 ?auto_19911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19906 ?auto_19911 ?auto_19905 )
      ( MAKE-ON ?auto_19902 ?auto_19903 )
      ( MAKE-ON-VERIFY ?auto_19902 ?auto_19903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19912 - SURFACE
      ?auto_19913 - SURFACE
    )
    :vars
    (
      ?auto_19921 - HOIST
      ?auto_19915 - PLACE
      ?auto_19918 - PLACE
      ?auto_19919 - HOIST
      ?auto_19917 - SURFACE
      ?auto_19914 - SURFACE
      ?auto_19916 - TRUCK
      ?auto_19920 - PLACE
      ?auto_19922 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19921 ?auto_19915 ) ( IS-CRATE ?auto_19912 ) ( not ( = ?auto_19912 ?auto_19913 ) ) ( not ( = ?auto_19918 ?auto_19915 ) ) ( HOIST-AT ?auto_19919 ?auto_19918 ) ( not ( = ?auto_19921 ?auto_19919 ) ) ( AVAILABLE ?auto_19919 ) ( SURFACE-AT ?auto_19912 ?auto_19918 ) ( ON ?auto_19912 ?auto_19917 ) ( CLEAR ?auto_19912 ) ( not ( = ?auto_19912 ?auto_19917 ) ) ( not ( = ?auto_19913 ?auto_19917 ) ) ( SURFACE-AT ?auto_19914 ?auto_19915 ) ( CLEAR ?auto_19914 ) ( IS-CRATE ?auto_19913 ) ( not ( = ?auto_19912 ?auto_19914 ) ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19917 ?auto_19914 ) ) ( AVAILABLE ?auto_19921 ) ( TRUCK-AT ?auto_19916 ?auto_19920 ) ( not ( = ?auto_19920 ?auto_19915 ) ) ( not ( = ?auto_19918 ?auto_19920 ) ) ( HOIST-AT ?auto_19922 ?auto_19920 ) ( LIFTING ?auto_19922 ?auto_19913 ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19919 ?auto_19922 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19922 ?auto_19913 ?auto_19916 ?auto_19920 )
      ( MAKE-ON ?auto_19912 ?auto_19913 )
      ( MAKE-ON-VERIFY ?auto_19912 ?auto_19913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19923 - SURFACE
      ?auto_19924 - SURFACE
    )
    :vars
    (
      ?auto_19925 - HOIST
      ?auto_19931 - PLACE
      ?auto_19930 - PLACE
      ?auto_19929 - HOIST
      ?auto_19926 - SURFACE
      ?auto_19933 - SURFACE
      ?auto_19928 - TRUCK
      ?auto_19927 - PLACE
      ?auto_19932 - HOIST
      ?auto_19934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19925 ?auto_19931 ) ( IS-CRATE ?auto_19923 ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19930 ?auto_19931 ) ) ( HOIST-AT ?auto_19929 ?auto_19930 ) ( not ( = ?auto_19925 ?auto_19929 ) ) ( AVAILABLE ?auto_19929 ) ( SURFACE-AT ?auto_19923 ?auto_19930 ) ( ON ?auto_19923 ?auto_19926 ) ( CLEAR ?auto_19923 ) ( not ( = ?auto_19923 ?auto_19926 ) ) ( not ( = ?auto_19924 ?auto_19926 ) ) ( SURFACE-AT ?auto_19933 ?auto_19931 ) ( CLEAR ?auto_19933 ) ( IS-CRATE ?auto_19924 ) ( not ( = ?auto_19923 ?auto_19933 ) ) ( not ( = ?auto_19924 ?auto_19933 ) ) ( not ( = ?auto_19926 ?auto_19933 ) ) ( AVAILABLE ?auto_19925 ) ( TRUCK-AT ?auto_19928 ?auto_19927 ) ( not ( = ?auto_19927 ?auto_19931 ) ) ( not ( = ?auto_19930 ?auto_19927 ) ) ( HOIST-AT ?auto_19932 ?auto_19927 ) ( not ( = ?auto_19925 ?auto_19932 ) ) ( not ( = ?auto_19929 ?auto_19932 ) ) ( AVAILABLE ?auto_19932 ) ( SURFACE-AT ?auto_19924 ?auto_19927 ) ( ON ?auto_19924 ?auto_19934 ) ( CLEAR ?auto_19924 ) ( not ( = ?auto_19923 ?auto_19934 ) ) ( not ( = ?auto_19924 ?auto_19934 ) ) ( not ( = ?auto_19926 ?auto_19934 ) ) ( not ( = ?auto_19933 ?auto_19934 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19932 ?auto_19924 ?auto_19934 ?auto_19927 )
      ( MAKE-ON ?auto_19923 ?auto_19924 )
      ( MAKE-ON-VERIFY ?auto_19923 ?auto_19924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19935 - SURFACE
      ?auto_19936 - SURFACE
    )
    :vars
    (
      ?auto_19940 - HOIST
      ?auto_19945 - PLACE
      ?auto_19938 - PLACE
      ?auto_19937 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19941 - SURFACE
      ?auto_19944 - PLACE
      ?auto_19943 - HOIST
      ?auto_19946 - SURFACE
      ?auto_19939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19940 ?auto_19945 ) ( IS-CRATE ?auto_19935 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19938 ?auto_19945 ) ) ( HOIST-AT ?auto_19937 ?auto_19938 ) ( not ( = ?auto_19940 ?auto_19937 ) ) ( AVAILABLE ?auto_19937 ) ( SURFACE-AT ?auto_19935 ?auto_19938 ) ( ON ?auto_19935 ?auto_19942 ) ( CLEAR ?auto_19935 ) ( not ( = ?auto_19935 ?auto_19942 ) ) ( not ( = ?auto_19936 ?auto_19942 ) ) ( SURFACE-AT ?auto_19941 ?auto_19945 ) ( CLEAR ?auto_19941 ) ( IS-CRATE ?auto_19936 ) ( not ( = ?auto_19935 ?auto_19941 ) ) ( not ( = ?auto_19936 ?auto_19941 ) ) ( not ( = ?auto_19942 ?auto_19941 ) ) ( AVAILABLE ?auto_19940 ) ( not ( = ?auto_19944 ?auto_19945 ) ) ( not ( = ?auto_19938 ?auto_19944 ) ) ( HOIST-AT ?auto_19943 ?auto_19944 ) ( not ( = ?auto_19940 ?auto_19943 ) ) ( not ( = ?auto_19937 ?auto_19943 ) ) ( AVAILABLE ?auto_19943 ) ( SURFACE-AT ?auto_19936 ?auto_19944 ) ( ON ?auto_19936 ?auto_19946 ) ( CLEAR ?auto_19936 ) ( not ( = ?auto_19935 ?auto_19946 ) ) ( not ( = ?auto_19936 ?auto_19946 ) ) ( not ( = ?auto_19942 ?auto_19946 ) ) ( not ( = ?auto_19941 ?auto_19946 ) ) ( TRUCK-AT ?auto_19939 ?auto_19945 ) )
    :subtasks
    ( ( !DRIVE ?auto_19939 ?auto_19945 ?auto_19944 )
      ( MAKE-ON ?auto_19935 ?auto_19936 )
      ( MAKE-ON-VERIFY ?auto_19935 ?auto_19936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19947 - SURFACE
      ?auto_19948 - SURFACE
    )
    :vars
    (
      ?auto_19952 - HOIST
      ?auto_19958 - PLACE
      ?auto_19955 - PLACE
      ?auto_19951 - HOIST
      ?auto_19950 - SURFACE
      ?auto_19949 - SURFACE
      ?auto_19953 - PLACE
      ?auto_19957 - HOIST
      ?auto_19956 - SURFACE
      ?auto_19954 - TRUCK
      ?auto_19959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19952 ?auto_19958 ) ( IS-CRATE ?auto_19947 ) ( not ( = ?auto_19947 ?auto_19948 ) ) ( not ( = ?auto_19955 ?auto_19958 ) ) ( HOIST-AT ?auto_19951 ?auto_19955 ) ( not ( = ?auto_19952 ?auto_19951 ) ) ( AVAILABLE ?auto_19951 ) ( SURFACE-AT ?auto_19947 ?auto_19955 ) ( ON ?auto_19947 ?auto_19950 ) ( CLEAR ?auto_19947 ) ( not ( = ?auto_19947 ?auto_19950 ) ) ( not ( = ?auto_19948 ?auto_19950 ) ) ( IS-CRATE ?auto_19948 ) ( not ( = ?auto_19947 ?auto_19949 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( not ( = ?auto_19950 ?auto_19949 ) ) ( not ( = ?auto_19953 ?auto_19958 ) ) ( not ( = ?auto_19955 ?auto_19953 ) ) ( HOIST-AT ?auto_19957 ?auto_19953 ) ( not ( = ?auto_19952 ?auto_19957 ) ) ( not ( = ?auto_19951 ?auto_19957 ) ) ( AVAILABLE ?auto_19957 ) ( SURFACE-AT ?auto_19948 ?auto_19953 ) ( ON ?auto_19948 ?auto_19956 ) ( CLEAR ?auto_19948 ) ( not ( = ?auto_19947 ?auto_19956 ) ) ( not ( = ?auto_19948 ?auto_19956 ) ) ( not ( = ?auto_19950 ?auto_19956 ) ) ( not ( = ?auto_19949 ?auto_19956 ) ) ( TRUCK-AT ?auto_19954 ?auto_19958 ) ( SURFACE-AT ?auto_19959 ?auto_19958 ) ( CLEAR ?auto_19959 ) ( LIFTING ?auto_19952 ?auto_19949 ) ( IS-CRATE ?auto_19949 ) ( not ( = ?auto_19947 ?auto_19959 ) ) ( not ( = ?auto_19948 ?auto_19959 ) ) ( not ( = ?auto_19950 ?auto_19959 ) ) ( not ( = ?auto_19949 ?auto_19959 ) ) ( not ( = ?auto_19956 ?auto_19959 ) ) )
    :subtasks
    ( ( !DROP ?auto_19952 ?auto_19949 ?auto_19959 ?auto_19958 )
      ( MAKE-ON ?auto_19947 ?auto_19948 )
      ( MAKE-ON-VERIFY ?auto_19947 ?auto_19948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19960 - SURFACE
      ?auto_19961 - SURFACE
    )
    :vars
    (
      ?auto_19968 - HOIST
      ?auto_19962 - PLACE
      ?auto_19963 - PLACE
      ?auto_19967 - HOIST
      ?auto_19965 - SURFACE
      ?auto_19971 - SURFACE
      ?auto_19969 - PLACE
      ?auto_19970 - HOIST
      ?auto_19966 - SURFACE
      ?auto_19964 - TRUCK
      ?auto_19972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19968 ?auto_19962 ) ( IS-CRATE ?auto_19960 ) ( not ( = ?auto_19960 ?auto_19961 ) ) ( not ( = ?auto_19963 ?auto_19962 ) ) ( HOIST-AT ?auto_19967 ?auto_19963 ) ( not ( = ?auto_19968 ?auto_19967 ) ) ( AVAILABLE ?auto_19967 ) ( SURFACE-AT ?auto_19960 ?auto_19963 ) ( ON ?auto_19960 ?auto_19965 ) ( CLEAR ?auto_19960 ) ( not ( = ?auto_19960 ?auto_19965 ) ) ( not ( = ?auto_19961 ?auto_19965 ) ) ( IS-CRATE ?auto_19961 ) ( not ( = ?auto_19960 ?auto_19971 ) ) ( not ( = ?auto_19961 ?auto_19971 ) ) ( not ( = ?auto_19965 ?auto_19971 ) ) ( not ( = ?auto_19969 ?auto_19962 ) ) ( not ( = ?auto_19963 ?auto_19969 ) ) ( HOIST-AT ?auto_19970 ?auto_19969 ) ( not ( = ?auto_19968 ?auto_19970 ) ) ( not ( = ?auto_19967 ?auto_19970 ) ) ( AVAILABLE ?auto_19970 ) ( SURFACE-AT ?auto_19961 ?auto_19969 ) ( ON ?auto_19961 ?auto_19966 ) ( CLEAR ?auto_19961 ) ( not ( = ?auto_19960 ?auto_19966 ) ) ( not ( = ?auto_19961 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19971 ?auto_19966 ) ) ( TRUCK-AT ?auto_19964 ?auto_19962 ) ( SURFACE-AT ?auto_19972 ?auto_19962 ) ( CLEAR ?auto_19972 ) ( IS-CRATE ?auto_19971 ) ( not ( = ?auto_19960 ?auto_19972 ) ) ( not ( = ?auto_19961 ?auto_19972 ) ) ( not ( = ?auto_19965 ?auto_19972 ) ) ( not ( = ?auto_19971 ?auto_19972 ) ) ( not ( = ?auto_19966 ?auto_19972 ) ) ( AVAILABLE ?auto_19968 ) ( IN ?auto_19971 ?auto_19964 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19968 ?auto_19971 ?auto_19964 ?auto_19962 )
      ( MAKE-ON ?auto_19960 ?auto_19961 )
      ( MAKE-ON-VERIFY ?auto_19960 ?auto_19961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19973 - SURFACE
      ?auto_19974 - SURFACE
    )
    :vars
    (
      ?auto_19982 - HOIST
      ?auto_19985 - PLACE
      ?auto_19978 - PLACE
      ?auto_19976 - HOIST
      ?auto_19977 - SURFACE
      ?auto_19983 - SURFACE
      ?auto_19984 - PLACE
      ?auto_19981 - HOIST
      ?auto_19979 - SURFACE
      ?auto_19980 - SURFACE
      ?auto_19975 - TRUCK
      ?auto_19986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19982 ?auto_19985 ) ( IS-CRATE ?auto_19973 ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19978 ?auto_19985 ) ) ( HOIST-AT ?auto_19976 ?auto_19978 ) ( not ( = ?auto_19982 ?auto_19976 ) ) ( AVAILABLE ?auto_19976 ) ( SURFACE-AT ?auto_19973 ?auto_19978 ) ( ON ?auto_19973 ?auto_19977 ) ( CLEAR ?auto_19973 ) ( not ( = ?auto_19973 ?auto_19977 ) ) ( not ( = ?auto_19974 ?auto_19977 ) ) ( IS-CRATE ?auto_19974 ) ( not ( = ?auto_19973 ?auto_19983 ) ) ( not ( = ?auto_19974 ?auto_19983 ) ) ( not ( = ?auto_19977 ?auto_19983 ) ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( not ( = ?auto_19978 ?auto_19984 ) ) ( HOIST-AT ?auto_19981 ?auto_19984 ) ( not ( = ?auto_19982 ?auto_19981 ) ) ( not ( = ?auto_19976 ?auto_19981 ) ) ( AVAILABLE ?auto_19981 ) ( SURFACE-AT ?auto_19974 ?auto_19984 ) ( ON ?auto_19974 ?auto_19979 ) ( CLEAR ?auto_19974 ) ( not ( = ?auto_19973 ?auto_19979 ) ) ( not ( = ?auto_19974 ?auto_19979 ) ) ( not ( = ?auto_19977 ?auto_19979 ) ) ( not ( = ?auto_19983 ?auto_19979 ) ) ( SURFACE-AT ?auto_19980 ?auto_19985 ) ( CLEAR ?auto_19980 ) ( IS-CRATE ?auto_19983 ) ( not ( = ?auto_19973 ?auto_19980 ) ) ( not ( = ?auto_19974 ?auto_19980 ) ) ( not ( = ?auto_19977 ?auto_19980 ) ) ( not ( = ?auto_19983 ?auto_19980 ) ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( AVAILABLE ?auto_19982 ) ( IN ?auto_19983 ?auto_19975 ) ( TRUCK-AT ?auto_19975 ?auto_19986 ) ( not ( = ?auto_19986 ?auto_19985 ) ) ( not ( = ?auto_19978 ?auto_19986 ) ) ( not ( = ?auto_19984 ?auto_19986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19975 ?auto_19986 ?auto_19985 )
      ( MAKE-ON ?auto_19973 ?auto_19974 )
      ( MAKE-ON-VERIFY ?auto_19973 ?auto_19974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_19987 - SURFACE
      ?auto_19988 - SURFACE
    )
    :vars
    (
      ?auto_19996 - HOIST
      ?auto_19992 - PLACE
      ?auto_19991 - PLACE
      ?auto_19989 - HOIST
      ?auto_19998 - SURFACE
      ?auto_19993 - SURFACE
      ?auto_19997 - PLACE
      ?auto_19999 - HOIST
      ?auto_19994 - SURFACE
      ?auto_19995 - SURFACE
      ?auto_19990 - TRUCK
      ?auto_20000 - PLACE
      ?auto_20001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19996 ?auto_19992 ) ( IS-CRATE ?auto_19987 ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( HOIST-AT ?auto_19989 ?auto_19991 ) ( not ( = ?auto_19996 ?auto_19989 ) ) ( AVAILABLE ?auto_19989 ) ( SURFACE-AT ?auto_19987 ?auto_19991 ) ( ON ?auto_19987 ?auto_19998 ) ( CLEAR ?auto_19987 ) ( not ( = ?auto_19987 ?auto_19998 ) ) ( not ( = ?auto_19988 ?auto_19998 ) ) ( IS-CRATE ?auto_19988 ) ( not ( = ?auto_19987 ?auto_19993 ) ) ( not ( = ?auto_19988 ?auto_19993 ) ) ( not ( = ?auto_19998 ?auto_19993 ) ) ( not ( = ?auto_19997 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19997 ) ) ( HOIST-AT ?auto_19999 ?auto_19997 ) ( not ( = ?auto_19996 ?auto_19999 ) ) ( not ( = ?auto_19989 ?auto_19999 ) ) ( AVAILABLE ?auto_19999 ) ( SURFACE-AT ?auto_19988 ?auto_19997 ) ( ON ?auto_19988 ?auto_19994 ) ( CLEAR ?auto_19988 ) ( not ( = ?auto_19987 ?auto_19994 ) ) ( not ( = ?auto_19988 ?auto_19994 ) ) ( not ( = ?auto_19998 ?auto_19994 ) ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( SURFACE-AT ?auto_19995 ?auto_19992 ) ( CLEAR ?auto_19995 ) ( IS-CRATE ?auto_19993 ) ( not ( = ?auto_19987 ?auto_19995 ) ) ( not ( = ?auto_19988 ?auto_19995 ) ) ( not ( = ?auto_19998 ?auto_19995 ) ) ( not ( = ?auto_19993 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_19995 ) ) ( AVAILABLE ?auto_19996 ) ( TRUCK-AT ?auto_19990 ?auto_20000 ) ( not ( = ?auto_20000 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_20000 ) ) ( not ( = ?auto_19997 ?auto_20000 ) ) ( HOIST-AT ?auto_20001 ?auto_20000 ) ( LIFTING ?auto_20001 ?auto_19993 ) ( not ( = ?auto_19996 ?auto_20001 ) ) ( not ( = ?auto_19989 ?auto_20001 ) ) ( not ( = ?auto_19999 ?auto_20001 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20001 ?auto_19993 ?auto_19990 ?auto_20000 )
      ( MAKE-ON ?auto_19987 ?auto_19988 )
      ( MAKE-ON-VERIFY ?auto_19987 ?auto_19988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20002 - SURFACE
      ?auto_20003 - SURFACE
    )
    :vars
    (
      ?auto_20006 - HOIST
      ?auto_20009 - PLACE
      ?auto_20012 - PLACE
      ?auto_20005 - HOIST
      ?auto_20011 - SURFACE
      ?auto_20007 - SURFACE
      ?auto_20015 - PLACE
      ?auto_20008 - HOIST
      ?auto_20016 - SURFACE
      ?auto_20014 - SURFACE
      ?auto_20010 - TRUCK
      ?auto_20004 - PLACE
      ?auto_20013 - HOIST
      ?auto_20017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20006 ?auto_20009 ) ( IS-CRATE ?auto_20002 ) ( not ( = ?auto_20002 ?auto_20003 ) ) ( not ( = ?auto_20012 ?auto_20009 ) ) ( HOIST-AT ?auto_20005 ?auto_20012 ) ( not ( = ?auto_20006 ?auto_20005 ) ) ( AVAILABLE ?auto_20005 ) ( SURFACE-AT ?auto_20002 ?auto_20012 ) ( ON ?auto_20002 ?auto_20011 ) ( CLEAR ?auto_20002 ) ( not ( = ?auto_20002 ?auto_20011 ) ) ( not ( = ?auto_20003 ?auto_20011 ) ) ( IS-CRATE ?auto_20003 ) ( not ( = ?auto_20002 ?auto_20007 ) ) ( not ( = ?auto_20003 ?auto_20007 ) ) ( not ( = ?auto_20011 ?auto_20007 ) ) ( not ( = ?auto_20015 ?auto_20009 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( HOIST-AT ?auto_20008 ?auto_20015 ) ( not ( = ?auto_20006 ?auto_20008 ) ) ( not ( = ?auto_20005 ?auto_20008 ) ) ( AVAILABLE ?auto_20008 ) ( SURFACE-AT ?auto_20003 ?auto_20015 ) ( ON ?auto_20003 ?auto_20016 ) ( CLEAR ?auto_20003 ) ( not ( = ?auto_20002 ?auto_20016 ) ) ( not ( = ?auto_20003 ?auto_20016 ) ) ( not ( = ?auto_20011 ?auto_20016 ) ) ( not ( = ?auto_20007 ?auto_20016 ) ) ( SURFACE-AT ?auto_20014 ?auto_20009 ) ( CLEAR ?auto_20014 ) ( IS-CRATE ?auto_20007 ) ( not ( = ?auto_20002 ?auto_20014 ) ) ( not ( = ?auto_20003 ?auto_20014 ) ) ( not ( = ?auto_20011 ?auto_20014 ) ) ( not ( = ?auto_20007 ?auto_20014 ) ) ( not ( = ?auto_20016 ?auto_20014 ) ) ( AVAILABLE ?auto_20006 ) ( TRUCK-AT ?auto_20010 ?auto_20004 ) ( not ( = ?auto_20004 ?auto_20009 ) ) ( not ( = ?auto_20012 ?auto_20004 ) ) ( not ( = ?auto_20015 ?auto_20004 ) ) ( HOIST-AT ?auto_20013 ?auto_20004 ) ( not ( = ?auto_20006 ?auto_20013 ) ) ( not ( = ?auto_20005 ?auto_20013 ) ) ( not ( = ?auto_20008 ?auto_20013 ) ) ( AVAILABLE ?auto_20013 ) ( SURFACE-AT ?auto_20007 ?auto_20004 ) ( ON ?auto_20007 ?auto_20017 ) ( CLEAR ?auto_20007 ) ( not ( = ?auto_20002 ?auto_20017 ) ) ( not ( = ?auto_20003 ?auto_20017 ) ) ( not ( = ?auto_20011 ?auto_20017 ) ) ( not ( = ?auto_20007 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20013 ?auto_20007 ?auto_20017 ?auto_20004 )
      ( MAKE-ON ?auto_20002 ?auto_20003 )
      ( MAKE-ON-VERIFY ?auto_20002 ?auto_20003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20018 - SURFACE
      ?auto_20019 - SURFACE
    )
    :vars
    (
      ?auto_20025 - HOIST
      ?auto_20027 - PLACE
      ?auto_20031 - PLACE
      ?auto_20026 - HOIST
      ?auto_20021 - SURFACE
      ?auto_20030 - SURFACE
      ?auto_20028 - PLACE
      ?auto_20020 - HOIST
      ?auto_20023 - SURFACE
      ?auto_20029 - SURFACE
      ?auto_20032 - PLACE
      ?auto_20024 - HOIST
      ?auto_20033 - SURFACE
      ?auto_20022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20025 ?auto_20027 ) ( IS-CRATE ?auto_20018 ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20031 ?auto_20027 ) ) ( HOIST-AT ?auto_20026 ?auto_20031 ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( AVAILABLE ?auto_20026 ) ( SURFACE-AT ?auto_20018 ?auto_20031 ) ( ON ?auto_20018 ?auto_20021 ) ( CLEAR ?auto_20018 ) ( not ( = ?auto_20018 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( IS-CRATE ?auto_20019 ) ( not ( = ?auto_20018 ?auto_20030 ) ) ( not ( = ?auto_20019 ?auto_20030 ) ) ( not ( = ?auto_20021 ?auto_20030 ) ) ( not ( = ?auto_20028 ?auto_20027 ) ) ( not ( = ?auto_20031 ?auto_20028 ) ) ( HOIST-AT ?auto_20020 ?auto_20028 ) ( not ( = ?auto_20025 ?auto_20020 ) ) ( not ( = ?auto_20026 ?auto_20020 ) ) ( AVAILABLE ?auto_20020 ) ( SURFACE-AT ?auto_20019 ?auto_20028 ) ( ON ?auto_20019 ?auto_20023 ) ( CLEAR ?auto_20019 ) ( not ( = ?auto_20018 ?auto_20023 ) ) ( not ( = ?auto_20019 ?auto_20023 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20030 ?auto_20023 ) ) ( SURFACE-AT ?auto_20029 ?auto_20027 ) ( CLEAR ?auto_20029 ) ( IS-CRATE ?auto_20030 ) ( not ( = ?auto_20018 ?auto_20029 ) ) ( not ( = ?auto_20019 ?auto_20029 ) ) ( not ( = ?auto_20021 ?auto_20029 ) ) ( not ( = ?auto_20030 ?auto_20029 ) ) ( not ( = ?auto_20023 ?auto_20029 ) ) ( AVAILABLE ?auto_20025 ) ( not ( = ?auto_20032 ?auto_20027 ) ) ( not ( = ?auto_20031 ?auto_20032 ) ) ( not ( = ?auto_20028 ?auto_20032 ) ) ( HOIST-AT ?auto_20024 ?auto_20032 ) ( not ( = ?auto_20025 ?auto_20024 ) ) ( not ( = ?auto_20026 ?auto_20024 ) ) ( not ( = ?auto_20020 ?auto_20024 ) ) ( AVAILABLE ?auto_20024 ) ( SURFACE-AT ?auto_20030 ?auto_20032 ) ( ON ?auto_20030 ?auto_20033 ) ( CLEAR ?auto_20030 ) ( not ( = ?auto_20018 ?auto_20033 ) ) ( not ( = ?auto_20019 ?auto_20033 ) ) ( not ( = ?auto_20021 ?auto_20033 ) ) ( not ( = ?auto_20030 ?auto_20033 ) ) ( not ( = ?auto_20023 ?auto_20033 ) ) ( not ( = ?auto_20029 ?auto_20033 ) ) ( TRUCK-AT ?auto_20022 ?auto_20027 ) )
    :subtasks
    ( ( !DRIVE ?auto_20022 ?auto_20027 ?auto_20032 )
      ( MAKE-ON ?auto_20018 ?auto_20019 )
      ( MAKE-ON-VERIFY ?auto_20018 ?auto_20019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20034 - SURFACE
      ?auto_20035 - SURFACE
    )
    :vars
    (
      ?auto_20036 - HOIST
      ?auto_20037 - PLACE
      ?auto_20045 - PLACE
      ?auto_20042 - HOIST
      ?auto_20044 - SURFACE
      ?auto_20038 - SURFACE
      ?auto_20048 - PLACE
      ?auto_20049 - HOIST
      ?auto_20047 - SURFACE
      ?auto_20039 - SURFACE
      ?auto_20041 - PLACE
      ?auto_20040 - HOIST
      ?auto_20046 - SURFACE
      ?auto_20043 - TRUCK
      ?auto_20050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20036 ?auto_20037 ) ( IS-CRATE ?auto_20034 ) ( not ( = ?auto_20034 ?auto_20035 ) ) ( not ( = ?auto_20045 ?auto_20037 ) ) ( HOIST-AT ?auto_20042 ?auto_20045 ) ( not ( = ?auto_20036 ?auto_20042 ) ) ( AVAILABLE ?auto_20042 ) ( SURFACE-AT ?auto_20034 ?auto_20045 ) ( ON ?auto_20034 ?auto_20044 ) ( CLEAR ?auto_20034 ) ( not ( = ?auto_20034 ?auto_20044 ) ) ( not ( = ?auto_20035 ?auto_20044 ) ) ( IS-CRATE ?auto_20035 ) ( not ( = ?auto_20034 ?auto_20038 ) ) ( not ( = ?auto_20035 ?auto_20038 ) ) ( not ( = ?auto_20044 ?auto_20038 ) ) ( not ( = ?auto_20048 ?auto_20037 ) ) ( not ( = ?auto_20045 ?auto_20048 ) ) ( HOIST-AT ?auto_20049 ?auto_20048 ) ( not ( = ?auto_20036 ?auto_20049 ) ) ( not ( = ?auto_20042 ?auto_20049 ) ) ( AVAILABLE ?auto_20049 ) ( SURFACE-AT ?auto_20035 ?auto_20048 ) ( ON ?auto_20035 ?auto_20047 ) ( CLEAR ?auto_20035 ) ( not ( = ?auto_20034 ?auto_20047 ) ) ( not ( = ?auto_20035 ?auto_20047 ) ) ( not ( = ?auto_20044 ?auto_20047 ) ) ( not ( = ?auto_20038 ?auto_20047 ) ) ( IS-CRATE ?auto_20038 ) ( not ( = ?auto_20034 ?auto_20039 ) ) ( not ( = ?auto_20035 ?auto_20039 ) ) ( not ( = ?auto_20044 ?auto_20039 ) ) ( not ( = ?auto_20038 ?auto_20039 ) ) ( not ( = ?auto_20047 ?auto_20039 ) ) ( not ( = ?auto_20041 ?auto_20037 ) ) ( not ( = ?auto_20045 ?auto_20041 ) ) ( not ( = ?auto_20048 ?auto_20041 ) ) ( HOIST-AT ?auto_20040 ?auto_20041 ) ( not ( = ?auto_20036 ?auto_20040 ) ) ( not ( = ?auto_20042 ?auto_20040 ) ) ( not ( = ?auto_20049 ?auto_20040 ) ) ( AVAILABLE ?auto_20040 ) ( SURFACE-AT ?auto_20038 ?auto_20041 ) ( ON ?auto_20038 ?auto_20046 ) ( CLEAR ?auto_20038 ) ( not ( = ?auto_20034 ?auto_20046 ) ) ( not ( = ?auto_20035 ?auto_20046 ) ) ( not ( = ?auto_20044 ?auto_20046 ) ) ( not ( = ?auto_20038 ?auto_20046 ) ) ( not ( = ?auto_20047 ?auto_20046 ) ) ( not ( = ?auto_20039 ?auto_20046 ) ) ( TRUCK-AT ?auto_20043 ?auto_20037 ) ( SURFACE-AT ?auto_20050 ?auto_20037 ) ( CLEAR ?auto_20050 ) ( LIFTING ?auto_20036 ?auto_20039 ) ( IS-CRATE ?auto_20039 ) ( not ( = ?auto_20034 ?auto_20050 ) ) ( not ( = ?auto_20035 ?auto_20050 ) ) ( not ( = ?auto_20044 ?auto_20050 ) ) ( not ( = ?auto_20038 ?auto_20050 ) ) ( not ( = ?auto_20047 ?auto_20050 ) ) ( not ( = ?auto_20039 ?auto_20050 ) ) ( not ( = ?auto_20046 ?auto_20050 ) ) )
    :subtasks
    ( ( !DROP ?auto_20036 ?auto_20039 ?auto_20050 ?auto_20037 )
      ( MAKE-ON ?auto_20034 ?auto_20035 )
      ( MAKE-ON-VERIFY ?auto_20034 ?auto_20035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20051 - SURFACE
      ?auto_20052 - SURFACE
    )
    :vars
    (
      ?auto_20058 - HOIST
      ?auto_20064 - PLACE
      ?auto_20059 - PLACE
      ?auto_20066 - HOIST
      ?auto_20055 - SURFACE
      ?auto_20057 - SURFACE
      ?auto_20053 - PLACE
      ?auto_20063 - HOIST
      ?auto_20056 - SURFACE
      ?auto_20065 - SURFACE
      ?auto_20062 - PLACE
      ?auto_20060 - HOIST
      ?auto_20054 - SURFACE
      ?auto_20061 - TRUCK
      ?auto_20067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20058 ?auto_20064 ) ( IS-CRATE ?auto_20051 ) ( not ( = ?auto_20051 ?auto_20052 ) ) ( not ( = ?auto_20059 ?auto_20064 ) ) ( HOIST-AT ?auto_20066 ?auto_20059 ) ( not ( = ?auto_20058 ?auto_20066 ) ) ( AVAILABLE ?auto_20066 ) ( SURFACE-AT ?auto_20051 ?auto_20059 ) ( ON ?auto_20051 ?auto_20055 ) ( CLEAR ?auto_20051 ) ( not ( = ?auto_20051 ?auto_20055 ) ) ( not ( = ?auto_20052 ?auto_20055 ) ) ( IS-CRATE ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20057 ) ) ( not ( = ?auto_20052 ?auto_20057 ) ) ( not ( = ?auto_20055 ?auto_20057 ) ) ( not ( = ?auto_20053 ?auto_20064 ) ) ( not ( = ?auto_20059 ?auto_20053 ) ) ( HOIST-AT ?auto_20063 ?auto_20053 ) ( not ( = ?auto_20058 ?auto_20063 ) ) ( not ( = ?auto_20066 ?auto_20063 ) ) ( AVAILABLE ?auto_20063 ) ( SURFACE-AT ?auto_20052 ?auto_20053 ) ( ON ?auto_20052 ?auto_20056 ) ( CLEAR ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20056 ) ) ( not ( = ?auto_20052 ?auto_20056 ) ) ( not ( = ?auto_20055 ?auto_20056 ) ) ( not ( = ?auto_20057 ?auto_20056 ) ) ( IS-CRATE ?auto_20057 ) ( not ( = ?auto_20051 ?auto_20065 ) ) ( not ( = ?auto_20052 ?auto_20065 ) ) ( not ( = ?auto_20055 ?auto_20065 ) ) ( not ( = ?auto_20057 ?auto_20065 ) ) ( not ( = ?auto_20056 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20059 ?auto_20062 ) ) ( not ( = ?auto_20053 ?auto_20062 ) ) ( HOIST-AT ?auto_20060 ?auto_20062 ) ( not ( = ?auto_20058 ?auto_20060 ) ) ( not ( = ?auto_20066 ?auto_20060 ) ) ( not ( = ?auto_20063 ?auto_20060 ) ) ( AVAILABLE ?auto_20060 ) ( SURFACE-AT ?auto_20057 ?auto_20062 ) ( ON ?auto_20057 ?auto_20054 ) ( CLEAR ?auto_20057 ) ( not ( = ?auto_20051 ?auto_20054 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( not ( = ?auto_20055 ?auto_20054 ) ) ( not ( = ?auto_20057 ?auto_20054 ) ) ( not ( = ?auto_20056 ?auto_20054 ) ) ( not ( = ?auto_20065 ?auto_20054 ) ) ( TRUCK-AT ?auto_20061 ?auto_20064 ) ( SURFACE-AT ?auto_20067 ?auto_20064 ) ( CLEAR ?auto_20067 ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20051 ?auto_20067 ) ) ( not ( = ?auto_20052 ?auto_20067 ) ) ( not ( = ?auto_20055 ?auto_20067 ) ) ( not ( = ?auto_20057 ?auto_20067 ) ) ( not ( = ?auto_20056 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20054 ?auto_20067 ) ) ( AVAILABLE ?auto_20058 ) ( IN ?auto_20065 ?auto_20061 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20058 ?auto_20065 ?auto_20061 ?auto_20064 )
      ( MAKE-ON ?auto_20051 ?auto_20052 )
      ( MAKE-ON-VERIFY ?auto_20051 ?auto_20052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20068 - SURFACE
      ?auto_20069 - SURFACE
    )
    :vars
    (
      ?auto_20082 - HOIST
      ?auto_20077 - PLACE
      ?auto_20083 - PLACE
      ?auto_20071 - HOIST
      ?auto_20081 - SURFACE
      ?auto_20072 - SURFACE
      ?auto_20079 - PLACE
      ?auto_20074 - HOIST
      ?auto_20080 - SURFACE
      ?auto_20076 - SURFACE
      ?auto_20070 - PLACE
      ?auto_20075 - HOIST
      ?auto_20073 - SURFACE
      ?auto_20078 - SURFACE
      ?auto_20084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20082 ?auto_20077 ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( not ( = ?auto_20083 ?auto_20077 ) ) ( HOIST-AT ?auto_20071 ?auto_20083 ) ( not ( = ?auto_20082 ?auto_20071 ) ) ( AVAILABLE ?auto_20071 ) ( SURFACE-AT ?auto_20068 ?auto_20083 ) ( ON ?auto_20068 ?auto_20081 ) ( CLEAR ?auto_20068 ) ( not ( = ?auto_20068 ?auto_20081 ) ) ( not ( = ?auto_20069 ?auto_20081 ) ) ( IS-CRATE ?auto_20069 ) ( not ( = ?auto_20068 ?auto_20072 ) ) ( not ( = ?auto_20069 ?auto_20072 ) ) ( not ( = ?auto_20081 ?auto_20072 ) ) ( not ( = ?auto_20079 ?auto_20077 ) ) ( not ( = ?auto_20083 ?auto_20079 ) ) ( HOIST-AT ?auto_20074 ?auto_20079 ) ( not ( = ?auto_20082 ?auto_20074 ) ) ( not ( = ?auto_20071 ?auto_20074 ) ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20069 ?auto_20079 ) ( ON ?auto_20069 ?auto_20080 ) ( CLEAR ?auto_20069 ) ( not ( = ?auto_20068 ?auto_20080 ) ) ( not ( = ?auto_20069 ?auto_20080 ) ) ( not ( = ?auto_20081 ?auto_20080 ) ) ( not ( = ?auto_20072 ?auto_20080 ) ) ( IS-CRATE ?auto_20072 ) ( not ( = ?auto_20068 ?auto_20076 ) ) ( not ( = ?auto_20069 ?auto_20076 ) ) ( not ( = ?auto_20081 ?auto_20076 ) ) ( not ( = ?auto_20072 ?auto_20076 ) ) ( not ( = ?auto_20080 ?auto_20076 ) ) ( not ( = ?auto_20070 ?auto_20077 ) ) ( not ( = ?auto_20083 ?auto_20070 ) ) ( not ( = ?auto_20079 ?auto_20070 ) ) ( HOIST-AT ?auto_20075 ?auto_20070 ) ( not ( = ?auto_20082 ?auto_20075 ) ) ( not ( = ?auto_20071 ?auto_20075 ) ) ( not ( = ?auto_20074 ?auto_20075 ) ) ( AVAILABLE ?auto_20075 ) ( SURFACE-AT ?auto_20072 ?auto_20070 ) ( ON ?auto_20072 ?auto_20073 ) ( CLEAR ?auto_20072 ) ( not ( = ?auto_20068 ?auto_20073 ) ) ( not ( = ?auto_20069 ?auto_20073 ) ) ( not ( = ?auto_20081 ?auto_20073 ) ) ( not ( = ?auto_20072 ?auto_20073 ) ) ( not ( = ?auto_20080 ?auto_20073 ) ) ( not ( = ?auto_20076 ?auto_20073 ) ) ( SURFACE-AT ?auto_20078 ?auto_20077 ) ( CLEAR ?auto_20078 ) ( IS-CRATE ?auto_20076 ) ( not ( = ?auto_20068 ?auto_20078 ) ) ( not ( = ?auto_20069 ?auto_20078 ) ) ( not ( = ?auto_20081 ?auto_20078 ) ) ( not ( = ?auto_20072 ?auto_20078 ) ) ( not ( = ?auto_20080 ?auto_20078 ) ) ( not ( = ?auto_20076 ?auto_20078 ) ) ( not ( = ?auto_20073 ?auto_20078 ) ) ( AVAILABLE ?auto_20082 ) ( IN ?auto_20076 ?auto_20084 ) ( TRUCK-AT ?auto_20084 ?auto_20083 ) )
    :subtasks
    ( ( !DRIVE ?auto_20084 ?auto_20083 ?auto_20077 )
      ( MAKE-ON ?auto_20068 ?auto_20069 )
      ( MAKE-ON-VERIFY ?auto_20068 ?auto_20069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20085 - SURFACE
      ?auto_20086 - SURFACE
    )
    :vars
    (
      ?auto_20087 - HOIST
      ?auto_20093 - PLACE
      ?auto_20089 - PLACE
      ?auto_20096 - HOIST
      ?auto_20090 - SURFACE
      ?auto_20095 - SURFACE
      ?auto_20092 - PLACE
      ?auto_20091 - HOIST
      ?auto_20097 - SURFACE
      ?auto_20099 - SURFACE
      ?auto_20101 - PLACE
      ?auto_20088 - HOIST
      ?auto_20098 - SURFACE
      ?auto_20100 - SURFACE
      ?auto_20094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20087 ?auto_20093 ) ( IS-CRATE ?auto_20085 ) ( not ( = ?auto_20085 ?auto_20086 ) ) ( not ( = ?auto_20089 ?auto_20093 ) ) ( HOIST-AT ?auto_20096 ?auto_20089 ) ( not ( = ?auto_20087 ?auto_20096 ) ) ( SURFACE-AT ?auto_20085 ?auto_20089 ) ( ON ?auto_20085 ?auto_20090 ) ( CLEAR ?auto_20085 ) ( not ( = ?auto_20085 ?auto_20090 ) ) ( not ( = ?auto_20086 ?auto_20090 ) ) ( IS-CRATE ?auto_20086 ) ( not ( = ?auto_20085 ?auto_20095 ) ) ( not ( = ?auto_20086 ?auto_20095 ) ) ( not ( = ?auto_20090 ?auto_20095 ) ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( not ( = ?auto_20089 ?auto_20092 ) ) ( HOIST-AT ?auto_20091 ?auto_20092 ) ( not ( = ?auto_20087 ?auto_20091 ) ) ( not ( = ?auto_20096 ?auto_20091 ) ) ( AVAILABLE ?auto_20091 ) ( SURFACE-AT ?auto_20086 ?auto_20092 ) ( ON ?auto_20086 ?auto_20097 ) ( CLEAR ?auto_20086 ) ( not ( = ?auto_20085 ?auto_20097 ) ) ( not ( = ?auto_20086 ?auto_20097 ) ) ( not ( = ?auto_20090 ?auto_20097 ) ) ( not ( = ?auto_20095 ?auto_20097 ) ) ( IS-CRATE ?auto_20095 ) ( not ( = ?auto_20085 ?auto_20099 ) ) ( not ( = ?auto_20086 ?auto_20099 ) ) ( not ( = ?auto_20090 ?auto_20099 ) ) ( not ( = ?auto_20095 ?auto_20099 ) ) ( not ( = ?auto_20097 ?auto_20099 ) ) ( not ( = ?auto_20101 ?auto_20093 ) ) ( not ( = ?auto_20089 ?auto_20101 ) ) ( not ( = ?auto_20092 ?auto_20101 ) ) ( HOIST-AT ?auto_20088 ?auto_20101 ) ( not ( = ?auto_20087 ?auto_20088 ) ) ( not ( = ?auto_20096 ?auto_20088 ) ) ( not ( = ?auto_20091 ?auto_20088 ) ) ( AVAILABLE ?auto_20088 ) ( SURFACE-AT ?auto_20095 ?auto_20101 ) ( ON ?auto_20095 ?auto_20098 ) ( CLEAR ?auto_20095 ) ( not ( = ?auto_20085 ?auto_20098 ) ) ( not ( = ?auto_20086 ?auto_20098 ) ) ( not ( = ?auto_20090 ?auto_20098 ) ) ( not ( = ?auto_20095 ?auto_20098 ) ) ( not ( = ?auto_20097 ?auto_20098 ) ) ( not ( = ?auto_20099 ?auto_20098 ) ) ( SURFACE-AT ?auto_20100 ?auto_20093 ) ( CLEAR ?auto_20100 ) ( IS-CRATE ?auto_20099 ) ( not ( = ?auto_20085 ?auto_20100 ) ) ( not ( = ?auto_20086 ?auto_20100 ) ) ( not ( = ?auto_20090 ?auto_20100 ) ) ( not ( = ?auto_20095 ?auto_20100 ) ) ( not ( = ?auto_20097 ?auto_20100 ) ) ( not ( = ?auto_20099 ?auto_20100 ) ) ( not ( = ?auto_20098 ?auto_20100 ) ) ( AVAILABLE ?auto_20087 ) ( TRUCK-AT ?auto_20094 ?auto_20089 ) ( LIFTING ?auto_20096 ?auto_20099 ) )
    :subtasks
    ( ( !LOAD ?auto_20096 ?auto_20099 ?auto_20094 ?auto_20089 )
      ( MAKE-ON ?auto_20085 ?auto_20086 )
      ( MAKE-ON-VERIFY ?auto_20085 ?auto_20086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20102 - SURFACE
      ?auto_20103 - SURFACE
    )
    :vars
    (
      ?auto_20110 - HOIST
      ?auto_20105 - PLACE
      ?auto_20107 - PLACE
      ?auto_20116 - HOIST
      ?auto_20109 - SURFACE
      ?auto_20112 - SURFACE
      ?auto_20104 - PLACE
      ?auto_20114 - HOIST
      ?auto_20115 - SURFACE
      ?auto_20118 - SURFACE
      ?auto_20111 - PLACE
      ?auto_20108 - HOIST
      ?auto_20117 - SURFACE
      ?auto_20113 - SURFACE
      ?auto_20106 - TRUCK
      ?auto_20119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20110 ?auto_20105 ) ( IS-CRATE ?auto_20102 ) ( not ( = ?auto_20102 ?auto_20103 ) ) ( not ( = ?auto_20107 ?auto_20105 ) ) ( HOIST-AT ?auto_20116 ?auto_20107 ) ( not ( = ?auto_20110 ?auto_20116 ) ) ( SURFACE-AT ?auto_20102 ?auto_20107 ) ( ON ?auto_20102 ?auto_20109 ) ( CLEAR ?auto_20102 ) ( not ( = ?auto_20102 ?auto_20109 ) ) ( not ( = ?auto_20103 ?auto_20109 ) ) ( IS-CRATE ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20112 ) ) ( not ( = ?auto_20103 ?auto_20112 ) ) ( not ( = ?auto_20109 ?auto_20112 ) ) ( not ( = ?auto_20104 ?auto_20105 ) ) ( not ( = ?auto_20107 ?auto_20104 ) ) ( HOIST-AT ?auto_20114 ?auto_20104 ) ( not ( = ?auto_20110 ?auto_20114 ) ) ( not ( = ?auto_20116 ?auto_20114 ) ) ( AVAILABLE ?auto_20114 ) ( SURFACE-AT ?auto_20103 ?auto_20104 ) ( ON ?auto_20103 ?auto_20115 ) ( CLEAR ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20115 ) ) ( not ( = ?auto_20103 ?auto_20115 ) ) ( not ( = ?auto_20109 ?auto_20115 ) ) ( not ( = ?auto_20112 ?auto_20115 ) ) ( IS-CRATE ?auto_20112 ) ( not ( = ?auto_20102 ?auto_20118 ) ) ( not ( = ?auto_20103 ?auto_20118 ) ) ( not ( = ?auto_20109 ?auto_20118 ) ) ( not ( = ?auto_20112 ?auto_20118 ) ) ( not ( = ?auto_20115 ?auto_20118 ) ) ( not ( = ?auto_20111 ?auto_20105 ) ) ( not ( = ?auto_20107 ?auto_20111 ) ) ( not ( = ?auto_20104 ?auto_20111 ) ) ( HOIST-AT ?auto_20108 ?auto_20111 ) ( not ( = ?auto_20110 ?auto_20108 ) ) ( not ( = ?auto_20116 ?auto_20108 ) ) ( not ( = ?auto_20114 ?auto_20108 ) ) ( AVAILABLE ?auto_20108 ) ( SURFACE-AT ?auto_20112 ?auto_20111 ) ( ON ?auto_20112 ?auto_20117 ) ( CLEAR ?auto_20112 ) ( not ( = ?auto_20102 ?auto_20117 ) ) ( not ( = ?auto_20103 ?auto_20117 ) ) ( not ( = ?auto_20109 ?auto_20117 ) ) ( not ( = ?auto_20112 ?auto_20117 ) ) ( not ( = ?auto_20115 ?auto_20117 ) ) ( not ( = ?auto_20118 ?auto_20117 ) ) ( SURFACE-AT ?auto_20113 ?auto_20105 ) ( CLEAR ?auto_20113 ) ( IS-CRATE ?auto_20118 ) ( not ( = ?auto_20102 ?auto_20113 ) ) ( not ( = ?auto_20103 ?auto_20113 ) ) ( not ( = ?auto_20109 ?auto_20113 ) ) ( not ( = ?auto_20112 ?auto_20113 ) ) ( not ( = ?auto_20115 ?auto_20113 ) ) ( not ( = ?auto_20118 ?auto_20113 ) ) ( not ( = ?auto_20117 ?auto_20113 ) ) ( AVAILABLE ?auto_20110 ) ( TRUCK-AT ?auto_20106 ?auto_20107 ) ( AVAILABLE ?auto_20116 ) ( SURFACE-AT ?auto_20118 ?auto_20107 ) ( ON ?auto_20118 ?auto_20119 ) ( CLEAR ?auto_20118 ) ( not ( = ?auto_20102 ?auto_20119 ) ) ( not ( = ?auto_20103 ?auto_20119 ) ) ( not ( = ?auto_20109 ?auto_20119 ) ) ( not ( = ?auto_20112 ?auto_20119 ) ) ( not ( = ?auto_20115 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20117 ?auto_20119 ) ) ( not ( = ?auto_20113 ?auto_20119 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20116 ?auto_20118 ?auto_20119 ?auto_20107 )
      ( MAKE-ON ?auto_20102 ?auto_20103 )
      ( MAKE-ON-VERIFY ?auto_20102 ?auto_20103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
    )
    :vars
    (
      ?auto_20134 - HOIST
      ?auto_20126 - PLACE
      ?auto_20125 - PLACE
      ?auto_20136 - HOIST
      ?auto_20123 - SURFACE
      ?auto_20129 - SURFACE
      ?auto_20128 - PLACE
      ?auto_20131 - HOIST
      ?auto_20137 - SURFACE
      ?auto_20133 - SURFACE
      ?auto_20130 - PLACE
      ?auto_20124 - HOIST
      ?auto_20122 - SURFACE
      ?auto_20132 - SURFACE
      ?auto_20135 - SURFACE
      ?auto_20127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20134 ?auto_20126 ) ( IS-CRATE ?auto_20120 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20125 ?auto_20126 ) ) ( HOIST-AT ?auto_20136 ?auto_20125 ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( SURFACE-AT ?auto_20120 ?auto_20125 ) ( ON ?auto_20120 ?auto_20123 ) ( CLEAR ?auto_20120 ) ( not ( = ?auto_20120 ?auto_20123 ) ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20129 ) ) ( not ( = ?auto_20121 ?auto_20129 ) ) ( not ( = ?auto_20123 ?auto_20129 ) ) ( not ( = ?auto_20128 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20128 ) ) ( HOIST-AT ?auto_20131 ?auto_20128 ) ( not ( = ?auto_20134 ?auto_20131 ) ) ( not ( = ?auto_20136 ?auto_20131 ) ) ( AVAILABLE ?auto_20131 ) ( SURFACE-AT ?auto_20121 ?auto_20128 ) ( ON ?auto_20121 ?auto_20137 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20137 ) ) ( not ( = ?auto_20121 ?auto_20137 ) ) ( not ( = ?auto_20123 ?auto_20137 ) ) ( not ( = ?auto_20129 ?auto_20137 ) ) ( IS-CRATE ?auto_20129 ) ( not ( = ?auto_20120 ?auto_20133 ) ) ( not ( = ?auto_20121 ?auto_20133 ) ) ( not ( = ?auto_20123 ?auto_20133 ) ) ( not ( = ?auto_20129 ?auto_20133 ) ) ( not ( = ?auto_20137 ?auto_20133 ) ) ( not ( = ?auto_20130 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20130 ) ) ( not ( = ?auto_20128 ?auto_20130 ) ) ( HOIST-AT ?auto_20124 ?auto_20130 ) ( not ( = ?auto_20134 ?auto_20124 ) ) ( not ( = ?auto_20136 ?auto_20124 ) ) ( not ( = ?auto_20131 ?auto_20124 ) ) ( AVAILABLE ?auto_20124 ) ( SURFACE-AT ?auto_20129 ?auto_20130 ) ( ON ?auto_20129 ?auto_20122 ) ( CLEAR ?auto_20129 ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20123 ?auto_20122 ) ) ( not ( = ?auto_20129 ?auto_20122 ) ) ( not ( = ?auto_20137 ?auto_20122 ) ) ( not ( = ?auto_20133 ?auto_20122 ) ) ( SURFACE-AT ?auto_20132 ?auto_20126 ) ( CLEAR ?auto_20132 ) ( IS-CRATE ?auto_20133 ) ( not ( = ?auto_20120 ?auto_20132 ) ) ( not ( = ?auto_20121 ?auto_20132 ) ) ( not ( = ?auto_20123 ?auto_20132 ) ) ( not ( = ?auto_20129 ?auto_20132 ) ) ( not ( = ?auto_20137 ?auto_20132 ) ) ( not ( = ?auto_20133 ?auto_20132 ) ) ( not ( = ?auto_20122 ?auto_20132 ) ) ( AVAILABLE ?auto_20134 ) ( AVAILABLE ?auto_20136 ) ( SURFACE-AT ?auto_20133 ?auto_20125 ) ( ON ?auto_20133 ?auto_20135 ) ( CLEAR ?auto_20133 ) ( not ( = ?auto_20120 ?auto_20135 ) ) ( not ( = ?auto_20121 ?auto_20135 ) ) ( not ( = ?auto_20123 ?auto_20135 ) ) ( not ( = ?auto_20129 ?auto_20135 ) ) ( not ( = ?auto_20137 ?auto_20135 ) ) ( not ( = ?auto_20133 ?auto_20135 ) ) ( not ( = ?auto_20122 ?auto_20135 ) ) ( not ( = ?auto_20132 ?auto_20135 ) ) ( TRUCK-AT ?auto_20127 ?auto_20126 ) )
    :subtasks
    ( ( !DRIVE ?auto_20127 ?auto_20126 ?auto_20125 )
      ( MAKE-ON ?auto_20120 ?auto_20121 )
      ( MAKE-ON-VERIFY ?auto_20120 ?auto_20121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20138 - SURFACE
      ?auto_20139 - SURFACE
    )
    :vars
    (
      ?auto_20150 - HOIST
      ?auto_20141 - PLACE
      ?auto_20147 - PLACE
      ?auto_20140 - HOIST
      ?auto_20143 - SURFACE
      ?auto_20149 - SURFACE
      ?auto_20154 - PLACE
      ?auto_20146 - HOIST
      ?auto_20145 - SURFACE
      ?auto_20148 - SURFACE
      ?auto_20155 - PLACE
      ?auto_20152 - HOIST
      ?auto_20151 - SURFACE
      ?auto_20144 - SURFACE
      ?auto_20153 - SURFACE
      ?auto_20142 - TRUCK
      ?auto_20156 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20150 ?auto_20141 ) ( IS-CRATE ?auto_20138 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20147 ?auto_20141 ) ) ( HOIST-AT ?auto_20140 ?auto_20147 ) ( not ( = ?auto_20150 ?auto_20140 ) ) ( SURFACE-AT ?auto_20138 ?auto_20147 ) ( ON ?auto_20138 ?auto_20143 ) ( CLEAR ?auto_20138 ) ( not ( = ?auto_20138 ?auto_20143 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( IS-CRATE ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20149 ) ) ( not ( = ?auto_20139 ?auto_20149 ) ) ( not ( = ?auto_20143 ?auto_20149 ) ) ( not ( = ?auto_20154 ?auto_20141 ) ) ( not ( = ?auto_20147 ?auto_20154 ) ) ( HOIST-AT ?auto_20146 ?auto_20154 ) ( not ( = ?auto_20150 ?auto_20146 ) ) ( not ( = ?auto_20140 ?auto_20146 ) ) ( AVAILABLE ?auto_20146 ) ( SURFACE-AT ?auto_20139 ?auto_20154 ) ( ON ?auto_20139 ?auto_20145 ) ( CLEAR ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20145 ) ) ( not ( = ?auto_20139 ?auto_20145 ) ) ( not ( = ?auto_20143 ?auto_20145 ) ) ( not ( = ?auto_20149 ?auto_20145 ) ) ( IS-CRATE ?auto_20149 ) ( not ( = ?auto_20138 ?auto_20148 ) ) ( not ( = ?auto_20139 ?auto_20148 ) ) ( not ( = ?auto_20143 ?auto_20148 ) ) ( not ( = ?auto_20149 ?auto_20148 ) ) ( not ( = ?auto_20145 ?auto_20148 ) ) ( not ( = ?auto_20155 ?auto_20141 ) ) ( not ( = ?auto_20147 ?auto_20155 ) ) ( not ( = ?auto_20154 ?auto_20155 ) ) ( HOIST-AT ?auto_20152 ?auto_20155 ) ( not ( = ?auto_20150 ?auto_20152 ) ) ( not ( = ?auto_20140 ?auto_20152 ) ) ( not ( = ?auto_20146 ?auto_20152 ) ) ( AVAILABLE ?auto_20152 ) ( SURFACE-AT ?auto_20149 ?auto_20155 ) ( ON ?auto_20149 ?auto_20151 ) ( CLEAR ?auto_20149 ) ( not ( = ?auto_20138 ?auto_20151 ) ) ( not ( = ?auto_20139 ?auto_20151 ) ) ( not ( = ?auto_20143 ?auto_20151 ) ) ( not ( = ?auto_20149 ?auto_20151 ) ) ( not ( = ?auto_20145 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( IS-CRATE ?auto_20148 ) ( not ( = ?auto_20138 ?auto_20144 ) ) ( not ( = ?auto_20139 ?auto_20144 ) ) ( not ( = ?auto_20143 ?auto_20144 ) ) ( not ( = ?auto_20149 ?auto_20144 ) ) ( not ( = ?auto_20145 ?auto_20144 ) ) ( not ( = ?auto_20148 ?auto_20144 ) ) ( not ( = ?auto_20151 ?auto_20144 ) ) ( AVAILABLE ?auto_20140 ) ( SURFACE-AT ?auto_20148 ?auto_20147 ) ( ON ?auto_20148 ?auto_20153 ) ( CLEAR ?auto_20148 ) ( not ( = ?auto_20138 ?auto_20153 ) ) ( not ( = ?auto_20139 ?auto_20153 ) ) ( not ( = ?auto_20143 ?auto_20153 ) ) ( not ( = ?auto_20149 ?auto_20153 ) ) ( not ( = ?auto_20145 ?auto_20153 ) ) ( not ( = ?auto_20148 ?auto_20153 ) ) ( not ( = ?auto_20151 ?auto_20153 ) ) ( not ( = ?auto_20144 ?auto_20153 ) ) ( TRUCK-AT ?auto_20142 ?auto_20141 ) ( SURFACE-AT ?auto_20156 ?auto_20141 ) ( CLEAR ?auto_20156 ) ( LIFTING ?auto_20150 ?auto_20144 ) ( IS-CRATE ?auto_20144 ) ( not ( = ?auto_20138 ?auto_20156 ) ) ( not ( = ?auto_20139 ?auto_20156 ) ) ( not ( = ?auto_20143 ?auto_20156 ) ) ( not ( = ?auto_20149 ?auto_20156 ) ) ( not ( = ?auto_20145 ?auto_20156 ) ) ( not ( = ?auto_20148 ?auto_20156 ) ) ( not ( = ?auto_20151 ?auto_20156 ) ) ( not ( = ?auto_20144 ?auto_20156 ) ) ( not ( = ?auto_20153 ?auto_20156 ) ) )
    :subtasks
    ( ( !DROP ?auto_20150 ?auto_20144 ?auto_20156 ?auto_20141 )
      ( MAKE-ON ?auto_20138 ?auto_20139 )
      ( MAKE-ON-VERIFY ?auto_20138 ?auto_20139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20157 - SURFACE
      ?auto_20158 - SURFACE
    )
    :vars
    (
      ?auto_20166 - HOIST
      ?auto_20160 - PLACE
      ?auto_20168 - PLACE
      ?auto_20175 - HOIST
      ?auto_20163 - SURFACE
      ?auto_20170 - SURFACE
      ?auto_20171 - PLACE
      ?auto_20161 - HOIST
      ?auto_20165 - SURFACE
      ?auto_20174 - SURFACE
      ?auto_20162 - PLACE
      ?auto_20172 - HOIST
      ?auto_20169 - SURFACE
      ?auto_20164 - SURFACE
      ?auto_20167 - SURFACE
      ?auto_20159 - TRUCK
      ?auto_20173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20166 ?auto_20160 ) ( IS-CRATE ?auto_20157 ) ( not ( = ?auto_20157 ?auto_20158 ) ) ( not ( = ?auto_20168 ?auto_20160 ) ) ( HOIST-AT ?auto_20175 ?auto_20168 ) ( not ( = ?auto_20166 ?auto_20175 ) ) ( SURFACE-AT ?auto_20157 ?auto_20168 ) ( ON ?auto_20157 ?auto_20163 ) ( CLEAR ?auto_20157 ) ( not ( = ?auto_20157 ?auto_20163 ) ) ( not ( = ?auto_20158 ?auto_20163 ) ) ( IS-CRATE ?auto_20158 ) ( not ( = ?auto_20157 ?auto_20170 ) ) ( not ( = ?auto_20158 ?auto_20170 ) ) ( not ( = ?auto_20163 ?auto_20170 ) ) ( not ( = ?auto_20171 ?auto_20160 ) ) ( not ( = ?auto_20168 ?auto_20171 ) ) ( HOIST-AT ?auto_20161 ?auto_20171 ) ( not ( = ?auto_20166 ?auto_20161 ) ) ( not ( = ?auto_20175 ?auto_20161 ) ) ( AVAILABLE ?auto_20161 ) ( SURFACE-AT ?auto_20158 ?auto_20171 ) ( ON ?auto_20158 ?auto_20165 ) ( CLEAR ?auto_20158 ) ( not ( = ?auto_20157 ?auto_20165 ) ) ( not ( = ?auto_20158 ?auto_20165 ) ) ( not ( = ?auto_20163 ?auto_20165 ) ) ( not ( = ?auto_20170 ?auto_20165 ) ) ( IS-CRATE ?auto_20170 ) ( not ( = ?auto_20157 ?auto_20174 ) ) ( not ( = ?auto_20158 ?auto_20174 ) ) ( not ( = ?auto_20163 ?auto_20174 ) ) ( not ( = ?auto_20170 ?auto_20174 ) ) ( not ( = ?auto_20165 ?auto_20174 ) ) ( not ( = ?auto_20162 ?auto_20160 ) ) ( not ( = ?auto_20168 ?auto_20162 ) ) ( not ( = ?auto_20171 ?auto_20162 ) ) ( HOIST-AT ?auto_20172 ?auto_20162 ) ( not ( = ?auto_20166 ?auto_20172 ) ) ( not ( = ?auto_20175 ?auto_20172 ) ) ( not ( = ?auto_20161 ?auto_20172 ) ) ( AVAILABLE ?auto_20172 ) ( SURFACE-AT ?auto_20170 ?auto_20162 ) ( ON ?auto_20170 ?auto_20169 ) ( CLEAR ?auto_20170 ) ( not ( = ?auto_20157 ?auto_20169 ) ) ( not ( = ?auto_20158 ?auto_20169 ) ) ( not ( = ?auto_20163 ?auto_20169 ) ) ( not ( = ?auto_20170 ?auto_20169 ) ) ( not ( = ?auto_20165 ?auto_20169 ) ) ( not ( = ?auto_20174 ?auto_20169 ) ) ( IS-CRATE ?auto_20174 ) ( not ( = ?auto_20157 ?auto_20164 ) ) ( not ( = ?auto_20158 ?auto_20164 ) ) ( not ( = ?auto_20163 ?auto_20164 ) ) ( not ( = ?auto_20170 ?auto_20164 ) ) ( not ( = ?auto_20165 ?auto_20164 ) ) ( not ( = ?auto_20174 ?auto_20164 ) ) ( not ( = ?auto_20169 ?auto_20164 ) ) ( AVAILABLE ?auto_20175 ) ( SURFACE-AT ?auto_20174 ?auto_20168 ) ( ON ?auto_20174 ?auto_20167 ) ( CLEAR ?auto_20174 ) ( not ( = ?auto_20157 ?auto_20167 ) ) ( not ( = ?auto_20158 ?auto_20167 ) ) ( not ( = ?auto_20163 ?auto_20167 ) ) ( not ( = ?auto_20170 ?auto_20167 ) ) ( not ( = ?auto_20165 ?auto_20167 ) ) ( not ( = ?auto_20174 ?auto_20167 ) ) ( not ( = ?auto_20169 ?auto_20167 ) ) ( not ( = ?auto_20164 ?auto_20167 ) ) ( TRUCK-AT ?auto_20159 ?auto_20160 ) ( SURFACE-AT ?auto_20173 ?auto_20160 ) ( CLEAR ?auto_20173 ) ( IS-CRATE ?auto_20164 ) ( not ( = ?auto_20157 ?auto_20173 ) ) ( not ( = ?auto_20158 ?auto_20173 ) ) ( not ( = ?auto_20163 ?auto_20173 ) ) ( not ( = ?auto_20170 ?auto_20173 ) ) ( not ( = ?auto_20165 ?auto_20173 ) ) ( not ( = ?auto_20174 ?auto_20173 ) ) ( not ( = ?auto_20169 ?auto_20173 ) ) ( not ( = ?auto_20164 ?auto_20173 ) ) ( not ( = ?auto_20167 ?auto_20173 ) ) ( AVAILABLE ?auto_20166 ) ( IN ?auto_20164 ?auto_20159 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20166 ?auto_20164 ?auto_20159 ?auto_20160 )
      ( MAKE-ON ?auto_20157 ?auto_20158 )
      ( MAKE-ON-VERIFY ?auto_20157 ?auto_20158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20176 - SURFACE
      ?auto_20177 - SURFACE
    )
    :vars
    (
      ?auto_20179 - HOIST
      ?auto_20185 - PLACE
      ?auto_20182 - PLACE
      ?auto_20190 - HOIST
      ?auto_20187 - SURFACE
      ?auto_20194 - SURFACE
      ?auto_20192 - PLACE
      ?auto_20184 - HOIST
      ?auto_20178 - SURFACE
      ?auto_20191 - SURFACE
      ?auto_20180 - PLACE
      ?auto_20186 - HOIST
      ?auto_20181 - SURFACE
      ?auto_20183 - SURFACE
      ?auto_20193 - SURFACE
      ?auto_20189 - SURFACE
      ?auto_20188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20179 ?auto_20185 ) ( IS-CRATE ?auto_20176 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( HOIST-AT ?auto_20190 ?auto_20182 ) ( not ( = ?auto_20179 ?auto_20190 ) ) ( SURFACE-AT ?auto_20176 ?auto_20182 ) ( ON ?auto_20176 ?auto_20187 ) ( CLEAR ?auto_20176 ) ( not ( = ?auto_20176 ?auto_20187 ) ) ( not ( = ?auto_20177 ?auto_20187 ) ) ( IS-CRATE ?auto_20177 ) ( not ( = ?auto_20176 ?auto_20194 ) ) ( not ( = ?auto_20177 ?auto_20194 ) ) ( not ( = ?auto_20187 ?auto_20194 ) ) ( not ( = ?auto_20192 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20192 ) ) ( HOIST-AT ?auto_20184 ?auto_20192 ) ( not ( = ?auto_20179 ?auto_20184 ) ) ( not ( = ?auto_20190 ?auto_20184 ) ) ( AVAILABLE ?auto_20184 ) ( SURFACE-AT ?auto_20177 ?auto_20192 ) ( ON ?auto_20177 ?auto_20178 ) ( CLEAR ?auto_20177 ) ( not ( = ?auto_20176 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20187 ?auto_20178 ) ) ( not ( = ?auto_20194 ?auto_20178 ) ) ( IS-CRATE ?auto_20194 ) ( not ( = ?auto_20176 ?auto_20191 ) ) ( not ( = ?auto_20177 ?auto_20191 ) ) ( not ( = ?auto_20187 ?auto_20191 ) ) ( not ( = ?auto_20194 ?auto_20191 ) ) ( not ( = ?auto_20178 ?auto_20191 ) ) ( not ( = ?auto_20180 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20180 ) ) ( not ( = ?auto_20192 ?auto_20180 ) ) ( HOIST-AT ?auto_20186 ?auto_20180 ) ( not ( = ?auto_20179 ?auto_20186 ) ) ( not ( = ?auto_20190 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( AVAILABLE ?auto_20186 ) ( SURFACE-AT ?auto_20194 ?auto_20180 ) ( ON ?auto_20194 ?auto_20181 ) ( CLEAR ?auto_20194 ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( not ( = ?auto_20177 ?auto_20181 ) ) ( not ( = ?auto_20187 ?auto_20181 ) ) ( not ( = ?auto_20194 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20181 ) ) ( not ( = ?auto_20191 ?auto_20181 ) ) ( IS-CRATE ?auto_20191 ) ( not ( = ?auto_20176 ?auto_20183 ) ) ( not ( = ?auto_20177 ?auto_20183 ) ) ( not ( = ?auto_20187 ?auto_20183 ) ) ( not ( = ?auto_20194 ?auto_20183 ) ) ( not ( = ?auto_20178 ?auto_20183 ) ) ( not ( = ?auto_20191 ?auto_20183 ) ) ( not ( = ?auto_20181 ?auto_20183 ) ) ( AVAILABLE ?auto_20190 ) ( SURFACE-AT ?auto_20191 ?auto_20182 ) ( ON ?auto_20191 ?auto_20193 ) ( CLEAR ?auto_20191 ) ( not ( = ?auto_20176 ?auto_20193 ) ) ( not ( = ?auto_20177 ?auto_20193 ) ) ( not ( = ?auto_20187 ?auto_20193 ) ) ( not ( = ?auto_20194 ?auto_20193 ) ) ( not ( = ?auto_20178 ?auto_20193 ) ) ( not ( = ?auto_20191 ?auto_20193 ) ) ( not ( = ?auto_20181 ?auto_20193 ) ) ( not ( = ?auto_20183 ?auto_20193 ) ) ( SURFACE-AT ?auto_20189 ?auto_20185 ) ( CLEAR ?auto_20189 ) ( IS-CRATE ?auto_20183 ) ( not ( = ?auto_20176 ?auto_20189 ) ) ( not ( = ?auto_20177 ?auto_20189 ) ) ( not ( = ?auto_20187 ?auto_20189 ) ) ( not ( = ?auto_20194 ?auto_20189 ) ) ( not ( = ?auto_20178 ?auto_20189 ) ) ( not ( = ?auto_20191 ?auto_20189 ) ) ( not ( = ?auto_20181 ?auto_20189 ) ) ( not ( = ?auto_20183 ?auto_20189 ) ) ( not ( = ?auto_20193 ?auto_20189 ) ) ( AVAILABLE ?auto_20179 ) ( IN ?auto_20183 ?auto_20188 ) ( TRUCK-AT ?auto_20188 ?auto_20192 ) )
    :subtasks
    ( ( !DRIVE ?auto_20188 ?auto_20192 ?auto_20185 )
      ( MAKE-ON ?auto_20176 ?auto_20177 )
      ( MAKE-ON-VERIFY ?auto_20176 ?auto_20177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20195 - SURFACE
      ?auto_20196 - SURFACE
    )
    :vars
    (
      ?auto_20213 - HOIST
      ?auto_20202 - PLACE
      ?auto_20203 - PLACE
      ?auto_20204 - HOIST
      ?auto_20199 - SURFACE
      ?auto_20208 - SURFACE
      ?auto_20209 - PLACE
      ?auto_20210 - HOIST
      ?auto_20200 - SURFACE
      ?auto_20207 - SURFACE
      ?auto_20206 - PLACE
      ?auto_20205 - HOIST
      ?auto_20198 - SURFACE
      ?auto_20211 - SURFACE
      ?auto_20201 - SURFACE
      ?auto_20197 - SURFACE
      ?auto_20212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20213 ?auto_20202 ) ( IS-CRATE ?auto_20195 ) ( not ( = ?auto_20195 ?auto_20196 ) ) ( not ( = ?auto_20203 ?auto_20202 ) ) ( HOIST-AT ?auto_20204 ?auto_20203 ) ( not ( = ?auto_20213 ?auto_20204 ) ) ( SURFACE-AT ?auto_20195 ?auto_20203 ) ( ON ?auto_20195 ?auto_20199 ) ( CLEAR ?auto_20195 ) ( not ( = ?auto_20195 ?auto_20199 ) ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( IS-CRATE ?auto_20196 ) ( not ( = ?auto_20195 ?auto_20208 ) ) ( not ( = ?auto_20196 ?auto_20208 ) ) ( not ( = ?auto_20199 ?auto_20208 ) ) ( not ( = ?auto_20209 ?auto_20202 ) ) ( not ( = ?auto_20203 ?auto_20209 ) ) ( HOIST-AT ?auto_20210 ?auto_20209 ) ( not ( = ?auto_20213 ?auto_20210 ) ) ( not ( = ?auto_20204 ?auto_20210 ) ) ( SURFACE-AT ?auto_20196 ?auto_20209 ) ( ON ?auto_20196 ?auto_20200 ) ( CLEAR ?auto_20196 ) ( not ( = ?auto_20195 ?auto_20200 ) ) ( not ( = ?auto_20196 ?auto_20200 ) ) ( not ( = ?auto_20199 ?auto_20200 ) ) ( not ( = ?auto_20208 ?auto_20200 ) ) ( IS-CRATE ?auto_20208 ) ( not ( = ?auto_20195 ?auto_20207 ) ) ( not ( = ?auto_20196 ?auto_20207 ) ) ( not ( = ?auto_20199 ?auto_20207 ) ) ( not ( = ?auto_20208 ?auto_20207 ) ) ( not ( = ?auto_20200 ?auto_20207 ) ) ( not ( = ?auto_20206 ?auto_20202 ) ) ( not ( = ?auto_20203 ?auto_20206 ) ) ( not ( = ?auto_20209 ?auto_20206 ) ) ( HOIST-AT ?auto_20205 ?auto_20206 ) ( not ( = ?auto_20213 ?auto_20205 ) ) ( not ( = ?auto_20204 ?auto_20205 ) ) ( not ( = ?auto_20210 ?auto_20205 ) ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20208 ?auto_20206 ) ( ON ?auto_20208 ?auto_20198 ) ( CLEAR ?auto_20208 ) ( not ( = ?auto_20195 ?auto_20198 ) ) ( not ( = ?auto_20196 ?auto_20198 ) ) ( not ( = ?auto_20199 ?auto_20198 ) ) ( not ( = ?auto_20208 ?auto_20198 ) ) ( not ( = ?auto_20200 ?auto_20198 ) ) ( not ( = ?auto_20207 ?auto_20198 ) ) ( IS-CRATE ?auto_20207 ) ( not ( = ?auto_20195 ?auto_20211 ) ) ( not ( = ?auto_20196 ?auto_20211 ) ) ( not ( = ?auto_20199 ?auto_20211 ) ) ( not ( = ?auto_20208 ?auto_20211 ) ) ( not ( = ?auto_20200 ?auto_20211 ) ) ( not ( = ?auto_20207 ?auto_20211 ) ) ( not ( = ?auto_20198 ?auto_20211 ) ) ( AVAILABLE ?auto_20204 ) ( SURFACE-AT ?auto_20207 ?auto_20203 ) ( ON ?auto_20207 ?auto_20201 ) ( CLEAR ?auto_20207 ) ( not ( = ?auto_20195 ?auto_20201 ) ) ( not ( = ?auto_20196 ?auto_20201 ) ) ( not ( = ?auto_20199 ?auto_20201 ) ) ( not ( = ?auto_20208 ?auto_20201 ) ) ( not ( = ?auto_20200 ?auto_20201 ) ) ( not ( = ?auto_20207 ?auto_20201 ) ) ( not ( = ?auto_20198 ?auto_20201 ) ) ( not ( = ?auto_20211 ?auto_20201 ) ) ( SURFACE-AT ?auto_20197 ?auto_20202 ) ( CLEAR ?auto_20197 ) ( IS-CRATE ?auto_20211 ) ( not ( = ?auto_20195 ?auto_20197 ) ) ( not ( = ?auto_20196 ?auto_20197 ) ) ( not ( = ?auto_20199 ?auto_20197 ) ) ( not ( = ?auto_20208 ?auto_20197 ) ) ( not ( = ?auto_20200 ?auto_20197 ) ) ( not ( = ?auto_20207 ?auto_20197 ) ) ( not ( = ?auto_20198 ?auto_20197 ) ) ( not ( = ?auto_20211 ?auto_20197 ) ) ( not ( = ?auto_20201 ?auto_20197 ) ) ( AVAILABLE ?auto_20213 ) ( TRUCK-AT ?auto_20212 ?auto_20209 ) ( LIFTING ?auto_20210 ?auto_20211 ) )
    :subtasks
    ( ( !LOAD ?auto_20210 ?auto_20211 ?auto_20212 ?auto_20209 )
      ( MAKE-ON ?auto_20195 ?auto_20196 )
      ( MAKE-ON-VERIFY ?auto_20195 ?auto_20196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20214 - SURFACE
      ?auto_20215 - SURFACE
    )
    :vars
    (
      ?auto_20219 - HOIST
      ?auto_20232 - PLACE
      ?auto_20223 - PLACE
      ?auto_20220 - HOIST
      ?auto_20227 - SURFACE
      ?auto_20230 - SURFACE
      ?auto_20228 - PLACE
      ?auto_20225 - HOIST
      ?auto_20229 - SURFACE
      ?auto_20221 - SURFACE
      ?auto_20226 - PLACE
      ?auto_20224 - HOIST
      ?auto_20231 - SURFACE
      ?auto_20216 - SURFACE
      ?auto_20222 - SURFACE
      ?auto_20217 - SURFACE
      ?auto_20218 - TRUCK
      ?auto_20233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20219 ?auto_20232 ) ( IS-CRATE ?auto_20214 ) ( not ( = ?auto_20214 ?auto_20215 ) ) ( not ( = ?auto_20223 ?auto_20232 ) ) ( HOIST-AT ?auto_20220 ?auto_20223 ) ( not ( = ?auto_20219 ?auto_20220 ) ) ( SURFACE-AT ?auto_20214 ?auto_20223 ) ( ON ?auto_20214 ?auto_20227 ) ( CLEAR ?auto_20214 ) ( not ( = ?auto_20214 ?auto_20227 ) ) ( not ( = ?auto_20215 ?auto_20227 ) ) ( IS-CRATE ?auto_20215 ) ( not ( = ?auto_20214 ?auto_20230 ) ) ( not ( = ?auto_20215 ?auto_20230 ) ) ( not ( = ?auto_20227 ?auto_20230 ) ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( not ( = ?auto_20223 ?auto_20228 ) ) ( HOIST-AT ?auto_20225 ?auto_20228 ) ( not ( = ?auto_20219 ?auto_20225 ) ) ( not ( = ?auto_20220 ?auto_20225 ) ) ( SURFACE-AT ?auto_20215 ?auto_20228 ) ( ON ?auto_20215 ?auto_20229 ) ( CLEAR ?auto_20215 ) ( not ( = ?auto_20214 ?auto_20229 ) ) ( not ( = ?auto_20215 ?auto_20229 ) ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20230 ?auto_20229 ) ) ( IS-CRATE ?auto_20230 ) ( not ( = ?auto_20214 ?auto_20221 ) ) ( not ( = ?auto_20215 ?auto_20221 ) ) ( not ( = ?auto_20227 ?auto_20221 ) ) ( not ( = ?auto_20230 ?auto_20221 ) ) ( not ( = ?auto_20229 ?auto_20221 ) ) ( not ( = ?auto_20226 ?auto_20232 ) ) ( not ( = ?auto_20223 ?auto_20226 ) ) ( not ( = ?auto_20228 ?auto_20226 ) ) ( HOIST-AT ?auto_20224 ?auto_20226 ) ( not ( = ?auto_20219 ?auto_20224 ) ) ( not ( = ?auto_20220 ?auto_20224 ) ) ( not ( = ?auto_20225 ?auto_20224 ) ) ( AVAILABLE ?auto_20224 ) ( SURFACE-AT ?auto_20230 ?auto_20226 ) ( ON ?auto_20230 ?auto_20231 ) ( CLEAR ?auto_20230 ) ( not ( = ?auto_20214 ?auto_20231 ) ) ( not ( = ?auto_20215 ?auto_20231 ) ) ( not ( = ?auto_20227 ?auto_20231 ) ) ( not ( = ?auto_20230 ?auto_20231 ) ) ( not ( = ?auto_20229 ?auto_20231 ) ) ( not ( = ?auto_20221 ?auto_20231 ) ) ( IS-CRATE ?auto_20221 ) ( not ( = ?auto_20214 ?auto_20216 ) ) ( not ( = ?auto_20215 ?auto_20216 ) ) ( not ( = ?auto_20227 ?auto_20216 ) ) ( not ( = ?auto_20230 ?auto_20216 ) ) ( not ( = ?auto_20229 ?auto_20216 ) ) ( not ( = ?auto_20221 ?auto_20216 ) ) ( not ( = ?auto_20231 ?auto_20216 ) ) ( AVAILABLE ?auto_20220 ) ( SURFACE-AT ?auto_20221 ?auto_20223 ) ( ON ?auto_20221 ?auto_20222 ) ( CLEAR ?auto_20221 ) ( not ( = ?auto_20214 ?auto_20222 ) ) ( not ( = ?auto_20215 ?auto_20222 ) ) ( not ( = ?auto_20227 ?auto_20222 ) ) ( not ( = ?auto_20230 ?auto_20222 ) ) ( not ( = ?auto_20229 ?auto_20222 ) ) ( not ( = ?auto_20221 ?auto_20222 ) ) ( not ( = ?auto_20231 ?auto_20222 ) ) ( not ( = ?auto_20216 ?auto_20222 ) ) ( SURFACE-AT ?auto_20217 ?auto_20232 ) ( CLEAR ?auto_20217 ) ( IS-CRATE ?auto_20216 ) ( not ( = ?auto_20214 ?auto_20217 ) ) ( not ( = ?auto_20215 ?auto_20217 ) ) ( not ( = ?auto_20227 ?auto_20217 ) ) ( not ( = ?auto_20230 ?auto_20217 ) ) ( not ( = ?auto_20229 ?auto_20217 ) ) ( not ( = ?auto_20221 ?auto_20217 ) ) ( not ( = ?auto_20231 ?auto_20217 ) ) ( not ( = ?auto_20216 ?auto_20217 ) ) ( not ( = ?auto_20222 ?auto_20217 ) ) ( AVAILABLE ?auto_20219 ) ( TRUCK-AT ?auto_20218 ?auto_20228 ) ( AVAILABLE ?auto_20225 ) ( SURFACE-AT ?auto_20216 ?auto_20228 ) ( ON ?auto_20216 ?auto_20233 ) ( CLEAR ?auto_20216 ) ( not ( = ?auto_20214 ?auto_20233 ) ) ( not ( = ?auto_20215 ?auto_20233 ) ) ( not ( = ?auto_20227 ?auto_20233 ) ) ( not ( = ?auto_20230 ?auto_20233 ) ) ( not ( = ?auto_20229 ?auto_20233 ) ) ( not ( = ?auto_20221 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20216 ?auto_20233 ) ) ( not ( = ?auto_20222 ?auto_20233 ) ) ( not ( = ?auto_20217 ?auto_20233 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20225 ?auto_20216 ?auto_20233 ?auto_20228 )
      ( MAKE-ON ?auto_20214 ?auto_20215 )
      ( MAKE-ON-VERIFY ?auto_20214 ?auto_20215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20234 - SURFACE
      ?auto_20235 - SURFACE
    )
    :vars
    (
      ?auto_20248 - HOIST
      ?auto_20241 - PLACE
      ?auto_20242 - PLACE
      ?auto_20245 - HOIST
      ?auto_20244 - SURFACE
      ?auto_20236 - SURFACE
      ?auto_20249 - PLACE
      ?auto_20247 - HOIST
      ?auto_20246 - SURFACE
      ?auto_20238 - SURFACE
      ?auto_20239 - PLACE
      ?auto_20252 - HOIST
      ?auto_20243 - SURFACE
      ?auto_20253 - SURFACE
      ?auto_20240 - SURFACE
      ?auto_20237 - SURFACE
      ?auto_20251 - SURFACE
      ?auto_20250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20248 ?auto_20241 ) ( IS-CRATE ?auto_20234 ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( not ( = ?auto_20242 ?auto_20241 ) ) ( HOIST-AT ?auto_20245 ?auto_20242 ) ( not ( = ?auto_20248 ?auto_20245 ) ) ( SURFACE-AT ?auto_20234 ?auto_20242 ) ( ON ?auto_20234 ?auto_20244 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20234 ?auto_20244 ) ) ( not ( = ?auto_20235 ?auto_20244 ) ) ( IS-CRATE ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20236 ) ) ( not ( = ?auto_20235 ?auto_20236 ) ) ( not ( = ?auto_20244 ?auto_20236 ) ) ( not ( = ?auto_20249 ?auto_20241 ) ) ( not ( = ?auto_20242 ?auto_20249 ) ) ( HOIST-AT ?auto_20247 ?auto_20249 ) ( not ( = ?auto_20248 ?auto_20247 ) ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( SURFACE-AT ?auto_20235 ?auto_20249 ) ( ON ?auto_20235 ?auto_20246 ) ( CLEAR ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20246 ) ) ( not ( = ?auto_20235 ?auto_20246 ) ) ( not ( = ?auto_20244 ?auto_20246 ) ) ( not ( = ?auto_20236 ?auto_20246 ) ) ( IS-CRATE ?auto_20236 ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20235 ?auto_20238 ) ) ( not ( = ?auto_20244 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20246 ?auto_20238 ) ) ( not ( = ?auto_20239 ?auto_20241 ) ) ( not ( = ?auto_20242 ?auto_20239 ) ) ( not ( = ?auto_20249 ?auto_20239 ) ) ( HOIST-AT ?auto_20252 ?auto_20239 ) ( not ( = ?auto_20248 ?auto_20252 ) ) ( not ( = ?auto_20245 ?auto_20252 ) ) ( not ( = ?auto_20247 ?auto_20252 ) ) ( AVAILABLE ?auto_20252 ) ( SURFACE-AT ?auto_20236 ?auto_20239 ) ( ON ?auto_20236 ?auto_20243 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20234 ?auto_20243 ) ) ( not ( = ?auto_20235 ?auto_20243 ) ) ( not ( = ?auto_20244 ?auto_20243 ) ) ( not ( = ?auto_20236 ?auto_20243 ) ) ( not ( = ?auto_20246 ?auto_20243 ) ) ( not ( = ?auto_20238 ?auto_20243 ) ) ( IS-CRATE ?auto_20238 ) ( not ( = ?auto_20234 ?auto_20253 ) ) ( not ( = ?auto_20235 ?auto_20253 ) ) ( not ( = ?auto_20244 ?auto_20253 ) ) ( not ( = ?auto_20236 ?auto_20253 ) ) ( not ( = ?auto_20246 ?auto_20253 ) ) ( not ( = ?auto_20238 ?auto_20253 ) ) ( not ( = ?auto_20243 ?auto_20253 ) ) ( AVAILABLE ?auto_20245 ) ( SURFACE-AT ?auto_20238 ?auto_20242 ) ( ON ?auto_20238 ?auto_20240 ) ( CLEAR ?auto_20238 ) ( not ( = ?auto_20234 ?auto_20240 ) ) ( not ( = ?auto_20235 ?auto_20240 ) ) ( not ( = ?auto_20244 ?auto_20240 ) ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20246 ?auto_20240 ) ) ( not ( = ?auto_20238 ?auto_20240 ) ) ( not ( = ?auto_20243 ?auto_20240 ) ) ( not ( = ?auto_20253 ?auto_20240 ) ) ( SURFACE-AT ?auto_20237 ?auto_20241 ) ( CLEAR ?auto_20237 ) ( IS-CRATE ?auto_20253 ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( not ( = ?auto_20244 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20246 ?auto_20237 ) ) ( not ( = ?auto_20238 ?auto_20237 ) ) ( not ( = ?auto_20243 ?auto_20237 ) ) ( not ( = ?auto_20253 ?auto_20237 ) ) ( not ( = ?auto_20240 ?auto_20237 ) ) ( AVAILABLE ?auto_20248 ) ( AVAILABLE ?auto_20247 ) ( SURFACE-AT ?auto_20253 ?auto_20249 ) ( ON ?auto_20253 ?auto_20251 ) ( CLEAR ?auto_20253 ) ( not ( = ?auto_20234 ?auto_20251 ) ) ( not ( = ?auto_20235 ?auto_20251 ) ) ( not ( = ?auto_20244 ?auto_20251 ) ) ( not ( = ?auto_20236 ?auto_20251 ) ) ( not ( = ?auto_20246 ?auto_20251 ) ) ( not ( = ?auto_20238 ?auto_20251 ) ) ( not ( = ?auto_20243 ?auto_20251 ) ) ( not ( = ?auto_20253 ?auto_20251 ) ) ( not ( = ?auto_20240 ?auto_20251 ) ) ( not ( = ?auto_20237 ?auto_20251 ) ) ( TRUCK-AT ?auto_20250 ?auto_20241 ) )
    :subtasks
    ( ( !DRIVE ?auto_20250 ?auto_20241 ?auto_20249 )
      ( MAKE-ON ?auto_20234 ?auto_20235 )
      ( MAKE-ON-VERIFY ?auto_20234 ?auto_20235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20254 - SURFACE
      ?auto_20255 - SURFACE
    )
    :vars
    (
      ?auto_20260 - HOIST
      ?auto_20259 - PLACE
      ?auto_20262 - PLACE
      ?auto_20269 - HOIST
      ?auto_20268 - SURFACE
      ?auto_20264 - SURFACE
      ?auto_20258 - PLACE
      ?auto_20257 - HOIST
      ?auto_20263 - SURFACE
      ?auto_20267 - SURFACE
      ?auto_20256 - PLACE
      ?auto_20273 - HOIST
      ?auto_20272 - SURFACE
      ?auto_20261 - SURFACE
      ?auto_20270 - SURFACE
      ?auto_20271 - SURFACE
      ?auto_20266 - SURFACE
      ?auto_20265 - TRUCK
      ?auto_20274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20260 ?auto_20259 ) ( IS-CRATE ?auto_20254 ) ( not ( = ?auto_20254 ?auto_20255 ) ) ( not ( = ?auto_20262 ?auto_20259 ) ) ( HOIST-AT ?auto_20269 ?auto_20262 ) ( not ( = ?auto_20260 ?auto_20269 ) ) ( SURFACE-AT ?auto_20254 ?auto_20262 ) ( ON ?auto_20254 ?auto_20268 ) ( CLEAR ?auto_20254 ) ( not ( = ?auto_20254 ?auto_20268 ) ) ( not ( = ?auto_20255 ?auto_20268 ) ) ( IS-CRATE ?auto_20255 ) ( not ( = ?auto_20254 ?auto_20264 ) ) ( not ( = ?auto_20255 ?auto_20264 ) ) ( not ( = ?auto_20268 ?auto_20264 ) ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20262 ?auto_20258 ) ) ( HOIST-AT ?auto_20257 ?auto_20258 ) ( not ( = ?auto_20260 ?auto_20257 ) ) ( not ( = ?auto_20269 ?auto_20257 ) ) ( SURFACE-AT ?auto_20255 ?auto_20258 ) ( ON ?auto_20255 ?auto_20263 ) ( CLEAR ?auto_20255 ) ( not ( = ?auto_20254 ?auto_20263 ) ) ( not ( = ?auto_20255 ?auto_20263 ) ) ( not ( = ?auto_20268 ?auto_20263 ) ) ( not ( = ?auto_20264 ?auto_20263 ) ) ( IS-CRATE ?auto_20264 ) ( not ( = ?auto_20254 ?auto_20267 ) ) ( not ( = ?auto_20255 ?auto_20267 ) ) ( not ( = ?auto_20268 ?auto_20267 ) ) ( not ( = ?auto_20264 ?auto_20267 ) ) ( not ( = ?auto_20263 ?auto_20267 ) ) ( not ( = ?auto_20256 ?auto_20259 ) ) ( not ( = ?auto_20262 ?auto_20256 ) ) ( not ( = ?auto_20258 ?auto_20256 ) ) ( HOIST-AT ?auto_20273 ?auto_20256 ) ( not ( = ?auto_20260 ?auto_20273 ) ) ( not ( = ?auto_20269 ?auto_20273 ) ) ( not ( = ?auto_20257 ?auto_20273 ) ) ( AVAILABLE ?auto_20273 ) ( SURFACE-AT ?auto_20264 ?auto_20256 ) ( ON ?auto_20264 ?auto_20272 ) ( CLEAR ?auto_20264 ) ( not ( = ?auto_20254 ?auto_20272 ) ) ( not ( = ?auto_20255 ?auto_20272 ) ) ( not ( = ?auto_20268 ?auto_20272 ) ) ( not ( = ?auto_20264 ?auto_20272 ) ) ( not ( = ?auto_20263 ?auto_20272 ) ) ( not ( = ?auto_20267 ?auto_20272 ) ) ( IS-CRATE ?auto_20267 ) ( not ( = ?auto_20254 ?auto_20261 ) ) ( not ( = ?auto_20255 ?auto_20261 ) ) ( not ( = ?auto_20268 ?auto_20261 ) ) ( not ( = ?auto_20264 ?auto_20261 ) ) ( not ( = ?auto_20263 ?auto_20261 ) ) ( not ( = ?auto_20267 ?auto_20261 ) ) ( not ( = ?auto_20272 ?auto_20261 ) ) ( AVAILABLE ?auto_20269 ) ( SURFACE-AT ?auto_20267 ?auto_20262 ) ( ON ?auto_20267 ?auto_20270 ) ( CLEAR ?auto_20267 ) ( not ( = ?auto_20254 ?auto_20270 ) ) ( not ( = ?auto_20255 ?auto_20270 ) ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( not ( = ?auto_20264 ?auto_20270 ) ) ( not ( = ?auto_20263 ?auto_20270 ) ) ( not ( = ?auto_20267 ?auto_20270 ) ) ( not ( = ?auto_20272 ?auto_20270 ) ) ( not ( = ?auto_20261 ?auto_20270 ) ) ( IS-CRATE ?auto_20261 ) ( not ( = ?auto_20254 ?auto_20271 ) ) ( not ( = ?auto_20255 ?auto_20271 ) ) ( not ( = ?auto_20268 ?auto_20271 ) ) ( not ( = ?auto_20264 ?auto_20271 ) ) ( not ( = ?auto_20263 ?auto_20271 ) ) ( not ( = ?auto_20267 ?auto_20271 ) ) ( not ( = ?auto_20272 ?auto_20271 ) ) ( not ( = ?auto_20261 ?auto_20271 ) ) ( not ( = ?auto_20270 ?auto_20271 ) ) ( AVAILABLE ?auto_20257 ) ( SURFACE-AT ?auto_20261 ?auto_20258 ) ( ON ?auto_20261 ?auto_20266 ) ( CLEAR ?auto_20261 ) ( not ( = ?auto_20254 ?auto_20266 ) ) ( not ( = ?auto_20255 ?auto_20266 ) ) ( not ( = ?auto_20268 ?auto_20266 ) ) ( not ( = ?auto_20264 ?auto_20266 ) ) ( not ( = ?auto_20263 ?auto_20266 ) ) ( not ( = ?auto_20267 ?auto_20266 ) ) ( not ( = ?auto_20272 ?auto_20266 ) ) ( not ( = ?auto_20261 ?auto_20266 ) ) ( not ( = ?auto_20270 ?auto_20266 ) ) ( not ( = ?auto_20271 ?auto_20266 ) ) ( TRUCK-AT ?auto_20265 ?auto_20259 ) ( SURFACE-AT ?auto_20274 ?auto_20259 ) ( CLEAR ?auto_20274 ) ( LIFTING ?auto_20260 ?auto_20271 ) ( IS-CRATE ?auto_20271 ) ( not ( = ?auto_20254 ?auto_20274 ) ) ( not ( = ?auto_20255 ?auto_20274 ) ) ( not ( = ?auto_20268 ?auto_20274 ) ) ( not ( = ?auto_20264 ?auto_20274 ) ) ( not ( = ?auto_20263 ?auto_20274 ) ) ( not ( = ?auto_20267 ?auto_20274 ) ) ( not ( = ?auto_20272 ?auto_20274 ) ) ( not ( = ?auto_20261 ?auto_20274 ) ) ( not ( = ?auto_20270 ?auto_20274 ) ) ( not ( = ?auto_20271 ?auto_20274 ) ) ( not ( = ?auto_20266 ?auto_20274 ) ) )
    :subtasks
    ( ( !DROP ?auto_20260 ?auto_20271 ?auto_20274 ?auto_20259 )
      ( MAKE-ON ?auto_20254 ?auto_20255 )
      ( MAKE-ON-VERIFY ?auto_20254 ?auto_20255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20275 - SURFACE
      ?auto_20276 - SURFACE
    )
    :vars
    (
      ?auto_20281 - HOIST
      ?auto_20289 - PLACE
      ?auto_20295 - PLACE
      ?auto_20282 - HOIST
      ?auto_20287 - SURFACE
      ?auto_20290 - SURFACE
      ?auto_20288 - PLACE
      ?auto_20292 - HOIST
      ?auto_20285 - SURFACE
      ?auto_20291 - SURFACE
      ?auto_20277 - PLACE
      ?auto_20279 - HOIST
      ?auto_20280 - SURFACE
      ?auto_20286 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20278 - SURFACE
      ?auto_20283 - SURFACE
      ?auto_20284 - TRUCK
      ?auto_20293 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20281 ?auto_20289 ) ( IS-CRATE ?auto_20275 ) ( not ( = ?auto_20275 ?auto_20276 ) ) ( not ( = ?auto_20295 ?auto_20289 ) ) ( HOIST-AT ?auto_20282 ?auto_20295 ) ( not ( = ?auto_20281 ?auto_20282 ) ) ( SURFACE-AT ?auto_20275 ?auto_20295 ) ( ON ?auto_20275 ?auto_20287 ) ( CLEAR ?auto_20275 ) ( not ( = ?auto_20275 ?auto_20287 ) ) ( not ( = ?auto_20276 ?auto_20287 ) ) ( IS-CRATE ?auto_20276 ) ( not ( = ?auto_20275 ?auto_20290 ) ) ( not ( = ?auto_20276 ?auto_20290 ) ) ( not ( = ?auto_20287 ?auto_20290 ) ) ( not ( = ?auto_20288 ?auto_20289 ) ) ( not ( = ?auto_20295 ?auto_20288 ) ) ( HOIST-AT ?auto_20292 ?auto_20288 ) ( not ( = ?auto_20281 ?auto_20292 ) ) ( not ( = ?auto_20282 ?auto_20292 ) ) ( SURFACE-AT ?auto_20276 ?auto_20288 ) ( ON ?auto_20276 ?auto_20285 ) ( CLEAR ?auto_20276 ) ( not ( = ?auto_20275 ?auto_20285 ) ) ( not ( = ?auto_20276 ?auto_20285 ) ) ( not ( = ?auto_20287 ?auto_20285 ) ) ( not ( = ?auto_20290 ?auto_20285 ) ) ( IS-CRATE ?auto_20290 ) ( not ( = ?auto_20275 ?auto_20291 ) ) ( not ( = ?auto_20276 ?auto_20291 ) ) ( not ( = ?auto_20287 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20285 ?auto_20291 ) ) ( not ( = ?auto_20277 ?auto_20289 ) ) ( not ( = ?auto_20295 ?auto_20277 ) ) ( not ( = ?auto_20288 ?auto_20277 ) ) ( HOIST-AT ?auto_20279 ?auto_20277 ) ( not ( = ?auto_20281 ?auto_20279 ) ) ( not ( = ?auto_20282 ?auto_20279 ) ) ( not ( = ?auto_20292 ?auto_20279 ) ) ( AVAILABLE ?auto_20279 ) ( SURFACE-AT ?auto_20290 ?auto_20277 ) ( ON ?auto_20290 ?auto_20280 ) ( CLEAR ?auto_20290 ) ( not ( = ?auto_20275 ?auto_20280 ) ) ( not ( = ?auto_20276 ?auto_20280 ) ) ( not ( = ?auto_20287 ?auto_20280 ) ) ( not ( = ?auto_20290 ?auto_20280 ) ) ( not ( = ?auto_20285 ?auto_20280 ) ) ( not ( = ?auto_20291 ?auto_20280 ) ) ( IS-CRATE ?auto_20291 ) ( not ( = ?auto_20275 ?auto_20286 ) ) ( not ( = ?auto_20276 ?auto_20286 ) ) ( not ( = ?auto_20287 ?auto_20286 ) ) ( not ( = ?auto_20290 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20286 ) ) ( not ( = ?auto_20291 ?auto_20286 ) ) ( not ( = ?auto_20280 ?auto_20286 ) ) ( AVAILABLE ?auto_20282 ) ( SURFACE-AT ?auto_20291 ?auto_20295 ) ( ON ?auto_20291 ?auto_20294 ) ( CLEAR ?auto_20291 ) ( not ( = ?auto_20275 ?auto_20294 ) ) ( not ( = ?auto_20276 ?auto_20294 ) ) ( not ( = ?auto_20287 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20285 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20280 ?auto_20294 ) ) ( not ( = ?auto_20286 ?auto_20294 ) ) ( IS-CRATE ?auto_20286 ) ( not ( = ?auto_20275 ?auto_20278 ) ) ( not ( = ?auto_20276 ?auto_20278 ) ) ( not ( = ?auto_20287 ?auto_20278 ) ) ( not ( = ?auto_20290 ?auto_20278 ) ) ( not ( = ?auto_20285 ?auto_20278 ) ) ( not ( = ?auto_20291 ?auto_20278 ) ) ( not ( = ?auto_20280 ?auto_20278 ) ) ( not ( = ?auto_20286 ?auto_20278 ) ) ( not ( = ?auto_20294 ?auto_20278 ) ) ( AVAILABLE ?auto_20292 ) ( SURFACE-AT ?auto_20286 ?auto_20288 ) ( ON ?auto_20286 ?auto_20283 ) ( CLEAR ?auto_20286 ) ( not ( = ?auto_20275 ?auto_20283 ) ) ( not ( = ?auto_20276 ?auto_20283 ) ) ( not ( = ?auto_20287 ?auto_20283 ) ) ( not ( = ?auto_20290 ?auto_20283 ) ) ( not ( = ?auto_20285 ?auto_20283 ) ) ( not ( = ?auto_20291 ?auto_20283 ) ) ( not ( = ?auto_20280 ?auto_20283 ) ) ( not ( = ?auto_20286 ?auto_20283 ) ) ( not ( = ?auto_20294 ?auto_20283 ) ) ( not ( = ?auto_20278 ?auto_20283 ) ) ( TRUCK-AT ?auto_20284 ?auto_20289 ) ( SURFACE-AT ?auto_20293 ?auto_20289 ) ( CLEAR ?auto_20293 ) ( IS-CRATE ?auto_20278 ) ( not ( = ?auto_20275 ?auto_20293 ) ) ( not ( = ?auto_20276 ?auto_20293 ) ) ( not ( = ?auto_20287 ?auto_20293 ) ) ( not ( = ?auto_20290 ?auto_20293 ) ) ( not ( = ?auto_20285 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20280 ?auto_20293 ) ) ( not ( = ?auto_20286 ?auto_20293 ) ) ( not ( = ?auto_20294 ?auto_20293 ) ) ( not ( = ?auto_20278 ?auto_20293 ) ) ( not ( = ?auto_20283 ?auto_20293 ) ) ( AVAILABLE ?auto_20281 ) ( IN ?auto_20278 ?auto_20284 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20281 ?auto_20278 ?auto_20284 ?auto_20289 )
      ( MAKE-ON ?auto_20275 ?auto_20276 )
      ( MAKE-ON-VERIFY ?auto_20275 ?auto_20276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20296 - SURFACE
      ?auto_20297 - SURFACE
    )
    :vars
    (
      ?auto_20301 - HOIST
      ?auto_20316 - PLACE
      ?auto_20305 - PLACE
      ?auto_20300 - HOIST
      ?auto_20299 - SURFACE
      ?auto_20308 - SURFACE
      ?auto_20307 - PLACE
      ?auto_20313 - HOIST
      ?auto_20312 - SURFACE
      ?auto_20315 - SURFACE
      ?auto_20304 - PLACE
      ?auto_20302 - HOIST
      ?auto_20314 - SURFACE
      ?auto_20298 - SURFACE
      ?auto_20309 - SURFACE
      ?auto_20303 - SURFACE
      ?auto_20311 - SURFACE
      ?auto_20310 - SURFACE
      ?auto_20306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20301 ?auto_20316 ) ( IS-CRATE ?auto_20296 ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( not ( = ?auto_20305 ?auto_20316 ) ) ( HOIST-AT ?auto_20300 ?auto_20305 ) ( not ( = ?auto_20301 ?auto_20300 ) ) ( SURFACE-AT ?auto_20296 ?auto_20305 ) ( ON ?auto_20296 ?auto_20299 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20296 ?auto_20299 ) ) ( not ( = ?auto_20297 ?auto_20299 ) ) ( IS-CRATE ?auto_20297 ) ( not ( = ?auto_20296 ?auto_20308 ) ) ( not ( = ?auto_20297 ?auto_20308 ) ) ( not ( = ?auto_20299 ?auto_20308 ) ) ( not ( = ?auto_20307 ?auto_20316 ) ) ( not ( = ?auto_20305 ?auto_20307 ) ) ( HOIST-AT ?auto_20313 ?auto_20307 ) ( not ( = ?auto_20301 ?auto_20313 ) ) ( not ( = ?auto_20300 ?auto_20313 ) ) ( SURFACE-AT ?auto_20297 ?auto_20307 ) ( ON ?auto_20297 ?auto_20312 ) ( CLEAR ?auto_20297 ) ( not ( = ?auto_20296 ?auto_20312 ) ) ( not ( = ?auto_20297 ?auto_20312 ) ) ( not ( = ?auto_20299 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( IS-CRATE ?auto_20308 ) ( not ( = ?auto_20296 ?auto_20315 ) ) ( not ( = ?auto_20297 ?auto_20315 ) ) ( not ( = ?auto_20299 ?auto_20315 ) ) ( not ( = ?auto_20308 ?auto_20315 ) ) ( not ( = ?auto_20312 ?auto_20315 ) ) ( not ( = ?auto_20304 ?auto_20316 ) ) ( not ( = ?auto_20305 ?auto_20304 ) ) ( not ( = ?auto_20307 ?auto_20304 ) ) ( HOIST-AT ?auto_20302 ?auto_20304 ) ( not ( = ?auto_20301 ?auto_20302 ) ) ( not ( = ?auto_20300 ?auto_20302 ) ) ( not ( = ?auto_20313 ?auto_20302 ) ) ( AVAILABLE ?auto_20302 ) ( SURFACE-AT ?auto_20308 ?auto_20304 ) ( ON ?auto_20308 ?auto_20314 ) ( CLEAR ?auto_20308 ) ( not ( = ?auto_20296 ?auto_20314 ) ) ( not ( = ?auto_20297 ?auto_20314 ) ) ( not ( = ?auto_20299 ?auto_20314 ) ) ( not ( = ?auto_20308 ?auto_20314 ) ) ( not ( = ?auto_20312 ?auto_20314 ) ) ( not ( = ?auto_20315 ?auto_20314 ) ) ( IS-CRATE ?auto_20315 ) ( not ( = ?auto_20296 ?auto_20298 ) ) ( not ( = ?auto_20297 ?auto_20298 ) ) ( not ( = ?auto_20299 ?auto_20298 ) ) ( not ( = ?auto_20308 ?auto_20298 ) ) ( not ( = ?auto_20312 ?auto_20298 ) ) ( not ( = ?auto_20315 ?auto_20298 ) ) ( not ( = ?auto_20314 ?auto_20298 ) ) ( AVAILABLE ?auto_20300 ) ( SURFACE-AT ?auto_20315 ?auto_20305 ) ( ON ?auto_20315 ?auto_20309 ) ( CLEAR ?auto_20315 ) ( not ( = ?auto_20296 ?auto_20309 ) ) ( not ( = ?auto_20297 ?auto_20309 ) ) ( not ( = ?auto_20299 ?auto_20309 ) ) ( not ( = ?auto_20308 ?auto_20309 ) ) ( not ( = ?auto_20312 ?auto_20309 ) ) ( not ( = ?auto_20315 ?auto_20309 ) ) ( not ( = ?auto_20314 ?auto_20309 ) ) ( not ( = ?auto_20298 ?auto_20309 ) ) ( IS-CRATE ?auto_20298 ) ( not ( = ?auto_20296 ?auto_20303 ) ) ( not ( = ?auto_20297 ?auto_20303 ) ) ( not ( = ?auto_20299 ?auto_20303 ) ) ( not ( = ?auto_20308 ?auto_20303 ) ) ( not ( = ?auto_20312 ?auto_20303 ) ) ( not ( = ?auto_20315 ?auto_20303 ) ) ( not ( = ?auto_20314 ?auto_20303 ) ) ( not ( = ?auto_20298 ?auto_20303 ) ) ( not ( = ?auto_20309 ?auto_20303 ) ) ( AVAILABLE ?auto_20313 ) ( SURFACE-AT ?auto_20298 ?auto_20307 ) ( ON ?auto_20298 ?auto_20311 ) ( CLEAR ?auto_20298 ) ( not ( = ?auto_20296 ?auto_20311 ) ) ( not ( = ?auto_20297 ?auto_20311 ) ) ( not ( = ?auto_20299 ?auto_20311 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( not ( = ?auto_20312 ?auto_20311 ) ) ( not ( = ?auto_20315 ?auto_20311 ) ) ( not ( = ?auto_20314 ?auto_20311 ) ) ( not ( = ?auto_20298 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20303 ?auto_20311 ) ) ( SURFACE-AT ?auto_20310 ?auto_20316 ) ( CLEAR ?auto_20310 ) ( IS-CRATE ?auto_20303 ) ( not ( = ?auto_20296 ?auto_20310 ) ) ( not ( = ?auto_20297 ?auto_20310 ) ) ( not ( = ?auto_20299 ?auto_20310 ) ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20312 ?auto_20310 ) ) ( not ( = ?auto_20315 ?auto_20310 ) ) ( not ( = ?auto_20314 ?auto_20310 ) ) ( not ( = ?auto_20298 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20303 ?auto_20310 ) ) ( not ( = ?auto_20311 ?auto_20310 ) ) ( AVAILABLE ?auto_20301 ) ( IN ?auto_20303 ?auto_20306 ) ( TRUCK-AT ?auto_20306 ?auto_20304 ) )
    :subtasks
    ( ( !DRIVE ?auto_20306 ?auto_20304 ?auto_20316 )
      ( MAKE-ON ?auto_20296 ?auto_20297 )
      ( MAKE-ON-VERIFY ?auto_20296 ?auto_20297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20317 - SURFACE
      ?auto_20318 - SURFACE
    )
    :vars
    (
      ?auto_20324 - HOIST
      ?auto_20337 - PLACE
      ?auto_20330 - PLACE
      ?auto_20334 - HOIST
      ?auto_20331 - SURFACE
      ?auto_20322 - SURFACE
      ?auto_20319 - PLACE
      ?auto_20325 - HOIST
      ?auto_20329 - SURFACE
      ?auto_20336 - SURFACE
      ?auto_20320 - PLACE
      ?auto_20323 - HOIST
      ?auto_20335 - SURFACE
      ?auto_20333 - SURFACE
      ?auto_20321 - SURFACE
      ?auto_20328 - SURFACE
      ?auto_20327 - SURFACE
      ?auto_20326 - SURFACE
      ?auto_20332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20324 ?auto_20337 ) ( IS-CRATE ?auto_20317 ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( not ( = ?auto_20330 ?auto_20337 ) ) ( HOIST-AT ?auto_20334 ?auto_20330 ) ( not ( = ?auto_20324 ?auto_20334 ) ) ( SURFACE-AT ?auto_20317 ?auto_20330 ) ( ON ?auto_20317 ?auto_20331 ) ( CLEAR ?auto_20317 ) ( not ( = ?auto_20317 ?auto_20331 ) ) ( not ( = ?auto_20318 ?auto_20331 ) ) ( IS-CRATE ?auto_20318 ) ( not ( = ?auto_20317 ?auto_20322 ) ) ( not ( = ?auto_20318 ?auto_20322 ) ) ( not ( = ?auto_20331 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20337 ) ) ( not ( = ?auto_20330 ?auto_20319 ) ) ( HOIST-AT ?auto_20325 ?auto_20319 ) ( not ( = ?auto_20324 ?auto_20325 ) ) ( not ( = ?auto_20334 ?auto_20325 ) ) ( SURFACE-AT ?auto_20318 ?auto_20319 ) ( ON ?auto_20318 ?auto_20329 ) ( CLEAR ?auto_20318 ) ( not ( = ?auto_20317 ?auto_20329 ) ) ( not ( = ?auto_20318 ?auto_20329 ) ) ( not ( = ?auto_20331 ?auto_20329 ) ) ( not ( = ?auto_20322 ?auto_20329 ) ) ( IS-CRATE ?auto_20322 ) ( not ( = ?auto_20317 ?auto_20336 ) ) ( not ( = ?auto_20318 ?auto_20336 ) ) ( not ( = ?auto_20331 ?auto_20336 ) ) ( not ( = ?auto_20322 ?auto_20336 ) ) ( not ( = ?auto_20329 ?auto_20336 ) ) ( not ( = ?auto_20320 ?auto_20337 ) ) ( not ( = ?auto_20330 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( HOIST-AT ?auto_20323 ?auto_20320 ) ( not ( = ?auto_20324 ?auto_20323 ) ) ( not ( = ?auto_20334 ?auto_20323 ) ) ( not ( = ?auto_20325 ?auto_20323 ) ) ( SURFACE-AT ?auto_20322 ?auto_20320 ) ( ON ?auto_20322 ?auto_20335 ) ( CLEAR ?auto_20322 ) ( not ( = ?auto_20317 ?auto_20335 ) ) ( not ( = ?auto_20318 ?auto_20335 ) ) ( not ( = ?auto_20331 ?auto_20335 ) ) ( not ( = ?auto_20322 ?auto_20335 ) ) ( not ( = ?auto_20329 ?auto_20335 ) ) ( not ( = ?auto_20336 ?auto_20335 ) ) ( IS-CRATE ?auto_20336 ) ( not ( = ?auto_20317 ?auto_20333 ) ) ( not ( = ?auto_20318 ?auto_20333 ) ) ( not ( = ?auto_20331 ?auto_20333 ) ) ( not ( = ?auto_20322 ?auto_20333 ) ) ( not ( = ?auto_20329 ?auto_20333 ) ) ( not ( = ?auto_20336 ?auto_20333 ) ) ( not ( = ?auto_20335 ?auto_20333 ) ) ( AVAILABLE ?auto_20334 ) ( SURFACE-AT ?auto_20336 ?auto_20330 ) ( ON ?auto_20336 ?auto_20321 ) ( CLEAR ?auto_20336 ) ( not ( = ?auto_20317 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20331 ?auto_20321 ) ) ( not ( = ?auto_20322 ?auto_20321 ) ) ( not ( = ?auto_20329 ?auto_20321 ) ) ( not ( = ?auto_20336 ?auto_20321 ) ) ( not ( = ?auto_20335 ?auto_20321 ) ) ( not ( = ?auto_20333 ?auto_20321 ) ) ( IS-CRATE ?auto_20333 ) ( not ( = ?auto_20317 ?auto_20328 ) ) ( not ( = ?auto_20318 ?auto_20328 ) ) ( not ( = ?auto_20331 ?auto_20328 ) ) ( not ( = ?auto_20322 ?auto_20328 ) ) ( not ( = ?auto_20329 ?auto_20328 ) ) ( not ( = ?auto_20336 ?auto_20328 ) ) ( not ( = ?auto_20335 ?auto_20328 ) ) ( not ( = ?auto_20333 ?auto_20328 ) ) ( not ( = ?auto_20321 ?auto_20328 ) ) ( AVAILABLE ?auto_20325 ) ( SURFACE-AT ?auto_20333 ?auto_20319 ) ( ON ?auto_20333 ?auto_20327 ) ( CLEAR ?auto_20333 ) ( not ( = ?auto_20317 ?auto_20327 ) ) ( not ( = ?auto_20318 ?auto_20327 ) ) ( not ( = ?auto_20331 ?auto_20327 ) ) ( not ( = ?auto_20322 ?auto_20327 ) ) ( not ( = ?auto_20329 ?auto_20327 ) ) ( not ( = ?auto_20336 ?auto_20327 ) ) ( not ( = ?auto_20335 ?auto_20327 ) ) ( not ( = ?auto_20333 ?auto_20327 ) ) ( not ( = ?auto_20321 ?auto_20327 ) ) ( not ( = ?auto_20328 ?auto_20327 ) ) ( SURFACE-AT ?auto_20326 ?auto_20337 ) ( CLEAR ?auto_20326 ) ( IS-CRATE ?auto_20328 ) ( not ( = ?auto_20317 ?auto_20326 ) ) ( not ( = ?auto_20318 ?auto_20326 ) ) ( not ( = ?auto_20331 ?auto_20326 ) ) ( not ( = ?auto_20322 ?auto_20326 ) ) ( not ( = ?auto_20329 ?auto_20326 ) ) ( not ( = ?auto_20336 ?auto_20326 ) ) ( not ( = ?auto_20335 ?auto_20326 ) ) ( not ( = ?auto_20333 ?auto_20326 ) ) ( not ( = ?auto_20321 ?auto_20326 ) ) ( not ( = ?auto_20328 ?auto_20326 ) ) ( not ( = ?auto_20327 ?auto_20326 ) ) ( AVAILABLE ?auto_20324 ) ( TRUCK-AT ?auto_20332 ?auto_20320 ) ( LIFTING ?auto_20323 ?auto_20328 ) )
    :subtasks
    ( ( !LOAD ?auto_20323 ?auto_20328 ?auto_20332 ?auto_20320 )
      ( MAKE-ON ?auto_20317 ?auto_20318 )
      ( MAKE-ON-VERIFY ?auto_20317 ?auto_20318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20338 - SURFACE
      ?auto_20339 - SURFACE
    )
    :vars
    (
      ?auto_20349 - HOIST
      ?auto_20343 - PLACE
      ?auto_20356 - PLACE
      ?auto_20346 - HOIST
      ?auto_20355 - SURFACE
      ?auto_20341 - SURFACE
      ?auto_20353 - PLACE
      ?auto_20350 - HOIST
      ?auto_20357 - SURFACE
      ?auto_20358 - SURFACE
      ?auto_20340 - PLACE
      ?auto_20347 - HOIST
      ?auto_20344 - SURFACE
      ?auto_20354 - SURFACE
      ?auto_20348 - SURFACE
      ?auto_20352 - SURFACE
      ?auto_20342 - SURFACE
      ?auto_20345 - SURFACE
      ?auto_20351 - TRUCK
      ?auto_20359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20349 ?auto_20343 ) ( IS-CRATE ?auto_20338 ) ( not ( = ?auto_20338 ?auto_20339 ) ) ( not ( = ?auto_20356 ?auto_20343 ) ) ( HOIST-AT ?auto_20346 ?auto_20356 ) ( not ( = ?auto_20349 ?auto_20346 ) ) ( SURFACE-AT ?auto_20338 ?auto_20356 ) ( ON ?auto_20338 ?auto_20355 ) ( CLEAR ?auto_20338 ) ( not ( = ?auto_20338 ?auto_20355 ) ) ( not ( = ?auto_20339 ?auto_20355 ) ) ( IS-CRATE ?auto_20339 ) ( not ( = ?auto_20338 ?auto_20341 ) ) ( not ( = ?auto_20339 ?auto_20341 ) ) ( not ( = ?auto_20355 ?auto_20341 ) ) ( not ( = ?auto_20353 ?auto_20343 ) ) ( not ( = ?auto_20356 ?auto_20353 ) ) ( HOIST-AT ?auto_20350 ?auto_20353 ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( SURFACE-AT ?auto_20339 ?auto_20353 ) ( ON ?auto_20339 ?auto_20357 ) ( CLEAR ?auto_20339 ) ( not ( = ?auto_20338 ?auto_20357 ) ) ( not ( = ?auto_20339 ?auto_20357 ) ) ( not ( = ?auto_20355 ?auto_20357 ) ) ( not ( = ?auto_20341 ?auto_20357 ) ) ( IS-CRATE ?auto_20341 ) ( not ( = ?auto_20338 ?auto_20358 ) ) ( not ( = ?auto_20339 ?auto_20358 ) ) ( not ( = ?auto_20355 ?auto_20358 ) ) ( not ( = ?auto_20341 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20340 ?auto_20343 ) ) ( not ( = ?auto_20356 ?auto_20340 ) ) ( not ( = ?auto_20353 ?auto_20340 ) ) ( HOIST-AT ?auto_20347 ?auto_20340 ) ( not ( = ?auto_20349 ?auto_20347 ) ) ( not ( = ?auto_20346 ?auto_20347 ) ) ( not ( = ?auto_20350 ?auto_20347 ) ) ( SURFACE-AT ?auto_20341 ?auto_20340 ) ( ON ?auto_20341 ?auto_20344 ) ( CLEAR ?auto_20341 ) ( not ( = ?auto_20338 ?auto_20344 ) ) ( not ( = ?auto_20339 ?auto_20344 ) ) ( not ( = ?auto_20355 ?auto_20344 ) ) ( not ( = ?auto_20341 ?auto_20344 ) ) ( not ( = ?auto_20357 ?auto_20344 ) ) ( not ( = ?auto_20358 ?auto_20344 ) ) ( IS-CRATE ?auto_20358 ) ( not ( = ?auto_20338 ?auto_20354 ) ) ( not ( = ?auto_20339 ?auto_20354 ) ) ( not ( = ?auto_20355 ?auto_20354 ) ) ( not ( = ?auto_20341 ?auto_20354 ) ) ( not ( = ?auto_20357 ?auto_20354 ) ) ( not ( = ?auto_20358 ?auto_20354 ) ) ( not ( = ?auto_20344 ?auto_20354 ) ) ( AVAILABLE ?auto_20346 ) ( SURFACE-AT ?auto_20358 ?auto_20356 ) ( ON ?auto_20358 ?auto_20348 ) ( CLEAR ?auto_20358 ) ( not ( = ?auto_20338 ?auto_20348 ) ) ( not ( = ?auto_20339 ?auto_20348 ) ) ( not ( = ?auto_20355 ?auto_20348 ) ) ( not ( = ?auto_20341 ?auto_20348 ) ) ( not ( = ?auto_20357 ?auto_20348 ) ) ( not ( = ?auto_20358 ?auto_20348 ) ) ( not ( = ?auto_20344 ?auto_20348 ) ) ( not ( = ?auto_20354 ?auto_20348 ) ) ( IS-CRATE ?auto_20354 ) ( not ( = ?auto_20338 ?auto_20352 ) ) ( not ( = ?auto_20339 ?auto_20352 ) ) ( not ( = ?auto_20355 ?auto_20352 ) ) ( not ( = ?auto_20341 ?auto_20352 ) ) ( not ( = ?auto_20357 ?auto_20352 ) ) ( not ( = ?auto_20358 ?auto_20352 ) ) ( not ( = ?auto_20344 ?auto_20352 ) ) ( not ( = ?auto_20354 ?auto_20352 ) ) ( not ( = ?auto_20348 ?auto_20352 ) ) ( AVAILABLE ?auto_20350 ) ( SURFACE-AT ?auto_20354 ?auto_20353 ) ( ON ?auto_20354 ?auto_20342 ) ( CLEAR ?auto_20354 ) ( not ( = ?auto_20338 ?auto_20342 ) ) ( not ( = ?auto_20339 ?auto_20342 ) ) ( not ( = ?auto_20355 ?auto_20342 ) ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20357 ?auto_20342 ) ) ( not ( = ?auto_20358 ?auto_20342 ) ) ( not ( = ?auto_20344 ?auto_20342 ) ) ( not ( = ?auto_20354 ?auto_20342 ) ) ( not ( = ?auto_20348 ?auto_20342 ) ) ( not ( = ?auto_20352 ?auto_20342 ) ) ( SURFACE-AT ?auto_20345 ?auto_20343 ) ( CLEAR ?auto_20345 ) ( IS-CRATE ?auto_20352 ) ( not ( = ?auto_20338 ?auto_20345 ) ) ( not ( = ?auto_20339 ?auto_20345 ) ) ( not ( = ?auto_20355 ?auto_20345 ) ) ( not ( = ?auto_20341 ?auto_20345 ) ) ( not ( = ?auto_20357 ?auto_20345 ) ) ( not ( = ?auto_20358 ?auto_20345 ) ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( not ( = ?auto_20354 ?auto_20345 ) ) ( not ( = ?auto_20348 ?auto_20345 ) ) ( not ( = ?auto_20352 ?auto_20345 ) ) ( not ( = ?auto_20342 ?auto_20345 ) ) ( AVAILABLE ?auto_20349 ) ( TRUCK-AT ?auto_20351 ?auto_20340 ) ( AVAILABLE ?auto_20347 ) ( SURFACE-AT ?auto_20352 ?auto_20340 ) ( ON ?auto_20352 ?auto_20359 ) ( CLEAR ?auto_20352 ) ( not ( = ?auto_20338 ?auto_20359 ) ) ( not ( = ?auto_20339 ?auto_20359 ) ) ( not ( = ?auto_20355 ?auto_20359 ) ) ( not ( = ?auto_20341 ?auto_20359 ) ) ( not ( = ?auto_20357 ?auto_20359 ) ) ( not ( = ?auto_20358 ?auto_20359 ) ) ( not ( = ?auto_20344 ?auto_20359 ) ) ( not ( = ?auto_20354 ?auto_20359 ) ) ( not ( = ?auto_20348 ?auto_20359 ) ) ( not ( = ?auto_20352 ?auto_20359 ) ) ( not ( = ?auto_20342 ?auto_20359 ) ) ( not ( = ?auto_20345 ?auto_20359 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20347 ?auto_20352 ?auto_20359 ?auto_20340 )
      ( MAKE-ON ?auto_20338 ?auto_20339 )
      ( MAKE-ON-VERIFY ?auto_20338 ?auto_20339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20360 - SURFACE
      ?auto_20361 - SURFACE
    )
    :vars
    (
      ?auto_20362 - HOIST
      ?auto_20373 - PLACE
      ?auto_20379 - PLACE
      ?auto_20377 - HOIST
      ?auto_20366 - SURFACE
      ?auto_20375 - SURFACE
      ?auto_20364 - PLACE
      ?auto_20371 - HOIST
      ?auto_20380 - SURFACE
      ?auto_20381 - SURFACE
      ?auto_20365 - PLACE
      ?auto_20363 - HOIST
      ?auto_20372 - SURFACE
      ?auto_20376 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20369 - SURFACE
      ?auto_20374 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20378 - SURFACE
      ?auto_20368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20362 ?auto_20373 ) ( IS-CRATE ?auto_20360 ) ( not ( = ?auto_20360 ?auto_20361 ) ) ( not ( = ?auto_20379 ?auto_20373 ) ) ( HOIST-AT ?auto_20377 ?auto_20379 ) ( not ( = ?auto_20362 ?auto_20377 ) ) ( SURFACE-AT ?auto_20360 ?auto_20379 ) ( ON ?auto_20360 ?auto_20366 ) ( CLEAR ?auto_20360 ) ( not ( = ?auto_20360 ?auto_20366 ) ) ( not ( = ?auto_20361 ?auto_20366 ) ) ( IS-CRATE ?auto_20361 ) ( not ( = ?auto_20360 ?auto_20375 ) ) ( not ( = ?auto_20361 ?auto_20375 ) ) ( not ( = ?auto_20366 ?auto_20375 ) ) ( not ( = ?auto_20364 ?auto_20373 ) ) ( not ( = ?auto_20379 ?auto_20364 ) ) ( HOIST-AT ?auto_20371 ?auto_20364 ) ( not ( = ?auto_20362 ?auto_20371 ) ) ( not ( = ?auto_20377 ?auto_20371 ) ) ( SURFACE-AT ?auto_20361 ?auto_20364 ) ( ON ?auto_20361 ?auto_20380 ) ( CLEAR ?auto_20361 ) ( not ( = ?auto_20360 ?auto_20380 ) ) ( not ( = ?auto_20361 ?auto_20380 ) ) ( not ( = ?auto_20366 ?auto_20380 ) ) ( not ( = ?auto_20375 ?auto_20380 ) ) ( IS-CRATE ?auto_20375 ) ( not ( = ?auto_20360 ?auto_20381 ) ) ( not ( = ?auto_20361 ?auto_20381 ) ) ( not ( = ?auto_20366 ?auto_20381 ) ) ( not ( = ?auto_20375 ?auto_20381 ) ) ( not ( = ?auto_20380 ?auto_20381 ) ) ( not ( = ?auto_20365 ?auto_20373 ) ) ( not ( = ?auto_20379 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( HOIST-AT ?auto_20363 ?auto_20365 ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( not ( = ?auto_20377 ?auto_20363 ) ) ( not ( = ?auto_20371 ?auto_20363 ) ) ( SURFACE-AT ?auto_20375 ?auto_20365 ) ( ON ?auto_20375 ?auto_20372 ) ( CLEAR ?auto_20375 ) ( not ( = ?auto_20360 ?auto_20372 ) ) ( not ( = ?auto_20361 ?auto_20372 ) ) ( not ( = ?auto_20366 ?auto_20372 ) ) ( not ( = ?auto_20375 ?auto_20372 ) ) ( not ( = ?auto_20380 ?auto_20372 ) ) ( not ( = ?auto_20381 ?auto_20372 ) ) ( IS-CRATE ?auto_20381 ) ( not ( = ?auto_20360 ?auto_20376 ) ) ( not ( = ?auto_20361 ?auto_20376 ) ) ( not ( = ?auto_20366 ?auto_20376 ) ) ( not ( = ?auto_20375 ?auto_20376 ) ) ( not ( = ?auto_20380 ?auto_20376 ) ) ( not ( = ?auto_20381 ?auto_20376 ) ) ( not ( = ?auto_20372 ?auto_20376 ) ) ( AVAILABLE ?auto_20377 ) ( SURFACE-AT ?auto_20381 ?auto_20379 ) ( ON ?auto_20381 ?auto_20367 ) ( CLEAR ?auto_20381 ) ( not ( = ?auto_20360 ?auto_20367 ) ) ( not ( = ?auto_20361 ?auto_20367 ) ) ( not ( = ?auto_20366 ?auto_20367 ) ) ( not ( = ?auto_20375 ?auto_20367 ) ) ( not ( = ?auto_20380 ?auto_20367 ) ) ( not ( = ?auto_20381 ?auto_20367 ) ) ( not ( = ?auto_20372 ?auto_20367 ) ) ( not ( = ?auto_20376 ?auto_20367 ) ) ( IS-CRATE ?auto_20376 ) ( not ( = ?auto_20360 ?auto_20369 ) ) ( not ( = ?auto_20361 ?auto_20369 ) ) ( not ( = ?auto_20366 ?auto_20369 ) ) ( not ( = ?auto_20375 ?auto_20369 ) ) ( not ( = ?auto_20380 ?auto_20369 ) ) ( not ( = ?auto_20381 ?auto_20369 ) ) ( not ( = ?auto_20372 ?auto_20369 ) ) ( not ( = ?auto_20376 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( AVAILABLE ?auto_20371 ) ( SURFACE-AT ?auto_20376 ?auto_20364 ) ( ON ?auto_20376 ?auto_20374 ) ( CLEAR ?auto_20376 ) ( not ( = ?auto_20360 ?auto_20374 ) ) ( not ( = ?auto_20361 ?auto_20374 ) ) ( not ( = ?auto_20366 ?auto_20374 ) ) ( not ( = ?auto_20375 ?auto_20374 ) ) ( not ( = ?auto_20380 ?auto_20374 ) ) ( not ( = ?auto_20381 ?auto_20374 ) ) ( not ( = ?auto_20372 ?auto_20374 ) ) ( not ( = ?auto_20376 ?auto_20374 ) ) ( not ( = ?auto_20367 ?auto_20374 ) ) ( not ( = ?auto_20369 ?auto_20374 ) ) ( SURFACE-AT ?auto_20370 ?auto_20373 ) ( CLEAR ?auto_20370 ) ( IS-CRATE ?auto_20369 ) ( not ( = ?auto_20360 ?auto_20370 ) ) ( not ( = ?auto_20361 ?auto_20370 ) ) ( not ( = ?auto_20366 ?auto_20370 ) ) ( not ( = ?auto_20375 ?auto_20370 ) ) ( not ( = ?auto_20380 ?auto_20370 ) ) ( not ( = ?auto_20381 ?auto_20370 ) ) ( not ( = ?auto_20372 ?auto_20370 ) ) ( not ( = ?auto_20376 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20374 ?auto_20370 ) ) ( AVAILABLE ?auto_20362 ) ( AVAILABLE ?auto_20363 ) ( SURFACE-AT ?auto_20369 ?auto_20365 ) ( ON ?auto_20369 ?auto_20378 ) ( CLEAR ?auto_20369 ) ( not ( = ?auto_20360 ?auto_20378 ) ) ( not ( = ?auto_20361 ?auto_20378 ) ) ( not ( = ?auto_20366 ?auto_20378 ) ) ( not ( = ?auto_20375 ?auto_20378 ) ) ( not ( = ?auto_20380 ?auto_20378 ) ) ( not ( = ?auto_20381 ?auto_20378 ) ) ( not ( = ?auto_20372 ?auto_20378 ) ) ( not ( = ?auto_20376 ?auto_20378 ) ) ( not ( = ?auto_20367 ?auto_20378 ) ) ( not ( = ?auto_20369 ?auto_20378 ) ) ( not ( = ?auto_20374 ?auto_20378 ) ) ( not ( = ?auto_20370 ?auto_20378 ) ) ( TRUCK-AT ?auto_20368 ?auto_20373 ) )
    :subtasks
    ( ( !DRIVE ?auto_20368 ?auto_20373 ?auto_20365 )
      ( MAKE-ON ?auto_20360 ?auto_20361 )
      ( MAKE-ON-VERIFY ?auto_20360 ?auto_20361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20382 - SURFACE
      ?auto_20383 - SURFACE
    )
    :vars
    (
      ?auto_20397 - HOIST
      ?auto_20391 - PLACE
      ?auto_20389 - PLACE
      ?auto_20386 - HOIST
      ?auto_20394 - SURFACE
      ?auto_20388 - SURFACE
      ?auto_20385 - PLACE
      ?auto_20396 - HOIST
      ?auto_20400 - SURFACE
      ?auto_20399 - SURFACE
      ?auto_20393 - PLACE
      ?auto_20384 - HOIST
      ?auto_20392 - SURFACE
      ?auto_20390 - SURFACE
      ?auto_20403 - SURFACE
      ?auto_20395 - SURFACE
      ?auto_20398 - SURFACE
      ?auto_20402 - SURFACE
      ?auto_20387 - SURFACE
      ?auto_20401 - TRUCK
      ?auto_20404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20397 ?auto_20391 ) ( IS-CRATE ?auto_20382 ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20389 ?auto_20391 ) ) ( HOIST-AT ?auto_20386 ?auto_20389 ) ( not ( = ?auto_20397 ?auto_20386 ) ) ( SURFACE-AT ?auto_20382 ?auto_20389 ) ( ON ?auto_20382 ?auto_20394 ) ( CLEAR ?auto_20382 ) ( not ( = ?auto_20382 ?auto_20394 ) ) ( not ( = ?auto_20383 ?auto_20394 ) ) ( IS-CRATE ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20388 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20394 ?auto_20388 ) ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20389 ?auto_20385 ) ) ( HOIST-AT ?auto_20396 ?auto_20385 ) ( not ( = ?auto_20397 ?auto_20396 ) ) ( not ( = ?auto_20386 ?auto_20396 ) ) ( SURFACE-AT ?auto_20383 ?auto_20385 ) ( ON ?auto_20383 ?auto_20400 ) ( CLEAR ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20400 ) ) ( not ( = ?auto_20383 ?auto_20400 ) ) ( not ( = ?auto_20394 ?auto_20400 ) ) ( not ( = ?auto_20388 ?auto_20400 ) ) ( IS-CRATE ?auto_20388 ) ( not ( = ?auto_20382 ?auto_20399 ) ) ( not ( = ?auto_20383 ?auto_20399 ) ) ( not ( = ?auto_20394 ?auto_20399 ) ) ( not ( = ?auto_20388 ?auto_20399 ) ) ( not ( = ?auto_20400 ?auto_20399 ) ) ( not ( = ?auto_20393 ?auto_20391 ) ) ( not ( = ?auto_20389 ?auto_20393 ) ) ( not ( = ?auto_20385 ?auto_20393 ) ) ( HOIST-AT ?auto_20384 ?auto_20393 ) ( not ( = ?auto_20397 ?auto_20384 ) ) ( not ( = ?auto_20386 ?auto_20384 ) ) ( not ( = ?auto_20396 ?auto_20384 ) ) ( SURFACE-AT ?auto_20388 ?auto_20393 ) ( ON ?auto_20388 ?auto_20392 ) ( CLEAR ?auto_20388 ) ( not ( = ?auto_20382 ?auto_20392 ) ) ( not ( = ?auto_20383 ?auto_20392 ) ) ( not ( = ?auto_20394 ?auto_20392 ) ) ( not ( = ?auto_20388 ?auto_20392 ) ) ( not ( = ?auto_20400 ?auto_20392 ) ) ( not ( = ?auto_20399 ?auto_20392 ) ) ( IS-CRATE ?auto_20399 ) ( not ( = ?auto_20382 ?auto_20390 ) ) ( not ( = ?auto_20383 ?auto_20390 ) ) ( not ( = ?auto_20394 ?auto_20390 ) ) ( not ( = ?auto_20388 ?auto_20390 ) ) ( not ( = ?auto_20400 ?auto_20390 ) ) ( not ( = ?auto_20399 ?auto_20390 ) ) ( not ( = ?auto_20392 ?auto_20390 ) ) ( AVAILABLE ?auto_20386 ) ( SURFACE-AT ?auto_20399 ?auto_20389 ) ( ON ?auto_20399 ?auto_20403 ) ( CLEAR ?auto_20399 ) ( not ( = ?auto_20382 ?auto_20403 ) ) ( not ( = ?auto_20383 ?auto_20403 ) ) ( not ( = ?auto_20394 ?auto_20403 ) ) ( not ( = ?auto_20388 ?auto_20403 ) ) ( not ( = ?auto_20400 ?auto_20403 ) ) ( not ( = ?auto_20399 ?auto_20403 ) ) ( not ( = ?auto_20392 ?auto_20403 ) ) ( not ( = ?auto_20390 ?auto_20403 ) ) ( IS-CRATE ?auto_20390 ) ( not ( = ?auto_20382 ?auto_20395 ) ) ( not ( = ?auto_20383 ?auto_20395 ) ) ( not ( = ?auto_20394 ?auto_20395 ) ) ( not ( = ?auto_20388 ?auto_20395 ) ) ( not ( = ?auto_20400 ?auto_20395 ) ) ( not ( = ?auto_20399 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20395 ) ) ( not ( = ?auto_20390 ?auto_20395 ) ) ( not ( = ?auto_20403 ?auto_20395 ) ) ( AVAILABLE ?auto_20396 ) ( SURFACE-AT ?auto_20390 ?auto_20385 ) ( ON ?auto_20390 ?auto_20398 ) ( CLEAR ?auto_20390 ) ( not ( = ?auto_20382 ?auto_20398 ) ) ( not ( = ?auto_20383 ?auto_20398 ) ) ( not ( = ?auto_20394 ?auto_20398 ) ) ( not ( = ?auto_20388 ?auto_20398 ) ) ( not ( = ?auto_20400 ?auto_20398 ) ) ( not ( = ?auto_20399 ?auto_20398 ) ) ( not ( = ?auto_20392 ?auto_20398 ) ) ( not ( = ?auto_20390 ?auto_20398 ) ) ( not ( = ?auto_20403 ?auto_20398 ) ) ( not ( = ?auto_20395 ?auto_20398 ) ) ( IS-CRATE ?auto_20395 ) ( not ( = ?auto_20382 ?auto_20402 ) ) ( not ( = ?auto_20383 ?auto_20402 ) ) ( not ( = ?auto_20394 ?auto_20402 ) ) ( not ( = ?auto_20388 ?auto_20402 ) ) ( not ( = ?auto_20400 ?auto_20402 ) ) ( not ( = ?auto_20399 ?auto_20402 ) ) ( not ( = ?auto_20392 ?auto_20402 ) ) ( not ( = ?auto_20390 ?auto_20402 ) ) ( not ( = ?auto_20403 ?auto_20402 ) ) ( not ( = ?auto_20395 ?auto_20402 ) ) ( not ( = ?auto_20398 ?auto_20402 ) ) ( AVAILABLE ?auto_20384 ) ( SURFACE-AT ?auto_20395 ?auto_20393 ) ( ON ?auto_20395 ?auto_20387 ) ( CLEAR ?auto_20395 ) ( not ( = ?auto_20382 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20394 ?auto_20387 ) ) ( not ( = ?auto_20388 ?auto_20387 ) ) ( not ( = ?auto_20400 ?auto_20387 ) ) ( not ( = ?auto_20399 ?auto_20387 ) ) ( not ( = ?auto_20392 ?auto_20387 ) ) ( not ( = ?auto_20390 ?auto_20387 ) ) ( not ( = ?auto_20403 ?auto_20387 ) ) ( not ( = ?auto_20395 ?auto_20387 ) ) ( not ( = ?auto_20398 ?auto_20387 ) ) ( not ( = ?auto_20402 ?auto_20387 ) ) ( TRUCK-AT ?auto_20401 ?auto_20391 ) ( SURFACE-AT ?auto_20404 ?auto_20391 ) ( CLEAR ?auto_20404 ) ( LIFTING ?auto_20397 ?auto_20402 ) ( IS-CRATE ?auto_20402 ) ( not ( = ?auto_20382 ?auto_20404 ) ) ( not ( = ?auto_20383 ?auto_20404 ) ) ( not ( = ?auto_20394 ?auto_20404 ) ) ( not ( = ?auto_20388 ?auto_20404 ) ) ( not ( = ?auto_20400 ?auto_20404 ) ) ( not ( = ?auto_20399 ?auto_20404 ) ) ( not ( = ?auto_20392 ?auto_20404 ) ) ( not ( = ?auto_20390 ?auto_20404 ) ) ( not ( = ?auto_20403 ?auto_20404 ) ) ( not ( = ?auto_20395 ?auto_20404 ) ) ( not ( = ?auto_20398 ?auto_20404 ) ) ( not ( = ?auto_20402 ?auto_20404 ) ) ( not ( = ?auto_20387 ?auto_20404 ) ) )
    :subtasks
    ( ( !DROP ?auto_20397 ?auto_20402 ?auto_20404 ?auto_20391 )
      ( MAKE-ON ?auto_20382 ?auto_20383 )
      ( MAKE-ON-VERIFY ?auto_20382 ?auto_20383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20405 - SURFACE
      ?auto_20406 - SURFACE
    )
    :vars
    (
      ?auto_20417 - HOIST
      ?auto_20418 - PLACE
      ?auto_20408 - PLACE
      ?auto_20409 - HOIST
      ?auto_20407 - SURFACE
      ?auto_20424 - SURFACE
      ?auto_20423 - PLACE
      ?auto_20415 - HOIST
      ?auto_20421 - SURFACE
      ?auto_20419 - SURFACE
      ?auto_20410 - PLACE
      ?auto_20427 - HOIST
      ?auto_20426 - SURFACE
      ?auto_20414 - SURFACE
      ?auto_20413 - SURFACE
      ?auto_20416 - SURFACE
      ?auto_20420 - SURFACE
      ?auto_20412 - SURFACE
      ?auto_20411 - SURFACE
      ?auto_20422 - TRUCK
      ?auto_20425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20417 ?auto_20418 ) ( IS-CRATE ?auto_20405 ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20408 ?auto_20418 ) ) ( HOIST-AT ?auto_20409 ?auto_20408 ) ( not ( = ?auto_20417 ?auto_20409 ) ) ( SURFACE-AT ?auto_20405 ?auto_20408 ) ( ON ?auto_20405 ?auto_20407 ) ( CLEAR ?auto_20405 ) ( not ( = ?auto_20405 ?auto_20407 ) ) ( not ( = ?auto_20406 ?auto_20407 ) ) ( IS-CRATE ?auto_20406 ) ( not ( = ?auto_20405 ?auto_20424 ) ) ( not ( = ?auto_20406 ?auto_20424 ) ) ( not ( = ?auto_20407 ?auto_20424 ) ) ( not ( = ?auto_20423 ?auto_20418 ) ) ( not ( = ?auto_20408 ?auto_20423 ) ) ( HOIST-AT ?auto_20415 ?auto_20423 ) ( not ( = ?auto_20417 ?auto_20415 ) ) ( not ( = ?auto_20409 ?auto_20415 ) ) ( SURFACE-AT ?auto_20406 ?auto_20423 ) ( ON ?auto_20406 ?auto_20421 ) ( CLEAR ?auto_20406 ) ( not ( = ?auto_20405 ?auto_20421 ) ) ( not ( = ?auto_20406 ?auto_20421 ) ) ( not ( = ?auto_20407 ?auto_20421 ) ) ( not ( = ?auto_20424 ?auto_20421 ) ) ( IS-CRATE ?auto_20424 ) ( not ( = ?auto_20405 ?auto_20419 ) ) ( not ( = ?auto_20406 ?auto_20419 ) ) ( not ( = ?auto_20407 ?auto_20419 ) ) ( not ( = ?auto_20424 ?auto_20419 ) ) ( not ( = ?auto_20421 ?auto_20419 ) ) ( not ( = ?auto_20410 ?auto_20418 ) ) ( not ( = ?auto_20408 ?auto_20410 ) ) ( not ( = ?auto_20423 ?auto_20410 ) ) ( HOIST-AT ?auto_20427 ?auto_20410 ) ( not ( = ?auto_20417 ?auto_20427 ) ) ( not ( = ?auto_20409 ?auto_20427 ) ) ( not ( = ?auto_20415 ?auto_20427 ) ) ( SURFACE-AT ?auto_20424 ?auto_20410 ) ( ON ?auto_20424 ?auto_20426 ) ( CLEAR ?auto_20424 ) ( not ( = ?auto_20405 ?auto_20426 ) ) ( not ( = ?auto_20406 ?auto_20426 ) ) ( not ( = ?auto_20407 ?auto_20426 ) ) ( not ( = ?auto_20424 ?auto_20426 ) ) ( not ( = ?auto_20421 ?auto_20426 ) ) ( not ( = ?auto_20419 ?auto_20426 ) ) ( IS-CRATE ?auto_20419 ) ( not ( = ?auto_20405 ?auto_20414 ) ) ( not ( = ?auto_20406 ?auto_20414 ) ) ( not ( = ?auto_20407 ?auto_20414 ) ) ( not ( = ?auto_20424 ?auto_20414 ) ) ( not ( = ?auto_20421 ?auto_20414 ) ) ( not ( = ?auto_20419 ?auto_20414 ) ) ( not ( = ?auto_20426 ?auto_20414 ) ) ( AVAILABLE ?auto_20409 ) ( SURFACE-AT ?auto_20419 ?auto_20408 ) ( ON ?auto_20419 ?auto_20413 ) ( CLEAR ?auto_20419 ) ( not ( = ?auto_20405 ?auto_20413 ) ) ( not ( = ?auto_20406 ?auto_20413 ) ) ( not ( = ?auto_20407 ?auto_20413 ) ) ( not ( = ?auto_20424 ?auto_20413 ) ) ( not ( = ?auto_20421 ?auto_20413 ) ) ( not ( = ?auto_20419 ?auto_20413 ) ) ( not ( = ?auto_20426 ?auto_20413 ) ) ( not ( = ?auto_20414 ?auto_20413 ) ) ( IS-CRATE ?auto_20414 ) ( not ( = ?auto_20405 ?auto_20416 ) ) ( not ( = ?auto_20406 ?auto_20416 ) ) ( not ( = ?auto_20407 ?auto_20416 ) ) ( not ( = ?auto_20424 ?auto_20416 ) ) ( not ( = ?auto_20421 ?auto_20416 ) ) ( not ( = ?auto_20419 ?auto_20416 ) ) ( not ( = ?auto_20426 ?auto_20416 ) ) ( not ( = ?auto_20414 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20416 ) ) ( AVAILABLE ?auto_20415 ) ( SURFACE-AT ?auto_20414 ?auto_20423 ) ( ON ?auto_20414 ?auto_20420 ) ( CLEAR ?auto_20414 ) ( not ( = ?auto_20405 ?auto_20420 ) ) ( not ( = ?auto_20406 ?auto_20420 ) ) ( not ( = ?auto_20407 ?auto_20420 ) ) ( not ( = ?auto_20424 ?auto_20420 ) ) ( not ( = ?auto_20421 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( not ( = ?auto_20426 ?auto_20420 ) ) ( not ( = ?auto_20414 ?auto_20420 ) ) ( not ( = ?auto_20413 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( IS-CRATE ?auto_20416 ) ( not ( = ?auto_20405 ?auto_20412 ) ) ( not ( = ?auto_20406 ?auto_20412 ) ) ( not ( = ?auto_20407 ?auto_20412 ) ) ( not ( = ?auto_20424 ?auto_20412 ) ) ( not ( = ?auto_20421 ?auto_20412 ) ) ( not ( = ?auto_20419 ?auto_20412 ) ) ( not ( = ?auto_20426 ?auto_20412 ) ) ( not ( = ?auto_20414 ?auto_20412 ) ) ( not ( = ?auto_20413 ?auto_20412 ) ) ( not ( = ?auto_20416 ?auto_20412 ) ) ( not ( = ?auto_20420 ?auto_20412 ) ) ( AVAILABLE ?auto_20427 ) ( SURFACE-AT ?auto_20416 ?auto_20410 ) ( ON ?auto_20416 ?auto_20411 ) ( CLEAR ?auto_20416 ) ( not ( = ?auto_20405 ?auto_20411 ) ) ( not ( = ?auto_20406 ?auto_20411 ) ) ( not ( = ?auto_20407 ?auto_20411 ) ) ( not ( = ?auto_20424 ?auto_20411 ) ) ( not ( = ?auto_20421 ?auto_20411 ) ) ( not ( = ?auto_20419 ?auto_20411 ) ) ( not ( = ?auto_20426 ?auto_20411 ) ) ( not ( = ?auto_20414 ?auto_20411 ) ) ( not ( = ?auto_20413 ?auto_20411 ) ) ( not ( = ?auto_20416 ?auto_20411 ) ) ( not ( = ?auto_20420 ?auto_20411 ) ) ( not ( = ?auto_20412 ?auto_20411 ) ) ( TRUCK-AT ?auto_20422 ?auto_20418 ) ( SURFACE-AT ?auto_20425 ?auto_20418 ) ( CLEAR ?auto_20425 ) ( IS-CRATE ?auto_20412 ) ( not ( = ?auto_20405 ?auto_20425 ) ) ( not ( = ?auto_20406 ?auto_20425 ) ) ( not ( = ?auto_20407 ?auto_20425 ) ) ( not ( = ?auto_20424 ?auto_20425 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( not ( = ?auto_20419 ?auto_20425 ) ) ( not ( = ?auto_20426 ?auto_20425 ) ) ( not ( = ?auto_20414 ?auto_20425 ) ) ( not ( = ?auto_20413 ?auto_20425 ) ) ( not ( = ?auto_20416 ?auto_20425 ) ) ( not ( = ?auto_20420 ?auto_20425 ) ) ( not ( = ?auto_20412 ?auto_20425 ) ) ( not ( = ?auto_20411 ?auto_20425 ) ) ( AVAILABLE ?auto_20417 ) ( IN ?auto_20412 ?auto_20422 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20417 ?auto_20412 ?auto_20422 ?auto_20418 )
      ( MAKE-ON ?auto_20405 ?auto_20406 )
      ( MAKE-ON-VERIFY ?auto_20405 ?auto_20406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20428 - SURFACE
      ?auto_20429 - SURFACE
    )
    :vars
    (
      ?auto_20435 - HOIST
      ?auto_20434 - PLACE
      ?auto_20432 - PLACE
      ?auto_20437 - HOIST
      ?auto_20446 - SURFACE
      ?auto_20439 - SURFACE
      ?auto_20436 - PLACE
      ?auto_20449 - HOIST
      ?auto_20447 - SURFACE
      ?auto_20443 - SURFACE
      ?auto_20450 - PLACE
      ?auto_20440 - HOIST
      ?auto_20441 - SURFACE
      ?auto_20445 - SURFACE
      ?auto_20433 - SURFACE
      ?auto_20431 - SURFACE
      ?auto_20430 - SURFACE
      ?auto_20444 - SURFACE
      ?auto_20448 - SURFACE
      ?auto_20442 - SURFACE
      ?auto_20438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20435 ?auto_20434 ) ( IS-CRATE ?auto_20428 ) ( not ( = ?auto_20428 ?auto_20429 ) ) ( not ( = ?auto_20432 ?auto_20434 ) ) ( HOIST-AT ?auto_20437 ?auto_20432 ) ( not ( = ?auto_20435 ?auto_20437 ) ) ( SURFACE-AT ?auto_20428 ?auto_20432 ) ( ON ?auto_20428 ?auto_20446 ) ( CLEAR ?auto_20428 ) ( not ( = ?auto_20428 ?auto_20446 ) ) ( not ( = ?auto_20429 ?auto_20446 ) ) ( IS-CRATE ?auto_20429 ) ( not ( = ?auto_20428 ?auto_20439 ) ) ( not ( = ?auto_20429 ?auto_20439 ) ) ( not ( = ?auto_20446 ?auto_20439 ) ) ( not ( = ?auto_20436 ?auto_20434 ) ) ( not ( = ?auto_20432 ?auto_20436 ) ) ( HOIST-AT ?auto_20449 ?auto_20436 ) ( not ( = ?auto_20435 ?auto_20449 ) ) ( not ( = ?auto_20437 ?auto_20449 ) ) ( SURFACE-AT ?auto_20429 ?auto_20436 ) ( ON ?auto_20429 ?auto_20447 ) ( CLEAR ?auto_20429 ) ( not ( = ?auto_20428 ?auto_20447 ) ) ( not ( = ?auto_20429 ?auto_20447 ) ) ( not ( = ?auto_20446 ?auto_20447 ) ) ( not ( = ?auto_20439 ?auto_20447 ) ) ( IS-CRATE ?auto_20439 ) ( not ( = ?auto_20428 ?auto_20443 ) ) ( not ( = ?auto_20429 ?auto_20443 ) ) ( not ( = ?auto_20446 ?auto_20443 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20447 ?auto_20443 ) ) ( not ( = ?auto_20450 ?auto_20434 ) ) ( not ( = ?auto_20432 ?auto_20450 ) ) ( not ( = ?auto_20436 ?auto_20450 ) ) ( HOIST-AT ?auto_20440 ?auto_20450 ) ( not ( = ?auto_20435 ?auto_20440 ) ) ( not ( = ?auto_20437 ?auto_20440 ) ) ( not ( = ?auto_20449 ?auto_20440 ) ) ( SURFACE-AT ?auto_20439 ?auto_20450 ) ( ON ?auto_20439 ?auto_20441 ) ( CLEAR ?auto_20439 ) ( not ( = ?auto_20428 ?auto_20441 ) ) ( not ( = ?auto_20429 ?auto_20441 ) ) ( not ( = ?auto_20446 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20447 ?auto_20441 ) ) ( not ( = ?auto_20443 ?auto_20441 ) ) ( IS-CRATE ?auto_20443 ) ( not ( = ?auto_20428 ?auto_20445 ) ) ( not ( = ?auto_20429 ?auto_20445 ) ) ( not ( = ?auto_20446 ?auto_20445 ) ) ( not ( = ?auto_20439 ?auto_20445 ) ) ( not ( = ?auto_20447 ?auto_20445 ) ) ( not ( = ?auto_20443 ?auto_20445 ) ) ( not ( = ?auto_20441 ?auto_20445 ) ) ( AVAILABLE ?auto_20437 ) ( SURFACE-AT ?auto_20443 ?auto_20432 ) ( ON ?auto_20443 ?auto_20433 ) ( CLEAR ?auto_20443 ) ( not ( = ?auto_20428 ?auto_20433 ) ) ( not ( = ?auto_20429 ?auto_20433 ) ) ( not ( = ?auto_20446 ?auto_20433 ) ) ( not ( = ?auto_20439 ?auto_20433 ) ) ( not ( = ?auto_20447 ?auto_20433 ) ) ( not ( = ?auto_20443 ?auto_20433 ) ) ( not ( = ?auto_20441 ?auto_20433 ) ) ( not ( = ?auto_20445 ?auto_20433 ) ) ( IS-CRATE ?auto_20445 ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20446 ?auto_20431 ) ) ( not ( = ?auto_20439 ?auto_20431 ) ) ( not ( = ?auto_20447 ?auto_20431 ) ) ( not ( = ?auto_20443 ?auto_20431 ) ) ( not ( = ?auto_20441 ?auto_20431 ) ) ( not ( = ?auto_20445 ?auto_20431 ) ) ( not ( = ?auto_20433 ?auto_20431 ) ) ( AVAILABLE ?auto_20449 ) ( SURFACE-AT ?auto_20445 ?auto_20436 ) ( ON ?auto_20445 ?auto_20430 ) ( CLEAR ?auto_20445 ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20446 ?auto_20430 ) ) ( not ( = ?auto_20439 ?auto_20430 ) ) ( not ( = ?auto_20447 ?auto_20430 ) ) ( not ( = ?auto_20443 ?auto_20430 ) ) ( not ( = ?auto_20441 ?auto_20430 ) ) ( not ( = ?auto_20445 ?auto_20430 ) ) ( not ( = ?auto_20433 ?auto_20430 ) ) ( not ( = ?auto_20431 ?auto_20430 ) ) ( IS-CRATE ?auto_20431 ) ( not ( = ?auto_20428 ?auto_20444 ) ) ( not ( = ?auto_20429 ?auto_20444 ) ) ( not ( = ?auto_20446 ?auto_20444 ) ) ( not ( = ?auto_20439 ?auto_20444 ) ) ( not ( = ?auto_20447 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( not ( = ?auto_20441 ?auto_20444 ) ) ( not ( = ?auto_20445 ?auto_20444 ) ) ( not ( = ?auto_20433 ?auto_20444 ) ) ( not ( = ?auto_20431 ?auto_20444 ) ) ( not ( = ?auto_20430 ?auto_20444 ) ) ( AVAILABLE ?auto_20440 ) ( SURFACE-AT ?auto_20431 ?auto_20450 ) ( ON ?auto_20431 ?auto_20448 ) ( CLEAR ?auto_20431 ) ( not ( = ?auto_20428 ?auto_20448 ) ) ( not ( = ?auto_20429 ?auto_20448 ) ) ( not ( = ?auto_20446 ?auto_20448 ) ) ( not ( = ?auto_20439 ?auto_20448 ) ) ( not ( = ?auto_20447 ?auto_20448 ) ) ( not ( = ?auto_20443 ?auto_20448 ) ) ( not ( = ?auto_20441 ?auto_20448 ) ) ( not ( = ?auto_20445 ?auto_20448 ) ) ( not ( = ?auto_20433 ?auto_20448 ) ) ( not ( = ?auto_20431 ?auto_20448 ) ) ( not ( = ?auto_20430 ?auto_20448 ) ) ( not ( = ?auto_20444 ?auto_20448 ) ) ( SURFACE-AT ?auto_20442 ?auto_20434 ) ( CLEAR ?auto_20442 ) ( IS-CRATE ?auto_20444 ) ( not ( = ?auto_20428 ?auto_20442 ) ) ( not ( = ?auto_20429 ?auto_20442 ) ) ( not ( = ?auto_20446 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20447 ?auto_20442 ) ) ( not ( = ?auto_20443 ?auto_20442 ) ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20445 ?auto_20442 ) ) ( not ( = ?auto_20433 ?auto_20442 ) ) ( not ( = ?auto_20431 ?auto_20442 ) ) ( not ( = ?auto_20430 ?auto_20442 ) ) ( not ( = ?auto_20444 ?auto_20442 ) ) ( not ( = ?auto_20448 ?auto_20442 ) ) ( AVAILABLE ?auto_20435 ) ( IN ?auto_20444 ?auto_20438 ) ( TRUCK-AT ?auto_20438 ?auto_20436 ) )
    :subtasks
    ( ( !DRIVE ?auto_20438 ?auto_20436 ?auto_20434 )
      ( MAKE-ON ?auto_20428 ?auto_20429 )
      ( MAKE-ON-VERIFY ?auto_20428 ?auto_20429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20451 - SURFACE
      ?auto_20452 - SURFACE
    )
    :vars
    (
      ?auto_20461 - HOIST
      ?auto_20473 - PLACE
      ?auto_20469 - PLACE
      ?auto_20466 - HOIST
      ?auto_20453 - SURFACE
      ?auto_20468 - SURFACE
      ?auto_20465 - PLACE
      ?auto_20457 - HOIST
      ?auto_20459 - SURFACE
      ?auto_20467 - SURFACE
      ?auto_20456 - PLACE
      ?auto_20472 - HOIST
      ?auto_20460 - SURFACE
      ?auto_20455 - SURFACE
      ?auto_20471 - SURFACE
      ?auto_20463 - SURFACE
      ?auto_20454 - SURFACE
      ?auto_20464 - SURFACE
      ?auto_20458 - SURFACE
      ?auto_20470 - SURFACE
      ?auto_20462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20461 ?auto_20473 ) ( IS-CRATE ?auto_20451 ) ( not ( = ?auto_20451 ?auto_20452 ) ) ( not ( = ?auto_20469 ?auto_20473 ) ) ( HOIST-AT ?auto_20466 ?auto_20469 ) ( not ( = ?auto_20461 ?auto_20466 ) ) ( SURFACE-AT ?auto_20451 ?auto_20469 ) ( ON ?auto_20451 ?auto_20453 ) ( CLEAR ?auto_20451 ) ( not ( = ?auto_20451 ?auto_20453 ) ) ( not ( = ?auto_20452 ?auto_20453 ) ) ( IS-CRATE ?auto_20452 ) ( not ( = ?auto_20451 ?auto_20468 ) ) ( not ( = ?auto_20452 ?auto_20468 ) ) ( not ( = ?auto_20453 ?auto_20468 ) ) ( not ( = ?auto_20465 ?auto_20473 ) ) ( not ( = ?auto_20469 ?auto_20465 ) ) ( HOIST-AT ?auto_20457 ?auto_20465 ) ( not ( = ?auto_20461 ?auto_20457 ) ) ( not ( = ?auto_20466 ?auto_20457 ) ) ( SURFACE-AT ?auto_20452 ?auto_20465 ) ( ON ?auto_20452 ?auto_20459 ) ( CLEAR ?auto_20452 ) ( not ( = ?auto_20451 ?auto_20459 ) ) ( not ( = ?auto_20452 ?auto_20459 ) ) ( not ( = ?auto_20453 ?auto_20459 ) ) ( not ( = ?auto_20468 ?auto_20459 ) ) ( IS-CRATE ?auto_20468 ) ( not ( = ?auto_20451 ?auto_20467 ) ) ( not ( = ?auto_20452 ?auto_20467 ) ) ( not ( = ?auto_20453 ?auto_20467 ) ) ( not ( = ?auto_20468 ?auto_20467 ) ) ( not ( = ?auto_20459 ?auto_20467 ) ) ( not ( = ?auto_20456 ?auto_20473 ) ) ( not ( = ?auto_20469 ?auto_20456 ) ) ( not ( = ?auto_20465 ?auto_20456 ) ) ( HOIST-AT ?auto_20472 ?auto_20456 ) ( not ( = ?auto_20461 ?auto_20472 ) ) ( not ( = ?auto_20466 ?auto_20472 ) ) ( not ( = ?auto_20457 ?auto_20472 ) ) ( SURFACE-AT ?auto_20468 ?auto_20456 ) ( ON ?auto_20468 ?auto_20460 ) ( CLEAR ?auto_20468 ) ( not ( = ?auto_20451 ?auto_20460 ) ) ( not ( = ?auto_20452 ?auto_20460 ) ) ( not ( = ?auto_20453 ?auto_20460 ) ) ( not ( = ?auto_20468 ?auto_20460 ) ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( not ( = ?auto_20467 ?auto_20460 ) ) ( IS-CRATE ?auto_20467 ) ( not ( = ?auto_20451 ?auto_20455 ) ) ( not ( = ?auto_20452 ?auto_20455 ) ) ( not ( = ?auto_20453 ?auto_20455 ) ) ( not ( = ?auto_20468 ?auto_20455 ) ) ( not ( = ?auto_20459 ?auto_20455 ) ) ( not ( = ?auto_20467 ?auto_20455 ) ) ( not ( = ?auto_20460 ?auto_20455 ) ) ( AVAILABLE ?auto_20466 ) ( SURFACE-AT ?auto_20467 ?auto_20469 ) ( ON ?auto_20467 ?auto_20471 ) ( CLEAR ?auto_20467 ) ( not ( = ?auto_20451 ?auto_20471 ) ) ( not ( = ?auto_20452 ?auto_20471 ) ) ( not ( = ?auto_20453 ?auto_20471 ) ) ( not ( = ?auto_20468 ?auto_20471 ) ) ( not ( = ?auto_20459 ?auto_20471 ) ) ( not ( = ?auto_20467 ?auto_20471 ) ) ( not ( = ?auto_20460 ?auto_20471 ) ) ( not ( = ?auto_20455 ?auto_20471 ) ) ( IS-CRATE ?auto_20455 ) ( not ( = ?auto_20451 ?auto_20463 ) ) ( not ( = ?auto_20452 ?auto_20463 ) ) ( not ( = ?auto_20453 ?auto_20463 ) ) ( not ( = ?auto_20468 ?auto_20463 ) ) ( not ( = ?auto_20459 ?auto_20463 ) ) ( not ( = ?auto_20467 ?auto_20463 ) ) ( not ( = ?auto_20460 ?auto_20463 ) ) ( not ( = ?auto_20455 ?auto_20463 ) ) ( not ( = ?auto_20471 ?auto_20463 ) ) ( SURFACE-AT ?auto_20455 ?auto_20465 ) ( ON ?auto_20455 ?auto_20454 ) ( CLEAR ?auto_20455 ) ( not ( = ?auto_20451 ?auto_20454 ) ) ( not ( = ?auto_20452 ?auto_20454 ) ) ( not ( = ?auto_20453 ?auto_20454 ) ) ( not ( = ?auto_20468 ?auto_20454 ) ) ( not ( = ?auto_20459 ?auto_20454 ) ) ( not ( = ?auto_20467 ?auto_20454 ) ) ( not ( = ?auto_20460 ?auto_20454 ) ) ( not ( = ?auto_20455 ?auto_20454 ) ) ( not ( = ?auto_20471 ?auto_20454 ) ) ( not ( = ?auto_20463 ?auto_20454 ) ) ( IS-CRATE ?auto_20463 ) ( not ( = ?auto_20451 ?auto_20464 ) ) ( not ( = ?auto_20452 ?auto_20464 ) ) ( not ( = ?auto_20453 ?auto_20464 ) ) ( not ( = ?auto_20468 ?auto_20464 ) ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( not ( = ?auto_20467 ?auto_20464 ) ) ( not ( = ?auto_20460 ?auto_20464 ) ) ( not ( = ?auto_20455 ?auto_20464 ) ) ( not ( = ?auto_20471 ?auto_20464 ) ) ( not ( = ?auto_20463 ?auto_20464 ) ) ( not ( = ?auto_20454 ?auto_20464 ) ) ( AVAILABLE ?auto_20472 ) ( SURFACE-AT ?auto_20463 ?auto_20456 ) ( ON ?auto_20463 ?auto_20458 ) ( CLEAR ?auto_20463 ) ( not ( = ?auto_20451 ?auto_20458 ) ) ( not ( = ?auto_20452 ?auto_20458 ) ) ( not ( = ?auto_20453 ?auto_20458 ) ) ( not ( = ?auto_20468 ?auto_20458 ) ) ( not ( = ?auto_20459 ?auto_20458 ) ) ( not ( = ?auto_20467 ?auto_20458 ) ) ( not ( = ?auto_20460 ?auto_20458 ) ) ( not ( = ?auto_20455 ?auto_20458 ) ) ( not ( = ?auto_20471 ?auto_20458 ) ) ( not ( = ?auto_20463 ?auto_20458 ) ) ( not ( = ?auto_20454 ?auto_20458 ) ) ( not ( = ?auto_20464 ?auto_20458 ) ) ( SURFACE-AT ?auto_20470 ?auto_20473 ) ( CLEAR ?auto_20470 ) ( IS-CRATE ?auto_20464 ) ( not ( = ?auto_20451 ?auto_20470 ) ) ( not ( = ?auto_20452 ?auto_20470 ) ) ( not ( = ?auto_20453 ?auto_20470 ) ) ( not ( = ?auto_20468 ?auto_20470 ) ) ( not ( = ?auto_20459 ?auto_20470 ) ) ( not ( = ?auto_20467 ?auto_20470 ) ) ( not ( = ?auto_20460 ?auto_20470 ) ) ( not ( = ?auto_20455 ?auto_20470 ) ) ( not ( = ?auto_20471 ?auto_20470 ) ) ( not ( = ?auto_20463 ?auto_20470 ) ) ( not ( = ?auto_20454 ?auto_20470 ) ) ( not ( = ?auto_20464 ?auto_20470 ) ) ( not ( = ?auto_20458 ?auto_20470 ) ) ( AVAILABLE ?auto_20461 ) ( TRUCK-AT ?auto_20462 ?auto_20465 ) ( LIFTING ?auto_20457 ?auto_20464 ) )
    :subtasks
    ( ( !LOAD ?auto_20457 ?auto_20464 ?auto_20462 ?auto_20465 )
      ( MAKE-ON ?auto_20451 ?auto_20452 )
      ( MAKE-ON-VERIFY ?auto_20451 ?auto_20452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20474 - SURFACE
      ?auto_20475 - SURFACE
    )
    :vars
    (
      ?auto_20485 - HOIST
      ?auto_20483 - PLACE
      ?auto_20476 - PLACE
      ?auto_20493 - HOIST
      ?auto_20482 - SURFACE
      ?auto_20486 - SURFACE
      ?auto_20495 - PLACE
      ?auto_20492 - HOIST
      ?auto_20484 - SURFACE
      ?auto_20487 - SURFACE
      ?auto_20494 - PLACE
      ?auto_20480 - HOIST
      ?auto_20481 - SURFACE
      ?auto_20477 - SURFACE
      ?auto_20479 - SURFACE
      ?auto_20488 - SURFACE
      ?auto_20490 - SURFACE
      ?auto_20491 - SURFACE
      ?auto_20489 - SURFACE
      ?auto_20478 - SURFACE
      ?auto_20496 - TRUCK
      ?auto_20497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20485 ?auto_20483 ) ( IS-CRATE ?auto_20474 ) ( not ( = ?auto_20474 ?auto_20475 ) ) ( not ( = ?auto_20476 ?auto_20483 ) ) ( HOIST-AT ?auto_20493 ?auto_20476 ) ( not ( = ?auto_20485 ?auto_20493 ) ) ( SURFACE-AT ?auto_20474 ?auto_20476 ) ( ON ?auto_20474 ?auto_20482 ) ( CLEAR ?auto_20474 ) ( not ( = ?auto_20474 ?auto_20482 ) ) ( not ( = ?auto_20475 ?auto_20482 ) ) ( IS-CRATE ?auto_20475 ) ( not ( = ?auto_20474 ?auto_20486 ) ) ( not ( = ?auto_20475 ?auto_20486 ) ) ( not ( = ?auto_20482 ?auto_20486 ) ) ( not ( = ?auto_20495 ?auto_20483 ) ) ( not ( = ?auto_20476 ?auto_20495 ) ) ( HOIST-AT ?auto_20492 ?auto_20495 ) ( not ( = ?auto_20485 ?auto_20492 ) ) ( not ( = ?auto_20493 ?auto_20492 ) ) ( SURFACE-AT ?auto_20475 ?auto_20495 ) ( ON ?auto_20475 ?auto_20484 ) ( CLEAR ?auto_20475 ) ( not ( = ?auto_20474 ?auto_20484 ) ) ( not ( = ?auto_20475 ?auto_20484 ) ) ( not ( = ?auto_20482 ?auto_20484 ) ) ( not ( = ?auto_20486 ?auto_20484 ) ) ( IS-CRATE ?auto_20486 ) ( not ( = ?auto_20474 ?auto_20487 ) ) ( not ( = ?auto_20475 ?auto_20487 ) ) ( not ( = ?auto_20482 ?auto_20487 ) ) ( not ( = ?auto_20486 ?auto_20487 ) ) ( not ( = ?auto_20484 ?auto_20487 ) ) ( not ( = ?auto_20494 ?auto_20483 ) ) ( not ( = ?auto_20476 ?auto_20494 ) ) ( not ( = ?auto_20495 ?auto_20494 ) ) ( HOIST-AT ?auto_20480 ?auto_20494 ) ( not ( = ?auto_20485 ?auto_20480 ) ) ( not ( = ?auto_20493 ?auto_20480 ) ) ( not ( = ?auto_20492 ?auto_20480 ) ) ( SURFACE-AT ?auto_20486 ?auto_20494 ) ( ON ?auto_20486 ?auto_20481 ) ( CLEAR ?auto_20486 ) ( not ( = ?auto_20474 ?auto_20481 ) ) ( not ( = ?auto_20475 ?auto_20481 ) ) ( not ( = ?auto_20482 ?auto_20481 ) ) ( not ( = ?auto_20486 ?auto_20481 ) ) ( not ( = ?auto_20484 ?auto_20481 ) ) ( not ( = ?auto_20487 ?auto_20481 ) ) ( IS-CRATE ?auto_20487 ) ( not ( = ?auto_20474 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20482 ?auto_20477 ) ) ( not ( = ?auto_20486 ?auto_20477 ) ) ( not ( = ?auto_20484 ?auto_20477 ) ) ( not ( = ?auto_20487 ?auto_20477 ) ) ( not ( = ?auto_20481 ?auto_20477 ) ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20487 ?auto_20476 ) ( ON ?auto_20487 ?auto_20479 ) ( CLEAR ?auto_20487 ) ( not ( = ?auto_20474 ?auto_20479 ) ) ( not ( = ?auto_20475 ?auto_20479 ) ) ( not ( = ?auto_20482 ?auto_20479 ) ) ( not ( = ?auto_20486 ?auto_20479 ) ) ( not ( = ?auto_20484 ?auto_20479 ) ) ( not ( = ?auto_20487 ?auto_20479 ) ) ( not ( = ?auto_20481 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( IS-CRATE ?auto_20477 ) ( not ( = ?auto_20474 ?auto_20488 ) ) ( not ( = ?auto_20475 ?auto_20488 ) ) ( not ( = ?auto_20482 ?auto_20488 ) ) ( not ( = ?auto_20486 ?auto_20488 ) ) ( not ( = ?auto_20484 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20481 ?auto_20488 ) ) ( not ( = ?auto_20477 ?auto_20488 ) ) ( not ( = ?auto_20479 ?auto_20488 ) ) ( SURFACE-AT ?auto_20477 ?auto_20495 ) ( ON ?auto_20477 ?auto_20490 ) ( CLEAR ?auto_20477 ) ( not ( = ?auto_20474 ?auto_20490 ) ) ( not ( = ?auto_20475 ?auto_20490 ) ) ( not ( = ?auto_20482 ?auto_20490 ) ) ( not ( = ?auto_20486 ?auto_20490 ) ) ( not ( = ?auto_20484 ?auto_20490 ) ) ( not ( = ?auto_20487 ?auto_20490 ) ) ( not ( = ?auto_20481 ?auto_20490 ) ) ( not ( = ?auto_20477 ?auto_20490 ) ) ( not ( = ?auto_20479 ?auto_20490 ) ) ( not ( = ?auto_20488 ?auto_20490 ) ) ( IS-CRATE ?auto_20488 ) ( not ( = ?auto_20474 ?auto_20491 ) ) ( not ( = ?auto_20475 ?auto_20491 ) ) ( not ( = ?auto_20482 ?auto_20491 ) ) ( not ( = ?auto_20486 ?auto_20491 ) ) ( not ( = ?auto_20484 ?auto_20491 ) ) ( not ( = ?auto_20487 ?auto_20491 ) ) ( not ( = ?auto_20481 ?auto_20491 ) ) ( not ( = ?auto_20477 ?auto_20491 ) ) ( not ( = ?auto_20479 ?auto_20491 ) ) ( not ( = ?auto_20488 ?auto_20491 ) ) ( not ( = ?auto_20490 ?auto_20491 ) ) ( AVAILABLE ?auto_20480 ) ( SURFACE-AT ?auto_20488 ?auto_20494 ) ( ON ?auto_20488 ?auto_20489 ) ( CLEAR ?auto_20488 ) ( not ( = ?auto_20474 ?auto_20489 ) ) ( not ( = ?auto_20475 ?auto_20489 ) ) ( not ( = ?auto_20482 ?auto_20489 ) ) ( not ( = ?auto_20486 ?auto_20489 ) ) ( not ( = ?auto_20484 ?auto_20489 ) ) ( not ( = ?auto_20487 ?auto_20489 ) ) ( not ( = ?auto_20481 ?auto_20489 ) ) ( not ( = ?auto_20477 ?auto_20489 ) ) ( not ( = ?auto_20479 ?auto_20489 ) ) ( not ( = ?auto_20488 ?auto_20489 ) ) ( not ( = ?auto_20490 ?auto_20489 ) ) ( not ( = ?auto_20491 ?auto_20489 ) ) ( SURFACE-AT ?auto_20478 ?auto_20483 ) ( CLEAR ?auto_20478 ) ( IS-CRATE ?auto_20491 ) ( not ( = ?auto_20474 ?auto_20478 ) ) ( not ( = ?auto_20475 ?auto_20478 ) ) ( not ( = ?auto_20482 ?auto_20478 ) ) ( not ( = ?auto_20486 ?auto_20478 ) ) ( not ( = ?auto_20484 ?auto_20478 ) ) ( not ( = ?auto_20487 ?auto_20478 ) ) ( not ( = ?auto_20481 ?auto_20478 ) ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( not ( = ?auto_20479 ?auto_20478 ) ) ( not ( = ?auto_20488 ?auto_20478 ) ) ( not ( = ?auto_20490 ?auto_20478 ) ) ( not ( = ?auto_20491 ?auto_20478 ) ) ( not ( = ?auto_20489 ?auto_20478 ) ) ( AVAILABLE ?auto_20485 ) ( TRUCK-AT ?auto_20496 ?auto_20495 ) ( AVAILABLE ?auto_20492 ) ( SURFACE-AT ?auto_20491 ?auto_20495 ) ( ON ?auto_20491 ?auto_20497 ) ( CLEAR ?auto_20491 ) ( not ( = ?auto_20474 ?auto_20497 ) ) ( not ( = ?auto_20475 ?auto_20497 ) ) ( not ( = ?auto_20482 ?auto_20497 ) ) ( not ( = ?auto_20486 ?auto_20497 ) ) ( not ( = ?auto_20484 ?auto_20497 ) ) ( not ( = ?auto_20487 ?auto_20497 ) ) ( not ( = ?auto_20481 ?auto_20497 ) ) ( not ( = ?auto_20477 ?auto_20497 ) ) ( not ( = ?auto_20479 ?auto_20497 ) ) ( not ( = ?auto_20488 ?auto_20497 ) ) ( not ( = ?auto_20490 ?auto_20497 ) ) ( not ( = ?auto_20491 ?auto_20497 ) ) ( not ( = ?auto_20489 ?auto_20497 ) ) ( not ( = ?auto_20478 ?auto_20497 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20492 ?auto_20491 ?auto_20497 ?auto_20495 )
      ( MAKE-ON ?auto_20474 ?auto_20475 )
      ( MAKE-ON-VERIFY ?auto_20474 ?auto_20475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20498 - SURFACE
      ?auto_20499 - SURFACE
    )
    :vars
    (
      ?auto_20501 - HOIST
      ?auto_20510 - PLACE
      ?auto_20515 - PLACE
      ?auto_20517 - HOIST
      ?auto_20509 - SURFACE
      ?auto_20503 - SURFACE
      ?auto_20519 - PLACE
      ?auto_20516 - HOIST
      ?auto_20514 - SURFACE
      ?auto_20513 - SURFACE
      ?auto_20518 - PLACE
      ?auto_20505 - HOIST
      ?auto_20511 - SURFACE
      ?auto_20507 - SURFACE
      ?auto_20506 - SURFACE
      ?auto_20500 - SURFACE
      ?auto_20504 - SURFACE
      ?auto_20508 - SURFACE
      ?auto_20512 - SURFACE
      ?auto_20502 - SURFACE
      ?auto_20521 - SURFACE
      ?auto_20520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20501 ?auto_20510 ) ( IS-CRATE ?auto_20498 ) ( not ( = ?auto_20498 ?auto_20499 ) ) ( not ( = ?auto_20515 ?auto_20510 ) ) ( HOIST-AT ?auto_20517 ?auto_20515 ) ( not ( = ?auto_20501 ?auto_20517 ) ) ( SURFACE-AT ?auto_20498 ?auto_20515 ) ( ON ?auto_20498 ?auto_20509 ) ( CLEAR ?auto_20498 ) ( not ( = ?auto_20498 ?auto_20509 ) ) ( not ( = ?auto_20499 ?auto_20509 ) ) ( IS-CRATE ?auto_20499 ) ( not ( = ?auto_20498 ?auto_20503 ) ) ( not ( = ?auto_20499 ?auto_20503 ) ) ( not ( = ?auto_20509 ?auto_20503 ) ) ( not ( = ?auto_20519 ?auto_20510 ) ) ( not ( = ?auto_20515 ?auto_20519 ) ) ( HOIST-AT ?auto_20516 ?auto_20519 ) ( not ( = ?auto_20501 ?auto_20516 ) ) ( not ( = ?auto_20517 ?auto_20516 ) ) ( SURFACE-AT ?auto_20499 ?auto_20519 ) ( ON ?auto_20499 ?auto_20514 ) ( CLEAR ?auto_20499 ) ( not ( = ?auto_20498 ?auto_20514 ) ) ( not ( = ?auto_20499 ?auto_20514 ) ) ( not ( = ?auto_20509 ?auto_20514 ) ) ( not ( = ?auto_20503 ?auto_20514 ) ) ( IS-CRATE ?auto_20503 ) ( not ( = ?auto_20498 ?auto_20513 ) ) ( not ( = ?auto_20499 ?auto_20513 ) ) ( not ( = ?auto_20509 ?auto_20513 ) ) ( not ( = ?auto_20503 ?auto_20513 ) ) ( not ( = ?auto_20514 ?auto_20513 ) ) ( not ( = ?auto_20518 ?auto_20510 ) ) ( not ( = ?auto_20515 ?auto_20518 ) ) ( not ( = ?auto_20519 ?auto_20518 ) ) ( HOIST-AT ?auto_20505 ?auto_20518 ) ( not ( = ?auto_20501 ?auto_20505 ) ) ( not ( = ?auto_20517 ?auto_20505 ) ) ( not ( = ?auto_20516 ?auto_20505 ) ) ( SURFACE-AT ?auto_20503 ?auto_20518 ) ( ON ?auto_20503 ?auto_20511 ) ( CLEAR ?auto_20503 ) ( not ( = ?auto_20498 ?auto_20511 ) ) ( not ( = ?auto_20499 ?auto_20511 ) ) ( not ( = ?auto_20509 ?auto_20511 ) ) ( not ( = ?auto_20503 ?auto_20511 ) ) ( not ( = ?auto_20514 ?auto_20511 ) ) ( not ( = ?auto_20513 ?auto_20511 ) ) ( IS-CRATE ?auto_20513 ) ( not ( = ?auto_20498 ?auto_20507 ) ) ( not ( = ?auto_20499 ?auto_20507 ) ) ( not ( = ?auto_20509 ?auto_20507 ) ) ( not ( = ?auto_20503 ?auto_20507 ) ) ( not ( = ?auto_20514 ?auto_20507 ) ) ( not ( = ?auto_20513 ?auto_20507 ) ) ( not ( = ?auto_20511 ?auto_20507 ) ) ( AVAILABLE ?auto_20517 ) ( SURFACE-AT ?auto_20513 ?auto_20515 ) ( ON ?auto_20513 ?auto_20506 ) ( CLEAR ?auto_20513 ) ( not ( = ?auto_20498 ?auto_20506 ) ) ( not ( = ?auto_20499 ?auto_20506 ) ) ( not ( = ?auto_20509 ?auto_20506 ) ) ( not ( = ?auto_20503 ?auto_20506 ) ) ( not ( = ?auto_20514 ?auto_20506 ) ) ( not ( = ?auto_20513 ?auto_20506 ) ) ( not ( = ?auto_20511 ?auto_20506 ) ) ( not ( = ?auto_20507 ?auto_20506 ) ) ( IS-CRATE ?auto_20507 ) ( not ( = ?auto_20498 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20509 ?auto_20500 ) ) ( not ( = ?auto_20503 ?auto_20500 ) ) ( not ( = ?auto_20514 ?auto_20500 ) ) ( not ( = ?auto_20513 ?auto_20500 ) ) ( not ( = ?auto_20511 ?auto_20500 ) ) ( not ( = ?auto_20507 ?auto_20500 ) ) ( not ( = ?auto_20506 ?auto_20500 ) ) ( SURFACE-AT ?auto_20507 ?auto_20519 ) ( ON ?auto_20507 ?auto_20504 ) ( CLEAR ?auto_20507 ) ( not ( = ?auto_20498 ?auto_20504 ) ) ( not ( = ?auto_20499 ?auto_20504 ) ) ( not ( = ?auto_20509 ?auto_20504 ) ) ( not ( = ?auto_20503 ?auto_20504 ) ) ( not ( = ?auto_20514 ?auto_20504 ) ) ( not ( = ?auto_20513 ?auto_20504 ) ) ( not ( = ?auto_20511 ?auto_20504 ) ) ( not ( = ?auto_20507 ?auto_20504 ) ) ( not ( = ?auto_20506 ?auto_20504 ) ) ( not ( = ?auto_20500 ?auto_20504 ) ) ( IS-CRATE ?auto_20500 ) ( not ( = ?auto_20498 ?auto_20508 ) ) ( not ( = ?auto_20499 ?auto_20508 ) ) ( not ( = ?auto_20509 ?auto_20508 ) ) ( not ( = ?auto_20503 ?auto_20508 ) ) ( not ( = ?auto_20514 ?auto_20508 ) ) ( not ( = ?auto_20513 ?auto_20508 ) ) ( not ( = ?auto_20511 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20500 ?auto_20508 ) ) ( not ( = ?auto_20504 ?auto_20508 ) ) ( AVAILABLE ?auto_20505 ) ( SURFACE-AT ?auto_20500 ?auto_20518 ) ( ON ?auto_20500 ?auto_20512 ) ( CLEAR ?auto_20500 ) ( not ( = ?auto_20498 ?auto_20512 ) ) ( not ( = ?auto_20499 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20503 ?auto_20512 ) ) ( not ( = ?auto_20514 ?auto_20512 ) ) ( not ( = ?auto_20513 ?auto_20512 ) ) ( not ( = ?auto_20511 ?auto_20512 ) ) ( not ( = ?auto_20507 ?auto_20512 ) ) ( not ( = ?auto_20506 ?auto_20512 ) ) ( not ( = ?auto_20500 ?auto_20512 ) ) ( not ( = ?auto_20504 ?auto_20512 ) ) ( not ( = ?auto_20508 ?auto_20512 ) ) ( SURFACE-AT ?auto_20502 ?auto_20510 ) ( CLEAR ?auto_20502 ) ( IS-CRATE ?auto_20508 ) ( not ( = ?auto_20498 ?auto_20502 ) ) ( not ( = ?auto_20499 ?auto_20502 ) ) ( not ( = ?auto_20509 ?auto_20502 ) ) ( not ( = ?auto_20503 ?auto_20502 ) ) ( not ( = ?auto_20514 ?auto_20502 ) ) ( not ( = ?auto_20513 ?auto_20502 ) ) ( not ( = ?auto_20511 ?auto_20502 ) ) ( not ( = ?auto_20507 ?auto_20502 ) ) ( not ( = ?auto_20506 ?auto_20502 ) ) ( not ( = ?auto_20500 ?auto_20502 ) ) ( not ( = ?auto_20504 ?auto_20502 ) ) ( not ( = ?auto_20508 ?auto_20502 ) ) ( not ( = ?auto_20512 ?auto_20502 ) ) ( AVAILABLE ?auto_20501 ) ( AVAILABLE ?auto_20516 ) ( SURFACE-AT ?auto_20508 ?auto_20519 ) ( ON ?auto_20508 ?auto_20521 ) ( CLEAR ?auto_20508 ) ( not ( = ?auto_20498 ?auto_20521 ) ) ( not ( = ?auto_20499 ?auto_20521 ) ) ( not ( = ?auto_20509 ?auto_20521 ) ) ( not ( = ?auto_20503 ?auto_20521 ) ) ( not ( = ?auto_20514 ?auto_20521 ) ) ( not ( = ?auto_20513 ?auto_20521 ) ) ( not ( = ?auto_20511 ?auto_20521 ) ) ( not ( = ?auto_20507 ?auto_20521 ) ) ( not ( = ?auto_20506 ?auto_20521 ) ) ( not ( = ?auto_20500 ?auto_20521 ) ) ( not ( = ?auto_20504 ?auto_20521 ) ) ( not ( = ?auto_20508 ?auto_20521 ) ) ( not ( = ?auto_20512 ?auto_20521 ) ) ( not ( = ?auto_20502 ?auto_20521 ) ) ( TRUCK-AT ?auto_20520 ?auto_20510 ) )
    :subtasks
    ( ( !DRIVE ?auto_20520 ?auto_20510 ?auto_20519 )
      ( MAKE-ON ?auto_20498 ?auto_20499 )
      ( MAKE-ON-VERIFY ?auto_20498 ?auto_20499 ) )
  )

)

