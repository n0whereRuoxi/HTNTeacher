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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33267 - SURFACE
      ?auto_33268 - SURFACE
    )
    :vars
    (
      ?auto_33269 - HOIST
      ?auto_33270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33269 ?auto_33270 ) ( SURFACE-AT ?auto_33267 ?auto_33270 ) ( CLEAR ?auto_33267 ) ( LIFTING ?auto_33269 ?auto_33268 ) ( IS-CRATE ?auto_33268 ) ( not ( = ?auto_33267 ?auto_33268 ) ) )
    :subtasks
    ( ( !DROP ?auto_33269 ?auto_33268 ?auto_33267 ?auto_33270 )
      ( MAKE-1CRATE-VERIFY ?auto_33267 ?auto_33268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33271 - SURFACE
      ?auto_33272 - SURFACE
    )
    :vars
    (
      ?auto_33273 - HOIST
      ?auto_33274 - PLACE
      ?auto_33275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33273 ?auto_33274 ) ( SURFACE-AT ?auto_33271 ?auto_33274 ) ( CLEAR ?auto_33271 ) ( IS-CRATE ?auto_33272 ) ( not ( = ?auto_33271 ?auto_33272 ) ) ( TRUCK-AT ?auto_33275 ?auto_33274 ) ( AVAILABLE ?auto_33273 ) ( IN ?auto_33272 ?auto_33275 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33273 ?auto_33272 ?auto_33275 ?auto_33274 )
      ( MAKE-1CRATE ?auto_33271 ?auto_33272 )
      ( MAKE-1CRATE-VERIFY ?auto_33271 ?auto_33272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33276 - SURFACE
      ?auto_33277 - SURFACE
    )
    :vars
    (
      ?auto_33279 - HOIST
      ?auto_33278 - PLACE
      ?auto_33280 - TRUCK
      ?auto_33281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33279 ?auto_33278 ) ( SURFACE-AT ?auto_33276 ?auto_33278 ) ( CLEAR ?auto_33276 ) ( IS-CRATE ?auto_33277 ) ( not ( = ?auto_33276 ?auto_33277 ) ) ( AVAILABLE ?auto_33279 ) ( IN ?auto_33277 ?auto_33280 ) ( TRUCK-AT ?auto_33280 ?auto_33281 ) ( not ( = ?auto_33281 ?auto_33278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33280 ?auto_33281 ?auto_33278 )
      ( MAKE-1CRATE ?auto_33276 ?auto_33277 )
      ( MAKE-1CRATE-VERIFY ?auto_33276 ?auto_33277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33282 - SURFACE
      ?auto_33283 - SURFACE
    )
    :vars
    (
      ?auto_33285 - HOIST
      ?auto_33287 - PLACE
      ?auto_33284 - TRUCK
      ?auto_33286 - PLACE
      ?auto_33288 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33285 ?auto_33287 ) ( SURFACE-AT ?auto_33282 ?auto_33287 ) ( CLEAR ?auto_33282 ) ( IS-CRATE ?auto_33283 ) ( not ( = ?auto_33282 ?auto_33283 ) ) ( AVAILABLE ?auto_33285 ) ( TRUCK-AT ?auto_33284 ?auto_33286 ) ( not ( = ?auto_33286 ?auto_33287 ) ) ( HOIST-AT ?auto_33288 ?auto_33286 ) ( LIFTING ?auto_33288 ?auto_33283 ) ( not ( = ?auto_33285 ?auto_33288 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33288 ?auto_33283 ?auto_33284 ?auto_33286 )
      ( MAKE-1CRATE ?auto_33282 ?auto_33283 )
      ( MAKE-1CRATE-VERIFY ?auto_33282 ?auto_33283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33289 - SURFACE
      ?auto_33290 - SURFACE
    )
    :vars
    (
      ?auto_33291 - HOIST
      ?auto_33292 - PLACE
      ?auto_33293 - TRUCK
      ?auto_33294 - PLACE
      ?auto_33295 - HOIST
      ?auto_33296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33291 ?auto_33292 ) ( SURFACE-AT ?auto_33289 ?auto_33292 ) ( CLEAR ?auto_33289 ) ( IS-CRATE ?auto_33290 ) ( not ( = ?auto_33289 ?auto_33290 ) ) ( AVAILABLE ?auto_33291 ) ( TRUCK-AT ?auto_33293 ?auto_33294 ) ( not ( = ?auto_33294 ?auto_33292 ) ) ( HOIST-AT ?auto_33295 ?auto_33294 ) ( not ( = ?auto_33291 ?auto_33295 ) ) ( AVAILABLE ?auto_33295 ) ( SURFACE-AT ?auto_33290 ?auto_33294 ) ( ON ?auto_33290 ?auto_33296 ) ( CLEAR ?auto_33290 ) ( not ( = ?auto_33289 ?auto_33296 ) ) ( not ( = ?auto_33290 ?auto_33296 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33295 ?auto_33290 ?auto_33296 ?auto_33294 )
      ( MAKE-1CRATE ?auto_33289 ?auto_33290 )
      ( MAKE-1CRATE-VERIFY ?auto_33289 ?auto_33290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33297 - SURFACE
      ?auto_33298 - SURFACE
    )
    :vars
    (
      ?auto_33299 - HOIST
      ?auto_33300 - PLACE
      ?auto_33303 - PLACE
      ?auto_33302 - HOIST
      ?auto_33304 - SURFACE
      ?auto_33301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33299 ?auto_33300 ) ( SURFACE-AT ?auto_33297 ?auto_33300 ) ( CLEAR ?auto_33297 ) ( IS-CRATE ?auto_33298 ) ( not ( = ?auto_33297 ?auto_33298 ) ) ( AVAILABLE ?auto_33299 ) ( not ( = ?auto_33303 ?auto_33300 ) ) ( HOIST-AT ?auto_33302 ?auto_33303 ) ( not ( = ?auto_33299 ?auto_33302 ) ) ( AVAILABLE ?auto_33302 ) ( SURFACE-AT ?auto_33298 ?auto_33303 ) ( ON ?auto_33298 ?auto_33304 ) ( CLEAR ?auto_33298 ) ( not ( = ?auto_33297 ?auto_33304 ) ) ( not ( = ?auto_33298 ?auto_33304 ) ) ( TRUCK-AT ?auto_33301 ?auto_33300 ) )
    :subtasks
    ( ( !DRIVE ?auto_33301 ?auto_33300 ?auto_33303 )
      ( MAKE-1CRATE ?auto_33297 ?auto_33298 )
      ( MAKE-1CRATE-VERIFY ?auto_33297 ?auto_33298 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33314 - SURFACE
      ?auto_33315 - SURFACE
      ?auto_33316 - SURFACE
    )
    :vars
    (
      ?auto_33317 - HOIST
      ?auto_33318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33317 ?auto_33318 ) ( SURFACE-AT ?auto_33315 ?auto_33318 ) ( CLEAR ?auto_33315 ) ( LIFTING ?auto_33317 ?auto_33316 ) ( IS-CRATE ?auto_33316 ) ( not ( = ?auto_33315 ?auto_33316 ) ) ( ON ?auto_33315 ?auto_33314 ) ( not ( = ?auto_33314 ?auto_33315 ) ) ( not ( = ?auto_33314 ?auto_33316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33315 ?auto_33316 )
      ( MAKE-2CRATE-VERIFY ?auto_33314 ?auto_33315 ?auto_33316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33324 - SURFACE
      ?auto_33325 - SURFACE
      ?auto_33326 - SURFACE
    )
    :vars
    (
      ?auto_33328 - HOIST
      ?auto_33329 - PLACE
      ?auto_33327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33328 ?auto_33329 ) ( SURFACE-AT ?auto_33325 ?auto_33329 ) ( CLEAR ?auto_33325 ) ( IS-CRATE ?auto_33326 ) ( not ( = ?auto_33325 ?auto_33326 ) ) ( TRUCK-AT ?auto_33327 ?auto_33329 ) ( AVAILABLE ?auto_33328 ) ( IN ?auto_33326 ?auto_33327 ) ( ON ?auto_33325 ?auto_33324 ) ( not ( = ?auto_33324 ?auto_33325 ) ) ( not ( = ?auto_33324 ?auto_33326 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33325 ?auto_33326 )
      ( MAKE-2CRATE-VERIFY ?auto_33324 ?auto_33325 ?auto_33326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33330 - SURFACE
      ?auto_33331 - SURFACE
    )
    :vars
    (
      ?auto_33335 - HOIST
      ?auto_33333 - PLACE
      ?auto_33334 - TRUCK
      ?auto_33332 - SURFACE
      ?auto_33336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33335 ?auto_33333 ) ( SURFACE-AT ?auto_33330 ?auto_33333 ) ( CLEAR ?auto_33330 ) ( IS-CRATE ?auto_33331 ) ( not ( = ?auto_33330 ?auto_33331 ) ) ( AVAILABLE ?auto_33335 ) ( IN ?auto_33331 ?auto_33334 ) ( ON ?auto_33330 ?auto_33332 ) ( not ( = ?auto_33332 ?auto_33330 ) ) ( not ( = ?auto_33332 ?auto_33331 ) ) ( TRUCK-AT ?auto_33334 ?auto_33336 ) ( not ( = ?auto_33336 ?auto_33333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33334 ?auto_33336 ?auto_33333 )
      ( MAKE-2CRATE ?auto_33332 ?auto_33330 ?auto_33331 )
      ( MAKE-1CRATE-VERIFY ?auto_33330 ?auto_33331 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33337 - SURFACE
      ?auto_33338 - SURFACE
      ?auto_33339 - SURFACE
    )
    :vars
    (
      ?auto_33340 - HOIST
      ?auto_33342 - PLACE
      ?auto_33341 - TRUCK
      ?auto_33343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33340 ?auto_33342 ) ( SURFACE-AT ?auto_33338 ?auto_33342 ) ( CLEAR ?auto_33338 ) ( IS-CRATE ?auto_33339 ) ( not ( = ?auto_33338 ?auto_33339 ) ) ( AVAILABLE ?auto_33340 ) ( IN ?auto_33339 ?auto_33341 ) ( ON ?auto_33338 ?auto_33337 ) ( not ( = ?auto_33337 ?auto_33338 ) ) ( not ( = ?auto_33337 ?auto_33339 ) ) ( TRUCK-AT ?auto_33341 ?auto_33343 ) ( not ( = ?auto_33343 ?auto_33342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33338 ?auto_33339 )
      ( MAKE-2CRATE-VERIFY ?auto_33337 ?auto_33338 ?auto_33339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33344 - SURFACE
      ?auto_33345 - SURFACE
    )
    :vars
    (
      ?auto_33347 - HOIST
      ?auto_33349 - PLACE
      ?auto_33346 - SURFACE
      ?auto_33350 - TRUCK
      ?auto_33348 - PLACE
      ?auto_33351 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33347 ?auto_33349 ) ( SURFACE-AT ?auto_33344 ?auto_33349 ) ( CLEAR ?auto_33344 ) ( IS-CRATE ?auto_33345 ) ( not ( = ?auto_33344 ?auto_33345 ) ) ( AVAILABLE ?auto_33347 ) ( ON ?auto_33344 ?auto_33346 ) ( not ( = ?auto_33346 ?auto_33344 ) ) ( not ( = ?auto_33346 ?auto_33345 ) ) ( TRUCK-AT ?auto_33350 ?auto_33348 ) ( not ( = ?auto_33348 ?auto_33349 ) ) ( HOIST-AT ?auto_33351 ?auto_33348 ) ( LIFTING ?auto_33351 ?auto_33345 ) ( not ( = ?auto_33347 ?auto_33351 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33351 ?auto_33345 ?auto_33350 ?auto_33348 )
      ( MAKE-2CRATE ?auto_33346 ?auto_33344 ?auto_33345 )
      ( MAKE-1CRATE-VERIFY ?auto_33344 ?auto_33345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33352 - SURFACE
      ?auto_33353 - SURFACE
      ?auto_33354 - SURFACE
    )
    :vars
    (
      ?auto_33359 - HOIST
      ?auto_33358 - PLACE
      ?auto_33356 - TRUCK
      ?auto_33355 - PLACE
      ?auto_33357 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33359 ?auto_33358 ) ( SURFACE-AT ?auto_33353 ?auto_33358 ) ( CLEAR ?auto_33353 ) ( IS-CRATE ?auto_33354 ) ( not ( = ?auto_33353 ?auto_33354 ) ) ( AVAILABLE ?auto_33359 ) ( ON ?auto_33353 ?auto_33352 ) ( not ( = ?auto_33352 ?auto_33353 ) ) ( not ( = ?auto_33352 ?auto_33354 ) ) ( TRUCK-AT ?auto_33356 ?auto_33355 ) ( not ( = ?auto_33355 ?auto_33358 ) ) ( HOIST-AT ?auto_33357 ?auto_33355 ) ( LIFTING ?auto_33357 ?auto_33354 ) ( not ( = ?auto_33359 ?auto_33357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33353 ?auto_33354 )
      ( MAKE-2CRATE-VERIFY ?auto_33352 ?auto_33353 ?auto_33354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33360 - SURFACE
      ?auto_33361 - SURFACE
    )
    :vars
    (
      ?auto_33364 - HOIST
      ?auto_33363 - PLACE
      ?auto_33362 - SURFACE
      ?auto_33367 - TRUCK
      ?auto_33366 - PLACE
      ?auto_33365 - HOIST
      ?auto_33368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33364 ?auto_33363 ) ( SURFACE-AT ?auto_33360 ?auto_33363 ) ( CLEAR ?auto_33360 ) ( IS-CRATE ?auto_33361 ) ( not ( = ?auto_33360 ?auto_33361 ) ) ( AVAILABLE ?auto_33364 ) ( ON ?auto_33360 ?auto_33362 ) ( not ( = ?auto_33362 ?auto_33360 ) ) ( not ( = ?auto_33362 ?auto_33361 ) ) ( TRUCK-AT ?auto_33367 ?auto_33366 ) ( not ( = ?auto_33366 ?auto_33363 ) ) ( HOIST-AT ?auto_33365 ?auto_33366 ) ( not ( = ?auto_33364 ?auto_33365 ) ) ( AVAILABLE ?auto_33365 ) ( SURFACE-AT ?auto_33361 ?auto_33366 ) ( ON ?auto_33361 ?auto_33368 ) ( CLEAR ?auto_33361 ) ( not ( = ?auto_33360 ?auto_33368 ) ) ( not ( = ?auto_33361 ?auto_33368 ) ) ( not ( = ?auto_33362 ?auto_33368 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33365 ?auto_33361 ?auto_33368 ?auto_33366 )
      ( MAKE-2CRATE ?auto_33362 ?auto_33360 ?auto_33361 )
      ( MAKE-1CRATE-VERIFY ?auto_33360 ?auto_33361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33369 - SURFACE
      ?auto_33370 - SURFACE
      ?auto_33371 - SURFACE
    )
    :vars
    (
      ?auto_33376 - HOIST
      ?auto_33377 - PLACE
      ?auto_33375 - TRUCK
      ?auto_33374 - PLACE
      ?auto_33373 - HOIST
      ?auto_33372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33376 ?auto_33377 ) ( SURFACE-AT ?auto_33370 ?auto_33377 ) ( CLEAR ?auto_33370 ) ( IS-CRATE ?auto_33371 ) ( not ( = ?auto_33370 ?auto_33371 ) ) ( AVAILABLE ?auto_33376 ) ( ON ?auto_33370 ?auto_33369 ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33371 ) ) ( TRUCK-AT ?auto_33375 ?auto_33374 ) ( not ( = ?auto_33374 ?auto_33377 ) ) ( HOIST-AT ?auto_33373 ?auto_33374 ) ( not ( = ?auto_33376 ?auto_33373 ) ) ( AVAILABLE ?auto_33373 ) ( SURFACE-AT ?auto_33371 ?auto_33374 ) ( ON ?auto_33371 ?auto_33372 ) ( CLEAR ?auto_33371 ) ( not ( = ?auto_33370 ?auto_33372 ) ) ( not ( = ?auto_33371 ?auto_33372 ) ) ( not ( = ?auto_33369 ?auto_33372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33370 ?auto_33371 )
      ( MAKE-2CRATE-VERIFY ?auto_33369 ?auto_33370 ?auto_33371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33378 - SURFACE
      ?auto_33379 - SURFACE
    )
    :vars
    (
      ?auto_33381 - HOIST
      ?auto_33380 - PLACE
      ?auto_33384 - SURFACE
      ?auto_33382 - PLACE
      ?auto_33385 - HOIST
      ?auto_33386 - SURFACE
      ?auto_33383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33381 ?auto_33380 ) ( SURFACE-AT ?auto_33378 ?auto_33380 ) ( CLEAR ?auto_33378 ) ( IS-CRATE ?auto_33379 ) ( not ( = ?auto_33378 ?auto_33379 ) ) ( AVAILABLE ?auto_33381 ) ( ON ?auto_33378 ?auto_33384 ) ( not ( = ?auto_33384 ?auto_33378 ) ) ( not ( = ?auto_33384 ?auto_33379 ) ) ( not ( = ?auto_33382 ?auto_33380 ) ) ( HOIST-AT ?auto_33385 ?auto_33382 ) ( not ( = ?auto_33381 ?auto_33385 ) ) ( AVAILABLE ?auto_33385 ) ( SURFACE-AT ?auto_33379 ?auto_33382 ) ( ON ?auto_33379 ?auto_33386 ) ( CLEAR ?auto_33379 ) ( not ( = ?auto_33378 ?auto_33386 ) ) ( not ( = ?auto_33379 ?auto_33386 ) ) ( not ( = ?auto_33384 ?auto_33386 ) ) ( TRUCK-AT ?auto_33383 ?auto_33380 ) )
    :subtasks
    ( ( !DRIVE ?auto_33383 ?auto_33380 ?auto_33382 )
      ( MAKE-2CRATE ?auto_33384 ?auto_33378 ?auto_33379 )
      ( MAKE-1CRATE-VERIFY ?auto_33378 ?auto_33379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33387 - SURFACE
      ?auto_33388 - SURFACE
      ?auto_33389 - SURFACE
    )
    :vars
    (
      ?auto_33392 - HOIST
      ?auto_33391 - PLACE
      ?auto_33394 - PLACE
      ?auto_33393 - HOIST
      ?auto_33395 - SURFACE
      ?auto_33390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33392 ?auto_33391 ) ( SURFACE-AT ?auto_33388 ?auto_33391 ) ( CLEAR ?auto_33388 ) ( IS-CRATE ?auto_33389 ) ( not ( = ?auto_33388 ?auto_33389 ) ) ( AVAILABLE ?auto_33392 ) ( ON ?auto_33388 ?auto_33387 ) ( not ( = ?auto_33387 ?auto_33388 ) ) ( not ( = ?auto_33387 ?auto_33389 ) ) ( not ( = ?auto_33394 ?auto_33391 ) ) ( HOIST-AT ?auto_33393 ?auto_33394 ) ( not ( = ?auto_33392 ?auto_33393 ) ) ( AVAILABLE ?auto_33393 ) ( SURFACE-AT ?auto_33389 ?auto_33394 ) ( ON ?auto_33389 ?auto_33395 ) ( CLEAR ?auto_33389 ) ( not ( = ?auto_33388 ?auto_33395 ) ) ( not ( = ?auto_33389 ?auto_33395 ) ) ( not ( = ?auto_33387 ?auto_33395 ) ) ( TRUCK-AT ?auto_33390 ?auto_33391 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33388 ?auto_33389 )
      ( MAKE-2CRATE-VERIFY ?auto_33387 ?auto_33388 ?auto_33389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33396 - SURFACE
      ?auto_33397 - SURFACE
    )
    :vars
    (
      ?auto_33398 - HOIST
      ?auto_33403 - PLACE
      ?auto_33402 - SURFACE
      ?auto_33400 - PLACE
      ?auto_33399 - HOIST
      ?auto_33401 - SURFACE
      ?auto_33404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33398 ?auto_33403 ) ( IS-CRATE ?auto_33397 ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33402 ?auto_33396 ) ) ( not ( = ?auto_33402 ?auto_33397 ) ) ( not ( = ?auto_33400 ?auto_33403 ) ) ( HOIST-AT ?auto_33399 ?auto_33400 ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( AVAILABLE ?auto_33399 ) ( SURFACE-AT ?auto_33397 ?auto_33400 ) ( ON ?auto_33397 ?auto_33401 ) ( CLEAR ?auto_33397 ) ( not ( = ?auto_33396 ?auto_33401 ) ) ( not ( = ?auto_33397 ?auto_33401 ) ) ( not ( = ?auto_33402 ?auto_33401 ) ) ( TRUCK-AT ?auto_33404 ?auto_33403 ) ( SURFACE-AT ?auto_33402 ?auto_33403 ) ( CLEAR ?auto_33402 ) ( LIFTING ?auto_33398 ?auto_33396 ) ( IS-CRATE ?auto_33396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33402 ?auto_33396 )
      ( MAKE-2CRATE ?auto_33402 ?auto_33396 ?auto_33397 )
      ( MAKE-1CRATE-VERIFY ?auto_33396 ?auto_33397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33405 - SURFACE
      ?auto_33406 - SURFACE
      ?auto_33407 - SURFACE
    )
    :vars
    (
      ?auto_33410 - HOIST
      ?auto_33408 - PLACE
      ?auto_33413 - PLACE
      ?auto_33409 - HOIST
      ?auto_33411 - SURFACE
      ?auto_33412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33410 ?auto_33408 ) ( IS-CRATE ?auto_33407 ) ( not ( = ?auto_33406 ?auto_33407 ) ) ( not ( = ?auto_33405 ?auto_33406 ) ) ( not ( = ?auto_33405 ?auto_33407 ) ) ( not ( = ?auto_33413 ?auto_33408 ) ) ( HOIST-AT ?auto_33409 ?auto_33413 ) ( not ( = ?auto_33410 ?auto_33409 ) ) ( AVAILABLE ?auto_33409 ) ( SURFACE-AT ?auto_33407 ?auto_33413 ) ( ON ?auto_33407 ?auto_33411 ) ( CLEAR ?auto_33407 ) ( not ( = ?auto_33406 ?auto_33411 ) ) ( not ( = ?auto_33407 ?auto_33411 ) ) ( not ( = ?auto_33405 ?auto_33411 ) ) ( TRUCK-AT ?auto_33412 ?auto_33408 ) ( SURFACE-AT ?auto_33405 ?auto_33408 ) ( CLEAR ?auto_33405 ) ( LIFTING ?auto_33410 ?auto_33406 ) ( IS-CRATE ?auto_33406 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33406 ?auto_33407 )
      ( MAKE-2CRATE-VERIFY ?auto_33405 ?auto_33406 ?auto_33407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33414 - SURFACE
      ?auto_33415 - SURFACE
    )
    :vars
    (
      ?auto_33416 - HOIST
      ?auto_33419 - PLACE
      ?auto_33421 - SURFACE
      ?auto_33420 - PLACE
      ?auto_33422 - HOIST
      ?auto_33417 - SURFACE
      ?auto_33418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33416 ?auto_33419 ) ( IS-CRATE ?auto_33415 ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( not ( = ?auto_33421 ?auto_33414 ) ) ( not ( = ?auto_33421 ?auto_33415 ) ) ( not ( = ?auto_33420 ?auto_33419 ) ) ( HOIST-AT ?auto_33422 ?auto_33420 ) ( not ( = ?auto_33416 ?auto_33422 ) ) ( AVAILABLE ?auto_33422 ) ( SURFACE-AT ?auto_33415 ?auto_33420 ) ( ON ?auto_33415 ?auto_33417 ) ( CLEAR ?auto_33415 ) ( not ( = ?auto_33414 ?auto_33417 ) ) ( not ( = ?auto_33415 ?auto_33417 ) ) ( not ( = ?auto_33421 ?auto_33417 ) ) ( TRUCK-AT ?auto_33418 ?auto_33419 ) ( SURFACE-AT ?auto_33421 ?auto_33419 ) ( CLEAR ?auto_33421 ) ( IS-CRATE ?auto_33414 ) ( AVAILABLE ?auto_33416 ) ( IN ?auto_33414 ?auto_33418 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33416 ?auto_33414 ?auto_33418 ?auto_33419 )
      ( MAKE-2CRATE ?auto_33421 ?auto_33414 ?auto_33415 )
      ( MAKE-1CRATE-VERIFY ?auto_33414 ?auto_33415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33423 - SURFACE
      ?auto_33424 - SURFACE
      ?auto_33425 - SURFACE
    )
    :vars
    (
      ?auto_33430 - HOIST
      ?auto_33426 - PLACE
      ?auto_33428 - PLACE
      ?auto_33427 - HOIST
      ?auto_33431 - SURFACE
      ?auto_33429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33430 ?auto_33426 ) ( IS-CRATE ?auto_33425 ) ( not ( = ?auto_33424 ?auto_33425 ) ) ( not ( = ?auto_33423 ?auto_33424 ) ) ( not ( = ?auto_33423 ?auto_33425 ) ) ( not ( = ?auto_33428 ?auto_33426 ) ) ( HOIST-AT ?auto_33427 ?auto_33428 ) ( not ( = ?auto_33430 ?auto_33427 ) ) ( AVAILABLE ?auto_33427 ) ( SURFACE-AT ?auto_33425 ?auto_33428 ) ( ON ?auto_33425 ?auto_33431 ) ( CLEAR ?auto_33425 ) ( not ( = ?auto_33424 ?auto_33431 ) ) ( not ( = ?auto_33425 ?auto_33431 ) ) ( not ( = ?auto_33423 ?auto_33431 ) ) ( TRUCK-AT ?auto_33429 ?auto_33426 ) ( SURFACE-AT ?auto_33423 ?auto_33426 ) ( CLEAR ?auto_33423 ) ( IS-CRATE ?auto_33424 ) ( AVAILABLE ?auto_33430 ) ( IN ?auto_33424 ?auto_33429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33424 ?auto_33425 )
      ( MAKE-2CRATE-VERIFY ?auto_33423 ?auto_33424 ?auto_33425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33432 - SURFACE
      ?auto_33433 - SURFACE
    )
    :vars
    (
      ?auto_33439 - HOIST
      ?auto_33434 - PLACE
      ?auto_33436 - SURFACE
      ?auto_33435 - PLACE
      ?auto_33438 - HOIST
      ?auto_33437 - SURFACE
      ?auto_33440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33439 ?auto_33434 ) ( IS-CRATE ?auto_33433 ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33436 ?auto_33432 ) ) ( not ( = ?auto_33436 ?auto_33433 ) ) ( not ( = ?auto_33435 ?auto_33434 ) ) ( HOIST-AT ?auto_33438 ?auto_33435 ) ( not ( = ?auto_33439 ?auto_33438 ) ) ( AVAILABLE ?auto_33438 ) ( SURFACE-AT ?auto_33433 ?auto_33435 ) ( ON ?auto_33433 ?auto_33437 ) ( CLEAR ?auto_33433 ) ( not ( = ?auto_33432 ?auto_33437 ) ) ( not ( = ?auto_33433 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( SURFACE-AT ?auto_33436 ?auto_33434 ) ( CLEAR ?auto_33436 ) ( IS-CRATE ?auto_33432 ) ( AVAILABLE ?auto_33439 ) ( IN ?auto_33432 ?auto_33440 ) ( TRUCK-AT ?auto_33440 ?auto_33435 ) )
    :subtasks
    ( ( !DRIVE ?auto_33440 ?auto_33435 ?auto_33434 )
      ( MAKE-2CRATE ?auto_33436 ?auto_33432 ?auto_33433 )
      ( MAKE-1CRATE-VERIFY ?auto_33432 ?auto_33433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33441 - SURFACE
      ?auto_33442 - SURFACE
      ?auto_33443 - SURFACE
    )
    :vars
    (
      ?auto_33447 - HOIST
      ?auto_33444 - PLACE
      ?auto_33446 - PLACE
      ?auto_33448 - HOIST
      ?auto_33449 - SURFACE
      ?auto_33445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33447 ?auto_33444 ) ( IS-CRATE ?auto_33443 ) ( not ( = ?auto_33442 ?auto_33443 ) ) ( not ( = ?auto_33441 ?auto_33442 ) ) ( not ( = ?auto_33441 ?auto_33443 ) ) ( not ( = ?auto_33446 ?auto_33444 ) ) ( HOIST-AT ?auto_33448 ?auto_33446 ) ( not ( = ?auto_33447 ?auto_33448 ) ) ( AVAILABLE ?auto_33448 ) ( SURFACE-AT ?auto_33443 ?auto_33446 ) ( ON ?auto_33443 ?auto_33449 ) ( CLEAR ?auto_33443 ) ( not ( = ?auto_33442 ?auto_33449 ) ) ( not ( = ?auto_33443 ?auto_33449 ) ) ( not ( = ?auto_33441 ?auto_33449 ) ) ( SURFACE-AT ?auto_33441 ?auto_33444 ) ( CLEAR ?auto_33441 ) ( IS-CRATE ?auto_33442 ) ( AVAILABLE ?auto_33447 ) ( IN ?auto_33442 ?auto_33445 ) ( TRUCK-AT ?auto_33445 ?auto_33446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33442 ?auto_33443 )
      ( MAKE-2CRATE-VERIFY ?auto_33441 ?auto_33442 ?auto_33443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33450 - SURFACE
      ?auto_33451 - SURFACE
    )
    :vars
    (
      ?auto_33457 - HOIST
      ?auto_33454 - PLACE
      ?auto_33456 - SURFACE
      ?auto_33453 - PLACE
      ?auto_33452 - HOIST
      ?auto_33455 - SURFACE
      ?auto_33458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33457 ?auto_33454 ) ( IS-CRATE ?auto_33451 ) ( not ( = ?auto_33450 ?auto_33451 ) ) ( not ( = ?auto_33456 ?auto_33450 ) ) ( not ( = ?auto_33456 ?auto_33451 ) ) ( not ( = ?auto_33453 ?auto_33454 ) ) ( HOIST-AT ?auto_33452 ?auto_33453 ) ( not ( = ?auto_33457 ?auto_33452 ) ) ( SURFACE-AT ?auto_33451 ?auto_33453 ) ( ON ?auto_33451 ?auto_33455 ) ( CLEAR ?auto_33451 ) ( not ( = ?auto_33450 ?auto_33455 ) ) ( not ( = ?auto_33451 ?auto_33455 ) ) ( not ( = ?auto_33456 ?auto_33455 ) ) ( SURFACE-AT ?auto_33456 ?auto_33454 ) ( CLEAR ?auto_33456 ) ( IS-CRATE ?auto_33450 ) ( AVAILABLE ?auto_33457 ) ( TRUCK-AT ?auto_33458 ?auto_33453 ) ( LIFTING ?auto_33452 ?auto_33450 ) )
    :subtasks
    ( ( !LOAD ?auto_33452 ?auto_33450 ?auto_33458 ?auto_33453 )
      ( MAKE-2CRATE ?auto_33456 ?auto_33450 ?auto_33451 )
      ( MAKE-1CRATE-VERIFY ?auto_33450 ?auto_33451 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33459 - SURFACE
      ?auto_33460 - SURFACE
      ?auto_33461 - SURFACE
    )
    :vars
    (
      ?auto_33465 - HOIST
      ?auto_33464 - PLACE
      ?auto_33467 - PLACE
      ?auto_33466 - HOIST
      ?auto_33463 - SURFACE
      ?auto_33462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33465 ?auto_33464 ) ( IS-CRATE ?auto_33461 ) ( not ( = ?auto_33460 ?auto_33461 ) ) ( not ( = ?auto_33459 ?auto_33460 ) ) ( not ( = ?auto_33459 ?auto_33461 ) ) ( not ( = ?auto_33467 ?auto_33464 ) ) ( HOIST-AT ?auto_33466 ?auto_33467 ) ( not ( = ?auto_33465 ?auto_33466 ) ) ( SURFACE-AT ?auto_33461 ?auto_33467 ) ( ON ?auto_33461 ?auto_33463 ) ( CLEAR ?auto_33461 ) ( not ( = ?auto_33460 ?auto_33463 ) ) ( not ( = ?auto_33461 ?auto_33463 ) ) ( not ( = ?auto_33459 ?auto_33463 ) ) ( SURFACE-AT ?auto_33459 ?auto_33464 ) ( CLEAR ?auto_33459 ) ( IS-CRATE ?auto_33460 ) ( AVAILABLE ?auto_33465 ) ( TRUCK-AT ?auto_33462 ?auto_33467 ) ( LIFTING ?auto_33466 ?auto_33460 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33460 ?auto_33461 )
      ( MAKE-2CRATE-VERIFY ?auto_33459 ?auto_33460 ?auto_33461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33468 - SURFACE
      ?auto_33469 - SURFACE
    )
    :vars
    (
      ?auto_33471 - HOIST
      ?auto_33472 - PLACE
      ?auto_33474 - SURFACE
      ?auto_33473 - PLACE
      ?auto_33470 - HOIST
      ?auto_33475 - SURFACE
      ?auto_33476 - TRUCK
      ?auto_33477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33471 ?auto_33472 ) ( IS-CRATE ?auto_33469 ) ( not ( = ?auto_33468 ?auto_33469 ) ) ( not ( = ?auto_33474 ?auto_33468 ) ) ( not ( = ?auto_33474 ?auto_33469 ) ) ( not ( = ?auto_33473 ?auto_33472 ) ) ( HOIST-AT ?auto_33470 ?auto_33473 ) ( not ( = ?auto_33471 ?auto_33470 ) ) ( SURFACE-AT ?auto_33469 ?auto_33473 ) ( ON ?auto_33469 ?auto_33475 ) ( CLEAR ?auto_33469 ) ( not ( = ?auto_33468 ?auto_33475 ) ) ( not ( = ?auto_33469 ?auto_33475 ) ) ( not ( = ?auto_33474 ?auto_33475 ) ) ( SURFACE-AT ?auto_33474 ?auto_33472 ) ( CLEAR ?auto_33474 ) ( IS-CRATE ?auto_33468 ) ( AVAILABLE ?auto_33471 ) ( TRUCK-AT ?auto_33476 ?auto_33473 ) ( AVAILABLE ?auto_33470 ) ( SURFACE-AT ?auto_33468 ?auto_33473 ) ( ON ?auto_33468 ?auto_33477 ) ( CLEAR ?auto_33468 ) ( not ( = ?auto_33468 ?auto_33477 ) ) ( not ( = ?auto_33469 ?auto_33477 ) ) ( not ( = ?auto_33474 ?auto_33477 ) ) ( not ( = ?auto_33475 ?auto_33477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33470 ?auto_33468 ?auto_33477 ?auto_33473 )
      ( MAKE-2CRATE ?auto_33474 ?auto_33468 ?auto_33469 )
      ( MAKE-1CRATE-VERIFY ?auto_33468 ?auto_33469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33478 - SURFACE
      ?auto_33479 - SURFACE
      ?auto_33480 - SURFACE
    )
    :vars
    (
      ?auto_33484 - HOIST
      ?auto_33487 - PLACE
      ?auto_33482 - PLACE
      ?auto_33483 - HOIST
      ?auto_33486 - SURFACE
      ?auto_33485 - TRUCK
      ?auto_33481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33484 ?auto_33487 ) ( IS-CRATE ?auto_33480 ) ( not ( = ?auto_33479 ?auto_33480 ) ) ( not ( = ?auto_33478 ?auto_33479 ) ) ( not ( = ?auto_33478 ?auto_33480 ) ) ( not ( = ?auto_33482 ?auto_33487 ) ) ( HOIST-AT ?auto_33483 ?auto_33482 ) ( not ( = ?auto_33484 ?auto_33483 ) ) ( SURFACE-AT ?auto_33480 ?auto_33482 ) ( ON ?auto_33480 ?auto_33486 ) ( CLEAR ?auto_33480 ) ( not ( = ?auto_33479 ?auto_33486 ) ) ( not ( = ?auto_33480 ?auto_33486 ) ) ( not ( = ?auto_33478 ?auto_33486 ) ) ( SURFACE-AT ?auto_33478 ?auto_33487 ) ( CLEAR ?auto_33478 ) ( IS-CRATE ?auto_33479 ) ( AVAILABLE ?auto_33484 ) ( TRUCK-AT ?auto_33485 ?auto_33482 ) ( AVAILABLE ?auto_33483 ) ( SURFACE-AT ?auto_33479 ?auto_33482 ) ( ON ?auto_33479 ?auto_33481 ) ( CLEAR ?auto_33479 ) ( not ( = ?auto_33479 ?auto_33481 ) ) ( not ( = ?auto_33480 ?auto_33481 ) ) ( not ( = ?auto_33478 ?auto_33481 ) ) ( not ( = ?auto_33486 ?auto_33481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33479 ?auto_33480 )
      ( MAKE-2CRATE-VERIFY ?auto_33478 ?auto_33479 ?auto_33480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33488 - SURFACE
      ?auto_33489 - SURFACE
    )
    :vars
    (
      ?auto_33494 - HOIST
      ?auto_33497 - PLACE
      ?auto_33490 - SURFACE
      ?auto_33491 - PLACE
      ?auto_33493 - HOIST
      ?auto_33496 - SURFACE
      ?auto_33492 - SURFACE
      ?auto_33495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33494 ?auto_33497 ) ( IS-CRATE ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33489 ) ) ( not ( = ?auto_33490 ?auto_33488 ) ) ( not ( = ?auto_33490 ?auto_33489 ) ) ( not ( = ?auto_33491 ?auto_33497 ) ) ( HOIST-AT ?auto_33493 ?auto_33491 ) ( not ( = ?auto_33494 ?auto_33493 ) ) ( SURFACE-AT ?auto_33489 ?auto_33491 ) ( ON ?auto_33489 ?auto_33496 ) ( CLEAR ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33496 ) ) ( not ( = ?auto_33489 ?auto_33496 ) ) ( not ( = ?auto_33490 ?auto_33496 ) ) ( SURFACE-AT ?auto_33490 ?auto_33497 ) ( CLEAR ?auto_33490 ) ( IS-CRATE ?auto_33488 ) ( AVAILABLE ?auto_33494 ) ( AVAILABLE ?auto_33493 ) ( SURFACE-AT ?auto_33488 ?auto_33491 ) ( ON ?auto_33488 ?auto_33492 ) ( CLEAR ?auto_33488 ) ( not ( = ?auto_33488 ?auto_33492 ) ) ( not ( = ?auto_33489 ?auto_33492 ) ) ( not ( = ?auto_33490 ?auto_33492 ) ) ( not ( = ?auto_33496 ?auto_33492 ) ) ( TRUCK-AT ?auto_33495 ?auto_33497 ) )
    :subtasks
    ( ( !DRIVE ?auto_33495 ?auto_33497 ?auto_33491 )
      ( MAKE-2CRATE ?auto_33490 ?auto_33488 ?auto_33489 )
      ( MAKE-1CRATE-VERIFY ?auto_33488 ?auto_33489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33498 - SURFACE
      ?auto_33499 - SURFACE
      ?auto_33500 - SURFACE
    )
    :vars
    (
      ?auto_33504 - HOIST
      ?auto_33503 - PLACE
      ?auto_33501 - PLACE
      ?auto_33502 - HOIST
      ?auto_33505 - SURFACE
      ?auto_33507 - SURFACE
      ?auto_33506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33504 ?auto_33503 ) ( IS-CRATE ?auto_33500 ) ( not ( = ?auto_33499 ?auto_33500 ) ) ( not ( = ?auto_33498 ?auto_33499 ) ) ( not ( = ?auto_33498 ?auto_33500 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( HOIST-AT ?auto_33502 ?auto_33501 ) ( not ( = ?auto_33504 ?auto_33502 ) ) ( SURFACE-AT ?auto_33500 ?auto_33501 ) ( ON ?auto_33500 ?auto_33505 ) ( CLEAR ?auto_33500 ) ( not ( = ?auto_33499 ?auto_33505 ) ) ( not ( = ?auto_33500 ?auto_33505 ) ) ( not ( = ?auto_33498 ?auto_33505 ) ) ( SURFACE-AT ?auto_33498 ?auto_33503 ) ( CLEAR ?auto_33498 ) ( IS-CRATE ?auto_33499 ) ( AVAILABLE ?auto_33504 ) ( AVAILABLE ?auto_33502 ) ( SURFACE-AT ?auto_33499 ?auto_33501 ) ( ON ?auto_33499 ?auto_33507 ) ( CLEAR ?auto_33499 ) ( not ( = ?auto_33499 ?auto_33507 ) ) ( not ( = ?auto_33500 ?auto_33507 ) ) ( not ( = ?auto_33498 ?auto_33507 ) ) ( not ( = ?auto_33505 ?auto_33507 ) ) ( TRUCK-AT ?auto_33506 ?auto_33503 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33499 ?auto_33500 )
      ( MAKE-2CRATE-VERIFY ?auto_33498 ?auto_33499 ?auto_33500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33527 - SURFACE
      ?auto_33528 - SURFACE
      ?auto_33529 - SURFACE
      ?auto_33526 - SURFACE
    )
    :vars
    (
      ?auto_33531 - HOIST
      ?auto_33530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33531 ?auto_33530 ) ( SURFACE-AT ?auto_33529 ?auto_33530 ) ( CLEAR ?auto_33529 ) ( LIFTING ?auto_33531 ?auto_33526 ) ( IS-CRATE ?auto_33526 ) ( not ( = ?auto_33529 ?auto_33526 ) ) ( ON ?auto_33528 ?auto_33527 ) ( ON ?auto_33529 ?auto_33528 ) ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33527 ?auto_33529 ) ) ( not ( = ?auto_33527 ?auto_33526 ) ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( not ( = ?auto_33528 ?auto_33526 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33529 ?auto_33526 )
      ( MAKE-3CRATE-VERIFY ?auto_33527 ?auto_33528 ?auto_33529 ?auto_33526 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33544 - SURFACE
      ?auto_33545 - SURFACE
      ?auto_33546 - SURFACE
      ?auto_33543 - SURFACE
    )
    :vars
    (
      ?auto_33548 - HOIST
      ?auto_33549 - PLACE
      ?auto_33547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33548 ?auto_33549 ) ( SURFACE-AT ?auto_33546 ?auto_33549 ) ( CLEAR ?auto_33546 ) ( IS-CRATE ?auto_33543 ) ( not ( = ?auto_33546 ?auto_33543 ) ) ( TRUCK-AT ?auto_33547 ?auto_33549 ) ( AVAILABLE ?auto_33548 ) ( IN ?auto_33543 ?auto_33547 ) ( ON ?auto_33546 ?auto_33545 ) ( not ( = ?auto_33545 ?auto_33546 ) ) ( not ( = ?auto_33545 ?auto_33543 ) ) ( ON ?auto_33545 ?auto_33544 ) ( not ( = ?auto_33544 ?auto_33545 ) ) ( not ( = ?auto_33544 ?auto_33546 ) ) ( not ( = ?auto_33544 ?auto_33543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33545 ?auto_33546 ?auto_33543 )
      ( MAKE-3CRATE-VERIFY ?auto_33544 ?auto_33545 ?auto_33546 ?auto_33543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33565 - SURFACE
      ?auto_33566 - SURFACE
      ?auto_33567 - SURFACE
      ?auto_33564 - SURFACE
    )
    :vars
    (
      ?auto_33571 - HOIST
      ?auto_33569 - PLACE
      ?auto_33570 - TRUCK
      ?auto_33568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33571 ?auto_33569 ) ( SURFACE-AT ?auto_33567 ?auto_33569 ) ( CLEAR ?auto_33567 ) ( IS-CRATE ?auto_33564 ) ( not ( = ?auto_33567 ?auto_33564 ) ) ( AVAILABLE ?auto_33571 ) ( IN ?auto_33564 ?auto_33570 ) ( ON ?auto_33567 ?auto_33566 ) ( not ( = ?auto_33566 ?auto_33567 ) ) ( not ( = ?auto_33566 ?auto_33564 ) ) ( TRUCK-AT ?auto_33570 ?auto_33568 ) ( not ( = ?auto_33568 ?auto_33569 ) ) ( ON ?auto_33566 ?auto_33565 ) ( not ( = ?auto_33565 ?auto_33566 ) ) ( not ( = ?auto_33565 ?auto_33567 ) ) ( not ( = ?auto_33565 ?auto_33564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33566 ?auto_33567 ?auto_33564 )
      ( MAKE-3CRATE-VERIFY ?auto_33565 ?auto_33566 ?auto_33567 ?auto_33564 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33589 - SURFACE
      ?auto_33590 - SURFACE
      ?auto_33591 - SURFACE
      ?auto_33588 - SURFACE
    )
    :vars
    (
      ?auto_33594 - HOIST
      ?auto_33592 - PLACE
      ?auto_33593 - TRUCK
      ?auto_33596 - PLACE
      ?auto_33595 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33594 ?auto_33592 ) ( SURFACE-AT ?auto_33591 ?auto_33592 ) ( CLEAR ?auto_33591 ) ( IS-CRATE ?auto_33588 ) ( not ( = ?auto_33591 ?auto_33588 ) ) ( AVAILABLE ?auto_33594 ) ( ON ?auto_33591 ?auto_33590 ) ( not ( = ?auto_33590 ?auto_33591 ) ) ( not ( = ?auto_33590 ?auto_33588 ) ) ( TRUCK-AT ?auto_33593 ?auto_33596 ) ( not ( = ?auto_33596 ?auto_33592 ) ) ( HOIST-AT ?auto_33595 ?auto_33596 ) ( LIFTING ?auto_33595 ?auto_33588 ) ( not ( = ?auto_33594 ?auto_33595 ) ) ( ON ?auto_33590 ?auto_33589 ) ( not ( = ?auto_33589 ?auto_33590 ) ) ( not ( = ?auto_33589 ?auto_33591 ) ) ( not ( = ?auto_33589 ?auto_33588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33590 ?auto_33591 ?auto_33588 )
      ( MAKE-3CRATE-VERIFY ?auto_33589 ?auto_33590 ?auto_33591 ?auto_33588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33616 - SURFACE
      ?auto_33617 - SURFACE
      ?auto_33618 - SURFACE
      ?auto_33615 - SURFACE
    )
    :vars
    (
      ?auto_33621 - HOIST
      ?auto_33622 - PLACE
      ?auto_33620 - TRUCK
      ?auto_33619 - PLACE
      ?auto_33624 - HOIST
      ?auto_33623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33621 ?auto_33622 ) ( SURFACE-AT ?auto_33618 ?auto_33622 ) ( CLEAR ?auto_33618 ) ( IS-CRATE ?auto_33615 ) ( not ( = ?auto_33618 ?auto_33615 ) ) ( AVAILABLE ?auto_33621 ) ( ON ?auto_33618 ?auto_33617 ) ( not ( = ?auto_33617 ?auto_33618 ) ) ( not ( = ?auto_33617 ?auto_33615 ) ) ( TRUCK-AT ?auto_33620 ?auto_33619 ) ( not ( = ?auto_33619 ?auto_33622 ) ) ( HOIST-AT ?auto_33624 ?auto_33619 ) ( not ( = ?auto_33621 ?auto_33624 ) ) ( AVAILABLE ?auto_33624 ) ( SURFACE-AT ?auto_33615 ?auto_33619 ) ( ON ?auto_33615 ?auto_33623 ) ( CLEAR ?auto_33615 ) ( not ( = ?auto_33618 ?auto_33623 ) ) ( not ( = ?auto_33615 ?auto_33623 ) ) ( not ( = ?auto_33617 ?auto_33623 ) ) ( ON ?auto_33617 ?auto_33616 ) ( not ( = ?auto_33616 ?auto_33617 ) ) ( not ( = ?auto_33616 ?auto_33618 ) ) ( not ( = ?auto_33616 ?auto_33615 ) ) ( not ( = ?auto_33616 ?auto_33623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33617 ?auto_33618 ?auto_33615 )
      ( MAKE-3CRATE-VERIFY ?auto_33616 ?auto_33617 ?auto_33618 ?auto_33615 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33644 - SURFACE
      ?auto_33645 - SURFACE
      ?auto_33646 - SURFACE
      ?auto_33643 - SURFACE
    )
    :vars
    (
      ?auto_33652 - HOIST
      ?auto_33649 - PLACE
      ?auto_33647 - PLACE
      ?auto_33651 - HOIST
      ?auto_33650 - SURFACE
      ?auto_33648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33652 ?auto_33649 ) ( SURFACE-AT ?auto_33646 ?auto_33649 ) ( CLEAR ?auto_33646 ) ( IS-CRATE ?auto_33643 ) ( not ( = ?auto_33646 ?auto_33643 ) ) ( AVAILABLE ?auto_33652 ) ( ON ?auto_33646 ?auto_33645 ) ( not ( = ?auto_33645 ?auto_33646 ) ) ( not ( = ?auto_33645 ?auto_33643 ) ) ( not ( = ?auto_33647 ?auto_33649 ) ) ( HOIST-AT ?auto_33651 ?auto_33647 ) ( not ( = ?auto_33652 ?auto_33651 ) ) ( AVAILABLE ?auto_33651 ) ( SURFACE-AT ?auto_33643 ?auto_33647 ) ( ON ?auto_33643 ?auto_33650 ) ( CLEAR ?auto_33643 ) ( not ( = ?auto_33646 ?auto_33650 ) ) ( not ( = ?auto_33643 ?auto_33650 ) ) ( not ( = ?auto_33645 ?auto_33650 ) ) ( TRUCK-AT ?auto_33648 ?auto_33649 ) ( ON ?auto_33645 ?auto_33644 ) ( not ( = ?auto_33644 ?auto_33645 ) ) ( not ( = ?auto_33644 ?auto_33646 ) ) ( not ( = ?auto_33644 ?auto_33643 ) ) ( not ( = ?auto_33644 ?auto_33650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33645 ?auto_33646 ?auto_33643 )
      ( MAKE-3CRATE-VERIFY ?auto_33644 ?auto_33645 ?auto_33646 ?auto_33643 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33672 - SURFACE
      ?auto_33673 - SURFACE
      ?auto_33674 - SURFACE
      ?auto_33671 - SURFACE
    )
    :vars
    (
      ?auto_33677 - HOIST
      ?auto_33680 - PLACE
      ?auto_33679 - PLACE
      ?auto_33675 - HOIST
      ?auto_33676 - SURFACE
      ?auto_33678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33677 ?auto_33680 ) ( IS-CRATE ?auto_33671 ) ( not ( = ?auto_33674 ?auto_33671 ) ) ( not ( = ?auto_33673 ?auto_33674 ) ) ( not ( = ?auto_33673 ?auto_33671 ) ) ( not ( = ?auto_33679 ?auto_33680 ) ) ( HOIST-AT ?auto_33675 ?auto_33679 ) ( not ( = ?auto_33677 ?auto_33675 ) ) ( AVAILABLE ?auto_33675 ) ( SURFACE-AT ?auto_33671 ?auto_33679 ) ( ON ?auto_33671 ?auto_33676 ) ( CLEAR ?auto_33671 ) ( not ( = ?auto_33674 ?auto_33676 ) ) ( not ( = ?auto_33671 ?auto_33676 ) ) ( not ( = ?auto_33673 ?auto_33676 ) ) ( TRUCK-AT ?auto_33678 ?auto_33680 ) ( SURFACE-AT ?auto_33673 ?auto_33680 ) ( CLEAR ?auto_33673 ) ( LIFTING ?auto_33677 ?auto_33674 ) ( IS-CRATE ?auto_33674 ) ( ON ?auto_33673 ?auto_33672 ) ( not ( = ?auto_33672 ?auto_33673 ) ) ( not ( = ?auto_33672 ?auto_33674 ) ) ( not ( = ?auto_33672 ?auto_33671 ) ) ( not ( = ?auto_33672 ?auto_33676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33673 ?auto_33674 ?auto_33671 )
      ( MAKE-3CRATE-VERIFY ?auto_33672 ?auto_33673 ?auto_33674 ?auto_33671 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33700 - SURFACE
      ?auto_33701 - SURFACE
      ?auto_33702 - SURFACE
      ?auto_33699 - SURFACE
    )
    :vars
    (
      ?auto_33708 - HOIST
      ?auto_33704 - PLACE
      ?auto_33706 - PLACE
      ?auto_33703 - HOIST
      ?auto_33705 - SURFACE
      ?auto_33707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33708 ?auto_33704 ) ( IS-CRATE ?auto_33699 ) ( not ( = ?auto_33702 ?auto_33699 ) ) ( not ( = ?auto_33701 ?auto_33702 ) ) ( not ( = ?auto_33701 ?auto_33699 ) ) ( not ( = ?auto_33706 ?auto_33704 ) ) ( HOIST-AT ?auto_33703 ?auto_33706 ) ( not ( = ?auto_33708 ?auto_33703 ) ) ( AVAILABLE ?auto_33703 ) ( SURFACE-AT ?auto_33699 ?auto_33706 ) ( ON ?auto_33699 ?auto_33705 ) ( CLEAR ?auto_33699 ) ( not ( = ?auto_33702 ?auto_33705 ) ) ( not ( = ?auto_33699 ?auto_33705 ) ) ( not ( = ?auto_33701 ?auto_33705 ) ) ( TRUCK-AT ?auto_33707 ?auto_33704 ) ( SURFACE-AT ?auto_33701 ?auto_33704 ) ( CLEAR ?auto_33701 ) ( IS-CRATE ?auto_33702 ) ( AVAILABLE ?auto_33708 ) ( IN ?auto_33702 ?auto_33707 ) ( ON ?auto_33701 ?auto_33700 ) ( not ( = ?auto_33700 ?auto_33701 ) ) ( not ( = ?auto_33700 ?auto_33702 ) ) ( not ( = ?auto_33700 ?auto_33699 ) ) ( not ( = ?auto_33700 ?auto_33705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33701 ?auto_33702 ?auto_33699 )
      ( MAKE-3CRATE-VERIFY ?auto_33700 ?auto_33701 ?auto_33702 ?auto_33699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33778 - SURFACE
      ?auto_33779 - SURFACE
    )
    :vars
    (
      ?auto_33783 - HOIST
      ?auto_33780 - PLACE
      ?auto_33785 - SURFACE
      ?auto_33781 - PLACE
      ?auto_33784 - HOIST
      ?auto_33786 - SURFACE
      ?auto_33782 - TRUCK
      ?auto_33787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33783 ?auto_33780 ) ( SURFACE-AT ?auto_33778 ?auto_33780 ) ( CLEAR ?auto_33778 ) ( IS-CRATE ?auto_33779 ) ( not ( = ?auto_33778 ?auto_33779 ) ) ( AVAILABLE ?auto_33783 ) ( ON ?auto_33778 ?auto_33785 ) ( not ( = ?auto_33785 ?auto_33778 ) ) ( not ( = ?auto_33785 ?auto_33779 ) ) ( not ( = ?auto_33781 ?auto_33780 ) ) ( HOIST-AT ?auto_33784 ?auto_33781 ) ( not ( = ?auto_33783 ?auto_33784 ) ) ( AVAILABLE ?auto_33784 ) ( SURFACE-AT ?auto_33779 ?auto_33781 ) ( ON ?auto_33779 ?auto_33786 ) ( CLEAR ?auto_33779 ) ( not ( = ?auto_33778 ?auto_33786 ) ) ( not ( = ?auto_33779 ?auto_33786 ) ) ( not ( = ?auto_33785 ?auto_33786 ) ) ( TRUCK-AT ?auto_33782 ?auto_33787 ) ( not ( = ?auto_33787 ?auto_33780 ) ) ( not ( = ?auto_33781 ?auto_33787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33782 ?auto_33787 ?auto_33780 )
      ( MAKE-1CRATE ?auto_33778 ?auto_33779 )
      ( MAKE-1CRATE-VERIFY ?auto_33778 ?auto_33779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33884 - SURFACE
      ?auto_33885 - SURFACE
    )
    :vars
    (
      ?auto_33891 - HOIST
      ?auto_33889 - PLACE
      ?auto_33890 - SURFACE
      ?auto_33887 - PLACE
      ?auto_33888 - HOIST
      ?auto_33886 - SURFACE
      ?auto_33892 - TRUCK
      ?auto_33893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33891 ?auto_33889 ) ( SURFACE-AT ?auto_33884 ?auto_33889 ) ( CLEAR ?auto_33884 ) ( IS-CRATE ?auto_33885 ) ( not ( = ?auto_33884 ?auto_33885 ) ) ( ON ?auto_33884 ?auto_33890 ) ( not ( = ?auto_33890 ?auto_33884 ) ) ( not ( = ?auto_33890 ?auto_33885 ) ) ( not ( = ?auto_33887 ?auto_33889 ) ) ( HOIST-AT ?auto_33888 ?auto_33887 ) ( not ( = ?auto_33891 ?auto_33888 ) ) ( AVAILABLE ?auto_33888 ) ( SURFACE-AT ?auto_33885 ?auto_33887 ) ( ON ?auto_33885 ?auto_33886 ) ( CLEAR ?auto_33885 ) ( not ( = ?auto_33884 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33886 ) ) ( not ( = ?auto_33890 ?auto_33886 ) ) ( TRUCK-AT ?auto_33892 ?auto_33889 ) ( LIFTING ?auto_33891 ?auto_33893 ) ( IS-CRATE ?auto_33893 ) ( not ( = ?auto_33884 ?auto_33893 ) ) ( not ( = ?auto_33885 ?auto_33893 ) ) ( not ( = ?auto_33890 ?auto_33893 ) ) ( not ( = ?auto_33886 ?auto_33893 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33891 ?auto_33893 ?auto_33892 ?auto_33889 )
      ( MAKE-1CRATE ?auto_33884 ?auto_33885 )
      ( MAKE-1CRATE-VERIFY ?auto_33884 ?auto_33885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33993 - SURFACE
      ?auto_33994 - SURFACE
      ?auto_33995 - SURFACE
      ?auto_33992 - SURFACE
      ?auto_33996 - SURFACE
    )
    :vars
    (
      ?auto_33997 - HOIST
      ?auto_33998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33997 ?auto_33998 ) ( SURFACE-AT ?auto_33992 ?auto_33998 ) ( CLEAR ?auto_33992 ) ( LIFTING ?auto_33997 ?auto_33996 ) ( IS-CRATE ?auto_33996 ) ( not ( = ?auto_33992 ?auto_33996 ) ) ( ON ?auto_33994 ?auto_33993 ) ( ON ?auto_33995 ?auto_33994 ) ( ON ?auto_33992 ?auto_33995 ) ( not ( = ?auto_33993 ?auto_33994 ) ) ( not ( = ?auto_33993 ?auto_33995 ) ) ( not ( = ?auto_33993 ?auto_33992 ) ) ( not ( = ?auto_33993 ?auto_33996 ) ) ( not ( = ?auto_33994 ?auto_33995 ) ) ( not ( = ?auto_33994 ?auto_33992 ) ) ( not ( = ?auto_33994 ?auto_33996 ) ) ( not ( = ?auto_33995 ?auto_33992 ) ) ( not ( = ?auto_33995 ?auto_33996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33992 ?auto_33996 )
      ( MAKE-4CRATE-VERIFY ?auto_33993 ?auto_33994 ?auto_33995 ?auto_33992 ?auto_33996 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34018 - SURFACE
      ?auto_34019 - SURFACE
      ?auto_34020 - SURFACE
      ?auto_34017 - SURFACE
      ?auto_34021 - SURFACE
    )
    :vars
    (
      ?auto_34024 - HOIST
      ?auto_34023 - PLACE
      ?auto_34022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34024 ?auto_34023 ) ( SURFACE-AT ?auto_34017 ?auto_34023 ) ( CLEAR ?auto_34017 ) ( IS-CRATE ?auto_34021 ) ( not ( = ?auto_34017 ?auto_34021 ) ) ( TRUCK-AT ?auto_34022 ?auto_34023 ) ( AVAILABLE ?auto_34024 ) ( IN ?auto_34021 ?auto_34022 ) ( ON ?auto_34017 ?auto_34020 ) ( not ( = ?auto_34020 ?auto_34017 ) ) ( not ( = ?auto_34020 ?auto_34021 ) ) ( ON ?auto_34019 ?auto_34018 ) ( ON ?auto_34020 ?auto_34019 ) ( not ( = ?auto_34018 ?auto_34019 ) ) ( not ( = ?auto_34018 ?auto_34020 ) ) ( not ( = ?auto_34018 ?auto_34017 ) ) ( not ( = ?auto_34018 ?auto_34021 ) ) ( not ( = ?auto_34019 ?auto_34020 ) ) ( not ( = ?auto_34019 ?auto_34017 ) ) ( not ( = ?auto_34019 ?auto_34021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34020 ?auto_34017 ?auto_34021 )
      ( MAKE-4CRATE-VERIFY ?auto_34018 ?auto_34019 ?auto_34020 ?auto_34017 ?auto_34021 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34048 - SURFACE
      ?auto_34049 - SURFACE
      ?auto_34050 - SURFACE
      ?auto_34047 - SURFACE
      ?auto_34051 - SURFACE
    )
    :vars
    (
      ?auto_34055 - HOIST
      ?auto_34053 - PLACE
      ?auto_34052 - TRUCK
      ?auto_34054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34055 ?auto_34053 ) ( SURFACE-AT ?auto_34047 ?auto_34053 ) ( CLEAR ?auto_34047 ) ( IS-CRATE ?auto_34051 ) ( not ( = ?auto_34047 ?auto_34051 ) ) ( AVAILABLE ?auto_34055 ) ( IN ?auto_34051 ?auto_34052 ) ( ON ?auto_34047 ?auto_34050 ) ( not ( = ?auto_34050 ?auto_34047 ) ) ( not ( = ?auto_34050 ?auto_34051 ) ) ( TRUCK-AT ?auto_34052 ?auto_34054 ) ( not ( = ?auto_34054 ?auto_34053 ) ) ( ON ?auto_34049 ?auto_34048 ) ( ON ?auto_34050 ?auto_34049 ) ( not ( = ?auto_34048 ?auto_34049 ) ) ( not ( = ?auto_34048 ?auto_34050 ) ) ( not ( = ?auto_34048 ?auto_34047 ) ) ( not ( = ?auto_34048 ?auto_34051 ) ) ( not ( = ?auto_34049 ?auto_34050 ) ) ( not ( = ?auto_34049 ?auto_34047 ) ) ( not ( = ?auto_34049 ?auto_34051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34050 ?auto_34047 ?auto_34051 )
      ( MAKE-4CRATE-VERIFY ?auto_34048 ?auto_34049 ?auto_34050 ?auto_34047 ?auto_34051 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34082 - SURFACE
      ?auto_34083 - SURFACE
      ?auto_34084 - SURFACE
      ?auto_34081 - SURFACE
      ?auto_34085 - SURFACE
    )
    :vars
    (
      ?auto_34088 - HOIST
      ?auto_34086 - PLACE
      ?auto_34090 - TRUCK
      ?auto_34089 - PLACE
      ?auto_34087 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34088 ?auto_34086 ) ( SURFACE-AT ?auto_34081 ?auto_34086 ) ( CLEAR ?auto_34081 ) ( IS-CRATE ?auto_34085 ) ( not ( = ?auto_34081 ?auto_34085 ) ) ( AVAILABLE ?auto_34088 ) ( ON ?auto_34081 ?auto_34084 ) ( not ( = ?auto_34084 ?auto_34081 ) ) ( not ( = ?auto_34084 ?auto_34085 ) ) ( TRUCK-AT ?auto_34090 ?auto_34089 ) ( not ( = ?auto_34089 ?auto_34086 ) ) ( HOIST-AT ?auto_34087 ?auto_34089 ) ( LIFTING ?auto_34087 ?auto_34085 ) ( not ( = ?auto_34088 ?auto_34087 ) ) ( ON ?auto_34083 ?auto_34082 ) ( ON ?auto_34084 ?auto_34083 ) ( not ( = ?auto_34082 ?auto_34083 ) ) ( not ( = ?auto_34082 ?auto_34084 ) ) ( not ( = ?auto_34082 ?auto_34081 ) ) ( not ( = ?auto_34082 ?auto_34085 ) ) ( not ( = ?auto_34083 ?auto_34084 ) ) ( not ( = ?auto_34083 ?auto_34081 ) ) ( not ( = ?auto_34083 ?auto_34085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34084 ?auto_34081 ?auto_34085 )
      ( MAKE-4CRATE-VERIFY ?auto_34082 ?auto_34083 ?auto_34084 ?auto_34081 ?auto_34085 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34120 - SURFACE
      ?auto_34121 - SURFACE
      ?auto_34122 - SURFACE
      ?auto_34119 - SURFACE
      ?auto_34123 - SURFACE
    )
    :vars
    (
      ?auto_34126 - HOIST
      ?auto_34129 - PLACE
      ?auto_34125 - TRUCK
      ?auto_34127 - PLACE
      ?auto_34128 - HOIST
      ?auto_34124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34126 ?auto_34129 ) ( SURFACE-AT ?auto_34119 ?auto_34129 ) ( CLEAR ?auto_34119 ) ( IS-CRATE ?auto_34123 ) ( not ( = ?auto_34119 ?auto_34123 ) ) ( AVAILABLE ?auto_34126 ) ( ON ?auto_34119 ?auto_34122 ) ( not ( = ?auto_34122 ?auto_34119 ) ) ( not ( = ?auto_34122 ?auto_34123 ) ) ( TRUCK-AT ?auto_34125 ?auto_34127 ) ( not ( = ?auto_34127 ?auto_34129 ) ) ( HOIST-AT ?auto_34128 ?auto_34127 ) ( not ( = ?auto_34126 ?auto_34128 ) ) ( AVAILABLE ?auto_34128 ) ( SURFACE-AT ?auto_34123 ?auto_34127 ) ( ON ?auto_34123 ?auto_34124 ) ( CLEAR ?auto_34123 ) ( not ( = ?auto_34119 ?auto_34124 ) ) ( not ( = ?auto_34123 ?auto_34124 ) ) ( not ( = ?auto_34122 ?auto_34124 ) ) ( ON ?auto_34121 ?auto_34120 ) ( ON ?auto_34122 ?auto_34121 ) ( not ( = ?auto_34120 ?auto_34121 ) ) ( not ( = ?auto_34120 ?auto_34122 ) ) ( not ( = ?auto_34120 ?auto_34119 ) ) ( not ( = ?auto_34120 ?auto_34123 ) ) ( not ( = ?auto_34120 ?auto_34124 ) ) ( not ( = ?auto_34121 ?auto_34122 ) ) ( not ( = ?auto_34121 ?auto_34119 ) ) ( not ( = ?auto_34121 ?auto_34123 ) ) ( not ( = ?auto_34121 ?auto_34124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34122 ?auto_34119 ?auto_34123 )
      ( MAKE-4CRATE-VERIFY ?auto_34120 ?auto_34121 ?auto_34122 ?auto_34119 ?auto_34123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34159 - SURFACE
      ?auto_34160 - SURFACE
      ?auto_34161 - SURFACE
      ?auto_34158 - SURFACE
      ?auto_34162 - SURFACE
    )
    :vars
    (
      ?auto_34168 - HOIST
      ?auto_34165 - PLACE
      ?auto_34163 - PLACE
      ?auto_34166 - HOIST
      ?auto_34167 - SURFACE
      ?auto_34164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34168 ?auto_34165 ) ( SURFACE-AT ?auto_34158 ?auto_34165 ) ( CLEAR ?auto_34158 ) ( IS-CRATE ?auto_34162 ) ( not ( = ?auto_34158 ?auto_34162 ) ) ( AVAILABLE ?auto_34168 ) ( ON ?auto_34158 ?auto_34161 ) ( not ( = ?auto_34161 ?auto_34158 ) ) ( not ( = ?auto_34161 ?auto_34162 ) ) ( not ( = ?auto_34163 ?auto_34165 ) ) ( HOIST-AT ?auto_34166 ?auto_34163 ) ( not ( = ?auto_34168 ?auto_34166 ) ) ( AVAILABLE ?auto_34166 ) ( SURFACE-AT ?auto_34162 ?auto_34163 ) ( ON ?auto_34162 ?auto_34167 ) ( CLEAR ?auto_34162 ) ( not ( = ?auto_34158 ?auto_34167 ) ) ( not ( = ?auto_34162 ?auto_34167 ) ) ( not ( = ?auto_34161 ?auto_34167 ) ) ( TRUCK-AT ?auto_34164 ?auto_34165 ) ( ON ?auto_34160 ?auto_34159 ) ( ON ?auto_34161 ?auto_34160 ) ( not ( = ?auto_34159 ?auto_34160 ) ) ( not ( = ?auto_34159 ?auto_34161 ) ) ( not ( = ?auto_34159 ?auto_34158 ) ) ( not ( = ?auto_34159 ?auto_34162 ) ) ( not ( = ?auto_34159 ?auto_34167 ) ) ( not ( = ?auto_34160 ?auto_34161 ) ) ( not ( = ?auto_34160 ?auto_34158 ) ) ( not ( = ?auto_34160 ?auto_34162 ) ) ( not ( = ?auto_34160 ?auto_34167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34161 ?auto_34158 ?auto_34162 )
      ( MAKE-4CRATE-VERIFY ?auto_34159 ?auto_34160 ?auto_34161 ?auto_34158 ?auto_34162 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34198 - SURFACE
      ?auto_34199 - SURFACE
      ?auto_34200 - SURFACE
      ?auto_34197 - SURFACE
      ?auto_34201 - SURFACE
    )
    :vars
    (
      ?auto_34202 - HOIST
      ?auto_34203 - PLACE
      ?auto_34205 - PLACE
      ?auto_34206 - HOIST
      ?auto_34204 - SURFACE
      ?auto_34207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34202 ?auto_34203 ) ( IS-CRATE ?auto_34201 ) ( not ( = ?auto_34197 ?auto_34201 ) ) ( not ( = ?auto_34200 ?auto_34197 ) ) ( not ( = ?auto_34200 ?auto_34201 ) ) ( not ( = ?auto_34205 ?auto_34203 ) ) ( HOIST-AT ?auto_34206 ?auto_34205 ) ( not ( = ?auto_34202 ?auto_34206 ) ) ( AVAILABLE ?auto_34206 ) ( SURFACE-AT ?auto_34201 ?auto_34205 ) ( ON ?auto_34201 ?auto_34204 ) ( CLEAR ?auto_34201 ) ( not ( = ?auto_34197 ?auto_34204 ) ) ( not ( = ?auto_34201 ?auto_34204 ) ) ( not ( = ?auto_34200 ?auto_34204 ) ) ( TRUCK-AT ?auto_34207 ?auto_34203 ) ( SURFACE-AT ?auto_34200 ?auto_34203 ) ( CLEAR ?auto_34200 ) ( LIFTING ?auto_34202 ?auto_34197 ) ( IS-CRATE ?auto_34197 ) ( ON ?auto_34199 ?auto_34198 ) ( ON ?auto_34200 ?auto_34199 ) ( not ( = ?auto_34198 ?auto_34199 ) ) ( not ( = ?auto_34198 ?auto_34200 ) ) ( not ( = ?auto_34198 ?auto_34197 ) ) ( not ( = ?auto_34198 ?auto_34201 ) ) ( not ( = ?auto_34198 ?auto_34204 ) ) ( not ( = ?auto_34199 ?auto_34200 ) ) ( not ( = ?auto_34199 ?auto_34197 ) ) ( not ( = ?auto_34199 ?auto_34201 ) ) ( not ( = ?auto_34199 ?auto_34204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34200 ?auto_34197 ?auto_34201 )
      ( MAKE-4CRATE-VERIFY ?auto_34198 ?auto_34199 ?auto_34200 ?auto_34197 ?auto_34201 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34237 - SURFACE
      ?auto_34238 - SURFACE
      ?auto_34239 - SURFACE
      ?auto_34236 - SURFACE
      ?auto_34240 - SURFACE
    )
    :vars
    (
      ?auto_34244 - HOIST
      ?auto_34245 - PLACE
      ?auto_34243 - PLACE
      ?auto_34241 - HOIST
      ?auto_34246 - SURFACE
      ?auto_34242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34244 ?auto_34245 ) ( IS-CRATE ?auto_34240 ) ( not ( = ?auto_34236 ?auto_34240 ) ) ( not ( = ?auto_34239 ?auto_34236 ) ) ( not ( = ?auto_34239 ?auto_34240 ) ) ( not ( = ?auto_34243 ?auto_34245 ) ) ( HOIST-AT ?auto_34241 ?auto_34243 ) ( not ( = ?auto_34244 ?auto_34241 ) ) ( AVAILABLE ?auto_34241 ) ( SURFACE-AT ?auto_34240 ?auto_34243 ) ( ON ?auto_34240 ?auto_34246 ) ( CLEAR ?auto_34240 ) ( not ( = ?auto_34236 ?auto_34246 ) ) ( not ( = ?auto_34240 ?auto_34246 ) ) ( not ( = ?auto_34239 ?auto_34246 ) ) ( TRUCK-AT ?auto_34242 ?auto_34245 ) ( SURFACE-AT ?auto_34239 ?auto_34245 ) ( CLEAR ?auto_34239 ) ( IS-CRATE ?auto_34236 ) ( AVAILABLE ?auto_34244 ) ( IN ?auto_34236 ?auto_34242 ) ( ON ?auto_34238 ?auto_34237 ) ( ON ?auto_34239 ?auto_34238 ) ( not ( = ?auto_34237 ?auto_34238 ) ) ( not ( = ?auto_34237 ?auto_34239 ) ) ( not ( = ?auto_34237 ?auto_34236 ) ) ( not ( = ?auto_34237 ?auto_34240 ) ) ( not ( = ?auto_34237 ?auto_34246 ) ) ( not ( = ?auto_34238 ?auto_34239 ) ) ( not ( = ?auto_34238 ?auto_34236 ) ) ( not ( = ?auto_34238 ?auto_34240 ) ) ( not ( = ?auto_34238 ?auto_34246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34239 ?auto_34236 ?auto_34240 )
      ( MAKE-4CRATE-VERIFY ?auto_34237 ?auto_34238 ?auto_34239 ?auto_34236 ?auto_34240 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34897 - SURFACE
      ?auto_34898 - SURFACE
      ?auto_34899 - SURFACE
      ?auto_34896 - SURFACE
      ?auto_34900 - SURFACE
      ?auto_34901 - SURFACE
    )
    :vars
    (
      ?auto_34902 - HOIST
      ?auto_34903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34902 ?auto_34903 ) ( SURFACE-AT ?auto_34900 ?auto_34903 ) ( CLEAR ?auto_34900 ) ( LIFTING ?auto_34902 ?auto_34901 ) ( IS-CRATE ?auto_34901 ) ( not ( = ?auto_34900 ?auto_34901 ) ) ( ON ?auto_34898 ?auto_34897 ) ( ON ?auto_34899 ?auto_34898 ) ( ON ?auto_34896 ?auto_34899 ) ( ON ?auto_34900 ?auto_34896 ) ( not ( = ?auto_34897 ?auto_34898 ) ) ( not ( = ?auto_34897 ?auto_34899 ) ) ( not ( = ?auto_34897 ?auto_34896 ) ) ( not ( = ?auto_34897 ?auto_34900 ) ) ( not ( = ?auto_34897 ?auto_34901 ) ) ( not ( = ?auto_34898 ?auto_34899 ) ) ( not ( = ?auto_34898 ?auto_34896 ) ) ( not ( = ?auto_34898 ?auto_34900 ) ) ( not ( = ?auto_34898 ?auto_34901 ) ) ( not ( = ?auto_34899 ?auto_34896 ) ) ( not ( = ?auto_34899 ?auto_34900 ) ) ( not ( = ?auto_34899 ?auto_34901 ) ) ( not ( = ?auto_34896 ?auto_34900 ) ) ( not ( = ?auto_34896 ?auto_34901 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34900 ?auto_34901 )
      ( MAKE-5CRATE-VERIFY ?auto_34897 ?auto_34898 ?auto_34899 ?auto_34896 ?auto_34900 ?auto_34901 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34931 - SURFACE
      ?auto_34932 - SURFACE
      ?auto_34933 - SURFACE
      ?auto_34930 - SURFACE
      ?auto_34934 - SURFACE
      ?auto_34935 - SURFACE
    )
    :vars
    (
      ?auto_34938 - HOIST
      ?auto_34937 - PLACE
      ?auto_34936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34938 ?auto_34937 ) ( SURFACE-AT ?auto_34934 ?auto_34937 ) ( CLEAR ?auto_34934 ) ( IS-CRATE ?auto_34935 ) ( not ( = ?auto_34934 ?auto_34935 ) ) ( TRUCK-AT ?auto_34936 ?auto_34937 ) ( AVAILABLE ?auto_34938 ) ( IN ?auto_34935 ?auto_34936 ) ( ON ?auto_34934 ?auto_34930 ) ( not ( = ?auto_34930 ?auto_34934 ) ) ( not ( = ?auto_34930 ?auto_34935 ) ) ( ON ?auto_34932 ?auto_34931 ) ( ON ?auto_34933 ?auto_34932 ) ( ON ?auto_34930 ?auto_34933 ) ( not ( = ?auto_34931 ?auto_34932 ) ) ( not ( = ?auto_34931 ?auto_34933 ) ) ( not ( = ?auto_34931 ?auto_34930 ) ) ( not ( = ?auto_34931 ?auto_34934 ) ) ( not ( = ?auto_34931 ?auto_34935 ) ) ( not ( = ?auto_34932 ?auto_34933 ) ) ( not ( = ?auto_34932 ?auto_34930 ) ) ( not ( = ?auto_34932 ?auto_34934 ) ) ( not ( = ?auto_34932 ?auto_34935 ) ) ( not ( = ?auto_34933 ?auto_34930 ) ) ( not ( = ?auto_34933 ?auto_34934 ) ) ( not ( = ?auto_34933 ?auto_34935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34930 ?auto_34934 ?auto_34935 )
      ( MAKE-5CRATE-VERIFY ?auto_34931 ?auto_34932 ?auto_34933 ?auto_34930 ?auto_34934 ?auto_34935 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34971 - SURFACE
      ?auto_34972 - SURFACE
      ?auto_34973 - SURFACE
      ?auto_34970 - SURFACE
      ?auto_34974 - SURFACE
      ?auto_34975 - SURFACE
    )
    :vars
    (
      ?auto_34978 - HOIST
      ?auto_34977 - PLACE
      ?auto_34976 - TRUCK
      ?auto_34979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34978 ?auto_34977 ) ( SURFACE-AT ?auto_34974 ?auto_34977 ) ( CLEAR ?auto_34974 ) ( IS-CRATE ?auto_34975 ) ( not ( = ?auto_34974 ?auto_34975 ) ) ( AVAILABLE ?auto_34978 ) ( IN ?auto_34975 ?auto_34976 ) ( ON ?auto_34974 ?auto_34970 ) ( not ( = ?auto_34970 ?auto_34974 ) ) ( not ( = ?auto_34970 ?auto_34975 ) ) ( TRUCK-AT ?auto_34976 ?auto_34979 ) ( not ( = ?auto_34979 ?auto_34977 ) ) ( ON ?auto_34972 ?auto_34971 ) ( ON ?auto_34973 ?auto_34972 ) ( ON ?auto_34970 ?auto_34973 ) ( not ( = ?auto_34971 ?auto_34972 ) ) ( not ( = ?auto_34971 ?auto_34973 ) ) ( not ( = ?auto_34971 ?auto_34970 ) ) ( not ( = ?auto_34971 ?auto_34974 ) ) ( not ( = ?auto_34971 ?auto_34975 ) ) ( not ( = ?auto_34972 ?auto_34973 ) ) ( not ( = ?auto_34972 ?auto_34970 ) ) ( not ( = ?auto_34972 ?auto_34974 ) ) ( not ( = ?auto_34972 ?auto_34975 ) ) ( not ( = ?auto_34973 ?auto_34970 ) ) ( not ( = ?auto_34973 ?auto_34974 ) ) ( not ( = ?auto_34973 ?auto_34975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34970 ?auto_34974 ?auto_34975 )
      ( MAKE-5CRATE-VERIFY ?auto_34971 ?auto_34972 ?auto_34973 ?auto_34970 ?auto_34974 ?auto_34975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35016 - SURFACE
      ?auto_35017 - SURFACE
      ?auto_35018 - SURFACE
      ?auto_35015 - SURFACE
      ?auto_35019 - SURFACE
      ?auto_35020 - SURFACE
    )
    :vars
    (
      ?auto_35025 - HOIST
      ?auto_35024 - PLACE
      ?auto_35023 - TRUCK
      ?auto_35022 - PLACE
      ?auto_35021 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35025 ?auto_35024 ) ( SURFACE-AT ?auto_35019 ?auto_35024 ) ( CLEAR ?auto_35019 ) ( IS-CRATE ?auto_35020 ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( AVAILABLE ?auto_35025 ) ( ON ?auto_35019 ?auto_35015 ) ( not ( = ?auto_35015 ?auto_35019 ) ) ( not ( = ?auto_35015 ?auto_35020 ) ) ( TRUCK-AT ?auto_35023 ?auto_35022 ) ( not ( = ?auto_35022 ?auto_35024 ) ) ( HOIST-AT ?auto_35021 ?auto_35022 ) ( LIFTING ?auto_35021 ?auto_35020 ) ( not ( = ?auto_35025 ?auto_35021 ) ) ( ON ?auto_35017 ?auto_35016 ) ( ON ?auto_35018 ?auto_35017 ) ( ON ?auto_35015 ?auto_35018 ) ( not ( = ?auto_35016 ?auto_35017 ) ) ( not ( = ?auto_35016 ?auto_35018 ) ) ( not ( = ?auto_35016 ?auto_35015 ) ) ( not ( = ?auto_35016 ?auto_35019 ) ) ( not ( = ?auto_35016 ?auto_35020 ) ) ( not ( = ?auto_35017 ?auto_35018 ) ) ( not ( = ?auto_35017 ?auto_35015 ) ) ( not ( = ?auto_35017 ?auto_35019 ) ) ( not ( = ?auto_35017 ?auto_35020 ) ) ( not ( = ?auto_35018 ?auto_35015 ) ) ( not ( = ?auto_35018 ?auto_35019 ) ) ( not ( = ?auto_35018 ?auto_35020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35015 ?auto_35019 ?auto_35020 )
      ( MAKE-5CRATE-VERIFY ?auto_35016 ?auto_35017 ?auto_35018 ?auto_35015 ?auto_35019 ?auto_35020 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35066 - SURFACE
      ?auto_35067 - SURFACE
      ?auto_35068 - SURFACE
      ?auto_35065 - SURFACE
      ?auto_35069 - SURFACE
      ?auto_35070 - SURFACE
    )
    :vars
    (
      ?auto_35071 - HOIST
      ?auto_35075 - PLACE
      ?auto_35072 - TRUCK
      ?auto_35073 - PLACE
      ?auto_35074 - HOIST
      ?auto_35076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35071 ?auto_35075 ) ( SURFACE-AT ?auto_35069 ?auto_35075 ) ( CLEAR ?auto_35069 ) ( IS-CRATE ?auto_35070 ) ( not ( = ?auto_35069 ?auto_35070 ) ) ( AVAILABLE ?auto_35071 ) ( ON ?auto_35069 ?auto_35065 ) ( not ( = ?auto_35065 ?auto_35069 ) ) ( not ( = ?auto_35065 ?auto_35070 ) ) ( TRUCK-AT ?auto_35072 ?auto_35073 ) ( not ( = ?auto_35073 ?auto_35075 ) ) ( HOIST-AT ?auto_35074 ?auto_35073 ) ( not ( = ?auto_35071 ?auto_35074 ) ) ( AVAILABLE ?auto_35074 ) ( SURFACE-AT ?auto_35070 ?auto_35073 ) ( ON ?auto_35070 ?auto_35076 ) ( CLEAR ?auto_35070 ) ( not ( = ?auto_35069 ?auto_35076 ) ) ( not ( = ?auto_35070 ?auto_35076 ) ) ( not ( = ?auto_35065 ?auto_35076 ) ) ( ON ?auto_35067 ?auto_35066 ) ( ON ?auto_35068 ?auto_35067 ) ( ON ?auto_35065 ?auto_35068 ) ( not ( = ?auto_35066 ?auto_35067 ) ) ( not ( = ?auto_35066 ?auto_35068 ) ) ( not ( = ?auto_35066 ?auto_35065 ) ) ( not ( = ?auto_35066 ?auto_35069 ) ) ( not ( = ?auto_35066 ?auto_35070 ) ) ( not ( = ?auto_35066 ?auto_35076 ) ) ( not ( = ?auto_35067 ?auto_35068 ) ) ( not ( = ?auto_35067 ?auto_35065 ) ) ( not ( = ?auto_35067 ?auto_35069 ) ) ( not ( = ?auto_35067 ?auto_35070 ) ) ( not ( = ?auto_35067 ?auto_35076 ) ) ( not ( = ?auto_35068 ?auto_35065 ) ) ( not ( = ?auto_35068 ?auto_35069 ) ) ( not ( = ?auto_35068 ?auto_35070 ) ) ( not ( = ?auto_35068 ?auto_35076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35065 ?auto_35069 ?auto_35070 )
      ( MAKE-5CRATE-VERIFY ?auto_35066 ?auto_35067 ?auto_35068 ?auto_35065 ?auto_35069 ?auto_35070 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35117 - SURFACE
      ?auto_35118 - SURFACE
      ?auto_35119 - SURFACE
      ?auto_35116 - SURFACE
      ?auto_35120 - SURFACE
      ?auto_35121 - SURFACE
    )
    :vars
    (
      ?auto_35125 - HOIST
      ?auto_35126 - PLACE
      ?auto_35123 - PLACE
      ?auto_35127 - HOIST
      ?auto_35122 - SURFACE
      ?auto_35124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35125 ?auto_35126 ) ( SURFACE-AT ?auto_35120 ?auto_35126 ) ( CLEAR ?auto_35120 ) ( IS-CRATE ?auto_35121 ) ( not ( = ?auto_35120 ?auto_35121 ) ) ( AVAILABLE ?auto_35125 ) ( ON ?auto_35120 ?auto_35116 ) ( not ( = ?auto_35116 ?auto_35120 ) ) ( not ( = ?auto_35116 ?auto_35121 ) ) ( not ( = ?auto_35123 ?auto_35126 ) ) ( HOIST-AT ?auto_35127 ?auto_35123 ) ( not ( = ?auto_35125 ?auto_35127 ) ) ( AVAILABLE ?auto_35127 ) ( SURFACE-AT ?auto_35121 ?auto_35123 ) ( ON ?auto_35121 ?auto_35122 ) ( CLEAR ?auto_35121 ) ( not ( = ?auto_35120 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35116 ?auto_35122 ) ) ( TRUCK-AT ?auto_35124 ?auto_35126 ) ( ON ?auto_35118 ?auto_35117 ) ( ON ?auto_35119 ?auto_35118 ) ( ON ?auto_35116 ?auto_35119 ) ( not ( = ?auto_35117 ?auto_35118 ) ) ( not ( = ?auto_35117 ?auto_35119 ) ) ( not ( = ?auto_35117 ?auto_35116 ) ) ( not ( = ?auto_35117 ?auto_35120 ) ) ( not ( = ?auto_35117 ?auto_35121 ) ) ( not ( = ?auto_35117 ?auto_35122 ) ) ( not ( = ?auto_35118 ?auto_35119 ) ) ( not ( = ?auto_35118 ?auto_35116 ) ) ( not ( = ?auto_35118 ?auto_35120 ) ) ( not ( = ?auto_35118 ?auto_35121 ) ) ( not ( = ?auto_35118 ?auto_35122 ) ) ( not ( = ?auto_35119 ?auto_35116 ) ) ( not ( = ?auto_35119 ?auto_35120 ) ) ( not ( = ?auto_35119 ?auto_35121 ) ) ( not ( = ?auto_35119 ?auto_35122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35116 ?auto_35120 ?auto_35121 )
      ( MAKE-5CRATE-VERIFY ?auto_35117 ?auto_35118 ?auto_35119 ?auto_35116 ?auto_35120 ?auto_35121 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35168 - SURFACE
      ?auto_35169 - SURFACE
      ?auto_35170 - SURFACE
      ?auto_35167 - SURFACE
      ?auto_35171 - SURFACE
      ?auto_35172 - SURFACE
    )
    :vars
    (
      ?auto_35175 - HOIST
      ?auto_35178 - PLACE
      ?auto_35174 - PLACE
      ?auto_35176 - HOIST
      ?auto_35177 - SURFACE
      ?auto_35173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35175 ?auto_35178 ) ( IS-CRATE ?auto_35172 ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( not ( = ?auto_35167 ?auto_35171 ) ) ( not ( = ?auto_35167 ?auto_35172 ) ) ( not ( = ?auto_35174 ?auto_35178 ) ) ( HOIST-AT ?auto_35176 ?auto_35174 ) ( not ( = ?auto_35175 ?auto_35176 ) ) ( AVAILABLE ?auto_35176 ) ( SURFACE-AT ?auto_35172 ?auto_35174 ) ( ON ?auto_35172 ?auto_35177 ) ( CLEAR ?auto_35172 ) ( not ( = ?auto_35171 ?auto_35177 ) ) ( not ( = ?auto_35172 ?auto_35177 ) ) ( not ( = ?auto_35167 ?auto_35177 ) ) ( TRUCK-AT ?auto_35173 ?auto_35178 ) ( SURFACE-AT ?auto_35167 ?auto_35178 ) ( CLEAR ?auto_35167 ) ( LIFTING ?auto_35175 ?auto_35171 ) ( IS-CRATE ?auto_35171 ) ( ON ?auto_35169 ?auto_35168 ) ( ON ?auto_35170 ?auto_35169 ) ( ON ?auto_35167 ?auto_35170 ) ( not ( = ?auto_35168 ?auto_35169 ) ) ( not ( = ?auto_35168 ?auto_35170 ) ) ( not ( = ?auto_35168 ?auto_35167 ) ) ( not ( = ?auto_35168 ?auto_35171 ) ) ( not ( = ?auto_35168 ?auto_35172 ) ) ( not ( = ?auto_35168 ?auto_35177 ) ) ( not ( = ?auto_35169 ?auto_35170 ) ) ( not ( = ?auto_35169 ?auto_35167 ) ) ( not ( = ?auto_35169 ?auto_35171 ) ) ( not ( = ?auto_35169 ?auto_35172 ) ) ( not ( = ?auto_35169 ?auto_35177 ) ) ( not ( = ?auto_35170 ?auto_35167 ) ) ( not ( = ?auto_35170 ?auto_35171 ) ) ( not ( = ?auto_35170 ?auto_35172 ) ) ( not ( = ?auto_35170 ?auto_35177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35167 ?auto_35171 ?auto_35172 )
      ( MAKE-5CRATE-VERIFY ?auto_35168 ?auto_35169 ?auto_35170 ?auto_35167 ?auto_35171 ?auto_35172 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35219 - SURFACE
      ?auto_35220 - SURFACE
      ?auto_35221 - SURFACE
      ?auto_35218 - SURFACE
      ?auto_35222 - SURFACE
      ?auto_35223 - SURFACE
    )
    :vars
    (
      ?auto_35229 - HOIST
      ?auto_35228 - PLACE
      ?auto_35226 - PLACE
      ?auto_35225 - HOIST
      ?auto_35227 - SURFACE
      ?auto_35224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35229 ?auto_35228 ) ( IS-CRATE ?auto_35223 ) ( not ( = ?auto_35222 ?auto_35223 ) ) ( not ( = ?auto_35218 ?auto_35222 ) ) ( not ( = ?auto_35218 ?auto_35223 ) ) ( not ( = ?auto_35226 ?auto_35228 ) ) ( HOIST-AT ?auto_35225 ?auto_35226 ) ( not ( = ?auto_35229 ?auto_35225 ) ) ( AVAILABLE ?auto_35225 ) ( SURFACE-AT ?auto_35223 ?auto_35226 ) ( ON ?auto_35223 ?auto_35227 ) ( CLEAR ?auto_35223 ) ( not ( = ?auto_35222 ?auto_35227 ) ) ( not ( = ?auto_35223 ?auto_35227 ) ) ( not ( = ?auto_35218 ?auto_35227 ) ) ( TRUCK-AT ?auto_35224 ?auto_35228 ) ( SURFACE-AT ?auto_35218 ?auto_35228 ) ( CLEAR ?auto_35218 ) ( IS-CRATE ?auto_35222 ) ( AVAILABLE ?auto_35229 ) ( IN ?auto_35222 ?auto_35224 ) ( ON ?auto_35220 ?auto_35219 ) ( ON ?auto_35221 ?auto_35220 ) ( ON ?auto_35218 ?auto_35221 ) ( not ( = ?auto_35219 ?auto_35220 ) ) ( not ( = ?auto_35219 ?auto_35221 ) ) ( not ( = ?auto_35219 ?auto_35218 ) ) ( not ( = ?auto_35219 ?auto_35222 ) ) ( not ( = ?auto_35219 ?auto_35223 ) ) ( not ( = ?auto_35219 ?auto_35227 ) ) ( not ( = ?auto_35220 ?auto_35221 ) ) ( not ( = ?auto_35220 ?auto_35218 ) ) ( not ( = ?auto_35220 ?auto_35222 ) ) ( not ( = ?auto_35220 ?auto_35223 ) ) ( not ( = ?auto_35220 ?auto_35227 ) ) ( not ( = ?auto_35221 ?auto_35218 ) ) ( not ( = ?auto_35221 ?auto_35222 ) ) ( not ( = ?auto_35221 ?auto_35223 ) ) ( not ( = ?auto_35221 ?auto_35227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35218 ?auto_35222 ?auto_35223 )
      ( MAKE-5CRATE-VERIFY ?auto_35219 ?auto_35220 ?auto_35221 ?auto_35218 ?auto_35222 ?auto_35223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35586 - SURFACE
      ?auto_35587 - SURFACE
    )
    :vars
    (
      ?auto_35592 - HOIST
      ?auto_35590 - PLACE
      ?auto_35588 - SURFACE
      ?auto_35591 - TRUCK
      ?auto_35589 - PLACE
      ?auto_35594 - HOIST
      ?auto_35593 - SURFACE
      ?auto_35595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35592 ?auto_35590 ) ( SURFACE-AT ?auto_35586 ?auto_35590 ) ( CLEAR ?auto_35586 ) ( IS-CRATE ?auto_35587 ) ( not ( = ?auto_35586 ?auto_35587 ) ) ( AVAILABLE ?auto_35592 ) ( ON ?auto_35586 ?auto_35588 ) ( not ( = ?auto_35588 ?auto_35586 ) ) ( not ( = ?auto_35588 ?auto_35587 ) ) ( TRUCK-AT ?auto_35591 ?auto_35589 ) ( not ( = ?auto_35589 ?auto_35590 ) ) ( HOIST-AT ?auto_35594 ?auto_35589 ) ( not ( = ?auto_35592 ?auto_35594 ) ) ( SURFACE-AT ?auto_35587 ?auto_35589 ) ( ON ?auto_35587 ?auto_35593 ) ( CLEAR ?auto_35587 ) ( not ( = ?auto_35586 ?auto_35593 ) ) ( not ( = ?auto_35587 ?auto_35593 ) ) ( not ( = ?auto_35588 ?auto_35593 ) ) ( LIFTING ?auto_35594 ?auto_35595 ) ( IS-CRATE ?auto_35595 ) ( not ( = ?auto_35586 ?auto_35595 ) ) ( not ( = ?auto_35587 ?auto_35595 ) ) ( not ( = ?auto_35588 ?auto_35595 ) ) ( not ( = ?auto_35593 ?auto_35595 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35594 ?auto_35595 ?auto_35591 ?auto_35589 )
      ( MAKE-1CRATE ?auto_35586 ?auto_35587 )
      ( MAKE-1CRATE-VERIFY ?auto_35586 ?auto_35587 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36424 - SURFACE
      ?auto_36425 - SURFACE
      ?auto_36426 - SURFACE
      ?auto_36423 - SURFACE
      ?auto_36427 - SURFACE
      ?auto_36429 - SURFACE
      ?auto_36428 - SURFACE
    )
    :vars
    (
      ?auto_36431 - HOIST
      ?auto_36430 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36431 ?auto_36430 ) ( SURFACE-AT ?auto_36429 ?auto_36430 ) ( CLEAR ?auto_36429 ) ( LIFTING ?auto_36431 ?auto_36428 ) ( IS-CRATE ?auto_36428 ) ( not ( = ?auto_36429 ?auto_36428 ) ) ( ON ?auto_36425 ?auto_36424 ) ( ON ?auto_36426 ?auto_36425 ) ( ON ?auto_36423 ?auto_36426 ) ( ON ?auto_36427 ?auto_36423 ) ( ON ?auto_36429 ?auto_36427 ) ( not ( = ?auto_36424 ?auto_36425 ) ) ( not ( = ?auto_36424 ?auto_36426 ) ) ( not ( = ?auto_36424 ?auto_36423 ) ) ( not ( = ?auto_36424 ?auto_36427 ) ) ( not ( = ?auto_36424 ?auto_36429 ) ) ( not ( = ?auto_36424 ?auto_36428 ) ) ( not ( = ?auto_36425 ?auto_36426 ) ) ( not ( = ?auto_36425 ?auto_36423 ) ) ( not ( = ?auto_36425 ?auto_36427 ) ) ( not ( = ?auto_36425 ?auto_36429 ) ) ( not ( = ?auto_36425 ?auto_36428 ) ) ( not ( = ?auto_36426 ?auto_36423 ) ) ( not ( = ?auto_36426 ?auto_36427 ) ) ( not ( = ?auto_36426 ?auto_36429 ) ) ( not ( = ?auto_36426 ?auto_36428 ) ) ( not ( = ?auto_36423 ?auto_36427 ) ) ( not ( = ?auto_36423 ?auto_36429 ) ) ( not ( = ?auto_36423 ?auto_36428 ) ) ( not ( = ?auto_36427 ?auto_36429 ) ) ( not ( = ?auto_36427 ?auto_36428 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36429 ?auto_36428 )
      ( MAKE-6CRATE-VERIFY ?auto_36424 ?auto_36425 ?auto_36426 ?auto_36423 ?auto_36427 ?auto_36429 ?auto_36428 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36468 - SURFACE
      ?auto_36469 - SURFACE
      ?auto_36470 - SURFACE
      ?auto_36467 - SURFACE
      ?auto_36471 - SURFACE
      ?auto_36473 - SURFACE
      ?auto_36472 - SURFACE
    )
    :vars
    (
      ?auto_36475 - HOIST
      ?auto_36474 - PLACE
      ?auto_36476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36475 ?auto_36474 ) ( SURFACE-AT ?auto_36473 ?auto_36474 ) ( CLEAR ?auto_36473 ) ( IS-CRATE ?auto_36472 ) ( not ( = ?auto_36473 ?auto_36472 ) ) ( TRUCK-AT ?auto_36476 ?auto_36474 ) ( AVAILABLE ?auto_36475 ) ( IN ?auto_36472 ?auto_36476 ) ( ON ?auto_36473 ?auto_36471 ) ( not ( = ?auto_36471 ?auto_36473 ) ) ( not ( = ?auto_36471 ?auto_36472 ) ) ( ON ?auto_36469 ?auto_36468 ) ( ON ?auto_36470 ?auto_36469 ) ( ON ?auto_36467 ?auto_36470 ) ( ON ?auto_36471 ?auto_36467 ) ( not ( = ?auto_36468 ?auto_36469 ) ) ( not ( = ?auto_36468 ?auto_36470 ) ) ( not ( = ?auto_36468 ?auto_36467 ) ) ( not ( = ?auto_36468 ?auto_36471 ) ) ( not ( = ?auto_36468 ?auto_36473 ) ) ( not ( = ?auto_36468 ?auto_36472 ) ) ( not ( = ?auto_36469 ?auto_36470 ) ) ( not ( = ?auto_36469 ?auto_36467 ) ) ( not ( = ?auto_36469 ?auto_36471 ) ) ( not ( = ?auto_36469 ?auto_36473 ) ) ( not ( = ?auto_36469 ?auto_36472 ) ) ( not ( = ?auto_36470 ?auto_36467 ) ) ( not ( = ?auto_36470 ?auto_36471 ) ) ( not ( = ?auto_36470 ?auto_36473 ) ) ( not ( = ?auto_36470 ?auto_36472 ) ) ( not ( = ?auto_36467 ?auto_36471 ) ) ( not ( = ?auto_36467 ?auto_36473 ) ) ( not ( = ?auto_36467 ?auto_36472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36471 ?auto_36473 ?auto_36472 )
      ( MAKE-6CRATE-VERIFY ?auto_36468 ?auto_36469 ?auto_36470 ?auto_36467 ?auto_36471 ?auto_36473 ?auto_36472 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36519 - SURFACE
      ?auto_36520 - SURFACE
      ?auto_36521 - SURFACE
      ?auto_36518 - SURFACE
      ?auto_36522 - SURFACE
      ?auto_36524 - SURFACE
      ?auto_36523 - SURFACE
    )
    :vars
    (
      ?auto_36525 - HOIST
      ?auto_36527 - PLACE
      ?auto_36528 - TRUCK
      ?auto_36526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36525 ?auto_36527 ) ( SURFACE-AT ?auto_36524 ?auto_36527 ) ( CLEAR ?auto_36524 ) ( IS-CRATE ?auto_36523 ) ( not ( = ?auto_36524 ?auto_36523 ) ) ( AVAILABLE ?auto_36525 ) ( IN ?auto_36523 ?auto_36528 ) ( ON ?auto_36524 ?auto_36522 ) ( not ( = ?auto_36522 ?auto_36524 ) ) ( not ( = ?auto_36522 ?auto_36523 ) ) ( TRUCK-AT ?auto_36528 ?auto_36526 ) ( not ( = ?auto_36526 ?auto_36527 ) ) ( ON ?auto_36520 ?auto_36519 ) ( ON ?auto_36521 ?auto_36520 ) ( ON ?auto_36518 ?auto_36521 ) ( ON ?auto_36522 ?auto_36518 ) ( not ( = ?auto_36519 ?auto_36520 ) ) ( not ( = ?auto_36519 ?auto_36521 ) ) ( not ( = ?auto_36519 ?auto_36518 ) ) ( not ( = ?auto_36519 ?auto_36522 ) ) ( not ( = ?auto_36519 ?auto_36524 ) ) ( not ( = ?auto_36519 ?auto_36523 ) ) ( not ( = ?auto_36520 ?auto_36521 ) ) ( not ( = ?auto_36520 ?auto_36518 ) ) ( not ( = ?auto_36520 ?auto_36522 ) ) ( not ( = ?auto_36520 ?auto_36524 ) ) ( not ( = ?auto_36520 ?auto_36523 ) ) ( not ( = ?auto_36521 ?auto_36518 ) ) ( not ( = ?auto_36521 ?auto_36522 ) ) ( not ( = ?auto_36521 ?auto_36524 ) ) ( not ( = ?auto_36521 ?auto_36523 ) ) ( not ( = ?auto_36518 ?auto_36522 ) ) ( not ( = ?auto_36518 ?auto_36524 ) ) ( not ( = ?auto_36518 ?auto_36523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36522 ?auto_36524 ?auto_36523 )
      ( MAKE-6CRATE-VERIFY ?auto_36519 ?auto_36520 ?auto_36521 ?auto_36518 ?auto_36522 ?auto_36524 ?auto_36523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36576 - SURFACE
      ?auto_36577 - SURFACE
      ?auto_36578 - SURFACE
      ?auto_36575 - SURFACE
      ?auto_36579 - SURFACE
      ?auto_36581 - SURFACE
      ?auto_36580 - SURFACE
    )
    :vars
    (
      ?auto_36585 - HOIST
      ?auto_36583 - PLACE
      ?auto_36586 - TRUCK
      ?auto_36584 - PLACE
      ?auto_36582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36585 ?auto_36583 ) ( SURFACE-AT ?auto_36581 ?auto_36583 ) ( CLEAR ?auto_36581 ) ( IS-CRATE ?auto_36580 ) ( not ( = ?auto_36581 ?auto_36580 ) ) ( AVAILABLE ?auto_36585 ) ( ON ?auto_36581 ?auto_36579 ) ( not ( = ?auto_36579 ?auto_36581 ) ) ( not ( = ?auto_36579 ?auto_36580 ) ) ( TRUCK-AT ?auto_36586 ?auto_36584 ) ( not ( = ?auto_36584 ?auto_36583 ) ) ( HOIST-AT ?auto_36582 ?auto_36584 ) ( LIFTING ?auto_36582 ?auto_36580 ) ( not ( = ?auto_36585 ?auto_36582 ) ) ( ON ?auto_36577 ?auto_36576 ) ( ON ?auto_36578 ?auto_36577 ) ( ON ?auto_36575 ?auto_36578 ) ( ON ?auto_36579 ?auto_36575 ) ( not ( = ?auto_36576 ?auto_36577 ) ) ( not ( = ?auto_36576 ?auto_36578 ) ) ( not ( = ?auto_36576 ?auto_36575 ) ) ( not ( = ?auto_36576 ?auto_36579 ) ) ( not ( = ?auto_36576 ?auto_36581 ) ) ( not ( = ?auto_36576 ?auto_36580 ) ) ( not ( = ?auto_36577 ?auto_36578 ) ) ( not ( = ?auto_36577 ?auto_36575 ) ) ( not ( = ?auto_36577 ?auto_36579 ) ) ( not ( = ?auto_36577 ?auto_36581 ) ) ( not ( = ?auto_36577 ?auto_36580 ) ) ( not ( = ?auto_36578 ?auto_36575 ) ) ( not ( = ?auto_36578 ?auto_36579 ) ) ( not ( = ?auto_36578 ?auto_36581 ) ) ( not ( = ?auto_36578 ?auto_36580 ) ) ( not ( = ?auto_36575 ?auto_36579 ) ) ( not ( = ?auto_36575 ?auto_36581 ) ) ( not ( = ?auto_36575 ?auto_36580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36579 ?auto_36581 ?auto_36580 )
      ( MAKE-6CRATE-VERIFY ?auto_36576 ?auto_36577 ?auto_36578 ?auto_36575 ?auto_36579 ?auto_36581 ?auto_36580 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36639 - SURFACE
      ?auto_36640 - SURFACE
      ?auto_36641 - SURFACE
      ?auto_36638 - SURFACE
      ?auto_36642 - SURFACE
      ?auto_36644 - SURFACE
      ?auto_36643 - SURFACE
    )
    :vars
    (
      ?auto_36649 - HOIST
      ?auto_36647 - PLACE
      ?auto_36648 - TRUCK
      ?auto_36645 - PLACE
      ?auto_36646 - HOIST
      ?auto_36650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36649 ?auto_36647 ) ( SURFACE-AT ?auto_36644 ?auto_36647 ) ( CLEAR ?auto_36644 ) ( IS-CRATE ?auto_36643 ) ( not ( = ?auto_36644 ?auto_36643 ) ) ( AVAILABLE ?auto_36649 ) ( ON ?auto_36644 ?auto_36642 ) ( not ( = ?auto_36642 ?auto_36644 ) ) ( not ( = ?auto_36642 ?auto_36643 ) ) ( TRUCK-AT ?auto_36648 ?auto_36645 ) ( not ( = ?auto_36645 ?auto_36647 ) ) ( HOIST-AT ?auto_36646 ?auto_36645 ) ( not ( = ?auto_36649 ?auto_36646 ) ) ( AVAILABLE ?auto_36646 ) ( SURFACE-AT ?auto_36643 ?auto_36645 ) ( ON ?auto_36643 ?auto_36650 ) ( CLEAR ?auto_36643 ) ( not ( = ?auto_36644 ?auto_36650 ) ) ( not ( = ?auto_36643 ?auto_36650 ) ) ( not ( = ?auto_36642 ?auto_36650 ) ) ( ON ?auto_36640 ?auto_36639 ) ( ON ?auto_36641 ?auto_36640 ) ( ON ?auto_36638 ?auto_36641 ) ( ON ?auto_36642 ?auto_36638 ) ( not ( = ?auto_36639 ?auto_36640 ) ) ( not ( = ?auto_36639 ?auto_36641 ) ) ( not ( = ?auto_36639 ?auto_36638 ) ) ( not ( = ?auto_36639 ?auto_36642 ) ) ( not ( = ?auto_36639 ?auto_36644 ) ) ( not ( = ?auto_36639 ?auto_36643 ) ) ( not ( = ?auto_36639 ?auto_36650 ) ) ( not ( = ?auto_36640 ?auto_36641 ) ) ( not ( = ?auto_36640 ?auto_36638 ) ) ( not ( = ?auto_36640 ?auto_36642 ) ) ( not ( = ?auto_36640 ?auto_36644 ) ) ( not ( = ?auto_36640 ?auto_36643 ) ) ( not ( = ?auto_36640 ?auto_36650 ) ) ( not ( = ?auto_36641 ?auto_36638 ) ) ( not ( = ?auto_36641 ?auto_36642 ) ) ( not ( = ?auto_36641 ?auto_36644 ) ) ( not ( = ?auto_36641 ?auto_36643 ) ) ( not ( = ?auto_36641 ?auto_36650 ) ) ( not ( = ?auto_36638 ?auto_36642 ) ) ( not ( = ?auto_36638 ?auto_36644 ) ) ( not ( = ?auto_36638 ?auto_36643 ) ) ( not ( = ?auto_36638 ?auto_36650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36642 ?auto_36644 ?auto_36643 )
      ( MAKE-6CRATE-VERIFY ?auto_36639 ?auto_36640 ?auto_36641 ?auto_36638 ?auto_36642 ?auto_36644 ?auto_36643 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36703 - SURFACE
      ?auto_36704 - SURFACE
      ?auto_36705 - SURFACE
      ?auto_36702 - SURFACE
      ?auto_36706 - SURFACE
      ?auto_36708 - SURFACE
      ?auto_36707 - SURFACE
    )
    :vars
    (
      ?auto_36711 - HOIST
      ?auto_36712 - PLACE
      ?auto_36709 - PLACE
      ?auto_36713 - HOIST
      ?auto_36710 - SURFACE
      ?auto_36714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36711 ?auto_36712 ) ( SURFACE-AT ?auto_36708 ?auto_36712 ) ( CLEAR ?auto_36708 ) ( IS-CRATE ?auto_36707 ) ( not ( = ?auto_36708 ?auto_36707 ) ) ( AVAILABLE ?auto_36711 ) ( ON ?auto_36708 ?auto_36706 ) ( not ( = ?auto_36706 ?auto_36708 ) ) ( not ( = ?auto_36706 ?auto_36707 ) ) ( not ( = ?auto_36709 ?auto_36712 ) ) ( HOIST-AT ?auto_36713 ?auto_36709 ) ( not ( = ?auto_36711 ?auto_36713 ) ) ( AVAILABLE ?auto_36713 ) ( SURFACE-AT ?auto_36707 ?auto_36709 ) ( ON ?auto_36707 ?auto_36710 ) ( CLEAR ?auto_36707 ) ( not ( = ?auto_36708 ?auto_36710 ) ) ( not ( = ?auto_36707 ?auto_36710 ) ) ( not ( = ?auto_36706 ?auto_36710 ) ) ( TRUCK-AT ?auto_36714 ?auto_36712 ) ( ON ?auto_36704 ?auto_36703 ) ( ON ?auto_36705 ?auto_36704 ) ( ON ?auto_36702 ?auto_36705 ) ( ON ?auto_36706 ?auto_36702 ) ( not ( = ?auto_36703 ?auto_36704 ) ) ( not ( = ?auto_36703 ?auto_36705 ) ) ( not ( = ?auto_36703 ?auto_36702 ) ) ( not ( = ?auto_36703 ?auto_36706 ) ) ( not ( = ?auto_36703 ?auto_36708 ) ) ( not ( = ?auto_36703 ?auto_36707 ) ) ( not ( = ?auto_36703 ?auto_36710 ) ) ( not ( = ?auto_36704 ?auto_36705 ) ) ( not ( = ?auto_36704 ?auto_36702 ) ) ( not ( = ?auto_36704 ?auto_36706 ) ) ( not ( = ?auto_36704 ?auto_36708 ) ) ( not ( = ?auto_36704 ?auto_36707 ) ) ( not ( = ?auto_36704 ?auto_36710 ) ) ( not ( = ?auto_36705 ?auto_36702 ) ) ( not ( = ?auto_36705 ?auto_36706 ) ) ( not ( = ?auto_36705 ?auto_36708 ) ) ( not ( = ?auto_36705 ?auto_36707 ) ) ( not ( = ?auto_36705 ?auto_36710 ) ) ( not ( = ?auto_36702 ?auto_36706 ) ) ( not ( = ?auto_36702 ?auto_36708 ) ) ( not ( = ?auto_36702 ?auto_36707 ) ) ( not ( = ?auto_36702 ?auto_36710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36706 ?auto_36708 ?auto_36707 )
      ( MAKE-6CRATE-VERIFY ?auto_36703 ?auto_36704 ?auto_36705 ?auto_36702 ?auto_36706 ?auto_36708 ?auto_36707 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36767 - SURFACE
      ?auto_36768 - SURFACE
      ?auto_36769 - SURFACE
      ?auto_36766 - SURFACE
      ?auto_36770 - SURFACE
      ?auto_36772 - SURFACE
      ?auto_36771 - SURFACE
    )
    :vars
    (
      ?auto_36778 - HOIST
      ?auto_36777 - PLACE
      ?auto_36774 - PLACE
      ?auto_36776 - HOIST
      ?auto_36775 - SURFACE
      ?auto_36773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36778 ?auto_36777 ) ( IS-CRATE ?auto_36771 ) ( not ( = ?auto_36772 ?auto_36771 ) ) ( not ( = ?auto_36770 ?auto_36772 ) ) ( not ( = ?auto_36770 ?auto_36771 ) ) ( not ( = ?auto_36774 ?auto_36777 ) ) ( HOIST-AT ?auto_36776 ?auto_36774 ) ( not ( = ?auto_36778 ?auto_36776 ) ) ( AVAILABLE ?auto_36776 ) ( SURFACE-AT ?auto_36771 ?auto_36774 ) ( ON ?auto_36771 ?auto_36775 ) ( CLEAR ?auto_36771 ) ( not ( = ?auto_36772 ?auto_36775 ) ) ( not ( = ?auto_36771 ?auto_36775 ) ) ( not ( = ?auto_36770 ?auto_36775 ) ) ( TRUCK-AT ?auto_36773 ?auto_36777 ) ( SURFACE-AT ?auto_36770 ?auto_36777 ) ( CLEAR ?auto_36770 ) ( LIFTING ?auto_36778 ?auto_36772 ) ( IS-CRATE ?auto_36772 ) ( ON ?auto_36768 ?auto_36767 ) ( ON ?auto_36769 ?auto_36768 ) ( ON ?auto_36766 ?auto_36769 ) ( ON ?auto_36770 ?auto_36766 ) ( not ( = ?auto_36767 ?auto_36768 ) ) ( not ( = ?auto_36767 ?auto_36769 ) ) ( not ( = ?auto_36767 ?auto_36766 ) ) ( not ( = ?auto_36767 ?auto_36770 ) ) ( not ( = ?auto_36767 ?auto_36772 ) ) ( not ( = ?auto_36767 ?auto_36771 ) ) ( not ( = ?auto_36767 ?auto_36775 ) ) ( not ( = ?auto_36768 ?auto_36769 ) ) ( not ( = ?auto_36768 ?auto_36766 ) ) ( not ( = ?auto_36768 ?auto_36770 ) ) ( not ( = ?auto_36768 ?auto_36772 ) ) ( not ( = ?auto_36768 ?auto_36771 ) ) ( not ( = ?auto_36768 ?auto_36775 ) ) ( not ( = ?auto_36769 ?auto_36766 ) ) ( not ( = ?auto_36769 ?auto_36770 ) ) ( not ( = ?auto_36769 ?auto_36772 ) ) ( not ( = ?auto_36769 ?auto_36771 ) ) ( not ( = ?auto_36769 ?auto_36775 ) ) ( not ( = ?auto_36766 ?auto_36770 ) ) ( not ( = ?auto_36766 ?auto_36772 ) ) ( not ( = ?auto_36766 ?auto_36771 ) ) ( not ( = ?auto_36766 ?auto_36775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36770 ?auto_36772 ?auto_36771 )
      ( MAKE-6CRATE-VERIFY ?auto_36767 ?auto_36768 ?auto_36769 ?auto_36766 ?auto_36770 ?auto_36772 ?auto_36771 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36831 - SURFACE
      ?auto_36832 - SURFACE
      ?auto_36833 - SURFACE
      ?auto_36830 - SURFACE
      ?auto_36834 - SURFACE
      ?auto_36836 - SURFACE
      ?auto_36835 - SURFACE
    )
    :vars
    (
      ?auto_36839 - HOIST
      ?auto_36842 - PLACE
      ?auto_36837 - PLACE
      ?auto_36841 - HOIST
      ?auto_36840 - SURFACE
      ?auto_36838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36839 ?auto_36842 ) ( IS-CRATE ?auto_36835 ) ( not ( = ?auto_36836 ?auto_36835 ) ) ( not ( = ?auto_36834 ?auto_36836 ) ) ( not ( = ?auto_36834 ?auto_36835 ) ) ( not ( = ?auto_36837 ?auto_36842 ) ) ( HOIST-AT ?auto_36841 ?auto_36837 ) ( not ( = ?auto_36839 ?auto_36841 ) ) ( AVAILABLE ?auto_36841 ) ( SURFACE-AT ?auto_36835 ?auto_36837 ) ( ON ?auto_36835 ?auto_36840 ) ( CLEAR ?auto_36835 ) ( not ( = ?auto_36836 ?auto_36840 ) ) ( not ( = ?auto_36835 ?auto_36840 ) ) ( not ( = ?auto_36834 ?auto_36840 ) ) ( TRUCK-AT ?auto_36838 ?auto_36842 ) ( SURFACE-AT ?auto_36834 ?auto_36842 ) ( CLEAR ?auto_36834 ) ( IS-CRATE ?auto_36836 ) ( AVAILABLE ?auto_36839 ) ( IN ?auto_36836 ?auto_36838 ) ( ON ?auto_36832 ?auto_36831 ) ( ON ?auto_36833 ?auto_36832 ) ( ON ?auto_36830 ?auto_36833 ) ( ON ?auto_36834 ?auto_36830 ) ( not ( = ?auto_36831 ?auto_36832 ) ) ( not ( = ?auto_36831 ?auto_36833 ) ) ( not ( = ?auto_36831 ?auto_36830 ) ) ( not ( = ?auto_36831 ?auto_36834 ) ) ( not ( = ?auto_36831 ?auto_36836 ) ) ( not ( = ?auto_36831 ?auto_36835 ) ) ( not ( = ?auto_36831 ?auto_36840 ) ) ( not ( = ?auto_36832 ?auto_36833 ) ) ( not ( = ?auto_36832 ?auto_36830 ) ) ( not ( = ?auto_36832 ?auto_36834 ) ) ( not ( = ?auto_36832 ?auto_36836 ) ) ( not ( = ?auto_36832 ?auto_36835 ) ) ( not ( = ?auto_36832 ?auto_36840 ) ) ( not ( = ?auto_36833 ?auto_36830 ) ) ( not ( = ?auto_36833 ?auto_36834 ) ) ( not ( = ?auto_36833 ?auto_36836 ) ) ( not ( = ?auto_36833 ?auto_36835 ) ) ( not ( = ?auto_36833 ?auto_36840 ) ) ( not ( = ?auto_36830 ?auto_36834 ) ) ( not ( = ?auto_36830 ?auto_36836 ) ) ( not ( = ?auto_36830 ?auto_36835 ) ) ( not ( = ?auto_36830 ?auto_36840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36834 ?auto_36836 ?auto_36835 )
      ( MAKE-6CRATE-VERIFY ?auto_36831 ?auto_36832 ?auto_36833 ?auto_36830 ?auto_36834 ?auto_36836 ?auto_36835 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36862 - SURFACE
      ?auto_36863 - SURFACE
      ?auto_36864 - SURFACE
      ?auto_36861 - SURFACE
    )
    :vars
    (
      ?auto_36868 - HOIST
      ?auto_36865 - PLACE
      ?auto_36870 - PLACE
      ?auto_36867 - HOIST
      ?auto_36869 - SURFACE
      ?auto_36866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36868 ?auto_36865 ) ( IS-CRATE ?auto_36861 ) ( not ( = ?auto_36864 ?auto_36861 ) ) ( not ( = ?auto_36863 ?auto_36864 ) ) ( not ( = ?auto_36863 ?auto_36861 ) ) ( not ( = ?auto_36870 ?auto_36865 ) ) ( HOIST-AT ?auto_36867 ?auto_36870 ) ( not ( = ?auto_36868 ?auto_36867 ) ) ( AVAILABLE ?auto_36867 ) ( SURFACE-AT ?auto_36861 ?auto_36870 ) ( ON ?auto_36861 ?auto_36869 ) ( CLEAR ?auto_36861 ) ( not ( = ?auto_36864 ?auto_36869 ) ) ( not ( = ?auto_36861 ?auto_36869 ) ) ( not ( = ?auto_36863 ?auto_36869 ) ) ( SURFACE-AT ?auto_36863 ?auto_36865 ) ( CLEAR ?auto_36863 ) ( IS-CRATE ?auto_36864 ) ( AVAILABLE ?auto_36868 ) ( IN ?auto_36864 ?auto_36866 ) ( TRUCK-AT ?auto_36866 ?auto_36870 ) ( ON ?auto_36863 ?auto_36862 ) ( not ( = ?auto_36862 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36864 ) ) ( not ( = ?auto_36862 ?auto_36861 ) ) ( not ( = ?auto_36862 ?auto_36869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36863 ?auto_36864 ?auto_36861 )
      ( MAKE-3CRATE-VERIFY ?auto_36862 ?auto_36863 ?auto_36864 ?auto_36861 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36872 - SURFACE
      ?auto_36873 - SURFACE
      ?auto_36874 - SURFACE
      ?auto_36871 - SURFACE
      ?auto_36875 - SURFACE
    )
    :vars
    (
      ?auto_36879 - HOIST
      ?auto_36876 - PLACE
      ?auto_36881 - PLACE
      ?auto_36878 - HOIST
      ?auto_36880 - SURFACE
      ?auto_36877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36879 ?auto_36876 ) ( IS-CRATE ?auto_36875 ) ( not ( = ?auto_36871 ?auto_36875 ) ) ( not ( = ?auto_36874 ?auto_36871 ) ) ( not ( = ?auto_36874 ?auto_36875 ) ) ( not ( = ?auto_36881 ?auto_36876 ) ) ( HOIST-AT ?auto_36878 ?auto_36881 ) ( not ( = ?auto_36879 ?auto_36878 ) ) ( AVAILABLE ?auto_36878 ) ( SURFACE-AT ?auto_36875 ?auto_36881 ) ( ON ?auto_36875 ?auto_36880 ) ( CLEAR ?auto_36875 ) ( not ( = ?auto_36871 ?auto_36880 ) ) ( not ( = ?auto_36875 ?auto_36880 ) ) ( not ( = ?auto_36874 ?auto_36880 ) ) ( SURFACE-AT ?auto_36874 ?auto_36876 ) ( CLEAR ?auto_36874 ) ( IS-CRATE ?auto_36871 ) ( AVAILABLE ?auto_36879 ) ( IN ?auto_36871 ?auto_36877 ) ( TRUCK-AT ?auto_36877 ?auto_36881 ) ( ON ?auto_36873 ?auto_36872 ) ( ON ?auto_36874 ?auto_36873 ) ( not ( = ?auto_36872 ?auto_36873 ) ) ( not ( = ?auto_36872 ?auto_36874 ) ) ( not ( = ?auto_36872 ?auto_36871 ) ) ( not ( = ?auto_36872 ?auto_36875 ) ) ( not ( = ?auto_36872 ?auto_36880 ) ) ( not ( = ?auto_36873 ?auto_36874 ) ) ( not ( = ?auto_36873 ?auto_36871 ) ) ( not ( = ?auto_36873 ?auto_36875 ) ) ( not ( = ?auto_36873 ?auto_36880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36874 ?auto_36871 ?auto_36875 )
      ( MAKE-4CRATE-VERIFY ?auto_36872 ?auto_36873 ?auto_36874 ?auto_36871 ?auto_36875 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36883 - SURFACE
      ?auto_36884 - SURFACE
      ?auto_36885 - SURFACE
      ?auto_36882 - SURFACE
      ?auto_36886 - SURFACE
      ?auto_36887 - SURFACE
    )
    :vars
    (
      ?auto_36891 - HOIST
      ?auto_36888 - PLACE
      ?auto_36893 - PLACE
      ?auto_36890 - HOIST
      ?auto_36892 - SURFACE
      ?auto_36889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36891 ?auto_36888 ) ( IS-CRATE ?auto_36887 ) ( not ( = ?auto_36886 ?auto_36887 ) ) ( not ( = ?auto_36882 ?auto_36886 ) ) ( not ( = ?auto_36882 ?auto_36887 ) ) ( not ( = ?auto_36893 ?auto_36888 ) ) ( HOIST-AT ?auto_36890 ?auto_36893 ) ( not ( = ?auto_36891 ?auto_36890 ) ) ( AVAILABLE ?auto_36890 ) ( SURFACE-AT ?auto_36887 ?auto_36893 ) ( ON ?auto_36887 ?auto_36892 ) ( CLEAR ?auto_36887 ) ( not ( = ?auto_36886 ?auto_36892 ) ) ( not ( = ?auto_36887 ?auto_36892 ) ) ( not ( = ?auto_36882 ?auto_36892 ) ) ( SURFACE-AT ?auto_36882 ?auto_36888 ) ( CLEAR ?auto_36882 ) ( IS-CRATE ?auto_36886 ) ( AVAILABLE ?auto_36891 ) ( IN ?auto_36886 ?auto_36889 ) ( TRUCK-AT ?auto_36889 ?auto_36893 ) ( ON ?auto_36884 ?auto_36883 ) ( ON ?auto_36885 ?auto_36884 ) ( ON ?auto_36882 ?auto_36885 ) ( not ( = ?auto_36883 ?auto_36884 ) ) ( not ( = ?auto_36883 ?auto_36885 ) ) ( not ( = ?auto_36883 ?auto_36882 ) ) ( not ( = ?auto_36883 ?auto_36886 ) ) ( not ( = ?auto_36883 ?auto_36887 ) ) ( not ( = ?auto_36883 ?auto_36892 ) ) ( not ( = ?auto_36884 ?auto_36885 ) ) ( not ( = ?auto_36884 ?auto_36882 ) ) ( not ( = ?auto_36884 ?auto_36886 ) ) ( not ( = ?auto_36884 ?auto_36887 ) ) ( not ( = ?auto_36884 ?auto_36892 ) ) ( not ( = ?auto_36885 ?auto_36882 ) ) ( not ( = ?auto_36885 ?auto_36886 ) ) ( not ( = ?auto_36885 ?auto_36887 ) ) ( not ( = ?auto_36885 ?auto_36892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36882 ?auto_36886 ?auto_36887 )
      ( MAKE-5CRATE-VERIFY ?auto_36883 ?auto_36884 ?auto_36885 ?auto_36882 ?auto_36886 ?auto_36887 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36895 - SURFACE
      ?auto_36896 - SURFACE
      ?auto_36897 - SURFACE
      ?auto_36894 - SURFACE
      ?auto_36898 - SURFACE
      ?auto_36900 - SURFACE
      ?auto_36899 - SURFACE
    )
    :vars
    (
      ?auto_36904 - HOIST
      ?auto_36901 - PLACE
      ?auto_36906 - PLACE
      ?auto_36903 - HOIST
      ?auto_36905 - SURFACE
      ?auto_36902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36904 ?auto_36901 ) ( IS-CRATE ?auto_36899 ) ( not ( = ?auto_36900 ?auto_36899 ) ) ( not ( = ?auto_36898 ?auto_36900 ) ) ( not ( = ?auto_36898 ?auto_36899 ) ) ( not ( = ?auto_36906 ?auto_36901 ) ) ( HOIST-AT ?auto_36903 ?auto_36906 ) ( not ( = ?auto_36904 ?auto_36903 ) ) ( AVAILABLE ?auto_36903 ) ( SURFACE-AT ?auto_36899 ?auto_36906 ) ( ON ?auto_36899 ?auto_36905 ) ( CLEAR ?auto_36899 ) ( not ( = ?auto_36900 ?auto_36905 ) ) ( not ( = ?auto_36899 ?auto_36905 ) ) ( not ( = ?auto_36898 ?auto_36905 ) ) ( SURFACE-AT ?auto_36898 ?auto_36901 ) ( CLEAR ?auto_36898 ) ( IS-CRATE ?auto_36900 ) ( AVAILABLE ?auto_36904 ) ( IN ?auto_36900 ?auto_36902 ) ( TRUCK-AT ?auto_36902 ?auto_36906 ) ( ON ?auto_36896 ?auto_36895 ) ( ON ?auto_36897 ?auto_36896 ) ( ON ?auto_36894 ?auto_36897 ) ( ON ?auto_36898 ?auto_36894 ) ( not ( = ?auto_36895 ?auto_36896 ) ) ( not ( = ?auto_36895 ?auto_36897 ) ) ( not ( = ?auto_36895 ?auto_36894 ) ) ( not ( = ?auto_36895 ?auto_36898 ) ) ( not ( = ?auto_36895 ?auto_36900 ) ) ( not ( = ?auto_36895 ?auto_36899 ) ) ( not ( = ?auto_36895 ?auto_36905 ) ) ( not ( = ?auto_36896 ?auto_36897 ) ) ( not ( = ?auto_36896 ?auto_36894 ) ) ( not ( = ?auto_36896 ?auto_36898 ) ) ( not ( = ?auto_36896 ?auto_36900 ) ) ( not ( = ?auto_36896 ?auto_36899 ) ) ( not ( = ?auto_36896 ?auto_36905 ) ) ( not ( = ?auto_36897 ?auto_36894 ) ) ( not ( = ?auto_36897 ?auto_36898 ) ) ( not ( = ?auto_36897 ?auto_36900 ) ) ( not ( = ?auto_36897 ?auto_36899 ) ) ( not ( = ?auto_36897 ?auto_36905 ) ) ( not ( = ?auto_36894 ?auto_36898 ) ) ( not ( = ?auto_36894 ?auto_36900 ) ) ( not ( = ?auto_36894 ?auto_36899 ) ) ( not ( = ?auto_36894 ?auto_36905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36898 ?auto_36900 ?auto_36899 )
      ( MAKE-6CRATE-VERIFY ?auto_36895 ?auto_36896 ?auto_36897 ?auto_36894 ?auto_36898 ?auto_36900 ?auto_36899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36926 - SURFACE
      ?auto_36927 - SURFACE
      ?auto_36928 - SURFACE
      ?auto_36925 - SURFACE
    )
    :vars
    (
      ?auto_36934 - HOIST
      ?auto_36929 - PLACE
      ?auto_36930 - PLACE
      ?auto_36933 - HOIST
      ?auto_36932 - SURFACE
      ?auto_36931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36934 ?auto_36929 ) ( IS-CRATE ?auto_36925 ) ( not ( = ?auto_36928 ?auto_36925 ) ) ( not ( = ?auto_36927 ?auto_36928 ) ) ( not ( = ?auto_36927 ?auto_36925 ) ) ( not ( = ?auto_36930 ?auto_36929 ) ) ( HOIST-AT ?auto_36933 ?auto_36930 ) ( not ( = ?auto_36934 ?auto_36933 ) ) ( SURFACE-AT ?auto_36925 ?auto_36930 ) ( ON ?auto_36925 ?auto_36932 ) ( CLEAR ?auto_36925 ) ( not ( = ?auto_36928 ?auto_36932 ) ) ( not ( = ?auto_36925 ?auto_36932 ) ) ( not ( = ?auto_36927 ?auto_36932 ) ) ( SURFACE-AT ?auto_36927 ?auto_36929 ) ( CLEAR ?auto_36927 ) ( IS-CRATE ?auto_36928 ) ( AVAILABLE ?auto_36934 ) ( TRUCK-AT ?auto_36931 ?auto_36930 ) ( LIFTING ?auto_36933 ?auto_36928 ) ( ON ?auto_36927 ?auto_36926 ) ( not ( = ?auto_36926 ?auto_36927 ) ) ( not ( = ?auto_36926 ?auto_36928 ) ) ( not ( = ?auto_36926 ?auto_36925 ) ) ( not ( = ?auto_36926 ?auto_36932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36927 ?auto_36928 ?auto_36925 )
      ( MAKE-3CRATE-VERIFY ?auto_36926 ?auto_36927 ?auto_36928 ?auto_36925 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36936 - SURFACE
      ?auto_36937 - SURFACE
      ?auto_36938 - SURFACE
      ?auto_36935 - SURFACE
      ?auto_36939 - SURFACE
    )
    :vars
    (
      ?auto_36945 - HOIST
      ?auto_36940 - PLACE
      ?auto_36941 - PLACE
      ?auto_36944 - HOIST
      ?auto_36943 - SURFACE
      ?auto_36942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36945 ?auto_36940 ) ( IS-CRATE ?auto_36939 ) ( not ( = ?auto_36935 ?auto_36939 ) ) ( not ( = ?auto_36938 ?auto_36935 ) ) ( not ( = ?auto_36938 ?auto_36939 ) ) ( not ( = ?auto_36941 ?auto_36940 ) ) ( HOIST-AT ?auto_36944 ?auto_36941 ) ( not ( = ?auto_36945 ?auto_36944 ) ) ( SURFACE-AT ?auto_36939 ?auto_36941 ) ( ON ?auto_36939 ?auto_36943 ) ( CLEAR ?auto_36939 ) ( not ( = ?auto_36935 ?auto_36943 ) ) ( not ( = ?auto_36939 ?auto_36943 ) ) ( not ( = ?auto_36938 ?auto_36943 ) ) ( SURFACE-AT ?auto_36938 ?auto_36940 ) ( CLEAR ?auto_36938 ) ( IS-CRATE ?auto_36935 ) ( AVAILABLE ?auto_36945 ) ( TRUCK-AT ?auto_36942 ?auto_36941 ) ( LIFTING ?auto_36944 ?auto_36935 ) ( ON ?auto_36937 ?auto_36936 ) ( ON ?auto_36938 ?auto_36937 ) ( not ( = ?auto_36936 ?auto_36937 ) ) ( not ( = ?auto_36936 ?auto_36938 ) ) ( not ( = ?auto_36936 ?auto_36935 ) ) ( not ( = ?auto_36936 ?auto_36939 ) ) ( not ( = ?auto_36936 ?auto_36943 ) ) ( not ( = ?auto_36937 ?auto_36938 ) ) ( not ( = ?auto_36937 ?auto_36935 ) ) ( not ( = ?auto_36937 ?auto_36939 ) ) ( not ( = ?auto_36937 ?auto_36943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36938 ?auto_36935 ?auto_36939 )
      ( MAKE-4CRATE-VERIFY ?auto_36936 ?auto_36937 ?auto_36938 ?auto_36935 ?auto_36939 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36947 - SURFACE
      ?auto_36948 - SURFACE
      ?auto_36949 - SURFACE
      ?auto_36946 - SURFACE
      ?auto_36950 - SURFACE
      ?auto_36951 - SURFACE
    )
    :vars
    (
      ?auto_36957 - HOIST
      ?auto_36952 - PLACE
      ?auto_36953 - PLACE
      ?auto_36956 - HOIST
      ?auto_36955 - SURFACE
      ?auto_36954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36957 ?auto_36952 ) ( IS-CRATE ?auto_36951 ) ( not ( = ?auto_36950 ?auto_36951 ) ) ( not ( = ?auto_36946 ?auto_36950 ) ) ( not ( = ?auto_36946 ?auto_36951 ) ) ( not ( = ?auto_36953 ?auto_36952 ) ) ( HOIST-AT ?auto_36956 ?auto_36953 ) ( not ( = ?auto_36957 ?auto_36956 ) ) ( SURFACE-AT ?auto_36951 ?auto_36953 ) ( ON ?auto_36951 ?auto_36955 ) ( CLEAR ?auto_36951 ) ( not ( = ?auto_36950 ?auto_36955 ) ) ( not ( = ?auto_36951 ?auto_36955 ) ) ( not ( = ?auto_36946 ?auto_36955 ) ) ( SURFACE-AT ?auto_36946 ?auto_36952 ) ( CLEAR ?auto_36946 ) ( IS-CRATE ?auto_36950 ) ( AVAILABLE ?auto_36957 ) ( TRUCK-AT ?auto_36954 ?auto_36953 ) ( LIFTING ?auto_36956 ?auto_36950 ) ( ON ?auto_36948 ?auto_36947 ) ( ON ?auto_36949 ?auto_36948 ) ( ON ?auto_36946 ?auto_36949 ) ( not ( = ?auto_36947 ?auto_36948 ) ) ( not ( = ?auto_36947 ?auto_36949 ) ) ( not ( = ?auto_36947 ?auto_36946 ) ) ( not ( = ?auto_36947 ?auto_36950 ) ) ( not ( = ?auto_36947 ?auto_36951 ) ) ( not ( = ?auto_36947 ?auto_36955 ) ) ( not ( = ?auto_36948 ?auto_36949 ) ) ( not ( = ?auto_36948 ?auto_36946 ) ) ( not ( = ?auto_36948 ?auto_36950 ) ) ( not ( = ?auto_36948 ?auto_36951 ) ) ( not ( = ?auto_36948 ?auto_36955 ) ) ( not ( = ?auto_36949 ?auto_36946 ) ) ( not ( = ?auto_36949 ?auto_36950 ) ) ( not ( = ?auto_36949 ?auto_36951 ) ) ( not ( = ?auto_36949 ?auto_36955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36946 ?auto_36950 ?auto_36951 )
      ( MAKE-5CRATE-VERIFY ?auto_36947 ?auto_36948 ?auto_36949 ?auto_36946 ?auto_36950 ?auto_36951 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36959 - SURFACE
      ?auto_36960 - SURFACE
      ?auto_36961 - SURFACE
      ?auto_36958 - SURFACE
      ?auto_36962 - SURFACE
      ?auto_36964 - SURFACE
      ?auto_36963 - SURFACE
    )
    :vars
    (
      ?auto_36970 - HOIST
      ?auto_36965 - PLACE
      ?auto_36966 - PLACE
      ?auto_36969 - HOIST
      ?auto_36968 - SURFACE
      ?auto_36967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36970 ?auto_36965 ) ( IS-CRATE ?auto_36963 ) ( not ( = ?auto_36964 ?auto_36963 ) ) ( not ( = ?auto_36962 ?auto_36964 ) ) ( not ( = ?auto_36962 ?auto_36963 ) ) ( not ( = ?auto_36966 ?auto_36965 ) ) ( HOIST-AT ?auto_36969 ?auto_36966 ) ( not ( = ?auto_36970 ?auto_36969 ) ) ( SURFACE-AT ?auto_36963 ?auto_36966 ) ( ON ?auto_36963 ?auto_36968 ) ( CLEAR ?auto_36963 ) ( not ( = ?auto_36964 ?auto_36968 ) ) ( not ( = ?auto_36963 ?auto_36968 ) ) ( not ( = ?auto_36962 ?auto_36968 ) ) ( SURFACE-AT ?auto_36962 ?auto_36965 ) ( CLEAR ?auto_36962 ) ( IS-CRATE ?auto_36964 ) ( AVAILABLE ?auto_36970 ) ( TRUCK-AT ?auto_36967 ?auto_36966 ) ( LIFTING ?auto_36969 ?auto_36964 ) ( ON ?auto_36960 ?auto_36959 ) ( ON ?auto_36961 ?auto_36960 ) ( ON ?auto_36958 ?auto_36961 ) ( ON ?auto_36962 ?auto_36958 ) ( not ( = ?auto_36959 ?auto_36960 ) ) ( not ( = ?auto_36959 ?auto_36961 ) ) ( not ( = ?auto_36959 ?auto_36958 ) ) ( not ( = ?auto_36959 ?auto_36962 ) ) ( not ( = ?auto_36959 ?auto_36964 ) ) ( not ( = ?auto_36959 ?auto_36963 ) ) ( not ( = ?auto_36959 ?auto_36968 ) ) ( not ( = ?auto_36960 ?auto_36961 ) ) ( not ( = ?auto_36960 ?auto_36958 ) ) ( not ( = ?auto_36960 ?auto_36962 ) ) ( not ( = ?auto_36960 ?auto_36964 ) ) ( not ( = ?auto_36960 ?auto_36963 ) ) ( not ( = ?auto_36960 ?auto_36968 ) ) ( not ( = ?auto_36961 ?auto_36958 ) ) ( not ( = ?auto_36961 ?auto_36962 ) ) ( not ( = ?auto_36961 ?auto_36964 ) ) ( not ( = ?auto_36961 ?auto_36963 ) ) ( not ( = ?auto_36961 ?auto_36968 ) ) ( not ( = ?auto_36958 ?auto_36962 ) ) ( not ( = ?auto_36958 ?auto_36964 ) ) ( not ( = ?auto_36958 ?auto_36963 ) ) ( not ( = ?auto_36958 ?auto_36968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36962 ?auto_36964 ?auto_36963 )
      ( MAKE-6CRATE-VERIFY ?auto_36959 ?auto_36960 ?auto_36961 ?auto_36958 ?auto_36962 ?auto_36964 ?auto_36963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36992 - SURFACE
      ?auto_36993 - SURFACE
      ?auto_36994 - SURFACE
      ?auto_36991 - SURFACE
    )
    :vars
    (
      ?auto_36999 - HOIST
      ?auto_36995 - PLACE
      ?auto_36997 - PLACE
      ?auto_37000 - HOIST
      ?auto_36996 - SURFACE
      ?auto_37001 - TRUCK
      ?auto_36998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36999 ?auto_36995 ) ( IS-CRATE ?auto_36991 ) ( not ( = ?auto_36994 ?auto_36991 ) ) ( not ( = ?auto_36993 ?auto_36994 ) ) ( not ( = ?auto_36993 ?auto_36991 ) ) ( not ( = ?auto_36997 ?auto_36995 ) ) ( HOIST-AT ?auto_37000 ?auto_36997 ) ( not ( = ?auto_36999 ?auto_37000 ) ) ( SURFACE-AT ?auto_36991 ?auto_36997 ) ( ON ?auto_36991 ?auto_36996 ) ( CLEAR ?auto_36991 ) ( not ( = ?auto_36994 ?auto_36996 ) ) ( not ( = ?auto_36991 ?auto_36996 ) ) ( not ( = ?auto_36993 ?auto_36996 ) ) ( SURFACE-AT ?auto_36993 ?auto_36995 ) ( CLEAR ?auto_36993 ) ( IS-CRATE ?auto_36994 ) ( AVAILABLE ?auto_36999 ) ( TRUCK-AT ?auto_37001 ?auto_36997 ) ( AVAILABLE ?auto_37000 ) ( SURFACE-AT ?auto_36994 ?auto_36997 ) ( ON ?auto_36994 ?auto_36998 ) ( CLEAR ?auto_36994 ) ( not ( = ?auto_36994 ?auto_36998 ) ) ( not ( = ?auto_36991 ?auto_36998 ) ) ( not ( = ?auto_36993 ?auto_36998 ) ) ( not ( = ?auto_36996 ?auto_36998 ) ) ( ON ?auto_36993 ?auto_36992 ) ( not ( = ?auto_36992 ?auto_36993 ) ) ( not ( = ?auto_36992 ?auto_36994 ) ) ( not ( = ?auto_36992 ?auto_36991 ) ) ( not ( = ?auto_36992 ?auto_36996 ) ) ( not ( = ?auto_36992 ?auto_36998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36993 ?auto_36994 ?auto_36991 )
      ( MAKE-3CRATE-VERIFY ?auto_36992 ?auto_36993 ?auto_36994 ?auto_36991 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_37003 - SURFACE
      ?auto_37004 - SURFACE
      ?auto_37005 - SURFACE
      ?auto_37002 - SURFACE
      ?auto_37006 - SURFACE
    )
    :vars
    (
      ?auto_37011 - HOIST
      ?auto_37007 - PLACE
      ?auto_37009 - PLACE
      ?auto_37012 - HOIST
      ?auto_37008 - SURFACE
      ?auto_37013 - TRUCK
      ?auto_37010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37011 ?auto_37007 ) ( IS-CRATE ?auto_37006 ) ( not ( = ?auto_37002 ?auto_37006 ) ) ( not ( = ?auto_37005 ?auto_37002 ) ) ( not ( = ?auto_37005 ?auto_37006 ) ) ( not ( = ?auto_37009 ?auto_37007 ) ) ( HOIST-AT ?auto_37012 ?auto_37009 ) ( not ( = ?auto_37011 ?auto_37012 ) ) ( SURFACE-AT ?auto_37006 ?auto_37009 ) ( ON ?auto_37006 ?auto_37008 ) ( CLEAR ?auto_37006 ) ( not ( = ?auto_37002 ?auto_37008 ) ) ( not ( = ?auto_37006 ?auto_37008 ) ) ( not ( = ?auto_37005 ?auto_37008 ) ) ( SURFACE-AT ?auto_37005 ?auto_37007 ) ( CLEAR ?auto_37005 ) ( IS-CRATE ?auto_37002 ) ( AVAILABLE ?auto_37011 ) ( TRUCK-AT ?auto_37013 ?auto_37009 ) ( AVAILABLE ?auto_37012 ) ( SURFACE-AT ?auto_37002 ?auto_37009 ) ( ON ?auto_37002 ?auto_37010 ) ( CLEAR ?auto_37002 ) ( not ( = ?auto_37002 ?auto_37010 ) ) ( not ( = ?auto_37006 ?auto_37010 ) ) ( not ( = ?auto_37005 ?auto_37010 ) ) ( not ( = ?auto_37008 ?auto_37010 ) ) ( ON ?auto_37004 ?auto_37003 ) ( ON ?auto_37005 ?auto_37004 ) ( not ( = ?auto_37003 ?auto_37004 ) ) ( not ( = ?auto_37003 ?auto_37005 ) ) ( not ( = ?auto_37003 ?auto_37002 ) ) ( not ( = ?auto_37003 ?auto_37006 ) ) ( not ( = ?auto_37003 ?auto_37008 ) ) ( not ( = ?auto_37003 ?auto_37010 ) ) ( not ( = ?auto_37004 ?auto_37005 ) ) ( not ( = ?auto_37004 ?auto_37002 ) ) ( not ( = ?auto_37004 ?auto_37006 ) ) ( not ( = ?auto_37004 ?auto_37008 ) ) ( not ( = ?auto_37004 ?auto_37010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37005 ?auto_37002 ?auto_37006 )
      ( MAKE-4CRATE-VERIFY ?auto_37003 ?auto_37004 ?auto_37005 ?auto_37002 ?auto_37006 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_37015 - SURFACE
      ?auto_37016 - SURFACE
      ?auto_37017 - SURFACE
      ?auto_37014 - SURFACE
      ?auto_37018 - SURFACE
      ?auto_37019 - SURFACE
    )
    :vars
    (
      ?auto_37024 - HOIST
      ?auto_37020 - PLACE
      ?auto_37022 - PLACE
      ?auto_37025 - HOIST
      ?auto_37021 - SURFACE
      ?auto_37026 - TRUCK
      ?auto_37023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37024 ?auto_37020 ) ( IS-CRATE ?auto_37019 ) ( not ( = ?auto_37018 ?auto_37019 ) ) ( not ( = ?auto_37014 ?auto_37018 ) ) ( not ( = ?auto_37014 ?auto_37019 ) ) ( not ( = ?auto_37022 ?auto_37020 ) ) ( HOIST-AT ?auto_37025 ?auto_37022 ) ( not ( = ?auto_37024 ?auto_37025 ) ) ( SURFACE-AT ?auto_37019 ?auto_37022 ) ( ON ?auto_37019 ?auto_37021 ) ( CLEAR ?auto_37019 ) ( not ( = ?auto_37018 ?auto_37021 ) ) ( not ( = ?auto_37019 ?auto_37021 ) ) ( not ( = ?auto_37014 ?auto_37021 ) ) ( SURFACE-AT ?auto_37014 ?auto_37020 ) ( CLEAR ?auto_37014 ) ( IS-CRATE ?auto_37018 ) ( AVAILABLE ?auto_37024 ) ( TRUCK-AT ?auto_37026 ?auto_37022 ) ( AVAILABLE ?auto_37025 ) ( SURFACE-AT ?auto_37018 ?auto_37022 ) ( ON ?auto_37018 ?auto_37023 ) ( CLEAR ?auto_37018 ) ( not ( = ?auto_37018 ?auto_37023 ) ) ( not ( = ?auto_37019 ?auto_37023 ) ) ( not ( = ?auto_37014 ?auto_37023 ) ) ( not ( = ?auto_37021 ?auto_37023 ) ) ( ON ?auto_37016 ?auto_37015 ) ( ON ?auto_37017 ?auto_37016 ) ( ON ?auto_37014 ?auto_37017 ) ( not ( = ?auto_37015 ?auto_37016 ) ) ( not ( = ?auto_37015 ?auto_37017 ) ) ( not ( = ?auto_37015 ?auto_37014 ) ) ( not ( = ?auto_37015 ?auto_37018 ) ) ( not ( = ?auto_37015 ?auto_37019 ) ) ( not ( = ?auto_37015 ?auto_37021 ) ) ( not ( = ?auto_37015 ?auto_37023 ) ) ( not ( = ?auto_37016 ?auto_37017 ) ) ( not ( = ?auto_37016 ?auto_37014 ) ) ( not ( = ?auto_37016 ?auto_37018 ) ) ( not ( = ?auto_37016 ?auto_37019 ) ) ( not ( = ?auto_37016 ?auto_37021 ) ) ( not ( = ?auto_37016 ?auto_37023 ) ) ( not ( = ?auto_37017 ?auto_37014 ) ) ( not ( = ?auto_37017 ?auto_37018 ) ) ( not ( = ?auto_37017 ?auto_37019 ) ) ( not ( = ?auto_37017 ?auto_37021 ) ) ( not ( = ?auto_37017 ?auto_37023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37014 ?auto_37018 ?auto_37019 )
      ( MAKE-5CRATE-VERIFY ?auto_37015 ?auto_37016 ?auto_37017 ?auto_37014 ?auto_37018 ?auto_37019 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_37028 - SURFACE
      ?auto_37029 - SURFACE
      ?auto_37030 - SURFACE
      ?auto_37027 - SURFACE
      ?auto_37031 - SURFACE
      ?auto_37033 - SURFACE
      ?auto_37032 - SURFACE
    )
    :vars
    (
      ?auto_37038 - HOIST
      ?auto_37034 - PLACE
      ?auto_37036 - PLACE
      ?auto_37039 - HOIST
      ?auto_37035 - SURFACE
      ?auto_37040 - TRUCK
      ?auto_37037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37038 ?auto_37034 ) ( IS-CRATE ?auto_37032 ) ( not ( = ?auto_37033 ?auto_37032 ) ) ( not ( = ?auto_37031 ?auto_37033 ) ) ( not ( = ?auto_37031 ?auto_37032 ) ) ( not ( = ?auto_37036 ?auto_37034 ) ) ( HOIST-AT ?auto_37039 ?auto_37036 ) ( not ( = ?auto_37038 ?auto_37039 ) ) ( SURFACE-AT ?auto_37032 ?auto_37036 ) ( ON ?auto_37032 ?auto_37035 ) ( CLEAR ?auto_37032 ) ( not ( = ?auto_37033 ?auto_37035 ) ) ( not ( = ?auto_37032 ?auto_37035 ) ) ( not ( = ?auto_37031 ?auto_37035 ) ) ( SURFACE-AT ?auto_37031 ?auto_37034 ) ( CLEAR ?auto_37031 ) ( IS-CRATE ?auto_37033 ) ( AVAILABLE ?auto_37038 ) ( TRUCK-AT ?auto_37040 ?auto_37036 ) ( AVAILABLE ?auto_37039 ) ( SURFACE-AT ?auto_37033 ?auto_37036 ) ( ON ?auto_37033 ?auto_37037 ) ( CLEAR ?auto_37033 ) ( not ( = ?auto_37033 ?auto_37037 ) ) ( not ( = ?auto_37032 ?auto_37037 ) ) ( not ( = ?auto_37031 ?auto_37037 ) ) ( not ( = ?auto_37035 ?auto_37037 ) ) ( ON ?auto_37029 ?auto_37028 ) ( ON ?auto_37030 ?auto_37029 ) ( ON ?auto_37027 ?auto_37030 ) ( ON ?auto_37031 ?auto_37027 ) ( not ( = ?auto_37028 ?auto_37029 ) ) ( not ( = ?auto_37028 ?auto_37030 ) ) ( not ( = ?auto_37028 ?auto_37027 ) ) ( not ( = ?auto_37028 ?auto_37031 ) ) ( not ( = ?auto_37028 ?auto_37033 ) ) ( not ( = ?auto_37028 ?auto_37032 ) ) ( not ( = ?auto_37028 ?auto_37035 ) ) ( not ( = ?auto_37028 ?auto_37037 ) ) ( not ( = ?auto_37029 ?auto_37030 ) ) ( not ( = ?auto_37029 ?auto_37027 ) ) ( not ( = ?auto_37029 ?auto_37031 ) ) ( not ( = ?auto_37029 ?auto_37033 ) ) ( not ( = ?auto_37029 ?auto_37032 ) ) ( not ( = ?auto_37029 ?auto_37035 ) ) ( not ( = ?auto_37029 ?auto_37037 ) ) ( not ( = ?auto_37030 ?auto_37027 ) ) ( not ( = ?auto_37030 ?auto_37031 ) ) ( not ( = ?auto_37030 ?auto_37033 ) ) ( not ( = ?auto_37030 ?auto_37032 ) ) ( not ( = ?auto_37030 ?auto_37035 ) ) ( not ( = ?auto_37030 ?auto_37037 ) ) ( not ( = ?auto_37027 ?auto_37031 ) ) ( not ( = ?auto_37027 ?auto_37033 ) ) ( not ( = ?auto_37027 ?auto_37032 ) ) ( not ( = ?auto_37027 ?auto_37035 ) ) ( not ( = ?auto_37027 ?auto_37037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37031 ?auto_37033 ?auto_37032 )
      ( MAKE-6CRATE-VERIFY ?auto_37028 ?auto_37029 ?auto_37030 ?auto_37027 ?auto_37031 ?auto_37033 ?auto_37032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_37062 - SURFACE
      ?auto_37063 - SURFACE
      ?auto_37064 - SURFACE
      ?auto_37061 - SURFACE
    )
    :vars
    (
      ?auto_37068 - HOIST
      ?auto_37066 - PLACE
      ?auto_37071 - PLACE
      ?auto_37070 - HOIST
      ?auto_37069 - SURFACE
      ?auto_37067 - SURFACE
      ?auto_37065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37068 ?auto_37066 ) ( IS-CRATE ?auto_37061 ) ( not ( = ?auto_37064 ?auto_37061 ) ) ( not ( = ?auto_37063 ?auto_37064 ) ) ( not ( = ?auto_37063 ?auto_37061 ) ) ( not ( = ?auto_37071 ?auto_37066 ) ) ( HOIST-AT ?auto_37070 ?auto_37071 ) ( not ( = ?auto_37068 ?auto_37070 ) ) ( SURFACE-AT ?auto_37061 ?auto_37071 ) ( ON ?auto_37061 ?auto_37069 ) ( CLEAR ?auto_37061 ) ( not ( = ?auto_37064 ?auto_37069 ) ) ( not ( = ?auto_37061 ?auto_37069 ) ) ( not ( = ?auto_37063 ?auto_37069 ) ) ( SURFACE-AT ?auto_37063 ?auto_37066 ) ( CLEAR ?auto_37063 ) ( IS-CRATE ?auto_37064 ) ( AVAILABLE ?auto_37068 ) ( AVAILABLE ?auto_37070 ) ( SURFACE-AT ?auto_37064 ?auto_37071 ) ( ON ?auto_37064 ?auto_37067 ) ( CLEAR ?auto_37064 ) ( not ( = ?auto_37064 ?auto_37067 ) ) ( not ( = ?auto_37061 ?auto_37067 ) ) ( not ( = ?auto_37063 ?auto_37067 ) ) ( not ( = ?auto_37069 ?auto_37067 ) ) ( TRUCK-AT ?auto_37065 ?auto_37066 ) ( ON ?auto_37063 ?auto_37062 ) ( not ( = ?auto_37062 ?auto_37063 ) ) ( not ( = ?auto_37062 ?auto_37064 ) ) ( not ( = ?auto_37062 ?auto_37061 ) ) ( not ( = ?auto_37062 ?auto_37069 ) ) ( not ( = ?auto_37062 ?auto_37067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37063 ?auto_37064 ?auto_37061 )
      ( MAKE-3CRATE-VERIFY ?auto_37062 ?auto_37063 ?auto_37064 ?auto_37061 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_37073 - SURFACE
      ?auto_37074 - SURFACE
      ?auto_37075 - SURFACE
      ?auto_37072 - SURFACE
      ?auto_37076 - SURFACE
    )
    :vars
    (
      ?auto_37080 - HOIST
      ?auto_37078 - PLACE
      ?auto_37083 - PLACE
      ?auto_37082 - HOIST
      ?auto_37081 - SURFACE
      ?auto_37079 - SURFACE
      ?auto_37077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37080 ?auto_37078 ) ( IS-CRATE ?auto_37076 ) ( not ( = ?auto_37072 ?auto_37076 ) ) ( not ( = ?auto_37075 ?auto_37072 ) ) ( not ( = ?auto_37075 ?auto_37076 ) ) ( not ( = ?auto_37083 ?auto_37078 ) ) ( HOIST-AT ?auto_37082 ?auto_37083 ) ( not ( = ?auto_37080 ?auto_37082 ) ) ( SURFACE-AT ?auto_37076 ?auto_37083 ) ( ON ?auto_37076 ?auto_37081 ) ( CLEAR ?auto_37076 ) ( not ( = ?auto_37072 ?auto_37081 ) ) ( not ( = ?auto_37076 ?auto_37081 ) ) ( not ( = ?auto_37075 ?auto_37081 ) ) ( SURFACE-AT ?auto_37075 ?auto_37078 ) ( CLEAR ?auto_37075 ) ( IS-CRATE ?auto_37072 ) ( AVAILABLE ?auto_37080 ) ( AVAILABLE ?auto_37082 ) ( SURFACE-AT ?auto_37072 ?auto_37083 ) ( ON ?auto_37072 ?auto_37079 ) ( CLEAR ?auto_37072 ) ( not ( = ?auto_37072 ?auto_37079 ) ) ( not ( = ?auto_37076 ?auto_37079 ) ) ( not ( = ?auto_37075 ?auto_37079 ) ) ( not ( = ?auto_37081 ?auto_37079 ) ) ( TRUCK-AT ?auto_37077 ?auto_37078 ) ( ON ?auto_37074 ?auto_37073 ) ( ON ?auto_37075 ?auto_37074 ) ( not ( = ?auto_37073 ?auto_37074 ) ) ( not ( = ?auto_37073 ?auto_37075 ) ) ( not ( = ?auto_37073 ?auto_37072 ) ) ( not ( = ?auto_37073 ?auto_37076 ) ) ( not ( = ?auto_37073 ?auto_37081 ) ) ( not ( = ?auto_37073 ?auto_37079 ) ) ( not ( = ?auto_37074 ?auto_37075 ) ) ( not ( = ?auto_37074 ?auto_37072 ) ) ( not ( = ?auto_37074 ?auto_37076 ) ) ( not ( = ?auto_37074 ?auto_37081 ) ) ( not ( = ?auto_37074 ?auto_37079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37075 ?auto_37072 ?auto_37076 )
      ( MAKE-4CRATE-VERIFY ?auto_37073 ?auto_37074 ?auto_37075 ?auto_37072 ?auto_37076 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_37085 - SURFACE
      ?auto_37086 - SURFACE
      ?auto_37087 - SURFACE
      ?auto_37084 - SURFACE
      ?auto_37088 - SURFACE
      ?auto_37089 - SURFACE
    )
    :vars
    (
      ?auto_37093 - HOIST
      ?auto_37091 - PLACE
      ?auto_37096 - PLACE
      ?auto_37095 - HOIST
      ?auto_37094 - SURFACE
      ?auto_37092 - SURFACE
      ?auto_37090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37093 ?auto_37091 ) ( IS-CRATE ?auto_37089 ) ( not ( = ?auto_37088 ?auto_37089 ) ) ( not ( = ?auto_37084 ?auto_37088 ) ) ( not ( = ?auto_37084 ?auto_37089 ) ) ( not ( = ?auto_37096 ?auto_37091 ) ) ( HOIST-AT ?auto_37095 ?auto_37096 ) ( not ( = ?auto_37093 ?auto_37095 ) ) ( SURFACE-AT ?auto_37089 ?auto_37096 ) ( ON ?auto_37089 ?auto_37094 ) ( CLEAR ?auto_37089 ) ( not ( = ?auto_37088 ?auto_37094 ) ) ( not ( = ?auto_37089 ?auto_37094 ) ) ( not ( = ?auto_37084 ?auto_37094 ) ) ( SURFACE-AT ?auto_37084 ?auto_37091 ) ( CLEAR ?auto_37084 ) ( IS-CRATE ?auto_37088 ) ( AVAILABLE ?auto_37093 ) ( AVAILABLE ?auto_37095 ) ( SURFACE-AT ?auto_37088 ?auto_37096 ) ( ON ?auto_37088 ?auto_37092 ) ( CLEAR ?auto_37088 ) ( not ( = ?auto_37088 ?auto_37092 ) ) ( not ( = ?auto_37089 ?auto_37092 ) ) ( not ( = ?auto_37084 ?auto_37092 ) ) ( not ( = ?auto_37094 ?auto_37092 ) ) ( TRUCK-AT ?auto_37090 ?auto_37091 ) ( ON ?auto_37086 ?auto_37085 ) ( ON ?auto_37087 ?auto_37086 ) ( ON ?auto_37084 ?auto_37087 ) ( not ( = ?auto_37085 ?auto_37086 ) ) ( not ( = ?auto_37085 ?auto_37087 ) ) ( not ( = ?auto_37085 ?auto_37084 ) ) ( not ( = ?auto_37085 ?auto_37088 ) ) ( not ( = ?auto_37085 ?auto_37089 ) ) ( not ( = ?auto_37085 ?auto_37094 ) ) ( not ( = ?auto_37085 ?auto_37092 ) ) ( not ( = ?auto_37086 ?auto_37087 ) ) ( not ( = ?auto_37086 ?auto_37084 ) ) ( not ( = ?auto_37086 ?auto_37088 ) ) ( not ( = ?auto_37086 ?auto_37089 ) ) ( not ( = ?auto_37086 ?auto_37094 ) ) ( not ( = ?auto_37086 ?auto_37092 ) ) ( not ( = ?auto_37087 ?auto_37084 ) ) ( not ( = ?auto_37087 ?auto_37088 ) ) ( not ( = ?auto_37087 ?auto_37089 ) ) ( not ( = ?auto_37087 ?auto_37094 ) ) ( not ( = ?auto_37087 ?auto_37092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37084 ?auto_37088 ?auto_37089 )
      ( MAKE-5CRATE-VERIFY ?auto_37085 ?auto_37086 ?auto_37087 ?auto_37084 ?auto_37088 ?auto_37089 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_37098 - SURFACE
      ?auto_37099 - SURFACE
      ?auto_37100 - SURFACE
      ?auto_37097 - SURFACE
      ?auto_37101 - SURFACE
      ?auto_37103 - SURFACE
      ?auto_37102 - SURFACE
    )
    :vars
    (
      ?auto_37107 - HOIST
      ?auto_37105 - PLACE
      ?auto_37110 - PLACE
      ?auto_37109 - HOIST
      ?auto_37108 - SURFACE
      ?auto_37106 - SURFACE
      ?auto_37104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37107 ?auto_37105 ) ( IS-CRATE ?auto_37102 ) ( not ( = ?auto_37103 ?auto_37102 ) ) ( not ( = ?auto_37101 ?auto_37103 ) ) ( not ( = ?auto_37101 ?auto_37102 ) ) ( not ( = ?auto_37110 ?auto_37105 ) ) ( HOIST-AT ?auto_37109 ?auto_37110 ) ( not ( = ?auto_37107 ?auto_37109 ) ) ( SURFACE-AT ?auto_37102 ?auto_37110 ) ( ON ?auto_37102 ?auto_37108 ) ( CLEAR ?auto_37102 ) ( not ( = ?auto_37103 ?auto_37108 ) ) ( not ( = ?auto_37102 ?auto_37108 ) ) ( not ( = ?auto_37101 ?auto_37108 ) ) ( SURFACE-AT ?auto_37101 ?auto_37105 ) ( CLEAR ?auto_37101 ) ( IS-CRATE ?auto_37103 ) ( AVAILABLE ?auto_37107 ) ( AVAILABLE ?auto_37109 ) ( SURFACE-AT ?auto_37103 ?auto_37110 ) ( ON ?auto_37103 ?auto_37106 ) ( CLEAR ?auto_37103 ) ( not ( = ?auto_37103 ?auto_37106 ) ) ( not ( = ?auto_37102 ?auto_37106 ) ) ( not ( = ?auto_37101 ?auto_37106 ) ) ( not ( = ?auto_37108 ?auto_37106 ) ) ( TRUCK-AT ?auto_37104 ?auto_37105 ) ( ON ?auto_37099 ?auto_37098 ) ( ON ?auto_37100 ?auto_37099 ) ( ON ?auto_37097 ?auto_37100 ) ( ON ?auto_37101 ?auto_37097 ) ( not ( = ?auto_37098 ?auto_37099 ) ) ( not ( = ?auto_37098 ?auto_37100 ) ) ( not ( = ?auto_37098 ?auto_37097 ) ) ( not ( = ?auto_37098 ?auto_37101 ) ) ( not ( = ?auto_37098 ?auto_37103 ) ) ( not ( = ?auto_37098 ?auto_37102 ) ) ( not ( = ?auto_37098 ?auto_37108 ) ) ( not ( = ?auto_37098 ?auto_37106 ) ) ( not ( = ?auto_37099 ?auto_37100 ) ) ( not ( = ?auto_37099 ?auto_37097 ) ) ( not ( = ?auto_37099 ?auto_37101 ) ) ( not ( = ?auto_37099 ?auto_37103 ) ) ( not ( = ?auto_37099 ?auto_37102 ) ) ( not ( = ?auto_37099 ?auto_37108 ) ) ( not ( = ?auto_37099 ?auto_37106 ) ) ( not ( = ?auto_37100 ?auto_37097 ) ) ( not ( = ?auto_37100 ?auto_37101 ) ) ( not ( = ?auto_37100 ?auto_37103 ) ) ( not ( = ?auto_37100 ?auto_37102 ) ) ( not ( = ?auto_37100 ?auto_37108 ) ) ( not ( = ?auto_37100 ?auto_37106 ) ) ( not ( = ?auto_37097 ?auto_37101 ) ) ( not ( = ?auto_37097 ?auto_37103 ) ) ( not ( = ?auto_37097 ?auto_37102 ) ) ( not ( = ?auto_37097 ?auto_37108 ) ) ( not ( = ?auto_37097 ?auto_37106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37101 ?auto_37103 ?auto_37102 )
      ( MAKE-6CRATE-VERIFY ?auto_37098 ?auto_37099 ?auto_37100 ?auto_37097 ?auto_37101 ?auto_37103 ?auto_37102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_37111 - SURFACE
      ?auto_37112 - SURFACE
    )
    :vars
    (
      ?auto_37117 - HOIST
      ?auto_37114 - PLACE
      ?auto_37116 - SURFACE
      ?auto_37120 - PLACE
      ?auto_37119 - HOIST
      ?auto_37118 - SURFACE
      ?auto_37115 - SURFACE
      ?auto_37113 - TRUCK
      ?auto_37121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37117 ?auto_37114 ) ( IS-CRATE ?auto_37112 ) ( not ( = ?auto_37111 ?auto_37112 ) ) ( not ( = ?auto_37116 ?auto_37111 ) ) ( not ( = ?auto_37116 ?auto_37112 ) ) ( not ( = ?auto_37120 ?auto_37114 ) ) ( HOIST-AT ?auto_37119 ?auto_37120 ) ( not ( = ?auto_37117 ?auto_37119 ) ) ( SURFACE-AT ?auto_37112 ?auto_37120 ) ( ON ?auto_37112 ?auto_37118 ) ( CLEAR ?auto_37112 ) ( not ( = ?auto_37111 ?auto_37118 ) ) ( not ( = ?auto_37112 ?auto_37118 ) ) ( not ( = ?auto_37116 ?auto_37118 ) ) ( IS-CRATE ?auto_37111 ) ( AVAILABLE ?auto_37119 ) ( SURFACE-AT ?auto_37111 ?auto_37120 ) ( ON ?auto_37111 ?auto_37115 ) ( CLEAR ?auto_37111 ) ( not ( = ?auto_37111 ?auto_37115 ) ) ( not ( = ?auto_37112 ?auto_37115 ) ) ( not ( = ?auto_37116 ?auto_37115 ) ) ( not ( = ?auto_37118 ?auto_37115 ) ) ( TRUCK-AT ?auto_37113 ?auto_37114 ) ( SURFACE-AT ?auto_37121 ?auto_37114 ) ( CLEAR ?auto_37121 ) ( LIFTING ?auto_37117 ?auto_37116 ) ( IS-CRATE ?auto_37116 ) ( not ( = ?auto_37121 ?auto_37116 ) ) ( not ( = ?auto_37111 ?auto_37121 ) ) ( not ( = ?auto_37112 ?auto_37121 ) ) ( not ( = ?auto_37118 ?auto_37121 ) ) ( not ( = ?auto_37115 ?auto_37121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_37121 ?auto_37116 )
      ( MAKE-2CRATE ?auto_37116 ?auto_37111 ?auto_37112 )
      ( MAKE-1CRATE-VERIFY ?auto_37111 ?auto_37112 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_37122 - SURFACE
      ?auto_37123 - SURFACE
      ?auto_37124 - SURFACE
    )
    :vars
    (
      ?auto_37132 - HOIST
      ?auto_37128 - PLACE
      ?auto_37125 - PLACE
      ?auto_37126 - HOIST
      ?auto_37129 - SURFACE
      ?auto_37130 - SURFACE
      ?auto_37131 - TRUCK
      ?auto_37127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37132 ?auto_37128 ) ( IS-CRATE ?auto_37124 ) ( not ( = ?auto_37123 ?auto_37124 ) ) ( not ( = ?auto_37122 ?auto_37123 ) ) ( not ( = ?auto_37122 ?auto_37124 ) ) ( not ( = ?auto_37125 ?auto_37128 ) ) ( HOIST-AT ?auto_37126 ?auto_37125 ) ( not ( = ?auto_37132 ?auto_37126 ) ) ( SURFACE-AT ?auto_37124 ?auto_37125 ) ( ON ?auto_37124 ?auto_37129 ) ( CLEAR ?auto_37124 ) ( not ( = ?auto_37123 ?auto_37129 ) ) ( not ( = ?auto_37124 ?auto_37129 ) ) ( not ( = ?auto_37122 ?auto_37129 ) ) ( IS-CRATE ?auto_37123 ) ( AVAILABLE ?auto_37126 ) ( SURFACE-AT ?auto_37123 ?auto_37125 ) ( ON ?auto_37123 ?auto_37130 ) ( CLEAR ?auto_37123 ) ( not ( = ?auto_37123 ?auto_37130 ) ) ( not ( = ?auto_37124 ?auto_37130 ) ) ( not ( = ?auto_37122 ?auto_37130 ) ) ( not ( = ?auto_37129 ?auto_37130 ) ) ( TRUCK-AT ?auto_37131 ?auto_37128 ) ( SURFACE-AT ?auto_37127 ?auto_37128 ) ( CLEAR ?auto_37127 ) ( LIFTING ?auto_37132 ?auto_37122 ) ( IS-CRATE ?auto_37122 ) ( not ( = ?auto_37127 ?auto_37122 ) ) ( not ( = ?auto_37123 ?auto_37127 ) ) ( not ( = ?auto_37124 ?auto_37127 ) ) ( not ( = ?auto_37129 ?auto_37127 ) ) ( not ( = ?auto_37130 ?auto_37127 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_37123 ?auto_37124 )
      ( MAKE-2CRATE-VERIFY ?auto_37122 ?auto_37123 ?auto_37124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_37134 - SURFACE
      ?auto_37135 - SURFACE
      ?auto_37136 - SURFACE
      ?auto_37133 - SURFACE
    )
    :vars
    (
      ?auto_37140 - HOIST
      ?auto_37137 - PLACE
      ?auto_37138 - PLACE
      ?auto_37139 - HOIST
      ?auto_37142 - SURFACE
      ?auto_37143 - SURFACE
      ?auto_37141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37140 ?auto_37137 ) ( IS-CRATE ?auto_37133 ) ( not ( = ?auto_37136 ?auto_37133 ) ) ( not ( = ?auto_37135 ?auto_37136 ) ) ( not ( = ?auto_37135 ?auto_37133 ) ) ( not ( = ?auto_37138 ?auto_37137 ) ) ( HOIST-AT ?auto_37139 ?auto_37138 ) ( not ( = ?auto_37140 ?auto_37139 ) ) ( SURFACE-AT ?auto_37133 ?auto_37138 ) ( ON ?auto_37133 ?auto_37142 ) ( CLEAR ?auto_37133 ) ( not ( = ?auto_37136 ?auto_37142 ) ) ( not ( = ?auto_37133 ?auto_37142 ) ) ( not ( = ?auto_37135 ?auto_37142 ) ) ( IS-CRATE ?auto_37136 ) ( AVAILABLE ?auto_37139 ) ( SURFACE-AT ?auto_37136 ?auto_37138 ) ( ON ?auto_37136 ?auto_37143 ) ( CLEAR ?auto_37136 ) ( not ( = ?auto_37136 ?auto_37143 ) ) ( not ( = ?auto_37133 ?auto_37143 ) ) ( not ( = ?auto_37135 ?auto_37143 ) ) ( not ( = ?auto_37142 ?auto_37143 ) ) ( TRUCK-AT ?auto_37141 ?auto_37137 ) ( SURFACE-AT ?auto_37134 ?auto_37137 ) ( CLEAR ?auto_37134 ) ( LIFTING ?auto_37140 ?auto_37135 ) ( IS-CRATE ?auto_37135 ) ( not ( = ?auto_37134 ?auto_37135 ) ) ( not ( = ?auto_37136 ?auto_37134 ) ) ( not ( = ?auto_37133 ?auto_37134 ) ) ( not ( = ?auto_37142 ?auto_37134 ) ) ( not ( = ?auto_37143 ?auto_37134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37135 ?auto_37136 ?auto_37133 )
      ( MAKE-3CRATE-VERIFY ?auto_37134 ?auto_37135 ?auto_37136 ?auto_37133 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_37145 - SURFACE
      ?auto_37146 - SURFACE
      ?auto_37147 - SURFACE
      ?auto_37144 - SURFACE
      ?auto_37148 - SURFACE
    )
    :vars
    (
      ?auto_37152 - HOIST
      ?auto_37149 - PLACE
      ?auto_37150 - PLACE
      ?auto_37151 - HOIST
      ?auto_37154 - SURFACE
      ?auto_37155 - SURFACE
      ?auto_37153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37152 ?auto_37149 ) ( IS-CRATE ?auto_37148 ) ( not ( = ?auto_37144 ?auto_37148 ) ) ( not ( = ?auto_37147 ?auto_37144 ) ) ( not ( = ?auto_37147 ?auto_37148 ) ) ( not ( = ?auto_37150 ?auto_37149 ) ) ( HOIST-AT ?auto_37151 ?auto_37150 ) ( not ( = ?auto_37152 ?auto_37151 ) ) ( SURFACE-AT ?auto_37148 ?auto_37150 ) ( ON ?auto_37148 ?auto_37154 ) ( CLEAR ?auto_37148 ) ( not ( = ?auto_37144 ?auto_37154 ) ) ( not ( = ?auto_37148 ?auto_37154 ) ) ( not ( = ?auto_37147 ?auto_37154 ) ) ( IS-CRATE ?auto_37144 ) ( AVAILABLE ?auto_37151 ) ( SURFACE-AT ?auto_37144 ?auto_37150 ) ( ON ?auto_37144 ?auto_37155 ) ( CLEAR ?auto_37144 ) ( not ( = ?auto_37144 ?auto_37155 ) ) ( not ( = ?auto_37148 ?auto_37155 ) ) ( not ( = ?auto_37147 ?auto_37155 ) ) ( not ( = ?auto_37154 ?auto_37155 ) ) ( TRUCK-AT ?auto_37153 ?auto_37149 ) ( SURFACE-AT ?auto_37146 ?auto_37149 ) ( CLEAR ?auto_37146 ) ( LIFTING ?auto_37152 ?auto_37147 ) ( IS-CRATE ?auto_37147 ) ( not ( = ?auto_37146 ?auto_37147 ) ) ( not ( = ?auto_37144 ?auto_37146 ) ) ( not ( = ?auto_37148 ?auto_37146 ) ) ( not ( = ?auto_37154 ?auto_37146 ) ) ( not ( = ?auto_37155 ?auto_37146 ) ) ( ON ?auto_37146 ?auto_37145 ) ( not ( = ?auto_37145 ?auto_37146 ) ) ( not ( = ?auto_37145 ?auto_37147 ) ) ( not ( = ?auto_37145 ?auto_37144 ) ) ( not ( = ?auto_37145 ?auto_37148 ) ) ( not ( = ?auto_37145 ?auto_37154 ) ) ( not ( = ?auto_37145 ?auto_37155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37147 ?auto_37144 ?auto_37148 )
      ( MAKE-4CRATE-VERIFY ?auto_37145 ?auto_37146 ?auto_37147 ?auto_37144 ?auto_37148 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_37157 - SURFACE
      ?auto_37158 - SURFACE
      ?auto_37159 - SURFACE
      ?auto_37156 - SURFACE
      ?auto_37160 - SURFACE
      ?auto_37161 - SURFACE
    )
    :vars
    (
      ?auto_37165 - HOIST
      ?auto_37162 - PLACE
      ?auto_37163 - PLACE
      ?auto_37164 - HOIST
      ?auto_37167 - SURFACE
      ?auto_37168 - SURFACE
      ?auto_37166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37165 ?auto_37162 ) ( IS-CRATE ?auto_37161 ) ( not ( = ?auto_37160 ?auto_37161 ) ) ( not ( = ?auto_37156 ?auto_37160 ) ) ( not ( = ?auto_37156 ?auto_37161 ) ) ( not ( = ?auto_37163 ?auto_37162 ) ) ( HOIST-AT ?auto_37164 ?auto_37163 ) ( not ( = ?auto_37165 ?auto_37164 ) ) ( SURFACE-AT ?auto_37161 ?auto_37163 ) ( ON ?auto_37161 ?auto_37167 ) ( CLEAR ?auto_37161 ) ( not ( = ?auto_37160 ?auto_37167 ) ) ( not ( = ?auto_37161 ?auto_37167 ) ) ( not ( = ?auto_37156 ?auto_37167 ) ) ( IS-CRATE ?auto_37160 ) ( AVAILABLE ?auto_37164 ) ( SURFACE-AT ?auto_37160 ?auto_37163 ) ( ON ?auto_37160 ?auto_37168 ) ( CLEAR ?auto_37160 ) ( not ( = ?auto_37160 ?auto_37168 ) ) ( not ( = ?auto_37161 ?auto_37168 ) ) ( not ( = ?auto_37156 ?auto_37168 ) ) ( not ( = ?auto_37167 ?auto_37168 ) ) ( TRUCK-AT ?auto_37166 ?auto_37162 ) ( SURFACE-AT ?auto_37159 ?auto_37162 ) ( CLEAR ?auto_37159 ) ( LIFTING ?auto_37165 ?auto_37156 ) ( IS-CRATE ?auto_37156 ) ( not ( = ?auto_37159 ?auto_37156 ) ) ( not ( = ?auto_37160 ?auto_37159 ) ) ( not ( = ?auto_37161 ?auto_37159 ) ) ( not ( = ?auto_37167 ?auto_37159 ) ) ( not ( = ?auto_37168 ?auto_37159 ) ) ( ON ?auto_37158 ?auto_37157 ) ( ON ?auto_37159 ?auto_37158 ) ( not ( = ?auto_37157 ?auto_37158 ) ) ( not ( = ?auto_37157 ?auto_37159 ) ) ( not ( = ?auto_37157 ?auto_37156 ) ) ( not ( = ?auto_37157 ?auto_37160 ) ) ( not ( = ?auto_37157 ?auto_37161 ) ) ( not ( = ?auto_37157 ?auto_37167 ) ) ( not ( = ?auto_37157 ?auto_37168 ) ) ( not ( = ?auto_37158 ?auto_37159 ) ) ( not ( = ?auto_37158 ?auto_37156 ) ) ( not ( = ?auto_37158 ?auto_37160 ) ) ( not ( = ?auto_37158 ?auto_37161 ) ) ( not ( = ?auto_37158 ?auto_37167 ) ) ( not ( = ?auto_37158 ?auto_37168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37156 ?auto_37160 ?auto_37161 )
      ( MAKE-5CRATE-VERIFY ?auto_37157 ?auto_37158 ?auto_37159 ?auto_37156 ?auto_37160 ?auto_37161 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_37170 - SURFACE
      ?auto_37171 - SURFACE
      ?auto_37172 - SURFACE
      ?auto_37169 - SURFACE
      ?auto_37173 - SURFACE
      ?auto_37175 - SURFACE
      ?auto_37174 - SURFACE
    )
    :vars
    (
      ?auto_37179 - HOIST
      ?auto_37176 - PLACE
      ?auto_37177 - PLACE
      ?auto_37178 - HOIST
      ?auto_37181 - SURFACE
      ?auto_37182 - SURFACE
      ?auto_37180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37179 ?auto_37176 ) ( IS-CRATE ?auto_37174 ) ( not ( = ?auto_37175 ?auto_37174 ) ) ( not ( = ?auto_37173 ?auto_37175 ) ) ( not ( = ?auto_37173 ?auto_37174 ) ) ( not ( = ?auto_37177 ?auto_37176 ) ) ( HOIST-AT ?auto_37178 ?auto_37177 ) ( not ( = ?auto_37179 ?auto_37178 ) ) ( SURFACE-AT ?auto_37174 ?auto_37177 ) ( ON ?auto_37174 ?auto_37181 ) ( CLEAR ?auto_37174 ) ( not ( = ?auto_37175 ?auto_37181 ) ) ( not ( = ?auto_37174 ?auto_37181 ) ) ( not ( = ?auto_37173 ?auto_37181 ) ) ( IS-CRATE ?auto_37175 ) ( AVAILABLE ?auto_37178 ) ( SURFACE-AT ?auto_37175 ?auto_37177 ) ( ON ?auto_37175 ?auto_37182 ) ( CLEAR ?auto_37175 ) ( not ( = ?auto_37175 ?auto_37182 ) ) ( not ( = ?auto_37174 ?auto_37182 ) ) ( not ( = ?auto_37173 ?auto_37182 ) ) ( not ( = ?auto_37181 ?auto_37182 ) ) ( TRUCK-AT ?auto_37180 ?auto_37176 ) ( SURFACE-AT ?auto_37169 ?auto_37176 ) ( CLEAR ?auto_37169 ) ( LIFTING ?auto_37179 ?auto_37173 ) ( IS-CRATE ?auto_37173 ) ( not ( = ?auto_37169 ?auto_37173 ) ) ( not ( = ?auto_37175 ?auto_37169 ) ) ( not ( = ?auto_37174 ?auto_37169 ) ) ( not ( = ?auto_37181 ?auto_37169 ) ) ( not ( = ?auto_37182 ?auto_37169 ) ) ( ON ?auto_37171 ?auto_37170 ) ( ON ?auto_37172 ?auto_37171 ) ( ON ?auto_37169 ?auto_37172 ) ( not ( = ?auto_37170 ?auto_37171 ) ) ( not ( = ?auto_37170 ?auto_37172 ) ) ( not ( = ?auto_37170 ?auto_37169 ) ) ( not ( = ?auto_37170 ?auto_37173 ) ) ( not ( = ?auto_37170 ?auto_37175 ) ) ( not ( = ?auto_37170 ?auto_37174 ) ) ( not ( = ?auto_37170 ?auto_37181 ) ) ( not ( = ?auto_37170 ?auto_37182 ) ) ( not ( = ?auto_37171 ?auto_37172 ) ) ( not ( = ?auto_37171 ?auto_37169 ) ) ( not ( = ?auto_37171 ?auto_37173 ) ) ( not ( = ?auto_37171 ?auto_37175 ) ) ( not ( = ?auto_37171 ?auto_37174 ) ) ( not ( = ?auto_37171 ?auto_37181 ) ) ( not ( = ?auto_37171 ?auto_37182 ) ) ( not ( = ?auto_37172 ?auto_37169 ) ) ( not ( = ?auto_37172 ?auto_37173 ) ) ( not ( = ?auto_37172 ?auto_37175 ) ) ( not ( = ?auto_37172 ?auto_37174 ) ) ( not ( = ?auto_37172 ?auto_37181 ) ) ( not ( = ?auto_37172 ?auto_37182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_37173 ?auto_37175 ?auto_37174 )
      ( MAKE-6CRATE-VERIFY ?auto_37170 ?auto_37171 ?auto_37172 ?auto_37169 ?auto_37173 ?auto_37175 ?auto_37174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_37674 - SURFACE
      ?auto_37675 - SURFACE
    )
    :vars
    (
      ?auto_37683 - HOIST
      ?auto_37679 - PLACE
      ?auto_37681 - SURFACE
      ?auto_37678 - PLACE
      ?auto_37676 - HOIST
      ?auto_37680 - SURFACE
      ?auto_37677 - TRUCK
      ?auto_37682 - SURFACE
      ?auto_37684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37683 ?auto_37679 ) ( IS-CRATE ?auto_37675 ) ( not ( = ?auto_37674 ?auto_37675 ) ) ( not ( = ?auto_37681 ?auto_37674 ) ) ( not ( = ?auto_37681 ?auto_37675 ) ) ( not ( = ?auto_37678 ?auto_37679 ) ) ( HOIST-AT ?auto_37676 ?auto_37678 ) ( not ( = ?auto_37683 ?auto_37676 ) ) ( SURFACE-AT ?auto_37675 ?auto_37678 ) ( ON ?auto_37675 ?auto_37680 ) ( CLEAR ?auto_37675 ) ( not ( = ?auto_37674 ?auto_37680 ) ) ( not ( = ?auto_37675 ?auto_37680 ) ) ( not ( = ?auto_37681 ?auto_37680 ) ) ( SURFACE-AT ?auto_37681 ?auto_37679 ) ( CLEAR ?auto_37681 ) ( IS-CRATE ?auto_37674 ) ( AVAILABLE ?auto_37683 ) ( TRUCK-AT ?auto_37677 ?auto_37678 ) ( SURFACE-AT ?auto_37674 ?auto_37678 ) ( ON ?auto_37674 ?auto_37682 ) ( CLEAR ?auto_37674 ) ( not ( = ?auto_37674 ?auto_37682 ) ) ( not ( = ?auto_37675 ?auto_37682 ) ) ( not ( = ?auto_37681 ?auto_37682 ) ) ( not ( = ?auto_37680 ?auto_37682 ) ) ( LIFTING ?auto_37676 ?auto_37684 ) ( IS-CRATE ?auto_37684 ) ( not ( = ?auto_37674 ?auto_37684 ) ) ( not ( = ?auto_37675 ?auto_37684 ) ) ( not ( = ?auto_37681 ?auto_37684 ) ) ( not ( = ?auto_37680 ?auto_37684 ) ) ( not ( = ?auto_37682 ?auto_37684 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37676 ?auto_37684 ?auto_37677 ?auto_37678 )
      ( MAKE-2CRATE ?auto_37681 ?auto_37674 ?auto_37675 )
      ( MAKE-1CRATE-VERIFY ?auto_37674 ?auto_37675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_37685 - SURFACE
      ?auto_37686 - SURFACE
      ?auto_37687 - SURFACE
    )
    :vars
    (
      ?auto_37688 - HOIST
      ?auto_37695 - PLACE
      ?auto_37692 - PLACE
      ?auto_37690 - HOIST
      ?auto_37693 - SURFACE
      ?auto_37689 - TRUCK
      ?auto_37694 - SURFACE
      ?auto_37691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37688 ?auto_37695 ) ( IS-CRATE ?auto_37687 ) ( not ( = ?auto_37686 ?auto_37687 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37687 ) ) ( not ( = ?auto_37692 ?auto_37695 ) ) ( HOIST-AT ?auto_37690 ?auto_37692 ) ( not ( = ?auto_37688 ?auto_37690 ) ) ( SURFACE-AT ?auto_37687 ?auto_37692 ) ( ON ?auto_37687 ?auto_37693 ) ( CLEAR ?auto_37687 ) ( not ( = ?auto_37686 ?auto_37693 ) ) ( not ( = ?auto_37687 ?auto_37693 ) ) ( not ( = ?auto_37685 ?auto_37693 ) ) ( SURFACE-AT ?auto_37685 ?auto_37695 ) ( CLEAR ?auto_37685 ) ( IS-CRATE ?auto_37686 ) ( AVAILABLE ?auto_37688 ) ( TRUCK-AT ?auto_37689 ?auto_37692 ) ( SURFACE-AT ?auto_37686 ?auto_37692 ) ( ON ?auto_37686 ?auto_37694 ) ( CLEAR ?auto_37686 ) ( not ( = ?auto_37686 ?auto_37694 ) ) ( not ( = ?auto_37687 ?auto_37694 ) ) ( not ( = ?auto_37685 ?auto_37694 ) ) ( not ( = ?auto_37693 ?auto_37694 ) ) ( LIFTING ?auto_37690 ?auto_37691 ) ( IS-CRATE ?auto_37691 ) ( not ( = ?auto_37686 ?auto_37691 ) ) ( not ( = ?auto_37687 ?auto_37691 ) ) ( not ( = ?auto_37685 ?auto_37691 ) ) ( not ( = ?auto_37693 ?auto_37691 ) ) ( not ( = ?auto_37694 ?auto_37691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_37686 ?auto_37687 )
      ( MAKE-2CRATE-VERIFY ?auto_37685 ?auto_37686 ?auto_37687 ) )
  )

)

