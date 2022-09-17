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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21335 - SURFACE
      ?auto_21336 - SURFACE
    )
    :vars
    (
      ?auto_21337 - HOIST
      ?auto_21338 - PLACE
      ?auto_21340 - PLACE
      ?auto_21341 - HOIST
      ?auto_21342 - SURFACE
      ?auto_21339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21337 ?auto_21338 ) ( SURFACE-AT ?auto_21335 ?auto_21338 ) ( CLEAR ?auto_21335 ) ( IS-CRATE ?auto_21336 ) ( AVAILABLE ?auto_21337 ) ( not ( = ?auto_21340 ?auto_21338 ) ) ( HOIST-AT ?auto_21341 ?auto_21340 ) ( AVAILABLE ?auto_21341 ) ( SURFACE-AT ?auto_21336 ?auto_21340 ) ( ON ?auto_21336 ?auto_21342 ) ( CLEAR ?auto_21336 ) ( TRUCK-AT ?auto_21339 ?auto_21338 ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21342 ) ) ( not ( = ?auto_21336 ?auto_21342 ) ) ( not ( = ?auto_21337 ?auto_21341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21339 ?auto_21338 ?auto_21340 )
      ( !LIFT ?auto_21341 ?auto_21336 ?auto_21342 ?auto_21340 )
      ( !LOAD ?auto_21341 ?auto_21336 ?auto_21339 ?auto_21340 )
      ( !DRIVE ?auto_21339 ?auto_21340 ?auto_21338 )
      ( !UNLOAD ?auto_21337 ?auto_21336 ?auto_21339 ?auto_21338 )
      ( !DROP ?auto_21337 ?auto_21336 ?auto_21335 ?auto_21338 )
      ( MAKE-1CRATE-VERIFY ?auto_21335 ?auto_21336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21345 - SURFACE
      ?auto_21346 - SURFACE
    )
    :vars
    (
      ?auto_21347 - HOIST
      ?auto_21348 - PLACE
      ?auto_21350 - PLACE
      ?auto_21351 - HOIST
      ?auto_21352 - SURFACE
      ?auto_21349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21347 ?auto_21348 ) ( SURFACE-AT ?auto_21345 ?auto_21348 ) ( CLEAR ?auto_21345 ) ( IS-CRATE ?auto_21346 ) ( AVAILABLE ?auto_21347 ) ( not ( = ?auto_21350 ?auto_21348 ) ) ( HOIST-AT ?auto_21351 ?auto_21350 ) ( AVAILABLE ?auto_21351 ) ( SURFACE-AT ?auto_21346 ?auto_21350 ) ( ON ?auto_21346 ?auto_21352 ) ( CLEAR ?auto_21346 ) ( TRUCK-AT ?auto_21349 ?auto_21348 ) ( not ( = ?auto_21345 ?auto_21346 ) ) ( not ( = ?auto_21345 ?auto_21352 ) ) ( not ( = ?auto_21346 ?auto_21352 ) ) ( not ( = ?auto_21347 ?auto_21351 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21349 ?auto_21348 ?auto_21350 )
      ( !LIFT ?auto_21351 ?auto_21346 ?auto_21352 ?auto_21350 )
      ( !LOAD ?auto_21351 ?auto_21346 ?auto_21349 ?auto_21350 )
      ( !DRIVE ?auto_21349 ?auto_21350 ?auto_21348 )
      ( !UNLOAD ?auto_21347 ?auto_21346 ?auto_21349 ?auto_21348 )
      ( !DROP ?auto_21347 ?auto_21346 ?auto_21345 ?auto_21348 )
      ( MAKE-1CRATE-VERIFY ?auto_21345 ?auto_21346 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21356 - SURFACE
      ?auto_21357 - SURFACE
      ?auto_21358 - SURFACE
    )
    :vars
    (
      ?auto_21360 - HOIST
      ?auto_21364 - PLACE
      ?auto_21361 - PLACE
      ?auto_21362 - HOIST
      ?auto_21363 - SURFACE
      ?auto_21366 - PLACE
      ?auto_21367 - HOIST
      ?auto_21365 - SURFACE
      ?auto_21359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21360 ?auto_21364 ) ( IS-CRATE ?auto_21358 ) ( not ( = ?auto_21361 ?auto_21364 ) ) ( HOIST-AT ?auto_21362 ?auto_21361 ) ( AVAILABLE ?auto_21362 ) ( SURFACE-AT ?auto_21358 ?auto_21361 ) ( ON ?auto_21358 ?auto_21363 ) ( CLEAR ?auto_21358 ) ( not ( = ?auto_21357 ?auto_21358 ) ) ( not ( = ?auto_21357 ?auto_21363 ) ) ( not ( = ?auto_21358 ?auto_21363 ) ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( SURFACE-AT ?auto_21356 ?auto_21364 ) ( CLEAR ?auto_21356 ) ( IS-CRATE ?auto_21357 ) ( AVAILABLE ?auto_21360 ) ( not ( = ?auto_21366 ?auto_21364 ) ) ( HOIST-AT ?auto_21367 ?auto_21366 ) ( AVAILABLE ?auto_21367 ) ( SURFACE-AT ?auto_21357 ?auto_21366 ) ( ON ?auto_21357 ?auto_21365 ) ( CLEAR ?auto_21357 ) ( TRUCK-AT ?auto_21359 ?auto_21364 ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21365 ) ) ( not ( = ?auto_21357 ?auto_21365 ) ) ( not ( = ?auto_21360 ?auto_21367 ) ) ( not ( = ?auto_21356 ?auto_21358 ) ) ( not ( = ?auto_21356 ?auto_21363 ) ) ( not ( = ?auto_21358 ?auto_21365 ) ) ( not ( = ?auto_21361 ?auto_21366 ) ) ( not ( = ?auto_21362 ?auto_21367 ) ) ( not ( = ?auto_21363 ?auto_21365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21356 ?auto_21357 )
      ( MAKE-1CRATE ?auto_21357 ?auto_21358 )
      ( MAKE-2CRATE-VERIFY ?auto_21356 ?auto_21357 ?auto_21358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21370 - SURFACE
      ?auto_21371 - SURFACE
    )
    :vars
    (
      ?auto_21372 - HOIST
      ?auto_21373 - PLACE
      ?auto_21375 - PLACE
      ?auto_21376 - HOIST
      ?auto_21377 - SURFACE
      ?auto_21374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21372 ?auto_21373 ) ( SURFACE-AT ?auto_21370 ?auto_21373 ) ( CLEAR ?auto_21370 ) ( IS-CRATE ?auto_21371 ) ( AVAILABLE ?auto_21372 ) ( not ( = ?auto_21375 ?auto_21373 ) ) ( HOIST-AT ?auto_21376 ?auto_21375 ) ( AVAILABLE ?auto_21376 ) ( SURFACE-AT ?auto_21371 ?auto_21375 ) ( ON ?auto_21371 ?auto_21377 ) ( CLEAR ?auto_21371 ) ( TRUCK-AT ?auto_21374 ?auto_21373 ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21370 ?auto_21377 ) ) ( not ( = ?auto_21371 ?auto_21377 ) ) ( not ( = ?auto_21372 ?auto_21376 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21374 ?auto_21373 ?auto_21375 )
      ( !LIFT ?auto_21376 ?auto_21371 ?auto_21377 ?auto_21375 )
      ( !LOAD ?auto_21376 ?auto_21371 ?auto_21374 ?auto_21375 )
      ( !DRIVE ?auto_21374 ?auto_21375 ?auto_21373 )
      ( !UNLOAD ?auto_21372 ?auto_21371 ?auto_21374 ?auto_21373 )
      ( !DROP ?auto_21372 ?auto_21371 ?auto_21370 ?auto_21373 )
      ( MAKE-1CRATE-VERIFY ?auto_21370 ?auto_21371 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21382 - SURFACE
      ?auto_21383 - SURFACE
      ?auto_21384 - SURFACE
      ?auto_21385 - SURFACE
    )
    :vars
    (
      ?auto_21390 - HOIST
      ?auto_21388 - PLACE
      ?auto_21386 - PLACE
      ?auto_21389 - HOIST
      ?auto_21387 - SURFACE
      ?auto_21393 - SURFACE
      ?auto_21392 - PLACE
      ?auto_21395 - HOIST
      ?auto_21394 - SURFACE
      ?auto_21391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21390 ?auto_21388 ) ( IS-CRATE ?auto_21385 ) ( not ( = ?auto_21386 ?auto_21388 ) ) ( HOIST-AT ?auto_21389 ?auto_21386 ) ( SURFACE-AT ?auto_21385 ?auto_21386 ) ( ON ?auto_21385 ?auto_21387 ) ( CLEAR ?auto_21385 ) ( not ( = ?auto_21384 ?auto_21385 ) ) ( not ( = ?auto_21384 ?auto_21387 ) ) ( not ( = ?auto_21385 ?auto_21387 ) ) ( not ( = ?auto_21390 ?auto_21389 ) ) ( IS-CRATE ?auto_21384 ) ( AVAILABLE ?auto_21389 ) ( SURFACE-AT ?auto_21384 ?auto_21386 ) ( ON ?auto_21384 ?auto_21393 ) ( CLEAR ?auto_21384 ) ( not ( = ?auto_21383 ?auto_21384 ) ) ( not ( = ?auto_21383 ?auto_21393 ) ) ( not ( = ?auto_21384 ?auto_21393 ) ) ( SURFACE-AT ?auto_21382 ?auto_21388 ) ( CLEAR ?auto_21382 ) ( IS-CRATE ?auto_21383 ) ( AVAILABLE ?auto_21390 ) ( not ( = ?auto_21392 ?auto_21388 ) ) ( HOIST-AT ?auto_21395 ?auto_21392 ) ( AVAILABLE ?auto_21395 ) ( SURFACE-AT ?auto_21383 ?auto_21392 ) ( ON ?auto_21383 ?auto_21394 ) ( CLEAR ?auto_21383 ) ( TRUCK-AT ?auto_21391 ?auto_21388 ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21382 ?auto_21394 ) ) ( not ( = ?auto_21383 ?auto_21394 ) ) ( not ( = ?auto_21390 ?auto_21395 ) ) ( not ( = ?auto_21382 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21393 ) ) ( not ( = ?auto_21384 ?auto_21394 ) ) ( not ( = ?auto_21386 ?auto_21392 ) ) ( not ( = ?auto_21389 ?auto_21395 ) ) ( not ( = ?auto_21393 ?auto_21394 ) ) ( not ( = ?auto_21382 ?auto_21385 ) ) ( not ( = ?auto_21382 ?auto_21387 ) ) ( not ( = ?auto_21383 ?auto_21385 ) ) ( not ( = ?auto_21383 ?auto_21387 ) ) ( not ( = ?auto_21385 ?auto_21393 ) ) ( not ( = ?auto_21385 ?auto_21394 ) ) ( not ( = ?auto_21387 ?auto_21393 ) ) ( not ( = ?auto_21387 ?auto_21394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21382 ?auto_21383 ?auto_21384 )
      ( MAKE-1CRATE ?auto_21384 ?auto_21385 )
      ( MAKE-3CRATE-VERIFY ?auto_21382 ?auto_21383 ?auto_21384 ?auto_21385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21398 - SURFACE
      ?auto_21399 - SURFACE
    )
    :vars
    (
      ?auto_21400 - HOIST
      ?auto_21401 - PLACE
      ?auto_21403 - PLACE
      ?auto_21404 - HOIST
      ?auto_21405 - SURFACE
      ?auto_21402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21400 ?auto_21401 ) ( SURFACE-AT ?auto_21398 ?auto_21401 ) ( CLEAR ?auto_21398 ) ( IS-CRATE ?auto_21399 ) ( AVAILABLE ?auto_21400 ) ( not ( = ?auto_21403 ?auto_21401 ) ) ( HOIST-AT ?auto_21404 ?auto_21403 ) ( AVAILABLE ?auto_21404 ) ( SURFACE-AT ?auto_21399 ?auto_21403 ) ( ON ?auto_21399 ?auto_21405 ) ( CLEAR ?auto_21399 ) ( TRUCK-AT ?auto_21402 ?auto_21401 ) ( not ( = ?auto_21398 ?auto_21399 ) ) ( not ( = ?auto_21398 ?auto_21405 ) ) ( not ( = ?auto_21399 ?auto_21405 ) ) ( not ( = ?auto_21400 ?auto_21404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21402 ?auto_21401 ?auto_21403 )
      ( !LIFT ?auto_21404 ?auto_21399 ?auto_21405 ?auto_21403 )
      ( !LOAD ?auto_21404 ?auto_21399 ?auto_21402 ?auto_21403 )
      ( !DRIVE ?auto_21402 ?auto_21403 ?auto_21401 )
      ( !UNLOAD ?auto_21400 ?auto_21399 ?auto_21402 ?auto_21401 )
      ( !DROP ?auto_21400 ?auto_21399 ?auto_21398 ?auto_21401 )
      ( MAKE-1CRATE-VERIFY ?auto_21398 ?auto_21399 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21411 - SURFACE
      ?auto_21412 - SURFACE
      ?auto_21413 - SURFACE
      ?auto_21414 - SURFACE
      ?auto_21415 - SURFACE
    )
    :vars
    (
      ?auto_21419 - HOIST
      ?auto_21421 - PLACE
      ?auto_21416 - PLACE
      ?auto_21417 - HOIST
      ?auto_21418 - SURFACE
      ?auto_21422 - PLACE
      ?auto_21423 - HOIST
      ?auto_21425 - SURFACE
      ?auto_21424 - SURFACE
      ?auto_21428 - PLACE
      ?auto_21426 - HOIST
      ?auto_21427 - SURFACE
      ?auto_21420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21419 ?auto_21421 ) ( IS-CRATE ?auto_21415 ) ( not ( = ?auto_21416 ?auto_21421 ) ) ( HOIST-AT ?auto_21417 ?auto_21416 ) ( AVAILABLE ?auto_21417 ) ( SURFACE-AT ?auto_21415 ?auto_21416 ) ( ON ?auto_21415 ?auto_21418 ) ( CLEAR ?auto_21415 ) ( not ( = ?auto_21414 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21418 ) ) ( not ( = ?auto_21415 ?auto_21418 ) ) ( not ( = ?auto_21419 ?auto_21417 ) ) ( IS-CRATE ?auto_21414 ) ( not ( = ?auto_21422 ?auto_21421 ) ) ( HOIST-AT ?auto_21423 ?auto_21422 ) ( SURFACE-AT ?auto_21414 ?auto_21422 ) ( ON ?auto_21414 ?auto_21425 ) ( CLEAR ?auto_21414 ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21413 ?auto_21425 ) ) ( not ( = ?auto_21414 ?auto_21425 ) ) ( not ( = ?auto_21419 ?auto_21423 ) ) ( IS-CRATE ?auto_21413 ) ( AVAILABLE ?auto_21423 ) ( SURFACE-AT ?auto_21413 ?auto_21422 ) ( ON ?auto_21413 ?auto_21424 ) ( CLEAR ?auto_21413 ) ( not ( = ?auto_21412 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21424 ) ) ( not ( = ?auto_21413 ?auto_21424 ) ) ( SURFACE-AT ?auto_21411 ?auto_21421 ) ( CLEAR ?auto_21411 ) ( IS-CRATE ?auto_21412 ) ( AVAILABLE ?auto_21419 ) ( not ( = ?auto_21428 ?auto_21421 ) ) ( HOIST-AT ?auto_21426 ?auto_21428 ) ( AVAILABLE ?auto_21426 ) ( SURFACE-AT ?auto_21412 ?auto_21428 ) ( ON ?auto_21412 ?auto_21427 ) ( CLEAR ?auto_21412 ) ( TRUCK-AT ?auto_21420 ?auto_21421 ) ( not ( = ?auto_21411 ?auto_21412 ) ) ( not ( = ?auto_21411 ?auto_21427 ) ) ( not ( = ?auto_21412 ?auto_21427 ) ) ( not ( = ?auto_21419 ?auto_21426 ) ) ( not ( = ?auto_21411 ?auto_21413 ) ) ( not ( = ?auto_21411 ?auto_21424 ) ) ( not ( = ?auto_21413 ?auto_21427 ) ) ( not ( = ?auto_21422 ?auto_21428 ) ) ( not ( = ?auto_21423 ?auto_21426 ) ) ( not ( = ?auto_21424 ?auto_21427 ) ) ( not ( = ?auto_21411 ?auto_21414 ) ) ( not ( = ?auto_21411 ?auto_21425 ) ) ( not ( = ?auto_21412 ?auto_21414 ) ) ( not ( = ?auto_21412 ?auto_21425 ) ) ( not ( = ?auto_21414 ?auto_21424 ) ) ( not ( = ?auto_21414 ?auto_21427 ) ) ( not ( = ?auto_21425 ?auto_21424 ) ) ( not ( = ?auto_21425 ?auto_21427 ) ) ( not ( = ?auto_21411 ?auto_21415 ) ) ( not ( = ?auto_21411 ?auto_21418 ) ) ( not ( = ?auto_21412 ?auto_21415 ) ) ( not ( = ?auto_21412 ?auto_21418 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21418 ) ) ( not ( = ?auto_21415 ?auto_21425 ) ) ( not ( = ?auto_21415 ?auto_21424 ) ) ( not ( = ?auto_21415 ?auto_21427 ) ) ( not ( = ?auto_21416 ?auto_21422 ) ) ( not ( = ?auto_21416 ?auto_21428 ) ) ( not ( = ?auto_21417 ?auto_21423 ) ) ( not ( = ?auto_21417 ?auto_21426 ) ) ( not ( = ?auto_21418 ?auto_21425 ) ) ( not ( = ?auto_21418 ?auto_21424 ) ) ( not ( = ?auto_21418 ?auto_21427 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21411 ?auto_21412 ?auto_21413 ?auto_21414 )
      ( MAKE-1CRATE ?auto_21414 ?auto_21415 )
      ( MAKE-4CRATE-VERIFY ?auto_21411 ?auto_21412 ?auto_21413 ?auto_21414 ?auto_21415 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21431 - SURFACE
      ?auto_21432 - SURFACE
    )
    :vars
    (
      ?auto_21433 - HOIST
      ?auto_21434 - PLACE
      ?auto_21436 - PLACE
      ?auto_21437 - HOIST
      ?auto_21438 - SURFACE
      ?auto_21435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21433 ?auto_21434 ) ( SURFACE-AT ?auto_21431 ?auto_21434 ) ( CLEAR ?auto_21431 ) ( IS-CRATE ?auto_21432 ) ( AVAILABLE ?auto_21433 ) ( not ( = ?auto_21436 ?auto_21434 ) ) ( HOIST-AT ?auto_21437 ?auto_21436 ) ( AVAILABLE ?auto_21437 ) ( SURFACE-AT ?auto_21432 ?auto_21436 ) ( ON ?auto_21432 ?auto_21438 ) ( CLEAR ?auto_21432 ) ( TRUCK-AT ?auto_21435 ?auto_21434 ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21431 ?auto_21438 ) ) ( not ( = ?auto_21432 ?auto_21438 ) ) ( not ( = ?auto_21433 ?auto_21437 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21435 ?auto_21434 ?auto_21436 )
      ( !LIFT ?auto_21437 ?auto_21432 ?auto_21438 ?auto_21436 )
      ( !LOAD ?auto_21437 ?auto_21432 ?auto_21435 ?auto_21436 )
      ( !DRIVE ?auto_21435 ?auto_21436 ?auto_21434 )
      ( !UNLOAD ?auto_21433 ?auto_21432 ?auto_21435 ?auto_21434 )
      ( !DROP ?auto_21433 ?auto_21432 ?auto_21431 ?auto_21434 )
      ( MAKE-1CRATE-VERIFY ?auto_21431 ?auto_21432 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21445 - SURFACE
      ?auto_21446 - SURFACE
      ?auto_21447 - SURFACE
      ?auto_21448 - SURFACE
      ?auto_21449 - SURFACE
      ?auto_21450 - SURFACE
    )
    :vars
    (
      ?auto_21452 - HOIST
      ?auto_21455 - PLACE
      ?auto_21451 - PLACE
      ?auto_21453 - HOIST
      ?auto_21456 - SURFACE
      ?auto_21458 - PLACE
      ?auto_21460 - HOIST
      ?auto_21465 - SURFACE
      ?auto_21462 - PLACE
      ?auto_21461 - HOIST
      ?auto_21466 - SURFACE
      ?auto_21464 - SURFACE
      ?auto_21459 - PLACE
      ?auto_21463 - HOIST
      ?auto_21457 - SURFACE
      ?auto_21454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21452 ?auto_21455 ) ( IS-CRATE ?auto_21450 ) ( not ( = ?auto_21451 ?auto_21455 ) ) ( HOIST-AT ?auto_21453 ?auto_21451 ) ( AVAILABLE ?auto_21453 ) ( SURFACE-AT ?auto_21450 ?auto_21451 ) ( ON ?auto_21450 ?auto_21456 ) ( CLEAR ?auto_21450 ) ( not ( = ?auto_21449 ?auto_21450 ) ) ( not ( = ?auto_21449 ?auto_21456 ) ) ( not ( = ?auto_21450 ?auto_21456 ) ) ( not ( = ?auto_21452 ?auto_21453 ) ) ( IS-CRATE ?auto_21449 ) ( not ( = ?auto_21458 ?auto_21455 ) ) ( HOIST-AT ?auto_21460 ?auto_21458 ) ( AVAILABLE ?auto_21460 ) ( SURFACE-AT ?auto_21449 ?auto_21458 ) ( ON ?auto_21449 ?auto_21465 ) ( CLEAR ?auto_21449 ) ( not ( = ?auto_21448 ?auto_21449 ) ) ( not ( = ?auto_21448 ?auto_21465 ) ) ( not ( = ?auto_21449 ?auto_21465 ) ) ( not ( = ?auto_21452 ?auto_21460 ) ) ( IS-CRATE ?auto_21448 ) ( not ( = ?auto_21462 ?auto_21455 ) ) ( HOIST-AT ?auto_21461 ?auto_21462 ) ( SURFACE-AT ?auto_21448 ?auto_21462 ) ( ON ?auto_21448 ?auto_21466 ) ( CLEAR ?auto_21448 ) ( not ( = ?auto_21447 ?auto_21448 ) ) ( not ( = ?auto_21447 ?auto_21466 ) ) ( not ( = ?auto_21448 ?auto_21466 ) ) ( not ( = ?auto_21452 ?auto_21461 ) ) ( IS-CRATE ?auto_21447 ) ( AVAILABLE ?auto_21461 ) ( SURFACE-AT ?auto_21447 ?auto_21462 ) ( ON ?auto_21447 ?auto_21464 ) ( CLEAR ?auto_21447 ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21464 ) ) ( not ( = ?auto_21447 ?auto_21464 ) ) ( SURFACE-AT ?auto_21445 ?auto_21455 ) ( CLEAR ?auto_21445 ) ( IS-CRATE ?auto_21446 ) ( AVAILABLE ?auto_21452 ) ( not ( = ?auto_21459 ?auto_21455 ) ) ( HOIST-AT ?auto_21463 ?auto_21459 ) ( AVAILABLE ?auto_21463 ) ( SURFACE-AT ?auto_21446 ?auto_21459 ) ( ON ?auto_21446 ?auto_21457 ) ( CLEAR ?auto_21446 ) ( TRUCK-AT ?auto_21454 ?auto_21455 ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21457 ) ) ( not ( = ?auto_21446 ?auto_21457 ) ) ( not ( = ?auto_21452 ?auto_21463 ) ) ( not ( = ?auto_21445 ?auto_21447 ) ) ( not ( = ?auto_21445 ?auto_21464 ) ) ( not ( = ?auto_21447 ?auto_21457 ) ) ( not ( = ?auto_21462 ?auto_21459 ) ) ( not ( = ?auto_21461 ?auto_21463 ) ) ( not ( = ?auto_21464 ?auto_21457 ) ) ( not ( = ?auto_21445 ?auto_21448 ) ) ( not ( = ?auto_21445 ?auto_21466 ) ) ( not ( = ?auto_21446 ?auto_21448 ) ) ( not ( = ?auto_21446 ?auto_21466 ) ) ( not ( = ?auto_21448 ?auto_21464 ) ) ( not ( = ?auto_21448 ?auto_21457 ) ) ( not ( = ?auto_21466 ?auto_21464 ) ) ( not ( = ?auto_21466 ?auto_21457 ) ) ( not ( = ?auto_21445 ?auto_21449 ) ) ( not ( = ?auto_21445 ?auto_21465 ) ) ( not ( = ?auto_21446 ?auto_21449 ) ) ( not ( = ?auto_21446 ?auto_21465 ) ) ( not ( = ?auto_21447 ?auto_21449 ) ) ( not ( = ?auto_21447 ?auto_21465 ) ) ( not ( = ?auto_21449 ?auto_21466 ) ) ( not ( = ?auto_21449 ?auto_21464 ) ) ( not ( = ?auto_21449 ?auto_21457 ) ) ( not ( = ?auto_21458 ?auto_21462 ) ) ( not ( = ?auto_21458 ?auto_21459 ) ) ( not ( = ?auto_21460 ?auto_21461 ) ) ( not ( = ?auto_21460 ?auto_21463 ) ) ( not ( = ?auto_21465 ?auto_21466 ) ) ( not ( = ?auto_21465 ?auto_21464 ) ) ( not ( = ?auto_21465 ?auto_21457 ) ) ( not ( = ?auto_21445 ?auto_21450 ) ) ( not ( = ?auto_21445 ?auto_21456 ) ) ( not ( = ?auto_21446 ?auto_21450 ) ) ( not ( = ?auto_21446 ?auto_21456 ) ) ( not ( = ?auto_21447 ?auto_21450 ) ) ( not ( = ?auto_21447 ?auto_21456 ) ) ( not ( = ?auto_21448 ?auto_21450 ) ) ( not ( = ?auto_21448 ?auto_21456 ) ) ( not ( = ?auto_21450 ?auto_21465 ) ) ( not ( = ?auto_21450 ?auto_21466 ) ) ( not ( = ?auto_21450 ?auto_21464 ) ) ( not ( = ?auto_21450 ?auto_21457 ) ) ( not ( = ?auto_21451 ?auto_21458 ) ) ( not ( = ?auto_21451 ?auto_21462 ) ) ( not ( = ?auto_21451 ?auto_21459 ) ) ( not ( = ?auto_21453 ?auto_21460 ) ) ( not ( = ?auto_21453 ?auto_21461 ) ) ( not ( = ?auto_21453 ?auto_21463 ) ) ( not ( = ?auto_21456 ?auto_21465 ) ) ( not ( = ?auto_21456 ?auto_21466 ) ) ( not ( = ?auto_21456 ?auto_21464 ) ) ( not ( = ?auto_21456 ?auto_21457 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21445 ?auto_21446 ?auto_21447 ?auto_21448 ?auto_21449 )
      ( MAKE-1CRATE ?auto_21449 ?auto_21450 )
      ( MAKE-5CRATE-VERIFY ?auto_21445 ?auto_21446 ?auto_21447 ?auto_21448 ?auto_21449 ?auto_21450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21469 - SURFACE
      ?auto_21470 - SURFACE
    )
    :vars
    (
      ?auto_21471 - HOIST
      ?auto_21472 - PLACE
      ?auto_21474 - PLACE
      ?auto_21475 - HOIST
      ?auto_21476 - SURFACE
      ?auto_21473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21471 ?auto_21472 ) ( SURFACE-AT ?auto_21469 ?auto_21472 ) ( CLEAR ?auto_21469 ) ( IS-CRATE ?auto_21470 ) ( AVAILABLE ?auto_21471 ) ( not ( = ?auto_21474 ?auto_21472 ) ) ( HOIST-AT ?auto_21475 ?auto_21474 ) ( AVAILABLE ?auto_21475 ) ( SURFACE-AT ?auto_21470 ?auto_21474 ) ( ON ?auto_21470 ?auto_21476 ) ( CLEAR ?auto_21470 ) ( TRUCK-AT ?auto_21473 ?auto_21472 ) ( not ( = ?auto_21469 ?auto_21470 ) ) ( not ( = ?auto_21469 ?auto_21476 ) ) ( not ( = ?auto_21470 ?auto_21476 ) ) ( not ( = ?auto_21471 ?auto_21475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21473 ?auto_21472 ?auto_21474 )
      ( !LIFT ?auto_21475 ?auto_21470 ?auto_21476 ?auto_21474 )
      ( !LOAD ?auto_21475 ?auto_21470 ?auto_21473 ?auto_21474 )
      ( !DRIVE ?auto_21473 ?auto_21474 ?auto_21472 )
      ( !UNLOAD ?auto_21471 ?auto_21470 ?auto_21473 ?auto_21472 )
      ( !DROP ?auto_21471 ?auto_21470 ?auto_21469 ?auto_21472 )
      ( MAKE-1CRATE-VERIFY ?auto_21469 ?auto_21470 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_21484 - SURFACE
      ?auto_21485 - SURFACE
      ?auto_21486 - SURFACE
      ?auto_21487 - SURFACE
      ?auto_21488 - SURFACE
      ?auto_21490 - SURFACE
      ?auto_21489 - SURFACE
    )
    :vars
    (
      ?auto_21495 - HOIST
      ?auto_21492 - PLACE
      ?auto_21493 - PLACE
      ?auto_21491 - HOIST
      ?auto_21494 - SURFACE
      ?auto_21505 - PLACE
      ?auto_21498 - HOIST
      ?auto_21504 - SURFACE
      ?auto_21501 - SURFACE
      ?auto_21499 - PLACE
      ?auto_21497 - HOIST
      ?auto_21500 - SURFACE
      ?auto_21502 - SURFACE
      ?auto_21506 - PLACE
      ?auto_21507 - HOIST
      ?auto_21503 - SURFACE
      ?auto_21496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21495 ?auto_21492 ) ( IS-CRATE ?auto_21489 ) ( not ( = ?auto_21493 ?auto_21492 ) ) ( HOIST-AT ?auto_21491 ?auto_21493 ) ( SURFACE-AT ?auto_21489 ?auto_21493 ) ( ON ?auto_21489 ?auto_21494 ) ( CLEAR ?auto_21489 ) ( not ( = ?auto_21490 ?auto_21489 ) ) ( not ( = ?auto_21490 ?auto_21494 ) ) ( not ( = ?auto_21489 ?auto_21494 ) ) ( not ( = ?auto_21495 ?auto_21491 ) ) ( IS-CRATE ?auto_21490 ) ( not ( = ?auto_21505 ?auto_21492 ) ) ( HOIST-AT ?auto_21498 ?auto_21505 ) ( AVAILABLE ?auto_21498 ) ( SURFACE-AT ?auto_21490 ?auto_21505 ) ( ON ?auto_21490 ?auto_21504 ) ( CLEAR ?auto_21490 ) ( not ( = ?auto_21488 ?auto_21490 ) ) ( not ( = ?auto_21488 ?auto_21504 ) ) ( not ( = ?auto_21490 ?auto_21504 ) ) ( not ( = ?auto_21495 ?auto_21498 ) ) ( IS-CRATE ?auto_21488 ) ( AVAILABLE ?auto_21491 ) ( SURFACE-AT ?auto_21488 ?auto_21493 ) ( ON ?auto_21488 ?auto_21501 ) ( CLEAR ?auto_21488 ) ( not ( = ?auto_21487 ?auto_21488 ) ) ( not ( = ?auto_21487 ?auto_21501 ) ) ( not ( = ?auto_21488 ?auto_21501 ) ) ( IS-CRATE ?auto_21487 ) ( not ( = ?auto_21499 ?auto_21492 ) ) ( HOIST-AT ?auto_21497 ?auto_21499 ) ( SURFACE-AT ?auto_21487 ?auto_21499 ) ( ON ?auto_21487 ?auto_21500 ) ( CLEAR ?auto_21487 ) ( not ( = ?auto_21486 ?auto_21487 ) ) ( not ( = ?auto_21486 ?auto_21500 ) ) ( not ( = ?auto_21487 ?auto_21500 ) ) ( not ( = ?auto_21495 ?auto_21497 ) ) ( IS-CRATE ?auto_21486 ) ( AVAILABLE ?auto_21497 ) ( SURFACE-AT ?auto_21486 ?auto_21499 ) ( ON ?auto_21486 ?auto_21502 ) ( CLEAR ?auto_21486 ) ( not ( = ?auto_21485 ?auto_21486 ) ) ( not ( = ?auto_21485 ?auto_21502 ) ) ( not ( = ?auto_21486 ?auto_21502 ) ) ( SURFACE-AT ?auto_21484 ?auto_21492 ) ( CLEAR ?auto_21484 ) ( IS-CRATE ?auto_21485 ) ( AVAILABLE ?auto_21495 ) ( not ( = ?auto_21506 ?auto_21492 ) ) ( HOIST-AT ?auto_21507 ?auto_21506 ) ( AVAILABLE ?auto_21507 ) ( SURFACE-AT ?auto_21485 ?auto_21506 ) ( ON ?auto_21485 ?auto_21503 ) ( CLEAR ?auto_21485 ) ( TRUCK-AT ?auto_21496 ?auto_21492 ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( not ( = ?auto_21484 ?auto_21503 ) ) ( not ( = ?auto_21485 ?auto_21503 ) ) ( not ( = ?auto_21495 ?auto_21507 ) ) ( not ( = ?auto_21484 ?auto_21486 ) ) ( not ( = ?auto_21484 ?auto_21502 ) ) ( not ( = ?auto_21486 ?auto_21503 ) ) ( not ( = ?auto_21499 ?auto_21506 ) ) ( not ( = ?auto_21497 ?auto_21507 ) ) ( not ( = ?auto_21502 ?auto_21503 ) ) ( not ( = ?auto_21484 ?auto_21487 ) ) ( not ( = ?auto_21484 ?auto_21500 ) ) ( not ( = ?auto_21485 ?auto_21487 ) ) ( not ( = ?auto_21485 ?auto_21500 ) ) ( not ( = ?auto_21487 ?auto_21502 ) ) ( not ( = ?auto_21487 ?auto_21503 ) ) ( not ( = ?auto_21500 ?auto_21502 ) ) ( not ( = ?auto_21500 ?auto_21503 ) ) ( not ( = ?auto_21484 ?auto_21488 ) ) ( not ( = ?auto_21484 ?auto_21501 ) ) ( not ( = ?auto_21485 ?auto_21488 ) ) ( not ( = ?auto_21485 ?auto_21501 ) ) ( not ( = ?auto_21486 ?auto_21488 ) ) ( not ( = ?auto_21486 ?auto_21501 ) ) ( not ( = ?auto_21488 ?auto_21500 ) ) ( not ( = ?auto_21488 ?auto_21502 ) ) ( not ( = ?auto_21488 ?auto_21503 ) ) ( not ( = ?auto_21493 ?auto_21499 ) ) ( not ( = ?auto_21493 ?auto_21506 ) ) ( not ( = ?auto_21491 ?auto_21497 ) ) ( not ( = ?auto_21491 ?auto_21507 ) ) ( not ( = ?auto_21501 ?auto_21500 ) ) ( not ( = ?auto_21501 ?auto_21502 ) ) ( not ( = ?auto_21501 ?auto_21503 ) ) ( not ( = ?auto_21484 ?auto_21490 ) ) ( not ( = ?auto_21484 ?auto_21504 ) ) ( not ( = ?auto_21485 ?auto_21490 ) ) ( not ( = ?auto_21485 ?auto_21504 ) ) ( not ( = ?auto_21486 ?auto_21490 ) ) ( not ( = ?auto_21486 ?auto_21504 ) ) ( not ( = ?auto_21487 ?auto_21490 ) ) ( not ( = ?auto_21487 ?auto_21504 ) ) ( not ( = ?auto_21490 ?auto_21501 ) ) ( not ( = ?auto_21490 ?auto_21500 ) ) ( not ( = ?auto_21490 ?auto_21502 ) ) ( not ( = ?auto_21490 ?auto_21503 ) ) ( not ( = ?auto_21505 ?auto_21493 ) ) ( not ( = ?auto_21505 ?auto_21499 ) ) ( not ( = ?auto_21505 ?auto_21506 ) ) ( not ( = ?auto_21498 ?auto_21491 ) ) ( not ( = ?auto_21498 ?auto_21497 ) ) ( not ( = ?auto_21498 ?auto_21507 ) ) ( not ( = ?auto_21504 ?auto_21501 ) ) ( not ( = ?auto_21504 ?auto_21500 ) ) ( not ( = ?auto_21504 ?auto_21502 ) ) ( not ( = ?auto_21504 ?auto_21503 ) ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( not ( = ?auto_21484 ?auto_21494 ) ) ( not ( = ?auto_21485 ?auto_21489 ) ) ( not ( = ?auto_21485 ?auto_21494 ) ) ( not ( = ?auto_21486 ?auto_21489 ) ) ( not ( = ?auto_21486 ?auto_21494 ) ) ( not ( = ?auto_21487 ?auto_21489 ) ) ( not ( = ?auto_21487 ?auto_21494 ) ) ( not ( = ?auto_21488 ?auto_21489 ) ) ( not ( = ?auto_21488 ?auto_21494 ) ) ( not ( = ?auto_21489 ?auto_21504 ) ) ( not ( = ?auto_21489 ?auto_21501 ) ) ( not ( = ?auto_21489 ?auto_21500 ) ) ( not ( = ?auto_21489 ?auto_21502 ) ) ( not ( = ?auto_21489 ?auto_21503 ) ) ( not ( = ?auto_21494 ?auto_21504 ) ) ( not ( = ?auto_21494 ?auto_21501 ) ) ( not ( = ?auto_21494 ?auto_21500 ) ) ( not ( = ?auto_21494 ?auto_21502 ) ) ( not ( = ?auto_21494 ?auto_21503 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21484 ?auto_21485 ?auto_21486 ?auto_21487 ?auto_21488 ?auto_21490 )
      ( MAKE-1CRATE ?auto_21490 ?auto_21489 )
      ( MAKE-6CRATE-VERIFY ?auto_21484 ?auto_21485 ?auto_21486 ?auto_21487 ?auto_21488 ?auto_21490 ?auto_21489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21510 - SURFACE
      ?auto_21511 - SURFACE
    )
    :vars
    (
      ?auto_21512 - HOIST
      ?auto_21513 - PLACE
      ?auto_21515 - PLACE
      ?auto_21516 - HOIST
      ?auto_21517 - SURFACE
      ?auto_21514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21512 ?auto_21513 ) ( SURFACE-AT ?auto_21510 ?auto_21513 ) ( CLEAR ?auto_21510 ) ( IS-CRATE ?auto_21511 ) ( AVAILABLE ?auto_21512 ) ( not ( = ?auto_21515 ?auto_21513 ) ) ( HOIST-AT ?auto_21516 ?auto_21515 ) ( AVAILABLE ?auto_21516 ) ( SURFACE-AT ?auto_21511 ?auto_21515 ) ( ON ?auto_21511 ?auto_21517 ) ( CLEAR ?auto_21511 ) ( TRUCK-AT ?auto_21514 ?auto_21513 ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21517 ) ) ( not ( = ?auto_21511 ?auto_21517 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21514 ?auto_21513 ?auto_21515 )
      ( !LIFT ?auto_21516 ?auto_21511 ?auto_21517 ?auto_21515 )
      ( !LOAD ?auto_21516 ?auto_21511 ?auto_21514 ?auto_21515 )
      ( !DRIVE ?auto_21514 ?auto_21515 ?auto_21513 )
      ( !UNLOAD ?auto_21512 ?auto_21511 ?auto_21514 ?auto_21513 )
      ( !DROP ?auto_21512 ?auto_21511 ?auto_21510 ?auto_21513 )
      ( MAKE-1CRATE-VERIFY ?auto_21510 ?auto_21511 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_21526 - SURFACE
      ?auto_21527 - SURFACE
      ?auto_21528 - SURFACE
      ?auto_21529 - SURFACE
      ?auto_21530 - SURFACE
      ?auto_21532 - SURFACE
      ?auto_21531 - SURFACE
      ?auto_21533 - SURFACE
    )
    :vars
    (
      ?auto_21536 - HOIST
      ?auto_21534 - PLACE
      ?auto_21535 - PLACE
      ?auto_21539 - HOIST
      ?auto_21537 - SURFACE
      ?auto_21544 - PLACE
      ?auto_21545 - HOIST
      ?auto_21543 - SURFACE
      ?auto_21548 - PLACE
      ?auto_21552 - HOIST
      ?auto_21546 - SURFACE
      ?auto_21541 - SURFACE
      ?auto_21542 - PLACE
      ?auto_21549 - HOIST
      ?auto_21551 - SURFACE
      ?auto_21550 - SURFACE
      ?auto_21553 - PLACE
      ?auto_21547 - HOIST
      ?auto_21540 - SURFACE
      ?auto_21538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21536 ?auto_21534 ) ( IS-CRATE ?auto_21533 ) ( not ( = ?auto_21535 ?auto_21534 ) ) ( HOIST-AT ?auto_21539 ?auto_21535 ) ( AVAILABLE ?auto_21539 ) ( SURFACE-AT ?auto_21533 ?auto_21535 ) ( ON ?auto_21533 ?auto_21537 ) ( CLEAR ?auto_21533 ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21537 ) ) ( not ( = ?auto_21533 ?auto_21537 ) ) ( not ( = ?auto_21536 ?auto_21539 ) ) ( IS-CRATE ?auto_21531 ) ( not ( = ?auto_21544 ?auto_21534 ) ) ( HOIST-AT ?auto_21545 ?auto_21544 ) ( SURFACE-AT ?auto_21531 ?auto_21544 ) ( ON ?auto_21531 ?auto_21543 ) ( CLEAR ?auto_21531 ) ( not ( = ?auto_21532 ?auto_21531 ) ) ( not ( = ?auto_21532 ?auto_21543 ) ) ( not ( = ?auto_21531 ?auto_21543 ) ) ( not ( = ?auto_21536 ?auto_21545 ) ) ( IS-CRATE ?auto_21532 ) ( not ( = ?auto_21548 ?auto_21534 ) ) ( HOIST-AT ?auto_21552 ?auto_21548 ) ( AVAILABLE ?auto_21552 ) ( SURFACE-AT ?auto_21532 ?auto_21548 ) ( ON ?auto_21532 ?auto_21546 ) ( CLEAR ?auto_21532 ) ( not ( = ?auto_21530 ?auto_21532 ) ) ( not ( = ?auto_21530 ?auto_21546 ) ) ( not ( = ?auto_21532 ?auto_21546 ) ) ( not ( = ?auto_21536 ?auto_21552 ) ) ( IS-CRATE ?auto_21530 ) ( AVAILABLE ?auto_21545 ) ( SURFACE-AT ?auto_21530 ?auto_21544 ) ( ON ?auto_21530 ?auto_21541 ) ( CLEAR ?auto_21530 ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21529 ?auto_21541 ) ) ( not ( = ?auto_21530 ?auto_21541 ) ) ( IS-CRATE ?auto_21529 ) ( not ( = ?auto_21542 ?auto_21534 ) ) ( HOIST-AT ?auto_21549 ?auto_21542 ) ( SURFACE-AT ?auto_21529 ?auto_21542 ) ( ON ?auto_21529 ?auto_21551 ) ( CLEAR ?auto_21529 ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21551 ) ) ( not ( = ?auto_21529 ?auto_21551 ) ) ( not ( = ?auto_21536 ?auto_21549 ) ) ( IS-CRATE ?auto_21528 ) ( AVAILABLE ?auto_21549 ) ( SURFACE-AT ?auto_21528 ?auto_21542 ) ( ON ?auto_21528 ?auto_21550 ) ( CLEAR ?auto_21528 ) ( not ( = ?auto_21527 ?auto_21528 ) ) ( not ( = ?auto_21527 ?auto_21550 ) ) ( not ( = ?auto_21528 ?auto_21550 ) ) ( SURFACE-AT ?auto_21526 ?auto_21534 ) ( CLEAR ?auto_21526 ) ( IS-CRATE ?auto_21527 ) ( AVAILABLE ?auto_21536 ) ( not ( = ?auto_21553 ?auto_21534 ) ) ( HOIST-AT ?auto_21547 ?auto_21553 ) ( AVAILABLE ?auto_21547 ) ( SURFACE-AT ?auto_21527 ?auto_21553 ) ( ON ?auto_21527 ?auto_21540 ) ( CLEAR ?auto_21527 ) ( TRUCK-AT ?auto_21538 ?auto_21534 ) ( not ( = ?auto_21526 ?auto_21527 ) ) ( not ( = ?auto_21526 ?auto_21540 ) ) ( not ( = ?auto_21527 ?auto_21540 ) ) ( not ( = ?auto_21536 ?auto_21547 ) ) ( not ( = ?auto_21526 ?auto_21528 ) ) ( not ( = ?auto_21526 ?auto_21550 ) ) ( not ( = ?auto_21528 ?auto_21540 ) ) ( not ( = ?auto_21542 ?auto_21553 ) ) ( not ( = ?auto_21549 ?auto_21547 ) ) ( not ( = ?auto_21550 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21529 ) ) ( not ( = ?auto_21526 ?auto_21551 ) ) ( not ( = ?auto_21527 ?auto_21529 ) ) ( not ( = ?auto_21527 ?auto_21551 ) ) ( not ( = ?auto_21529 ?auto_21550 ) ) ( not ( = ?auto_21529 ?auto_21540 ) ) ( not ( = ?auto_21551 ?auto_21550 ) ) ( not ( = ?auto_21551 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21530 ) ) ( not ( = ?auto_21526 ?auto_21541 ) ) ( not ( = ?auto_21527 ?auto_21530 ) ) ( not ( = ?auto_21527 ?auto_21541 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21541 ) ) ( not ( = ?auto_21530 ?auto_21551 ) ) ( not ( = ?auto_21530 ?auto_21550 ) ) ( not ( = ?auto_21530 ?auto_21540 ) ) ( not ( = ?auto_21544 ?auto_21542 ) ) ( not ( = ?auto_21544 ?auto_21553 ) ) ( not ( = ?auto_21545 ?auto_21549 ) ) ( not ( = ?auto_21545 ?auto_21547 ) ) ( not ( = ?auto_21541 ?auto_21551 ) ) ( not ( = ?auto_21541 ?auto_21550 ) ) ( not ( = ?auto_21541 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21532 ) ) ( not ( = ?auto_21526 ?auto_21546 ) ) ( not ( = ?auto_21527 ?auto_21532 ) ) ( not ( = ?auto_21527 ?auto_21546 ) ) ( not ( = ?auto_21528 ?auto_21532 ) ) ( not ( = ?auto_21528 ?auto_21546 ) ) ( not ( = ?auto_21529 ?auto_21532 ) ) ( not ( = ?auto_21529 ?auto_21546 ) ) ( not ( = ?auto_21532 ?auto_21541 ) ) ( not ( = ?auto_21532 ?auto_21551 ) ) ( not ( = ?auto_21532 ?auto_21550 ) ) ( not ( = ?auto_21532 ?auto_21540 ) ) ( not ( = ?auto_21548 ?auto_21544 ) ) ( not ( = ?auto_21548 ?auto_21542 ) ) ( not ( = ?auto_21548 ?auto_21553 ) ) ( not ( = ?auto_21552 ?auto_21545 ) ) ( not ( = ?auto_21552 ?auto_21549 ) ) ( not ( = ?auto_21552 ?auto_21547 ) ) ( not ( = ?auto_21546 ?auto_21541 ) ) ( not ( = ?auto_21546 ?auto_21551 ) ) ( not ( = ?auto_21546 ?auto_21550 ) ) ( not ( = ?auto_21546 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21531 ) ) ( not ( = ?auto_21526 ?auto_21543 ) ) ( not ( = ?auto_21527 ?auto_21531 ) ) ( not ( = ?auto_21527 ?auto_21543 ) ) ( not ( = ?auto_21528 ?auto_21531 ) ) ( not ( = ?auto_21528 ?auto_21543 ) ) ( not ( = ?auto_21529 ?auto_21531 ) ) ( not ( = ?auto_21529 ?auto_21543 ) ) ( not ( = ?auto_21530 ?auto_21531 ) ) ( not ( = ?auto_21530 ?auto_21543 ) ) ( not ( = ?auto_21531 ?auto_21546 ) ) ( not ( = ?auto_21531 ?auto_21541 ) ) ( not ( = ?auto_21531 ?auto_21551 ) ) ( not ( = ?auto_21531 ?auto_21550 ) ) ( not ( = ?auto_21531 ?auto_21540 ) ) ( not ( = ?auto_21543 ?auto_21546 ) ) ( not ( = ?auto_21543 ?auto_21541 ) ) ( not ( = ?auto_21543 ?auto_21551 ) ) ( not ( = ?auto_21543 ?auto_21550 ) ) ( not ( = ?auto_21543 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21533 ) ) ( not ( = ?auto_21526 ?auto_21537 ) ) ( not ( = ?auto_21527 ?auto_21533 ) ) ( not ( = ?auto_21527 ?auto_21537 ) ) ( not ( = ?auto_21528 ?auto_21533 ) ) ( not ( = ?auto_21528 ?auto_21537 ) ) ( not ( = ?auto_21529 ?auto_21533 ) ) ( not ( = ?auto_21529 ?auto_21537 ) ) ( not ( = ?auto_21530 ?auto_21533 ) ) ( not ( = ?auto_21530 ?auto_21537 ) ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21532 ?auto_21537 ) ) ( not ( = ?auto_21533 ?auto_21543 ) ) ( not ( = ?auto_21533 ?auto_21546 ) ) ( not ( = ?auto_21533 ?auto_21541 ) ) ( not ( = ?auto_21533 ?auto_21551 ) ) ( not ( = ?auto_21533 ?auto_21550 ) ) ( not ( = ?auto_21533 ?auto_21540 ) ) ( not ( = ?auto_21535 ?auto_21544 ) ) ( not ( = ?auto_21535 ?auto_21548 ) ) ( not ( = ?auto_21535 ?auto_21542 ) ) ( not ( = ?auto_21535 ?auto_21553 ) ) ( not ( = ?auto_21539 ?auto_21545 ) ) ( not ( = ?auto_21539 ?auto_21552 ) ) ( not ( = ?auto_21539 ?auto_21549 ) ) ( not ( = ?auto_21539 ?auto_21547 ) ) ( not ( = ?auto_21537 ?auto_21543 ) ) ( not ( = ?auto_21537 ?auto_21546 ) ) ( not ( = ?auto_21537 ?auto_21541 ) ) ( not ( = ?auto_21537 ?auto_21551 ) ) ( not ( = ?auto_21537 ?auto_21550 ) ) ( not ( = ?auto_21537 ?auto_21540 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21526 ?auto_21527 ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21532 ?auto_21531 )
      ( MAKE-1CRATE ?auto_21531 ?auto_21533 )
      ( MAKE-7CRATE-VERIFY ?auto_21526 ?auto_21527 ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21532 ?auto_21531 ?auto_21533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21556 - SURFACE
      ?auto_21557 - SURFACE
    )
    :vars
    (
      ?auto_21558 - HOIST
      ?auto_21559 - PLACE
      ?auto_21561 - PLACE
      ?auto_21562 - HOIST
      ?auto_21563 - SURFACE
      ?auto_21560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21558 ?auto_21559 ) ( SURFACE-AT ?auto_21556 ?auto_21559 ) ( CLEAR ?auto_21556 ) ( IS-CRATE ?auto_21557 ) ( AVAILABLE ?auto_21558 ) ( not ( = ?auto_21561 ?auto_21559 ) ) ( HOIST-AT ?auto_21562 ?auto_21561 ) ( AVAILABLE ?auto_21562 ) ( SURFACE-AT ?auto_21557 ?auto_21561 ) ( ON ?auto_21557 ?auto_21563 ) ( CLEAR ?auto_21557 ) ( TRUCK-AT ?auto_21560 ?auto_21559 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21563 ) ) ( not ( = ?auto_21557 ?auto_21563 ) ) ( not ( = ?auto_21558 ?auto_21562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21560 ?auto_21559 ?auto_21561 )
      ( !LIFT ?auto_21562 ?auto_21557 ?auto_21563 ?auto_21561 )
      ( !LOAD ?auto_21562 ?auto_21557 ?auto_21560 ?auto_21561 )
      ( !DRIVE ?auto_21560 ?auto_21561 ?auto_21559 )
      ( !UNLOAD ?auto_21558 ?auto_21557 ?auto_21560 ?auto_21559 )
      ( !DROP ?auto_21558 ?auto_21557 ?auto_21556 ?auto_21559 )
      ( MAKE-1CRATE-VERIFY ?auto_21556 ?auto_21557 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_21573 - SURFACE
      ?auto_21574 - SURFACE
      ?auto_21575 - SURFACE
      ?auto_21576 - SURFACE
      ?auto_21577 - SURFACE
      ?auto_21579 - SURFACE
      ?auto_21578 - SURFACE
      ?auto_21581 - SURFACE
      ?auto_21580 - SURFACE
    )
    :vars
    (
      ?auto_21583 - HOIST
      ?auto_21587 - PLACE
      ?auto_21585 - PLACE
      ?auto_21586 - HOIST
      ?auto_21584 - SURFACE
      ?auto_21589 - PLACE
      ?auto_21600 - HOIST
      ?auto_21588 - SURFACE
      ?auto_21591 - PLACE
      ?auto_21592 - HOIST
      ?auto_21601 - SURFACE
      ?auto_21595 - PLACE
      ?auto_21597 - HOIST
      ?auto_21590 - SURFACE
      ?auto_21602 - SURFACE
      ?auto_21603 - PLACE
      ?auto_21594 - HOIST
      ?auto_21598 - SURFACE
      ?auto_21596 - SURFACE
      ?auto_21599 - PLACE
      ?auto_21604 - HOIST
      ?auto_21593 - SURFACE
      ?auto_21582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21583 ?auto_21587 ) ( IS-CRATE ?auto_21580 ) ( not ( = ?auto_21585 ?auto_21587 ) ) ( HOIST-AT ?auto_21586 ?auto_21585 ) ( AVAILABLE ?auto_21586 ) ( SURFACE-AT ?auto_21580 ?auto_21585 ) ( ON ?auto_21580 ?auto_21584 ) ( CLEAR ?auto_21580 ) ( not ( = ?auto_21581 ?auto_21580 ) ) ( not ( = ?auto_21581 ?auto_21584 ) ) ( not ( = ?auto_21580 ?auto_21584 ) ) ( not ( = ?auto_21583 ?auto_21586 ) ) ( IS-CRATE ?auto_21581 ) ( not ( = ?auto_21589 ?auto_21587 ) ) ( HOIST-AT ?auto_21600 ?auto_21589 ) ( AVAILABLE ?auto_21600 ) ( SURFACE-AT ?auto_21581 ?auto_21589 ) ( ON ?auto_21581 ?auto_21588 ) ( CLEAR ?auto_21581 ) ( not ( = ?auto_21578 ?auto_21581 ) ) ( not ( = ?auto_21578 ?auto_21588 ) ) ( not ( = ?auto_21581 ?auto_21588 ) ) ( not ( = ?auto_21583 ?auto_21600 ) ) ( IS-CRATE ?auto_21578 ) ( not ( = ?auto_21591 ?auto_21587 ) ) ( HOIST-AT ?auto_21592 ?auto_21591 ) ( SURFACE-AT ?auto_21578 ?auto_21591 ) ( ON ?auto_21578 ?auto_21601 ) ( CLEAR ?auto_21578 ) ( not ( = ?auto_21579 ?auto_21578 ) ) ( not ( = ?auto_21579 ?auto_21601 ) ) ( not ( = ?auto_21578 ?auto_21601 ) ) ( not ( = ?auto_21583 ?auto_21592 ) ) ( IS-CRATE ?auto_21579 ) ( not ( = ?auto_21595 ?auto_21587 ) ) ( HOIST-AT ?auto_21597 ?auto_21595 ) ( AVAILABLE ?auto_21597 ) ( SURFACE-AT ?auto_21579 ?auto_21595 ) ( ON ?auto_21579 ?auto_21590 ) ( CLEAR ?auto_21579 ) ( not ( = ?auto_21577 ?auto_21579 ) ) ( not ( = ?auto_21577 ?auto_21590 ) ) ( not ( = ?auto_21579 ?auto_21590 ) ) ( not ( = ?auto_21583 ?auto_21597 ) ) ( IS-CRATE ?auto_21577 ) ( AVAILABLE ?auto_21592 ) ( SURFACE-AT ?auto_21577 ?auto_21591 ) ( ON ?auto_21577 ?auto_21602 ) ( CLEAR ?auto_21577 ) ( not ( = ?auto_21576 ?auto_21577 ) ) ( not ( = ?auto_21576 ?auto_21602 ) ) ( not ( = ?auto_21577 ?auto_21602 ) ) ( IS-CRATE ?auto_21576 ) ( not ( = ?auto_21603 ?auto_21587 ) ) ( HOIST-AT ?auto_21594 ?auto_21603 ) ( SURFACE-AT ?auto_21576 ?auto_21603 ) ( ON ?auto_21576 ?auto_21598 ) ( CLEAR ?auto_21576 ) ( not ( = ?auto_21575 ?auto_21576 ) ) ( not ( = ?auto_21575 ?auto_21598 ) ) ( not ( = ?auto_21576 ?auto_21598 ) ) ( not ( = ?auto_21583 ?auto_21594 ) ) ( IS-CRATE ?auto_21575 ) ( AVAILABLE ?auto_21594 ) ( SURFACE-AT ?auto_21575 ?auto_21603 ) ( ON ?auto_21575 ?auto_21596 ) ( CLEAR ?auto_21575 ) ( not ( = ?auto_21574 ?auto_21575 ) ) ( not ( = ?auto_21574 ?auto_21596 ) ) ( not ( = ?auto_21575 ?auto_21596 ) ) ( SURFACE-AT ?auto_21573 ?auto_21587 ) ( CLEAR ?auto_21573 ) ( IS-CRATE ?auto_21574 ) ( AVAILABLE ?auto_21583 ) ( not ( = ?auto_21599 ?auto_21587 ) ) ( HOIST-AT ?auto_21604 ?auto_21599 ) ( AVAILABLE ?auto_21604 ) ( SURFACE-AT ?auto_21574 ?auto_21599 ) ( ON ?auto_21574 ?auto_21593 ) ( CLEAR ?auto_21574 ) ( TRUCK-AT ?auto_21582 ?auto_21587 ) ( not ( = ?auto_21573 ?auto_21574 ) ) ( not ( = ?auto_21573 ?auto_21593 ) ) ( not ( = ?auto_21574 ?auto_21593 ) ) ( not ( = ?auto_21583 ?auto_21604 ) ) ( not ( = ?auto_21573 ?auto_21575 ) ) ( not ( = ?auto_21573 ?auto_21596 ) ) ( not ( = ?auto_21575 ?auto_21593 ) ) ( not ( = ?auto_21603 ?auto_21599 ) ) ( not ( = ?auto_21594 ?auto_21604 ) ) ( not ( = ?auto_21596 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21576 ) ) ( not ( = ?auto_21573 ?auto_21598 ) ) ( not ( = ?auto_21574 ?auto_21576 ) ) ( not ( = ?auto_21574 ?auto_21598 ) ) ( not ( = ?auto_21576 ?auto_21596 ) ) ( not ( = ?auto_21576 ?auto_21593 ) ) ( not ( = ?auto_21598 ?auto_21596 ) ) ( not ( = ?auto_21598 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21577 ) ) ( not ( = ?auto_21573 ?auto_21602 ) ) ( not ( = ?auto_21574 ?auto_21577 ) ) ( not ( = ?auto_21574 ?auto_21602 ) ) ( not ( = ?auto_21575 ?auto_21577 ) ) ( not ( = ?auto_21575 ?auto_21602 ) ) ( not ( = ?auto_21577 ?auto_21598 ) ) ( not ( = ?auto_21577 ?auto_21596 ) ) ( not ( = ?auto_21577 ?auto_21593 ) ) ( not ( = ?auto_21591 ?auto_21603 ) ) ( not ( = ?auto_21591 ?auto_21599 ) ) ( not ( = ?auto_21592 ?auto_21594 ) ) ( not ( = ?auto_21592 ?auto_21604 ) ) ( not ( = ?auto_21602 ?auto_21598 ) ) ( not ( = ?auto_21602 ?auto_21596 ) ) ( not ( = ?auto_21602 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21579 ) ) ( not ( = ?auto_21573 ?auto_21590 ) ) ( not ( = ?auto_21574 ?auto_21579 ) ) ( not ( = ?auto_21574 ?auto_21590 ) ) ( not ( = ?auto_21575 ?auto_21579 ) ) ( not ( = ?auto_21575 ?auto_21590 ) ) ( not ( = ?auto_21576 ?auto_21579 ) ) ( not ( = ?auto_21576 ?auto_21590 ) ) ( not ( = ?auto_21579 ?auto_21602 ) ) ( not ( = ?auto_21579 ?auto_21598 ) ) ( not ( = ?auto_21579 ?auto_21596 ) ) ( not ( = ?auto_21579 ?auto_21593 ) ) ( not ( = ?auto_21595 ?auto_21591 ) ) ( not ( = ?auto_21595 ?auto_21603 ) ) ( not ( = ?auto_21595 ?auto_21599 ) ) ( not ( = ?auto_21597 ?auto_21592 ) ) ( not ( = ?auto_21597 ?auto_21594 ) ) ( not ( = ?auto_21597 ?auto_21604 ) ) ( not ( = ?auto_21590 ?auto_21602 ) ) ( not ( = ?auto_21590 ?auto_21598 ) ) ( not ( = ?auto_21590 ?auto_21596 ) ) ( not ( = ?auto_21590 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21578 ) ) ( not ( = ?auto_21573 ?auto_21601 ) ) ( not ( = ?auto_21574 ?auto_21578 ) ) ( not ( = ?auto_21574 ?auto_21601 ) ) ( not ( = ?auto_21575 ?auto_21578 ) ) ( not ( = ?auto_21575 ?auto_21601 ) ) ( not ( = ?auto_21576 ?auto_21578 ) ) ( not ( = ?auto_21576 ?auto_21601 ) ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( not ( = ?auto_21577 ?auto_21601 ) ) ( not ( = ?auto_21578 ?auto_21590 ) ) ( not ( = ?auto_21578 ?auto_21602 ) ) ( not ( = ?auto_21578 ?auto_21598 ) ) ( not ( = ?auto_21578 ?auto_21596 ) ) ( not ( = ?auto_21578 ?auto_21593 ) ) ( not ( = ?auto_21601 ?auto_21590 ) ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21601 ?auto_21598 ) ) ( not ( = ?auto_21601 ?auto_21596 ) ) ( not ( = ?auto_21601 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21581 ) ) ( not ( = ?auto_21573 ?auto_21588 ) ) ( not ( = ?auto_21574 ?auto_21581 ) ) ( not ( = ?auto_21574 ?auto_21588 ) ) ( not ( = ?auto_21575 ?auto_21581 ) ) ( not ( = ?auto_21575 ?auto_21588 ) ) ( not ( = ?auto_21576 ?auto_21581 ) ) ( not ( = ?auto_21576 ?auto_21588 ) ) ( not ( = ?auto_21577 ?auto_21581 ) ) ( not ( = ?auto_21577 ?auto_21588 ) ) ( not ( = ?auto_21579 ?auto_21581 ) ) ( not ( = ?auto_21579 ?auto_21588 ) ) ( not ( = ?auto_21581 ?auto_21601 ) ) ( not ( = ?auto_21581 ?auto_21590 ) ) ( not ( = ?auto_21581 ?auto_21602 ) ) ( not ( = ?auto_21581 ?auto_21598 ) ) ( not ( = ?auto_21581 ?auto_21596 ) ) ( not ( = ?auto_21581 ?auto_21593 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21595 ) ) ( not ( = ?auto_21589 ?auto_21603 ) ) ( not ( = ?auto_21589 ?auto_21599 ) ) ( not ( = ?auto_21600 ?auto_21592 ) ) ( not ( = ?auto_21600 ?auto_21597 ) ) ( not ( = ?auto_21600 ?auto_21594 ) ) ( not ( = ?auto_21600 ?auto_21604 ) ) ( not ( = ?auto_21588 ?auto_21601 ) ) ( not ( = ?auto_21588 ?auto_21590 ) ) ( not ( = ?auto_21588 ?auto_21602 ) ) ( not ( = ?auto_21588 ?auto_21598 ) ) ( not ( = ?auto_21588 ?auto_21596 ) ) ( not ( = ?auto_21588 ?auto_21593 ) ) ( not ( = ?auto_21573 ?auto_21580 ) ) ( not ( = ?auto_21573 ?auto_21584 ) ) ( not ( = ?auto_21574 ?auto_21580 ) ) ( not ( = ?auto_21574 ?auto_21584 ) ) ( not ( = ?auto_21575 ?auto_21580 ) ) ( not ( = ?auto_21575 ?auto_21584 ) ) ( not ( = ?auto_21576 ?auto_21580 ) ) ( not ( = ?auto_21576 ?auto_21584 ) ) ( not ( = ?auto_21577 ?auto_21580 ) ) ( not ( = ?auto_21577 ?auto_21584 ) ) ( not ( = ?auto_21579 ?auto_21580 ) ) ( not ( = ?auto_21579 ?auto_21584 ) ) ( not ( = ?auto_21578 ?auto_21580 ) ) ( not ( = ?auto_21578 ?auto_21584 ) ) ( not ( = ?auto_21580 ?auto_21588 ) ) ( not ( = ?auto_21580 ?auto_21601 ) ) ( not ( = ?auto_21580 ?auto_21590 ) ) ( not ( = ?auto_21580 ?auto_21602 ) ) ( not ( = ?auto_21580 ?auto_21598 ) ) ( not ( = ?auto_21580 ?auto_21596 ) ) ( not ( = ?auto_21580 ?auto_21593 ) ) ( not ( = ?auto_21585 ?auto_21589 ) ) ( not ( = ?auto_21585 ?auto_21591 ) ) ( not ( = ?auto_21585 ?auto_21595 ) ) ( not ( = ?auto_21585 ?auto_21603 ) ) ( not ( = ?auto_21585 ?auto_21599 ) ) ( not ( = ?auto_21586 ?auto_21600 ) ) ( not ( = ?auto_21586 ?auto_21592 ) ) ( not ( = ?auto_21586 ?auto_21597 ) ) ( not ( = ?auto_21586 ?auto_21594 ) ) ( not ( = ?auto_21586 ?auto_21604 ) ) ( not ( = ?auto_21584 ?auto_21588 ) ) ( not ( = ?auto_21584 ?auto_21601 ) ) ( not ( = ?auto_21584 ?auto_21590 ) ) ( not ( = ?auto_21584 ?auto_21602 ) ) ( not ( = ?auto_21584 ?auto_21598 ) ) ( not ( = ?auto_21584 ?auto_21596 ) ) ( not ( = ?auto_21584 ?auto_21593 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21573 ?auto_21574 ?auto_21575 ?auto_21576 ?auto_21577 ?auto_21579 ?auto_21578 ?auto_21581 )
      ( MAKE-1CRATE ?auto_21581 ?auto_21580 )
      ( MAKE-8CRATE-VERIFY ?auto_21573 ?auto_21574 ?auto_21575 ?auto_21576 ?auto_21577 ?auto_21579 ?auto_21578 ?auto_21581 ?auto_21580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21607 - SURFACE
      ?auto_21608 - SURFACE
    )
    :vars
    (
      ?auto_21609 - HOIST
      ?auto_21610 - PLACE
      ?auto_21612 - PLACE
      ?auto_21613 - HOIST
      ?auto_21614 - SURFACE
      ?auto_21611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21609 ?auto_21610 ) ( SURFACE-AT ?auto_21607 ?auto_21610 ) ( CLEAR ?auto_21607 ) ( IS-CRATE ?auto_21608 ) ( AVAILABLE ?auto_21609 ) ( not ( = ?auto_21612 ?auto_21610 ) ) ( HOIST-AT ?auto_21613 ?auto_21612 ) ( AVAILABLE ?auto_21613 ) ( SURFACE-AT ?auto_21608 ?auto_21612 ) ( ON ?auto_21608 ?auto_21614 ) ( CLEAR ?auto_21608 ) ( TRUCK-AT ?auto_21611 ?auto_21610 ) ( not ( = ?auto_21607 ?auto_21608 ) ) ( not ( = ?auto_21607 ?auto_21614 ) ) ( not ( = ?auto_21608 ?auto_21614 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21611 ?auto_21610 ?auto_21612 )
      ( !LIFT ?auto_21613 ?auto_21608 ?auto_21614 ?auto_21612 )
      ( !LOAD ?auto_21613 ?auto_21608 ?auto_21611 ?auto_21612 )
      ( !DRIVE ?auto_21611 ?auto_21612 ?auto_21610 )
      ( !UNLOAD ?auto_21609 ?auto_21608 ?auto_21611 ?auto_21610 )
      ( !DROP ?auto_21609 ?auto_21608 ?auto_21607 ?auto_21610 )
      ( MAKE-1CRATE-VERIFY ?auto_21607 ?auto_21608 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_21625 - SURFACE
      ?auto_21626 - SURFACE
      ?auto_21627 - SURFACE
      ?auto_21628 - SURFACE
      ?auto_21629 - SURFACE
      ?auto_21632 - SURFACE
      ?auto_21630 - SURFACE
      ?auto_21634 - SURFACE
      ?auto_21633 - SURFACE
      ?auto_21631 - SURFACE
    )
    :vars
    (
      ?auto_21639 - HOIST
      ?auto_21640 - PLACE
      ?auto_21637 - PLACE
      ?auto_21638 - HOIST
      ?auto_21635 - SURFACE
      ?auto_21643 - PLACE
      ?auto_21641 - HOIST
      ?auto_21644 - SURFACE
      ?auto_21642 - PLACE
      ?auto_21655 - HOIST
      ?auto_21646 - SURFACE
      ?auto_21645 - PLACE
      ?auto_21660 - HOIST
      ?auto_21656 - SURFACE
      ?auto_21657 - PLACE
      ?auto_21651 - HOIST
      ?auto_21654 - SURFACE
      ?auto_21653 - SURFACE
      ?auto_21648 - PLACE
      ?auto_21658 - HOIST
      ?auto_21650 - SURFACE
      ?auto_21649 - SURFACE
      ?auto_21652 - PLACE
      ?auto_21647 - HOIST
      ?auto_21659 - SURFACE
      ?auto_21636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21639 ?auto_21640 ) ( IS-CRATE ?auto_21631 ) ( not ( = ?auto_21637 ?auto_21640 ) ) ( HOIST-AT ?auto_21638 ?auto_21637 ) ( AVAILABLE ?auto_21638 ) ( SURFACE-AT ?auto_21631 ?auto_21637 ) ( ON ?auto_21631 ?auto_21635 ) ( CLEAR ?auto_21631 ) ( not ( = ?auto_21633 ?auto_21631 ) ) ( not ( = ?auto_21633 ?auto_21635 ) ) ( not ( = ?auto_21631 ?auto_21635 ) ) ( not ( = ?auto_21639 ?auto_21638 ) ) ( IS-CRATE ?auto_21633 ) ( not ( = ?auto_21643 ?auto_21640 ) ) ( HOIST-AT ?auto_21641 ?auto_21643 ) ( AVAILABLE ?auto_21641 ) ( SURFACE-AT ?auto_21633 ?auto_21643 ) ( ON ?auto_21633 ?auto_21644 ) ( CLEAR ?auto_21633 ) ( not ( = ?auto_21634 ?auto_21633 ) ) ( not ( = ?auto_21634 ?auto_21644 ) ) ( not ( = ?auto_21633 ?auto_21644 ) ) ( not ( = ?auto_21639 ?auto_21641 ) ) ( IS-CRATE ?auto_21634 ) ( not ( = ?auto_21642 ?auto_21640 ) ) ( HOIST-AT ?auto_21655 ?auto_21642 ) ( AVAILABLE ?auto_21655 ) ( SURFACE-AT ?auto_21634 ?auto_21642 ) ( ON ?auto_21634 ?auto_21646 ) ( CLEAR ?auto_21634 ) ( not ( = ?auto_21630 ?auto_21634 ) ) ( not ( = ?auto_21630 ?auto_21646 ) ) ( not ( = ?auto_21634 ?auto_21646 ) ) ( not ( = ?auto_21639 ?auto_21655 ) ) ( IS-CRATE ?auto_21630 ) ( not ( = ?auto_21645 ?auto_21640 ) ) ( HOIST-AT ?auto_21660 ?auto_21645 ) ( SURFACE-AT ?auto_21630 ?auto_21645 ) ( ON ?auto_21630 ?auto_21656 ) ( CLEAR ?auto_21630 ) ( not ( = ?auto_21632 ?auto_21630 ) ) ( not ( = ?auto_21632 ?auto_21656 ) ) ( not ( = ?auto_21630 ?auto_21656 ) ) ( not ( = ?auto_21639 ?auto_21660 ) ) ( IS-CRATE ?auto_21632 ) ( not ( = ?auto_21657 ?auto_21640 ) ) ( HOIST-AT ?auto_21651 ?auto_21657 ) ( AVAILABLE ?auto_21651 ) ( SURFACE-AT ?auto_21632 ?auto_21657 ) ( ON ?auto_21632 ?auto_21654 ) ( CLEAR ?auto_21632 ) ( not ( = ?auto_21629 ?auto_21632 ) ) ( not ( = ?auto_21629 ?auto_21654 ) ) ( not ( = ?auto_21632 ?auto_21654 ) ) ( not ( = ?auto_21639 ?auto_21651 ) ) ( IS-CRATE ?auto_21629 ) ( AVAILABLE ?auto_21660 ) ( SURFACE-AT ?auto_21629 ?auto_21645 ) ( ON ?auto_21629 ?auto_21653 ) ( CLEAR ?auto_21629 ) ( not ( = ?auto_21628 ?auto_21629 ) ) ( not ( = ?auto_21628 ?auto_21653 ) ) ( not ( = ?auto_21629 ?auto_21653 ) ) ( IS-CRATE ?auto_21628 ) ( not ( = ?auto_21648 ?auto_21640 ) ) ( HOIST-AT ?auto_21658 ?auto_21648 ) ( SURFACE-AT ?auto_21628 ?auto_21648 ) ( ON ?auto_21628 ?auto_21650 ) ( CLEAR ?auto_21628 ) ( not ( = ?auto_21627 ?auto_21628 ) ) ( not ( = ?auto_21627 ?auto_21650 ) ) ( not ( = ?auto_21628 ?auto_21650 ) ) ( not ( = ?auto_21639 ?auto_21658 ) ) ( IS-CRATE ?auto_21627 ) ( AVAILABLE ?auto_21658 ) ( SURFACE-AT ?auto_21627 ?auto_21648 ) ( ON ?auto_21627 ?auto_21649 ) ( CLEAR ?auto_21627 ) ( not ( = ?auto_21626 ?auto_21627 ) ) ( not ( = ?auto_21626 ?auto_21649 ) ) ( not ( = ?auto_21627 ?auto_21649 ) ) ( SURFACE-AT ?auto_21625 ?auto_21640 ) ( CLEAR ?auto_21625 ) ( IS-CRATE ?auto_21626 ) ( AVAILABLE ?auto_21639 ) ( not ( = ?auto_21652 ?auto_21640 ) ) ( HOIST-AT ?auto_21647 ?auto_21652 ) ( AVAILABLE ?auto_21647 ) ( SURFACE-AT ?auto_21626 ?auto_21652 ) ( ON ?auto_21626 ?auto_21659 ) ( CLEAR ?auto_21626 ) ( TRUCK-AT ?auto_21636 ?auto_21640 ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21659 ) ) ( not ( = ?auto_21626 ?auto_21659 ) ) ( not ( = ?auto_21639 ?auto_21647 ) ) ( not ( = ?auto_21625 ?auto_21627 ) ) ( not ( = ?auto_21625 ?auto_21649 ) ) ( not ( = ?auto_21627 ?auto_21659 ) ) ( not ( = ?auto_21648 ?auto_21652 ) ) ( not ( = ?auto_21658 ?auto_21647 ) ) ( not ( = ?auto_21649 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21628 ) ) ( not ( = ?auto_21625 ?auto_21650 ) ) ( not ( = ?auto_21626 ?auto_21628 ) ) ( not ( = ?auto_21626 ?auto_21650 ) ) ( not ( = ?auto_21628 ?auto_21649 ) ) ( not ( = ?auto_21628 ?auto_21659 ) ) ( not ( = ?auto_21650 ?auto_21649 ) ) ( not ( = ?auto_21650 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21629 ) ) ( not ( = ?auto_21625 ?auto_21653 ) ) ( not ( = ?auto_21626 ?auto_21629 ) ) ( not ( = ?auto_21626 ?auto_21653 ) ) ( not ( = ?auto_21627 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21653 ) ) ( not ( = ?auto_21629 ?auto_21650 ) ) ( not ( = ?auto_21629 ?auto_21649 ) ) ( not ( = ?auto_21629 ?auto_21659 ) ) ( not ( = ?auto_21645 ?auto_21648 ) ) ( not ( = ?auto_21645 ?auto_21652 ) ) ( not ( = ?auto_21660 ?auto_21658 ) ) ( not ( = ?auto_21660 ?auto_21647 ) ) ( not ( = ?auto_21653 ?auto_21650 ) ) ( not ( = ?auto_21653 ?auto_21649 ) ) ( not ( = ?auto_21653 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21632 ) ) ( not ( = ?auto_21625 ?auto_21654 ) ) ( not ( = ?auto_21626 ?auto_21632 ) ) ( not ( = ?auto_21626 ?auto_21654 ) ) ( not ( = ?auto_21627 ?auto_21632 ) ) ( not ( = ?auto_21627 ?auto_21654 ) ) ( not ( = ?auto_21628 ?auto_21632 ) ) ( not ( = ?auto_21628 ?auto_21654 ) ) ( not ( = ?auto_21632 ?auto_21653 ) ) ( not ( = ?auto_21632 ?auto_21650 ) ) ( not ( = ?auto_21632 ?auto_21649 ) ) ( not ( = ?auto_21632 ?auto_21659 ) ) ( not ( = ?auto_21657 ?auto_21645 ) ) ( not ( = ?auto_21657 ?auto_21648 ) ) ( not ( = ?auto_21657 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21660 ) ) ( not ( = ?auto_21651 ?auto_21658 ) ) ( not ( = ?auto_21651 ?auto_21647 ) ) ( not ( = ?auto_21654 ?auto_21653 ) ) ( not ( = ?auto_21654 ?auto_21650 ) ) ( not ( = ?auto_21654 ?auto_21649 ) ) ( not ( = ?auto_21654 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21630 ) ) ( not ( = ?auto_21625 ?auto_21656 ) ) ( not ( = ?auto_21626 ?auto_21630 ) ) ( not ( = ?auto_21626 ?auto_21656 ) ) ( not ( = ?auto_21627 ?auto_21630 ) ) ( not ( = ?auto_21627 ?auto_21656 ) ) ( not ( = ?auto_21628 ?auto_21630 ) ) ( not ( = ?auto_21628 ?auto_21656 ) ) ( not ( = ?auto_21629 ?auto_21630 ) ) ( not ( = ?auto_21629 ?auto_21656 ) ) ( not ( = ?auto_21630 ?auto_21654 ) ) ( not ( = ?auto_21630 ?auto_21653 ) ) ( not ( = ?auto_21630 ?auto_21650 ) ) ( not ( = ?auto_21630 ?auto_21649 ) ) ( not ( = ?auto_21630 ?auto_21659 ) ) ( not ( = ?auto_21656 ?auto_21654 ) ) ( not ( = ?auto_21656 ?auto_21653 ) ) ( not ( = ?auto_21656 ?auto_21650 ) ) ( not ( = ?auto_21656 ?auto_21649 ) ) ( not ( = ?auto_21656 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21634 ) ) ( not ( = ?auto_21625 ?auto_21646 ) ) ( not ( = ?auto_21626 ?auto_21634 ) ) ( not ( = ?auto_21626 ?auto_21646 ) ) ( not ( = ?auto_21627 ?auto_21634 ) ) ( not ( = ?auto_21627 ?auto_21646 ) ) ( not ( = ?auto_21628 ?auto_21634 ) ) ( not ( = ?auto_21628 ?auto_21646 ) ) ( not ( = ?auto_21629 ?auto_21634 ) ) ( not ( = ?auto_21629 ?auto_21646 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21646 ) ) ( not ( = ?auto_21634 ?auto_21656 ) ) ( not ( = ?auto_21634 ?auto_21654 ) ) ( not ( = ?auto_21634 ?auto_21653 ) ) ( not ( = ?auto_21634 ?auto_21650 ) ) ( not ( = ?auto_21634 ?auto_21649 ) ) ( not ( = ?auto_21634 ?auto_21659 ) ) ( not ( = ?auto_21642 ?auto_21645 ) ) ( not ( = ?auto_21642 ?auto_21657 ) ) ( not ( = ?auto_21642 ?auto_21648 ) ) ( not ( = ?auto_21642 ?auto_21652 ) ) ( not ( = ?auto_21655 ?auto_21660 ) ) ( not ( = ?auto_21655 ?auto_21651 ) ) ( not ( = ?auto_21655 ?auto_21658 ) ) ( not ( = ?auto_21655 ?auto_21647 ) ) ( not ( = ?auto_21646 ?auto_21656 ) ) ( not ( = ?auto_21646 ?auto_21654 ) ) ( not ( = ?auto_21646 ?auto_21653 ) ) ( not ( = ?auto_21646 ?auto_21650 ) ) ( not ( = ?auto_21646 ?auto_21649 ) ) ( not ( = ?auto_21646 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21633 ) ) ( not ( = ?auto_21625 ?auto_21644 ) ) ( not ( = ?auto_21626 ?auto_21633 ) ) ( not ( = ?auto_21626 ?auto_21644 ) ) ( not ( = ?auto_21627 ?auto_21633 ) ) ( not ( = ?auto_21627 ?auto_21644 ) ) ( not ( = ?auto_21628 ?auto_21633 ) ) ( not ( = ?auto_21628 ?auto_21644 ) ) ( not ( = ?auto_21629 ?auto_21633 ) ) ( not ( = ?auto_21629 ?auto_21644 ) ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21644 ) ) ( not ( = ?auto_21630 ?auto_21633 ) ) ( not ( = ?auto_21630 ?auto_21644 ) ) ( not ( = ?auto_21633 ?auto_21646 ) ) ( not ( = ?auto_21633 ?auto_21656 ) ) ( not ( = ?auto_21633 ?auto_21654 ) ) ( not ( = ?auto_21633 ?auto_21653 ) ) ( not ( = ?auto_21633 ?auto_21650 ) ) ( not ( = ?auto_21633 ?auto_21649 ) ) ( not ( = ?auto_21633 ?auto_21659 ) ) ( not ( = ?auto_21643 ?auto_21642 ) ) ( not ( = ?auto_21643 ?auto_21645 ) ) ( not ( = ?auto_21643 ?auto_21657 ) ) ( not ( = ?auto_21643 ?auto_21648 ) ) ( not ( = ?auto_21643 ?auto_21652 ) ) ( not ( = ?auto_21641 ?auto_21655 ) ) ( not ( = ?auto_21641 ?auto_21660 ) ) ( not ( = ?auto_21641 ?auto_21651 ) ) ( not ( = ?auto_21641 ?auto_21658 ) ) ( not ( = ?auto_21641 ?auto_21647 ) ) ( not ( = ?auto_21644 ?auto_21646 ) ) ( not ( = ?auto_21644 ?auto_21656 ) ) ( not ( = ?auto_21644 ?auto_21654 ) ) ( not ( = ?auto_21644 ?auto_21653 ) ) ( not ( = ?auto_21644 ?auto_21650 ) ) ( not ( = ?auto_21644 ?auto_21649 ) ) ( not ( = ?auto_21644 ?auto_21659 ) ) ( not ( = ?auto_21625 ?auto_21631 ) ) ( not ( = ?auto_21625 ?auto_21635 ) ) ( not ( = ?auto_21626 ?auto_21631 ) ) ( not ( = ?auto_21626 ?auto_21635 ) ) ( not ( = ?auto_21627 ?auto_21631 ) ) ( not ( = ?auto_21627 ?auto_21635 ) ) ( not ( = ?auto_21628 ?auto_21631 ) ) ( not ( = ?auto_21628 ?auto_21635 ) ) ( not ( = ?auto_21629 ?auto_21631 ) ) ( not ( = ?auto_21629 ?auto_21635 ) ) ( not ( = ?auto_21632 ?auto_21631 ) ) ( not ( = ?auto_21632 ?auto_21635 ) ) ( not ( = ?auto_21630 ?auto_21631 ) ) ( not ( = ?auto_21630 ?auto_21635 ) ) ( not ( = ?auto_21634 ?auto_21631 ) ) ( not ( = ?auto_21634 ?auto_21635 ) ) ( not ( = ?auto_21631 ?auto_21644 ) ) ( not ( = ?auto_21631 ?auto_21646 ) ) ( not ( = ?auto_21631 ?auto_21656 ) ) ( not ( = ?auto_21631 ?auto_21654 ) ) ( not ( = ?auto_21631 ?auto_21653 ) ) ( not ( = ?auto_21631 ?auto_21650 ) ) ( not ( = ?auto_21631 ?auto_21649 ) ) ( not ( = ?auto_21631 ?auto_21659 ) ) ( not ( = ?auto_21637 ?auto_21643 ) ) ( not ( = ?auto_21637 ?auto_21642 ) ) ( not ( = ?auto_21637 ?auto_21645 ) ) ( not ( = ?auto_21637 ?auto_21657 ) ) ( not ( = ?auto_21637 ?auto_21648 ) ) ( not ( = ?auto_21637 ?auto_21652 ) ) ( not ( = ?auto_21638 ?auto_21641 ) ) ( not ( = ?auto_21638 ?auto_21655 ) ) ( not ( = ?auto_21638 ?auto_21660 ) ) ( not ( = ?auto_21638 ?auto_21651 ) ) ( not ( = ?auto_21638 ?auto_21658 ) ) ( not ( = ?auto_21638 ?auto_21647 ) ) ( not ( = ?auto_21635 ?auto_21644 ) ) ( not ( = ?auto_21635 ?auto_21646 ) ) ( not ( = ?auto_21635 ?auto_21656 ) ) ( not ( = ?auto_21635 ?auto_21654 ) ) ( not ( = ?auto_21635 ?auto_21653 ) ) ( not ( = ?auto_21635 ?auto_21650 ) ) ( not ( = ?auto_21635 ?auto_21649 ) ) ( not ( = ?auto_21635 ?auto_21659 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21625 ?auto_21626 ?auto_21627 ?auto_21628 ?auto_21629 ?auto_21632 ?auto_21630 ?auto_21634 ?auto_21633 )
      ( MAKE-1CRATE ?auto_21633 ?auto_21631 )
      ( MAKE-9CRATE-VERIFY ?auto_21625 ?auto_21626 ?auto_21627 ?auto_21628 ?auto_21629 ?auto_21632 ?auto_21630 ?auto_21634 ?auto_21633 ?auto_21631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21663 - SURFACE
      ?auto_21664 - SURFACE
    )
    :vars
    (
      ?auto_21665 - HOIST
      ?auto_21666 - PLACE
      ?auto_21668 - PLACE
      ?auto_21669 - HOIST
      ?auto_21670 - SURFACE
      ?auto_21667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21665 ?auto_21666 ) ( SURFACE-AT ?auto_21663 ?auto_21666 ) ( CLEAR ?auto_21663 ) ( IS-CRATE ?auto_21664 ) ( AVAILABLE ?auto_21665 ) ( not ( = ?auto_21668 ?auto_21666 ) ) ( HOIST-AT ?auto_21669 ?auto_21668 ) ( AVAILABLE ?auto_21669 ) ( SURFACE-AT ?auto_21664 ?auto_21668 ) ( ON ?auto_21664 ?auto_21670 ) ( CLEAR ?auto_21664 ) ( TRUCK-AT ?auto_21667 ?auto_21666 ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21670 ) ) ( not ( = ?auto_21664 ?auto_21670 ) ) ( not ( = ?auto_21665 ?auto_21669 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21667 ?auto_21666 ?auto_21668 )
      ( !LIFT ?auto_21669 ?auto_21664 ?auto_21670 ?auto_21668 )
      ( !LOAD ?auto_21669 ?auto_21664 ?auto_21667 ?auto_21668 )
      ( !DRIVE ?auto_21667 ?auto_21668 ?auto_21666 )
      ( !UNLOAD ?auto_21665 ?auto_21664 ?auto_21667 ?auto_21666 )
      ( !DROP ?auto_21665 ?auto_21664 ?auto_21663 ?auto_21666 )
      ( MAKE-1CRATE-VERIFY ?auto_21663 ?auto_21664 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_21682 - SURFACE
      ?auto_21683 - SURFACE
      ?auto_21684 - SURFACE
      ?auto_21685 - SURFACE
      ?auto_21686 - SURFACE
      ?auto_21689 - SURFACE
      ?auto_21687 - SURFACE
      ?auto_21691 - SURFACE
      ?auto_21690 - SURFACE
      ?auto_21688 - SURFACE
      ?auto_21692 - SURFACE
    )
    :vars
    (
      ?auto_21697 - HOIST
      ?auto_21696 - PLACE
      ?auto_21698 - PLACE
      ?auto_21694 - HOIST
      ?auto_21693 - SURFACE
      ?auto_21716 - PLACE
      ?auto_21704 - HOIST
      ?auto_21701 - SURFACE
      ?auto_21699 - PLACE
      ?auto_21702 - HOIST
      ?auto_21715 - SURFACE
      ?auto_21703 - PLACE
      ?auto_21721 - HOIST
      ?auto_21705 - SURFACE
      ?auto_21706 - PLACE
      ?auto_21720 - HOIST
      ?auto_21712 - SURFACE
      ?auto_21719 - PLACE
      ?auto_21700 - HOIST
      ?auto_21709 - SURFACE
      ?auto_21713 - SURFACE
      ?auto_21710 - PLACE
      ?auto_21714 - HOIST
      ?auto_21708 - SURFACE
      ?auto_21707 - SURFACE
      ?auto_21711 - PLACE
      ?auto_21718 - HOIST
      ?auto_21717 - SURFACE
      ?auto_21695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21697 ?auto_21696 ) ( IS-CRATE ?auto_21692 ) ( not ( = ?auto_21698 ?auto_21696 ) ) ( HOIST-AT ?auto_21694 ?auto_21698 ) ( AVAILABLE ?auto_21694 ) ( SURFACE-AT ?auto_21692 ?auto_21698 ) ( ON ?auto_21692 ?auto_21693 ) ( CLEAR ?auto_21692 ) ( not ( = ?auto_21688 ?auto_21692 ) ) ( not ( = ?auto_21688 ?auto_21693 ) ) ( not ( = ?auto_21692 ?auto_21693 ) ) ( not ( = ?auto_21697 ?auto_21694 ) ) ( IS-CRATE ?auto_21688 ) ( not ( = ?auto_21716 ?auto_21696 ) ) ( HOIST-AT ?auto_21704 ?auto_21716 ) ( AVAILABLE ?auto_21704 ) ( SURFACE-AT ?auto_21688 ?auto_21716 ) ( ON ?auto_21688 ?auto_21701 ) ( CLEAR ?auto_21688 ) ( not ( = ?auto_21690 ?auto_21688 ) ) ( not ( = ?auto_21690 ?auto_21701 ) ) ( not ( = ?auto_21688 ?auto_21701 ) ) ( not ( = ?auto_21697 ?auto_21704 ) ) ( IS-CRATE ?auto_21690 ) ( not ( = ?auto_21699 ?auto_21696 ) ) ( HOIST-AT ?auto_21702 ?auto_21699 ) ( AVAILABLE ?auto_21702 ) ( SURFACE-AT ?auto_21690 ?auto_21699 ) ( ON ?auto_21690 ?auto_21715 ) ( CLEAR ?auto_21690 ) ( not ( = ?auto_21691 ?auto_21690 ) ) ( not ( = ?auto_21691 ?auto_21715 ) ) ( not ( = ?auto_21690 ?auto_21715 ) ) ( not ( = ?auto_21697 ?auto_21702 ) ) ( IS-CRATE ?auto_21691 ) ( not ( = ?auto_21703 ?auto_21696 ) ) ( HOIST-AT ?auto_21721 ?auto_21703 ) ( AVAILABLE ?auto_21721 ) ( SURFACE-AT ?auto_21691 ?auto_21703 ) ( ON ?auto_21691 ?auto_21705 ) ( CLEAR ?auto_21691 ) ( not ( = ?auto_21687 ?auto_21691 ) ) ( not ( = ?auto_21687 ?auto_21705 ) ) ( not ( = ?auto_21691 ?auto_21705 ) ) ( not ( = ?auto_21697 ?auto_21721 ) ) ( IS-CRATE ?auto_21687 ) ( not ( = ?auto_21706 ?auto_21696 ) ) ( HOIST-AT ?auto_21720 ?auto_21706 ) ( SURFACE-AT ?auto_21687 ?auto_21706 ) ( ON ?auto_21687 ?auto_21712 ) ( CLEAR ?auto_21687 ) ( not ( = ?auto_21689 ?auto_21687 ) ) ( not ( = ?auto_21689 ?auto_21712 ) ) ( not ( = ?auto_21687 ?auto_21712 ) ) ( not ( = ?auto_21697 ?auto_21720 ) ) ( IS-CRATE ?auto_21689 ) ( not ( = ?auto_21719 ?auto_21696 ) ) ( HOIST-AT ?auto_21700 ?auto_21719 ) ( AVAILABLE ?auto_21700 ) ( SURFACE-AT ?auto_21689 ?auto_21719 ) ( ON ?auto_21689 ?auto_21709 ) ( CLEAR ?auto_21689 ) ( not ( = ?auto_21686 ?auto_21689 ) ) ( not ( = ?auto_21686 ?auto_21709 ) ) ( not ( = ?auto_21689 ?auto_21709 ) ) ( not ( = ?auto_21697 ?auto_21700 ) ) ( IS-CRATE ?auto_21686 ) ( AVAILABLE ?auto_21720 ) ( SURFACE-AT ?auto_21686 ?auto_21706 ) ( ON ?auto_21686 ?auto_21713 ) ( CLEAR ?auto_21686 ) ( not ( = ?auto_21685 ?auto_21686 ) ) ( not ( = ?auto_21685 ?auto_21713 ) ) ( not ( = ?auto_21686 ?auto_21713 ) ) ( IS-CRATE ?auto_21685 ) ( not ( = ?auto_21710 ?auto_21696 ) ) ( HOIST-AT ?auto_21714 ?auto_21710 ) ( SURFACE-AT ?auto_21685 ?auto_21710 ) ( ON ?auto_21685 ?auto_21708 ) ( CLEAR ?auto_21685 ) ( not ( = ?auto_21684 ?auto_21685 ) ) ( not ( = ?auto_21684 ?auto_21708 ) ) ( not ( = ?auto_21685 ?auto_21708 ) ) ( not ( = ?auto_21697 ?auto_21714 ) ) ( IS-CRATE ?auto_21684 ) ( AVAILABLE ?auto_21714 ) ( SURFACE-AT ?auto_21684 ?auto_21710 ) ( ON ?auto_21684 ?auto_21707 ) ( CLEAR ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21683 ?auto_21707 ) ) ( not ( = ?auto_21684 ?auto_21707 ) ) ( SURFACE-AT ?auto_21682 ?auto_21696 ) ( CLEAR ?auto_21682 ) ( IS-CRATE ?auto_21683 ) ( AVAILABLE ?auto_21697 ) ( not ( = ?auto_21711 ?auto_21696 ) ) ( HOIST-AT ?auto_21718 ?auto_21711 ) ( AVAILABLE ?auto_21718 ) ( SURFACE-AT ?auto_21683 ?auto_21711 ) ( ON ?auto_21683 ?auto_21717 ) ( CLEAR ?auto_21683 ) ( TRUCK-AT ?auto_21695 ?auto_21696 ) ( not ( = ?auto_21682 ?auto_21683 ) ) ( not ( = ?auto_21682 ?auto_21717 ) ) ( not ( = ?auto_21683 ?auto_21717 ) ) ( not ( = ?auto_21697 ?auto_21718 ) ) ( not ( = ?auto_21682 ?auto_21684 ) ) ( not ( = ?auto_21682 ?auto_21707 ) ) ( not ( = ?auto_21684 ?auto_21717 ) ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21714 ?auto_21718 ) ) ( not ( = ?auto_21707 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21685 ) ) ( not ( = ?auto_21682 ?auto_21708 ) ) ( not ( = ?auto_21683 ?auto_21685 ) ) ( not ( = ?auto_21683 ?auto_21708 ) ) ( not ( = ?auto_21685 ?auto_21707 ) ) ( not ( = ?auto_21685 ?auto_21717 ) ) ( not ( = ?auto_21708 ?auto_21707 ) ) ( not ( = ?auto_21708 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21686 ) ) ( not ( = ?auto_21682 ?auto_21713 ) ) ( not ( = ?auto_21683 ?auto_21686 ) ) ( not ( = ?auto_21683 ?auto_21713 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21713 ) ) ( not ( = ?auto_21686 ?auto_21708 ) ) ( not ( = ?auto_21686 ?auto_21707 ) ) ( not ( = ?auto_21686 ?auto_21717 ) ) ( not ( = ?auto_21706 ?auto_21710 ) ) ( not ( = ?auto_21706 ?auto_21711 ) ) ( not ( = ?auto_21720 ?auto_21714 ) ) ( not ( = ?auto_21720 ?auto_21718 ) ) ( not ( = ?auto_21713 ?auto_21708 ) ) ( not ( = ?auto_21713 ?auto_21707 ) ) ( not ( = ?auto_21713 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21689 ) ) ( not ( = ?auto_21682 ?auto_21709 ) ) ( not ( = ?auto_21683 ?auto_21689 ) ) ( not ( = ?auto_21683 ?auto_21709 ) ) ( not ( = ?auto_21684 ?auto_21689 ) ) ( not ( = ?auto_21684 ?auto_21709 ) ) ( not ( = ?auto_21685 ?auto_21689 ) ) ( not ( = ?auto_21685 ?auto_21709 ) ) ( not ( = ?auto_21689 ?auto_21713 ) ) ( not ( = ?auto_21689 ?auto_21708 ) ) ( not ( = ?auto_21689 ?auto_21707 ) ) ( not ( = ?auto_21689 ?auto_21717 ) ) ( not ( = ?auto_21719 ?auto_21706 ) ) ( not ( = ?auto_21719 ?auto_21710 ) ) ( not ( = ?auto_21719 ?auto_21711 ) ) ( not ( = ?auto_21700 ?auto_21720 ) ) ( not ( = ?auto_21700 ?auto_21714 ) ) ( not ( = ?auto_21700 ?auto_21718 ) ) ( not ( = ?auto_21709 ?auto_21713 ) ) ( not ( = ?auto_21709 ?auto_21708 ) ) ( not ( = ?auto_21709 ?auto_21707 ) ) ( not ( = ?auto_21709 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21687 ) ) ( not ( = ?auto_21682 ?auto_21712 ) ) ( not ( = ?auto_21683 ?auto_21687 ) ) ( not ( = ?auto_21683 ?auto_21712 ) ) ( not ( = ?auto_21684 ?auto_21687 ) ) ( not ( = ?auto_21684 ?auto_21712 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21712 ) ) ( not ( = ?auto_21686 ?auto_21687 ) ) ( not ( = ?auto_21686 ?auto_21712 ) ) ( not ( = ?auto_21687 ?auto_21709 ) ) ( not ( = ?auto_21687 ?auto_21713 ) ) ( not ( = ?auto_21687 ?auto_21708 ) ) ( not ( = ?auto_21687 ?auto_21707 ) ) ( not ( = ?auto_21687 ?auto_21717 ) ) ( not ( = ?auto_21712 ?auto_21709 ) ) ( not ( = ?auto_21712 ?auto_21713 ) ) ( not ( = ?auto_21712 ?auto_21708 ) ) ( not ( = ?auto_21712 ?auto_21707 ) ) ( not ( = ?auto_21712 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21691 ) ) ( not ( = ?auto_21682 ?auto_21705 ) ) ( not ( = ?auto_21683 ?auto_21691 ) ) ( not ( = ?auto_21683 ?auto_21705 ) ) ( not ( = ?auto_21684 ?auto_21691 ) ) ( not ( = ?auto_21684 ?auto_21705 ) ) ( not ( = ?auto_21685 ?auto_21691 ) ) ( not ( = ?auto_21685 ?auto_21705 ) ) ( not ( = ?auto_21686 ?auto_21691 ) ) ( not ( = ?auto_21686 ?auto_21705 ) ) ( not ( = ?auto_21689 ?auto_21691 ) ) ( not ( = ?auto_21689 ?auto_21705 ) ) ( not ( = ?auto_21691 ?auto_21712 ) ) ( not ( = ?auto_21691 ?auto_21709 ) ) ( not ( = ?auto_21691 ?auto_21713 ) ) ( not ( = ?auto_21691 ?auto_21708 ) ) ( not ( = ?auto_21691 ?auto_21707 ) ) ( not ( = ?auto_21691 ?auto_21717 ) ) ( not ( = ?auto_21703 ?auto_21706 ) ) ( not ( = ?auto_21703 ?auto_21719 ) ) ( not ( = ?auto_21703 ?auto_21710 ) ) ( not ( = ?auto_21703 ?auto_21711 ) ) ( not ( = ?auto_21721 ?auto_21720 ) ) ( not ( = ?auto_21721 ?auto_21700 ) ) ( not ( = ?auto_21721 ?auto_21714 ) ) ( not ( = ?auto_21721 ?auto_21718 ) ) ( not ( = ?auto_21705 ?auto_21712 ) ) ( not ( = ?auto_21705 ?auto_21709 ) ) ( not ( = ?auto_21705 ?auto_21713 ) ) ( not ( = ?auto_21705 ?auto_21708 ) ) ( not ( = ?auto_21705 ?auto_21707 ) ) ( not ( = ?auto_21705 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21690 ) ) ( not ( = ?auto_21682 ?auto_21715 ) ) ( not ( = ?auto_21683 ?auto_21690 ) ) ( not ( = ?auto_21683 ?auto_21715 ) ) ( not ( = ?auto_21684 ?auto_21690 ) ) ( not ( = ?auto_21684 ?auto_21715 ) ) ( not ( = ?auto_21685 ?auto_21690 ) ) ( not ( = ?auto_21685 ?auto_21715 ) ) ( not ( = ?auto_21686 ?auto_21690 ) ) ( not ( = ?auto_21686 ?auto_21715 ) ) ( not ( = ?auto_21689 ?auto_21690 ) ) ( not ( = ?auto_21689 ?auto_21715 ) ) ( not ( = ?auto_21687 ?auto_21690 ) ) ( not ( = ?auto_21687 ?auto_21715 ) ) ( not ( = ?auto_21690 ?auto_21705 ) ) ( not ( = ?auto_21690 ?auto_21712 ) ) ( not ( = ?auto_21690 ?auto_21709 ) ) ( not ( = ?auto_21690 ?auto_21713 ) ) ( not ( = ?auto_21690 ?auto_21708 ) ) ( not ( = ?auto_21690 ?auto_21707 ) ) ( not ( = ?auto_21690 ?auto_21717 ) ) ( not ( = ?auto_21699 ?auto_21703 ) ) ( not ( = ?auto_21699 ?auto_21706 ) ) ( not ( = ?auto_21699 ?auto_21719 ) ) ( not ( = ?auto_21699 ?auto_21710 ) ) ( not ( = ?auto_21699 ?auto_21711 ) ) ( not ( = ?auto_21702 ?auto_21721 ) ) ( not ( = ?auto_21702 ?auto_21720 ) ) ( not ( = ?auto_21702 ?auto_21700 ) ) ( not ( = ?auto_21702 ?auto_21714 ) ) ( not ( = ?auto_21702 ?auto_21718 ) ) ( not ( = ?auto_21715 ?auto_21705 ) ) ( not ( = ?auto_21715 ?auto_21712 ) ) ( not ( = ?auto_21715 ?auto_21709 ) ) ( not ( = ?auto_21715 ?auto_21713 ) ) ( not ( = ?auto_21715 ?auto_21708 ) ) ( not ( = ?auto_21715 ?auto_21707 ) ) ( not ( = ?auto_21715 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21688 ) ) ( not ( = ?auto_21682 ?auto_21701 ) ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21683 ?auto_21701 ) ) ( not ( = ?auto_21684 ?auto_21688 ) ) ( not ( = ?auto_21684 ?auto_21701 ) ) ( not ( = ?auto_21685 ?auto_21688 ) ) ( not ( = ?auto_21685 ?auto_21701 ) ) ( not ( = ?auto_21686 ?auto_21688 ) ) ( not ( = ?auto_21686 ?auto_21701 ) ) ( not ( = ?auto_21689 ?auto_21688 ) ) ( not ( = ?auto_21689 ?auto_21701 ) ) ( not ( = ?auto_21687 ?auto_21688 ) ) ( not ( = ?auto_21687 ?auto_21701 ) ) ( not ( = ?auto_21691 ?auto_21688 ) ) ( not ( = ?auto_21691 ?auto_21701 ) ) ( not ( = ?auto_21688 ?auto_21715 ) ) ( not ( = ?auto_21688 ?auto_21705 ) ) ( not ( = ?auto_21688 ?auto_21712 ) ) ( not ( = ?auto_21688 ?auto_21709 ) ) ( not ( = ?auto_21688 ?auto_21713 ) ) ( not ( = ?auto_21688 ?auto_21708 ) ) ( not ( = ?auto_21688 ?auto_21707 ) ) ( not ( = ?auto_21688 ?auto_21717 ) ) ( not ( = ?auto_21716 ?auto_21699 ) ) ( not ( = ?auto_21716 ?auto_21703 ) ) ( not ( = ?auto_21716 ?auto_21706 ) ) ( not ( = ?auto_21716 ?auto_21719 ) ) ( not ( = ?auto_21716 ?auto_21710 ) ) ( not ( = ?auto_21716 ?auto_21711 ) ) ( not ( = ?auto_21704 ?auto_21702 ) ) ( not ( = ?auto_21704 ?auto_21721 ) ) ( not ( = ?auto_21704 ?auto_21720 ) ) ( not ( = ?auto_21704 ?auto_21700 ) ) ( not ( = ?auto_21704 ?auto_21714 ) ) ( not ( = ?auto_21704 ?auto_21718 ) ) ( not ( = ?auto_21701 ?auto_21715 ) ) ( not ( = ?auto_21701 ?auto_21705 ) ) ( not ( = ?auto_21701 ?auto_21712 ) ) ( not ( = ?auto_21701 ?auto_21709 ) ) ( not ( = ?auto_21701 ?auto_21713 ) ) ( not ( = ?auto_21701 ?auto_21708 ) ) ( not ( = ?auto_21701 ?auto_21707 ) ) ( not ( = ?auto_21701 ?auto_21717 ) ) ( not ( = ?auto_21682 ?auto_21692 ) ) ( not ( = ?auto_21682 ?auto_21693 ) ) ( not ( = ?auto_21683 ?auto_21692 ) ) ( not ( = ?auto_21683 ?auto_21693 ) ) ( not ( = ?auto_21684 ?auto_21692 ) ) ( not ( = ?auto_21684 ?auto_21693 ) ) ( not ( = ?auto_21685 ?auto_21692 ) ) ( not ( = ?auto_21685 ?auto_21693 ) ) ( not ( = ?auto_21686 ?auto_21692 ) ) ( not ( = ?auto_21686 ?auto_21693 ) ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( not ( = ?auto_21689 ?auto_21693 ) ) ( not ( = ?auto_21687 ?auto_21692 ) ) ( not ( = ?auto_21687 ?auto_21693 ) ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21693 ) ) ( not ( = ?auto_21690 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21693 ) ) ( not ( = ?auto_21692 ?auto_21701 ) ) ( not ( = ?auto_21692 ?auto_21715 ) ) ( not ( = ?auto_21692 ?auto_21705 ) ) ( not ( = ?auto_21692 ?auto_21712 ) ) ( not ( = ?auto_21692 ?auto_21709 ) ) ( not ( = ?auto_21692 ?auto_21713 ) ) ( not ( = ?auto_21692 ?auto_21708 ) ) ( not ( = ?auto_21692 ?auto_21707 ) ) ( not ( = ?auto_21692 ?auto_21717 ) ) ( not ( = ?auto_21698 ?auto_21716 ) ) ( not ( = ?auto_21698 ?auto_21699 ) ) ( not ( = ?auto_21698 ?auto_21703 ) ) ( not ( = ?auto_21698 ?auto_21706 ) ) ( not ( = ?auto_21698 ?auto_21719 ) ) ( not ( = ?auto_21698 ?auto_21710 ) ) ( not ( = ?auto_21698 ?auto_21711 ) ) ( not ( = ?auto_21694 ?auto_21704 ) ) ( not ( = ?auto_21694 ?auto_21702 ) ) ( not ( = ?auto_21694 ?auto_21721 ) ) ( not ( = ?auto_21694 ?auto_21720 ) ) ( not ( = ?auto_21694 ?auto_21700 ) ) ( not ( = ?auto_21694 ?auto_21714 ) ) ( not ( = ?auto_21694 ?auto_21718 ) ) ( not ( = ?auto_21693 ?auto_21701 ) ) ( not ( = ?auto_21693 ?auto_21715 ) ) ( not ( = ?auto_21693 ?auto_21705 ) ) ( not ( = ?auto_21693 ?auto_21712 ) ) ( not ( = ?auto_21693 ?auto_21709 ) ) ( not ( = ?auto_21693 ?auto_21713 ) ) ( not ( = ?auto_21693 ?auto_21708 ) ) ( not ( = ?auto_21693 ?auto_21707 ) ) ( not ( = ?auto_21693 ?auto_21717 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21682 ?auto_21683 ?auto_21684 ?auto_21685 ?auto_21686 ?auto_21689 ?auto_21687 ?auto_21691 ?auto_21690 ?auto_21688 )
      ( MAKE-1CRATE ?auto_21688 ?auto_21692 )
      ( MAKE-10CRATE-VERIFY ?auto_21682 ?auto_21683 ?auto_21684 ?auto_21685 ?auto_21686 ?auto_21689 ?auto_21687 ?auto_21691 ?auto_21690 ?auto_21688 ?auto_21692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21724 - SURFACE
      ?auto_21725 - SURFACE
    )
    :vars
    (
      ?auto_21726 - HOIST
      ?auto_21727 - PLACE
      ?auto_21729 - PLACE
      ?auto_21730 - HOIST
      ?auto_21731 - SURFACE
      ?auto_21728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21726 ?auto_21727 ) ( SURFACE-AT ?auto_21724 ?auto_21727 ) ( CLEAR ?auto_21724 ) ( IS-CRATE ?auto_21725 ) ( AVAILABLE ?auto_21726 ) ( not ( = ?auto_21729 ?auto_21727 ) ) ( HOIST-AT ?auto_21730 ?auto_21729 ) ( AVAILABLE ?auto_21730 ) ( SURFACE-AT ?auto_21725 ?auto_21729 ) ( ON ?auto_21725 ?auto_21731 ) ( CLEAR ?auto_21725 ) ( TRUCK-AT ?auto_21728 ?auto_21727 ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21731 ) ) ( not ( = ?auto_21725 ?auto_21731 ) ) ( not ( = ?auto_21726 ?auto_21730 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21728 ?auto_21727 ?auto_21729 )
      ( !LIFT ?auto_21730 ?auto_21725 ?auto_21731 ?auto_21729 )
      ( !LOAD ?auto_21730 ?auto_21725 ?auto_21728 ?auto_21729 )
      ( !DRIVE ?auto_21728 ?auto_21729 ?auto_21727 )
      ( !UNLOAD ?auto_21726 ?auto_21725 ?auto_21728 ?auto_21727 )
      ( !DROP ?auto_21726 ?auto_21725 ?auto_21724 ?auto_21727 )
      ( MAKE-1CRATE-VERIFY ?auto_21724 ?auto_21725 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21744 - SURFACE
      ?auto_21745 - SURFACE
      ?auto_21746 - SURFACE
      ?auto_21747 - SURFACE
      ?auto_21748 - SURFACE
      ?auto_21751 - SURFACE
      ?auto_21749 - SURFACE
      ?auto_21753 - SURFACE
      ?auto_21752 - SURFACE
      ?auto_21750 - SURFACE
      ?auto_21755 - SURFACE
      ?auto_21754 - SURFACE
    )
    :vars
    (
      ?auto_21760 - HOIST
      ?auto_21759 - PLACE
      ?auto_21757 - PLACE
      ?auto_21758 - HOIST
      ?auto_21761 - SURFACE
      ?auto_21770 - PLACE
      ?auto_21772 - HOIST
      ?auto_21774 - SURFACE
      ?auto_21781 - PLACE
      ?auto_21763 - HOIST
      ?auto_21779 - SURFACE
      ?auto_21775 - PLACE
      ?auto_21777 - HOIST
      ?auto_21778 - SURFACE
      ?auto_21782 - PLACE
      ?auto_21784 - HOIST
      ?auto_21765 - SURFACE
      ?auto_21785 - PLACE
      ?auto_21787 - HOIST
      ?auto_21766 - SURFACE
      ?auto_21783 - PLACE
      ?auto_21764 - HOIST
      ?auto_21769 - SURFACE
      ?auto_21771 - SURFACE
      ?auto_21780 - PLACE
      ?auto_21767 - HOIST
      ?auto_21773 - SURFACE
      ?auto_21762 - SURFACE
      ?auto_21768 - PLACE
      ?auto_21786 - HOIST
      ?auto_21776 - SURFACE
      ?auto_21756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21760 ?auto_21759 ) ( IS-CRATE ?auto_21754 ) ( not ( = ?auto_21757 ?auto_21759 ) ) ( HOIST-AT ?auto_21758 ?auto_21757 ) ( AVAILABLE ?auto_21758 ) ( SURFACE-AT ?auto_21754 ?auto_21757 ) ( ON ?auto_21754 ?auto_21761 ) ( CLEAR ?auto_21754 ) ( not ( = ?auto_21755 ?auto_21754 ) ) ( not ( = ?auto_21755 ?auto_21761 ) ) ( not ( = ?auto_21754 ?auto_21761 ) ) ( not ( = ?auto_21760 ?auto_21758 ) ) ( IS-CRATE ?auto_21755 ) ( not ( = ?auto_21770 ?auto_21759 ) ) ( HOIST-AT ?auto_21772 ?auto_21770 ) ( AVAILABLE ?auto_21772 ) ( SURFACE-AT ?auto_21755 ?auto_21770 ) ( ON ?auto_21755 ?auto_21774 ) ( CLEAR ?auto_21755 ) ( not ( = ?auto_21750 ?auto_21755 ) ) ( not ( = ?auto_21750 ?auto_21774 ) ) ( not ( = ?auto_21755 ?auto_21774 ) ) ( not ( = ?auto_21760 ?auto_21772 ) ) ( IS-CRATE ?auto_21750 ) ( not ( = ?auto_21781 ?auto_21759 ) ) ( HOIST-AT ?auto_21763 ?auto_21781 ) ( AVAILABLE ?auto_21763 ) ( SURFACE-AT ?auto_21750 ?auto_21781 ) ( ON ?auto_21750 ?auto_21779 ) ( CLEAR ?auto_21750 ) ( not ( = ?auto_21752 ?auto_21750 ) ) ( not ( = ?auto_21752 ?auto_21779 ) ) ( not ( = ?auto_21750 ?auto_21779 ) ) ( not ( = ?auto_21760 ?auto_21763 ) ) ( IS-CRATE ?auto_21752 ) ( not ( = ?auto_21775 ?auto_21759 ) ) ( HOIST-AT ?auto_21777 ?auto_21775 ) ( AVAILABLE ?auto_21777 ) ( SURFACE-AT ?auto_21752 ?auto_21775 ) ( ON ?auto_21752 ?auto_21778 ) ( CLEAR ?auto_21752 ) ( not ( = ?auto_21753 ?auto_21752 ) ) ( not ( = ?auto_21753 ?auto_21778 ) ) ( not ( = ?auto_21752 ?auto_21778 ) ) ( not ( = ?auto_21760 ?auto_21777 ) ) ( IS-CRATE ?auto_21753 ) ( not ( = ?auto_21782 ?auto_21759 ) ) ( HOIST-AT ?auto_21784 ?auto_21782 ) ( AVAILABLE ?auto_21784 ) ( SURFACE-AT ?auto_21753 ?auto_21782 ) ( ON ?auto_21753 ?auto_21765 ) ( CLEAR ?auto_21753 ) ( not ( = ?auto_21749 ?auto_21753 ) ) ( not ( = ?auto_21749 ?auto_21765 ) ) ( not ( = ?auto_21753 ?auto_21765 ) ) ( not ( = ?auto_21760 ?auto_21784 ) ) ( IS-CRATE ?auto_21749 ) ( not ( = ?auto_21785 ?auto_21759 ) ) ( HOIST-AT ?auto_21787 ?auto_21785 ) ( SURFACE-AT ?auto_21749 ?auto_21785 ) ( ON ?auto_21749 ?auto_21766 ) ( CLEAR ?auto_21749 ) ( not ( = ?auto_21751 ?auto_21749 ) ) ( not ( = ?auto_21751 ?auto_21766 ) ) ( not ( = ?auto_21749 ?auto_21766 ) ) ( not ( = ?auto_21760 ?auto_21787 ) ) ( IS-CRATE ?auto_21751 ) ( not ( = ?auto_21783 ?auto_21759 ) ) ( HOIST-AT ?auto_21764 ?auto_21783 ) ( AVAILABLE ?auto_21764 ) ( SURFACE-AT ?auto_21751 ?auto_21783 ) ( ON ?auto_21751 ?auto_21769 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21748 ?auto_21751 ) ) ( not ( = ?auto_21748 ?auto_21769 ) ) ( not ( = ?auto_21751 ?auto_21769 ) ) ( not ( = ?auto_21760 ?auto_21764 ) ) ( IS-CRATE ?auto_21748 ) ( AVAILABLE ?auto_21787 ) ( SURFACE-AT ?auto_21748 ?auto_21785 ) ( ON ?auto_21748 ?auto_21771 ) ( CLEAR ?auto_21748 ) ( not ( = ?auto_21747 ?auto_21748 ) ) ( not ( = ?auto_21747 ?auto_21771 ) ) ( not ( = ?auto_21748 ?auto_21771 ) ) ( IS-CRATE ?auto_21747 ) ( not ( = ?auto_21780 ?auto_21759 ) ) ( HOIST-AT ?auto_21767 ?auto_21780 ) ( SURFACE-AT ?auto_21747 ?auto_21780 ) ( ON ?auto_21747 ?auto_21773 ) ( CLEAR ?auto_21747 ) ( not ( = ?auto_21746 ?auto_21747 ) ) ( not ( = ?auto_21746 ?auto_21773 ) ) ( not ( = ?auto_21747 ?auto_21773 ) ) ( not ( = ?auto_21760 ?auto_21767 ) ) ( IS-CRATE ?auto_21746 ) ( AVAILABLE ?auto_21767 ) ( SURFACE-AT ?auto_21746 ?auto_21780 ) ( ON ?auto_21746 ?auto_21762 ) ( CLEAR ?auto_21746 ) ( not ( = ?auto_21745 ?auto_21746 ) ) ( not ( = ?auto_21745 ?auto_21762 ) ) ( not ( = ?auto_21746 ?auto_21762 ) ) ( SURFACE-AT ?auto_21744 ?auto_21759 ) ( CLEAR ?auto_21744 ) ( IS-CRATE ?auto_21745 ) ( AVAILABLE ?auto_21760 ) ( not ( = ?auto_21768 ?auto_21759 ) ) ( HOIST-AT ?auto_21786 ?auto_21768 ) ( AVAILABLE ?auto_21786 ) ( SURFACE-AT ?auto_21745 ?auto_21768 ) ( ON ?auto_21745 ?auto_21776 ) ( CLEAR ?auto_21745 ) ( TRUCK-AT ?auto_21756 ?auto_21759 ) ( not ( = ?auto_21744 ?auto_21745 ) ) ( not ( = ?auto_21744 ?auto_21776 ) ) ( not ( = ?auto_21745 ?auto_21776 ) ) ( not ( = ?auto_21760 ?auto_21786 ) ) ( not ( = ?auto_21744 ?auto_21746 ) ) ( not ( = ?auto_21744 ?auto_21762 ) ) ( not ( = ?auto_21746 ?auto_21776 ) ) ( not ( = ?auto_21780 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21786 ) ) ( not ( = ?auto_21762 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21747 ) ) ( not ( = ?auto_21744 ?auto_21773 ) ) ( not ( = ?auto_21745 ?auto_21747 ) ) ( not ( = ?auto_21745 ?auto_21773 ) ) ( not ( = ?auto_21747 ?auto_21762 ) ) ( not ( = ?auto_21747 ?auto_21776 ) ) ( not ( = ?auto_21773 ?auto_21762 ) ) ( not ( = ?auto_21773 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21748 ) ) ( not ( = ?auto_21744 ?auto_21771 ) ) ( not ( = ?auto_21745 ?auto_21748 ) ) ( not ( = ?auto_21745 ?auto_21771 ) ) ( not ( = ?auto_21746 ?auto_21748 ) ) ( not ( = ?auto_21746 ?auto_21771 ) ) ( not ( = ?auto_21748 ?auto_21773 ) ) ( not ( = ?auto_21748 ?auto_21762 ) ) ( not ( = ?auto_21748 ?auto_21776 ) ) ( not ( = ?auto_21785 ?auto_21780 ) ) ( not ( = ?auto_21785 ?auto_21768 ) ) ( not ( = ?auto_21787 ?auto_21767 ) ) ( not ( = ?auto_21787 ?auto_21786 ) ) ( not ( = ?auto_21771 ?auto_21773 ) ) ( not ( = ?auto_21771 ?auto_21762 ) ) ( not ( = ?auto_21771 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21751 ) ) ( not ( = ?auto_21744 ?auto_21769 ) ) ( not ( = ?auto_21745 ?auto_21751 ) ) ( not ( = ?auto_21745 ?auto_21769 ) ) ( not ( = ?auto_21746 ?auto_21751 ) ) ( not ( = ?auto_21746 ?auto_21769 ) ) ( not ( = ?auto_21747 ?auto_21751 ) ) ( not ( = ?auto_21747 ?auto_21769 ) ) ( not ( = ?auto_21751 ?auto_21771 ) ) ( not ( = ?auto_21751 ?auto_21773 ) ) ( not ( = ?auto_21751 ?auto_21762 ) ) ( not ( = ?auto_21751 ?auto_21776 ) ) ( not ( = ?auto_21783 ?auto_21785 ) ) ( not ( = ?auto_21783 ?auto_21780 ) ) ( not ( = ?auto_21783 ?auto_21768 ) ) ( not ( = ?auto_21764 ?auto_21787 ) ) ( not ( = ?auto_21764 ?auto_21767 ) ) ( not ( = ?auto_21764 ?auto_21786 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21773 ) ) ( not ( = ?auto_21769 ?auto_21762 ) ) ( not ( = ?auto_21769 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21749 ) ) ( not ( = ?auto_21744 ?auto_21766 ) ) ( not ( = ?auto_21745 ?auto_21749 ) ) ( not ( = ?auto_21745 ?auto_21766 ) ) ( not ( = ?auto_21746 ?auto_21749 ) ) ( not ( = ?auto_21746 ?auto_21766 ) ) ( not ( = ?auto_21747 ?auto_21749 ) ) ( not ( = ?auto_21747 ?auto_21766 ) ) ( not ( = ?auto_21748 ?auto_21749 ) ) ( not ( = ?auto_21748 ?auto_21766 ) ) ( not ( = ?auto_21749 ?auto_21769 ) ) ( not ( = ?auto_21749 ?auto_21771 ) ) ( not ( = ?auto_21749 ?auto_21773 ) ) ( not ( = ?auto_21749 ?auto_21762 ) ) ( not ( = ?auto_21749 ?auto_21776 ) ) ( not ( = ?auto_21766 ?auto_21769 ) ) ( not ( = ?auto_21766 ?auto_21771 ) ) ( not ( = ?auto_21766 ?auto_21773 ) ) ( not ( = ?auto_21766 ?auto_21762 ) ) ( not ( = ?auto_21766 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21753 ) ) ( not ( = ?auto_21744 ?auto_21765 ) ) ( not ( = ?auto_21745 ?auto_21753 ) ) ( not ( = ?auto_21745 ?auto_21765 ) ) ( not ( = ?auto_21746 ?auto_21753 ) ) ( not ( = ?auto_21746 ?auto_21765 ) ) ( not ( = ?auto_21747 ?auto_21753 ) ) ( not ( = ?auto_21747 ?auto_21765 ) ) ( not ( = ?auto_21748 ?auto_21753 ) ) ( not ( = ?auto_21748 ?auto_21765 ) ) ( not ( = ?auto_21751 ?auto_21753 ) ) ( not ( = ?auto_21751 ?auto_21765 ) ) ( not ( = ?auto_21753 ?auto_21766 ) ) ( not ( = ?auto_21753 ?auto_21769 ) ) ( not ( = ?auto_21753 ?auto_21771 ) ) ( not ( = ?auto_21753 ?auto_21773 ) ) ( not ( = ?auto_21753 ?auto_21762 ) ) ( not ( = ?auto_21753 ?auto_21776 ) ) ( not ( = ?auto_21782 ?auto_21785 ) ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21780 ) ) ( not ( = ?auto_21782 ?auto_21768 ) ) ( not ( = ?auto_21784 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21764 ) ) ( not ( = ?auto_21784 ?auto_21767 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21765 ?auto_21766 ) ) ( not ( = ?auto_21765 ?auto_21769 ) ) ( not ( = ?auto_21765 ?auto_21771 ) ) ( not ( = ?auto_21765 ?auto_21773 ) ) ( not ( = ?auto_21765 ?auto_21762 ) ) ( not ( = ?auto_21765 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21752 ) ) ( not ( = ?auto_21744 ?auto_21778 ) ) ( not ( = ?auto_21745 ?auto_21752 ) ) ( not ( = ?auto_21745 ?auto_21778 ) ) ( not ( = ?auto_21746 ?auto_21752 ) ) ( not ( = ?auto_21746 ?auto_21778 ) ) ( not ( = ?auto_21747 ?auto_21752 ) ) ( not ( = ?auto_21747 ?auto_21778 ) ) ( not ( = ?auto_21748 ?auto_21752 ) ) ( not ( = ?auto_21748 ?auto_21778 ) ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( not ( = ?auto_21751 ?auto_21778 ) ) ( not ( = ?auto_21749 ?auto_21752 ) ) ( not ( = ?auto_21749 ?auto_21778 ) ) ( not ( = ?auto_21752 ?auto_21765 ) ) ( not ( = ?auto_21752 ?auto_21766 ) ) ( not ( = ?auto_21752 ?auto_21769 ) ) ( not ( = ?auto_21752 ?auto_21771 ) ) ( not ( = ?auto_21752 ?auto_21773 ) ) ( not ( = ?auto_21752 ?auto_21762 ) ) ( not ( = ?auto_21752 ?auto_21776 ) ) ( not ( = ?auto_21775 ?auto_21782 ) ) ( not ( = ?auto_21775 ?auto_21785 ) ) ( not ( = ?auto_21775 ?auto_21783 ) ) ( not ( = ?auto_21775 ?auto_21780 ) ) ( not ( = ?auto_21775 ?auto_21768 ) ) ( not ( = ?auto_21777 ?auto_21784 ) ) ( not ( = ?auto_21777 ?auto_21787 ) ) ( not ( = ?auto_21777 ?auto_21764 ) ) ( not ( = ?auto_21777 ?auto_21767 ) ) ( not ( = ?auto_21777 ?auto_21786 ) ) ( not ( = ?auto_21778 ?auto_21765 ) ) ( not ( = ?auto_21778 ?auto_21766 ) ) ( not ( = ?auto_21778 ?auto_21769 ) ) ( not ( = ?auto_21778 ?auto_21771 ) ) ( not ( = ?auto_21778 ?auto_21773 ) ) ( not ( = ?auto_21778 ?auto_21762 ) ) ( not ( = ?auto_21778 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21750 ) ) ( not ( = ?auto_21744 ?auto_21779 ) ) ( not ( = ?auto_21745 ?auto_21750 ) ) ( not ( = ?auto_21745 ?auto_21779 ) ) ( not ( = ?auto_21746 ?auto_21750 ) ) ( not ( = ?auto_21746 ?auto_21779 ) ) ( not ( = ?auto_21747 ?auto_21750 ) ) ( not ( = ?auto_21747 ?auto_21779 ) ) ( not ( = ?auto_21748 ?auto_21750 ) ) ( not ( = ?auto_21748 ?auto_21779 ) ) ( not ( = ?auto_21751 ?auto_21750 ) ) ( not ( = ?auto_21751 ?auto_21779 ) ) ( not ( = ?auto_21749 ?auto_21750 ) ) ( not ( = ?auto_21749 ?auto_21779 ) ) ( not ( = ?auto_21753 ?auto_21750 ) ) ( not ( = ?auto_21753 ?auto_21779 ) ) ( not ( = ?auto_21750 ?auto_21778 ) ) ( not ( = ?auto_21750 ?auto_21765 ) ) ( not ( = ?auto_21750 ?auto_21766 ) ) ( not ( = ?auto_21750 ?auto_21769 ) ) ( not ( = ?auto_21750 ?auto_21771 ) ) ( not ( = ?auto_21750 ?auto_21773 ) ) ( not ( = ?auto_21750 ?auto_21762 ) ) ( not ( = ?auto_21750 ?auto_21776 ) ) ( not ( = ?auto_21781 ?auto_21775 ) ) ( not ( = ?auto_21781 ?auto_21782 ) ) ( not ( = ?auto_21781 ?auto_21785 ) ) ( not ( = ?auto_21781 ?auto_21783 ) ) ( not ( = ?auto_21781 ?auto_21780 ) ) ( not ( = ?auto_21781 ?auto_21768 ) ) ( not ( = ?auto_21763 ?auto_21777 ) ) ( not ( = ?auto_21763 ?auto_21784 ) ) ( not ( = ?auto_21763 ?auto_21787 ) ) ( not ( = ?auto_21763 ?auto_21764 ) ) ( not ( = ?auto_21763 ?auto_21767 ) ) ( not ( = ?auto_21763 ?auto_21786 ) ) ( not ( = ?auto_21779 ?auto_21778 ) ) ( not ( = ?auto_21779 ?auto_21765 ) ) ( not ( = ?auto_21779 ?auto_21766 ) ) ( not ( = ?auto_21779 ?auto_21769 ) ) ( not ( = ?auto_21779 ?auto_21771 ) ) ( not ( = ?auto_21779 ?auto_21773 ) ) ( not ( = ?auto_21779 ?auto_21762 ) ) ( not ( = ?auto_21779 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21755 ) ) ( not ( = ?auto_21744 ?auto_21774 ) ) ( not ( = ?auto_21745 ?auto_21755 ) ) ( not ( = ?auto_21745 ?auto_21774 ) ) ( not ( = ?auto_21746 ?auto_21755 ) ) ( not ( = ?auto_21746 ?auto_21774 ) ) ( not ( = ?auto_21747 ?auto_21755 ) ) ( not ( = ?auto_21747 ?auto_21774 ) ) ( not ( = ?auto_21748 ?auto_21755 ) ) ( not ( = ?auto_21748 ?auto_21774 ) ) ( not ( = ?auto_21751 ?auto_21755 ) ) ( not ( = ?auto_21751 ?auto_21774 ) ) ( not ( = ?auto_21749 ?auto_21755 ) ) ( not ( = ?auto_21749 ?auto_21774 ) ) ( not ( = ?auto_21753 ?auto_21755 ) ) ( not ( = ?auto_21753 ?auto_21774 ) ) ( not ( = ?auto_21752 ?auto_21755 ) ) ( not ( = ?auto_21752 ?auto_21774 ) ) ( not ( = ?auto_21755 ?auto_21779 ) ) ( not ( = ?auto_21755 ?auto_21778 ) ) ( not ( = ?auto_21755 ?auto_21765 ) ) ( not ( = ?auto_21755 ?auto_21766 ) ) ( not ( = ?auto_21755 ?auto_21769 ) ) ( not ( = ?auto_21755 ?auto_21771 ) ) ( not ( = ?auto_21755 ?auto_21773 ) ) ( not ( = ?auto_21755 ?auto_21762 ) ) ( not ( = ?auto_21755 ?auto_21776 ) ) ( not ( = ?auto_21770 ?auto_21781 ) ) ( not ( = ?auto_21770 ?auto_21775 ) ) ( not ( = ?auto_21770 ?auto_21782 ) ) ( not ( = ?auto_21770 ?auto_21785 ) ) ( not ( = ?auto_21770 ?auto_21783 ) ) ( not ( = ?auto_21770 ?auto_21780 ) ) ( not ( = ?auto_21770 ?auto_21768 ) ) ( not ( = ?auto_21772 ?auto_21763 ) ) ( not ( = ?auto_21772 ?auto_21777 ) ) ( not ( = ?auto_21772 ?auto_21784 ) ) ( not ( = ?auto_21772 ?auto_21787 ) ) ( not ( = ?auto_21772 ?auto_21764 ) ) ( not ( = ?auto_21772 ?auto_21767 ) ) ( not ( = ?auto_21772 ?auto_21786 ) ) ( not ( = ?auto_21774 ?auto_21779 ) ) ( not ( = ?auto_21774 ?auto_21778 ) ) ( not ( = ?auto_21774 ?auto_21765 ) ) ( not ( = ?auto_21774 ?auto_21766 ) ) ( not ( = ?auto_21774 ?auto_21769 ) ) ( not ( = ?auto_21774 ?auto_21771 ) ) ( not ( = ?auto_21774 ?auto_21773 ) ) ( not ( = ?auto_21774 ?auto_21762 ) ) ( not ( = ?auto_21774 ?auto_21776 ) ) ( not ( = ?auto_21744 ?auto_21754 ) ) ( not ( = ?auto_21744 ?auto_21761 ) ) ( not ( = ?auto_21745 ?auto_21754 ) ) ( not ( = ?auto_21745 ?auto_21761 ) ) ( not ( = ?auto_21746 ?auto_21754 ) ) ( not ( = ?auto_21746 ?auto_21761 ) ) ( not ( = ?auto_21747 ?auto_21754 ) ) ( not ( = ?auto_21747 ?auto_21761 ) ) ( not ( = ?auto_21748 ?auto_21754 ) ) ( not ( = ?auto_21748 ?auto_21761 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21761 ) ) ( not ( = ?auto_21749 ?auto_21754 ) ) ( not ( = ?auto_21749 ?auto_21761 ) ) ( not ( = ?auto_21753 ?auto_21754 ) ) ( not ( = ?auto_21753 ?auto_21761 ) ) ( not ( = ?auto_21752 ?auto_21754 ) ) ( not ( = ?auto_21752 ?auto_21761 ) ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21750 ?auto_21761 ) ) ( not ( = ?auto_21754 ?auto_21774 ) ) ( not ( = ?auto_21754 ?auto_21779 ) ) ( not ( = ?auto_21754 ?auto_21778 ) ) ( not ( = ?auto_21754 ?auto_21765 ) ) ( not ( = ?auto_21754 ?auto_21766 ) ) ( not ( = ?auto_21754 ?auto_21769 ) ) ( not ( = ?auto_21754 ?auto_21771 ) ) ( not ( = ?auto_21754 ?auto_21773 ) ) ( not ( = ?auto_21754 ?auto_21762 ) ) ( not ( = ?auto_21754 ?auto_21776 ) ) ( not ( = ?auto_21757 ?auto_21770 ) ) ( not ( = ?auto_21757 ?auto_21781 ) ) ( not ( = ?auto_21757 ?auto_21775 ) ) ( not ( = ?auto_21757 ?auto_21782 ) ) ( not ( = ?auto_21757 ?auto_21785 ) ) ( not ( = ?auto_21757 ?auto_21783 ) ) ( not ( = ?auto_21757 ?auto_21780 ) ) ( not ( = ?auto_21757 ?auto_21768 ) ) ( not ( = ?auto_21758 ?auto_21772 ) ) ( not ( = ?auto_21758 ?auto_21763 ) ) ( not ( = ?auto_21758 ?auto_21777 ) ) ( not ( = ?auto_21758 ?auto_21784 ) ) ( not ( = ?auto_21758 ?auto_21787 ) ) ( not ( = ?auto_21758 ?auto_21764 ) ) ( not ( = ?auto_21758 ?auto_21767 ) ) ( not ( = ?auto_21758 ?auto_21786 ) ) ( not ( = ?auto_21761 ?auto_21774 ) ) ( not ( = ?auto_21761 ?auto_21779 ) ) ( not ( = ?auto_21761 ?auto_21778 ) ) ( not ( = ?auto_21761 ?auto_21765 ) ) ( not ( = ?auto_21761 ?auto_21766 ) ) ( not ( = ?auto_21761 ?auto_21769 ) ) ( not ( = ?auto_21761 ?auto_21771 ) ) ( not ( = ?auto_21761 ?auto_21773 ) ) ( not ( = ?auto_21761 ?auto_21762 ) ) ( not ( = ?auto_21761 ?auto_21776 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21744 ?auto_21745 ?auto_21746 ?auto_21747 ?auto_21748 ?auto_21751 ?auto_21749 ?auto_21753 ?auto_21752 ?auto_21750 ?auto_21755 )
      ( MAKE-1CRATE ?auto_21755 ?auto_21754 )
      ( MAKE-11CRATE-VERIFY ?auto_21744 ?auto_21745 ?auto_21746 ?auto_21747 ?auto_21748 ?auto_21751 ?auto_21749 ?auto_21753 ?auto_21752 ?auto_21750 ?auto_21755 ?auto_21754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21790 - SURFACE
      ?auto_21791 - SURFACE
    )
    :vars
    (
      ?auto_21792 - HOIST
      ?auto_21793 - PLACE
      ?auto_21795 - PLACE
      ?auto_21796 - HOIST
      ?auto_21797 - SURFACE
      ?auto_21794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21792 ?auto_21793 ) ( SURFACE-AT ?auto_21790 ?auto_21793 ) ( CLEAR ?auto_21790 ) ( IS-CRATE ?auto_21791 ) ( AVAILABLE ?auto_21792 ) ( not ( = ?auto_21795 ?auto_21793 ) ) ( HOIST-AT ?auto_21796 ?auto_21795 ) ( AVAILABLE ?auto_21796 ) ( SURFACE-AT ?auto_21791 ?auto_21795 ) ( ON ?auto_21791 ?auto_21797 ) ( CLEAR ?auto_21791 ) ( TRUCK-AT ?auto_21794 ?auto_21793 ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( not ( = ?auto_21790 ?auto_21797 ) ) ( not ( = ?auto_21791 ?auto_21797 ) ) ( not ( = ?auto_21792 ?auto_21796 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21794 ?auto_21793 ?auto_21795 )
      ( !LIFT ?auto_21796 ?auto_21791 ?auto_21797 ?auto_21795 )
      ( !LOAD ?auto_21796 ?auto_21791 ?auto_21794 ?auto_21795 )
      ( !DRIVE ?auto_21794 ?auto_21795 ?auto_21793 )
      ( !UNLOAD ?auto_21792 ?auto_21791 ?auto_21794 ?auto_21793 )
      ( !DROP ?auto_21792 ?auto_21791 ?auto_21790 ?auto_21793 )
      ( MAKE-1CRATE-VERIFY ?auto_21790 ?auto_21791 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21811 - SURFACE
      ?auto_21812 - SURFACE
      ?auto_21813 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21815 - SURFACE
      ?auto_21818 - SURFACE
      ?auto_21816 - SURFACE
      ?auto_21820 - SURFACE
      ?auto_21819 - SURFACE
      ?auto_21817 - SURFACE
      ?auto_21822 - SURFACE
      ?auto_21821 - SURFACE
      ?auto_21823 - SURFACE
    )
    :vars
    (
      ?auto_21827 - HOIST
      ?auto_21828 - PLACE
      ?auto_21825 - PLACE
      ?auto_21824 - HOIST
      ?auto_21826 - SURFACE
      ?auto_21854 - PLACE
      ?auto_21852 - HOIST
      ?auto_21856 - SURFACE
      ?auto_21840 - PLACE
      ?auto_21850 - HOIST
      ?auto_21838 - SURFACE
      ?auto_21841 - PLACE
      ?auto_21837 - HOIST
      ?auto_21832 - SURFACE
      ?auto_21831 - SURFACE
      ?auto_21836 - PLACE
      ?auto_21847 - HOIST
      ?auto_21845 - SURFACE
      ?auto_21848 - PLACE
      ?auto_21835 - HOIST
      ?auto_21853 - SURFACE
      ?auto_21839 - PLACE
      ?auto_21830 - HOIST
      ?auto_21834 - SURFACE
      ?auto_21851 - SURFACE
      ?auto_21844 - PLACE
      ?auto_21842 - HOIST
      ?auto_21855 - SURFACE
      ?auto_21846 - SURFACE
      ?auto_21833 - PLACE
      ?auto_21849 - HOIST
      ?auto_21843 - SURFACE
      ?auto_21829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21827 ?auto_21828 ) ( IS-CRATE ?auto_21823 ) ( not ( = ?auto_21825 ?auto_21828 ) ) ( HOIST-AT ?auto_21824 ?auto_21825 ) ( SURFACE-AT ?auto_21823 ?auto_21825 ) ( ON ?auto_21823 ?auto_21826 ) ( CLEAR ?auto_21823 ) ( not ( = ?auto_21821 ?auto_21823 ) ) ( not ( = ?auto_21821 ?auto_21826 ) ) ( not ( = ?auto_21823 ?auto_21826 ) ) ( not ( = ?auto_21827 ?auto_21824 ) ) ( IS-CRATE ?auto_21821 ) ( not ( = ?auto_21854 ?auto_21828 ) ) ( HOIST-AT ?auto_21852 ?auto_21854 ) ( AVAILABLE ?auto_21852 ) ( SURFACE-AT ?auto_21821 ?auto_21854 ) ( ON ?auto_21821 ?auto_21856 ) ( CLEAR ?auto_21821 ) ( not ( = ?auto_21822 ?auto_21821 ) ) ( not ( = ?auto_21822 ?auto_21856 ) ) ( not ( = ?auto_21821 ?auto_21856 ) ) ( not ( = ?auto_21827 ?auto_21852 ) ) ( IS-CRATE ?auto_21822 ) ( not ( = ?auto_21840 ?auto_21828 ) ) ( HOIST-AT ?auto_21850 ?auto_21840 ) ( AVAILABLE ?auto_21850 ) ( SURFACE-AT ?auto_21822 ?auto_21840 ) ( ON ?auto_21822 ?auto_21838 ) ( CLEAR ?auto_21822 ) ( not ( = ?auto_21817 ?auto_21822 ) ) ( not ( = ?auto_21817 ?auto_21838 ) ) ( not ( = ?auto_21822 ?auto_21838 ) ) ( not ( = ?auto_21827 ?auto_21850 ) ) ( IS-CRATE ?auto_21817 ) ( not ( = ?auto_21841 ?auto_21828 ) ) ( HOIST-AT ?auto_21837 ?auto_21841 ) ( AVAILABLE ?auto_21837 ) ( SURFACE-AT ?auto_21817 ?auto_21841 ) ( ON ?auto_21817 ?auto_21832 ) ( CLEAR ?auto_21817 ) ( not ( = ?auto_21819 ?auto_21817 ) ) ( not ( = ?auto_21819 ?auto_21832 ) ) ( not ( = ?auto_21817 ?auto_21832 ) ) ( not ( = ?auto_21827 ?auto_21837 ) ) ( IS-CRATE ?auto_21819 ) ( AVAILABLE ?auto_21824 ) ( SURFACE-AT ?auto_21819 ?auto_21825 ) ( ON ?auto_21819 ?auto_21831 ) ( CLEAR ?auto_21819 ) ( not ( = ?auto_21820 ?auto_21819 ) ) ( not ( = ?auto_21820 ?auto_21831 ) ) ( not ( = ?auto_21819 ?auto_21831 ) ) ( IS-CRATE ?auto_21820 ) ( not ( = ?auto_21836 ?auto_21828 ) ) ( HOIST-AT ?auto_21847 ?auto_21836 ) ( AVAILABLE ?auto_21847 ) ( SURFACE-AT ?auto_21820 ?auto_21836 ) ( ON ?auto_21820 ?auto_21845 ) ( CLEAR ?auto_21820 ) ( not ( = ?auto_21816 ?auto_21820 ) ) ( not ( = ?auto_21816 ?auto_21845 ) ) ( not ( = ?auto_21820 ?auto_21845 ) ) ( not ( = ?auto_21827 ?auto_21847 ) ) ( IS-CRATE ?auto_21816 ) ( not ( = ?auto_21848 ?auto_21828 ) ) ( HOIST-AT ?auto_21835 ?auto_21848 ) ( SURFACE-AT ?auto_21816 ?auto_21848 ) ( ON ?auto_21816 ?auto_21853 ) ( CLEAR ?auto_21816 ) ( not ( = ?auto_21818 ?auto_21816 ) ) ( not ( = ?auto_21818 ?auto_21853 ) ) ( not ( = ?auto_21816 ?auto_21853 ) ) ( not ( = ?auto_21827 ?auto_21835 ) ) ( IS-CRATE ?auto_21818 ) ( not ( = ?auto_21839 ?auto_21828 ) ) ( HOIST-AT ?auto_21830 ?auto_21839 ) ( AVAILABLE ?auto_21830 ) ( SURFACE-AT ?auto_21818 ?auto_21839 ) ( ON ?auto_21818 ?auto_21834 ) ( CLEAR ?auto_21818 ) ( not ( = ?auto_21815 ?auto_21818 ) ) ( not ( = ?auto_21815 ?auto_21834 ) ) ( not ( = ?auto_21818 ?auto_21834 ) ) ( not ( = ?auto_21827 ?auto_21830 ) ) ( IS-CRATE ?auto_21815 ) ( AVAILABLE ?auto_21835 ) ( SURFACE-AT ?auto_21815 ?auto_21848 ) ( ON ?auto_21815 ?auto_21851 ) ( CLEAR ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21814 ?auto_21851 ) ) ( not ( = ?auto_21815 ?auto_21851 ) ) ( IS-CRATE ?auto_21814 ) ( not ( = ?auto_21844 ?auto_21828 ) ) ( HOIST-AT ?auto_21842 ?auto_21844 ) ( SURFACE-AT ?auto_21814 ?auto_21844 ) ( ON ?auto_21814 ?auto_21855 ) ( CLEAR ?auto_21814 ) ( not ( = ?auto_21813 ?auto_21814 ) ) ( not ( = ?auto_21813 ?auto_21855 ) ) ( not ( = ?auto_21814 ?auto_21855 ) ) ( not ( = ?auto_21827 ?auto_21842 ) ) ( IS-CRATE ?auto_21813 ) ( AVAILABLE ?auto_21842 ) ( SURFACE-AT ?auto_21813 ?auto_21844 ) ( ON ?auto_21813 ?auto_21846 ) ( CLEAR ?auto_21813 ) ( not ( = ?auto_21812 ?auto_21813 ) ) ( not ( = ?auto_21812 ?auto_21846 ) ) ( not ( = ?auto_21813 ?auto_21846 ) ) ( SURFACE-AT ?auto_21811 ?auto_21828 ) ( CLEAR ?auto_21811 ) ( IS-CRATE ?auto_21812 ) ( AVAILABLE ?auto_21827 ) ( not ( = ?auto_21833 ?auto_21828 ) ) ( HOIST-AT ?auto_21849 ?auto_21833 ) ( AVAILABLE ?auto_21849 ) ( SURFACE-AT ?auto_21812 ?auto_21833 ) ( ON ?auto_21812 ?auto_21843 ) ( CLEAR ?auto_21812 ) ( TRUCK-AT ?auto_21829 ?auto_21828 ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21811 ?auto_21843 ) ) ( not ( = ?auto_21812 ?auto_21843 ) ) ( not ( = ?auto_21827 ?auto_21849 ) ) ( not ( = ?auto_21811 ?auto_21813 ) ) ( not ( = ?auto_21811 ?auto_21846 ) ) ( not ( = ?auto_21813 ?auto_21843 ) ) ( not ( = ?auto_21844 ?auto_21833 ) ) ( not ( = ?auto_21842 ?auto_21849 ) ) ( not ( = ?auto_21846 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21814 ) ) ( not ( = ?auto_21811 ?auto_21855 ) ) ( not ( = ?auto_21812 ?auto_21814 ) ) ( not ( = ?auto_21812 ?auto_21855 ) ) ( not ( = ?auto_21814 ?auto_21846 ) ) ( not ( = ?auto_21814 ?auto_21843 ) ) ( not ( = ?auto_21855 ?auto_21846 ) ) ( not ( = ?auto_21855 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21815 ) ) ( not ( = ?auto_21811 ?auto_21851 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) ( not ( = ?auto_21812 ?auto_21851 ) ) ( not ( = ?auto_21813 ?auto_21815 ) ) ( not ( = ?auto_21813 ?auto_21851 ) ) ( not ( = ?auto_21815 ?auto_21855 ) ) ( not ( = ?auto_21815 ?auto_21846 ) ) ( not ( = ?auto_21815 ?auto_21843 ) ) ( not ( = ?auto_21848 ?auto_21844 ) ) ( not ( = ?auto_21848 ?auto_21833 ) ) ( not ( = ?auto_21835 ?auto_21842 ) ) ( not ( = ?auto_21835 ?auto_21849 ) ) ( not ( = ?auto_21851 ?auto_21855 ) ) ( not ( = ?auto_21851 ?auto_21846 ) ) ( not ( = ?auto_21851 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21818 ) ) ( not ( = ?auto_21811 ?auto_21834 ) ) ( not ( = ?auto_21812 ?auto_21818 ) ) ( not ( = ?auto_21812 ?auto_21834 ) ) ( not ( = ?auto_21813 ?auto_21818 ) ) ( not ( = ?auto_21813 ?auto_21834 ) ) ( not ( = ?auto_21814 ?auto_21818 ) ) ( not ( = ?auto_21814 ?auto_21834 ) ) ( not ( = ?auto_21818 ?auto_21851 ) ) ( not ( = ?auto_21818 ?auto_21855 ) ) ( not ( = ?auto_21818 ?auto_21846 ) ) ( not ( = ?auto_21818 ?auto_21843 ) ) ( not ( = ?auto_21839 ?auto_21848 ) ) ( not ( = ?auto_21839 ?auto_21844 ) ) ( not ( = ?auto_21839 ?auto_21833 ) ) ( not ( = ?auto_21830 ?auto_21835 ) ) ( not ( = ?auto_21830 ?auto_21842 ) ) ( not ( = ?auto_21830 ?auto_21849 ) ) ( not ( = ?auto_21834 ?auto_21851 ) ) ( not ( = ?auto_21834 ?auto_21855 ) ) ( not ( = ?auto_21834 ?auto_21846 ) ) ( not ( = ?auto_21834 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21816 ) ) ( not ( = ?auto_21811 ?auto_21853 ) ) ( not ( = ?auto_21812 ?auto_21816 ) ) ( not ( = ?auto_21812 ?auto_21853 ) ) ( not ( = ?auto_21813 ?auto_21816 ) ) ( not ( = ?auto_21813 ?auto_21853 ) ) ( not ( = ?auto_21814 ?auto_21816 ) ) ( not ( = ?auto_21814 ?auto_21853 ) ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21815 ?auto_21853 ) ) ( not ( = ?auto_21816 ?auto_21834 ) ) ( not ( = ?auto_21816 ?auto_21851 ) ) ( not ( = ?auto_21816 ?auto_21855 ) ) ( not ( = ?auto_21816 ?auto_21846 ) ) ( not ( = ?auto_21816 ?auto_21843 ) ) ( not ( = ?auto_21853 ?auto_21834 ) ) ( not ( = ?auto_21853 ?auto_21851 ) ) ( not ( = ?auto_21853 ?auto_21855 ) ) ( not ( = ?auto_21853 ?auto_21846 ) ) ( not ( = ?auto_21853 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21820 ) ) ( not ( = ?auto_21811 ?auto_21845 ) ) ( not ( = ?auto_21812 ?auto_21820 ) ) ( not ( = ?auto_21812 ?auto_21845 ) ) ( not ( = ?auto_21813 ?auto_21820 ) ) ( not ( = ?auto_21813 ?auto_21845 ) ) ( not ( = ?auto_21814 ?auto_21820 ) ) ( not ( = ?auto_21814 ?auto_21845 ) ) ( not ( = ?auto_21815 ?auto_21820 ) ) ( not ( = ?auto_21815 ?auto_21845 ) ) ( not ( = ?auto_21818 ?auto_21820 ) ) ( not ( = ?auto_21818 ?auto_21845 ) ) ( not ( = ?auto_21820 ?auto_21853 ) ) ( not ( = ?auto_21820 ?auto_21834 ) ) ( not ( = ?auto_21820 ?auto_21851 ) ) ( not ( = ?auto_21820 ?auto_21855 ) ) ( not ( = ?auto_21820 ?auto_21846 ) ) ( not ( = ?auto_21820 ?auto_21843 ) ) ( not ( = ?auto_21836 ?auto_21848 ) ) ( not ( = ?auto_21836 ?auto_21839 ) ) ( not ( = ?auto_21836 ?auto_21844 ) ) ( not ( = ?auto_21836 ?auto_21833 ) ) ( not ( = ?auto_21847 ?auto_21835 ) ) ( not ( = ?auto_21847 ?auto_21830 ) ) ( not ( = ?auto_21847 ?auto_21842 ) ) ( not ( = ?auto_21847 ?auto_21849 ) ) ( not ( = ?auto_21845 ?auto_21853 ) ) ( not ( = ?auto_21845 ?auto_21834 ) ) ( not ( = ?auto_21845 ?auto_21851 ) ) ( not ( = ?auto_21845 ?auto_21855 ) ) ( not ( = ?auto_21845 ?auto_21846 ) ) ( not ( = ?auto_21845 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21819 ) ) ( not ( = ?auto_21811 ?auto_21831 ) ) ( not ( = ?auto_21812 ?auto_21819 ) ) ( not ( = ?auto_21812 ?auto_21831 ) ) ( not ( = ?auto_21813 ?auto_21819 ) ) ( not ( = ?auto_21813 ?auto_21831 ) ) ( not ( = ?auto_21814 ?auto_21819 ) ) ( not ( = ?auto_21814 ?auto_21831 ) ) ( not ( = ?auto_21815 ?auto_21819 ) ) ( not ( = ?auto_21815 ?auto_21831 ) ) ( not ( = ?auto_21818 ?auto_21819 ) ) ( not ( = ?auto_21818 ?auto_21831 ) ) ( not ( = ?auto_21816 ?auto_21819 ) ) ( not ( = ?auto_21816 ?auto_21831 ) ) ( not ( = ?auto_21819 ?auto_21845 ) ) ( not ( = ?auto_21819 ?auto_21853 ) ) ( not ( = ?auto_21819 ?auto_21834 ) ) ( not ( = ?auto_21819 ?auto_21851 ) ) ( not ( = ?auto_21819 ?auto_21855 ) ) ( not ( = ?auto_21819 ?auto_21846 ) ) ( not ( = ?auto_21819 ?auto_21843 ) ) ( not ( = ?auto_21825 ?auto_21836 ) ) ( not ( = ?auto_21825 ?auto_21848 ) ) ( not ( = ?auto_21825 ?auto_21839 ) ) ( not ( = ?auto_21825 ?auto_21844 ) ) ( not ( = ?auto_21825 ?auto_21833 ) ) ( not ( = ?auto_21824 ?auto_21847 ) ) ( not ( = ?auto_21824 ?auto_21835 ) ) ( not ( = ?auto_21824 ?auto_21830 ) ) ( not ( = ?auto_21824 ?auto_21842 ) ) ( not ( = ?auto_21824 ?auto_21849 ) ) ( not ( = ?auto_21831 ?auto_21845 ) ) ( not ( = ?auto_21831 ?auto_21853 ) ) ( not ( = ?auto_21831 ?auto_21834 ) ) ( not ( = ?auto_21831 ?auto_21851 ) ) ( not ( = ?auto_21831 ?auto_21855 ) ) ( not ( = ?auto_21831 ?auto_21846 ) ) ( not ( = ?auto_21831 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21817 ) ) ( not ( = ?auto_21811 ?auto_21832 ) ) ( not ( = ?auto_21812 ?auto_21817 ) ) ( not ( = ?auto_21812 ?auto_21832 ) ) ( not ( = ?auto_21813 ?auto_21817 ) ) ( not ( = ?auto_21813 ?auto_21832 ) ) ( not ( = ?auto_21814 ?auto_21817 ) ) ( not ( = ?auto_21814 ?auto_21832 ) ) ( not ( = ?auto_21815 ?auto_21817 ) ) ( not ( = ?auto_21815 ?auto_21832 ) ) ( not ( = ?auto_21818 ?auto_21817 ) ) ( not ( = ?auto_21818 ?auto_21832 ) ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( not ( = ?auto_21816 ?auto_21832 ) ) ( not ( = ?auto_21820 ?auto_21817 ) ) ( not ( = ?auto_21820 ?auto_21832 ) ) ( not ( = ?auto_21817 ?auto_21831 ) ) ( not ( = ?auto_21817 ?auto_21845 ) ) ( not ( = ?auto_21817 ?auto_21853 ) ) ( not ( = ?auto_21817 ?auto_21834 ) ) ( not ( = ?auto_21817 ?auto_21851 ) ) ( not ( = ?auto_21817 ?auto_21855 ) ) ( not ( = ?auto_21817 ?auto_21846 ) ) ( not ( = ?auto_21817 ?auto_21843 ) ) ( not ( = ?auto_21841 ?auto_21825 ) ) ( not ( = ?auto_21841 ?auto_21836 ) ) ( not ( = ?auto_21841 ?auto_21848 ) ) ( not ( = ?auto_21841 ?auto_21839 ) ) ( not ( = ?auto_21841 ?auto_21844 ) ) ( not ( = ?auto_21841 ?auto_21833 ) ) ( not ( = ?auto_21837 ?auto_21824 ) ) ( not ( = ?auto_21837 ?auto_21847 ) ) ( not ( = ?auto_21837 ?auto_21835 ) ) ( not ( = ?auto_21837 ?auto_21830 ) ) ( not ( = ?auto_21837 ?auto_21842 ) ) ( not ( = ?auto_21837 ?auto_21849 ) ) ( not ( = ?auto_21832 ?auto_21831 ) ) ( not ( = ?auto_21832 ?auto_21845 ) ) ( not ( = ?auto_21832 ?auto_21853 ) ) ( not ( = ?auto_21832 ?auto_21834 ) ) ( not ( = ?auto_21832 ?auto_21851 ) ) ( not ( = ?auto_21832 ?auto_21855 ) ) ( not ( = ?auto_21832 ?auto_21846 ) ) ( not ( = ?auto_21832 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21822 ) ) ( not ( = ?auto_21811 ?auto_21838 ) ) ( not ( = ?auto_21812 ?auto_21822 ) ) ( not ( = ?auto_21812 ?auto_21838 ) ) ( not ( = ?auto_21813 ?auto_21822 ) ) ( not ( = ?auto_21813 ?auto_21838 ) ) ( not ( = ?auto_21814 ?auto_21822 ) ) ( not ( = ?auto_21814 ?auto_21838 ) ) ( not ( = ?auto_21815 ?auto_21822 ) ) ( not ( = ?auto_21815 ?auto_21838 ) ) ( not ( = ?auto_21818 ?auto_21822 ) ) ( not ( = ?auto_21818 ?auto_21838 ) ) ( not ( = ?auto_21816 ?auto_21822 ) ) ( not ( = ?auto_21816 ?auto_21838 ) ) ( not ( = ?auto_21820 ?auto_21822 ) ) ( not ( = ?auto_21820 ?auto_21838 ) ) ( not ( = ?auto_21819 ?auto_21822 ) ) ( not ( = ?auto_21819 ?auto_21838 ) ) ( not ( = ?auto_21822 ?auto_21832 ) ) ( not ( = ?auto_21822 ?auto_21831 ) ) ( not ( = ?auto_21822 ?auto_21845 ) ) ( not ( = ?auto_21822 ?auto_21853 ) ) ( not ( = ?auto_21822 ?auto_21834 ) ) ( not ( = ?auto_21822 ?auto_21851 ) ) ( not ( = ?auto_21822 ?auto_21855 ) ) ( not ( = ?auto_21822 ?auto_21846 ) ) ( not ( = ?auto_21822 ?auto_21843 ) ) ( not ( = ?auto_21840 ?auto_21841 ) ) ( not ( = ?auto_21840 ?auto_21825 ) ) ( not ( = ?auto_21840 ?auto_21836 ) ) ( not ( = ?auto_21840 ?auto_21848 ) ) ( not ( = ?auto_21840 ?auto_21839 ) ) ( not ( = ?auto_21840 ?auto_21844 ) ) ( not ( = ?auto_21840 ?auto_21833 ) ) ( not ( = ?auto_21850 ?auto_21837 ) ) ( not ( = ?auto_21850 ?auto_21824 ) ) ( not ( = ?auto_21850 ?auto_21847 ) ) ( not ( = ?auto_21850 ?auto_21835 ) ) ( not ( = ?auto_21850 ?auto_21830 ) ) ( not ( = ?auto_21850 ?auto_21842 ) ) ( not ( = ?auto_21850 ?auto_21849 ) ) ( not ( = ?auto_21838 ?auto_21832 ) ) ( not ( = ?auto_21838 ?auto_21831 ) ) ( not ( = ?auto_21838 ?auto_21845 ) ) ( not ( = ?auto_21838 ?auto_21853 ) ) ( not ( = ?auto_21838 ?auto_21834 ) ) ( not ( = ?auto_21838 ?auto_21851 ) ) ( not ( = ?auto_21838 ?auto_21855 ) ) ( not ( = ?auto_21838 ?auto_21846 ) ) ( not ( = ?auto_21838 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21821 ) ) ( not ( = ?auto_21811 ?auto_21856 ) ) ( not ( = ?auto_21812 ?auto_21821 ) ) ( not ( = ?auto_21812 ?auto_21856 ) ) ( not ( = ?auto_21813 ?auto_21821 ) ) ( not ( = ?auto_21813 ?auto_21856 ) ) ( not ( = ?auto_21814 ?auto_21821 ) ) ( not ( = ?auto_21814 ?auto_21856 ) ) ( not ( = ?auto_21815 ?auto_21821 ) ) ( not ( = ?auto_21815 ?auto_21856 ) ) ( not ( = ?auto_21818 ?auto_21821 ) ) ( not ( = ?auto_21818 ?auto_21856 ) ) ( not ( = ?auto_21816 ?auto_21821 ) ) ( not ( = ?auto_21816 ?auto_21856 ) ) ( not ( = ?auto_21820 ?auto_21821 ) ) ( not ( = ?auto_21820 ?auto_21856 ) ) ( not ( = ?auto_21819 ?auto_21821 ) ) ( not ( = ?auto_21819 ?auto_21856 ) ) ( not ( = ?auto_21817 ?auto_21821 ) ) ( not ( = ?auto_21817 ?auto_21856 ) ) ( not ( = ?auto_21821 ?auto_21838 ) ) ( not ( = ?auto_21821 ?auto_21832 ) ) ( not ( = ?auto_21821 ?auto_21831 ) ) ( not ( = ?auto_21821 ?auto_21845 ) ) ( not ( = ?auto_21821 ?auto_21853 ) ) ( not ( = ?auto_21821 ?auto_21834 ) ) ( not ( = ?auto_21821 ?auto_21851 ) ) ( not ( = ?auto_21821 ?auto_21855 ) ) ( not ( = ?auto_21821 ?auto_21846 ) ) ( not ( = ?auto_21821 ?auto_21843 ) ) ( not ( = ?auto_21854 ?auto_21840 ) ) ( not ( = ?auto_21854 ?auto_21841 ) ) ( not ( = ?auto_21854 ?auto_21825 ) ) ( not ( = ?auto_21854 ?auto_21836 ) ) ( not ( = ?auto_21854 ?auto_21848 ) ) ( not ( = ?auto_21854 ?auto_21839 ) ) ( not ( = ?auto_21854 ?auto_21844 ) ) ( not ( = ?auto_21854 ?auto_21833 ) ) ( not ( = ?auto_21852 ?auto_21850 ) ) ( not ( = ?auto_21852 ?auto_21837 ) ) ( not ( = ?auto_21852 ?auto_21824 ) ) ( not ( = ?auto_21852 ?auto_21847 ) ) ( not ( = ?auto_21852 ?auto_21835 ) ) ( not ( = ?auto_21852 ?auto_21830 ) ) ( not ( = ?auto_21852 ?auto_21842 ) ) ( not ( = ?auto_21852 ?auto_21849 ) ) ( not ( = ?auto_21856 ?auto_21838 ) ) ( not ( = ?auto_21856 ?auto_21832 ) ) ( not ( = ?auto_21856 ?auto_21831 ) ) ( not ( = ?auto_21856 ?auto_21845 ) ) ( not ( = ?auto_21856 ?auto_21853 ) ) ( not ( = ?auto_21856 ?auto_21834 ) ) ( not ( = ?auto_21856 ?auto_21851 ) ) ( not ( = ?auto_21856 ?auto_21855 ) ) ( not ( = ?auto_21856 ?auto_21846 ) ) ( not ( = ?auto_21856 ?auto_21843 ) ) ( not ( = ?auto_21811 ?auto_21823 ) ) ( not ( = ?auto_21811 ?auto_21826 ) ) ( not ( = ?auto_21812 ?auto_21823 ) ) ( not ( = ?auto_21812 ?auto_21826 ) ) ( not ( = ?auto_21813 ?auto_21823 ) ) ( not ( = ?auto_21813 ?auto_21826 ) ) ( not ( = ?auto_21814 ?auto_21823 ) ) ( not ( = ?auto_21814 ?auto_21826 ) ) ( not ( = ?auto_21815 ?auto_21823 ) ) ( not ( = ?auto_21815 ?auto_21826 ) ) ( not ( = ?auto_21818 ?auto_21823 ) ) ( not ( = ?auto_21818 ?auto_21826 ) ) ( not ( = ?auto_21816 ?auto_21823 ) ) ( not ( = ?auto_21816 ?auto_21826 ) ) ( not ( = ?auto_21820 ?auto_21823 ) ) ( not ( = ?auto_21820 ?auto_21826 ) ) ( not ( = ?auto_21819 ?auto_21823 ) ) ( not ( = ?auto_21819 ?auto_21826 ) ) ( not ( = ?auto_21817 ?auto_21823 ) ) ( not ( = ?auto_21817 ?auto_21826 ) ) ( not ( = ?auto_21822 ?auto_21823 ) ) ( not ( = ?auto_21822 ?auto_21826 ) ) ( not ( = ?auto_21823 ?auto_21856 ) ) ( not ( = ?auto_21823 ?auto_21838 ) ) ( not ( = ?auto_21823 ?auto_21832 ) ) ( not ( = ?auto_21823 ?auto_21831 ) ) ( not ( = ?auto_21823 ?auto_21845 ) ) ( not ( = ?auto_21823 ?auto_21853 ) ) ( not ( = ?auto_21823 ?auto_21834 ) ) ( not ( = ?auto_21823 ?auto_21851 ) ) ( not ( = ?auto_21823 ?auto_21855 ) ) ( not ( = ?auto_21823 ?auto_21846 ) ) ( not ( = ?auto_21823 ?auto_21843 ) ) ( not ( = ?auto_21826 ?auto_21856 ) ) ( not ( = ?auto_21826 ?auto_21838 ) ) ( not ( = ?auto_21826 ?auto_21832 ) ) ( not ( = ?auto_21826 ?auto_21831 ) ) ( not ( = ?auto_21826 ?auto_21845 ) ) ( not ( = ?auto_21826 ?auto_21853 ) ) ( not ( = ?auto_21826 ?auto_21834 ) ) ( not ( = ?auto_21826 ?auto_21851 ) ) ( not ( = ?auto_21826 ?auto_21855 ) ) ( not ( = ?auto_21826 ?auto_21846 ) ) ( not ( = ?auto_21826 ?auto_21843 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21811 ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ?auto_21818 ?auto_21816 ?auto_21820 ?auto_21819 ?auto_21817 ?auto_21822 ?auto_21821 )
      ( MAKE-1CRATE ?auto_21821 ?auto_21823 )
      ( MAKE-12CRATE-VERIFY ?auto_21811 ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ?auto_21818 ?auto_21816 ?auto_21820 ?auto_21819 ?auto_21817 ?auto_21822 ?auto_21821 ?auto_21823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21859 - SURFACE
      ?auto_21860 - SURFACE
    )
    :vars
    (
      ?auto_21861 - HOIST
      ?auto_21862 - PLACE
      ?auto_21864 - PLACE
      ?auto_21865 - HOIST
      ?auto_21866 - SURFACE
      ?auto_21863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21861 ?auto_21862 ) ( SURFACE-AT ?auto_21859 ?auto_21862 ) ( CLEAR ?auto_21859 ) ( IS-CRATE ?auto_21860 ) ( AVAILABLE ?auto_21861 ) ( not ( = ?auto_21864 ?auto_21862 ) ) ( HOIST-AT ?auto_21865 ?auto_21864 ) ( AVAILABLE ?auto_21865 ) ( SURFACE-AT ?auto_21860 ?auto_21864 ) ( ON ?auto_21860 ?auto_21866 ) ( CLEAR ?auto_21860 ) ( TRUCK-AT ?auto_21863 ?auto_21862 ) ( not ( = ?auto_21859 ?auto_21860 ) ) ( not ( = ?auto_21859 ?auto_21866 ) ) ( not ( = ?auto_21860 ?auto_21866 ) ) ( not ( = ?auto_21861 ?auto_21865 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21863 ?auto_21862 ?auto_21864 )
      ( !LIFT ?auto_21865 ?auto_21860 ?auto_21866 ?auto_21864 )
      ( !LOAD ?auto_21865 ?auto_21860 ?auto_21863 ?auto_21864 )
      ( !DRIVE ?auto_21863 ?auto_21864 ?auto_21862 )
      ( !UNLOAD ?auto_21861 ?auto_21860 ?auto_21863 ?auto_21862 )
      ( !DROP ?auto_21861 ?auto_21860 ?auto_21859 ?auto_21862 )
      ( MAKE-1CRATE-VERIFY ?auto_21859 ?auto_21860 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21881 - SURFACE
      ?auto_21882 - SURFACE
      ?auto_21883 - SURFACE
      ?auto_21884 - SURFACE
      ?auto_21885 - SURFACE
      ?auto_21888 - SURFACE
      ?auto_21886 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21889 - SURFACE
      ?auto_21887 - SURFACE
      ?auto_21892 - SURFACE
      ?auto_21891 - SURFACE
      ?auto_21893 - SURFACE
      ?auto_21894 - SURFACE
    )
    :vars
    (
      ?auto_21900 - HOIST
      ?auto_21895 - PLACE
      ?auto_21896 - PLACE
      ?auto_21899 - HOIST
      ?auto_21897 - SURFACE
      ?auto_21917 - SURFACE
      ?auto_21924 - PLACE
      ?auto_21912 - HOIST
      ?auto_21914 - SURFACE
      ?auto_21915 - PLACE
      ?auto_21903 - HOIST
      ?auto_21904 - SURFACE
      ?auto_21901 - PLACE
      ?auto_21926 - HOIST
      ?auto_21919 - SURFACE
      ?auto_21905 - SURFACE
      ?auto_21906 - PLACE
      ?auto_21910 - HOIST
      ?auto_21902 - SURFACE
      ?auto_21916 - PLACE
      ?auto_21921 - HOIST
      ?auto_21908 - SURFACE
      ?auto_21920 - PLACE
      ?auto_21923 - HOIST
      ?auto_21928 - SURFACE
      ?auto_21927 - SURFACE
      ?auto_21911 - PLACE
      ?auto_21907 - HOIST
      ?auto_21909 - SURFACE
      ?auto_21918 - SURFACE
      ?auto_21922 - PLACE
      ?auto_21913 - HOIST
      ?auto_21925 - SURFACE
      ?auto_21898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21900 ?auto_21895 ) ( IS-CRATE ?auto_21894 ) ( not ( = ?auto_21896 ?auto_21895 ) ) ( HOIST-AT ?auto_21899 ?auto_21896 ) ( SURFACE-AT ?auto_21894 ?auto_21896 ) ( ON ?auto_21894 ?auto_21897 ) ( CLEAR ?auto_21894 ) ( not ( = ?auto_21893 ?auto_21894 ) ) ( not ( = ?auto_21893 ?auto_21897 ) ) ( not ( = ?auto_21894 ?auto_21897 ) ) ( not ( = ?auto_21900 ?auto_21899 ) ) ( IS-CRATE ?auto_21893 ) ( SURFACE-AT ?auto_21893 ?auto_21896 ) ( ON ?auto_21893 ?auto_21917 ) ( CLEAR ?auto_21893 ) ( not ( = ?auto_21891 ?auto_21893 ) ) ( not ( = ?auto_21891 ?auto_21917 ) ) ( not ( = ?auto_21893 ?auto_21917 ) ) ( IS-CRATE ?auto_21891 ) ( not ( = ?auto_21924 ?auto_21895 ) ) ( HOIST-AT ?auto_21912 ?auto_21924 ) ( AVAILABLE ?auto_21912 ) ( SURFACE-AT ?auto_21891 ?auto_21924 ) ( ON ?auto_21891 ?auto_21914 ) ( CLEAR ?auto_21891 ) ( not ( = ?auto_21892 ?auto_21891 ) ) ( not ( = ?auto_21892 ?auto_21914 ) ) ( not ( = ?auto_21891 ?auto_21914 ) ) ( not ( = ?auto_21900 ?auto_21912 ) ) ( IS-CRATE ?auto_21892 ) ( not ( = ?auto_21915 ?auto_21895 ) ) ( HOIST-AT ?auto_21903 ?auto_21915 ) ( AVAILABLE ?auto_21903 ) ( SURFACE-AT ?auto_21892 ?auto_21915 ) ( ON ?auto_21892 ?auto_21904 ) ( CLEAR ?auto_21892 ) ( not ( = ?auto_21887 ?auto_21892 ) ) ( not ( = ?auto_21887 ?auto_21904 ) ) ( not ( = ?auto_21892 ?auto_21904 ) ) ( not ( = ?auto_21900 ?auto_21903 ) ) ( IS-CRATE ?auto_21887 ) ( not ( = ?auto_21901 ?auto_21895 ) ) ( HOIST-AT ?auto_21926 ?auto_21901 ) ( AVAILABLE ?auto_21926 ) ( SURFACE-AT ?auto_21887 ?auto_21901 ) ( ON ?auto_21887 ?auto_21919 ) ( CLEAR ?auto_21887 ) ( not ( = ?auto_21889 ?auto_21887 ) ) ( not ( = ?auto_21889 ?auto_21919 ) ) ( not ( = ?auto_21887 ?auto_21919 ) ) ( not ( = ?auto_21900 ?auto_21926 ) ) ( IS-CRATE ?auto_21889 ) ( AVAILABLE ?auto_21899 ) ( SURFACE-AT ?auto_21889 ?auto_21896 ) ( ON ?auto_21889 ?auto_21905 ) ( CLEAR ?auto_21889 ) ( not ( = ?auto_21890 ?auto_21889 ) ) ( not ( = ?auto_21890 ?auto_21905 ) ) ( not ( = ?auto_21889 ?auto_21905 ) ) ( IS-CRATE ?auto_21890 ) ( not ( = ?auto_21906 ?auto_21895 ) ) ( HOIST-AT ?auto_21910 ?auto_21906 ) ( AVAILABLE ?auto_21910 ) ( SURFACE-AT ?auto_21890 ?auto_21906 ) ( ON ?auto_21890 ?auto_21902 ) ( CLEAR ?auto_21890 ) ( not ( = ?auto_21886 ?auto_21890 ) ) ( not ( = ?auto_21886 ?auto_21902 ) ) ( not ( = ?auto_21890 ?auto_21902 ) ) ( not ( = ?auto_21900 ?auto_21910 ) ) ( IS-CRATE ?auto_21886 ) ( not ( = ?auto_21916 ?auto_21895 ) ) ( HOIST-AT ?auto_21921 ?auto_21916 ) ( SURFACE-AT ?auto_21886 ?auto_21916 ) ( ON ?auto_21886 ?auto_21908 ) ( CLEAR ?auto_21886 ) ( not ( = ?auto_21888 ?auto_21886 ) ) ( not ( = ?auto_21888 ?auto_21908 ) ) ( not ( = ?auto_21886 ?auto_21908 ) ) ( not ( = ?auto_21900 ?auto_21921 ) ) ( IS-CRATE ?auto_21888 ) ( not ( = ?auto_21920 ?auto_21895 ) ) ( HOIST-AT ?auto_21923 ?auto_21920 ) ( AVAILABLE ?auto_21923 ) ( SURFACE-AT ?auto_21888 ?auto_21920 ) ( ON ?auto_21888 ?auto_21928 ) ( CLEAR ?auto_21888 ) ( not ( = ?auto_21885 ?auto_21888 ) ) ( not ( = ?auto_21885 ?auto_21928 ) ) ( not ( = ?auto_21888 ?auto_21928 ) ) ( not ( = ?auto_21900 ?auto_21923 ) ) ( IS-CRATE ?auto_21885 ) ( AVAILABLE ?auto_21921 ) ( SURFACE-AT ?auto_21885 ?auto_21916 ) ( ON ?auto_21885 ?auto_21927 ) ( CLEAR ?auto_21885 ) ( not ( = ?auto_21884 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21927 ) ) ( not ( = ?auto_21885 ?auto_21927 ) ) ( IS-CRATE ?auto_21884 ) ( not ( = ?auto_21911 ?auto_21895 ) ) ( HOIST-AT ?auto_21907 ?auto_21911 ) ( SURFACE-AT ?auto_21884 ?auto_21911 ) ( ON ?auto_21884 ?auto_21909 ) ( CLEAR ?auto_21884 ) ( not ( = ?auto_21883 ?auto_21884 ) ) ( not ( = ?auto_21883 ?auto_21909 ) ) ( not ( = ?auto_21884 ?auto_21909 ) ) ( not ( = ?auto_21900 ?auto_21907 ) ) ( IS-CRATE ?auto_21883 ) ( AVAILABLE ?auto_21907 ) ( SURFACE-AT ?auto_21883 ?auto_21911 ) ( ON ?auto_21883 ?auto_21918 ) ( CLEAR ?auto_21883 ) ( not ( = ?auto_21882 ?auto_21883 ) ) ( not ( = ?auto_21882 ?auto_21918 ) ) ( not ( = ?auto_21883 ?auto_21918 ) ) ( SURFACE-AT ?auto_21881 ?auto_21895 ) ( CLEAR ?auto_21881 ) ( IS-CRATE ?auto_21882 ) ( AVAILABLE ?auto_21900 ) ( not ( = ?auto_21922 ?auto_21895 ) ) ( HOIST-AT ?auto_21913 ?auto_21922 ) ( AVAILABLE ?auto_21913 ) ( SURFACE-AT ?auto_21882 ?auto_21922 ) ( ON ?auto_21882 ?auto_21925 ) ( CLEAR ?auto_21882 ) ( TRUCK-AT ?auto_21898 ?auto_21895 ) ( not ( = ?auto_21881 ?auto_21882 ) ) ( not ( = ?auto_21881 ?auto_21925 ) ) ( not ( = ?auto_21882 ?auto_21925 ) ) ( not ( = ?auto_21900 ?auto_21913 ) ) ( not ( = ?auto_21881 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21918 ) ) ( not ( = ?auto_21883 ?auto_21925 ) ) ( not ( = ?auto_21911 ?auto_21922 ) ) ( not ( = ?auto_21907 ?auto_21913 ) ) ( not ( = ?auto_21918 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21884 ) ) ( not ( = ?auto_21881 ?auto_21909 ) ) ( not ( = ?auto_21882 ?auto_21884 ) ) ( not ( = ?auto_21882 ?auto_21909 ) ) ( not ( = ?auto_21884 ?auto_21918 ) ) ( not ( = ?auto_21884 ?auto_21925 ) ) ( not ( = ?auto_21909 ?auto_21918 ) ) ( not ( = ?auto_21909 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21885 ) ) ( not ( = ?auto_21881 ?auto_21927 ) ) ( not ( = ?auto_21882 ?auto_21885 ) ) ( not ( = ?auto_21882 ?auto_21927 ) ) ( not ( = ?auto_21883 ?auto_21885 ) ) ( not ( = ?auto_21883 ?auto_21927 ) ) ( not ( = ?auto_21885 ?auto_21909 ) ) ( not ( = ?auto_21885 ?auto_21918 ) ) ( not ( = ?auto_21885 ?auto_21925 ) ) ( not ( = ?auto_21916 ?auto_21911 ) ) ( not ( = ?auto_21916 ?auto_21922 ) ) ( not ( = ?auto_21921 ?auto_21907 ) ) ( not ( = ?auto_21921 ?auto_21913 ) ) ( not ( = ?auto_21927 ?auto_21909 ) ) ( not ( = ?auto_21927 ?auto_21918 ) ) ( not ( = ?auto_21927 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21888 ) ) ( not ( = ?auto_21881 ?auto_21928 ) ) ( not ( = ?auto_21882 ?auto_21888 ) ) ( not ( = ?auto_21882 ?auto_21928 ) ) ( not ( = ?auto_21883 ?auto_21888 ) ) ( not ( = ?auto_21883 ?auto_21928 ) ) ( not ( = ?auto_21884 ?auto_21888 ) ) ( not ( = ?auto_21884 ?auto_21928 ) ) ( not ( = ?auto_21888 ?auto_21927 ) ) ( not ( = ?auto_21888 ?auto_21909 ) ) ( not ( = ?auto_21888 ?auto_21918 ) ) ( not ( = ?auto_21888 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21916 ) ) ( not ( = ?auto_21920 ?auto_21911 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( not ( = ?auto_21923 ?auto_21907 ) ) ( not ( = ?auto_21923 ?auto_21913 ) ) ( not ( = ?auto_21928 ?auto_21927 ) ) ( not ( = ?auto_21928 ?auto_21909 ) ) ( not ( = ?auto_21928 ?auto_21918 ) ) ( not ( = ?auto_21928 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21886 ) ) ( not ( = ?auto_21881 ?auto_21908 ) ) ( not ( = ?auto_21882 ?auto_21886 ) ) ( not ( = ?auto_21882 ?auto_21908 ) ) ( not ( = ?auto_21883 ?auto_21886 ) ) ( not ( = ?auto_21883 ?auto_21908 ) ) ( not ( = ?auto_21884 ?auto_21886 ) ) ( not ( = ?auto_21884 ?auto_21908 ) ) ( not ( = ?auto_21885 ?auto_21886 ) ) ( not ( = ?auto_21885 ?auto_21908 ) ) ( not ( = ?auto_21886 ?auto_21928 ) ) ( not ( = ?auto_21886 ?auto_21927 ) ) ( not ( = ?auto_21886 ?auto_21909 ) ) ( not ( = ?auto_21886 ?auto_21918 ) ) ( not ( = ?auto_21886 ?auto_21925 ) ) ( not ( = ?auto_21908 ?auto_21928 ) ) ( not ( = ?auto_21908 ?auto_21927 ) ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( not ( = ?auto_21908 ?auto_21918 ) ) ( not ( = ?auto_21908 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21890 ) ) ( not ( = ?auto_21881 ?auto_21902 ) ) ( not ( = ?auto_21882 ?auto_21890 ) ) ( not ( = ?auto_21882 ?auto_21902 ) ) ( not ( = ?auto_21883 ?auto_21890 ) ) ( not ( = ?auto_21883 ?auto_21902 ) ) ( not ( = ?auto_21884 ?auto_21890 ) ) ( not ( = ?auto_21884 ?auto_21902 ) ) ( not ( = ?auto_21885 ?auto_21890 ) ) ( not ( = ?auto_21885 ?auto_21902 ) ) ( not ( = ?auto_21888 ?auto_21890 ) ) ( not ( = ?auto_21888 ?auto_21902 ) ) ( not ( = ?auto_21890 ?auto_21908 ) ) ( not ( = ?auto_21890 ?auto_21928 ) ) ( not ( = ?auto_21890 ?auto_21927 ) ) ( not ( = ?auto_21890 ?auto_21909 ) ) ( not ( = ?auto_21890 ?auto_21918 ) ) ( not ( = ?auto_21890 ?auto_21925 ) ) ( not ( = ?auto_21906 ?auto_21916 ) ) ( not ( = ?auto_21906 ?auto_21920 ) ) ( not ( = ?auto_21906 ?auto_21911 ) ) ( not ( = ?auto_21906 ?auto_21922 ) ) ( not ( = ?auto_21910 ?auto_21921 ) ) ( not ( = ?auto_21910 ?auto_21923 ) ) ( not ( = ?auto_21910 ?auto_21907 ) ) ( not ( = ?auto_21910 ?auto_21913 ) ) ( not ( = ?auto_21902 ?auto_21908 ) ) ( not ( = ?auto_21902 ?auto_21928 ) ) ( not ( = ?auto_21902 ?auto_21927 ) ) ( not ( = ?auto_21902 ?auto_21909 ) ) ( not ( = ?auto_21902 ?auto_21918 ) ) ( not ( = ?auto_21902 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21889 ) ) ( not ( = ?auto_21881 ?auto_21905 ) ) ( not ( = ?auto_21882 ?auto_21889 ) ) ( not ( = ?auto_21882 ?auto_21905 ) ) ( not ( = ?auto_21883 ?auto_21889 ) ) ( not ( = ?auto_21883 ?auto_21905 ) ) ( not ( = ?auto_21884 ?auto_21889 ) ) ( not ( = ?auto_21884 ?auto_21905 ) ) ( not ( = ?auto_21885 ?auto_21889 ) ) ( not ( = ?auto_21885 ?auto_21905 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21905 ) ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21886 ?auto_21905 ) ) ( not ( = ?auto_21889 ?auto_21902 ) ) ( not ( = ?auto_21889 ?auto_21908 ) ) ( not ( = ?auto_21889 ?auto_21928 ) ) ( not ( = ?auto_21889 ?auto_21927 ) ) ( not ( = ?auto_21889 ?auto_21909 ) ) ( not ( = ?auto_21889 ?auto_21918 ) ) ( not ( = ?auto_21889 ?auto_21925 ) ) ( not ( = ?auto_21896 ?auto_21906 ) ) ( not ( = ?auto_21896 ?auto_21916 ) ) ( not ( = ?auto_21896 ?auto_21920 ) ) ( not ( = ?auto_21896 ?auto_21911 ) ) ( not ( = ?auto_21896 ?auto_21922 ) ) ( not ( = ?auto_21899 ?auto_21910 ) ) ( not ( = ?auto_21899 ?auto_21921 ) ) ( not ( = ?auto_21899 ?auto_21923 ) ) ( not ( = ?auto_21899 ?auto_21907 ) ) ( not ( = ?auto_21899 ?auto_21913 ) ) ( not ( = ?auto_21905 ?auto_21902 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( not ( = ?auto_21905 ?auto_21928 ) ) ( not ( = ?auto_21905 ?auto_21927 ) ) ( not ( = ?auto_21905 ?auto_21909 ) ) ( not ( = ?auto_21905 ?auto_21918 ) ) ( not ( = ?auto_21905 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21887 ) ) ( not ( = ?auto_21881 ?auto_21919 ) ) ( not ( = ?auto_21882 ?auto_21887 ) ) ( not ( = ?auto_21882 ?auto_21919 ) ) ( not ( = ?auto_21883 ?auto_21887 ) ) ( not ( = ?auto_21883 ?auto_21919 ) ) ( not ( = ?auto_21884 ?auto_21887 ) ) ( not ( = ?auto_21884 ?auto_21919 ) ) ( not ( = ?auto_21885 ?auto_21887 ) ) ( not ( = ?auto_21885 ?auto_21919 ) ) ( not ( = ?auto_21888 ?auto_21887 ) ) ( not ( = ?auto_21888 ?auto_21919 ) ) ( not ( = ?auto_21886 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21919 ) ) ( not ( = ?auto_21890 ?auto_21887 ) ) ( not ( = ?auto_21890 ?auto_21919 ) ) ( not ( = ?auto_21887 ?auto_21905 ) ) ( not ( = ?auto_21887 ?auto_21902 ) ) ( not ( = ?auto_21887 ?auto_21908 ) ) ( not ( = ?auto_21887 ?auto_21928 ) ) ( not ( = ?auto_21887 ?auto_21927 ) ) ( not ( = ?auto_21887 ?auto_21909 ) ) ( not ( = ?auto_21887 ?auto_21918 ) ) ( not ( = ?auto_21887 ?auto_21925 ) ) ( not ( = ?auto_21901 ?auto_21896 ) ) ( not ( = ?auto_21901 ?auto_21906 ) ) ( not ( = ?auto_21901 ?auto_21916 ) ) ( not ( = ?auto_21901 ?auto_21920 ) ) ( not ( = ?auto_21901 ?auto_21911 ) ) ( not ( = ?auto_21901 ?auto_21922 ) ) ( not ( = ?auto_21926 ?auto_21899 ) ) ( not ( = ?auto_21926 ?auto_21910 ) ) ( not ( = ?auto_21926 ?auto_21921 ) ) ( not ( = ?auto_21926 ?auto_21923 ) ) ( not ( = ?auto_21926 ?auto_21907 ) ) ( not ( = ?auto_21926 ?auto_21913 ) ) ( not ( = ?auto_21919 ?auto_21905 ) ) ( not ( = ?auto_21919 ?auto_21902 ) ) ( not ( = ?auto_21919 ?auto_21908 ) ) ( not ( = ?auto_21919 ?auto_21928 ) ) ( not ( = ?auto_21919 ?auto_21927 ) ) ( not ( = ?auto_21919 ?auto_21909 ) ) ( not ( = ?auto_21919 ?auto_21918 ) ) ( not ( = ?auto_21919 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21892 ) ) ( not ( = ?auto_21881 ?auto_21904 ) ) ( not ( = ?auto_21882 ?auto_21892 ) ) ( not ( = ?auto_21882 ?auto_21904 ) ) ( not ( = ?auto_21883 ?auto_21892 ) ) ( not ( = ?auto_21883 ?auto_21904 ) ) ( not ( = ?auto_21884 ?auto_21892 ) ) ( not ( = ?auto_21884 ?auto_21904 ) ) ( not ( = ?auto_21885 ?auto_21892 ) ) ( not ( = ?auto_21885 ?auto_21904 ) ) ( not ( = ?auto_21888 ?auto_21892 ) ) ( not ( = ?auto_21888 ?auto_21904 ) ) ( not ( = ?auto_21886 ?auto_21892 ) ) ( not ( = ?auto_21886 ?auto_21904 ) ) ( not ( = ?auto_21890 ?auto_21892 ) ) ( not ( = ?auto_21890 ?auto_21904 ) ) ( not ( = ?auto_21889 ?auto_21892 ) ) ( not ( = ?auto_21889 ?auto_21904 ) ) ( not ( = ?auto_21892 ?auto_21919 ) ) ( not ( = ?auto_21892 ?auto_21905 ) ) ( not ( = ?auto_21892 ?auto_21902 ) ) ( not ( = ?auto_21892 ?auto_21908 ) ) ( not ( = ?auto_21892 ?auto_21928 ) ) ( not ( = ?auto_21892 ?auto_21927 ) ) ( not ( = ?auto_21892 ?auto_21909 ) ) ( not ( = ?auto_21892 ?auto_21918 ) ) ( not ( = ?auto_21892 ?auto_21925 ) ) ( not ( = ?auto_21915 ?auto_21901 ) ) ( not ( = ?auto_21915 ?auto_21896 ) ) ( not ( = ?auto_21915 ?auto_21906 ) ) ( not ( = ?auto_21915 ?auto_21916 ) ) ( not ( = ?auto_21915 ?auto_21920 ) ) ( not ( = ?auto_21915 ?auto_21911 ) ) ( not ( = ?auto_21915 ?auto_21922 ) ) ( not ( = ?auto_21903 ?auto_21926 ) ) ( not ( = ?auto_21903 ?auto_21899 ) ) ( not ( = ?auto_21903 ?auto_21910 ) ) ( not ( = ?auto_21903 ?auto_21921 ) ) ( not ( = ?auto_21903 ?auto_21923 ) ) ( not ( = ?auto_21903 ?auto_21907 ) ) ( not ( = ?auto_21903 ?auto_21913 ) ) ( not ( = ?auto_21904 ?auto_21919 ) ) ( not ( = ?auto_21904 ?auto_21905 ) ) ( not ( = ?auto_21904 ?auto_21902 ) ) ( not ( = ?auto_21904 ?auto_21908 ) ) ( not ( = ?auto_21904 ?auto_21928 ) ) ( not ( = ?auto_21904 ?auto_21927 ) ) ( not ( = ?auto_21904 ?auto_21909 ) ) ( not ( = ?auto_21904 ?auto_21918 ) ) ( not ( = ?auto_21904 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21891 ) ) ( not ( = ?auto_21881 ?auto_21914 ) ) ( not ( = ?auto_21882 ?auto_21891 ) ) ( not ( = ?auto_21882 ?auto_21914 ) ) ( not ( = ?auto_21883 ?auto_21891 ) ) ( not ( = ?auto_21883 ?auto_21914 ) ) ( not ( = ?auto_21884 ?auto_21891 ) ) ( not ( = ?auto_21884 ?auto_21914 ) ) ( not ( = ?auto_21885 ?auto_21891 ) ) ( not ( = ?auto_21885 ?auto_21914 ) ) ( not ( = ?auto_21888 ?auto_21891 ) ) ( not ( = ?auto_21888 ?auto_21914 ) ) ( not ( = ?auto_21886 ?auto_21891 ) ) ( not ( = ?auto_21886 ?auto_21914 ) ) ( not ( = ?auto_21890 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21914 ) ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( not ( = ?auto_21889 ?auto_21914 ) ) ( not ( = ?auto_21887 ?auto_21891 ) ) ( not ( = ?auto_21887 ?auto_21914 ) ) ( not ( = ?auto_21891 ?auto_21904 ) ) ( not ( = ?auto_21891 ?auto_21919 ) ) ( not ( = ?auto_21891 ?auto_21905 ) ) ( not ( = ?auto_21891 ?auto_21902 ) ) ( not ( = ?auto_21891 ?auto_21908 ) ) ( not ( = ?auto_21891 ?auto_21928 ) ) ( not ( = ?auto_21891 ?auto_21927 ) ) ( not ( = ?auto_21891 ?auto_21909 ) ) ( not ( = ?auto_21891 ?auto_21918 ) ) ( not ( = ?auto_21891 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21915 ) ) ( not ( = ?auto_21924 ?auto_21901 ) ) ( not ( = ?auto_21924 ?auto_21896 ) ) ( not ( = ?auto_21924 ?auto_21906 ) ) ( not ( = ?auto_21924 ?auto_21916 ) ) ( not ( = ?auto_21924 ?auto_21920 ) ) ( not ( = ?auto_21924 ?auto_21911 ) ) ( not ( = ?auto_21924 ?auto_21922 ) ) ( not ( = ?auto_21912 ?auto_21903 ) ) ( not ( = ?auto_21912 ?auto_21926 ) ) ( not ( = ?auto_21912 ?auto_21899 ) ) ( not ( = ?auto_21912 ?auto_21910 ) ) ( not ( = ?auto_21912 ?auto_21921 ) ) ( not ( = ?auto_21912 ?auto_21923 ) ) ( not ( = ?auto_21912 ?auto_21907 ) ) ( not ( = ?auto_21912 ?auto_21913 ) ) ( not ( = ?auto_21914 ?auto_21904 ) ) ( not ( = ?auto_21914 ?auto_21919 ) ) ( not ( = ?auto_21914 ?auto_21905 ) ) ( not ( = ?auto_21914 ?auto_21902 ) ) ( not ( = ?auto_21914 ?auto_21908 ) ) ( not ( = ?auto_21914 ?auto_21928 ) ) ( not ( = ?auto_21914 ?auto_21927 ) ) ( not ( = ?auto_21914 ?auto_21909 ) ) ( not ( = ?auto_21914 ?auto_21918 ) ) ( not ( = ?auto_21914 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21893 ) ) ( not ( = ?auto_21881 ?auto_21917 ) ) ( not ( = ?auto_21882 ?auto_21893 ) ) ( not ( = ?auto_21882 ?auto_21917 ) ) ( not ( = ?auto_21883 ?auto_21893 ) ) ( not ( = ?auto_21883 ?auto_21917 ) ) ( not ( = ?auto_21884 ?auto_21893 ) ) ( not ( = ?auto_21884 ?auto_21917 ) ) ( not ( = ?auto_21885 ?auto_21893 ) ) ( not ( = ?auto_21885 ?auto_21917 ) ) ( not ( = ?auto_21888 ?auto_21893 ) ) ( not ( = ?auto_21888 ?auto_21917 ) ) ( not ( = ?auto_21886 ?auto_21893 ) ) ( not ( = ?auto_21886 ?auto_21917 ) ) ( not ( = ?auto_21890 ?auto_21893 ) ) ( not ( = ?auto_21890 ?auto_21917 ) ) ( not ( = ?auto_21889 ?auto_21893 ) ) ( not ( = ?auto_21889 ?auto_21917 ) ) ( not ( = ?auto_21887 ?auto_21893 ) ) ( not ( = ?auto_21887 ?auto_21917 ) ) ( not ( = ?auto_21892 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21917 ) ) ( not ( = ?auto_21893 ?auto_21914 ) ) ( not ( = ?auto_21893 ?auto_21904 ) ) ( not ( = ?auto_21893 ?auto_21919 ) ) ( not ( = ?auto_21893 ?auto_21905 ) ) ( not ( = ?auto_21893 ?auto_21902 ) ) ( not ( = ?auto_21893 ?auto_21908 ) ) ( not ( = ?auto_21893 ?auto_21928 ) ) ( not ( = ?auto_21893 ?auto_21927 ) ) ( not ( = ?auto_21893 ?auto_21909 ) ) ( not ( = ?auto_21893 ?auto_21918 ) ) ( not ( = ?auto_21893 ?auto_21925 ) ) ( not ( = ?auto_21917 ?auto_21914 ) ) ( not ( = ?auto_21917 ?auto_21904 ) ) ( not ( = ?auto_21917 ?auto_21919 ) ) ( not ( = ?auto_21917 ?auto_21905 ) ) ( not ( = ?auto_21917 ?auto_21902 ) ) ( not ( = ?auto_21917 ?auto_21908 ) ) ( not ( = ?auto_21917 ?auto_21928 ) ) ( not ( = ?auto_21917 ?auto_21927 ) ) ( not ( = ?auto_21917 ?auto_21909 ) ) ( not ( = ?auto_21917 ?auto_21918 ) ) ( not ( = ?auto_21917 ?auto_21925 ) ) ( not ( = ?auto_21881 ?auto_21894 ) ) ( not ( = ?auto_21881 ?auto_21897 ) ) ( not ( = ?auto_21882 ?auto_21894 ) ) ( not ( = ?auto_21882 ?auto_21897 ) ) ( not ( = ?auto_21883 ?auto_21894 ) ) ( not ( = ?auto_21883 ?auto_21897 ) ) ( not ( = ?auto_21884 ?auto_21894 ) ) ( not ( = ?auto_21884 ?auto_21897 ) ) ( not ( = ?auto_21885 ?auto_21894 ) ) ( not ( = ?auto_21885 ?auto_21897 ) ) ( not ( = ?auto_21888 ?auto_21894 ) ) ( not ( = ?auto_21888 ?auto_21897 ) ) ( not ( = ?auto_21886 ?auto_21894 ) ) ( not ( = ?auto_21886 ?auto_21897 ) ) ( not ( = ?auto_21890 ?auto_21894 ) ) ( not ( = ?auto_21890 ?auto_21897 ) ) ( not ( = ?auto_21889 ?auto_21894 ) ) ( not ( = ?auto_21889 ?auto_21897 ) ) ( not ( = ?auto_21887 ?auto_21894 ) ) ( not ( = ?auto_21887 ?auto_21897 ) ) ( not ( = ?auto_21892 ?auto_21894 ) ) ( not ( = ?auto_21892 ?auto_21897 ) ) ( not ( = ?auto_21891 ?auto_21894 ) ) ( not ( = ?auto_21891 ?auto_21897 ) ) ( not ( = ?auto_21894 ?auto_21917 ) ) ( not ( = ?auto_21894 ?auto_21914 ) ) ( not ( = ?auto_21894 ?auto_21904 ) ) ( not ( = ?auto_21894 ?auto_21919 ) ) ( not ( = ?auto_21894 ?auto_21905 ) ) ( not ( = ?auto_21894 ?auto_21902 ) ) ( not ( = ?auto_21894 ?auto_21908 ) ) ( not ( = ?auto_21894 ?auto_21928 ) ) ( not ( = ?auto_21894 ?auto_21927 ) ) ( not ( = ?auto_21894 ?auto_21909 ) ) ( not ( = ?auto_21894 ?auto_21918 ) ) ( not ( = ?auto_21894 ?auto_21925 ) ) ( not ( = ?auto_21897 ?auto_21917 ) ) ( not ( = ?auto_21897 ?auto_21914 ) ) ( not ( = ?auto_21897 ?auto_21904 ) ) ( not ( = ?auto_21897 ?auto_21919 ) ) ( not ( = ?auto_21897 ?auto_21905 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21897 ?auto_21908 ) ) ( not ( = ?auto_21897 ?auto_21928 ) ) ( not ( = ?auto_21897 ?auto_21927 ) ) ( not ( = ?auto_21897 ?auto_21909 ) ) ( not ( = ?auto_21897 ?auto_21918 ) ) ( not ( = ?auto_21897 ?auto_21925 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21881 ?auto_21882 ?auto_21883 ?auto_21884 ?auto_21885 ?auto_21888 ?auto_21886 ?auto_21890 ?auto_21889 ?auto_21887 ?auto_21892 ?auto_21891 ?auto_21893 )
      ( MAKE-1CRATE ?auto_21893 ?auto_21894 )
      ( MAKE-13CRATE-VERIFY ?auto_21881 ?auto_21882 ?auto_21883 ?auto_21884 ?auto_21885 ?auto_21888 ?auto_21886 ?auto_21890 ?auto_21889 ?auto_21887 ?auto_21892 ?auto_21891 ?auto_21893 ?auto_21894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21931 - SURFACE
      ?auto_21932 - SURFACE
    )
    :vars
    (
      ?auto_21933 - HOIST
      ?auto_21934 - PLACE
      ?auto_21936 - PLACE
      ?auto_21937 - HOIST
      ?auto_21938 - SURFACE
      ?auto_21935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21933 ?auto_21934 ) ( SURFACE-AT ?auto_21931 ?auto_21934 ) ( CLEAR ?auto_21931 ) ( IS-CRATE ?auto_21932 ) ( AVAILABLE ?auto_21933 ) ( not ( = ?auto_21936 ?auto_21934 ) ) ( HOIST-AT ?auto_21937 ?auto_21936 ) ( AVAILABLE ?auto_21937 ) ( SURFACE-AT ?auto_21932 ?auto_21936 ) ( ON ?auto_21932 ?auto_21938 ) ( CLEAR ?auto_21932 ) ( TRUCK-AT ?auto_21935 ?auto_21934 ) ( not ( = ?auto_21931 ?auto_21932 ) ) ( not ( = ?auto_21931 ?auto_21938 ) ) ( not ( = ?auto_21932 ?auto_21938 ) ) ( not ( = ?auto_21933 ?auto_21937 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21935 ?auto_21934 ?auto_21936 )
      ( !LIFT ?auto_21937 ?auto_21932 ?auto_21938 ?auto_21936 )
      ( !LOAD ?auto_21937 ?auto_21932 ?auto_21935 ?auto_21936 )
      ( !DRIVE ?auto_21935 ?auto_21936 ?auto_21934 )
      ( !UNLOAD ?auto_21933 ?auto_21932 ?auto_21935 ?auto_21934 )
      ( !DROP ?auto_21933 ?auto_21932 ?auto_21931 ?auto_21934 )
      ( MAKE-1CRATE-VERIFY ?auto_21931 ?auto_21932 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21954 - SURFACE
      ?auto_21955 - SURFACE
      ?auto_21956 - SURFACE
      ?auto_21957 - SURFACE
      ?auto_21958 - SURFACE
      ?auto_21961 - SURFACE
      ?auto_21959 - SURFACE
      ?auto_21963 - SURFACE
      ?auto_21962 - SURFACE
      ?auto_21960 - SURFACE
      ?auto_21965 - SURFACE
      ?auto_21964 - SURFACE
      ?auto_21966 - SURFACE
      ?auto_21967 - SURFACE
      ?auto_21968 - SURFACE
    )
    :vars
    (
      ?auto_21973 - HOIST
      ?auto_21970 - PLACE
      ?auto_21972 - PLACE
      ?auto_21971 - HOIST
      ?auto_21974 - SURFACE
      ?auto_21984 - PLACE
      ?auto_21992 - HOIST
      ?auto_22000 - SURFACE
      ?auto_22004 - SURFACE
      ?auto_21995 - PLACE
      ?auto_21981 - HOIST
      ?auto_21980 - SURFACE
      ?auto_21975 - PLACE
      ?auto_21999 - HOIST
      ?auto_21997 - SURFACE
      ?auto_21983 - PLACE
      ?auto_21987 - HOIST
      ?auto_21990 - SURFACE
      ?auto_21998 - SURFACE
      ?auto_21978 - PLACE
      ?auto_21993 - HOIST
      ?auto_22001 - SURFACE
      ?auto_22005 - PLACE
      ?auto_21989 - HOIST
      ?auto_21988 - SURFACE
      ?auto_21996 - PLACE
      ?auto_21991 - HOIST
      ?auto_21982 - SURFACE
      ?auto_21986 - SURFACE
      ?auto_21977 - PLACE
      ?auto_22002 - HOIST
      ?auto_21979 - SURFACE
      ?auto_21994 - SURFACE
      ?auto_22003 - PLACE
      ?auto_21976 - HOIST
      ?auto_21985 - SURFACE
      ?auto_21969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21973 ?auto_21970 ) ( IS-CRATE ?auto_21968 ) ( not ( = ?auto_21972 ?auto_21970 ) ) ( HOIST-AT ?auto_21971 ?auto_21972 ) ( AVAILABLE ?auto_21971 ) ( SURFACE-AT ?auto_21968 ?auto_21972 ) ( ON ?auto_21968 ?auto_21974 ) ( CLEAR ?auto_21968 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21974 ) ) ( not ( = ?auto_21968 ?auto_21974 ) ) ( not ( = ?auto_21973 ?auto_21971 ) ) ( IS-CRATE ?auto_21967 ) ( not ( = ?auto_21984 ?auto_21970 ) ) ( HOIST-AT ?auto_21992 ?auto_21984 ) ( SURFACE-AT ?auto_21967 ?auto_21984 ) ( ON ?auto_21967 ?auto_22000 ) ( CLEAR ?auto_21967 ) ( not ( = ?auto_21966 ?auto_21967 ) ) ( not ( = ?auto_21966 ?auto_22000 ) ) ( not ( = ?auto_21967 ?auto_22000 ) ) ( not ( = ?auto_21973 ?auto_21992 ) ) ( IS-CRATE ?auto_21966 ) ( SURFACE-AT ?auto_21966 ?auto_21984 ) ( ON ?auto_21966 ?auto_22004 ) ( CLEAR ?auto_21966 ) ( not ( = ?auto_21964 ?auto_21966 ) ) ( not ( = ?auto_21964 ?auto_22004 ) ) ( not ( = ?auto_21966 ?auto_22004 ) ) ( IS-CRATE ?auto_21964 ) ( not ( = ?auto_21995 ?auto_21970 ) ) ( HOIST-AT ?auto_21981 ?auto_21995 ) ( AVAILABLE ?auto_21981 ) ( SURFACE-AT ?auto_21964 ?auto_21995 ) ( ON ?auto_21964 ?auto_21980 ) ( CLEAR ?auto_21964 ) ( not ( = ?auto_21965 ?auto_21964 ) ) ( not ( = ?auto_21965 ?auto_21980 ) ) ( not ( = ?auto_21964 ?auto_21980 ) ) ( not ( = ?auto_21973 ?auto_21981 ) ) ( IS-CRATE ?auto_21965 ) ( not ( = ?auto_21975 ?auto_21970 ) ) ( HOIST-AT ?auto_21999 ?auto_21975 ) ( AVAILABLE ?auto_21999 ) ( SURFACE-AT ?auto_21965 ?auto_21975 ) ( ON ?auto_21965 ?auto_21997 ) ( CLEAR ?auto_21965 ) ( not ( = ?auto_21960 ?auto_21965 ) ) ( not ( = ?auto_21960 ?auto_21997 ) ) ( not ( = ?auto_21965 ?auto_21997 ) ) ( not ( = ?auto_21973 ?auto_21999 ) ) ( IS-CRATE ?auto_21960 ) ( not ( = ?auto_21983 ?auto_21970 ) ) ( HOIST-AT ?auto_21987 ?auto_21983 ) ( AVAILABLE ?auto_21987 ) ( SURFACE-AT ?auto_21960 ?auto_21983 ) ( ON ?auto_21960 ?auto_21990 ) ( CLEAR ?auto_21960 ) ( not ( = ?auto_21962 ?auto_21960 ) ) ( not ( = ?auto_21962 ?auto_21990 ) ) ( not ( = ?auto_21960 ?auto_21990 ) ) ( not ( = ?auto_21973 ?auto_21987 ) ) ( IS-CRATE ?auto_21962 ) ( AVAILABLE ?auto_21992 ) ( SURFACE-AT ?auto_21962 ?auto_21984 ) ( ON ?auto_21962 ?auto_21998 ) ( CLEAR ?auto_21962 ) ( not ( = ?auto_21963 ?auto_21962 ) ) ( not ( = ?auto_21963 ?auto_21998 ) ) ( not ( = ?auto_21962 ?auto_21998 ) ) ( IS-CRATE ?auto_21963 ) ( not ( = ?auto_21978 ?auto_21970 ) ) ( HOIST-AT ?auto_21993 ?auto_21978 ) ( AVAILABLE ?auto_21993 ) ( SURFACE-AT ?auto_21963 ?auto_21978 ) ( ON ?auto_21963 ?auto_22001 ) ( CLEAR ?auto_21963 ) ( not ( = ?auto_21959 ?auto_21963 ) ) ( not ( = ?auto_21959 ?auto_22001 ) ) ( not ( = ?auto_21963 ?auto_22001 ) ) ( not ( = ?auto_21973 ?auto_21993 ) ) ( IS-CRATE ?auto_21959 ) ( not ( = ?auto_22005 ?auto_21970 ) ) ( HOIST-AT ?auto_21989 ?auto_22005 ) ( SURFACE-AT ?auto_21959 ?auto_22005 ) ( ON ?auto_21959 ?auto_21988 ) ( CLEAR ?auto_21959 ) ( not ( = ?auto_21961 ?auto_21959 ) ) ( not ( = ?auto_21961 ?auto_21988 ) ) ( not ( = ?auto_21959 ?auto_21988 ) ) ( not ( = ?auto_21973 ?auto_21989 ) ) ( IS-CRATE ?auto_21961 ) ( not ( = ?auto_21996 ?auto_21970 ) ) ( HOIST-AT ?auto_21991 ?auto_21996 ) ( AVAILABLE ?auto_21991 ) ( SURFACE-AT ?auto_21961 ?auto_21996 ) ( ON ?auto_21961 ?auto_21982 ) ( CLEAR ?auto_21961 ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21982 ) ) ( not ( = ?auto_21961 ?auto_21982 ) ) ( not ( = ?auto_21973 ?auto_21991 ) ) ( IS-CRATE ?auto_21958 ) ( AVAILABLE ?auto_21989 ) ( SURFACE-AT ?auto_21958 ?auto_22005 ) ( ON ?auto_21958 ?auto_21986 ) ( CLEAR ?auto_21958 ) ( not ( = ?auto_21957 ?auto_21958 ) ) ( not ( = ?auto_21957 ?auto_21986 ) ) ( not ( = ?auto_21958 ?auto_21986 ) ) ( IS-CRATE ?auto_21957 ) ( not ( = ?auto_21977 ?auto_21970 ) ) ( HOIST-AT ?auto_22002 ?auto_21977 ) ( SURFACE-AT ?auto_21957 ?auto_21977 ) ( ON ?auto_21957 ?auto_21979 ) ( CLEAR ?auto_21957 ) ( not ( = ?auto_21956 ?auto_21957 ) ) ( not ( = ?auto_21956 ?auto_21979 ) ) ( not ( = ?auto_21957 ?auto_21979 ) ) ( not ( = ?auto_21973 ?auto_22002 ) ) ( IS-CRATE ?auto_21956 ) ( AVAILABLE ?auto_22002 ) ( SURFACE-AT ?auto_21956 ?auto_21977 ) ( ON ?auto_21956 ?auto_21994 ) ( CLEAR ?auto_21956 ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( not ( = ?auto_21955 ?auto_21994 ) ) ( not ( = ?auto_21956 ?auto_21994 ) ) ( SURFACE-AT ?auto_21954 ?auto_21970 ) ( CLEAR ?auto_21954 ) ( IS-CRATE ?auto_21955 ) ( AVAILABLE ?auto_21973 ) ( not ( = ?auto_22003 ?auto_21970 ) ) ( HOIST-AT ?auto_21976 ?auto_22003 ) ( AVAILABLE ?auto_21976 ) ( SURFACE-AT ?auto_21955 ?auto_22003 ) ( ON ?auto_21955 ?auto_21985 ) ( CLEAR ?auto_21955 ) ( TRUCK-AT ?auto_21969 ?auto_21970 ) ( not ( = ?auto_21954 ?auto_21955 ) ) ( not ( = ?auto_21954 ?auto_21985 ) ) ( not ( = ?auto_21955 ?auto_21985 ) ) ( not ( = ?auto_21973 ?auto_21976 ) ) ( not ( = ?auto_21954 ?auto_21956 ) ) ( not ( = ?auto_21954 ?auto_21994 ) ) ( not ( = ?auto_21956 ?auto_21985 ) ) ( not ( = ?auto_21977 ?auto_22003 ) ) ( not ( = ?auto_22002 ?auto_21976 ) ) ( not ( = ?auto_21994 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21957 ) ) ( not ( = ?auto_21954 ?auto_21979 ) ) ( not ( = ?auto_21955 ?auto_21957 ) ) ( not ( = ?auto_21955 ?auto_21979 ) ) ( not ( = ?auto_21957 ?auto_21994 ) ) ( not ( = ?auto_21957 ?auto_21985 ) ) ( not ( = ?auto_21979 ?auto_21994 ) ) ( not ( = ?auto_21979 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21958 ) ) ( not ( = ?auto_21954 ?auto_21986 ) ) ( not ( = ?auto_21955 ?auto_21958 ) ) ( not ( = ?auto_21955 ?auto_21986 ) ) ( not ( = ?auto_21956 ?auto_21958 ) ) ( not ( = ?auto_21956 ?auto_21986 ) ) ( not ( = ?auto_21958 ?auto_21979 ) ) ( not ( = ?auto_21958 ?auto_21994 ) ) ( not ( = ?auto_21958 ?auto_21985 ) ) ( not ( = ?auto_22005 ?auto_21977 ) ) ( not ( = ?auto_22005 ?auto_22003 ) ) ( not ( = ?auto_21989 ?auto_22002 ) ) ( not ( = ?auto_21989 ?auto_21976 ) ) ( not ( = ?auto_21986 ?auto_21979 ) ) ( not ( = ?auto_21986 ?auto_21994 ) ) ( not ( = ?auto_21986 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21961 ) ) ( not ( = ?auto_21954 ?auto_21982 ) ) ( not ( = ?auto_21955 ?auto_21961 ) ) ( not ( = ?auto_21955 ?auto_21982 ) ) ( not ( = ?auto_21956 ?auto_21961 ) ) ( not ( = ?auto_21956 ?auto_21982 ) ) ( not ( = ?auto_21957 ?auto_21961 ) ) ( not ( = ?auto_21957 ?auto_21982 ) ) ( not ( = ?auto_21961 ?auto_21986 ) ) ( not ( = ?auto_21961 ?auto_21979 ) ) ( not ( = ?auto_21961 ?auto_21994 ) ) ( not ( = ?auto_21961 ?auto_21985 ) ) ( not ( = ?auto_21996 ?auto_22005 ) ) ( not ( = ?auto_21996 ?auto_21977 ) ) ( not ( = ?auto_21996 ?auto_22003 ) ) ( not ( = ?auto_21991 ?auto_21989 ) ) ( not ( = ?auto_21991 ?auto_22002 ) ) ( not ( = ?auto_21991 ?auto_21976 ) ) ( not ( = ?auto_21982 ?auto_21986 ) ) ( not ( = ?auto_21982 ?auto_21979 ) ) ( not ( = ?auto_21982 ?auto_21994 ) ) ( not ( = ?auto_21982 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21959 ) ) ( not ( = ?auto_21954 ?auto_21988 ) ) ( not ( = ?auto_21955 ?auto_21959 ) ) ( not ( = ?auto_21955 ?auto_21988 ) ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21956 ?auto_21988 ) ) ( not ( = ?auto_21957 ?auto_21959 ) ) ( not ( = ?auto_21957 ?auto_21988 ) ) ( not ( = ?auto_21958 ?auto_21959 ) ) ( not ( = ?auto_21958 ?auto_21988 ) ) ( not ( = ?auto_21959 ?auto_21982 ) ) ( not ( = ?auto_21959 ?auto_21986 ) ) ( not ( = ?auto_21959 ?auto_21979 ) ) ( not ( = ?auto_21959 ?auto_21994 ) ) ( not ( = ?auto_21959 ?auto_21985 ) ) ( not ( = ?auto_21988 ?auto_21982 ) ) ( not ( = ?auto_21988 ?auto_21986 ) ) ( not ( = ?auto_21988 ?auto_21979 ) ) ( not ( = ?auto_21988 ?auto_21994 ) ) ( not ( = ?auto_21988 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21963 ) ) ( not ( = ?auto_21954 ?auto_22001 ) ) ( not ( = ?auto_21955 ?auto_21963 ) ) ( not ( = ?auto_21955 ?auto_22001 ) ) ( not ( = ?auto_21956 ?auto_21963 ) ) ( not ( = ?auto_21956 ?auto_22001 ) ) ( not ( = ?auto_21957 ?auto_21963 ) ) ( not ( = ?auto_21957 ?auto_22001 ) ) ( not ( = ?auto_21958 ?auto_21963 ) ) ( not ( = ?auto_21958 ?auto_22001 ) ) ( not ( = ?auto_21961 ?auto_21963 ) ) ( not ( = ?auto_21961 ?auto_22001 ) ) ( not ( = ?auto_21963 ?auto_21988 ) ) ( not ( = ?auto_21963 ?auto_21982 ) ) ( not ( = ?auto_21963 ?auto_21986 ) ) ( not ( = ?auto_21963 ?auto_21979 ) ) ( not ( = ?auto_21963 ?auto_21994 ) ) ( not ( = ?auto_21963 ?auto_21985 ) ) ( not ( = ?auto_21978 ?auto_22005 ) ) ( not ( = ?auto_21978 ?auto_21996 ) ) ( not ( = ?auto_21978 ?auto_21977 ) ) ( not ( = ?auto_21978 ?auto_22003 ) ) ( not ( = ?auto_21993 ?auto_21989 ) ) ( not ( = ?auto_21993 ?auto_21991 ) ) ( not ( = ?auto_21993 ?auto_22002 ) ) ( not ( = ?auto_21993 ?auto_21976 ) ) ( not ( = ?auto_22001 ?auto_21988 ) ) ( not ( = ?auto_22001 ?auto_21982 ) ) ( not ( = ?auto_22001 ?auto_21986 ) ) ( not ( = ?auto_22001 ?auto_21979 ) ) ( not ( = ?auto_22001 ?auto_21994 ) ) ( not ( = ?auto_22001 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21962 ) ) ( not ( = ?auto_21954 ?auto_21998 ) ) ( not ( = ?auto_21955 ?auto_21962 ) ) ( not ( = ?auto_21955 ?auto_21998 ) ) ( not ( = ?auto_21956 ?auto_21962 ) ) ( not ( = ?auto_21956 ?auto_21998 ) ) ( not ( = ?auto_21957 ?auto_21962 ) ) ( not ( = ?auto_21957 ?auto_21998 ) ) ( not ( = ?auto_21958 ?auto_21962 ) ) ( not ( = ?auto_21958 ?auto_21998 ) ) ( not ( = ?auto_21961 ?auto_21962 ) ) ( not ( = ?auto_21961 ?auto_21998 ) ) ( not ( = ?auto_21959 ?auto_21962 ) ) ( not ( = ?auto_21959 ?auto_21998 ) ) ( not ( = ?auto_21962 ?auto_22001 ) ) ( not ( = ?auto_21962 ?auto_21988 ) ) ( not ( = ?auto_21962 ?auto_21982 ) ) ( not ( = ?auto_21962 ?auto_21986 ) ) ( not ( = ?auto_21962 ?auto_21979 ) ) ( not ( = ?auto_21962 ?auto_21994 ) ) ( not ( = ?auto_21962 ?auto_21985 ) ) ( not ( = ?auto_21984 ?auto_21978 ) ) ( not ( = ?auto_21984 ?auto_22005 ) ) ( not ( = ?auto_21984 ?auto_21996 ) ) ( not ( = ?auto_21984 ?auto_21977 ) ) ( not ( = ?auto_21984 ?auto_22003 ) ) ( not ( = ?auto_21992 ?auto_21993 ) ) ( not ( = ?auto_21992 ?auto_21989 ) ) ( not ( = ?auto_21992 ?auto_21991 ) ) ( not ( = ?auto_21992 ?auto_22002 ) ) ( not ( = ?auto_21992 ?auto_21976 ) ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_21988 ) ) ( not ( = ?auto_21998 ?auto_21982 ) ) ( not ( = ?auto_21998 ?auto_21986 ) ) ( not ( = ?auto_21998 ?auto_21979 ) ) ( not ( = ?auto_21998 ?auto_21994 ) ) ( not ( = ?auto_21998 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21960 ) ) ( not ( = ?auto_21954 ?auto_21990 ) ) ( not ( = ?auto_21955 ?auto_21960 ) ) ( not ( = ?auto_21955 ?auto_21990 ) ) ( not ( = ?auto_21956 ?auto_21960 ) ) ( not ( = ?auto_21956 ?auto_21990 ) ) ( not ( = ?auto_21957 ?auto_21960 ) ) ( not ( = ?auto_21957 ?auto_21990 ) ) ( not ( = ?auto_21958 ?auto_21960 ) ) ( not ( = ?auto_21958 ?auto_21990 ) ) ( not ( = ?auto_21961 ?auto_21960 ) ) ( not ( = ?auto_21961 ?auto_21990 ) ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( not ( = ?auto_21959 ?auto_21990 ) ) ( not ( = ?auto_21963 ?auto_21960 ) ) ( not ( = ?auto_21963 ?auto_21990 ) ) ( not ( = ?auto_21960 ?auto_21998 ) ) ( not ( = ?auto_21960 ?auto_22001 ) ) ( not ( = ?auto_21960 ?auto_21988 ) ) ( not ( = ?auto_21960 ?auto_21982 ) ) ( not ( = ?auto_21960 ?auto_21986 ) ) ( not ( = ?auto_21960 ?auto_21979 ) ) ( not ( = ?auto_21960 ?auto_21994 ) ) ( not ( = ?auto_21960 ?auto_21985 ) ) ( not ( = ?auto_21983 ?auto_21984 ) ) ( not ( = ?auto_21983 ?auto_21978 ) ) ( not ( = ?auto_21983 ?auto_22005 ) ) ( not ( = ?auto_21983 ?auto_21996 ) ) ( not ( = ?auto_21983 ?auto_21977 ) ) ( not ( = ?auto_21983 ?auto_22003 ) ) ( not ( = ?auto_21987 ?auto_21992 ) ) ( not ( = ?auto_21987 ?auto_21993 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_21991 ) ) ( not ( = ?auto_21987 ?auto_22002 ) ) ( not ( = ?auto_21987 ?auto_21976 ) ) ( not ( = ?auto_21990 ?auto_21998 ) ) ( not ( = ?auto_21990 ?auto_22001 ) ) ( not ( = ?auto_21990 ?auto_21988 ) ) ( not ( = ?auto_21990 ?auto_21982 ) ) ( not ( = ?auto_21990 ?auto_21986 ) ) ( not ( = ?auto_21990 ?auto_21979 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21965 ) ) ( not ( = ?auto_21954 ?auto_21997 ) ) ( not ( = ?auto_21955 ?auto_21965 ) ) ( not ( = ?auto_21955 ?auto_21997 ) ) ( not ( = ?auto_21956 ?auto_21965 ) ) ( not ( = ?auto_21956 ?auto_21997 ) ) ( not ( = ?auto_21957 ?auto_21965 ) ) ( not ( = ?auto_21957 ?auto_21997 ) ) ( not ( = ?auto_21958 ?auto_21965 ) ) ( not ( = ?auto_21958 ?auto_21997 ) ) ( not ( = ?auto_21961 ?auto_21965 ) ) ( not ( = ?auto_21961 ?auto_21997 ) ) ( not ( = ?auto_21959 ?auto_21965 ) ) ( not ( = ?auto_21959 ?auto_21997 ) ) ( not ( = ?auto_21963 ?auto_21965 ) ) ( not ( = ?auto_21963 ?auto_21997 ) ) ( not ( = ?auto_21962 ?auto_21965 ) ) ( not ( = ?auto_21962 ?auto_21997 ) ) ( not ( = ?auto_21965 ?auto_21990 ) ) ( not ( = ?auto_21965 ?auto_21998 ) ) ( not ( = ?auto_21965 ?auto_22001 ) ) ( not ( = ?auto_21965 ?auto_21988 ) ) ( not ( = ?auto_21965 ?auto_21982 ) ) ( not ( = ?auto_21965 ?auto_21986 ) ) ( not ( = ?auto_21965 ?auto_21979 ) ) ( not ( = ?auto_21965 ?auto_21994 ) ) ( not ( = ?auto_21965 ?auto_21985 ) ) ( not ( = ?auto_21975 ?auto_21983 ) ) ( not ( = ?auto_21975 ?auto_21984 ) ) ( not ( = ?auto_21975 ?auto_21978 ) ) ( not ( = ?auto_21975 ?auto_22005 ) ) ( not ( = ?auto_21975 ?auto_21996 ) ) ( not ( = ?auto_21975 ?auto_21977 ) ) ( not ( = ?auto_21975 ?auto_22003 ) ) ( not ( = ?auto_21999 ?auto_21987 ) ) ( not ( = ?auto_21999 ?auto_21992 ) ) ( not ( = ?auto_21999 ?auto_21993 ) ) ( not ( = ?auto_21999 ?auto_21989 ) ) ( not ( = ?auto_21999 ?auto_21991 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_21999 ?auto_21976 ) ) ( not ( = ?auto_21997 ?auto_21990 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_22001 ) ) ( not ( = ?auto_21997 ?auto_21988 ) ) ( not ( = ?auto_21997 ?auto_21982 ) ) ( not ( = ?auto_21997 ?auto_21986 ) ) ( not ( = ?auto_21997 ?auto_21979 ) ) ( not ( = ?auto_21997 ?auto_21994 ) ) ( not ( = ?auto_21997 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21964 ) ) ( not ( = ?auto_21954 ?auto_21980 ) ) ( not ( = ?auto_21955 ?auto_21964 ) ) ( not ( = ?auto_21955 ?auto_21980 ) ) ( not ( = ?auto_21956 ?auto_21964 ) ) ( not ( = ?auto_21956 ?auto_21980 ) ) ( not ( = ?auto_21957 ?auto_21964 ) ) ( not ( = ?auto_21957 ?auto_21980 ) ) ( not ( = ?auto_21958 ?auto_21964 ) ) ( not ( = ?auto_21958 ?auto_21980 ) ) ( not ( = ?auto_21961 ?auto_21964 ) ) ( not ( = ?auto_21961 ?auto_21980 ) ) ( not ( = ?auto_21959 ?auto_21964 ) ) ( not ( = ?auto_21959 ?auto_21980 ) ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( not ( = ?auto_21963 ?auto_21980 ) ) ( not ( = ?auto_21962 ?auto_21964 ) ) ( not ( = ?auto_21962 ?auto_21980 ) ) ( not ( = ?auto_21960 ?auto_21964 ) ) ( not ( = ?auto_21960 ?auto_21980 ) ) ( not ( = ?auto_21964 ?auto_21997 ) ) ( not ( = ?auto_21964 ?auto_21990 ) ) ( not ( = ?auto_21964 ?auto_21998 ) ) ( not ( = ?auto_21964 ?auto_22001 ) ) ( not ( = ?auto_21964 ?auto_21988 ) ) ( not ( = ?auto_21964 ?auto_21982 ) ) ( not ( = ?auto_21964 ?auto_21986 ) ) ( not ( = ?auto_21964 ?auto_21979 ) ) ( not ( = ?auto_21964 ?auto_21994 ) ) ( not ( = ?auto_21964 ?auto_21985 ) ) ( not ( = ?auto_21995 ?auto_21975 ) ) ( not ( = ?auto_21995 ?auto_21983 ) ) ( not ( = ?auto_21995 ?auto_21984 ) ) ( not ( = ?auto_21995 ?auto_21978 ) ) ( not ( = ?auto_21995 ?auto_22005 ) ) ( not ( = ?auto_21995 ?auto_21996 ) ) ( not ( = ?auto_21995 ?auto_21977 ) ) ( not ( = ?auto_21995 ?auto_22003 ) ) ( not ( = ?auto_21981 ?auto_21999 ) ) ( not ( = ?auto_21981 ?auto_21987 ) ) ( not ( = ?auto_21981 ?auto_21992 ) ) ( not ( = ?auto_21981 ?auto_21993 ) ) ( not ( = ?auto_21981 ?auto_21989 ) ) ( not ( = ?auto_21981 ?auto_21991 ) ) ( not ( = ?auto_21981 ?auto_22002 ) ) ( not ( = ?auto_21981 ?auto_21976 ) ) ( not ( = ?auto_21980 ?auto_21997 ) ) ( not ( = ?auto_21980 ?auto_21990 ) ) ( not ( = ?auto_21980 ?auto_21998 ) ) ( not ( = ?auto_21980 ?auto_22001 ) ) ( not ( = ?auto_21980 ?auto_21988 ) ) ( not ( = ?auto_21980 ?auto_21982 ) ) ( not ( = ?auto_21980 ?auto_21986 ) ) ( not ( = ?auto_21980 ?auto_21979 ) ) ( not ( = ?auto_21980 ?auto_21994 ) ) ( not ( = ?auto_21980 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21966 ) ) ( not ( = ?auto_21954 ?auto_22004 ) ) ( not ( = ?auto_21955 ?auto_21966 ) ) ( not ( = ?auto_21955 ?auto_22004 ) ) ( not ( = ?auto_21956 ?auto_21966 ) ) ( not ( = ?auto_21956 ?auto_22004 ) ) ( not ( = ?auto_21957 ?auto_21966 ) ) ( not ( = ?auto_21957 ?auto_22004 ) ) ( not ( = ?auto_21958 ?auto_21966 ) ) ( not ( = ?auto_21958 ?auto_22004 ) ) ( not ( = ?auto_21961 ?auto_21966 ) ) ( not ( = ?auto_21961 ?auto_22004 ) ) ( not ( = ?auto_21959 ?auto_21966 ) ) ( not ( = ?auto_21959 ?auto_22004 ) ) ( not ( = ?auto_21963 ?auto_21966 ) ) ( not ( = ?auto_21963 ?auto_22004 ) ) ( not ( = ?auto_21962 ?auto_21966 ) ) ( not ( = ?auto_21962 ?auto_22004 ) ) ( not ( = ?auto_21960 ?auto_21966 ) ) ( not ( = ?auto_21960 ?auto_22004 ) ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_22004 ) ) ( not ( = ?auto_21966 ?auto_21980 ) ) ( not ( = ?auto_21966 ?auto_21997 ) ) ( not ( = ?auto_21966 ?auto_21990 ) ) ( not ( = ?auto_21966 ?auto_21998 ) ) ( not ( = ?auto_21966 ?auto_22001 ) ) ( not ( = ?auto_21966 ?auto_21988 ) ) ( not ( = ?auto_21966 ?auto_21982 ) ) ( not ( = ?auto_21966 ?auto_21986 ) ) ( not ( = ?auto_21966 ?auto_21979 ) ) ( not ( = ?auto_21966 ?auto_21994 ) ) ( not ( = ?auto_21966 ?auto_21985 ) ) ( not ( = ?auto_22004 ?auto_21980 ) ) ( not ( = ?auto_22004 ?auto_21997 ) ) ( not ( = ?auto_22004 ?auto_21990 ) ) ( not ( = ?auto_22004 ?auto_21998 ) ) ( not ( = ?auto_22004 ?auto_22001 ) ) ( not ( = ?auto_22004 ?auto_21988 ) ) ( not ( = ?auto_22004 ?auto_21982 ) ) ( not ( = ?auto_22004 ?auto_21986 ) ) ( not ( = ?auto_22004 ?auto_21979 ) ) ( not ( = ?auto_22004 ?auto_21994 ) ) ( not ( = ?auto_22004 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21967 ) ) ( not ( = ?auto_21954 ?auto_22000 ) ) ( not ( = ?auto_21955 ?auto_21967 ) ) ( not ( = ?auto_21955 ?auto_22000 ) ) ( not ( = ?auto_21956 ?auto_21967 ) ) ( not ( = ?auto_21956 ?auto_22000 ) ) ( not ( = ?auto_21957 ?auto_21967 ) ) ( not ( = ?auto_21957 ?auto_22000 ) ) ( not ( = ?auto_21958 ?auto_21967 ) ) ( not ( = ?auto_21958 ?auto_22000 ) ) ( not ( = ?auto_21961 ?auto_21967 ) ) ( not ( = ?auto_21961 ?auto_22000 ) ) ( not ( = ?auto_21959 ?auto_21967 ) ) ( not ( = ?auto_21959 ?auto_22000 ) ) ( not ( = ?auto_21963 ?auto_21967 ) ) ( not ( = ?auto_21963 ?auto_22000 ) ) ( not ( = ?auto_21962 ?auto_21967 ) ) ( not ( = ?auto_21962 ?auto_22000 ) ) ( not ( = ?auto_21960 ?auto_21967 ) ) ( not ( = ?auto_21960 ?auto_22000 ) ) ( not ( = ?auto_21965 ?auto_21967 ) ) ( not ( = ?auto_21965 ?auto_22000 ) ) ( not ( = ?auto_21964 ?auto_21967 ) ) ( not ( = ?auto_21964 ?auto_22000 ) ) ( not ( = ?auto_21967 ?auto_22004 ) ) ( not ( = ?auto_21967 ?auto_21980 ) ) ( not ( = ?auto_21967 ?auto_21997 ) ) ( not ( = ?auto_21967 ?auto_21990 ) ) ( not ( = ?auto_21967 ?auto_21998 ) ) ( not ( = ?auto_21967 ?auto_22001 ) ) ( not ( = ?auto_21967 ?auto_21988 ) ) ( not ( = ?auto_21967 ?auto_21982 ) ) ( not ( = ?auto_21967 ?auto_21986 ) ) ( not ( = ?auto_21967 ?auto_21979 ) ) ( not ( = ?auto_21967 ?auto_21994 ) ) ( not ( = ?auto_21967 ?auto_21985 ) ) ( not ( = ?auto_22000 ?auto_22004 ) ) ( not ( = ?auto_22000 ?auto_21980 ) ) ( not ( = ?auto_22000 ?auto_21997 ) ) ( not ( = ?auto_22000 ?auto_21990 ) ) ( not ( = ?auto_22000 ?auto_21998 ) ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_21988 ) ) ( not ( = ?auto_22000 ?auto_21982 ) ) ( not ( = ?auto_22000 ?auto_21986 ) ) ( not ( = ?auto_22000 ?auto_21979 ) ) ( not ( = ?auto_22000 ?auto_21994 ) ) ( not ( = ?auto_22000 ?auto_21985 ) ) ( not ( = ?auto_21954 ?auto_21968 ) ) ( not ( = ?auto_21954 ?auto_21974 ) ) ( not ( = ?auto_21955 ?auto_21968 ) ) ( not ( = ?auto_21955 ?auto_21974 ) ) ( not ( = ?auto_21956 ?auto_21968 ) ) ( not ( = ?auto_21956 ?auto_21974 ) ) ( not ( = ?auto_21957 ?auto_21968 ) ) ( not ( = ?auto_21957 ?auto_21974 ) ) ( not ( = ?auto_21958 ?auto_21968 ) ) ( not ( = ?auto_21958 ?auto_21974 ) ) ( not ( = ?auto_21961 ?auto_21968 ) ) ( not ( = ?auto_21961 ?auto_21974 ) ) ( not ( = ?auto_21959 ?auto_21968 ) ) ( not ( = ?auto_21959 ?auto_21974 ) ) ( not ( = ?auto_21963 ?auto_21968 ) ) ( not ( = ?auto_21963 ?auto_21974 ) ) ( not ( = ?auto_21962 ?auto_21968 ) ) ( not ( = ?auto_21962 ?auto_21974 ) ) ( not ( = ?auto_21960 ?auto_21968 ) ) ( not ( = ?auto_21960 ?auto_21974 ) ) ( not ( = ?auto_21965 ?auto_21968 ) ) ( not ( = ?auto_21965 ?auto_21974 ) ) ( not ( = ?auto_21964 ?auto_21968 ) ) ( not ( = ?auto_21964 ?auto_21974 ) ) ( not ( = ?auto_21966 ?auto_21968 ) ) ( not ( = ?auto_21966 ?auto_21974 ) ) ( not ( = ?auto_21968 ?auto_22000 ) ) ( not ( = ?auto_21968 ?auto_22004 ) ) ( not ( = ?auto_21968 ?auto_21980 ) ) ( not ( = ?auto_21968 ?auto_21997 ) ) ( not ( = ?auto_21968 ?auto_21990 ) ) ( not ( = ?auto_21968 ?auto_21998 ) ) ( not ( = ?auto_21968 ?auto_22001 ) ) ( not ( = ?auto_21968 ?auto_21988 ) ) ( not ( = ?auto_21968 ?auto_21982 ) ) ( not ( = ?auto_21968 ?auto_21986 ) ) ( not ( = ?auto_21968 ?auto_21979 ) ) ( not ( = ?auto_21968 ?auto_21994 ) ) ( not ( = ?auto_21968 ?auto_21985 ) ) ( not ( = ?auto_21972 ?auto_21984 ) ) ( not ( = ?auto_21972 ?auto_21995 ) ) ( not ( = ?auto_21972 ?auto_21975 ) ) ( not ( = ?auto_21972 ?auto_21983 ) ) ( not ( = ?auto_21972 ?auto_21978 ) ) ( not ( = ?auto_21972 ?auto_22005 ) ) ( not ( = ?auto_21972 ?auto_21996 ) ) ( not ( = ?auto_21972 ?auto_21977 ) ) ( not ( = ?auto_21972 ?auto_22003 ) ) ( not ( = ?auto_21971 ?auto_21992 ) ) ( not ( = ?auto_21971 ?auto_21981 ) ) ( not ( = ?auto_21971 ?auto_21999 ) ) ( not ( = ?auto_21971 ?auto_21987 ) ) ( not ( = ?auto_21971 ?auto_21993 ) ) ( not ( = ?auto_21971 ?auto_21989 ) ) ( not ( = ?auto_21971 ?auto_21991 ) ) ( not ( = ?auto_21971 ?auto_22002 ) ) ( not ( = ?auto_21971 ?auto_21976 ) ) ( not ( = ?auto_21974 ?auto_22000 ) ) ( not ( = ?auto_21974 ?auto_22004 ) ) ( not ( = ?auto_21974 ?auto_21980 ) ) ( not ( = ?auto_21974 ?auto_21997 ) ) ( not ( = ?auto_21974 ?auto_21990 ) ) ( not ( = ?auto_21974 ?auto_21998 ) ) ( not ( = ?auto_21974 ?auto_22001 ) ) ( not ( = ?auto_21974 ?auto_21988 ) ) ( not ( = ?auto_21974 ?auto_21982 ) ) ( not ( = ?auto_21974 ?auto_21986 ) ) ( not ( = ?auto_21974 ?auto_21979 ) ) ( not ( = ?auto_21974 ?auto_21994 ) ) ( not ( = ?auto_21974 ?auto_21985 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21954 ?auto_21955 ?auto_21956 ?auto_21957 ?auto_21958 ?auto_21961 ?auto_21959 ?auto_21963 ?auto_21962 ?auto_21960 ?auto_21965 ?auto_21964 ?auto_21966 ?auto_21967 )
      ( MAKE-1CRATE ?auto_21967 ?auto_21968 )
      ( MAKE-14CRATE-VERIFY ?auto_21954 ?auto_21955 ?auto_21956 ?auto_21957 ?auto_21958 ?auto_21961 ?auto_21959 ?auto_21963 ?auto_21962 ?auto_21960 ?auto_21965 ?auto_21964 ?auto_21966 ?auto_21967 ?auto_21968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22008 - SURFACE
      ?auto_22009 - SURFACE
    )
    :vars
    (
      ?auto_22010 - HOIST
      ?auto_22011 - PLACE
      ?auto_22013 - PLACE
      ?auto_22014 - HOIST
      ?auto_22015 - SURFACE
      ?auto_22012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22010 ?auto_22011 ) ( SURFACE-AT ?auto_22008 ?auto_22011 ) ( CLEAR ?auto_22008 ) ( IS-CRATE ?auto_22009 ) ( AVAILABLE ?auto_22010 ) ( not ( = ?auto_22013 ?auto_22011 ) ) ( HOIST-AT ?auto_22014 ?auto_22013 ) ( AVAILABLE ?auto_22014 ) ( SURFACE-AT ?auto_22009 ?auto_22013 ) ( ON ?auto_22009 ?auto_22015 ) ( CLEAR ?auto_22009 ) ( TRUCK-AT ?auto_22012 ?auto_22011 ) ( not ( = ?auto_22008 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22015 ) ) ( not ( = ?auto_22009 ?auto_22015 ) ) ( not ( = ?auto_22010 ?auto_22014 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22012 ?auto_22011 ?auto_22013 )
      ( !LIFT ?auto_22014 ?auto_22009 ?auto_22015 ?auto_22013 )
      ( !LOAD ?auto_22014 ?auto_22009 ?auto_22012 ?auto_22013 )
      ( !DRIVE ?auto_22012 ?auto_22013 ?auto_22011 )
      ( !UNLOAD ?auto_22010 ?auto_22009 ?auto_22012 ?auto_22011 )
      ( !DROP ?auto_22010 ?auto_22009 ?auto_22008 ?auto_22011 )
      ( MAKE-1CRATE-VERIFY ?auto_22008 ?auto_22009 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22032 - SURFACE
      ?auto_22033 - SURFACE
      ?auto_22034 - SURFACE
      ?auto_22035 - SURFACE
      ?auto_22036 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22037 - SURFACE
      ?auto_22041 - SURFACE
      ?auto_22040 - SURFACE
      ?auto_22038 - SURFACE
      ?auto_22043 - SURFACE
      ?auto_22042 - SURFACE
      ?auto_22044 - SURFACE
      ?auto_22046 - SURFACE
      ?auto_22047 - SURFACE
      ?auto_22045 - SURFACE
    )
    :vars
    (
      ?auto_22053 - HOIST
      ?auto_22048 - PLACE
      ?auto_22052 - PLACE
      ?auto_22050 - HOIST
      ?auto_22049 - SURFACE
      ?auto_22084 - PLACE
      ?auto_22062 - HOIST
      ?auto_22071 - SURFACE
      ?auto_22065 - PLACE
      ?auto_22085 - HOIST
      ?auto_22055 - SURFACE
      ?auto_22076 - SURFACE
      ?auto_22063 - PLACE
      ?auto_22064 - HOIST
      ?auto_22059 - SURFACE
      ?auto_22061 - PLACE
      ?auto_22070 - HOIST
      ?auto_22075 - SURFACE
      ?auto_22081 - SURFACE
      ?auto_22077 - SURFACE
      ?auto_22082 - PLACE
      ?auto_22068 - HOIST
      ?auto_22080 - SURFACE
      ?auto_22074 - PLACE
      ?auto_22083 - HOIST
      ?auto_22056 - SURFACE
      ?auto_22057 - PLACE
      ?auto_22073 - HOIST
      ?auto_22066 - SURFACE
      ?auto_22079 - SURFACE
      ?auto_22054 - PLACE
      ?auto_22072 - HOIST
      ?auto_22058 - SURFACE
      ?auto_22067 - SURFACE
      ?auto_22078 - PLACE
      ?auto_22069 - HOIST
      ?auto_22060 - SURFACE
      ?auto_22051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22053 ?auto_22048 ) ( IS-CRATE ?auto_22045 ) ( not ( = ?auto_22052 ?auto_22048 ) ) ( HOIST-AT ?auto_22050 ?auto_22052 ) ( SURFACE-AT ?auto_22045 ?auto_22052 ) ( ON ?auto_22045 ?auto_22049 ) ( CLEAR ?auto_22045 ) ( not ( = ?auto_22047 ?auto_22045 ) ) ( not ( = ?auto_22047 ?auto_22049 ) ) ( not ( = ?auto_22045 ?auto_22049 ) ) ( not ( = ?auto_22053 ?auto_22050 ) ) ( IS-CRATE ?auto_22047 ) ( not ( = ?auto_22084 ?auto_22048 ) ) ( HOIST-AT ?auto_22062 ?auto_22084 ) ( AVAILABLE ?auto_22062 ) ( SURFACE-AT ?auto_22047 ?auto_22084 ) ( ON ?auto_22047 ?auto_22071 ) ( CLEAR ?auto_22047 ) ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22071 ) ) ( not ( = ?auto_22047 ?auto_22071 ) ) ( not ( = ?auto_22053 ?auto_22062 ) ) ( IS-CRATE ?auto_22046 ) ( not ( = ?auto_22065 ?auto_22048 ) ) ( HOIST-AT ?auto_22085 ?auto_22065 ) ( SURFACE-AT ?auto_22046 ?auto_22065 ) ( ON ?auto_22046 ?auto_22055 ) ( CLEAR ?auto_22046 ) ( not ( = ?auto_22044 ?auto_22046 ) ) ( not ( = ?auto_22044 ?auto_22055 ) ) ( not ( = ?auto_22046 ?auto_22055 ) ) ( not ( = ?auto_22053 ?auto_22085 ) ) ( IS-CRATE ?auto_22044 ) ( SURFACE-AT ?auto_22044 ?auto_22065 ) ( ON ?auto_22044 ?auto_22076 ) ( CLEAR ?auto_22044 ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22076 ) ) ( not ( = ?auto_22044 ?auto_22076 ) ) ( IS-CRATE ?auto_22042 ) ( not ( = ?auto_22063 ?auto_22048 ) ) ( HOIST-AT ?auto_22064 ?auto_22063 ) ( AVAILABLE ?auto_22064 ) ( SURFACE-AT ?auto_22042 ?auto_22063 ) ( ON ?auto_22042 ?auto_22059 ) ( CLEAR ?auto_22042 ) ( not ( = ?auto_22043 ?auto_22042 ) ) ( not ( = ?auto_22043 ?auto_22059 ) ) ( not ( = ?auto_22042 ?auto_22059 ) ) ( not ( = ?auto_22053 ?auto_22064 ) ) ( IS-CRATE ?auto_22043 ) ( not ( = ?auto_22061 ?auto_22048 ) ) ( HOIST-AT ?auto_22070 ?auto_22061 ) ( AVAILABLE ?auto_22070 ) ( SURFACE-AT ?auto_22043 ?auto_22061 ) ( ON ?auto_22043 ?auto_22075 ) ( CLEAR ?auto_22043 ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22075 ) ) ( not ( = ?auto_22043 ?auto_22075 ) ) ( not ( = ?auto_22053 ?auto_22070 ) ) ( IS-CRATE ?auto_22038 ) ( AVAILABLE ?auto_22050 ) ( SURFACE-AT ?auto_22038 ?auto_22052 ) ( ON ?auto_22038 ?auto_22081 ) ( CLEAR ?auto_22038 ) ( not ( = ?auto_22040 ?auto_22038 ) ) ( not ( = ?auto_22040 ?auto_22081 ) ) ( not ( = ?auto_22038 ?auto_22081 ) ) ( IS-CRATE ?auto_22040 ) ( AVAILABLE ?auto_22085 ) ( SURFACE-AT ?auto_22040 ?auto_22065 ) ( ON ?auto_22040 ?auto_22077 ) ( CLEAR ?auto_22040 ) ( not ( = ?auto_22041 ?auto_22040 ) ) ( not ( = ?auto_22041 ?auto_22077 ) ) ( not ( = ?auto_22040 ?auto_22077 ) ) ( IS-CRATE ?auto_22041 ) ( not ( = ?auto_22082 ?auto_22048 ) ) ( HOIST-AT ?auto_22068 ?auto_22082 ) ( AVAILABLE ?auto_22068 ) ( SURFACE-AT ?auto_22041 ?auto_22082 ) ( ON ?auto_22041 ?auto_22080 ) ( CLEAR ?auto_22041 ) ( not ( = ?auto_22037 ?auto_22041 ) ) ( not ( = ?auto_22037 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22080 ) ) ( not ( = ?auto_22053 ?auto_22068 ) ) ( IS-CRATE ?auto_22037 ) ( not ( = ?auto_22074 ?auto_22048 ) ) ( HOIST-AT ?auto_22083 ?auto_22074 ) ( SURFACE-AT ?auto_22037 ?auto_22074 ) ( ON ?auto_22037 ?auto_22056 ) ( CLEAR ?auto_22037 ) ( not ( = ?auto_22039 ?auto_22037 ) ) ( not ( = ?auto_22039 ?auto_22056 ) ) ( not ( = ?auto_22037 ?auto_22056 ) ) ( not ( = ?auto_22053 ?auto_22083 ) ) ( IS-CRATE ?auto_22039 ) ( not ( = ?auto_22057 ?auto_22048 ) ) ( HOIST-AT ?auto_22073 ?auto_22057 ) ( AVAILABLE ?auto_22073 ) ( SURFACE-AT ?auto_22039 ?auto_22057 ) ( ON ?auto_22039 ?auto_22066 ) ( CLEAR ?auto_22039 ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22066 ) ) ( not ( = ?auto_22039 ?auto_22066 ) ) ( not ( = ?auto_22053 ?auto_22073 ) ) ( IS-CRATE ?auto_22036 ) ( AVAILABLE ?auto_22083 ) ( SURFACE-AT ?auto_22036 ?auto_22074 ) ( ON ?auto_22036 ?auto_22079 ) ( CLEAR ?auto_22036 ) ( not ( = ?auto_22035 ?auto_22036 ) ) ( not ( = ?auto_22035 ?auto_22079 ) ) ( not ( = ?auto_22036 ?auto_22079 ) ) ( IS-CRATE ?auto_22035 ) ( not ( = ?auto_22054 ?auto_22048 ) ) ( HOIST-AT ?auto_22072 ?auto_22054 ) ( SURFACE-AT ?auto_22035 ?auto_22054 ) ( ON ?auto_22035 ?auto_22058 ) ( CLEAR ?auto_22035 ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( not ( = ?auto_22034 ?auto_22058 ) ) ( not ( = ?auto_22035 ?auto_22058 ) ) ( not ( = ?auto_22053 ?auto_22072 ) ) ( IS-CRATE ?auto_22034 ) ( AVAILABLE ?auto_22072 ) ( SURFACE-AT ?auto_22034 ?auto_22054 ) ( ON ?auto_22034 ?auto_22067 ) ( CLEAR ?auto_22034 ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22067 ) ) ( not ( = ?auto_22034 ?auto_22067 ) ) ( SURFACE-AT ?auto_22032 ?auto_22048 ) ( CLEAR ?auto_22032 ) ( IS-CRATE ?auto_22033 ) ( AVAILABLE ?auto_22053 ) ( not ( = ?auto_22078 ?auto_22048 ) ) ( HOIST-AT ?auto_22069 ?auto_22078 ) ( AVAILABLE ?auto_22069 ) ( SURFACE-AT ?auto_22033 ?auto_22078 ) ( ON ?auto_22033 ?auto_22060 ) ( CLEAR ?auto_22033 ) ( TRUCK-AT ?auto_22051 ?auto_22048 ) ( not ( = ?auto_22032 ?auto_22033 ) ) ( not ( = ?auto_22032 ?auto_22060 ) ) ( not ( = ?auto_22033 ?auto_22060 ) ) ( not ( = ?auto_22053 ?auto_22069 ) ) ( not ( = ?auto_22032 ?auto_22034 ) ) ( not ( = ?auto_22032 ?auto_22067 ) ) ( not ( = ?auto_22034 ?auto_22060 ) ) ( not ( = ?auto_22054 ?auto_22078 ) ) ( not ( = ?auto_22072 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22035 ) ) ( not ( = ?auto_22032 ?auto_22058 ) ) ( not ( = ?auto_22033 ?auto_22035 ) ) ( not ( = ?auto_22033 ?auto_22058 ) ) ( not ( = ?auto_22035 ?auto_22067 ) ) ( not ( = ?auto_22035 ?auto_22060 ) ) ( not ( = ?auto_22058 ?auto_22067 ) ) ( not ( = ?auto_22058 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22036 ) ) ( not ( = ?auto_22032 ?auto_22079 ) ) ( not ( = ?auto_22033 ?auto_22036 ) ) ( not ( = ?auto_22033 ?auto_22079 ) ) ( not ( = ?auto_22034 ?auto_22036 ) ) ( not ( = ?auto_22034 ?auto_22079 ) ) ( not ( = ?auto_22036 ?auto_22058 ) ) ( not ( = ?auto_22036 ?auto_22067 ) ) ( not ( = ?auto_22036 ?auto_22060 ) ) ( not ( = ?auto_22074 ?auto_22054 ) ) ( not ( = ?auto_22074 ?auto_22078 ) ) ( not ( = ?auto_22083 ?auto_22072 ) ) ( not ( = ?auto_22083 ?auto_22069 ) ) ( not ( = ?auto_22079 ?auto_22058 ) ) ( not ( = ?auto_22079 ?auto_22067 ) ) ( not ( = ?auto_22079 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22039 ) ) ( not ( = ?auto_22032 ?auto_22066 ) ) ( not ( = ?auto_22033 ?auto_22039 ) ) ( not ( = ?auto_22033 ?auto_22066 ) ) ( not ( = ?auto_22034 ?auto_22039 ) ) ( not ( = ?auto_22034 ?auto_22066 ) ) ( not ( = ?auto_22035 ?auto_22039 ) ) ( not ( = ?auto_22035 ?auto_22066 ) ) ( not ( = ?auto_22039 ?auto_22079 ) ) ( not ( = ?auto_22039 ?auto_22058 ) ) ( not ( = ?auto_22039 ?auto_22067 ) ) ( not ( = ?auto_22039 ?auto_22060 ) ) ( not ( = ?auto_22057 ?auto_22074 ) ) ( not ( = ?auto_22057 ?auto_22054 ) ) ( not ( = ?auto_22057 ?auto_22078 ) ) ( not ( = ?auto_22073 ?auto_22083 ) ) ( not ( = ?auto_22073 ?auto_22072 ) ) ( not ( = ?auto_22073 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22079 ) ) ( not ( = ?auto_22066 ?auto_22058 ) ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22037 ) ) ( not ( = ?auto_22032 ?auto_22056 ) ) ( not ( = ?auto_22033 ?auto_22037 ) ) ( not ( = ?auto_22033 ?auto_22056 ) ) ( not ( = ?auto_22034 ?auto_22037 ) ) ( not ( = ?auto_22034 ?auto_22056 ) ) ( not ( = ?auto_22035 ?auto_22037 ) ) ( not ( = ?auto_22035 ?auto_22056 ) ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22056 ) ) ( not ( = ?auto_22037 ?auto_22066 ) ) ( not ( = ?auto_22037 ?auto_22079 ) ) ( not ( = ?auto_22037 ?auto_22058 ) ) ( not ( = ?auto_22037 ?auto_22067 ) ) ( not ( = ?auto_22037 ?auto_22060 ) ) ( not ( = ?auto_22056 ?auto_22066 ) ) ( not ( = ?auto_22056 ?auto_22079 ) ) ( not ( = ?auto_22056 ?auto_22058 ) ) ( not ( = ?auto_22056 ?auto_22067 ) ) ( not ( = ?auto_22056 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22041 ) ) ( not ( = ?auto_22032 ?auto_22080 ) ) ( not ( = ?auto_22033 ?auto_22041 ) ) ( not ( = ?auto_22033 ?auto_22080 ) ) ( not ( = ?auto_22034 ?auto_22041 ) ) ( not ( = ?auto_22034 ?auto_22080 ) ) ( not ( = ?auto_22035 ?auto_22041 ) ) ( not ( = ?auto_22035 ?auto_22080 ) ) ( not ( = ?auto_22036 ?auto_22041 ) ) ( not ( = ?auto_22036 ?auto_22080 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22056 ) ) ( not ( = ?auto_22041 ?auto_22066 ) ) ( not ( = ?auto_22041 ?auto_22079 ) ) ( not ( = ?auto_22041 ?auto_22058 ) ) ( not ( = ?auto_22041 ?auto_22067 ) ) ( not ( = ?auto_22041 ?auto_22060 ) ) ( not ( = ?auto_22082 ?auto_22074 ) ) ( not ( = ?auto_22082 ?auto_22057 ) ) ( not ( = ?auto_22082 ?auto_22054 ) ) ( not ( = ?auto_22082 ?auto_22078 ) ) ( not ( = ?auto_22068 ?auto_22083 ) ) ( not ( = ?auto_22068 ?auto_22073 ) ) ( not ( = ?auto_22068 ?auto_22072 ) ) ( not ( = ?auto_22068 ?auto_22069 ) ) ( not ( = ?auto_22080 ?auto_22056 ) ) ( not ( = ?auto_22080 ?auto_22066 ) ) ( not ( = ?auto_22080 ?auto_22079 ) ) ( not ( = ?auto_22080 ?auto_22058 ) ) ( not ( = ?auto_22080 ?auto_22067 ) ) ( not ( = ?auto_22080 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22040 ) ) ( not ( = ?auto_22032 ?auto_22077 ) ) ( not ( = ?auto_22033 ?auto_22040 ) ) ( not ( = ?auto_22033 ?auto_22077 ) ) ( not ( = ?auto_22034 ?auto_22040 ) ) ( not ( = ?auto_22034 ?auto_22077 ) ) ( not ( = ?auto_22035 ?auto_22040 ) ) ( not ( = ?auto_22035 ?auto_22077 ) ) ( not ( = ?auto_22036 ?auto_22040 ) ) ( not ( = ?auto_22036 ?auto_22077 ) ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22077 ) ) ( not ( = ?auto_22037 ?auto_22040 ) ) ( not ( = ?auto_22037 ?auto_22077 ) ) ( not ( = ?auto_22040 ?auto_22080 ) ) ( not ( = ?auto_22040 ?auto_22056 ) ) ( not ( = ?auto_22040 ?auto_22066 ) ) ( not ( = ?auto_22040 ?auto_22079 ) ) ( not ( = ?auto_22040 ?auto_22058 ) ) ( not ( = ?auto_22040 ?auto_22067 ) ) ( not ( = ?auto_22040 ?auto_22060 ) ) ( not ( = ?auto_22065 ?auto_22082 ) ) ( not ( = ?auto_22065 ?auto_22074 ) ) ( not ( = ?auto_22065 ?auto_22057 ) ) ( not ( = ?auto_22065 ?auto_22054 ) ) ( not ( = ?auto_22065 ?auto_22078 ) ) ( not ( = ?auto_22085 ?auto_22068 ) ) ( not ( = ?auto_22085 ?auto_22083 ) ) ( not ( = ?auto_22085 ?auto_22073 ) ) ( not ( = ?auto_22085 ?auto_22072 ) ) ( not ( = ?auto_22085 ?auto_22069 ) ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22077 ?auto_22056 ) ) ( not ( = ?auto_22077 ?auto_22066 ) ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( not ( = ?auto_22077 ?auto_22058 ) ) ( not ( = ?auto_22077 ?auto_22067 ) ) ( not ( = ?auto_22077 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22038 ) ) ( not ( = ?auto_22032 ?auto_22081 ) ) ( not ( = ?auto_22033 ?auto_22038 ) ) ( not ( = ?auto_22033 ?auto_22081 ) ) ( not ( = ?auto_22034 ?auto_22038 ) ) ( not ( = ?auto_22034 ?auto_22081 ) ) ( not ( = ?auto_22035 ?auto_22038 ) ) ( not ( = ?auto_22035 ?auto_22081 ) ) ( not ( = ?auto_22036 ?auto_22038 ) ) ( not ( = ?auto_22036 ?auto_22081 ) ) ( not ( = ?auto_22039 ?auto_22038 ) ) ( not ( = ?auto_22039 ?auto_22081 ) ) ( not ( = ?auto_22037 ?auto_22038 ) ) ( not ( = ?auto_22037 ?auto_22081 ) ) ( not ( = ?auto_22041 ?auto_22038 ) ) ( not ( = ?auto_22041 ?auto_22081 ) ) ( not ( = ?auto_22038 ?auto_22077 ) ) ( not ( = ?auto_22038 ?auto_22080 ) ) ( not ( = ?auto_22038 ?auto_22056 ) ) ( not ( = ?auto_22038 ?auto_22066 ) ) ( not ( = ?auto_22038 ?auto_22079 ) ) ( not ( = ?auto_22038 ?auto_22058 ) ) ( not ( = ?auto_22038 ?auto_22067 ) ) ( not ( = ?auto_22038 ?auto_22060 ) ) ( not ( = ?auto_22052 ?auto_22065 ) ) ( not ( = ?auto_22052 ?auto_22082 ) ) ( not ( = ?auto_22052 ?auto_22074 ) ) ( not ( = ?auto_22052 ?auto_22057 ) ) ( not ( = ?auto_22052 ?auto_22054 ) ) ( not ( = ?auto_22052 ?auto_22078 ) ) ( not ( = ?auto_22050 ?auto_22085 ) ) ( not ( = ?auto_22050 ?auto_22068 ) ) ( not ( = ?auto_22050 ?auto_22083 ) ) ( not ( = ?auto_22050 ?auto_22073 ) ) ( not ( = ?auto_22050 ?auto_22072 ) ) ( not ( = ?auto_22050 ?auto_22069 ) ) ( not ( = ?auto_22081 ?auto_22077 ) ) ( not ( = ?auto_22081 ?auto_22080 ) ) ( not ( = ?auto_22081 ?auto_22056 ) ) ( not ( = ?auto_22081 ?auto_22066 ) ) ( not ( = ?auto_22081 ?auto_22079 ) ) ( not ( = ?auto_22081 ?auto_22058 ) ) ( not ( = ?auto_22081 ?auto_22067 ) ) ( not ( = ?auto_22081 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22043 ) ) ( not ( = ?auto_22032 ?auto_22075 ) ) ( not ( = ?auto_22033 ?auto_22043 ) ) ( not ( = ?auto_22033 ?auto_22075 ) ) ( not ( = ?auto_22034 ?auto_22043 ) ) ( not ( = ?auto_22034 ?auto_22075 ) ) ( not ( = ?auto_22035 ?auto_22043 ) ) ( not ( = ?auto_22035 ?auto_22075 ) ) ( not ( = ?auto_22036 ?auto_22043 ) ) ( not ( = ?auto_22036 ?auto_22075 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22075 ) ) ( not ( = ?auto_22037 ?auto_22043 ) ) ( not ( = ?auto_22037 ?auto_22075 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22075 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22075 ) ) ( not ( = ?auto_22043 ?auto_22081 ) ) ( not ( = ?auto_22043 ?auto_22077 ) ) ( not ( = ?auto_22043 ?auto_22080 ) ) ( not ( = ?auto_22043 ?auto_22056 ) ) ( not ( = ?auto_22043 ?auto_22066 ) ) ( not ( = ?auto_22043 ?auto_22079 ) ) ( not ( = ?auto_22043 ?auto_22058 ) ) ( not ( = ?auto_22043 ?auto_22067 ) ) ( not ( = ?auto_22043 ?auto_22060 ) ) ( not ( = ?auto_22061 ?auto_22052 ) ) ( not ( = ?auto_22061 ?auto_22065 ) ) ( not ( = ?auto_22061 ?auto_22082 ) ) ( not ( = ?auto_22061 ?auto_22074 ) ) ( not ( = ?auto_22061 ?auto_22057 ) ) ( not ( = ?auto_22061 ?auto_22054 ) ) ( not ( = ?auto_22061 ?auto_22078 ) ) ( not ( = ?auto_22070 ?auto_22050 ) ) ( not ( = ?auto_22070 ?auto_22085 ) ) ( not ( = ?auto_22070 ?auto_22068 ) ) ( not ( = ?auto_22070 ?auto_22083 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22069 ) ) ( not ( = ?auto_22075 ?auto_22081 ) ) ( not ( = ?auto_22075 ?auto_22077 ) ) ( not ( = ?auto_22075 ?auto_22080 ) ) ( not ( = ?auto_22075 ?auto_22056 ) ) ( not ( = ?auto_22075 ?auto_22066 ) ) ( not ( = ?auto_22075 ?auto_22079 ) ) ( not ( = ?auto_22075 ?auto_22058 ) ) ( not ( = ?auto_22075 ?auto_22067 ) ) ( not ( = ?auto_22075 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22042 ) ) ( not ( = ?auto_22032 ?auto_22059 ) ) ( not ( = ?auto_22033 ?auto_22042 ) ) ( not ( = ?auto_22033 ?auto_22059 ) ) ( not ( = ?auto_22034 ?auto_22042 ) ) ( not ( = ?auto_22034 ?auto_22059 ) ) ( not ( = ?auto_22035 ?auto_22042 ) ) ( not ( = ?auto_22035 ?auto_22059 ) ) ( not ( = ?auto_22036 ?auto_22042 ) ) ( not ( = ?auto_22036 ?auto_22059 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22059 ) ) ( not ( = ?auto_22037 ?auto_22042 ) ) ( not ( = ?auto_22037 ?auto_22059 ) ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22059 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22059 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22059 ) ) ( not ( = ?auto_22042 ?auto_22075 ) ) ( not ( = ?auto_22042 ?auto_22081 ) ) ( not ( = ?auto_22042 ?auto_22077 ) ) ( not ( = ?auto_22042 ?auto_22080 ) ) ( not ( = ?auto_22042 ?auto_22056 ) ) ( not ( = ?auto_22042 ?auto_22066 ) ) ( not ( = ?auto_22042 ?auto_22079 ) ) ( not ( = ?auto_22042 ?auto_22058 ) ) ( not ( = ?auto_22042 ?auto_22067 ) ) ( not ( = ?auto_22042 ?auto_22060 ) ) ( not ( = ?auto_22063 ?auto_22061 ) ) ( not ( = ?auto_22063 ?auto_22052 ) ) ( not ( = ?auto_22063 ?auto_22065 ) ) ( not ( = ?auto_22063 ?auto_22082 ) ) ( not ( = ?auto_22063 ?auto_22074 ) ) ( not ( = ?auto_22063 ?auto_22057 ) ) ( not ( = ?auto_22063 ?auto_22054 ) ) ( not ( = ?auto_22063 ?auto_22078 ) ) ( not ( = ?auto_22064 ?auto_22070 ) ) ( not ( = ?auto_22064 ?auto_22050 ) ) ( not ( = ?auto_22064 ?auto_22085 ) ) ( not ( = ?auto_22064 ?auto_22068 ) ) ( not ( = ?auto_22064 ?auto_22083 ) ) ( not ( = ?auto_22064 ?auto_22073 ) ) ( not ( = ?auto_22064 ?auto_22072 ) ) ( not ( = ?auto_22064 ?auto_22069 ) ) ( not ( = ?auto_22059 ?auto_22075 ) ) ( not ( = ?auto_22059 ?auto_22081 ) ) ( not ( = ?auto_22059 ?auto_22077 ) ) ( not ( = ?auto_22059 ?auto_22080 ) ) ( not ( = ?auto_22059 ?auto_22056 ) ) ( not ( = ?auto_22059 ?auto_22066 ) ) ( not ( = ?auto_22059 ?auto_22079 ) ) ( not ( = ?auto_22059 ?auto_22058 ) ) ( not ( = ?auto_22059 ?auto_22067 ) ) ( not ( = ?auto_22059 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22044 ) ) ( not ( = ?auto_22032 ?auto_22076 ) ) ( not ( = ?auto_22033 ?auto_22044 ) ) ( not ( = ?auto_22033 ?auto_22076 ) ) ( not ( = ?auto_22034 ?auto_22044 ) ) ( not ( = ?auto_22034 ?auto_22076 ) ) ( not ( = ?auto_22035 ?auto_22044 ) ) ( not ( = ?auto_22035 ?auto_22076 ) ) ( not ( = ?auto_22036 ?auto_22044 ) ) ( not ( = ?auto_22036 ?auto_22076 ) ) ( not ( = ?auto_22039 ?auto_22044 ) ) ( not ( = ?auto_22039 ?auto_22076 ) ) ( not ( = ?auto_22037 ?auto_22044 ) ) ( not ( = ?auto_22037 ?auto_22076 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22076 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22076 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22038 ?auto_22076 ) ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22076 ) ) ( not ( = ?auto_22044 ?auto_22059 ) ) ( not ( = ?auto_22044 ?auto_22075 ) ) ( not ( = ?auto_22044 ?auto_22081 ) ) ( not ( = ?auto_22044 ?auto_22077 ) ) ( not ( = ?auto_22044 ?auto_22080 ) ) ( not ( = ?auto_22044 ?auto_22056 ) ) ( not ( = ?auto_22044 ?auto_22066 ) ) ( not ( = ?auto_22044 ?auto_22079 ) ) ( not ( = ?auto_22044 ?auto_22058 ) ) ( not ( = ?auto_22044 ?auto_22067 ) ) ( not ( = ?auto_22044 ?auto_22060 ) ) ( not ( = ?auto_22076 ?auto_22059 ) ) ( not ( = ?auto_22076 ?auto_22075 ) ) ( not ( = ?auto_22076 ?auto_22081 ) ) ( not ( = ?auto_22076 ?auto_22077 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22076 ?auto_22056 ) ) ( not ( = ?auto_22076 ?auto_22066 ) ) ( not ( = ?auto_22076 ?auto_22079 ) ) ( not ( = ?auto_22076 ?auto_22058 ) ) ( not ( = ?auto_22076 ?auto_22067 ) ) ( not ( = ?auto_22076 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22046 ) ) ( not ( = ?auto_22032 ?auto_22055 ) ) ( not ( = ?auto_22033 ?auto_22046 ) ) ( not ( = ?auto_22033 ?auto_22055 ) ) ( not ( = ?auto_22034 ?auto_22046 ) ) ( not ( = ?auto_22034 ?auto_22055 ) ) ( not ( = ?auto_22035 ?auto_22046 ) ) ( not ( = ?auto_22035 ?auto_22055 ) ) ( not ( = ?auto_22036 ?auto_22046 ) ) ( not ( = ?auto_22036 ?auto_22055 ) ) ( not ( = ?auto_22039 ?auto_22046 ) ) ( not ( = ?auto_22039 ?auto_22055 ) ) ( not ( = ?auto_22037 ?auto_22046 ) ) ( not ( = ?auto_22037 ?auto_22055 ) ) ( not ( = ?auto_22041 ?auto_22046 ) ) ( not ( = ?auto_22041 ?auto_22055 ) ) ( not ( = ?auto_22040 ?auto_22046 ) ) ( not ( = ?auto_22040 ?auto_22055 ) ) ( not ( = ?auto_22038 ?auto_22046 ) ) ( not ( = ?auto_22038 ?auto_22055 ) ) ( not ( = ?auto_22043 ?auto_22046 ) ) ( not ( = ?auto_22043 ?auto_22055 ) ) ( not ( = ?auto_22042 ?auto_22046 ) ) ( not ( = ?auto_22042 ?auto_22055 ) ) ( not ( = ?auto_22046 ?auto_22076 ) ) ( not ( = ?auto_22046 ?auto_22059 ) ) ( not ( = ?auto_22046 ?auto_22075 ) ) ( not ( = ?auto_22046 ?auto_22081 ) ) ( not ( = ?auto_22046 ?auto_22077 ) ) ( not ( = ?auto_22046 ?auto_22080 ) ) ( not ( = ?auto_22046 ?auto_22056 ) ) ( not ( = ?auto_22046 ?auto_22066 ) ) ( not ( = ?auto_22046 ?auto_22079 ) ) ( not ( = ?auto_22046 ?auto_22058 ) ) ( not ( = ?auto_22046 ?auto_22067 ) ) ( not ( = ?auto_22046 ?auto_22060 ) ) ( not ( = ?auto_22055 ?auto_22076 ) ) ( not ( = ?auto_22055 ?auto_22059 ) ) ( not ( = ?auto_22055 ?auto_22075 ) ) ( not ( = ?auto_22055 ?auto_22081 ) ) ( not ( = ?auto_22055 ?auto_22077 ) ) ( not ( = ?auto_22055 ?auto_22080 ) ) ( not ( = ?auto_22055 ?auto_22056 ) ) ( not ( = ?auto_22055 ?auto_22066 ) ) ( not ( = ?auto_22055 ?auto_22079 ) ) ( not ( = ?auto_22055 ?auto_22058 ) ) ( not ( = ?auto_22055 ?auto_22067 ) ) ( not ( = ?auto_22055 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22047 ) ) ( not ( = ?auto_22032 ?auto_22071 ) ) ( not ( = ?auto_22033 ?auto_22047 ) ) ( not ( = ?auto_22033 ?auto_22071 ) ) ( not ( = ?auto_22034 ?auto_22047 ) ) ( not ( = ?auto_22034 ?auto_22071 ) ) ( not ( = ?auto_22035 ?auto_22047 ) ) ( not ( = ?auto_22035 ?auto_22071 ) ) ( not ( = ?auto_22036 ?auto_22047 ) ) ( not ( = ?auto_22036 ?auto_22071 ) ) ( not ( = ?auto_22039 ?auto_22047 ) ) ( not ( = ?auto_22039 ?auto_22071 ) ) ( not ( = ?auto_22037 ?auto_22047 ) ) ( not ( = ?auto_22037 ?auto_22071 ) ) ( not ( = ?auto_22041 ?auto_22047 ) ) ( not ( = ?auto_22041 ?auto_22071 ) ) ( not ( = ?auto_22040 ?auto_22047 ) ) ( not ( = ?auto_22040 ?auto_22071 ) ) ( not ( = ?auto_22038 ?auto_22047 ) ) ( not ( = ?auto_22038 ?auto_22071 ) ) ( not ( = ?auto_22043 ?auto_22047 ) ) ( not ( = ?auto_22043 ?auto_22071 ) ) ( not ( = ?auto_22042 ?auto_22047 ) ) ( not ( = ?auto_22042 ?auto_22071 ) ) ( not ( = ?auto_22044 ?auto_22047 ) ) ( not ( = ?auto_22044 ?auto_22071 ) ) ( not ( = ?auto_22047 ?auto_22055 ) ) ( not ( = ?auto_22047 ?auto_22076 ) ) ( not ( = ?auto_22047 ?auto_22059 ) ) ( not ( = ?auto_22047 ?auto_22075 ) ) ( not ( = ?auto_22047 ?auto_22081 ) ) ( not ( = ?auto_22047 ?auto_22077 ) ) ( not ( = ?auto_22047 ?auto_22080 ) ) ( not ( = ?auto_22047 ?auto_22056 ) ) ( not ( = ?auto_22047 ?auto_22066 ) ) ( not ( = ?auto_22047 ?auto_22079 ) ) ( not ( = ?auto_22047 ?auto_22058 ) ) ( not ( = ?auto_22047 ?auto_22067 ) ) ( not ( = ?auto_22047 ?auto_22060 ) ) ( not ( = ?auto_22084 ?auto_22065 ) ) ( not ( = ?auto_22084 ?auto_22063 ) ) ( not ( = ?auto_22084 ?auto_22061 ) ) ( not ( = ?auto_22084 ?auto_22052 ) ) ( not ( = ?auto_22084 ?auto_22082 ) ) ( not ( = ?auto_22084 ?auto_22074 ) ) ( not ( = ?auto_22084 ?auto_22057 ) ) ( not ( = ?auto_22084 ?auto_22054 ) ) ( not ( = ?auto_22084 ?auto_22078 ) ) ( not ( = ?auto_22062 ?auto_22085 ) ) ( not ( = ?auto_22062 ?auto_22064 ) ) ( not ( = ?auto_22062 ?auto_22070 ) ) ( not ( = ?auto_22062 ?auto_22050 ) ) ( not ( = ?auto_22062 ?auto_22068 ) ) ( not ( = ?auto_22062 ?auto_22083 ) ) ( not ( = ?auto_22062 ?auto_22073 ) ) ( not ( = ?auto_22062 ?auto_22072 ) ) ( not ( = ?auto_22062 ?auto_22069 ) ) ( not ( = ?auto_22071 ?auto_22055 ) ) ( not ( = ?auto_22071 ?auto_22076 ) ) ( not ( = ?auto_22071 ?auto_22059 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22081 ) ) ( not ( = ?auto_22071 ?auto_22077 ) ) ( not ( = ?auto_22071 ?auto_22080 ) ) ( not ( = ?auto_22071 ?auto_22056 ) ) ( not ( = ?auto_22071 ?auto_22066 ) ) ( not ( = ?auto_22071 ?auto_22079 ) ) ( not ( = ?auto_22071 ?auto_22058 ) ) ( not ( = ?auto_22071 ?auto_22067 ) ) ( not ( = ?auto_22071 ?auto_22060 ) ) ( not ( = ?auto_22032 ?auto_22045 ) ) ( not ( = ?auto_22032 ?auto_22049 ) ) ( not ( = ?auto_22033 ?auto_22045 ) ) ( not ( = ?auto_22033 ?auto_22049 ) ) ( not ( = ?auto_22034 ?auto_22045 ) ) ( not ( = ?auto_22034 ?auto_22049 ) ) ( not ( = ?auto_22035 ?auto_22045 ) ) ( not ( = ?auto_22035 ?auto_22049 ) ) ( not ( = ?auto_22036 ?auto_22045 ) ) ( not ( = ?auto_22036 ?auto_22049 ) ) ( not ( = ?auto_22039 ?auto_22045 ) ) ( not ( = ?auto_22039 ?auto_22049 ) ) ( not ( = ?auto_22037 ?auto_22045 ) ) ( not ( = ?auto_22037 ?auto_22049 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22049 ) ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22040 ?auto_22049 ) ) ( not ( = ?auto_22038 ?auto_22045 ) ) ( not ( = ?auto_22038 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( not ( = ?auto_22046 ?auto_22045 ) ) ( not ( = ?auto_22046 ?auto_22049 ) ) ( not ( = ?auto_22045 ?auto_22071 ) ) ( not ( = ?auto_22045 ?auto_22055 ) ) ( not ( = ?auto_22045 ?auto_22076 ) ) ( not ( = ?auto_22045 ?auto_22059 ) ) ( not ( = ?auto_22045 ?auto_22075 ) ) ( not ( = ?auto_22045 ?auto_22081 ) ) ( not ( = ?auto_22045 ?auto_22077 ) ) ( not ( = ?auto_22045 ?auto_22080 ) ) ( not ( = ?auto_22045 ?auto_22056 ) ) ( not ( = ?auto_22045 ?auto_22066 ) ) ( not ( = ?auto_22045 ?auto_22079 ) ) ( not ( = ?auto_22045 ?auto_22058 ) ) ( not ( = ?auto_22045 ?auto_22067 ) ) ( not ( = ?auto_22045 ?auto_22060 ) ) ( not ( = ?auto_22049 ?auto_22071 ) ) ( not ( = ?auto_22049 ?auto_22055 ) ) ( not ( = ?auto_22049 ?auto_22076 ) ) ( not ( = ?auto_22049 ?auto_22059 ) ) ( not ( = ?auto_22049 ?auto_22075 ) ) ( not ( = ?auto_22049 ?auto_22081 ) ) ( not ( = ?auto_22049 ?auto_22077 ) ) ( not ( = ?auto_22049 ?auto_22080 ) ) ( not ( = ?auto_22049 ?auto_22056 ) ) ( not ( = ?auto_22049 ?auto_22066 ) ) ( not ( = ?auto_22049 ?auto_22079 ) ) ( not ( = ?auto_22049 ?auto_22058 ) ) ( not ( = ?auto_22049 ?auto_22067 ) ) ( not ( = ?auto_22049 ?auto_22060 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22032 ?auto_22033 ?auto_22034 ?auto_22035 ?auto_22036 ?auto_22039 ?auto_22037 ?auto_22041 ?auto_22040 ?auto_22038 ?auto_22043 ?auto_22042 ?auto_22044 ?auto_22046 ?auto_22047 )
      ( MAKE-1CRATE ?auto_22047 ?auto_22045 )
      ( MAKE-15CRATE-VERIFY ?auto_22032 ?auto_22033 ?auto_22034 ?auto_22035 ?auto_22036 ?auto_22039 ?auto_22037 ?auto_22041 ?auto_22040 ?auto_22038 ?auto_22043 ?auto_22042 ?auto_22044 ?auto_22046 ?auto_22047 ?auto_22045 ) )
  )

)

