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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12313 - SURFACE
      ?auto_12314 - SURFACE
      ?auto_12315 - SURFACE
    )
    :vars
    (
      ?auto_12317 - HOIST
      ?auto_12320 - PLACE
      ?auto_12319 - PLACE
      ?auto_12316 - HOIST
      ?auto_12321 - SURFACE
      ?auto_12324 - PLACE
      ?auto_12322 - HOIST
      ?auto_12323 - SURFACE
      ?auto_12318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12317 ?auto_12320 ) ( IS-CRATE ?auto_12315 ) ( not ( = ?auto_12319 ?auto_12320 ) ) ( HOIST-AT ?auto_12316 ?auto_12319 ) ( AVAILABLE ?auto_12316 ) ( SURFACE-AT ?auto_12315 ?auto_12319 ) ( ON ?auto_12315 ?auto_12321 ) ( CLEAR ?auto_12315 ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12321 ) ) ( not ( = ?auto_12315 ?auto_12321 ) ) ( not ( = ?auto_12317 ?auto_12316 ) ) ( SURFACE-AT ?auto_12313 ?auto_12320 ) ( CLEAR ?auto_12313 ) ( IS-CRATE ?auto_12314 ) ( AVAILABLE ?auto_12317 ) ( not ( = ?auto_12324 ?auto_12320 ) ) ( HOIST-AT ?auto_12322 ?auto_12324 ) ( AVAILABLE ?auto_12322 ) ( SURFACE-AT ?auto_12314 ?auto_12324 ) ( ON ?auto_12314 ?auto_12323 ) ( CLEAR ?auto_12314 ) ( TRUCK-AT ?auto_12318 ?auto_12320 ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( not ( = ?auto_12313 ?auto_12323 ) ) ( not ( = ?auto_12314 ?auto_12323 ) ) ( not ( = ?auto_12317 ?auto_12322 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12321 ) ) ( not ( = ?auto_12315 ?auto_12323 ) ) ( not ( = ?auto_12319 ?auto_12324 ) ) ( not ( = ?auto_12316 ?auto_12322 ) ) ( not ( = ?auto_12321 ?auto_12323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12313 ?auto_12314 )
      ( MAKE-1CRATE ?auto_12314 ?auto_12315 )
      ( MAKE-2CRATE-VERIFY ?auto_12313 ?auto_12314 ?auto_12315 ) )
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
      ?auto_12344 - HOIST
      ?auto_12346 - PLACE
      ?auto_12348 - PLACE
      ?auto_12347 - HOIST
      ?auto_12343 - SURFACE
      ?auto_12354 - PLACE
      ?auto_12350 - HOIST
      ?auto_12352 - SURFACE
      ?auto_12353 - PLACE
      ?auto_12349 - HOIST
      ?auto_12351 - SURFACE
      ?auto_12345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12344 ?auto_12346 ) ( IS-CRATE ?auto_12342 ) ( not ( = ?auto_12348 ?auto_12346 ) ) ( HOIST-AT ?auto_12347 ?auto_12348 ) ( AVAILABLE ?auto_12347 ) ( SURFACE-AT ?auto_12342 ?auto_12348 ) ( ON ?auto_12342 ?auto_12343 ) ( CLEAR ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12341 ?auto_12343 ) ) ( not ( = ?auto_12342 ?auto_12343 ) ) ( not ( = ?auto_12344 ?auto_12347 ) ) ( IS-CRATE ?auto_12341 ) ( not ( = ?auto_12354 ?auto_12346 ) ) ( HOIST-AT ?auto_12350 ?auto_12354 ) ( AVAILABLE ?auto_12350 ) ( SURFACE-AT ?auto_12341 ?auto_12354 ) ( ON ?auto_12341 ?auto_12352 ) ( CLEAR ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12341 ) ) ( not ( = ?auto_12340 ?auto_12352 ) ) ( not ( = ?auto_12341 ?auto_12352 ) ) ( not ( = ?auto_12344 ?auto_12350 ) ) ( SURFACE-AT ?auto_12339 ?auto_12346 ) ( CLEAR ?auto_12339 ) ( IS-CRATE ?auto_12340 ) ( AVAILABLE ?auto_12344 ) ( not ( = ?auto_12353 ?auto_12346 ) ) ( HOIST-AT ?auto_12349 ?auto_12353 ) ( AVAILABLE ?auto_12349 ) ( SURFACE-AT ?auto_12340 ?auto_12353 ) ( ON ?auto_12340 ?auto_12351 ) ( CLEAR ?auto_12340 ) ( TRUCK-AT ?auto_12345 ?auto_12346 ) ( not ( = ?auto_12339 ?auto_12340 ) ) ( not ( = ?auto_12339 ?auto_12351 ) ) ( not ( = ?auto_12340 ?auto_12351 ) ) ( not ( = ?auto_12344 ?auto_12349 ) ) ( not ( = ?auto_12339 ?auto_12341 ) ) ( not ( = ?auto_12339 ?auto_12352 ) ) ( not ( = ?auto_12341 ?auto_12351 ) ) ( not ( = ?auto_12354 ?auto_12353 ) ) ( not ( = ?auto_12350 ?auto_12349 ) ) ( not ( = ?auto_12352 ?auto_12351 ) ) ( not ( = ?auto_12339 ?auto_12342 ) ) ( not ( = ?auto_12339 ?auto_12343 ) ) ( not ( = ?auto_12340 ?auto_12342 ) ) ( not ( = ?auto_12340 ?auto_12343 ) ) ( not ( = ?auto_12342 ?auto_12352 ) ) ( not ( = ?auto_12342 ?auto_12351 ) ) ( not ( = ?auto_12348 ?auto_12354 ) ) ( not ( = ?auto_12348 ?auto_12353 ) ) ( not ( = ?auto_12347 ?auto_12350 ) ) ( not ( = ?auto_12347 ?auto_12349 ) ) ( not ( = ?auto_12343 ?auto_12352 ) ) ( not ( = ?auto_12343 ?auto_12351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12339 ?auto_12340 ?auto_12341 )
      ( MAKE-1CRATE ?auto_12341 ?auto_12342 )
      ( MAKE-3CRATE-VERIFY ?auto_12339 ?auto_12340 ?auto_12341 ?auto_12342 ) )
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
      ?auto_12380 - HOIST
      ?auto_12379 - PLACE
      ?auto_12377 - PLACE
      ?auto_12375 - HOIST
      ?auto_12378 - SURFACE
      ?auto_12387 - PLACE
      ?auto_12382 - HOIST
      ?auto_12383 - SURFACE
      ?auto_12381 - PLACE
      ?auto_12385 - HOIST
      ?auto_12389 - SURFACE
      ?auto_12388 - PLACE
      ?auto_12384 - HOIST
      ?auto_12386 - SURFACE
      ?auto_12376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12380 ?auto_12379 ) ( IS-CRATE ?auto_12374 ) ( not ( = ?auto_12377 ?auto_12379 ) ) ( HOIST-AT ?auto_12375 ?auto_12377 ) ( AVAILABLE ?auto_12375 ) ( SURFACE-AT ?auto_12374 ?auto_12377 ) ( ON ?auto_12374 ?auto_12378 ) ( CLEAR ?auto_12374 ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12373 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( not ( = ?auto_12380 ?auto_12375 ) ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12387 ?auto_12379 ) ) ( HOIST-AT ?auto_12382 ?auto_12387 ) ( AVAILABLE ?auto_12382 ) ( SURFACE-AT ?auto_12373 ?auto_12387 ) ( ON ?auto_12373 ?auto_12383 ) ( CLEAR ?auto_12373 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( not ( = ?auto_12372 ?auto_12383 ) ) ( not ( = ?auto_12373 ?auto_12383 ) ) ( not ( = ?auto_12380 ?auto_12382 ) ) ( IS-CRATE ?auto_12372 ) ( not ( = ?auto_12381 ?auto_12379 ) ) ( HOIST-AT ?auto_12385 ?auto_12381 ) ( AVAILABLE ?auto_12385 ) ( SURFACE-AT ?auto_12372 ?auto_12381 ) ( ON ?auto_12372 ?auto_12389 ) ( CLEAR ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12389 ) ) ( not ( = ?auto_12372 ?auto_12389 ) ) ( not ( = ?auto_12380 ?auto_12385 ) ) ( SURFACE-AT ?auto_12370 ?auto_12379 ) ( CLEAR ?auto_12370 ) ( IS-CRATE ?auto_12371 ) ( AVAILABLE ?auto_12380 ) ( not ( = ?auto_12388 ?auto_12379 ) ) ( HOIST-AT ?auto_12384 ?auto_12388 ) ( AVAILABLE ?auto_12384 ) ( SURFACE-AT ?auto_12371 ?auto_12388 ) ( ON ?auto_12371 ?auto_12386 ) ( CLEAR ?auto_12371 ) ( TRUCK-AT ?auto_12376 ?auto_12379 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12386 ) ) ( not ( = ?auto_12371 ?auto_12386 ) ) ( not ( = ?auto_12380 ?auto_12384 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12389 ) ) ( not ( = ?auto_12372 ?auto_12386 ) ) ( not ( = ?auto_12381 ?auto_12388 ) ) ( not ( = ?auto_12385 ?auto_12384 ) ) ( not ( = ?auto_12389 ?auto_12386 ) ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12370 ?auto_12383 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) ( not ( = ?auto_12371 ?auto_12383 ) ) ( not ( = ?auto_12373 ?auto_12389 ) ) ( not ( = ?auto_12373 ?auto_12386 ) ) ( not ( = ?auto_12387 ?auto_12381 ) ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( not ( = ?auto_12382 ?auto_12385 ) ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12383 ?auto_12389 ) ) ( not ( = ?auto_12383 ?auto_12386 ) ) ( not ( = ?auto_12370 ?auto_12374 ) ) ( not ( = ?auto_12370 ?auto_12378 ) ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12371 ?auto_12378 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12383 ) ) ( not ( = ?auto_12374 ?auto_12389 ) ) ( not ( = ?auto_12374 ?auto_12386 ) ) ( not ( = ?auto_12377 ?auto_12387 ) ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( not ( = ?auto_12377 ?auto_12388 ) ) ( not ( = ?auto_12375 ?auto_12382 ) ) ( not ( = ?auto_12375 ?auto_12385 ) ) ( not ( = ?auto_12375 ?auto_12384 ) ) ( not ( = ?auto_12378 ?auto_12383 ) ) ( not ( = ?auto_12378 ?auto_12389 ) ) ( not ( = ?auto_12378 ?auto_12386 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 )
      ( MAKE-1CRATE ?auto_12373 ?auto_12374 )
      ( MAKE-4CRATE-VERIFY ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ) )
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
      ?auto_12417 - HOIST
      ?auto_12415 - PLACE
      ?auto_12412 - PLACE
      ?auto_12414 - HOIST
      ?auto_12416 - SURFACE
      ?auto_12427 - PLACE
      ?auto_12425 - HOIST
      ?auto_12424 - SURFACE
      ?auto_12426 - PLACE
      ?auto_12420 - HOIST
      ?auto_12418 - SURFACE
      ?auto_12419 - SURFACE
      ?auto_12422 - PLACE
      ?auto_12421 - HOIST
      ?auto_12423 - SURFACE
      ?auto_12413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12417 ?auto_12415 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12412 ?auto_12415 ) ) ( HOIST-AT ?auto_12414 ?auto_12412 ) ( SURFACE-AT ?auto_12411 ?auto_12412 ) ( ON ?auto_12411 ?auto_12416 ) ( CLEAR ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12416 ) ) ( not ( = ?auto_12411 ?auto_12416 ) ) ( not ( = ?auto_12417 ?auto_12414 ) ) ( IS-CRATE ?auto_12410 ) ( not ( = ?auto_12427 ?auto_12415 ) ) ( HOIST-AT ?auto_12425 ?auto_12427 ) ( AVAILABLE ?auto_12425 ) ( SURFACE-AT ?auto_12410 ?auto_12427 ) ( ON ?auto_12410 ?auto_12424 ) ( CLEAR ?auto_12410 ) ( not ( = ?auto_12409 ?auto_12410 ) ) ( not ( = ?auto_12409 ?auto_12424 ) ) ( not ( = ?auto_12410 ?auto_12424 ) ) ( not ( = ?auto_12417 ?auto_12425 ) ) ( IS-CRATE ?auto_12409 ) ( not ( = ?auto_12426 ?auto_12415 ) ) ( HOIST-AT ?auto_12420 ?auto_12426 ) ( AVAILABLE ?auto_12420 ) ( SURFACE-AT ?auto_12409 ?auto_12426 ) ( ON ?auto_12409 ?auto_12418 ) ( CLEAR ?auto_12409 ) ( not ( = ?auto_12408 ?auto_12409 ) ) ( not ( = ?auto_12408 ?auto_12418 ) ) ( not ( = ?auto_12409 ?auto_12418 ) ) ( not ( = ?auto_12417 ?auto_12420 ) ) ( IS-CRATE ?auto_12408 ) ( AVAILABLE ?auto_12414 ) ( SURFACE-AT ?auto_12408 ?auto_12412 ) ( ON ?auto_12408 ?auto_12419 ) ( CLEAR ?auto_12408 ) ( not ( = ?auto_12407 ?auto_12408 ) ) ( not ( = ?auto_12407 ?auto_12419 ) ) ( not ( = ?auto_12408 ?auto_12419 ) ) ( SURFACE-AT ?auto_12406 ?auto_12415 ) ( CLEAR ?auto_12406 ) ( IS-CRATE ?auto_12407 ) ( AVAILABLE ?auto_12417 ) ( not ( = ?auto_12422 ?auto_12415 ) ) ( HOIST-AT ?auto_12421 ?auto_12422 ) ( AVAILABLE ?auto_12421 ) ( SURFACE-AT ?auto_12407 ?auto_12422 ) ( ON ?auto_12407 ?auto_12423 ) ( CLEAR ?auto_12407 ) ( TRUCK-AT ?auto_12413 ?auto_12415 ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12423 ) ) ( not ( = ?auto_12407 ?auto_12423 ) ) ( not ( = ?auto_12417 ?auto_12421 ) ) ( not ( = ?auto_12406 ?auto_12408 ) ) ( not ( = ?auto_12406 ?auto_12419 ) ) ( not ( = ?auto_12408 ?auto_12423 ) ) ( not ( = ?auto_12412 ?auto_12422 ) ) ( not ( = ?auto_12414 ?auto_12421 ) ) ( not ( = ?auto_12419 ?auto_12423 ) ) ( not ( = ?auto_12406 ?auto_12409 ) ) ( not ( = ?auto_12406 ?auto_12418 ) ) ( not ( = ?auto_12407 ?auto_12409 ) ) ( not ( = ?auto_12407 ?auto_12418 ) ) ( not ( = ?auto_12409 ?auto_12419 ) ) ( not ( = ?auto_12409 ?auto_12423 ) ) ( not ( = ?auto_12426 ?auto_12412 ) ) ( not ( = ?auto_12426 ?auto_12422 ) ) ( not ( = ?auto_12420 ?auto_12414 ) ) ( not ( = ?auto_12420 ?auto_12421 ) ) ( not ( = ?auto_12418 ?auto_12419 ) ) ( not ( = ?auto_12418 ?auto_12423 ) ) ( not ( = ?auto_12406 ?auto_12410 ) ) ( not ( = ?auto_12406 ?auto_12424 ) ) ( not ( = ?auto_12407 ?auto_12410 ) ) ( not ( = ?auto_12407 ?auto_12424 ) ) ( not ( = ?auto_12408 ?auto_12410 ) ) ( not ( = ?auto_12408 ?auto_12424 ) ) ( not ( = ?auto_12410 ?auto_12418 ) ) ( not ( = ?auto_12410 ?auto_12419 ) ) ( not ( = ?auto_12410 ?auto_12423 ) ) ( not ( = ?auto_12427 ?auto_12426 ) ) ( not ( = ?auto_12427 ?auto_12412 ) ) ( not ( = ?auto_12427 ?auto_12422 ) ) ( not ( = ?auto_12425 ?auto_12420 ) ) ( not ( = ?auto_12425 ?auto_12414 ) ) ( not ( = ?auto_12425 ?auto_12421 ) ) ( not ( = ?auto_12424 ?auto_12418 ) ) ( not ( = ?auto_12424 ?auto_12419 ) ) ( not ( = ?auto_12424 ?auto_12423 ) ) ( not ( = ?auto_12406 ?auto_12411 ) ) ( not ( = ?auto_12406 ?auto_12416 ) ) ( not ( = ?auto_12407 ?auto_12411 ) ) ( not ( = ?auto_12407 ?auto_12416 ) ) ( not ( = ?auto_12408 ?auto_12411 ) ) ( not ( = ?auto_12408 ?auto_12416 ) ) ( not ( = ?auto_12409 ?auto_12411 ) ) ( not ( = ?auto_12409 ?auto_12416 ) ) ( not ( = ?auto_12411 ?auto_12424 ) ) ( not ( = ?auto_12411 ?auto_12418 ) ) ( not ( = ?auto_12411 ?auto_12419 ) ) ( not ( = ?auto_12411 ?auto_12423 ) ) ( not ( = ?auto_12416 ?auto_12424 ) ) ( not ( = ?auto_12416 ?auto_12418 ) ) ( not ( = ?auto_12416 ?auto_12419 ) ) ( not ( = ?auto_12416 ?auto_12423 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12406 ?auto_12407 ?auto_12408 ?auto_12409 ?auto_12410 )
      ( MAKE-1CRATE ?auto_12410 ?auto_12411 )
      ( MAKE-5CRATE-VERIFY ?auto_12406 ?auto_12407 ?auto_12408 ?auto_12409 ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12445 - SURFACE
      ?auto_12446 - SURFACE
      ?auto_12447 - SURFACE
      ?auto_12448 - SURFACE
      ?auto_12449 - SURFACE
      ?auto_12450 - SURFACE
      ?auto_12451 - SURFACE
    )
    :vars
    (
      ?auto_12452 - HOIST
      ?auto_12456 - PLACE
      ?auto_12457 - PLACE
      ?auto_12454 - HOIST
      ?auto_12455 - SURFACE
      ?auto_12461 - PLACE
      ?auto_12469 - HOIST
      ?auto_12468 - SURFACE
      ?auto_12467 - PLACE
      ?auto_12466 - HOIST
      ?auto_12464 - SURFACE
      ?auto_12470 - PLACE
      ?auto_12459 - HOIST
      ?auto_12460 - SURFACE
      ?auto_12458 - SURFACE
      ?auto_12463 - PLACE
      ?auto_12462 - HOIST
      ?auto_12465 - SURFACE
      ?auto_12453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12452 ?auto_12456 ) ( IS-CRATE ?auto_12451 ) ( not ( = ?auto_12457 ?auto_12456 ) ) ( HOIST-AT ?auto_12454 ?auto_12457 ) ( AVAILABLE ?auto_12454 ) ( SURFACE-AT ?auto_12451 ?auto_12457 ) ( ON ?auto_12451 ?auto_12455 ) ( CLEAR ?auto_12451 ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12450 ?auto_12455 ) ) ( not ( = ?auto_12451 ?auto_12455 ) ) ( not ( = ?auto_12452 ?auto_12454 ) ) ( IS-CRATE ?auto_12450 ) ( not ( = ?auto_12461 ?auto_12456 ) ) ( HOIST-AT ?auto_12469 ?auto_12461 ) ( SURFACE-AT ?auto_12450 ?auto_12461 ) ( ON ?auto_12450 ?auto_12468 ) ( CLEAR ?auto_12450 ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12449 ?auto_12468 ) ) ( not ( = ?auto_12450 ?auto_12468 ) ) ( not ( = ?auto_12452 ?auto_12469 ) ) ( IS-CRATE ?auto_12449 ) ( not ( = ?auto_12467 ?auto_12456 ) ) ( HOIST-AT ?auto_12466 ?auto_12467 ) ( AVAILABLE ?auto_12466 ) ( SURFACE-AT ?auto_12449 ?auto_12467 ) ( ON ?auto_12449 ?auto_12464 ) ( CLEAR ?auto_12449 ) ( not ( = ?auto_12448 ?auto_12449 ) ) ( not ( = ?auto_12448 ?auto_12464 ) ) ( not ( = ?auto_12449 ?auto_12464 ) ) ( not ( = ?auto_12452 ?auto_12466 ) ) ( IS-CRATE ?auto_12448 ) ( not ( = ?auto_12470 ?auto_12456 ) ) ( HOIST-AT ?auto_12459 ?auto_12470 ) ( AVAILABLE ?auto_12459 ) ( SURFACE-AT ?auto_12448 ?auto_12470 ) ( ON ?auto_12448 ?auto_12460 ) ( CLEAR ?auto_12448 ) ( not ( = ?auto_12447 ?auto_12448 ) ) ( not ( = ?auto_12447 ?auto_12460 ) ) ( not ( = ?auto_12448 ?auto_12460 ) ) ( not ( = ?auto_12452 ?auto_12459 ) ) ( IS-CRATE ?auto_12447 ) ( AVAILABLE ?auto_12469 ) ( SURFACE-AT ?auto_12447 ?auto_12461 ) ( ON ?auto_12447 ?auto_12458 ) ( CLEAR ?auto_12447 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12446 ?auto_12458 ) ) ( not ( = ?auto_12447 ?auto_12458 ) ) ( SURFACE-AT ?auto_12445 ?auto_12456 ) ( CLEAR ?auto_12445 ) ( IS-CRATE ?auto_12446 ) ( AVAILABLE ?auto_12452 ) ( not ( = ?auto_12463 ?auto_12456 ) ) ( HOIST-AT ?auto_12462 ?auto_12463 ) ( AVAILABLE ?auto_12462 ) ( SURFACE-AT ?auto_12446 ?auto_12463 ) ( ON ?auto_12446 ?auto_12465 ) ( CLEAR ?auto_12446 ) ( TRUCK-AT ?auto_12453 ?auto_12456 ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( not ( = ?auto_12445 ?auto_12465 ) ) ( not ( = ?auto_12446 ?auto_12465 ) ) ( not ( = ?auto_12452 ?auto_12462 ) ) ( not ( = ?auto_12445 ?auto_12447 ) ) ( not ( = ?auto_12445 ?auto_12458 ) ) ( not ( = ?auto_12447 ?auto_12465 ) ) ( not ( = ?auto_12461 ?auto_12463 ) ) ( not ( = ?auto_12469 ?auto_12462 ) ) ( not ( = ?auto_12458 ?auto_12465 ) ) ( not ( = ?auto_12445 ?auto_12448 ) ) ( not ( = ?auto_12445 ?auto_12460 ) ) ( not ( = ?auto_12446 ?auto_12448 ) ) ( not ( = ?auto_12446 ?auto_12460 ) ) ( not ( = ?auto_12448 ?auto_12458 ) ) ( not ( = ?auto_12448 ?auto_12465 ) ) ( not ( = ?auto_12470 ?auto_12461 ) ) ( not ( = ?auto_12470 ?auto_12463 ) ) ( not ( = ?auto_12459 ?auto_12469 ) ) ( not ( = ?auto_12459 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12458 ) ) ( not ( = ?auto_12460 ?auto_12465 ) ) ( not ( = ?auto_12445 ?auto_12449 ) ) ( not ( = ?auto_12445 ?auto_12464 ) ) ( not ( = ?auto_12446 ?auto_12449 ) ) ( not ( = ?auto_12446 ?auto_12464 ) ) ( not ( = ?auto_12447 ?auto_12449 ) ) ( not ( = ?auto_12447 ?auto_12464 ) ) ( not ( = ?auto_12449 ?auto_12460 ) ) ( not ( = ?auto_12449 ?auto_12458 ) ) ( not ( = ?auto_12449 ?auto_12465 ) ) ( not ( = ?auto_12467 ?auto_12470 ) ) ( not ( = ?auto_12467 ?auto_12461 ) ) ( not ( = ?auto_12467 ?auto_12463 ) ) ( not ( = ?auto_12466 ?auto_12459 ) ) ( not ( = ?auto_12466 ?auto_12469 ) ) ( not ( = ?auto_12466 ?auto_12462 ) ) ( not ( = ?auto_12464 ?auto_12460 ) ) ( not ( = ?auto_12464 ?auto_12458 ) ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12445 ?auto_12450 ) ) ( not ( = ?auto_12445 ?auto_12468 ) ) ( not ( = ?auto_12446 ?auto_12450 ) ) ( not ( = ?auto_12446 ?auto_12468 ) ) ( not ( = ?auto_12447 ?auto_12450 ) ) ( not ( = ?auto_12447 ?auto_12468 ) ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( not ( = ?auto_12448 ?auto_12468 ) ) ( not ( = ?auto_12450 ?auto_12464 ) ) ( not ( = ?auto_12450 ?auto_12460 ) ) ( not ( = ?auto_12450 ?auto_12458 ) ) ( not ( = ?auto_12450 ?auto_12465 ) ) ( not ( = ?auto_12468 ?auto_12464 ) ) ( not ( = ?auto_12468 ?auto_12460 ) ) ( not ( = ?auto_12468 ?auto_12458 ) ) ( not ( = ?auto_12468 ?auto_12465 ) ) ( not ( = ?auto_12445 ?auto_12451 ) ) ( not ( = ?auto_12445 ?auto_12455 ) ) ( not ( = ?auto_12446 ?auto_12451 ) ) ( not ( = ?auto_12446 ?auto_12455 ) ) ( not ( = ?auto_12447 ?auto_12451 ) ) ( not ( = ?auto_12447 ?auto_12455 ) ) ( not ( = ?auto_12448 ?auto_12451 ) ) ( not ( = ?auto_12448 ?auto_12455 ) ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12449 ?auto_12455 ) ) ( not ( = ?auto_12451 ?auto_12468 ) ) ( not ( = ?auto_12451 ?auto_12464 ) ) ( not ( = ?auto_12451 ?auto_12460 ) ) ( not ( = ?auto_12451 ?auto_12458 ) ) ( not ( = ?auto_12451 ?auto_12465 ) ) ( not ( = ?auto_12457 ?auto_12461 ) ) ( not ( = ?auto_12457 ?auto_12467 ) ) ( not ( = ?auto_12457 ?auto_12470 ) ) ( not ( = ?auto_12457 ?auto_12463 ) ) ( not ( = ?auto_12454 ?auto_12469 ) ) ( not ( = ?auto_12454 ?auto_12466 ) ) ( not ( = ?auto_12454 ?auto_12459 ) ) ( not ( = ?auto_12454 ?auto_12462 ) ) ( not ( = ?auto_12455 ?auto_12468 ) ) ( not ( = ?auto_12455 ?auto_12464 ) ) ( not ( = ?auto_12455 ?auto_12460 ) ) ( not ( = ?auto_12455 ?auto_12458 ) ) ( not ( = ?auto_12455 ?auto_12465 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12445 ?auto_12446 ?auto_12447 ?auto_12448 ?auto_12449 ?auto_12450 )
      ( MAKE-1CRATE ?auto_12450 ?auto_12451 )
      ( MAKE-6CRATE-VERIFY ?auto_12445 ?auto_12446 ?auto_12447 ?auto_12448 ?auto_12449 ?auto_12450 ?auto_12451 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12489 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12491 - SURFACE
      ?auto_12492 - SURFACE
      ?auto_12493 - SURFACE
      ?auto_12494 - SURFACE
      ?auto_12495 - SURFACE
      ?auto_12496 - SURFACE
    )
    :vars
    (
      ?auto_12502 - HOIST
      ?auto_12501 - PLACE
      ?auto_12497 - PLACE
      ?auto_12499 - HOIST
      ?auto_12498 - SURFACE
      ?auto_12507 - PLACE
      ?auto_12515 - HOIST
      ?auto_12513 - SURFACE
      ?auto_12505 - PLACE
      ?auto_12509 - HOIST
      ?auto_12511 - SURFACE
      ?auto_12503 - PLACE
      ?auto_12510 - HOIST
      ?auto_12504 - SURFACE
      ?auto_12514 - PLACE
      ?auto_12516 - HOIST
      ?auto_12506 - SURFACE
      ?auto_12508 - SURFACE
      ?auto_12512 - SURFACE
      ?auto_12500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12502 ?auto_12501 ) ( IS-CRATE ?auto_12496 ) ( not ( = ?auto_12497 ?auto_12501 ) ) ( HOIST-AT ?auto_12499 ?auto_12497 ) ( SURFACE-AT ?auto_12496 ?auto_12497 ) ( ON ?auto_12496 ?auto_12498 ) ( CLEAR ?auto_12496 ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12498 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( not ( = ?auto_12502 ?auto_12499 ) ) ( IS-CRATE ?auto_12495 ) ( not ( = ?auto_12507 ?auto_12501 ) ) ( HOIST-AT ?auto_12515 ?auto_12507 ) ( AVAILABLE ?auto_12515 ) ( SURFACE-AT ?auto_12495 ?auto_12507 ) ( ON ?auto_12495 ?auto_12513 ) ( CLEAR ?auto_12495 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( not ( = ?auto_12494 ?auto_12513 ) ) ( not ( = ?auto_12495 ?auto_12513 ) ) ( not ( = ?auto_12502 ?auto_12515 ) ) ( IS-CRATE ?auto_12494 ) ( not ( = ?auto_12505 ?auto_12501 ) ) ( HOIST-AT ?auto_12509 ?auto_12505 ) ( SURFACE-AT ?auto_12494 ?auto_12505 ) ( ON ?auto_12494 ?auto_12511 ) ( CLEAR ?auto_12494 ) ( not ( = ?auto_12493 ?auto_12494 ) ) ( not ( = ?auto_12493 ?auto_12511 ) ) ( not ( = ?auto_12494 ?auto_12511 ) ) ( not ( = ?auto_12502 ?auto_12509 ) ) ( IS-CRATE ?auto_12493 ) ( not ( = ?auto_12503 ?auto_12501 ) ) ( HOIST-AT ?auto_12510 ?auto_12503 ) ( AVAILABLE ?auto_12510 ) ( SURFACE-AT ?auto_12493 ?auto_12503 ) ( ON ?auto_12493 ?auto_12504 ) ( CLEAR ?auto_12493 ) ( not ( = ?auto_12492 ?auto_12493 ) ) ( not ( = ?auto_12492 ?auto_12504 ) ) ( not ( = ?auto_12493 ?auto_12504 ) ) ( not ( = ?auto_12502 ?auto_12510 ) ) ( IS-CRATE ?auto_12492 ) ( not ( = ?auto_12514 ?auto_12501 ) ) ( HOIST-AT ?auto_12516 ?auto_12514 ) ( AVAILABLE ?auto_12516 ) ( SURFACE-AT ?auto_12492 ?auto_12514 ) ( ON ?auto_12492 ?auto_12506 ) ( CLEAR ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12506 ) ) ( not ( = ?auto_12492 ?auto_12506 ) ) ( not ( = ?auto_12502 ?auto_12516 ) ) ( IS-CRATE ?auto_12491 ) ( AVAILABLE ?auto_12509 ) ( SURFACE-AT ?auto_12491 ?auto_12505 ) ( ON ?auto_12491 ?auto_12508 ) ( CLEAR ?auto_12491 ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12508 ) ) ( not ( = ?auto_12491 ?auto_12508 ) ) ( SURFACE-AT ?auto_12489 ?auto_12501 ) ( CLEAR ?auto_12489 ) ( IS-CRATE ?auto_12490 ) ( AVAILABLE ?auto_12502 ) ( AVAILABLE ?auto_12499 ) ( SURFACE-AT ?auto_12490 ?auto_12497 ) ( ON ?auto_12490 ?auto_12512 ) ( CLEAR ?auto_12490 ) ( TRUCK-AT ?auto_12500 ?auto_12501 ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12512 ) ) ( not ( = ?auto_12490 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12508 ) ) ( not ( = ?auto_12491 ?auto_12512 ) ) ( not ( = ?auto_12505 ?auto_12497 ) ) ( not ( = ?auto_12509 ?auto_12499 ) ) ( not ( = ?auto_12508 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12506 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12506 ) ) ( not ( = ?auto_12492 ?auto_12508 ) ) ( not ( = ?auto_12492 ?auto_12512 ) ) ( not ( = ?auto_12514 ?auto_12505 ) ) ( not ( = ?auto_12514 ?auto_12497 ) ) ( not ( = ?auto_12516 ?auto_12509 ) ) ( not ( = ?auto_12516 ?auto_12499 ) ) ( not ( = ?auto_12506 ?auto_12508 ) ) ( not ( = ?auto_12506 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12493 ) ) ( not ( = ?auto_12489 ?auto_12504 ) ) ( not ( = ?auto_12490 ?auto_12493 ) ) ( not ( = ?auto_12490 ?auto_12504 ) ) ( not ( = ?auto_12491 ?auto_12493 ) ) ( not ( = ?auto_12491 ?auto_12504 ) ) ( not ( = ?auto_12493 ?auto_12506 ) ) ( not ( = ?auto_12493 ?auto_12508 ) ) ( not ( = ?auto_12493 ?auto_12512 ) ) ( not ( = ?auto_12503 ?auto_12514 ) ) ( not ( = ?auto_12503 ?auto_12505 ) ) ( not ( = ?auto_12503 ?auto_12497 ) ) ( not ( = ?auto_12510 ?auto_12516 ) ) ( not ( = ?auto_12510 ?auto_12509 ) ) ( not ( = ?auto_12510 ?auto_12499 ) ) ( not ( = ?auto_12504 ?auto_12506 ) ) ( not ( = ?auto_12504 ?auto_12508 ) ) ( not ( = ?auto_12504 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12494 ) ) ( not ( = ?auto_12489 ?auto_12511 ) ) ( not ( = ?auto_12490 ?auto_12494 ) ) ( not ( = ?auto_12490 ?auto_12511 ) ) ( not ( = ?auto_12491 ?auto_12494 ) ) ( not ( = ?auto_12491 ?auto_12511 ) ) ( not ( = ?auto_12492 ?auto_12494 ) ) ( not ( = ?auto_12492 ?auto_12511 ) ) ( not ( = ?auto_12494 ?auto_12504 ) ) ( not ( = ?auto_12494 ?auto_12506 ) ) ( not ( = ?auto_12494 ?auto_12508 ) ) ( not ( = ?auto_12494 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12504 ) ) ( not ( = ?auto_12511 ?auto_12506 ) ) ( not ( = ?auto_12511 ?auto_12508 ) ) ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12495 ) ) ( not ( = ?auto_12489 ?auto_12513 ) ) ( not ( = ?auto_12490 ?auto_12495 ) ) ( not ( = ?auto_12490 ?auto_12513 ) ) ( not ( = ?auto_12491 ?auto_12495 ) ) ( not ( = ?auto_12491 ?auto_12513 ) ) ( not ( = ?auto_12492 ?auto_12495 ) ) ( not ( = ?auto_12492 ?auto_12513 ) ) ( not ( = ?auto_12493 ?auto_12495 ) ) ( not ( = ?auto_12493 ?auto_12513 ) ) ( not ( = ?auto_12495 ?auto_12511 ) ) ( not ( = ?auto_12495 ?auto_12504 ) ) ( not ( = ?auto_12495 ?auto_12506 ) ) ( not ( = ?auto_12495 ?auto_12508 ) ) ( not ( = ?auto_12495 ?auto_12512 ) ) ( not ( = ?auto_12507 ?auto_12505 ) ) ( not ( = ?auto_12507 ?auto_12503 ) ) ( not ( = ?auto_12507 ?auto_12514 ) ) ( not ( = ?auto_12507 ?auto_12497 ) ) ( not ( = ?auto_12515 ?auto_12509 ) ) ( not ( = ?auto_12515 ?auto_12510 ) ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( not ( = ?auto_12515 ?auto_12499 ) ) ( not ( = ?auto_12513 ?auto_12511 ) ) ( not ( = ?auto_12513 ?auto_12504 ) ) ( not ( = ?auto_12513 ?auto_12506 ) ) ( not ( = ?auto_12513 ?auto_12508 ) ) ( not ( = ?auto_12513 ?auto_12512 ) ) ( not ( = ?auto_12489 ?auto_12496 ) ) ( not ( = ?auto_12489 ?auto_12498 ) ) ( not ( = ?auto_12490 ?auto_12496 ) ) ( not ( = ?auto_12490 ?auto_12498 ) ) ( not ( = ?auto_12491 ?auto_12496 ) ) ( not ( = ?auto_12491 ?auto_12498 ) ) ( not ( = ?auto_12492 ?auto_12496 ) ) ( not ( = ?auto_12492 ?auto_12498 ) ) ( not ( = ?auto_12493 ?auto_12496 ) ) ( not ( = ?auto_12493 ?auto_12498 ) ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( not ( = ?auto_12494 ?auto_12498 ) ) ( not ( = ?auto_12496 ?auto_12513 ) ) ( not ( = ?auto_12496 ?auto_12511 ) ) ( not ( = ?auto_12496 ?auto_12504 ) ) ( not ( = ?auto_12496 ?auto_12506 ) ) ( not ( = ?auto_12496 ?auto_12508 ) ) ( not ( = ?auto_12496 ?auto_12512 ) ) ( not ( = ?auto_12498 ?auto_12513 ) ) ( not ( = ?auto_12498 ?auto_12511 ) ) ( not ( = ?auto_12498 ?auto_12504 ) ) ( not ( = ?auto_12498 ?auto_12506 ) ) ( not ( = ?auto_12498 ?auto_12508 ) ) ( not ( = ?auto_12498 ?auto_12512 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12493 ?auto_12494 ?auto_12495 )
      ( MAKE-1CRATE ?auto_12495 ?auto_12496 )
      ( MAKE-7CRATE-VERIFY ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12493 ?auto_12494 ?auto_12495 ?auto_12496 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12536 - SURFACE
      ?auto_12537 - SURFACE
      ?auto_12538 - SURFACE
      ?auto_12539 - SURFACE
      ?auto_12540 - SURFACE
      ?auto_12541 - SURFACE
      ?auto_12542 - SURFACE
      ?auto_12543 - SURFACE
      ?auto_12544 - SURFACE
    )
    :vars
    (
      ?auto_12548 - HOIST
      ?auto_12549 - PLACE
      ?auto_12547 - PLACE
      ?auto_12545 - HOIST
      ?auto_12550 - SURFACE
      ?auto_12551 - PLACE
      ?auto_12552 - HOIST
      ?auto_12553 - SURFACE
      ?auto_12555 - PLACE
      ?auto_12566 - HOIST
      ?auto_12554 - SURFACE
      ?auto_12562 - PLACE
      ?auto_12563 - HOIST
      ?auto_12564 - SURFACE
      ?auto_12558 - PLACE
      ?auto_12556 - HOIST
      ?auto_12565 - SURFACE
      ?auto_12561 - PLACE
      ?auto_12557 - HOIST
      ?auto_12559 - SURFACE
      ?auto_12567 - SURFACE
      ?auto_12560 - SURFACE
      ?auto_12546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12548 ?auto_12549 ) ( IS-CRATE ?auto_12544 ) ( not ( = ?auto_12547 ?auto_12549 ) ) ( HOIST-AT ?auto_12545 ?auto_12547 ) ( AVAILABLE ?auto_12545 ) ( SURFACE-AT ?auto_12544 ?auto_12547 ) ( ON ?auto_12544 ?auto_12550 ) ( CLEAR ?auto_12544 ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( not ( = ?auto_12543 ?auto_12550 ) ) ( not ( = ?auto_12544 ?auto_12550 ) ) ( not ( = ?auto_12548 ?auto_12545 ) ) ( IS-CRATE ?auto_12543 ) ( not ( = ?auto_12551 ?auto_12549 ) ) ( HOIST-AT ?auto_12552 ?auto_12551 ) ( SURFACE-AT ?auto_12543 ?auto_12551 ) ( ON ?auto_12543 ?auto_12553 ) ( CLEAR ?auto_12543 ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12553 ) ) ( not ( = ?auto_12543 ?auto_12553 ) ) ( not ( = ?auto_12548 ?auto_12552 ) ) ( IS-CRATE ?auto_12542 ) ( not ( = ?auto_12555 ?auto_12549 ) ) ( HOIST-AT ?auto_12566 ?auto_12555 ) ( AVAILABLE ?auto_12566 ) ( SURFACE-AT ?auto_12542 ?auto_12555 ) ( ON ?auto_12542 ?auto_12554 ) ( CLEAR ?auto_12542 ) ( not ( = ?auto_12541 ?auto_12542 ) ) ( not ( = ?auto_12541 ?auto_12554 ) ) ( not ( = ?auto_12542 ?auto_12554 ) ) ( not ( = ?auto_12548 ?auto_12566 ) ) ( IS-CRATE ?auto_12541 ) ( not ( = ?auto_12562 ?auto_12549 ) ) ( HOIST-AT ?auto_12563 ?auto_12562 ) ( SURFACE-AT ?auto_12541 ?auto_12562 ) ( ON ?auto_12541 ?auto_12564 ) ( CLEAR ?auto_12541 ) ( not ( = ?auto_12540 ?auto_12541 ) ) ( not ( = ?auto_12540 ?auto_12564 ) ) ( not ( = ?auto_12541 ?auto_12564 ) ) ( not ( = ?auto_12548 ?auto_12563 ) ) ( IS-CRATE ?auto_12540 ) ( not ( = ?auto_12558 ?auto_12549 ) ) ( HOIST-AT ?auto_12556 ?auto_12558 ) ( AVAILABLE ?auto_12556 ) ( SURFACE-AT ?auto_12540 ?auto_12558 ) ( ON ?auto_12540 ?auto_12565 ) ( CLEAR ?auto_12540 ) ( not ( = ?auto_12539 ?auto_12540 ) ) ( not ( = ?auto_12539 ?auto_12565 ) ) ( not ( = ?auto_12540 ?auto_12565 ) ) ( not ( = ?auto_12548 ?auto_12556 ) ) ( IS-CRATE ?auto_12539 ) ( not ( = ?auto_12561 ?auto_12549 ) ) ( HOIST-AT ?auto_12557 ?auto_12561 ) ( AVAILABLE ?auto_12557 ) ( SURFACE-AT ?auto_12539 ?auto_12561 ) ( ON ?auto_12539 ?auto_12559 ) ( CLEAR ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( not ( = ?auto_12538 ?auto_12559 ) ) ( not ( = ?auto_12539 ?auto_12559 ) ) ( not ( = ?auto_12548 ?auto_12557 ) ) ( IS-CRATE ?auto_12538 ) ( AVAILABLE ?auto_12563 ) ( SURFACE-AT ?auto_12538 ?auto_12562 ) ( ON ?auto_12538 ?auto_12567 ) ( CLEAR ?auto_12538 ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12567 ) ) ( not ( = ?auto_12538 ?auto_12567 ) ) ( SURFACE-AT ?auto_12536 ?auto_12549 ) ( CLEAR ?auto_12536 ) ( IS-CRATE ?auto_12537 ) ( AVAILABLE ?auto_12548 ) ( AVAILABLE ?auto_12552 ) ( SURFACE-AT ?auto_12537 ?auto_12551 ) ( ON ?auto_12537 ?auto_12560 ) ( CLEAR ?auto_12537 ) ( TRUCK-AT ?auto_12546 ?auto_12549 ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12560 ) ) ( not ( = ?auto_12537 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12567 ) ) ( not ( = ?auto_12538 ?auto_12560 ) ) ( not ( = ?auto_12562 ?auto_12551 ) ) ( not ( = ?auto_12563 ?auto_12552 ) ) ( not ( = ?auto_12567 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12539 ) ) ( not ( = ?auto_12536 ?auto_12559 ) ) ( not ( = ?auto_12537 ?auto_12539 ) ) ( not ( = ?auto_12537 ?auto_12559 ) ) ( not ( = ?auto_12539 ?auto_12567 ) ) ( not ( = ?auto_12539 ?auto_12560 ) ) ( not ( = ?auto_12561 ?auto_12562 ) ) ( not ( = ?auto_12561 ?auto_12551 ) ) ( not ( = ?auto_12557 ?auto_12563 ) ) ( not ( = ?auto_12557 ?auto_12552 ) ) ( not ( = ?auto_12559 ?auto_12567 ) ) ( not ( = ?auto_12559 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12540 ) ) ( not ( = ?auto_12536 ?auto_12565 ) ) ( not ( = ?auto_12537 ?auto_12540 ) ) ( not ( = ?auto_12537 ?auto_12565 ) ) ( not ( = ?auto_12538 ?auto_12540 ) ) ( not ( = ?auto_12538 ?auto_12565 ) ) ( not ( = ?auto_12540 ?auto_12559 ) ) ( not ( = ?auto_12540 ?auto_12567 ) ) ( not ( = ?auto_12540 ?auto_12560 ) ) ( not ( = ?auto_12558 ?auto_12561 ) ) ( not ( = ?auto_12558 ?auto_12562 ) ) ( not ( = ?auto_12558 ?auto_12551 ) ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12563 ) ) ( not ( = ?auto_12556 ?auto_12552 ) ) ( not ( = ?auto_12565 ?auto_12559 ) ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12541 ) ) ( not ( = ?auto_12536 ?auto_12564 ) ) ( not ( = ?auto_12537 ?auto_12541 ) ) ( not ( = ?auto_12537 ?auto_12564 ) ) ( not ( = ?auto_12538 ?auto_12541 ) ) ( not ( = ?auto_12538 ?auto_12564 ) ) ( not ( = ?auto_12539 ?auto_12541 ) ) ( not ( = ?auto_12539 ?auto_12564 ) ) ( not ( = ?auto_12541 ?auto_12565 ) ) ( not ( = ?auto_12541 ?auto_12559 ) ) ( not ( = ?auto_12541 ?auto_12567 ) ) ( not ( = ?auto_12541 ?auto_12560 ) ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12559 ) ) ( not ( = ?auto_12564 ?auto_12567 ) ) ( not ( = ?auto_12564 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12542 ) ) ( not ( = ?auto_12536 ?auto_12554 ) ) ( not ( = ?auto_12537 ?auto_12542 ) ) ( not ( = ?auto_12537 ?auto_12554 ) ) ( not ( = ?auto_12538 ?auto_12542 ) ) ( not ( = ?auto_12538 ?auto_12554 ) ) ( not ( = ?auto_12539 ?auto_12542 ) ) ( not ( = ?auto_12539 ?auto_12554 ) ) ( not ( = ?auto_12540 ?auto_12542 ) ) ( not ( = ?auto_12540 ?auto_12554 ) ) ( not ( = ?auto_12542 ?auto_12564 ) ) ( not ( = ?auto_12542 ?auto_12565 ) ) ( not ( = ?auto_12542 ?auto_12559 ) ) ( not ( = ?auto_12542 ?auto_12567 ) ) ( not ( = ?auto_12542 ?auto_12560 ) ) ( not ( = ?auto_12555 ?auto_12562 ) ) ( not ( = ?auto_12555 ?auto_12558 ) ) ( not ( = ?auto_12555 ?auto_12561 ) ) ( not ( = ?auto_12555 ?auto_12551 ) ) ( not ( = ?auto_12566 ?auto_12563 ) ) ( not ( = ?auto_12566 ?auto_12556 ) ) ( not ( = ?auto_12566 ?auto_12557 ) ) ( not ( = ?auto_12566 ?auto_12552 ) ) ( not ( = ?auto_12554 ?auto_12564 ) ) ( not ( = ?auto_12554 ?auto_12565 ) ) ( not ( = ?auto_12554 ?auto_12559 ) ) ( not ( = ?auto_12554 ?auto_12567 ) ) ( not ( = ?auto_12554 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12543 ) ) ( not ( = ?auto_12536 ?auto_12553 ) ) ( not ( = ?auto_12537 ?auto_12543 ) ) ( not ( = ?auto_12537 ?auto_12553 ) ) ( not ( = ?auto_12538 ?auto_12543 ) ) ( not ( = ?auto_12538 ?auto_12553 ) ) ( not ( = ?auto_12539 ?auto_12543 ) ) ( not ( = ?auto_12539 ?auto_12553 ) ) ( not ( = ?auto_12540 ?auto_12543 ) ) ( not ( = ?auto_12540 ?auto_12553 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( not ( = ?auto_12541 ?auto_12553 ) ) ( not ( = ?auto_12543 ?auto_12554 ) ) ( not ( = ?auto_12543 ?auto_12564 ) ) ( not ( = ?auto_12543 ?auto_12565 ) ) ( not ( = ?auto_12543 ?auto_12559 ) ) ( not ( = ?auto_12543 ?auto_12567 ) ) ( not ( = ?auto_12543 ?auto_12560 ) ) ( not ( = ?auto_12553 ?auto_12554 ) ) ( not ( = ?auto_12553 ?auto_12564 ) ) ( not ( = ?auto_12553 ?auto_12565 ) ) ( not ( = ?auto_12553 ?auto_12559 ) ) ( not ( = ?auto_12553 ?auto_12567 ) ) ( not ( = ?auto_12553 ?auto_12560 ) ) ( not ( = ?auto_12536 ?auto_12544 ) ) ( not ( = ?auto_12536 ?auto_12550 ) ) ( not ( = ?auto_12537 ?auto_12544 ) ) ( not ( = ?auto_12537 ?auto_12550 ) ) ( not ( = ?auto_12538 ?auto_12544 ) ) ( not ( = ?auto_12538 ?auto_12550 ) ) ( not ( = ?auto_12539 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12550 ) ) ( not ( = ?auto_12540 ?auto_12544 ) ) ( not ( = ?auto_12540 ?auto_12550 ) ) ( not ( = ?auto_12541 ?auto_12544 ) ) ( not ( = ?auto_12541 ?auto_12550 ) ) ( not ( = ?auto_12542 ?auto_12544 ) ) ( not ( = ?auto_12542 ?auto_12550 ) ) ( not ( = ?auto_12544 ?auto_12553 ) ) ( not ( = ?auto_12544 ?auto_12554 ) ) ( not ( = ?auto_12544 ?auto_12564 ) ) ( not ( = ?auto_12544 ?auto_12565 ) ) ( not ( = ?auto_12544 ?auto_12559 ) ) ( not ( = ?auto_12544 ?auto_12567 ) ) ( not ( = ?auto_12544 ?auto_12560 ) ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( not ( = ?auto_12547 ?auto_12555 ) ) ( not ( = ?auto_12547 ?auto_12562 ) ) ( not ( = ?auto_12547 ?auto_12558 ) ) ( not ( = ?auto_12547 ?auto_12561 ) ) ( not ( = ?auto_12545 ?auto_12552 ) ) ( not ( = ?auto_12545 ?auto_12566 ) ) ( not ( = ?auto_12545 ?auto_12563 ) ) ( not ( = ?auto_12545 ?auto_12556 ) ) ( not ( = ?auto_12545 ?auto_12557 ) ) ( not ( = ?auto_12550 ?auto_12553 ) ) ( not ( = ?auto_12550 ?auto_12554 ) ) ( not ( = ?auto_12550 ?auto_12564 ) ) ( not ( = ?auto_12550 ?auto_12565 ) ) ( not ( = ?auto_12550 ?auto_12559 ) ) ( not ( = ?auto_12550 ?auto_12567 ) ) ( not ( = ?auto_12550 ?auto_12560 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12539 ?auto_12540 ?auto_12541 ?auto_12542 ?auto_12543 )
      ( MAKE-1CRATE ?auto_12543 ?auto_12544 )
      ( MAKE-8CRATE-VERIFY ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12539 ?auto_12540 ?auto_12541 ?auto_12542 ?auto_12543 ?auto_12544 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12588 - SURFACE
      ?auto_12589 - SURFACE
      ?auto_12590 - SURFACE
      ?auto_12591 - SURFACE
      ?auto_12592 - SURFACE
      ?auto_12593 - SURFACE
      ?auto_12594 - SURFACE
      ?auto_12595 - SURFACE
      ?auto_12596 - SURFACE
      ?auto_12597 - SURFACE
    )
    :vars
    (
      ?auto_12601 - HOIST
      ?auto_12603 - PLACE
      ?auto_12602 - PLACE
      ?auto_12598 - HOIST
      ?auto_12599 - SURFACE
      ?auto_12620 - PLACE
      ?auto_12610 - HOIST
      ?auto_12604 - SURFACE
      ?auto_12609 - PLACE
      ?auto_12607 - HOIST
      ?auto_12616 - SURFACE
      ?auto_12623 - PLACE
      ?auto_12611 - HOIST
      ?auto_12615 - SURFACE
      ?auto_12618 - PLACE
      ?auto_12613 - HOIST
      ?auto_12622 - SURFACE
      ?auto_12614 - PLACE
      ?auto_12621 - HOIST
      ?auto_12617 - SURFACE
      ?auto_12612 - PLACE
      ?auto_12608 - HOIST
      ?auto_12605 - SURFACE
      ?auto_12619 - SURFACE
      ?auto_12606 - SURFACE
      ?auto_12600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12601 ?auto_12603 ) ( IS-CRATE ?auto_12597 ) ( not ( = ?auto_12602 ?auto_12603 ) ) ( HOIST-AT ?auto_12598 ?auto_12602 ) ( AVAILABLE ?auto_12598 ) ( SURFACE-AT ?auto_12597 ?auto_12602 ) ( ON ?auto_12597 ?auto_12599 ) ( CLEAR ?auto_12597 ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12596 ?auto_12599 ) ) ( not ( = ?auto_12597 ?auto_12599 ) ) ( not ( = ?auto_12601 ?auto_12598 ) ) ( IS-CRATE ?auto_12596 ) ( not ( = ?auto_12620 ?auto_12603 ) ) ( HOIST-AT ?auto_12610 ?auto_12620 ) ( AVAILABLE ?auto_12610 ) ( SURFACE-AT ?auto_12596 ?auto_12620 ) ( ON ?auto_12596 ?auto_12604 ) ( CLEAR ?auto_12596 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12604 ) ) ( not ( = ?auto_12596 ?auto_12604 ) ) ( not ( = ?auto_12601 ?auto_12610 ) ) ( IS-CRATE ?auto_12595 ) ( not ( = ?auto_12609 ?auto_12603 ) ) ( HOIST-AT ?auto_12607 ?auto_12609 ) ( SURFACE-AT ?auto_12595 ?auto_12609 ) ( ON ?auto_12595 ?auto_12616 ) ( CLEAR ?auto_12595 ) ( not ( = ?auto_12594 ?auto_12595 ) ) ( not ( = ?auto_12594 ?auto_12616 ) ) ( not ( = ?auto_12595 ?auto_12616 ) ) ( not ( = ?auto_12601 ?auto_12607 ) ) ( IS-CRATE ?auto_12594 ) ( not ( = ?auto_12623 ?auto_12603 ) ) ( HOIST-AT ?auto_12611 ?auto_12623 ) ( AVAILABLE ?auto_12611 ) ( SURFACE-AT ?auto_12594 ?auto_12623 ) ( ON ?auto_12594 ?auto_12615 ) ( CLEAR ?auto_12594 ) ( not ( = ?auto_12593 ?auto_12594 ) ) ( not ( = ?auto_12593 ?auto_12615 ) ) ( not ( = ?auto_12594 ?auto_12615 ) ) ( not ( = ?auto_12601 ?auto_12611 ) ) ( IS-CRATE ?auto_12593 ) ( not ( = ?auto_12618 ?auto_12603 ) ) ( HOIST-AT ?auto_12613 ?auto_12618 ) ( SURFACE-AT ?auto_12593 ?auto_12618 ) ( ON ?auto_12593 ?auto_12622 ) ( CLEAR ?auto_12593 ) ( not ( = ?auto_12592 ?auto_12593 ) ) ( not ( = ?auto_12592 ?auto_12622 ) ) ( not ( = ?auto_12593 ?auto_12622 ) ) ( not ( = ?auto_12601 ?auto_12613 ) ) ( IS-CRATE ?auto_12592 ) ( not ( = ?auto_12614 ?auto_12603 ) ) ( HOIST-AT ?auto_12621 ?auto_12614 ) ( AVAILABLE ?auto_12621 ) ( SURFACE-AT ?auto_12592 ?auto_12614 ) ( ON ?auto_12592 ?auto_12617 ) ( CLEAR ?auto_12592 ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( not ( = ?auto_12591 ?auto_12617 ) ) ( not ( = ?auto_12592 ?auto_12617 ) ) ( not ( = ?auto_12601 ?auto_12621 ) ) ( IS-CRATE ?auto_12591 ) ( not ( = ?auto_12612 ?auto_12603 ) ) ( HOIST-AT ?auto_12608 ?auto_12612 ) ( AVAILABLE ?auto_12608 ) ( SURFACE-AT ?auto_12591 ?auto_12612 ) ( ON ?auto_12591 ?auto_12605 ) ( CLEAR ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12591 ) ) ( not ( = ?auto_12590 ?auto_12605 ) ) ( not ( = ?auto_12591 ?auto_12605 ) ) ( not ( = ?auto_12601 ?auto_12608 ) ) ( IS-CRATE ?auto_12590 ) ( AVAILABLE ?auto_12613 ) ( SURFACE-AT ?auto_12590 ?auto_12618 ) ( ON ?auto_12590 ?auto_12619 ) ( CLEAR ?auto_12590 ) ( not ( = ?auto_12589 ?auto_12590 ) ) ( not ( = ?auto_12589 ?auto_12619 ) ) ( not ( = ?auto_12590 ?auto_12619 ) ) ( SURFACE-AT ?auto_12588 ?auto_12603 ) ( CLEAR ?auto_12588 ) ( IS-CRATE ?auto_12589 ) ( AVAILABLE ?auto_12601 ) ( AVAILABLE ?auto_12607 ) ( SURFACE-AT ?auto_12589 ?auto_12609 ) ( ON ?auto_12589 ?auto_12606 ) ( CLEAR ?auto_12589 ) ( TRUCK-AT ?auto_12600 ?auto_12603 ) ( not ( = ?auto_12588 ?auto_12589 ) ) ( not ( = ?auto_12588 ?auto_12606 ) ) ( not ( = ?auto_12589 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12590 ) ) ( not ( = ?auto_12588 ?auto_12619 ) ) ( not ( = ?auto_12590 ?auto_12606 ) ) ( not ( = ?auto_12618 ?auto_12609 ) ) ( not ( = ?auto_12613 ?auto_12607 ) ) ( not ( = ?auto_12619 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12591 ) ) ( not ( = ?auto_12588 ?auto_12605 ) ) ( not ( = ?auto_12589 ?auto_12591 ) ) ( not ( = ?auto_12589 ?auto_12605 ) ) ( not ( = ?auto_12591 ?auto_12619 ) ) ( not ( = ?auto_12591 ?auto_12606 ) ) ( not ( = ?auto_12612 ?auto_12618 ) ) ( not ( = ?auto_12612 ?auto_12609 ) ) ( not ( = ?auto_12608 ?auto_12613 ) ) ( not ( = ?auto_12608 ?auto_12607 ) ) ( not ( = ?auto_12605 ?auto_12619 ) ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12592 ) ) ( not ( = ?auto_12588 ?auto_12617 ) ) ( not ( = ?auto_12589 ?auto_12592 ) ) ( not ( = ?auto_12589 ?auto_12617 ) ) ( not ( = ?auto_12590 ?auto_12592 ) ) ( not ( = ?auto_12590 ?auto_12617 ) ) ( not ( = ?auto_12592 ?auto_12605 ) ) ( not ( = ?auto_12592 ?auto_12619 ) ) ( not ( = ?auto_12592 ?auto_12606 ) ) ( not ( = ?auto_12614 ?auto_12612 ) ) ( not ( = ?auto_12614 ?auto_12618 ) ) ( not ( = ?auto_12614 ?auto_12609 ) ) ( not ( = ?auto_12621 ?auto_12608 ) ) ( not ( = ?auto_12621 ?auto_12613 ) ) ( not ( = ?auto_12621 ?auto_12607 ) ) ( not ( = ?auto_12617 ?auto_12605 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12593 ) ) ( not ( = ?auto_12588 ?auto_12622 ) ) ( not ( = ?auto_12589 ?auto_12593 ) ) ( not ( = ?auto_12589 ?auto_12622 ) ) ( not ( = ?auto_12590 ?auto_12593 ) ) ( not ( = ?auto_12590 ?auto_12622 ) ) ( not ( = ?auto_12591 ?auto_12593 ) ) ( not ( = ?auto_12591 ?auto_12622 ) ) ( not ( = ?auto_12593 ?auto_12617 ) ) ( not ( = ?auto_12593 ?auto_12605 ) ) ( not ( = ?auto_12593 ?auto_12619 ) ) ( not ( = ?auto_12593 ?auto_12606 ) ) ( not ( = ?auto_12622 ?auto_12617 ) ) ( not ( = ?auto_12622 ?auto_12605 ) ) ( not ( = ?auto_12622 ?auto_12619 ) ) ( not ( = ?auto_12622 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12594 ) ) ( not ( = ?auto_12588 ?auto_12615 ) ) ( not ( = ?auto_12589 ?auto_12594 ) ) ( not ( = ?auto_12589 ?auto_12615 ) ) ( not ( = ?auto_12590 ?auto_12594 ) ) ( not ( = ?auto_12590 ?auto_12615 ) ) ( not ( = ?auto_12591 ?auto_12594 ) ) ( not ( = ?auto_12591 ?auto_12615 ) ) ( not ( = ?auto_12592 ?auto_12594 ) ) ( not ( = ?auto_12592 ?auto_12615 ) ) ( not ( = ?auto_12594 ?auto_12622 ) ) ( not ( = ?auto_12594 ?auto_12617 ) ) ( not ( = ?auto_12594 ?auto_12605 ) ) ( not ( = ?auto_12594 ?auto_12619 ) ) ( not ( = ?auto_12594 ?auto_12606 ) ) ( not ( = ?auto_12623 ?auto_12618 ) ) ( not ( = ?auto_12623 ?auto_12614 ) ) ( not ( = ?auto_12623 ?auto_12612 ) ) ( not ( = ?auto_12623 ?auto_12609 ) ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( not ( = ?auto_12611 ?auto_12621 ) ) ( not ( = ?auto_12611 ?auto_12608 ) ) ( not ( = ?auto_12611 ?auto_12607 ) ) ( not ( = ?auto_12615 ?auto_12622 ) ) ( not ( = ?auto_12615 ?auto_12617 ) ) ( not ( = ?auto_12615 ?auto_12605 ) ) ( not ( = ?auto_12615 ?auto_12619 ) ) ( not ( = ?auto_12615 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12595 ) ) ( not ( = ?auto_12588 ?auto_12616 ) ) ( not ( = ?auto_12589 ?auto_12595 ) ) ( not ( = ?auto_12589 ?auto_12616 ) ) ( not ( = ?auto_12590 ?auto_12595 ) ) ( not ( = ?auto_12590 ?auto_12616 ) ) ( not ( = ?auto_12591 ?auto_12595 ) ) ( not ( = ?auto_12591 ?auto_12616 ) ) ( not ( = ?auto_12592 ?auto_12595 ) ) ( not ( = ?auto_12592 ?auto_12616 ) ) ( not ( = ?auto_12593 ?auto_12595 ) ) ( not ( = ?auto_12593 ?auto_12616 ) ) ( not ( = ?auto_12595 ?auto_12615 ) ) ( not ( = ?auto_12595 ?auto_12622 ) ) ( not ( = ?auto_12595 ?auto_12617 ) ) ( not ( = ?auto_12595 ?auto_12605 ) ) ( not ( = ?auto_12595 ?auto_12619 ) ) ( not ( = ?auto_12595 ?auto_12606 ) ) ( not ( = ?auto_12616 ?auto_12615 ) ) ( not ( = ?auto_12616 ?auto_12622 ) ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12616 ?auto_12605 ) ) ( not ( = ?auto_12616 ?auto_12619 ) ) ( not ( = ?auto_12616 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12596 ) ) ( not ( = ?auto_12588 ?auto_12604 ) ) ( not ( = ?auto_12589 ?auto_12596 ) ) ( not ( = ?auto_12589 ?auto_12604 ) ) ( not ( = ?auto_12590 ?auto_12596 ) ) ( not ( = ?auto_12590 ?auto_12604 ) ) ( not ( = ?auto_12591 ?auto_12596 ) ) ( not ( = ?auto_12591 ?auto_12604 ) ) ( not ( = ?auto_12592 ?auto_12596 ) ) ( not ( = ?auto_12592 ?auto_12604 ) ) ( not ( = ?auto_12593 ?auto_12596 ) ) ( not ( = ?auto_12593 ?auto_12604 ) ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( not ( = ?auto_12594 ?auto_12604 ) ) ( not ( = ?auto_12596 ?auto_12616 ) ) ( not ( = ?auto_12596 ?auto_12615 ) ) ( not ( = ?auto_12596 ?auto_12622 ) ) ( not ( = ?auto_12596 ?auto_12617 ) ) ( not ( = ?auto_12596 ?auto_12605 ) ) ( not ( = ?auto_12596 ?auto_12619 ) ) ( not ( = ?auto_12596 ?auto_12606 ) ) ( not ( = ?auto_12620 ?auto_12609 ) ) ( not ( = ?auto_12620 ?auto_12623 ) ) ( not ( = ?auto_12620 ?auto_12618 ) ) ( not ( = ?auto_12620 ?auto_12614 ) ) ( not ( = ?auto_12620 ?auto_12612 ) ) ( not ( = ?auto_12610 ?auto_12607 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12613 ) ) ( not ( = ?auto_12610 ?auto_12621 ) ) ( not ( = ?auto_12610 ?auto_12608 ) ) ( not ( = ?auto_12604 ?auto_12616 ) ) ( not ( = ?auto_12604 ?auto_12615 ) ) ( not ( = ?auto_12604 ?auto_12622 ) ) ( not ( = ?auto_12604 ?auto_12617 ) ) ( not ( = ?auto_12604 ?auto_12605 ) ) ( not ( = ?auto_12604 ?auto_12619 ) ) ( not ( = ?auto_12604 ?auto_12606 ) ) ( not ( = ?auto_12588 ?auto_12597 ) ) ( not ( = ?auto_12588 ?auto_12599 ) ) ( not ( = ?auto_12589 ?auto_12597 ) ) ( not ( = ?auto_12589 ?auto_12599 ) ) ( not ( = ?auto_12590 ?auto_12597 ) ) ( not ( = ?auto_12590 ?auto_12599 ) ) ( not ( = ?auto_12591 ?auto_12597 ) ) ( not ( = ?auto_12591 ?auto_12599 ) ) ( not ( = ?auto_12592 ?auto_12597 ) ) ( not ( = ?auto_12592 ?auto_12599 ) ) ( not ( = ?auto_12593 ?auto_12597 ) ) ( not ( = ?auto_12593 ?auto_12599 ) ) ( not ( = ?auto_12594 ?auto_12597 ) ) ( not ( = ?auto_12594 ?auto_12599 ) ) ( not ( = ?auto_12595 ?auto_12597 ) ) ( not ( = ?auto_12595 ?auto_12599 ) ) ( not ( = ?auto_12597 ?auto_12604 ) ) ( not ( = ?auto_12597 ?auto_12616 ) ) ( not ( = ?auto_12597 ?auto_12615 ) ) ( not ( = ?auto_12597 ?auto_12622 ) ) ( not ( = ?auto_12597 ?auto_12617 ) ) ( not ( = ?auto_12597 ?auto_12605 ) ) ( not ( = ?auto_12597 ?auto_12619 ) ) ( not ( = ?auto_12597 ?auto_12606 ) ) ( not ( = ?auto_12602 ?auto_12620 ) ) ( not ( = ?auto_12602 ?auto_12609 ) ) ( not ( = ?auto_12602 ?auto_12623 ) ) ( not ( = ?auto_12602 ?auto_12618 ) ) ( not ( = ?auto_12602 ?auto_12614 ) ) ( not ( = ?auto_12602 ?auto_12612 ) ) ( not ( = ?auto_12598 ?auto_12610 ) ) ( not ( = ?auto_12598 ?auto_12607 ) ) ( not ( = ?auto_12598 ?auto_12611 ) ) ( not ( = ?auto_12598 ?auto_12613 ) ) ( not ( = ?auto_12598 ?auto_12621 ) ) ( not ( = ?auto_12598 ?auto_12608 ) ) ( not ( = ?auto_12599 ?auto_12604 ) ) ( not ( = ?auto_12599 ?auto_12616 ) ) ( not ( = ?auto_12599 ?auto_12615 ) ) ( not ( = ?auto_12599 ?auto_12622 ) ) ( not ( = ?auto_12599 ?auto_12617 ) ) ( not ( = ?auto_12599 ?auto_12605 ) ) ( not ( = ?auto_12599 ?auto_12619 ) ) ( not ( = ?auto_12599 ?auto_12606 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12588 ?auto_12589 ?auto_12590 ?auto_12591 ?auto_12592 ?auto_12593 ?auto_12594 ?auto_12595 ?auto_12596 )
      ( MAKE-1CRATE ?auto_12596 ?auto_12597 )
      ( MAKE-9CRATE-VERIFY ?auto_12588 ?auto_12589 ?auto_12590 ?auto_12591 ?auto_12592 ?auto_12593 ?auto_12594 ?auto_12595 ?auto_12596 ?auto_12597 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12645 - SURFACE
      ?auto_12646 - SURFACE
      ?auto_12647 - SURFACE
      ?auto_12648 - SURFACE
      ?auto_12649 - SURFACE
      ?auto_12650 - SURFACE
      ?auto_12651 - SURFACE
      ?auto_12652 - SURFACE
      ?auto_12653 - SURFACE
      ?auto_12654 - SURFACE
      ?auto_12655 - SURFACE
    )
    :vars
    (
      ?auto_12657 - HOIST
      ?auto_12659 - PLACE
      ?auto_12660 - PLACE
      ?auto_12658 - HOIST
      ?auto_12661 - SURFACE
      ?auto_12679 - PLACE
      ?auto_12678 - HOIST
      ?auto_12681 - SURFACE
      ?auto_12684 - PLACE
      ?auto_12671 - HOIST
      ?auto_12672 - SURFACE
      ?auto_12663 - PLACE
      ?auto_12680 - HOIST
      ?auto_12683 - SURFACE
      ?auto_12676 - PLACE
      ?auto_12682 - HOIST
      ?auto_12675 - SURFACE
      ?auto_12662 - PLACE
      ?auto_12665 - HOIST
      ?auto_12667 - SURFACE
      ?auto_12677 - PLACE
      ?auto_12668 - HOIST
      ?auto_12666 - SURFACE
      ?auto_12674 - PLACE
      ?auto_12670 - HOIST
      ?auto_12673 - SURFACE
      ?auto_12664 - SURFACE
      ?auto_12669 - SURFACE
      ?auto_12656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12657 ?auto_12659 ) ( IS-CRATE ?auto_12655 ) ( not ( = ?auto_12660 ?auto_12659 ) ) ( HOIST-AT ?auto_12658 ?auto_12660 ) ( AVAILABLE ?auto_12658 ) ( SURFACE-AT ?auto_12655 ?auto_12660 ) ( ON ?auto_12655 ?auto_12661 ) ( CLEAR ?auto_12655 ) ( not ( = ?auto_12654 ?auto_12655 ) ) ( not ( = ?auto_12654 ?auto_12661 ) ) ( not ( = ?auto_12655 ?auto_12661 ) ) ( not ( = ?auto_12657 ?auto_12658 ) ) ( IS-CRATE ?auto_12654 ) ( not ( = ?auto_12679 ?auto_12659 ) ) ( HOIST-AT ?auto_12678 ?auto_12679 ) ( AVAILABLE ?auto_12678 ) ( SURFACE-AT ?auto_12654 ?auto_12679 ) ( ON ?auto_12654 ?auto_12681 ) ( CLEAR ?auto_12654 ) ( not ( = ?auto_12653 ?auto_12654 ) ) ( not ( = ?auto_12653 ?auto_12681 ) ) ( not ( = ?auto_12654 ?auto_12681 ) ) ( not ( = ?auto_12657 ?auto_12678 ) ) ( IS-CRATE ?auto_12653 ) ( not ( = ?auto_12684 ?auto_12659 ) ) ( HOIST-AT ?auto_12671 ?auto_12684 ) ( AVAILABLE ?auto_12671 ) ( SURFACE-AT ?auto_12653 ?auto_12684 ) ( ON ?auto_12653 ?auto_12672 ) ( CLEAR ?auto_12653 ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( not ( = ?auto_12652 ?auto_12672 ) ) ( not ( = ?auto_12653 ?auto_12672 ) ) ( not ( = ?auto_12657 ?auto_12671 ) ) ( IS-CRATE ?auto_12652 ) ( not ( = ?auto_12663 ?auto_12659 ) ) ( HOIST-AT ?auto_12680 ?auto_12663 ) ( SURFACE-AT ?auto_12652 ?auto_12663 ) ( ON ?auto_12652 ?auto_12683 ) ( CLEAR ?auto_12652 ) ( not ( = ?auto_12651 ?auto_12652 ) ) ( not ( = ?auto_12651 ?auto_12683 ) ) ( not ( = ?auto_12652 ?auto_12683 ) ) ( not ( = ?auto_12657 ?auto_12680 ) ) ( IS-CRATE ?auto_12651 ) ( not ( = ?auto_12676 ?auto_12659 ) ) ( HOIST-AT ?auto_12682 ?auto_12676 ) ( AVAILABLE ?auto_12682 ) ( SURFACE-AT ?auto_12651 ?auto_12676 ) ( ON ?auto_12651 ?auto_12675 ) ( CLEAR ?auto_12651 ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12675 ) ) ( not ( = ?auto_12651 ?auto_12675 ) ) ( not ( = ?auto_12657 ?auto_12682 ) ) ( IS-CRATE ?auto_12650 ) ( not ( = ?auto_12662 ?auto_12659 ) ) ( HOIST-AT ?auto_12665 ?auto_12662 ) ( SURFACE-AT ?auto_12650 ?auto_12662 ) ( ON ?auto_12650 ?auto_12667 ) ( CLEAR ?auto_12650 ) ( not ( = ?auto_12649 ?auto_12650 ) ) ( not ( = ?auto_12649 ?auto_12667 ) ) ( not ( = ?auto_12650 ?auto_12667 ) ) ( not ( = ?auto_12657 ?auto_12665 ) ) ( IS-CRATE ?auto_12649 ) ( not ( = ?auto_12677 ?auto_12659 ) ) ( HOIST-AT ?auto_12668 ?auto_12677 ) ( AVAILABLE ?auto_12668 ) ( SURFACE-AT ?auto_12649 ?auto_12677 ) ( ON ?auto_12649 ?auto_12666 ) ( CLEAR ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12648 ?auto_12666 ) ) ( not ( = ?auto_12649 ?auto_12666 ) ) ( not ( = ?auto_12657 ?auto_12668 ) ) ( IS-CRATE ?auto_12648 ) ( not ( = ?auto_12674 ?auto_12659 ) ) ( HOIST-AT ?auto_12670 ?auto_12674 ) ( AVAILABLE ?auto_12670 ) ( SURFACE-AT ?auto_12648 ?auto_12674 ) ( ON ?auto_12648 ?auto_12673 ) ( CLEAR ?auto_12648 ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12673 ) ) ( not ( = ?auto_12648 ?auto_12673 ) ) ( not ( = ?auto_12657 ?auto_12670 ) ) ( IS-CRATE ?auto_12647 ) ( AVAILABLE ?auto_12665 ) ( SURFACE-AT ?auto_12647 ?auto_12662 ) ( ON ?auto_12647 ?auto_12664 ) ( CLEAR ?auto_12647 ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12664 ) ) ( not ( = ?auto_12647 ?auto_12664 ) ) ( SURFACE-AT ?auto_12645 ?auto_12659 ) ( CLEAR ?auto_12645 ) ( IS-CRATE ?auto_12646 ) ( AVAILABLE ?auto_12657 ) ( AVAILABLE ?auto_12680 ) ( SURFACE-AT ?auto_12646 ?auto_12663 ) ( ON ?auto_12646 ?auto_12669 ) ( CLEAR ?auto_12646 ) ( TRUCK-AT ?auto_12656 ?auto_12659 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12669 ) ) ( not ( = ?auto_12646 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12645 ?auto_12664 ) ) ( not ( = ?auto_12647 ?auto_12669 ) ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( not ( = ?auto_12665 ?auto_12680 ) ) ( not ( = ?auto_12664 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12648 ) ) ( not ( = ?auto_12645 ?auto_12673 ) ) ( not ( = ?auto_12646 ?auto_12648 ) ) ( not ( = ?auto_12646 ?auto_12673 ) ) ( not ( = ?auto_12648 ?auto_12664 ) ) ( not ( = ?auto_12648 ?auto_12669 ) ) ( not ( = ?auto_12674 ?auto_12662 ) ) ( not ( = ?auto_12674 ?auto_12663 ) ) ( not ( = ?auto_12670 ?auto_12665 ) ) ( not ( = ?auto_12670 ?auto_12680 ) ) ( not ( = ?auto_12673 ?auto_12664 ) ) ( not ( = ?auto_12673 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12649 ) ) ( not ( = ?auto_12645 ?auto_12666 ) ) ( not ( = ?auto_12646 ?auto_12649 ) ) ( not ( = ?auto_12646 ?auto_12666 ) ) ( not ( = ?auto_12647 ?auto_12649 ) ) ( not ( = ?auto_12647 ?auto_12666 ) ) ( not ( = ?auto_12649 ?auto_12673 ) ) ( not ( = ?auto_12649 ?auto_12664 ) ) ( not ( = ?auto_12649 ?auto_12669 ) ) ( not ( = ?auto_12677 ?auto_12674 ) ) ( not ( = ?auto_12677 ?auto_12662 ) ) ( not ( = ?auto_12677 ?auto_12663 ) ) ( not ( = ?auto_12668 ?auto_12670 ) ) ( not ( = ?auto_12668 ?auto_12665 ) ) ( not ( = ?auto_12668 ?auto_12680 ) ) ( not ( = ?auto_12666 ?auto_12673 ) ) ( not ( = ?auto_12666 ?auto_12664 ) ) ( not ( = ?auto_12666 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12650 ) ) ( not ( = ?auto_12645 ?auto_12667 ) ) ( not ( = ?auto_12646 ?auto_12650 ) ) ( not ( = ?auto_12646 ?auto_12667 ) ) ( not ( = ?auto_12647 ?auto_12650 ) ) ( not ( = ?auto_12647 ?auto_12667 ) ) ( not ( = ?auto_12648 ?auto_12650 ) ) ( not ( = ?auto_12648 ?auto_12667 ) ) ( not ( = ?auto_12650 ?auto_12666 ) ) ( not ( = ?auto_12650 ?auto_12673 ) ) ( not ( = ?auto_12650 ?auto_12664 ) ) ( not ( = ?auto_12650 ?auto_12669 ) ) ( not ( = ?auto_12667 ?auto_12666 ) ) ( not ( = ?auto_12667 ?auto_12673 ) ) ( not ( = ?auto_12667 ?auto_12664 ) ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12651 ) ) ( not ( = ?auto_12645 ?auto_12675 ) ) ( not ( = ?auto_12646 ?auto_12651 ) ) ( not ( = ?auto_12646 ?auto_12675 ) ) ( not ( = ?auto_12647 ?auto_12651 ) ) ( not ( = ?auto_12647 ?auto_12675 ) ) ( not ( = ?auto_12648 ?auto_12651 ) ) ( not ( = ?auto_12648 ?auto_12675 ) ) ( not ( = ?auto_12649 ?auto_12651 ) ) ( not ( = ?auto_12649 ?auto_12675 ) ) ( not ( = ?auto_12651 ?auto_12667 ) ) ( not ( = ?auto_12651 ?auto_12666 ) ) ( not ( = ?auto_12651 ?auto_12673 ) ) ( not ( = ?auto_12651 ?auto_12664 ) ) ( not ( = ?auto_12651 ?auto_12669 ) ) ( not ( = ?auto_12676 ?auto_12662 ) ) ( not ( = ?auto_12676 ?auto_12677 ) ) ( not ( = ?auto_12676 ?auto_12674 ) ) ( not ( = ?auto_12676 ?auto_12663 ) ) ( not ( = ?auto_12682 ?auto_12665 ) ) ( not ( = ?auto_12682 ?auto_12668 ) ) ( not ( = ?auto_12682 ?auto_12670 ) ) ( not ( = ?auto_12682 ?auto_12680 ) ) ( not ( = ?auto_12675 ?auto_12667 ) ) ( not ( = ?auto_12675 ?auto_12666 ) ) ( not ( = ?auto_12675 ?auto_12673 ) ) ( not ( = ?auto_12675 ?auto_12664 ) ) ( not ( = ?auto_12675 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12652 ) ) ( not ( = ?auto_12645 ?auto_12683 ) ) ( not ( = ?auto_12646 ?auto_12652 ) ) ( not ( = ?auto_12646 ?auto_12683 ) ) ( not ( = ?auto_12647 ?auto_12652 ) ) ( not ( = ?auto_12647 ?auto_12683 ) ) ( not ( = ?auto_12648 ?auto_12652 ) ) ( not ( = ?auto_12648 ?auto_12683 ) ) ( not ( = ?auto_12649 ?auto_12652 ) ) ( not ( = ?auto_12649 ?auto_12683 ) ) ( not ( = ?auto_12650 ?auto_12652 ) ) ( not ( = ?auto_12650 ?auto_12683 ) ) ( not ( = ?auto_12652 ?auto_12675 ) ) ( not ( = ?auto_12652 ?auto_12667 ) ) ( not ( = ?auto_12652 ?auto_12666 ) ) ( not ( = ?auto_12652 ?auto_12673 ) ) ( not ( = ?auto_12652 ?auto_12664 ) ) ( not ( = ?auto_12652 ?auto_12669 ) ) ( not ( = ?auto_12683 ?auto_12675 ) ) ( not ( = ?auto_12683 ?auto_12667 ) ) ( not ( = ?auto_12683 ?auto_12666 ) ) ( not ( = ?auto_12683 ?auto_12673 ) ) ( not ( = ?auto_12683 ?auto_12664 ) ) ( not ( = ?auto_12683 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12653 ) ) ( not ( = ?auto_12645 ?auto_12672 ) ) ( not ( = ?auto_12646 ?auto_12653 ) ) ( not ( = ?auto_12646 ?auto_12672 ) ) ( not ( = ?auto_12647 ?auto_12653 ) ) ( not ( = ?auto_12647 ?auto_12672 ) ) ( not ( = ?auto_12648 ?auto_12653 ) ) ( not ( = ?auto_12648 ?auto_12672 ) ) ( not ( = ?auto_12649 ?auto_12653 ) ) ( not ( = ?auto_12649 ?auto_12672 ) ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( not ( = ?auto_12650 ?auto_12672 ) ) ( not ( = ?auto_12651 ?auto_12653 ) ) ( not ( = ?auto_12651 ?auto_12672 ) ) ( not ( = ?auto_12653 ?auto_12683 ) ) ( not ( = ?auto_12653 ?auto_12675 ) ) ( not ( = ?auto_12653 ?auto_12667 ) ) ( not ( = ?auto_12653 ?auto_12666 ) ) ( not ( = ?auto_12653 ?auto_12673 ) ) ( not ( = ?auto_12653 ?auto_12664 ) ) ( not ( = ?auto_12653 ?auto_12669 ) ) ( not ( = ?auto_12684 ?auto_12663 ) ) ( not ( = ?auto_12684 ?auto_12676 ) ) ( not ( = ?auto_12684 ?auto_12662 ) ) ( not ( = ?auto_12684 ?auto_12677 ) ) ( not ( = ?auto_12684 ?auto_12674 ) ) ( not ( = ?auto_12671 ?auto_12680 ) ) ( not ( = ?auto_12671 ?auto_12682 ) ) ( not ( = ?auto_12671 ?auto_12665 ) ) ( not ( = ?auto_12671 ?auto_12668 ) ) ( not ( = ?auto_12671 ?auto_12670 ) ) ( not ( = ?auto_12672 ?auto_12683 ) ) ( not ( = ?auto_12672 ?auto_12675 ) ) ( not ( = ?auto_12672 ?auto_12667 ) ) ( not ( = ?auto_12672 ?auto_12666 ) ) ( not ( = ?auto_12672 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12664 ) ) ( not ( = ?auto_12672 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12654 ) ) ( not ( = ?auto_12645 ?auto_12681 ) ) ( not ( = ?auto_12646 ?auto_12654 ) ) ( not ( = ?auto_12646 ?auto_12681 ) ) ( not ( = ?auto_12647 ?auto_12654 ) ) ( not ( = ?auto_12647 ?auto_12681 ) ) ( not ( = ?auto_12648 ?auto_12654 ) ) ( not ( = ?auto_12648 ?auto_12681 ) ) ( not ( = ?auto_12649 ?auto_12654 ) ) ( not ( = ?auto_12649 ?auto_12681 ) ) ( not ( = ?auto_12650 ?auto_12654 ) ) ( not ( = ?auto_12650 ?auto_12681 ) ) ( not ( = ?auto_12651 ?auto_12654 ) ) ( not ( = ?auto_12651 ?auto_12681 ) ) ( not ( = ?auto_12652 ?auto_12654 ) ) ( not ( = ?auto_12652 ?auto_12681 ) ) ( not ( = ?auto_12654 ?auto_12672 ) ) ( not ( = ?auto_12654 ?auto_12683 ) ) ( not ( = ?auto_12654 ?auto_12675 ) ) ( not ( = ?auto_12654 ?auto_12667 ) ) ( not ( = ?auto_12654 ?auto_12666 ) ) ( not ( = ?auto_12654 ?auto_12673 ) ) ( not ( = ?auto_12654 ?auto_12664 ) ) ( not ( = ?auto_12654 ?auto_12669 ) ) ( not ( = ?auto_12679 ?auto_12684 ) ) ( not ( = ?auto_12679 ?auto_12663 ) ) ( not ( = ?auto_12679 ?auto_12676 ) ) ( not ( = ?auto_12679 ?auto_12662 ) ) ( not ( = ?auto_12679 ?auto_12677 ) ) ( not ( = ?auto_12679 ?auto_12674 ) ) ( not ( = ?auto_12678 ?auto_12671 ) ) ( not ( = ?auto_12678 ?auto_12680 ) ) ( not ( = ?auto_12678 ?auto_12682 ) ) ( not ( = ?auto_12678 ?auto_12665 ) ) ( not ( = ?auto_12678 ?auto_12668 ) ) ( not ( = ?auto_12678 ?auto_12670 ) ) ( not ( = ?auto_12681 ?auto_12672 ) ) ( not ( = ?auto_12681 ?auto_12683 ) ) ( not ( = ?auto_12681 ?auto_12675 ) ) ( not ( = ?auto_12681 ?auto_12667 ) ) ( not ( = ?auto_12681 ?auto_12666 ) ) ( not ( = ?auto_12681 ?auto_12673 ) ) ( not ( = ?auto_12681 ?auto_12664 ) ) ( not ( = ?auto_12681 ?auto_12669 ) ) ( not ( = ?auto_12645 ?auto_12655 ) ) ( not ( = ?auto_12645 ?auto_12661 ) ) ( not ( = ?auto_12646 ?auto_12655 ) ) ( not ( = ?auto_12646 ?auto_12661 ) ) ( not ( = ?auto_12647 ?auto_12655 ) ) ( not ( = ?auto_12647 ?auto_12661 ) ) ( not ( = ?auto_12648 ?auto_12655 ) ) ( not ( = ?auto_12648 ?auto_12661 ) ) ( not ( = ?auto_12649 ?auto_12655 ) ) ( not ( = ?auto_12649 ?auto_12661 ) ) ( not ( = ?auto_12650 ?auto_12655 ) ) ( not ( = ?auto_12650 ?auto_12661 ) ) ( not ( = ?auto_12651 ?auto_12655 ) ) ( not ( = ?auto_12651 ?auto_12661 ) ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( not ( = ?auto_12652 ?auto_12661 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12661 ) ) ( not ( = ?auto_12655 ?auto_12681 ) ) ( not ( = ?auto_12655 ?auto_12672 ) ) ( not ( = ?auto_12655 ?auto_12683 ) ) ( not ( = ?auto_12655 ?auto_12675 ) ) ( not ( = ?auto_12655 ?auto_12667 ) ) ( not ( = ?auto_12655 ?auto_12666 ) ) ( not ( = ?auto_12655 ?auto_12673 ) ) ( not ( = ?auto_12655 ?auto_12664 ) ) ( not ( = ?auto_12655 ?auto_12669 ) ) ( not ( = ?auto_12660 ?auto_12679 ) ) ( not ( = ?auto_12660 ?auto_12684 ) ) ( not ( = ?auto_12660 ?auto_12663 ) ) ( not ( = ?auto_12660 ?auto_12676 ) ) ( not ( = ?auto_12660 ?auto_12662 ) ) ( not ( = ?auto_12660 ?auto_12677 ) ) ( not ( = ?auto_12660 ?auto_12674 ) ) ( not ( = ?auto_12658 ?auto_12678 ) ) ( not ( = ?auto_12658 ?auto_12671 ) ) ( not ( = ?auto_12658 ?auto_12680 ) ) ( not ( = ?auto_12658 ?auto_12682 ) ) ( not ( = ?auto_12658 ?auto_12665 ) ) ( not ( = ?auto_12658 ?auto_12668 ) ) ( not ( = ?auto_12658 ?auto_12670 ) ) ( not ( = ?auto_12661 ?auto_12681 ) ) ( not ( = ?auto_12661 ?auto_12672 ) ) ( not ( = ?auto_12661 ?auto_12683 ) ) ( not ( = ?auto_12661 ?auto_12675 ) ) ( not ( = ?auto_12661 ?auto_12667 ) ) ( not ( = ?auto_12661 ?auto_12666 ) ) ( not ( = ?auto_12661 ?auto_12673 ) ) ( not ( = ?auto_12661 ?auto_12664 ) ) ( not ( = ?auto_12661 ?auto_12669 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12648 ?auto_12649 ?auto_12650 ?auto_12651 ?auto_12652 ?auto_12653 ?auto_12654 )
      ( MAKE-1CRATE ?auto_12654 ?auto_12655 )
      ( MAKE-10CRATE-VERIFY ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12648 ?auto_12649 ?auto_12650 ?auto_12651 ?auto_12652 ?auto_12653 ?auto_12654 ?auto_12655 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12707 - SURFACE
      ?auto_12708 - SURFACE
      ?auto_12709 - SURFACE
      ?auto_12710 - SURFACE
      ?auto_12711 - SURFACE
      ?auto_12712 - SURFACE
      ?auto_12713 - SURFACE
      ?auto_12714 - SURFACE
      ?auto_12715 - SURFACE
      ?auto_12716 - SURFACE
      ?auto_12717 - SURFACE
      ?auto_12718 - SURFACE
    )
    :vars
    (
      ?auto_12722 - HOIST
      ?auto_12721 - PLACE
      ?auto_12724 - PLACE
      ?auto_12719 - HOIST
      ?auto_12723 - SURFACE
      ?auto_12739 - PLACE
      ?auto_12744 - HOIST
      ?auto_12748 - SURFACE
      ?auto_12741 - PLACE
      ?auto_12731 - HOIST
      ?auto_12730 - SURFACE
      ?auto_12733 - PLACE
      ?auto_12734 - HOIST
      ?auto_12742 - SURFACE
      ?auto_12726 - SURFACE
      ?auto_12747 - PLACE
      ?auto_12746 - HOIST
      ?auto_12737 - SURFACE
      ?auto_12729 - PLACE
      ?auto_12728 - HOIST
      ?auto_12745 - SURFACE
      ?auto_12735 - PLACE
      ?auto_12736 - HOIST
      ?auto_12732 - SURFACE
      ?auto_12738 - PLACE
      ?auto_12725 - HOIST
      ?auto_12727 - SURFACE
      ?auto_12740 - SURFACE
      ?auto_12743 - SURFACE
      ?auto_12720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12722 ?auto_12721 ) ( IS-CRATE ?auto_12718 ) ( not ( = ?auto_12724 ?auto_12721 ) ) ( HOIST-AT ?auto_12719 ?auto_12724 ) ( SURFACE-AT ?auto_12718 ?auto_12724 ) ( ON ?auto_12718 ?auto_12723 ) ( CLEAR ?auto_12718 ) ( not ( = ?auto_12717 ?auto_12718 ) ) ( not ( = ?auto_12717 ?auto_12723 ) ) ( not ( = ?auto_12718 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12719 ) ) ( IS-CRATE ?auto_12717 ) ( not ( = ?auto_12739 ?auto_12721 ) ) ( HOIST-AT ?auto_12744 ?auto_12739 ) ( AVAILABLE ?auto_12744 ) ( SURFACE-AT ?auto_12717 ?auto_12739 ) ( ON ?auto_12717 ?auto_12748 ) ( CLEAR ?auto_12717 ) ( not ( = ?auto_12716 ?auto_12717 ) ) ( not ( = ?auto_12716 ?auto_12748 ) ) ( not ( = ?auto_12717 ?auto_12748 ) ) ( not ( = ?auto_12722 ?auto_12744 ) ) ( IS-CRATE ?auto_12716 ) ( not ( = ?auto_12741 ?auto_12721 ) ) ( HOIST-AT ?auto_12731 ?auto_12741 ) ( AVAILABLE ?auto_12731 ) ( SURFACE-AT ?auto_12716 ?auto_12741 ) ( ON ?auto_12716 ?auto_12730 ) ( CLEAR ?auto_12716 ) ( not ( = ?auto_12715 ?auto_12716 ) ) ( not ( = ?auto_12715 ?auto_12730 ) ) ( not ( = ?auto_12716 ?auto_12730 ) ) ( not ( = ?auto_12722 ?auto_12731 ) ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12733 ?auto_12721 ) ) ( HOIST-AT ?auto_12734 ?auto_12733 ) ( AVAILABLE ?auto_12734 ) ( SURFACE-AT ?auto_12715 ?auto_12733 ) ( ON ?auto_12715 ?auto_12742 ) ( CLEAR ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( not ( = ?auto_12714 ?auto_12742 ) ) ( not ( = ?auto_12715 ?auto_12742 ) ) ( not ( = ?auto_12722 ?auto_12734 ) ) ( IS-CRATE ?auto_12714 ) ( SURFACE-AT ?auto_12714 ?auto_12724 ) ( ON ?auto_12714 ?auto_12726 ) ( CLEAR ?auto_12714 ) ( not ( = ?auto_12713 ?auto_12714 ) ) ( not ( = ?auto_12713 ?auto_12726 ) ) ( not ( = ?auto_12714 ?auto_12726 ) ) ( IS-CRATE ?auto_12713 ) ( not ( = ?auto_12747 ?auto_12721 ) ) ( HOIST-AT ?auto_12746 ?auto_12747 ) ( AVAILABLE ?auto_12746 ) ( SURFACE-AT ?auto_12713 ?auto_12747 ) ( ON ?auto_12713 ?auto_12737 ) ( CLEAR ?auto_12713 ) ( not ( = ?auto_12712 ?auto_12713 ) ) ( not ( = ?auto_12712 ?auto_12737 ) ) ( not ( = ?auto_12713 ?auto_12737 ) ) ( not ( = ?auto_12722 ?auto_12746 ) ) ( IS-CRATE ?auto_12712 ) ( not ( = ?auto_12729 ?auto_12721 ) ) ( HOIST-AT ?auto_12728 ?auto_12729 ) ( SURFACE-AT ?auto_12712 ?auto_12729 ) ( ON ?auto_12712 ?auto_12745 ) ( CLEAR ?auto_12712 ) ( not ( = ?auto_12711 ?auto_12712 ) ) ( not ( = ?auto_12711 ?auto_12745 ) ) ( not ( = ?auto_12712 ?auto_12745 ) ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( IS-CRATE ?auto_12711 ) ( not ( = ?auto_12735 ?auto_12721 ) ) ( HOIST-AT ?auto_12736 ?auto_12735 ) ( AVAILABLE ?auto_12736 ) ( SURFACE-AT ?auto_12711 ?auto_12735 ) ( ON ?auto_12711 ?auto_12732 ) ( CLEAR ?auto_12711 ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12732 ) ) ( not ( = ?auto_12711 ?auto_12732 ) ) ( not ( = ?auto_12722 ?auto_12736 ) ) ( IS-CRATE ?auto_12710 ) ( not ( = ?auto_12738 ?auto_12721 ) ) ( HOIST-AT ?auto_12725 ?auto_12738 ) ( AVAILABLE ?auto_12725 ) ( SURFACE-AT ?auto_12710 ?auto_12738 ) ( ON ?auto_12710 ?auto_12727 ) ( CLEAR ?auto_12710 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12727 ) ) ( not ( = ?auto_12710 ?auto_12727 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( IS-CRATE ?auto_12709 ) ( AVAILABLE ?auto_12728 ) ( SURFACE-AT ?auto_12709 ?auto_12729 ) ( ON ?auto_12709 ?auto_12740 ) ( CLEAR ?auto_12709 ) ( not ( = ?auto_12708 ?auto_12709 ) ) ( not ( = ?auto_12708 ?auto_12740 ) ) ( not ( = ?auto_12709 ?auto_12740 ) ) ( SURFACE-AT ?auto_12707 ?auto_12721 ) ( CLEAR ?auto_12707 ) ( IS-CRATE ?auto_12708 ) ( AVAILABLE ?auto_12722 ) ( AVAILABLE ?auto_12719 ) ( SURFACE-AT ?auto_12708 ?auto_12724 ) ( ON ?auto_12708 ?auto_12743 ) ( CLEAR ?auto_12708 ) ( TRUCK-AT ?auto_12720 ?auto_12721 ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( not ( = ?auto_12707 ?auto_12743 ) ) ( not ( = ?auto_12708 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12709 ) ) ( not ( = ?auto_12707 ?auto_12740 ) ) ( not ( = ?auto_12709 ?auto_12743 ) ) ( not ( = ?auto_12729 ?auto_12724 ) ) ( not ( = ?auto_12728 ?auto_12719 ) ) ( not ( = ?auto_12740 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12710 ) ) ( not ( = ?auto_12707 ?auto_12727 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( not ( = ?auto_12708 ?auto_12727 ) ) ( not ( = ?auto_12710 ?auto_12740 ) ) ( not ( = ?auto_12710 ?auto_12743 ) ) ( not ( = ?auto_12738 ?auto_12729 ) ) ( not ( = ?auto_12738 ?auto_12724 ) ) ( not ( = ?auto_12725 ?auto_12728 ) ) ( not ( = ?auto_12725 ?auto_12719 ) ) ( not ( = ?auto_12727 ?auto_12740 ) ) ( not ( = ?auto_12727 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12711 ) ) ( not ( = ?auto_12707 ?auto_12732 ) ) ( not ( = ?auto_12708 ?auto_12711 ) ) ( not ( = ?auto_12708 ?auto_12732 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12709 ?auto_12732 ) ) ( not ( = ?auto_12711 ?auto_12727 ) ) ( not ( = ?auto_12711 ?auto_12740 ) ) ( not ( = ?auto_12711 ?auto_12743 ) ) ( not ( = ?auto_12735 ?auto_12738 ) ) ( not ( = ?auto_12735 ?auto_12729 ) ) ( not ( = ?auto_12735 ?auto_12724 ) ) ( not ( = ?auto_12736 ?auto_12725 ) ) ( not ( = ?auto_12736 ?auto_12728 ) ) ( not ( = ?auto_12736 ?auto_12719 ) ) ( not ( = ?auto_12732 ?auto_12727 ) ) ( not ( = ?auto_12732 ?auto_12740 ) ) ( not ( = ?auto_12732 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12712 ) ) ( not ( = ?auto_12707 ?auto_12745 ) ) ( not ( = ?auto_12708 ?auto_12712 ) ) ( not ( = ?auto_12708 ?auto_12745 ) ) ( not ( = ?auto_12709 ?auto_12712 ) ) ( not ( = ?auto_12709 ?auto_12745 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12745 ) ) ( not ( = ?auto_12712 ?auto_12732 ) ) ( not ( = ?auto_12712 ?auto_12727 ) ) ( not ( = ?auto_12712 ?auto_12740 ) ) ( not ( = ?auto_12712 ?auto_12743 ) ) ( not ( = ?auto_12745 ?auto_12732 ) ) ( not ( = ?auto_12745 ?auto_12727 ) ) ( not ( = ?auto_12745 ?auto_12740 ) ) ( not ( = ?auto_12745 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12713 ) ) ( not ( = ?auto_12707 ?auto_12737 ) ) ( not ( = ?auto_12708 ?auto_12713 ) ) ( not ( = ?auto_12708 ?auto_12737 ) ) ( not ( = ?auto_12709 ?auto_12713 ) ) ( not ( = ?auto_12709 ?auto_12737 ) ) ( not ( = ?auto_12710 ?auto_12713 ) ) ( not ( = ?auto_12710 ?auto_12737 ) ) ( not ( = ?auto_12711 ?auto_12713 ) ) ( not ( = ?auto_12711 ?auto_12737 ) ) ( not ( = ?auto_12713 ?auto_12745 ) ) ( not ( = ?auto_12713 ?auto_12732 ) ) ( not ( = ?auto_12713 ?auto_12727 ) ) ( not ( = ?auto_12713 ?auto_12740 ) ) ( not ( = ?auto_12713 ?auto_12743 ) ) ( not ( = ?auto_12747 ?auto_12729 ) ) ( not ( = ?auto_12747 ?auto_12735 ) ) ( not ( = ?auto_12747 ?auto_12738 ) ) ( not ( = ?auto_12747 ?auto_12724 ) ) ( not ( = ?auto_12746 ?auto_12728 ) ) ( not ( = ?auto_12746 ?auto_12736 ) ) ( not ( = ?auto_12746 ?auto_12725 ) ) ( not ( = ?auto_12746 ?auto_12719 ) ) ( not ( = ?auto_12737 ?auto_12745 ) ) ( not ( = ?auto_12737 ?auto_12732 ) ) ( not ( = ?auto_12737 ?auto_12727 ) ) ( not ( = ?auto_12737 ?auto_12740 ) ) ( not ( = ?auto_12737 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12714 ) ) ( not ( = ?auto_12707 ?auto_12726 ) ) ( not ( = ?auto_12708 ?auto_12714 ) ) ( not ( = ?auto_12708 ?auto_12726 ) ) ( not ( = ?auto_12709 ?auto_12714 ) ) ( not ( = ?auto_12709 ?auto_12726 ) ) ( not ( = ?auto_12710 ?auto_12714 ) ) ( not ( = ?auto_12710 ?auto_12726 ) ) ( not ( = ?auto_12711 ?auto_12714 ) ) ( not ( = ?auto_12711 ?auto_12726 ) ) ( not ( = ?auto_12712 ?auto_12714 ) ) ( not ( = ?auto_12712 ?auto_12726 ) ) ( not ( = ?auto_12714 ?auto_12737 ) ) ( not ( = ?auto_12714 ?auto_12745 ) ) ( not ( = ?auto_12714 ?auto_12732 ) ) ( not ( = ?auto_12714 ?auto_12727 ) ) ( not ( = ?auto_12714 ?auto_12740 ) ) ( not ( = ?auto_12714 ?auto_12743 ) ) ( not ( = ?auto_12726 ?auto_12737 ) ) ( not ( = ?auto_12726 ?auto_12745 ) ) ( not ( = ?auto_12726 ?auto_12732 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12740 ) ) ( not ( = ?auto_12726 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12715 ) ) ( not ( = ?auto_12707 ?auto_12742 ) ) ( not ( = ?auto_12708 ?auto_12715 ) ) ( not ( = ?auto_12708 ?auto_12742 ) ) ( not ( = ?auto_12709 ?auto_12715 ) ) ( not ( = ?auto_12709 ?auto_12742 ) ) ( not ( = ?auto_12710 ?auto_12715 ) ) ( not ( = ?auto_12710 ?auto_12742 ) ) ( not ( = ?auto_12711 ?auto_12715 ) ) ( not ( = ?auto_12711 ?auto_12742 ) ) ( not ( = ?auto_12712 ?auto_12715 ) ) ( not ( = ?auto_12712 ?auto_12742 ) ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( not ( = ?auto_12713 ?auto_12742 ) ) ( not ( = ?auto_12715 ?auto_12726 ) ) ( not ( = ?auto_12715 ?auto_12737 ) ) ( not ( = ?auto_12715 ?auto_12745 ) ) ( not ( = ?auto_12715 ?auto_12732 ) ) ( not ( = ?auto_12715 ?auto_12727 ) ) ( not ( = ?auto_12715 ?auto_12740 ) ) ( not ( = ?auto_12715 ?auto_12743 ) ) ( not ( = ?auto_12733 ?auto_12724 ) ) ( not ( = ?auto_12733 ?auto_12747 ) ) ( not ( = ?auto_12733 ?auto_12729 ) ) ( not ( = ?auto_12733 ?auto_12735 ) ) ( not ( = ?auto_12733 ?auto_12738 ) ) ( not ( = ?auto_12734 ?auto_12719 ) ) ( not ( = ?auto_12734 ?auto_12746 ) ) ( not ( = ?auto_12734 ?auto_12728 ) ) ( not ( = ?auto_12734 ?auto_12736 ) ) ( not ( = ?auto_12734 ?auto_12725 ) ) ( not ( = ?auto_12742 ?auto_12726 ) ) ( not ( = ?auto_12742 ?auto_12737 ) ) ( not ( = ?auto_12742 ?auto_12745 ) ) ( not ( = ?auto_12742 ?auto_12732 ) ) ( not ( = ?auto_12742 ?auto_12727 ) ) ( not ( = ?auto_12742 ?auto_12740 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12716 ) ) ( not ( = ?auto_12707 ?auto_12730 ) ) ( not ( = ?auto_12708 ?auto_12716 ) ) ( not ( = ?auto_12708 ?auto_12730 ) ) ( not ( = ?auto_12709 ?auto_12716 ) ) ( not ( = ?auto_12709 ?auto_12730 ) ) ( not ( = ?auto_12710 ?auto_12716 ) ) ( not ( = ?auto_12710 ?auto_12730 ) ) ( not ( = ?auto_12711 ?auto_12716 ) ) ( not ( = ?auto_12711 ?auto_12730 ) ) ( not ( = ?auto_12712 ?auto_12716 ) ) ( not ( = ?auto_12712 ?auto_12730 ) ) ( not ( = ?auto_12713 ?auto_12716 ) ) ( not ( = ?auto_12713 ?auto_12730 ) ) ( not ( = ?auto_12714 ?auto_12716 ) ) ( not ( = ?auto_12714 ?auto_12730 ) ) ( not ( = ?auto_12716 ?auto_12742 ) ) ( not ( = ?auto_12716 ?auto_12726 ) ) ( not ( = ?auto_12716 ?auto_12737 ) ) ( not ( = ?auto_12716 ?auto_12745 ) ) ( not ( = ?auto_12716 ?auto_12732 ) ) ( not ( = ?auto_12716 ?auto_12727 ) ) ( not ( = ?auto_12716 ?auto_12740 ) ) ( not ( = ?auto_12716 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12733 ) ) ( not ( = ?auto_12741 ?auto_12724 ) ) ( not ( = ?auto_12741 ?auto_12747 ) ) ( not ( = ?auto_12741 ?auto_12729 ) ) ( not ( = ?auto_12741 ?auto_12735 ) ) ( not ( = ?auto_12741 ?auto_12738 ) ) ( not ( = ?auto_12731 ?auto_12734 ) ) ( not ( = ?auto_12731 ?auto_12719 ) ) ( not ( = ?auto_12731 ?auto_12746 ) ) ( not ( = ?auto_12731 ?auto_12728 ) ) ( not ( = ?auto_12731 ?auto_12736 ) ) ( not ( = ?auto_12731 ?auto_12725 ) ) ( not ( = ?auto_12730 ?auto_12742 ) ) ( not ( = ?auto_12730 ?auto_12726 ) ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( not ( = ?auto_12730 ?auto_12745 ) ) ( not ( = ?auto_12730 ?auto_12732 ) ) ( not ( = ?auto_12730 ?auto_12727 ) ) ( not ( = ?auto_12730 ?auto_12740 ) ) ( not ( = ?auto_12730 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12717 ) ) ( not ( = ?auto_12707 ?auto_12748 ) ) ( not ( = ?auto_12708 ?auto_12717 ) ) ( not ( = ?auto_12708 ?auto_12748 ) ) ( not ( = ?auto_12709 ?auto_12717 ) ) ( not ( = ?auto_12709 ?auto_12748 ) ) ( not ( = ?auto_12710 ?auto_12717 ) ) ( not ( = ?auto_12710 ?auto_12748 ) ) ( not ( = ?auto_12711 ?auto_12717 ) ) ( not ( = ?auto_12711 ?auto_12748 ) ) ( not ( = ?auto_12712 ?auto_12717 ) ) ( not ( = ?auto_12712 ?auto_12748 ) ) ( not ( = ?auto_12713 ?auto_12717 ) ) ( not ( = ?auto_12713 ?auto_12748 ) ) ( not ( = ?auto_12714 ?auto_12717 ) ) ( not ( = ?auto_12714 ?auto_12748 ) ) ( not ( = ?auto_12715 ?auto_12717 ) ) ( not ( = ?auto_12715 ?auto_12748 ) ) ( not ( = ?auto_12717 ?auto_12730 ) ) ( not ( = ?auto_12717 ?auto_12742 ) ) ( not ( = ?auto_12717 ?auto_12726 ) ) ( not ( = ?auto_12717 ?auto_12737 ) ) ( not ( = ?auto_12717 ?auto_12745 ) ) ( not ( = ?auto_12717 ?auto_12732 ) ) ( not ( = ?auto_12717 ?auto_12727 ) ) ( not ( = ?auto_12717 ?auto_12740 ) ) ( not ( = ?auto_12717 ?auto_12743 ) ) ( not ( = ?auto_12739 ?auto_12741 ) ) ( not ( = ?auto_12739 ?auto_12733 ) ) ( not ( = ?auto_12739 ?auto_12724 ) ) ( not ( = ?auto_12739 ?auto_12747 ) ) ( not ( = ?auto_12739 ?auto_12729 ) ) ( not ( = ?auto_12739 ?auto_12735 ) ) ( not ( = ?auto_12739 ?auto_12738 ) ) ( not ( = ?auto_12744 ?auto_12731 ) ) ( not ( = ?auto_12744 ?auto_12734 ) ) ( not ( = ?auto_12744 ?auto_12719 ) ) ( not ( = ?auto_12744 ?auto_12746 ) ) ( not ( = ?auto_12744 ?auto_12728 ) ) ( not ( = ?auto_12744 ?auto_12736 ) ) ( not ( = ?auto_12744 ?auto_12725 ) ) ( not ( = ?auto_12748 ?auto_12730 ) ) ( not ( = ?auto_12748 ?auto_12742 ) ) ( not ( = ?auto_12748 ?auto_12726 ) ) ( not ( = ?auto_12748 ?auto_12737 ) ) ( not ( = ?auto_12748 ?auto_12745 ) ) ( not ( = ?auto_12748 ?auto_12732 ) ) ( not ( = ?auto_12748 ?auto_12727 ) ) ( not ( = ?auto_12748 ?auto_12740 ) ) ( not ( = ?auto_12748 ?auto_12743 ) ) ( not ( = ?auto_12707 ?auto_12718 ) ) ( not ( = ?auto_12707 ?auto_12723 ) ) ( not ( = ?auto_12708 ?auto_12718 ) ) ( not ( = ?auto_12708 ?auto_12723 ) ) ( not ( = ?auto_12709 ?auto_12718 ) ) ( not ( = ?auto_12709 ?auto_12723 ) ) ( not ( = ?auto_12710 ?auto_12718 ) ) ( not ( = ?auto_12710 ?auto_12723 ) ) ( not ( = ?auto_12711 ?auto_12718 ) ) ( not ( = ?auto_12711 ?auto_12723 ) ) ( not ( = ?auto_12712 ?auto_12718 ) ) ( not ( = ?auto_12712 ?auto_12723 ) ) ( not ( = ?auto_12713 ?auto_12718 ) ) ( not ( = ?auto_12713 ?auto_12723 ) ) ( not ( = ?auto_12714 ?auto_12718 ) ) ( not ( = ?auto_12714 ?auto_12723 ) ) ( not ( = ?auto_12715 ?auto_12718 ) ) ( not ( = ?auto_12715 ?auto_12723 ) ) ( not ( = ?auto_12716 ?auto_12718 ) ) ( not ( = ?auto_12716 ?auto_12723 ) ) ( not ( = ?auto_12718 ?auto_12748 ) ) ( not ( = ?auto_12718 ?auto_12730 ) ) ( not ( = ?auto_12718 ?auto_12742 ) ) ( not ( = ?auto_12718 ?auto_12726 ) ) ( not ( = ?auto_12718 ?auto_12737 ) ) ( not ( = ?auto_12718 ?auto_12745 ) ) ( not ( = ?auto_12718 ?auto_12732 ) ) ( not ( = ?auto_12718 ?auto_12727 ) ) ( not ( = ?auto_12718 ?auto_12740 ) ) ( not ( = ?auto_12718 ?auto_12743 ) ) ( not ( = ?auto_12723 ?auto_12748 ) ) ( not ( = ?auto_12723 ?auto_12730 ) ) ( not ( = ?auto_12723 ?auto_12742 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12737 ) ) ( not ( = ?auto_12723 ?auto_12745 ) ) ( not ( = ?auto_12723 ?auto_12732 ) ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12740 ) ) ( not ( = ?auto_12723 ?auto_12743 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12707 ?auto_12708 ?auto_12709 ?auto_12710 ?auto_12711 ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12715 ?auto_12716 ?auto_12717 )
      ( MAKE-1CRATE ?auto_12717 ?auto_12718 )
      ( MAKE-11CRATE-VERIFY ?auto_12707 ?auto_12708 ?auto_12709 ?auto_12710 ?auto_12711 ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12715 ?auto_12716 ?auto_12717 ?auto_12718 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12772 - SURFACE
      ?auto_12773 - SURFACE
      ?auto_12774 - SURFACE
      ?auto_12775 - SURFACE
      ?auto_12776 - SURFACE
      ?auto_12777 - SURFACE
      ?auto_12778 - SURFACE
      ?auto_12779 - SURFACE
      ?auto_12780 - SURFACE
      ?auto_12781 - SURFACE
      ?auto_12782 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
    )
    :vars
    (
      ?auto_12790 - HOIST
      ?auto_12788 - PLACE
      ?auto_12786 - PLACE
      ?auto_12785 - HOIST
      ?auto_12787 - SURFACE
      ?auto_12810 - PLACE
      ?auto_12816 - HOIST
      ?auto_12796 - SURFACE
      ?auto_12792 - PLACE
      ?auto_12814 - HOIST
      ?auto_12791 - SURFACE
      ?auto_12802 - PLACE
      ?auto_12800 - HOIST
      ?auto_12804 - SURFACE
      ?auto_12795 - PLACE
      ?auto_12808 - HOIST
      ?auto_12806 - SURFACE
      ?auto_12794 - SURFACE
      ?auto_12809 - PLACE
      ?auto_12801 - HOIST
      ?auto_12803 - SURFACE
      ?auto_12798 - PLACE
      ?auto_12811 - HOIST
      ?auto_12817 - SURFACE
      ?auto_12807 - PLACE
      ?auto_12813 - HOIST
      ?auto_12805 - SURFACE
      ?auto_12797 - PLACE
      ?auto_12799 - HOIST
      ?auto_12793 - SURFACE
      ?auto_12815 - SURFACE
      ?auto_12812 - SURFACE
      ?auto_12789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12790 ?auto_12788 ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12786 ?auto_12788 ) ) ( HOIST-AT ?auto_12785 ?auto_12786 ) ( AVAILABLE ?auto_12785 ) ( SURFACE-AT ?auto_12784 ?auto_12786 ) ( ON ?auto_12784 ?auto_12787 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12790 ?auto_12785 ) ) ( IS-CRATE ?auto_12783 ) ( not ( = ?auto_12810 ?auto_12788 ) ) ( HOIST-AT ?auto_12816 ?auto_12810 ) ( SURFACE-AT ?auto_12783 ?auto_12810 ) ( ON ?auto_12783 ?auto_12796 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12796 ) ) ( not ( = ?auto_12790 ?auto_12816 ) ) ( IS-CRATE ?auto_12782 ) ( not ( = ?auto_12792 ?auto_12788 ) ) ( HOIST-AT ?auto_12814 ?auto_12792 ) ( AVAILABLE ?auto_12814 ) ( SURFACE-AT ?auto_12782 ?auto_12792 ) ( ON ?auto_12782 ?auto_12791 ) ( CLEAR ?auto_12782 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12791 ) ) ( not ( = ?auto_12782 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12814 ) ) ( IS-CRATE ?auto_12781 ) ( not ( = ?auto_12802 ?auto_12788 ) ) ( HOIST-AT ?auto_12800 ?auto_12802 ) ( AVAILABLE ?auto_12800 ) ( SURFACE-AT ?auto_12781 ?auto_12802 ) ( ON ?auto_12781 ?auto_12804 ) ( CLEAR ?auto_12781 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12804 ) ) ( not ( = ?auto_12781 ?auto_12804 ) ) ( not ( = ?auto_12790 ?auto_12800 ) ) ( IS-CRATE ?auto_12780 ) ( not ( = ?auto_12795 ?auto_12788 ) ) ( HOIST-AT ?auto_12808 ?auto_12795 ) ( AVAILABLE ?auto_12808 ) ( SURFACE-AT ?auto_12780 ?auto_12795 ) ( ON ?auto_12780 ?auto_12806 ) ( CLEAR ?auto_12780 ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12806 ) ) ( not ( = ?auto_12780 ?auto_12806 ) ) ( not ( = ?auto_12790 ?auto_12808 ) ) ( IS-CRATE ?auto_12779 ) ( SURFACE-AT ?auto_12779 ?auto_12810 ) ( ON ?auto_12779 ?auto_12794 ) ( CLEAR ?auto_12779 ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12794 ) ) ( not ( = ?auto_12779 ?auto_12794 ) ) ( IS-CRATE ?auto_12778 ) ( not ( = ?auto_12809 ?auto_12788 ) ) ( HOIST-AT ?auto_12801 ?auto_12809 ) ( AVAILABLE ?auto_12801 ) ( SURFACE-AT ?auto_12778 ?auto_12809 ) ( ON ?auto_12778 ?auto_12803 ) ( CLEAR ?auto_12778 ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12803 ) ) ( not ( = ?auto_12778 ?auto_12803 ) ) ( not ( = ?auto_12790 ?auto_12801 ) ) ( IS-CRATE ?auto_12777 ) ( not ( = ?auto_12798 ?auto_12788 ) ) ( HOIST-AT ?auto_12811 ?auto_12798 ) ( SURFACE-AT ?auto_12777 ?auto_12798 ) ( ON ?auto_12777 ?auto_12817 ) ( CLEAR ?auto_12777 ) ( not ( = ?auto_12776 ?auto_12777 ) ) ( not ( = ?auto_12776 ?auto_12817 ) ) ( not ( = ?auto_12777 ?auto_12817 ) ) ( not ( = ?auto_12790 ?auto_12811 ) ) ( IS-CRATE ?auto_12776 ) ( not ( = ?auto_12807 ?auto_12788 ) ) ( HOIST-AT ?auto_12813 ?auto_12807 ) ( AVAILABLE ?auto_12813 ) ( SURFACE-AT ?auto_12776 ?auto_12807 ) ( ON ?auto_12776 ?auto_12805 ) ( CLEAR ?auto_12776 ) ( not ( = ?auto_12775 ?auto_12776 ) ) ( not ( = ?auto_12775 ?auto_12805 ) ) ( not ( = ?auto_12776 ?auto_12805 ) ) ( not ( = ?auto_12790 ?auto_12813 ) ) ( IS-CRATE ?auto_12775 ) ( not ( = ?auto_12797 ?auto_12788 ) ) ( HOIST-AT ?auto_12799 ?auto_12797 ) ( AVAILABLE ?auto_12799 ) ( SURFACE-AT ?auto_12775 ?auto_12797 ) ( ON ?auto_12775 ?auto_12793 ) ( CLEAR ?auto_12775 ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12793 ) ) ( not ( = ?auto_12775 ?auto_12793 ) ) ( not ( = ?auto_12790 ?auto_12799 ) ) ( IS-CRATE ?auto_12774 ) ( AVAILABLE ?auto_12811 ) ( SURFACE-AT ?auto_12774 ?auto_12798 ) ( ON ?auto_12774 ?auto_12815 ) ( CLEAR ?auto_12774 ) ( not ( = ?auto_12773 ?auto_12774 ) ) ( not ( = ?auto_12773 ?auto_12815 ) ) ( not ( = ?auto_12774 ?auto_12815 ) ) ( SURFACE-AT ?auto_12772 ?auto_12788 ) ( CLEAR ?auto_12772 ) ( IS-CRATE ?auto_12773 ) ( AVAILABLE ?auto_12790 ) ( AVAILABLE ?auto_12816 ) ( SURFACE-AT ?auto_12773 ?auto_12810 ) ( ON ?auto_12773 ?auto_12812 ) ( CLEAR ?auto_12773 ) ( TRUCK-AT ?auto_12789 ?auto_12788 ) ( not ( = ?auto_12772 ?auto_12773 ) ) ( not ( = ?auto_12772 ?auto_12812 ) ) ( not ( = ?auto_12773 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12774 ) ) ( not ( = ?auto_12772 ?auto_12815 ) ) ( not ( = ?auto_12774 ?auto_12812 ) ) ( not ( = ?auto_12798 ?auto_12810 ) ) ( not ( = ?auto_12811 ?auto_12816 ) ) ( not ( = ?auto_12815 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12775 ) ) ( not ( = ?auto_12772 ?auto_12793 ) ) ( not ( = ?auto_12773 ?auto_12775 ) ) ( not ( = ?auto_12773 ?auto_12793 ) ) ( not ( = ?auto_12775 ?auto_12815 ) ) ( not ( = ?auto_12775 ?auto_12812 ) ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12810 ) ) ( not ( = ?auto_12799 ?auto_12811 ) ) ( not ( = ?auto_12799 ?auto_12816 ) ) ( not ( = ?auto_12793 ?auto_12815 ) ) ( not ( = ?auto_12793 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12776 ) ) ( not ( = ?auto_12772 ?auto_12805 ) ) ( not ( = ?auto_12773 ?auto_12776 ) ) ( not ( = ?auto_12773 ?auto_12805 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( not ( = ?auto_12774 ?auto_12805 ) ) ( not ( = ?auto_12776 ?auto_12793 ) ) ( not ( = ?auto_12776 ?auto_12815 ) ) ( not ( = ?auto_12776 ?auto_12812 ) ) ( not ( = ?auto_12807 ?auto_12797 ) ) ( not ( = ?auto_12807 ?auto_12798 ) ) ( not ( = ?auto_12807 ?auto_12810 ) ) ( not ( = ?auto_12813 ?auto_12799 ) ) ( not ( = ?auto_12813 ?auto_12811 ) ) ( not ( = ?auto_12813 ?auto_12816 ) ) ( not ( = ?auto_12805 ?auto_12793 ) ) ( not ( = ?auto_12805 ?auto_12815 ) ) ( not ( = ?auto_12805 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12777 ) ) ( not ( = ?auto_12772 ?auto_12817 ) ) ( not ( = ?auto_12773 ?auto_12777 ) ) ( not ( = ?auto_12773 ?auto_12817 ) ) ( not ( = ?auto_12774 ?auto_12777 ) ) ( not ( = ?auto_12774 ?auto_12817 ) ) ( not ( = ?auto_12775 ?auto_12777 ) ) ( not ( = ?auto_12775 ?auto_12817 ) ) ( not ( = ?auto_12777 ?auto_12805 ) ) ( not ( = ?auto_12777 ?auto_12793 ) ) ( not ( = ?auto_12777 ?auto_12815 ) ) ( not ( = ?auto_12777 ?auto_12812 ) ) ( not ( = ?auto_12817 ?auto_12805 ) ) ( not ( = ?auto_12817 ?auto_12793 ) ) ( not ( = ?auto_12817 ?auto_12815 ) ) ( not ( = ?auto_12817 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12778 ) ) ( not ( = ?auto_12772 ?auto_12803 ) ) ( not ( = ?auto_12773 ?auto_12778 ) ) ( not ( = ?auto_12773 ?auto_12803 ) ) ( not ( = ?auto_12774 ?auto_12778 ) ) ( not ( = ?auto_12774 ?auto_12803 ) ) ( not ( = ?auto_12775 ?auto_12778 ) ) ( not ( = ?auto_12775 ?auto_12803 ) ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12776 ?auto_12803 ) ) ( not ( = ?auto_12778 ?auto_12817 ) ) ( not ( = ?auto_12778 ?auto_12805 ) ) ( not ( = ?auto_12778 ?auto_12793 ) ) ( not ( = ?auto_12778 ?auto_12815 ) ) ( not ( = ?auto_12778 ?auto_12812 ) ) ( not ( = ?auto_12809 ?auto_12798 ) ) ( not ( = ?auto_12809 ?auto_12807 ) ) ( not ( = ?auto_12809 ?auto_12797 ) ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12801 ?auto_12811 ) ) ( not ( = ?auto_12801 ?auto_12813 ) ) ( not ( = ?auto_12801 ?auto_12799 ) ) ( not ( = ?auto_12801 ?auto_12816 ) ) ( not ( = ?auto_12803 ?auto_12817 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12793 ) ) ( not ( = ?auto_12803 ?auto_12815 ) ) ( not ( = ?auto_12803 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12779 ) ) ( not ( = ?auto_12772 ?auto_12794 ) ) ( not ( = ?auto_12773 ?auto_12779 ) ) ( not ( = ?auto_12773 ?auto_12794 ) ) ( not ( = ?auto_12774 ?auto_12779 ) ) ( not ( = ?auto_12774 ?auto_12794 ) ) ( not ( = ?auto_12775 ?auto_12779 ) ) ( not ( = ?auto_12775 ?auto_12794 ) ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12776 ?auto_12794 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12794 ) ) ( not ( = ?auto_12779 ?auto_12803 ) ) ( not ( = ?auto_12779 ?auto_12817 ) ) ( not ( = ?auto_12779 ?auto_12805 ) ) ( not ( = ?auto_12779 ?auto_12793 ) ) ( not ( = ?auto_12779 ?auto_12815 ) ) ( not ( = ?auto_12779 ?auto_12812 ) ) ( not ( = ?auto_12794 ?auto_12803 ) ) ( not ( = ?auto_12794 ?auto_12817 ) ) ( not ( = ?auto_12794 ?auto_12805 ) ) ( not ( = ?auto_12794 ?auto_12793 ) ) ( not ( = ?auto_12794 ?auto_12815 ) ) ( not ( = ?auto_12794 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12780 ) ) ( not ( = ?auto_12772 ?auto_12806 ) ) ( not ( = ?auto_12773 ?auto_12780 ) ) ( not ( = ?auto_12773 ?auto_12806 ) ) ( not ( = ?auto_12774 ?auto_12780 ) ) ( not ( = ?auto_12774 ?auto_12806 ) ) ( not ( = ?auto_12775 ?auto_12780 ) ) ( not ( = ?auto_12775 ?auto_12806 ) ) ( not ( = ?auto_12776 ?auto_12780 ) ) ( not ( = ?auto_12776 ?auto_12806 ) ) ( not ( = ?auto_12777 ?auto_12780 ) ) ( not ( = ?auto_12777 ?auto_12806 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12806 ) ) ( not ( = ?auto_12780 ?auto_12794 ) ) ( not ( = ?auto_12780 ?auto_12803 ) ) ( not ( = ?auto_12780 ?auto_12817 ) ) ( not ( = ?auto_12780 ?auto_12805 ) ) ( not ( = ?auto_12780 ?auto_12793 ) ) ( not ( = ?auto_12780 ?auto_12815 ) ) ( not ( = ?auto_12780 ?auto_12812 ) ) ( not ( = ?auto_12795 ?auto_12810 ) ) ( not ( = ?auto_12795 ?auto_12809 ) ) ( not ( = ?auto_12795 ?auto_12798 ) ) ( not ( = ?auto_12795 ?auto_12807 ) ) ( not ( = ?auto_12795 ?auto_12797 ) ) ( not ( = ?auto_12808 ?auto_12816 ) ) ( not ( = ?auto_12808 ?auto_12801 ) ) ( not ( = ?auto_12808 ?auto_12811 ) ) ( not ( = ?auto_12808 ?auto_12813 ) ) ( not ( = ?auto_12808 ?auto_12799 ) ) ( not ( = ?auto_12806 ?auto_12794 ) ) ( not ( = ?auto_12806 ?auto_12803 ) ) ( not ( = ?auto_12806 ?auto_12817 ) ) ( not ( = ?auto_12806 ?auto_12805 ) ) ( not ( = ?auto_12806 ?auto_12793 ) ) ( not ( = ?auto_12806 ?auto_12815 ) ) ( not ( = ?auto_12806 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12781 ) ) ( not ( = ?auto_12772 ?auto_12804 ) ) ( not ( = ?auto_12773 ?auto_12781 ) ) ( not ( = ?auto_12773 ?auto_12804 ) ) ( not ( = ?auto_12774 ?auto_12781 ) ) ( not ( = ?auto_12774 ?auto_12804 ) ) ( not ( = ?auto_12775 ?auto_12781 ) ) ( not ( = ?auto_12775 ?auto_12804 ) ) ( not ( = ?auto_12776 ?auto_12781 ) ) ( not ( = ?auto_12776 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12781 ) ) ( not ( = ?auto_12777 ?auto_12804 ) ) ( not ( = ?auto_12778 ?auto_12781 ) ) ( not ( = ?auto_12778 ?auto_12804 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12804 ) ) ( not ( = ?auto_12781 ?auto_12806 ) ) ( not ( = ?auto_12781 ?auto_12794 ) ) ( not ( = ?auto_12781 ?auto_12803 ) ) ( not ( = ?auto_12781 ?auto_12817 ) ) ( not ( = ?auto_12781 ?auto_12805 ) ) ( not ( = ?auto_12781 ?auto_12793 ) ) ( not ( = ?auto_12781 ?auto_12815 ) ) ( not ( = ?auto_12781 ?auto_12812 ) ) ( not ( = ?auto_12802 ?auto_12795 ) ) ( not ( = ?auto_12802 ?auto_12810 ) ) ( not ( = ?auto_12802 ?auto_12809 ) ) ( not ( = ?auto_12802 ?auto_12798 ) ) ( not ( = ?auto_12802 ?auto_12807 ) ) ( not ( = ?auto_12802 ?auto_12797 ) ) ( not ( = ?auto_12800 ?auto_12808 ) ) ( not ( = ?auto_12800 ?auto_12816 ) ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12811 ) ) ( not ( = ?auto_12800 ?auto_12813 ) ) ( not ( = ?auto_12800 ?auto_12799 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( not ( = ?auto_12804 ?auto_12794 ) ) ( not ( = ?auto_12804 ?auto_12803 ) ) ( not ( = ?auto_12804 ?auto_12817 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12793 ) ) ( not ( = ?auto_12804 ?auto_12815 ) ) ( not ( = ?auto_12804 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12782 ) ) ( not ( = ?auto_12772 ?auto_12791 ) ) ( not ( = ?auto_12773 ?auto_12782 ) ) ( not ( = ?auto_12773 ?auto_12791 ) ) ( not ( = ?auto_12774 ?auto_12782 ) ) ( not ( = ?auto_12774 ?auto_12791 ) ) ( not ( = ?auto_12775 ?auto_12782 ) ) ( not ( = ?auto_12775 ?auto_12791 ) ) ( not ( = ?auto_12776 ?auto_12782 ) ) ( not ( = ?auto_12776 ?auto_12791 ) ) ( not ( = ?auto_12777 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12791 ) ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12778 ?auto_12791 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) ( not ( = ?auto_12779 ?auto_12791 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12791 ) ) ( not ( = ?auto_12782 ?auto_12804 ) ) ( not ( = ?auto_12782 ?auto_12806 ) ) ( not ( = ?auto_12782 ?auto_12794 ) ) ( not ( = ?auto_12782 ?auto_12803 ) ) ( not ( = ?auto_12782 ?auto_12817 ) ) ( not ( = ?auto_12782 ?auto_12805 ) ) ( not ( = ?auto_12782 ?auto_12793 ) ) ( not ( = ?auto_12782 ?auto_12815 ) ) ( not ( = ?auto_12782 ?auto_12812 ) ) ( not ( = ?auto_12792 ?auto_12802 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12792 ?auto_12810 ) ) ( not ( = ?auto_12792 ?auto_12809 ) ) ( not ( = ?auto_12792 ?auto_12798 ) ) ( not ( = ?auto_12792 ?auto_12807 ) ) ( not ( = ?auto_12792 ?auto_12797 ) ) ( not ( = ?auto_12814 ?auto_12800 ) ) ( not ( = ?auto_12814 ?auto_12808 ) ) ( not ( = ?auto_12814 ?auto_12816 ) ) ( not ( = ?auto_12814 ?auto_12801 ) ) ( not ( = ?auto_12814 ?auto_12811 ) ) ( not ( = ?auto_12814 ?auto_12813 ) ) ( not ( = ?auto_12814 ?auto_12799 ) ) ( not ( = ?auto_12791 ?auto_12804 ) ) ( not ( = ?auto_12791 ?auto_12806 ) ) ( not ( = ?auto_12791 ?auto_12794 ) ) ( not ( = ?auto_12791 ?auto_12803 ) ) ( not ( = ?auto_12791 ?auto_12817 ) ) ( not ( = ?auto_12791 ?auto_12805 ) ) ( not ( = ?auto_12791 ?auto_12793 ) ) ( not ( = ?auto_12791 ?auto_12815 ) ) ( not ( = ?auto_12791 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12783 ) ) ( not ( = ?auto_12772 ?auto_12796 ) ) ( not ( = ?auto_12773 ?auto_12783 ) ) ( not ( = ?auto_12773 ?auto_12796 ) ) ( not ( = ?auto_12774 ?auto_12783 ) ) ( not ( = ?auto_12774 ?auto_12796 ) ) ( not ( = ?auto_12775 ?auto_12783 ) ) ( not ( = ?auto_12775 ?auto_12796 ) ) ( not ( = ?auto_12776 ?auto_12783 ) ) ( not ( = ?auto_12776 ?auto_12796 ) ) ( not ( = ?auto_12777 ?auto_12783 ) ) ( not ( = ?auto_12777 ?auto_12796 ) ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12778 ?auto_12796 ) ) ( not ( = ?auto_12779 ?auto_12783 ) ) ( not ( = ?auto_12779 ?auto_12796 ) ) ( not ( = ?auto_12780 ?auto_12783 ) ) ( not ( = ?auto_12780 ?auto_12796 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12791 ) ) ( not ( = ?auto_12783 ?auto_12804 ) ) ( not ( = ?auto_12783 ?auto_12806 ) ) ( not ( = ?auto_12783 ?auto_12794 ) ) ( not ( = ?auto_12783 ?auto_12803 ) ) ( not ( = ?auto_12783 ?auto_12817 ) ) ( not ( = ?auto_12783 ?auto_12805 ) ) ( not ( = ?auto_12783 ?auto_12793 ) ) ( not ( = ?auto_12783 ?auto_12815 ) ) ( not ( = ?auto_12783 ?auto_12812 ) ) ( not ( = ?auto_12796 ?auto_12791 ) ) ( not ( = ?auto_12796 ?auto_12804 ) ) ( not ( = ?auto_12796 ?auto_12806 ) ) ( not ( = ?auto_12796 ?auto_12794 ) ) ( not ( = ?auto_12796 ?auto_12803 ) ) ( not ( = ?auto_12796 ?auto_12817 ) ) ( not ( = ?auto_12796 ?auto_12805 ) ) ( not ( = ?auto_12796 ?auto_12793 ) ) ( not ( = ?auto_12796 ?auto_12815 ) ) ( not ( = ?auto_12796 ?auto_12812 ) ) ( not ( = ?auto_12772 ?auto_12784 ) ) ( not ( = ?auto_12772 ?auto_12787 ) ) ( not ( = ?auto_12773 ?auto_12784 ) ) ( not ( = ?auto_12773 ?auto_12787 ) ) ( not ( = ?auto_12774 ?auto_12784 ) ) ( not ( = ?auto_12774 ?auto_12787 ) ) ( not ( = ?auto_12775 ?auto_12784 ) ) ( not ( = ?auto_12775 ?auto_12787 ) ) ( not ( = ?auto_12776 ?auto_12784 ) ) ( not ( = ?auto_12776 ?auto_12787 ) ) ( not ( = ?auto_12777 ?auto_12784 ) ) ( not ( = ?auto_12777 ?auto_12787 ) ) ( not ( = ?auto_12778 ?auto_12784 ) ) ( not ( = ?auto_12778 ?auto_12787 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12787 ) ) ( not ( = ?auto_12780 ?auto_12784 ) ) ( not ( = ?auto_12780 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12796 ) ) ( not ( = ?auto_12784 ?auto_12791 ) ) ( not ( = ?auto_12784 ?auto_12804 ) ) ( not ( = ?auto_12784 ?auto_12806 ) ) ( not ( = ?auto_12784 ?auto_12794 ) ) ( not ( = ?auto_12784 ?auto_12803 ) ) ( not ( = ?auto_12784 ?auto_12817 ) ) ( not ( = ?auto_12784 ?auto_12805 ) ) ( not ( = ?auto_12784 ?auto_12793 ) ) ( not ( = ?auto_12784 ?auto_12815 ) ) ( not ( = ?auto_12784 ?auto_12812 ) ) ( not ( = ?auto_12786 ?auto_12810 ) ) ( not ( = ?auto_12786 ?auto_12792 ) ) ( not ( = ?auto_12786 ?auto_12802 ) ) ( not ( = ?auto_12786 ?auto_12795 ) ) ( not ( = ?auto_12786 ?auto_12809 ) ) ( not ( = ?auto_12786 ?auto_12798 ) ) ( not ( = ?auto_12786 ?auto_12807 ) ) ( not ( = ?auto_12786 ?auto_12797 ) ) ( not ( = ?auto_12785 ?auto_12816 ) ) ( not ( = ?auto_12785 ?auto_12814 ) ) ( not ( = ?auto_12785 ?auto_12800 ) ) ( not ( = ?auto_12785 ?auto_12808 ) ) ( not ( = ?auto_12785 ?auto_12801 ) ) ( not ( = ?auto_12785 ?auto_12811 ) ) ( not ( = ?auto_12785 ?auto_12813 ) ) ( not ( = ?auto_12785 ?auto_12799 ) ) ( not ( = ?auto_12787 ?auto_12796 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12804 ) ) ( not ( = ?auto_12787 ?auto_12806 ) ) ( not ( = ?auto_12787 ?auto_12794 ) ) ( not ( = ?auto_12787 ?auto_12803 ) ) ( not ( = ?auto_12787 ?auto_12817 ) ) ( not ( = ?auto_12787 ?auto_12805 ) ) ( not ( = ?auto_12787 ?auto_12793 ) ) ( not ( = ?auto_12787 ?auto_12815 ) ) ( not ( = ?auto_12787 ?auto_12812 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12772 ?auto_12773 ?auto_12774 ?auto_12775 ?auto_12776 ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12783 )
      ( MAKE-1CRATE ?auto_12783 ?auto_12784 )
      ( MAKE-12CRATE-VERIFY ?auto_12772 ?auto_12773 ?auto_12774 ?auto_12775 ?auto_12776 ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ) )
  )

)

