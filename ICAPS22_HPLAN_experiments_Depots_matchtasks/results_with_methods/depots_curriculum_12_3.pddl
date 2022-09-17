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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12292 - SURFACE
      ?auto_12293 - SURFACE
    )
    :vars
    (
      ?auto_12294 - HOIST
      ?auto_12295 - PLACE
      ?auto_12297 - PLACE
      ?auto_12298 - HOIST
      ?auto_12299 - SURFACE
      ?auto_12296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12294 ?auto_12295 ) ( SURFACE-AT ?auto_12292 ?auto_12295 ) ( CLEAR ?auto_12292 ) ( IS-CRATE ?auto_12293 ) ( AVAILABLE ?auto_12294 ) ( not ( = ?auto_12297 ?auto_12295 ) ) ( HOIST-AT ?auto_12298 ?auto_12297 ) ( AVAILABLE ?auto_12298 ) ( SURFACE-AT ?auto_12293 ?auto_12297 ) ( ON ?auto_12293 ?auto_12299 ) ( CLEAR ?auto_12293 ) ( TRUCK-AT ?auto_12296 ?auto_12295 ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12299 ) ) ( not ( = ?auto_12293 ?auto_12299 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12296 ?auto_12295 ?auto_12297 )
      ( !LIFT ?auto_12298 ?auto_12293 ?auto_12299 ?auto_12297 )
      ( !LOAD ?auto_12298 ?auto_12293 ?auto_12296 ?auto_12297 )
      ( !DRIVE ?auto_12296 ?auto_12297 ?auto_12295 )
      ( !UNLOAD ?auto_12294 ?auto_12293 ?auto_12296 ?auto_12295 )
      ( !DROP ?auto_12294 ?auto_12293 ?auto_12292 ?auto_12295 )
      ( MAKE-1CRATE-VERIFY ?auto_12292 ?auto_12293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12302 - SURFACE
      ?auto_12303 - SURFACE
    )
    :vars
    (
      ?auto_12304 - HOIST
      ?auto_12305 - PLACE
      ?auto_12307 - PLACE
      ?auto_12308 - HOIST
      ?auto_12309 - SURFACE
      ?auto_12306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12304 ?auto_12305 ) ( SURFACE-AT ?auto_12302 ?auto_12305 ) ( CLEAR ?auto_12302 ) ( IS-CRATE ?auto_12303 ) ( AVAILABLE ?auto_12304 ) ( not ( = ?auto_12307 ?auto_12305 ) ) ( HOIST-AT ?auto_12308 ?auto_12307 ) ( AVAILABLE ?auto_12308 ) ( SURFACE-AT ?auto_12303 ?auto_12307 ) ( ON ?auto_12303 ?auto_12309 ) ( CLEAR ?auto_12303 ) ( TRUCK-AT ?auto_12306 ?auto_12305 ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( not ( = ?auto_12302 ?auto_12309 ) ) ( not ( = ?auto_12303 ?auto_12309 ) ) ( not ( = ?auto_12304 ?auto_12308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12306 ?auto_12305 ?auto_12307 )
      ( !LIFT ?auto_12308 ?auto_12303 ?auto_12309 ?auto_12307 )
      ( !LOAD ?auto_12308 ?auto_12303 ?auto_12306 ?auto_12307 )
      ( !DRIVE ?auto_12306 ?auto_12307 ?auto_12305 )
      ( !UNLOAD ?auto_12304 ?auto_12303 ?auto_12306 ?auto_12305 )
      ( !DROP ?auto_12304 ?auto_12303 ?auto_12302 ?auto_12305 )
      ( MAKE-1CRATE-VERIFY ?auto_12302 ?auto_12303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12313 - SURFACE
      ?auto_12314 - SURFACE
      ?auto_12315 - SURFACE
    )
    :vars
    (
      ?auto_12321 - HOIST
      ?auto_12316 - PLACE
      ?auto_12320 - PLACE
      ?auto_12318 - HOIST
      ?auto_12319 - SURFACE
      ?auto_12322 - PLACE
      ?auto_12324 - HOIST
      ?auto_12323 - SURFACE
      ?auto_12317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12321 ?auto_12316 ) ( IS-CRATE ?auto_12315 ) ( not ( = ?auto_12320 ?auto_12316 ) ) ( HOIST-AT ?auto_12318 ?auto_12320 ) ( AVAILABLE ?auto_12318 ) ( SURFACE-AT ?auto_12315 ?auto_12320 ) ( ON ?auto_12315 ?auto_12319 ) ( CLEAR ?auto_12315 ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12319 ) ) ( not ( = ?auto_12315 ?auto_12319 ) ) ( not ( = ?auto_12321 ?auto_12318 ) ) ( SURFACE-AT ?auto_12313 ?auto_12316 ) ( CLEAR ?auto_12313 ) ( IS-CRATE ?auto_12314 ) ( AVAILABLE ?auto_12321 ) ( not ( = ?auto_12322 ?auto_12316 ) ) ( HOIST-AT ?auto_12324 ?auto_12322 ) ( AVAILABLE ?auto_12324 ) ( SURFACE-AT ?auto_12314 ?auto_12322 ) ( ON ?auto_12314 ?auto_12323 ) ( CLEAR ?auto_12314 ) ( TRUCK-AT ?auto_12317 ?auto_12316 ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( not ( = ?auto_12313 ?auto_12323 ) ) ( not ( = ?auto_12314 ?auto_12323 ) ) ( not ( = ?auto_12321 ?auto_12324 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12319 ) ) ( not ( = ?auto_12315 ?auto_12323 ) ) ( not ( = ?auto_12320 ?auto_12322 ) ) ( not ( = ?auto_12318 ?auto_12324 ) ) ( not ( = ?auto_12319 ?auto_12323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12313 ?auto_12314 )
      ( MAKE-1CRATE ?auto_12314 ?auto_12315 )
      ( MAKE-2CRATE-VERIFY ?auto_12313 ?auto_12314 ?auto_12315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12327 - SURFACE
      ?auto_12328 - SURFACE
    )
    :vars
    (
      ?auto_12329 - HOIST
      ?auto_12330 - PLACE
      ?auto_12332 - PLACE
      ?auto_12333 - HOIST
      ?auto_12334 - SURFACE
      ?auto_12331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12329 ?auto_12330 ) ( SURFACE-AT ?auto_12327 ?auto_12330 ) ( CLEAR ?auto_12327 ) ( IS-CRATE ?auto_12328 ) ( AVAILABLE ?auto_12329 ) ( not ( = ?auto_12332 ?auto_12330 ) ) ( HOIST-AT ?auto_12333 ?auto_12332 ) ( AVAILABLE ?auto_12333 ) ( SURFACE-AT ?auto_12328 ?auto_12332 ) ( ON ?auto_12328 ?auto_12334 ) ( CLEAR ?auto_12328 ) ( TRUCK-AT ?auto_12331 ?auto_12330 ) ( not ( = ?auto_12327 ?auto_12328 ) ) ( not ( = ?auto_12327 ?auto_12334 ) ) ( not ( = ?auto_12328 ?auto_12334 ) ) ( not ( = ?auto_12329 ?auto_12333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12331 ?auto_12330 ?auto_12332 )
      ( !LIFT ?auto_12333 ?auto_12328 ?auto_12334 ?auto_12332 )
      ( !LOAD ?auto_12333 ?auto_12328 ?auto_12331 ?auto_12332 )
      ( !DRIVE ?auto_12331 ?auto_12332 ?auto_12330 )
      ( !UNLOAD ?auto_12329 ?auto_12328 ?auto_12331 ?auto_12330 )
      ( !DROP ?auto_12329 ?auto_12328 ?auto_12327 ?auto_12330 )
      ( MAKE-1CRATE-VERIFY ?auto_12327 ?auto_12328 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12339 - SURFACE
      ?auto_12340 - SURFACE
      ?auto_12341 - SURFACE
      ?auto_12342 - SURFACE
    )
    :vars
    (
      ?auto_12343 - HOIST
      ?auto_12348 - PLACE
      ?auto_12344 - PLACE
      ?auto_12345 - HOIST
      ?auto_12347 - SURFACE
      ?auto_12351 - PLACE
      ?auto_12354 - HOIST
      ?auto_12349 - SURFACE
      ?auto_12352 - PLACE
      ?auto_12350 - HOIST
      ?auto_12353 - SURFACE
      ?auto_12346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12343 ?auto_12348 ) ( IS-CRATE ?auto_12342 ) ( not ( = ?auto_12344 ?auto_12348 ) ) ( HOIST-AT ?auto_12345 ?auto_12344 ) ( AVAILABLE ?auto_12345 ) ( SURFACE-AT ?auto_12342 ?auto_12344 ) ( ON ?auto_12342 ?auto_12347 ) ( CLEAR ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12341 ?auto_12347 ) ) ( not ( = ?auto_12342 ?auto_12347 ) ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( IS-CRATE ?auto_12341 ) ( not ( = ?auto_12351 ?auto_12348 ) ) ( HOIST-AT ?auto_12354 ?auto_12351 ) ( AVAILABLE ?auto_12354 ) ( SURFACE-AT ?auto_12341 ?auto_12351 ) ( ON ?auto_12341 ?auto_12349 ) ( CLEAR ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12341 ) ) ( not ( = ?auto_12340 ?auto_12349 ) ) ( not ( = ?auto_12341 ?auto_12349 ) ) ( not ( = ?auto_12343 ?auto_12354 ) ) ( SURFACE-AT ?auto_12339 ?auto_12348 ) ( CLEAR ?auto_12339 ) ( IS-CRATE ?auto_12340 ) ( AVAILABLE ?auto_12343 ) ( not ( = ?auto_12352 ?auto_12348 ) ) ( HOIST-AT ?auto_12350 ?auto_12352 ) ( AVAILABLE ?auto_12350 ) ( SURFACE-AT ?auto_12340 ?auto_12352 ) ( ON ?auto_12340 ?auto_12353 ) ( CLEAR ?auto_12340 ) ( TRUCK-AT ?auto_12346 ?auto_12348 ) ( not ( = ?auto_12339 ?auto_12340 ) ) ( not ( = ?auto_12339 ?auto_12353 ) ) ( not ( = ?auto_12340 ?auto_12353 ) ) ( not ( = ?auto_12343 ?auto_12350 ) ) ( not ( = ?auto_12339 ?auto_12341 ) ) ( not ( = ?auto_12339 ?auto_12349 ) ) ( not ( = ?auto_12341 ?auto_12353 ) ) ( not ( = ?auto_12351 ?auto_12352 ) ) ( not ( = ?auto_12354 ?auto_12350 ) ) ( not ( = ?auto_12349 ?auto_12353 ) ) ( not ( = ?auto_12339 ?auto_12342 ) ) ( not ( = ?auto_12339 ?auto_12347 ) ) ( not ( = ?auto_12340 ?auto_12342 ) ) ( not ( = ?auto_12340 ?auto_12347 ) ) ( not ( = ?auto_12342 ?auto_12349 ) ) ( not ( = ?auto_12342 ?auto_12353 ) ) ( not ( = ?auto_12344 ?auto_12351 ) ) ( not ( = ?auto_12344 ?auto_12352 ) ) ( not ( = ?auto_12345 ?auto_12354 ) ) ( not ( = ?auto_12345 ?auto_12350 ) ) ( not ( = ?auto_12347 ?auto_12349 ) ) ( not ( = ?auto_12347 ?auto_12353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12339 ?auto_12340 ?auto_12341 )
      ( MAKE-1CRATE ?auto_12341 ?auto_12342 )
      ( MAKE-3CRATE-VERIFY ?auto_12339 ?auto_12340 ?auto_12341 ?auto_12342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12357 - SURFACE
      ?auto_12358 - SURFACE
    )
    :vars
    (
      ?auto_12359 - HOIST
      ?auto_12360 - PLACE
      ?auto_12362 - PLACE
      ?auto_12363 - HOIST
      ?auto_12364 - SURFACE
      ?auto_12361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12359 ?auto_12360 ) ( SURFACE-AT ?auto_12357 ?auto_12360 ) ( CLEAR ?auto_12357 ) ( IS-CRATE ?auto_12358 ) ( AVAILABLE ?auto_12359 ) ( not ( = ?auto_12362 ?auto_12360 ) ) ( HOIST-AT ?auto_12363 ?auto_12362 ) ( AVAILABLE ?auto_12363 ) ( SURFACE-AT ?auto_12358 ?auto_12362 ) ( ON ?auto_12358 ?auto_12364 ) ( CLEAR ?auto_12358 ) ( TRUCK-AT ?auto_12361 ?auto_12360 ) ( not ( = ?auto_12357 ?auto_12358 ) ) ( not ( = ?auto_12357 ?auto_12364 ) ) ( not ( = ?auto_12358 ?auto_12364 ) ) ( not ( = ?auto_12359 ?auto_12363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12361 ?auto_12360 ?auto_12362 )
      ( !LIFT ?auto_12363 ?auto_12358 ?auto_12364 ?auto_12362 )
      ( !LOAD ?auto_12363 ?auto_12358 ?auto_12361 ?auto_12362 )
      ( !DRIVE ?auto_12361 ?auto_12362 ?auto_12360 )
      ( !UNLOAD ?auto_12359 ?auto_12358 ?auto_12361 ?auto_12360 )
      ( !DROP ?auto_12359 ?auto_12358 ?auto_12357 ?auto_12360 )
      ( MAKE-1CRATE-VERIFY ?auto_12357 ?auto_12358 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12370 - SURFACE
      ?auto_12371 - SURFACE
      ?auto_12372 - SURFACE
      ?auto_12373 - SURFACE
      ?auto_12374 - SURFACE
    )
    :vars
    (
      ?auto_12375 - HOIST
      ?auto_12377 - PLACE
      ?auto_12376 - PLACE
      ?auto_12380 - HOIST
      ?auto_12378 - SURFACE
      ?auto_12386 - PLACE
      ?auto_12384 - HOIST
      ?auto_12385 - SURFACE
      ?auto_12382 - PLACE
      ?auto_12388 - HOIST
      ?auto_12381 - SURFACE
      ?auto_12389 - PLACE
      ?auto_12383 - HOIST
      ?auto_12387 - SURFACE
      ?auto_12379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12375 ?auto_12377 ) ( IS-CRATE ?auto_12374 ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( HOIST-AT ?auto_12380 ?auto_12376 ) ( AVAILABLE ?auto_12380 ) ( SURFACE-AT ?auto_12374 ?auto_12376 ) ( ON ?auto_12374 ?auto_12378 ) ( CLEAR ?auto_12374 ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12373 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( not ( = ?auto_12375 ?auto_12380 ) ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12386 ?auto_12377 ) ) ( HOIST-AT ?auto_12384 ?auto_12386 ) ( AVAILABLE ?auto_12384 ) ( SURFACE-AT ?auto_12373 ?auto_12386 ) ( ON ?auto_12373 ?auto_12385 ) ( CLEAR ?auto_12373 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( not ( = ?auto_12372 ?auto_12385 ) ) ( not ( = ?auto_12373 ?auto_12385 ) ) ( not ( = ?auto_12375 ?auto_12384 ) ) ( IS-CRATE ?auto_12372 ) ( not ( = ?auto_12382 ?auto_12377 ) ) ( HOIST-AT ?auto_12388 ?auto_12382 ) ( AVAILABLE ?auto_12388 ) ( SURFACE-AT ?auto_12372 ?auto_12382 ) ( ON ?auto_12372 ?auto_12381 ) ( CLEAR ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12381 ) ) ( not ( = ?auto_12375 ?auto_12388 ) ) ( SURFACE-AT ?auto_12370 ?auto_12377 ) ( CLEAR ?auto_12370 ) ( IS-CRATE ?auto_12371 ) ( AVAILABLE ?auto_12375 ) ( not ( = ?auto_12389 ?auto_12377 ) ) ( HOIST-AT ?auto_12383 ?auto_12389 ) ( AVAILABLE ?auto_12383 ) ( SURFACE-AT ?auto_12371 ?auto_12389 ) ( ON ?auto_12371 ?auto_12387 ) ( CLEAR ?auto_12371 ) ( TRUCK-AT ?auto_12379 ?auto_12377 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12387 ) ) ( not ( = ?auto_12371 ?auto_12387 ) ) ( not ( = ?auto_12375 ?auto_12383 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12387 ) ) ( not ( = ?auto_12382 ?auto_12389 ) ) ( not ( = ?auto_12388 ?auto_12383 ) ) ( not ( = ?auto_12381 ?auto_12387 ) ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12370 ?auto_12385 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) ( not ( = ?auto_12371 ?auto_12385 ) ) ( not ( = ?auto_12373 ?auto_12381 ) ) ( not ( = ?auto_12373 ?auto_12387 ) ) ( not ( = ?auto_12386 ?auto_12382 ) ) ( not ( = ?auto_12386 ?auto_12389 ) ) ( not ( = ?auto_12384 ?auto_12388 ) ) ( not ( = ?auto_12384 ?auto_12383 ) ) ( not ( = ?auto_12385 ?auto_12381 ) ) ( not ( = ?auto_12385 ?auto_12387 ) ) ( not ( = ?auto_12370 ?auto_12374 ) ) ( not ( = ?auto_12370 ?auto_12378 ) ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12371 ?auto_12378 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12385 ) ) ( not ( = ?auto_12374 ?auto_12381 ) ) ( not ( = ?auto_12374 ?auto_12387 ) ) ( not ( = ?auto_12376 ?auto_12386 ) ) ( not ( = ?auto_12376 ?auto_12382 ) ) ( not ( = ?auto_12376 ?auto_12389 ) ) ( not ( = ?auto_12380 ?auto_12384 ) ) ( not ( = ?auto_12380 ?auto_12388 ) ) ( not ( = ?auto_12380 ?auto_12383 ) ) ( not ( = ?auto_12378 ?auto_12385 ) ) ( not ( = ?auto_12378 ?auto_12381 ) ) ( not ( = ?auto_12378 ?auto_12387 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 )
      ( MAKE-1CRATE ?auto_12373 ?auto_12374 )
      ( MAKE-4CRATE-VERIFY ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12392 - SURFACE
      ?auto_12393 - SURFACE
    )
    :vars
    (
      ?auto_12394 - HOIST
      ?auto_12395 - PLACE
      ?auto_12397 - PLACE
      ?auto_12398 - HOIST
      ?auto_12399 - SURFACE
      ?auto_12396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12394 ?auto_12395 ) ( SURFACE-AT ?auto_12392 ?auto_12395 ) ( CLEAR ?auto_12392 ) ( IS-CRATE ?auto_12393 ) ( AVAILABLE ?auto_12394 ) ( not ( = ?auto_12397 ?auto_12395 ) ) ( HOIST-AT ?auto_12398 ?auto_12397 ) ( AVAILABLE ?auto_12398 ) ( SURFACE-AT ?auto_12393 ?auto_12397 ) ( ON ?auto_12393 ?auto_12399 ) ( CLEAR ?auto_12393 ) ( TRUCK-AT ?auto_12396 ?auto_12395 ) ( not ( = ?auto_12392 ?auto_12393 ) ) ( not ( = ?auto_12392 ?auto_12399 ) ) ( not ( = ?auto_12393 ?auto_12399 ) ) ( not ( = ?auto_12394 ?auto_12398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12396 ?auto_12395 ?auto_12397 )
      ( !LIFT ?auto_12398 ?auto_12393 ?auto_12399 ?auto_12397 )
      ( !LOAD ?auto_12398 ?auto_12393 ?auto_12396 ?auto_12397 )
      ( !DRIVE ?auto_12396 ?auto_12397 ?auto_12395 )
      ( !UNLOAD ?auto_12394 ?auto_12393 ?auto_12396 ?auto_12395 )
      ( !DROP ?auto_12394 ?auto_12393 ?auto_12392 ?auto_12395 )
      ( MAKE-1CRATE-VERIFY ?auto_12392 ?auto_12393 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12406 - SURFACE
      ?auto_12407 - SURFACE
      ?auto_12408 - SURFACE
      ?auto_12409 - SURFACE
      ?auto_12410 - SURFACE
      ?auto_12411 - SURFACE
    )
    :vars
    (
      ?auto_12413 - HOIST
      ?auto_12414 - PLACE
      ?auto_12417 - PLACE
      ?auto_12415 - HOIST
      ?auto_12412 - SURFACE
      ?auto_12427 - PLACE
      ?auto_12426 - HOIST
      ?auto_12423 - SURFACE
      ?auto_12418 - PLACE
      ?auto_12422 - HOIST
      ?auto_12419 - SURFACE
      ?auto_12420 - SURFACE
      ?auto_12421 - PLACE
      ?auto_12425 - HOIST
      ?auto_12424 - SURFACE
      ?auto_12416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12413 ?auto_12414 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12417 ?auto_12414 ) ) ( HOIST-AT ?auto_12415 ?auto_12417 ) ( SURFACE-AT ?auto_12411 ?auto_12417 ) ( ON ?auto_12411 ?auto_12412 ) ( CLEAR ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12412 ) ) ( not ( = ?auto_12413 ?auto_12415 ) ) ( IS-CRATE ?auto_12410 ) ( not ( = ?auto_12427 ?auto_12414 ) ) ( HOIST-AT ?auto_12426 ?auto_12427 ) ( AVAILABLE ?auto_12426 ) ( SURFACE-AT ?auto_12410 ?auto_12427 ) ( ON ?auto_12410 ?auto_12423 ) ( CLEAR ?auto_12410 ) ( not ( = ?auto_12409 ?auto_12410 ) ) ( not ( = ?auto_12409 ?auto_12423 ) ) ( not ( = ?auto_12410 ?auto_12423 ) ) ( not ( = ?auto_12413 ?auto_12426 ) ) ( IS-CRATE ?auto_12409 ) ( not ( = ?auto_12418 ?auto_12414 ) ) ( HOIST-AT ?auto_12422 ?auto_12418 ) ( AVAILABLE ?auto_12422 ) ( SURFACE-AT ?auto_12409 ?auto_12418 ) ( ON ?auto_12409 ?auto_12419 ) ( CLEAR ?auto_12409 ) ( not ( = ?auto_12408 ?auto_12409 ) ) ( not ( = ?auto_12408 ?auto_12419 ) ) ( not ( = ?auto_12409 ?auto_12419 ) ) ( not ( = ?auto_12413 ?auto_12422 ) ) ( IS-CRATE ?auto_12408 ) ( AVAILABLE ?auto_12415 ) ( SURFACE-AT ?auto_12408 ?auto_12417 ) ( ON ?auto_12408 ?auto_12420 ) ( CLEAR ?auto_12408 ) ( not ( = ?auto_12407 ?auto_12408 ) ) ( not ( = ?auto_12407 ?auto_12420 ) ) ( not ( = ?auto_12408 ?auto_12420 ) ) ( SURFACE-AT ?auto_12406 ?auto_12414 ) ( CLEAR ?auto_12406 ) ( IS-CRATE ?auto_12407 ) ( AVAILABLE ?auto_12413 ) ( not ( = ?auto_12421 ?auto_12414 ) ) ( HOIST-AT ?auto_12425 ?auto_12421 ) ( AVAILABLE ?auto_12425 ) ( SURFACE-AT ?auto_12407 ?auto_12421 ) ( ON ?auto_12407 ?auto_12424 ) ( CLEAR ?auto_12407 ) ( TRUCK-AT ?auto_12416 ?auto_12414 ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12424 ) ) ( not ( = ?auto_12407 ?auto_12424 ) ) ( not ( = ?auto_12413 ?auto_12425 ) ) ( not ( = ?auto_12406 ?auto_12408 ) ) ( not ( = ?auto_12406 ?auto_12420 ) ) ( not ( = ?auto_12408 ?auto_12424 ) ) ( not ( = ?auto_12417 ?auto_12421 ) ) ( not ( = ?auto_12415 ?auto_12425 ) ) ( not ( = ?auto_12420 ?auto_12424 ) ) ( not ( = ?auto_12406 ?auto_12409 ) ) ( not ( = ?auto_12406 ?auto_12419 ) ) ( not ( = ?auto_12407 ?auto_12409 ) ) ( not ( = ?auto_12407 ?auto_12419 ) ) ( not ( = ?auto_12409 ?auto_12420 ) ) ( not ( = ?auto_12409 ?auto_12424 ) ) ( not ( = ?auto_12418 ?auto_12417 ) ) ( not ( = ?auto_12418 ?auto_12421 ) ) ( not ( = ?auto_12422 ?auto_12415 ) ) ( not ( = ?auto_12422 ?auto_12425 ) ) ( not ( = ?auto_12419 ?auto_12420 ) ) ( not ( = ?auto_12419 ?auto_12424 ) ) ( not ( = ?auto_12406 ?auto_12410 ) ) ( not ( = ?auto_12406 ?auto_12423 ) ) ( not ( = ?auto_12407 ?auto_12410 ) ) ( not ( = ?auto_12407 ?auto_12423 ) ) ( not ( = ?auto_12408 ?auto_12410 ) ) ( not ( = ?auto_12408 ?auto_12423 ) ) ( not ( = ?auto_12410 ?auto_12419 ) ) ( not ( = ?auto_12410 ?auto_12420 ) ) ( not ( = ?auto_12410 ?auto_12424 ) ) ( not ( = ?auto_12427 ?auto_12418 ) ) ( not ( = ?auto_12427 ?auto_12417 ) ) ( not ( = ?auto_12427 ?auto_12421 ) ) ( not ( = ?auto_12426 ?auto_12422 ) ) ( not ( = ?auto_12426 ?auto_12415 ) ) ( not ( = ?auto_12426 ?auto_12425 ) ) ( not ( = ?auto_12423 ?auto_12419 ) ) ( not ( = ?auto_12423 ?auto_12420 ) ) ( not ( = ?auto_12423 ?auto_12424 ) ) ( not ( = ?auto_12406 ?auto_12411 ) ) ( not ( = ?auto_12406 ?auto_12412 ) ) ( not ( = ?auto_12407 ?auto_12411 ) ) ( not ( = ?auto_12407 ?auto_12412 ) ) ( not ( = ?auto_12408 ?auto_12411 ) ) ( not ( = ?auto_12408 ?auto_12412 ) ) ( not ( = ?auto_12409 ?auto_12411 ) ) ( not ( = ?auto_12409 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12423 ) ) ( not ( = ?auto_12411 ?auto_12419 ) ) ( not ( = ?auto_12411 ?auto_12420 ) ) ( not ( = ?auto_12411 ?auto_12424 ) ) ( not ( = ?auto_12412 ?auto_12423 ) ) ( not ( = ?auto_12412 ?auto_12419 ) ) ( not ( = ?auto_12412 ?auto_12420 ) ) ( not ( = ?auto_12412 ?auto_12424 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12406 ?auto_12407 ?auto_12408 ?auto_12409 ?auto_12410 )
      ( MAKE-1CRATE ?auto_12410 ?auto_12411 )
      ( MAKE-5CRATE-VERIFY ?auto_12406 ?auto_12407 ?auto_12408 ?auto_12409 ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12430 - SURFACE
      ?auto_12431 - SURFACE
    )
    :vars
    (
      ?auto_12432 - HOIST
      ?auto_12433 - PLACE
      ?auto_12435 - PLACE
      ?auto_12436 - HOIST
      ?auto_12437 - SURFACE
      ?auto_12434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12432 ?auto_12433 ) ( SURFACE-AT ?auto_12430 ?auto_12433 ) ( CLEAR ?auto_12430 ) ( IS-CRATE ?auto_12431 ) ( AVAILABLE ?auto_12432 ) ( not ( = ?auto_12435 ?auto_12433 ) ) ( HOIST-AT ?auto_12436 ?auto_12435 ) ( AVAILABLE ?auto_12436 ) ( SURFACE-AT ?auto_12431 ?auto_12435 ) ( ON ?auto_12431 ?auto_12437 ) ( CLEAR ?auto_12431 ) ( TRUCK-AT ?auto_12434 ?auto_12433 ) ( not ( = ?auto_12430 ?auto_12431 ) ) ( not ( = ?auto_12430 ?auto_12437 ) ) ( not ( = ?auto_12431 ?auto_12437 ) ) ( not ( = ?auto_12432 ?auto_12436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12434 ?auto_12433 ?auto_12435 )
      ( !LIFT ?auto_12436 ?auto_12431 ?auto_12437 ?auto_12435 )
      ( !LOAD ?auto_12436 ?auto_12431 ?auto_12434 ?auto_12435 )
      ( !DRIVE ?auto_12434 ?auto_12435 ?auto_12433 )
      ( !UNLOAD ?auto_12432 ?auto_12431 ?auto_12434 ?auto_12433 )
      ( !DROP ?auto_12432 ?auto_12431 ?auto_12430 ?auto_12433 )
      ( MAKE-1CRATE-VERIFY ?auto_12430 ?auto_12431 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12445 - SURFACE
      ?auto_12446 - SURFACE
      ?auto_12447 - SURFACE
      ?auto_12448 - SURFACE
      ?auto_12449 - SURFACE
      ?auto_12451 - SURFACE
      ?auto_12450 - SURFACE
    )
    :vars
    (
      ?auto_12457 - HOIST
      ?auto_12455 - PLACE
      ?auto_12453 - PLACE
      ?auto_12454 - HOIST
      ?auto_12452 - SURFACE
      ?auto_12467 - PLACE
      ?auto_12458 - HOIST
      ?auto_12469 - SURFACE
      ?auto_12459 - PLACE
      ?auto_12466 - HOIST
      ?auto_12462 - SURFACE
      ?auto_12460 - PLACE
      ?auto_12468 - HOIST
      ?auto_12470 - SURFACE
      ?auto_12464 - SURFACE
      ?auto_12465 - PLACE
      ?auto_12463 - HOIST
      ?auto_12461 - SURFACE
      ?auto_12456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12457 ?auto_12455 ) ( IS-CRATE ?auto_12450 ) ( not ( = ?auto_12453 ?auto_12455 ) ) ( HOIST-AT ?auto_12454 ?auto_12453 ) ( AVAILABLE ?auto_12454 ) ( SURFACE-AT ?auto_12450 ?auto_12453 ) ( ON ?auto_12450 ?auto_12452 ) ( CLEAR ?auto_12450 ) ( not ( = ?auto_12451 ?auto_12450 ) ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12450 ?auto_12452 ) ) ( not ( = ?auto_12457 ?auto_12454 ) ) ( IS-CRATE ?auto_12451 ) ( not ( = ?auto_12467 ?auto_12455 ) ) ( HOIST-AT ?auto_12458 ?auto_12467 ) ( SURFACE-AT ?auto_12451 ?auto_12467 ) ( ON ?auto_12451 ?auto_12469 ) ( CLEAR ?auto_12451 ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12449 ?auto_12469 ) ) ( not ( = ?auto_12451 ?auto_12469 ) ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( IS-CRATE ?auto_12449 ) ( not ( = ?auto_12459 ?auto_12455 ) ) ( HOIST-AT ?auto_12466 ?auto_12459 ) ( AVAILABLE ?auto_12466 ) ( SURFACE-AT ?auto_12449 ?auto_12459 ) ( ON ?auto_12449 ?auto_12462 ) ( CLEAR ?auto_12449 ) ( not ( = ?auto_12448 ?auto_12449 ) ) ( not ( = ?auto_12448 ?auto_12462 ) ) ( not ( = ?auto_12449 ?auto_12462 ) ) ( not ( = ?auto_12457 ?auto_12466 ) ) ( IS-CRATE ?auto_12448 ) ( not ( = ?auto_12460 ?auto_12455 ) ) ( HOIST-AT ?auto_12468 ?auto_12460 ) ( AVAILABLE ?auto_12468 ) ( SURFACE-AT ?auto_12448 ?auto_12460 ) ( ON ?auto_12448 ?auto_12470 ) ( CLEAR ?auto_12448 ) ( not ( = ?auto_12447 ?auto_12448 ) ) ( not ( = ?auto_12447 ?auto_12470 ) ) ( not ( = ?auto_12448 ?auto_12470 ) ) ( not ( = ?auto_12457 ?auto_12468 ) ) ( IS-CRATE ?auto_12447 ) ( AVAILABLE ?auto_12458 ) ( SURFACE-AT ?auto_12447 ?auto_12467 ) ( ON ?auto_12447 ?auto_12464 ) ( CLEAR ?auto_12447 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12446 ?auto_12464 ) ) ( not ( = ?auto_12447 ?auto_12464 ) ) ( SURFACE-AT ?auto_12445 ?auto_12455 ) ( CLEAR ?auto_12445 ) ( IS-CRATE ?auto_12446 ) ( AVAILABLE ?auto_12457 ) ( not ( = ?auto_12465 ?auto_12455 ) ) ( HOIST-AT ?auto_12463 ?auto_12465 ) ( AVAILABLE ?auto_12463 ) ( SURFACE-AT ?auto_12446 ?auto_12465 ) ( ON ?auto_12446 ?auto_12461 ) ( CLEAR ?auto_12446 ) ( TRUCK-AT ?auto_12456 ?auto_12455 ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( not ( = ?auto_12445 ?auto_12461 ) ) ( not ( = ?auto_12446 ?auto_12461 ) ) ( not ( = ?auto_12457 ?auto_12463 ) ) ( not ( = ?auto_12445 ?auto_12447 ) ) ( not ( = ?auto_12445 ?auto_12464 ) ) ( not ( = ?auto_12447 ?auto_12461 ) ) ( not ( = ?auto_12467 ?auto_12465 ) ) ( not ( = ?auto_12458 ?auto_12463 ) ) ( not ( = ?auto_12464 ?auto_12461 ) ) ( not ( = ?auto_12445 ?auto_12448 ) ) ( not ( = ?auto_12445 ?auto_12470 ) ) ( not ( = ?auto_12446 ?auto_12448 ) ) ( not ( = ?auto_12446 ?auto_12470 ) ) ( not ( = ?auto_12448 ?auto_12464 ) ) ( not ( = ?auto_12448 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12467 ) ) ( not ( = ?auto_12460 ?auto_12465 ) ) ( not ( = ?auto_12468 ?auto_12458 ) ) ( not ( = ?auto_12468 ?auto_12463 ) ) ( not ( = ?auto_12470 ?auto_12464 ) ) ( not ( = ?auto_12470 ?auto_12461 ) ) ( not ( = ?auto_12445 ?auto_12449 ) ) ( not ( = ?auto_12445 ?auto_12462 ) ) ( not ( = ?auto_12446 ?auto_12449 ) ) ( not ( = ?auto_12446 ?auto_12462 ) ) ( not ( = ?auto_12447 ?auto_12449 ) ) ( not ( = ?auto_12447 ?auto_12462 ) ) ( not ( = ?auto_12449 ?auto_12470 ) ) ( not ( = ?auto_12449 ?auto_12464 ) ) ( not ( = ?auto_12449 ?auto_12461 ) ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12465 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12458 ) ) ( not ( = ?auto_12466 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12470 ) ) ( not ( = ?auto_12462 ?auto_12464 ) ) ( not ( = ?auto_12462 ?auto_12461 ) ) ( not ( = ?auto_12445 ?auto_12451 ) ) ( not ( = ?auto_12445 ?auto_12469 ) ) ( not ( = ?auto_12446 ?auto_12451 ) ) ( not ( = ?auto_12446 ?auto_12469 ) ) ( not ( = ?auto_12447 ?auto_12451 ) ) ( not ( = ?auto_12447 ?auto_12469 ) ) ( not ( = ?auto_12448 ?auto_12451 ) ) ( not ( = ?auto_12448 ?auto_12469 ) ) ( not ( = ?auto_12451 ?auto_12462 ) ) ( not ( = ?auto_12451 ?auto_12470 ) ) ( not ( = ?auto_12451 ?auto_12464 ) ) ( not ( = ?auto_12451 ?auto_12461 ) ) ( not ( = ?auto_12469 ?auto_12462 ) ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12469 ?auto_12464 ) ) ( not ( = ?auto_12469 ?auto_12461 ) ) ( not ( = ?auto_12445 ?auto_12450 ) ) ( not ( = ?auto_12445 ?auto_12452 ) ) ( not ( = ?auto_12446 ?auto_12450 ) ) ( not ( = ?auto_12446 ?auto_12452 ) ) ( not ( = ?auto_12447 ?auto_12450 ) ) ( not ( = ?auto_12447 ?auto_12452 ) ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( not ( = ?auto_12448 ?auto_12452 ) ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12449 ?auto_12452 ) ) ( not ( = ?auto_12450 ?auto_12469 ) ) ( not ( = ?auto_12450 ?auto_12462 ) ) ( not ( = ?auto_12450 ?auto_12470 ) ) ( not ( = ?auto_12450 ?auto_12464 ) ) ( not ( = ?auto_12450 ?auto_12461 ) ) ( not ( = ?auto_12453 ?auto_12467 ) ) ( not ( = ?auto_12453 ?auto_12459 ) ) ( not ( = ?auto_12453 ?auto_12460 ) ) ( not ( = ?auto_12453 ?auto_12465 ) ) ( not ( = ?auto_12454 ?auto_12458 ) ) ( not ( = ?auto_12454 ?auto_12466 ) ) ( not ( = ?auto_12454 ?auto_12468 ) ) ( not ( = ?auto_12454 ?auto_12463 ) ) ( not ( = ?auto_12452 ?auto_12469 ) ) ( not ( = ?auto_12452 ?auto_12462 ) ) ( not ( = ?auto_12452 ?auto_12470 ) ) ( not ( = ?auto_12452 ?auto_12464 ) ) ( not ( = ?auto_12452 ?auto_12461 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12445 ?auto_12446 ?auto_12447 ?auto_12448 ?auto_12449 ?auto_12451 )
      ( MAKE-1CRATE ?auto_12451 ?auto_12450 )
      ( MAKE-6CRATE-VERIFY ?auto_12445 ?auto_12446 ?auto_12447 ?auto_12448 ?auto_12449 ?auto_12451 ?auto_12450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12473 - SURFACE
      ?auto_12474 - SURFACE
    )
    :vars
    (
      ?auto_12475 - HOIST
      ?auto_12476 - PLACE
      ?auto_12478 - PLACE
      ?auto_12479 - HOIST
      ?auto_12480 - SURFACE
      ?auto_12477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12475 ?auto_12476 ) ( SURFACE-AT ?auto_12473 ?auto_12476 ) ( CLEAR ?auto_12473 ) ( IS-CRATE ?auto_12474 ) ( AVAILABLE ?auto_12475 ) ( not ( = ?auto_12478 ?auto_12476 ) ) ( HOIST-AT ?auto_12479 ?auto_12478 ) ( AVAILABLE ?auto_12479 ) ( SURFACE-AT ?auto_12474 ?auto_12478 ) ( ON ?auto_12474 ?auto_12480 ) ( CLEAR ?auto_12474 ) ( TRUCK-AT ?auto_12477 ?auto_12476 ) ( not ( = ?auto_12473 ?auto_12474 ) ) ( not ( = ?auto_12473 ?auto_12480 ) ) ( not ( = ?auto_12474 ?auto_12480 ) ) ( not ( = ?auto_12475 ?auto_12479 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12477 ?auto_12476 ?auto_12478 )
      ( !LIFT ?auto_12479 ?auto_12474 ?auto_12480 ?auto_12478 )
      ( !LOAD ?auto_12479 ?auto_12474 ?auto_12477 ?auto_12478 )
      ( !DRIVE ?auto_12477 ?auto_12478 ?auto_12476 )
      ( !UNLOAD ?auto_12475 ?auto_12474 ?auto_12477 ?auto_12476 )
      ( !DROP ?auto_12475 ?auto_12474 ?auto_12473 ?auto_12476 )
      ( MAKE-1CRATE-VERIFY ?auto_12473 ?auto_12474 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12489 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12491 - SURFACE
      ?auto_12492 - SURFACE
      ?auto_12493 - SURFACE
      ?auto_12495 - SURFACE
      ?auto_12494 - SURFACE
      ?auto_12496 - SURFACE
    )
    :vars
    (
      ?auto_12502 - HOIST
      ?auto_12501 - PLACE
      ?auto_12498 - PLACE
      ?auto_12500 - HOIST
      ?auto_12497 - SURFACE
      ?auto_12506 - PLACE
      ?auto_12507 - HOIST
      ?auto_12508 - SURFACE
      ?auto_12513 - PLACE
      ?auto_12509 - HOIST
      ?auto_12514 - SURFACE
      ?auto_12510 - PLACE
      ?auto_12511 - HOIST
      ?auto_12503 - SURFACE
      ?auto_12505 - PLACE
      ?auto_12512 - HOIST
      ?auto_12515 - SURFACE
      ?auto_12504 - SURFACE
      ?auto_12516 - SURFACE
      ?auto_12499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12502 ?auto_12501 ) ( IS-CRATE ?auto_12496 ) ( not ( = ?auto_12498 ?auto_12501 ) ) ( HOIST-AT ?auto_12500 ?auto_12498 ) ( SURFACE-AT ?auto_12496 ?auto_12498 ) ( ON ?auto_12496 ?auto_12497 ) ( CLEAR ?auto_12496 ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( not ( = ?auto_12494 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( not ( = ?auto_12502 ?auto_12500 ) ) ( IS-CRATE ?auto_12494 ) ( not ( = ?auto_12506 ?auto_12501 ) ) ( HOIST-AT ?auto_12507 ?auto_12506 ) ( AVAILABLE ?auto_12507 ) ( SURFACE-AT ?auto_12494 ?auto_12506 ) ( ON ?auto_12494 ?auto_12508 ) ( CLEAR ?auto_12494 ) ( not ( = ?auto_12495 ?auto_12494 ) ) ( not ( = ?auto_12495 ?auto_12508 ) ) ( not ( = ?auto_12494 ?auto_12508 ) ) ( not ( = ?auto_12502 ?auto_12507 ) ) ( IS-CRATE ?auto_12495 ) ( not ( = ?auto_12513 ?auto_12501 ) ) ( HOIST-AT ?auto_12509 ?auto_12513 ) ( SURFACE-AT ?auto_12495 ?auto_12513 ) ( ON ?auto_12495 ?auto_12514 ) ( CLEAR ?auto_12495 ) ( not ( = ?auto_12493 ?auto_12495 ) ) ( not ( = ?auto_12493 ?auto_12514 ) ) ( not ( = ?auto_12495 ?auto_12514 ) ) ( not ( = ?auto_12502 ?auto_12509 ) ) ( IS-CRATE ?auto_12493 ) ( not ( = ?auto_12510 ?auto_12501 ) ) ( HOIST-AT ?auto_12511 ?auto_12510 ) ( AVAILABLE ?auto_12511 ) ( SURFACE-AT ?auto_12493 ?auto_12510 ) ( ON ?auto_12493 ?auto_12503 ) ( CLEAR ?auto_12493 ) ( not ( = ?auto_12492 ?auto_12493 ) ) ( not ( = ?auto_12492 ?auto_12503 ) ) ( not ( = ?auto_12493 ?auto_12503 ) ) ( not ( = ?auto_12502 ?auto_12511 ) ) ( IS-CRATE ?auto_12492 ) ( not ( = ?auto_12505 ?auto_12501 ) ) ( HOIST-AT ?auto_12512 ?auto_12505 ) ( AVAILABLE ?auto_12512 ) ( SURFACE-AT ?auto_12492 ?auto_12505 ) ( ON ?auto_12492 ?auto_12515 ) ( CLEAR ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12515 ) ) ( not ( = ?auto_12492 ?auto_12515 ) ) ( not ( = ?auto_12502 ?auto_12512 ) ) ( IS-CRATE ?auto_12491 ) ( AVAILABLE ?auto_12509 ) ( SURFACE-AT ?auto_12491 ?auto_12513 ) ( ON ?auto_12491 ?auto_12504 ) ( CLEAR ?auto_12491 ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12504 ) ) ( not ( = ?auto_12491 ?auto_12504 ) ) ( SURFACE-AT ?auto_12489 ?auto_12501 ) ( CLEAR ?auto_12489 ) ( IS-CRATE ?auto_12490 ) ( AVAILABLE ?auto_12502 ) ( AVAILABLE ?auto_12500 ) ( SURFACE-AT ?auto_12490 ?auto_12498 ) ( ON ?auto_12490 ?auto_12516 ) ( CLEAR ?auto_12490 ) ( TRUCK-AT ?auto_12499 ?auto_12501 ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12516 ) ) ( not ( = ?auto_12490 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12504 ) ) ( not ( = ?auto_12491 ?auto_12516 ) ) ( not ( = ?auto_12513 ?auto_12498 ) ) ( not ( = ?auto_12509 ?auto_12500 ) ) ( not ( = ?auto_12504 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12515 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12515 ) ) ( not ( = ?auto_12492 ?auto_12504 ) ) ( not ( = ?auto_12492 ?auto_12516 ) ) ( not ( = ?auto_12505 ?auto_12513 ) ) ( not ( = ?auto_12505 ?auto_12498 ) ) ( not ( = ?auto_12512 ?auto_12509 ) ) ( not ( = ?auto_12512 ?auto_12500 ) ) ( not ( = ?auto_12515 ?auto_12504 ) ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12493 ) ) ( not ( = ?auto_12489 ?auto_12503 ) ) ( not ( = ?auto_12490 ?auto_12493 ) ) ( not ( = ?auto_12490 ?auto_12503 ) ) ( not ( = ?auto_12491 ?auto_12493 ) ) ( not ( = ?auto_12491 ?auto_12503 ) ) ( not ( = ?auto_12493 ?auto_12515 ) ) ( not ( = ?auto_12493 ?auto_12504 ) ) ( not ( = ?auto_12493 ?auto_12516 ) ) ( not ( = ?auto_12510 ?auto_12505 ) ) ( not ( = ?auto_12510 ?auto_12513 ) ) ( not ( = ?auto_12510 ?auto_12498 ) ) ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12509 ) ) ( not ( = ?auto_12511 ?auto_12500 ) ) ( not ( = ?auto_12503 ?auto_12515 ) ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( not ( = ?auto_12503 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12495 ) ) ( not ( = ?auto_12489 ?auto_12514 ) ) ( not ( = ?auto_12490 ?auto_12495 ) ) ( not ( = ?auto_12490 ?auto_12514 ) ) ( not ( = ?auto_12491 ?auto_12495 ) ) ( not ( = ?auto_12491 ?auto_12514 ) ) ( not ( = ?auto_12492 ?auto_12495 ) ) ( not ( = ?auto_12492 ?auto_12514 ) ) ( not ( = ?auto_12495 ?auto_12503 ) ) ( not ( = ?auto_12495 ?auto_12515 ) ) ( not ( = ?auto_12495 ?auto_12504 ) ) ( not ( = ?auto_12495 ?auto_12516 ) ) ( not ( = ?auto_12514 ?auto_12503 ) ) ( not ( = ?auto_12514 ?auto_12515 ) ) ( not ( = ?auto_12514 ?auto_12504 ) ) ( not ( = ?auto_12514 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12494 ) ) ( not ( = ?auto_12489 ?auto_12508 ) ) ( not ( = ?auto_12490 ?auto_12494 ) ) ( not ( = ?auto_12490 ?auto_12508 ) ) ( not ( = ?auto_12491 ?auto_12494 ) ) ( not ( = ?auto_12491 ?auto_12508 ) ) ( not ( = ?auto_12492 ?auto_12494 ) ) ( not ( = ?auto_12492 ?auto_12508 ) ) ( not ( = ?auto_12493 ?auto_12494 ) ) ( not ( = ?auto_12493 ?auto_12508 ) ) ( not ( = ?auto_12494 ?auto_12514 ) ) ( not ( = ?auto_12494 ?auto_12503 ) ) ( not ( = ?auto_12494 ?auto_12515 ) ) ( not ( = ?auto_12494 ?auto_12504 ) ) ( not ( = ?auto_12494 ?auto_12516 ) ) ( not ( = ?auto_12506 ?auto_12513 ) ) ( not ( = ?auto_12506 ?auto_12510 ) ) ( not ( = ?auto_12506 ?auto_12505 ) ) ( not ( = ?auto_12506 ?auto_12498 ) ) ( not ( = ?auto_12507 ?auto_12509 ) ) ( not ( = ?auto_12507 ?auto_12511 ) ) ( not ( = ?auto_12507 ?auto_12512 ) ) ( not ( = ?auto_12507 ?auto_12500 ) ) ( not ( = ?auto_12508 ?auto_12514 ) ) ( not ( = ?auto_12508 ?auto_12503 ) ) ( not ( = ?auto_12508 ?auto_12515 ) ) ( not ( = ?auto_12508 ?auto_12504 ) ) ( not ( = ?auto_12508 ?auto_12516 ) ) ( not ( = ?auto_12489 ?auto_12496 ) ) ( not ( = ?auto_12489 ?auto_12497 ) ) ( not ( = ?auto_12490 ?auto_12496 ) ) ( not ( = ?auto_12490 ?auto_12497 ) ) ( not ( = ?auto_12491 ?auto_12496 ) ) ( not ( = ?auto_12491 ?auto_12497 ) ) ( not ( = ?auto_12492 ?auto_12496 ) ) ( not ( = ?auto_12492 ?auto_12497 ) ) ( not ( = ?auto_12493 ?auto_12496 ) ) ( not ( = ?auto_12493 ?auto_12497 ) ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12508 ) ) ( not ( = ?auto_12496 ?auto_12514 ) ) ( not ( = ?auto_12496 ?auto_12503 ) ) ( not ( = ?auto_12496 ?auto_12515 ) ) ( not ( = ?auto_12496 ?auto_12504 ) ) ( not ( = ?auto_12496 ?auto_12516 ) ) ( not ( = ?auto_12497 ?auto_12508 ) ) ( not ( = ?auto_12497 ?auto_12514 ) ) ( not ( = ?auto_12497 ?auto_12503 ) ) ( not ( = ?auto_12497 ?auto_12515 ) ) ( not ( = ?auto_12497 ?auto_12504 ) ) ( not ( = ?auto_12497 ?auto_12516 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12493 ?auto_12495 ?auto_12494 )
      ( MAKE-1CRATE ?auto_12494 ?auto_12496 )
      ( MAKE-7CRATE-VERIFY ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12493 ?auto_12495 ?auto_12494 ?auto_12496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12519 - SURFACE
      ?auto_12520 - SURFACE
    )
    :vars
    (
      ?auto_12521 - HOIST
      ?auto_12522 - PLACE
      ?auto_12524 - PLACE
      ?auto_12525 - HOIST
      ?auto_12526 - SURFACE
      ?auto_12523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12521 ?auto_12522 ) ( SURFACE-AT ?auto_12519 ?auto_12522 ) ( CLEAR ?auto_12519 ) ( IS-CRATE ?auto_12520 ) ( AVAILABLE ?auto_12521 ) ( not ( = ?auto_12524 ?auto_12522 ) ) ( HOIST-AT ?auto_12525 ?auto_12524 ) ( AVAILABLE ?auto_12525 ) ( SURFACE-AT ?auto_12520 ?auto_12524 ) ( ON ?auto_12520 ?auto_12526 ) ( CLEAR ?auto_12520 ) ( TRUCK-AT ?auto_12523 ?auto_12522 ) ( not ( = ?auto_12519 ?auto_12520 ) ) ( not ( = ?auto_12519 ?auto_12526 ) ) ( not ( = ?auto_12520 ?auto_12526 ) ) ( not ( = ?auto_12521 ?auto_12525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12523 ?auto_12522 ?auto_12524 )
      ( !LIFT ?auto_12525 ?auto_12520 ?auto_12526 ?auto_12524 )
      ( !LOAD ?auto_12525 ?auto_12520 ?auto_12523 ?auto_12524 )
      ( !DRIVE ?auto_12523 ?auto_12524 ?auto_12522 )
      ( !UNLOAD ?auto_12521 ?auto_12520 ?auto_12523 ?auto_12522 )
      ( !DROP ?auto_12521 ?auto_12520 ?auto_12519 ?auto_12522 )
      ( MAKE-1CRATE-VERIFY ?auto_12519 ?auto_12520 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12536 - SURFACE
      ?auto_12537 - SURFACE
      ?auto_12538 - SURFACE
      ?auto_12539 - SURFACE
      ?auto_12540 - SURFACE
      ?auto_12542 - SURFACE
      ?auto_12541 - SURFACE
      ?auto_12544 - SURFACE
      ?auto_12543 - SURFACE
    )
    :vars
    (
      ?auto_12546 - HOIST
      ?auto_12547 - PLACE
      ?auto_12545 - PLACE
      ?auto_12548 - HOIST
      ?auto_12549 - SURFACE
      ?auto_12556 - PLACE
      ?auto_12558 - HOIST
      ?auto_12567 - SURFACE
      ?auto_12557 - PLACE
      ?auto_12566 - HOIST
      ?auto_12565 - SURFACE
      ?auto_12555 - PLACE
      ?auto_12564 - HOIST
      ?auto_12560 - SURFACE
      ?auto_12563 - PLACE
      ?auto_12551 - HOIST
      ?auto_12554 - SURFACE
      ?auto_12553 - PLACE
      ?auto_12559 - HOIST
      ?auto_12561 - SURFACE
      ?auto_12552 - SURFACE
      ?auto_12562 - SURFACE
      ?auto_12550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12546 ?auto_12547 ) ( IS-CRATE ?auto_12543 ) ( not ( = ?auto_12545 ?auto_12547 ) ) ( HOIST-AT ?auto_12548 ?auto_12545 ) ( AVAILABLE ?auto_12548 ) ( SURFACE-AT ?auto_12543 ?auto_12545 ) ( ON ?auto_12543 ?auto_12549 ) ( CLEAR ?auto_12543 ) ( not ( = ?auto_12544 ?auto_12543 ) ) ( not ( = ?auto_12544 ?auto_12549 ) ) ( not ( = ?auto_12543 ?auto_12549 ) ) ( not ( = ?auto_12546 ?auto_12548 ) ) ( IS-CRATE ?auto_12544 ) ( not ( = ?auto_12556 ?auto_12547 ) ) ( HOIST-AT ?auto_12558 ?auto_12556 ) ( SURFACE-AT ?auto_12544 ?auto_12556 ) ( ON ?auto_12544 ?auto_12567 ) ( CLEAR ?auto_12544 ) ( not ( = ?auto_12541 ?auto_12544 ) ) ( not ( = ?auto_12541 ?auto_12567 ) ) ( not ( = ?auto_12544 ?auto_12567 ) ) ( not ( = ?auto_12546 ?auto_12558 ) ) ( IS-CRATE ?auto_12541 ) ( not ( = ?auto_12557 ?auto_12547 ) ) ( HOIST-AT ?auto_12566 ?auto_12557 ) ( AVAILABLE ?auto_12566 ) ( SURFACE-AT ?auto_12541 ?auto_12557 ) ( ON ?auto_12541 ?auto_12565 ) ( CLEAR ?auto_12541 ) ( not ( = ?auto_12542 ?auto_12541 ) ) ( not ( = ?auto_12542 ?auto_12565 ) ) ( not ( = ?auto_12541 ?auto_12565 ) ) ( not ( = ?auto_12546 ?auto_12566 ) ) ( IS-CRATE ?auto_12542 ) ( not ( = ?auto_12555 ?auto_12547 ) ) ( HOIST-AT ?auto_12564 ?auto_12555 ) ( SURFACE-AT ?auto_12542 ?auto_12555 ) ( ON ?auto_12542 ?auto_12560 ) ( CLEAR ?auto_12542 ) ( not ( = ?auto_12540 ?auto_12542 ) ) ( not ( = ?auto_12540 ?auto_12560 ) ) ( not ( = ?auto_12542 ?auto_12560 ) ) ( not ( = ?auto_12546 ?auto_12564 ) ) ( IS-CRATE ?auto_12540 ) ( not ( = ?auto_12563 ?auto_12547 ) ) ( HOIST-AT ?auto_12551 ?auto_12563 ) ( AVAILABLE ?auto_12551 ) ( SURFACE-AT ?auto_12540 ?auto_12563 ) ( ON ?auto_12540 ?auto_12554 ) ( CLEAR ?auto_12540 ) ( not ( = ?auto_12539 ?auto_12540 ) ) ( not ( = ?auto_12539 ?auto_12554 ) ) ( not ( = ?auto_12540 ?auto_12554 ) ) ( not ( = ?auto_12546 ?auto_12551 ) ) ( IS-CRATE ?auto_12539 ) ( not ( = ?auto_12553 ?auto_12547 ) ) ( HOIST-AT ?auto_12559 ?auto_12553 ) ( AVAILABLE ?auto_12559 ) ( SURFACE-AT ?auto_12539 ?auto_12553 ) ( ON ?auto_12539 ?auto_12561 ) ( CLEAR ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( not ( = ?auto_12538 ?auto_12561 ) ) ( not ( = ?auto_12539 ?auto_12561 ) ) ( not ( = ?auto_12546 ?auto_12559 ) ) ( IS-CRATE ?auto_12538 ) ( AVAILABLE ?auto_12564 ) ( SURFACE-AT ?auto_12538 ?auto_12555 ) ( ON ?auto_12538 ?auto_12552 ) ( CLEAR ?auto_12538 ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12552 ) ) ( not ( = ?auto_12538 ?auto_12552 ) ) ( SURFACE-AT ?auto_12536 ?auto_12547 ) ( CLEAR ?auto_12536 ) ( IS-CRATE ?auto_12537 ) ( AVAILABLE ?auto_12546 ) ( AVAILABLE ?auto_12558 ) ( SURFACE-AT ?auto_12537 ?auto_12556 ) ( ON ?auto_12537 ?auto_12562 ) ( CLEAR ?auto_12537 ) ( TRUCK-AT ?auto_12550 ?auto_12547 ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12562 ) ) ( not ( = ?auto_12537 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12552 ) ) ( not ( = ?auto_12538 ?auto_12562 ) ) ( not ( = ?auto_12555 ?auto_12556 ) ) ( not ( = ?auto_12564 ?auto_12558 ) ) ( not ( = ?auto_12552 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12539 ) ) ( not ( = ?auto_12536 ?auto_12561 ) ) ( not ( = ?auto_12537 ?auto_12539 ) ) ( not ( = ?auto_12537 ?auto_12561 ) ) ( not ( = ?auto_12539 ?auto_12552 ) ) ( not ( = ?auto_12539 ?auto_12562 ) ) ( not ( = ?auto_12553 ?auto_12555 ) ) ( not ( = ?auto_12553 ?auto_12556 ) ) ( not ( = ?auto_12559 ?auto_12564 ) ) ( not ( = ?auto_12559 ?auto_12558 ) ) ( not ( = ?auto_12561 ?auto_12552 ) ) ( not ( = ?auto_12561 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12540 ) ) ( not ( = ?auto_12536 ?auto_12554 ) ) ( not ( = ?auto_12537 ?auto_12540 ) ) ( not ( = ?auto_12537 ?auto_12554 ) ) ( not ( = ?auto_12538 ?auto_12540 ) ) ( not ( = ?auto_12538 ?auto_12554 ) ) ( not ( = ?auto_12540 ?auto_12561 ) ) ( not ( = ?auto_12540 ?auto_12552 ) ) ( not ( = ?auto_12540 ?auto_12562 ) ) ( not ( = ?auto_12563 ?auto_12553 ) ) ( not ( = ?auto_12563 ?auto_12555 ) ) ( not ( = ?auto_12563 ?auto_12556 ) ) ( not ( = ?auto_12551 ?auto_12559 ) ) ( not ( = ?auto_12551 ?auto_12564 ) ) ( not ( = ?auto_12551 ?auto_12558 ) ) ( not ( = ?auto_12554 ?auto_12561 ) ) ( not ( = ?auto_12554 ?auto_12552 ) ) ( not ( = ?auto_12554 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12542 ) ) ( not ( = ?auto_12536 ?auto_12560 ) ) ( not ( = ?auto_12537 ?auto_12542 ) ) ( not ( = ?auto_12537 ?auto_12560 ) ) ( not ( = ?auto_12538 ?auto_12542 ) ) ( not ( = ?auto_12538 ?auto_12560 ) ) ( not ( = ?auto_12539 ?auto_12542 ) ) ( not ( = ?auto_12539 ?auto_12560 ) ) ( not ( = ?auto_12542 ?auto_12554 ) ) ( not ( = ?auto_12542 ?auto_12561 ) ) ( not ( = ?auto_12542 ?auto_12552 ) ) ( not ( = ?auto_12542 ?auto_12562 ) ) ( not ( = ?auto_12560 ?auto_12554 ) ) ( not ( = ?auto_12560 ?auto_12561 ) ) ( not ( = ?auto_12560 ?auto_12552 ) ) ( not ( = ?auto_12560 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12541 ) ) ( not ( = ?auto_12536 ?auto_12565 ) ) ( not ( = ?auto_12537 ?auto_12541 ) ) ( not ( = ?auto_12537 ?auto_12565 ) ) ( not ( = ?auto_12538 ?auto_12541 ) ) ( not ( = ?auto_12538 ?auto_12565 ) ) ( not ( = ?auto_12539 ?auto_12541 ) ) ( not ( = ?auto_12539 ?auto_12565 ) ) ( not ( = ?auto_12540 ?auto_12541 ) ) ( not ( = ?auto_12540 ?auto_12565 ) ) ( not ( = ?auto_12541 ?auto_12560 ) ) ( not ( = ?auto_12541 ?auto_12554 ) ) ( not ( = ?auto_12541 ?auto_12561 ) ) ( not ( = ?auto_12541 ?auto_12552 ) ) ( not ( = ?auto_12541 ?auto_12562 ) ) ( not ( = ?auto_12557 ?auto_12555 ) ) ( not ( = ?auto_12557 ?auto_12563 ) ) ( not ( = ?auto_12557 ?auto_12553 ) ) ( not ( = ?auto_12557 ?auto_12556 ) ) ( not ( = ?auto_12566 ?auto_12564 ) ) ( not ( = ?auto_12566 ?auto_12551 ) ) ( not ( = ?auto_12566 ?auto_12559 ) ) ( not ( = ?auto_12566 ?auto_12558 ) ) ( not ( = ?auto_12565 ?auto_12560 ) ) ( not ( = ?auto_12565 ?auto_12554 ) ) ( not ( = ?auto_12565 ?auto_12561 ) ) ( not ( = ?auto_12565 ?auto_12552 ) ) ( not ( = ?auto_12565 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12544 ) ) ( not ( = ?auto_12536 ?auto_12567 ) ) ( not ( = ?auto_12537 ?auto_12544 ) ) ( not ( = ?auto_12537 ?auto_12567 ) ) ( not ( = ?auto_12538 ?auto_12544 ) ) ( not ( = ?auto_12538 ?auto_12567 ) ) ( not ( = ?auto_12539 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12567 ) ) ( not ( = ?auto_12540 ?auto_12544 ) ) ( not ( = ?auto_12540 ?auto_12567 ) ) ( not ( = ?auto_12542 ?auto_12544 ) ) ( not ( = ?auto_12542 ?auto_12567 ) ) ( not ( = ?auto_12544 ?auto_12565 ) ) ( not ( = ?auto_12544 ?auto_12560 ) ) ( not ( = ?auto_12544 ?auto_12554 ) ) ( not ( = ?auto_12544 ?auto_12561 ) ) ( not ( = ?auto_12544 ?auto_12552 ) ) ( not ( = ?auto_12544 ?auto_12562 ) ) ( not ( = ?auto_12567 ?auto_12565 ) ) ( not ( = ?auto_12567 ?auto_12560 ) ) ( not ( = ?auto_12567 ?auto_12554 ) ) ( not ( = ?auto_12567 ?auto_12561 ) ) ( not ( = ?auto_12567 ?auto_12552 ) ) ( not ( = ?auto_12567 ?auto_12562 ) ) ( not ( = ?auto_12536 ?auto_12543 ) ) ( not ( = ?auto_12536 ?auto_12549 ) ) ( not ( = ?auto_12537 ?auto_12543 ) ) ( not ( = ?auto_12537 ?auto_12549 ) ) ( not ( = ?auto_12538 ?auto_12543 ) ) ( not ( = ?auto_12538 ?auto_12549 ) ) ( not ( = ?auto_12539 ?auto_12543 ) ) ( not ( = ?auto_12539 ?auto_12549 ) ) ( not ( = ?auto_12540 ?auto_12543 ) ) ( not ( = ?auto_12540 ?auto_12549 ) ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12549 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( not ( = ?auto_12541 ?auto_12549 ) ) ( not ( = ?auto_12543 ?auto_12567 ) ) ( not ( = ?auto_12543 ?auto_12565 ) ) ( not ( = ?auto_12543 ?auto_12560 ) ) ( not ( = ?auto_12543 ?auto_12554 ) ) ( not ( = ?auto_12543 ?auto_12561 ) ) ( not ( = ?auto_12543 ?auto_12552 ) ) ( not ( = ?auto_12543 ?auto_12562 ) ) ( not ( = ?auto_12545 ?auto_12556 ) ) ( not ( = ?auto_12545 ?auto_12557 ) ) ( not ( = ?auto_12545 ?auto_12555 ) ) ( not ( = ?auto_12545 ?auto_12563 ) ) ( not ( = ?auto_12545 ?auto_12553 ) ) ( not ( = ?auto_12548 ?auto_12558 ) ) ( not ( = ?auto_12548 ?auto_12566 ) ) ( not ( = ?auto_12548 ?auto_12564 ) ) ( not ( = ?auto_12548 ?auto_12551 ) ) ( not ( = ?auto_12548 ?auto_12559 ) ) ( not ( = ?auto_12549 ?auto_12567 ) ) ( not ( = ?auto_12549 ?auto_12565 ) ) ( not ( = ?auto_12549 ?auto_12560 ) ) ( not ( = ?auto_12549 ?auto_12554 ) ) ( not ( = ?auto_12549 ?auto_12561 ) ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( not ( = ?auto_12549 ?auto_12562 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12539 ?auto_12540 ?auto_12542 ?auto_12541 ?auto_12544 )
      ( MAKE-1CRATE ?auto_12544 ?auto_12543 )
      ( MAKE-8CRATE-VERIFY ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12539 ?auto_12540 ?auto_12542 ?auto_12541 ?auto_12544 ?auto_12543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12570 - SURFACE
      ?auto_12571 - SURFACE
    )
    :vars
    (
      ?auto_12572 - HOIST
      ?auto_12573 - PLACE
      ?auto_12575 - PLACE
      ?auto_12576 - HOIST
      ?auto_12577 - SURFACE
      ?auto_12574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12572 ?auto_12573 ) ( SURFACE-AT ?auto_12570 ?auto_12573 ) ( CLEAR ?auto_12570 ) ( IS-CRATE ?auto_12571 ) ( AVAILABLE ?auto_12572 ) ( not ( = ?auto_12575 ?auto_12573 ) ) ( HOIST-AT ?auto_12576 ?auto_12575 ) ( AVAILABLE ?auto_12576 ) ( SURFACE-AT ?auto_12571 ?auto_12575 ) ( ON ?auto_12571 ?auto_12577 ) ( CLEAR ?auto_12571 ) ( TRUCK-AT ?auto_12574 ?auto_12573 ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12577 ) ) ( not ( = ?auto_12571 ?auto_12577 ) ) ( not ( = ?auto_12572 ?auto_12576 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12574 ?auto_12573 ?auto_12575 )
      ( !LIFT ?auto_12576 ?auto_12571 ?auto_12577 ?auto_12575 )
      ( !LOAD ?auto_12576 ?auto_12571 ?auto_12574 ?auto_12575 )
      ( !DRIVE ?auto_12574 ?auto_12575 ?auto_12573 )
      ( !UNLOAD ?auto_12572 ?auto_12571 ?auto_12574 ?auto_12573 )
      ( !DROP ?auto_12572 ?auto_12571 ?auto_12570 ?auto_12573 )
      ( MAKE-1CRATE-VERIFY ?auto_12570 ?auto_12571 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12588 - SURFACE
      ?auto_12589 - SURFACE
      ?auto_12590 - SURFACE
      ?auto_12591 - SURFACE
      ?auto_12592 - SURFACE
      ?auto_12595 - SURFACE
      ?auto_12593 - SURFACE
      ?auto_12597 - SURFACE
      ?auto_12596 - SURFACE
      ?auto_12594 - SURFACE
    )
    :vars
    (
      ?auto_12598 - HOIST
      ?auto_12602 - PLACE
      ?auto_12603 - PLACE
      ?auto_12601 - HOIST
      ?auto_12599 - SURFACE
      ?auto_12621 - PLACE
      ?auto_12617 - HOIST
      ?auto_12622 - SURFACE
      ?auto_12614 - PLACE
      ?auto_12612 - HOIST
      ?auto_12606 - SURFACE
      ?auto_12613 - PLACE
      ?auto_12605 - HOIST
      ?auto_12618 - SURFACE
      ?auto_12615 - PLACE
      ?auto_12611 - HOIST
      ?auto_12604 - SURFACE
      ?auto_12610 - PLACE
      ?auto_12607 - HOIST
      ?auto_12620 - SURFACE
      ?auto_12616 - PLACE
      ?auto_12623 - HOIST
      ?auto_12608 - SURFACE
      ?auto_12619 - SURFACE
      ?auto_12609 - SURFACE
      ?auto_12600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12598 ?auto_12602 ) ( IS-CRATE ?auto_12594 ) ( not ( = ?auto_12603 ?auto_12602 ) ) ( HOIST-AT ?auto_12601 ?auto_12603 ) ( AVAILABLE ?auto_12601 ) ( SURFACE-AT ?auto_12594 ?auto_12603 ) ( ON ?auto_12594 ?auto_12599 ) ( CLEAR ?auto_12594 ) ( not ( = ?auto_12596 ?auto_12594 ) ) ( not ( = ?auto_12596 ?auto_12599 ) ) ( not ( = ?auto_12594 ?auto_12599 ) ) ( not ( = ?auto_12598 ?auto_12601 ) ) ( IS-CRATE ?auto_12596 ) ( not ( = ?auto_12621 ?auto_12602 ) ) ( HOIST-AT ?auto_12617 ?auto_12621 ) ( AVAILABLE ?auto_12617 ) ( SURFACE-AT ?auto_12596 ?auto_12621 ) ( ON ?auto_12596 ?auto_12622 ) ( CLEAR ?auto_12596 ) ( not ( = ?auto_12597 ?auto_12596 ) ) ( not ( = ?auto_12597 ?auto_12622 ) ) ( not ( = ?auto_12596 ?auto_12622 ) ) ( not ( = ?auto_12598 ?auto_12617 ) ) ( IS-CRATE ?auto_12597 ) ( not ( = ?auto_12614 ?auto_12602 ) ) ( HOIST-AT ?auto_12612 ?auto_12614 ) ( SURFACE-AT ?auto_12597 ?auto_12614 ) ( ON ?auto_12597 ?auto_12606 ) ( CLEAR ?auto_12597 ) ( not ( = ?auto_12593 ?auto_12597 ) ) ( not ( = ?auto_12593 ?auto_12606 ) ) ( not ( = ?auto_12597 ?auto_12606 ) ) ( not ( = ?auto_12598 ?auto_12612 ) ) ( IS-CRATE ?auto_12593 ) ( not ( = ?auto_12613 ?auto_12602 ) ) ( HOIST-AT ?auto_12605 ?auto_12613 ) ( AVAILABLE ?auto_12605 ) ( SURFACE-AT ?auto_12593 ?auto_12613 ) ( ON ?auto_12593 ?auto_12618 ) ( CLEAR ?auto_12593 ) ( not ( = ?auto_12595 ?auto_12593 ) ) ( not ( = ?auto_12595 ?auto_12618 ) ) ( not ( = ?auto_12593 ?auto_12618 ) ) ( not ( = ?auto_12598 ?auto_12605 ) ) ( IS-CRATE ?auto_12595 ) ( not ( = ?auto_12615 ?auto_12602 ) ) ( HOIST-AT ?auto_12611 ?auto_12615 ) ( SURFACE-AT ?auto_12595 ?auto_12615 ) ( ON ?auto_12595 ?auto_12604 ) ( CLEAR ?auto_12595 ) ( not ( = ?auto_12592 ?auto_12595 ) ) ( not ( = ?auto_12592 ?auto_12604 ) ) ( not ( = ?auto_12595 ?auto_12604 ) ) ( not ( = ?auto_12598 ?auto_12611 ) ) ( IS-CRATE ?auto_12592 ) ( not ( = ?auto_12610 ?auto_12602 ) ) ( HOIST-AT ?auto_12607 ?auto_12610 ) ( AVAILABLE ?auto_12607 ) ( SURFACE-AT ?auto_12592 ?auto_12610 ) ( ON ?auto_12592 ?auto_12620 ) ( CLEAR ?auto_12592 ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( not ( = ?auto_12591 ?auto_12620 ) ) ( not ( = ?auto_12592 ?auto_12620 ) ) ( not ( = ?auto_12598 ?auto_12607 ) ) ( IS-CRATE ?auto_12591 ) ( not ( = ?auto_12616 ?auto_12602 ) ) ( HOIST-AT ?auto_12623 ?auto_12616 ) ( AVAILABLE ?auto_12623 ) ( SURFACE-AT ?auto_12591 ?auto_12616 ) ( ON ?auto_12591 ?auto_12608 ) ( CLEAR ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12591 ) ) ( not ( = ?auto_12590 ?auto_12608 ) ) ( not ( = ?auto_12591 ?auto_12608 ) ) ( not ( = ?auto_12598 ?auto_12623 ) ) ( IS-CRATE ?auto_12590 ) ( AVAILABLE ?auto_12611 ) ( SURFACE-AT ?auto_12590 ?auto_12615 ) ( ON ?auto_12590 ?auto_12619 ) ( CLEAR ?auto_12590 ) ( not ( = ?auto_12589 ?auto_12590 ) ) ( not ( = ?auto_12589 ?auto_12619 ) ) ( not ( = ?auto_12590 ?auto_12619 ) ) ( SURFACE-AT ?auto_12588 ?auto_12602 ) ( CLEAR ?auto_12588 ) ( IS-CRATE ?auto_12589 ) ( AVAILABLE ?auto_12598 ) ( AVAILABLE ?auto_12612 ) ( SURFACE-AT ?auto_12589 ?auto_12614 ) ( ON ?auto_12589 ?auto_12609 ) ( CLEAR ?auto_12589 ) ( TRUCK-AT ?auto_12600 ?auto_12602 ) ( not ( = ?auto_12588 ?auto_12589 ) ) ( not ( = ?auto_12588 ?auto_12609 ) ) ( not ( = ?auto_12589 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12590 ) ) ( not ( = ?auto_12588 ?auto_12619 ) ) ( not ( = ?auto_12590 ?auto_12609 ) ) ( not ( = ?auto_12615 ?auto_12614 ) ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12619 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12591 ) ) ( not ( = ?auto_12588 ?auto_12608 ) ) ( not ( = ?auto_12589 ?auto_12591 ) ) ( not ( = ?auto_12589 ?auto_12608 ) ) ( not ( = ?auto_12591 ?auto_12619 ) ) ( not ( = ?auto_12591 ?auto_12609 ) ) ( not ( = ?auto_12616 ?auto_12615 ) ) ( not ( = ?auto_12616 ?auto_12614 ) ) ( not ( = ?auto_12623 ?auto_12611 ) ) ( not ( = ?auto_12623 ?auto_12612 ) ) ( not ( = ?auto_12608 ?auto_12619 ) ) ( not ( = ?auto_12608 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12592 ) ) ( not ( = ?auto_12588 ?auto_12620 ) ) ( not ( = ?auto_12589 ?auto_12592 ) ) ( not ( = ?auto_12589 ?auto_12620 ) ) ( not ( = ?auto_12590 ?auto_12592 ) ) ( not ( = ?auto_12590 ?auto_12620 ) ) ( not ( = ?auto_12592 ?auto_12608 ) ) ( not ( = ?auto_12592 ?auto_12619 ) ) ( not ( = ?auto_12592 ?auto_12609 ) ) ( not ( = ?auto_12610 ?auto_12616 ) ) ( not ( = ?auto_12610 ?auto_12615 ) ) ( not ( = ?auto_12610 ?auto_12614 ) ) ( not ( = ?auto_12607 ?auto_12623 ) ) ( not ( = ?auto_12607 ?auto_12611 ) ) ( not ( = ?auto_12607 ?auto_12612 ) ) ( not ( = ?auto_12620 ?auto_12608 ) ) ( not ( = ?auto_12620 ?auto_12619 ) ) ( not ( = ?auto_12620 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12595 ) ) ( not ( = ?auto_12588 ?auto_12604 ) ) ( not ( = ?auto_12589 ?auto_12595 ) ) ( not ( = ?auto_12589 ?auto_12604 ) ) ( not ( = ?auto_12590 ?auto_12595 ) ) ( not ( = ?auto_12590 ?auto_12604 ) ) ( not ( = ?auto_12591 ?auto_12595 ) ) ( not ( = ?auto_12591 ?auto_12604 ) ) ( not ( = ?auto_12595 ?auto_12620 ) ) ( not ( = ?auto_12595 ?auto_12608 ) ) ( not ( = ?auto_12595 ?auto_12619 ) ) ( not ( = ?auto_12595 ?auto_12609 ) ) ( not ( = ?auto_12604 ?auto_12620 ) ) ( not ( = ?auto_12604 ?auto_12608 ) ) ( not ( = ?auto_12604 ?auto_12619 ) ) ( not ( = ?auto_12604 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12593 ) ) ( not ( = ?auto_12588 ?auto_12618 ) ) ( not ( = ?auto_12589 ?auto_12593 ) ) ( not ( = ?auto_12589 ?auto_12618 ) ) ( not ( = ?auto_12590 ?auto_12593 ) ) ( not ( = ?auto_12590 ?auto_12618 ) ) ( not ( = ?auto_12591 ?auto_12593 ) ) ( not ( = ?auto_12591 ?auto_12618 ) ) ( not ( = ?auto_12592 ?auto_12593 ) ) ( not ( = ?auto_12592 ?auto_12618 ) ) ( not ( = ?auto_12593 ?auto_12604 ) ) ( not ( = ?auto_12593 ?auto_12620 ) ) ( not ( = ?auto_12593 ?auto_12608 ) ) ( not ( = ?auto_12593 ?auto_12619 ) ) ( not ( = ?auto_12593 ?auto_12609 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12610 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12614 ) ) ( not ( = ?auto_12605 ?auto_12611 ) ) ( not ( = ?auto_12605 ?auto_12607 ) ) ( not ( = ?auto_12605 ?auto_12623 ) ) ( not ( = ?auto_12605 ?auto_12612 ) ) ( not ( = ?auto_12618 ?auto_12604 ) ) ( not ( = ?auto_12618 ?auto_12620 ) ) ( not ( = ?auto_12618 ?auto_12608 ) ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12597 ) ) ( not ( = ?auto_12588 ?auto_12606 ) ) ( not ( = ?auto_12589 ?auto_12597 ) ) ( not ( = ?auto_12589 ?auto_12606 ) ) ( not ( = ?auto_12590 ?auto_12597 ) ) ( not ( = ?auto_12590 ?auto_12606 ) ) ( not ( = ?auto_12591 ?auto_12597 ) ) ( not ( = ?auto_12591 ?auto_12606 ) ) ( not ( = ?auto_12592 ?auto_12597 ) ) ( not ( = ?auto_12592 ?auto_12606 ) ) ( not ( = ?auto_12595 ?auto_12597 ) ) ( not ( = ?auto_12595 ?auto_12606 ) ) ( not ( = ?auto_12597 ?auto_12618 ) ) ( not ( = ?auto_12597 ?auto_12604 ) ) ( not ( = ?auto_12597 ?auto_12620 ) ) ( not ( = ?auto_12597 ?auto_12608 ) ) ( not ( = ?auto_12597 ?auto_12619 ) ) ( not ( = ?auto_12597 ?auto_12609 ) ) ( not ( = ?auto_12606 ?auto_12618 ) ) ( not ( = ?auto_12606 ?auto_12604 ) ) ( not ( = ?auto_12606 ?auto_12620 ) ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( not ( = ?auto_12606 ?auto_12619 ) ) ( not ( = ?auto_12606 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12596 ) ) ( not ( = ?auto_12588 ?auto_12622 ) ) ( not ( = ?auto_12589 ?auto_12596 ) ) ( not ( = ?auto_12589 ?auto_12622 ) ) ( not ( = ?auto_12590 ?auto_12596 ) ) ( not ( = ?auto_12590 ?auto_12622 ) ) ( not ( = ?auto_12591 ?auto_12596 ) ) ( not ( = ?auto_12591 ?auto_12622 ) ) ( not ( = ?auto_12592 ?auto_12596 ) ) ( not ( = ?auto_12592 ?auto_12622 ) ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12622 ) ) ( not ( = ?auto_12593 ?auto_12596 ) ) ( not ( = ?auto_12593 ?auto_12622 ) ) ( not ( = ?auto_12596 ?auto_12606 ) ) ( not ( = ?auto_12596 ?auto_12618 ) ) ( not ( = ?auto_12596 ?auto_12604 ) ) ( not ( = ?auto_12596 ?auto_12620 ) ) ( not ( = ?auto_12596 ?auto_12608 ) ) ( not ( = ?auto_12596 ?auto_12619 ) ) ( not ( = ?auto_12596 ?auto_12609 ) ) ( not ( = ?auto_12621 ?auto_12614 ) ) ( not ( = ?auto_12621 ?auto_12613 ) ) ( not ( = ?auto_12621 ?auto_12615 ) ) ( not ( = ?auto_12621 ?auto_12610 ) ) ( not ( = ?auto_12621 ?auto_12616 ) ) ( not ( = ?auto_12617 ?auto_12612 ) ) ( not ( = ?auto_12617 ?auto_12605 ) ) ( not ( = ?auto_12617 ?auto_12611 ) ) ( not ( = ?auto_12617 ?auto_12607 ) ) ( not ( = ?auto_12617 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12606 ) ) ( not ( = ?auto_12622 ?auto_12618 ) ) ( not ( = ?auto_12622 ?auto_12604 ) ) ( not ( = ?auto_12622 ?auto_12620 ) ) ( not ( = ?auto_12622 ?auto_12608 ) ) ( not ( = ?auto_12622 ?auto_12619 ) ) ( not ( = ?auto_12622 ?auto_12609 ) ) ( not ( = ?auto_12588 ?auto_12594 ) ) ( not ( = ?auto_12588 ?auto_12599 ) ) ( not ( = ?auto_12589 ?auto_12594 ) ) ( not ( = ?auto_12589 ?auto_12599 ) ) ( not ( = ?auto_12590 ?auto_12594 ) ) ( not ( = ?auto_12590 ?auto_12599 ) ) ( not ( = ?auto_12591 ?auto_12594 ) ) ( not ( = ?auto_12591 ?auto_12599 ) ) ( not ( = ?auto_12592 ?auto_12594 ) ) ( not ( = ?auto_12592 ?auto_12599 ) ) ( not ( = ?auto_12595 ?auto_12594 ) ) ( not ( = ?auto_12595 ?auto_12599 ) ) ( not ( = ?auto_12593 ?auto_12594 ) ) ( not ( = ?auto_12593 ?auto_12599 ) ) ( not ( = ?auto_12597 ?auto_12594 ) ) ( not ( = ?auto_12597 ?auto_12599 ) ) ( not ( = ?auto_12594 ?auto_12622 ) ) ( not ( = ?auto_12594 ?auto_12606 ) ) ( not ( = ?auto_12594 ?auto_12618 ) ) ( not ( = ?auto_12594 ?auto_12604 ) ) ( not ( = ?auto_12594 ?auto_12620 ) ) ( not ( = ?auto_12594 ?auto_12608 ) ) ( not ( = ?auto_12594 ?auto_12619 ) ) ( not ( = ?auto_12594 ?auto_12609 ) ) ( not ( = ?auto_12603 ?auto_12621 ) ) ( not ( = ?auto_12603 ?auto_12614 ) ) ( not ( = ?auto_12603 ?auto_12613 ) ) ( not ( = ?auto_12603 ?auto_12615 ) ) ( not ( = ?auto_12603 ?auto_12610 ) ) ( not ( = ?auto_12603 ?auto_12616 ) ) ( not ( = ?auto_12601 ?auto_12617 ) ) ( not ( = ?auto_12601 ?auto_12612 ) ) ( not ( = ?auto_12601 ?auto_12605 ) ) ( not ( = ?auto_12601 ?auto_12611 ) ) ( not ( = ?auto_12601 ?auto_12607 ) ) ( not ( = ?auto_12601 ?auto_12623 ) ) ( not ( = ?auto_12599 ?auto_12622 ) ) ( not ( = ?auto_12599 ?auto_12606 ) ) ( not ( = ?auto_12599 ?auto_12618 ) ) ( not ( = ?auto_12599 ?auto_12604 ) ) ( not ( = ?auto_12599 ?auto_12620 ) ) ( not ( = ?auto_12599 ?auto_12608 ) ) ( not ( = ?auto_12599 ?auto_12619 ) ) ( not ( = ?auto_12599 ?auto_12609 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12588 ?auto_12589 ?auto_12590 ?auto_12591 ?auto_12592 ?auto_12595 ?auto_12593 ?auto_12597 ?auto_12596 )
      ( MAKE-1CRATE ?auto_12596 ?auto_12594 )
      ( MAKE-9CRATE-VERIFY ?auto_12588 ?auto_12589 ?auto_12590 ?auto_12591 ?auto_12592 ?auto_12595 ?auto_12593 ?auto_12597 ?auto_12596 ?auto_12594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12626 - SURFACE
      ?auto_12627 - SURFACE
    )
    :vars
    (
      ?auto_12628 - HOIST
      ?auto_12629 - PLACE
      ?auto_12631 - PLACE
      ?auto_12632 - HOIST
      ?auto_12633 - SURFACE
      ?auto_12630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12628 ?auto_12629 ) ( SURFACE-AT ?auto_12626 ?auto_12629 ) ( CLEAR ?auto_12626 ) ( IS-CRATE ?auto_12627 ) ( AVAILABLE ?auto_12628 ) ( not ( = ?auto_12631 ?auto_12629 ) ) ( HOIST-AT ?auto_12632 ?auto_12631 ) ( AVAILABLE ?auto_12632 ) ( SURFACE-AT ?auto_12627 ?auto_12631 ) ( ON ?auto_12627 ?auto_12633 ) ( CLEAR ?auto_12627 ) ( TRUCK-AT ?auto_12630 ?auto_12629 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( not ( = ?auto_12626 ?auto_12633 ) ) ( not ( = ?auto_12627 ?auto_12633 ) ) ( not ( = ?auto_12628 ?auto_12632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12630 ?auto_12629 ?auto_12631 )
      ( !LIFT ?auto_12632 ?auto_12627 ?auto_12633 ?auto_12631 )
      ( !LOAD ?auto_12632 ?auto_12627 ?auto_12630 ?auto_12631 )
      ( !DRIVE ?auto_12630 ?auto_12631 ?auto_12629 )
      ( !UNLOAD ?auto_12628 ?auto_12627 ?auto_12630 ?auto_12629 )
      ( !DROP ?auto_12628 ?auto_12627 ?auto_12626 ?auto_12629 )
      ( MAKE-1CRATE-VERIFY ?auto_12626 ?auto_12627 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12645 - SURFACE
      ?auto_12646 - SURFACE
      ?auto_12647 - SURFACE
      ?auto_12648 - SURFACE
      ?auto_12649 - SURFACE
      ?auto_12652 - SURFACE
      ?auto_12650 - SURFACE
      ?auto_12654 - SURFACE
      ?auto_12653 - SURFACE
      ?auto_12651 - SURFACE
      ?auto_12655 - SURFACE
    )
    :vars
    (
      ?auto_12658 - HOIST
      ?auto_12657 - PLACE
      ?auto_12659 - PLACE
      ?auto_12656 - HOIST
      ?auto_12660 - SURFACE
      ?auto_12677 - PLACE
      ?auto_12673 - HOIST
      ?auto_12683 - SURFACE
      ?auto_12678 - PLACE
      ?auto_12671 - HOIST
      ?auto_12684 - SURFACE
      ?auto_12668 - PLACE
      ?auto_12669 - HOIST
      ?auto_12667 - SURFACE
      ?auto_12670 - PLACE
      ?auto_12664 - HOIST
      ?auto_12680 - SURFACE
      ?auto_12674 - PLACE
      ?auto_12672 - HOIST
      ?auto_12681 - SURFACE
      ?auto_12682 - PLACE
      ?auto_12679 - HOIST
      ?auto_12666 - SURFACE
      ?auto_12676 - PLACE
      ?auto_12665 - HOIST
      ?auto_12663 - SURFACE
      ?auto_12675 - SURFACE
      ?auto_12662 - SURFACE
      ?auto_12661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12658 ?auto_12657 ) ( IS-CRATE ?auto_12655 ) ( not ( = ?auto_12659 ?auto_12657 ) ) ( HOIST-AT ?auto_12656 ?auto_12659 ) ( AVAILABLE ?auto_12656 ) ( SURFACE-AT ?auto_12655 ?auto_12659 ) ( ON ?auto_12655 ?auto_12660 ) ( CLEAR ?auto_12655 ) ( not ( = ?auto_12651 ?auto_12655 ) ) ( not ( = ?auto_12651 ?auto_12660 ) ) ( not ( = ?auto_12655 ?auto_12660 ) ) ( not ( = ?auto_12658 ?auto_12656 ) ) ( IS-CRATE ?auto_12651 ) ( not ( = ?auto_12677 ?auto_12657 ) ) ( HOIST-AT ?auto_12673 ?auto_12677 ) ( AVAILABLE ?auto_12673 ) ( SURFACE-AT ?auto_12651 ?auto_12677 ) ( ON ?auto_12651 ?auto_12683 ) ( CLEAR ?auto_12651 ) ( not ( = ?auto_12653 ?auto_12651 ) ) ( not ( = ?auto_12653 ?auto_12683 ) ) ( not ( = ?auto_12651 ?auto_12683 ) ) ( not ( = ?auto_12658 ?auto_12673 ) ) ( IS-CRATE ?auto_12653 ) ( not ( = ?auto_12678 ?auto_12657 ) ) ( HOIST-AT ?auto_12671 ?auto_12678 ) ( AVAILABLE ?auto_12671 ) ( SURFACE-AT ?auto_12653 ?auto_12678 ) ( ON ?auto_12653 ?auto_12684 ) ( CLEAR ?auto_12653 ) ( not ( = ?auto_12654 ?auto_12653 ) ) ( not ( = ?auto_12654 ?auto_12684 ) ) ( not ( = ?auto_12653 ?auto_12684 ) ) ( not ( = ?auto_12658 ?auto_12671 ) ) ( IS-CRATE ?auto_12654 ) ( not ( = ?auto_12668 ?auto_12657 ) ) ( HOIST-AT ?auto_12669 ?auto_12668 ) ( SURFACE-AT ?auto_12654 ?auto_12668 ) ( ON ?auto_12654 ?auto_12667 ) ( CLEAR ?auto_12654 ) ( not ( = ?auto_12650 ?auto_12654 ) ) ( not ( = ?auto_12650 ?auto_12667 ) ) ( not ( = ?auto_12654 ?auto_12667 ) ) ( not ( = ?auto_12658 ?auto_12669 ) ) ( IS-CRATE ?auto_12650 ) ( not ( = ?auto_12670 ?auto_12657 ) ) ( HOIST-AT ?auto_12664 ?auto_12670 ) ( AVAILABLE ?auto_12664 ) ( SURFACE-AT ?auto_12650 ?auto_12670 ) ( ON ?auto_12650 ?auto_12680 ) ( CLEAR ?auto_12650 ) ( not ( = ?auto_12652 ?auto_12650 ) ) ( not ( = ?auto_12652 ?auto_12680 ) ) ( not ( = ?auto_12650 ?auto_12680 ) ) ( not ( = ?auto_12658 ?auto_12664 ) ) ( IS-CRATE ?auto_12652 ) ( not ( = ?auto_12674 ?auto_12657 ) ) ( HOIST-AT ?auto_12672 ?auto_12674 ) ( SURFACE-AT ?auto_12652 ?auto_12674 ) ( ON ?auto_12652 ?auto_12681 ) ( CLEAR ?auto_12652 ) ( not ( = ?auto_12649 ?auto_12652 ) ) ( not ( = ?auto_12649 ?auto_12681 ) ) ( not ( = ?auto_12652 ?auto_12681 ) ) ( not ( = ?auto_12658 ?auto_12672 ) ) ( IS-CRATE ?auto_12649 ) ( not ( = ?auto_12682 ?auto_12657 ) ) ( HOIST-AT ?auto_12679 ?auto_12682 ) ( AVAILABLE ?auto_12679 ) ( SURFACE-AT ?auto_12649 ?auto_12682 ) ( ON ?auto_12649 ?auto_12666 ) ( CLEAR ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12648 ?auto_12666 ) ) ( not ( = ?auto_12649 ?auto_12666 ) ) ( not ( = ?auto_12658 ?auto_12679 ) ) ( IS-CRATE ?auto_12648 ) ( not ( = ?auto_12676 ?auto_12657 ) ) ( HOIST-AT ?auto_12665 ?auto_12676 ) ( AVAILABLE ?auto_12665 ) ( SURFACE-AT ?auto_12648 ?auto_12676 ) ( ON ?auto_12648 ?auto_12663 ) ( CLEAR ?auto_12648 ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12663 ) ) ( not ( = ?auto_12648 ?auto_12663 ) ) ( not ( = ?auto_12658 ?auto_12665 ) ) ( IS-CRATE ?auto_12647 ) ( AVAILABLE ?auto_12672 ) ( SURFACE-AT ?auto_12647 ?auto_12674 ) ( ON ?auto_12647 ?auto_12675 ) ( CLEAR ?auto_12647 ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12675 ) ) ( not ( = ?auto_12647 ?auto_12675 ) ) ( SURFACE-AT ?auto_12645 ?auto_12657 ) ( CLEAR ?auto_12645 ) ( IS-CRATE ?auto_12646 ) ( AVAILABLE ?auto_12658 ) ( AVAILABLE ?auto_12669 ) ( SURFACE-AT ?auto_12646 ?auto_12668 ) ( ON ?auto_12646 ?auto_12662 ) ( CLEAR ?auto_12646 ) ( TRUCK-AT ?auto_12661 ?auto_12657 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12662 ) ) ( not ( = ?auto_12646 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12645 ?auto_12675 ) ) ( not ( = ?auto_12647 ?auto_12662 ) ) ( not ( = ?auto_12674 ?auto_12668 ) ) ( not ( = ?auto_12672 ?auto_12669 ) ) ( not ( = ?auto_12675 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12648 ) ) ( not ( = ?auto_12645 ?auto_12663 ) ) ( not ( = ?auto_12646 ?auto_12648 ) ) ( not ( = ?auto_12646 ?auto_12663 ) ) ( not ( = ?auto_12648 ?auto_12675 ) ) ( not ( = ?auto_12648 ?auto_12662 ) ) ( not ( = ?auto_12676 ?auto_12674 ) ) ( not ( = ?auto_12676 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12672 ) ) ( not ( = ?auto_12665 ?auto_12669 ) ) ( not ( = ?auto_12663 ?auto_12675 ) ) ( not ( = ?auto_12663 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12649 ) ) ( not ( = ?auto_12645 ?auto_12666 ) ) ( not ( = ?auto_12646 ?auto_12649 ) ) ( not ( = ?auto_12646 ?auto_12666 ) ) ( not ( = ?auto_12647 ?auto_12649 ) ) ( not ( = ?auto_12647 ?auto_12666 ) ) ( not ( = ?auto_12649 ?auto_12663 ) ) ( not ( = ?auto_12649 ?auto_12675 ) ) ( not ( = ?auto_12649 ?auto_12662 ) ) ( not ( = ?auto_12682 ?auto_12676 ) ) ( not ( = ?auto_12682 ?auto_12674 ) ) ( not ( = ?auto_12682 ?auto_12668 ) ) ( not ( = ?auto_12679 ?auto_12665 ) ) ( not ( = ?auto_12679 ?auto_12672 ) ) ( not ( = ?auto_12679 ?auto_12669 ) ) ( not ( = ?auto_12666 ?auto_12663 ) ) ( not ( = ?auto_12666 ?auto_12675 ) ) ( not ( = ?auto_12666 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12652 ) ) ( not ( = ?auto_12645 ?auto_12681 ) ) ( not ( = ?auto_12646 ?auto_12652 ) ) ( not ( = ?auto_12646 ?auto_12681 ) ) ( not ( = ?auto_12647 ?auto_12652 ) ) ( not ( = ?auto_12647 ?auto_12681 ) ) ( not ( = ?auto_12648 ?auto_12652 ) ) ( not ( = ?auto_12648 ?auto_12681 ) ) ( not ( = ?auto_12652 ?auto_12666 ) ) ( not ( = ?auto_12652 ?auto_12663 ) ) ( not ( = ?auto_12652 ?auto_12675 ) ) ( not ( = ?auto_12652 ?auto_12662 ) ) ( not ( = ?auto_12681 ?auto_12666 ) ) ( not ( = ?auto_12681 ?auto_12663 ) ) ( not ( = ?auto_12681 ?auto_12675 ) ) ( not ( = ?auto_12681 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12650 ) ) ( not ( = ?auto_12645 ?auto_12680 ) ) ( not ( = ?auto_12646 ?auto_12650 ) ) ( not ( = ?auto_12646 ?auto_12680 ) ) ( not ( = ?auto_12647 ?auto_12650 ) ) ( not ( = ?auto_12647 ?auto_12680 ) ) ( not ( = ?auto_12648 ?auto_12650 ) ) ( not ( = ?auto_12648 ?auto_12680 ) ) ( not ( = ?auto_12649 ?auto_12650 ) ) ( not ( = ?auto_12649 ?auto_12680 ) ) ( not ( = ?auto_12650 ?auto_12681 ) ) ( not ( = ?auto_12650 ?auto_12666 ) ) ( not ( = ?auto_12650 ?auto_12663 ) ) ( not ( = ?auto_12650 ?auto_12675 ) ) ( not ( = ?auto_12650 ?auto_12662 ) ) ( not ( = ?auto_12670 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12682 ) ) ( not ( = ?auto_12670 ?auto_12676 ) ) ( not ( = ?auto_12670 ?auto_12668 ) ) ( not ( = ?auto_12664 ?auto_12672 ) ) ( not ( = ?auto_12664 ?auto_12679 ) ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12669 ) ) ( not ( = ?auto_12680 ?auto_12681 ) ) ( not ( = ?auto_12680 ?auto_12666 ) ) ( not ( = ?auto_12680 ?auto_12663 ) ) ( not ( = ?auto_12680 ?auto_12675 ) ) ( not ( = ?auto_12680 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12654 ) ) ( not ( = ?auto_12645 ?auto_12667 ) ) ( not ( = ?auto_12646 ?auto_12654 ) ) ( not ( = ?auto_12646 ?auto_12667 ) ) ( not ( = ?auto_12647 ?auto_12654 ) ) ( not ( = ?auto_12647 ?auto_12667 ) ) ( not ( = ?auto_12648 ?auto_12654 ) ) ( not ( = ?auto_12648 ?auto_12667 ) ) ( not ( = ?auto_12649 ?auto_12654 ) ) ( not ( = ?auto_12649 ?auto_12667 ) ) ( not ( = ?auto_12652 ?auto_12654 ) ) ( not ( = ?auto_12652 ?auto_12667 ) ) ( not ( = ?auto_12654 ?auto_12680 ) ) ( not ( = ?auto_12654 ?auto_12681 ) ) ( not ( = ?auto_12654 ?auto_12666 ) ) ( not ( = ?auto_12654 ?auto_12663 ) ) ( not ( = ?auto_12654 ?auto_12675 ) ) ( not ( = ?auto_12654 ?auto_12662 ) ) ( not ( = ?auto_12667 ?auto_12680 ) ) ( not ( = ?auto_12667 ?auto_12681 ) ) ( not ( = ?auto_12667 ?auto_12666 ) ) ( not ( = ?auto_12667 ?auto_12663 ) ) ( not ( = ?auto_12667 ?auto_12675 ) ) ( not ( = ?auto_12667 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12653 ) ) ( not ( = ?auto_12645 ?auto_12684 ) ) ( not ( = ?auto_12646 ?auto_12653 ) ) ( not ( = ?auto_12646 ?auto_12684 ) ) ( not ( = ?auto_12647 ?auto_12653 ) ) ( not ( = ?auto_12647 ?auto_12684 ) ) ( not ( = ?auto_12648 ?auto_12653 ) ) ( not ( = ?auto_12648 ?auto_12684 ) ) ( not ( = ?auto_12649 ?auto_12653 ) ) ( not ( = ?auto_12649 ?auto_12684 ) ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( not ( = ?auto_12652 ?auto_12684 ) ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( not ( = ?auto_12650 ?auto_12684 ) ) ( not ( = ?auto_12653 ?auto_12667 ) ) ( not ( = ?auto_12653 ?auto_12680 ) ) ( not ( = ?auto_12653 ?auto_12681 ) ) ( not ( = ?auto_12653 ?auto_12666 ) ) ( not ( = ?auto_12653 ?auto_12663 ) ) ( not ( = ?auto_12653 ?auto_12675 ) ) ( not ( = ?auto_12653 ?auto_12662 ) ) ( not ( = ?auto_12678 ?auto_12668 ) ) ( not ( = ?auto_12678 ?auto_12670 ) ) ( not ( = ?auto_12678 ?auto_12674 ) ) ( not ( = ?auto_12678 ?auto_12682 ) ) ( not ( = ?auto_12678 ?auto_12676 ) ) ( not ( = ?auto_12671 ?auto_12669 ) ) ( not ( = ?auto_12671 ?auto_12664 ) ) ( not ( = ?auto_12671 ?auto_12672 ) ) ( not ( = ?auto_12671 ?auto_12679 ) ) ( not ( = ?auto_12671 ?auto_12665 ) ) ( not ( = ?auto_12684 ?auto_12667 ) ) ( not ( = ?auto_12684 ?auto_12680 ) ) ( not ( = ?auto_12684 ?auto_12681 ) ) ( not ( = ?auto_12684 ?auto_12666 ) ) ( not ( = ?auto_12684 ?auto_12663 ) ) ( not ( = ?auto_12684 ?auto_12675 ) ) ( not ( = ?auto_12684 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12651 ) ) ( not ( = ?auto_12645 ?auto_12683 ) ) ( not ( = ?auto_12646 ?auto_12651 ) ) ( not ( = ?auto_12646 ?auto_12683 ) ) ( not ( = ?auto_12647 ?auto_12651 ) ) ( not ( = ?auto_12647 ?auto_12683 ) ) ( not ( = ?auto_12648 ?auto_12651 ) ) ( not ( = ?auto_12648 ?auto_12683 ) ) ( not ( = ?auto_12649 ?auto_12651 ) ) ( not ( = ?auto_12649 ?auto_12683 ) ) ( not ( = ?auto_12652 ?auto_12651 ) ) ( not ( = ?auto_12652 ?auto_12683 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12683 ) ) ( not ( = ?auto_12654 ?auto_12651 ) ) ( not ( = ?auto_12654 ?auto_12683 ) ) ( not ( = ?auto_12651 ?auto_12684 ) ) ( not ( = ?auto_12651 ?auto_12667 ) ) ( not ( = ?auto_12651 ?auto_12680 ) ) ( not ( = ?auto_12651 ?auto_12681 ) ) ( not ( = ?auto_12651 ?auto_12666 ) ) ( not ( = ?auto_12651 ?auto_12663 ) ) ( not ( = ?auto_12651 ?auto_12675 ) ) ( not ( = ?auto_12651 ?auto_12662 ) ) ( not ( = ?auto_12677 ?auto_12678 ) ) ( not ( = ?auto_12677 ?auto_12668 ) ) ( not ( = ?auto_12677 ?auto_12670 ) ) ( not ( = ?auto_12677 ?auto_12674 ) ) ( not ( = ?auto_12677 ?auto_12682 ) ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( not ( = ?auto_12673 ?auto_12671 ) ) ( not ( = ?auto_12673 ?auto_12669 ) ) ( not ( = ?auto_12673 ?auto_12664 ) ) ( not ( = ?auto_12673 ?auto_12672 ) ) ( not ( = ?auto_12673 ?auto_12679 ) ) ( not ( = ?auto_12673 ?auto_12665 ) ) ( not ( = ?auto_12683 ?auto_12684 ) ) ( not ( = ?auto_12683 ?auto_12667 ) ) ( not ( = ?auto_12683 ?auto_12680 ) ) ( not ( = ?auto_12683 ?auto_12681 ) ) ( not ( = ?auto_12683 ?auto_12666 ) ) ( not ( = ?auto_12683 ?auto_12663 ) ) ( not ( = ?auto_12683 ?auto_12675 ) ) ( not ( = ?auto_12683 ?auto_12662 ) ) ( not ( = ?auto_12645 ?auto_12655 ) ) ( not ( = ?auto_12645 ?auto_12660 ) ) ( not ( = ?auto_12646 ?auto_12655 ) ) ( not ( = ?auto_12646 ?auto_12660 ) ) ( not ( = ?auto_12647 ?auto_12655 ) ) ( not ( = ?auto_12647 ?auto_12660 ) ) ( not ( = ?auto_12648 ?auto_12655 ) ) ( not ( = ?auto_12648 ?auto_12660 ) ) ( not ( = ?auto_12649 ?auto_12655 ) ) ( not ( = ?auto_12649 ?auto_12660 ) ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( not ( = ?auto_12652 ?auto_12660 ) ) ( not ( = ?auto_12650 ?auto_12655 ) ) ( not ( = ?auto_12650 ?auto_12660 ) ) ( not ( = ?auto_12654 ?auto_12655 ) ) ( not ( = ?auto_12654 ?auto_12660 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12660 ) ) ( not ( = ?auto_12655 ?auto_12683 ) ) ( not ( = ?auto_12655 ?auto_12684 ) ) ( not ( = ?auto_12655 ?auto_12667 ) ) ( not ( = ?auto_12655 ?auto_12680 ) ) ( not ( = ?auto_12655 ?auto_12681 ) ) ( not ( = ?auto_12655 ?auto_12666 ) ) ( not ( = ?auto_12655 ?auto_12663 ) ) ( not ( = ?auto_12655 ?auto_12675 ) ) ( not ( = ?auto_12655 ?auto_12662 ) ) ( not ( = ?auto_12659 ?auto_12677 ) ) ( not ( = ?auto_12659 ?auto_12678 ) ) ( not ( = ?auto_12659 ?auto_12668 ) ) ( not ( = ?auto_12659 ?auto_12670 ) ) ( not ( = ?auto_12659 ?auto_12674 ) ) ( not ( = ?auto_12659 ?auto_12682 ) ) ( not ( = ?auto_12659 ?auto_12676 ) ) ( not ( = ?auto_12656 ?auto_12673 ) ) ( not ( = ?auto_12656 ?auto_12671 ) ) ( not ( = ?auto_12656 ?auto_12669 ) ) ( not ( = ?auto_12656 ?auto_12664 ) ) ( not ( = ?auto_12656 ?auto_12672 ) ) ( not ( = ?auto_12656 ?auto_12679 ) ) ( not ( = ?auto_12656 ?auto_12665 ) ) ( not ( = ?auto_12660 ?auto_12683 ) ) ( not ( = ?auto_12660 ?auto_12684 ) ) ( not ( = ?auto_12660 ?auto_12667 ) ) ( not ( = ?auto_12660 ?auto_12680 ) ) ( not ( = ?auto_12660 ?auto_12681 ) ) ( not ( = ?auto_12660 ?auto_12666 ) ) ( not ( = ?auto_12660 ?auto_12663 ) ) ( not ( = ?auto_12660 ?auto_12675 ) ) ( not ( = ?auto_12660 ?auto_12662 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12648 ?auto_12649 ?auto_12652 ?auto_12650 ?auto_12654 ?auto_12653 ?auto_12651 )
      ( MAKE-1CRATE ?auto_12651 ?auto_12655 )
      ( MAKE-10CRATE-VERIFY ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12648 ?auto_12649 ?auto_12652 ?auto_12650 ?auto_12654 ?auto_12653 ?auto_12651 ?auto_12655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12687 - SURFACE
      ?auto_12688 - SURFACE
    )
    :vars
    (
      ?auto_12689 - HOIST
      ?auto_12690 - PLACE
      ?auto_12692 - PLACE
      ?auto_12693 - HOIST
      ?auto_12694 - SURFACE
      ?auto_12691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12689 ?auto_12690 ) ( SURFACE-AT ?auto_12687 ?auto_12690 ) ( CLEAR ?auto_12687 ) ( IS-CRATE ?auto_12688 ) ( AVAILABLE ?auto_12689 ) ( not ( = ?auto_12692 ?auto_12690 ) ) ( HOIST-AT ?auto_12693 ?auto_12692 ) ( AVAILABLE ?auto_12693 ) ( SURFACE-AT ?auto_12688 ?auto_12692 ) ( ON ?auto_12688 ?auto_12694 ) ( CLEAR ?auto_12688 ) ( TRUCK-AT ?auto_12691 ?auto_12690 ) ( not ( = ?auto_12687 ?auto_12688 ) ) ( not ( = ?auto_12687 ?auto_12694 ) ) ( not ( = ?auto_12688 ?auto_12694 ) ) ( not ( = ?auto_12689 ?auto_12693 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12691 ?auto_12690 ?auto_12692 )
      ( !LIFT ?auto_12693 ?auto_12688 ?auto_12694 ?auto_12692 )
      ( !LOAD ?auto_12693 ?auto_12688 ?auto_12691 ?auto_12692 )
      ( !DRIVE ?auto_12691 ?auto_12692 ?auto_12690 )
      ( !UNLOAD ?auto_12689 ?auto_12688 ?auto_12691 ?auto_12690 )
      ( !DROP ?auto_12689 ?auto_12688 ?auto_12687 ?auto_12690 )
      ( MAKE-1CRATE-VERIFY ?auto_12687 ?auto_12688 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12707 - SURFACE
      ?auto_12708 - SURFACE
      ?auto_12709 - SURFACE
      ?auto_12710 - SURFACE
      ?auto_12711 - SURFACE
      ?auto_12714 - SURFACE
      ?auto_12712 - SURFACE
      ?auto_12716 - SURFACE
      ?auto_12715 - SURFACE
      ?auto_12713 - SURFACE
      ?auto_12718 - SURFACE
      ?auto_12717 - SURFACE
    )
    :vars
    (
      ?auto_12719 - HOIST
      ?auto_12721 - PLACE
      ?auto_12720 - PLACE
      ?auto_12724 - HOIST
      ?auto_12722 - SURFACE
      ?auto_12726 - PLACE
      ?auto_12745 - HOIST
      ?auto_12734 - SURFACE
      ?auto_12731 - PLACE
      ?auto_12742 - HOIST
      ?auto_12728 - SURFACE
      ?auto_12740 - PLACE
      ?auto_12727 - HOIST
      ?auto_12725 - SURFACE
      ?auto_12736 - SURFACE
      ?auto_12735 - PLACE
      ?auto_12741 - HOIST
      ?auto_12738 - SURFACE
      ?auto_12732 - PLACE
      ?auto_12733 - HOIST
      ?auto_12748 - SURFACE
      ?auto_12747 - PLACE
      ?auto_12743 - HOIST
      ?auto_12744 - SURFACE
      ?auto_12746 - PLACE
      ?auto_12739 - HOIST
      ?auto_12729 - SURFACE
      ?auto_12730 - SURFACE
      ?auto_12737 - SURFACE
      ?auto_12723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12719 ?auto_12721 ) ( IS-CRATE ?auto_12717 ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( HOIST-AT ?auto_12724 ?auto_12720 ) ( SURFACE-AT ?auto_12717 ?auto_12720 ) ( ON ?auto_12717 ?auto_12722 ) ( CLEAR ?auto_12717 ) ( not ( = ?auto_12718 ?auto_12717 ) ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( not ( = ?auto_12717 ?auto_12722 ) ) ( not ( = ?auto_12719 ?auto_12724 ) ) ( IS-CRATE ?auto_12718 ) ( not ( = ?auto_12726 ?auto_12721 ) ) ( HOIST-AT ?auto_12745 ?auto_12726 ) ( AVAILABLE ?auto_12745 ) ( SURFACE-AT ?auto_12718 ?auto_12726 ) ( ON ?auto_12718 ?auto_12734 ) ( CLEAR ?auto_12718 ) ( not ( = ?auto_12713 ?auto_12718 ) ) ( not ( = ?auto_12713 ?auto_12734 ) ) ( not ( = ?auto_12718 ?auto_12734 ) ) ( not ( = ?auto_12719 ?auto_12745 ) ) ( IS-CRATE ?auto_12713 ) ( not ( = ?auto_12731 ?auto_12721 ) ) ( HOIST-AT ?auto_12742 ?auto_12731 ) ( AVAILABLE ?auto_12742 ) ( SURFACE-AT ?auto_12713 ?auto_12731 ) ( ON ?auto_12713 ?auto_12728 ) ( CLEAR ?auto_12713 ) ( not ( = ?auto_12715 ?auto_12713 ) ) ( not ( = ?auto_12715 ?auto_12728 ) ) ( not ( = ?auto_12713 ?auto_12728 ) ) ( not ( = ?auto_12719 ?auto_12742 ) ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12740 ?auto_12721 ) ) ( HOIST-AT ?auto_12727 ?auto_12740 ) ( AVAILABLE ?auto_12727 ) ( SURFACE-AT ?auto_12715 ?auto_12740 ) ( ON ?auto_12715 ?auto_12725 ) ( CLEAR ?auto_12715 ) ( not ( = ?auto_12716 ?auto_12715 ) ) ( not ( = ?auto_12716 ?auto_12725 ) ) ( not ( = ?auto_12715 ?auto_12725 ) ) ( not ( = ?auto_12719 ?auto_12727 ) ) ( IS-CRATE ?auto_12716 ) ( SURFACE-AT ?auto_12716 ?auto_12720 ) ( ON ?auto_12716 ?auto_12736 ) ( CLEAR ?auto_12716 ) ( not ( = ?auto_12712 ?auto_12716 ) ) ( not ( = ?auto_12712 ?auto_12736 ) ) ( not ( = ?auto_12716 ?auto_12736 ) ) ( IS-CRATE ?auto_12712 ) ( not ( = ?auto_12735 ?auto_12721 ) ) ( HOIST-AT ?auto_12741 ?auto_12735 ) ( AVAILABLE ?auto_12741 ) ( SURFACE-AT ?auto_12712 ?auto_12735 ) ( ON ?auto_12712 ?auto_12738 ) ( CLEAR ?auto_12712 ) ( not ( = ?auto_12714 ?auto_12712 ) ) ( not ( = ?auto_12714 ?auto_12738 ) ) ( not ( = ?auto_12712 ?auto_12738 ) ) ( not ( = ?auto_12719 ?auto_12741 ) ) ( IS-CRATE ?auto_12714 ) ( not ( = ?auto_12732 ?auto_12721 ) ) ( HOIST-AT ?auto_12733 ?auto_12732 ) ( SURFACE-AT ?auto_12714 ?auto_12732 ) ( ON ?auto_12714 ?auto_12748 ) ( CLEAR ?auto_12714 ) ( not ( = ?auto_12711 ?auto_12714 ) ) ( not ( = ?auto_12711 ?auto_12748 ) ) ( not ( = ?auto_12714 ?auto_12748 ) ) ( not ( = ?auto_12719 ?auto_12733 ) ) ( IS-CRATE ?auto_12711 ) ( not ( = ?auto_12747 ?auto_12721 ) ) ( HOIST-AT ?auto_12743 ?auto_12747 ) ( AVAILABLE ?auto_12743 ) ( SURFACE-AT ?auto_12711 ?auto_12747 ) ( ON ?auto_12711 ?auto_12744 ) ( CLEAR ?auto_12711 ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12744 ) ) ( not ( = ?auto_12711 ?auto_12744 ) ) ( not ( = ?auto_12719 ?auto_12743 ) ) ( IS-CRATE ?auto_12710 ) ( not ( = ?auto_12746 ?auto_12721 ) ) ( HOIST-AT ?auto_12739 ?auto_12746 ) ( AVAILABLE ?auto_12739 ) ( SURFACE-AT ?auto_12710 ?auto_12746 ) ( ON ?auto_12710 ?auto_12729 ) ( CLEAR ?auto_12710 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12729 ) ) ( not ( = ?auto_12710 ?auto_12729 ) ) ( not ( = ?auto_12719 ?auto_12739 ) ) ( IS-CRATE ?auto_12709 ) ( AVAILABLE ?auto_12733 ) ( SURFACE-AT ?auto_12709 ?auto_12732 ) ( ON ?auto_12709 ?auto_12730 ) ( CLEAR ?auto_12709 ) ( not ( = ?auto_12708 ?auto_12709 ) ) ( not ( = ?auto_12708 ?auto_12730 ) ) ( not ( = ?auto_12709 ?auto_12730 ) ) ( SURFACE-AT ?auto_12707 ?auto_12721 ) ( CLEAR ?auto_12707 ) ( IS-CRATE ?auto_12708 ) ( AVAILABLE ?auto_12719 ) ( AVAILABLE ?auto_12724 ) ( SURFACE-AT ?auto_12708 ?auto_12720 ) ( ON ?auto_12708 ?auto_12737 ) ( CLEAR ?auto_12708 ) ( TRUCK-AT ?auto_12723 ?auto_12721 ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( not ( = ?auto_12707 ?auto_12737 ) ) ( not ( = ?auto_12708 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12709 ) ) ( not ( = ?auto_12707 ?auto_12730 ) ) ( not ( = ?auto_12709 ?auto_12737 ) ) ( not ( = ?auto_12732 ?auto_12720 ) ) ( not ( = ?auto_12733 ?auto_12724 ) ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12710 ) ) ( not ( = ?auto_12707 ?auto_12729 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( not ( = ?auto_12708 ?auto_12729 ) ) ( not ( = ?auto_12710 ?auto_12730 ) ) ( not ( = ?auto_12710 ?auto_12737 ) ) ( not ( = ?auto_12746 ?auto_12732 ) ) ( not ( = ?auto_12746 ?auto_12720 ) ) ( not ( = ?auto_12739 ?auto_12733 ) ) ( not ( = ?auto_12739 ?auto_12724 ) ) ( not ( = ?auto_12729 ?auto_12730 ) ) ( not ( = ?auto_12729 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12711 ) ) ( not ( = ?auto_12707 ?auto_12744 ) ) ( not ( = ?auto_12708 ?auto_12711 ) ) ( not ( = ?auto_12708 ?auto_12744 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12709 ?auto_12744 ) ) ( not ( = ?auto_12711 ?auto_12729 ) ) ( not ( = ?auto_12711 ?auto_12730 ) ) ( not ( = ?auto_12711 ?auto_12737 ) ) ( not ( = ?auto_12747 ?auto_12746 ) ) ( not ( = ?auto_12747 ?auto_12732 ) ) ( not ( = ?auto_12747 ?auto_12720 ) ) ( not ( = ?auto_12743 ?auto_12739 ) ) ( not ( = ?auto_12743 ?auto_12733 ) ) ( not ( = ?auto_12743 ?auto_12724 ) ) ( not ( = ?auto_12744 ?auto_12729 ) ) ( not ( = ?auto_12744 ?auto_12730 ) ) ( not ( = ?auto_12744 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12714 ) ) ( not ( = ?auto_12707 ?auto_12748 ) ) ( not ( = ?auto_12708 ?auto_12714 ) ) ( not ( = ?auto_12708 ?auto_12748 ) ) ( not ( = ?auto_12709 ?auto_12714 ) ) ( not ( = ?auto_12709 ?auto_12748 ) ) ( not ( = ?auto_12710 ?auto_12714 ) ) ( not ( = ?auto_12710 ?auto_12748 ) ) ( not ( = ?auto_12714 ?auto_12744 ) ) ( not ( = ?auto_12714 ?auto_12729 ) ) ( not ( = ?auto_12714 ?auto_12730 ) ) ( not ( = ?auto_12714 ?auto_12737 ) ) ( not ( = ?auto_12748 ?auto_12744 ) ) ( not ( = ?auto_12748 ?auto_12729 ) ) ( not ( = ?auto_12748 ?auto_12730 ) ) ( not ( = ?auto_12748 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12712 ) ) ( not ( = ?auto_12707 ?auto_12738 ) ) ( not ( = ?auto_12708 ?auto_12712 ) ) ( not ( = ?auto_12708 ?auto_12738 ) ) ( not ( = ?auto_12709 ?auto_12712 ) ) ( not ( = ?auto_12709 ?auto_12738 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12738 ) ) ( not ( = ?auto_12711 ?auto_12712 ) ) ( not ( = ?auto_12711 ?auto_12738 ) ) ( not ( = ?auto_12712 ?auto_12748 ) ) ( not ( = ?auto_12712 ?auto_12744 ) ) ( not ( = ?auto_12712 ?auto_12729 ) ) ( not ( = ?auto_12712 ?auto_12730 ) ) ( not ( = ?auto_12712 ?auto_12737 ) ) ( not ( = ?auto_12735 ?auto_12732 ) ) ( not ( = ?auto_12735 ?auto_12747 ) ) ( not ( = ?auto_12735 ?auto_12746 ) ) ( not ( = ?auto_12735 ?auto_12720 ) ) ( not ( = ?auto_12741 ?auto_12733 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12739 ) ) ( not ( = ?auto_12741 ?auto_12724 ) ) ( not ( = ?auto_12738 ?auto_12748 ) ) ( not ( = ?auto_12738 ?auto_12744 ) ) ( not ( = ?auto_12738 ?auto_12729 ) ) ( not ( = ?auto_12738 ?auto_12730 ) ) ( not ( = ?auto_12738 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12716 ) ) ( not ( = ?auto_12707 ?auto_12736 ) ) ( not ( = ?auto_12708 ?auto_12716 ) ) ( not ( = ?auto_12708 ?auto_12736 ) ) ( not ( = ?auto_12709 ?auto_12716 ) ) ( not ( = ?auto_12709 ?auto_12736 ) ) ( not ( = ?auto_12710 ?auto_12716 ) ) ( not ( = ?auto_12710 ?auto_12736 ) ) ( not ( = ?auto_12711 ?auto_12716 ) ) ( not ( = ?auto_12711 ?auto_12736 ) ) ( not ( = ?auto_12714 ?auto_12716 ) ) ( not ( = ?auto_12714 ?auto_12736 ) ) ( not ( = ?auto_12716 ?auto_12738 ) ) ( not ( = ?auto_12716 ?auto_12748 ) ) ( not ( = ?auto_12716 ?auto_12744 ) ) ( not ( = ?auto_12716 ?auto_12729 ) ) ( not ( = ?auto_12716 ?auto_12730 ) ) ( not ( = ?auto_12716 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12738 ) ) ( not ( = ?auto_12736 ?auto_12748 ) ) ( not ( = ?auto_12736 ?auto_12744 ) ) ( not ( = ?auto_12736 ?auto_12729 ) ) ( not ( = ?auto_12736 ?auto_12730 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12715 ) ) ( not ( = ?auto_12707 ?auto_12725 ) ) ( not ( = ?auto_12708 ?auto_12715 ) ) ( not ( = ?auto_12708 ?auto_12725 ) ) ( not ( = ?auto_12709 ?auto_12715 ) ) ( not ( = ?auto_12709 ?auto_12725 ) ) ( not ( = ?auto_12710 ?auto_12715 ) ) ( not ( = ?auto_12710 ?auto_12725 ) ) ( not ( = ?auto_12711 ?auto_12715 ) ) ( not ( = ?auto_12711 ?auto_12725 ) ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( not ( = ?auto_12714 ?auto_12725 ) ) ( not ( = ?auto_12712 ?auto_12715 ) ) ( not ( = ?auto_12712 ?auto_12725 ) ) ( not ( = ?auto_12715 ?auto_12736 ) ) ( not ( = ?auto_12715 ?auto_12738 ) ) ( not ( = ?auto_12715 ?auto_12748 ) ) ( not ( = ?auto_12715 ?auto_12744 ) ) ( not ( = ?auto_12715 ?auto_12729 ) ) ( not ( = ?auto_12715 ?auto_12730 ) ) ( not ( = ?auto_12715 ?auto_12737 ) ) ( not ( = ?auto_12740 ?auto_12720 ) ) ( not ( = ?auto_12740 ?auto_12735 ) ) ( not ( = ?auto_12740 ?auto_12732 ) ) ( not ( = ?auto_12740 ?auto_12747 ) ) ( not ( = ?auto_12740 ?auto_12746 ) ) ( not ( = ?auto_12727 ?auto_12724 ) ) ( not ( = ?auto_12727 ?auto_12741 ) ) ( not ( = ?auto_12727 ?auto_12733 ) ) ( not ( = ?auto_12727 ?auto_12743 ) ) ( not ( = ?auto_12727 ?auto_12739 ) ) ( not ( = ?auto_12725 ?auto_12736 ) ) ( not ( = ?auto_12725 ?auto_12738 ) ) ( not ( = ?auto_12725 ?auto_12748 ) ) ( not ( = ?auto_12725 ?auto_12744 ) ) ( not ( = ?auto_12725 ?auto_12729 ) ) ( not ( = ?auto_12725 ?auto_12730 ) ) ( not ( = ?auto_12725 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12713 ) ) ( not ( = ?auto_12707 ?auto_12728 ) ) ( not ( = ?auto_12708 ?auto_12713 ) ) ( not ( = ?auto_12708 ?auto_12728 ) ) ( not ( = ?auto_12709 ?auto_12713 ) ) ( not ( = ?auto_12709 ?auto_12728 ) ) ( not ( = ?auto_12710 ?auto_12713 ) ) ( not ( = ?auto_12710 ?auto_12728 ) ) ( not ( = ?auto_12711 ?auto_12713 ) ) ( not ( = ?auto_12711 ?auto_12728 ) ) ( not ( = ?auto_12714 ?auto_12713 ) ) ( not ( = ?auto_12714 ?auto_12728 ) ) ( not ( = ?auto_12712 ?auto_12713 ) ) ( not ( = ?auto_12712 ?auto_12728 ) ) ( not ( = ?auto_12716 ?auto_12713 ) ) ( not ( = ?auto_12716 ?auto_12728 ) ) ( not ( = ?auto_12713 ?auto_12725 ) ) ( not ( = ?auto_12713 ?auto_12736 ) ) ( not ( = ?auto_12713 ?auto_12738 ) ) ( not ( = ?auto_12713 ?auto_12748 ) ) ( not ( = ?auto_12713 ?auto_12744 ) ) ( not ( = ?auto_12713 ?auto_12729 ) ) ( not ( = ?auto_12713 ?auto_12730 ) ) ( not ( = ?auto_12713 ?auto_12737 ) ) ( not ( = ?auto_12731 ?auto_12740 ) ) ( not ( = ?auto_12731 ?auto_12720 ) ) ( not ( = ?auto_12731 ?auto_12735 ) ) ( not ( = ?auto_12731 ?auto_12732 ) ) ( not ( = ?auto_12731 ?auto_12747 ) ) ( not ( = ?auto_12731 ?auto_12746 ) ) ( not ( = ?auto_12742 ?auto_12727 ) ) ( not ( = ?auto_12742 ?auto_12724 ) ) ( not ( = ?auto_12742 ?auto_12741 ) ) ( not ( = ?auto_12742 ?auto_12733 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12739 ) ) ( not ( = ?auto_12728 ?auto_12725 ) ) ( not ( = ?auto_12728 ?auto_12736 ) ) ( not ( = ?auto_12728 ?auto_12738 ) ) ( not ( = ?auto_12728 ?auto_12748 ) ) ( not ( = ?auto_12728 ?auto_12744 ) ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12730 ) ) ( not ( = ?auto_12728 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12718 ) ) ( not ( = ?auto_12707 ?auto_12734 ) ) ( not ( = ?auto_12708 ?auto_12718 ) ) ( not ( = ?auto_12708 ?auto_12734 ) ) ( not ( = ?auto_12709 ?auto_12718 ) ) ( not ( = ?auto_12709 ?auto_12734 ) ) ( not ( = ?auto_12710 ?auto_12718 ) ) ( not ( = ?auto_12710 ?auto_12734 ) ) ( not ( = ?auto_12711 ?auto_12718 ) ) ( not ( = ?auto_12711 ?auto_12734 ) ) ( not ( = ?auto_12714 ?auto_12718 ) ) ( not ( = ?auto_12714 ?auto_12734 ) ) ( not ( = ?auto_12712 ?auto_12718 ) ) ( not ( = ?auto_12712 ?auto_12734 ) ) ( not ( = ?auto_12716 ?auto_12718 ) ) ( not ( = ?auto_12716 ?auto_12734 ) ) ( not ( = ?auto_12715 ?auto_12718 ) ) ( not ( = ?auto_12715 ?auto_12734 ) ) ( not ( = ?auto_12718 ?auto_12728 ) ) ( not ( = ?auto_12718 ?auto_12725 ) ) ( not ( = ?auto_12718 ?auto_12736 ) ) ( not ( = ?auto_12718 ?auto_12738 ) ) ( not ( = ?auto_12718 ?auto_12748 ) ) ( not ( = ?auto_12718 ?auto_12744 ) ) ( not ( = ?auto_12718 ?auto_12729 ) ) ( not ( = ?auto_12718 ?auto_12730 ) ) ( not ( = ?auto_12718 ?auto_12737 ) ) ( not ( = ?auto_12726 ?auto_12731 ) ) ( not ( = ?auto_12726 ?auto_12740 ) ) ( not ( = ?auto_12726 ?auto_12720 ) ) ( not ( = ?auto_12726 ?auto_12735 ) ) ( not ( = ?auto_12726 ?auto_12732 ) ) ( not ( = ?auto_12726 ?auto_12747 ) ) ( not ( = ?auto_12726 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12742 ) ) ( not ( = ?auto_12745 ?auto_12727 ) ) ( not ( = ?auto_12745 ?auto_12724 ) ) ( not ( = ?auto_12745 ?auto_12741 ) ) ( not ( = ?auto_12745 ?auto_12733 ) ) ( not ( = ?auto_12745 ?auto_12743 ) ) ( not ( = ?auto_12745 ?auto_12739 ) ) ( not ( = ?auto_12734 ?auto_12728 ) ) ( not ( = ?auto_12734 ?auto_12725 ) ) ( not ( = ?auto_12734 ?auto_12736 ) ) ( not ( = ?auto_12734 ?auto_12738 ) ) ( not ( = ?auto_12734 ?auto_12748 ) ) ( not ( = ?auto_12734 ?auto_12744 ) ) ( not ( = ?auto_12734 ?auto_12729 ) ) ( not ( = ?auto_12734 ?auto_12730 ) ) ( not ( = ?auto_12734 ?auto_12737 ) ) ( not ( = ?auto_12707 ?auto_12717 ) ) ( not ( = ?auto_12707 ?auto_12722 ) ) ( not ( = ?auto_12708 ?auto_12717 ) ) ( not ( = ?auto_12708 ?auto_12722 ) ) ( not ( = ?auto_12709 ?auto_12717 ) ) ( not ( = ?auto_12709 ?auto_12722 ) ) ( not ( = ?auto_12710 ?auto_12717 ) ) ( not ( = ?auto_12710 ?auto_12722 ) ) ( not ( = ?auto_12711 ?auto_12717 ) ) ( not ( = ?auto_12711 ?auto_12722 ) ) ( not ( = ?auto_12714 ?auto_12717 ) ) ( not ( = ?auto_12714 ?auto_12722 ) ) ( not ( = ?auto_12712 ?auto_12717 ) ) ( not ( = ?auto_12712 ?auto_12722 ) ) ( not ( = ?auto_12716 ?auto_12717 ) ) ( not ( = ?auto_12716 ?auto_12722 ) ) ( not ( = ?auto_12715 ?auto_12717 ) ) ( not ( = ?auto_12715 ?auto_12722 ) ) ( not ( = ?auto_12713 ?auto_12717 ) ) ( not ( = ?auto_12713 ?auto_12722 ) ) ( not ( = ?auto_12717 ?auto_12734 ) ) ( not ( = ?auto_12717 ?auto_12728 ) ) ( not ( = ?auto_12717 ?auto_12725 ) ) ( not ( = ?auto_12717 ?auto_12736 ) ) ( not ( = ?auto_12717 ?auto_12738 ) ) ( not ( = ?auto_12717 ?auto_12748 ) ) ( not ( = ?auto_12717 ?auto_12744 ) ) ( not ( = ?auto_12717 ?auto_12729 ) ) ( not ( = ?auto_12717 ?auto_12730 ) ) ( not ( = ?auto_12717 ?auto_12737 ) ) ( not ( = ?auto_12722 ?auto_12734 ) ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12736 ) ) ( not ( = ?auto_12722 ?auto_12738 ) ) ( not ( = ?auto_12722 ?auto_12748 ) ) ( not ( = ?auto_12722 ?auto_12744 ) ) ( not ( = ?auto_12722 ?auto_12729 ) ) ( not ( = ?auto_12722 ?auto_12730 ) ) ( not ( = ?auto_12722 ?auto_12737 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12707 ?auto_12708 ?auto_12709 ?auto_12710 ?auto_12711 ?auto_12714 ?auto_12712 ?auto_12716 ?auto_12715 ?auto_12713 ?auto_12718 )
      ( MAKE-1CRATE ?auto_12718 ?auto_12717 )
      ( MAKE-11CRATE-VERIFY ?auto_12707 ?auto_12708 ?auto_12709 ?auto_12710 ?auto_12711 ?auto_12714 ?auto_12712 ?auto_12716 ?auto_12715 ?auto_12713 ?auto_12718 ?auto_12717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12751 - SURFACE
      ?auto_12752 - SURFACE
    )
    :vars
    (
      ?auto_12753 - HOIST
      ?auto_12754 - PLACE
      ?auto_12756 - PLACE
      ?auto_12757 - HOIST
      ?auto_12758 - SURFACE
      ?auto_12755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12753 ?auto_12754 ) ( SURFACE-AT ?auto_12751 ?auto_12754 ) ( CLEAR ?auto_12751 ) ( IS-CRATE ?auto_12752 ) ( AVAILABLE ?auto_12753 ) ( not ( = ?auto_12756 ?auto_12754 ) ) ( HOIST-AT ?auto_12757 ?auto_12756 ) ( AVAILABLE ?auto_12757 ) ( SURFACE-AT ?auto_12752 ?auto_12756 ) ( ON ?auto_12752 ?auto_12758 ) ( CLEAR ?auto_12752 ) ( TRUCK-AT ?auto_12755 ?auto_12754 ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12758 ) ) ( not ( = ?auto_12752 ?auto_12758 ) ) ( not ( = ?auto_12753 ?auto_12757 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12755 ?auto_12754 ?auto_12756 )
      ( !LIFT ?auto_12757 ?auto_12752 ?auto_12758 ?auto_12756 )
      ( !LOAD ?auto_12757 ?auto_12752 ?auto_12755 ?auto_12756 )
      ( !DRIVE ?auto_12755 ?auto_12756 ?auto_12754 )
      ( !UNLOAD ?auto_12753 ?auto_12752 ?auto_12755 ?auto_12754 )
      ( !DROP ?auto_12753 ?auto_12752 ?auto_12751 ?auto_12754 )
      ( MAKE-1CRATE-VERIFY ?auto_12751 ?auto_12752 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12772 - SURFACE
      ?auto_12773 - SURFACE
      ?auto_12774 - SURFACE
      ?auto_12775 - SURFACE
      ?auto_12776 - SURFACE
      ?auto_12779 - SURFACE
      ?auto_12777 - SURFACE
      ?auto_12781 - SURFACE
      ?auto_12780 - SURFACE
      ?auto_12778 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12782 - SURFACE
      ?auto_12784 - SURFACE
    )
    :vars
    (
      ?auto_12786 - HOIST
      ?auto_12785 - PLACE
      ?auto_12789 - PLACE
      ?auto_12790 - HOIST
      ?auto_12787 - SURFACE
      ?auto_12811 - PLACE
      ?auto_12813 - HOIST
      ?auto_12792 - SURFACE
      ?auto_12808 - PLACE
      ?auto_12793 - HOIST
      ?auto_12799 - SURFACE
      ?auto_12804 - PLACE
      ?auto_12805 - HOIST
      ?auto_12816 - SURFACE
      ?auto_12800 - PLACE
      ?auto_12802 - HOIST
      ?auto_12817 - SURFACE
      ?auto_12812 - SURFACE
      ?auto_12798 - PLACE
      ?auto_12803 - HOIST
      ?auto_12809 - SURFACE
      ?auto_12806 - PLACE
      ?auto_12796 - HOIST
      ?auto_12801 - SURFACE
      ?auto_12791 - PLACE
      ?auto_12815 - HOIST
      ?auto_12794 - SURFACE
      ?auto_12797 - PLACE
      ?auto_12814 - HOIST
      ?auto_12810 - SURFACE
      ?auto_12795 - SURFACE
      ?auto_12807 - SURFACE
      ?auto_12788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12786 ?auto_12785 ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12789 ?auto_12785 ) ) ( HOIST-AT ?auto_12790 ?auto_12789 ) ( AVAILABLE ?auto_12790 ) ( SURFACE-AT ?auto_12784 ?auto_12789 ) ( ON ?auto_12784 ?auto_12787 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12790 ) ) ( IS-CRATE ?auto_12782 ) ( not ( = ?auto_12811 ?auto_12785 ) ) ( HOIST-AT ?auto_12813 ?auto_12811 ) ( SURFACE-AT ?auto_12782 ?auto_12811 ) ( ON ?auto_12782 ?auto_12792 ) ( CLEAR ?auto_12782 ) ( not ( = ?auto_12783 ?auto_12782 ) ) ( not ( = ?auto_12783 ?auto_12792 ) ) ( not ( = ?auto_12782 ?auto_12792 ) ) ( not ( = ?auto_12786 ?auto_12813 ) ) ( IS-CRATE ?auto_12783 ) ( not ( = ?auto_12808 ?auto_12785 ) ) ( HOIST-AT ?auto_12793 ?auto_12808 ) ( AVAILABLE ?auto_12793 ) ( SURFACE-AT ?auto_12783 ?auto_12808 ) ( ON ?auto_12783 ?auto_12799 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12778 ?auto_12799 ) ) ( not ( = ?auto_12783 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12793 ) ) ( IS-CRATE ?auto_12778 ) ( not ( = ?auto_12804 ?auto_12785 ) ) ( HOIST-AT ?auto_12805 ?auto_12804 ) ( AVAILABLE ?auto_12805 ) ( SURFACE-AT ?auto_12778 ?auto_12804 ) ( ON ?auto_12778 ?auto_12816 ) ( CLEAR ?auto_12778 ) ( not ( = ?auto_12780 ?auto_12778 ) ) ( not ( = ?auto_12780 ?auto_12816 ) ) ( not ( = ?auto_12778 ?auto_12816 ) ) ( not ( = ?auto_12786 ?auto_12805 ) ) ( IS-CRATE ?auto_12780 ) ( not ( = ?auto_12800 ?auto_12785 ) ) ( HOIST-AT ?auto_12802 ?auto_12800 ) ( AVAILABLE ?auto_12802 ) ( SURFACE-AT ?auto_12780 ?auto_12800 ) ( ON ?auto_12780 ?auto_12817 ) ( CLEAR ?auto_12780 ) ( not ( = ?auto_12781 ?auto_12780 ) ) ( not ( = ?auto_12781 ?auto_12817 ) ) ( not ( = ?auto_12780 ?auto_12817 ) ) ( not ( = ?auto_12786 ?auto_12802 ) ) ( IS-CRATE ?auto_12781 ) ( SURFACE-AT ?auto_12781 ?auto_12811 ) ( ON ?auto_12781 ?auto_12812 ) ( CLEAR ?auto_12781 ) ( not ( = ?auto_12777 ?auto_12781 ) ) ( not ( = ?auto_12777 ?auto_12812 ) ) ( not ( = ?auto_12781 ?auto_12812 ) ) ( IS-CRATE ?auto_12777 ) ( not ( = ?auto_12798 ?auto_12785 ) ) ( HOIST-AT ?auto_12803 ?auto_12798 ) ( AVAILABLE ?auto_12803 ) ( SURFACE-AT ?auto_12777 ?auto_12798 ) ( ON ?auto_12777 ?auto_12809 ) ( CLEAR ?auto_12777 ) ( not ( = ?auto_12779 ?auto_12777 ) ) ( not ( = ?auto_12779 ?auto_12809 ) ) ( not ( = ?auto_12777 ?auto_12809 ) ) ( not ( = ?auto_12786 ?auto_12803 ) ) ( IS-CRATE ?auto_12779 ) ( not ( = ?auto_12806 ?auto_12785 ) ) ( HOIST-AT ?auto_12796 ?auto_12806 ) ( SURFACE-AT ?auto_12779 ?auto_12806 ) ( ON ?auto_12779 ?auto_12801 ) ( CLEAR ?auto_12779 ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12776 ?auto_12801 ) ) ( not ( = ?auto_12779 ?auto_12801 ) ) ( not ( = ?auto_12786 ?auto_12796 ) ) ( IS-CRATE ?auto_12776 ) ( not ( = ?auto_12791 ?auto_12785 ) ) ( HOIST-AT ?auto_12815 ?auto_12791 ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12776 ?auto_12791 ) ( ON ?auto_12776 ?auto_12794 ) ( CLEAR ?auto_12776 ) ( not ( = ?auto_12775 ?auto_12776 ) ) ( not ( = ?auto_12775 ?auto_12794 ) ) ( not ( = ?auto_12776 ?auto_12794 ) ) ( not ( = ?auto_12786 ?auto_12815 ) ) ( IS-CRATE ?auto_12775 ) ( not ( = ?auto_12797 ?auto_12785 ) ) ( HOIST-AT ?auto_12814 ?auto_12797 ) ( AVAILABLE ?auto_12814 ) ( SURFACE-AT ?auto_12775 ?auto_12797 ) ( ON ?auto_12775 ?auto_12810 ) ( CLEAR ?auto_12775 ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12810 ) ) ( not ( = ?auto_12775 ?auto_12810 ) ) ( not ( = ?auto_12786 ?auto_12814 ) ) ( IS-CRATE ?auto_12774 ) ( AVAILABLE ?auto_12796 ) ( SURFACE-AT ?auto_12774 ?auto_12806 ) ( ON ?auto_12774 ?auto_12795 ) ( CLEAR ?auto_12774 ) ( not ( = ?auto_12773 ?auto_12774 ) ) ( not ( = ?auto_12773 ?auto_12795 ) ) ( not ( = ?auto_12774 ?auto_12795 ) ) ( SURFACE-AT ?auto_12772 ?auto_12785 ) ( CLEAR ?auto_12772 ) ( IS-CRATE ?auto_12773 ) ( AVAILABLE ?auto_12786 ) ( AVAILABLE ?auto_12813 ) ( SURFACE-AT ?auto_12773 ?auto_12811 ) ( ON ?auto_12773 ?auto_12807 ) ( CLEAR ?auto_12773 ) ( TRUCK-AT ?auto_12788 ?auto_12785 ) ( not ( = ?auto_12772 ?auto_12773 ) ) ( not ( = ?auto_12772 ?auto_12807 ) ) ( not ( = ?auto_12773 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12774 ) ) ( not ( = ?auto_12772 ?auto_12795 ) ) ( not ( = ?auto_12774 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12811 ) ) ( not ( = ?auto_12796 ?auto_12813 ) ) ( not ( = ?auto_12795 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12775 ) ) ( not ( = ?auto_12772 ?auto_12810 ) ) ( not ( = ?auto_12773 ?auto_12775 ) ) ( not ( = ?auto_12773 ?auto_12810 ) ) ( not ( = ?auto_12775 ?auto_12795 ) ) ( not ( = ?auto_12775 ?auto_12807 ) ) ( not ( = ?auto_12797 ?auto_12806 ) ) ( not ( = ?auto_12797 ?auto_12811 ) ) ( not ( = ?auto_12814 ?auto_12796 ) ) ( not ( = ?auto_12814 ?auto_12813 ) ) ( not ( = ?auto_12810 ?auto_12795 ) ) ( not ( = ?auto_12810 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12776 ) ) ( not ( = ?auto_12772 ?auto_12794 ) ) ( not ( = ?auto_12773 ?auto_12776 ) ) ( not ( = ?auto_12773 ?auto_12794 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( not ( = ?auto_12774 ?auto_12794 ) ) ( not ( = ?auto_12776 ?auto_12810 ) ) ( not ( = ?auto_12776 ?auto_12795 ) ) ( not ( = ?auto_12776 ?auto_12807 ) ) ( not ( = ?auto_12791 ?auto_12797 ) ) ( not ( = ?auto_12791 ?auto_12806 ) ) ( not ( = ?auto_12791 ?auto_12811 ) ) ( not ( = ?auto_12815 ?auto_12814 ) ) ( not ( = ?auto_12815 ?auto_12796 ) ) ( not ( = ?auto_12815 ?auto_12813 ) ) ( not ( = ?auto_12794 ?auto_12810 ) ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( not ( = ?auto_12794 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12779 ) ) ( not ( = ?auto_12772 ?auto_12801 ) ) ( not ( = ?auto_12773 ?auto_12779 ) ) ( not ( = ?auto_12773 ?auto_12801 ) ) ( not ( = ?auto_12774 ?auto_12779 ) ) ( not ( = ?auto_12774 ?auto_12801 ) ) ( not ( = ?auto_12775 ?auto_12779 ) ) ( not ( = ?auto_12775 ?auto_12801 ) ) ( not ( = ?auto_12779 ?auto_12794 ) ) ( not ( = ?auto_12779 ?auto_12810 ) ) ( not ( = ?auto_12779 ?auto_12795 ) ) ( not ( = ?auto_12779 ?auto_12807 ) ) ( not ( = ?auto_12801 ?auto_12794 ) ) ( not ( = ?auto_12801 ?auto_12810 ) ) ( not ( = ?auto_12801 ?auto_12795 ) ) ( not ( = ?auto_12801 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12777 ) ) ( not ( = ?auto_12772 ?auto_12809 ) ) ( not ( = ?auto_12773 ?auto_12777 ) ) ( not ( = ?auto_12773 ?auto_12809 ) ) ( not ( = ?auto_12774 ?auto_12777 ) ) ( not ( = ?auto_12774 ?auto_12809 ) ) ( not ( = ?auto_12775 ?auto_12777 ) ) ( not ( = ?auto_12775 ?auto_12809 ) ) ( not ( = ?auto_12776 ?auto_12777 ) ) ( not ( = ?auto_12776 ?auto_12809 ) ) ( not ( = ?auto_12777 ?auto_12801 ) ) ( not ( = ?auto_12777 ?auto_12794 ) ) ( not ( = ?auto_12777 ?auto_12810 ) ) ( not ( = ?auto_12777 ?auto_12795 ) ) ( not ( = ?auto_12777 ?auto_12807 ) ) ( not ( = ?auto_12798 ?auto_12806 ) ) ( not ( = ?auto_12798 ?auto_12791 ) ) ( not ( = ?auto_12798 ?auto_12797 ) ) ( not ( = ?auto_12798 ?auto_12811 ) ) ( not ( = ?auto_12803 ?auto_12796 ) ) ( not ( = ?auto_12803 ?auto_12815 ) ) ( not ( = ?auto_12803 ?auto_12814 ) ) ( not ( = ?auto_12803 ?auto_12813 ) ) ( not ( = ?auto_12809 ?auto_12801 ) ) ( not ( = ?auto_12809 ?auto_12794 ) ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12809 ?auto_12795 ) ) ( not ( = ?auto_12809 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12781 ) ) ( not ( = ?auto_12772 ?auto_12812 ) ) ( not ( = ?auto_12773 ?auto_12781 ) ) ( not ( = ?auto_12773 ?auto_12812 ) ) ( not ( = ?auto_12774 ?auto_12781 ) ) ( not ( = ?auto_12774 ?auto_12812 ) ) ( not ( = ?auto_12775 ?auto_12781 ) ) ( not ( = ?auto_12775 ?auto_12812 ) ) ( not ( = ?auto_12776 ?auto_12781 ) ) ( not ( = ?auto_12776 ?auto_12812 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12812 ) ) ( not ( = ?auto_12781 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12801 ) ) ( not ( = ?auto_12781 ?auto_12794 ) ) ( not ( = ?auto_12781 ?auto_12810 ) ) ( not ( = ?auto_12781 ?auto_12795 ) ) ( not ( = ?auto_12781 ?auto_12807 ) ) ( not ( = ?auto_12812 ?auto_12809 ) ) ( not ( = ?auto_12812 ?auto_12801 ) ) ( not ( = ?auto_12812 ?auto_12794 ) ) ( not ( = ?auto_12812 ?auto_12810 ) ) ( not ( = ?auto_12812 ?auto_12795 ) ) ( not ( = ?auto_12812 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12780 ) ) ( not ( = ?auto_12772 ?auto_12817 ) ) ( not ( = ?auto_12773 ?auto_12780 ) ) ( not ( = ?auto_12773 ?auto_12817 ) ) ( not ( = ?auto_12774 ?auto_12780 ) ) ( not ( = ?auto_12774 ?auto_12817 ) ) ( not ( = ?auto_12775 ?auto_12780 ) ) ( not ( = ?auto_12775 ?auto_12817 ) ) ( not ( = ?auto_12776 ?auto_12780 ) ) ( not ( = ?auto_12776 ?auto_12817 ) ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12817 ) ) ( not ( = ?auto_12777 ?auto_12780 ) ) ( not ( = ?auto_12777 ?auto_12817 ) ) ( not ( = ?auto_12780 ?auto_12812 ) ) ( not ( = ?auto_12780 ?auto_12809 ) ) ( not ( = ?auto_12780 ?auto_12801 ) ) ( not ( = ?auto_12780 ?auto_12794 ) ) ( not ( = ?auto_12780 ?auto_12810 ) ) ( not ( = ?auto_12780 ?auto_12795 ) ) ( not ( = ?auto_12780 ?auto_12807 ) ) ( not ( = ?auto_12800 ?auto_12811 ) ) ( not ( = ?auto_12800 ?auto_12798 ) ) ( not ( = ?auto_12800 ?auto_12806 ) ) ( not ( = ?auto_12800 ?auto_12791 ) ) ( not ( = ?auto_12800 ?auto_12797 ) ) ( not ( = ?auto_12802 ?auto_12813 ) ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( not ( = ?auto_12802 ?auto_12796 ) ) ( not ( = ?auto_12802 ?auto_12815 ) ) ( not ( = ?auto_12802 ?auto_12814 ) ) ( not ( = ?auto_12817 ?auto_12812 ) ) ( not ( = ?auto_12817 ?auto_12809 ) ) ( not ( = ?auto_12817 ?auto_12801 ) ) ( not ( = ?auto_12817 ?auto_12794 ) ) ( not ( = ?auto_12817 ?auto_12810 ) ) ( not ( = ?auto_12817 ?auto_12795 ) ) ( not ( = ?auto_12817 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12778 ) ) ( not ( = ?auto_12772 ?auto_12816 ) ) ( not ( = ?auto_12773 ?auto_12778 ) ) ( not ( = ?auto_12773 ?auto_12816 ) ) ( not ( = ?auto_12774 ?auto_12778 ) ) ( not ( = ?auto_12774 ?auto_12816 ) ) ( not ( = ?auto_12775 ?auto_12778 ) ) ( not ( = ?auto_12775 ?auto_12816 ) ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12776 ?auto_12816 ) ) ( not ( = ?auto_12779 ?auto_12778 ) ) ( not ( = ?auto_12779 ?auto_12816 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12816 ) ) ( not ( = ?auto_12781 ?auto_12778 ) ) ( not ( = ?auto_12781 ?auto_12816 ) ) ( not ( = ?auto_12778 ?auto_12817 ) ) ( not ( = ?auto_12778 ?auto_12812 ) ) ( not ( = ?auto_12778 ?auto_12809 ) ) ( not ( = ?auto_12778 ?auto_12801 ) ) ( not ( = ?auto_12778 ?auto_12794 ) ) ( not ( = ?auto_12778 ?auto_12810 ) ) ( not ( = ?auto_12778 ?auto_12795 ) ) ( not ( = ?auto_12778 ?auto_12807 ) ) ( not ( = ?auto_12804 ?auto_12800 ) ) ( not ( = ?auto_12804 ?auto_12811 ) ) ( not ( = ?auto_12804 ?auto_12798 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( not ( = ?auto_12804 ?auto_12791 ) ) ( not ( = ?auto_12804 ?auto_12797 ) ) ( not ( = ?auto_12805 ?auto_12802 ) ) ( not ( = ?auto_12805 ?auto_12813 ) ) ( not ( = ?auto_12805 ?auto_12803 ) ) ( not ( = ?auto_12805 ?auto_12796 ) ) ( not ( = ?auto_12805 ?auto_12815 ) ) ( not ( = ?auto_12805 ?auto_12814 ) ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( not ( = ?auto_12816 ?auto_12812 ) ) ( not ( = ?auto_12816 ?auto_12809 ) ) ( not ( = ?auto_12816 ?auto_12801 ) ) ( not ( = ?auto_12816 ?auto_12794 ) ) ( not ( = ?auto_12816 ?auto_12810 ) ) ( not ( = ?auto_12816 ?auto_12795 ) ) ( not ( = ?auto_12816 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12783 ) ) ( not ( = ?auto_12772 ?auto_12799 ) ) ( not ( = ?auto_12773 ?auto_12783 ) ) ( not ( = ?auto_12773 ?auto_12799 ) ) ( not ( = ?auto_12774 ?auto_12783 ) ) ( not ( = ?auto_12774 ?auto_12799 ) ) ( not ( = ?auto_12775 ?auto_12783 ) ) ( not ( = ?auto_12775 ?auto_12799 ) ) ( not ( = ?auto_12776 ?auto_12783 ) ) ( not ( = ?auto_12776 ?auto_12799 ) ) ( not ( = ?auto_12779 ?auto_12783 ) ) ( not ( = ?auto_12779 ?auto_12799 ) ) ( not ( = ?auto_12777 ?auto_12783 ) ) ( not ( = ?auto_12777 ?auto_12799 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12799 ) ) ( not ( = ?auto_12780 ?auto_12783 ) ) ( not ( = ?auto_12780 ?auto_12799 ) ) ( not ( = ?auto_12783 ?auto_12816 ) ) ( not ( = ?auto_12783 ?auto_12817 ) ) ( not ( = ?auto_12783 ?auto_12812 ) ) ( not ( = ?auto_12783 ?auto_12809 ) ) ( not ( = ?auto_12783 ?auto_12801 ) ) ( not ( = ?auto_12783 ?auto_12794 ) ) ( not ( = ?auto_12783 ?auto_12810 ) ) ( not ( = ?auto_12783 ?auto_12795 ) ) ( not ( = ?auto_12783 ?auto_12807 ) ) ( not ( = ?auto_12808 ?auto_12804 ) ) ( not ( = ?auto_12808 ?auto_12800 ) ) ( not ( = ?auto_12808 ?auto_12811 ) ) ( not ( = ?auto_12808 ?auto_12798 ) ) ( not ( = ?auto_12808 ?auto_12806 ) ) ( not ( = ?auto_12808 ?auto_12791 ) ) ( not ( = ?auto_12808 ?auto_12797 ) ) ( not ( = ?auto_12793 ?auto_12805 ) ) ( not ( = ?auto_12793 ?auto_12802 ) ) ( not ( = ?auto_12793 ?auto_12813 ) ) ( not ( = ?auto_12793 ?auto_12803 ) ) ( not ( = ?auto_12793 ?auto_12796 ) ) ( not ( = ?auto_12793 ?auto_12815 ) ) ( not ( = ?auto_12793 ?auto_12814 ) ) ( not ( = ?auto_12799 ?auto_12816 ) ) ( not ( = ?auto_12799 ?auto_12817 ) ) ( not ( = ?auto_12799 ?auto_12812 ) ) ( not ( = ?auto_12799 ?auto_12809 ) ) ( not ( = ?auto_12799 ?auto_12801 ) ) ( not ( = ?auto_12799 ?auto_12794 ) ) ( not ( = ?auto_12799 ?auto_12810 ) ) ( not ( = ?auto_12799 ?auto_12795 ) ) ( not ( = ?auto_12799 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12782 ) ) ( not ( = ?auto_12772 ?auto_12792 ) ) ( not ( = ?auto_12773 ?auto_12782 ) ) ( not ( = ?auto_12773 ?auto_12792 ) ) ( not ( = ?auto_12774 ?auto_12782 ) ) ( not ( = ?auto_12774 ?auto_12792 ) ) ( not ( = ?auto_12775 ?auto_12782 ) ) ( not ( = ?auto_12775 ?auto_12792 ) ) ( not ( = ?auto_12776 ?auto_12782 ) ) ( not ( = ?auto_12776 ?auto_12792 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) ( not ( = ?auto_12779 ?auto_12792 ) ) ( not ( = ?auto_12777 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12792 ) ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12792 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12792 ) ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12778 ?auto_12792 ) ) ( not ( = ?auto_12782 ?auto_12799 ) ) ( not ( = ?auto_12782 ?auto_12816 ) ) ( not ( = ?auto_12782 ?auto_12817 ) ) ( not ( = ?auto_12782 ?auto_12812 ) ) ( not ( = ?auto_12782 ?auto_12809 ) ) ( not ( = ?auto_12782 ?auto_12801 ) ) ( not ( = ?auto_12782 ?auto_12794 ) ) ( not ( = ?auto_12782 ?auto_12810 ) ) ( not ( = ?auto_12782 ?auto_12795 ) ) ( not ( = ?auto_12782 ?auto_12807 ) ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12792 ?auto_12816 ) ) ( not ( = ?auto_12792 ?auto_12817 ) ) ( not ( = ?auto_12792 ?auto_12812 ) ) ( not ( = ?auto_12792 ?auto_12809 ) ) ( not ( = ?auto_12792 ?auto_12801 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12810 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12792 ?auto_12807 ) ) ( not ( = ?auto_12772 ?auto_12784 ) ) ( not ( = ?auto_12772 ?auto_12787 ) ) ( not ( = ?auto_12773 ?auto_12784 ) ) ( not ( = ?auto_12773 ?auto_12787 ) ) ( not ( = ?auto_12774 ?auto_12784 ) ) ( not ( = ?auto_12774 ?auto_12787 ) ) ( not ( = ?auto_12775 ?auto_12784 ) ) ( not ( = ?auto_12775 ?auto_12787 ) ) ( not ( = ?auto_12776 ?auto_12784 ) ) ( not ( = ?auto_12776 ?auto_12787 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12787 ) ) ( not ( = ?auto_12777 ?auto_12784 ) ) ( not ( = ?auto_12777 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12780 ?auto_12784 ) ) ( not ( = ?auto_12780 ?auto_12787 ) ) ( not ( = ?auto_12778 ?auto_12784 ) ) ( not ( = ?auto_12778 ?auto_12787 ) ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12792 ) ) ( not ( = ?auto_12784 ?auto_12799 ) ) ( not ( = ?auto_12784 ?auto_12816 ) ) ( not ( = ?auto_12784 ?auto_12817 ) ) ( not ( = ?auto_12784 ?auto_12812 ) ) ( not ( = ?auto_12784 ?auto_12809 ) ) ( not ( = ?auto_12784 ?auto_12801 ) ) ( not ( = ?auto_12784 ?auto_12794 ) ) ( not ( = ?auto_12784 ?auto_12810 ) ) ( not ( = ?auto_12784 ?auto_12795 ) ) ( not ( = ?auto_12784 ?auto_12807 ) ) ( not ( = ?auto_12789 ?auto_12811 ) ) ( not ( = ?auto_12789 ?auto_12808 ) ) ( not ( = ?auto_12789 ?auto_12804 ) ) ( not ( = ?auto_12789 ?auto_12800 ) ) ( not ( = ?auto_12789 ?auto_12798 ) ) ( not ( = ?auto_12789 ?auto_12806 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12797 ) ) ( not ( = ?auto_12790 ?auto_12813 ) ) ( not ( = ?auto_12790 ?auto_12793 ) ) ( not ( = ?auto_12790 ?auto_12805 ) ) ( not ( = ?auto_12790 ?auto_12802 ) ) ( not ( = ?auto_12790 ?auto_12803 ) ) ( not ( = ?auto_12790 ?auto_12796 ) ) ( not ( = ?auto_12790 ?auto_12815 ) ) ( not ( = ?auto_12790 ?auto_12814 ) ) ( not ( = ?auto_12787 ?auto_12792 ) ) ( not ( = ?auto_12787 ?auto_12799 ) ) ( not ( = ?auto_12787 ?auto_12816 ) ) ( not ( = ?auto_12787 ?auto_12817 ) ) ( not ( = ?auto_12787 ?auto_12812 ) ) ( not ( = ?auto_12787 ?auto_12809 ) ) ( not ( = ?auto_12787 ?auto_12801 ) ) ( not ( = ?auto_12787 ?auto_12794 ) ) ( not ( = ?auto_12787 ?auto_12810 ) ) ( not ( = ?auto_12787 ?auto_12795 ) ) ( not ( = ?auto_12787 ?auto_12807 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12772 ?auto_12773 ?auto_12774 ?auto_12775 ?auto_12776 ?auto_12779 ?auto_12777 ?auto_12781 ?auto_12780 ?auto_12778 ?auto_12783 ?auto_12782 )
      ( MAKE-1CRATE ?auto_12782 ?auto_12784 )
      ( MAKE-12CRATE-VERIFY ?auto_12772 ?auto_12773 ?auto_12774 ?auto_12775 ?auto_12776 ?auto_12779 ?auto_12777 ?auto_12781 ?auto_12780 ?auto_12778 ?auto_12783 ?auto_12782 ?auto_12784 ) )
  )

)

