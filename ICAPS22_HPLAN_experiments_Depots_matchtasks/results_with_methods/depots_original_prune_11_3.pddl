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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517291 - SURFACE
      ?auto_517292 - SURFACE
    )
    :vars
    (
      ?auto_517293 - HOIST
      ?auto_517294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517293 ?auto_517294 ) ( SURFACE-AT ?auto_517291 ?auto_517294 ) ( CLEAR ?auto_517291 ) ( LIFTING ?auto_517293 ?auto_517292 ) ( IS-CRATE ?auto_517292 ) ( not ( = ?auto_517291 ?auto_517292 ) ) )
    :subtasks
    ( ( !DROP ?auto_517293 ?auto_517292 ?auto_517291 ?auto_517294 )
      ( MAKE-1CRATE-VERIFY ?auto_517291 ?auto_517292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517295 - SURFACE
      ?auto_517296 - SURFACE
    )
    :vars
    (
      ?auto_517297 - HOIST
      ?auto_517298 - PLACE
      ?auto_517299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517297 ?auto_517298 ) ( SURFACE-AT ?auto_517295 ?auto_517298 ) ( CLEAR ?auto_517295 ) ( IS-CRATE ?auto_517296 ) ( not ( = ?auto_517295 ?auto_517296 ) ) ( TRUCK-AT ?auto_517299 ?auto_517298 ) ( AVAILABLE ?auto_517297 ) ( IN ?auto_517296 ?auto_517299 ) )
    :subtasks
    ( ( !UNLOAD ?auto_517297 ?auto_517296 ?auto_517299 ?auto_517298 )
      ( MAKE-1CRATE ?auto_517295 ?auto_517296 )
      ( MAKE-1CRATE-VERIFY ?auto_517295 ?auto_517296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517300 - SURFACE
      ?auto_517301 - SURFACE
    )
    :vars
    (
      ?auto_517304 - HOIST
      ?auto_517303 - PLACE
      ?auto_517302 - TRUCK
      ?auto_517305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517304 ?auto_517303 ) ( SURFACE-AT ?auto_517300 ?auto_517303 ) ( CLEAR ?auto_517300 ) ( IS-CRATE ?auto_517301 ) ( not ( = ?auto_517300 ?auto_517301 ) ) ( AVAILABLE ?auto_517304 ) ( IN ?auto_517301 ?auto_517302 ) ( TRUCK-AT ?auto_517302 ?auto_517305 ) ( not ( = ?auto_517305 ?auto_517303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517302 ?auto_517305 ?auto_517303 )
      ( MAKE-1CRATE ?auto_517300 ?auto_517301 )
      ( MAKE-1CRATE-VERIFY ?auto_517300 ?auto_517301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517306 - SURFACE
      ?auto_517307 - SURFACE
    )
    :vars
    (
      ?auto_517309 - HOIST
      ?auto_517308 - PLACE
      ?auto_517310 - TRUCK
      ?auto_517311 - PLACE
      ?auto_517312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517309 ?auto_517308 ) ( SURFACE-AT ?auto_517306 ?auto_517308 ) ( CLEAR ?auto_517306 ) ( IS-CRATE ?auto_517307 ) ( not ( = ?auto_517306 ?auto_517307 ) ) ( AVAILABLE ?auto_517309 ) ( TRUCK-AT ?auto_517310 ?auto_517311 ) ( not ( = ?auto_517311 ?auto_517308 ) ) ( HOIST-AT ?auto_517312 ?auto_517311 ) ( LIFTING ?auto_517312 ?auto_517307 ) ( not ( = ?auto_517309 ?auto_517312 ) ) )
    :subtasks
    ( ( !LOAD ?auto_517312 ?auto_517307 ?auto_517310 ?auto_517311 )
      ( MAKE-1CRATE ?auto_517306 ?auto_517307 )
      ( MAKE-1CRATE-VERIFY ?auto_517306 ?auto_517307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517313 - SURFACE
      ?auto_517314 - SURFACE
    )
    :vars
    (
      ?auto_517316 - HOIST
      ?auto_517318 - PLACE
      ?auto_517319 - TRUCK
      ?auto_517317 - PLACE
      ?auto_517315 - HOIST
      ?auto_517320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517316 ?auto_517318 ) ( SURFACE-AT ?auto_517313 ?auto_517318 ) ( CLEAR ?auto_517313 ) ( IS-CRATE ?auto_517314 ) ( not ( = ?auto_517313 ?auto_517314 ) ) ( AVAILABLE ?auto_517316 ) ( TRUCK-AT ?auto_517319 ?auto_517317 ) ( not ( = ?auto_517317 ?auto_517318 ) ) ( HOIST-AT ?auto_517315 ?auto_517317 ) ( not ( = ?auto_517316 ?auto_517315 ) ) ( AVAILABLE ?auto_517315 ) ( SURFACE-AT ?auto_517314 ?auto_517317 ) ( ON ?auto_517314 ?auto_517320 ) ( CLEAR ?auto_517314 ) ( not ( = ?auto_517313 ?auto_517320 ) ) ( not ( = ?auto_517314 ?auto_517320 ) ) )
    :subtasks
    ( ( !LIFT ?auto_517315 ?auto_517314 ?auto_517320 ?auto_517317 )
      ( MAKE-1CRATE ?auto_517313 ?auto_517314 )
      ( MAKE-1CRATE-VERIFY ?auto_517313 ?auto_517314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517321 - SURFACE
      ?auto_517322 - SURFACE
    )
    :vars
    (
      ?auto_517326 - HOIST
      ?auto_517327 - PLACE
      ?auto_517323 - PLACE
      ?auto_517324 - HOIST
      ?auto_517325 - SURFACE
      ?auto_517328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517326 ?auto_517327 ) ( SURFACE-AT ?auto_517321 ?auto_517327 ) ( CLEAR ?auto_517321 ) ( IS-CRATE ?auto_517322 ) ( not ( = ?auto_517321 ?auto_517322 ) ) ( AVAILABLE ?auto_517326 ) ( not ( = ?auto_517323 ?auto_517327 ) ) ( HOIST-AT ?auto_517324 ?auto_517323 ) ( not ( = ?auto_517326 ?auto_517324 ) ) ( AVAILABLE ?auto_517324 ) ( SURFACE-AT ?auto_517322 ?auto_517323 ) ( ON ?auto_517322 ?auto_517325 ) ( CLEAR ?auto_517322 ) ( not ( = ?auto_517321 ?auto_517325 ) ) ( not ( = ?auto_517322 ?auto_517325 ) ) ( TRUCK-AT ?auto_517328 ?auto_517327 ) )
    :subtasks
    ( ( !DRIVE ?auto_517328 ?auto_517327 ?auto_517323 )
      ( MAKE-1CRATE ?auto_517321 ?auto_517322 )
      ( MAKE-1CRATE-VERIFY ?auto_517321 ?auto_517322 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517338 - SURFACE
      ?auto_517339 - SURFACE
      ?auto_517340 - SURFACE
    )
    :vars
    (
      ?auto_517341 - HOIST
      ?auto_517342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517341 ?auto_517342 ) ( SURFACE-AT ?auto_517339 ?auto_517342 ) ( CLEAR ?auto_517339 ) ( LIFTING ?auto_517341 ?auto_517340 ) ( IS-CRATE ?auto_517340 ) ( not ( = ?auto_517339 ?auto_517340 ) ) ( ON ?auto_517339 ?auto_517338 ) ( not ( = ?auto_517338 ?auto_517339 ) ) ( not ( = ?auto_517338 ?auto_517340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517339 ?auto_517340 )
      ( MAKE-2CRATE-VERIFY ?auto_517338 ?auto_517339 ?auto_517340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517348 - SURFACE
      ?auto_517349 - SURFACE
      ?auto_517350 - SURFACE
    )
    :vars
    (
      ?auto_517353 - HOIST
      ?auto_517352 - PLACE
      ?auto_517351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517353 ?auto_517352 ) ( SURFACE-AT ?auto_517349 ?auto_517352 ) ( CLEAR ?auto_517349 ) ( IS-CRATE ?auto_517350 ) ( not ( = ?auto_517349 ?auto_517350 ) ) ( TRUCK-AT ?auto_517351 ?auto_517352 ) ( AVAILABLE ?auto_517353 ) ( IN ?auto_517350 ?auto_517351 ) ( ON ?auto_517349 ?auto_517348 ) ( not ( = ?auto_517348 ?auto_517349 ) ) ( not ( = ?auto_517348 ?auto_517350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517349 ?auto_517350 )
      ( MAKE-2CRATE-VERIFY ?auto_517348 ?auto_517349 ?auto_517350 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517354 - SURFACE
      ?auto_517355 - SURFACE
    )
    :vars
    (
      ?auto_517356 - HOIST
      ?auto_517357 - PLACE
      ?auto_517358 - TRUCK
      ?auto_517359 - SURFACE
      ?auto_517360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517356 ?auto_517357 ) ( SURFACE-AT ?auto_517354 ?auto_517357 ) ( CLEAR ?auto_517354 ) ( IS-CRATE ?auto_517355 ) ( not ( = ?auto_517354 ?auto_517355 ) ) ( AVAILABLE ?auto_517356 ) ( IN ?auto_517355 ?auto_517358 ) ( ON ?auto_517354 ?auto_517359 ) ( not ( = ?auto_517359 ?auto_517354 ) ) ( not ( = ?auto_517359 ?auto_517355 ) ) ( TRUCK-AT ?auto_517358 ?auto_517360 ) ( not ( = ?auto_517360 ?auto_517357 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517358 ?auto_517360 ?auto_517357 )
      ( MAKE-2CRATE ?auto_517359 ?auto_517354 ?auto_517355 )
      ( MAKE-1CRATE-VERIFY ?auto_517354 ?auto_517355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517361 - SURFACE
      ?auto_517362 - SURFACE
      ?auto_517363 - SURFACE
    )
    :vars
    (
      ?auto_517366 - HOIST
      ?auto_517367 - PLACE
      ?auto_517364 - TRUCK
      ?auto_517365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517366 ?auto_517367 ) ( SURFACE-AT ?auto_517362 ?auto_517367 ) ( CLEAR ?auto_517362 ) ( IS-CRATE ?auto_517363 ) ( not ( = ?auto_517362 ?auto_517363 ) ) ( AVAILABLE ?auto_517366 ) ( IN ?auto_517363 ?auto_517364 ) ( ON ?auto_517362 ?auto_517361 ) ( not ( = ?auto_517361 ?auto_517362 ) ) ( not ( = ?auto_517361 ?auto_517363 ) ) ( TRUCK-AT ?auto_517364 ?auto_517365 ) ( not ( = ?auto_517365 ?auto_517367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517362 ?auto_517363 )
      ( MAKE-2CRATE-VERIFY ?auto_517361 ?auto_517362 ?auto_517363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517368 - SURFACE
      ?auto_517369 - SURFACE
    )
    :vars
    (
      ?auto_517371 - HOIST
      ?auto_517373 - PLACE
      ?auto_517374 - SURFACE
      ?auto_517370 - TRUCK
      ?auto_517372 - PLACE
      ?auto_517375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517371 ?auto_517373 ) ( SURFACE-AT ?auto_517368 ?auto_517373 ) ( CLEAR ?auto_517368 ) ( IS-CRATE ?auto_517369 ) ( not ( = ?auto_517368 ?auto_517369 ) ) ( AVAILABLE ?auto_517371 ) ( ON ?auto_517368 ?auto_517374 ) ( not ( = ?auto_517374 ?auto_517368 ) ) ( not ( = ?auto_517374 ?auto_517369 ) ) ( TRUCK-AT ?auto_517370 ?auto_517372 ) ( not ( = ?auto_517372 ?auto_517373 ) ) ( HOIST-AT ?auto_517375 ?auto_517372 ) ( LIFTING ?auto_517375 ?auto_517369 ) ( not ( = ?auto_517371 ?auto_517375 ) ) )
    :subtasks
    ( ( !LOAD ?auto_517375 ?auto_517369 ?auto_517370 ?auto_517372 )
      ( MAKE-2CRATE ?auto_517374 ?auto_517368 ?auto_517369 )
      ( MAKE-1CRATE-VERIFY ?auto_517368 ?auto_517369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517376 - SURFACE
      ?auto_517377 - SURFACE
      ?auto_517378 - SURFACE
    )
    :vars
    (
      ?auto_517381 - HOIST
      ?auto_517379 - PLACE
      ?auto_517380 - TRUCK
      ?auto_517383 - PLACE
      ?auto_517382 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517381 ?auto_517379 ) ( SURFACE-AT ?auto_517377 ?auto_517379 ) ( CLEAR ?auto_517377 ) ( IS-CRATE ?auto_517378 ) ( not ( = ?auto_517377 ?auto_517378 ) ) ( AVAILABLE ?auto_517381 ) ( ON ?auto_517377 ?auto_517376 ) ( not ( = ?auto_517376 ?auto_517377 ) ) ( not ( = ?auto_517376 ?auto_517378 ) ) ( TRUCK-AT ?auto_517380 ?auto_517383 ) ( not ( = ?auto_517383 ?auto_517379 ) ) ( HOIST-AT ?auto_517382 ?auto_517383 ) ( LIFTING ?auto_517382 ?auto_517378 ) ( not ( = ?auto_517381 ?auto_517382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517377 ?auto_517378 )
      ( MAKE-2CRATE-VERIFY ?auto_517376 ?auto_517377 ?auto_517378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517384 - SURFACE
      ?auto_517385 - SURFACE
    )
    :vars
    (
      ?auto_517387 - HOIST
      ?auto_517391 - PLACE
      ?auto_517386 - SURFACE
      ?auto_517389 - TRUCK
      ?auto_517388 - PLACE
      ?auto_517390 - HOIST
      ?auto_517392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517387 ?auto_517391 ) ( SURFACE-AT ?auto_517384 ?auto_517391 ) ( CLEAR ?auto_517384 ) ( IS-CRATE ?auto_517385 ) ( not ( = ?auto_517384 ?auto_517385 ) ) ( AVAILABLE ?auto_517387 ) ( ON ?auto_517384 ?auto_517386 ) ( not ( = ?auto_517386 ?auto_517384 ) ) ( not ( = ?auto_517386 ?auto_517385 ) ) ( TRUCK-AT ?auto_517389 ?auto_517388 ) ( not ( = ?auto_517388 ?auto_517391 ) ) ( HOIST-AT ?auto_517390 ?auto_517388 ) ( not ( = ?auto_517387 ?auto_517390 ) ) ( AVAILABLE ?auto_517390 ) ( SURFACE-AT ?auto_517385 ?auto_517388 ) ( ON ?auto_517385 ?auto_517392 ) ( CLEAR ?auto_517385 ) ( not ( = ?auto_517384 ?auto_517392 ) ) ( not ( = ?auto_517385 ?auto_517392 ) ) ( not ( = ?auto_517386 ?auto_517392 ) ) )
    :subtasks
    ( ( !LIFT ?auto_517390 ?auto_517385 ?auto_517392 ?auto_517388 )
      ( MAKE-2CRATE ?auto_517386 ?auto_517384 ?auto_517385 )
      ( MAKE-1CRATE-VERIFY ?auto_517384 ?auto_517385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517393 - SURFACE
      ?auto_517394 - SURFACE
      ?auto_517395 - SURFACE
    )
    :vars
    (
      ?auto_517398 - HOIST
      ?auto_517399 - PLACE
      ?auto_517397 - TRUCK
      ?auto_517401 - PLACE
      ?auto_517396 - HOIST
      ?auto_517400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517398 ?auto_517399 ) ( SURFACE-AT ?auto_517394 ?auto_517399 ) ( CLEAR ?auto_517394 ) ( IS-CRATE ?auto_517395 ) ( not ( = ?auto_517394 ?auto_517395 ) ) ( AVAILABLE ?auto_517398 ) ( ON ?auto_517394 ?auto_517393 ) ( not ( = ?auto_517393 ?auto_517394 ) ) ( not ( = ?auto_517393 ?auto_517395 ) ) ( TRUCK-AT ?auto_517397 ?auto_517401 ) ( not ( = ?auto_517401 ?auto_517399 ) ) ( HOIST-AT ?auto_517396 ?auto_517401 ) ( not ( = ?auto_517398 ?auto_517396 ) ) ( AVAILABLE ?auto_517396 ) ( SURFACE-AT ?auto_517395 ?auto_517401 ) ( ON ?auto_517395 ?auto_517400 ) ( CLEAR ?auto_517395 ) ( not ( = ?auto_517394 ?auto_517400 ) ) ( not ( = ?auto_517395 ?auto_517400 ) ) ( not ( = ?auto_517393 ?auto_517400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517394 ?auto_517395 )
      ( MAKE-2CRATE-VERIFY ?auto_517393 ?auto_517394 ?auto_517395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517402 - SURFACE
      ?auto_517403 - SURFACE
    )
    :vars
    (
      ?auto_517410 - HOIST
      ?auto_517405 - PLACE
      ?auto_517404 - SURFACE
      ?auto_517406 - PLACE
      ?auto_517407 - HOIST
      ?auto_517408 - SURFACE
      ?auto_517409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517410 ?auto_517405 ) ( SURFACE-AT ?auto_517402 ?auto_517405 ) ( CLEAR ?auto_517402 ) ( IS-CRATE ?auto_517403 ) ( not ( = ?auto_517402 ?auto_517403 ) ) ( AVAILABLE ?auto_517410 ) ( ON ?auto_517402 ?auto_517404 ) ( not ( = ?auto_517404 ?auto_517402 ) ) ( not ( = ?auto_517404 ?auto_517403 ) ) ( not ( = ?auto_517406 ?auto_517405 ) ) ( HOIST-AT ?auto_517407 ?auto_517406 ) ( not ( = ?auto_517410 ?auto_517407 ) ) ( AVAILABLE ?auto_517407 ) ( SURFACE-AT ?auto_517403 ?auto_517406 ) ( ON ?auto_517403 ?auto_517408 ) ( CLEAR ?auto_517403 ) ( not ( = ?auto_517402 ?auto_517408 ) ) ( not ( = ?auto_517403 ?auto_517408 ) ) ( not ( = ?auto_517404 ?auto_517408 ) ) ( TRUCK-AT ?auto_517409 ?auto_517405 ) )
    :subtasks
    ( ( !DRIVE ?auto_517409 ?auto_517405 ?auto_517406 )
      ( MAKE-2CRATE ?auto_517404 ?auto_517402 ?auto_517403 )
      ( MAKE-1CRATE-VERIFY ?auto_517402 ?auto_517403 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517411 - SURFACE
      ?auto_517412 - SURFACE
      ?auto_517413 - SURFACE
    )
    :vars
    (
      ?auto_517419 - HOIST
      ?auto_517416 - PLACE
      ?auto_517414 - PLACE
      ?auto_517417 - HOIST
      ?auto_517415 - SURFACE
      ?auto_517418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517419 ?auto_517416 ) ( SURFACE-AT ?auto_517412 ?auto_517416 ) ( CLEAR ?auto_517412 ) ( IS-CRATE ?auto_517413 ) ( not ( = ?auto_517412 ?auto_517413 ) ) ( AVAILABLE ?auto_517419 ) ( ON ?auto_517412 ?auto_517411 ) ( not ( = ?auto_517411 ?auto_517412 ) ) ( not ( = ?auto_517411 ?auto_517413 ) ) ( not ( = ?auto_517414 ?auto_517416 ) ) ( HOIST-AT ?auto_517417 ?auto_517414 ) ( not ( = ?auto_517419 ?auto_517417 ) ) ( AVAILABLE ?auto_517417 ) ( SURFACE-AT ?auto_517413 ?auto_517414 ) ( ON ?auto_517413 ?auto_517415 ) ( CLEAR ?auto_517413 ) ( not ( = ?auto_517412 ?auto_517415 ) ) ( not ( = ?auto_517413 ?auto_517415 ) ) ( not ( = ?auto_517411 ?auto_517415 ) ) ( TRUCK-AT ?auto_517418 ?auto_517416 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517412 ?auto_517413 )
      ( MAKE-2CRATE-VERIFY ?auto_517411 ?auto_517412 ?auto_517413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517420 - SURFACE
      ?auto_517421 - SURFACE
    )
    :vars
    (
      ?auto_517423 - HOIST
      ?auto_517427 - PLACE
      ?auto_517425 - SURFACE
      ?auto_517426 - PLACE
      ?auto_517424 - HOIST
      ?auto_517428 - SURFACE
      ?auto_517422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517423 ?auto_517427 ) ( IS-CRATE ?auto_517421 ) ( not ( = ?auto_517420 ?auto_517421 ) ) ( not ( = ?auto_517425 ?auto_517420 ) ) ( not ( = ?auto_517425 ?auto_517421 ) ) ( not ( = ?auto_517426 ?auto_517427 ) ) ( HOIST-AT ?auto_517424 ?auto_517426 ) ( not ( = ?auto_517423 ?auto_517424 ) ) ( AVAILABLE ?auto_517424 ) ( SURFACE-AT ?auto_517421 ?auto_517426 ) ( ON ?auto_517421 ?auto_517428 ) ( CLEAR ?auto_517421 ) ( not ( = ?auto_517420 ?auto_517428 ) ) ( not ( = ?auto_517421 ?auto_517428 ) ) ( not ( = ?auto_517425 ?auto_517428 ) ) ( TRUCK-AT ?auto_517422 ?auto_517427 ) ( SURFACE-AT ?auto_517425 ?auto_517427 ) ( CLEAR ?auto_517425 ) ( LIFTING ?auto_517423 ?auto_517420 ) ( IS-CRATE ?auto_517420 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517425 ?auto_517420 )
      ( MAKE-2CRATE ?auto_517425 ?auto_517420 ?auto_517421 )
      ( MAKE-1CRATE-VERIFY ?auto_517420 ?auto_517421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517429 - SURFACE
      ?auto_517430 - SURFACE
      ?auto_517431 - SURFACE
    )
    :vars
    (
      ?auto_517435 - HOIST
      ?auto_517436 - PLACE
      ?auto_517433 - PLACE
      ?auto_517434 - HOIST
      ?auto_517437 - SURFACE
      ?auto_517432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517435 ?auto_517436 ) ( IS-CRATE ?auto_517431 ) ( not ( = ?auto_517430 ?auto_517431 ) ) ( not ( = ?auto_517429 ?auto_517430 ) ) ( not ( = ?auto_517429 ?auto_517431 ) ) ( not ( = ?auto_517433 ?auto_517436 ) ) ( HOIST-AT ?auto_517434 ?auto_517433 ) ( not ( = ?auto_517435 ?auto_517434 ) ) ( AVAILABLE ?auto_517434 ) ( SURFACE-AT ?auto_517431 ?auto_517433 ) ( ON ?auto_517431 ?auto_517437 ) ( CLEAR ?auto_517431 ) ( not ( = ?auto_517430 ?auto_517437 ) ) ( not ( = ?auto_517431 ?auto_517437 ) ) ( not ( = ?auto_517429 ?auto_517437 ) ) ( TRUCK-AT ?auto_517432 ?auto_517436 ) ( SURFACE-AT ?auto_517429 ?auto_517436 ) ( CLEAR ?auto_517429 ) ( LIFTING ?auto_517435 ?auto_517430 ) ( IS-CRATE ?auto_517430 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517430 ?auto_517431 )
      ( MAKE-2CRATE-VERIFY ?auto_517429 ?auto_517430 ?auto_517431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517438 - SURFACE
      ?auto_517439 - SURFACE
    )
    :vars
    (
      ?auto_517445 - HOIST
      ?auto_517441 - PLACE
      ?auto_517446 - SURFACE
      ?auto_517443 - PLACE
      ?auto_517440 - HOIST
      ?auto_517442 - SURFACE
      ?auto_517444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517445 ?auto_517441 ) ( IS-CRATE ?auto_517439 ) ( not ( = ?auto_517438 ?auto_517439 ) ) ( not ( = ?auto_517446 ?auto_517438 ) ) ( not ( = ?auto_517446 ?auto_517439 ) ) ( not ( = ?auto_517443 ?auto_517441 ) ) ( HOIST-AT ?auto_517440 ?auto_517443 ) ( not ( = ?auto_517445 ?auto_517440 ) ) ( AVAILABLE ?auto_517440 ) ( SURFACE-AT ?auto_517439 ?auto_517443 ) ( ON ?auto_517439 ?auto_517442 ) ( CLEAR ?auto_517439 ) ( not ( = ?auto_517438 ?auto_517442 ) ) ( not ( = ?auto_517439 ?auto_517442 ) ) ( not ( = ?auto_517446 ?auto_517442 ) ) ( TRUCK-AT ?auto_517444 ?auto_517441 ) ( SURFACE-AT ?auto_517446 ?auto_517441 ) ( CLEAR ?auto_517446 ) ( IS-CRATE ?auto_517438 ) ( AVAILABLE ?auto_517445 ) ( IN ?auto_517438 ?auto_517444 ) )
    :subtasks
    ( ( !UNLOAD ?auto_517445 ?auto_517438 ?auto_517444 ?auto_517441 )
      ( MAKE-2CRATE ?auto_517446 ?auto_517438 ?auto_517439 )
      ( MAKE-1CRATE-VERIFY ?auto_517438 ?auto_517439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517447 - SURFACE
      ?auto_517448 - SURFACE
      ?auto_517449 - SURFACE
    )
    :vars
    (
      ?auto_517454 - HOIST
      ?auto_517455 - PLACE
      ?auto_517453 - PLACE
      ?auto_517452 - HOIST
      ?auto_517450 - SURFACE
      ?auto_517451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517454 ?auto_517455 ) ( IS-CRATE ?auto_517449 ) ( not ( = ?auto_517448 ?auto_517449 ) ) ( not ( = ?auto_517447 ?auto_517448 ) ) ( not ( = ?auto_517447 ?auto_517449 ) ) ( not ( = ?auto_517453 ?auto_517455 ) ) ( HOIST-AT ?auto_517452 ?auto_517453 ) ( not ( = ?auto_517454 ?auto_517452 ) ) ( AVAILABLE ?auto_517452 ) ( SURFACE-AT ?auto_517449 ?auto_517453 ) ( ON ?auto_517449 ?auto_517450 ) ( CLEAR ?auto_517449 ) ( not ( = ?auto_517448 ?auto_517450 ) ) ( not ( = ?auto_517449 ?auto_517450 ) ) ( not ( = ?auto_517447 ?auto_517450 ) ) ( TRUCK-AT ?auto_517451 ?auto_517455 ) ( SURFACE-AT ?auto_517447 ?auto_517455 ) ( CLEAR ?auto_517447 ) ( IS-CRATE ?auto_517448 ) ( AVAILABLE ?auto_517454 ) ( IN ?auto_517448 ?auto_517451 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517448 ?auto_517449 )
      ( MAKE-2CRATE-VERIFY ?auto_517447 ?auto_517448 ?auto_517449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517492 - SURFACE
      ?auto_517493 - SURFACE
    )
    :vars
    (
      ?auto_517499 - HOIST
      ?auto_517496 - PLACE
      ?auto_517500 - SURFACE
      ?auto_517498 - PLACE
      ?auto_517497 - HOIST
      ?auto_517495 - SURFACE
      ?auto_517494 - TRUCK
      ?auto_517501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517499 ?auto_517496 ) ( SURFACE-AT ?auto_517492 ?auto_517496 ) ( CLEAR ?auto_517492 ) ( IS-CRATE ?auto_517493 ) ( not ( = ?auto_517492 ?auto_517493 ) ) ( AVAILABLE ?auto_517499 ) ( ON ?auto_517492 ?auto_517500 ) ( not ( = ?auto_517500 ?auto_517492 ) ) ( not ( = ?auto_517500 ?auto_517493 ) ) ( not ( = ?auto_517498 ?auto_517496 ) ) ( HOIST-AT ?auto_517497 ?auto_517498 ) ( not ( = ?auto_517499 ?auto_517497 ) ) ( AVAILABLE ?auto_517497 ) ( SURFACE-AT ?auto_517493 ?auto_517498 ) ( ON ?auto_517493 ?auto_517495 ) ( CLEAR ?auto_517493 ) ( not ( = ?auto_517492 ?auto_517495 ) ) ( not ( = ?auto_517493 ?auto_517495 ) ) ( not ( = ?auto_517500 ?auto_517495 ) ) ( TRUCK-AT ?auto_517494 ?auto_517501 ) ( not ( = ?auto_517501 ?auto_517496 ) ) ( not ( = ?auto_517498 ?auto_517501 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517494 ?auto_517501 ?auto_517496 )
      ( MAKE-1CRATE ?auto_517492 ?auto_517493 )
      ( MAKE-1CRATE-VERIFY ?auto_517492 ?auto_517493 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517532 - SURFACE
      ?auto_517533 - SURFACE
      ?auto_517534 - SURFACE
      ?auto_517531 - SURFACE
    )
    :vars
    (
      ?auto_517536 - HOIST
      ?auto_517535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517536 ?auto_517535 ) ( SURFACE-AT ?auto_517534 ?auto_517535 ) ( CLEAR ?auto_517534 ) ( LIFTING ?auto_517536 ?auto_517531 ) ( IS-CRATE ?auto_517531 ) ( not ( = ?auto_517534 ?auto_517531 ) ) ( ON ?auto_517533 ?auto_517532 ) ( ON ?auto_517534 ?auto_517533 ) ( not ( = ?auto_517532 ?auto_517533 ) ) ( not ( = ?auto_517532 ?auto_517534 ) ) ( not ( = ?auto_517532 ?auto_517531 ) ) ( not ( = ?auto_517533 ?auto_517534 ) ) ( not ( = ?auto_517533 ?auto_517531 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517534 ?auto_517531 )
      ( MAKE-3CRATE-VERIFY ?auto_517532 ?auto_517533 ?auto_517534 ?auto_517531 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517549 - SURFACE
      ?auto_517550 - SURFACE
      ?auto_517551 - SURFACE
      ?auto_517548 - SURFACE
    )
    :vars
    (
      ?auto_517554 - HOIST
      ?auto_517552 - PLACE
      ?auto_517553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517554 ?auto_517552 ) ( SURFACE-AT ?auto_517551 ?auto_517552 ) ( CLEAR ?auto_517551 ) ( IS-CRATE ?auto_517548 ) ( not ( = ?auto_517551 ?auto_517548 ) ) ( TRUCK-AT ?auto_517553 ?auto_517552 ) ( AVAILABLE ?auto_517554 ) ( IN ?auto_517548 ?auto_517553 ) ( ON ?auto_517551 ?auto_517550 ) ( not ( = ?auto_517550 ?auto_517551 ) ) ( not ( = ?auto_517550 ?auto_517548 ) ) ( ON ?auto_517550 ?auto_517549 ) ( not ( = ?auto_517549 ?auto_517550 ) ) ( not ( = ?auto_517549 ?auto_517551 ) ) ( not ( = ?auto_517549 ?auto_517548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517550 ?auto_517551 ?auto_517548 )
      ( MAKE-3CRATE-VERIFY ?auto_517549 ?auto_517550 ?auto_517551 ?auto_517548 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517570 - SURFACE
      ?auto_517571 - SURFACE
      ?auto_517572 - SURFACE
      ?auto_517569 - SURFACE
    )
    :vars
    (
      ?auto_517573 - HOIST
      ?auto_517576 - PLACE
      ?auto_517574 - TRUCK
      ?auto_517575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517573 ?auto_517576 ) ( SURFACE-AT ?auto_517572 ?auto_517576 ) ( CLEAR ?auto_517572 ) ( IS-CRATE ?auto_517569 ) ( not ( = ?auto_517572 ?auto_517569 ) ) ( AVAILABLE ?auto_517573 ) ( IN ?auto_517569 ?auto_517574 ) ( ON ?auto_517572 ?auto_517571 ) ( not ( = ?auto_517571 ?auto_517572 ) ) ( not ( = ?auto_517571 ?auto_517569 ) ) ( TRUCK-AT ?auto_517574 ?auto_517575 ) ( not ( = ?auto_517575 ?auto_517576 ) ) ( ON ?auto_517571 ?auto_517570 ) ( not ( = ?auto_517570 ?auto_517571 ) ) ( not ( = ?auto_517570 ?auto_517572 ) ) ( not ( = ?auto_517570 ?auto_517569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517571 ?auto_517572 ?auto_517569 )
      ( MAKE-3CRATE-VERIFY ?auto_517570 ?auto_517571 ?auto_517572 ?auto_517569 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517594 - SURFACE
      ?auto_517595 - SURFACE
      ?auto_517596 - SURFACE
      ?auto_517593 - SURFACE
    )
    :vars
    (
      ?auto_517598 - HOIST
      ?auto_517597 - PLACE
      ?auto_517601 - TRUCK
      ?auto_517600 - PLACE
      ?auto_517599 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517598 ?auto_517597 ) ( SURFACE-AT ?auto_517596 ?auto_517597 ) ( CLEAR ?auto_517596 ) ( IS-CRATE ?auto_517593 ) ( not ( = ?auto_517596 ?auto_517593 ) ) ( AVAILABLE ?auto_517598 ) ( ON ?auto_517596 ?auto_517595 ) ( not ( = ?auto_517595 ?auto_517596 ) ) ( not ( = ?auto_517595 ?auto_517593 ) ) ( TRUCK-AT ?auto_517601 ?auto_517600 ) ( not ( = ?auto_517600 ?auto_517597 ) ) ( HOIST-AT ?auto_517599 ?auto_517600 ) ( LIFTING ?auto_517599 ?auto_517593 ) ( not ( = ?auto_517598 ?auto_517599 ) ) ( ON ?auto_517595 ?auto_517594 ) ( not ( = ?auto_517594 ?auto_517595 ) ) ( not ( = ?auto_517594 ?auto_517596 ) ) ( not ( = ?auto_517594 ?auto_517593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517595 ?auto_517596 ?auto_517593 )
      ( MAKE-3CRATE-VERIFY ?auto_517594 ?auto_517595 ?auto_517596 ?auto_517593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517621 - SURFACE
      ?auto_517622 - SURFACE
      ?auto_517623 - SURFACE
      ?auto_517620 - SURFACE
    )
    :vars
    (
      ?auto_517628 - HOIST
      ?auto_517626 - PLACE
      ?auto_517625 - TRUCK
      ?auto_517627 - PLACE
      ?auto_517629 - HOIST
      ?auto_517624 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517628 ?auto_517626 ) ( SURFACE-AT ?auto_517623 ?auto_517626 ) ( CLEAR ?auto_517623 ) ( IS-CRATE ?auto_517620 ) ( not ( = ?auto_517623 ?auto_517620 ) ) ( AVAILABLE ?auto_517628 ) ( ON ?auto_517623 ?auto_517622 ) ( not ( = ?auto_517622 ?auto_517623 ) ) ( not ( = ?auto_517622 ?auto_517620 ) ) ( TRUCK-AT ?auto_517625 ?auto_517627 ) ( not ( = ?auto_517627 ?auto_517626 ) ) ( HOIST-AT ?auto_517629 ?auto_517627 ) ( not ( = ?auto_517628 ?auto_517629 ) ) ( AVAILABLE ?auto_517629 ) ( SURFACE-AT ?auto_517620 ?auto_517627 ) ( ON ?auto_517620 ?auto_517624 ) ( CLEAR ?auto_517620 ) ( not ( = ?auto_517623 ?auto_517624 ) ) ( not ( = ?auto_517620 ?auto_517624 ) ) ( not ( = ?auto_517622 ?auto_517624 ) ) ( ON ?auto_517622 ?auto_517621 ) ( not ( = ?auto_517621 ?auto_517622 ) ) ( not ( = ?auto_517621 ?auto_517623 ) ) ( not ( = ?auto_517621 ?auto_517620 ) ) ( not ( = ?auto_517621 ?auto_517624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517622 ?auto_517623 ?auto_517620 )
      ( MAKE-3CRATE-VERIFY ?auto_517621 ?auto_517622 ?auto_517623 ?auto_517620 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517649 - SURFACE
      ?auto_517650 - SURFACE
      ?auto_517651 - SURFACE
      ?auto_517648 - SURFACE
    )
    :vars
    (
      ?auto_517655 - HOIST
      ?auto_517657 - PLACE
      ?auto_517653 - PLACE
      ?auto_517654 - HOIST
      ?auto_517652 - SURFACE
      ?auto_517656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517655 ?auto_517657 ) ( SURFACE-AT ?auto_517651 ?auto_517657 ) ( CLEAR ?auto_517651 ) ( IS-CRATE ?auto_517648 ) ( not ( = ?auto_517651 ?auto_517648 ) ) ( AVAILABLE ?auto_517655 ) ( ON ?auto_517651 ?auto_517650 ) ( not ( = ?auto_517650 ?auto_517651 ) ) ( not ( = ?auto_517650 ?auto_517648 ) ) ( not ( = ?auto_517653 ?auto_517657 ) ) ( HOIST-AT ?auto_517654 ?auto_517653 ) ( not ( = ?auto_517655 ?auto_517654 ) ) ( AVAILABLE ?auto_517654 ) ( SURFACE-AT ?auto_517648 ?auto_517653 ) ( ON ?auto_517648 ?auto_517652 ) ( CLEAR ?auto_517648 ) ( not ( = ?auto_517651 ?auto_517652 ) ) ( not ( = ?auto_517648 ?auto_517652 ) ) ( not ( = ?auto_517650 ?auto_517652 ) ) ( TRUCK-AT ?auto_517656 ?auto_517657 ) ( ON ?auto_517650 ?auto_517649 ) ( not ( = ?auto_517649 ?auto_517650 ) ) ( not ( = ?auto_517649 ?auto_517651 ) ) ( not ( = ?auto_517649 ?auto_517648 ) ) ( not ( = ?auto_517649 ?auto_517652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517650 ?auto_517651 ?auto_517648 )
      ( MAKE-3CRATE-VERIFY ?auto_517649 ?auto_517650 ?auto_517651 ?auto_517648 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517677 - SURFACE
      ?auto_517678 - SURFACE
      ?auto_517679 - SURFACE
      ?auto_517676 - SURFACE
    )
    :vars
    (
      ?auto_517681 - HOIST
      ?auto_517684 - PLACE
      ?auto_517683 - PLACE
      ?auto_517682 - HOIST
      ?auto_517680 - SURFACE
      ?auto_517685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517681 ?auto_517684 ) ( IS-CRATE ?auto_517676 ) ( not ( = ?auto_517679 ?auto_517676 ) ) ( not ( = ?auto_517678 ?auto_517679 ) ) ( not ( = ?auto_517678 ?auto_517676 ) ) ( not ( = ?auto_517683 ?auto_517684 ) ) ( HOIST-AT ?auto_517682 ?auto_517683 ) ( not ( = ?auto_517681 ?auto_517682 ) ) ( AVAILABLE ?auto_517682 ) ( SURFACE-AT ?auto_517676 ?auto_517683 ) ( ON ?auto_517676 ?auto_517680 ) ( CLEAR ?auto_517676 ) ( not ( = ?auto_517679 ?auto_517680 ) ) ( not ( = ?auto_517676 ?auto_517680 ) ) ( not ( = ?auto_517678 ?auto_517680 ) ) ( TRUCK-AT ?auto_517685 ?auto_517684 ) ( SURFACE-AT ?auto_517678 ?auto_517684 ) ( CLEAR ?auto_517678 ) ( LIFTING ?auto_517681 ?auto_517679 ) ( IS-CRATE ?auto_517679 ) ( ON ?auto_517678 ?auto_517677 ) ( not ( = ?auto_517677 ?auto_517678 ) ) ( not ( = ?auto_517677 ?auto_517679 ) ) ( not ( = ?auto_517677 ?auto_517676 ) ) ( not ( = ?auto_517677 ?auto_517680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517678 ?auto_517679 ?auto_517676 )
      ( MAKE-3CRATE-VERIFY ?auto_517677 ?auto_517678 ?auto_517679 ?auto_517676 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517705 - SURFACE
      ?auto_517706 - SURFACE
      ?auto_517707 - SURFACE
      ?auto_517704 - SURFACE
    )
    :vars
    (
      ?auto_517708 - HOIST
      ?auto_517711 - PLACE
      ?auto_517710 - PLACE
      ?auto_517712 - HOIST
      ?auto_517709 - SURFACE
      ?auto_517713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517708 ?auto_517711 ) ( IS-CRATE ?auto_517704 ) ( not ( = ?auto_517707 ?auto_517704 ) ) ( not ( = ?auto_517706 ?auto_517707 ) ) ( not ( = ?auto_517706 ?auto_517704 ) ) ( not ( = ?auto_517710 ?auto_517711 ) ) ( HOIST-AT ?auto_517712 ?auto_517710 ) ( not ( = ?auto_517708 ?auto_517712 ) ) ( AVAILABLE ?auto_517712 ) ( SURFACE-AT ?auto_517704 ?auto_517710 ) ( ON ?auto_517704 ?auto_517709 ) ( CLEAR ?auto_517704 ) ( not ( = ?auto_517707 ?auto_517709 ) ) ( not ( = ?auto_517704 ?auto_517709 ) ) ( not ( = ?auto_517706 ?auto_517709 ) ) ( TRUCK-AT ?auto_517713 ?auto_517711 ) ( SURFACE-AT ?auto_517706 ?auto_517711 ) ( CLEAR ?auto_517706 ) ( IS-CRATE ?auto_517707 ) ( AVAILABLE ?auto_517708 ) ( IN ?auto_517707 ?auto_517713 ) ( ON ?auto_517706 ?auto_517705 ) ( not ( = ?auto_517705 ?auto_517706 ) ) ( not ( = ?auto_517705 ?auto_517707 ) ) ( not ( = ?auto_517705 ?auto_517704 ) ) ( not ( = ?auto_517705 ?auto_517709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517706 ?auto_517707 ?auto_517704 )
      ( MAKE-3CRATE-VERIFY ?auto_517705 ?auto_517706 ?auto_517707 ?auto_517704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517996 - SURFACE
      ?auto_517997 - SURFACE
      ?auto_517998 - SURFACE
      ?auto_517995 - SURFACE
      ?auto_517999 - SURFACE
    )
    :vars
    (
      ?auto_518001 - HOIST
      ?auto_518000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518001 ?auto_518000 ) ( SURFACE-AT ?auto_517995 ?auto_518000 ) ( CLEAR ?auto_517995 ) ( LIFTING ?auto_518001 ?auto_517999 ) ( IS-CRATE ?auto_517999 ) ( not ( = ?auto_517995 ?auto_517999 ) ) ( ON ?auto_517997 ?auto_517996 ) ( ON ?auto_517998 ?auto_517997 ) ( ON ?auto_517995 ?auto_517998 ) ( not ( = ?auto_517996 ?auto_517997 ) ) ( not ( = ?auto_517996 ?auto_517998 ) ) ( not ( = ?auto_517996 ?auto_517995 ) ) ( not ( = ?auto_517996 ?auto_517999 ) ) ( not ( = ?auto_517997 ?auto_517998 ) ) ( not ( = ?auto_517997 ?auto_517995 ) ) ( not ( = ?auto_517997 ?auto_517999 ) ) ( not ( = ?auto_517998 ?auto_517995 ) ) ( not ( = ?auto_517998 ?auto_517999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517995 ?auto_517999 )
      ( MAKE-4CRATE-VERIFY ?auto_517996 ?auto_517997 ?auto_517998 ?auto_517995 ?auto_517999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518021 - SURFACE
      ?auto_518022 - SURFACE
      ?auto_518023 - SURFACE
      ?auto_518020 - SURFACE
      ?auto_518024 - SURFACE
    )
    :vars
    (
      ?auto_518025 - HOIST
      ?auto_518027 - PLACE
      ?auto_518026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518025 ?auto_518027 ) ( SURFACE-AT ?auto_518020 ?auto_518027 ) ( CLEAR ?auto_518020 ) ( IS-CRATE ?auto_518024 ) ( not ( = ?auto_518020 ?auto_518024 ) ) ( TRUCK-AT ?auto_518026 ?auto_518027 ) ( AVAILABLE ?auto_518025 ) ( IN ?auto_518024 ?auto_518026 ) ( ON ?auto_518020 ?auto_518023 ) ( not ( = ?auto_518023 ?auto_518020 ) ) ( not ( = ?auto_518023 ?auto_518024 ) ) ( ON ?auto_518022 ?auto_518021 ) ( ON ?auto_518023 ?auto_518022 ) ( not ( = ?auto_518021 ?auto_518022 ) ) ( not ( = ?auto_518021 ?auto_518023 ) ) ( not ( = ?auto_518021 ?auto_518020 ) ) ( not ( = ?auto_518021 ?auto_518024 ) ) ( not ( = ?auto_518022 ?auto_518023 ) ) ( not ( = ?auto_518022 ?auto_518020 ) ) ( not ( = ?auto_518022 ?auto_518024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518023 ?auto_518020 ?auto_518024 )
      ( MAKE-4CRATE-VERIFY ?auto_518021 ?auto_518022 ?auto_518023 ?auto_518020 ?auto_518024 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518051 - SURFACE
      ?auto_518052 - SURFACE
      ?auto_518053 - SURFACE
      ?auto_518050 - SURFACE
      ?auto_518054 - SURFACE
    )
    :vars
    (
      ?auto_518058 - HOIST
      ?auto_518057 - PLACE
      ?auto_518055 - TRUCK
      ?auto_518056 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518058 ?auto_518057 ) ( SURFACE-AT ?auto_518050 ?auto_518057 ) ( CLEAR ?auto_518050 ) ( IS-CRATE ?auto_518054 ) ( not ( = ?auto_518050 ?auto_518054 ) ) ( AVAILABLE ?auto_518058 ) ( IN ?auto_518054 ?auto_518055 ) ( ON ?auto_518050 ?auto_518053 ) ( not ( = ?auto_518053 ?auto_518050 ) ) ( not ( = ?auto_518053 ?auto_518054 ) ) ( TRUCK-AT ?auto_518055 ?auto_518056 ) ( not ( = ?auto_518056 ?auto_518057 ) ) ( ON ?auto_518052 ?auto_518051 ) ( ON ?auto_518053 ?auto_518052 ) ( not ( = ?auto_518051 ?auto_518052 ) ) ( not ( = ?auto_518051 ?auto_518053 ) ) ( not ( = ?auto_518051 ?auto_518050 ) ) ( not ( = ?auto_518051 ?auto_518054 ) ) ( not ( = ?auto_518052 ?auto_518053 ) ) ( not ( = ?auto_518052 ?auto_518050 ) ) ( not ( = ?auto_518052 ?auto_518054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518053 ?auto_518050 ?auto_518054 )
      ( MAKE-4CRATE-VERIFY ?auto_518051 ?auto_518052 ?auto_518053 ?auto_518050 ?auto_518054 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518085 - SURFACE
      ?auto_518086 - SURFACE
      ?auto_518087 - SURFACE
      ?auto_518084 - SURFACE
      ?auto_518088 - SURFACE
    )
    :vars
    (
      ?auto_518093 - HOIST
      ?auto_518090 - PLACE
      ?auto_518091 - TRUCK
      ?auto_518089 - PLACE
      ?auto_518092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_518093 ?auto_518090 ) ( SURFACE-AT ?auto_518084 ?auto_518090 ) ( CLEAR ?auto_518084 ) ( IS-CRATE ?auto_518088 ) ( not ( = ?auto_518084 ?auto_518088 ) ) ( AVAILABLE ?auto_518093 ) ( ON ?auto_518084 ?auto_518087 ) ( not ( = ?auto_518087 ?auto_518084 ) ) ( not ( = ?auto_518087 ?auto_518088 ) ) ( TRUCK-AT ?auto_518091 ?auto_518089 ) ( not ( = ?auto_518089 ?auto_518090 ) ) ( HOIST-AT ?auto_518092 ?auto_518089 ) ( LIFTING ?auto_518092 ?auto_518088 ) ( not ( = ?auto_518093 ?auto_518092 ) ) ( ON ?auto_518086 ?auto_518085 ) ( ON ?auto_518087 ?auto_518086 ) ( not ( = ?auto_518085 ?auto_518086 ) ) ( not ( = ?auto_518085 ?auto_518087 ) ) ( not ( = ?auto_518085 ?auto_518084 ) ) ( not ( = ?auto_518085 ?auto_518088 ) ) ( not ( = ?auto_518086 ?auto_518087 ) ) ( not ( = ?auto_518086 ?auto_518084 ) ) ( not ( = ?auto_518086 ?auto_518088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518087 ?auto_518084 ?auto_518088 )
      ( MAKE-4CRATE-VERIFY ?auto_518085 ?auto_518086 ?auto_518087 ?auto_518084 ?auto_518088 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518123 - SURFACE
      ?auto_518124 - SURFACE
      ?auto_518125 - SURFACE
      ?auto_518122 - SURFACE
      ?auto_518126 - SURFACE
    )
    :vars
    (
      ?auto_518131 - HOIST
      ?auto_518127 - PLACE
      ?auto_518128 - TRUCK
      ?auto_518129 - PLACE
      ?auto_518132 - HOIST
      ?auto_518130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518131 ?auto_518127 ) ( SURFACE-AT ?auto_518122 ?auto_518127 ) ( CLEAR ?auto_518122 ) ( IS-CRATE ?auto_518126 ) ( not ( = ?auto_518122 ?auto_518126 ) ) ( AVAILABLE ?auto_518131 ) ( ON ?auto_518122 ?auto_518125 ) ( not ( = ?auto_518125 ?auto_518122 ) ) ( not ( = ?auto_518125 ?auto_518126 ) ) ( TRUCK-AT ?auto_518128 ?auto_518129 ) ( not ( = ?auto_518129 ?auto_518127 ) ) ( HOIST-AT ?auto_518132 ?auto_518129 ) ( not ( = ?auto_518131 ?auto_518132 ) ) ( AVAILABLE ?auto_518132 ) ( SURFACE-AT ?auto_518126 ?auto_518129 ) ( ON ?auto_518126 ?auto_518130 ) ( CLEAR ?auto_518126 ) ( not ( = ?auto_518122 ?auto_518130 ) ) ( not ( = ?auto_518126 ?auto_518130 ) ) ( not ( = ?auto_518125 ?auto_518130 ) ) ( ON ?auto_518124 ?auto_518123 ) ( ON ?auto_518125 ?auto_518124 ) ( not ( = ?auto_518123 ?auto_518124 ) ) ( not ( = ?auto_518123 ?auto_518125 ) ) ( not ( = ?auto_518123 ?auto_518122 ) ) ( not ( = ?auto_518123 ?auto_518126 ) ) ( not ( = ?auto_518123 ?auto_518130 ) ) ( not ( = ?auto_518124 ?auto_518125 ) ) ( not ( = ?auto_518124 ?auto_518122 ) ) ( not ( = ?auto_518124 ?auto_518126 ) ) ( not ( = ?auto_518124 ?auto_518130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518125 ?auto_518122 ?auto_518126 )
      ( MAKE-4CRATE-VERIFY ?auto_518123 ?auto_518124 ?auto_518125 ?auto_518122 ?auto_518126 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518162 - SURFACE
      ?auto_518163 - SURFACE
      ?auto_518164 - SURFACE
      ?auto_518161 - SURFACE
      ?auto_518165 - SURFACE
    )
    :vars
    (
      ?auto_518169 - HOIST
      ?auto_518170 - PLACE
      ?auto_518167 - PLACE
      ?auto_518171 - HOIST
      ?auto_518166 - SURFACE
      ?auto_518168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518169 ?auto_518170 ) ( SURFACE-AT ?auto_518161 ?auto_518170 ) ( CLEAR ?auto_518161 ) ( IS-CRATE ?auto_518165 ) ( not ( = ?auto_518161 ?auto_518165 ) ) ( AVAILABLE ?auto_518169 ) ( ON ?auto_518161 ?auto_518164 ) ( not ( = ?auto_518164 ?auto_518161 ) ) ( not ( = ?auto_518164 ?auto_518165 ) ) ( not ( = ?auto_518167 ?auto_518170 ) ) ( HOIST-AT ?auto_518171 ?auto_518167 ) ( not ( = ?auto_518169 ?auto_518171 ) ) ( AVAILABLE ?auto_518171 ) ( SURFACE-AT ?auto_518165 ?auto_518167 ) ( ON ?auto_518165 ?auto_518166 ) ( CLEAR ?auto_518165 ) ( not ( = ?auto_518161 ?auto_518166 ) ) ( not ( = ?auto_518165 ?auto_518166 ) ) ( not ( = ?auto_518164 ?auto_518166 ) ) ( TRUCK-AT ?auto_518168 ?auto_518170 ) ( ON ?auto_518163 ?auto_518162 ) ( ON ?auto_518164 ?auto_518163 ) ( not ( = ?auto_518162 ?auto_518163 ) ) ( not ( = ?auto_518162 ?auto_518164 ) ) ( not ( = ?auto_518162 ?auto_518161 ) ) ( not ( = ?auto_518162 ?auto_518165 ) ) ( not ( = ?auto_518162 ?auto_518166 ) ) ( not ( = ?auto_518163 ?auto_518164 ) ) ( not ( = ?auto_518163 ?auto_518161 ) ) ( not ( = ?auto_518163 ?auto_518165 ) ) ( not ( = ?auto_518163 ?auto_518166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518164 ?auto_518161 ?auto_518165 )
      ( MAKE-4CRATE-VERIFY ?auto_518162 ?auto_518163 ?auto_518164 ?auto_518161 ?auto_518165 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518201 - SURFACE
      ?auto_518202 - SURFACE
      ?auto_518203 - SURFACE
      ?auto_518200 - SURFACE
      ?auto_518204 - SURFACE
    )
    :vars
    (
      ?auto_518206 - HOIST
      ?auto_518210 - PLACE
      ?auto_518207 - PLACE
      ?auto_518205 - HOIST
      ?auto_518208 - SURFACE
      ?auto_518209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518206 ?auto_518210 ) ( IS-CRATE ?auto_518204 ) ( not ( = ?auto_518200 ?auto_518204 ) ) ( not ( = ?auto_518203 ?auto_518200 ) ) ( not ( = ?auto_518203 ?auto_518204 ) ) ( not ( = ?auto_518207 ?auto_518210 ) ) ( HOIST-AT ?auto_518205 ?auto_518207 ) ( not ( = ?auto_518206 ?auto_518205 ) ) ( AVAILABLE ?auto_518205 ) ( SURFACE-AT ?auto_518204 ?auto_518207 ) ( ON ?auto_518204 ?auto_518208 ) ( CLEAR ?auto_518204 ) ( not ( = ?auto_518200 ?auto_518208 ) ) ( not ( = ?auto_518204 ?auto_518208 ) ) ( not ( = ?auto_518203 ?auto_518208 ) ) ( TRUCK-AT ?auto_518209 ?auto_518210 ) ( SURFACE-AT ?auto_518203 ?auto_518210 ) ( CLEAR ?auto_518203 ) ( LIFTING ?auto_518206 ?auto_518200 ) ( IS-CRATE ?auto_518200 ) ( ON ?auto_518202 ?auto_518201 ) ( ON ?auto_518203 ?auto_518202 ) ( not ( = ?auto_518201 ?auto_518202 ) ) ( not ( = ?auto_518201 ?auto_518203 ) ) ( not ( = ?auto_518201 ?auto_518200 ) ) ( not ( = ?auto_518201 ?auto_518204 ) ) ( not ( = ?auto_518201 ?auto_518208 ) ) ( not ( = ?auto_518202 ?auto_518203 ) ) ( not ( = ?auto_518202 ?auto_518200 ) ) ( not ( = ?auto_518202 ?auto_518204 ) ) ( not ( = ?auto_518202 ?auto_518208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518203 ?auto_518200 ?auto_518204 )
      ( MAKE-4CRATE-VERIFY ?auto_518201 ?auto_518202 ?auto_518203 ?auto_518200 ?auto_518204 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_518240 - SURFACE
      ?auto_518241 - SURFACE
      ?auto_518242 - SURFACE
      ?auto_518239 - SURFACE
      ?auto_518243 - SURFACE
    )
    :vars
    (
      ?auto_518248 - HOIST
      ?auto_518244 - PLACE
      ?auto_518246 - PLACE
      ?auto_518249 - HOIST
      ?auto_518245 - SURFACE
      ?auto_518247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518248 ?auto_518244 ) ( IS-CRATE ?auto_518243 ) ( not ( = ?auto_518239 ?auto_518243 ) ) ( not ( = ?auto_518242 ?auto_518239 ) ) ( not ( = ?auto_518242 ?auto_518243 ) ) ( not ( = ?auto_518246 ?auto_518244 ) ) ( HOIST-AT ?auto_518249 ?auto_518246 ) ( not ( = ?auto_518248 ?auto_518249 ) ) ( AVAILABLE ?auto_518249 ) ( SURFACE-AT ?auto_518243 ?auto_518246 ) ( ON ?auto_518243 ?auto_518245 ) ( CLEAR ?auto_518243 ) ( not ( = ?auto_518239 ?auto_518245 ) ) ( not ( = ?auto_518243 ?auto_518245 ) ) ( not ( = ?auto_518242 ?auto_518245 ) ) ( TRUCK-AT ?auto_518247 ?auto_518244 ) ( SURFACE-AT ?auto_518242 ?auto_518244 ) ( CLEAR ?auto_518242 ) ( IS-CRATE ?auto_518239 ) ( AVAILABLE ?auto_518248 ) ( IN ?auto_518239 ?auto_518247 ) ( ON ?auto_518241 ?auto_518240 ) ( ON ?auto_518242 ?auto_518241 ) ( not ( = ?auto_518240 ?auto_518241 ) ) ( not ( = ?auto_518240 ?auto_518242 ) ) ( not ( = ?auto_518240 ?auto_518239 ) ) ( not ( = ?auto_518240 ?auto_518243 ) ) ( not ( = ?auto_518240 ?auto_518245 ) ) ( not ( = ?auto_518241 ?auto_518242 ) ) ( not ( = ?auto_518241 ?auto_518239 ) ) ( not ( = ?auto_518241 ?auto_518243 ) ) ( not ( = ?auto_518241 ?auto_518245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518242 ?auto_518239 ?auto_518243 )
      ( MAKE-4CRATE-VERIFY ?auto_518240 ?auto_518241 ?auto_518242 ?auto_518239 ?auto_518243 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518900 - SURFACE
      ?auto_518901 - SURFACE
      ?auto_518902 - SURFACE
      ?auto_518899 - SURFACE
      ?auto_518903 - SURFACE
      ?auto_518904 - SURFACE
    )
    :vars
    (
      ?auto_518905 - HOIST
      ?auto_518906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518905 ?auto_518906 ) ( SURFACE-AT ?auto_518903 ?auto_518906 ) ( CLEAR ?auto_518903 ) ( LIFTING ?auto_518905 ?auto_518904 ) ( IS-CRATE ?auto_518904 ) ( not ( = ?auto_518903 ?auto_518904 ) ) ( ON ?auto_518901 ?auto_518900 ) ( ON ?auto_518902 ?auto_518901 ) ( ON ?auto_518899 ?auto_518902 ) ( ON ?auto_518903 ?auto_518899 ) ( not ( = ?auto_518900 ?auto_518901 ) ) ( not ( = ?auto_518900 ?auto_518902 ) ) ( not ( = ?auto_518900 ?auto_518899 ) ) ( not ( = ?auto_518900 ?auto_518903 ) ) ( not ( = ?auto_518900 ?auto_518904 ) ) ( not ( = ?auto_518901 ?auto_518902 ) ) ( not ( = ?auto_518901 ?auto_518899 ) ) ( not ( = ?auto_518901 ?auto_518903 ) ) ( not ( = ?auto_518901 ?auto_518904 ) ) ( not ( = ?auto_518902 ?auto_518899 ) ) ( not ( = ?auto_518902 ?auto_518903 ) ) ( not ( = ?auto_518902 ?auto_518904 ) ) ( not ( = ?auto_518899 ?auto_518903 ) ) ( not ( = ?auto_518899 ?auto_518904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_518903 ?auto_518904 )
      ( MAKE-5CRATE-VERIFY ?auto_518900 ?auto_518901 ?auto_518902 ?auto_518899 ?auto_518903 ?auto_518904 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518934 - SURFACE
      ?auto_518935 - SURFACE
      ?auto_518936 - SURFACE
      ?auto_518933 - SURFACE
      ?auto_518937 - SURFACE
      ?auto_518938 - SURFACE
    )
    :vars
    (
      ?auto_518940 - HOIST
      ?auto_518939 - PLACE
      ?auto_518941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518940 ?auto_518939 ) ( SURFACE-AT ?auto_518937 ?auto_518939 ) ( CLEAR ?auto_518937 ) ( IS-CRATE ?auto_518938 ) ( not ( = ?auto_518937 ?auto_518938 ) ) ( TRUCK-AT ?auto_518941 ?auto_518939 ) ( AVAILABLE ?auto_518940 ) ( IN ?auto_518938 ?auto_518941 ) ( ON ?auto_518937 ?auto_518933 ) ( not ( = ?auto_518933 ?auto_518937 ) ) ( not ( = ?auto_518933 ?auto_518938 ) ) ( ON ?auto_518935 ?auto_518934 ) ( ON ?auto_518936 ?auto_518935 ) ( ON ?auto_518933 ?auto_518936 ) ( not ( = ?auto_518934 ?auto_518935 ) ) ( not ( = ?auto_518934 ?auto_518936 ) ) ( not ( = ?auto_518934 ?auto_518933 ) ) ( not ( = ?auto_518934 ?auto_518937 ) ) ( not ( = ?auto_518934 ?auto_518938 ) ) ( not ( = ?auto_518935 ?auto_518936 ) ) ( not ( = ?auto_518935 ?auto_518933 ) ) ( not ( = ?auto_518935 ?auto_518937 ) ) ( not ( = ?auto_518935 ?auto_518938 ) ) ( not ( = ?auto_518936 ?auto_518933 ) ) ( not ( = ?auto_518936 ?auto_518937 ) ) ( not ( = ?auto_518936 ?auto_518938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518933 ?auto_518937 ?auto_518938 )
      ( MAKE-5CRATE-VERIFY ?auto_518934 ?auto_518935 ?auto_518936 ?auto_518933 ?auto_518937 ?auto_518938 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518974 - SURFACE
      ?auto_518975 - SURFACE
      ?auto_518976 - SURFACE
      ?auto_518973 - SURFACE
      ?auto_518977 - SURFACE
      ?auto_518978 - SURFACE
    )
    :vars
    (
      ?auto_518982 - HOIST
      ?auto_518979 - PLACE
      ?auto_518981 - TRUCK
      ?auto_518980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518982 ?auto_518979 ) ( SURFACE-AT ?auto_518977 ?auto_518979 ) ( CLEAR ?auto_518977 ) ( IS-CRATE ?auto_518978 ) ( not ( = ?auto_518977 ?auto_518978 ) ) ( AVAILABLE ?auto_518982 ) ( IN ?auto_518978 ?auto_518981 ) ( ON ?auto_518977 ?auto_518973 ) ( not ( = ?auto_518973 ?auto_518977 ) ) ( not ( = ?auto_518973 ?auto_518978 ) ) ( TRUCK-AT ?auto_518981 ?auto_518980 ) ( not ( = ?auto_518980 ?auto_518979 ) ) ( ON ?auto_518975 ?auto_518974 ) ( ON ?auto_518976 ?auto_518975 ) ( ON ?auto_518973 ?auto_518976 ) ( not ( = ?auto_518974 ?auto_518975 ) ) ( not ( = ?auto_518974 ?auto_518976 ) ) ( not ( = ?auto_518974 ?auto_518973 ) ) ( not ( = ?auto_518974 ?auto_518977 ) ) ( not ( = ?auto_518974 ?auto_518978 ) ) ( not ( = ?auto_518975 ?auto_518976 ) ) ( not ( = ?auto_518975 ?auto_518973 ) ) ( not ( = ?auto_518975 ?auto_518977 ) ) ( not ( = ?auto_518975 ?auto_518978 ) ) ( not ( = ?auto_518976 ?auto_518973 ) ) ( not ( = ?auto_518976 ?auto_518977 ) ) ( not ( = ?auto_518976 ?auto_518978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518973 ?auto_518977 ?auto_518978 )
      ( MAKE-5CRATE-VERIFY ?auto_518974 ?auto_518975 ?auto_518976 ?auto_518973 ?auto_518977 ?auto_518978 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_519019 - SURFACE
      ?auto_519020 - SURFACE
      ?auto_519021 - SURFACE
      ?auto_519018 - SURFACE
      ?auto_519022 - SURFACE
      ?auto_519023 - SURFACE
    )
    :vars
    (
      ?auto_519027 - HOIST
      ?auto_519024 - PLACE
      ?auto_519026 - TRUCK
      ?auto_519025 - PLACE
      ?auto_519028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_519027 ?auto_519024 ) ( SURFACE-AT ?auto_519022 ?auto_519024 ) ( CLEAR ?auto_519022 ) ( IS-CRATE ?auto_519023 ) ( not ( = ?auto_519022 ?auto_519023 ) ) ( AVAILABLE ?auto_519027 ) ( ON ?auto_519022 ?auto_519018 ) ( not ( = ?auto_519018 ?auto_519022 ) ) ( not ( = ?auto_519018 ?auto_519023 ) ) ( TRUCK-AT ?auto_519026 ?auto_519025 ) ( not ( = ?auto_519025 ?auto_519024 ) ) ( HOIST-AT ?auto_519028 ?auto_519025 ) ( LIFTING ?auto_519028 ?auto_519023 ) ( not ( = ?auto_519027 ?auto_519028 ) ) ( ON ?auto_519020 ?auto_519019 ) ( ON ?auto_519021 ?auto_519020 ) ( ON ?auto_519018 ?auto_519021 ) ( not ( = ?auto_519019 ?auto_519020 ) ) ( not ( = ?auto_519019 ?auto_519021 ) ) ( not ( = ?auto_519019 ?auto_519018 ) ) ( not ( = ?auto_519019 ?auto_519022 ) ) ( not ( = ?auto_519019 ?auto_519023 ) ) ( not ( = ?auto_519020 ?auto_519021 ) ) ( not ( = ?auto_519020 ?auto_519018 ) ) ( not ( = ?auto_519020 ?auto_519022 ) ) ( not ( = ?auto_519020 ?auto_519023 ) ) ( not ( = ?auto_519021 ?auto_519018 ) ) ( not ( = ?auto_519021 ?auto_519022 ) ) ( not ( = ?auto_519021 ?auto_519023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519018 ?auto_519022 ?auto_519023 )
      ( MAKE-5CRATE-VERIFY ?auto_519019 ?auto_519020 ?auto_519021 ?auto_519018 ?auto_519022 ?auto_519023 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_519069 - SURFACE
      ?auto_519070 - SURFACE
      ?auto_519071 - SURFACE
      ?auto_519068 - SURFACE
      ?auto_519072 - SURFACE
      ?auto_519073 - SURFACE
    )
    :vars
    (
      ?auto_519075 - HOIST
      ?auto_519078 - PLACE
      ?auto_519079 - TRUCK
      ?auto_519076 - PLACE
      ?auto_519074 - HOIST
      ?auto_519077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519075 ?auto_519078 ) ( SURFACE-AT ?auto_519072 ?auto_519078 ) ( CLEAR ?auto_519072 ) ( IS-CRATE ?auto_519073 ) ( not ( = ?auto_519072 ?auto_519073 ) ) ( AVAILABLE ?auto_519075 ) ( ON ?auto_519072 ?auto_519068 ) ( not ( = ?auto_519068 ?auto_519072 ) ) ( not ( = ?auto_519068 ?auto_519073 ) ) ( TRUCK-AT ?auto_519079 ?auto_519076 ) ( not ( = ?auto_519076 ?auto_519078 ) ) ( HOIST-AT ?auto_519074 ?auto_519076 ) ( not ( = ?auto_519075 ?auto_519074 ) ) ( AVAILABLE ?auto_519074 ) ( SURFACE-AT ?auto_519073 ?auto_519076 ) ( ON ?auto_519073 ?auto_519077 ) ( CLEAR ?auto_519073 ) ( not ( = ?auto_519072 ?auto_519077 ) ) ( not ( = ?auto_519073 ?auto_519077 ) ) ( not ( = ?auto_519068 ?auto_519077 ) ) ( ON ?auto_519070 ?auto_519069 ) ( ON ?auto_519071 ?auto_519070 ) ( ON ?auto_519068 ?auto_519071 ) ( not ( = ?auto_519069 ?auto_519070 ) ) ( not ( = ?auto_519069 ?auto_519071 ) ) ( not ( = ?auto_519069 ?auto_519068 ) ) ( not ( = ?auto_519069 ?auto_519072 ) ) ( not ( = ?auto_519069 ?auto_519073 ) ) ( not ( = ?auto_519069 ?auto_519077 ) ) ( not ( = ?auto_519070 ?auto_519071 ) ) ( not ( = ?auto_519070 ?auto_519068 ) ) ( not ( = ?auto_519070 ?auto_519072 ) ) ( not ( = ?auto_519070 ?auto_519073 ) ) ( not ( = ?auto_519070 ?auto_519077 ) ) ( not ( = ?auto_519071 ?auto_519068 ) ) ( not ( = ?auto_519071 ?auto_519072 ) ) ( not ( = ?auto_519071 ?auto_519073 ) ) ( not ( = ?auto_519071 ?auto_519077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519068 ?auto_519072 ?auto_519073 )
      ( MAKE-5CRATE-VERIFY ?auto_519069 ?auto_519070 ?auto_519071 ?auto_519068 ?auto_519072 ?auto_519073 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_519120 - SURFACE
      ?auto_519121 - SURFACE
      ?auto_519122 - SURFACE
      ?auto_519119 - SURFACE
      ?auto_519123 - SURFACE
      ?auto_519124 - SURFACE
    )
    :vars
    (
      ?auto_519128 - HOIST
      ?auto_519127 - PLACE
      ?auto_519130 - PLACE
      ?auto_519129 - HOIST
      ?auto_519125 - SURFACE
      ?auto_519126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519128 ?auto_519127 ) ( SURFACE-AT ?auto_519123 ?auto_519127 ) ( CLEAR ?auto_519123 ) ( IS-CRATE ?auto_519124 ) ( not ( = ?auto_519123 ?auto_519124 ) ) ( AVAILABLE ?auto_519128 ) ( ON ?auto_519123 ?auto_519119 ) ( not ( = ?auto_519119 ?auto_519123 ) ) ( not ( = ?auto_519119 ?auto_519124 ) ) ( not ( = ?auto_519130 ?auto_519127 ) ) ( HOIST-AT ?auto_519129 ?auto_519130 ) ( not ( = ?auto_519128 ?auto_519129 ) ) ( AVAILABLE ?auto_519129 ) ( SURFACE-AT ?auto_519124 ?auto_519130 ) ( ON ?auto_519124 ?auto_519125 ) ( CLEAR ?auto_519124 ) ( not ( = ?auto_519123 ?auto_519125 ) ) ( not ( = ?auto_519124 ?auto_519125 ) ) ( not ( = ?auto_519119 ?auto_519125 ) ) ( TRUCK-AT ?auto_519126 ?auto_519127 ) ( ON ?auto_519121 ?auto_519120 ) ( ON ?auto_519122 ?auto_519121 ) ( ON ?auto_519119 ?auto_519122 ) ( not ( = ?auto_519120 ?auto_519121 ) ) ( not ( = ?auto_519120 ?auto_519122 ) ) ( not ( = ?auto_519120 ?auto_519119 ) ) ( not ( = ?auto_519120 ?auto_519123 ) ) ( not ( = ?auto_519120 ?auto_519124 ) ) ( not ( = ?auto_519120 ?auto_519125 ) ) ( not ( = ?auto_519121 ?auto_519122 ) ) ( not ( = ?auto_519121 ?auto_519119 ) ) ( not ( = ?auto_519121 ?auto_519123 ) ) ( not ( = ?auto_519121 ?auto_519124 ) ) ( not ( = ?auto_519121 ?auto_519125 ) ) ( not ( = ?auto_519122 ?auto_519119 ) ) ( not ( = ?auto_519122 ?auto_519123 ) ) ( not ( = ?auto_519122 ?auto_519124 ) ) ( not ( = ?auto_519122 ?auto_519125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519119 ?auto_519123 ?auto_519124 )
      ( MAKE-5CRATE-VERIFY ?auto_519120 ?auto_519121 ?auto_519122 ?auto_519119 ?auto_519123 ?auto_519124 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_519171 - SURFACE
      ?auto_519172 - SURFACE
      ?auto_519173 - SURFACE
      ?auto_519170 - SURFACE
      ?auto_519174 - SURFACE
      ?auto_519175 - SURFACE
    )
    :vars
    (
      ?auto_519176 - HOIST
      ?auto_519180 - PLACE
      ?auto_519177 - PLACE
      ?auto_519179 - HOIST
      ?auto_519178 - SURFACE
      ?auto_519181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519176 ?auto_519180 ) ( IS-CRATE ?auto_519175 ) ( not ( = ?auto_519174 ?auto_519175 ) ) ( not ( = ?auto_519170 ?auto_519174 ) ) ( not ( = ?auto_519170 ?auto_519175 ) ) ( not ( = ?auto_519177 ?auto_519180 ) ) ( HOIST-AT ?auto_519179 ?auto_519177 ) ( not ( = ?auto_519176 ?auto_519179 ) ) ( AVAILABLE ?auto_519179 ) ( SURFACE-AT ?auto_519175 ?auto_519177 ) ( ON ?auto_519175 ?auto_519178 ) ( CLEAR ?auto_519175 ) ( not ( = ?auto_519174 ?auto_519178 ) ) ( not ( = ?auto_519175 ?auto_519178 ) ) ( not ( = ?auto_519170 ?auto_519178 ) ) ( TRUCK-AT ?auto_519181 ?auto_519180 ) ( SURFACE-AT ?auto_519170 ?auto_519180 ) ( CLEAR ?auto_519170 ) ( LIFTING ?auto_519176 ?auto_519174 ) ( IS-CRATE ?auto_519174 ) ( ON ?auto_519172 ?auto_519171 ) ( ON ?auto_519173 ?auto_519172 ) ( ON ?auto_519170 ?auto_519173 ) ( not ( = ?auto_519171 ?auto_519172 ) ) ( not ( = ?auto_519171 ?auto_519173 ) ) ( not ( = ?auto_519171 ?auto_519170 ) ) ( not ( = ?auto_519171 ?auto_519174 ) ) ( not ( = ?auto_519171 ?auto_519175 ) ) ( not ( = ?auto_519171 ?auto_519178 ) ) ( not ( = ?auto_519172 ?auto_519173 ) ) ( not ( = ?auto_519172 ?auto_519170 ) ) ( not ( = ?auto_519172 ?auto_519174 ) ) ( not ( = ?auto_519172 ?auto_519175 ) ) ( not ( = ?auto_519172 ?auto_519178 ) ) ( not ( = ?auto_519173 ?auto_519170 ) ) ( not ( = ?auto_519173 ?auto_519174 ) ) ( not ( = ?auto_519173 ?auto_519175 ) ) ( not ( = ?auto_519173 ?auto_519178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519170 ?auto_519174 ?auto_519175 )
      ( MAKE-5CRATE-VERIFY ?auto_519171 ?auto_519172 ?auto_519173 ?auto_519170 ?auto_519174 ?auto_519175 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_519222 - SURFACE
      ?auto_519223 - SURFACE
      ?auto_519224 - SURFACE
      ?auto_519221 - SURFACE
      ?auto_519225 - SURFACE
      ?auto_519226 - SURFACE
    )
    :vars
    (
      ?auto_519228 - HOIST
      ?auto_519229 - PLACE
      ?auto_519231 - PLACE
      ?auto_519232 - HOIST
      ?auto_519227 - SURFACE
      ?auto_519230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519228 ?auto_519229 ) ( IS-CRATE ?auto_519226 ) ( not ( = ?auto_519225 ?auto_519226 ) ) ( not ( = ?auto_519221 ?auto_519225 ) ) ( not ( = ?auto_519221 ?auto_519226 ) ) ( not ( = ?auto_519231 ?auto_519229 ) ) ( HOIST-AT ?auto_519232 ?auto_519231 ) ( not ( = ?auto_519228 ?auto_519232 ) ) ( AVAILABLE ?auto_519232 ) ( SURFACE-AT ?auto_519226 ?auto_519231 ) ( ON ?auto_519226 ?auto_519227 ) ( CLEAR ?auto_519226 ) ( not ( = ?auto_519225 ?auto_519227 ) ) ( not ( = ?auto_519226 ?auto_519227 ) ) ( not ( = ?auto_519221 ?auto_519227 ) ) ( TRUCK-AT ?auto_519230 ?auto_519229 ) ( SURFACE-AT ?auto_519221 ?auto_519229 ) ( CLEAR ?auto_519221 ) ( IS-CRATE ?auto_519225 ) ( AVAILABLE ?auto_519228 ) ( IN ?auto_519225 ?auto_519230 ) ( ON ?auto_519223 ?auto_519222 ) ( ON ?auto_519224 ?auto_519223 ) ( ON ?auto_519221 ?auto_519224 ) ( not ( = ?auto_519222 ?auto_519223 ) ) ( not ( = ?auto_519222 ?auto_519224 ) ) ( not ( = ?auto_519222 ?auto_519221 ) ) ( not ( = ?auto_519222 ?auto_519225 ) ) ( not ( = ?auto_519222 ?auto_519226 ) ) ( not ( = ?auto_519222 ?auto_519227 ) ) ( not ( = ?auto_519223 ?auto_519224 ) ) ( not ( = ?auto_519223 ?auto_519221 ) ) ( not ( = ?auto_519223 ?auto_519225 ) ) ( not ( = ?auto_519223 ?auto_519226 ) ) ( not ( = ?auto_519223 ?auto_519227 ) ) ( not ( = ?auto_519224 ?auto_519221 ) ) ( not ( = ?auto_519224 ?auto_519225 ) ) ( not ( = ?auto_519224 ?auto_519226 ) ) ( not ( = ?auto_519224 ?auto_519227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519221 ?auto_519225 ?auto_519226 )
      ( MAKE-5CRATE-VERIFY ?auto_519222 ?auto_519223 ?auto_519224 ?auto_519221 ?auto_519225 ?auto_519226 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_519901 - SURFACE
      ?auto_519902 - SURFACE
    )
    :vars
    (
      ?auto_519906 - HOIST
      ?auto_519905 - PLACE
      ?auto_519903 - SURFACE
      ?auto_519904 - TRUCK
      ?auto_519909 - PLACE
      ?auto_519908 - HOIST
      ?auto_519907 - SURFACE
      ?auto_519910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519906 ?auto_519905 ) ( SURFACE-AT ?auto_519901 ?auto_519905 ) ( CLEAR ?auto_519901 ) ( IS-CRATE ?auto_519902 ) ( not ( = ?auto_519901 ?auto_519902 ) ) ( AVAILABLE ?auto_519906 ) ( ON ?auto_519901 ?auto_519903 ) ( not ( = ?auto_519903 ?auto_519901 ) ) ( not ( = ?auto_519903 ?auto_519902 ) ) ( TRUCK-AT ?auto_519904 ?auto_519909 ) ( not ( = ?auto_519909 ?auto_519905 ) ) ( HOIST-AT ?auto_519908 ?auto_519909 ) ( not ( = ?auto_519906 ?auto_519908 ) ) ( SURFACE-AT ?auto_519902 ?auto_519909 ) ( ON ?auto_519902 ?auto_519907 ) ( CLEAR ?auto_519902 ) ( not ( = ?auto_519901 ?auto_519907 ) ) ( not ( = ?auto_519902 ?auto_519907 ) ) ( not ( = ?auto_519903 ?auto_519907 ) ) ( LIFTING ?auto_519908 ?auto_519910 ) ( IS-CRATE ?auto_519910 ) ( not ( = ?auto_519901 ?auto_519910 ) ) ( not ( = ?auto_519902 ?auto_519910 ) ) ( not ( = ?auto_519903 ?auto_519910 ) ) ( not ( = ?auto_519907 ?auto_519910 ) ) )
    :subtasks
    ( ( !LOAD ?auto_519908 ?auto_519910 ?auto_519904 ?auto_519909 )
      ( MAKE-1CRATE ?auto_519901 ?auto_519902 )
      ( MAKE-1CRATE-VERIFY ?auto_519901 ?auto_519902 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520428 - SURFACE
      ?auto_520429 - SURFACE
      ?auto_520430 - SURFACE
      ?auto_520427 - SURFACE
      ?auto_520431 - SURFACE
      ?auto_520433 - SURFACE
      ?auto_520432 - SURFACE
    )
    :vars
    (
      ?auto_520434 - HOIST
      ?auto_520435 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520434 ?auto_520435 ) ( SURFACE-AT ?auto_520433 ?auto_520435 ) ( CLEAR ?auto_520433 ) ( LIFTING ?auto_520434 ?auto_520432 ) ( IS-CRATE ?auto_520432 ) ( not ( = ?auto_520433 ?auto_520432 ) ) ( ON ?auto_520429 ?auto_520428 ) ( ON ?auto_520430 ?auto_520429 ) ( ON ?auto_520427 ?auto_520430 ) ( ON ?auto_520431 ?auto_520427 ) ( ON ?auto_520433 ?auto_520431 ) ( not ( = ?auto_520428 ?auto_520429 ) ) ( not ( = ?auto_520428 ?auto_520430 ) ) ( not ( = ?auto_520428 ?auto_520427 ) ) ( not ( = ?auto_520428 ?auto_520431 ) ) ( not ( = ?auto_520428 ?auto_520433 ) ) ( not ( = ?auto_520428 ?auto_520432 ) ) ( not ( = ?auto_520429 ?auto_520430 ) ) ( not ( = ?auto_520429 ?auto_520427 ) ) ( not ( = ?auto_520429 ?auto_520431 ) ) ( not ( = ?auto_520429 ?auto_520433 ) ) ( not ( = ?auto_520429 ?auto_520432 ) ) ( not ( = ?auto_520430 ?auto_520427 ) ) ( not ( = ?auto_520430 ?auto_520431 ) ) ( not ( = ?auto_520430 ?auto_520433 ) ) ( not ( = ?auto_520430 ?auto_520432 ) ) ( not ( = ?auto_520427 ?auto_520431 ) ) ( not ( = ?auto_520427 ?auto_520433 ) ) ( not ( = ?auto_520427 ?auto_520432 ) ) ( not ( = ?auto_520431 ?auto_520433 ) ) ( not ( = ?auto_520431 ?auto_520432 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_520433 ?auto_520432 )
      ( MAKE-6CRATE-VERIFY ?auto_520428 ?auto_520429 ?auto_520430 ?auto_520427 ?auto_520431 ?auto_520433 ?auto_520432 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520472 - SURFACE
      ?auto_520473 - SURFACE
      ?auto_520474 - SURFACE
      ?auto_520471 - SURFACE
      ?auto_520475 - SURFACE
      ?auto_520477 - SURFACE
      ?auto_520476 - SURFACE
    )
    :vars
    (
      ?auto_520480 - HOIST
      ?auto_520479 - PLACE
      ?auto_520478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520480 ?auto_520479 ) ( SURFACE-AT ?auto_520477 ?auto_520479 ) ( CLEAR ?auto_520477 ) ( IS-CRATE ?auto_520476 ) ( not ( = ?auto_520477 ?auto_520476 ) ) ( TRUCK-AT ?auto_520478 ?auto_520479 ) ( AVAILABLE ?auto_520480 ) ( IN ?auto_520476 ?auto_520478 ) ( ON ?auto_520477 ?auto_520475 ) ( not ( = ?auto_520475 ?auto_520477 ) ) ( not ( = ?auto_520475 ?auto_520476 ) ) ( ON ?auto_520473 ?auto_520472 ) ( ON ?auto_520474 ?auto_520473 ) ( ON ?auto_520471 ?auto_520474 ) ( ON ?auto_520475 ?auto_520471 ) ( not ( = ?auto_520472 ?auto_520473 ) ) ( not ( = ?auto_520472 ?auto_520474 ) ) ( not ( = ?auto_520472 ?auto_520471 ) ) ( not ( = ?auto_520472 ?auto_520475 ) ) ( not ( = ?auto_520472 ?auto_520477 ) ) ( not ( = ?auto_520472 ?auto_520476 ) ) ( not ( = ?auto_520473 ?auto_520474 ) ) ( not ( = ?auto_520473 ?auto_520471 ) ) ( not ( = ?auto_520473 ?auto_520475 ) ) ( not ( = ?auto_520473 ?auto_520477 ) ) ( not ( = ?auto_520473 ?auto_520476 ) ) ( not ( = ?auto_520474 ?auto_520471 ) ) ( not ( = ?auto_520474 ?auto_520475 ) ) ( not ( = ?auto_520474 ?auto_520477 ) ) ( not ( = ?auto_520474 ?auto_520476 ) ) ( not ( = ?auto_520471 ?auto_520475 ) ) ( not ( = ?auto_520471 ?auto_520477 ) ) ( not ( = ?auto_520471 ?auto_520476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520475 ?auto_520477 ?auto_520476 )
      ( MAKE-6CRATE-VERIFY ?auto_520472 ?auto_520473 ?auto_520474 ?auto_520471 ?auto_520475 ?auto_520477 ?auto_520476 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520523 - SURFACE
      ?auto_520524 - SURFACE
      ?auto_520525 - SURFACE
      ?auto_520522 - SURFACE
      ?auto_520526 - SURFACE
      ?auto_520528 - SURFACE
      ?auto_520527 - SURFACE
    )
    :vars
    (
      ?auto_520532 - HOIST
      ?auto_520529 - PLACE
      ?auto_520530 - TRUCK
      ?auto_520531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520532 ?auto_520529 ) ( SURFACE-AT ?auto_520528 ?auto_520529 ) ( CLEAR ?auto_520528 ) ( IS-CRATE ?auto_520527 ) ( not ( = ?auto_520528 ?auto_520527 ) ) ( AVAILABLE ?auto_520532 ) ( IN ?auto_520527 ?auto_520530 ) ( ON ?auto_520528 ?auto_520526 ) ( not ( = ?auto_520526 ?auto_520528 ) ) ( not ( = ?auto_520526 ?auto_520527 ) ) ( TRUCK-AT ?auto_520530 ?auto_520531 ) ( not ( = ?auto_520531 ?auto_520529 ) ) ( ON ?auto_520524 ?auto_520523 ) ( ON ?auto_520525 ?auto_520524 ) ( ON ?auto_520522 ?auto_520525 ) ( ON ?auto_520526 ?auto_520522 ) ( not ( = ?auto_520523 ?auto_520524 ) ) ( not ( = ?auto_520523 ?auto_520525 ) ) ( not ( = ?auto_520523 ?auto_520522 ) ) ( not ( = ?auto_520523 ?auto_520526 ) ) ( not ( = ?auto_520523 ?auto_520528 ) ) ( not ( = ?auto_520523 ?auto_520527 ) ) ( not ( = ?auto_520524 ?auto_520525 ) ) ( not ( = ?auto_520524 ?auto_520522 ) ) ( not ( = ?auto_520524 ?auto_520526 ) ) ( not ( = ?auto_520524 ?auto_520528 ) ) ( not ( = ?auto_520524 ?auto_520527 ) ) ( not ( = ?auto_520525 ?auto_520522 ) ) ( not ( = ?auto_520525 ?auto_520526 ) ) ( not ( = ?auto_520525 ?auto_520528 ) ) ( not ( = ?auto_520525 ?auto_520527 ) ) ( not ( = ?auto_520522 ?auto_520526 ) ) ( not ( = ?auto_520522 ?auto_520528 ) ) ( not ( = ?auto_520522 ?auto_520527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520526 ?auto_520528 ?auto_520527 )
      ( MAKE-6CRATE-VERIFY ?auto_520523 ?auto_520524 ?auto_520525 ?auto_520522 ?auto_520526 ?auto_520528 ?auto_520527 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520580 - SURFACE
      ?auto_520581 - SURFACE
      ?auto_520582 - SURFACE
      ?auto_520579 - SURFACE
      ?auto_520583 - SURFACE
      ?auto_520585 - SURFACE
      ?auto_520584 - SURFACE
    )
    :vars
    (
      ?auto_520587 - HOIST
      ?auto_520590 - PLACE
      ?auto_520586 - TRUCK
      ?auto_520588 - PLACE
      ?auto_520589 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_520587 ?auto_520590 ) ( SURFACE-AT ?auto_520585 ?auto_520590 ) ( CLEAR ?auto_520585 ) ( IS-CRATE ?auto_520584 ) ( not ( = ?auto_520585 ?auto_520584 ) ) ( AVAILABLE ?auto_520587 ) ( ON ?auto_520585 ?auto_520583 ) ( not ( = ?auto_520583 ?auto_520585 ) ) ( not ( = ?auto_520583 ?auto_520584 ) ) ( TRUCK-AT ?auto_520586 ?auto_520588 ) ( not ( = ?auto_520588 ?auto_520590 ) ) ( HOIST-AT ?auto_520589 ?auto_520588 ) ( LIFTING ?auto_520589 ?auto_520584 ) ( not ( = ?auto_520587 ?auto_520589 ) ) ( ON ?auto_520581 ?auto_520580 ) ( ON ?auto_520582 ?auto_520581 ) ( ON ?auto_520579 ?auto_520582 ) ( ON ?auto_520583 ?auto_520579 ) ( not ( = ?auto_520580 ?auto_520581 ) ) ( not ( = ?auto_520580 ?auto_520582 ) ) ( not ( = ?auto_520580 ?auto_520579 ) ) ( not ( = ?auto_520580 ?auto_520583 ) ) ( not ( = ?auto_520580 ?auto_520585 ) ) ( not ( = ?auto_520580 ?auto_520584 ) ) ( not ( = ?auto_520581 ?auto_520582 ) ) ( not ( = ?auto_520581 ?auto_520579 ) ) ( not ( = ?auto_520581 ?auto_520583 ) ) ( not ( = ?auto_520581 ?auto_520585 ) ) ( not ( = ?auto_520581 ?auto_520584 ) ) ( not ( = ?auto_520582 ?auto_520579 ) ) ( not ( = ?auto_520582 ?auto_520583 ) ) ( not ( = ?auto_520582 ?auto_520585 ) ) ( not ( = ?auto_520582 ?auto_520584 ) ) ( not ( = ?auto_520579 ?auto_520583 ) ) ( not ( = ?auto_520579 ?auto_520585 ) ) ( not ( = ?auto_520579 ?auto_520584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520583 ?auto_520585 ?auto_520584 )
      ( MAKE-6CRATE-VERIFY ?auto_520580 ?auto_520581 ?auto_520582 ?auto_520579 ?auto_520583 ?auto_520585 ?auto_520584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520643 - SURFACE
      ?auto_520644 - SURFACE
      ?auto_520645 - SURFACE
      ?auto_520642 - SURFACE
      ?auto_520646 - SURFACE
      ?auto_520648 - SURFACE
      ?auto_520647 - SURFACE
    )
    :vars
    (
      ?auto_520652 - HOIST
      ?auto_520653 - PLACE
      ?auto_520650 - TRUCK
      ?auto_520649 - PLACE
      ?auto_520651 - HOIST
      ?auto_520654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520652 ?auto_520653 ) ( SURFACE-AT ?auto_520648 ?auto_520653 ) ( CLEAR ?auto_520648 ) ( IS-CRATE ?auto_520647 ) ( not ( = ?auto_520648 ?auto_520647 ) ) ( AVAILABLE ?auto_520652 ) ( ON ?auto_520648 ?auto_520646 ) ( not ( = ?auto_520646 ?auto_520648 ) ) ( not ( = ?auto_520646 ?auto_520647 ) ) ( TRUCK-AT ?auto_520650 ?auto_520649 ) ( not ( = ?auto_520649 ?auto_520653 ) ) ( HOIST-AT ?auto_520651 ?auto_520649 ) ( not ( = ?auto_520652 ?auto_520651 ) ) ( AVAILABLE ?auto_520651 ) ( SURFACE-AT ?auto_520647 ?auto_520649 ) ( ON ?auto_520647 ?auto_520654 ) ( CLEAR ?auto_520647 ) ( not ( = ?auto_520648 ?auto_520654 ) ) ( not ( = ?auto_520647 ?auto_520654 ) ) ( not ( = ?auto_520646 ?auto_520654 ) ) ( ON ?auto_520644 ?auto_520643 ) ( ON ?auto_520645 ?auto_520644 ) ( ON ?auto_520642 ?auto_520645 ) ( ON ?auto_520646 ?auto_520642 ) ( not ( = ?auto_520643 ?auto_520644 ) ) ( not ( = ?auto_520643 ?auto_520645 ) ) ( not ( = ?auto_520643 ?auto_520642 ) ) ( not ( = ?auto_520643 ?auto_520646 ) ) ( not ( = ?auto_520643 ?auto_520648 ) ) ( not ( = ?auto_520643 ?auto_520647 ) ) ( not ( = ?auto_520643 ?auto_520654 ) ) ( not ( = ?auto_520644 ?auto_520645 ) ) ( not ( = ?auto_520644 ?auto_520642 ) ) ( not ( = ?auto_520644 ?auto_520646 ) ) ( not ( = ?auto_520644 ?auto_520648 ) ) ( not ( = ?auto_520644 ?auto_520647 ) ) ( not ( = ?auto_520644 ?auto_520654 ) ) ( not ( = ?auto_520645 ?auto_520642 ) ) ( not ( = ?auto_520645 ?auto_520646 ) ) ( not ( = ?auto_520645 ?auto_520648 ) ) ( not ( = ?auto_520645 ?auto_520647 ) ) ( not ( = ?auto_520645 ?auto_520654 ) ) ( not ( = ?auto_520642 ?auto_520646 ) ) ( not ( = ?auto_520642 ?auto_520648 ) ) ( not ( = ?auto_520642 ?auto_520647 ) ) ( not ( = ?auto_520642 ?auto_520654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520646 ?auto_520648 ?auto_520647 )
      ( MAKE-6CRATE-VERIFY ?auto_520643 ?auto_520644 ?auto_520645 ?auto_520642 ?auto_520646 ?auto_520648 ?auto_520647 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520707 - SURFACE
      ?auto_520708 - SURFACE
      ?auto_520709 - SURFACE
      ?auto_520706 - SURFACE
      ?auto_520710 - SURFACE
      ?auto_520712 - SURFACE
      ?auto_520711 - SURFACE
    )
    :vars
    (
      ?auto_520713 - HOIST
      ?auto_520717 - PLACE
      ?auto_520716 - PLACE
      ?auto_520715 - HOIST
      ?auto_520718 - SURFACE
      ?auto_520714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520713 ?auto_520717 ) ( SURFACE-AT ?auto_520712 ?auto_520717 ) ( CLEAR ?auto_520712 ) ( IS-CRATE ?auto_520711 ) ( not ( = ?auto_520712 ?auto_520711 ) ) ( AVAILABLE ?auto_520713 ) ( ON ?auto_520712 ?auto_520710 ) ( not ( = ?auto_520710 ?auto_520712 ) ) ( not ( = ?auto_520710 ?auto_520711 ) ) ( not ( = ?auto_520716 ?auto_520717 ) ) ( HOIST-AT ?auto_520715 ?auto_520716 ) ( not ( = ?auto_520713 ?auto_520715 ) ) ( AVAILABLE ?auto_520715 ) ( SURFACE-AT ?auto_520711 ?auto_520716 ) ( ON ?auto_520711 ?auto_520718 ) ( CLEAR ?auto_520711 ) ( not ( = ?auto_520712 ?auto_520718 ) ) ( not ( = ?auto_520711 ?auto_520718 ) ) ( not ( = ?auto_520710 ?auto_520718 ) ) ( TRUCK-AT ?auto_520714 ?auto_520717 ) ( ON ?auto_520708 ?auto_520707 ) ( ON ?auto_520709 ?auto_520708 ) ( ON ?auto_520706 ?auto_520709 ) ( ON ?auto_520710 ?auto_520706 ) ( not ( = ?auto_520707 ?auto_520708 ) ) ( not ( = ?auto_520707 ?auto_520709 ) ) ( not ( = ?auto_520707 ?auto_520706 ) ) ( not ( = ?auto_520707 ?auto_520710 ) ) ( not ( = ?auto_520707 ?auto_520712 ) ) ( not ( = ?auto_520707 ?auto_520711 ) ) ( not ( = ?auto_520707 ?auto_520718 ) ) ( not ( = ?auto_520708 ?auto_520709 ) ) ( not ( = ?auto_520708 ?auto_520706 ) ) ( not ( = ?auto_520708 ?auto_520710 ) ) ( not ( = ?auto_520708 ?auto_520712 ) ) ( not ( = ?auto_520708 ?auto_520711 ) ) ( not ( = ?auto_520708 ?auto_520718 ) ) ( not ( = ?auto_520709 ?auto_520706 ) ) ( not ( = ?auto_520709 ?auto_520710 ) ) ( not ( = ?auto_520709 ?auto_520712 ) ) ( not ( = ?auto_520709 ?auto_520711 ) ) ( not ( = ?auto_520709 ?auto_520718 ) ) ( not ( = ?auto_520706 ?auto_520710 ) ) ( not ( = ?auto_520706 ?auto_520712 ) ) ( not ( = ?auto_520706 ?auto_520711 ) ) ( not ( = ?auto_520706 ?auto_520718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520710 ?auto_520712 ?auto_520711 )
      ( MAKE-6CRATE-VERIFY ?auto_520707 ?auto_520708 ?auto_520709 ?auto_520706 ?auto_520710 ?auto_520712 ?auto_520711 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520771 - SURFACE
      ?auto_520772 - SURFACE
      ?auto_520773 - SURFACE
      ?auto_520770 - SURFACE
      ?auto_520774 - SURFACE
      ?auto_520776 - SURFACE
      ?auto_520775 - SURFACE
    )
    :vars
    (
      ?auto_520780 - HOIST
      ?auto_520779 - PLACE
      ?auto_520777 - PLACE
      ?auto_520778 - HOIST
      ?auto_520782 - SURFACE
      ?auto_520781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520780 ?auto_520779 ) ( IS-CRATE ?auto_520775 ) ( not ( = ?auto_520776 ?auto_520775 ) ) ( not ( = ?auto_520774 ?auto_520776 ) ) ( not ( = ?auto_520774 ?auto_520775 ) ) ( not ( = ?auto_520777 ?auto_520779 ) ) ( HOIST-AT ?auto_520778 ?auto_520777 ) ( not ( = ?auto_520780 ?auto_520778 ) ) ( AVAILABLE ?auto_520778 ) ( SURFACE-AT ?auto_520775 ?auto_520777 ) ( ON ?auto_520775 ?auto_520782 ) ( CLEAR ?auto_520775 ) ( not ( = ?auto_520776 ?auto_520782 ) ) ( not ( = ?auto_520775 ?auto_520782 ) ) ( not ( = ?auto_520774 ?auto_520782 ) ) ( TRUCK-AT ?auto_520781 ?auto_520779 ) ( SURFACE-AT ?auto_520774 ?auto_520779 ) ( CLEAR ?auto_520774 ) ( LIFTING ?auto_520780 ?auto_520776 ) ( IS-CRATE ?auto_520776 ) ( ON ?auto_520772 ?auto_520771 ) ( ON ?auto_520773 ?auto_520772 ) ( ON ?auto_520770 ?auto_520773 ) ( ON ?auto_520774 ?auto_520770 ) ( not ( = ?auto_520771 ?auto_520772 ) ) ( not ( = ?auto_520771 ?auto_520773 ) ) ( not ( = ?auto_520771 ?auto_520770 ) ) ( not ( = ?auto_520771 ?auto_520774 ) ) ( not ( = ?auto_520771 ?auto_520776 ) ) ( not ( = ?auto_520771 ?auto_520775 ) ) ( not ( = ?auto_520771 ?auto_520782 ) ) ( not ( = ?auto_520772 ?auto_520773 ) ) ( not ( = ?auto_520772 ?auto_520770 ) ) ( not ( = ?auto_520772 ?auto_520774 ) ) ( not ( = ?auto_520772 ?auto_520776 ) ) ( not ( = ?auto_520772 ?auto_520775 ) ) ( not ( = ?auto_520772 ?auto_520782 ) ) ( not ( = ?auto_520773 ?auto_520770 ) ) ( not ( = ?auto_520773 ?auto_520774 ) ) ( not ( = ?auto_520773 ?auto_520776 ) ) ( not ( = ?auto_520773 ?auto_520775 ) ) ( not ( = ?auto_520773 ?auto_520782 ) ) ( not ( = ?auto_520770 ?auto_520774 ) ) ( not ( = ?auto_520770 ?auto_520776 ) ) ( not ( = ?auto_520770 ?auto_520775 ) ) ( not ( = ?auto_520770 ?auto_520782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520774 ?auto_520776 ?auto_520775 )
      ( MAKE-6CRATE-VERIFY ?auto_520771 ?auto_520772 ?auto_520773 ?auto_520770 ?auto_520774 ?auto_520776 ?auto_520775 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520835 - SURFACE
      ?auto_520836 - SURFACE
      ?auto_520837 - SURFACE
      ?auto_520834 - SURFACE
      ?auto_520838 - SURFACE
      ?auto_520840 - SURFACE
      ?auto_520839 - SURFACE
    )
    :vars
    (
      ?auto_520841 - HOIST
      ?auto_520846 - PLACE
      ?auto_520843 - PLACE
      ?auto_520845 - HOIST
      ?auto_520844 - SURFACE
      ?auto_520842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520841 ?auto_520846 ) ( IS-CRATE ?auto_520839 ) ( not ( = ?auto_520840 ?auto_520839 ) ) ( not ( = ?auto_520838 ?auto_520840 ) ) ( not ( = ?auto_520838 ?auto_520839 ) ) ( not ( = ?auto_520843 ?auto_520846 ) ) ( HOIST-AT ?auto_520845 ?auto_520843 ) ( not ( = ?auto_520841 ?auto_520845 ) ) ( AVAILABLE ?auto_520845 ) ( SURFACE-AT ?auto_520839 ?auto_520843 ) ( ON ?auto_520839 ?auto_520844 ) ( CLEAR ?auto_520839 ) ( not ( = ?auto_520840 ?auto_520844 ) ) ( not ( = ?auto_520839 ?auto_520844 ) ) ( not ( = ?auto_520838 ?auto_520844 ) ) ( TRUCK-AT ?auto_520842 ?auto_520846 ) ( SURFACE-AT ?auto_520838 ?auto_520846 ) ( CLEAR ?auto_520838 ) ( IS-CRATE ?auto_520840 ) ( AVAILABLE ?auto_520841 ) ( IN ?auto_520840 ?auto_520842 ) ( ON ?auto_520836 ?auto_520835 ) ( ON ?auto_520837 ?auto_520836 ) ( ON ?auto_520834 ?auto_520837 ) ( ON ?auto_520838 ?auto_520834 ) ( not ( = ?auto_520835 ?auto_520836 ) ) ( not ( = ?auto_520835 ?auto_520837 ) ) ( not ( = ?auto_520835 ?auto_520834 ) ) ( not ( = ?auto_520835 ?auto_520838 ) ) ( not ( = ?auto_520835 ?auto_520840 ) ) ( not ( = ?auto_520835 ?auto_520839 ) ) ( not ( = ?auto_520835 ?auto_520844 ) ) ( not ( = ?auto_520836 ?auto_520837 ) ) ( not ( = ?auto_520836 ?auto_520834 ) ) ( not ( = ?auto_520836 ?auto_520838 ) ) ( not ( = ?auto_520836 ?auto_520840 ) ) ( not ( = ?auto_520836 ?auto_520839 ) ) ( not ( = ?auto_520836 ?auto_520844 ) ) ( not ( = ?auto_520837 ?auto_520834 ) ) ( not ( = ?auto_520837 ?auto_520838 ) ) ( not ( = ?auto_520837 ?auto_520840 ) ) ( not ( = ?auto_520837 ?auto_520839 ) ) ( not ( = ?auto_520837 ?auto_520844 ) ) ( not ( = ?auto_520834 ?auto_520838 ) ) ( not ( = ?auto_520834 ?auto_520840 ) ) ( not ( = ?auto_520834 ?auto_520839 ) ) ( not ( = ?auto_520834 ?auto_520844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520838 ?auto_520840 ?auto_520839 )
      ( MAKE-6CRATE-VERIFY ?auto_520835 ?auto_520836 ?auto_520837 ?auto_520834 ?auto_520838 ?auto_520840 ?auto_520839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_522108 - SURFACE
      ?auto_522109 - SURFACE
    )
    :vars
    (
      ?auto_522112 - HOIST
      ?auto_522116 - PLACE
      ?auto_522115 - SURFACE
      ?auto_522114 - PLACE
      ?auto_522111 - HOIST
      ?auto_522110 - SURFACE
      ?auto_522113 - TRUCK
      ?auto_522117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522112 ?auto_522116 ) ( SURFACE-AT ?auto_522108 ?auto_522116 ) ( CLEAR ?auto_522108 ) ( IS-CRATE ?auto_522109 ) ( not ( = ?auto_522108 ?auto_522109 ) ) ( ON ?auto_522108 ?auto_522115 ) ( not ( = ?auto_522115 ?auto_522108 ) ) ( not ( = ?auto_522115 ?auto_522109 ) ) ( not ( = ?auto_522114 ?auto_522116 ) ) ( HOIST-AT ?auto_522111 ?auto_522114 ) ( not ( = ?auto_522112 ?auto_522111 ) ) ( AVAILABLE ?auto_522111 ) ( SURFACE-AT ?auto_522109 ?auto_522114 ) ( ON ?auto_522109 ?auto_522110 ) ( CLEAR ?auto_522109 ) ( not ( = ?auto_522108 ?auto_522110 ) ) ( not ( = ?auto_522109 ?auto_522110 ) ) ( not ( = ?auto_522115 ?auto_522110 ) ) ( TRUCK-AT ?auto_522113 ?auto_522116 ) ( LIFTING ?auto_522112 ?auto_522117 ) ( IS-CRATE ?auto_522117 ) ( not ( = ?auto_522108 ?auto_522117 ) ) ( not ( = ?auto_522109 ?auto_522117 ) ) ( not ( = ?auto_522115 ?auto_522117 ) ) ( not ( = ?auto_522110 ?auto_522117 ) ) )
    :subtasks
    ( ( !LOAD ?auto_522112 ?auto_522117 ?auto_522113 ?auto_522116 )
      ( MAKE-1CRATE ?auto_522108 ?auto_522109 )
      ( MAKE-1CRATE-VERIFY ?auto_522108 ?auto_522109 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522786 - SURFACE
      ?auto_522787 - SURFACE
      ?auto_522788 - SURFACE
      ?auto_522785 - SURFACE
      ?auto_522789 - SURFACE
      ?auto_522791 - SURFACE
      ?auto_522790 - SURFACE
      ?auto_522792 - SURFACE
    )
    :vars
    (
      ?auto_522793 - HOIST
      ?auto_522794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522793 ?auto_522794 ) ( SURFACE-AT ?auto_522790 ?auto_522794 ) ( CLEAR ?auto_522790 ) ( LIFTING ?auto_522793 ?auto_522792 ) ( IS-CRATE ?auto_522792 ) ( not ( = ?auto_522790 ?auto_522792 ) ) ( ON ?auto_522787 ?auto_522786 ) ( ON ?auto_522788 ?auto_522787 ) ( ON ?auto_522785 ?auto_522788 ) ( ON ?auto_522789 ?auto_522785 ) ( ON ?auto_522791 ?auto_522789 ) ( ON ?auto_522790 ?auto_522791 ) ( not ( = ?auto_522786 ?auto_522787 ) ) ( not ( = ?auto_522786 ?auto_522788 ) ) ( not ( = ?auto_522786 ?auto_522785 ) ) ( not ( = ?auto_522786 ?auto_522789 ) ) ( not ( = ?auto_522786 ?auto_522791 ) ) ( not ( = ?auto_522786 ?auto_522790 ) ) ( not ( = ?auto_522786 ?auto_522792 ) ) ( not ( = ?auto_522787 ?auto_522788 ) ) ( not ( = ?auto_522787 ?auto_522785 ) ) ( not ( = ?auto_522787 ?auto_522789 ) ) ( not ( = ?auto_522787 ?auto_522791 ) ) ( not ( = ?auto_522787 ?auto_522790 ) ) ( not ( = ?auto_522787 ?auto_522792 ) ) ( not ( = ?auto_522788 ?auto_522785 ) ) ( not ( = ?auto_522788 ?auto_522789 ) ) ( not ( = ?auto_522788 ?auto_522791 ) ) ( not ( = ?auto_522788 ?auto_522790 ) ) ( not ( = ?auto_522788 ?auto_522792 ) ) ( not ( = ?auto_522785 ?auto_522789 ) ) ( not ( = ?auto_522785 ?auto_522791 ) ) ( not ( = ?auto_522785 ?auto_522790 ) ) ( not ( = ?auto_522785 ?auto_522792 ) ) ( not ( = ?auto_522789 ?auto_522791 ) ) ( not ( = ?auto_522789 ?auto_522790 ) ) ( not ( = ?auto_522789 ?auto_522792 ) ) ( not ( = ?auto_522791 ?auto_522790 ) ) ( not ( = ?auto_522791 ?auto_522792 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_522790 ?auto_522792 )
      ( MAKE-7CRATE-VERIFY ?auto_522786 ?auto_522787 ?auto_522788 ?auto_522785 ?auto_522789 ?auto_522791 ?auto_522790 ?auto_522792 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522841 - SURFACE
      ?auto_522842 - SURFACE
      ?auto_522843 - SURFACE
      ?auto_522840 - SURFACE
      ?auto_522844 - SURFACE
      ?auto_522846 - SURFACE
      ?auto_522845 - SURFACE
      ?auto_522847 - SURFACE
    )
    :vars
    (
      ?auto_522849 - HOIST
      ?auto_522850 - PLACE
      ?auto_522848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522849 ?auto_522850 ) ( SURFACE-AT ?auto_522845 ?auto_522850 ) ( CLEAR ?auto_522845 ) ( IS-CRATE ?auto_522847 ) ( not ( = ?auto_522845 ?auto_522847 ) ) ( TRUCK-AT ?auto_522848 ?auto_522850 ) ( AVAILABLE ?auto_522849 ) ( IN ?auto_522847 ?auto_522848 ) ( ON ?auto_522845 ?auto_522846 ) ( not ( = ?auto_522846 ?auto_522845 ) ) ( not ( = ?auto_522846 ?auto_522847 ) ) ( ON ?auto_522842 ?auto_522841 ) ( ON ?auto_522843 ?auto_522842 ) ( ON ?auto_522840 ?auto_522843 ) ( ON ?auto_522844 ?auto_522840 ) ( ON ?auto_522846 ?auto_522844 ) ( not ( = ?auto_522841 ?auto_522842 ) ) ( not ( = ?auto_522841 ?auto_522843 ) ) ( not ( = ?auto_522841 ?auto_522840 ) ) ( not ( = ?auto_522841 ?auto_522844 ) ) ( not ( = ?auto_522841 ?auto_522846 ) ) ( not ( = ?auto_522841 ?auto_522845 ) ) ( not ( = ?auto_522841 ?auto_522847 ) ) ( not ( = ?auto_522842 ?auto_522843 ) ) ( not ( = ?auto_522842 ?auto_522840 ) ) ( not ( = ?auto_522842 ?auto_522844 ) ) ( not ( = ?auto_522842 ?auto_522846 ) ) ( not ( = ?auto_522842 ?auto_522845 ) ) ( not ( = ?auto_522842 ?auto_522847 ) ) ( not ( = ?auto_522843 ?auto_522840 ) ) ( not ( = ?auto_522843 ?auto_522844 ) ) ( not ( = ?auto_522843 ?auto_522846 ) ) ( not ( = ?auto_522843 ?auto_522845 ) ) ( not ( = ?auto_522843 ?auto_522847 ) ) ( not ( = ?auto_522840 ?auto_522844 ) ) ( not ( = ?auto_522840 ?auto_522846 ) ) ( not ( = ?auto_522840 ?auto_522845 ) ) ( not ( = ?auto_522840 ?auto_522847 ) ) ( not ( = ?auto_522844 ?auto_522846 ) ) ( not ( = ?auto_522844 ?auto_522845 ) ) ( not ( = ?auto_522844 ?auto_522847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522846 ?auto_522845 ?auto_522847 )
      ( MAKE-7CRATE-VERIFY ?auto_522841 ?auto_522842 ?auto_522843 ?auto_522840 ?auto_522844 ?auto_522846 ?auto_522845 ?auto_522847 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522904 - SURFACE
      ?auto_522905 - SURFACE
      ?auto_522906 - SURFACE
      ?auto_522903 - SURFACE
      ?auto_522907 - SURFACE
      ?auto_522909 - SURFACE
      ?auto_522908 - SURFACE
      ?auto_522910 - SURFACE
    )
    :vars
    (
      ?auto_522911 - HOIST
      ?auto_522914 - PLACE
      ?auto_522913 - TRUCK
      ?auto_522912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522911 ?auto_522914 ) ( SURFACE-AT ?auto_522908 ?auto_522914 ) ( CLEAR ?auto_522908 ) ( IS-CRATE ?auto_522910 ) ( not ( = ?auto_522908 ?auto_522910 ) ) ( AVAILABLE ?auto_522911 ) ( IN ?auto_522910 ?auto_522913 ) ( ON ?auto_522908 ?auto_522909 ) ( not ( = ?auto_522909 ?auto_522908 ) ) ( not ( = ?auto_522909 ?auto_522910 ) ) ( TRUCK-AT ?auto_522913 ?auto_522912 ) ( not ( = ?auto_522912 ?auto_522914 ) ) ( ON ?auto_522905 ?auto_522904 ) ( ON ?auto_522906 ?auto_522905 ) ( ON ?auto_522903 ?auto_522906 ) ( ON ?auto_522907 ?auto_522903 ) ( ON ?auto_522909 ?auto_522907 ) ( not ( = ?auto_522904 ?auto_522905 ) ) ( not ( = ?auto_522904 ?auto_522906 ) ) ( not ( = ?auto_522904 ?auto_522903 ) ) ( not ( = ?auto_522904 ?auto_522907 ) ) ( not ( = ?auto_522904 ?auto_522909 ) ) ( not ( = ?auto_522904 ?auto_522908 ) ) ( not ( = ?auto_522904 ?auto_522910 ) ) ( not ( = ?auto_522905 ?auto_522906 ) ) ( not ( = ?auto_522905 ?auto_522903 ) ) ( not ( = ?auto_522905 ?auto_522907 ) ) ( not ( = ?auto_522905 ?auto_522909 ) ) ( not ( = ?auto_522905 ?auto_522908 ) ) ( not ( = ?auto_522905 ?auto_522910 ) ) ( not ( = ?auto_522906 ?auto_522903 ) ) ( not ( = ?auto_522906 ?auto_522907 ) ) ( not ( = ?auto_522906 ?auto_522909 ) ) ( not ( = ?auto_522906 ?auto_522908 ) ) ( not ( = ?auto_522906 ?auto_522910 ) ) ( not ( = ?auto_522903 ?auto_522907 ) ) ( not ( = ?auto_522903 ?auto_522909 ) ) ( not ( = ?auto_522903 ?auto_522908 ) ) ( not ( = ?auto_522903 ?auto_522910 ) ) ( not ( = ?auto_522907 ?auto_522909 ) ) ( not ( = ?auto_522907 ?auto_522908 ) ) ( not ( = ?auto_522907 ?auto_522910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522909 ?auto_522908 ?auto_522910 )
      ( MAKE-7CRATE-VERIFY ?auto_522904 ?auto_522905 ?auto_522906 ?auto_522903 ?auto_522907 ?auto_522909 ?auto_522908 ?auto_522910 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522974 - SURFACE
      ?auto_522975 - SURFACE
      ?auto_522976 - SURFACE
      ?auto_522973 - SURFACE
      ?auto_522977 - SURFACE
      ?auto_522979 - SURFACE
      ?auto_522978 - SURFACE
      ?auto_522980 - SURFACE
    )
    :vars
    (
      ?auto_522985 - HOIST
      ?auto_522982 - PLACE
      ?auto_522984 - TRUCK
      ?auto_522983 - PLACE
      ?auto_522981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_522985 ?auto_522982 ) ( SURFACE-AT ?auto_522978 ?auto_522982 ) ( CLEAR ?auto_522978 ) ( IS-CRATE ?auto_522980 ) ( not ( = ?auto_522978 ?auto_522980 ) ) ( AVAILABLE ?auto_522985 ) ( ON ?auto_522978 ?auto_522979 ) ( not ( = ?auto_522979 ?auto_522978 ) ) ( not ( = ?auto_522979 ?auto_522980 ) ) ( TRUCK-AT ?auto_522984 ?auto_522983 ) ( not ( = ?auto_522983 ?auto_522982 ) ) ( HOIST-AT ?auto_522981 ?auto_522983 ) ( LIFTING ?auto_522981 ?auto_522980 ) ( not ( = ?auto_522985 ?auto_522981 ) ) ( ON ?auto_522975 ?auto_522974 ) ( ON ?auto_522976 ?auto_522975 ) ( ON ?auto_522973 ?auto_522976 ) ( ON ?auto_522977 ?auto_522973 ) ( ON ?auto_522979 ?auto_522977 ) ( not ( = ?auto_522974 ?auto_522975 ) ) ( not ( = ?auto_522974 ?auto_522976 ) ) ( not ( = ?auto_522974 ?auto_522973 ) ) ( not ( = ?auto_522974 ?auto_522977 ) ) ( not ( = ?auto_522974 ?auto_522979 ) ) ( not ( = ?auto_522974 ?auto_522978 ) ) ( not ( = ?auto_522974 ?auto_522980 ) ) ( not ( = ?auto_522975 ?auto_522976 ) ) ( not ( = ?auto_522975 ?auto_522973 ) ) ( not ( = ?auto_522975 ?auto_522977 ) ) ( not ( = ?auto_522975 ?auto_522979 ) ) ( not ( = ?auto_522975 ?auto_522978 ) ) ( not ( = ?auto_522975 ?auto_522980 ) ) ( not ( = ?auto_522976 ?auto_522973 ) ) ( not ( = ?auto_522976 ?auto_522977 ) ) ( not ( = ?auto_522976 ?auto_522979 ) ) ( not ( = ?auto_522976 ?auto_522978 ) ) ( not ( = ?auto_522976 ?auto_522980 ) ) ( not ( = ?auto_522973 ?auto_522977 ) ) ( not ( = ?auto_522973 ?auto_522979 ) ) ( not ( = ?auto_522973 ?auto_522978 ) ) ( not ( = ?auto_522973 ?auto_522980 ) ) ( not ( = ?auto_522977 ?auto_522979 ) ) ( not ( = ?auto_522977 ?auto_522978 ) ) ( not ( = ?auto_522977 ?auto_522980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522979 ?auto_522978 ?auto_522980 )
      ( MAKE-7CRATE-VERIFY ?auto_522974 ?auto_522975 ?auto_522976 ?auto_522973 ?auto_522977 ?auto_522979 ?auto_522978 ?auto_522980 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_523051 - SURFACE
      ?auto_523052 - SURFACE
      ?auto_523053 - SURFACE
      ?auto_523050 - SURFACE
      ?auto_523054 - SURFACE
      ?auto_523056 - SURFACE
      ?auto_523055 - SURFACE
      ?auto_523057 - SURFACE
    )
    :vars
    (
      ?auto_523060 - HOIST
      ?auto_523063 - PLACE
      ?auto_523061 - TRUCK
      ?auto_523059 - PLACE
      ?auto_523058 - HOIST
      ?auto_523062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_523060 ?auto_523063 ) ( SURFACE-AT ?auto_523055 ?auto_523063 ) ( CLEAR ?auto_523055 ) ( IS-CRATE ?auto_523057 ) ( not ( = ?auto_523055 ?auto_523057 ) ) ( AVAILABLE ?auto_523060 ) ( ON ?auto_523055 ?auto_523056 ) ( not ( = ?auto_523056 ?auto_523055 ) ) ( not ( = ?auto_523056 ?auto_523057 ) ) ( TRUCK-AT ?auto_523061 ?auto_523059 ) ( not ( = ?auto_523059 ?auto_523063 ) ) ( HOIST-AT ?auto_523058 ?auto_523059 ) ( not ( = ?auto_523060 ?auto_523058 ) ) ( AVAILABLE ?auto_523058 ) ( SURFACE-AT ?auto_523057 ?auto_523059 ) ( ON ?auto_523057 ?auto_523062 ) ( CLEAR ?auto_523057 ) ( not ( = ?auto_523055 ?auto_523062 ) ) ( not ( = ?auto_523057 ?auto_523062 ) ) ( not ( = ?auto_523056 ?auto_523062 ) ) ( ON ?auto_523052 ?auto_523051 ) ( ON ?auto_523053 ?auto_523052 ) ( ON ?auto_523050 ?auto_523053 ) ( ON ?auto_523054 ?auto_523050 ) ( ON ?auto_523056 ?auto_523054 ) ( not ( = ?auto_523051 ?auto_523052 ) ) ( not ( = ?auto_523051 ?auto_523053 ) ) ( not ( = ?auto_523051 ?auto_523050 ) ) ( not ( = ?auto_523051 ?auto_523054 ) ) ( not ( = ?auto_523051 ?auto_523056 ) ) ( not ( = ?auto_523051 ?auto_523055 ) ) ( not ( = ?auto_523051 ?auto_523057 ) ) ( not ( = ?auto_523051 ?auto_523062 ) ) ( not ( = ?auto_523052 ?auto_523053 ) ) ( not ( = ?auto_523052 ?auto_523050 ) ) ( not ( = ?auto_523052 ?auto_523054 ) ) ( not ( = ?auto_523052 ?auto_523056 ) ) ( not ( = ?auto_523052 ?auto_523055 ) ) ( not ( = ?auto_523052 ?auto_523057 ) ) ( not ( = ?auto_523052 ?auto_523062 ) ) ( not ( = ?auto_523053 ?auto_523050 ) ) ( not ( = ?auto_523053 ?auto_523054 ) ) ( not ( = ?auto_523053 ?auto_523056 ) ) ( not ( = ?auto_523053 ?auto_523055 ) ) ( not ( = ?auto_523053 ?auto_523057 ) ) ( not ( = ?auto_523053 ?auto_523062 ) ) ( not ( = ?auto_523050 ?auto_523054 ) ) ( not ( = ?auto_523050 ?auto_523056 ) ) ( not ( = ?auto_523050 ?auto_523055 ) ) ( not ( = ?auto_523050 ?auto_523057 ) ) ( not ( = ?auto_523050 ?auto_523062 ) ) ( not ( = ?auto_523054 ?auto_523056 ) ) ( not ( = ?auto_523054 ?auto_523055 ) ) ( not ( = ?auto_523054 ?auto_523057 ) ) ( not ( = ?auto_523054 ?auto_523062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_523056 ?auto_523055 ?auto_523057 )
      ( MAKE-7CRATE-VERIFY ?auto_523051 ?auto_523052 ?auto_523053 ?auto_523050 ?auto_523054 ?auto_523056 ?auto_523055 ?auto_523057 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_523129 - SURFACE
      ?auto_523130 - SURFACE
      ?auto_523131 - SURFACE
      ?auto_523128 - SURFACE
      ?auto_523132 - SURFACE
      ?auto_523134 - SURFACE
      ?auto_523133 - SURFACE
      ?auto_523135 - SURFACE
    )
    :vars
    (
      ?auto_523136 - HOIST
      ?auto_523137 - PLACE
      ?auto_523138 - PLACE
      ?auto_523139 - HOIST
      ?auto_523140 - SURFACE
      ?auto_523141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_523136 ?auto_523137 ) ( SURFACE-AT ?auto_523133 ?auto_523137 ) ( CLEAR ?auto_523133 ) ( IS-CRATE ?auto_523135 ) ( not ( = ?auto_523133 ?auto_523135 ) ) ( AVAILABLE ?auto_523136 ) ( ON ?auto_523133 ?auto_523134 ) ( not ( = ?auto_523134 ?auto_523133 ) ) ( not ( = ?auto_523134 ?auto_523135 ) ) ( not ( = ?auto_523138 ?auto_523137 ) ) ( HOIST-AT ?auto_523139 ?auto_523138 ) ( not ( = ?auto_523136 ?auto_523139 ) ) ( AVAILABLE ?auto_523139 ) ( SURFACE-AT ?auto_523135 ?auto_523138 ) ( ON ?auto_523135 ?auto_523140 ) ( CLEAR ?auto_523135 ) ( not ( = ?auto_523133 ?auto_523140 ) ) ( not ( = ?auto_523135 ?auto_523140 ) ) ( not ( = ?auto_523134 ?auto_523140 ) ) ( TRUCK-AT ?auto_523141 ?auto_523137 ) ( ON ?auto_523130 ?auto_523129 ) ( ON ?auto_523131 ?auto_523130 ) ( ON ?auto_523128 ?auto_523131 ) ( ON ?auto_523132 ?auto_523128 ) ( ON ?auto_523134 ?auto_523132 ) ( not ( = ?auto_523129 ?auto_523130 ) ) ( not ( = ?auto_523129 ?auto_523131 ) ) ( not ( = ?auto_523129 ?auto_523128 ) ) ( not ( = ?auto_523129 ?auto_523132 ) ) ( not ( = ?auto_523129 ?auto_523134 ) ) ( not ( = ?auto_523129 ?auto_523133 ) ) ( not ( = ?auto_523129 ?auto_523135 ) ) ( not ( = ?auto_523129 ?auto_523140 ) ) ( not ( = ?auto_523130 ?auto_523131 ) ) ( not ( = ?auto_523130 ?auto_523128 ) ) ( not ( = ?auto_523130 ?auto_523132 ) ) ( not ( = ?auto_523130 ?auto_523134 ) ) ( not ( = ?auto_523130 ?auto_523133 ) ) ( not ( = ?auto_523130 ?auto_523135 ) ) ( not ( = ?auto_523130 ?auto_523140 ) ) ( not ( = ?auto_523131 ?auto_523128 ) ) ( not ( = ?auto_523131 ?auto_523132 ) ) ( not ( = ?auto_523131 ?auto_523134 ) ) ( not ( = ?auto_523131 ?auto_523133 ) ) ( not ( = ?auto_523131 ?auto_523135 ) ) ( not ( = ?auto_523131 ?auto_523140 ) ) ( not ( = ?auto_523128 ?auto_523132 ) ) ( not ( = ?auto_523128 ?auto_523134 ) ) ( not ( = ?auto_523128 ?auto_523133 ) ) ( not ( = ?auto_523128 ?auto_523135 ) ) ( not ( = ?auto_523128 ?auto_523140 ) ) ( not ( = ?auto_523132 ?auto_523134 ) ) ( not ( = ?auto_523132 ?auto_523133 ) ) ( not ( = ?auto_523132 ?auto_523135 ) ) ( not ( = ?auto_523132 ?auto_523140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_523134 ?auto_523133 ?auto_523135 )
      ( MAKE-7CRATE-VERIFY ?auto_523129 ?auto_523130 ?auto_523131 ?auto_523128 ?auto_523132 ?auto_523134 ?auto_523133 ?auto_523135 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_523207 - SURFACE
      ?auto_523208 - SURFACE
      ?auto_523209 - SURFACE
      ?auto_523206 - SURFACE
      ?auto_523210 - SURFACE
      ?auto_523212 - SURFACE
      ?auto_523211 - SURFACE
      ?auto_523213 - SURFACE
    )
    :vars
    (
      ?auto_523217 - HOIST
      ?auto_523218 - PLACE
      ?auto_523215 - PLACE
      ?auto_523216 - HOIST
      ?auto_523219 - SURFACE
      ?auto_523214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_523217 ?auto_523218 ) ( IS-CRATE ?auto_523213 ) ( not ( = ?auto_523211 ?auto_523213 ) ) ( not ( = ?auto_523212 ?auto_523211 ) ) ( not ( = ?auto_523212 ?auto_523213 ) ) ( not ( = ?auto_523215 ?auto_523218 ) ) ( HOIST-AT ?auto_523216 ?auto_523215 ) ( not ( = ?auto_523217 ?auto_523216 ) ) ( AVAILABLE ?auto_523216 ) ( SURFACE-AT ?auto_523213 ?auto_523215 ) ( ON ?auto_523213 ?auto_523219 ) ( CLEAR ?auto_523213 ) ( not ( = ?auto_523211 ?auto_523219 ) ) ( not ( = ?auto_523213 ?auto_523219 ) ) ( not ( = ?auto_523212 ?auto_523219 ) ) ( TRUCK-AT ?auto_523214 ?auto_523218 ) ( SURFACE-AT ?auto_523212 ?auto_523218 ) ( CLEAR ?auto_523212 ) ( LIFTING ?auto_523217 ?auto_523211 ) ( IS-CRATE ?auto_523211 ) ( ON ?auto_523208 ?auto_523207 ) ( ON ?auto_523209 ?auto_523208 ) ( ON ?auto_523206 ?auto_523209 ) ( ON ?auto_523210 ?auto_523206 ) ( ON ?auto_523212 ?auto_523210 ) ( not ( = ?auto_523207 ?auto_523208 ) ) ( not ( = ?auto_523207 ?auto_523209 ) ) ( not ( = ?auto_523207 ?auto_523206 ) ) ( not ( = ?auto_523207 ?auto_523210 ) ) ( not ( = ?auto_523207 ?auto_523212 ) ) ( not ( = ?auto_523207 ?auto_523211 ) ) ( not ( = ?auto_523207 ?auto_523213 ) ) ( not ( = ?auto_523207 ?auto_523219 ) ) ( not ( = ?auto_523208 ?auto_523209 ) ) ( not ( = ?auto_523208 ?auto_523206 ) ) ( not ( = ?auto_523208 ?auto_523210 ) ) ( not ( = ?auto_523208 ?auto_523212 ) ) ( not ( = ?auto_523208 ?auto_523211 ) ) ( not ( = ?auto_523208 ?auto_523213 ) ) ( not ( = ?auto_523208 ?auto_523219 ) ) ( not ( = ?auto_523209 ?auto_523206 ) ) ( not ( = ?auto_523209 ?auto_523210 ) ) ( not ( = ?auto_523209 ?auto_523212 ) ) ( not ( = ?auto_523209 ?auto_523211 ) ) ( not ( = ?auto_523209 ?auto_523213 ) ) ( not ( = ?auto_523209 ?auto_523219 ) ) ( not ( = ?auto_523206 ?auto_523210 ) ) ( not ( = ?auto_523206 ?auto_523212 ) ) ( not ( = ?auto_523206 ?auto_523211 ) ) ( not ( = ?auto_523206 ?auto_523213 ) ) ( not ( = ?auto_523206 ?auto_523219 ) ) ( not ( = ?auto_523210 ?auto_523212 ) ) ( not ( = ?auto_523210 ?auto_523211 ) ) ( not ( = ?auto_523210 ?auto_523213 ) ) ( not ( = ?auto_523210 ?auto_523219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_523212 ?auto_523211 ?auto_523213 )
      ( MAKE-7CRATE-VERIFY ?auto_523207 ?auto_523208 ?auto_523209 ?auto_523206 ?auto_523210 ?auto_523212 ?auto_523211 ?auto_523213 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_523285 - SURFACE
      ?auto_523286 - SURFACE
      ?auto_523287 - SURFACE
      ?auto_523284 - SURFACE
      ?auto_523288 - SURFACE
      ?auto_523290 - SURFACE
      ?auto_523289 - SURFACE
      ?auto_523291 - SURFACE
    )
    :vars
    (
      ?auto_523294 - HOIST
      ?auto_523292 - PLACE
      ?auto_523296 - PLACE
      ?auto_523295 - HOIST
      ?auto_523293 - SURFACE
      ?auto_523297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_523294 ?auto_523292 ) ( IS-CRATE ?auto_523291 ) ( not ( = ?auto_523289 ?auto_523291 ) ) ( not ( = ?auto_523290 ?auto_523289 ) ) ( not ( = ?auto_523290 ?auto_523291 ) ) ( not ( = ?auto_523296 ?auto_523292 ) ) ( HOIST-AT ?auto_523295 ?auto_523296 ) ( not ( = ?auto_523294 ?auto_523295 ) ) ( AVAILABLE ?auto_523295 ) ( SURFACE-AT ?auto_523291 ?auto_523296 ) ( ON ?auto_523291 ?auto_523293 ) ( CLEAR ?auto_523291 ) ( not ( = ?auto_523289 ?auto_523293 ) ) ( not ( = ?auto_523291 ?auto_523293 ) ) ( not ( = ?auto_523290 ?auto_523293 ) ) ( TRUCK-AT ?auto_523297 ?auto_523292 ) ( SURFACE-AT ?auto_523290 ?auto_523292 ) ( CLEAR ?auto_523290 ) ( IS-CRATE ?auto_523289 ) ( AVAILABLE ?auto_523294 ) ( IN ?auto_523289 ?auto_523297 ) ( ON ?auto_523286 ?auto_523285 ) ( ON ?auto_523287 ?auto_523286 ) ( ON ?auto_523284 ?auto_523287 ) ( ON ?auto_523288 ?auto_523284 ) ( ON ?auto_523290 ?auto_523288 ) ( not ( = ?auto_523285 ?auto_523286 ) ) ( not ( = ?auto_523285 ?auto_523287 ) ) ( not ( = ?auto_523285 ?auto_523284 ) ) ( not ( = ?auto_523285 ?auto_523288 ) ) ( not ( = ?auto_523285 ?auto_523290 ) ) ( not ( = ?auto_523285 ?auto_523289 ) ) ( not ( = ?auto_523285 ?auto_523291 ) ) ( not ( = ?auto_523285 ?auto_523293 ) ) ( not ( = ?auto_523286 ?auto_523287 ) ) ( not ( = ?auto_523286 ?auto_523284 ) ) ( not ( = ?auto_523286 ?auto_523288 ) ) ( not ( = ?auto_523286 ?auto_523290 ) ) ( not ( = ?auto_523286 ?auto_523289 ) ) ( not ( = ?auto_523286 ?auto_523291 ) ) ( not ( = ?auto_523286 ?auto_523293 ) ) ( not ( = ?auto_523287 ?auto_523284 ) ) ( not ( = ?auto_523287 ?auto_523288 ) ) ( not ( = ?auto_523287 ?auto_523290 ) ) ( not ( = ?auto_523287 ?auto_523289 ) ) ( not ( = ?auto_523287 ?auto_523291 ) ) ( not ( = ?auto_523287 ?auto_523293 ) ) ( not ( = ?auto_523284 ?auto_523288 ) ) ( not ( = ?auto_523284 ?auto_523290 ) ) ( not ( = ?auto_523284 ?auto_523289 ) ) ( not ( = ?auto_523284 ?auto_523291 ) ) ( not ( = ?auto_523284 ?auto_523293 ) ) ( not ( = ?auto_523288 ?auto_523290 ) ) ( not ( = ?auto_523288 ?auto_523289 ) ) ( not ( = ?auto_523288 ?auto_523291 ) ) ( not ( = ?auto_523288 ?auto_523293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_523290 ?auto_523289 ?auto_523291 )
      ( MAKE-7CRATE-VERIFY ?auto_523285 ?auto_523286 ?auto_523287 ?auto_523284 ?auto_523288 ?auto_523290 ?auto_523289 ?auto_523291 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526204 - SURFACE
      ?auto_526205 - SURFACE
      ?auto_526206 - SURFACE
      ?auto_526203 - SURFACE
      ?auto_526207 - SURFACE
      ?auto_526209 - SURFACE
      ?auto_526208 - SURFACE
      ?auto_526210 - SURFACE
      ?auto_526211 - SURFACE
    )
    :vars
    (
      ?auto_526213 - HOIST
      ?auto_526212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526213 ?auto_526212 ) ( SURFACE-AT ?auto_526210 ?auto_526212 ) ( CLEAR ?auto_526210 ) ( LIFTING ?auto_526213 ?auto_526211 ) ( IS-CRATE ?auto_526211 ) ( not ( = ?auto_526210 ?auto_526211 ) ) ( ON ?auto_526205 ?auto_526204 ) ( ON ?auto_526206 ?auto_526205 ) ( ON ?auto_526203 ?auto_526206 ) ( ON ?auto_526207 ?auto_526203 ) ( ON ?auto_526209 ?auto_526207 ) ( ON ?auto_526208 ?auto_526209 ) ( ON ?auto_526210 ?auto_526208 ) ( not ( = ?auto_526204 ?auto_526205 ) ) ( not ( = ?auto_526204 ?auto_526206 ) ) ( not ( = ?auto_526204 ?auto_526203 ) ) ( not ( = ?auto_526204 ?auto_526207 ) ) ( not ( = ?auto_526204 ?auto_526209 ) ) ( not ( = ?auto_526204 ?auto_526208 ) ) ( not ( = ?auto_526204 ?auto_526210 ) ) ( not ( = ?auto_526204 ?auto_526211 ) ) ( not ( = ?auto_526205 ?auto_526206 ) ) ( not ( = ?auto_526205 ?auto_526203 ) ) ( not ( = ?auto_526205 ?auto_526207 ) ) ( not ( = ?auto_526205 ?auto_526209 ) ) ( not ( = ?auto_526205 ?auto_526208 ) ) ( not ( = ?auto_526205 ?auto_526210 ) ) ( not ( = ?auto_526205 ?auto_526211 ) ) ( not ( = ?auto_526206 ?auto_526203 ) ) ( not ( = ?auto_526206 ?auto_526207 ) ) ( not ( = ?auto_526206 ?auto_526209 ) ) ( not ( = ?auto_526206 ?auto_526208 ) ) ( not ( = ?auto_526206 ?auto_526210 ) ) ( not ( = ?auto_526206 ?auto_526211 ) ) ( not ( = ?auto_526203 ?auto_526207 ) ) ( not ( = ?auto_526203 ?auto_526209 ) ) ( not ( = ?auto_526203 ?auto_526208 ) ) ( not ( = ?auto_526203 ?auto_526210 ) ) ( not ( = ?auto_526203 ?auto_526211 ) ) ( not ( = ?auto_526207 ?auto_526209 ) ) ( not ( = ?auto_526207 ?auto_526208 ) ) ( not ( = ?auto_526207 ?auto_526210 ) ) ( not ( = ?auto_526207 ?auto_526211 ) ) ( not ( = ?auto_526209 ?auto_526208 ) ) ( not ( = ?auto_526209 ?auto_526210 ) ) ( not ( = ?auto_526209 ?auto_526211 ) ) ( not ( = ?auto_526208 ?auto_526210 ) ) ( not ( = ?auto_526208 ?auto_526211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_526210 ?auto_526211 )
      ( MAKE-8CRATE-VERIFY ?auto_526204 ?auto_526205 ?auto_526206 ?auto_526203 ?auto_526207 ?auto_526209 ?auto_526208 ?auto_526210 ?auto_526211 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526271 - SURFACE
      ?auto_526272 - SURFACE
      ?auto_526273 - SURFACE
      ?auto_526270 - SURFACE
      ?auto_526274 - SURFACE
      ?auto_526276 - SURFACE
      ?auto_526275 - SURFACE
      ?auto_526277 - SURFACE
      ?auto_526278 - SURFACE
    )
    :vars
    (
      ?auto_526279 - HOIST
      ?auto_526280 - PLACE
      ?auto_526281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526279 ?auto_526280 ) ( SURFACE-AT ?auto_526277 ?auto_526280 ) ( CLEAR ?auto_526277 ) ( IS-CRATE ?auto_526278 ) ( not ( = ?auto_526277 ?auto_526278 ) ) ( TRUCK-AT ?auto_526281 ?auto_526280 ) ( AVAILABLE ?auto_526279 ) ( IN ?auto_526278 ?auto_526281 ) ( ON ?auto_526277 ?auto_526275 ) ( not ( = ?auto_526275 ?auto_526277 ) ) ( not ( = ?auto_526275 ?auto_526278 ) ) ( ON ?auto_526272 ?auto_526271 ) ( ON ?auto_526273 ?auto_526272 ) ( ON ?auto_526270 ?auto_526273 ) ( ON ?auto_526274 ?auto_526270 ) ( ON ?auto_526276 ?auto_526274 ) ( ON ?auto_526275 ?auto_526276 ) ( not ( = ?auto_526271 ?auto_526272 ) ) ( not ( = ?auto_526271 ?auto_526273 ) ) ( not ( = ?auto_526271 ?auto_526270 ) ) ( not ( = ?auto_526271 ?auto_526274 ) ) ( not ( = ?auto_526271 ?auto_526276 ) ) ( not ( = ?auto_526271 ?auto_526275 ) ) ( not ( = ?auto_526271 ?auto_526277 ) ) ( not ( = ?auto_526271 ?auto_526278 ) ) ( not ( = ?auto_526272 ?auto_526273 ) ) ( not ( = ?auto_526272 ?auto_526270 ) ) ( not ( = ?auto_526272 ?auto_526274 ) ) ( not ( = ?auto_526272 ?auto_526276 ) ) ( not ( = ?auto_526272 ?auto_526275 ) ) ( not ( = ?auto_526272 ?auto_526277 ) ) ( not ( = ?auto_526272 ?auto_526278 ) ) ( not ( = ?auto_526273 ?auto_526270 ) ) ( not ( = ?auto_526273 ?auto_526274 ) ) ( not ( = ?auto_526273 ?auto_526276 ) ) ( not ( = ?auto_526273 ?auto_526275 ) ) ( not ( = ?auto_526273 ?auto_526277 ) ) ( not ( = ?auto_526273 ?auto_526278 ) ) ( not ( = ?auto_526270 ?auto_526274 ) ) ( not ( = ?auto_526270 ?auto_526276 ) ) ( not ( = ?auto_526270 ?auto_526275 ) ) ( not ( = ?auto_526270 ?auto_526277 ) ) ( not ( = ?auto_526270 ?auto_526278 ) ) ( not ( = ?auto_526274 ?auto_526276 ) ) ( not ( = ?auto_526274 ?auto_526275 ) ) ( not ( = ?auto_526274 ?auto_526277 ) ) ( not ( = ?auto_526274 ?auto_526278 ) ) ( not ( = ?auto_526276 ?auto_526275 ) ) ( not ( = ?auto_526276 ?auto_526277 ) ) ( not ( = ?auto_526276 ?auto_526278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526275 ?auto_526277 ?auto_526278 )
      ( MAKE-8CRATE-VERIFY ?auto_526271 ?auto_526272 ?auto_526273 ?auto_526270 ?auto_526274 ?auto_526276 ?auto_526275 ?auto_526277 ?auto_526278 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526347 - SURFACE
      ?auto_526348 - SURFACE
      ?auto_526349 - SURFACE
      ?auto_526346 - SURFACE
      ?auto_526350 - SURFACE
      ?auto_526352 - SURFACE
      ?auto_526351 - SURFACE
      ?auto_526353 - SURFACE
      ?auto_526354 - SURFACE
    )
    :vars
    (
      ?auto_526357 - HOIST
      ?auto_526355 - PLACE
      ?auto_526358 - TRUCK
      ?auto_526356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526357 ?auto_526355 ) ( SURFACE-AT ?auto_526353 ?auto_526355 ) ( CLEAR ?auto_526353 ) ( IS-CRATE ?auto_526354 ) ( not ( = ?auto_526353 ?auto_526354 ) ) ( AVAILABLE ?auto_526357 ) ( IN ?auto_526354 ?auto_526358 ) ( ON ?auto_526353 ?auto_526351 ) ( not ( = ?auto_526351 ?auto_526353 ) ) ( not ( = ?auto_526351 ?auto_526354 ) ) ( TRUCK-AT ?auto_526358 ?auto_526356 ) ( not ( = ?auto_526356 ?auto_526355 ) ) ( ON ?auto_526348 ?auto_526347 ) ( ON ?auto_526349 ?auto_526348 ) ( ON ?auto_526346 ?auto_526349 ) ( ON ?auto_526350 ?auto_526346 ) ( ON ?auto_526352 ?auto_526350 ) ( ON ?auto_526351 ?auto_526352 ) ( not ( = ?auto_526347 ?auto_526348 ) ) ( not ( = ?auto_526347 ?auto_526349 ) ) ( not ( = ?auto_526347 ?auto_526346 ) ) ( not ( = ?auto_526347 ?auto_526350 ) ) ( not ( = ?auto_526347 ?auto_526352 ) ) ( not ( = ?auto_526347 ?auto_526351 ) ) ( not ( = ?auto_526347 ?auto_526353 ) ) ( not ( = ?auto_526347 ?auto_526354 ) ) ( not ( = ?auto_526348 ?auto_526349 ) ) ( not ( = ?auto_526348 ?auto_526346 ) ) ( not ( = ?auto_526348 ?auto_526350 ) ) ( not ( = ?auto_526348 ?auto_526352 ) ) ( not ( = ?auto_526348 ?auto_526351 ) ) ( not ( = ?auto_526348 ?auto_526353 ) ) ( not ( = ?auto_526348 ?auto_526354 ) ) ( not ( = ?auto_526349 ?auto_526346 ) ) ( not ( = ?auto_526349 ?auto_526350 ) ) ( not ( = ?auto_526349 ?auto_526352 ) ) ( not ( = ?auto_526349 ?auto_526351 ) ) ( not ( = ?auto_526349 ?auto_526353 ) ) ( not ( = ?auto_526349 ?auto_526354 ) ) ( not ( = ?auto_526346 ?auto_526350 ) ) ( not ( = ?auto_526346 ?auto_526352 ) ) ( not ( = ?auto_526346 ?auto_526351 ) ) ( not ( = ?auto_526346 ?auto_526353 ) ) ( not ( = ?auto_526346 ?auto_526354 ) ) ( not ( = ?auto_526350 ?auto_526352 ) ) ( not ( = ?auto_526350 ?auto_526351 ) ) ( not ( = ?auto_526350 ?auto_526353 ) ) ( not ( = ?auto_526350 ?auto_526354 ) ) ( not ( = ?auto_526352 ?auto_526351 ) ) ( not ( = ?auto_526352 ?auto_526353 ) ) ( not ( = ?auto_526352 ?auto_526354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526351 ?auto_526353 ?auto_526354 )
      ( MAKE-8CRATE-VERIFY ?auto_526347 ?auto_526348 ?auto_526349 ?auto_526346 ?auto_526350 ?auto_526352 ?auto_526351 ?auto_526353 ?auto_526354 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526431 - SURFACE
      ?auto_526432 - SURFACE
      ?auto_526433 - SURFACE
      ?auto_526430 - SURFACE
      ?auto_526434 - SURFACE
      ?auto_526436 - SURFACE
      ?auto_526435 - SURFACE
      ?auto_526437 - SURFACE
      ?auto_526438 - SURFACE
    )
    :vars
    (
      ?auto_526443 - HOIST
      ?auto_526442 - PLACE
      ?auto_526441 - TRUCK
      ?auto_526440 - PLACE
      ?auto_526439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_526443 ?auto_526442 ) ( SURFACE-AT ?auto_526437 ?auto_526442 ) ( CLEAR ?auto_526437 ) ( IS-CRATE ?auto_526438 ) ( not ( = ?auto_526437 ?auto_526438 ) ) ( AVAILABLE ?auto_526443 ) ( ON ?auto_526437 ?auto_526435 ) ( not ( = ?auto_526435 ?auto_526437 ) ) ( not ( = ?auto_526435 ?auto_526438 ) ) ( TRUCK-AT ?auto_526441 ?auto_526440 ) ( not ( = ?auto_526440 ?auto_526442 ) ) ( HOIST-AT ?auto_526439 ?auto_526440 ) ( LIFTING ?auto_526439 ?auto_526438 ) ( not ( = ?auto_526443 ?auto_526439 ) ) ( ON ?auto_526432 ?auto_526431 ) ( ON ?auto_526433 ?auto_526432 ) ( ON ?auto_526430 ?auto_526433 ) ( ON ?auto_526434 ?auto_526430 ) ( ON ?auto_526436 ?auto_526434 ) ( ON ?auto_526435 ?auto_526436 ) ( not ( = ?auto_526431 ?auto_526432 ) ) ( not ( = ?auto_526431 ?auto_526433 ) ) ( not ( = ?auto_526431 ?auto_526430 ) ) ( not ( = ?auto_526431 ?auto_526434 ) ) ( not ( = ?auto_526431 ?auto_526436 ) ) ( not ( = ?auto_526431 ?auto_526435 ) ) ( not ( = ?auto_526431 ?auto_526437 ) ) ( not ( = ?auto_526431 ?auto_526438 ) ) ( not ( = ?auto_526432 ?auto_526433 ) ) ( not ( = ?auto_526432 ?auto_526430 ) ) ( not ( = ?auto_526432 ?auto_526434 ) ) ( not ( = ?auto_526432 ?auto_526436 ) ) ( not ( = ?auto_526432 ?auto_526435 ) ) ( not ( = ?auto_526432 ?auto_526437 ) ) ( not ( = ?auto_526432 ?auto_526438 ) ) ( not ( = ?auto_526433 ?auto_526430 ) ) ( not ( = ?auto_526433 ?auto_526434 ) ) ( not ( = ?auto_526433 ?auto_526436 ) ) ( not ( = ?auto_526433 ?auto_526435 ) ) ( not ( = ?auto_526433 ?auto_526437 ) ) ( not ( = ?auto_526433 ?auto_526438 ) ) ( not ( = ?auto_526430 ?auto_526434 ) ) ( not ( = ?auto_526430 ?auto_526436 ) ) ( not ( = ?auto_526430 ?auto_526435 ) ) ( not ( = ?auto_526430 ?auto_526437 ) ) ( not ( = ?auto_526430 ?auto_526438 ) ) ( not ( = ?auto_526434 ?auto_526436 ) ) ( not ( = ?auto_526434 ?auto_526435 ) ) ( not ( = ?auto_526434 ?auto_526437 ) ) ( not ( = ?auto_526434 ?auto_526438 ) ) ( not ( = ?auto_526436 ?auto_526435 ) ) ( not ( = ?auto_526436 ?auto_526437 ) ) ( not ( = ?auto_526436 ?auto_526438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526435 ?auto_526437 ?auto_526438 )
      ( MAKE-8CRATE-VERIFY ?auto_526431 ?auto_526432 ?auto_526433 ?auto_526430 ?auto_526434 ?auto_526436 ?auto_526435 ?auto_526437 ?auto_526438 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526523 - SURFACE
      ?auto_526524 - SURFACE
      ?auto_526525 - SURFACE
      ?auto_526522 - SURFACE
      ?auto_526526 - SURFACE
      ?auto_526528 - SURFACE
      ?auto_526527 - SURFACE
      ?auto_526529 - SURFACE
      ?auto_526530 - SURFACE
    )
    :vars
    (
      ?auto_526536 - HOIST
      ?auto_526535 - PLACE
      ?auto_526531 - TRUCK
      ?auto_526533 - PLACE
      ?auto_526532 - HOIST
      ?auto_526534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526536 ?auto_526535 ) ( SURFACE-AT ?auto_526529 ?auto_526535 ) ( CLEAR ?auto_526529 ) ( IS-CRATE ?auto_526530 ) ( not ( = ?auto_526529 ?auto_526530 ) ) ( AVAILABLE ?auto_526536 ) ( ON ?auto_526529 ?auto_526527 ) ( not ( = ?auto_526527 ?auto_526529 ) ) ( not ( = ?auto_526527 ?auto_526530 ) ) ( TRUCK-AT ?auto_526531 ?auto_526533 ) ( not ( = ?auto_526533 ?auto_526535 ) ) ( HOIST-AT ?auto_526532 ?auto_526533 ) ( not ( = ?auto_526536 ?auto_526532 ) ) ( AVAILABLE ?auto_526532 ) ( SURFACE-AT ?auto_526530 ?auto_526533 ) ( ON ?auto_526530 ?auto_526534 ) ( CLEAR ?auto_526530 ) ( not ( = ?auto_526529 ?auto_526534 ) ) ( not ( = ?auto_526530 ?auto_526534 ) ) ( not ( = ?auto_526527 ?auto_526534 ) ) ( ON ?auto_526524 ?auto_526523 ) ( ON ?auto_526525 ?auto_526524 ) ( ON ?auto_526522 ?auto_526525 ) ( ON ?auto_526526 ?auto_526522 ) ( ON ?auto_526528 ?auto_526526 ) ( ON ?auto_526527 ?auto_526528 ) ( not ( = ?auto_526523 ?auto_526524 ) ) ( not ( = ?auto_526523 ?auto_526525 ) ) ( not ( = ?auto_526523 ?auto_526522 ) ) ( not ( = ?auto_526523 ?auto_526526 ) ) ( not ( = ?auto_526523 ?auto_526528 ) ) ( not ( = ?auto_526523 ?auto_526527 ) ) ( not ( = ?auto_526523 ?auto_526529 ) ) ( not ( = ?auto_526523 ?auto_526530 ) ) ( not ( = ?auto_526523 ?auto_526534 ) ) ( not ( = ?auto_526524 ?auto_526525 ) ) ( not ( = ?auto_526524 ?auto_526522 ) ) ( not ( = ?auto_526524 ?auto_526526 ) ) ( not ( = ?auto_526524 ?auto_526528 ) ) ( not ( = ?auto_526524 ?auto_526527 ) ) ( not ( = ?auto_526524 ?auto_526529 ) ) ( not ( = ?auto_526524 ?auto_526530 ) ) ( not ( = ?auto_526524 ?auto_526534 ) ) ( not ( = ?auto_526525 ?auto_526522 ) ) ( not ( = ?auto_526525 ?auto_526526 ) ) ( not ( = ?auto_526525 ?auto_526528 ) ) ( not ( = ?auto_526525 ?auto_526527 ) ) ( not ( = ?auto_526525 ?auto_526529 ) ) ( not ( = ?auto_526525 ?auto_526530 ) ) ( not ( = ?auto_526525 ?auto_526534 ) ) ( not ( = ?auto_526522 ?auto_526526 ) ) ( not ( = ?auto_526522 ?auto_526528 ) ) ( not ( = ?auto_526522 ?auto_526527 ) ) ( not ( = ?auto_526522 ?auto_526529 ) ) ( not ( = ?auto_526522 ?auto_526530 ) ) ( not ( = ?auto_526522 ?auto_526534 ) ) ( not ( = ?auto_526526 ?auto_526528 ) ) ( not ( = ?auto_526526 ?auto_526527 ) ) ( not ( = ?auto_526526 ?auto_526529 ) ) ( not ( = ?auto_526526 ?auto_526530 ) ) ( not ( = ?auto_526526 ?auto_526534 ) ) ( not ( = ?auto_526528 ?auto_526527 ) ) ( not ( = ?auto_526528 ?auto_526529 ) ) ( not ( = ?auto_526528 ?auto_526530 ) ) ( not ( = ?auto_526528 ?auto_526534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526527 ?auto_526529 ?auto_526530 )
      ( MAKE-8CRATE-VERIFY ?auto_526523 ?auto_526524 ?auto_526525 ?auto_526522 ?auto_526526 ?auto_526528 ?auto_526527 ?auto_526529 ?auto_526530 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526616 - SURFACE
      ?auto_526617 - SURFACE
      ?auto_526618 - SURFACE
      ?auto_526615 - SURFACE
      ?auto_526619 - SURFACE
      ?auto_526621 - SURFACE
      ?auto_526620 - SURFACE
      ?auto_526622 - SURFACE
      ?auto_526623 - SURFACE
    )
    :vars
    (
      ?auto_526624 - HOIST
      ?auto_526625 - PLACE
      ?auto_526627 - PLACE
      ?auto_526629 - HOIST
      ?auto_526628 - SURFACE
      ?auto_526626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526624 ?auto_526625 ) ( SURFACE-AT ?auto_526622 ?auto_526625 ) ( CLEAR ?auto_526622 ) ( IS-CRATE ?auto_526623 ) ( not ( = ?auto_526622 ?auto_526623 ) ) ( AVAILABLE ?auto_526624 ) ( ON ?auto_526622 ?auto_526620 ) ( not ( = ?auto_526620 ?auto_526622 ) ) ( not ( = ?auto_526620 ?auto_526623 ) ) ( not ( = ?auto_526627 ?auto_526625 ) ) ( HOIST-AT ?auto_526629 ?auto_526627 ) ( not ( = ?auto_526624 ?auto_526629 ) ) ( AVAILABLE ?auto_526629 ) ( SURFACE-AT ?auto_526623 ?auto_526627 ) ( ON ?auto_526623 ?auto_526628 ) ( CLEAR ?auto_526623 ) ( not ( = ?auto_526622 ?auto_526628 ) ) ( not ( = ?auto_526623 ?auto_526628 ) ) ( not ( = ?auto_526620 ?auto_526628 ) ) ( TRUCK-AT ?auto_526626 ?auto_526625 ) ( ON ?auto_526617 ?auto_526616 ) ( ON ?auto_526618 ?auto_526617 ) ( ON ?auto_526615 ?auto_526618 ) ( ON ?auto_526619 ?auto_526615 ) ( ON ?auto_526621 ?auto_526619 ) ( ON ?auto_526620 ?auto_526621 ) ( not ( = ?auto_526616 ?auto_526617 ) ) ( not ( = ?auto_526616 ?auto_526618 ) ) ( not ( = ?auto_526616 ?auto_526615 ) ) ( not ( = ?auto_526616 ?auto_526619 ) ) ( not ( = ?auto_526616 ?auto_526621 ) ) ( not ( = ?auto_526616 ?auto_526620 ) ) ( not ( = ?auto_526616 ?auto_526622 ) ) ( not ( = ?auto_526616 ?auto_526623 ) ) ( not ( = ?auto_526616 ?auto_526628 ) ) ( not ( = ?auto_526617 ?auto_526618 ) ) ( not ( = ?auto_526617 ?auto_526615 ) ) ( not ( = ?auto_526617 ?auto_526619 ) ) ( not ( = ?auto_526617 ?auto_526621 ) ) ( not ( = ?auto_526617 ?auto_526620 ) ) ( not ( = ?auto_526617 ?auto_526622 ) ) ( not ( = ?auto_526617 ?auto_526623 ) ) ( not ( = ?auto_526617 ?auto_526628 ) ) ( not ( = ?auto_526618 ?auto_526615 ) ) ( not ( = ?auto_526618 ?auto_526619 ) ) ( not ( = ?auto_526618 ?auto_526621 ) ) ( not ( = ?auto_526618 ?auto_526620 ) ) ( not ( = ?auto_526618 ?auto_526622 ) ) ( not ( = ?auto_526618 ?auto_526623 ) ) ( not ( = ?auto_526618 ?auto_526628 ) ) ( not ( = ?auto_526615 ?auto_526619 ) ) ( not ( = ?auto_526615 ?auto_526621 ) ) ( not ( = ?auto_526615 ?auto_526620 ) ) ( not ( = ?auto_526615 ?auto_526622 ) ) ( not ( = ?auto_526615 ?auto_526623 ) ) ( not ( = ?auto_526615 ?auto_526628 ) ) ( not ( = ?auto_526619 ?auto_526621 ) ) ( not ( = ?auto_526619 ?auto_526620 ) ) ( not ( = ?auto_526619 ?auto_526622 ) ) ( not ( = ?auto_526619 ?auto_526623 ) ) ( not ( = ?auto_526619 ?auto_526628 ) ) ( not ( = ?auto_526621 ?auto_526620 ) ) ( not ( = ?auto_526621 ?auto_526622 ) ) ( not ( = ?auto_526621 ?auto_526623 ) ) ( not ( = ?auto_526621 ?auto_526628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526620 ?auto_526622 ?auto_526623 )
      ( MAKE-8CRATE-VERIFY ?auto_526616 ?auto_526617 ?auto_526618 ?auto_526615 ?auto_526619 ?auto_526621 ?auto_526620 ?auto_526622 ?auto_526623 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526709 - SURFACE
      ?auto_526710 - SURFACE
      ?auto_526711 - SURFACE
      ?auto_526708 - SURFACE
      ?auto_526712 - SURFACE
      ?auto_526714 - SURFACE
      ?auto_526713 - SURFACE
      ?auto_526715 - SURFACE
      ?auto_526716 - SURFACE
    )
    :vars
    (
      ?auto_526718 - HOIST
      ?auto_526721 - PLACE
      ?auto_526722 - PLACE
      ?auto_526720 - HOIST
      ?auto_526717 - SURFACE
      ?auto_526719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526718 ?auto_526721 ) ( IS-CRATE ?auto_526716 ) ( not ( = ?auto_526715 ?auto_526716 ) ) ( not ( = ?auto_526713 ?auto_526715 ) ) ( not ( = ?auto_526713 ?auto_526716 ) ) ( not ( = ?auto_526722 ?auto_526721 ) ) ( HOIST-AT ?auto_526720 ?auto_526722 ) ( not ( = ?auto_526718 ?auto_526720 ) ) ( AVAILABLE ?auto_526720 ) ( SURFACE-AT ?auto_526716 ?auto_526722 ) ( ON ?auto_526716 ?auto_526717 ) ( CLEAR ?auto_526716 ) ( not ( = ?auto_526715 ?auto_526717 ) ) ( not ( = ?auto_526716 ?auto_526717 ) ) ( not ( = ?auto_526713 ?auto_526717 ) ) ( TRUCK-AT ?auto_526719 ?auto_526721 ) ( SURFACE-AT ?auto_526713 ?auto_526721 ) ( CLEAR ?auto_526713 ) ( LIFTING ?auto_526718 ?auto_526715 ) ( IS-CRATE ?auto_526715 ) ( ON ?auto_526710 ?auto_526709 ) ( ON ?auto_526711 ?auto_526710 ) ( ON ?auto_526708 ?auto_526711 ) ( ON ?auto_526712 ?auto_526708 ) ( ON ?auto_526714 ?auto_526712 ) ( ON ?auto_526713 ?auto_526714 ) ( not ( = ?auto_526709 ?auto_526710 ) ) ( not ( = ?auto_526709 ?auto_526711 ) ) ( not ( = ?auto_526709 ?auto_526708 ) ) ( not ( = ?auto_526709 ?auto_526712 ) ) ( not ( = ?auto_526709 ?auto_526714 ) ) ( not ( = ?auto_526709 ?auto_526713 ) ) ( not ( = ?auto_526709 ?auto_526715 ) ) ( not ( = ?auto_526709 ?auto_526716 ) ) ( not ( = ?auto_526709 ?auto_526717 ) ) ( not ( = ?auto_526710 ?auto_526711 ) ) ( not ( = ?auto_526710 ?auto_526708 ) ) ( not ( = ?auto_526710 ?auto_526712 ) ) ( not ( = ?auto_526710 ?auto_526714 ) ) ( not ( = ?auto_526710 ?auto_526713 ) ) ( not ( = ?auto_526710 ?auto_526715 ) ) ( not ( = ?auto_526710 ?auto_526716 ) ) ( not ( = ?auto_526710 ?auto_526717 ) ) ( not ( = ?auto_526711 ?auto_526708 ) ) ( not ( = ?auto_526711 ?auto_526712 ) ) ( not ( = ?auto_526711 ?auto_526714 ) ) ( not ( = ?auto_526711 ?auto_526713 ) ) ( not ( = ?auto_526711 ?auto_526715 ) ) ( not ( = ?auto_526711 ?auto_526716 ) ) ( not ( = ?auto_526711 ?auto_526717 ) ) ( not ( = ?auto_526708 ?auto_526712 ) ) ( not ( = ?auto_526708 ?auto_526714 ) ) ( not ( = ?auto_526708 ?auto_526713 ) ) ( not ( = ?auto_526708 ?auto_526715 ) ) ( not ( = ?auto_526708 ?auto_526716 ) ) ( not ( = ?auto_526708 ?auto_526717 ) ) ( not ( = ?auto_526712 ?auto_526714 ) ) ( not ( = ?auto_526712 ?auto_526713 ) ) ( not ( = ?auto_526712 ?auto_526715 ) ) ( not ( = ?auto_526712 ?auto_526716 ) ) ( not ( = ?auto_526712 ?auto_526717 ) ) ( not ( = ?auto_526714 ?auto_526713 ) ) ( not ( = ?auto_526714 ?auto_526715 ) ) ( not ( = ?auto_526714 ?auto_526716 ) ) ( not ( = ?auto_526714 ?auto_526717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526713 ?auto_526715 ?auto_526716 )
      ( MAKE-8CRATE-VERIFY ?auto_526709 ?auto_526710 ?auto_526711 ?auto_526708 ?auto_526712 ?auto_526714 ?auto_526713 ?auto_526715 ?auto_526716 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526802 - SURFACE
      ?auto_526803 - SURFACE
      ?auto_526804 - SURFACE
      ?auto_526801 - SURFACE
      ?auto_526805 - SURFACE
      ?auto_526807 - SURFACE
      ?auto_526806 - SURFACE
      ?auto_526808 - SURFACE
      ?auto_526809 - SURFACE
    )
    :vars
    (
      ?auto_526812 - HOIST
      ?auto_526813 - PLACE
      ?auto_526811 - PLACE
      ?auto_526815 - HOIST
      ?auto_526810 - SURFACE
      ?auto_526814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526812 ?auto_526813 ) ( IS-CRATE ?auto_526809 ) ( not ( = ?auto_526808 ?auto_526809 ) ) ( not ( = ?auto_526806 ?auto_526808 ) ) ( not ( = ?auto_526806 ?auto_526809 ) ) ( not ( = ?auto_526811 ?auto_526813 ) ) ( HOIST-AT ?auto_526815 ?auto_526811 ) ( not ( = ?auto_526812 ?auto_526815 ) ) ( AVAILABLE ?auto_526815 ) ( SURFACE-AT ?auto_526809 ?auto_526811 ) ( ON ?auto_526809 ?auto_526810 ) ( CLEAR ?auto_526809 ) ( not ( = ?auto_526808 ?auto_526810 ) ) ( not ( = ?auto_526809 ?auto_526810 ) ) ( not ( = ?auto_526806 ?auto_526810 ) ) ( TRUCK-AT ?auto_526814 ?auto_526813 ) ( SURFACE-AT ?auto_526806 ?auto_526813 ) ( CLEAR ?auto_526806 ) ( IS-CRATE ?auto_526808 ) ( AVAILABLE ?auto_526812 ) ( IN ?auto_526808 ?auto_526814 ) ( ON ?auto_526803 ?auto_526802 ) ( ON ?auto_526804 ?auto_526803 ) ( ON ?auto_526801 ?auto_526804 ) ( ON ?auto_526805 ?auto_526801 ) ( ON ?auto_526807 ?auto_526805 ) ( ON ?auto_526806 ?auto_526807 ) ( not ( = ?auto_526802 ?auto_526803 ) ) ( not ( = ?auto_526802 ?auto_526804 ) ) ( not ( = ?auto_526802 ?auto_526801 ) ) ( not ( = ?auto_526802 ?auto_526805 ) ) ( not ( = ?auto_526802 ?auto_526807 ) ) ( not ( = ?auto_526802 ?auto_526806 ) ) ( not ( = ?auto_526802 ?auto_526808 ) ) ( not ( = ?auto_526802 ?auto_526809 ) ) ( not ( = ?auto_526802 ?auto_526810 ) ) ( not ( = ?auto_526803 ?auto_526804 ) ) ( not ( = ?auto_526803 ?auto_526801 ) ) ( not ( = ?auto_526803 ?auto_526805 ) ) ( not ( = ?auto_526803 ?auto_526807 ) ) ( not ( = ?auto_526803 ?auto_526806 ) ) ( not ( = ?auto_526803 ?auto_526808 ) ) ( not ( = ?auto_526803 ?auto_526809 ) ) ( not ( = ?auto_526803 ?auto_526810 ) ) ( not ( = ?auto_526804 ?auto_526801 ) ) ( not ( = ?auto_526804 ?auto_526805 ) ) ( not ( = ?auto_526804 ?auto_526807 ) ) ( not ( = ?auto_526804 ?auto_526806 ) ) ( not ( = ?auto_526804 ?auto_526808 ) ) ( not ( = ?auto_526804 ?auto_526809 ) ) ( not ( = ?auto_526804 ?auto_526810 ) ) ( not ( = ?auto_526801 ?auto_526805 ) ) ( not ( = ?auto_526801 ?auto_526807 ) ) ( not ( = ?auto_526801 ?auto_526806 ) ) ( not ( = ?auto_526801 ?auto_526808 ) ) ( not ( = ?auto_526801 ?auto_526809 ) ) ( not ( = ?auto_526801 ?auto_526810 ) ) ( not ( = ?auto_526805 ?auto_526807 ) ) ( not ( = ?auto_526805 ?auto_526806 ) ) ( not ( = ?auto_526805 ?auto_526808 ) ) ( not ( = ?auto_526805 ?auto_526809 ) ) ( not ( = ?auto_526805 ?auto_526810 ) ) ( not ( = ?auto_526807 ?auto_526806 ) ) ( not ( = ?auto_526807 ?auto_526808 ) ) ( not ( = ?auto_526807 ?auto_526809 ) ) ( not ( = ?auto_526807 ?auto_526810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526806 ?auto_526808 ?auto_526809 )
      ( MAKE-8CRATE-VERIFY ?auto_526802 ?auto_526803 ?auto_526804 ?auto_526801 ?auto_526805 ?auto_526807 ?auto_526806 ?auto_526808 ?auto_526809 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530918 - SURFACE
      ?auto_530919 - SURFACE
      ?auto_530920 - SURFACE
      ?auto_530917 - SURFACE
      ?auto_530921 - SURFACE
      ?auto_530923 - SURFACE
      ?auto_530922 - SURFACE
      ?auto_530924 - SURFACE
      ?auto_530925 - SURFACE
      ?auto_530926 - SURFACE
    )
    :vars
    (
      ?auto_530927 - HOIST
      ?auto_530928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530927 ?auto_530928 ) ( SURFACE-AT ?auto_530925 ?auto_530928 ) ( CLEAR ?auto_530925 ) ( LIFTING ?auto_530927 ?auto_530926 ) ( IS-CRATE ?auto_530926 ) ( not ( = ?auto_530925 ?auto_530926 ) ) ( ON ?auto_530919 ?auto_530918 ) ( ON ?auto_530920 ?auto_530919 ) ( ON ?auto_530917 ?auto_530920 ) ( ON ?auto_530921 ?auto_530917 ) ( ON ?auto_530923 ?auto_530921 ) ( ON ?auto_530922 ?auto_530923 ) ( ON ?auto_530924 ?auto_530922 ) ( ON ?auto_530925 ?auto_530924 ) ( not ( = ?auto_530918 ?auto_530919 ) ) ( not ( = ?auto_530918 ?auto_530920 ) ) ( not ( = ?auto_530918 ?auto_530917 ) ) ( not ( = ?auto_530918 ?auto_530921 ) ) ( not ( = ?auto_530918 ?auto_530923 ) ) ( not ( = ?auto_530918 ?auto_530922 ) ) ( not ( = ?auto_530918 ?auto_530924 ) ) ( not ( = ?auto_530918 ?auto_530925 ) ) ( not ( = ?auto_530918 ?auto_530926 ) ) ( not ( = ?auto_530919 ?auto_530920 ) ) ( not ( = ?auto_530919 ?auto_530917 ) ) ( not ( = ?auto_530919 ?auto_530921 ) ) ( not ( = ?auto_530919 ?auto_530923 ) ) ( not ( = ?auto_530919 ?auto_530922 ) ) ( not ( = ?auto_530919 ?auto_530924 ) ) ( not ( = ?auto_530919 ?auto_530925 ) ) ( not ( = ?auto_530919 ?auto_530926 ) ) ( not ( = ?auto_530920 ?auto_530917 ) ) ( not ( = ?auto_530920 ?auto_530921 ) ) ( not ( = ?auto_530920 ?auto_530923 ) ) ( not ( = ?auto_530920 ?auto_530922 ) ) ( not ( = ?auto_530920 ?auto_530924 ) ) ( not ( = ?auto_530920 ?auto_530925 ) ) ( not ( = ?auto_530920 ?auto_530926 ) ) ( not ( = ?auto_530917 ?auto_530921 ) ) ( not ( = ?auto_530917 ?auto_530923 ) ) ( not ( = ?auto_530917 ?auto_530922 ) ) ( not ( = ?auto_530917 ?auto_530924 ) ) ( not ( = ?auto_530917 ?auto_530925 ) ) ( not ( = ?auto_530917 ?auto_530926 ) ) ( not ( = ?auto_530921 ?auto_530923 ) ) ( not ( = ?auto_530921 ?auto_530922 ) ) ( not ( = ?auto_530921 ?auto_530924 ) ) ( not ( = ?auto_530921 ?auto_530925 ) ) ( not ( = ?auto_530921 ?auto_530926 ) ) ( not ( = ?auto_530923 ?auto_530922 ) ) ( not ( = ?auto_530923 ?auto_530924 ) ) ( not ( = ?auto_530923 ?auto_530925 ) ) ( not ( = ?auto_530923 ?auto_530926 ) ) ( not ( = ?auto_530922 ?auto_530924 ) ) ( not ( = ?auto_530922 ?auto_530925 ) ) ( not ( = ?auto_530922 ?auto_530926 ) ) ( not ( = ?auto_530924 ?auto_530925 ) ) ( not ( = ?auto_530924 ?auto_530926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_530925 ?auto_530926 )
      ( MAKE-9CRATE-VERIFY ?auto_530918 ?auto_530919 ?auto_530920 ?auto_530917 ?auto_530921 ?auto_530923 ?auto_530922 ?auto_530924 ?auto_530925 ?auto_530926 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530998 - SURFACE
      ?auto_530999 - SURFACE
      ?auto_531000 - SURFACE
      ?auto_530997 - SURFACE
      ?auto_531001 - SURFACE
      ?auto_531003 - SURFACE
      ?auto_531002 - SURFACE
      ?auto_531004 - SURFACE
      ?auto_531005 - SURFACE
      ?auto_531006 - SURFACE
    )
    :vars
    (
      ?auto_531007 - HOIST
      ?auto_531009 - PLACE
      ?auto_531008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531007 ?auto_531009 ) ( SURFACE-AT ?auto_531005 ?auto_531009 ) ( CLEAR ?auto_531005 ) ( IS-CRATE ?auto_531006 ) ( not ( = ?auto_531005 ?auto_531006 ) ) ( TRUCK-AT ?auto_531008 ?auto_531009 ) ( AVAILABLE ?auto_531007 ) ( IN ?auto_531006 ?auto_531008 ) ( ON ?auto_531005 ?auto_531004 ) ( not ( = ?auto_531004 ?auto_531005 ) ) ( not ( = ?auto_531004 ?auto_531006 ) ) ( ON ?auto_530999 ?auto_530998 ) ( ON ?auto_531000 ?auto_530999 ) ( ON ?auto_530997 ?auto_531000 ) ( ON ?auto_531001 ?auto_530997 ) ( ON ?auto_531003 ?auto_531001 ) ( ON ?auto_531002 ?auto_531003 ) ( ON ?auto_531004 ?auto_531002 ) ( not ( = ?auto_530998 ?auto_530999 ) ) ( not ( = ?auto_530998 ?auto_531000 ) ) ( not ( = ?auto_530998 ?auto_530997 ) ) ( not ( = ?auto_530998 ?auto_531001 ) ) ( not ( = ?auto_530998 ?auto_531003 ) ) ( not ( = ?auto_530998 ?auto_531002 ) ) ( not ( = ?auto_530998 ?auto_531004 ) ) ( not ( = ?auto_530998 ?auto_531005 ) ) ( not ( = ?auto_530998 ?auto_531006 ) ) ( not ( = ?auto_530999 ?auto_531000 ) ) ( not ( = ?auto_530999 ?auto_530997 ) ) ( not ( = ?auto_530999 ?auto_531001 ) ) ( not ( = ?auto_530999 ?auto_531003 ) ) ( not ( = ?auto_530999 ?auto_531002 ) ) ( not ( = ?auto_530999 ?auto_531004 ) ) ( not ( = ?auto_530999 ?auto_531005 ) ) ( not ( = ?auto_530999 ?auto_531006 ) ) ( not ( = ?auto_531000 ?auto_530997 ) ) ( not ( = ?auto_531000 ?auto_531001 ) ) ( not ( = ?auto_531000 ?auto_531003 ) ) ( not ( = ?auto_531000 ?auto_531002 ) ) ( not ( = ?auto_531000 ?auto_531004 ) ) ( not ( = ?auto_531000 ?auto_531005 ) ) ( not ( = ?auto_531000 ?auto_531006 ) ) ( not ( = ?auto_530997 ?auto_531001 ) ) ( not ( = ?auto_530997 ?auto_531003 ) ) ( not ( = ?auto_530997 ?auto_531002 ) ) ( not ( = ?auto_530997 ?auto_531004 ) ) ( not ( = ?auto_530997 ?auto_531005 ) ) ( not ( = ?auto_530997 ?auto_531006 ) ) ( not ( = ?auto_531001 ?auto_531003 ) ) ( not ( = ?auto_531001 ?auto_531002 ) ) ( not ( = ?auto_531001 ?auto_531004 ) ) ( not ( = ?auto_531001 ?auto_531005 ) ) ( not ( = ?auto_531001 ?auto_531006 ) ) ( not ( = ?auto_531003 ?auto_531002 ) ) ( not ( = ?auto_531003 ?auto_531004 ) ) ( not ( = ?auto_531003 ?auto_531005 ) ) ( not ( = ?auto_531003 ?auto_531006 ) ) ( not ( = ?auto_531002 ?auto_531004 ) ) ( not ( = ?auto_531002 ?auto_531005 ) ) ( not ( = ?auto_531002 ?auto_531006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531004 ?auto_531005 ?auto_531006 )
      ( MAKE-9CRATE-VERIFY ?auto_530998 ?auto_530999 ?auto_531000 ?auto_530997 ?auto_531001 ?auto_531003 ?auto_531002 ?auto_531004 ?auto_531005 ?auto_531006 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531088 - SURFACE
      ?auto_531089 - SURFACE
      ?auto_531090 - SURFACE
      ?auto_531087 - SURFACE
      ?auto_531091 - SURFACE
      ?auto_531093 - SURFACE
      ?auto_531092 - SURFACE
      ?auto_531094 - SURFACE
      ?auto_531095 - SURFACE
      ?auto_531096 - SURFACE
    )
    :vars
    (
      ?auto_531098 - HOIST
      ?auto_531100 - PLACE
      ?auto_531099 - TRUCK
      ?auto_531097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_531098 ?auto_531100 ) ( SURFACE-AT ?auto_531095 ?auto_531100 ) ( CLEAR ?auto_531095 ) ( IS-CRATE ?auto_531096 ) ( not ( = ?auto_531095 ?auto_531096 ) ) ( AVAILABLE ?auto_531098 ) ( IN ?auto_531096 ?auto_531099 ) ( ON ?auto_531095 ?auto_531094 ) ( not ( = ?auto_531094 ?auto_531095 ) ) ( not ( = ?auto_531094 ?auto_531096 ) ) ( TRUCK-AT ?auto_531099 ?auto_531097 ) ( not ( = ?auto_531097 ?auto_531100 ) ) ( ON ?auto_531089 ?auto_531088 ) ( ON ?auto_531090 ?auto_531089 ) ( ON ?auto_531087 ?auto_531090 ) ( ON ?auto_531091 ?auto_531087 ) ( ON ?auto_531093 ?auto_531091 ) ( ON ?auto_531092 ?auto_531093 ) ( ON ?auto_531094 ?auto_531092 ) ( not ( = ?auto_531088 ?auto_531089 ) ) ( not ( = ?auto_531088 ?auto_531090 ) ) ( not ( = ?auto_531088 ?auto_531087 ) ) ( not ( = ?auto_531088 ?auto_531091 ) ) ( not ( = ?auto_531088 ?auto_531093 ) ) ( not ( = ?auto_531088 ?auto_531092 ) ) ( not ( = ?auto_531088 ?auto_531094 ) ) ( not ( = ?auto_531088 ?auto_531095 ) ) ( not ( = ?auto_531088 ?auto_531096 ) ) ( not ( = ?auto_531089 ?auto_531090 ) ) ( not ( = ?auto_531089 ?auto_531087 ) ) ( not ( = ?auto_531089 ?auto_531091 ) ) ( not ( = ?auto_531089 ?auto_531093 ) ) ( not ( = ?auto_531089 ?auto_531092 ) ) ( not ( = ?auto_531089 ?auto_531094 ) ) ( not ( = ?auto_531089 ?auto_531095 ) ) ( not ( = ?auto_531089 ?auto_531096 ) ) ( not ( = ?auto_531090 ?auto_531087 ) ) ( not ( = ?auto_531090 ?auto_531091 ) ) ( not ( = ?auto_531090 ?auto_531093 ) ) ( not ( = ?auto_531090 ?auto_531092 ) ) ( not ( = ?auto_531090 ?auto_531094 ) ) ( not ( = ?auto_531090 ?auto_531095 ) ) ( not ( = ?auto_531090 ?auto_531096 ) ) ( not ( = ?auto_531087 ?auto_531091 ) ) ( not ( = ?auto_531087 ?auto_531093 ) ) ( not ( = ?auto_531087 ?auto_531092 ) ) ( not ( = ?auto_531087 ?auto_531094 ) ) ( not ( = ?auto_531087 ?auto_531095 ) ) ( not ( = ?auto_531087 ?auto_531096 ) ) ( not ( = ?auto_531091 ?auto_531093 ) ) ( not ( = ?auto_531091 ?auto_531092 ) ) ( not ( = ?auto_531091 ?auto_531094 ) ) ( not ( = ?auto_531091 ?auto_531095 ) ) ( not ( = ?auto_531091 ?auto_531096 ) ) ( not ( = ?auto_531093 ?auto_531092 ) ) ( not ( = ?auto_531093 ?auto_531094 ) ) ( not ( = ?auto_531093 ?auto_531095 ) ) ( not ( = ?auto_531093 ?auto_531096 ) ) ( not ( = ?auto_531092 ?auto_531094 ) ) ( not ( = ?auto_531092 ?auto_531095 ) ) ( not ( = ?auto_531092 ?auto_531096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531094 ?auto_531095 ?auto_531096 )
      ( MAKE-9CRATE-VERIFY ?auto_531088 ?auto_531089 ?auto_531090 ?auto_531087 ?auto_531091 ?auto_531093 ?auto_531092 ?auto_531094 ?auto_531095 ?auto_531096 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531187 - SURFACE
      ?auto_531188 - SURFACE
      ?auto_531189 - SURFACE
      ?auto_531186 - SURFACE
      ?auto_531190 - SURFACE
      ?auto_531192 - SURFACE
      ?auto_531191 - SURFACE
      ?auto_531193 - SURFACE
      ?auto_531194 - SURFACE
      ?auto_531195 - SURFACE
    )
    :vars
    (
      ?auto_531200 - HOIST
      ?auto_531197 - PLACE
      ?auto_531196 - TRUCK
      ?auto_531198 - PLACE
      ?auto_531199 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_531200 ?auto_531197 ) ( SURFACE-AT ?auto_531194 ?auto_531197 ) ( CLEAR ?auto_531194 ) ( IS-CRATE ?auto_531195 ) ( not ( = ?auto_531194 ?auto_531195 ) ) ( AVAILABLE ?auto_531200 ) ( ON ?auto_531194 ?auto_531193 ) ( not ( = ?auto_531193 ?auto_531194 ) ) ( not ( = ?auto_531193 ?auto_531195 ) ) ( TRUCK-AT ?auto_531196 ?auto_531198 ) ( not ( = ?auto_531198 ?auto_531197 ) ) ( HOIST-AT ?auto_531199 ?auto_531198 ) ( LIFTING ?auto_531199 ?auto_531195 ) ( not ( = ?auto_531200 ?auto_531199 ) ) ( ON ?auto_531188 ?auto_531187 ) ( ON ?auto_531189 ?auto_531188 ) ( ON ?auto_531186 ?auto_531189 ) ( ON ?auto_531190 ?auto_531186 ) ( ON ?auto_531192 ?auto_531190 ) ( ON ?auto_531191 ?auto_531192 ) ( ON ?auto_531193 ?auto_531191 ) ( not ( = ?auto_531187 ?auto_531188 ) ) ( not ( = ?auto_531187 ?auto_531189 ) ) ( not ( = ?auto_531187 ?auto_531186 ) ) ( not ( = ?auto_531187 ?auto_531190 ) ) ( not ( = ?auto_531187 ?auto_531192 ) ) ( not ( = ?auto_531187 ?auto_531191 ) ) ( not ( = ?auto_531187 ?auto_531193 ) ) ( not ( = ?auto_531187 ?auto_531194 ) ) ( not ( = ?auto_531187 ?auto_531195 ) ) ( not ( = ?auto_531188 ?auto_531189 ) ) ( not ( = ?auto_531188 ?auto_531186 ) ) ( not ( = ?auto_531188 ?auto_531190 ) ) ( not ( = ?auto_531188 ?auto_531192 ) ) ( not ( = ?auto_531188 ?auto_531191 ) ) ( not ( = ?auto_531188 ?auto_531193 ) ) ( not ( = ?auto_531188 ?auto_531194 ) ) ( not ( = ?auto_531188 ?auto_531195 ) ) ( not ( = ?auto_531189 ?auto_531186 ) ) ( not ( = ?auto_531189 ?auto_531190 ) ) ( not ( = ?auto_531189 ?auto_531192 ) ) ( not ( = ?auto_531189 ?auto_531191 ) ) ( not ( = ?auto_531189 ?auto_531193 ) ) ( not ( = ?auto_531189 ?auto_531194 ) ) ( not ( = ?auto_531189 ?auto_531195 ) ) ( not ( = ?auto_531186 ?auto_531190 ) ) ( not ( = ?auto_531186 ?auto_531192 ) ) ( not ( = ?auto_531186 ?auto_531191 ) ) ( not ( = ?auto_531186 ?auto_531193 ) ) ( not ( = ?auto_531186 ?auto_531194 ) ) ( not ( = ?auto_531186 ?auto_531195 ) ) ( not ( = ?auto_531190 ?auto_531192 ) ) ( not ( = ?auto_531190 ?auto_531191 ) ) ( not ( = ?auto_531190 ?auto_531193 ) ) ( not ( = ?auto_531190 ?auto_531194 ) ) ( not ( = ?auto_531190 ?auto_531195 ) ) ( not ( = ?auto_531192 ?auto_531191 ) ) ( not ( = ?auto_531192 ?auto_531193 ) ) ( not ( = ?auto_531192 ?auto_531194 ) ) ( not ( = ?auto_531192 ?auto_531195 ) ) ( not ( = ?auto_531191 ?auto_531193 ) ) ( not ( = ?auto_531191 ?auto_531194 ) ) ( not ( = ?auto_531191 ?auto_531195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531193 ?auto_531194 ?auto_531195 )
      ( MAKE-9CRATE-VERIFY ?auto_531187 ?auto_531188 ?auto_531189 ?auto_531186 ?auto_531190 ?auto_531192 ?auto_531191 ?auto_531193 ?auto_531194 ?auto_531195 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531295 - SURFACE
      ?auto_531296 - SURFACE
      ?auto_531297 - SURFACE
      ?auto_531294 - SURFACE
      ?auto_531298 - SURFACE
      ?auto_531300 - SURFACE
      ?auto_531299 - SURFACE
      ?auto_531301 - SURFACE
      ?auto_531302 - SURFACE
      ?auto_531303 - SURFACE
    )
    :vars
    (
      ?auto_531308 - HOIST
      ?auto_531304 - PLACE
      ?auto_531307 - TRUCK
      ?auto_531306 - PLACE
      ?auto_531309 - HOIST
      ?auto_531305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_531308 ?auto_531304 ) ( SURFACE-AT ?auto_531302 ?auto_531304 ) ( CLEAR ?auto_531302 ) ( IS-CRATE ?auto_531303 ) ( not ( = ?auto_531302 ?auto_531303 ) ) ( AVAILABLE ?auto_531308 ) ( ON ?auto_531302 ?auto_531301 ) ( not ( = ?auto_531301 ?auto_531302 ) ) ( not ( = ?auto_531301 ?auto_531303 ) ) ( TRUCK-AT ?auto_531307 ?auto_531306 ) ( not ( = ?auto_531306 ?auto_531304 ) ) ( HOIST-AT ?auto_531309 ?auto_531306 ) ( not ( = ?auto_531308 ?auto_531309 ) ) ( AVAILABLE ?auto_531309 ) ( SURFACE-AT ?auto_531303 ?auto_531306 ) ( ON ?auto_531303 ?auto_531305 ) ( CLEAR ?auto_531303 ) ( not ( = ?auto_531302 ?auto_531305 ) ) ( not ( = ?auto_531303 ?auto_531305 ) ) ( not ( = ?auto_531301 ?auto_531305 ) ) ( ON ?auto_531296 ?auto_531295 ) ( ON ?auto_531297 ?auto_531296 ) ( ON ?auto_531294 ?auto_531297 ) ( ON ?auto_531298 ?auto_531294 ) ( ON ?auto_531300 ?auto_531298 ) ( ON ?auto_531299 ?auto_531300 ) ( ON ?auto_531301 ?auto_531299 ) ( not ( = ?auto_531295 ?auto_531296 ) ) ( not ( = ?auto_531295 ?auto_531297 ) ) ( not ( = ?auto_531295 ?auto_531294 ) ) ( not ( = ?auto_531295 ?auto_531298 ) ) ( not ( = ?auto_531295 ?auto_531300 ) ) ( not ( = ?auto_531295 ?auto_531299 ) ) ( not ( = ?auto_531295 ?auto_531301 ) ) ( not ( = ?auto_531295 ?auto_531302 ) ) ( not ( = ?auto_531295 ?auto_531303 ) ) ( not ( = ?auto_531295 ?auto_531305 ) ) ( not ( = ?auto_531296 ?auto_531297 ) ) ( not ( = ?auto_531296 ?auto_531294 ) ) ( not ( = ?auto_531296 ?auto_531298 ) ) ( not ( = ?auto_531296 ?auto_531300 ) ) ( not ( = ?auto_531296 ?auto_531299 ) ) ( not ( = ?auto_531296 ?auto_531301 ) ) ( not ( = ?auto_531296 ?auto_531302 ) ) ( not ( = ?auto_531296 ?auto_531303 ) ) ( not ( = ?auto_531296 ?auto_531305 ) ) ( not ( = ?auto_531297 ?auto_531294 ) ) ( not ( = ?auto_531297 ?auto_531298 ) ) ( not ( = ?auto_531297 ?auto_531300 ) ) ( not ( = ?auto_531297 ?auto_531299 ) ) ( not ( = ?auto_531297 ?auto_531301 ) ) ( not ( = ?auto_531297 ?auto_531302 ) ) ( not ( = ?auto_531297 ?auto_531303 ) ) ( not ( = ?auto_531297 ?auto_531305 ) ) ( not ( = ?auto_531294 ?auto_531298 ) ) ( not ( = ?auto_531294 ?auto_531300 ) ) ( not ( = ?auto_531294 ?auto_531299 ) ) ( not ( = ?auto_531294 ?auto_531301 ) ) ( not ( = ?auto_531294 ?auto_531302 ) ) ( not ( = ?auto_531294 ?auto_531303 ) ) ( not ( = ?auto_531294 ?auto_531305 ) ) ( not ( = ?auto_531298 ?auto_531300 ) ) ( not ( = ?auto_531298 ?auto_531299 ) ) ( not ( = ?auto_531298 ?auto_531301 ) ) ( not ( = ?auto_531298 ?auto_531302 ) ) ( not ( = ?auto_531298 ?auto_531303 ) ) ( not ( = ?auto_531298 ?auto_531305 ) ) ( not ( = ?auto_531300 ?auto_531299 ) ) ( not ( = ?auto_531300 ?auto_531301 ) ) ( not ( = ?auto_531300 ?auto_531302 ) ) ( not ( = ?auto_531300 ?auto_531303 ) ) ( not ( = ?auto_531300 ?auto_531305 ) ) ( not ( = ?auto_531299 ?auto_531301 ) ) ( not ( = ?auto_531299 ?auto_531302 ) ) ( not ( = ?auto_531299 ?auto_531303 ) ) ( not ( = ?auto_531299 ?auto_531305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531301 ?auto_531302 ?auto_531303 )
      ( MAKE-9CRATE-VERIFY ?auto_531295 ?auto_531296 ?auto_531297 ?auto_531294 ?auto_531298 ?auto_531300 ?auto_531299 ?auto_531301 ?auto_531302 ?auto_531303 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531404 - SURFACE
      ?auto_531405 - SURFACE
      ?auto_531406 - SURFACE
      ?auto_531403 - SURFACE
      ?auto_531407 - SURFACE
      ?auto_531409 - SURFACE
      ?auto_531408 - SURFACE
      ?auto_531410 - SURFACE
      ?auto_531411 - SURFACE
      ?auto_531412 - SURFACE
    )
    :vars
    (
      ?auto_531416 - HOIST
      ?auto_531414 - PLACE
      ?auto_531417 - PLACE
      ?auto_531415 - HOIST
      ?auto_531413 - SURFACE
      ?auto_531418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531416 ?auto_531414 ) ( SURFACE-AT ?auto_531411 ?auto_531414 ) ( CLEAR ?auto_531411 ) ( IS-CRATE ?auto_531412 ) ( not ( = ?auto_531411 ?auto_531412 ) ) ( AVAILABLE ?auto_531416 ) ( ON ?auto_531411 ?auto_531410 ) ( not ( = ?auto_531410 ?auto_531411 ) ) ( not ( = ?auto_531410 ?auto_531412 ) ) ( not ( = ?auto_531417 ?auto_531414 ) ) ( HOIST-AT ?auto_531415 ?auto_531417 ) ( not ( = ?auto_531416 ?auto_531415 ) ) ( AVAILABLE ?auto_531415 ) ( SURFACE-AT ?auto_531412 ?auto_531417 ) ( ON ?auto_531412 ?auto_531413 ) ( CLEAR ?auto_531412 ) ( not ( = ?auto_531411 ?auto_531413 ) ) ( not ( = ?auto_531412 ?auto_531413 ) ) ( not ( = ?auto_531410 ?auto_531413 ) ) ( TRUCK-AT ?auto_531418 ?auto_531414 ) ( ON ?auto_531405 ?auto_531404 ) ( ON ?auto_531406 ?auto_531405 ) ( ON ?auto_531403 ?auto_531406 ) ( ON ?auto_531407 ?auto_531403 ) ( ON ?auto_531409 ?auto_531407 ) ( ON ?auto_531408 ?auto_531409 ) ( ON ?auto_531410 ?auto_531408 ) ( not ( = ?auto_531404 ?auto_531405 ) ) ( not ( = ?auto_531404 ?auto_531406 ) ) ( not ( = ?auto_531404 ?auto_531403 ) ) ( not ( = ?auto_531404 ?auto_531407 ) ) ( not ( = ?auto_531404 ?auto_531409 ) ) ( not ( = ?auto_531404 ?auto_531408 ) ) ( not ( = ?auto_531404 ?auto_531410 ) ) ( not ( = ?auto_531404 ?auto_531411 ) ) ( not ( = ?auto_531404 ?auto_531412 ) ) ( not ( = ?auto_531404 ?auto_531413 ) ) ( not ( = ?auto_531405 ?auto_531406 ) ) ( not ( = ?auto_531405 ?auto_531403 ) ) ( not ( = ?auto_531405 ?auto_531407 ) ) ( not ( = ?auto_531405 ?auto_531409 ) ) ( not ( = ?auto_531405 ?auto_531408 ) ) ( not ( = ?auto_531405 ?auto_531410 ) ) ( not ( = ?auto_531405 ?auto_531411 ) ) ( not ( = ?auto_531405 ?auto_531412 ) ) ( not ( = ?auto_531405 ?auto_531413 ) ) ( not ( = ?auto_531406 ?auto_531403 ) ) ( not ( = ?auto_531406 ?auto_531407 ) ) ( not ( = ?auto_531406 ?auto_531409 ) ) ( not ( = ?auto_531406 ?auto_531408 ) ) ( not ( = ?auto_531406 ?auto_531410 ) ) ( not ( = ?auto_531406 ?auto_531411 ) ) ( not ( = ?auto_531406 ?auto_531412 ) ) ( not ( = ?auto_531406 ?auto_531413 ) ) ( not ( = ?auto_531403 ?auto_531407 ) ) ( not ( = ?auto_531403 ?auto_531409 ) ) ( not ( = ?auto_531403 ?auto_531408 ) ) ( not ( = ?auto_531403 ?auto_531410 ) ) ( not ( = ?auto_531403 ?auto_531411 ) ) ( not ( = ?auto_531403 ?auto_531412 ) ) ( not ( = ?auto_531403 ?auto_531413 ) ) ( not ( = ?auto_531407 ?auto_531409 ) ) ( not ( = ?auto_531407 ?auto_531408 ) ) ( not ( = ?auto_531407 ?auto_531410 ) ) ( not ( = ?auto_531407 ?auto_531411 ) ) ( not ( = ?auto_531407 ?auto_531412 ) ) ( not ( = ?auto_531407 ?auto_531413 ) ) ( not ( = ?auto_531409 ?auto_531408 ) ) ( not ( = ?auto_531409 ?auto_531410 ) ) ( not ( = ?auto_531409 ?auto_531411 ) ) ( not ( = ?auto_531409 ?auto_531412 ) ) ( not ( = ?auto_531409 ?auto_531413 ) ) ( not ( = ?auto_531408 ?auto_531410 ) ) ( not ( = ?auto_531408 ?auto_531411 ) ) ( not ( = ?auto_531408 ?auto_531412 ) ) ( not ( = ?auto_531408 ?auto_531413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531410 ?auto_531411 ?auto_531412 )
      ( MAKE-9CRATE-VERIFY ?auto_531404 ?auto_531405 ?auto_531406 ?auto_531403 ?auto_531407 ?auto_531409 ?auto_531408 ?auto_531410 ?auto_531411 ?auto_531412 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531513 - SURFACE
      ?auto_531514 - SURFACE
      ?auto_531515 - SURFACE
      ?auto_531512 - SURFACE
      ?auto_531516 - SURFACE
      ?auto_531518 - SURFACE
      ?auto_531517 - SURFACE
      ?auto_531519 - SURFACE
      ?auto_531520 - SURFACE
      ?auto_531521 - SURFACE
    )
    :vars
    (
      ?auto_531527 - HOIST
      ?auto_531525 - PLACE
      ?auto_531524 - PLACE
      ?auto_531526 - HOIST
      ?auto_531523 - SURFACE
      ?auto_531522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531527 ?auto_531525 ) ( IS-CRATE ?auto_531521 ) ( not ( = ?auto_531520 ?auto_531521 ) ) ( not ( = ?auto_531519 ?auto_531520 ) ) ( not ( = ?auto_531519 ?auto_531521 ) ) ( not ( = ?auto_531524 ?auto_531525 ) ) ( HOIST-AT ?auto_531526 ?auto_531524 ) ( not ( = ?auto_531527 ?auto_531526 ) ) ( AVAILABLE ?auto_531526 ) ( SURFACE-AT ?auto_531521 ?auto_531524 ) ( ON ?auto_531521 ?auto_531523 ) ( CLEAR ?auto_531521 ) ( not ( = ?auto_531520 ?auto_531523 ) ) ( not ( = ?auto_531521 ?auto_531523 ) ) ( not ( = ?auto_531519 ?auto_531523 ) ) ( TRUCK-AT ?auto_531522 ?auto_531525 ) ( SURFACE-AT ?auto_531519 ?auto_531525 ) ( CLEAR ?auto_531519 ) ( LIFTING ?auto_531527 ?auto_531520 ) ( IS-CRATE ?auto_531520 ) ( ON ?auto_531514 ?auto_531513 ) ( ON ?auto_531515 ?auto_531514 ) ( ON ?auto_531512 ?auto_531515 ) ( ON ?auto_531516 ?auto_531512 ) ( ON ?auto_531518 ?auto_531516 ) ( ON ?auto_531517 ?auto_531518 ) ( ON ?auto_531519 ?auto_531517 ) ( not ( = ?auto_531513 ?auto_531514 ) ) ( not ( = ?auto_531513 ?auto_531515 ) ) ( not ( = ?auto_531513 ?auto_531512 ) ) ( not ( = ?auto_531513 ?auto_531516 ) ) ( not ( = ?auto_531513 ?auto_531518 ) ) ( not ( = ?auto_531513 ?auto_531517 ) ) ( not ( = ?auto_531513 ?auto_531519 ) ) ( not ( = ?auto_531513 ?auto_531520 ) ) ( not ( = ?auto_531513 ?auto_531521 ) ) ( not ( = ?auto_531513 ?auto_531523 ) ) ( not ( = ?auto_531514 ?auto_531515 ) ) ( not ( = ?auto_531514 ?auto_531512 ) ) ( not ( = ?auto_531514 ?auto_531516 ) ) ( not ( = ?auto_531514 ?auto_531518 ) ) ( not ( = ?auto_531514 ?auto_531517 ) ) ( not ( = ?auto_531514 ?auto_531519 ) ) ( not ( = ?auto_531514 ?auto_531520 ) ) ( not ( = ?auto_531514 ?auto_531521 ) ) ( not ( = ?auto_531514 ?auto_531523 ) ) ( not ( = ?auto_531515 ?auto_531512 ) ) ( not ( = ?auto_531515 ?auto_531516 ) ) ( not ( = ?auto_531515 ?auto_531518 ) ) ( not ( = ?auto_531515 ?auto_531517 ) ) ( not ( = ?auto_531515 ?auto_531519 ) ) ( not ( = ?auto_531515 ?auto_531520 ) ) ( not ( = ?auto_531515 ?auto_531521 ) ) ( not ( = ?auto_531515 ?auto_531523 ) ) ( not ( = ?auto_531512 ?auto_531516 ) ) ( not ( = ?auto_531512 ?auto_531518 ) ) ( not ( = ?auto_531512 ?auto_531517 ) ) ( not ( = ?auto_531512 ?auto_531519 ) ) ( not ( = ?auto_531512 ?auto_531520 ) ) ( not ( = ?auto_531512 ?auto_531521 ) ) ( not ( = ?auto_531512 ?auto_531523 ) ) ( not ( = ?auto_531516 ?auto_531518 ) ) ( not ( = ?auto_531516 ?auto_531517 ) ) ( not ( = ?auto_531516 ?auto_531519 ) ) ( not ( = ?auto_531516 ?auto_531520 ) ) ( not ( = ?auto_531516 ?auto_531521 ) ) ( not ( = ?auto_531516 ?auto_531523 ) ) ( not ( = ?auto_531518 ?auto_531517 ) ) ( not ( = ?auto_531518 ?auto_531519 ) ) ( not ( = ?auto_531518 ?auto_531520 ) ) ( not ( = ?auto_531518 ?auto_531521 ) ) ( not ( = ?auto_531518 ?auto_531523 ) ) ( not ( = ?auto_531517 ?auto_531519 ) ) ( not ( = ?auto_531517 ?auto_531520 ) ) ( not ( = ?auto_531517 ?auto_531521 ) ) ( not ( = ?auto_531517 ?auto_531523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531519 ?auto_531520 ?auto_531521 )
      ( MAKE-9CRATE-VERIFY ?auto_531513 ?auto_531514 ?auto_531515 ?auto_531512 ?auto_531516 ?auto_531518 ?auto_531517 ?auto_531519 ?auto_531520 ?auto_531521 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531622 - SURFACE
      ?auto_531623 - SURFACE
      ?auto_531624 - SURFACE
      ?auto_531621 - SURFACE
      ?auto_531625 - SURFACE
      ?auto_531627 - SURFACE
      ?auto_531626 - SURFACE
      ?auto_531628 - SURFACE
      ?auto_531629 - SURFACE
      ?auto_531630 - SURFACE
    )
    :vars
    (
      ?auto_531633 - HOIST
      ?auto_531635 - PLACE
      ?auto_531636 - PLACE
      ?auto_531631 - HOIST
      ?auto_531634 - SURFACE
      ?auto_531632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531633 ?auto_531635 ) ( IS-CRATE ?auto_531630 ) ( not ( = ?auto_531629 ?auto_531630 ) ) ( not ( = ?auto_531628 ?auto_531629 ) ) ( not ( = ?auto_531628 ?auto_531630 ) ) ( not ( = ?auto_531636 ?auto_531635 ) ) ( HOIST-AT ?auto_531631 ?auto_531636 ) ( not ( = ?auto_531633 ?auto_531631 ) ) ( AVAILABLE ?auto_531631 ) ( SURFACE-AT ?auto_531630 ?auto_531636 ) ( ON ?auto_531630 ?auto_531634 ) ( CLEAR ?auto_531630 ) ( not ( = ?auto_531629 ?auto_531634 ) ) ( not ( = ?auto_531630 ?auto_531634 ) ) ( not ( = ?auto_531628 ?auto_531634 ) ) ( TRUCK-AT ?auto_531632 ?auto_531635 ) ( SURFACE-AT ?auto_531628 ?auto_531635 ) ( CLEAR ?auto_531628 ) ( IS-CRATE ?auto_531629 ) ( AVAILABLE ?auto_531633 ) ( IN ?auto_531629 ?auto_531632 ) ( ON ?auto_531623 ?auto_531622 ) ( ON ?auto_531624 ?auto_531623 ) ( ON ?auto_531621 ?auto_531624 ) ( ON ?auto_531625 ?auto_531621 ) ( ON ?auto_531627 ?auto_531625 ) ( ON ?auto_531626 ?auto_531627 ) ( ON ?auto_531628 ?auto_531626 ) ( not ( = ?auto_531622 ?auto_531623 ) ) ( not ( = ?auto_531622 ?auto_531624 ) ) ( not ( = ?auto_531622 ?auto_531621 ) ) ( not ( = ?auto_531622 ?auto_531625 ) ) ( not ( = ?auto_531622 ?auto_531627 ) ) ( not ( = ?auto_531622 ?auto_531626 ) ) ( not ( = ?auto_531622 ?auto_531628 ) ) ( not ( = ?auto_531622 ?auto_531629 ) ) ( not ( = ?auto_531622 ?auto_531630 ) ) ( not ( = ?auto_531622 ?auto_531634 ) ) ( not ( = ?auto_531623 ?auto_531624 ) ) ( not ( = ?auto_531623 ?auto_531621 ) ) ( not ( = ?auto_531623 ?auto_531625 ) ) ( not ( = ?auto_531623 ?auto_531627 ) ) ( not ( = ?auto_531623 ?auto_531626 ) ) ( not ( = ?auto_531623 ?auto_531628 ) ) ( not ( = ?auto_531623 ?auto_531629 ) ) ( not ( = ?auto_531623 ?auto_531630 ) ) ( not ( = ?auto_531623 ?auto_531634 ) ) ( not ( = ?auto_531624 ?auto_531621 ) ) ( not ( = ?auto_531624 ?auto_531625 ) ) ( not ( = ?auto_531624 ?auto_531627 ) ) ( not ( = ?auto_531624 ?auto_531626 ) ) ( not ( = ?auto_531624 ?auto_531628 ) ) ( not ( = ?auto_531624 ?auto_531629 ) ) ( not ( = ?auto_531624 ?auto_531630 ) ) ( not ( = ?auto_531624 ?auto_531634 ) ) ( not ( = ?auto_531621 ?auto_531625 ) ) ( not ( = ?auto_531621 ?auto_531627 ) ) ( not ( = ?auto_531621 ?auto_531626 ) ) ( not ( = ?auto_531621 ?auto_531628 ) ) ( not ( = ?auto_531621 ?auto_531629 ) ) ( not ( = ?auto_531621 ?auto_531630 ) ) ( not ( = ?auto_531621 ?auto_531634 ) ) ( not ( = ?auto_531625 ?auto_531627 ) ) ( not ( = ?auto_531625 ?auto_531626 ) ) ( not ( = ?auto_531625 ?auto_531628 ) ) ( not ( = ?auto_531625 ?auto_531629 ) ) ( not ( = ?auto_531625 ?auto_531630 ) ) ( not ( = ?auto_531625 ?auto_531634 ) ) ( not ( = ?auto_531627 ?auto_531626 ) ) ( not ( = ?auto_531627 ?auto_531628 ) ) ( not ( = ?auto_531627 ?auto_531629 ) ) ( not ( = ?auto_531627 ?auto_531630 ) ) ( not ( = ?auto_531627 ?auto_531634 ) ) ( not ( = ?auto_531626 ?auto_531628 ) ) ( not ( = ?auto_531626 ?auto_531629 ) ) ( not ( = ?auto_531626 ?auto_531630 ) ) ( not ( = ?auto_531626 ?auto_531634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531628 ?auto_531629 ?auto_531630 )
      ( MAKE-9CRATE-VERIFY ?auto_531622 ?auto_531623 ?auto_531624 ?auto_531621 ?auto_531625 ?auto_531627 ?auto_531626 ?auto_531628 ?auto_531629 ?auto_531630 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537187 - SURFACE
      ?auto_537188 - SURFACE
      ?auto_537189 - SURFACE
      ?auto_537186 - SURFACE
      ?auto_537190 - SURFACE
      ?auto_537192 - SURFACE
      ?auto_537191 - SURFACE
      ?auto_537193 - SURFACE
      ?auto_537194 - SURFACE
      ?auto_537195 - SURFACE
      ?auto_537196 - SURFACE
    )
    :vars
    (
      ?auto_537198 - HOIST
      ?auto_537197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537198 ?auto_537197 ) ( SURFACE-AT ?auto_537195 ?auto_537197 ) ( CLEAR ?auto_537195 ) ( LIFTING ?auto_537198 ?auto_537196 ) ( IS-CRATE ?auto_537196 ) ( not ( = ?auto_537195 ?auto_537196 ) ) ( ON ?auto_537188 ?auto_537187 ) ( ON ?auto_537189 ?auto_537188 ) ( ON ?auto_537186 ?auto_537189 ) ( ON ?auto_537190 ?auto_537186 ) ( ON ?auto_537192 ?auto_537190 ) ( ON ?auto_537191 ?auto_537192 ) ( ON ?auto_537193 ?auto_537191 ) ( ON ?auto_537194 ?auto_537193 ) ( ON ?auto_537195 ?auto_537194 ) ( not ( = ?auto_537187 ?auto_537188 ) ) ( not ( = ?auto_537187 ?auto_537189 ) ) ( not ( = ?auto_537187 ?auto_537186 ) ) ( not ( = ?auto_537187 ?auto_537190 ) ) ( not ( = ?auto_537187 ?auto_537192 ) ) ( not ( = ?auto_537187 ?auto_537191 ) ) ( not ( = ?auto_537187 ?auto_537193 ) ) ( not ( = ?auto_537187 ?auto_537194 ) ) ( not ( = ?auto_537187 ?auto_537195 ) ) ( not ( = ?auto_537187 ?auto_537196 ) ) ( not ( = ?auto_537188 ?auto_537189 ) ) ( not ( = ?auto_537188 ?auto_537186 ) ) ( not ( = ?auto_537188 ?auto_537190 ) ) ( not ( = ?auto_537188 ?auto_537192 ) ) ( not ( = ?auto_537188 ?auto_537191 ) ) ( not ( = ?auto_537188 ?auto_537193 ) ) ( not ( = ?auto_537188 ?auto_537194 ) ) ( not ( = ?auto_537188 ?auto_537195 ) ) ( not ( = ?auto_537188 ?auto_537196 ) ) ( not ( = ?auto_537189 ?auto_537186 ) ) ( not ( = ?auto_537189 ?auto_537190 ) ) ( not ( = ?auto_537189 ?auto_537192 ) ) ( not ( = ?auto_537189 ?auto_537191 ) ) ( not ( = ?auto_537189 ?auto_537193 ) ) ( not ( = ?auto_537189 ?auto_537194 ) ) ( not ( = ?auto_537189 ?auto_537195 ) ) ( not ( = ?auto_537189 ?auto_537196 ) ) ( not ( = ?auto_537186 ?auto_537190 ) ) ( not ( = ?auto_537186 ?auto_537192 ) ) ( not ( = ?auto_537186 ?auto_537191 ) ) ( not ( = ?auto_537186 ?auto_537193 ) ) ( not ( = ?auto_537186 ?auto_537194 ) ) ( not ( = ?auto_537186 ?auto_537195 ) ) ( not ( = ?auto_537186 ?auto_537196 ) ) ( not ( = ?auto_537190 ?auto_537192 ) ) ( not ( = ?auto_537190 ?auto_537191 ) ) ( not ( = ?auto_537190 ?auto_537193 ) ) ( not ( = ?auto_537190 ?auto_537194 ) ) ( not ( = ?auto_537190 ?auto_537195 ) ) ( not ( = ?auto_537190 ?auto_537196 ) ) ( not ( = ?auto_537192 ?auto_537191 ) ) ( not ( = ?auto_537192 ?auto_537193 ) ) ( not ( = ?auto_537192 ?auto_537194 ) ) ( not ( = ?auto_537192 ?auto_537195 ) ) ( not ( = ?auto_537192 ?auto_537196 ) ) ( not ( = ?auto_537191 ?auto_537193 ) ) ( not ( = ?auto_537191 ?auto_537194 ) ) ( not ( = ?auto_537191 ?auto_537195 ) ) ( not ( = ?auto_537191 ?auto_537196 ) ) ( not ( = ?auto_537193 ?auto_537194 ) ) ( not ( = ?auto_537193 ?auto_537195 ) ) ( not ( = ?auto_537193 ?auto_537196 ) ) ( not ( = ?auto_537194 ?auto_537195 ) ) ( not ( = ?auto_537194 ?auto_537196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_537195 ?auto_537196 )
      ( MAKE-10CRATE-VERIFY ?auto_537187 ?auto_537188 ?auto_537189 ?auto_537186 ?auto_537190 ?auto_537192 ?auto_537191 ?auto_537193 ?auto_537194 ?auto_537195 ?auto_537196 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537281 - SURFACE
      ?auto_537282 - SURFACE
      ?auto_537283 - SURFACE
      ?auto_537280 - SURFACE
      ?auto_537284 - SURFACE
      ?auto_537286 - SURFACE
      ?auto_537285 - SURFACE
      ?auto_537287 - SURFACE
      ?auto_537288 - SURFACE
      ?auto_537289 - SURFACE
      ?auto_537290 - SURFACE
    )
    :vars
    (
      ?auto_537291 - HOIST
      ?auto_537293 - PLACE
      ?auto_537292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537291 ?auto_537293 ) ( SURFACE-AT ?auto_537289 ?auto_537293 ) ( CLEAR ?auto_537289 ) ( IS-CRATE ?auto_537290 ) ( not ( = ?auto_537289 ?auto_537290 ) ) ( TRUCK-AT ?auto_537292 ?auto_537293 ) ( AVAILABLE ?auto_537291 ) ( IN ?auto_537290 ?auto_537292 ) ( ON ?auto_537289 ?auto_537288 ) ( not ( = ?auto_537288 ?auto_537289 ) ) ( not ( = ?auto_537288 ?auto_537290 ) ) ( ON ?auto_537282 ?auto_537281 ) ( ON ?auto_537283 ?auto_537282 ) ( ON ?auto_537280 ?auto_537283 ) ( ON ?auto_537284 ?auto_537280 ) ( ON ?auto_537286 ?auto_537284 ) ( ON ?auto_537285 ?auto_537286 ) ( ON ?auto_537287 ?auto_537285 ) ( ON ?auto_537288 ?auto_537287 ) ( not ( = ?auto_537281 ?auto_537282 ) ) ( not ( = ?auto_537281 ?auto_537283 ) ) ( not ( = ?auto_537281 ?auto_537280 ) ) ( not ( = ?auto_537281 ?auto_537284 ) ) ( not ( = ?auto_537281 ?auto_537286 ) ) ( not ( = ?auto_537281 ?auto_537285 ) ) ( not ( = ?auto_537281 ?auto_537287 ) ) ( not ( = ?auto_537281 ?auto_537288 ) ) ( not ( = ?auto_537281 ?auto_537289 ) ) ( not ( = ?auto_537281 ?auto_537290 ) ) ( not ( = ?auto_537282 ?auto_537283 ) ) ( not ( = ?auto_537282 ?auto_537280 ) ) ( not ( = ?auto_537282 ?auto_537284 ) ) ( not ( = ?auto_537282 ?auto_537286 ) ) ( not ( = ?auto_537282 ?auto_537285 ) ) ( not ( = ?auto_537282 ?auto_537287 ) ) ( not ( = ?auto_537282 ?auto_537288 ) ) ( not ( = ?auto_537282 ?auto_537289 ) ) ( not ( = ?auto_537282 ?auto_537290 ) ) ( not ( = ?auto_537283 ?auto_537280 ) ) ( not ( = ?auto_537283 ?auto_537284 ) ) ( not ( = ?auto_537283 ?auto_537286 ) ) ( not ( = ?auto_537283 ?auto_537285 ) ) ( not ( = ?auto_537283 ?auto_537287 ) ) ( not ( = ?auto_537283 ?auto_537288 ) ) ( not ( = ?auto_537283 ?auto_537289 ) ) ( not ( = ?auto_537283 ?auto_537290 ) ) ( not ( = ?auto_537280 ?auto_537284 ) ) ( not ( = ?auto_537280 ?auto_537286 ) ) ( not ( = ?auto_537280 ?auto_537285 ) ) ( not ( = ?auto_537280 ?auto_537287 ) ) ( not ( = ?auto_537280 ?auto_537288 ) ) ( not ( = ?auto_537280 ?auto_537289 ) ) ( not ( = ?auto_537280 ?auto_537290 ) ) ( not ( = ?auto_537284 ?auto_537286 ) ) ( not ( = ?auto_537284 ?auto_537285 ) ) ( not ( = ?auto_537284 ?auto_537287 ) ) ( not ( = ?auto_537284 ?auto_537288 ) ) ( not ( = ?auto_537284 ?auto_537289 ) ) ( not ( = ?auto_537284 ?auto_537290 ) ) ( not ( = ?auto_537286 ?auto_537285 ) ) ( not ( = ?auto_537286 ?auto_537287 ) ) ( not ( = ?auto_537286 ?auto_537288 ) ) ( not ( = ?auto_537286 ?auto_537289 ) ) ( not ( = ?auto_537286 ?auto_537290 ) ) ( not ( = ?auto_537285 ?auto_537287 ) ) ( not ( = ?auto_537285 ?auto_537288 ) ) ( not ( = ?auto_537285 ?auto_537289 ) ) ( not ( = ?auto_537285 ?auto_537290 ) ) ( not ( = ?auto_537287 ?auto_537288 ) ) ( not ( = ?auto_537287 ?auto_537289 ) ) ( not ( = ?auto_537287 ?auto_537290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537288 ?auto_537289 ?auto_537290 )
      ( MAKE-10CRATE-VERIFY ?auto_537281 ?auto_537282 ?auto_537283 ?auto_537280 ?auto_537284 ?auto_537286 ?auto_537285 ?auto_537287 ?auto_537288 ?auto_537289 ?auto_537290 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537386 - SURFACE
      ?auto_537387 - SURFACE
      ?auto_537388 - SURFACE
      ?auto_537385 - SURFACE
      ?auto_537389 - SURFACE
      ?auto_537391 - SURFACE
      ?auto_537390 - SURFACE
      ?auto_537392 - SURFACE
      ?auto_537393 - SURFACE
      ?auto_537394 - SURFACE
      ?auto_537395 - SURFACE
    )
    :vars
    (
      ?auto_537396 - HOIST
      ?auto_537399 - PLACE
      ?auto_537398 - TRUCK
      ?auto_537397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537396 ?auto_537399 ) ( SURFACE-AT ?auto_537394 ?auto_537399 ) ( CLEAR ?auto_537394 ) ( IS-CRATE ?auto_537395 ) ( not ( = ?auto_537394 ?auto_537395 ) ) ( AVAILABLE ?auto_537396 ) ( IN ?auto_537395 ?auto_537398 ) ( ON ?auto_537394 ?auto_537393 ) ( not ( = ?auto_537393 ?auto_537394 ) ) ( not ( = ?auto_537393 ?auto_537395 ) ) ( TRUCK-AT ?auto_537398 ?auto_537397 ) ( not ( = ?auto_537397 ?auto_537399 ) ) ( ON ?auto_537387 ?auto_537386 ) ( ON ?auto_537388 ?auto_537387 ) ( ON ?auto_537385 ?auto_537388 ) ( ON ?auto_537389 ?auto_537385 ) ( ON ?auto_537391 ?auto_537389 ) ( ON ?auto_537390 ?auto_537391 ) ( ON ?auto_537392 ?auto_537390 ) ( ON ?auto_537393 ?auto_537392 ) ( not ( = ?auto_537386 ?auto_537387 ) ) ( not ( = ?auto_537386 ?auto_537388 ) ) ( not ( = ?auto_537386 ?auto_537385 ) ) ( not ( = ?auto_537386 ?auto_537389 ) ) ( not ( = ?auto_537386 ?auto_537391 ) ) ( not ( = ?auto_537386 ?auto_537390 ) ) ( not ( = ?auto_537386 ?auto_537392 ) ) ( not ( = ?auto_537386 ?auto_537393 ) ) ( not ( = ?auto_537386 ?auto_537394 ) ) ( not ( = ?auto_537386 ?auto_537395 ) ) ( not ( = ?auto_537387 ?auto_537388 ) ) ( not ( = ?auto_537387 ?auto_537385 ) ) ( not ( = ?auto_537387 ?auto_537389 ) ) ( not ( = ?auto_537387 ?auto_537391 ) ) ( not ( = ?auto_537387 ?auto_537390 ) ) ( not ( = ?auto_537387 ?auto_537392 ) ) ( not ( = ?auto_537387 ?auto_537393 ) ) ( not ( = ?auto_537387 ?auto_537394 ) ) ( not ( = ?auto_537387 ?auto_537395 ) ) ( not ( = ?auto_537388 ?auto_537385 ) ) ( not ( = ?auto_537388 ?auto_537389 ) ) ( not ( = ?auto_537388 ?auto_537391 ) ) ( not ( = ?auto_537388 ?auto_537390 ) ) ( not ( = ?auto_537388 ?auto_537392 ) ) ( not ( = ?auto_537388 ?auto_537393 ) ) ( not ( = ?auto_537388 ?auto_537394 ) ) ( not ( = ?auto_537388 ?auto_537395 ) ) ( not ( = ?auto_537385 ?auto_537389 ) ) ( not ( = ?auto_537385 ?auto_537391 ) ) ( not ( = ?auto_537385 ?auto_537390 ) ) ( not ( = ?auto_537385 ?auto_537392 ) ) ( not ( = ?auto_537385 ?auto_537393 ) ) ( not ( = ?auto_537385 ?auto_537394 ) ) ( not ( = ?auto_537385 ?auto_537395 ) ) ( not ( = ?auto_537389 ?auto_537391 ) ) ( not ( = ?auto_537389 ?auto_537390 ) ) ( not ( = ?auto_537389 ?auto_537392 ) ) ( not ( = ?auto_537389 ?auto_537393 ) ) ( not ( = ?auto_537389 ?auto_537394 ) ) ( not ( = ?auto_537389 ?auto_537395 ) ) ( not ( = ?auto_537391 ?auto_537390 ) ) ( not ( = ?auto_537391 ?auto_537392 ) ) ( not ( = ?auto_537391 ?auto_537393 ) ) ( not ( = ?auto_537391 ?auto_537394 ) ) ( not ( = ?auto_537391 ?auto_537395 ) ) ( not ( = ?auto_537390 ?auto_537392 ) ) ( not ( = ?auto_537390 ?auto_537393 ) ) ( not ( = ?auto_537390 ?auto_537394 ) ) ( not ( = ?auto_537390 ?auto_537395 ) ) ( not ( = ?auto_537392 ?auto_537393 ) ) ( not ( = ?auto_537392 ?auto_537394 ) ) ( not ( = ?auto_537392 ?auto_537395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537393 ?auto_537394 ?auto_537395 )
      ( MAKE-10CRATE-VERIFY ?auto_537386 ?auto_537387 ?auto_537388 ?auto_537385 ?auto_537389 ?auto_537391 ?auto_537390 ?auto_537392 ?auto_537393 ?auto_537394 ?auto_537395 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537501 - SURFACE
      ?auto_537502 - SURFACE
      ?auto_537503 - SURFACE
      ?auto_537500 - SURFACE
      ?auto_537504 - SURFACE
      ?auto_537506 - SURFACE
      ?auto_537505 - SURFACE
      ?auto_537507 - SURFACE
      ?auto_537508 - SURFACE
      ?auto_537509 - SURFACE
      ?auto_537510 - SURFACE
    )
    :vars
    (
      ?auto_537512 - HOIST
      ?auto_537514 - PLACE
      ?auto_537513 - TRUCK
      ?auto_537515 - PLACE
      ?auto_537511 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_537512 ?auto_537514 ) ( SURFACE-AT ?auto_537509 ?auto_537514 ) ( CLEAR ?auto_537509 ) ( IS-CRATE ?auto_537510 ) ( not ( = ?auto_537509 ?auto_537510 ) ) ( AVAILABLE ?auto_537512 ) ( ON ?auto_537509 ?auto_537508 ) ( not ( = ?auto_537508 ?auto_537509 ) ) ( not ( = ?auto_537508 ?auto_537510 ) ) ( TRUCK-AT ?auto_537513 ?auto_537515 ) ( not ( = ?auto_537515 ?auto_537514 ) ) ( HOIST-AT ?auto_537511 ?auto_537515 ) ( LIFTING ?auto_537511 ?auto_537510 ) ( not ( = ?auto_537512 ?auto_537511 ) ) ( ON ?auto_537502 ?auto_537501 ) ( ON ?auto_537503 ?auto_537502 ) ( ON ?auto_537500 ?auto_537503 ) ( ON ?auto_537504 ?auto_537500 ) ( ON ?auto_537506 ?auto_537504 ) ( ON ?auto_537505 ?auto_537506 ) ( ON ?auto_537507 ?auto_537505 ) ( ON ?auto_537508 ?auto_537507 ) ( not ( = ?auto_537501 ?auto_537502 ) ) ( not ( = ?auto_537501 ?auto_537503 ) ) ( not ( = ?auto_537501 ?auto_537500 ) ) ( not ( = ?auto_537501 ?auto_537504 ) ) ( not ( = ?auto_537501 ?auto_537506 ) ) ( not ( = ?auto_537501 ?auto_537505 ) ) ( not ( = ?auto_537501 ?auto_537507 ) ) ( not ( = ?auto_537501 ?auto_537508 ) ) ( not ( = ?auto_537501 ?auto_537509 ) ) ( not ( = ?auto_537501 ?auto_537510 ) ) ( not ( = ?auto_537502 ?auto_537503 ) ) ( not ( = ?auto_537502 ?auto_537500 ) ) ( not ( = ?auto_537502 ?auto_537504 ) ) ( not ( = ?auto_537502 ?auto_537506 ) ) ( not ( = ?auto_537502 ?auto_537505 ) ) ( not ( = ?auto_537502 ?auto_537507 ) ) ( not ( = ?auto_537502 ?auto_537508 ) ) ( not ( = ?auto_537502 ?auto_537509 ) ) ( not ( = ?auto_537502 ?auto_537510 ) ) ( not ( = ?auto_537503 ?auto_537500 ) ) ( not ( = ?auto_537503 ?auto_537504 ) ) ( not ( = ?auto_537503 ?auto_537506 ) ) ( not ( = ?auto_537503 ?auto_537505 ) ) ( not ( = ?auto_537503 ?auto_537507 ) ) ( not ( = ?auto_537503 ?auto_537508 ) ) ( not ( = ?auto_537503 ?auto_537509 ) ) ( not ( = ?auto_537503 ?auto_537510 ) ) ( not ( = ?auto_537500 ?auto_537504 ) ) ( not ( = ?auto_537500 ?auto_537506 ) ) ( not ( = ?auto_537500 ?auto_537505 ) ) ( not ( = ?auto_537500 ?auto_537507 ) ) ( not ( = ?auto_537500 ?auto_537508 ) ) ( not ( = ?auto_537500 ?auto_537509 ) ) ( not ( = ?auto_537500 ?auto_537510 ) ) ( not ( = ?auto_537504 ?auto_537506 ) ) ( not ( = ?auto_537504 ?auto_537505 ) ) ( not ( = ?auto_537504 ?auto_537507 ) ) ( not ( = ?auto_537504 ?auto_537508 ) ) ( not ( = ?auto_537504 ?auto_537509 ) ) ( not ( = ?auto_537504 ?auto_537510 ) ) ( not ( = ?auto_537506 ?auto_537505 ) ) ( not ( = ?auto_537506 ?auto_537507 ) ) ( not ( = ?auto_537506 ?auto_537508 ) ) ( not ( = ?auto_537506 ?auto_537509 ) ) ( not ( = ?auto_537506 ?auto_537510 ) ) ( not ( = ?auto_537505 ?auto_537507 ) ) ( not ( = ?auto_537505 ?auto_537508 ) ) ( not ( = ?auto_537505 ?auto_537509 ) ) ( not ( = ?auto_537505 ?auto_537510 ) ) ( not ( = ?auto_537507 ?auto_537508 ) ) ( not ( = ?auto_537507 ?auto_537509 ) ) ( not ( = ?auto_537507 ?auto_537510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537508 ?auto_537509 ?auto_537510 )
      ( MAKE-10CRATE-VERIFY ?auto_537501 ?auto_537502 ?auto_537503 ?auto_537500 ?auto_537504 ?auto_537506 ?auto_537505 ?auto_537507 ?auto_537508 ?auto_537509 ?auto_537510 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537626 - SURFACE
      ?auto_537627 - SURFACE
      ?auto_537628 - SURFACE
      ?auto_537625 - SURFACE
      ?auto_537629 - SURFACE
      ?auto_537631 - SURFACE
      ?auto_537630 - SURFACE
      ?auto_537632 - SURFACE
      ?auto_537633 - SURFACE
      ?auto_537634 - SURFACE
      ?auto_537635 - SURFACE
    )
    :vars
    (
      ?auto_537636 - HOIST
      ?auto_537637 - PLACE
      ?auto_537639 - TRUCK
      ?auto_537641 - PLACE
      ?auto_537638 - HOIST
      ?auto_537640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537636 ?auto_537637 ) ( SURFACE-AT ?auto_537634 ?auto_537637 ) ( CLEAR ?auto_537634 ) ( IS-CRATE ?auto_537635 ) ( not ( = ?auto_537634 ?auto_537635 ) ) ( AVAILABLE ?auto_537636 ) ( ON ?auto_537634 ?auto_537633 ) ( not ( = ?auto_537633 ?auto_537634 ) ) ( not ( = ?auto_537633 ?auto_537635 ) ) ( TRUCK-AT ?auto_537639 ?auto_537641 ) ( not ( = ?auto_537641 ?auto_537637 ) ) ( HOIST-AT ?auto_537638 ?auto_537641 ) ( not ( = ?auto_537636 ?auto_537638 ) ) ( AVAILABLE ?auto_537638 ) ( SURFACE-AT ?auto_537635 ?auto_537641 ) ( ON ?auto_537635 ?auto_537640 ) ( CLEAR ?auto_537635 ) ( not ( = ?auto_537634 ?auto_537640 ) ) ( not ( = ?auto_537635 ?auto_537640 ) ) ( not ( = ?auto_537633 ?auto_537640 ) ) ( ON ?auto_537627 ?auto_537626 ) ( ON ?auto_537628 ?auto_537627 ) ( ON ?auto_537625 ?auto_537628 ) ( ON ?auto_537629 ?auto_537625 ) ( ON ?auto_537631 ?auto_537629 ) ( ON ?auto_537630 ?auto_537631 ) ( ON ?auto_537632 ?auto_537630 ) ( ON ?auto_537633 ?auto_537632 ) ( not ( = ?auto_537626 ?auto_537627 ) ) ( not ( = ?auto_537626 ?auto_537628 ) ) ( not ( = ?auto_537626 ?auto_537625 ) ) ( not ( = ?auto_537626 ?auto_537629 ) ) ( not ( = ?auto_537626 ?auto_537631 ) ) ( not ( = ?auto_537626 ?auto_537630 ) ) ( not ( = ?auto_537626 ?auto_537632 ) ) ( not ( = ?auto_537626 ?auto_537633 ) ) ( not ( = ?auto_537626 ?auto_537634 ) ) ( not ( = ?auto_537626 ?auto_537635 ) ) ( not ( = ?auto_537626 ?auto_537640 ) ) ( not ( = ?auto_537627 ?auto_537628 ) ) ( not ( = ?auto_537627 ?auto_537625 ) ) ( not ( = ?auto_537627 ?auto_537629 ) ) ( not ( = ?auto_537627 ?auto_537631 ) ) ( not ( = ?auto_537627 ?auto_537630 ) ) ( not ( = ?auto_537627 ?auto_537632 ) ) ( not ( = ?auto_537627 ?auto_537633 ) ) ( not ( = ?auto_537627 ?auto_537634 ) ) ( not ( = ?auto_537627 ?auto_537635 ) ) ( not ( = ?auto_537627 ?auto_537640 ) ) ( not ( = ?auto_537628 ?auto_537625 ) ) ( not ( = ?auto_537628 ?auto_537629 ) ) ( not ( = ?auto_537628 ?auto_537631 ) ) ( not ( = ?auto_537628 ?auto_537630 ) ) ( not ( = ?auto_537628 ?auto_537632 ) ) ( not ( = ?auto_537628 ?auto_537633 ) ) ( not ( = ?auto_537628 ?auto_537634 ) ) ( not ( = ?auto_537628 ?auto_537635 ) ) ( not ( = ?auto_537628 ?auto_537640 ) ) ( not ( = ?auto_537625 ?auto_537629 ) ) ( not ( = ?auto_537625 ?auto_537631 ) ) ( not ( = ?auto_537625 ?auto_537630 ) ) ( not ( = ?auto_537625 ?auto_537632 ) ) ( not ( = ?auto_537625 ?auto_537633 ) ) ( not ( = ?auto_537625 ?auto_537634 ) ) ( not ( = ?auto_537625 ?auto_537635 ) ) ( not ( = ?auto_537625 ?auto_537640 ) ) ( not ( = ?auto_537629 ?auto_537631 ) ) ( not ( = ?auto_537629 ?auto_537630 ) ) ( not ( = ?auto_537629 ?auto_537632 ) ) ( not ( = ?auto_537629 ?auto_537633 ) ) ( not ( = ?auto_537629 ?auto_537634 ) ) ( not ( = ?auto_537629 ?auto_537635 ) ) ( not ( = ?auto_537629 ?auto_537640 ) ) ( not ( = ?auto_537631 ?auto_537630 ) ) ( not ( = ?auto_537631 ?auto_537632 ) ) ( not ( = ?auto_537631 ?auto_537633 ) ) ( not ( = ?auto_537631 ?auto_537634 ) ) ( not ( = ?auto_537631 ?auto_537635 ) ) ( not ( = ?auto_537631 ?auto_537640 ) ) ( not ( = ?auto_537630 ?auto_537632 ) ) ( not ( = ?auto_537630 ?auto_537633 ) ) ( not ( = ?auto_537630 ?auto_537634 ) ) ( not ( = ?auto_537630 ?auto_537635 ) ) ( not ( = ?auto_537630 ?auto_537640 ) ) ( not ( = ?auto_537632 ?auto_537633 ) ) ( not ( = ?auto_537632 ?auto_537634 ) ) ( not ( = ?auto_537632 ?auto_537635 ) ) ( not ( = ?auto_537632 ?auto_537640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537633 ?auto_537634 ?auto_537635 )
      ( MAKE-10CRATE-VERIFY ?auto_537626 ?auto_537627 ?auto_537628 ?auto_537625 ?auto_537629 ?auto_537631 ?auto_537630 ?auto_537632 ?auto_537633 ?auto_537634 ?auto_537635 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537752 - SURFACE
      ?auto_537753 - SURFACE
      ?auto_537754 - SURFACE
      ?auto_537751 - SURFACE
      ?auto_537755 - SURFACE
      ?auto_537757 - SURFACE
      ?auto_537756 - SURFACE
      ?auto_537758 - SURFACE
      ?auto_537759 - SURFACE
      ?auto_537760 - SURFACE
      ?auto_537761 - SURFACE
    )
    :vars
    (
      ?auto_537765 - HOIST
      ?auto_537764 - PLACE
      ?auto_537767 - PLACE
      ?auto_537763 - HOIST
      ?auto_537762 - SURFACE
      ?auto_537766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537765 ?auto_537764 ) ( SURFACE-AT ?auto_537760 ?auto_537764 ) ( CLEAR ?auto_537760 ) ( IS-CRATE ?auto_537761 ) ( not ( = ?auto_537760 ?auto_537761 ) ) ( AVAILABLE ?auto_537765 ) ( ON ?auto_537760 ?auto_537759 ) ( not ( = ?auto_537759 ?auto_537760 ) ) ( not ( = ?auto_537759 ?auto_537761 ) ) ( not ( = ?auto_537767 ?auto_537764 ) ) ( HOIST-AT ?auto_537763 ?auto_537767 ) ( not ( = ?auto_537765 ?auto_537763 ) ) ( AVAILABLE ?auto_537763 ) ( SURFACE-AT ?auto_537761 ?auto_537767 ) ( ON ?auto_537761 ?auto_537762 ) ( CLEAR ?auto_537761 ) ( not ( = ?auto_537760 ?auto_537762 ) ) ( not ( = ?auto_537761 ?auto_537762 ) ) ( not ( = ?auto_537759 ?auto_537762 ) ) ( TRUCK-AT ?auto_537766 ?auto_537764 ) ( ON ?auto_537753 ?auto_537752 ) ( ON ?auto_537754 ?auto_537753 ) ( ON ?auto_537751 ?auto_537754 ) ( ON ?auto_537755 ?auto_537751 ) ( ON ?auto_537757 ?auto_537755 ) ( ON ?auto_537756 ?auto_537757 ) ( ON ?auto_537758 ?auto_537756 ) ( ON ?auto_537759 ?auto_537758 ) ( not ( = ?auto_537752 ?auto_537753 ) ) ( not ( = ?auto_537752 ?auto_537754 ) ) ( not ( = ?auto_537752 ?auto_537751 ) ) ( not ( = ?auto_537752 ?auto_537755 ) ) ( not ( = ?auto_537752 ?auto_537757 ) ) ( not ( = ?auto_537752 ?auto_537756 ) ) ( not ( = ?auto_537752 ?auto_537758 ) ) ( not ( = ?auto_537752 ?auto_537759 ) ) ( not ( = ?auto_537752 ?auto_537760 ) ) ( not ( = ?auto_537752 ?auto_537761 ) ) ( not ( = ?auto_537752 ?auto_537762 ) ) ( not ( = ?auto_537753 ?auto_537754 ) ) ( not ( = ?auto_537753 ?auto_537751 ) ) ( not ( = ?auto_537753 ?auto_537755 ) ) ( not ( = ?auto_537753 ?auto_537757 ) ) ( not ( = ?auto_537753 ?auto_537756 ) ) ( not ( = ?auto_537753 ?auto_537758 ) ) ( not ( = ?auto_537753 ?auto_537759 ) ) ( not ( = ?auto_537753 ?auto_537760 ) ) ( not ( = ?auto_537753 ?auto_537761 ) ) ( not ( = ?auto_537753 ?auto_537762 ) ) ( not ( = ?auto_537754 ?auto_537751 ) ) ( not ( = ?auto_537754 ?auto_537755 ) ) ( not ( = ?auto_537754 ?auto_537757 ) ) ( not ( = ?auto_537754 ?auto_537756 ) ) ( not ( = ?auto_537754 ?auto_537758 ) ) ( not ( = ?auto_537754 ?auto_537759 ) ) ( not ( = ?auto_537754 ?auto_537760 ) ) ( not ( = ?auto_537754 ?auto_537761 ) ) ( not ( = ?auto_537754 ?auto_537762 ) ) ( not ( = ?auto_537751 ?auto_537755 ) ) ( not ( = ?auto_537751 ?auto_537757 ) ) ( not ( = ?auto_537751 ?auto_537756 ) ) ( not ( = ?auto_537751 ?auto_537758 ) ) ( not ( = ?auto_537751 ?auto_537759 ) ) ( not ( = ?auto_537751 ?auto_537760 ) ) ( not ( = ?auto_537751 ?auto_537761 ) ) ( not ( = ?auto_537751 ?auto_537762 ) ) ( not ( = ?auto_537755 ?auto_537757 ) ) ( not ( = ?auto_537755 ?auto_537756 ) ) ( not ( = ?auto_537755 ?auto_537758 ) ) ( not ( = ?auto_537755 ?auto_537759 ) ) ( not ( = ?auto_537755 ?auto_537760 ) ) ( not ( = ?auto_537755 ?auto_537761 ) ) ( not ( = ?auto_537755 ?auto_537762 ) ) ( not ( = ?auto_537757 ?auto_537756 ) ) ( not ( = ?auto_537757 ?auto_537758 ) ) ( not ( = ?auto_537757 ?auto_537759 ) ) ( not ( = ?auto_537757 ?auto_537760 ) ) ( not ( = ?auto_537757 ?auto_537761 ) ) ( not ( = ?auto_537757 ?auto_537762 ) ) ( not ( = ?auto_537756 ?auto_537758 ) ) ( not ( = ?auto_537756 ?auto_537759 ) ) ( not ( = ?auto_537756 ?auto_537760 ) ) ( not ( = ?auto_537756 ?auto_537761 ) ) ( not ( = ?auto_537756 ?auto_537762 ) ) ( not ( = ?auto_537758 ?auto_537759 ) ) ( not ( = ?auto_537758 ?auto_537760 ) ) ( not ( = ?auto_537758 ?auto_537761 ) ) ( not ( = ?auto_537758 ?auto_537762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537759 ?auto_537760 ?auto_537761 )
      ( MAKE-10CRATE-VERIFY ?auto_537752 ?auto_537753 ?auto_537754 ?auto_537751 ?auto_537755 ?auto_537757 ?auto_537756 ?auto_537758 ?auto_537759 ?auto_537760 ?auto_537761 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537878 - SURFACE
      ?auto_537879 - SURFACE
      ?auto_537880 - SURFACE
      ?auto_537877 - SURFACE
      ?auto_537881 - SURFACE
      ?auto_537883 - SURFACE
      ?auto_537882 - SURFACE
      ?auto_537884 - SURFACE
      ?auto_537885 - SURFACE
      ?auto_537886 - SURFACE
      ?auto_537887 - SURFACE
    )
    :vars
    (
      ?auto_537891 - HOIST
      ?auto_537893 - PLACE
      ?auto_537889 - PLACE
      ?auto_537888 - HOIST
      ?auto_537890 - SURFACE
      ?auto_537892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537891 ?auto_537893 ) ( IS-CRATE ?auto_537887 ) ( not ( = ?auto_537886 ?auto_537887 ) ) ( not ( = ?auto_537885 ?auto_537886 ) ) ( not ( = ?auto_537885 ?auto_537887 ) ) ( not ( = ?auto_537889 ?auto_537893 ) ) ( HOIST-AT ?auto_537888 ?auto_537889 ) ( not ( = ?auto_537891 ?auto_537888 ) ) ( AVAILABLE ?auto_537888 ) ( SURFACE-AT ?auto_537887 ?auto_537889 ) ( ON ?auto_537887 ?auto_537890 ) ( CLEAR ?auto_537887 ) ( not ( = ?auto_537886 ?auto_537890 ) ) ( not ( = ?auto_537887 ?auto_537890 ) ) ( not ( = ?auto_537885 ?auto_537890 ) ) ( TRUCK-AT ?auto_537892 ?auto_537893 ) ( SURFACE-AT ?auto_537885 ?auto_537893 ) ( CLEAR ?auto_537885 ) ( LIFTING ?auto_537891 ?auto_537886 ) ( IS-CRATE ?auto_537886 ) ( ON ?auto_537879 ?auto_537878 ) ( ON ?auto_537880 ?auto_537879 ) ( ON ?auto_537877 ?auto_537880 ) ( ON ?auto_537881 ?auto_537877 ) ( ON ?auto_537883 ?auto_537881 ) ( ON ?auto_537882 ?auto_537883 ) ( ON ?auto_537884 ?auto_537882 ) ( ON ?auto_537885 ?auto_537884 ) ( not ( = ?auto_537878 ?auto_537879 ) ) ( not ( = ?auto_537878 ?auto_537880 ) ) ( not ( = ?auto_537878 ?auto_537877 ) ) ( not ( = ?auto_537878 ?auto_537881 ) ) ( not ( = ?auto_537878 ?auto_537883 ) ) ( not ( = ?auto_537878 ?auto_537882 ) ) ( not ( = ?auto_537878 ?auto_537884 ) ) ( not ( = ?auto_537878 ?auto_537885 ) ) ( not ( = ?auto_537878 ?auto_537886 ) ) ( not ( = ?auto_537878 ?auto_537887 ) ) ( not ( = ?auto_537878 ?auto_537890 ) ) ( not ( = ?auto_537879 ?auto_537880 ) ) ( not ( = ?auto_537879 ?auto_537877 ) ) ( not ( = ?auto_537879 ?auto_537881 ) ) ( not ( = ?auto_537879 ?auto_537883 ) ) ( not ( = ?auto_537879 ?auto_537882 ) ) ( not ( = ?auto_537879 ?auto_537884 ) ) ( not ( = ?auto_537879 ?auto_537885 ) ) ( not ( = ?auto_537879 ?auto_537886 ) ) ( not ( = ?auto_537879 ?auto_537887 ) ) ( not ( = ?auto_537879 ?auto_537890 ) ) ( not ( = ?auto_537880 ?auto_537877 ) ) ( not ( = ?auto_537880 ?auto_537881 ) ) ( not ( = ?auto_537880 ?auto_537883 ) ) ( not ( = ?auto_537880 ?auto_537882 ) ) ( not ( = ?auto_537880 ?auto_537884 ) ) ( not ( = ?auto_537880 ?auto_537885 ) ) ( not ( = ?auto_537880 ?auto_537886 ) ) ( not ( = ?auto_537880 ?auto_537887 ) ) ( not ( = ?auto_537880 ?auto_537890 ) ) ( not ( = ?auto_537877 ?auto_537881 ) ) ( not ( = ?auto_537877 ?auto_537883 ) ) ( not ( = ?auto_537877 ?auto_537882 ) ) ( not ( = ?auto_537877 ?auto_537884 ) ) ( not ( = ?auto_537877 ?auto_537885 ) ) ( not ( = ?auto_537877 ?auto_537886 ) ) ( not ( = ?auto_537877 ?auto_537887 ) ) ( not ( = ?auto_537877 ?auto_537890 ) ) ( not ( = ?auto_537881 ?auto_537883 ) ) ( not ( = ?auto_537881 ?auto_537882 ) ) ( not ( = ?auto_537881 ?auto_537884 ) ) ( not ( = ?auto_537881 ?auto_537885 ) ) ( not ( = ?auto_537881 ?auto_537886 ) ) ( not ( = ?auto_537881 ?auto_537887 ) ) ( not ( = ?auto_537881 ?auto_537890 ) ) ( not ( = ?auto_537883 ?auto_537882 ) ) ( not ( = ?auto_537883 ?auto_537884 ) ) ( not ( = ?auto_537883 ?auto_537885 ) ) ( not ( = ?auto_537883 ?auto_537886 ) ) ( not ( = ?auto_537883 ?auto_537887 ) ) ( not ( = ?auto_537883 ?auto_537890 ) ) ( not ( = ?auto_537882 ?auto_537884 ) ) ( not ( = ?auto_537882 ?auto_537885 ) ) ( not ( = ?auto_537882 ?auto_537886 ) ) ( not ( = ?auto_537882 ?auto_537887 ) ) ( not ( = ?auto_537882 ?auto_537890 ) ) ( not ( = ?auto_537884 ?auto_537885 ) ) ( not ( = ?auto_537884 ?auto_537886 ) ) ( not ( = ?auto_537884 ?auto_537887 ) ) ( not ( = ?auto_537884 ?auto_537890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537885 ?auto_537886 ?auto_537887 )
      ( MAKE-10CRATE-VERIFY ?auto_537878 ?auto_537879 ?auto_537880 ?auto_537877 ?auto_537881 ?auto_537883 ?auto_537882 ?auto_537884 ?auto_537885 ?auto_537886 ?auto_537887 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_538004 - SURFACE
      ?auto_538005 - SURFACE
      ?auto_538006 - SURFACE
      ?auto_538003 - SURFACE
      ?auto_538007 - SURFACE
      ?auto_538009 - SURFACE
      ?auto_538008 - SURFACE
      ?auto_538010 - SURFACE
      ?auto_538011 - SURFACE
      ?auto_538012 - SURFACE
      ?auto_538013 - SURFACE
    )
    :vars
    (
      ?auto_538015 - HOIST
      ?auto_538018 - PLACE
      ?auto_538016 - PLACE
      ?auto_538019 - HOIST
      ?auto_538014 - SURFACE
      ?auto_538017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_538015 ?auto_538018 ) ( IS-CRATE ?auto_538013 ) ( not ( = ?auto_538012 ?auto_538013 ) ) ( not ( = ?auto_538011 ?auto_538012 ) ) ( not ( = ?auto_538011 ?auto_538013 ) ) ( not ( = ?auto_538016 ?auto_538018 ) ) ( HOIST-AT ?auto_538019 ?auto_538016 ) ( not ( = ?auto_538015 ?auto_538019 ) ) ( AVAILABLE ?auto_538019 ) ( SURFACE-AT ?auto_538013 ?auto_538016 ) ( ON ?auto_538013 ?auto_538014 ) ( CLEAR ?auto_538013 ) ( not ( = ?auto_538012 ?auto_538014 ) ) ( not ( = ?auto_538013 ?auto_538014 ) ) ( not ( = ?auto_538011 ?auto_538014 ) ) ( TRUCK-AT ?auto_538017 ?auto_538018 ) ( SURFACE-AT ?auto_538011 ?auto_538018 ) ( CLEAR ?auto_538011 ) ( IS-CRATE ?auto_538012 ) ( AVAILABLE ?auto_538015 ) ( IN ?auto_538012 ?auto_538017 ) ( ON ?auto_538005 ?auto_538004 ) ( ON ?auto_538006 ?auto_538005 ) ( ON ?auto_538003 ?auto_538006 ) ( ON ?auto_538007 ?auto_538003 ) ( ON ?auto_538009 ?auto_538007 ) ( ON ?auto_538008 ?auto_538009 ) ( ON ?auto_538010 ?auto_538008 ) ( ON ?auto_538011 ?auto_538010 ) ( not ( = ?auto_538004 ?auto_538005 ) ) ( not ( = ?auto_538004 ?auto_538006 ) ) ( not ( = ?auto_538004 ?auto_538003 ) ) ( not ( = ?auto_538004 ?auto_538007 ) ) ( not ( = ?auto_538004 ?auto_538009 ) ) ( not ( = ?auto_538004 ?auto_538008 ) ) ( not ( = ?auto_538004 ?auto_538010 ) ) ( not ( = ?auto_538004 ?auto_538011 ) ) ( not ( = ?auto_538004 ?auto_538012 ) ) ( not ( = ?auto_538004 ?auto_538013 ) ) ( not ( = ?auto_538004 ?auto_538014 ) ) ( not ( = ?auto_538005 ?auto_538006 ) ) ( not ( = ?auto_538005 ?auto_538003 ) ) ( not ( = ?auto_538005 ?auto_538007 ) ) ( not ( = ?auto_538005 ?auto_538009 ) ) ( not ( = ?auto_538005 ?auto_538008 ) ) ( not ( = ?auto_538005 ?auto_538010 ) ) ( not ( = ?auto_538005 ?auto_538011 ) ) ( not ( = ?auto_538005 ?auto_538012 ) ) ( not ( = ?auto_538005 ?auto_538013 ) ) ( not ( = ?auto_538005 ?auto_538014 ) ) ( not ( = ?auto_538006 ?auto_538003 ) ) ( not ( = ?auto_538006 ?auto_538007 ) ) ( not ( = ?auto_538006 ?auto_538009 ) ) ( not ( = ?auto_538006 ?auto_538008 ) ) ( not ( = ?auto_538006 ?auto_538010 ) ) ( not ( = ?auto_538006 ?auto_538011 ) ) ( not ( = ?auto_538006 ?auto_538012 ) ) ( not ( = ?auto_538006 ?auto_538013 ) ) ( not ( = ?auto_538006 ?auto_538014 ) ) ( not ( = ?auto_538003 ?auto_538007 ) ) ( not ( = ?auto_538003 ?auto_538009 ) ) ( not ( = ?auto_538003 ?auto_538008 ) ) ( not ( = ?auto_538003 ?auto_538010 ) ) ( not ( = ?auto_538003 ?auto_538011 ) ) ( not ( = ?auto_538003 ?auto_538012 ) ) ( not ( = ?auto_538003 ?auto_538013 ) ) ( not ( = ?auto_538003 ?auto_538014 ) ) ( not ( = ?auto_538007 ?auto_538009 ) ) ( not ( = ?auto_538007 ?auto_538008 ) ) ( not ( = ?auto_538007 ?auto_538010 ) ) ( not ( = ?auto_538007 ?auto_538011 ) ) ( not ( = ?auto_538007 ?auto_538012 ) ) ( not ( = ?auto_538007 ?auto_538013 ) ) ( not ( = ?auto_538007 ?auto_538014 ) ) ( not ( = ?auto_538009 ?auto_538008 ) ) ( not ( = ?auto_538009 ?auto_538010 ) ) ( not ( = ?auto_538009 ?auto_538011 ) ) ( not ( = ?auto_538009 ?auto_538012 ) ) ( not ( = ?auto_538009 ?auto_538013 ) ) ( not ( = ?auto_538009 ?auto_538014 ) ) ( not ( = ?auto_538008 ?auto_538010 ) ) ( not ( = ?auto_538008 ?auto_538011 ) ) ( not ( = ?auto_538008 ?auto_538012 ) ) ( not ( = ?auto_538008 ?auto_538013 ) ) ( not ( = ?auto_538008 ?auto_538014 ) ) ( not ( = ?auto_538010 ?auto_538011 ) ) ( not ( = ?auto_538010 ?auto_538012 ) ) ( not ( = ?auto_538010 ?auto_538013 ) ) ( not ( = ?auto_538010 ?auto_538014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_538011 ?auto_538012 ?auto_538013 )
      ( MAKE-10CRATE-VERIFY ?auto_538004 ?auto_538005 ?auto_538006 ?auto_538003 ?auto_538007 ?auto_538009 ?auto_538008 ?auto_538010 ?auto_538011 ?auto_538012 ?auto_538013 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545288 - SURFACE
      ?auto_545289 - SURFACE
      ?auto_545290 - SURFACE
      ?auto_545287 - SURFACE
      ?auto_545291 - SURFACE
      ?auto_545293 - SURFACE
      ?auto_545292 - SURFACE
      ?auto_545294 - SURFACE
      ?auto_545295 - SURFACE
      ?auto_545296 - SURFACE
      ?auto_545297 - SURFACE
      ?auto_545298 - SURFACE
    )
    :vars
    (
      ?auto_545300 - HOIST
      ?auto_545299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545300 ?auto_545299 ) ( SURFACE-AT ?auto_545297 ?auto_545299 ) ( CLEAR ?auto_545297 ) ( LIFTING ?auto_545300 ?auto_545298 ) ( IS-CRATE ?auto_545298 ) ( not ( = ?auto_545297 ?auto_545298 ) ) ( ON ?auto_545289 ?auto_545288 ) ( ON ?auto_545290 ?auto_545289 ) ( ON ?auto_545287 ?auto_545290 ) ( ON ?auto_545291 ?auto_545287 ) ( ON ?auto_545293 ?auto_545291 ) ( ON ?auto_545292 ?auto_545293 ) ( ON ?auto_545294 ?auto_545292 ) ( ON ?auto_545295 ?auto_545294 ) ( ON ?auto_545296 ?auto_545295 ) ( ON ?auto_545297 ?auto_545296 ) ( not ( = ?auto_545288 ?auto_545289 ) ) ( not ( = ?auto_545288 ?auto_545290 ) ) ( not ( = ?auto_545288 ?auto_545287 ) ) ( not ( = ?auto_545288 ?auto_545291 ) ) ( not ( = ?auto_545288 ?auto_545293 ) ) ( not ( = ?auto_545288 ?auto_545292 ) ) ( not ( = ?auto_545288 ?auto_545294 ) ) ( not ( = ?auto_545288 ?auto_545295 ) ) ( not ( = ?auto_545288 ?auto_545296 ) ) ( not ( = ?auto_545288 ?auto_545297 ) ) ( not ( = ?auto_545288 ?auto_545298 ) ) ( not ( = ?auto_545289 ?auto_545290 ) ) ( not ( = ?auto_545289 ?auto_545287 ) ) ( not ( = ?auto_545289 ?auto_545291 ) ) ( not ( = ?auto_545289 ?auto_545293 ) ) ( not ( = ?auto_545289 ?auto_545292 ) ) ( not ( = ?auto_545289 ?auto_545294 ) ) ( not ( = ?auto_545289 ?auto_545295 ) ) ( not ( = ?auto_545289 ?auto_545296 ) ) ( not ( = ?auto_545289 ?auto_545297 ) ) ( not ( = ?auto_545289 ?auto_545298 ) ) ( not ( = ?auto_545290 ?auto_545287 ) ) ( not ( = ?auto_545290 ?auto_545291 ) ) ( not ( = ?auto_545290 ?auto_545293 ) ) ( not ( = ?auto_545290 ?auto_545292 ) ) ( not ( = ?auto_545290 ?auto_545294 ) ) ( not ( = ?auto_545290 ?auto_545295 ) ) ( not ( = ?auto_545290 ?auto_545296 ) ) ( not ( = ?auto_545290 ?auto_545297 ) ) ( not ( = ?auto_545290 ?auto_545298 ) ) ( not ( = ?auto_545287 ?auto_545291 ) ) ( not ( = ?auto_545287 ?auto_545293 ) ) ( not ( = ?auto_545287 ?auto_545292 ) ) ( not ( = ?auto_545287 ?auto_545294 ) ) ( not ( = ?auto_545287 ?auto_545295 ) ) ( not ( = ?auto_545287 ?auto_545296 ) ) ( not ( = ?auto_545287 ?auto_545297 ) ) ( not ( = ?auto_545287 ?auto_545298 ) ) ( not ( = ?auto_545291 ?auto_545293 ) ) ( not ( = ?auto_545291 ?auto_545292 ) ) ( not ( = ?auto_545291 ?auto_545294 ) ) ( not ( = ?auto_545291 ?auto_545295 ) ) ( not ( = ?auto_545291 ?auto_545296 ) ) ( not ( = ?auto_545291 ?auto_545297 ) ) ( not ( = ?auto_545291 ?auto_545298 ) ) ( not ( = ?auto_545293 ?auto_545292 ) ) ( not ( = ?auto_545293 ?auto_545294 ) ) ( not ( = ?auto_545293 ?auto_545295 ) ) ( not ( = ?auto_545293 ?auto_545296 ) ) ( not ( = ?auto_545293 ?auto_545297 ) ) ( not ( = ?auto_545293 ?auto_545298 ) ) ( not ( = ?auto_545292 ?auto_545294 ) ) ( not ( = ?auto_545292 ?auto_545295 ) ) ( not ( = ?auto_545292 ?auto_545296 ) ) ( not ( = ?auto_545292 ?auto_545297 ) ) ( not ( = ?auto_545292 ?auto_545298 ) ) ( not ( = ?auto_545294 ?auto_545295 ) ) ( not ( = ?auto_545294 ?auto_545296 ) ) ( not ( = ?auto_545294 ?auto_545297 ) ) ( not ( = ?auto_545294 ?auto_545298 ) ) ( not ( = ?auto_545295 ?auto_545296 ) ) ( not ( = ?auto_545295 ?auto_545297 ) ) ( not ( = ?auto_545295 ?auto_545298 ) ) ( not ( = ?auto_545296 ?auto_545297 ) ) ( not ( = ?auto_545296 ?auto_545298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_545297 ?auto_545298 )
      ( MAKE-11CRATE-VERIFY ?auto_545288 ?auto_545289 ?auto_545290 ?auto_545287 ?auto_545291 ?auto_545293 ?auto_545292 ?auto_545294 ?auto_545295 ?auto_545296 ?auto_545297 ?auto_545298 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545397 - SURFACE
      ?auto_545398 - SURFACE
      ?auto_545399 - SURFACE
      ?auto_545396 - SURFACE
      ?auto_545400 - SURFACE
      ?auto_545402 - SURFACE
      ?auto_545401 - SURFACE
      ?auto_545403 - SURFACE
      ?auto_545404 - SURFACE
      ?auto_545405 - SURFACE
      ?auto_545406 - SURFACE
      ?auto_545407 - SURFACE
    )
    :vars
    (
      ?auto_545408 - HOIST
      ?auto_545409 - PLACE
      ?auto_545410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545408 ?auto_545409 ) ( SURFACE-AT ?auto_545406 ?auto_545409 ) ( CLEAR ?auto_545406 ) ( IS-CRATE ?auto_545407 ) ( not ( = ?auto_545406 ?auto_545407 ) ) ( TRUCK-AT ?auto_545410 ?auto_545409 ) ( AVAILABLE ?auto_545408 ) ( IN ?auto_545407 ?auto_545410 ) ( ON ?auto_545406 ?auto_545405 ) ( not ( = ?auto_545405 ?auto_545406 ) ) ( not ( = ?auto_545405 ?auto_545407 ) ) ( ON ?auto_545398 ?auto_545397 ) ( ON ?auto_545399 ?auto_545398 ) ( ON ?auto_545396 ?auto_545399 ) ( ON ?auto_545400 ?auto_545396 ) ( ON ?auto_545402 ?auto_545400 ) ( ON ?auto_545401 ?auto_545402 ) ( ON ?auto_545403 ?auto_545401 ) ( ON ?auto_545404 ?auto_545403 ) ( ON ?auto_545405 ?auto_545404 ) ( not ( = ?auto_545397 ?auto_545398 ) ) ( not ( = ?auto_545397 ?auto_545399 ) ) ( not ( = ?auto_545397 ?auto_545396 ) ) ( not ( = ?auto_545397 ?auto_545400 ) ) ( not ( = ?auto_545397 ?auto_545402 ) ) ( not ( = ?auto_545397 ?auto_545401 ) ) ( not ( = ?auto_545397 ?auto_545403 ) ) ( not ( = ?auto_545397 ?auto_545404 ) ) ( not ( = ?auto_545397 ?auto_545405 ) ) ( not ( = ?auto_545397 ?auto_545406 ) ) ( not ( = ?auto_545397 ?auto_545407 ) ) ( not ( = ?auto_545398 ?auto_545399 ) ) ( not ( = ?auto_545398 ?auto_545396 ) ) ( not ( = ?auto_545398 ?auto_545400 ) ) ( not ( = ?auto_545398 ?auto_545402 ) ) ( not ( = ?auto_545398 ?auto_545401 ) ) ( not ( = ?auto_545398 ?auto_545403 ) ) ( not ( = ?auto_545398 ?auto_545404 ) ) ( not ( = ?auto_545398 ?auto_545405 ) ) ( not ( = ?auto_545398 ?auto_545406 ) ) ( not ( = ?auto_545398 ?auto_545407 ) ) ( not ( = ?auto_545399 ?auto_545396 ) ) ( not ( = ?auto_545399 ?auto_545400 ) ) ( not ( = ?auto_545399 ?auto_545402 ) ) ( not ( = ?auto_545399 ?auto_545401 ) ) ( not ( = ?auto_545399 ?auto_545403 ) ) ( not ( = ?auto_545399 ?auto_545404 ) ) ( not ( = ?auto_545399 ?auto_545405 ) ) ( not ( = ?auto_545399 ?auto_545406 ) ) ( not ( = ?auto_545399 ?auto_545407 ) ) ( not ( = ?auto_545396 ?auto_545400 ) ) ( not ( = ?auto_545396 ?auto_545402 ) ) ( not ( = ?auto_545396 ?auto_545401 ) ) ( not ( = ?auto_545396 ?auto_545403 ) ) ( not ( = ?auto_545396 ?auto_545404 ) ) ( not ( = ?auto_545396 ?auto_545405 ) ) ( not ( = ?auto_545396 ?auto_545406 ) ) ( not ( = ?auto_545396 ?auto_545407 ) ) ( not ( = ?auto_545400 ?auto_545402 ) ) ( not ( = ?auto_545400 ?auto_545401 ) ) ( not ( = ?auto_545400 ?auto_545403 ) ) ( not ( = ?auto_545400 ?auto_545404 ) ) ( not ( = ?auto_545400 ?auto_545405 ) ) ( not ( = ?auto_545400 ?auto_545406 ) ) ( not ( = ?auto_545400 ?auto_545407 ) ) ( not ( = ?auto_545402 ?auto_545401 ) ) ( not ( = ?auto_545402 ?auto_545403 ) ) ( not ( = ?auto_545402 ?auto_545404 ) ) ( not ( = ?auto_545402 ?auto_545405 ) ) ( not ( = ?auto_545402 ?auto_545406 ) ) ( not ( = ?auto_545402 ?auto_545407 ) ) ( not ( = ?auto_545401 ?auto_545403 ) ) ( not ( = ?auto_545401 ?auto_545404 ) ) ( not ( = ?auto_545401 ?auto_545405 ) ) ( not ( = ?auto_545401 ?auto_545406 ) ) ( not ( = ?auto_545401 ?auto_545407 ) ) ( not ( = ?auto_545403 ?auto_545404 ) ) ( not ( = ?auto_545403 ?auto_545405 ) ) ( not ( = ?auto_545403 ?auto_545406 ) ) ( not ( = ?auto_545403 ?auto_545407 ) ) ( not ( = ?auto_545404 ?auto_545405 ) ) ( not ( = ?auto_545404 ?auto_545406 ) ) ( not ( = ?auto_545404 ?auto_545407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545405 ?auto_545406 ?auto_545407 )
      ( MAKE-11CRATE-VERIFY ?auto_545397 ?auto_545398 ?auto_545399 ?auto_545396 ?auto_545400 ?auto_545402 ?auto_545401 ?auto_545403 ?auto_545404 ?auto_545405 ?auto_545406 ?auto_545407 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545518 - SURFACE
      ?auto_545519 - SURFACE
      ?auto_545520 - SURFACE
      ?auto_545517 - SURFACE
      ?auto_545521 - SURFACE
      ?auto_545523 - SURFACE
      ?auto_545522 - SURFACE
      ?auto_545524 - SURFACE
      ?auto_545525 - SURFACE
      ?auto_545526 - SURFACE
      ?auto_545527 - SURFACE
      ?auto_545528 - SURFACE
    )
    :vars
    (
      ?auto_545532 - HOIST
      ?auto_545530 - PLACE
      ?auto_545531 - TRUCK
      ?auto_545529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545532 ?auto_545530 ) ( SURFACE-AT ?auto_545527 ?auto_545530 ) ( CLEAR ?auto_545527 ) ( IS-CRATE ?auto_545528 ) ( not ( = ?auto_545527 ?auto_545528 ) ) ( AVAILABLE ?auto_545532 ) ( IN ?auto_545528 ?auto_545531 ) ( ON ?auto_545527 ?auto_545526 ) ( not ( = ?auto_545526 ?auto_545527 ) ) ( not ( = ?auto_545526 ?auto_545528 ) ) ( TRUCK-AT ?auto_545531 ?auto_545529 ) ( not ( = ?auto_545529 ?auto_545530 ) ) ( ON ?auto_545519 ?auto_545518 ) ( ON ?auto_545520 ?auto_545519 ) ( ON ?auto_545517 ?auto_545520 ) ( ON ?auto_545521 ?auto_545517 ) ( ON ?auto_545523 ?auto_545521 ) ( ON ?auto_545522 ?auto_545523 ) ( ON ?auto_545524 ?auto_545522 ) ( ON ?auto_545525 ?auto_545524 ) ( ON ?auto_545526 ?auto_545525 ) ( not ( = ?auto_545518 ?auto_545519 ) ) ( not ( = ?auto_545518 ?auto_545520 ) ) ( not ( = ?auto_545518 ?auto_545517 ) ) ( not ( = ?auto_545518 ?auto_545521 ) ) ( not ( = ?auto_545518 ?auto_545523 ) ) ( not ( = ?auto_545518 ?auto_545522 ) ) ( not ( = ?auto_545518 ?auto_545524 ) ) ( not ( = ?auto_545518 ?auto_545525 ) ) ( not ( = ?auto_545518 ?auto_545526 ) ) ( not ( = ?auto_545518 ?auto_545527 ) ) ( not ( = ?auto_545518 ?auto_545528 ) ) ( not ( = ?auto_545519 ?auto_545520 ) ) ( not ( = ?auto_545519 ?auto_545517 ) ) ( not ( = ?auto_545519 ?auto_545521 ) ) ( not ( = ?auto_545519 ?auto_545523 ) ) ( not ( = ?auto_545519 ?auto_545522 ) ) ( not ( = ?auto_545519 ?auto_545524 ) ) ( not ( = ?auto_545519 ?auto_545525 ) ) ( not ( = ?auto_545519 ?auto_545526 ) ) ( not ( = ?auto_545519 ?auto_545527 ) ) ( not ( = ?auto_545519 ?auto_545528 ) ) ( not ( = ?auto_545520 ?auto_545517 ) ) ( not ( = ?auto_545520 ?auto_545521 ) ) ( not ( = ?auto_545520 ?auto_545523 ) ) ( not ( = ?auto_545520 ?auto_545522 ) ) ( not ( = ?auto_545520 ?auto_545524 ) ) ( not ( = ?auto_545520 ?auto_545525 ) ) ( not ( = ?auto_545520 ?auto_545526 ) ) ( not ( = ?auto_545520 ?auto_545527 ) ) ( not ( = ?auto_545520 ?auto_545528 ) ) ( not ( = ?auto_545517 ?auto_545521 ) ) ( not ( = ?auto_545517 ?auto_545523 ) ) ( not ( = ?auto_545517 ?auto_545522 ) ) ( not ( = ?auto_545517 ?auto_545524 ) ) ( not ( = ?auto_545517 ?auto_545525 ) ) ( not ( = ?auto_545517 ?auto_545526 ) ) ( not ( = ?auto_545517 ?auto_545527 ) ) ( not ( = ?auto_545517 ?auto_545528 ) ) ( not ( = ?auto_545521 ?auto_545523 ) ) ( not ( = ?auto_545521 ?auto_545522 ) ) ( not ( = ?auto_545521 ?auto_545524 ) ) ( not ( = ?auto_545521 ?auto_545525 ) ) ( not ( = ?auto_545521 ?auto_545526 ) ) ( not ( = ?auto_545521 ?auto_545527 ) ) ( not ( = ?auto_545521 ?auto_545528 ) ) ( not ( = ?auto_545523 ?auto_545522 ) ) ( not ( = ?auto_545523 ?auto_545524 ) ) ( not ( = ?auto_545523 ?auto_545525 ) ) ( not ( = ?auto_545523 ?auto_545526 ) ) ( not ( = ?auto_545523 ?auto_545527 ) ) ( not ( = ?auto_545523 ?auto_545528 ) ) ( not ( = ?auto_545522 ?auto_545524 ) ) ( not ( = ?auto_545522 ?auto_545525 ) ) ( not ( = ?auto_545522 ?auto_545526 ) ) ( not ( = ?auto_545522 ?auto_545527 ) ) ( not ( = ?auto_545522 ?auto_545528 ) ) ( not ( = ?auto_545524 ?auto_545525 ) ) ( not ( = ?auto_545524 ?auto_545526 ) ) ( not ( = ?auto_545524 ?auto_545527 ) ) ( not ( = ?auto_545524 ?auto_545528 ) ) ( not ( = ?auto_545525 ?auto_545526 ) ) ( not ( = ?auto_545525 ?auto_545527 ) ) ( not ( = ?auto_545525 ?auto_545528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545526 ?auto_545527 ?auto_545528 )
      ( MAKE-11CRATE-VERIFY ?auto_545518 ?auto_545519 ?auto_545520 ?auto_545517 ?auto_545521 ?auto_545523 ?auto_545522 ?auto_545524 ?auto_545525 ?auto_545526 ?auto_545527 ?auto_545528 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545650 - SURFACE
      ?auto_545651 - SURFACE
      ?auto_545652 - SURFACE
      ?auto_545649 - SURFACE
      ?auto_545653 - SURFACE
      ?auto_545655 - SURFACE
      ?auto_545654 - SURFACE
      ?auto_545656 - SURFACE
      ?auto_545657 - SURFACE
      ?auto_545658 - SURFACE
      ?auto_545659 - SURFACE
      ?auto_545660 - SURFACE
    )
    :vars
    (
      ?auto_545663 - HOIST
      ?auto_545662 - PLACE
      ?auto_545664 - TRUCK
      ?auto_545665 - PLACE
      ?auto_545661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_545663 ?auto_545662 ) ( SURFACE-AT ?auto_545659 ?auto_545662 ) ( CLEAR ?auto_545659 ) ( IS-CRATE ?auto_545660 ) ( not ( = ?auto_545659 ?auto_545660 ) ) ( AVAILABLE ?auto_545663 ) ( ON ?auto_545659 ?auto_545658 ) ( not ( = ?auto_545658 ?auto_545659 ) ) ( not ( = ?auto_545658 ?auto_545660 ) ) ( TRUCK-AT ?auto_545664 ?auto_545665 ) ( not ( = ?auto_545665 ?auto_545662 ) ) ( HOIST-AT ?auto_545661 ?auto_545665 ) ( LIFTING ?auto_545661 ?auto_545660 ) ( not ( = ?auto_545663 ?auto_545661 ) ) ( ON ?auto_545651 ?auto_545650 ) ( ON ?auto_545652 ?auto_545651 ) ( ON ?auto_545649 ?auto_545652 ) ( ON ?auto_545653 ?auto_545649 ) ( ON ?auto_545655 ?auto_545653 ) ( ON ?auto_545654 ?auto_545655 ) ( ON ?auto_545656 ?auto_545654 ) ( ON ?auto_545657 ?auto_545656 ) ( ON ?auto_545658 ?auto_545657 ) ( not ( = ?auto_545650 ?auto_545651 ) ) ( not ( = ?auto_545650 ?auto_545652 ) ) ( not ( = ?auto_545650 ?auto_545649 ) ) ( not ( = ?auto_545650 ?auto_545653 ) ) ( not ( = ?auto_545650 ?auto_545655 ) ) ( not ( = ?auto_545650 ?auto_545654 ) ) ( not ( = ?auto_545650 ?auto_545656 ) ) ( not ( = ?auto_545650 ?auto_545657 ) ) ( not ( = ?auto_545650 ?auto_545658 ) ) ( not ( = ?auto_545650 ?auto_545659 ) ) ( not ( = ?auto_545650 ?auto_545660 ) ) ( not ( = ?auto_545651 ?auto_545652 ) ) ( not ( = ?auto_545651 ?auto_545649 ) ) ( not ( = ?auto_545651 ?auto_545653 ) ) ( not ( = ?auto_545651 ?auto_545655 ) ) ( not ( = ?auto_545651 ?auto_545654 ) ) ( not ( = ?auto_545651 ?auto_545656 ) ) ( not ( = ?auto_545651 ?auto_545657 ) ) ( not ( = ?auto_545651 ?auto_545658 ) ) ( not ( = ?auto_545651 ?auto_545659 ) ) ( not ( = ?auto_545651 ?auto_545660 ) ) ( not ( = ?auto_545652 ?auto_545649 ) ) ( not ( = ?auto_545652 ?auto_545653 ) ) ( not ( = ?auto_545652 ?auto_545655 ) ) ( not ( = ?auto_545652 ?auto_545654 ) ) ( not ( = ?auto_545652 ?auto_545656 ) ) ( not ( = ?auto_545652 ?auto_545657 ) ) ( not ( = ?auto_545652 ?auto_545658 ) ) ( not ( = ?auto_545652 ?auto_545659 ) ) ( not ( = ?auto_545652 ?auto_545660 ) ) ( not ( = ?auto_545649 ?auto_545653 ) ) ( not ( = ?auto_545649 ?auto_545655 ) ) ( not ( = ?auto_545649 ?auto_545654 ) ) ( not ( = ?auto_545649 ?auto_545656 ) ) ( not ( = ?auto_545649 ?auto_545657 ) ) ( not ( = ?auto_545649 ?auto_545658 ) ) ( not ( = ?auto_545649 ?auto_545659 ) ) ( not ( = ?auto_545649 ?auto_545660 ) ) ( not ( = ?auto_545653 ?auto_545655 ) ) ( not ( = ?auto_545653 ?auto_545654 ) ) ( not ( = ?auto_545653 ?auto_545656 ) ) ( not ( = ?auto_545653 ?auto_545657 ) ) ( not ( = ?auto_545653 ?auto_545658 ) ) ( not ( = ?auto_545653 ?auto_545659 ) ) ( not ( = ?auto_545653 ?auto_545660 ) ) ( not ( = ?auto_545655 ?auto_545654 ) ) ( not ( = ?auto_545655 ?auto_545656 ) ) ( not ( = ?auto_545655 ?auto_545657 ) ) ( not ( = ?auto_545655 ?auto_545658 ) ) ( not ( = ?auto_545655 ?auto_545659 ) ) ( not ( = ?auto_545655 ?auto_545660 ) ) ( not ( = ?auto_545654 ?auto_545656 ) ) ( not ( = ?auto_545654 ?auto_545657 ) ) ( not ( = ?auto_545654 ?auto_545658 ) ) ( not ( = ?auto_545654 ?auto_545659 ) ) ( not ( = ?auto_545654 ?auto_545660 ) ) ( not ( = ?auto_545656 ?auto_545657 ) ) ( not ( = ?auto_545656 ?auto_545658 ) ) ( not ( = ?auto_545656 ?auto_545659 ) ) ( not ( = ?auto_545656 ?auto_545660 ) ) ( not ( = ?auto_545657 ?auto_545658 ) ) ( not ( = ?auto_545657 ?auto_545659 ) ) ( not ( = ?auto_545657 ?auto_545660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545658 ?auto_545659 ?auto_545660 )
      ( MAKE-11CRATE-VERIFY ?auto_545650 ?auto_545651 ?auto_545652 ?auto_545649 ?auto_545653 ?auto_545655 ?auto_545654 ?auto_545656 ?auto_545657 ?auto_545658 ?auto_545659 ?auto_545660 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545793 - SURFACE
      ?auto_545794 - SURFACE
      ?auto_545795 - SURFACE
      ?auto_545792 - SURFACE
      ?auto_545796 - SURFACE
      ?auto_545798 - SURFACE
      ?auto_545797 - SURFACE
      ?auto_545799 - SURFACE
      ?auto_545800 - SURFACE
      ?auto_545801 - SURFACE
      ?auto_545802 - SURFACE
      ?auto_545803 - SURFACE
    )
    :vars
    (
      ?auto_545807 - HOIST
      ?auto_545806 - PLACE
      ?auto_545808 - TRUCK
      ?auto_545809 - PLACE
      ?auto_545805 - HOIST
      ?auto_545804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545807 ?auto_545806 ) ( SURFACE-AT ?auto_545802 ?auto_545806 ) ( CLEAR ?auto_545802 ) ( IS-CRATE ?auto_545803 ) ( not ( = ?auto_545802 ?auto_545803 ) ) ( AVAILABLE ?auto_545807 ) ( ON ?auto_545802 ?auto_545801 ) ( not ( = ?auto_545801 ?auto_545802 ) ) ( not ( = ?auto_545801 ?auto_545803 ) ) ( TRUCK-AT ?auto_545808 ?auto_545809 ) ( not ( = ?auto_545809 ?auto_545806 ) ) ( HOIST-AT ?auto_545805 ?auto_545809 ) ( not ( = ?auto_545807 ?auto_545805 ) ) ( AVAILABLE ?auto_545805 ) ( SURFACE-AT ?auto_545803 ?auto_545809 ) ( ON ?auto_545803 ?auto_545804 ) ( CLEAR ?auto_545803 ) ( not ( = ?auto_545802 ?auto_545804 ) ) ( not ( = ?auto_545803 ?auto_545804 ) ) ( not ( = ?auto_545801 ?auto_545804 ) ) ( ON ?auto_545794 ?auto_545793 ) ( ON ?auto_545795 ?auto_545794 ) ( ON ?auto_545792 ?auto_545795 ) ( ON ?auto_545796 ?auto_545792 ) ( ON ?auto_545798 ?auto_545796 ) ( ON ?auto_545797 ?auto_545798 ) ( ON ?auto_545799 ?auto_545797 ) ( ON ?auto_545800 ?auto_545799 ) ( ON ?auto_545801 ?auto_545800 ) ( not ( = ?auto_545793 ?auto_545794 ) ) ( not ( = ?auto_545793 ?auto_545795 ) ) ( not ( = ?auto_545793 ?auto_545792 ) ) ( not ( = ?auto_545793 ?auto_545796 ) ) ( not ( = ?auto_545793 ?auto_545798 ) ) ( not ( = ?auto_545793 ?auto_545797 ) ) ( not ( = ?auto_545793 ?auto_545799 ) ) ( not ( = ?auto_545793 ?auto_545800 ) ) ( not ( = ?auto_545793 ?auto_545801 ) ) ( not ( = ?auto_545793 ?auto_545802 ) ) ( not ( = ?auto_545793 ?auto_545803 ) ) ( not ( = ?auto_545793 ?auto_545804 ) ) ( not ( = ?auto_545794 ?auto_545795 ) ) ( not ( = ?auto_545794 ?auto_545792 ) ) ( not ( = ?auto_545794 ?auto_545796 ) ) ( not ( = ?auto_545794 ?auto_545798 ) ) ( not ( = ?auto_545794 ?auto_545797 ) ) ( not ( = ?auto_545794 ?auto_545799 ) ) ( not ( = ?auto_545794 ?auto_545800 ) ) ( not ( = ?auto_545794 ?auto_545801 ) ) ( not ( = ?auto_545794 ?auto_545802 ) ) ( not ( = ?auto_545794 ?auto_545803 ) ) ( not ( = ?auto_545794 ?auto_545804 ) ) ( not ( = ?auto_545795 ?auto_545792 ) ) ( not ( = ?auto_545795 ?auto_545796 ) ) ( not ( = ?auto_545795 ?auto_545798 ) ) ( not ( = ?auto_545795 ?auto_545797 ) ) ( not ( = ?auto_545795 ?auto_545799 ) ) ( not ( = ?auto_545795 ?auto_545800 ) ) ( not ( = ?auto_545795 ?auto_545801 ) ) ( not ( = ?auto_545795 ?auto_545802 ) ) ( not ( = ?auto_545795 ?auto_545803 ) ) ( not ( = ?auto_545795 ?auto_545804 ) ) ( not ( = ?auto_545792 ?auto_545796 ) ) ( not ( = ?auto_545792 ?auto_545798 ) ) ( not ( = ?auto_545792 ?auto_545797 ) ) ( not ( = ?auto_545792 ?auto_545799 ) ) ( not ( = ?auto_545792 ?auto_545800 ) ) ( not ( = ?auto_545792 ?auto_545801 ) ) ( not ( = ?auto_545792 ?auto_545802 ) ) ( not ( = ?auto_545792 ?auto_545803 ) ) ( not ( = ?auto_545792 ?auto_545804 ) ) ( not ( = ?auto_545796 ?auto_545798 ) ) ( not ( = ?auto_545796 ?auto_545797 ) ) ( not ( = ?auto_545796 ?auto_545799 ) ) ( not ( = ?auto_545796 ?auto_545800 ) ) ( not ( = ?auto_545796 ?auto_545801 ) ) ( not ( = ?auto_545796 ?auto_545802 ) ) ( not ( = ?auto_545796 ?auto_545803 ) ) ( not ( = ?auto_545796 ?auto_545804 ) ) ( not ( = ?auto_545798 ?auto_545797 ) ) ( not ( = ?auto_545798 ?auto_545799 ) ) ( not ( = ?auto_545798 ?auto_545800 ) ) ( not ( = ?auto_545798 ?auto_545801 ) ) ( not ( = ?auto_545798 ?auto_545802 ) ) ( not ( = ?auto_545798 ?auto_545803 ) ) ( not ( = ?auto_545798 ?auto_545804 ) ) ( not ( = ?auto_545797 ?auto_545799 ) ) ( not ( = ?auto_545797 ?auto_545800 ) ) ( not ( = ?auto_545797 ?auto_545801 ) ) ( not ( = ?auto_545797 ?auto_545802 ) ) ( not ( = ?auto_545797 ?auto_545803 ) ) ( not ( = ?auto_545797 ?auto_545804 ) ) ( not ( = ?auto_545799 ?auto_545800 ) ) ( not ( = ?auto_545799 ?auto_545801 ) ) ( not ( = ?auto_545799 ?auto_545802 ) ) ( not ( = ?auto_545799 ?auto_545803 ) ) ( not ( = ?auto_545799 ?auto_545804 ) ) ( not ( = ?auto_545800 ?auto_545801 ) ) ( not ( = ?auto_545800 ?auto_545802 ) ) ( not ( = ?auto_545800 ?auto_545803 ) ) ( not ( = ?auto_545800 ?auto_545804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545801 ?auto_545802 ?auto_545803 )
      ( MAKE-11CRATE-VERIFY ?auto_545793 ?auto_545794 ?auto_545795 ?auto_545792 ?auto_545796 ?auto_545798 ?auto_545797 ?auto_545799 ?auto_545800 ?auto_545801 ?auto_545802 ?auto_545803 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545937 - SURFACE
      ?auto_545938 - SURFACE
      ?auto_545939 - SURFACE
      ?auto_545936 - SURFACE
      ?auto_545940 - SURFACE
      ?auto_545942 - SURFACE
      ?auto_545941 - SURFACE
      ?auto_545943 - SURFACE
      ?auto_545944 - SURFACE
      ?auto_545945 - SURFACE
      ?auto_545946 - SURFACE
      ?auto_545947 - SURFACE
    )
    :vars
    (
      ?auto_545951 - HOIST
      ?auto_545950 - PLACE
      ?auto_545953 - PLACE
      ?auto_545952 - HOIST
      ?auto_545949 - SURFACE
      ?auto_545948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545951 ?auto_545950 ) ( SURFACE-AT ?auto_545946 ?auto_545950 ) ( CLEAR ?auto_545946 ) ( IS-CRATE ?auto_545947 ) ( not ( = ?auto_545946 ?auto_545947 ) ) ( AVAILABLE ?auto_545951 ) ( ON ?auto_545946 ?auto_545945 ) ( not ( = ?auto_545945 ?auto_545946 ) ) ( not ( = ?auto_545945 ?auto_545947 ) ) ( not ( = ?auto_545953 ?auto_545950 ) ) ( HOIST-AT ?auto_545952 ?auto_545953 ) ( not ( = ?auto_545951 ?auto_545952 ) ) ( AVAILABLE ?auto_545952 ) ( SURFACE-AT ?auto_545947 ?auto_545953 ) ( ON ?auto_545947 ?auto_545949 ) ( CLEAR ?auto_545947 ) ( not ( = ?auto_545946 ?auto_545949 ) ) ( not ( = ?auto_545947 ?auto_545949 ) ) ( not ( = ?auto_545945 ?auto_545949 ) ) ( TRUCK-AT ?auto_545948 ?auto_545950 ) ( ON ?auto_545938 ?auto_545937 ) ( ON ?auto_545939 ?auto_545938 ) ( ON ?auto_545936 ?auto_545939 ) ( ON ?auto_545940 ?auto_545936 ) ( ON ?auto_545942 ?auto_545940 ) ( ON ?auto_545941 ?auto_545942 ) ( ON ?auto_545943 ?auto_545941 ) ( ON ?auto_545944 ?auto_545943 ) ( ON ?auto_545945 ?auto_545944 ) ( not ( = ?auto_545937 ?auto_545938 ) ) ( not ( = ?auto_545937 ?auto_545939 ) ) ( not ( = ?auto_545937 ?auto_545936 ) ) ( not ( = ?auto_545937 ?auto_545940 ) ) ( not ( = ?auto_545937 ?auto_545942 ) ) ( not ( = ?auto_545937 ?auto_545941 ) ) ( not ( = ?auto_545937 ?auto_545943 ) ) ( not ( = ?auto_545937 ?auto_545944 ) ) ( not ( = ?auto_545937 ?auto_545945 ) ) ( not ( = ?auto_545937 ?auto_545946 ) ) ( not ( = ?auto_545937 ?auto_545947 ) ) ( not ( = ?auto_545937 ?auto_545949 ) ) ( not ( = ?auto_545938 ?auto_545939 ) ) ( not ( = ?auto_545938 ?auto_545936 ) ) ( not ( = ?auto_545938 ?auto_545940 ) ) ( not ( = ?auto_545938 ?auto_545942 ) ) ( not ( = ?auto_545938 ?auto_545941 ) ) ( not ( = ?auto_545938 ?auto_545943 ) ) ( not ( = ?auto_545938 ?auto_545944 ) ) ( not ( = ?auto_545938 ?auto_545945 ) ) ( not ( = ?auto_545938 ?auto_545946 ) ) ( not ( = ?auto_545938 ?auto_545947 ) ) ( not ( = ?auto_545938 ?auto_545949 ) ) ( not ( = ?auto_545939 ?auto_545936 ) ) ( not ( = ?auto_545939 ?auto_545940 ) ) ( not ( = ?auto_545939 ?auto_545942 ) ) ( not ( = ?auto_545939 ?auto_545941 ) ) ( not ( = ?auto_545939 ?auto_545943 ) ) ( not ( = ?auto_545939 ?auto_545944 ) ) ( not ( = ?auto_545939 ?auto_545945 ) ) ( not ( = ?auto_545939 ?auto_545946 ) ) ( not ( = ?auto_545939 ?auto_545947 ) ) ( not ( = ?auto_545939 ?auto_545949 ) ) ( not ( = ?auto_545936 ?auto_545940 ) ) ( not ( = ?auto_545936 ?auto_545942 ) ) ( not ( = ?auto_545936 ?auto_545941 ) ) ( not ( = ?auto_545936 ?auto_545943 ) ) ( not ( = ?auto_545936 ?auto_545944 ) ) ( not ( = ?auto_545936 ?auto_545945 ) ) ( not ( = ?auto_545936 ?auto_545946 ) ) ( not ( = ?auto_545936 ?auto_545947 ) ) ( not ( = ?auto_545936 ?auto_545949 ) ) ( not ( = ?auto_545940 ?auto_545942 ) ) ( not ( = ?auto_545940 ?auto_545941 ) ) ( not ( = ?auto_545940 ?auto_545943 ) ) ( not ( = ?auto_545940 ?auto_545944 ) ) ( not ( = ?auto_545940 ?auto_545945 ) ) ( not ( = ?auto_545940 ?auto_545946 ) ) ( not ( = ?auto_545940 ?auto_545947 ) ) ( not ( = ?auto_545940 ?auto_545949 ) ) ( not ( = ?auto_545942 ?auto_545941 ) ) ( not ( = ?auto_545942 ?auto_545943 ) ) ( not ( = ?auto_545942 ?auto_545944 ) ) ( not ( = ?auto_545942 ?auto_545945 ) ) ( not ( = ?auto_545942 ?auto_545946 ) ) ( not ( = ?auto_545942 ?auto_545947 ) ) ( not ( = ?auto_545942 ?auto_545949 ) ) ( not ( = ?auto_545941 ?auto_545943 ) ) ( not ( = ?auto_545941 ?auto_545944 ) ) ( not ( = ?auto_545941 ?auto_545945 ) ) ( not ( = ?auto_545941 ?auto_545946 ) ) ( not ( = ?auto_545941 ?auto_545947 ) ) ( not ( = ?auto_545941 ?auto_545949 ) ) ( not ( = ?auto_545943 ?auto_545944 ) ) ( not ( = ?auto_545943 ?auto_545945 ) ) ( not ( = ?auto_545943 ?auto_545946 ) ) ( not ( = ?auto_545943 ?auto_545947 ) ) ( not ( = ?auto_545943 ?auto_545949 ) ) ( not ( = ?auto_545944 ?auto_545945 ) ) ( not ( = ?auto_545944 ?auto_545946 ) ) ( not ( = ?auto_545944 ?auto_545947 ) ) ( not ( = ?auto_545944 ?auto_545949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545945 ?auto_545946 ?auto_545947 )
      ( MAKE-11CRATE-VERIFY ?auto_545937 ?auto_545938 ?auto_545939 ?auto_545936 ?auto_545940 ?auto_545942 ?auto_545941 ?auto_545943 ?auto_545944 ?auto_545945 ?auto_545946 ?auto_545947 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_546081 - SURFACE
      ?auto_546082 - SURFACE
      ?auto_546083 - SURFACE
      ?auto_546080 - SURFACE
      ?auto_546084 - SURFACE
      ?auto_546086 - SURFACE
      ?auto_546085 - SURFACE
      ?auto_546087 - SURFACE
      ?auto_546088 - SURFACE
      ?auto_546089 - SURFACE
      ?auto_546090 - SURFACE
      ?auto_546091 - SURFACE
    )
    :vars
    (
      ?auto_546093 - HOIST
      ?auto_546092 - PLACE
      ?auto_546096 - PLACE
      ?auto_546094 - HOIST
      ?auto_546097 - SURFACE
      ?auto_546095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_546093 ?auto_546092 ) ( IS-CRATE ?auto_546091 ) ( not ( = ?auto_546090 ?auto_546091 ) ) ( not ( = ?auto_546089 ?auto_546090 ) ) ( not ( = ?auto_546089 ?auto_546091 ) ) ( not ( = ?auto_546096 ?auto_546092 ) ) ( HOIST-AT ?auto_546094 ?auto_546096 ) ( not ( = ?auto_546093 ?auto_546094 ) ) ( AVAILABLE ?auto_546094 ) ( SURFACE-AT ?auto_546091 ?auto_546096 ) ( ON ?auto_546091 ?auto_546097 ) ( CLEAR ?auto_546091 ) ( not ( = ?auto_546090 ?auto_546097 ) ) ( not ( = ?auto_546091 ?auto_546097 ) ) ( not ( = ?auto_546089 ?auto_546097 ) ) ( TRUCK-AT ?auto_546095 ?auto_546092 ) ( SURFACE-AT ?auto_546089 ?auto_546092 ) ( CLEAR ?auto_546089 ) ( LIFTING ?auto_546093 ?auto_546090 ) ( IS-CRATE ?auto_546090 ) ( ON ?auto_546082 ?auto_546081 ) ( ON ?auto_546083 ?auto_546082 ) ( ON ?auto_546080 ?auto_546083 ) ( ON ?auto_546084 ?auto_546080 ) ( ON ?auto_546086 ?auto_546084 ) ( ON ?auto_546085 ?auto_546086 ) ( ON ?auto_546087 ?auto_546085 ) ( ON ?auto_546088 ?auto_546087 ) ( ON ?auto_546089 ?auto_546088 ) ( not ( = ?auto_546081 ?auto_546082 ) ) ( not ( = ?auto_546081 ?auto_546083 ) ) ( not ( = ?auto_546081 ?auto_546080 ) ) ( not ( = ?auto_546081 ?auto_546084 ) ) ( not ( = ?auto_546081 ?auto_546086 ) ) ( not ( = ?auto_546081 ?auto_546085 ) ) ( not ( = ?auto_546081 ?auto_546087 ) ) ( not ( = ?auto_546081 ?auto_546088 ) ) ( not ( = ?auto_546081 ?auto_546089 ) ) ( not ( = ?auto_546081 ?auto_546090 ) ) ( not ( = ?auto_546081 ?auto_546091 ) ) ( not ( = ?auto_546081 ?auto_546097 ) ) ( not ( = ?auto_546082 ?auto_546083 ) ) ( not ( = ?auto_546082 ?auto_546080 ) ) ( not ( = ?auto_546082 ?auto_546084 ) ) ( not ( = ?auto_546082 ?auto_546086 ) ) ( not ( = ?auto_546082 ?auto_546085 ) ) ( not ( = ?auto_546082 ?auto_546087 ) ) ( not ( = ?auto_546082 ?auto_546088 ) ) ( not ( = ?auto_546082 ?auto_546089 ) ) ( not ( = ?auto_546082 ?auto_546090 ) ) ( not ( = ?auto_546082 ?auto_546091 ) ) ( not ( = ?auto_546082 ?auto_546097 ) ) ( not ( = ?auto_546083 ?auto_546080 ) ) ( not ( = ?auto_546083 ?auto_546084 ) ) ( not ( = ?auto_546083 ?auto_546086 ) ) ( not ( = ?auto_546083 ?auto_546085 ) ) ( not ( = ?auto_546083 ?auto_546087 ) ) ( not ( = ?auto_546083 ?auto_546088 ) ) ( not ( = ?auto_546083 ?auto_546089 ) ) ( not ( = ?auto_546083 ?auto_546090 ) ) ( not ( = ?auto_546083 ?auto_546091 ) ) ( not ( = ?auto_546083 ?auto_546097 ) ) ( not ( = ?auto_546080 ?auto_546084 ) ) ( not ( = ?auto_546080 ?auto_546086 ) ) ( not ( = ?auto_546080 ?auto_546085 ) ) ( not ( = ?auto_546080 ?auto_546087 ) ) ( not ( = ?auto_546080 ?auto_546088 ) ) ( not ( = ?auto_546080 ?auto_546089 ) ) ( not ( = ?auto_546080 ?auto_546090 ) ) ( not ( = ?auto_546080 ?auto_546091 ) ) ( not ( = ?auto_546080 ?auto_546097 ) ) ( not ( = ?auto_546084 ?auto_546086 ) ) ( not ( = ?auto_546084 ?auto_546085 ) ) ( not ( = ?auto_546084 ?auto_546087 ) ) ( not ( = ?auto_546084 ?auto_546088 ) ) ( not ( = ?auto_546084 ?auto_546089 ) ) ( not ( = ?auto_546084 ?auto_546090 ) ) ( not ( = ?auto_546084 ?auto_546091 ) ) ( not ( = ?auto_546084 ?auto_546097 ) ) ( not ( = ?auto_546086 ?auto_546085 ) ) ( not ( = ?auto_546086 ?auto_546087 ) ) ( not ( = ?auto_546086 ?auto_546088 ) ) ( not ( = ?auto_546086 ?auto_546089 ) ) ( not ( = ?auto_546086 ?auto_546090 ) ) ( not ( = ?auto_546086 ?auto_546091 ) ) ( not ( = ?auto_546086 ?auto_546097 ) ) ( not ( = ?auto_546085 ?auto_546087 ) ) ( not ( = ?auto_546085 ?auto_546088 ) ) ( not ( = ?auto_546085 ?auto_546089 ) ) ( not ( = ?auto_546085 ?auto_546090 ) ) ( not ( = ?auto_546085 ?auto_546091 ) ) ( not ( = ?auto_546085 ?auto_546097 ) ) ( not ( = ?auto_546087 ?auto_546088 ) ) ( not ( = ?auto_546087 ?auto_546089 ) ) ( not ( = ?auto_546087 ?auto_546090 ) ) ( not ( = ?auto_546087 ?auto_546091 ) ) ( not ( = ?auto_546087 ?auto_546097 ) ) ( not ( = ?auto_546088 ?auto_546089 ) ) ( not ( = ?auto_546088 ?auto_546090 ) ) ( not ( = ?auto_546088 ?auto_546091 ) ) ( not ( = ?auto_546088 ?auto_546097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_546089 ?auto_546090 ?auto_546091 )
      ( MAKE-11CRATE-VERIFY ?auto_546081 ?auto_546082 ?auto_546083 ?auto_546080 ?auto_546084 ?auto_546086 ?auto_546085 ?auto_546087 ?auto_546088 ?auto_546089 ?auto_546090 ?auto_546091 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_546225 - SURFACE
      ?auto_546226 - SURFACE
      ?auto_546227 - SURFACE
      ?auto_546224 - SURFACE
      ?auto_546228 - SURFACE
      ?auto_546230 - SURFACE
      ?auto_546229 - SURFACE
      ?auto_546231 - SURFACE
      ?auto_546232 - SURFACE
      ?auto_546233 - SURFACE
      ?auto_546234 - SURFACE
      ?auto_546235 - SURFACE
    )
    :vars
    (
      ?auto_546241 - HOIST
      ?auto_546238 - PLACE
      ?auto_546240 - PLACE
      ?auto_546237 - HOIST
      ?auto_546239 - SURFACE
      ?auto_546236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_546241 ?auto_546238 ) ( IS-CRATE ?auto_546235 ) ( not ( = ?auto_546234 ?auto_546235 ) ) ( not ( = ?auto_546233 ?auto_546234 ) ) ( not ( = ?auto_546233 ?auto_546235 ) ) ( not ( = ?auto_546240 ?auto_546238 ) ) ( HOIST-AT ?auto_546237 ?auto_546240 ) ( not ( = ?auto_546241 ?auto_546237 ) ) ( AVAILABLE ?auto_546237 ) ( SURFACE-AT ?auto_546235 ?auto_546240 ) ( ON ?auto_546235 ?auto_546239 ) ( CLEAR ?auto_546235 ) ( not ( = ?auto_546234 ?auto_546239 ) ) ( not ( = ?auto_546235 ?auto_546239 ) ) ( not ( = ?auto_546233 ?auto_546239 ) ) ( TRUCK-AT ?auto_546236 ?auto_546238 ) ( SURFACE-AT ?auto_546233 ?auto_546238 ) ( CLEAR ?auto_546233 ) ( IS-CRATE ?auto_546234 ) ( AVAILABLE ?auto_546241 ) ( IN ?auto_546234 ?auto_546236 ) ( ON ?auto_546226 ?auto_546225 ) ( ON ?auto_546227 ?auto_546226 ) ( ON ?auto_546224 ?auto_546227 ) ( ON ?auto_546228 ?auto_546224 ) ( ON ?auto_546230 ?auto_546228 ) ( ON ?auto_546229 ?auto_546230 ) ( ON ?auto_546231 ?auto_546229 ) ( ON ?auto_546232 ?auto_546231 ) ( ON ?auto_546233 ?auto_546232 ) ( not ( = ?auto_546225 ?auto_546226 ) ) ( not ( = ?auto_546225 ?auto_546227 ) ) ( not ( = ?auto_546225 ?auto_546224 ) ) ( not ( = ?auto_546225 ?auto_546228 ) ) ( not ( = ?auto_546225 ?auto_546230 ) ) ( not ( = ?auto_546225 ?auto_546229 ) ) ( not ( = ?auto_546225 ?auto_546231 ) ) ( not ( = ?auto_546225 ?auto_546232 ) ) ( not ( = ?auto_546225 ?auto_546233 ) ) ( not ( = ?auto_546225 ?auto_546234 ) ) ( not ( = ?auto_546225 ?auto_546235 ) ) ( not ( = ?auto_546225 ?auto_546239 ) ) ( not ( = ?auto_546226 ?auto_546227 ) ) ( not ( = ?auto_546226 ?auto_546224 ) ) ( not ( = ?auto_546226 ?auto_546228 ) ) ( not ( = ?auto_546226 ?auto_546230 ) ) ( not ( = ?auto_546226 ?auto_546229 ) ) ( not ( = ?auto_546226 ?auto_546231 ) ) ( not ( = ?auto_546226 ?auto_546232 ) ) ( not ( = ?auto_546226 ?auto_546233 ) ) ( not ( = ?auto_546226 ?auto_546234 ) ) ( not ( = ?auto_546226 ?auto_546235 ) ) ( not ( = ?auto_546226 ?auto_546239 ) ) ( not ( = ?auto_546227 ?auto_546224 ) ) ( not ( = ?auto_546227 ?auto_546228 ) ) ( not ( = ?auto_546227 ?auto_546230 ) ) ( not ( = ?auto_546227 ?auto_546229 ) ) ( not ( = ?auto_546227 ?auto_546231 ) ) ( not ( = ?auto_546227 ?auto_546232 ) ) ( not ( = ?auto_546227 ?auto_546233 ) ) ( not ( = ?auto_546227 ?auto_546234 ) ) ( not ( = ?auto_546227 ?auto_546235 ) ) ( not ( = ?auto_546227 ?auto_546239 ) ) ( not ( = ?auto_546224 ?auto_546228 ) ) ( not ( = ?auto_546224 ?auto_546230 ) ) ( not ( = ?auto_546224 ?auto_546229 ) ) ( not ( = ?auto_546224 ?auto_546231 ) ) ( not ( = ?auto_546224 ?auto_546232 ) ) ( not ( = ?auto_546224 ?auto_546233 ) ) ( not ( = ?auto_546224 ?auto_546234 ) ) ( not ( = ?auto_546224 ?auto_546235 ) ) ( not ( = ?auto_546224 ?auto_546239 ) ) ( not ( = ?auto_546228 ?auto_546230 ) ) ( not ( = ?auto_546228 ?auto_546229 ) ) ( not ( = ?auto_546228 ?auto_546231 ) ) ( not ( = ?auto_546228 ?auto_546232 ) ) ( not ( = ?auto_546228 ?auto_546233 ) ) ( not ( = ?auto_546228 ?auto_546234 ) ) ( not ( = ?auto_546228 ?auto_546235 ) ) ( not ( = ?auto_546228 ?auto_546239 ) ) ( not ( = ?auto_546230 ?auto_546229 ) ) ( not ( = ?auto_546230 ?auto_546231 ) ) ( not ( = ?auto_546230 ?auto_546232 ) ) ( not ( = ?auto_546230 ?auto_546233 ) ) ( not ( = ?auto_546230 ?auto_546234 ) ) ( not ( = ?auto_546230 ?auto_546235 ) ) ( not ( = ?auto_546230 ?auto_546239 ) ) ( not ( = ?auto_546229 ?auto_546231 ) ) ( not ( = ?auto_546229 ?auto_546232 ) ) ( not ( = ?auto_546229 ?auto_546233 ) ) ( not ( = ?auto_546229 ?auto_546234 ) ) ( not ( = ?auto_546229 ?auto_546235 ) ) ( not ( = ?auto_546229 ?auto_546239 ) ) ( not ( = ?auto_546231 ?auto_546232 ) ) ( not ( = ?auto_546231 ?auto_546233 ) ) ( not ( = ?auto_546231 ?auto_546234 ) ) ( not ( = ?auto_546231 ?auto_546235 ) ) ( not ( = ?auto_546231 ?auto_546239 ) ) ( not ( = ?auto_546232 ?auto_546233 ) ) ( not ( = ?auto_546232 ?auto_546234 ) ) ( not ( = ?auto_546232 ?auto_546235 ) ) ( not ( = ?auto_546232 ?auto_546239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_546233 ?auto_546234 ?auto_546235 )
      ( MAKE-11CRATE-VERIFY ?auto_546225 ?auto_546226 ?auto_546227 ?auto_546224 ?auto_546228 ?auto_546230 ?auto_546229 ?auto_546231 ?auto_546232 ?auto_546233 ?auto_546234 ?auto_546235 ) )
  )

)

