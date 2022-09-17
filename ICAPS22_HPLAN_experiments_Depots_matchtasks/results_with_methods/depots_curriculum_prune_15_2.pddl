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
      ?auto_21362 - PLACE
      ?auto_21361 - PLACE
      ?auto_21359 - HOIST
      ?auto_21364 - SURFACE
      ?auto_21367 - PLACE
      ?auto_21366 - HOIST
      ?auto_21365 - SURFACE
      ?auto_21363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21360 ?auto_21362 ) ( IS-CRATE ?auto_21358 ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( HOIST-AT ?auto_21359 ?auto_21361 ) ( AVAILABLE ?auto_21359 ) ( SURFACE-AT ?auto_21358 ?auto_21361 ) ( ON ?auto_21358 ?auto_21364 ) ( CLEAR ?auto_21358 ) ( not ( = ?auto_21357 ?auto_21358 ) ) ( not ( = ?auto_21357 ?auto_21364 ) ) ( not ( = ?auto_21358 ?auto_21364 ) ) ( not ( = ?auto_21360 ?auto_21359 ) ) ( SURFACE-AT ?auto_21356 ?auto_21362 ) ( CLEAR ?auto_21356 ) ( IS-CRATE ?auto_21357 ) ( AVAILABLE ?auto_21360 ) ( not ( = ?auto_21367 ?auto_21362 ) ) ( HOIST-AT ?auto_21366 ?auto_21367 ) ( AVAILABLE ?auto_21366 ) ( SURFACE-AT ?auto_21357 ?auto_21367 ) ( ON ?auto_21357 ?auto_21365 ) ( CLEAR ?auto_21357 ) ( TRUCK-AT ?auto_21363 ?auto_21362 ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21365 ) ) ( not ( = ?auto_21357 ?auto_21365 ) ) ( not ( = ?auto_21360 ?auto_21366 ) ) ( not ( = ?auto_21356 ?auto_21358 ) ) ( not ( = ?auto_21356 ?auto_21364 ) ) ( not ( = ?auto_21358 ?auto_21365 ) ) ( not ( = ?auto_21361 ?auto_21367 ) ) ( not ( = ?auto_21359 ?auto_21366 ) ) ( not ( = ?auto_21364 ?auto_21365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21356 ?auto_21357 )
      ( MAKE-1CRATE ?auto_21357 ?auto_21358 )
      ( MAKE-2CRATE-VERIFY ?auto_21356 ?auto_21357 ?auto_21358 ) )
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
      ?auto_21389 - PLACE
      ?auto_21391 - PLACE
      ?auto_21386 - HOIST
      ?auto_21388 - SURFACE
      ?auto_21395 - SURFACE
      ?auto_21393 - PLACE
      ?auto_21392 - HOIST
      ?auto_21394 - SURFACE
      ?auto_21387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21390 ?auto_21389 ) ( IS-CRATE ?auto_21385 ) ( not ( = ?auto_21391 ?auto_21389 ) ) ( HOIST-AT ?auto_21386 ?auto_21391 ) ( SURFACE-AT ?auto_21385 ?auto_21391 ) ( ON ?auto_21385 ?auto_21388 ) ( CLEAR ?auto_21385 ) ( not ( = ?auto_21384 ?auto_21385 ) ) ( not ( = ?auto_21384 ?auto_21388 ) ) ( not ( = ?auto_21385 ?auto_21388 ) ) ( not ( = ?auto_21390 ?auto_21386 ) ) ( IS-CRATE ?auto_21384 ) ( AVAILABLE ?auto_21386 ) ( SURFACE-AT ?auto_21384 ?auto_21391 ) ( ON ?auto_21384 ?auto_21395 ) ( CLEAR ?auto_21384 ) ( not ( = ?auto_21383 ?auto_21384 ) ) ( not ( = ?auto_21383 ?auto_21395 ) ) ( not ( = ?auto_21384 ?auto_21395 ) ) ( SURFACE-AT ?auto_21382 ?auto_21389 ) ( CLEAR ?auto_21382 ) ( IS-CRATE ?auto_21383 ) ( AVAILABLE ?auto_21390 ) ( not ( = ?auto_21393 ?auto_21389 ) ) ( HOIST-AT ?auto_21392 ?auto_21393 ) ( AVAILABLE ?auto_21392 ) ( SURFACE-AT ?auto_21383 ?auto_21393 ) ( ON ?auto_21383 ?auto_21394 ) ( CLEAR ?auto_21383 ) ( TRUCK-AT ?auto_21387 ?auto_21389 ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21382 ?auto_21394 ) ) ( not ( = ?auto_21383 ?auto_21394 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( not ( = ?auto_21382 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21395 ) ) ( not ( = ?auto_21384 ?auto_21394 ) ) ( not ( = ?auto_21391 ?auto_21393 ) ) ( not ( = ?auto_21386 ?auto_21392 ) ) ( not ( = ?auto_21395 ?auto_21394 ) ) ( not ( = ?auto_21382 ?auto_21385 ) ) ( not ( = ?auto_21382 ?auto_21388 ) ) ( not ( = ?auto_21383 ?auto_21385 ) ) ( not ( = ?auto_21383 ?auto_21388 ) ) ( not ( = ?auto_21385 ?auto_21395 ) ) ( not ( = ?auto_21385 ?auto_21394 ) ) ( not ( = ?auto_21388 ?auto_21395 ) ) ( not ( = ?auto_21388 ?auto_21394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21382 ?auto_21383 ?auto_21384 )
      ( MAKE-1CRATE ?auto_21384 ?auto_21385 )
      ( MAKE-3CRATE-VERIFY ?auto_21382 ?auto_21383 ?auto_21384 ?auto_21385 ) )
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
      ?auto_21418 - HOIST
      ?auto_21416 - PLACE
      ?auto_21421 - PLACE
      ?auto_21417 - HOIST
      ?auto_21420 - SURFACE
      ?auto_21423 - PLACE
      ?auto_21422 - HOIST
      ?auto_21425 - SURFACE
      ?auto_21428 - SURFACE
      ?auto_21427 - PLACE
      ?auto_21426 - HOIST
      ?auto_21424 - SURFACE
      ?auto_21419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21418 ?auto_21416 ) ( IS-CRATE ?auto_21415 ) ( not ( = ?auto_21421 ?auto_21416 ) ) ( HOIST-AT ?auto_21417 ?auto_21421 ) ( AVAILABLE ?auto_21417 ) ( SURFACE-AT ?auto_21415 ?auto_21421 ) ( ON ?auto_21415 ?auto_21420 ) ( CLEAR ?auto_21415 ) ( not ( = ?auto_21414 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21420 ) ) ( not ( = ?auto_21415 ?auto_21420 ) ) ( not ( = ?auto_21418 ?auto_21417 ) ) ( IS-CRATE ?auto_21414 ) ( not ( = ?auto_21423 ?auto_21416 ) ) ( HOIST-AT ?auto_21422 ?auto_21423 ) ( SURFACE-AT ?auto_21414 ?auto_21423 ) ( ON ?auto_21414 ?auto_21425 ) ( CLEAR ?auto_21414 ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21413 ?auto_21425 ) ) ( not ( = ?auto_21414 ?auto_21425 ) ) ( not ( = ?auto_21418 ?auto_21422 ) ) ( IS-CRATE ?auto_21413 ) ( AVAILABLE ?auto_21422 ) ( SURFACE-AT ?auto_21413 ?auto_21423 ) ( ON ?auto_21413 ?auto_21428 ) ( CLEAR ?auto_21413 ) ( not ( = ?auto_21412 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21428 ) ) ( not ( = ?auto_21413 ?auto_21428 ) ) ( SURFACE-AT ?auto_21411 ?auto_21416 ) ( CLEAR ?auto_21411 ) ( IS-CRATE ?auto_21412 ) ( AVAILABLE ?auto_21418 ) ( not ( = ?auto_21427 ?auto_21416 ) ) ( HOIST-AT ?auto_21426 ?auto_21427 ) ( AVAILABLE ?auto_21426 ) ( SURFACE-AT ?auto_21412 ?auto_21427 ) ( ON ?auto_21412 ?auto_21424 ) ( CLEAR ?auto_21412 ) ( TRUCK-AT ?auto_21419 ?auto_21416 ) ( not ( = ?auto_21411 ?auto_21412 ) ) ( not ( = ?auto_21411 ?auto_21424 ) ) ( not ( = ?auto_21412 ?auto_21424 ) ) ( not ( = ?auto_21418 ?auto_21426 ) ) ( not ( = ?auto_21411 ?auto_21413 ) ) ( not ( = ?auto_21411 ?auto_21428 ) ) ( not ( = ?auto_21413 ?auto_21424 ) ) ( not ( = ?auto_21423 ?auto_21427 ) ) ( not ( = ?auto_21422 ?auto_21426 ) ) ( not ( = ?auto_21428 ?auto_21424 ) ) ( not ( = ?auto_21411 ?auto_21414 ) ) ( not ( = ?auto_21411 ?auto_21425 ) ) ( not ( = ?auto_21412 ?auto_21414 ) ) ( not ( = ?auto_21412 ?auto_21425 ) ) ( not ( = ?auto_21414 ?auto_21428 ) ) ( not ( = ?auto_21414 ?auto_21424 ) ) ( not ( = ?auto_21425 ?auto_21428 ) ) ( not ( = ?auto_21425 ?auto_21424 ) ) ( not ( = ?auto_21411 ?auto_21415 ) ) ( not ( = ?auto_21411 ?auto_21420 ) ) ( not ( = ?auto_21412 ?auto_21415 ) ) ( not ( = ?auto_21412 ?auto_21420 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21420 ) ) ( not ( = ?auto_21415 ?auto_21425 ) ) ( not ( = ?auto_21415 ?auto_21428 ) ) ( not ( = ?auto_21415 ?auto_21424 ) ) ( not ( = ?auto_21421 ?auto_21423 ) ) ( not ( = ?auto_21421 ?auto_21427 ) ) ( not ( = ?auto_21417 ?auto_21422 ) ) ( not ( = ?auto_21417 ?auto_21426 ) ) ( not ( = ?auto_21420 ?auto_21425 ) ) ( not ( = ?auto_21420 ?auto_21428 ) ) ( not ( = ?auto_21420 ?auto_21424 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21411 ?auto_21412 ?auto_21413 ?auto_21414 )
      ( MAKE-1CRATE ?auto_21414 ?auto_21415 )
      ( MAKE-4CRATE-VERIFY ?auto_21411 ?auto_21412 ?auto_21413 ?auto_21414 ?auto_21415 ) )
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
      ?auto_21453 - HOIST
      ?auto_21456 - PLACE
      ?auto_21455 - PLACE
      ?auto_21454 - HOIST
      ?auto_21451 - SURFACE
      ?auto_21463 - PLACE
      ?auto_21458 - HOIST
      ?auto_21457 - SURFACE
      ?auto_21465 - PLACE
      ?auto_21466 - HOIST
      ?auto_21461 - SURFACE
      ?auto_21460 - SURFACE
      ?auto_21459 - PLACE
      ?auto_21462 - HOIST
      ?auto_21464 - SURFACE
      ?auto_21452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21453 ?auto_21456 ) ( IS-CRATE ?auto_21450 ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( HOIST-AT ?auto_21454 ?auto_21455 ) ( AVAILABLE ?auto_21454 ) ( SURFACE-AT ?auto_21450 ?auto_21455 ) ( ON ?auto_21450 ?auto_21451 ) ( CLEAR ?auto_21450 ) ( not ( = ?auto_21449 ?auto_21450 ) ) ( not ( = ?auto_21449 ?auto_21451 ) ) ( not ( = ?auto_21450 ?auto_21451 ) ) ( not ( = ?auto_21453 ?auto_21454 ) ) ( IS-CRATE ?auto_21449 ) ( not ( = ?auto_21463 ?auto_21456 ) ) ( HOIST-AT ?auto_21458 ?auto_21463 ) ( AVAILABLE ?auto_21458 ) ( SURFACE-AT ?auto_21449 ?auto_21463 ) ( ON ?auto_21449 ?auto_21457 ) ( CLEAR ?auto_21449 ) ( not ( = ?auto_21448 ?auto_21449 ) ) ( not ( = ?auto_21448 ?auto_21457 ) ) ( not ( = ?auto_21449 ?auto_21457 ) ) ( not ( = ?auto_21453 ?auto_21458 ) ) ( IS-CRATE ?auto_21448 ) ( not ( = ?auto_21465 ?auto_21456 ) ) ( HOIST-AT ?auto_21466 ?auto_21465 ) ( SURFACE-AT ?auto_21448 ?auto_21465 ) ( ON ?auto_21448 ?auto_21461 ) ( CLEAR ?auto_21448 ) ( not ( = ?auto_21447 ?auto_21448 ) ) ( not ( = ?auto_21447 ?auto_21461 ) ) ( not ( = ?auto_21448 ?auto_21461 ) ) ( not ( = ?auto_21453 ?auto_21466 ) ) ( IS-CRATE ?auto_21447 ) ( AVAILABLE ?auto_21466 ) ( SURFACE-AT ?auto_21447 ?auto_21465 ) ( ON ?auto_21447 ?auto_21460 ) ( CLEAR ?auto_21447 ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21460 ) ) ( not ( = ?auto_21447 ?auto_21460 ) ) ( SURFACE-AT ?auto_21445 ?auto_21456 ) ( CLEAR ?auto_21445 ) ( IS-CRATE ?auto_21446 ) ( AVAILABLE ?auto_21453 ) ( not ( = ?auto_21459 ?auto_21456 ) ) ( HOIST-AT ?auto_21462 ?auto_21459 ) ( AVAILABLE ?auto_21462 ) ( SURFACE-AT ?auto_21446 ?auto_21459 ) ( ON ?auto_21446 ?auto_21464 ) ( CLEAR ?auto_21446 ) ( TRUCK-AT ?auto_21452 ?auto_21456 ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21464 ) ) ( not ( = ?auto_21446 ?auto_21464 ) ) ( not ( = ?auto_21453 ?auto_21462 ) ) ( not ( = ?auto_21445 ?auto_21447 ) ) ( not ( = ?auto_21445 ?auto_21460 ) ) ( not ( = ?auto_21447 ?auto_21464 ) ) ( not ( = ?auto_21465 ?auto_21459 ) ) ( not ( = ?auto_21466 ?auto_21462 ) ) ( not ( = ?auto_21460 ?auto_21464 ) ) ( not ( = ?auto_21445 ?auto_21448 ) ) ( not ( = ?auto_21445 ?auto_21461 ) ) ( not ( = ?auto_21446 ?auto_21448 ) ) ( not ( = ?auto_21446 ?auto_21461 ) ) ( not ( = ?auto_21448 ?auto_21460 ) ) ( not ( = ?auto_21448 ?auto_21464 ) ) ( not ( = ?auto_21461 ?auto_21460 ) ) ( not ( = ?auto_21461 ?auto_21464 ) ) ( not ( = ?auto_21445 ?auto_21449 ) ) ( not ( = ?auto_21445 ?auto_21457 ) ) ( not ( = ?auto_21446 ?auto_21449 ) ) ( not ( = ?auto_21446 ?auto_21457 ) ) ( not ( = ?auto_21447 ?auto_21449 ) ) ( not ( = ?auto_21447 ?auto_21457 ) ) ( not ( = ?auto_21449 ?auto_21461 ) ) ( not ( = ?auto_21449 ?auto_21460 ) ) ( not ( = ?auto_21449 ?auto_21464 ) ) ( not ( = ?auto_21463 ?auto_21465 ) ) ( not ( = ?auto_21463 ?auto_21459 ) ) ( not ( = ?auto_21458 ?auto_21466 ) ) ( not ( = ?auto_21458 ?auto_21462 ) ) ( not ( = ?auto_21457 ?auto_21461 ) ) ( not ( = ?auto_21457 ?auto_21460 ) ) ( not ( = ?auto_21457 ?auto_21464 ) ) ( not ( = ?auto_21445 ?auto_21450 ) ) ( not ( = ?auto_21445 ?auto_21451 ) ) ( not ( = ?auto_21446 ?auto_21450 ) ) ( not ( = ?auto_21446 ?auto_21451 ) ) ( not ( = ?auto_21447 ?auto_21450 ) ) ( not ( = ?auto_21447 ?auto_21451 ) ) ( not ( = ?auto_21448 ?auto_21450 ) ) ( not ( = ?auto_21448 ?auto_21451 ) ) ( not ( = ?auto_21450 ?auto_21457 ) ) ( not ( = ?auto_21450 ?auto_21461 ) ) ( not ( = ?auto_21450 ?auto_21460 ) ) ( not ( = ?auto_21450 ?auto_21464 ) ) ( not ( = ?auto_21455 ?auto_21463 ) ) ( not ( = ?auto_21455 ?auto_21465 ) ) ( not ( = ?auto_21455 ?auto_21459 ) ) ( not ( = ?auto_21454 ?auto_21458 ) ) ( not ( = ?auto_21454 ?auto_21466 ) ) ( not ( = ?auto_21454 ?auto_21462 ) ) ( not ( = ?auto_21451 ?auto_21457 ) ) ( not ( = ?auto_21451 ?auto_21461 ) ) ( not ( = ?auto_21451 ?auto_21460 ) ) ( not ( = ?auto_21451 ?auto_21464 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21445 ?auto_21446 ?auto_21447 ?auto_21448 ?auto_21449 )
      ( MAKE-1CRATE ?auto_21449 ?auto_21450 )
      ( MAKE-5CRATE-VERIFY ?auto_21445 ?auto_21446 ?auto_21447 ?auto_21448 ?auto_21449 ?auto_21450 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_21484 - SURFACE
      ?auto_21485 - SURFACE
      ?auto_21486 - SURFACE
      ?auto_21487 - SURFACE
      ?auto_21488 - SURFACE
      ?auto_21489 - SURFACE
      ?auto_21490 - SURFACE
    )
    :vars
    (
      ?auto_21491 - HOIST
      ?auto_21494 - PLACE
      ?auto_21492 - PLACE
      ?auto_21496 - HOIST
      ?auto_21495 - SURFACE
      ?auto_21499 - PLACE
      ?auto_21503 - HOIST
      ?auto_21504 - SURFACE
      ?auto_21500 - SURFACE
      ?auto_21498 - PLACE
      ?auto_21505 - HOIST
      ?auto_21507 - SURFACE
      ?auto_21497 - SURFACE
      ?auto_21506 - PLACE
      ?auto_21501 - HOIST
      ?auto_21502 - SURFACE
      ?auto_21493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21491 ?auto_21494 ) ( IS-CRATE ?auto_21490 ) ( not ( = ?auto_21492 ?auto_21494 ) ) ( HOIST-AT ?auto_21496 ?auto_21492 ) ( SURFACE-AT ?auto_21490 ?auto_21492 ) ( ON ?auto_21490 ?auto_21495 ) ( CLEAR ?auto_21490 ) ( not ( = ?auto_21489 ?auto_21490 ) ) ( not ( = ?auto_21489 ?auto_21495 ) ) ( not ( = ?auto_21490 ?auto_21495 ) ) ( not ( = ?auto_21491 ?auto_21496 ) ) ( IS-CRATE ?auto_21489 ) ( not ( = ?auto_21499 ?auto_21494 ) ) ( HOIST-AT ?auto_21503 ?auto_21499 ) ( AVAILABLE ?auto_21503 ) ( SURFACE-AT ?auto_21489 ?auto_21499 ) ( ON ?auto_21489 ?auto_21504 ) ( CLEAR ?auto_21489 ) ( not ( = ?auto_21488 ?auto_21489 ) ) ( not ( = ?auto_21488 ?auto_21504 ) ) ( not ( = ?auto_21489 ?auto_21504 ) ) ( not ( = ?auto_21491 ?auto_21503 ) ) ( IS-CRATE ?auto_21488 ) ( AVAILABLE ?auto_21496 ) ( SURFACE-AT ?auto_21488 ?auto_21492 ) ( ON ?auto_21488 ?auto_21500 ) ( CLEAR ?auto_21488 ) ( not ( = ?auto_21487 ?auto_21488 ) ) ( not ( = ?auto_21487 ?auto_21500 ) ) ( not ( = ?auto_21488 ?auto_21500 ) ) ( IS-CRATE ?auto_21487 ) ( not ( = ?auto_21498 ?auto_21494 ) ) ( HOIST-AT ?auto_21505 ?auto_21498 ) ( SURFACE-AT ?auto_21487 ?auto_21498 ) ( ON ?auto_21487 ?auto_21507 ) ( CLEAR ?auto_21487 ) ( not ( = ?auto_21486 ?auto_21487 ) ) ( not ( = ?auto_21486 ?auto_21507 ) ) ( not ( = ?auto_21487 ?auto_21507 ) ) ( not ( = ?auto_21491 ?auto_21505 ) ) ( IS-CRATE ?auto_21486 ) ( AVAILABLE ?auto_21505 ) ( SURFACE-AT ?auto_21486 ?auto_21498 ) ( ON ?auto_21486 ?auto_21497 ) ( CLEAR ?auto_21486 ) ( not ( = ?auto_21485 ?auto_21486 ) ) ( not ( = ?auto_21485 ?auto_21497 ) ) ( not ( = ?auto_21486 ?auto_21497 ) ) ( SURFACE-AT ?auto_21484 ?auto_21494 ) ( CLEAR ?auto_21484 ) ( IS-CRATE ?auto_21485 ) ( AVAILABLE ?auto_21491 ) ( not ( = ?auto_21506 ?auto_21494 ) ) ( HOIST-AT ?auto_21501 ?auto_21506 ) ( AVAILABLE ?auto_21501 ) ( SURFACE-AT ?auto_21485 ?auto_21506 ) ( ON ?auto_21485 ?auto_21502 ) ( CLEAR ?auto_21485 ) ( TRUCK-AT ?auto_21493 ?auto_21494 ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( not ( = ?auto_21484 ?auto_21502 ) ) ( not ( = ?auto_21485 ?auto_21502 ) ) ( not ( = ?auto_21491 ?auto_21501 ) ) ( not ( = ?auto_21484 ?auto_21486 ) ) ( not ( = ?auto_21484 ?auto_21497 ) ) ( not ( = ?auto_21486 ?auto_21502 ) ) ( not ( = ?auto_21498 ?auto_21506 ) ) ( not ( = ?auto_21505 ?auto_21501 ) ) ( not ( = ?auto_21497 ?auto_21502 ) ) ( not ( = ?auto_21484 ?auto_21487 ) ) ( not ( = ?auto_21484 ?auto_21507 ) ) ( not ( = ?auto_21485 ?auto_21487 ) ) ( not ( = ?auto_21485 ?auto_21507 ) ) ( not ( = ?auto_21487 ?auto_21497 ) ) ( not ( = ?auto_21487 ?auto_21502 ) ) ( not ( = ?auto_21507 ?auto_21497 ) ) ( not ( = ?auto_21507 ?auto_21502 ) ) ( not ( = ?auto_21484 ?auto_21488 ) ) ( not ( = ?auto_21484 ?auto_21500 ) ) ( not ( = ?auto_21485 ?auto_21488 ) ) ( not ( = ?auto_21485 ?auto_21500 ) ) ( not ( = ?auto_21486 ?auto_21488 ) ) ( not ( = ?auto_21486 ?auto_21500 ) ) ( not ( = ?auto_21488 ?auto_21507 ) ) ( not ( = ?auto_21488 ?auto_21497 ) ) ( not ( = ?auto_21488 ?auto_21502 ) ) ( not ( = ?auto_21492 ?auto_21498 ) ) ( not ( = ?auto_21492 ?auto_21506 ) ) ( not ( = ?auto_21496 ?auto_21505 ) ) ( not ( = ?auto_21496 ?auto_21501 ) ) ( not ( = ?auto_21500 ?auto_21507 ) ) ( not ( = ?auto_21500 ?auto_21497 ) ) ( not ( = ?auto_21500 ?auto_21502 ) ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( not ( = ?auto_21484 ?auto_21504 ) ) ( not ( = ?auto_21485 ?auto_21489 ) ) ( not ( = ?auto_21485 ?auto_21504 ) ) ( not ( = ?auto_21486 ?auto_21489 ) ) ( not ( = ?auto_21486 ?auto_21504 ) ) ( not ( = ?auto_21487 ?auto_21489 ) ) ( not ( = ?auto_21487 ?auto_21504 ) ) ( not ( = ?auto_21489 ?auto_21500 ) ) ( not ( = ?auto_21489 ?auto_21507 ) ) ( not ( = ?auto_21489 ?auto_21497 ) ) ( not ( = ?auto_21489 ?auto_21502 ) ) ( not ( = ?auto_21499 ?auto_21492 ) ) ( not ( = ?auto_21499 ?auto_21498 ) ) ( not ( = ?auto_21499 ?auto_21506 ) ) ( not ( = ?auto_21503 ?auto_21496 ) ) ( not ( = ?auto_21503 ?auto_21505 ) ) ( not ( = ?auto_21503 ?auto_21501 ) ) ( not ( = ?auto_21504 ?auto_21500 ) ) ( not ( = ?auto_21504 ?auto_21507 ) ) ( not ( = ?auto_21504 ?auto_21497 ) ) ( not ( = ?auto_21504 ?auto_21502 ) ) ( not ( = ?auto_21484 ?auto_21490 ) ) ( not ( = ?auto_21484 ?auto_21495 ) ) ( not ( = ?auto_21485 ?auto_21490 ) ) ( not ( = ?auto_21485 ?auto_21495 ) ) ( not ( = ?auto_21486 ?auto_21490 ) ) ( not ( = ?auto_21486 ?auto_21495 ) ) ( not ( = ?auto_21487 ?auto_21490 ) ) ( not ( = ?auto_21487 ?auto_21495 ) ) ( not ( = ?auto_21488 ?auto_21490 ) ) ( not ( = ?auto_21488 ?auto_21495 ) ) ( not ( = ?auto_21490 ?auto_21504 ) ) ( not ( = ?auto_21490 ?auto_21500 ) ) ( not ( = ?auto_21490 ?auto_21507 ) ) ( not ( = ?auto_21490 ?auto_21497 ) ) ( not ( = ?auto_21490 ?auto_21502 ) ) ( not ( = ?auto_21495 ?auto_21504 ) ) ( not ( = ?auto_21495 ?auto_21500 ) ) ( not ( = ?auto_21495 ?auto_21507 ) ) ( not ( = ?auto_21495 ?auto_21497 ) ) ( not ( = ?auto_21495 ?auto_21502 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21484 ?auto_21485 ?auto_21486 ?auto_21487 ?auto_21488 ?auto_21489 )
      ( MAKE-1CRATE ?auto_21489 ?auto_21490 )
      ( MAKE-6CRATE-VERIFY ?auto_21484 ?auto_21485 ?auto_21486 ?auto_21487 ?auto_21488 ?auto_21489 ?auto_21490 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_21526 - SURFACE
      ?auto_21527 - SURFACE
      ?auto_21528 - SURFACE
      ?auto_21529 - SURFACE
      ?auto_21530 - SURFACE
      ?auto_21531 - SURFACE
      ?auto_21532 - SURFACE
      ?auto_21533 - SURFACE
    )
    :vars
    (
      ?auto_21535 - HOIST
      ?auto_21539 - PLACE
      ?auto_21536 - PLACE
      ?auto_21537 - HOIST
      ?auto_21534 - SURFACE
      ?auto_21542 - PLACE
      ?auto_21546 - HOIST
      ?auto_21552 - SURFACE
      ?auto_21548 - PLACE
      ?auto_21543 - HOIST
      ?auto_21550 - SURFACE
      ?auto_21544 - SURFACE
      ?auto_21547 - PLACE
      ?auto_21540 - HOIST
      ?auto_21549 - SURFACE
      ?auto_21541 - SURFACE
      ?auto_21553 - PLACE
      ?auto_21551 - HOIST
      ?auto_21545 - SURFACE
      ?auto_21538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21535 ?auto_21539 ) ( IS-CRATE ?auto_21533 ) ( not ( = ?auto_21536 ?auto_21539 ) ) ( HOIST-AT ?auto_21537 ?auto_21536 ) ( AVAILABLE ?auto_21537 ) ( SURFACE-AT ?auto_21533 ?auto_21536 ) ( ON ?auto_21533 ?auto_21534 ) ( CLEAR ?auto_21533 ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21532 ?auto_21534 ) ) ( not ( = ?auto_21533 ?auto_21534 ) ) ( not ( = ?auto_21535 ?auto_21537 ) ) ( IS-CRATE ?auto_21532 ) ( not ( = ?auto_21542 ?auto_21539 ) ) ( HOIST-AT ?auto_21546 ?auto_21542 ) ( SURFACE-AT ?auto_21532 ?auto_21542 ) ( ON ?auto_21532 ?auto_21552 ) ( CLEAR ?auto_21532 ) ( not ( = ?auto_21531 ?auto_21532 ) ) ( not ( = ?auto_21531 ?auto_21552 ) ) ( not ( = ?auto_21532 ?auto_21552 ) ) ( not ( = ?auto_21535 ?auto_21546 ) ) ( IS-CRATE ?auto_21531 ) ( not ( = ?auto_21548 ?auto_21539 ) ) ( HOIST-AT ?auto_21543 ?auto_21548 ) ( AVAILABLE ?auto_21543 ) ( SURFACE-AT ?auto_21531 ?auto_21548 ) ( ON ?auto_21531 ?auto_21550 ) ( CLEAR ?auto_21531 ) ( not ( = ?auto_21530 ?auto_21531 ) ) ( not ( = ?auto_21530 ?auto_21550 ) ) ( not ( = ?auto_21531 ?auto_21550 ) ) ( not ( = ?auto_21535 ?auto_21543 ) ) ( IS-CRATE ?auto_21530 ) ( AVAILABLE ?auto_21546 ) ( SURFACE-AT ?auto_21530 ?auto_21542 ) ( ON ?auto_21530 ?auto_21544 ) ( CLEAR ?auto_21530 ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21529 ?auto_21544 ) ) ( not ( = ?auto_21530 ?auto_21544 ) ) ( IS-CRATE ?auto_21529 ) ( not ( = ?auto_21547 ?auto_21539 ) ) ( HOIST-AT ?auto_21540 ?auto_21547 ) ( SURFACE-AT ?auto_21529 ?auto_21547 ) ( ON ?auto_21529 ?auto_21549 ) ( CLEAR ?auto_21529 ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21549 ) ) ( not ( = ?auto_21529 ?auto_21549 ) ) ( not ( = ?auto_21535 ?auto_21540 ) ) ( IS-CRATE ?auto_21528 ) ( AVAILABLE ?auto_21540 ) ( SURFACE-AT ?auto_21528 ?auto_21547 ) ( ON ?auto_21528 ?auto_21541 ) ( CLEAR ?auto_21528 ) ( not ( = ?auto_21527 ?auto_21528 ) ) ( not ( = ?auto_21527 ?auto_21541 ) ) ( not ( = ?auto_21528 ?auto_21541 ) ) ( SURFACE-AT ?auto_21526 ?auto_21539 ) ( CLEAR ?auto_21526 ) ( IS-CRATE ?auto_21527 ) ( AVAILABLE ?auto_21535 ) ( not ( = ?auto_21553 ?auto_21539 ) ) ( HOIST-AT ?auto_21551 ?auto_21553 ) ( AVAILABLE ?auto_21551 ) ( SURFACE-AT ?auto_21527 ?auto_21553 ) ( ON ?auto_21527 ?auto_21545 ) ( CLEAR ?auto_21527 ) ( TRUCK-AT ?auto_21538 ?auto_21539 ) ( not ( = ?auto_21526 ?auto_21527 ) ) ( not ( = ?auto_21526 ?auto_21545 ) ) ( not ( = ?auto_21527 ?auto_21545 ) ) ( not ( = ?auto_21535 ?auto_21551 ) ) ( not ( = ?auto_21526 ?auto_21528 ) ) ( not ( = ?auto_21526 ?auto_21541 ) ) ( not ( = ?auto_21528 ?auto_21545 ) ) ( not ( = ?auto_21547 ?auto_21553 ) ) ( not ( = ?auto_21540 ?auto_21551 ) ) ( not ( = ?auto_21541 ?auto_21545 ) ) ( not ( = ?auto_21526 ?auto_21529 ) ) ( not ( = ?auto_21526 ?auto_21549 ) ) ( not ( = ?auto_21527 ?auto_21529 ) ) ( not ( = ?auto_21527 ?auto_21549 ) ) ( not ( = ?auto_21529 ?auto_21541 ) ) ( not ( = ?auto_21529 ?auto_21545 ) ) ( not ( = ?auto_21549 ?auto_21541 ) ) ( not ( = ?auto_21549 ?auto_21545 ) ) ( not ( = ?auto_21526 ?auto_21530 ) ) ( not ( = ?auto_21526 ?auto_21544 ) ) ( not ( = ?auto_21527 ?auto_21530 ) ) ( not ( = ?auto_21527 ?auto_21544 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21544 ) ) ( not ( = ?auto_21530 ?auto_21549 ) ) ( not ( = ?auto_21530 ?auto_21541 ) ) ( not ( = ?auto_21530 ?auto_21545 ) ) ( not ( = ?auto_21542 ?auto_21547 ) ) ( not ( = ?auto_21542 ?auto_21553 ) ) ( not ( = ?auto_21546 ?auto_21540 ) ) ( not ( = ?auto_21546 ?auto_21551 ) ) ( not ( = ?auto_21544 ?auto_21549 ) ) ( not ( = ?auto_21544 ?auto_21541 ) ) ( not ( = ?auto_21544 ?auto_21545 ) ) ( not ( = ?auto_21526 ?auto_21531 ) ) ( not ( = ?auto_21526 ?auto_21550 ) ) ( not ( = ?auto_21527 ?auto_21531 ) ) ( not ( = ?auto_21527 ?auto_21550 ) ) ( not ( = ?auto_21528 ?auto_21531 ) ) ( not ( = ?auto_21528 ?auto_21550 ) ) ( not ( = ?auto_21529 ?auto_21531 ) ) ( not ( = ?auto_21529 ?auto_21550 ) ) ( not ( = ?auto_21531 ?auto_21544 ) ) ( not ( = ?auto_21531 ?auto_21549 ) ) ( not ( = ?auto_21531 ?auto_21541 ) ) ( not ( = ?auto_21531 ?auto_21545 ) ) ( not ( = ?auto_21548 ?auto_21542 ) ) ( not ( = ?auto_21548 ?auto_21547 ) ) ( not ( = ?auto_21548 ?auto_21553 ) ) ( not ( = ?auto_21543 ?auto_21546 ) ) ( not ( = ?auto_21543 ?auto_21540 ) ) ( not ( = ?auto_21543 ?auto_21551 ) ) ( not ( = ?auto_21550 ?auto_21544 ) ) ( not ( = ?auto_21550 ?auto_21549 ) ) ( not ( = ?auto_21550 ?auto_21541 ) ) ( not ( = ?auto_21550 ?auto_21545 ) ) ( not ( = ?auto_21526 ?auto_21532 ) ) ( not ( = ?auto_21526 ?auto_21552 ) ) ( not ( = ?auto_21527 ?auto_21532 ) ) ( not ( = ?auto_21527 ?auto_21552 ) ) ( not ( = ?auto_21528 ?auto_21532 ) ) ( not ( = ?auto_21528 ?auto_21552 ) ) ( not ( = ?auto_21529 ?auto_21532 ) ) ( not ( = ?auto_21529 ?auto_21552 ) ) ( not ( = ?auto_21530 ?auto_21532 ) ) ( not ( = ?auto_21530 ?auto_21552 ) ) ( not ( = ?auto_21532 ?auto_21550 ) ) ( not ( = ?auto_21532 ?auto_21544 ) ) ( not ( = ?auto_21532 ?auto_21549 ) ) ( not ( = ?auto_21532 ?auto_21541 ) ) ( not ( = ?auto_21532 ?auto_21545 ) ) ( not ( = ?auto_21552 ?auto_21550 ) ) ( not ( = ?auto_21552 ?auto_21544 ) ) ( not ( = ?auto_21552 ?auto_21549 ) ) ( not ( = ?auto_21552 ?auto_21541 ) ) ( not ( = ?auto_21552 ?auto_21545 ) ) ( not ( = ?auto_21526 ?auto_21533 ) ) ( not ( = ?auto_21526 ?auto_21534 ) ) ( not ( = ?auto_21527 ?auto_21533 ) ) ( not ( = ?auto_21527 ?auto_21534 ) ) ( not ( = ?auto_21528 ?auto_21533 ) ) ( not ( = ?auto_21528 ?auto_21534 ) ) ( not ( = ?auto_21529 ?auto_21533 ) ) ( not ( = ?auto_21529 ?auto_21534 ) ) ( not ( = ?auto_21530 ?auto_21533 ) ) ( not ( = ?auto_21530 ?auto_21534 ) ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21534 ) ) ( not ( = ?auto_21533 ?auto_21552 ) ) ( not ( = ?auto_21533 ?auto_21550 ) ) ( not ( = ?auto_21533 ?auto_21544 ) ) ( not ( = ?auto_21533 ?auto_21549 ) ) ( not ( = ?auto_21533 ?auto_21541 ) ) ( not ( = ?auto_21533 ?auto_21545 ) ) ( not ( = ?auto_21536 ?auto_21542 ) ) ( not ( = ?auto_21536 ?auto_21548 ) ) ( not ( = ?auto_21536 ?auto_21547 ) ) ( not ( = ?auto_21536 ?auto_21553 ) ) ( not ( = ?auto_21537 ?auto_21546 ) ) ( not ( = ?auto_21537 ?auto_21543 ) ) ( not ( = ?auto_21537 ?auto_21540 ) ) ( not ( = ?auto_21537 ?auto_21551 ) ) ( not ( = ?auto_21534 ?auto_21552 ) ) ( not ( = ?auto_21534 ?auto_21550 ) ) ( not ( = ?auto_21534 ?auto_21544 ) ) ( not ( = ?auto_21534 ?auto_21549 ) ) ( not ( = ?auto_21534 ?auto_21541 ) ) ( not ( = ?auto_21534 ?auto_21545 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21526 ?auto_21527 ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21531 ?auto_21532 )
      ( MAKE-1CRATE ?auto_21532 ?auto_21533 )
      ( MAKE-7CRATE-VERIFY ?auto_21526 ?auto_21527 ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21531 ?auto_21532 ?auto_21533 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_21573 - SURFACE
      ?auto_21574 - SURFACE
      ?auto_21575 - SURFACE
      ?auto_21576 - SURFACE
      ?auto_21577 - SURFACE
      ?auto_21578 - SURFACE
      ?auto_21579 - SURFACE
      ?auto_21580 - SURFACE
      ?auto_21581 - SURFACE
    )
    :vars
    (
      ?auto_21585 - HOIST
      ?auto_21584 - PLACE
      ?auto_21582 - PLACE
      ?auto_21586 - HOIST
      ?auto_21587 - SURFACE
      ?auto_21598 - PLACE
      ?auto_21588 - HOIST
      ?auto_21589 - SURFACE
      ?auto_21600 - PLACE
      ?auto_21597 - HOIST
      ?auto_21590 - SURFACE
      ?auto_21595 - PLACE
      ?auto_21603 - HOIST
      ?auto_21593 - SURFACE
      ?auto_21601 - SURFACE
      ?auto_21592 - PLACE
      ?auto_21599 - HOIST
      ?auto_21591 - SURFACE
      ?auto_21604 - SURFACE
      ?auto_21594 - PLACE
      ?auto_21596 - HOIST
      ?auto_21602 - SURFACE
      ?auto_21583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21585 ?auto_21584 ) ( IS-CRATE ?auto_21581 ) ( not ( = ?auto_21582 ?auto_21584 ) ) ( HOIST-AT ?auto_21586 ?auto_21582 ) ( AVAILABLE ?auto_21586 ) ( SURFACE-AT ?auto_21581 ?auto_21582 ) ( ON ?auto_21581 ?auto_21587 ) ( CLEAR ?auto_21581 ) ( not ( = ?auto_21580 ?auto_21581 ) ) ( not ( = ?auto_21580 ?auto_21587 ) ) ( not ( = ?auto_21581 ?auto_21587 ) ) ( not ( = ?auto_21585 ?auto_21586 ) ) ( IS-CRATE ?auto_21580 ) ( not ( = ?auto_21598 ?auto_21584 ) ) ( HOIST-AT ?auto_21588 ?auto_21598 ) ( AVAILABLE ?auto_21588 ) ( SURFACE-AT ?auto_21580 ?auto_21598 ) ( ON ?auto_21580 ?auto_21589 ) ( CLEAR ?auto_21580 ) ( not ( = ?auto_21579 ?auto_21580 ) ) ( not ( = ?auto_21579 ?auto_21589 ) ) ( not ( = ?auto_21580 ?auto_21589 ) ) ( not ( = ?auto_21585 ?auto_21588 ) ) ( IS-CRATE ?auto_21579 ) ( not ( = ?auto_21600 ?auto_21584 ) ) ( HOIST-AT ?auto_21597 ?auto_21600 ) ( SURFACE-AT ?auto_21579 ?auto_21600 ) ( ON ?auto_21579 ?auto_21590 ) ( CLEAR ?auto_21579 ) ( not ( = ?auto_21578 ?auto_21579 ) ) ( not ( = ?auto_21578 ?auto_21590 ) ) ( not ( = ?auto_21579 ?auto_21590 ) ) ( not ( = ?auto_21585 ?auto_21597 ) ) ( IS-CRATE ?auto_21578 ) ( not ( = ?auto_21595 ?auto_21584 ) ) ( HOIST-AT ?auto_21603 ?auto_21595 ) ( AVAILABLE ?auto_21603 ) ( SURFACE-AT ?auto_21578 ?auto_21595 ) ( ON ?auto_21578 ?auto_21593 ) ( CLEAR ?auto_21578 ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( not ( = ?auto_21577 ?auto_21593 ) ) ( not ( = ?auto_21578 ?auto_21593 ) ) ( not ( = ?auto_21585 ?auto_21603 ) ) ( IS-CRATE ?auto_21577 ) ( AVAILABLE ?auto_21597 ) ( SURFACE-AT ?auto_21577 ?auto_21600 ) ( ON ?auto_21577 ?auto_21601 ) ( CLEAR ?auto_21577 ) ( not ( = ?auto_21576 ?auto_21577 ) ) ( not ( = ?auto_21576 ?auto_21601 ) ) ( not ( = ?auto_21577 ?auto_21601 ) ) ( IS-CRATE ?auto_21576 ) ( not ( = ?auto_21592 ?auto_21584 ) ) ( HOIST-AT ?auto_21599 ?auto_21592 ) ( SURFACE-AT ?auto_21576 ?auto_21592 ) ( ON ?auto_21576 ?auto_21591 ) ( CLEAR ?auto_21576 ) ( not ( = ?auto_21575 ?auto_21576 ) ) ( not ( = ?auto_21575 ?auto_21591 ) ) ( not ( = ?auto_21576 ?auto_21591 ) ) ( not ( = ?auto_21585 ?auto_21599 ) ) ( IS-CRATE ?auto_21575 ) ( AVAILABLE ?auto_21599 ) ( SURFACE-AT ?auto_21575 ?auto_21592 ) ( ON ?auto_21575 ?auto_21604 ) ( CLEAR ?auto_21575 ) ( not ( = ?auto_21574 ?auto_21575 ) ) ( not ( = ?auto_21574 ?auto_21604 ) ) ( not ( = ?auto_21575 ?auto_21604 ) ) ( SURFACE-AT ?auto_21573 ?auto_21584 ) ( CLEAR ?auto_21573 ) ( IS-CRATE ?auto_21574 ) ( AVAILABLE ?auto_21585 ) ( not ( = ?auto_21594 ?auto_21584 ) ) ( HOIST-AT ?auto_21596 ?auto_21594 ) ( AVAILABLE ?auto_21596 ) ( SURFACE-AT ?auto_21574 ?auto_21594 ) ( ON ?auto_21574 ?auto_21602 ) ( CLEAR ?auto_21574 ) ( TRUCK-AT ?auto_21583 ?auto_21584 ) ( not ( = ?auto_21573 ?auto_21574 ) ) ( not ( = ?auto_21573 ?auto_21602 ) ) ( not ( = ?auto_21574 ?auto_21602 ) ) ( not ( = ?auto_21585 ?auto_21596 ) ) ( not ( = ?auto_21573 ?auto_21575 ) ) ( not ( = ?auto_21573 ?auto_21604 ) ) ( not ( = ?auto_21575 ?auto_21602 ) ) ( not ( = ?auto_21592 ?auto_21594 ) ) ( not ( = ?auto_21599 ?auto_21596 ) ) ( not ( = ?auto_21604 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21576 ) ) ( not ( = ?auto_21573 ?auto_21591 ) ) ( not ( = ?auto_21574 ?auto_21576 ) ) ( not ( = ?auto_21574 ?auto_21591 ) ) ( not ( = ?auto_21576 ?auto_21604 ) ) ( not ( = ?auto_21576 ?auto_21602 ) ) ( not ( = ?auto_21591 ?auto_21604 ) ) ( not ( = ?auto_21591 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21577 ) ) ( not ( = ?auto_21573 ?auto_21601 ) ) ( not ( = ?auto_21574 ?auto_21577 ) ) ( not ( = ?auto_21574 ?auto_21601 ) ) ( not ( = ?auto_21575 ?auto_21577 ) ) ( not ( = ?auto_21575 ?auto_21601 ) ) ( not ( = ?auto_21577 ?auto_21591 ) ) ( not ( = ?auto_21577 ?auto_21604 ) ) ( not ( = ?auto_21577 ?auto_21602 ) ) ( not ( = ?auto_21600 ?auto_21592 ) ) ( not ( = ?auto_21600 ?auto_21594 ) ) ( not ( = ?auto_21597 ?auto_21599 ) ) ( not ( = ?auto_21597 ?auto_21596 ) ) ( not ( = ?auto_21601 ?auto_21591 ) ) ( not ( = ?auto_21601 ?auto_21604 ) ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21578 ) ) ( not ( = ?auto_21573 ?auto_21593 ) ) ( not ( = ?auto_21574 ?auto_21578 ) ) ( not ( = ?auto_21574 ?auto_21593 ) ) ( not ( = ?auto_21575 ?auto_21578 ) ) ( not ( = ?auto_21575 ?auto_21593 ) ) ( not ( = ?auto_21576 ?auto_21578 ) ) ( not ( = ?auto_21576 ?auto_21593 ) ) ( not ( = ?auto_21578 ?auto_21601 ) ) ( not ( = ?auto_21578 ?auto_21591 ) ) ( not ( = ?auto_21578 ?auto_21604 ) ) ( not ( = ?auto_21578 ?auto_21602 ) ) ( not ( = ?auto_21595 ?auto_21600 ) ) ( not ( = ?auto_21595 ?auto_21592 ) ) ( not ( = ?auto_21595 ?auto_21594 ) ) ( not ( = ?auto_21603 ?auto_21597 ) ) ( not ( = ?auto_21603 ?auto_21599 ) ) ( not ( = ?auto_21603 ?auto_21596 ) ) ( not ( = ?auto_21593 ?auto_21601 ) ) ( not ( = ?auto_21593 ?auto_21591 ) ) ( not ( = ?auto_21593 ?auto_21604 ) ) ( not ( = ?auto_21593 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21579 ) ) ( not ( = ?auto_21573 ?auto_21590 ) ) ( not ( = ?auto_21574 ?auto_21579 ) ) ( not ( = ?auto_21574 ?auto_21590 ) ) ( not ( = ?auto_21575 ?auto_21579 ) ) ( not ( = ?auto_21575 ?auto_21590 ) ) ( not ( = ?auto_21576 ?auto_21579 ) ) ( not ( = ?auto_21576 ?auto_21590 ) ) ( not ( = ?auto_21577 ?auto_21579 ) ) ( not ( = ?auto_21577 ?auto_21590 ) ) ( not ( = ?auto_21579 ?auto_21593 ) ) ( not ( = ?auto_21579 ?auto_21601 ) ) ( not ( = ?auto_21579 ?auto_21591 ) ) ( not ( = ?auto_21579 ?auto_21604 ) ) ( not ( = ?auto_21579 ?auto_21602 ) ) ( not ( = ?auto_21590 ?auto_21593 ) ) ( not ( = ?auto_21590 ?auto_21601 ) ) ( not ( = ?auto_21590 ?auto_21591 ) ) ( not ( = ?auto_21590 ?auto_21604 ) ) ( not ( = ?auto_21590 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21580 ) ) ( not ( = ?auto_21573 ?auto_21589 ) ) ( not ( = ?auto_21574 ?auto_21580 ) ) ( not ( = ?auto_21574 ?auto_21589 ) ) ( not ( = ?auto_21575 ?auto_21580 ) ) ( not ( = ?auto_21575 ?auto_21589 ) ) ( not ( = ?auto_21576 ?auto_21580 ) ) ( not ( = ?auto_21576 ?auto_21589 ) ) ( not ( = ?auto_21577 ?auto_21580 ) ) ( not ( = ?auto_21577 ?auto_21589 ) ) ( not ( = ?auto_21578 ?auto_21580 ) ) ( not ( = ?auto_21578 ?auto_21589 ) ) ( not ( = ?auto_21580 ?auto_21590 ) ) ( not ( = ?auto_21580 ?auto_21593 ) ) ( not ( = ?auto_21580 ?auto_21601 ) ) ( not ( = ?auto_21580 ?auto_21591 ) ) ( not ( = ?auto_21580 ?auto_21604 ) ) ( not ( = ?auto_21580 ?auto_21602 ) ) ( not ( = ?auto_21598 ?auto_21600 ) ) ( not ( = ?auto_21598 ?auto_21595 ) ) ( not ( = ?auto_21598 ?auto_21592 ) ) ( not ( = ?auto_21598 ?auto_21594 ) ) ( not ( = ?auto_21588 ?auto_21597 ) ) ( not ( = ?auto_21588 ?auto_21603 ) ) ( not ( = ?auto_21588 ?auto_21599 ) ) ( not ( = ?auto_21588 ?auto_21596 ) ) ( not ( = ?auto_21589 ?auto_21590 ) ) ( not ( = ?auto_21589 ?auto_21593 ) ) ( not ( = ?auto_21589 ?auto_21601 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21604 ) ) ( not ( = ?auto_21589 ?auto_21602 ) ) ( not ( = ?auto_21573 ?auto_21581 ) ) ( not ( = ?auto_21573 ?auto_21587 ) ) ( not ( = ?auto_21574 ?auto_21581 ) ) ( not ( = ?auto_21574 ?auto_21587 ) ) ( not ( = ?auto_21575 ?auto_21581 ) ) ( not ( = ?auto_21575 ?auto_21587 ) ) ( not ( = ?auto_21576 ?auto_21581 ) ) ( not ( = ?auto_21576 ?auto_21587 ) ) ( not ( = ?auto_21577 ?auto_21581 ) ) ( not ( = ?auto_21577 ?auto_21587 ) ) ( not ( = ?auto_21578 ?auto_21581 ) ) ( not ( = ?auto_21578 ?auto_21587 ) ) ( not ( = ?auto_21579 ?auto_21581 ) ) ( not ( = ?auto_21579 ?auto_21587 ) ) ( not ( = ?auto_21581 ?auto_21589 ) ) ( not ( = ?auto_21581 ?auto_21590 ) ) ( not ( = ?auto_21581 ?auto_21593 ) ) ( not ( = ?auto_21581 ?auto_21601 ) ) ( not ( = ?auto_21581 ?auto_21591 ) ) ( not ( = ?auto_21581 ?auto_21604 ) ) ( not ( = ?auto_21581 ?auto_21602 ) ) ( not ( = ?auto_21582 ?auto_21598 ) ) ( not ( = ?auto_21582 ?auto_21600 ) ) ( not ( = ?auto_21582 ?auto_21595 ) ) ( not ( = ?auto_21582 ?auto_21592 ) ) ( not ( = ?auto_21582 ?auto_21594 ) ) ( not ( = ?auto_21586 ?auto_21588 ) ) ( not ( = ?auto_21586 ?auto_21597 ) ) ( not ( = ?auto_21586 ?auto_21603 ) ) ( not ( = ?auto_21586 ?auto_21599 ) ) ( not ( = ?auto_21586 ?auto_21596 ) ) ( not ( = ?auto_21587 ?auto_21589 ) ) ( not ( = ?auto_21587 ?auto_21590 ) ) ( not ( = ?auto_21587 ?auto_21593 ) ) ( not ( = ?auto_21587 ?auto_21601 ) ) ( not ( = ?auto_21587 ?auto_21591 ) ) ( not ( = ?auto_21587 ?auto_21604 ) ) ( not ( = ?auto_21587 ?auto_21602 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21573 ?auto_21574 ?auto_21575 ?auto_21576 ?auto_21577 ?auto_21578 ?auto_21579 ?auto_21580 )
      ( MAKE-1CRATE ?auto_21580 ?auto_21581 )
      ( MAKE-8CRATE-VERIFY ?auto_21573 ?auto_21574 ?auto_21575 ?auto_21576 ?auto_21577 ?auto_21578 ?auto_21579 ?auto_21580 ?auto_21581 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_21625 - SURFACE
      ?auto_21626 - SURFACE
      ?auto_21627 - SURFACE
      ?auto_21628 - SURFACE
      ?auto_21629 - SURFACE
      ?auto_21630 - SURFACE
      ?auto_21631 - SURFACE
      ?auto_21632 - SURFACE
      ?auto_21633 - SURFACE
      ?auto_21634 - SURFACE
    )
    :vars
    (
      ?auto_21640 - HOIST
      ?auto_21639 - PLACE
      ?auto_21638 - PLACE
      ?auto_21635 - HOIST
      ?auto_21636 - SURFACE
      ?auto_21642 - PLACE
      ?auto_21648 - HOIST
      ?auto_21643 - SURFACE
      ?auto_21646 - PLACE
      ?auto_21649 - HOIST
      ?auto_21659 - SURFACE
      ?auto_21654 - PLACE
      ?auto_21651 - HOIST
      ?auto_21641 - SURFACE
      ?auto_21644 - PLACE
      ?auto_21653 - HOIST
      ?auto_21647 - SURFACE
      ?auto_21657 - SURFACE
      ?auto_21660 - PLACE
      ?auto_21650 - HOIST
      ?auto_21655 - SURFACE
      ?auto_21652 - SURFACE
      ?auto_21656 - PLACE
      ?auto_21645 - HOIST
      ?auto_21658 - SURFACE
      ?auto_21637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21640 ?auto_21639 ) ( IS-CRATE ?auto_21634 ) ( not ( = ?auto_21638 ?auto_21639 ) ) ( HOIST-AT ?auto_21635 ?auto_21638 ) ( AVAILABLE ?auto_21635 ) ( SURFACE-AT ?auto_21634 ?auto_21638 ) ( ON ?auto_21634 ?auto_21636 ) ( CLEAR ?auto_21634 ) ( not ( = ?auto_21633 ?auto_21634 ) ) ( not ( = ?auto_21633 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21636 ) ) ( not ( = ?auto_21640 ?auto_21635 ) ) ( IS-CRATE ?auto_21633 ) ( not ( = ?auto_21642 ?auto_21639 ) ) ( HOIST-AT ?auto_21648 ?auto_21642 ) ( AVAILABLE ?auto_21648 ) ( SURFACE-AT ?auto_21633 ?auto_21642 ) ( ON ?auto_21633 ?auto_21643 ) ( CLEAR ?auto_21633 ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21643 ) ) ( not ( = ?auto_21633 ?auto_21643 ) ) ( not ( = ?auto_21640 ?auto_21648 ) ) ( IS-CRATE ?auto_21632 ) ( not ( = ?auto_21646 ?auto_21639 ) ) ( HOIST-AT ?auto_21649 ?auto_21646 ) ( AVAILABLE ?auto_21649 ) ( SURFACE-AT ?auto_21632 ?auto_21646 ) ( ON ?auto_21632 ?auto_21659 ) ( CLEAR ?auto_21632 ) ( not ( = ?auto_21631 ?auto_21632 ) ) ( not ( = ?auto_21631 ?auto_21659 ) ) ( not ( = ?auto_21632 ?auto_21659 ) ) ( not ( = ?auto_21640 ?auto_21649 ) ) ( IS-CRATE ?auto_21631 ) ( not ( = ?auto_21654 ?auto_21639 ) ) ( HOIST-AT ?auto_21651 ?auto_21654 ) ( SURFACE-AT ?auto_21631 ?auto_21654 ) ( ON ?auto_21631 ?auto_21641 ) ( CLEAR ?auto_21631 ) ( not ( = ?auto_21630 ?auto_21631 ) ) ( not ( = ?auto_21630 ?auto_21641 ) ) ( not ( = ?auto_21631 ?auto_21641 ) ) ( not ( = ?auto_21640 ?auto_21651 ) ) ( IS-CRATE ?auto_21630 ) ( not ( = ?auto_21644 ?auto_21639 ) ) ( HOIST-AT ?auto_21653 ?auto_21644 ) ( AVAILABLE ?auto_21653 ) ( SURFACE-AT ?auto_21630 ?auto_21644 ) ( ON ?auto_21630 ?auto_21647 ) ( CLEAR ?auto_21630 ) ( not ( = ?auto_21629 ?auto_21630 ) ) ( not ( = ?auto_21629 ?auto_21647 ) ) ( not ( = ?auto_21630 ?auto_21647 ) ) ( not ( = ?auto_21640 ?auto_21653 ) ) ( IS-CRATE ?auto_21629 ) ( AVAILABLE ?auto_21651 ) ( SURFACE-AT ?auto_21629 ?auto_21654 ) ( ON ?auto_21629 ?auto_21657 ) ( CLEAR ?auto_21629 ) ( not ( = ?auto_21628 ?auto_21629 ) ) ( not ( = ?auto_21628 ?auto_21657 ) ) ( not ( = ?auto_21629 ?auto_21657 ) ) ( IS-CRATE ?auto_21628 ) ( not ( = ?auto_21660 ?auto_21639 ) ) ( HOIST-AT ?auto_21650 ?auto_21660 ) ( SURFACE-AT ?auto_21628 ?auto_21660 ) ( ON ?auto_21628 ?auto_21655 ) ( CLEAR ?auto_21628 ) ( not ( = ?auto_21627 ?auto_21628 ) ) ( not ( = ?auto_21627 ?auto_21655 ) ) ( not ( = ?auto_21628 ?auto_21655 ) ) ( not ( = ?auto_21640 ?auto_21650 ) ) ( IS-CRATE ?auto_21627 ) ( AVAILABLE ?auto_21650 ) ( SURFACE-AT ?auto_21627 ?auto_21660 ) ( ON ?auto_21627 ?auto_21652 ) ( CLEAR ?auto_21627 ) ( not ( = ?auto_21626 ?auto_21627 ) ) ( not ( = ?auto_21626 ?auto_21652 ) ) ( not ( = ?auto_21627 ?auto_21652 ) ) ( SURFACE-AT ?auto_21625 ?auto_21639 ) ( CLEAR ?auto_21625 ) ( IS-CRATE ?auto_21626 ) ( AVAILABLE ?auto_21640 ) ( not ( = ?auto_21656 ?auto_21639 ) ) ( HOIST-AT ?auto_21645 ?auto_21656 ) ( AVAILABLE ?auto_21645 ) ( SURFACE-AT ?auto_21626 ?auto_21656 ) ( ON ?auto_21626 ?auto_21658 ) ( CLEAR ?auto_21626 ) ( TRUCK-AT ?auto_21637 ?auto_21639 ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21658 ) ) ( not ( = ?auto_21626 ?auto_21658 ) ) ( not ( = ?auto_21640 ?auto_21645 ) ) ( not ( = ?auto_21625 ?auto_21627 ) ) ( not ( = ?auto_21625 ?auto_21652 ) ) ( not ( = ?auto_21627 ?auto_21658 ) ) ( not ( = ?auto_21660 ?auto_21656 ) ) ( not ( = ?auto_21650 ?auto_21645 ) ) ( not ( = ?auto_21652 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21628 ) ) ( not ( = ?auto_21625 ?auto_21655 ) ) ( not ( = ?auto_21626 ?auto_21628 ) ) ( not ( = ?auto_21626 ?auto_21655 ) ) ( not ( = ?auto_21628 ?auto_21652 ) ) ( not ( = ?auto_21628 ?auto_21658 ) ) ( not ( = ?auto_21655 ?auto_21652 ) ) ( not ( = ?auto_21655 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21629 ) ) ( not ( = ?auto_21625 ?auto_21657 ) ) ( not ( = ?auto_21626 ?auto_21629 ) ) ( not ( = ?auto_21626 ?auto_21657 ) ) ( not ( = ?auto_21627 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21657 ) ) ( not ( = ?auto_21629 ?auto_21655 ) ) ( not ( = ?auto_21629 ?auto_21652 ) ) ( not ( = ?auto_21629 ?auto_21658 ) ) ( not ( = ?auto_21654 ?auto_21660 ) ) ( not ( = ?auto_21654 ?auto_21656 ) ) ( not ( = ?auto_21651 ?auto_21650 ) ) ( not ( = ?auto_21651 ?auto_21645 ) ) ( not ( = ?auto_21657 ?auto_21655 ) ) ( not ( = ?auto_21657 ?auto_21652 ) ) ( not ( = ?auto_21657 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21630 ) ) ( not ( = ?auto_21625 ?auto_21647 ) ) ( not ( = ?auto_21626 ?auto_21630 ) ) ( not ( = ?auto_21626 ?auto_21647 ) ) ( not ( = ?auto_21627 ?auto_21630 ) ) ( not ( = ?auto_21627 ?auto_21647 ) ) ( not ( = ?auto_21628 ?auto_21630 ) ) ( not ( = ?auto_21628 ?auto_21647 ) ) ( not ( = ?auto_21630 ?auto_21657 ) ) ( not ( = ?auto_21630 ?auto_21655 ) ) ( not ( = ?auto_21630 ?auto_21652 ) ) ( not ( = ?auto_21630 ?auto_21658 ) ) ( not ( = ?auto_21644 ?auto_21654 ) ) ( not ( = ?auto_21644 ?auto_21660 ) ) ( not ( = ?auto_21644 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21651 ) ) ( not ( = ?auto_21653 ?auto_21650 ) ) ( not ( = ?auto_21653 ?auto_21645 ) ) ( not ( = ?auto_21647 ?auto_21657 ) ) ( not ( = ?auto_21647 ?auto_21655 ) ) ( not ( = ?auto_21647 ?auto_21652 ) ) ( not ( = ?auto_21647 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21631 ) ) ( not ( = ?auto_21625 ?auto_21641 ) ) ( not ( = ?auto_21626 ?auto_21631 ) ) ( not ( = ?auto_21626 ?auto_21641 ) ) ( not ( = ?auto_21627 ?auto_21631 ) ) ( not ( = ?auto_21627 ?auto_21641 ) ) ( not ( = ?auto_21628 ?auto_21631 ) ) ( not ( = ?auto_21628 ?auto_21641 ) ) ( not ( = ?auto_21629 ?auto_21631 ) ) ( not ( = ?auto_21629 ?auto_21641 ) ) ( not ( = ?auto_21631 ?auto_21647 ) ) ( not ( = ?auto_21631 ?auto_21657 ) ) ( not ( = ?auto_21631 ?auto_21655 ) ) ( not ( = ?auto_21631 ?auto_21652 ) ) ( not ( = ?auto_21631 ?auto_21658 ) ) ( not ( = ?auto_21641 ?auto_21647 ) ) ( not ( = ?auto_21641 ?auto_21657 ) ) ( not ( = ?auto_21641 ?auto_21655 ) ) ( not ( = ?auto_21641 ?auto_21652 ) ) ( not ( = ?auto_21641 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21632 ) ) ( not ( = ?auto_21625 ?auto_21659 ) ) ( not ( = ?auto_21626 ?auto_21632 ) ) ( not ( = ?auto_21626 ?auto_21659 ) ) ( not ( = ?auto_21627 ?auto_21632 ) ) ( not ( = ?auto_21627 ?auto_21659 ) ) ( not ( = ?auto_21628 ?auto_21632 ) ) ( not ( = ?auto_21628 ?auto_21659 ) ) ( not ( = ?auto_21629 ?auto_21632 ) ) ( not ( = ?auto_21629 ?auto_21659 ) ) ( not ( = ?auto_21630 ?auto_21632 ) ) ( not ( = ?auto_21630 ?auto_21659 ) ) ( not ( = ?auto_21632 ?auto_21641 ) ) ( not ( = ?auto_21632 ?auto_21647 ) ) ( not ( = ?auto_21632 ?auto_21657 ) ) ( not ( = ?auto_21632 ?auto_21655 ) ) ( not ( = ?auto_21632 ?auto_21652 ) ) ( not ( = ?auto_21632 ?auto_21658 ) ) ( not ( = ?auto_21646 ?auto_21654 ) ) ( not ( = ?auto_21646 ?auto_21644 ) ) ( not ( = ?auto_21646 ?auto_21660 ) ) ( not ( = ?auto_21646 ?auto_21656 ) ) ( not ( = ?auto_21649 ?auto_21651 ) ) ( not ( = ?auto_21649 ?auto_21653 ) ) ( not ( = ?auto_21649 ?auto_21650 ) ) ( not ( = ?auto_21649 ?auto_21645 ) ) ( not ( = ?auto_21659 ?auto_21641 ) ) ( not ( = ?auto_21659 ?auto_21647 ) ) ( not ( = ?auto_21659 ?auto_21657 ) ) ( not ( = ?auto_21659 ?auto_21655 ) ) ( not ( = ?auto_21659 ?auto_21652 ) ) ( not ( = ?auto_21659 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21633 ) ) ( not ( = ?auto_21625 ?auto_21643 ) ) ( not ( = ?auto_21626 ?auto_21633 ) ) ( not ( = ?auto_21626 ?auto_21643 ) ) ( not ( = ?auto_21627 ?auto_21633 ) ) ( not ( = ?auto_21627 ?auto_21643 ) ) ( not ( = ?auto_21628 ?auto_21633 ) ) ( not ( = ?auto_21628 ?auto_21643 ) ) ( not ( = ?auto_21629 ?auto_21633 ) ) ( not ( = ?auto_21629 ?auto_21643 ) ) ( not ( = ?auto_21630 ?auto_21633 ) ) ( not ( = ?auto_21630 ?auto_21643 ) ) ( not ( = ?auto_21631 ?auto_21633 ) ) ( not ( = ?auto_21631 ?auto_21643 ) ) ( not ( = ?auto_21633 ?auto_21659 ) ) ( not ( = ?auto_21633 ?auto_21641 ) ) ( not ( = ?auto_21633 ?auto_21647 ) ) ( not ( = ?auto_21633 ?auto_21657 ) ) ( not ( = ?auto_21633 ?auto_21655 ) ) ( not ( = ?auto_21633 ?auto_21652 ) ) ( not ( = ?auto_21633 ?auto_21658 ) ) ( not ( = ?auto_21642 ?auto_21646 ) ) ( not ( = ?auto_21642 ?auto_21654 ) ) ( not ( = ?auto_21642 ?auto_21644 ) ) ( not ( = ?auto_21642 ?auto_21660 ) ) ( not ( = ?auto_21642 ?auto_21656 ) ) ( not ( = ?auto_21648 ?auto_21649 ) ) ( not ( = ?auto_21648 ?auto_21651 ) ) ( not ( = ?auto_21648 ?auto_21653 ) ) ( not ( = ?auto_21648 ?auto_21650 ) ) ( not ( = ?auto_21648 ?auto_21645 ) ) ( not ( = ?auto_21643 ?auto_21659 ) ) ( not ( = ?auto_21643 ?auto_21641 ) ) ( not ( = ?auto_21643 ?auto_21647 ) ) ( not ( = ?auto_21643 ?auto_21657 ) ) ( not ( = ?auto_21643 ?auto_21655 ) ) ( not ( = ?auto_21643 ?auto_21652 ) ) ( not ( = ?auto_21643 ?auto_21658 ) ) ( not ( = ?auto_21625 ?auto_21634 ) ) ( not ( = ?auto_21625 ?auto_21636 ) ) ( not ( = ?auto_21626 ?auto_21634 ) ) ( not ( = ?auto_21626 ?auto_21636 ) ) ( not ( = ?auto_21627 ?auto_21634 ) ) ( not ( = ?auto_21627 ?auto_21636 ) ) ( not ( = ?auto_21628 ?auto_21634 ) ) ( not ( = ?auto_21628 ?auto_21636 ) ) ( not ( = ?auto_21629 ?auto_21634 ) ) ( not ( = ?auto_21629 ?auto_21636 ) ) ( not ( = ?auto_21630 ?auto_21634 ) ) ( not ( = ?auto_21630 ?auto_21636 ) ) ( not ( = ?auto_21631 ?auto_21634 ) ) ( not ( = ?auto_21631 ?auto_21636 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21643 ) ) ( not ( = ?auto_21634 ?auto_21659 ) ) ( not ( = ?auto_21634 ?auto_21641 ) ) ( not ( = ?auto_21634 ?auto_21647 ) ) ( not ( = ?auto_21634 ?auto_21657 ) ) ( not ( = ?auto_21634 ?auto_21655 ) ) ( not ( = ?auto_21634 ?auto_21652 ) ) ( not ( = ?auto_21634 ?auto_21658 ) ) ( not ( = ?auto_21638 ?auto_21642 ) ) ( not ( = ?auto_21638 ?auto_21646 ) ) ( not ( = ?auto_21638 ?auto_21654 ) ) ( not ( = ?auto_21638 ?auto_21644 ) ) ( not ( = ?auto_21638 ?auto_21660 ) ) ( not ( = ?auto_21638 ?auto_21656 ) ) ( not ( = ?auto_21635 ?auto_21648 ) ) ( not ( = ?auto_21635 ?auto_21649 ) ) ( not ( = ?auto_21635 ?auto_21651 ) ) ( not ( = ?auto_21635 ?auto_21653 ) ) ( not ( = ?auto_21635 ?auto_21650 ) ) ( not ( = ?auto_21635 ?auto_21645 ) ) ( not ( = ?auto_21636 ?auto_21643 ) ) ( not ( = ?auto_21636 ?auto_21659 ) ) ( not ( = ?auto_21636 ?auto_21641 ) ) ( not ( = ?auto_21636 ?auto_21647 ) ) ( not ( = ?auto_21636 ?auto_21657 ) ) ( not ( = ?auto_21636 ?auto_21655 ) ) ( not ( = ?auto_21636 ?auto_21652 ) ) ( not ( = ?auto_21636 ?auto_21658 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21625 ?auto_21626 ?auto_21627 ?auto_21628 ?auto_21629 ?auto_21630 ?auto_21631 ?auto_21632 ?auto_21633 )
      ( MAKE-1CRATE ?auto_21633 ?auto_21634 )
      ( MAKE-9CRATE-VERIFY ?auto_21625 ?auto_21626 ?auto_21627 ?auto_21628 ?auto_21629 ?auto_21630 ?auto_21631 ?auto_21632 ?auto_21633 ?auto_21634 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_21682 - SURFACE
      ?auto_21683 - SURFACE
      ?auto_21684 - SURFACE
      ?auto_21685 - SURFACE
      ?auto_21686 - SURFACE
      ?auto_21687 - SURFACE
      ?auto_21688 - SURFACE
      ?auto_21689 - SURFACE
      ?auto_21690 - SURFACE
      ?auto_21691 - SURFACE
      ?auto_21692 - SURFACE
    )
    :vars
    (
      ?auto_21693 - HOIST
      ?auto_21697 - PLACE
      ?auto_21694 - PLACE
      ?auto_21695 - HOIST
      ?auto_21696 - SURFACE
      ?auto_21699 - PLACE
      ?auto_21708 - HOIST
      ?auto_21712 - SURFACE
      ?auto_21721 - PLACE
      ?auto_21710 - HOIST
      ?auto_21715 - SURFACE
      ?auto_21713 - PLACE
      ?auto_21711 - HOIST
      ?auto_21717 - SURFACE
      ?auto_21706 - PLACE
      ?auto_21714 - HOIST
      ?auto_21720 - SURFACE
      ?auto_21716 - PLACE
      ?auto_21707 - HOIST
      ?auto_21702 - SURFACE
      ?auto_21719 - SURFACE
      ?auto_21703 - PLACE
      ?auto_21709 - HOIST
      ?auto_21718 - SURFACE
      ?auto_21701 - SURFACE
      ?auto_21705 - PLACE
      ?auto_21700 - HOIST
      ?auto_21704 - SURFACE
      ?auto_21698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21693 ?auto_21697 ) ( IS-CRATE ?auto_21692 ) ( not ( = ?auto_21694 ?auto_21697 ) ) ( HOIST-AT ?auto_21695 ?auto_21694 ) ( AVAILABLE ?auto_21695 ) ( SURFACE-AT ?auto_21692 ?auto_21694 ) ( ON ?auto_21692 ?auto_21696 ) ( CLEAR ?auto_21692 ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21696 ) ) ( not ( = ?auto_21692 ?auto_21696 ) ) ( not ( = ?auto_21693 ?auto_21695 ) ) ( IS-CRATE ?auto_21691 ) ( not ( = ?auto_21699 ?auto_21697 ) ) ( HOIST-AT ?auto_21708 ?auto_21699 ) ( AVAILABLE ?auto_21708 ) ( SURFACE-AT ?auto_21691 ?auto_21699 ) ( ON ?auto_21691 ?auto_21712 ) ( CLEAR ?auto_21691 ) ( not ( = ?auto_21690 ?auto_21691 ) ) ( not ( = ?auto_21690 ?auto_21712 ) ) ( not ( = ?auto_21691 ?auto_21712 ) ) ( not ( = ?auto_21693 ?auto_21708 ) ) ( IS-CRATE ?auto_21690 ) ( not ( = ?auto_21721 ?auto_21697 ) ) ( HOIST-AT ?auto_21710 ?auto_21721 ) ( AVAILABLE ?auto_21710 ) ( SURFACE-AT ?auto_21690 ?auto_21721 ) ( ON ?auto_21690 ?auto_21715 ) ( CLEAR ?auto_21690 ) ( not ( = ?auto_21689 ?auto_21690 ) ) ( not ( = ?auto_21689 ?auto_21715 ) ) ( not ( = ?auto_21690 ?auto_21715 ) ) ( not ( = ?auto_21693 ?auto_21710 ) ) ( IS-CRATE ?auto_21689 ) ( not ( = ?auto_21713 ?auto_21697 ) ) ( HOIST-AT ?auto_21711 ?auto_21713 ) ( AVAILABLE ?auto_21711 ) ( SURFACE-AT ?auto_21689 ?auto_21713 ) ( ON ?auto_21689 ?auto_21717 ) ( CLEAR ?auto_21689 ) ( not ( = ?auto_21688 ?auto_21689 ) ) ( not ( = ?auto_21688 ?auto_21717 ) ) ( not ( = ?auto_21689 ?auto_21717 ) ) ( not ( = ?auto_21693 ?auto_21711 ) ) ( IS-CRATE ?auto_21688 ) ( not ( = ?auto_21706 ?auto_21697 ) ) ( HOIST-AT ?auto_21714 ?auto_21706 ) ( SURFACE-AT ?auto_21688 ?auto_21706 ) ( ON ?auto_21688 ?auto_21720 ) ( CLEAR ?auto_21688 ) ( not ( = ?auto_21687 ?auto_21688 ) ) ( not ( = ?auto_21687 ?auto_21720 ) ) ( not ( = ?auto_21688 ?auto_21720 ) ) ( not ( = ?auto_21693 ?auto_21714 ) ) ( IS-CRATE ?auto_21687 ) ( not ( = ?auto_21716 ?auto_21697 ) ) ( HOIST-AT ?auto_21707 ?auto_21716 ) ( AVAILABLE ?auto_21707 ) ( SURFACE-AT ?auto_21687 ?auto_21716 ) ( ON ?auto_21687 ?auto_21702 ) ( CLEAR ?auto_21687 ) ( not ( = ?auto_21686 ?auto_21687 ) ) ( not ( = ?auto_21686 ?auto_21702 ) ) ( not ( = ?auto_21687 ?auto_21702 ) ) ( not ( = ?auto_21693 ?auto_21707 ) ) ( IS-CRATE ?auto_21686 ) ( AVAILABLE ?auto_21714 ) ( SURFACE-AT ?auto_21686 ?auto_21706 ) ( ON ?auto_21686 ?auto_21719 ) ( CLEAR ?auto_21686 ) ( not ( = ?auto_21685 ?auto_21686 ) ) ( not ( = ?auto_21685 ?auto_21719 ) ) ( not ( = ?auto_21686 ?auto_21719 ) ) ( IS-CRATE ?auto_21685 ) ( not ( = ?auto_21703 ?auto_21697 ) ) ( HOIST-AT ?auto_21709 ?auto_21703 ) ( SURFACE-AT ?auto_21685 ?auto_21703 ) ( ON ?auto_21685 ?auto_21718 ) ( CLEAR ?auto_21685 ) ( not ( = ?auto_21684 ?auto_21685 ) ) ( not ( = ?auto_21684 ?auto_21718 ) ) ( not ( = ?auto_21685 ?auto_21718 ) ) ( not ( = ?auto_21693 ?auto_21709 ) ) ( IS-CRATE ?auto_21684 ) ( AVAILABLE ?auto_21709 ) ( SURFACE-AT ?auto_21684 ?auto_21703 ) ( ON ?auto_21684 ?auto_21701 ) ( CLEAR ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21683 ?auto_21701 ) ) ( not ( = ?auto_21684 ?auto_21701 ) ) ( SURFACE-AT ?auto_21682 ?auto_21697 ) ( CLEAR ?auto_21682 ) ( IS-CRATE ?auto_21683 ) ( AVAILABLE ?auto_21693 ) ( not ( = ?auto_21705 ?auto_21697 ) ) ( HOIST-AT ?auto_21700 ?auto_21705 ) ( AVAILABLE ?auto_21700 ) ( SURFACE-AT ?auto_21683 ?auto_21705 ) ( ON ?auto_21683 ?auto_21704 ) ( CLEAR ?auto_21683 ) ( TRUCK-AT ?auto_21698 ?auto_21697 ) ( not ( = ?auto_21682 ?auto_21683 ) ) ( not ( = ?auto_21682 ?auto_21704 ) ) ( not ( = ?auto_21683 ?auto_21704 ) ) ( not ( = ?auto_21693 ?auto_21700 ) ) ( not ( = ?auto_21682 ?auto_21684 ) ) ( not ( = ?auto_21682 ?auto_21701 ) ) ( not ( = ?auto_21684 ?auto_21704 ) ) ( not ( = ?auto_21703 ?auto_21705 ) ) ( not ( = ?auto_21709 ?auto_21700 ) ) ( not ( = ?auto_21701 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21685 ) ) ( not ( = ?auto_21682 ?auto_21718 ) ) ( not ( = ?auto_21683 ?auto_21685 ) ) ( not ( = ?auto_21683 ?auto_21718 ) ) ( not ( = ?auto_21685 ?auto_21701 ) ) ( not ( = ?auto_21685 ?auto_21704 ) ) ( not ( = ?auto_21718 ?auto_21701 ) ) ( not ( = ?auto_21718 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21686 ) ) ( not ( = ?auto_21682 ?auto_21719 ) ) ( not ( = ?auto_21683 ?auto_21686 ) ) ( not ( = ?auto_21683 ?auto_21719 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21719 ) ) ( not ( = ?auto_21686 ?auto_21718 ) ) ( not ( = ?auto_21686 ?auto_21701 ) ) ( not ( = ?auto_21686 ?auto_21704 ) ) ( not ( = ?auto_21706 ?auto_21703 ) ) ( not ( = ?auto_21706 ?auto_21705 ) ) ( not ( = ?auto_21714 ?auto_21709 ) ) ( not ( = ?auto_21714 ?auto_21700 ) ) ( not ( = ?auto_21719 ?auto_21718 ) ) ( not ( = ?auto_21719 ?auto_21701 ) ) ( not ( = ?auto_21719 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21687 ) ) ( not ( = ?auto_21682 ?auto_21702 ) ) ( not ( = ?auto_21683 ?auto_21687 ) ) ( not ( = ?auto_21683 ?auto_21702 ) ) ( not ( = ?auto_21684 ?auto_21687 ) ) ( not ( = ?auto_21684 ?auto_21702 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21702 ) ) ( not ( = ?auto_21687 ?auto_21719 ) ) ( not ( = ?auto_21687 ?auto_21718 ) ) ( not ( = ?auto_21687 ?auto_21701 ) ) ( not ( = ?auto_21687 ?auto_21704 ) ) ( not ( = ?auto_21716 ?auto_21706 ) ) ( not ( = ?auto_21716 ?auto_21703 ) ) ( not ( = ?auto_21716 ?auto_21705 ) ) ( not ( = ?auto_21707 ?auto_21714 ) ) ( not ( = ?auto_21707 ?auto_21709 ) ) ( not ( = ?auto_21707 ?auto_21700 ) ) ( not ( = ?auto_21702 ?auto_21719 ) ) ( not ( = ?auto_21702 ?auto_21718 ) ) ( not ( = ?auto_21702 ?auto_21701 ) ) ( not ( = ?auto_21702 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21688 ) ) ( not ( = ?auto_21682 ?auto_21720 ) ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21683 ?auto_21720 ) ) ( not ( = ?auto_21684 ?auto_21688 ) ) ( not ( = ?auto_21684 ?auto_21720 ) ) ( not ( = ?auto_21685 ?auto_21688 ) ) ( not ( = ?auto_21685 ?auto_21720 ) ) ( not ( = ?auto_21686 ?auto_21688 ) ) ( not ( = ?auto_21686 ?auto_21720 ) ) ( not ( = ?auto_21688 ?auto_21702 ) ) ( not ( = ?auto_21688 ?auto_21719 ) ) ( not ( = ?auto_21688 ?auto_21718 ) ) ( not ( = ?auto_21688 ?auto_21701 ) ) ( not ( = ?auto_21688 ?auto_21704 ) ) ( not ( = ?auto_21720 ?auto_21702 ) ) ( not ( = ?auto_21720 ?auto_21719 ) ) ( not ( = ?auto_21720 ?auto_21718 ) ) ( not ( = ?auto_21720 ?auto_21701 ) ) ( not ( = ?auto_21720 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21689 ) ) ( not ( = ?auto_21682 ?auto_21717 ) ) ( not ( = ?auto_21683 ?auto_21689 ) ) ( not ( = ?auto_21683 ?auto_21717 ) ) ( not ( = ?auto_21684 ?auto_21689 ) ) ( not ( = ?auto_21684 ?auto_21717 ) ) ( not ( = ?auto_21685 ?auto_21689 ) ) ( not ( = ?auto_21685 ?auto_21717 ) ) ( not ( = ?auto_21686 ?auto_21689 ) ) ( not ( = ?auto_21686 ?auto_21717 ) ) ( not ( = ?auto_21687 ?auto_21689 ) ) ( not ( = ?auto_21687 ?auto_21717 ) ) ( not ( = ?auto_21689 ?auto_21720 ) ) ( not ( = ?auto_21689 ?auto_21702 ) ) ( not ( = ?auto_21689 ?auto_21719 ) ) ( not ( = ?auto_21689 ?auto_21718 ) ) ( not ( = ?auto_21689 ?auto_21701 ) ) ( not ( = ?auto_21689 ?auto_21704 ) ) ( not ( = ?auto_21713 ?auto_21706 ) ) ( not ( = ?auto_21713 ?auto_21716 ) ) ( not ( = ?auto_21713 ?auto_21703 ) ) ( not ( = ?auto_21713 ?auto_21705 ) ) ( not ( = ?auto_21711 ?auto_21714 ) ) ( not ( = ?auto_21711 ?auto_21707 ) ) ( not ( = ?auto_21711 ?auto_21709 ) ) ( not ( = ?auto_21711 ?auto_21700 ) ) ( not ( = ?auto_21717 ?auto_21720 ) ) ( not ( = ?auto_21717 ?auto_21702 ) ) ( not ( = ?auto_21717 ?auto_21719 ) ) ( not ( = ?auto_21717 ?auto_21718 ) ) ( not ( = ?auto_21717 ?auto_21701 ) ) ( not ( = ?auto_21717 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21690 ) ) ( not ( = ?auto_21682 ?auto_21715 ) ) ( not ( = ?auto_21683 ?auto_21690 ) ) ( not ( = ?auto_21683 ?auto_21715 ) ) ( not ( = ?auto_21684 ?auto_21690 ) ) ( not ( = ?auto_21684 ?auto_21715 ) ) ( not ( = ?auto_21685 ?auto_21690 ) ) ( not ( = ?auto_21685 ?auto_21715 ) ) ( not ( = ?auto_21686 ?auto_21690 ) ) ( not ( = ?auto_21686 ?auto_21715 ) ) ( not ( = ?auto_21687 ?auto_21690 ) ) ( not ( = ?auto_21687 ?auto_21715 ) ) ( not ( = ?auto_21688 ?auto_21690 ) ) ( not ( = ?auto_21688 ?auto_21715 ) ) ( not ( = ?auto_21690 ?auto_21717 ) ) ( not ( = ?auto_21690 ?auto_21720 ) ) ( not ( = ?auto_21690 ?auto_21702 ) ) ( not ( = ?auto_21690 ?auto_21719 ) ) ( not ( = ?auto_21690 ?auto_21718 ) ) ( not ( = ?auto_21690 ?auto_21701 ) ) ( not ( = ?auto_21690 ?auto_21704 ) ) ( not ( = ?auto_21721 ?auto_21713 ) ) ( not ( = ?auto_21721 ?auto_21706 ) ) ( not ( = ?auto_21721 ?auto_21716 ) ) ( not ( = ?auto_21721 ?auto_21703 ) ) ( not ( = ?auto_21721 ?auto_21705 ) ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21710 ?auto_21714 ) ) ( not ( = ?auto_21710 ?auto_21707 ) ) ( not ( = ?auto_21710 ?auto_21709 ) ) ( not ( = ?auto_21710 ?auto_21700 ) ) ( not ( = ?auto_21715 ?auto_21717 ) ) ( not ( = ?auto_21715 ?auto_21720 ) ) ( not ( = ?auto_21715 ?auto_21702 ) ) ( not ( = ?auto_21715 ?auto_21719 ) ) ( not ( = ?auto_21715 ?auto_21718 ) ) ( not ( = ?auto_21715 ?auto_21701 ) ) ( not ( = ?auto_21715 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21691 ) ) ( not ( = ?auto_21682 ?auto_21712 ) ) ( not ( = ?auto_21683 ?auto_21691 ) ) ( not ( = ?auto_21683 ?auto_21712 ) ) ( not ( = ?auto_21684 ?auto_21691 ) ) ( not ( = ?auto_21684 ?auto_21712 ) ) ( not ( = ?auto_21685 ?auto_21691 ) ) ( not ( = ?auto_21685 ?auto_21712 ) ) ( not ( = ?auto_21686 ?auto_21691 ) ) ( not ( = ?auto_21686 ?auto_21712 ) ) ( not ( = ?auto_21687 ?auto_21691 ) ) ( not ( = ?auto_21687 ?auto_21712 ) ) ( not ( = ?auto_21688 ?auto_21691 ) ) ( not ( = ?auto_21688 ?auto_21712 ) ) ( not ( = ?auto_21689 ?auto_21691 ) ) ( not ( = ?auto_21689 ?auto_21712 ) ) ( not ( = ?auto_21691 ?auto_21715 ) ) ( not ( = ?auto_21691 ?auto_21717 ) ) ( not ( = ?auto_21691 ?auto_21720 ) ) ( not ( = ?auto_21691 ?auto_21702 ) ) ( not ( = ?auto_21691 ?auto_21719 ) ) ( not ( = ?auto_21691 ?auto_21718 ) ) ( not ( = ?auto_21691 ?auto_21701 ) ) ( not ( = ?auto_21691 ?auto_21704 ) ) ( not ( = ?auto_21699 ?auto_21721 ) ) ( not ( = ?auto_21699 ?auto_21713 ) ) ( not ( = ?auto_21699 ?auto_21706 ) ) ( not ( = ?auto_21699 ?auto_21716 ) ) ( not ( = ?auto_21699 ?auto_21703 ) ) ( not ( = ?auto_21699 ?auto_21705 ) ) ( not ( = ?auto_21708 ?auto_21710 ) ) ( not ( = ?auto_21708 ?auto_21711 ) ) ( not ( = ?auto_21708 ?auto_21714 ) ) ( not ( = ?auto_21708 ?auto_21707 ) ) ( not ( = ?auto_21708 ?auto_21709 ) ) ( not ( = ?auto_21708 ?auto_21700 ) ) ( not ( = ?auto_21712 ?auto_21715 ) ) ( not ( = ?auto_21712 ?auto_21717 ) ) ( not ( = ?auto_21712 ?auto_21720 ) ) ( not ( = ?auto_21712 ?auto_21702 ) ) ( not ( = ?auto_21712 ?auto_21719 ) ) ( not ( = ?auto_21712 ?auto_21718 ) ) ( not ( = ?auto_21712 ?auto_21701 ) ) ( not ( = ?auto_21712 ?auto_21704 ) ) ( not ( = ?auto_21682 ?auto_21692 ) ) ( not ( = ?auto_21682 ?auto_21696 ) ) ( not ( = ?auto_21683 ?auto_21692 ) ) ( not ( = ?auto_21683 ?auto_21696 ) ) ( not ( = ?auto_21684 ?auto_21692 ) ) ( not ( = ?auto_21684 ?auto_21696 ) ) ( not ( = ?auto_21685 ?auto_21692 ) ) ( not ( = ?auto_21685 ?auto_21696 ) ) ( not ( = ?auto_21686 ?auto_21692 ) ) ( not ( = ?auto_21686 ?auto_21696 ) ) ( not ( = ?auto_21687 ?auto_21692 ) ) ( not ( = ?auto_21687 ?auto_21696 ) ) ( not ( = ?auto_21688 ?auto_21692 ) ) ( not ( = ?auto_21688 ?auto_21696 ) ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( not ( = ?auto_21689 ?auto_21696 ) ) ( not ( = ?auto_21690 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21696 ) ) ( not ( = ?auto_21692 ?auto_21712 ) ) ( not ( = ?auto_21692 ?auto_21715 ) ) ( not ( = ?auto_21692 ?auto_21717 ) ) ( not ( = ?auto_21692 ?auto_21720 ) ) ( not ( = ?auto_21692 ?auto_21702 ) ) ( not ( = ?auto_21692 ?auto_21719 ) ) ( not ( = ?auto_21692 ?auto_21718 ) ) ( not ( = ?auto_21692 ?auto_21701 ) ) ( not ( = ?auto_21692 ?auto_21704 ) ) ( not ( = ?auto_21694 ?auto_21699 ) ) ( not ( = ?auto_21694 ?auto_21721 ) ) ( not ( = ?auto_21694 ?auto_21713 ) ) ( not ( = ?auto_21694 ?auto_21706 ) ) ( not ( = ?auto_21694 ?auto_21716 ) ) ( not ( = ?auto_21694 ?auto_21703 ) ) ( not ( = ?auto_21694 ?auto_21705 ) ) ( not ( = ?auto_21695 ?auto_21708 ) ) ( not ( = ?auto_21695 ?auto_21710 ) ) ( not ( = ?auto_21695 ?auto_21711 ) ) ( not ( = ?auto_21695 ?auto_21714 ) ) ( not ( = ?auto_21695 ?auto_21707 ) ) ( not ( = ?auto_21695 ?auto_21709 ) ) ( not ( = ?auto_21695 ?auto_21700 ) ) ( not ( = ?auto_21696 ?auto_21712 ) ) ( not ( = ?auto_21696 ?auto_21715 ) ) ( not ( = ?auto_21696 ?auto_21717 ) ) ( not ( = ?auto_21696 ?auto_21720 ) ) ( not ( = ?auto_21696 ?auto_21702 ) ) ( not ( = ?auto_21696 ?auto_21719 ) ) ( not ( = ?auto_21696 ?auto_21718 ) ) ( not ( = ?auto_21696 ?auto_21701 ) ) ( not ( = ?auto_21696 ?auto_21704 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21682 ?auto_21683 ?auto_21684 ?auto_21685 ?auto_21686 ?auto_21687 ?auto_21688 ?auto_21689 ?auto_21690 ?auto_21691 )
      ( MAKE-1CRATE ?auto_21691 ?auto_21692 )
      ( MAKE-10CRATE-VERIFY ?auto_21682 ?auto_21683 ?auto_21684 ?auto_21685 ?auto_21686 ?auto_21687 ?auto_21688 ?auto_21689 ?auto_21690 ?auto_21691 ?auto_21692 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21744 - SURFACE
      ?auto_21745 - SURFACE
      ?auto_21746 - SURFACE
      ?auto_21747 - SURFACE
      ?auto_21748 - SURFACE
      ?auto_21749 - SURFACE
      ?auto_21750 - SURFACE
      ?auto_21751 - SURFACE
      ?auto_21752 - SURFACE
      ?auto_21753 - SURFACE
      ?auto_21754 - SURFACE
      ?auto_21755 - SURFACE
    )
    :vars
    (
      ?auto_21759 - HOIST
      ?auto_21760 - PLACE
      ?auto_21761 - PLACE
      ?auto_21757 - HOIST
      ?auto_21756 - SURFACE
      ?auto_21786 - PLACE
      ?auto_21780 - HOIST
      ?auto_21769 - SURFACE
      ?auto_21772 - PLACE
      ?auto_21783 - HOIST
      ?auto_21764 - SURFACE
      ?auto_21778 - PLACE
      ?auto_21775 - HOIST
      ?auto_21779 - SURFACE
      ?auto_21785 - PLACE
      ?auto_21770 - HOIST
      ?auto_21782 - SURFACE
      ?auto_21767 - PLACE
      ?auto_21765 - HOIST
      ?auto_21781 - SURFACE
      ?auto_21774 - PLACE
      ?auto_21776 - HOIST
      ?auto_21773 - SURFACE
      ?auto_21777 - SURFACE
      ?auto_21771 - PLACE
      ?auto_21768 - HOIST
      ?auto_21766 - SURFACE
      ?auto_21787 - SURFACE
      ?auto_21763 - PLACE
      ?auto_21762 - HOIST
      ?auto_21784 - SURFACE
      ?auto_21758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21759 ?auto_21760 ) ( IS-CRATE ?auto_21755 ) ( not ( = ?auto_21761 ?auto_21760 ) ) ( HOIST-AT ?auto_21757 ?auto_21761 ) ( AVAILABLE ?auto_21757 ) ( SURFACE-AT ?auto_21755 ?auto_21761 ) ( ON ?auto_21755 ?auto_21756 ) ( CLEAR ?auto_21755 ) ( not ( = ?auto_21754 ?auto_21755 ) ) ( not ( = ?auto_21754 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21756 ) ) ( not ( = ?auto_21759 ?auto_21757 ) ) ( IS-CRATE ?auto_21754 ) ( not ( = ?auto_21786 ?auto_21760 ) ) ( HOIST-AT ?auto_21780 ?auto_21786 ) ( AVAILABLE ?auto_21780 ) ( SURFACE-AT ?auto_21754 ?auto_21786 ) ( ON ?auto_21754 ?auto_21769 ) ( CLEAR ?auto_21754 ) ( not ( = ?auto_21753 ?auto_21754 ) ) ( not ( = ?auto_21753 ?auto_21769 ) ) ( not ( = ?auto_21754 ?auto_21769 ) ) ( not ( = ?auto_21759 ?auto_21780 ) ) ( IS-CRATE ?auto_21753 ) ( not ( = ?auto_21772 ?auto_21760 ) ) ( HOIST-AT ?auto_21783 ?auto_21772 ) ( AVAILABLE ?auto_21783 ) ( SURFACE-AT ?auto_21753 ?auto_21772 ) ( ON ?auto_21753 ?auto_21764 ) ( CLEAR ?auto_21753 ) ( not ( = ?auto_21752 ?auto_21753 ) ) ( not ( = ?auto_21752 ?auto_21764 ) ) ( not ( = ?auto_21753 ?auto_21764 ) ) ( not ( = ?auto_21759 ?auto_21783 ) ) ( IS-CRATE ?auto_21752 ) ( not ( = ?auto_21778 ?auto_21760 ) ) ( HOIST-AT ?auto_21775 ?auto_21778 ) ( AVAILABLE ?auto_21775 ) ( SURFACE-AT ?auto_21752 ?auto_21778 ) ( ON ?auto_21752 ?auto_21779 ) ( CLEAR ?auto_21752 ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( not ( = ?auto_21751 ?auto_21779 ) ) ( not ( = ?auto_21752 ?auto_21779 ) ) ( not ( = ?auto_21759 ?auto_21775 ) ) ( IS-CRATE ?auto_21751 ) ( not ( = ?auto_21785 ?auto_21760 ) ) ( HOIST-AT ?auto_21770 ?auto_21785 ) ( AVAILABLE ?auto_21770 ) ( SURFACE-AT ?auto_21751 ?auto_21785 ) ( ON ?auto_21751 ?auto_21782 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( not ( = ?auto_21750 ?auto_21782 ) ) ( not ( = ?auto_21751 ?auto_21782 ) ) ( not ( = ?auto_21759 ?auto_21770 ) ) ( IS-CRATE ?auto_21750 ) ( not ( = ?auto_21767 ?auto_21760 ) ) ( HOIST-AT ?auto_21765 ?auto_21767 ) ( SURFACE-AT ?auto_21750 ?auto_21767 ) ( ON ?auto_21750 ?auto_21781 ) ( CLEAR ?auto_21750 ) ( not ( = ?auto_21749 ?auto_21750 ) ) ( not ( = ?auto_21749 ?auto_21781 ) ) ( not ( = ?auto_21750 ?auto_21781 ) ) ( not ( = ?auto_21759 ?auto_21765 ) ) ( IS-CRATE ?auto_21749 ) ( not ( = ?auto_21774 ?auto_21760 ) ) ( HOIST-AT ?auto_21776 ?auto_21774 ) ( AVAILABLE ?auto_21776 ) ( SURFACE-AT ?auto_21749 ?auto_21774 ) ( ON ?auto_21749 ?auto_21773 ) ( CLEAR ?auto_21749 ) ( not ( = ?auto_21748 ?auto_21749 ) ) ( not ( = ?auto_21748 ?auto_21773 ) ) ( not ( = ?auto_21749 ?auto_21773 ) ) ( not ( = ?auto_21759 ?auto_21776 ) ) ( IS-CRATE ?auto_21748 ) ( AVAILABLE ?auto_21765 ) ( SURFACE-AT ?auto_21748 ?auto_21767 ) ( ON ?auto_21748 ?auto_21777 ) ( CLEAR ?auto_21748 ) ( not ( = ?auto_21747 ?auto_21748 ) ) ( not ( = ?auto_21747 ?auto_21777 ) ) ( not ( = ?auto_21748 ?auto_21777 ) ) ( IS-CRATE ?auto_21747 ) ( not ( = ?auto_21771 ?auto_21760 ) ) ( HOIST-AT ?auto_21768 ?auto_21771 ) ( SURFACE-AT ?auto_21747 ?auto_21771 ) ( ON ?auto_21747 ?auto_21766 ) ( CLEAR ?auto_21747 ) ( not ( = ?auto_21746 ?auto_21747 ) ) ( not ( = ?auto_21746 ?auto_21766 ) ) ( not ( = ?auto_21747 ?auto_21766 ) ) ( not ( = ?auto_21759 ?auto_21768 ) ) ( IS-CRATE ?auto_21746 ) ( AVAILABLE ?auto_21768 ) ( SURFACE-AT ?auto_21746 ?auto_21771 ) ( ON ?auto_21746 ?auto_21787 ) ( CLEAR ?auto_21746 ) ( not ( = ?auto_21745 ?auto_21746 ) ) ( not ( = ?auto_21745 ?auto_21787 ) ) ( not ( = ?auto_21746 ?auto_21787 ) ) ( SURFACE-AT ?auto_21744 ?auto_21760 ) ( CLEAR ?auto_21744 ) ( IS-CRATE ?auto_21745 ) ( AVAILABLE ?auto_21759 ) ( not ( = ?auto_21763 ?auto_21760 ) ) ( HOIST-AT ?auto_21762 ?auto_21763 ) ( AVAILABLE ?auto_21762 ) ( SURFACE-AT ?auto_21745 ?auto_21763 ) ( ON ?auto_21745 ?auto_21784 ) ( CLEAR ?auto_21745 ) ( TRUCK-AT ?auto_21758 ?auto_21760 ) ( not ( = ?auto_21744 ?auto_21745 ) ) ( not ( = ?auto_21744 ?auto_21784 ) ) ( not ( = ?auto_21745 ?auto_21784 ) ) ( not ( = ?auto_21759 ?auto_21762 ) ) ( not ( = ?auto_21744 ?auto_21746 ) ) ( not ( = ?auto_21744 ?auto_21787 ) ) ( not ( = ?auto_21746 ?auto_21784 ) ) ( not ( = ?auto_21771 ?auto_21763 ) ) ( not ( = ?auto_21768 ?auto_21762 ) ) ( not ( = ?auto_21787 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21747 ) ) ( not ( = ?auto_21744 ?auto_21766 ) ) ( not ( = ?auto_21745 ?auto_21747 ) ) ( not ( = ?auto_21745 ?auto_21766 ) ) ( not ( = ?auto_21747 ?auto_21787 ) ) ( not ( = ?auto_21747 ?auto_21784 ) ) ( not ( = ?auto_21766 ?auto_21787 ) ) ( not ( = ?auto_21766 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21748 ) ) ( not ( = ?auto_21744 ?auto_21777 ) ) ( not ( = ?auto_21745 ?auto_21748 ) ) ( not ( = ?auto_21745 ?auto_21777 ) ) ( not ( = ?auto_21746 ?auto_21748 ) ) ( not ( = ?auto_21746 ?auto_21777 ) ) ( not ( = ?auto_21748 ?auto_21766 ) ) ( not ( = ?auto_21748 ?auto_21787 ) ) ( not ( = ?auto_21748 ?auto_21784 ) ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21767 ?auto_21763 ) ) ( not ( = ?auto_21765 ?auto_21768 ) ) ( not ( = ?auto_21765 ?auto_21762 ) ) ( not ( = ?auto_21777 ?auto_21766 ) ) ( not ( = ?auto_21777 ?auto_21787 ) ) ( not ( = ?auto_21777 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21749 ) ) ( not ( = ?auto_21744 ?auto_21773 ) ) ( not ( = ?auto_21745 ?auto_21749 ) ) ( not ( = ?auto_21745 ?auto_21773 ) ) ( not ( = ?auto_21746 ?auto_21749 ) ) ( not ( = ?auto_21746 ?auto_21773 ) ) ( not ( = ?auto_21747 ?auto_21749 ) ) ( not ( = ?auto_21747 ?auto_21773 ) ) ( not ( = ?auto_21749 ?auto_21777 ) ) ( not ( = ?auto_21749 ?auto_21766 ) ) ( not ( = ?auto_21749 ?auto_21787 ) ) ( not ( = ?auto_21749 ?auto_21784 ) ) ( not ( = ?auto_21774 ?auto_21767 ) ) ( not ( = ?auto_21774 ?auto_21771 ) ) ( not ( = ?auto_21774 ?auto_21763 ) ) ( not ( = ?auto_21776 ?auto_21765 ) ) ( not ( = ?auto_21776 ?auto_21768 ) ) ( not ( = ?auto_21776 ?auto_21762 ) ) ( not ( = ?auto_21773 ?auto_21777 ) ) ( not ( = ?auto_21773 ?auto_21766 ) ) ( not ( = ?auto_21773 ?auto_21787 ) ) ( not ( = ?auto_21773 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21750 ) ) ( not ( = ?auto_21744 ?auto_21781 ) ) ( not ( = ?auto_21745 ?auto_21750 ) ) ( not ( = ?auto_21745 ?auto_21781 ) ) ( not ( = ?auto_21746 ?auto_21750 ) ) ( not ( = ?auto_21746 ?auto_21781 ) ) ( not ( = ?auto_21747 ?auto_21750 ) ) ( not ( = ?auto_21747 ?auto_21781 ) ) ( not ( = ?auto_21748 ?auto_21750 ) ) ( not ( = ?auto_21748 ?auto_21781 ) ) ( not ( = ?auto_21750 ?auto_21773 ) ) ( not ( = ?auto_21750 ?auto_21777 ) ) ( not ( = ?auto_21750 ?auto_21766 ) ) ( not ( = ?auto_21750 ?auto_21787 ) ) ( not ( = ?auto_21750 ?auto_21784 ) ) ( not ( = ?auto_21781 ?auto_21773 ) ) ( not ( = ?auto_21781 ?auto_21777 ) ) ( not ( = ?auto_21781 ?auto_21766 ) ) ( not ( = ?auto_21781 ?auto_21787 ) ) ( not ( = ?auto_21781 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21751 ) ) ( not ( = ?auto_21744 ?auto_21782 ) ) ( not ( = ?auto_21745 ?auto_21751 ) ) ( not ( = ?auto_21745 ?auto_21782 ) ) ( not ( = ?auto_21746 ?auto_21751 ) ) ( not ( = ?auto_21746 ?auto_21782 ) ) ( not ( = ?auto_21747 ?auto_21751 ) ) ( not ( = ?auto_21747 ?auto_21782 ) ) ( not ( = ?auto_21748 ?auto_21751 ) ) ( not ( = ?auto_21748 ?auto_21782 ) ) ( not ( = ?auto_21749 ?auto_21751 ) ) ( not ( = ?auto_21749 ?auto_21782 ) ) ( not ( = ?auto_21751 ?auto_21781 ) ) ( not ( = ?auto_21751 ?auto_21773 ) ) ( not ( = ?auto_21751 ?auto_21777 ) ) ( not ( = ?auto_21751 ?auto_21766 ) ) ( not ( = ?auto_21751 ?auto_21787 ) ) ( not ( = ?auto_21751 ?auto_21784 ) ) ( not ( = ?auto_21785 ?auto_21767 ) ) ( not ( = ?auto_21785 ?auto_21774 ) ) ( not ( = ?auto_21785 ?auto_21771 ) ) ( not ( = ?auto_21785 ?auto_21763 ) ) ( not ( = ?auto_21770 ?auto_21765 ) ) ( not ( = ?auto_21770 ?auto_21776 ) ) ( not ( = ?auto_21770 ?auto_21768 ) ) ( not ( = ?auto_21770 ?auto_21762 ) ) ( not ( = ?auto_21782 ?auto_21781 ) ) ( not ( = ?auto_21782 ?auto_21773 ) ) ( not ( = ?auto_21782 ?auto_21777 ) ) ( not ( = ?auto_21782 ?auto_21766 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( not ( = ?auto_21782 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21752 ) ) ( not ( = ?auto_21744 ?auto_21779 ) ) ( not ( = ?auto_21745 ?auto_21752 ) ) ( not ( = ?auto_21745 ?auto_21779 ) ) ( not ( = ?auto_21746 ?auto_21752 ) ) ( not ( = ?auto_21746 ?auto_21779 ) ) ( not ( = ?auto_21747 ?auto_21752 ) ) ( not ( = ?auto_21747 ?auto_21779 ) ) ( not ( = ?auto_21748 ?auto_21752 ) ) ( not ( = ?auto_21748 ?auto_21779 ) ) ( not ( = ?auto_21749 ?auto_21752 ) ) ( not ( = ?auto_21749 ?auto_21779 ) ) ( not ( = ?auto_21750 ?auto_21752 ) ) ( not ( = ?auto_21750 ?auto_21779 ) ) ( not ( = ?auto_21752 ?auto_21782 ) ) ( not ( = ?auto_21752 ?auto_21781 ) ) ( not ( = ?auto_21752 ?auto_21773 ) ) ( not ( = ?auto_21752 ?auto_21777 ) ) ( not ( = ?auto_21752 ?auto_21766 ) ) ( not ( = ?auto_21752 ?auto_21787 ) ) ( not ( = ?auto_21752 ?auto_21784 ) ) ( not ( = ?auto_21778 ?auto_21785 ) ) ( not ( = ?auto_21778 ?auto_21767 ) ) ( not ( = ?auto_21778 ?auto_21774 ) ) ( not ( = ?auto_21778 ?auto_21771 ) ) ( not ( = ?auto_21778 ?auto_21763 ) ) ( not ( = ?auto_21775 ?auto_21770 ) ) ( not ( = ?auto_21775 ?auto_21765 ) ) ( not ( = ?auto_21775 ?auto_21776 ) ) ( not ( = ?auto_21775 ?auto_21768 ) ) ( not ( = ?auto_21775 ?auto_21762 ) ) ( not ( = ?auto_21779 ?auto_21782 ) ) ( not ( = ?auto_21779 ?auto_21781 ) ) ( not ( = ?auto_21779 ?auto_21773 ) ) ( not ( = ?auto_21779 ?auto_21777 ) ) ( not ( = ?auto_21779 ?auto_21766 ) ) ( not ( = ?auto_21779 ?auto_21787 ) ) ( not ( = ?auto_21779 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21753 ) ) ( not ( = ?auto_21744 ?auto_21764 ) ) ( not ( = ?auto_21745 ?auto_21753 ) ) ( not ( = ?auto_21745 ?auto_21764 ) ) ( not ( = ?auto_21746 ?auto_21753 ) ) ( not ( = ?auto_21746 ?auto_21764 ) ) ( not ( = ?auto_21747 ?auto_21753 ) ) ( not ( = ?auto_21747 ?auto_21764 ) ) ( not ( = ?auto_21748 ?auto_21753 ) ) ( not ( = ?auto_21748 ?auto_21764 ) ) ( not ( = ?auto_21749 ?auto_21753 ) ) ( not ( = ?auto_21749 ?auto_21764 ) ) ( not ( = ?auto_21750 ?auto_21753 ) ) ( not ( = ?auto_21750 ?auto_21764 ) ) ( not ( = ?auto_21751 ?auto_21753 ) ) ( not ( = ?auto_21751 ?auto_21764 ) ) ( not ( = ?auto_21753 ?auto_21779 ) ) ( not ( = ?auto_21753 ?auto_21782 ) ) ( not ( = ?auto_21753 ?auto_21781 ) ) ( not ( = ?auto_21753 ?auto_21773 ) ) ( not ( = ?auto_21753 ?auto_21777 ) ) ( not ( = ?auto_21753 ?auto_21766 ) ) ( not ( = ?auto_21753 ?auto_21787 ) ) ( not ( = ?auto_21753 ?auto_21784 ) ) ( not ( = ?auto_21772 ?auto_21778 ) ) ( not ( = ?auto_21772 ?auto_21785 ) ) ( not ( = ?auto_21772 ?auto_21767 ) ) ( not ( = ?auto_21772 ?auto_21774 ) ) ( not ( = ?auto_21772 ?auto_21771 ) ) ( not ( = ?auto_21772 ?auto_21763 ) ) ( not ( = ?auto_21783 ?auto_21775 ) ) ( not ( = ?auto_21783 ?auto_21770 ) ) ( not ( = ?auto_21783 ?auto_21765 ) ) ( not ( = ?auto_21783 ?auto_21776 ) ) ( not ( = ?auto_21783 ?auto_21768 ) ) ( not ( = ?auto_21783 ?auto_21762 ) ) ( not ( = ?auto_21764 ?auto_21779 ) ) ( not ( = ?auto_21764 ?auto_21782 ) ) ( not ( = ?auto_21764 ?auto_21781 ) ) ( not ( = ?auto_21764 ?auto_21773 ) ) ( not ( = ?auto_21764 ?auto_21777 ) ) ( not ( = ?auto_21764 ?auto_21766 ) ) ( not ( = ?auto_21764 ?auto_21787 ) ) ( not ( = ?auto_21764 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21754 ) ) ( not ( = ?auto_21744 ?auto_21769 ) ) ( not ( = ?auto_21745 ?auto_21754 ) ) ( not ( = ?auto_21745 ?auto_21769 ) ) ( not ( = ?auto_21746 ?auto_21754 ) ) ( not ( = ?auto_21746 ?auto_21769 ) ) ( not ( = ?auto_21747 ?auto_21754 ) ) ( not ( = ?auto_21747 ?auto_21769 ) ) ( not ( = ?auto_21748 ?auto_21754 ) ) ( not ( = ?auto_21748 ?auto_21769 ) ) ( not ( = ?auto_21749 ?auto_21754 ) ) ( not ( = ?auto_21749 ?auto_21769 ) ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21750 ?auto_21769 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21769 ) ) ( not ( = ?auto_21752 ?auto_21754 ) ) ( not ( = ?auto_21752 ?auto_21769 ) ) ( not ( = ?auto_21754 ?auto_21764 ) ) ( not ( = ?auto_21754 ?auto_21779 ) ) ( not ( = ?auto_21754 ?auto_21782 ) ) ( not ( = ?auto_21754 ?auto_21781 ) ) ( not ( = ?auto_21754 ?auto_21773 ) ) ( not ( = ?auto_21754 ?auto_21777 ) ) ( not ( = ?auto_21754 ?auto_21766 ) ) ( not ( = ?auto_21754 ?auto_21787 ) ) ( not ( = ?auto_21754 ?auto_21784 ) ) ( not ( = ?auto_21786 ?auto_21772 ) ) ( not ( = ?auto_21786 ?auto_21778 ) ) ( not ( = ?auto_21786 ?auto_21785 ) ) ( not ( = ?auto_21786 ?auto_21767 ) ) ( not ( = ?auto_21786 ?auto_21774 ) ) ( not ( = ?auto_21786 ?auto_21771 ) ) ( not ( = ?auto_21786 ?auto_21763 ) ) ( not ( = ?auto_21780 ?auto_21783 ) ) ( not ( = ?auto_21780 ?auto_21775 ) ) ( not ( = ?auto_21780 ?auto_21770 ) ) ( not ( = ?auto_21780 ?auto_21765 ) ) ( not ( = ?auto_21780 ?auto_21776 ) ) ( not ( = ?auto_21780 ?auto_21768 ) ) ( not ( = ?auto_21780 ?auto_21762 ) ) ( not ( = ?auto_21769 ?auto_21764 ) ) ( not ( = ?auto_21769 ?auto_21779 ) ) ( not ( = ?auto_21769 ?auto_21782 ) ) ( not ( = ?auto_21769 ?auto_21781 ) ) ( not ( = ?auto_21769 ?auto_21773 ) ) ( not ( = ?auto_21769 ?auto_21777 ) ) ( not ( = ?auto_21769 ?auto_21766 ) ) ( not ( = ?auto_21769 ?auto_21787 ) ) ( not ( = ?auto_21769 ?auto_21784 ) ) ( not ( = ?auto_21744 ?auto_21755 ) ) ( not ( = ?auto_21744 ?auto_21756 ) ) ( not ( = ?auto_21745 ?auto_21755 ) ) ( not ( = ?auto_21745 ?auto_21756 ) ) ( not ( = ?auto_21746 ?auto_21755 ) ) ( not ( = ?auto_21746 ?auto_21756 ) ) ( not ( = ?auto_21747 ?auto_21755 ) ) ( not ( = ?auto_21747 ?auto_21756 ) ) ( not ( = ?auto_21748 ?auto_21755 ) ) ( not ( = ?auto_21748 ?auto_21756 ) ) ( not ( = ?auto_21749 ?auto_21755 ) ) ( not ( = ?auto_21749 ?auto_21756 ) ) ( not ( = ?auto_21750 ?auto_21755 ) ) ( not ( = ?auto_21750 ?auto_21756 ) ) ( not ( = ?auto_21751 ?auto_21755 ) ) ( not ( = ?auto_21751 ?auto_21756 ) ) ( not ( = ?auto_21752 ?auto_21755 ) ) ( not ( = ?auto_21752 ?auto_21756 ) ) ( not ( = ?auto_21753 ?auto_21755 ) ) ( not ( = ?auto_21753 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21769 ) ) ( not ( = ?auto_21755 ?auto_21764 ) ) ( not ( = ?auto_21755 ?auto_21779 ) ) ( not ( = ?auto_21755 ?auto_21782 ) ) ( not ( = ?auto_21755 ?auto_21781 ) ) ( not ( = ?auto_21755 ?auto_21773 ) ) ( not ( = ?auto_21755 ?auto_21777 ) ) ( not ( = ?auto_21755 ?auto_21766 ) ) ( not ( = ?auto_21755 ?auto_21787 ) ) ( not ( = ?auto_21755 ?auto_21784 ) ) ( not ( = ?auto_21761 ?auto_21786 ) ) ( not ( = ?auto_21761 ?auto_21772 ) ) ( not ( = ?auto_21761 ?auto_21778 ) ) ( not ( = ?auto_21761 ?auto_21785 ) ) ( not ( = ?auto_21761 ?auto_21767 ) ) ( not ( = ?auto_21761 ?auto_21774 ) ) ( not ( = ?auto_21761 ?auto_21771 ) ) ( not ( = ?auto_21761 ?auto_21763 ) ) ( not ( = ?auto_21757 ?auto_21780 ) ) ( not ( = ?auto_21757 ?auto_21783 ) ) ( not ( = ?auto_21757 ?auto_21775 ) ) ( not ( = ?auto_21757 ?auto_21770 ) ) ( not ( = ?auto_21757 ?auto_21765 ) ) ( not ( = ?auto_21757 ?auto_21776 ) ) ( not ( = ?auto_21757 ?auto_21768 ) ) ( not ( = ?auto_21757 ?auto_21762 ) ) ( not ( = ?auto_21756 ?auto_21769 ) ) ( not ( = ?auto_21756 ?auto_21764 ) ) ( not ( = ?auto_21756 ?auto_21779 ) ) ( not ( = ?auto_21756 ?auto_21782 ) ) ( not ( = ?auto_21756 ?auto_21781 ) ) ( not ( = ?auto_21756 ?auto_21773 ) ) ( not ( = ?auto_21756 ?auto_21777 ) ) ( not ( = ?auto_21756 ?auto_21766 ) ) ( not ( = ?auto_21756 ?auto_21787 ) ) ( not ( = ?auto_21756 ?auto_21784 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21744 ?auto_21745 ?auto_21746 ?auto_21747 ?auto_21748 ?auto_21749 ?auto_21750 ?auto_21751 ?auto_21752 ?auto_21753 ?auto_21754 )
      ( MAKE-1CRATE ?auto_21754 ?auto_21755 )
      ( MAKE-11CRATE-VERIFY ?auto_21744 ?auto_21745 ?auto_21746 ?auto_21747 ?auto_21748 ?auto_21749 ?auto_21750 ?auto_21751 ?auto_21752 ?auto_21753 ?auto_21754 ?auto_21755 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21811 - SURFACE
      ?auto_21812 - SURFACE
      ?auto_21813 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21815 - SURFACE
      ?auto_21816 - SURFACE
      ?auto_21817 - SURFACE
      ?auto_21818 - SURFACE
      ?auto_21819 - SURFACE
      ?auto_21820 - SURFACE
      ?auto_21821 - SURFACE
      ?auto_21822 - SURFACE
      ?auto_21823 - SURFACE
    )
    :vars
    (
      ?auto_21828 - HOIST
      ?auto_21827 - PLACE
      ?auto_21829 - PLACE
      ?auto_21825 - HOIST
      ?auto_21826 - SURFACE
      ?auto_21852 - PLACE
      ?auto_21848 - HOIST
      ?auto_21834 - SURFACE
      ?auto_21847 - PLACE
      ?auto_21841 - HOIST
      ?auto_21832 - SURFACE
      ?auto_21842 - PLACE
      ?auto_21856 - HOIST
      ?auto_21850 - SURFACE
      ?auto_21855 - SURFACE
      ?auto_21838 - PLACE
      ?auto_21830 - HOIST
      ?auto_21835 - SURFACE
      ?auto_21837 - PLACE
      ?auto_21844 - HOIST
      ?auto_21836 - SURFACE
      ?auto_21846 - PLACE
      ?auto_21853 - HOIST
      ?auto_21840 - SURFACE
      ?auto_21851 - SURFACE
      ?auto_21843 - PLACE
      ?auto_21854 - HOIST
      ?auto_21831 - SURFACE
      ?auto_21845 - SURFACE
      ?auto_21849 - PLACE
      ?auto_21839 - HOIST
      ?auto_21833 - SURFACE
      ?auto_21824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21828 ?auto_21827 ) ( IS-CRATE ?auto_21823 ) ( not ( = ?auto_21829 ?auto_21827 ) ) ( HOIST-AT ?auto_21825 ?auto_21829 ) ( SURFACE-AT ?auto_21823 ?auto_21829 ) ( ON ?auto_21823 ?auto_21826 ) ( CLEAR ?auto_21823 ) ( not ( = ?auto_21822 ?auto_21823 ) ) ( not ( = ?auto_21822 ?auto_21826 ) ) ( not ( = ?auto_21823 ?auto_21826 ) ) ( not ( = ?auto_21828 ?auto_21825 ) ) ( IS-CRATE ?auto_21822 ) ( not ( = ?auto_21852 ?auto_21827 ) ) ( HOIST-AT ?auto_21848 ?auto_21852 ) ( AVAILABLE ?auto_21848 ) ( SURFACE-AT ?auto_21822 ?auto_21852 ) ( ON ?auto_21822 ?auto_21834 ) ( CLEAR ?auto_21822 ) ( not ( = ?auto_21821 ?auto_21822 ) ) ( not ( = ?auto_21821 ?auto_21834 ) ) ( not ( = ?auto_21822 ?auto_21834 ) ) ( not ( = ?auto_21828 ?auto_21848 ) ) ( IS-CRATE ?auto_21821 ) ( not ( = ?auto_21847 ?auto_21827 ) ) ( HOIST-AT ?auto_21841 ?auto_21847 ) ( AVAILABLE ?auto_21841 ) ( SURFACE-AT ?auto_21821 ?auto_21847 ) ( ON ?auto_21821 ?auto_21832 ) ( CLEAR ?auto_21821 ) ( not ( = ?auto_21820 ?auto_21821 ) ) ( not ( = ?auto_21820 ?auto_21832 ) ) ( not ( = ?auto_21821 ?auto_21832 ) ) ( not ( = ?auto_21828 ?auto_21841 ) ) ( IS-CRATE ?auto_21820 ) ( not ( = ?auto_21842 ?auto_21827 ) ) ( HOIST-AT ?auto_21856 ?auto_21842 ) ( AVAILABLE ?auto_21856 ) ( SURFACE-AT ?auto_21820 ?auto_21842 ) ( ON ?auto_21820 ?auto_21850 ) ( CLEAR ?auto_21820 ) ( not ( = ?auto_21819 ?auto_21820 ) ) ( not ( = ?auto_21819 ?auto_21850 ) ) ( not ( = ?auto_21820 ?auto_21850 ) ) ( not ( = ?auto_21828 ?auto_21856 ) ) ( IS-CRATE ?auto_21819 ) ( AVAILABLE ?auto_21825 ) ( SURFACE-AT ?auto_21819 ?auto_21829 ) ( ON ?auto_21819 ?auto_21855 ) ( CLEAR ?auto_21819 ) ( not ( = ?auto_21818 ?auto_21819 ) ) ( not ( = ?auto_21818 ?auto_21855 ) ) ( not ( = ?auto_21819 ?auto_21855 ) ) ( IS-CRATE ?auto_21818 ) ( not ( = ?auto_21838 ?auto_21827 ) ) ( HOIST-AT ?auto_21830 ?auto_21838 ) ( AVAILABLE ?auto_21830 ) ( SURFACE-AT ?auto_21818 ?auto_21838 ) ( ON ?auto_21818 ?auto_21835 ) ( CLEAR ?auto_21818 ) ( not ( = ?auto_21817 ?auto_21818 ) ) ( not ( = ?auto_21817 ?auto_21835 ) ) ( not ( = ?auto_21818 ?auto_21835 ) ) ( not ( = ?auto_21828 ?auto_21830 ) ) ( IS-CRATE ?auto_21817 ) ( not ( = ?auto_21837 ?auto_21827 ) ) ( HOIST-AT ?auto_21844 ?auto_21837 ) ( SURFACE-AT ?auto_21817 ?auto_21837 ) ( ON ?auto_21817 ?auto_21836 ) ( CLEAR ?auto_21817 ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( not ( = ?auto_21816 ?auto_21836 ) ) ( not ( = ?auto_21817 ?auto_21836 ) ) ( not ( = ?auto_21828 ?auto_21844 ) ) ( IS-CRATE ?auto_21816 ) ( not ( = ?auto_21846 ?auto_21827 ) ) ( HOIST-AT ?auto_21853 ?auto_21846 ) ( AVAILABLE ?auto_21853 ) ( SURFACE-AT ?auto_21816 ?auto_21846 ) ( ON ?auto_21816 ?auto_21840 ) ( CLEAR ?auto_21816 ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21815 ?auto_21840 ) ) ( not ( = ?auto_21816 ?auto_21840 ) ) ( not ( = ?auto_21828 ?auto_21853 ) ) ( IS-CRATE ?auto_21815 ) ( AVAILABLE ?auto_21844 ) ( SURFACE-AT ?auto_21815 ?auto_21837 ) ( ON ?auto_21815 ?auto_21851 ) ( CLEAR ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21814 ?auto_21851 ) ) ( not ( = ?auto_21815 ?auto_21851 ) ) ( IS-CRATE ?auto_21814 ) ( not ( = ?auto_21843 ?auto_21827 ) ) ( HOIST-AT ?auto_21854 ?auto_21843 ) ( SURFACE-AT ?auto_21814 ?auto_21843 ) ( ON ?auto_21814 ?auto_21831 ) ( CLEAR ?auto_21814 ) ( not ( = ?auto_21813 ?auto_21814 ) ) ( not ( = ?auto_21813 ?auto_21831 ) ) ( not ( = ?auto_21814 ?auto_21831 ) ) ( not ( = ?auto_21828 ?auto_21854 ) ) ( IS-CRATE ?auto_21813 ) ( AVAILABLE ?auto_21854 ) ( SURFACE-AT ?auto_21813 ?auto_21843 ) ( ON ?auto_21813 ?auto_21845 ) ( CLEAR ?auto_21813 ) ( not ( = ?auto_21812 ?auto_21813 ) ) ( not ( = ?auto_21812 ?auto_21845 ) ) ( not ( = ?auto_21813 ?auto_21845 ) ) ( SURFACE-AT ?auto_21811 ?auto_21827 ) ( CLEAR ?auto_21811 ) ( IS-CRATE ?auto_21812 ) ( AVAILABLE ?auto_21828 ) ( not ( = ?auto_21849 ?auto_21827 ) ) ( HOIST-AT ?auto_21839 ?auto_21849 ) ( AVAILABLE ?auto_21839 ) ( SURFACE-AT ?auto_21812 ?auto_21849 ) ( ON ?auto_21812 ?auto_21833 ) ( CLEAR ?auto_21812 ) ( TRUCK-AT ?auto_21824 ?auto_21827 ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21811 ?auto_21833 ) ) ( not ( = ?auto_21812 ?auto_21833 ) ) ( not ( = ?auto_21828 ?auto_21839 ) ) ( not ( = ?auto_21811 ?auto_21813 ) ) ( not ( = ?auto_21811 ?auto_21845 ) ) ( not ( = ?auto_21813 ?auto_21833 ) ) ( not ( = ?auto_21843 ?auto_21849 ) ) ( not ( = ?auto_21854 ?auto_21839 ) ) ( not ( = ?auto_21845 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21814 ) ) ( not ( = ?auto_21811 ?auto_21831 ) ) ( not ( = ?auto_21812 ?auto_21814 ) ) ( not ( = ?auto_21812 ?auto_21831 ) ) ( not ( = ?auto_21814 ?auto_21845 ) ) ( not ( = ?auto_21814 ?auto_21833 ) ) ( not ( = ?auto_21831 ?auto_21845 ) ) ( not ( = ?auto_21831 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21815 ) ) ( not ( = ?auto_21811 ?auto_21851 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) ( not ( = ?auto_21812 ?auto_21851 ) ) ( not ( = ?auto_21813 ?auto_21815 ) ) ( not ( = ?auto_21813 ?auto_21851 ) ) ( not ( = ?auto_21815 ?auto_21831 ) ) ( not ( = ?auto_21815 ?auto_21845 ) ) ( not ( = ?auto_21815 ?auto_21833 ) ) ( not ( = ?auto_21837 ?auto_21843 ) ) ( not ( = ?auto_21837 ?auto_21849 ) ) ( not ( = ?auto_21844 ?auto_21854 ) ) ( not ( = ?auto_21844 ?auto_21839 ) ) ( not ( = ?auto_21851 ?auto_21831 ) ) ( not ( = ?auto_21851 ?auto_21845 ) ) ( not ( = ?auto_21851 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21816 ) ) ( not ( = ?auto_21811 ?auto_21840 ) ) ( not ( = ?auto_21812 ?auto_21816 ) ) ( not ( = ?auto_21812 ?auto_21840 ) ) ( not ( = ?auto_21813 ?auto_21816 ) ) ( not ( = ?auto_21813 ?auto_21840 ) ) ( not ( = ?auto_21814 ?auto_21816 ) ) ( not ( = ?auto_21814 ?auto_21840 ) ) ( not ( = ?auto_21816 ?auto_21851 ) ) ( not ( = ?auto_21816 ?auto_21831 ) ) ( not ( = ?auto_21816 ?auto_21845 ) ) ( not ( = ?auto_21816 ?auto_21833 ) ) ( not ( = ?auto_21846 ?auto_21837 ) ) ( not ( = ?auto_21846 ?auto_21843 ) ) ( not ( = ?auto_21846 ?auto_21849 ) ) ( not ( = ?auto_21853 ?auto_21844 ) ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21839 ) ) ( not ( = ?auto_21840 ?auto_21851 ) ) ( not ( = ?auto_21840 ?auto_21831 ) ) ( not ( = ?auto_21840 ?auto_21845 ) ) ( not ( = ?auto_21840 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21817 ) ) ( not ( = ?auto_21811 ?auto_21836 ) ) ( not ( = ?auto_21812 ?auto_21817 ) ) ( not ( = ?auto_21812 ?auto_21836 ) ) ( not ( = ?auto_21813 ?auto_21817 ) ) ( not ( = ?auto_21813 ?auto_21836 ) ) ( not ( = ?auto_21814 ?auto_21817 ) ) ( not ( = ?auto_21814 ?auto_21836 ) ) ( not ( = ?auto_21815 ?auto_21817 ) ) ( not ( = ?auto_21815 ?auto_21836 ) ) ( not ( = ?auto_21817 ?auto_21840 ) ) ( not ( = ?auto_21817 ?auto_21851 ) ) ( not ( = ?auto_21817 ?auto_21831 ) ) ( not ( = ?auto_21817 ?auto_21845 ) ) ( not ( = ?auto_21817 ?auto_21833 ) ) ( not ( = ?auto_21836 ?auto_21840 ) ) ( not ( = ?auto_21836 ?auto_21851 ) ) ( not ( = ?auto_21836 ?auto_21831 ) ) ( not ( = ?auto_21836 ?auto_21845 ) ) ( not ( = ?auto_21836 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21818 ) ) ( not ( = ?auto_21811 ?auto_21835 ) ) ( not ( = ?auto_21812 ?auto_21818 ) ) ( not ( = ?auto_21812 ?auto_21835 ) ) ( not ( = ?auto_21813 ?auto_21818 ) ) ( not ( = ?auto_21813 ?auto_21835 ) ) ( not ( = ?auto_21814 ?auto_21818 ) ) ( not ( = ?auto_21814 ?auto_21835 ) ) ( not ( = ?auto_21815 ?auto_21818 ) ) ( not ( = ?auto_21815 ?auto_21835 ) ) ( not ( = ?auto_21816 ?auto_21818 ) ) ( not ( = ?auto_21816 ?auto_21835 ) ) ( not ( = ?auto_21818 ?auto_21836 ) ) ( not ( = ?auto_21818 ?auto_21840 ) ) ( not ( = ?auto_21818 ?auto_21851 ) ) ( not ( = ?auto_21818 ?auto_21831 ) ) ( not ( = ?auto_21818 ?auto_21845 ) ) ( not ( = ?auto_21818 ?auto_21833 ) ) ( not ( = ?auto_21838 ?auto_21837 ) ) ( not ( = ?auto_21838 ?auto_21846 ) ) ( not ( = ?auto_21838 ?auto_21843 ) ) ( not ( = ?auto_21838 ?auto_21849 ) ) ( not ( = ?auto_21830 ?auto_21844 ) ) ( not ( = ?auto_21830 ?auto_21853 ) ) ( not ( = ?auto_21830 ?auto_21854 ) ) ( not ( = ?auto_21830 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( not ( = ?auto_21835 ?auto_21840 ) ) ( not ( = ?auto_21835 ?auto_21851 ) ) ( not ( = ?auto_21835 ?auto_21831 ) ) ( not ( = ?auto_21835 ?auto_21845 ) ) ( not ( = ?auto_21835 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21819 ) ) ( not ( = ?auto_21811 ?auto_21855 ) ) ( not ( = ?auto_21812 ?auto_21819 ) ) ( not ( = ?auto_21812 ?auto_21855 ) ) ( not ( = ?auto_21813 ?auto_21819 ) ) ( not ( = ?auto_21813 ?auto_21855 ) ) ( not ( = ?auto_21814 ?auto_21819 ) ) ( not ( = ?auto_21814 ?auto_21855 ) ) ( not ( = ?auto_21815 ?auto_21819 ) ) ( not ( = ?auto_21815 ?auto_21855 ) ) ( not ( = ?auto_21816 ?auto_21819 ) ) ( not ( = ?auto_21816 ?auto_21855 ) ) ( not ( = ?auto_21817 ?auto_21819 ) ) ( not ( = ?auto_21817 ?auto_21855 ) ) ( not ( = ?auto_21819 ?auto_21835 ) ) ( not ( = ?auto_21819 ?auto_21836 ) ) ( not ( = ?auto_21819 ?auto_21840 ) ) ( not ( = ?auto_21819 ?auto_21851 ) ) ( not ( = ?auto_21819 ?auto_21831 ) ) ( not ( = ?auto_21819 ?auto_21845 ) ) ( not ( = ?auto_21819 ?auto_21833 ) ) ( not ( = ?auto_21829 ?auto_21838 ) ) ( not ( = ?auto_21829 ?auto_21837 ) ) ( not ( = ?auto_21829 ?auto_21846 ) ) ( not ( = ?auto_21829 ?auto_21843 ) ) ( not ( = ?auto_21829 ?auto_21849 ) ) ( not ( = ?auto_21825 ?auto_21830 ) ) ( not ( = ?auto_21825 ?auto_21844 ) ) ( not ( = ?auto_21825 ?auto_21853 ) ) ( not ( = ?auto_21825 ?auto_21854 ) ) ( not ( = ?auto_21825 ?auto_21839 ) ) ( not ( = ?auto_21855 ?auto_21835 ) ) ( not ( = ?auto_21855 ?auto_21836 ) ) ( not ( = ?auto_21855 ?auto_21840 ) ) ( not ( = ?auto_21855 ?auto_21851 ) ) ( not ( = ?auto_21855 ?auto_21831 ) ) ( not ( = ?auto_21855 ?auto_21845 ) ) ( not ( = ?auto_21855 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21820 ) ) ( not ( = ?auto_21811 ?auto_21850 ) ) ( not ( = ?auto_21812 ?auto_21820 ) ) ( not ( = ?auto_21812 ?auto_21850 ) ) ( not ( = ?auto_21813 ?auto_21820 ) ) ( not ( = ?auto_21813 ?auto_21850 ) ) ( not ( = ?auto_21814 ?auto_21820 ) ) ( not ( = ?auto_21814 ?auto_21850 ) ) ( not ( = ?auto_21815 ?auto_21820 ) ) ( not ( = ?auto_21815 ?auto_21850 ) ) ( not ( = ?auto_21816 ?auto_21820 ) ) ( not ( = ?auto_21816 ?auto_21850 ) ) ( not ( = ?auto_21817 ?auto_21820 ) ) ( not ( = ?auto_21817 ?auto_21850 ) ) ( not ( = ?auto_21818 ?auto_21820 ) ) ( not ( = ?auto_21818 ?auto_21850 ) ) ( not ( = ?auto_21820 ?auto_21855 ) ) ( not ( = ?auto_21820 ?auto_21835 ) ) ( not ( = ?auto_21820 ?auto_21836 ) ) ( not ( = ?auto_21820 ?auto_21840 ) ) ( not ( = ?auto_21820 ?auto_21851 ) ) ( not ( = ?auto_21820 ?auto_21831 ) ) ( not ( = ?auto_21820 ?auto_21845 ) ) ( not ( = ?auto_21820 ?auto_21833 ) ) ( not ( = ?auto_21842 ?auto_21829 ) ) ( not ( = ?auto_21842 ?auto_21838 ) ) ( not ( = ?auto_21842 ?auto_21837 ) ) ( not ( = ?auto_21842 ?auto_21846 ) ) ( not ( = ?auto_21842 ?auto_21843 ) ) ( not ( = ?auto_21842 ?auto_21849 ) ) ( not ( = ?auto_21856 ?auto_21825 ) ) ( not ( = ?auto_21856 ?auto_21830 ) ) ( not ( = ?auto_21856 ?auto_21844 ) ) ( not ( = ?auto_21856 ?auto_21853 ) ) ( not ( = ?auto_21856 ?auto_21854 ) ) ( not ( = ?auto_21856 ?auto_21839 ) ) ( not ( = ?auto_21850 ?auto_21855 ) ) ( not ( = ?auto_21850 ?auto_21835 ) ) ( not ( = ?auto_21850 ?auto_21836 ) ) ( not ( = ?auto_21850 ?auto_21840 ) ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21831 ) ) ( not ( = ?auto_21850 ?auto_21845 ) ) ( not ( = ?auto_21850 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21821 ) ) ( not ( = ?auto_21811 ?auto_21832 ) ) ( not ( = ?auto_21812 ?auto_21821 ) ) ( not ( = ?auto_21812 ?auto_21832 ) ) ( not ( = ?auto_21813 ?auto_21821 ) ) ( not ( = ?auto_21813 ?auto_21832 ) ) ( not ( = ?auto_21814 ?auto_21821 ) ) ( not ( = ?auto_21814 ?auto_21832 ) ) ( not ( = ?auto_21815 ?auto_21821 ) ) ( not ( = ?auto_21815 ?auto_21832 ) ) ( not ( = ?auto_21816 ?auto_21821 ) ) ( not ( = ?auto_21816 ?auto_21832 ) ) ( not ( = ?auto_21817 ?auto_21821 ) ) ( not ( = ?auto_21817 ?auto_21832 ) ) ( not ( = ?auto_21818 ?auto_21821 ) ) ( not ( = ?auto_21818 ?auto_21832 ) ) ( not ( = ?auto_21819 ?auto_21821 ) ) ( not ( = ?auto_21819 ?auto_21832 ) ) ( not ( = ?auto_21821 ?auto_21850 ) ) ( not ( = ?auto_21821 ?auto_21855 ) ) ( not ( = ?auto_21821 ?auto_21835 ) ) ( not ( = ?auto_21821 ?auto_21836 ) ) ( not ( = ?auto_21821 ?auto_21840 ) ) ( not ( = ?auto_21821 ?auto_21851 ) ) ( not ( = ?auto_21821 ?auto_21831 ) ) ( not ( = ?auto_21821 ?auto_21845 ) ) ( not ( = ?auto_21821 ?auto_21833 ) ) ( not ( = ?auto_21847 ?auto_21842 ) ) ( not ( = ?auto_21847 ?auto_21829 ) ) ( not ( = ?auto_21847 ?auto_21838 ) ) ( not ( = ?auto_21847 ?auto_21837 ) ) ( not ( = ?auto_21847 ?auto_21846 ) ) ( not ( = ?auto_21847 ?auto_21843 ) ) ( not ( = ?auto_21847 ?auto_21849 ) ) ( not ( = ?auto_21841 ?auto_21856 ) ) ( not ( = ?auto_21841 ?auto_21825 ) ) ( not ( = ?auto_21841 ?auto_21830 ) ) ( not ( = ?auto_21841 ?auto_21844 ) ) ( not ( = ?auto_21841 ?auto_21853 ) ) ( not ( = ?auto_21841 ?auto_21854 ) ) ( not ( = ?auto_21841 ?auto_21839 ) ) ( not ( = ?auto_21832 ?auto_21850 ) ) ( not ( = ?auto_21832 ?auto_21855 ) ) ( not ( = ?auto_21832 ?auto_21835 ) ) ( not ( = ?auto_21832 ?auto_21836 ) ) ( not ( = ?auto_21832 ?auto_21840 ) ) ( not ( = ?auto_21832 ?auto_21851 ) ) ( not ( = ?auto_21832 ?auto_21831 ) ) ( not ( = ?auto_21832 ?auto_21845 ) ) ( not ( = ?auto_21832 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21822 ) ) ( not ( = ?auto_21811 ?auto_21834 ) ) ( not ( = ?auto_21812 ?auto_21822 ) ) ( not ( = ?auto_21812 ?auto_21834 ) ) ( not ( = ?auto_21813 ?auto_21822 ) ) ( not ( = ?auto_21813 ?auto_21834 ) ) ( not ( = ?auto_21814 ?auto_21822 ) ) ( not ( = ?auto_21814 ?auto_21834 ) ) ( not ( = ?auto_21815 ?auto_21822 ) ) ( not ( = ?auto_21815 ?auto_21834 ) ) ( not ( = ?auto_21816 ?auto_21822 ) ) ( not ( = ?auto_21816 ?auto_21834 ) ) ( not ( = ?auto_21817 ?auto_21822 ) ) ( not ( = ?auto_21817 ?auto_21834 ) ) ( not ( = ?auto_21818 ?auto_21822 ) ) ( not ( = ?auto_21818 ?auto_21834 ) ) ( not ( = ?auto_21819 ?auto_21822 ) ) ( not ( = ?auto_21819 ?auto_21834 ) ) ( not ( = ?auto_21820 ?auto_21822 ) ) ( not ( = ?auto_21820 ?auto_21834 ) ) ( not ( = ?auto_21822 ?auto_21832 ) ) ( not ( = ?auto_21822 ?auto_21850 ) ) ( not ( = ?auto_21822 ?auto_21855 ) ) ( not ( = ?auto_21822 ?auto_21835 ) ) ( not ( = ?auto_21822 ?auto_21836 ) ) ( not ( = ?auto_21822 ?auto_21840 ) ) ( not ( = ?auto_21822 ?auto_21851 ) ) ( not ( = ?auto_21822 ?auto_21831 ) ) ( not ( = ?auto_21822 ?auto_21845 ) ) ( not ( = ?auto_21822 ?auto_21833 ) ) ( not ( = ?auto_21852 ?auto_21847 ) ) ( not ( = ?auto_21852 ?auto_21842 ) ) ( not ( = ?auto_21852 ?auto_21829 ) ) ( not ( = ?auto_21852 ?auto_21838 ) ) ( not ( = ?auto_21852 ?auto_21837 ) ) ( not ( = ?auto_21852 ?auto_21846 ) ) ( not ( = ?auto_21852 ?auto_21843 ) ) ( not ( = ?auto_21852 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21841 ) ) ( not ( = ?auto_21848 ?auto_21856 ) ) ( not ( = ?auto_21848 ?auto_21825 ) ) ( not ( = ?auto_21848 ?auto_21830 ) ) ( not ( = ?auto_21848 ?auto_21844 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21854 ) ) ( not ( = ?auto_21848 ?auto_21839 ) ) ( not ( = ?auto_21834 ?auto_21832 ) ) ( not ( = ?auto_21834 ?auto_21850 ) ) ( not ( = ?auto_21834 ?auto_21855 ) ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21836 ) ) ( not ( = ?auto_21834 ?auto_21840 ) ) ( not ( = ?auto_21834 ?auto_21851 ) ) ( not ( = ?auto_21834 ?auto_21831 ) ) ( not ( = ?auto_21834 ?auto_21845 ) ) ( not ( = ?auto_21834 ?auto_21833 ) ) ( not ( = ?auto_21811 ?auto_21823 ) ) ( not ( = ?auto_21811 ?auto_21826 ) ) ( not ( = ?auto_21812 ?auto_21823 ) ) ( not ( = ?auto_21812 ?auto_21826 ) ) ( not ( = ?auto_21813 ?auto_21823 ) ) ( not ( = ?auto_21813 ?auto_21826 ) ) ( not ( = ?auto_21814 ?auto_21823 ) ) ( not ( = ?auto_21814 ?auto_21826 ) ) ( not ( = ?auto_21815 ?auto_21823 ) ) ( not ( = ?auto_21815 ?auto_21826 ) ) ( not ( = ?auto_21816 ?auto_21823 ) ) ( not ( = ?auto_21816 ?auto_21826 ) ) ( not ( = ?auto_21817 ?auto_21823 ) ) ( not ( = ?auto_21817 ?auto_21826 ) ) ( not ( = ?auto_21818 ?auto_21823 ) ) ( not ( = ?auto_21818 ?auto_21826 ) ) ( not ( = ?auto_21819 ?auto_21823 ) ) ( not ( = ?auto_21819 ?auto_21826 ) ) ( not ( = ?auto_21820 ?auto_21823 ) ) ( not ( = ?auto_21820 ?auto_21826 ) ) ( not ( = ?auto_21821 ?auto_21823 ) ) ( not ( = ?auto_21821 ?auto_21826 ) ) ( not ( = ?auto_21823 ?auto_21834 ) ) ( not ( = ?auto_21823 ?auto_21832 ) ) ( not ( = ?auto_21823 ?auto_21850 ) ) ( not ( = ?auto_21823 ?auto_21855 ) ) ( not ( = ?auto_21823 ?auto_21835 ) ) ( not ( = ?auto_21823 ?auto_21836 ) ) ( not ( = ?auto_21823 ?auto_21840 ) ) ( not ( = ?auto_21823 ?auto_21851 ) ) ( not ( = ?auto_21823 ?auto_21831 ) ) ( not ( = ?auto_21823 ?auto_21845 ) ) ( not ( = ?auto_21823 ?auto_21833 ) ) ( not ( = ?auto_21826 ?auto_21834 ) ) ( not ( = ?auto_21826 ?auto_21832 ) ) ( not ( = ?auto_21826 ?auto_21850 ) ) ( not ( = ?auto_21826 ?auto_21855 ) ) ( not ( = ?auto_21826 ?auto_21835 ) ) ( not ( = ?auto_21826 ?auto_21836 ) ) ( not ( = ?auto_21826 ?auto_21840 ) ) ( not ( = ?auto_21826 ?auto_21851 ) ) ( not ( = ?auto_21826 ?auto_21831 ) ) ( not ( = ?auto_21826 ?auto_21845 ) ) ( not ( = ?auto_21826 ?auto_21833 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21811 ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ?auto_21816 ?auto_21817 ?auto_21818 ?auto_21819 ?auto_21820 ?auto_21821 ?auto_21822 )
      ( MAKE-1CRATE ?auto_21822 ?auto_21823 )
      ( MAKE-12CRATE-VERIFY ?auto_21811 ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ?auto_21816 ?auto_21817 ?auto_21818 ?auto_21819 ?auto_21820 ?auto_21821 ?auto_21822 ?auto_21823 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21881 - SURFACE
      ?auto_21882 - SURFACE
      ?auto_21883 - SURFACE
      ?auto_21884 - SURFACE
      ?auto_21885 - SURFACE
      ?auto_21886 - SURFACE
      ?auto_21887 - SURFACE
      ?auto_21888 - SURFACE
      ?auto_21889 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21891 - SURFACE
      ?auto_21892 - SURFACE
      ?auto_21893 - SURFACE
      ?auto_21894 - SURFACE
    )
    :vars
    (
      ?auto_21898 - HOIST
      ?auto_21899 - PLACE
      ?auto_21895 - PLACE
      ?auto_21897 - HOIST
      ?auto_21896 - SURFACE
      ?auto_21905 - SURFACE
      ?auto_21923 - PLACE
      ?auto_21927 - HOIST
      ?auto_21907 - SURFACE
      ?auto_21918 - PLACE
      ?auto_21920 - HOIST
      ?auto_21903 - SURFACE
      ?auto_21921 - PLACE
      ?auto_21924 - HOIST
      ?auto_21916 - SURFACE
      ?auto_21909 - SURFACE
      ?auto_21915 - PLACE
      ?auto_21922 - HOIST
      ?auto_21904 - SURFACE
      ?auto_21917 - PLACE
      ?auto_21913 - HOIST
      ?auto_21911 - SURFACE
      ?auto_21906 - PLACE
      ?auto_21912 - HOIST
      ?auto_21901 - SURFACE
      ?auto_21926 - SURFACE
      ?auto_21925 - PLACE
      ?auto_21928 - HOIST
      ?auto_21910 - SURFACE
      ?auto_21908 - SURFACE
      ?auto_21919 - PLACE
      ?auto_21902 - HOIST
      ?auto_21914 - SURFACE
      ?auto_21900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21898 ?auto_21899 ) ( IS-CRATE ?auto_21894 ) ( not ( = ?auto_21895 ?auto_21899 ) ) ( HOIST-AT ?auto_21897 ?auto_21895 ) ( SURFACE-AT ?auto_21894 ?auto_21895 ) ( ON ?auto_21894 ?auto_21896 ) ( CLEAR ?auto_21894 ) ( not ( = ?auto_21893 ?auto_21894 ) ) ( not ( = ?auto_21893 ?auto_21896 ) ) ( not ( = ?auto_21894 ?auto_21896 ) ) ( not ( = ?auto_21898 ?auto_21897 ) ) ( IS-CRATE ?auto_21893 ) ( SURFACE-AT ?auto_21893 ?auto_21895 ) ( ON ?auto_21893 ?auto_21905 ) ( CLEAR ?auto_21893 ) ( not ( = ?auto_21892 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21905 ) ) ( not ( = ?auto_21893 ?auto_21905 ) ) ( IS-CRATE ?auto_21892 ) ( not ( = ?auto_21923 ?auto_21899 ) ) ( HOIST-AT ?auto_21927 ?auto_21923 ) ( AVAILABLE ?auto_21927 ) ( SURFACE-AT ?auto_21892 ?auto_21923 ) ( ON ?auto_21892 ?auto_21907 ) ( CLEAR ?auto_21892 ) ( not ( = ?auto_21891 ?auto_21892 ) ) ( not ( = ?auto_21891 ?auto_21907 ) ) ( not ( = ?auto_21892 ?auto_21907 ) ) ( not ( = ?auto_21898 ?auto_21927 ) ) ( IS-CRATE ?auto_21891 ) ( not ( = ?auto_21918 ?auto_21899 ) ) ( HOIST-AT ?auto_21920 ?auto_21918 ) ( AVAILABLE ?auto_21920 ) ( SURFACE-AT ?auto_21891 ?auto_21918 ) ( ON ?auto_21891 ?auto_21903 ) ( CLEAR ?auto_21891 ) ( not ( = ?auto_21890 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21903 ) ) ( not ( = ?auto_21891 ?auto_21903 ) ) ( not ( = ?auto_21898 ?auto_21920 ) ) ( IS-CRATE ?auto_21890 ) ( not ( = ?auto_21921 ?auto_21899 ) ) ( HOIST-AT ?auto_21924 ?auto_21921 ) ( AVAILABLE ?auto_21924 ) ( SURFACE-AT ?auto_21890 ?auto_21921 ) ( ON ?auto_21890 ?auto_21916 ) ( CLEAR ?auto_21890 ) ( not ( = ?auto_21889 ?auto_21890 ) ) ( not ( = ?auto_21889 ?auto_21916 ) ) ( not ( = ?auto_21890 ?auto_21916 ) ) ( not ( = ?auto_21898 ?auto_21924 ) ) ( IS-CRATE ?auto_21889 ) ( AVAILABLE ?auto_21897 ) ( SURFACE-AT ?auto_21889 ?auto_21895 ) ( ON ?auto_21889 ?auto_21909 ) ( CLEAR ?auto_21889 ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21909 ) ) ( not ( = ?auto_21889 ?auto_21909 ) ) ( IS-CRATE ?auto_21888 ) ( not ( = ?auto_21915 ?auto_21899 ) ) ( HOIST-AT ?auto_21922 ?auto_21915 ) ( AVAILABLE ?auto_21922 ) ( SURFACE-AT ?auto_21888 ?auto_21915 ) ( ON ?auto_21888 ?auto_21904 ) ( CLEAR ?auto_21888 ) ( not ( = ?auto_21887 ?auto_21888 ) ) ( not ( = ?auto_21887 ?auto_21904 ) ) ( not ( = ?auto_21888 ?auto_21904 ) ) ( not ( = ?auto_21898 ?auto_21922 ) ) ( IS-CRATE ?auto_21887 ) ( not ( = ?auto_21917 ?auto_21899 ) ) ( HOIST-AT ?auto_21913 ?auto_21917 ) ( SURFACE-AT ?auto_21887 ?auto_21917 ) ( ON ?auto_21887 ?auto_21911 ) ( CLEAR ?auto_21887 ) ( not ( = ?auto_21886 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21911 ) ) ( not ( = ?auto_21887 ?auto_21911 ) ) ( not ( = ?auto_21898 ?auto_21913 ) ) ( IS-CRATE ?auto_21886 ) ( not ( = ?auto_21906 ?auto_21899 ) ) ( HOIST-AT ?auto_21912 ?auto_21906 ) ( AVAILABLE ?auto_21912 ) ( SURFACE-AT ?auto_21886 ?auto_21906 ) ( ON ?auto_21886 ?auto_21901 ) ( CLEAR ?auto_21886 ) ( not ( = ?auto_21885 ?auto_21886 ) ) ( not ( = ?auto_21885 ?auto_21901 ) ) ( not ( = ?auto_21886 ?auto_21901 ) ) ( not ( = ?auto_21898 ?auto_21912 ) ) ( IS-CRATE ?auto_21885 ) ( AVAILABLE ?auto_21913 ) ( SURFACE-AT ?auto_21885 ?auto_21917 ) ( ON ?auto_21885 ?auto_21926 ) ( CLEAR ?auto_21885 ) ( not ( = ?auto_21884 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21926 ) ) ( not ( = ?auto_21885 ?auto_21926 ) ) ( IS-CRATE ?auto_21884 ) ( not ( = ?auto_21925 ?auto_21899 ) ) ( HOIST-AT ?auto_21928 ?auto_21925 ) ( SURFACE-AT ?auto_21884 ?auto_21925 ) ( ON ?auto_21884 ?auto_21910 ) ( CLEAR ?auto_21884 ) ( not ( = ?auto_21883 ?auto_21884 ) ) ( not ( = ?auto_21883 ?auto_21910 ) ) ( not ( = ?auto_21884 ?auto_21910 ) ) ( not ( = ?auto_21898 ?auto_21928 ) ) ( IS-CRATE ?auto_21883 ) ( AVAILABLE ?auto_21928 ) ( SURFACE-AT ?auto_21883 ?auto_21925 ) ( ON ?auto_21883 ?auto_21908 ) ( CLEAR ?auto_21883 ) ( not ( = ?auto_21882 ?auto_21883 ) ) ( not ( = ?auto_21882 ?auto_21908 ) ) ( not ( = ?auto_21883 ?auto_21908 ) ) ( SURFACE-AT ?auto_21881 ?auto_21899 ) ( CLEAR ?auto_21881 ) ( IS-CRATE ?auto_21882 ) ( AVAILABLE ?auto_21898 ) ( not ( = ?auto_21919 ?auto_21899 ) ) ( HOIST-AT ?auto_21902 ?auto_21919 ) ( AVAILABLE ?auto_21902 ) ( SURFACE-AT ?auto_21882 ?auto_21919 ) ( ON ?auto_21882 ?auto_21914 ) ( CLEAR ?auto_21882 ) ( TRUCK-AT ?auto_21900 ?auto_21899 ) ( not ( = ?auto_21881 ?auto_21882 ) ) ( not ( = ?auto_21881 ?auto_21914 ) ) ( not ( = ?auto_21882 ?auto_21914 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21881 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21908 ) ) ( not ( = ?auto_21883 ?auto_21914 ) ) ( not ( = ?auto_21925 ?auto_21919 ) ) ( not ( = ?auto_21928 ?auto_21902 ) ) ( not ( = ?auto_21908 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21884 ) ) ( not ( = ?auto_21881 ?auto_21910 ) ) ( not ( = ?auto_21882 ?auto_21884 ) ) ( not ( = ?auto_21882 ?auto_21910 ) ) ( not ( = ?auto_21884 ?auto_21908 ) ) ( not ( = ?auto_21884 ?auto_21914 ) ) ( not ( = ?auto_21910 ?auto_21908 ) ) ( not ( = ?auto_21910 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21885 ) ) ( not ( = ?auto_21881 ?auto_21926 ) ) ( not ( = ?auto_21882 ?auto_21885 ) ) ( not ( = ?auto_21882 ?auto_21926 ) ) ( not ( = ?auto_21883 ?auto_21885 ) ) ( not ( = ?auto_21883 ?auto_21926 ) ) ( not ( = ?auto_21885 ?auto_21910 ) ) ( not ( = ?auto_21885 ?auto_21908 ) ) ( not ( = ?auto_21885 ?auto_21914 ) ) ( not ( = ?auto_21917 ?auto_21925 ) ) ( not ( = ?auto_21917 ?auto_21919 ) ) ( not ( = ?auto_21913 ?auto_21928 ) ) ( not ( = ?auto_21913 ?auto_21902 ) ) ( not ( = ?auto_21926 ?auto_21910 ) ) ( not ( = ?auto_21926 ?auto_21908 ) ) ( not ( = ?auto_21926 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21886 ) ) ( not ( = ?auto_21881 ?auto_21901 ) ) ( not ( = ?auto_21882 ?auto_21886 ) ) ( not ( = ?auto_21882 ?auto_21901 ) ) ( not ( = ?auto_21883 ?auto_21886 ) ) ( not ( = ?auto_21883 ?auto_21901 ) ) ( not ( = ?auto_21884 ?auto_21886 ) ) ( not ( = ?auto_21884 ?auto_21901 ) ) ( not ( = ?auto_21886 ?auto_21926 ) ) ( not ( = ?auto_21886 ?auto_21910 ) ) ( not ( = ?auto_21886 ?auto_21908 ) ) ( not ( = ?auto_21886 ?auto_21914 ) ) ( not ( = ?auto_21906 ?auto_21917 ) ) ( not ( = ?auto_21906 ?auto_21925 ) ) ( not ( = ?auto_21906 ?auto_21919 ) ) ( not ( = ?auto_21912 ?auto_21913 ) ) ( not ( = ?auto_21912 ?auto_21928 ) ) ( not ( = ?auto_21912 ?auto_21902 ) ) ( not ( = ?auto_21901 ?auto_21926 ) ) ( not ( = ?auto_21901 ?auto_21910 ) ) ( not ( = ?auto_21901 ?auto_21908 ) ) ( not ( = ?auto_21901 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21887 ) ) ( not ( = ?auto_21881 ?auto_21911 ) ) ( not ( = ?auto_21882 ?auto_21887 ) ) ( not ( = ?auto_21882 ?auto_21911 ) ) ( not ( = ?auto_21883 ?auto_21887 ) ) ( not ( = ?auto_21883 ?auto_21911 ) ) ( not ( = ?auto_21884 ?auto_21887 ) ) ( not ( = ?auto_21884 ?auto_21911 ) ) ( not ( = ?auto_21885 ?auto_21887 ) ) ( not ( = ?auto_21885 ?auto_21911 ) ) ( not ( = ?auto_21887 ?auto_21901 ) ) ( not ( = ?auto_21887 ?auto_21926 ) ) ( not ( = ?auto_21887 ?auto_21910 ) ) ( not ( = ?auto_21887 ?auto_21908 ) ) ( not ( = ?auto_21887 ?auto_21914 ) ) ( not ( = ?auto_21911 ?auto_21901 ) ) ( not ( = ?auto_21911 ?auto_21926 ) ) ( not ( = ?auto_21911 ?auto_21910 ) ) ( not ( = ?auto_21911 ?auto_21908 ) ) ( not ( = ?auto_21911 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21888 ) ) ( not ( = ?auto_21881 ?auto_21904 ) ) ( not ( = ?auto_21882 ?auto_21888 ) ) ( not ( = ?auto_21882 ?auto_21904 ) ) ( not ( = ?auto_21883 ?auto_21888 ) ) ( not ( = ?auto_21883 ?auto_21904 ) ) ( not ( = ?auto_21884 ?auto_21888 ) ) ( not ( = ?auto_21884 ?auto_21904 ) ) ( not ( = ?auto_21885 ?auto_21888 ) ) ( not ( = ?auto_21885 ?auto_21904 ) ) ( not ( = ?auto_21886 ?auto_21888 ) ) ( not ( = ?auto_21886 ?auto_21904 ) ) ( not ( = ?auto_21888 ?auto_21911 ) ) ( not ( = ?auto_21888 ?auto_21901 ) ) ( not ( = ?auto_21888 ?auto_21926 ) ) ( not ( = ?auto_21888 ?auto_21910 ) ) ( not ( = ?auto_21888 ?auto_21908 ) ) ( not ( = ?auto_21888 ?auto_21914 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21906 ) ) ( not ( = ?auto_21915 ?auto_21925 ) ) ( not ( = ?auto_21915 ?auto_21919 ) ) ( not ( = ?auto_21922 ?auto_21913 ) ) ( not ( = ?auto_21922 ?auto_21912 ) ) ( not ( = ?auto_21922 ?auto_21928 ) ) ( not ( = ?auto_21922 ?auto_21902 ) ) ( not ( = ?auto_21904 ?auto_21911 ) ) ( not ( = ?auto_21904 ?auto_21901 ) ) ( not ( = ?auto_21904 ?auto_21926 ) ) ( not ( = ?auto_21904 ?auto_21910 ) ) ( not ( = ?auto_21904 ?auto_21908 ) ) ( not ( = ?auto_21904 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21889 ) ) ( not ( = ?auto_21881 ?auto_21909 ) ) ( not ( = ?auto_21882 ?auto_21889 ) ) ( not ( = ?auto_21882 ?auto_21909 ) ) ( not ( = ?auto_21883 ?auto_21889 ) ) ( not ( = ?auto_21883 ?auto_21909 ) ) ( not ( = ?auto_21884 ?auto_21889 ) ) ( not ( = ?auto_21884 ?auto_21909 ) ) ( not ( = ?auto_21885 ?auto_21889 ) ) ( not ( = ?auto_21885 ?auto_21909 ) ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21886 ?auto_21909 ) ) ( not ( = ?auto_21887 ?auto_21889 ) ) ( not ( = ?auto_21887 ?auto_21909 ) ) ( not ( = ?auto_21889 ?auto_21904 ) ) ( not ( = ?auto_21889 ?auto_21911 ) ) ( not ( = ?auto_21889 ?auto_21901 ) ) ( not ( = ?auto_21889 ?auto_21926 ) ) ( not ( = ?auto_21889 ?auto_21910 ) ) ( not ( = ?auto_21889 ?auto_21908 ) ) ( not ( = ?auto_21889 ?auto_21914 ) ) ( not ( = ?auto_21895 ?auto_21915 ) ) ( not ( = ?auto_21895 ?auto_21917 ) ) ( not ( = ?auto_21895 ?auto_21906 ) ) ( not ( = ?auto_21895 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21919 ) ) ( not ( = ?auto_21897 ?auto_21922 ) ) ( not ( = ?auto_21897 ?auto_21913 ) ) ( not ( = ?auto_21897 ?auto_21912 ) ) ( not ( = ?auto_21897 ?auto_21928 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21909 ?auto_21904 ) ) ( not ( = ?auto_21909 ?auto_21911 ) ) ( not ( = ?auto_21909 ?auto_21901 ) ) ( not ( = ?auto_21909 ?auto_21926 ) ) ( not ( = ?auto_21909 ?auto_21910 ) ) ( not ( = ?auto_21909 ?auto_21908 ) ) ( not ( = ?auto_21909 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21890 ) ) ( not ( = ?auto_21881 ?auto_21916 ) ) ( not ( = ?auto_21882 ?auto_21890 ) ) ( not ( = ?auto_21882 ?auto_21916 ) ) ( not ( = ?auto_21883 ?auto_21890 ) ) ( not ( = ?auto_21883 ?auto_21916 ) ) ( not ( = ?auto_21884 ?auto_21890 ) ) ( not ( = ?auto_21884 ?auto_21916 ) ) ( not ( = ?auto_21885 ?auto_21890 ) ) ( not ( = ?auto_21885 ?auto_21916 ) ) ( not ( = ?auto_21886 ?auto_21890 ) ) ( not ( = ?auto_21886 ?auto_21916 ) ) ( not ( = ?auto_21887 ?auto_21890 ) ) ( not ( = ?auto_21887 ?auto_21916 ) ) ( not ( = ?auto_21888 ?auto_21890 ) ) ( not ( = ?auto_21888 ?auto_21916 ) ) ( not ( = ?auto_21890 ?auto_21909 ) ) ( not ( = ?auto_21890 ?auto_21904 ) ) ( not ( = ?auto_21890 ?auto_21911 ) ) ( not ( = ?auto_21890 ?auto_21901 ) ) ( not ( = ?auto_21890 ?auto_21926 ) ) ( not ( = ?auto_21890 ?auto_21910 ) ) ( not ( = ?auto_21890 ?auto_21908 ) ) ( not ( = ?auto_21890 ?auto_21914 ) ) ( not ( = ?auto_21921 ?auto_21895 ) ) ( not ( = ?auto_21921 ?auto_21915 ) ) ( not ( = ?auto_21921 ?auto_21917 ) ) ( not ( = ?auto_21921 ?auto_21906 ) ) ( not ( = ?auto_21921 ?auto_21925 ) ) ( not ( = ?auto_21921 ?auto_21919 ) ) ( not ( = ?auto_21924 ?auto_21897 ) ) ( not ( = ?auto_21924 ?auto_21922 ) ) ( not ( = ?auto_21924 ?auto_21913 ) ) ( not ( = ?auto_21924 ?auto_21912 ) ) ( not ( = ?auto_21924 ?auto_21928 ) ) ( not ( = ?auto_21924 ?auto_21902 ) ) ( not ( = ?auto_21916 ?auto_21909 ) ) ( not ( = ?auto_21916 ?auto_21904 ) ) ( not ( = ?auto_21916 ?auto_21911 ) ) ( not ( = ?auto_21916 ?auto_21901 ) ) ( not ( = ?auto_21916 ?auto_21926 ) ) ( not ( = ?auto_21916 ?auto_21910 ) ) ( not ( = ?auto_21916 ?auto_21908 ) ) ( not ( = ?auto_21916 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21891 ) ) ( not ( = ?auto_21881 ?auto_21903 ) ) ( not ( = ?auto_21882 ?auto_21891 ) ) ( not ( = ?auto_21882 ?auto_21903 ) ) ( not ( = ?auto_21883 ?auto_21891 ) ) ( not ( = ?auto_21883 ?auto_21903 ) ) ( not ( = ?auto_21884 ?auto_21891 ) ) ( not ( = ?auto_21884 ?auto_21903 ) ) ( not ( = ?auto_21885 ?auto_21891 ) ) ( not ( = ?auto_21885 ?auto_21903 ) ) ( not ( = ?auto_21886 ?auto_21891 ) ) ( not ( = ?auto_21886 ?auto_21903 ) ) ( not ( = ?auto_21887 ?auto_21891 ) ) ( not ( = ?auto_21887 ?auto_21903 ) ) ( not ( = ?auto_21888 ?auto_21891 ) ) ( not ( = ?auto_21888 ?auto_21903 ) ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( not ( = ?auto_21889 ?auto_21903 ) ) ( not ( = ?auto_21891 ?auto_21916 ) ) ( not ( = ?auto_21891 ?auto_21909 ) ) ( not ( = ?auto_21891 ?auto_21904 ) ) ( not ( = ?auto_21891 ?auto_21911 ) ) ( not ( = ?auto_21891 ?auto_21901 ) ) ( not ( = ?auto_21891 ?auto_21926 ) ) ( not ( = ?auto_21891 ?auto_21910 ) ) ( not ( = ?auto_21891 ?auto_21908 ) ) ( not ( = ?auto_21891 ?auto_21914 ) ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21895 ) ) ( not ( = ?auto_21918 ?auto_21915 ) ) ( not ( = ?auto_21918 ?auto_21917 ) ) ( not ( = ?auto_21918 ?auto_21906 ) ) ( not ( = ?auto_21918 ?auto_21925 ) ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( not ( = ?auto_21920 ?auto_21924 ) ) ( not ( = ?auto_21920 ?auto_21897 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21913 ) ) ( not ( = ?auto_21920 ?auto_21912 ) ) ( not ( = ?auto_21920 ?auto_21928 ) ) ( not ( = ?auto_21920 ?auto_21902 ) ) ( not ( = ?auto_21903 ?auto_21916 ) ) ( not ( = ?auto_21903 ?auto_21909 ) ) ( not ( = ?auto_21903 ?auto_21904 ) ) ( not ( = ?auto_21903 ?auto_21911 ) ) ( not ( = ?auto_21903 ?auto_21901 ) ) ( not ( = ?auto_21903 ?auto_21926 ) ) ( not ( = ?auto_21903 ?auto_21910 ) ) ( not ( = ?auto_21903 ?auto_21908 ) ) ( not ( = ?auto_21903 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21892 ) ) ( not ( = ?auto_21881 ?auto_21907 ) ) ( not ( = ?auto_21882 ?auto_21892 ) ) ( not ( = ?auto_21882 ?auto_21907 ) ) ( not ( = ?auto_21883 ?auto_21892 ) ) ( not ( = ?auto_21883 ?auto_21907 ) ) ( not ( = ?auto_21884 ?auto_21892 ) ) ( not ( = ?auto_21884 ?auto_21907 ) ) ( not ( = ?auto_21885 ?auto_21892 ) ) ( not ( = ?auto_21885 ?auto_21907 ) ) ( not ( = ?auto_21886 ?auto_21892 ) ) ( not ( = ?auto_21886 ?auto_21907 ) ) ( not ( = ?auto_21887 ?auto_21892 ) ) ( not ( = ?auto_21887 ?auto_21907 ) ) ( not ( = ?auto_21888 ?auto_21892 ) ) ( not ( = ?auto_21888 ?auto_21907 ) ) ( not ( = ?auto_21889 ?auto_21892 ) ) ( not ( = ?auto_21889 ?auto_21907 ) ) ( not ( = ?auto_21890 ?auto_21892 ) ) ( not ( = ?auto_21890 ?auto_21907 ) ) ( not ( = ?auto_21892 ?auto_21903 ) ) ( not ( = ?auto_21892 ?auto_21916 ) ) ( not ( = ?auto_21892 ?auto_21909 ) ) ( not ( = ?auto_21892 ?auto_21904 ) ) ( not ( = ?auto_21892 ?auto_21911 ) ) ( not ( = ?auto_21892 ?auto_21901 ) ) ( not ( = ?auto_21892 ?auto_21926 ) ) ( not ( = ?auto_21892 ?auto_21910 ) ) ( not ( = ?auto_21892 ?auto_21908 ) ) ( not ( = ?auto_21892 ?auto_21914 ) ) ( not ( = ?auto_21923 ?auto_21918 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( not ( = ?auto_21923 ?auto_21895 ) ) ( not ( = ?auto_21923 ?auto_21915 ) ) ( not ( = ?auto_21923 ?auto_21917 ) ) ( not ( = ?auto_21923 ?auto_21906 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21919 ) ) ( not ( = ?auto_21927 ?auto_21920 ) ) ( not ( = ?auto_21927 ?auto_21924 ) ) ( not ( = ?auto_21927 ?auto_21897 ) ) ( not ( = ?auto_21927 ?auto_21922 ) ) ( not ( = ?auto_21927 ?auto_21913 ) ) ( not ( = ?auto_21927 ?auto_21912 ) ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21902 ) ) ( not ( = ?auto_21907 ?auto_21903 ) ) ( not ( = ?auto_21907 ?auto_21916 ) ) ( not ( = ?auto_21907 ?auto_21909 ) ) ( not ( = ?auto_21907 ?auto_21904 ) ) ( not ( = ?auto_21907 ?auto_21911 ) ) ( not ( = ?auto_21907 ?auto_21901 ) ) ( not ( = ?auto_21907 ?auto_21926 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21893 ) ) ( not ( = ?auto_21881 ?auto_21905 ) ) ( not ( = ?auto_21882 ?auto_21893 ) ) ( not ( = ?auto_21882 ?auto_21905 ) ) ( not ( = ?auto_21883 ?auto_21893 ) ) ( not ( = ?auto_21883 ?auto_21905 ) ) ( not ( = ?auto_21884 ?auto_21893 ) ) ( not ( = ?auto_21884 ?auto_21905 ) ) ( not ( = ?auto_21885 ?auto_21893 ) ) ( not ( = ?auto_21885 ?auto_21905 ) ) ( not ( = ?auto_21886 ?auto_21893 ) ) ( not ( = ?auto_21886 ?auto_21905 ) ) ( not ( = ?auto_21887 ?auto_21893 ) ) ( not ( = ?auto_21887 ?auto_21905 ) ) ( not ( = ?auto_21888 ?auto_21893 ) ) ( not ( = ?auto_21888 ?auto_21905 ) ) ( not ( = ?auto_21889 ?auto_21893 ) ) ( not ( = ?auto_21889 ?auto_21905 ) ) ( not ( = ?auto_21890 ?auto_21893 ) ) ( not ( = ?auto_21890 ?auto_21905 ) ) ( not ( = ?auto_21891 ?auto_21893 ) ) ( not ( = ?auto_21891 ?auto_21905 ) ) ( not ( = ?auto_21893 ?auto_21907 ) ) ( not ( = ?auto_21893 ?auto_21903 ) ) ( not ( = ?auto_21893 ?auto_21916 ) ) ( not ( = ?auto_21893 ?auto_21909 ) ) ( not ( = ?auto_21893 ?auto_21904 ) ) ( not ( = ?auto_21893 ?auto_21911 ) ) ( not ( = ?auto_21893 ?auto_21901 ) ) ( not ( = ?auto_21893 ?auto_21926 ) ) ( not ( = ?auto_21893 ?auto_21910 ) ) ( not ( = ?auto_21893 ?auto_21908 ) ) ( not ( = ?auto_21893 ?auto_21914 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21903 ) ) ( not ( = ?auto_21905 ?auto_21916 ) ) ( not ( = ?auto_21905 ?auto_21909 ) ) ( not ( = ?auto_21905 ?auto_21904 ) ) ( not ( = ?auto_21905 ?auto_21911 ) ) ( not ( = ?auto_21905 ?auto_21901 ) ) ( not ( = ?auto_21905 ?auto_21926 ) ) ( not ( = ?auto_21905 ?auto_21910 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( not ( = ?auto_21905 ?auto_21914 ) ) ( not ( = ?auto_21881 ?auto_21894 ) ) ( not ( = ?auto_21881 ?auto_21896 ) ) ( not ( = ?auto_21882 ?auto_21894 ) ) ( not ( = ?auto_21882 ?auto_21896 ) ) ( not ( = ?auto_21883 ?auto_21894 ) ) ( not ( = ?auto_21883 ?auto_21896 ) ) ( not ( = ?auto_21884 ?auto_21894 ) ) ( not ( = ?auto_21884 ?auto_21896 ) ) ( not ( = ?auto_21885 ?auto_21894 ) ) ( not ( = ?auto_21885 ?auto_21896 ) ) ( not ( = ?auto_21886 ?auto_21894 ) ) ( not ( = ?auto_21886 ?auto_21896 ) ) ( not ( = ?auto_21887 ?auto_21894 ) ) ( not ( = ?auto_21887 ?auto_21896 ) ) ( not ( = ?auto_21888 ?auto_21894 ) ) ( not ( = ?auto_21888 ?auto_21896 ) ) ( not ( = ?auto_21889 ?auto_21894 ) ) ( not ( = ?auto_21889 ?auto_21896 ) ) ( not ( = ?auto_21890 ?auto_21894 ) ) ( not ( = ?auto_21890 ?auto_21896 ) ) ( not ( = ?auto_21891 ?auto_21894 ) ) ( not ( = ?auto_21891 ?auto_21896 ) ) ( not ( = ?auto_21892 ?auto_21894 ) ) ( not ( = ?auto_21892 ?auto_21896 ) ) ( not ( = ?auto_21894 ?auto_21905 ) ) ( not ( = ?auto_21894 ?auto_21907 ) ) ( not ( = ?auto_21894 ?auto_21903 ) ) ( not ( = ?auto_21894 ?auto_21916 ) ) ( not ( = ?auto_21894 ?auto_21909 ) ) ( not ( = ?auto_21894 ?auto_21904 ) ) ( not ( = ?auto_21894 ?auto_21911 ) ) ( not ( = ?auto_21894 ?auto_21901 ) ) ( not ( = ?auto_21894 ?auto_21926 ) ) ( not ( = ?auto_21894 ?auto_21910 ) ) ( not ( = ?auto_21894 ?auto_21908 ) ) ( not ( = ?auto_21894 ?auto_21914 ) ) ( not ( = ?auto_21896 ?auto_21905 ) ) ( not ( = ?auto_21896 ?auto_21907 ) ) ( not ( = ?auto_21896 ?auto_21903 ) ) ( not ( = ?auto_21896 ?auto_21916 ) ) ( not ( = ?auto_21896 ?auto_21909 ) ) ( not ( = ?auto_21896 ?auto_21904 ) ) ( not ( = ?auto_21896 ?auto_21911 ) ) ( not ( = ?auto_21896 ?auto_21901 ) ) ( not ( = ?auto_21896 ?auto_21926 ) ) ( not ( = ?auto_21896 ?auto_21910 ) ) ( not ( = ?auto_21896 ?auto_21908 ) ) ( not ( = ?auto_21896 ?auto_21914 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21881 ?auto_21882 ?auto_21883 ?auto_21884 ?auto_21885 ?auto_21886 ?auto_21887 ?auto_21888 ?auto_21889 ?auto_21890 ?auto_21891 ?auto_21892 ?auto_21893 )
      ( MAKE-1CRATE ?auto_21893 ?auto_21894 )
      ( MAKE-13CRATE-VERIFY ?auto_21881 ?auto_21882 ?auto_21883 ?auto_21884 ?auto_21885 ?auto_21886 ?auto_21887 ?auto_21888 ?auto_21889 ?auto_21890 ?auto_21891 ?auto_21892 ?auto_21893 ?auto_21894 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21954 - SURFACE
      ?auto_21955 - SURFACE
      ?auto_21956 - SURFACE
      ?auto_21957 - SURFACE
      ?auto_21958 - SURFACE
      ?auto_21959 - SURFACE
      ?auto_21960 - SURFACE
      ?auto_21961 - SURFACE
      ?auto_21962 - SURFACE
      ?auto_21963 - SURFACE
      ?auto_21964 - SURFACE
      ?auto_21965 - SURFACE
      ?auto_21966 - SURFACE
      ?auto_21967 - SURFACE
      ?auto_21968 - SURFACE
    )
    :vars
    (
      ?auto_21973 - HOIST
      ?auto_21972 - PLACE
      ?auto_21974 - PLACE
      ?auto_21969 - HOIST
      ?auto_21970 - SURFACE
      ?auto_21993 - PLACE
      ?auto_21976 - HOIST
      ?auto_21991 - SURFACE
      ?auto_21988 - SURFACE
      ?auto_21994 - PLACE
      ?auto_21985 - HOIST
      ?auto_22004 - SURFACE
      ?auto_21981 - PLACE
      ?auto_21982 - HOIST
      ?auto_21990 - SURFACE
      ?auto_21978 - PLACE
      ?auto_21983 - HOIST
      ?auto_21996 - SURFACE
      ?auto_22001 - SURFACE
      ?auto_21975 - PLACE
      ?auto_22002 - HOIST
      ?auto_21987 - SURFACE
      ?auto_21998 - PLACE
      ?auto_22003 - HOIST
      ?auto_21980 - SURFACE
      ?auto_21992 - PLACE
      ?auto_21977 - HOIST
      ?auto_21989 - SURFACE
      ?auto_22000 - SURFACE
      ?auto_21997 - PLACE
      ?auto_21995 - HOIST
      ?auto_21984 - SURFACE
      ?auto_22005 - SURFACE
      ?auto_21999 - PLACE
      ?auto_21986 - HOIST
      ?auto_21979 - SURFACE
      ?auto_21971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21973 ?auto_21972 ) ( IS-CRATE ?auto_21968 ) ( not ( = ?auto_21974 ?auto_21972 ) ) ( HOIST-AT ?auto_21969 ?auto_21974 ) ( AVAILABLE ?auto_21969 ) ( SURFACE-AT ?auto_21968 ?auto_21974 ) ( ON ?auto_21968 ?auto_21970 ) ( CLEAR ?auto_21968 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) ( not ( = ?auto_21973 ?auto_21969 ) ) ( IS-CRATE ?auto_21967 ) ( not ( = ?auto_21993 ?auto_21972 ) ) ( HOIST-AT ?auto_21976 ?auto_21993 ) ( SURFACE-AT ?auto_21967 ?auto_21993 ) ( ON ?auto_21967 ?auto_21991 ) ( CLEAR ?auto_21967 ) ( not ( = ?auto_21966 ?auto_21967 ) ) ( not ( = ?auto_21966 ?auto_21991 ) ) ( not ( = ?auto_21967 ?auto_21991 ) ) ( not ( = ?auto_21973 ?auto_21976 ) ) ( IS-CRATE ?auto_21966 ) ( SURFACE-AT ?auto_21966 ?auto_21993 ) ( ON ?auto_21966 ?auto_21988 ) ( CLEAR ?auto_21966 ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_21988 ) ) ( not ( = ?auto_21966 ?auto_21988 ) ) ( IS-CRATE ?auto_21965 ) ( not ( = ?auto_21994 ?auto_21972 ) ) ( HOIST-AT ?auto_21985 ?auto_21994 ) ( AVAILABLE ?auto_21985 ) ( SURFACE-AT ?auto_21965 ?auto_21994 ) ( ON ?auto_21965 ?auto_22004 ) ( CLEAR ?auto_21965 ) ( not ( = ?auto_21964 ?auto_21965 ) ) ( not ( = ?auto_21964 ?auto_22004 ) ) ( not ( = ?auto_21965 ?auto_22004 ) ) ( not ( = ?auto_21973 ?auto_21985 ) ) ( IS-CRATE ?auto_21964 ) ( not ( = ?auto_21981 ?auto_21972 ) ) ( HOIST-AT ?auto_21982 ?auto_21981 ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21964 ?auto_21981 ) ( ON ?auto_21964 ?auto_21990 ) ( CLEAR ?auto_21964 ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( not ( = ?auto_21963 ?auto_21990 ) ) ( not ( = ?auto_21964 ?auto_21990 ) ) ( not ( = ?auto_21973 ?auto_21982 ) ) ( IS-CRATE ?auto_21963 ) ( not ( = ?auto_21978 ?auto_21972 ) ) ( HOIST-AT ?auto_21983 ?auto_21978 ) ( AVAILABLE ?auto_21983 ) ( SURFACE-AT ?auto_21963 ?auto_21978 ) ( ON ?auto_21963 ?auto_21996 ) ( CLEAR ?auto_21963 ) ( not ( = ?auto_21962 ?auto_21963 ) ) ( not ( = ?auto_21962 ?auto_21996 ) ) ( not ( = ?auto_21963 ?auto_21996 ) ) ( not ( = ?auto_21973 ?auto_21983 ) ) ( IS-CRATE ?auto_21962 ) ( AVAILABLE ?auto_21976 ) ( SURFACE-AT ?auto_21962 ?auto_21993 ) ( ON ?auto_21962 ?auto_22001 ) ( CLEAR ?auto_21962 ) ( not ( = ?auto_21961 ?auto_21962 ) ) ( not ( = ?auto_21961 ?auto_22001 ) ) ( not ( = ?auto_21962 ?auto_22001 ) ) ( IS-CRATE ?auto_21961 ) ( not ( = ?auto_21975 ?auto_21972 ) ) ( HOIST-AT ?auto_22002 ?auto_21975 ) ( AVAILABLE ?auto_22002 ) ( SURFACE-AT ?auto_21961 ?auto_21975 ) ( ON ?auto_21961 ?auto_21987 ) ( CLEAR ?auto_21961 ) ( not ( = ?auto_21960 ?auto_21961 ) ) ( not ( = ?auto_21960 ?auto_21987 ) ) ( not ( = ?auto_21961 ?auto_21987 ) ) ( not ( = ?auto_21973 ?auto_22002 ) ) ( IS-CRATE ?auto_21960 ) ( not ( = ?auto_21998 ?auto_21972 ) ) ( HOIST-AT ?auto_22003 ?auto_21998 ) ( SURFACE-AT ?auto_21960 ?auto_21998 ) ( ON ?auto_21960 ?auto_21980 ) ( CLEAR ?auto_21960 ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( not ( = ?auto_21959 ?auto_21980 ) ) ( not ( = ?auto_21960 ?auto_21980 ) ) ( not ( = ?auto_21973 ?auto_22003 ) ) ( IS-CRATE ?auto_21959 ) ( not ( = ?auto_21992 ?auto_21972 ) ) ( HOIST-AT ?auto_21977 ?auto_21992 ) ( AVAILABLE ?auto_21977 ) ( SURFACE-AT ?auto_21959 ?auto_21992 ) ( ON ?auto_21959 ?auto_21989 ) ( CLEAR ?auto_21959 ) ( not ( = ?auto_21958 ?auto_21959 ) ) ( not ( = ?auto_21958 ?auto_21989 ) ) ( not ( = ?auto_21959 ?auto_21989 ) ) ( not ( = ?auto_21973 ?auto_21977 ) ) ( IS-CRATE ?auto_21958 ) ( AVAILABLE ?auto_22003 ) ( SURFACE-AT ?auto_21958 ?auto_21998 ) ( ON ?auto_21958 ?auto_22000 ) ( CLEAR ?auto_21958 ) ( not ( = ?auto_21957 ?auto_21958 ) ) ( not ( = ?auto_21957 ?auto_22000 ) ) ( not ( = ?auto_21958 ?auto_22000 ) ) ( IS-CRATE ?auto_21957 ) ( not ( = ?auto_21997 ?auto_21972 ) ) ( HOIST-AT ?auto_21995 ?auto_21997 ) ( SURFACE-AT ?auto_21957 ?auto_21997 ) ( ON ?auto_21957 ?auto_21984 ) ( CLEAR ?auto_21957 ) ( not ( = ?auto_21956 ?auto_21957 ) ) ( not ( = ?auto_21956 ?auto_21984 ) ) ( not ( = ?auto_21957 ?auto_21984 ) ) ( not ( = ?auto_21973 ?auto_21995 ) ) ( IS-CRATE ?auto_21956 ) ( AVAILABLE ?auto_21995 ) ( SURFACE-AT ?auto_21956 ?auto_21997 ) ( ON ?auto_21956 ?auto_22005 ) ( CLEAR ?auto_21956 ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( not ( = ?auto_21955 ?auto_22005 ) ) ( not ( = ?auto_21956 ?auto_22005 ) ) ( SURFACE-AT ?auto_21954 ?auto_21972 ) ( CLEAR ?auto_21954 ) ( IS-CRATE ?auto_21955 ) ( AVAILABLE ?auto_21973 ) ( not ( = ?auto_21999 ?auto_21972 ) ) ( HOIST-AT ?auto_21986 ?auto_21999 ) ( AVAILABLE ?auto_21986 ) ( SURFACE-AT ?auto_21955 ?auto_21999 ) ( ON ?auto_21955 ?auto_21979 ) ( CLEAR ?auto_21955 ) ( TRUCK-AT ?auto_21971 ?auto_21972 ) ( not ( = ?auto_21954 ?auto_21955 ) ) ( not ( = ?auto_21954 ?auto_21979 ) ) ( not ( = ?auto_21955 ?auto_21979 ) ) ( not ( = ?auto_21973 ?auto_21986 ) ) ( not ( = ?auto_21954 ?auto_21956 ) ) ( not ( = ?auto_21954 ?auto_22005 ) ) ( not ( = ?auto_21956 ?auto_21979 ) ) ( not ( = ?auto_21997 ?auto_21999 ) ) ( not ( = ?auto_21995 ?auto_21986 ) ) ( not ( = ?auto_22005 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21957 ) ) ( not ( = ?auto_21954 ?auto_21984 ) ) ( not ( = ?auto_21955 ?auto_21957 ) ) ( not ( = ?auto_21955 ?auto_21984 ) ) ( not ( = ?auto_21957 ?auto_22005 ) ) ( not ( = ?auto_21957 ?auto_21979 ) ) ( not ( = ?auto_21984 ?auto_22005 ) ) ( not ( = ?auto_21984 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21958 ) ) ( not ( = ?auto_21954 ?auto_22000 ) ) ( not ( = ?auto_21955 ?auto_21958 ) ) ( not ( = ?auto_21955 ?auto_22000 ) ) ( not ( = ?auto_21956 ?auto_21958 ) ) ( not ( = ?auto_21956 ?auto_22000 ) ) ( not ( = ?auto_21958 ?auto_21984 ) ) ( not ( = ?auto_21958 ?auto_22005 ) ) ( not ( = ?auto_21958 ?auto_21979 ) ) ( not ( = ?auto_21998 ?auto_21997 ) ) ( not ( = ?auto_21998 ?auto_21999 ) ) ( not ( = ?auto_22003 ?auto_21995 ) ) ( not ( = ?auto_22003 ?auto_21986 ) ) ( not ( = ?auto_22000 ?auto_21984 ) ) ( not ( = ?auto_22000 ?auto_22005 ) ) ( not ( = ?auto_22000 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21959 ) ) ( not ( = ?auto_21954 ?auto_21989 ) ) ( not ( = ?auto_21955 ?auto_21959 ) ) ( not ( = ?auto_21955 ?auto_21989 ) ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21956 ?auto_21989 ) ) ( not ( = ?auto_21957 ?auto_21959 ) ) ( not ( = ?auto_21957 ?auto_21989 ) ) ( not ( = ?auto_21959 ?auto_22000 ) ) ( not ( = ?auto_21959 ?auto_21984 ) ) ( not ( = ?auto_21959 ?auto_22005 ) ) ( not ( = ?auto_21959 ?auto_21979 ) ) ( not ( = ?auto_21992 ?auto_21998 ) ) ( not ( = ?auto_21992 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_21999 ) ) ( not ( = ?auto_21977 ?auto_22003 ) ) ( not ( = ?auto_21977 ?auto_21995 ) ) ( not ( = ?auto_21977 ?auto_21986 ) ) ( not ( = ?auto_21989 ?auto_22000 ) ) ( not ( = ?auto_21989 ?auto_21984 ) ) ( not ( = ?auto_21989 ?auto_22005 ) ) ( not ( = ?auto_21989 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21960 ) ) ( not ( = ?auto_21954 ?auto_21980 ) ) ( not ( = ?auto_21955 ?auto_21960 ) ) ( not ( = ?auto_21955 ?auto_21980 ) ) ( not ( = ?auto_21956 ?auto_21960 ) ) ( not ( = ?auto_21956 ?auto_21980 ) ) ( not ( = ?auto_21957 ?auto_21960 ) ) ( not ( = ?auto_21957 ?auto_21980 ) ) ( not ( = ?auto_21958 ?auto_21960 ) ) ( not ( = ?auto_21958 ?auto_21980 ) ) ( not ( = ?auto_21960 ?auto_21989 ) ) ( not ( = ?auto_21960 ?auto_22000 ) ) ( not ( = ?auto_21960 ?auto_21984 ) ) ( not ( = ?auto_21960 ?auto_22005 ) ) ( not ( = ?auto_21960 ?auto_21979 ) ) ( not ( = ?auto_21980 ?auto_21989 ) ) ( not ( = ?auto_21980 ?auto_22000 ) ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21980 ?auto_22005 ) ) ( not ( = ?auto_21980 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21961 ) ) ( not ( = ?auto_21954 ?auto_21987 ) ) ( not ( = ?auto_21955 ?auto_21961 ) ) ( not ( = ?auto_21955 ?auto_21987 ) ) ( not ( = ?auto_21956 ?auto_21961 ) ) ( not ( = ?auto_21956 ?auto_21987 ) ) ( not ( = ?auto_21957 ?auto_21961 ) ) ( not ( = ?auto_21957 ?auto_21987 ) ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21987 ) ) ( not ( = ?auto_21959 ?auto_21961 ) ) ( not ( = ?auto_21959 ?auto_21987 ) ) ( not ( = ?auto_21961 ?auto_21980 ) ) ( not ( = ?auto_21961 ?auto_21989 ) ) ( not ( = ?auto_21961 ?auto_22000 ) ) ( not ( = ?auto_21961 ?auto_21984 ) ) ( not ( = ?auto_21961 ?auto_22005 ) ) ( not ( = ?auto_21961 ?auto_21979 ) ) ( not ( = ?auto_21975 ?auto_21998 ) ) ( not ( = ?auto_21975 ?auto_21992 ) ) ( not ( = ?auto_21975 ?auto_21997 ) ) ( not ( = ?auto_21975 ?auto_21999 ) ) ( not ( = ?auto_22002 ?auto_22003 ) ) ( not ( = ?auto_22002 ?auto_21977 ) ) ( not ( = ?auto_22002 ?auto_21995 ) ) ( not ( = ?auto_22002 ?auto_21986 ) ) ( not ( = ?auto_21987 ?auto_21980 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_22000 ) ) ( not ( = ?auto_21987 ?auto_21984 ) ) ( not ( = ?auto_21987 ?auto_22005 ) ) ( not ( = ?auto_21987 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21962 ) ) ( not ( = ?auto_21954 ?auto_22001 ) ) ( not ( = ?auto_21955 ?auto_21962 ) ) ( not ( = ?auto_21955 ?auto_22001 ) ) ( not ( = ?auto_21956 ?auto_21962 ) ) ( not ( = ?auto_21956 ?auto_22001 ) ) ( not ( = ?auto_21957 ?auto_21962 ) ) ( not ( = ?auto_21957 ?auto_22001 ) ) ( not ( = ?auto_21958 ?auto_21962 ) ) ( not ( = ?auto_21958 ?auto_22001 ) ) ( not ( = ?auto_21959 ?auto_21962 ) ) ( not ( = ?auto_21959 ?auto_22001 ) ) ( not ( = ?auto_21960 ?auto_21962 ) ) ( not ( = ?auto_21960 ?auto_22001 ) ) ( not ( = ?auto_21962 ?auto_21987 ) ) ( not ( = ?auto_21962 ?auto_21980 ) ) ( not ( = ?auto_21962 ?auto_21989 ) ) ( not ( = ?auto_21962 ?auto_22000 ) ) ( not ( = ?auto_21962 ?auto_21984 ) ) ( not ( = ?auto_21962 ?auto_22005 ) ) ( not ( = ?auto_21962 ?auto_21979 ) ) ( not ( = ?auto_21993 ?auto_21975 ) ) ( not ( = ?auto_21993 ?auto_21998 ) ) ( not ( = ?auto_21993 ?auto_21992 ) ) ( not ( = ?auto_21993 ?auto_21997 ) ) ( not ( = ?auto_21993 ?auto_21999 ) ) ( not ( = ?auto_21976 ?auto_22002 ) ) ( not ( = ?auto_21976 ?auto_22003 ) ) ( not ( = ?auto_21976 ?auto_21977 ) ) ( not ( = ?auto_21976 ?auto_21995 ) ) ( not ( = ?auto_21976 ?auto_21986 ) ) ( not ( = ?auto_22001 ?auto_21987 ) ) ( not ( = ?auto_22001 ?auto_21980 ) ) ( not ( = ?auto_22001 ?auto_21989 ) ) ( not ( = ?auto_22001 ?auto_22000 ) ) ( not ( = ?auto_22001 ?auto_21984 ) ) ( not ( = ?auto_22001 ?auto_22005 ) ) ( not ( = ?auto_22001 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21963 ) ) ( not ( = ?auto_21954 ?auto_21996 ) ) ( not ( = ?auto_21955 ?auto_21963 ) ) ( not ( = ?auto_21955 ?auto_21996 ) ) ( not ( = ?auto_21956 ?auto_21963 ) ) ( not ( = ?auto_21956 ?auto_21996 ) ) ( not ( = ?auto_21957 ?auto_21963 ) ) ( not ( = ?auto_21957 ?auto_21996 ) ) ( not ( = ?auto_21958 ?auto_21963 ) ) ( not ( = ?auto_21958 ?auto_21996 ) ) ( not ( = ?auto_21959 ?auto_21963 ) ) ( not ( = ?auto_21959 ?auto_21996 ) ) ( not ( = ?auto_21960 ?auto_21963 ) ) ( not ( = ?auto_21960 ?auto_21996 ) ) ( not ( = ?auto_21961 ?auto_21963 ) ) ( not ( = ?auto_21961 ?auto_21996 ) ) ( not ( = ?auto_21963 ?auto_22001 ) ) ( not ( = ?auto_21963 ?auto_21987 ) ) ( not ( = ?auto_21963 ?auto_21980 ) ) ( not ( = ?auto_21963 ?auto_21989 ) ) ( not ( = ?auto_21963 ?auto_22000 ) ) ( not ( = ?auto_21963 ?auto_21984 ) ) ( not ( = ?auto_21963 ?auto_22005 ) ) ( not ( = ?auto_21963 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21993 ) ) ( not ( = ?auto_21978 ?auto_21975 ) ) ( not ( = ?auto_21978 ?auto_21998 ) ) ( not ( = ?auto_21978 ?auto_21992 ) ) ( not ( = ?auto_21978 ?auto_21997 ) ) ( not ( = ?auto_21978 ?auto_21999 ) ) ( not ( = ?auto_21983 ?auto_21976 ) ) ( not ( = ?auto_21983 ?auto_22002 ) ) ( not ( = ?auto_21983 ?auto_22003 ) ) ( not ( = ?auto_21983 ?auto_21977 ) ) ( not ( = ?auto_21983 ?auto_21995 ) ) ( not ( = ?auto_21983 ?auto_21986 ) ) ( not ( = ?auto_21996 ?auto_22001 ) ) ( not ( = ?auto_21996 ?auto_21987 ) ) ( not ( = ?auto_21996 ?auto_21980 ) ) ( not ( = ?auto_21996 ?auto_21989 ) ) ( not ( = ?auto_21996 ?auto_22000 ) ) ( not ( = ?auto_21996 ?auto_21984 ) ) ( not ( = ?auto_21996 ?auto_22005 ) ) ( not ( = ?auto_21996 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21964 ) ) ( not ( = ?auto_21954 ?auto_21990 ) ) ( not ( = ?auto_21955 ?auto_21964 ) ) ( not ( = ?auto_21955 ?auto_21990 ) ) ( not ( = ?auto_21956 ?auto_21964 ) ) ( not ( = ?auto_21956 ?auto_21990 ) ) ( not ( = ?auto_21957 ?auto_21964 ) ) ( not ( = ?auto_21957 ?auto_21990 ) ) ( not ( = ?auto_21958 ?auto_21964 ) ) ( not ( = ?auto_21958 ?auto_21990 ) ) ( not ( = ?auto_21959 ?auto_21964 ) ) ( not ( = ?auto_21959 ?auto_21990 ) ) ( not ( = ?auto_21960 ?auto_21964 ) ) ( not ( = ?auto_21960 ?auto_21990 ) ) ( not ( = ?auto_21961 ?auto_21964 ) ) ( not ( = ?auto_21961 ?auto_21990 ) ) ( not ( = ?auto_21962 ?auto_21964 ) ) ( not ( = ?auto_21962 ?auto_21990 ) ) ( not ( = ?auto_21964 ?auto_21996 ) ) ( not ( = ?auto_21964 ?auto_22001 ) ) ( not ( = ?auto_21964 ?auto_21987 ) ) ( not ( = ?auto_21964 ?auto_21980 ) ) ( not ( = ?auto_21964 ?auto_21989 ) ) ( not ( = ?auto_21964 ?auto_22000 ) ) ( not ( = ?auto_21964 ?auto_21984 ) ) ( not ( = ?auto_21964 ?auto_22005 ) ) ( not ( = ?auto_21964 ?auto_21979 ) ) ( not ( = ?auto_21981 ?auto_21978 ) ) ( not ( = ?auto_21981 ?auto_21993 ) ) ( not ( = ?auto_21981 ?auto_21975 ) ) ( not ( = ?auto_21981 ?auto_21998 ) ) ( not ( = ?auto_21981 ?auto_21992 ) ) ( not ( = ?auto_21981 ?auto_21997 ) ) ( not ( = ?auto_21981 ?auto_21999 ) ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21976 ) ) ( not ( = ?auto_21982 ?auto_22002 ) ) ( not ( = ?auto_21982 ?auto_22003 ) ) ( not ( = ?auto_21982 ?auto_21977 ) ) ( not ( = ?auto_21982 ?auto_21995 ) ) ( not ( = ?auto_21982 ?auto_21986 ) ) ( not ( = ?auto_21990 ?auto_21996 ) ) ( not ( = ?auto_21990 ?auto_22001 ) ) ( not ( = ?auto_21990 ?auto_21987 ) ) ( not ( = ?auto_21990 ?auto_21980 ) ) ( not ( = ?auto_21990 ?auto_21989 ) ) ( not ( = ?auto_21990 ?auto_22000 ) ) ( not ( = ?auto_21990 ?auto_21984 ) ) ( not ( = ?auto_21990 ?auto_22005 ) ) ( not ( = ?auto_21990 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21965 ) ) ( not ( = ?auto_21954 ?auto_22004 ) ) ( not ( = ?auto_21955 ?auto_21965 ) ) ( not ( = ?auto_21955 ?auto_22004 ) ) ( not ( = ?auto_21956 ?auto_21965 ) ) ( not ( = ?auto_21956 ?auto_22004 ) ) ( not ( = ?auto_21957 ?auto_21965 ) ) ( not ( = ?auto_21957 ?auto_22004 ) ) ( not ( = ?auto_21958 ?auto_21965 ) ) ( not ( = ?auto_21958 ?auto_22004 ) ) ( not ( = ?auto_21959 ?auto_21965 ) ) ( not ( = ?auto_21959 ?auto_22004 ) ) ( not ( = ?auto_21960 ?auto_21965 ) ) ( not ( = ?auto_21960 ?auto_22004 ) ) ( not ( = ?auto_21961 ?auto_21965 ) ) ( not ( = ?auto_21961 ?auto_22004 ) ) ( not ( = ?auto_21962 ?auto_21965 ) ) ( not ( = ?auto_21962 ?auto_22004 ) ) ( not ( = ?auto_21963 ?auto_21965 ) ) ( not ( = ?auto_21963 ?auto_22004 ) ) ( not ( = ?auto_21965 ?auto_21990 ) ) ( not ( = ?auto_21965 ?auto_21996 ) ) ( not ( = ?auto_21965 ?auto_22001 ) ) ( not ( = ?auto_21965 ?auto_21987 ) ) ( not ( = ?auto_21965 ?auto_21980 ) ) ( not ( = ?auto_21965 ?auto_21989 ) ) ( not ( = ?auto_21965 ?auto_22000 ) ) ( not ( = ?auto_21965 ?auto_21984 ) ) ( not ( = ?auto_21965 ?auto_22005 ) ) ( not ( = ?auto_21965 ?auto_21979 ) ) ( not ( = ?auto_21994 ?auto_21981 ) ) ( not ( = ?auto_21994 ?auto_21978 ) ) ( not ( = ?auto_21994 ?auto_21993 ) ) ( not ( = ?auto_21994 ?auto_21975 ) ) ( not ( = ?auto_21994 ?auto_21998 ) ) ( not ( = ?auto_21994 ?auto_21992 ) ) ( not ( = ?auto_21994 ?auto_21997 ) ) ( not ( = ?auto_21994 ?auto_21999 ) ) ( not ( = ?auto_21985 ?auto_21982 ) ) ( not ( = ?auto_21985 ?auto_21983 ) ) ( not ( = ?auto_21985 ?auto_21976 ) ) ( not ( = ?auto_21985 ?auto_22002 ) ) ( not ( = ?auto_21985 ?auto_22003 ) ) ( not ( = ?auto_21985 ?auto_21977 ) ) ( not ( = ?auto_21985 ?auto_21995 ) ) ( not ( = ?auto_21985 ?auto_21986 ) ) ( not ( = ?auto_22004 ?auto_21990 ) ) ( not ( = ?auto_22004 ?auto_21996 ) ) ( not ( = ?auto_22004 ?auto_22001 ) ) ( not ( = ?auto_22004 ?auto_21987 ) ) ( not ( = ?auto_22004 ?auto_21980 ) ) ( not ( = ?auto_22004 ?auto_21989 ) ) ( not ( = ?auto_22004 ?auto_22000 ) ) ( not ( = ?auto_22004 ?auto_21984 ) ) ( not ( = ?auto_22004 ?auto_22005 ) ) ( not ( = ?auto_22004 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21966 ) ) ( not ( = ?auto_21954 ?auto_21988 ) ) ( not ( = ?auto_21955 ?auto_21966 ) ) ( not ( = ?auto_21955 ?auto_21988 ) ) ( not ( = ?auto_21956 ?auto_21966 ) ) ( not ( = ?auto_21956 ?auto_21988 ) ) ( not ( = ?auto_21957 ?auto_21966 ) ) ( not ( = ?auto_21957 ?auto_21988 ) ) ( not ( = ?auto_21958 ?auto_21966 ) ) ( not ( = ?auto_21958 ?auto_21988 ) ) ( not ( = ?auto_21959 ?auto_21966 ) ) ( not ( = ?auto_21959 ?auto_21988 ) ) ( not ( = ?auto_21960 ?auto_21966 ) ) ( not ( = ?auto_21960 ?auto_21988 ) ) ( not ( = ?auto_21961 ?auto_21966 ) ) ( not ( = ?auto_21961 ?auto_21988 ) ) ( not ( = ?auto_21962 ?auto_21966 ) ) ( not ( = ?auto_21962 ?auto_21988 ) ) ( not ( = ?auto_21963 ?auto_21966 ) ) ( not ( = ?auto_21963 ?auto_21988 ) ) ( not ( = ?auto_21964 ?auto_21966 ) ) ( not ( = ?auto_21964 ?auto_21988 ) ) ( not ( = ?auto_21966 ?auto_22004 ) ) ( not ( = ?auto_21966 ?auto_21990 ) ) ( not ( = ?auto_21966 ?auto_21996 ) ) ( not ( = ?auto_21966 ?auto_22001 ) ) ( not ( = ?auto_21966 ?auto_21987 ) ) ( not ( = ?auto_21966 ?auto_21980 ) ) ( not ( = ?auto_21966 ?auto_21989 ) ) ( not ( = ?auto_21966 ?auto_22000 ) ) ( not ( = ?auto_21966 ?auto_21984 ) ) ( not ( = ?auto_21966 ?auto_22005 ) ) ( not ( = ?auto_21966 ?auto_21979 ) ) ( not ( = ?auto_21988 ?auto_22004 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21988 ?auto_21996 ) ) ( not ( = ?auto_21988 ?auto_22001 ) ) ( not ( = ?auto_21988 ?auto_21987 ) ) ( not ( = ?auto_21988 ?auto_21980 ) ) ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_22000 ) ) ( not ( = ?auto_21988 ?auto_21984 ) ) ( not ( = ?auto_21988 ?auto_22005 ) ) ( not ( = ?auto_21988 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21967 ) ) ( not ( = ?auto_21954 ?auto_21991 ) ) ( not ( = ?auto_21955 ?auto_21967 ) ) ( not ( = ?auto_21955 ?auto_21991 ) ) ( not ( = ?auto_21956 ?auto_21967 ) ) ( not ( = ?auto_21956 ?auto_21991 ) ) ( not ( = ?auto_21957 ?auto_21967 ) ) ( not ( = ?auto_21957 ?auto_21991 ) ) ( not ( = ?auto_21958 ?auto_21967 ) ) ( not ( = ?auto_21958 ?auto_21991 ) ) ( not ( = ?auto_21959 ?auto_21967 ) ) ( not ( = ?auto_21959 ?auto_21991 ) ) ( not ( = ?auto_21960 ?auto_21967 ) ) ( not ( = ?auto_21960 ?auto_21991 ) ) ( not ( = ?auto_21961 ?auto_21967 ) ) ( not ( = ?auto_21961 ?auto_21991 ) ) ( not ( = ?auto_21962 ?auto_21967 ) ) ( not ( = ?auto_21962 ?auto_21991 ) ) ( not ( = ?auto_21963 ?auto_21967 ) ) ( not ( = ?auto_21963 ?auto_21991 ) ) ( not ( = ?auto_21964 ?auto_21967 ) ) ( not ( = ?auto_21964 ?auto_21991 ) ) ( not ( = ?auto_21965 ?auto_21967 ) ) ( not ( = ?auto_21965 ?auto_21991 ) ) ( not ( = ?auto_21967 ?auto_21988 ) ) ( not ( = ?auto_21967 ?auto_22004 ) ) ( not ( = ?auto_21967 ?auto_21990 ) ) ( not ( = ?auto_21967 ?auto_21996 ) ) ( not ( = ?auto_21967 ?auto_22001 ) ) ( not ( = ?auto_21967 ?auto_21987 ) ) ( not ( = ?auto_21967 ?auto_21980 ) ) ( not ( = ?auto_21967 ?auto_21989 ) ) ( not ( = ?auto_21967 ?auto_22000 ) ) ( not ( = ?auto_21967 ?auto_21984 ) ) ( not ( = ?auto_21967 ?auto_22005 ) ) ( not ( = ?auto_21967 ?auto_21979 ) ) ( not ( = ?auto_21991 ?auto_21988 ) ) ( not ( = ?auto_21991 ?auto_22004 ) ) ( not ( = ?auto_21991 ?auto_21990 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) ( not ( = ?auto_21991 ?auto_22001 ) ) ( not ( = ?auto_21991 ?auto_21987 ) ) ( not ( = ?auto_21991 ?auto_21980 ) ) ( not ( = ?auto_21991 ?auto_21989 ) ) ( not ( = ?auto_21991 ?auto_22000 ) ) ( not ( = ?auto_21991 ?auto_21984 ) ) ( not ( = ?auto_21991 ?auto_22005 ) ) ( not ( = ?auto_21991 ?auto_21979 ) ) ( not ( = ?auto_21954 ?auto_21968 ) ) ( not ( = ?auto_21954 ?auto_21970 ) ) ( not ( = ?auto_21955 ?auto_21968 ) ) ( not ( = ?auto_21955 ?auto_21970 ) ) ( not ( = ?auto_21956 ?auto_21968 ) ) ( not ( = ?auto_21956 ?auto_21970 ) ) ( not ( = ?auto_21957 ?auto_21968 ) ) ( not ( = ?auto_21957 ?auto_21970 ) ) ( not ( = ?auto_21958 ?auto_21968 ) ) ( not ( = ?auto_21958 ?auto_21970 ) ) ( not ( = ?auto_21959 ?auto_21968 ) ) ( not ( = ?auto_21959 ?auto_21970 ) ) ( not ( = ?auto_21960 ?auto_21968 ) ) ( not ( = ?auto_21960 ?auto_21970 ) ) ( not ( = ?auto_21961 ?auto_21968 ) ) ( not ( = ?auto_21961 ?auto_21970 ) ) ( not ( = ?auto_21962 ?auto_21968 ) ) ( not ( = ?auto_21962 ?auto_21970 ) ) ( not ( = ?auto_21963 ?auto_21968 ) ) ( not ( = ?auto_21963 ?auto_21970 ) ) ( not ( = ?auto_21964 ?auto_21968 ) ) ( not ( = ?auto_21964 ?auto_21970 ) ) ( not ( = ?auto_21965 ?auto_21968 ) ) ( not ( = ?auto_21965 ?auto_21970 ) ) ( not ( = ?auto_21966 ?auto_21968 ) ) ( not ( = ?auto_21966 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21991 ) ) ( not ( = ?auto_21968 ?auto_21988 ) ) ( not ( = ?auto_21968 ?auto_22004 ) ) ( not ( = ?auto_21968 ?auto_21990 ) ) ( not ( = ?auto_21968 ?auto_21996 ) ) ( not ( = ?auto_21968 ?auto_22001 ) ) ( not ( = ?auto_21968 ?auto_21987 ) ) ( not ( = ?auto_21968 ?auto_21980 ) ) ( not ( = ?auto_21968 ?auto_21989 ) ) ( not ( = ?auto_21968 ?auto_22000 ) ) ( not ( = ?auto_21968 ?auto_21984 ) ) ( not ( = ?auto_21968 ?auto_22005 ) ) ( not ( = ?auto_21968 ?auto_21979 ) ) ( not ( = ?auto_21974 ?auto_21993 ) ) ( not ( = ?auto_21974 ?auto_21994 ) ) ( not ( = ?auto_21974 ?auto_21981 ) ) ( not ( = ?auto_21974 ?auto_21978 ) ) ( not ( = ?auto_21974 ?auto_21975 ) ) ( not ( = ?auto_21974 ?auto_21998 ) ) ( not ( = ?auto_21974 ?auto_21992 ) ) ( not ( = ?auto_21974 ?auto_21997 ) ) ( not ( = ?auto_21974 ?auto_21999 ) ) ( not ( = ?auto_21969 ?auto_21976 ) ) ( not ( = ?auto_21969 ?auto_21985 ) ) ( not ( = ?auto_21969 ?auto_21982 ) ) ( not ( = ?auto_21969 ?auto_21983 ) ) ( not ( = ?auto_21969 ?auto_22002 ) ) ( not ( = ?auto_21969 ?auto_22003 ) ) ( not ( = ?auto_21969 ?auto_21977 ) ) ( not ( = ?auto_21969 ?auto_21995 ) ) ( not ( = ?auto_21969 ?auto_21986 ) ) ( not ( = ?auto_21970 ?auto_21991 ) ) ( not ( = ?auto_21970 ?auto_21988 ) ) ( not ( = ?auto_21970 ?auto_22004 ) ) ( not ( = ?auto_21970 ?auto_21990 ) ) ( not ( = ?auto_21970 ?auto_21996 ) ) ( not ( = ?auto_21970 ?auto_22001 ) ) ( not ( = ?auto_21970 ?auto_21987 ) ) ( not ( = ?auto_21970 ?auto_21980 ) ) ( not ( = ?auto_21970 ?auto_21989 ) ) ( not ( = ?auto_21970 ?auto_22000 ) ) ( not ( = ?auto_21970 ?auto_21984 ) ) ( not ( = ?auto_21970 ?auto_22005 ) ) ( not ( = ?auto_21970 ?auto_21979 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21954 ?auto_21955 ?auto_21956 ?auto_21957 ?auto_21958 ?auto_21959 ?auto_21960 ?auto_21961 ?auto_21962 ?auto_21963 ?auto_21964 ?auto_21965 ?auto_21966 ?auto_21967 )
      ( MAKE-1CRATE ?auto_21967 ?auto_21968 )
      ( MAKE-14CRATE-VERIFY ?auto_21954 ?auto_21955 ?auto_21956 ?auto_21957 ?auto_21958 ?auto_21959 ?auto_21960 ?auto_21961 ?auto_21962 ?auto_21963 ?auto_21964 ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22032 - SURFACE
      ?auto_22033 - SURFACE
      ?auto_22034 - SURFACE
      ?auto_22035 - SURFACE
      ?auto_22036 - SURFACE
      ?auto_22037 - SURFACE
      ?auto_22038 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22040 - SURFACE
      ?auto_22041 - SURFACE
      ?auto_22042 - SURFACE
      ?auto_22043 - SURFACE
      ?auto_22044 - SURFACE
      ?auto_22045 - SURFACE
      ?auto_22046 - SURFACE
      ?auto_22047 - SURFACE
    )
    :vars
    (
      ?auto_22050 - HOIST
      ?auto_22052 - PLACE
      ?auto_22048 - PLACE
      ?auto_22053 - HOIST
      ?auto_22049 - SURFACE
      ?auto_22078 - PLACE
      ?auto_22077 - HOIST
      ?auto_22083 - SURFACE
      ?auto_22067 - PLACE
      ?auto_22076 - HOIST
      ?auto_22085 - SURFACE
      ?auto_22069 - SURFACE
      ?auto_22061 - PLACE
      ?auto_22063 - HOIST
      ?auto_22081 - SURFACE
      ?auto_22066 - PLACE
      ?auto_22060 - HOIST
      ?auto_22068 - SURFACE
      ?auto_22080 - SURFACE
      ?auto_22055 - SURFACE
      ?auto_22074 - PLACE
      ?auto_22082 - HOIST
      ?auto_22070 - SURFACE
      ?auto_22057 - PLACE
      ?auto_22058 - HOIST
      ?auto_22059 - SURFACE
      ?auto_22084 - PLACE
      ?auto_22064 - HOIST
      ?auto_22071 - SURFACE
      ?auto_22075 - SURFACE
      ?auto_22079 - PLACE
      ?auto_22062 - HOIST
      ?auto_22065 - SURFACE
      ?auto_22054 - SURFACE
      ?auto_22056 - PLACE
      ?auto_22073 - HOIST
      ?auto_22072 - SURFACE
      ?auto_22051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22050 ?auto_22052 ) ( IS-CRATE ?auto_22047 ) ( not ( = ?auto_22048 ?auto_22052 ) ) ( HOIST-AT ?auto_22053 ?auto_22048 ) ( SURFACE-AT ?auto_22047 ?auto_22048 ) ( ON ?auto_22047 ?auto_22049 ) ( CLEAR ?auto_22047 ) ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22049 ) ) ( not ( = ?auto_22047 ?auto_22049 ) ) ( not ( = ?auto_22050 ?auto_22053 ) ) ( IS-CRATE ?auto_22046 ) ( not ( = ?auto_22078 ?auto_22052 ) ) ( HOIST-AT ?auto_22077 ?auto_22078 ) ( AVAILABLE ?auto_22077 ) ( SURFACE-AT ?auto_22046 ?auto_22078 ) ( ON ?auto_22046 ?auto_22083 ) ( CLEAR ?auto_22046 ) ( not ( = ?auto_22045 ?auto_22046 ) ) ( not ( = ?auto_22045 ?auto_22083 ) ) ( not ( = ?auto_22046 ?auto_22083 ) ) ( not ( = ?auto_22050 ?auto_22077 ) ) ( IS-CRATE ?auto_22045 ) ( not ( = ?auto_22067 ?auto_22052 ) ) ( HOIST-AT ?auto_22076 ?auto_22067 ) ( SURFACE-AT ?auto_22045 ?auto_22067 ) ( ON ?auto_22045 ?auto_22085 ) ( CLEAR ?auto_22045 ) ( not ( = ?auto_22044 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22085 ) ) ( not ( = ?auto_22045 ?auto_22085 ) ) ( not ( = ?auto_22050 ?auto_22076 ) ) ( IS-CRATE ?auto_22044 ) ( SURFACE-AT ?auto_22044 ?auto_22067 ) ( ON ?auto_22044 ?auto_22069 ) ( CLEAR ?auto_22044 ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22069 ) ) ( not ( = ?auto_22044 ?auto_22069 ) ) ( IS-CRATE ?auto_22043 ) ( not ( = ?auto_22061 ?auto_22052 ) ) ( HOIST-AT ?auto_22063 ?auto_22061 ) ( AVAILABLE ?auto_22063 ) ( SURFACE-AT ?auto_22043 ?auto_22061 ) ( ON ?auto_22043 ?auto_22081 ) ( CLEAR ?auto_22043 ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22081 ) ) ( not ( = ?auto_22043 ?auto_22081 ) ) ( not ( = ?auto_22050 ?auto_22063 ) ) ( IS-CRATE ?auto_22042 ) ( not ( = ?auto_22066 ?auto_22052 ) ) ( HOIST-AT ?auto_22060 ?auto_22066 ) ( AVAILABLE ?auto_22060 ) ( SURFACE-AT ?auto_22042 ?auto_22066 ) ( ON ?auto_22042 ?auto_22068 ) ( CLEAR ?auto_22042 ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22068 ) ) ( not ( = ?auto_22042 ?auto_22068 ) ) ( not ( = ?auto_22050 ?auto_22060 ) ) ( IS-CRATE ?auto_22041 ) ( AVAILABLE ?auto_22053 ) ( SURFACE-AT ?auto_22041 ?auto_22048 ) ( ON ?auto_22041 ?auto_22080 ) ( CLEAR ?auto_22041 ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22080 ) ) ( IS-CRATE ?auto_22040 ) ( AVAILABLE ?auto_22076 ) ( SURFACE-AT ?auto_22040 ?auto_22067 ) ( ON ?auto_22040 ?auto_22055 ) ( CLEAR ?auto_22040 ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22055 ) ) ( not ( = ?auto_22040 ?auto_22055 ) ) ( IS-CRATE ?auto_22039 ) ( not ( = ?auto_22074 ?auto_22052 ) ) ( HOIST-AT ?auto_22082 ?auto_22074 ) ( AVAILABLE ?auto_22082 ) ( SURFACE-AT ?auto_22039 ?auto_22074 ) ( ON ?auto_22039 ?auto_22070 ) ( CLEAR ?auto_22039 ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22070 ) ) ( not ( = ?auto_22039 ?auto_22070 ) ) ( not ( = ?auto_22050 ?auto_22082 ) ) ( IS-CRATE ?auto_22038 ) ( not ( = ?auto_22057 ?auto_22052 ) ) ( HOIST-AT ?auto_22058 ?auto_22057 ) ( SURFACE-AT ?auto_22038 ?auto_22057 ) ( ON ?auto_22038 ?auto_22059 ) ( CLEAR ?auto_22038 ) ( not ( = ?auto_22037 ?auto_22038 ) ) ( not ( = ?auto_22037 ?auto_22059 ) ) ( not ( = ?auto_22038 ?auto_22059 ) ) ( not ( = ?auto_22050 ?auto_22058 ) ) ( IS-CRATE ?auto_22037 ) ( not ( = ?auto_22084 ?auto_22052 ) ) ( HOIST-AT ?auto_22064 ?auto_22084 ) ( AVAILABLE ?auto_22064 ) ( SURFACE-AT ?auto_22037 ?auto_22084 ) ( ON ?auto_22037 ?auto_22071 ) ( CLEAR ?auto_22037 ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22071 ) ) ( not ( = ?auto_22037 ?auto_22071 ) ) ( not ( = ?auto_22050 ?auto_22064 ) ) ( IS-CRATE ?auto_22036 ) ( AVAILABLE ?auto_22058 ) ( SURFACE-AT ?auto_22036 ?auto_22057 ) ( ON ?auto_22036 ?auto_22075 ) ( CLEAR ?auto_22036 ) ( not ( = ?auto_22035 ?auto_22036 ) ) ( not ( = ?auto_22035 ?auto_22075 ) ) ( not ( = ?auto_22036 ?auto_22075 ) ) ( IS-CRATE ?auto_22035 ) ( not ( = ?auto_22079 ?auto_22052 ) ) ( HOIST-AT ?auto_22062 ?auto_22079 ) ( SURFACE-AT ?auto_22035 ?auto_22079 ) ( ON ?auto_22035 ?auto_22065 ) ( CLEAR ?auto_22035 ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( not ( = ?auto_22034 ?auto_22065 ) ) ( not ( = ?auto_22035 ?auto_22065 ) ) ( not ( = ?auto_22050 ?auto_22062 ) ) ( IS-CRATE ?auto_22034 ) ( AVAILABLE ?auto_22062 ) ( SURFACE-AT ?auto_22034 ?auto_22079 ) ( ON ?auto_22034 ?auto_22054 ) ( CLEAR ?auto_22034 ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22054 ) ) ( not ( = ?auto_22034 ?auto_22054 ) ) ( SURFACE-AT ?auto_22032 ?auto_22052 ) ( CLEAR ?auto_22032 ) ( IS-CRATE ?auto_22033 ) ( AVAILABLE ?auto_22050 ) ( not ( = ?auto_22056 ?auto_22052 ) ) ( HOIST-AT ?auto_22073 ?auto_22056 ) ( AVAILABLE ?auto_22073 ) ( SURFACE-AT ?auto_22033 ?auto_22056 ) ( ON ?auto_22033 ?auto_22072 ) ( CLEAR ?auto_22033 ) ( TRUCK-AT ?auto_22051 ?auto_22052 ) ( not ( = ?auto_22032 ?auto_22033 ) ) ( not ( = ?auto_22032 ?auto_22072 ) ) ( not ( = ?auto_22033 ?auto_22072 ) ) ( not ( = ?auto_22050 ?auto_22073 ) ) ( not ( = ?auto_22032 ?auto_22034 ) ) ( not ( = ?auto_22032 ?auto_22054 ) ) ( not ( = ?auto_22034 ?auto_22072 ) ) ( not ( = ?auto_22079 ?auto_22056 ) ) ( not ( = ?auto_22062 ?auto_22073 ) ) ( not ( = ?auto_22054 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22035 ) ) ( not ( = ?auto_22032 ?auto_22065 ) ) ( not ( = ?auto_22033 ?auto_22035 ) ) ( not ( = ?auto_22033 ?auto_22065 ) ) ( not ( = ?auto_22035 ?auto_22054 ) ) ( not ( = ?auto_22035 ?auto_22072 ) ) ( not ( = ?auto_22065 ?auto_22054 ) ) ( not ( = ?auto_22065 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22036 ) ) ( not ( = ?auto_22032 ?auto_22075 ) ) ( not ( = ?auto_22033 ?auto_22036 ) ) ( not ( = ?auto_22033 ?auto_22075 ) ) ( not ( = ?auto_22034 ?auto_22036 ) ) ( not ( = ?auto_22034 ?auto_22075 ) ) ( not ( = ?auto_22036 ?auto_22065 ) ) ( not ( = ?auto_22036 ?auto_22054 ) ) ( not ( = ?auto_22036 ?auto_22072 ) ) ( not ( = ?auto_22057 ?auto_22079 ) ) ( not ( = ?auto_22057 ?auto_22056 ) ) ( not ( = ?auto_22058 ?auto_22062 ) ) ( not ( = ?auto_22058 ?auto_22073 ) ) ( not ( = ?auto_22075 ?auto_22065 ) ) ( not ( = ?auto_22075 ?auto_22054 ) ) ( not ( = ?auto_22075 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22037 ) ) ( not ( = ?auto_22032 ?auto_22071 ) ) ( not ( = ?auto_22033 ?auto_22037 ) ) ( not ( = ?auto_22033 ?auto_22071 ) ) ( not ( = ?auto_22034 ?auto_22037 ) ) ( not ( = ?auto_22034 ?auto_22071 ) ) ( not ( = ?auto_22035 ?auto_22037 ) ) ( not ( = ?auto_22035 ?auto_22071 ) ) ( not ( = ?auto_22037 ?auto_22075 ) ) ( not ( = ?auto_22037 ?auto_22065 ) ) ( not ( = ?auto_22037 ?auto_22054 ) ) ( not ( = ?auto_22037 ?auto_22072 ) ) ( not ( = ?auto_22084 ?auto_22057 ) ) ( not ( = ?auto_22084 ?auto_22079 ) ) ( not ( = ?auto_22084 ?auto_22056 ) ) ( not ( = ?auto_22064 ?auto_22058 ) ) ( not ( = ?auto_22064 ?auto_22062 ) ) ( not ( = ?auto_22064 ?auto_22073 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22065 ) ) ( not ( = ?auto_22071 ?auto_22054 ) ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22038 ) ) ( not ( = ?auto_22032 ?auto_22059 ) ) ( not ( = ?auto_22033 ?auto_22038 ) ) ( not ( = ?auto_22033 ?auto_22059 ) ) ( not ( = ?auto_22034 ?auto_22038 ) ) ( not ( = ?auto_22034 ?auto_22059 ) ) ( not ( = ?auto_22035 ?auto_22038 ) ) ( not ( = ?auto_22035 ?auto_22059 ) ) ( not ( = ?auto_22036 ?auto_22038 ) ) ( not ( = ?auto_22036 ?auto_22059 ) ) ( not ( = ?auto_22038 ?auto_22071 ) ) ( not ( = ?auto_22038 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22065 ) ) ( not ( = ?auto_22038 ?auto_22054 ) ) ( not ( = ?auto_22038 ?auto_22072 ) ) ( not ( = ?auto_22059 ?auto_22071 ) ) ( not ( = ?auto_22059 ?auto_22075 ) ) ( not ( = ?auto_22059 ?auto_22065 ) ) ( not ( = ?auto_22059 ?auto_22054 ) ) ( not ( = ?auto_22059 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22039 ) ) ( not ( = ?auto_22032 ?auto_22070 ) ) ( not ( = ?auto_22033 ?auto_22039 ) ) ( not ( = ?auto_22033 ?auto_22070 ) ) ( not ( = ?auto_22034 ?auto_22039 ) ) ( not ( = ?auto_22034 ?auto_22070 ) ) ( not ( = ?auto_22035 ?auto_22039 ) ) ( not ( = ?auto_22035 ?auto_22070 ) ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22070 ) ) ( not ( = ?auto_22037 ?auto_22039 ) ) ( not ( = ?auto_22037 ?auto_22070 ) ) ( not ( = ?auto_22039 ?auto_22059 ) ) ( not ( = ?auto_22039 ?auto_22071 ) ) ( not ( = ?auto_22039 ?auto_22075 ) ) ( not ( = ?auto_22039 ?auto_22065 ) ) ( not ( = ?auto_22039 ?auto_22054 ) ) ( not ( = ?auto_22039 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22057 ) ) ( not ( = ?auto_22074 ?auto_22084 ) ) ( not ( = ?auto_22074 ?auto_22079 ) ) ( not ( = ?auto_22074 ?auto_22056 ) ) ( not ( = ?auto_22082 ?auto_22058 ) ) ( not ( = ?auto_22082 ?auto_22064 ) ) ( not ( = ?auto_22082 ?auto_22062 ) ) ( not ( = ?auto_22082 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22059 ) ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22075 ) ) ( not ( = ?auto_22070 ?auto_22065 ) ) ( not ( = ?auto_22070 ?auto_22054 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22040 ) ) ( not ( = ?auto_22032 ?auto_22055 ) ) ( not ( = ?auto_22033 ?auto_22040 ) ) ( not ( = ?auto_22033 ?auto_22055 ) ) ( not ( = ?auto_22034 ?auto_22040 ) ) ( not ( = ?auto_22034 ?auto_22055 ) ) ( not ( = ?auto_22035 ?auto_22040 ) ) ( not ( = ?auto_22035 ?auto_22055 ) ) ( not ( = ?auto_22036 ?auto_22040 ) ) ( not ( = ?auto_22036 ?auto_22055 ) ) ( not ( = ?auto_22037 ?auto_22040 ) ) ( not ( = ?auto_22037 ?auto_22055 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22055 ) ) ( not ( = ?auto_22040 ?auto_22070 ) ) ( not ( = ?auto_22040 ?auto_22059 ) ) ( not ( = ?auto_22040 ?auto_22071 ) ) ( not ( = ?auto_22040 ?auto_22075 ) ) ( not ( = ?auto_22040 ?auto_22065 ) ) ( not ( = ?auto_22040 ?auto_22054 ) ) ( not ( = ?auto_22040 ?auto_22072 ) ) ( not ( = ?auto_22067 ?auto_22074 ) ) ( not ( = ?auto_22067 ?auto_22057 ) ) ( not ( = ?auto_22067 ?auto_22084 ) ) ( not ( = ?auto_22067 ?auto_22079 ) ) ( not ( = ?auto_22067 ?auto_22056 ) ) ( not ( = ?auto_22076 ?auto_22082 ) ) ( not ( = ?auto_22076 ?auto_22058 ) ) ( not ( = ?auto_22076 ?auto_22064 ) ) ( not ( = ?auto_22076 ?auto_22062 ) ) ( not ( = ?auto_22076 ?auto_22073 ) ) ( not ( = ?auto_22055 ?auto_22070 ) ) ( not ( = ?auto_22055 ?auto_22059 ) ) ( not ( = ?auto_22055 ?auto_22071 ) ) ( not ( = ?auto_22055 ?auto_22075 ) ) ( not ( = ?auto_22055 ?auto_22065 ) ) ( not ( = ?auto_22055 ?auto_22054 ) ) ( not ( = ?auto_22055 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22041 ) ) ( not ( = ?auto_22032 ?auto_22080 ) ) ( not ( = ?auto_22033 ?auto_22041 ) ) ( not ( = ?auto_22033 ?auto_22080 ) ) ( not ( = ?auto_22034 ?auto_22041 ) ) ( not ( = ?auto_22034 ?auto_22080 ) ) ( not ( = ?auto_22035 ?auto_22041 ) ) ( not ( = ?auto_22035 ?auto_22080 ) ) ( not ( = ?auto_22036 ?auto_22041 ) ) ( not ( = ?auto_22036 ?auto_22080 ) ) ( not ( = ?auto_22037 ?auto_22041 ) ) ( not ( = ?auto_22037 ?auto_22080 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( not ( = ?auto_22038 ?auto_22080 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22055 ) ) ( not ( = ?auto_22041 ?auto_22070 ) ) ( not ( = ?auto_22041 ?auto_22059 ) ) ( not ( = ?auto_22041 ?auto_22071 ) ) ( not ( = ?auto_22041 ?auto_22075 ) ) ( not ( = ?auto_22041 ?auto_22065 ) ) ( not ( = ?auto_22041 ?auto_22054 ) ) ( not ( = ?auto_22041 ?auto_22072 ) ) ( not ( = ?auto_22048 ?auto_22067 ) ) ( not ( = ?auto_22048 ?auto_22074 ) ) ( not ( = ?auto_22048 ?auto_22057 ) ) ( not ( = ?auto_22048 ?auto_22084 ) ) ( not ( = ?auto_22048 ?auto_22079 ) ) ( not ( = ?auto_22048 ?auto_22056 ) ) ( not ( = ?auto_22053 ?auto_22076 ) ) ( not ( = ?auto_22053 ?auto_22082 ) ) ( not ( = ?auto_22053 ?auto_22058 ) ) ( not ( = ?auto_22053 ?auto_22064 ) ) ( not ( = ?auto_22053 ?auto_22062 ) ) ( not ( = ?auto_22053 ?auto_22073 ) ) ( not ( = ?auto_22080 ?auto_22055 ) ) ( not ( = ?auto_22080 ?auto_22070 ) ) ( not ( = ?auto_22080 ?auto_22059 ) ) ( not ( = ?auto_22080 ?auto_22071 ) ) ( not ( = ?auto_22080 ?auto_22075 ) ) ( not ( = ?auto_22080 ?auto_22065 ) ) ( not ( = ?auto_22080 ?auto_22054 ) ) ( not ( = ?auto_22080 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22042 ) ) ( not ( = ?auto_22032 ?auto_22068 ) ) ( not ( = ?auto_22033 ?auto_22042 ) ) ( not ( = ?auto_22033 ?auto_22068 ) ) ( not ( = ?auto_22034 ?auto_22042 ) ) ( not ( = ?auto_22034 ?auto_22068 ) ) ( not ( = ?auto_22035 ?auto_22042 ) ) ( not ( = ?auto_22035 ?auto_22068 ) ) ( not ( = ?auto_22036 ?auto_22042 ) ) ( not ( = ?auto_22036 ?auto_22068 ) ) ( not ( = ?auto_22037 ?auto_22042 ) ) ( not ( = ?auto_22037 ?auto_22068 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22068 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22068 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22068 ) ) ( not ( = ?auto_22042 ?auto_22080 ) ) ( not ( = ?auto_22042 ?auto_22055 ) ) ( not ( = ?auto_22042 ?auto_22070 ) ) ( not ( = ?auto_22042 ?auto_22059 ) ) ( not ( = ?auto_22042 ?auto_22071 ) ) ( not ( = ?auto_22042 ?auto_22075 ) ) ( not ( = ?auto_22042 ?auto_22065 ) ) ( not ( = ?auto_22042 ?auto_22054 ) ) ( not ( = ?auto_22042 ?auto_22072 ) ) ( not ( = ?auto_22066 ?auto_22048 ) ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22074 ) ) ( not ( = ?auto_22066 ?auto_22057 ) ) ( not ( = ?auto_22066 ?auto_22084 ) ) ( not ( = ?auto_22066 ?auto_22079 ) ) ( not ( = ?auto_22066 ?auto_22056 ) ) ( not ( = ?auto_22060 ?auto_22053 ) ) ( not ( = ?auto_22060 ?auto_22076 ) ) ( not ( = ?auto_22060 ?auto_22082 ) ) ( not ( = ?auto_22060 ?auto_22058 ) ) ( not ( = ?auto_22060 ?auto_22064 ) ) ( not ( = ?auto_22060 ?auto_22062 ) ) ( not ( = ?auto_22060 ?auto_22073 ) ) ( not ( = ?auto_22068 ?auto_22080 ) ) ( not ( = ?auto_22068 ?auto_22055 ) ) ( not ( = ?auto_22068 ?auto_22070 ) ) ( not ( = ?auto_22068 ?auto_22059 ) ) ( not ( = ?auto_22068 ?auto_22071 ) ) ( not ( = ?auto_22068 ?auto_22075 ) ) ( not ( = ?auto_22068 ?auto_22065 ) ) ( not ( = ?auto_22068 ?auto_22054 ) ) ( not ( = ?auto_22068 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22043 ) ) ( not ( = ?auto_22032 ?auto_22081 ) ) ( not ( = ?auto_22033 ?auto_22043 ) ) ( not ( = ?auto_22033 ?auto_22081 ) ) ( not ( = ?auto_22034 ?auto_22043 ) ) ( not ( = ?auto_22034 ?auto_22081 ) ) ( not ( = ?auto_22035 ?auto_22043 ) ) ( not ( = ?auto_22035 ?auto_22081 ) ) ( not ( = ?auto_22036 ?auto_22043 ) ) ( not ( = ?auto_22036 ?auto_22081 ) ) ( not ( = ?auto_22037 ?auto_22043 ) ) ( not ( = ?auto_22037 ?auto_22081 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22081 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22081 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22081 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22081 ) ) ( not ( = ?auto_22043 ?auto_22068 ) ) ( not ( = ?auto_22043 ?auto_22080 ) ) ( not ( = ?auto_22043 ?auto_22055 ) ) ( not ( = ?auto_22043 ?auto_22070 ) ) ( not ( = ?auto_22043 ?auto_22059 ) ) ( not ( = ?auto_22043 ?auto_22071 ) ) ( not ( = ?auto_22043 ?auto_22075 ) ) ( not ( = ?auto_22043 ?auto_22065 ) ) ( not ( = ?auto_22043 ?auto_22054 ) ) ( not ( = ?auto_22043 ?auto_22072 ) ) ( not ( = ?auto_22061 ?auto_22066 ) ) ( not ( = ?auto_22061 ?auto_22048 ) ) ( not ( = ?auto_22061 ?auto_22067 ) ) ( not ( = ?auto_22061 ?auto_22074 ) ) ( not ( = ?auto_22061 ?auto_22057 ) ) ( not ( = ?auto_22061 ?auto_22084 ) ) ( not ( = ?auto_22061 ?auto_22079 ) ) ( not ( = ?auto_22061 ?auto_22056 ) ) ( not ( = ?auto_22063 ?auto_22060 ) ) ( not ( = ?auto_22063 ?auto_22053 ) ) ( not ( = ?auto_22063 ?auto_22076 ) ) ( not ( = ?auto_22063 ?auto_22082 ) ) ( not ( = ?auto_22063 ?auto_22058 ) ) ( not ( = ?auto_22063 ?auto_22064 ) ) ( not ( = ?auto_22063 ?auto_22062 ) ) ( not ( = ?auto_22063 ?auto_22073 ) ) ( not ( = ?auto_22081 ?auto_22068 ) ) ( not ( = ?auto_22081 ?auto_22080 ) ) ( not ( = ?auto_22081 ?auto_22055 ) ) ( not ( = ?auto_22081 ?auto_22070 ) ) ( not ( = ?auto_22081 ?auto_22059 ) ) ( not ( = ?auto_22081 ?auto_22071 ) ) ( not ( = ?auto_22081 ?auto_22075 ) ) ( not ( = ?auto_22081 ?auto_22065 ) ) ( not ( = ?auto_22081 ?auto_22054 ) ) ( not ( = ?auto_22081 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22044 ) ) ( not ( = ?auto_22032 ?auto_22069 ) ) ( not ( = ?auto_22033 ?auto_22044 ) ) ( not ( = ?auto_22033 ?auto_22069 ) ) ( not ( = ?auto_22034 ?auto_22044 ) ) ( not ( = ?auto_22034 ?auto_22069 ) ) ( not ( = ?auto_22035 ?auto_22044 ) ) ( not ( = ?auto_22035 ?auto_22069 ) ) ( not ( = ?auto_22036 ?auto_22044 ) ) ( not ( = ?auto_22036 ?auto_22069 ) ) ( not ( = ?auto_22037 ?auto_22044 ) ) ( not ( = ?auto_22037 ?auto_22069 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22038 ?auto_22069 ) ) ( not ( = ?auto_22039 ?auto_22044 ) ) ( not ( = ?auto_22039 ?auto_22069 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22069 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22069 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22069 ) ) ( not ( = ?auto_22044 ?auto_22081 ) ) ( not ( = ?auto_22044 ?auto_22068 ) ) ( not ( = ?auto_22044 ?auto_22080 ) ) ( not ( = ?auto_22044 ?auto_22055 ) ) ( not ( = ?auto_22044 ?auto_22070 ) ) ( not ( = ?auto_22044 ?auto_22059 ) ) ( not ( = ?auto_22044 ?auto_22071 ) ) ( not ( = ?auto_22044 ?auto_22075 ) ) ( not ( = ?auto_22044 ?auto_22065 ) ) ( not ( = ?auto_22044 ?auto_22054 ) ) ( not ( = ?auto_22044 ?auto_22072 ) ) ( not ( = ?auto_22069 ?auto_22081 ) ) ( not ( = ?auto_22069 ?auto_22068 ) ) ( not ( = ?auto_22069 ?auto_22080 ) ) ( not ( = ?auto_22069 ?auto_22055 ) ) ( not ( = ?auto_22069 ?auto_22070 ) ) ( not ( = ?auto_22069 ?auto_22059 ) ) ( not ( = ?auto_22069 ?auto_22071 ) ) ( not ( = ?auto_22069 ?auto_22075 ) ) ( not ( = ?auto_22069 ?auto_22065 ) ) ( not ( = ?auto_22069 ?auto_22054 ) ) ( not ( = ?auto_22069 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22045 ) ) ( not ( = ?auto_22032 ?auto_22085 ) ) ( not ( = ?auto_22033 ?auto_22045 ) ) ( not ( = ?auto_22033 ?auto_22085 ) ) ( not ( = ?auto_22034 ?auto_22045 ) ) ( not ( = ?auto_22034 ?auto_22085 ) ) ( not ( = ?auto_22035 ?auto_22045 ) ) ( not ( = ?auto_22035 ?auto_22085 ) ) ( not ( = ?auto_22036 ?auto_22045 ) ) ( not ( = ?auto_22036 ?auto_22085 ) ) ( not ( = ?auto_22037 ?auto_22045 ) ) ( not ( = ?auto_22037 ?auto_22085 ) ) ( not ( = ?auto_22038 ?auto_22045 ) ) ( not ( = ?auto_22038 ?auto_22085 ) ) ( not ( = ?auto_22039 ?auto_22045 ) ) ( not ( = ?auto_22039 ?auto_22085 ) ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22040 ?auto_22085 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22085 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22085 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( not ( = ?auto_22043 ?auto_22085 ) ) ( not ( = ?auto_22045 ?auto_22069 ) ) ( not ( = ?auto_22045 ?auto_22081 ) ) ( not ( = ?auto_22045 ?auto_22068 ) ) ( not ( = ?auto_22045 ?auto_22080 ) ) ( not ( = ?auto_22045 ?auto_22055 ) ) ( not ( = ?auto_22045 ?auto_22070 ) ) ( not ( = ?auto_22045 ?auto_22059 ) ) ( not ( = ?auto_22045 ?auto_22071 ) ) ( not ( = ?auto_22045 ?auto_22075 ) ) ( not ( = ?auto_22045 ?auto_22065 ) ) ( not ( = ?auto_22045 ?auto_22054 ) ) ( not ( = ?auto_22045 ?auto_22072 ) ) ( not ( = ?auto_22085 ?auto_22069 ) ) ( not ( = ?auto_22085 ?auto_22081 ) ) ( not ( = ?auto_22085 ?auto_22068 ) ) ( not ( = ?auto_22085 ?auto_22080 ) ) ( not ( = ?auto_22085 ?auto_22055 ) ) ( not ( = ?auto_22085 ?auto_22070 ) ) ( not ( = ?auto_22085 ?auto_22059 ) ) ( not ( = ?auto_22085 ?auto_22071 ) ) ( not ( = ?auto_22085 ?auto_22075 ) ) ( not ( = ?auto_22085 ?auto_22065 ) ) ( not ( = ?auto_22085 ?auto_22054 ) ) ( not ( = ?auto_22085 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22046 ) ) ( not ( = ?auto_22032 ?auto_22083 ) ) ( not ( = ?auto_22033 ?auto_22046 ) ) ( not ( = ?auto_22033 ?auto_22083 ) ) ( not ( = ?auto_22034 ?auto_22046 ) ) ( not ( = ?auto_22034 ?auto_22083 ) ) ( not ( = ?auto_22035 ?auto_22046 ) ) ( not ( = ?auto_22035 ?auto_22083 ) ) ( not ( = ?auto_22036 ?auto_22046 ) ) ( not ( = ?auto_22036 ?auto_22083 ) ) ( not ( = ?auto_22037 ?auto_22046 ) ) ( not ( = ?auto_22037 ?auto_22083 ) ) ( not ( = ?auto_22038 ?auto_22046 ) ) ( not ( = ?auto_22038 ?auto_22083 ) ) ( not ( = ?auto_22039 ?auto_22046 ) ) ( not ( = ?auto_22039 ?auto_22083 ) ) ( not ( = ?auto_22040 ?auto_22046 ) ) ( not ( = ?auto_22040 ?auto_22083 ) ) ( not ( = ?auto_22041 ?auto_22046 ) ) ( not ( = ?auto_22041 ?auto_22083 ) ) ( not ( = ?auto_22042 ?auto_22046 ) ) ( not ( = ?auto_22042 ?auto_22083 ) ) ( not ( = ?auto_22043 ?auto_22046 ) ) ( not ( = ?auto_22043 ?auto_22083 ) ) ( not ( = ?auto_22044 ?auto_22046 ) ) ( not ( = ?auto_22044 ?auto_22083 ) ) ( not ( = ?auto_22046 ?auto_22085 ) ) ( not ( = ?auto_22046 ?auto_22069 ) ) ( not ( = ?auto_22046 ?auto_22081 ) ) ( not ( = ?auto_22046 ?auto_22068 ) ) ( not ( = ?auto_22046 ?auto_22080 ) ) ( not ( = ?auto_22046 ?auto_22055 ) ) ( not ( = ?auto_22046 ?auto_22070 ) ) ( not ( = ?auto_22046 ?auto_22059 ) ) ( not ( = ?auto_22046 ?auto_22071 ) ) ( not ( = ?auto_22046 ?auto_22075 ) ) ( not ( = ?auto_22046 ?auto_22065 ) ) ( not ( = ?auto_22046 ?auto_22054 ) ) ( not ( = ?auto_22046 ?auto_22072 ) ) ( not ( = ?auto_22078 ?auto_22067 ) ) ( not ( = ?auto_22078 ?auto_22061 ) ) ( not ( = ?auto_22078 ?auto_22066 ) ) ( not ( = ?auto_22078 ?auto_22048 ) ) ( not ( = ?auto_22078 ?auto_22074 ) ) ( not ( = ?auto_22078 ?auto_22057 ) ) ( not ( = ?auto_22078 ?auto_22084 ) ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22056 ) ) ( not ( = ?auto_22077 ?auto_22076 ) ) ( not ( = ?auto_22077 ?auto_22063 ) ) ( not ( = ?auto_22077 ?auto_22060 ) ) ( not ( = ?auto_22077 ?auto_22053 ) ) ( not ( = ?auto_22077 ?auto_22082 ) ) ( not ( = ?auto_22077 ?auto_22058 ) ) ( not ( = ?auto_22077 ?auto_22064 ) ) ( not ( = ?auto_22077 ?auto_22062 ) ) ( not ( = ?auto_22077 ?auto_22073 ) ) ( not ( = ?auto_22083 ?auto_22085 ) ) ( not ( = ?auto_22083 ?auto_22069 ) ) ( not ( = ?auto_22083 ?auto_22081 ) ) ( not ( = ?auto_22083 ?auto_22068 ) ) ( not ( = ?auto_22083 ?auto_22080 ) ) ( not ( = ?auto_22083 ?auto_22055 ) ) ( not ( = ?auto_22083 ?auto_22070 ) ) ( not ( = ?auto_22083 ?auto_22059 ) ) ( not ( = ?auto_22083 ?auto_22071 ) ) ( not ( = ?auto_22083 ?auto_22075 ) ) ( not ( = ?auto_22083 ?auto_22065 ) ) ( not ( = ?auto_22083 ?auto_22054 ) ) ( not ( = ?auto_22083 ?auto_22072 ) ) ( not ( = ?auto_22032 ?auto_22047 ) ) ( not ( = ?auto_22032 ?auto_22049 ) ) ( not ( = ?auto_22033 ?auto_22047 ) ) ( not ( = ?auto_22033 ?auto_22049 ) ) ( not ( = ?auto_22034 ?auto_22047 ) ) ( not ( = ?auto_22034 ?auto_22049 ) ) ( not ( = ?auto_22035 ?auto_22047 ) ) ( not ( = ?auto_22035 ?auto_22049 ) ) ( not ( = ?auto_22036 ?auto_22047 ) ) ( not ( = ?auto_22036 ?auto_22049 ) ) ( not ( = ?auto_22037 ?auto_22047 ) ) ( not ( = ?auto_22037 ?auto_22049 ) ) ( not ( = ?auto_22038 ?auto_22047 ) ) ( not ( = ?auto_22038 ?auto_22049 ) ) ( not ( = ?auto_22039 ?auto_22047 ) ) ( not ( = ?auto_22039 ?auto_22049 ) ) ( not ( = ?auto_22040 ?auto_22047 ) ) ( not ( = ?auto_22040 ?auto_22049 ) ) ( not ( = ?auto_22041 ?auto_22047 ) ) ( not ( = ?auto_22041 ?auto_22049 ) ) ( not ( = ?auto_22042 ?auto_22047 ) ) ( not ( = ?auto_22042 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22047 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22047 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( not ( = ?auto_22045 ?auto_22047 ) ) ( not ( = ?auto_22045 ?auto_22049 ) ) ( not ( = ?auto_22047 ?auto_22083 ) ) ( not ( = ?auto_22047 ?auto_22085 ) ) ( not ( = ?auto_22047 ?auto_22069 ) ) ( not ( = ?auto_22047 ?auto_22081 ) ) ( not ( = ?auto_22047 ?auto_22068 ) ) ( not ( = ?auto_22047 ?auto_22080 ) ) ( not ( = ?auto_22047 ?auto_22055 ) ) ( not ( = ?auto_22047 ?auto_22070 ) ) ( not ( = ?auto_22047 ?auto_22059 ) ) ( not ( = ?auto_22047 ?auto_22071 ) ) ( not ( = ?auto_22047 ?auto_22075 ) ) ( not ( = ?auto_22047 ?auto_22065 ) ) ( not ( = ?auto_22047 ?auto_22054 ) ) ( not ( = ?auto_22047 ?auto_22072 ) ) ( not ( = ?auto_22049 ?auto_22083 ) ) ( not ( = ?auto_22049 ?auto_22085 ) ) ( not ( = ?auto_22049 ?auto_22069 ) ) ( not ( = ?auto_22049 ?auto_22081 ) ) ( not ( = ?auto_22049 ?auto_22068 ) ) ( not ( = ?auto_22049 ?auto_22080 ) ) ( not ( = ?auto_22049 ?auto_22055 ) ) ( not ( = ?auto_22049 ?auto_22070 ) ) ( not ( = ?auto_22049 ?auto_22059 ) ) ( not ( = ?auto_22049 ?auto_22071 ) ) ( not ( = ?auto_22049 ?auto_22075 ) ) ( not ( = ?auto_22049 ?auto_22065 ) ) ( not ( = ?auto_22049 ?auto_22054 ) ) ( not ( = ?auto_22049 ?auto_22072 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22032 ?auto_22033 ?auto_22034 ?auto_22035 ?auto_22036 ?auto_22037 ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22045 ?auto_22046 )
      ( MAKE-1CRATE ?auto_22046 ?auto_22047 )
      ( MAKE-15CRATE-VERIFY ?auto_22032 ?auto_22033 ?auto_22034 ?auto_22035 ?auto_22036 ?auto_22037 ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22045 ?auto_22046 ?auto_22047 ) )
  )

)

