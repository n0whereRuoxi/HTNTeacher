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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81275 - SURFACE
      ?auto_81276 - SURFACE
    )
    :vars
    (
      ?auto_81277 - HOIST
      ?auto_81278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81277 ?auto_81278 ) ( SURFACE-AT ?auto_81275 ?auto_81278 ) ( CLEAR ?auto_81275 ) ( LIFTING ?auto_81277 ?auto_81276 ) ( IS-CRATE ?auto_81276 ) ( not ( = ?auto_81275 ?auto_81276 ) ) )
    :subtasks
    ( ( !DROP ?auto_81277 ?auto_81276 ?auto_81275 ?auto_81278 )
      ( MAKE-1CRATE-VERIFY ?auto_81275 ?auto_81276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81279 - SURFACE
      ?auto_81280 - SURFACE
    )
    :vars
    (
      ?auto_81281 - HOIST
      ?auto_81282 - PLACE
      ?auto_81283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81281 ?auto_81282 ) ( SURFACE-AT ?auto_81279 ?auto_81282 ) ( CLEAR ?auto_81279 ) ( IS-CRATE ?auto_81280 ) ( not ( = ?auto_81279 ?auto_81280 ) ) ( TRUCK-AT ?auto_81283 ?auto_81282 ) ( AVAILABLE ?auto_81281 ) ( IN ?auto_81280 ?auto_81283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81281 ?auto_81280 ?auto_81283 ?auto_81282 )
      ( MAKE-1CRATE ?auto_81279 ?auto_81280 )
      ( MAKE-1CRATE-VERIFY ?auto_81279 ?auto_81280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81284 - SURFACE
      ?auto_81285 - SURFACE
    )
    :vars
    (
      ?auto_81286 - HOIST
      ?auto_81287 - PLACE
      ?auto_81288 - TRUCK
      ?auto_81289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81286 ?auto_81287 ) ( SURFACE-AT ?auto_81284 ?auto_81287 ) ( CLEAR ?auto_81284 ) ( IS-CRATE ?auto_81285 ) ( not ( = ?auto_81284 ?auto_81285 ) ) ( AVAILABLE ?auto_81286 ) ( IN ?auto_81285 ?auto_81288 ) ( TRUCK-AT ?auto_81288 ?auto_81289 ) ( not ( = ?auto_81289 ?auto_81287 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81288 ?auto_81289 ?auto_81287 )
      ( MAKE-1CRATE ?auto_81284 ?auto_81285 )
      ( MAKE-1CRATE-VERIFY ?auto_81284 ?auto_81285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81290 - SURFACE
      ?auto_81291 - SURFACE
    )
    :vars
    (
      ?auto_81295 - HOIST
      ?auto_81293 - PLACE
      ?auto_81294 - TRUCK
      ?auto_81292 - PLACE
      ?auto_81296 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81295 ?auto_81293 ) ( SURFACE-AT ?auto_81290 ?auto_81293 ) ( CLEAR ?auto_81290 ) ( IS-CRATE ?auto_81291 ) ( not ( = ?auto_81290 ?auto_81291 ) ) ( AVAILABLE ?auto_81295 ) ( TRUCK-AT ?auto_81294 ?auto_81292 ) ( not ( = ?auto_81292 ?auto_81293 ) ) ( HOIST-AT ?auto_81296 ?auto_81292 ) ( LIFTING ?auto_81296 ?auto_81291 ) ( not ( = ?auto_81295 ?auto_81296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81296 ?auto_81291 ?auto_81294 ?auto_81292 )
      ( MAKE-1CRATE ?auto_81290 ?auto_81291 )
      ( MAKE-1CRATE-VERIFY ?auto_81290 ?auto_81291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81297 - SURFACE
      ?auto_81298 - SURFACE
    )
    :vars
    (
      ?auto_81300 - HOIST
      ?auto_81302 - PLACE
      ?auto_81303 - TRUCK
      ?auto_81299 - PLACE
      ?auto_81301 - HOIST
      ?auto_81304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81300 ?auto_81302 ) ( SURFACE-AT ?auto_81297 ?auto_81302 ) ( CLEAR ?auto_81297 ) ( IS-CRATE ?auto_81298 ) ( not ( = ?auto_81297 ?auto_81298 ) ) ( AVAILABLE ?auto_81300 ) ( TRUCK-AT ?auto_81303 ?auto_81299 ) ( not ( = ?auto_81299 ?auto_81302 ) ) ( HOIST-AT ?auto_81301 ?auto_81299 ) ( not ( = ?auto_81300 ?auto_81301 ) ) ( AVAILABLE ?auto_81301 ) ( SURFACE-AT ?auto_81298 ?auto_81299 ) ( ON ?auto_81298 ?auto_81304 ) ( CLEAR ?auto_81298 ) ( not ( = ?auto_81297 ?auto_81304 ) ) ( not ( = ?auto_81298 ?auto_81304 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81301 ?auto_81298 ?auto_81304 ?auto_81299 )
      ( MAKE-1CRATE ?auto_81297 ?auto_81298 )
      ( MAKE-1CRATE-VERIFY ?auto_81297 ?auto_81298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81305 - SURFACE
      ?auto_81306 - SURFACE
    )
    :vars
    (
      ?auto_81310 - HOIST
      ?auto_81311 - PLACE
      ?auto_81307 - PLACE
      ?auto_81308 - HOIST
      ?auto_81312 - SURFACE
      ?auto_81309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81310 ?auto_81311 ) ( SURFACE-AT ?auto_81305 ?auto_81311 ) ( CLEAR ?auto_81305 ) ( IS-CRATE ?auto_81306 ) ( not ( = ?auto_81305 ?auto_81306 ) ) ( AVAILABLE ?auto_81310 ) ( not ( = ?auto_81307 ?auto_81311 ) ) ( HOIST-AT ?auto_81308 ?auto_81307 ) ( not ( = ?auto_81310 ?auto_81308 ) ) ( AVAILABLE ?auto_81308 ) ( SURFACE-AT ?auto_81306 ?auto_81307 ) ( ON ?auto_81306 ?auto_81312 ) ( CLEAR ?auto_81306 ) ( not ( = ?auto_81305 ?auto_81312 ) ) ( not ( = ?auto_81306 ?auto_81312 ) ) ( TRUCK-AT ?auto_81309 ?auto_81311 ) )
    :subtasks
    ( ( !DRIVE ?auto_81309 ?auto_81311 ?auto_81307 )
      ( MAKE-1CRATE ?auto_81305 ?auto_81306 )
      ( MAKE-1CRATE-VERIFY ?auto_81305 ?auto_81306 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81322 - SURFACE
      ?auto_81323 - SURFACE
      ?auto_81324 - SURFACE
    )
    :vars
    (
      ?auto_81326 - HOIST
      ?auto_81325 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81326 ?auto_81325 ) ( SURFACE-AT ?auto_81323 ?auto_81325 ) ( CLEAR ?auto_81323 ) ( LIFTING ?auto_81326 ?auto_81324 ) ( IS-CRATE ?auto_81324 ) ( not ( = ?auto_81323 ?auto_81324 ) ) ( ON ?auto_81323 ?auto_81322 ) ( not ( = ?auto_81322 ?auto_81323 ) ) ( not ( = ?auto_81322 ?auto_81324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81323 ?auto_81324 )
      ( MAKE-2CRATE-VERIFY ?auto_81322 ?auto_81323 ?auto_81324 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81332 - SURFACE
      ?auto_81333 - SURFACE
      ?auto_81334 - SURFACE
    )
    :vars
    (
      ?auto_81335 - HOIST
      ?auto_81336 - PLACE
      ?auto_81337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81335 ?auto_81336 ) ( SURFACE-AT ?auto_81333 ?auto_81336 ) ( CLEAR ?auto_81333 ) ( IS-CRATE ?auto_81334 ) ( not ( = ?auto_81333 ?auto_81334 ) ) ( TRUCK-AT ?auto_81337 ?auto_81336 ) ( AVAILABLE ?auto_81335 ) ( IN ?auto_81334 ?auto_81337 ) ( ON ?auto_81333 ?auto_81332 ) ( not ( = ?auto_81332 ?auto_81333 ) ) ( not ( = ?auto_81332 ?auto_81334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81333 ?auto_81334 )
      ( MAKE-2CRATE-VERIFY ?auto_81332 ?auto_81333 ?auto_81334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81338 - SURFACE
      ?auto_81339 - SURFACE
    )
    :vars
    (
      ?auto_81343 - HOIST
      ?auto_81341 - PLACE
      ?auto_81340 - TRUCK
      ?auto_81342 - SURFACE
      ?auto_81344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81343 ?auto_81341 ) ( SURFACE-AT ?auto_81338 ?auto_81341 ) ( CLEAR ?auto_81338 ) ( IS-CRATE ?auto_81339 ) ( not ( = ?auto_81338 ?auto_81339 ) ) ( AVAILABLE ?auto_81343 ) ( IN ?auto_81339 ?auto_81340 ) ( ON ?auto_81338 ?auto_81342 ) ( not ( = ?auto_81342 ?auto_81338 ) ) ( not ( = ?auto_81342 ?auto_81339 ) ) ( TRUCK-AT ?auto_81340 ?auto_81344 ) ( not ( = ?auto_81344 ?auto_81341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81340 ?auto_81344 ?auto_81341 )
      ( MAKE-2CRATE ?auto_81342 ?auto_81338 ?auto_81339 )
      ( MAKE-1CRATE-VERIFY ?auto_81338 ?auto_81339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81345 - SURFACE
      ?auto_81346 - SURFACE
      ?auto_81347 - SURFACE
    )
    :vars
    (
      ?auto_81351 - HOIST
      ?auto_81350 - PLACE
      ?auto_81349 - TRUCK
      ?auto_81348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81351 ?auto_81350 ) ( SURFACE-AT ?auto_81346 ?auto_81350 ) ( CLEAR ?auto_81346 ) ( IS-CRATE ?auto_81347 ) ( not ( = ?auto_81346 ?auto_81347 ) ) ( AVAILABLE ?auto_81351 ) ( IN ?auto_81347 ?auto_81349 ) ( ON ?auto_81346 ?auto_81345 ) ( not ( = ?auto_81345 ?auto_81346 ) ) ( not ( = ?auto_81345 ?auto_81347 ) ) ( TRUCK-AT ?auto_81349 ?auto_81348 ) ( not ( = ?auto_81348 ?auto_81350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81346 ?auto_81347 )
      ( MAKE-2CRATE-VERIFY ?auto_81345 ?auto_81346 ?auto_81347 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81352 - SURFACE
      ?auto_81353 - SURFACE
    )
    :vars
    (
      ?auto_81357 - HOIST
      ?auto_81356 - PLACE
      ?auto_81355 - SURFACE
      ?auto_81354 - TRUCK
      ?auto_81358 - PLACE
      ?auto_81359 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81357 ?auto_81356 ) ( SURFACE-AT ?auto_81352 ?auto_81356 ) ( CLEAR ?auto_81352 ) ( IS-CRATE ?auto_81353 ) ( not ( = ?auto_81352 ?auto_81353 ) ) ( AVAILABLE ?auto_81357 ) ( ON ?auto_81352 ?auto_81355 ) ( not ( = ?auto_81355 ?auto_81352 ) ) ( not ( = ?auto_81355 ?auto_81353 ) ) ( TRUCK-AT ?auto_81354 ?auto_81358 ) ( not ( = ?auto_81358 ?auto_81356 ) ) ( HOIST-AT ?auto_81359 ?auto_81358 ) ( LIFTING ?auto_81359 ?auto_81353 ) ( not ( = ?auto_81357 ?auto_81359 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81359 ?auto_81353 ?auto_81354 ?auto_81358 )
      ( MAKE-2CRATE ?auto_81355 ?auto_81352 ?auto_81353 )
      ( MAKE-1CRATE-VERIFY ?auto_81352 ?auto_81353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81360 - SURFACE
      ?auto_81361 - SURFACE
      ?auto_81362 - SURFACE
    )
    :vars
    (
      ?auto_81363 - HOIST
      ?auto_81364 - PLACE
      ?auto_81365 - TRUCK
      ?auto_81367 - PLACE
      ?auto_81366 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81363 ?auto_81364 ) ( SURFACE-AT ?auto_81361 ?auto_81364 ) ( CLEAR ?auto_81361 ) ( IS-CRATE ?auto_81362 ) ( not ( = ?auto_81361 ?auto_81362 ) ) ( AVAILABLE ?auto_81363 ) ( ON ?auto_81361 ?auto_81360 ) ( not ( = ?auto_81360 ?auto_81361 ) ) ( not ( = ?auto_81360 ?auto_81362 ) ) ( TRUCK-AT ?auto_81365 ?auto_81367 ) ( not ( = ?auto_81367 ?auto_81364 ) ) ( HOIST-AT ?auto_81366 ?auto_81367 ) ( LIFTING ?auto_81366 ?auto_81362 ) ( not ( = ?auto_81363 ?auto_81366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81361 ?auto_81362 )
      ( MAKE-2CRATE-VERIFY ?auto_81360 ?auto_81361 ?auto_81362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81368 - SURFACE
      ?auto_81369 - SURFACE
    )
    :vars
    (
      ?auto_81374 - HOIST
      ?auto_81375 - PLACE
      ?auto_81371 - SURFACE
      ?auto_81372 - TRUCK
      ?auto_81373 - PLACE
      ?auto_81370 - HOIST
      ?auto_81376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81374 ?auto_81375 ) ( SURFACE-AT ?auto_81368 ?auto_81375 ) ( CLEAR ?auto_81368 ) ( IS-CRATE ?auto_81369 ) ( not ( = ?auto_81368 ?auto_81369 ) ) ( AVAILABLE ?auto_81374 ) ( ON ?auto_81368 ?auto_81371 ) ( not ( = ?auto_81371 ?auto_81368 ) ) ( not ( = ?auto_81371 ?auto_81369 ) ) ( TRUCK-AT ?auto_81372 ?auto_81373 ) ( not ( = ?auto_81373 ?auto_81375 ) ) ( HOIST-AT ?auto_81370 ?auto_81373 ) ( not ( = ?auto_81374 ?auto_81370 ) ) ( AVAILABLE ?auto_81370 ) ( SURFACE-AT ?auto_81369 ?auto_81373 ) ( ON ?auto_81369 ?auto_81376 ) ( CLEAR ?auto_81369 ) ( not ( = ?auto_81368 ?auto_81376 ) ) ( not ( = ?auto_81369 ?auto_81376 ) ) ( not ( = ?auto_81371 ?auto_81376 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81370 ?auto_81369 ?auto_81376 ?auto_81373 )
      ( MAKE-2CRATE ?auto_81371 ?auto_81368 ?auto_81369 )
      ( MAKE-1CRATE-VERIFY ?auto_81368 ?auto_81369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81377 - SURFACE
      ?auto_81378 - SURFACE
      ?auto_81379 - SURFACE
    )
    :vars
    (
      ?auto_81384 - HOIST
      ?auto_81382 - PLACE
      ?auto_81383 - TRUCK
      ?auto_81385 - PLACE
      ?auto_81380 - HOIST
      ?auto_81381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81384 ?auto_81382 ) ( SURFACE-AT ?auto_81378 ?auto_81382 ) ( CLEAR ?auto_81378 ) ( IS-CRATE ?auto_81379 ) ( not ( = ?auto_81378 ?auto_81379 ) ) ( AVAILABLE ?auto_81384 ) ( ON ?auto_81378 ?auto_81377 ) ( not ( = ?auto_81377 ?auto_81378 ) ) ( not ( = ?auto_81377 ?auto_81379 ) ) ( TRUCK-AT ?auto_81383 ?auto_81385 ) ( not ( = ?auto_81385 ?auto_81382 ) ) ( HOIST-AT ?auto_81380 ?auto_81385 ) ( not ( = ?auto_81384 ?auto_81380 ) ) ( AVAILABLE ?auto_81380 ) ( SURFACE-AT ?auto_81379 ?auto_81385 ) ( ON ?auto_81379 ?auto_81381 ) ( CLEAR ?auto_81379 ) ( not ( = ?auto_81378 ?auto_81381 ) ) ( not ( = ?auto_81379 ?auto_81381 ) ) ( not ( = ?auto_81377 ?auto_81381 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81378 ?auto_81379 )
      ( MAKE-2CRATE-VERIFY ?auto_81377 ?auto_81378 ?auto_81379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81386 - SURFACE
      ?auto_81387 - SURFACE
    )
    :vars
    (
      ?auto_81389 - HOIST
      ?auto_81393 - PLACE
      ?auto_81388 - SURFACE
      ?auto_81392 - PLACE
      ?auto_81391 - HOIST
      ?auto_81390 - SURFACE
      ?auto_81394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81389 ?auto_81393 ) ( SURFACE-AT ?auto_81386 ?auto_81393 ) ( CLEAR ?auto_81386 ) ( IS-CRATE ?auto_81387 ) ( not ( = ?auto_81386 ?auto_81387 ) ) ( AVAILABLE ?auto_81389 ) ( ON ?auto_81386 ?auto_81388 ) ( not ( = ?auto_81388 ?auto_81386 ) ) ( not ( = ?auto_81388 ?auto_81387 ) ) ( not ( = ?auto_81392 ?auto_81393 ) ) ( HOIST-AT ?auto_81391 ?auto_81392 ) ( not ( = ?auto_81389 ?auto_81391 ) ) ( AVAILABLE ?auto_81391 ) ( SURFACE-AT ?auto_81387 ?auto_81392 ) ( ON ?auto_81387 ?auto_81390 ) ( CLEAR ?auto_81387 ) ( not ( = ?auto_81386 ?auto_81390 ) ) ( not ( = ?auto_81387 ?auto_81390 ) ) ( not ( = ?auto_81388 ?auto_81390 ) ) ( TRUCK-AT ?auto_81394 ?auto_81393 ) )
    :subtasks
    ( ( !DRIVE ?auto_81394 ?auto_81393 ?auto_81392 )
      ( MAKE-2CRATE ?auto_81388 ?auto_81386 ?auto_81387 )
      ( MAKE-1CRATE-VERIFY ?auto_81386 ?auto_81387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81395 - SURFACE
      ?auto_81396 - SURFACE
      ?auto_81397 - SURFACE
    )
    :vars
    (
      ?auto_81398 - HOIST
      ?auto_81401 - PLACE
      ?auto_81402 - PLACE
      ?auto_81400 - HOIST
      ?auto_81399 - SURFACE
      ?auto_81403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81398 ?auto_81401 ) ( SURFACE-AT ?auto_81396 ?auto_81401 ) ( CLEAR ?auto_81396 ) ( IS-CRATE ?auto_81397 ) ( not ( = ?auto_81396 ?auto_81397 ) ) ( AVAILABLE ?auto_81398 ) ( ON ?auto_81396 ?auto_81395 ) ( not ( = ?auto_81395 ?auto_81396 ) ) ( not ( = ?auto_81395 ?auto_81397 ) ) ( not ( = ?auto_81402 ?auto_81401 ) ) ( HOIST-AT ?auto_81400 ?auto_81402 ) ( not ( = ?auto_81398 ?auto_81400 ) ) ( AVAILABLE ?auto_81400 ) ( SURFACE-AT ?auto_81397 ?auto_81402 ) ( ON ?auto_81397 ?auto_81399 ) ( CLEAR ?auto_81397 ) ( not ( = ?auto_81396 ?auto_81399 ) ) ( not ( = ?auto_81397 ?auto_81399 ) ) ( not ( = ?auto_81395 ?auto_81399 ) ) ( TRUCK-AT ?auto_81403 ?auto_81401 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81396 ?auto_81397 )
      ( MAKE-2CRATE-VERIFY ?auto_81395 ?auto_81396 ?auto_81397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81404 - SURFACE
      ?auto_81405 - SURFACE
    )
    :vars
    (
      ?auto_81410 - HOIST
      ?auto_81406 - PLACE
      ?auto_81407 - SURFACE
      ?auto_81408 - PLACE
      ?auto_81409 - HOIST
      ?auto_81412 - SURFACE
      ?auto_81411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81410 ?auto_81406 ) ( IS-CRATE ?auto_81405 ) ( not ( = ?auto_81404 ?auto_81405 ) ) ( not ( = ?auto_81407 ?auto_81404 ) ) ( not ( = ?auto_81407 ?auto_81405 ) ) ( not ( = ?auto_81408 ?auto_81406 ) ) ( HOIST-AT ?auto_81409 ?auto_81408 ) ( not ( = ?auto_81410 ?auto_81409 ) ) ( AVAILABLE ?auto_81409 ) ( SURFACE-AT ?auto_81405 ?auto_81408 ) ( ON ?auto_81405 ?auto_81412 ) ( CLEAR ?auto_81405 ) ( not ( = ?auto_81404 ?auto_81412 ) ) ( not ( = ?auto_81405 ?auto_81412 ) ) ( not ( = ?auto_81407 ?auto_81412 ) ) ( TRUCK-AT ?auto_81411 ?auto_81406 ) ( SURFACE-AT ?auto_81407 ?auto_81406 ) ( CLEAR ?auto_81407 ) ( LIFTING ?auto_81410 ?auto_81404 ) ( IS-CRATE ?auto_81404 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81407 ?auto_81404 )
      ( MAKE-2CRATE ?auto_81407 ?auto_81404 ?auto_81405 )
      ( MAKE-1CRATE-VERIFY ?auto_81404 ?auto_81405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81413 - SURFACE
      ?auto_81414 - SURFACE
      ?auto_81415 - SURFACE
    )
    :vars
    (
      ?auto_81421 - HOIST
      ?auto_81419 - PLACE
      ?auto_81418 - PLACE
      ?auto_81416 - HOIST
      ?auto_81417 - SURFACE
      ?auto_81420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81421 ?auto_81419 ) ( IS-CRATE ?auto_81415 ) ( not ( = ?auto_81414 ?auto_81415 ) ) ( not ( = ?auto_81413 ?auto_81414 ) ) ( not ( = ?auto_81413 ?auto_81415 ) ) ( not ( = ?auto_81418 ?auto_81419 ) ) ( HOIST-AT ?auto_81416 ?auto_81418 ) ( not ( = ?auto_81421 ?auto_81416 ) ) ( AVAILABLE ?auto_81416 ) ( SURFACE-AT ?auto_81415 ?auto_81418 ) ( ON ?auto_81415 ?auto_81417 ) ( CLEAR ?auto_81415 ) ( not ( = ?auto_81414 ?auto_81417 ) ) ( not ( = ?auto_81415 ?auto_81417 ) ) ( not ( = ?auto_81413 ?auto_81417 ) ) ( TRUCK-AT ?auto_81420 ?auto_81419 ) ( SURFACE-AT ?auto_81413 ?auto_81419 ) ( CLEAR ?auto_81413 ) ( LIFTING ?auto_81421 ?auto_81414 ) ( IS-CRATE ?auto_81414 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81414 ?auto_81415 )
      ( MAKE-2CRATE-VERIFY ?auto_81413 ?auto_81414 ?auto_81415 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81422 - SURFACE
      ?auto_81423 - SURFACE
    )
    :vars
    (
      ?auto_81426 - HOIST
      ?auto_81430 - PLACE
      ?auto_81427 - SURFACE
      ?auto_81429 - PLACE
      ?auto_81424 - HOIST
      ?auto_81428 - SURFACE
      ?auto_81425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81426 ?auto_81430 ) ( IS-CRATE ?auto_81423 ) ( not ( = ?auto_81422 ?auto_81423 ) ) ( not ( = ?auto_81427 ?auto_81422 ) ) ( not ( = ?auto_81427 ?auto_81423 ) ) ( not ( = ?auto_81429 ?auto_81430 ) ) ( HOIST-AT ?auto_81424 ?auto_81429 ) ( not ( = ?auto_81426 ?auto_81424 ) ) ( AVAILABLE ?auto_81424 ) ( SURFACE-AT ?auto_81423 ?auto_81429 ) ( ON ?auto_81423 ?auto_81428 ) ( CLEAR ?auto_81423 ) ( not ( = ?auto_81422 ?auto_81428 ) ) ( not ( = ?auto_81423 ?auto_81428 ) ) ( not ( = ?auto_81427 ?auto_81428 ) ) ( TRUCK-AT ?auto_81425 ?auto_81430 ) ( SURFACE-AT ?auto_81427 ?auto_81430 ) ( CLEAR ?auto_81427 ) ( IS-CRATE ?auto_81422 ) ( AVAILABLE ?auto_81426 ) ( IN ?auto_81422 ?auto_81425 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81426 ?auto_81422 ?auto_81425 ?auto_81430 )
      ( MAKE-2CRATE ?auto_81427 ?auto_81422 ?auto_81423 )
      ( MAKE-1CRATE-VERIFY ?auto_81422 ?auto_81423 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81431 - SURFACE
      ?auto_81432 - SURFACE
      ?auto_81433 - SURFACE
    )
    :vars
    (
      ?auto_81436 - HOIST
      ?auto_81438 - PLACE
      ?auto_81434 - PLACE
      ?auto_81437 - HOIST
      ?auto_81435 - SURFACE
      ?auto_81439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81436 ?auto_81438 ) ( IS-CRATE ?auto_81433 ) ( not ( = ?auto_81432 ?auto_81433 ) ) ( not ( = ?auto_81431 ?auto_81432 ) ) ( not ( = ?auto_81431 ?auto_81433 ) ) ( not ( = ?auto_81434 ?auto_81438 ) ) ( HOIST-AT ?auto_81437 ?auto_81434 ) ( not ( = ?auto_81436 ?auto_81437 ) ) ( AVAILABLE ?auto_81437 ) ( SURFACE-AT ?auto_81433 ?auto_81434 ) ( ON ?auto_81433 ?auto_81435 ) ( CLEAR ?auto_81433 ) ( not ( = ?auto_81432 ?auto_81435 ) ) ( not ( = ?auto_81433 ?auto_81435 ) ) ( not ( = ?auto_81431 ?auto_81435 ) ) ( TRUCK-AT ?auto_81439 ?auto_81438 ) ( SURFACE-AT ?auto_81431 ?auto_81438 ) ( CLEAR ?auto_81431 ) ( IS-CRATE ?auto_81432 ) ( AVAILABLE ?auto_81436 ) ( IN ?auto_81432 ?auto_81439 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81432 ?auto_81433 )
      ( MAKE-2CRATE-VERIFY ?auto_81431 ?auto_81432 ?auto_81433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81476 - SURFACE
      ?auto_81477 - SURFACE
    )
    :vars
    (
      ?auto_81480 - HOIST
      ?auto_81479 - PLACE
      ?auto_81483 - SURFACE
      ?auto_81478 - PLACE
      ?auto_81481 - HOIST
      ?auto_81482 - SURFACE
      ?auto_81484 - TRUCK
      ?auto_81485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81480 ?auto_81479 ) ( SURFACE-AT ?auto_81476 ?auto_81479 ) ( CLEAR ?auto_81476 ) ( IS-CRATE ?auto_81477 ) ( not ( = ?auto_81476 ?auto_81477 ) ) ( AVAILABLE ?auto_81480 ) ( ON ?auto_81476 ?auto_81483 ) ( not ( = ?auto_81483 ?auto_81476 ) ) ( not ( = ?auto_81483 ?auto_81477 ) ) ( not ( = ?auto_81478 ?auto_81479 ) ) ( HOIST-AT ?auto_81481 ?auto_81478 ) ( not ( = ?auto_81480 ?auto_81481 ) ) ( AVAILABLE ?auto_81481 ) ( SURFACE-AT ?auto_81477 ?auto_81478 ) ( ON ?auto_81477 ?auto_81482 ) ( CLEAR ?auto_81477 ) ( not ( = ?auto_81476 ?auto_81482 ) ) ( not ( = ?auto_81477 ?auto_81482 ) ) ( not ( = ?auto_81483 ?auto_81482 ) ) ( TRUCK-AT ?auto_81484 ?auto_81485 ) ( not ( = ?auto_81485 ?auto_81479 ) ) ( not ( = ?auto_81478 ?auto_81485 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81484 ?auto_81485 ?auto_81479 )
      ( MAKE-1CRATE ?auto_81476 ?auto_81477 )
      ( MAKE-1CRATE-VERIFY ?auto_81476 ?auto_81477 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81516 - SURFACE
      ?auto_81517 - SURFACE
      ?auto_81518 - SURFACE
      ?auto_81515 - SURFACE
    )
    :vars
    (
      ?auto_81520 - HOIST
      ?auto_81519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81520 ?auto_81519 ) ( SURFACE-AT ?auto_81518 ?auto_81519 ) ( CLEAR ?auto_81518 ) ( LIFTING ?auto_81520 ?auto_81515 ) ( IS-CRATE ?auto_81515 ) ( not ( = ?auto_81518 ?auto_81515 ) ) ( ON ?auto_81517 ?auto_81516 ) ( ON ?auto_81518 ?auto_81517 ) ( not ( = ?auto_81516 ?auto_81517 ) ) ( not ( = ?auto_81516 ?auto_81518 ) ) ( not ( = ?auto_81516 ?auto_81515 ) ) ( not ( = ?auto_81517 ?auto_81518 ) ) ( not ( = ?auto_81517 ?auto_81515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81518 ?auto_81515 )
      ( MAKE-3CRATE-VERIFY ?auto_81516 ?auto_81517 ?auto_81518 ?auto_81515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81533 - SURFACE
      ?auto_81534 - SURFACE
      ?auto_81535 - SURFACE
      ?auto_81532 - SURFACE
    )
    :vars
    (
      ?auto_81536 - HOIST
      ?auto_81538 - PLACE
      ?auto_81537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81536 ?auto_81538 ) ( SURFACE-AT ?auto_81535 ?auto_81538 ) ( CLEAR ?auto_81535 ) ( IS-CRATE ?auto_81532 ) ( not ( = ?auto_81535 ?auto_81532 ) ) ( TRUCK-AT ?auto_81537 ?auto_81538 ) ( AVAILABLE ?auto_81536 ) ( IN ?auto_81532 ?auto_81537 ) ( ON ?auto_81535 ?auto_81534 ) ( not ( = ?auto_81534 ?auto_81535 ) ) ( not ( = ?auto_81534 ?auto_81532 ) ) ( ON ?auto_81534 ?auto_81533 ) ( not ( = ?auto_81533 ?auto_81534 ) ) ( not ( = ?auto_81533 ?auto_81535 ) ) ( not ( = ?auto_81533 ?auto_81532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81534 ?auto_81535 ?auto_81532 )
      ( MAKE-3CRATE-VERIFY ?auto_81533 ?auto_81534 ?auto_81535 ?auto_81532 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81554 - SURFACE
      ?auto_81555 - SURFACE
      ?auto_81556 - SURFACE
      ?auto_81553 - SURFACE
    )
    :vars
    (
      ?auto_81558 - HOIST
      ?auto_81557 - PLACE
      ?auto_81559 - TRUCK
      ?auto_81560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81558 ?auto_81557 ) ( SURFACE-AT ?auto_81556 ?auto_81557 ) ( CLEAR ?auto_81556 ) ( IS-CRATE ?auto_81553 ) ( not ( = ?auto_81556 ?auto_81553 ) ) ( AVAILABLE ?auto_81558 ) ( IN ?auto_81553 ?auto_81559 ) ( ON ?auto_81556 ?auto_81555 ) ( not ( = ?auto_81555 ?auto_81556 ) ) ( not ( = ?auto_81555 ?auto_81553 ) ) ( TRUCK-AT ?auto_81559 ?auto_81560 ) ( not ( = ?auto_81560 ?auto_81557 ) ) ( ON ?auto_81555 ?auto_81554 ) ( not ( = ?auto_81554 ?auto_81555 ) ) ( not ( = ?auto_81554 ?auto_81556 ) ) ( not ( = ?auto_81554 ?auto_81553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81555 ?auto_81556 ?auto_81553 )
      ( MAKE-3CRATE-VERIFY ?auto_81554 ?auto_81555 ?auto_81556 ?auto_81553 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81578 - SURFACE
      ?auto_81579 - SURFACE
      ?auto_81580 - SURFACE
      ?auto_81577 - SURFACE
    )
    :vars
    (
      ?auto_81583 - HOIST
      ?auto_81584 - PLACE
      ?auto_81582 - TRUCK
      ?auto_81581 - PLACE
      ?auto_81585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81583 ?auto_81584 ) ( SURFACE-AT ?auto_81580 ?auto_81584 ) ( CLEAR ?auto_81580 ) ( IS-CRATE ?auto_81577 ) ( not ( = ?auto_81580 ?auto_81577 ) ) ( AVAILABLE ?auto_81583 ) ( ON ?auto_81580 ?auto_81579 ) ( not ( = ?auto_81579 ?auto_81580 ) ) ( not ( = ?auto_81579 ?auto_81577 ) ) ( TRUCK-AT ?auto_81582 ?auto_81581 ) ( not ( = ?auto_81581 ?auto_81584 ) ) ( HOIST-AT ?auto_81585 ?auto_81581 ) ( LIFTING ?auto_81585 ?auto_81577 ) ( not ( = ?auto_81583 ?auto_81585 ) ) ( ON ?auto_81579 ?auto_81578 ) ( not ( = ?auto_81578 ?auto_81579 ) ) ( not ( = ?auto_81578 ?auto_81580 ) ) ( not ( = ?auto_81578 ?auto_81577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81579 ?auto_81580 ?auto_81577 )
      ( MAKE-3CRATE-VERIFY ?auto_81578 ?auto_81579 ?auto_81580 ?auto_81577 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81605 - SURFACE
      ?auto_81606 - SURFACE
      ?auto_81607 - SURFACE
      ?auto_81604 - SURFACE
    )
    :vars
    (
      ?auto_81613 - HOIST
      ?auto_81608 - PLACE
      ?auto_81610 - TRUCK
      ?auto_81612 - PLACE
      ?auto_81611 - HOIST
      ?auto_81609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81613 ?auto_81608 ) ( SURFACE-AT ?auto_81607 ?auto_81608 ) ( CLEAR ?auto_81607 ) ( IS-CRATE ?auto_81604 ) ( not ( = ?auto_81607 ?auto_81604 ) ) ( AVAILABLE ?auto_81613 ) ( ON ?auto_81607 ?auto_81606 ) ( not ( = ?auto_81606 ?auto_81607 ) ) ( not ( = ?auto_81606 ?auto_81604 ) ) ( TRUCK-AT ?auto_81610 ?auto_81612 ) ( not ( = ?auto_81612 ?auto_81608 ) ) ( HOIST-AT ?auto_81611 ?auto_81612 ) ( not ( = ?auto_81613 ?auto_81611 ) ) ( AVAILABLE ?auto_81611 ) ( SURFACE-AT ?auto_81604 ?auto_81612 ) ( ON ?auto_81604 ?auto_81609 ) ( CLEAR ?auto_81604 ) ( not ( = ?auto_81607 ?auto_81609 ) ) ( not ( = ?auto_81604 ?auto_81609 ) ) ( not ( = ?auto_81606 ?auto_81609 ) ) ( ON ?auto_81606 ?auto_81605 ) ( not ( = ?auto_81605 ?auto_81606 ) ) ( not ( = ?auto_81605 ?auto_81607 ) ) ( not ( = ?auto_81605 ?auto_81604 ) ) ( not ( = ?auto_81605 ?auto_81609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81606 ?auto_81607 ?auto_81604 )
      ( MAKE-3CRATE-VERIFY ?auto_81605 ?auto_81606 ?auto_81607 ?auto_81604 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81633 - SURFACE
      ?auto_81634 - SURFACE
      ?auto_81635 - SURFACE
      ?auto_81632 - SURFACE
    )
    :vars
    (
      ?auto_81636 - HOIST
      ?auto_81640 - PLACE
      ?auto_81641 - PLACE
      ?auto_81637 - HOIST
      ?auto_81638 - SURFACE
      ?auto_81639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81636 ?auto_81640 ) ( SURFACE-AT ?auto_81635 ?auto_81640 ) ( CLEAR ?auto_81635 ) ( IS-CRATE ?auto_81632 ) ( not ( = ?auto_81635 ?auto_81632 ) ) ( AVAILABLE ?auto_81636 ) ( ON ?auto_81635 ?auto_81634 ) ( not ( = ?auto_81634 ?auto_81635 ) ) ( not ( = ?auto_81634 ?auto_81632 ) ) ( not ( = ?auto_81641 ?auto_81640 ) ) ( HOIST-AT ?auto_81637 ?auto_81641 ) ( not ( = ?auto_81636 ?auto_81637 ) ) ( AVAILABLE ?auto_81637 ) ( SURFACE-AT ?auto_81632 ?auto_81641 ) ( ON ?auto_81632 ?auto_81638 ) ( CLEAR ?auto_81632 ) ( not ( = ?auto_81635 ?auto_81638 ) ) ( not ( = ?auto_81632 ?auto_81638 ) ) ( not ( = ?auto_81634 ?auto_81638 ) ) ( TRUCK-AT ?auto_81639 ?auto_81640 ) ( ON ?auto_81634 ?auto_81633 ) ( not ( = ?auto_81633 ?auto_81634 ) ) ( not ( = ?auto_81633 ?auto_81635 ) ) ( not ( = ?auto_81633 ?auto_81632 ) ) ( not ( = ?auto_81633 ?auto_81638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81634 ?auto_81635 ?auto_81632 )
      ( MAKE-3CRATE-VERIFY ?auto_81633 ?auto_81634 ?auto_81635 ?auto_81632 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81661 - SURFACE
      ?auto_81662 - SURFACE
      ?auto_81663 - SURFACE
      ?auto_81660 - SURFACE
    )
    :vars
    (
      ?auto_81665 - HOIST
      ?auto_81669 - PLACE
      ?auto_81668 - PLACE
      ?auto_81664 - HOIST
      ?auto_81666 - SURFACE
      ?auto_81667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81665 ?auto_81669 ) ( IS-CRATE ?auto_81660 ) ( not ( = ?auto_81663 ?auto_81660 ) ) ( not ( = ?auto_81662 ?auto_81663 ) ) ( not ( = ?auto_81662 ?auto_81660 ) ) ( not ( = ?auto_81668 ?auto_81669 ) ) ( HOIST-AT ?auto_81664 ?auto_81668 ) ( not ( = ?auto_81665 ?auto_81664 ) ) ( AVAILABLE ?auto_81664 ) ( SURFACE-AT ?auto_81660 ?auto_81668 ) ( ON ?auto_81660 ?auto_81666 ) ( CLEAR ?auto_81660 ) ( not ( = ?auto_81663 ?auto_81666 ) ) ( not ( = ?auto_81660 ?auto_81666 ) ) ( not ( = ?auto_81662 ?auto_81666 ) ) ( TRUCK-AT ?auto_81667 ?auto_81669 ) ( SURFACE-AT ?auto_81662 ?auto_81669 ) ( CLEAR ?auto_81662 ) ( LIFTING ?auto_81665 ?auto_81663 ) ( IS-CRATE ?auto_81663 ) ( ON ?auto_81662 ?auto_81661 ) ( not ( = ?auto_81661 ?auto_81662 ) ) ( not ( = ?auto_81661 ?auto_81663 ) ) ( not ( = ?auto_81661 ?auto_81660 ) ) ( not ( = ?auto_81661 ?auto_81666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81662 ?auto_81663 ?auto_81660 )
      ( MAKE-3CRATE-VERIFY ?auto_81661 ?auto_81662 ?auto_81663 ?auto_81660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81689 - SURFACE
      ?auto_81690 - SURFACE
      ?auto_81691 - SURFACE
      ?auto_81688 - SURFACE
    )
    :vars
    (
      ?auto_81694 - HOIST
      ?auto_81692 - PLACE
      ?auto_81697 - PLACE
      ?auto_81695 - HOIST
      ?auto_81696 - SURFACE
      ?auto_81693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81694 ?auto_81692 ) ( IS-CRATE ?auto_81688 ) ( not ( = ?auto_81691 ?auto_81688 ) ) ( not ( = ?auto_81690 ?auto_81691 ) ) ( not ( = ?auto_81690 ?auto_81688 ) ) ( not ( = ?auto_81697 ?auto_81692 ) ) ( HOIST-AT ?auto_81695 ?auto_81697 ) ( not ( = ?auto_81694 ?auto_81695 ) ) ( AVAILABLE ?auto_81695 ) ( SURFACE-AT ?auto_81688 ?auto_81697 ) ( ON ?auto_81688 ?auto_81696 ) ( CLEAR ?auto_81688 ) ( not ( = ?auto_81691 ?auto_81696 ) ) ( not ( = ?auto_81688 ?auto_81696 ) ) ( not ( = ?auto_81690 ?auto_81696 ) ) ( TRUCK-AT ?auto_81693 ?auto_81692 ) ( SURFACE-AT ?auto_81690 ?auto_81692 ) ( CLEAR ?auto_81690 ) ( IS-CRATE ?auto_81691 ) ( AVAILABLE ?auto_81694 ) ( IN ?auto_81691 ?auto_81693 ) ( ON ?auto_81690 ?auto_81689 ) ( not ( = ?auto_81689 ?auto_81690 ) ) ( not ( = ?auto_81689 ?auto_81691 ) ) ( not ( = ?auto_81689 ?auto_81688 ) ) ( not ( = ?auto_81689 ?auto_81696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81690 ?auto_81691 ?auto_81688 )
      ( MAKE-3CRATE-VERIFY ?auto_81689 ?auto_81690 ?auto_81691 ?auto_81688 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81980 - SURFACE
      ?auto_81981 - SURFACE
      ?auto_81982 - SURFACE
      ?auto_81979 - SURFACE
      ?auto_81983 - SURFACE
    )
    :vars
    (
      ?auto_81984 - HOIST
      ?auto_81985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81984 ?auto_81985 ) ( SURFACE-AT ?auto_81979 ?auto_81985 ) ( CLEAR ?auto_81979 ) ( LIFTING ?auto_81984 ?auto_81983 ) ( IS-CRATE ?auto_81983 ) ( not ( = ?auto_81979 ?auto_81983 ) ) ( ON ?auto_81981 ?auto_81980 ) ( ON ?auto_81982 ?auto_81981 ) ( ON ?auto_81979 ?auto_81982 ) ( not ( = ?auto_81980 ?auto_81981 ) ) ( not ( = ?auto_81980 ?auto_81982 ) ) ( not ( = ?auto_81980 ?auto_81979 ) ) ( not ( = ?auto_81980 ?auto_81983 ) ) ( not ( = ?auto_81981 ?auto_81982 ) ) ( not ( = ?auto_81981 ?auto_81979 ) ) ( not ( = ?auto_81981 ?auto_81983 ) ) ( not ( = ?auto_81982 ?auto_81979 ) ) ( not ( = ?auto_81982 ?auto_81983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81979 ?auto_81983 )
      ( MAKE-4CRATE-VERIFY ?auto_81980 ?auto_81981 ?auto_81982 ?auto_81979 ?auto_81983 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82005 - SURFACE
      ?auto_82006 - SURFACE
      ?auto_82007 - SURFACE
      ?auto_82004 - SURFACE
      ?auto_82008 - SURFACE
    )
    :vars
    (
      ?auto_82011 - HOIST
      ?auto_82010 - PLACE
      ?auto_82009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82011 ?auto_82010 ) ( SURFACE-AT ?auto_82004 ?auto_82010 ) ( CLEAR ?auto_82004 ) ( IS-CRATE ?auto_82008 ) ( not ( = ?auto_82004 ?auto_82008 ) ) ( TRUCK-AT ?auto_82009 ?auto_82010 ) ( AVAILABLE ?auto_82011 ) ( IN ?auto_82008 ?auto_82009 ) ( ON ?auto_82004 ?auto_82007 ) ( not ( = ?auto_82007 ?auto_82004 ) ) ( not ( = ?auto_82007 ?auto_82008 ) ) ( ON ?auto_82006 ?auto_82005 ) ( ON ?auto_82007 ?auto_82006 ) ( not ( = ?auto_82005 ?auto_82006 ) ) ( not ( = ?auto_82005 ?auto_82007 ) ) ( not ( = ?auto_82005 ?auto_82004 ) ) ( not ( = ?auto_82005 ?auto_82008 ) ) ( not ( = ?auto_82006 ?auto_82007 ) ) ( not ( = ?auto_82006 ?auto_82004 ) ) ( not ( = ?auto_82006 ?auto_82008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82007 ?auto_82004 ?auto_82008 )
      ( MAKE-4CRATE-VERIFY ?auto_82005 ?auto_82006 ?auto_82007 ?auto_82004 ?auto_82008 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82035 - SURFACE
      ?auto_82036 - SURFACE
      ?auto_82037 - SURFACE
      ?auto_82034 - SURFACE
      ?auto_82038 - SURFACE
    )
    :vars
    (
      ?auto_82039 - HOIST
      ?auto_82040 - PLACE
      ?auto_82042 - TRUCK
      ?auto_82041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82039 ?auto_82040 ) ( SURFACE-AT ?auto_82034 ?auto_82040 ) ( CLEAR ?auto_82034 ) ( IS-CRATE ?auto_82038 ) ( not ( = ?auto_82034 ?auto_82038 ) ) ( AVAILABLE ?auto_82039 ) ( IN ?auto_82038 ?auto_82042 ) ( ON ?auto_82034 ?auto_82037 ) ( not ( = ?auto_82037 ?auto_82034 ) ) ( not ( = ?auto_82037 ?auto_82038 ) ) ( TRUCK-AT ?auto_82042 ?auto_82041 ) ( not ( = ?auto_82041 ?auto_82040 ) ) ( ON ?auto_82036 ?auto_82035 ) ( ON ?auto_82037 ?auto_82036 ) ( not ( = ?auto_82035 ?auto_82036 ) ) ( not ( = ?auto_82035 ?auto_82037 ) ) ( not ( = ?auto_82035 ?auto_82034 ) ) ( not ( = ?auto_82035 ?auto_82038 ) ) ( not ( = ?auto_82036 ?auto_82037 ) ) ( not ( = ?auto_82036 ?auto_82034 ) ) ( not ( = ?auto_82036 ?auto_82038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82037 ?auto_82034 ?auto_82038 )
      ( MAKE-4CRATE-VERIFY ?auto_82035 ?auto_82036 ?auto_82037 ?auto_82034 ?auto_82038 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82069 - SURFACE
      ?auto_82070 - SURFACE
      ?auto_82071 - SURFACE
      ?auto_82068 - SURFACE
      ?auto_82072 - SURFACE
    )
    :vars
    (
      ?auto_82075 - HOIST
      ?auto_82076 - PLACE
      ?auto_82077 - TRUCK
      ?auto_82074 - PLACE
      ?auto_82073 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_82075 ?auto_82076 ) ( SURFACE-AT ?auto_82068 ?auto_82076 ) ( CLEAR ?auto_82068 ) ( IS-CRATE ?auto_82072 ) ( not ( = ?auto_82068 ?auto_82072 ) ) ( AVAILABLE ?auto_82075 ) ( ON ?auto_82068 ?auto_82071 ) ( not ( = ?auto_82071 ?auto_82068 ) ) ( not ( = ?auto_82071 ?auto_82072 ) ) ( TRUCK-AT ?auto_82077 ?auto_82074 ) ( not ( = ?auto_82074 ?auto_82076 ) ) ( HOIST-AT ?auto_82073 ?auto_82074 ) ( LIFTING ?auto_82073 ?auto_82072 ) ( not ( = ?auto_82075 ?auto_82073 ) ) ( ON ?auto_82070 ?auto_82069 ) ( ON ?auto_82071 ?auto_82070 ) ( not ( = ?auto_82069 ?auto_82070 ) ) ( not ( = ?auto_82069 ?auto_82071 ) ) ( not ( = ?auto_82069 ?auto_82068 ) ) ( not ( = ?auto_82069 ?auto_82072 ) ) ( not ( = ?auto_82070 ?auto_82071 ) ) ( not ( = ?auto_82070 ?auto_82068 ) ) ( not ( = ?auto_82070 ?auto_82072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82071 ?auto_82068 ?auto_82072 )
      ( MAKE-4CRATE-VERIFY ?auto_82069 ?auto_82070 ?auto_82071 ?auto_82068 ?auto_82072 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82107 - SURFACE
      ?auto_82108 - SURFACE
      ?auto_82109 - SURFACE
      ?auto_82106 - SURFACE
      ?auto_82110 - SURFACE
    )
    :vars
    (
      ?auto_82113 - HOIST
      ?auto_82111 - PLACE
      ?auto_82114 - TRUCK
      ?auto_82112 - PLACE
      ?auto_82116 - HOIST
      ?auto_82115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82113 ?auto_82111 ) ( SURFACE-AT ?auto_82106 ?auto_82111 ) ( CLEAR ?auto_82106 ) ( IS-CRATE ?auto_82110 ) ( not ( = ?auto_82106 ?auto_82110 ) ) ( AVAILABLE ?auto_82113 ) ( ON ?auto_82106 ?auto_82109 ) ( not ( = ?auto_82109 ?auto_82106 ) ) ( not ( = ?auto_82109 ?auto_82110 ) ) ( TRUCK-AT ?auto_82114 ?auto_82112 ) ( not ( = ?auto_82112 ?auto_82111 ) ) ( HOIST-AT ?auto_82116 ?auto_82112 ) ( not ( = ?auto_82113 ?auto_82116 ) ) ( AVAILABLE ?auto_82116 ) ( SURFACE-AT ?auto_82110 ?auto_82112 ) ( ON ?auto_82110 ?auto_82115 ) ( CLEAR ?auto_82110 ) ( not ( = ?auto_82106 ?auto_82115 ) ) ( not ( = ?auto_82110 ?auto_82115 ) ) ( not ( = ?auto_82109 ?auto_82115 ) ) ( ON ?auto_82108 ?auto_82107 ) ( ON ?auto_82109 ?auto_82108 ) ( not ( = ?auto_82107 ?auto_82108 ) ) ( not ( = ?auto_82107 ?auto_82109 ) ) ( not ( = ?auto_82107 ?auto_82106 ) ) ( not ( = ?auto_82107 ?auto_82110 ) ) ( not ( = ?auto_82107 ?auto_82115 ) ) ( not ( = ?auto_82108 ?auto_82109 ) ) ( not ( = ?auto_82108 ?auto_82106 ) ) ( not ( = ?auto_82108 ?auto_82110 ) ) ( not ( = ?auto_82108 ?auto_82115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82109 ?auto_82106 ?auto_82110 )
      ( MAKE-4CRATE-VERIFY ?auto_82107 ?auto_82108 ?auto_82109 ?auto_82106 ?auto_82110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82146 - SURFACE
      ?auto_82147 - SURFACE
      ?auto_82148 - SURFACE
      ?auto_82145 - SURFACE
      ?auto_82149 - SURFACE
    )
    :vars
    (
      ?auto_82155 - HOIST
      ?auto_82154 - PLACE
      ?auto_82150 - PLACE
      ?auto_82152 - HOIST
      ?auto_82151 - SURFACE
      ?auto_82153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82155 ?auto_82154 ) ( SURFACE-AT ?auto_82145 ?auto_82154 ) ( CLEAR ?auto_82145 ) ( IS-CRATE ?auto_82149 ) ( not ( = ?auto_82145 ?auto_82149 ) ) ( AVAILABLE ?auto_82155 ) ( ON ?auto_82145 ?auto_82148 ) ( not ( = ?auto_82148 ?auto_82145 ) ) ( not ( = ?auto_82148 ?auto_82149 ) ) ( not ( = ?auto_82150 ?auto_82154 ) ) ( HOIST-AT ?auto_82152 ?auto_82150 ) ( not ( = ?auto_82155 ?auto_82152 ) ) ( AVAILABLE ?auto_82152 ) ( SURFACE-AT ?auto_82149 ?auto_82150 ) ( ON ?auto_82149 ?auto_82151 ) ( CLEAR ?auto_82149 ) ( not ( = ?auto_82145 ?auto_82151 ) ) ( not ( = ?auto_82149 ?auto_82151 ) ) ( not ( = ?auto_82148 ?auto_82151 ) ) ( TRUCK-AT ?auto_82153 ?auto_82154 ) ( ON ?auto_82147 ?auto_82146 ) ( ON ?auto_82148 ?auto_82147 ) ( not ( = ?auto_82146 ?auto_82147 ) ) ( not ( = ?auto_82146 ?auto_82148 ) ) ( not ( = ?auto_82146 ?auto_82145 ) ) ( not ( = ?auto_82146 ?auto_82149 ) ) ( not ( = ?auto_82146 ?auto_82151 ) ) ( not ( = ?auto_82147 ?auto_82148 ) ) ( not ( = ?auto_82147 ?auto_82145 ) ) ( not ( = ?auto_82147 ?auto_82149 ) ) ( not ( = ?auto_82147 ?auto_82151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82148 ?auto_82145 ?auto_82149 )
      ( MAKE-4CRATE-VERIFY ?auto_82146 ?auto_82147 ?auto_82148 ?auto_82145 ?auto_82149 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82185 - SURFACE
      ?auto_82186 - SURFACE
      ?auto_82187 - SURFACE
      ?auto_82184 - SURFACE
      ?auto_82188 - SURFACE
    )
    :vars
    (
      ?auto_82191 - HOIST
      ?auto_82189 - PLACE
      ?auto_82192 - PLACE
      ?auto_82194 - HOIST
      ?auto_82190 - SURFACE
      ?auto_82193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82191 ?auto_82189 ) ( IS-CRATE ?auto_82188 ) ( not ( = ?auto_82184 ?auto_82188 ) ) ( not ( = ?auto_82187 ?auto_82184 ) ) ( not ( = ?auto_82187 ?auto_82188 ) ) ( not ( = ?auto_82192 ?auto_82189 ) ) ( HOIST-AT ?auto_82194 ?auto_82192 ) ( not ( = ?auto_82191 ?auto_82194 ) ) ( AVAILABLE ?auto_82194 ) ( SURFACE-AT ?auto_82188 ?auto_82192 ) ( ON ?auto_82188 ?auto_82190 ) ( CLEAR ?auto_82188 ) ( not ( = ?auto_82184 ?auto_82190 ) ) ( not ( = ?auto_82188 ?auto_82190 ) ) ( not ( = ?auto_82187 ?auto_82190 ) ) ( TRUCK-AT ?auto_82193 ?auto_82189 ) ( SURFACE-AT ?auto_82187 ?auto_82189 ) ( CLEAR ?auto_82187 ) ( LIFTING ?auto_82191 ?auto_82184 ) ( IS-CRATE ?auto_82184 ) ( ON ?auto_82186 ?auto_82185 ) ( ON ?auto_82187 ?auto_82186 ) ( not ( = ?auto_82185 ?auto_82186 ) ) ( not ( = ?auto_82185 ?auto_82187 ) ) ( not ( = ?auto_82185 ?auto_82184 ) ) ( not ( = ?auto_82185 ?auto_82188 ) ) ( not ( = ?auto_82185 ?auto_82190 ) ) ( not ( = ?auto_82186 ?auto_82187 ) ) ( not ( = ?auto_82186 ?auto_82184 ) ) ( not ( = ?auto_82186 ?auto_82188 ) ) ( not ( = ?auto_82186 ?auto_82190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82187 ?auto_82184 ?auto_82188 )
      ( MAKE-4CRATE-VERIFY ?auto_82185 ?auto_82186 ?auto_82187 ?auto_82184 ?auto_82188 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82224 - SURFACE
      ?auto_82225 - SURFACE
      ?auto_82226 - SURFACE
      ?auto_82223 - SURFACE
      ?auto_82227 - SURFACE
    )
    :vars
    (
      ?auto_82231 - HOIST
      ?auto_82230 - PLACE
      ?auto_82229 - PLACE
      ?auto_82233 - HOIST
      ?auto_82232 - SURFACE
      ?auto_82228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82231 ?auto_82230 ) ( IS-CRATE ?auto_82227 ) ( not ( = ?auto_82223 ?auto_82227 ) ) ( not ( = ?auto_82226 ?auto_82223 ) ) ( not ( = ?auto_82226 ?auto_82227 ) ) ( not ( = ?auto_82229 ?auto_82230 ) ) ( HOIST-AT ?auto_82233 ?auto_82229 ) ( not ( = ?auto_82231 ?auto_82233 ) ) ( AVAILABLE ?auto_82233 ) ( SURFACE-AT ?auto_82227 ?auto_82229 ) ( ON ?auto_82227 ?auto_82232 ) ( CLEAR ?auto_82227 ) ( not ( = ?auto_82223 ?auto_82232 ) ) ( not ( = ?auto_82227 ?auto_82232 ) ) ( not ( = ?auto_82226 ?auto_82232 ) ) ( TRUCK-AT ?auto_82228 ?auto_82230 ) ( SURFACE-AT ?auto_82226 ?auto_82230 ) ( CLEAR ?auto_82226 ) ( IS-CRATE ?auto_82223 ) ( AVAILABLE ?auto_82231 ) ( IN ?auto_82223 ?auto_82228 ) ( ON ?auto_82225 ?auto_82224 ) ( ON ?auto_82226 ?auto_82225 ) ( not ( = ?auto_82224 ?auto_82225 ) ) ( not ( = ?auto_82224 ?auto_82226 ) ) ( not ( = ?auto_82224 ?auto_82223 ) ) ( not ( = ?auto_82224 ?auto_82227 ) ) ( not ( = ?auto_82224 ?auto_82232 ) ) ( not ( = ?auto_82225 ?auto_82226 ) ) ( not ( = ?auto_82225 ?auto_82223 ) ) ( not ( = ?auto_82225 ?auto_82227 ) ) ( not ( = ?auto_82225 ?auto_82232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82226 ?auto_82223 ?auto_82227 )
      ( MAKE-4CRATE-VERIFY ?auto_82224 ?auto_82225 ?auto_82226 ?auto_82223 ?auto_82227 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82884 - SURFACE
      ?auto_82885 - SURFACE
      ?auto_82886 - SURFACE
      ?auto_82883 - SURFACE
      ?auto_82887 - SURFACE
      ?auto_82888 - SURFACE
    )
    :vars
    (
      ?auto_82889 - HOIST
      ?auto_82890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82889 ?auto_82890 ) ( SURFACE-AT ?auto_82887 ?auto_82890 ) ( CLEAR ?auto_82887 ) ( LIFTING ?auto_82889 ?auto_82888 ) ( IS-CRATE ?auto_82888 ) ( not ( = ?auto_82887 ?auto_82888 ) ) ( ON ?auto_82885 ?auto_82884 ) ( ON ?auto_82886 ?auto_82885 ) ( ON ?auto_82883 ?auto_82886 ) ( ON ?auto_82887 ?auto_82883 ) ( not ( = ?auto_82884 ?auto_82885 ) ) ( not ( = ?auto_82884 ?auto_82886 ) ) ( not ( = ?auto_82884 ?auto_82883 ) ) ( not ( = ?auto_82884 ?auto_82887 ) ) ( not ( = ?auto_82884 ?auto_82888 ) ) ( not ( = ?auto_82885 ?auto_82886 ) ) ( not ( = ?auto_82885 ?auto_82883 ) ) ( not ( = ?auto_82885 ?auto_82887 ) ) ( not ( = ?auto_82885 ?auto_82888 ) ) ( not ( = ?auto_82886 ?auto_82883 ) ) ( not ( = ?auto_82886 ?auto_82887 ) ) ( not ( = ?auto_82886 ?auto_82888 ) ) ( not ( = ?auto_82883 ?auto_82887 ) ) ( not ( = ?auto_82883 ?auto_82888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_82887 ?auto_82888 )
      ( MAKE-5CRATE-VERIFY ?auto_82884 ?auto_82885 ?auto_82886 ?auto_82883 ?auto_82887 ?auto_82888 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82918 - SURFACE
      ?auto_82919 - SURFACE
      ?auto_82920 - SURFACE
      ?auto_82917 - SURFACE
      ?auto_82921 - SURFACE
      ?auto_82922 - SURFACE
    )
    :vars
    (
      ?auto_82923 - HOIST
      ?auto_82924 - PLACE
      ?auto_82925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82923 ?auto_82924 ) ( SURFACE-AT ?auto_82921 ?auto_82924 ) ( CLEAR ?auto_82921 ) ( IS-CRATE ?auto_82922 ) ( not ( = ?auto_82921 ?auto_82922 ) ) ( TRUCK-AT ?auto_82925 ?auto_82924 ) ( AVAILABLE ?auto_82923 ) ( IN ?auto_82922 ?auto_82925 ) ( ON ?auto_82921 ?auto_82917 ) ( not ( = ?auto_82917 ?auto_82921 ) ) ( not ( = ?auto_82917 ?auto_82922 ) ) ( ON ?auto_82919 ?auto_82918 ) ( ON ?auto_82920 ?auto_82919 ) ( ON ?auto_82917 ?auto_82920 ) ( not ( = ?auto_82918 ?auto_82919 ) ) ( not ( = ?auto_82918 ?auto_82920 ) ) ( not ( = ?auto_82918 ?auto_82917 ) ) ( not ( = ?auto_82918 ?auto_82921 ) ) ( not ( = ?auto_82918 ?auto_82922 ) ) ( not ( = ?auto_82919 ?auto_82920 ) ) ( not ( = ?auto_82919 ?auto_82917 ) ) ( not ( = ?auto_82919 ?auto_82921 ) ) ( not ( = ?auto_82919 ?auto_82922 ) ) ( not ( = ?auto_82920 ?auto_82917 ) ) ( not ( = ?auto_82920 ?auto_82921 ) ) ( not ( = ?auto_82920 ?auto_82922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82917 ?auto_82921 ?auto_82922 )
      ( MAKE-5CRATE-VERIFY ?auto_82918 ?auto_82919 ?auto_82920 ?auto_82917 ?auto_82921 ?auto_82922 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82958 - SURFACE
      ?auto_82959 - SURFACE
      ?auto_82960 - SURFACE
      ?auto_82957 - SURFACE
      ?auto_82961 - SURFACE
      ?auto_82962 - SURFACE
    )
    :vars
    (
      ?auto_82963 - HOIST
      ?auto_82966 - PLACE
      ?auto_82964 - TRUCK
      ?auto_82965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82963 ?auto_82966 ) ( SURFACE-AT ?auto_82961 ?auto_82966 ) ( CLEAR ?auto_82961 ) ( IS-CRATE ?auto_82962 ) ( not ( = ?auto_82961 ?auto_82962 ) ) ( AVAILABLE ?auto_82963 ) ( IN ?auto_82962 ?auto_82964 ) ( ON ?auto_82961 ?auto_82957 ) ( not ( = ?auto_82957 ?auto_82961 ) ) ( not ( = ?auto_82957 ?auto_82962 ) ) ( TRUCK-AT ?auto_82964 ?auto_82965 ) ( not ( = ?auto_82965 ?auto_82966 ) ) ( ON ?auto_82959 ?auto_82958 ) ( ON ?auto_82960 ?auto_82959 ) ( ON ?auto_82957 ?auto_82960 ) ( not ( = ?auto_82958 ?auto_82959 ) ) ( not ( = ?auto_82958 ?auto_82960 ) ) ( not ( = ?auto_82958 ?auto_82957 ) ) ( not ( = ?auto_82958 ?auto_82961 ) ) ( not ( = ?auto_82958 ?auto_82962 ) ) ( not ( = ?auto_82959 ?auto_82960 ) ) ( not ( = ?auto_82959 ?auto_82957 ) ) ( not ( = ?auto_82959 ?auto_82961 ) ) ( not ( = ?auto_82959 ?auto_82962 ) ) ( not ( = ?auto_82960 ?auto_82957 ) ) ( not ( = ?auto_82960 ?auto_82961 ) ) ( not ( = ?auto_82960 ?auto_82962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82957 ?auto_82961 ?auto_82962 )
      ( MAKE-5CRATE-VERIFY ?auto_82958 ?auto_82959 ?auto_82960 ?auto_82957 ?auto_82961 ?auto_82962 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83003 - SURFACE
      ?auto_83004 - SURFACE
      ?auto_83005 - SURFACE
      ?auto_83002 - SURFACE
      ?auto_83006 - SURFACE
      ?auto_83007 - SURFACE
    )
    :vars
    (
      ?auto_83008 - HOIST
      ?auto_83010 - PLACE
      ?auto_83009 - TRUCK
      ?auto_83011 - PLACE
      ?auto_83012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_83008 ?auto_83010 ) ( SURFACE-AT ?auto_83006 ?auto_83010 ) ( CLEAR ?auto_83006 ) ( IS-CRATE ?auto_83007 ) ( not ( = ?auto_83006 ?auto_83007 ) ) ( AVAILABLE ?auto_83008 ) ( ON ?auto_83006 ?auto_83002 ) ( not ( = ?auto_83002 ?auto_83006 ) ) ( not ( = ?auto_83002 ?auto_83007 ) ) ( TRUCK-AT ?auto_83009 ?auto_83011 ) ( not ( = ?auto_83011 ?auto_83010 ) ) ( HOIST-AT ?auto_83012 ?auto_83011 ) ( LIFTING ?auto_83012 ?auto_83007 ) ( not ( = ?auto_83008 ?auto_83012 ) ) ( ON ?auto_83004 ?auto_83003 ) ( ON ?auto_83005 ?auto_83004 ) ( ON ?auto_83002 ?auto_83005 ) ( not ( = ?auto_83003 ?auto_83004 ) ) ( not ( = ?auto_83003 ?auto_83005 ) ) ( not ( = ?auto_83003 ?auto_83002 ) ) ( not ( = ?auto_83003 ?auto_83006 ) ) ( not ( = ?auto_83003 ?auto_83007 ) ) ( not ( = ?auto_83004 ?auto_83005 ) ) ( not ( = ?auto_83004 ?auto_83002 ) ) ( not ( = ?auto_83004 ?auto_83006 ) ) ( not ( = ?auto_83004 ?auto_83007 ) ) ( not ( = ?auto_83005 ?auto_83002 ) ) ( not ( = ?auto_83005 ?auto_83006 ) ) ( not ( = ?auto_83005 ?auto_83007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83002 ?auto_83006 ?auto_83007 )
      ( MAKE-5CRATE-VERIFY ?auto_83003 ?auto_83004 ?auto_83005 ?auto_83002 ?auto_83006 ?auto_83007 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83053 - SURFACE
      ?auto_83054 - SURFACE
      ?auto_83055 - SURFACE
      ?auto_83052 - SURFACE
      ?auto_83056 - SURFACE
      ?auto_83057 - SURFACE
    )
    :vars
    (
      ?auto_83059 - HOIST
      ?auto_83063 - PLACE
      ?auto_83062 - TRUCK
      ?auto_83060 - PLACE
      ?auto_83058 - HOIST
      ?auto_83061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_83059 ?auto_83063 ) ( SURFACE-AT ?auto_83056 ?auto_83063 ) ( CLEAR ?auto_83056 ) ( IS-CRATE ?auto_83057 ) ( not ( = ?auto_83056 ?auto_83057 ) ) ( AVAILABLE ?auto_83059 ) ( ON ?auto_83056 ?auto_83052 ) ( not ( = ?auto_83052 ?auto_83056 ) ) ( not ( = ?auto_83052 ?auto_83057 ) ) ( TRUCK-AT ?auto_83062 ?auto_83060 ) ( not ( = ?auto_83060 ?auto_83063 ) ) ( HOIST-AT ?auto_83058 ?auto_83060 ) ( not ( = ?auto_83059 ?auto_83058 ) ) ( AVAILABLE ?auto_83058 ) ( SURFACE-AT ?auto_83057 ?auto_83060 ) ( ON ?auto_83057 ?auto_83061 ) ( CLEAR ?auto_83057 ) ( not ( = ?auto_83056 ?auto_83061 ) ) ( not ( = ?auto_83057 ?auto_83061 ) ) ( not ( = ?auto_83052 ?auto_83061 ) ) ( ON ?auto_83054 ?auto_83053 ) ( ON ?auto_83055 ?auto_83054 ) ( ON ?auto_83052 ?auto_83055 ) ( not ( = ?auto_83053 ?auto_83054 ) ) ( not ( = ?auto_83053 ?auto_83055 ) ) ( not ( = ?auto_83053 ?auto_83052 ) ) ( not ( = ?auto_83053 ?auto_83056 ) ) ( not ( = ?auto_83053 ?auto_83057 ) ) ( not ( = ?auto_83053 ?auto_83061 ) ) ( not ( = ?auto_83054 ?auto_83055 ) ) ( not ( = ?auto_83054 ?auto_83052 ) ) ( not ( = ?auto_83054 ?auto_83056 ) ) ( not ( = ?auto_83054 ?auto_83057 ) ) ( not ( = ?auto_83054 ?auto_83061 ) ) ( not ( = ?auto_83055 ?auto_83052 ) ) ( not ( = ?auto_83055 ?auto_83056 ) ) ( not ( = ?auto_83055 ?auto_83057 ) ) ( not ( = ?auto_83055 ?auto_83061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83052 ?auto_83056 ?auto_83057 )
      ( MAKE-5CRATE-VERIFY ?auto_83053 ?auto_83054 ?auto_83055 ?auto_83052 ?auto_83056 ?auto_83057 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83104 - SURFACE
      ?auto_83105 - SURFACE
      ?auto_83106 - SURFACE
      ?auto_83103 - SURFACE
      ?auto_83107 - SURFACE
      ?auto_83108 - SURFACE
    )
    :vars
    (
      ?auto_83109 - HOIST
      ?auto_83112 - PLACE
      ?auto_83113 - PLACE
      ?auto_83111 - HOIST
      ?auto_83114 - SURFACE
      ?auto_83110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83109 ?auto_83112 ) ( SURFACE-AT ?auto_83107 ?auto_83112 ) ( CLEAR ?auto_83107 ) ( IS-CRATE ?auto_83108 ) ( not ( = ?auto_83107 ?auto_83108 ) ) ( AVAILABLE ?auto_83109 ) ( ON ?auto_83107 ?auto_83103 ) ( not ( = ?auto_83103 ?auto_83107 ) ) ( not ( = ?auto_83103 ?auto_83108 ) ) ( not ( = ?auto_83113 ?auto_83112 ) ) ( HOIST-AT ?auto_83111 ?auto_83113 ) ( not ( = ?auto_83109 ?auto_83111 ) ) ( AVAILABLE ?auto_83111 ) ( SURFACE-AT ?auto_83108 ?auto_83113 ) ( ON ?auto_83108 ?auto_83114 ) ( CLEAR ?auto_83108 ) ( not ( = ?auto_83107 ?auto_83114 ) ) ( not ( = ?auto_83108 ?auto_83114 ) ) ( not ( = ?auto_83103 ?auto_83114 ) ) ( TRUCK-AT ?auto_83110 ?auto_83112 ) ( ON ?auto_83105 ?auto_83104 ) ( ON ?auto_83106 ?auto_83105 ) ( ON ?auto_83103 ?auto_83106 ) ( not ( = ?auto_83104 ?auto_83105 ) ) ( not ( = ?auto_83104 ?auto_83106 ) ) ( not ( = ?auto_83104 ?auto_83103 ) ) ( not ( = ?auto_83104 ?auto_83107 ) ) ( not ( = ?auto_83104 ?auto_83108 ) ) ( not ( = ?auto_83104 ?auto_83114 ) ) ( not ( = ?auto_83105 ?auto_83106 ) ) ( not ( = ?auto_83105 ?auto_83103 ) ) ( not ( = ?auto_83105 ?auto_83107 ) ) ( not ( = ?auto_83105 ?auto_83108 ) ) ( not ( = ?auto_83105 ?auto_83114 ) ) ( not ( = ?auto_83106 ?auto_83103 ) ) ( not ( = ?auto_83106 ?auto_83107 ) ) ( not ( = ?auto_83106 ?auto_83108 ) ) ( not ( = ?auto_83106 ?auto_83114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83103 ?auto_83107 ?auto_83108 )
      ( MAKE-5CRATE-VERIFY ?auto_83104 ?auto_83105 ?auto_83106 ?auto_83103 ?auto_83107 ?auto_83108 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83155 - SURFACE
      ?auto_83156 - SURFACE
      ?auto_83157 - SURFACE
      ?auto_83154 - SURFACE
      ?auto_83158 - SURFACE
      ?auto_83159 - SURFACE
    )
    :vars
    (
      ?auto_83162 - HOIST
      ?auto_83164 - PLACE
      ?auto_83161 - PLACE
      ?auto_83160 - HOIST
      ?auto_83165 - SURFACE
      ?auto_83163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83162 ?auto_83164 ) ( IS-CRATE ?auto_83159 ) ( not ( = ?auto_83158 ?auto_83159 ) ) ( not ( = ?auto_83154 ?auto_83158 ) ) ( not ( = ?auto_83154 ?auto_83159 ) ) ( not ( = ?auto_83161 ?auto_83164 ) ) ( HOIST-AT ?auto_83160 ?auto_83161 ) ( not ( = ?auto_83162 ?auto_83160 ) ) ( AVAILABLE ?auto_83160 ) ( SURFACE-AT ?auto_83159 ?auto_83161 ) ( ON ?auto_83159 ?auto_83165 ) ( CLEAR ?auto_83159 ) ( not ( = ?auto_83158 ?auto_83165 ) ) ( not ( = ?auto_83159 ?auto_83165 ) ) ( not ( = ?auto_83154 ?auto_83165 ) ) ( TRUCK-AT ?auto_83163 ?auto_83164 ) ( SURFACE-AT ?auto_83154 ?auto_83164 ) ( CLEAR ?auto_83154 ) ( LIFTING ?auto_83162 ?auto_83158 ) ( IS-CRATE ?auto_83158 ) ( ON ?auto_83156 ?auto_83155 ) ( ON ?auto_83157 ?auto_83156 ) ( ON ?auto_83154 ?auto_83157 ) ( not ( = ?auto_83155 ?auto_83156 ) ) ( not ( = ?auto_83155 ?auto_83157 ) ) ( not ( = ?auto_83155 ?auto_83154 ) ) ( not ( = ?auto_83155 ?auto_83158 ) ) ( not ( = ?auto_83155 ?auto_83159 ) ) ( not ( = ?auto_83155 ?auto_83165 ) ) ( not ( = ?auto_83156 ?auto_83157 ) ) ( not ( = ?auto_83156 ?auto_83154 ) ) ( not ( = ?auto_83156 ?auto_83158 ) ) ( not ( = ?auto_83156 ?auto_83159 ) ) ( not ( = ?auto_83156 ?auto_83165 ) ) ( not ( = ?auto_83157 ?auto_83154 ) ) ( not ( = ?auto_83157 ?auto_83158 ) ) ( not ( = ?auto_83157 ?auto_83159 ) ) ( not ( = ?auto_83157 ?auto_83165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83154 ?auto_83158 ?auto_83159 )
      ( MAKE-5CRATE-VERIFY ?auto_83155 ?auto_83156 ?auto_83157 ?auto_83154 ?auto_83158 ?auto_83159 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83206 - SURFACE
      ?auto_83207 - SURFACE
      ?auto_83208 - SURFACE
      ?auto_83205 - SURFACE
      ?auto_83209 - SURFACE
      ?auto_83210 - SURFACE
    )
    :vars
    (
      ?auto_83213 - HOIST
      ?auto_83215 - PLACE
      ?auto_83211 - PLACE
      ?auto_83212 - HOIST
      ?auto_83214 - SURFACE
      ?auto_83216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83213 ?auto_83215 ) ( IS-CRATE ?auto_83210 ) ( not ( = ?auto_83209 ?auto_83210 ) ) ( not ( = ?auto_83205 ?auto_83209 ) ) ( not ( = ?auto_83205 ?auto_83210 ) ) ( not ( = ?auto_83211 ?auto_83215 ) ) ( HOIST-AT ?auto_83212 ?auto_83211 ) ( not ( = ?auto_83213 ?auto_83212 ) ) ( AVAILABLE ?auto_83212 ) ( SURFACE-AT ?auto_83210 ?auto_83211 ) ( ON ?auto_83210 ?auto_83214 ) ( CLEAR ?auto_83210 ) ( not ( = ?auto_83209 ?auto_83214 ) ) ( not ( = ?auto_83210 ?auto_83214 ) ) ( not ( = ?auto_83205 ?auto_83214 ) ) ( TRUCK-AT ?auto_83216 ?auto_83215 ) ( SURFACE-AT ?auto_83205 ?auto_83215 ) ( CLEAR ?auto_83205 ) ( IS-CRATE ?auto_83209 ) ( AVAILABLE ?auto_83213 ) ( IN ?auto_83209 ?auto_83216 ) ( ON ?auto_83207 ?auto_83206 ) ( ON ?auto_83208 ?auto_83207 ) ( ON ?auto_83205 ?auto_83208 ) ( not ( = ?auto_83206 ?auto_83207 ) ) ( not ( = ?auto_83206 ?auto_83208 ) ) ( not ( = ?auto_83206 ?auto_83205 ) ) ( not ( = ?auto_83206 ?auto_83209 ) ) ( not ( = ?auto_83206 ?auto_83210 ) ) ( not ( = ?auto_83206 ?auto_83214 ) ) ( not ( = ?auto_83207 ?auto_83208 ) ) ( not ( = ?auto_83207 ?auto_83205 ) ) ( not ( = ?auto_83207 ?auto_83209 ) ) ( not ( = ?auto_83207 ?auto_83210 ) ) ( not ( = ?auto_83207 ?auto_83214 ) ) ( not ( = ?auto_83208 ?auto_83205 ) ) ( not ( = ?auto_83208 ?auto_83209 ) ) ( not ( = ?auto_83208 ?auto_83210 ) ) ( not ( = ?auto_83208 ?auto_83214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83205 ?auto_83209 ?auto_83210 )
      ( MAKE-5CRATE-VERIFY ?auto_83206 ?auto_83207 ?auto_83208 ?auto_83205 ?auto_83209 ?auto_83210 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84415 - SURFACE
      ?auto_84416 - SURFACE
      ?auto_84417 - SURFACE
      ?auto_84414 - SURFACE
      ?auto_84418 - SURFACE
      ?auto_84420 - SURFACE
      ?auto_84419 - SURFACE
    )
    :vars
    (
      ?auto_84422 - HOIST
      ?auto_84421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84422 ?auto_84421 ) ( SURFACE-AT ?auto_84420 ?auto_84421 ) ( CLEAR ?auto_84420 ) ( LIFTING ?auto_84422 ?auto_84419 ) ( IS-CRATE ?auto_84419 ) ( not ( = ?auto_84420 ?auto_84419 ) ) ( ON ?auto_84416 ?auto_84415 ) ( ON ?auto_84417 ?auto_84416 ) ( ON ?auto_84414 ?auto_84417 ) ( ON ?auto_84418 ?auto_84414 ) ( ON ?auto_84420 ?auto_84418 ) ( not ( = ?auto_84415 ?auto_84416 ) ) ( not ( = ?auto_84415 ?auto_84417 ) ) ( not ( = ?auto_84415 ?auto_84414 ) ) ( not ( = ?auto_84415 ?auto_84418 ) ) ( not ( = ?auto_84415 ?auto_84420 ) ) ( not ( = ?auto_84415 ?auto_84419 ) ) ( not ( = ?auto_84416 ?auto_84417 ) ) ( not ( = ?auto_84416 ?auto_84414 ) ) ( not ( = ?auto_84416 ?auto_84418 ) ) ( not ( = ?auto_84416 ?auto_84420 ) ) ( not ( = ?auto_84416 ?auto_84419 ) ) ( not ( = ?auto_84417 ?auto_84414 ) ) ( not ( = ?auto_84417 ?auto_84418 ) ) ( not ( = ?auto_84417 ?auto_84420 ) ) ( not ( = ?auto_84417 ?auto_84419 ) ) ( not ( = ?auto_84414 ?auto_84418 ) ) ( not ( = ?auto_84414 ?auto_84420 ) ) ( not ( = ?auto_84414 ?auto_84419 ) ) ( not ( = ?auto_84418 ?auto_84420 ) ) ( not ( = ?auto_84418 ?auto_84419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_84420 ?auto_84419 )
      ( MAKE-6CRATE-VERIFY ?auto_84415 ?auto_84416 ?auto_84417 ?auto_84414 ?auto_84418 ?auto_84420 ?auto_84419 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84459 - SURFACE
      ?auto_84460 - SURFACE
      ?auto_84461 - SURFACE
      ?auto_84458 - SURFACE
      ?auto_84462 - SURFACE
      ?auto_84464 - SURFACE
      ?auto_84463 - SURFACE
    )
    :vars
    (
      ?auto_84467 - HOIST
      ?auto_84466 - PLACE
      ?auto_84465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84467 ?auto_84466 ) ( SURFACE-AT ?auto_84464 ?auto_84466 ) ( CLEAR ?auto_84464 ) ( IS-CRATE ?auto_84463 ) ( not ( = ?auto_84464 ?auto_84463 ) ) ( TRUCK-AT ?auto_84465 ?auto_84466 ) ( AVAILABLE ?auto_84467 ) ( IN ?auto_84463 ?auto_84465 ) ( ON ?auto_84464 ?auto_84462 ) ( not ( = ?auto_84462 ?auto_84464 ) ) ( not ( = ?auto_84462 ?auto_84463 ) ) ( ON ?auto_84460 ?auto_84459 ) ( ON ?auto_84461 ?auto_84460 ) ( ON ?auto_84458 ?auto_84461 ) ( ON ?auto_84462 ?auto_84458 ) ( not ( = ?auto_84459 ?auto_84460 ) ) ( not ( = ?auto_84459 ?auto_84461 ) ) ( not ( = ?auto_84459 ?auto_84458 ) ) ( not ( = ?auto_84459 ?auto_84462 ) ) ( not ( = ?auto_84459 ?auto_84464 ) ) ( not ( = ?auto_84459 ?auto_84463 ) ) ( not ( = ?auto_84460 ?auto_84461 ) ) ( not ( = ?auto_84460 ?auto_84458 ) ) ( not ( = ?auto_84460 ?auto_84462 ) ) ( not ( = ?auto_84460 ?auto_84464 ) ) ( not ( = ?auto_84460 ?auto_84463 ) ) ( not ( = ?auto_84461 ?auto_84458 ) ) ( not ( = ?auto_84461 ?auto_84462 ) ) ( not ( = ?auto_84461 ?auto_84464 ) ) ( not ( = ?auto_84461 ?auto_84463 ) ) ( not ( = ?auto_84458 ?auto_84462 ) ) ( not ( = ?auto_84458 ?auto_84464 ) ) ( not ( = ?auto_84458 ?auto_84463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84462 ?auto_84464 ?auto_84463 )
      ( MAKE-6CRATE-VERIFY ?auto_84459 ?auto_84460 ?auto_84461 ?auto_84458 ?auto_84462 ?auto_84464 ?auto_84463 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84510 - SURFACE
      ?auto_84511 - SURFACE
      ?auto_84512 - SURFACE
      ?auto_84509 - SURFACE
      ?auto_84513 - SURFACE
      ?auto_84515 - SURFACE
      ?auto_84514 - SURFACE
    )
    :vars
    (
      ?auto_84519 - HOIST
      ?auto_84516 - PLACE
      ?auto_84518 - TRUCK
      ?auto_84517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84519 ?auto_84516 ) ( SURFACE-AT ?auto_84515 ?auto_84516 ) ( CLEAR ?auto_84515 ) ( IS-CRATE ?auto_84514 ) ( not ( = ?auto_84515 ?auto_84514 ) ) ( AVAILABLE ?auto_84519 ) ( IN ?auto_84514 ?auto_84518 ) ( ON ?auto_84515 ?auto_84513 ) ( not ( = ?auto_84513 ?auto_84515 ) ) ( not ( = ?auto_84513 ?auto_84514 ) ) ( TRUCK-AT ?auto_84518 ?auto_84517 ) ( not ( = ?auto_84517 ?auto_84516 ) ) ( ON ?auto_84511 ?auto_84510 ) ( ON ?auto_84512 ?auto_84511 ) ( ON ?auto_84509 ?auto_84512 ) ( ON ?auto_84513 ?auto_84509 ) ( not ( = ?auto_84510 ?auto_84511 ) ) ( not ( = ?auto_84510 ?auto_84512 ) ) ( not ( = ?auto_84510 ?auto_84509 ) ) ( not ( = ?auto_84510 ?auto_84513 ) ) ( not ( = ?auto_84510 ?auto_84515 ) ) ( not ( = ?auto_84510 ?auto_84514 ) ) ( not ( = ?auto_84511 ?auto_84512 ) ) ( not ( = ?auto_84511 ?auto_84509 ) ) ( not ( = ?auto_84511 ?auto_84513 ) ) ( not ( = ?auto_84511 ?auto_84515 ) ) ( not ( = ?auto_84511 ?auto_84514 ) ) ( not ( = ?auto_84512 ?auto_84509 ) ) ( not ( = ?auto_84512 ?auto_84513 ) ) ( not ( = ?auto_84512 ?auto_84515 ) ) ( not ( = ?auto_84512 ?auto_84514 ) ) ( not ( = ?auto_84509 ?auto_84513 ) ) ( not ( = ?auto_84509 ?auto_84515 ) ) ( not ( = ?auto_84509 ?auto_84514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84513 ?auto_84515 ?auto_84514 )
      ( MAKE-6CRATE-VERIFY ?auto_84510 ?auto_84511 ?auto_84512 ?auto_84509 ?auto_84513 ?auto_84515 ?auto_84514 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84567 - SURFACE
      ?auto_84568 - SURFACE
      ?auto_84569 - SURFACE
      ?auto_84566 - SURFACE
      ?auto_84570 - SURFACE
      ?auto_84572 - SURFACE
      ?auto_84571 - SURFACE
    )
    :vars
    (
      ?auto_84574 - HOIST
      ?auto_84576 - PLACE
      ?auto_84573 - TRUCK
      ?auto_84577 - PLACE
      ?auto_84575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_84574 ?auto_84576 ) ( SURFACE-AT ?auto_84572 ?auto_84576 ) ( CLEAR ?auto_84572 ) ( IS-CRATE ?auto_84571 ) ( not ( = ?auto_84572 ?auto_84571 ) ) ( AVAILABLE ?auto_84574 ) ( ON ?auto_84572 ?auto_84570 ) ( not ( = ?auto_84570 ?auto_84572 ) ) ( not ( = ?auto_84570 ?auto_84571 ) ) ( TRUCK-AT ?auto_84573 ?auto_84577 ) ( not ( = ?auto_84577 ?auto_84576 ) ) ( HOIST-AT ?auto_84575 ?auto_84577 ) ( LIFTING ?auto_84575 ?auto_84571 ) ( not ( = ?auto_84574 ?auto_84575 ) ) ( ON ?auto_84568 ?auto_84567 ) ( ON ?auto_84569 ?auto_84568 ) ( ON ?auto_84566 ?auto_84569 ) ( ON ?auto_84570 ?auto_84566 ) ( not ( = ?auto_84567 ?auto_84568 ) ) ( not ( = ?auto_84567 ?auto_84569 ) ) ( not ( = ?auto_84567 ?auto_84566 ) ) ( not ( = ?auto_84567 ?auto_84570 ) ) ( not ( = ?auto_84567 ?auto_84572 ) ) ( not ( = ?auto_84567 ?auto_84571 ) ) ( not ( = ?auto_84568 ?auto_84569 ) ) ( not ( = ?auto_84568 ?auto_84566 ) ) ( not ( = ?auto_84568 ?auto_84570 ) ) ( not ( = ?auto_84568 ?auto_84572 ) ) ( not ( = ?auto_84568 ?auto_84571 ) ) ( not ( = ?auto_84569 ?auto_84566 ) ) ( not ( = ?auto_84569 ?auto_84570 ) ) ( not ( = ?auto_84569 ?auto_84572 ) ) ( not ( = ?auto_84569 ?auto_84571 ) ) ( not ( = ?auto_84566 ?auto_84570 ) ) ( not ( = ?auto_84566 ?auto_84572 ) ) ( not ( = ?auto_84566 ?auto_84571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84570 ?auto_84572 ?auto_84571 )
      ( MAKE-6CRATE-VERIFY ?auto_84567 ?auto_84568 ?auto_84569 ?auto_84566 ?auto_84570 ?auto_84572 ?auto_84571 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84630 - SURFACE
      ?auto_84631 - SURFACE
      ?auto_84632 - SURFACE
      ?auto_84629 - SURFACE
      ?auto_84633 - SURFACE
      ?auto_84635 - SURFACE
      ?auto_84634 - SURFACE
    )
    :vars
    (
      ?auto_84636 - HOIST
      ?auto_84637 - PLACE
      ?auto_84641 - TRUCK
      ?auto_84640 - PLACE
      ?auto_84639 - HOIST
      ?auto_84638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84636 ?auto_84637 ) ( SURFACE-AT ?auto_84635 ?auto_84637 ) ( CLEAR ?auto_84635 ) ( IS-CRATE ?auto_84634 ) ( not ( = ?auto_84635 ?auto_84634 ) ) ( AVAILABLE ?auto_84636 ) ( ON ?auto_84635 ?auto_84633 ) ( not ( = ?auto_84633 ?auto_84635 ) ) ( not ( = ?auto_84633 ?auto_84634 ) ) ( TRUCK-AT ?auto_84641 ?auto_84640 ) ( not ( = ?auto_84640 ?auto_84637 ) ) ( HOIST-AT ?auto_84639 ?auto_84640 ) ( not ( = ?auto_84636 ?auto_84639 ) ) ( AVAILABLE ?auto_84639 ) ( SURFACE-AT ?auto_84634 ?auto_84640 ) ( ON ?auto_84634 ?auto_84638 ) ( CLEAR ?auto_84634 ) ( not ( = ?auto_84635 ?auto_84638 ) ) ( not ( = ?auto_84634 ?auto_84638 ) ) ( not ( = ?auto_84633 ?auto_84638 ) ) ( ON ?auto_84631 ?auto_84630 ) ( ON ?auto_84632 ?auto_84631 ) ( ON ?auto_84629 ?auto_84632 ) ( ON ?auto_84633 ?auto_84629 ) ( not ( = ?auto_84630 ?auto_84631 ) ) ( not ( = ?auto_84630 ?auto_84632 ) ) ( not ( = ?auto_84630 ?auto_84629 ) ) ( not ( = ?auto_84630 ?auto_84633 ) ) ( not ( = ?auto_84630 ?auto_84635 ) ) ( not ( = ?auto_84630 ?auto_84634 ) ) ( not ( = ?auto_84630 ?auto_84638 ) ) ( not ( = ?auto_84631 ?auto_84632 ) ) ( not ( = ?auto_84631 ?auto_84629 ) ) ( not ( = ?auto_84631 ?auto_84633 ) ) ( not ( = ?auto_84631 ?auto_84635 ) ) ( not ( = ?auto_84631 ?auto_84634 ) ) ( not ( = ?auto_84631 ?auto_84638 ) ) ( not ( = ?auto_84632 ?auto_84629 ) ) ( not ( = ?auto_84632 ?auto_84633 ) ) ( not ( = ?auto_84632 ?auto_84635 ) ) ( not ( = ?auto_84632 ?auto_84634 ) ) ( not ( = ?auto_84632 ?auto_84638 ) ) ( not ( = ?auto_84629 ?auto_84633 ) ) ( not ( = ?auto_84629 ?auto_84635 ) ) ( not ( = ?auto_84629 ?auto_84634 ) ) ( not ( = ?auto_84629 ?auto_84638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84633 ?auto_84635 ?auto_84634 )
      ( MAKE-6CRATE-VERIFY ?auto_84630 ?auto_84631 ?auto_84632 ?auto_84629 ?auto_84633 ?auto_84635 ?auto_84634 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84694 - SURFACE
      ?auto_84695 - SURFACE
      ?auto_84696 - SURFACE
      ?auto_84693 - SURFACE
      ?auto_84697 - SURFACE
      ?auto_84699 - SURFACE
      ?auto_84698 - SURFACE
    )
    :vars
    (
      ?auto_84702 - HOIST
      ?auto_84701 - PLACE
      ?auto_84703 - PLACE
      ?auto_84704 - HOIST
      ?auto_84700 - SURFACE
      ?auto_84705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84702 ?auto_84701 ) ( SURFACE-AT ?auto_84699 ?auto_84701 ) ( CLEAR ?auto_84699 ) ( IS-CRATE ?auto_84698 ) ( not ( = ?auto_84699 ?auto_84698 ) ) ( AVAILABLE ?auto_84702 ) ( ON ?auto_84699 ?auto_84697 ) ( not ( = ?auto_84697 ?auto_84699 ) ) ( not ( = ?auto_84697 ?auto_84698 ) ) ( not ( = ?auto_84703 ?auto_84701 ) ) ( HOIST-AT ?auto_84704 ?auto_84703 ) ( not ( = ?auto_84702 ?auto_84704 ) ) ( AVAILABLE ?auto_84704 ) ( SURFACE-AT ?auto_84698 ?auto_84703 ) ( ON ?auto_84698 ?auto_84700 ) ( CLEAR ?auto_84698 ) ( not ( = ?auto_84699 ?auto_84700 ) ) ( not ( = ?auto_84698 ?auto_84700 ) ) ( not ( = ?auto_84697 ?auto_84700 ) ) ( TRUCK-AT ?auto_84705 ?auto_84701 ) ( ON ?auto_84695 ?auto_84694 ) ( ON ?auto_84696 ?auto_84695 ) ( ON ?auto_84693 ?auto_84696 ) ( ON ?auto_84697 ?auto_84693 ) ( not ( = ?auto_84694 ?auto_84695 ) ) ( not ( = ?auto_84694 ?auto_84696 ) ) ( not ( = ?auto_84694 ?auto_84693 ) ) ( not ( = ?auto_84694 ?auto_84697 ) ) ( not ( = ?auto_84694 ?auto_84699 ) ) ( not ( = ?auto_84694 ?auto_84698 ) ) ( not ( = ?auto_84694 ?auto_84700 ) ) ( not ( = ?auto_84695 ?auto_84696 ) ) ( not ( = ?auto_84695 ?auto_84693 ) ) ( not ( = ?auto_84695 ?auto_84697 ) ) ( not ( = ?auto_84695 ?auto_84699 ) ) ( not ( = ?auto_84695 ?auto_84698 ) ) ( not ( = ?auto_84695 ?auto_84700 ) ) ( not ( = ?auto_84696 ?auto_84693 ) ) ( not ( = ?auto_84696 ?auto_84697 ) ) ( not ( = ?auto_84696 ?auto_84699 ) ) ( not ( = ?auto_84696 ?auto_84698 ) ) ( not ( = ?auto_84696 ?auto_84700 ) ) ( not ( = ?auto_84693 ?auto_84697 ) ) ( not ( = ?auto_84693 ?auto_84699 ) ) ( not ( = ?auto_84693 ?auto_84698 ) ) ( not ( = ?auto_84693 ?auto_84700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84697 ?auto_84699 ?auto_84698 )
      ( MAKE-6CRATE-VERIFY ?auto_84694 ?auto_84695 ?auto_84696 ?auto_84693 ?auto_84697 ?auto_84699 ?auto_84698 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84758 - SURFACE
      ?auto_84759 - SURFACE
      ?auto_84760 - SURFACE
      ?auto_84757 - SURFACE
      ?auto_84761 - SURFACE
      ?auto_84763 - SURFACE
      ?auto_84762 - SURFACE
    )
    :vars
    (
      ?auto_84769 - HOIST
      ?auto_84767 - PLACE
      ?auto_84768 - PLACE
      ?auto_84766 - HOIST
      ?auto_84765 - SURFACE
      ?auto_84764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84769 ?auto_84767 ) ( IS-CRATE ?auto_84762 ) ( not ( = ?auto_84763 ?auto_84762 ) ) ( not ( = ?auto_84761 ?auto_84763 ) ) ( not ( = ?auto_84761 ?auto_84762 ) ) ( not ( = ?auto_84768 ?auto_84767 ) ) ( HOIST-AT ?auto_84766 ?auto_84768 ) ( not ( = ?auto_84769 ?auto_84766 ) ) ( AVAILABLE ?auto_84766 ) ( SURFACE-AT ?auto_84762 ?auto_84768 ) ( ON ?auto_84762 ?auto_84765 ) ( CLEAR ?auto_84762 ) ( not ( = ?auto_84763 ?auto_84765 ) ) ( not ( = ?auto_84762 ?auto_84765 ) ) ( not ( = ?auto_84761 ?auto_84765 ) ) ( TRUCK-AT ?auto_84764 ?auto_84767 ) ( SURFACE-AT ?auto_84761 ?auto_84767 ) ( CLEAR ?auto_84761 ) ( LIFTING ?auto_84769 ?auto_84763 ) ( IS-CRATE ?auto_84763 ) ( ON ?auto_84759 ?auto_84758 ) ( ON ?auto_84760 ?auto_84759 ) ( ON ?auto_84757 ?auto_84760 ) ( ON ?auto_84761 ?auto_84757 ) ( not ( = ?auto_84758 ?auto_84759 ) ) ( not ( = ?auto_84758 ?auto_84760 ) ) ( not ( = ?auto_84758 ?auto_84757 ) ) ( not ( = ?auto_84758 ?auto_84761 ) ) ( not ( = ?auto_84758 ?auto_84763 ) ) ( not ( = ?auto_84758 ?auto_84762 ) ) ( not ( = ?auto_84758 ?auto_84765 ) ) ( not ( = ?auto_84759 ?auto_84760 ) ) ( not ( = ?auto_84759 ?auto_84757 ) ) ( not ( = ?auto_84759 ?auto_84761 ) ) ( not ( = ?auto_84759 ?auto_84763 ) ) ( not ( = ?auto_84759 ?auto_84762 ) ) ( not ( = ?auto_84759 ?auto_84765 ) ) ( not ( = ?auto_84760 ?auto_84757 ) ) ( not ( = ?auto_84760 ?auto_84761 ) ) ( not ( = ?auto_84760 ?auto_84763 ) ) ( not ( = ?auto_84760 ?auto_84762 ) ) ( not ( = ?auto_84760 ?auto_84765 ) ) ( not ( = ?auto_84757 ?auto_84761 ) ) ( not ( = ?auto_84757 ?auto_84763 ) ) ( not ( = ?auto_84757 ?auto_84762 ) ) ( not ( = ?auto_84757 ?auto_84765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84761 ?auto_84763 ?auto_84762 )
      ( MAKE-6CRATE-VERIFY ?auto_84758 ?auto_84759 ?auto_84760 ?auto_84757 ?auto_84761 ?auto_84763 ?auto_84762 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84822 - SURFACE
      ?auto_84823 - SURFACE
      ?auto_84824 - SURFACE
      ?auto_84821 - SURFACE
      ?auto_84825 - SURFACE
      ?auto_84827 - SURFACE
      ?auto_84826 - SURFACE
    )
    :vars
    (
      ?auto_84833 - HOIST
      ?auto_84830 - PLACE
      ?auto_84831 - PLACE
      ?auto_84832 - HOIST
      ?auto_84828 - SURFACE
      ?auto_84829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84833 ?auto_84830 ) ( IS-CRATE ?auto_84826 ) ( not ( = ?auto_84827 ?auto_84826 ) ) ( not ( = ?auto_84825 ?auto_84827 ) ) ( not ( = ?auto_84825 ?auto_84826 ) ) ( not ( = ?auto_84831 ?auto_84830 ) ) ( HOIST-AT ?auto_84832 ?auto_84831 ) ( not ( = ?auto_84833 ?auto_84832 ) ) ( AVAILABLE ?auto_84832 ) ( SURFACE-AT ?auto_84826 ?auto_84831 ) ( ON ?auto_84826 ?auto_84828 ) ( CLEAR ?auto_84826 ) ( not ( = ?auto_84827 ?auto_84828 ) ) ( not ( = ?auto_84826 ?auto_84828 ) ) ( not ( = ?auto_84825 ?auto_84828 ) ) ( TRUCK-AT ?auto_84829 ?auto_84830 ) ( SURFACE-AT ?auto_84825 ?auto_84830 ) ( CLEAR ?auto_84825 ) ( IS-CRATE ?auto_84827 ) ( AVAILABLE ?auto_84833 ) ( IN ?auto_84827 ?auto_84829 ) ( ON ?auto_84823 ?auto_84822 ) ( ON ?auto_84824 ?auto_84823 ) ( ON ?auto_84821 ?auto_84824 ) ( ON ?auto_84825 ?auto_84821 ) ( not ( = ?auto_84822 ?auto_84823 ) ) ( not ( = ?auto_84822 ?auto_84824 ) ) ( not ( = ?auto_84822 ?auto_84821 ) ) ( not ( = ?auto_84822 ?auto_84825 ) ) ( not ( = ?auto_84822 ?auto_84827 ) ) ( not ( = ?auto_84822 ?auto_84826 ) ) ( not ( = ?auto_84822 ?auto_84828 ) ) ( not ( = ?auto_84823 ?auto_84824 ) ) ( not ( = ?auto_84823 ?auto_84821 ) ) ( not ( = ?auto_84823 ?auto_84825 ) ) ( not ( = ?auto_84823 ?auto_84827 ) ) ( not ( = ?auto_84823 ?auto_84826 ) ) ( not ( = ?auto_84823 ?auto_84828 ) ) ( not ( = ?auto_84824 ?auto_84821 ) ) ( not ( = ?auto_84824 ?auto_84825 ) ) ( not ( = ?auto_84824 ?auto_84827 ) ) ( not ( = ?auto_84824 ?auto_84826 ) ) ( not ( = ?auto_84824 ?auto_84828 ) ) ( not ( = ?auto_84821 ?auto_84825 ) ) ( not ( = ?auto_84821 ?auto_84827 ) ) ( not ( = ?auto_84821 ?auto_84826 ) ) ( not ( = ?auto_84821 ?auto_84828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84825 ?auto_84827 ?auto_84826 )
      ( MAKE-6CRATE-VERIFY ?auto_84822 ?auto_84823 ?auto_84824 ?auto_84821 ?auto_84825 ?auto_84827 ?auto_84826 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86778 - SURFACE
      ?auto_86779 - SURFACE
      ?auto_86780 - SURFACE
      ?auto_86777 - SURFACE
      ?auto_86781 - SURFACE
      ?auto_86783 - SURFACE
      ?auto_86782 - SURFACE
      ?auto_86784 - SURFACE
    )
    :vars
    (
      ?auto_86786 - HOIST
      ?auto_86785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86786 ?auto_86785 ) ( SURFACE-AT ?auto_86782 ?auto_86785 ) ( CLEAR ?auto_86782 ) ( LIFTING ?auto_86786 ?auto_86784 ) ( IS-CRATE ?auto_86784 ) ( not ( = ?auto_86782 ?auto_86784 ) ) ( ON ?auto_86779 ?auto_86778 ) ( ON ?auto_86780 ?auto_86779 ) ( ON ?auto_86777 ?auto_86780 ) ( ON ?auto_86781 ?auto_86777 ) ( ON ?auto_86783 ?auto_86781 ) ( ON ?auto_86782 ?auto_86783 ) ( not ( = ?auto_86778 ?auto_86779 ) ) ( not ( = ?auto_86778 ?auto_86780 ) ) ( not ( = ?auto_86778 ?auto_86777 ) ) ( not ( = ?auto_86778 ?auto_86781 ) ) ( not ( = ?auto_86778 ?auto_86783 ) ) ( not ( = ?auto_86778 ?auto_86782 ) ) ( not ( = ?auto_86778 ?auto_86784 ) ) ( not ( = ?auto_86779 ?auto_86780 ) ) ( not ( = ?auto_86779 ?auto_86777 ) ) ( not ( = ?auto_86779 ?auto_86781 ) ) ( not ( = ?auto_86779 ?auto_86783 ) ) ( not ( = ?auto_86779 ?auto_86782 ) ) ( not ( = ?auto_86779 ?auto_86784 ) ) ( not ( = ?auto_86780 ?auto_86777 ) ) ( not ( = ?auto_86780 ?auto_86781 ) ) ( not ( = ?auto_86780 ?auto_86783 ) ) ( not ( = ?auto_86780 ?auto_86782 ) ) ( not ( = ?auto_86780 ?auto_86784 ) ) ( not ( = ?auto_86777 ?auto_86781 ) ) ( not ( = ?auto_86777 ?auto_86783 ) ) ( not ( = ?auto_86777 ?auto_86782 ) ) ( not ( = ?auto_86777 ?auto_86784 ) ) ( not ( = ?auto_86781 ?auto_86783 ) ) ( not ( = ?auto_86781 ?auto_86782 ) ) ( not ( = ?auto_86781 ?auto_86784 ) ) ( not ( = ?auto_86783 ?auto_86782 ) ) ( not ( = ?auto_86783 ?auto_86784 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_86782 ?auto_86784 )
      ( MAKE-7CRATE-VERIFY ?auto_86778 ?auto_86779 ?auto_86780 ?auto_86777 ?auto_86781 ?auto_86783 ?auto_86782 ?auto_86784 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86833 - SURFACE
      ?auto_86834 - SURFACE
      ?auto_86835 - SURFACE
      ?auto_86832 - SURFACE
      ?auto_86836 - SURFACE
      ?auto_86838 - SURFACE
      ?auto_86837 - SURFACE
      ?auto_86839 - SURFACE
    )
    :vars
    (
      ?auto_86841 - HOIST
      ?auto_86842 - PLACE
      ?auto_86840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_86841 ?auto_86842 ) ( SURFACE-AT ?auto_86837 ?auto_86842 ) ( CLEAR ?auto_86837 ) ( IS-CRATE ?auto_86839 ) ( not ( = ?auto_86837 ?auto_86839 ) ) ( TRUCK-AT ?auto_86840 ?auto_86842 ) ( AVAILABLE ?auto_86841 ) ( IN ?auto_86839 ?auto_86840 ) ( ON ?auto_86837 ?auto_86838 ) ( not ( = ?auto_86838 ?auto_86837 ) ) ( not ( = ?auto_86838 ?auto_86839 ) ) ( ON ?auto_86834 ?auto_86833 ) ( ON ?auto_86835 ?auto_86834 ) ( ON ?auto_86832 ?auto_86835 ) ( ON ?auto_86836 ?auto_86832 ) ( ON ?auto_86838 ?auto_86836 ) ( not ( = ?auto_86833 ?auto_86834 ) ) ( not ( = ?auto_86833 ?auto_86835 ) ) ( not ( = ?auto_86833 ?auto_86832 ) ) ( not ( = ?auto_86833 ?auto_86836 ) ) ( not ( = ?auto_86833 ?auto_86838 ) ) ( not ( = ?auto_86833 ?auto_86837 ) ) ( not ( = ?auto_86833 ?auto_86839 ) ) ( not ( = ?auto_86834 ?auto_86835 ) ) ( not ( = ?auto_86834 ?auto_86832 ) ) ( not ( = ?auto_86834 ?auto_86836 ) ) ( not ( = ?auto_86834 ?auto_86838 ) ) ( not ( = ?auto_86834 ?auto_86837 ) ) ( not ( = ?auto_86834 ?auto_86839 ) ) ( not ( = ?auto_86835 ?auto_86832 ) ) ( not ( = ?auto_86835 ?auto_86836 ) ) ( not ( = ?auto_86835 ?auto_86838 ) ) ( not ( = ?auto_86835 ?auto_86837 ) ) ( not ( = ?auto_86835 ?auto_86839 ) ) ( not ( = ?auto_86832 ?auto_86836 ) ) ( not ( = ?auto_86832 ?auto_86838 ) ) ( not ( = ?auto_86832 ?auto_86837 ) ) ( not ( = ?auto_86832 ?auto_86839 ) ) ( not ( = ?auto_86836 ?auto_86838 ) ) ( not ( = ?auto_86836 ?auto_86837 ) ) ( not ( = ?auto_86836 ?auto_86839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86838 ?auto_86837 ?auto_86839 )
      ( MAKE-7CRATE-VERIFY ?auto_86833 ?auto_86834 ?auto_86835 ?auto_86832 ?auto_86836 ?auto_86838 ?auto_86837 ?auto_86839 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86896 - SURFACE
      ?auto_86897 - SURFACE
      ?auto_86898 - SURFACE
      ?auto_86895 - SURFACE
      ?auto_86899 - SURFACE
      ?auto_86901 - SURFACE
      ?auto_86900 - SURFACE
      ?auto_86902 - SURFACE
    )
    :vars
    (
      ?auto_86906 - HOIST
      ?auto_86905 - PLACE
      ?auto_86904 - TRUCK
      ?auto_86903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86906 ?auto_86905 ) ( SURFACE-AT ?auto_86900 ?auto_86905 ) ( CLEAR ?auto_86900 ) ( IS-CRATE ?auto_86902 ) ( not ( = ?auto_86900 ?auto_86902 ) ) ( AVAILABLE ?auto_86906 ) ( IN ?auto_86902 ?auto_86904 ) ( ON ?auto_86900 ?auto_86901 ) ( not ( = ?auto_86901 ?auto_86900 ) ) ( not ( = ?auto_86901 ?auto_86902 ) ) ( TRUCK-AT ?auto_86904 ?auto_86903 ) ( not ( = ?auto_86903 ?auto_86905 ) ) ( ON ?auto_86897 ?auto_86896 ) ( ON ?auto_86898 ?auto_86897 ) ( ON ?auto_86895 ?auto_86898 ) ( ON ?auto_86899 ?auto_86895 ) ( ON ?auto_86901 ?auto_86899 ) ( not ( = ?auto_86896 ?auto_86897 ) ) ( not ( = ?auto_86896 ?auto_86898 ) ) ( not ( = ?auto_86896 ?auto_86895 ) ) ( not ( = ?auto_86896 ?auto_86899 ) ) ( not ( = ?auto_86896 ?auto_86901 ) ) ( not ( = ?auto_86896 ?auto_86900 ) ) ( not ( = ?auto_86896 ?auto_86902 ) ) ( not ( = ?auto_86897 ?auto_86898 ) ) ( not ( = ?auto_86897 ?auto_86895 ) ) ( not ( = ?auto_86897 ?auto_86899 ) ) ( not ( = ?auto_86897 ?auto_86901 ) ) ( not ( = ?auto_86897 ?auto_86900 ) ) ( not ( = ?auto_86897 ?auto_86902 ) ) ( not ( = ?auto_86898 ?auto_86895 ) ) ( not ( = ?auto_86898 ?auto_86899 ) ) ( not ( = ?auto_86898 ?auto_86901 ) ) ( not ( = ?auto_86898 ?auto_86900 ) ) ( not ( = ?auto_86898 ?auto_86902 ) ) ( not ( = ?auto_86895 ?auto_86899 ) ) ( not ( = ?auto_86895 ?auto_86901 ) ) ( not ( = ?auto_86895 ?auto_86900 ) ) ( not ( = ?auto_86895 ?auto_86902 ) ) ( not ( = ?auto_86899 ?auto_86901 ) ) ( not ( = ?auto_86899 ?auto_86900 ) ) ( not ( = ?auto_86899 ?auto_86902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86901 ?auto_86900 ?auto_86902 )
      ( MAKE-7CRATE-VERIFY ?auto_86896 ?auto_86897 ?auto_86898 ?auto_86895 ?auto_86899 ?auto_86901 ?auto_86900 ?auto_86902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86966 - SURFACE
      ?auto_86967 - SURFACE
      ?auto_86968 - SURFACE
      ?auto_86965 - SURFACE
      ?auto_86969 - SURFACE
      ?auto_86971 - SURFACE
      ?auto_86970 - SURFACE
      ?auto_86972 - SURFACE
    )
    :vars
    (
      ?auto_86974 - HOIST
      ?auto_86976 - PLACE
      ?auto_86977 - TRUCK
      ?auto_86973 - PLACE
      ?auto_86975 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_86974 ?auto_86976 ) ( SURFACE-AT ?auto_86970 ?auto_86976 ) ( CLEAR ?auto_86970 ) ( IS-CRATE ?auto_86972 ) ( not ( = ?auto_86970 ?auto_86972 ) ) ( AVAILABLE ?auto_86974 ) ( ON ?auto_86970 ?auto_86971 ) ( not ( = ?auto_86971 ?auto_86970 ) ) ( not ( = ?auto_86971 ?auto_86972 ) ) ( TRUCK-AT ?auto_86977 ?auto_86973 ) ( not ( = ?auto_86973 ?auto_86976 ) ) ( HOIST-AT ?auto_86975 ?auto_86973 ) ( LIFTING ?auto_86975 ?auto_86972 ) ( not ( = ?auto_86974 ?auto_86975 ) ) ( ON ?auto_86967 ?auto_86966 ) ( ON ?auto_86968 ?auto_86967 ) ( ON ?auto_86965 ?auto_86968 ) ( ON ?auto_86969 ?auto_86965 ) ( ON ?auto_86971 ?auto_86969 ) ( not ( = ?auto_86966 ?auto_86967 ) ) ( not ( = ?auto_86966 ?auto_86968 ) ) ( not ( = ?auto_86966 ?auto_86965 ) ) ( not ( = ?auto_86966 ?auto_86969 ) ) ( not ( = ?auto_86966 ?auto_86971 ) ) ( not ( = ?auto_86966 ?auto_86970 ) ) ( not ( = ?auto_86966 ?auto_86972 ) ) ( not ( = ?auto_86967 ?auto_86968 ) ) ( not ( = ?auto_86967 ?auto_86965 ) ) ( not ( = ?auto_86967 ?auto_86969 ) ) ( not ( = ?auto_86967 ?auto_86971 ) ) ( not ( = ?auto_86967 ?auto_86970 ) ) ( not ( = ?auto_86967 ?auto_86972 ) ) ( not ( = ?auto_86968 ?auto_86965 ) ) ( not ( = ?auto_86968 ?auto_86969 ) ) ( not ( = ?auto_86968 ?auto_86971 ) ) ( not ( = ?auto_86968 ?auto_86970 ) ) ( not ( = ?auto_86968 ?auto_86972 ) ) ( not ( = ?auto_86965 ?auto_86969 ) ) ( not ( = ?auto_86965 ?auto_86971 ) ) ( not ( = ?auto_86965 ?auto_86970 ) ) ( not ( = ?auto_86965 ?auto_86972 ) ) ( not ( = ?auto_86969 ?auto_86971 ) ) ( not ( = ?auto_86969 ?auto_86970 ) ) ( not ( = ?auto_86969 ?auto_86972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86971 ?auto_86970 ?auto_86972 )
      ( MAKE-7CRATE-VERIFY ?auto_86966 ?auto_86967 ?auto_86968 ?auto_86965 ?auto_86969 ?auto_86971 ?auto_86970 ?auto_86972 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87043 - SURFACE
      ?auto_87044 - SURFACE
      ?auto_87045 - SURFACE
      ?auto_87042 - SURFACE
      ?auto_87046 - SURFACE
      ?auto_87048 - SURFACE
      ?auto_87047 - SURFACE
      ?auto_87049 - SURFACE
    )
    :vars
    (
      ?auto_87050 - HOIST
      ?auto_87051 - PLACE
      ?auto_87054 - TRUCK
      ?auto_87055 - PLACE
      ?auto_87052 - HOIST
      ?auto_87053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_87050 ?auto_87051 ) ( SURFACE-AT ?auto_87047 ?auto_87051 ) ( CLEAR ?auto_87047 ) ( IS-CRATE ?auto_87049 ) ( not ( = ?auto_87047 ?auto_87049 ) ) ( AVAILABLE ?auto_87050 ) ( ON ?auto_87047 ?auto_87048 ) ( not ( = ?auto_87048 ?auto_87047 ) ) ( not ( = ?auto_87048 ?auto_87049 ) ) ( TRUCK-AT ?auto_87054 ?auto_87055 ) ( not ( = ?auto_87055 ?auto_87051 ) ) ( HOIST-AT ?auto_87052 ?auto_87055 ) ( not ( = ?auto_87050 ?auto_87052 ) ) ( AVAILABLE ?auto_87052 ) ( SURFACE-AT ?auto_87049 ?auto_87055 ) ( ON ?auto_87049 ?auto_87053 ) ( CLEAR ?auto_87049 ) ( not ( = ?auto_87047 ?auto_87053 ) ) ( not ( = ?auto_87049 ?auto_87053 ) ) ( not ( = ?auto_87048 ?auto_87053 ) ) ( ON ?auto_87044 ?auto_87043 ) ( ON ?auto_87045 ?auto_87044 ) ( ON ?auto_87042 ?auto_87045 ) ( ON ?auto_87046 ?auto_87042 ) ( ON ?auto_87048 ?auto_87046 ) ( not ( = ?auto_87043 ?auto_87044 ) ) ( not ( = ?auto_87043 ?auto_87045 ) ) ( not ( = ?auto_87043 ?auto_87042 ) ) ( not ( = ?auto_87043 ?auto_87046 ) ) ( not ( = ?auto_87043 ?auto_87048 ) ) ( not ( = ?auto_87043 ?auto_87047 ) ) ( not ( = ?auto_87043 ?auto_87049 ) ) ( not ( = ?auto_87043 ?auto_87053 ) ) ( not ( = ?auto_87044 ?auto_87045 ) ) ( not ( = ?auto_87044 ?auto_87042 ) ) ( not ( = ?auto_87044 ?auto_87046 ) ) ( not ( = ?auto_87044 ?auto_87048 ) ) ( not ( = ?auto_87044 ?auto_87047 ) ) ( not ( = ?auto_87044 ?auto_87049 ) ) ( not ( = ?auto_87044 ?auto_87053 ) ) ( not ( = ?auto_87045 ?auto_87042 ) ) ( not ( = ?auto_87045 ?auto_87046 ) ) ( not ( = ?auto_87045 ?auto_87048 ) ) ( not ( = ?auto_87045 ?auto_87047 ) ) ( not ( = ?auto_87045 ?auto_87049 ) ) ( not ( = ?auto_87045 ?auto_87053 ) ) ( not ( = ?auto_87042 ?auto_87046 ) ) ( not ( = ?auto_87042 ?auto_87048 ) ) ( not ( = ?auto_87042 ?auto_87047 ) ) ( not ( = ?auto_87042 ?auto_87049 ) ) ( not ( = ?auto_87042 ?auto_87053 ) ) ( not ( = ?auto_87046 ?auto_87048 ) ) ( not ( = ?auto_87046 ?auto_87047 ) ) ( not ( = ?auto_87046 ?auto_87049 ) ) ( not ( = ?auto_87046 ?auto_87053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87048 ?auto_87047 ?auto_87049 )
      ( MAKE-7CRATE-VERIFY ?auto_87043 ?auto_87044 ?auto_87045 ?auto_87042 ?auto_87046 ?auto_87048 ?auto_87047 ?auto_87049 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87121 - SURFACE
      ?auto_87122 - SURFACE
      ?auto_87123 - SURFACE
      ?auto_87120 - SURFACE
      ?auto_87124 - SURFACE
      ?auto_87126 - SURFACE
      ?auto_87125 - SURFACE
      ?auto_87127 - SURFACE
    )
    :vars
    (
      ?auto_87131 - HOIST
      ?auto_87133 - PLACE
      ?auto_87129 - PLACE
      ?auto_87128 - HOIST
      ?auto_87130 - SURFACE
      ?auto_87132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87131 ?auto_87133 ) ( SURFACE-AT ?auto_87125 ?auto_87133 ) ( CLEAR ?auto_87125 ) ( IS-CRATE ?auto_87127 ) ( not ( = ?auto_87125 ?auto_87127 ) ) ( AVAILABLE ?auto_87131 ) ( ON ?auto_87125 ?auto_87126 ) ( not ( = ?auto_87126 ?auto_87125 ) ) ( not ( = ?auto_87126 ?auto_87127 ) ) ( not ( = ?auto_87129 ?auto_87133 ) ) ( HOIST-AT ?auto_87128 ?auto_87129 ) ( not ( = ?auto_87131 ?auto_87128 ) ) ( AVAILABLE ?auto_87128 ) ( SURFACE-AT ?auto_87127 ?auto_87129 ) ( ON ?auto_87127 ?auto_87130 ) ( CLEAR ?auto_87127 ) ( not ( = ?auto_87125 ?auto_87130 ) ) ( not ( = ?auto_87127 ?auto_87130 ) ) ( not ( = ?auto_87126 ?auto_87130 ) ) ( TRUCK-AT ?auto_87132 ?auto_87133 ) ( ON ?auto_87122 ?auto_87121 ) ( ON ?auto_87123 ?auto_87122 ) ( ON ?auto_87120 ?auto_87123 ) ( ON ?auto_87124 ?auto_87120 ) ( ON ?auto_87126 ?auto_87124 ) ( not ( = ?auto_87121 ?auto_87122 ) ) ( not ( = ?auto_87121 ?auto_87123 ) ) ( not ( = ?auto_87121 ?auto_87120 ) ) ( not ( = ?auto_87121 ?auto_87124 ) ) ( not ( = ?auto_87121 ?auto_87126 ) ) ( not ( = ?auto_87121 ?auto_87125 ) ) ( not ( = ?auto_87121 ?auto_87127 ) ) ( not ( = ?auto_87121 ?auto_87130 ) ) ( not ( = ?auto_87122 ?auto_87123 ) ) ( not ( = ?auto_87122 ?auto_87120 ) ) ( not ( = ?auto_87122 ?auto_87124 ) ) ( not ( = ?auto_87122 ?auto_87126 ) ) ( not ( = ?auto_87122 ?auto_87125 ) ) ( not ( = ?auto_87122 ?auto_87127 ) ) ( not ( = ?auto_87122 ?auto_87130 ) ) ( not ( = ?auto_87123 ?auto_87120 ) ) ( not ( = ?auto_87123 ?auto_87124 ) ) ( not ( = ?auto_87123 ?auto_87126 ) ) ( not ( = ?auto_87123 ?auto_87125 ) ) ( not ( = ?auto_87123 ?auto_87127 ) ) ( not ( = ?auto_87123 ?auto_87130 ) ) ( not ( = ?auto_87120 ?auto_87124 ) ) ( not ( = ?auto_87120 ?auto_87126 ) ) ( not ( = ?auto_87120 ?auto_87125 ) ) ( not ( = ?auto_87120 ?auto_87127 ) ) ( not ( = ?auto_87120 ?auto_87130 ) ) ( not ( = ?auto_87124 ?auto_87126 ) ) ( not ( = ?auto_87124 ?auto_87125 ) ) ( not ( = ?auto_87124 ?auto_87127 ) ) ( not ( = ?auto_87124 ?auto_87130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87126 ?auto_87125 ?auto_87127 )
      ( MAKE-7CRATE-VERIFY ?auto_87121 ?auto_87122 ?auto_87123 ?auto_87120 ?auto_87124 ?auto_87126 ?auto_87125 ?auto_87127 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87199 - SURFACE
      ?auto_87200 - SURFACE
      ?auto_87201 - SURFACE
      ?auto_87198 - SURFACE
      ?auto_87202 - SURFACE
      ?auto_87204 - SURFACE
      ?auto_87203 - SURFACE
      ?auto_87205 - SURFACE
    )
    :vars
    (
      ?auto_87209 - HOIST
      ?auto_87210 - PLACE
      ?auto_87208 - PLACE
      ?auto_87211 - HOIST
      ?auto_87207 - SURFACE
      ?auto_87206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87209 ?auto_87210 ) ( IS-CRATE ?auto_87205 ) ( not ( = ?auto_87203 ?auto_87205 ) ) ( not ( = ?auto_87204 ?auto_87203 ) ) ( not ( = ?auto_87204 ?auto_87205 ) ) ( not ( = ?auto_87208 ?auto_87210 ) ) ( HOIST-AT ?auto_87211 ?auto_87208 ) ( not ( = ?auto_87209 ?auto_87211 ) ) ( AVAILABLE ?auto_87211 ) ( SURFACE-AT ?auto_87205 ?auto_87208 ) ( ON ?auto_87205 ?auto_87207 ) ( CLEAR ?auto_87205 ) ( not ( = ?auto_87203 ?auto_87207 ) ) ( not ( = ?auto_87205 ?auto_87207 ) ) ( not ( = ?auto_87204 ?auto_87207 ) ) ( TRUCK-AT ?auto_87206 ?auto_87210 ) ( SURFACE-AT ?auto_87204 ?auto_87210 ) ( CLEAR ?auto_87204 ) ( LIFTING ?auto_87209 ?auto_87203 ) ( IS-CRATE ?auto_87203 ) ( ON ?auto_87200 ?auto_87199 ) ( ON ?auto_87201 ?auto_87200 ) ( ON ?auto_87198 ?auto_87201 ) ( ON ?auto_87202 ?auto_87198 ) ( ON ?auto_87204 ?auto_87202 ) ( not ( = ?auto_87199 ?auto_87200 ) ) ( not ( = ?auto_87199 ?auto_87201 ) ) ( not ( = ?auto_87199 ?auto_87198 ) ) ( not ( = ?auto_87199 ?auto_87202 ) ) ( not ( = ?auto_87199 ?auto_87204 ) ) ( not ( = ?auto_87199 ?auto_87203 ) ) ( not ( = ?auto_87199 ?auto_87205 ) ) ( not ( = ?auto_87199 ?auto_87207 ) ) ( not ( = ?auto_87200 ?auto_87201 ) ) ( not ( = ?auto_87200 ?auto_87198 ) ) ( not ( = ?auto_87200 ?auto_87202 ) ) ( not ( = ?auto_87200 ?auto_87204 ) ) ( not ( = ?auto_87200 ?auto_87203 ) ) ( not ( = ?auto_87200 ?auto_87205 ) ) ( not ( = ?auto_87200 ?auto_87207 ) ) ( not ( = ?auto_87201 ?auto_87198 ) ) ( not ( = ?auto_87201 ?auto_87202 ) ) ( not ( = ?auto_87201 ?auto_87204 ) ) ( not ( = ?auto_87201 ?auto_87203 ) ) ( not ( = ?auto_87201 ?auto_87205 ) ) ( not ( = ?auto_87201 ?auto_87207 ) ) ( not ( = ?auto_87198 ?auto_87202 ) ) ( not ( = ?auto_87198 ?auto_87204 ) ) ( not ( = ?auto_87198 ?auto_87203 ) ) ( not ( = ?auto_87198 ?auto_87205 ) ) ( not ( = ?auto_87198 ?auto_87207 ) ) ( not ( = ?auto_87202 ?auto_87204 ) ) ( not ( = ?auto_87202 ?auto_87203 ) ) ( not ( = ?auto_87202 ?auto_87205 ) ) ( not ( = ?auto_87202 ?auto_87207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87204 ?auto_87203 ?auto_87205 )
      ( MAKE-7CRATE-VERIFY ?auto_87199 ?auto_87200 ?auto_87201 ?auto_87198 ?auto_87202 ?auto_87204 ?auto_87203 ?auto_87205 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87277 - SURFACE
      ?auto_87278 - SURFACE
      ?auto_87279 - SURFACE
      ?auto_87276 - SURFACE
      ?auto_87280 - SURFACE
      ?auto_87282 - SURFACE
      ?auto_87281 - SURFACE
      ?auto_87283 - SURFACE
    )
    :vars
    (
      ?auto_87289 - HOIST
      ?auto_87286 - PLACE
      ?auto_87288 - PLACE
      ?auto_87285 - HOIST
      ?auto_87284 - SURFACE
      ?auto_87287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87289 ?auto_87286 ) ( IS-CRATE ?auto_87283 ) ( not ( = ?auto_87281 ?auto_87283 ) ) ( not ( = ?auto_87282 ?auto_87281 ) ) ( not ( = ?auto_87282 ?auto_87283 ) ) ( not ( = ?auto_87288 ?auto_87286 ) ) ( HOIST-AT ?auto_87285 ?auto_87288 ) ( not ( = ?auto_87289 ?auto_87285 ) ) ( AVAILABLE ?auto_87285 ) ( SURFACE-AT ?auto_87283 ?auto_87288 ) ( ON ?auto_87283 ?auto_87284 ) ( CLEAR ?auto_87283 ) ( not ( = ?auto_87281 ?auto_87284 ) ) ( not ( = ?auto_87283 ?auto_87284 ) ) ( not ( = ?auto_87282 ?auto_87284 ) ) ( TRUCK-AT ?auto_87287 ?auto_87286 ) ( SURFACE-AT ?auto_87282 ?auto_87286 ) ( CLEAR ?auto_87282 ) ( IS-CRATE ?auto_87281 ) ( AVAILABLE ?auto_87289 ) ( IN ?auto_87281 ?auto_87287 ) ( ON ?auto_87278 ?auto_87277 ) ( ON ?auto_87279 ?auto_87278 ) ( ON ?auto_87276 ?auto_87279 ) ( ON ?auto_87280 ?auto_87276 ) ( ON ?auto_87282 ?auto_87280 ) ( not ( = ?auto_87277 ?auto_87278 ) ) ( not ( = ?auto_87277 ?auto_87279 ) ) ( not ( = ?auto_87277 ?auto_87276 ) ) ( not ( = ?auto_87277 ?auto_87280 ) ) ( not ( = ?auto_87277 ?auto_87282 ) ) ( not ( = ?auto_87277 ?auto_87281 ) ) ( not ( = ?auto_87277 ?auto_87283 ) ) ( not ( = ?auto_87277 ?auto_87284 ) ) ( not ( = ?auto_87278 ?auto_87279 ) ) ( not ( = ?auto_87278 ?auto_87276 ) ) ( not ( = ?auto_87278 ?auto_87280 ) ) ( not ( = ?auto_87278 ?auto_87282 ) ) ( not ( = ?auto_87278 ?auto_87281 ) ) ( not ( = ?auto_87278 ?auto_87283 ) ) ( not ( = ?auto_87278 ?auto_87284 ) ) ( not ( = ?auto_87279 ?auto_87276 ) ) ( not ( = ?auto_87279 ?auto_87280 ) ) ( not ( = ?auto_87279 ?auto_87282 ) ) ( not ( = ?auto_87279 ?auto_87281 ) ) ( not ( = ?auto_87279 ?auto_87283 ) ) ( not ( = ?auto_87279 ?auto_87284 ) ) ( not ( = ?auto_87276 ?auto_87280 ) ) ( not ( = ?auto_87276 ?auto_87282 ) ) ( not ( = ?auto_87276 ?auto_87281 ) ) ( not ( = ?auto_87276 ?auto_87283 ) ) ( not ( = ?auto_87276 ?auto_87284 ) ) ( not ( = ?auto_87280 ?auto_87282 ) ) ( not ( = ?auto_87280 ?auto_87281 ) ) ( not ( = ?auto_87280 ?auto_87283 ) ) ( not ( = ?auto_87280 ?auto_87284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87282 ?auto_87281 ?auto_87283 )
      ( MAKE-7CRATE-VERIFY ?auto_87277 ?auto_87278 ?auto_87279 ?auto_87276 ?auto_87280 ?auto_87282 ?auto_87281 ?auto_87283 ) )
  )

)

