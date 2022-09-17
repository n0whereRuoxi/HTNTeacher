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
      ?auto_1596373 - SURFACE
      ?auto_1596374 - SURFACE
    )
    :vars
    (
      ?auto_1596375 - HOIST
      ?auto_1596376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596375 ?auto_1596376 ) ( SURFACE-AT ?auto_1596373 ?auto_1596376 ) ( CLEAR ?auto_1596373 ) ( LIFTING ?auto_1596375 ?auto_1596374 ) ( IS-CRATE ?auto_1596374 ) ( not ( = ?auto_1596373 ?auto_1596374 ) ) )
    :subtasks
    ( ( !DROP ?auto_1596375 ?auto_1596374 ?auto_1596373 ?auto_1596376 )
      ( MAKE-1CRATE-VERIFY ?auto_1596373 ?auto_1596374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596377 - SURFACE
      ?auto_1596378 - SURFACE
    )
    :vars
    (
      ?auto_1596380 - HOIST
      ?auto_1596379 - PLACE
      ?auto_1596381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596380 ?auto_1596379 ) ( SURFACE-AT ?auto_1596377 ?auto_1596379 ) ( CLEAR ?auto_1596377 ) ( IS-CRATE ?auto_1596378 ) ( not ( = ?auto_1596377 ?auto_1596378 ) ) ( TRUCK-AT ?auto_1596381 ?auto_1596379 ) ( AVAILABLE ?auto_1596380 ) ( IN ?auto_1596378 ?auto_1596381 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1596380 ?auto_1596378 ?auto_1596381 ?auto_1596379 )
      ( MAKE-1CRATE ?auto_1596377 ?auto_1596378 )
      ( MAKE-1CRATE-VERIFY ?auto_1596377 ?auto_1596378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596382 - SURFACE
      ?auto_1596383 - SURFACE
    )
    :vars
    (
      ?auto_1596384 - HOIST
      ?auto_1596386 - PLACE
      ?auto_1596385 - TRUCK
      ?auto_1596387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596384 ?auto_1596386 ) ( SURFACE-AT ?auto_1596382 ?auto_1596386 ) ( CLEAR ?auto_1596382 ) ( IS-CRATE ?auto_1596383 ) ( not ( = ?auto_1596382 ?auto_1596383 ) ) ( AVAILABLE ?auto_1596384 ) ( IN ?auto_1596383 ?auto_1596385 ) ( TRUCK-AT ?auto_1596385 ?auto_1596387 ) ( not ( = ?auto_1596387 ?auto_1596386 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596385 ?auto_1596387 ?auto_1596386 )
      ( MAKE-1CRATE ?auto_1596382 ?auto_1596383 )
      ( MAKE-1CRATE-VERIFY ?auto_1596382 ?auto_1596383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596388 - SURFACE
      ?auto_1596389 - SURFACE
    )
    :vars
    (
      ?auto_1596393 - HOIST
      ?auto_1596392 - PLACE
      ?auto_1596390 - TRUCK
      ?auto_1596391 - PLACE
      ?auto_1596394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596393 ?auto_1596392 ) ( SURFACE-AT ?auto_1596388 ?auto_1596392 ) ( CLEAR ?auto_1596388 ) ( IS-CRATE ?auto_1596389 ) ( not ( = ?auto_1596388 ?auto_1596389 ) ) ( AVAILABLE ?auto_1596393 ) ( TRUCK-AT ?auto_1596390 ?auto_1596391 ) ( not ( = ?auto_1596391 ?auto_1596392 ) ) ( HOIST-AT ?auto_1596394 ?auto_1596391 ) ( LIFTING ?auto_1596394 ?auto_1596389 ) ( not ( = ?auto_1596393 ?auto_1596394 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596394 ?auto_1596389 ?auto_1596390 ?auto_1596391 )
      ( MAKE-1CRATE ?auto_1596388 ?auto_1596389 )
      ( MAKE-1CRATE-VERIFY ?auto_1596388 ?auto_1596389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596395 - SURFACE
      ?auto_1596396 - SURFACE
    )
    :vars
    (
      ?auto_1596399 - HOIST
      ?auto_1596400 - PLACE
      ?auto_1596398 - TRUCK
      ?auto_1596397 - PLACE
      ?auto_1596401 - HOIST
      ?auto_1596402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596399 ?auto_1596400 ) ( SURFACE-AT ?auto_1596395 ?auto_1596400 ) ( CLEAR ?auto_1596395 ) ( IS-CRATE ?auto_1596396 ) ( not ( = ?auto_1596395 ?auto_1596396 ) ) ( AVAILABLE ?auto_1596399 ) ( TRUCK-AT ?auto_1596398 ?auto_1596397 ) ( not ( = ?auto_1596397 ?auto_1596400 ) ) ( HOIST-AT ?auto_1596401 ?auto_1596397 ) ( not ( = ?auto_1596399 ?auto_1596401 ) ) ( AVAILABLE ?auto_1596401 ) ( SURFACE-AT ?auto_1596396 ?auto_1596397 ) ( ON ?auto_1596396 ?auto_1596402 ) ( CLEAR ?auto_1596396 ) ( not ( = ?auto_1596395 ?auto_1596402 ) ) ( not ( = ?auto_1596396 ?auto_1596402 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1596401 ?auto_1596396 ?auto_1596402 ?auto_1596397 )
      ( MAKE-1CRATE ?auto_1596395 ?auto_1596396 )
      ( MAKE-1CRATE-VERIFY ?auto_1596395 ?auto_1596396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596403 - SURFACE
      ?auto_1596404 - SURFACE
    )
    :vars
    (
      ?auto_1596410 - HOIST
      ?auto_1596407 - PLACE
      ?auto_1596406 - PLACE
      ?auto_1596408 - HOIST
      ?auto_1596405 - SURFACE
      ?auto_1596409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596410 ?auto_1596407 ) ( SURFACE-AT ?auto_1596403 ?auto_1596407 ) ( CLEAR ?auto_1596403 ) ( IS-CRATE ?auto_1596404 ) ( not ( = ?auto_1596403 ?auto_1596404 ) ) ( AVAILABLE ?auto_1596410 ) ( not ( = ?auto_1596406 ?auto_1596407 ) ) ( HOIST-AT ?auto_1596408 ?auto_1596406 ) ( not ( = ?auto_1596410 ?auto_1596408 ) ) ( AVAILABLE ?auto_1596408 ) ( SURFACE-AT ?auto_1596404 ?auto_1596406 ) ( ON ?auto_1596404 ?auto_1596405 ) ( CLEAR ?auto_1596404 ) ( not ( = ?auto_1596403 ?auto_1596405 ) ) ( not ( = ?auto_1596404 ?auto_1596405 ) ) ( TRUCK-AT ?auto_1596409 ?auto_1596407 ) )
    :subtasks
    ( ( !DRIVE ?auto_1596409 ?auto_1596407 ?auto_1596406 )
      ( MAKE-1CRATE ?auto_1596403 ?auto_1596404 )
      ( MAKE-1CRATE-VERIFY ?auto_1596403 ?auto_1596404 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596420 - SURFACE
      ?auto_1596421 - SURFACE
      ?auto_1596422 - SURFACE
    )
    :vars
    (
      ?auto_1596423 - HOIST
      ?auto_1596424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596423 ?auto_1596424 ) ( SURFACE-AT ?auto_1596421 ?auto_1596424 ) ( CLEAR ?auto_1596421 ) ( LIFTING ?auto_1596423 ?auto_1596422 ) ( IS-CRATE ?auto_1596422 ) ( not ( = ?auto_1596421 ?auto_1596422 ) ) ( ON ?auto_1596421 ?auto_1596420 ) ( not ( = ?auto_1596420 ?auto_1596421 ) ) ( not ( = ?auto_1596420 ?auto_1596422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596421 ?auto_1596422 )
      ( MAKE-2CRATE-VERIFY ?auto_1596420 ?auto_1596421 ?auto_1596422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596430 - SURFACE
      ?auto_1596431 - SURFACE
      ?auto_1596432 - SURFACE
    )
    :vars
    (
      ?auto_1596433 - HOIST
      ?auto_1596434 - PLACE
      ?auto_1596435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596433 ?auto_1596434 ) ( SURFACE-AT ?auto_1596431 ?auto_1596434 ) ( CLEAR ?auto_1596431 ) ( IS-CRATE ?auto_1596432 ) ( not ( = ?auto_1596431 ?auto_1596432 ) ) ( TRUCK-AT ?auto_1596435 ?auto_1596434 ) ( AVAILABLE ?auto_1596433 ) ( IN ?auto_1596432 ?auto_1596435 ) ( ON ?auto_1596431 ?auto_1596430 ) ( not ( = ?auto_1596430 ?auto_1596431 ) ) ( not ( = ?auto_1596430 ?auto_1596432 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596431 ?auto_1596432 )
      ( MAKE-2CRATE-VERIFY ?auto_1596430 ?auto_1596431 ?auto_1596432 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596436 - SURFACE
      ?auto_1596437 - SURFACE
    )
    :vars
    (
      ?auto_1596439 - HOIST
      ?auto_1596438 - PLACE
      ?auto_1596440 - TRUCK
      ?auto_1596441 - SURFACE
      ?auto_1596442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596439 ?auto_1596438 ) ( SURFACE-AT ?auto_1596436 ?auto_1596438 ) ( CLEAR ?auto_1596436 ) ( IS-CRATE ?auto_1596437 ) ( not ( = ?auto_1596436 ?auto_1596437 ) ) ( AVAILABLE ?auto_1596439 ) ( IN ?auto_1596437 ?auto_1596440 ) ( ON ?auto_1596436 ?auto_1596441 ) ( not ( = ?auto_1596441 ?auto_1596436 ) ) ( not ( = ?auto_1596441 ?auto_1596437 ) ) ( TRUCK-AT ?auto_1596440 ?auto_1596442 ) ( not ( = ?auto_1596442 ?auto_1596438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596440 ?auto_1596442 ?auto_1596438 )
      ( MAKE-2CRATE ?auto_1596441 ?auto_1596436 ?auto_1596437 )
      ( MAKE-1CRATE-VERIFY ?auto_1596436 ?auto_1596437 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596443 - SURFACE
      ?auto_1596444 - SURFACE
      ?auto_1596445 - SURFACE
    )
    :vars
    (
      ?auto_1596446 - HOIST
      ?auto_1596447 - PLACE
      ?auto_1596448 - TRUCK
      ?auto_1596449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596446 ?auto_1596447 ) ( SURFACE-AT ?auto_1596444 ?auto_1596447 ) ( CLEAR ?auto_1596444 ) ( IS-CRATE ?auto_1596445 ) ( not ( = ?auto_1596444 ?auto_1596445 ) ) ( AVAILABLE ?auto_1596446 ) ( IN ?auto_1596445 ?auto_1596448 ) ( ON ?auto_1596444 ?auto_1596443 ) ( not ( = ?auto_1596443 ?auto_1596444 ) ) ( not ( = ?auto_1596443 ?auto_1596445 ) ) ( TRUCK-AT ?auto_1596448 ?auto_1596449 ) ( not ( = ?auto_1596449 ?auto_1596447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596444 ?auto_1596445 )
      ( MAKE-2CRATE-VERIFY ?auto_1596443 ?auto_1596444 ?auto_1596445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596450 - SURFACE
      ?auto_1596451 - SURFACE
    )
    :vars
    (
      ?auto_1596455 - HOIST
      ?auto_1596452 - PLACE
      ?auto_1596453 - SURFACE
      ?auto_1596454 - TRUCK
      ?auto_1596456 - PLACE
      ?auto_1596457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596455 ?auto_1596452 ) ( SURFACE-AT ?auto_1596450 ?auto_1596452 ) ( CLEAR ?auto_1596450 ) ( IS-CRATE ?auto_1596451 ) ( not ( = ?auto_1596450 ?auto_1596451 ) ) ( AVAILABLE ?auto_1596455 ) ( ON ?auto_1596450 ?auto_1596453 ) ( not ( = ?auto_1596453 ?auto_1596450 ) ) ( not ( = ?auto_1596453 ?auto_1596451 ) ) ( TRUCK-AT ?auto_1596454 ?auto_1596456 ) ( not ( = ?auto_1596456 ?auto_1596452 ) ) ( HOIST-AT ?auto_1596457 ?auto_1596456 ) ( LIFTING ?auto_1596457 ?auto_1596451 ) ( not ( = ?auto_1596455 ?auto_1596457 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596457 ?auto_1596451 ?auto_1596454 ?auto_1596456 )
      ( MAKE-2CRATE ?auto_1596453 ?auto_1596450 ?auto_1596451 )
      ( MAKE-1CRATE-VERIFY ?auto_1596450 ?auto_1596451 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596458 - SURFACE
      ?auto_1596459 - SURFACE
      ?auto_1596460 - SURFACE
    )
    :vars
    (
      ?auto_1596462 - HOIST
      ?auto_1596465 - PLACE
      ?auto_1596461 - TRUCK
      ?auto_1596463 - PLACE
      ?auto_1596464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596462 ?auto_1596465 ) ( SURFACE-AT ?auto_1596459 ?auto_1596465 ) ( CLEAR ?auto_1596459 ) ( IS-CRATE ?auto_1596460 ) ( not ( = ?auto_1596459 ?auto_1596460 ) ) ( AVAILABLE ?auto_1596462 ) ( ON ?auto_1596459 ?auto_1596458 ) ( not ( = ?auto_1596458 ?auto_1596459 ) ) ( not ( = ?auto_1596458 ?auto_1596460 ) ) ( TRUCK-AT ?auto_1596461 ?auto_1596463 ) ( not ( = ?auto_1596463 ?auto_1596465 ) ) ( HOIST-AT ?auto_1596464 ?auto_1596463 ) ( LIFTING ?auto_1596464 ?auto_1596460 ) ( not ( = ?auto_1596462 ?auto_1596464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596459 ?auto_1596460 )
      ( MAKE-2CRATE-VERIFY ?auto_1596458 ?auto_1596459 ?auto_1596460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596466 - SURFACE
      ?auto_1596467 - SURFACE
    )
    :vars
    (
      ?auto_1596473 - HOIST
      ?auto_1596472 - PLACE
      ?auto_1596468 - SURFACE
      ?auto_1596469 - TRUCK
      ?auto_1596470 - PLACE
      ?auto_1596471 - HOIST
      ?auto_1596474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596473 ?auto_1596472 ) ( SURFACE-AT ?auto_1596466 ?auto_1596472 ) ( CLEAR ?auto_1596466 ) ( IS-CRATE ?auto_1596467 ) ( not ( = ?auto_1596466 ?auto_1596467 ) ) ( AVAILABLE ?auto_1596473 ) ( ON ?auto_1596466 ?auto_1596468 ) ( not ( = ?auto_1596468 ?auto_1596466 ) ) ( not ( = ?auto_1596468 ?auto_1596467 ) ) ( TRUCK-AT ?auto_1596469 ?auto_1596470 ) ( not ( = ?auto_1596470 ?auto_1596472 ) ) ( HOIST-AT ?auto_1596471 ?auto_1596470 ) ( not ( = ?auto_1596473 ?auto_1596471 ) ) ( AVAILABLE ?auto_1596471 ) ( SURFACE-AT ?auto_1596467 ?auto_1596470 ) ( ON ?auto_1596467 ?auto_1596474 ) ( CLEAR ?auto_1596467 ) ( not ( = ?auto_1596466 ?auto_1596474 ) ) ( not ( = ?auto_1596467 ?auto_1596474 ) ) ( not ( = ?auto_1596468 ?auto_1596474 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1596471 ?auto_1596467 ?auto_1596474 ?auto_1596470 )
      ( MAKE-2CRATE ?auto_1596468 ?auto_1596466 ?auto_1596467 )
      ( MAKE-1CRATE-VERIFY ?auto_1596466 ?auto_1596467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596475 - SURFACE
      ?auto_1596476 - SURFACE
      ?auto_1596477 - SURFACE
    )
    :vars
    (
      ?auto_1596480 - HOIST
      ?auto_1596479 - PLACE
      ?auto_1596483 - TRUCK
      ?auto_1596478 - PLACE
      ?auto_1596481 - HOIST
      ?auto_1596482 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596480 ?auto_1596479 ) ( SURFACE-AT ?auto_1596476 ?auto_1596479 ) ( CLEAR ?auto_1596476 ) ( IS-CRATE ?auto_1596477 ) ( not ( = ?auto_1596476 ?auto_1596477 ) ) ( AVAILABLE ?auto_1596480 ) ( ON ?auto_1596476 ?auto_1596475 ) ( not ( = ?auto_1596475 ?auto_1596476 ) ) ( not ( = ?auto_1596475 ?auto_1596477 ) ) ( TRUCK-AT ?auto_1596483 ?auto_1596478 ) ( not ( = ?auto_1596478 ?auto_1596479 ) ) ( HOIST-AT ?auto_1596481 ?auto_1596478 ) ( not ( = ?auto_1596480 ?auto_1596481 ) ) ( AVAILABLE ?auto_1596481 ) ( SURFACE-AT ?auto_1596477 ?auto_1596478 ) ( ON ?auto_1596477 ?auto_1596482 ) ( CLEAR ?auto_1596477 ) ( not ( = ?auto_1596476 ?auto_1596482 ) ) ( not ( = ?auto_1596477 ?auto_1596482 ) ) ( not ( = ?auto_1596475 ?auto_1596482 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596476 ?auto_1596477 )
      ( MAKE-2CRATE-VERIFY ?auto_1596475 ?auto_1596476 ?auto_1596477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596484 - SURFACE
      ?auto_1596485 - SURFACE
    )
    :vars
    (
      ?auto_1596486 - HOIST
      ?auto_1596492 - PLACE
      ?auto_1596489 - SURFACE
      ?auto_1596487 - PLACE
      ?auto_1596488 - HOIST
      ?auto_1596490 - SURFACE
      ?auto_1596491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596486 ?auto_1596492 ) ( SURFACE-AT ?auto_1596484 ?auto_1596492 ) ( CLEAR ?auto_1596484 ) ( IS-CRATE ?auto_1596485 ) ( not ( = ?auto_1596484 ?auto_1596485 ) ) ( AVAILABLE ?auto_1596486 ) ( ON ?auto_1596484 ?auto_1596489 ) ( not ( = ?auto_1596489 ?auto_1596484 ) ) ( not ( = ?auto_1596489 ?auto_1596485 ) ) ( not ( = ?auto_1596487 ?auto_1596492 ) ) ( HOIST-AT ?auto_1596488 ?auto_1596487 ) ( not ( = ?auto_1596486 ?auto_1596488 ) ) ( AVAILABLE ?auto_1596488 ) ( SURFACE-AT ?auto_1596485 ?auto_1596487 ) ( ON ?auto_1596485 ?auto_1596490 ) ( CLEAR ?auto_1596485 ) ( not ( = ?auto_1596484 ?auto_1596490 ) ) ( not ( = ?auto_1596485 ?auto_1596490 ) ) ( not ( = ?auto_1596489 ?auto_1596490 ) ) ( TRUCK-AT ?auto_1596491 ?auto_1596492 ) )
    :subtasks
    ( ( !DRIVE ?auto_1596491 ?auto_1596492 ?auto_1596487 )
      ( MAKE-2CRATE ?auto_1596489 ?auto_1596484 ?auto_1596485 )
      ( MAKE-1CRATE-VERIFY ?auto_1596484 ?auto_1596485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596493 - SURFACE
      ?auto_1596494 - SURFACE
      ?auto_1596495 - SURFACE
    )
    :vars
    (
      ?auto_1596499 - HOIST
      ?auto_1596498 - PLACE
      ?auto_1596496 - PLACE
      ?auto_1596497 - HOIST
      ?auto_1596501 - SURFACE
      ?auto_1596500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596499 ?auto_1596498 ) ( SURFACE-AT ?auto_1596494 ?auto_1596498 ) ( CLEAR ?auto_1596494 ) ( IS-CRATE ?auto_1596495 ) ( not ( = ?auto_1596494 ?auto_1596495 ) ) ( AVAILABLE ?auto_1596499 ) ( ON ?auto_1596494 ?auto_1596493 ) ( not ( = ?auto_1596493 ?auto_1596494 ) ) ( not ( = ?auto_1596493 ?auto_1596495 ) ) ( not ( = ?auto_1596496 ?auto_1596498 ) ) ( HOIST-AT ?auto_1596497 ?auto_1596496 ) ( not ( = ?auto_1596499 ?auto_1596497 ) ) ( AVAILABLE ?auto_1596497 ) ( SURFACE-AT ?auto_1596495 ?auto_1596496 ) ( ON ?auto_1596495 ?auto_1596501 ) ( CLEAR ?auto_1596495 ) ( not ( = ?auto_1596494 ?auto_1596501 ) ) ( not ( = ?auto_1596495 ?auto_1596501 ) ) ( not ( = ?auto_1596493 ?auto_1596501 ) ) ( TRUCK-AT ?auto_1596500 ?auto_1596498 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596494 ?auto_1596495 )
      ( MAKE-2CRATE-VERIFY ?auto_1596493 ?auto_1596494 ?auto_1596495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596502 - SURFACE
      ?auto_1596503 - SURFACE
    )
    :vars
    (
      ?auto_1596506 - HOIST
      ?auto_1596507 - PLACE
      ?auto_1596505 - SURFACE
      ?auto_1596510 - PLACE
      ?auto_1596504 - HOIST
      ?auto_1596509 - SURFACE
      ?auto_1596508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596506 ?auto_1596507 ) ( IS-CRATE ?auto_1596503 ) ( not ( = ?auto_1596502 ?auto_1596503 ) ) ( not ( = ?auto_1596505 ?auto_1596502 ) ) ( not ( = ?auto_1596505 ?auto_1596503 ) ) ( not ( = ?auto_1596510 ?auto_1596507 ) ) ( HOIST-AT ?auto_1596504 ?auto_1596510 ) ( not ( = ?auto_1596506 ?auto_1596504 ) ) ( AVAILABLE ?auto_1596504 ) ( SURFACE-AT ?auto_1596503 ?auto_1596510 ) ( ON ?auto_1596503 ?auto_1596509 ) ( CLEAR ?auto_1596503 ) ( not ( = ?auto_1596502 ?auto_1596509 ) ) ( not ( = ?auto_1596503 ?auto_1596509 ) ) ( not ( = ?auto_1596505 ?auto_1596509 ) ) ( TRUCK-AT ?auto_1596508 ?auto_1596507 ) ( SURFACE-AT ?auto_1596505 ?auto_1596507 ) ( CLEAR ?auto_1596505 ) ( LIFTING ?auto_1596506 ?auto_1596502 ) ( IS-CRATE ?auto_1596502 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596505 ?auto_1596502 )
      ( MAKE-2CRATE ?auto_1596505 ?auto_1596502 ?auto_1596503 )
      ( MAKE-1CRATE-VERIFY ?auto_1596502 ?auto_1596503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596511 - SURFACE
      ?auto_1596512 - SURFACE
      ?auto_1596513 - SURFACE
    )
    :vars
    (
      ?auto_1596515 - HOIST
      ?auto_1596519 - PLACE
      ?auto_1596517 - PLACE
      ?auto_1596518 - HOIST
      ?auto_1596516 - SURFACE
      ?auto_1596514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596515 ?auto_1596519 ) ( IS-CRATE ?auto_1596513 ) ( not ( = ?auto_1596512 ?auto_1596513 ) ) ( not ( = ?auto_1596511 ?auto_1596512 ) ) ( not ( = ?auto_1596511 ?auto_1596513 ) ) ( not ( = ?auto_1596517 ?auto_1596519 ) ) ( HOIST-AT ?auto_1596518 ?auto_1596517 ) ( not ( = ?auto_1596515 ?auto_1596518 ) ) ( AVAILABLE ?auto_1596518 ) ( SURFACE-AT ?auto_1596513 ?auto_1596517 ) ( ON ?auto_1596513 ?auto_1596516 ) ( CLEAR ?auto_1596513 ) ( not ( = ?auto_1596512 ?auto_1596516 ) ) ( not ( = ?auto_1596513 ?auto_1596516 ) ) ( not ( = ?auto_1596511 ?auto_1596516 ) ) ( TRUCK-AT ?auto_1596514 ?auto_1596519 ) ( SURFACE-AT ?auto_1596511 ?auto_1596519 ) ( CLEAR ?auto_1596511 ) ( LIFTING ?auto_1596515 ?auto_1596512 ) ( IS-CRATE ?auto_1596512 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596512 ?auto_1596513 )
      ( MAKE-2CRATE-VERIFY ?auto_1596511 ?auto_1596512 ?auto_1596513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596520 - SURFACE
      ?auto_1596521 - SURFACE
    )
    :vars
    (
      ?auto_1596524 - HOIST
      ?auto_1596523 - PLACE
      ?auto_1596525 - SURFACE
      ?auto_1596528 - PLACE
      ?auto_1596522 - HOIST
      ?auto_1596527 - SURFACE
      ?auto_1596526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596524 ?auto_1596523 ) ( IS-CRATE ?auto_1596521 ) ( not ( = ?auto_1596520 ?auto_1596521 ) ) ( not ( = ?auto_1596525 ?auto_1596520 ) ) ( not ( = ?auto_1596525 ?auto_1596521 ) ) ( not ( = ?auto_1596528 ?auto_1596523 ) ) ( HOIST-AT ?auto_1596522 ?auto_1596528 ) ( not ( = ?auto_1596524 ?auto_1596522 ) ) ( AVAILABLE ?auto_1596522 ) ( SURFACE-AT ?auto_1596521 ?auto_1596528 ) ( ON ?auto_1596521 ?auto_1596527 ) ( CLEAR ?auto_1596521 ) ( not ( = ?auto_1596520 ?auto_1596527 ) ) ( not ( = ?auto_1596521 ?auto_1596527 ) ) ( not ( = ?auto_1596525 ?auto_1596527 ) ) ( TRUCK-AT ?auto_1596526 ?auto_1596523 ) ( SURFACE-AT ?auto_1596525 ?auto_1596523 ) ( CLEAR ?auto_1596525 ) ( IS-CRATE ?auto_1596520 ) ( AVAILABLE ?auto_1596524 ) ( IN ?auto_1596520 ?auto_1596526 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1596524 ?auto_1596520 ?auto_1596526 ?auto_1596523 )
      ( MAKE-2CRATE ?auto_1596525 ?auto_1596520 ?auto_1596521 )
      ( MAKE-1CRATE-VERIFY ?auto_1596520 ?auto_1596521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596529 - SURFACE
      ?auto_1596530 - SURFACE
      ?auto_1596531 - SURFACE
    )
    :vars
    (
      ?auto_1596534 - HOIST
      ?auto_1596532 - PLACE
      ?auto_1596533 - PLACE
      ?auto_1596537 - HOIST
      ?auto_1596536 - SURFACE
      ?auto_1596535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596534 ?auto_1596532 ) ( IS-CRATE ?auto_1596531 ) ( not ( = ?auto_1596530 ?auto_1596531 ) ) ( not ( = ?auto_1596529 ?auto_1596530 ) ) ( not ( = ?auto_1596529 ?auto_1596531 ) ) ( not ( = ?auto_1596533 ?auto_1596532 ) ) ( HOIST-AT ?auto_1596537 ?auto_1596533 ) ( not ( = ?auto_1596534 ?auto_1596537 ) ) ( AVAILABLE ?auto_1596537 ) ( SURFACE-AT ?auto_1596531 ?auto_1596533 ) ( ON ?auto_1596531 ?auto_1596536 ) ( CLEAR ?auto_1596531 ) ( not ( = ?auto_1596530 ?auto_1596536 ) ) ( not ( = ?auto_1596531 ?auto_1596536 ) ) ( not ( = ?auto_1596529 ?auto_1596536 ) ) ( TRUCK-AT ?auto_1596535 ?auto_1596532 ) ( SURFACE-AT ?auto_1596529 ?auto_1596532 ) ( CLEAR ?auto_1596529 ) ( IS-CRATE ?auto_1596530 ) ( AVAILABLE ?auto_1596534 ) ( IN ?auto_1596530 ?auto_1596535 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596530 ?auto_1596531 )
      ( MAKE-2CRATE-VERIFY ?auto_1596529 ?auto_1596530 ?auto_1596531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596574 - SURFACE
      ?auto_1596575 - SURFACE
    )
    :vars
    (
      ?auto_1596579 - HOIST
      ?auto_1596578 - PLACE
      ?auto_1596576 - SURFACE
      ?auto_1596577 - PLACE
      ?auto_1596580 - HOIST
      ?auto_1596581 - SURFACE
      ?auto_1596582 - TRUCK
      ?auto_1596583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596579 ?auto_1596578 ) ( SURFACE-AT ?auto_1596574 ?auto_1596578 ) ( CLEAR ?auto_1596574 ) ( IS-CRATE ?auto_1596575 ) ( not ( = ?auto_1596574 ?auto_1596575 ) ) ( AVAILABLE ?auto_1596579 ) ( ON ?auto_1596574 ?auto_1596576 ) ( not ( = ?auto_1596576 ?auto_1596574 ) ) ( not ( = ?auto_1596576 ?auto_1596575 ) ) ( not ( = ?auto_1596577 ?auto_1596578 ) ) ( HOIST-AT ?auto_1596580 ?auto_1596577 ) ( not ( = ?auto_1596579 ?auto_1596580 ) ) ( AVAILABLE ?auto_1596580 ) ( SURFACE-AT ?auto_1596575 ?auto_1596577 ) ( ON ?auto_1596575 ?auto_1596581 ) ( CLEAR ?auto_1596575 ) ( not ( = ?auto_1596574 ?auto_1596581 ) ) ( not ( = ?auto_1596575 ?auto_1596581 ) ) ( not ( = ?auto_1596576 ?auto_1596581 ) ) ( TRUCK-AT ?auto_1596582 ?auto_1596583 ) ( not ( = ?auto_1596583 ?auto_1596578 ) ) ( not ( = ?auto_1596577 ?auto_1596583 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596582 ?auto_1596583 ?auto_1596578 )
      ( MAKE-1CRATE ?auto_1596574 ?auto_1596575 )
      ( MAKE-1CRATE-VERIFY ?auto_1596574 ?auto_1596575 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596614 - SURFACE
      ?auto_1596615 - SURFACE
      ?auto_1596616 - SURFACE
      ?auto_1596613 - SURFACE
    )
    :vars
    (
      ?auto_1596618 - HOIST
      ?auto_1596617 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596618 ?auto_1596617 ) ( SURFACE-AT ?auto_1596616 ?auto_1596617 ) ( CLEAR ?auto_1596616 ) ( LIFTING ?auto_1596618 ?auto_1596613 ) ( IS-CRATE ?auto_1596613 ) ( not ( = ?auto_1596616 ?auto_1596613 ) ) ( ON ?auto_1596615 ?auto_1596614 ) ( ON ?auto_1596616 ?auto_1596615 ) ( not ( = ?auto_1596614 ?auto_1596615 ) ) ( not ( = ?auto_1596614 ?auto_1596616 ) ) ( not ( = ?auto_1596614 ?auto_1596613 ) ) ( not ( = ?auto_1596615 ?auto_1596616 ) ) ( not ( = ?auto_1596615 ?auto_1596613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596616 ?auto_1596613 )
      ( MAKE-3CRATE-VERIFY ?auto_1596614 ?auto_1596615 ?auto_1596616 ?auto_1596613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596631 - SURFACE
      ?auto_1596632 - SURFACE
      ?auto_1596633 - SURFACE
      ?auto_1596630 - SURFACE
    )
    :vars
    (
      ?auto_1596636 - HOIST
      ?auto_1596634 - PLACE
      ?auto_1596635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596636 ?auto_1596634 ) ( SURFACE-AT ?auto_1596633 ?auto_1596634 ) ( CLEAR ?auto_1596633 ) ( IS-CRATE ?auto_1596630 ) ( not ( = ?auto_1596633 ?auto_1596630 ) ) ( TRUCK-AT ?auto_1596635 ?auto_1596634 ) ( AVAILABLE ?auto_1596636 ) ( IN ?auto_1596630 ?auto_1596635 ) ( ON ?auto_1596633 ?auto_1596632 ) ( not ( = ?auto_1596632 ?auto_1596633 ) ) ( not ( = ?auto_1596632 ?auto_1596630 ) ) ( ON ?auto_1596632 ?auto_1596631 ) ( not ( = ?auto_1596631 ?auto_1596632 ) ) ( not ( = ?auto_1596631 ?auto_1596633 ) ) ( not ( = ?auto_1596631 ?auto_1596630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596632 ?auto_1596633 ?auto_1596630 )
      ( MAKE-3CRATE-VERIFY ?auto_1596631 ?auto_1596632 ?auto_1596633 ?auto_1596630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596652 - SURFACE
      ?auto_1596653 - SURFACE
      ?auto_1596654 - SURFACE
      ?auto_1596651 - SURFACE
    )
    :vars
    (
      ?auto_1596656 - HOIST
      ?auto_1596658 - PLACE
      ?auto_1596655 - TRUCK
      ?auto_1596657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596656 ?auto_1596658 ) ( SURFACE-AT ?auto_1596654 ?auto_1596658 ) ( CLEAR ?auto_1596654 ) ( IS-CRATE ?auto_1596651 ) ( not ( = ?auto_1596654 ?auto_1596651 ) ) ( AVAILABLE ?auto_1596656 ) ( IN ?auto_1596651 ?auto_1596655 ) ( ON ?auto_1596654 ?auto_1596653 ) ( not ( = ?auto_1596653 ?auto_1596654 ) ) ( not ( = ?auto_1596653 ?auto_1596651 ) ) ( TRUCK-AT ?auto_1596655 ?auto_1596657 ) ( not ( = ?auto_1596657 ?auto_1596658 ) ) ( ON ?auto_1596653 ?auto_1596652 ) ( not ( = ?auto_1596652 ?auto_1596653 ) ) ( not ( = ?auto_1596652 ?auto_1596654 ) ) ( not ( = ?auto_1596652 ?auto_1596651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596653 ?auto_1596654 ?auto_1596651 )
      ( MAKE-3CRATE-VERIFY ?auto_1596652 ?auto_1596653 ?auto_1596654 ?auto_1596651 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596676 - SURFACE
      ?auto_1596677 - SURFACE
      ?auto_1596678 - SURFACE
      ?auto_1596675 - SURFACE
    )
    :vars
    (
      ?auto_1596679 - HOIST
      ?auto_1596681 - PLACE
      ?auto_1596680 - TRUCK
      ?auto_1596682 - PLACE
      ?auto_1596683 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596679 ?auto_1596681 ) ( SURFACE-AT ?auto_1596678 ?auto_1596681 ) ( CLEAR ?auto_1596678 ) ( IS-CRATE ?auto_1596675 ) ( not ( = ?auto_1596678 ?auto_1596675 ) ) ( AVAILABLE ?auto_1596679 ) ( ON ?auto_1596678 ?auto_1596677 ) ( not ( = ?auto_1596677 ?auto_1596678 ) ) ( not ( = ?auto_1596677 ?auto_1596675 ) ) ( TRUCK-AT ?auto_1596680 ?auto_1596682 ) ( not ( = ?auto_1596682 ?auto_1596681 ) ) ( HOIST-AT ?auto_1596683 ?auto_1596682 ) ( LIFTING ?auto_1596683 ?auto_1596675 ) ( not ( = ?auto_1596679 ?auto_1596683 ) ) ( ON ?auto_1596677 ?auto_1596676 ) ( not ( = ?auto_1596676 ?auto_1596677 ) ) ( not ( = ?auto_1596676 ?auto_1596678 ) ) ( not ( = ?auto_1596676 ?auto_1596675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596677 ?auto_1596678 ?auto_1596675 )
      ( MAKE-3CRATE-VERIFY ?auto_1596676 ?auto_1596677 ?auto_1596678 ?auto_1596675 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596703 - SURFACE
      ?auto_1596704 - SURFACE
      ?auto_1596705 - SURFACE
      ?auto_1596702 - SURFACE
    )
    :vars
    (
      ?auto_1596709 - HOIST
      ?auto_1596711 - PLACE
      ?auto_1596707 - TRUCK
      ?auto_1596708 - PLACE
      ?auto_1596710 - HOIST
      ?auto_1596706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596709 ?auto_1596711 ) ( SURFACE-AT ?auto_1596705 ?auto_1596711 ) ( CLEAR ?auto_1596705 ) ( IS-CRATE ?auto_1596702 ) ( not ( = ?auto_1596705 ?auto_1596702 ) ) ( AVAILABLE ?auto_1596709 ) ( ON ?auto_1596705 ?auto_1596704 ) ( not ( = ?auto_1596704 ?auto_1596705 ) ) ( not ( = ?auto_1596704 ?auto_1596702 ) ) ( TRUCK-AT ?auto_1596707 ?auto_1596708 ) ( not ( = ?auto_1596708 ?auto_1596711 ) ) ( HOIST-AT ?auto_1596710 ?auto_1596708 ) ( not ( = ?auto_1596709 ?auto_1596710 ) ) ( AVAILABLE ?auto_1596710 ) ( SURFACE-AT ?auto_1596702 ?auto_1596708 ) ( ON ?auto_1596702 ?auto_1596706 ) ( CLEAR ?auto_1596702 ) ( not ( = ?auto_1596705 ?auto_1596706 ) ) ( not ( = ?auto_1596702 ?auto_1596706 ) ) ( not ( = ?auto_1596704 ?auto_1596706 ) ) ( ON ?auto_1596704 ?auto_1596703 ) ( not ( = ?auto_1596703 ?auto_1596704 ) ) ( not ( = ?auto_1596703 ?auto_1596705 ) ) ( not ( = ?auto_1596703 ?auto_1596702 ) ) ( not ( = ?auto_1596703 ?auto_1596706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596704 ?auto_1596705 ?auto_1596702 )
      ( MAKE-3CRATE-VERIFY ?auto_1596703 ?auto_1596704 ?auto_1596705 ?auto_1596702 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596731 - SURFACE
      ?auto_1596732 - SURFACE
      ?auto_1596733 - SURFACE
      ?auto_1596730 - SURFACE
    )
    :vars
    (
      ?auto_1596735 - HOIST
      ?auto_1596738 - PLACE
      ?auto_1596737 - PLACE
      ?auto_1596736 - HOIST
      ?auto_1596739 - SURFACE
      ?auto_1596734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596735 ?auto_1596738 ) ( SURFACE-AT ?auto_1596733 ?auto_1596738 ) ( CLEAR ?auto_1596733 ) ( IS-CRATE ?auto_1596730 ) ( not ( = ?auto_1596733 ?auto_1596730 ) ) ( AVAILABLE ?auto_1596735 ) ( ON ?auto_1596733 ?auto_1596732 ) ( not ( = ?auto_1596732 ?auto_1596733 ) ) ( not ( = ?auto_1596732 ?auto_1596730 ) ) ( not ( = ?auto_1596737 ?auto_1596738 ) ) ( HOIST-AT ?auto_1596736 ?auto_1596737 ) ( not ( = ?auto_1596735 ?auto_1596736 ) ) ( AVAILABLE ?auto_1596736 ) ( SURFACE-AT ?auto_1596730 ?auto_1596737 ) ( ON ?auto_1596730 ?auto_1596739 ) ( CLEAR ?auto_1596730 ) ( not ( = ?auto_1596733 ?auto_1596739 ) ) ( not ( = ?auto_1596730 ?auto_1596739 ) ) ( not ( = ?auto_1596732 ?auto_1596739 ) ) ( TRUCK-AT ?auto_1596734 ?auto_1596738 ) ( ON ?auto_1596732 ?auto_1596731 ) ( not ( = ?auto_1596731 ?auto_1596732 ) ) ( not ( = ?auto_1596731 ?auto_1596733 ) ) ( not ( = ?auto_1596731 ?auto_1596730 ) ) ( not ( = ?auto_1596731 ?auto_1596739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596732 ?auto_1596733 ?auto_1596730 )
      ( MAKE-3CRATE-VERIFY ?auto_1596731 ?auto_1596732 ?auto_1596733 ?auto_1596730 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596759 - SURFACE
      ?auto_1596760 - SURFACE
      ?auto_1596761 - SURFACE
      ?auto_1596758 - SURFACE
    )
    :vars
    (
      ?auto_1596767 - HOIST
      ?auto_1596765 - PLACE
      ?auto_1596764 - PLACE
      ?auto_1596762 - HOIST
      ?auto_1596763 - SURFACE
      ?auto_1596766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596767 ?auto_1596765 ) ( IS-CRATE ?auto_1596758 ) ( not ( = ?auto_1596761 ?auto_1596758 ) ) ( not ( = ?auto_1596760 ?auto_1596761 ) ) ( not ( = ?auto_1596760 ?auto_1596758 ) ) ( not ( = ?auto_1596764 ?auto_1596765 ) ) ( HOIST-AT ?auto_1596762 ?auto_1596764 ) ( not ( = ?auto_1596767 ?auto_1596762 ) ) ( AVAILABLE ?auto_1596762 ) ( SURFACE-AT ?auto_1596758 ?auto_1596764 ) ( ON ?auto_1596758 ?auto_1596763 ) ( CLEAR ?auto_1596758 ) ( not ( = ?auto_1596761 ?auto_1596763 ) ) ( not ( = ?auto_1596758 ?auto_1596763 ) ) ( not ( = ?auto_1596760 ?auto_1596763 ) ) ( TRUCK-AT ?auto_1596766 ?auto_1596765 ) ( SURFACE-AT ?auto_1596760 ?auto_1596765 ) ( CLEAR ?auto_1596760 ) ( LIFTING ?auto_1596767 ?auto_1596761 ) ( IS-CRATE ?auto_1596761 ) ( ON ?auto_1596760 ?auto_1596759 ) ( not ( = ?auto_1596759 ?auto_1596760 ) ) ( not ( = ?auto_1596759 ?auto_1596761 ) ) ( not ( = ?auto_1596759 ?auto_1596758 ) ) ( not ( = ?auto_1596759 ?auto_1596763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596760 ?auto_1596761 ?auto_1596758 )
      ( MAKE-3CRATE-VERIFY ?auto_1596759 ?auto_1596760 ?auto_1596761 ?auto_1596758 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596787 - SURFACE
      ?auto_1596788 - SURFACE
      ?auto_1596789 - SURFACE
      ?auto_1596786 - SURFACE
    )
    :vars
    (
      ?auto_1596793 - HOIST
      ?auto_1596795 - PLACE
      ?auto_1596791 - PLACE
      ?auto_1596790 - HOIST
      ?auto_1596794 - SURFACE
      ?auto_1596792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596793 ?auto_1596795 ) ( IS-CRATE ?auto_1596786 ) ( not ( = ?auto_1596789 ?auto_1596786 ) ) ( not ( = ?auto_1596788 ?auto_1596789 ) ) ( not ( = ?auto_1596788 ?auto_1596786 ) ) ( not ( = ?auto_1596791 ?auto_1596795 ) ) ( HOIST-AT ?auto_1596790 ?auto_1596791 ) ( not ( = ?auto_1596793 ?auto_1596790 ) ) ( AVAILABLE ?auto_1596790 ) ( SURFACE-AT ?auto_1596786 ?auto_1596791 ) ( ON ?auto_1596786 ?auto_1596794 ) ( CLEAR ?auto_1596786 ) ( not ( = ?auto_1596789 ?auto_1596794 ) ) ( not ( = ?auto_1596786 ?auto_1596794 ) ) ( not ( = ?auto_1596788 ?auto_1596794 ) ) ( TRUCK-AT ?auto_1596792 ?auto_1596795 ) ( SURFACE-AT ?auto_1596788 ?auto_1596795 ) ( CLEAR ?auto_1596788 ) ( IS-CRATE ?auto_1596789 ) ( AVAILABLE ?auto_1596793 ) ( IN ?auto_1596789 ?auto_1596792 ) ( ON ?auto_1596788 ?auto_1596787 ) ( not ( = ?auto_1596787 ?auto_1596788 ) ) ( not ( = ?auto_1596787 ?auto_1596789 ) ) ( not ( = ?auto_1596787 ?auto_1596786 ) ) ( not ( = ?auto_1596787 ?auto_1596794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596788 ?auto_1596789 ?auto_1596786 )
      ( MAKE-3CRATE-VERIFY ?auto_1596787 ?auto_1596788 ?auto_1596789 ?auto_1596786 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597078 - SURFACE
      ?auto_1597079 - SURFACE
      ?auto_1597080 - SURFACE
      ?auto_1597077 - SURFACE
      ?auto_1597081 - SURFACE
    )
    :vars
    (
      ?auto_1597083 - HOIST
      ?auto_1597082 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597083 ?auto_1597082 ) ( SURFACE-AT ?auto_1597077 ?auto_1597082 ) ( CLEAR ?auto_1597077 ) ( LIFTING ?auto_1597083 ?auto_1597081 ) ( IS-CRATE ?auto_1597081 ) ( not ( = ?auto_1597077 ?auto_1597081 ) ) ( ON ?auto_1597079 ?auto_1597078 ) ( ON ?auto_1597080 ?auto_1597079 ) ( ON ?auto_1597077 ?auto_1597080 ) ( not ( = ?auto_1597078 ?auto_1597079 ) ) ( not ( = ?auto_1597078 ?auto_1597080 ) ) ( not ( = ?auto_1597078 ?auto_1597077 ) ) ( not ( = ?auto_1597078 ?auto_1597081 ) ) ( not ( = ?auto_1597079 ?auto_1597080 ) ) ( not ( = ?auto_1597079 ?auto_1597077 ) ) ( not ( = ?auto_1597079 ?auto_1597081 ) ) ( not ( = ?auto_1597080 ?auto_1597077 ) ) ( not ( = ?auto_1597080 ?auto_1597081 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1597077 ?auto_1597081 )
      ( MAKE-4CRATE-VERIFY ?auto_1597078 ?auto_1597079 ?auto_1597080 ?auto_1597077 ?auto_1597081 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597103 - SURFACE
      ?auto_1597104 - SURFACE
      ?auto_1597105 - SURFACE
      ?auto_1597102 - SURFACE
      ?auto_1597106 - SURFACE
    )
    :vars
    (
      ?auto_1597109 - HOIST
      ?auto_1597108 - PLACE
      ?auto_1597107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597109 ?auto_1597108 ) ( SURFACE-AT ?auto_1597102 ?auto_1597108 ) ( CLEAR ?auto_1597102 ) ( IS-CRATE ?auto_1597106 ) ( not ( = ?auto_1597102 ?auto_1597106 ) ) ( TRUCK-AT ?auto_1597107 ?auto_1597108 ) ( AVAILABLE ?auto_1597109 ) ( IN ?auto_1597106 ?auto_1597107 ) ( ON ?auto_1597102 ?auto_1597105 ) ( not ( = ?auto_1597105 ?auto_1597102 ) ) ( not ( = ?auto_1597105 ?auto_1597106 ) ) ( ON ?auto_1597104 ?auto_1597103 ) ( ON ?auto_1597105 ?auto_1597104 ) ( not ( = ?auto_1597103 ?auto_1597104 ) ) ( not ( = ?auto_1597103 ?auto_1597105 ) ) ( not ( = ?auto_1597103 ?auto_1597102 ) ) ( not ( = ?auto_1597103 ?auto_1597106 ) ) ( not ( = ?auto_1597104 ?auto_1597105 ) ) ( not ( = ?auto_1597104 ?auto_1597102 ) ) ( not ( = ?auto_1597104 ?auto_1597106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597105 ?auto_1597102 ?auto_1597106 )
      ( MAKE-4CRATE-VERIFY ?auto_1597103 ?auto_1597104 ?auto_1597105 ?auto_1597102 ?auto_1597106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597133 - SURFACE
      ?auto_1597134 - SURFACE
      ?auto_1597135 - SURFACE
      ?auto_1597132 - SURFACE
      ?auto_1597136 - SURFACE
    )
    :vars
    (
      ?auto_1597139 - HOIST
      ?auto_1597137 - PLACE
      ?auto_1597138 - TRUCK
      ?auto_1597140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597139 ?auto_1597137 ) ( SURFACE-AT ?auto_1597132 ?auto_1597137 ) ( CLEAR ?auto_1597132 ) ( IS-CRATE ?auto_1597136 ) ( not ( = ?auto_1597132 ?auto_1597136 ) ) ( AVAILABLE ?auto_1597139 ) ( IN ?auto_1597136 ?auto_1597138 ) ( ON ?auto_1597132 ?auto_1597135 ) ( not ( = ?auto_1597135 ?auto_1597132 ) ) ( not ( = ?auto_1597135 ?auto_1597136 ) ) ( TRUCK-AT ?auto_1597138 ?auto_1597140 ) ( not ( = ?auto_1597140 ?auto_1597137 ) ) ( ON ?auto_1597134 ?auto_1597133 ) ( ON ?auto_1597135 ?auto_1597134 ) ( not ( = ?auto_1597133 ?auto_1597134 ) ) ( not ( = ?auto_1597133 ?auto_1597135 ) ) ( not ( = ?auto_1597133 ?auto_1597132 ) ) ( not ( = ?auto_1597133 ?auto_1597136 ) ) ( not ( = ?auto_1597134 ?auto_1597135 ) ) ( not ( = ?auto_1597134 ?auto_1597132 ) ) ( not ( = ?auto_1597134 ?auto_1597136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597135 ?auto_1597132 ?auto_1597136 )
      ( MAKE-4CRATE-VERIFY ?auto_1597133 ?auto_1597134 ?auto_1597135 ?auto_1597132 ?auto_1597136 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597167 - SURFACE
      ?auto_1597168 - SURFACE
      ?auto_1597169 - SURFACE
      ?auto_1597166 - SURFACE
      ?auto_1597170 - SURFACE
    )
    :vars
    (
      ?auto_1597175 - HOIST
      ?auto_1597174 - PLACE
      ?auto_1597173 - TRUCK
      ?auto_1597171 - PLACE
      ?auto_1597172 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597175 ?auto_1597174 ) ( SURFACE-AT ?auto_1597166 ?auto_1597174 ) ( CLEAR ?auto_1597166 ) ( IS-CRATE ?auto_1597170 ) ( not ( = ?auto_1597166 ?auto_1597170 ) ) ( AVAILABLE ?auto_1597175 ) ( ON ?auto_1597166 ?auto_1597169 ) ( not ( = ?auto_1597169 ?auto_1597166 ) ) ( not ( = ?auto_1597169 ?auto_1597170 ) ) ( TRUCK-AT ?auto_1597173 ?auto_1597171 ) ( not ( = ?auto_1597171 ?auto_1597174 ) ) ( HOIST-AT ?auto_1597172 ?auto_1597171 ) ( LIFTING ?auto_1597172 ?auto_1597170 ) ( not ( = ?auto_1597175 ?auto_1597172 ) ) ( ON ?auto_1597168 ?auto_1597167 ) ( ON ?auto_1597169 ?auto_1597168 ) ( not ( = ?auto_1597167 ?auto_1597168 ) ) ( not ( = ?auto_1597167 ?auto_1597169 ) ) ( not ( = ?auto_1597167 ?auto_1597166 ) ) ( not ( = ?auto_1597167 ?auto_1597170 ) ) ( not ( = ?auto_1597168 ?auto_1597169 ) ) ( not ( = ?auto_1597168 ?auto_1597166 ) ) ( not ( = ?auto_1597168 ?auto_1597170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597169 ?auto_1597166 ?auto_1597170 )
      ( MAKE-4CRATE-VERIFY ?auto_1597167 ?auto_1597168 ?auto_1597169 ?auto_1597166 ?auto_1597170 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597205 - SURFACE
      ?auto_1597206 - SURFACE
      ?auto_1597207 - SURFACE
      ?auto_1597204 - SURFACE
      ?auto_1597208 - SURFACE
    )
    :vars
    (
      ?auto_1597212 - HOIST
      ?auto_1597209 - PLACE
      ?auto_1597210 - TRUCK
      ?auto_1597211 - PLACE
      ?auto_1597213 - HOIST
      ?auto_1597214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597212 ?auto_1597209 ) ( SURFACE-AT ?auto_1597204 ?auto_1597209 ) ( CLEAR ?auto_1597204 ) ( IS-CRATE ?auto_1597208 ) ( not ( = ?auto_1597204 ?auto_1597208 ) ) ( AVAILABLE ?auto_1597212 ) ( ON ?auto_1597204 ?auto_1597207 ) ( not ( = ?auto_1597207 ?auto_1597204 ) ) ( not ( = ?auto_1597207 ?auto_1597208 ) ) ( TRUCK-AT ?auto_1597210 ?auto_1597211 ) ( not ( = ?auto_1597211 ?auto_1597209 ) ) ( HOIST-AT ?auto_1597213 ?auto_1597211 ) ( not ( = ?auto_1597212 ?auto_1597213 ) ) ( AVAILABLE ?auto_1597213 ) ( SURFACE-AT ?auto_1597208 ?auto_1597211 ) ( ON ?auto_1597208 ?auto_1597214 ) ( CLEAR ?auto_1597208 ) ( not ( = ?auto_1597204 ?auto_1597214 ) ) ( not ( = ?auto_1597208 ?auto_1597214 ) ) ( not ( = ?auto_1597207 ?auto_1597214 ) ) ( ON ?auto_1597206 ?auto_1597205 ) ( ON ?auto_1597207 ?auto_1597206 ) ( not ( = ?auto_1597205 ?auto_1597206 ) ) ( not ( = ?auto_1597205 ?auto_1597207 ) ) ( not ( = ?auto_1597205 ?auto_1597204 ) ) ( not ( = ?auto_1597205 ?auto_1597208 ) ) ( not ( = ?auto_1597205 ?auto_1597214 ) ) ( not ( = ?auto_1597206 ?auto_1597207 ) ) ( not ( = ?auto_1597206 ?auto_1597204 ) ) ( not ( = ?auto_1597206 ?auto_1597208 ) ) ( not ( = ?auto_1597206 ?auto_1597214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597207 ?auto_1597204 ?auto_1597208 )
      ( MAKE-4CRATE-VERIFY ?auto_1597205 ?auto_1597206 ?auto_1597207 ?auto_1597204 ?auto_1597208 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597244 - SURFACE
      ?auto_1597245 - SURFACE
      ?auto_1597246 - SURFACE
      ?auto_1597243 - SURFACE
      ?auto_1597247 - SURFACE
    )
    :vars
    (
      ?auto_1597250 - HOIST
      ?auto_1597251 - PLACE
      ?auto_1597248 - PLACE
      ?auto_1597249 - HOIST
      ?auto_1597253 - SURFACE
      ?auto_1597252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597250 ?auto_1597251 ) ( SURFACE-AT ?auto_1597243 ?auto_1597251 ) ( CLEAR ?auto_1597243 ) ( IS-CRATE ?auto_1597247 ) ( not ( = ?auto_1597243 ?auto_1597247 ) ) ( AVAILABLE ?auto_1597250 ) ( ON ?auto_1597243 ?auto_1597246 ) ( not ( = ?auto_1597246 ?auto_1597243 ) ) ( not ( = ?auto_1597246 ?auto_1597247 ) ) ( not ( = ?auto_1597248 ?auto_1597251 ) ) ( HOIST-AT ?auto_1597249 ?auto_1597248 ) ( not ( = ?auto_1597250 ?auto_1597249 ) ) ( AVAILABLE ?auto_1597249 ) ( SURFACE-AT ?auto_1597247 ?auto_1597248 ) ( ON ?auto_1597247 ?auto_1597253 ) ( CLEAR ?auto_1597247 ) ( not ( = ?auto_1597243 ?auto_1597253 ) ) ( not ( = ?auto_1597247 ?auto_1597253 ) ) ( not ( = ?auto_1597246 ?auto_1597253 ) ) ( TRUCK-AT ?auto_1597252 ?auto_1597251 ) ( ON ?auto_1597245 ?auto_1597244 ) ( ON ?auto_1597246 ?auto_1597245 ) ( not ( = ?auto_1597244 ?auto_1597245 ) ) ( not ( = ?auto_1597244 ?auto_1597246 ) ) ( not ( = ?auto_1597244 ?auto_1597243 ) ) ( not ( = ?auto_1597244 ?auto_1597247 ) ) ( not ( = ?auto_1597244 ?auto_1597253 ) ) ( not ( = ?auto_1597245 ?auto_1597246 ) ) ( not ( = ?auto_1597245 ?auto_1597243 ) ) ( not ( = ?auto_1597245 ?auto_1597247 ) ) ( not ( = ?auto_1597245 ?auto_1597253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597246 ?auto_1597243 ?auto_1597247 )
      ( MAKE-4CRATE-VERIFY ?auto_1597244 ?auto_1597245 ?auto_1597246 ?auto_1597243 ?auto_1597247 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597283 - SURFACE
      ?auto_1597284 - SURFACE
      ?auto_1597285 - SURFACE
      ?auto_1597282 - SURFACE
      ?auto_1597286 - SURFACE
    )
    :vars
    (
      ?auto_1597292 - HOIST
      ?auto_1597287 - PLACE
      ?auto_1597288 - PLACE
      ?auto_1597291 - HOIST
      ?auto_1597290 - SURFACE
      ?auto_1597289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597292 ?auto_1597287 ) ( IS-CRATE ?auto_1597286 ) ( not ( = ?auto_1597282 ?auto_1597286 ) ) ( not ( = ?auto_1597285 ?auto_1597282 ) ) ( not ( = ?auto_1597285 ?auto_1597286 ) ) ( not ( = ?auto_1597288 ?auto_1597287 ) ) ( HOIST-AT ?auto_1597291 ?auto_1597288 ) ( not ( = ?auto_1597292 ?auto_1597291 ) ) ( AVAILABLE ?auto_1597291 ) ( SURFACE-AT ?auto_1597286 ?auto_1597288 ) ( ON ?auto_1597286 ?auto_1597290 ) ( CLEAR ?auto_1597286 ) ( not ( = ?auto_1597282 ?auto_1597290 ) ) ( not ( = ?auto_1597286 ?auto_1597290 ) ) ( not ( = ?auto_1597285 ?auto_1597290 ) ) ( TRUCK-AT ?auto_1597289 ?auto_1597287 ) ( SURFACE-AT ?auto_1597285 ?auto_1597287 ) ( CLEAR ?auto_1597285 ) ( LIFTING ?auto_1597292 ?auto_1597282 ) ( IS-CRATE ?auto_1597282 ) ( ON ?auto_1597284 ?auto_1597283 ) ( ON ?auto_1597285 ?auto_1597284 ) ( not ( = ?auto_1597283 ?auto_1597284 ) ) ( not ( = ?auto_1597283 ?auto_1597285 ) ) ( not ( = ?auto_1597283 ?auto_1597282 ) ) ( not ( = ?auto_1597283 ?auto_1597286 ) ) ( not ( = ?auto_1597283 ?auto_1597290 ) ) ( not ( = ?auto_1597284 ?auto_1597285 ) ) ( not ( = ?auto_1597284 ?auto_1597282 ) ) ( not ( = ?auto_1597284 ?auto_1597286 ) ) ( not ( = ?auto_1597284 ?auto_1597290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597285 ?auto_1597282 ?auto_1597286 )
      ( MAKE-4CRATE-VERIFY ?auto_1597283 ?auto_1597284 ?auto_1597285 ?auto_1597282 ?auto_1597286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597322 - SURFACE
      ?auto_1597323 - SURFACE
      ?auto_1597324 - SURFACE
      ?auto_1597321 - SURFACE
      ?auto_1597325 - SURFACE
    )
    :vars
    (
      ?auto_1597330 - HOIST
      ?auto_1597327 - PLACE
      ?auto_1597329 - PLACE
      ?auto_1597331 - HOIST
      ?auto_1597328 - SURFACE
      ?auto_1597326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597330 ?auto_1597327 ) ( IS-CRATE ?auto_1597325 ) ( not ( = ?auto_1597321 ?auto_1597325 ) ) ( not ( = ?auto_1597324 ?auto_1597321 ) ) ( not ( = ?auto_1597324 ?auto_1597325 ) ) ( not ( = ?auto_1597329 ?auto_1597327 ) ) ( HOIST-AT ?auto_1597331 ?auto_1597329 ) ( not ( = ?auto_1597330 ?auto_1597331 ) ) ( AVAILABLE ?auto_1597331 ) ( SURFACE-AT ?auto_1597325 ?auto_1597329 ) ( ON ?auto_1597325 ?auto_1597328 ) ( CLEAR ?auto_1597325 ) ( not ( = ?auto_1597321 ?auto_1597328 ) ) ( not ( = ?auto_1597325 ?auto_1597328 ) ) ( not ( = ?auto_1597324 ?auto_1597328 ) ) ( TRUCK-AT ?auto_1597326 ?auto_1597327 ) ( SURFACE-AT ?auto_1597324 ?auto_1597327 ) ( CLEAR ?auto_1597324 ) ( IS-CRATE ?auto_1597321 ) ( AVAILABLE ?auto_1597330 ) ( IN ?auto_1597321 ?auto_1597326 ) ( ON ?auto_1597323 ?auto_1597322 ) ( ON ?auto_1597324 ?auto_1597323 ) ( not ( = ?auto_1597322 ?auto_1597323 ) ) ( not ( = ?auto_1597322 ?auto_1597324 ) ) ( not ( = ?auto_1597322 ?auto_1597321 ) ) ( not ( = ?auto_1597322 ?auto_1597325 ) ) ( not ( = ?auto_1597322 ?auto_1597328 ) ) ( not ( = ?auto_1597323 ?auto_1597324 ) ) ( not ( = ?auto_1597323 ?auto_1597321 ) ) ( not ( = ?auto_1597323 ?auto_1597325 ) ) ( not ( = ?auto_1597323 ?auto_1597328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597324 ?auto_1597321 ?auto_1597325 )
      ( MAKE-4CRATE-VERIFY ?auto_1597322 ?auto_1597323 ?auto_1597324 ?auto_1597321 ?auto_1597325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597982 - SURFACE
      ?auto_1597983 - SURFACE
      ?auto_1597984 - SURFACE
      ?auto_1597981 - SURFACE
      ?auto_1597985 - SURFACE
      ?auto_1597986 - SURFACE
    )
    :vars
    (
      ?auto_1597988 - HOIST
      ?auto_1597987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597988 ?auto_1597987 ) ( SURFACE-AT ?auto_1597985 ?auto_1597987 ) ( CLEAR ?auto_1597985 ) ( LIFTING ?auto_1597988 ?auto_1597986 ) ( IS-CRATE ?auto_1597986 ) ( not ( = ?auto_1597985 ?auto_1597986 ) ) ( ON ?auto_1597983 ?auto_1597982 ) ( ON ?auto_1597984 ?auto_1597983 ) ( ON ?auto_1597981 ?auto_1597984 ) ( ON ?auto_1597985 ?auto_1597981 ) ( not ( = ?auto_1597982 ?auto_1597983 ) ) ( not ( = ?auto_1597982 ?auto_1597984 ) ) ( not ( = ?auto_1597982 ?auto_1597981 ) ) ( not ( = ?auto_1597982 ?auto_1597985 ) ) ( not ( = ?auto_1597982 ?auto_1597986 ) ) ( not ( = ?auto_1597983 ?auto_1597984 ) ) ( not ( = ?auto_1597983 ?auto_1597981 ) ) ( not ( = ?auto_1597983 ?auto_1597985 ) ) ( not ( = ?auto_1597983 ?auto_1597986 ) ) ( not ( = ?auto_1597984 ?auto_1597981 ) ) ( not ( = ?auto_1597984 ?auto_1597985 ) ) ( not ( = ?auto_1597984 ?auto_1597986 ) ) ( not ( = ?auto_1597981 ?auto_1597985 ) ) ( not ( = ?auto_1597981 ?auto_1597986 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1597985 ?auto_1597986 )
      ( MAKE-5CRATE-VERIFY ?auto_1597982 ?auto_1597983 ?auto_1597984 ?auto_1597981 ?auto_1597985 ?auto_1597986 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598016 - SURFACE
      ?auto_1598017 - SURFACE
      ?auto_1598018 - SURFACE
      ?auto_1598015 - SURFACE
      ?auto_1598019 - SURFACE
      ?auto_1598020 - SURFACE
    )
    :vars
    (
      ?auto_1598023 - HOIST
      ?auto_1598021 - PLACE
      ?auto_1598022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598023 ?auto_1598021 ) ( SURFACE-AT ?auto_1598019 ?auto_1598021 ) ( CLEAR ?auto_1598019 ) ( IS-CRATE ?auto_1598020 ) ( not ( = ?auto_1598019 ?auto_1598020 ) ) ( TRUCK-AT ?auto_1598022 ?auto_1598021 ) ( AVAILABLE ?auto_1598023 ) ( IN ?auto_1598020 ?auto_1598022 ) ( ON ?auto_1598019 ?auto_1598015 ) ( not ( = ?auto_1598015 ?auto_1598019 ) ) ( not ( = ?auto_1598015 ?auto_1598020 ) ) ( ON ?auto_1598017 ?auto_1598016 ) ( ON ?auto_1598018 ?auto_1598017 ) ( ON ?auto_1598015 ?auto_1598018 ) ( not ( = ?auto_1598016 ?auto_1598017 ) ) ( not ( = ?auto_1598016 ?auto_1598018 ) ) ( not ( = ?auto_1598016 ?auto_1598015 ) ) ( not ( = ?auto_1598016 ?auto_1598019 ) ) ( not ( = ?auto_1598016 ?auto_1598020 ) ) ( not ( = ?auto_1598017 ?auto_1598018 ) ) ( not ( = ?auto_1598017 ?auto_1598015 ) ) ( not ( = ?auto_1598017 ?auto_1598019 ) ) ( not ( = ?auto_1598017 ?auto_1598020 ) ) ( not ( = ?auto_1598018 ?auto_1598015 ) ) ( not ( = ?auto_1598018 ?auto_1598019 ) ) ( not ( = ?auto_1598018 ?auto_1598020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598015 ?auto_1598019 ?auto_1598020 )
      ( MAKE-5CRATE-VERIFY ?auto_1598016 ?auto_1598017 ?auto_1598018 ?auto_1598015 ?auto_1598019 ?auto_1598020 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598056 - SURFACE
      ?auto_1598057 - SURFACE
      ?auto_1598058 - SURFACE
      ?auto_1598055 - SURFACE
      ?auto_1598059 - SURFACE
      ?auto_1598060 - SURFACE
    )
    :vars
    (
      ?auto_1598064 - HOIST
      ?auto_1598061 - PLACE
      ?auto_1598062 - TRUCK
      ?auto_1598063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598064 ?auto_1598061 ) ( SURFACE-AT ?auto_1598059 ?auto_1598061 ) ( CLEAR ?auto_1598059 ) ( IS-CRATE ?auto_1598060 ) ( not ( = ?auto_1598059 ?auto_1598060 ) ) ( AVAILABLE ?auto_1598064 ) ( IN ?auto_1598060 ?auto_1598062 ) ( ON ?auto_1598059 ?auto_1598055 ) ( not ( = ?auto_1598055 ?auto_1598059 ) ) ( not ( = ?auto_1598055 ?auto_1598060 ) ) ( TRUCK-AT ?auto_1598062 ?auto_1598063 ) ( not ( = ?auto_1598063 ?auto_1598061 ) ) ( ON ?auto_1598057 ?auto_1598056 ) ( ON ?auto_1598058 ?auto_1598057 ) ( ON ?auto_1598055 ?auto_1598058 ) ( not ( = ?auto_1598056 ?auto_1598057 ) ) ( not ( = ?auto_1598056 ?auto_1598058 ) ) ( not ( = ?auto_1598056 ?auto_1598055 ) ) ( not ( = ?auto_1598056 ?auto_1598059 ) ) ( not ( = ?auto_1598056 ?auto_1598060 ) ) ( not ( = ?auto_1598057 ?auto_1598058 ) ) ( not ( = ?auto_1598057 ?auto_1598055 ) ) ( not ( = ?auto_1598057 ?auto_1598059 ) ) ( not ( = ?auto_1598057 ?auto_1598060 ) ) ( not ( = ?auto_1598058 ?auto_1598055 ) ) ( not ( = ?auto_1598058 ?auto_1598059 ) ) ( not ( = ?auto_1598058 ?auto_1598060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598055 ?auto_1598059 ?auto_1598060 )
      ( MAKE-5CRATE-VERIFY ?auto_1598056 ?auto_1598057 ?auto_1598058 ?auto_1598055 ?auto_1598059 ?auto_1598060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598101 - SURFACE
      ?auto_1598102 - SURFACE
      ?auto_1598103 - SURFACE
      ?auto_1598100 - SURFACE
      ?auto_1598104 - SURFACE
      ?auto_1598105 - SURFACE
    )
    :vars
    (
      ?auto_1598106 - HOIST
      ?auto_1598107 - PLACE
      ?auto_1598109 - TRUCK
      ?auto_1598108 - PLACE
      ?auto_1598110 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598106 ?auto_1598107 ) ( SURFACE-AT ?auto_1598104 ?auto_1598107 ) ( CLEAR ?auto_1598104 ) ( IS-CRATE ?auto_1598105 ) ( not ( = ?auto_1598104 ?auto_1598105 ) ) ( AVAILABLE ?auto_1598106 ) ( ON ?auto_1598104 ?auto_1598100 ) ( not ( = ?auto_1598100 ?auto_1598104 ) ) ( not ( = ?auto_1598100 ?auto_1598105 ) ) ( TRUCK-AT ?auto_1598109 ?auto_1598108 ) ( not ( = ?auto_1598108 ?auto_1598107 ) ) ( HOIST-AT ?auto_1598110 ?auto_1598108 ) ( LIFTING ?auto_1598110 ?auto_1598105 ) ( not ( = ?auto_1598106 ?auto_1598110 ) ) ( ON ?auto_1598102 ?auto_1598101 ) ( ON ?auto_1598103 ?auto_1598102 ) ( ON ?auto_1598100 ?auto_1598103 ) ( not ( = ?auto_1598101 ?auto_1598102 ) ) ( not ( = ?auto_1598101 ?auto_1598103 ) ) ( not ( = ?auto_1598101 ?auto_1598100 ) ) ( not ( = ?auto_1598101 ?auto_1598104 ) ) ( not ( = ?auto_1598101 ?auto_1598105 ) ) ( not ( = ?auto_1598102 ?auto_1598103 ) ) ( not ( = ?auto_1598102 ?auto_1598100 ) ) ( not ( = ?auto_1598102 ?auto_1598104 ) ) ( not ( = ?auto_1598102 ?auto_1598105 ) ) ( not ( = ?auto_1598103 ?auto_1598100 ) ) ( not ( = ?auto_1598103 ?auto_1598104 ) ) ( not ( = ?auto_1598103 ?auto_1598105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598100 ?auto_1598104 ?auto_1598105 )
      ( MAKE-5CRATE-VERIFY ?auto_1598101 ?auto_1598102 ?auto_1598103 ?auto_1598100 ?auto_1598104 ?auto_1598105 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598151 - SURFACE
      ?auto_1598152 - SURFACE
      ?auto_1598153 - SURFACE
      ?auto_1598150 - SURFACE
      ?auto_1598154 - SURFACE
      ?auto_1598155 - SURFACE
    )
    :vars
    (
      ?auto_1598156 - HOIST
      ?auto_1598160 - PLACE
      ?auto_1598161 - TRUCK
      ?auto_1598159 - PLACE
      ?auto_1598158 - HOIST
      ?auto_1598157 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598156 ?auto_1598160 ) ( SURFACE-AT ?auto_1598154 ?auto_1598160 ) ( CLEAR ?auto_1598154 ) ( IS-CRATE ?auto_1598155 ) ( not ( = ?auto_1598154 ?auto_1598155 ) ) ( AVAILABLE ?auto_1598156 ) ( ON ?auto_1598154 ?auto_1598150 ) ( not ( = ?auto_1598150 ?auto_1598154 ) ) ( not ( = ?auto_1598150 ?auto_1598155 ) ) ( TRUCK-AT ?auto_1598161 ?auto_1598159 ) ( not ( = ?auto_1598159 ?auto_1598160 ) ) ( HOIST-AT ?auto_1598158 ?auto_1598159 ) ( not ( = ?auto_1598156 ?auto_1598158 ) ) ( AVAILABLE ?auto_1598158 ) ( SURFACE-AT ?auto_1598155 ?auto_1598159 ) ( ON ?auto_1598155 ?auto_1598157 ) ( CLEAR ?auto_1598155 ) ( not ( = ?auto_1598154 ?auto_1598157 ) ) ( not ( = ?auto_1598155 ?auto_1598157 ) ) ( not ( = ?auto_1598150 ?auto_1598157 ) ) ( ON ?auto_1598152 ?auto_1598151 ) ( ON ?auto_1598153 ?auto_1598152 ) ( ON ?auto_1598150 ?auto_1598153 ) ( not ( = ?auto_1598151 ?auto_1598152 ) ) ( not ( = ?auto_1598151 ?auto_1598153 ) ) ( not ( = ?auto_1598151 ?auto_1598150 ) ) ( not ( = ?auto_1598151 ?auto_1598154 ) ) ( not ( = ?auto_1598151 ?auto_1598155 ) ) ( not ( = ?auto_1598151 ?auto_1598157 ) ) ( not ( = ?auto_1598152 ?auto_1598153 ) ) ( not ( = ?auto_1598152 ?auto_1598150 ) ) ( not ( = ?auto_1598152 ?auto_1598154 ) ) ( not ( = ?auto_1598152 ?auto_1598155 ) ) ( not ( = ?auto_1598152 ?auto_1598157 ) ) ( not ( = ?auto_1598153 ?auto_1598150 ) ) ( not ( = ?auto_1598153 ?auto_1598154 ) ) ( not ( = ?auto_1598153 ?auto_1598155 ) ) ( not ( = ?auto_1598153 ?auto_1598157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598150 ?auto_1598154 ?auto_1598155 )
      ( MAKE-5CRATE-VERIFY ?auto_1598151 ?auto_1598152 ?auto_1598153 ?auto_1598150 ?auto_1598154 ?auto_1598155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598202 - SURFACE
      ?auto_1598203 - SURFACE
      ?auto_1598204 - SURFACE
      ?auto_1598201 - SURFACE
      ?auto_1598205 - SURFACE
      ?auto_1598206 - SURFACE
    )
    :vars
    (
      ?auto_1598208 - HOIST
      ?auto_1598209 - PLACE
      ?auto_1598212 - PLACE
      ?auto_1598210 - HOIST
      ?auto_1598211 - SURFACE
      ?auto_1598207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598208 ?auto_1598209 ) ( SURFACE-AT ?auto_1598205 ?auto_1598209 ) ( CLEAR ?auto_1598205 ) ( IS-CRATE ?auto_1598206 ) ( not ( = ?auto_1598205 ?auto_1598206 ) ) ( AVAILABLE ?auto_1598208 ) ( ON ?auto_1598205 ?auto_1598201 ) ( not ( = ?auto_1598201 ?auto_1598205 ) ) ( not ( = ?auto_1598201 ?auto_1598206 ) ) ( not ( = ?auto_1598212 ?auto_1598209 ) ) ( HOIST-AT ?auto_1598210 ?auto_1598212 ) ( not ( = ?auto_1598208 ?auto_1598210 ) ) ( AVAILABLE ?auto_1598210 ) ( SURFACE-AT ?auto_1598206 ?auto_1598212 ) ( ON ?auto_1598206 ?auto_1598211 ) ( CLEAR ?auto_1598206 ) ( not ( = ?auto_1598205 ?auto_1598211 ) ) ( not ( = ?auto_1598206 ?auto_1598211 ) ) ( not ( = ?auto_1598201 ?auto_1598211 ) ) ( TRUCK-AT ?auto_1598207 ?auto_1598209 ) ( ON ?auto_1598203 ?auto_1598202 ) ( ON ?auto_1598204 ?auto_1598203 ) ( ON ?auto_1598201 ?auto_1598204 ) ( not ( = ?auto_1598202 ?auto_1598203 ) ) ( not ( = ?auto_1598202 ?auto_1598204 ) ) ( not ( = ?auto_1598202 ?auto_1598201 ) ) ( not ( = ?auto_1598202 ?auto_1598205 ) ) ( not ( = ?auto_1598202 ?auto_1598206 ) ) ( not ( = ?auto_1598202 ?auto_1598211 ) ) ( not ( = ?auto_1598203 ?auto_1598204 ) ) ( not ( = ?auto_1598203 ?auto_1598201 ) ) ( not ( = ?auto_1598203 ?auto_1598205 ) ) ( not ( = ?auto_1598203 ?auto_1598206 ) ) ( not ( = ?auto_1598203 ?auto_1598211 ) ) ( not ( = ?auto_1598204 ?auto_1598201 ) ) ( not ( = ?auto_1598204 ?auto_1598205 ) ) ( not ( = ?auto_1598204 ?auto_1598206 ) ) ( not ( = ?auto_1598204 ?auto_1598211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598201 ?auto_1598205 ?auto_1598206 )
      ( MAKE-5CRATE-VERIFY ?auto_1598202 ?auto_1598203 ?auto_1598204 ?auto_1598201 ?auto_1598205 ?auto_1598206 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598253 - SURFACE
      ?auto_1598254 - SURFACE
      ?auto_1598255 - SURFACE
      ?auto_1598252 - SURFACE
      ?auto_1598256 - SURFACE
      ?auto_1598257 - SURFACE
    )
    :vars
    (
      ?auto_1598259 - HOIST
      ?auto_1598258 - PLACE
      ?auto_1598261 - PLACE
      ?auto_1598263 - HOIST
      ?auto_1598260 - SURFACE
      ?auto_1598262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598259 ?auto_1598258 ) ( IS-CRATE ?auto_1598257 ) ( not ( = ?auto_1598256 ?auto_1598257 ) ) ( not ( = ?auto_1598252 ?auto_1598256 ) ) ( not ( = ?auto_1598252 ?auto_1598257 ) ) ( not ( = ?auto_1598261 ?auto_1598258 ) ) ( HOIST-AT ?auto_1598263 ?auto_1598261 ) ( not ( = ?auto_1598259 ?auto_1598263 ) ) ( AVAILABLE ?auto_1598263 ) ( SURFACE-AT ?auto_1598257 ?auto_1598261 ) ( ON ?auto_1598257 ?auto_1598260 ) ( CLEAR ?auto_1598257 ) ( not ( = ?auto_1598256 ?auto_1598260 ) ) ( not ( = ?auto_1598257 ?auto_1598260 ) ) ( not ( = ?auto_1598252 ?auto_1598260 ) ) ( TRUCK-AT ?auto_1598262 ?auto_1598258 ) ( SURFACE-AT ?auto_1598252 ?auto_1598258 ) ( CLEAR ?auto_1598252 ) ( LIFTING ?auto_1598259 ?auto_1598256 ) ( IS-CRATE ?auto_1598256 ) ( ON ?auto_1598254 ?auto_1598253 ) ( ON ?auto_1598255 ?auto_1598254 ) ( ON ?auto_1598252 ?auto_1598255 ) ( not ( = ?auto_1598253 ?auto_1598254 ) ) ( not ( = ?auto_1598253 ?auto_1598255 ) ) ( not ( = ?auto_1598253 ?auto_1598252 ) ) ( not ( = ?auto_1598253 ?auto_1598256 ) ) ( not ( = ?auto_1598253 ?auto_1598257 ) ) ( not ( = ?auto_1598253 ?auto_1598260 ) ) ( not ( = ?auto_1598254 ?auto_1598255 ) ) ( not ( = ?auto_1598254 ?auto_1598252 ) ) ( not ( = ?auto_1598254 ?auto_1598256 ) ) ( not ( = ?auto_1598254 ?auto_1598257 ) ) ( not ( = ?auto_1598254 ?auto_1598260 ) ) ( not ( = ?auto_1598255 ?auto_1598252 ) ) ( not ( = ?auto_1598255 ?auto_1598256 ) ) ( not ( = ?auto_1598255 ?auto_1598257 ) ) ( not ( = ?auto_1598255 ?auto_1598260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598252 ?auto_1598256 ?auto_1598257 )
      ( MAKE-5CRATE-VERIFY ?auto_1598253 ?auto_1598254 ?auto_1598255 ?auto_1598252 ?auto_1598256 ?auto_1598257 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598304 - SURFACE
      ?auto_1598305 - SURFACE
      ?auto_1598306 - SURFACE
      ?auto_1598303 - SURFACE
      ?auto_1598307 - SURFACE
      ?auto_1598308 - SURFACE
    )
    :vars
    (
      ?auto_1598314 - HOIST
      ?auto_1598312 - PLACE
      ?auto_1598313 - PLACE
      ?auto_1598311 - HOIST
      ?auto_1598310 - SURFACE
      ?auto_1598309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598314 ?auto_1598312 ) ( IS-CRATE ?auto_1598308 ) ( not ( = ?auto_1598307 ?auto_1598308 ) ) ( not ( = ?auto_1598303 ?auto_1598307 ) ) ( not ( = ?auto_1598303 ?auto_1598308 ) ) ( not ( = ?auto_1598313 ?auto_1598312 ) ) ( HOIST-AT ?auto_1598311 ?auto_1598313 ) ( not ( = ?auto_1598314 ?auto_1598311 ) ) ( AVAILABLE ?auto_1598311 ) ( SURFACE-AT ?auto_1598308 ?auto_1598313 ) ( ON ?auto_1598308 ?auto_1598310 ) ( CLEAR ?auto_1598308 ) ( not ( = ?auto_1598307 ?auto_1598310 ) ) ( not ( = ?auto_1598308 ?auto_1598310 ) ) ( not ( = ?auto_1598303 ?auto_1598310 ) ) ( TRUCK-AT ?auto_1598309 ?auto_1598312 ) ( SURFACE-AT ?auto_1598303 ?auto_1598312 ) ( CLEAR ?auto_1598303 ) ( IS-CRATE ?auto_1598307 ) ( AVAILABLE ?auto_1598314 ) ( IN ?auto_1598307 ?auto_1598309 ) ( ON ?auto_1598305 ?auto_1598304 ) ( ON ?auto_1598306 ?auto_1598305 ) ( ON ?auto_1598303 ?auto_1598306 ) ( not ( = ?auto_1598304 ?auto_1598305 ) ) ( not ( = ?auto_1598304 ?auto_1598306 ) ) ( not ( = ?auto_1598304 ?auto_1598303 ) ) ( not ( = ?auto_1598304 ?auto_1598307 ) ) ( not ( = ?auto_1598304 ?auto_1598308 ) ) ( not ( = ?auto_1598304 ?auto_1598310 ) ) ( not ( = ?auto_1598305 ?auto_1598306 ) ) ( not ( = ?auto_1598305 ?auto_1598303 ) ) ( not ( = ?auto_1598305 ?auto_1598307 ) ) ( not ( = ?auto_1598305 ?auto_1598308 ) ) ( not ( = ?auto_1598305 ?auto_1598310 ) ) ( not ( = ?auto_1598306 ?auto_1598303 ) ) ( not ( = ?auto_1598306 ?auto_1598307 ) ) ( not ( = ?auto_1598306 ?auto_1598308 ) ) ( not ( = ?auto_1598306 ?auto_1598310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598303 ?auto_1598307 ?auto_1598308 )
      ( MAKE-5CRATE-VERIFY ?auto_1598304 ?auto_1598305 ?auto_1598306 ?auto_1598303 ?auto_1598307 ?auto_1598308 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599513 - SURFACE
      ?auto_1599514 - SURFACE
      ?auto_1599515 - SURFACE
      ?auto_1599512 - SURFACE
      ?auto_1599516 - SURFACE
      ?auto_1599518 - SURFACE
      ?auto_1599517 - SURFACE
    )
    :vars
    (
      ?auto_1599520 - HOIST
      ?auto_1599519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599520 ?auto_1599519 ) ( SURFACE-AT ?auto_1599518 ?auto_1599519 ) ( CLEAR ?auto_1599518 ) ( LIFTING ?auto_1599520 ?auto_1599517 ) ( IS-CRATE ?auto_1599517 ) ( not ( = ?auto_1599518 ?auto_1599517 ) ) ( ON ?auto_1599514 ?auto_1599513 ) ( ON ?auto_1599515 ?auto_1599514 ) ( ON ?auto_1599512 ?auto_1599515 ) ( ON ?auto_1599516 ?auto_1599512 ) ( ON ?auto_1599518 ?auto_1599516 ) ( not ( = ?auto_1599513 ?auto_1599514 ) ) ( not ( = ?auto_1599513 ?auto_1599515 ) ) ( not ( = ?auto_1599513 ?auto_1599512 ) ) ( not ( = ?auto_1599513 ?auto_1599516 ) ) ( not ( = ?auto_1599513 ?auto_1599518 ) ) ( not ( = ?auto_1599513 ?auto_1599517 ) ) ( not ( = ?auto_1599514 ?auto_1599515 ) ) ( not ( = ?auto_1599514 ?auto_1599512 ) ) ( not ( = ?auto_1599514 ?auto_1599516 ) ) ( not ( = ?auto_1599514 ?auto_1599518 ) ) ( not ( = ?auto_1599514 ?auto_1599517 ) ) ( not ( = ?auto_1599515 ?auto_1599512 ) ) ( not ( = ?auto_1599515 ?auto_1599516 ) ) ( not ( = ?auto_1599515 ?auto_1599518 ) ) ( not ( = ?auto_1599515 ?auto_1599517 ) ) ( not ( = ?auto_1599512 ?auto_1599516 ) ) ( not ( = ?auto_1599512 ?auto_1599518 ) ) ( not ( = ?auto_1599512 ?auto_1599517 ) ) ( not ( = ?auto_1599516 ?auto_1599518 ) ) ( not ( = ?auto_1599516 ?auto_1599517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1599518 ?auto_1599517 )
      ( MAKE-6CRATE-VERIFY ?auto_1599513 ?auto_1599514 ?auto_1599515 ?auto_1599512 ?auto_1599516 ?auto_1599518 ?auto_1599517 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599557 - SURFACE
      ?auto_1599558 - SURFACE
      ?auto_1599559 - SURFACE
      ?auto_1599556 - SURFACE
      ?auto_1599560 - SURFACE
      ?auto_1599562 - SURFACE
      ?auto_1599561 - SURFACE
    )
    :vars
    (
      ?auto_1599564 - HOIST
      ?auto_1599565 - PLACE
      ?auto_1599563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599564 ?auto_1599565 ) ( SURFACE-AT ?auto_1599562 ?auto_1599565 ) ( CLEAR ?auto_1599562 ) ( IS-CRATE ?auto_1599561 ) ( not ( = ?auto_1599562 ?auto_1599561 ) ) ( TRUCK-AT ?auto_1599563 ?auto_1599565 ) ( AVAILABLE ?auto_1599564 ) ( IN ?auto_1599561 ?auto_1599563 ) ( ON ?auto_1599562 ?auto_1599560 ) ( not ( = ?auto_1599560 ?auto_1599562 ) ) ( not ( = ?auto_1599560 ?auto_1599561 ) ) ( ON ?auto_1599558 ?auto_1599557 ) ( ON ?auto_1599559 ?auto_1599558 ) ( ON ?auto_1599556 ?auto_1599559 ) ( ON ?auto_1599560 ?auto_1599556 ) ( not ( = ?auto_1599557 ?auto_1599558 ) ) ( not ( = ?auto_1599557 ?auto_1599559 ) ) ( not ( = ?auto_1599557 ?auto_1599556 ) ) ( not ( = ?auto_1599557 ?auto_1599560 ) ) ( not ( = ?auto_1599557 ?auto_1599562 ) ) ( not ( = ?auto_1599557 ?auto_1599561 ) ) ( not ( = ?auto_1599558 ?auto_1599559 ) ) ( not ( = ?auto_1599558 ?auto_1599556 ) ) ( not ( = ?auto_1599558 ?auto_1599560 ) ) ( not ( = ?auto_1599558 ?auto_1599562 ) ) ( not ( = ?auto_1599558 ?auto_1599561 ) ) ( not ( = ?auto_1599559 ?auto_1599556 ) ) ( not ( = ?auto_1599559 ?auto_1599560 ) ) ( not ( = ?auto_1599559 ?auto_1599562 ) ) ( not ( = ?auto_1599559 ?auto_1599561 ) ) ( not ( = ?auto_1599556 ?auto_1599560 ) ) ( not ( = ?auto_1599556 ?auto_1599562 ) ) ( not ( = ?auto_1599556 ?auto_1599561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599560 ?auto_1599562 ?auto_1599561 )
      ( MAKE-6CRATE-VERIFY ?auto_1599557 ?auto_1599558 ?auto_1599559 ?auto_1599556 ?auto_1599560 ?auto_1599562 ?auto_1599561 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599608 - SURFACE
      ?auto_1599609 - SURFACE
      ?auto_1599610 - SURFACE
      ?auto_1599607 - SURFACE
      ?auto_1599611 - SURFACE
      ?auto_1599613 - SURFACE
      ?auto_1599612 - SURFACE
    )
    :vars
    (
      ?auto_1599617 - HOIST
      ?auto_1599614 - PLACE
      ?auto_1599615 - TRUCK
      ?auto_1599616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599617 ?auto_1599614 ) ( SURFACE-AT ?auto_1599613 ?auto_1599614 ) ( CLEAR ?auto_1599613 ) ( IS-CRATE ?auto_1599612 ) ( not ( = ?auto_1599613 ?auto_1599612 ) ) ( AVAILABLE ?auto_1599617 ) ( IN ?auto_1599612 ?auto_1599615 ) ( ON ?auto_1599613 ?auto_1599611 ) ( not ( = ?auto_1599611 ?auto_1599613 ) ) ( not ( = ?auto_1599611 ?auto_1599612 ) ) ( TRUCK-AT ?auto_1599615 ?auto_1599616 ) ( not ( = ?auto_1599616 ?auto_1599614 ) ) ( ON ?auto_1599609 ?auto_1599608 ) ( ON ?auto_1599610 ?auto_1599609 ) ( ON ?auto_1599607 ?auto_1599610 ) ( ON ?auto_1599611 ?auto_1599607 ) ( not ( = ?auto_1599608 ?auto_1599609 ) ) ( not ( = ?auto_1599608 ?auto_1599610 ) ) ( not ( = ?auto_1599608 ?auto_1599607 ) ) ( not ( = ?auto_1599608 ?auto_1599611 ) ) ( not ( = ?auto_1599608 ?auto_1599613 ) ) ( not ( = ?auto_1599608 ?auto_1599612 ) ) ( not ( = ?auto_1599609 ?auto_1599610 ) ) ( not ( = ?auto_1599609 ?auto_1599607 ) ) ( not ( = ?auto_1599609 ?auto_1599611 ) ) ( not ( = ?auto_1599609 ?auto_1599613 ) ) ( not ( = ?auto_1599609 ?auto_1599612 ) ) ( not ( = ?auto_1599610 ?auto_1599607 ) ) ( not ( = ?auto_1599610 ?auto_1599611 ) ) ( not ( = ?auto_1599610 ?auto_1599613 ) ) ( not ( = ?auto_1599610 ?auto_1599612 ) ) ( not ( = ?auto_1599607 ?auto_1599611 ) ) ( not ( = ?auto_1599607 ?auto_1599613 ) ) ( not ( = ?auto_1599607 ?auto_1599612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599611 ?auto_1599613 ?auto_1599612 )
      ( MAKE-6CRATE-VERIFY ?auto_1599608 ?auto_1599609 ?auto_1599610 ?auto_1599607 ?auto_1599611 ?auto_1599613 ?auto_1599612 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599665 - SURFACE
      ?auto_1599666 - SURFACE
      ?auto_1599667 - SURFACE
      ?auto_1599664 - SURFACE
      ?auto_1599668 - SURFACE
      ?auto_1599670 - SURFACE
      ?auto_1599669 - SURFACE
    )
    :vars
    (
      ?auto_1599673 - HOIST
      ?auto_1599674 - PLACE
      ?auto_1599672 - TRUCK
      ?auto_1599671 - PLACE
      ?auto_1599675 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599673 ?auto_1599674 ) ( SURFACE-AT ?auto_1599670 ?auto_1599674 ) ( CLEAR ?auto_1599670 ) ( IS-CRATE ?auto_1599669 ) ( not ( = ?auto_1599670 ?auto_1599669 ) ) ( AVAILABLE ?auto_1599673 ) ( ON ?auto_1599670 ?auto_1599668 ) ( not ( = ?auto_1599668 ?auto_1599670 ) ) ( not ( = ?auto_1599668 ?auto_1599669 ) ) ( TRUCK-AT ?auto_1599672 ?auto_1599671 ) ( not ( = ?auto_1599671 ?auto_1599674 ) ) ( HOIST-AT ?auto_1599675 ?auto_1599671 ) ( LIFTING ?auto_1599675 ?auto_1599669 ) ( not ( = ?auto_1599673 ?auto_1599675 ) ) ( ON ?auto_1599666 ?auto_1599665 ) ( ON ?auto_1599667 ?auto_1599666 ) ( ON ?auto_1599664 ?auto_1599667 ) ( ON ?auto_1599668 ?auto_1599664 ) ( not ( = ?auto_1599665 ?auto_1599666 ) ) ( not ( = ?auto_1599665 ?auto_1599667 ) ) ( not ( = ?auto_1599665 ?auto_1599664 ) ) ( not ( = ?auto_1599665 ?auto_1599668 ) ) ( not ( = ?auto_1599665 ?auto_1599670 ) ) ( not ( = ?auto_1599665 ?auto_1599669 ) ) ( not ( = ?auto_1599666 ?auto_1599667 ) ) ( not ( = ?auto_1599666 ?auto_1599664 ) ) ( not ( = ?auto_1599666 ?auto_1599668 ) ) ( not ( = ?auto_1599666 ?auto_1599670 ) ) ( not ( = ?auto_1599666 ?auto_1599669 ) ) ( not ( = ?auto_1599667 ?auto_1599664 ) ) ( not ( = ?auto_1599667 ?auto_1599668 ) ) ( not ( = ?auto_1599667 ?auto_1599670 ) ) ( not ( = ?auto_1599667 ?auto_1599669 ) ) ( not ( = ?auto_1599664 ?auto_1599668 ) ) ( not ( = ?auto_1599664 ?auto_1599670 ) ) ( not ( = ?auto_1599664 ?auto_1599669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599668 ?auto_1599670 ?auto_1599669 )
      ( MAKE-6CRATE-VERIFY ?auto_1599665 ?auto_1599666 ?auto_1599667 ?auto_1599664 ?auto_1599668 ?auto_1599670 ?auto_1599669 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599728 - SURFACE
      ?auto_1599729 - SURFACE
      ?auto_1599730 - SURFACE
      ?auto_1599727 - SURFACE
      ?auto_1599731 - SURFACE
      ?auto_1599733 - SURFACE
      ?auto_1599732 - SURFACE
    )
    :vars
    (
      ?auto_1599736 - HOIST
      ?auto_1599735 - PLACE
      ?auto_1599738 - TRUCK
      ?auto_1599739 - PLACE
      ?auto_1599737 - HOIST
      ?auto_1599734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599736 ?auto_1599735 ) ( SURFACE-AT ?auto_1599733 ?auto_1599735 ) ( CLEAR ?auto_1599733 ) ( IS-CRATE ?auto_1599732 ) ( not ( = ?auto_1599733 ?auto_1599732 ) ) ( AVAILABLE ?auto_1599736 ) ( ON ?auto_1599733 ?auto_1599731 ) ( not ( = ?auto_1599731 ?auto_1599733 ) ) ( not ( = ?auto_1599731 ?auto_1599732 ) ) ( TRUCK-AT ?auto_1599738 ?auto_1599739 ) ( not ( = ?auto_1599739 ?auto_1599735 ) ) ( HOIST-AT ?auto_1599737 ?auto_1599739 ) ( not ( = ?auto_1599736 ?auto_1599737 ) ) ( AVAILABLE ?auto_1599737 ) ( SURFACE-AT ?auto_1599732 ?auto_1599739 ) ( ON ?auto_1599732 ?auto_1599734 ) ( CLEAR ?auto_1599732 ) ( not ( = ?auto_1599733 ?auto_1599734 ) ) ( not ( = ?auto_1599732 ?auto_1599734 ) ) ( not ( = ?auto_1599731 ?auto_1599734 ) ) ( ON ?auto_1599729 ?auto_1599728 ) ( ON ?auto_1599730 ?auto_1599729 ) ( ON ?auto_1599727 ?auto_1599730 ) ( ON ?auto_1599731 ?auto_1599727 ) ( not ( = ?auto_1599728 ?auto_1599729 ) ) ( not ( = ?auto_1599728 ?auto_1599730 ) ) ( not ( = ?auto_1599728 ?auto_1599727 ) ) ( not ( = ?auto_1599728 ?auto_1599731 ) ) ( not ( = ?auto_1599728 ?auto_1599733 ) ) ( not ( = ?auto_1599728 ?auto_1599732 ) ) ( not ( = ?auto_1599728 ?auto_1599734 ) ) ( not ( = ?auto_1599729 ?auto_1599730 ) ) ( not ( = ?auto_1599729 ?auto_1599727 ) ) ( not ( = ?auto_1599729 ?auto_1599731 ) ) ( not ( = ?auto_1599729 ?auto_1599733 ) ) ( not ( = ?auto_1599729 ?auto_1599732 ) ) ( not ( = ?auto_1599729 ?auto_1599734 ) ) ( not ( = ?auto_1599730 ?auto_1599727 ) ) ( not ( = ?auto_1599730 ?auto_1599731 ) ) ( not ( = ?auto_1599730 ?auto_1599733 ) ) ( not ( = ?auto_1599730 ?auto_1599732 ) ) ( not ( = ?auto_1599730 ?auto_1599734 ) ) ( not ( = ?auto_1599727 ?auto_1599731 ) ) ( not ( = ?auto_1599727 ?auto_1599733 ) ) ( not ( = ?auto_1599727 ?auto_1599732 ) ) ( not ( = ?auto_1599727 ?auto_1599734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599731 ?auto_1599733 ?auto_1599732 )
      ( MAKE-6CRATE-VERIFY ?auto_1599728 ?auto_1599729 ?auto_1599730 ?auto_1599727 ?auto_1599731 ?auto_1599733 ?auto_1599732 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599792 - SURFACE
      ?auto_1599793 - SURFACE
      ?auto_1599794 - SURFACE
      ?auto_1599791 - SURFACE
      ?auto_1599795 - SURFACE
      ?auto_1599797 - SURFACE
      ?auto_1599796 - SURFACE
    )
    :vars
    (
      ?auto_1599803 - HOIST
      ?auto_1599800 - PLACE
      ?auto_1599798 - PLACE
      ?auto_1599801 - HOIST
      ?auto_1599799 - SURFACE
      ?auto_1599802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599803 ?auto_1599800 ) ( SURFACE-AT ?auto_1599797 ?auto_1599800 ) ( CLEAR ?auto_1599797 ) ( IS-CRATE ?auto_1599796 ) ( not ( = ?auto_1599797 ?auto_1599796 ) ) ( AVAILABLE ?auto_1599803 ) ( ON ?auto_1599797 ?auto_1599795 ) ( not ( = ?auto_1599795 ?auto_1599797 ) ) ( not ( = ?auto_1599795 ?auto_1599796 ) ) ( not ( = ?auto_1599798 ?auto_1599800 ) ) ( HOIST-AT ?auto_1599801 ?auto_1599798 ) ( not ( = ?auto_1599803 ?auto_1599801 ) ) ( AVAILABLE ?auto_1599801 ) ( SURFACE-AT ?auto_1599796 ?auto_1599798 ) ( ON ?auto_1599796 ?auto_1599799 ) ( CLEAR ?auto_1599796 ) ( not ( = ?auto_1599797 ?auto_1599799 ) ) ( not ( = ?auto_1599796 ?auto_1599799 ) ) ( not ( = ?auto_1599795 ?auto_1599799 ) ) ( TRUCK-AT ?auto_1599802 ?auto_1599800 ) ( ON ?auto_1599793 ?auto_1599792 ) ( ON ?auto_1599794 ?auto_1599793 ) ( ON ?auto_1599791 ?auto_1599794 ) ( ON ?auto_1599795 ?auto_1599791 ) ( not ( = ?auto_1599792 ?auto_1599793 ) ) ( not ( = ?auto_1599792 ?auto_1599794 ) ) ( not ( = ?auto_1599792 ?auto_1599791 ) ) ( not ( = ?auto_1599792 ?auto_1599795 ) ) ( not ( = ?auto_1599792 ?auto_1599797 ) ) ( not ( = ?auto_1599792 ?auto_1599796 ) ) ( not ( = ?auto_1599792 ?auto_1599799 ) ) ( not ( = ?auto_1599793 ?auto_1599794 ) ) ( not ( = ?auto_1599793 ?auto_1599791 ) ) ( not ( = ?auto_1599793 ?auto_1599795 ) ) ( not ( = ?auto_1599793 ?auto_1599797 ) ) ( not ( = ?auto_1599793 ?auto_1599796 ) ) ( not ( = ?auto_1599793 ?auto_1599799 ) ) ( not ( = ?auto_1599794 ?auto_1599791 ) ) ( not ( = ?auto_1599794 ?auto_1599795 ) ) ( not ( = ?auto_1599794 ?auto_1599797 ) ) ( not ( = ?auto_1599794 ?auto_1599796 ) ) ( not ( = ?auto_1599794 ?auto_1599799 ) ) ( not ( = ?auto_1599791 ?auto_1599795 ) ) ( not ( = ?auto_1599791 ?auto_1599797 ) ) ( not ( = ?auto_1599791 ?auto_1599796 ) ) ( not ( = ?auto_1599791 ?auto_1599799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599795 ?auto_1599797 ?auto_1599796 )
      ( MAKE-6CRATE-VERIFY ?auto_1599792 ?auto_1599793 ?auto_1599794 ?auto_1599791 ?auto_1599795 ?auto_1599797 ?auto_1599796 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599856 - SURFACE
      ?auto_1599857 - SURFACE
      ?auto_1599858 - SURFACE
      ?auto_1599855 - SURFACE
      ?auto_1599859 - SURFACE
      ?auto_1599861 - SURFACE
      ?auto_1599860 - SURFACE
    )
    :vars
    (
      ?auto_1599865 - HOIST
      ?auto_1599862 - PLACE
      ?auto_1599866 - PLACE
      ?auto_1599864 - HOIST
      ?auto_1599867 - SURFACE
      ?auto_1599863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599865 ?auto_1599862 ) ( IS-CRATE ?auto_1599860 ) ( not ( = ?auto_1599861 ?auto_1599860 ) ) ( not ( = ?auto_1599859 ?auto_1599861 ) ) ( not ( = ?auto_1599859 ?auto_1599860 ) ) ( not ( = ?auto_1599866 ?auto_1599862 ) ) ( HOIST-AT ?auto_1599864 ?auto_1599866 ) ( not ( = ?auto_1599865 ?auto_1599864 ) ) ( AVAILABLE ?auto_1599864 ) ( SURFACE-AT ?auto_1599860 ?auto_1599866 ) ( ON ?auto_1599860 ?auto_1599867 ) ( CLEAR ?auto_1599860 ) ( not ( = ?auto_1599861 ?auto_1599867 ) ) ( not ( = ?auto_1599860 ?auto_1599867 ) ) ( not ( = ?auto_1599859 ?auto_1599867 ) ) ( TRUCK-AT ?auto_1599863 ?auto_1599862 ) ( SURFACE-AT ?auto_1599859 ?auto_1599862 ) ( CLEAR ?auto_1599859 ) ( LIFTING ?auto_1599865 ?auto_1599861 ) ( IS-CRATE ?auto_1599861 ) ( ON ?auto_1599857 ?auto_1599856 ) ( ON ?auto_1599858 ?auto_1599857 ) ( ON ?auto_1599855 ?auto_1599858 ) ( ON ?auto_1599859 ?auto_1599855 ) ( not ( = ?auto_1599856 ?auto_1599857 ) ) ( not ( = ?auto_1599856 ?auto_1599858 ) ) ( not ( = ?auto_1599856 ?auto_1599855 ) ) ( not ( = ?auto_1599856 ?auto_1599859 ) ) ( not ( = ?auto_1599856 ?auto_1599861 ) ) ( not ( = ?auto_1599856 ?auto_1599860 ) ) ( not ( = ?auto_1599856 ?auto_1599867 ) ) ( not ( = ?auto_1599857 ?auto_1599858 ) ) ( not ( = ?auto_1599857 ?auto_1599855 ) ) ( not ( = ?auto_1599857 ?auto_1599859 ) ) ( not ( = ?auto_1599857 ?auto_1599861 ) ) ( not ( = ?auto_1599857 ?auto_1599860 ) ) ( not ( = ?auto_1599857 ?auto_1599867 ) ) ( not ( = ?auto_1599858 ?auto_1599855 ) ) ( not ( = ?auto_1599858 ?auto_1599859 ) ) ( not ( = ?auto_1599858 ?auto_1599861 ) ) ( not ( = ?auto_1599858 ?auto_1599860 ) ) ( not ( = ?auto_1599858 ?auto_1599867 ) ) ( not ( = ?auto_1599855 ?auto_1599859 ) ) ( not ( = ?auto_1599855 ?auto_1599861 ) ) ( not ( = ?auto_1599855 ?auto_1599860 ) ) ( not ( = ?auto_1599855 ?auto_1599867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599859 ?auto_1599861 ?auto_1599860 )
      ( MAKE-6CRATE-VERIFY ?auto_1599856 ?auto_1599857 ?auto_1599858 ?auto_1599855 ?auto_1599859 ?auto_1599861 ?auto_1599860 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599920 - SURFACE
      ?auto_1599921 - SURFACE
      ?auto_1599922 - SURFACE
      ?auto_1599919 - SURFACE
      ?auto_1599923 - SURFACE
      ?auto_1599925 - SURFACE
      ?auto_1599924 - SURFACE
    )
    :vars
    (
      ?auto_1599930 - HOIST
      ?auto_1599927 - PLACE
      ?auto_1599931 - PLACE
      ?auto_1599928 - HOIST
      ?auto_1599929 - SURFACE
      ?auto_1599926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599930 ?auto_1599927 ) ( IS-CRATE ?auto_1599924 ) ( not ( = ?auto_1599925 ?auto_1599924 ) ) ( not ( = ?auto_1599923 ?auto_1599925 ) ) ( not ( = ?auto_1599923 ?auto_1599924 ) ) ( not ( = ?auto_1599931 ?auto_1599927 ) ) ( HOIST-AT ?auto_1599928 ?auto_1599931 ) ( not ( = ?auto_1599930 ?auto_1599928 ) ) ( AVAILABLE ?auto_1599928 ) ( SURFACE-AT ?auto_1599924 ?auto_1599931 ) ( ON ?auto_1599924 ?auto_1599929 ) ( CLEAR ?auto_1599924 ) ( not ( = ?auto_1599925 ?auto_1599929 ) ) ( not ( = ?auto_1599924 ?auto_1599929 ) ) ( not ( = ?auto_1599923 ?auto_1599929 ) ) ( TRUCK-AT ?auto_1599926 ?auto_1599927 ) ( SURFACE-AT ?auto_1599923 ?auto_1599927 ) ( CLEAR ?auto_1599923 ) ( IS-CRATE ?auto_1599925 ) ( AVAILABLE ?auto_1599930 ) ( IN ?auto_1599925 ?auto_1599926 ) ( ON ?auto_1599921 ?auto_1599920 ) ( ON ?auto_1599922 ?auto_1599921 ) ( ON ?auto_1599919 ?auto_1599922 ) ( ON ?auto_1599923 ?auto_1599919 ) ( not ( = ?auto_1599920 ?auto_1599921 ) ) ( not ( = ?auto_1599920 ?auto_1599922 ) ) ( not ( = ?auto_1599920 ?auto_1599919 ) ) ( not ( = ?auto_1599920 ?auto_1599923 ) ) ( not ( = ?auto_1599920 ?auto_1599925 ) ) ( not ( = ?auto_1599920 ?auto_1599924 ) ) ( not ( = ?auto_1599920 ?auto_1599929 ) ) ( not ( = ?auto_1599921 ?auto_1599922 ) ) ( not ( = ?auto_1599921 ?auto_1599919 ) ) ( not ( = ?auto_1599921 ?auto_1599923 ) ) ( not ( = ?auto_1599921 ?auto_1599925 ) ) ( not ( = ?auto_1599921 ?auto_1599924 ) ) ( not ( = ?auto_1599921 ?auto_1599929 ) ) ( not ( = ?auto_1599922 ?auto_1599919 ) ) ( not ( = ?auto_1599922 ?auto_1599923 ) ) ( not ( = ?auto_1599922 ?auto_1599925 ) ) ( not ( = ?auto_1599922 ?auto_1599924 ) ) ( not ( = ?auto_1599922 ?auto_1599929 ) ) ( not ( = ?auto_1599919 ?auto_1599923 ) ) ( not ( = ?auto_1599919 ?auto_1599925 ) ) ( not ( = ?auto_1599919 ?auto_1599924 ) ) ( not ( = ?auto_1599919 ?auto_1599929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599923 ?auto_1599925 ?auto_1599924 )
      ( MAKE-6CRATE-VERIFY ?auto_1599920 ?auto_1599921 ?auto_1599922 ?auto_1599919 ?auto_1599923 ?auto_1599925 ?auto_1599924 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601876 - SURFACE
      ?auto_1601877 - SURFACE
      ?auto_1601878 - SURFACE
      ?auto_1601875 - SURFACE
      ?auto_1601879 - SURFACE
      ?auto_1601881 - SURFACE
      ?auto_1601880 - SURFACE
      ?auto_1601882 - SURFACE
    )
    :vars
    (
      ?auto_1601884 - HOIST
      ?auto_1601883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601884 ?auto_1601883 ) ( SURFACE-AT ?auto_1601880 ?auto_1601883 ) ( CLEAR ?auto_1601880 ) ( LIFTING ?auto_1601884 ?auto_1601882 ) ( IS-CRATE ?auto_1601882 ) ( not ( = ?auto_1601880 ?auto_1601882 ) ) ( ON ?auto_1601877 ?auto_1601876 ) ( ON ?auto_1601878 ?auto_1601877 ) ( ON ?auto_1601875 ?auto_1601878 ) ( ON ?auto_1601879 ?auto_1601875 ) ( ON ?auto_1601881 ?auto_1601879 ) ( ON ?auto_1601880 ?auto_1601881 ) ( not ( = ?auto_1601876 ?auto_1601877 ) ) ( not ( = ?auto_1601876 ?auto_1601878 ) ) ( not ( = ?auto_1601876 ?auto_1601875 ) ) ( not ( = ?auto_1601876 ?auto_1601879 ) ) ( not ( = ?auto_1601876 ?auto_1601881 ) ) ( not ( = ?auto_1601876 ?auto_1601880 ) ) ( not ( = ?auto_1601876 ?auto_1601882 ) ) ( not ( = ?auto_1601877 ?auto_1601878 ) ) ( not ( = ?auto_1601877 ?auto_1601875 ) ) ( not ( = ?auto_1601877 ?auto_1601879 ) ) ( not ( = ?auto_1601877 ?auto_1601881 ) ) ( not ( = ?auto_1601877 ?auto_1601880 ) ) ( not ( = ?auto_1601877 ?auto_1601882 ) ) ( not ( = ?auto_1601878 ?auto_1601875 ) ) ( not ( = ?auto_1601878 ?auto_1601879 ) ) ( not ( = ?auto_1601878 ?auto_1601881 ) ) ( not ( = ?auto_1601878 ?auto_1601880 ) ) ( not ( = ?auto_1601878 ?auto_1601882 ) ) ( not ( = ?auto_1601875 ?auto_1601879 ) ) ( not ( = ?auto_1601875 ?auto_1601881 ) ) ( not ( = ?auto_1601875 ?auto_1601880 ) ) ( not ( = ?auto_1601875 ?auto_1601882 ) ) ( not ( = ?auto_1601879 ?auto_1601881 ) ) ( not ( = ?auto_1601879 ?auto_1601880 ) ) ( not ( = ?auto_1601879 ?auto_1601882 ) ) ( not ( = ?auto_1601881 ?auto_1601880 ) ) ( not ( = ?auto_1601881 ?auto_1601882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1601880 ?auto_1601882 )
      ( MAKE-7CRATE-VERIFY ?auto_1601876 ?auto_1601877 ?auto_1601878 ?auto_1601875 ?auto_1601879 ?auto_1601881 ?auto_1601880 ?auto_1601882 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601931 - SURFACE
      ?auto_1601932 - SURFACE
      ?auto_1601933 - SURFACE
      ?auto_1601930 - SURFACE
      ?auto_1601934 - SURFACE
      ?auto_1601936 - SURFACE
      ?auto_1601935 - SURFACE
      ?auto_1601937 - SURFACE
    )
    :vars
    (
      ?auto_1601940 - HOIST
      ?auto_1601938 - PLACE
      ?auto_1601939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601940 ?auto_1601938 ) ( SURFACE-AT ?auto_1601935 ?auto_1601938 ) ( CLEAR ?auto_1601935 ) ( IS-CRATE ?auto_1601937 ) ( not ( = ?auto_1601935 ?auto_1601937 ) ) ( TRUCK-AT ?auto_1601939 ?auto_1601938 ) ( AVAILABLE ?auto_1601940 ) ( IN ?auto_1601937 ?auto_1601939 ) ( ON ?auto_1601935 ?auto_1601936 ) ( not ( = ?auto_1601936 ?auto_1601935 ) ) ( not ( = ?auto_1601936 ?auto_1601937 ) ) ( ON ?auto_1601932 ?auto_1601931 ) ( ON ?auto_1601933 ?auto_1601932 ) ( ON ?auto_1601930 ?auto_1601933 ) ( ON ?auto_1601934 ?auto_1601930 ) ( ON ?auto_1601936 ?auto_1601934 ) ( not ( = ?auto_1601931 ?auto_1601932 ) ) ( not ( = ?auto_1601931 ?auto_1601933 ) ) ( not ( = ?auto_1601931 ?auto_1601930 ) ) ( not ( = ?auto_1601931 ?auto_1601934 ) ) ( not ( = ?auto_1601931 ?auto_1601936 ) ) ( not ( = ?auto_1601931 ?auto_1601935 ) ) ( not ( = ?auto_1601931 ?auto_1601937 ) ) ( not ( = ?auto_1601932 ?auto_1601933 ) ) ( not ( = ?auto_1601932 ?auto_1601930 ) ) ( not ( = ?auto_1601932 ?auto_1601934 ) ) ( not ( = ?auto_1601932 ?auto_1601936 ) ) ( not ( = ?auto_1601932 ?auto_1601935 ) ) ( not ( = ?auto_1601932 ?auto_1601937 ) ) ( not ( = ?auto_1601933 ?auto_1601930 ) ) ( not ( = ?auto_1601933 ?auto_1601934 ) ) ( not ( = ?auto_1601933 ?auto_1601936 ) ) ( not ( = ?auto_1601933 ?auto_1601935 ) ) ( not ( = ?auto_1601933 ?auto_1601937 ) ) ( not ( = ?auto_1601930 ?auto_1601934 ) ) ( not ( = ?auto_1601930 ?auto_1601936 ) ) ( not ( = ?auto_1601930 ?auto_1601935 ) ) ( not ( = ?auto_1601930 ?auto_1601937 ) ) ( not ( = ?auto_1601934 ?auto_1601936 ) ) ( not ( = ?auto_1601934 ?auto_1601935 ) ) ( not ( = ?auto_1601934 ?auto_1601937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601936 ?auto_1601935 ?auto_1601937 )
      ( MAKE-7CRATE-VERIFY ?auto_1601931 ?auto_1601932 ?auto_1601933 ?auto_1601930 ?auto_1601934 ?auto_1601936 ?auto_1601935 ?auto_1601937 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601994 - SURFACE
      ?auto_1601995 - SURFACE
      ?auto_1601996 - SURFACE
      ?auto_1601993 - SURFACE
      ?auto_1601997 - SURFACE
      ?auto_1601999 - SURFACE
      ?auto_1601998 - SURFACE
      ?auto_1602000 - SURFACE
    )
    :vars
    (
      ?auto_1602001 - HOIST
      ?auto_1602003 - PLACE
      ?auto_1602002 - TRUCK
      ?auto_1602004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602001 ?auto_1602003 ) ( SURFACE-AT ?auto_1601998 ?auto_1602003 ) ( CLEAR ?auto_1601998 ) ( IS-CRATE ?auto_1602000 ) ( not ( = ?auto_1601998 ?auto_1602000 ) ) ( AVAILABLE ?auto_1602001 ) ( IN ?auto_1602000 ?auto_1602002 ) ( ON ?auto_1601998 ?auto_1601999 ) ( not ( = ?auto_1601999 ?auto_1601998 ) ) ( not ( = ?auto_1601999 ?auto_1602000 ) ) ( TRUCK-AT ?auto_1602002 ?auto_1602004 ) ( not ( = ?auto_1602004 ?auto_1602003 ) ) ( ON ?auto_1601995 ?auto_1601994 ) ( ON ?auto_1601996 ?auto_1601995 ) ( ON ?auto_1601993 ?auto_1601996 ) ( ON ?auto_1601997 ?auto_1601993 ) ( ON ?auto_1601999 ?auto_1601997 ) ( not ( = ?auto_1601994 ?auto_1601995 ) ) ( not ( = ?auto_1601994 ?auto_1601996 ) ) ( not ( = ?auto_1601994 ?auto_1601993 ) ) ( not ( = ?auto_1601994 ?auto_1601997 ) ) ( not ( = ?auto_1601994 ?auto_1601999 ) ) ( not ( = ?auto_1601994 ?auto_1601998 ) ) ( not ( = ?auto_1601994 ?auto_1602000 ) ) ( not ( = ?auto_1601995 ?auto_1601996 ) ) ( not ( = ?auto_1601995 ?auto_1601993 ) ) ( not ( = ?auto_1601995 ?auto_1601997 ) ) ( not ( = ?auto_1601995 ?auto_1601999 ) ) ( not ( = ?auto_1601995 ?auto_1601998 ) ) ( not ( = ?auto_1601995 ?auto_1602000 ) ) ( not ( = ?auto_1601996 ?auto_1601993 ) ) ( not ( = ?auto_1601996 ?auto_1601997 ) ) ( not ( = ?auto_1601996 ?auto_1601999 ) ) ( not ( = ?auto_1601996 ?auto_1601998 ) ) ( not ( = ?auto_1601996 ?auto_1602000 ) ) ( not ( = ?auto_1601993 ?auto_1601997 ) ) ( not ( = ?auto_1601993 ?auto_1601999 ) ) ( not ( = ?auto_1601993 ?auto_1601998 ) ) ( not ( = ?auto_1601993 ?auto_1602000 ) ) ( not ( = ?auto_1601997 ?auto_1601999 ) ) ( not ( = ?auto_1601997 ?auto_1601998 ) ) ( not ( = ?auto_1601997 ?auto_1602000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601999 ?auto_1601998 ?auto_1602000 )
      ( MAKE-7CRATE-VERIFY ?auto_1601994 ?auto_1601995 ?auto_1601996 ?auto_1601993 ?auto_1601997 ?auto_1601999 ?auto_1601998 ?auto_1602000 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602064 - SURFACE
      ?auto_1602065 - SURFACE
      ?auto_1602066 - SURFACE
      ?auto_1602063 - SURFACE
      ?auto_1602067 - SURFACE
      ?auto_1602069 - SURFACE
      ?auto_1602068 - SURFACE
      ?auto_1602070 - SURFACE
    )
    :vars
    (
      ?auto_1602074 - HOIST
      ?auto_1602075 - PLACE
      ?auto_1602072 - TRUCK
      ?auto_1602073 - PLACE
      ?auto_1602071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602074 ?auto_1602075 ) ( SURFACE-AT ?auto_1602068 ?auto_1602075 ) ( CLEAR ?auto_1602068 ) ( IS-CRATE ?auto_1602070 ) ( not ( = ?auto_1602068 ?auto_1602070 ) ) ( AVAILABLE ?auto_1602074 ) ( ON ?auto_1602068 ?auto_1602069 ) ( not ( = ?auto_1602069 ?auto_1602068 ) ) ( not ( = ?auto_1602069 ?auto_1602070 ) ) ( TRUCK-AT ?auto_1602072 ?auto_1602073 ) ( not ( = ?auto_1602073 ?auto_1602075 ) ) ( HOIST-AT ?auto_1602071 ?auto_1602073 ) ( LIFTING ?auto_1602071 ?auto_1602070 ) ( not ( = ?auto_1602074 ?auto_1602071 ) ) ( ON ?auto_1602065 ?auto_1602064 ) ( ON ?auto_1602066 ?auto_1602065 ) ( ON ?auto_1602063 ?auto_1602066 ) ( ON ?auto_1602067 ?auto_1602063 ) ( ON ?auto_1602069 ?auto_1602067 ) ( not ( = ?auto_1602064 ?auto_1602065 ) ) ( not ( = ?auto_1602064 ?auto_1602066 ) ) ( not ( = ?auto_1602064 ?auto_1602063 ) ) ( not ( = ?auto_1602064 ?auto_1602067 ) ) ( not ( = ?auto_1602064 ?auto_1602069 ) ) ( not ( = ?auto_1602064 ?auto_1602068 ) ) ( not ( = ?auto_1602064 ?auto_1602070 ) ) ( not ( = ?auto_1602065 ?auto_1602066 ) ) ( not ( = ?auto_1602065 ?auto_1602063 ) ) ( not ( = ?auto_1602065 ?auto_1602067 ) ) ( not ( = ?auto_1602065 ?auto_1602069 ) ) ( not ( = ?auto_1602065 ?auto_1602068 ) ) ( not ( = ?auto_1602065 ?auto_1602070 ) ) ( not ( = ?auto_1602066 ?auto_1602063 ) ) ( not ( = ?auto_1602066 ?auto_1602067 ) ) ( not ( = ?auto_1602066 ?auto_1602069 ) ) ( not ( = ?auto_1602066 ?auto_1602068 ) ) ( not ( = ?auto_1602066 ?auto_1602070 ) ) ( not ( = ?auto_1602063 ?auto_1602067 ) ) ( not ( = ?auto_1602063 ?auto_1602069 ) ) ( not ( = ?auto_1602063 ?auto_1602068 ) ) ( not ( = ?auto_1602063 ?auto_1602070 ) ) ( not ( = ?auto_1602067 ?auto_1602069 ) ) ( not ( = ?auto_1602067 ?auto_1602068 ) ) ( not ( = ?auto_1602067 ?auto_1602070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602069 ?auto_1602068 ?auto_1602070 )
      ( MAKE-7CRATE-VERIFY ?auto_1602064 ?auto_1602065 ?auto_1602066 ?auto_1602063 ?auto_1602067 ?auto_1602069 ?auto_1602068 ?auto_1602070 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602141 - SURFACE
      ?auto_1602142 - SURFACE
      ?auto_1602143 - SURFACE
      ?auto_1602140 - SURFACE
      ?auto_1602144 - SURFACE
      ?auto_1602146 - SURFACE
      ?auto_1602145 - SURFACE
      ?auto_1602147 - SURFACE
    )
    :vars
    (
      ?auto_1602153 - HOIST
      ?auto_1602150 - PLACE
      ?auto_1602152 - TRUCK
      ?auto_1602149 - PLACE
      ?auto_1602148 - HOIST
      ?auto_1602151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602153 ?auto_1602150 ) ( SURFACE-AT ?auto_1602145 ?auto_1602150 ) ( CLEAR ?auto_1602145 ) ( IS-CRATE ?auto_1602147 ) ( not ( = ?auto_1602145 ?auto_1602147 ) ) ( AVAILABLE ?auto_1602153 ) ( ON ?auto_1602145 ?auto_1602146 ) ( not ( = ?auto_1602146 ?auto_1602145 ) ) ( not ( = ?auto_1602146 ?auto_1602147 ) ) ( TRUCK-AT ?auto_1602152 ?auto_1602149 ) ( not ( = ?auto_1602149 ?auto_1602150 ) ) ( HOIST-AT ?auto_1602148 ?auto_1602149 ) ( not ( = ?auto_1602153 ?auto_1602148 ) ) ( AVAILABLE ?auto_1602148 ) ( SURFACE-AT ?auto_1602147 ?auto_1602149 ) ( ON ?auto_1602147 ?auto_1602151 ) ( CLEAR ?auto_1602147 ) ( not ( = ?auto_1602145 ?auto_1602151 ) ) ( not ( = ?auto_1602147 ?auto_1602151 ) ) ( not ( = ?auto_1602146 ?auto_1602151 ) ) ( ON ?auto_1602142 ?auto_1602141 ) ( ON ?auto_1602143 ?auto_1602142 ) ( ON ?auto_1602140 ?auto_1602143 ) ( ON ?auto_1602144 ?auto_1602140 ) ( ON ?auto_1602146 ?auto_1602144 ) ( not ( = ?auto_1602141 ?auto_1602142 ) ) ( not ( = ?auto_1602141 ?auto_1602143 ) ) ( not ( = ?auto_1602141 ?auto_1602140 ) ) ( not ( = ?auto_1602141 ?auto_1602144 ) ) ( not ( = ?auto_1602141 ?auto_1602146 ) ) ( not ( = ?auto_1602141 ?auto_1602145 ) ) ( not ( = ?auto_1602141 ?auto_1602147 ) ) ( not ( = ?auto_1602141 ?auto_1602151 ) ) ( not ( = ?auto_1602142 ?auto_1602143 ) ) ( not ( = ?auto_1602142 ?auto_1602140 ) ) ( not ( = ?auto_1602142 ?auto_1602144 ) ) ( not ( = ?auto_1602142 ?auto_1602146 ) ) ( not ( = ?auto_1602142 ?auto_1602145 ) ) ( not ( = ?auto_1602142 ?auto_1602147 ) ) ( not ( = ?auto_1602142 ?auto_1602151 ) ) ( not ( = ?auto_1602143 ?auto_1602140 ) ) ( not ( = ?auto_1602143 ?auto_1602144 ) ) ( not ( = ?auto_1602143 ?auto_1602146 ) ) ( not ( = ?auto_1602143 ?auto_1602145 ) ) ( not ( = ?auto_1602143 ?auto_1602147 ) ) ( not ( = ?auto_1602143 ?auto_1602151 ) ) ( not ( = ?auto_1602140 ?auto_1602144 ) ) ( not ( = ?auto_1602140 ?auto_1602146 ) ) ( not ( = ?auto_1602140 ?auto_1602145 ) ) ( not ( = ?auto_1602140 ?auto_1602147 ) ) ( not ( = ?auto_1602140 ?auto_1602151 ) ) ( not ( = ?auto_1602144 ?auto_1602146 ) ) ( not ( = ?auto_1602144 ?auto_1602145 ) ) ( not ( = ?auto_1602144 ?auto_1602147 ) ) ( not ( = ?auto_1602144 ?auto_1602151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602146 ?auto_1602145 ?auto_1602147 )
      ( MAKE-7CRATE-VERIFY ?auto_1602141 ?auto_1602142 ?auto_1602143 ?auto_1602140 ?auto_1602144 ?auto_1602146 ?auto_1602145 ?auto_1602147 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602219 - SURFACE
      ?auto_1602220 - SURFACE
      ?auto_1602221 - SURFACE
      ?auto_1602218 - SURFACE
      ?auto_1602222 - SURFACE
      ?auto_1602224 - SURFACE
      ?auto_1602223 - SURFACE
      ?auto_1602225 - SURFACE
    )
    :vars
    (
      ?auto_1602229 - HOIST
      ?auto_1602228 - PLACE
      ?auto_1602231 - PLACE
      ?auto_1602227 - HOIST
      ?auto_1602226 - SURFACE
      ?auto_1602230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602229 ?auto_1602228 ) ( SURFACE-AT ?auto_1602223 ?auto_1602228 ) ( CLEAR ?auto_1602223 ) ( IS-CRATE ?auto_1602225 ) ( not ( = ?auto_1602223 ?auto_1602225 ) ) ( AVAILABLE ?auto_1602229 ) ( ON ?auto_1602223 ?auto_1602224 ) ( not ( = ?auto_1602224 ?auto_1602223 ) ) ( not ( = ?auto_1602224 ?auto_1602225 ) ) ( not ( = ?auto_1602231 ?auto_1602228 ) ) ( HOIST-AT ?auto_1602227 ?auto_1602231 ) ( not ( = ?auto_1602229 ?auto_1602227 ) ) ( AVAILABLE ?auto_1602227 ) ( SURFACE-AT ?auto_1602225 ?auto_1602231 ) ( ON ?auto_1602225 ?auto_1602226 ) ( CLEAR ?auto_1602225 ) ( not ( = ?auto_1602223 ?auto_1602226 ) ) ( not ( = ?auto_1602225 ?auto_1602226 ) ) ( not ( = ?auto_1602224 ?auto_1602226 ) ) ( TRUCK-AT ?auto_1602230 ?auto_1602228 ) ( ON ?auto_1602220 ?auto_1602219 ) ( ON ?auto_1602221 ?auto_1602220 ) ( ON ?auto_1602218 ?auto_1602221 ) ( ON ?auto_1602222 ?auto_1602218 ) ( ON ?auto_1602224 ?auto_1602222 ) ( not ( = ?auto_1602219 ?auto_1602220 ) ) ( not ( = ?auto_1602219 ?auto_1602221 ) ) ( not ( = ?auto_1602219 ?auto_1602218 ) ) ( not ( = ?auto_1602219 ?auto_1602222 ) ) ( not ( = ?auto_1602219 ?auto_1602224 ) ) ( not ( = ?auto_1602219 ?auto_1602223 ) ) ( not ( = ?auto_1602219 ?auto_1602225 ) ) ( not ( = ?auto_1602219 ?auto_1602226 ) ) ( not ( = ?auto_1602220 ?auto_1602221 ) ) ( not ( = ?auto_1602220 ?auto_1602218 ) ) ( not ( = ?auto_1602220 ?auto_1602222 ) ) ( not ( = ?auto_1602220 ?auto_1602224 ) ) ( not ( = ?auto_1602220 ?auto_1602223 ) ) ( not ( = ?auto_1602220 ?auto_1602225 ) ) ( not ( = ?auto_1602220 ?auto_1602226 ) ) ( not ( = ?auto_1602221 ?auto_1602218 ) ) ( not ( = ?auto_1602221 ?auto_1602222 ) ) ( not ( = ?auto_1602221 ?auto_1602224 ) ) ( not ( = ?auto_1602221 ?auto_1602223 ) ) ( not ( = ?auto_1602221 ?auto_1602225 ) ) ( not ( = ?auto_1602221 ?auto_1602226 ) ) ( not ( = ?auto_1602218 ?auto_1602222 ) ) ( not ( = ?auto_1602218 ?auto_1602224 ) ) ( not ( = ?auto_1602218 ?auto_1602223 ) ) ( not ( = ?auto_1602218 ?auto_1602225 ) ) ( not ( = ?auto_1602218 ?auto_1602226 ) ) ( not ( = ?auto_1602222 ?auto_1602224 ) ) ( not ( = ?auto_1602222 ?auto_1602223 ) ) ( not ( = ?auto_1602222 ?auto_1602225 ) ) ( not ( = ?auto_1602222 ?auto_1602226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602224 ?auto_1602223 ?auto_1602225 )
      ( MAKE-7CRATE-VERIFY ?auto_1602219 ?auto_1602220 ?auto_1602221 ?auto_1602218 ?auto_1602222 ?auto_1602224 ?auto_1602223 ?auto_1602225 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602297 - SURFACE
      ?auto_1602298 - SURFACE
      ?auto_1602299 - SURFACE
      ?auto_1602296 - SURFACE
      ?auto_1602300 - SURFACE
      ?auto_1602302 - SURFACE
      ?auto_1602301 - SURFACE
      ?auto_1602303 - SURFACE
    )
    :vars
    (
      ?auto_1602304 - HOIST
      ?auto_1602308 - PLACE
      ?auto_1602309 - PLACE
      ?auto_1602307 - HOIST
      ?auto_1602305 - SURFACE
      ?auto_1602306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602304 ?auto_1602308 ) ( IS-CRATE ?auto_1602303 ) ( not ( = ?auto_1602301 ?auto_1602303 ) ) ( not ( = ?auto_1602302 ?auto_1602301 ) ) ( not ( = ?auto_1602302 ?auto_1602303 ) ) ( not ( = ?auto_1602309 ?auto_1602308 ) ) ( HOIST-AT ?auto_1602307 ?auto_1602309 ) ( not ( = ?auto_1602304 ?auto_1602307 ) ) ( AVAILABLE ?auto_1602307 ) ( SURFACE-AT ?auto_1602303 ?auto_1602309 ) ( ON ?auto_1602303 ?auto_1602305 ) ( CLEAR ?auto_1602303 ) ( not ( = ?auto_1602301 ?auto_1602305 ) ) ( not ( = ?auto_1602303 ?auto_1602305 ) ) ( not ( = ?auto_1602302 ?auto_1602305 ) ) ( TRUCK-AT ?auto_1602306 ?auto_1602308 ) ( SURFACE-AT ?auto_1602302 ?auto_1602308 ) ( CLEAR ?auto_1602302 ) ( LIFTING ?auto_1602304 ?auto_1602301 ) ( IS-CRATE ?auto_1602301 ) ( ON ?auto_1602298 ?auto_1602297 ) ( ON ?auto_1602299 ?auto_1602298 ) ( ON ?auto_1602296 ?auto_1602299 ) ( ON ?auto_1602300 ?auto_1602296 ) ( ON ?auto_1602302 ?auto_1602300 ) ( not ( = ?auto_1602297 ?auto_1602298 ) ) ( not ( = ?auto_1602297 ?auto_1602299 ) ) ( not ( = ?auto_1602297 ?auto_1602296 ) ) ( not ( = ?auto_1602297 ?auto_1602300 ) ) ( not ( = ?auto_1602297 ?auto_1602302 ) ) ( not ( = ?auto_1602297 ?auto_1602301 ) ) ( not ( = ?auto_1602297 ?auto_1602303 ) ) ( not ( = ?auto_1602297 ?auto_1602305 ) ) ( not ( = ?auto_1602298 ?auto_1602299 ) ) ( not ( = ?auto_1602298 ?auto_1602296 ) ) ( not ( = ?auto_1602298 ?auto_1602300 ) ) ( not ( = ?auto_1602298 ?auto_1602302 ) ) ( not ( = ?auto_1602298 ?auto_1602301 ) ) ( not ( = ?auto_1602298 ?auto_1602303 ) ) ( not ( = ?auto_1602298 ?auto_1602305 ) ) ( not ( = ?auto_1602299 ?auto_1602296 ) ) ( not ( = ?auto_1602299 ?auto_1602300 ) ) ( not ( = ?auto_1602299 ?auto_1602302 ) ) ( not ( = ?auto_1602299 ?auto_1602301 ) ) ( not ( = ?auto_1602299 ?auto_1602303 ) ) ( not ( = ?auto_1602299 ?auto_1602305 ) ) ( not ( = ?auto_1602296 ?auto_1602300 ) ) ( not ( = ?auto_1602296 ?auto_1602302 ) ) ( not ( = ?auto_1602296 ?auto_1602301 ) ) ( not ( = ?auto_1602296 ?auto_1602303 ) ) ( not ( = ?auto_1602296 ?auto_1602305 ) ) ( not ( = ?auto_1602300 ?auto_1602302 ) ) ( not ( = ?auto_1602300 ?auto_1602301 ) ) ( not ( = ?auto_1602300 ?auto_1602303 ) ) ( not ( = ?auto_1602300 ?auto_1602305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602302 ?auto_1602301 ?auto_1602303 )
      ( MAKE-7CRATE-VERIFY ?auto_1602297 ?auto_1602298 ?auto_1602299 ?auto_1602296 ?auto_1602300 ?auto_1602302 ?auto_1602301 ?auto_1602303 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602375 - SURFACE
      ?auto_1602376 - SURFACE
      ?auto_1602377 - SURFACE
      ?auto_1602374 - SURFACE
      ?auto_1602378 - SURFACE
      ?auto_1602380 - SURFACE
      ?auto_1602379 - SURFACE
      ?auto_1602381 - SURFACE
    )
    :vars
    (
      ?auto_1602383 - HOIST
      ?auto_1602382 - PLACE
      ?auto_1602385 - PLACE
      ?auto_1602384 - HOIST
      ?auto_1602386 - SURFACE
      ?auto_1602387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602383 ?auto_1602382 ) ( IS-CRATE ?auto_1602381 ) ( not ( = ?auto_1602379 ?auto_1602381 ) ) ( not ( = ?auto_1602380 ?auto_1602379 ) ) ( not ( = ?auto_1602380 ?auto_1602381 ) ) ( not ( = ?auto_1602385 ?auto_1602382 ) ) ( HOIST-AT ?auto_1602384 ?auto_1602385 ) ( not ( = ?auto_1602383 ?auto_1602384 ) ) ( AVAILABLE ?auto_1602384 ) ( SURFACE-AT ?auto_1602381 ?auto_1602385 ) ( ON ?auto_1602381 ?auto_1602386 ) ( CLEAR ?auto_1602381 ) ( not ( = ?auto_1602379 ?auto_1602386 ) ) ( not ( = ?auto_1602381 ?auto_1602386 ) ) ( not ( = ?auto_1602380 ?auto_1602386 ) ) ( TRUCK-AT ?auto_1602387 ?auto_1602382 ) ( SURFACE-AT ?auto_1602380 ?auto_1602382 ) ( CLEAR ?auto_1602380 ) ( IS-CRATE ?auto_1602379 ) ( AVAILABLE ?auto_1602383 ) ( IN ?auto_1602379 ?auto_1602387 ) ( ON ?auto_1602376 ?auto_1602375 ) ( ON ?auto_1602377 ?auto_1602376 ) ( ON ?auto_1602374 ?auto_1602377 ) ( ON ?auto_1602378 ?auto_1602374 ) ( ON ?auto_1602380 ?auto_1602378 ) ( not ( = ?auto_1602375 ?auto_1602376 ) ) ( not ( = ?auto_1602375 ?auto_1602377 ) ) ( not ( = ?auto_1602375 ?auto_1602374 ) ) ( not ( = ?auto_1602375 ?auto_1602378 ) ) ( not ( = ?auto_1602375 ?auto_1602380 ) ) ( not ( = ?auto_1602375 ?auto_1602379 ) ) ( not ( = ?auto_1602375 ?auto_1602381 ) ) ( not ( = ?auto_1602375 ?auto_1602386 ) ) ( not ( = ?auto_1602376 ?auto_1602377 ) ) ( not ( = ?auto_1602376 ?auto_1602374 ) ) ( not ( = ?auto_1602376 ?auto_1602378 ) ) ( not ( = ?auto_1602376 ?auto_1602380 ) ) ( not ( = ?auto_1602376 ?auto_1602379 ) ) ( not ( = ?auto_1602376 ?auto_1602381 ) ) ( not ( = ?auto_1602376 ?auto_1602386 ) ) ( not ( = ?auto_1602377 ?auto_1602374 ) ) ( not ( = ?auto_1602377 ?auto_1602378 ) ) ( not ( = ?auto_1602377 ?auto_1602380 ) ) ( not ( = ?auto_1602377 ?auto_1602379 ) ) ( not ( = ?auto_1602377 ?auto_1602381 ) ) ( not ( = ?auto_1602377 ?auto_1602386 ) ) ( not ( = ?auto_1602374 ?auto_1602378 ) ) ( not ( = ?auto_1602374 ?auto_1602380 ) ) ( not ( = ?auto_1602374 ?auto_1602379 ) ) ( not ( = ?auto_1602374 ?auto_1602381 ) ) ( not ( = ?auto_1602374 ?auto_1602386 ) ) ( not ( = ?auto_1602378 ?auto_1602380 ) ) ( not ( = ?auto_1602378 ?auto_1602379 ) ) ( not ( = ?auto_1602378 ?auto_1602381 ) ) ( not ( = ?auto_1602378 ?auto_1602386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602380 ?auto_1602379 ?auto_1602381 )
      ( MAKE-7CRATE-VERIFY ?auto_1602375 ?auto_1602376 ?auto_1602377 ?auto_1602374 ?auto_1602378 ?auto_1602380 ?auto_1602379 ?auto_1602381 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605294 - SURFACE
      ?auto_1605295 - SURFACE
      ?auto_1605296 - SURFACE
      ?auto_1605293 - SURFACE
      ?auto_1605297 - SURFACE
      ?auto_1605299 - SURFACE
      ?auto_1605298 - SURFACE
      ?auto_1605300 - SURFACE
      ?auto_1605301 - SURFACE
    )
    :vars
    (
      ?auto_1605303 - HOIST
      ?auto_1605302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605303 ?auto_1605302 ) ( SURFACE-AT ?auto_1605300 ?auto_1605302 ) ( CLEAR ?auto_1605300 ) ( LIFTING ?auto_1605303 ?auto_1605301 ) ( IS-CRATE ?auto_1605301 ) ( not ( = ?auto_1605300 ?auto_1605301 ) ) ( ON ?auto_1605295 ?auto_1605294 ) ( ON ?auto_1605296 ?auto_1605295 ) ( ON ?auto_1605293 ?auto_1605296 ) ( ON ?auto_1605297 ?auto_1605293 ) ( ON ?auto_1605299 ?auto_1605297 ) ( ON ?auto_1605298 ?auto_1605299 ) ( ON ?auto_1605300 ?auto_1605298 ) ( not ( = ?auto_1605294 ?auto_1605295 ) ) ( not ( = ?auto_1605294 ?auto_1605296 ) ) ( not ( = ?auto_1605294 ?auto_1605293 ) ) ( not ( = ?auto_1605294 ?auto_1605297 ) ) ( not ( = ?auto_1605294 ?auto_1605299 ) ) ( not ( = ?auto_1605294 ?auto_1605298 ) ) ( not ( = ?auto_1605294 ?auto_1605300 ) ) ( not ( = ?auto_1605294 ?auto_1605301 ) ) ( not ( = ?auto_1605295 ?auto_1605296 ) ) ( not ( = ?auto_1605295 ?auto_1605293 ) ) ( not ( = ?auto_1605295 ?auto_1605297 ) ) ( not ( = ?auto_1605295 ?auto_1605299 ) ) ( not ( = ?auto_1605295 ?auto_1605298 ) ) ( not ( = ?auto_1605295 ?auto_1605300 ) ) ( not ( = ?auto_1605295 ?auto_1605301 ) ) ( not ( = ?auto_1605296 ?auto_1605293 ) ) ( not ( = ?auto_1605296 ?auto_1605297 ) ) ( not ( = ?auto_1605296 ?auto_1605299 ) ) ( not ( = ?auto_1605296 ?auto_1605298 ) ) ( not ( = ?auto_1605296 ?auto_1605300 ) ) ( not ( = ?auto_1605296 ?auto_1605301 ) ) ( not ( = ?auto_1605293 ?auto_1605297 ) ) ( not ( = ?auto_1605293 ?auto_1605299 ) ) ( not ( = ?auto_1605293 ?auto_1605298 ) ) ( not ( = ?auto_1605293 ?auto_1605300 ) ) ( not ( = ?auto_1605293 ?auto_1605301 ) ) ( not ( = ?auto_1605297 ?auto_1605299 ) ) ( not ( = ?auto_1605297 ?auto_1605298 ) ) ( not ( = ?auto_1605297 ?auto_1605300 ) ) ( not ( = ?auto_1605297 ?auto_1605301 ) ) ( not ( = ?auto_1605299 ?auto_1605298 ) ) ( not ( = ?auto_1605299 ?auto_1605300 ) ) ( not ( = ?auto_1605299 ?auto_1605301 ) ) ( not ( = ?auto_1605298 ?auto_1605300 ) ) ( not ( = ?auto_1605298 ?auto_1605301 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1605300 ?auto_1605301 )
      ( MAKE-8CRATE-VERIFY ?auto_1605294 ?auto_1605295 ?auto_1605296 ?auto_1605293 ?auto_1605297 ?auto_1605299 ?auto_1605298 ?auto_1605300 ?auto_1605301 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605361 - SURFACE
      ?auto_1605362 - SURFACE
      ?auto_1605363 - SURFACE
      ?auto_1605360 - SURFACE
      ?auto_1605364 - SURFACE
      ?auto_1605366 - SURFACE
      ?auto_1605365 - SURFACE
      ?auto_1605367 - SURFACE
      ?auto_1605368 - SURFACE
    )
    :vars
    (
      ?auto_1605370 - HOIST
      ?auto_1605371 - PLACE
      ?auto_1605369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605370 ?auto_1605371 ) ( SURFACE-AT ?auto_1605367 ?auto_1605371 ) ( CLEAR ?auto_1605367 ) ( IS-CRATE ?auto_1605368 ) ( not ( = ?auto_1605367 ?auto_1605368 ) ) ( TRUCK-AT ?auto_1605369 ?auto_1605371 ) ( AVAILABLE ?auto_1605370 ) ( IN ?auto_1605368 ?auto_1605369 ) ( ON ?auto_1605367 ?auto_1605365 ) ( not ( = ?auto_1605365 ?auto_1605367 ) ) ( not ( = ?auto_1605365 ?auto_1605368 ) ) ( ON ?auto_1605362 ?auto_1605361 ) ( ON ?auto_1605363 ?auto_1605362 ) ( ON ?auto_1605360 ?auto_1605363 ) ( ON ?auto_1605364 ?auto_1605360 ) ( ON ?auto_1605366 ?auto_1605364 ) ( ON ?auto_1605365 ?auto_1605366 ) ( not ( = ?auto_1605361 ?auto_1605362 ) ) ( not ( = ?auto_1605361 ?auto_1605363 ) ) ( not ( = ?auto_1605361 ?auto_1605360 ) ) ( not ( = ?auto_1605361 ?auto_1605364 ) ) ( not ( = ?auto_1605361 ?auto_1605366 ) ) ( not ( = ?auto_1605361 ?auto_1605365 ) ) ( not ( = ?auto_1605361 ?auto_1605367 ) ) ( not ( = ?auto_1605361 ?auto_1605368 ) ) ( not ( = ?auto_1605362 ?auto_1605363 ) ) ( not ( = ?auto_1605362 ?auto_1605360 ) ) ( not ( = ?auto_1605362 ?auto_1605364 ) ) ( not ( = ?auto_1605362 ?auto_1605366 ) ) ( not ( = ?auto_1605362 ?auto_1605365 ) ) ( not ( = ?auto_1605362 ?auto_1605367 ) ) ( not ( = ?auto_1605362 ?auto_1605368 ) ) ( not ( = ?auto_1605363 ?auto_1605360 ) ) ( not ( = ?auto_1605363 ?auto_1605364 ) ) ( not ( = ?auto_1605363 ?auto_1605366 ) ) ( not ( = ?auto_1605363 ?auto_1605365 ) ) ( not ( = ?auto_1605363 ?auto_1605367 ) ) ( not ( = ?auto_1605363 ?auto_1605368 ) ) ( not ( = ?auto_1605360 ?auto_1605364 ) ) ( not ( = ?auto_1605360 ?auto_1605366 ) ) ( not ( = ?auto_1605360 ?auto_1605365 ) ) ( not ( = ?auto_1605360 ?auto_1605367 ) ) ( not ( = ?auto_1605360 ?auto_1605368 ) ) ( not ( = ?auto_1605364 ?auto_1605366 ) ) ( not ( = ?auto_1605364 ?auto_1605365 ) ) ( not ( = ?auto_1605364 ?auto_1605367 ) ) ( not ( = ?auto_1605364 ?auto_1605368 ) ) ( not ( = ?auto_1605366 ?auto_1605365 ) ) ( not ( = ?auto_1605366 ?auto_1605367 ) ) ( not ( = ?auto_1605366 ?auto_1605368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605365 ?auto_1605367 ?auto_1605368 )
      ( MAKE-8CRATE-VERIFY ?auto_1605361 ?auto_1605362 ?auto_1605363 ?auto_1605360 ?auto_1605364 ?auto_1605366 ?auto_1605365 ?auto_1605367 ?auto_1605368 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605437 - SURFACE
      ?auto_1605438 - SURFACE
      ?auto_1605439 - SURFACE
      ?auto_1605436 - SURFACE
      ?auto_1605440 - SURFACE
      ?auto_1605442 - SURFACE
      ?auto_1605441 - SURFACE
      ?auto_1605443 - SURFACE
      ?auto_1605444 - SURFACE
    )
    :vars
    (
      ?auto_1605447 - HOIST
      ?auto_1605448 - PLACE
      ?auto_1605445 - TRUCK
      ?auto_1605446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605447 ?auto_1605448 ) ( SURFACE-AT ?auto_1605443 ?auto_1605448 ) ( CLEAR ?auto_1605443 ) ( IS-CRATE ?auto_1605444 ) ( not ( = ?auto_1605443 ?auto_1605444 ) ) ( AVAILABLE ?auto_1605447 ) ( IN ?auto_1605444 ?auto_1605445 ) ( ON ?auto_1605443 ?auto_1605441 ) ( not ( = ?auto_1605441 ?auto_1605443 ) ) ( not ( = ?auto_1605441 ?auto_1605444 ) ) ( TRUCK-AT ?auto_1605445 ?auto_1605446 ) ( not ( = ?auto_1605446 ?auto_1605448 ) ) ( ON ?auto_1605438 ?auto_1605437 ) ( ON ?auto_1605439 ?auto_1605438 ) ( ON ?auto_1605436 ?auto_1605439 ) ( ON ?auto_1605440 ?auto_1605436 ) ( ON ?auto_1605442 ?auto_1605440 ) ( ON ?auto_1605441 ?auto_1605442 ) ( not ( = ?auto_1605437 ?auto_1605438 ) ) ( not ( = ?auto_1605437 ?auto_1605439 ) ) ( not ( = ?auto_1605437 ?auto_1605436 ) ) ( not ( = ?auto_1605437 ?auto_1605440 ) ) ( not ( = ?auto_1605437 ?auto_1605442 ) ) ( not ( = ?auto_1605437 ?auto_1605441 ) ) ( not ( = ?auto_1605437 ?auto_1605443 ) ) ( not ( = ?auto_1605437 ?auto_1605444 ) ) ( not ( = ?auto_1605438 ?auto_1605439 ) ) ( not ( = ?auto_1605438 ?auto_1605436 ) ) ( not ( = ?auto_1605438 ?auto_1605440 ) ) ( not ( = ?auto_1605438 ?auto_1605442 ) ) ( not ( = ?auto_1605438 ?auto_1605441 ) ) ( not ( = ?auto_1605438 ?auto_1605443 ) ) ( not ( = ?auto_1605438 ?auto_1605444 ) ) ( not ( = ?auto_1605439 ?auto_1605436 ) ) ( not ( = ?auto_1605439 ?auto_1605440 ) ) ( not ( = ?auto_1605439 ?auto_1605442 ) ) ( not ( = ?auto_1605439 ?auto_1605441 ) ) ( not ( = ?auto_1605439 ?auto_1605443 ) ) ( not ( = ?auto_1605439 ?auto_1605444 ) ) ( not ( = ?auto_1605436 ?auto_1605440 ) ) ( not ( = ?auto_1605436 ?auto_1605442 ) ) ( not ( = ?auto_1605436 ?auto_1605441 ) ) ( not ( = ?auto_1605436 ?auto_1605443 ) ) ( not ( = ?auto_1605436 ?auto_1605444 ) ) ( not ( = ?auto_1605440 ?auto_1605442 ) ) ( not ( = ?auto_1605440 ?auto_1605441 ) ) ( not ( = ?auto_1605440 ?auto_1605443 ) ) ( not ( = ?auto_1605440 ?auto_1605444 ) ) ( not ( = ?auto_1605442 ?auto_1605441 ) ) ( not ( = ?auto_1605442 ?auto_1605443 ) ) ( not ( = ?auto_1605442 ?auto_1605444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605441 ?auto_1605443 ?auto_1605444 )
      ( MAKE-8CRATE-VERIFY ?auto_1605437 ?auto_1605438 ?auto_1605439 ?auto_1605436 ?auto_1605440 ?auto_1605442 ?auto_1605441 ?auto_1605443 ?auto_1605444 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605521 - SURFACE
      ?auto_1605522 - SURFACE
      ?auto_1605523 - SURFACE
      ?auto_1605520 - SURFACE
      ?auto_1605524 - SURFACE
      ?auto_1605526 - SURFACE
      ?auto_1605525 - SURFACE
      ?auto_1605527 - SURFACE
      ?auto_1605528 - SURFACE
    )
    :vars
    (
      ?auto_1605531 - HOIST
      ?auto_1605529 - PLACE
      ?auto_1605530 - TRUCK
      ?auto_1605532 - PLACE
      ?auto_1605533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605531 ?auto_1605529 ) ( SURFACE-AT ?auto_1605527 ?auto_1605529 ) ( CLEAR ?auto_1605527 ) ( IS-CRATE ?auto_1605528 ) ( not ( = ?auto_1605527 ?auto_1605528 ) ) ( AVAILABLE ?auto_1605531 ) ( ON ?auto_1605527 ?auto_1605525 ) ( not ( = ?auto_1605525 ?auto_1605527 ) ) ( not ( = ?auto_1605525 ?auto_1605528 ) ) ( TRUCK-AT ?auto_1605530 ?auto_1605532 ) ( not ( = ?auto_1605532 ?auto_1605529 ) ) ( HOIST-AT ?auto_1605533 ?auto_1605532 ) ( LIFTING ?auto_1605533 ?auto_1605528 ) ( not ( = ?auto_1605531 ?auto_1605533 ) ) ( ON ?auto_1605522 ?auto_1605521 ) ( ON ?auto_1605523 ?auto_1605522 ) ( ON ?auto_1605520 ?auto_1605523 ) ( ON ?auto_1605524 ?auto_1605520 ) ( ON ?auto_1605526 ?auto_1605524 ) ( ON ?auto_1605525 ?auto_1605526 ) ( not ( = ?auto_1605521 ?auto_1605522 ) ) ( not ( = ?auto_1605521 ?auto_1605523 ) ) ( not ( = ?auto_1605521 ?auto_1605520 ) ) ( not ( = ?auto_1605521 ?auto_1605524 ) ) ( not ( = ?auto_1605521 ?auto_1605526 ) ) ( not ( = ?auto_1605521 ?auto_1605525 ) ) ( not ( = ?auto_1605521 ?auto_1605527 ) ) ( not ( = ?auto_1605521 ?auto_1605528 ) ) ( not ( = ?auto_1605522 ?auto_1605523 ) ) ( not ( = ?auto_1605522 ?auto_1605520 ) ) ( not ( = ?auto_1605522 ?auto_1605524 ) ) ( not ( = ?auto_1605522 ?auto_1605526 ) ) ( not ( = ?auto_1605522 ?auto_1605525 ) ) ( not ( = ?auto_1605522 ?auto_1605527 ) ) ( not ( = ?auto_1605522 ?auto_1605528 ) ) ( not ( = ?auto_1605523 ?auto_1605520 ) ) ( not ( = ?auto_1605523 ?auto_1605524 ) ) ( not ( = ?auto_1605523 ?auto_1605526 ) ) ( not ( = ?auto_1605523 ?auto_1605525 ) ) ( not ( = ?auto_1605523 ?auto_1605527 ) ) ( not ( = ?auto_1605523 ?auto_1605528 ) ) ( not ( = ?auto_1605520 ?auto_1605524 ) ) ( not ( = ?auto_1605520 ?auto_1605526 ) ) ( not ( = ?auto_1605520 ?auto_1605525 ) ) ( not ( = ?auto_1605520 ?auto_1605527 ) ) ( not ( = ?auto_1605520 ?auto_1605528 ) ) ( not ( = ?auto_1605524 ?auto_1605526 ) ) ( not ( = ?auto_1605524 ?auto_1605525 ) ) ( not ( = ?auto_1605524 ?auto_1605527 ) ) ( not ( = ?auto_1605524 ?auto_1605528 ) ) ( not ( = ?auto_1605526 ?auto_1605525 ) ) ( not ( = ?auto_1605526 ?auto_1605527 ) ) ( not ( = ?auto_1605526 ?auto_1605528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605525 ?auto_1605527 ?auto_1605528 )
      ( MAKE-8CRATE-VERIFY ?auto_1605521 ?auto_1605522 ?auto_1605523 ?auto_1605520 ?auto_1605524 ?auto_1605526 ?auto_1605525 ?auto_1605527 ?auto_1605528 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605613 - SURFACE
      ?auto_1605614 - SURFACE
      ?auto_1605615 - SURFACE
      ?auto_1605612 - SURFACE
      ?auto_1605616 - SURFACE
      ?auto_1605618 - SURFACE
      ?auto_1605617 - SURFACE
      ?auto_1605619 - SURFACE
      ?auto_1605620 - SURFACE
    )
    :vars
    (
      ?auto_1605622 - HOIST
      ?auto_1605624 - PLACE
      ?auto_1605626 - TRUCK
      ?auto_1605621 - PLACE
      ?auto_1605625 - HOIST
      ?auto_1605623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605622 ?auto_1605624 ) ( SURFACE-AT ?auto_1605619 ?auto_1605624 ) ( CLEAR ?auto_1605619 ) ( IS-CRATE ?auto_1605620 ) ( not ( = ?auto_1605619 ?auto_1605620 ) ) ( AVAILABLE ?auto_1605622 ) ( ON ?auto_1605619 ?auto_1605617 ) ( not ( = ?auto_1605617 ?auto_1605619 ) ) ( not ( = ?auto_1605617 ?auto_1605620 ) ) ( TRUCK-AT ?auto_1605626 ?auto_1605621 ) ( not ( = ?auto_1605621 ?auto_1605624 ) ) ( HOIST-AT ?auto_1605625 ?auto_1605621 ) ( not ( = ?auto_1605622 ?auto_1605625 ) ) ( AVAILABLE ?auto_1605625 ) ( SURFACE-AT ?auto_1605620 ?auto_1605621 ) ( ON ?auto_1605620 ?auto_1605623 ) ( CLEAR ?auto_1605620 ) ( not ( = ?auto_1605619 ?auto_1605623 ) ) ( not ( = ?auto_1605620 ?auto_1605623 ) ) ( not ( = ?auto_1605617 ?auto_1605623 ) ) ( ON ?auto_1605614 ?auto_1605613 ) ( ON ?auto_1605615 ?auto_1605614 ) ( ON ?auto_1605612 ?auto_1605615 ) ( ON ?auto_1605616 ?auto_1605612 ) ( ON ?auto_1605618 ?auto_1605616 ) ( ON ?auto_1605617 ?auto_1605618 ) ( not ( = ?auto_1605613 ?auto_1605614 ) ) ( not ( = ?auto_1605613 ?auto_1605615 ) ) ( not ( = ?auto_1605613 ?auto_1605612 ) ) ( not ( = ?auto_1605613 ?auto_1605616 ) ) ( not ( = ?auto_1605613 ?auto_1605618 ) ) ( not ( = ?auto_1605613 ?auto_1605617 ) ) ( not ( = ?auto_1605613 ?auto_1605619 ) ) ( not ( = ?auto_1605613 ?auto_1605620 ) ) ( not ( = ?auto_1605613 ?auto_1605623 ) ) ( not ( = ?auto_1605614 ?auto_1605615 ) ) ( not ( = ?auto_1605614 ?auto_1605612 ) ) ( not ( = ?auto_1605614 ?auto_1605616 ) ) ( not ( = ?auto_1605614 ?auto_1605618 ) ) ( not ( = ?auto_1605614 ?auto_1605617 ) ) ( not ( = ?auto_1605614 ?auto_1605619 ) ) ( not ( = ?auto_1605614 ?auto_1605620 ) ) ( not ( = ?auto_1605614 ?auto_1605623 ) ) ( not ( = ?auto_1605615 ?auto_1605612 ) ) ( not ( = ?auto_1605615 ?auto_1605616 ) ) ( not ( = ?auto_1605615 ?auto_1605618 ) ) ( not ( = ?auto_1605615 ?auto_1605617 ) ) ( not ( = ?auto_1605615 ?auto_1605619 ) ) ( not ( = ?auto_1605615 ?auto_1605620 ) ) ( not ( = ?auto_1605615 ?auto_1605623 ) ) ( not ( = ?auto_1605612 ?auto_1605616 ) ) ( not ( = ?auto_1605612 ?auto_1605618 ) ) ( not ( = ?auto_1605612 ?auto_1605617 ) ) ( not ( = ?auto_1605612 ?auto_1605619 ) ) ( not ( = ?auto_1605612 ?auto_1605620 ) ) ( not ( = ?auto_1605612 ?auto_1605623 ) ) ( not ( = ?auto_1605616 ?auto_1605618 ) ) ( not ( = ?auto_1605616 ?auto_1605617 ) ) ( not ( = ?auto_1605616 ?auto_1605619 ) ) ( not ( = ?auto_1605616 ?auto_1605620 ) ) ( not ( = ?auto_1605616 ?auto_1605623 ) ) ( not ( = ?auto_1605618 ?auto_1605617 ) ) ( not ( = ?auto_1605618 ?auto_1605619 ) ) ( not ( = ?auto_1605618 ?auto_1605620 ) ) ( not ( = ?auto_1605618 ?auto_1605623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605617 ?auto_1605619 ?auto_1605620 )
      ( MAKE-8CRATE-VERIFY ?auto_1605613 ?auto_1605614 ?auto_1605615 ?auto_1605612 ?auto_1605616 ?auto_1605618 ?auto_1605617 ?auto_1605619 ?auto_1605620 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605706 - SURFACE
      ?auto_1605707 - SURFACE
      ?auto_1605708 - SURFACE
      ?auto_1605705 - SURFACE
      ?auto_1605709 - SURFACE
      ?auto_1605711 - SURFACE
      ?auto_1605710 - SURFACE
      ?auto_1605712 - SURFACE
      ?auto_1605713 - SURFACE
    )
    :vars
    (
      ?auto_1605715 - HOIST
      ?auto_1605717 - PLACE
      ?auto_1605719 - PLACE
      ?auto_1605718 - HOIST
      ?auto_1605714 - SURFACE
      ?auto_1605716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605715 ?auto_1605717 ) ( SURFACE-AT ?auto_1605712 ?auto_1605717 ) ( CLEAR ?auto_1605712 ) ( IS-CRATE ?auto_1605713 ) ( not ( = ?auto_1605712 ?auto_1605713 ) ) ( AVAILABLE ?auto_1605715 ) ( ON ?auto_1605712 ?auto_1605710 ) ( not ( = ?auto_1605710 ?auto_1605712 ) ) ( not ( = ?auto_1605710 ?auto_1605713 ) ) ( not ( = ?auto_1605719 ?auto_1605717 ) ) ( HOIST-AT ?auto_1605718 ?auto_1605719 ) ( not ( = ?auto_1605715 ?auto_1605718 ) ) ( AVAILABLE ?auto_1605718 ) ( SURFACE-AT ?auto_1605713 ?auto_1605719 ) ( ON ?auto_1605713 ?auto_1605714 ) ( CLEAR ?auto_1605713 ) ( not ( = ?auto_1605712 ?auto_1605714 ) ) ( not ( = ?auto_1605713 ?auto_1605714 ) ) ( not ( = ?auto_1605710 ?auto_1605714 ) ) ( TRUCK-AT ?auto_1605716 ?auto_1605717 ) ( ON ?auto_1605707 ?auto_1605706 ) ( ON ?auto_1605708 ?auto_1605707 ) ( ON ?auto_1605705 ?auto_1605708 ) ( ON ?auto_1605709 ?auto_1605705 ) ( ON ?auto_1605711 ?auto_1605709 ) ( ON ?auto_1605710 ?auto_1605711 ) ( not ( = ?auto_1605706 ?auto_1605707 ) ) ( not ( = ?auto_1605706 ?auto_1605708 ) ) ( not ( = ?auto_1605706 ?auto_1605705 ) ) ( not ( = ?auto_1605706 ?auto_1605709 ) ) ( not ( = ?auto_1605706 ?auto_1605711 ) ) ( not ( = ?auto_1605706 ?auto_1605710 ) ) ( not ( = ?auto_1605706 ?auto_1605712 ) ) ( not ( = ?auto_1605706 ?auto_1605713 ) ) ( not ( = ?auto_1605706 ?auto_1605714 ) ) ( not ( = ?auto_1605707 ?auto_1605708 ) ) ( not ( = ?auto_1605707 ?auto_1605705 ) ) ( not ( = ?auto_1605707 ?auto_1605709 ) ) ( not ( = ?auto_1605707 ?auto_1605711 ) ) ( not ( = ?auto_1605707 ?auto_1605710 ) ) ( not ( = ?auto_1605707 ?auto_1605712 ) ) ( not ( = ?auto_1605707 ?auto_1605713 ) ) ( not ( = ?auto_1605707 ?auto_1605714 ) ) ( not ( = ?auto_1605708 ?auto_1605705 ) ) ( not ( = ?auto_1605708 ?auto_1605709 ) ) ( not ( = ?auto_1605708 ?auto_1605711 ) ) ( not ( = ?auto_1605708 ?auto_1605710 ) ) ( not ( = ?auto_1605708 ?auto_1605712 ) ) ( not ( = ?auto_1605708 ?auto_1605713 ) ) ( not ( = ?auto_1605708 ?auto_1605714 ) ) ( not ( = ?auto_1605705 ?auto_1605709 ) ) ( not ( = ?auto_1605705 ?auto_1605711 ) ) ( not ( = ?auto_1605705 ?auto_1605710 ) ) ( not ( = ?auto_1605705 ?auto_1605712 ) ) ( not ( = ?auto_1605705 ?auto_1605713 ) ) ( not ( = ?auto_1605705 ?auto_1605714 ) ) ( not ( = ?auto_1605709 ?auto_1605711 ) ) ( not ( = ?auto_1605709 ?auto_1605710 ) ) ( not ( = ?auto_1605709 ?auto_1605712 ) ) ( not ( = ?auto_1605709 ?auto_1605713 ) ) ( not ( = ?auto_1605709 ?auto_1605714 ) ) ( not ( = ?auto_1605711 ?auto_1605710 ) ) ( not ( = ?auto_1605711 ?auto_1605712 ) ) ( not ( = ?auto_1605711 ?auto_1605713 ) ) ( not ( = ?auto_1605711 ?auto_1605714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605710 ?auto_1605712 ?auto_1605713 )
      ( MAKE-8CRATE-VERIFY ?auto_1605706 ?auto_1605707 ?auto_1605708 ?auto_1605705 ?auto_1605709 ?auto_1605711 ?auto_1605710 ?auto_1605712 ?auto_1605713 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605799 - SURFACE
      ?auto_1605800 - SURFACE
      ?auto_1605801 - SURFACE
      ?auto_1605798 - SURFACE
      ?auto_1605802 - SURFACE
      ?auto_1605804 - SURFACE
      ?auto_1605803 - SURFACE
      ?auto_1605805 - SURFACE
      ?auto_1605806 - SURFACE
    )
    :vars
    (
      ?auto_1605808 - HOIST
      ?auto_1605811 - PLACE
      ?auto_1605812 - PLACE
      ?auto_1605809 - HOIST
      ?auto_1605807 - SURFACE
      ?auto_1605810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605808 ?auto_1605811 ) ( IS-CRATE ?auto_1605806 ) ( not ( = ?auto_1605805 ?auto_1605806 ) ) ( not ( = ?auto_1605803 ?auto_1605805 ) ) ( not ( = ?auto_1605803 ?auto_1605806 ) ) ( not ( = ?auto_1605812 ?auto_1605811 ) ) ( HOIST-AT ?auto_1605809 ?auto_1605812 ) ( not ( = ?auto_1605808 ?auto_1605809 ) ) ( AVAILABLE ?auto_1605809 ) ( SURFACE-AT ?auto_1605806 ?auto_1605812 ) ( ON ?auto_1605806 ?auto_1605807 ) ( CLEAR ?auto_1605806 ) ( not ( = ?auto_1605805 ?auto_1605807 ) ) ( not ( = ?auto_1605806 ?auto_1605807 ) ) ( not ( = ?auto_1605803 ?auto_1605807 ) ) ( TRUCK-AT ?auto_1605810 ?auto_1605811 ) ( SURFACE-AT ?auto_1605803 ?auto_1605811 ) ( CLEAR ?auto_1605803 ) ( LIFTING ?auto_1605808 ?auto_1605805 ) ( IS-CRATE ?auto_1605805 ) ( ON ?auto_1605800 ?auto_1605799 ) ( ON ?auto_1605801 ?auto_1605800 ) ( ON ?auto_1605798 ?auto_1605801 ) ( ON ?auto_1605802 ?auto_1605798 ) ( ON ?auto_1605804 ?auto_1605802 ) ( ON ?auto_1605803 ?auto_1605804 ) ( not ( = ?auto_1605799 ?auto_1605800 ) ) ( not ( = ?auto_1605799 ?auto_1605801 ) ) ( not ( = ?auto_1605799 ?auto_1605798 ) ) ( not ( = ?auto_1605799 ?auto_1605802 ) ) ( not ( = ?auto_1605799 ?auto_1605804 ) ) ( not ( = ?auto_1605799 ?auto_1605803 ) ) ( not ( = ?auto_1605799 ?auto_1605805 ) ) ( not ( = ?auto_1605799 ?auto_1605806 ) ) ( not ( = ?auto_1605799 ?auto_1605807 ) ) ( not ( = ?auto_1605800 ?auto_1605801 ) ) ( not ( = ?auto_1605800 ?auto_1605798 ) ) ( not ( = ?auto_1605800 ?auto_1605802 ) ) ( not ( = ?auto_1605800 ?auto_1605804 ) ) ( not ( = ?auto_1605800 ?auto_1605803 ) ) ( not ( = ?auto_1605800 ?auto_1605805 ) ) ( not ( = ?auto_1605800 ?auto_1605806 ) ) ( not ( = ?auto_1605800 ?auto_1605807 ) ) ( not ( = ?auto_1605801 ?auto_1605798 ) ) ( not ( = ?auto_1605801 ?auto_1605802 ) ) ( not ( = ?auto_1605801 ?auto_1605804 ) ) ( not ( = ?auto_1605801 ?auto_1605803 ) ) ( not ( = ?auto_1605801 ?auto_1605805 ) ) ( not ( = ?auto_1605801 ?auto_1605806 ) ) ( not ( = ?auto_1605801 ?auto_1605807 ) ) ( not ( = ?auto_1605798 ?auto_1605802 ) ) ( not ( = ?auto_1605798 ?auto_1605804 ) ) ( not ( = ?auto_1605798 ?auto_1605803 ) ) ( not ( = ?auto_1605798 ?auto_1605805 ) ) ( not ( = ?auto_1605798 ?auto_1605806 ) ) ( not ( = ?auto_1605798 ?auto_1605807 ) ) ( not ( = ?auto_1605802 ?auto_1605804 ) ) ( not ( = ?auto_1605802 ?auto_1605803 ) ) ( not ( = ?auto_1605802 ?auto_1605805 ) ) ( not ( = ?auto_1605802 ?auto_1605806 ) ) ( not ( = ?auto_1605802 ?auto_1605807 ) ) ( not ( = ?auto_1605804 ?auto_1605803 ) ) ( not ( = ?auto_1605804 ?auto_1605805 ) ) ( not ( = ?auto_1605804 ?auto_1605806 ) ) ( not ( = ?auto_1605804 ?auto_1605807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605803 ?auto_1605805 ?auto_1605806 )
      ( MAKE-8CRATE-VERIFY ?auto_1605799 ?auto_1605800 ?auto_1605801 ?auto_1605798 ?auto_1605802 ?auto_1605804 ?auto_1605803 ?auto_1605805 ?auto_1605806 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605892 - SURFACE
      ?auto_1605893 - SURFACE
      ?auto_1605894 - SURFACE
      ?auto_1605891 - SURFACE
      ?auto_1605895 - SURFACE
      ?auto_1605897 - SURFACE
      ?auto_1605896 - SURFACE
      ?auto_1605898 - SURFACE
      ?auto_1605899 - SURFACE
    )
    :vars
    (
      ?auto_1605905 - HOIST
      ?auto_1605900 - PLACE
      ?auto_1605903 - PLACE
      ?auto_1605904 - HOIST
      ?auto_1605901 - SURFACE
      ?auto_1605902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605905 ?auto_1605900 ) ( IS-CRATE ?auto_1605899 ) ( not ( = ?auto_1605898 ?auto_1605899 ) ) ( not ( = ?auto_1605896 ?auto_1605898 ) ) ( not ( = ?auto_1605896 ?auto_1605899 ) ) ( not ( = ?auto_1605903 ?auto_1605900 ) ) ( HOIST-AT ?auto_1605904 ?auto_1605903 ) ( not ( = ?auto_1605905 ?auto_1605904 ) ) ( AVAILABLE ?auto_1605904 ) ( SURFACE-AT ?auto_1605899 ?auto_1605903 ) ( ON ?auto_1605899 ?auto_1605901 ) ( CLEAR ?auto_1605899 ) ( not ( = ?auto_1605898 ?auto_1605901 ) ) ( not ( = ?auto_1605899 ?auto_1605901 ) ) ( not ( = ?auto_1605896 ?auto_1605901 ) ) ( TRUCK-AT ?auto_1605902 ?auto_1605900 ) ( SURFACE-AT ?auto_1605896 ?auto_1605900 ) ( CLEAR ?auto_1605896 ) ( IS-CRATE ?auto_1605898 ) ( AVAILABLE ?auto_1605905 ) ( IN ?auto_1605898 ?auto_1605902 ) ( ON ?auto_1605893 ?auto_1605892 ) ( ON ?auto_1605894 ?auto_1605893 ) ( ON ?auto_1605891 ?auto_1605894 ) ( ON ?auto_1605895 ?auto_1605891 ) ( ON ?auto_1605897 ?auto_1605895 ) ( ON ?auto_1605896 ?auto_1605897 ) ( not ( = ?auto_1605892 ?auto_1605893 ) ) ( not ( = ?auto_1605892 ?auto_1605894 ) ) ( not ( = ?auto_1605892 ?auto_1605891 ) ) ( not ( = ?auto_1605892 ?auto_1605895 ) ) ( not ( = ?auto_1605892 ?auto_1605897 ) ) ( not ( = ?auto_1605892 ?auto_1605896 ) ) ( not ( = ?auto_1605892 ?auto_1605898 ) ) ( not ( = ?auto_1605892 ?auto_1605899 ) ) ( not ( = ?auto_1605892 ?auto_1605901 ) ) ( not ( = ?auto_1605893 ?auto_1605894 ) ) ( not ( = ?auto_1605893 ?auto_1605891 ) ) ( not ( = ?auto_1605893 ?auto_1605895 ) ) ( not ( = ?auto_1605893 ?auto_1605897 ) ) ( not ( = ?auto_1605893 ?auto_1605896 ) ) ( not ( = ?auto_1605893 ?auto_1605898 ) ) ( not ( = ?auto_1605893 ?auto_1605899 ) ) ( not ( = ?auto_1605893 ?auto_1605901 ) ) ( not ( = ?auto_1605894 ?auto_1605891 ) ) ( not ( = ?auto_1605894 ?auto_1605895 ) ) ( not ( = ?auto_1605894 ?auto_1605897 ) ) ( not ( = ?auto_1605894 ?auto_1605896 ) ) ( not ( = ?auto_1605894 ?auto_1605898 ) ) ( not ( = ?auto_1605894 ?auto_1605899 ) ) ( not ( = ?auto_1605894 ?auto_1605901 ) ) ( not ( = ?auto_1605891 ?auto_1605895 ) ) ( not ( = ?auto_1605891 ?auto_1605897 ) ) ( not ( = ?auto_1605891 ?auto_1605896 ) ) ( not ( = ?auto_1605891 ?auto_1605898 ) ) ( not ( = ?auto_1605891 ?auto_1605899 ) ) ( not ( = ?auto_1605891 ?auto_1605901 ) ) ( not ( = ?auto_1605895 ?auto_1605897 ) ) ( not ( = ?auto_1605895 ?auto_1605896 ) ) ( not ( = ?auto_1605895 ?auto_1605898 ) ) ( not ( = ?auto_1605895 ?auto_1605899 ) ) ( not ( = ?auto_1605895 ?auto_1605901 ) ) ( not ( = ?auto_1605897 ?auto_1605896 ) ) ( not ( = ?auto_1605897 ?auto_1605898 ) ) ( not ( = ?auto_1605897 ?auto_1605899 ) ) ( not ( = ?auto_1605897 ?auto_1605901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605896 ?auto_1605898 ?auto_1605899 )
      ( MAKE-8CRATE-VERIFY ?auto_1605892 ?auto_1605893 ?auto_1605894 ?auto_1605891 ?auto_1605895 ?auto_1605897 ?auto_1605896 ?auto_1605898 ?auto_1605899 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610008 - SURFACE
      ?auto_1610009 - SURFACE
      ?auto_1610010 - SURFACE
      ?auto_1610007 - SURFACE
      ?auto_1610011 - SURFACE
      ?auto_1610013 - SURFACE
      ?auto_1610012 - SURFACE
      ?auto_1610014 - SURFACE
      ?auto_1610015 - SURFACE
      ?auto_1610016 - SURFACE
    )
    :vars
    (
      ?auto_1610017 - HOIST
      ?auto_1610018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610017 ?auto_1610018 ) ( SURFACE-AT ?auto_1610015 ?auto_1610018 ) ( CLEAR ?auto_1610015 ) ( LIFTING ?auto_1610017 ?auto_1610016 ) ( IS-CRATE ?auto_1610016 ) ( not ( = ?auto_1610015 ?auto_1610016 ) ) ( ON ?auto_1610009 ?auto_1610008 ) ( ON ?auto_1610010 ?auto_1610009 ) ( ON ?auto_1610007 ?auto_1610010 ) ( ON ?auto_1610011 ?auto_1610007 ) ( ON ?auto_1610013 ?auto_1610011 ) ( ON ?auto_1610012 ?auto_1610013 ) ( ON ?auto_1610014 ?auto_1610012 ) ( ON ?auto_1610015 ?auto_1610014 ) ( not ( = ?auto_1610008 ?auto_1610009 ) ) ( not ( = ?auto_1610008 ?auto_1610010 ) ) ( not ( = ?auto_1610008 ?auto_1610007 ) ) ( not ( = ?auto_1610008 ?auto_1610011 ) ) ( not ( = ?auto_1610008 ?auto_1610013 ) ) ( not ( = ?auto_1610008 ?auto_1610012 ) ) ( not ( = ?auto_1610008 ?auto_1610014 ) ) ( not ( = ?auto_1610008 ?auto_1610015 ) ) ( not ( = ?auto_1610008 ?auto_1610016 ) ) ( not ( = ?auto_1610009 ?auto_1610010 ) ) ( not ( = ?auto_1610009 ?auto_1610007 ) ) ( not ( = ?auto_1610009 ?auto_1610011 ) ) ( not ( = ?auto_1610009 ?auto_1610013 ) ) ( not ( = ?auto_1610009 ?auto_1610012 ) ) ( not ( = ?auto_1610009 ?auto_1610014 ) ) ( not ( = ?auto_1610009 ?auto_1610015 ) ) ( not ( = ?auto_1610009 ?auto_1610016 ) ) ( not ( = ?auto_1610010 ?auto_1610007 ) ) ( not ( = ?auto_1610010 ?auto_1610011 ) ) ( not ( = ?auto_1610010 ?auto_1610013 ) ) ( not ( = ?auto_1610010 ?auto_1610012 ) ) ( not ( = ?auto_1610010 ?auto_1610014 ) ) ( not ( = ?auto_1610010 ?auto_1610015 ) ) ( not ( = ?auto_1610010 ?auto_1610016 ) ) ( not ( = ?auto_1610007 ?auto_1610011 ) ) ( not ( = ?auto_1610007 ?auto_1610013 ) ) ( not ( = ?auto_1610007 ?auto_1610012 ) ) ( not ( = ?auto_1610007 ?auto_1610014 ) ) ( not ( = ?auto_1610007 ?auto_1610015 ) ) ( not ( = ?auto_1610007 ?auto_1610016 ) ) ( not ( = ?auto_1610011 ?auto_1610013 ) ) ( not ( = ?auto_1610011 ?auto_1610012 ) ) ( not ( = ?auto_1610011 ?auto_1610014 ) ) ( not ( = ?auto_1610011 ?auto_1610015 ) ) ( not ( = ?auto_1610011 ?auto_1610016 ) ) ( not ( = ?auto_1610013 ?auto_1610012 ) ) ( not ( = ?auto_1610013 ?auto_1610014 ) ) ( not ( = ?auto_1610013 ?auto_1610015 ) ) ( not ( = ?auto_1610013 ?auto_1610016 ) ) ( not ( = ?auto_1610012 ?auto_1610014 ) ) ( not ( = ?auto_1610012 ?auto_1610015 ) ) ( not ( = ?auto_1610012 ?auto_1610016 ) ) ( not ( = ?auto_1610014 ?auto_1610015 ) ) ( not ( = ?auto_1610014 ?auto_1610016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1610015 ?auto_1610016 )
      ( MAKE-9CRATE-VERIFY ?auto_1610008 ?auto_1610009 ?auto_1610010 ?auto_1610007 ?auto_1610011 ?auto_1610013 ?auto_1610012 ?auto_1610014 ?auto_1610015 ?auto_1610016 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610088 - SURFACE
      ?auto_1610089 - SURFACE
      ?auto_1610090 - SURFACE
      ?auto_1610087 - SURFACE
      ?auto_1610091 - SURFACE
      ?auto_1610093 - SURFACE
      ?auto_1610092 - SURFACE
      ?auto_1610094 - SURFACE
      ?auto_1610095 - SURFACE
      ?auto_1610096 - SURFACE
    )
    :vars
    (
      ?auto_1610098 - HOIST
      ?auto_1610099 - PLACE
      ?auto_1610097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610098 ?auto_1610099 ) ( SURFACE-AT ?auto_1610095 ?auto_1610099 ) ( CLEAR ?auto_1610095 ) ( IS-CRATE ?auto_1610096 ) ( not ( = ?auto_1610095 ?auto_1610096 ) ) ( TRUCK-AT ?auto_1610097 ?auto_1610099 ) ( AVAILABLE ?auto_1610098 ) ( IN ?auto_1610096 ?auto_1610097 ) ( ON ?auto_1610095 ?auto_1610094 ) ( not ( = ?auto_1610094 ?auto_1610095 ) ) ( not ( = ?auto_1610094 ?auto_1610096 ) ) ( ON ?auto_1610089 ?auto_1610088 ) ( ON ?auto_1610090 ?auto_1610089 ) ( ON ?auto_1610087 ?auto_1610090 ) ( ON ?auto_1610091 ?auto_1610087 ) ( ON ?auto_1610093 ?auto_1610091 ) ( ON ?auto_1610092 ?auto_1610093 ) ( ON ?auto_1610094 ?auto_1610092 ) ( not ( = ?auto_1610088 ?auto_1610089 ) ) ( not ( = ?auto_1610088 ?auto_1610090 ) ) ( not ( = ?auto_1610088 ?auto_1610087 ) ) ( not ( = ?auto_1610088 ?auto_1610091 ) ) ( not ( = ?auto_1610088 ?auto_1610093 ) ) ( not ( = ?auto_1610088 ?auto_1610092 ) ) ( not ( = ?auto_1610088 ?auto_1610094 ) ) ( not ( = ?auto_1610088 ?auto_1610095 ) ) ( not ( = ?auto_1610088 ?auto_1610096 ) ) ( not ( = ?auto_1610089 ?auto_1610090 ) ) ( not ( = ?auto_1610089 ?auto_1610087 ) ) ( not ( = ?auto_1610089 ?auto_1610091 ) ) ( not ( = ?auto_1610089 ?auto_1610093 ) ) ( not ( = ?auto_1610089 ?auto_1610092 ) ) ( not ( = ?auto_1610089 ?auto_1610094 ) ) ( not ( = ?auto_1610089 ?auto_1610095 ) ) ( not ( = ?auto_1610089 ?auto_1610096 ) ) ( not ( = ?auto_1610090 ?auto_1610087 ) ) ( not ( = ?auto_1610090 ?auto_1610091 ) ) ( not ( = ?auto_1610090 ?auto_1610093 ) ) ( not ( = ?auto_1610090 ?auto_1610092 ) ) ( not ( = ?auto_1610090 ?auto_1610094 ) ) ( not ( = ?auto_1610090 ?auto_1610095 ) ) ( not ( = ?auto_1610090 ?auto_1610096 ) ) ( not ( = ?auto_1610087 ?auto_1610091 ) ) ( not ( = ?auto_1610087 ?auto_1610093 ) ) ( not ( = ?auto_1610087 ?auto_1610092 ) ) ( not ( = ?auto_1610087 ?auto_1610094 ) ) ( not ( = ?auto_1610087 ?auto_1610095 ) ) ( not ( = ?auto_1610087 ?auto_1610096 ) ) ( not ( = ?auto_1610091 ?auto_1610093 ) ) ( not ( = ?auto_1610091 ?auto_1610092 ) ) ( not ( = ?auto_1610091 ?auto_1610094 ) ) ( not ( = ?auto_1610091 ?auto_1610095 ) ) ( not ( = ?auto_1610091 ?auto_1610096 ) ) ( not ( = ?auto_1610093 ?auto_1610092 ) ) ( not ( = ?auto_1610093 ?auto_1610094 ) ) ( not ( = ?auto_1610093 ?auto_1610095 ) ) ( not ( = ?auto_1610093 ?auto_1610096 ) ) ( not ( = ?auto_1610092 ?auto_1610094 ) ) ( not ( = ?auto_1610092 ?auto_1610095 ) ) ( not ( = ?auto_1610092 ?auto_1610096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610094 ?auto_1610095 ?auto_1610096 )
      ( MAKE-9CRATE-VERIFY ?auto_1610088 ?auto_1610089 ?auto_1610090 ?auto_1610087 ?auto_1610091 ?auto_1610093 ?auto_1610092 ?auto_1610094 ?auto_1610095 ?auto_1610096 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610178 - SURFACE
      ?auto_1610179 - SURFACE
      ?auto_1610180 - SURFACE
      ?auto_1610177 - SURFACE
      ?auto_1610181 - SURFACE
      ?auto_1610183 - SURFACE
      ?auto_1610182 - SURFACE
      ?auto_1610184 - SURFACE
      ?auto_1610185 - SURFACE
      ?auto_1610186 - SURFACE
    )
    :vars
    (
      ?auto_1610189 - HOIST
      ?auto_1610190 - PLACE
      ?auto_1610187 - TRUCK
      ?auto_1610188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610189 ?auto_1610190 ) ( SURFACE-AT ?auto_1610185 ?auto_1610190 ) ( CLEAR ?auto_1610185 ) ( IS-CRATE ?auto_1610186 ) ( not ( = ?auto_1610185 ?auto_1610186 ) ) ( AVAILABLE ?auto_1610189 ) ( IN ?auto_1610186 ?auto_1610187 ) ( ON ?auto_1610185 ?auto_1610184 ) ( not ( = ?auto_1610184 ?auto_1610185 ) ) ( not ( = ?auto_1610184 ?auto_1610186 ) ) ( TRUCK-AT ?auto_1610187 ?auto_1610188 ) ( not ( = ?auto_1610188 ?auto_1610190 ) ) ( ON ?auto_1610179 ?auto_1610178 ) ( ON ?auto_1610180 ?auto_1610179 ) ( ON ?auto_1610177 ?auto_1610180 ) ( ON ?auto_1610181 ?auto_1610177 ) ( ON ?auto_1610183 ?auto_1610181 ) ( ON ?auto_1610182 ?auto_1610183 ) ( ON ?auto_1610184 ?auto_1610182 ) ( not ( = ?auto_1610178 ?auto_1610179 ) ) ( not ( = ?auto_1610178 ?auto_1610180 ) ) ( not ( = ?auto_1610178 ?auto_1610177 ) ) ( not ( = ?auto_1610178 ?auto_1610181 ) ) ( not ( = ?auto_1610178 ?auto_1610183 ) ) ( not ( = ?auto_1610178 ?auto_1610182 ) ) ( not ( = ?auto_1610178 ?auto_1610184 ) ) ( not ( = ?auto_1610178 ?auto_1610185 ) ) ( not ( = ?auto_1610178 ?auto_1610186 ) ) ( not ( = ?auto_1610179 ?auto_1610180 ) ) ( not ( = ?auto_1610179 ?auto_1610177 ) ) ( not ( = ?auto_1610179 ?auto_1610181 ) ) ( not ( = ?auto_1610179 ?auto_1610183 ) ) ( not ( = ?auto_1610179 ?auto_1610182 ) ) ( not ( = ?auto_1610179 ?auto_1610184 ) ) ( not ( = ?auto_1610179 ?auto_1610185 ) ) ( not ( = ?auto_1610179 ?auto_1610186 ) ) ( not ( = ?auto_1610180 ?auto_1610177 ) ) ( not ( = ?auto_1610180 ?auto_1610181 ) ) ( not ( = ?auto_1610180 ?auto_1610183 ) ) ( not ( = ?auto_1610180 ?auto_1610182 ) ) ( not ( = ?auto_1610180 ?auto_1610184 ) ) ( not ( = ?auto_1610180 ?auto_1610185 ) ) ( not ( = ?auto_1610180 ?auto_1610186 ) ) ( not ( = ?auto_1610177 ?auto_1610181 ) ) ( not ( = ?auto_1610177 ?auto_1610183 ) ) ( not ( = ?auto_1610177 ?auto_1610182 ) ) ( not ( = ?auto_1610177 ?auto_1610184 ) ) ( not ( = ?auto_1610177 ?auto_1610185 ) ) ( not ( = ?auto_1610177 ?auto_1610186 ) ) ( not ( = ?auto_1610181 ?auto_1610183 ) ) ( not ( = ?auto_1610181 ?auto_1610182 ) ) ( not ( = ?auto_1610181 ?auto_1610184 ) ) ( not ( = ?auto_1610181 ?auto_1610185 ) ) ( not ( = ?auto_1610181 ?auto_1610186 ) ) ( not ( = ?auto_1610183 ?auto_1610182 ) ) ( not ( = ?auto_1610183 ?auto_1610184 ) ) ( not ( = ?auto_1610183 ?auto_1610185 ) ) ( not ( = ?auto_1610183 ?auto_1610186 ) ) ( not ( = ?auto_1610182 ?auto_1610184 ) ) ( not ( = ?auto_1610182 ?auto_1610185 ) ) ( not ( = ?auto_1610182 ?auto_1610186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610184 ?auto_1610185 ?auto_1610186 )
      ( MAKE-9CRATE-VERIFY ?auto_1610178 ?auto_1610179 ?auto_1610180 ?auto_1610177 ?auto_1610181 ?auto_1610183 ?auto_1610182 ?auto_1610184 ?auto_1610185 ?auto_1610186 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610277 - SURFACE
      ?auto_1610278 - SURFACE
      ?auto_1610279 - SURFACE
      ?auto_1610276 - SURFACE
      ?auto_1610280 - SURFACE
      ?auto_1610282 - SURFACE
      ?auto_1610281 - SURFACE
      ?auto_1610283 - SURFACE
      ?auto_1610284 - SURFACE
      ?auto_1610285 - SURFACE
    )
    :vars
    (
      ?auto_1610288 - HOIST
      ?auto_1610287 - PLACE
      ?auto_1610286 - TRUCK
      ?auto_1610289 - PLACE
      ?auto_1610290 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610288 ?auto_1610287 ) ( SURFACE-AT ?auto_1610284 ?auto_1610287 ) ( CLEAR ?auto_1610284 ) ( IS-CRATE ?auto_1610285 ) ( not ( = ?auto_1610284 ?auto_1610285 ) ) ( AVAILABLE ?auto_1610288 ) ( ON ?auto_1610284 ?auto_1610283 ) ( not ( = ?auto_1610283 ?auto_1610284 ) ) ( not ( = ?auto_1610283 ?auto_1610285 ) ) ( TRUCK-AT ?auto_1610286 ?auto_1610289 ) ( not ( = ?auto_1610289 ?auto_1610287 ) ) ( HOIST-AT ?auto_1610290 ?auto_1610289 ) ( LIFTING ?auto_1610290 ?auto_1610285 ) ( not ( = ?auto_1610288 ?auto_1610290 ) ) ( ON ?auto_1610278 ?auto_1610277 ) ( ON ?auto_1610279 ?auto_1610278 ) ( ON ?auto_1610276 ?auto_1610279 ) ( ON ?auto_1610280 ?auto_1610276 ) ( ON ?auto_1610282 ?auto_1610280 ) ( ON ?auto_1610281 ?auto_1610282 ) ( ON ?auto_1610283 ?auto_1610281 ) ( not ( = ?auto_1610277 ?auto_1610278 ) ) ( not ( = ?auto_1610277 ?auto_1610279 ) ) ( not ( = ?auto_1610277 ?auto_1610276 ) ) ( not ( = ?auto_1610277 ?auto_1610280 ) ) ( not ( = ?auto_1610277 ?auto_1610282 ) ) ( not ( = ?auto_1610277 ?auto_1610281 ) ) ( not ( = ?auto_1610277 ?auto_1610283 ) ) ( not ( = ?auto_1610277 ?auto_1610284 ) ) ( not ( = ?auto_1610277 ?auto_1610285 ) ) ( not ( = ?auto_1610278 ?auto_1610279 ) ) ( not ( = ?auto_1610278 ?auto_1610276 ) ) ( not ( = ?auto_1610278 ?auto_1610280 ) ) ( not ( = ?auto_1610278 ?auto_1610282 ) ) ( not ( = ?auto_1610278 ?auto_1610281 ) ) ( not ( = ?auto_1610278 ?auto_1610283 ) ) ( not ( = ?auto_1610278 ?auto_1610284 ) ) ( not ( = ?auto_1610278 ?auto_1610285 ) ) ( not ( = ?auto_1610279 ?auto_1610276 ) ) ( not ( = ?auto_1610279 ?auto_1610280 ) ) ( not ( = ?auto_1610279 ?auto_1610282 ) ) ( not ( = ?auto_1610279 ?auto_1610281 ) ) ( not ( = ?auto_1610279 ?auto_1610283 ) ) ( not ( = ?auto_1610279 ?auto_1610284 ) ) ( not ( = ?auto_1610279 ?auto_1610285 ) ) ( not ( = ?auto_1610276 ?auto_1610280 ) ) ( not ( = ?auto_1610276 ?auto_1610282 ) ) ( not ( = ?auto_1610276 ?auto_1610281 ) ) ( not ( = ?auto_1610276 ?auto_1610283 ) ) ( not ( = ?auto_1610276 ?auto_1610284 ) ) ( not ( = ?auto_1610276 ?auto_1610285 ) ) ( not ( = ?auto_1610280 ?auto_1610282 ) ) ( not ( = ?auto_1610280 ?auto_1610281 ) ) ( not ( = ?auto_1610280 ?auto_1610283 ) ) ( not ( = ?auto_1610280 ?auto_1610284 ) ) ( not ( = ?auto_1610280 ?auto_1610285 ) ) ( not ( = ?auto_1610282 ?auto_1610281 ) ) ( not ( = ?auto_1610282 ?auto_1610283 ) ) ( not ( = ?auto_1610282 ?auto_1610284 ) ) ( not ( = ?auto_1610282 ?auto_1610285 ) ) ( not ( = ?auto_1610281 ?auto_1610283 ) ) ( not ( = ?auto_1610281 ?auto_1610284 ) ) ( not ( = ?auto_1610281 ?auto_1610285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610283 ?auto_1610284 ?auto_1610285 )
      ( MAKE-9CRATE-VERIFY ?auto_1610277 ?auto_1610278 ?auto_1610279 ?auto_1610276 ?auto_1610280 ?auto_1610282 ?auto_1610281 ?auto_1610283 ?auto_1610284 ?auto_1610285 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610385 - SURFACE
      ?auto_1610386 - SURFACE
      ?auto_1610387 - SURFACE
      ?auto_1610384 - SURFACE
      ?auto_1610388 - SURFACE
      ?auto_1610390 - SURFACE
      ?auto_1610389 - SURFACE
      ?auto_1610391 - SURFACE
      ?auto_1610392 - SURFACE
      ?auto_1610393 - SURFACE
    )
    :vars
    (
      ?auto_1610394 - HOIST
      ?auto_1610397 - PLACE
      ?auto_1610399 - TRUCK
      ?auto_1610398 - PLACE
      ?auto_1610396 - HOIST
      ?auto_1610395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610394 ?auto_1610397 ) ( SURFACE-AT ?auto_1610392 ?auto_1610397 ) ( CLEAR ?auto_1610392 ) ( IS-CRATE ?auto_1610393 ) ( not ( = ?auto_1610392 ?auto_1610393 ) ) ( AVAILABLE ?auto_1610394 ) ( ON ?auto_1610392 ?auto_1610391 ) ( not ( = ?auto_1610391 ?auto_1610392 ) ) ( not ( = ?auto_1610391 ?auto_1610393 ) ) ( TRUCK-AT ?auto_1610399 ?auto_1610398 ) ( not ( = ?auto_1610398 ?auto_1610397 ) ) ( HOIST-AT ?auto_1610396 ?auto_1610398 ) ( not ( = ?auto_1610394 ?auto_1610396 ) ) ( AVAILABLE ?auto_1610396 ) ( SURFACE-AT ?auto_1610393 ?auto_1610398 ) ( ON ?auto_1610393 ?auto_1610395 ) ( CLEAR ?auto_1610393 ) ( not ( = ?auto_1610392 ?auto_1610395 ) ) ( not ( = ?auto_1610393 ?auto_1610395 ) ) ( not ( = ?auto_1610391 ?auto_1610395 ) ) ( ON ?auto_1610386 ?auto_1610385 ) ( ON ?auto_1610387 ?auto_1610386 ) ( ON ?auto_1610384 ?auto_1610387 ) ( ON ?auto_1610388 ?auto_1610384 ) ( ON ?auto_1610390 ?auto_1610388 ) ( ON ?auto_1610389 ?auto_1610390 ) ( ON ?auto_1610391 ?auto_1610389 ) ( not ( = ?auto_1610385 ?auto_1610386 ) ) ( not ( = ?auto_1610385 ?auto_1610387 ) ) ( not ( = ?auto_1610385 ?auto_1610384 ) ) ( not ( = ?auto_1610385 ?auto_1610388 ) ) ( not ( = ?auto_1610385 ?auto_1610390 ) ) ( not ( = ?auto_1610385 ?auto_1610389 ) ) ( not ( = ?auto_1610385 ?auto_1610391 ) ) ( not ( = ?auto_1610385 ?auto_1610392 ) ) ( not ( = ?auto_1610385 ?auto_1610393 ) ) ( not ( = ?auto_1610385 ?auto_1610395 ) ) ( not ( = ?auto_1610386 ?auto_1610387 ) ) ( not ( = ?auto_1610386 ?auto_1610384 ) ) ( not ( = ?auto_1610386 ?auto_1610388 ) ) ( not ( = ?auto_1610386 ?auto_1610390 ) ) ( not ( = ?auto_1610386 ?auto_1610389 ) ) ( not ( = ?auto_1610386 ?auto_1610391 ) ) ( not ( = ?auto_1610386 ?auto_1610392 ) ) ( not ( = ?auto_1610386 ?auto_1610393 ) ) ( not ( = ?auto_1610386 ?auto_1610395 ) ) ( not ( = ?auto_1610387 ?auto_1610384 ) ) ( not ( = ?auto_1610387 ?auto_1610388 ) ) ( not ( = ?auto_1610387 ?auto_1610390 ) ) ( not ( = ?auto_1610387 ?auto_1610389 ) ) ( not ( = ?auto_1610387 ?auto_1610391 ) ) ( not ( = ?auto_1610387 ?auto_1610392 ) ) ( not ( = ?auto_1610387 ?auto_1610393 ) ) ( not ( = ?auto_1610387 ?auto_1610395 ) ) ( not ( = ?auto_1610384 ?auto_1610388 ) ) ( not ( = ?auto_1610384 ?auto_1610390 ) ) ( not ( = ?auto_1610384 ?auto_1610389 ) ) ( not ( = ?auto_1610384 ?auto_1610391 ) ) ( not ( = ?auto_1610384 ?auto_1610392 ) ) ( not ( = ?auto_1610384 ?auto_1610393 ) ) ( not ( = ?auto_1610384 ?auto_1610395 ) ) ( not ( = ?auto_1610388 ?auto_1610390 ) ) ( not ( = ?auto_1610388 ?auto_1610389 ) ) ( not ( = ?auto_1610388 ?auto_1610391 ) ) ( not ( = ?auto_1610388 ?auto_1610392 ) ) ( not ( = ?auto_1610388 ?auto_1610393 ) ) ( not ( = ?auto_1610388 ?auto_1610395 ) ) ( not ( = ?auto_1610390 ?auto_1610389 ) ) ( not ( = ?auto_1610390 ?auto_1610391 ) ) ( not ( = ?auto_1610390 ?auto_1610392 ) ) ( not ( = ?auto_1610390 ?auto_1610393 ) ) ( not ( = ?auto_1610390 ?auto_1610395 ) ) ( not ( = ?auto_1610389 ?auto_1610391 ) ) ( not ( = ?auto_1610389 ?auto_1610392 ) ) ( not ( = ?auto_1610389 ?auto_1610393 ) ) ( not ( = ?auto_1610389 ?auto_1610395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610391 ?auto_1610392 ?auto_1610393 )
      ( MAKE-9CRATE-VERIFY ?auto_1610385 ?auto_1610386 ?auto_1610387 ?auto_1610384 ?auto_1610388 ?auto_1610390 ?auto_1610389 ?auto_1610391 ?auto_1610392 ?auto_1610393 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610494 - SURFACE
      ?auto_1610495 - SURFACE
      ?auto_1610496 - SURFACE
      ?auto_1610493 - SURFACE
      ?auto_1610497 - SURFACE
      ?auto_1610499 - SURFACE
      ?auto_1610498 - SURFACE
      ?auto_1610500 - SURFACE
      ?auto_1610501 - SURFACE
      ?auto_1610502 - SURFACE
    )
    :vars
    (
      ?auto_1610503 - HOIST
      ?auto_1610507 - PLACE
      ?auto_1610505 - PLACE
      ?auto_1610508 - HOIST
      ?auto_1610504 - SURFACE
      ?auto_1610506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610503 ?auto_1610507 ) ( SURFACE-AT ?auto_1610501 ?auto_1610507 ) ( CLEAR ?auto_1610501 ) ( IS-CRATE ?auto_1610502 ) ( not ( = ?auto_1610501 ?auto_1610502 ) ) ( AVAILABLE ?auto_1610503 ) ( ON ?auto_1610501 ?auto_1610500 ) ( not ( = ?auto_1610500 ?auto_1610501 ) ) ( not ( = ?auto_1610500 ?auto_1610502 ) ) ( not ( = ?auto_1610505 ?auto_1610507 ) ) ( HOIST-AT ?auto_1610508 ?auto_1610505 ) ( not ( = ?auto_1610503 ?auto_1610508 ) ) ( AVAILABLE ?auto_1610508 ) ( SURFACE-AT ?auto_1610502 ?auto_1610505 ) ( ON ?auto_1610502 ?auto_1610504 ) ( CLEAR ?auto_1610502 ) ( not ( = ?auto_1610501 ?auto_1610504 ) ) ( not ( = ?auto_1610502 ?auto_1610504 ) ) ( not ( = ?auto_1610500 ?auto_1610504 ) ) ( TRUCK-AT ?auto_1610506 ?auto_1610507 ) ( ON ?auto_1610495 ?auto_1610494 ) ( ON ?auto_1610496 ?auto_1610495 ) ( ON ?auto_1610493 ?auto_1610496 ) ( ON ?auto_1610497 ?auto_1610493 ) ( ON ?auto_1610499 ?auto_1610497 ) ( ON ?auto_1610498 ?auto_1610499 ) ( ON ?auto_1610500 ?auto_1610498 ) ( not ( = ?auto_1610494 ?auto_1610495 ) ) ( not ( = ?auto_1610494 ?auto_1610496 ) ) ( not ( = ?auto_1610494 ?auto_1610493 ) ) ( not ( = ?auto_1610494 ?auto_1610497 ) ) ( not ( = ?auto_1610494 ?auto_1610499 ) ) ( not ( = ?auto_1610494 ?auto_1610498 ) ) ( not ( = ?auto_1610494 ?auto_1610500 ) ) ( not ( = ?auto_1610494 ?auto_1610501 ) ) ( not ( = ?auto_1610494 ?auto_1610502 ) ) ( not ( = ?auto_1610494 ?auto_1610504 ) ) ( not ( = ?auto_1610495 ?auto_1610496 ) ) ( not ( = ?auto_1610495 ?auto_1610493 ) ) ( not ( = ?auto_1610495 ?auto_1610497 ) ) ( not ( = ?auto_1610495 ?auto_1610499 ) ) ( not ( = ?auto_1610495 ?auto_1610498 ) ) ( not ( = ?auto_1610495 ?auto_1610500 ) ) ( not ( = ?auto_1610495 ?auto_1610501 ) ) ( not ( = ?auto_1610495 ?auto_1610502 ) ) ( not ( = ?auto_1610495 ?auto_1610504 ) ) ( not ( = ?auto_1610496 ?auto_1610493 ) ) ( not ( = ?auto_1610496 ?auto_1610497 ) ) ( not ( = ?auto_1610496 ?auto_1610499 ) ) ( not ( = ?auto_1610496 ?auto_1610498 ) ) ( not ( = ?auto_1610496 ?auto_1610500 ) ) ( not ( = ?auto_1610496 ?auto_1610501 ) ) ( not ( = ?auto_1610496 ?auto_1610502 ) ) ( not ( = ?auto_1610496 ?auto_1610504 ) ) ( not ( = ?auto_1610493 ?auto_1610497 ) ) ( not ( = ?auto_1610493 ?auto_1610499 ) ) ( not ( = ?auto_1610493 ?auto_1610498 ) ) ( not ( = ?auto_1610493 ?auto_1610500 ) ) ( not ( = ?auto_1610493 ?auto_1610501 ) ) ( not ( = ?auto_1610493 ?auto_1610502 ) ) ( not ( = ?auto_1610493 ?auto_1610504 ) ) ( not ( = ?auto_1610497 ?auto_1610499 ) ) ( not ( = ?auto_1610497 ?auto_1610498 ) ) ( not ( = ?auto_1610497 ?auto_1610500 ) ) ( not ( = ?auto_1610497 ?auto_1610501 ) ) ( not ( = ?auto_1610497 ?auto_1610502 ) ) ( not ( = ?auto_1610497 ?auto_1610504 ) ) ( not ( = ?auto_1610499 ?auto_1610498 ) ) ( not ( = ?auto_1610499 ?auto_1610500 ) ) ( not ( = ?auto_1610499 ?auto_1610501 ) ) ( not ( = ?auto_1610499 ?auto_1610502 ) ) ( not ( = ?auto_1610499 ?auto_1610504 ) ) ( not ( = ?auto_1610498 ?auto_1610500 ) ) ( not ( = ?auto_1610498 ?auto_1610501 ) ) ( not ( = ?auto_1610498 ?auto_1610502 ) ) ( not ( = ?auto_1610498 ?auto_1610504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610500 ?auto_1610501 ?auto_1610502 )
      ( MAKE-9CRATE-VERIFY ?auto_1610494 ?auto_1610495 ?auto_1610496 ?auto_1610493 ?auto_1610497 ?auto_1610499 ?auto_1610498 ?auto_1610500 ?auto_1610501 ?auto_1610502 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610603 - SURFACE
      ?auto_1610604 - SURFACE
      ?auto_1610605 - SURFACE
      ?auto_1610602 - SURFACE
      ?auto_1610606 - SURFACE
      ?auto_1610608 - SURFACE
      ?auto_1610607 - SURFACE
      ?auto_1610609 - SURFACE
      ?auto_1610610 - SURFACE
      ?auto_1610611 - SURFACE
    )
    :vars
    (
      ?auto_1610612 - HOIST
      ?auto_1610615 - PLACE
      ?auto_1610616 - PLACE
      ?auto_1610617 - HOIST
      ?auto_1610613 - SURFACE
      ?auto_1610614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610612 ?auto_1610615 ) ( IS-CRATE ?auto_1610611 ) ( not ( = ?auto_1610610 ?auto_1610611 ) ) ( not ( = ?auto_1610609 ?auto_1610610 ) ) ( not ( = ?auto_1610609 ?auto_1610611 ) ) ( not ( = ?auto_1610616 ?auto_1610615 ) ) ( HOIST-AT ?auto_1610617 ?auto_1610616 ) ( not ( = ?auto_1610612 ?auto_1610617 ) ) ( AVAILABLE ?auto_1610617 ) ( SURFACE-AT ?auto_1610611 ?auto_1610616 ) ( ON ?auto_1610611 ?auto_1610613 ) ( CLEAR ?auto_1610611 ) ( not ( = ?auto_1610610 ?auto_1610613 ) ) ( not ( = ?auto_1610611 ?auto_1610613 ) ) ( not ( = ?auto_1610609 ?auto_1610613 ) ) ( TRUCK-AT ?auto_1610614 ?auto_1610615 ) ( SURFACE-AT ?auto_1610609 ?auto_1610615 ) ( CLEAR ?auto_1610609 ) ( LIFTING ?auto_1610612 ?auto_1610610 ) ( IS-CRATE ?auto_1610610 ) ( ON ?auto_1610604 ?auto_1610603 ) ( ON ?auto_1610605 ?auto_1610604 ) ( ON ?auto_1610602 ?auto_1610605 ) ( ON ?auto_1610606 ?auto_1610602 ) ( ON ?auto_1610608 ?auto_1610606 ) ( ON ?auto_1610607 ?auto_1610608 ) ( ON ?auto_1610609 ?auto_1610607 ) ( not ( = ?auto_1610603 ?auto_1610604 ) ) ( not ( = ?auto_1610603 ?auto_1610605 ) ) ( not ( = ?auto_1610603 ?auto_1610602 ) ) ( not ( = ?auto_1610603 ?auto_1610606 ) ) ( not ( = ?auto_1610603 ?auto_1610608 ) ) ( not ( = ?auto_1610603 ?auto_1610607 ) ) ( not ( = ?auto_1610603 ?auto_1610609 ) ) ( not ( = ?auto_1610603 ?auto_1610610 ) ) ( not ( = ?auto_1610603 ?auto_1610611 ) ) ( not ( = ?auto_1610603 ?auto_1610613 ) ) ( not ( = ?auto_1610604 ?auto_1610605 ) ) ( not ( = ?auto_1610604 ?auto_1610602 ) ) ( not ( = ?auto_1610604 ?auto_1610606 ) ) ( not ( = ?auto_1610604 ?auto_1610608 ) ) ( not ( = ?auto_1610604 ?auto_1610607 ) ) ( not ( = ?auto_1610604 ?auto_1610609 ) ) ( not ( = ?auto_1610604 ?auto_1610610 ) ) ( not ( = ?auto_1610604 ?auto_1610611 ) ) ( not ( = ?auto_1610604 ?auto_1610613 ) ) ( not ( = ?auto_1610605 ?auto_1610602 ) ) ( not ( = ?auto_1610605 ?auto_1610606 ) ) ( not ( = ?auto_1610605 ?auto_1610608 ) ) ( not ( = ?auto_1610605 ?auto_1610607 ) ) ( not ( = ?auto_1610605 ?auto_1610609 ) ) ( not ( = ?auto_1610605 ?auto_1610610 ) ) ( not ( = ?auto_1610605 ?auto_1610611 ) ) ( not ( = ?auto_1610605 ?auto_1610613 ) ) ( not ( = ?auto_1610602 ?auto_1610606 ) ) ( not ( = ?auto_1610602 ?auto_1610608 ) ) ( not ( = ?auto_1610602 ?auto_1610607 ) ) ( not ( = ?auto_1610602 ?auto_1610609 ) ) ( not ( = ?auto_1610602 ?auto_1610610 ) ) ( not ( = ?auto_1610602 ?auto_1610611 ) ) ( not ( = ?auto_1610602 ?auto_1610613 ) ) ( not ( = ?auto_1610606 ?auto_1610608 ) ) ( not ( = ?auto_1610606 ?auto_1610607 ) ) ( not ( = ?auto_1610606 ?auto_1610609 ) ) ( not ( = ?auto_1610606 ?auto_1610610 ) ) ( not ( = ?auto_1610606 ?auto_1610611 ) ) ( not ( = ?auto_1610606 ?auto_1610613 ) ) ( not ( = ?auto_1610608 ?auto_1610607 ) ) ( not ( = ?auto_1610608 ?auto_1610609 ) ) ( not ( = ?auto_1610608 ?auto_1610610 ) ) ( not ( = ?auto_1610608 ?auto_1610611 ) ) ( not ( = ?auto_1610608 ?auto_1610613 ) ) ( not ( = ?auto_1610607 ?auto_1610609 ) ) ( not ( = ?auto_1610607 ?auto_1610610 ) ) ( not ( = ?auto_1610607 ?auto_1610611 ) ) ( not ( = ?auto_1610607 ?auto_1610613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610609 ?auto_1610610 ?auto_1610611 )
      ( MAKE-9CRATE-VERIFY ?auto_1610603 ?auto_1610604 ?auto_1610605 ?auto_1610602 ?auto_1610606 ?auto_1610608 ?auto_1610607 ?auto_1610609 ?auto_1610610 ?auto_1610611 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610712 - SURFACE
      ?auto_1610713 - SURFACE
      ?auto_1610714 - SURFACE
      ?auto_1610711 - SURFACE
      ?auto_1610715 - SURFACE
      ?auto_1610717 - SURFACE
      ?auto_1610716 - SURFACE
      ?auto_1610718 - SURFACE
      ?auto_1610719 - SURFACE
      ?auto_1610720 - SURFACE
    )
    :vars
    (
      ?auto_1610723 - HOIST
      ?auto_1610725 - PLACE
      ?auto_1610722 - PLACE
      ?auto_1610726 - HOIST
      ?auto_1610724 - SURFACE
      ?auto_1610721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610723 ?auto_1610725 ) ( IS-CRATE ?auto_1610720 ) ( not ( = ?auto_1610719 ?auto_1610720 ) ) ( not ( = ?auto_1610718 ?auto_1610719 ) ) ( not ( = ?auto_1610718 ?auto_1610720 ) ) ( not ( = ?auto_1610722 ?auto_1610725 ) ) ( HOIST-AT ?auto_1610726 ?auto_1610722 ) ( not ( = ?auto_1610723 ?auto_1610726 ) ) ( AVAILABLE ?auto_1610726 ) ( SURFACE-AT ?auto_1610720 ?auto_1610722 ) ( ON ?auto_1610720 ?auto_1610724 ) ( CLEAR ?auto_1610720 ) ( not ( = ?auto_1610719 ?auto_1610724 ) ) ( not ( = ?auto_1610720 ?auto_1610724 ) ) ( not ( = ?auto_1610718 ?auto_1610724 ) ) ( TRUCK-AT ?auto_1610721 ?auto_1610725 ) ( SURFACE-AT ?auto_1610718 ?auto_1610725 ) ( CLEAR ?auto_1610718 ) ( IS-CRATE ?auto_1610719 ) ( AVAILABLE ?auto_1610723 ) ( IN ?auto_1610719 ?auto_1610721 ) ( ON ?auto_1610713 ?auto_1610712 ) ( ON ?auto_1610714 ?auto_1610713 ) ( ON ?auto_1610711 ?auto_1610714 ) ( ON ?auto_1610715 ?auto_1610711 ) ( ON ?auto_1610717 ?auto_1610715 ) ( ON ?auto_1610716 ?auto_1610717 ) ( ON ?auto_1610718 ?auto_1610716 ) ( not ( = ?auto_1610712 ?auto_1610713 ) ) ( not ( = ?auto_1610712 ?auto_1610714 ) ) ( not ( = ?auto_1610712 ?auto_1610711 ) ) ( not ( = ?auto_1610712 ?auto_1610715 ) ) ( not ( = ?auto_1610712 ?auto_1610717 ) ) ( not ( = ?auto_1610712 ?auto_1610716 ) ) ( not ( = ?auto_1610712 ?auto_1610718 ) ) ( not ( = ?auto_1610712 ?auto_1610719 ) ) ( not ( = ?auto_1610712 ?auto_1610720 ) ) ( not ( = ?auto_1610712 ?auto_1610724 ) ) ( not ( = ?auto_1610713 ?auto_1610714 ) ) ( not ( = ?auto_1610713 ?auto_1610711 ) ) ( not ( = ?auto_1610713 ?auto_1610715 ) ) ( not ( = ?auto_1610713 ?auto_1610717 ) ) ( not ( = ?auto_1610713 ?auto_1610716 ) ) ( not ( = ?auto_1610713 ?auto_1610718 ) ) ( not ( = ?auto_1610713 ?auto_1610719 ) ) ( not ( = ?auto_1610713 ?auto_1610720 ) ) ( not ( = ?auto_1610713 ?auto_1610724 ) ) ( not ( = ?auto_1610714 ?auto_1610711 ) ) ( not ( = ?auto_1610714 ?auto_1610715 ) ) ( not ( = ?auto_1610714 ?auto_1610717 ) ) ( not ( = ?auto_1610714 ?auto_1610716 ) ) ( not ( = ?auto_1610714 ?auto_1610718 ) ) ( not ( = ?auto_1610714 ?auto_1610719 ) ) ( not ( = ?auto_1610714 ?auto_1610720 ) ) ( not ( = ?auto_1610714 ?auto_1610724 ) ) ( not ( = ?auto_1610711 ?auto_1610715 ) ) ( not ( = ?auto_1610711 ?auto_1610717 ) ) ( not ( = ?auto_1610711 ?auto_1610716 ) ) ( not ( = ?auto_1610711 ?auto_1610718 ) ) ( not ( = ?auto_1610711 ?auto_1610719 ) ) ( not ( = ?auto_1610711 ?auto_1610720 ) ) ( not ( = ?auto_1610711 ?auto_1610724 ) ) ( not ( = ?auto_1610715 ?auto_1610717 ) ) ( not ( = ?auto_1610715 ?auto_1610716 ) ) ( not ( = ?auto_1610715 ?auto_1610718 ) ) ( not ( = ?auto_1610715 ?auto_1610719 ) ) ( not ( = ?auto_1610715 ?auto_1610720 ) ) ( not ( = ?auto_1610715 ?auto_1610724 ) ) ( not ( = ?auto_1610717 ?auto_1610716 ) ) ( not ( = ?auto_1610717 ?auto_1610718 ) ) ( not ( = ?auto_1610717 ?auto_1610719 ) ) ( not ( = ?auto_1610717 ?auto_1610720 ) ) ( not ( = ?auto_1610717 ?auto_1610724 ) ) ( not ( = ?auto_1610716 ?auto_1610718 ) ) ( not ( = ?auto_1610716 ?auto_1610719 ) ) ( not ( = ?auto_1610716 ?auto_1610720 ) ) ( not ( = ?auto_1610716 ?auto_1610724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610718 ?auto_1610719 ?auto_1610720 )
      ( MAKE-9CRATE-VERIFY ?auto_1610712 ?auto_1610713 ?auto_1610714 ?auto_1610711 ?auto_1610715 ?auto_1610717 ?auto_1610716 ?auto_1610718 ?auto_1610719 ?auto_1610720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1615777 - SURFACE
      ?auto_1615778 - SURFACE
    )
    :vars
    (
      ?auto_1615781 - HOIST
      ?auto_1615784 - PLACE
      ?auto_1615782 - SURFACE
      ?auto_1615779 - TRUCK
      ?auto_1615780 - PLACE
      ?auto_1615785 - HOIST
      ?auto_1615783 - SURFACE
      ?auto_1615786 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615781 ?auto_1615784 ) ( SURFACE-AT ?auto_1615777 ?auto_1615784 ) ( CLEAR ?auto_1615777 ) ( IS-CRATE ?auto_1615778 ) ( not ( = ?auto_1615777 ?auto_1615778 ) ) ( AVAILABLE ?auto_1615781 ) ( ON ?auto_1615777 ?auto_1615782 ) ( not ( = ?auto_1615782 ?auto_1615777 ) ) ( not ( = ?auto_1615782 ?auto_1615778 ) ) ( TRUCK-AT ?auto_1615779 ?auto_1615780 ) ( not ( = ?auto_1615780 ?auto_1615784 ) ) ( HOIST-AT ?auto_1615785 ?auto_1615780 ) ( not ( = ?auto_1615781 ?auto_1615785 ) ) ( SURFACE-AT ?auto_1615778 ?auto_1615780 ) ( ON ?auto_1615778 ?auto_1615783 ) ( CLEAR ?auto_1615778 ) ( not ( = ?auto_1615777 ?auto_1615783 ) ) ( not ( = ?auto_1615778 ?auto_1615783 ) ) ( not ( = ?auto_1615782 ?auto_1615783 ) ) ( LIFTING ?auto_1615785 ?auto_1615786 ) ( IS-CRATE ?auto_1615786 ) ( not ( = ?auto_1615777 ?auto_1615786 ) ) ( not ( = ?auto_1615778 ?auto_1615786 ) ) ( not ( = ?auto_1615782 ?auto_1615786 ) ) ( not ( = ?auto_1615783 ?auto_1615786 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1615785 ?auto_1615786 ?auto_1615779 ?auto_1615780 )
      ( MAKE-1CRATE ?auto_1615777 ?auto_1615778 )
      ( MAKE-1CRATE-VERIFY ?auto_1615777 ?auto_1615778 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616267 - SURFACE
      ?auto_1616268 - SURFACE
      ?auto_1616269 - SURFACE
      ?auto_1616266 - SURFACE
      ?auto_1616270 - SURFACE
      ?auto_1616272 - SURFACE
      ?auto_1616271 - SURFACE
      ?auto_1616273 - SURFACE
      ?auto_1616274 - SURFACE
      ?auto_1616275 - SURFACE
      ?auto_1616276 - SURFACE
    )
    :vars
    (
      ?auto_1616278 - HOIST
      ?auto_1616277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616278 ?auto_1616277 ) ( SURFACE-AT ?auto_1616275 ?auto_1616277 ) ( CLEAR ?auto_1616275 ) ( LIFTING ?auto_1616278 ?auto_1616276 ) ( IS-CRATE ?auto_1616276 ) ( not ( = ?auto_1616275 ?auto_1616276 ) ) ( ON ?auto_1616268 ?auto_1616267 ) ( ON ?auto_1616269 ?auto_1616268 ) ( ON ?auto_1616266 ?auto_1616269 ) ( ON ?auto_1616270 ?auto_1616266 ) ( ON ?auto_1616272 ?auto_1616270 ) ( ON ?auto_1616271 ?auto_1616272 ) ( ON ?auto_1616273 ?auto_1616271 ) ( ON ?auto_1616274 ?auto_1616273 ) ( ON ?auto_1616275 ?auto_1616274 ) ( not ( = ?auto_1616267 ?auto_1616268 ) ) ( not ( = ?auto_1616267 ?auto_1616269 ) ) ( not ( = ?auto_1616267 ?auto_1616266 ) ) ( not ( = ?auto_1616267 ?auto_1616270 ) ) ( not ( = ?auto_1616267 ?auto_1616272 ) ) ( not ( = ?auto_1616267 ?auto_1616271 ) ) ( not ( = ?auto_1616267 ?auto_1616273 ) ) ( not ( = ?auto_1616267 ?auto_1616274 ) ) ( not ( = ?auto_1616267 ?auto_1616275 ) ) ( not ( = ?auto_1616267 ?auto_1616276 ) ) ( not ( = ?auto_1616268 ?auto_1616269 ) ) ( not ( = ?auto_1616268 ?auto_1616266 ) ) ( not ( = ?auto_1616268 ?auto_1616270 ) ) ( not ( = ?auto_1616268 ?auto_1616272 ) ) ( not ( = ?auto_1616268 ?auto_1616271 ) ) ( not ( = ?auto_1616268 ?auto_1616273 ) ) ( not ( = ?auto_1616268 ?auto_1616274 ) ) ( not ( = ?auto_1616268 ?auto_1616275 ) ) ( not ( = ?auto_1616268 ?auto_1616276 ) ) ( not ( = ?auto_1616269 ?auto_1616266 ) ) ( not ( = ?auto_1616269 ?auto_1616270 ) ) ( not ( = ?auto_1616269 ?auto_1616272 ) ) ( not ( = ?auto_1616269 ?auto_1616271 ) ) ( not ( = ?auto_1616269 ?auto_1616273 ) ) ( not ( = ?auto_1616269 ?auto_1616274 ) ) ( not ( = ?auto_1616269 ?auto_1616275 ) ) ( not ( = ?auto_1616269 ?auto_1616276 ) ) ( not ( = ?auto_1616266 ?auto_1616270 ) ) ( not ( = ?auto_1616266 ?auto_1616272 ) ) ( not ( = ?auto_1616266 ?auto_1616271 ) ) ( not ( = ?auto_1616266 ?auto_1616273 ) ) ( not ( = ?auto_1616266 ?auto_1616274 ) ) ( not ( = ?auto_1616266 ?auto_1616275 ) ) ( not ( = ?auto_1616266 ?auto_1616276 ) ) ( not ( = ?auto_1616270 ?auto_1616272 ) ) ( not ( = ?auto_1616270 ?auto_1616271 ) ) ( not ( = ?auto_1616270 ?auto_1616273 ) ) ( not ( = ?auto_1616270 ?auto_1616274 ) ) ( not ( = ?auto_1616270 ?auto_1616275 ) ) ( not ( = ?auto_1616270 ?auto_1616276 ) ) ( not ( = ?auto_1616272 ?auto_1616271 ) ) ( not ( = ?auto_1616272 ?auto_1616273 ) ) ( not ( = ?auto_1616272 ?auto_1616274 ) ) ( not ( = ?auto_1616272 ?auto_1616275 ) ) ( not ( = ?auto_1616272 ?auto_1616276 ) ) ( not ( = ?auto_1616271 ?auto_1616273 ) ) ( not ( = ?auto_1616271 ?auto_1616274 ) ) ( not ( = ?auto_1616271 ?auto_1616275 ) ) ( not ( = ?auto_1616271 ?auto_1616276 ) ) ( not ( = ?auto_1616273 ?auto_1616274 ) ) ( not ( = ?auto_1616273 ?auto_1616275 ) ) ( not ( = ?auto_1616273 ?auto_1616276 ) ) ( not ( = ?auto_1616274 ?auto_1616275 ) ) ( not ( = ?auto_1616274 ?auto_1616276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1616275 ?auto_1616276 )
      ( MAKE-10CRATE-VERIFY ?auto_1616267 ?auto_1616268 ?auto_1616269 ?auto_1616266 ?auto_1616270 ?auto_1616272 ?auto_1616271 ?auto_1616273 ?auto_1616274 ?auto_1616275 ?auto_1616276 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616361 - SURFACE
      ?auto_1616362 - SURFACE
      ?auto_1616363 - SURFACE
      ?auto_1616360 - SURFACE
      ?auto_1616364 - SURFACE
      ?auto_1616366 - SURFACE
      ?auto_1616365 - SURFACE
      ?auto_1616367 - SURFACE
      ?auto_1616368 - SURFACE
      ?auto_1616369 - SURFACE
      ?auto_1616370 - SURFACE
    )
    :vars
    (
      ?auto_1616373 - HOIST
      ?auto_1616372 - PLACE
      ?auto_1616371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616373 ?auto_1616372 ) ( SURFACE-AT ?auto_1616369 ?auto_1616372 ) ( CLEAR ?auto_1616369 ) ( IS-CRATE ?auto_1616370 ) ( not ( = ?auto_1616369 ?auto_1616370 ) ) ( TRUCK-AT ?auto_1616371 ?auto_1616372 ) ( AVAILABLE ?auto_1616373 ) ( IN ?auto_1616370 ?auto_1616371 ) ( ON ?auto_1616369 ?auto_1616368 ) ( not ( = ?auto_1616368 ?auto_1616369 ) ) ( not ( = ?auto_1616368 ?auto_1616370 ) ) ( ON ?auto_1616362 ?auto_1616361 ) ( ON ?auto_1616363 ?auto_1616362 ) ( ON ?auto_1616360 ?auto_1616363 ) ( ON ?auto_1616364 ?auto_1616360 ) ( ON ?auto_1616366 ?auto_1616364 ) ( ON ?auto_1616365 ?auto_1616366 ) ( ON ?auto_1616367 ?auto_1616365 ) ( ON ?auto_1616368 ?auto_1616367 ) ( not ( = ?auto_1616361 ?auto_1616362 ) ) ( not ( = ?auto_1616361 ?auto_1616363 ) ) ( not ( = ?auto_1616361 ?auto_1616360 ) ) ( not ( = ?auto_1616361 ?auto_1616364 ) ) ( not ( = ?auto_1616361 ?auto_1616366 ) ) ( not ( = ?auto_1616361 ?auto_1616365 ) ) ( not ( = ?auto_1616361 ?auto_1616367 ) ) ( not ( = ?auto_1616361 ?auto_1616368 ) ) ( not ( = ?auto_1616361 ?auto_1616369 ) ) ( not ( = ?auto_1616361 ?auto_1616370 ) ) ( not ( = ?auto_1616362 ?auto_1616363 ) ) ( not ( = ?auto_1616362 ?auto_1616360 ) ) ( not ( = ?auto_1616362 ?auto_1616364 ) ) ( not ( = ?auto_1616362 ?auto_1616366 ) ) ( not ( = ?auto_1616362 ?auto_1616365 ) ) ( not ( = ?auto_1616362 ?auto_1616367 ) ) ( not ( = ?auto_1616362 ?auto_1616368 ) ) ( not ( = ?auto_1616362 ?auto_1616369 ) ) ( not ( = ?auto_1616362 ?auto_1616370 ) ) ( not ( = ?auto_1616363 ?auto_1616360 ) ) ( not ( = ?auto_1616363 ?auto_1616364 ) ) ( not ( = ?auto_1616363 ?auto_1616366 ) ) ( not ( = ?auto_1616363 ?auto_1616365 ) ) ( not ( = ?auto_1616363 ?auto_1616367 ) ) ( not ( = ?auto_1616363 ?auto_1616368 ) ) ( not ( = ?auto_1616363 ?auto_1616369 ) ) ( not ( = ?auto_1616363 ?auto_1616370 ) ) ( not ( = ?auto_1616360 ?auto_1616364 ) ) ( not ( = ?auto_1616360 ?auto_1616366 ) ) ( not ( = ?auto_1616360 ?auto_1616365 ) ) ( not ( = ?auto_1616360 ?auto_1616367 ) ) ( not ( = ?auto_1616360 ?auto_1616368 ) ) ( not ( = ?auto_1616360 ?auto_1616369 ) ) ( not ( = ?auto_1616360 ?auto_1616370 ) ) ( not ( = ?auto_1616364 ?auto_1616366 ) ) ( not ( = ?auto_1616364 ?auto_1616365 ) ) ( not ( = ?auto_1616364 ?auto_1616367 ) ) ( not ( = ?auto_1616364 ?auto_1616368 ) ) ( not ( = ?auto_1616364 ?auto_1616369 ) ) ( not ( = ?auto_1616364 ?auto_1616370 ) ) ( not ( = ?auto_1616366 ?auto_1616365 ) ) ( not ( = ?auto_1616366 ?auto_1616367 ) ) ( not ( = ?auto_1616366 ?auto_1616368 ) ) ( not ( = ?auto_1616366 ?auto_1616369 ) ) ( not ( = ?auto_1616366 ?auto_1616370 ) ) ( not ( = ?auto_1616365 ?auto_1616367 ) ) ( not ( = ?auto_1616365 ?auto_1616368 ) ) ( not ( = ?auto_1616365 ?auto_1616369 ) ) ( not ( = ?auto_1616365 ?auto_1616370 ) ) ( not ( = ?auto_1616367 ?auto_1616368 ) ) ( not ( = ?auto_1616367 ?auto_1616369 ) ) ( not ( = ?auto_1616367 ?auto_1616370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616368 ?auto_1616369 ?auto_1616370 )
      ( MAKE-10CRATE-VERIFY ?auto_1616361 ?auto_1616362 ?auto_1616363 ?auto_1616360 ?auto_1616364 ?auto_1616366 ?auto_1616365 ?auto_1616367 ?auto_1616368 ?auto_1616369 ?auto_1616370 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616466 - SURFACE
      ?auto_1616467 - SURFACE
      ?auto_1616468 - SURFACE
      ?auto_1616465 - SURFACE
      ?auto_1616469 - SURFACE
      ?auto_1616471 - SURFACE
      ?auto_1616470 - SURFACE
      ?auto_1616472 - SURFACE
      ?auto_1616473 - SURFACE
      ?auto_1616474 - SURFACE
      ?auto_1616475 - SURFACE
    )
    :vars
    (
      ?auto_1616478 - HOIST
      ?auto_1616477 - PLACE
      ?auto_1616479 - TRUCK
      ?auto_1616476 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616478 ?auto_1616477 ) ( SURFACE-AT ?auto_1616474 ?auto_1616477 ) ( CLEAR ?auto_1616474 ) ( IS-CRATE ?auto_1616475 ) ( not ( = ?auto_1616474 ?auto_1616475 ) ) ( AVAILABLE ?auto_1616478 ) ( IN ?auto_1616475 ?auto_1616479 ) ( ON ?auto_1616474 ?auto_1616473 ) ( not ( = ?auto_1616473 ?auto_1616474 ) ) ( not ( = ?auto_1616473 ?auto_1616475 ) ) ( TRUCK-AT ?auto_1616479 ?auto_1616476 ) ( not ( = ?auto_1616476 ?auto_1616477 ) ) ( ON ?auto_1616467 ?auto_1616466 ) ( ON ?auto_1616468 ?auto_1616467 ) ( ON ?auto_1616465 ?auto_1616468 ) ( ON ?auto_1616469 ?auto_1616465 ) ( ON ?auto_1616471 ?auto_1616469 ) ( ON ?auto_1616470 ?auto_1616471 ) ( ON ?auto_1616472 ?auto_1616470 ) ( ON ?auto_1616473 ?auto_1616472 ) ( not ( = ?auto_1616466 ?auto_1616467 ) ) ( not ( = ?auto_1616466 ?auto_1616468 ) ) ( not ( = ?auto_1616466 ?auto_1616465 ) ) ( not ( = ?auto_1616466 ?auto_1616469 ) ) ( not ( = ?auto_1616466 ?auto_1616471 ) ) ( not ( = ?auto_1616466 ?auto_1616470 ) ) ( not ( = ?auto_1616466 ?auto_1616472 ) ) ( not ( = ?auto_1616466 ?auto_1616473 ) ) ( not ( = ?auto_1616466 ?auto_1616474 ) ) ( not ( = ?auto_1616466 ?auto_1616475 ) ) ( not ( = ?auto_1616467 ?auto_1616468 ) ) ( not ( = ?auto_1616467 ?auto_1616465 ) ) ( not ( = ?auto_1616467 ?auto_1616469 ) ) ( not ( = ?auto_1616467 ?auto_1616471 ) ) ( not ( = ?auto_1616467 ?auto_1616470 ) ) ( not ( = ?auto_1616467 ?auto_1616472 ) ) ( not ( = ?auto_1616467 ?auto_1616473 ) ) ( not ( = ?auto_1616467 ?auto_1616474 ) ) ( not ( = ?auto_1616467 ?auto_1616475 ) ) ( not ( = ?auto_1616468 ?auto_1616465 ) ) ( not ( = ?auto_1616468 ?auto_1616469 ) ) ( not ( = ?auto_1616468 ?auto_1616471 ) ) ( not ( = ?auto_1616468 ?auto_1616470 ) ) ( not ( = ?auto_1616468 ?auto_1616472 ) ) ( not ( = ?auto_1616468 ?auto_1616473 ) ) ( not ( = ?auto_1616468 ?auto_1616474 ) ) ( not ( = ?auto_1616468 ?auto_1616475 ) ) ( not ( = ?auto_1616465 ?auto_1616469 ) ) ( not ( = ?auto_1616465 ?auto_1616471 ) ) ( not ( = ?auto_1616465 ?auto_1616470 ) ) ( not ( = ?auto_1616465 ?auto_1616472 ) ) ( not ( = ?auto_1616465 ?auto_1616473 ) ) ( not ( = ?auto_1616465 ?auto_1616474 ) ) ( not ( = ?auto_1616465 ?auto_1616475 ) ) ( not ( = ?auto_1616469 ?auto_1616471 ) ) ( not ( = ?auto_1616469 ?auto_1616470 ) ) ( not ( = ?auto_1616469 ?auto_1616472 ) ) ( not ( = ?auto_1616469 ?auto_1616473 ) ) ( not ( = ?auto_1616469 ?auto_1616474 ) ) ( not ( = ?auto_1616469 ?auto_1616475 ) ) ( not ( = ?auto_1616471 ?auto_1616470 ) ) ( not ( = ?auto_1616471 ?auto_1616472 ) ) ( not ( = ?auto_1616471 ?auto_1616473 ) ) ( not ( = ?auto_1616471 ?auto_1616474 ) ) ( not ( = ?auto_1616471 ?auto_1616475 ) ) ( not ( = ?auto_1616470 ?auto_1616472 ) ) ( not ( = ?auto_1616470 ?auto_1616473 ) ) ( not ( = ?auto_1616470 ?auto_1616474 ) ) ( not ( = ?auto_1616470 ?auto_1616475 ) ) ( not ( = ?auto_1616472 ?auto_1616473 ) ) ( not ( = ?auto_1616472 ?auto_1616474 ) ) ( not ( = ?auto_1616472 ?auto_1616475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616473 ?auto_1616474 ?auto_1616475 )
      ( MAKE-10CRATE-VERIFY ?auto_1616466 ?auto_1616467 ?auto_1616468 ?auto_1616465 ?auto_1616469 ?auto_1616471 ?auto_1616470 ?auto_1616472 ?auto_1616473 ?auto_1616474 ?auto_1616475 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616581 - SURFACE
      ?auto_1616582 - SURFACE
      ?auto_1616583 - SURFACE
      ?auto_1616580 - SURFACE
      ?auto_1616584 - SURFACE
      ?auto_1616586 - SURFACE
      ?auto_1616585 - SURFACE
      ?auto_1616587 - SURFACE
      ?auto_1616588 - SURFACE
      ?auto_1616589 - SURFACE
      ?auto_1616590 - SURFACE
    )
    :vars
    (
      ?auto_1616592 - HOIST
      ?auto_1616591 - PLACE
      ?auto_1616594 - TRUCK
      ?auto_1616593 - PLACE
      ?auto_1616595 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616592 ?auto_1616591 ) ( SURFACE-AT ?auto_1616589 ?auto_1616591 ) ( CLEAR ?auto_1616589 ) ( IS-CRATE ?auto_1616590 ) ( not ( = ?auto_1616589 ?auto_1616590 ) ) ( AVAILABLE ?auto_1616592 ) ( ON ?auto_1616589 ?auto_1616588 ) ( not ( = ?auto_1616588 ?auto_1616589 ) ) ( not ( = ?auto_1616588 ?auto_1616590 ) ) ( TRUCK-AT ?auto_1616594 ?auto_1616593 ) ( not ( = ?auto_1616593 ?auto_1616591 ) ) ( HOIST-AT ?auto_1616595 ?auto_1616593 ) ( LIFTING ?auto_1616595 ?auto_1616590 ) ( not ( = ?auto_1616592 ?auto_1616595 ) ) ( ON ?auto_1616582 ?auto_1616581 ) ( ON ?auto_1616583 ?auto_1616582 ) ( ON ?auto_1616580 ?auto_1616583 ) ( ON ?auto_1616584 ?auto_1616580 ) ( ON ?auto_1616586 ?auto_1616584 ) ( ON ?auto_1616585 ?auto_1616586 ) ( ON ?auto_1616587 ?auto_1616585 ) ( ON ?auto_1616588 ?auto_1616587 ) ( not ( = ?auto_1616581 ?auto_1616582 ) ) ( not ( = ?auto_1616581 ?auto_1616583 ) ) ( not ( = ?auto_1616581 ?auto_1616580 ) ) ( not ( = ?auto_1616581 ?auto_1616584 ) ) ( not ( = ?auto_1616581 ?auto_1616586 ) ) ( not ( = ?auto_1616581 ?auto_1616585 ) ) ( not ( = ?auto_1616581 ?auto_1616587 ) ) ( not ( = ?auto_1616581 ?auto_1616588 ) ) ( not ( = ?auto_1616581 ?auto_1616589 ) ) ( not ( = ?auto_1616581 ?auto_1616590 ) ) ( not ( = ?auto_1616582 ?auto_1616583 ) ) ( not ( = ?auto_1616582 ?auto_1616580 ) ) ( not ( = ?auto_1616582 ?auto_1616584 ) ) ( not ( = ?auto_1616582 ?auto_1616586 ) ) ( not ( = ?auto_1616582 ?auto_1616585 ) ) ( not ( = ?auto_1616582 ?auto_1616587 ) ) ( not ( = ?auto_1616582 ?auto_1616588 ) ) ( not ( = ?auto_1616582 ?auto_1616589 ) ) ( not ( = ?auto_1616582 ?auto_1616590 ) ) ( not ( = ?auto_1616583 ?auto_1616580 ) ) ( not ( = ?auto_1616583 ?auto_1616584 ) ) ( not ( = ?auto_1616583 ?auto_1616586 ) ) ( not ( = ?auto_1616583 ?auto_1616585 ) ) ( not ( = ?auto_1616583 ?auto_1616587 ) ) ( not ( = ?auto_1616583 ?auto_1616588 ) ) ( not ( = ?auto_1616583 ?auto_1616589 ) ) ( not ( = ?auto_1616583 ?auto_1616590 ) ) ( not ( = ?auto_1616580 ?auto_1616584 ) ) ( not ( = ?auto_1616580 ?auto_1616586 ) ) ( not ( = ?auto_1616580 ?auto_1616585 ) ) ( not ( = ?auto_1616580 ?auto_1616587 ) ) ( not ( = ?auto_1616580 ?auto_1616588 ) ) ( not ( = ?auto_1616580 ?auto_1616589 ) ) ( not ( = ?auto_1616580 ?auto_1616590 ) ) ( not ( = ?auto_1616584 ?auto_1616586 ) ) ( not ( = ?auto_1616584 ?auto_1616585 ) ) ( not ( = ?auto_1616584 ?auto_1616587 ) ) ( not ( = ?auto_1616584 ?auto_1616588 ) ) ( not ( = ?auto_1616584 ?auto_1616589 ) ) ( not ( = ?auto_1616584 ?auto_1616590 ) ) ( not ( = ?auto_1616586 ?auto_1616585 ) ) ( not ( = ?auto_1616586 ?auto_1616587 ) ) ( not ( = ?auto_1616586 ?auto_1616588 ) ) ( not ( = ?auto_1616586 ?auto_1616589 ) ) ( not ( = ?auto_1616586 ?auto_1616590 ) ) ( not ( = ?auto_1616585 ?auto_1616587 ) ) ( not ( = ?auto_1616585 ?auto_1616588 ) ) ( not ( = ?auto_1616585 ?auto_1616589 ) ) ( not ( = ?auto_1616585 ?auto_1616590 ) ) ( not ( = ?auto_1616587 ?auto_1616588 ) ) ( not ( = ?auto_1616587 ?auto_1616589 ) ) ( not ( = ?auto_1616587 ?auto_1616590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616588 ?auto_1616589 ?auto_1616590 )
      ( MAKE-10CRATE-VERIFY ?auto_1616581 ?auto_1616582 ?auto_1616583 ?auto_1616580 ?auto_1616584 ?auto_1616586 ?auto_1616585 ?auto_1616587 ?auto_1616588 ?auto_1616589 ?auto_1616590 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616706 - SURFACE
      ?auto_1616707 - SURFACE
      ?auto_1616708 - SURFACE
      ?auto_1616705 - SURFACE
      ?auto_1616709 - SURFACE
      ?auto_1616711 - SURFACE
      ?auto_1616710 - SURFACE
      ?auto_1616712 - SURFACE
      ?auto_1616713 - SURFACE
      ?auto_1616714 - SURFACE
      ?auto_1616715 - SURFACE
    )
    :vars
    (
      ?auto_1616719 - HOIST
      ?auto_1616716 - PLACE
      ?auto_1616718 - TRUCK
      ?auto_1616717 - PLACE
      ?auto_1616720 - HOIST
      ?auto_1616721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616719 ?auto_1616716 ) ( SURFACE-AT ?auto_1616714 ?auto_1616716 ) ( CLEAR ?auto_1616714 ) ( IS-CRATE ?auto_1616715 ) ( not ( = ?auto_1616714 ?auto_1616715 ) ) ( AVAILABLE ?auto_1616719 ) ( ON ?auto_1616714 ?auto_1616713 ) ( not ( = ?auto_1616713 ?auto_1616714 ) ) ( not ( = ?auto_1616713 ?auto_1616715 ) ) ( TRUCK-AT ?auto_1616718 ?auto_1616717 ) ( not ( = ?auto_1616717 ?auto_1616716 ) ) ( HOIST-AT ?auto_1616720 ?auto_1616717 ) ( not ( = ?auto_1616719 ?auto_1616720 ) ) ( AVAILABLE ?auto_1616720 ) ( SURFACE-AT ?auto_1616715 ?auto_1616717 ) ( ON ?auto_1616715 ?auto_1616721 ) ( CLEAR ?auto_1616715 ) ( not ( = ?auto_1616714 ?auto_1616721 ) ) ( not ( = ?auto_1616715 ?auto_1616721 ) ) ( not ( = ?auto_1616713 ?auto_1616721 ) ) ( ON ?auto_1616707 ?auto_1616706 ) ( ON ?auto_1616708 ?auto_1616707 ) ( ON ?auto_1616705 ?auto_1616708 ) ( ON ?auto_1616709 ?auto_1616705 ) ( ON ?auto_1616711 ?auto_1616709 ) ( ON ?auto_1616710 ?auto_1616711 ) ( ON ?auto_1616712 ?auto_1616710 ) ( ON ?auto_1616713 ?auto_1616712 ) ( not ( = ?auto_1616706 ?auto_1616707 ) ) ( not ( = ?auto_1616706 ?auto_1616708 ) ) ( not ( = ?auto_1616706 ?auto_1616705 ) ) ( not ( = ?auto_1616706 ?auto_1616709 ) ) ( not ( = ?auto_1616706 ?auto_1616711 ) ) ( not ( = ?auto_1616706 ?auto_1616710 ) ) ( not ( = ?auto_1616706 ?auto_1616712 ) ) ( not ( = ?auto_1616706 ?auto_1616713 ) ) ( not ( = ?auto_1616706 ?auto_1616714 ) ) ( not ( = ?auto_1616706 ?auto_1616715 ) ) ( not ( = ?auto_1616706 ?auto_1616721 ) ) ( not ( = ?auto_1616707 ?auto_1616708 ) ) ( not ( = ?auto_1616707 ?auto_1616705 ) ) ( not ( = ?auto_1616707 ?auto_1616709 ) ) ( not ( = ?auto_1616707 ?auto_1616711 ) ) ( not ( = ?auto_1616707 ?auto_1616710 ) ) ( not ( = ?auto_1616707 ?auto_1616712 ) ) ( not ( = ?auto_1616707 ?auto_1616713 ) ) ( not ( = ?auto_1616707 ?auto_1616714 ) ) ( not ( = ?auto_1616707 ?auto_1616715 ) ) ( not ( = ?auto_1616707 ?auto_1616721 ) ) ( not ( = ?auto_1616708 ?auto_1616705 ) ) ( not ( = ?auto_1616708 ?auto_1616709 ) ) ( not ( = ?auto_1616708 ?auto_1616711 ) ) ( not ( = ?auto_1616708 ?auto_1616710 ) ) ( not ( = ?auto_1616708 ?auto_1616712 ) ) ( not ( = ?auto_1616708 ?auto_1616713 ) ) ( not ( = ?auto_1616708 ?auto_1616714 ) ) ( not ( = ?auto_1616708 ?auto_1616715 ) ) ( not ( = ?auto_1616708 ?auto_1616721 ) ) ( not ( = ?auto_1616705 ?auto_1616709 ) ) ( not ( = ?auto_1616705 ?auto_1616711 ) ) ( not ( = ?auto_1616705 ?auto_1616710 ) ) ( not ( = ?auto_1616705 ?auto_1616712 ) ) ( not ( = ?auto_1616705 ?auto_1616713 ) ) ( not ( = ?auto_1616705 ?auto_1616714 ) ) ( not ( = ?auto_1616705 ?auto_1616715 ) ) ( not ( = ?auto_1616705 ?auto_1616721 ) ) ( not ( = ?auto_1616709 ?auto_1616711 ) ) ( not ( = ?auto_1616709 ?auto_1616710 ) ) ( not ( = ?auto_1616709 ?auto_1616712 ) ) ( not ( = ?auto_1616709 ?auto_1616713 ) ) ( not ( = ?auto_1616709 ?auto_1616714 ) ) ( not ( = ?auto_1616709 ?auto_1616715 ) ) ( not ( = ?auto_1616709 ?auto_1616721 ) ) ( not ( = ?auto_1616711 ?auto_1616710 ) ) ( not ( = ?auto_1616711 ?auto_1616712 ) ) ( not ( = ?auto_1616711 ?auto_1616713 ) ) ( not ( = ?auto_1616711 ?auto_1616714 ) ) ( not ( = ?auto_1616711 ?auto_1616715 ) ) ( not ( = ?auto_1616711 ?auto_1616721 ) ) ( not ( = ?auto_1616710 ?auto_1616712 ) ) ( not ( = ?auto_1616710 ?auto_1616713 ) ) ( not ( = ?auto_1616710 ?auto_1616714 ) ) ( not ( = ?auto_1616710 ?auto_1616715 ) ) ( not ( = ?auto_1616710 ?auto_1616721 ) ) ( not ( = ?auto_1616712 ?auto_1616713 ) ) ( not ( = ?auto_1616712 ?auto_1616714 ) ) ( not ( = ?auto_1616712 ?auto_1616715 ) ) ( not ( = ?auto_1616712 ?auto_1616721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616713 ?auto_1616714 ?auto_1616715 )
      ( MAKE-10CRATE-VERIFY ?auto_1616706 ?auto_1616707 ?auto_1616708 ?auto_1616705 ?auto_1616709 ?auto_1616711 ?auto_1616710 ?auto_1616712 ?auto_1616713 ?auto_1616714 ?auto_1616715 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616832 - SURFACE
      ?auto_1616833 - SURFACE
      ?auto_1616834 - SURFACE
      ?auto_1616831 - SURFACE
      ?auto_1616835 - SURFACE
      ?auto_1616837 - SURFACE
      ?auto_1616836 - SURFACE
      ?auto_1616838 - SURFACE
      ?auto_1616839 - SURFACE
      ?auto_1616840 - SURFACE
      ?auto_1616841 - SURFACE
    )
    :vars
    (
      ?auto_1616844 - HOIST
      ?auto_1616843 - PLACE
      ?auto_1616846 - PLACE
      ?auto_1616842 - HOIST
      ?auto_1616845 - SURFACE
      ?auto_1616847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616844 ?auto_1616843 ) ( SURFACE-AT ?auto_1616840 ?auto_1616843 ) ( CLEAR ?auto_1616840 ) ( IS-CRATE ?auto_1616841 ) ( not ( = ?auto_1616840 ?auto_1616841 ) ) ( AVAILABLE ?auto_1616844 ) ( ON ?auto_1616840 ?auto_1616839 ) ( not ( = ?auto_1616839 ?auto_1616840 ) ) ( not ( = ?auto_1616839 ?auto_1616841 ) ) ( not ( = ?auto_1616846 ?auto_1616843 ) ) ( HOIST-AT ?auto_1616842 ?auto_1616846 ) ( not ( = ?auto_1616844 ?auto_1616842 ) ) ( AVAILABLE ?auto_1616842 ) ( SURFACE-AT ?auto_1616841 ?auto_1616846 ) ( ON ?auto_1616841 ?auto_1616845 ) ( CLEAR ?auto_1616841 ) ( not ( = ?auto_1616840 ?auto_1616845 ) ) ( not ( = ?auto_1616841 ?auto_1616845 ) ) ( not ( = ?auto_1616839 ?auto_1616845 ) ) ( TRUCK-AT ?auto_1616847 ?auto_1616843 ) ( ON ?auto_1616833 ?auto_1616832 ) ( ON ?auto_1616834 ?auto_1616833 ) ( ON ?auto_1616831 ?auto_1616834 ) ( ON ?auto_1616835 ?auto_1616831 ) ( ON ?auto_1616837 ?auto_1616835 ) ( ON ?auto_1616836 ?auto_1616837 ) ( ON ?auto_1616838 ?auto_1616836 ) ( ON ?auto_1616839 ?auto_1616838 ) ( not ( = ?auto_1616832 ?auto_1616833 ) ) ( not ( = ?auto_1616832 ?auto_1616834 ) ) ( not ( = ?auto_1616832 ?auto_1616831 ) ) ( not ( = ?auto_1616832 ?auto_1616835 ) ) ( not ( = ?auto_1616832 ?auto_1616837 ) ) ( not ( = ?auto_1616832 ?auto_1616836 ) ) ( not ( = ?auto_1616832 ?auto_1616838 ) ) ( not ( = ?auto_1616832 ?auto_1616839 ) ) ( not ( = ?auto_1616832 ?auto_1616840 ) ) ( not ( = ?auto_1616832 ?auto_1616841 ) ) ( not ( = ?auto_1616832 ?auto_1616845 ) ) ( not ( = ?auto_1616833 ?auto_1616834 ) ) ( not ( = ?auto_1616833 ?auto_1616831 ) ) ( not ( = ?auto_1616833 ?auto_1616835 ) ) ( not ( = ?auto_1616833 ?auto_1616837 ) ) ( not ( = ?auto_1616833 ?auto_1616836 ) ) ( not ( = ?auto_1616833 ?auto_1616838 ) ) ( not ( = ?auto_1616833 ?auto_1616839 ) ) ( not ( = ?auto_1616833 ?auto_1616840 ) ) ( not ( = ?auto_1616833 ?auto_1616841 ) ) ( not ( = ?auto_1616833 ?auto_1616845 ) ) ( not ( = ?auto_1616834 ?auto_1616831 ) ) ( not ( = ?auto_1616834 ?auto_1616835 ) ) ( not ( = ?auto_1616834 ?auto_1616837 ) ) ( not ( = ?auto_1616834 ?auto_1616836 ) ) ( not ( = ?auto_1616834 ?auto_1616838 ) ) ( not ( = ?auto_1616834 ?auto_1616839 ) ) ( not ( = ?auto_1616834 ?auto_1616840 ) ) ( not ( = ?auto_1616834 ?auto_1616841 ) ) ( not ( = ?auto_1616834 ?auto_1616845 ) ) ( not ( = ?auto_1616831 ?auto_1616835 ) ) ( not ( = ?auto_1616831 ?auto_1616837 ) ) ( not ( = ?auto_1616831 ?auto_1616836 ) ) ( not ( = ?auto_1616831 ?auto_1616838 ) ) ( not ( = ?auto_1616831 ?auto_1616839 ) ) ( not ( = ?auto_1616831 ?auto_1616840 ) ) ( not ( = ?auto_1616831 ?auto_1616841 ) ) ( not ( = ?auto_1616831 ?auto_1616845 ) ) ( not ( = ?auto_1616835 ?auto_1616837 ) ) ( not ( = ?auto_1616835 ?auto_1616836 ) ) ( not ( = ?auto_1616835 ?auto_1616838 ) ) ( not ( = ?auto_1616835 ?auto_1616839 ) ) ( not ( = ?auto_1616835 ?auto_1616840 ) ) ( not ( = ?auto_1616835 ?auto_1616841 ) ) ( not ( = ?auto_1616835 ?auto_1616845 ) ) ( not ( = ?auto_1616837 ?auto_1616836 ) ) ( not ( = ?auto_1616837 ?auto_1616838 ) ) ( not ( = ?auto_1616837 ?auto_1616839 ) ) ( not ( = ?auto_1616837 ?auto_1616840 ) ) ( not ( = ?auto_1616837 ?auto_1616841 ) ) ( not ( = ?auto_1616837 ?auto_1616845 ) ) ( not ( = ?auto_1616836 ?auto_1616838 ) ) ( not ( = ?auto_1616836 ?auto_1616839 ) ) ( not ( = ?auto_1616836 ?auto_1616840 ) ) ( not ( = ?auto_1616836 ?auto_1616841 ) ) ( not ( = ?auto_1616836 ?auto_1616845 ) ) ( not ( = ?auto_1616838 ?auto_1616839 ) ) ( not ( = ?auto_1616838 ?auto_1616840 ) ) ( not ( = ?auto_1616838 ?auto_1616841 ) ) ( not ( = ?auto_1616838 ?auto_1616845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616839 ?auto_1616840 ?auto_1616841 )
      ( MAKE-10CRATE-VERIFY ?auto_1616832 ?auto_1616833 ?auto_1616834 ?auto_1616831 ?auto_1616835 ?auto_1616837 ?auto_1616836 ?auto_1616838 ?auto_1616839 ?auto_1616840 ?auto_1616841 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616958 - SURFACE
      ?auto_1616959 - SURFACE
      ?auto_1616960 - SURFACE
      ?auto_1616957 - SURFACE
      ?auto_1616961 - SURFACE
      ?auto_1616963 - SURFACE
      ?auto_1616962 - SURFACE
      ?auto_1616964 - SURFACE
      ?auto_1616965 - SURFACE
      ?auto_1616966 - SURFACE
      ?auto_1616967 - SURFACE
    )
    :vars
    (
      ?auto_1616972 - HOIST
      ?auto_1616971 - PLACE
      ?auto_1616968 - PLACE
      ?auto_1616973 - HOIST
      ?auto_1616970 - SURFACE
      ?auto_1616969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616972 ?auto_1616971 ) ( IS-CRATE ?auto_1616967 ) ( not ( = ?auto_1616966 ?auto_1616967 ) ) ( not ( = ?auto_1616965 ?auto_1616966 ) ) ( not ( = ?auto_1616965 ?auto_1616967 ) ) ( not ( = ?auto_1616968 ?auto_1616971 ) ) ( HOIST-AT ?auto_1616973 ?auto_1616968 ) ( not ( = ?auto_1616972 ?auto_1616973 ) ) ( AVAILABLE ?auto_1616973 ) ( SURFACE-AT ?auto_1616967 ?auto_1616968 ) ( ON ?auto_1616967 ?auto_1616970 ) ( CLEAR ?auto_1616967 ) ( not ( = ?auto_1616966 ?auto_1616970 ) ) ( not ( = ?auto_1616967 ?auto_1616970 ) ) ( not ( = ?auto_1616965 ?auto_1616970 ) ) ( TRUCK-AT ?auto_1616969 ?auto_1616971 ) ( SURFACE-AT ?auto_1616965 ?auto_1616971 ) ( CLEAR ?auto_1616965 ) ( LIFTING ?auto_1616972 ?auto_1616966 ) ( IS-CRATE ?auto_1616966 ) ( ON ?auto_1616959 ?auto_1616958 ) ( ON ?auto_1616960 ?auto_1616959 ) ( ON ?auto_1616957 ?auto_1616960 ) ( ON ?auto_1616961 ?auto_1616957 ) ( ON ?auto_1616963 ?auto_1616961 ) ( ON ?auto_1616962 ?auto_1616963 ) ( ON ?auto_1616964 ?auto_1616962 ) ( ON ?auto_1616965 ?auto_1616964 ) ( not ( = ?auto_1616958 ?auto_1616959 ) ) ( not ( = ?auto_1616958 ?auto_1616960 ) ) ( not ( = ?auto_1616958 ?auto_1616957 ) ) ( not ( = ?auto_1616958 ?auto_1616961 ) ) ( not ( = ?auto_1616958 ?auto_1616963 ) ) ( not ( = ?auto_1616958 ?auto_1616962 ) ) ( not ( = ?auto_1616958 ?auto_1616964 ) ) ( not ( = ?auto_1616958 ?auto_1616965 ) ) ( not ( = ?auto_1616958 ?auto_1616966 ) ) ( not ( = ?auto_1616958 ?auto_1616967 ) ) ( not ( = ?auto_1616958 ?auto_1616970 ) ) ( not ( = ?auto_1616959 ?auto_1616960 ) ) ( not ( = ?auto_1616959 ?auto_1616957 ) ) ( not ( = ?auto_1616959 ?auto_1616961 ) ) ( not ( = ?auto_1616959 ?auto_1616963 ) ) ( not ( = ?auto_1616959 ?auto_1616962 ) ) ( not ( = ?auto_1616959 ?auto_1616964 ) ) ( not ( = ?auto_1616959 ?auto_1616965 ) ) ( not ( = ?auto_1616959 ?auto_1616966 ) ) ( not ( = ?auto_1616959 ?auto_1616967 ) ) ( not ( = ?auto_1616959 ?auto_1616970 ) ) ( not ( = ?auto_1616960 ?auto_1616957 ) ) ( not ( = ?auto_1616960 ?auto_1616961 ) ) ( not ( = ?auto_1616960 ?auto_1616963 ) ) ( not ( = ?auto_1616960 ?auto_1616962 ) ) ( not ( = ?auto_1616960 ?auto_1616964 ) ) ( not ( = ?auto_1616960 ?auto_1616965 ) ) ( not ( = ?auto_1616960 ?auto_1616966 ) ) ( not ( = ?auto_1616960 ?auto_1616967 ) ) ( not ( = ?auto_1616960 ?auto_1616970 ) ) ( not ( = ?auto_1616957 ?auto_1616961 ) ) ( not ( = ?auto_1616957 ?auto_1616963 ) ) ( not ( = ?auto_1616957 ?auto_1616962 ) ) ( not ( = ?auto_1616957 ?auto_1616964 ) ) ( not ( = ?auto_1616957 ?auto_1616965 ) ) ( not ( = ?auto_1616957 ?auto_1616966 ) ) ( not ( = ?auto_1616957 ?auto_1616967 ) ) ( not ( = ?auto_1616957 ?auto_1616970 ) ) ( not ( = ?auto_1616961 ?auto_1616963 ) ) ( not ( = ?auto_1616961 ?auto_1616962 ) ) ( not ( = ?auto_1616961 ?auto_1616964 ) ) ( not ( = ?auto_1616961 ?auto_1616965 ) ) ( not ( = ?auto_1616961 ?auto_1616966 ) ) ( not ( = ?auto_1616961 ?auto_1616967 ) ) ( not ( = ?auto_1616961 ?auto_1616970 ) ) ( not ( = ?auto_1616963 ?auto_1616962 ) ) ( not ( = ?auto_1616963 ?auto_1616964 ) ) ( not ( = ?auto_1616963 ?auto_1616965 ) ) ( not ( = ?auto_1616963 ?auto_1616966 ) ) ( not ( = ?auto_1616963 ?auto_1616967 ) ) ( not ( = ?auto_1616963 ?auto_1616970 ) ) ( not ( = ?auto_1616962 ?auto_1616964 ) ) ( not ( = ?auto_1616962 ?auto_1616965 ) ) ( not ( = ?auto_1616962 ?auto_1616966 ) ) ( not ( = ?auto_1616962 ?auto_1616967 ) ) ( not ( = ?auto_1616962 ?auto_1616970 ) ) ( not ( = ?auto_1616964 ?auto_1616965 ) ) ( not ( = ?auto_1616964 ?auto_1616966 ) ) ( not ( = ?auto_1616964 ?auto_1616967 ) ) ( not ( = ?auto_1616964 ?auto_1616970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616965 ?auto_1616966 ?auto_1616967 )
      ( MAKE-10CRATE-VERIFY ?auto_1616958 ?auto_1616959 ?auto_1616960 ?auto_1616957 ?auto_1616961 ?auto_1616963 ?auto_1616962 ?auto_1616964 ?auto_1616965 ?auto_1616966 ?auto_1616967 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1617084 - SURFACE
      ?auto_1617085 - SURFACE
      ?auto_1617086 - SURFACE
      ?auto_1617083 - SURFACE
      ?auto_1617087 - SURFACE
      ?auto_1617089 - SURFACE
      ?auto_1617088 - SURFACE
      ?auto_1617090 - SURFACE
      ?auto_1617091 - SURFACE
      ?auto_1617092 - SURFACE
      ?auto_1617093 - SURFACE
    )
    :vars
    (
      ?auto_1617097 - HOIST
      ?auto_1617098 - PLACE
      ?auto_1617094 - PLACE
      ?auto_1617099 - HOIST
      ?auto_1617095 - SURFACE
      ?auto_1617096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1617097 ?auto_1617098 ) ( IS-CRATE ?auto_1617093 ) ( not ( = ?auto_1617092 ?auto_1617093 ) ) ( not ( = ?auto_1617091 ?auto_1617092 ) ) ( not ( = ?auto_1617091 ?auto_1617093 ) ) ( not ( = ?auto_1617094 ?auto_1617098 ) ) ( HOIST-AT ?auto_1617099 ?auto_1617094 ) ( not ( = ?auto_1617097 ?auto_1617099 ) ) ( AVAILABLE ?auto_1617099 ) ( SURFACE-AT ?auto_1617093 ?auto_1617094 ) ( ON ?auto_1617093 ?auto_1617095 ) ( CLEAR ?auto_1617093 ) ( not ( = ?auto_1617092 ?auto_1617095 ) ) ( not ( = ?auto_1617093 ?auto_1617095 ) ) ( not ( = ?auto_1617091 ?auto_1617095 ) ) ( TRUCK-AT ?auto_1617096 ?auto_1617098 ) ( SURFACE-AT ?auto_1617091 ?auto_1617098 ) ( CLEAR ?auto_1617091 ) ( IS-CRATE ?auto_1617092 ) ( AVAILABLE ?auto_1617097 ) ( IN ?auto_1617092 ?auto_1617096 ) ( ON ?auto_1617085 ?auto_1617084 ) ( ON ?auto_1617086 ?auto_1617085 ) ( ON ?auto_1617083 ?auto_1617086 ) ( ON ?auto_1617087 ?auto_1617083 ) ( ON ?auto_1617089 ?auto_1617087 ) ( ON ?auto_1617088 ?auto_1617089 ) ( ON ?auto_1617090 ?auto_1617088 ) ( ON ?auto_1617091 ?auto_1617090 ) ( not ( = ?auto_1617084 ?auto_1617085 ) ) ( not ( = ?auto_1617084 ?auto_1617086 ) ) ( not ( = ?auto_1617084 ?auto_1617083 ) ) ( not ( = ?auto_1617084 ?auto_1617087 ) ) ( not ( = ?auto_1617084 ?auto_1617089 ) ) ( not ( = ?auto_1617084 ?auto_1617088 ) ) ( not ( = ?auto_1617084 ?auto_1617090 ) ) ( not ( = ?auto_1617084 ?auto_1617091 ) ) ( not ( = ?auto_1617084 ?auto_1617092 ) ) ( not ( = ?auto_1617084 ?auto_1617093 ) ) ( not ( = ?auto_1617084 ?auto_1617095 ) ) ( not ( = ?auto_1617085 ?auto_1617086 ) ) ( not ( = ?auto_1617085 ?auto_1617083 ) ) ( not ( = ?auto_1617085 ?auto_1617087 ) ) ( not ( = ?auto_1617085 ?auto_1617089 ) ) ( not ( = ?auto_1617085 ?auto_1617088 ) ) ( not ( = ?auto_1617085 ?auto_1617090 ) ) ( not ( = ?auto_1617085 ?auto_1617091 ) ) ( not ( = ?auto_1617085 ?auto_1617092 ) ) ( not ( = ?auto_1617085 ?auto_1617093 ) ) ( not ( = ?auto_1617085 ?auto_1617095 ) ) ( not ( = ?auto_1617086 ?auto_1617083 ) ) ( not ( = ?auto_1617086 ?auto_1617087 ) ) ( not ( = ?auto_1617086 ?auto_1617089 ) ) ( not ( = ?auto_1617086 ?auto_1617088 ) ) ( not ( = ?auto_1617086 ?auto_1617090 ) ) ( not ( = ?auto_1617086 ?auto_1617091 ) ) ( not ( = ?auto_1617086 ?auto_1617092 ) ) ( not ( = ?auto_1617086 ?auto_1617093 ) ) ( not ( = ?auto_1617086 ?auto_1617095 ) ) ( not ( = ?auto_1617083 ?auto_1617087 ) ) ( not ( = ?auto_1617083 ?auto_1617089 ) ) ( not ( = ?auto_1617083 ?auto_1617088 ) ) ( not ( = ?auto_1617083 ?auto_1617090 ) ) ( not ( = ?auto_1617083 ?auto_1617091 ) ) ( not ( = ?auto_1617083 ?auto_1617092 ) ) ( not ( = ?auto_1617083 ?auto_1617093 ) ) ( not ( = ?auto_1617083 ?auto_1617095 ) ) ( not ( = ?auto_1617087 ?auto_1617089 ) ) ( not ( = ?auto_1617087 ?auto_1617088 ) ) ( not ( = ?auto_1617087 ?auto_1617090 ) ) ( not ( = ?auto_1617087 ?auto_1617091 ) ) ( not ( = ?auto_1617087 ?auto_1617092 ) ) ( not ( = ?auto_1617087 ?auto_1617093 ) ) ( not ( = ?auto_1617087 ?auto_1617095 ) ) ( not ( = ?auto_1617089 ?auto_1617088 ) ) ( not ( = ?auto_1617089 ?auto_1617090 ) ) ( not ( = ?auto_1617089 ?auto_1617091 ) ) ( not ( = ?auto_1617089 ?auto_1617092 ) ) ( not ( = ?auto_1617089 ?auto_1617093 ) ) ( not ( = ?auto_1617089 ?auto_1617095 ) ) ( not ( = ?auto_1617088 ?auto_1617090 ) ) ( not ( = ?auto_1617088 ?auto_1617091 ) ) ( not ( = ?auto_1617088 ?auto_1617092 ) ) ( not ( = ?auto_1617088 ?auto_1617093 ) ) ( not ( = ?auto_1617088 ?auto_1617095 ) ) ( not ( = ?auto_1617090 ?auto_1617091 ) ) ( not ( = ?auto_1617090 ?auto_1617092 ) ) ( not ( = ?auto_1617090 ?auto_1617093 ) ) ( not ( = ?auto_1617090 ?auto_1617095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1617091 ?auto_1617092 ?auto_1617093 )
      ( MAKE-10CRATE-VERIFY ?auto_1617084 ?auto_1617085 ?auto_1617086 ?auto_1617083 ?auto_1617087 ?auto_1617089 ?auto_1617088 ?auto_1617090 ?auto_1617091 ?auto_1617092 ?auto_1617093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1623785 - SURFACE
      ?auto_1623786 - SURFACE
    )
    :vars
    (
      ?auto_1623788 - HOIST
      ?auto_1623787 - PLACE
      ?auto_1623789 - SURFACE
      ?auto_1623790 - PLACE
      ?auto_1623792 - HOIST
      ?auto_1623791 - SURFACE
      ?auto_1623793 - TRUCK
      ?auto_1623794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1623788 ?auto_1623787 ) ( SURFACE-AT ?auto_1623785 ?auto_1623787 ) ( CLEAR ?auto_1623785 ) ( IS-CRATE ?auto_1623786 ) ( not ( = ?auto_1623785 ?auto_1623786 ) ) ( ON ?auto_1623785 ?auto_1623789 ) ( not ( = ?auto_1623789 ?auto_1623785 ) ) ( not ( = ?auto_1623789 ?auto_1623786 ) ) ( not ( = ?auto_1623790 ?auto_1623787 ) ) ( HOIST-AT ?auto_1623792 ?auto_1623790 ) ( not ( = ?auto_1623788 ?auto_1623792 ) ) ( AVAILABLE ?auto_1623792 ) ( SURFACE-AT ?auto_1623786 ?auto_1623790 ) ( ON ?auto_1623786 ?auto_1623791 ) ( CLEAR ?auto_1623786 ) ( not ( = ?auto_1623785 ?auto_1623791 ) ) ( not ( = ?auto_1623786 ?auto_1623791 ) ) ( not ( = ?auto_1623789 ?auto_1623791 ) ) ( TRUCK-AT ?auto_1623793 ?auto_1623787 ) ( LIFTING ?auto_1623788 ?auto_1623794 ) ( IS-CRATE ?auto_1623794 ) ( not ( = ?auto_1623785 ?auto_1623794 ) ) ( not ( = ?auto_1623786 ?auto_1623794 ) ) ( not ( = ?auto_1623789 ?auto_1623794 ) ) ( not ( = ?auto_1623791 ?auto_1623794 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1623788 ?auto_1623794 ?auto_1623793 ?auto_1623787 )
      ( MAKE-1CRATE ?auto_1623785 ?auto_1623786 )
      ( MAKE-1CRATE-VERIFY ?auto_1623785 ?auto_1623786 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624356 - SURFACE
      ?auto_1624357 - SURFACE
      ?auto_1624358 - SURFACE
      ?auto_1624355 - SURFACE
      ?auto_1624359 - SURFACE
      ?auto_1624361 - SURFACE
      ?auto_1624360 - SURFACE
      ?auto_1624362 - SURFACE
      ?auto_1624363 - SURFACE
      ?auto_1624364 - SURFACE
      ?auto_1624365 - SURFACE
      ?auto_1624366 - SURFACE
    )
    :vars
    (
      ?auto_1624368 - HOIST
      ?auto_1624367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624368 ?auto_1624367 ) ( SURFACE-AT ?auto_1624365 ?auto_1624367 ) ( CLEAR ?auto_1624365 ) ( LIFTING ?auto_1624368 ?auto_1624366 ) ( IS-CRATE ?auto_1624366 ) ( not ( = ?auto_1624365 ?auto_1624366 ) ) ( ON ?auto_1624357 ?auto_1624356 ) ( ON ?auto_1624358 ?auto_1624357 ) ( ON ?auto_1624355 ?auto_1624358 ) ( ON ?auto_1624359 ?auto_1624355 ) ( ON ?auto_1624361 ?auto_1624359 ) ( ON ?auto_1624360 ?auto_1624361 ) ( ON ?auto_1624362 ?auto_1624360 ) ( ON ?auto_1624363 ?auto_1624362 ) ( ON ?auto_1624364 ?auto_1624363 ) ( ON ?auto_1624365 ?auto_1624364 ) ( not ( = ?auto_1624356 ?auto_1624357 ) ) ( not ( = ?auto_1624356 ?auto_1624358 ) ) ( not ( = ?auto_1624356 ?auto_1624355 ) ) ( not ( = ?auto_1624356 ?auto_1624359 ) ) ( not ( = ?auto_1624356 ?auto_1624361 ) ) ( not ( = ?auto_1624356 ?auto_1624360 ) ) ( not ( = ?auto_1624356 ?auto_1624362 ) ) ( not ( = ?auto_1624356 ?auto_1624363 ) ) ( not ( = ?auto_1624356 ?auto_1624364 ) ) ( not ( = ?auto_1624356 ?auto_1624365 ) ) ( not ( = ?auto_1624356 ?auto_1624366 ) ) ( not ( = ?auto_1624357 ?auto_1624358 ) ) ( not ( = ?auto_1624357 ?auto_1624355 ) ) ( not ( = ?auto_1624357 ?auto_1624359 ) ) ( not ( = ?auto_1624357 ?auto_1624361 ) ) ( not ( = ?auto_1624357 ?auto_1624360 ) ) ( not ( = ?auto_1624357 ?auto_1624362 ) ) ( not ( = ?auto_1624357 ?auto_1624363 ) ) ( not ( = ?auto_1624357 ?auto_1624364 ) ) ( not ( = ?auto_1624357 ?auto_1624365 ) ) ( not ( = ?auto_1624357 ?auto_1624366 ) ) ( not ( = ?auto_1624358 ?auto_1624355 ) ) ( not ( = ?auto_1624358 ?auto_1624359 ) ) ( not ( = ?auto_1624358 ?auto_1624361 ) ) ( not ( = ?auto_1624358 ?auto_1624360 ) ) ( not ( = ?auto_1624358 ?auto_1624362 ) ) ( not ( = ?auto_1624358 ?auto_1624363 ) ) ( not ( = ?auto_1624358 ?auto_1624364 ) ) ( not ( = ?auto_1624358 ?auto_1624365 ) ) ( not ( = ?auto_1624358 ?auto_1624366 ) ) ( not ( = ?auto_1624355 ?auto_1624359 ) ) ( not ( = ?auto_1624355 ?auto_1624361 ) ) ( not ( = ?auto_1624355 ?auto_1624360 ) ) ( not ( = ?auto_1624355 ?auto_1624362 ) ) ( not ( = ?auto_1624355 ?auto_1624363 ) ) ( not ( = ?auto_1624355 ?auto_1624364 ) ) ( not ( = ?auto_1624355 ?auto_1624365 ) ) ( not ( = ?auto_1624355 ?auto_1624366 ) ) ( not ( = ?auto_1624359 ?auto_1624361 ) ) ( not ( = ?auto_1624359 ?auto_1624360 ) ) ( not ( = ?auto_1624359 ?auto_1624362 ) ) ( not ( = ?auto_1624359 ?auto_1624363 ) ) ( not ( = ?auto_1624359 ?auto_1624364 ) ) ( not ( = ?auto_1624359 ?auto_1624365 ) ) ( not ( = ?auto_1624359 ?auto_1624366 ) ) ( not ( = ?auto_1624361 ?auto_1624360 ) ) ( not ( = ?auto_1624361 ?auto_1624362 ) ) ( not ( = ?auto_1624361 ?auto_1624363 ) ) ( not ( = ?auto_1624361 ?auto_1624364 ) ) ( not ( = ?auto_1624361 ?auto_1624365 ) ) ( not ( = ?auto_1624361 ?auto_1624366 ) ) ( not ( = ?auto_1624360 ?auto_1624362 ) ) ( not ( = ?auto_1624360 ?auto_1624363 ) ) ( not ( = ?auto_1624360 ?auto_1624364 ) ) ( not ( = ?auto_1624360 ?auto_1624365 ) ) ( not ( = ?auto_1624360 ?auto_1624366 ) ) ( not ( = ?auto_1624362 ?auto_1624363 ) ) ( not ( = ?auto_1624362 ?auto_1624364 ) ) ( not ( = ?auto_1624362 ?auto_1624365 ) ) ( not ( = ?auto_1624362 ?auto_1624366 ) ) ( not ( = ?auto_1624363 ?auto_1624364 ) ) ( not ( = ?auto_1624363 ?auto_1624365 ) ) ( not ( = ?auto_1624363 ?auto_1624366 ) ) ( not ( = ?auto_1624364 ?auto_1624365 ) ) ( not ( = ?auto_1624364 ?auto_1624366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1624365 ?auto_1624366 )
      ( MAKE-11CRATE-VERIFY ?auto_1624356 ?auto_1624357 ?auto_1624358 ?auto_1624355 ?auto_1624359 ?auto_1624361 ?auto_1624360 ?auto_1624362 ?auto_1624363 ?auto_1624364 ?auto_1624365 ?auto_1624366 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624465 - SURFACE
      ?auto_1624466 - SURFACE
      ?auto_1624467 - SURFACE
      ?auto_1624464 - SURFACE
      ?auto_1624468 - SURFACE
      ?auto_1624470 - SURFACE
      ?auto_1624469 - SURFACE
      ?auto_1624471 - SURFACE
      ?auto_1624472 - SURFACE
      ?auto_1624473 - SURFACE
      ?auto_1624474 - SURFACE
      ?auto_1624475 - SURFACE
    )
    :vars
    (
      ?auto_1624476 - HOIST
      ?auto_1624478 - PLACE
      ?auto_1624477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624476 ?auto_1624478 ) ( SURFACE-AT ?auto_1624474 ?auto_1624478 ) ( CLEAR ?auto_1624474 ) ( IS-CRATE ?auto_1624475 ) ( not ( = ?auto_1624474 ?auto_1624475 ) ) ( TRUCK-AT ?auto_1624477 ?auto_1624478 ) ( AVAILABLE ?auto_1624476 ) ( IN ?auto_1624475 ?auto_1624477 ) ( ON ?auto_1624474 ?auto_1624473 ) ( not ( = ?auto_1624473 ?auto_1624474 ) ) ( not ( = ?auto_1624473 ?auto_1624475 ) ) ( ON ?auto_1624466 ?auto_1624465 ) ( ON ?auto_1624467 ?auto_1624466 ) ( ON ?auto_1624464 ?auto_1624467 ) ( ON ?auto_1624468 ?auto_1624464 ) ( ON ?auto_1624470 ?auto_1624468 ) ( ON ?auto_1624469 ?auto_1624470 ) ( ON ?auto_1624471 ?auto_1624469 ) ( ON ?auto_1624472 ?auto_1624471 ) ( ON ?auto_1624473 ?auto_1624472 ) ( not ( = ?auto_1624465 ?auto_1624466 ) ) ( not ( = ?auto_1624465 ?auto_1624467 ) ) ( not ( = ?auto_1624465 ?auto_1624464 ) ) ( not ( = ?auto_1624465 ?auto_1624468 ) ) ( not ( = ?auto_1624465 ?auto_1624470 ) ) ( not ( = ?auto_1624465 ?auto_1624469 ) ) ( not ( = ?auto_1624465 ?auto_1624471 ) ) ( not ( = ?auto_1624465 ?auto_1624472 ) ) ( not ( = ?auto_1624465 ?auto_1624473 ) ) ( not ( = ?auto_1624465 ?auto_1624474 ) ) ( not ( = ?auto_1624465 ?auto_1624475 ) ) ( not ( = ?auto_1624466 ?auto_1624467 ) ) ( not ( = ?auto_1624466 ?auto_1624464 ) ) ( not ( = ?auto_1624466 ?auto_1624468 ) ) ( not ( = ?auto_1624466 ?auto_1624470 ) ) ( not ( = ?auto_1624466 ?auto_1624469 ) ) ( not ( = ?auto_1624466 ?auto_1624471 ) ) ( not ( = ?auto_1624466 ?auto_1624472 ) ) ( not ( = ?auto_1624466 ?auto_1624473 ) ) ( not ( = ?auto_1624466 ?auto_1624474 ) ) ( not ( = ?auto_1624466 ?auto_1624475 ) ) ( not ( = ?auto_1624467 ?auto_1624464 ) ) ( not ( = ?auto_1624467 ?auto_1624468 ) ) ( not ( = ?auto_1624467 ?auto_1624470 ) ) ( not ( = ?auto_1624467 ?auto_1624469 ) ) ( not ( = ?auto_1624467 ?auto_1624471 ) ) ( not ( = ?auto_1624467 ?auto_1624472 ) ) ( not ( = ?auto_1624467 ?auto_1624473 ) ) ( not ( = ?auto_1624467 ?auto_1624474 ) ) ( not ( = ?auto_1624467 ?auto_1624475 ) ) ( not ( = ?auto_1624464 ?auto_1624468 ) ) ( not ( = ?auto_1624464 ?auto_1624470 ) ) ( not ( = ?auto_1624464 ?auto_1624469 ) ) ( not ( = ?auto_1624464 ?auto_1624471 ) ) ( not ( = ?auto_1624464 ?auto_1624472 ) ) ( not ( = ?auto_1624464 ?auto_1624473 ) ) ( not ( = ?auto_1624464 ?auto_1624474 ) ) ( not ( = ?auto_1624464 ?auto_1624475 ) ) ( not ( = ?auto_1624468 ?auto_1624470 ) ) ( not ( = ?auto_1624468 ?auto_1624469 ) ) ( not ( = ?auto_1624468 ?auto_1624471 ) ) ( not ( = ?auto_1624468 ?auto_1624472 ) ) ( not ( = ?auto_1624468 ?auto_1624473 ) ) ( not ( = ?auto_1624468 ?auto_1624474 ) ) ( not ( = ?auto_1624468 ?auto_1624475 ) ) ( not ( = ?auto_1624470 ?auto_1624469 ) ) ( not ( = ?auto_1624470 ?auto_1624471 ) ) ( not ( = ?auto_1624470 ?auto_1624472 ) ) ( not ( = ?auto_1624470 ?auto_1624473 ) ) ( not ( = ?auto_1624470 ?auto_1624474 ) ) ( not ( = ?auto_1624470 ?auto_1624475 ) ) ( not ( = ?auto_1624469 ?auto_1624471 ) ) ( not ( = ?auto_1624469 ?auto_1624472 ) ) ( not ( = ?auto_1624469 ?auto_1624473 ) ) ( not ( = ?auto_1624469 ?auto_1624474 ) ) ( not ( = ?auto_1624469 ?auto_1624475 ) ) ( not ( = ?auto_1624471 ?auto_1624472 ) ) ( not ( = ?auto_1624471 ?auto_1624473 ) ) ( not ( = ?auto_1624471 ?auto_1624474 ) ) ( not ( = ?auto_1624471 ?auto_1624475 ) ) ( not ( = ?auto_1624472 ?auto_1624473 ) ) ( not ( = ?auto_1624472 ?auto_1624474 ) ) ( not ( = ?auto_1624472 ?auto_1624475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624473 ?auto_1624474 ?auto_1624475 )
      ( MAKE-11CRATE-VERIFY ?auto_1624465 ?auto_1624466 ?auto_1624467 ?auto_1624464 ?auto_1624468 ?auto_1624470 ?auto_1624469 ?auto_1624471 ?auto_1624472 ?auto_1624473 ?auto_1624474 ?auto_1624475 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624586 - SURFACE
      ?auto_1624587 - SURFACE
      ?auto_1624588 - SURFACE
      ?auto_1624585 - SURFACE
      ?auto_1624589 - SURFACE
      ?auto_1624591 - SURFACE
      ?auto_1624590 - SURFACE
      ?auto_1624592 - SURFACE
      ?auto_1624593 - SURFACE
      ?auto_1624594 - SURFACE
      ?auto_1624595 - SURFACE
      ?auto_1624596 - SURFACE
    )
    :vars
    (
      ?auto_1624598 - HOIST
      ?auto_1624600 - PLACE
      ?auto_1624599 - TRUCK
      ?auto_1624597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624598 ?auto_1624600 ) ( SURFACE-AT ?auto_1624595 ?auto_1624600 ) ( CLEAR ?auto_1624595 ) ( IS-CRATE ?auto_1624596 ) ( not ( = ?auto_1624595 ?auto_1624596 ) ) ( AVAILABLE ?auto_1624598 ) ( IN ?auto_1624596 ?auto_1624599 ) ( ON ?auto_1624595 ?auto_1624594 ) ( not ( = ?auto_1624594 ?auto_1624595 ) ) ( not ( = ?auto_1624594 ?auto_1624596 ) ) ( TRUCK-AT ?auto_1624599 ?auto_1624597 ) ( not ( = ?auto_1624597 ?auto_1624600 ) ) ( ON ?auto_1624587 ?auto_1624586 ) ( ON ?auto_1624588 ?auto_1624587 ) ( ON ?auto_1624585 ?auto_1624588 ) ( ON ?auto_1624589 ?auto_1624585 ) ( ON ?auto_1624591 ?auto_1624589 ) ( ON ?auto_1624590 ?auto_1624591 ) ( ON ?auto_1624592 ?auto_1624590 ) ( ON ?auto_1624593 ?auto_1624592 ) ( ON ?auto_1624594 ?auto_1624593 ) ( not ( = ?auto_1624586 ?auto_1624587 ) ) ( not ( = ?auto_1624586 ?auto_1624588 ) ) ( not ( = ?auto_1624586 ?auto_1624585 ) ) ( not ( = ?auto_1624586 ?auto_1624589 ) ) ( not ( = ?auto_1624586 ?auto_1624591 ) ) ( not ( = ?auto_1624586 ?auto_1624590 ) ) ( not ( = ?auto_1624586 ?auto_1624592 ) ) ( not ( = ?auto_1624586 ?auto_1624593 ) ) ( not ( = ?auto_1624586 ?auto_1624594 ) ) ( not ( = ?auto_1624586 ?auto_1624595 ) ) ( not ( = ?auto_1624586 ?auto_1624596 ) ) ( not ( = ?auto_1624587 ?auto_1624588 ) ) ( not ( = ?auto_1624587 ?auto_1624585 ) ) ( not ( = ?auto_1624587 ?auto_1624589 ) ) ( not ( = ?auto_1624587 ?auto_1624591 ) ) ( not ( = ?auto_1624587 ?auto_1624590 ) ) ( not ( = ?auto_1624587 ?auto_1624592 ) ) ( not ( = ?auto_1624587 ?auto_1624593 ) ) ( not ( = ?auto_1624587 ?auto_1624594 ) ) ( not ( = ?auto_1624587 ?auto_1624595 ) ) ( not ( = ?auto_1624587 ?auto_1624596 ) ) ( not ( = ?auto_1624588 ?auto_1624585 ) ) ( not ( = ?auto_1624588 ?auto_1624589 ) ) ( not ( = ?auto_1624588 ?auto_1624591 ) ) ( not ( = ?auto_1624588 ?auto_1624590 ) ) ( not ( = ?auto_1624588 ?auto_1624592 ) ) ( not ( = ?auto_1624588 ?auto_1624593 ) ) ( not ( = ?auto_1624588 ?auto_1624594 ) ) ( not ( = ?auto_1624588 ?auto_1624595 ) ) ( not ( = ?auto_1624588 ?auto_1624596 ) ) ( not ( = ?auto_1624585 ?auto_1624589 ) ) ( not ( = ?auto_1624585 ?auto_1624591 ) ) ( not ( = ?auto_1624585 ?auto_1624590 ) ) ( not ( = ?auto_1624585 ?auto_1624592 ) ) ( not ( = ?auto_1624585 ?auto_1624593 ) ) ( not ( = ?auto_1624585 ?auto_1624594 ) ) ( not ( = ?auto_1624585 ?auto_1624595 ) ) ( not ( = ?auto_1624585 ?auto_1624596 ) ) ( not ( = ?auto_1624589 ?auto_1624591 ) ) ( not ( = ?auto_1624589 ?auto_1624590 ) ) ( not ( = ?auto_1624589 ?auto_1624592 ) ) ( not ( = ?auto_1624589 ?auto_1624593 ) ) ( not ( = ?auto_1624589 ?auto_1624594 ) ) ( not ( = ?auto_1624589 ?auto_1624595 ) ) ( not ( = ?auto_1624589 ?auto_1624596 ) ) ( not ( = ?auto_1624591 ?auto_1624590 ) ) ( not ( = ?auto_1624591 ?auto_1624592 ) ) ( not ( = ?auto_1624591 ?auto_1624593 ) ) ( not ( = ?auto_1624591 ?auto_1624594 ) ) ( not ( = ?auto_1624591 ?auto_1624595 ) ) ( not ( = ?auto_1624591 ?auto_1624596 ) ) ( not ( = ?auto_1624590 ?auto_1624592 ) ) ( not ( = ?auto_1624590 ?auto_1624593 ) ) ( not ( = ?auto_1624590 ?auto_1624594 ) ) ( not ( = ?auto_1624590 ?auto_1624595 ) ) ( not ( = ?auto_1624590 ?auto_1624596 ) ) ( not ( = ?auto_1624592 ?auto_1624593 ) ) ( not ( = ?auto_1624592 ?auto_1624594 ) ) ( not ( = ?auto_1624592 ?auto_1624595 ) ) ( not ( = ?auto_1624592 ?auto_1624596 ) ) ( not ( = ?auto_1624593 ?auto_1624594 ) ) ( not ( = ?auto_1624593 ?auto_1624595 ) ) ( not ( = ?auto_1624593 ?auto_1624596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624594 ?auto_1624595 ?auto_1624596 )
      ( MAKE-11CRATE-VERIFY ?auto_1624586 ?auto_1624587 ?auto_1624588 ?auto_1624585 ?auto_1624589 ?auto_1624591 ?auto_1624590 ?auto_1624592 ?auto_1624593 ?auto_1624594 ?auto_1624595 ?auto_1624596 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624718 - SURFACE
      ?auto_1624719 - SURFACE
      ?auto_1624720 - SURFACE
      ?auto_1624717 - SURFACE
      ?auto_1624721 - SURFACE
      ?auto_1624723 - SURFACE
      ?auto_1624722 - SURFACE
      ?auto_1624724 - SURFACE
      ?auto_1624725 - SURFACE
      ?auto_1624726 - SURFACE
      ?auto_1624727 - SURFACE
      ?auto_1624728 - SURFACE
    )
    :vars
    (
      ?auto_1624731 - HOIST
      ?auto_1624732 - PLACE
      ?auto_1624729 - TRUCK
      ?auto_1624733 - PLACE
      ?auto_1624730 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624731 ?auto_1624732 ) ( SURFACE-AT ?auto_1624727 ?auto_1624732 ) ( CLEAR ?auto_1624727 ) ( IS-CRATE ?auto_1624728 ) ( not ( = ?auto_1624727 ?auto_1624728 ) ) ( AVAILABLE ?auto_1624731 ) ( ON ?auto_1624727 ?auto_1624726 ) ( not ( = ?auto_1624726 ?auto_1624727 ) ) ( not ( = ?auto_1624726 ?auto_1624728 ) ) ( TRUCK-AT ?auto_1624729 ?auto_1624733 ) ( not ( = ?auto_1624733 ?auto_1624732 ) ) ( HOIST-AT ?auto_1624730 ?auto_1624733 ) ( LIFTING ?auto_1624730 ?auto_1624728 ) ( not ( = ?auto_1624731 ?auto_1624730 ) ) ( ON ?auto_1624719 ?auto_1624718 ) ( ON ?auto_1624720 ?auto_1624719 ) ( ON ?auto_1624717 ?auto_1624720 ) ( ON ?auto_1624721 ?auto_1624717 ) ( ON ?auto_1624723 ?auto_1624721 ) ( ON ?auto_1624722 ?auto_1624723 ) ( ON ?auto_1624724 ?auto_1624722 ) ( ON ?auto_1624725 ?auto_1624724 ) ( ON ?auto_1624726 ?auto_1624725 ) ( not ( = ?auto_1624718 ?auto_1624719 ) ) ( not ( = ?auto_1624718 ?auto_1624720 ) ) ( not ( = ?auto_1624718 ?auto_1624717 ) ) ( not ( = ?auto_1624718 ?auto_1624721 ) ) ( not ( = ?auto_1624718 ?auto_1624723 ) ) ( not ( = ?auto_1624718 ?auto_1624722 ) ) ( not ( = ?auto_1624718 ?auto_1624724 ) ) ( not ( = ?auto_1624718 ?auto_1624725 ) ) ( not ( = ?auto_1624718 ?auto_1624726 ) ) ( not ( = ?auto_1624718 ?auto_1624727 ) ) ( not ( = ?auto_1624718 ?auto_1624728 ) ) ( not ( = ?auto_1624719 ?auto_1624720 ) ) ( not ( = ?auto_1624719 ?auto_1624717 ) ) ( not ( = ?auto_1624719 ?auto_1624721 ) ) ( not ( = ?auto_1624719 ?auto_1624723 ) ) ( not ( = ?auto_1624719 ?auto_1624722 ) ) ( not ( = ?auto_1624719 ?auto_1624724 ) ) ( not ( = ?auto_1624719 ?auto_1624725 ) ) ( not ( = ?auto_1624719 ?auto_1624726 ) ) ( not ( = ?auto_1624719 ?auto_1624727 ) ) ( not ( = ?auto_1624719 ?auto_1624728 ) ) ( not ( = ?auto_1624720 ?auto_1624717 ) ) ( not ( = ?auto_1624720 ?auto_1624721 ) ) ( not ( = ?auto_1624720 ?auto_1624723 ) ) ( not ( = ?auto_1624720 ?auto_1624722 ) ) ( not ( = ?auto_1624720 ?auto_1624724 ) ) ( not ( = ?auto_1624720 ?auto_1624725 ) ) ( not ( = ?auto_1624720 ?auto_1624726 ) ) ( not ( = ?auto_1624720 ?auto_1624727 ) ) ( not ( = ?auto_1624720 ?auto_1624728 ) ) ( not ( = ?auto_1624717 ?auto_1624721 ) ) ( not ( = ?auto_1624717 ?auto_1624723 ) ) ( not ( = ?auto_1624717 ?auto_1624722 ) ) ( not ( = ?auto_1624717 ?auto_1624724 ) ) ( not ( = ?auto_1624717 ?auto_1624725 ) ) ( not ( = ?auto_1624717 ?auto_1624726 ) ) ( not ( = ?auto_1624717 ?auto_1624727 ) ) ( not ( = ?auto_1624717 ?auto_1624728 ) ) ( not ( = ?auto_1624721 ?auto_1624723 ) ) ( not ( = ?auto_1624721 ?auto_1624722 ) ) ( not ( = ?auto_1624721 ?auto_1624724 ) ) ( not ( = ?auto_1624721 ?auto_1624725 ) ) ( not ( = ?auto_1624721 ?auto_1624726 ) ) ( not ( = ?auto_1624721 ?auto_1624727 ) ) ( not ( = ?auto_1624721 ?auto_1624728 ) ) ( not ( = ?auto_1624723 ?auto_1624722 ) ) ( not ( = ?auto_1624723 ?auto_1624724 ) ) ( not ( = ?auto_1624723 ?auto_1624725 ) ) ( not ( = ?auto_1624723 ?auto_1624726 ) ) ( not ( = ?auto_1624723 ?auto_1624727 ) ) ( not ( = ?auto_1624723 ?auto_1624728 ) ) ( not ( = ?auto_1624722 ?auto_1624724 ) ) ( not ( = ?auto_1624722 ?auto_1624725 ) ) ( not ( = ?auto_1624722 ?auto_1624726 ) ) ( not ( = ?auto_1624722 ?auto_1624727 ) ) ( not ( = ?auto_1624722 ?auto_1624728 ) ) ( not ( = ?auto_1624724 ?auto_1624725 ) ) ( not ( = ?auto_1624724 ?auto_1624726 ) ) ( not ( = ?auto_1624724 ?auto_1624727 ) ) ( not ( = ?auto_1624724 ?auto_1624728 ) ) ( not ( = ?auto_1624725 ?auto_1624726 ) ) ( not ( = ?auto_1624725 ?auto_1624727 ) ) ( not ( = ?auto_1624725 ?auto_1624728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624726 ?auto_1624727 ?auto_1624728 )
      ( MAKE-11CRATE-VERIFY ?auto_1624718 ?auto_1624719 ?auto_1624720 ?auto_1624717 ?auto_1624721 ?auto_1624723 ?auto_1624722 ?auto_1624724 ?auto_1624725 ?auto_1624726 ?auto_1624727 ?auto_1624728 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624861 - SURFACE
      ?auto_1624862 - SURFACE
      ?auto_1624863 - SURFACE
      ?auto_1624860 - SURFACE
      ?auto_1624864 - SURFACE
      ?auto_1624866 - SURFACE
      ?auto_1624865 - SURFACE
      ?auto_1624867 - SURFACE
      ?auto_1624868 - SURFACE
      ?auto_1624869 - SURFACE
      ?auto_1624870 - SURFACE
      ?auto_1624871 - SURFACE
    )
    :vars
    (
      ?auto_1624874 - HOIST
      ?auto_1624877 - PLACE
      ?auto_1624875 - TRUCK
      ?auto_1624872 - PLACE
      ?auto_1624876 - HOIST
      ?auto_1624873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624874 ?auto_1624877 ) ( SURFACE-AT ?auto_1624870 ?auto_1624877 ) ( CLEAR ?auto_1624870 ) ( IS-CRATE ?auto_1624871 ) ( not ( = ?auto_1624870 ?auto_1624871 ) ) ( AVAILABLE ?auto_1624874 ) ( ON ?auto_1624870 ?auto_1624869 ) ( not ( = ?auto_1624869 ?auto_1624870 ) ) ( not ( = ?auto_1624869 ?auto_1624871 ) ) ( TRUCK-AT ?auto_1624875 ?auto_1624872 ) ( not ( = ?auto_1624872 ?auto_1624877 ) ) ( HOIST-AT ?auto_1624876 ?auto_1624872 ) ( not ( = ?auto_1624874 ?auto_1624876 ) ) ( AVAILABLE ?auto_1624876 ) ( SURFACE-AT ?auto_1624871 ?auto_1624872 ) ( ON ?auto_1624871 ?auto_1624873 ) ( CLEAR ?auto_1624871 ) ( not ( = ?auto_1624870 ?auto_1624873 ) ) ( not ( = ?auto_1624871 ?auto_1624873 ) ) ( not ( = ?auto_1624869 ?auto_1624873 ) ) ( ON ?auto_1624862 ?auto_1624861 ) ( ON ?auto_1624863 ?auto_1624862 ) ( ON ?auto_1624860 ?auto_1624863 ) ( ON ?auto_1624864 ?auto_1624860 ) ( ON ?auto_1624866 ?auto_1624864 ) ( ON ?auto_1624865 ?auto_1624866 ) ( ON ?auto_1624867 ?auto_1624865 ) ( ON ?auto_1624868 ?auto_1624867 ) ( ON ?auto_1624869 ?auto_1624868 ) ( not ( = ?auto_1624861 ?auto_1624862 ) ) ( not ( = ?auto_1624861 ?auto_1624863 ) ) ( not ( = ?auto_1624861 ?auto_1624860 ) ) ( not ( = ?auto_1624861 ?auto_1624864 ) ) ( not ( = ?auto_1624861 ?auto_1624866 ) ) ( not ( = ?auto_1624861 ?auto_1624865 ) ) ( not ( = ?auto_1624861 ?auto_1624867 ) ) ( not ( = ?auto_1624861 ?auto_1624868 ) ) ( not ( = ?auto_1624861 ?auto_1624869 ) ) ( not ( = ?auto_1624861 ?auto_1624870 ) ) ( not ( = ?auto_1624861 ?auto_1624871 ) ) ( not ( = ?auto_1624861 ?auto_1624873 ) ) ( not ( = ?auto_1624862 ?auto_1624863 ) ) ( not ( = ?auto_1624862 ?auto_1624860 ) ) ( not ( = ?auto_1624862 ?auto_1624864 ) ) ( not ( = ?auto_1624862 ?auto_1624866 ) ) ( not ( = ?auto_1624862 ?auto_1624865 ) ) ( not ( = ?auto_1624862 ?auto_1624867 ) ) ( not ( = ?auto_1624862 ?auto_1624868 ) ) ( not ( = ?auto_1624862 ?auto_1624869 ) ) ( not ( = ?auto_1624862 ?auto_1624870 ) ) ( not ( = ?auto_1624862 ?auto_1624871 ) ) ( not ( = ?auto_1624862 ?auto_1624873 ) ) ( not ( = ?auto_1624863 ?auto_1624860 ) ) ( not ( = ?auto_1624863 ?auto_1624864 ) ) ( not ( = ?auto_1624863 ?auto_1624866 ) ) ( not ( = ?auto_1624863 ?auto_1624865 ) ) ( not ( = ?auto_1624863 ?auto_1624867 ) ) ( not ( = ?auto_1624863 ?auto_1624868 ) ) ( not ( = ?auto_1624863 ?auto_1624869 ) ) ( not ( = ?auto_1624863 ?auto_1624870 ) ) ( not ( = ?auto_1624863 ?auto_1624871 ) ) ( not ( = ?auto_1624863 ?auto_1624873 ) ) ( not ( = ?auto_1624860 ?auto_1624864 ) ) ( not ( = ?auto_1624860 ?auto_1624866 ) ) ( not ( = ?auto_1624860 ?auto_1624865 ) ) ( not ( = ?auto_1624860 ?auto_1624867 ) ) ( not ( = ?auto_1624860 ?auto_1624868 ) ) ( not ( = ?auto_1624860 ?auto_1624869 ) ) ( not ( = ?auto_1624860 ?auto_1624870 ) ) ( not ( = ?auto_1624860 ?auto_1624871 ) ) ( not ( = ?auto_1624860 ?auto_1624873 ) ) ( not ( = ?auto_1624864 ?auto_1624866 ) ) ( not ( = ?auto_1624864 ?auto_1624865 ) ) ( not ( = ?auto_1624864 ?auto_1624867 ) ) ( not ( = ?auto_1624864 ?auto_1624868 ) ) ( not ( = ?auto_1624864 ?auto_1624869 ) ) ( not ( = ?auto_1624864 ?auto_1624870 ) ) ( not ( = ?auto_1624864 ?auto_1624871 ) ) ( not ( = ?auto_1624864 ?auto_1624873 ) ) ( not ( = ?auto_1624866 ?auto_1624865 ) ) ( not ( = ?auto_1624866 ?auto_1624867 ) ) ( not ( = ?auto_1624866 ?auto_1624868 ) ) ( not ( = ?auto_1624866 ?auto_1624869 ) ) ( not ( = ?auto_1624866 ?auto_1624870 ) ) ( not ( = ?auto_1624866 ?auto_1624871 ) ) ( not ( = ?auto_1624866 ?auto_1624873 ) ) ( not ( = ?auto_1624865 ?auto_1624867 ) ) ( not ( = ?auto_1624865 ?auto_1624868 ) ) ( not ( = ?auto_1624865 ?auto_1624869 ) ) ( not ( = ?auto_1624865 ?auto_1624870 ) ) ( not ( = ?auto_1624865 ?auto_1624871 ) ) ( not ( = ?auto_1624865 ?auto_1624873 ) ) ( not ( = ?auto_1624867 ?auto_1624868 ) ) ( not ( = ?auto_1624867 ?auto_1624869 ) ) ( not ( = ?auto_1624867 ?auto_1624870 ) ) ( not ( = ?auto_1624867 ?auto_1624871 ) ) ( not ( = ?auto_1624867 ?auto_1624873 ) ) ( not ( = ?auto_1624868 ?auto_1624869 ) ) ( not ( = ?auto_1624868 ?auto_1624870 ) ) ( not ( = ?auto_1624868 ?auto_1624871 ) ) ( not ( = ?auto_1624868 ?auto_1624873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624869 ?auto_1624870 ?auto_1624871 )
      ( MAKE-11CRATE-VERIFY ?auto_1624861 ?auto_1624862 ?auto_1624863 ?auto_1624860 ?auto_1624864 ?auto_1624866 ?auto_1624865 ?auto_1624867 ?auto_1624868 ?auto_1624869 ?auto_1624870 ?auto_1624871 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625005 - SURFACE
      ?auto_1625006 - SURFACE
      ?auto_1625007 - SURFACE
      ?auto_1625004 - SURFACE
      ?auto_1625008 - SURFACE
      ?auto_1625010 - SURFACE
      ?auto_1625009 - SURFACE
      ?auto_1625011 - SURFACE
      ?auto_1625012 - SURFACE
      ?auto_1625013 - SURFACE
      ?auto_1625014 - SURFACE
      ?auto_1625015 - SURFACE
    )
    :vars
    (
      ?auto_1625016 - HOIST
      ?auto_1625018 - PLACE
      ?auto_1625019 - PLACE
      ?auto_1625021 - HOIST
      ?auto_1625017 - SURFACE
      ?auto_1625020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625016 ?auto_1625018 ) ( SURFACE-AT ?auto_1625014 ?auto_1625018 ) ( CLEAR ?auto_1625014 ) ( IS-CRATE ?auto_1625015 ) ( not ( = ?auto_1625014 ?auto_1625015 ) ) ( AVAILABLE ?auto_1625016 ) ( ON ?auto_1625014 ?auto_1625013 ) ( not ( = ?auto_1625013 ?auto_1625014 ) ) ( not ( = ?auto_1625013 ?auto_1625015 ) ) ( not ( = ?auto_1625019 ?auto_1625018 ) ) ( HOIST-AT ?auto_1625021 ?auto_1625019 ) ( not ( = ?auto_1625016 ?auto_1625021 ) ) ( AVAILABLE ?auto_1625021 ) ( SURFACE-AT ?auto_1625015 ?auto_1625019 ) ( ON ?auto_1625015 ?auto_1625017 ) ( CLEAR ?auto_1625015 ) ( not ( = ?auto_1625014 ?auto_1625017 ) ) ( not ( = ?auto_1625015 ?auto_1625017 ) ) ( not ( = ?auto_1625013 ?auto_1625017 ) ) ( TRUCK-AT ?auto_1625020 ?auto_1625018 ) ( ON ?auto_1625006 ?auto_1625005 ) ( ON ?auto_1625007 ?auto_1625006 ) ( ON ?auto_1625004 ?auto_1625007 ) ( ON ?auto_1625008 ?auto_1625004 ) ( ON ?auto_1625010 ?auto_1625008 ) ( ON ?auto_1625009 ?auto_1625010 ) ( ON ?auto_1625011 ?auto_1625009 ) ( ON ?auto_1625012 ?auto_1625011 ) ( ON ?auto_1625013 ?auto_1625012 ) ( not ( = ?auto_1625005 ?auto_1625006 ) ) ( not ( = ?auto_1625005 ?auto_1625007 ) ) ( not ( = ?auto_1625005 ?auto_1625004 ) ) ( not ( = ?auto_1625005 ?auto_1625008 ) ) ( not ( = ?auto_1625005 ?auto_1625010 ) ) ( not ( = ?auto_1625005 ?auto_1625009 ) ) ( not ( = ?auto_1625005 ?auto_1625011 ) ) ( not ( = ?auto_1625005 ?auto_1625012 ) ) ( not ( = ?auto_1625005 ?auto_1625013 ) ) ( not ( = ?auto_1625005 ?auto_1625014 ) ) ( not ( = ?auto_1625005 ?auto_1625015 ) ) ( not ( = ?auto_1625005 ?auto_1625017 ) ) ( not ( = ?auto_1625006 ?auto_1625007 ) ) ( not ( = ?auto_1625006 ?auto_1625004 ) ) ( not ( = ?auto_1625006 ?auto_1625008 ) ) ( not ( = ?auto_1625006 ?auto_1625010 ) ) ( not ( = ?auto_1625006 ?auto_1625009 ) ) ( not ( = ?auto_1625006 ?auto_1625011 ) ) ( not ( = ?auto_1625006 ?auto_1625012 ) ) ( not ( = ?auto_1625006 ?auto_1625013 ) ) ( not ( = ?auto_1625006 ?auto_1625014 ) ) ( not ( = ?auto_1625006 ?auto_1625015 ) ) ( not ( = ?auto_1625006 ?auto_1625017 ) ) ( not ( = ?auto_1625007 ?auto_1625004 ) ) ( not ( = ?auto_1625007 ?auto_1625008 ) ) ( not ( = ?auto_1625007 ?auto_1625010 ) ) ( not ( = ?auto_1625007 ?auto_1625009 ) ) ( not ( = ?auto_1625007 ?auto_1625011 ) ) ( not ( = ?auto_1625007 ?auto_1625012 ) ) ( not ( = ?auto_1625007 ?auto_1625013 ) ) ( not ( = ?auto_1625007 ?auto_1625014 ) ) ( not ( = ?auto_1625007 ?auto_1625015 ) ) ( not ( = ?auto_1625007 ?auto_1625017 ) ) ( not ( = ?auto_1625004 ?auto_1625008 ) ) ( not ( = ?auto_1625004 ?auto_1625010 ) ) ( not ( = ?auto_1625004 ?auto_1625009 ) ) ( not ( = ?auto_1625004 ?auto_1625011 ) ) ( not ( = ?auto_1625004 ?auto_1625012 ) ) ( not ( = ?auto_1625004 ?auto_1625013 ) ) ( not ( = ?auto_1625004 ?auto_1625014 ) ) ( not ( = ?auto_1625004 ?auto_1625015 ) ) ( not ( = ?auto_1625004 ?auto_1625017 ) ) ( not ( = ?auto_1625008 ?auto_1625010 ) ) ( not ( = ?auto_1625008 ?auto_1625009 ) ) ( not ( = ?auto_1625008 ?auto_1625011 ) ) ( not ( = ?auto_1625008 ?auto_1625012 ) ) ( not ( = ?auto_1625008 ?auto_1625013 ) ) ( not ( = ?auto_1625008 ?auto_1625014 ) ) ( not ( = ?auto_1625008 ?auto_1625015 ) ) ( not ( = ?auto_1625008 ?auto_1625017 ) ) ( not ( = ?auto_1625010 ?auto_1625009 ) ) ( not ( = ?auto_1625010 ?auto_1625011 ) ) ( not ( = ?auto_1625010 ?auto_1625012 ) ) ( not ( = ?auto_1625010 ?auto_1625013 ) ) ( not ( = ?auto_1625010 ?auto_1625014 ) ) ( not ( = ?auto_1625010 ?auto_1625015 ) ) ( not ( = ?auto_1625010 ?auto_1625017 ) ) ( not ( = ?auto_1625009 ?auto_1625011 ) ) ( not ( = ?auto_1625009 ?auto_1625012 ) ) ( not ( = ?auto_1625009 ?auto_1625013 ) ) ( not ( = ?auto_1625009 ?auto_1625014 ) ) ( not ( = ?auto_1625009 ?auto_1625015 ) ) ( not ( = ?auto_1625009 ?auto_1625017 ) ) ( not ( = ?auto_1625011 ?auto_1625012 ) ) ( not ( = ?auto_1625011 ?auto_1625013 ) ) ( not ( = ?auto_1625011 ?auto_1625014 ) ) ( not ( = ?auto_1625011 ?auto_1625015 ) ) ( not ( = ?auto_1625011 ?auto_1625017 ) ) ( not ( = ?auto_1625012 ?auto_1625013 ) ) ( not ( = ?auto_1625012 ?auto_1625014 ) ) ( not ( = ?auto_1625012 ?auto_1625015 ) ) ( not ( = ?auto_1625012 ?auto_1625017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625013 ?auto_1625014 ?auto_1625015 )
      ( MAKE-11CRATE-VERIFY ?auto_1625005 ?auto_1625006 ?auto_1625007 ?auto_1625004 ?auto_1625008 ?auto_1625010 ?auto_1625009 ?auto_1625011 ?auto_1625012 ?auto_1625013 ?auto_1625014 ?auto_1625015 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625149 - SURFACE
      ?auto_1625150 - SURFACE
      ?auto_1625151 - SURFACE
      ?auto_1625148 - SURFACE
      ?auto_1625152 - SURFACE
      ?auto_1625154 - SURFACE
      ?auto_1625153 - SURFACE
      ?auto_1625155 - SURFACE
      ?auto_1625156 - SURFACE
      ?auto_1625157 - SURFACE
      ?auto_1625158 - SURFACE
      ?auto_1625159 - SURFACE
    )
    :vars
    (
      ?auto_1625162 - HOIST
      ?auto_1625161 - PLACE
      ?auto_1625164 - PLACE
      ?auto_1625160 - HOIST
      ?auto_1625163 - SURFACE
      ?auto_1625165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625162 ?auto_1625161 ) ( IS-CRATE ?auto_1625159 ) ( not ( = ?auto_1625158 ?auto_1625159 ) ) ( not ( = ?auto_1625157 ?auto_1625158 ) ) ( not ( = ?auto_1625157 ?auto_1625159 ) ) ( not ( = ?auto_1625164 ?auto_1625161 ) ) ( HOIST-AT ?auto_1625160 ?auto_1625164 ) ( not ( = ?auto_1625162 ?auto_1625160 ) ) ( AVAILABLE ?auto_1625160 ) ( SURFACE-AT ?auto_1625159 ?auto_1625164 ) ( ON ?auto_1625159 ?auto_1625163 ) ( CLEAR ?auto_1625159 ) ( not ( = ?auto_1625158 ?auto_1625163 ) ) ( not ( = ?auto_1625159 ?auto_1625163 ) ) ( not ( = ?auto_1625157 ?auto_1625163 ) ) ( TRUCK-AT ?auto_1625165 ?auto_1625161 ) ( SURFACE-AT ?auto_1625157 ?auto_1625161 ) ( CLEAR ?auto_1625157 ) ( LIFTING ?auto_1625162 ?auto_1625158 ) ( IS-CRATE ?auto_1625158 ) ( ON ?auto_1625150 ?auto_1625149 ) ( ON ?auto_1625151 ?auto_1625150 ) ( ON ?auto_1625148 ?auto_1625151 ) ( ON ?auto_1625152 ?auto_1625148 ) ( ON ?auto_1625154 ?auto_1625152 ) ( ON ?auto_1625153 ?auto_1625154 ) ( ON ?auto_1625155 ?auto_1625153 ) ( ON ?auto_1625156 ?auto_1625155 ) ( ON ?auto_1625157 ?auto_1625156 ) ( not ( = ?auto_1625149 ?auto_1625150 ) ) ( not ( = ?auto_1625149 ?auto_1625151 ) ) ( not ( = ?auto_1625149 ?auto_1625148 ) ) ( not ( = ?auto_1625149 ?auto_1625152 ) ) ( not ( = ?auto_1625149 ?auto_1625154 ) ) ( not ( = ?auto_1625149 ?auto_1625153 ) ) ( not ( = ?auto_1625149 ?auto_1625155 ) ) ( not ( = ?auto_1625149 ?auto_1625156 ) ) ( not ( = ?auto_1625149 ?auto_1625157 ) ) ( not ( = ?auto_1625149 ?auto_1625158 ) ) ( not ( = ?auto_1625149 ?auto_1625159 ) ) ( not ( = ?auto_1625149 ?auto_1625163 ) ) ( not ( = ?auto_1625150 ?auto_1625151 ) ) ( not ( = ?auto_1625150 ?auto_1625148 ) ) ( not ( = ?auto_1625150 ?auto_1625152 ) ) ( not ( = ?auto_1625150 ?auto_1625154 ) ) ( not ( = ?auto_1625150 ?auto_1625153 ) ) ( not ( = ?auto_1625150 ?auto_1625155 ) ) ( not ( = ?auto_1625150 ?auto_1625156 ) ) ( not ( = ?auto_1625150 ?auto_1625157 ) ) ( not ( = ?auto_1625150 ?auto_1625158 ) ) ( not ( = ?auto_1625150 ?auto_1625159 ) ) ( not ( = ?auto_1625150 ?auto_1625163 ) ) ( not ( = ?auto_1625151 ?auto_1625148 ) ) ( not ( = ?auto_1625151 ?auto_1625152 ) ) ( not ( = ?auto_1625151 ?auto_1625154 ) ) ( not ( = ?auto_1625151 ?auto_1625153 ) ) ( not ( = ?auto_1625151 ?auto_1625155 ) ) ( not ( = ?auto_1625151 ?auto_1625156 ) ) ( not ( = ?auto_1625151 ?auto_1625157 ) ) ( not ( = ?auto_1625151 ?auto_1625158 ) ) ( not ( = ?auto_1625151 ?auto_1625159 ) ) ( not ( = ?auto_1625151 ?auto_1625163 ) ) ( not ( = ?auto_1625148 ?auto_1625152 ) ) ( not ( = ?auto_1625148 ?auto_1625154 ) ) ( not ( = ?auto_1625148 ?auto_1625153 ) ) ( not ( = ?auto_1625148 ?auto_1625155 ) ) ( not ( = ?auto_1625148 ?auto_1625156 ) ) ( not ( = ?auto_1625148 ?auto_1625157 ) ) ( not ( = ?auto_1625148 ?auto_1625158 ) ) ( not ( = ?auto_1625148 ?auto_1625159 ) ) ( not ( = ?auto_1625148 ?auto_1625163 ) ) ( not ( = ?auto_1625152 ?auto_1625154 ) ) ( not ( = ?auto_1625152 ?auto_1625153 ) ) ( not ( = ?auto_1625152 ?auto_1625155 ) ) ( not ( = ?auto_1625152 ?auto_1625156 ) ) ( not ( = ?auto_1625152 ?auto_1625157 ) ) ( not ( = ?auto_1625152 ?auto_1625158 ) ) ( not ( = ?auto_1625152 ?auto_1625159 ) ) ( not ( = ?auto_1625152 ?auto_1625163 ) ) ( not ( = ?auto_1625154 ?auto_1625153 ) ) ( not ( = ?auto_1625154 ?auto_1625155 ) ) ( not ( = ?auto_1625154 ?auto_1625156 ) ) ( not ( = ?auto_1625154 ?auto_1625157 ) ) ( not ( = ?auto_1625154 ?auto_1625158 ) ) ( not ( = ?auto_1625154 ?auto_1625159 ) ) ( not ( = ?auto_1625154 ?auto_1625163 ) ) ( not ( = ?auto_1625153 ?auto_1625155 ) ) ( not ( = ?auto_1625153 ?auto_1625156 ) ) ( not ( = ?auto_1625153 ?auto_1625157 ) ) ( not ( = ?auto_1625153 ?auto_1625158 ) ) ( not ( = ?auto_1625153 ?auto_1625159 ) ) ( not ( = ?auto_1625153 ?auto_1625163 ) ) ( not ( = ?auto_1625155 ?auto_1625156 ) ) ( not ( = ?auto_1625155 ?auto_1625157 ) ) ( not ( = ?auto_1625155 ?auto_1625158 ) ) ( not ( = ?auto_1625155 ?auto_1625159 ) ) ( not ( = ?auto_1625155 ?auto_1625163 ) ) ( not ( = ?auto_1625156 ?auto_1625157 ) ) ( not ( = ?auto_1625156 ?auto_1625158 ) ) ( not ( = ?auto_1625156 ?auto_1625159 ) ) ( not ( = ?auto_1625156 ?auto_1625163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625157 ?auto_1625158 ?auto_1625159 )
      ( MAKE-11CRATE-VERIFY ?auto_1625149 ?auto_1625150 ?auto_1625151 ?auto_1625148 ?auto_1625152 ?auto_1625154 ?auto_1625153 ?auto_1625155 ?auto_1625156 ?auto_1625157 ?auto_1625158 ?auto_1625159 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625293 - SURFACE
      ?auto_1625294 - SURFACE
      ?auto_1625295 - SURFACE
      ?auto_1625292 - SURFACE
      ?auto_1625296 - SURFACE
      ?auto_1625298 - SURFACE
      ?auto_1625297 - SURFACE
      ?auto_1625299 - SURFACE
      ?auto_1625300 - SURFACE
      ?auto_1625301 - SURFACE
      ?auto_1625302 - SURFACE
      ?auto_1625303 - SURFACE
    )
    :vars
    (
      ?auto_1625304 - HOIST
      ?auto_1625308 - PLACE
      ?auto_1625305 - PLACE
      ?auto_1625306 - HOIST
      ?auto_1625307 - SURFACE
      ?auto_1625309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625304 ?auto_1625308 ) ( IS-CRATE ?auto_1625303 ) ( not ( = ?auto_1625302 ?auto_1625303 ) ) ( not ( = ?auto_1625301 ?auto_1625302 ) ) ( not ( = ?auto_1625301 ?auto_1625303 ) ) ( not ( = ?auto_1625305 ?auto_1625308 ) ) ( HOIST-AT ?auto_1625306 ?auto_1625305 ) ( not ( = ?auto_1625304 ?auto_1625306 ) ) ( AVAILABLE ?auto_1625306 ) ( SURFACE-AT ?auto_1625303 ?auto_1625305 ) ( ON ?auto_1625303 ?auto_1625307 ) ( CLEAR ?auto_1625303 ) ( not ( = ?auto_1625302 ?auto_1625307 ) ) ( not ( = ?auto_1625303 ?auto_1625307 ) ) ( not ( = ?auto_1625301 ?auto_1625307 ) ) ( TRUCK-AT ?auto_1625309 ?auto_1625308 ) ( SURFACE-AT ?auto_1625301 ?auto_1625308 ) ( CLEAR ?auto_1625301 ) ( IS-CRATE ?auto_1625302 ) ( AVAILABLE ?auto_1625304 ) ( IN ?auto_1625302 ?auto_1625309 ) ( ON ?auto_1625294 ?auto_1625293 ) ( ON ?auto_1625295 ?auto_1625294 ) ( ON ?auto_1625292 ?auto_1625295 ) ( ON ?auto_1625296 ?auto_1625292 ) ( ON ?auto_1625298 ?auto_1625296 ) ( ON ?auto_1625297 ?auto_1625298 ) ( ON ?auto_1625299 ?auto_1625297 ) ( ON ?auto_1625300 ?auto_1625299 ) ( ON ?auto_1625301 ?auto_1625300 ) ( not ( = ?auto_1625293 ?auto_1625294 ) ) ( not ( = ?auto_1625293 ?auto_1625295 ) ) ( not ( = ?auto_1625293 ?auto_1625292 ) ) ( not ( = ?auto_1625293 ?auto_1625296 ) ) ( not ( = ?auto_1625293 ?auto_1625298 ) ) ( not ( = ?auto_1625293 ?auto_1625297 ) ) ( not ( = ?auto_1625293 ?auto_1625299 ) ) ( not ( = ?auto_1625293 ?auto_1625300 ) ) ( not ( = ?auto_1625293 ?auto_1625301 ) ) ( not ( = ?auto_1625293 ?auto_1625302 ) ) ( not ( = ?auto_1625293 ?auto_1625303 ) ) ( not ( = ?auto_1625293 ?auto_1625307 ) ) ( not ( = ?auto_1625294 ?auto_1625295 ) ) ( not ( = ?auto_1625294 ?auto_1625292 ) ) ( not ( = ?auto_1625294 ?auto_1625296 ) ) ( not ( = ?auto_1625294 ?auto_1625298 ) ) ( not ( = ?auto_1625294 ?auto_1625297 ) ) ( not ( = ?auto_1625294 ?auto_1625299 ) ) ( not ( = ?auto_1625294 ?auto_1625300 ) ) ( not ( = ?auto_1625294 ?auto_1625301 ) ) ( not ( = ?auto_1625294 ?auto_1625302 ) ) ( not ( = ?auto_1625294 ?auto_1625303 ) ) ( not ( = ?auto_1625294 ?auto_1625307 ) ) ( not ( = ?auto_1625295 ?auto_1625292 ) ) ( not ( = ?auto_1625295 ?auto_1625296 ) ) ( not ( = ?auto_1625295 ?auto_1625298 ) ) ( not ( = ?auto_1625295 ?auto_1625297 ) ) ( not ( = ?auto_1625295 ?auto_1625299 ) ) ( not ( = ?auto_1625295 ?auto_1625300 ) ) ( not ( = ?auto_1625295 ?auto_1625301 ) ) ( not ( = ?auto_1625295 ?auto_1625302 ) ) ( not ( = ?auto_1625295 ?auto_1625303 ) ) ( not ( = ?auto_1625295 ?auto_1625307 ) ) ( not ( = ?auto_1625292 ?auto_1625296 ) ) ( not ( = ?auto_1625292 ?auto_1625298 ) ) ( not ( = ?auto_1625292 ?auto_1625297 ) ) ( not ( = ?auto_1625292 ?auto_1625299 ) ) ( not ( = ?auto_1625292 ?auto_1625300 ) ) ( not ( = ?auto_1625292 ?auto_1625301 ) ) ( not ( = ?auto_1625292 ?auto_1625302 ) ) ( not ( = ?auto_1625292 ?auto_1625303 ) ) ( not ( = ?auto_1625292 ?auto_1625307 ) ) ( not ( = ?auto_1625296 ?auto_1625298 ) ) ( not ( = ?auto_1625296 ?auto_1625297 ) ) ( not ( = ?auto_1625296 ?auto_1625299 ) ) ( not ( = ?auto_1625296 ?auto_1625300 ) ) ( not ( = ?auto_1625296 ?auto_1625301 ) ) ( not ( = ?auto_1625296 ?auto_1625302 ) ) ( not ( = ?auto_1625296 ?auto_1625303 ) ) ( not ( = ?auto_1625296 ?auto_1625307 ) ) ( not ( = ?auto_1625298 ?auto_1625297 ) ) ( not ( = ?auto_1625298 ?auto_1625299 ) ) ( not ( = ?auto_1625298 ?auto_1625300 ) ) ( not ( = ?auto_1625298 ?auto_1625301 ) ) ( not ( = ?auto_1625298 ?auto_1625302 ) ) ( not ( = ?auto_1625298 ?auto_1625303 ) ) ( not ( = ?auto_1625298 ?auto_1625307 ) ) ( not ( = ?auto_1625297 ?auto_1625299 ) ) ( not ( = ?auto_1625297 ?auto_1625300 ) ) ( not ( = ?auto_1625297 ?auto_1625301 ) ) ( not ( = ?auto_1625297 ?auto_1625302 ) ) ( not ( = ?auto_1625297 ?auto_1625303 ) ) ( not ( = ?auto_1625297 ?auto_1625307 ) ) ( not ( = ?auto_1625299 ?auto_1625300 ) ) ( not ( = ?auto_1625299 ?auto_1625301 ) ) ( not ( = ?auto_1625299 ?auto_1625302 ) ) ( not ( = ?auto_1625299 ?auto_1625303 ) ) ( not ( = ?auto_1625299 ?auto_1625307 ) ) ( not ( = ?auto_1625300 ?auto_1625301 ) ) ( not ( = ?auto_1625300 ?auto_1625302 ) ) ( not ( = ?auto_1625300 ?auto_1625303 ) ) ( not ( = ?auto_1625300 ?auto_1625307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625301 ?auto_1625302 ?auto_1625303 )
      ( MAKE-11CRATE-VERIFY ?auto_1625293 ?auto_1625294 ?auto_1625295 ?auto_1625292 ?auto_1625296 ?auto_1625298 ?auto_1625297 ?auto_1625299 ?auto_1625300 ?auto_1625301 ?auto_1625302 ?auto_1625303 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634566 - SURFACE
      ?auto_1634567 - SURFACE
      ?auto_1634568 - SURFACE
      ?auto_1634565 - SURFACE
      ?auto_1634569 - SURFACE
      ?auto_1634571 - SURFACE
      ?auto_1634570 - SURFACE
      ?auto_1634572 - SURFACE
      ?auto_1634573 - SURFACE
      ?auto_1634574 - SURFACE
      ?auto_1634575 - SURFACE
      ?auto_1634576 - SURFACE
      ?auto_1634577 - SURFACE
    )
    :vars
    (
      ?auto_1634578 - HOIST
      ?auto_1634579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634578 ?auto_1634579 ) ( SURFACE-AT ?auto_1634576 ?auto_1634579 ) ( CLEAR ?auto_1634576 ) ( LIFTING ?auto_1634578 ?auto_1634577 ) ( IS-CRATE ?auto_1634577 ) ( not ( = ?auto_1634576 ?auto_1634577 ) ) ( ON ?auto_1634567 ?auto_1634566 ) ( ON ?auto_1634568 ?auto_1634567 ) ( ON ?auto_1634565 ?auto_1634568 ) ( ON ?auto_1634569 ?auto_1634565 ) ( ON ?auto_1634571 ?auto_1634569 ) ( ON ?auto_1634570 ?auto_1634571 ) ( ON ?auto_1634572 ?auto_1634570 ) ( ON ?auto_1634573 ?auto_1634572 ) ( ON ?auto_1634574 ?auto_1634573 ) ( ON ?auto_1634575 ?auto_1634574 ) ( ON ?auto_1634576 ?auto_1634575 ) ( not ( = ?auto_1634566 ?auto_1634567 ) ) ( not ( = ?auto_1634566 ?auto_1634568 ) ) ( not ( = ?auto_1634566 ?auto_1634565 ) ) ( not ( = ?auto_1634566 ?auto_1634569 ) ) ( not ( = ?auto_1634566 ?auto_1634571 ) ) ( not ( = ?auto_1634566 ?auto_1634570 ) ) ( not ( = ?auto_1634566 ?auto_1634572 ) ) ( not ( = ?auto_1634566 ?auto_1634573 ) ) ( not ( = ?auto_1634566 ?auto_1634574 ) ) ( not ( = ?auto_1634566 ?auto_1634575 ) ) ( not ( = ?auto_1634566 ?auto_1634576 ) ) ( not ( = ?auto_1634566 ?auto_1634577 ) ) ( not ( = ?auto_1634567 ?auto_1634568 ) ) ( not ( = ?auto_1634567 ?auto_1634565 ) ) ( not ( = ?auto_1634567 ?auto_1634569 ) ) ( not ( = ?auto_1634567 ?auto_1634571 ) ) ( not ( = ?auto_1634567 ?auto_1634570 ) ) ( not ( = ?auto_1634567 ?auto_1634572 ) ) ( not ( = ?auto_1634567 ?auto_1634573 ) ) ( not ( = ?auto_1634567 ?auto_1634574 ) ) ( not ( = ?auto_1634567 ?auto_1634575 ) ) ( not ( = ?auto_1634567 ?auto_1634576 ) ) ( not ( = ?auto_1634567 ?auto_1634577 ) ) ( not ( = ?auto_1634568 ?auto_1634565 ) ) ( not ( = ?auto_1634568 ?auto_1634569 ) ) ( not ( = ?auto_1634568 ?auto_1634571 ) ) ( not ( = ?auto_1634568 ?auto_1634570 ) ) ( not ( = ?auto_1634568 ?auto_1634572 ) ) ( not ( = ?auto_1634568 ?auto_1634573 ) ) ( not ( = ?auto_1634568 ?auto_1634574 ) ) ( not ( = ?auto_1634568 ?auto_1634575 ) ) ( not ( = ?auto_1634568 ?auto_1634576 ) ) ( not ( = ?auto_1634568 ?auto_1634577 ) ) ( not ( = ?auto_1634565 ?auto_1634569 ) ) ( not ( = ?auto_1634565 ?auto_1634571 ) ) ( not ( = ?auto_1634565 ?auto_1634570 ) ) ( not ( = ?auto_1634565 ?auto_1634572 ) ) ( not ( = ?auto_1634565 ?auto_1634573 ) ) ( not ( = ?auto_1634565 ?auto_1634574 ) ) ( not ( = ?auto_1634565 ?auto_1634575 ) ) ( not ( = ?auto_1634565 ?auto_1634576 ) ) ( not ( = ?auto_1634565 ?auto_1634577 ) ) ( not ( = ?auto_1634569 ?auto_1634571 ) ) ( not ( = ?auto_1634569 ?auto_1634570 ) ) ( not ( = ?auto_1634569 ?auto_1634572 ) ) ( not ( = ?auto_1634569 ?auto_1634573 ) ) ( not ( = ?auto_1634569 ?auto_1634574 ) ) ( not ( = ?auto_1634569 ?auto_1634575 ) ) ( not ( = ?auto_1634569 ?auto_1634576 ) ) ( not ( = ?auto_1634569 ?auto_1634577 ) ) ( not ( = ?auto_1634571 ?auto_1634570 ) ) ( not ( = ?auto_1634571 ?auto_1634572 ) ) ( not ( = ?auto_1634571 ?auto_1634573 ) ) ( not ( = ?auto_1634571 ?auto_1634574 ) ) ( not ( = ?auto_1634571 ?auto_1634575 ) ) ( not ( = ?auto_1634571 ?auto_1634576 ) ) ( not ( = ?auto_1634571 ?auto_1634577 ) ) ( not ( = ?auto_1634570 ?auto_1634572 ) ) ( not ( = ?auto_1634570 ?auto_1634573 ) ) ( not ( = ?auto_1634570 ?auto_1634574 ) ) ( not ( = ?auto_1634570 ?auto_1634575 ) ) ( not ( = ?auto_1634570 ?auto_1634576 ) ) ( not ( = ?auto_1634570 ?auto_1634577 ) ) ( not ( = ?auto_1634572 ?auto_1634573 ) ) ( not ( = ?auto_1634572 ?auto_1634574 ) ) ( not ( = ?auto_1634572 ?auto_1634575 ) ) ( not ( = ?auto_1634572 ?auto_1634576 ) ) ( not ( = ?auto_1634572 ?auto_1634577 ) ) ( not ( = ?auto_1634573 ?auto_1634574 ) ) ( not ( = ?auto_1634573 ?auto_1634575 ) ) ( not ( = ?auto_1634573 ?auto_1634576 ) ) ( not ( = ?auto_1634573 ?auto_1634577 ) ) ( not ( = ?auto_1634574 ?auto_1634575 ) ) ( not ( = ?auto_1634574 ?auto_1634576 ) ) ( not ( = ?auto_1634574 ?auto_1634577 ) ) ( not ( = ?auto_1634575 ?auto_1634576 ) ) ( not ( = ?auto_1634575 ?auto_1634577 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1634576 ?auto_1634577 )
      ( MAKE-12CRATE-VERIFY ?auto_1634566 ?auto_1634567 ?auto_1634568 ?auto_1634565 ?auto_1634569 ?auto_1634571 ?auto_1634570 ?auto_1634572 ?auto_1634573 ?auto_1634574 ?auto_1634575 ?auto_1634576 ?auto_1634577 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634691 - SURFACE
      ?auto_1634692 - SURFACE
      ?auto_1634693 - SURFACE
      ?auto_1634690 - SURFACE
      ?auto_1634694 - SURFACE
      ?auto_1634696 - SURFACE
      ?auto_1634695 - SURFACE
      ?auto_1634697 - SURFACE
      ?auto_1634698 - SURFACE
      ?auto_1634699 - SURFACE
      ?auto_1634700 - SURFACE
      ?auto_1634701 - SURFACE
      ?auto_1634702 - SURFACE
    )
    :vars
    (
      ?auto_1634704 - HOIST
      ?auto_1634703 - PLACE
      ?auto_1634705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634704 ?auto_1634703 ) ( SURFACE-AT ?auto_1634701 ?auto_1634703 ) ( CLEAR ?auto_1634701 ) ( IS-CRATE ?auto_1634702 ) ( not ( = ?auto_1634701 ?auto_1634702 ) ) ( TRUCK-AT ?auto_1634705 ?auto_1634703 ) ( AVAILABLE ?auto_1634704 ) ( IN ?auto_1634702 ?auto_1634705 ) ( ON ?auto_1634701 ?auto_1634700 ) ( not ( = ?auto_1634700 ?auto_1634701 ) ) ( not ( = ?auto_1634700 ?auto_1634702 ) ) ( ON ?auto_1634692 ?auto_1634691 ) ( ON ?auto_1634693 ?auto_1634692 ) ( ON ?auto_1634690 ?auto_1634693 ) ( ON ?auto_1634694 ?auto_1634690 ) ( ON ?auto_1634696 ?auto_1634694 ) ( ON ?auto_1634695 ?auto_1634696 ) ( ON ?auto_1634697 ?auto_1634695 ) ( ON ?auto_1634698 ?auto_1634697 ) ( ON ?auto_1634699 ?auto_1634698 ) ( ON ?auto_1634700 ?auto_1634699 ) ( not ( = ?auto_1634691 ?auto_1634692 ) ) ( not ( = ?auto_1634691 ?auto_1634693 ) ) ( not ( = ?auto_1634691 ?auto_1634690 ) ) ( not ( = ?auto_1634691 ?auto_1634694 ) ) ( not ( = ?auto_1634691 ?auto_1634696 ) ) ( not ( = ?auto_1634691 ?auto_1634695 ) ) ( not ( = ?auto_1634691 ?auto_1634697 ) ) ( not ( = ?auto_1634691 ?auto_1634698 ) ) ( not ( = ?auto_1634691 ?auto_1634699 ) ) ( not ( = ?auto_1634691 ?auto_1634700 ) ) ( not ( = ?auto_1634691 ?auto_1634701 ) ) ( not ( = ?auto_1634691 ?auto_1634702 ) ) ( not ( = ?auto_1634692 ?auto_1634693 ) ) ( not ( = ?auto_1634692 ?auto_1634690 ) ) ( not ( = ?auto_1634692 ?auto_1634694 ) ) ( not ( = ?auto_1634692 ?auto_1634696 ) ) ( not ( = ?auto_1634692 ?auto_1634695 ) ) ( not ( = ?auto_1634692 ?auto_1634697 ) ) ( not ( = ?auto_1634692 ?auto_1634698 ) ) ( not ( = ?auto_1634692 ?auto_1634699 ) ) ( not ( = ?auto_1634692 ?auto_1634700 ) ) ( not ( = ?auto_1634692 ?auto_1634701 ) ) ( not ( = ?auto_1634692 ?auto_1634702 ) ) ( not ( = ?auto_1634693 ?auto_1634690 ) ) ( not ( = ?auto_1634693 ?auto_1634694 ) ) ( not ( = ?auto_1634693 ?auto_1634696 ) ) ( not ( = ?auto_1634693 ?auto_1634695 ) ) ( not ( = ?auto_1634693 ?auto_1634697 ) ) ( not ( = ?auto_1634693 ?auto_1634698 ) ) ( not ( = ?auto_1634693 ?auto_1634699 ) ) ( not ( = ?auto_1634693 ?auto_1634700 ) ) ( not ( = ?auto_1634693 ?auto_1634701 ) ) ( not ( = ?auto_1634693 ?auto_1634702 ) ) ( not ( = ?auto_1634690 ?auto_1634694 ) ) ( not ( = ?auto_1634690 ?auto_1634696 ) ) ( not ( = ?auto_1634690 ?auto_1634695 ) ) ( not ( = ?auto_1634690 ?auto_1634697 ) ) ( not ( = ?auto_1634690 ?auto_1634698 ) ) ( not ( = ?auto_1634690 ?auto_1634699 ) ) ( not ( = ?auto_1634690 ?auto_1634700 ) ) ( not ( = ?auto_1634690 ?auto_1634701 ) ) ( not ( = ?auto_1634690 ?auto_1634702 ) ) ( not ( = ?auto_1634694 ?auto_1634696 ) ) ( not ( = ?auto_1634694 ?auto_1634695 ) ) ( not ( = ?auto_1634694 ?auto_1634697 ) ) ( not ( = ?auto_1634694 ?auto_1634698 ) ) ( not ( = ?auto_1634694 ?auto_1634699 ) ) ( not ( = ?auto_1634694 ?auto_1634700 ) ) ( not ( = ?auto_1634694 ?auto_1634701 ) ) ( not ( = ?auto_1634694 ?auto_1634702 ) ) ( not ( = ?auto_1634696 ?auto_1634695 ) ) ( not ( = ?auto_1634696 ?auto_1634697 ) ) ( not ( = ?auto_1634696 ?auto_1634698 ) ) ( not ( = ?auto_1634696 ?auto_1634699 ) ) ( not ( = ?auto_1634696 ?auto_1634700 ) ) ( not ( = ?auto_1634696 ?auto_1634701 ) ) ( not ( = ?auto_1634696 ?auto_1634702 ) ) ( not ( = ?auto_1634695 ?auto_1634697 ) ) ( not ( = ?auto_1634695 ?auto_1634698 ) ) ( not ( = ?auto_1634695 ?auto_1634699 ) ) ( not ( = ?auto_1634695 ?auto_1634700 ) ) ( not ( = ?auto_1634695 ?auto_1634701 ) ) ( not ( = ?auto_1634695 ?auto_1634702 ) ) ( not ( = ?auto_1634697 ?auto_1634698 ) ) ( not ( = ?auto_1634697 ?auto_1634699 ) ) ( not ( = ?auto_1634697 ?auto_1634700 ) ) ( not ( = ?auto_1634697 ?auto_1634701 ) ) ( not ( = ?auto_1634697 ?auto_1634702 ) ) ( not ( = ?auto_1634698 ?auto_1634699 ) ) ( not ( = ?auto_1634698 ?auto_1634700 ) ) ( not ( = ?auto_1634698 ?auto_1634701 ) ) ( not ( = ?auto_1634698 ?auto_1634702 ) ) ( not ( = ?auto_1634699 ?auto_1634700 ) ) ( not ( = ?auto_1634699 ?auto_1634701 ) ) ( not ( = ?auto_1634699 ?auto_1634702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634700 ?auto_1634701 ?auto_1634702 )
      ( MAKE-12CRATE-VERIFY ?auto_1634691 ?auto_1634692 ?auto_1634693 ?auto_1634690 ?auto_1634694 ?auto_1634696 ?auto_1634695 ?auto_1634697 ?auto_1634698 ?auto_1634699 ?auto_1634700 ?auto_1634701 ?auto_1634702 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634829 - SURFACE
      ?auto_1634830 - SURFACE
      ?auto_1634831 - SURFACE
      ?auto_1634828 - SURFACE
      ?auto_1634832 - SURFACE
      ?auto_1634834 - SURFACE
      ?auto_1634833 - SURFACE
      ?auto_1634835 - SURFACE
      ?auto_1634836 - SURFACE
      ?auto_1634837 - SURFACE
      ?auto_1634838 - SURFACE
      ?auto_1634839 - SURFACE
      ?auto_1634840 - SURFACE
    )
    :vars
    (
      ?auto_1634842 - HOIST
      ?auto_1634841 - PLACE
      ?auto_1634844 - TRUCK
      ?auto_1634843 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634842 ?auto_1634841 ) ( SURFACE-AT ?auto_1634839 ?auto_1634841 ) ( CLEAR ?auto_1634839 ) ( IS-CRATE ?auto_1634840 ) ( not ( = ?auto_1634839 ?auto_1634840 ) ) ( AVAILABLE ?auto_1634842 ) ( IN ?auto_1634840 ?auto_1634844 ) ( ON ?auto_1634839 ?auto_1634838 ) ( not ( = ?auto_1634838 ?auto_1634839 ) ) ( not ( = ?auto_1634838 ?auto_1634840 ) ) ( TRUCK-AT ?auto_1634844 ?auto_1634843 ) ( not ( = ?auto_1634843 ?auto_1634841 ) ) ( ON ?auto_1634830 ?auto_1634829 ) ( ON ?auto_1634831 ?auto_1634830 ) ( ON ?auto_1634828 ?auto_1634831 ) ( ON ?auto_1634832 ?auto_1634828 ) ( ON ?auto_1634834 ?auto_1634832 ) ( ON ?auto_1634833 ?auto_1634834 ) ( ON ?auto_1634835 ?auto_1634833 ) ( ON ?auto_1634836 ?auto_1634835 ) ( ON ?auto_1634837 ?auto_1634836 ) ( ON ?auto_1634838 ?auto_1634837 ) ( not ( = ?auto_1634829 ?auto_1634830 ) ) ( not ( = ?auto_1634829 ?auto_1634831 ) ) ( not ( = ?auto_1634829 ?auto_1634828 ) ) ( not ( = ?auto_1634829 ?auto_1634832 ) ) ( not ( = ?auto_1634829 ?auto_1634834 ) ) ( not ( = ?auto_1634829 ?auto_1634833 ) ) ( not ( = ?auto_1634829 ?auto_1634835 ) ) ( not ( = ?auto_1634829 ?auto_1634836 ) ) ( not ( = ?auto_1634829 ?auto_1634837 ) ) ( not ( = ?auto_1634829 ?auto_1634838 ) ) ( not ( = ?auto_1634829 ?auto_1634839 ) ) ( not ( = ?auto_1634829 ?auto_1634840 ) ) ( not ( = ?auto_1634830 ?auto_1634831 ) ) ( not ( = ?auto_1634830 ?auto_1634828 ) ) ( not ( = ?auto_1634830 ?auto_1634832 ) ) ( not ( = ?auto_1634830 ?auto_1634834 ) ) ( not ( = ?auto_1634830 ?auto_1634833 ) ) ( not ( = ?auto_1634830 ?auto_1634835 ) ) ( not ( = ?auto_1634830 ?auto_1634836 ) ) ( not ( = ?auto_1634830 ?auto_1634837 ) ) ( not ( = ?auto_1634830 ?auto_1634838 ) ) ( not ( = ?auto_1634830 ?auto_1634839 ) ) ( not ( = ?auto_1634830 ?auto_1634840 ) ) ( not ( = ?auto_1634831 ?auto_1634828 ) ) ( not ( = ?auto_1634831 ?auto_1634832 ) ) ( not ( = ?auto_1634831 ?auto_1634834 ) ) ( not ( = ?auto_1634831 ?auto_1634833 ) ) ( not ( = ?auto_1634831 ?auto_1634835 ) ) ( not ( = ?auto_1634831 ?auto_1634836 ) ) ( not ( = ?auto_1634831 ?auto_1634837 ) ) ( not ( = ?auto_1634831 ?auto_1634838 ) ) ( not ( = ?auto_1634831 ?auto_1634839 ) ) ( not ( = ?auto_1634831 ?auto_1634840 ) ) ( not ( = ?auto_1634828 ?auto_1634832 ) ) ( not ( = ?auto_1634828 ?auto_1634834 ) ) ( not ( = ?auto_1634828 ?auto_1634833 ) ) ( not ( = ?auto_1634828 ?auto_1634835 ) ) ( not ( = ?auto_1634828 ?auto_1634836 ) ) ( not ( = ?auto_1634828 ?auto_1634837 ) ) ( not ( = ?auto_1634828 ?auto_1634838 ) ) ( not ( = ?auto_1634828 ?auto_1634839 ) ) ( not ( = ?auto_1634828 ?auto_1634840 ) ) ( not ( = ?auto_1634832 ?auto_1634834 ) ) ( not ( = ?auto_1634832 ?auto_1634833 ) ) ( not ( = ?auto_1634832 ?auto_1634835 ) ) ( not ( = ?auto_1634832 ?auto_1634836 ) ) ( not ( = ?auto_1634832 ?auto_1634837 ) ) ( not ( = ?auto_1634832 ?auto_1634838 ) ) ( not ( = ?auto_1634832 ?auto_1634839 ) ) ( not ( = ?auto_1634832 ?auto_1634840 ) ) ( not ( = ?auto_1634834 ?auto_1634833 ) ) ( not ( = ?auto_1634834 ?auto_1634835 ) ) ( not ( = ?auto_1634834 ?auto_1634836 ) ) ( not ( = ?auto_1634834 ?auto_1634837 ) ) ( not ( = ?auto_1634834 ?auto_1634838 ) ) ( not ( = ?auto_1634834 ?auto_1634839 ) ) ( not ( = ?auto_1634834 ?auto_1634840 ) ) ( not ( = ?auto_1634833 ?auto_1634835 ) ) ( not ( = ?auto_1634833 ?auto_1634836 ) ) ( not ( = ?auto_1634833 ?auto_1634837 ) ) ( not ( = ?auto_1634833 ?auto_1634838 ) ) ( not ( = ?auto_1634833 ?auto_1634839 ) ) ( not ( = ?auto_1634833 ?auto_1634840 ) ) ( not ( = ?auto_1634835 ?auto_1634836 ) ) ( not ( = ?auto_1634835 ?auto_1634837 ) ) ( not ( = ?auto_1634835 ?auto_1634838 ) ) ( not ( = ?auto_1634835 ?auto_1634839 ) ) ( not ( = ?auto_1634835 ?auto_1634840 ) ) ( not ( = ?auto_1634836 ?auto_1634837 ) ) ( not ( = ?auto_1634836 ?auto_1634838 ) ) ( not ( = ?auto_1634836 ?auto_1634839 ) ) ( not ( = ?auto_1634836 ?auto_1634840 ) ) ( not ( = ?auto_1634837 ?auto_1634838 ) ) ( not ( = ?auto_1634837 ?auto_1634839 ) ) ( not ( = ?auto_1634837 ?auto_1634840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634838 ?auto_1634839 ?auto_1634840 )
      ( MAKE-12CRATE-VERIFY ?auto_1634829 ?auto_1634830 ?auto_1634831 ?auto_1634828 ?auto_1634832 ?auto_1634834 ?auto_1634833 ?auto_1634835 ?auto_1634836 ?auto_1634837 ?auto_1634838 ?auto_1634839 ?auto_1634840 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634979 - SURFACE
      ?auto_1634980 - SURFACE
      ?auto_1634981 - SURFACE
      ?auto_1634978 - SURFACE
      ?auto_1634982 - SURFACE
      ?auto_1634984 - SURFACE
      ?auto_1634983 - SURFACE
      ?auto_1634985 - SURFACE
      ?auto_1634986 - SURFACE
      ?auto_1634987 - SURFACE
      ?auto_1634988 - SURFACE
      ?auto_1634989 - SURFACE
      ?auto_1634990 - SURFACE
    )
    :vars
    (
      ?auto_1634995 - HOIST
      ?auto_1634993 - PLACE
      ?auto_1634991 - TRUCK
      ?auto_1634992 - PLACE
      ?auto_1634994 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634995 ?auto_1634993 ) ( SURFACE-AT ?auto_1634989 ?auto_1634993 ) ( CLEAR ?auto_1634989 ) ( IS-CRATE ?auto_1634990 ) ( not ( = ?auto_1634989 ?auto_1634990 ) ) ( AVAILABLE ?auto_1634995 ) ( ON ?auto_1634989 ?auto_1634988 ) ( not ( = ?auto_1634988 ?auto_1634989 ) ) ( not ( = ?auto_1634988 ?auto_1634990 ) ) ( TRUCK-AT ?auto_1634991 ?auto_1634992 ) ( not ( = ?auto_1634992 ?auto_1634993 ) ) ( HOIST-AT ?auto_1634994 ?auto_1634992 ) ( LIFTING ?auto_1634994 ?auto_1634990 ) ( not ( = ?auto_1634995 ?auto_1634994 ) ) ( ON ?auto_1634980 ?auto_1634979 ) ( ON ?auto_1634981 ?auto_1634980 ) ( ON ?auto_1634978 ?auto_1634981 ) ( ON ?auto_1634982 ?auto_1634978 ) ( ON ?auto_1634984 ?auto_1634982 ) ( ON ?auto_1634983 ?auto_1634984 ) ( ON ?auto_1634985 ?auto_1634983 ) ( ON ?auto_1634986 ?auto_1634985 ) ( ON ?auto_1634987 ?auto_1634986 ) ( ON ?auto_1634988 ?auto_1634987 ) ( not ( = ?auto_1634979 ?auto_1634980 ) ) ( not ( = ?auto_1634979 ?auto_1634981 ) ) ( not ( = ?auto_1634979 ?auto_1634978 ) ) ( not ( = ?auto_1634979 ?auto_1634982 ) ) ( not ( = ?auto_1634979 ?auto_1634984 ) ) ( not ( = ?auto_1634979 ?auto_1634983 ) ) ( not ( = ?auto_1634979 ?auto_1634985 ) ) ( not ( = ?auto_1634979 ?auto_1634986 ) ) ( not ( = ?auto_1634979 ?auto_1634987 ) ) ( not ( = ?auto_1634979 ?auto_1634988 ) ) ( not ( = ?auto_1634979 ?auto_1634989 ) ) ( not ( = ?auto_1634979 ?auto_1634990 ) ) ( not ( = ?auto_1634980 ?auto_1634981 ) ) ( not ( = ?auto_1634980 ?auto_1634978 ) ) ( not ( = ?auto_1634980 ?auto_1634982 ) ) ( not ( = ?auto_1634980 ?auto_1634984 ) ) ( not ( = ?auto_1634980 ?auto_1634983 ) ) ( not ( = ?auto_1634980 ?auto_1634985 ) ) ( not ( = ?auto_1634980 ?auto_1634986 ) ) ( not ( = ?auto_1634980 ?auto_1634987 ) ) ( not ( = ?auto_1634980 ?auto_1634988 ) ) ( not ( = ?auto_1634980 ?auto_1634989 ) ) ( not ( = ?auto_1634980 ?auto_1634990 ) ) ( not ( = ?auto_1634981 ?auto_1634978 ) ) ( not ( = ?auto_1634981 ?auto_1634982 ) ) ( not ( = ?auto_1634981 ?auto_1634984 ) ) ( not ( = ?auto_1634981 ?auto_1634983 ) ) ( not ( = ?auto_1634981 ?auto_1634985 ) ) ( not ( = ?auto_1634981 ?auto_1634986 ) ) ( not ( = ?auto_1634981 ?auto_1634987 ) ) ( not ( = ?auto_1634981 ?auto_1634988 ) ) ( not ( = ?auto_1634981 ?auto_1634989 ) ) ( not ( = ?auto_1634981 ?auto_1634990 ) ) ( not ( = ?auto_1634978 ?auto_1634982 ) ) ( not ( = ?auto_1634978 ?auto_1634984 ) ) ( not ( = ?auto_1634978 ?auto_1634983 ) ) ( not ( = ?auto_1634978 ?auto_1634985 ) ) ( not ( = ?auto_1634978 ?auto_1634986 ) ) ( not ( = ?auto_1634978 ?auto_1634987 ) ) ( not ( = ?auto_1634978 ?auto_1634988 ) ) ( not ( = ?auto_1634978 ?auto_1634989 ) ) ( not ( = ?auto_1634978 ?auto_1634990 ) ) ( not ( = ?auto_1634982 ?auto_1634984 ) ) ( not ( = ?auto_1634982 ?auto_1634983 ) ) ( not ( = ?auto_1634982 ?auto_1634985 ) ) ( not ( = ?auto_1634982 ?auto_1634986 ) ) ( not ( = ?auto_1634982 ?auto_1634987 ) ) ( not ( = ?auto_1634982 ?auto_1634988 ) ) ( not ( = ?auto_1634982 ?auto_1634989 ) ) ( not ( = ?auto_1634982 ?auto_1634990 ) ) ( not ( = ?auto_1634984 ?auto_1634983 ) ) ( not ( = ?auto_1634984 ?auto_1634985 ) ) ( not ( = ?auto_1634984 ?auto_1634986 ) ) ( not ( = ?auto_1634984 ?auto_1634987 ) ) ( not ( = ?auto_1634984 ?auto_1634988 ) ) ( not ( = ?auto_1634984 ?auto_1634989 ) ) ( not ( = ?auto_1634984 ?auto_1634990 ) ) ( not ( = ?auto_1634983 ?auto_1634985 ) ) ( not ( = ?auto_1634983 ?auto_1634986 ) ) ( not ( = ?auto_1634983 ?auto_1634987 ) ) ( not ( = ?auto_1634983 ?auto_1634988 ) ) ( not ( = ?auto_1634983 ?auto_1634989 ) ) ( not ( = ?auto_1634983 ?auto_1634990 ) ) ( not ( = ?auto_1634985 ?auto_1634986 ) ) ( not ( = ?auto_1634985 ?auto_1634987 ) ) ( not ( = ?auto_1634985 ?auto_1634988 ) ) ( not ( = ?auto_1634985 ?auto_1634989 ) ) ( not ( = ?auto_1634985 ?auto_1634990 ) ) ( not ( = ?auto_1634986 ?auto_1634987 ) ) ( not ( = ?auto_1634986 ?auto_1634988 ) ) ( not ( = ?auto_1634986 ?auto_1634989 ) ) ( not ( = ?auto_1634986 ?auto_1634990 ) ) ( not ( = ?auto_1634987 ?auto_1634988 ) ) ( not ( = ?auto_1634987 ?auto_1634989 ) ) ( not ( = ?auto_1634987 ?auto_1634990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634988 ?auto_1634989 ?auto_1634990 )
      ( MAKE-12CRATE-VERIFY ?auto_1634979 ?auto_1634980 ?auto_1634981 ?auto_1634978 ?auto_1634982 ?auto_1634984 ?auto_1634983 ?auto_1634985 ?auto_1634986 ?auto_1634987 ?auto_1634988 ?auto_1634989 ?auto_1634990 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635141 - SURFACE
      ?auto_1635142 - SURFACE
      ?auto_1635143 - SURFACE
      ?auto_1635140 - SURFACE
      ?auto_1635144 - SURFACE
      ?auto_1635146 - SURFACE
      ?auto_1635145 - SURFACE
      ?auto_1635147 - SURFACE
      ?auto_1635148 - SURFACE
      ?auto_1635149 - SURFACE
      ?auto_1635150 - SURFACE
      ?auto_1635151 - SURFACE
      ?auto_1635152 - SURFACE
    )
    :vars
    (
      ?auto_1635154 - HOIST
      ?auto_1635158 - PLACE
      ?auto_1635157 - TRUCK
      ?auto_1635153 - PLACE
      ?auto_1635156 - HOIST
      ?auto_1635155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635154 ?auto_1635158 ) ( SURFACE-AT ?auto_1635151 ?auto_1635158 ) ( CLEAR ?auto_1635151 ) ( IS-CRATE ?auto_1635152 ) ( not ( = ?auto_1635151 ?auto_1635152 ) ) ( AVAILABLE ?auto_1635154 ) ( ON ?auto_1635151 ?auto_1635150 ) ( not ( = ?auto_1635150 ?auto_1635151 ) ) ( not ( = ?auto_1635150 ?auto_1635152 ) ) ( TRUCK-AT ?auto_1635157 ?auto_1635153 ) ( not ( = ?auto_1635153 ?auto_1635158 ) ) ( HOIST-AT ?auto_1635156 ?auto_1635153 ) ( not ( = ?auto_1635154 ?auto_1635156 ) ) ( AVAILABLE ?auto_1635156 ) ( SURFACE-AT ?auto_1635152 ?auto_1635153 ) ( ON ?auto_1635152 ?auto_1635155 ) ( CLEAR ?auto_1635152 ) ( not ( = ?auto_1635151 ?auto_1635155 ) ) ( not ( = ?auto_1635152 ?auto_1635155 ) ) ( not ( = ?auto_1635150 ?auto_1635155 ) ) ( ON ?auto_1635142 ?auto_1635141 ) ( ON ?auto_1635143 ?auto_1635142 ) ( ON ?auto_1635140 ?auto_1635143 ) ( ON ?auto_1635144 ?auto_1635140 ) ( ON ?auto_1635146 ?auto_1635144 ) ( ON ?auto_1635145 ?auto_1635146 ) ( ON ?auto_1635147 ?auto_1635145 ) ( ON ?auto_1635148 ?auto_1635147 ) ( ON ?auto_1635149 ?auto_1635148 ) ( ON ?auto_1635150 ?auto_1635149 ) ( not ( = ?auto_1635141 ?auto_1635142 ) ) ( not ( = ?auto_1635141 ?auto_1635143 ) ) ( not ( = ?auto_1635141 ?auto_1635140 ) ) ( not ( = ?auto_1635141 ?auto_1635144 ) ) ( not ( = ?auto_1635141 ?auto_1635146 ) ) ( not ( = ?auto_1635141 ?auto_1635145 ) ) ( not ( = ?auto_1635141 ?auto_1635147 ) ) ( not ( = ?auto_1635141 ?auto_1635148 ) ) ( not ( = ?auto_1635141 ?auto_1635149 ) ) ( not ( = ?auto_1635141 ?auto_1635150 ) ) ( not ( = ?auto_1635141 ?auto_1635151 ) ) ( not ( = ?auto_1635141 ?auto_1635152 ) ) ( not ( = ?auto_1635141 ?auto_1635155 ) ) ( not ( = ?auto_1635142 ?auto_1635143 ) ) ( not ( = ?auto_1635142 ?auto_1635140 ) ) ( not ( = ?auto_1635142 ?auto_1635144 ) ) ( not ( = ?auto_1635142 ?auto_1635146 ) ) ( not ( = ?auto_1635142 ?auto_1635145 ) ) ( not ( = ?auto_1635142 ?auto_1635147 ) ) ( not ( = ?auto_1635142 ?auto_1635148 ) ) ( not ( = ?auto_1635142 ?auto_1635149 ) ) ( not ( = ?auto_1635142 ?auto_1635150 ) ) ( not ( = ?auto_1635142 ?auto_1635151 ) ) ( not ( = ?auto_1635142 ?auto_1635152 ) ) ( not ( = ?auto_1635142 ?auto_1635155 ) ) ( not ( = ?auto_1635143 ?auto_1635140 ) ) ( not ( = ?auto_1635143 ?auto_1635144 ) ) ( not ( = ?auto_1635143 ?auto_1635146 ) ) ( not ( = ?auto_1635143 ?auto_1635145 ) ) ( not ( = ?auto_1635143 ?auto_1635147 ) ) ( not ( = ?auto_1635143 ?auto_1635148 ) ) ( not ( = ?auto_1635143 ?auto_1635149 ) ) ( not ( = ?auto_1635143 ?auto_1635150 ) ) ( not ( = ?auto_1635143 ?auto_1635151 ) ) ( not ( = ?auto_1635143 ?auto_1635152 ) ) ( not ( = ?auto_1635143 ?auto_1635155 ) ) ( not ( = ?auto_1635140 ?auto_1635144 ) ) ( not ( = ?auto_1635140 ?auto_1635146 ) ) ( not ( = ?auto_1635140 ?auto_1635145 ) ) ( not ( = ?auto_1635140 ?auto_1635147 ) ) ( not ( = ?auto_1635140 ?auto_1635148 ) ) ( not ( = ?auto_1635140 ?auto_1635149 ) ) ( not ( = ?auto_1635140 ?auto_1635150 ) ) ( not ( = ?auto_1635140 ?auto_1635151 ) ) ( not ( = ?auto_1635140 ?auto_1635152 ) ) ( not ( = ?auto_1635140 ?auto_1635155 ) ) ( not ( = ?auto_1635144 ?auto_1635146 ) ) ( not ( = ?auto_1635144 ?auto_1635145 ) ) ( not ( = ?auto_1635144 ?auto_1635147 ) ) ( not ( = ?auto_1635144 ?auto_1635148 ) ) ( not ( = ?auto_1635144 ?auto_1635149 ) ) ( not ( = ?auto_1635144 ?auto_1635150 ) ) ( not ( = ?auto_1635144 ?auto_1635151 ) ) ( not ( = ?auto_1635144 ?auto_1635152 ) ) ( not ( = ?auto_1635144 ?auto_1635155 ) ) ( not ( = ?auto_1635146 ?auto_1635145 ) ) ( not ( = ?auto_1635146 ?auto_1635147 ) ) ( not ( = ?auto_1635146 ?auto_1635148 ) ) ( not ( = ?auto_1635146 ?auto_1635149 ) ) ( not ( = ?auto_1635146 ?auto_1635150 ) ) ( not ( = ?auto_1635146 ?auto_1635151 ) ) ( not ( = ?auto_1635146 ?auto_1635152 ) ) ( not ( = ?auto_1635146 ?auto_1635155 ) ) ( not ( = ?auto_1635145 ?auto_1635147 ) ) ( not ( = ?auto_1635145 ?auto_1635148 ) ) ( not ( = ?auto_1635145 ?auto_1635149 ) ) ( not ( = ?auto_1635145 ?auto_1635150 ) ) ( not ( = ?auto_1635145 ?auto_1635151 ) ) ( not ( = ?auto_1635145 ?auto_1635152 ) ) ( not ( = ?auto_1635145 ?auto_1635155 ) ) ( not ( = ?auto_1635147 ?auto_1635148 ) ) ( not ( = ?auto_1635147 ?auto_1635149 ) ) ( not ( = ?auto_1635147 ?auto_1635150 ) ) ( not ( = ?auto_1635147 ?auto_1635151 ) ) ( not ( = ?auto_1635147 ?auto_1635152 ) ) ( not ( = ?auto_1635147 ?auto_1635155 ) ) ( not ( = ?auto_1635148 ?auto_1635149 ) ) ( not ( = ?auto_1635148 ?auto_1635150 ) ) ( not ( = ?auto_1635148 ?auto_1635151 ) ) ( not ( = ?auto_1635148 ?auto_1635152 ) ) ( not ( = ?auto_1635148 ?auto_1635155 ) ) ( not ( = ?auto_1635149 ?auto_1635150 ) ) ( not ( = ?auto_1635149 ?auto_1635151 ) ) ( not ( = ?auto_1635149 ?auto_1635152 ) ) ( not ( = ?auto_1635149 ?auto_1635155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635150 ?auto_1635151 ?auto_1635152 )
      ( MAKE-12CRATE-VERIFY ?auto_1635141 ?auto_1635142 ?auto_1635143 ?auto_1635140 ?auto_1635144 ?auto_1635146 ?auto_1635145 ?auto_1635147 ?auto_1635148 ?auto_1635149 ?auto_1635150 ?auto_1635151 ?auto_1635152 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635304 - SURFACE
      ?auto_1635305 - SURFACE
      ?auto_1635306 - SURFACE
      ?auto_1635303 - SURFACE
      ?auto_1635307 - SURFACE
      ?auto_1635309 - SURFACE
      ?auto_1635308 - SURFACE
      ?auto_1635310 - SURFACE
      ?auto_1635311 - SURFACE
      ?auto_1635312 - SURFACE
      ?auto_1635313 - SURFACE
      ?auto_1635314 - SURFACE
      ?auto_1635315 - SURFACE
    )
    :vars
    (
      ?auto_1635318 - HOIST
      ?auto_1635316 - PLACE
      ?auto_1635321 - PLACE
      ?auto_1635320 - HOIST
      ?auto_1635319 - SURFACE
      ?auto_1635317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635318 ?auto_1635316 ) ( SURFACE-AT ?auto_1635314 ?auto_1635316 ) ( CLEAR ?auto_1635314 ) ( IS-CRATE ?auto_1635315 ) ( not ( = ?auto_1635314 ?auto_1635315 ) ) ( AVAILABLE ?auto_1635318 ) ( ON ?auto_1635314 ?auto_1635313 ) ( not ( = ?auto_1635313 ?auto_1635314 ) ) ( not ( = ?auto_1635313 ?auto_1635315 ) ) ( not ( = ?auto_1635321 ?auto_1635316 ) ) ( HOIST-AT ?auto_1635320 ?auto_1635321 ) ( not ( = ?auto_1635318 ?auto_1635320 ) ) ( AVAILABLE ?auto_1635320 ) ( SURFACE-AT ?auto_1635315 ?auto_1635321 ) ( ON ?auto_1635315 ?auto_1635319 ) ( CLEAR ?auto_1635315 ) ( not ( = ?auto_1635314 ?auto_1635319 ) ) ( not ( = ?auto_1635315 ?auto_1635319 ) ) ( not ( = ?auto_1635313 ?auto_1635319 ) ) ( TRUCK-AT ?auto_1635317 ?auto_1635316 ) ( ON ?auto_1635305 ?auto_1635304 ) ( ON ?auto_1635306 ?auto_1635305 ) ( ON ?auto_1635303 ?auto_1635306 ) ( ON ?auto_1635307 ?auto_1635303 ) ( ON ?auto_1635309 ?auto_1635307 ) ( ON ?auto_1635308 ?auto_1635309 ) ( ON ?auto_1635310 ?auto_1635308 ) ( ON ?auto_1635311 ?auto_1635310 ) ( ON ?auto_1635312 ?auto_1635311 ) ( ON ?auto_1635313 ?auto_1635312 ) ( not ( = ?auto_1635304 ?auto_1635305 ) ) ( not ( = ?auto_1635304 ?auto_1635306 ) ) ( not ( = ?auto_1635304 ?auto_1635303 ) ) ( not ( = ?auto_1635304 ?auto_1635307 ) ) ( not ( = ?auto_1635304 ?auto_1635309 ) ) ( not ( = ?auto_1635304 ?auto_1635308 ) ) ( not ( = ?auto_1635304 ?auto_1635310 ) ) ( not ( = ?auto_1635304 ?auto_1635311 ) ) ( not ( = ?auto_1635304 ?auto_1635312 ) ) ( not ( = ?auto_1635304 ?auto_1635313 ) ) ( not ( = ?auto_1635304 ?auto_1635314 ) ) ( not ( = ?auto_1635304 ?auto_1635315 ) ) ( not ( = ?auto_1635304 ?auto_1635319 ) ) ( not ( = ?auto_1635305 ?auto_1635306 ) ) ( not ( = ?auto_1635305 ?auto_1635303 ) ) ( not ( = ?auto_1635305 ?auto_1635307 ) ) ( not ( = ?auto_1635305 ?auto_1635309 ) ) ( not ( = ?auto_1635305 ?auto_1635308 ) ) ( not ( = ?auto_1635305 ?auto_1635310 ) ) ( not ( = ?auto_1635305 ?auto_1635311 ) ) ( not ( = ?auto_1635305 ?auto_1635312 ) ) ( not ( = ?auto_1635305 ?auto_1635313 ) ) ( not ( = ?auto_1635305 ?auto_1635314 ) ) ( not ( = ?auto_1635305 ?auto_1635315 ) ) ( not ( = ?auto_1635305 ?auto_1635319 ) ) ( not ( = ?auto_1635306 ?auto_1635303 ) ) ( not ( = ?auto_1635306 ?auto_1635307 ) ) ( not ( = ?auto_1635306 ?auto_1635309 ) ) ( not ( = ?auto_1635306 ?auto_1635308 ) ) ( not ( = ?auto_1635306 ?auto_1635310 ) ) ( not ( = ?auto_1635306 ?auto_1635311 ) ) ( not ( = ?auto_1635306 ?auto_1635312 ) ) ( not ( = ?auto_1635306 ?auto_1635313 ) ) ( not ( = ?auto_1635306 ?auto_1635314 ) ) ( not ( = ?auto_1635306 ?auto_1635315 ) ) ( not ( = ?auto_1635306 ?auto_1635319 ) ) ( not ( = ?auto_1635303 ?auto_1635307 ) ) ( not ( = ?auto_1635303 ?auto_1635309 ) ) ( not ( = ?auto_1635303 ?auto_1635308 ) ) ( not ( = ?auto_1635303 ?auto_1635310 ) ) ( not ( = ?auto_1635303 ?auto_1635311 ) ) ( not ( = ?auto_1635303 ?auto_1635312 ) ) ( not ( = ?auto_1635303 ?auto_1635313 ) ) ( not ( = ?auto_1635303 ?auto_1635314 ) ) ( not ( = ?auto_1635303 ?auto_1635315 ) ) ( not ( = ?auto_1635303 ?auto_1635319 ) ) ( not ( = ?auto_1635307 ?auto_1635309 ) ) ( not ( = ?auto_1635307 ?auto_1635308 ) ) ( not ( = ?auto_1635307 ?auto_1635310 ) ) ( not ( = ?auto_1635307 ?auto_1635311 ) ) ( not ( = ?auto_1635307 ?auto_1635312 ) ) ( not ( = ?auto_1635307 ?auto_1635313 ) ) ( not ( = ?auto_1635307 ?auto_1635314 ) ) ( not ( = ?auto_1635307 ?auto_1635315 ) ) ( not ( = ?auto_1635307 ?auto_1635319 ) ) ( not ( = ?auto_1635309 ?auto_1635308 ) ) ( not ( = ?auto_1635309 ?auto_1635310 ) ) ( not ( = ?auto_1635309 ?auto_1635311 ) ) ( not ( = ?auto_1635309 ?auto_1635312 ) ) ( not ( = ?auto_1635309 ?auto_1635313 ) ) ( not ( = ?auto_1635309 ?auto_1635314 ) ) ( not ( = ?auto_1635309 ?auto_1635315 ) ) ( not ( = ?auto_1635309 ?auto_1635319 ) ) ( not ( = ?auto_1635308 ?auto_1635310 ) ) ( not ( = ?auto_1635308 ?auto_1635311 ) ) ( not ( = ?auto_1635308 ?auto_1635312 ) ) ( not ( = ?auto_1635308 ?auto_1635313 ) ) ( not ( = ?auto_1635308 ?auto_1635314 ) ) ( not ( = ?auto_1635308 ?auto_1635315 ) ) ( not ( = ?auto_1635308 ?auto_1635319 ) ) ( not ( = ?auto_1635310 ?auto_1635311 ) ) ( not ( = ?auto_1635310 ?auto_1635312 ) ) ( not ( = ?auto_1635310 ?auto_1635313 ) ) ( not ( = ?auto_1635310 ?auto_1635314 ) ) ( not ( = ?auto_1635310 ?auto_1635315 ) ) ( not ( = ?auto_1635310 ?auto_1635319 ) ) ( not ( = ?auto_1635311 ?auto_1635312 ) ) ( not ( = ?auto_1635311 ?auto_1635313 ) ) ( not ( = ?auto_1635311 ?auto_1635314 ) ) ( not ( = ?auto_1635311 ?auto_1635315 ) ) ( not ( = ?auto_1635311 ?auto_1635319 ) ) ( not ( = ?auto_1635312 ?auto_1635313 ) ) ( not ( = ?auto_1635312 ?auto_1635314 ) ) ( not ( = ?auto_1635312 ?auto_1635315 ) ) ( not ( = ?auto_1635312 ?auto_1635319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635313 ?auto_1635314 ?auto_1635315 )
      ( MAKE-12CRATE-VERIFY ?auto_1635304 ?auto_1635305 ?auto_1635306 ?auto_1635303 ?auto_1635307 ?auto_1635309 ?auto_1635308 ?auto_1635310 ?auto_1635311 ?auto_1635312 ?auto_1635313 ?auto_1635314 ?auto_1635315 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635467 - SURFACE
      ?auto_1635468 - SURFACE
      ?auto_1635469 - SURFACE
      ?auto_1635466 - SURFACE
      ?auto_1635470 - SURFACE
      ?auto_1635472 - SURFACE
      ?auto_1635471 - SURFACE
      ?auto_1635473 - SURFACE
      ?auto_1635474 - SURFACE
      ?auto_1635475 - SURFACE
      ?auto_1635476 - SURFACE
      ?auto_1635477 - SURFACE
      ?auto_1635478 - SURFACE
    )
    :vars
    (
      ?auto_1635480 - HOIST
      ?auto_1635482 - PLACE
      ?auto_1635481 - PLACE
      ?auto_1635484 - HOIST
      ?auto_1635479 - SURFACE
      ?auto_1635483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635480 ?auto_1635482 ) ( IS-CRATE ?auto_1635478 ) ( not ( = ?auto_1635477 ?auto_1635478 ) ) ( not ( = ?auto_1635476 ?auto_1635477 ) ) ( not ( = ?auto_1635476 ?auto_1635478 ) ) ( not ( = ?auto_1635481 ?auto_1635482 ) ) ( HOIST-AT ?auto_1635484 ?auto_1635481 ) ( not ( = ?auto_1635480 ?auto_1635484 ) ) ( AVAILABLE ?auto_1635484 ) ( SURFACE-AT ?auto_1635478 ?auto_1635481 ) ( ON ?auto_1635478 ?auto_1635479 ) ( CLEAR ?auto_1635478 ) ( not ( = ?auto_1635477 ?auto_1635479 ) ) ( not ( = ?auto_1635478 ?auto_1635479 ) ) ( not ( = ?auto_1635476 ?auto_1635479 ) ) ( TRUCK-AT ?auto_1635483 ?auto_1635482 ) ( SURFACE-AT ?auto_1635476 ?auto_1635482 ) ( CLEAR ?auto_1635476 ) ( LIFTING ?auto_1635480 ?auto_1635477 ) ( IS-CRATE ?auto_1635477 ) ( ON ?auto_1635468 ?auto_1635467 ) ( ON ?auto_1635469 ?auto_1635468 ) ( ON ?auto_1635466 ?auto_1635469 ) ( ON ?auto_1635470 ?auto_1635466 ) ( ON ?auto_1635472 ?auto_1635470 ) ( ON ?auto_1635471 ?auto_1635472 ) ( ON ?auto_1635473 ?auto_1635471 ) ( ON ?auto_1635474 ?auto_1635473 ) ( ON ?auto_1635475 ?auto_1635474 ) ( ON ?auto_1635476 ?auto_1635475 ) ( not ( = ?auto_1635467 ?auto_1635468 ) ) ( not ( = ?auto_1635467 ?auto_1635469 ) ) ( not ( = ?auto_1635467 ?auto_1635466 ) ) ( not ( = ?auto_1635467 ?auto_1635470 ) ) ( not ( = ?auto_1635467 ?auto_1635472 ) ) ( not ( = ?auto_1635467 ?auto_1635471 ) ) ( not ( = ?auto_1635467 ?auto_1635473 ) ) ( not ( = ?auto_1635467 ?auto_1635474 ) ) ( not ( = ?auto_1635467 ?auto_1635475 ) ) ( not ( = ?auto_1635467 ?auto_1635476 ) ) ( not ( = ?auto_1635467 ?auto_1635477 ) ) ( not ( = ?auto_1635467 ?auto_1635478 ) ) ( not ( = ?auto_1635467 ?auto_1635479 ) ) ( not ( = ?auto_1635468 ?auto_1635469 ) ) ( not ( = ?auto_1635468 ?auto_1635466 ) ) ( not ( = ?auto_1635468 ?auto_1635470 ) ) ( not ( = ?auto_1635468 ?auto_1635472 ) ) ( not ( = ?auto_1635468 ?auto_1635471 ) ) ( not ( = ?auto_1635468 ?auto_1635473 ) ) ( not ( = ?auto_1635468 ?auto_1635474 ) ) ( not ( = ?auto_1635468 ?auto_1635475 ) ) ( not ( = ?auto_1635468 ?auto_1635476 ) ) ( not ( = ?auto_1635468 ?auto_1635477 ) ) ( not ( = ?auto_1635468 ?auto_1635478 ) ) ( not ( = ?auto_1635468 ?auto_1635479 ) ) ( not ( = ?auto_1635469 ?auto_1635466 ) ) ( not ( = ?auto_1635469 ?auto_1635470 ) ) ( not ( = ?auto_1635469 ?auto_1635472 ) ) ( not ( = ?auto_1635469 ?auto_1635471 ) ) ( not ( = ?auto_1635469 ?auto_1635473 ) ) ( not ( = ?auto_1635469 ?auto_1635474 ) ) ( not ( = ?auto_1635469 ?auto_1635475 ) ) ( not ( = ?auto_1635469 ?auto_1635476 ) ) ( not ( = ?auto_1635469 ?auto_1635477 ) ) ( not ( = ?auto_1635469 ?auto_1635478 ) ) ( not ( = ?auto_1635469 ?auto_1635479 ) ) ( not ( = ?auto_1635466 ?auto_1635470 ) ) ( not ( = ?auto_1635466 ?auto_1635472 ) ) ( not ( = ?auto_1635466 ?auto_1635471 ) ) ( not ( = ?auto_1635466 ?auto_1635473 ) ) ( not ( = ?auto_1635466 ?auto_1635474 ) ) ( not ( = ?auto_1635466 ?auto_1635475 ) ) ( not ( = ?auto_1635466 ?auto_1635476 ) ) ( not ( = ?auto_1635466 ?auto_1635477 ) ) ( not ( = ?auto_1635466 ?auto_1635478 ) ) ( not ( = ?auto_1635466 ?auto_1635479 ) ) ( not ( = ?auto_1635470 ?auto_1635472 ) ) ( not ( = ?auto_1635470 ?auto_1635471 ) ) ( not ( = ?auto_1635470 ?auto_1635473 ) ) ( not ( = ?auto_1635470 ?auto_1635474 ) ) ( not ( = ?auto_1635470 ?auto_1635475 ) ) ( not ( = ?auto_1635470 ?auto_1635476 ) ) ( not ( = ?auto_1635470 ?auto_1635477 ) ) ( not ( = ?auto_1635470 ?auto_1635478 ) ) ( not ( = ?auto_1635470 ?auto_1635479 ) ) ( not ( = ?auto_1635472 ?auto_1635471 ) ) ( not ( = ?auto_1635472 ?auto_1635473 ) ) ( not ( = ?auto_1635472 ?auto_1635474 ) ) ( not ( = ?auto_1635472 ?auto_1635475 ) ) ( not ( = ?auto_1635472 ?auto_1635476 ) ) ( not ( = ?auto_1635472 ?auto_1635477 ) ) ( not ( = ?auto_1635472 ?auto_1635478 ) ) ( not ( = ?auto_1635472 ?auto_1635479 ) ) ( not ( = ?auto_1635471 ?auto_1635473 ) ) ( not ( = ?auto_1635471 ?auto_1635474 ) ) ( not ( = ?auto_1635471 ?auto_1635475 ) ) ( not ( = ?auto_1635471 ?auto_1635476 ) ) ( not ( = ?auto_1635471 ?auto_1635477 ) ) ( not ( = ?auto_1635471 ?auto_1635478 ) ) ( not ( = ?auto_1635471 ?auto_1635479 ) ) ( not ( = ?auto_1635473 ?auto_1635474 ) ) ( not ( = ?auto_1635473 ?auto_1635475 ) ) ( not ( = ?auto_1635473 ?auto_1635476 ) ) ( not ( = ?auto_1635473 ?auto_1635477 ) ) ( not ( = ?auto_1635473 ?auto_1635478 ) ) ( not ( = ?auto_1635473 ?auto_1635479 ) ) ( not ( = ?auto_1635474 ?auto_1635475 ) ) ( not ( = ?auto_1635474 ?auto_1635476 ) ) ( not ( = ?auto_1635474 ?auto_1635477 ) ) ( not ( = ?auto_1635474 ?auto_1635478 ) ) ( not ( = ?auto_1635474 ?auto_1635479 ) ) ( not ( = ?auto_1635475 ?auto_1635476 ) ) ( not ( = ?auto_1635475 ?auto_1635477 ) ) ( not ( = ?auto_1635475 ?auto_1635478 ) ) ( not ( = ?auto_1635475 ?auto_1635479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635476 ?auto_1635477 ?auto_1635478 )
      ( MAKE-12CRATE-VERIFY ?auto_1635467 ?auto_1635468 ?auto_1635469 ?auto_1635466 ?auto_1635470 ?auto_1635472 ?auto_1635471 ?auto_1635473 ?auto_1635474 ?auto_1635475 ?auto_1635476 ?auto_1635477 ?auto_1635478 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635630 - SURFACE
      ?auto_1635631 - SURFACE
      ?auto_1635632 - SURFACE
      ?auto_1635629 - SURFACE
      ?auto_1635633 - SURFACE
      ?auto_1635635 - SURFACE
      ?auto_1635634 - SURFACE
      ?auto_1635636 - SURFACE
      ?auto_1635637 - SURFACE
      ?auto_1635638 - SURFACE
      ?auto_1635639 - SURFACE
      ?auto_1635640 - SURFACE
      ?auto_1635641 - SURFACE
    )
    :vars
    (
      ?auto_1635644 - HOIST
      ?auto_1635642 - PLACE
      ?auto_1635647 - PLACE
      ?auto_1635643 - HOIST
      ?auto_1635646 - SURFACE
      ?auto_1635645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635644 ?auto_1635642 ) ( IS-CRATE ?auto_1635641 ) ( not ( = ?auto_1635640 ?auto_1635641 ) ) ( not ( = ?auto_1635639 ?auto_1635640 ) ) ( not ( = ?auto_1635639 ?auto_1635641 ) ) ( not ( = ?auto_1635647 ?auto_1635642 ) ) ( HOIST-AT ?auto_1635643 ?auto_1635647 ) ( not ( = ?auto_1635644 ?auto_1635643 ) ) ( AVAILABLE ?auto_1635643 ) ( SURFACE-AT ?auto_1635641 ?auto_1635647 ) ( ON ?auto_1635641 ?auto_1635646 ) ( CLEAR ?auto_1635641 ) ( not ( = ?auto_1635640 ?auto_1635646 ) ) ( not ( = ?auto_1635641 ?auto_1635646 ) ) ( not ( = ?auto_1635639 ?auto_1635646 ) ) ( TRUCK-AT ?auto_1635645 ?auto_1635642 ) ( SURFACE-AT ?auto_1635639 ?auto_1635642 ) ( CLEAR ?auto_1635639 ) ( IS-CRATE ?auto_1635640 ) ( AVAILABLE ?auto_1635644 ) ( IN ?auto_1635640 ?auto_1635645 ) ( ON ?auto_1635631 ?auto_1635630 ) ( ON ?auto_1635632 ?auto_1635631 ) ( ON ?auto_1635629 ?auto_1635632 ) ( ON ?auto_1635633 ?auto_1635629 ) ( ON ?auto_1635635 ?auto_1635633 ) ( ON ?auto_1635634 ?auto_1635635 ) ( ON ?auto_1635636 ?auto_1635634 ) ( ON ?auto_1635637 ?auto_1635636 ) ( ON ?auto_1635638 ?auto_1635637 ) ( ON ?auto_1635639 ?auto_1635638 ) ( not ( = ?auto_1635630 ?auto_1635631 ) ) ( not ( = ?auto_1635630 ?auto_1635632 ) ) ( not ( = ?auto_1635630 ?auto_1635629 ) ) ( not ( = ?auto_1635630 ?auto_1635633 ) ) ( not ( = ?auto_1635630 ?auto_1635635 ) ) ( not ( = ?auto_1635630 ?auto_1635634 ) ) ( not ( = ?auto_1635630 ?auto_1635636 ) ) ( not ( = ?auto_1635630 ?auto_1635637 ) ) ( not ( = ?auto_1635630 ?auto_1635638 ) ) ( not ( = ?auto_1635630 ?auto_1635639 ) ) ( not ( = ?auto_1635630 ?auto_1635640 ) ) ( not ( = ?auto_1635630 ?auto_1635641 ) ) ( not ( = ?auto_1635630 ?auto_1635646 ) ) ( not ( = ?auto_1635631 ?auto_1635632 ) ) ( not ( = ?auto_1635631 ?auto_1635629 ) ) ( not ( = ?auto_1635631 ?auto_1635633 ) ) ( not ( = ?auto_1635631 ?auto_1635635 ) ) ( not ( = ?auto_1635631 ?auto_1635634 ) ) ( not ( = ?auto_1635631 ?auto_1635636 ) ) ( not ( = ?auto_1635631 ?auto_1635637 ) ) ( not ( = ?auto_1635631 ?auto_1635638 ) ) ( not ( = ?auto_1635631 ?auto_1635639 ) ) ( not ( = ?auto_1635631 ?auto_1635640 ) ) ( not ( = ?auto_1635631 ?auto_1635641 ) ) ( not ( = ?auto_1635631 ?auto_1635646 ) ) ( not ( = ?auto_1635632 ?auto_1635629 ) ) ( not ( = ?auto_1635632 ?auto_1635633 ) ) ( not ( = ?auto_1635632 ?auto_1635635 ) ) ( not ( = ?auto_1635632 ?auto_1635634 ) ) ( not ( = ?auto_1635632 ?auto_1635636 ) ) ( not ( = ?auto_1635632 ?auto_1635637 ) ) ( not ( = ?auto_1635632 ?auto_1635638 ) ) ( not ( = ?auto_1635632 ?auto_1635639 ) ) ( not ( = ?auto_1635632 ?auto_1635640 ) ) ( not ( = ?auto_1635632 ?auto_1635641 ) ) ( not ( = ?auto_1635632 ?auto_1635646 ) ) ( not ( = ?auto_1635629 ?auto_1635633 ) ) ( not ( = ?auto_1635629 ?auto_1635635 ) ) ( not ( = ?auto_1635629 ?auto_1635634 ) ) ( not ( = ?auto_1635629 ?auto_1635636 ) ) ( not ( = ?auto_1635629 ?auto_1635637 ) ) ( not ( = ?auto_1635629 ?auto_1635638 ) ) ( not ( = ?auto_1635629 ?auto_1635639 ) ) ( not ( = ?auto_1635629 ?auto_1635640 ) ) ( not ( = ?auto_1635629 ?auto_1635641 ) ) ( not ( = ?auto_1635629 ?auto_1635646 ) ) ( not ( = ?auto_1635633 ?auto_1635635 ) ) ( not ( = ?auto_1635633 ?auto_1635634 ) ) ( not ( = ?auto_1635633 ?auto_1635636 ) ) ( not ( = ?auto_1635633 ?auto_1635637 ) ) ( not ( = ?auto_1635633 ?auto_1635638 ) ) ( not ( = ?auto_1635633 ?auto_1635639 ) ) ( not ( = ?auto_1635633 ?auto_1635640 ) ) ( not ( = ?auto_1635633 ?auto_1635641 ) ) ( not ( = ?auto_1635633 ?auto_1635646 ) ) ( not ( = ?auto_1635635 ?auto_1635634 ) ) ( not ( = ?auto_1635635 ?auto_1635636 ) ) ( not ( = ?auto_1635635 ?auto_1635637 ) ) ( not ( = ?auto_1635635 ?auto_1635638 ) ) ( not ( = ?auto_1635635 ?auto_1635639 ) ) ( not ( = ?auto_1635635 ?auto_1635640 ) ) ( not ( = ?auto_1635635 ?auto_1635641 ) ) ( not ( = ?auto_1635635 ?auto_1635646 ) ) ( not ( = ?auto_1635634 ?auto_1635636 ) ) ( not ( = ?auto_1635634 ?auto_1635637 ) ) ( not ( = ?auto_1635634 ?auto_1635638 ) ) ( not ( = ?auto_1635634 ?auto_1635639 ) ) ( not ( = ?auto_1635634 ?auto_1635640 ) ) ( not ( = ?auto_1635634 ?auto_1635641 ) ) ( not ( = ?auto_1635634 ?auto_1635646 ) ) ( not ( = ?auto_1635636 ?auto_1635637 ) ) ( not ( = ?auto_1635636 ?auto_1635638 ) ) ( not ( = ?auto_1635636 ?auto_1635639 ) ) ( not ( = ?auto_1635636 ?auto_1635640 ) ) ( not ( = ?auto_1635636 ?auto_1635641 ) ) ( not ( = ?auto_1635636 ?auto_1635646 ) ) ( not ( = ?auto_1635637 ?auto_1635638 ) ) ( not ( = ?auto_1635637 ?auto_1635639 ) ) ( not ( = ?auto_1635637 ?auto_1635640 ) ) ( not ( = ?auto_1635637 ?auto_1635641 ) ) ( not ( = ?auto_1635637 ?auto_1635646 ) ) ( not ( = ?auto_1635638 ?auto_1635639 ) ) ( not ( = ?auto_1635638 ?auto_1635640 ) ) ( not ( = ?auto_1635638 ?auto_1635641 ) ) ( not ( = ?auto_1635638 ?auto_1635646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635639 ?auto_1635640 ?auto_1635641 )
      ( MAKE-12CRATE-VERIFY ?auto_1635630 ?auto_1635631 ?auto_1635632 ?auto_1635629 ?auto_1635633 ?auto_1635635 ?auto_1635634 ?auto_1635636 ?auto_1635637 ?auto_1635638 ?auto_1635639 ?auto_1635640 ?auto_1635641 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647214 - SURFACE
      ?auto_1647215 - SURFACE
      ?auto_1647216 - SURFACE
      ?auto_1647213 - SURFACE
      ?auto_1647217 - SURFACE
      ?auto_1647219 - SURFACE
      ?auto_1647218 - SURFACE
      ?auto_1647220 - SURFACE
      ?auto_1647221 - SURFACE
      ?auto_1647222 - SURFACE
      ?auto_1647223 - SURFACE
      ?auto_1647224 - SURFACE
      ?auto_1647225 - SURFACE
      ?auto_1647226 - SURFACE
    )
    :vars
    (
      ?auto_1647227 - HOIST
      ?auto_1647228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647227 ?auto_1647228 ) ( SURFACE-AT ?auto_1647225 ?auto_1647228 ) ( CLEAR ?auto_1647225 ) ( LIFTING ?auto_1647227 ?auto_1647226 ) ( IS-CRATE ?auto_1647226 ) ( not ( = ?auto_1647225 ?auto_1647226 ) ) ( ON ?auto_1647215 ?auto_1647214 ) ( ON ?auto_1647216 ?auto_1647215 ) ( ON ?auto_1647213 ?auto_1647216 ) ( ON ?auto_1647217 ?auto_1647213 ) ( ON ?auto_1647219 ?auto_1647217 ) ( ON ?auto_1647218 ?auto_1647219 ) ( ON ?auto_1647220 ?auto_1647218 ) ( ON ?auto_1647221 ?auto_1647220 ) ( ON ?auto_1647222 ?auto_1647221 ) ( ON ?auto_1647223 ?auto_1647222 ) ( ON ?auto_1647224 ?auto_1647223 ) ( ON ?auto_1647225 ?auto_1647224 ) ( not ( = ?auto_1647214 ?auto_1647215 ) ) ( not ( = ?auto_1647214 ?auto_1647216 ) ) ( not ( = ?auto_1647214 ?auto_1647213 ) ) ( not ( = ?auto_1647214 ?auto_1647217 ) ) ( not ( = ?auto_1647214 ?auto_1647219 ) ) ( not ( = ?auto_1647214 ?auto_1647218 ) ) ( not ( = ?auto_1647214 ?auto_1647220 ) ) ( not ( = ?auto_1647214 ?auto_1647221 ) ) ( not ( = ?auto_1647214 ?auto_1647222 ) ) ( not ( = ?auto_1647214 ?auto_1647223 ) ) ( not ( = ?auto_1647214 ?auto_1647224 ) ) ( not ( = ?auto_1647214 ?auto_1647225 ) ) ( not ( = ?auto_1647214 ?auto_1647226 ) ) ( not ( = ?auto_1647215 ?auto_1647216 ) ) ( not ( = ?auto_1647215 ?auto_1647213 ) ) ( not ( = ?auto_1647215 ?auto_1647217 ) ) ( not ( = ?auto_1647215 ?auto_1647219 ) ) ( not ( = ?auto_1647215 ?auto_1647218 ) ) ( not ( = ?auto_1647215 ?auto_1647220 ) ) ( not ( = ?auto_1647215 ?auto_1647221 ) ) ( not ( = ?auto_1647215 ?auto_1647222 ) ) ( not ( = ?auto_1647215 ?auto_1647223 ) ) ( not ( = ?auto_1647215 ?auto_1647224 ) ) ( not ( = ?auto_1647215 ?auto_1647225 ) ) ( not ( = ?auto_1647215 ?auto_1647226 ) ) ( not ( = ?auto_1647216 ?auto_1647213 ) ) ( not ( = ?auto_1647216 ?auto_1647217 ) ) ( not ( = ?auto_1647216 ?auto_1647219 ) ) ( not ( = ?auto_1647216 ?auto_1647218 ) ) ( not ( = ?auto_1647216 ?auto_1647220 ) ) ( not ( = ?auto_1647216 ?auto_1647221 ) ) ( not ( = ?auto_1647216 ?auto_1647222 ) ) ( not ( = ?auto_1647216 ?auto_1647223 ) ) ( not ( = ?auto_1647216 ?auto_1647224 ) ) ( not ( = ?auto_1647216 ?auto_1647225 ) ) ( not ( = ?auto_1647216 ?auto_1647226 ) ) ( not ( = ?auto_1647213 ?auto_1647217 ) ) ( not ( = ?auto_1647213 ?auto_1647219 ) ) ( not ( = ?auto_1647213 ?auto_1647218 ) ) ( not ( = ?auto_1647213 ?auto_1647220 ) ) ( not ( = ?auto_1647213 ?auto_1647221 ) ) ( not ( = ?auto_1647213 ?auto_1647222 ) ) ( not ( = ?auto_1647213 ?auto_1647223 ) ) ( not ( = ?auto_1647213 ?auto_1647224 ) ) ( not ( = ?auto_1647213 ?auto_1647225 ) ) ( not ( = ?auto_1647213 ?auto_1647226 ) ) ( not ( = ?auto_1647217 ?auto_1647219 ) ) ( not ( = ?auto_1647217 ?auto_1647218 ) ) ( not ( = ?auto_1647217 ?auto_1647220 ) ) ( not ( = ?auto_1647217 ?auto_1647221 ) ) ( not ( = ?auto_1647217 ?auto_1647222 ) ) ( not ( = ?auto_1647217 ?auto_1647223 ) ) ( not ( = ?auto_1647217 ?auto_1647224 ) ) ( not ( = ?auto_1647217 ?auto_1647225 ) ) ( not ( = ?auto_1647217 ?auto_1647226 ) ) ( not ( = ?auto_1647219 ?auto_1647218 ) ) ( not ( = ?auto_1647219 ?auto_1647220 ) ) ( not ( = ?auto_1647219 ?auto_1647221 ) ) ( not ( = ?auto_1647219 ?auto_1647222 ) ) ( not ( = ?auto_1647219 ?auto_1647223 ) ) ( not ( = ?auto_1647219 ?auto_1647224 ) ) ( not ( = ?auto_1647219 ?auto_1647225 ) ) ( not ( = ?auto_1647219 ?auto_1647226 ) ) ( not ( = ?auto_1647218 ?auto_1647220 ) ) ( not ( = ?auto_1647218 ?auto_1647221 ) ) ( not ( = ?auto_1647218 ?auto_1647222 ) ) ( not ( = ?auto_1647218 ?auto_1647223 ) ) ( not ( = ?auto_1647218 ?auto_1647224 ) ) ( not ( = ?auto_1647218 ?auto_1647225 ) ) ( not ( = ?auto_1647218 ?auto_1647226 ) ) ( not ( = ?auto_1647220 ?auto_1647221 ) ) ( not ( = ?auto_1647220 ?auto_1647222 ) ) ( not ( = ?auto_1647220 ?auto_1647223 ) ) ( not ( = ?auto_1647220 ?auto_1647224 ) ) ( not ( = ?auto_1647220 ?auto_1647225 ) ) ( not ( = ?auto_1647220 ?auto_1647226 ) ) ( not ( = ?auto_1647221 ?auto_1647222 ) ) ( not ( = ?auto_1647221 ?auto_1647223 ) ) ( not ( = ?auto_1647221 ?auto_1647224 ) ) ( not ( = ?auto_1647221 ?auto_1647225 ) ) ( not ( = ?auto_1647221 ?auto_1647226 ) ) ( not ( = ?auto_1647222 ?auto_1647223 ) ) ( not ( = ?auto_1647222 ?auto_1647224 ) ) ( not ( = ?auto_1647222 ?auto_1647225 ) ) ( not ( = ?auto_1647222 ?auto_1647226 ) ) ( not ( = ?auto_1647223 ?auto_1647224 ) ) ( not ( = ?auto_1647223 ?auto_1647225 ) ) ( not ( = ?auto_1647223 ?auto_1647226 ) ) ( not ( = ?auto_1647224 ?auto_1647225 ) ) ( not ( = ?auto_1647224 ?auto_1647226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1647225 ?auto_1647226 )
      ( MAKE-13CRATE-VERIFY ?auto_1647214 ?auto_1647215 ?auto_1647216 ?auto_1647213 ?auto_1647217 ?auto_1647219 ?auto_1647218 ?auto_1647220 ?auto_1647221 ?auto_1647222 ?auto_1647223 ?auto_1647224 ?auto_1647225 ?auto_1647226 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647356 - SURFACE
      ?auto_1647357 - SURFACE
      ?auto_1647358 - SURFACE
      ?auto_1647355 - SURFACE
      ?auto_1647359 - SURFACE
      ?auto_1647361 - SURFACE
      ?auto_1647360 - SURFACE
      ?auto_1647362 - SURFACE
      ?auto_1647363 - SURFACE
      ?auto_1647364 - SURFACE
      ?auto_1647365 - SURFACE
      ?auto_1647366 - SURFACE
      ?auto_1647367 - SURFACE
      ?auto_1647368 - SURFACE
    )
    :vars
    (
      ?auto_1647369 - HOIST
      ?auto_1647370 - PLACE
      ?auto_1647371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647369 ?auto_1647370 ) ( SURFACE-AT ?auto_1647367 ?auto_1647370 ) ( CLEAR ?auto_1647367 ) ( IS-CRATE ?auto_1647368 ) ( not ( = ?auto_1647367 ?auto_1647368 ) ) ( TRUCK-AT ?auto_1647371 ?auto_1647370 ) ( AVAILABLE ?auto_1647369 ) ( IN ?auto_1647368 ?auto_1647371 ) ( ON ?auto_1647367 ?auto_1647366 ) ( not ( = ?auto_1647366 ?auto_1647367 ) ) ( not ( = ?auto_1647366 ?auto_1647368 ) ) ( ON ?auto_1647357 ?auto_1647356 ) ( ON ?auto_1647358 ?auto_1647357 ) ( ON ?auto_1647355 ?auto_1647358 ) ( ON ?auto_1647359 ?auto_1647355 ) ( ON ?auto_1647361 ?auto_1647359 ) ( ON ?auto_1647360 ?auto_1647361 ) ( ON ?auto_1647362 ?auto_1647360 ) ( ON ?auto_1647363 ?auto_1647362 ) ( ON ?auto_1647364 ?auto_1647363 ) ( ON ?auto_1647365 ?auto_1647364 ) ( ON ?auto_1647366 ?auto_1647365 ) ( not ( = ?auto_1647356 ?auto_1647357 ) ) ( not ( = ?auto_1647356 ?auto_1647358 ) ) ( not ( = ?auto_1647356 ?auto_1647355 ) ) ( not ( = ?auto_1647356 ?auto_1647359 ) ) ( not ( = ?auto_1647356 ?auto_1647361 ) ) ( not ( = ?auto_1647356 ?auto_1647360 ) ) ( not ( = ?auto_1647356 ?auto_1647362 ) ) ( not ( = ?auto_1647356 ?auto_1647363 ) ) ( not ( = ?auto_1647356 ?auto_1647364 ) ) ( not ( = ?auto_1647356 ?auto_1647365 ) ) ( not ( = ?auto_1647356 ?auto_1647366 ) ) ( not ( = ?auto_1647356 ?auto_1647367 ) ) ( not ( = ?auto_1647356 ?auto_1647368 ) ) ( not ( = ?auto_1647357 ?auto_1647358 ) ) ( not ( = ?auto_1647357 ?auto_1647355 ) ) ( not ( = ?auto_1647357 ?auto_1647359 ) ) ( not ( = ?auto_1647357 ?auto_1647361 ) ) ( not ( = ?auto_1647357 ?auto_1647360 ) ) ( not ( = ?auto_1647357 ?auto_1647362 ) ) ( not ( = ?auto_1647357 ?auto_1647363 ) ) ( not ( = ?auto_1647357 ?auto_1647364 ) ) ( not ( = ?auto_1647357 ?auto_1647365 ) ) ( not ( = ?auto_1647357 ?auto_1647366 ) ) ( not ( = ?auto_1647357 ?auto_1647367 ) ) ( not ( = ?auto_1647357 ?auto_1647368 ) ) ( not ( = ?auto_1647358 ?auto_1647355 ) ) ( not ( = ?auto_1647358 ?auto_1647359 ) ) ( not ( = ?auto_1647358 ?auto_1647361 ) ) ( not ( = ?auto_1647358 ?auto_1647360 ) ) ( not ( = ?auto_1647358 ?auto_1647362 ) ) ( not ( = ?auto_1647358 ?auto_1647363 ) ) ( not ( = ?auto_1647358 ?auto_1647364 ) ) ( not ( = ?auto_1647358 ?auto_1647365 ) ) ( not ( = ?auto_1647358 ?auto_1647366 ) ) ( not ( = ?auto_1647358 ?auto_1647367 ) ) ( not ( = ?auto_1647358 ?auto_1647368 ) ) ( not ( = ?auto_1647355 ?auto_1647359 ) ) ( not ( = ?auto_1647355 ?auto_1647361 ) ) ( not ( = ?auto_1647355 ?auto_1647360 ) ) ( not ( = ?auto_1647355 ?auto_1647362 ) ) ( not ( = ?auto_1647355 ?auto_1647363 ) ) ( not ( = ?auto_1647355 ?auto_1647364 ) ) ( not ( = ?auto_1647355 ?auto_1647365 ) ) ( not ( = ?auto_1647355 ?auto_1647366 ) ) ( not ( = ?auto_1647355 ?auto_1647367 ) ) ( not ( = ?auto_1647355 ?auto_1647368 ) ) ( not ( = ?auto_1647359 ?auto_1647361 ) ) ( not ( = ?auto_1647359 ?auto_1647360 ) ) ( not ( = ?auto_1647359 ?auto_1647362 ) ) ( not ( = ?auto_1647359 ?auto_1647363 ) ) ( not ( = ?auto_1647359 ?auto_1647364 ) ) ( not ( = ?auto_1647359 ?auto_1647365 ) ) ( not ( = ?auto_1647359 ?auto_1647366 ) ) ( not ( = ?auto_1647359 ?auto_1647367 ) ) ( not ( = ?auto_1647359 ?auto_1647368 ) ) ( not ( = ?auto_1647361 ?auto_1647360 ) ) ( not ( = ?auto_1647361 ?auto_1647362 ) ) ( not ( = ?auto_1647361 ?auto_1647363 ) ) ( not ( = ?auto_1647361 ?auto_1647364 ) ) ( not ( = ?auto_1647361 ?auto_1647365 ) ) ( not ( = ?auto_1647361 ?auto_1647366 ) ) ( not ( = ?auto_1647361 ?auto_1647367 ) ) ( not ( = ?auto_1647361 ?auto_1647368 ) ) ( not ( = ?auto_1647360 ?auto_1647362 ) ) ( not ( = ?auto_1647360 ?auto_1647363 ) ) ( not ( = ?auto_1647360 ?auto_1647364 ) ) ( not ( = ?auto_1647360 ?auto_1647365 ) ) ( not ( = ?auto_1647360 ?auto_1647366 ) ) ( not ( = ?auto_1647360 ?auto_1647367 ) ) ( not ( = ?auto_1647360 ?auto_1647368 ) ) ( not ( = ?auto_1647362 ?auto_1647363 ) ) ( not ( = ?auto_1647362 ?auto_1647364 ) ) ( not ( = ?auto_1647362 ?auto_1647365 ) ) ( not ( = ?auto_1647362 ?auto_1647366 ) ) ( not ( = ?auto_1647362 ?auto_1647367 ) ) ( not ( = ?auto_1647362 ?auto_1647368 ) ) ( not ( = ?auto_1647363 ?auto_1647364 ) ) ( not ( = ?auto_1647363 ?auto_1647365 ) ) ( not ( = ?auto_1647363 ?auto_1647366 ) ) ( not ( = ?auto_1647363 ?auto_1647367 ) ) ( not ( = ?auto_1647363 ?auto_1647368 ) ) ( not ( = ?auto_1647364 ?auto_1647365 ) ) ( not ( = ?auto_1647364 ?auto_1647366 ) ) ( not ( = ?auto_1647364 ?auto_1647367 ) ) ( not ( = ?auto_1647364 ?auto_1647368 ) ) ( not ( = ?auto_1647365 ?auto_1647366 ) ) ( not ( = ?auto_1647365 ?auto_1647367 ) ) ( not ( = ?auto_1647365 ?auto_1647368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647366 ?auto_1647367 ?auto_1647368 )
      ( MAKE-13CRATE-VERIFY ?auto_1647356 ?auto_1647357 ?auto_1647358 ?auto_1647355 ?auto_1647359 ?auto_1647361 ?auto_1647360 ?auto_1647362 ?auto_1647363 ?auto_1647364 ?auto_1647365 ?auto_1647366 ?auto_1647367 ?auto_1647368 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647512 - SURFACE
      ?auto_1647513 - SURFACE
      ?auto_1647514 - SURFACE
      ?auto_1647511 - SURFACE
      ?auto_1647515 - SURFACE
      ?auto_1647517 - SURFACE
      ?auto_1647516 - SURFACE
      ?auto_1647518 - SURFACE
      ?auto_1647519 - SURFACE
      ?auto_1647520 - SURFACE
      ?auto_1647521 - SURFACE
      ?auto_1647522 - SURFACE
      ?auto_1647523 - SURFACE
      ?auto_1647524 - SURFACE
    )
    :vars
    (
      ?auto_1647527 - HOIST
      ?auto_1647525 - PLACE
      ?auto_1647526 - TRUCK
      ?auto_1647528 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647527 ?auto_1647525 ) ( SURFACE-AT ?auto_1647523 ?auto_1647525 ) ( CLEAR ?auto_1647523 ) ( IS-CRATE ?auto_1647524 ) ( not ( = ?auto_1647523 ?auto_1647524 ) ) ( AVAILABLE ?auto_1647527 ) ( IN ?auto_1647524 ?auto_1647526 ) ( ON ?auto_1647523 ?auto_1647522 ) ( not ( = ?auto_1647522 ?auto_1647523 ) ) ( not ( = ?auto_1647522 ?auto_1647524 ) ) ( TRUCK-AT ?auto_1647526 ?auto_1647528 ) ( not ( = ?auto_1647528 ?auto_1647525 ) ) ( ON ?auto_1647513 ?auto_1647512 ) ( ON ?auto_1647514 ?auto_1647513 ) ( ON ?auto_1647511 ?auto_1647514 ) ( ON ?auto_1647515 ?auto_1647511 ) ( ON ?auto_1647517 ?auto_1647515 ) ( ON ?auto_1647516 ?auto_1647517 ) ( ON ?auto_1647518 ?auto_1647516 ) ( ON ?auto_1647519 ?auto_1647518 ) ( ON ?auto_1647520 ?auto_1647519 ) ( ON ?auto_1647521 ?auto_1647520 ) ( ON ?auto_1647522 ?auto_1647521 ) ( not ( = ?auto_1647512 ?auto_1647513 ) ) ( not ( = ?auto_1647512 ?auto_1647514 ) ) ( not ( = ?auto_1647512 ?auto_1647511 ) ) ( not ( = ?auto_1647512 ?auto_1647515 ) ) ( not ( = ?auto_1647512 ?auto_1647517 ) ) ( not ( = ?auto_1647512 ?auto_1647516 ) ) ( not ( = ?auto_1647512 ?auto_1647518 ) ) ( not ( = ?auto_1647512 ?auto_1647519 ) ) ( not ( = ?auto_1647512 ?auto_1647520 ) ) ( not ( = ?auto_1647512 ?auto_1647521 ) ) ( not ( = ?auto_1647512 ?auto_1647522 ) ) ( not ( = ?auto_1647512 ?auto_1647523 ) ) ( not ( = ?auto_1647512 ?auto_1647524 ) ) ( not ( = ?auto_1647513 ?auto_1647514 ) ) ( not ( = ?auto_1647513 ?auto_1647511 ) ) ( not ( = ?auto_1647513 ?auto_1647515 ) ) ( not ( = ?auto_1647513 ?auto_1647517 ) ) ( not ( = ?auto_1647513 ?auto_1647516 ) ) ( not ( = ?auto_1647513 ?auto_1647518 ) ) ( not ( = ?auto_1647513 ?auto_1647519 ) ) ( not ( = ?auto_1647513 ?auto_1647520 ) ) ( not ( = ?auto_1647513 ?auto_1647521 ) ) ( not ( = ?auto_1647513 ?auto_1647522 ) ) ( not ( = ?auto_1647513 ?auto_1647523 ) ) ( not ( = ?auto_1647513 ?auto_1647524 ) ) ( not ( = ?auto_1647514 ?auto_1647511 ) ) ( not ( = ?auto_1647514 ?auto_1647515 ) ) ( not ( = ?auto_1647514 ?auto_1647517 ) ) ( not ( = ?auto_1647514 ?auto_1647516 ) ) ( not ( = ?auto_1647514 ?auto_1647518 ) ) ( not ( = ?auto_1647514 ?auto_1647519 ) ) ( not ( = ?auto_1647514 ?auto_1647520 ) ) ( not ( = ?auto_1647514 ?auto_1647521 ) ) ( not ( = ?auto_1647514 ?auto_1647522 ) ) ( not ( = ?auto_1647514 ?auto_1647523 ) ) ( not ( = ?auto_1647514 ?auto_1647524 ) ) ( not ( = ?auto_1647511 ?auto_1647515 ) ) ( not ( = ?auto_1647511 ?auto_1647517 ) ) ( not ( = ?auto_1647511 ?auto_1647516 ) ) ( not ( = ?auto_1647511 ?auto_1647518 ) ) ( not ( = ?auto_1647511 ?auto_1647519 ) ) ( not ( = ?auto_1647511 ?auto_1647520 ) ) ( not ( = ?auto_1647511 ?auto_1647521 ) ) ( not ( = ?auto_1647511 ?auto_1647522 ) ) ( not ( = ?auto_1647511 ?auto_1647523 ) ) ( not ( = ?auto_1647511 ?auto_1647524 ) ) ( not ( = ?auto_1647515 ?auto_1647517 ) ) ( not ( = ?auto_1647515 ?auto_1647516 ) ) ( not ( = ?auto_1647515 ?auto_1647518 ) ) ( not ( = ?auto_1647515 ?auto_1647519 ) ) ( not ( = ?auto_1647515 ?auto_1647520 ) ) ( not ( = ?auto_1647515 ?auto_1647521 ) ) ( not ( = ?auto_1647515 ?auto_1647522 ) ) ( not ( = ?auto_1647515 ?auto_1647523 ) ) ( not ( = ?auto_1647515 ?auto_1647524 ) ) ( not ( = ?auto_1647517 ?auto_1647516 ) ) ( not ( = ?auto_1647517 ?auto_1647518 ) ) ( not ( = ?auto_1647517 ?auto_1647519 ) ) ( not ( = ?auto_1647517 ?auto_1647520 ) ) ( not ( = ?auto_1647517 ?auto_1647521 ) ) ( not ( = ?auto_1647517 ?auto_1647522 ) ) ( not ( = ?auto_1647517 ?auto_1647523 ) ) ( not ( = ?auto_1647517 ?auto_1647524 ) ) ( not ( = ?auto_1647516 ?auto_1647518 ) ) ( not ( = ?auto_1647516 ?auto_1647519 ) ) ( not ( = ?auto_1647516 ?auto_1647520 ) ) ( not ( = ?auto_1647516 ?auto_1647521 ) ) ( not ( = ?auto_1647516 ?auto_1647522 ) ) ( not ( = ?auto_1647516 ?auto_1647523 ) ) ( not ( = ?auto_1647516 ?auto_1647524 ) ) ( not ( = ?auto_1647518 ?auto_1647519 ) ) ( not ( = ?auto_1647518 ?auto_1647520 ) ) ( not ( = ?auto_1647518 ?auto_1647521 ) ) ( not ( = ?auto_1647518 ?auto_1647522 ) ) ( not ( = ?auto_1647518 ?auto_1647523 ) ) ( not ( = ?auto_1647518 ?auto_1647524 ) ) ( not ( = ?auto_1647519 ?auto_1647520 ) ) ( not ( = ?auto_1647519 ?auto_1647521 ) ) ( not ( = ?auto_1647519 ?auto_1647522 ) ) ( not ( = ?auto_1647519 ?auto_1647523 ) ) ( not ( = ?auto_1647519 ?auto_1647524 ) ) ( not ( = ?auto_1647520 ?auto_1647521 ) ) ( not ( = ?auto_1647520 ?auto_1647522 ) ) ( not ( = ?auto_1647520 ?auto_1647523 ) ) ( not ( = ?auto_1647520 ?auto_1647524 ) ) ( not ( = ?auto_1647521 ?auto_1647522 ) ) ( not ( = ?auto_1647521 ?auto_1647523 ) ) ( not ( = ?auto_1647521 ?auto_1647524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647522 ?auto_1647523 ?auto_1647524 )
      ( MAKE-13CRATE-VERIFY ?auto_1647512 ?auto_1647513 ?auto_1647514 ?auto_1647511 ?auto_1647515 ?auto_1647517 ?auto_1647516 ?auto_1647518 ?auto_1647519 ?auto_1647520 ?auto_1647521 ?auto_1647522 ?auto_1647523 ?auto_1647524 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647681 - SURFACE
      ?auto_1647682 - SURFACE
      ?auto_1647683 - SURFACE
      ?auto_1647680 - SURFACE
      ?auto_1647684 - SURFACE
      ?auto_1647686 - SURFACE
      ?auto_1647685 - SURFACE
      ?auto_1647687 - SURFACE
      ?auto_1647688 - SURFACE
      ?auto_1647689 - SURFACE
      ?auto_1647690 - SURFACE
      ?auto_1647691 - SURFACE
      ?auto_1647692 - SURFACE
      ?auto_1647693 - SURFACE
    )
    :vars
    (
      ?auto_1647694 - HOIST
      ?auto_1647698 - PLACE
      ?auto_1647697 - TRUCK
      ?auto_1647696 - PLACE
      ?auto_1647695 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647694 ?auto_1647698 ) ( SURFACE-AT ?auto_1647692 ?auto_1647698 ) ( CLEAR ?auto_1647692 ) ( IS-CRATE ?auto_1647693 ) ( not ( = ?auto_1647692 ?auto_1647693 ) ) ( AVAILABLE ?auto_1647694 ) ( ON ?auto_1647692 ?auto_1647691 ) ( not ( = ?auto_1647691 ?auto_1647692 ) ) ( not ( = ?auto_1647691 ?auto_1647693 ) ) ( TRUCK-AT ?auto_1647697 ?auto_1647696 ) ( not ( = ?auto_1647696 ?auto_1647698 ) ) ( HOIST-AT ?auto_1647695 ?auto_1647696 ) ( LIFTING ?auto_1647695 ?auto_1647693 ) ( not ( = ?auto_1647694 ?auto_1647695 ) ) ( ON ?auto_1647682 ?auto_1647681 ) ( ON ?auto_1647683 ?auto_1647682 ) ( ON ?auto_1647680 ?auto_1647683 ) ( ON ?auto_1647684 ?auto_1647680 ) ( ON ?auto_1647686 ?auto_1647684 ) ( ON ?auto_1647685 ?auto_1647686 ) ( ON ?auto_1647687 ?auto_1647685 ) ( ON ?auto_1647688 ?auto_1647687 ) ( ON ?auto_1647689 ?auto_1647688 ) ( ON ?auto_1647690 ?auto_1647689 ) ( ON ?auto_1647691 ?auto_1647690 ) ( not ( = ?auto_1647681 ?auto_1647682 ) ) ( not ( = ?auto_1647681 ?auto_1647683 ) ) ( not ( = ?auto_1647681 ?auto_1647680 ) ) ( not ( = ?auto_1647681 ?auto_1647684 ) ) ( not ( = ?auto_1647681 ?auto_1647686 ) ) ( not ( = ?auto_1647681 ?auto_1647685 ) ) ( not ( = ?auto_1647681 ?auto_1647687 ) ) ( not ( = ?auto_1647681 ?auto_1647688 ) ) ( not ( = ?auto_1647681 ?auto_1647689 ) ) ( not ( = ?auto_1647681 ?auto_1647690 ) ) ( not ( = ?auto_1647681 ?auto_1647691 ) ) ( not ( = ?auto_1647681 ?auto_1647692 ) ) ( not ( = ?auto_1647681 ?auto_1647693 ) ) ( not ( = ?auto_1647682 ?auto_1647683 ) ) ( not ( = ?auto_1647682 ?auto_1647680 ) ) ( not ( = ?auto_1647682 ?auto_1647684 ) ) ( not ( = ?auto_1647682 ?auto_1647686 ) ) ( not ( = ?auto_1647682 ?auto_1647685 ) ) ( not ( = ?auto_1647682 ?auto_1647687 ) ) ( not ( = ?auto_1647682 ?auto_1647688 ) ) ( not ( = ?auto_1647682 ?auto_1647689 ) ) ( not ( = ?auto_1647682 ?auto_1647690 ) ) ( not ( = ?auto_1647682 ?auto_1647691 ) ) ( not ( = ?auto_1647682 ?auto_1647692 ) ) ( not ( = ?auto_1647682 ?auto_1647693 ) ) ( not ( = ?auto_1647683 ?auto_1647680 ) ) ( not ( = ?auto_1647683 ?auto_1647684 ) ) ( not ( = ?auto_1647683 ?auto_1647686 ) ) ( not ( = ?auto_1647683 ?auto_1647685 ) ) ( not ( = ?auto_1647683 ?auto_1647687 ) ) ( not ( = ?auto_1647683 ?auto_1647688 ) ) ( not ( = ?auto_1647683 ?auto_1647689 ) ) ( not ( = ?auto_1647683 ?auto_1647690 ) ) ( not ( = ?auto_1647683 ?auto_1647691 ) ) ( not ( = ?auto_1647683 ?auto_1647692 ) ) ( not ( = ?auto_1647683 ?auto_1647693 ) ) ( not ( = ?auto_1647680 ?auto_1647684 ) ) ( not ( = ?auto_1647680 ?auto_1647686 ) ) ( not ( = ?auto_1647680 ?auto_1647685 ) ) ( not ( = ?auto_1647680 ?auto_1647687 ) ) ( not ( = ?auto_1647680 ?auto_1647688 ) ) ( not ( = ?auto_1647680 ?auto_1647689 ) ) ( not ( = ?auto_1647680 ?auto_1647690 ) ) ( not ( = ?auto_1647680 ?auto_1647691 ) ) ( not ( = ?auto_1647680 ?auto_1647692 ) ) ( not ( = ?auto_1647680 ?auto_1647693 ) ) ( not ( = ?auto_1647684 ?auto_1647686 ) ) ( not ( = ?auto_1647684 ?auto_1647685 ) ) ( not ( = ?auto_1647684 ?auto_1647687 ) ) ( not ( = ?auto_1647684 ?auto_1647688 ) ) ( not ( = ?auto_1647684 ?auto_1647689 ) ) ( not ( = ?auto_1647684 ?auto_1647690 ) ) ( not ( = ?auto_1647684 ?auto_1647691 ) ) ( not ( = ?auto_1647684 ?auto_1647692 ) ) ( not ( = ?auto_1647684 ?auto_1647693 ) ) ( not ( = ?auto_1647686 ?auto_1647685 ) ) ( not ( = ?auto_1647686 ?auto_1647687 ) ) ( not ( = ?auto_1647686 ?auto_1647688 ) ) ( not ( = ?auto_1647686 ?auto_1647689 ) ) ( not ( = ?auto_1647686 ?auto_1647690 ) ) ( not ( = ?auto_1647686 ?auto_1647691 ) ) ( not ( = ?auto_1647686 ?auto_1647692 ) ) ( not ( = ?auto_1647686 ?auto_1647693 ) ) ( not ( = ?auto_1647685 ?auto_1647687 ) ) ( not ( = ?auto_1647685 ?auto_1647688 ) ) ( not ( = ?auto_1647685 ?auto_1647689 ) ) ( not ( = ?auto_1647685 ?auto_1647690 ) ) ( not ( = ?auto_1647685 ?auto_1647691 ) ) ( not ( = ?auto_1647685 ?auto_1647692 ) ) ( not ( = ?auto_1647685 ?auto_1647693 ) ) ( not ( = ?auto_1647687 ?auto_1647688 ) ) ( not ( = ?auto_1647687 ?auto_1647689 ) ) ( not ( = ?auto_1647687 ?auto_1647690 ) ) ( not ( = ?auto_1647687 ?auto_1647691 ) ) ( not ( = ?auto_1647687 ?auto_1647692 ) ) ( not ( = ?auto_1647687 ?auto_1647693 ) ) ( not ( = ?auto_1647688 ?auto_1647689 ) ) ( not ( = ?auto_1647688 ?auto_1647690 ) ) ( not ( = ?auto_1647688 ?auto_1647691 ) ) ( not ( = ?auto_1647688 ?auto_1647692 ) ) ( not ( = ?auto_1647688 ?auto_1647693 ) ) ( not ( = ?auto_1647689 ?auto_1647690 ) ) ( not ( = ?auto_1647689 ?auto_1647691 ) ) ( not ( = ?auto_1647689 ?auto_1647692 ) ) ( not ( = ?auto_1647689 ?auto_1647693 ) ) ( not ( = ?auto_1647690 ?auto_1647691 ) ) ( not ( = ?auto_1647690 ?auto_1647692 ) ) ( not ( = ?auto_1647690 ?auto_1647693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647691 ?auto_1647692 ?auto_1647693 )
      ( MAKE-13CRATE-VERIFY ?auto_1647681 ?auto_1647682 ?auto_1647683 ?auto_1647680 ?auto_1647684 ?auto_1647686 ?auto_1647685 ?auto_1647687 ?auto_1647688 ?auto_1647689 ?auto_1647690 ?auto_1647691 ?auto_1647692 ?auto_1647693 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647863 - SURFACE
      ?auto_1647864 - SURFACE
      ?auto_1647865 - SURFACE
      ?auto_1647862 - SURFACE
      ?auto_1647866 - SURFACE
      ?auto_1647868 - SURFACE
      ?auto_1647867 - SURFACE
      ?auto_1647869 - SURFACE
      ?auto_1647870 - SURFACE
      ?auto_1647871 - SURFACE
      ?auto_1647872 - SURFACE
      ?auto_1647873 - SURFACE
      ?auto_1647874 - SURFACE
      ?auto_1647875 - SURFACE
    )
    :vars
    (
      ?auto_1647880 - HOIST
      ?auto_1647878 - PLACE
      ?auto_1647879 - TRUCK
      ?auto_1647881 - PLACE
      ?auto_1647876 - HOIST
      ?auto_1647877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647880 ?auto_1647878 ) ( SURFACE-AT ?auto_1647874 ?auto_1647878 ) ( CLEAR ?auto_1647874 ) ( IS-CRATE ?auto_1647875 ) ( not ( = ?auto_1647874 ?auto_1647875 ) ) ( AVAILABLE ?auto_1647880 ) ( ON ?auto_1647874 ?auto_1647873 ) ( not ( = ?auto_1647873 ?auto_1647874 ) ) ( not ( = ?auto_1647873 ?auto_1647875 ) ) ( TRUCK-AT ?auto_1647879 ?auto_1647881 ) ( not ( = ?auto_1647881 ?auto_1647878 ) ) ( HOIST-AT ?auto_1647876 ?auto_1647881 ) ( not ( = ?auto_1647880 ?auto_1647876 ) ) ( AVAILABLE ?auto_1647876 ) ( SURFACE-AT ?auto_1647875 ?auto_1647881 ) ( ON ?auto_1647875 ?auto_1647877 ) ( CLEAR ?auto_1647875 ) ( not ( = ?auto_1647874 ?auto_1647877 ) ) ( not ( = ?auto_1647875 ?auto_1647877 ) ) ( not ( = ?auto_1647873 ?auto_1647877 ) ) ( ON ?auto_1647864 ?auto_1647863 ) ( ON ?auto_1647865 ?auto_1647864 ) ( ON ?auto_1647862 ?auto_1647865 ) ( ON ?auto_1647866 ?auto_1647862 ) ( ON ?auto_1647868 ?auto_1647866 ) ( ON ?auto_1647867 ?auto_1647868 ) ( ON ?auto_1647869 ?auto_1647867 ) ( ON ?auto_1647870 ?auto_1647869 ) ( ON ?auto_1647871 ?auto_1647870 ) ( ON ?auto_1647872 ?auto_1647871 ) ( ON ?auto_1647873 ?auto_1647872 ) ( not ( = ?auto_1647863 ?auto_1647864 ) ) ( not ( = ?auto_1647863 ?auto_1647865 ) ) ( not ( = ?auto_1647863 ?auto_1647862 ) ) ( not ( = ?auto_1647863 ?auto_1647866 ) ) ( not ( = ?auto_1647863 ?auto_1647868 ) ) ( not ( = ?auto_1647863 ?auto_1647867 ) ) ( not ( = ?auto_1647863 ?auto_1647869 ) ) ( not ( = ?auto_1647863 ?auto_1647870 ) ) ( not ( = ?auto_1647863 ?auto_1647871 ) ) ( not ( = ?auto_1647863 ?auto_1647872 ) ) ( not ( = ?auto_1647863 ?auto_1647873 ) ) ( not ( = ?auto_1647863 ?auto_1647874 ) ) ( not ( = ?auto_1647863 ?auto_1647875 ) ) ( not ( = ?auto_1647863 ?auto_1647877 ) ) ( not ( = ?auto_1647864 ?auto_1647865 ) ) ( not ( = ?auto_1647864 ?auto_1647862 ) ) ( not ( = ?auto_1647864 ?auto_1647866 ) ) ( not ( = ?auto_1647864 ?auto_1647868 ) ) ( not ( = ?auto_1647864 ?auto_1647867 ) ) ( not ( = ?auto_1647864 ?auto_1647869 ) ) ( not ( = ?auto_1647864 ?auto_1647870 ) ) ( not ( = ?auto_1647864 ?auto_1647871 ) ) ( not ( = ?auto_1647864 ?auto_1647872 ) ) ( not ( = ?auto_1647864 ?auto_1647873 ) ) ( not ( = ?auto_1647864 ?auto_1647874 ) ) ( not ( = ?auto_1647864 ?auto_1647875 ) ) ( not ( = ?auto_1647864 ?auto_1647877 ) ) ( not ( = ?auto_1647865 ?auto_1647862 ) ) ( not ( = ?auto_1647865 ?auto_1647866 ) ) ( not ( = ?auto_1647865 ?auto_1647868 ) ) ( not ( = ?auto_1647865 ?auto_1647867 ) ) ( not ( = ?auto_1647865 ?auto_1647869 ) ) ( not ( = ?auto_1647865 ?auto_1647870 ) ) ( not ( = ?auto_1647865 ?auto_1647871 ) ) ( not ( = ?auto_1647865 ?auto_1647872 ) ) ( not ( = ?auto_1647865 ?auto_1647873 ) ) ( not ( = ?auto_1647865 ?auto_1647874 ) ) ( not ( = ?auto_1647865 ?auto_1647875 ) ) ( not ( = ?auto_1647865 ?auto_1647877 ) ) ( not ( = ?auto_1647862 ?auto_1647866 ) ) ( not ( = ?auto_1647862 ?auto_1647868 ) ) ( not ( = ?auto_1647862 ?auto_1647867 ) ) ( not ( = ?auto_1647862 ?auto_1647869 ) ) ( not ( = ?auto_1647862 ?auto_1647870 ) ) ( not ( = ?auto_1647862 ?auto_1647871 ) ) ( not ( = ?auto_1647862 ?auto_1647872 ) ) ( not ( = ?auto_1647862 ?auto_1647873 ) ) ( not ( = ?auto_1647862 ?auto_1647874 ) ) ( not ( = ?auto_1647862 ?auto_1647875 ) ) ( not ( = ?auto_1647862 ?auto_1647877 ) ) ( not ( = ?auto_1647866 ?auto_1647868 ) ) ( not ( = ?auto_1647866 ?auto_1647867 ) ) ( not ( = ?auto_1647866 ?auto_1647869 ) ) ( not ( = ?auto_1647866 ?auto_1647870 ) ) ( not ( = ?auto_1647866 ?auto_1647871 ) ) ( not ( = ?auto_1647866 ?auto_1647872 ) ) ( not ( = ?auto_1647866 ?auto_1647873 ) ) ( not ( = ?auto_1647866 ?auto_1647874 ) ) ( not ( = ?auto_1647866 ?auto_1647875 ) ) ( not ( = ?auto_1647866 ?auto_1647877 ) ) ( not ( = ?auto_1647868 ?auto_1647867 ) ) ( not ( = ?auto_1647868 ?auto_1647869 ) ) ( not ( = ?auto_1647868 ?auto_1647870 ) ) ( not ( = ?auto_1647868 ?auto_1647871 ) ) ( not ( = ?auto_1647868 ?auto_1647872 ) ) ( not ( = ?auto_1647868 ?auto_1647873 ) ) ( not ( = ?auto_1647868 ?auto_1647874 ) ) ( not ( = ?auto_1647868 ?auto_1647875 ) ) ( not ( = ?auto_1647868 ?auto_1647877 ) ) ( not ( = ?auto_1647867 ?auto_1647869 ) ) ( not ( = ?auto_1647867 ?auto_1647870 ) ) ( not ( = ?auto_1647867 ?auto_1647871 ) ) ( not ( = ?auto_1647867 ?auto_1647872 ) ) ( not ( = ?auto_1647867 ?auto_1647873 ) ) ( not ( = ?auto_1647867 ?auto_1647874 ) ) ( not ( = ?auto_1647867 ?auto_1647875 ) ) ( not ( = ?auto_1647867 ?auto_1647877 ) ) ( not ( = ?auto_1647869 ?auto_1647870 ) ) ( not ( = ?auto_1647869 ?auto_1647871 ) ) ( not ( = ?auto_1647869 ?auto_1647872 ) ) ( not ( = ?auto_1647869 ?auto_1647873 ) ) ( not ( = ?auto_1647869 ?auto_1647874 ) ) ( not ( = ?auto_1647869 ?auto_1647875 ) ) ( not ( = ?auto_1647869 ?auto_1647877 ) ) ( not ( = ?auto_1647870 ?auto_1647871 ) ) ( not ( = ?auto_1647870 ?auto_1647872 ) ) ( not ( = ?auto_1647870 ?auto_1647873 ) ) ( not ( = ?auto_1647870 ?auto_1647874 ) ) ( not ( = ?auto_1647870 ?auto_1647875 ) ) ( not ( = ?auto_1647870 ?auto_1647877 ) ) ( not ( = ?auto_1647871 ?auto_1647872 ) ) ( not ( = ?auto_1647871 ?auto_1647873 ) ) ( not ( = ?auto_1647871 ?auto_1647874 ) ) ( not ( = ?auto_1647871 ?auto_1647875 ) ) ( not ( = ?auto_1647871 ?auto_1647877 ) ) ( not ( = ?auto_1647872 ?auto_1647873 ) ) ( not ( = ?auto_1647872 ?auto_1647874 ) ) ( not ( = ?auto_1647872 ?auto_1647875 ) ) ( not ( = ?auto_1647872 ?auto_1647877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647873 ?auto_1647874 ?auto_1647875 )
      ( MAKE-13CRATE-VERIFY ?auto_1647863 ?auto_1647864 ?auto_1647865 ?auto_1647862 ?auto_1647866 ?auto_1647868 ?auto_1647867 ?auto_1647869 ?auto_1647870 ?auto_1647871 ?auto_1647872 ?auto_1647873 ?auto_1647874 ?auto_1647875 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648046 - SURFACE
      ?auto_1648047 - SURFACE
      ?auto_1648048 - SURFACE
      ?auto_1648045 - SURFACE
      ?auto_1648049 - SURFACE
      ?auto_1648051 - SURFACE
      ?auto_1648050 - SURFACE
      ?auto_1648052 - SURFACE
      ?auto_1648053 - SURFACE
      ?auto_1648054 - SURFACE
      ?auto_1648055 - SURFACE
      ?auto_1648056 - SURFACE
      ?auto_1648057 - SURFACE
      ?auto_1648058 - SURFACE
    )
    :vars
    (
      ?auto_1648063 - HOIST
      ?auto_1648062 - PLACE
      ?auto_1648060 - PLACE
      ?auto_1648064 - HOIST
      ?auto_1648061 - SURFACE
      ?auto_1648059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648063 ?auto_1648062 ) ( SURFACE-AT ?auto_1648057 ?auto_1648062 ) ( CLEAR ?auto_1648057 ) ( IS-CRATE ?auto_1648058 ) ( not ( = ?auto_1648057 ?auto_1648058 ) ) ( AVAILABLE ?auto_1648063 ) ( ON ?auto_1648057 ?auto_1648056 ) ( not ( = ?auto_1648056 ?auto_1648057 ) ) ( not ( = ?auto_1648056 ?auto_1648058 ) ) ( not ( = ?auto_1648060 ?auto_1648062 ) ) ( HOIST-AT ?auto_1648064 ?auto_1648060 ) ( not ( = ?auto_1648063 ?auto_1648064 ) ) ( AVAILABLE ?auto_1648064 ) ( SURFACE-AT ?auto_1648058 ?auto_1648060 ) ( ON ?auto_1648058 ?auto_1648061 ) ( CLEAR ?auto_1648058 ) ( not ( = ?auto_1648057 ?auto_1648061 ) ) ( not ( = ?auto_1648058 ?auto_1648061 ) ) ( not ( = ?auto_1648056 ?auto_1648061 ) ) ( TRUCK-AT ?auto_1648059 ?auto_1648062 ) ( ON ?auto_1648047 ?auto_1648046 ) ( ON ?auto_1648048 ?auto_1648047 ) ( ON ?auto_1648045 ?auto_1648048 ) ( ON ?auto_1648049 ?auto_1648045 ) ( ON ?auto_1648051 ?auto_1648049 ) ( ON ?auto_1648050 ?auto_1648051 ) ( ON ?auto_1648052 ?auto_1648050 ) ( ON ?auto_1648053 ?auto_1648052 ) ( ON ?auto_1648054 ?auto_1648053 ) ( ON ?auto_1648055 ?auto_1648054 ) ( ON ?auto_1648056 ?auto_1648055 ) ( not ( = ?auto_1648046 ?auto_1648047 ) ) ( not ( = ?auto_1648046 ?auto_1648048 ) ) ( not ( = ?auto_1648046 ?auto_1648045 ) ) ( not ( = ?auto_1648046 ?auto_1648049 ) ) ( not ( = ?auto_1648046 ?auto_1648051 ) ) ( not ( = ?auto_1648046 ?auto_1648050 ) ) ( not ( = ?auto_1648046 ?auto_1648052 ) ) ( not ( = ?auto_1648046 ?auto_1648053 ) ) ( not ( = ?auto_1648046 ?auto_1648054 ) ) ( not ( = ?auto_1648046 ?auto_1648055 ) ) ( not ( = ?auto_1648046 ?auto_1648056 ) ) ( not ( = ?auto_1648046 ?auto_1648057 ) ) ( not ( = ?auto_1648046 ?auto_1648058 ) ) ( not ( = ?auto_1648046 ?auto_1648061 ) ) ( not ( = ?auto_1648047 ?auto_1648048 ) ) ( not ( = ?auto_1648047 ?auto_1648045 ) ) ( not ( = ?auto_1648047 ?auto_1648049 ) ) ( not ( = ?auto_1648047 ?auto_1648051 ) ) ( not ( = ?auto_1648047 ?auto_1648050 ) ) ( not ( = ?auto_1648047 ?auto_1648052 ) ) ( not ( = ?auto_1648047 ?auto_1648053 ) ) ( not ( = ?auto_1648047 ?auto_1648054 ) ) ( not ( = ?auto_1648047 ?auto_1648055 ) ) ( not ( = ?auto_1648047 ?auto_1648056 ) ) ( not ( = ?auto_1648047 ?auto_1648057 ) ) ( not ( = ?auto_1648047 ?auto_1648058 ) ) ( not ( = ?auto_1648047 ?auto_1648061 ) ) ( not ( = ?auto_1648048 ?auto_1648045 ) ) ( not ( = ?auto_1648048 ?auto_1648049 ) ) ( not ( = ?auto_1648048 ?auto_1648051 ) ) ( not ( = ?auto_1648048 ?auto_1648050 ) ) ( not ( = ?auto_1648048 ?auto_1648052 ) ) ( not ( = ?auto_1648048 ?auto_1648053 ) ) ( not ( = ?auto_1648048 ?auto_1648054 ) ) ( not ( = ?auto_1648048 ?auto_1648055 ) ) ( not ( = ?auto_1648048 ?auto_1648056 ) ) ( not ( = ?auto_1648048 ?auto_1648057 ) ) ( not ( = ?auto_1648048 ?auto_1648058 ) ) ( not ( = ?auto_1648048 ?auto_1648061 ) ) ( not ( = ?auto_1648045 ?auto_1648049 ) ) ( not ( = ?auto_1648045 ?auto_1648051 ) ) ( not ( = ?auto_1648045 ?auto_1648050 ) ) ( not ( = ?auto_1648045 ?auto_1648052 ) ) ( not ( = ?auto_1648045 ?auto_1648053 ) ) ( not ( = ?auto_1648045 ?auto_1648054 ) ) ( not ( = ?auto_1648045 ?auto_1648055 ) ) ( not ( = ?auto_1648045 ?auto_1648056 ) ) ( not ( = ?auto_1648045 ?auto_1648057 ) ) ( not ( = ?auto_1648045 ?auto_1648058 ) ) ( not ( = ?auto_1648045 ?auto_1648061 ) ) ( not ( = ?auto_1648049 ?auto_1648051 ) ) ( not ( = ?auto_1648049 ?auto_1648050 ) ) ( not ( = ?auto_1648049 ?auto_1648052 ) ) ( not ( = ?auto_1648049 ?auto_1648053 ) ) ( not ( = ?auto_1648049 ?auto_1648054 ) ) ( not ( = ?auto_1648049 ?auto_1648055 ) ) ( not ( = ?auto_1648049 ?auto_1648056 ) ) ( not ( = ?auto_1648049 ?auto_1648057 ) ) ( not ( = ?auto_1648049 ?auto_1648058 ) ) ( not ( = ?auto_1648049 ?auto_1648061 ) ) ( not ( = ?auto_1648051 ?auto_1648050 ) ) ( not ( = ?auto_1648051 ?auto_1648052 ) ) ( not ( = ?auto_1648051 ?auto_1648053 ) ) ( not ( = ?auto_1648051 ?auto_1648054 ) ) ( not ( = ?auto_1648051 ?auto_1648055 ) ) ( not ( = ?auto_1648051 ?auto_1648056 ) ) ( not ( = ?auto_1648051 ?auto_1648057 ) ) ( not ( = ?auto_1648051 ?auto_1648058 ) ) ( not ( = ?auto_1648051 ?auto_1648061 ) ) ( not ( = ?auto_1648050 ?auto_1648052 ) ) ( not ( = ?auto_1648050 ?auto_1648053 ) ) ( not ( = ?auto_1648050 ?auto_1648054 ) ) ( not ( = ?auto_1648050 ?auto_1648055 ) ) ( not ( = ?auto_1648050 ?auto_1648056 ) ) ( not ( = ?auto_1648050 ?auto_1648057 ) ) ( not ( = ?auto_1648050 ?auto_1648058 ) ) ( not ( = ?auto_1648050 ?auto_1648061 ) ) ( not ( = ?auto_1648052 ?auto_1648053 ) ) ( not ( = ?auto_1648052 ?auto_1648054 ) ) ( not ( = ?auto_1648052 ?auto_1648055 ) ) ( not ( = ?auto_1648052 ?auto_1648056 ) ) ( not ( = ?auto_1648052 ?auto_1648057 ) ) ( not ( = ?auto_1648052 ?auto_1648058 ) ) ( not ( = ?auto_1648052 ?auto_1648061 ) ) ( not ( = ?auto_1648053 ?auto_1648054 ) ) ( not ( = ?auto_1648053 ?auto_1648055 ) ) ( not ( = ?auto_1648053 ?auto_1648056 ) ) ( not ( = ?auto_1648053 ?auto_1648057 ) ) ( not ( = ?auto_1648053 ?auto_1648058 ) ) ( not ( = ?auto_1648053 ?auto_1648061 ) ) ( not ( = ?auto_1648054 ?auto_1648055 ) ) ( not ( = ?auto_1648054 ?auto_1648056 ) ) ( not ( = ?auto_1648054 ?auto_1648057 ) ) ( not ( = ?auto_1648054 ?auto_1648058 ) ) ( not ( = ?auto_1648054 ?auto_1648061 ) ) ( not ( = ?auto_1648055 ?auto_1648056 ) ) ( not ( = ?auto_1648055 ?auto_1648057 ) ) ( not ( = ?auto_1648055 ?auto_1648058 ) ) ( not ( = ?auto_1648055 ?auto_1648061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648056 ?auto_1648057 ?auto_1648058 )
      ( MAKE-13CRATE-VERIFY ?auto_1648046 ?auto_1648047 ?auto_1648048 ?auto_1648045 ?auto_1648049 ?auto_1648051 ?auto_1648050 ?auto_1648052 ?auto_1648053 ?auto_1648054 ?auto_1648055 ?auto_1648056 ?auto_1648057 ?auto_1648058 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648229 - SURFACE
      ?auto_1648230 - SURFACE
      ?auto_1648231 - SURFACE
      ?auto_1648228 - SURFACE
      ?auto_1648232 - SURFACE
      ?auto_1648234 - SURFACE
      ?auto_1648233 - SURFACE
      ?auto_1648235 - SURFACE
      ?auto_1648236 - SURFACE
      ?auto_1648237 - SURFACE
      ?auto_1648238 - SURFACE
      ?auto_1648239 - SURFACE
      ?auto_1648240 - SURFACE
      ?auto_1648241 - SURFACE
    )
    :vars
    (
      ?auto_1648245 - HOIST
      ?auto_1648247 - PLACE
      ?auto_1648244 - PLACE
      ?auto_1648243 - HOIST
      ?auto_1648242 - SURFACE
      ?auto_1648246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648245 ?auto_1648247 ) ( IS-CRATE ?auto_1648241 ) ( not ( = ?auto_1648240 ?auto_1648241 ) ) ( not ( = ?auto_1648239 ?auto_1648240 ) ) ( not ( = ?auto_1648239 ?auto_1648241 ) ) ( not ( = ?auto_1648244 ?auto_1648247 ) ) ( HOIST-AT ?auto_1648243 ?auto_1648244 ) ( not ( = ?auto_1648245 ?auto_1648243 ) ) ( AVAILABLE ?auto_1648243 ) ( SURFACE-AT ?auto_1648241 ?auto_1648244 ) ( ON ?auto_1648241 ?auto_1648242 ) ( CLEAR ?auto_1648241 ) ( not ( = ?auto_1648240 ?auto_1648242 ) ) ( not ( = ?auto_1648241 ?auto_1648242 ) ) ( not ( = ?auto_1648239 ?auto_1648242 ) ) ( TRUCK-AT ?auto_1648246 ?auto_1648247 ) ( SURFACE-AT ?auto_1648239 ?auto_1648247 ) ( CLEAR ?auto_1648239 ) ( LIFTING ?auto_1648245 ?auto_1648240 ) ( IS-CRATE ?auto_1648240 ) ( ON ?auto_1648230 ?auto_1648229 ) ( ON ?auto_1648231 ?auto_1648230 ) ( ON ?auto_1648228 ?auto_1648231 ) ( ON ?auto_1648232 ?auto_1648228 ) ( ON ?auto_1648234 ?auto_1648232 ) ( ON ?auto_1648233 ?auto_1648234 ) ( ON ?auto_1648235 ?auto_1648233 ) ( ON ?auto_1648236 ?auto_1648235 ) ( ON ?auto_1648237 ?auto_1648236 ) ( ON ?auto_1648238 ?auto_1648237 ) ( ON ?auto_1648239 ?auto_1648238 ) ( not ( = ?auto_1648229 ?auto_1648230 ) ) ( not ( = ?auto_1648229 ?auto_1648231 ) ) ( not ( = ?auto_1648229 ?auto_1648228 ) ) ( not ( = ?auto_1648229 ?auto_1648232 ) ) ( not ( = ?auto_1648229 ?auto_1648234 ) ) ( not ( = ?auto_1648229 ?auto_1648233 ) ) ( not ( = ?auto_1648229 ?auto_1648235 ) ) ( not ( = ?auto_1648229 ?auto_1648236 ) ) ( not ( = ?auto_1648229 ?auto_1648237 ) ) ( not ( = ?auto_1648229 ?auto_1648238 ) ) ( not ( = ?auto_1648229 ?auto_1648239 ) ) ( not ( = ?auto_1648229 ?auto_1648240 ) ) ( not ( = ?auto_1648229 ?auto_1648241 ) ) ( not ( = ?auto_1648229 ?auto_1648242 ) ) ( not ( = ?auto_1648230 ?auto_1648231 ) ) ( not ( = ?auto_1648230 ?auto_1648228 ) ) ( not ( = ?auto_1648230 ?auto_1648232 ) ) ( not ( = ?auto_1648230 ?auto_1648234 ) ) ( not ( = ?auto_1648230 ?auto_1648233 ) ) ( not ( = ?auto_1648230 ?auto_1648235 ) ) ( not ( = ?auto_1648230 ?auto_1648236 ) ) ( not ( = ?auto_1648230 ?auto_1648237 ) ) ( not ( = ?auto_1648230 ?auto_1648238 ) ) ( not ( = ?auto_1648230 ?auto_1648239 ) ) ( not ( = ?auto_1648230 ?auto_1648240 ) ) ( not ( = ?auto_1648230 ?auto_1648241 ) ) ( not ( = ?auto_1648230 ?auto_1648242 ) ) ( not ( = ?auto_1648231 ?auto_1648228 ) ) ( not ( = ?auto_1648231 ?auto_1648232 ) ) ( not ( = ?auto_1648231 ?auto_1648234 ) ) ( not ( = ?auto_1648231 ?auto_1648233 ) ) ( not ( = ?auto_1648231 ?auto_1648235 ) ) ( not ( = ?auto_1648231 ?auto_1648236 ) ) ( not ( = ?auto_1648231 ?auto_1648237 ) ) ( not ( = ?auto_1648231 ?auto_1648238 ) ) ( not ( = ?auto_1648231 ?auto_1648239 ) ) ( not ( = ?auto_1648231 ?auto_1648240 ) ) ( not ( = ?auto_1648231 ?auto_1648241 ) ) ( not ( = ?auto_1648231 ?auto_1648242 ) ) ( not ( = ?auto_1648228 ?auto_1648232 ) ) ( not ( = ?auto_1648228 ?auto_1648234 ) ) ( not ( = ?auto_1648228 ?auto_1648233 ) ) ( not ( = ?auto_1648228 ?auto_1648235 ) ) ( not ( = ?auto_1648228 ?auto_1648236 ) ) ( not ( = ?auto_1648228 ?auto_1648237 ) ) ( not ( = ?auto_1648228 ?auto_1648238 ) ) ( not ( = ?auto_1648228 ?auto_1648239 ) ) ( not ( = ?auto_1648228 ?auto_1648240 ) ) ( not ( = ?auto_1648228 ?auto_1648241 ) ) ( not ( = ?auto_1648228 ?auto_1648242 ) ) ( not ( = ?auto_1648232 ?auto_1648234 ) ) ( not ( = ?auto_1648232 ?auto_1648233 ) ) ( not ( = ?auto_1648232 ?auto_1648235 ) ) ( not ( = ?auto_1648232 ?auto_1648236 ) ) ( not ( = ?auto_1648232 ?auto_1648237 ) ) ( not ( = ?auto_1648232 ?auto_1648238 ) ) ( not ( = ?auto_1648232 ?auto_1648239 ) ) ( not ( = ?auto_1648232 ?auto_1648240 ) ) ( not ( = ?auto_1648232 ?auto_1648241 ) ) ( not ( = ?auto_1648232 ?auto_1648242 ) ) ( not ( = ?auto_1648234 ?auto_1648233 ) ) ( not ( = ?auto_1648234 ?auto_1648235 ) ) ( not ( = ?auto_1648234 ?auto_1648236 ) ) ( not ( = ?auto_1648234 ?auto_1648237 ) ) ( not ( = ?auto_1648234 ?auto_1648238 ) ) ( not ( = ?auto_1648234 ?auto_1648239 ) ) ( not ( = ?auto_1648234 ?auto_1648240 ) ) ( not ( = ?auto_1648234 ?auto_1648241 ) ) ( not ( = ?auto_1648234 ?auto_1648242 ) ) ( not ( = ?auto_1648233 ?auto_1648235 ) ) ( not ( = ?auto_1648233 ?auto_1648236 ) ) ( not ( = ?auto_1648233 ?auto_1648237 ) ) ( not ( = ?auto_1648233 ?auto_1648238 ) ) ( not ( = ?auto_1648233 ?auto_1648239 ) ) ( not ( = ?auto_1648233 ?auto_1648240 ) ) ( not ( = ?auto_1648233 ?auto_1648241 ) ) ( not ( = ?auto_1648233 ?auto_1648242 ) ) ( not ( = ?auto_1648235 ?auto_1648236 ) ) ( not ( = ?auto_1648235 ?auto_1648237 ) ) ( not ( = ?auto_1648235 ?auto_1648238 ) ) ( not ( = ?auto_1648235 ?auto_1648239 ) ) ( not ( = ?auto_1648235 ?auto_1648240 ) ) ( not ( = ?auto_1648235 ?auto_1648241 ) ) ( not ( = ?auto_1648235 ?auto_1648242 ) ) ( not ( = ?auto_1648236 ?auto_1648237 ) ) ( not ( = ?auto_1648236 ?auto_1648238 ) ) ( not ( = ?auto_1648236 ?auto_1648239 ) ) ( not ( = ?auto_1648236 ?auto_1648240 ) ) ( not ( = ?auto_1648236 ?auto_1648241 ) ) ( not ( = ?auto_1648236 ?auto_1648242 ) ) ( not ( = ?auto_1648237 ?auto_1648238 ) ) ( not ( = ?auto_1648237 ?auto_1648239 ) ) ( not ( = ?auto_1648237 ?auto_1648240 ) ) ( not ( = ?auto_1648237 ?auto_1648241 ) ) ( not ( = ?auto_1648237 ?auto_1648242 ) ) ( not ( = ?auto_1648238 ?auto_1648239 ) ) ( not ( = ?auto_1648238 ?auto_1648240 ) ) ( not ( = ?auto_1648238 ?auto_1648241 ) ) ( not ( = ?auto_1648238 ?auto_1648242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648239 ?auto_1648240 ?auto_1648241 )
      ( MAKE-13CRATE-VERIFY ?auto_1648229 ?auto_1648230 ?auto_1648231 ?auto_1648228 ?auto_1648232 ?auto_1648234 ?auto_1648233 ?auto_1648235 ?auto_1648236 ?auto_1648237 ?auto_1648238 ?auto_1648239 ?auto_1648240 ?auto_1648241 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648412 - SURFACE
      ?auto_1648413 - SURFACE
      ?auto_1648414 - SURFACE
      ?auto_1648411 - SURFACE
      ?auto_1648415 - SURFACE
      ?auto_1648417 - SURFACE
      ?auto_1648416 - SURFACE
      ?auto_1648418 - SURFACE
      ?auto_1648419 - SURFACE
      ?auto_1648420 - SURFACE
      ?auto_1648421 - SURFACE
      ?auto_1648422 - SURFACE
      ?auto_1648423 - SURFACE
      ?auto_1648424 - SURFACE
    )
    :vars
    (
      ?auto_1648425 - HOIST
      ?auto_1648427 - PLACE
      ?auto_1648426 - PLACE
      ?auto_1648429 - HOIST
      ?auto_1648430 - SURFACE
      ?auto_1648428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648425 ?auto_1648427 ) ( IS-CRATE ?auto_1648424 ) ( not ( = ?auto_1648423 ?auto_1648424 ) ) ( not ( = ?auto_1648422 ?auto_1648423 ) ) ( not ( = ?auto_1648422 ?auto_1648424 ) ) ( not ( = ?auto_1648426 ?auto_1648427 ) ) ( HOIST-AT ?auto_1648429 ?auto_1648426 ) ( not ( = ?auto_1648425 ?auto_1648429 ) ) ( AVAILABLE ?auto_1648429 ) ( SURFACE-AT ?auto_1648424 ?auto_1648426 ) ( ON ?auto_1648424 ?auto_1648430 ) ( CLEAR ?auto_1648424 ) ( not ( = ?auto_1648423 ?auto_1648430 ) ) ( not ( = ?auto_1648424 ?auto_1648430 ) ) ( not ( = ?auto_1648422 ?auto_1648430 ) ) ( TRUCK-AT ?auto_1648428 ?auto_1648427 ) ( SURFACE-AT ?auto_1648422 ?auto_1648427 ) ( CLEAR ?auto_1648422 ) ( IS-CRATE ?auto_1648423 ) ( AVAILABLE ?auto_1648425 ) ( IN ?auto_1648423 ?auto_1648428 ) ( ON ?auto_1648413 ?auto_1648412 ) ( ON ?auto_1648414 ?auto_1648413 ) ( ON ?auto_1648411 ?auto_1648414 ) ( ON ?auto_1648415 ?auto_1648411 ) ( ON ?auto_1648417 ?auto_1648415 ) ( ON ?auto_1648416 ?auto_1648417 ) ( ON ?auto_1648418 ?auto_1648416 ) ( ON ?auto_1648419 ?auto_1648418 ) ( ON ?auto_1648420 ?auto_1648419 ) ( ON ?auto_1648421 ?auto_1648420 ) ( ON ?auto_1648422 ?auto_1648421 ) ( not ( = ?auto_1648412 ?auto_1648413 ) ) ( not ( = ?auto_1648412 ?auto_1648414 ) ) ( not ( = ?auto_1648412 ?auto_1648411 ) ) ( not ( = ?auto_1648412 ?auto_1648415 ) ) ( not ( = ?auto_1648412 ?auto_1648417 ) ) ( not ( = ?auto_1648412 ?auto_1648416 ) ) ( not ( = ?auto_1648412 ?auto_1648418 ) ) ( not ( = ?auto_1648412 ?auto_1648419 ) ) ( not ( = ?auto_1648412 ?auto_1648420 ) ) ( not ( = ?auto_1648412 ?auto_1648421 ) ) ( not ( = ?auto_1648412 ?auto_1648422 ) ) ( not ( = ?auto_1648412 ?auto_1648423 ) ) ( not ( = ?auto_1648412 ?auto_1648424 ) ) ( not ( = ?auto_1648412 ?auto_1648430 ) ) ( not ( = ?auto_1648413 ?auto_1648414 ) ) ( not ( = ?auto_1648413 ?auto_1648411 ) ) ( not ( = ?auto_1648413 ?auto_1648415 ) ) ( not ( = ?auto_1648413 ?auto_1648417 ) ) ( not ( = ?auto_1648413 ?auto_1648416 ) ) ( not ( = ?auto_1648413 ?auto_1648418 ) ) ( not ( = ?auto_1648413 ?auto_1648419 ) ) ( not ( = ?auto_1648413 ?auto_1648420 ) ) ( not ( = ?auto_1648413 ?auto_1648421 ) ) ( not ( = ?auto_1648413 ?auto_1648422 ) ) ( not ( = ?auto_1648413 ?auto_1648423 ) ) ( not ( = ?auto_1648413 ?auto_1648424 ) ) ( not ( = ?auto_1648413 ?auto_1648430 ) ) ( not ( = ?auto_1648414 ?auto_1648411 ) ) ( not ( = ?auto_1648414 ?auto_1648415 ) ) ( not ( = ?auto_1648414 ?auto_1648417 ) ) ( not ( = ?auto_1648414 ?auto_1648416 ) ) ( not ( = ?auto_1648414 ?auto_1648418 ) ) ( not ( = ?auto_1648414 ?auto_1648419 ) ) ( not ( = ?auto_1648414 ?auto_1648420 ) ) ( not ( = ?auto_1648414 ?auto_1648421 ) ) ( not ( = ?auto_1648414 ?auto_1648422 ) ) ( not ( = ?auto_1648414 ?auto_1648423 ) ) ( not ( = ?auto_1648414 ?auto_1648424 ) ) ( not ( = ?auto_1648414 ?auto_1648430 ) ) ( not ( = ?auto_1648411 ?auto_1648415 ) ) ( not ( = ?auto_1648411 ?auto_1648417 ) ) ( not ( = ?auto_1648411 ?auto_1648416 ) ) ( not ( = ?auto_1648411 ?auto_1648418 ) ) ( not ( = ?auto_1648411 ?auto_1648419 ) ) ( not ( = ?auto_1648411 ?auto_1648420 ) ) ( not ( = ?auto_1648411 ?auto_1648421 ) ) ( not ( = ?auto_1648411 ?auto_1648422 ) ) ( not ( = ?auto_1648411 ?auto_1648423 ) ) ( not ( = ?auto_1648411 ?auto_1648424 ) ) ( not ( = ?auto_1648411 ?auto_1648430 ) ) ( not ( = ?auto_1648415 ?auto_1648417 ) ) ( not ( = ?auto_1648415 ?auto_1648416 ) ) ( not ( = ?auto_1648415 ?auto_1648418 ) ) ( not ( = ?auto_1648415 ?auto_1648419 ) ) ( not ( = ?auto_1648415 ?auto_1648420 ) ) ( not ( = ?auto_1648415 ?auto_1648421 ) ) ( not ( = ?auto_1648415 ?auto_1648422 ) ) ( not ( = ?auto_1648415 ?auto_1648423 ) ) ( not ( = ?auto_1648415 ?auto_1648424 ) ) ( not ( = ?auto_1648415 ?auto_1648430 ) ) ( not ( = ?auto_1648417 ?auto_1648416 ) ) ( not ( = ?auto_1648417 ?auto_1648418 ) ) ( not ( = ?auto_1648417 ?auto_1648419 ) ) ( not ( = ?auto_1648417 ?auto_1648420 ) ) ( not ( = ?auto_1648417 ?auto_1648421 ) ) ( not ( = ?auto_1648417 ?auto_1648422 ) ) ( not ( = ?auto_1648417 ?auto_1648423 ) ) ( not ( = ?auto_1648417 ?auto_1648424 ) ) ( not ( = ?auto_1648417 ?auto_1648430 ) ) ( not ( = ?auto_1648416 ?auto_1648418 ) ) ( not ( = ?auto_1648416 ?auto_1648419 ) ) ( not ( = ?auto_1648416 ?auto_1648420 ) ) ( not ( = ?auto_1648416 ?auto_1648421 ) ) ( not ( = ?auto_1648416 ?auto_1648422 ) ) ( not ( = ?auto_1648416 ?auto_1648423 ) ) ( not ( = ?auto_1648416 ?auto_1648424 ) ) ( not ( = ?auto_1648416 ?auto_1648430 ) ) ( not ( = ?auto_1648418 ?auto_1648419 ) ) ( not ( = ?auto_1648418 ?auto_1648420 ) ) ( not ( = ?auto_1648418 ?auto_1648421 ) ) ( not ( = ?auto_1648418 ?auto_1648422 ) ) ( not ( = ?auto_1648418 ?auto_1648423 ) ) ( not ( = ?auto_1648418 ?auto_1648424 ) ) ( not ( = ?auto_1648418 ?auto_1648430 ) ) ( not ( = ?auto_1648419 ?auto_1648420 ) ) ( not ( = ?auto_1648419 ?auto_1648421 ) ) ( not ( = ?auto_1648419 ?auto_1648422 ) ) ( not ( = ?auto_1648419 ?auto_1648423 ) ) ( not ( = ?auto_1648419 ?auto_1648424 ) ) ( not ( = ?auto_1648419 ?auto_1648430 ) ) ( not ( = ?auto_1648420 ?auto_1648421 ) ) ( not ( = ?auto_1648420 ?auto_1648422 ) ) ( not ( = ?auto_1648420 ?auto_1648423 ) ) ( not ( = ?auto_1648420 ?auto_1648424 ) ) ( not ( = ?auto_1648420 ?auto_1648430 ) ) ( not ( = ?auto_1648421 ?auto_1648422 ) ) ( not ( = ?auto_1648421 ?auto_1648423 ) ) ( not ( = ?auto_1648421 ?auto_1648424 ) ) ( not ( = ?auto_1648421 ?auto_1648430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648422 ?auto_1648423 ?auto_1648424 )
      ( MAKE-13CRATE-VERIFY ?auto_1648412 ?auto_1648413 ?auto_1648414 ?auto_1648411 ?auto_1648415 ?auto_1648417 ?auto_1648416 ?auto_1648418 ?auto_1648419 ?auto_1648420 ?auto_1648421 ?auto_1648422 ?auto_1648423 ?auto_1648424 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662626 - SURFACE
      ?auto_1662627 - SURFACE
      ?auto_1662628 - SURFACE
      ?auto_1662625 - SURFACE
      ?auto_1662629 - SURFACE
      ?auto_1662631 - SURFACE
      ?auto_1662630 - SURFACE
      ?auto_1662632 - SURFACE
      ?auto_1662633 - SURFACE
      ?auto_1662634 - SURFACE
      ?auto_1662635 - SURFACE
      ?auto_1662636 - SURFACE
      ?auto_1662637 - SURFACE
      ?auto_1662638 - SURFACE
      ?auto_1662639 - SURFACE
    )
    :vars
    (
      ?auto_1662640 - HOIST
      ?auto_1662641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662640 ?auto_1662641 ) ( SURFACE-AT ?auto_1662638 ?auto_1662641 ) ( CLEAR ?auto_1662638 ) ( LIFTING ?auto_1662640 ?auto_1662639 ) ( IS-CRATE ?auto_1662639 ) ( not ( = ?auto_1662638 ?auto_1662639 ) ) ( ON ?auto_1662627 ?auto_1662626 ) ( ON ?auto_1662628 ?auto_1662627 ) ( ON ?auto_1662625 ?auto_1662628 ) ( ON ?auto_1662629 ?auto_1662625 ) ( ON ?auto_1662631 ?auto_1662629 ) ( ON ?auto_1662630 ?auto_1662631 ) ( ON ?auto_1662632 ?auto_1662630 ) ( ON ?auto_1662633 ?auto_1662632 ) ( ON ?auto_1662634 ?auto_1662633 ) ( ON ?auto_1662635 ?auto_1662634 ) ( ON ?auto_1662636 ?auto_1662635 ) ( ON ?auto_1662637 ?auto_1662636 ) ( ON ?auto_1662638 ?auto_1662637 ) ( not ( = ?auto_1662626 ?auto_1662627 ) ) ( not ( = ?auto_1662626 ?auto_1662628 ) ) ( not ( = ?auto_1662626 ?auto_1662625 ) ) ( not ( = ?auto_1662626 ?auto_1662629 ) ) ( not ( = ?auto_1662626 ?auto_1662631 ) ) ( not ( = ?auto_1662626 ?auto_1662630 ) ) ( not ( = ?auto_1662626 ?auto_1662632 ) ) ( not ( = ?auto_1662626 ?auto_1662633 ) ) ( not ( = ?auto_1662626 ?auto_1662634 ) ) ( not ( = ?auto_1662626 ?auto_1662635 ) ) ( not ( = ?auto_1662626 ?auto_1662636 ) ) ( not ( = ?auto_1662626 ?auto_1662637 ) ) ( not ( = ?auto_1662626 ?auto_1662638 ) ) ( not ( = ?auto_1662626 ?auto_1662639 ) ) ( not ( = ?auto_1662627 ?auto_1662628 ) ) ( not ( = ?auto_1662627 ?auto_1662625 ) ) ( not ( = ?auto_1662627 ?auto_1662629 ) ) ( not ( = ?auto_1662627 ?auto_1662631 ) ) ( not ( = ?auto_1662627 ?auto_1662630 ) ) ( not ( = ?auto_1662627 ?auto_1662632 ) ) ( not ( = ?auto_1662627 ?auto_1662633 ) ) ( not ( = ?auto_1662627 ?auto_1662634 ) ) ( not ( = ?auto_1662627 ?auto_1662635 ) ) ( not ( = ?auto_1662627 ?auto_1662636 ) ) ( not ( = ?auto_1662627 ?auto_1662637 ) ) ( not ( = ?auto_1662627 ?auto_1662638 ) ) ( not ( = ?auto_1662627 ?auto_1662639 ) ) ( not ( = ?auto_1662628 ?auto_1662625 ) ) ( not ( = ?auto_1662628 ?auto_1662629 ) ) ( not ( = ?auto_1662628 ?auto_1662631 ) ) ( not ( = ?auto_1662628 ?auto_1662630 ) ) ( not ( = ?auto_1662628 ?auto_1662632 ) ) ( not ( = ?auto_1662628 ?auto_1662633 ) ) ( not ( = ?auto_1662628 ?auto_1662634 ) ) ( not ( = ?auto_1662628 ?auto_1662635 ) ) ( not ( = ?auto_1662628 ?auto_1662636 ) ) ( not ( = ?auto_1662628 ?auto_1662637 ) ) ( not ( = ?auto_1662628 ?auto_1662638 ) ) ( not ( = ?auto_1662628 ?auto_1662639 ) ) ( not ( = ?auto_1662625 ?auto_1662629 ) ) ( not ( = ?auto_1662625 ?auto_1662631 ) ) ( not ( = ?auto_1662625 ?auto_1662630 ) ) ( not ( = ?auto_1662625 ?auto_1662632 ) ) ( not ( = ?auto_1662625 ?auto_1662633 ) ) ( not ( = ?auto_1662625 ?auto_1662634 ) ) ( not ( = ?auto_1662625 ?auto_1662635 ) ) ( not ( = ?auto_1662625 ?auto_1662636 ) ) ( not ( = ?auto_1662625 ?auto_1662637 ) ) ( not ( = ?auto_1662625 ?auto_1662638 ) ) ( not ( = ?auto_1662625 ?auto_1662639 ) ) ( not ( = ?auto_1662629 ?auto_1662631 ) ) ( not ( = ?auto_1662629 ?auto_1662630 ) ) ( not ( = ?auto_1662629 ?auto_1662632 ) ) ( not ( = ?auto_1662629 ?auto_1662633 ) ) ( not ( = ?auto_1662629 ?auto_1662634 ) ) ( not ( = ?auto_1662629 ?auto_1662635 ) ) ( not ( = ?auto_1662629 ?auto_1662636 ) ) ( not ( = ?auto_1662629 ?auto_1662637 ) ) ( not ( = ?auto_1662629 ?auto_1662638 ) ) ( not ( = ?auto_1662629 ?auto_1662639 ) ) ( not ( = ?auto_1662631 ?auto_1662630 ) ) ( not ( = ?auto_1662631 ?auto_1662632 ) ) ( not ( = ?auto_1662631 ?auto_1662633 ) ) ( not ( = ?auto_1662631 ?auto_1662634 ) ) ( not ( = ?auto_1662631 ?auto_1662635 ) ) ( not ( = ?auto_1662631 ?auto_1662636 ) ) ( not ( = ?auto_1662631 ?auto_1662637 ) ) ( not ( = ?auto_1662631 ?auto_1662638 ) ) ( not ( = ?auto_1662631 ?auto_1662639 ) ) ( not ( = ?auto_1662630 ?auto_1662632 ) ) ( not ( = ?auto_1662630 ?auto_1662633 ) ) ( not ( = ?auto_1662630 ?auto_1662634 ) ) ( not ( = ?auto_1662630 ?auto_1662635 ) ) ( not ( = ?auto_1662630 ?auto_1662636 ) ) ( not ( = ?auto_1662630 ?auto_1662637 ) ) ( not ( = ?auto_1662630 ?auto_1662638 ) ) ( not ( = ?auto_1662630 ?auto_1662639 ) ) ( not ( = ?auto_1662632 ?auto_1662633 ) ) ( not ( = ?auto_1662632 ?auto_1662634 ) ) ( not ( = ?auto_1662632 ?auto_1662635 ) ) ( not ( = ?auto_1662632 ?auto_1662636 ) ) ( not ( = ?auto_1662632 ?auto_1662637 ) ) ( not ( = ?auto_1662632 ?auto_1662638 ) ) ( not ( = ?auto_1662632 ?auto_1662639 ) ) ( not ( = ?auto_1662633 ?auto_1662634 ) ) ( not ( = ?auto_1662633 ?auto_1662635 ) ) ( not ( = ?auto_1662633 ?auto_1662636 ) ) ( not ( = ?auto_1662633 ?auto_1662637 ) ) ( not ( = ?auto_1662633 ?auto_1662638 ) ) ( not ( = ?auto_1662633 ?auto_1662639 ) ) ( not ( = ?auto_1662634 ?auto_1662635 ) ) ( not ( = ?auto_1662634 ?auto_1662636 ) ) ( not ( = ?auto_1662634 ?auto_1662637 ) ) ( not ( = ?auto_1662634 ?auto_1662638 ) ) ( not ( = ?auto_1662634 ?auto_1662639 ) ) ( not ( = ?auto_1662635 ?auto_1662636 ) ) ( not ( = ?auto_1662635 ?auto_1662637 ) ) ( not ( = ?auto_1662635 ?auto_1662638 ) ) ( not ( = ?auto_1662635 ?auto_1662639 ) ) ( not ( = ?auto_1662636 ?auto_1662637 ) ) ( not ( = ?auto_1662636 ?auto_1662638 ) ) ( not ( = ?auto_1662636 ?auto_1662639 ) ) ( not ( = ?auto_1662637 ?auto_1662638 ) ) ( not ( = ?auto_1662637 ?auto_1662639 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1662638 ?auto_1662639 )
      ( MAKE-14CRATE-VERIFY ?auto_1662626 ?auto_1662627 ?auto_1662628 ?auto_1662625 ?auto_1662629 ?auto_1662631 ?auto_1662630 ?auto_1662632 ?auto_1662633 ?auto_1662634 ?auto_1662635 ?auto_1662636 ?auto_1662637 ?auto_1662638 ?auto_1662639 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662786 - SURFACE
      ?auto_1662787 - SURFACE
      ?auto_1662788 - SURFACE
      ?auto_1662785 - SURFACE
      ?auto_1662789 - SURFACE
      ?auto_1662791 - SURFACE
      ?auto_1662790 - SURFACE
      ?auto_1662792 - SURFACE
      ?auto_1662793 - SURFACE
      ?auto_1662794 - SURFACE
      ?auto_1662795 - SURFACE
      ?auto_1662796 - SURFACE
      ?auto_1662797 - SURFACE
      ?auto_1662798 - SURFACE
      ?auto_1662799 - SURFACE
    )
    :vars
    (
      ?auto_1662802 - HOIST
      ?auto_1662800 - PLACE
      ?auto_1662801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662802 ?auto_1662800 ) ( SURFACE-AT ?auto_1662798 ?auto_1662800 ) ( CLEAR ?auto_1662798 ) ( IS-CRATE ?auto_1662799 ) ( not ( = ?auto_1662798 ?auto_1662799 ) ) ( TRUCK-AT ?auto_1662801 ?auto_1662800 ) ( AVAILABLE ?auto_1662802 ) ( IN ?auto_1662799 ?auto_1662801 ) ( ON ?auto_1662798 ?auto_1662797 ) ( not ( = ?auto_1662797 ?auto_1662798 ) ) ( not ( = ?auto_1662797 ?auto_1662799 ) ) ( ON ?auto_1662787 ?auto_1662786 ) ( ON ?auto_1662788 ?auto_1662787 ) ( ON ?auto_1662785 ?auto_1662788 ) ( ON ?auto_1662789 ?auto_1662785 ) ( ON ?auto_1662791 ?auto_1662789 ) ( ON ?auto_1662790 ?auto_1662791 ) ( ON ?auto_1662792 ?auto_1662790 ) ( ON ?auto_1662793 ?auto_1662792 ) ( ON ?auto_1662794 ?auto_1662793 ) ( ON ?auto_1662795 ?auto_1662794 ) ( ON ?auto_1662796 ?auto_1662795 ) ( ON ?auto_1662797 ?auto_1662796 ) ( not ( = ?auto_1662786 ?auto_1662787 ) ) ( not ( = ?auto_1662786 ?auto_1662788 ) ) ( not ( = ?auto_1662786 ?auto_1662785 ) ) ( not ( = ?auto_1662786 ?auto_1662789 ) ) ( not ( = ?auto_1662786 ?auto_1662791 ) ) ( not ( = ?auto_1662786 ?auto_1662790 ) ) ( not ( = ?auto_1662786 ?auto_1662792 ) ) ( not ( = ?auto_1662786 ?auto_1662793 ) ) ( not ( = ?auto_1662786 ?auto_1662794 ) ) ( not ( = ?auto_1662786 ?auto_1662795 ) ) ( not ( = ?auto_1662786 ?auto_1662796 ) ) ( not ( = ?auto_1662786 ?auto_1662797 ) ) ( not ( = ?auto_1662786 ?auto_1662798 ) ) ( not ( = ?auto_1662786 ?auto_1662799 ) ) ( not ( = ?auto_1662787 ?auto_1662788 ) ) ( not ( = ?auto_1662787 ?auto_1662785 ) ) ( not ( = ?auto_1662787 ?auto_1662789 ) ) ( not ( = ?auto_1662787 ?auto_1662791 ) ) ( not ( = ?auto_1662787 ?auto_1662790 ) ) ( not ( = ?auto_1662787 ?auto_1662792 ) ) ( not ( = ?auto_1662787 ?auto_1662793 ) ) ( not ( = ?auto_1662787 ?auto_1662794 ) ) ( not ( = ?auto_1662787 ?auto_1662795 ) ) ( not ( = ?auto_1662787 ?auto_1662796 ) ) ( not ( = ?auto_1662787 ?auto_1662797 ) ) ( not ( = ?auto_1662787 ?auto_1662798 ) ) ( not ( = ?auto_1662787 ?auto_1662799 ) ) ( not ( = ?auto_1662788 ?auto_1662785 ) ) ( not ( = ?auto_1662788 ?auto_1662789 ) ) ( not ( = ?auto_1662788 ?auto_1662791 ) ) ( not ( = ?auto_1662788 ?auto_1662790 ) ) ( not ( = ?auto_1662788 ?auto_1662792 ) ) ( not ( = ?auto_1662788 ?auto_1662793 ) ) ( not ( = ?auto_1662788 ?auto_1662794 ) ) ( not ( = ?auto_1662788 ?auto_1662795 ) ) ( not ( = ?auto_1662788 ?auto_1662796 ) ) ( not ( = ?auto_1662788 ?auto_1662797 ) ) ( not ( = ?auto_1662788 ?auto_1662798 ) ) ( not ( = ?auto_1662788 ?auto_1662799 ) ) ( not ( = ?auto_1662785 ?auto_1662789 ) ) ( not ( = ?auto_1662785 ?auto_1662791 ) ) ( not ( = ?auto_1662785 ?auto_1662790 ) ) ( not ( = ?auto_1662785 ?auto_1662792 ) ) ( not ( = ?auto_1662785 ?auto_1662793 ) ) ( not ( = ?auto_1662785 ?auto_1662794 ) ) ( not ( = ?auto_1662785 ?auto_1662795 ) ) ( not ( = ?auto_1662785 ?auto_1662796 ) ) ( not ( = ?auto_1662785 ?auto_1662797 ) ) ( not ( = ?auto_1662785 ?auto_1662798 ) ) ( not ( = ?auto_1662785 ?auto_1662799 ) ) ( not ( = ?auto_1662789 ?auto_1662791 ) ) ( not ( = ?auto_1662789 ?auto_1662790 ) ) ( not ( = ?auto_1662789 ?auto_1662792 ) ) ( not ( = ?auto_1662789 ?auto_1662793 ) ) ( not ( = ?auto_1662789 ?auto_1662794 ) ) ( not ( = ?auto_1662789 ?auto_1662795 ) ) ( not ( = ?auto_1662789 ?auto_1662796 ) ) ( not ( = ?auto_1662789 ?auto_1662797 ) ) ( not ( = ?auto_1662789 ?auto_1662798 ) ) ( not ( = ?auto_1662789 ?auto_1662799 ) ) ( not ( = ?auto_1662791 ?auto_1662790 ) ) ( not ( = ?auto_1662791 ?auto_1662792 ) ) ( not ( = ?auto_1662791 ?auto_1662793 ) ) ( not ( = ?auto_1662791 ?auto_1662794 ) ) ( not ( = ?auto_1662791 ?auto_1662795 ) ) ( not ( = ?auto_1662791 ?auto_1662796 ) ) ( not ( = ?auto_1662791 ?auto_1662797 ) ) ( not ( = ?auto_1662791 ?auto_1662798 ) ) ( not ( = ?auto_1662791 ?auto_1662799 ) ) ( not ( = ?auto_1662790 ?auto_1662792 ) ) ( not ( = ?auto_1662790 ?auto_1662793 ) ) ( not ( = ?auto_1662790 ?auto_1662794 ) ) ( not ( = ?auto_1662790 ?auto_1662795 ) ) ( not ( = ?auto_1662790 ?auto_1662796 ) ) ( not ( = ?auto_1662790 ?auto_1662797 ) ) ( not ( = ?auto_1662790 ?auto_1662798 ) ) ( not ( = ?auto_1662790 ?auto_1662799 ) ) ( not ( = ?auto_1662792 ?auto_1662793 ) ) ( not ( = ?auto_1662792 ?auto_1662794 ) ) ( not ( = ?auto_1662792 ?auto_1662795 ) ) ( not ( = ?auto_1662792 ?auto_1662796 ) ) ( not ( = ?auto_1662792 ?auto_1662797 ) ) ( not ( = ?auto_1662792 ?auto_1662798 ) ) ( not ( = ?auto_1662792 ?auto_1662799 ) ) ( not ( = ?auto_1662793 ?auto_1662794 ) ) ( not ( = ?auto_1662793 ?auto_1662795 ) ) ( not ( = ?auto_1662793 ?auto_1662796 ) ) ( not ( = ?auto_1662793 ?auto_1662797 ) ) ( not ( = ?auto_1662793 ?auto_1662798 ) ) ( not ( = ?auto_1662793 ?auto_1662799 ) ) ( not ( = ?auto_1662794 ?auto_1662795 ) ) ( not ( = ?auto_1662794 ?auto_1662796 ) ) ( not ( = ?auto_1662794 ?auto_1662797 ) ) ( not ( = ?auto_1662794 ?auto_1662798 ) ) ( not ( = ?auto_1662794 ?auto_1662799 ) ) ( not ( = ?auto_1662795 ?auto_1662796 ) ) ( not ( = ?auto_1662795 ?auto_1662797 ) ) ( not ( = ?auto_1662795 ?auto_1662798 ) ) ( not ( = ?auto_1662795 ?auto_1662799 ) ) ( not ( = ?auto_1662796 ?auto_1662797 ) ) ( not ( = ?auto_1662796 ?auto_1662798 ) ) ( not ( = ?auto_1662796 ?auto_1662799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662797 ?auto_1662798 ?auto_1662799 )
      ( MAKE-14CRATE-VERIFY ?auto_1662786 ?auto_1662787 ?auto_1662788 ?auto_1662785 ?auto_1662789 ?auto_1662791 ?auto_1662790 ?auto_1662792 ?auto_1662793 ?auto_1662794 ?auto_1662795 ?auto_1662796 ?auto_1662797 ?auto_1662798 ?auto_1662799 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662961 - SURFACE
      ?auto_1662962 - SURFACE
      ?auto_1662963 - SURFACE
      ?auto_1662960 - SURFACE
      ?auto_1662964 - SURFACE
      ?auto_1662966 - SURFACE
      ?auto_1662965 - SURFACE
      ?auto_1662967 - SURFACE
      ?auto_1662968 - SURFACE
      ?auto_1662969 - SURFACE
      ?auto_1662970 - SURFACE
      ?auto_1662971 - SURFACE
      ?auto_1662972 - SURFACE
      ?auto_1662973 - SURFACE
      ?auto_1662974 - SURFACE
    )
    :vars
    (
      ?auto_1662978 - HOIST
      ?auto_1662977 - PLACE
      ?auto_1662976 - TRUCK
      ?auto_1662975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662978 ?auto_1662977 ) ( SURFACE-AT ?auto_1662973 ?auto_1662977 ) ( CLEAR ?auto_1662973 ) ( IS-CRATE ?auto_1662974 ) ( not ( = ?auto_1662973 ?auto_1662974 ) ) ( AVAILABLE ?auto_1662978 ) ( IN ?auto_1662974 ?auto_1662976 ) ( ON ?auto_1662973 ?auto_1662972 ) ( not ( = ?auto_1662972 ?auto_1662973 ) ) ( not ( = ?auto_1662972 ?auto_1662974 ) ) ( TRUCK-AT ?auto_1662976 ?auto_1662975 ) ( not ( = ?auto_1662975 ?auto_1662977 ) ) ( ON ?auto_1662962 ?auto_1662961 ) ( ON ?auto_1662963 ?auto_1662962 ) ( ON ?auto_1662960 ?auto_1662963 ) ( ON ?auto_1662964 ?auto_1662960 ) ( ON ?auto_1662966 ?auto_1662964 ) ( ON ?auto_1662965 ?auto_1662966 ) ( ON ?auto_1662967 ?auto_1662965 ) ( ON ?auto_1662968 ?auto_1662967 ) ( ON ?auto_1662969 ?auto_1662968 ) ( ON ?auto_1662970 ?auto_1662969 ) ( ON ?auto_1662971 ?auto_1662970 ) ( ON ?auto_1662972 ?auto_1662971 ) ( not ( = ?auto_1662961 ?auto_1662962 ) ) ( not ( = ?auto_1662961 ?auto_1662963 ) ) ( not ( = ?auto_1662961 ?auto_1662960 ) ) ( not ( = ?auto_1662961 ?auto_1662964 ) ) ( not ( = ?auto_1662961 ?auto_1662966 ) ) ( not ( = ?auto_1662961 ?auto_1662965 ) ) ( not ( = ?auto_1662961 ?auto_1662967 ) ) ( not ( = ?auto_1662961 ?auto_1662968 ) ) ( not ( = ?auto_1662961 ?auto_1662969 ) ) ( not ( = ?auto_1662961 ?auto_1662970 ) ) ( not ( = ?auto_1662961 ?auto_1662971 ) ) ( not ( = ?auto_1662961 ?auto_1662972 ) ) ( not ( = ?auto_1662961 ?auto_1662973 ) ) ( not ( = ?auto_1662961 ?auto_1662974 ) ) ( not ( = ?auto_1662962 ?auto_1662963 ) ) ( not ( = ?auto_1662962 ?auto_1662960 ) ) ( not ( = ?auto_1662962 ?auto_1662964 ) ) ( not ( = ?auto_1662962 ?auto_1662966 ) ) ( not ( = ?auto_1662962 ?auto_1662965 ) ) ( not ( = ?auto_1662962 ?auto_1662967 ) ) ( not ( = ?auto_1662962 ?auto_1662968 ) ) ( not ( = ?auto_1662962 ?auto_1662969 ) ) ( not ( = ?auto_1662962 ?auto_1662970 ) ) ( not ( = ?auto_1662962 ?auto_1662971 ) ) ( not ( = ?auto_1662962 ?auto_1662972 ) ) ( not ( = ?auto_1662962 ?auto_1662973 ) ) ( not ( = ?auto_1662962 ?auto_1662974 ) ) ( not ( = ?auto_1662963 ?auto_1662960 ) ) ( not ( = ?auto_1662963 ?auto_1662964 ) ) ( not ( = ?auto_1662963 ?auto_1662966 ) ) ( not ( = ?auto_1662963 ?auto_1662965 ) ) ( not ( = ?auto_1662963 ?auto_1662967 ) ) ( not ( = ?auto_1662963 ?auto_1662968 ) ) ( not ( = ?auto_1662963 ?auto_1662969 ) ) ( not ( = ?auto_1662963 ?auto_1662970 ) ) ( not ( = ?auto_1662963 ?auto_1662971 ) ) ( not ( = ?auto_1662963 ?auto_1662972 ) ) ( not ( = ?auto_1662963 ?auto_1662973 ) ) ( not ( = ?auto_1662963 ?auto_1662974 ) ) ( not ( = ?auto_1662960 ?auto_1662964 ) ) ( not ( = ?auto_1662960 ?auto_1662966 ) ) ( not ( = ?auto_1662960 ?auto_1662965 ) ) ( not ( = ?auto_1662960 ?auto_1662967 ) ) ( not ( = ?auto_1662960 ?auto_1662968 ) ) ( not ( = ?auto_1662960 ?auto_1662969 ) ) ( not ( = ?auto_1662960 ?auto_1662970 ) ) ( not ( = ?auto_1662960 ?auto_1662971 ) ) ( not ( = ?auto_1662960 ?auto_1662972 ) ) ( not ( = ?auto_1662960 ?auto_1662973 ) ) ( not ( = ?auto_1662960 ?auto_1662974 ) ) ( not ( = ?auto_1662964 ?auto_1662966 ) ) ( not ( = ?auto_1662964 ?auto_1662965 ) ) ( not ( = ?auto_1662964 ?auto_1662967 ) ) ( not ( = ?auto_1662964 ?auto_1662968 ) ) ( not ( = ?auto_1662964 ?auto_1662969 ) ) ( not ( = ?auto_1662964 ?auto_1662970 ) ) ( not ( = ?auto_1662964 ?auto_1662971 ) ) ( not ( = ?auto_1662964 ?auto_1662972 ) ) ( not ( = ?auto_1662964 ?auto_1662973 ) ) ( not ( = ?auto_1662964 ?auto_1662974 ) ) ( not ( = ?auto_1662966 ?auto_1662965 ) ) ( not ( = ?auto_1662966 ?auto_1662967 ) ) ( not ( = ?auto_1662966 ?auto_1662968 ) ) ( not ( = ?auto_1662966 ?auto_1662969 ) ) ( not ( = ?auto_1662966 ?auto_1662970 ) ) ( not ( = ?auto_1662966 ?auto_1662971 ) ) ( not ( = ?auto_1662966 ?auto_1662972 ) ) ( not ( = ?auto_1662966 ?auto_1662973 ) ) ( not ( = ?auto_1662966 ?auto_1662974 ) ) ( not ( = ?auto_1662965 ?auto_1662967 ) ) ( not ( = ?auto_1662965 ?auto_1662968 ) ) ( not ( = ?auto_1662965 ?auto_1662969 ) ) ( not ( = ?auto_1662965 ?auto_1662970 ) ) ( not ( = ?auto_1662965 ?auto_1662971 ) ) ( not ( = ?auto_1662965 ?auto_1662972 ) ) ( not ( = ?auto_1662965 ?auto_1662973 ) ) ( not ( = ?auto_1662965 ?auto_1662974 ) ) ( not ( = ?auto_1662967 ?auto_1662968 ) ) ( not ( = ?auto_1662967 ?auto_1662969 ) ) ( not ( = ?auto_1662967 ?auto_1662970 ) ) ( not ( = ?auto_1662967 ?auto_1662971 ) ) ( not ( = ?auto_1662967 ?auto_1662972 ) ) ( not ( = ?auto_1662967 ?auto_1662973 ) ) ( not ( = ?auto_1662967 ?auto_1662974 ) ) ( not ( = ?auto_1662968 ?auto_1662969 ) ) ( not ( = ?auto_1662968 ?auto_1662970 ) ) ( not ( = ?auto_1662968 ?auto_1662971 ) ) ( not ( = ?auto_1662968 ?auto_1662972 ) ) ( not ( = ?auto_1662968 ?auto_1662973 ) ) ( not ( = ?auto_1662968 ?auto_1662974 ) ) ( not ( = ?auto_1662969 ?auto_1662970 ) ) ( not ( = ?auto_1662969 ?auto_1662971 ) ) ( not ( = ?auto_1662969 ?auto_1662972 ) ) ( not ( = ?auto_1662969 ?auto_1662973 ) ) ( not ( = ?auto_1662969 ?auto_1662974 ) ) ( not ( = ?auto_1662970 ?auto_1662971 ) ) ( not ( = ?auto_1662970 ?auto_1662972 ) ) ( not ( = ?auto_1662970 ?auto_1662973 ) ) ( not ( = ?auto_1662970 ?auto_1662974 ) ) ( not ( = ?auto_1662971 ?auto_1662972 ) ) ( not ( = ?auto_1662971 ?auto_1662973 ) ) ( not ( = ?auto_1662971 ?auto_1662974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662972 ?auto_1662973 ?auto_1662974 )
      ( MAKE-14CRATE-VERIFY ?auto_1662961 ?auto_1662962 ?auto_1662963 ?auto_1662960 ?auto_1662964 ?auto_1662966 ?auto_1662965 ?auto_1662967 ?auto_1662968 ?auto_1662969 ?auto_1662970 ?auto_1662971 ?auto_1662972 ?auto_1662973 ?auto_1662974 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663150 - SURFACE
      ?auto_1663151 - SURFACE
      ?auto_1663152 - SURFACE
      ?auto_1663149 - SURFACE
      ?auto_1663153 - SURFACE
      ?auto_1663155 - SURFACE
      ?auto_1663154 - SURFACE
      ?auto_1663156 - SURFACE
      ?auto_1663157 - SURFACE
      ?auto_1663158 - SURFACE
      ?auto_1663159 - SURFACE
      ?auto_1663160 - SURFACE
      ?auto_1663161 - SURFACE
      ?auto_1663162 - SURFACE
      ?auto_1663163 - SURFACE
    )
    :vars
    (
      ?auto_1663166 - HOIST
      ?auto_1663164 - PLACE
      ?auto_1663167 - TRUCK
      ?auto_1663168 - PLACE
      ?auto_1663165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663166 ?auto_1663164 ) ( SURFACE-AT ?auto_1663162 ?auto_1663164 ) ( CLEAR ?auto_1663162 ) ( IS-CRATE ?auto_1663163 ) ( not ( = ?auto_1663162 ?auto_1663163 ) ) ( AVAILABLE ?auto_1663166 ) ( ON ?auto_1663162 ?auto_1663161 ) ( not ( = ?auto_1663161 ?auto_1663162 ) ) ( not ( = ?auto_1663161 ?auto_1663163 ) ) ( TRUCK-AT ?auto_1663167 ?auto_1663168 ) ( not ( = ?auto_1663168 ?auto_1663164 ) ) ( HOIST-AT ?auto_1663165 ?auto_1663168 ) ( LIFTING ?auto_1663165 ?auto_1663163 ) ( not ( = ?auto_1663166 ?auto_1663165 ) ) ( ON ?auto_1663151 ?auto_1663150 ) ( ON ?auto_1663152 ?auto_1663151 ) ( ON ?auto_1663149 ?auto_1663152 ) ( ON ?auto_1663153 ?auto_1663149 ) ( ON ?auto_1663155 ?auto_1663153 ) ( ON ?auto_1663154 ?auto_1663155 ) ( ON ?auto_1663156 ?auto_1663154 ) ( ON ?auto_1663157 ?auto_1663156 ) ( ON ?auto_1663158 ?auto_1663157 ) ( ON ?auto_1663159 ?auto_1663158 ) ( ON ?auto_1663160 ?auto_1663159 ) ( ON ?auto_1663161 ?auto_1663160 ) ( not ( = ?auto_1663150 ?auto_1663151 ) ) ( not ( = ?auto_1663150 ?auto_1663152 ) ) ( not ( = ?auto_1663150 ?auto_1663149 ) ) ( not ( = ?auto_1663150 ?auto_1663153 ) ) ( not ( = ?auto_1663150 ?auto_1663155 ) ) ( not ( = ?auto_1663150 ?auto_1663154 ) ) ( not ( = ?auto_1663150 ?auto_1663156 ) ) ( not ( = ?auto_1663150 ?auto_1663157 ) ) ( not ( = ?auto_1663150 ?auto_1663158 ) ) ( not ( = ?auto_1663150 ?auto_1663159 ) ) ( not ( = ?auto_1663150 ?auto_1663160 ) ) ( not ( = ?auto_1663150 ?auto_1663161 ) ) ( not ( = ?auto_1663150 ?auto_1663162 ) ) ( not ( = ?auto_1663150 ?auto_1663163 ) ) ( not ( = ?auto_1663151 ?auto_1663152 ) ) ( not ( = ?auto_1663151 ?auto_1663149 ) ) ( not ( = ?auto_1663151 ?auto_1663153 ) ) ( not ( = ?auto_1663151 ?auto_1663155 ) ) ( not ( = ?auto_1663151 ?auto_1663154 ) ) ( not ( = ?auto_1663151 ?auto_1663156 ) ) ( not ( = ?auto_1663151 ?auto_1663157 ) ) ( not ( = ?auto_1663151 ?auto_1663158 ) ) ( not ( = ?auto_1663151 ?auto_1663159 ) ) ( not ( = ?auto_1663151 ?auto_1663160 ) ) ( not ( = ?auto_1663151 ?auto_1663161 ) ) ( not ( = ?auto_1663151 ?auto_1663162 ) ) ( not ( = ?auto_1663151 ?auto_1663163 ) ) ( not ( = ?auto_1663152 ?auto_1663149 ) ) ( not ( = ?auto_1663152 ?auto_1663153 ) ) ( not ( = ?auto_1663152 ?auto_1663155 ) ) ( not ( = ?auto_1663152 ?auto_1663154 ) ) ( not ( = ?auto_1663152 ?auto_1663156 ) ) ( not ( = ?auto_1663152 ?auto_1663157 ) ) ( not ( = ?auto_1663152 ?auto_1663158 ) ) ( not ( = ?auto_1663152 ?auto_1663159 ) ) ( not ( = ?auto_1663152 ?auto_1663160 ) ) ( not ( = ?auto_1663152 ?auto_1663161 ) ) ( not ( = ?auto_1663152 ?auto_1663162 ) ) ( not ( = ?auto_1663152 ?auto_1663163 ) ) ( not ( = ?auto_1663149 ?auto_1663153 ) ) ( not ( = ?auto_1663149 ?auto_1663155 ) ) ( not ( = ?auto_1663149 ?auto_1663154 ) ) ( not ( = ?auto_1663149 ?auto_1663156 ) ) ( not ( = ?auto_1663149 ?auto_1663157 ) ) ( not ( = ?auto_1663149 ?auto_1663158 ) ) ( not ( = ?auto_1663149 ?auto_1663159 ) ) ( not ( = ?auto_1663149 ?auto_1663160 ) ) ( not ( = ?auto_1663149 ?auto_1663161 ) ) ( not ( = ?auto_1663149 ?auto_1663162 ) ) ( not ( = ?auto_1663149 ?auto_1663163 ) ) ( not ( = ?auto_1663153 ?auto_1663155 ) ) ( not ( = ?auto_1663153 ?auto_1663154 ) ) ( not ( = ?auto_1663153 ?auto_1663156 ) ) ( not ( = ?auto_1663153 ?auto_1663157 ) ) ( not ( = ?auto_1663153 ?auto_1663158 ) ) ( not ( = ?auto_1663153 ?auto_1663159 ) ) ( not ( = ?auto_1663153 ?auto_1663160 ) ) ( not ( = ?auto_1663153 ?auto_1663161 ) ) ( not ( = ?auto_1663153 ?auto_1663162 ) ) ( not ( = ?auto_1663153 ?auto_1663163 ) ) ( not ( = ?auto_1663155 ?auto_1663154 ) ) ( not ( = ?auto_1663155 ?auto_1663156 ) ) ( not ( = ?auto_1663155 ?auto_1663157 ) ) ( not ( = ?auto_1663155 ?auto_1663158 ) ) ( not ( = ?auto_1663155 ?auto_1663159 ) ) ( not ( = ?auto_1663155 ?auto_1663160 ) ) ( not ( = ?auto_1663155 ?auto_1663161 ) ) ( not ( = ?auto_1663155 ?auto_1663162 ) ) ( not ( = ?auto_1663155 ?auto_1663163 ) ) ( not ( = ?auto_1663154 ?auto_1663156 ) ) ( not ( = ?auto_1663154 ?auto_1663157 ) ) ( not ( = ?auto_1663154 ?auto_1663158 ) ) ( not ( = ?auto_1663154 ?auto_1663159 ) ) ( not ( = ?auto_1663154 ?auto_1663160 ) ) ( not ( = ?auto_1663154 ?auto_1663161 ) ) ( not ( = ?auto_1663154 ?auto_1663162 ) ) ( not ( = ?auto_1663154 ?auto_1663163 ) ) ( not ( = ?auto_1663156 ?auto_1663157 ) ) ( not ( = ?auto_1663156 ?auto_1663158 ) ) ( not ( = ?auto_1663156 ?auto_1663159 ) ) ( not ( = ?auto_1663156 ?auto_1663160 ) ) ( not ( = ?auto_1663156 ?auto_1663161 ) ) ( not ( = ?auto_1663156 ?auto_1663162 ) ) ( not ( = ?auto_1663156 ?auto_1663163 ) ) ( not ( = ?auto_1663157 ?auto_1663158 ) ) ( not ( = ?auto_1663157 ?auto_1663159 ) ) ( not ( = ?auto_1663157 ?auto_1663160 ) ) ( not ( = ?auto_1663157 ?auto_1663161 ) ) ( not ( = ?auto_1663157 ?auto_1663162 ) ) ( not ( = ?auto_1663157 ?auto_1663163 ) ) ( not ( = ?auto_1663158 ?auto_1663159 ) ) ( not ( = ?auto_1663158 ?auto_1663160 ) ) ( not ( = ?auto_1663158 ?auto_1663161 ) ) ( not ( = ?auto_1663158 ?auto_1663162 ) ) ( not ( = ?auto_1663158 ?auto_1663163 ) ) ( not ( = ?auto_1663159 ?auto_1663160 ) ) ( not ( = ?auto_1663159 ?auto_1663161 ) ) ( not ( = ?auto_1663159 ?auto_1663162 ) ) ( not ( = ?auto_1663159 ?auto_1663163 ) ) ( not ( = ?auto_1663160 ?auto_1663161 ) ) ( not ( = ?auto_1663160 ?auto_1663162 ) ) ( not ( = ?auto_1663160 ?auto_1663163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663161 ?auto_1663162 ?auto_1663163 )
      ( MAKE-14CRATE-VERIFY ?auto_1663150 ?auto_1663151 ?auto_1663152 ?auto_1663149 ?auto_1663153 ?auto_1663155 ?auto_1663154 ?auto_1663156 ?auto_1663157 ?auto_1663158 ?auto_1663159 ?auto_1663160 ?auto_1663161 ?auto_1663162 ?auto_1663163 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663353 - SURFACE
      ?auto_1663354 - SURFACE
      ?auto_1663355 - SURFACE
      ?auto_1663352 - SURFACE
      ?auto_1663356 - SURFACE
      ?auto_1663358 - SURFACE
      ?auto_1663357 - SURFACE
      ?auto_1663359 - SURFACE
      ?auto_1663360 - SURFACE
      ?auto_1663361 - SURFACE
      ?auto_1663362 - SURFACE
      ?auto_1663363 - SURFACE
      ?auto_1663364 - SURFACE
      ?auto_1663365 - SURFACE
      ?auto_1663366 - SURFACE
    )
    :vars
    (
      ?auto_1663367 - HOIST
      ?auto_1663370 - PLACE
      ?auto_1663372 - TRUCK
      ?auto_1663371 - PLACE
      ?auto_1663369 - HOIST
      ?auto_1663368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663367 ?auto_1663370 ) ( SURFACE-AT ?auto_1663365 ?auto_1663370 ) ( CLEAR ?auto_1663365 ) ( IS-CRATE ?auto_1663366 ) ( not ( = ?auto_1663365 ?auto_1663366 ) ) ( AVAILABLE ?auto_1663367 ) ( ON ?auto_1663365 ?auto_1663364 ) ( not ( = ?auto_1663364 ?auto_1663365 ) ) ( not ( = ?auto_1663364 ?auto_1663366 ) ) ( TRUCK-AT ?auto_1663372 ?auto_1663371 ) ( not ( = ?auto_1663371 ?auto_1663370 ) ) ( HOIST-AT ?auto_1663369 ?auto_1663371 ) ( not ( = ?auto_1663367 ?auto_1663369 ) ) ( AVAILABLE ?auto_1663369 ) ( SURFACE-AT ?auto_1663366 ?auto_1663371 ) ( ON ?auto_1663366 ?auto_1663368 ) ( CLEAR ?auto_1663366 ) ( not ( = ?auto_1663365 ?auto_1663368 ) ) ( not ( = ?auto_1663366 ?auto_1663368 ) ) ( not ( = ?auto_1663364 ?auto_1663368 ) ) ( ON ?auto_1663354 ?auto_1663353 ) ( ON ?auto_1663355 ?auto_1663354 ) ( ON ?auto_1663352 ?auto_1663355 ) ( ON ?auto_1663356 ?auto_1663352 ) ( ON ?auto_1663358 ?auto_1663356 ) ( ON ?auto_1663357 ?auto_1663358 ) ( ON ?auto_1663359 ?auto_1663357 ) ( ON ?auto_1663360 ?auto_1663359 ) ( ON ?auto_1663361 ?auto_1663360 ) ( ON ?auto_1663362 ?auto_1663361 ) ( ON ?auto_1663363 ?auto_1663362 ) ( ON ?auto_1663364 ?auto_1663363 ) ( not ( = ?auto_1663353 ?auto_1663354 ) ) ( not ( = ?auto_1663353 ?auto_1663355 ) ) ( not ( = ?auto_1663353 ?auto_1663352 ) ) ( not ( = ?auto_1663353 ?auto_1663356 ) ) ( not ( = ?auto_1663353 ?auto_1663358 ) ) ( not ( = ?auto_1663353 ?auto_1663357 ) ) ( not ( = ?auto_1663353 ?auto_1663359 ) ) ( not ( = ?auto_1663353 ?auto_1663360 ) ) ( not ( = ?auto_1663353 ?auto_1663361 ) ) ( not ( = ?auto_1663353 ?auto_1663362 ) ) ( not ( = ?auto_1663353 ?auto_1663363 ) ) ( not ( = ?auto_1663353 ?auto_1663364 ) ) ( not ( = ?auto_1663353 ?auto_1663365 ) ) ( not ( = ?auto_1663353 ?auto_1663366 ) ) ( not ( = ?auto_1663353 ?auto_1663368 ) ) ( not ( = ?auto_1663354 ?auto_1663355 ) ) ( not ( = ?auto_1663354 ?auto_1663352 ) ) ( not ( = ?auto_1663354 ?auto_1663356 ) ) ( not ( = ?auto_1663354 ?auto_1663358 ) ) ( not ( = ?auto_1663354 ?auto_1663357 ) ) ( not ( = ?auto_1663354 ?auto_1663359 ) ) ( not ( = ?auto_1663354 ?auto_1663360 ) ) ( not ( = ?auto_1663354 ?auto_1663361 ) ) ( not ( = ?auto_1663354 ?auto_1663362 ) ) ( not ( = ?auto_1663354 ?auto_1663363 ) ) ( not ( = ?auto_1663354 ?auto_1663364 ) ) ( not ( = ?auto_1663354 ?auto_1663365 ) ) ( not ( = ?auto_1663354 ?auto_1663366 ) ) ( not ( = ?auto_1663354 ?auto_1663368 ) ) ( not ( = ?auto_1663355 ?auto_1663352 ) ) ( not ( = ?auto_1663355 ?auto_1663356 ) ) ( not ( = ?auto_1663355 ?auto_1663358 ) ) ( not ( = ?auto_1663355 ?auto_1663357 ) ) ( not ( = ?auto_1663355 ?auto_1663359 ) ) ( not ( = ?auto_1663355 ?auto_1663360 ) ) ( not ( = ?auto_1663355 ?auto_1663361 ) ) ( not ( = ?auto_1663355 ?auto_1663362 ) ) ( not ( = ?auto_1663355 ?auto_1663363 ) ) ( not ( = ?auto_1663355 ?auto_1663364 ) ) ( not ( = ?auto_1663355 ?auto_1663365 ) ) ( not ( = ?auto_1663355 ?auto_1663366 ) ) ( not ( = ?auto_1663355 ?auto_1663368 ) ) ( not ( = ?auto_1663352 ?auto_1663356 ) ) ( not ( = ?auto_1663352 ?auto_1663358 ) ) ( not ( = ?auto_1663352 ?auto_1663357 ) ) ( not ( = ?auto_1663352 ?auto_1663359 ) ) ( not ( = ?auto_1663352 ?auto_1663360 ) ) ( not ( = ?auto_1663352 ?auto_1663361 ) ) ( not ( = ?auto_1663352 ?auto_1663362 ) ) ( not ( = ?auto_1663352 ?auto_1663363 ) ) ( not ( = ?auto_1663352 ?auto_1663364 ) ) ( not ( = ?auto_1663352 ?auto_1663365 ) ) ( not ( = ?auto_1663352 ?auto_1663366 ) ) ( not ( = ?auto_1663352 ?auto_1663368 ) ) ( not ( = ?auto_1663356 ?auto_1663358 ) ) ( not ( = ?auto_1663356 ?auto_1663357 ) ) ( not ( = ?auto_1663356 ?auto_1663359 ) ) ( not ( = ?auto_1663356 ?auto_1663360 ) ) ( not ( = ?auto_1663356 ?auto_1663361 ) ) ( not ( = ?auto_1663356 ?auto_1663362 ) ) ( not ( = ?auto_1663356 ?auto_1663363 ) ) ( not ( = ?auto_1663356 ?auto_1663364 ) ) ( not ( = ?auto_1663356 ?auto_1663365 ) ) ( not ( = ?auto_1663356 ?auto_1663366 ) ) ( not ( = ?auto_1663356 ?auto_1663368 ) ) ( not ( = ?auto_1663358 ?auto_1663357 ) ) ( not ( = ?auto_1663358 ?auto_1663359 ) ) ( not ( = ?auto_1663358 ?auto_1663360 ) ) ( not ( = ?auto_1663358 ?auto_1663361 ) ) ( not ( = ?auto_1663358 ?auto_1663362 ) ) ( not ( = ?auto_1663358 ?auto_1663363 ) ) ( not ( = ?auto_1663358 ?auto_1663364 ) ) ( not ( = ?auto_1663358 ?auto_1663365 ) ) ( not ( = ?auto_1663358 ?auto_1663366 ) ) ( not ( = ?auto_1663358 ?auto_1663368 ) ) ( not ( = ?auto_1663357 ?auto_1663359 ) ) ( not ( = ?auto_1663357 ?auto_1663360 ) ) ( not ( = ?auto_1663357 ?auto_1663361 ) ) ( not ( = ?auto_1663357 ?auto_1663362 ) ) ( not ( = ?auto_1663357 ?auto_1663363 ) ) ( not ( = ?auto_1663357 ?auto_1663364 ) ) ( not ( = ?auto_1663357 ?auto_1663365 ) ) ( not ( = ?auto_1663357 ?auto_1663366 ) ) ( not ( = ?auto_1663357 ?auto_1663368 ) ) ( not ( = ?auto_1663359 ?auto_1663360 ) ) ( not ( = ?auto_1663359 ?auto_1663361 ) ) ( not ( = ?auto_1663359 ?auto_1663362 ) ) ( not ( = ?auto_1663359 ?auto_1663363 ) ) ( not ( = ?auto_1663359 ?auto_1663364 ) ) ( not ( = ?auto_1663359 ?auto_1663365 ) ) ( not ( = ?auto_1663359 ?auto_1663366 ) ) ( not ( = ?auto_1663359 ?auto_1663368 ) ) ( not ( = ?auto_1663360 ?auto_1663361 ) ) ( not ( = ?auto_1663360 ?auto_1663362 ) ) ( not ( = ?auto_1663360 ?auto_1663363 ) ) ( not ( = ?auto_1663360 ?auto_1663364 ) ) ( not ( = ?auto_1663360 ?auto_1663365 ) ) ( not ( = ?auto_1663360 ?auto_1663366 ) ) ( not ( = ?auto_1663360 ?auto_1663368 ) ) ( not ( = ?auto_1663361 ?auto_1663362 ) ) ( not ( = ?auto_1663361 ?auto_1663363 ) ) ( not ( = ?auto_1663361 ?auto_1663364 ) ) ( not ( = ?auto_1663361 ?auto_1663365 ) ) ( not ( = ?auto_1663361 ?auto_1663366 ) ) ( not ( = ?auto_1663361 ?auto_1663368 ) ) ( not ( = ?auto_1663362 ?auto_1663363 ) ) ( not ( = ?auto_1663362 ?auto_1663364 ) ) ( not ( = ?auto_1663362 ?auto_1663365 ) ) ( not ( = ?auto_1663362 ?auto_1663366 ) ) ( not ( = ?auto_1663362 ?auto_1663368 ) ) ( not ( = ?auto_1663363 ?auto_1663364 ) ) ( not ( = ?auto_1663363 ?auto_1663365 ) ) ( not ( = ?auto_1663363 ?auto_1663366 ) ) ( not ( = ?auto_1663363 ?auto_1663368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663364 ?auto_1663365 ?auto_1663366 )
      ( MAKE-14CRATE-VERIFY ?auto_1663353 ?auto_1663354 ?auto_1663355 ?auto_1663352 ?auto_1663356 ?auto_1663358 ?auto_1663357 ?auto_1663359 ?auto_1663360 ?auto_1663361 ?auto_1663362 ?auto_1663363 ?auto_1663364 ?auto_1663365 ?auto_1663366 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663557 - SURFACE
      ?auto_1663558 - SURFACE
      ?auto_1663559 - SURFACE
      ?auto_1663556 - SURFACE
      ?auto_1663560 - SURFACE
      ?auto_1663562 - SURFACE
      ?auto_1663561 - SURFACE
      ?auto_1663563 - SURFACE
      ?auto_1663564 - SURFACE
      ?auto_1663565 - SURFACE
      ?auto_1663566 - SURFACE
      ?auto_1663567 - SURFACE
      ?auto_1663568 - SURFACE
      ?auto_1663569 - SURFACE
      ?auto_1663570 - SURFACE
    )
    :vars
    (
      ?auto_1663575 - HOIST
      ?auto_1663576 - PLACE
      ?auto_1663573 - PLACE
      ?auto_1663574 - HOIST
      ?auto_1663571 - SURFACE
      ?auto_1663572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663575 ?auto_1663576 ) ( SURFACE-AT ?auto_1663569 ?auto_1663576 ) ( CLEAR ?auto_1663569 ) ( IS-CRATE ?auto_1663570 ) ( not ( = ?auto_1663569 ?auto_1663570 ) ) ( AVAILABLE ?auto_1663575 ) ( ON ?auto_1663569 ?auto_1663568 ) ( not ( = ?auto_1663568 ?auto_1663569 ) ) ( not ( = ?auto_1663568 ?auto_1663570 ) ) ( not ( = ?auto_1663573 ?auto_1663576 ) ) ( HOIST-AT ?auto_1663574 ?auto_1663573 ) ( not ( = ?auto_1663575 ?auto_1663574 ) ) ( AVAILABLE ?auto_1663574 ) ( SURFACE-AT ?auto_1663570 ?auto_1663573 ) ( ON ?auto_1663570 ?auto_1663571 ) ( CLEAR ?auto_1663570 ) ( not ( = ?auto_1663569 ?auto_1663571 ) ) ( not ( = ?auto_1663570 ?auto_1663571 ) ) ( not ( = ?auto_1663568 ?auto_1663571 ) ) ( TRUCK-AT ?auto_1663572 ?auto_1663576 ) ( ON ?auto_1663558 ?auto_1663557 ) ( ON ?auto_1663559 ?auto_1663558 ) ( ON ?auto_1663556 ?auto_1663559 ) ( ON ?auto_1663560 ?auto_1663556 ) ( ON ?auto_1663562 ?auto_1663560 ) ( ON ?auto_1663561 ?auto_1663562 ) ( ON ?auto_1663563 ?auto_1663561 ) ( ON ?auto_1663564 ?auto_1663563 ) ( ON ?auto_1663565 ?auto_1663564 ) ( ON ?auto_1663566 ?auto_1663565 ) ( ON ?auto_1663567 ?auto_1663566 ) ( ON ?auto_1663568 ?auto_1663567 ) ( not ( = ?auto_1663557 ?auto_1663558 ) ) ( not ( = ?auto_1663557 ?auto_1663559 ) ) ( not ( = ?auto_1663557 ?auto_1663556 ) ) ( not ( = ?auto_1663557 ?auto_1663560 ) ) ( not ( = ?auto_1663557 ?auto_1663562 ) ) ( not ( = ?auto_1663557 ?auto_1663561 ) ) ( not ( = ?auto_1663557 ?auto_1663563 ) ) ( not ( = ?auto_1663557 ?auto_1663564 ) ) ( not ( = ?auto_1663557 ?auto_1663565 ) ) ( not ( = ?auto_1663557 ?auto_1663566 ) ) ( not ( = ?auto_1663557 ?auto_1663567 ) ) ( not ( = ?auto_1663557 ?auto_1663568 ) ) ( not ( = ?auto_1663557 ?auto_1663569 ) ) ( not ( = ?auto_1663557 ?auto_1663570 ) ) ( not ( = ?auto_1663557 ?auto_1663571 ) ) ( not ( = ?auto_1663558 ?auto_1663559 ) ) ( not ( = ?auto_1663558 ?auto_1663556 ) ) ( not ( = ?auto_1663558 ?auto_1663560 ) ) ( not ( = ?auto_1663558 ?auto_1663562 ) ) ( not ( = ?auto_1663558 ?auto_1663561 ) ) ( not ( = ?auto_1663558 ?auto_1663563 ) ) ( not ( = ?auto_1663558 ?auto_1663564 ) ) ( not ( = ?auto_1663558 ?auto_1663565 ) ) ( not ( = ?auto_1663558 ?auto_1663566 ) ) ( not ( = ?auto_1663558 ?auto_1663567 ) ) ( not ( = ?auto_1663558 ?auto_1663568 ) ) ( not ( = ?auto_1663558 ?auto_1663569 ) ) ( not ( = ?auto_1663558 ?auto_1663570 ) ) ( not ( = ?auto_1663558 ?auto_1663571 ) ) ( not ( = ?auto_1663559 ?auto_1663556 ) ) ( not ( = ?auto_1663559 ?auto_1663560 ) ) ( not ( = ?auto_1663559 ?auto_1663562 ) ) ( not ( = ?auto_1663559 ?auto_1663561 ) ) ( not ( = ?auto_1663559 ?auto_1663563 ) ) ( not ( = ?auto_1663559 ?auto_1663564 ) ) ( not ( = ?auto_1663559 ?auto_1663565 ) ) ( not ( = ?auto_1663559 ?auto_1663566 ) ) ( not ( = ?auto_1663559 ?auto_1663567 ) ) ( not ( = ?auto_1663559 ?auto_1663568 ) ) ( not ( = ?auto_1663559 ?auto_1663569 ) ) ( not ( = ?auto_1663559 ?auto_1663570 ) ) ( not ( = ?auto_1663559 ?auto_1663571 ) ) ( not ( = ?auto_1663556 ?auto_1663560 ) ) ( not ( = ?auto_1663556 ?auto_1663562 ) ) ( not ( = ?auto_1663556 ?auto_1663561 ) ) ( not ( = ?auto_1663556 ?auto_1663563 ) ) ( not ( = ?auto_1663556 ?auto_1663564 ) ) ( not ( = ?auto_1663556 ?auto_1663565 ) ) ( not ( = ?auto_1663556 ?auto_1663566 ) ) ( not ( = ?auto_1663556 ?auto_1663567 ) ) ( not ( = ?auto_1663556 ?auto_1663568 ) ) ( not ( = ?auto_1663556 ?auto_1663569 ) ) ( not ( = ?auto_1663556 ?auto_1663570 ) ) ( not ( = ?auto_1663556 ?auto_1663571 ) ) ( not ( = ?auto_1663560 ?auto_1663562 ) ) ( not ( = ?auto_1663560 ?auto_1663561 ) ) ( not ( = ?auto_1663560 ?auto_1663563 ) ) ( not ( = ?auto_1663560 ?auto_1663564 ) ) ( not ( = ?auto_1663560 ?auto_1663565 ) ) ( not ( = ?auto_1663560 ?auto_1663566 ) ) ( not ( = ?auto_1663560 ?auto_1663567 ) ) ( not ( = ?auto_1663560 ?auto_1663568 ) ) ( not ( = ?auto_1663560 ?auto_1663569 ) ) ( not ( = ?auto_1663560 ?auto_1663570 ) ) ( not ( = ?auto_1663560 ?auto_1663571 ) ) ( not ( = ?auto_1663562 ?auto_1663561 ) ) ( not ( = ?auto_1663562 ?auto_1663563 ) ) ( not ( = ?auto_1663562 ?auto_1663564 ) ) ( not ( = ?auto_1663562 ?auto_1663565 ) ) ( not ( = ?auto_1663562 ?auto_1663566 ) ) ( not ( = ?auto_1663562 ?auto_1663567 ) ) ( not ( = ?auto_1663562 ?auto_1663568 ) ) ( not ( = ?auto_1663562 ?auto_1663569 ) ) ( not ( = ?auto_1663562 ?auto_1663570 ) ) ( not ( = ?auto_1663562 ?auto_1663571 ) ) ( not ( = ?auto_1663561 ?auto_1663563 ) ) ( not ( = ?auto_1663561 ?auto_1663564 ) ) ( not ( = ?auto_1663561 ?auto_1663565 ) ) ( not ( = ?auto_1663561 ?auto_1663566 ) ) ( not ( = ?auto_1663561 ?auto_1663567 ) ) ( not ( = ?auto_1663561 ?auto_1663568 ) ) ( not ( = ?auto_1663561 ?auto_1663569 ) ) ( not ( = ?auto_1663561 ?auto_1663570 ) ) ( not ( = ?auto_1663561 ?auto_1663571 ) ) ( not ( = ?auto_1663563 ?auto_1663564 ) ) ( not ( = ?auto_1663563 ?auto_1663565 ) ) ( not ( = ?auto_1663563 ?auto_1663566 ) ) ( not ( = ?auto_1663563 ?auto_1663567 ) ) ( not ( = ?auto_1663563 ?auto_1663568 ) ) ( not ( = ?auto_1663563 ?auto_1663569 ) ) ( not ( = ?auto_1663563 ?auto_1663570 ) ) ( not ( = ?auto_1663563 ?auto_1663571 ) ) ( not ( = ?auto_1663564 ?auto_1663565 ) ) ( not ( = ?auto_1663564 ?auto_1663566 ) ) ( not ( = ?auto_1663564 ?auto_1663567 ) ) ( not ( = ?auto_1663564 ?auto_1663568 ) ) ( not ( = ?auto_1663564 ?auto_1663569 ) ) ( not ( = ?auto_1663564 ?auto_1663570 ) ) ( not ( = ?auto_1663564 ?auto_1663571 ) ) ( not ( = ?auto_1663565 ?auto_1663566 ) ) ( not ( = ?auto_1663565 ?auto_1663567 ) ) ( not ( = ?auto_1663565 ?auto_1663568 ) ) ( not ( = ?auto_1663565 ?auto_1663569 ) ) ( not ( = ?auto_1663565 ?auto_1663570 ) ) ( not ( = ?auto_1663565 ?auto_1663571 ) ) ( not ( = ?auto_1663566 ?auto_1663567 ) ) ( not ( = ?auto_1663566 ?auto_1663568 ) ) ( not ( = ?auto_1663566 ?auto_1663569 ) ) ( not ( = ?auto_1663566 ?auto_1663570 ) ) ( not ( = ?auto_1663566 ?auto_1663571 ) ) ( not ( = ?auto_1663567 ?auto_1663568 ) ) ( not ( = ?auto_1663567 ?auto_1663569 ) ) ( not ( = ?auto_1663567 ?auto_1663570 ) ) ( not ( = ?auto_1663567 ?auto_1663571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663568 ?auto_1663569 ?auto_1663570 )
      ( MAKE-14CRATE-VERIFY ?auto_1663557 ?auto_1663558 ?auto_1663559 ?auto_1663556 ?auto_1663560 ?auto_1663562 ?auto_1663561 ?auto_1663563 ?auto_1663564 ?auto_1663565 ?auto_1663566 ?auto_1663567 ?auto_1663568 ?auto_1663569 ?auto_1663570 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663761 - SURFACE
      ?auto_1663762 - SURFACE
      ?auto_1663763 - SURFACE
      ?auto_1663760 - SURFACE
      ?auto_1663764 - SURFACE
      ?auto_1663766 - SURFACE
      ?auto_1663765 - SURFACE
      ?auto_1663767 - SURFACE
      ?auto_1663768 - SURFACE
      ?auto_1663769 - SURFACE
      ?auto_1663770 - SURFACE
      ?auto_1663771 - SURFACE
      ?auto_1663772 - SURFACE
      ?auto_1663773 - SURFACE
      ?auto_1663774 - SURFACE
    )
    :vars
    (
      ?auto_1663778 - HOIST
      ?auto_1663777 - PLACE
      ?auto_1663779 - PLACE
      ?auto_1663780 - HOIST
      ?auto_1663776 - SURFACE
      ?auto_1663775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663778 ?auto_1663777 ) ( IS-CRATE ?auto_1663774 ) ( not ( = ?auto_1663773 ?auto_1663774 ) ) ( not ( = ?auto_1663772 ?auto_1663773 ) ) ( not ( = ?auto_1663772 ?auto_1663774 ) ) ( not ( = ?auto_1663779 ?auto_1663777 ) ) ( HOIST-AT ?auto_1663780 ?auto_1663779 ) ( not ( = ?auto_1663778 ?auto_1663780 ) ) ( AVAILABLE ?auto_1663780 ) ( SURFACE-AT ?auto_1663774 ?auto_1663779 ) ( ON ?auto_1663774 ?auto_1663776 ) ( CLEAR ?auto_1663774 ) ( not ( = ?auto_1663773 ?auto_1663776 ) ) ( not ( = ?auto_1663774 ?auto_1663776 ) ) ( not ( = ?auto_1663772 ?auto_1663776 ) ) ( TRUCK-AT ?auto_1663775 ?auto_1663777 ) ( SURFACE-AT ?auto_1663772 ?auto_1663777 ) ( CLEAR ?auto_1663772 ) ( LIFTING ?auto_1663778 ?auto_1663773 ) ( IS-CRATE ?auto_1663773 ) ( ON ?auto_1663762 ?auto_1663761 ) ( ON ?auto_1663763 ?auto_1663762 ) ( ON ?auto_1663760 ?auto_1663763 ) ( ON ?auto_1663764 ?auto_1663760 ) ( ON ?auto_1663766 ?auto_1663764 ) ( ON ?auto_1663765 ?auto_1663766 ) ( ON ?auto_1663767 ?auto_1663765 ) ( ON ?auto_1663768 ?auto_1663767 ) ( ON ?auto_1663769 ?auto_1663768 ) ( ON ?auto_1663770 ?auto_1663769 ) ( ON ?auto_1663771 ?auto_1663770 ) ( ON ?auto_1663772 ?auto_1663771 ) ( not ( = ?auto_1663761 ?auto_1663762 ) ) ( not ( = ?auto_1663761 ?auto_1663763 ) ) ( not ( = ?auto_1663761 ?auto_1663760 ) ) ( not ( = ?auto_1663761 ?auto_1663764 ) ) ( not ( = ?auto_1663761 ?auto_1663766 ) ) ( not ( = ?auto_1663761 ?auto_1663765 ) ) ( not ( = ?auto_1663761 ?auto_1663767 ) ) ( not ( = ?auto_1663761 ?auto_1663768 ) ) ( not ( = ?auto_1663761 ?auto_1663769 ) ) ( not ( = ?auto_1663761 ?auto_1663770 ) ) ( not ( = ?auto_1663761 ?auto_1663771 ) ) ( not ( = ?auto_1663761 ?auto_1663772 ) ) ( not ( = ?auto_1663761 ?auto_1663773 ) ) ( not ( = ?auto_1663761 ?auto_1663774 ) ) ( not ( = ?auto_1663761 ?auto_1663776 ) ) ( not ( = ?auto_1663762 ?auto_1663763 ) ) ( not ( = ?auto_1663762 ?auto_1663760 ) ) ( not ( = ?auto_1663762 ?auto_1663764 ) ) ( not ( = ?auto_1663762 ?auto_1663766 ) ) ( not ( = ?auto_1663762 ?auto_1663765 ) ) ( not ( = ?auto_1663762 ?auto_1663767 ) ) ( not ( = ?auto_1663762 ?auto_1663768 ) ) ( not ( = ?auto_1663762 ?auto_1663769 ) ) ( not ( = ?auto_1663762 ?auto_1663770 ) ) ( not ( = ?auto_1663762 ?auto_1663771 ) ) ( not ( = ?auto_1663762 ?auto_1663772 ) ) ( not ( = ?auto_1663762 ?auto_1663773 ) ) ( not ( = ?auto_1663762 ?auto_1663774 ) ) ( not ( = ?auto_1663762 ?auto_1663776 ) ) ( not ( = ?auto_1663763 ?auto_1663760 ) ) ( not ( = ?auto_1663763 ?auto_1663764 ) ) ( not ( = ?auto_1663763 ?auto_1663766 ) ) ( not ( = ?auto_1663763 ?auto_1663765 ) ) ( not ( = ?auto_1663763 ?auto_1663767 ) ) ( not ( = ?auto_1663763 ?auto_1663768 ) ) ( not ( = ?auto_1663763 ?auto_1663769 ) ) ( not ( = ?auto_1663763 ?auto_1663770 ) ) ( not ( = ?auto_1663763 ?auto_1663771 ) ) ( not ( = ?auto_1663763 ?auto_1663772 ) ) ( not ( = ?auto_1663763 ?auto_1663773 ) ) ( not ( = ?auto_1663763 ?auto_1663774 ) ) ( not ( = ?auto_1663763 ?auto_1663776 ) ) ( not ( = ?auto_1663760 ?auto_1663764 ) ) ( not ( = ?auto_1663760 ?auto_1663766 ) ) ( not ( = ?auto_1663760 ?auto_1663765 ) ) ( not ( = ?auto_1663760 ?auto_1663767 ) ) ( not ( = ?auto_1663760 ?auto_1663768 ) ) ( not ( = ?auto_1663760 ?auto_1663769 ) ) ( not ( = ?auto_1663760 ?auto_1663770 ) ) ( not ( = ?auto_1663760 ?auto_1663771 ) ) ( not ( = ?auto_1663760 ?auto_1663772 ) ) ( not ( = ?auto_1663760 ?auto_1663773 ) ) ( not ( = ?auto_1663760 ?auto_1663774 ) ) ( not ( = ?auto_1663760 ?auto_1663776 ) ) ( not ( = ?auto_1663764 ?auto_1663766 ) ) ( not ( = ?auto_1663764 ?auto_1663765 ) ) ( not ( = ?auto_1663764 ?auto_1663767 ) ) ( not ( = ?auto_1663764 ?auto_1663768 ) ) ( not ( = ?auto_1663764 ?auto_1663769 ) ) ( not ( = ?auto_1663764 ?auto_1663770 ) ) ( not ( = ?auto_1663764 ?auto_1663771 ) ) ( not ( = ?auto_1663764 ?auto_1663772 ) ) ( not ( = ?auto_1663764 ?auto_1663773 ) ) ( not ( = ?auto_1663764 ?auto_1663774 ) ) ( not ( = ?auto_1663764 ?auto_1663776 ) ) ( not ( = ?auto_1663766 ?auto_1663765 ) ) ( not ( = ?auto_1663766 ?auto_1663767 ) ) ( not ( = ?auto_1663766 ?auto_1663768 ) ) ( not ( = ?auto_1663766 ?auto_1663769 ) ) ( not ( = ?auto_1663766 ?auto_1663770 ) ) ( not ( = ?auto_1663766 ?auto_1663771 ) ) ( not ( = ?auto_1663766 ?auto_1663772 ) ) ( not ( = ?auto_1663766 ?auto_1663773 ) ) ( not ( = ?auto_1663766 ?auto_1663774 ) ) ( not ( = ?auto_1663766 ?auto_1663776 ) ) ( not ( = ?auto_1663765 ?auto_1663767 ) ) ( not ( = ?auto_1663765 ?auto_1663768 ) ) ( not ( = ?auto_1663765 ?auto_1663769 ) ) ( not ( = ?auto_1663765 ?auto_1663770 ) ) ( not ( = ?auto_1663765 ?auto_1663771 ) ) ( not ( = ?auto_1663765 ?auto_1663772 ) ) ( not ( = ?auto_1663765 ?auto_1663773 ) ) ( not ( = ?auto_1663765 ?auto_1663774 ) ) ( not ( = ?auto_1663765 ?auto_1663776 ) ) ( not ( = ?auto_1663767 ?auto_1663768 ) ) ( not ( = ?auto_1663767 ?auto_1663769 ) ) ( not ( = ?auto_1663767 ?auto_1663770 ) ) ( not ( = ?auto_1663767 ?auto_1663771 ) ) ( not ( = ?auto_1663767 ?auto_1663772 ) ) ( not ( = ?auto_1663767 ?auto_1663773 ) ) ( not ( = ?auto_1663767 ?auto_1663774 ) ) ( not ( = ?auto_1663767 ?auto_1663776 ) ) ( not ( = ?auto_1663768 ?auto_1663769 ) ) ( not ( = ?auto_1663768 ?auto_1663770 ) ) ( not ( = ?auto_1663768 ?auto_1663771 ) ) ( not ( = ?auto_1663768 ?auto_1663772 ) ) ( not ( = ?auto_1663768 ?auto_1663773 ) ) ( not ( = ?auto_1663768 ?auto_1663774 ) ) ( not ( = ?auto_1663768 ?auto_1663776 ) ) ( not ( = ?auto_1663769 ?auto_1663770 ) ) ( not ( = ?auto_1663769 ?auto_1663771 ) ) ( not ( = ?auto_1663769 ?auto_1663772 ) ) ( not ( = ?auto_1663769 ?auto_1663773 ) ) ( not ( = ?auto_1663769 ?auto_1663774 ) ) ( not ( = ?auto_1663769 ?auto_1663776 ) ) ( not ( = ?auto_1663770 ?auto_1663771 ) ) ( not ( = ?auto_1663770 ?auto_1663772 ) ) ( not ( = ?auto_1663770 ?auto_1663773 ) ) ( not ( = ?auto_1663770 ?auto_1663774 ) ) ( not ( = ?auto_1663770 ?auto_1663776 ) ) ( not ( = ?auto_1663771 ?auto_1663772 ) ) ( not ( = ?auto_1663771 ?auto_1663773 ) ) ( not ( = ?auto_1663771 ?auto_1663774 ) ) ( not ( = ?auto_1663771 ?auto_1663776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663772 ?auto_1663773 ?auto_1663774 )
      ( MAKE-14CRATE-VERIFY ?auto_1663761 ?auto_1663762 ?auto_1663763 ?auto_1663760 ?auto_1663764 ?auto_1663766 ?auto_1663765 ?auto_1663767 ?auto_1663768 ?auto_1663769 ?auto_1663770 ?auto_1663771 ?auto_1663772 ?auto_1663773 ?auto_1663774 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663965 - SURFACE
      ?auto_1663966 - SURFACE
      ?auto_1663967 - SURFACE
      ?auto_1663964 - SURFACE
      ?auto_1663968 - SURFACE
      ?auto_1663970 - SURFACE
      ?auto_1663969 - SURFACE
      ?auto_1663971 - SURFACE
      ?auto_1663972 - SURFACE
      ?auto_1663973 - SURFACE
      ?auto_1663974 - SURFACE
      ?auto_1663975 - SURFACE
      ?auto_1663976 - SURFACE
      ?auto_1663977 - SURFACE
      ?auto_1663978 - SURFACE
    )
    :vars
    (
      ?auto_1663979 - HOIST
      ?auto_1663984 - PLACE
      ?auto_1663983 - PLACE
      ?auto_1663980 - HOIST
      ?auto_1663981 - SURFACE
      ?auto_1663982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663979 ?auto_1663984 ) ( IS-CRATE ?auto_1663978 ) ( not ( = ?auto_1663977 ?auto_1663978 ) ) ( not ( = ?auto_1663976 ?auto_1663977 ) ) ( not ( = ?auto_1663976 ?auto_1663978 ) ) ( not ( = ?auto_1663983 ?auto_1663984 ) ) ( HOIST-AT ?auto_1663980 ?auto_1663983 ) ( not ( = ?auto_1663979 ?auto_1663980 ) ) ( AVAILABLE ?auto_1663980 ) ( SURFACE-AT ?auto_1663978 ?auto_1663983 ) ( ON ?auto_1663978 ?auto_1663981 ) ( CLEAR ?auto_1663978 ) ( not ( = ?auto_1663977 ?auto_1663981 ) ) ( not ( = ?auto_1663978 ?auto_1663981 ) ) ( not ( = ?auto_1663976 ?auto_1663981 ) ) ( TRUCK-AT ?auto_1663982 ?auto_1663984 ) ( SURFACE-AT ?auto_1663976 ?auto_1663984 ) ( CLEAR ?auto_1663976 ) ( IS-CRATE ?auto_1663977 ) ( AVAILABLE ?auto_1663979 ) ( IN ?auto_1663977 ?auto_1663982 ) ( ON ?auto_1663966 ?auto_1663965 ) ( ON ?auto_1663967 ?auto_1663966 ) ( ON ?auto_1663964 ?auto_1663967 ) ( ON ?auto_1663968 ?auto_1663964 ) ( ON ?auto_1663970 ?auto_1663968 ) ( ON ?auto_1663969 ?auto_1663970 ) ( ON ?auto_1663971 ?auto_1663969 ) ( ON ?auto_1663972 ?auto_1663971 ) ( ON ?auto_1663973 ?auto_1663972 ) ( ON ?auto_1663974 ?auto_1663973 ) ( ON ?auto_1663975 ?auto_1663974 ) ( ON ?auto_1663976 ?auto_1663975 ) ( not ( = ?auto_1663965 ?auto_1663966 ) ) ( not ( = ?auto_1663965 ?auto_1663967 ) ) ( not ( = ?auto_1663965 ?auto_1663964 ) ) ( not ( = ?auto_1663965 ?auto_1663968 ) ) ( not ( = ?auto_1663965 ?auto_1663970 ) ) ( not ( = ?auto_1663965 ?auto_1663969 ) ) ( not ( = ?auto_1663965 ?auto_1663971 ) ) ( not ( = ?auto_1663965 ?auto_1663972 ) ) ( not ( = ?auto_1663965 ?auto_1663973 ) ) ( not ( = ?auto_1663965 ?auto_1663974 ) ) ( not ( = ?auto_1663965 ?auto_1663975 ) ) ( not ( = ?auto_1663965 ?auto_1663976 ) ) ( not ( = ?auto_1663965 ?auto_1663977 ) ) ( not ( = ?auto_1663965 ?auto_1663978 ) ) ( not ( = ?auto_1663965 ?auto_1663981 ) ) ( not ( = ?auto_1663966 ?auto_1663967 ) ) ( not ( = ?auto_1663966 ?auto_1663964 ) ) ( not ( = ?auto_1663966 ?auto_1663968 ) ) ( not ( = ?auto_1663966 ?auto_1663970 ) ) ( not ( = ?auto_1663966 ?auto_1663969 ) ) ( not ( = ?auto_1663966 ?auto_1663971 ) ) ( not ( = ?auto_1663966 ?auto_1663972 ) ) ( not ( = ?auto_1663966 ?auto_1663973 ) ) ( not ( = ?auto_1663966 ?auto_1663974 ) ) ( not ( = ?auto_1663966 ?auto_1663975 ) ) ( not ( = ?auto_1663966 ?auto_1663976 ) ) ( not ( = ?auto_1663966 ?auto_1663977 ) ) ( not ( = ?auto_1663966 ?auto_1663978 ) ) ( not ( = ?auto_1663966 ?auto_1663981 ) ) ( not ( = ?auto_1663967 ?auto_1663964 ) ) ( not ( = ?auto_1663967 ?auto_1663968 ) ) ( not ( = ?auto_1663967 ?auto_1663970 ) ) ( not ( = ?auto_1663967 ?auto_1663969 ) ) ( not ( = ?auto_1663967 ?auto_1663971 ) ) ( not ( = ?auto_1663967 ?auto_1663972 ) ) ( not ( = ?auto_1663967 ?auto_1663973 ) ) ( not ( = ?auto_1663967 ?auto_1663974 ) ) ( not ( = ?auto_1663967 ?auto_1663975 ) ) ( not ( = ?auto_1663967 ?auto_1663976 ) ) ( not ( = ?auto_1663967 ?auto_1663977 ) ) ( not ( = ?auto_1663967 ?auto_1663978 ) ) ( not ( = ?auto_1663967 ?auto_1663981 ) ) ( not ( = ?auto_1663964 ?auto_1663968 ) ) ( not ( = ?auto_1663964 ?auto_1663970 ) ) ( not ( = ?auto_1663964 ?auto_1663969 ) ) ( not ( = ?auto_1663964 ?auto_1663971 ) ) ( not ( = ?auto_1663964 ?auto_1663972 ) ) ( not ( = ?auto_1663964 ?auto_1663973 ) ) ( not ( = ?auto_1663964 ?auto_1663974 ) ) ( not ( = ?auto_1663964 ?auto_1663975 ) ) ( not ( = ?auto_1663964 ?auto_1663976 ) ) ( not ( = ?auto_1663964 ?auto_1663977 ) ) ( not ( = ?auto_1663964 ?auto_1663978 ) ) ( not ( = ?auto_1663964 ?auto_1663981 ) ) ( not ( = ?auto_1663968 ?auto_1663970 ) ) ( not ( = ?auto_1663968 ?auto_1663969 ) ) ( not ( = ?auto_1663968 ?auto_1663971 ) ) ( not ( = ?auto_1663968 ?auto_1663972 ) ) ( not ( = ?auto_1663968 ?auto_1663973 ) ) ( not ( = ?auto_1663968 ?auto_1663974 ) ) ( not ( = ?auto_1663968 ?auto_1663975 ) ) ( not ( = ?auto_1663968 ?auto_1663976 ) ) ( not ( = ?auto_1663968 ?auto_1663977 ) ) ( not ( = ?auto_1663968 ?auto_1663978 ) ) ( not ( = ?auto_1663968 ?auto_1663981 ) ) ( not ( = ?auto_1663970 ?auto_1663969 ) ) ( not ( = ?auto_1663970 ?auto_1663971 ) ) ( not ( = ?auto_1663970 ?auto_1663972 ) ) ( not ( = ?auto_1663970 ?auto_1663973 ) ) ( not ( = ?auto_1663970 ?auto_1663974 ) ) ( not ( = ?auto_1663970 ?auto_1663975 ) ) ( not ( = ?auto_1663970 ?auto_1663976 ) ) ( not ( = ?auto_1663970 ?auto_1663977 ) ) ( not ( = ?auto_1663970 ?auto_1663978 ) ) ( not ( = ?auto_1663970 ?auto_1663981 ) ) ( not ( = ?auto_1663969 ?auto_1663971 ) ) ( not ( = ?auto_1663969 ?auto_1663972 ) ) ( not ( = ?auto_1663969 ?auto_1663973 ) ) ( not ( = ?auto_1663969 ?auto_1663974 ) ) ( not ( = ?auto_1663969 ?auto_1663975 ) ) ( not ( = ?auto_1663969 ?auto_1663976 ) ) ( not ( = ?auto_1663969 ?auto_1663977 ) ) ( not ( = ?auto_1663969 ?auto_1663978 ) ) ( not ( = ?auto_1663969 ?auto_1663981 ) ) ( not ( = ?auto_1663971 ?auto_1663972 ) ) ( not ( = ?auto_1663971 ?auto_1663973 ) ) ( not ( = ?auto_1663971 ?auto_1663974 ) ) ( not ( = ?auto_1663971 ?auto_1663975 ) ) ( not ( = ?auto_1663971 ?auto_1663976 ) ) ( not ( = ?auto_1663971 ?auto_1663977 ) ) ( not ( = ?auto_1663971 ?auto_1663978 ) ) ( not ( = ?auto_1663971 ?auto_1663981 ) ) ( not ( = ?auto_1663972 ?auto_1663973 ) ) ( not ( = ?auto_1663972 ?auto_1663974 ) ) ( not ( = ?auto_1663972 ?auto_1663975 ) ) ( not ( = ?auto_1663972 ?auto_1663976 ) ) ( not ( = ?auto_1663972 ?auto_1663977 ) ) ( not ( = ?auto_1663972 ?auto_1663978 ) ) ( not ( = ?auto_1663972 ?auto_1663981 ) ) ( not ( = ?auto_1663973 ?auto_1663974 ) ) ( not ( = ?auto_1663973 ?auto_1663975 ) ) ( not ( = ?auto_1663973 ?auto_1663976 ) ) ( not ( = ?auto_1663973 ?auto_1663977 ) ) ( not ( = ?auto_1663973 ?auto_1663978 ) ) ( not ( = ?auto_1663973 ?auto_1663981 ) ) ( not ( = ?auto_1663974 ?auto_1663975 ) ) ( not ( = ?auto_1663974 ?auto_1663976 ) ) ( not ( = ?auto_1663974 ?auto_1663977 ) ) ( not ( = ?auto_1663974 ?auto_1663978 ) ) ( not ( = ?auto_1663974 ?auto_1663981 ) ) ( not ( = ?auto_1663975 ?auto_1663976 ) ) ( not ( = ?auto_1663975 ?auto_1663977 ) ) ( not ( = ?auto_1663975 ?auto_1663978 ) ) ( not ( = ?auto_1663975 ?auto_1663981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663976 ?auto_1663977 ?auto_1663978 )
      ( MAKE-14CRATE-VERIFY ?auto_1663965 ?auto_1663966 ?auto_1663967 ?auto_1663964 ?auto_1663968 ?auto_1663970 ?auto_1663969 ?auto_1663971 ?auto_1663972 ?auto_1663973 ?auto_1663974 ?auto_1663975 ?auto_1663976 ?auto_1663977 ?auto_1663978 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681156 - SURFACE
      ?auto_1681157 - SURFACE
      ?auto_1681158 - SURFACE
      ?auto_1681155 - SURFACE
      ?auto_1681159 - SURFACE
      ?auto_1681161 - SURFACE
      ?auto_1681160 - SURFACE
      ?auto_1681162 - SURFACE
      ?auto_1681163 - SURFACE
      ?auto_1681164 - SURFACE
      ?auto_1681165 - SURFACE
      ?auto_1681166 - SURFACE
      ?auto_1681167 - SURFACE
      ?auto_1681168 - SURFACE
      ?auto_1681169 - SURFACE
      ?auto_1681170 - SURFACE
    )
    :vars
    (
      ?auto_1681172 - HOIST
      ?auto_1681171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681172 ?auto_1681171 ) ( SURFACE-AT ?auto_1681169 ?auto_1681171 ) ( CLEAR ?auto_1681169 ) ( LIFTING ?auto_1681172 ?auto_1681170 ) ( IS-CRATE ?auto_1681170 ) ( not ( = ?auto_1681169 ?auto_1681170 ) ) ( ON ?auto_1681157 ?auto_1681156 ) ( ON ?auto_1681158 ?auto_1681157 ) ( ON ?auto_1681155 ?auto_1681158 ) ( ON ?auto_1681159 ?auto_1681155 ) ( ON ?auto_1681161 ?auto_1681159 ) ( ON ?auto_1681160 ?auto_1681161 ) ( ON ?auto_1681162 ?auto_1681160 ) ( ON ?auto_1681163 ?auto_1681162 ) ( ON ?auto_1681164 ?auto_1681163 ) ( ON ?auto_1681165 ?auto_1681164 ) ( ON ?auto_1681166 ?auto_1681165 ) ( ON ?auto_1681167 ?auto_1681166 ) ( ON ?auto_1681168 ?auto_1681167 ) ( ON ?auto_1681169 ?auto_1681168 ) ( not ( = ?auto_1681156 ?auto_1681157 ) ) ( not ( = ?auto_1681156 ?auto_1681158 ) ) ( not ( = ?auto_1681156 ?auto_1681155 ) ) ( not ( = ?auto_1681156 ?auto_1681159 ) ) ( not ( = ?auto_1681156 ?auto_1681161 ) ) ( not ( = ?auto_1681156 ?auto_1681160 ) ) ( not ( = ?auto_1681156 ?auto_1681162 ) ) ( not ( = ?auto_1681156 ?auto_1681163 ) ) ( not ( = ?auto_1681156 ?auto_1681164 ) ) ( not ( = ?auto_1681156 ?auto_1681165 ) ) ( not ( = ?auto_1681156 ?auto_1681166 ) ) ( not ( = ?auto_1681156 ?auto_1681167 ) ) ( not ( = ?auto_1681156 ?auto_1681168 ) ) ( not ( = ?auto_1681156 ?auto_1681169 ) ) ( not ( = ?auto_1681156 ?auto_1681170 ) ) ( not ( = ?auto_1681157 ?auto_1681158 ) ) ( not ( = ?auto_1681157 ?auto_1681155 ) ) ( not ( = ?auto_1681157 ?auto_1681159 ) ) ( not ( = ?auto_1681157 ?auto_1681161 ) ) ( not ( = ?auto_1681157 ?auto_1681160 ) ) ( not ( = ?auto_1681157 ?auto_1681162 ) ) ( not ( = ?auto_1681157 ?auto_1681163 ) ) ( not ( = ?auto_1681157 ?auto_1681164 ) ) ( not ( = ?auto_1681157 ?auto_1681165 ) ) ( not ( = ?auto_1681157 ?auto_1681166 ) ) ( not ( = ?auto_1681157 ?auto_1681167 ) ) ( not ( = ?auto_1681157 ?auto_1681168 ) ) ( not ( = ?auto_1681157 ?auto_1681169 ) ) ( not ( = ?auto_1681157 ?auto_1681170 ) ) ( not ( = ?auto_1681158 ?auto_1681155 ) ) ( not ( = ?auto_1681158 ?auto_1681159 ) ) ( not ( = ?auto_1681158 ?auto_1681161 ) ) ( not ( = ?auto_1681158 ?auto_1681160 ) ) ( not ( = ?auto_1681158 ?auto_1681162 ) ) ( not ( = ?auto_1681158 ?auto_1681163 ) ) ( not ( = ?auto_1681158 ?auto_1681164 ) ) ( not ( = ?auto_1681158 ?auto_1681165 ) ) ( not ( = ?auto_1681158 ?auto_1681166 ) ) ( not ( = ?auto_1681158 ?auto_1681167 ) ) ( not ( = ?auto_1681158 ?auto_1681168 ) ) ( not ( = ?auto_1681158 ?auto_1681169 ) ) ( not ( = ?auto_1681158 ?auto_1681170 ) ) ( not ( = ?auto_1681155 ?auto_1681159 ) ) ( not ( = ?auto_1681155 ?auto_1681161 ) ) ( not ( = ?auto_1681155 ?auto_1681160 ) ) ( not ( = ?auto_1681155 ?auto_1681162 ) ) ( not ( = ?auto_1681155 ?auto_1681163 ) ) ( not ( = ?auto_1681155 ?auto_1681164 ) ) ( not ( = ?auto_1681155 ?auto_1681165 ) ) ( not ( = ?auto_1681155 ?auto_1681166 ) ) ( not ( = ?auto_1681155 ?auto_1681167 ) ) ( not ( = ?auto_1681155 ?auto_1681168 ) ) ( not ( = ?auto_1681155 ?auto_1681169 ) ) ( not ( = ?auto_1681155 ?auto_1681170 ) ) ( not ( = ?auto_1681159 ?auto_1681161 ) ) ( not ( = ?auto_1681159 ?auto_1681160 ) ) ( not ( = ?auto_1681159 ?auto_1681162 ) ) ( not ( = ?auto_1681159 ?auto_1681163 ) ) ( not ( = ?auto_1681159 ?auto_1681164 ) ) ( not ( = ?auto_1681159 ?auto_1681165 ) ) ( not ( = ?auto_1681159 ?auto_1681166 ) ) ( not ( = ?auto_1681159 ?auto_1681167 ) ) ( not ( = ?auto_1681159 ?auto_1681168 ) ) ( not ( = ?auto_1681159 ?auto_1681169 ) ) ( not ( = ?auto_1681159 ?auto_1681170 ) ) ( not ( = ?auto_1681161 ?auto_1681160 ) ) ( not ( = ?auto_1681161 ?auto_1681162 ) ) ( not ( = ?auto_1681161 ?auto_1681163 ) ) ( not ( = ?auto_1681161 ?auto_1681164 ) ) ( not ( = ?auto_1681161 ?auto_1681165 ) ) ( not ( = ?auto_1681161 ?auto_1681166 ) ) ( not ( = ?auto_1681161 ?auto_1681167 ) ) ( not ( = ?auto_1681161 ?auto_1681168 ) ) ( not ( = ?auto_1681161 ?auto_1681169 ) ) ( not ( = ?auto_1681161 ?auto_1681170 ) ) ( not ( = ?auto_1681160 ?auto_1681162 ) ) ( not ( = ?auto_1681160 ?auto_1681163 ) ) ( not ( = ?auto_1681160 ?auto_1681164 ) ) ( not ( = ?auto_1681160 ?auto_1681165 ) ) ( not ( = ?auto_1681160 ?auto_1681166 ) ) ( not ( = ?auto_1681160 ?auto_1681167 ) ) ( not ( = ?auto_1681160 ?auto_1681168 ) ) ( not ( = ?auto_1681160 ?auto_1681169 ) ) ( not ( = ?auto_1681160 ?auto_1681170 ) ) ( not ( = ?auto_1681162 ?auto_1681163 ) ) ( not ( = ?auto_1681162 ?auto_1681164 ) ) ( not ( = ?auto_1681162 ?auto_1681165 ) ) ( not ( = ?auto_1681162 ?auto_1681166 ) ) ( not ( = ?auto_1681162 ?auto_1681167 ) ) ( not ( = ?auto_1681162 ?auto_1681168 ) ) ( not ( = ?auto_1681162 ?auto_1681169 ) ) ( not ( = ?auto_1681162 ?auto_1681170 ) ) ( not ( = ?auto_1681163 ?auto_1681164 ) ) ( not ( = ?auto_1681163 ?auto_1681165 ) ) ( not ( = ?auto_1681163 ?auto_1681166 ) ) ( not ( = ?auto_1681163 ?auto_1681167 ) ) ( not ( = ?auto_1681163 ?auto_1681168 ) ) ( not ( = ?auto_1681163 ?auto_1681169 ) ) ( not ( = ?auto_1681163 ?auto_1681170 ) ) ( not ( = ?auto_1681164 ?auto_1681165 ) ) ( not ( = ?auto_1681164 ?auto_1681166 ) ) ( not ( = ?auto_1681164 ?auto_1681167 ) ) ( not ( = ?auto_1681164 ?auto_1681168 ) ) ( not ( = ?auto_1681164 ?auto_1681169 ) ) ( not ( = ?auto_1681164 ?auto_1681170 ) ) ( not ( = ?auto_1681165 ?auto_1681166 ) ) ( not ( = ?auto_1681165 ?auto_1681167 ) ) ( not ( = ?auto_1681165 ?auto_1681168 ) ) ( not ( = ?auto_1681165 ?auto_1681169 ) ) ( not ( = ?auto_1681165 ?auto_1681170 ) ) ( not ( = ?auto_1681166 ?auto_1681167 ) ) ( not ( = ?auto_1681166 ?auto_1681168 ) ) ( not ( = ?auto_1681166 ?auto_1681169 ) ) ( not ( = ?auto_1681166 ?auto_1681170 ) ) ( not ( = ?auto_1681167 ?auto_1681168 ) ) ( not ( = ?auto_1681167 ?auto_1681169 ) ) ( not ( = ?auto_1681167 ?auto_1681170 ) ) ( not ( = ?auto_1681168 ?auto_1681169 ) ) ( not ( = ?auto_1681168 ?auto_1681170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1681169 ?auto_1681170 )
      ( MAKE-15CRATE-VERIFY ?auto_1681156 ?auto_1681157 ?auto_1681158 ?auto_1681155 ?auto_1681159 ?auto_1681161 ?auto_1681160 ?auto_1681162 ?auto_1681163 ?auto_1681164 ?auto_1681165 ?auto_1681166 ?auto_1681167 ?auto_1681168 ?auto_1681169 ?auto_1681170 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681335 - SURFACE
      ?auto_1681336 - SURFACE
      ?auto_1681337 - SURFACE
      ?auto_1681334 - SURFACE
      ?auto_1681338 - SURFACE
      ?auto_1681340 - SURFACE
      ?auto_1681339 - SURFACE
      ?auto_1681341 - SURFACE
      ?auto_1681342 - SURFACE
      ?auto_1681343 - SURFACE
      ?auto_1681344 - SURFACE
      ?auto_1681345 - SURFACE
      ?auto_1681346 - SURFACE
      ?auto_1681347 - SURFACE
      ?auto_1681348 - SURFACE
      ?auto_1681349 - SURFACE
    )
    :vars
    (
      ?auto_1681350 - HOIST
      ?auto_1681352 - PLACE
      ?auto_1681351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681350 ?auto_1681352 ) ( SURFACE-AT ?auto_1681348 ?auto_1681352 ) ( CLEAR ?auto_1681348 ) ( IS-CRATE ?auto_1681349 ) ( not ( = ?auto_1681348 ?auto_1681349 ) ) ( TRUCK-AT ?auto_1681351 ?auto_1681352 ) ( AVAILABLE ?auto_1681350 ) ( IN ?auto_1681349 ?auto_1681351 ) ( ON ?auto_1681348 ?auto_1681347 ) ( not ( = ?auto_1681347 ?auto_1681348 ) ) ( not ( = ?auto_1681347 ?auto_1681349 ) ) ( ON ?auto_1681336 ?auto_1681335 ) ( ON ?auto_1681337 ?auto_1681336 ) ( ON ?auto_1681334 ?auto_1681337 ) ( ON ?auto_1681338 ?auto_1681334 ) ( ON ?auto_1681340 ?auto_1681338 ) ( ON ?auto_1681339 ?auto_1681340 ) ( ON ?auto_1681341 ?auto_1681339 ) ( ON ?auto_1681342 ?auto_1681341 ) ( ON ?auto_1681343 ?auto_1681342 ) ( ON ?auto_1681344 ?auto_1681343 ) ( ON ?auto_1681345 ?auto_1681344 ) ( ON ?auto_1681346 ?auto_1681345 ) ( ON ?auto_1681347 ?auto_1681346 ) ( not ( = ?auto_1681335 ?auto_1681336 ) ) ( not ( = ?auto_1681335 ?auto_1681337 ) ) ( not ( = ?auto_1681335 ?auto_1681334 ) ) ( not ( = ?auto_1681335 ?auto_1681338 ) ) ( not ( = ?auto_1681335 ?auto_1681340 ) ) ( not ( = ?auto_1681335 ?auto_1681339 ) ) ( not ( = ?auto_1681335 ?auto_1681341 ) ) ( not ( = ?auto_1681335 ?auto_1681342 ) ) ( not ( = ?auto_1681335 ?auto_1681343 ) ) ( not ( = ?auto_1681335 ?auto_1681344 ) ) ( not ( = ?auto_1681335 ?auto_1681345 ) ) ( not ( = ?auto_1681335 ?auto_1681346 ) ) ( not ( = ?auto_1681335 ?auto_1681347 ) ) ( not ( = ?auto_1681335 ?auto_1681348 ) ) ( not ( = ?auto_1681335 ?auto_1681349 ) ) ( not ( = ?auto_1681336 ?auto_1681337 ) ) ( not ( = ?auto_1681336 ?auto_1681334 ) ) ( not ( = ?auto_1681336 ?auto_1681338 ) ) ( not ( = ?auto_1681336 ?auto_1681340 ) ) ( not ( = ?auto_1681336 ?auto_1681339 ) ) ( not ( = ?auto_1681336 ?auto_1681341 ) ) ( not ( = ?auto_1681336 ?auto_1681342 ) ) ( not ( = ?auto_1681336 ?auto_1681343 ) ) ( not ( = ?auto_1681336 ?auto_1681344 ) ) ( not ( = ?auto_1681336 ?auto_1681345 ) ) ( not ( = ?auto_1681336 ?auto_1681346 ) ) ( not ( = ?auto_1681336 ?auto_1681347 ) ) ( not ( = ?auto_1681336 ?auto_1681348 ) ) ( not ( = ?auto_1681336 ?auto_1681349 ) ) ( not ( = ?auto_1681337 ?auto_1681334 ) ) ( not ( = ?auto_1681337 ?auto_1681338 ) ) ( not ( = ?auto_1681337 ?auto_1681340 ) ) ( not ( = ?auto_1681337 ?auto_1681339 ) ) ( not ( = ?auto_1681337 ?auto_1681341 ) ) ( not ( = ?auto_1681337 ?auto_1681342 ) ) ( not ( = ?auto_1681337 ?auto_1681343 ) ) ( not ( = ?auto_1681337 ?auto_1681344 ) ) ( not ( = ?auto_1681337 ?auto_1681345 ) ) ( not ( = ?auto_1681337 ?auto_1681346 ) ) ( not ( = ?auto_1681337 ?auto_1681347 ) ) ( not ( = ?auto_1681337 ?auto_1681348 ) ) ( not ( = ?auto_1681337 ?auto_1681349 ) ) ( not ( = ?auto_1681334 ?auto_1681338 ) ) ( not ( = ?auto_1681334 ?auto_1681340 ) ) ( not ( = ?auto_1681334 ?auto_1681339 ) ) ( not ( = ?auto_1681334 ?auto_1681341 ) ) ( not ( = ?auto_1681334 ?auto_1681342 ) ) ( not ( = ?auto_1681334 ?auto_1681343 ) ) ( not ( = ?auto_1681334 ?auto_1681344 ) ) ( not ( = ?auto_1681334 ?auto_1681345 ) ) ( not ( = ?auto_1681334 ?auto_1681346 ) ) ( not ( = ?auto_1681334 ?auto_1681347 ) ) ( not ( = ?auto_1681334 ?auto_1681348 ) ) ( not ( = ?auto_1681334 ?auto_1681349 ) ) ( not ( = ?auto_1681338 ?auto_1681340 ) ) ( not ( = ?auto_1681338 ?auto_1681339 ) ) ( not ( = ?auto_1681338 ?auto_1681341 ) ) ( not ( = ?auto_1681338 ?auto_1681342 ) ) ( not ( = ?auto_1681338 ?auto_1681343 ) ) ( not ( = ?auto_1681338 ?auto_1681344 ) ) ( not ( = ?auto_1681338 ?auto_1681345 ) ) ( not ( = ?auto_1681338 ?auto_1681346 ) ) ( not ( = ?auto_1681338 ?auto_1681347 ) ) ( not ( = ?auto_1681338 ?auto_1681348 ) ) ( not ( = ?auto_1681338 ?auto_1681349 ) ) ( not ( = ?auto_1681340 ?auto_1681339 ) ) ( not ( = ?auto_1681340 ?auto_1681341 ) ) ( not ( = ?auto_1681340 ?auto_1681342 ) ) ( not ( = ?auto_1681340 ?auto_1681343 ) ) ( not ( = ?auto_1681340 ?auto_1681344 ) ) ( not ( = ?auto_1681340 ?auto_1681345 ) ) ( not ( = ?auto_1681340 ?auto_1681346 ) ) ( not ( = ?auto_1681340 ?auto_1681347 ) ) ( not ( = ?auto_1681340 ?auto_1681348 ) ) ( not ( = ?auto_1681340 ?auto_1681349 ) ) ( not ( = ?auto_1681339 ?auto_1681341 ) ) ( not ( = ?auto_1681339 ?auto_1681342 ) ) ( not ( = ?auto_1681339 ?auto_1681343 ) ) ( not ( = ?auto_1681339 ?auto_1681344 ) ) ( not ( = ?auto_1681339 ?auto_1681345 ) ) ( not ( = ?auto_1681339 ?auto_1681346 ) ) ( not ( = ?auto_1681339 ?auto_1681347 ) ) ( not ( = ?auto_1681339 ?auto_1681348 ) ) ( not ( = ?auto_1681339 ?auto_1681349 ) ) ( not ( = ?auto_1681341 ?auto_1681342 ) ) ( not ( = ?auto_1681341 ?auto_1681343 ) ) ( not ( = ?auto_1681341 ?auto_1681344 ) ) ( not ( = ?auto_1681341 ?auto_1681345 ) ) ( not ( = ?auto_1681341 ?auto_1681346 ) ) ( not ( = ?auto_1681341 ?auto_1681347 ) ) ( not ( = ?auto_1681341 ?auto_1681348 ) ) ( not ( = ?auto_1681341 ?auto_1681349 ) ) ( not ( = ?auto_1681342 ?auto_1681343 ) ) ( not ( = ?auto_1681342 ?auto_1681344 ) ) ( not ( = ?auto_1681342 ?auto_1681345 ) ) ( not ( = ?auto_1681342 ?auto_1681346 ) ) ( not ( = ?auto_1681342 ?auto_1681347 ) ) ( not ( = ?auto_1681342 ?auto_1681348 ) ) ( not ( = ?auto_1681342 ?auto_1681349 ) ) ( not ( = ?auto_1681343 ?auto_1681344 ) ) ( not ( = ?auto_1681343 ?auto_1681345 ) ) ( not ( = ?auto_1681343 ?auto_1681346 ) ) ( not ( = ?auto_1681343 ?auto_1681347 ) ) ( not ( = ?auto_1681343 ?auto_1681348 ) ) ( not ( = ?auto_1681343 ?auto_1681349 ) ) ( not ( = ?auto_1681344 ?auto_1681345 ) ) ( not ( = ?auto_1681344 ?auto_1681346 ) ) ( not ( = ?auto_1681344 ?auto_1681347 ) ) ( not ( = ?auto_1681344 ?auto_1681348 ) ) ( not ( = ?auto_1681344 ?auto_1681349 ) ) ( not ( = ?auto_1681345 ?auto_1681346 ) ) ( not ( = ?auto_1681345 ?auto_1681347 ) ) ( not ( = ?auto_1681345 ?auto_1681348 ) ) ( not ( = ?auto_1681345 ?auto_1681349 ) ) ( not ( = ?auto_1681346 ?auto_1681347 ) ) ( not ( = ?auto_1681346 ?auto_1681348 ) ) ( not ( = ?auto_1681346 ?auto_1681349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681347 ?auto_1681348 ?auto_1681349 )
      ( MAKE-15CRATE-VERIFY ?auto_1681335 ?auto_1681336 ?auto_1681337 ?auto_1681334 ?auto_1681338 ?auto_1681340 ?auto_1681339 ?auto_1681341 ?auto_1681342 ?auto_1681343 ?auto_1681344 ?auto_1681345 ?auto_1681346 ?auto_1681347 ?auto_1681348 ?auto_1681349 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681530 - SURFACE
      ?auto_1681531 - SURFACE
      ?auto_1681532 - SURFACE
      ?auto_1681529 - SURFACE
      ?auto_1681533 - SURFACE
      ?auto_1681535 - SURFACE
      ?auto_1681534 - SURFACE
      ?auto_1681536 - SURFACE
      ?auto_1681537 - SURFACE
      ?auto_1681538 - SURFACE
      ?auto_1681539 - SURFACE
      ?auto_1681540 - SURFACE
      ?auto_1681541 - SURFACE
      ?auto_1681542 - SURFACE
      ?auto_1681543 - SURFACE
      ?auto_1681544 - SURFACE
    )
    :vars
    (
      ?auto_1681545 - HOIST
      ?auto_1681547 - PLACE
      ?auto_1681546 - TRUCK
      ?auto_1681548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681545 ?auto_1681547 ) ( SURFACE-AT ?auto_1681543 ?auto_1681547 ) ( CLEAR ?auto_1681543 ) ( IS-CRATE ?auto_1681544 ) ( not ( = ?auto_1681543 ?auto_1681544 ) ) ( AVAILABLE ?auto_1681545 ) ( IN ?auto_1681544 ?auto_1681546 ) ( ON ?auto_1681543 ?auto_1681542 ) ( not ( = ?auto_1681542 ?auto_1681543 ) ) ( not ( = ?auto_1681542 ?auto_1681544 ) ) ( TRUCK-AT ?auto_1681546 ?auto_1681548 ) ( not ( = ?auto_1681548 ?auto_1681547 ) ) ( ON ?auto_1681531 ?auto_1681530 ) ( ON ?auto_1681532 ?auto_1681531 ) ( ON ?auto_1681529 ?auto_1681532 ) ( ON ?auto_1681533 ?auto_1681529 ) ( ON ?auto_1681535 ?auto_1681533 ) ( ON ?auto_1681534 ?auto_1681535 ) ( ON ?auto_1681536 ?auto_1681534 ) ( ON ?auto_1681537 ?auto_1681536 ) ( ON ?auto_1681538 ?auto_1681537 ) ( ON ?auto_1681539 ?auto_1681538 ) ( ON ?auto_1681540 ?auto_1681539 ) ( ON ?auto_1681541 ?auto_1681540 ) ( ON ?auto_1681542 ?auto_1681541 ) ( not ( = ?auto_1681530 ?auto_1681531 ) ) ( not ( = ?auto_1681530 ?auto_1681532 ) ) ( not ( = ?auto_1681530 ?auto_1681529 ) ) ( not ( = ?auto_1681530 ?auto_1681533 ) ) ( not ( = ?auto_1681530 ?auto_1681535 ) ) ( not ( = ?auto_1681530 ?auto_1681534 ) ) ( not ( = ?auto_1681530 ?auto_1681536 ) ) ( not ( = ?auto_1681530 ?auto_1681537 ) ) ( not ( = ?auto_1681530 ?auto_1681538 ) ) ( not ( = ?auto_1681530 ?auto_1681539 ) ) ( not ( = ?auto_1681530 ?auto_1681540 ) ) ( not ( = ?auto_1681530 ?auto_1681541 ) ) ( not ( = ?auto_1681530 ?auto_1681542 ) ) ( not ( = ?auto_1681530 ?auto_1681543 ) ) ( not ( = ?auto_1681530 ?auto_1681544 ) ) ( not ( = ?auto_1681531 ?auto_1681532 ) ) ( not ( = ?auto_1681531 ?auto_1681529 ) ) ( not ( = ?auto_1681531 ?auto_1681533 ) ) ( not ( = ?auto_1681531 ?auto_1681535 ) ) ( not ( = ?auto_1681531 ?auto_1681534 ) ) ( not ( = ?auto_1681531 ?auto_1681536 ) ) ( not ( = ?auto_1681531 ?auto_1681537 ) ) ( not ( = ?auto_1681531 ?auto_1681538 ) ) ( not ( = ?auto_1681531 ?auto_1681539 ) ) ( not ( = ?auto_1681531 ?auto_1681540 ) ) ( not ( = ?auto_1681531 ?auto_1681541 ) ) ( not ( = ?auto_1681531 ?auto_1681542 ) ) ( not ( = ?auto_1681531 ?auto_1681543 ) ) ( not ( = ?auto_1681531 ?auto_1681544 ) ) ( not ( = ?auto_1681532 ?auto_1681529 ) ) ( not ( = ?auto_1681532 ?auto_1681533 ) ) ( not ( = ?auto_1681532 ?auto_1681535 ) ) ( not ( = ?auto_1681532 ?auto_1681534 ) ) ( not ( = ?auto_1681532 ?auto_1681536 ) ) ( not ( = ?auto_1681532 ?auto_1681537 ) ) ( not ( = ?auto_1681532 ?auto_1681538 ) ) ( not ( = ?auto_1681532 ?auto_1681539 ) ) ( not ( = ?auto_1681532 ?auto_1681540 ) ) ( not ( = ?auto_1681532 ?auto_1681541 ) ) ( not ( = ?auto_1681532 ?auto_1681542 ) ) ( not ( = ?auto_1681532 ?auto_1681543 ) ) ( not ( = ?auto_1681532 ?auto_1681544 ) ) ( not ( = ?auto_1681529 ?auto_1681533 ) ) ( not ( = ?auto_1681529 ?auto_1681535 ) ) ( not ( = ?auto_1681529 ?auto_1681534 ) ) ( not ( = ?auto_1681529 ?auto_1681536 ) ) ( not ( = ?auto_1681529 ?auto_1681537 ) ) ( not ( = ?auto_1681529 ?auto_1681538 ) ) ( not ( = ?auto_1681529 ?auto_1681539 ) ) ( not ( = ?auto_1681529 ?auto_1681540 ) ) ( not ( = ?auto_1681529 ?auto_1681541 ) ) ( not ( = ?auto_1681529 ?auto_1681542 ) ) ( not ( = ?auto_1681529 ?auto_1681543 ) ) ( not ( = ?auto_1681529 ?auto_1681544 ) ) ( not ( = ?auto_1681533 ?auto_1681535 ) ) ( not ( = ?auto_1681533 ?auto_1681534 ) ) ( not ( = ?auto_1681533 ?auto_1681536 ) ) ( not ( = ?auto_1681533 ?auto_1681537 ) ) ( not ( = ?auto_1681533 ?auto_1681538 ) ) ( not ( = ?auto_1681533 ?auto_1681539 ) ) ( not ( = ?auto_1681533 ?auto_1681540 ) ) ( not ( = ?auto_1681533 ?auto_1681541 ) ) ( not ( = ?auto_1681533 ?auto_1681542 ) ) ( not ( = ?auto_1681533 ?auto_1681543 ) ) ( not ( = ?auto_1681533 ?auto_1681544 ) ) ( not ( = ?auto_1681535 ?auto_1681534 ) ) ( not ( = ?auto_1681535 ?auto_1681536 ) ) ( not ( = ?auto_1681535 ?auto_1681537 ) ) ( not ( = ?auto_1681535 ?auto_1681538 ) ) ( not ( = ?auto_1681535 ?auto_1681539 ) ) ( not ( = ?auto_1681535 ?auto_1681540 ) ) ( not ( = ?auto_1681535 ?auto_1681541 ) ) ( not ( = ?auto_1681535 ?auto_1681542 ) ) ( not ( = ?auto_1681535 ?auto_1681543 ) ) ( not ( = ?auto_1681535 ?auto_1681544 ) ) ( not ( = ?auto_1681534 ?auto_1681536 ) ) ( not ( = ?auto_1681534 ?auto_1681537 ) ) ( not ( = ?auto_1681534 ?auto_1681538 ) ) ( not ( = ?auto_1681534 ?auto_1681539 ) ) ( not ( = ?auto_1681534 ?auto_1681540 ) ) ( not ( = ?auto_1681534 ?auto_1681541 ) ) ( not ( = ?auto_1681534 ?auto_1681542 ) ) ( not ( = ?auto_1681534 ?auto_1681543 ) ) ( not ( = ?auto_1681534 ?auto_1681544 ) ) ( not ( = ?auto_1681536 ?auto_1681537 ) ) ( not ( = ?auto_1681536 ?auto_1681538 ) ) ( not ( = ?auto_1681536 ?auto_1681539 ) ) ( not ( = ?auto_1681536 ?auto_1681540 ) ) ( not ( = ?auto_1681536 ?auto_1681541 ) ) ( not ( = ?auto_1681536 ?auto_1681542 ) ) ( not ( = ?auto_1681536 ?auto_1681543 ) ) ( not ( = ?auto_1681536 ?auto_1681544 ) ) ( not ( = ?auto_1681537 ?auto_1681538 ) ) ( not ( = ?auto_1681537 ?auto_1681539 ) ) ( not ( = ?auto_1681537 ?auto_1681540 ) ) ( not ( = ?auto_1681537 ?auto_1681541 ) ) ( not ( = ?auto_1681537 ?auto_1681542 ) ) ( not ( = ?auto_1681537 ?auto_1681543 ) ) ( not ( = ?auto_1681537 ?auto_1681544 ) ) ( not ( = ?auto_1681538 ?auto_1681539 ) ) ( not ( = ?auto_1681538 ?auto_1681540 ) ) ( not ( = ?auto_1681538 ?auto_1681541 ) ) ( not ( = ?auto_1681538 ?auto_1681542 ) ) ( not ( = ?auto_1681538 ?auto_1681543 ) ) ( not ( = ?auto_1681538 ?auto_1681544 ) ) ( not ( = ?auto_1681539 ?auto_1681540 ) ) ( not ( = ?auto_1681539 ?auto_1681541 ) ) ( not ( = ?auto_1681539 ?auto_1681542 ) ) ( not ( = ?auto_1681539 ?auto_1681543 ) ) ( not ( = ?auto_1681539 ?auto_1681544 ) ) ( not ( = ?auto_1681540 ?auto_1681541 ) ) ( not ( = ?auto_1681540 ?auto_1681542 ) ) ( not ( = ?auto_1681540 ?auto_1681543 ) ) ( not ( = ?auto_1681540 ?auto_1681544 ) ) ( not ( = ?auto_1681541 ?auto_1681542 ) ) ( not ( = ?auto_1681541 ?auto_1681543 ) ) ( not ( = ?auto_1681541 ?auto_1681544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681542 ?auto_1681543 ?auto_1681544 )
      ( MAKE-15CRATE-VERIFY ?auto_1681530 ?auto_1681531 ?auto_1681532 ?auto_1681529 ?auto_1681533 ?auto_1681535 ?auto_1681534 ?auto_1681536 ?auto_1681537 ?auto_1681538 ?auto_1681539 ?auto_1681540 ?auto_1681541 ?auto_1681542 ?auto_1681543 ?auto_1681544 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681740 - SURFACE
      ?auto_1681741 - SURFACE
      ?auto_1681742 - SURFACE
      ?auto_1681739 - SURFACE
      ?auto_1681743 - SURFACE
      ?auto_1681745 - SURFACE
      ?auto_1681744 - SURFACE
      ?auto_1681746 - SURFACE
      ?auto_1681747 - SURFACE
      ?auto_1681748 - SURFACE
      ?auto_1681749 - SURFACE
      ?auto_1681750 - SURFACE
      ?auto_1681751 - SURFACE
      ?auto_1681752 - SURFACE
      ?auto_1681753 - SURFACE
      ?auto_1681754 - SURFACE
    )
    :vars
    (
      ?auto_1681757 - HOIST
      ?auto_1681758 - PLACE
      ?auto_1681755 - TRUCK
      ?auto_1681756 - PLACE
      ?auto_1681759 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681757 ?auto_1681758 ) ( SURFACE-AT ?auto_1681753 ?auto_1681758 ) ( CLEAR ?auto_1681753 ) ( IS-CRATE ?auto_1681754 ) ( not ( = ?auto_1681753 ?auto_1681754 ) ) ( AVAILABLE ?auto_1681757 ) ( ON ?auto_1681753 ?auto_1681752 ) ( not ( = ?auto_1681752 ?auto_1681753 ) ) ( not ( = ?auto_1681752 ?auto_1681754 ) ) ( TRUCK-AT ?auto_1681755 ?auto_1681756 ) ( not ( = ?auto_1681756 ?auto_1681758 ) ) ( HOIST-AT ?auto_1681759 ?auto_1681756 ) ( LIFTING ?auto_1681759 ?auto_1681754 ) ( not ( = ?auto_1681757 ?auto_1681759 ) ) ( ON ?auto_1681741 ?auto_1681740 ) ( ON ?auto_1681742 ?auto_1681741 ) ( ON ?auto_1681739 ?auto_1681742 ) ( ON ?auto_1681743 ?auto_1681739 ) ( ON ?auto_1681745 ?auto_1681743 ) ( ON ?auto_1681744 ?auto_1681745 ) ( ON ?auto_1681746 ?auto_1681744 ) ( ON ?auto_1681747 ?auto_1681746 ) ( ON ?auto_1681748 ?auto_1681747 ) ( ON ?auto_1681749 ?auto_1681748 ) ( ON ?auto_1681750 ?auto_1681749 ) ( ON ?auto_1681751 ?auto_1681750 ) ( ON ?auto_1681752 ?auto_1681751 ) ( not ( = ?auto_1681740 ?auto_1681741 ) ) ( not ( = ?auto_1681740 ?auto_1681742 ) ) ( not ( = ?auto_1681740 ?auto_1681739 ) ) ( not ( = ?auto_1681740 ?auto_1681743 ) ) ( not ( = ?auto_1681740 ?auto_1681745 ) ) ( not ( = ?auto_1681740 ?auto_1681744 ) ) ( not ( = ?auto_1681740 ?auto_1681746 ) ) ( not ( = ?auto_1681740 ?auto_1681747 ) ) ( not ( = ?auto_1681740 ?auto_1681748 ) ) ( not ( = ?auto_1681740 ?auto_1681749 ) ) ( not ( = ?auto_1681740 ?auto_1681750 ) ) ( not ( = ?auto_1681740 ?auto_1681751 ) ) ( not ( = ?auto_1681740 ?auto_1681752 ) ) ( not ( = ?auto_1681740 ?auto_1681753 ) ) ( not ( = ?auto_1681740 ?auto_1681754 ) ) ( not ( = ?auto_1681741 ?auto_1681742 ) ) ( not ( = ?auto_1681741 ?auto_1681739 ) ) ( not ( = ?auto_1681741 ?auto_1681743 ) ) ( not ( = ?auto_1681741 ?auto_1681745 ) ) ( not ( = ?auto_1681741 ?auto_1681744 ) ) ( not ( = ?auto_1681741 ?auto_1681746 ) ) ( not ( = ?auto_1681741 ?auto_1681747 ) ) ( not ( = ?auto_1681741 ?auto_1681748 ) ) ( not ( = ?auto_1681741 ?auto_1681749 ) ) ( not ( = ?auto_1681741 ?auto_1681750 ) ) ( not ( = ?auto_1681741 ?auto_1681751 ) ) ( not ( = ?auto_1681741 ?auto_1681752 ) ) ( not ( = ?auto_1681741 ?auto_1681753 ) ) ( not ( = ?auto_1681741 ?auto_1681754 ) ) ( not ( = ?auto_1681742 ?auto_1681739 ) ) ( not ( = ?auto_1681742 ?auto_1681743 ) ) ( not ( = ?auto_1681742 ?auto_1681745 ) ) ( not ( = ?auto_1681742 ?auto_1681744 ) ) ( not ( = ?auto_1681742 ?auto_1681746 ) ) ( not ( = ?auto_1681742 ?auto_1681747 ) ) ( not ( = ?auto_1681742 ?auto_1681748 ) ) ( not ( = ?auto_1681742 ?auto_1681749 ) ) ( not ( = ?auto_1681742 ?auto_1681750 ) ) ( not ( = ?auto_1681742 ?auto_1681751 ) ) ( not ( = ?auto_1681742 ?auto_1681752 ) ) ( not ( = ?auto_1681742 ?auto_1681753 ) ) ( not ( = ?auto_1681742 ?auto_1681754 ) ) ( not ( = ?auto_1681739 ?auto_1681743 ) ) ( not ( = ?auto_1681739 ?auto_1681745 ) ) ( not ( = ?auto_1681739 ?auto_1681744 ) ) ( not ( = ?auto_1681739 ?auto_1681746 ) ) ( not ( = ?auto_1681739 ?auto_1681747 ) ) ( not ( = ?auto_1681739 ?auto_1681748 ) ) ( not ( = ?auto_1681739 ?auto_1681749 ) ) ( not ( = ?auto_1681739 ?auto_1681750 ) ) ( not ( = ?auto_1681739 ?auto_1681751 ) ) ( not ( = ?auto_1681739 ?auto_1681752 ) ) ( not ( = ?auto_1681739 ?auto_1681753 ) ) ( not ( = ?auto_1681739 ?auto_1681754 ) ) ( not ( = ?auto_1681743 ?auto_1681745 ) ) ( not ( = ?auto_1681743 ?auto_1681744 ) ) ( not ( = ?auto_1681743 ?auto_1681746 ) ) ( not ( = ?auto_1681743 ?auto_1681747 ) ) ( not ( = ?auto_1681743 ?auto_1681748 ) ) ( not ( = ?auto_1681743 ?auto_1681749 ) ) ( not ( = ?auto_1681743 ?auto_1681750 ) ) ( not ( = ?auto_1681743 ?auto_1681751 ) ) ( not ( = ?auto_1681743 ?auto_1681752 ) ) ( not ( = ?auto_1681743 ?auto_1681753 ) ) ( not ( = ?auto_1681743 ?auto_1681754 ) ) ( not ( = ?auto_1681745 ?auto_1681744 ) ) ( not ( = ?auto_1681745 ?auto_1681746 ) ) ( not ( = ?auto_1681745 ?auto_1681747 ) ) ( not ( = ?auto_1681745 ?auto_1681748 ) ) ( not ( = ?auto_1681745 ?auto_1681749 ) ) ( not ( = ?auto_1681745 ?auto_1681750 ) ) ( not ( = ?auto_1681745 ?auto_1681751 ) ) ( not ( = ?auto_1681745 ?auto_1681752 ) ) ( not ( = ?auto_1681745 ?auto_1681753 ) ) ( not ( = ?auto_1681745 ?auto_1681754 ) ) ( not ( = ?auto_1681744 ?auto_1681746 ) ) ( not ( = ?auto_1681744 ?auto_1681747 ) ) ( not ( = ?auto_1681744 ?auto_1681748 ) ) ( not ( = ?auto_1681744 ?auto_1681749 ) ) ( not ( = ?auto_1681744 ?auto_1681750 ) ) ( not ( = ?auto_1681744 ?auto_1681751 ) ) ( not ( = ?auto_1681744 ?auto_1681752 ) ) ( not ( = ?auto_1681744 ?auto_1681753 ) ) ( not ( = ?auto_1681744 ?auto_1681754 ) ) ( not ( = ?auto_1681746 ?auto_1681747 ) ) ( not ( = ?auto_1681746 ?auto_1681748 ) ) ( not ( = ?auto_1681746 ?auto_1681749 ) ) ( not ( = ?auto_1681746 ?auto_1681750 ) ) ( not ( = ?auto_1681746 ?auto_1681751 ) ) ( not ( = ?auto_1681746 ?auto_1681752 ) ) ( not ( = ?auto_1681746 ?auto_1681753 ) ) ( not ( = ?auto_1681746 ?auto_1681754 ) ) ( not ( = ?auto_1681747 ?auto_1681748 ) ) ( not ( = ?auto_1681747 ?auto_1681749 ) ) ( not ( = ?auto_1681747 ?auto_1681750 ) ) ( not ( = ?auto_1681747 ?auto_1681751 ) ) ( not ( = ?auto_1681747 ?auto_1681752 ) ) ( not ( = ?auto_1681747 ?auto_1681753 ) ) ( not ( = ?auto_1681747 ?auto_1681754 ) ) ( not ( = ?auto_1681748 ?auto_1681749 ) ) ( not ( = ?auto_1681748 ?auto_1681750 ) ) ( not ( = ?auto_1681748 ?auto_1681751 ) ) ( not ( = ?auto_1681748 ?auto_1681752 ) ) ( not ( = ?auto_1681748 ?auto_1681753 ) ) ( not ( = ?auto_1681748 ?auto_1681754 ) ) ( not ( = ?auto_1681749 ?auto_1681750 ) ) ( not ( = ?auto_1681749 ?auto_1681751 ) ) ( not ( = ?auto_1681749 ?auto_1681752 ) ) ( not ( = ?auto_1681749 ?auto_1681753 ) ) ( not ( = ?auto_1681749 ?auto_1681754 ) ) ( not ( = ?auto_1681750 ?auto_1681751 ) ) ( not ( = ?auto_1681750 ?auto_1681752 ) ) ( not ( = ?auto_1681750 ?auto_1681753 ) ) ( not ( = ?auto_1681750 ?auto_1681754 ) ) ( not ( = ?auto_1681751 ?auto_1681752 ) ) ( not ( = ?auto_1681751 ?auto_1681753 ) ) ( not ( = ?auto_1681751 ?auto_1681754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681752 ?auto_1681753 ?auto_1681754 )
      ( MAKE-15CRATE-VERIFY ?auto_1681740 ?auto_1681741 ?auto_1681742 ?auto_1681739 ?auto_1681743 ?auto_1681745 ?auto_1681744 ?auto_1681746 ?auto_1681747 ?auto_1681748 ?auto_1681749 ?auto_1681750 ?auto_1681751 ?auto_1681752 ?auto_1681753 ?auto_1681754 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681965 - SURFACE
      ?auto_1681966 - SURFACE
      ?auto_1681967 - SURFACE
      ?auto_1681964 - SURFACE
      ?auto_1681968 - SURFACE
      ?auto_1681970 - SURFACE
      ?auto_1681969 - SURFACE
      ?auto_1681971 - SURFACE
      ?auto_1681972 - SURFACE
      ?auto_1681973 - SURFACE
      ?auto_1681974 - SURFACE
      ?auto_1681975 - SURFACE
      ?auto_1681976 - SURFACE
      ?auto_1681977 - SURFACE
      ?auto_1681978 - SURFACE
      ?auto_1681979 - SURFACE
    )
    :vars
    (
      ?auto_1681984 - HOIST
      ?auto_1681981 - PLACE
      ?auto_1681983 - TRUCK
      ?auto_1681985 - PLACE
      ?auto_1681982 - HOIST
      ?auto_1681980 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681984 ?auto_1681981 ) ( SURFACE-AT ?auto_1681978 ?auto_1681981 ) ( CLEAR ?auto_1681978 ) ( IS-CRATE ?auto_1681979 ) ( not ( = ?auto_1681978 ?auto_1681979 ) ) ( AVAILABLE ?auto_1681984 ) ( ON ?auto_1681978 ?auto_1681977 ) ( not ( = ?auto_1681977 ?auto_1681978 ) ) ( not ( = ?auto_1681977 ?auto_1681979 ) ) ( TRUCK-AT ?auto_1681983 ?auto_1681985 ) ( not ( = ?auto_1681985 ?auto_1681981 ) ) ( HOIST-AT ?auto_1681982 ?auto_1681985 ) ( not ( = ?auto_1681984 ?auto_1681982 ) ) ( AVAILABLE ?auto_1681982 ) ( SURFACE-AT ?auto_1681979 ?auto_1681985 ) ( ON ?auto_1681979 ?auto_1681980 ) ( CLEAR ?auto_1681979 ) ( not ( = ?auto_1681978 ?auto_1681980 ) ) ( not ( = ?auto_1681979 ?auto_1681980 ) ) ( not ( = ?auto_1681977 ?auto_1681980 ) ) ( ON ?auto_1681966 ?auto_1681965 ) ( ON ?auto_1681967 ?auto_1681966 ) ( ON ?auto_1681964 ?auto_1681967 ) ( ON ?auto_1681968 ?auto_1681964 ) ( ON ?auto_1681970 ?auto_1681968 ) ( ON ?auto_1681969 ?auto_1681970 ) ( ON ?auto_1681971 ?auto_1681969 ) ( ON ?auto_1681972 ?auto_1681971 ) ( ON ?auto_1681973 ?auto_1681972 ) ( ON ?auto_1681974 ?auto_1681973 ) ( ON ?auto_1681975 ?auto_1681974 ) ( ON ?auto_1681976 ?auto_1681975 ) ( ON ?auto_1681977 ?auto_1681976 ) ( not ( = ?auto_1681965 ?auto_1681966 ) ) ( not ( = ?auto_1681965 ?auto_1681967 ) ) ( not ( = ?auto_1681965 ?auto_1681964 ) ) ( not ( = ?auto_1681965 ?auto_1681968 ) ) ( not ( = ?auto_1681965 ?auto_1681970 ) ) ( not ( = ?auto_1681965 ?auto_1681969 ) ) ( not ( = ?auto_1681965 ?auto_1681971 ) ) ( not ( = ?auto_1681965 ?auto_1681972 ) ) ( not ( = ?auto_1681965 ?auto_1681973 ) ) ( not ( = ?auto_1681965 ?auto_1681974 ) ) ( not ( = ?auto_1681965 ?auto_1681975 ) ) ( not ( = ?auto_1681965 ?auto_1681976 ) ) ( not ( = ?auto_1681965 ?auto_1681977 ) ) ( not ( = ?auto_1681965 ?auto_1681978 ) ) ( not ( = ?auto_1681965 ?auto_1681979 ) ) ( not ( = ?auto_1681965 ?auto_1681980 ) ) ( not ( = ?auto_1681966 ?auto_1681967 ) ) ( not ( = ?auto_1681966 ?auto_1681964 ) ) ( not ( = ?auto_1681966 ?auto_1681968 ) ) ( not ( = ?auto_1681966 ?auto_1681970 ) ) ( not ( = ?auto_1681966 ?auto_1681969 ) ) ( not ( = ?auto_1681966 ?auto_1681971 ) ) ( not ( = ?auto_1681966 ?auto_1681972 ) ) ( not ( = ?auto_1681966 ?auto_1681973 ) ) ( not ( = ?auto_1681966 ?auto_1681974 ) ) ( not ( = ?auto_1681966 ?auto_1681975 ) ) ( not ( = ?auto_1681966 ?auto_1681976 ) ) ( not ( = ?auto_1681966 ?auto_1681977 ) ) ( not ( = ?auto_1681966 ?auto_1681978 ) ) ( not ( = ?auto_1681966 ?auto_1681979 ) ) ( not ( = ?auto_1681966 ?auto_1681980 ) ) ( not ( = ?auto_1681967 ?auto_1681964 ) ) ( not ( = ?auto_1681967 ?auto_1681968 ) ) ( not ( = ?auto_1681967 ?auto_1681970 ) ) ( not ( = ?auto_1681967 ?auto_1681969 ) ) ( not ( = ?auto_1681967 ?auto_1681971 ) ) ( not ( = ?auto_1681967 ?auto_1681972 ) ) ( not ( = ?auto_1681967 ?auto_1681973 ) ) ( not ( = ?auto_1681967 ?auto_1681974 ) ) ( not ( = ?auto_1681967 ?auto_1681975 ) ) ( not ( = ?auto_1681967 ?auto_1681976 ) ) ( not ( = ?auto_1681967 ?auto_1681977 ) ) ( not ( = ?auto_1681967 ?auto_1681978 ) ) ( not ( = ?auto_1681967 ?auto_1681979 ) ) ( not ( = ?auto_1681967 ?auto_1681980 ) ) ( not ( = ?auto_1681964 ?auto_1681968 ) ) ( not ( = ?auto_1681964 ?auto_1681970 ) ) ( not ( = ?auto_1681964 ?auto_1681969 ) ) ( not ( = ?auto_1681964 ?auto_1681971 ) ) ( not ( = ?auto_1681964 ?auto_1681972 ) ) ( not ( = ?auto_1681964 ?auto_1681973 ) ) ( not ( = ?auto_1681964 ?auto_1681974 ) ) ( not ( = ?auto_1681964 ?auto_1681975 ) ) ( not ( = ?auto_1681964 ?auto_1681976 ) ) ( not ( = ?auto_1681964 ?auto_1681977 ) ) ( not ( = ?auto_1681964 ?auto_1681978 ) ) ( not ( = ?auto_1681964 ?auto_1681979 ) ) ( not ( = ?auto_1681964 ?auto_1681980 ) ) ( not ( = ?auto_1681968 ?auto_1681970 ) ) ( not ( = ?auto_1681968 ?auto_1681969 ) ) ( not ( = ?auto_1681968 ?auto_1681971 ) ) ( not ( = ?auto_1681968 ?auto_1681972 ) ) ( not ( = ?auto_1681968 ?auto_1681973 ) ) ( not ( = ?auto_1681968 ?auto_1681974 ) ) ( not ( = ?auto_1681968 ?auto_1681975 ) ) ( not ( = ?auto_1681968 ?auto_1681976 ) ) ( not ( = ?auto_1681968 ?auto_1681977 ) ) ( not ( = ?auto_1681968 ?auto_1681978 ) ) ( not ( = ?auto_1681968 ?auto_1681979 ) ) ( not ( = ?auto_1681968 ?auto_1681980 ) ) ( not ( = ?auto_1681970 ?auto_1681969 ) ) ( not ( = ?auto_1681970 ?auto_1681971 ) ) ( not ( = ?auto_1681970 ?auto_1681972 ) ) ( not ( = ?auto_1681970 ?auto_1681973 ) ) ( not ( = ?auto_1681970 ?auto_1681974 ) ) ( not ( = ?auto_1681970 ?auto_1681975 ) ) ( not ( = ?auto_1681970 ?auto_1681976 ) ) ( not ( = ?auto_1681970 ?auto_1681977 ) ) ( not ( = ?auto_1681970 ?auto_1681978 ) ) ( not ( = ?auto_1681970 ?auto_1681979 ) ) ( not ( = ?auto_1681970 ?auto_1681980 ) ) ( not ( = ?auto_1681969 ?auto_1681971 ) ) ( not ( = ?auto_1681969 ?auto_1681972 ) ) ( not ( = ?auto_1681969 ?auto_1681973 ) ) ( not ( = ?auto_1681969 ?auto_1681974 ) ) ( not ( = ?auto_1681969 ?auto_1681975 ) ) ( not ( = ?auto_1681969 ?auto_1681976 ) ) ( not ( = ?auto_1681969 ?auto_1681977 ) ) ( not ( = ?auto_1681969 ?auto_1681978 ) ) ( not ( = ?auto_1681969 ?auto_1681979 ) ) ( not ( = ?auto_1681969 ?auto_1681980 ) ) ( not ( = ?auto_1681971 ?auto_1681972 ) ) ( not ( = ?auto_1681971 ?auto_1681973 ) ) ( not ( = ?auto_1681971 ?auto_1681974 ) ) ( not ( = ?auto_1681971 ?auto_1681975 ) ) ( not ( = ?auto_1681971 ?auto_1681976 ) ) ( not ( = ?auto_1681971 ?auto_1681977 ) ) ( not ( = ?auto_1681971 ?auto_1681978 ) ) ( not ( = ?auto_1681971 ?auto_1681979 ) ) ( not ( = ?auto_1681971 ?auto_1681980 ) ) ( not ( = ?auto_1681972 ?auto_1681973 ) ) ( not ( = ?auto_1681972 ?auto_1681974 ) ) ( not ( = ?auto_1681972 ?auto_1681975 ) ) ( not ( = ?auto_1681972 ?auto_1681976 ) ) ( not ( = ?auto_1681972 ?auto_1681977 ) ) ( not ( = ?auto_1681972 ?auto_1681978 ) ) ( not ( = ?auto_1681972 ?auto_1681979 ) ) ( not ( = ?auto_1681972 ?auto_1681980 ) ) ( not ( = ?auto_1681973 ?auto_1681974 ) ) ( not ( = ?auto_1681973 ?auto_1681975 ) ) ( not ( = ?auto_1681973 ?auto_1681976 ) ) ( not ( = ?auto_1681973 ?auto_1681977 ) ) ( not ( = ?auto_1681973 ?auto_1681978 ) ) ( not ( = ?auto_1681973 ?auto_1681979 ) ) ( not ( = ?auto_1681973 ?auto_1681980 ) ) ( not ( = ?auto_1681974 ?auto_1681975 ) ) ( not ( = ?auto_1681974 ?auto_1681976 ) ) ( not ( = ?auto_1681974 ?auto_1681977 ) ) ( not ( = ?auto_1681974 ?auto_1681978 ) ) ( not ( = ?auto_1681974 ?auto_1681979 ) ) ( not ( = ?auto_1681974 ?auto_1681980 ) ) ( not ( = ?auto_1681975 ?auto_1681976 ) ) ( not ( = ?auto_1681975 ?auto_1681977 ) ) ( not ( = ?auto_1681975 ?auto_1681978 ) ) ( not ( = ?auto_1681975 ?auto_1681979 ) ) ( not ( = ?auto_1681975 ?auto_1681980 ) ) ( not ( = ?auto_1681976 ?auto_1681977 ) ) ( not ( = ?auto_1681976 ?auto_1681978 ) ) ( not ( = ?auto_1681976 ?auto_1681979 ) ) ( not ( = ?auto_1681976 ?auto_1681980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681977 ?auto_1681978 ?auto_1681979 )
      ( MAKE-15CRATE-VERIFY ?auto_1681965 ?auto_1681966 ?auto_1681967 ?auto_1681964 ?auto_1681968 ?auto_1681970 ?auto_1681969 ?auto_1681971 ?auto_1681972 ?auto_1681973 ?auto_1681974 ?auto_1681975 ?auto_1681976 ?auto_1681977 ?auto_1681978 ?auto_1681979 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682191 - SURFACE
      ?auto_1682192 - SURFACE
      ?auto_1682193 - SURFACE
      ?auto_1682190 - SURFACE
      ?auto_1682194 - SURFACE
      ?auto_1682196 - SURFACE
      ?auto_1682195 - SURFACE
      ?auto_1682197 - SURFACE
      ?auto_1682198 - SURFACE
      ?auto_1682199 - SURFACE
      ?auto_1682200 - SURFACE
      ?auto_1682201 - SURFACE
      ?auto_1682202 - SURFACE
      ?auto_1682203 - SURFACE
      ?auto_1682204 - SURFACE
      ?auto_1682205 - SURFACE
    )
    :vars
    (
      ?auto_1682206 - HOIST
      ?auto_1682208 - PLACE
      ?auto_1682211 - PLACE
      ?auto_1682207 - HOIST
      ?auto_1682209 - SURFACE
      ?auto_1682210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682206 ?auto_1682208 ) ( SURFACE-AT ?auto_1682204 ?auto_1682208 ) ( CLEAR ?auto_1682204 ) ( IS-CRATE ?auto_1682205 ) ( not ( = ?auto_1682204 ?auto_1682205 ) ) ( AVAILABLE ?auto_1682206 ) ( ON ?auto_1682204 ?auto_1682203 ) ( not ( = ?auto_1682203 ?auto_1682204 ) ) ( not ( = ?auto_1682203 ?auto_1682205 ) ) ( not ( = ?auto_1682211 ?auto_1682208 ) ) ( HOIST-AT ?auto_1682207 ?auto_1682211 ) ( not ( = ?auto_1682206 ?auto_1682207 ) ) ( AVAILABLE ?auto_1682207 ) ( SURFACE-AT ?auto_1682205 ?auto_1682211 ) ( ON ?auto_1682205 ?auto_1682209 ) ( CLEAR ?auto_1682205 ) ( not ( = ?auto_1682204 ?auto_1682209 ) ) ( not ( = ?auto_1682205 ?auto_1682209 ) ) ( not ( = ?auto_1682203 ?auto_1682209 ) ) ( TRUCK-AT ?auto_1682210 ?auto_1682208 ) ( ON ?auto_1682192 ?auto_1682191 ) ( ON ?auto_1682193 ?auto_1682192 ) ( ON ?auto_1682190 ?auto_1682193 ) ( ON ?auto_1682194 ?auto_1682190 ) ( ON ?auto_1682196 ?auto_1682194 ) ( ON ?auto_1682195 ?auto_1682196 ) ( ON ?auto_1682197 ?auto_1682195 ) ( ON ?auto_1682198 ?auto_1682197 ) ( ON ?auto_1682199 ?auto_1682198 ) ( ON ?auto_1682200 ?auto_1682199 ) ( ON ?auto_1682201 ?auto_1682200 ) ( ON ?auto_1682202 ?auto_1682201 ) ( ON ?auto_1682203 ?auto_1682202 ) ( not ( = ?auto_1682191 ?auto_1682192 ) ) ( not ( = ?auto_1682191 ?auto_1682193 ) ) ( not ( = ?auto_1682191 ?auto_1682190 ) ) ( not ( = ?auto_1682191 ?auto_1682194 ) ) ( not ( = ?auto_1682191 ?auto_1682196 ) ) ( not ( = ?auto_1682191 ?auto_1682195 ) ) ( not ( = ?auto_1682191 ?auto_1682197 ) ) ( not ( = ?auto_1682191 ?auto_1682198 ) ) ( not ( = ?auto_1682191 ?auto_1682199 ) ) ( not ( = ?auto_1682191 ?auto_1682200 ) ) ( not ( = ?auto_1682191 ?auto_1682201 ) ) ( not ( = ?auto_1682191 ?auto_1682202 ) ) ( not ( = ?auto_1682191 ?auto_1682203 ) ) ( not ( = ?auto_1682191 ?auto_1682204 ) ) ( not ( = ?auto_1682191 ?auto_1682205 ) ) ( not ( = ?auto_1682191 ?auto_1682209 ) ) ( not ( = ?auto_1682192 ?auto_1682193 ) ) ( not ( = ?auto_1682192 ?auto_1682190 ) ) ( not ( = ?auto_1682192 ?auto_1682194 ) ) ( not ( = ?auto_1682192 ?auto_1682196 ) ) ( not ( = ?auto_1682192 ?auto_1682195 ) ) ( not ( = ?auto_1682192 ?auto_1682197 ) ) ( not ( = ?auto_1682192 ?auto_1682198 ) ) ( not ( = ?auto_1682192 ?auto_1682199 ) ) ( not ( = ?auto_1682192 ?auto_1682200 ) ) ( not ( = ?auto_1682192 ?auto_1682201 ) ) ( not ( = ?auto_1682192 ?auto_1682202 ) ) ( not ( = ?auto_1682192 ?auto_1682203 ) ) ( not ( = ?auto_1682192 ?auto_1682204 ) ) ( not ( = ?auto_1682192 ?auto_1682205 ) ) ( not ( = ?auto_1682192 ?auto_1682209 ) ) ( not ( = ?auto_1682193 ?auto_1682190 ) ) ( not ( = ?auto_1682193 ?auto_1682194 ) ) ( not ( = ?auto_1682193 ?auto_1682196 ) ) ( not ( = ?auto_1682193 ?auto_1682195 ) ) ( not ( = ?auto_1682193 ?auto_1682197 ) ) ( not ( = ?auto_1682193 ?auto_1682198 ) ) ( not ( = ?auto_1682193 ?auto_1682199 ) ) ( not ( = ?auto_1682193 ?auto_1682200 ) ) ( not ( = ?auto_1682193 ?auto_1682201 ) ) ( not ( = ?auto_1682193 ?auto_1682202 ) ) ( not ( = ?auto_1682193 ?auto_1682203 ) ) ( not ( = ?auto_1682193 ?auto_1682204 ) ) ( not ( = ?auto_1682193 ?auto_1682205 ) ) ( not ( = ?auto_1682193 ?auto_1682209 ) ) ( not ( = ?auto_1682190 ?auto_1682194 ) ) ( not ( = ?auto_1682190 ?auto_1682196 ) ) ( not ( = ?auto_1682190 ?auto_1682195 ) ) ( not ( = ?auto_1682190 ?auto_1682197 ) ) ( not ( = ?auto_1682190 ?auto_1682198 ) ) ( not ( = ?auto_1682190 ?auto_1682199 ) ) ( not ( = ?auto_1682190 ?auto_1682200 ) ) ( not ( = ?auto_1682190 ?auto_1682201 ) ) ( not ( = ?auto_1682190 ?auto_1682202 ) ) ( not ( = ?auto_1682190 ?auto_1682203 ) ) ( not ( = ?auto_1682190 ?auto_1682204 ) ) ( not ( = ?auto_1682190 ?auto_1682205 ) ) ( not ( = ?auto_1682190 ?auto_1682209 ) ) ( not ( = ?auto_1682194 ?auto_1682196 ) ) ( not ( = ?auto_1682194 ?auto_1682195 ) ) ( not ( = ?auto_1682194 ?auto_1682197 ) ) ( not ( = ?auto_1682194 ?auto_1682198 ) ) ( not ( = ?auto_1682194 ?auto_1682199 ) ) ( not ( = ?auto_1682194 ?auto_1682200 ) ) ( not ( = ?auto_1682194 ?auto_1682201 ) ) ( not ( = ?auto_1682194 ?auto_1682202 ) ) ( not ( = ?auto_1682194 ?auto_1682203 ) ) ( not ( = ?auto_1682194 ?auto_1682204 ) ) ( not ( = ?auto_1682194 ?auto_1682205 ) ) ( not ( = ?auto_1682194 ?auto_1682209 ) ) ( not ( = ?auto_1682196 ?auto_1682195 ) ) ( not ( = ?auto_1682196 ?auto_1682197 ) ) ( not ( = ?auto_1682196 ?auto_1682198 ) ) ( not ( = ?auto_1682196 ?auto_1682199 ) ) ( not ( = ?auto_1682196 ?auto_1682200 ) ) ( not ( = ?auto_1682196 ?auto_1682201 ) ) ( not ( = ?auto_1682196 ?auto_1682202 ) ) ( not ( = ?auto_1682196 ?auto_1682203 ) ) ( not ( = ?auto_1682196 ?auto_1682204 ) ) ( not ( = ?auto_1682196 ?auto_1682205 ) ) ( not ( = ?auto_1682196 ?auto_1682209 ) ) ( not ( = ?auto_1682195 ?auto_1682197 ) ) ( not ( = ?auto_1682195 ?auto_1682198 ) ) ( not ( = ?auto_1682195 ?auto_1682199 ) ) ( not ( = ?auto_1682195 ?auto_1682200 ) ) ( not ( = ?auto_1682195 ?auto_1682201 ) ) ( not ( = ?auto_1682195 ?auto_1682202 ) ) ( not ( = ?auto_1682195 ?auto_1682203 ) ) ( not ( = ?auto_1682195 ?auto_1682204 ) ) ( not ( = ?auto_1682195 ?auto_1682205 ) ) ( not ( = ?auto_1682195 ?auto_1682209 ) ) ( not ( = ?auto_1682197 ?auto_1682198 ) ) ( not ( = ?auto_1682197 ?auto_1682199 ) ) ( not ( = ?auto_1682197 ?auto_1682200 ) ) ( not ( = ?auto_1682197 ?auto_1682201 ) ) ( not ( = ?auto_1682197 ?auto_1682202 ) ) ( not ( = ?auto_1682197 ?auto_1682203 ) ) ( not ( = ?auto_1682197 ?auto_1682204 ) ) ( not ( = ?auto_1682197 ?auto_1682205 ) ) ( not ( = ?auto_1682197 ?auto_1682209 ) ) ( not ( = ?auto_1682198 ?auto_1682199 ) ) ( not ( = ?auto_1682198 ?auto_1682200 ) ) ( not ( = ?auto_1682198 ?auto_1682201 ) ) ( not ( = ?auto_1682198 ?auto_1682202 ) ) ( not ( = ?auto_1682198 ?auto_1682203 ) ) ( not ( = ?auto_1682198 ?auto_1682204 ) ) ( not ( = ?auto_1682198 ?auto_1682205 ) ) ( not ( = ?auto_1682198 ?auto_1682209 ) ) ( not ( = ?auto_1682199 ?auto_1682200 ) ) ( not ( = ?auto_1682199 ?auto_1682201 ) ) ( not ( = ?auto_1682199 ?auto_1682202 ) ) ( not ( = ?auto_1682199 ?auto_1682203 ) ) ( not ( = ?auto_1682199 ?auto_1682204 ) ) ( not ( = ?auto_1682199 ?auto_1682205 ) ) ( not ( = ?auto_1682199 ?auto_1682209 ) ) ( not ( = ?auto_1682200 ?auto_1682201 ) ) ( not ( = ?auto_1682200 ?auto_1682202 ) ) ( not ( = ?auto_1682200 ?auto_1682203 ) ) ( not ( = ?auto_1682200 ?auto_1682204 ) ) ( not ( = ?auto_1682200 ?auto_1682205 ) ) ( not ( = ?auto_1682200 ?auto_1682209 ) ) ( not ( = ?auto_1682201 ?auto_1682202 ) ) ( not ( = ?auto_1682201 ?auto_1682203 ) ) ( not ( = ?auto_1682201 ?auto_1682204 ) ) ( not ( = ?auto_1682201 ?auto_1682205 ) ) ( not ( = ?auto_1682201 ?auto_1682209 ) ) ( not ( = ?auto_1682202 ?auto_1682203 ) ) ( not ( = ?auto_1682202 ?auto_1682204 ) ) ( not ( = ?auto_1682202 ?auto_1682205 ) ) ( not ( = ?auto_1682202 ?auto_1682209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682203 ?auto_1682204 ?auto_1682205 )
      ( MAKE-15CRATE-VERIFY ?auto_1682191 ?auto_1682192 ?auto_1682193 ?auto_1682190 ?auto_1682194 ?auto_1682196 ?auto_1682195 ?auto_1682197 ?auto_1682198 ?auto_1682199 ?auto_1682200 ?auto_1682201 ?auto_1682202 ?auto_1682203 ?auto_1682204 ?auto_1682205 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682417 - SURFACE
      ?auto_1682418 - SURFACE
      ?auto_1682419 - SURFACE
      ?auto_1682416 - SURFACE
      ?auto_1682420 - SURFACE
      ?auto_1682422 - SURFACE
      ?auto_1682421 - SURFACE
      ?auto_1682423 - SURFACE
      ?auto_1682424 - SURFACE
      ?auto_1682425 - SURFACE
      ?auto_1682426 - SURFACE
      ?auto_1682427 - SURFACE
      ?auto_1682428 - SURFACE
      ?auto_1682429 - SURFACE
      ?auto_1682430 - SURFACE
      ?auto_1682431 - SURFACE
    )
    :vars
    (
      ?auto_1682436 - HOIST
      ?auto_1682433 - PLACE
      ?auto_1682434 - PLACE
      ?auto_1682435 - HOIST
      ?auto_1682437 - SURFACE
      ?auto_1682432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682436 ?auto_1682433 ) ( IS-CRATE ?auto_1682431 ) ( not ( = ?auto_1682430 ?auto_1682431 ) ) ( not ( = ?auto_1682429 ?auto_1682430 ) ) ( not ( = ?auto_1682429 ?auto_1682431 ) ) ( not ( = ?auto_1682434 ?auto_1682433 ) ) ( HOIST-AT ?auto_1682435 ?auto_1682434 ) ( not ( = ?auto_1682436 ?auto_1682435 ) ) ( AVAILABLE ?auto_1682435 ) ( SURFACE-AT ?auto_1682431 ?auto_1682434 ) ( ON ?auto_1682431 ?auto_1682437 ) ( CLEAR ?auto_1682431 ) ( not ( = ?auto_1682430 ?auto_1682437 ) ) ( not ( = ?auto_1682431 ?auto_1682437 ) ) ( not ( = ?auto_1682429 ?auto_1682437 ) ) ( TRUCK-AT ?auto_1682432 ?auto_1682433 ) ( SURFACE-AT ?auto_1682429 ?auto_1682433 ) ( CLEAR ?auto_1682429 ) ( LIFTING ?auto_1682436 ?auto_1682430 ) ( IS-CRATE ?auto_1682430 ) ( ON ?auto_1682418 ?auto_1682417 ) ( ON ?auto_1682419 ?auto_1682418 ) ( ON ?auto_1682416 ?auto_1682419 ) ( ON ?auto_1682420 ?auto_1682416 ) ( ON ?auto_1682422 ?auto_1682420 ) ( ON ?auto_1682421 ?auto_1682422 ) ( ON ?auto_1682423 ?auto_1682421 ) ( ON ?auto_1682424 ?auto_1682423 ) ( ON ?auto_1682425 ?auto_1682424 ) ( ON ?auto_1682426 ?auto_1682425 ) ( ON ?auto_1682427 ?auto_1682426 ) ( ON ?auto_1682428 ?auto_1682427 ) ( ON ?auto_1682429 ?auto_1682428 ) ( not ( = ?auto_1682417 ?auto_1682418 ) ) ( not ( = ?auto_1682417 ?auto_1682419 ) ) ( not ( = ?auto_1682417 ?auto_1682416 ) ) ( not ( = ?auto_1682417 ?auto_1682420 ) ) ( not ( = ?auto_1682417 ?auto_1682422 ) ) ( not ( = ?auto_1682417 ?auto_1682421 ) ) ( not ( = ?auto_1682417 ?auto_1682423 ) ) ( not ( = ?auto_1682417 ?auto_1682424 ) ) ( not ( = ?auto_1682417 ?auto_1682425 ) ) ( not ( = ?auto_1682417 ?auto_1682426 ) ) ( not ( = ?auto_1682417 ?auto_1682427 ) ) ( not ( = ?auto_1682417 ?auto_1682428 ) ) ( not ( = ?auto_1682417 ?auto_1682429 ) ) ( not ( = ?auto_1682417 ?auto_1682430 ) ) ( not ( = ?auto_1682417 ?auto_1682431 ) ) ( not ( = ?auto_1682417 ?auto_1682437 ) ) ( not ( = ?auto_1682418 ?auto_1682419 ) ) ( not ( = ?auto_1682418 ?auto_1682416 ) ) ( not ( = ?auto_1682418 ?auto_1682420 ) ) ( not ( = ?auto_1682418 ?auto_1682422 ) ) ( not ( = ?auto_1682418 ?auto_1682421 ) ) ( not ( = ?auto_1682418 ?auto_1682423 ) ) ( not ( = ?auto_1682418 ?auto_1682424 ) ) ( not ( = ?auto_1682418 ?auto_1682425 ) ) ( not ( = ?auto_1682418 ?auto_1682426 ) ) ( not ( = ?auto_1682418 ?auto_1682427 ) ) ( not ( = ?auto_1682418 ?auto_1682428 ) ) ( not ( = ?auto_1682418 ?auto_1682429 ) ) ( not ( = ?auto_1682418 ?auto_1682430 ) ) ( not ( = ?auto_1682418 ?auto_1682431 ) ) ( not ( = ?auto_1682418 ?auto_1682437 ) ) ( not ( = ?auto_1682419 ?auto_1682416 ) ) ( not ( = ?auto_1682419 ?auto_1682420 ) ) ( not ( = ?auto_1682419 ?auto_1682422 ) ) ( not ( = ?auto_1682419 ?auto_1682421 ) ) ( not ( = ?auto_1682419 ?auto_1682423 ) ) ( not ( = ?auto_1682419 ?auto_1682424 ) ) ( not ( = ?auto_1682419 ?auto_1682425 ) ) ( not ( = ?auto_1682419 ?auto_1682426 ) ) ( not ( = ?auto_1682419 ?auto_1682427 ) ) ( not ( = ?auto_1682419 ?auto_1682428 ) ) ( not ( = ?auto_1682419 ?auto_1682429 ) ) ( not ( = ?auto_1682419 ?auto_1682430 ) ) ( not ( = ?auto_1682419 ?auto_1682431 ) ) ( not ( = ?auto_1682419 ?auto_1682437 ) ) ( not ( = ?auto_1682416 ?auto_1682420 ) ) ( not ( = ?auto_1682416 ?auto_1682422 ) ) ( not ( = ?auto_1682416 ?auto_1682421 ) ) ( not ( = ?auto_1682416 ?auto_1682423 ) ) ( not ( = ?auto_1682416 ?auto_1682424 ) ) ( not ( = ?auto_1682416 ?auto_1682425 ) ) ( not ( = ?auto_1682416 ?auto_1682426 ) ) ( not ( = ?auto_1682416 ?auto_1682427 ) ) ( not ( = ?auto_1682416 ?auto_1682428 ) ) ( not ( = ?auto_1682416 ?auto_1682429 ) ) ( not ( = ?auto_1682416 ?auto_1682430 ) ) ( not ( = ?auto_1682416 ?auto_1682431 ) ) ( not ( = ?auto_1682416 ?auto_1682437 ) ) ( not ( = ?auto_1682420 ?auto_1682422 ) ) ( not ( = ?auto_1682420 ?auto_1682421 ) ) ( not ( = ?auto_1682420 ?auto_1682423 ) ) ( not ( = ?auto_1682420 ?auto_1682424 ) ) ( not ( = ?auto_1682420 ?auto_1682425 ) ) ( not ( = ?auto_1682420 ?auto_1682426 ) ) ( not ( = ?auto_1682420 ?auto_1682427 ) ) ( not ( = ?auto_1682420 ?auto_1682428 ) ) ( not ( = ?auto_1682420 ?auto_1682429 ) ) ( not ( = ?auto_1682420 ?auto_1682430 ) ) ( not ( = ?auto_1682420 ?auto_1682431 ) ) ( not ( = ?auto_1682420 ?auto_1682437 ) ) ( not ( = ?auto_1682422 ?auto_1682421 ) ) ( not ( = ?auto_1682422 ?auto_1682423 ) ) ( not ( = ?auto_1682422 ?auto_1682424 ) ) ( not ( = ?auto_1682422 ?auto_1682425 ) ) ( not ( = ?auto_1682422 ?auto_1682426 ) ) ( not ( = ?auto_1682422 ?auto_1682427 ) ) ( not ( = ?auto_1682422 ?auto_1682428 ) ) ( not ( = ?auto_1682422 ?auto_1682429 ) ) ( not ( = ?auto_1682422 ?auto_1682430 ) ) ( not ( = ?auto_1682422 ?auto_1682431 ) ) ( not ( = ?auto_1682422 ?auto_1682437 ) ) ( not ( = ?auto_1682421 ?auto_1682423 ) ) ( not ( = ?auto_1682421 ?auto_1682424 ) ) ( not ( = ?auto_1682421 ?auto_1682425 ) ) ( not ( = ?auto_1682421 ?auto_1682426 ) ) ( not ( = ?auto_1682421 ?auto_1682427 ) ) ( not ( = ?auto_1682421 ?auto_1682428 ) ) ( not ( = ?auto_1682421 ?auto_1682429 ) ) ( not ( = ?auto_1682421 ?auto_1682430 ) ) ( not ( = ?auto_1682421 ?auto_1682431 ) ) ( not ( = ?auto_1682421 ?auto_1682437 ) ) ( not ( = ?auto_1682423 ?auto_1682424 ) ) ( not ( = ?auto_1682423 ?auto_1682425 ) ) ( not ( = ?auto_1682423 ?auto_1682426 ) ) ( not ( = ?auto_1682423 ?auto_1682427 ) ) ( not ( = ?auto_1682423 ?auto_1682428 ) ) ( not ( = ?auto_1682423 ?auto_1682429 ) ) ( not ( = ?auto_1682423 ?auto_1682430 ) ) ( not ( = ?auto_1682423 ?auto_1682431 ) ) ( not ( = ?auto_1682423 ?auto_1682437 ) ) ( not ( = ?auto_1682424 ?auto_1682425 ) ) ( not ( = ?auto_1682424 ?auto_1682426 ) ) ( not ( = ?auto_1682424 ?auto_1682427 ) ) ( not ( = ?auto_1682424 ?auto_1682428 ) ) ( not ( = ?auto_1682424 ?auto_1682429 ) ) ( not ( = ?auto_1682424 ?auto_1682430 ) ) ( not ( = ?auto_1682424 ?auto_1682431 ) ) ( not ( = ?auto_1682424 ?auto_1682437 ) ) ( not ( = ?auto_1682425 ?auto_1682426 ) ) ( not ( = ?auto_1682425 ?auto_1682427 ) ) ( not ( = ?auto_1682425 ?auto_1682428 ) ) ( not ( = ?auto_1682425 ?auto_1682429 ) ) ( not ( = ?auto_1682425 ?auto_1682430 ) ) ( not ( = ?auto_1682425 ?auto_1682431 ) ) ( not ( = ?auto_1682425 ?auto_1682437 ) ) ( not ( = ?auto_1682426 ?auto_1682427 ) ) ( not ( = ?auto_1682426 ?auto_1682428 ) ) ( not ( = ?auto_1682426 ?auto_1682429 ) ) ( not ( = ?auto_1682426 ?auto_1682430 ) ) ( not ( = ?auto_1682426 ?auto_1682431 ) ) ( not ( = ?auto_1682426 ?auto_1682437 ) ) ( not ( = ?auto_1682427 ?auto_1682428 ) ) ( not ( = ?auto_1682427 ?auto_1682429 ) ) ( not ( = ?auto_1682427 ?auto_1682430 ) ) ( not ( = ?auto_1682427 ?auto_1682431 ) ) ( not ( = ?auto_1682427 ?auto_1682437 ) ) ( not ( = ?auto_1682428 ?auto_1682429 ) ) ( not ( = ?auto_1682428 ?auto_1682430 ) ) ( not ( = ?auto_1682428 ?auto_1682431 ) ) ( not ( = ?auto_1682428 ?auto_1682437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682429 ?auto_1682430 ?auto_1682431 )
      ( MAKE-15CRATE-VERIFY ?auto_1682417 ?auto_1682418 ?auto_1682419 ?auto_1682416 ?auto_1682420 ?auto_1682422 ?auto_1682421 ?auto_1682423 ?auto_1682424 ?auto_1682425 ?auto_1682426 ?auto_1682427 ?auto_1682428 ?auto_1682429 ?auto_1682430 ?auto_1682431 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682643 - SURFACE
      ?auto_1682644 - SURFACE
      ?auto_1682645 - SURFACE
      ?auto_1682642 - SURFACE
      ?auto_1682646 - SURFACE
      ?auto_1682648 - SURFACE
      ?auto_1682647 - SURFACE
      ?auto_1682649 - SURFACE
      ?auto_1682650 - SURFACE
      ?auto_1682651 - SURFACE
      ?auto_1682652 - SURFACE
      ?auto_1682653 - SURFACE
      ?auto_1682654 - SURFACE
      ?auto_1682655 - SURFACE
      ?auto_1682656 - SURFACE
      ?auto_1682657 - SURFACE
    )
    :vars
    (
      ?auto_1682662 - HOIST
      ?auto_1682661 - PLACE
      ?auto_1682658 - PLACE
      ?auto_1682663 - HOIST
      ?auto_1682660 - SURFACE
      ?auto_1682659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682662 ?auto_1682661 ) ( IS-CRATE ?auto_1682657 ) ( not ( = ?auto_1682656 ?auto_1682657 ) ) ( not ( = ?auto_1682655 ?auto_1682656 ) ) ( not ( = ?auto_1682655 ?auto_1682657 ) ) ( not ( = ?auto_1682658 ?auto_1682661 ) ) ( HOIST-AT ?auto_1682663 ?auto_1682658 ) ( not ( = ?auto_1682662 ?auto_1682663 ) ) ( AVAILABLE ?auto_1682663 ) ( SURFACE-AT ?auto_1682657 ?auto_1682658 ) ( ON ?auto_1682657 ?auto_1682660 ) ( CLEAR ?auto_1682657 ) ( not ( = ?auto_1682656 ?auto_1682660 ) ) ( not ( = ?auto_1682657 ?auto_1682660 ) ) ( not ( = ?auto_1682655 ?auto_1682660 ) ) ( TRUCK-AT ?auto_1682659 ?auto_1682661 ) ( SURFACE-AT ?auto_1682655 ?auto_1682661 ) ( CLEAR ?auto_1682655 ) ( IS-CRATE ?auto_1682656 ) ( AVAILABLE ?auto_1682662 ) ( IN ?auto_1682656 ?auto_1682659 ) ( ON ?auto_1682644 ?auto_1682643 ) ( ON ?auto_1682645 ?auto_1682644 ) ( ON ?auto_1682642 ?auto_1682645 ) ( ON ?auto_1682646 ?auto_1682642 ) ( ON ?auto_1682648 ?auto_1682646 ) ( ON ?auto_1682647 ?auto_1682648 ) ( ON ?auto_1682649 ?auto_1682647 ) ( ON ?auto_1682650 ?auto_1682649 ) ( ON ?auto_1682651 ?auto_1682650 ) ( ON ?auto_1682652 ?auto_1682651 ) ( ON ?auto_1682653 ?auto_1682652 ) ( ON ?auto_1682654 ?auto_1682653 ) ( ON ?auto_1682655 ?auto_1682654 ) ( not ( = ?auto_1682643 ?auto_1682644 ) ) ( not ( = ?auto_1682643 ?auto_1682645 ) ) ( not ( = ?auto_1682643 ?auto_1682642 ) ) ( not ( = ?auto_1682643 ?auto_1682646 ) ) ( not ( = ?auto_1682643 ?auto_1682648 ) ) ( not ( = ?auto_1682643 ?auto_1682647 ) ) ( not ( = ?auto_1682643 ?auto_1682649 ) ) ( not ( = ?auto_1682643 ?auto_1682650 ) ) ( not ( = ?auto_1682643 ?auto_1682651 ) ) ( not ( = ?auto_1682643 ?auto_1682652 ) ) ( not ( = ?auto_1682643 ?auto_1682653 ) ) ( not ( = ?auto_1682643 ?auto_1682654 ) ) ( not ( = ?auto_1682643 ?auto_1682655 ) ) ( not ( = ?auto_1682643 ?auto_1682656 ) ) ( not ( = ?auto_1682643 ?auto_1682657 ) ) ( not ( = ?auto_1682643 ?auto_1682660 ) ) ( not ( = ?auto_1682644 ?auto_1682645 ) ) ( not ( = ?auto_1682644 ?auto_1682642 ) ) ( not ( = ?auto_1682644 ?auto_1682646 ) ) ( not ( = ?auto_1682644 ?auto_1682648 ) ) ( not ( = ?auto_1682644 ?auto_1682647 ) ) ( not ( = ?auto_1682644 ?auto_1682649 ) ) ( not ( = ?auto_1682644 ?auto_1682650 ) ) ( not ( = ?auto_1682644 ?auto_1682651 ) ) ( not ( = ?auto_1682644 ?auto_1682652 ) ) ( not ( = ?auto_1682644 ?auto_1682653 ) ) ( not ( = ?auto_1682644 ?auto_1682654 ) ) ( not ( = ?auto_1682644 ?auto_1682655 ) ) ( not ( = ?auto_1682644 ?auto_1682656 ) ) ( not ( = ?auto_1682644 ?auto_1682657 ) ) ( not ( = ?auto_1682644 ?auto_1682660 ) ) ( not ( = ?auto_1682645 ?auto_1682642 ) ) ( not ( = ?auto_1682645 ?auto_1682646 ) ) ( not ( = ?auto_1682645 ?auto_1682648 ) ) ( not ( = ?auto_1682645 ?auto_1682647 ) ) ( not ( = ?auto_1682645 ?auto_1682649 ) ) ( not ( = ?auto_1682645 ?auto_1682650 ) ) ( not ( = ?auto_1682645 ?auto_1682651 ) ) ( not ( = ?auto_1682645 ?auto_1682652 ) ) ( not ( = ?auto_1682645 ?auto_1682653 ) ) ( not ( = ?auto_1682645 ?auto_1682654 ) ) ( not ( = ?auto_1682645 ?auto_1682655 ) ) ( not ( = ?auto_1682645 ?auto_1682656 ) ) ( not ( = ?auto_1682645 ?auto_1682657 ) ) ( not ( = ?auto_1682645 ?auto_1682660 ) ) ( not ( = ?auto_1682642 ?auto_1682646 ) ) ( not ( = ?auto_1682642 ?auto_1682648 ) ) ( not ( = ?auto_1682642 ?auto_1682647 ) ) ( not ( = ?auto_1682642 ?auto_1682649 ) ) ( not ( = ?auto_1682642 ?auto_1682650 ) ) ( not ( = ?auto_1682642 ?auto_1682651 ) ) ( not ( = ?auto_1682642 ?auto_1682652 ) ) ( not ( = ?auto_1682642 ?auto_1682653 ) ) ( not ( = ?auto_1682642 ?auto_1682654 ) ) ( not ( = ?auto_1682642 ?auto_1682655 ) ) ( not ( = ?auto_1682642 ?auto_1682656 ) ) ( not ( = ?auto_1682642 ?auto_1682657 ) ) ( not ( = ?auto_1682642 ?auto_1682660 ) ) ( not ( = ?auto_1682646 ?auto_1682648 ) ) ( not ( = ?auto_1682646 ?auto_1682647 ) ) ( not ( = ?auto_1682646 ?auto_1682649 ) ) ( not ( = ?auto_1682646 ?auto_1682650 ) ) ( not ( = ?auto_1682646 ?auto_1682651 ) ) ( not ( = ?auto_1682646 ?auto_1682652 ) ) ( not ( = ?auto_1682646 ?auto_1682653 ) ) ( not ( = ?auto_1682646 ?auto_1682654 ) ) ( not ( = ?auto_1682646 ?auto_1682655 ) ) ( not ( = ?auto_1682646 ?auto_1682656 ) ) ( not ( = ?auto_1682646 ?auto_1682657 ) ) ( not ( = ?auto_1682646 ?auto_1682660 ) ) ( not ( = ?auto_1682648 ?auto_1682647 ) ) ( not ( = ?auto_1682648 ?auto_1682649 ) ) ( not ( = ?auto_1682648 ?auto_1682650 ) ) ( not ( = ?auto_1682648 ?auto_1682651 ) ) ( not ( = ?auto_1682648 ?auto_1682652 ) ) ( not ( = ?auto_1682648 ?auto_1682653 ) ) ( not ( = ?auto_1682648 ?auto_1682654 ) ) ( not ( = ?auto_1682648 ?auto_1682655 ) ) ( not ( = ?auto_1682648 ?auto_1682656 ) ) ( not ( = ?auto_1682648 ?auto_1682657 ) ) ( not ( = ?auto_1682648 ?auto_1682660 ) ) ( not ( = ?auto_1682647 ?auto_1682649 ) ) ( not ( = ?auto_1682647 ?auto_1682650 ) ) ( not ( = ?auto_1682647 ?auto_1682651 ) ) ( not ( = ?auto_1682647 ?auto_1682652 ) ) ( not ( = ?auto_1682647 ?auto_1682653 ) ) ( not ( = ?auto_1682647 ?auto_1682654 ) ) ( not ( = ?auto_1682647 ?auto_1682655 ) ) ( not ( = ?auto_1682647 ?auto_1682656 ) ) ( not ( = ?auto_1682647 ?auto_1682657 ) ) ( not ( = ?auto_1682647 ?auto_1682660 ) ) ( not ( = ?auto_1682649 ?auto_1682650 ) ) ( not ( = ?auto_1682649 ?auto_1682651 ) ) ( not ( = ?auto_1682649 ?auto_1682652 ) ) ( not ( = ?auto_1682649 ?auto_1682653 ) ) ( not ( = ?auto_1682649 ?auto_1682654 ) ) ( not ( = ?auto_1682649 ?auto_1682655 ) ) ( not ( = ?auto_1682649 ?auto_1682656 ) ) ( not ( = ?auto_1682649 ?auto_1682657 ) ) ( not ( = ?auto_1682649 ?auto_1682660 ) ) ( not ( = ?auto_1682650 ?auto_1682651 ) ) ( not ( = ?auto_1682650 ?auto_1682652 ) ) ( not ( = ?auto_1682650 ?auto_1682653 ) ) ( not ( = ?auto_1682650 ?auto_1682654 ) ) ( not ( = ?auto_1682650 ?auto_1682655 ) ) ( not ( = ?auto_1682650 ?auto_1682656 ) ) ( not ( = ?auto_1682650 ?auto_1682657 ) ) ( not ( = ?auto_1682650 ?auto_1682660 ) ) ( not ( = ?auto_1682651 ?auto_1682652 ) ) ( not ( = ?auto_1682651 ?auto_1682653 ) ) ( not ( = ?auto_1682651 ?auto_1682654 ) ) ( not ( = ?auto_1682651 ?auto_1682655 ) ) ( not ( = ?auto_1682651 ?auto_1682656 ) ) ( not ( = ?auto_1682651 ?auto_1682657 ) ) ( not ( = ?auto_1682651 ?auto_1682660 ) ) ( not ( = ?auto_1682652 ?auto_1682653 ) ) ( not ( = ?auto_1682652 ?auto_1682654 ) ) ( not ( = ?auto_1682652 ?auto_1682655 ) ) ( not ( = ?auto_1682652 ?auto_1682656 ) ) ( not ( = ?auto_1682652 ?auto_1682657 ) ) ( not ( = ?auto_1682652 ?auto_1682660 ) ) ( not ( = ?auto_1682653 ?auto_1682654 ) ) ( not ( = ?auto_1682653 ?auto_1682655 ) ) ( not ( = ?auto_1682653 ?auto_1682656 ) ) ( not ( = ?auto_1682653 ?auto_1682657 ) ) ( not ( = ?auto_1682653 ?auto_1682660 ) ) ( not ( = ?auto_1682654 ?auto_1682655 ) ) ( not ( = ?auto_1682654 ?auto_1682656 ) ) ( not ( = ?auto_1682654 ?auto_1682657 ) ) ( not ( = ?auto_1682654 ?auto_1682660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682655 ?auto_1682656 ?auto_1682657 )
      ( MAKE-15CRATE-VERIFY ?auto_1682643 ?auto_1682644 ?auto_1682645 ?auto_1682642 ?auto_1682646 ?auto_1682648 ?auto_1682647 ?auto_1682649 ?auto_1682650 ?auto_1682651 ?auto_1682652 ?auto_1682653 ?auto_1682654 ?auto_1682655 ?auto_1682656 ?auto_1682657 ) )
  )

)

