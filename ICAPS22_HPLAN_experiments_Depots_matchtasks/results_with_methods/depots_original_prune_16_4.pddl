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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657300 - SURFACE
      ?auto_2657301 - SURFACE
    )
    :vars
    (
      ?auto_2657302 - HOIST
      ?auto_2657303 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657302 ?auto_2657303 ) ( SURFACE-AT ?auto_2657300 ?auto_2657303 ) ( CLEAR ?auto_2657300 ) ( LIFTING ?auto_2657302 ?auto_2657301 ) ( IS-CRATE ?auto_2657301 ) ( not ( = ?auto_2657300 ?auto_2657301 ) ) )
    :subtasks
    ( ( !DROP ?auto_2657302 ?auto_2657301 ?auto_2657300 ?auto_2657303 )
      ( MAKE-1CRATE-VERIFY ?auto_2657300 ?auto_2657301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657304 - SURFACE
      ?auto_2657305 - SURFACE
    )
    :vars
    (
      ?auto_2657307 - HOIST
      ?auto_2657306 - PLACE
      ?auto_2657308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657307 ?auto_2657306 ) ( SURFACE-AT ?auto_2657304 ?auto_2657306 ) ( CLEAR ?auto_2657304 ) ( IS-CRATE ?auto_2657305 ) ( not ( = ?auto_2657304 ?auto_2657305 ) ) ( TRUCK-AT ?auto_2657308 ?auto_2657306 ) ( AVAILABLE ?auto_2657307 ) ( IN ?auto_2657305 ?auto_2657308 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2657307 ?auto_2657305 ?auto_2657308 ?auto_2657306 )
      ( MAKE-1CRATE ?auto_2657304 ?auto_2657305 )
      ( MAKE-1CRATE-VERIFY ?auto_2657304 ?auto_2657305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657309 - SURFACE
      ?auto_2657310 - SURFACE
    )
    :vars
    (
      ?auto_2657313 - HOIST
      ?auto_2657312 - PLACE
      ?auto_2657311 - TRUCK
      ?auto_2657314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657313 ?auto_2657312 ) ( SURFACE-AT ?auto_2657309 ?auto_2657312 ) ( CLEAR ?auto_2657309 ) ( IS-CRATE ?auto_2657310 ) ( not ( = ?auto_2657309 ?auto_2657310 ) ) ( AVAILABLE ?auto_2657313 ) ( IN ?auto_2657310 ?auto_2657311 ) ( TRUCK-AT ?auto_2657311 ?auto_2657314 ) ( not ( = ?auto_2657314 ?auto_2657312 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2657311 ?auto_2657314 ?auto_2657312 )
      ( MAKE-1CRATE ?auto_2657309 ?auto_2657310 )
      ( MAKE-1CRATE-VERIFY ?auto_2657309 ?auto_2657310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657315 - SURFACE
      ?auto_2657316 - SURFACE
    )
    :vars
    (
      ?auto_2657319 - HOIST
      ?auto_2657317 - PLACE
      ?auto_2657318 - TRUCK
      ?auto_2657320 - PLACE
      ?auto_2657321 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657319 ?auto_2657317 ) ( SURFACE-AT ?auto_2657315 ?auto_2657317 ) ( CLEAR ?auto_2657315 ) ( IS-CRATE ?auto_2657316 ) ( not ( = ?auto_2657315 ?auto_2657316 ) ) ( AVAILABLE ?auto_2657319 ) ( TRUCK-AT ?auto_2657318 ?auto_2657320 ) ( not ( = ?auto_2657320 ?auto_2657317 ) ) ( HOIST-AT ?auto_2657321 ?auto_2657320 ) ( LIFTING ?auto_2657321 ?auto_2657316 ) ( not ( = ?auto_2657319 ?auto_2657321 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2657321 ?auto_2657316 ?auto_2657318 ?auto_2657320 )
      ( MAKE-1CRATE ?auto_2657315 ?auto_2657316 )
      ( MAKE-1CRATE-VERIFY ?auto_2657315 ?auto_2657316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657322 - SURFACE
      ?auto_2657323 - SURFACE
    )
    :vars
    (
      ?auto_2657328 - HOIST
      ?auto_2657327 - PLACE
      ?auto_2657326 - TRUCK
      ?auto_2657324 - PLACE
      ?auto_2657325 - HOIST
      ?auto_2657329 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657328 ?auto_2657327 ) ( SURFACE-AT ?auto_2657322 ?auto_2657327 ) ( CLEAR ?auto_2657322 ) ( IS-CRATE ?auto_2657323 ) ( not ( = ?auto_2657322 ?auto_2657323 ) ) ( AVAILABLE ?auto_2657328 ) ( TRUCK-AT ?auto_2657326 ?auto_2657324 ) ( not ( = ?auto_2657324 ?auto_2657327 ) ) ( HOIST-AT ?auto_2657325 ?auto_2657324 ) ( not ( = ?auto_2657328 ?auto_2657325 ) ) ( AVAILABLE ?auto_2657325 ) ( SURFACE-AT ?auto_2657323 ?auto_2657324 ) ( ON ?auto_2657323 ?auto_2657329 ) ( CLEAR ?auto_2657323 ) ( not ( = ?auto_2657322 ?auto_2657329 ) ) ( not ( = ?auto_2657323 ?auto_2657329 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2657325 ?auto_2657323 ?auto_2657329 ?auto_2657324 )
      ( MAKE-1CRATE ?auto_2657322 ?auto_2657323 )
      ( MAKE-1CRATE-VERIFY ?auto_2657322 ?auto_2657323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657330 - SURFACE
      ?auto_2657331 - SURFACE
    )
    :vars
    (
      ?auto_2657332 - HOIST
      ?auto_2657336 - PLACE
      ?auto_2657334 - PLACE
      ?auto_2657337 - HOIST
      ?auto_2657335 - SURFACE
      ?auto_2657333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657332 ?auto_2657336 ) ( SURFACE-AT ?auto_2657330 ?auto_2657336 ) ( CLEAR ?auto_2657330 ) ( IS-CRATE ?auto_2657331 ) ( not ( = ?auto_2657330 ?auto_2657331 ) ) ( AVAILABLE ?auto_2657332 ) ( not ( = ?auto_2657334 ?auto_2657336 ) ) ( HOIST-AT ?auto_2657337 ?auto_2657334 ) ( not ( = ?auto_2657332 ?auto_2657337 ) ) ( AVAILABLE ?auto_2657337 ) ( SURFACE-AT ?auto_2657331 ?auto_2657334 ) ( ON ?auto_2657331 ?auto_2657335 ) ( CLEAR ?auto_2657331 ) ( not ( = ?auto_2657330 ?auto_2657335 ) ) ( not ( = ?auto_2657331 ?auto_2657335 ) ) ( TRUCK-AT ?auto_2657333 ?auto_2657336 ) )
    :subtasks
    ( ( !DRIVE ?auto_2657333 ?auto_2657336 ?auto_2657334 )
      ( MAKE-1CRATE ?auto_2657330 ?auto_2657331 )
      ( MAKE-1CRATE-VERIFY ?auto_2657330 ?auto_2657331 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657347 - SURFACE
      ?auto_2657348 - SURFACE
      ?auto_2657349 - SURFACE
    )
    :vars
    (
      ?auto_2657351 - HOIST
      ?auto_2657350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657351 ?auto_2657350 ) ( SURFACE-AT ?auto_2657348 ?auto_2657350 ) ( CLEAR ?auto_2657348 ) ( LIFTING ?auto_2657351 ?auto_2657349 ) ( IS-CRATE ?auto_2657349 ) ( not ( = ?auto_2657348 ?auto_2657349 ) ) ( ON ?auto_2657348 ?auto_2657347 ) ( not ( = ?auto_2657347 ?auto_2657348 ) ) ( not ( = ?auto_2657347 ?auto_2657349 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657348 ?auto_2657349 )
      ( MAKE-2CRATE-VERIFY ?auto_2657347 ?auto_2657348 ?auto_2657349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657357 - SURFACE
      ?auto_2657358 - SURFACE
      ?auto_2657359 - SURFACE
    )
    :vars
    (
      ?auto_2657362 - HOIST
      ?auto_2657360 - PLACE
      ?auto_2657361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657362 ?auto_2657360 ) ( SURFACE-AT ?auto_2657358 ?auto_2657360 ) ( CLEAR ?auto_2657358 ) ( IS-CRATE ?auto_2657359 ) ( not ( = ?auto_2657358 ?auto_2657359 ) ) ( TRUCK-AT ?auto_2657361 ?auto_2657360 ) ( AVAILABLE ?auto_2657362 ) ( IN ?auto_2657359 ?auto_2657361 ) ( ON ?auto_2657358 ?auto_2657357 ) ( not ( = ?auto_2657357 ?auto_2657358 ) ) ( not ( = ?auto_2657357 ?auto_2657359 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657358 ?auto_2657359 )
      ( MAKE-2CRATE-VERIFY ?auto_2657357 ?auto_2657358 ?auto_2657359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657363 - SURFACE
      ?auto_2657364 - SURFACE
    )
    :vars
    (
      ?auto_2657365 - HOIST
      ?auto_2657368 - PLACE
      ?auto_2657367 - TRUCK
      ?auto_2657366 - SURFACE
      ?auto_2657369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657365 ?auto_2657368 ) ( SURFACE-AT ?auto_2657363 ?auto_2657368 ) ( CLEAR ?auto_2657363 ) ( IS-CRATE ?auto_2657364 ) ( not ( = ?auto_2657363 ?auto_2657364 ) ) ( AVAILABLE ?auto_2657365 ) ( IN ?auto_2657364 ?auto_2657367 ) ( ON ?auto_2657363 ?auto_2657366 ) ( not ( = ?auto_2657366 ?auto_2657363 ) ) ( not ( = ?auto_2657366 ?auto_2657364 ) ) ( TRUCK-AT ?auto_2657367 ?auto_2657369 ) ( not ( = ?auto_2657369 ?auto_2657368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2657367 ?auto_2657369 ?auto_2657368 )
      ( MAKE-2CRATE ?auto_2657366 ?auto_2657363 ?auto_2657364 )
      ( MAKE-1CRATE-VERIFY ?auto_2657363 ?auto_2657364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657370 - SURFACE
      ?auto_2657371 - SURFACE
      ?auto_2657372 - SURFACE
    )
    :vars
    (
      ?auto_2657376 - HOIST
      ?auto_2657375 - PLACE
      ?auto_2657374 - TRUCK
      ?auto_2657373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657376 ?auto_2657375 ) ( SURFACE-AT ?auto_2657371 ?auto_2657375 ) ( CLEAR ?auto_2657371 ) ( IS-CRATE ?auto_2657372 ) ( not ( = ?auto_2657371 ?auto_2657372 ) ) ( AVAILABLE ?auto_2657376 ) ( IN ?auto_2657372 ?auto_2657374 ) ( ON ?auto_2657371 ?auto_2657370 ) ( not ( = ?auto_2657370 ?auto_2657371 ) ) ( not ( = ?auto_2657370 ?auto_2657372 ) ) ( TRUCK-AT ?auto_2657374 ?auto_2657373 ) ( not ( = ?auto_2657373 ?auto_2657375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657371 ?auto_2657372 )
      ( MAKE-2CRATE-VERIFY ?auto_2657370 ?auto_2657371 ?auto_2657372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657377 - SURFACE
      ?auto_2657378 - SURFACE
    )
    :vars
    (
      ?auto_2657381 - HOIST
      ?auto_2657383 - PLACE
      ?auto_2657380 - SURFACE
      ?auto_2657379 - TRUCK
      ?auto_2657382 - PLACE
      ?auto_2657384 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657381 ?auto_2657383 ) ( SURFACE-AT ?auto_2657377 ?auto_2657383 ) ( CLEAR ?auto_2657377 ) ( IS-CRATE ?auto_2657378 ) ( not ( = ?auto_2657377 ?auto_2657378 ) ) ( AVAILABLE ?auto_2657381 ) ( ON ?auto_2657377 ?auto_2657380 ) ( not ( = ?auto_2657380 ?auto_2657377 ) ) ( not ( = ?auto_2657380 ?auto_2657378 ) ) ( TRUCK-AT ?auto_2657379 ?auto_2657382 ) ( not ( = ?auto_2657382 ?auto_2657383 ) ) ( HOIST-AT ?auto_2657384 ?auto_2657382 ) ( LIFTING ?auto_2657384 ?auto_2657378 ) ( not ( = ?auto_2657381 ?auto_2657384 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2657384 ?auto_2657378 ?auto_2657379 ?auto_2657382 )
      ( MAKE-2CRATE ?auto_2657380 ?auto_2657377 ?auto_2657378 )
      ( MAKE-1CRATE-VERIFY ?auto_2657377 ?auto_2657378 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657385 - SURFACE
      ?auto_2657386 - SURFACE
      ?auto_2657387 - SURFACE
    )
    :vars
    (
      ?auto_2657388 - HOIST
      ?auto_2657391 - PLACE
      ?auto_2657390 - TRUCK
      ?auto_2657392 - PLACE
      ?auto_2657389 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657388 ?auto_2657391 ) ( SURFACE-AT ?auto_2657386 ?auto_2657391 ) ( CLEAR ?auto_2657386 ) ( IS-CRATE ?auto_2657387 ) ( not ( = ?auto_2657386 ?auto_2657387 ) ) ( AVAILABLE ?auto_2657388 ) ( ON ?auto_2657386 ?auto_2657385 ) ( not ( = ?auto_2657385 ?auto_2657386 ) ) ( not ( = ?auto_2657385 ?auto_2657387 ) ) ( TRUCK-AT ?auto_2657390 ?auto_2657392 ) ( not ( = ?auto_2657392 ?auto_2657391 ) ) ( HOIST-AT ?auto_2657389 ?auto_2657392 ) ( LIFTING ?auto_2657389 ?auto_2657387 ) ( not ( = ?auto_2657388 ?auto_2657389 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657386 ?auto_2657387 )
      ( MAKE-2CRATE-VERIFY ?auto_2657385 ?auto_2657386 ?auto_2657387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657393 - SURFACE
      ?auto_2657394 - SURFACE
    )
    :vars
    (
      ?auto_2657395 - HOIST
      ?auto_2657400 - PLACE
      ?auto_2657399 - SURFACE
      ?auto_2657398 - TRUCK
      ?auto_2657397 - PLACE
      ?auto_2657396 - HOIST
      ?auto_2657401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657395 ?auto_2657400 ) ( SURFACE-AT ?auto_2657393 ?auto_2657400 ) ( CLEAR ?auto_2657393 ) ( IS-CRATE ?auto_2657394 ) ( not ( = ?auto_2657393 ?auto_2657394 ) ) ( AVAILABLE ?auto_2657395 ) ( ON ?auto_2657393 ?auto_2657399 ) ( not ( = ?auto_2657399 ?auto_2657393 ) ) ( not ( = ?auto_2657399 ?auto_2657394 ) ) ( TRUCK-AT ?auto_2657398 ?auto_2657397 ) ( not ( = ?auto_2657397 ?auto_2657400 ) ) ( HOIST-AT ?auto_2657396 ?auto_2657397 ) ( not ( = ?auto_2657395 ?auto_2657396 ) ) ( AVAILABLE ?auto_2657396 ) ( SURFACE-AT ?auto_2657394 ?auto_2657397 ) ( ON ?auto_2657394 ?auto_2657401 ) ( CLEAR ?auto_2657394 ) ( not ( = ?auto_2657393 ?auto_2657401 ) ) ( not ( = ?auto_2657394 ?auto_2657401 ) ) ( not ( = ?auto_2657399 ?auto_2657401 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2657396 ?auto_2657394 ?auto_2657401 ?auto_2657397 )
      ( MAKE-2CRATE ?auto_2657399 ?auto_2657393 ?auto_2657394 )
      ( MAKE-1CRATE-VERIFY ?auto_2657393 ?auto_2657394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657402 - SURFACE
      ?auto_2657403 - SURFACE
      ?auto_2657404 - SURFACE
    )
    :vars
    (
      ?auto_2657406 - HOIST
      ?auto_2657407 - PLACE
      ?auto_2657408 - TRUCK
      ?auto_2657410 - PLACE
      ?auto_2657405 - HOIST
      ?auto_2657409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657406 ?auto_2657407 ) ( SURFACE-AT ?auto_2657403 ?auto_2657407 ) ( CLEAR ?auto_2657403 ) ( IS-CRATE ?auto_2657404 ) ( not ( = ?auto_2657403 ?auto_2657404 ) ) ( AVAILABLE ?auto_2657406 ) ( ON ?auto_2657403 ?auto_2657402 ) ( not ( = ?auto_2657402 ?auto_2657403 ) ) ( not ( = ?auto_2657402 ?auto_2657404 ) ) ( TRUCK-AT ?auto_2657408 ?auto_2657410 ) ( not ( = ?auto_2657410 ?auto_2657407 ) ) ( HOIST-AT ?auto_2657405 ?auto_2657410 ) ( not ( = ?auto_2657406 ?auto_2657405 ) ) ( AVAILABLE ?auto_2657405 ) ( SURFACE-AT ?auto_2657404 ?auto_2657410 ) ( ON ?auto_2657404 ?auto_2657409 ) ( CLEAR ?auto_2657404 ) ( not ( = ?auto_2657403 ?auto_2657409 ) ) ( not ( = ?auto_2657404 ?auto_2657409 ) ) ( not ( = ?auto_2657402 ?auto_2657409 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657403 ?auto_2657404 )
      ( MAKE-2CRATE-VERIFY ?auto_2657402 ?auto_2657403 ?auto_2657404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657411 - SURFACE
      ?auto_2657412 - SURFACE
    )
    :vars
    (
      ?auto_2657414 - HOIST
      ?auto_2657413 - PLACE
      ?auto_2657419 - SURFACE
      ?auto_2657416 - PLACE
      ?auto_2657415 - HOIST
      ?auto_2657418 - SURFACE
      ?auto_2657417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657414 ?auto_2657413 ) ( SURFACE-AT ?auto_2657411 ?auto_2657413 ) ( CLEAR ?auto_2657411 ) ( IS-CRATE ?auto_2657412 ) ( not ( = ?auto_2657411 ?auto_2657412 ) ) ( AVAILABLE ?auto_2657414 ) ( ON ?auto_2657411 ?auto_2657419 ) ( not ( = ?auto_2657419 ?auto_2657411 ) ) ( not ( = ?auto_2657419 ?auto_2657412 ) ) ( not ( = ?auto_2657416 ?auto_2657413 ) ) ( HOIST-AT ?auto_2657415 ?auto_2657416 ) ( not ( = ?auto_2657414 ?auto_2657415 ) ) ( AVAILABLE ?auto_2657415 ) ( SURFACE-AT ?auto_2657412 ?auto_2657416 ) ( ON ?auto_2657412 ?auto_2657418 ) ( CLEAR ?auto_2657412 ) ( not ( = ?auto_2657411 ?auto_2657418 ) ) ( not ( = ?auto_2657412 ?auto_2657418 ) ) ( not ( = ?auto_2657419 ?auto_2657418 ) ) ( TRUCK-AT ?auto_2657417 ?auto_2657413 ) )
    :subtasks
    ( ( !DRIVE ?auto_2657417 ?auto_2657413 ?auto_2657416 )
      ( MAKE-2CRATE ?auto_2657419 ?auto_2657411 ?auto_2657412 )
      ( MAKE-1CRATE-VERIFY ?auto_2657411 ?auto_2657412 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657420 - SURFACE
      ?auto_2657421 - SURFACE
      ?auto_2657422 - SURFACE
    )
    :vars
    (
      ?auto_2657423 - HOIST
      ?auto_2657424 - PLACE
      ?auto_2657425 - PLACE
      ?auto_2657426 - HOIST
      ?auto_2657428 - SURFACE
      ?auto_2657427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657423 ?auto_2657424 ) ( SURFACE-AT ?auto_2657421 ?auto_2657424 ) ( CLEAR ?auto_2657421 ) ( IS-CRATE ?auto_2657422 ) ( not ( = ?auto_2657421 ?auto_2657422 ) ) ( AVAILABLE ?auto_2657423 ) ( ON ?auto_2657421 ?auto_2657420 ) ( not ( = ?auto_2657420 ?auto_2657421 ) ) ( not ( = ?auto_2657420 ?auto_2657422 ) ) ( not ( = ?auto_2657425 ?auto_2657424 ) ) ( HOIST-AT ?auto_2657426 ?auto_2657425 ) ( not ( = ?auto_2657423 ?auto_2657426 ) ) ( AVAILABLE ?auto_2657426 ) ( SURFACE-AT ?auto_2657422 ?auto_2657425 ) ( ON ?auto_2657422 ?auto_2657428 ) ( CLEAR ?auto_2657422 ) ( not ( = ?auto_2657421 ?auto_2657428 ) ) ( not ( = ?auto_2657422 ?auto_2657428 ) ) ( not ( = ?auto_2657420 ?auto_2657428 ) ) ( TRUCK-AT ?auto_2657427 ?auto_2657424 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657421 ?auto_2657422 )
      ( MAKE-2CRATE-VERIFY ?auto_2657420 ?auto_2657421 ?auto_2657422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657429 - SURFACE
      ?auto_2657430 - SURFACE
    )
    :vars
    (
      ?auto_2657434 - HOIST
      ?auto_2657432 - PLACE
      ?auto_2657436 - SURFACE
      ?auto_2657431 - PLACE
      ?auto_2657433 - HOIST
      ?auto_2657435 - SURFACE
      ?auto_2657437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657434 ?auto_2657432 ) ( IS-CRATE ?auto_2657430 ) ( not ( = ?auto_2657429 ?auto_2657430 ) ) ( not ( = ?auto_2657436 ?auto_2657429 ) ) ( not ( = ?auto_2657436 ?auto_2657430 ) ) ( not ( = ?auto_2657431 ?auto_2657432 ) ) ( HOIST-AT ?auto_2657433 ?auto_2657431 ) ( not ( = ?auto_2657434 ?auto_2657433 ) ) ( AVAILABLE ?auto_2657433 ) ( SURFACE-AT ?auto_2657430 ?auto_2657431 ) ( ON ?auto_2657430 ?auto_2657435 ) ( CLEAR ?auto_2657430 ) ( not ( = ?auto_2657429 ?auto_2657435 ) ) ( not ( = ?auto_2657430 ?auto_2657435 ) ) ( not ( = ?auto_2657436 ?auto_2657435 ) ) ( TRUCK-AT ?auto_2657437 ?auto_2657432 ) ( SURFACE-AT ?auto_2657436 ?auto_2657432 ) ( CLEAR ?auto_2657436 ) ( LIFTING ?auto_2657434 ?auto_2657429 ) ( IS-CRATE ?auto_2657429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657436 ?auto_2657429 )
      ( MAKE-2CRATE ?auto_2657436 ?auto_2657429 ?auto_2657430 )
      ( MAKE-1CRATE-VERIFY ?auto_2657429 ?auto_2657430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657438 - SURFACE
      ?auto_2657439 - SURFACE
      ?auto_2657440 - SURFACE
    )
    :vars
    (
      ?auto_2657444 - HOIST
      ?auto_2657441 - PLACE
      ?auto_2657442 - PLACE
      ?auto_2657443 - HOIST
      ?auto_2657446 - SURFACE
      ?auto_2657445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657444 ?auto_2657441 ) ( IS-CRATE ?auto_2657440 ) ( not ( = ?auto_2657439 ?auto_2657440 ) ) ( not ( = ?auto_2657438 ?auto_2657439 ) ) ( not ( = ?auto_2657438 ?auto_2657440 ) ) ( not ( = ?auto_2657442 ?auto_2657441 ) ) ( HOIST-AT ?auto_2657443 ?auto_2657442 ) ( not ( = ?auto_2657444 ?auto_2657443 ) ) ( AVAILABLE ?auto_2657443 ) ( SURFACE-AT ?auto_2657440 ?auto_2657442 ) ( ON ?auto_2657440 ?auto_2657446 ) ( CLEAR ?auto_2657440 ) ( not ( = ?auto_2657439 ?auto_2657446 ) ) ( not ( = ?auto_2657440 ?auto_2657446 ) ) ( not ( = ?auto_2657438 ?auto_2657446 ) ) ( TRUCK-AT ?auto_2657445 ?auto_2657441 ) ( SURFACE-AT ?auto_2657438 ?auto_2657441 ) ( CLEAR ?auto_2657438 ) ( LIFTING ?auto_2657444 ?auto_2657439 ) ( IS-CRATE ?auto_2657439 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657439 ?auto_2657440 )
      ( MAKE-2CRATE-VERIFY ?auto_2657438 ?auto_2657439 ?auto_2657440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657447 - SURFACE
      ?auto_2657448 - SURFACE
    )
    :vars
    (
      ?auto_2657451 - HOIST
      ?auto_2657455 - PLACE
      ?auto_2657453 - SURFACE
      ?auto_2657450 - PLACE
      ?auto_2657454 - HOIST
      ?auto_2657452 - SURFACE
      ?auto_2657449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657451 ?auto_2657455 ) ( IS-CRATE ?auto_2657448 ) ( not ( = ?auto_2657447 ?auto_2657448 ) ) ( not ( = ?auto_2657453 ?auto_2657447 ) ) ( not ( = ?auto_2657453 ?auto_2657448 ) ) ( not ( = ?auto_2657450 ?auto_2657455 ) ) ( HOIST-AT ?auto_2657454 ?auto_2657450 ) ( not ( = ?auto_2657451 ?auto_2657454 ) ) ( AVAILABLE ?auto_2657454 ) ( SURFACE-AT ?auto_2657448 ?auto_2657450 ) ( ON ?auto_2657448 ?auto_2657452 ) ( CLEAR ?auto_2657448 ) ( not ( = ?auto_2657447 ?auto_2657452 ) ) ( not ( = ?auto_2657448 ?auto_2657452 ) ) ( not ( = ?auto_2657453 ?auto_2657452 ) ) ( TRUCK-AT ?auto_2657449 ?auto_2657455 ) ( SURFACE-AT ?auto_2657453 ?auto_2657455 ) ( CLEAR ?auto_2657453 ) ( IS-CRATE ?auto_2657447 ) ( AVAILABLE ?auto_2657451 ) ( IN ?auto_2657447 ?auto_2657449 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2657451 ?auto_2657447 ?auto_2657449 ?auto_2657455 )
      ( MAKE-2CRATE ?auto_2657453 ?auto_2657447 ?auto_2657448 )
      ( MAKE-1CRATE-VERIFY ?auto_2657447 ?auto_2657448 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657456 - SURFACE
      ?auto_2657457 - SURFACE
      ?auto_2657458 - SURFACE
    )
    :vars
    (
      ?auto_2657461 - HOIST
      ?auto_2657462 - PLACE
      ?auto_2657459 - PLACE
      ?auto_2657464 - HOIST
      ?auto_2657463 - SURFACE
      ?auto_2657460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657461 ?auto_2657462 ) ( IS-CRATE ?auto_2657458 ) ( not ( = ?auto_2657457 ?auto_2657458 ) ) ( not ( = ?auto_2657456 ?auto_2657457 ) ) ( not ( = ?auto_2657456 ?auto_2657458 ) ) ( not ( = ?auto_2657459 ?auto_2657462 ) ) ( HOIST-AT ?auto_2657464 ?auto_2657459 ) ( not ( = ?auto_2657461 ?auto_2657464 ) ) ( AVAILABLE ?auto_2657464 ) ( SURFACE-AT ?auto_2657458 ?auto_2657459 ) ( ON ?auto_2657458 ?auto_2657463 ) ( CLEAR ?auto_2657458 ) ( not ( = ?auto_2657457 ?auto_2657463 ) ) ( not ( = ?auto_2657458 ?auto_2657463 ) ) ( not ( = ?auto_2657456 ?auto_2657463 ) ) ( TRUCK-AT ?auto_2657460 ?auto_2657462 ) ( SURFACE-AT ?auto_2657456 ?auto_2657462 ) ( CLEAR ?auto_2657456 ) ( IS-CRATE ?auto_2657457 ) ( AVAILABLE ?auto_2657461 ) ( IN ?auto_2657457 ?auto_2657460 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657457 ?auto_2657458 )
      ( MAKE-2CRATE-VERIFY ?auto_2657456 ?auto_2657457 ?auto_2657458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657501 - SURFACE
      ?auto_2657502 - SURFACE
    )
    :vars
    (
      ?auto_2657504 - HOIST
      ?auto_2657506 - PLACE
      ?auto_2657507 - SURFACE
      ?auto_2657505 - PLACE
      ?auto_2657503 - HOIST
      ?auto_2657509 - SURFACE
      ?auto_2657508 - TRUCK
      ?auto_2657510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657504 ?auto_2657506 ) ( SURFACE-AT ?auto_2657501 ?auto_2657506 ) ( CLEAR ?auto_2657501 ) ( IS-CRATE ?auto_2657502 ) ( not ( = ?auto_2657501 ?auto_2657502 ) ) ( AVAILABLE ?auto_2657504 ) ( ON ?auto_2657501 ?auto_2657507 ) ( not ( = ?auto_2657507 ?auto_2657501 ) ) ( not ( = ?auto_2657507 ?auto_2657502 ) ) ( not ( = ?auto_2657505 ?auto_2657506 ) ) ( HOIST-AT ?auto_2657503 ?auto_2657505 ) ( not ( = ?auto_2657504 ?auto_2657503 ) ) ( AVAILABLE ?auto_2657503 ) ( SURFACE-AT ?auto_2657502 ?auto_2657505 ) ( ON ?auto_2657502 ?auto_2657509 ) ( CLEAR ?auto_2657502 ) ( not ( = ?auto_2657501 ?auto_2657509 ) ) ( not ( = ?auto_2657502 ?auto_2657509 ) ) ( not ( = ?auto_2657507 ?auto_2657509 ) ) ( TRUCK-AT ?auto_2657508 ?auto_2657510 ) ( not ( = ?auto_2657510 ?auto_2657506 ) ) ( not ( = ?auto_2657505 ?auto_2657510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2657508 ?auto_2657510 ?auto_2657506 )
      ( MAKE-1CRATE ?auto_2657501 ?auto_2657502 )
      ( MAKE-1CRATE-VERIFY ?auto_2657501 ?auto_2657502 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657541 - SURFACE
      ?auto_2657542 - SURFACE
      ?auto_2657543 - SURFACE
      ?auto_2657540 - SURFACE
    )
    :vars
    (
      ?auto_2657544 - HOIST
      ?auto_2657545 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657544 ?auto_2657545 ) ( SURFACE-AT ?auto_2657543 ?auto_2657545 ) ( CLEAR ?auto_2657543 ) ( LIFTING ?auto_2657544 ?auto_2657540 ) ( IS-CRATE ?auto_2657540 ) ( not ( = ?auto_2657543 ?auto_2657540 ) ) ( ON ?auto_2657542 ?auto_2657541 ) ( ON ?auto_2657543 ?auto_2657542 ) ( not ( = ?auto_2657541 ?auto_2657542 ) ) ( not ( = ?auto_2657541 ?auto_2657543 ) ) ( not ( = ?auto_2657541 ?auto_2657540 ) ) ( not ( = ?auto_2657542 ?auto_2657543 ) ) ( not ( = ?auto_2657542 ?auto_2657540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657543 ?auto_2657540 )
      ( MAKE-3CRATE-VERIFY ?auto_2657541 ?auto_2657542 ?auto_2657543 ?auto_2657540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657558 - SURFACE
      ?auto_2657559 - SURFACE
      ?auto_2657560 - SURFACE
      ?auto_2657557 - SURFACE
    )
    :vars
    (
      ?auto_2657562 - HOIST
      ?auto_2657563 - PLACE
      ?auto_2657561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657562 ?auto_2657563 ) ( SURFACE-AT ?auto_2657560 ?auto_2657563 ) ( CLEAR ?auto_2657560 ) ( IS-CRATE ?auto_2657557 ) ( not ( = ?auto_2657560 ?auto_2657557 ) ) ( TRUCK-AT ?auto_2657561 ?auto_2657563 ) ( AVAILABLE ?auto_2657562 ) ( IN ?auto_2657557 ?auto_2657561 ) ( ON ?auto_2657560 ?auto_2657559 ) ( not ( = ?auto_2657559 ?auto_2657560 ) ) ( not ( = ?auto_2657559 ?auto_2657557 ) ) ( ON ?auto_2657559 ?auto_2657558 ) ( not ( = ?auto_2657558 ?auto_2657559 ) ) ( not ( = ?auto_2657558 ?auto_2657560 ) ) ( not ( = ?auto_2657558 ?auto_2657557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657559 ?auto_2657560 ?auto_2657557 )
      ( MAKE-3CRATE-VERIFY ?auto_2657558 ?auto_2657559 ?auto_2657560 ?auto_2657557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657579 - SURFACE
      ?auto_2657580 - SURFACE
      ?auto_2657581 - SURFACE
      ?auto_2657578 - SURFACE
    )
    :vars
    (
      ?auto_2657582 - HOIST
      ?auto_2657585 - PLACE
      ?auto_2657583 - TRUCK
      ?auto_2657584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657582 ?auto_2657585 ) ( SURFACE-AT ?auto_2657581 ?auto_2657585 ) ( CLEAR ?auto_2657581 ) ( IS-CRATE ?auto_2657578 ) ( not ( = ?auto_2657581 ?auto_2657578 ) ) ( AVAILABLE ?auto_2657582 ) ( IN ?auto_2657578 ?auto_2657583 ) ( ON ?auto_2657581 ?auto_2657580 ) ( not ( = ?auto_2657580 ?auto_2657581 ) ) ( not ( = ?auto_2657580 ?auto_2657578 ) ) ( TRUCK-AT ?auto_2657583 ?auto_2657584 ) ( not ( = ?auto_2657584 ?auto_2657585 ) ) ( ON ?auto_2657580 ?auto_2657579 ) ( not ( = ?auto_2657579 ?auto_2657580 ) ) ( not ( = ?auto_2657579 ?auto_2657581 ) ) ( not ( = ?auto_2657579 ?auto_2657578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657580 ?auto_2657581 ?auto_2657578 )
      ( MAKE-3CRATE-VERIFY ?auto_2657579 ?auto_2657580 ?auto_2657581 ?auto_2657578 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657603 - SURFACE
      ?auto_2657604 - SURFACE
      ?auto_2657605 - SURFACE
      ?auto_2657602 - SURFACE
    )
    :vars
    (
      ?auto_2657608 - HOIST
      ?auto_2657606 - PLACE
      ?auto_2657609 - TRUCK
      ?auto_2657610 - PLACE
      ?auto_2657607 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657608 ?auto_2657606 ) ( SURFACE-AT ?auto_2657605 ?auto_2657606 ) ( CLEAR ?auto_2657605 ) ( IS-CRATE ?auto_2657602 ) ( not ( = ?auto_2657605 ?auto_2657602 ) ) ( AVAILABLE ?auto_2657608 ) ( ON ?auto_2657605 ?auto_2657604 ) ( not ( = ?auto_2657604 ?auto_2657605 ) ) ( not ( = ?auto_2657604 ?auto_2657602 ) ) ( TRUCK-AT ?auto_2657609 ?auto_2657610 ) ( not ( = ?auto_2657610 ?auto_2657606 ) ) ( HOIST-AT ?auto_2657607 ?auto_2657610 ) ( LIFTING ?auto_2657607 ?auto_2657602 ) ( not ( = ?auto_2657608 ?auto_2657607 ) ) ( ON ?auto_2657604 ?auto_2657603 ) ( not ( = ?auto_2657603 ?auto_2657604 ) ) ( not ( = ?auto_2657603 ?auto_2657605 ) ) ( not ( = ?auto_2657603 ?auto_2657602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657604 ?auto_2657605 ?auto_2657602 )
      ( MAKE-3CRATE-VERIFY ?auto_2657603 ?auto_2657604 ?auto_2657605 ?auto_2657602 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657630 - SURFACE
      ?auto_2657631 - SURFACE
      ?auto_2657632 - SURFACE
      ?auto_2657629 - SURFACE
    )
    :vars
    (
      ?auto_2657636 - HOIST
      ?auto_2657638 - PLACE
      ?auto_2657635 - TRUCK
      ?auto_2657634 - PLACE
      ?auto_2657637 - HOIST
      ?auto_2657633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657636 ?auto_2657638 ) ( SURFACE-AT ?auto_2657632 ?auto_2657638 ) ( CLEAR ?auto_2657632 ) ( IS-CRATE ?auto_2657629 ) ( not ( = ?auto_2657632 ?auto_2657629 ) ) ( AVAILABLE ?auto_2657636 ) ( ON ?auto_2657632 ?auto_2657631 ) ( not ( = ?auto_2657631 ?auto_2657632 ) ) ( not ( = ?auto_2657631 ?auto_2657629 ) ) ( TRUCK-AT ?auto_2657635 ?auto_2657634 ) ( not ( = ?auto_2657634 ?auto_2657638 ) ) ( HOIST-AT ?auto_2657637 ?auto_2657634 ) ( not ( = ?auto_2657636 ?auto_2657637 ) ) ( AVAILABLE ?auto_2657637 ) ( SURFACE-AT ?auto_2657629 ?auto_2657634 ) ( ON ?auto_2657629 ?auto_2657633 ) ( CLEAR ?auto_2657629 ) ( not ( = ?auto_2657632 ?auto_2657633 ) ) ( not ( = ?auto_2657629 ?auto_2657633 ) ) ( not ( = ?auto_2657631 ?auto_2657633 ) ) ( ON ?auto_2657631 ?auto_2657630 ) ( not ( = ?auto_2657630 ?auto_2657631 ) ) ( not ( = ?auto_2657630 ?auto_2657632 ) ) ( not ( = ?auto_2657630 ?auto_2657629 ) ) ( not ( = ?auto_2657630 ?auto_2657633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657631 ?auto_2657632 ?auto_2657629 )
      ( MAKE-3CRATE-VERIFY ?auto_2657630 ?auto_2657631 ?auto_2657632 ?auto_2657629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657658 - SURFACE
      ?auto_2657659 - SURFACE
      ?auto_2657660 - SURFACE
      ?auto_2657657 - SURFACE
    )
    :vars
    (
      ?auto_2657664 - HOIST
      ?auto_2657662 - PLACE
      ?auto_2657666 - PLACE
      ?auto_2657665 - HOIST
      ?auto_2657663 - SURFACE
      ?auto_2657661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657664 ?auto_2657662 ) ( SURFACE-AT ?auto_2657660 ?auto_2657662 ) ( CLEAR ?auto_2657660 ) ( IS-CRATE ?auto_2657657 ) ( not ( = ?auto_2657660 ?auto_2657657 ) ) ( AVAILABLE ?auto_2657664 ) ( ON ?auto_2657660 ?auto_2657659 ) ( not ( = ?auto_2657659 ?auto_2657660 ) ) ( not ( = ?auto_2657659 ?auto_2657657 ) ) ( not ( = ?auto_2657666 ?auto_2657662 ) ) ( HOIST-AT ?auto_2657665 ?auto_2657666 ) ( not ( = ?auto_2657664 ?auto_2657665 ) ) ( AVAILABLE ?auto_2657665 ) ( SURFACE-AT ?auto_2657657 ?auto_2657666 ) ( ON ?auto_2657657 ?auto_2657663 ) ( CLEAR ?auto_2657657 ) ( not ( = ?auto_2657660 ?auto_2657663 ) ) ( not ( = ?auto_2657657 ?auto_2657663 ) ) ( not ( = ?auto_2657659 ?auto_2657663 ) ) ( TRUCK-AT ?auto_2657661 ?auto_2657662 ) ( ON ?auto_2657659 ?auto_2657658 ) ( not ( = ?auto_2657658 ?auto_2657659 ) ) ( not ( = ?auto_2657658 ?auto_2657660 ) ) ( not ( = ?auto_2657658 ?auto_2657657 ) ) ( not ( = ?auto_2657658 ?auto_2657663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657659 ?auto_2657660 ?auto_2657657 )
      ( MAKE-3CRATE-VERIFY ?auto_2657658 ?auto_2657659 ?auto_2657660 ?auto_2657657 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657686 - SURFACE
      ?auto_2657687 - SURFACE
      ?auto_2657688 - SURFACE
      ?auto_2657685 - SURFACE
    )
    :vars
    (
      ?auto_2657689 - HOIST
      ?auto_2657691 - PLACE
      ?auto_2657692 - PLACE
      ?auto_2657690 - HOIST
      ?auto_2657693 - SURFACE
      ?auto_2657694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657689 ?auto_2657691 ) ( IS-CRATE ?auto_2657685 ) ( not ( = ?auto_2657688 ?auto_2657685 ) ) ( not ( = ?auto_2657687 ?auto_2657688 ) ) ( not ( = ?auto_2657687 ?auto_2657685 ) ) ( not ( = ?auto_2657692 ?auto_2657691 ) ) ( HOIST-AT ?auto_2657690 ?auto_2657692 ) ( not ( = ?auto_2657689 ?auto_2657690 ) ) ( AVAILABLE ?auto_2657690 ) ( SURFACE-AT ?auto_2657685 ?auto_2657692 ) ( ON ?auto_2657685 ?auto_2657693 ) ( CLEAR ?auto_2657685 ) ( not ( = ?auto_2657688 ?auto_2657693 ) ) ( not ( = ?auto_2657685 ?auto_2657693 ) ) ( not ( = ?auto_2657687 ?auto_2657693 ) ) ( TRUCK-AT ?auto_2657694 ?auto_2657691 ) ( SURFACE-AT ?auto_2657687 ?auto_2657691 ) ( CLEAR ?auto_2657687 ) ( LIFTING ?auto_2657689 ?auto_2657688 ) ( IS-CRATE ?auto_2657688 ) ( ON ?auto_2657687 ?auto_2657686 ) ( not ( = ?auto_2657686 ?auto_2657687 ) ) ( not ( = ?auto_2657686 ?auto_2657688 ) ) ( not ( = ?auto_2657686 ?auto_2657685 ) ) ( not ( = ?auto_2657686 ?auto_2657693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657687 ?auto_2657688 ?auto_2657685 )
      ( MAKE-3CRATE-VERIFY ?auto_2657686 ?auto_2657687 ?auto_2657688 ?auto_2657685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657714 - SURFACE
      ?auto_2657715 - SURFACE
      ?auto_2657716 - SURFACE
      ?auto_2657713 - SURFACE
    )
    :vars
    (
      ?auto_2657720 - HOIST
      ?auto_2657718 - PLACE
      ?auto_2657717 - PLACE
      ?auto_2657722 - HOIST
      ?auto_2657719 - SURFACE
      ?auto_2657721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657720 ?auto_2657718 ) ( IS-CRATE ?auto_2657713 ) ( not ( = ?auto_2657716 ?auto_2657713 ) ) ( not ( = ?auto_2657715 ?auto_2657716 ) ) ( not ( = ?auto_2657715 ?auto_2657713 ) ) ( not ( = ?auto_2657717 ?auto_2657718 ) ) ( HOIST-AT ?auto_2657722 ?auto_2657717 ) ( not ( = ?auto_2657720 ?auto_2657722 ) ) ( AVAILABLE ?auto_2657722 ) ( SURFACE-AT ?auto_2657713 ?auto_2657717 ) ( ON ?auto_2657713 ?auto_2657719 ) ( CLEAR ?auto_2657713 ) ( not ( = ?auto_2657716 ?auto_2657719 ) ) ( not ( = ?auto_2657713 ?auto_2657719 ) ) ( not ( = ?auto_2657715 ?auto_2657719 ) ) ( TRUCK-AT ?auto_2657721 ?auto_2657718 ) ( SURFACE-AT ?auto_2657715 ?auto_2657718 ) ( CLEAR ?auto_2657715 ) ( IS-CRATE ?auto_2657716 ) ( AVAILABLE ?auto_2657720 ) ( IN ?auto_2657716 ?auto_2657721 ) ( ON ?auto_2657715 ?auto_2657714 ) ( not ( = ?auto_2657714 ?auto_2657715 ) ) ( not ( = ?auto_2657714 ?auto_2657716 ) ) ( not ( = ?auto_2657714 ?auto_2657713 ) ) ( not ( = ?auto_2657714 ?auto_2657719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657715 ?auto_2657716 ?auto_2657713 )
      ( MAKE-3CRATE-VERIFY ?auto_2657714 ?auto_2657715 ?auto_2657716 ?auto_2657713 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658005 - SURFACE
      ?auto_2658006 - SURFACE
      ?auto_2658007 - SURFACE
      ?auto_2658004 - SURFACE
      ?auto_2658008 - SURFACE
    )
    :vars
    (
      ?auto_2658010 - HOIST
      ?auto_2658009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658010 ?auto_2658009 ) ( SURFACE-AT ?auto_2658004 ?auto_2658009 ) ( CLEAR ?auto_2658004 ) ( LIFTING ?auto_2658010 ?auto_2658008 ) ( IS-CRATE ?auto_2658008 ) ( not ( = ?auto_2658004 ?auto_2658008 ) ) ( ON ?auto_2658006 ?auto_2658005 ) ( ON ?auto_2658007 ?auto_2658006 ) ( ON ?auto_2658004 ?auto_2658007 ) ( not ( = ?auto_2658005 ?auto_2658006 ) ) ( not ( = ?auto_2658005 ?auto_2658007 ) ) ( not ( = ?auto_2658005 ?auto_2658004 ) ) ( not ( = ?auto_2658005 ?auto_2658008 ) ) ( not ( = ?auto_2658006 ?auto_2658007 ) ) ( not ( = ?auto_2658006 ?auto_2658004 ) ) ( not ( = ?auto_2658006 ?auto_2658008 ) ) ( not ( = ?auto_2658007 ?auto_2658004 ) ) ( not ( = ?auto_2658007 ?auto_2658008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658004 ?auto_2658008 )
      ( MAKE-4CRATE-VERIFY ?auto_2658005 ?auto_2658006 ?auto_2658007 ?auto_2658004 ?auto_2658008 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658030 - SURFACE
      ?auto_2658031 - SURFACE
      ?auto_2658032 - SURFACE
      ?auto_2658029 - SURFACE
      ?auto_2658033 - SURFACE
    )
    :vars
    (
      ?auto_2658036 - HOIST
      ?auto_2658035 - PLACE
      ?auto_2658034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658036 ?auto_2658035 ) ( SURFACE-AT ?auto_2658029 ?auto_2658035 ) ( CLEAR ?auto_2658029 ) ( IS-CRATE ?auto_2658033 ) ( not ( = ?auto_2658029 ?auto_2658033 ) ) ( TRUCK-AT ?auto_2658034 ?auto_2658035 ) ( AVAILABLE ?auto_2658036 ) ( IN ?auto_2658033 ?auto_2658034 ) ( ON ?auto_2658029 ?auto_2658032 ) ( not ( = ?auto_2658032 ?auto_2658029 ) ) ( not ( = ?auto_2658032 ?auto_2658033 ) ) ( ON ?auto_2658031 ?auto_2658030 ) ( ON ?auto_2658032 ?auto_2658031 ) ( not ( = ?auto_2658030 ?auto_2658031 ) ) ( not ( = ?auto_2658030 ?auto_2658032 ) ) ( not ( = ?auto_2658030 ?auto_2658029 ) ) ( not ( = ?auto_2658030 ?auto_2658033 ) ) ( not ( = ?auto_2658031 ?auto_2658032 ) ) ( not ( = ?auto_2658031 ?auto_2658029 ) ) ( not ( = ?auto_2658031 ?auto_2658033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658032 ?auto_2658029 ?auto_2658033 )
      ( MAKE-4CRATE-VERIFY ?auto_2658030 ?auto_2658031 ?auto_2658032 ?auto_2658029 ?auto_2658033 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658060 - SURFACE
      ?auto_2658061 - SURFACE
      ?auto_2658062 - SURFACE
      ?auto_2658059 - SURFACE
      ?auto_2658063 - SURFACE
    )
    :vars
    (
      ?auto_2658064 - HOIST
      ?auto_2658067 - PLACE
      ?auto_2658065 - TRUCK
      ?auto_2658066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658064 ?auto_2658067 ) ( SURFACE-AT ?auto_2658059 ?auto_2658067 ) ( CLEAR ?auto_2658059 ) ( IS-CRATE ?auto_2658063 ) ( not ( = ?auto_2658059 ?auto_2658063 ) ) ( AVAILABLE ?auto_2658064 ) ( IN ?auto_2658063 ?auto_2658065 ) ( ON ?auto_2658059 ?auto_2658062 ) ( not ( = ?auto_2658062 ?auto_2658059 ) ) ( not ( = ?auto_2658062 ?auto_2658063 ) ) ( TRUCK-AT ?auto_2658065 ?auto_2658066 ) ( not ( = ?auto_2658066 ?auto_2658067 ) ) ( ON ?auto_2658061 ?auto_2658060 ) ( ON ?auto_2658062 ?auto_2658061 ) ( not ( = ?auto_2658060 ?auto_2658061 ) ) ( not ( = ?auto_2658060 ?auto_2658062 ) ) ( not ( = ?auto_2658060 ?auto_2658059 ) ) ( not ( = ?auto_2658060 ?auto_2658063 ) ) ( not ( = ?auto_2658061 ?auto_2658062 ) ) ( not ( = ?auto_2658061 ?auto_2658059 ) ) ( not ( = ?auto_2658061 ?auto_2658063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658062 ?auto_2658059 ?auto_2658063 )
      ( MAKE-4CRATE-VERIFY ?auto_2658060 ?auto_2658061 ?auto_2658062 ?auto_2658059 ?auto_2658063 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658094 - SURFACE
      ?auto_2658095 - SURFACE
      ?auto_2658096 - SURFACE
      ?auto_2658093 - SURFACE
      ?auto_2658097 - SURFACE
    )
    :vars
    (
      ?auto_2658101 - HOIST
      ?auto_2658098 - PLACE
      ?auto_2658100 - TRUCK
      ?auto_2658099 - PLACE
      ?auto_2658102 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658101 ?auto_2658098 ) ( SURFACE-AT ?auto_2658093 ?auto_2658098 ) ( CLEAR ?auto_2658093 ) ( IS-CRATE ?auto_2658097 ) ( not ( = ?auto_2658093 ?auto_2658097 ) ) ( AVAILABLE ?auto_2658101 ) ( ON ?auto_2658093 ?auto_2658096 ) ( not ( = ?auto_2658096 ?auto_2658093 ) ) ( not ( = ?auto_2658096 ?auto_2658097 ) ) ( TRUCK-AT ?auto_2658100 ?auto_2658099 ) ( not ( = ?auto_2658099 ?auto_2658098 ) ) ( HOIST-AT ?auto_2658102 ?auto_2658099 ) ( LIFTING ?auto_2658102 ?auto_2658097 ) ( not ( = ?auto_2658101 ?auto_2658102 ) ) ( ON ?auto_2658095 ?auto_2658094 ) ( ON ?auto_2658096 ?auto_2658095 ) ( not ( = ?auto_2658094 ?auto_2658095 ) ) ( not ( = ?auto_2658094 ?auto_2658096 ) ) ( not ( = ?auto_2658094 ?auto_2658093 ) ) ( not ( = ?auto_2658094 ?auto_2658097 ) ) ( not ( = ?auto_2658095 ?auto_2658096 ) ) ( not ( = ?auto_2658095 ?auto_2658093 ) ) ( not ( = ?auto_2658095 ?auto_2658097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658096 ?auto_2658093 ?auto_2658097 )
      ( MAKE-4CRATE-VERIFY ?auto_2658094 ?auto_2658095 ?auto_2658096 ?auto_2658093 ?auto_2658097 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658132 - SURFACE
      ?auto_2658133 - SURFACE
      ?auto_2658134 - SURFACE
      ?auto_2658131 - SURFACE
      ?auto_2658135 - SURFACE
    )
    :vars
    (
      ?auto_2658140 - HOIST
      ?auto_2658139 - PLACE
      ?auto_2658141 - TRUCK
      ?auto_2658136 - PLACE
      ?auto_2658138 - HOIST
      ?auto_2658137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658140 ?auto_2658139 ) ( SURFACE-AT ?auto_2658131 ?auto_2658139 ) ( CLEAR ?auto_2658131 ) ( IS-CRATE ?auto_2658135 ) ( not ( = ?auto_2658131 ?auto_2658135 ) ) ( AVAILABLE ?auto_2658140 ) ( ON ?auto_2658131 ?auto_2658134 ) ( not ( = ?auto_2658134 ?auto_2658131 ) ) ( not ( = ?auto_2658134 ?auto_2658135 ) ) ( TRUCK-AT ?auto_2658141 ?auto_2658136 ) ( not ( = ?auto_2658136 ?auto_2658139 ) ) ( HOIST-AT ?auto_2658138 ?auto_2658136 ) ( not ( = ?auto_2658140 ?auto_2658138 ) ) ( AVAILABLE ?auto_2658138 ) ( SURFACE-AT ?auto_2658135 ?auto_2658136 ) ( ON ?auto_2658135 ?auto_2658137 ) ( CLEAR ?auto_2658135 ) ( not ( = ?auto_2658131 ?auto_2658137 ) ) ( not ( = ?auto_2658135 ?auto_2658137 ) ) ( not ( = ?auto_2658134 ?auto_2658137 ) ) ( ON ?auto_2658133 ?auto_2658132 ) ( ON ?auto_2658134 ?auto_2658133 ) ( not ( = ?auto_2658132 ?auto_2658133 ) ) ( not ( = ?auto_2658132 ?auto_2658134 ) ) ( not ( = ?auto_2658132 ?auto_2658131 ) ) ( not ( = ?auto_2658132 ?auto_2658135 ) ) ( not ( = ?auto_2658132 ?auto_2658137 ) ) ( not ( = ?auto_2658133 ?auto_2658134 ) ) ( not ( = ?auto_2658133 ?auto_2658131 ) ) ( not ( = ?auto_2658133 ?auto_2658135 ) ) ( not ( = ?auto_2658133 ?auto_2658137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658134 ?auto_2658131 ?auto_2658135 )
      ( MAKE-4CRATE-VERIFY ?auto_2658132 ?auto_2658133 ?auto_2658134 ?auto_2658131 ?auto_2658135 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658171 - SURFACE
      ?auto_2658172 - SURFACE
      ?auto_2658173 - SURFACE
      ?auto_2658170 - SURFACE
      ?auto_2658174 - SURFACE
    )
    :vars
    (
      ?auto_2658175 - HOIST
      ?auto_2658177 - PLACE
      ?auto_2658178 - PLACE
      ?auto_2658176 - HOIST
      ?auto_2658179 - SURFACE
      ?auto_2658180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658175 ?auto_2658177 ) ( SURFACE-AT ?auto_2658170 ?auto_2658177 ) ( CLEAR ?auto_2658170 ) ( IS-CRATE ?auto_2658174 ) ( not ( = ?auto_2658170 ?auto_2658174 ) ) ( AVAILABLE ?auto_2658175 ) ( ON ?auto_2658170 ?auto_2658173 ) ( not ( = ?auto_2658173 ?auto_2658170 ) ) ( not ( = ?auto_2658173 ?auto_2658174 ) ) ( not ( = ?auto_2658178 ?auto_2658177 ) ) ( HOIST-AT ?auto_2658176 ?auto_2658178 ) ( not ( = ?auto_2658175 ?auto_2658176 ) ) ( AVAILABLE ?auto_2658176 ) ( SURFACE-AT ?auto_2658174 ?auto_2658178 ) ( ON ?auto_2658174 ?auto_2658179 ) ( CLEAR ?auto_2658174 ) ( not ( = ?auto_2658170 ?auto_2658179 ) ) ( not ( = ?auto_2658174 ?auto_2658179 ) ) ( not ( = ?auto_2658173 ?auto_2658179 ) ) ( TRUCK-AT ?auto_2658180 ?auto_2658177 ) ( ON ?auto_2658172 ?auto_2658171 ) ( ON ?auto_2658173 ?auto_2658172 ) ( not ( = ?auto_2658171 ?auto_2658172 ) ) ( not ( = ?auto_2658171 ?auto_2658173 ) ) ( not ( = ?auto_2658171 ?auto_2658170 ) ) ( not ( = ?auto_2658171 ?auto_2658174 ) ) ( not ( = ?auto_2658171 ?auto_2658179 ) ) ( not ( = ?auto_2658172 ?auto_2658173 ) ) ( not ( = ?auto_2658172 ?auto_2658170 ) ) ( not ( = ?auto_2658172 ?auto_2658174 ) ) ( not ( = ?auto_2658172 ?auto_2658179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658173 ?auto_2658170 ?auto_2658174 )
      ( MAKE-4CRATE-VERIFY ?auto_2658171 ?auto_2658172 ?auto_2658173 ?auto_2658170 ?auto_2658174 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658210 - SURFACE
      ?auto_2658211 - SURFACE
      ?auto_2658212 - SURFACE
      ?auto_2658209 - SURFACE
      ?auto_2658213 - SURFACE
    )
    :vars
    (
      ?auto_2658219 - HOIST
      ?auto_2658217 - PLACE
      ?auto_2658218 - PLACE
      ?auto_2658215 - HOIST
      ?auto_2658216 - SURFACE
      ?auto_2658214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658219 ?auto_2658217 ) ( IS-CRATE ?auto_2658213 ) ( not ( = ?auto_2658209 ?auto_2658213 ) ) ( not ( = ?auto_2658212 ?auto_2658209 ) ) ( not ( = ?auto_2658212 ?auto_2658213 ) ) ( not ( = ?auto_2658218 ?auto_2658217 ) ) ( HOIST-AT ?auto_2658215 ?auto_2658218 ) ( not ( = ?auto_2658219 ?auto_2658215 ) ) ( AVAILABLE ?auto_2658215 ) ( SURFACE-AT ?auto_2658213 ?auto_2658218 ) ( ON ?auto_2658213 ?auto_2658216 ) ( CLEAR ?auto_2658213 ) ( not ( = ?auto_2658209 ?auto_2658216 ) ) ( not ( = ?auto_2658213 ?auto_2658216 ) ) ( not ( = ?auto_2658212 ?auto_2658216 ) ) ( TRUCK-AT ?auto_2658214 ?auto_2658217 ) ( SURFACE-AT ?auto_2658212 ?auto_2658217 ) ( CLEAR ?auto_2658212 ) ( LIFTING ?auto_2658219 ?auto_2658209 ) ( IS-CRATE ?auto_2658209 ) ( ON ?auto_2658211 ?auto_2658210 ) ( ON ?auto_2658212 ?auto_2658211 ) ( not ( = ?auto_2658210 ?auto_2658211 ) ) ( not ( = ?auto_2658210 ?auto_2658212 ) ) ( not ( = ?auto_2658210 ?auto_2658209 ) ) ( not ( = ?auto_2658210 ?auto_2658213 ) ) ( not ( = ?auto_2658210 ?auto_2658216 ) ) ( not ( = ?auto_2658211 ?auto_2658212 ) ) ( not ( = ?auto_2658211 ?auto_2658209 ) ) ( not ( = ?auto_2658211 ?auto_2658213 ) ) ( not ( = ?auto_2658211 ?auto_2658216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658212 ?auto_2658209 ?auto_2658213 )
      ( MAKE-4CRATE-VERIFY ?auto_2658210 ?auto_2658211 ?auto_2658212 ?auto_2658209 ?auto_2658213 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658249 - SURFACE
      ?auto_2658250 - SURFACE
      ?auto_2658251 - SURFACE
      ?auto_2658248 - SURFACE
      ?auto_2658252 - SURFACE
    )
    :vars
    (
      ?auto_2658257 - HOIST
      ?auto_2658258 - PLACE
      ?auto_2658254 - PLACE
      ?auto_2658256 - HOIST
      ?auto_2658255 - SURFACE
      ?auto_2658253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658257 ?auto_2658258 ) ( IS-CRATE ?auto_2658252 ) ( not ( = ?auto_2658248 ?auto_2658252 ) ) ( not ( = ?auto_2658251 ?auto_2658248 ) ) ( not ( = ?auto_2658251 ?auto_2658252 ) ) ( not ( = ?auto_2658254 ?auto_2658258 ) ) ( HOIST-AT ?auto_2658256 ?auto_2658254 ) ( not ( = ?auto_2658257 ?auto_2658256 ) ) ( AVAILABLE ?auto_2658256 ) ( SURFACE-AT ?auto_2658252 ?auto_2658254 ) ( ON ?auto_2658252 ?auto_2658255 ) ( CLEAR ?auto_2658252 ) ( not ( = ?auto_2658248 ?auto_2658255 ) ) ( not ( = ?auto_2658252 ?auto_2658255 ) ) ( not ( = ?auto_2658251 ?auto_2658255 ) ) ( TRUCK-AT ?auto_2658253 ?auto_2658258 ) ( SURFACE-AT ?auto_2658251 ?auto_2658258 ) ( CLEAR ?auto_2658251 ) ( IS-CRATE ?auto_2658248 ) ( AVAILABLE ?auto_2658257 ) ( IN ?auto_2658248 ?auto_2658253 ) ( ON ?auto_2658250 ?auto_2658249 ) ( ON ?auto_2658251 ?auto_2658250 ) ( not ( = ?auto_2658249 ?auto_2658250 ) ) ( not ( = ?auto_2658249 ?auto_2658251 ) ) ( not ( = ?auto_2658249 ?auto_2658248 ) ) ( not ( = ?auto_2658249 ?auto_2658252 ) ) ( not ( = ?auto_2658249 ?auto_2658255 ) ) ( not ( = ?auto_2658250 ?auto_2658251 ) ) ( not ( = ?auto_2658250 ?auto_2658248 ) ) ( not ( = ?auto_2658250 ?auto_2658252 ) ) ( not ( = ?auto_2658250 ?auto_2658255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658251 ?auto_2658248 ?auto_2658252 )
      ( MAKE-4CRATE-VERIFY ?auto_2658249 ?auto_2658250 ?auto_2658251 ?auto_2658248 ?auto_2658252 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658909 - SURFACE
      ?auto_2658910 - SURFACE
      ?auto_2658911 - SURFACE
      ?auto_2658908 - SURFACE
      ?auto_2658912 - SURFACE
      ?auto_2658913 - SURFACE
    )
    :vars
    (
      ?auto_2658915 - HOIST
      ?auto_2658914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658915 ?auto_2658914 ) ( SURFACE-AT ?auto_2658912 ?auto_2658914 ) ( CLEAR ?auto_2658912 ) ( LIFTING ?auto_2658915 ?auto_2658913 ) ( IS-CRATE ?auto_2658913 ) ( not ( = ?auto_2658912 ?auto_2658913 ) ) ( ON ?auto_2658910 ?auto_2658909 ) ( ON ?auto_2658911 ?auto_2658910 ) ( ON ?auto_2658908 ?auto_2658911 ) ( ON ?auto_2658912 ?auto_2658908 ) ( not ( = ?auto_2658909 ?auto_2658910 ) ) ( not ( = ?auto_2658909 ?auto_2658911 ) ) ( not ( = ?auto_2658909 ?auto_2658908 ) ) ( not ( = ?auto_2658909 ?auto_2658912 ) ) ( not ( = ?auto_2658909 ?auto_2658913 ) ) ( not ( = ?auto_2658910 ?auto_2658911 ) ) ( not ( = ?auto_2658910 ?auto_2658908 ) ) ( not ( = ?auto_2658910 ?auto_2658912 ) ) ( not ( = ?auto_2658910 ?auto_2658913 ) ) ( not ( = ?auto_2658911 ?auto_2658908 ) ) ( not ( = ?auto_2658911 ?auto_2658912 ) ) ( not ( = ?auto_2658911 ?auto_2658913 ) ) ( not ( = ?auto_2658908 ?auto_2658912 ) ) ( not ( = ?auto_2658908 ?auto_2658913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658912 ?auto_2658913 )
      ( MAKE-5CRATE-VERIFY ?auto_2658909 ?auto_2658910 ?auto_2658911 ?auto_2658908 ?auto_2658912 ?auto_2658913 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658943 - SURFACE
      ?auto_2658944 - SURFACE
      ?auto_2658945 - SURFACE
      ?auto_2658942 - SURFACE
      ?auto_2658946 - SURFACE
      ?auto_2658947 - SURFACE
    )
    :vars
    (
      ?auto_2658948 - HOIST
      ?auto_2658950 - PLACE
      ?auto_2658949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658948 ?auto_2658950 ) ( SURFACE-AT ?auto_2658946 ?auto_2658950 ) ( CLEAR ?auto_2658946 ) ( IS-CRATE ?auto_2658947 ) ( not ( = ?auto_2658946 ?auto_2658947 ) ) ( TRUCK-AT ?auto_2658949 ?auto_2658950 ) ( AVAILABLE ?auto_2658948 ) ( IN ?auto_2658947 ?auto_2658949 ) ( ON ?auto_2658946 ?auto_2658942 ) ( not ( = ?auto_2658942 ?auto_2658946 ) ) ( not ( = ?auto_2658942 ?auto_2658947 ) ) ( ON ?auto_2658944 ?auto_2658943 ) ( ON ?auto_2658945 ?auto_2658944 ) ( ON ?auto_2658942 ?auto_2658945 ) ( not ( = ?auto_2658943 ?auto_2658944 ) ) ( not ( = ?auto_2658943 ?auto_2658945 ) ) ( not ( = ?auto_2658943 ?auto_2658942 ) ) ( not ( = ?auto_2658943 ?auto_2658946 ) ) ( not ( = ?auto_2658943 ?auto_2658947 ) ) ( not ( = ?auto_2658944 ?auto_2658945 ) ) ( not ( = ?auto_2658944 ?auto_2658942 ) ) ( not ( = ?auto_2658944 ?auto_2658946 ) ) ( not ( = ?auto_2658944 ?auto_2658947 ) ) ( not ( = ?auto_2658945 ?auto_2658942 ) ) ( not ( = ?auto_2658945 ?auto_2658946 ) ) ( not ( = ?auto_2658945 ?auto_2658947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658942 ?auto_2658946 ?auto_2658947 )
      ( MAKE-5CRATE-VERIFY ?auto_2658943 ?auto_2658944 ?auto_2658945 ?auto_2658942 ?auto_2658946 ?auto_2658947 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658983 - SURFACE
      ?auto_2658984 - SURFACE
      ?auto_2658985 - SURFACE
      ?auto_2658982 - SURFACE
      ?auto_2658986 - SURFACE
      ?auto_2658987 - SURFACE
    )
    :vars
    (
      ?auto_2658990 - HOIST
      ?auto_2658991 - PLACE
      ?auto_2658989 - TRUCK
      ?auto_2658988 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658990 ?auto_2658991 ) ( SURFACE-AT ?auto_2658986 ?auto_2658991 ) ( CLEAR ?auto_2658986 ) ( IS-CRATE ?auto_2658987 ) ( not ( = ?auto_2658986 ?auto_2658987 ) ) ( AVAILABLE ?auto_2658990 ) ( IN ?auto_2658987 ?auto_2658989 ) ( ON ?auto_2658986 ?auto_2658982 ) ( not ( = ?auto_2658982 ?auto_2658986 ) ) ( not ( = ?auto_2658982 ?auto_2658987 ) ) ( TRUCK-AT ?auto_2658989 ?auto_2658988 ) ( not ( = ?auto_2658988 ?auto_2658991 ) ) ( ON ?auto_2658984 ?auto_2658983 ) ( ON ?auto_2658985 ?auto_2658984 ) ( ON ?auto_2658982 ?auto_2658985 ) ( not ( = ?auto_2658983 ?auto_2658984 ) ) ( not ( = ?auto_2658983 ?auto_2658985 ) ) ( not ( = ?auto_2658983 ?auto_2658982 ) ) ( not ( = ?auto_2658983 ?auto_2658986 ) ) ( not ( = ?auto_2658983 ?auto_2658987 ) ) ( not ( = ?auto_2658984 ?auto_2658985 ) ) ( not ( = ?auto_2658984 ?auto_2658982 ) ) ( not ( = ?auto_2658984 ?auto_2658986 ) ) ( not ( = ?auto_2658984 ?auto_2658987 ) ) ( not ( = ?auto_2658985 ?auto_2658982 ) ) ( not ( = ?auto_2658985 ?auto_2658986 ) ) ( not ( = ?auto_2658985 ?auto_2658987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658982 ?auto_2658986 ?auto_2658987 )
      ( MAKE-5CRATE-VERIFY ?auto_2658983 ?auto_2658984 ?auto_2658985 ?auto_2658982 ?auto_2658986 ?auto_2658987 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2659028 - SURFACE
      ?auto_2659029 - SURFACE
      ?auto_2659030 - SURFACE
      ?auto_2659027 - SURFACE
      ?auto_2659031 - SURFACE
      ?auto_2659032 - SURFACE
    )
    :vars
    (
      ?auto_2659035 - HOIST
      ?auto_2659033 - PLACE
      ?auto_2659037 - TRUCK
      ?auto_2659036 - PLACE
      ?auto_2659034 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659035 ?auto_2659033 ) ( SURFACE-AT ?auto_2659031 ?auto_2659033 ) ( CLEAR ?auto_2659031 ) ( IS-CRATE ?auto_2659032 ) ( not ( = ?auto_2659031 ?auto_2659032 ) ) ( AVAILABLE ?auto_2659035 ) ( ON ?auto_2659031 ?auto_2659027 ) ( not ( = ?auto_2659027 ?auto_2659031 ) ) ( not ( = ?auto_2659027 ?auto_2659032 ) ) ( TRUCK-AT ?auto_2659037 ?auto_2659036 ) ( not ( = ?auto_2659036 ?auto_2659033 ) ) ( HOIST-AT ?auto_2659034 ?auto_2659036 ) ( LIFTING ?auto_2659034 ?auto_2659032 ) ( not ( = ?auto_2659035 ?auto_2659034 ) ) ( ON ?auto_2659029 ?auto_2659028 ) ( ON ?auto_2659030 ?auto_2659029 ) ( ON ?auto_2659027 ?auto_2659030 ) ( not ( = ?auto_2659028 ?auto_2659029 ) ) ( not ( = ?auto_2659028 ?auto_2659030 ) ) ( not ( = ?auto_2659028 ?auto_2659027 ) ) ( not ( = ?auto_2659028 ?auto_2659031 ) ) ( not ( = ?auto_2659028 ?auto_2659032 ) ) ( not ( = ?auto_2659029 ?auto_2659030 ) ) ( not ( = ?auto_2659029 ?auto_2659027 ) ) ( not ( = ?auto_2659029 ?auto_2659031 ) ) ( not ( = ?auto_2659029 ?auto_2659032 ) ) ( not ( = ?auto_2659030 ?auto_2659027 ) ) ( not ( = ?auto_2659030 ?auto_2659031 ) ) ( not ( = ?auto_2659030 ?auto_2659032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659027 ?auto_2659031 ?auto_2659032 )
      ( MAKE-5CRATE-VERIFY ?auto_2659028 ?auto_2659029 ?auto_2659030 ?auto_2659027 ?auto_2659031 ?auto_2659032 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2659078 - SURFACE
      ?auto_2659079 - SURFACE
      ?auto_2659080 - SURFACE
      ?auto_2659077 - SURFACE
      ?auto_2659081 - SURFACE
      ?auto_2659082 - SURFACE
    )
    :vars
    (
      ?auto_2659087 - HOIST
      ?auto_2659084 - PLACE
      ?auto_2659083 - TRUCK
      ?auto_2659086 - PLACE
      ?auto_2659088 - HOIST
      ?auto_2659085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659087 ?auto_2659084 ) ( SURFACE-AT ?auto_2659081 ?auto_2659084 ) ( CLEAR ?auto_2659081 ) ( IS-CRATE ?auto_2659082 ) ( not ( = ?auto_2659081 ?auto_2659082 ) ) ( AVAILABLE ?auto_2659087 ) ( ON ?auto_2659081 ?auto_2659077 ) ( not ( = ?auto_2659077 ?auto_2659081 ) ) ( not ( = ?auto_2659077 ?auto_2659082 ) ) ( TRUCK-AT ?auto_2659083 ?auto_2659086 ) ( not ( = ?auto_2659086 ?auto_2659084 ) ) ( HOIST-AT ?auto_2659088 ?auto_2659086 ) ( not ( = ?auto_2659087 ?auto_2659088 ) ) ( AVAILABLE ?auto_2659088 ) ( SURFACE-AT ?auto_2659082 ?auto_2659086 ) ( ON ?auto_2659082 ?auto_2659085 ) ( CLEAR ?auto_2659082 ) ( not ( = ?auto_2659081 ?auto_2659085 ) ) ( not ( = ?auto_2659082 ?auto_2659085 ) ) ( not ( = ?auto_2659077 ?auto_2659085 ) ) ( ON ?auto_2659079 ?auto_2659078 ) ( ON ?auto_2659080 ?auto_2659079 ) ( ON ?auto_2659077 ?auto_2659080 ) ( not ( = ?auto_2659078 ?auto_2659079 ) ) ( not ( = ?auto_2659078 ?auto_2659080 ) ) ( not ( = ?auto_2659078 ?auto_2659077 ) ) ( not ( = ?auto_2659078 ?auto_2659081 ) ) ( not ( = ?auto_2659078 ?auto_2659082 ) ) ( not ( = ?auto_2659078 ?auto_2659085 ) ) ( not ( = ?auto_2659079 ?auto_2659080 ) ) ( not ( = ?auto_2659079 ?auto_2659077 ) ) ( not ( = ?auto_2659079 ?auto_2659081 ) ) ( not ( = ?auto_2659079 ?auto_2659082 ) ) ( not ( = ?auto_2659079 ?auto_2659085 ) ) ( not ( = ?auto_2659080 ?auto_2659077 ) ) ( not ( = ?auto_2659080 ?auto_2659081 ) ) ( not ( = ?auto_2659080 ?auto_2659082 ) ) ( not ( = ?auto_2659080 ?auto_2659085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659077 ?auto_2659081 ?auto_2659082 )
      ( MAKE-5CRATE-VERIFY ?auto_2659078 ?auto_2659079 ?auto_2659080 ?auto_2659077 ?auto_2659081 ?auto_2659082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2659129 - SURFACE
      ?auto_2659130 - SURFACE
      ?auto_2659131 - SURFACE
      ?auto_2659128 - SURFACE
      ?auto_2659132 - SURFACE
      ?auto_2659133 - SURFACE
    )
    :vars
    (
      ?auto_2659136 - HOIST
      ?auto_2659138 - PLACE
      ?auto_2659135 - PLACE
      ?auto_2659139 - HOIST
      ?auto_2659137 - SURFACE
      ?auto_2659134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659136 ?auto_2659138 ) ( SURFACE-AT ?auto_2659132 ?auto_2659138 ) ( CLEAR ?auto_2659132 ) ( IS-CRATE ?auto_2659133 ) ( not ( = ?auto_2659132 ?auto_2659133 ) ) ( AVAILABLE ?auto_2659136 ) ( ON ?auto_2659132 ?auto_2659128 ) ( not ( = ?auto_2659128 ?auto_2659132 ) ) ( not ( = ?auto_2659128 ?auto_2659133 ) ) ( not ( = ?auto_2659135 ?auto_2659138 ) ) ( HOIST-AT ?auto_2659139 ?auto_2659135 ) ( not ( = ?auto_2659136 ?auto_2659139 ) ) ( AVAILABLE ?auto_2659139 ) ( SURFACE-AT ?auto_2659133 ?auto_2659135 ) ( ON ?auto_2659133 ?auto_2659137 ) ( CLEAR ?auto_2659133 ) ( not ( = ?auto_2659132 ?auto_2659137 ) ) ( not ( = ?auto_2659133 ?auto_2659137 ) ) ( not ( = ?auto_2659128 ?auto_2659137 ) ) ( TRUCK-AT ?auto_2659134 ?auto_2659138 ) ( ON ?auto_2659130 ?auto_2659129 ) ( ON ?auto_2659131 ?auto_2659130 ) ( ON ?auto_2659128 ?auto_2659131 ) ( not ( = ?auto_2659129 ?auto_2659130 ) ) ( not ( = ?auto_2659129 ?auto_2659131 ) ) ( not ( = ?auto_2659129 ?auto_2659128 ) ) ( not ( = ?auto_2659129 ?auto_2659132 ) ) ( not ( = ?auto_2659129 ?auto_2659133 ) ) ( not ( = ?auto_2659129 ?auto_2659137 ) ) ( not ( = ?auto_2659130 ?auto_2659131 ) ) ( not ( = ?auto_2659130 ?auto_2659128 ) ) ( not ( = ?auto_2659130 ?auto_2659132 ) ) ( not ( = ?auto_2659130 ?auto_2659133 ) ) ( not ( = ?auto_2659130 ?auto_2659137 ) ) ( not ( = ?auto_2659131 ?auto_2659128 ) ) ( not ( = ?auto_2659131 ?auto_2659132 ) ) ( not ( = ?auto_2659131 ?auto_2659133 ) ) ( not ( = ?auto_2659131 ?auto_2659137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659128 ?auto_2659132 ?auto_2659133 )
      ( MAKE-5CRATE-VERIFY ?auto_2659129 ?auto_2659130 ?auto_2659131 ?auto_2659128 ?auto_2659132 ?auto_2659133 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2659180 - SURFACE
      ?auto_2659181 - SURFACE
      ?auto_2659182 - SURFACE
      ?auto_2659179 - SURFACE
      ?auto_2659183 - SURFACE
      ?auto_2659184 - SURFACE
    )
    :vars
    (
      ?auto_2659187 - HOIST
      ?auto_2659190 - PLACE
      ?auto_2659189 - PLACE
      ?auto_2659186 - HOIST
      ?auto_2659188 - SURFACE
      ?auto_2659185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659187 ?auto_2659190 ) ( IS-CRATE ?auto_2659184 ) ( not ( = ?auto_2659183 ?auto_2659184 ) ) ( not ( = ?auto_2659179 ?auto_2659183 ) ) ( not ( = ?auto_2659179 ?auto_2659184 ) ) ( not ( = ?auto_2659189 ?auto_2659190 ) ) ( HOIST-AT ?auto_2659186 ?auto_2659189 ) ( not ( = ?auto_2659187 ?auto_2659186 ) ) ( AVAILABLE ?auto_2659186 ) ( SURFACE-AT ?auto_2659184 ?auto_2659189 ) ( ON ?auto_2659184 ?auto_2659188 ) ( CLEAR ?auto_2659184 ) ( not ( = ?auto_2659183 ?auto_2659188 ) ) ( not ( = ?auto_2659184 ?auto_2659188 ) ) ( not ( = ?auto_2659179 ?auto_2659188 ) ) ( TRUCK-AT ?auto_2659185 ?auto_2659190 ) ( SURFACE-AT ?auto_2659179 ?auto_2659190 ) ( CLEAR ?auto_2659179 ) ( LIFTING ?auto_2659187 ?auto_2659183 ) ( IS-CRATE ?auto_2659183 ) ( ON ?auto_2659181 ?auto_2659180 ) ( ON ?auto_2659182 ?auto_2659181 ) ( ON ?auto_2659179 ?auto_2659182 ) ( not ( = ?auto_2659180 ?auto_2659181 ) ) ( not ( = ?auto_2659180 ?auto_2659182 ) ) ( not ( = ?auto_2659180 ?auto_2659179 ) ) ( not ( = ?auto_2659180 ?auto_2659183 ) ) ( not ( = ?auto_2659180 ?auto_2659184 ) ) ( not ( = ?auto_2659180 ?auto_2659188 ) ) ( not ( = ?auto_2659181 ?auto_2659182 ) ) ( not ( = ?auto_2659181 ?auto_2659179 ) ) ( not ( = ?auto_2659181 ?auto_2659183 ) ) ( not ( = ?auto_2659181 ?auto_2659184 ) ) ( not ( = ?auto_2659181 ?auto_2659188 ) ) ( not ( = ?auto_2659182 ?auto_2659179 ) ) ( not ( = ?auto_2659182 ?auto_2659183 ) ) ( not ( = ?auto_2659182 ?auto_2659184 ) ) ( not ( = ?auto_2659182 ?auto_2659188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659179 ?auto_2659183 ?auto_2659184 )
      ( MAKE-5CRATE-VERIFY ?auto_2659180 ?auto_2659181 ?auto_2659182 ?auto_2659179 ?auto_2659183 ?auto_2659184 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2659231 - SURFACE
      ?auto_2659232 - SURFACE
      ?auto_2659233 - SURFACE
      ?auto_2659230 - SURFACE
      ?auto_2659234 - SURFACE
      ?auto_2659235 - SURFACE
    )
    :vars
    (
      ?auto_2659238 - HOIST
      ?auto_2659237 - PLACE
      ?auto_2659241 - PLACE
      ?auto_2659239 - HOIST
      ?auto_2659240 - SURFACE
      ?auto_2659236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659238 ?auto_2659237 ) ( IS-CRATE ?auto_2659235 ) ( not ( = ?auto_2659234 ?auto_2659235 ) ) ( not ( = ?auto_2659230 ?auto_2659234 ) ) ( not ( = ?auto_2659230 ?auto_2659235 ) ) ( not ( = ?auto_2659241 ?auto_2659237 ) ) ( HOIST-AT ?auto_2659239 ?auto_2659241 ) ( not ( = ?auto_2659238 ?auto_2659239 ) ) ( AVAILABLE ?auto_2659239 ) ( SURFACE-AT ?auto_2659235 ?auto_2659241 ) ( ON ?auto_2659235 ?auto_2659240 ) ( CLEAR ?auto_2659235 ) ( not ( = ?auto_2659234 ?auto_2659240 ) ) ( not ( = ?auto_2659235 ?auto_2659240 ) ) ( not ( = ?auto_2659230 ?auto_2659240 ) ) ( TRUCK-AT ?auto_2659236 ?auto_2659237 ) ( SURFACE-AT ?auto_2659230 ?auto_2659237 ) ( CLEAR ?auto_2659230 ) ( IS-CRATE ?auto_2659234 ) ( AVAILABLE ?auto_2659238 ) ( IN ?auto_2659234 ?auto_2659236 ) ( ON ?auto_2659232 ?auto_2659231 ) ( ON ?auto_2659233 ?auto_2659232 ) ( ON ?auto_2659230 ?auto_2659233 ) ( not ( = ?auto_2659231 ?auto_2659232 ) ) ( not ( = ?auto_2659231 ?auto_2659233 ) ) ( not ( = ?auto_2659231 ?auto_2659230 ) ) ( not ( = ?auto_2659231 ?auto_2659234 ) ) ( not ( = ?auto_2659231 ?auto_2659235 ) ) ( not ( = ?auto_2659231 ?auto_2659240 ) ) ( not ( = ?auto_2659232 ?auto_2659233 ) ) ( not ( = ?auto_2659232 ?auto_2659230 ) ) ( not ( = ?auto_2659232 ?auto_2659234 ) ) ( not ( = ?auto_2659232 ?auto_2659235 ) ) ( not ( = ?auto_2659232 ?auto_2659240 ) ) ( not ( = ?auto_2659233 ?auto_2659230 ) ) ( not ( = ?auto_2659233 ?auto_2659234 ) ) ( not ( = ?auto_2659233 ?auto_2659235 ) ) ( not ( = ?auto_2659233 ?auto_2659240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659230 ?auto_2659234 ?auto_2659235 )
      ( MAKE-5CRATE-VERIFY ?auto_2659231 ?auto_2659232 ?auto_2659233 ?auto_2659230 ?auto_2659234 ?auto_2659235 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660440 - SURFACE
      ?auto_2660441 - SURFACE
      ?auto_2660442 - SURFACE
      ?auto_2660439 - SURFACE
      ?auto_2660443 - SURFACE
      ?auto_2660445 - SURFACE
      ?auto_2660444 - SURFACE
    )
    :vars
    (
      ?auto_2660447 - HOIST
      ?auto_2660446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660447 ?auto_2660446 ) ( SURFACE-AT ?auto_2660445 ?auto_2660446 ) ( CLEAR ?auto_2660445 ) ( LIFTING ?auto_2660447 ?auto_2660444 ) ( IS-CRATE ?auto_2660444 ) ( not ( = ?auto_2660445 ?auto_2660444 ) ) ( ON ?auto_2660441 ?auto_2660440 ) ( ON ?auto_2660442 ?auto_2660441 ) ( ON ?auto_2660439 ?auto_2660442 ) ( ON ?auto_2660443 ?auto_2660439 ) ( ON ?auto_2660445 ?auto_2660443 ) ( not ( = ?auto_2660440 ?auto_2660441 ) ) ( not ( = ?auto_2660440 ?auto_2660442 ) ) ( not ( = ?auto_2660440 ?auto_2660439 ) ) ( not ( = ?auto_2660440 ?auto_2660443 ) ) ( not ( = ?auto_2660440 ?auto_2660445 ) ) ( not ( = ?auto_2660440 ?auto_2660444 ) ) ( not ( = ?auto_2660441 ?auto_2660442 ) ) ( not ( = ?auto_2660441 ?auto_2660439 ) ) ( not ( = ?auto_2660441 ?auto_2660443 ) ) ( not ( = ?auto_2660441 ?auto_2660445 ) ) ( not ( = ?auto_2660441 ?auto_2660444 ) ) ( not ( = ?auto_2660442 ?auto_2660439 ) ) ( not ( = ?auto_2660442 ?auto_2660443 ) ) ( not ( = ?auto_2660442 ?auto_2660445 ) ) ( not ( = ?auto_2660442 ?auto_2660444 ) ) ( not ( = ?auto_2660439 ?auto_2660443 ) ) ( not ( = ?auto_2660439 ?auto_2660445 ) ) ( not ( = ?auto_2660439 ?auto_2660444 ) ) ( not ( = ?auto_2660443 ?auto_2660445 ) ) ( not ( = ?auto_2660443 ?auto_2660444 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2660445 ?auto_2660444 )
      ( MAKE-6CRATE-VERIFY ?auto_2660440 ?auto_2660441 ?auto_2660442 ?auto_2660439 ?auto_2660443 ?auto_2660445 ?auto_2660444 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660484 - SURFACE
      ?auto_2660485 - SURFACE
      ?auto_2660486 - SURFACE
      ?auto_2660483 - SURFACE
      ?auto_2660487 - SURFACE
      ?auto_2660489 - SURFACE
      ?auto_2660488 - SURFACE
    )
    :vars
    (
      ?auto_2660491 - HOIST
      ?auto_2660490 - PLACE
      ?auto_2660492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660491 ?auto_2660490 ) ( SURFACE-AT ?auto_2660489 ?auto_2660490 ) ( CLEAR ?auto_2660489 ) ( IS-CRATE ?auto_2660488 ) ( not ( = ?auto_2660489 ?auto_2660488 ) ) ( TRUCK-AT ?auto_2660492 ?auto_2660490 ) ( AVAILABLE ?auto_2660491 ) ( IN ?auto_2660488 ?auto_2660492 ) ( ON ?auto_2660489 ?auto_2660487 ) ( not ( = ?auto_2660487 ?auto_2660489 ) ) ( not ( = ?auto_2660487 ?auto_2660488 ) ) ( ON ?auto_2660485 ?auto_2660484 ) ( ON ?auto_2660486 ?auto_2660485 ) ( ON ?auto_2660483 ?auto_2660486 ) ( ON ?auto_2660487 ?auto_2660483 ) ( not ( = ?auto_2660484 ?auto_2660485 ) ) ( not ( = ?auto_2660484 ?auto_2660486 ) ) ( not ( = ?auto_2660484 ?auto_2660483 ) ) ( not ( = ?auto_2660484 ?auto_2660487 ) ) ( not ( = ?auto_2660484 ?auto_2660489 ) ) ( not ( = ?auto_2660484 ?auto_2660488 ) ) ( not ( = ?auto_2660485 ?auto_2660486 ) ) ( not ( = ?auto_2660485 ?auto_2660483 ) ) ( not ( = ?auto_2660485 ?auto_2660487 ) ) ( not ( = ?auto_2660485 ?auto_2660489 ) ) ( not ( = ?auto_2660485 ?auto_2660488 ) ) ( not ( = ?auto_2660486 ?auto_2660483 ) ) ( not ( = ?auto_2660486 ?auto_2660487 ) ) ( not ( = ?auto_2660486 ?auto_2660489 ) ) ( not ( = ?auto_2660486 ?auto_2660488 ) ) ( not ( = ?auto_2660483 ?auto_2660487 ) ) ( not ( = ?auto_2660483 ?auto_2660489 ) ) ( not ( = ?auto_2660483 ?auto_2660488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660487 ?auto_2660489 ?auto_2660488 )
      ( MAKE-6CRATE-VERIFY ?auto_2660484 ?auto_2660485 ?auto_2660486 ?auto_2660483 ?auto_2660487 ?auto_2660489 ?auto_2660488 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660535 - SURFACE
      ?auto_2660536 - SURFACE
      ?auto_2660537 - SURFACE
      ?auto_2660534 - SURFACE
      ?auto_2660538 - SURFACE
      ?auto_2660540 - SURFACE
      ?auto_2660539 - SURFACE
    )
    :vars
    (
      ?auto_2660541 - HOIST
      ?auto_2660544 - PLACE
      ?auto_2660542 - TRUCK
      ?auto_2660543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660541 ?auto_2660544 ) ( SURFACE-AT ?auto_2660540 ?auto_2660544 ) ( CLEAR ?auto_2660540 ) ( IS-CRATE ?auto_2660539 ) ( not ( = ?auto_2660540 ?auto_2660539 ) ) ( AVAILABLE ?auto_2660541 ) ( IN ?auto_2660539 ?auto_2660542 ) ( ON ?auto_2660540 ?auto_2660538 ) ( not ( = ?auto_2660538 ?auto_2660540 ) ) ( not ( = ?auto_2660538 ?auto_2660539 ) ) ( TRUCK-AT ?auto_2660542 ?auto_2660543 ) ( not ( = ?auto_2660543 ?auto_2660544 ) ) ( ON ?auto_2660536 ?auto_2660535 ) ( ON ?auto_2660537 ?auto_2660536 ) ( ON ?auto_2660534 ?auto_2660537 ) ( ON ?auto_2660538 ?auto_2660534 ) ( not ( = ?auto_2660535 ?auto_2660536 ) ) ( not ( = ?auto_2660535 ?auto_2660537 ) ) ( not ( = ?auto_2660535 ?auto_2660534 ) ) ( not ( = ?auto_2660535 ?auto_2660538 ) ) ( not ( = ?auto_2660535 ?auto_2660540 ) ) ( not ( = ?auto_2660535 ?auto_2660539 ) ) ( not ( = ?auto_2660536 ?auto_2660537 ) ) ( not ( = ?auto_2660536 ?auto_2660534 ) ) ( not ( = ?auto_2660536 ?auto_2660538 ) ) ( not ( = ?auto_2660536 ?auto_2660540 ) ) ( not ( = ?auto_2660536 ?auto_2660539 ) ) ( not ( = ?auto_2660537 ?auto_2660534 ) ) ( not ( = ?auto_2660537 ?auto_2660538 ) ) ( not ( = ?auto_2660537 ?auto_2660540 ) ) ( not ( = ?auto_2660537 ?auto_2660539 ) ) ( not ( = ?auto_2660534 ?auto_2660538 ) ) ( not ( = ?auto_2660534 ?auto_2660540 ) ) ( not ( = ?auto_2660534 ?auto_2660539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660538 ?auto_2660540 ?auto_2660539 )
      ( MAKE-6CRATE-VERIFY ?auto_2660535 ?auto_2660536 ?auto_2660537 ?auto_2660534 ?auto_2660538 ?auto_2660540 ?auto_2660539 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660592 - SURFACE
      ?auto_2660593 - SURFACE
      ?auto_2660594 - SURFACE
      ?auto_2660591 - SURFACE
      ?auto_2660595 - SURFACE
      ?auto_2660597 - SURFACE
      ?auto_2660596 - SURFACE
    )
    :vars
    (
      ?auto_2660600 - HOIST
      ?auto_2660602 - PLACE
      ?auto_2660599 - TRUCK
      ?auto_2660601 - PLACE
      ?auto_2660598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660600 ?auto_2660602 ) ( SURFACE-AT ?auto_2660597 ?auto_2660602 ) ( CLEAR ?auto_2660597 ) ( IS-CRATE ?auto_2660596 ) ( not ( = ?auto_2660597 ?auto_2660596 ) ) ( AVAILABLE ?auto_2660600 ) ( ON ?auto_2660597 ?auto_2660595 ) ( not ( = ?auto_2660595 ?auto_2660597 ) ) ( not ( = ?auto_2660595 ?auto_2660596 ) ) ( TRUCK-AT ?auto_2660599 ?auto_2660601 ) ( not ( = ?auto_2660601 ?auto_2660602 ) ) ( HOIST-AT ?auto_2660598 ?auto_2660601 ) ( LIFTING ?auto_2660598 ?auto_2660596 ) ( not ( = ?auto_2660600 ?auto_2660598 ) ) ( ON ?auto_2660593 ?auto_2660592 ) ( ON ?auto_2660594 ?auto_2660593 ) ( ON ?auto_2660591 ?auto_2660594 ) ( ON ?auto_2660595 ?auto_2660591 ) ( not ( = ?auto_2660592 ?auto_2660593 ) ) ( not ( = ?auto_2660592 ?auto_2660594 ) ) ( not ( = ?auto_2660592 ?auto_2660591 ) ) ( not ( = ?auto_2660592 ?auto_2660595 ) ) ( not ( = ?auto_2660592 ?auto_2660597 ) ) ( not ( = ?auto_2660592 ?auto_2660596 ) ) ( not ( = ?auto_2660593 ?auto_2660594 ) ) ( not ( = ?auto_2660593 ?auto_2660591 ) ) ( not ( = ?auto_2660593 ?auto_2660595 ) ) ( not ( = ?auto_2660593 ?auto_2660597 ) ) ( not ( = ?auto_2660593 ?auto_2660596 ) ) ( not ( = ?auto_2660594 ?auto_2660591 ) ) ( not ( = ?auto_2660594 ?auto_2660595 ) ) ( not ( = ?auto_2660594 ?auto_2660597 ) ) ( not ( = ?auto_2660594 ?auto_2660596 ) ) ( not ( = ?auto_2660591 ?auto_2660595 ) ) ( not ( = ?auto_2660591 ?auto_2660597 ) ) ( not ( = ?auto_2660591 ?auto_2660596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660595 ?auto_2660597 ?auto_2660596 )
      ( MAKE-6CRATE-VERIFY ?auto_2660592 ?auto_2660593 ?auto_2660594 ?auto_2660591 ?auto_2660595 ?auto_2660597 ?auto_2660596 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660655 - SURFACE
      ?auto_2660656 - SURFACE
      ?auto_2660657 - SURFACE
      ?auto_2660654 - SURFACE
      ?auto_2660658 - SURFACE
      ?auto_2660660 - SURFACE
      ?auto_2660659 - SURFACE
    )
    :vars
    (
      ?auto_2660661 - HOIST
      ?auto_2660665 - PLACE
      ?auto_2660666 - TRUCK
      ?auto_2660662 - PLACE
      ?auto_2660663 - HOIST
      ?auto_2660664 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660661 ?auto_2660665 ) ( SURFACE-AT ?auto_2660660 ?auto_2660665 ) ( CLEAR ?auto_2660660 ) ( IS-CRATE ?auto_2660659 ) ( not ( = ?auto_2660660 ?auto_2660659 ) ) ( AVAILABLE ?auto_2660661 ) ( ON ?auto_2660660 ?auto_2660658 ) ( not ( = ?auto_2660658 ?auto_2660660 ) ) ( not ( = ?auto_2660658 ?auto_2660659 ) ) ( TRUCK-AT ?auto_2660666 ?auto_2660662 ) ( not ( = ?auto_2660662 ?auto_2660665 ) ) ( HOIST-AT ?auto_2660663 ?auto_2660662 ) ( not ( = ?auto_2660661 ?auto_2660663 ) ) ( AVAILABLE ?auto_2660663 ) ( SURFACE-AT ?auto_2660659 ?auto_2660662 ) ( ON ?auto_2660659 ?auto_2660664 ) ( CLEAR ?auto_2660659 ) ( not ( = ?auto_2660660 ?auto_2660664 ) ) ( not ( = ?auto_2660659 ?auto_2660664 ) ) ( not ( = ?auto_2660658 ?auto_2660664 ) ) ( ON ?auto_2660656 ?auto_2660655 ) ( ON ?auto_2660657 ?auto_2660656 ) ( ON ?auto_2660654 ?auto_2660657 ) ( ON ?auto_2660658 ?auto_2660654 ) ( not ( = ?auto_2660655 ?auto_2660656 ) ) ( not ( = ?auto_2660655 ?auto_2660657 ) ) ( not ( = ?auto_2660655 ?auto_2660654 ) ) ( not ( = ?auto_2660655 ?auto_2660658 ) ) ( not ( = ?auto_2660655 ?auto_2660660 ) ) ( not ( = ?auto_2660655 ?auto_2660659 ) ) ( not ( = ?auto_2660655 ?auto_2660664 ) ) ( not ( = ?auto_2660656 ?auto_2660657 ) ) ( not ( = ?auto_2660656 ?auto_2660654 ) ) ( not ( = ?auto_2660656 ?auto_2660658 ) ) ( not ( = ?auto_2660656 ?auto_2660660 ) ) ( not ( = ?auto_2660656 ?auto_2660659 ) ) ( not ( = ?auto_2660656 ?auto_2660664 ) ) ( not ( = ?auto_2660657 ?auto_2660654 ) ) ( not ( = ?auto_2660657 ?auto_2660658 ) ) ( not ( = ?auto_2660657 ?auto_2660660 ) ) ( not ( = ?auto_2660657 ?auto_2660659 ) ) ( not ( = ?auto_2660657 ?auto_2660664 ) ) ( not ( = ?auto_2660654 ?auto_2660658 ) ) ( not ( = ?auto_2660654 ?auto_2660660 ) ) ( not ( = ?auto_2660654 ?auto_2660659 ) ) ( not ( = ?auto_2660654 ?auto_2660664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660658 ?auto_2660660 ?auto_2660659 )
      ( MAKE-6CRATE-VERIFY ?auto_2660655 ?auto_2660656 ?auto_2660657 ?auto_2660654 ?auto_2660658 ?auto_2660660 ?auto_2660659 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660719 - SURFACE
      ?auto_2660720 - SURFACE
      ?auto_2660721 - SURFACE
      ?auto_2660718 - SURFACE
      ?auto_2660722 - SURFACE
      ?auto_2660724 - SURFACE
      ?auto_2660723 - SURFACE
    )
    :vars
    (
      ?auto_2660730 - HOIST
      ?auto_2660729 - PLACE
      ?auto_2660727 - PLACE
      ?auto_2660728 - HOIST
      ?auto_2660725 - SURFACE
      ?auto_2660726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660730 ?auto_2660729 ) ( SURFACE-AT ?auto_2660724 ?auto_2660729 ) ( CLEAR ?auto_2660724 ) ( IS-CRATE ?auto_2660723 ) ( not ( = ?auto_2660724 ?auto_2660723 ) ) ( AVAILABLE ?auto_2660730 ) ( ON ?auto_2660724 ?auto_2660722 ) ( not ( = ?auto_2660722 ?auto_2660724 ) ) ( not ( = ?auto_2660722 ?auto_2660723 ) ) ( not ( = ?auto_2660727 ?auto_2660729 ) ) ( HOIST-AT ?auto_2660728 ?auto_2660727 ) ( not ( = ?auto_2660730 ?auto_2660728 ) ) ( AVAILABLE ?auto_2660728 ) ( SURFACE-AT ?auto_2660723 ?auto_2660727 ) ( ON ?auto_2660723 ?auto_2660725 ) ( CLEAR ?auto_2660723 ) ( not ( = ?auto_2660724 ?auto_2660725 ) ) ( not ( = ?auto_2660723 ?auto_2660725 ) ) ( not ( = ?auto_2660722 ?auto_2660725 ) ) ( TRUCK-AT ?auto_2660726 ?auto_2660729 ) ( ON ?auto_2660720 ?auto_2660719 ) ( ON ?auto_2660721 ?auto_2660720 ) ( ON ?auto_2660718 ?auto_2660721 ) ( ON ?auto_2660722 ?auto_2660718 ) ( not ( = ?auto_2660719 ?auto_2660720 ) ) ( not ( = ?auto_2660719 ?auto_2660721 ) ) ( not ( = ?auto_2660719 ?auto_2660718 ) ) ( not ( = ?auto_2660719 ?auto_2660722 ) ) ( not ( = ?auto_2660719 ?auto_2660724 ) ) ( not ( = ?auto_2660719 ?auto_2660723 ) ) ( not ( = ?auto_2660719 ?auto_2660725 ) ) ( not ( = ?auto_2660720 ?auto_2660721 ) ) ( not ( = ?auto_2660720 ?auto_2660718 ) ) ( not ( = ?auto_2660720 ?auto_2660722 ) ) ( not ( = ?auto_2660720 ?auto_2660724 ) ) ( not ( = ?auto_2660720 ?auto_2660723 ) ) ( not ( = ?auto_2660720 ?auto_2660725 ) ) ( not ( = ?auto_2660721 ?auto_2660718 ) ) ( not ( = ?auto_2660721 ?auto_2660722 ) ) ( not ( = ?auto_2660721 ?auto_2660724 ) ) ( not ( = ?auto_2660721 ?auto_2660723 ) ) ( not ( = ?auto_2660721 ?auto_2660725 ) ) ( not ( = ?auto_2660718 ?auto_2660722 ) ) ( not ( = ?auto_2660718 ?auto_2660724 ) ) ( not ( = ?auto_2660718 ?auto_2660723 ) ) ( not ( = ?auto_2660718 ?auto_2660725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660722 ?auto_2660724 ?auto_2660723 )
      ( MAKE-6CRATE-VERIFY ?auto_2660719 ?auto_2660720 ?auto_2660721 ?auto_2660718 ?auto_2660722 ?auto_2660724 ?auto_2660723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660783 - SURFACE
      ?auto_2660784 - SURFACE
      ?auto_2660785 - SURFACE
      ?auto_2660782 - SURFACE
      ?auto_2660786 - SURFACE
      ?auto_2660788 - SURFACE
      ?auto_2660787 - SURFACE
    )
    :vars
    (
      ?auto_2660790 - HOIST
      ?auto_2660792 - PLACE
      ?auto_2660794 - PLACE
      ?auto_2660791 - HOIST
      ?auto_2660789 - SURFACE
      ?auto_2660793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660790 ?auto_2660792 ) ( IS-CRATE ?auto_2660787 ) ( not ( = ?auto_2660788 ?auto_2660787 ) ) ( not ( = ?auto_2660786 ?auto_2660788 ) ) ( not ( = ?auto_2660786 ?auto_2660787 ) ) ( not ( = ?auto_2660794 ?auto_2660792 ) ) ( HOIST-AT ?auto_2660791 ?auto_2660794 ) ( not ( = ?auto_2660790 ?auto_2660791 ) ) ( AVAILABLE ?auto_2660791 ) ( SURFACE-AT ?auto_2660787 ?auto_2660794 ) ( ON ?auto_2660787 ?auto_2660789 ) ( CLEAR ?auto_2660787 ) ( not ( = ?auto_2660788 ?auto_2660789 ) ) ( not ( = ?auto_2660787 ?auto_2660789 ) ) ( not ( = ?auto_2660786 ?auto_2660789 ) ) ( TRUCK-AT ?auto_2660793 ?auto_2660792 ) ( SURFACE-AT ?auto_2660786 ?auto_2660792 ) ( CLEAR ?auto_2660786 ) ( LIFTING ?auto_2660790 ?auto_2660788 ) ( IS-CRATE ?auto_2660788 ) ( ON ?auto_2660784 ?auto_2660783 ) ( ON ?auto_2660785 ?auto_2660784 ) ( ON ?auto_2660782 ?auto_2660785 ) ( ON ?auto_2660786 ?auto_2660782 ) ( not ( = ?auto_2660783 ?auto_2660784 ) ) ( not ( = ?auto_2660783 ?auto_2660785 ) ) ( not ( = ?auto_2660783 ?auto_2660782 ) ) ( not ( = ?auto_2660783 ?auto_2660786 ) ) ( not ( = ?auto_2660783 ?auto_2660788 ) ) ( not ( = ?auto_2660783 ?auto_2660787 ) ) ( not ( = ?auto_2660783 ?auto_2660789 ) ) ( not ( = ?auto_2660784 ?auto_2660785 ) ) ( not ( = ?auto_2660784 ?auto_2660782 ) ) ( not ( = ?auto_2660784 ?auto_2660786 ) ) ( not ( = ?auto_2660784 ?auto_2660788 ) ) ( not ( = ?auto_2660784 ?auto_2660787 ) ) ( not ( = ?auto_2660784 ?auto_2660789 ) ) ( not ( = ?auto_2660785 ?auto_2660782 ) ) ( not ( = ?auto_2660785 ?auto_2660786 ) ) ( not ( = ?auto_2660785 ?auto_2660788 ) ) ( not ( = ?auto_2660785 ?auto_2660787 ) ) ( not ( = ?auto_2660785 ?auto_2660789 ) ) ( not ( = ?auto_2660782 ?auto_2660786 ) ) ( not ( = ?auto_2660782 ?auto_2660788 ) ) ( not ( = ?auto_2660782 ?auto_2660787 ) ) ( not ( = ?auto_2660782 ?auto_2660789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660786 ?auto_2660788 ?auto_2660787 )
      ( MAKE-6CRATE-VERIFY ?auto_2660783 ?auto_2660784 ?auto_2660785 ?auto_2660782 ?auto_2660786 ?auto_2660788 ?auto_2660787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660847 - SURFACE
      ?auto_2660848 - SURFACE
      ?auto_2660849 - SURFACE
      ?auto_2660846 - SURFACE
      ?auto_2660850 - SURFACE
      ?auto_2660852 - SURFACE
      ?auto_2660851 - SURFACE
    )
    :vars
    (
      ?auto_2660856 - HOIST
      ?auto_2660854 - PLACE
      ?auto_2660853 - PLACE
      ?auto_2660857 - HOIST
      ?auto_2660858 - SURFACE
      ?auto_2660855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660856 ?auto_2660854 ) ( IS-CRATE ?auto_2660851 ) ( not ( = ?auto_2660852 ?auto_2660851 ) ) ( not ( = ?auto_2660850 ?auto_2660852 ) ) ( not ( = ?auto_2660850 ?auto_2660851 ) ) ( not ( = ?auto_2660853 ?auto_2660854 ) ) ( HOIST-AT ?auto_2660857 ?auto_2660853 ) ( not ( = ?auto_2660856 ?auto_2660857 ) ) ( AVAILABLE ?auto_2660857 ) ( SURFACE-AT ?auto_2660851 ?auto_2660853 ) ( ON ?auto_2660851 ?auto_2660858 ) ( CLEAR ?auto_2660851 ) ( not ( = ?auto_2660852 ?auto_2660858 ) ) ( not ( = ?auto_2660851 ?auto_2660858 ) ) ( not ( = ?auto_2660850 ?auto_2660858 ) ) ( TRUCK-AT ?auto_2660855 ?auto_2660854 ) ( SURFACE-AT ?auto_2660850 ?auto_2660854 ) ( CLEAR ?auto_2660850 ) ( IS-CRATE ?auto_2660852 ) ( AVAILABLE ?auto_2660856 ) ( IN ?auto_2660852 ?auto_2660855 ) ( ON ?auto_2660848 ?auto_2660847 ) ( ON ?auto_2660849 ?auto_2660848 ) ( ON ?auto_2660846 ?auto_2660849 ) ( ON ?auto_2660850 ?auto_2660846 ) ( not ( = ?auto_2660847 ?auto_2660848 ) ) ( not ( = ?auto_2660847 ?auto_2660849 ) ) ( not ( = ?auto_2660847 ?auto_2660846 ) ) ( not ( = ?auto_2660847 ?auto_2660850 ) ) ( not ( = ?auto_2660847 ?auto_2660852 ) ) ( not ( = ?auto_2660847 ?auto_2660851 ) ) ( not ( = ?auto_2660847 ?auto_2660858 ) ) ( not ( = ?auto_2660848 ?auto_2660849 ) ) ( not ( = ?auto_2660848 ?auto_2660846 ) ) ( not ( = ?auto_2660848 ?auto_2660850 ) ) ( not ( = ?auto_2660848 ?auto_2660852 ) ) ( not ( = ?auto_2660848 ?auto_2660851 ) ) ( not ( = ?auto_2660848 ?auto_2660858 ) ) ( not ( = ?auto_2660849 ?auto_2660846 ) ) ( not ( = ?auto_2660849 ?auto_2660850 ) ) ( not ( = ?auto_2660849 ?auto_2660852 ) ) ( not ( = ?auto_2660849 ?auto_2660851 ) ) ( not ( = ?auto_2660849 ?auto_2660858 ) ) ( not ( = ?auto_2660846 ?auto_2660850 ) ) ( not ( = ?auto_2660846 ?auto_2660852 ) ) ( not ( = ?auto_2660846 ?auto_2660851 ) ) ( not ( = ?auto_2660846 ?auto_2660858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660850 ?auto_2660852 ?auto_2660851 )
      ( MAKE-6CRATE-VERIFY ?auto_2660847 ?auto_2660848 ?auto_2660849 ?auto_2660846 ?auto_2660850 ?auto_2660852 ?auto_2660851 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662803 - SURFACE
      ?auto_2662804 - SURFACE
      ?auto_2662805 - SURFACE
      ?auto_2662802 - SURFACE
      ?auto_2662806 - SURFACE
      ?auto_2662808 - SURFACE
      ?auto_2662807 - SURFACE
      ?auto_2662809 - SURFACE
    )
    :vars
    (
      ?auto_2662810 - HOIST
      ?auto_2662811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662810 ?auto_2662811 ) ( SURFACE-AT ?auto_2662807 ?auto_2662811 ) ( CLEAR ?auto_2662807 ) ( LIFTING ?auto_2662810 ?auto_2662809 ) ( IS-CRATE ?auto_2662809 ) ( not ( = ?auto_2662807 ?auto_2662809 ) ) ( ON ?auto_2662804 ?auto_2662803 ) ( ON ?auto_2662805 ?auto_2662804 ) ( ON ?auto_2662802 ?auto_2662805 ) ( ON ?auto_2662806 ?auto_2662802 ) ( ON ?auto_2662808 ?auto_2662806 ) ( ON ?auto_2662807 ?auto_2662808 ) ( not ( = ?auto_2662803 ?auto_2662804 ) ) ( not ( = ?auto_2662803 ?auto_2662805 ) ) ( not ( = ?auto_2662803 ?auto_2662802 ) ) ( not ( = ?auto_2662803 ?auto_2662806 ) ) ( not ( = ?auto_2662803 ?auto_2662808 ) ) ( not ( = ?auto_2662803 ?auto_2662807 ) ) ( not ( = ?auto_2662803 ?auto_2662809 ) ) ( not ( = ?auto_2662804 ?auto_2662805 ) ) ( not ( = ?auto_2662804 ?auto_2662802 ) ) ( not ( = ?auto_2662804 ?auto_2662806 ) ) ( not ( = ?auto_2662804 ?auto_2662808 ) ) ( not ( = ?auto_2662804 ?auto_2662807 ) ) ( not ( = ?auto_2662804 ?auto_2662809 ) ) ( not ( = ?auto_2662805 ?auto_2662802 ) ) ( not ( = ?auto_2662805 ?auto_2662806 ) ) ( not ( = ?auto_2662805 ?auto_2662808 ) ) ( not ( = ?auto_2662805 ?auto_2662807 ) ) ( not ( = ?auto_2662805 ?auto_2662809 ) ) ( not ( = ?auto_2662802 ?auto_2662806 ) ) ( not ( = ?auto_2662802 ?auto_2662808 ) ) ( not ( = ?auto_2662802 ?auto_2662807 ) ) ( not ( = ?auto_2662802 ?auto_2662809 ) ) ( not ( = ?auto_2662806 ?auto_2662808 ) ) ( not ( = ?auto_2662806 ?auto_2662807 ) ) ( not ( = ?auto_2662806 ?auto_2662809 ) ) ( not ( = ?auto_2662808 ?auto_2662807 ) ) ( not ( = ?auto_2662808 ?auto_2662809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2662807 ?auto_2662809 )
      ( MAKE-7CRATE-VERIFY ?auto_2662803 ?auto_2662804 ?auto_2662805 ?auto_2662802 ?auto_2662806 ?auto_2662808 ?auto_2662807 ?auto_2662809 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662858 - SURFACE
      ?auto_2662859 - SURFACE
      ?auto_2662860 - SURFACE
      ?auto_2662857 - SURFACE
      ?auto_2662861 - SURFACE
      ?auto_2662863 - SURFACE
      ?auto_2662862 - SURFACE
      ?auto_2662864 - SURFACE
    )
    :vars
    (
      ?auto_2662866 - HOIST
      ?auto_2662867 - PLACE
      ?auto_2662865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662866 ?auto_2662867 ) ( SURFACE-AT ?auto_2662862 ?auto_2662867 ) ( CLEAR ?auto_2662862 ) ( IS-CRATE ?auto_2662864 ) ( not ( = ?auto_2662862 ?auto_2662864 ) ) ( TRUCK-AT ?auto_2662865 ?auto_2662867 ) ( AVAILABLE ?auto_2662866 ) ( IN ?auto_2662864 ?auto_2662865 ) ( ON ?auto_2662862 ?auto_2662863 ) ( not ( = ?auto_2662863 ?auto_2662862 ) ) ( not ( = ?auto_2662863 ?auto_2662864 ) ) ( ON ?auto_2662859 ?auto_2662858 ) ( ON ?auto_2662860 ?auto_2662859 ) ( ON ?auto_2662857 ?auto_2662860 ) ( ON ?auto_2662861 ?auto_2662857 ) ( ON ?auto_2662863 ?auto_2662861 ) ( not ( = ?auto_2662858 ?auto_2662859 ) ) ( not ( = ?auto_2662858 ?auto_2662860 ) ) ( not ( = ?auto_2662858 ?auto_2662857 ) ) ( not ( = ?auto_2662858 ?auto_2662861 ) ) ( not ( = ?auto_2662858 ?auto_2662863 ) ) ( not ( = ?auto_2662858 ?auto_2662862 ) ) ( not ( = ?auto_2662858 ?auto_2662864 ) ) ( not ( = ?auto_2662859 ?auto_2662860 ) ) ( not ( = ?auto_2662859 ?auto_2662857 ) ) ( not ( = ?auto_2662859 ?auto_2662861 ) ) ( not ( = ?auto_2662859 ?auto_2662863 ) ) ( not ( = ?auto_2662859 ?auto_2662862 ) ) ( not ( = ?auto_2662859 ?auto_2662864 ) ) ( not ( = ?auto_2662860 ?auto_2662857 ) ) ( not ( = ?auto_2662860 ?auto_2662861 ) ) ( not ( = ?auto_2662860 ?auto_2662863 ) ) ( not ( = ?auto_2662860 ?auto_2662862 ) ) ( not ( = ?auto_2662860 ?auto_2662864 ) ) ( not ( = ?auto_2662857 ?auto_2662861 ) ) ( not ( = ?auto_2662857 ?auto_2662863 ) ) ( not ( = ?auto_2662857 ?auto_2662862 ) ) ( not ( = ?auto_2662857 ?auto_2662864 ) ) ( not ( = ?auto_2662861 ?auto_2662863 ) ) ( not ( = ?auto_2662861 ?auto_2662862 ) ) ( not ( = ?auto_2662861 ?auto_2662864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662863 ?auto_2662862 ?auto_2662864 )
      ( MAKE-7CRATE-VERIFY ?auto_2662858 ?auto_2662859 ?auto_2662860 ?auto_2662857 ?auto_2662861 ?auto_2662863 ?auto_2662862 ?auto_2662864 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662921 - SURFACE
      ?auto_2662922 - SURFACE
      ?auto_2662923 - SURFACE
      ?auto_2662920 - SURFACE
      ?auto_2662924 - SURFACE
      ?auto_2662926 - SURFACE
      ?auto_2662925 - SURFACE
      ?auto_2662927 - SURFACE
    )
    :vars
    (
      ?auto_2662929 - HOIST
      ?auto_2662928 - PLACE
      ?auto_2662931 - TRUCK
      ?auto_2662930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662929 ?auto_2662928 ) ( SURFACE-AT ?auto_2662925 ?auto_2662928 ) ( CLEAR ?auto_2662925 ) ( IS-CRATE ?auto_2662927 ) ( not ( = ?auto_2662925 ?auto_2662927 ) ) ( AVAILABLE ?auto_2662929 ) ( IN ?auto_2662927 ?auto_2662931 ) ( ON ?auto_2662925 ?auto_2662926 ) ( not ( = ?auto_2662926 ?auto_2662925 ) ) ( not ( = ?auto_2662926 ?auto_2662927 ) ) ( TRUCK-AT ?auto_2662931 ?auto_2662930 ) ( not ( = ?auto_2662930 ?auto_2662928 ) ) ( ON ?auto_2662922 ?auto_2662921 ) ( ON ?auto_2662923 ?auto_2662922 ) ( ON ?auto_2662920 ?auto_2662923 ) ( ON ?auto_2662924 ?auto_2662920 ) ( ON ?auto_2662926 ?auto_2662924 ) ( not ( = ?auto_2662921 ?auto_2662922 ) ) ( not ( = ?auto_2662921 ?auto_2662923 ) ) ( not ( = ?auto_2662921 ?auto_2662920 ) ) ( not ( = ?auto_2662921 ?auto_2662924 ) ) ( not ( = ?auto_2662921 ?auto_2662926 ) ) ( not ( = ?auto_2662921 ?auto_2662925 ) ) ( not ( = ?auto_2662921 ?auto_2662927 ) ) ( not ( = ?auto_2662922 ?auto_2662923 ) ) ( not ( = ?auto_2662922 ?auto_2662920 ) ) ( not ( = ?auto_2662922 ?auto_2662924 ) ) ( not ( = ?auto_2662922 ?auto_2662926 ) ) ( not ( = ?auto_2662922 ?auto_2662925 ) ) ( not ( = ?auto_2662922 ?auto_2662927 ) ) ( not ( = ?auto_2662923 ?auto_2662920 ) ) ( not ( = ?auto_2662923 ?auto_2662924 ) ) ( not ( = ?auto_2662923 ?auto_2662926 ) ) ( not ( = ?auto_2662923 ?auto_2662925 ) ) ( not ( = ?auto_2662923 ?auto_2662927 ) ) ( not ( = ?auto_2662920 ?auto_2662924 ) ) ( not ( = ?auto_2662920 ?auto_2662926 ) ) ( not ( = ?auto_2662920 ?auto_2662925 ) ) ( not ( = ?auto_2662920 ?auto_2662927 ) ) ( not ( = ?auto_2662924 ?auto_2662926 ) ) ( not ( = ?auto_2662924 ?auto_2662925 ) ) ( not ( = ?auto_2662924 ?auto_2662927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662926 ?auto_2662925 ?auto_2662927 )
      ( MAKE-7CRATE-VERIFY ?auto_2662921 ?auto_2662922 ?auto_2662923 ?auto_2662920 ?auto_2662924 ?auto_2662926 ?auto_2662925 ?auto_2662927 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662991 - SURFACE
      ?auto_2662992 - SURFACE
      ?auto_2662993 - SURFACE
      ?auto_2662990 - SURFACE
      ?auto_2662994 - SURFACE
      ?auto_2662996 - SURFACE
      ?auto_2662995 - SURFACE
      ?auto_2662997 - SURFACE
    )
    :vars
    (
      ?auto_2663000 - HOIST
      ?auto_2662999 - PLACE
      ?auto_2663001 - TRUCK
      ?auto_2663002 - PLACE
      ?auto_2662998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663000 ?auto_2662999 ) ( SURFACE-AT ?auto_2662995 ?auto_2662999 ) ( CLEAR ?auto_2662995 ) ( IS-CRATE ?auto_2662997 ) ( not ( = ?auto_2662995 ?auto_2662997 ) ) ( AVAILABLE ?auto_2663000 ) ( ON ?auto_2662995 ?auto_2662996 ) ( not ( = ?auto_2662996 ?auto_2662995 ) ) ( not ( = ?auto_2662996 ?auto_2662997 ) ) ( TRUCK-AT ?auto_2663001 ?auto_2663002 ) ( not ( = ?auto_2663002 ?auto_2662999 ) ) ( HOIST-AT ?auto_2662998 ?auto_2663002 ) ( LIFTING ?auto_2662998 ?auto_2662997 ) ( not ( = ?auto_2663000 ?auto_2662998 ) ) ( ON ?auto_2662992 ?auto_2662991 ) ( ON ?auto_2662993 ?auto_2662992 ) ( ON ?auto_2662990 ?auto_2662993 ) ( ON ?auto_2662994 ?auto_2662990 ) ( ON ?auto_2662996 ?auto_2662994 ) ( not ( = ?auto_2662991 ?auto_2662992 ) ) ( not ( = ?auto_2662991 ?auto_2662993 ) ) ( not ( = ?auto_2662991 ?auto_2662990 ) ) ( not ( = ?auto_2662991 ?auto_2662994 ) ) ( not ( = ?auto_2662991 ?auto_2662996 ) ) ( not ( = ?auto_2662991 ?auto_2662995 ) ) ( not ( = ?auto_2662991 ?auto_2662997 ) ) ( not ( = ?auto_2662992 ?auto_2662993 ) ) ( not ( = ?auto_2662992 ?auto_2662990 ) ) ( not ( = ?auto_2662992 ?auto_2662994 ) ) ( not ( = ?auto_2662992 ?auto_2662996 ) ) ( not ( = ?auto_2662992 ?auto_2662995 ) ) ( not ( = ?auto_2662992 ?auto_2662997 ) ) ( not ( = ?auto_2662993 ?auto_2662990 ) ) ( not ( = ?auto_2662993 ?auto_2662994 ) ) ( not ( = ?auto_2662993 ?auto_2662996 ) ) ( not ( = ?auto_2662993 ?auto_2662995 ) ) ( not ( = ?auto_2662993 ?auto_2662997 ) ) ( not ( = ?auto_2662990 ?auto_2662994 ) ) ( not ( = ?auto_2662990 ?auto_2662996 ) ) ( not ( = ?auto_2662990 ?auto_2662995 ) ) ( not ( = ?auto_2662990 ?auto_2662997 ) ) ( not ( = ?auto_2662994 ?auto_2662996 ) ) ( not ( = ?auto_2662994 ?auto_2662995 ) ) ( not ( = ?auto_2662994 ?auto_2662997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662996 ?auto_2662995 ?auto_2662997 )
      ( MAKE-7CRATE-VERIFY ?auto_2662991 ?auto_2662992 ?auto_2662993 ?auto_2662990 ?auto_2662994 ?auto_2662996 ?auto_2662995 ?auto_2662997 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2663068 - SURFACE
      ?auto_2663069 - SURFACE
      ?auto_2663070 - SURFACE
      ?auto_2663067 - SURFACE
      ?auto_2663071 - SURFACE
      ?auto_2663073 - SURFACE
      ?auto_2663072 - SURFACE
      ?auto_2663074 - SURFACE
    )
    :vars
    (
      ?auto_2663077 - HOIST
      ?auto_2663079 - PLACE
      ?auto_2663076 - TRUCK
      ?auto_2663075 - PLACE
      ?auto_2663080 - HOIST
      ?auto_2663078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663077 ?auto_2663079 ) ( SURFACE-AT ?auto_2663072 ?auto_2663079 ) ( CLEAR ?auto_2663072 ) ( IS-CRATE ?auto_2663074 ) ( not ( = ?auto_2663072 ?auto_2663074 ) ) ( AVAILABLE ?auto_2663077 ) ( ON ?auto_2663072 ?auto_2663073 ) ( not ( = ?auto_2663073 ?auto_2663072 ) ) ( not ( = ?auto_2663073 ?auto_2663074 ) ) ( TRUCK-AT ?auto_2663076 ?auto_2663075 ) ( not ( = ?auto_2663075 ?auto_2663079 ) ) ( HOIST-AT ?auto_2663080 ?auto_2663075 ) ( not ( = ?auto_2663077 ?auto_2663080 ) ) ( AVAILABLE ?auto_2663080 ) ( SURFACE-AT ?auto_2663074 ?auto_2663075 ) ( ON ?auto_2663074 ?auto_2663078 ) ( CLEAR ?auto_2663074 ) ( not ( = ?auto_2663072 ?auto_2663078 ) ) ( not ( = ?auto_2663074 ?auto_2663078 ) ) ( not ( = ?auto_2663073 ?auto_2663078 ) ) ( ON ?auto_2663069 ?auto_2663068 ) ( ON ?auto_2663070 ?auto_2663069 ) ( ON ?auto_2663067 ?auto_2663070 ) ( ON ?auto_2663071 ?auto_2663067 ) ( ON ?auto_2663073 ?auto_2663071 ) ( not ( = ?auto_2663068 ?auto_2663069 ) ) ( not ( = ?auto_2663068 ?auto_2663070 ) ) ( not ( = ?auto_2663068 ?auto_2663067 ) ) ( not ( = ?auto_2663068 ?auto_2663071 ) ) ( not ( = ?auto_2663068 ?auto_2663073 ) ) ( not ( = ?auto_2663068 ?auto_2663072 ) ) ( not ( = ?auto_2663068 ?auto_2663074 ) ) ( not ( = ?auto_2663068 ?auto_2663078 ) ) ( not ( = ?auto_2663069 ?auto_2663070 ) ) ( not ( = ?auto_2663069 ?auto_2663067 ) ) ( not ( = ?auto_2663069 ?auto_2663071 ) ) ( not ( = ?auto_2663069 ?auto_2663073 ) ) ( not ( = ?auto_2663069 ?auto_2663072 ) ) ( not ( = ?auto_2663069 ?auto_2663074 ) ) ( not ( = ?auto_2663069 ?auto_2663078 ) ) ( not ( = ?auto_2663070 ?auto_2663067 ) ) ( not ( = ?auto_2663070 ?auto_2663071 ) ) ( not ( = ?auto_2663070 ?auto_2663073 ) ) ( not ( = ?auto_2663070 ?auto_2663072 ) ) ( not ( = ?auto_2663070 ?auto_2663074 ) ) ( not ( = ?auto_2663070 ?auto_2663078 ) ) ( not ( = ?auto_2663067 ?auto_2663071 ) ) ( not ( = ?auto_2663067 ?auto_2663073 ) ) ( not ( = ?auto_2663067 ?auto_2663072 ) ) ( not ( = ?auto_2663067 ?auto_2663074 ) ) ( not ( = ?auto_2663067 ?auto_2663078 ) ) ( not ( = ?auto_2663071 ?auto_2663073 ) ) ( not ( = ?auto_2663071 ?auto_2663072 ) ) ( not ( = ?auto_2663071 ?auto_2663074 ) ) ( not ( = ?auto_2663071 ?auto_2663078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2663073 ?auto_2663072 ?auto_2663074 )
      ( MAKE-7CRATE-VERIFY ?auto_2663068 ?auto_2663069 ?auto_2663070 ?auto_2663067 ?auto_2663071 ?auto_2663073 ?auto_2663072 ?auto_2663074 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2663146 - SURFACE
      ?auto_2663147 - SURFACE
      ?auto_2663148 - SURFACE
      ?auto_2663145 - SURFACE
      ?auto_2663149 - SURFACE
      ?auto_2663151 - SURFACE
      ?auto_2663150 - SURFACE
      ?auto_2663152 - SURFACE
    )
    :vars
    (
      ?auto_2663153 - HOIST
      ?auto_2663156 - PLACE
      ?auto_2663154 - PLACE
      ?auto_2663155 - HOIST
      ?auto_2663157 - SURFACE
      ?auto_2663158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663153 ?auto_2663156 ) ( SURFACE-AT ?auto_2663150 ?auto_2663156 ) ( CLEAR ?auto_2663150 ) ( IS-CRATE ?auto_2663152 ) ( not ( = ?auto_2663150 ?auto_2663152 ) ) ( AVAILABLE ?auto_2663153 ) ( ON ?auto_2663150 ?auto_2663151 ) ( not ( = ?auto_2663151 ?auto_2663150 ) ) ( not ( = ?auto_2663151 ?auto_2663152 ) ) ( not ( = ?auto_2663154 ?auto_2663156 ) ) ( HOIST-AT ?auto_2663155 ?auto_2663154 ) ( not ( = ?auto_2663153 ?auto_2663155 ) ) ( AVAILABLE ?auto_2663155 ) ( SURFACE-AT ?auto_2663152 ?auto_2663154 ) ( ON ?auto_2663152 ?auto_2663157 ) ( CLEAR ?auto_2663152 ) ( not ( = ?auto_2663150 ?auto_2663157 ) ) ( not ( = ?auto_2663152 ?auto_2663157 ) ) ( not ( = ?auto_2663151 ?auto_2663157 ) ) ( TRUCK-AT ?auto_2663158 ?auto_2663156 ) ( ON ?auto_2663147 ?auto_2663146 ) ( ON ?auto_2663148 ?auto_2663147 ) ( ON ?auto_2663145 ?auto_2663148 ) ( ON ?auto_2663149 ?auto_2663145 ) ( ON ?auto_2663151 ?auto_2663149 ) ( not ( = ?auto_2663146 ?auto_2663147 ) ) ( not ( = ?auto_2663146 ?auto_2663148 ) ) ( not ( = ?auto_2663146 ?auto_2663145 ) ) ( not ( = ?auto_2663146 ?auto_2663149 ) ) ( not ( = ?auto_2663146 ?auto_2663151 ) ) ( not ( = ?auto_2663146 ?auto_2663150 ) ) ( not ( = ?auto_2663146 ?auto_2663152 ) ) ( not ( = ?auto_2663146 ?auto_2663157 ) ) ( not ( = ?auto_2663147 ?auto_2663148 ) ) ( not ( = ?auto_2663147 ?auto_2663145 ) ) ( not ( = ?auto_2663147 ?auto_2663149 ) ) ( not ( = ?auto_2663147 ?auto_2663151 ) ) ( not ( = ?auto_2663147 ?auto_2663150 ) ) ( not ( = ?auto_2663147 ?auto_2663152 ) ) ( not ( = ?auto_2663147 ?auto_2663157 ) ) ( not ( = ?auto_2663148 ?auto_2663145 ) ) ( not ( = ?auto_2663148 ?auto_2663149 ) ) ( not ( = ?auto_2663148 ?auto_2663151 ) ) ( not ( = ?auto_2663148 ?auto_2663150 ) ) ( not ( = ?auto_2663148 ?auto_2663152 ) ) ( not ( = ?auto_2663148 ?auto_2663157 ) ) ( not ( = ?auto_2663145 ?auto_2663149 ) ) ( not ( = ?auto_2663145 ?auto_2663151 ) ) ( not ( = ?auto_2663145 ?auto_2663150 ) ) ( not ( = ?auto_2663145 ?auto_2663152 ) ) ( not ( = ?auto_2663145 ?auto_2663157 ) ) ( not ( = ?auto_2663149 ?auto_2663151 ) ) ( not ( = ?auto_2663149 ?auto_2663150 ) ) ( not ( = ?auto_2663149 ?auto_2663152 ) ) ( not ( = ?auto_2663149 ?auto_2663157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2663151 ?auto_2663150 ?auto_2663152 )
      ( MAKE-7CRATE-VERIFY ?auto_2663146 ?auto_2663147 ?auto_2663148 ?auto_2663145 ?auto_2663149 ?auto_2663151 ?auto_2663150 ?auto_2663152 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2663224 - SURFACE
      ?auto_2663225 - SURFACE
      ?auto_2663226 - SURFACE
      ?auto_2663223 - SURFACE
      ?auto_2663227 - SURFACE
      ?auto_2663229 - SURFACE
      ?auto_2663228 - SURFACE
      ?auto_2663230 - SURFACE
    )
    :vars
    (
      ?auto_2663233 - HOIST
      ?auto_2663235 - PLACE
      ?auto_2663231 - PLACE
      ?auto_2663234 - HOIST
      ?auto_2663232 - SURFACE
      ?auto_2663236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663233 ?auto_2663235 ) ( IS-CRATE ?auto_2663230 ) ( not ( = ?auto_2663228 ?auto_2663230 ) ) ( not ( = ?auto_2663229 ?auto_2663228 ) ) ( not ( = ?auto_2663229 ?auto_2663230 ) ) ( not ( = ?auto_2663231 ?auto_2663235 ) ) ( HOIST-AT ?auto_2663234 ?auto_2663231 ) ( not ( = ?auto_2663233 ?auto_2663234 ) ) ( AVAILABLE ?auto_2663234 ) ( SURFACE-AT ?auto_2663230 ?auto_2663231 ) ( ON ?auto_2663230 ?auto_2663232 ) ( CLEAR ?auto_2663230 ) ( not ( = ?auto_2663228 ?auto_2663232 ) ) ( not ( = ?auto_2663230 ?auto_2663232 ) ) ( not ( = ?auto_2663229 ?auto_2663232 ) ) ( TRUCK-AT ?auto_2663236 ?auto_2663235 ) ( SURFACE-AT ?auto_2663229 ?auto_2663235 ) ( CLEAR ?auto_2663229 ) ( LIFTING ?auto_2663233 ?auto_2663228 ) ( IS-CRATE ?auto_2663228 ) ( ON ?auto_2663225 ?auto_2663224 ) ( ON ?auto_2663226 ?auto_2663225 ) ( ON ?auto_2663223 ?auto_2663226 ) ( ON ?auto_2663227 ?auto_2663223 ) ( ON ?auto_2663229 ?auto_2663227 ) ( not ( = ?auto_2663224 ?auto_2663225 ) ) ( not ( = ?auto_2663224 ?auto_2663226 ) ) ( not ( = ?auto_2663224 ?auto_2663223 ) ) ( not ( = ?auto_2663224 ?auto_2663227 ) ) ( not ( = ?auto_2663224 ?auto_2663229 ) ) ( not ( = ?auto_2663224 ?auto_2663228 ) ) ( not ( = ?auto_2663224 ?auto_2663230 ) ) ( not ( = ?auto_2663224 ?auto_2663232 ) ) ( not ( = ?auto_2663225 ?auto_2663226 ) ) ( not ( = ?auto_2663225 ?auto_2663223 ) ) ( not ( = ?auto_2663225 ?auto_2663227 ) ) ( not ( = ?auto_2663225 ?auto_2663229 ) ) ( not ( = ?auto_2663225 ?auto_2663228 ) ) ( not ( = ?auto_2663225 ?auto_2663230 ) ) ( not ( = ?auto_2663225 ?auto_2663232 ) ) ( not ( = ?auto_2663226 ?auto_2663223 ) ) ( not ( = ?auto_2663226 ?auto_2663227 ) ) ( not ( = ?auto_2663226 ?auto_2663229 ) ) ( not ( = ?auto_2663226 ?auto_2663228 ) ) ( not ( = ?auto_2663226 ?auto_2663230 ) ) ( not ( = ?auto_2663226 ?auto_2663232 ) ) ( not ( = ?auto_2663223 ?auto_2663227 ) ) ( not ( = ?auto_2663223 ?auto_2663229 ) ) ( not ( = ?auto_2663223 ?auto_2663228 ) ) ( not ( = ?auto_2663223 ?auto_2663230 ) ) ( not ( = ?auto_2663223 ?auto_2663232 ) ) ( not ( = ?auto_2663227 ?auto_2663229 ) ) ( not ( = ?auto_2663227 ?auto_2663228 ) ) ( not ( = ?auto_2663227 ?auto_2663230 ) ) ( not ( = ?auto_2663227 ?auto_2663232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2663229 ?auto_2663228 ?auto_2663230 )
      ( MAKE-7CRATE-VERIFY ?auto_2663224 ?auto_2663225 ?auto_2663226 ?auto_2663223 ?auto_2663227 ?auto_2663229 ?auto_2663228 ?auto_2663230 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2663302 - SURFACE
      ?auto_2663303 - SURFACE
      ?auto_2663304 - SURFACE
      ?auto_2663301 - SURFACE
      ?auto_2663305 - SURFACE
      ?auto_2663307 - SURFACE
      ?auto_2663306 - SURFACE
      ?auto_2663308 - SURFACE
    )
    :vars
    (
      ?auto_2663309 - HOIST
      ?auto_2663314 - PLACE
      ?auto_2663313 - PLACE
      ?auto_2663312 - HOIST
      ?auto_2663310 - SURFACE
      ?auto_2663311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2663309 ?auto_2663314 ) ( IS-CRATE ?auto_2663308 ) ( not ( = ?auto_2663306 ?auto_2663308 ) ) ( not ( = ?auto_2663307 ?auto_2663306 ) ) ( not ( = ?auto_2663307 ?auto_2663308 ) ) ( not ( = ?auto_2663313 ?auto_2663314 ) ) ( HOIST-AT ?auto_2663312 ?auto_2663313 ) ( not ( = ?auto_2663309 ?auto_2663312 ) ) ( AVAILABLE ?auto_2663312 ) ( SURFACE-AT ?auto_2663308 ?auto_2663313 ) ( ON ?auto_2663308 ?auto_2663310 ) ( CLEAR ?auto_2663308 ) ( not ( = ?auto_2663306 ?auto_2663310 ) ) ( not ( = ?auto_2663308 ?auto_2663310 ) ) ( not ( = ?auto_2663307 ?auto_2663310 ) ) ( TRUCK-AT ?auto_2663311 ?auto_2663314 ) ( SURFACE-AT ?auto_2663307 ?auto_2663314 ) ( CLEAR ?auto_2663307 ) ( IS-CRATE ?auto_2663306 ) ( AVAILABLE ?auto_2663309 ) ( IN ?auto_2663306 ?auto_2663311 ) ( ON ?auto_2663303 ?auto_2663302 ) ( ON ?auto_2663304 ?auto_2663303 ) ( ON ?auto_2663301 ?auto_2663304 ) ( ON ?auto_2663305 ?auto_2663301 ) ( ON ?auto_2663307 ?auto_2663305 ) ( not ( = ?auto_2663302 ?auto_2663303 ) ) ( not ( = ?auto_2663302 ?auto_2663304 ) ) ( not ( = ?auto_2663302 ?auto_2663301 ) ) ( not ( = ?auto_2663302 ?auto_2663305 ) ) ( not ( = ?auto_2663302 ?auto_2663307 ) ) ( not ( = ?auto_2663302 ?auto_2663306 ) ) ( not ( = ?auto_2663302 ?auto_2663308 ) ) ( not ( = ?auto_2663302 ?auto_2663310 ) ) ( not ( = ?auto_2663303 ?auto_2663304 ) ) ( not ( = ?auto_2663303 ?auto_2663301 ) ) ( not ( = ?auto_2663303 ?auto_2663305 ) ) ( not ( = ?auto_2663303 ?auto_2663307 ) ) ( not ( = ?auto_2663303 ?auto_2663306 ) ) ( not ( = ?auto_2663303 ?auto_2663308 ) ) ( not ( = ?auto_2663303 ?auto_2663310 ) ) ( not ( = ?auto_2663304 ?auto_2663301 ) ) ( not ( = ?auto_2663304 ?auto_2663305 ) ) ( not ( = ?auto_2663304 ?auto_2663307 ) ) ( not ( = ?auto_2663304 ?auto_2663306 ) ) ( not ( = ?auto_2663304 ?auto_2663308 ) ) ( not ( = ?auto_2663304 ?auto_2663310 ) ) ( not ( = ?auto_2663301 ?auto_2663305 ) ) ( not ( = ?auto_2663301 ?auto_2663307 ) ) ( not ( = ?auto_2663301 ?auto_2663306 ) ) ( not ( = ?auto_2663301 ?auto_2663308 ) ) ( not ( = ?auto_2663301 ?auto_2663310 ) ) ( not ( = ?auto_2663305 ?auto_2663307 ) ) ( not ( = ?auto_2663305 ?auto_2663306 ) ) ( not ( = ?auto_2663305 ?auto_2663308 ) ) ( not ( = ?auto_2663305 ?auto_2663310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2663307 ?auto_2663306 ?auto_2663308 )
      ( MAKE-7CRATE-VERIFY ?auto_2663302 ?auto_2663303 ?auto_2663304 ?auto_2663301 ?auto_2663305 ?auto_2663307 ?auto_2663306 ?auto_2663308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2665872 - SURFACE
      ?auto_2665873 - SURFACE
    )
    :vars
    (
      ?auto_2665874 - HOIST
      ?auto_2665878 - PLACE
      ?auto_2665879 - SURFACE
      ?auto_2665880 - TRUCK
      ?auto_2665875 - PLACE
      ?auto_2665877 - HOIST
      ?auto_2665876 - SURFACE
      ?auto_2665881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665874 ?auto_2665878 ) ( SURFACE-AT ?auto_2665872 ?auto_2665878 ) ( CLEAR ?auto_2665872 ) ( IS-CRATE ?auto_2665873 ) ( not ( = ?auto_2665872 ?auto_2665873 ) ) ( AVAILABLE ?auto_2665874 ) ( ON ?auto_2665872 ?auto_2665879 ) ( not ( = ?auto_2665879 ?auto_2665872 ) ) ( not ( = ?auto_2665879 ?auto_2665873 ) ) ( TRUCK-AT ?auto_2665880 ?auto_2665875 ) ( not ( = ?auto_2665875 ?auto_2665878 ) ) ( HOIST-AT ?auto_2665877 ?auto_2665875 ) ( not ( = ?auto_2665874 ?auto_2665877 ) ) ( SURFACE-AT ?auto_2665873 ?auto_2665875 ) ( ON ?auto_2665873 ?auto_2665876 ) ( CLEAR ?auto_2665873 ) ( not ( = ?auto_2665872 ?auto_2665876 ) ) ( not ( = ?auto_2665873 ?auto_2665876 ) ) ( not ( = ?auto_2665879 ?auto_2665876 ) ) ( LIFTING ?auto_2665877 ?auto_2665881 ) ( IS-CRATE ?auto_2665881 ) ( not ( = ?auto_2665872 ?auto_2665881 ) ) ( not ( = ?auto_2665873 ?auto_2665881 ) ) ( not ( = ?auto_2665879 ?auto_2665881 ) ) ( not ( = ?auto_2665876 ?auto_2665881 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2665877 ?auto_2665881 ?auto_2665880 ?auto_2665875 )
      ( MAKE-1CRATE ?auto_2665872 ?auto_2665873 )
      ( MAKE-1CRATE-VERIFY ?auto_2665872 ?auto_2665873 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666215 - SURFACE
      ?auto_2666216 - SURFACE
      ?auto_2666217 - SURFACE
      ?auto_2666214 - SURFACE
      ?auto_2666218 - SURFACE
      ?auto_2666220 - SURFACE
      ?auto_2666219 - SURFACE
      ?auto_2666221 - SURFACE
      ?auto_2666222 - SURFACE
    )
    :vars
    (
      ?auto_2666224 - HOIST
      ?auto_2666223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666224 ?auto_2666223 ) ( SURFACE-AT ?auto_2666221 ?auto_2666223 ) ( CLEAR ?auto_2666221 ) ( LIFTING ?auto_2666224 ?auto_2666222 ) ( IS-CRATE ?auto_2666222 ) ( not ( = ?auto_2666221 ?auto_2666222 ) ) ( ON ?auto_2666216 ?auto_2666215 ) ( ON ?auto_2666217 ?auto_2666216 ) ( ON ?auto_2666214 ?auto_2666217 ) ( ON ?auto_2666218 ?auto_2666214 ) ( ON ?auto_2666220 ?auto_2666218 ) ( ON ?auto_2666219 ?auto_2666220 ) ( ON ?auto_2666221 ?auto_2666219 ) ( not ( = ?auto_2666215 ?auto_2666216 ) ) ( not ( = ?auto_2666215 ?auto_2666217 ) ) ( not ( = ?auto_2666215 ?auto_2666214 ) ) ( not ( = ?auto_2666215 ?auto_2666218 ) ) ( not ( = ?auto_2666215 ?auto_2666220 ) ) ( not ( = ?auto_2666215 ?auto_2666219 ) ) ( not ( = ?auto_2666215 ?auto_2666221 ) ) ( not ( = ?auto_2666215 ?auto_2666222 ) ) ( not ( = ?auto_2666216 ?auto_2666217 ) ) ( not ( = ?auto_2666216 ?auto_2666214 ) ) ( not ( = ?auto_2666216 ?auto_2666218 ) ) ( not ( = ?auto_2666216 ?auto_2666220 ) ) ( not ( = ?auto_2666216 ?auto_2666219 ) ) ( not ( = ?auto_2666216 ?auto_2666221 ) ) ( not ( = ?auto_2666216 ?auto_2666222 ) ) ( not ( = ?auto_2666217 ?auto_2666214 ) ) ( not ( = ?auto_2666217 ?auto_2666218 ) ) ( not ( = ?auto_2666217 ?auto_2666220 ) ) ( not ( = ?auto_2666217 ?auto_2666219 ) ) ( not ( = ?auto_2666217 ?auto_2666221 ) ) ( not ( = ?auto_2666217 ?auto_2666222 ) ) ( not ( = ?auto_2666214 ?auto_2666218 ) ) ( not ( = ?auto_2666214 ?auto_2666220 ) ) ( not ( = ?auto_2666214 ?auto_2666219 ) ) ( not ( = ?auto_2666214 ?auto_2666221 ) ) ( not ( = ?auto_2666214 ?auto_2666222 ) ) ( not ( = ?auto_2666218 ?auto_2666220 ) ) ( not ( = ?auto_2666218 ?auto_2666219 ) ) ( not ( = ?auto_2666218 ?auto_2666221 ) ) ( not ( = ?auto_2666218 ?auto_2666222 ) ) ( not ( = ?auto_2666220 ?auto_2666219 ) ) ( not ( = ?auto_2666220 ?auto_2666221 ) ) ( not ( = ?auto_2666220 ?auto_2666222 ) ) ( not ( = ?auto_2666219 ?auto_2666221 ) ) ( not ( = ?auto_2666219 ?auto_2666222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2666221 ?auto_2666222 )
      ( MAKE-8CRATE-VERIFY ?auto_2666215 ?auto_2666216 ?auto_2666217 ?auto_2666214 ?auto_2666218 ?auto_2666220 ?auto_2666219 ?auto_2666221 ?auto_2666222 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666282 - SURFACE
      ?auto_2666283 - SURFACE
      ?auto_2666284 - SURFACE
      ?auto_2666281 - SURFACE
      ?auto_2666285 - SURFACE
      ?auto_2666287 - SURFACE
      ?auto_2666286 - SURFACE
      ?auto_2666288 - SURFACE
      ?auto_2666289 - SURFACE
    )
    :vars
    (
      ?auto_2666290 - HOIST
      ?auto_2666292 - PLACE
      ?auto_2666291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666290 ?auto_2666292 ) ( SURFACE-AT ?auto_2666288 ?auto_2666292 ) ( CLEAR ?auto_2666288 ) ( IS-CRATE ?auto_2666289 ) ( not ( = ?auto_2666288 ?auto_2666289 ) ) ( TRUCK-AT ?auto_2666291 ?auto_2666292 ) ( AVAILABLE ?auto_2666290 ) ( IN ?auto_2666289 ?auto_2666291 ) ( ON ?auto_2666288 ?auto_2666286 ) ( not ( = ?auto_2666286 ?auto_2666288 ) ) ( not ( = ?auto_2666286 ?auto_2666289 ) ) ( ON ?auto_2666283 ?auto_2666282 ) ( ON ?auto_2666284 ?auto_2666283 ) ( ON ?auto_2666281 ?auto_2666284 ) ( ON ?auto_2666285 ?auto_2666281 ) ( ON ?auto_2666287 ?auto_2666285 ) ( ON ?auto_2666286 ?auto_2666287 ) ( not ( = ?auto_2666282 ?auto_2666283 ) ) ( not ( = ?auto_2666282 ?auto_2666284 ) ) ( not ( = ?auto_2666282 ?auto_2666281 ) ) ( not ( = ?auto_2666282 ?auto_2666285 ) ) ( not ( = ?auto_2666282 ?auto_2666287 ) ) ( not ( = ?auto_2666282 ?auto_2666286 ) ) ( not ( = ?auto_2666282 ?auto_2666288 ) ) ( not ( = ?auto_2666282 ?auto_2666289 ) ) ( not ( = ?auto_2666283 ?auto_2666284 ) ) ( not ( = ?auto_2666283 ?auto_2666281 ) ) ( not ( = ?auto_2666283 ?auto_2666285 ) ) ( not ( = ?auto_2666283 ?auto_2666287 ) ) ( not ( = ?auto_2666283 ?auto_2666286 ) ) ( not ( = ?auto_2666283 ?auto_2666288 ) ) ( not ( = ?auto_2666283 ?auto_2666289 ) ) ( not ( = ?auto_2666284 ?auto_2666281 ) ) ( not ( = ?auto_2666284 ?auto_2666285 ) ) ( not ( = ?auto_2666284 ?auto_2666287 ) ) ( not ( = ?auto_2666284 ?auto_2666286 ) ) ( not ( = ?auto_2666284 ?auto_2666288 ) ) ( not ( = ?auto_2666284 ?auto_2666289 ) ) ( not ( = ?auto_2666281 ?auto_2666285 ) ) ( not ( = ?auto_2666281 ?auto_2666287 ) ) ( not ( = ?auto_2666281 ?auto_2666286 ) ) ( not ( = ?auto_2666281 ?auto_2666288 ) ) ( not ( = ?auto_2666281 ?auto_2666289 ) ) ( not ( = ?auto_2666285 ?auto_2666287 ) ) ( not ( = ?auto_2666285 ?auto_2666286 ) ) ( not ( = ?auto_2666285 ?auto_2666288 ) ) ( not ( = ?auto_2666285 ?auto_2666289 ) ) ( not ( = ?auto_2666287 ?auto_2666286 ) ) ( not ( = ?auto_2666287 ?auto_2666288 ) ) ( not ( = ?auto_2666287 ?auto_2666289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666286 ?auto_2666288 ?auto_2666289 )
      ( MAKE-8CRATE-VERIFY ?auto_2666282 ?auto_2666283 ?auto_2666284 ?auto_2666281 ?auto_2666285 ?auto_2666287 ?auto_2666286 ?auto_2666288 ?auto_2666289 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666358 - SURFACE
      ?auto_2666359 - SURFACE
      ?auto_2666360 - SURFACE
      ?auto_2666357 - SURFACE
      ?auto_2666361 - SURFACE
      ?auto_2666363 - SURFACE
      ?auto_2666362 - SURFACE
      ?auto_2666364 - SURFACE
      ?auto_2666365 - SURFACE
    )
    :vars
    (
      ?auto_2666367 - HOIST
      ?auto_2666366 - PLACE
      ?auto_2666369 - TRUCK
      ?auto_2666368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666367 ?auto_2666366 ) ( SURFACE-AT ?auto_2666364 ?auto_2666366 ) ( CLEAR ?auto_2666364 ) ( IS-CRATE ?auto_2666365 ) ( not ( = ?auto_2666364 ?auto_2666365 ) ) ( AVAILABLE ?auto_2666367 ) ( IN ?auto_2666365 ?auto_2666369 ) ( ON ?auto_2666364 ?auto_2666362 ) ( not ( = ?auto_2666362 ?auto_2666364 ) ) ( not ( = ?auto_2666362 ?auto_2666365 ) ) ( TRUCK-AT ?auto_2666369 ?auto_2666368 ) ( not ( = ?auto_2666368 ?auto_2666366 ) ) ( ON ?auto_2666359 ?auto_2666358 ) ( ON ?auto_2666360 ?auto_2666359 ) ( ON ?auto_2666357 ?auto_2666360 ) ( ON ?auto_2666361 ?auto_2666357 ) ( ON ?auto_2666363 ?auto_2666361 ) ( ON ?auto_2666362 ?auto_2666363 ) ( not ( = ?auto_2666358 ?auto_2666359 ) ) ( not ( = ?auto_2666358 ?auto_2666360 ) ) ( not ( = ?auto_2666358 ?auto_2666357 ) ) ( not ( = ?auto_2666358 ?auto_2666361 ) ) ( not ( = ?auto_2666358 ?auto_2666363 ) ) ( not ( = ?auto_2666358 ?auto_2666362 ) ) ( not ( = ?auto_2666358 ?auto_2666364 ) ) ( not ( = ?auto_2666358 ?auto_2666365 ) ) ( not ( = ?auto_2666359 ?auto_2666360 ) ) ( not ( = ?auto_2666359 ?auto_2666357 ) ) ( not ( = ?auto_2666359 ?auto_2666361 ) ) ( not ( = ?auto_2666359 ?auto_2666363 ) ) ( not ( = ?auto_2666359 ?auto_2666362 ) ) ( not ( = ?auto_2666359 ?auto_2666364 ) ) ( not ( = ?auto_2666359 ?auto_2666365 ) ) ( not ( = ?auto_2666360 ?auto_2666357 ) ) ( not ( = ?auto_2666360 ?auto_2666361 ) ) ( not ( = ?auto_2666360 ?auto_2666363 ) ) ( not ( = ?auto_2666360 ?auto_2666362 ) ) ( not ( = ?auto_2666360 ?auto_2666364 ) ) ( not ( = ?auto_2666360 ?auto_2666365 ) ) ( not ( = ?auto_2666357 ?auto_2666361 ) ) ( not ( = ?auto_2666357 ?auto_2666363 ) ) ( not ( = ?auto_2666357 ?auto_2666362 ) ) ( not ( = ?auto_2666357 ?auto_2666364 ) ) ( not ( = ?auto_2666357 ?auto_2666365 ) ) ( not ( = ?auto_2666361 ?auto_2666363 ) ) ( not ( = ?auto_2666361 ?auto_2666362 ) ) ( not ( = ?auto_2666361 ?auto_2666364 ) ) ( not ( = ?auto_2666361 ?auto_2666365 ) ) ( not ( = ?auto_2666363 ?auto_2666362 ) ) ( not ( = ?auto_2666363 ?auto_2666364 ) ) ( not ( = ?auto_2666363 ?auto_2666365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666362 ?auto_2666364 ?auto_2666365 )
      ( MAKE-8CRATE-VERIFY ?auto_2666358 ?auto_2666359 ?auto_2666360 ?auto_2666357 ?auto_2666361 ?auto_2666363 ?auto_2666362 ?auto_2666364 ?auto_2666365 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666442 - SURFACE
      ?auto_2666443 - SURFACE
      ?auto_2666444 - SURFACE
      ?auto_2666441 - SURFACE
      ?auto_2666445 - SURFACE
      ?auto_2666447 - SURFACE
      ?auto_2666446 - SURFACE
      ?auto_2666448 - SURFACE
      ?auto_2666449 - SURFACE
    )
    :vars
    (
      ?auto_2666452 - HOIST
      ?auto_2666453 - PLACE
      ?auto_2666454 - TRUCK
      ?auto_2666451 - PLACE
      ?auto_2666450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666452 ?auto_2666453 ) ( SURFACE-AT ?auto_2666448 ?auto_2666453 ) ( CLEAR ?auto_2666448 ) ( IS-CRATE ?auto_2666449 ) ( not ( = ?auto_2666448 ?auto_2666449 ) ) ( AVAILABLE ?auto_2666452 ) ( ON ?auto_2666448 ?auto_2666446 ) ( not ( = ?auto_2666446 ?auto_2666448 ) ) ( not ( = ?auto_2666446 ?auto_2666449 ) ) ( TRUCK-AT ?auto_2666454 ?auto_2666451 ) ( not ( = ?auto_2666451 ?auto_2666453 ) ) ( HOIST-AT ?auto_2666450 ?auto_2666451 ) ( LIFTING ?auto_2666450 ?auto_2666449 ) ( not ( = ?auto_2666452 ?auto_2666450 ) ) ( ON ?auto_2666443 ?auto_2666442 ) ( ON ?auto_2666444 ?auto_2666443 ) ( ON ?auto_2666441 ?auto_2666444 ) ( ON ?auto_2666445 ?auto_2666441 ) ( ON ?auto_2666447 ?auto_2666445 ) ( ON ?auto_2666446 ?auto_2666447 ) ( not ( = ?auto_2666442 ?auto_2666443 ) ) ( not ( = ?auto_2666442 ?auto_2666444 ) ) ( not ( = ?auto_2666442 ?auto_2666441 ) ) ( not ( = ?auto_2666442 ?auto_2666445 ) ) ( not ( = ?auto_2666442 ?auto_2666447 ) ) ( not ( = ?auto_2666442 ?auto_2666446 ) ) ( not ( = ?auto_2666442 ?auto_2666448 ) ) ( not ( = ?auto_2666442 ?auto_2666449 ) ) ( not ( = ?auto_2666443 ?auto_2666444 ) ) ( not ( = ?auto_2666443 ?auto_2666441 ) ) ( not ( = ?auto_2666443 ?auto_2666445 ) ) ( not ( = ?auto_2666443 ?auto_2666447 ) ) ( not ( = ?auto_2666443 ?auto_2666446 ) ) ( not ( = ?auto_2666443 ?auto_2666448 ) ) ( not ( = ?auto_2666443 ?auto_2666449 ) ) ( not ( = ?auto_2666444 ?auto_2666441 ) ) ( not ( = ?auto_2666444 ?auto_2666445 ) ) ( not ( = ?auto_2666444 ?auto_2666447 ) ) ( not ( = ?auto_2666444 ?auto_2666446 ) ) ( not ( = ?auto_2666444 ?auto_2666448 ) ) ( not ( = ?auto_2666444 ?auto_2666449 ) ) ( not ( = ?auto_2666441 ?auto_2666445 ) ) ( not ( = ?auto_2666441 ?auto_2666447 ) ) ( not ( = ?auto_2666441 ?auto_2666446 ) ) ( not ( = ?auto_2666441 ?auto_2666448 ) ) ( not ( = ?auto_2666441 ?auto_2666449 ) ) ( not ( = ?auto_2666445 ?auto_2666447 ) ) ( not ( = ?auto_2666445 ?auto_2666446 ) ) ( not ( = ?auto_2666445 ?auto_2666448 ) ) ( not ( = ?auto_2666445 ?auto_2666449 ) ) ( not ( = ?auto_2666447 ?auto_2666446 ) ) ( not ( = ?auto_2666447 ?auto_2666448 ) ) ( not ( = ?auto_2666447 ?auto_2666449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666446 ?auto_2666448 ?auto_2666449 )
      ( MAKE-8CRATE-VERIFY ?auto_2666442 ?auto_2666443 ?auto_2666444 ?auto_2666441 ?auto_2666445 ?auto_2666447 ?auto_2666446 ?auto_2666448 ?auto_2666449 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666534 - SURFACE
      ?auto_2666535 - SURFACE
      ?auto_2666536 - SURFACE
      ?auto_2666533 - SURFACE
      ?auto_2666537 - SURFACE
      ?auto_2666539 - SURFACE
      ?auto_2666538 - SURFACE
      ?auto_2666540 - SURFACE
      ?auto_2666541 - SURFACE
    )
    :vars
    (
      ?auto_2666547 - HOIST
      ?auto_2666546 - PLACE
      ?auto_2666542 - TRUCK
      ?auto_2666543 - PLACE
      ?auto_2666545 - HOIST
      ?auto_2666544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666547 ?auto_2666546 ) ( SURFACE-AT ?auto_2666540 ?auto_2666546 ) ( CLEAR ?auto_2666540 ) ( IS-CRATE ?auto_2666541 ) ( not ( = ?auto_2666540 ?auto_2666541 ) ) ( AVAILABLE ?auto_2666547 ) ( ON ?auto_2666540 ?auto_2666538 ) ( not ( = ?auto_2666538 ?auto_2666540 ) ) ( not ( = ?auto_2666538 ?auto_2666541 ) ) ( TRUCK-AT ?auto_2666542 ?auto_2666543 ) ( not ( = ?auto_2666543 ?auto_2666546 ) ) ( HOIST-AT ?auto_2666545 ?auto_2666543 ) ( not ( = ?auto_2666547 ?auto_2666545 ) ) ( AVAILABLE ?auto_2666545 ) ( SURFACE-AT ?auto_2666541 ?auto_2666543 ) ( ON ?auto_2666541 ?auto_2666544 ) ( CLEAR ?auto_2666541 ) ( not ( = ?auto_2666540 ?auto_2666544 ) ) ( not ( = ?auto_2666541 ?auto_2666544 ) ) ( not ( = ?auto_2666538 ?auto_2666544 ) ) ( ON ?auto_2666535 ?auto_2666534 ) ( ON ?auto_2666536 ?auto_2666535 ) ( ON ?auto_2666533 ?auto_2666536 ) ( ON ?auto_2666537 ?auto_2666533 ) ( ON ?auto_2666539 ?auto_2666537 ) ( ON ?auto_2666538 ?auto_2666539 ) ( not ( = ?auto_2666534 ?auto_2666535 ) ) ( not ( = ?auto_2666534 ?auto_2666536 ) ) ( not ( = ?auto_2666534 ?auto_2666533 ) ) ( not ( = ?auto_2666534 ?auto_2666537 ) ) ( not ( = ?auto_2666534 ?auto_2666539 ) ) ( not ( = ?auto_2666534 ?auto_2666538 ) ) ( not ( = ?auto_2666534 ?auto_2666540 ) ) ( not ( = ?auto_2666534 ?auto_2666541 ) ) ( not ( = ?auto_2666534 ?auto_2666544 ) ) ( not ( = ?auto_2666535 ?auto_2666536 ) ) ( not ( = ?auto_2666535 ?auto_2666533 ) ) ( not ( = ?auto_2666535 ?auto_2666537 ) ) ( not ( = ?auto_2666535 ?auto_2666539 ) ) ( not ( = ?auto_2666535 ?auto_2666538 ) ) ( not ( = ?auto_2666535 ?auto_2666540 ) ) ( not ( = ?auto_2666535 ?auto_2666541 ) ) ( not ( = ?auto_2666535 ?auto_2666544 ) ) ( not ( = ?auto_2666536 ?auto_2666533 ) ) ( not ( = ?auto_2666536 ?auto_2666537 ) ) ( not ( = ?auto_2666536 ?auto_2666539 ) ) ( not ( = ?auto_2666536 ?auto_2666538 ) ) ( not ( = ?auto_2666536 ?auto_2666540 ) ) ( not ( = ?auto_2666536 ?auto_2666541 ) ) ( not ( = ?auto_2666536 ?auto_2666544 ) ) ( not ( = ?auto_2666533 ?auto_2666537 ) ) ( not ( = ?auto_2666533 ?auto_2666539 ) ) ( not ( = ?auto_2666533 ?auto_2666538 ) ) ( not ( = ?auto_2666533 ?auto_2666540 ) ) ( not ( = ?auto_2666533 ?auto_2666541 ) ) ( not ( = ?auto_2666533 ?auto_2666544 ) ) ( not ( = ?auto_2666537 ?auto_2666539 ) ) ( not ( = ?auto_2666537 ?auto_2666538 ) ) ( not ( = ?auto_2666537 ?auto_2666540 ) ) ( not ( = ?auto_2666537 ?auto_2666541 ) ) ( not ( = ?auto_2666537 ?auto_2666544 ) ) ( not ( = ?auto_2666539 ?auto_2666538 ) ) ( not ( = ?auto_2666539 ?auto_2666540 ) ) ( not ( = ?auto_2666539 ?auto_2666541 ) ) ( not ( = ?auto_2666539 ?auto_2666544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666538 ?auto_2666540 ?auto_2666541 )
      ( MAKE-8CRATE-VERIFY ?auto_2666534 ?auto_2666535 ?auto_2666536 ?auto_2666533 ?auto_2666537 ?auto_2666539 ?auto_2666538 ?auto_2666540 ?auto_2666541 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666627 - SURFACE
      ?auto_2666628 - SURFACE
      ?auto_2666629 - SURFACE
      ?auto_2666626 - SURFACE
      ?auto_2666630 - SURFACE
      ?auto_2666632 - SURFACE
      ?auto_2666631 - SURFACE
      ?auto_2666633 - SURFACE
      ?auto_2666634 - SURFACE
    )
    :vars
    (
      ?auto_2666640 - HOIST
      ?auto_2666636 - PLACE
      ?auto_2666639 - PLACE
      ?auto_2666635 - HOIST
      ?auto_2666638 - SURFACE
      ?auto_2666637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666640 ?auto_2666636 ) ( SURFACE-AT ?auto_2666633 ?auto_2666636 ) ( CLEAR ?auto_2666633 ) ( IS-CRATE ?auto_2666634 ) ( not ( = ?auto_2666633 ?auto_2666634 ) ) ( AVAILABLE ?auto_2666640 ) ( ON ?auto_2666633 ?auto_2666631 ) ( not ( = ?auto_2666631 ?auto_2666633 ) ) ( not ( = ?auto_2666631 ?auto_2666634 ) ) ( not ( = ?auto_2666639 ?auto_2666636 ) ) ( HOIST-AT ?auto_2666635 ?auto_2666639 ) ( not ( = ?auto_2666640 ?auto_2666635 ) ) ( AVAILABLE ?auto_2666635 ) ( SURFACE-AT ?auto_2666634 ?auto_2666639 ) ( ON ?auto_2666634 ?auto_2666638 ) ( CLEAR ?auto_2666634 ) ( not ( = ?auto_2666633 ?auto_2666638 ) ) ( not ( = ?auto_2666634 ?auto_2666638 ) ) ( not ( = ?auto_2666631 ?auto_2666638 ) ) ( TRUCK-AT ?auto_2666637 ?auto_2666636 ) ( ON ?auto_2666628 ?auto_2666627 ) ( ON ?auto_2666629 ?auto_2666628 ) ( ON ?auto_2666626 ?auto_2666629 ) ( ON ?auto_2666630 ?auto_2666626 ) ( ON ?auto_2666632 ?auto_2666630 ) ( ON ?auto_2666631 ?auto_2666632 ) ( not ( = ?auto_2666627 ?auto_2666628 ) ) ( not ( = ?auto_2666627 ?auto_2666629 ) ) ( not ( = ?auto_2666627 ?auto_2666626 ) ) ( not ( = ?auto_2666627 ?auto_2666630 ) ) ( not ( = ?auto_2666627 ?auto_2666632 ) ) ( not ( = ?auto_2666627 ?auto_2666631 ) ) ( not ( = ?auto_2666627 ?auto_2666633 ) ) ( not ( = ?auto_2666627 ?auto_2666634 ) ) ( not ( = ?auto_2666627 ?auto_2666638 ) ) ( not ( = ?auto_2666628 ?auto_2666629 ) ) ( not ( = ?auto_2666628 ?auto_2666626 ) ) ( not ( = ?auto_2666628 ?auto_2666630 ) ) ( not ( = ?auto_2666628 ?auto_2666632 ) ) ( not ( = ?auto_2666628 ?auto_2666631 ) ) ( not ( = ?auto_2666628 ?auto_2666633 ) ) ( not ( = ?auto_2666628 ?auto_2666634 ) ) ( not ( = ?auto_2666628 ?auto_2666638 ) ) ( not ( = ?auto_2666629 ?auto_2666626 ) ) ( not ( = ?auto_2666629 ?auto_2666630 ) ) ( not ( = ?auto_2666629 ?auto_2666632 ) ) ( not ( = ?auto_2666629 ?auto_2666631 ) ) ( not ( = ?auto_2666629 ?auto_2666633 ) ) ( not ( = ?auto_2666629 ?auto_2666634 ) ) ( not ( = ?auto_2666629 ?auto_2666638 ) ) ( not ( = ?auto_2666626 ?auto_2666630 ) ) ( not ( = ?auto_2666626 ?auto_2666632 ) ) ( not ( = ?auto_2666626 ?auto_2666631 ) ) ( not ( = ?auto_2666626 ?auto_2666633 ) ) ( not ( = ?auto_2666626 ?auto_2666634 ) ) ( not ( = ?auto_2666626 ?auto_2666638 ) ) ( not ( = ?auto_2666630 ?auto_2666632 ) ) ( not ( = ?auto_2666630 ?auto_2666631 ) ) ( not ( = ?auto_2666630 ?auto_2666633 ) ) ( not ( = ?auto_2666630 ?auto_2666634 ) ) ( not ( = ?auto_2666630 ?auto_2666638 ) ) ( not ( = ?auto_2666632 ?auto_2666631 ) ) ( not ( = ?auto_2666632 ?auto_2666633 ) ) ( not ( = ?auto_2666632 ?auto_2666634 ) ) ( not ( = ?auto_2666632 ?auto_2666638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666631 ?auto_2666633 ?auto_2666634 )
      ( MAKE-8CRATE-VERIFY ?auto_2666627 ?auto_2666628 ?auto_2666629 ?auto_2666626 ?auto_2666630 ?auto_2666632 ?auto_2666631 ?auto_2666633 ?auto_2666634 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666720 - SURFACE
      ?auto_2666721 - SURFACE
      ?auto_2666722 - SURFACE
      ?auto_2666719 - SURFACE
      ?auto_2666723 - SURFACE
      ?auto_2666725 - SURFACE
      ?auto_2666724 - SURFACE
      ?auto_2666726 - SURFACE
      ?auto_2666727 - SURFACE
    )
    :vars
    (
      ?auto_2666730 - HOIST
      ?auto_2666732 - PLACE
      ?auto_2666729 - PLACE
      ?auto_2666733 - HOIST
      ?auto_2666728 - SURFACE
      ?auto_2666731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666730 ?auto_2666732 ) ( IS-CRATE ?auto_2666727 ) ( not ( = ?auto_2666726 ?auto_2666727 ) ) ( not ( = ?auto_2666724 ?auto_2666726 ) ) ( not ( = ?auto_2666724 ?auto_2666727 ) ) ( not ( = ?auto_2666729 ?auto_2666732 ) ) ( HOIST-AT ?auto_2666733 ?auto_2666729 ) ( not ( = ?auto_2666730 ?auto_2666733 ) ) ( AVAILABLE ?auto_2666733 ) ( SURFACE-AT ?auto_2666727 ?auto_2666729 ) ( ON ?auto_2666727 ?auto_2666728 ) ( CLEAR ?auto_2666727 ) ( not ( = ?auto_2666726 ?auto_2666728 ) ) ( not ( = ?auto_2666727 ?auto_2666728 ) ) ( not ( = ?auto_2666724 ?auto_2666728 ) ) ( TRUCK-AT ?auto_2666731 ?auto_2666732 ) ( SURFACE-AT ?auto_2666724 ?auto_2666732 ) ( CLEAR ?auto_2666724 ) ( LIFTING ?auto_2666730 ?auto_2666726 ) ( IS-CRATE ?auto_2666726 ) ( ON ?auto_2666721 ?auto_2666720 ) ( ON ?auto_2666722 ?auto_2666721 ) ( ON ?auto_2666719 ?auto_2666722 ) ( ON ?auto_2666723 ?auto_2666719 ) ( ON ?auto_2666725 ?auto_2666723 ) ( ON ?auto_2666724 ?auto_2666725 ) ( not ( = ?auto_2666720 ?auto_2666721 ) ) ( not ( = ?auto_2666720 ?auto_2666722 ) ) ( not ( = ?auto_2666720 ?auto_2666719 ) ) ( not ( = ?auto_2666720 ?auto_2666723 ) ) ( not ( = ?auto_2666720 ?auto_2666725 ) ) ( not ( = ?auto_2666720 ?auto_2666724 ) ) ( not ( = ?auto_2666720 ?auto_2666726 ) ) ( not ( = ?auto_2666720 ?auto_2666727 ) ) ( not ( = ?auto_2666720 ?auto_2666728 ) ) ( not ( = ?auto_2666721 ?auto_2666722 ) ) ( not ( = ?auto_2666721 ?auto_2666719 ) ) ( not ( = ?auto_2666721 ?auto_2666723 ) ) ( not ( = ?auto_2666721 ?auto_2666725 ) ) ( not ( = ?auto_2666721 ?auto_2666724 ) ) ( not ( = ?auto_2666721 ?auto_2666726 ) ) ( not ( = ?auto_2666721 ?auto_2666727 ) ) ( not ( = ?auto_2666721 ?auto_2666728 ) ) ( not ( = ?auto_2666722 ?auto_2666719 ) ) ( not ( = ?auto_2666722 ?auto_2666723 ) ) ( not ( = ?auto_2666722 ?auto_2666725 ) ) ( not ( = ?auto_2666722 ?auto_2666724 ) ) ( not ( = ?auto_2666722 ?auto_2666726 ) ) ( not ( = ?auto_2666722 ?auto_2666727 ) ) ( not ( = ?auto_2666722 ?auto_2666728 ) ) ( not ( = ?auto_2666719 ?auto_2666723 ) ) ( not ( = ?auto_2666719 ?auto_2666725 ) ) ( not ( = ?auto_2666719 ?auto_2666724 ) ) ( not ( = ?auto_2666719 ?auto_2666726 ) ) ( not ( = ?auto_2666719 ?auto_2666727 ) ) ( not ( = ?auto_2666719 ?auto_2666728 ) ) ( not ( = ?auto_2666723 ?auto_2666725 ) ) ( not ( = ?auto_2666723 ?auto_2666724 ) ) ( not ( = ?auto_2666723 ?auto_2666726 ) ) ( not ( = ?auto_2666723 ?auto_2666727 ) ) ( not ( = ?auto_2666723 ?auto_2666728 ) ) ( not ( = ?auto_2666725 ?auto_2666724 ) ) ( not ( = ?auto_2666725 ?auto_2666726 ) ) ( not ( = ?auto_2666725 ?auto_2666727 ) ) ( not ( = ?auto_2666725 ?auto_2666728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666724 ?auto_2666726 ?auto_2666727 )
      ( MAKE-8CRATE-VERIFY ?auto_2666720 ?auto_2666721 ?auto_2666722 ?auto_2666719 ?auto_2666723 ?auto_2666725 ?auto_2666724 ?auto_2666726 ?auto_2666727 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666813 - SURFACE
      ?auto_2666814 - SURFACE
      ?auto_2666815 - SURFACE
      ?auto_2666812 - SURFACE
      ?auto_2666816 - SURFACE
      ?auto_2666818 - SURFACE
      ?auto_2666817 - SURFACE
      ?auto_2666819 - SURFACE
      ?auto_2666820 - SURFACE
    )
    :vars
    (
      ?auto_2666821 - HOIST
      ?auto_2666822 - PLACE
      ?auto_2666826 - PLACE
      ?auto_2666825 - HOIST
      ?auto_2666824 - SURFACE
      ?auto_2666823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666821 ?auto_2666822 ) ( IS-CRATE ?auto_2666820 ) ( not ( = ?auto_2666819 ?auto_2666820 ) ) ( not ( = ?auto_2666817 ?auto_2666819 ) ) ( not ( = ?auto_2666817 ?auto_2666820 ) ) ( not ( = ?auto_2666826 ?auto_2666822 ) ) ( HOIST-AT ?auto_2666825 ?auto_2666826 ) ( not ( = ?auto_2666821 ?auto_2666825 ) ) ( AVAILABLE ?auto_2666825 ) ( SURFACE-AT ?auto_2666820 ?auto_2666826 ) ( ON ?auto_2666820 ?auto_2666824 ) ( CLEAR ?auto_2666820 ) ( not ( = ?auto_2666819 ?auto_2666824 ) ) ( not ( = ?auto_2666820 ?auto_2666824 ) ) ( not ( = ?auto_2666817 ?auto_2666824 ) ) ( TRUCK-AT ?auto_2666823 ?auto_2666822 ) ( SURFACE-AT ?auto_2666817 ?auto_2666822 ) ( CLEAR ?auto_2666817 ) ( IS-CRATE ?auto_2666819 ) ( AVAILABLE ?auto_2666821 ) ( IN ?auto_2666819 ?auto_2666823 ) ( ON ?auto_2666814 ?auto_2666813 ) ( ON ?auto_2666815 ?auto_2666814 ) ( ON ?auto_2666812 ?auto_2666815 ) ( ON ?auto_2666816 ?auto_2666812 ) ( ON ?auto_2666818 ?auto_2666816 ) ( ON ?auto_2666817 ?auto_2666818 ) ( not ( = ?auto_2666813 ?auto_2666814 ) ) ( not ( = ?auto_2666813 ?auto_2666815 ) ) ( not ( = ?auto_2666813 ?auto_2666812 ) ) ( not ( = ?auto_2666813 ?auto_2666816 ) ) ( not ( = ?auto_2666813 ?auto_2666818 ) ) ( not ( = ?auto_2666813 ?auto_2666817 ) ) ( not ( = ?auto_2666813 ?auto_2666819 ) ) ( not ( = ?auto_2666813 ?auto_2666820 ) ) ( not ( = ?auto_2666813 ?auto_2666824 ) ) ( not ( = ?auto_2666814 ?auto_2666815 ) ) ( not ( = ?auto_2666814 ?auto_2666812 ) ) ( not ( = ?auto_2666814 ?auto_2666816 ) ) ( not ( = ?auto_2666814 ?auto_2666818 ) ) ( not ( = ?auto_2666814 ?auto_2666817 ) ) ( not ( = ?auto_2666814 ?auto_2666819 ) ) ( not ( = ?auto_2666814 ?auto_2666820 ) ) ( not ( = ?auto_2666814 ?auto_2666824 ) ) ( not ( = ?auto_2666815 ?auto_2666812 ) ) ( not ( = ?auto_2666815 ?auto_2666816 ) ) ( not ( = ?auto_2666815 ?auto_2666818 ) ) ( not ( = ?auto_2666815 ?auto_2666817 ) ) ( not ( = ?auto_2666815 ?auto_2666819 ) ) ( not ( = ?auto_2666815 ?auto_2666820 ) ) ( not ( = ?auto_2666815 ?auto_2666824 ) ) ( not ( = ?auto_2666812 ?auto_2666816 ) ) ( not ( = ?auto_2666812 ?auto_2666818 ) ) ( not ( = ?auto_2666812 ?auto_2666817 ) ) ( not ( = ?auto_2666812 ?auto_2666819 ) ) ( not ( = ?auto_2666812 ?auto_2666820 ) ) ( not ( = ?auto_2666812 ?auto_2666824 ) ) ( not ( = ?auto_2666816 ?auto_2666818 ) ) ( not ( = ?auto_2666816 ?auto_2666817 ) ) ( not ( = ?auto_2666816 ?auto_2666819 ) ) ( not ( = ?auto_2666816 ?auto_2666820 ) ) ( not ( = ?auto_2666816 ?auto_2666824 ) ) ( not ( = ?auto_2666818 ?auto_2666817 ) ) ( not ( = ?auto_2666818 ?auto_2666819 ) ) ( not ( = ?auto_2666818 ?auto_2666820 ) ) ( not ( = ?auto_2666818 ?auto_2666824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666817 ?auto_2666819 ?auto_2666820 )
      ( MAKE-8CRATE-VERIFY ?auto_2666813 ?auto_2666814 ?auto_2666815 ?auto_2666812 ?auto_2666816 ?auto_2666818 ?auto_2666817 ?auto_2666819 ?auto_2666820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2670507 - SURFACE
      ?auto_2670508 - SURFACE
    )
    :vars
    (
      ?auto_2670515 - HOIST
      ?auto_2670514 - PLACE
      ?auto_2670512 - SURFACE
      ?auto_2670509 - PLACE
      ?auto_2670511 - HOIST
      ?auto_2670510 - SURFACE
      ?auto_2670513 - TRUCK
      ?auto_2670516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670515 ?auto_2670514 ) ( SURFACE-AT ?auto_2670507 ?auto_2670514 ) ( CLEAR ?auto_2670507 ) ( IS-CRATE ?auto_2670508 ) ( not ( = ?auto_2670507 ?auto_2670508 ) ) ( ON ?auto_2670507 ?auto_2670512 ) ( not ( = ?auto_2670512 ?auto_2670507 ) ) ( not ( = ?auto_2670512 ?auto_2670508 ) ) ( not ( = ?auto_2670509 ?auto_2670514 ) ) ( HOIST-AT ?auto_2670511 ?auto_2670509 ) ( not ( = ?auto_2670515 ?auto_2670511 ) ) ( AVAILABLE ?auto_2670511 ) ( SURFACE-AT ?auto_2670508 ?auto_2670509 ) ( ON ?auto_2670508 ?auto_2670510 ) ( CLEAR ?auto_2670508 ) ( not ( = ?auto_2670507 ?auto_2670510 ) ) ( not ( = ?auto_2670508 ?auto_2670510 ) ) ( not ( = ?auto_2670512 ?auto_2670510 ) ) ( TRUCK-AT ?auto_2670513 ?auto_2670514 ) ( LIFTING ?auto_2670515 ?auto_2670516 ) ( IS-CRATE ?auto_2670516 ) ( not ( = ?auto_2670507 ?auto_2670516 ) ) ( not ( = ?auto_2670508 ?auto_2670516 ) ) ( not ( = ?auto_2670512 ?auto_2670516 ) ) ( not ( = ?auto_2670510 ?auto_2670516 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2670515 ?auto_2670516 ?auto_2670513 ?auto_2670514 )
      ( MAKE-1CRATE ?auto_2670507 ?auto_2670508 )
      ( MAKE-1CRATE-VERIFY ?auto_2670507 ?auto_2670508 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670921 - SURFACE
      ?auto_2670922 - SURFACE
      ?auto_2670923 - SURFACE
      ?auto_2670920 - SURFACE
      ?auto_2670924 - SURFACE
      ?auto_2670926 - SURFACE
      ?auto_2670925 - SURFACE
      ?auto_2670927 - SURFACE
      ?auto_2670928 - SURFACE
      ?auto_2670929 - SURFACE
    )
    :vars
    (
      ?auto_2670931 - HOIST
      ?auto_2670930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670931 ?auto_2670930 ) ( SURFACE-AT ?auto_2670928 ?auto_2670930 ) ( CLEAR ?auto_2670928 ) ( LIFTING ?auto_2670931 ?auto_2670929 ) ( IS-CRATE ?auto_2670929 ) ( not ( = ?auto_2670928 ?auto_2670929 ) ) ( ON ?auto_2670922 ?auto_2670921 ) ( ON ?auto_2670923 ?auto_2670922 ) ( ON ?auto_2670920 ?auto_2670923 ) ( ON ?auto_2670924 ?auto_2670920 ) ( ON ?auto_2670926 ?auto_2670924 ) ( ON ?auto_2670925 ?auto_2670926 ) ( ON ?auto_2670927 ?auto_2670925 ) ( ON ?auto_2670928 ?auto_2670927 ) ( not ( = ?auto_2670921 ?auto_2670922 ) ) ( not ( = ?auto_2670921 ?auto_2670923 ) ) ( not ( = ?auto_2670921 ?auto_2670920 ) ) ( not ( = ?auto_2670921 ?auto_2670924 ) ) ( not ( = ?auto_2670921 ?auto_2670926 ) ) ( not ( = ?auto_2670921 ?auto_2670925 ) ) ( not ( = ?auto_2670921 ?auto_2670927 ) ) ( not ( = ?auto_2670921 ?auto_2670928 ) ) ( not ( = ?auto_2670921 ?auto_2670929 ) ) ( not ( = ?auto_2670922 ?auto_2670923 ) ) ( not ( = ?auto_2670922 ?auto_2670920 ) ) ( not ( = ?auto_2670922 ?auto_2670924 ) ) ( not ( = ?auto_2670922 ?auto_2670926 ) ) ( not ( = ?auto_2670922 ?auto_2670925 ) ) ( not ( = ?auto_2670922 ?auto_2670927 ) ) ( not ( = ?auto_2670922 ?auto_2670928 ) ) ( not ( = ?auto_2670922 ?auto_2670929 ) ) ( not ( = ?auto_2670923 ?auto_2670920 ) ) ( not ( = ?auto_2670923 ?auto_2670924 ) ) ( not ( = ?auto_2670923 ?auto_2670926 ) ) ( not ( = ?auto_2670923 ?auto_2670925 ) ) ( not ( = ?auto_2670923 ?auto_2670927 ) ) ( not ( = ?auto_2670923 ?auto_2670928 ) ) ( not ( = ?auto_2670923 ?auto_2670929 ) ) ( not ( = ?auto_2670920 ?auto_2670924 ) ) ( not ( = ?auto_2670920 ?auto_2670926 ) ) ( not ( = ?auto_2670920 ?auto_2670925 ) ) ( not ( = ?auto_2670920 ?auto_2670927 ) ) ( not ( = ?auto_2670920 ?auto_2670928 ) ) ( not ( = ?auto_2670920 ?auto_2670929 ) ) ( not ( = ?auto_2670924 ?auto_2670926 ) ) ( not ( = ?auto_2670924 ?auto_2670925 ) ) ( not ( = ?auto_2670924 ?auto_2670927 ) ) ( not ( = ?auto_2670924 ?auto_2670928 ) ) ( not ( = ?auto_2670924 ?auto_2670929 ) ) ( not ( = ?auto_2670926 ?auto_2670925 ) ) ( not ( = ?auto_2670926 ?auto_2670927 ) ) ( not ( = ?auto_2670926 ?auto_2670928 ) ) ( not ( = ?auto_2670926 ?auto_2670929 ) ) ( not ( = ?auto_2670925 ?auto_2670927 ) ) ( not ( = ?auto_2670925 ?auto_2670928 ) ) ( not ( = ?auto_2670925 ?auto_2670929 ) ) ( not ( = ?auto_2670927 ?auto_2670928 ) ) ( not ( = ?auto_2670927 ?auto_2670929 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2670928 ?auto_2670929 )
      ( MAKE-9CRATE-VERIFY ?auto_2670921 ?auto_2670922 ?auto_2670923 ?auto_2670920 ?auto_2670924 ?auto_2670926 ?auto_2670925 ?auto_2670927 ?auto_2670928 ?auto_2670929 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671001 - SURFACE
      ?auto_2671002 - SURFACE
      ?auto_2671003 - SURFACE
      ?auto_2671000 - SURFACE
      ?auto_2671004 - SURFACE
      ?auto_2671006 - SURFACE
      ?auto_2671005 - SURFACE
      ?auto_2671007 - SURFACE
      ?auto_2671008 - SURFACE
      ?auto_2671009 - SURFACE
    )
    :vars
    (
      ?auto_2671010 - HOIST
      ?auto_2671011 - PLACE
      ?auto_2671012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671010 ?auto_2671011 ) ( SURFACE-AT ?auto_2671008 ?auto_2671011 ) ( CLEAR ?auto_2671008 ) ( IS-CRATE ?auto_2671009 ) ( not ( = ?auto_2671008 ?auto_2671009 ) ) ( TRUCK-AT ?auto_2671012 ?auto_2671011 ) ( AVAILABLE ?auto_2671010 ) ( IN ?auto_2671009 ?auto_2671012 ) ( ON ?auto_2671008 ?auto_2671007 ) ( not ( = ?auto_2671007 ?auto_2671008 ) ) ( not ( = ?auto_2671007 ?auto_2671009 ) ) ( ON ?auto_2671002 ?auto_2671001 ) ( ON ?auto_2671003 ?auto_2671002 ) ( ON ?auto_2671000 ?auto_2671003 ) ( ON ?auto_2671004 ?auto_2671000 ) ( ON ?auto_2671006 ?auto_2671004 ) ( ON ?auto_2671005 ?auto_2671006 ) ( ON ?auto_2671007 ?auto_2671005 ) ( not ( = ?auto_2671001 ?auto_2671002 ) ) ( not ( = ?auto_2671001 ?auto_2671003 ) ) ( not ( = ?auto_2671001 ?auto_2671000 ) ) ( not ( = ?auto_2671001 ?auto_2671004 ) ) ( not ( = ?auto_2671001 ?auto_2671006 ) ) ( not ( = ?auto_2671001 ?auto_2671005 ) ) ( not ( = ?auto_2671001 ?auto_2671007 ) ) ( not ( = ?auto_2671001 ?auto_2671008 ) ) ( not ( = ?auto_2671001 ?auto_2671009 ) ) ( not ( = ?auto_2671002 ?auto_2671003 ) ) ( not ( = ?auto_2671002 ?auto_2671000 ) ) ( not ( = ?auto_2671002 ?auto_2671004 ) ) ( not ( = ?auto_2671002 ?auto_2671006 ) ) ( not ( = ?auto_2671002 ?auto_2671005 ) ) ( not ( = ?auto_2671002 ?auto_2671007 ) ) ( not ( = ?auto_2671002 ?auto_2671008 ) ) ( not ( = ?auto_2671002 ?auto_2671009 ) ) ( not ( = ?auto_2671003 ?auto_2671000 ) ) ( not ( = ?auto_2671003 ?auto_2671004 ) ) ( not ( = ?auto_2671003 ?auto_2671006 ) ) ( not ( = ?auto_2671003 ?auto_2671005 ) ) ( not ( = ?auto_2671003 ?auto_2671007 ) ) ( not ( = ?auto_2671003 ?auto_2671008 ) ) ( not ( = ?auto_2671003 ?auto_2671009 ) ) ( not ( = ?auto_2671000 ?auto_2671004 ) ) ( not ( = ?auto_2671000 ?auto_2671006 ) ) ( not ( = ?auto_2671000 ?auto_2671005 ) ) ( not ( = ?auto_2671000 ?auto_2671007 ) ) ( not ( = ?auto_2671000 ?auto_2671008 ) ) ( not ( = ?auto_2671000 ?auto_2671009 ) ) ( not ( = ?auto_2671004 ?auto_2671006 ) ) ( not ( = ?auto_2671004 ?auto_2671005 ) ) ( not ( = ?auto_2671004 ?auto_2671007 ) ) ( not ( = ?auto_2671004 ?auto_2671008 ) ) ( not ( = ?auto_2671004 ?auto_2671009 ) ) ( not ( = ?auto_2671006 ?auto_2671005 ) ) ( not ( = ?auto_2671006 ?auto_2671007 ) ) ( not ( = ?auto_2671006 ?auto_2671008 ) ) ( not ( = ?auto_2671006 ?auto_2671009 ) ) ( not ( = ?auto_2671005 ?auto_2671007 ) ) ( not ( = ?auto_2671005 ?auto_2671008 ) ) ( not ( = ?auto_2671005 ?auto_2671009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671007 ?auto_2671008 ?auto_2671009 )
      ( MAKE-9CRATE-VERIFY ?auto_2671001 ?auto_2671002 ?auto_2671003 ?auto_2671000 ?auto_2671004 ?auto_2671006 ?auto_2671005 ?auto_2671007 ?auto_2671008 ?auto_2671009 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671091 - SURFACE
      ?auto_2671092 - SURFACE
      ?auto_2671093 - SURFACE
      ?auto_2671090 - SURFACE
      ?auto_2671094 - SURFACE
      ?auto_2671096 - SURFACE
      ?auto_2671095 - SURFACE
      ?auto_2671097 - SURFACE
      ?auto_2671098 - SURFACE
      ?auto_2671099 - SURFACE
    )
    :vars
    (
      ?auto_2671103 - HOIST
      ?auto_2671102 - PLACE
      ?auto_2671101 - TRUCK
      ?auto_2671100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671103 ?auto_2671102 ) ( SURFACE-AT ?auto_2671098 ?auto_2671102 ) ( CLEAR ?auto_2671098 ) ( IS-CRATE ?auto_2671099 ) ( not ( = ?auto_2671098 ?auto_2671099 ) ) ( AVAILABLE ?auto_2671103 ) ( IN ?auto_2671099 ?auto_2671101 ) ( ON ?auto_2671098 ?auto_2671097 ) ( not ( = ?auto_2671097 ?auto_2671098 ) ) ( not ( = ?auto_2671097 ?auto_2671099 ) ) ( TRUCK-AT ?auto_2671101 ?auto_2671100 ) ( not ( = ?auto_2671100 ?auto_2671102 ) ) ( ON ?auto_2671092 ?auto_2671091 ) ( ON ?auto_2671093 ?auto_2671092 ) ( ON ?auto_2671090 ?auto_2671093 ) ( ON ?auto_2671094 ?auto_2671090 ) ( ON ?auto_2671096 ?auto_2671094 ) ( ON ?auto_2671095 ?auto_2671096 ) ( ON ?auto_2671097 ?auto_2671095 ) ( not ( = ?auto_2671091 ?auto_2671092 ) ) ( not ( = ?auto_2671091 ?auto_2671093 ) ) ( not ( = ?auto_2671091 ?auto_2671090 ) ) ( not ( = ?auto_2671091 ?auto_2671094 ) ) ( not ( = ?auto_2671091 ?auto_2671096 ) ) ( not ( = ?auto_2671091 ?auto_2671095 ) ) ( not ( = ?auto_2671091 ?auto_2671097 ) ) ( not ( = ?auto_2671091 ?auto_2671098 ) ) ( not ( = ?auto_2671091 ?auto_2671099 ) ) ( not ( = ?auto_2671092 ?auto_2671093 ) ) ( not ( = ?auto_2671092 ?auto_2671090 ) ) ( not ( = ?auto_2671092 ?auto_2671094 ) ) ( not ( = ?auto_2671092 ?auto_2671096 ) ) ( not ( = ?auto_2671092 ?auto_2671095 ) ) ( not ( = ?auto_2671092 ?auto_2671097 ) ) ( not ( = ?auto_2671092 ?auto_2671098 ) ) ( not ( = ?auto_2671092 ?auto_2671099 ) ) ( not ( = ?auto_2671093 ?auto_2671090 ) ) ( not ( = ?auto_2671093 ?auto_2671094 ) ) ( not ( = ?auto_2671093 ?auto_2671096 ) ) ( not ( = ?auto_2671093 ?auto_2671095 ) ) ( not ( = ?auto_2671093 ?auto_2671097 ) ) ( not ( = ?auto_2671093 ?auto_2671098 ) ) ( not ( = ?auto_2671093 ?auto_2671099 ) ) ( not ( = ?auto_2671090 ?auto_2671094 ) ) ( not ( = ?auto_2671090 ?auto_2671096 ) ) ( not ( = ?auto_2671090 ?auto_2671095 ) ) ( not ( = ?auto_2671090 ?auto_2671097 ) ) ( not ( = ?auto_2671090 ?auto_2671098 ) ) ( not ( = ?auto_2671090 ?auto_2671099 ) ) ( not ( = ?auto_2671094 ?auto_2671096 ) ) ( not ( = ?auto_2671094 ?auto_2671095 ) ) ( not ( = ?auto_2671094 ?auto_2671097 ) ) ( not ( = ?auto_2671094 ?auto_2671098 ) ) ( not ( = ?auto_2671094 ?auto_2671099 ) ) ( not ( = ?auto_2671096 ?auto_2671095 ) ) ( not ( = ?auto_2671096 ?auto_2671097 ) ) ( not ( = ?auto_2671096 ?auto_2671098 ) ) ( not ( = ?auto_2671096 ?auto_2671099 ) ) ( not ( = ?auto_2671095 ?auto_2671097 ) ) ( not ( = ?auto_2671095 ?auto_2671098 ) ) ( not ( = ?auto_2671095 ?auto_2671099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671097 ?auto_2671098 ?auto_2671099 )
      ( MAKE-9CRATE-VERIFY ?auto_2671091 ?auto_2671092 ?auto_2671093 ?auto_2671090 ?auto_2671094 ?auto_2671096 ?auto_2671095 ?auto_2671097 ?auto_2671098 ?auto_2671099 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671190 - SURFACE
      ?auto_2671191 - SURFACE
      ?auto_2671192 - SURFACE
      ?auto_2671189 - SURFACE
      ?auto_2671193 - SURFACE
      ?auto_2671195 - SURFACE
      ?auto_2671194 - SURFACE
      ?auto_2671196 - SURFACE
      ?auto_2671197 - SURFACE
      ?auto_2671198 - SURFACE
    )
    :vars
    (
      ?auto_2671199 - HOIST
      ?auto_2671203 - PLACE
      ?auto_2671201 - TRUCK
      ?auto_2671200 - PLACE
      ?auto_2671202 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671199 ?auto_2671203 ) ( SURFACE-AT ?auto_2671197 ?auto_2671203 ) ( CLEAR ?auto_2671197 ) ( IS-CRATE ?auto_2671198 ) ( not ( = ?auto_2671197 ?auto_2671198 ) ) ( AVAILABLE ?auto_2671199 ) ( ON ?auto_2671197 ?auto_2671196 ) ( not ( = ?auto_2671196 ?auto_2671197 ) ) ( not ( = ?auto_2671196 ?auto_2671198 ) ) ( TRUCK-AT ?auto_2671201 ?auto_2671200 ) ( not ( = ?auto_2671200 ?auto_2671203 ) ) ( HOIST-AT ?auto_2671202 ?auto_2671200 ) ( LIFTING ?auto_2671202 ?auto_2671198 ) ( not ( = ?auto_2671199 ?auto_2671202 ) ) ( ON ?auto_2671191 ?auto_2671190 ) ( ON ?auto_2671192 ?auto_2671191 ) ( ON ?auto_2671189 ?auto_2671192 ) ( ON ?auto_2671193 ?auto_2671189 ) ( ON ?auto_2671195 ?auto_2671193 ) ( ON ?auto_2671194 ?auto_2671195 ) ( ON ?auto_2671196 ?auto_2671194 ) ( not ( = ?auto_2671190 ?auto_2671191 ) ) ( not ( = ?auto_2671190 ?auto_2671192 ) ) ( not ( = ?auto_2671190 ?auto_2671189 ) ) ( not ( = ?auto_2671190 ?auto_2671193 ) ) ( not ( = ?auto_2671190 ?auto_2671195 ) ) ( not ( = ?auto_2671190 ?auto_2671194 ) ) ( not ( = ?auto_2671190 ?auto_2671196 ) ) ( not ( = ?auto_2671190 ?auto_2671197 ) ) ( not ( = ?auto_2671190 ?auto_2671198 ) ) ( not ( = ?auto_2671191 ?auto_2671192 ) ) ( not ( = ?auto_2671191 ?auto_2671189 ) ) ( not ( = ?auto_2671191 ?auto_2671193 ) ) ( not ( = ?auto_2671191 ?auto_2671195 ) ) ( not ( = ?auto_2671191 ?auto_2671194 ) ) ( not ( = ?auto_2671191 ?auto_2671196 ) ) ( not ( = ?auto_2671191 ?auto_2671197 ) ) ( not ( = ?auto_2671191 ?auto_2671198 ) ) ( not ( = ?auto_2671192 ?auto_2671189 ) ) ( not ( = ?auto_2671192 ?auto_2671193 ) ) ( not ( = ?auto_2671192 ?auto_2671195 ) ) ( not ( = ?auto_2671192 ?auto_2671194 ) ) ( not ( = ?auto_2671192 ?auto_2671196 ) ) ( not ( = ?auto_2671192 ?auto_2671197 ) ) ( not ( = ?auto_2671192 ?auto_2671198 ) ) ( not ( = ?auto_2671189 ?auto_2671193 ) ) ( not ( = ?auto_2671189 ?auto_2671195 ) ) ( not ( = ?auto_2671189 ?auto_2671194 ) ) ( not ( = ?auto_2671189 ?auto_2671196 ) ) ( not ( = ?auto_2671189 ?auto_2671197 ) ) ( not ( = ?auto_2671189 ?auto_2671198 ) ) ( not ( = ?auto_2671193 ?auto_2671195 ) ) ( not ( = ?auto_2671193 ?auto_2671194 ) ) ( not ( = ?auto_2671193 ?auto_2671196 ) ) ( not ( = ?auto_2671193 ?auto_2671197 ) ) ( not ( = ?auto_2671193 ?auto_2671198 ) ) ( not ( = ?auto_2671195 ?auto_2671194 ) ) ( not ( = ?auto_2671195 ?auto_2671196 ) ) ( not ( = ?auto_2671195 ?auto_2671197 ) ) ( not ( = ?auto_2671195 ?auto_2671198 ) ) ( not ( = ?auto_2671194 ?auto_2671196 ) ) ( not ( = ?auto_2671194 ?auto_2671197 ) ) ( not ( = ?auto_2671194 ?auto_2671198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671196 ?auto_2671197 ?auto_2671198 )
      ( MAKE-9CRATE-VERIFY ?auto_2671190 ?auto_2671191 ?auto_2671192 ?auto_2671189 ?auto_2671193 ?auto_2671195 ?auto_2671194 ?auto_2671196 ?auto_2671197 ?auto_2671198 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671298 - SURFACE
      ?auto_2671299 - SURFACE
      ?auto_2671300 - SURFACE
      ?auto_2671297 - SURFACE
      ?auto_2671301 - SURFACE
      ?auto_2671303 - SURFACE
      ?auto_2671302 - SURFACE
      ?auto_2671304 - SURFACE
      ?auto_2671305 - SURFACE
      ?auto_2671306 - SURFACE
    )
    :vars
    (
      ?auto_2671307 - HOIST
      ?auto_2671312 - PLACE
      ?auto_2671311 - TRUCK
      ?auto_2671310 - PLACE
      ?auto_2671309 - HOIST
      ?auto_2671308 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671307 ?auto_2671312 ) ( SURFACE-AT ?auto_2671305 ?auto_2671312 ) ( CLEAR ?auto_2671305 ) ( IS-CRATE ?auto_2671306 ) ( not ( = ?auto_2671305 ?auto_2671306 ) ) ( AVAILABLE ?auto_2671307 ) ( ON ?auto_2671305 ?auto_2671304 ) ( not ( = ?auto_2671304 ?auto_2671305 ) ) ( not ( = ?auto_2671304 ?auto_2671306 ) ) ( TRUCK-AT ?auto_2671311 ?auto_2671310 ) ( not ( = ?auto_2671310 ?auto_2671312 ) ) ( HOIST-AT ?auto_2671309 ?auto_2671310 ) ( not ( = ?auto_2671307 ?auto_2671309 ) ) ( AVAILABLE ?auto_2671309 ) ( SURFACE-AT ?auto_2671306 ?auto_2671310 ) ( ON ?auto_2671306 ?auto_2671308 ) ( CLEAR ?auto_2671306 ) ( not ( = ?auto_2671305 ?auto_2671308 ) ) ( not ( = ?auto_2671306 ?auto_2671308 ) ) ( not ( = ?auto_2671304 ?auto_2671308 ) ) ( ON ?auto_2671299 ?auto_2671298 ) ( ON ?auto_2671300 ?auto_2671299 ) ( ON ?auto_2671297 ?auto_2671300 ) ( ON ?auto_2671301 ?auto_2671297 ) ( ON ?auto_2671303 ?auto_2671301 ) ( ON ?auto_2671302 ?auto_2671303 ) ( ON ?auto_2671304 ?auto_2671302 ) ( not ( = ?auto_2671298 ?auto_2671299 ) ) ( not ( = ?auto_2671298 ?auto_2671300 ) ) ( not ( = ?auto_2671298 ?auto_2671297 ) ) ( not ( = ?auto_2671298 ?auto_2671301 ) ) ( not ( = ?auto_2671298 ?auto_2671303 ) ) ( not ( = ?auto_2671298 ?auto_2671302 ) ) ( not ( = ?auto_2671298 ?auto_2671304 ) ) ( not ( = ?auto_2671298 ?auto_2671305 ) ) ( not ( = ?auto_2671298 ?auto_2671306 ) ) ( not ( = ?auto_2671298 ?auto_2671308 ) ) ( not ( = ?auto_2671299 ?auto_2671300 ) ) ( not ( = ?auto_2671299 ?auto_2671297 ) ) ( not ( = ?auto_2671299 ?auto_2671301 ) ) ( not ( = ?auto_2671299 ?auto_2671303 ) ) ( not ( = ?auto_2671299 ?auto_2671302 ) ) ( not ( = ?auto_2671299 ?auto_2671304 ) ) ( not ( = ?auto_2671299 ?auto_2671305 ) ) ( not ( = ?auto_2671299 ?auto_2671306 ) ) ( not ( = ?auto_2671299 ?auto_2671308 ) ) ( not ( = ?auto_2671300 ?auto_2671297 ) ) ( not ( = ?auto_2671300 ?auto_2671301 ) ) ( not ( = ?auto_2671300 ?auto_2671303 ) ) ( not ( = ?auto_2671300 ?auto_2671302 ) ) ( not ( = ?auto_2671300 ?auto_2671304 ) ) ( not ( = ?auto_2671300 ?auto_2671305 ) ) ( not ( = ?auto_2671300 ?auto_2671306 ) ) ( not ( = ?auto_2671300 ?auto_2671308 ) ) ( not ( = ?auto_2671297 ?auto_2671301 ) ) ( not ( = ?auto_2671297 ?auto_2671303 ) ) ( not ( = ?auto_2671297 ?auto_2671302 ) ) ( not ( = ?auto_2671297 ?auto_2671304 ) ) ( not ( = ?auto_2671297 ?auto_2671305 ) ) ( not ( = ?auto_2671297 ?auto_2671306 ) ) ( not ( = ?auto_2671297 ?auto_2671308 ) ) ( not ( = ?auto_2671301 ?auto_2671303 ) ) ( not ( = ?auto_2671301 ?auto_2671302 ) ) ( not ( = ?auto_2671301 ?auto_2671304 ) ) ( not ( = ?auto_2671301 ?auto_2671305 ) ) ( not ( = ?auto_2671301 ?auto_2671306 ) ) ( not ( = ?auto_2671301 ?auto_2671308 ) ) ( not ( = ?auto_2671303 ?auto_2671302 ) ) ( not ( = ?auto_2671303 ?auto_2671304 ) ) ( not ( = ?auto_2671303 ?auto_2671305 ) ) ( not ( = ?auto_2671303 ?auto_2671306 ) ) ( not ( = ?auto_2671303 ?auto_2671308 ) ) ( not ( = ?auto_2671302 ?auto_2671304 ) ) ( not ( = ?auto_2671302 ?auto_2671305 ) ) ( not ( = ?auto_2671302 ?auto_2671306 ) ) ( not ( = ?auto_2671302 ?auto_2671308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671304 ?auto_2671305 ?auto_2671306 )
      ( MAKE-9CRATE-VERIFY ?auto_2671298 ?auto_2671299 ?auto_2671300 ?auto_2671297 ?auto_2671301 ?auto_2671303 ?auto_2671302 ?auto_2671304 ?auto_2671305 ?auto_2671306 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671407 - SURFACE
      ?auto_2671408 - SURFACE
      ?auto_2671409 - SURFACE
      ?auto_2671406 - SURFACE
      ?auto_2671410 - SURFACE
      ?auto_2671412 - SURFACE
      ?auto_2671411 - SURFACE
      ?auto_2671413 - SURFACE
      ?auto_2671414 - SURFACE
      ?auto_2671415 - SURFACE
    )
    :vars
    (
      ?auto_2671418 - HOIST
      ?auto_2671419 - PLACE
      ?auto_2671420 - PLACE
      ?auto_2671421 - HOIST
      ?auto_2671417 - SURFACE
      ?auto_2671416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671418 ?auto_2671419 ) ( SURFACE-AT ?auto_2671414 ?auto_2671419 ) ( CLEAR ?auto_2671414 ) ( IS-CRATE ?auto_2671415 ) ( not ( = ?auto_2671414 ?auto_2671415 ) ) ( AVAILABLE ?auto_2671418 ) ( ON ?auto_2671414 ?auto_2671413 ) ( not ( = ?auto_2671413 ?auto_2671414 ) ) ( not ( = ?auto_2671413 ?auto_2671415 ) ) ( not ( = ?auto_2671420 ?auto_2671419 ) ) ( HOIST-AT ?auto_2671421 ?auto_2671420 ) ( not ( = ?auto_2671418 ?auto_2671421 ) ) ( AVAILABLE ?auto_2671421 ) ( SURFACE-AT ?auto_2671415 ?auto_2671420 ) ( ON ?auto_2671415 ?auto_2671417 ) ( CLEAR ?auto_2671415 ) ( not ( = ?auto_2671414 ?auto_2671417 ) ) ( not ( = ?auto_2671415 ?auto_2671417 ) ) ( not ( = ?auto_2671413 ?auto_2671417 ) ) ( TRUCK-AT ?auto_2671416 ?auto_2671419 ) ( ON ?auto_2671408 ?auto_2671407 ) ( ON ?auto_2671409 ?auto_2671408 ) ( ON ?auto_2671406 ?auto_2671409 ) ( ON ?auto_2671410 ?auto_2671406 ) ( ON ?auto_2671412 ?auto_2671410 ) ( ON ?auto_2671411 ?auto_2671412 ) ( ON ?auto_2671413 ?auto_2671411 ) ( not ( = ?auto_2671407 ?auto_2671408 ) ) ( not ( = ?auto_2671407 ?auto_2671409 ) ) ( not ( = ?auto_2671407 ?auto_2671406 ) ) ( not ( = ?auto_2671407 ?auto_2671410 ) ) ( not ( = ?auto_2671407 ?auto_2671412 ) ) ( not ( = ?auto_2671407 ?auto_2671411 ) ) ( not ( = ?auto_2671407 ?auto_2671413 ) ) ( not ( = ?auto_2671407 ?auto_2671414 ) ) ( not ( = ?auto_2671407 ?auto_2671415 ) ) ( not ( = ?auto_2671407 ?auto_2671417 ) ) ( not ( = ?auto_2671408 ?auto_2671409 ) ) ( not ( = ?auto_2671408 ?auto_2671406 ) ) ( not ( = ?auto_2671408 ?auto_2671410 ) ) ( not ( = ?auto_2671408 ?auto_2671412 ) ) ( not ( = ?auto_2671408 ?auto_2671411 ) ) ( not ( = ?auto_2671408 ?auto_2671413 ) ) ( not ( = ?auto_2671408 ?auto_2671414 ) ) ( not ( = ?auto_2671408 ?auto_2671415 ) ) ( not ( = ?auto_2671408 ?auto_2671417 ) ) ( not ( = ?auto_2671409 ?auto_2671406 ) ) ( not ( = ?auto_2671409 ?auto_2671410 ) ) ( not ( = ?auto_2671409 ?auto_2671412 ) ) ( not ( = ?auto_2671409 ?auto_2671411 ) ) ( not ( = ?auto_2671409 ?auto_2671413 ) ) ( not ( = ?auto_2671409 ?auto_2671414 ) ) ( not ( = ?auto_2671409 ?auto_2671415 ) ) ( not ( = ?auto_2671409 ?auto_2671417 ) ) ( not ( = ?auto_2671406 ?auto_2671410 ) ) ( not ( = ?auto_2671406 ?auto_2671412 ) ) ( not ( = ?auto_2671406 ?auto_2671411 ) ) ( not ( = ?auto_2671406 ?auto_2671413 ) ) ( not ( = ?auto_2671406 ?auto_2671414 ) ) ( not ( = ?auto_2671406 ?auto_2671415 ) ) ( not ( = ?auto_2671406 ?auto_2671417 ) ) ( not ( = ?auto_2671410 ?auto_2671412 ) ) ( not ( = ?auto_2671410 ?auto_2671411 ) ) ( not ( = ?auto_2671410 ?auto_2671413 ) ) ( not ( = ?auto_2671410 ?auto_2671414 ) ) ( not ( = ?auto_2671410 ?auto_2671415 ) ) ( not ( = ?auto_2671410 ?auto_2671417 ) ) ( not ( = ?auto_2671412 ?auto_2671411 ) ) ( not ( = ?auto_2671412 ?auto_2671413 ) ) ( not ( = ?auto_2671412 ?auto_2671414 ) ) ( not ( = ?auto_2671412 ?auto_2671415 ) ) ( not ( = ?auto_2671412 ?auto_2671417 ) ) ( not ( = ?auto_2671411 ?auto_2671413 ) ) ( not ( = ?auto_2671411 ?auto_2671414 ) ) ( not ( = ?auto_2671411 ?auto_2671415 ) ) ( not ( = ?auto_2671411 ?auto_2671417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671413 ?auto_2671414 ?auto_2671415 )
      ( MAKE-9CRATE-VERIFY ?auto_2671407 ?auto_2671408 ?auto_2671409 ?auto_2671406 ?auto_2671410 ?auto_2671412 ?auto_2671411 ?auto_2671413 ?auto_2671414 ?auto_2671415 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671516 - SURFACE
      ?auto_2671517 - SURFACE
      ?auto_2671518 - SURFACE
      ?auto_2671515 - SURFACE
      ?auto_2671519 - SURFACE
      ?auto_2671521 - SURFACE
      ?auto_2671520 - SURFACE
      ?auto_2671522 - SURFACE
      ?auto_2671523 - SURFACE
      ?auto_2671524 - SURFACE
    )
    :vars
    (
      ?auto_2671528 - HOIST
      ?auto_2671529 - PLACE
      ?auto_2671526 - PLACE
      ?auto_2671530 - HOIST
      ?auto_2671527 - SURFACE
      ?auto_2671525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671528 ?auto_2671529 ) ( IS-CRATE ?auto_2671524 ) ( not ( = ?auto_2671523 ?auto_2671524 ) ) ( not ( = ?auto_2671522 ?auto_2671523 ) ) ( not ( = ?auto_2671522 ?auto_2671524 ) ) ( not ( = ?auto_2671526 ?auto_2671529 ) ) ( HOIST-AT ?auto_2671530 ?auto_2671526 ) ( not ( = ?auto_2671528 ?auto_2671530 ) ) ( AVAILABLE ?auto_2671530 ) ( SURFACE-AT ?auto_2671524 ?auto_2671526 ) ( ON ?auto_2671524 ?auto_2671527 ) ( CLEAR ?auto_2671524 ) ( not ( = ?auto_2671523 ?auto_2671527 ) ) ( not ( = ?auto_2671524 ?auto_2671527 ) ) ( not ( = ?auto_2671522 ?auto_2671527 ) ) ( TRUCK-AT ?auto_2671525 ?auto_2671529 ) ( SURFACE-AT ?auto_2671522 ?auto_2671529 ) ( CLEAR ?auto_2671522 ) ( LIFTING ?auto_2671528 ?auto_2671523 ) ( IS-CRATE ?auto_2671523 ) ( ON ?auto_2671517 ?auto_2671516 ) ( ON ?auto_2671518 ?auto_2671517 ) ( ON ?auto_2671515 ?auto_2671518 ) ( ON ?auto_2671519 ?auto_2671515 ) ( ON ?auto_2671521 ?auto_2671519 ) ( ON ?auto_2671520 ?auto_2671521 ) ( ON ?auto_2671522 ?auto_2671520 ) ( not ( = ?auto_2671516 ?auto_2671517 ) ) ( not ( = ?auto_2671516 ?auto_2671518 ) ) ( not ( = ?auto_2671516 ?auto_2671515 ) ) ( not ( = ?auto_2671516 ?auto_2671519 ) ) ( not ( = ?auto_2671516 ?auto_2671521 ) ) ( not ( = ?auto_2671516 ?auto_2671520 ) ) ( not ( = ?auto_2671516 ?auto_2671522 ) ) ( not ( = ?auto_2671516 ?auto_2671523 ) ) ( not ( = ?auto_2671516 ?auto_2671524 ) ) ( not ( = ?auto_2671516 ?auto_2671527 ) ) ( not ( = ?auto_2671517 ?auto_2671518 ) ) ( not ( = ?auto_2671517 ?auto_2671515 ) ) ( not ( = ?auto_2671517 ?auto_2671519 ) ) ( not ( = ?auto_2671517 ?auto_2671521 ) ) ( not ( = ?auto_2671517 ?auto_2671520 ) ) ( not ( = ?auto_2671517 ?auto_2671522 ) ) ( not ( = ?auto_2671517 ?auto_2671523 ) ) ( not ( = ?auto_2671517 ?auto_2671524 ) ) ( not ( = ?auto_2671517 ?auto_2671527 ) ) ( not ( = ?auto_2671518 ?auto_2671515 ) ) ( not ( = ?auto_2671518 ?auto_2671519 ) ) ( not ( = ?auto_2671518 ?auto_2671521 ) ) ( not ( = ?auto_2671518 ?auto_2671520 ) ) ( not ( = ?auto_2671518 ?auto_2671522 ) ) ( not ( = ?auto_2671518 ?auto_2671523 ) ) ( not ( = ?auto_2671518 ?auto_2671524 ) ) ( not ( = ?auto_2671518 ?auto_2671527 ) ) ( not ( = ?auto_2671515 ?auto_2671519 ) ) ( not ( = ?auto_2671515 ?auto_2671521 ) ) ( not ( = ?auto_2671515 ?auto_2671520 ) ) ( not ( = ?auto_2671515 ?auto_2671522 ) ) ( not ( = ?auto_2671515 ?auto_2671523 ) ) ( not ( = ?auto_2671515 ?auto_2671524 ) ) ( not ( = ?auto_2671515 ?auto_2671527 ) ) ( not ( = ?auto_2671519 ?auto_2671521 ) ) ( not ( = ?auto_2671519 ?auto_2671520 ) ) ( not ( = ?auto_2671519 ?auto_2671522 ) ) ( not ( = ?auto_2671519 ?auto_2671523 ) ) ( not ( = ?auto_2671519 ?auto_2671524 ) ) ( not ( = ?auto_2671519 ?auto_2671527 ) ) ( not ( = ?auto_2671521 ?auto_2671520 ) ) ( not ( = ?auto_2671521 ?auto_2671522 ) ) ( not ( = ?auto_2671521 ?auto_2671523 ) ) ( not ( = ?auto_2671521 ?auto_2671524 ) ) ( not ( = ?auto_2671521 ?auto_2671527 ) ) ( not ( = ?auto_2671520 ?auto_2671522 ) ) ( not ( = ?auto_2671520 ?auto_2671523 ) ) ( not ( = ?auto_2671520 ?auto_2671524 ) ) ( not ( = ?auto_2671520 ?auto_2671527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671522 ?auto_2671523 ?auto_2671524 )
      ( MAKE-9CRATE-VERIFY ?auto_2671516 ?auto_2671517 ?auto_2671518 ?auto_2671515 ?auto_2671519 ?auto_2671521 ?auto_2671520 ?auto_2671522 ?auto_2671523 ?auto_2671524 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671625 - SURFACE
      ?auto_2671626 - SURFACE
      ?auto_2671627 - SURFACE
      ?auto_2671624 - SURFACE
      ?auto_2671628 - SURFACE
      ?auto_2671630 - SURFACE
      ?auto_2671629 - SURFACE
      ?auto_2671631 - SURFACE
      ?auto_2671632 - SURFACE
      ?auto_2671633 - SURFACE
    )
    :vars
    (
      ?auto_2671637 - HOIST
      ?auto_2671638 - PLACE
      ?auto_2671639 - PLACE
      ?auto_2671635 - HOIST
      ?auto_2671636 - SURFACE
      ?auto_2671634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671637 ?auto_2671638 ) ( IS-CRATE ?auto_2671633 ) ( not ( = ?auto_2671632 ?auto_2671633 ) ) ( not ( = ?auto_2671631 ?auto_2671632 ) ) ( not ( = ?auto_2671631 ?auto_2671633 ) ) ( not ( = ?auto_2671639 ?auto_2671638 ) ) ( HOIST-AT ?auto_2671635 ?auto_2671639 ) ( not ( = ?auto_2671637 ?auto_2671635 ) ) ( AVAILABLE ?auto_2671635 ) ( SURFACE-AT ?auto_2671633 ?auto_2671639 ) ( ON ?auto_2671633 ?auto_2671636 ) ( CLEAR ?auto_2671633 ) ( not ( = ?auto_2671632 ?auto_2671636 ) ) ( not ( = ?auto_2671633 ?auto_2671636 ) ) ( not ( = ?auto_2671631 ?auto_2671636 ) ) ( TRUCK-AT ?auto_2671634 ?auto_2671638 ) ( SURFACE-AT ?auto_2671631 ?auto_2671638 ) ( CLEAR ?auto_2671631 ) ( IS-CRATE ?auto_2671632 ) ( AVAILABLE ?auto_2671637 ) ( IN ?auto_2671632 ?auto_2671634 ) ( ON ?auto_2671626 ?auto_2671625 ) ( ON ?auto_2671627 ?auto_2671626 ) ( ON ?auto_2671624 ?auto_2671627 ) ( ON ?auto_2671628 ?auto_2671624 ) ( ON ?auto_2671630 ?auto_2671628 ) ( ON ?auto_2671629 ?auto_2671630 ) ( ON ?auto_2671631 ?auto_2671629 ) ( not ( = ?auto_2671625 ?auto_2671626 ) ) ( not ( = ?auto_2671625 ?auto_2671627 ) ) ( not ( = ?auto_2671625 ?auto_2671624 ) ) ( not ( = ?auto_2671625 ?auto_2671628 ) ) ( not ( = ?auto_2671625 ?auto_2671630 ) ) ( not ( = ?auto_2671625 ?auto_2671629 ) ) ( not ( = ?auto_2671625 ?auto_2671631 ) ) ( not ( = ?auto_2671625 ?auto_2671632 ) ) ( not ( = ?auto_2671625 ?auto_2671633 ) ) ( not ( = ?auto_2671625 ?auto_2671636 ) ) ( not ( = ?auto_2671626 ?auto_2671627 ) ) ( not ( = ?auto_2671626 ?auto_2671624 ) ) ( not ( = ?auto_2671626 ?auto_2671628 ) ) ( not ( = ?auto_2671626 ?auto_2671630 ) ) ( not ( = ?auto_2671626 ?auto_2671629 ) ) ( not ( = ?auto_2671626 ?auto_2671631 ) ) ( not ( = ?auto_2671626 ?auto_2671632 ) ) ( not ( = ?auto_2671626 ?auto_2671633 ) ) ( not ( = ?auto_2671626 ?auto_2671636 ) ) ( not ( = ?auto_2671627 ?auto_2671624 ) ) ( not ( = ?auto_2671627 ?auto_2671628 ) ) ( not ( = ?auto_2671627 ?auto_2671630 ) ) ( not ( = ?auto_2671627 ?auto_2671629 ) ) ( not ( = ?auto_2671627 ?auto_2671631 ) ) ( not ( = ?auto_2671627 ?auto_2671632 ) ) ( not ( = ?auto_2671627 ?auto_2671633 ) ) ( not ( = ?auto_2671627 ?auto_2671636 ) ) ( not ( = ?auto_2671624 ?auto_2671628 ) ) ( not ( = ?auto_2671624 ?auto_2671630 ) ) ( not ( = ?auto_2671624 ?auto_2671629 ) ) ( not ( = ?auto_2671624 ?auto_2671631 ) ) ( not ( = ?auto_2671624 ?auto_2671632 ) ) ( not ( = ?auto_2671624 ?auto_2671633 ) ) ( not ( = ?auto_2671624 ?auto_2671636 ) ) ( not ( = ?auto_2671628 ?auto_2671630 ) ) ( not ( = ?auto_2671628 ?auto_2671629 ) ) ( not ( = ?auto_2671628 ?auto_2671631 ) ) ( not ( = ?auto_2671628 ?auto_2671632 ) ) ( not ( = ?auto_2671628 ?auto_2671633 ) ) ( not ( = ?auto_2671628 ?auto_2671636 ) ) ( not ( = ?auto_2671630 ?auto_2671629 ) ) ( not ( = ?auto_2671630 ?auto_2671631 ) ) ( not ( = ?auto_2671630 ?auto_2671632 ) ) ( not ( = ?auto_2671630 ?auto_2671633 ) ) ( not ( = ?auto_2671630 ?auto_2671636 ) ) ( not ( = ?auto_2671629 ?auto_2671631 ) ) ( not ( = ?auto_2671629 ?auto_2671632 ) ) ( not ( = ?auto_2671629 ?auto_2671633 ) ) ( not ( = ?auto_2671629 ?auto_2671636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671631 ?auto_2671632 ?auto_2671633 )
      ( MAKE-9CRATE-VERIFY ?auto_2671625 ?auto_2671626 ?auto_2671627 ?auto_2671624 ?auto_2671628 ?auto_2671630 ?auto_2671629 ?auto_2671631 ?auto_2671632 ?auto_2671633 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677177 - SURFACE
      ?auto_2677178 - SURFACE
      ?auto_2677179 - SURFACE
      ?auto_2677176 - SURFACE
      ?auto_2677180 - SURFACE
      ?auto_2677182 - SURFACE
      ?auto_2677181 - SURFACE
      ?auto_2677183 - SURFACE
      ?auto_2677184 - SURFACE
      ?auto_2677185 - SURFACE
      ?auto_2677186 - SURFACE
    )
    :vars
    (
      ?auto_2677188 - HOIST
      ?auto_2677187 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677188 ?auto_2677187 ) ( SURFACE-AT ?auto_2677185 ?auto_2677187 ) ( CLEAR ?auto_2677185 ) ( LIFTING ?auto_2677188 ?auto_2677186 ) ( IS-CRATE ?auto_2677186 ) ( not ( = ?auto_2677185 ?auto_2677186 ) ) ( ON ?auto_2677178 ?auto_2677177 ) ( ON ?auto_2677179 ?auto_2677178 ) ( ON ?auto_2677176 ?auto_2677179 ) ( ON ?auto_2677180 ?auto_2677176 ) ( ON ?auto_2677182 ?auto_2677180 ) ( ON ?auto_2677181 ?auto_2677182 ) ( ON ?auto_2677183 ?auto_2677181 ) ( ON ?auto_2677184 ?auto_2677183 ) ( ON ?auto_2677185 ?auto_2677184 ) ( not ( = ?auto_2677177 ?auto_2677178 ) ) ( not ( = ?auto_2677177 ?auto_2677179 ) ) ( not ( = ?auto_2677177 ?auto_2677176 ) ) ( not ( = ?auto_2677177 ?auto_2677180 ) ) ( not ( = ?auto_2677177 ?auto_2677182 ) ) ( not ( = ?auto_2677177 ?auto_2677181 ) ) ( not ( = ?auto_2677177 ?auto_2677183 ) ) ( not ( = ?auto_2677177 ?auto_2677184 ) ) ( not ( = ?auto_2677177 ?auto_2677185 ) ) ( not ( = ?auto_2677177 ?auto_2677186 ) ) ( not ( = ?auto_2677178 ?auto_2677179 ) ) ( not ( = ?auto_2677178 ?auto_2677176 ) ) ( not ( = ?auto_2677178 ?auto_2677180 ) ) ( not ( = ?auto_2677178 ?auto_2677182 ) ) ( not ( = ?auto_2677178 ?auto_2677181 ) ) ( not ( = ?auto_2677178 ?auto_2677183 ) ) ( not ( = ?auto_2677178 ?auto_2677184 ) ) ( not ( = ?auto_2677178 ?auto_2677185 ) ) ( not ( = ?auto_2677178 ?auto_2677186 ) ) ( not ( = ?auto_2677179 ?auto_2677176 ) ) ( not ( = ?auto_2677179 ?auto_2677180 ) ) ( not ( = ?auto_2677179 ?auto_2677182 ) ) ( not ( = ?auto_2677179 ?auto_2677181 ) ) ( not ( = ?auto_2677179 ?auto_2677183 ) ) ( not ( = ?auto_2677179 ?auto_2677184 ) ) ( not ( = ?auto_2677179 ?auto_2677185 ) ) ( not ( = ?auto_2677179 ?auto_2677186 ) ) ( not ( = ?auto_2677176 ?auto_2677180 ) ) ( not ( = ?auto_2677176 ?auto_2677182 ) ) ( not ( = ?auto_2677176 ?auto_2677181 ) ) ( not ( = ?auto_2677176 ?auto_2677183 ) ) ( not ( = ?auto_2677176 ?auto_2677184 ) ) ( not ( = ?auto_2677176 ?auto_2677185 ) ) ( not ( = ?auto_2677176 ?auto_2677186 ) ) ( not ( = ?auto_2677180 ?auto_2677182 ) ) ( not ( = ?auto_2677180 ?auto_2677181 ) ) ( not ( = ?auto_2677180 ?auto_2677183 ) ) ( not ( = ?auto_2677180 ?auto_2677184 ) ) ( not ( = ?auto_2677180 ?auto_2677185 ) ) ( not ( = ?auto_2677180 ?auto_2677186 ) ) ( not ( = ?auto_2677182 ?auto_2677181 ) ) ( not ( = ?auto_2677182 ?auto_2677183 ) ) ( not ( = ?auto_2677182 ?auto_2677184 ) ) ( not ( = ?auto_2677182 ?auto_2677185 ) ) ( not ( = ?auto_2677182 ?auto_2677186 ) ) ( not ( = ?auto_2677181 ?auto_2677183 ) ) ( not ( = ?auto_2677181 ?auto_2677184 ) ) ( not ( = ?auto_2677181 ?auto_2677185 ) ) ( not ( = ?auto_2677181 ?auto_2677186 ) ) ( not ( = ?auto_2677183 ?auto_2677184 ) ) ( not ( = ?auto_2677183 ?auto_2677185 ) ) ( not ( = ?auto_2677183 ?auto_2677186 ) ) ( not ( = ?auto_2677184 ?auto_2677185 ) ) ( not ( = ?auto_2677184 ?auto_2677186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2677185 ?auto_2677186 )
      ( MAKE-10CRATE-VERIFY ?auto_2677177 ?auto_2677178 ?auto_2677179 ?auto_2677176 ?auto_2677180 ?auto_2677182 ?auto_2677181 ?auto_2677183 ?auto_2677184 ?auto_2677185 ?auto_2677186 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677271 - SURFACE
      ?auto_2677272 - SURFACE
      ?auto_2677273 - SURFACE
      ?auto_2677270 - SURFACE
      ?auto_2677274 - SURFACE
      ?auto_2677276 - SURFACE
      ?auto_2677275 - SURFACE
      ?auto_2677277 - SURFACE
      ?auto_2677278 - SURFACE
      ?auto_2677279 - SURFACE
      ?auto_2677280 - SURFACE
    )
    :vars
    (
      ?auto_2677281 - HOIST
      ?auto_2677282 - PLACE
      ?auto_2677283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677281 ?auto_2677282 ) ( SURFACE-AT ?auto_2677279 ?auto_2677282 ) ( CLEAR ?auto_2677279 ) ( IS-CRATE ?auto_2677280 ) ( not ( = ?auto_2677279 ?auto_2677280 ) ) ( TRUCK-AT ?auto_2677283 ?auto_2677282 ) ( AVAILABLE ?auto_2677281 ) ( IN ?auto_2677280 ?auto_2677283 ) ( ON ?auto_2677279 ?auto_2677278 ) ( not ( = ?auto_2677278 ?auto_2677279 ) ) ( not ( = ?auto_2677278 ?auto_2677280 ) ) ( ON ?auto_2677272 ?auto_2677271 ) ( ON ?auto_2677273 ?auto_2677272 ) ( ON ?auto_2677270 ?auto_2677273 ) ( ON ?auto_2677274 ?auto_2677270 ) ( ON ?auto_2677276 ?auto_2677274 ) ( ON ?auto_2677275 ?auto_2677276 ) ( ON ?auto_2677277 ?auto_2677275 ) ( ON ?auto_2677278 ?auto_2677277 ) ( not ( = ?auto_2677271 ?auto_2677272 ) ) ( not ( = ?auto_2677271 ?auto_2677273 ) ) ( not ( = ?auto_2677271 ?auto_2677270 ) ) ( not ( = ?auto_2677271 ?auto_2677274 ) ) ( not ( = ?auto_2677271 ?auto_2677276 ) ) ( not ( = ?auto_2677271 ?auto_2677275 ) ) ( not ( = ?auto_2677271 ?auto_2677277 ) ) ( not ( = ?auto_2677271 ?auto_2677278 ) ) ( not ( = ?auto_2677271 ?auto_2677279 ) ) ( not ( = ?auto_2677271 ?auto_2677280 ) ) ( not ( = ?auto_2677272 ?auto_2677273 ) ) ( not ( = ?auto_2677272 ?auto_2677270 ) ) ( not ( = ?auto_2677272 ?auto_2677274 ) ) ( not ( = ?auto_2677272 ?auto_2677276 ) ) ( not ( = ?auto_2677272 ?auto_2677275 ) ) ( not ( = ?auto_2677272 ?auto_2677277 ) ) ( not ( = ?auto_2677272 ?auto_2677278 ) ) ( not ( = ?auto_2677272 ?auto_2677279 ) ) ( not ( = ?auto_2677272 ?auto_2677280 ) ) ( not ( = ?auto_2677273 ?auto_2677270 ) ) ( not ( = ?auto_2677273 ?auto_2677274 ) ) ( not ( = ?auto_2677273 ?auto_2677276 ) ) ( not ( = ?auto_2677273 ?auto_2677275 ) ) ( not ( = ?auto_2677273 ?auto_2677277 ) ) ( not ( = ?auto_2677273 ?auto_2677278 ) ) ( not ( = ?auto_2677273 ?auto_2677279 ) ) ( not ( = ?auto_2677273 ?auto_2677280 ) ) ( not ( = ?auto_2677270 ?auto_2677274 ) ) ( not ( = ?auto_2677270 ?auto_2677276 ) ) ( not ( = ?auto_2677270 ?auto_2677275 ) ) ( not ( = ?auto_2677270 ?auto_2677277 ) ) ( not ( = ?auto_2677270 ?auto_2677278 ) ) ( not ( = ?auto_2677270 ?auto_2677279 ) ) ( not ( = ?auto_2677270 ?auto_2677280 ) ) ( not ( = ?auto_2677274 ?auto_2677276 ) ) ( not ( = ?auto_2677274 ?auto_2677275 ) ) ( not ( = ?auto_2677274 ?auto_2677277 ) ) ( not ( = ?auto_2677274 ?auto_2677278 ) ) ( not ( = ?auto_2677274 ?auto_2677279 ) ) ( not ( = ?auto_2677274 ?auto_2677280 ) ) ( not ( = ?auto_2677276 ?auto_2677275 ) ) ( not ( = ?auto_2677276 ?auto_2677277 ) ) ( not ( = ?auto_2677276 ?auto_2677278 ) ) ( not ( = ?auto_2677276 ?auto_2677279 ) ) ( not ( = ?auto_2677276 ?auto_2677280 ) ) ( not ( = ?auto_2677275 ?auto_2677277 ) ) ( not ( = ?auto_2677275 ?auto_2677278 ) ) ( not ( = ?auto_2677275 ?auto_2677279 ) ) ( not ( = ?auto_2677275 ?auto_2677280 ) ) ( not ( = ?auto_2677277 ?auto_2677278 ) ) ( not ( = ?auto_2677277 ?auto_2677279 ) ) ( not ( = ?auto_2677277 ?auto_2677280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677278 ?auto_2677279 ?auto_2677280 )
      ( MAKE-10CRATE-VERIFY ?auto_2677271 ?auto_2677272 ?auto_2677273 ?auto_2677270 ?auto_2677274 ?auto_2677276 ?auto_2677275 ?auto_2677277 ?auto_2677278 ?auto_2677279 ?auto_2677280 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677376 - SURFACE
      ?auto_2677377 - SURFACE
      ?auto_2677378 - SURFACE
      ?auto_2677375 - SURFACE
      ?auto_2677379 - SURFACE
      ?auto_2677381 - SURFACE
      ?auto_2677380 - SURFACE
      ?auto_2677382 - SURFACE
      ?auto_2677383 - SURFACE
      ?auto_2677384 - SURFACE
      ?auto_2677385 - SURFACE
    )
    :vars
    (
      ?auto_2677386 - HOIST
      ?auto_2677387 - PLACE
      ?auto_2677389 - TRUCK
      ?auto_2677388 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677386 ?auto_2677387 ) ( SURFACE-AT ?auto_2677384 ?auto_2677387 ) ( CLEAR ?auto_2677384 ) ( IS-CRATE ?auto_2677385 ) ( not ( = ?auto_2677384 ?auto_2677385 ) ) ( AVAILABLE ?auto_2677386 ) ( IN ?auto_2677385 ?auto_2677389 ) ( ON ?auto_2677384 ?auto_2677383 ) ( not ( = ?auto_2677383 ?auto_2677384 ) ) ( not ( = ?auto_2677383 ?auto_2677385 ) ) ( TRUCK-AT ?auto_2677389 ?auto_2677388 ) ( not ( = ?auto_2677388 ?auto_2677387 ) ) ( ON ?auto_2677377 ?auto_2677376 ) ( ON ?auto_2677378 ?auto_2677377 ) ( ON ?auto_2677375 ?auto_2677378 ) ( ON ?auto_2677379 ?auto_2677375 ) ( ON ?auto_2677381 ?auto_2677379 ) ( ON ?auto_2677380 ?auto_2677381 ) ( ON ?auto_2677382 ?auto_2677380 ) ( ON ?auto_2677383 ?auto_2677382 ) ( not ( = ?auto_2677376 ?auto_2677377 ) ) ( not ( = ?auto_2677376 ?auto_2677378 ) ) ( not ( = ?auto_2677376 ?auto_2677375 ) ) ( not ( = ?auto_2677376 ?auto_2677379 ) ) ( not ( = ?auto_2677376 ?auto_2677381 ) ) ( not ( = ?auto_2677376 ?auto_2677380 ) ) ( not ( = ?auto_2677376 ?auto_2677382 ) ) ( not ( = ?auto_2677376 ?auto_2677383 ) ) ( not ( = ?auto_2677376 ?auto_2677384 ) ) ( not ( = ?auto_2677376 ?auto_2677385 ) ) ( not ( = ?auto_2677377 ?auto_2677378 ) ) ( not ( = ?auto_2677377 ?auto_2677375 ) ) ( not ( = ?auto_2677377 ?auto_2677379 ) ) ( not ( = ?auto_2677377 ?auto_2677381 ) ) ( not ( = ?auto_2677377 ?auto_2677380 ) ) ( not ( = ?auto_2677377 ?auto_2677382 ) ) ( not ( = ?auto_2677377 ?auto_2677383 ) ) ( not ( = ?auto_2677377 ?auto_2677384 ) ) ( not ( = ?auto_2677377 ?auto_2677385 ) ) ( not ( = ?auto_2677378 ?auto_2677375 ) ) ( not ( = ?auto_2677378 ?auto_2677379 ) ) ( not ( = ?auto_2677378 ?auto_2677381 ) ) ( not ( = ?auto_2677378 ?auto_2677380 ) ) ( not ( = ?auto_2677378 ?auto_2677382 ) ) ( not ( = ?auto_2677378 ?auto_2677383 ) ) ( not ( = ?auto_2677378 ?auto_2677384 ) ) ( not ( = ?auto_2677378 ?auto_2677385 ) ) ( not ( = ?auto_2677375 ?auto_2677379 ) ) ( not ( = ?auto_2677375 ?auto_2677381 ) ) ( not ( = ?auto_2677375 ?auto_2677380 ) ) ( not ( = ?auto_2677375 ?auto_2677382 ) ) ( not ( = ?auto_2677375 ?auto_2677383 ) ) ( not ( = ?auto_2677375 ?auto_2677384 ) ) ( not ( = ?auto_2677375 ?auto_2677385 ) ) ( not ( = ?auto_2677379 ?auto_2677381 ) ) ( not ( = ?auto_2677379 ?auto_2677380 ) ) ( not ( = ?auto_2677379 ?auto_2677382 ) ) ( not ( = ?auto_2677379 ?auto_2677383 ) ) ( not ( = ?auto_2677379 ?auto_2677384 ) ) ( not ( = ?auto_2677379 ?auto_2677385 ) ) ( not ( = ?auto_2677381 ?auto_2677380 ) ) ( not ( = ?auto_2677381 ?auto_2677382 ) ) ( not ( = ?auto_2677381 ?auto_2677383 ) ) ( not ( = ?auto_2677381 ?auto_2677384 ) ) ( not ( = ?auto_2677381 ?auto_2677385 ) ) ( not ( = ?auto_2677380 ?auto_2677382 ) ) ( not ( = ?auto_2677380 ?auto_2677383 ) ) ( not ( = ?auto_2677380 ?auto_2677384 ) ) ( not ( = ?auto_2677380 ?auto_2677385 ) ) ( not ( = ?auto_2677382 ?auto_2677383 ) ) ( not ( = ?auto_2677382 ?auto_2677384 ) ) ( not ( = ?auto_2677382 ?auto_2677385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677383 ?auto_2677384 ?auto_2677385 )
      ( MAKE-10CRATE-VERIFY ?auto_2677376 ?auto_2677377 ?auto_2677378 ?auto_2677375 ?auto_2677379 ?auto_2677381 ?auto_2677380 ?auto_2677382 ?auto_2677383 ?auto_2677384 ?auto_2677385 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677491 - SURFACE
      ?auto_2677492 - SURFACE
      ?auto_2677493 - SURFACE
      ?auto_2677490 - SURFACE
      ?auto_2677494 - SURFACE
      ?auto_2677496 - SURFACE
      ?auto_2677495 - SURFACE
      ?auto_2677497 - SURFACE
      ?auto_2677498 - SURFACE
      ?auto_2677499 - SURFACE
      ?auto_2677500 - SURFACE
    )
    :vars
    (
      ?auto_2677501 - HOIST
      ?auto_2677505 - PLACE
      ?auto_2677503 - TRUCK
      ?auto_2677504 - PLACE
      ?auto_2677502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677501 ?auto_2677505 ) ( SURFACE-AT ?auto_2677499 ?auto_2677505 ) ( CLEAR ?auto_2677499 ) ( IS-CRATE ?auto_2677500 ) ( not ( = ?auto_2677499 ?auto_2677500 ) ) ( AVAILABLE ?auto_2677501 ) ( ON ?auto_2677499 ?auto_2677498 ) ( not ( = ?auto_2677498 ?auto_2677499 ) ) ( not ( = ?auto_2677498 ?auto_2677500 ) ) ( TRUCK-AT ?auto_2677503 ?auto_2677504 ) ( not ( = ?auto_2677504 ?auto_2677505 ) ) ( HOIST-AT ?auto_2677502 ?auto_2677504 ) ( LIFTING ?auto_2677502 ?auto_2677500 ) ( not ( = ?auto_2677501 ?auto_2677502 ) ) ( ON ?auto_2677492 ?auto_2677491 ) ( ON ?auto_2677493 ?auto_2677492 ) ( ON ?auto_2677490 ?auto_2677493 ) ( ON ?auto_2677494 ?auto_2677490 ) ( ON ?auto_2677496 ?auto_2677494 ) ( ON ?auto_2677495 ?auto_2677496 ) ( ON ?auto_2677497 ?auto_2677495 ) ( ON ?auto_2677498 ?auto_2677497 ) ( not ( = ?auto_2677491 ?auto_2677492 ) ) ( not ( = ?auto_2677491 ?auto_2677493 ) ) ( not ( = ?auto_2677491 ?auto_2677490 ) ) ( not ( = ?auto_2677491 ?auto_2677494 ) ) ( not ( = ?auto_2677491 ?auto_2677496 ) ) ( not ( = ?auto_2677491 ?auto_2677495 ) ) ( not ( = ?auto_2677491 ?auto_2677497 ) ) ( not ( = ?auto_2677491 ?auto_2677498 ) ) ( not ( = ?auto_2677491 ?auto_2677499 ) ) ( not ( = ?auto_2677491 ?auto_2677500 ) ) ( not ( = ?auto_2677492 ?auto_2677493 ) ) ( not ( = ?auto_2677492 ?auto_2677490 ) ) ( not ( = ?auto_2677492 ?auto_2677494 ) ) ( not ( = ?auto_2677492 ?auto_2677496 ) ) ( not ( = ?auto_2677492 ?auto_2677495 ) ) ( not ( = ?auto_2677492 ?auto_2677497 ) ) ( not ( = ?auto_2677492 ?auto_2677498 ) ) ( not ( = ?auto_2677492 ?auto_2677499 ) ) ( not ( = ?auto_2677492 ?auto_2677500 ) ) ( not ( = ?auto_2677493 ?auto_2677490 ) ) ( not ( = ?auto_2677493 ?auto_2677494 ) ) ( not ( = ?auto_2677493 ?auto_2677496 ) ) ( not ( = ?auto_2677493 ?auto_2677495 ) ) ( not ( = ?auto_2677493 ?auto_2677497 ) ) ( not ( = ?auto_2677493 ?auto_2677498 ) ) ( not ( = ?auto_2677493 ?auto_2677499 ) ) ( not ( = ?auto_2677493 ?auto_2677500 ) ) ( not ( = ?auto_2677490 ?auto_2677494 ) ) ( not ( = ?auto_2677490 ?auto_2677496 ) ) ( not ( = ?auto_2677490 ?auto_2677495 ) ) ( not ( = ?auto_2677490 ?auto_2677497 ) ) ( not ( = ?auto_2677490 ?auto_2677498 ) ) ( not ( = ?auto_2677490 ?auto_2677499 ) ) ( not ( = ?auto_2677490 ?auto_2677500 ) ) ( not ( = ?auto_2677494 ?auto_2677496 ) ) ( not ( = ?auto_2677494 ?auto_2677495 ) ) ( not ( = ?auto_2677494 ?auto_2677497 ) ) ( not ( = ?auto_2677494 ?auto_2677498 ) ) ( not ( = ?auto_2677494 ?auto_2677499 ) ) ( not ( = ?auto_2677494 ?auto_2677500 ) ) ( not ( = ?auto_2677496 ?auto_2677495 ) ) ( not ( = ?auto_2677496 ?auto_2677497 ) ) ( not ( = ?auto_2677496 ?auto_2677498 ) ) ( not ( = ?auto_2677496 ?auto_2677499 ) ) ( not ( = ?auto_2677496 ?auto_2677500 ) ) ( not ( = ?auto_2677495 ?auto_2677497 ) ) ( not ( = ?auto_2677495 ?auto_2677498 ) ) ( not ( = ?auto_2677495 ?auto_2677499 ) ) ( not ( = ?auto_2677495 ?auto_2677500 ) ) ( not ( = ?auto_2677497 ?auto_2677498 ) ) ( not ( = ?auto_2677497 ?auto_2677499 ) ) ( not ( = ?auto_2677497 ?auto_2677500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677498 ?auto_2677499 ?auto_2677500 )
      ( MAKE-10CRATE-VERIFY ?auto_2677491 ?auto_2677492 ?auto_2677493 ?auto_2677490 ?auto_2677494 ?auto_2677496 ?auto_2677495 ?auto_2677497 ?auto_2677498 ?auto_2677499 ?auto_2677500 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677616 - SURFACE
      ?auto_2677617 - SURFACE
      ?auto_2677618 - SURFACE
      ?auto_2677615 - SURFACE
      ?auto_2677619 - SURFACE
      ?auto_2677621 - SURFACE
      ?auto_2677620 - SURFACE
      ?auto_2677622 - SURFACE
      ?auto_2677623 - SURFACE
      ?auto_2677624 - SURFACE
      ?auto_2677625 - SURFACE
    )
    :vars
    (
      ?auto_2677627 - HOIST
      ?auto_2677630 - PLACE
      ?auto_2677626 - TRUCK
      ?auto_2677629 - PLACE
      ?auto_2677628 - HOIST
      ?auto_2677631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677627 ?auto_2677630 ) ( SURFACE-AT ?auto_2677624 ?auto_2677630 ) ( CLEAR ?auto_2677624 ) ( IS-CRATE ?auto_2677625 ) ( not ( = ?auto_2677624 ?auto_2677625 ) ) ( AVAILABLE ?auto_2677627 ) ( ON ?auto_2677624 ?auto_2677623 ) ( not ( = ?auto_2677623 ?auto_2677624 ) ) ( not ( = ?auto_2677623 ?auto_2677625 ) ) ( TRUCK-AT ?auto_2677626 ?auto_2677629 ) ( not ( = ?auto_2677629 ?auto_2677630 ) ) ( HOIST-AT ?auto_2677628 ?auto_2677629 ) ( not ( = ?auto_2677627 ?auto_2677628 ) ) ( AVAILABLE ?auto_2677628 ) ( SURFACE-AT ?auto_2677625 ?auto_2677629 ) ( ON ?auto_2677625 ?auto_2677631 ) ( CLEAR ?auto_2677625 ) ( not ( = ?auto_2677624 ?auto_2677631 ) ) ( not ( = ?auto_2677625 ?auto_2677631 ) ) ( not ( = ?auto_2677623 ?auto_2677631 ) ) ( ON ?auto_2677617 ?auto_2677616 ) ( ON ?auto_2677618 ?auto_2677617 ) ( ON ?auto_2677615 ?auto_2677618 ) ( ON ?auto_2677619 ?auto_2677615 ) ( ON ?auto_2677621 ?auto_2677619 ) ( ON ?auto_2677620 ?auto_2677621 ) ( ON ?auto_2677622 ?auto_2677620 ) ( ON ?auto_2677623 ?auto_2677622 ) ( not ( = ?auto_2677616 ?auto_2677617 ) ) ( not ( = ?auto_2677616 ?auto_2677618 ) ) ( not ( = ?auto_2677616 ?auto_2677615 ) ) ( not ( = ?auto_2677616 ?auto_2677619 ) ) ( not ( = ?auto_2677616 ?auto_2677621 ) ) ( not ( = ?auto_2677616 ?auto_2677620 ) ) ( not ( = ?auto_2677616 ?auto_2677622 ) ) ( not ( = ?auto_2677616 ?auto_2677623 ) ) ( not ( = ?auto_2677616 ?auto_2677624 ) ) ( not ( = ?auto_2677616 ?auto_2677625 ) ) ( not ( = ?auto_2677616 ?auto_2677631 ) ) ( not ( = ?auto_2677617 ?auto_2677618 ) ) ( not ( = ?auto_2677617 ?auto_2677615 ) ) ( not ( = ?auto_2677617 ?auto_2677619 ) ) ( not ( = ?auto_2677617 ?auto_2677621 ) ) ( not ( = ?auto_2677617 ?auto_2677620 ) ) ( not ( = ?auto_2677617 ?auto_2677622 ) ) ( not ( = ?auto_2677617 ?auto_2677623 ) ) ( not ( = ?auto_2677617 ?auto_2677624 ) ) ( not ( = ?auto_2677617 ?auto_2677625 ) ) ( not ( = ?auto_2677617 ?auto_2677631 ) ) ( not ( = ?auto_2677618 ?auto_2677615 ) ) ( not ( = ?auto_2677618 ?auto_2677619 ) ) ( not ( = ?auto_2677618 ?auto_2677621 ) ) ( not ( = ?auto_2677618 ?auto_2677620 ) ) ( not ( = ?auto_2677618 ?auto_2677622 ) ) ( not ( = ?auto_2677618 ?auto_2677623 ) ) ( not ( = ?auto_2677618 ?auto_2677624 ) ) ( not ( = ?auto_2677618 ?auto_2677625 ) ) ( not ( = ?auto_2677618 ?auto_2677631 ) ) ( not ( = ?auto_2677615 ?auto_2677619 ) ) ( not ( = ?auto_2677615 ?auto_2677621 ) ) ( not ( = ?auto_2677615 ?auto_2677620 ) ) ( not ( = ?auto_2677615 ?auto_2677622 ) ) ( not ( = ?auto_2677615 ?auto_2677623 ) ) ( not ( = ?auto_2677615 ?auto_2677624 ) ) ( not ( = ?auto_2677615 ?auto_2677625 ) ) ( not ( = ?auto_2677615 ?auto_2677631 ) ) ( not ( = ?auto_2677619 ?auto_2677621 ) ) ( not ( = ?auto_2677619 ?auto_2677620 ) ) ( not ( = ?auto_2677619 ?auto_2677622 ) ) ( not ( = ?auto_2677619 ?auto_2677623 ) ) ( not ( = ?auto_2677619 ?auto_2677624 ) ) ( not ( = ?auto_2677619 ?auto_2677625 ) ) ( not ( = ?auto_2677619 ?auto_2677631 ) ) ( not ( = ?auto_2677621 ?auto_2677620 ) ) ( not ( = ?auto_2677621 ?auto_2677622 ) ) ( not ( = ?auto_2677621 ?auto_2677623 ) ) ( not ( = ?auto_2677621 ?auto_2677624 ) ) ( not ( = ?auto_2677621 ?auto_2677625 ) ) ( not ( = ?auto_2677621 ?auto_2677631 ) ) ( not ( = ?auto_2677620 ?auto_2677622 ) ) ( not ( = ?auto_2677620 ?auto_2677623 ) ) ( not ( = ?auto_2677620 ?auto_2677624 ) ) ( not ( = ?auto_2677620 ?auto_2677625 ) ) ( not ( = ?auto_2677620 ?auto_2677631 ) ) ( not ( = ?auto_2677622 ?auto_2677623 ) ) ( not ( = ?auto_2677622 ?auto_2677624 ) ) ( not ( = ?auto_2677622 ?auto_2677625 ) ) ( not ( = ?auto_2677622 ?auto_2677631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677623 ?auto_2677624 ?auto_2677625 )
      ( MAKE-10CRATE-VERIFY ?auto_2677616 ?auto_2677617 ?auto_2677618 ?auto_2677615 ?auto_2677619 ?auto_2677621 ?auto_2677620 ?auto_2677622 ?auto_2677623 ?auto_2677624 ?auto_2677625 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677742 - SURFACE
      ?auto_2677743 - SURFACE
      ?auto_2677744 - SURFACE
      ?auto_2677741 - SURFACE
      ?auto_2677745 - SURFACE
      ?auto_2677747 - SURFACE
      ?auto_2677746 - SURFACE
      ?auto_2677748 - SURFACE
      ?auto_2677749 - SURFACE
      ?auto_2677750 - SURFACE
      ?auto_2677751 - SURFACE
    )
    :vars
    (
      ?auto_2677755 - HOIST
      ?auto_2677756 - PLACE
      ?auto_2677752 - PLACE
      ?auto_2677754 - HOIST
      ?auto_2677753 - SURFACE
      ?auto_2677757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677755 ?auto_2677756 ) ( SURFACE-AT ?auto_2677750 ?auto_2677756 ) ( CLEAR ?auto_2677750 ) ( IS-CRATE ?auto_2677751 ) ( not ( = ?auto_2677750 ?auto_2677751 ) ) ( AVAILABLE ?auto_2677755 ) ( ON ?auto_2677750 ?auto_2677749 ) ( not ( = ?auto_2677749 ?auto_2677750 ) ) ( not ( = ?auto_2677749 ?auto_2677751 ) ) ( not ( = ?auto_2677752 ?auto_2677756 ) ) ( HOIST-AT ?auto_2677754 ?auto_2677752 ) ( not ( = ?auto_2677755 ?auto_2677754 ) ) ( AVAILABLE ?auto_2677754 ) ( SURFACE-AT ?auto_2677751 ?auto_2677752 ) ( ON ?auto_2677751 ?auto_2677753 ) ( CLEAR ?auto_2677751 ) ( not ( = ?auto_2677750 ?auto_2677753 ) ) ( not ( = ?auto_2677751 ?auto_2677753 ) ) ( not ( = ?auto_2677749 ?auto_2677753 ) ) ( TRUCK-AT ?auto_2677757 ?auto_2677756 ) ( ON ?auto_2677743 ?auto_2677742 ) ( ON ?auto_2677744 ?auto_2677743 ) ( ON ?auto_2677741 ?auto_2677744 ) ( ON ?auto_2677745 ?auto_2677741 ) ( ON ?auto_2677747 ?auto_2677745 ) ( ON ?auto_2677746 ?auto_2677747 ) ( ON ?auto_2677748 ?auto_2677746 ) ( ON ?auto_2677749 ?auto_2677748 ) ( not ( = ?auto_2677742 ?auto_2677743 ) ) ( not ( = ?auto_2677742 ?auto_2677744 ) ) ( not ( = ?auto_2677742 ?auto_2677741 ) ) ( not ( = ?auto_2677742 ?auto_2677745 ) ) ( not ( = ?auto_2677742 ?auto_2677747 ) ) ( not ( = ?auto_2677742 ?auto_2677746 ) ) ( not ( = ?auto_2677742 ?auto_2677748 ) ) ( not ( = ?auto_2677742 ?auto_2677749 ) ) ( not ( = ?auto_2677742 ?auto_2677750 ) ) ( not ( = ?auto_2677742 ?auto_2677751 ) ) ( not ( = ?auto_2677742 ?auto_2677753 ) ) ( not ( = ?auto_2677743 ?auto_2677744 ) ) ( not ( = ?auto_2677743 ?auto_2677741 ) ) ( not ( = ?auto_2677743 ?auto_2677745 ) ) ( not ( = ?auto_2677743 ?auto_2677747 ) ) ( not ( = ?auto_2677743 ?auto_2677746 ) ) ( not ( = ?auto_2677743 ?auto_2677748 ) ) ( not ( = ?auto_2677743 ?auto_2677749 ) ) ( not ( = ?auto_2677743 ?auto_2677750 ) ) ( not ( = ?auto_2677743 ?auto_2677751 ) ) ( not ( = ?auto_2677743 ?auto_2677753 ) ) ( not ( = ?auto_2677744 ?auto_2677741 ) ) ( not ( = ?auto_2677744 ?auto_2677745 ) ) ( not ( = ?auto_2677744 ?auto_2677747 ) ) ( not ( = ?auto_2677744 ?auto_2677746 ) ) ( not ( = ?auto_2677744 ?auto_2677748 ) ) ( not ( = ?auto_2677744 ?auto_2677749 ) ) ( not ( = ?auto_2677744 ?auto_2677750 ) ) ( not ( = ?auto_2677744 ?auto_2677751 ) ) ( not ( = ?auto_2677744 ?auto_2677753 ) ) ( not ( = ?auto_2677741 ?auto_2677745 ) ) ( not ( = ?auto_2677741 ?auto_2677747 ) ) ( not ( = ?auto_2677741 ?auto_2677746 ) ) ( not ( = ?auto_2677741 ?auto_2677748 ) ) ( not ( = ?auto_2677741 ?auto_2677749 ) ) ( not ( = ?auto_2677741 ?auto_2677750 ) ) ( not ( = ?auto_2677741 ?auto_2677751 ) ) ( not ( = ?auto_2677741 ?auto_2677753 ) ) ( not ( = ?auto_2677745 ?auto_2677747 ) ) ( not ( = ?auto_2677745 ?auto_2677746 ) ) ( not ( = ?auto_2677745 ?auto_2677748 ) ) ( not ( = ?auto_2677745 ?auto_2677749 ) ) ( not ( = ?auto_2677745 ?auto_2677750 ) ) ( not ( = ?auto_2677745 ?auto_2677751 ) ) ( not ( = ?auto_2677745 ?auto_2677753 ) ) ( not ( = ?auto_2677747 ?auto_2677746 ) ) ( not ( = ?auto_2677747 ?auto_2677748 ) ) ( not ( = ?auto_2677747 ?auto_2677749 ) ) ( not ( = ?auto_2677747 ?auto_2677750 ) ) ( not ( = ?auto_2677747 ?auto_2677751 ) ) ( not ( = ?auto_2677747 ?auto_2677753 ) ) ( not ( = ?auto_2677746 ?auto_2677748 ) ) ( not ( = ?auto_2677746 ?auto_2677749 ) ) ( not ( = ?auto_2677746 ?auto_2677750 ) ) ( not ( = ?auto_2677746 ?auto_2677751 ) ) ( not ( = ?auto_2677746 ?auto_2677753 ) ) ( not ( = ?auto_2677748 ?auto_2677749 ) ) ( not ( = ?auto_2677748 ?auto_2677750 ) ) ( not ( = ?auto_2677748 ?auto_2677751 ) ) ( not ( = ?auto_2677748 ?auto_2677753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677749 ?auto_2677750 ?auto_2677751 )
      ( MAKE-10CRATE-VERIFY ?auto_2677742 ?auto_2677743 ?auto_2677744 ?auto_2677741 ?auto_2677745 ?auto_2677747 ?auto_2677746 ?auto_2677748 ?auto_2677749 ?auto_2677750 ?auto_2677751 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677868 - SURFACE
      ?auto_2677869 - SURFACE
      ?auto_2677870 - SURFACE
      ?auto_2677867 - SURFACE
      ?auto_2677871 - SURFACE
      ?auto_2677873 - SURFACE
      ?auto_2677872 - SURFACE
      ?auto_2677874 - SURFACE
      ?auto_2677875 - SURFACE
      ?auto_2677876 - SURFACE
      ?auto_2677877 - SURFACE
    )
    :vars
    (
      ?auto_2677881 - HOIST
      ?auto_2677879 - PLACE
      ?auto_2677883 - PLACE
      ?auto_2677878 - HOIST
      ?auto_2677880 - SURFACE
      ?auto_2677882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677881 ?auto_2677879 ) ( IS-CRATE ?auto_2677877 ) ( not ( = ?auto_2677876 ?auto_2677877 ) ) ( not ( = ?auto_2677875 ?auto_2677876 ) ) ( not ( = ?auto_2677875 ?auto_2677877 ) ) ( not ( = ?auto_2677883 ?auto_2677879 ) ) ( HOIST-AT ?auto_2677878 ?auto_2677883 ) ( not ( = ?auto_2677881 ?auto_2677878 ) ) ( AVAILABLE ?auto_2677878 ) ( SURFACE-AT ?auto_2677877 ?auto_2677883 ) ( ON ?auto_2677877 ?auto_2677880 ) ( CLEAR ?auto_2677877 ) ( not ( = ?auto_2677876 ?auto_2677880 ) ) ( not ( = ?auto_2677877 ?auto_2677880 ) ) ( not ( = ?auto_2677875 ?auto_2677880 ) ) ( TRUCK-AT ?auto_2677882 ?auto_2677879 ) ( SURFACE-AT ?auto_2677875 ?auto_2677879 ) ( CLEAR ?auto_2677875 ) ( LIFTING ?auto_2677881 ?auto_2677876 ) ( IS-CRATE ?auto_2677876 ) ( ON ?auto_2677869 ?auto_2677868 ) ( ON ?auto_2677870 ?auto_2677869 ) ( ON ?auto_2677867 ?auto_2677870 ) ( ON ?auto_2677871 ?auto_2677867 ) ( ON ?auto_2677873 ?auto_2677871 ) ( ON ?auto_2677872 ?auto_2677873 ) ( ON ?auto_2677874 ?auto_2677872 ) ( ON ?auto_2677875 ?auto_2677874 ) ( not ( = ?auto_2677868 ?auto_2677869 ) ) ( not ( = ?auto_2677868 ?auto_2677870 ) ) ( not ( = ?auto_2677868 ?auto_2677867 ) ) ( not ( = ?auto_2677868 ?auto_2677871 ) ) ( not ( = ?auto_2677868 ?auto_2677873 ) ) ( not ( = ?auto_2677868 ?auto_2677872 ) ) ( not ( = ?auto_2677868 ?auto_2677874 ) ) ( not ( = ?auto_2677868 ?auto_2677875 ) ) ( not ( = ?auto_2677868 ?auto_2677876 ) ) ( not ( = ?auto_2677868 ?auto_2677877 ) ) ( not ( = ?auto_2677868 ?auto_2677880 ) ) ( not ( = ?auto_2677869 ?auto_2677870 ) ) ( not ( = ?auto_2677869 ?auto_2677867 ) ) ( not ( = ?auto_2677869 ?auto_2677871 ) ) ( not ( = ?auto_2677869 ?auto_2677873 ) ) ( not ( = ?auto_2677869 ?auto_2677872 ) ) ( not ( = ?auto_2677869 ?auto_2677874 ) ) ( not ( = ?auto_2677869 ?auto_2677875 ) ) ( not ( = ?auto_2677869 ?auto_2677876 ) ) ( not ( = ?auto_2677869 ?auto_2677877 ) ) ( not ( = ?auto_2677869 ?auto_2677880 ) ) ( not ( = ?auto_2677870 ?auto_2677867 ) ) ( not ( = ?auto_2677870 ?auto_2677871 ) ) ( not ( = ?auto_2677870 ?auto_2677873 ) ) ( not ( = ?auto_2677870 ?auto_2677872 ) ) ( not ( = ?auto_2677870 ?auto_2677874 ) ) ( not ( = ?auto_2677870 ?auto_2677875 ) ) ( not ( = ?auto_2677870 ?auto_2677876 ) ) ( not ( = ?auto_2677870 ?auto_2677877 ) ) ( not ( = ?auto_2677870 ?auto_2677880 ) ) ( not ( = ?auto_2677867 ?auto_2677871 ) ) ( not ( = ?auto_2677867 ?auto_2677873 ) ) ( not ( = ?auto_2677867 ?auto_2677872 ) ) ( not ( = ?auto_2677867 ?auto_2677874 ) ) ( not ( = ?auto_2677867 ?auto_2677875 ) ) ( not ( = ?auto_2677867 ?auto_2677876 ) ) ( not ( = ?auto_2677867 ?auto_2677877 ) ) ( not ( = ?auto_2677867 ?auto_2677880 ) ) ( not ( = ?auto_2677871 ?auto_2677873 ) ) ( not ( = ?auto_2677871 ?auto_2677872 ) ) ( not ( = ?auto_2677871 ?auto_2677874 ) ) ( not ( = ?auto_2677871 ?auto_2677875 ) ) ( not ( = ?auto_2677871 ?auto_2677876 ) ) ( not ( = ?auto_2677871 ?auto_2677877 ) ) ( not ( = ?auto_2677871 ?auto_2677880 ) ) ( not ( = ?auto_2677873 ?auto_2677872 ) ) ( not ( = ?auto_2677873 ?auto_2677874 ) ) ( not ( = ?auto_2677873 ?auto_2677875 ) ) ( not ( = ?auto_2677873 ?auto_2677876 ) ) ( not ( = ?auto_2677873 ?auto_2677877 ) ) ( not ( = ?auto_2677873 ?auto_2677880 ) ) ( not ( = ?auto_2677872 ?auto_2677874 ) ) ( not ( = ?auto_2677872 ?auto_2677875 ) ) ( not ( = ?auto_2677872 ?auto_2677876 ) ) ( not ( = ?auto_2677872 ?auto_2677877 ) ) ( not ( = ?auto_2677872 ?auto_2677880 ) ) ( not ( = ?auto_2677874 ?auto_2677875 ) ) ( not ( = ?auto_2677874 ?auto_2677876 ) ) ( not ( = ?auto_2677874 ?auto_2677877 ) ) ( not ( = ?auto_2677874 ?auto_2677880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677875 ?auto_2677876 ?auto_2677877 )
      ( MAKE-10CRATE-VERIFY ?auto_2677868 ?auto_2677869 ?auto_2677870 ?auto_2677867 ?auto_2677871 ?auto_2677873 ?auto_2677872 ?auto_2677874 ?auto_2677875 ?auto_2677876 ?auto_2677877 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677994 - SURFACE
      ?auto_2677995 - SURFACE
      ?auto_2677996 - SURFACE
      ?auto_2677993 - SURFACE
      ?auto_2677997 - SURFACE
      ?auto_2677999 - SURFACE
      ?auto_2677998 - SURFACE
      ?auto_2678000 - SURFACE
      ?auto_2678001 - SURFACE
      ?auto_2678002 - SURFACE
      ?auto_2678003 - SURFACE
    )
    :vars
    (
      ?auto_2678004 - HOIST
      ?auto_2678006 - PLACE
      ?auto_2678008 - PLACE
      ?auto_2678007 - HOIST
      ?auto_2678009 - SURFACE
      ?auto_2678005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2678004 ?auto_2678006 ) ( IS-CRATE ?auto_2678003 ) ( not ( = ?auto_2678002 ?auto_2678003 ) ) ( not ( = ?auto_2678001 ?auto_2678002 ) ) ( not ( = ?auto_2678001 ?auto_2678003 ) ) ( not ( = ?auto_2678008 ?auto_2678006 ) ) ( HOIST-AT ?auto_2678007 ?auto_2678008 ) ( not ( = ?auto_2678004 ?auto_2678007 ) ) ( AVAILABLE ?auto_2678007 ) ( SURFACE-AT ?auto_2678003 ?auto_2678008 ) ( ON ?auto_2678003 ?auto_2678009 ) ( CLEAR ?auto_2678003 ) ( not ( = ?auto_2678002 ?auto_2678009 ) ) ( not ( = ?auto_2678003 ?auto_2678009 ) ) ( not ( = ?auto_2678001 ?auto_2678009 ) ) ( TRUCK-AT ?auto_2678005 ?auto_2678006 ) ( SURFACE-AT ?auto_2678001 ?auto_2678006 ) ( CLEAR ?auto_2678001 ) ( IS-CRATE ?auto_2678002 ) ( AVAILABLE ?auto_2678004 ) ( IN ?auto_2678002 ?auto_2678005 ) ( ON ?auto_2677995 ?auto_2677994 ) ( ON ?auto_2677996 ?auto_2677995 ) ( ON ?auto_2677993 ?auto_2677996 ) ( ON ?auto_2677997 ?auto_2677993 ) ( ON ?auto_2677999 ?auto_2677997 ) ( ON ?auto_2677998 ?auto_2677999 ) ( ON ?auto_2678000 ?auto_2677998 ) ( ON ?auto_2678001 ?auto_2678000 ) ( not ( = ?auto_2677994 ?auto_2677995 ) ) ( not ( = ?auto_2677994 ?auto_2677996 ) ) ( not ( = ?auto_2677994 ?auto_2677993 ) ) ( not ( = ?auto_2677994 ?auto_2677997 ) ) ( not ( = ?auto_2677994 ?auto_2677999 ) ) ( not ( = ?auto_2677994 ?auto_2677998 ) ) ( not ( = ?auto_2677994 ?auto_2678000 ) ) ( not ( = ?auto_2677994 ?auto_2678001 ) ) ( not ( = ?auto_2677994 ?auto_2678002 ) ) ( not ( = ?auto_2677994 ?auto_2678003 ) ) ( not ( = ?auto_2677994 ?auto_2678009 ) ) ( not ( = ?auto_2677995 ?auto_2677996 ) ) ( not ( = ?auto_2677995 ?auto_2677993 ) ) ( not ( = ?auto_2677995 ?auto_2677997 ) ) ( not ( = ?auto_2677995 ?auto_2677999 ) ) ( not ( = ?auto_2677995 ?auto_2677998 ) ) ( not ( = ?auto_2677995 ?auto_2678000 ) ) ( not ( = ?auto_2677995 ?auto_2678001 ) ) ( not ( = ?auto_2677995 ?auto_2678002 ) ) ( not ( = ?auto_2677995 ?auto_2678003 ) ) ( not ( = ?auto_2677995 ?auto_2678009 ) ) ( not ( = ?auto_2677996 ?auto_2677993 ) ) ( not ( = ?auto_2677996 ?auto_2677997 ) ) ( not ( = ?auto_2677996 ?auto_2677999 ) ) ( not ( = ?auto_2677996 ?auto_2677998 ) ) ( not ( = ?auto_2677996 ?auto_2678000 ) ) ( not ( = ?auto_2677996 ?auto_2678001 ) ) ( not ( = ?auto_2677996 ?auto_2678002 ) ) ( not ( = ?auto_2677996 ?auto_2678003 ) ) ( not ( = ?auto_2677996 ?auto_2678009 ) ) ( not ( = ?auto_2677993 ?auto_2677997 ) ) ( not ( = ?auto_2677993 ?auto_2677999 ) ) ( not ( = ?auto_2677993 ?auto_2677998 ) ) ( not ( = ?auto_2677993 ?auto_2678000 ) ) ( not ( = ?auto_2677993 ?auto_2678001 ) ) ( not ( = ?auto_2677993 ?auto_2678002 ) ) ( not ( = ?auto_2677993 ?auto_2678003 ) ) ( not ( = ?auto_2677993 ?auto_2678009 ) ) ( not ( = ?auto_2677997 ?auto_2677999 ) ) ( not ( = ?auto_2677997 ?auto_2677998 ) ) ( not ( = ?auto_2677997 ?auto_2678000 ) ) ( not ( = ?auto_2677997 ?auto_2678001 ) ) ( not ( = ?auto_2677997 ?auto_2678002 ) ) ( not ( = ?auto_2677997 ?auto_2678003 ) ) ( not ( = ?auto_2677997 ?auto_2678009 ) ) ( not ( = ?auto_2677999 ?auto_2677998 ) ) ( not ( = ?auto_2677999 ?auto_2678000 ) ) ( not ( = ?auto_2677999 ?auto_2678001 ) ) ( not ( = ?auto_2677999 ?auto_2678002 ) ) ( not ( = ?auto_2677999 ?auto_2678003 ) ) ( not ( = ?auto_2677999 ?auto_2678009 ) ) ( not ( = ?auto_2677998 ?auto_2678000 ) ) ( not ( = ?auto_2677998 ?auto_2678001 ) ) ( not ( = ?auto_2677998 ?auto_2678002 ) ) ( not ( = ?auto_2677998 ?auto_2678003 ) ) ( not ( = ?auto_2677998 ?auto_2678009 ) ) ( not ( = ?auto_2678000 ?auto_2678001 ) ) ( not ( = ?auto_2678000 ?auto_2678002 ) ) ( not ( = ?auto_2678000 ?auto_2678003 ) ) ( not ( = ?auto_2678000 ?auto_2678009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2678001 ?auto_2678002 ?auto_2678003 )
      ( MAKE-10CRATE-VERIFY ?auto_2677994 ?auto_2677995 ?auto_2677996 ?auto_2677993 ?auto_2677997 ?auto_2677999 ?auto_2677998 ?auto_2678000 ?auto_2678001 ?auto_2678002 ?auto_2678003 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685263 - SURFACE
      ?auto_2685264 - SURFACE
      ?auto_2685265 - SURFACE
      ?auto_2685262 - SURFACE
      ?auto_2685266 - SURFACE
      ?auto_2685268 - SURFACE
      ?auto_2685267 - SURFACE
      ?auto_2685269 - SURFACE
      ?auto_2685270 - SURFACE
      ?auto_2685271 - SURFACE
      ?auto_2685272 - SURFACE
      ?auto_2685273 - SURFACE
    )
    :vars
    (
      ?auto_2685274 - HOIST
      ?auto_2685275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685274 ?auto_2685275 ) ( SURFACE-AT ?auto_2685272 ?auto_2685275 ) ( CLEAR ?auto_2685272 ) ( LIFTING ?auto_2685274 ?auto_2685273 ) ( IS-CRATE ?auto_2685273 ) ( not ( = ?auto_2685272 ?auto_2685273 ) ) ( ON ?auto_2685264 ?auto_2685263 ) ( ON ?auto_2685265 ?auto_2685264 ) ( ON ?auto_2685262 ?auto_2685265 ) ( ON ?auto_2685266 ?auto_2685262 ) ( ON ?auto_2685268 ?auto_2685266 ) ( ON ?auto_2685267 ?auto_2685268 ) ( ON ?auto_2685269 ?auto_2685267 ) ( ON ?auto_2685270 ?auto_2685269 ) ( ON ?auto_2685271 ?auto_2685270 ) ( ON ?auto_2685272 ?auto_2685271 ) ( not ( = ?auto_2685263 ?auto_2685264 ) ) ( not ( = ?auto_2685263 ?auto_2685265 ) ) ( not ( = ?auto_2685263 ?auto_2685262 ) ) ( not ( = ?auto_2685263 ?auto_2685266 ) ) ( not ( = ?auto_2685263 ?auto_2685268 ) ) ( not ( = ?auto_2685263 ?auto_2685267 ) ) ( not ( = ?auto_2685263 ?auto_2685269 ) ) ( not ( = ?auto_2685263 ?auto_2685270 ) ) ( not ( = ?auto_2685263 ?auto_2685271 ) ) ( not ( = ?auto_2685263 ?auto_2685272 ) ) ( not ( = ?auto_2685263 ?auto_2685273 ) ) ( not ( = ?auto_2685264 ?auto_2685265 ) ) ( not ( = ?auto_2685264 ?auto_2685262 ) ) ( not ( = ?auto_2685264 ?auto_2685266 ) ) ( not ( = ?auto_2685264 ?auto_2685268 ) ) ( not ( = ?auto_2685264 ?auto_2685267 ) ) ( not ( = ?auto_2685264 ?auto_2685269 ) ) ( not ( = ?auto_2685264 ?auto_2685270 ) ) ( not ( = ?auto_2685264 ?auto_2685271 ) ) ( not ( = ?auto_2685264 ?auto_2685272 ) ) ( not ( = ?auto_2685264 ?auto_2685273 ) ) ( not ( = ?auto_2685265 ?auto_2685262 ) ) ( not ( = ?auto_2685265 ?auto_2685266 ) ) ( not ( = ?auto_2685265 ?auto_2685268 ) ) ( not ( = ?auto_2685265 ?auto_2685267 ) ) ( not ( = ?auto_2685265 ?auto_2685269 ) ) ( not ( = ?auto_2685265 ?auto_2685270 ) ) ( not ( = ?auto_2685265 ?auto_2685271 ) ) ( not ( = ?auto_2685265 ?auto_2685272 ) ) ( not ( = ?auto_2685265 ?auto_2685273 ) ) ( not ( = ?auto_2685262 ?auto_2685266 ) ) ( not ( = ?auto_2685262 ?auto_2685268 ) ) ( not ( = ?auto_2685262 ?auto_2685267 ) ) ( not ( = ?auto_2685262 ?auto_2685269 ) ) ( not ( = ?auto_2685262 ?auto_2685270 ) ) ( not ( = ?auto_2685262 ?auto_2685271 ) ) ( not ( = ?auto_2685262 ?auto_2685272 ) ) ( not ( = ?auto_2685262 ?auto_2685273 ) ) ( not ( = ?auto_2685266 ?auto_2685268 ) ) ( not ( = ?auto_2685266 ?auto_2685267 ) ) ( not ( = ?auto_2685266 ?auto_2685269 ) ) ( not ( = ?auto_2685266 ?auto_2685270 ) ) ( not ( = ?auto_2685266 ?auto_2685271 ) ) ( not ( = ?auto_2685266 ?auto_2685272 ) ) ( not ( = ?auto_2685266 ?auto_2685273 ) ) ( not ( = ?auto_2685268 ?auto_2685267 ) ) ( not ( = ?auto_2685268 ?auto_2685269 ) ) ( not ( = ?auto_2685268 ?auto_2685270 ) ) ( not ( = ?auto_2685268 ?auto_2685271 ) ) ( not ( = ?auto_2685268 ?auto_2685272 ) ) ( not ( = ?auto_2685268 ?auto_2685273 ) ) ( not ( = ?auto_2685267 ?auto_2685269 ) ) ( not ( = ?auto_2685267 ?auto_2685270 ) ) ( not ( = ?auto_2685267 ?auto_2685271 ) ) ( not ( = ?auto_2685267 ?auto_2685272 ) ) ( not ( = ?auto_2685267 ?auto_2685273 ) ) ( not ( = ?auto_2685269 ?auto_2685270 ) ) ( not ( = ?auto_2685269 ?auto_2685271 ) ) ( not ( = ?auto_2685269 ?auto_2685272 ) ) ( not ( = ?auto_2685269 ?auto_2685273 ) ) ( not ( = ?auto_2685270 ?auto_2685271 ) ) ( not ( = ?auto_2685270 ?auto_2685272 ) ) ( not ( = ?auto_2685270 ?auto_2685273 ) ) ( not ( = ?auto_2685271 ?auto_2685272 ) ) ( not ( = ?auto_2685271 ?auto_2685273 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2685272 ?auto_2685273 )
      ( MAKE-11CRATE-VERIFY ?auto_2685263 ?auto_2685264 ?auto_2685265 ?auto_2685262 ?auto_2685266 ?auto_2685268 ?auto_2685267 ?auto_2685269 ?auto_2685270 ?auto_2685271 ?auto_2685272 ?auto_2685273 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685372 - SURFACE
      ?auto_2685373 - SURFACE
      ?auto_2685374 - SURFACE
      ?auto_2685371 - SURFACE
      ?auto_2685375 - SURFACE
      ?auto_2685377 - SURFACE
      ?auto_2685376 - SURFACE
      ?auto_2685378 - SURFACE
      ?auto_2685379 - SURFACE
      ?auto_2685380 - SURFACE
      ?auto_2685381 - SURFACE
      ?auto_2685382 - SURFACE
    )
    :vars
    (
      ?auto_2685383 - HOIST
      ?auto_2685385 - PLACE
      ?auto_2685384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685383 ?auto_2685385 ) ( SURFACE-AT ?auto_2685381 ?auto_2685385 ) ( CLEAR ?auto_2685381 ) ( IS-CRATE ?auto_2685382 ) ( not ( = ?auto_2685381 ?auto_2685382 ) ) ( TRUCK-AT ?auto_2685384 ?auto_2685385 ) ( AVAILABLE ?auto_2685383 ) ( IN ?auto_2685382 ?auto_2685384 ) ( ON ?auto_2685381 ?auto_2685380 ) ( not ( = ?auto_2685380 ?auto_2685381 ) ) ( not ( = ?auto_2685380 ?auto_2685382 ) ) ( ON ?auto_2685373 ?auto_2685372 ) ( ON ?auto_2685374 ?auto_2685373 ) ( ON ?auto_2685371 ?auto_2685374 ) ( ON ?auto_2685375 ?auto_2685371 ) ( ON ?auto_2685377 ?auto_2685375 ) ( ON ?auto_2685376 ?auto_2685377 ) ( ON ?auto_2685378 ?auto_2685376 ) ( ON ?auto_2685379 ?auto_2685378 ) ( ON ?auto_2685380 ?auto_2685379 ) ( not ( = ?auto_2685372 ?auto_2685373 ) ) ( not ( = ?auto_2685372 ?auto_2685374 ) ) ( not ( = ?auto_2685372 ?auto_2685371 ) ) ( not ( = ?auto_2685372 ?auto_2685375 ) ) ( not ( = ?auto_2685372 ?auto_2685377 ) ) ( not ( = ?auto_2685372 ?auto_2685376 ) ) ( not ( = ?auto_2685372 ?auto_2685378 ) ) ( not ( = ?auto_2685372 ?auto_2685379 ) ) ( not ( = ?auto_2685372 ?auto_2685380 ) ) ( not ( = ?auto_2685372 ?auto_2685381 ) ) ( not ( = ?auto_2685372 ?auto_2685382 ) ) ( not ( = ?auto_2685373 ?auto_2685374 ) ) ( not ( = ?auto_2685373 ?auto_2685371 ) ) ( not ( = ?auto_2685373 ?auto_2685375 ) ) ( not ( = ?auto_2685373 ?auto_2685377 ) ) ( not ( = ?auto_2685373 ?auto_2685376 ) ) ( not ( = ?auto_2685373 ?auto_2685378 ) ) ( not ( = ?auto_2685373 ?auto_2685379 ) ) ( not ( = ?auto_2685373 ?auto_2685380 ) ) ( not ( = ?auto_2685373 ?auto_2685381 ) ) ( not ( = ?auto_2685373 ?auto_2685382 ) ) ( not ( = ?auto_2685374 ?auto_2685371 ) ) ( not ( = ?auto_2685374 ?auto_2685375 ) ) ( not ( = ?auto_2685374 ?auto_2685377 ) ) ( not ( = ?auto_2685374 ?auto_2685376 ) ) ( not ( = ?auto_2685374 ?auto_2685378 ) ) ( not ( = ?auto_2685374 ?auto_2685379 ) ) ( not ( = ?auto_2685374 ?auto_2685380 ) ) ( not ( = ?auto_2685374 ?auto_2685381 ) ) ( not ( = ?auto_2685374 ?auto_2685382 ) ) ( not ( = ?auto_2685371 ?auto_2685375 ) ) ( not ( = ?auto_2685371 ?auto_2685377 ) ) ( not ( = ?auto_2685371 ?auto_2685376 ) ) ( not ( = ?auto_2685371 ?auto_2685378 ) ) ( not ( = ?auto_2685371 ?auto_2685379 ) ) ( not ( = ?auto_2685371 ?auto_2685380 ) ) ( not ( = ?auto_2685371 ?auto_2685381 ) ) ( not ( = ?auto_2685371 ?auto_2685382 ) ) ( not ( = ?auto_2685375 ?auto_2685377 ) ) ( not ( = ?auto_2685375 ?auto_2685376 ) ) ( not ( = ?auto_2685375 ?auto_2685378 ) ) ( not ( = ?auto_2685375 ?auto_2685379 ) ) ( not ( = ?auto_2685375 ?auto_2685380 ) ) ( not ( = ?auto_2685375 ?auto_2685381 ) ) ( not ( = ?auto_2685375 ?auto_2685382 ) ) ( not ( = ?auto_2685377 ?auto_2685376 ) ) ( not ( = ?auto_2685377 ?auto_2685378 ) ) ( not ( = ?auto_2685377 ?auto_2685379 ) ) ( not ( = ?auto_2685377 ?auto_2685380 ) ) ( not ( = ?auto_2685377 ?auto_2685381 ) ) ( not ( = ?auto_2685377 ?auto_2685382 ) ) ( not ( = ?auto_2685376 ?auto_2685378 ) ) ( not ( = ?auto_2685376 ?auto_2685379 ) ) ( not ( = ?auto_2685376 ?auto_2685380 ) ) ( not ( = ?auto_2685376 ?auto_2685381 ) ) ( not ( = ?auto_2685376 ?auto_2685382 ) ) ( not ( = ?auto_2685378 ?auto_2685379 ) ) ( not ( = ?auto_2685378 ?auto_2685380 ) ) ( not ( = ?auto_2685378 ?auto_2685381 ) ) ( not ( = ?auto_2685378 ?auto_2685382 ) ) ( not ( = ?auto_2685379 ?auto_2685380 ) ) ( not ( = ?auto_2685379 ?auto_2685381 ) ) ( not ( = ?auto_2685379 ?auto_2685382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685380 ?auto_2685381 ?auto_2685382 )
      ( MAKE-11CRATE-VERIFY ?auto_2685372 ?auto_2685373 ?auto_2685374 ?auto_2685371 ?auto_2685375 ?auto_2685377 ?auto_2685376 ?auto_2685378 ?auto_2685379 ?auto_2685380 ?auto_2685381 ?auto_2685382 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685493 - SURFACE
      ?auto_2685494 - SURFACE
      ?auto_2685495 - SURFACE
      ?auto_2685492 - SURFACE
      ?auto_2685496 - SURFACE
      ?auto_2685498 - SURFACE
      ?auto_2685497 - SURFACE
      ?auto_2685499 - SURFACE
      ?auto_2685500 - SURFACE
      ?auto_2685501 - SURFACE
      ?auto_2685502 - SURFACE
      ?auto_2685503 - SURFACE
    )
    :vars
    (
      ?auto_2685507 - HOIST
      ?auto_2685506 - PLACE
      ?auto_2685505 - TRUCK
      ?auto_2685504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685507 ?auto_2685506 ) ( SURFACE-AT ?auto_2685502 ?auto_2685506 ) ( CLEAR ?auto_2685502 ) ( IS-CRATE ?auto_2685503 ) ( not ( = ?auto_2685502 ?auto_2685503 ) ) ( AVAILABLE ?auto_2685507 ) ( IN ?auto_2685503 ?auto_2685505 ) ( ON ?auto_2685502 ?auto_2685501 ) ( not ( = ?auto_2685501 ?auto_2685502 ) ) ( not ( = ?auto_2685501 ?auto_2685503 ) ) ( TRUCK-AT ?auto_2685505 ?auto_2685504 ) ( not ( = ?auto_2685504 ?auto_2685506 ) ) ( ON ?auto_2685494 ?auto_2685493 ) ( ON ?auto_2685495 ?auto_2685494 ) ( ON ?auto_2685492 ?auto_2685495 ) ( ON ?auto_2685496 ?auto_2685492 ) ( ON ?auto_2685498 ?auto_2685496 ) ( ON ?auto_2685497 ?auto_2685498 ) ( ON ?auto_2685499 ?auto_2685497 ) ( ON ?auto_2685500 ?auto_2685499 ) ( ON ?auto_2685501 ?auto_2685500 ) ( not ( = ?auto_2685493 ?auto_2685494 ) ) ( not ( = ?auto_2685493 ?auto_2685495 ) ) ( not ( = ?auto_2685493 ?auto_2685492 ) ) ( not ( = ?auto_2685493 ?auto_2685496 ) ) ( not ( = ?auto_2685493 ?auto_2685498 ) ) ( not ( = ?auto_2685493 ?auto_2685497 ) ) ( not ( = ?auto_2685493 ?auto_2685499 ) ) ( not ( = ?auto_2685493 ?auto_2685500 ) ) ( not ( = ?auto_2685493 ?auto_2685501 ) ) ( not ( = ?auto_2685493 ?auto_2685502 ) ) ( not ( = ?auto_2685493 ?auto_2685503 ) ) ( not ( = ?auto_2685494 ?auto_2685495 ) ) ( not ( = ?auto_2685494 ?auto_2685492 ) ) ( not ( = ?auto_2685494 ?auto_2685496 ) ) ( not ( = ?auto_2685494 ?auto_2685498 ) ) ( not ( = ?auto_2685494 ?auto_2685497 ) ) ( not ( = ?auto_2685494 ?auto_2685499 ) ) ( not ( = ?auto_2685494 ?auto_2685500 ) ) ( not ( = ?auto_2685494 ?auto_2685501 ) ) ( not ( = ?auto_2685494 ?auto_2685502 ) ) ( not ( = ?auto_2685494 ?auto_2685503 ) ) ( not ( = ?auto_2685495 ?auto_2685492 ) ) ( not ( = ?auto_2685495 ?auto_2685496 ) ) ( not ( = ?auto_2685495 ?auto_2685498 ) ) ( not ( = ?auto_2685495 ?auto_2685497 ) ) ( not ( = ?auto_2685495 ?auto_2685499 ) ) ( not ( = ?auto_2685495 ?auto_2685500 ) ) ( not ( = ?auto_2685495 ?auto_2685501 ) ) ( not ( = ?auto_2685495 ?auto_2685502 ) ) ( not ( = ?auto_2685495 ?auto_2685503 ) ) ( not ( = ?auto_2685492 ?auto_2685496 ) ) ( not ( = ?auto_2685492 ?auto_2685498 ) ) ( not ( = ?auto_2685492 ?auto_2685497 ) ) ( not ( = ?auto_2685492 ?auto_2685499 ) ) ( not ( = ?auto_2685492 ?auto_2685500 ) ) ( not ( = ?auto_2685492 ?auto_2685501 ) ) ( not ( = ?auto_2685492 ?auto_2685502 ) ) ( not ( = ?auto_2685492 ?auto_2685503 ) ) ( not ( = ?auto_2685496 ?auto_2685498 ) ) ( not ( = ?auto_2685496 ?auto_2685497 ) ) ( not ( = ?auto_2685496 ?auto_2685499 ) ) ( not ( = ?auto_2685496 ?auto_2685500 ) ) ( not ( = ?auto_2685496 ?auto_2685501 ) ) ( not ( = ?auto_2685496 ?auto_2685502 ) ) ( not ( = ?auto_2685496 ?auto_2685503 ) ) ( not ( = ?auto_2685498 ?auto_2685497 ) ) ( not ( = ?auto_2685498 ?auto_2685499 ) ) ( not ( = ?auto_2685498 ?auto_2685500 ) ) ( not ( = ?auto_2685498 ?auto_2685501 ) ) ( not ( = ?auto_2685498 ?auto_2685502 ) ) ( not ( = ?auto_2685498 ?auto_2685503 ) ) ( not ( = ?auto_2685497 ?auto_2685499 ) ) ( not ( = ?auto_2685497 ?auto_2685500 ) ) ( not ( = ?auto_2685497 ?auto_2685501 ) ) ( not ( = ?auto_2685497 ?auto_2685502 ) ) ( not ( = ?auto_2685497 ?auto_2685503 ) ) ( not ( = ?auto_2685499 ?auto_2685500 ) ) ( not ( = ?auto_2685499 ?auto_2685501 ) ) ( not ( = ?auto_2685499 ?auto_2685502 ) ) ( not ( = ?auto_2685499 ?auto_2685503 ) ) ( not ( = ?auto_2685500 ?auto_2685501 ) ) ( not ( = ?auto_2685500 ?auto_2685502 ) ) ( not ( = ?auto_2685500 ?auto_2685503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685501 ?auto_2685502 ?auto_2685503 )
      ( MAKE-11CRATE-VERIFY ?auto_2685493 ?auto_2685494 ?auto_2685495 ?auto_2685492 ?auto_2685496 ?auto_2685498 ?auto_2685497 ?auto_2685499 ?auto_2685500 ?auto_2685501 ?auto_2685502 ?auto_2685503 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685625 - SURFACE
      ?auto_2685626 - SURFACE
      ?auto_2685627 - SURFACE
      ?auto_2685624 - SURFACE
      ?auto_2685628 - SURFACE
      ?auto_2685630 - SURFACE
      ?auto_2685629 - SURFACE
      ?auto_2685631 - SURFACE
      ?auto_2685632 - SURFACE
      ?auto_2685633 - SURFACE
      ?auto_2685634 - SURFACE
      ?auto_2685635 - SURFACE
    )
    :vars
    (
      ?auto_2685638 - HOIST
      ?auto_2685637 - PLACE
      ?auto_2685639 - TRUCK
      ?auto_2685640 - PLACE
      ?auto_2685636 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685638 ?auto_2685637 ) ( SURFACE-AT ?auto_2685634 ?auto_2685637 ) ( CLEAR ?auto_2685634 ) ( IS-CRATE ?auto_2685635 ) ( not ( = ?auto_2685634 ?auto_2685635 ) ) ( AVAILABLE ?auto_2685638 ) ( ON ?auto_2685634 ?auto_2685633 ) ( not ( = ?auto_2685633 ?auto_2685634 ) ) ( not ( = ?auto_2685633 ?auto_2685635 ) ) ( TRUCK-AT ?auto_2685639 ?auto_2685640 ) ( not ( = ?auto_2685640 ?auto_2685637 ) ) ( HOIST-AT ?auto_2685636 ?auto_2685640 ) ( LIFTING ?auto_2685636 ?auto_2685635 ) ( not ( = ?auto_2685638 ?auto_2685636 ) ) ( ON ?auto_2685626 ?auto_2685625 ) ( ON ?auto_2685627 ?auto_2685626 ) ( ON ?auto_2685624 ?auto_2685627 ) ( ON ?auto_2685628 ?auto_2685624 ) ( ON ?auto_2685630 ?auto_2685628 ) ( ON ?auto_2685629 ?auto_2685630 ) ( ON ?auto_2685631 ?auto_2685629 ) ( ON ?auto_2685632 ?auto_2685631 ) ( ON ?auto_2685633 ?auto_2685632 ) ( not ( = ?auto_2685625 ?auto_2685626 ) ) ( not ( = ?auto_2685625 ?auto_2685627 ) ) ( not ( = ?auto_2685625 ?auto_2685624 ) ) ( not ( = ?auto_2685625 ?auto_2685628 ) ) ( not ( = ?auto_2685625 ?auto_2685630 ) ) ( not ( = ?auto_2685625 ?auto_2685629 ) ) ( not ( = ?auto_2685625 ?auto_2685631 ) ) ( not ( = ?auto_2685625 ?auto_2685632 ) ) ( not ( = ?auto_2685625 ?auto_2685633 ) ) ( not ( = ?auto_2685625 ?auto_2685634 ) ) ( not ( = ?auto_2685625 ?auto_2685635 ) ) ( not ( = ?auto_2685626 ?auto_2685627 ) ) ( not ( = ?auto_2685626 ?auto_2685624 ) ) ( not ( = ?auto_2685626 ?auto_2685628 ) ) ( not ( = ?auto_2685626 ?auto_2685630 ) ) ( not ( = ?auto_2685626 ?auto_2685629 ) ) ( not ( = ?auto_2685626 ?auto_2685631 ) ) ( not ( = ?auto_2685626 ?auto_2685632 ) ) ( not ( = ?auto_2685626 ?auto_2685633 ) ) ( not ( = ?auto_2685626 ?auto_2685634 ) ) ( not ( = ?auto_2685626 ?auto_2685635 ) ) ( not ( = ?auto_2685627 ?auto_2685624 ) ) ( not ( = ?auto_2685627 ?auto_2685628 ) ) ( not ( = ?auto_2685627 ?auto_2685630 ) ) ( not ( = ?auto_2685627 ?auto_2685629 ) ) ( not ( = ?auto_2685627 ?auto_2685631 ) ) ( not ( = ?auto_2685627 ?auto_2685632 ) ) ( not ( = ?auto_2685627 ?auto_2685633 ) ) ( not ( = ?auto_2685627 ?auto_2685634 ) ) ( not ( = ?auto_2685627 ?auto_2685635 ) ) ( not ( = ?auto_2685624 ?auto_2685628 ) ) ( not ( = ?auto_2685624 ?auto_2685630 ) ) ( not ( = ?auto_2685624 ?auto_2685629 ) ) ( not ( = ?auto_2685624 ?auto_2685631 ) ) ( not ( = ?auto_2685624 ?auto_2685632 ) ) ( not ( = ?auto_2685624 ?auto_2685633 ) ) ( not ( = ?auto_2685624 ?auto_2685634 ) ) ( not ( = ?auto_2685624 ?auto_2685635 ) ) ( not ( = ?auto_2685628 ?auto_2685630 ) ) ( not ( = ?auto_2685628 ?auto_2685629 ) ) ( not ( = ?auto_2685628 ?auto_2685631 ) ) ( not ( = ?auto_2685628 ?auto_2685632 ) ) ( not ( = ?auto_2685628 ?auto_2685633 ) ) ( not ( = ?auto_2685628 ?auto_2685634 ) ) ( not ( = ?auto_2685628 ?auto_2685635 ) ) ( not ( = ?auto_2685630 ?auto_2685629 ) ) ( not ( = ?auto_2685630 ?auto_2685631 ) ) ( not ( = ?auto_2685630 ?auto_2685632 ) ) ( not ( = ?auto_2685630 ?auto_2685633 ) ) ( not ( = ?auto_2685630 ?auto_2685634 ) ) ( not ( = ?auto_2685630 ?auto_2685635 ) ) ( not ( = ?auto_2685629 ?auto_2685631 ) ) ( not ( = ?auto_2685629 ?auto_2685632 ) ) ( not ( = ?auto_2685629 ?auto_2685633 ) ) ( not ( = ?auto_2685629 ?auto_2685634 ) ) ( not ( = ?auto_2685629 ?auto_2685635 ) ) ( not ( = ?auto_2685631 ?auto_2685632 ) ) ( not ( = ?auto_2685631 ?auto_2685633 ) ) ( not ( = ?auto_2685631 ?auto_2685634 ) ) ( not ( = ?auto_2685631 ?auto_2685635 ) ) ( not ( = ?auto_2685632 ?auto_2685633 ) ) ( not ( = ?auto_2685632 ?auto_2685634 ) ) ( not ( = ?auto_2685632 ?auto_2685635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685633 ?auto_2685634 ?auto_2685635 )
      ( MAKE-11CRATE-VERIFY ?auto_2685625 ?auto_2685626 ?auto_2685627 ?auto_2685624 ?auto_2685628 ?auto_2685630 ?auto_2685629 ?auto_2685631 ?auto_2685632 ?auto_2685633 ?auto_2685634 ?auto_2685635 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685768 - SURFACE
      ?auto_2685769 - SURFACE
      ?auto_2685770 - SURFACE
      ?auto_2685767 - SURFACE
      ?auto_2685771 - SURFACE
      ?auto_2685773 - SURFACE
      ?auto_2685772 - SURFACE
      ?auto_2685774 - SURFACE
      ?auto_2685775 - SURFACE
      ?auto_2685776 - SURFACE
      ?auto_2685777 - SURFACE
      ?auto_2685778 - SURFACE
    )
    :vars
    (
      ?auto_2685783 - HOIST
      ?auto_2685782 - PLACE
      ?auto_2685781 - TRUCK
      ?auto_2685784 - PLACE
      ?auto_2685779 - HOIST
      ?auto_2685780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685783 ?auto_2685782 ) ( SURFACE-AT ?auto_2685777 ?auto_2685782 ) ( CLEAR ?auto_2685777 ) ( IS-CRATE ?auto_2685778 ) ( not ( = ?auto_2685777 ?auto_2685778 ) ) ( AVAILABLE ?auto_2685783 ) ( ON ?auto_2685777 ?auto_2685776 ) ( not ( = ?auto_2685776 ?auto_2685777 ) ) ( not ( = ?auto_2685776 ?auto_2685778 ) ) ( TRUCK-AT ?auto_2685781 ?auto_2685784 ) ( not ( = ?auto_2685784 ?auto_2685782 ) ) ( HOIST-AT ?auto_2685779 ?auto_2685784 ) ( not ( = ?auto_2685783 ?auto_2685779 ) ) ( AVAILABLE ?auto_2685779 ) ( SURFACE-AT ?auto_2685778 ?auto_2685784 ) ( ON ?auto_2685778 ?auto_2685780 ) ( CLEAR ?auto_2685778 ) ( not ( = ?auto_2685777 ?auto_2685780 ) ) ( not ( = ?auto_2685778 ?auto_2685780 ) ) ( not ( = ?auto_2685776 ?auto_2685780 ) ) ( ON ?auto_2685769 ?auto_2685768 ) ( ON ?auto_2685770 ?auto_2685769 ) ( ON ?auto_2685767 ?auto_2685770 ) ( ON ?auto_2685771 ?auto_2685767 ) ( ON ?auto_2685773 ?auto_2685771 ) ( ON ?auto_2685772 ?auto_2685773 ) ( ON ?auto_2685774 ?auto_2685772 ) ( ON ?auto_2685775 ?auto_2685774 ) ( ON ?auto_2685776 ?auto_2685775 ) ( not ( = ?auto_2685768 ?auto_2685769 ) ) ( not ( = ?auto_2685768 ?auto_2685770 ) ) ( not ( = ?auto_2685768 ?auto_2685767 ) ) ( not ( = ?auto_2685768 ?auto_2685771 ) ) ( not ( = ?auto_2685768 ?auto_2685773 ) ) ( not ( = ?auto_2685768 ?auto_2685772 ) ) ( not ( = ?auto_2685768 ?auto_2685774 ) ) ( not ( = ?auto_2685768 ?auto_2685775 ) ) ( not ( = ?auto_2685768 ?auto_2685776 ) ) ( not ( = ?auto_2685768 ?auto_2685777 ) ) ( not ( = ?auto_2685768 ?auto_2685778 ) ) ( not ( = ?auto_2685768 ?auto_2685780 ) ) ( not ( = ?auto_2685769 ?auto_2685770 ) ) ( not ( = ?auto_2685769 ?auto_2685767 ) ) ( not ( = ?auto_2685769 ?auto_2685771 ) ) ( not ( = ?auto_2685769 ?auto_2685773 ) ) ( not ( = ?auto_2685769 ?auto_2685772 ) ) ( not ( = ?auto_2685769 ?auto_2685774 ) ) ( not ( = ?auto_2685769 ?auto_2685775 ) ) ( not ( = ?auto_2685769 ?auto_2685776 ) ) ( not ( = ?auto_2685769 ?auto_2685777 ) ) ( not ( = ?auto_2685769 ?auto_2685778 ) ) ( not ( = ?auto_2685769 ?auto_2685780 ) ) ( not ( = ?auto_2685770 ?auto_2685767 ) ) ( not ( = ?auto_2685770 ?auto_2685771 ) ) ( not ( = ?auto_2685770 ?auto_2685773 ) ) ( not ( = ?auto_2685770 ?auto_2685772 ) ) ( not ( = ?auto_2685770 ?auto_2685774 ) ) ( not ( = ?auto_2685770 ?auto_2685775 ) ) ( not ( = ?auto_2685770 ?auto_2685776 ) ) ( not ( = ?auto_2685770 ?auto_2685777 ) ) ( not ( = ?auto_2685770 ?auto_2685778 ) ) ( not ( = ?auto_2685770 ?auto_2685780 ) ) ( not ( = ?auto_2685767 ?auto_2685771 ) ) ( not ( = ?auto_2685767 ?auto_2685773 ) ) ( not ( = ?auto_2685767 ?auto_2685772 ) ) ( not ( = ?auto_2685767 ?auto_2685774 ) ) ( not ( = ?auto_2685767 ?auto_2685775 ) ) ( not ( = ?auto_2685767 ?auto_2685776 ) ) ( not ( = ?auto_2685767 ?auto_2685777 ) ) ( not ( = ?auto_2685767 ?auto_2685778 ) ) ( not ( = ?auto_2685767 ?auto_2685780 ) ) ( not ( = ?auto_2685771 ?auto_2685773 ) ) ( not ( = ?auto_2685771 ?auto_2685772 ) ) ( not ( = ?auto_2685771 ?auto_2685774 ) ) ( not ( = ?auto_2685771 ?auto_2685775 ) ) ( not ( = ?auto_2685771 ?auto_2685776 ) ) ( not ( = ?auto_2685771 ?auto_2685777 ) ) ( not ( = ?auto_2685771 ?auto_2685778 ) ) ( not ( = ?auto_2685771 ?auto_2685780 ) ) ( not ( = ?auto_2685773 ?auto_2685772 ) ) ( not ( = ?auto_2685773 ?auto_2685774 ) ) ( not ( = ?auto_2685773 ?auto_2685775 ) ) ( not ( = ?auto_2685773 ?auto_2685776 ) ) ( not ( = ?auto_2685773 ?auto_2685777 ) ) ( not ( = ?auto_2685773 ?auto_2685778 ) ) ( not ( = ?auto_2685773 ?auto_2685780 ) ) ( not ( = ?auto_2685772 ?auto_2685774 ) ) ( not ( = ?auto_2685772 ?auto_2685775 ) ) ( not ( = ?auto_2685772 ?auto_2685776 ) ) ( not ( = ?auto_2685772 ?auto_2685777 ) ) ( not ( = ?auto_2685772 ?auto_2685778 ) ) ( not ( = ?auto_2685772 ?auto_2685780 ) ) ( not ( = ?auto_2685774 ?auto_2685775 ) ) ( not ( = ?auto_2685774 ?auto_2685776 ) ) ( not ( = ?auto_2685774 ?auto_2685777 ) ) ( not ( = ?auto_2685774 ?auto_2685778 ) ) ( not ( = ?auto_2685774 ?auto_2685780 ) ) ( not ( = ?auto_2685775 ?auto_2685776 ) ) ( not ( = ?auto_2685775 ?auto_2685777 ) ) ( not ( = ?auto_2685775 ?auto_2685778 ) ) ( not ( = ?auto_2685775 ?auto_2685780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685776 ?auto_2685777 ?auto_2685778 )
      ( MAKE-11CRATE-VERIFY ?auto_2685768 ?auto_2685769 ?auto_2685770 ?auto_2685767 ?auto_2685771 ?auto_2685773 ?auto_2685772 ?auto_2685774 ?auto_2685775 ?auto_2685776 ?auto_2685777 ?auto_2685778 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685912 - SURFACE
      ?auto_2685913 - SURFACE
      ?auto_2685914 - SURFACE
      ?auto_2685911 - SURFACE
      ?auto_2685915 - SURFACE
      ?auto_2685917 - SURFACE
      ?auto_2685916 - SURFACE
      ?auto_2685918 - SURFACE
      ?auto_2685919 - SURFACE
      ?auto_2685920 - SURFACE
      ?auto_2685921 - SURFACE
      ?auto_2685922 - SURFACE
    )
    :vars
    (
      ?auto_2685924 - HOIST
      ?auto_2685928 - PLACE
      ?auto_2685927 - PLACE
      ?auto_2685925 - HOIST
      ?auto_2685926 - SURFACE
      ?auto_2685923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685924 ?auto_2685928 ) ( SURFACE-AT ?auto_2685921 ?auto_2685928 ) ( CLEAR ?auto_2685921 ) ( IS-CRATE ?auto_2685922 ) ( not ( = ?auto_2685921 ?auto_2685922 ) ) ( AVAILABLE ?auto_2685924 ) ( ON ?auto_2685921 ?auto_2685920 ) ( not ( = ?auto_2685920 ?auto_2685921 ) ) ( not ( = ?auto_2685920 ?auto_2685922 ) ) ( not ( = ?auto_2685927 ?auto_2685928 ) ) ( HOIST-AT ?auto_2685925 ?auto_2685927 ) ( not ( = ?auto_2685924 ?auto_2685925 ) ) ( AVAILABLE ?auto_2685925 ) ( SURFACE-AT ?auto_2685922 ?auto_2685927 ) ( ON ?auto_2685922 ?auto_2685926 ) ( CLEAR ?auto_2685922 ) ( not ( = ?auto_2685921 ?auto_2685926 ) ) ( not ( = ?auto_2685922 ?auto_2685926 ) ) ( not ( = ?auto_2685920 ?auto_2685926 ) ) ( TRUCK-AT ?auto_2685923 ?auto_2685928 ) ( ON ?auto_2685913 ?auto_2685912 ) ( ON ?auto_2685914 ?auto_2685913 ) ( ON ?auto_2685911 ?auto_2685914 ) ( ON ?auto_2685915 ?auto_2685911 ) ( ON ?auto_2685917 ?auto_2685915 ) ( ON ?auto_2685916 ?auto_2685917 ) ( ON ?auto_2685918 ?auto_2685916 ) ( ON ?auto_2685919 ?auto_2685918 ) ( ON ?auto_2685920 ?auto_2685919 ) ( not ( = ?auto_2685912 ?auto_2685913 ) ) ( not ( = ?auto_2685912 ?auto_2685914 ) ) ( not ( = ?auto_2685912 ?auto_2685911 ) ) ( not ( = ?auto_2685912 ?auto_2685915 ) ) ( not ( = ?auto_2685912 ?auto_2685917 ) ) ( not ( = ?auto_2685912 ?auto_2685916 ) ) ( not ( = ?auto_2685912 ?auto_2685918 ) ) ( not ( = ?auto_2685912 ?auto_2685919 ) ) ( not ( = ?auto_2685912 ?auto_2685920 ) ) ( not ( = ?auto_2685912 ?auto_2685921 ) ) ( not ( = ?auto_2685912 ?auto_2685922 ) ) ( not ( = ?auto_2685912 ?auto_2685926 ) ) ( not ( = ?auto_2685913 ?auto_2685914 ) ) ( not ( = ?auto_2685913 ?auto_2685911 ) ) ( not ( = ?auto_2685913 ?auto_2685915 ) ) ( not ( = ?auto_2685913 ?auto_2685917 ) ) ( not ( = ?auto_2685913 ?auto_2685916 ) ) ( not ( = ?auto_2685913 ?auto_2685918 ) ) ( not ( = ?auto_2685913 ?auto_2685919 ) ) ( not ( = ?auto_2685913 ?auto_2685920 ) ) ( not ( = ?auto_2685913 ?auto_2685921 ) ) ( not ( = ?auto_2685913 ?auto_2685922 ) ) ( not ( = ?auto_2685913 ?auto_2685926 ) ) ( not ( = ?auto_2685914 ?auto_2685911 ) ) ( not ( = ?auto_2685914 ?auto_2685915 ) ) ( not ( = ?auto_2685914 ?auto_2685917 ) ) ( not ( = ?auto_2685914 ?auto_2685916 ) ) ( not ( = ?auto_2685914 ?auto_2685918 ) ) ( not ( = ?auto_2685914 ?auto_2685919 ) ) ( not ( = ?auto_2685914 ?auto_2685920 ) ) ( not ( = ?auto_2685914 ?auto_2685921 ) ) ( not ( = ?auto_2685914 ?auto_2685922 ) ) ( not ( = ?auto_2685914 ?auto_2685926 ) ) ( not ( = ?auto_2685911 ?auto_2685915 ) ) ( not ( = ?auto_2685911 ?auto_2685917 ) ) ( not ( = ?auto_2685911 ?auto_2685916 ) ) ( not ( = ?auto_2685911 ?auto_2685918 ) ) ( not ( = ?auto_2685911 ?auto_2685919 ) ) ( not ( = ?auto_2685911 ?auto_2685920 ) ) ( not ( = ?auto_2685911 ?auto_2685921 ) ) ( not ( = ?auto_2685911 ?auto_2685922 ) ) ( not ( = ?auto_2685911 ?auto_2685926 ) ) ( not ( = ?auto_2685915 ?auto_2685917 ) ) ( not ( = ?auto_2685915 ?auto_2685916 ) ) ( not ( = ?auto_2685915 ?auto_2685918 ) ) ( not ( = ?auto_2685915 ?auto_2685919 ) ) ( not ( = ?auto_2685915 ?auto_2685920 ) ) ( not ( = ?auto_2685915 ?auto_2685921 ) ) ( not ( = ?auto_2685915 ?auto_2685922 ) ) ( not ( = ?auto_2685915 ?auto_2685926 ) ) ( not ( = ?auto_2685917 ?auto_2685916 ) ) ( not ( = ?auto_2685917 ?auto_2685918 ) ) ( not ( = ?auto_2685917 ?auto_2685919 ) ) ( not ( = ?auto_2685917 ?auto_2685920 ) ) ( not ( = ?auto_2685917 ?auto_2685921 ) ) ( not ( = ?auto_2685917 ?auto_2685922 ) ) ( not ( = ?auto_2685917 ?auto_2685926 ) ) ( not ( = ?auto_2685916 ?auto_2685918 ) ) ( not ( = ?auto_2685916 ?auto_2685919 ) ) ( not ( = ?auto_2685916 ?auto_2685920 ) ) ( not ( = ?auto_2685916 ?auto_2685921 ) ) ( not ( = ?auto_2685916 ?auto_2685922 ) ) ( not ( = ?auto_2685916 ?auto_2685926 ) ) ( not ( = ?auto_2685918 ?auto_2685919 ) ) ( not ( = ?auto_2685918 ?auto_2685920 ) ) ( not ( = ?auto_2685918 ?auto_2685921 ) ) ( not ( = ?auto_2685918 ?auto_2685922 ) ) ( not ( = ?auto_2685918 ?auto_2685926 ) ) ( not ( = ?auto_2685919 ?auto_2685920 ) ) ( not ( = ?auto_2685919 ?auto_2685921 ) ) ( not ( = ?auto_2685919 ?auto_2685922 ) ) ( not ( = ?auto_2685919 ?auto_2685926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685920 ?auto_2685921 ?auto_2685922 )
      ( MAKE-11CRATE-VERIFY ?auto_2685912 ?auto_2685913 ?auto_2685914 ?auto_2685911 ?auto_2685915 ?auto_2685917 ?auto_2685916 ?auto_2685918 ?auto_2685919 ?auto_2685920 ?auto_2685921 ?auto_2685922 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2686056 - SURFACE
      ?auto_2686057 - SURFACE
      ?auto_2686058 - SURFACE
      ?auto_2686055 - SURFACE
      ?auto_2686059 - SURFACE
      ?auto_2686061 - SURFACE
      ?auto_2686060 - SURFACE
      ?auto_2686062 - SURFACE
      ?auto_2686063 - SURFACE
      ?auto_2686064 - SURFACE
      ?auto_2686065 - SURFACE
      ?auto_2686066 - SURFACE
    )
    :vars
    (
      ?auto_2686067 - HOIST
      ?auto_2686068 - PLACE
      ?auto_2686070 - PLACE
      ?auto_2686072 - HOIST
      ?auto_2686071 - SURFACE
      ?auto_2686069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2686067 ?auto_2686068 ) ( IS-CRATE ?auto_2686066 ) ( not ( = ?auto_2686065 ?auto_2686066 ) ) ( not ( = ?auto_2686064 ?auto_2686065 ) ) ( not ( = ?auto_2686064 ?auto_2686066 ) ) ( not ( = ?auto_2686070 ?auto_2686068 ) ) ( HOIST-AT ?auto_2686072 ?auto_2686070 ) ( not ( = ?auto_2686067 ?auto_2686072 ) ) ( AVAILABLE ?auto_2686072 ) ( SURFACE-AT ?auto_2686066 ?auto_2686070 ) ( ON ?auto_2686066 ?auto_2686071 ) ( CLEAR ?auto_2686066 ) ( not ( = ?auto_2686065 ?auto_2686071 ) ) ( not ( = ?auto_2686066 ?auto_2686071 ) ) ( not ( = ?auto_2686064 ?auto_2686071 ) ) ( TRUCK-AT ?auto_2686069 ?auto_2686068 ) ( SURFACE-AT ?auto_2686064 ?auto_2686068 ) ( CLEAR ?auto_2686064 ) ( LIFTING ?auto_2686067 ?auto_2686065 ) ( IS-CRATE ?auto_2686065 ) ( ON ?auto_2686057 ?auto_2686056 ) ( ON ?auto_2686058 ?auto_2686057 ) ( ON ?auto_2686055 ?auto_2686058 ) ( ON ?auto_2686059 ?auto_2686055 ) ( ON ?auto_2686061 ?auto_2686059 ) ( ON ?auto_2686060 ?auto_2686061 ) ( ON ?auto_2686062 ?auto_2686060 ) ( ON ?auto_2686063 ?auto_2686062 ) ( ON ?auto_2686064 ?auto_2686063 ) ( not ( = ?auto_2686056 ?auto_2686057 ) ) ( not ( = ?auto_2686056 ?auto_2686058 ) ) ( not ( = ?auto_2686056 ?auto_2686055 ) ) ( not ( = ?auto_2686056 ?auto_2686059 ) ) ( not ( = ?auto_2686056 ?auto_2686061 ) ) ( not ( = ?auto_2686056 ?auto_2686060 ) ) ( not ( = ?auto_2686056 ?auto_2686062 ) ) ( not ( = ?auto_2686056 ?auto_2686063 ) ) ( not ( = ?auto_2686056 ?auto_2686064 ) ) ( not ( = ?auto_2686056 ?auto_2686065 ) ) ( not ( = ?auto_2686056 ?auto_2686066 ) ) ( not ( = ?auto_2686056 ?auto_2686071 ) ) ( not ( = ?auto_2686057 ?auto_2686058 ) ) ( not ( = ?auto_2686057 ?auto_2686055 ) ) ( not ( = ?auto_2686057 ?auto_2686059 ) ) ( not ( = ?auto_2686057 ?auto_2686061 ) ) ( not ( = ?auto_2686057 ?auto_2686060 ) ) ( not ( = ?auto_2686057 ?auto_2686062 ) ) ( not ( = ?auto_2686057 ?auto_2686063 ) ) ( not ( = ?auto_2686057 ?auto_2686064 ) ) ( not ( = ?auto_2686057 ?auto_2686065 ) ) ( not ( = ?auto_2686057 ?auto_2686066 ) ) ( not ( = ?auto_2686057 ?auto_2686071 ) ) ( not ( = ?auto_2686058 ?auto_2686055 ) ) ( not ( = ?auto_2686058 ?auto_2686059 ) ) ( not ( = ?auto_2686058 ?auto_2686061 ) ) ( not ( = ?auto_2686058 ?auto_2686060 ) ) ( not ( = ?auto_2686058 ?auto_2686062 ) ) ( not ( = ?auto_2686058 ?auto_2686063 ) ) ( not ( = ?auto_2686058 ?auto_2686064 ) ) ( not ( = ?auto_2686058 ?auto_2686065 ) ) ( not ( = ?auto_2686058 ?auto_2686066 ) ) ( not ( = ?auto_2686058 ?auto_2686071 ) ) ( not ( = ?auto_2686055 ?auto_2686059 ) ) ( not ( = ?auto_2686055 ?auto_2686061 ) ) ( not ( = ?auto_2686055 ?auto_2686060 ) ) ( not ( = ?auto_2686055 ?auto_2686062 ) ) ( not ( = ?auto_2686055 ?auto_2686063 ) ) ( not ( = ?auto_2686055 ?auto_2686064 ) ) ( not ( = ?auto_2686055 ?auto_2686065 ) ) ( not ( = ?auto_2686055 ?auto_2686066 ) ) ( not ( = ?auto_2686055 ?auto_2686071 ) ) ( not ( = ?auto_2686059 ?auto_2686061 ) ) ( not ( = ?auto_2686059 ?auto_2686060 ) ) ( not ( = ?auto_2686059 ?auto_2686062 ) ) ( not ( = ?auto_2686059 ?auto_2686063 ) ) ( not ( = ?auto_2686059 ?auto_2686064 ) ) ( not ( = ?auto_2686059 ?auto_2686065 ) ) ( not ( = ?auto_2686059 ?auto_2686066 ) ) ( not ( = ?auto_2686059 ?auto_2686071 ) ) ( not ( = ?auto_2686061 ?auto_2686060 ) ) ( not ( = ?auto_2686061 ?auto_2686062 ) ) ( not ( = ?auto_2686061 ?auto_2686063 ) ) ( not ( = ?auto_2686061 ?auto_2686064 ) ) ( not ( = ?auto_2686061 ?auto_2686065 ) ) ( not ( = ?auto_2686061 ?auto_2686066 ) ) ( not ( = ?auto_2686061 ?auto_2686071 ) ) ( not ( = ?auto_2686060 ?auto_2686062 ) ) ( not ( = ?auto_2686060 ?auto_2686063 ) ) ( not ( = ?auto_2686060 ?auto_2686064 ) ) ( not ( = ?auto_2686060 ?auto_2686065 ) ) ( not ( = ?auto_2686060 ?auto_2686066 ) ) ( not ( = ?auto_2686060 ?auto_2686071 ) ) ( not ( = ?auto_2686062 ?auto_2686063 ) ) ( not ( = ?auto_2686062 ?auto_2686064 ) ) ( not ( = ?auto_2686062 ?auto_2686065 ) ) ( not ( = ?auto_2686062 ?auto_2686066 ) ) ( not ( = ?auto_2686062 ?auto_2686071 ) ) ( not ( = ?auto_2686063 ?auto_2686064 ) ) ( not ( = ?auto_2686063 ?auto_2686065 ) ) ( not ( = ?auto_2686063 ?auto_2686066 ) ) ( not ( = ?auto_2686063 ?auto_2686071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2686064 ?auto_2686065 ?auto_2686066 )
      ( MAKE-11CRATE-VERIFY ?auto_2686056 ?auto_2686057 ?auto_2686058 ?auto_2686055 ?auto_2686059 ?auto_2686061 ?auto_2686060 ?auto_2686062 ?auto_2686063 ?auto_2686064 ?auto_2686065 ?auto_2686066 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2686200 - SURFACE
      ?auto_2686201 - SURFACE
      ?auto_2686202 - SURFACE
      ?auto_2686199 - SURFACE
      ?auto_2686203 - SURFACE
      ?auto_2686205 - SURFACE
      ?auto_2686204 - SURFACE
      ?auto_2686206 - SURFACE
      ?auto_2686207 - SURFACE
      ?auto_2686208 - SURFACE
      ?auto_2686209 - SURFACE
      ?auto_2686210 - SURFACE
    )
    :vars
    (
      ?auto_2686211 - HOIST
      ?auto_2686215 - PLACE
      ?auto_2686214 - PLACE
      ?auto_2686216 - HOIST
      ?auto_2686212 - SURFACE
      ?auto_2686213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2686211 ?auto_2686215 ) ( IS-CRATE ?auto_2686210 ) ( not ( = ?auto_2686209 ?auto_2686210 ) ) ( not ( = ?auto_2686208 ?auto_2686209 ) ) ( not ( = ?auto_2686208 ?auto_2686210 ) ) ( not ( = ?auto_2686214 ?auto_2686215 ) ) ( HOIST-AT ?auto_2686216 ?auto_2686214 ) ( not ( = ?auto_2686211 ?auto_2686216 ) ) ( AVAILABLE ?auto_2686216 ) ( SURFACE-AT ?auto_2686210 ?auto_2686214 ) ( ON ?auto_2686210 ?auto_2686212 ) ( CLEAR ?auto_2686210 ) ( not ( = ?auto_2686209 ?auto_2686212 ) ) ( not ( = ?auto_2686210 ?auto_2686212 ) ) ( not ( = ?auto_2686208 ?auto_2686212 ) ) ( TRUCK-AT ?auto_2686213 ?auto_2686215 ) ( SURFACE-AT ?auto_2686208 ?auto_2686215 ) ( CLEAR ?auto_2686208 ) ( IS-CRATE ?auto_2686209 ) ( AVAILABLE ?auto_2686211 ) ( IN ?auto_2686209 ?auto_2686213 ) ( ON ?auto_2686201 ?auto_2686200 ) ( ON ?auto_2686202 ?auto_2686201 ) ( ON ?auto_2686199 ?auto_2686202 ) ( ON ?auto_2686203 ?auto_2686199 ) ( ON ?auto_2686205 ?auto_2686203 ) ( ON ?auto_2686204 ?auto_2686205 ) ( ON ?auto_2686206 ?auto_2686204 ) ( ON ?auto_2686207 ?auto_2686206 ) ( ON ?auto_2686208 ?auto_2686207 ) ( not ( = ?auto_2686200 ?auto_2686201 ) ) ( not ( = ?auto_2686200 ?auto_2686202 ) ) ( not ( = ?auto_2686200 ?auto_2686199 ) ) ( not ( = ?auto_2686200 ?auto_2686203 ) ) ( not ( = ?auto_2686200 ?auto_2686205 ) ) ( not ( = ?auto_2686200 ?auto_2686204 ) ) ( not ( = ?auto_2686200 ?auto_2686206 ) ) ( not ( = ?auto_2686200 ?auto_2686207 ) ) ( not ( = ?auto_2686200 ?auto_2686208 ) ) ( not ( = ?auto_2686200 ?auto_2686209 ) ) ( not ( = ?auto_2686200 ?auto_2686210 ) ) ( not ( = ?auto_2686200 ?auto_2686212 ) ) ( not ( = ?auto_2686201 ?auto_2686202 ) ) ( not ( = ?auto_2686201 ?auto_2686199 ) ) ( not ( = ?auto_2686201 ?auto_2686203 ) ) ( not ( = ?auto_2686201 ?auto_2686205 ) ) ( not ( = ?auto_2686201 ?auto_2686204 ) ) ( not ( = ?auto_2686201 ?auto_2686206 ) ) ( not ( = ?auto_2686201 ?auto_2686207 ) ) ( not ( = ?auto_2686201 ?auto_2686208 ) ) ( not ( = ?auto_2686201 ?auto_2686209 ) ) ( not ( = ?auto_2686201 ?auto_2686210 ) ) ( not ( = ?auto_2686201 ?auto_2686212 ) ) ( not ( = ?auto_2686202 ?auto_2686199 ) ) ( not ( = ?auto_2686202 ?auto_2686203 ) ) ( not ( = ?auto_2686202 ?auto_2686205 ) ) ( not ( = ?auto_2686202 ?auto_2686204 ) ) ( not ( = ?auto_2686202 ?auto_2686206 ) ) ( not ( = ?auto_2686202 ?auto_2686207 ) ) ( not ( = ?auto_2686202 ?auto_2686208 ) ) ( not ( = ?auto_2686202 ?auto_2686209 ) ) ( not ( = ?auto_2686202 ?auto_2686210 ) ) ( not ( = ?auto_2686202 ?auto_2686212 ) ) ( not ( = ?auto_2686199 ?auto_2686203 ) ) ( not ( = ?auto_2686199 ?auto_2686205 ) ) ( not ( = ?auto_2686199 ?auto_2686204 ) ) ( not ( = ?auto_2686199 ?auto_2686206 ) ) ( not ( = ?auto_2686199 ?auto_2686207 ) ) ( not ( = ?auto_2686199 ?auto_2686208 ) ) ( not ( = ?auto_2686199 ?auto_2686209 ) ) ( not ( = ?auto_2686199 ?auto_2686210 ) ) ( not ( = ?auto_2686199 ?auto_2686212 ) ) ( not ( = ?auto_2686203 ?auto_2686205 ) ) ( not ( = ?auto_2686203 ?auto_2686204 ) ) ( not ( = ?auto_2686203 ?auto_2686206 ) ) ( not ( = ?auto_2686203 ?auto_2686207 ) ) ( not ( = ?auto_2686203 ?auto_2686208 ) ) ( not ( = ?auto_2686203 ?auto_2686209 ) ) ( not ( = ?auto_2686203 ?auto_2686210 ) ) ( not ( = ?auto_2686203 ?auto_2686212 ) ) ( not ( = ?auto_2686205 ?auto_2686204 ) ) ( not ( = ?auto_2686205 ?auto_2686206 ) ) ( not ( = ?auto_2686205 ?auto_2686207 ) ) ( not ( = ?auto_2686205 ?auto_2686208 ) ) ( not ( = ?auto_2686205 ?auto_2686209 ) ) ( not ( = ?auto_2686205 ?auto_2686210 ) ) ( not ( = ?auto_2686205 ?auto_2686212 ) ) ( not ( = ?auto_2686204 ?auto_2686206 ) ) ( not ( = ?auto_2686204 ?auto_2686207 ) ) ( not ( = ?auto_2686204 ?auto_2686208 ) ) ( not ( = ?auto_2686204 ?auto_2686209 ) ) ( not ( = ?auto_2686204 ?auto_2686210 ) ) ( not ( = ?auto_2686204 ?auto_2686212 ) ) ( not ( = ?auto_2686206 ?auto_2686207 ) ) ( not ( = ?auto_2686206 ?auto_2686208 ) ) ( not ( = ?auto_2686206 ?auto_2686209 ) ) ( not ( = ?auto_2686206 ?auto_2686210 ) ) ( not ( = ?auto_2686206 ?auto_2686212 ) ) ( not ( = ?auto_2686207 ?auto_2686208 ) ) ( not ( = ?auto_2686207 ?auto_2686209 ) ) ( not ( = ?auto_2686207 ?auto_2686210 ) ) ( not ( = ?auto_2686207 ?auto_2686212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2686208 ?auto_2686209 ?auto_2686210 )
      ( MAKE-11CRATE-VERIFY ?auto_2686200 ?auto_2686201 ?auto_2686202 ?auto_2686199 ?auto_2686203 ?auto_2686205 ?auto_2686204 ?auto_2686206 ?auto_2686207 ?auto_2686208 ?auto_2686209 ?auto_2686210 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695491 - SURFACE
      ?auto_2695492 - SURFACE
      ?auto_2695493 - SURFACE
      ?auto_2695490 - SURFACE
      ?auto_2695494 - SURFACE
      ?auto_2695496 - SURFACE
      ?auto_2695495 - SURFACE
      ?auto_2695497 - SURFACE
      ?auto_2695498 - SURFACE
      ?auto_2695499 - SURFACE
      ?auto_2695500 - SURFACE
      ?auto_2695501 - SURFACE
      ?auto_2695502 - SURFACE
    )
    :vars
    (
      ?auto_2695503 - HOIST
      ?auto_2695504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695503 ?auto_2695504 ) ( SURFACE-AT ?auto_2695501 ?auto_2695504 ) ( CLEAR ?auto_2695501 ) ( LIFTING ?auto_2695503 ?auto_2695502 ) ( IS-CRATE ?auto_2695502 ) ( not ( = ?auto_2695501 ?auto_2695502 ) ) ( ON ?auto_2695492 ?auto_2695491 ) ( ON ?auto_2695493 ?auto_2695492 ) ( ON ?auto_2695490 ?auto_2695493 ) ( ON ?auto_2695494 ?auto_2695490 ) ( ON ?auto_2695496 ?auto_2695494 ) ( ON ?auto_2695495 ?auto_2695496 ) ( ON ?auto_2695497 ?auto_2695495 ) ( ON ?auto_2695498 ?auto_2695497 ) ( ON ?auto_2695499 ?auto_2695498 ) ( ON ?auto_2695500 ?auto_2695499 ) ( ON ?auto_2695501 ?auto_2695500 ) ( not ( = ?auto_2695491 ?auto_2695492 ) ) ( not ( = ?auto_2695491 ?auto_2695493 ) ) ( not ( = ?auto_2695491 ?auto_2695490 ) ) ( not ( = ?auto_2695491 ?auto_2695494 ) ) ( not ( = ?auto_2695491 ?auto_2695496 ) ) ( not ( = ?auto_2695491 ?auto_2695495 ) ) ( not ( = ?auto_2695491 ?auto_2695497 ) ) ( not ( = ?auto_2695491 ?auto_2695498 ) ) ( not ( = ?auto_2695491 ?auto_2695499 ) ) ( not ( = ?auto_2695491 ?auto_2695500 ) ) ( not ( = ?auto_2695491 ?auto_2695501 ) ) ( not ( = ?auto_2695491 ?auto_2695502 ) ) ( not ( = ?auto_2695492 ?auto_2695493 ) ) ( not ( = ?auto_2695492 ?auto_2695490 ) ) ( not ( = ?auto_2695492 ?auto_2695494 ) ) ( not ( = ?auto_2695492 ?auto_2695496 ) ) ( not ( = ?auto_2695492 ?auto_2695495 ) ) ( not ( = ?auto_2695492 ?auto_2695497 ) ) ( not ( = ?auto_2695492 ?auto_2695498 ) ) ( not ( = ?auto_2695492 ?auto_2695499 ) ) ( not ( = ?auto_2695492 ?auto_2695500 ) ) ( not ( = ?auto_2695492 ?auto_2695501 ) ) ( not ( = ?auto_2695492 ?auto_2695502 ) ) ( not ( = ?auto_2695493 ?auto_2695490 ) ) ( not ( = ?auto_2695493 ?auto_2695494 ) ) ( not ( = ?auto_2695493 ?auto_2695496 ) ) ( not ( = ?auto_2695493 ?auto_2695495 ) ) ( not ( = ?auto_2695493 ?auto_2695497 ) ) ( not ( = ?auto_2695493 ?auto_2695498 ) ) ( not ( = ?auto_2695493 ?auto_2695499 ) ) ( not ( = ?auto_2695493 ?auto_2695500 ) ) ( not ( = ?auto_2695493 ?auto_2695501 ) ) ( not ( = ?auto_2695493 ?auto_2695502 ) ) ( not ( = ?auto_2695490 ?auto_2695494 ) ) ( not ( = ?auto_2695490 ?auto_2695496 ) ) ( not ( = ?auto_2695490 ?auto_2695495 ) ) ( not ( = ?auto_2695490 ?auto_2695497 ) ) ( not ( = ?auto_2695490 ?auto_2695498 ) ) ( not ( = ?auto_2695490 ?auto_2695499 ) ) ( not ( = ?auto_2695490 ?auto_2695500 ) ) ( not ( = ?auto_2695490 ?auto_2695501 ) ) ( not ( = ?auto_2695490 ?auto_2695502 ) ) ( not ( = ?auto_2695494 ?auto_2695496 ) ) ( not ( = ?auto_2695494 ?auto_2695495 ) ) ( not ( = ?auto_2695494 ?auto_2695497 ) ) ( not ( = ?auto_2695494 ?auto_2695498 ) ) ( not ( = ?auto_2695494 ?auto_2695499 ) ) ( not ( = ?auto_2695494 ?auto_2695500 ) ) ( not ( = ?auto_2695494 ?auto_2695501 ) ) ( not ( = ?auto_2695494 ?auto_2695502 ) ) ( not ( = ?auto_2695496 ?auto_2695495 ) ) ( not ( = ?auto_2695496 ?auto_2695497 ) ) ( not ( = ?auto_2695496 ?auto_2695498 ) ) ( not ( = ?auto_2695496 ?auto_2695499 ) ) ( not ( = ?auto_2695496 ?auto_2695500 ) ) ( not ( = ?auto_2695496 ?auto_2695501 ) ) ( not ( = ?auto_2695496 ?auto_2695502 ) ) ( not ( = ?auto_2695495 ?auto_2695497 ) ) ( not ( = ?auto_2695495 ?auto_2695498 ) ) ( not ( = ?auto_2695495 ?auto_2695499 ) ) ( not ( = ?auto_2695495 ?auto_2695500 ) ) ( not ( = ?auto_2695495 ?auto_2695501 ) ) ( not ( = ?auto_2695495 ?auto_2695502 ) ) ( not ( = ?auto_2695497 ?auto_2695498 ) ) ( not ( = ?auto_2695497 ?auto_2695499 ) ) ( not ( = ?auto_2695497 ?auto_2695500 ) ) ( not ( = ?auto_2695497 ?auto_2695501 ) ) ( not ( = ?auto_2695497 ?auto_2695502 ) ) ( not ( = ?auto_2695498 ?auto_2695499 ) ) ( not ( = ?auto_2695498 ?auto_2695500 ) ) ( not ( = ?auto_2695498 ?auto_2695501 ) ) ( not ( = ?auto_2695498 ?auto_2695502 ) ) ( not ( = ?auto_2695499 ?auto_2695500 ) ) ( not ( = ?auto_2695499 ?auto_2695501 ) ) ( not ( = ?auto_2695499 ?auto_2695502 ) ) ( not ( = ?auto_2695500 ?auto_2695501 ) ) ( not ( = ?auto_2695500 ?auto_2695502 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2695501 ?auto_2695502 )
      ( MAKE-12CRATE-VERIFY ?auto_2695491 ?auto_2695492 ?auto_2695493 ?auto_2695490 ?auto_2695494 ?auto_2695496 ?auto_2695495 ?auto_2695497 ?auto_2695498 ?auto_2695499 ?auto_2695500 ?auto_2695501 ?auto_2695502 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695616 - SURFACE
      ?auto_2695617 - SURFACE
      ?auto_2695618 - SURFACE
      ?auto_2695615 - SURFACE
      ?auto_2695619 - SURFACE
      ?auto_2695621 - SURFACE
      ?auto_2695620 - SURFACE
      ?auto_2695622 - SURFACE
      ?auto_2695623 - SURFACE
      ?auto_2695624 - SURFACE
      ?auto_2695625 - SURFACE
      ?auto_2695626 - SURFACE
      ?auto_2695627 - SURFACE
    )
    :vars
    (
      ?auto_2695629 - HOIST
      ?auto_2695630 - PLACE
      ?auto_2695628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695629 ?auto_2695630 ) ( SURFACE-AT ?auto_2695626 ?auto_2695630 ) ( CLEAR ?auto_2695626 ) ( IS-CRATE ?auto_2695627 ) ( not ( = ?auto_2695626 ?auto_2695627 ) ) ( TRUCK-AT ?auto_2695628 ?auto_2695630 ) ( AVAILABLE ?auto_2695629 ) ( IN ?auto_2695627 ?auto_2695628 ) ( ON ?auto_2695626 ?auto_2695625 ) ( not ( = ?auto_2695625 ?auto_2695626 ) ) ( not ( = ?auto_2695625 ?auto_2695627 ) ) ( ON ?auto_2695617 ?auto_2695616 ) ( ON ?auto_2695618 ?auto_2695617 ) ( ON ?auto_2695615 ?auto_2695618 ) ( ON ?auto_2695619 ?auto_2695615 ) ( ON ?auto_2695621 ?auto_2695619 ) ( ON ?auto_2695620 ?auto_2695621 ) ( ON ?auto_2695622 ?auto_2695620 ) ( ON ?auto_2695623 ?auto_2695622 ) ( ON ?auto_2695624 ?auto_2695623 ) ( ON ?auto_2695625 ?auto_2695624 ) ( not ( = ?auto_2695616 ?auto_2695617 ) ) ( not ( = ?auto_2695616 ?auto_2695618 ) ) ( not ( = ?auto_2695616 ?auto_2695615 ) ) ( not ( = ?auto_2695616 ?auto_2695619 ) ) ( not ( = ?auto_2695616 ?auto_2695621 ) ) ( not ( = ?auto_2695616 ?auto_2695620 ) ) ( not ( = ?auto_2695616 ?auto_2695622 ) ) ( not ( = ?auto_2695616 ?auto_2695623 ) ) ( not ( = ?auto_2695616 ?auto_2695624 ) ) ( not ( = ?auto_2695616 ?auto_2695625 ) ) ( not ( = ?auto_2695616 ?auto_2695626 ) ) ( not ( = ?auto_2695616 ?auto_2695627 ) ) ( not ( = ?auto_2695617 ?auto_2695618 ) ) ( not ( = ?auto_2695617 ?auto_2695615 ) ) ( not ( = ?auto_2695617 ?auto_2695619 ) ) ( not ( = ?auto_2695617 ?auto_2695621 ) ) ( not ( = ?auto_2695617 ?auto_2695620 ) ) ( not ( = ?auto_2695617 ?auto_2695622 ) ) ( not ( = ?auto_2695617 ?auto_2695623 ) ) ( not ( = ?auto_2695617 ?auto_2695624 ) ) ( not ( = ?auto_2695617 ?auto_2695625 ) ) ( not ( = ?auto_2695617 ?auto_2695626 ) ) ( not ( = ?auto_2695617 ?auto_2695627 ) ) ( not ( = ?auto_2695618 ?auto_2695615 ) ) ( not ( = ?auto_2695618 ?auto_2695619 ) ) ( not ( = ?auto_2695618 ?auto_2695621 ) ) ( not ( = ?auto_2695618 ?auto_2695620 ) ) ( not ( = ?auto_2695618 ?auto_2695622 ) ) ( not ( = ?auto_2695618 ?auto_2695623 ) ) ( not ( = ?auto_2695618 ?auto_2695624 ) ) ( not ( = ?auto_2695618 ?auto_2695625 ) ) ( not ( = ?auto_2695618 ?auto_2695626 ) ) ( not ( = ?auto_2695618 ?auto_2695627 ) ) ( not ( = ?auto_2695615 ?auto_2695619 ) ) ( not ( = ?auto_2695615 ?auto_2695621 ) ) ( not ( = ?auto_2695615 ?auto_2695620 ) ) ( not ( = ?auto_2695615 ?auto_2695622 ) ) ( not ( = ?auto_2695615 ?auto_2695623 ) ) ( not ( = ?auto_2695615 ?auto_2695624 ) ) ( not ( = ?auto_2695615 ?auto_2695625 ) ) ( not ( = ?auto_2695615 ?auto_2695626 ) ) ( not ( = ?auto_2695615 ?auto_2695627 ) ) ( not ( = ?auto_2695619 ?auto_2695621 ) ) ( not ( = ?auto_2695619 ?auto_2695620 ) ) ( not ( = ?auto_2695619 ?auto_2695622 ) ) ( not ( = ?auto_2695619 ?auto_2695623 ) ) ( not ( = ?auto_2695619 ?auto_2695624 ) ) ( not ( = ?auto_2695619 ?auto_2695625 ) ) ( not ( = ?auto_2695619 ?auto_2695626 ) ) ( not ( = ?auto_2695619 ?auto_2695627 ) ) ( not ( = ?auto_2695621 ?auto_2695620 ) ) ( not ( = ?auto_2695621 ?auto_2695622 ) ) ( not ( = ?auto_2695621 ?auto_2695623 ) ) ( not ( = ?auto_2695621 ?auto_2695624 ) ) ( not ( = ?auto_2695621 ?auto_2695625 ) ) ( not ( = ?auto_2695621 ?auto_2695626 ) ) ( not ( = ?auto_2695621 ?auto_2695627 ) ) ( not ( = ?auto_2695620 ?auto_2695622 ) ) ( not ( = ?auto_2695620 ?auto_2695623 ) ) ( not ( = ?auto_2695620 ?auto_2695624 ) ) ( not ( = ?auto_2695620 ?auto_2695625 ) ) ( not ( = ?auto_2695620 ?auto_2695626 ) ) ( not ( = ?auto_2695620 ?auto_2695627 ) ) ( not ( = ?auto_2695622 ?auto_2695623 ) ) ( not ( = ?auto_2695622 ?auto_2695624 ) ) ( not ( = ?auto_2695622 ?auto_2695625 ) ) ( not ( = ?auto_2695622 ?auto_2695626 ) ) ( not ( = ?auto_2695622 ?auto_2695627 ) ) ( not ( = ?auto_2695623 ?auto_2695624 ) ) ( not ( = ?auto_2695623 ?auto_2695625 ) ) ( not ( = ?auto_2695623 ?auto_2695626 ) ) ( not ( = ?auto_2695623 ?auto_2695627 ) ) ( not ( = ?auto_2695624 ?auto_2695625 ) ) ( not ( = ?auto_2695624 ?auto_2695626 ) ) ( not ( = ?auto_2695624 ?auto_2695627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695625 ?auto_2695626 ?auto_2695627 )
      ( MAKE-12CRATE-VERIFY ?auto_2695616 ?auto_2695617 ?auto_2695618 ?auto_2695615 ?auto_2695619 ?auto_2695621 ?auto_2695620 ?auto_2695622 ?auto_2695623 ?auto_2695624 ?auto_2695625 ?auto_2695626 ?auto_2695627 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695754 - SURFACE
      ?auto_2695755 - SURFACE
      ?auto_2695756 - SURFACE
      ?auto_2695753 - SURFACE
      ?auto_2695757 - SURFACE
      ?auto_2695759 - SURFACE
      ?auto_2695758 - SURFACE
      ?auto_2695760 - SURFACE
      ?auto_2695761 - SURFACE
      ?auto_2695762 - SURFACE
      ?auto_2695763 - SURFACE
      ?auto_2695764 - SURFACE
      ?auto_2695765 - SURFACE
    )
    :vars
    (
      ?auto_2695768 - HOIST
      ?auto_2695769 - PLACE
      ?auto_2695767 - TRUCK
      ?auto_2695766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695768 ?auto_2695769 ) ( SURFACE-AT ?auto_2695764 ?auto_2695769 ) ( CLEAR ?auto_2695764 ) ( IS-CRATE ?auto_2695765 ) ( not ( = ?auto_2695764 ?auto_2695765 ) ) ( AVAILABLE ?auto_2695768 ) ( IN ?auto_2695765 ?auto_2695767 ) ( ON ?auto_2695764 ?auto_2695763 ) ( not ( = ?auto_2695763 ?auto_2695764 ) ) ( not ( = ?auto_2695763 ?auto_2695765 ) ) ( TRUCK-AT ?auto_2695767 ?auto_2695766 ) ( not ( = ?auto_2695766 ?auto_2695769 ) ) ( ON ?auto_2695755 ?auto_2695754 ) ( ON ?auto_2695756 ?auto_2695755 ) ( ON ?auto_2695753 ?auto_2695756 ) ( ON ?auto_2695757 ?auto_2695753 ) ( ON ?auto_2695759 ?auto_2695757 ) ( ON ?auto_2695758 ?auto_2695759 ) ( ON ?auto_2695760 ?auto_2695758 ) ( ON ?auto_2695761 ?auto_2695760 ) ( ON ?auto_2695762 ?auto_2695761 ) ( ON ?auto_2695763 ?auto_2695762 ) ( not ( = ?auto_2695754 ?auto_2695755 ) ) ( not ( = ?auto_2695754 ?auto_2695756 ) ) ( not ( = ?auto_2695754 ?auto_2695753 ) ) ( not ( = ?auto_2695754 ?auto_2695757 ) ) ( not ( = ?auto_2695754 ?auto_2695759 ) ) ( not ( = ?auto_2695754 ?auto_2695758 ) ) ( not ( = ?auto_2695754 ?auto_2695760 ) ) ( not ( = ?auto_2695754 ?auto_2695761 ) ) ( not ( = ?auto_2695754 ?auto_2695762 ) ) ( not ( = ?auto_2695754 ?auto_2695763 ) ) ( not ( = ?auto_2695754 ?auto_2695764 ) ) ( not ( = ?auto_2695754 ?auto_2695765 ) ) ( not ( = ?auto_2695755 ?auto_2695756 ) ) ( not ( = ?auto_2695755 ?auto_2695753 ) ) ( not ( = ?auto_2695755 ?auto_2695757 ) ) ( not ( = ?auto_2695755 ?auto_2695759 ) ) ( not ( = ?auto_2695755 ?auto_2695758 ) ) ( not ( = ?auto_2695755 ?auto_2695760 ) ) ( not ( = ?auto_2695755 ?auto_2695761 ) ) ( not ( = ?auto_2695755 ?auto_2695762 ) ) ( not ( = ?auto_2695755 ?auto_2695763 ) ) ( not ( = ?auto_2695755 ?auto_2695764 ) ) ( not ( = ?auto_2695755 ?auto_2695765 ) ) ( not ( = ?auto_2695756 ?auto_2695753 ) ) ( not ( = ?auto_2695756 ?auto_2695757 ) ) ( not ( = ?auto_2695756 ?auto_2695759 ) ) ( not ( = ?auto_2695756 ?auto_2695758 ) ) ( not ( = ?auto_2695756 ?auto_2695760 ) ) ( not ( = ?auto_2695756 ?auto_2695761 ) ) ( not ( = ?auto_2695756 ?auto_2695762 ) ) ( not ( = ?auto_2695756 ?auto_2695763 ) ) ( not ( = ?auto_2695756 ?auto_2695764 ) ) ( not ( = ?auto_2695756 ?auto_2695765 ) ) ( not ( = ?auto_2695753 ?auto_2695757 ) ) ( not ( = ?auto_2695753 ?auto_2695759 ) ) ( not ( = ?auto_2695753 ?auto_2695758 ) ) ( not ( = ?auto_2695753 ?auto_2695760 ) ) ( not ( = ?auto_2695753 ?auto_2695761 ) ) ( not ( = ?auto_2695753 ?auto_2695762 ) ) ( not ( = ?auto_2695753 ?auto_2695763 ) ) ( not ( = ?auto_2695753 ?auto_2695764 ) ) ( not ( = ?auto_2695753 ?auto_2695765 ) ) ( not ( = ?auto_2695757 ?auto_2695759 ) ) ( not ( = ?auto_2695757 ?auto_2695758 ) ) ( not ( = ?auto_2695757 ?auto_2695760 ) ) ( not ( = ?auto_2695757 ?auto_2695761 ) ) ( not ( = ?auto_2695757 ?auto_2695762 ) ) ( not ( = ?auto_2695757 ?auto_2695763 ) ) ( not ( = ?auto_2695757 ?auto_2695764 ) ) ( not ( = ?auto_2695757 ?auto_2695765 ) ) ( not ( = ?auto_2695759 ?auto_2695758 ) ) ( not ( = ?auto_2695759 ?auto_2695760 ) ) ( not ( = ?auto_2695759 ?auto_2695761 ) ) ( not ( = ?auto_2695759 ?auto_2695762 ) ) ( not ( = ?auto_2695759 ?auto_2695763 ) ) ( not ( = ?auto_2695759 ?auto_2695764 ) ) ( not ( = ?auto_2695759 ?auto_2695765 ) ) ( not ( = ?auto_2695758 ?auto_2695760 ) ) ( not ( = ?auto_2695758 ?auto_2695761 ) ) ( not ( = ?auto_2695758 ?auto_2695762 ) ) ( not ( = ?auto_2695758 ?auto_2695763 ) ) ( not ( = ?auto_2695758 ?auto_2695764 ) ) ( not ( = ?auto_2695758 ?auto_2695765 ) ) ( not ( = ?auto_2695760 ?auto_2695761 ) ) ( not ( = ?auto_2695760 ?auto_2695762 ) ) ( not ( = ?auto_2695760 ?auto_2695763 ) ) ( not ( = ?auto_2695760 ?auto_2695764 ) ) ( not ( = ?auto_2695760 ?auto_2695765 ) ) ( not ( = ?auto_2695761 ?auto_2695762 ) ) ( not ( = ?auto_2695761 ?auto_2695763 ) ) ( not ( = ?auto_2695761 ?auto_2695764 ) ) ( not ( = ?auto_2695761 ?auto_2695765 ) ) ( not ( = ?auto_2695762 ?auto_2695763 ) ) ( not ( = ?auto_2695762 ?auto_2695764 ) ) ( not ( = ?auto_2695762 ?auto_2695765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695763 ?auto_2695764 ?auto_2695765 )
      ( MAKE-12CRATE-VERIFY ?auto_2695754 ?auto_2695755 ?auto_2695756 ?auto_2695753 ?auto_2695757 ?auto_2695759 ?auto_2695758 ?auto_2695760 ?auto_2695761 ?auto_2695762 ?auto_2695763 ?auto_2695764 ?auto_2695765 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695904 - SURFACE
      ?auto_2695905 - SURFACE
      ?auto_2695906 - SURFACE
      ?auto_2695903 - SURFACE
      ?auto_2695907 - SURFACE
      ?auto_2695909 - SURFACE
      ?auto_2695908 - SURFACE
      ?auto_2695910 - SURFACE
      ?auto_2695911 - SURFACE
      ?auto_2695912 - SURFACE
      ?auto_2695913 - SURFACE
      ?auto_2695914 - SURFACE
      ?auto_2695915 - SURFACE
    )
    :vars
    (
      ?auto_2695916 - HOIST
      ?auto_2695917 - PLACE
      ?auto_2695919 - TRUCK
      ?auto_2695920 - PLACE
      ?auto_2695918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695916 ?auto_2695917 ) ( SURFACE-AT ?auto_2695914 ?auto_2695917 ) ( CLEAR ?auto_2695914 ) ( IS-CRATE ?auto_2695915 ) ( not ( = ?auto_2695914 ?auto_2695915 ) ) ( AVAILABLE ?auto_2695916 ) ( ON ?auto_2695914 ?auto_2695913 ) ( not ( = ?auto_2695913 ?auto_2695914 ) ) ( not ( = ?auto_2695913 ?auto_2695915 ) ) ( TRUCK-AT ?auto_2695919 ?auto_2695920 ) ( not ( = ?auto_2695920 ?auto_2695917 ) ) ( HOIST-AT ?auto_2695918 ?auto_2695920 ) ( LIFTING ?auto_2695918 ?auto_2695915 ) ( not ( = ?auto_2695916 ?auto_2695918 ) ) ( ON ?auto_2695905 ?auto_2695904 ) ( ON ?auto_2695906 ?auto_2695905 ) ( ON ?auto_2695903 ?auto_2695906 ) ( ON ?auto_2695907 ?auto_2695903 ) ( ON ?auto_2695909 ?auto_2695907 ) ( ON ?auto_2695908 ?auto_2695909 ) ( ON ?auto_2695910 ?auto_2695908 ) ( ON ?auto_2695911 ?auto_2695910 ) ( ON ?auto_2695912 ?auto_2695911 ) ( ON ?auto_2695913 ?auto_2695912 ) ( not ( = ?auto_2695904 ?auto_2695905 ) ) ( not ( = ?auto_2695904 ?auto_2695906 ) ) ( not ( = ?auto_2695904 ?auto_2695903 ) ) ( not ( = ?auto_2695904 ?auto_2695907 ) ) ( not ( = ?auto_2695904 ?auto_2695909 ) ) ( not ( = ?auto_2695904 ?auto_2695908 ) ) ( not ( = ?auto_2695904 ?auto_2695910 ) ) ( not ( = ?auto_2695904 ?auto_2695911 ) ) ( not ( = ?auto_2695904 ?auto_2695912 ) ) ( not ( = ?auto_2695904 ?auto_2695913 ) ) ( not ( = ?auto_2695904 ?auto_2695914 ) ) ( not ( = ?auto_2695904 ?auto_2695915 ) ) ( not ( = ?auto_2695905 ?auto_2695906 ) ) ( not ( = ?auto_2695905 ?auto_2695903 ) ) ( not ( = ?auto_2695905 ?auto_2695907 ) ) ( not ( = ?auto_2695905 ?auto_2695909 ) ) ( not ( = ?auto_2695905 ?auto_2695908 ) ) ( not ( = ?auto_2695905 ?auto_2695910 ) ) ( not ( = ?auto_2695905 ?auto_2695911 ) ) ( not ( = ?auto_2695905 ?auto_2695912 ) ) ( not ( = ?auto_2695905 ?auto_2695913 ) ) ( not ( = ?auto_2695905 ?auto_2695914 ) ) ( not ( = ?auto_2695905 ?auto_2695915 ) ) ( not ( = ?auto_2695906 ?auto_2695903 ) ) ( not ( = ?auto_2695906 ?auto_2695907 ) ) ( not ( = ?auto_2695906 ?auto_2695909 ) ) ( not ( = ?auto_2695906 ?auto_2695908 ) ) ( not ( = ?auto_2695906 ?auto_2695910 ) ) ( not ( = ?auto_2695906 ?auto_2695911 ) ) ( not ( = ?auto_2695906 ?auto_2695912 ) ) ( not ( = ?auto_2695906 ?auto_2695913 ) ) ( not ( = ?auto_2695906 ?auto_2695914 ) ) ( not ( = ?auto_2695906 ?auto_2695915 ) ) ( not ( = ?auto_2695903 ?auto_2695907 ) ) ( not ( = ?auto_2695903 ?auto_2695909 ) ) ( not ( = ?auto_2695903 ?auto_2695908 ) ) ( not ( = ?auto_2695903 ?auto_2695910 ) ) ( not ( = ?auto_2695903 ?auto_2695911 ) ) ( not ( = ?auto_2695903 ?auto_2695912 ) ) ( not ( = ?auto_2695903 ?auto_2695913 ) ) ( not ( = ?auto_2695903 ?auto_2695914 ) ) ( not ( = ?auto_2695903 ?auto_2695915 ) ) ( not ( = ?auto_2695907 ?auto_2695909 ) ) ( not ( = ?auto_2695907 ?auto_2695908 ) ) ( not ( = ?auto_2695907 ?auto_2695910 ) ) ( not ( = ?auto_2695907 ?auto_2695911 ) ) ( not ( = ?auto_2695907 ?auto_2695912 ) ) ( not ( = ?auto_2695907 ?auto_2695913 ) ) ( not ( = ?auto_2695907 ?auto_2695914 ) ) ( not ( = ?auto_2695907 ?auto_2695915 ) ) ( not ( = ?auto_2695909 ?auto_2695908 ) ) ( not ( = ?auto_2695909 ?auto_2695910 ) ) ( not ( = ?auto_2695909 ?auto_2695911 ) ) ( not ( = ?auto_2695909 ?auto_2695912 ) ) ( not ( = ?auto_2695909 ?auto_2695913 ) ) ( not ( = ?auto_2695909 ?auto_2695914 ) ) ( not ( = ?auto_2695909 ?auto_2695915 ) ) ( not ( = ?auto_2695908 ?auto_2695910 ) ) ( not ( = ?auto_2695908 ?auto_2695911 ) ) ( not ( = ?auto_2695908 ?auto_2695912 ) ) ( not ( = ?auto_2695908 ?auto_2695913 ) ) ( not ( = ?auto_2695908 ?auto_2695914 ) ) ( not ( = ?auto_2695908 ?auto_2695915 ) ) ( not ( = ?auto_2695910 ?auto_2695911 ) ) ( not ( = ?auto_2695910 ?auto_2695912 ) ) ( not ( = ?auto_2695910 ?auto_2695913 ) ) ( not ( = ?auto_2695910 ?auto_2695914 ) ) ( not ( = ?auto_2695910 ?auto_2695915 ) ) ( not ( = ?auto_2695911 ?auto_2695912 ) ) ( not ( = ?auto_2695911 ?auto_2695913 ) ) ( not ( = ?auto_2695911 ?auto_2695914 ) ) ( not ( = ?auto_2695911 ?auto_2695915 ) ) ( not ( = ?auto_2695912 ?auto_2695913 ) ) ( not ( = ?auto_2695912 ?auto_2695914 ) ) ( not ( = ?auto_2695912 ?auto_2695915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695913 ?auto_2695914 ?auto_2695915 )
      ( MAKE-12CRATE-VERIFY ?auto_2695904 ?auto_2695905 ?auto_2695906 ?auto_2695903 ?auto_2695907 ?auto_2695909 ?auto_2695908 ?auto_2695910 ?auto_2695911 ?auto_2695912 ?auto_2695913 ?auto_2695914 ?auto_2695915 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2696066 - SURFACE
      ?auto_2696067 - SURFACE
      ?auto_2696068 - SURFACE
      ?auto_2696065 - SURFACE
      ?auto_2696069 - SURFACE
      ?auto_2696071 - SURFACE
      ?auto_2696070 - SURFACE
      ?auto_2696072 - SURFACE
      ?auto_2696073 - SURFACE
      ?auto_2696074 - SURFACE
      ?auto_2696075 - SURFACE
      ?auto_2696076 - SURFACE
      ?auto_2696077 - SURFACE
    )
    :vars
    (
      ?auto_2696078 - HOIST
      ?auto_2696081 - PLACE
      ?auto_2696082 - TRUCK
      ?auto_2696083 - PLACE
      ?auto_2696079 - HOIST
      ?auto_2696080 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2696078 ?auto_2696081 ) ( SURFACE-AT ?auto_2696076 ?auto_2696081 ) ( CLEAR ?auto_2696076 ) ( IS-CRATE ?auto_2696077 ) ( not ( = ?auto_2696076 ?auto_2696077 ) ) ( AVAILABLE ?auto_2696078 ) ( ON ?auto_2696076 ?auto_2696075 ) ( not ( = ?auto_2696075 ?auto_2696076 ) ) ( not ( = ?auto_2696075 ?auto_2696077 ) ) ( TRUCK-AT ?auto_2696082 ?auto_2696083 ) ( not ( = ?auto_2696083 ?auto_2696081 ) ) ( HOIST-AT ?auto_2696079 ?auto_2696083 ) ( not ( = ?auto_2696078 ?auto_2696079 ) ) ( AVAILABLE ?auto_2696079 ) ( SURFACE-AT ?auto_2696077 ?auto_2696083 ) ( ON ?auto_2696077 ?auto_2696080 ) ( CLEAR ?auto_2696077 ) ( not ( = ?auto_2696076 ?auto_2696080 ) ) ( not ( = ?auto_2696077 ?auto_2696080 ) ) ( not ( = ?auto_2696075 ?auto_2696080 ) ) ( ON ?auto_2696067 ?auto_2696066 ) ( ON ?auto_2696068 ?auto_2696067 ) ( ON ?auto_2696065 ?auto_2696068 ) ( ON ?auto_2696069 ?auto_2696065 ) ( ON ?auto_2696071 ?auto_2696069 ) ( ON ?auto_2696070 ?auto_2696071 ) ( ON ?auto_2696072 ?auto_2696070 ) ( ON ?auto_2696073 ?auto_2696072 ) ( ON ?auto_2696074 ?auto_2696073 ) ( ON ?auto_2696075 ?auto_2696074 ) ( not ( = ?auto_2696066 ?auto_2696067 ) ) ( not ( = ?auto_2696066 ?auto_2696068 ) ) ( not ( = ?auto_2696066 ?auto_2696065 ) ) ( not ( = ?auto_2696066 ?auto_2696069 ) ) ( not ( = ?auto_2696066 ?auto_2696071 ) ) ( not ( = ?auto_2696066 ?auto_2696070 ) ) ( not ( = ?auto_2696066 ?auto_2696072 ) ) ( not ( = ?auto_2696066 ?auto_2696073 ) ) ( not ( = ?auto_2696066 ?auto_2696074 ) ) ( not ( = ?auto_2696066 ?auto_2696075 ) ) ( not ( = ?auto_2696066 ?auto_2696076 ) ) ( not ( = ?auto_2696066 ?auto_2696077 ) ) ( not ( = ?auto_2696066 ?auto_2696080 ) ) ( not ( = ?auto_2696067 ?auto_2696068 ) ) ( not ( = ?auto_2696067 ?auto_2696065 ) ) ( not ( = ?auto_2696067 ?auto_2696069 ) ) ( not ( = ?auto_2696067 ?auto_2696071 ) ) ( not ( = ?auto_2696067 ?auto_2696070 ) ) ( not ( = ?auto_2696067 ?auto_2696072 ) ) ( not ( = ?auto_2696067 ?auto_2696073 ) ) ( not ( = ?auto_2696067 ?auto_2696074 ) ) ( not ( = ?auto_2696067 ?auto_2696075 ) ) ( not ( = ?auto_2696067 ?auto_2696076 ) ) ( not ( = ?auto_2696067 ?auto_2696077 ) ) ( not ( = ?auto_2696067 ?auto_2696080 ) ) ( not ( = ?auto_2696068 ?auto_2696065 ) ) ( not ( = ?auto_2696068 ?auto_2696069 ) ) ( not ( = ?auto_2696068 ?auto_2696071 ) ) ( not ( = ?auto_2696068 ?auto_2696070 ) ) ( not ( = ?auto_2696068 ?auto_2696072 ) ) ( not ( = ?auto_2696068 ?auto_2696073 ) ) ( not ( = ?auto_2696068 ?auto_2696074 ) ) ( not ( = ?auto_2696068 ?auto_2696075 ) ) ( not ( = ?auto_2696068 ?auto_2696076 ) ) ( not ( = ?auto_2696068 ?auto_2696077 ) ) ( not ( = ?auto_2696068 ?auto_2696080 ) ) ( not ( = ?auto_2696065 ?auto_2696069 ) ) ( not ( = ?auto_2696065 ?auto_2696071 ) ) ( not ( = ?auto_2696065 ?auto_2696070 ) ) ( not ( = ?auto_2696065 ?auto_2696072 ) ) ( not ( = ?auto_2696065 ?auto_2696073 ) ) ( not ( = ?auto_2696065 ?auto_2696074 ) ) ( not ( = ?auto_2696065 ?auto_2696075 ) ) ( not ( = ?auto_2696065 ?auto_2696076 ) ) ( not ( = ?auto_2696065 ?auto_2696077 ) ) ( not ( = ?auto_2696065 ?auto_2696080 ) ) ( not ( = ?auto_2696069 ?auto_2696071 ) ) ( not ( = ?auto_2696069 ?auto_2696070 ) ) ( not ( = ?auto_2696069 ?auto_2696072 ) ) ( not ( = ?auto_2696069 ?auto_2696073 ) ) ( not ( = ?auto_2696069 ?auto_2696074 ) ) ( not ( = ?auto_2696069 ?auto_2696075 ) ) ( not ( = ?auto_2696069 ?auto_2696076 ) ) ( not ( = ?auto_2696069 ?auto_2696077 ) ) ( not ( = ?auto_2696069 ?auto_2696080 ) ) ( not ( = ?auto_2696071 ?auto_2696070 ) ) ( not ( = ?auto_2696071 ?auto_2696072 ) ) ( not ( = ?auto_2696071 ?auto_2696073 ) ) ( not ( = ?auto_2696071 ?auto_2696074 ) ) ( not ( = ?auto_2696071 ?auto_2696075 ) ) ( not ( = ?auto_2696071 ?auto_2696076 ) ) ( not ( = ?auto_2696071 ?auto_2696077 ) ) ( not ( = ?auto_2696071 ?auto_2696080 ) ) ( not ( = ?auto_2696070 ?auto_2696072 ) ) ( not ( = ?auto_2696070 ?auto_2696073 ) ) ( not ( = ?auto_2696070 ?auto_2696074 ) ) ( not ( = ?auto_2696070 ?auto_2696075 ) ) ( not ( = ?auto_2696070 ?auto_2696076 ) ) ( not ( = ?auto_2696070 ?auto_2696077 ) ) ( not ( = ?auto_2696070 ?auto_2696080 ) ) ( not ( = ?auto_2696072 ?auto_2696073 ) ) ( not ( = ?auto_2696072 ?auto_2696074 ) ) ( not ( = ?auto_2696072 ?auto_2696075 ) ) ( not ( = ?auto_2696072 ?auto_2696076 ) ) ( not ( = ?auto_2696072 ?auto_2696077 ) ) ( not ( = ?auto_2696072 ?auto_2696080 ) ) ( not ( = ?auto_2696073 ?auto_2696074 ) ) ( not ( = ?auto_2696073 ?auto_2696075 ) ) ( not ( = ?auto_2696073 ?auto_2696076 ) ) ( not ( = ?auto_2696073 ?auto_2696077 ) ) ( not ( = ?auto_2696073 ?auto_2696080 ) ) ( not ( = ?auto_2696074 ?auto_2696075 ) ) ( not ( = ?auto_2696074 ?auto_2696076 ) ) ( not ( = ?auto_2696074 ?auto_2696077 ) ) ( not ( = ?auto_2696074 ?auto_2696080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2696075 ?auto_2696076 ?auto_2696077 )
      ( MAKE-12CRATE-VERIFY ?auto_2696066 ?auto_2696067 ?auto_2696068 ?auto_2696065 ?auto_2696069 ?auto_2696071 ?auto_2696070 ?auto_2696072 ?auto_2696073 ?auto_2696074 ?auto_2696075 ?auto_2696076 ?auto_2696077 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2696229 - SURFACE
      ?auto_2696230 - SURFACE
      ?auto_2696231 - SURFACE
      ?auto_2696228 - SURFACE
      ?auto_2696232 - SURFACE
      ?auto_2696234 - SURFACE
      ?auto_2696233 - SURFACE
      ?auto_2696235 - SURFACE
      ?auto_2696236 - SURFACE
      ?auto_2696237 - SURFACE
      ?auto_2696238 - SURFACE
      ?auto_2696239 - SURFACE
      ?auto_2696240 - SURFACE
    )
    :vars
    (
      ?auto_2696242 - HOIST
      ?auto_2696244 - PLACE
      ?auto_2696243 - PLACE
      ?auto_2696245 - HOIST
      ?auto_2696241 - SURFACE
      ?auto_2696246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2696242 ?auto_2696244 ) ( SURFACE-AT ?auto_2696239 ?auto_2696244 ) ( CLEAR ?auto_2696239 ) ( IS-CRATE ?auto_2696240 ) ( not ( = ?auto_2696239 ?auto_2696240 ) ) ( AVAILABLE ?auto_2696242 ) ( ON ?auto_2696239 ?auto_2696238 ) ( not ( = ?auto_2696238 ?auto_2696239 ) ) ( not ( = ?auto_2696238 ?auto_2696240 ) ) ( not ( = ?auto_2696243 ?auto_2696244 ) ) ( HOIST-AT ?auto_2696245 ?auto_2696243 ) ( not ( = ?auto_2696242 ?auto_2696245 ) ) ( AVAILABLE ?auto_2696245 ) ( SURFACE-AT ?auto_2696240 ?auto_2696243 ) ( ON ?auto_2696240 ?auto_2696241 ) ( CLEAR ?auto_2696240 ) ( not ( = ?auto_2696239 ?auto_2696241 ) ) ( not ( = ?auto_2696240 ?auto_2696241 ) ) ( not ( = ?auto_2696238 ?auto_2696241 ) ) ( TRUCK-AT ?auto_2696246 ?auto_2696244 ) ( ON ?auto_2696230 ?auto_2696229 ) ( ON ?auto_2696231 ?auto_2696230 ) ( ON ?auto_2696228 ?auto_2696231 ) ( ON ?auto_2696232 ?auto_2696228 ) ( ON ?auto_2696234 ?auto_2696232 ) ( ON ?auto_2696233 ?auto_2696234 ) ( ON ?auto_2696235 ?auto_2696233 ) ( ON ?auto_2696236 ?auto_2696235 ) ( ON ?auto_2696237 ?auto_2696236 ) ( ON ?auto_2696238 ?auto_2696237 ) ( not ( = ?auto_2696229 ?auto_2696230 ) ) ( not ( = ?auto_2696229 ?auto_2696231 ) ) ( not ( = ?auto_2696229 ?auto_2696228 ) ) ( not ( = ?auto_2696229 ?auto_2696232 ) ) ( not ( = ?auto_2696229 ?auto_2696234 ) ) ( not ( = ?auto_2696229 ?auto_2696233 ) ) ( not ( = ?auto_2696229 ?auto_2696235 ) ) ( not ( = ?auto_2696229 ?auto_2696236 ) ) ( not ( = ?auto_2696229 ?auto_2696237 ) ) ( not ( = ?auto_2696229 ?auto_2696238 ) ) ( not ( = ?auto_2696229 ?auto_2696239 ) ) ( not ( = ?auto_2696229 ?auto_2696240 ) ) ( not ( = ?auto_2696229 ?auto_2696241 ) ) ( not ( = ?auto_2696230 ?auto_2696231 ) ) ( not ( = ?auto_2696230 ?auto_2696228 ) ) ( not ( = ?auto_2696230 ?auto_2696232 ) ) ( not ( = ?auto_2696230 ?auto_2696234 ) ) ( not ( = ?auto_2696230 ?auto_2696233 ) ) ( not ( = ?auto_2696230 ?auto_2696235 ) ) ( not ( = ?auto_2696230 ?auto_2696236 ) ) ( not ( = ?auto_2696230 ?auto_2696237 ) ) ( not ( = ?auto_2696230 ?auto_2696238 ) ) ( not ( = ?auto_2696230 ?auto_2696239 ) ) ( not ( = ?auto_2696230 ?auto_2696240 ) ) ( not ( = ?auto_2696230 ?auto_2696241 ) ) ( not ( = ?auto_2696231 ?auto_2696228 ) ) ( not ( = ?auto_2696231 ?auto_2696232 ) ) ( not ( = ?auto_2696231 ?auto_2696234 ) ) ( not ( = ?auto_2696231 ?auto_2696233 ) ) ( not ( = ?auto_2696231 ?auto_2696235 ) ) ( not ( = ?auto_2696231 ?auto_2696236 ) ) ( not ( = ?auto_2696231 ?auto_2696237 ) ) ( not ( = ?auto_2696231 ?auto_2696238 ) ) ( not ( = ?auto_2696231 ?auto_2696239 ) ) ( not ( = ?auto_2696231 ?auto_2696240 ) ) ( not ( = ?auto_2696231 ?auto_2696241 ) ) ( not ( = ?auto_2696228 ?auto_2696232 ) ) ( not ( = ?auto_2696228 ?auto_2696234 ) ) ( not ( = ?auto_2696228 ?auto_2696233 ) ) ( not ( = ?auto_2696228 ?auto_2696235 ) ) ( not ( = ?auto_2696228 ?auto_2696236 ) ) ( not ( = ?auto_2696228 ?auto_2696237 ) ) ( not ( = ?auto_2696228 ?auto_2696238 ) ) ( not ( = ?auto_2696228 ?auto_2696239 ) ) ( not ( = ?auto_2696228 ?auto_2696240 ) ) ( not ( = ?auto_2696228 ?auto_2696241 ) ) ( not ( = ?auto_2696232 ?auto_2696234 ) ) ( not ( = ?auto_2696232 ?auto_2696233 ) ) ( not ( = ?auto_2696232 ?auto_2696235 ) ) ( not ( = ?auto_2696232 ?auto_2696236 ) ) ( not ( = ?auto_2696232 ?auto_2696237 ) ) ( not ( = ?auto_2696232 ?auto_2696238 ) ) ( not ( = ?auto_2696232 ?auto_2696239 ) ) ( not ( = ?auto_2696232 ?auto_2696240 ) ) ( not ( = ?auto_2696232 ?auto_2696241 ) ) ( not ( = ?auto_2696234 ?auto_2696233 ) ) ( not ( = ?auto_2696234 ?auto_2696235 ) ) ( not ( = ?auto_2696234 ?auto_2696236 ) ) ( not ( = ?auto_2696234 ?auto_2696237 ) ) ( not ( = ?auto_2696234 ?auto_2696238 ) ) ( not ( = ?auto_2696234 ?auto_2696239 ) ) ( not ( = ?auto_2696234 ?auto_2696240 ) ) ( not ( = ?auto_2696234 ?auto_2696241 ) ) ( not ( = ?auto_2696233 ?auto_2696235 ) ) ( not ( = ?auto_2696233 ?auto_2696236 ) ) ( not ( = ?auto_2696233 ?auto_2696237 ) ) ( not ( = ?auto_2696233 ?auto_2696238 ) ) ( not ( = ?auto_2696233 ?auto_2696239 ) ) ( not ( = ?auto_2696233 ?auto_2696240 ) ) ( not ( = ?auto_2696233 ?auto_2696241 ) ) ( not ( = ?auto_2696235 ?auto_2696236 ) ) ( not ( = ?auto_2696235 ?auto_2696237 ) ) ( not ( = ?auto_2696235 ?auto_2696238 ) ) ( not ( = ?auto_2696235 ?auto_2696239 ) ) ( not ( = ?auto_2696235 ?auto_2696240 ) ) ( not ( = ?auto_2696235 ?auto_2696241 ) ) ( not ( = ?auto_2696236 ?auto_2696237 ) ) ( not ( = ?auto_2696236 ?auto_2696238 ) ) ( not ( = ?auto_2696236 ?auto_2696239 ) ) ( not ( = ?auto_2696236 ?auto_2696240 ) ) ( not ( = ?auto_2696236 ?auto_2696241 ) ) ( not ( = ?auto_2696237 ?auto_2696238 ) ) ( not ( = ?auto_2696237 ?auto_2696239 ) ) ( not ( = ?auto_2696237 ?auto_2696240 ) ) ( not ( = ?auto_2696237 ?auto_2696241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2696238 ?auto_2696239 ?auto_2696240 )
      ( MAKE-12CRATE-VERIFY ?auto_2696229 ?auto_2696230 ?auto_2696231 ?auto_2696228 ?auto_2696232 ?auto_2696234 ?auto_2696233 ?auto_2696235 ?auto_2696236 ?auto_2696237 ?auto_2696238 ?auto_2696239 ?auto_2696240 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2696392 - SURFACE
      ?auto_2696393 - SURFACE
      ?auto_2696394 - SURFACE
      ?auto_2696391 - SURFACE
      ?auto_2696395 - SURFACE
      ?auto_2696397 - SURFACE
      ?auto_2696396 - SURFACE
      ?auto_2696398 - SURFACE
      ?auto_2696399 - SURFACE
      ?auto_2696400 - SURFACE
      ?auto_2696401 - SURFACE
      ?auto_2696402 - SURFACE
      ?auto_2696403 - SURFACE
    )
    :vars
    (
      ?auto_2696405 - HOIST
      ?auto_2696409 - PLACE
      ?auto_2696404 - PLACE
      ?auto_2696406 - HOIST
      ?auto_2696408 - SURFACE
      ?auto_2696407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2696405 ?auto_2696409 ) ( IS-CRATE ?auto_2696403 ) ( not ( = ?auto_2696402 ?auto_2696403 ) ) ( not ( = ?auto_2696401 ?auto_2696402 ) ) ( not ( = ?auto_2696401 ?auto_2696403 ) ) ( not ( = ?auto_2696404 ?auto_2696409 ) ) ( HOIST-AT ?auto_2696406 ?auto_2696404 ) ( not ( = ?auto_2696405 ?auto_2696406 ) ) ( AVAILABLE ?auto_2696406 ) ( SURFACE-AT ?auto_2696403 ?auto_2696404 ) ( ON ?auto_2696403 ?auto_2696408 ) ( CLEAR ?auto_2696403 ) ( not ( = ?auto_2696402 ?auto_2696408 ) ) ( not ( = ?auto_2696403 ?auto_2696408 ) ) ( not ( = ?auto_2696401 ?auto_2696408 ) ) ( TRUCK-AT ?auto_2696407 ?auto_2696409 ) ( SURFACE-AT ?auto_2696401 ?auto_2696409 ) ( CLEAR ?auto_2696401 ) ( LIFTING ?auto_2696405 ?auto_2696402 ) ( IS-CRATE ?auto_2696402 ) ( ON ?auto_2696393 ?auto_2696392 ) ( ON ?auto_2696394 ?auto_2696393 ) ( ON ?auto_2696391 ?auto_2696394 ) ( ON ?auto_2696395 ?auto_2696391 ) ( ON ?auto_2696397 ?auto_2696395 ) ( ON ?auto_2696396 ?auto_2696397 ) ( ON ?auto_2696398 ?auto_2696396 ) ( ON ?auto_2696399 ?auto_2696398 ) ( ON ?auto_2696400 ?auto_2696399 ) ( ON ?auto_2696401 ?auto_2696400 ) ( not ( = ?auto_2696392 ?auto_2696393 ) ) ( not ( = ?auto_2696392 ?auto_2696394 ) ) ( not ( = ?auto_2696392 ?auto_2696391 ) ) ( not ( = ?auto_2696392 ?auto_2696395 ) ) ( not ( = ?auto_2696392 ?auto_2696397 ) ) ( not ( = ?auto_2696392 ?auto_2696396 ) ) ( not ( = ?auto_2696392 ?auto_2696398 ) ) ( not ( = ?auto_2696392 ?auto_2696399 ) ) ( not ( = ?auto_2696392 ?auto_2696400 ) ) ( not ( = ?auto_2696392 ?auto_2696401 ) ) ( not ( = ?auto_2696392 ?auto_2696402 ) ) ( not ( = ?auto_2696392 ?auto_2696403 ) ) ( not ( = ?auto_2696392 ?auto_2696408 ) ) ( not ( = ?auto_2696393 ?auto_2696394 ) ) ( not ( = ?auto_2696393 ?auto_2696391 ) ) ( not ( = ?auto_2696393 ?auto_2696395 ) ) ( not ( = ?auto_2696393 ?auto_2696397 ) ) ( not ( = ?auto_2696393 ?auto_2696396 ) ) ( not ( = ?auto_2696393 ?auto_2696398 ) ) ( not ( = ?auto_2696393 ?auto_2696399 ) ) ( not ( = ?auto_2696393 ?auto_2696400 ) ) ( not ( = ?auto_2696393 ?auto_2696401 ) ) ( not ( = ?auto_2696393 ?auto_2696402 ) ) ( not ( = ?auto_2696393 ?auto_2696403 ) ) ( not ( = ?auto_2696393 ?auto_2696408 ) ) ( not ( = ?auto_2696394 ?auto_2696391 ) ) ( not ( = ?auto_2696394 ?auto_2696395 ) ) ( not ( = ?auto_2696394 ?auto_2696397 ) ) ( not ( = ?auto_2696394 ?auto_2696396 ) ) ( not ( = ?auto_2696394 ?auto_2696398 ) ) ( not ( = ?auto_2696394 ?auto_2696399 ) ) ( not ( = ?auto_2696394 ?auto_2696400 ) ) ( not ( = ?auto_2696394 ?auto_2696401 ) ) ( not ( = ?auto_2696394 ?auto_2696402 ) ) ( not ( = ?auto_2696394 ?auto_2696403 ) ) ( not ( = ?auto_2696394 ?auto_2696408 ) ) ( not ( = ?auto_2696391 ?auto_2696395 ) ) ( not ( = ?auto_2696391 ?auto_2696397 ) ) ( not ( = ?auto_2696391 ?auto_2696396 ) ) ( not ( = ?auto_2696391 ?auto_2696398 ) ) ( not ( = ?auto_2696391 ?auto_2696399 ) ) ( not ( = ?auto_2696391 ?auto_2696400 ) ) ( not ( = ?auto_2696391 ?auto_2696401 ) ) ( not ( = ?auto_2696391 ?auto_2696402 ) ) ( not ( = ?auto_2696391 ?auto_2696403 ) ) ( not ( = ?auto_2696391 ?auto_2696408 ) ) ( not ( = ?auto_2696395 ?auto_2696397 ) ) ( not ( = ?auto_2696395 ?auto_2696396 ) ) ( not ( = ?auto_2696395 ?auto_2696398 ) ) ( not ( = ?auto_2696395 ?auto_2696399 ) ) ( not ( = ?auto_2696395 ?auto_2696400 ) ) ( not ( = ?auto_2696395 ?auto_2696401 ) ) ( not ( = ?auto_2696395 ?auto_2696402 ) ) ( not ( = ?auto_2696395 ?auto_2696403 ) ) ( not ( = ?auto_2696395 ?auto_2696408 ) ) ( not ( = ?auto_2696397 ?auto_2696396 ) ) ( not ( = ?auto_2696397 ?auto_2696398 ) ) ( not ( = ?auto_2696397 ?auto_2696399 ) ) ( not ( = ?auto_2696397 ?auto_2696400 ) ) ( not ( = ?auto_2696397 ?auto_2696401 ) ) ( not ( = ?auto_2696397 ?auto_2696402 ) ) ( not ( = ?auto_2696397 ?auto_2696403 ) ) ( not ( = ?auto_2696397 ?auto_2696408 ) ) ( not ( = ?auto_2696396 ?auto_2696398 ) ) ( not ( = ?auto_2696396 ?auto_2696399 ) ) ( not ( = ?auto_2696396 ?auto_2696400 ) ) ( not ( = ?auto_2696396 ?auto_2696401 ) ) ( not ( = ?auto_2696396 ?auto_2696402 ) ) ( not ( = ?auto_2696396 ?auto_2696403 ) ) ( not ( = ?auto_2696396 ?auto_2696408 ) ) ( not ( = ?auto_2696398 ?auto_2696399 ) ) ( not ( = ?auto_2696398 ?auto_2696400 ) ) ( not ( = ?auto_2696398 ?auto_2696401 ) ) ( not ( = ?auto_2696398 ?auto_2696402 ) ) ( not ( = ?auto_2696398 ?auto_2696403 ) ) ( not ( = ?auto_2696398 ?auto_2696408 ) ) ( not ( = ?auto_2696399 ?auto_2696400 ) ) ( not ( = ?auto_2696399 ?auto_2696401 ) ) ( not ( = ?auto_2696399 ?auto_2696402 ) ) ( not ( = ?auto_2696399 ?auto_2696403 ) ) ( not ( = ?auto_2696399 ?auto_2696408 ) ) ( not ( = ?auto_2696400 ?auto_2696401 ) ) ( not ( = ?auto_2696400 ?auto_2696402 ) ) ( not ( = ?auto_2696400 ?auto_2696403 ) ) ( not ( = ?auto_2696400 ?auto_2696408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2696401 ?auto_2696402 ?auto_2696403 )
      ( MAKE-12CRATE-VERIFY ?auto_2696392 ?auto_2696393 ?auto_2696394 ?auto_2696391 ?auto_2696395 ?auto_2696397 ?auto_2696396 ?auto_2696398 ?auto_2696399 ?auto_2696400 ?auto_2696401 ?auto_2696402 ?auto_2696403 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2696555 - SURFACE
      ?auto_2696556 - SURFACE
      ?auto_2696557 - SURFACE
      ?auto_2696554 - SURFACE
      ?auto_2696558 - SURFACE
      ?auto_2696560 - SURFACE
      ?auto_2696559 - SURFACE
      ?auto_2696561 - SURFACE
      ?auto_2696562 - SURFACE
      ?auto_2696563 - SURFACE
      ?auto_2696564 - SURFACE
      ?auto_2696565 - SURFACE
      ?auto_2696566 - SURFACE
    )
    :vars
    (
      ?auto_2696567 - HOIST
      ?auto_2696572 - PLACE
      ?auto_2696569 - PLACE
      ?auto_2696570 - HOIST
      ?auto_2696568 - SURFACE
      ?auto_2696571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2696567 ?auto_2696572 ) ( IS-CRATE ?auto_2696566 ) ( not ( = ?auto_2696565 ?auto_2696566 ) ) ( not ( = ?auto_2696564 ?auto_2696565 ) ) ( not ( = ?auto_2696564 ?auto_2696566 ) ) ( not ( = ?auto_2696569 ?auto_2696572 ) ) ( HOIST-AT ?auto_2696570 ?auto_2696569 ) ( not ( = ?auto_2696567 ?auto_2696570 ) ) ( AVAILABLE ?auto_2696570 ) ( SURFACE-AT ?auto_2696566 ?auto_2696569 ) ( ON ?auto_2696566 ?auto_2696568 ) ( CLEAR ?auto_2696566 ) ( not ( = ?auto_2696565 ?auto_2696568 ) ) ( not ( = ?auto_2696566 ?auto_2696568 ) ) ( not ( = ?auto_2696564 ?auto_2696568 ) ) ( TRUCK-AT ?auto_2696571 ?auto_2696572 ) ( SURFACE-AT ?auto_2696564 ?auto_2696572 ) ( CLEAR ?auto_2696564 ) ( IS-CRATE ?auto_2696565 ) ( AVAILABLE ?auto_2696567 ) ( IN ?auto_2696565 ?auto_2696571 ) ( ON ?auto_2696556 ?auto_2696555 ) ( ON ?auto_2696557 ?auto_2696556 ) ( ON ?auto_2696554 ?auto_2696557 ) ( ON ?auto_2696558 ?auto_2696554 ) ( ON ?auto_2696560 ?auto_2696558 ) ( ON ?auto_2696559 ?auto_2696560 ) ( ON ?auto_2696561 ?auto_2696559 ) ( ON ?auto_2696562 ?auto_2696561 ) ( ON ?auto_2696563 ?auto_2696562 ) ( ON ?auto_2696564 ?auto_2696563 ) ( not ( = ?auto_2696555 ?auto_2696556 ) ) ( not ( = ?auto_2696555 ?auto_2696557 ) ) ( not ( = ?auto_2696555 ?auto_2696554 ) ) ( not ( = ?auto_2696555 ?auto_2696558 ) ) ( not ( = ?auto_2696555 ?auto_2696560 ) ) ( not ( = ?auto_2696555 ?auto_2696559 ) ) ( not ( = ?auto_2696555 ?auto_2696561 ) ) ( not ( = ?auto_2696555 ?auto_2696562 ) ) ( not ( = ?auto_2696555 ?auto_2696563 ) ) ( not ( = ?auto_2696555 ?auto_2696564 ) ) ( not ( = ?auto_2696555 ?auto_2696565 ) ) ( not ( = ?auto_2696555 ?auto_2696566 ) ) ( not ( = ?auto_2696555 ?auto_2696568 ) ) ( not ( = ?auto_2696556 ?auto_2696557 ) ) ( not ( = ?auto_2696556 ?auto_2696554 ) ) ( not ( = ?auto_2696556 ?auto_2696558 ) ) ( not ( = ?auto_2696556 ?auto_2696560 ) ) ( not ( = ?auto_2696556 ?auto_2696559 ) ) ( not ( = ?auto_2696556 ?auto_2696561 ) ) ( not ( = ?auto_2696556 ?auto_2696562 ) ) ( not ( = ?auto_2696556 ?auto_2696563 ) ) ( not ( = ?auto_2696556 ?auto_2696564 ) ) ( not ( = ?auto_2696556 ?auto_2696565 ) ) ( not ( = ?auto_2696556 ?auto_2696566 ) ) ( not ( = ?auto_2696556 ?auto_2696568 ) ) ( not ( = ?auto_2696557 ?auto_2696554 ) ) ( not ( = ?auto_2696557 ?auto_2696558 ) ) ( not ( = ?auto_2696557 ?auto_2696560 ) ) ( not ( = ?auto_2696557 ?auto_2696559 ) ) ( not ( = ?auto_2696557 ?auto_2696561 ) ) ( not ( = ?auto_2696557 ?auto_2696562 ) ) ( not ( = ?auto_2696557 ?auto_2696563 ) ) ( not ( = ?auto_2696557 ?auto_2696564 ) ) ( not ( = ?auto_2696557 ?auto_2696565 ) ) ( not ( = ?auto_2696557 ?auto_2696566 ) ) ( not ( = ?auto_2696557 ?auto_2696568 ) ) ( not ( = ?auto_2696554 ?auto_2696558 ) ) ( not ( = ?auto_2696554 ?auto_2696560 ) ) ( not ( = ?auto_2696554 ?auto_2696559 ) ) ( not ( = ?auto_2696554 ?auto_2696561 ) ) ( not ( = ?auto_2696554 ?auto_2696562 ) ) ( not ( = ?auto_2696554 ?auto_2696563 ) ) ( not ( = ?auto_2696554 ?auto_2696564 ) ) ( not ( = ?auto_2696554 ?auto_2696565 ) ) ( not ( = ?auto_2696554 ?auto_2696566 ) ) ( not ( = ?auto_2696554 ?auto_2696568 ) ) ( not ( = ?auto_2696558 ?auto_2696560 ) ) ( not ( = ?auto_2696558 ?auto_2696559 ) ) ( not ( = ?auto_2696558 ?auto_2696561 ) ) ( not ( = ?auto_2696558 ?auto_2696562 ) ) ( not ( = ?auto_2696558 ?auto_2696563 ) ) ( not ( = ?auto_2696558 ?auto_2696564 ) ) ( not ( = ?auto_2696558 ?auto_2696565 ) ) ( not ( = ?auto_2696558 ?auto_2696566 ) ) ( not ( = ?auto_2696558 ?auto_2696568 ) ) ( not ( = ?auto_2696560 ?auto_2696559 ) ) ( not ( = ?auto_2696560 ?auto_2696561 ) ) ( not ( = ?auto_2696560 ?auto_2696562 ) ) ( not ( = ?auto_2696560 ?auto_2696563 ) ) ( not ( = ?auto_2696560 ?auto_2696564 ) ) ( not ( = ?auto_2696560 ?auto_2696565 ) ) ( not ( = ?auto_2696560 ?auto_2696566 ) ) ( not ( = ?auto_2696560 ?auto_2696568 ) ) ( not ( = ?auto_2696559 ?auto_2696561 ) ) ( not ( = ?auto_2696559 ?auto_2696562 ) ) ( not ( = ?auto_2696559 ?auto_2696563 ) ) ( not ( = ?auto_2696559 ?auto_2696564 ) ) ( not ( = ?auto_2696559 ?auto_2696565 ) ) ( not ( = ?auto_2696559 ?auto_2696566 ) ) ( not ( = ?auto_2696559 ?auto_2696568 ) ) ( not ( = ?auto_2696561 ?auto_2696562 ) ) ( not ( = ?auto_2696561 ?auto_2696563 ) ) ( not ( = ?auto_2696561 ?auto_2696564 ) ) ( not ( = ?auto_2696561 ?auto_2696565 ) ) ( not ( = ?auto_2696561 ?auto_2696566 ) ) ( not ( = ?auto_2696561 ?auto_2696568 ) ) ( not ( = ?auto_2696562 ?auto_2696563 ) ) ( not ( = ?auto_2696562 ?auto_2696564 ) ) ( not ( = ?auto_2696562 ?auto_2696565 ) ) ( not ( = ?auto_2696562 ?auto_2696566 ) ) ( not ( = ?auto_2696562 ?auto_2696568 ) ) ( not ( = ?auto_2696563 ?auto_2696564 ) ) ( not ( = ?auto_2696563 ?auto_2696565 ) ) ( not ( = ?auto_2696563 ?auto_2696566 ) ) ( not ( = ?auto_2696563 ?auto_2696568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2696564 ?auto_2696565 ?auto_2696566 )
      ( MAKE-12CRATE-VERIFY ?auto_2696555 ?auto_2696556 ?auto_2696557 ?auto_2696554 ?auto_2696558 ?auto_2696560 ?auto_2696559 ?auto_2696561 ?auto_2696562 ?auto_2696563 ?auto_2696564 ?auto_2696565 ?auto_2696566 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708159 - SURFACE
      ?auto_2708160 - SURFACE
      ?auto_2708161 - SURFACE
      ?auto_2708158 - SURFACE
      ?auto_2708162 - SURFACE
      ?auto_2708164 - SURFACE
      ?auto_2708163 - SURFACE
      ?auto_2708165 - SURFACE
      ?auto_2708166 - SURFACE
      ?auto_2708167 - SURFACE
      ?auto_2708168 - SURFACE
      ?auto_2708169 - SURFACE
      ?auto_2708170 - SURFACE
      ?auto_2708171 - SURFACE
    )
    :vars
    (
      ?auto_2708172 - HOIST
      ?auto_2708173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708172 ?auto_2708173 ) ( SURFACE-AT ?auto_2708170 ?auto_2708173 ) ( CLEAR ?auto_2708170 ) ( LIFTING ?auto_2708172 ?auto_2708171 ) ( IS-CRATE ?auto_2708171 ) ( not ( = ?auto_2708170 ?auto_2708171 ) ) ( ON ?auto_2708160 ?auto_2708159 ) ( ON ?auto_2708161 ?auto_2708160 ) ( ON ?auto_2708158 ?auto_2708161 ) ( ON ?auto_2708162 ?auto_2708158 ) ( ON ?auto_2708164 ?auto_2708162 ) ( ON ?auto_2708163 ?auto_2708164 ) ( ON ?auto_2708165 ?auto_2708163 ) ( ON ?auto_2708166 ?auto_2708165 ) ( ON ?auto_2708167 ?auto_2708166 ) ( ON ?auto_2708168 ?auto_2708167 ) ( ON ?auto_2708169 ?auto_2708168 ) ( ON ?auto_2708170 ?auto_2708169 ) ( not ( = ?auto_2708159 ?auto_2708160 ) ) ( not ( = ?auto_2708159 ?auto_2708161 ) ) ( not ( = ?auto_2708159 ?auto_2708158 ) ) ( not ( = ?auto_2708159 ?auto_2708162 ) ) ( not ( = ?auto_2708159 ?auto_2708164 ) ) ( not ( = ?auto_2708159 ?auto_2708163 ) ) ( not ( = ?auto_2708159 ?auto_2708165 ) ) ( not ( = ?auto_2708159 ?auto_2708166 ) ) ( not ( = ?auto_2708159 ?auto_2708167 ) ) ( not ( = ?auto_2708159 ?auto_2708168 ) ) ( not ( = ?auto_2708159 ?auto_2708169 ) ) ( not ( = ?auto_2708159 ?auto_2708170 ) ) ( not ( = ?auto_2708159 ?auto_2708171 ) ) ( not ( = ?auto_2708160 ?auto_2708161 ) ) ( not ( = ?auto_2708160 ?auto_2708158 ) ) ( not ( = ?auto_2708160 ?auto_2708162 ) ) ( not ( = ?auto_2708160 ?auto_2708164 ) ) ( not ( = ?auto_2708160 ?auto_2708163 ) ) ( not ( = ?auto_2708160 ?auto_2708165 ) ) ( not ( = ?auto_2708160 ?auto_2708166 ) ) ( not ( = ?auto_2708160 ?auto_2708167 ) ) ( not ( = ?auto_2708160 ?auto_2708168 ) ) ( not ( = ?auto_2708160 ?auto_2708169 ) ) ( not ( = ?auto_2708160 ?auto_2708170 ) ) ( not ( = ?auto_2708160 ?auto_2708171 ) ) ( not ( = ?auto_2708161 ?auto_2708158 ) ) ( not ( = ?auto_2708161 ?auto_2708162 ) ) ( not ( = ?auto_2708161 ?auto_2708164 ) ) ( not ( = ?auto_2708161 ?auto_2708163 ) ) ( not ( = ?auto_2708161 ?auto_2708165 ) ) ( not ( = ?auto_2708161 ?auto_2708166 ) ) ( not ( = ?auto_2708161 ?auto_2708167 ) ) ( not ( = ?auto_2708161 ?auto_2708168 ) ) ( not ( = ?auto_2708161 ?auto_2708169 ) ) ( not ( = ?auto_2708161 ?auto_2708170 ) ) ( not ( = ?auto_2708161 ?auto_2708171 ) ) ( not ( = ?auto_2708158 ?auto_2708162 ) ) ( not ( = ?auto_2708158 ?auto_2708164 ) ) ( not ( = ?auto_2708158 ?auto_2708163 ) ) ( not ( = ?auto_2708158 ?auto_2708165 ) ) ( not ( = ?auto_2708158 ?auto_2708166 ) ) ( not ( = ?auto_2708158 ?auto_2708167 ) ) ( not ( = ?auto_2708158 ?auto_2708168 ) ) ( not ( = ?auto_2708158 ?auto_2708169 ) ) ( not ( = ?auto_2708158 ?auto_2708170 ) ) ( not ( = ?auto_2708158 ?auto_2708171 ) ) ( not ( = ?auto_2708162 ?auto_2708164 ) ) ( not ( = ?auto_2708162 ?auto_2708163 ) ) ( not ( = ?auto_2708162 ?auto_2708165 ) ) ( not ( = ?auto_2708162 ?auto_2708166 ) ) ( not ( = ?auto_2708162 ?auto_2708167 ) ) ( not ( = ?auto_2708162 ?auto_2708168 ) ) ( not ( = ?auto_2708162 ?auto_2708169 ) ) ( not ( = ?auto_2708162 ?auto_2708170 ) ) ( not ( = ?auto_2708162 ?auto_2708171 ) ) ( not ( = ?auto_2708164 ?auto_2708163 ) ) ( not ( = ?auto_2708164 ?auto_2708165 ) ) ( not ( = ?auto_2708164 ?auto_2708166 ) ) ( not ( = ?auto_2708164 ?auto_2708167 ) ) ( not ( = ?auto_2708164 ?auto_2708168 ) ) ( not ( = ?auto_2708164 ?auto_2708169 ) ) ( not ( = ?auto_2708164 ?auto_2708170 ) ) ( not ( = ?auto_2708164 ?auto_2708171 ) ) ( not ( = ?auto_2708163 ?auto_2708165 ) ) ( not ( = ?auto_2708163 ?auto_2708166 ) ) ( not ( = ?auto_2708163 ?auto_2708167 ) ) ( not ( = ?auto_2708163 ?auto_2708168 ) ) ( not ( = ?auto_2708163 ?auto_2708169 ) ) ( not ( = ?auto_2708163 ?auto_2708170 ) ) ( not ( = ?auto_2708163 ?auto_2708171 ) ) ( not ( = ?auto_2708165 ?auto_2708166 ) ) ( not ( = ?auto_2708165 ?auto_2708167 ) ) ( not ( = ?auto_2708165 ?auto_2708168 ) ) ( not ( = ?auto_2708165 ?auto_2708169 ) ) ( not ( = ?auto_2708165 ?auto_2708170 ) ) ( not ( = ?auto_2708165 ?auto_2708171 ) ) ( not ( = ?auto_2708166 ?auto_2708167 ) ) ( not ( = ?auto_2708166 ?auto_2708168 ) ) ( not ( = ?auto_2708166 ?auto_2708169 ) ) ( not ( = ?auto_2708166 ?auto_2708170 ) ) ( not ( = ?auto_2708166 ?auto_2708171 ) ) ( not ( = ?auto_2708167 ?auto_2708168 ) ) ( not ( = ?auto_2708167 ?auto_2708169 ) ) ( not ( = ?auto_2708167 ?auto_2708170 ) ) ( not ( = ?auto_2708167 ?auto_2708171 ) ) ( not ( = ?auto_2708168 ?auto_2708169 ) ) ( not ( = ?auto_2708168 ?auto_2708170 ) ) ( not ( = ?auto_2708168 ?auto_2708171 ) ) ( not ( = ?auto_2708169 ?auto_2708170 ) ) ( not ( = ?auto_2708169 ?auto_2708171 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2708170 ?auto_2708171 )
      ( MAKE-13CRATE-VERIFY ?auto_2708159 ?auto_2708160 ?auto_2708161 ?auto_2708158 ?auto_2708162 ?auto_2708164 ?auto_2708163 ?auto_2708165 ?auto_2708166 ?auto_2708167 ?auto_2708168 ?auto_2708169 ?auto_2708170 ?auto_2708171 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708301 - SURFACE
      ?auto_2708302 - SURFACE
      ?auto_2708303 - SURFACE
      ?auto_2708300 - SURFACE
      ?auto_2708304 - SURFACE
      ?auto_2708306 - SURFACE
      ?auto_2708305 - SURFACE
      ?auto_2708307 - SURFACE
      ?auto_2708308 - SURFACE
      ?auto_2708309 - SURFACE
      ?auto_2708310 - SURFACE
      ?auto_2708311 - SURFACE
      ?auto_2708312 - SURFACE
      ?auto_2708313 - SURFACE
    )
    :vars
    (
      ?auto_2708315 - HOIST
      ?auto_2708316 - PLACE
      ?auto_2708314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708315 ?auto_2708316 ) ( SURFACE-AT ?auto_2708312 ?auto_2708316 ) ( CLEAR ?auto_2708312 ) ( IS-CRATE ?auto_2708313 ) ( not ( = ?auto_2708312 ?auto_2708313 ) ) ( TRUCK-AT ?auto_2708314 ?auto_2708316 ) ( AVAILABLE ?auto_2708315 ) ( IN ?auto_2708313 ?auto_2708314 ) ( ON ?auto_2708312 ?auto_2708311 ) ( not ( = ?auto_2708311 ?auto_2708312 ) ) ( not ( = ?auto_2708311 ?auto_2708313 ) ) ( ON ?auto_2708302 ?auto_2708301 ) ( ON ?auto_2708303 ?auto_2708302 ) ( ON ?auto_2708300 ?auto_2708303 ) ( ON ?auto_2708304 ?auto_2708300 ) ( ON ?auto_2708306 ?auto_2708304 ) ( ON ?auto_2708305 ?auto_2708306 ) ( ON ?auto_2708307 ?auto_2708305 ) ( ON ?auto_2708308 ?auto_2708307 ) ( ON ?auto_2708309 ?auto_2708308 ) ( ON ?auto_2708310 ?auto_2708309 ) ( ON ?auto_2708311 ?auto_2708310 ) ( not ( = ?auto_2708301 ?auto_2708302 ) ) ( not ( = ?auto_2708301 ?auto_2708303 ) ) ( not ( = ?auto_2708301 ?auto_2708300 ) ) ( not ( = ?auto_2708301 ?auto_2708304 ) ) ( not ( = ?auto_2708301 ?auto_2708306 ) ) ( not ( = ?auto_2708301 ?auto_2708305 ) ) ( not ( = ?auto_2708301 ?auto_2708307 ) ) ( not ( = ?auto_2708301 ?auto_2708308 ) ) ( not ( = ?auto_2708301 ?auto_2708309 ) ) ( not ( = ?auto_2708301 ?auto_2708310 ) ) ( not ( = ?auto_2708301 ?auto_2708311 ) ) ( not ( = ?auto_2708301 ?auto_2708312 ) ) ( not ( = ?auto_2708301 ?auto_2708313 ) ) ( not ( = ?auto_2708302 ?auto_2708303 ) ) ( not ( = ?auto_2708302 ?auto_2708300 ) ) ( not ( = ?auto_2708302 ?auto_2708304 ) ) ( not ( = ?auto_2708302 ?auto_2708306 ) ) ( not ( = ?auto_2708302 ?auto_2708305 ) ) ( not ( = ?auto_2708302 ?auto_2708307 ) ) ( not ( = ?auto_2708302 ?auto_2708308 ) ) ( not ( = ?auto_2708302 ?auto_2708309 ) ) ( not ( = ?auto_2708302 ?auto_2708310 ) ) ( not ( = ?auto_2708302 ?auto_2708311 ) ) ( not ( = ?auto_2708302 ?auto_2708312 ) ) ( not ( = ?auto_2708302 ?auto_2708313 ) ) ( not ( = ?auto_2708303 ?auto_2708300 ) ) ( not ( = ?auto_2708303 ?auto_2708304 ) ) ( not ( = ?auto_2708303 ?auto_2708306 ) ) ( not ( = ?auto_2708303 ?auto_2708305 ) ) ( not ( = ?auto_2708303 ?auto_2708307 ) ) ( not ( = ?auto_2708303 ?auto_2708308 ) ) ( not ( = ?auto_2708303 ?auto_2708309 ) ) ( not ( = ?auto_2708303 ?auto_2708310 ) ) ( not ( = ?auto_2708303 ?auto_2708311 ) ) ( not ( = ?auto_2708303 ?auto_2708312 ) ) ( not ( = ?auto_2708303 ?auto_2708313 ) ) ( not ( = ?auto_2708300 ?auto_2708304 ) ) ( not ( = ?auto_2708300 ?auto_2708306 ) ) ( not ( = ?auto_2708300 ?auto_2708305 ) ) ( not ( = ?auto_2708300 ?auto_2708307 ) ) ( not ( = ?auto_2708300 ?auto_2708308 ) ) ( not ( = ?auto_2708300 ?auto_2708309 ) ) ( not ( = ?auto_2708300 ?auto_2708310 ) ) ( not ( = ?auto_2708300 ?auto_2708311 ) ) ( not ( = ?auto_2708300 ?auto_2708312 ) ) ( not ( = ?auto_2708300 ?auto_2708313 ) ) ( not ( = ?auto_2708304 ?auto_2708306 ) ) ( not ( = ?auto_2708304 ?auto_2708305 ) ) ( not ( = ?auto_2708304 ?auto_2708307 ) ) ( not ( = ?auto_2708304 ?auto_2708308 ) ) ( not ( = ?auto_2708304 ?auto_2708309 ) ) ( not ( = ?auto_2708304 ?auto_2708310 ) ) ( not ( = ?auto_2708304 ?auto_2708311 ) ) ( not ( = ?auto_2708304 ?auto_2708312 ) ) ( not ( = ?auto_2708304 ?auto_2708313 ) ) ( not ( = ?auto_2708306 ?auto_2708305 ) ) ( not ( = ?auto_2708306 ?auto_2708307 ) ) ( not ( = ?auto_2708306 ?auto_2708308 ) ) ( not ( = ?auto_2708306 ?auto_2708309 ) ) ( not ( = ?auto_2708306 ?auto_2708310 ) ) ( not ( = ?auto_2708306 ?auto_2708311 ) ) ( not ( = ?auto_2708306 ?auto_2708312 ) ) ( not ( = ?auto_2708306 ?auto_2708313 ) ) ( not ( = ?auto_2708305 ?auto_2708307 ) ) ( not ( = ?auto_2708305 ?auto_2708308 ) ) ( not ( = ?auto_2708305 ?auto_2708309 ) ) ( not ( = ?auto_2708305 ?auto_2708310 ) ) ( not ( = ?auto_2708305 ?auto_2708311 ) ) ( not ( = ?auto_2708305 ?auto_2708312 ) ) ( not ( = ?auto_2708305 ?auto_2708313 ) ) ( not ( = ?auto_2708307 ?auto_2708308 ) ) ( not ( = ?auto_2708307 ?auto_2708309 ) ) ( not ( = ?auto_2708307 ?auto_2708310 ) ) ( not ( = ?auto_2708307 ?auto_2708311 ) ) ( not ( = ?auto_2708307 ?auto_2708312 ) ) ( not ( = ?auto_2708307 ?auto_2708313 ) ) ( not ( = ?auto_2708308 ?auto_2708309 ) ) ( not ( = ?auto_2708308 ?auto_2708310 ) ) ( not ( = ?auto_2708308 ?auto_2708311 ) ) ( not ( = ?auto_2708308 ?auto_2708312 ) ) ( not ( = ?auto_2708308 ?auto_2708313 ) ) ( not ( = ?auto_2708309 ?auto_2708310 ) ) ( not ( = ?auto_2708309 ?auto_2708311 ) ) ( not ( = ?auto_2708309 ?auto_2708312 ) ) ( not ( = ?auto_2708309 ?auto_2708313 ) ) ( not ( = ?auto_2708310 ?auto_2708311 ) ) ( not ( = ?auto_2708310 ?auto_2708312 ) ) ( not ( = ?auto_2708310 ?auto_2708313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708311 ?auto_2708312 ?auto_2708313 )
      ( MAKE-13CRATE-VERIFY ?auto_2708301 ?auto_2708302 ?auto_2708303 ?auto_2708300 ?auto_2708304 ?auto_2708306 ?auto_2708305 ?auto_2708307 ?auto_2708308 ?auto_2708309 ?auto_2708310 ?auto_2708311 ?auto_2708312 ?auto_2708313 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708457 - SURFACE
      ?auto_2708458 - SURFACE
      ?auto_2708459 - SURFACE
      ?auto_2708456 - SURFACE
      ?auto_2708460 - SURFACE
      ?auto_2708462 - SURFACE
      ?auto_2708461 - SURFACE
      ?auto_2708463 - SURFACE
      ?auto_2708464 - SURFACE
      ?auto_2708465 - SURFACE
      ?auto_2708466 - SURFACE
      ?auto_2708467 - SURFACE
      ?auto_2708468 - SURFACE
      ?auto_2708469 - SURFACE
    )
    :vars
    (
      ?auto_2708472 - HOIST
      ?auto_2708470 - PLACE
      ?auto_2708473 - TRUCK
      ?auto_2708471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708472 ?auto_2708470 ) ( SURFACE-AT ?auto_2708468 ?auto_2708470 ) ( CLEAR ?auto_2708468 ) ( IS-CRATE ?auto_2708469 ) ( not ( = ?auto_2708468 ?auto_2708469 ) ) ( AVAILABLE ?auto_2708472 ) ( IN ?auto_2708469 ?auto_2708473 ) ( ON ?auto_2708468 ?auto_2708467 ) ( not ( = ?auto_2708467 ?auto_2708468 ) ) ( not ( = ?auto_2708467 ?auto_2708469 ) ) ( TRUCK-AT ?auto_2708473 ?auto_2708471 ) ( not ( = ?auto_2708471 ?auto_2708470 ) ) ( ON ?auto_2708458 ?auto_2708457 ) ( ON ?auto_2708459 ?auto_2708458 ) ( ON ?auto_2708456 ?auto_2708459 ) ( ON ?auto_2708460 ?auto_2708456 ) ( ON ?auto_2708462 ?auto_2708460 ) ( ON ?auto_2708461 ?auto_2708462 ) ( ON ?auto_2708463 ?auto_2708461 ) ( ON ?auto_2708464 ?auto_2708463 ) ( ON ?auto_2708465 ?auto_2708464 ) ( ON ?auto_2708466 ?auto_2708465 ) ( ON ?auto_2708467 ?auto_2708466 ) ( not ( = ?auto_2708457 ?auto_2708458 ) ) ( not ( = ?auto_2708457 ?auto_2708459 ) ) ( not ( = ?auto_2708457 ?auto_2708456 ) ) ( not ( = ?auto_2708457 ?auto_2708460 ) ) ( not ( = ?auto_2708457 ?auto_2708462 ) ) ( not ( = ?auto_2708457 ?auto_2708461 ) ) ( not ( = ?auto_2708457 ?auto_2708463 ) ) ( not ( = ?auto_2708457 ?auto_2708464 ) ) ( not ( = ?auto_2708457 ?auto_2708465 ) ) ( not ( = ?auto_2708457 ?auto_2708466 ) ) ( not ( = ?auto_2708457 ?auto_2708467 ) ) ( not ( = ?auto_2708457 ?auto_2708468 ) ) ( not ( = ?auto_2708457 ?auto_2708469 ) ) ( not ( = ?auto_2708458 ?auto_2708459 ) ) ( not ( = ?auto_2708458 ?auto_2708456 ) ) ( not ( = ?auto_2708458 ?auto_2708460 ) ) ( not ( = ?auto_2708458 ?auto_2708462 ) ) ( not ( = ?auto_2708458 ?auto_2708461 ) ) ( not ( = ?auto_2708458 ?auto_2708463 ) ) ( not ( = ?auto_2708458 ?auto_2708464 ) ) ( not ( = ?auto_2708458 ?auto_2708465 ) ) ( not ( = ?auto_2708458 ?auto_2708466 ) ) ( not ( = ?auto_2708458 ?auto_2708467 ) ) ( not ( = ?auto_2708458 ?auto_2708468 ) ) ( not ( = ?auto_2708458 ?auto_2708469 ) ) ( not ( = ?auto_2708459 ?auto_2708456 ) ) ( not ( = ?auto_2708459 ?auto_2708460 ) ) ( not ( = ?auto_2708459 ?auto_2708462 ) ) ( not ( = ?auto_2708459 ?auto_2708461 ) ) ( not ( = ?auto_2708459 ?auto_2708463 ) ) ( not ( = ?auto_2708459 ?auto_2708464 ) ) ( not ( = ?auto_2708459 ?auto_2708465 ) ) ( not ( = ?auto_2708459 ?auto_2708466 ) ) ( not ( = ?auto_2708459 ?auto_2708467 ) ) ( not ( = ?auto_2708459 ?auto_2708468 ) ) ( not ( = ?auto_2708459 ?auto_2708469 ) ) ( not ( = ?auto_2708456 ?auto_2708460 ) ) ( not ( = ?auto_2708456 ?auto_2708462 ) ) ( not ( = ?auto_2708456 ?auto_2708461 ) ) ( not ( = ?auto_2708456 ?auto_2708463 ) ) ( not ( = ?auto_2708456 ?auto_2708464 ) ) ( not ( = ?auto_2708456 ?auto_2708465 ) ) ( not ( = ?auto_2708456 ?auto_2708466 ) ) ( not ( = ?auto_2708456 ?auto_2708467 ) ) ( not ( = ?auto_2708456 ?auto_2708468 ) ) ( not ( = ?auto_2708456 ?auto_2708469 ) ) ( not ( = ?auto_2708460 ?auto_2708462 ) ) ( not ( = ?auto_2708460 ?auto_2708461 ) ) ( not ( = ?auto_2708460 ?auto_2708463 ) ) ( not ( = ?auto_2708460 ?auto_2708464 ) ) ( not ( = ?auto_2708460 ?auto_2708465 ) ) ( not ( = ?auto_2708460 ?auto_2708466 ) ) ( not ( = ?auto_2708460 ?auto_2708467 ) ) ( not ( = ?auto_2708460 ?auto_2708468 ) ) ( not ( = ?auto_2708460 ?auto_2708469 ) ) ( not ( = ?auto_2708462 ?auto_2708461 ) ) ( not ( = ?auto_2708462 ?auto_2708463 ) ) ( not ( = ?auto_2708462 ?auto_2708464 ) ) ( not ( = ?auto_2708462 ?auto_2708465 ) ) ( not ( = ?auto_2708462 ?auto_2708466 ) ) ( not ( = ?auto_2708462 ?auto_2708467 ) ) ( not ( = ?auto_2708462 ?auto_2708468 ) ) ( not ( = ?auto_2708462 ?auto_2708469 ) ) ( not ( = ?auto_2708461 ?auto_2708463 ) ) ( not ( = ?auto_2708461 ?auto_2708464 ) ) ( not ( = ?auto_2708461 ?auto_2708465 ) ) ( not ( = ?auto_2708461 ?auto_2708466 ) ) ( not ( = ?auto_2708461 ?auto_2708467 ) ) ( not ( = ?auto_2708461 ?auto_2708468 ) ) ( not ( = ?auto_2708461 ?auto_2708469 ) ) ( not ( = ?auto_2708463 ?auto_2708464 ) ) ( not ( = ?auto_2708463 ?auto_2708465 ) ) ( not ( = ?auto_2708463 ?auto_2708466 ) ) ( not ( = ?auto_2708463 ?auto_2708467 ) ) ( not ( = ?auto_2708463 ?auto_2708468 ) ) ( not ( = ?auto_2708463 ?auto_2708469 ) ) ( not ( = ?auto_2708464 ?auto_2708465 ) ) ( not ( = ?auto_2708464 ?auto_2708466 ) ) ( not ( = ?auto_2708464 ?auto_2708467 ) ) ( not ( = ?auto_2708464 ?auto_2708468 ) ) ( not ( = ?auto_2708464 ?auto_2708469 ) ) ( not ( = ?auto_2708465 ?auto_2708466 ) ) ( not ( = ?auto_2708465 ?auto_2708467 ) ) ( not ( = ?auto_2708465 ?auto_2708468 ) ) ( not ( = ?auto_2708465 ?auto_2708469 ) ) ( not ( = ?auto_2708466 ?auto_2708467 ) ) ( not ( = ?auto_2708466 ?auto_2708468 ) ) ( not ( = ?auto_2708466 ?auto_2708469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708467 ?auto_2708468 ?auto_2708469 )
      ( MAKE-13CRATE-VERIFY ?auto_2708457 ?auto_2708458 ?auto_2708459 ?auto_2708456 ?auto_2708460 ?auto_2708462 ?auto_2708461 ?auto_2708463 ?auto_2708464 ?auto_2708465 ?auto_2708466 ?auto_2708467 ?auto_2708468 ?auto_2708469 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708626 - SURFACE
      ?auto_2708627 - SURFACE
      ?auto_2708628 - SURFACE
      ?auto_2708625 - SURFACE
      ?auto_2708629 - SURFACE
      ?auto_2708631 - SURFACE
      ?auto_2708630 - SURFACE
      ?auto_2708632 - SURFACE
      ?auto_2708633 - SURFACE
      ?auto_2708634 - SURFACE
      ?auto_2708635 - SURFACE
      ?auto_2708636 - SURFACE
      ?auto_2708637 - SURFACE
      ?auto_2708638 - SURFACE
    )
    :vars
    (
      ?auto_2708640 - HOIST
      ?auto_2708642 - PLACE
      ?auto_2708641 - TRUCK
      ?auto_2708643 - PLACE
      ?auto_2708639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708640 ?auto_2708642 ) ( SURFACE-AT ?auto_2708637 ?auto_2708642 ) ( CLEAR ?auto_2708637 ) ( IS-CRATE ?auto_2708638 ) ( not ( = ?auto_2708637 ?auto_2708638 ) ) ( AVAILABLE ?auto_2708640 ) ( ON ?auto_2708637 ?auto_2708636 ) ( not ( = ?auto_2708636 ?auto_2708637 ) ) ( not ( = ?auto_2708636 ?auto_2708638 ) ) ( TRUCK-AT ?auto_2708641 ?auto_2708643 ) ( not ( = ?auto_2708643 ?auto_2708642 ) ) ( HOIST-AT ?auto_2708639 ?auto_2708643 ) ( LIFTING ?auto_2708639 ?auto_2708638 ) ( not ( = ?auto_2708640 ?auto_2708639 ) ) ( ON ?auto_2708627 ?auto_2708626 ) ( ON ?auto_2708628 ?auto_2708627 ) ( ON ?auto_2708625 ?auto_2708628 ) ( ON ?auto_2708629 ?auto_2708625 ) ( ON ?auto_2708631 ?auto_2708629 ) ( ON ?auto_2708630 ?auto_2708631 ) ( ON ?auto_2708632 ?auto_2708630 ) ( ON ?auto_2708633 ?auto_2708632 ) ( ON ?auto_2708634 ?auto_2708633 ) ( ON ?auto_2708635 ?auto_2708634 ) ( ON ?auto_2708636 ?auto_2708635 ) ( not ( = ?auto_2708626 ?auto_2708627 ) ) ( not ( = ?auto_2708626 ?auto_2708628 ) ) ( not ( = ?auto_2708626 ?auto_2708625 ) ) ( not ( = ?auto_2708626 ?auto_2708629 ) ) ( not ( = ?auto_2708626 ?auto_2708631 ) ) ( not ( = ?auto_2708626 ?auto_2708630 ) ) ( not ( = ?auto_2708626 ?auto_2708632 ) ) ( not ( = ?auto_2708626 ?auto_2708633 ) ) ( not ( = ?auto_2708626 ?auto_2708634 ) ) ( not ( = ?auto_2708626 ?auto_2708635 ) ) ( not ( = ?auto_2708626 ?auto_2708636 ) ) ( not ( = ?auto_2708626 ?auto_2708637 ) ) ( not ( = ?auto_2708626 ?auto_2708638 ) ) ( not ( = ?auto_2708627 ?auto_2708628 ) ) ( not ( = ?auto_2708627 ?auto_2708625 ) ) ( not ( = ?auto_2708627 ?auto_2708629 ) ) ( not ( = ?auto_2708627 ?auto_2708631 ) ) ( not ( = ?auto_2708627 ?auto_2708630 ) ) ( not ( = ?auto_2708627 ?auto_2708632 ) ) ( not ( = ?auto_2708627 ?auto_2708633 ) ) ( not ( = ?auto_2708627 ?auto_2708634 ) ) ( not ( = ?auto_2708627 ?auto_2708635 ) ) ( not ( = ?auto_2708627 ?auto_2708636 ) ) ( not ( = ?auto_2708627 ?auto_2708637 ) ) ( not ( = ?auto_2708627 ?auto_2708638 ) ) ( not ( = ?auto_2708628 ?auto_2708625 ) ) ( not ( = ?auto_2708628 ?auto_2708629 ) ) ( not ( = ?auto_2708628 ?auto_2708631 ) ) ( not ( = ?auto_2708628 ?auto_2708630 ) ) ( not ( = ?auto_2708628 ?auto_2708632 ) ) ( not ( = ?auto_2708628 ?auto_2708633 ) ) ( not ( = ?auto_2708628 ?auto_2708634 ) ) ( not ( = ?auto_2708628 ?auto_2708635 ) ) ( not ( = ?auto_2708628 ?auto_2708636 ) ) ( not ( = ?auto_2708628 ?auto_2708637 ) ) ( not ( = ?auto_2708628 ?auto_2708638 ) ) ( not ( = ?auto_2708625 ?auto_2708629 ) ) ( not ( = ?auto_2708625 ?auto_2708631 ) ) ( not ( = ?auto_2708625 ?auto_2708630 ) ) ( not ( = ?auto_2708625 ?auto_2708632 ) ) ( not ( = ?auto_2708625 ?auto_2708633 ) ) ( not ( = ?auto_2708625 ?auto_2708634 ) ) ( not ( = ?auto_2708625 ?auto_2708635 ) ) ( not ( = ?auto_2708625 ?auto_2708636 ) ) ( not ( = ?auto_2708625 ?auto_2708637 ) ) ( not ( = ?auto_2708625 ?auto_2708638 ) ) ( not ( = ?auto_2708629 ?auto_2708631 ) ) ( not ( = ?auto_2708629 ?auto_2708630 ) ) ( not ( = ?auto_2708629 ?auto_2708632 ) ) ( not ( = ?auto_2708629 ?auto_2708633 ) ) ( not ( = ?auto_2708629 ?auto_2708634 ) ) ( not ( = ?auto_2708629 ?auto_2708635 ) ) ( not ( = ?auto_2708629 ?auto_2708636 ) ) ( not ( = ?auto_2708629 ?auto_2708637 ) ) ( not ( = ?auto_2708629 ?auto_2708638 ) ) ( not ( = ?auto_2708631 ?auto_2708630 ) ) ( not ( = ?auto_2708631 ?auto_2708632 ) ) ( not ( = ?auto_2708631 ?auto_2708633 ) ) ( not ( = ?auto_2708631 ?auto_2708634 ) ) ( not ( = ?auto_2708631 ?auto_2708635 ) ) ( not ( = ?auto_2708631 ?auto_2708636 ) ) ( not ( = ?auto_2708631 ?auto_2708637 ) ) ( not ( = ?auto_2708631 ?auto_2708638 ) ) ( not ( = ?auto_2708630 ?auto_2708632 ) ) ( not ( = ?auto_2708630 ?auto_2708633 ) ) ( not ( = ?auto_2708630 ?auto_2708634 ) ) ( not ( = ?auto_2708630 ?auto_2708635 ) ) ( not ( = ?auto_2708630 ?auto_2708636 ) ) ( not ( = ?auto_2708630 ?auto_2708637 ) ) ( not ( = ?auto_2708630 ?auto_2708638 ) ) ( not ( = ?auto_2708632 ?auto_2708633 ) ) ( not ( = ?auto_2708632 ?auto_2708634 ) ) ( not ( = ?auto_2708632 ?auto_2708635 ) ) ( not ( = ?auto_2708632 ?auto_2708636 ) ) ( not ( = ?auto_2708632 ?auto_2708637 ) ) ( not ( = ?auto_2708632 ?auto_2708638 ) ) ( not ( = ?auto_2708633 ?auto_2708634 ) ) ( not ( = ?auto_2708633 ?auto_2708635 ) ) ( not ( = ?auto_2708633 ?auto_2708636 ) ) ( not ( = ?auto_2708633 ?auto_2708637 ) ) ( not ( = ?auto_2708633 ?auto_2708638 ) ) ( not ( = ?auto_2708634 ?auto_2708635 ) ) ( not ( = ?auto_2708634 ?auto_2708636 ) ) ( not ( = ?auto_2708634 ?auto_2708637 ) ) ( not ( = ?auto_2708634 ?auto_2708638 ) ) ( not ( = ?auto_2708635 ?auto_2708636 ) ) ( not ( = ?auto_2708635 ?auto_2708637 ) ) ( not ( = ?auto_2708635 ?auto_2708638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708636 ?auto_2708637 ?auto_2708638 )
      ( MAKE-13CRATE-VERIFY ?auto_2708626 ?auto_2708627 ?auto_2708628 ?auto_2708625 ?auto_2708629 ?auto_2708631 ?auto_2708630 ?auto_2708632 ?auto_2708633 ?auto_2708634 ?auto_2708635 ?auto_2708636 ?auto_2708637 ?auto_2708638 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708808 - SURFACE
      ?auto_2708809 - SURFACE
      ?auto_2708810 - SURFACE
      ?auto_2708807 - SURFACE
      ?auto_2708811 - SURFACE
      ?auto_2708813 - SURFACE
      ?auto_2708812 - SURFACE
      ?auto_2708814 - SURFACE
      ?auto_2708815 - SURFACE
      ?auto_2708816 - SURFACE
      ?auto_2708817 - SURFACE
      ?auto_2708818 - SURFACE
      ?auto_2708819 - SURFACE
      ?auto_2708820 - SURFACE
    )
    :vars
    (
      ?auto_2708824 - HOIST
      ?auto_2708823 - PLACE
      ?auto_2708822 - TRUCK
      ?auto_2708825 - PLACE
      ?auto_2708826 - HOIST
      ?auto_2708821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708824 ?auto_2708823 ) ( SURFACE-AT ?auto_2708819 ?auto_2708823 ) ( CLEAR ?auto_2708819 ) ( IS-CRATE ?auto_2708820 ) ( not ( = ?auto_2708819 ?auto_2708820 ) ) ( AVAILABLE ?auto_2708824 ) ( ON ?auto_2708819 ?auto_2708818 ) ( not ( = ?auto_2708818 ?auto_2708819 ) ) ( not ( = ?auto_2708818 ?auto_2708820 ) ) ( TRUCK-AT ?auto_2708822 ?auto_2708825 ) ( not ( = ?auto_2708825 ?auto_2708823 ) ) ( HOIST-AT ?auto_2708826 ?auto_2708825 ) ( not ( = ?auto_2708824 ?auto_2708826 ) ) ( AVAILABLE ?auto_2708826 ) ( SURFACE-AT ?auto_2708820 ?auto_2708825 ) ( ON ?auto_2708820 ?auto_2708821 ) ( CLEAR ?auto_2708820 ) ( not ( = ?auto_2708819 ?auto_2708821 ) ) ( not ( = ?auto_2708820 ?auto_2708821 ) ) ( not ( = ?auto_2708818 ?auto_2708821 ) ) ( ON ?auto_2708809 ?auto_2708808 ) ( ON ?auto_2708810 ?auto_2708809 ) ( ON ?auto_2708807 ?auto_2708810 ) ( ON ?auto_2708811 ?auto_2708807 ) ( ON ?auto_2708813 ?auto_2708811 ) ( ON ?auto_2708812 ?auto_2708813 ) ( ON ?auto_2708814 ?auto_2708812 ) ( ON ?auto_2708815 ?auto_2708814 ) ( ON ?auto_2708816 ?auto_2708815 ) ( ON ?auto_2708817 ?auto_2708816 ) ( ON ?auto_2708818 ?auto_2708817 ) ( not ( = ?auto_2708808 ?auto_2708809 ) ) ( not ( = ?auto_2708808 ?auto_2708810 ) ) ( not ( = ?auto_2708808 ?auto_2708807 ) ) ( not ( = ?auto_2708808 ?auto_2708811 ) ) ( not ( = ?auto_2708808 ?auto_2708813 ) ) ( not ( = ?auto_2708808 ?auto_2708812 ) ) ( not ( = ?auto_2708808 ?auto_2708814 ) ) ( not ( = ?auto_2708808 ?auto_2708815 ) ) ( not ( = ?auto_2708808 ?auto_2708816 ) ) ( not ( = ?auto_2708808 ?auto_2708817 ) ) ( not ( = ?auto_2708808 ?auto_2708818 ) ) ( not ( = ?auto_2708808 ?auto_2708819 ) ) ( not ( = ?auto_2708808 ?auto_2708820 ) ) ( not ( = ?auto_2708808 ?auto_2708821 ) ) ( not ( = ?auto_2708809 ?auto_2708810 ) ) ( not ( = ?auto_2708809 ?auto_2708807 ) ) ( not ( = ?auto_2708809 ?auto_2708811 ) ) ( not ( = ?auto_2708809 ?auto_2708813 ) ) ( not ( = ?auto_2708809 ?auto_2708812 ) ) ( not ( = ?auto_2708809 ?auto_2708814 ) ) ( not ( = ?auto_2708809 ?auto_2708815 ) ) ( not ( = ?auto_2708809 ?auto_2708816 ) ) ( not ( = ?auto_2708809 ?auto_2708817 ) ) ( not ( = ?auto_2708809 ?auto_2708818 ) ) ( not ( = ?auto_2708809 ?auto_2708819 ) ) ( not ( = ?auto_2708809 ?auto_2708820 ) ) ( not ( = ?auto_2708809 ?auto_2708821 ) ) ( not ( = ?auto_2708810 ?auto_2708807 ) ) ( not ( = ?auto_2708810 ?auto_2708811 ) ) ( not ( = ?auto_2708810 ?auto_2708813 ) ) ( not ( = ?auto_2708810 ?auto_2708812 ) ) ( not ( = ?auto_2708810 ?auto_2708814 ) ) ( not ( = ?auto_2708810 ?auto_2708815 ) ) ( not ( = ?auto_2708810 ?auto_2708816 ) ) ( not ( = ?auto_2708810 ?auto_2708817 ) ) ( not ( = ?auto_2708810 ?auto_2708818 ) ) ( not ( = ?auto_2708810 ?auto_2708819 ) ) ( not ( = ?auto_2708810 ?auto_2708820 ) ) ( not ( = ?auto_2708810 ?auto_2708821 ) ) ( not ( = ?auto_2708807 ?auto_2708811 ) ) ( not ( = ?auto_2708807 ?auto_2708813 ) ) ( not ( = ?auto_2708807 ?auto_2708812 ) ) ( not ( = ?auto_2708807 ?auto_2708814 ) ) ( not ( = ?auto_2708807 ?auto_2708815 ) ) ( not ( = ?auto_2708807 ?auto_2708816 ) ) ( not ( = ?auto_2708807 ?auto_2708817 ) ) ( not ( = ?auto_2708807 ?auto_2708818 ) ) ( not ( = ?auto_2708807 ?auto_2708819 ) ) ( not ( = ?auto_2708807 ?auto_2708820 ) ) ( not ( = ?auto_2708807 ?auto_2708821 ) ) ( not ( = ?auto_2708811 ?auto_2708813 ) ) ( not ( = ?auto_2708811 ?auto_2708812 ) ) ( not ( = ?auto_2708811 ?auto_2708814 ) ) ( not ( = ?auto_2708811 ?auto_2708815 ) ) ( not ( = ?auto_2708811 ?auto_2708816 ) ) ( not ( = ?auto_2708811 ?auto_2708817 ) ) ( not ( = ?auto_2708811 ?auto_2708818 ) ) ( not ( = ?auto_2708811 ?auto_2708819 ) ) ( not ( = ?auto_2708811 ?auto_2708820 ) ) ( not ( = ?auto_2708811 ?auto_2708821 ) ) ( not ( = ?auto_2708813 ?auto_2708812 ) ) ( not ( = ?auto_2708813 ?auto_2708814 ) ) ( not ( = ?auto_2708813 ?auto_2708815 ) ) ( not ( = ?auto_2708813 ?auto_2708816 ) ) ( not ( = ?auto_2708813 ?auto_2708817 ) ) ( not ( = ?auto_2708813 ?auto_2708818 ) ) ( not ( = ?auto_2708813 ?auto_2708819 ) ) ( not ( = ?auto_2708813 ?auto_2708820 ) ) ( not ( = ?auto_2708813 ?auto_2708821 ) ) ( not ( = ?auto_2708812 ?auto_2708814 ) ) ( not ( = ?auto_2708812 ?auto_2708815 ) ) ( not ( = ?auto_2708812 ?auto_2708816 ) ) ( not ( = ?auto_2708812 ?auto_2708817 ) ) ( not ( = ?auto_2708812 ?auto_2708818 ) ) ( not ( = ?auto_2708812 ?auto_2708819 ) ) ( not ( = ?auto_2708812 ?auto_2708820 ) ) ( not ( = ?auto_2708812 ?auto_2708821 ) ) ( not ( = ?auto_2708814 ?auto_2708815 ) ) ( not ( = ?auto_2708814 ?auto_2708816 ) ) ( not ( = ?auto_2708814 ?auto_2708817 ) ) ( not ( = ?auto_2708814 ?auto_2708818 ) ) ( not ( = ?auto_2708814 ?auto_2708819 ) ) ( not ( = ?auto_2708814 ?auto_2708820 ) ) ( not ( = ?auto_2708814 ?auto_2708821 ) ) ( not ( = ?auto_2708815 ?auto_2708816 ) ) ( not ( = ?auto_2708815 ?auto_2708817 ) ) ( not ( = ?auto_2708815 ?auto_2708818 ) ) ( not ( = ?auto_2708815 ?auto_2708819 ) ) ( not ( = ?auto_2708815 ?auto_2708820 ) ) ( not ( = ?auto_2708815 ?auto_2708821 ) ) ( not ( = ?auto_2708816 ?auto_2708817 ) ) ( not ( = ?auto_2708816 ?auto_2708818 ) ) ( not ( = ?auto_2708816 ?auto_2708819 ) ) ( not ( = ?auto_2708816 ?auto_2708820 ) ) ( not ( = ?auto_2708816 ?auto_2708821 ) ) ( not ( = ?auto_2708817 ?auto_2708818 ) ) ( not ( = ?auto_2708817 ?auto_2708819 ) ) ( not ( = ?auto_2708817 ?auto_2708820 ) ) ( not ( = ?auto_2708817 ?auto_2708821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708818 ?auto_2708819 ?auto_2708820 )
      ( MAKE-13CRATE-VERIFY ?auto_2708808 ?auto_2708809 ?auto_2708810 ?auto_2708807 ?auto_2708811 ?auto_2708813 ?auto_2708812 ?auto_2708814 ?auto_2708815 ?auto_2708816 ?auto_2708817 ?auto_2708818 ?auto_2708819 ?auto_2708820 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708991 - SURFACE
      ?auto_2708992 - SURFACE
      ?auto_2708993 - SURFACE
      ?auto_2708990 - SURFACE
      ?auto_2708994 - SURFACE
      ?auto_2708996 - SURFACE
      ?auto_2708995 - SURFACE
      ?auto_2708997 - SURFACE
      ?auto_2708998 - SURFACE
      ?auto_2708999 - SURFACE
      ?auto_2709000 - SURFACE
      ?auto_2709001 - SURFACE
      ?auto_2709002 - SURFACE
      ?auto_2709003 - SURFACE
    )
    :vars
    (
      ?auto_2709004 - HOIST
      ?auto_2709008 - PLACE
      ?auto_2709007 - PLACE
      ?auto_2709009 - HOIST
      ?auto_2709006 - SURFACE
      ?auto_2709005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709004 ?auto_2709008 ) ( SURFACE-AT ?auto_2709002 ?auto_2709008 ) ( CLEAR ?auto_2709002 ) ( IS-CRATE ?auto_2709003 ) ( not ( = ?auto_2709002 ?auto_2709003 ) ) ( AVAILABLE ?auto_2709004 ) ( ON ?auto_2709002 ?auto_2709001 ) ( not ( = ?auto_2709001 ?auto_2709002 ) ) ( not ( = ?auto_2709001 ?auto_2709003 ) ) ( not ( = ?auto_2709007 ?auto_2709008 ) ) ( HOIST-AT ?auto_2709009 ?auto_2709007 ) ( not ( = ?auto_2709004 ?auto_2709009 ) ) ( AVAILABLE ?auto_2709009 ) ( SURFACE-AT ?auto_2709003 ?auto_2709007 ) ( ON ?auto_2709003 ?auto_2709006 ) ( CLEAR ?auto_2709003 ) ( not ( = ?auto_2709002 ?auto_2709006 ) ) ( not ( = ?auto_2709003 ?auto_2709006 ) ) ( not ( = ?auto_2709001 ?auto_2709006 ) ) ( TRUCK-AT ?auto_2709005 ?auto_2709008 ) ( ON ?auto_2708992 ?auto_2708991 ) ( ON ?auto_2708993 ?auto_2708992 ) ( ON ?auto_2708990 ?auto_2708993 ) ( ON ?auto_2708994 ?auto_2708990 ) ( ON ?auto_2708996 ?auto_2708994 ) ( ON ?auto_2708995 ?auto_2708996 ) ( ON ?auto_2708997 ?auto_2708995 ) ( ON ?auto_2708998 ?auto_2708997 ) ( ON ?auto_2708999 ?auto_2708998 ) ( ON ?auto_2709000 ?auto_2708999 ) ( ON ?auto_2709001 ?auto_2709000 ) ( not ( = ?auto_2708991 ?auto_2708992 ) ) ( not ( = ?auto_2708991 ?auto_2708993 ) ) ( not ( = ?auto_2708991 ?auto_2708990 ) ) ( not ( = ?auto_2708991 ?auto_2708994 ) ) ( not ( = ?auto_2708991 ?auto_2708996 ) ) ( not ( = ?auto_2708991 ?auto_2708995 ) ) ( not ( = ?auto_2708991 ?auto_2708997 ) ) ( not ( = ?auto_2708991 ?auto_2708998 ) ) ( not ( = ?auto_2708991 ?auto_2708999 ) ) ( not ( = ?auto_2708991 ?auto_2709000 ) ) ( not ( = ?auto_2708991 ?auto_2709001 ) ) ( not ( = ?auto_2708991 ?auto_2709002 ) ) ( not ( = ?auto_2708991 ?auto_2709003 ) ) ( not ( = ?auto_2708991 ?auto_2709006 ) ) ( not ( = ?auto_2708992 ?auto_2708993 ) ) ( not ( = ?auto_2708992 ?auto_2708990 ) ) ( not ( = ?auto_2708992 ?auto_2708994 ) ) ( not ( = ?auto_2708992 ?auto_2708996 ) ) ( not ( = ?auto_2708992 ?auto_2708995 ) ) ( not ( = ?auto_2708992 ?auto_2708997 ) ) ( not ( = ?auto_2708992 ?auto_2708998 ) ) ( not ( = ?auto_2708992 ?auto_2708999 ) ) ( not ( = ?auto_2708992 ?auto_2709000 ) ) ( not ( = ?auto_2708992 ?auto_2709001 ) ) ( not ( = ?auto_2708992 ?auto_2709002 ) ) ( not ( = ?auto_2708992 ?auto_2709003 ) ) ( not ( = ?auto_2708992 ?auto_2709006 ) ) ( not ( = ?auto_2708993 ?auto_2708990 ) ) ( not ( = ?auto_2708993 ?auto_2708994 ) ) ( not ( = ?auto_2708993 ?auto_2708996 ) ) ( not ( = ?auto_2708993 ?auto_2708995 ) ) ( not ( = ?auto_2708993 ?auto_2708997 ) ) ( not ( = ?auto_2708993 ?auto_2708998 ) ) ( not ( = ?auto_2708993 ?auto_2708999 ) ) ( not ( = ?auto_2708993 ?auto_2709000 ) ) ( not ( = ?auto_2708993 ?auto_2709001 ) ) ( not ( = ?auto_2708993 ?auto_2709002 ) ) ( not ( = ?auto_2708993 ?auto_2709003 ) ) ( not ( = ?auto_2708993 ?auto_2709006 ) ) ( not ( = ?auto_2708990 ?auto_2708994 ) ) ( not ( = ?auto_2708990 ?auto_2708996 ) ) ( not ( = ?auto_2708990 ?auto_2708995 ) ) ( not ( = ?auto_2708990 ?auto_2708997 ) ) ( not ( = ?auto_2708990 ?auto_2708998 ) ) ( not ( = ?auto_2708990 ?auto_2708999 ) ) ( not ( = ?auto_2708990 ?auto_2709000 ) ) ( not ( = ?auto_2708990 ?auto_2709001 ) ) ( not ( = ?auto_2708990 ?auto_2709002 ) ) ( not ( = ?auto_2708990 ?auto_2709003 ) ) ( not ( = ?auto_2708990 ?auto_2709006 ) ) ( not ( = ?auto_2708994 ?auto_2708996 ) ) ( not ( = ?auto_2708994 ?auto_2708995 ) ) ( not ( = ?auto_2708994 ?auto_2708997 ) ) ( not ( = ?auto_2708994 ?auto_2708998 ) ) ( not ( = ?auto_2708994 ?auto_2708999 ) ) ( not ( = ?auto_2708994 ?auto_2709000 ) ) ( not ( = ?auto_2708994 ?auto_2709001 ) ) ( not ( = ?auto_2708994 ?auto_2709002 ) ) ( not ( = ?auto_2708994 ?auto_2709003 ) ) ( not ( = ?auto_2708994 ?auto_2709006 ) ) ( not ( = ?auto_2708996 ?auto_2708995 ) ) ( not ( = ?auto_2708996 ?auto_2708997 ) ) ( not ( = ?auto_2708996 ?auto_2708998 ) ) ( not ( = ?auto_2708996 ?auto_2708999 ) ) ( not ( = ?auto_2708996 ?auto_2709000 ) ) ( not ( = ?auto_2708996 ?auto_2709001 ) ) ( not ( = ?auto_2708996 ?auto_2709002 ) ) ( not ( = ?auto_2708996 ?auto_2709003 ) ) ( not ( = ?auto_2708996 ?auto_2709006 ) ) ( not ( = ?auto_2708995 ?auto_2708997 ) ) ( not ( = ?auto_2708995 ?auto_2708998 ) ) ( not ( = ?auto_2708995 ?auto_2708999 ) ) ( not ( = ?auto_2708995 ?auto_2709000 ) ) ( not ( = ?auto_2708995 ?auto_2709001 ) ) ( not ( = ?auto_2708995 ?auto_2709002 ) ) ( not ( = ?auto_2708995 ?auto_2709003 ) ) ( not ( = ?auto_2708995 ?auto_2709006 ) ) ( not ( = ?auto_2708997 ?auto_2708998 ) ) ( not ( = ?auto_2708997 ?auto_2708999 ) ) ( not ( = ?auto_2708997 ?auto_2709000 ) ) ( not ( = ?auto_2708997 ?auto_2709001 ) ) ( not ( = ?auto_2708997 ?auto_2709002 ) ) ( not ( = ?auto_2708997 ?auto_2709003 ) ) ( not ( = ?auto_2708997 ?auto_2709006 ) ) ( not ( = ?auto_2708998 ?auto_2708999 ) ) ( not ( = ?auto_2708998 ?auto_2709000 ) ) ( not ( = ?auto_2708998 ?auto_2709001 ) ) ( not ( = ?auto_2708998 ?auto_2709002 ) ) ( not ( = ?auto_2708998 ?auto_2709003 ) ) ( not ( = ?auto_2708998 ?auto_2709006 ) ) ( not ( = ?auto_2708999 ?auto_2709000 ) ) ( not ( = ?auto_2708999 ?auto_2709001 ) ) ( not ( = ?auto_2708999 ?auto_2709002 ) ) ( not ( = ?auto_2708999 ?auto_2709003 ) ) ( not ( = ?auto_2708999 ?auto_2709006 ) ) ( not ( = ?auto_2709000 ?auto_2709001 ) ) ( not ( = ?auto_2709000 ?auto_2709002 ) ) ( not ( = ?auto_2709000 ?auto_2709003 ) ) ( not ( = ?auto_2709000 ?auto_2709006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709001 ?auto_2709002 ?auto_2709003 )
      ( MAKE-13CRATE-VERIFY ?auto_2708991 ?auto_2708992 ?auto_2708993 ?auto_2708990 ?auto_2708994 ?auto_2708996 ?auto_2708995 ?auto_2708997 ?auto_2708998 ?auto_2708999 ?auto_2709000 ?auto_2709001 ?auto_2709002 ?auto_2709003 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709174 - SURFACE
      ?auto_2709175 - SURFACE
      ?auto_2709176 - SURFACE
      ?auto_2709173 - SURFACE
      ?auto_2709177 - SURFACE
      ?auto_2709179 - SURFACE
      ?auto_2709178 - SURFACE
      ?auto_2709180 - SURFACE
      ?auto_2709181 - SURFACE
      ?auto_2709182 - SURFACE
      ?auto_2709183 - SURFACE
      ?auto_2709184 - SURFACE
      ?auto_2709185 - SURFACE
      ?auto_2709186 - SURFACE
    )
    :vars
    (
      ?auto_2709192 - HOIST
      ?auto_2709191 - PLACE
      ?auto_2709187 - PLACE
      ?auto_2709190 - HOIST
      ?auto_2709188 - SURFACE
      ?auto_2709189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709192 ?auto_2709191 ) ( IS-CRATE ?auto_2709186 ) ( not ( = ?auto_2709185 ?auto_2709186 ) ) ( not ( = ?auto_2709184 ?auto_2709185 ) ) ( not ( = ?auto_2709184 ?auto_2709186 ) ) ( not ( = ?auto_2709187 ?auto_2709191 ) ) ( HOIST-AT ?auto_2709190 ?auto_2709187 ) ( not ( = ?auto_2709192 ?auto_2709190 ) ) ( AVAILABLE ?auto_2709190 ) ( SURFACE-AT ?auto_2709186 ?auto_2709187 ) ( ON ?auto_2709186 ?auto_2709188 ) ( CLEAR ?auto_2709186 ) ( not ( = ?auto_2709185 ?auto_2709188 ) ) ( not ( = ?auto_2709186 ?auto_2709188 ) ) ( not ( = ?auto_2709184 ?auto_2709188 ) ) ( TRUCK-AT ?auto_2709189 ?auto_2709191 ) ( SURFACE-AT ?auto_2709184 ?auto_2709191 ) ( CLEAR ?auto_2709184 ) ( LIFTING ?auto_2709192 ?auto_2709185 ) ( IS-CRATE ?auto_2709185 ) ( ON ?auto_2709175 ?auto_2709174 ) ( ON ?auto_2709176 ?auto_2709175 ) ( ON ?auto_2709173 ?auto_2709176 ) ( ON ?auto_2709177 ?auto_2709173 ) ( ON ?auto_2709179 ?auto_2709177 ) ( ON ?auto_2709178 ?auto_2709179 ) ( ON ?auto_2709180 ?auto_2709178 ) ( ON ?auto_2709181 ?auto_2709180 ) ( ON ?auto_2709182 ?auto_2709181 ) ( ON ?auto_2709183 ?auto_2709182 ) ( ON ?auto_2709184 ?auto_2709183 ) ( not ( = ?auto_2709174 ?auto_2709175 ) ) ( not ( = ?auto_2709174 ?auto_2709176 ) ) ( not ( = ?auto_2709174 ?auto_2709173 ) ) ( not ( = ?auto_2709174 ?auto_2709177 ) ) ( not ( = ?auto_2709174 ?auto_2709179 ) ) ( not ( = ?auto_2709174 ?auto_2709178 ) ) ( not ( = ?auto_2709174 ?auto_2709180 ) ) ( not ( = ?auto_2709174 ?auto_2709181 ) ) ( not ( = ?auto_2709174 ?auto_2709182 ) ) ( not ( = ?auto_2709174 ?auto_2709183 ) ) ( not ( = ?auto_2709174 ?auto_2709184 ) ) ( not ( = ?auto_2709174 ?auto_2709185 ) ) ( not ( = ?auto_2709174 ?auto_2709186 ) ) ( not ( = ?auto_2709174 ?auto_2709188 ) ) ( not ( = ?auto_2709175 ?auto_2709176 ) ) ( not ( = ?auto_2709175 ?auto_2709173 ) ) ( not ( = ?auto_2709175 ?auto_2709177 ) ) ( not ( = ?auto_2709175 ?auto_2709179 ) ) ( not ( = ?auto_2709175 ?auto_2709178 ) ) ( not ( = ?auto_2709175 ?auto_2709180 ) ) ( not ( = ?auto_2709175 ?auto_2709181 ) ) ( not ( = ?auto_2709175 ?auto_2709182 ) ) ( not ( = ?auto_2709175 ?auto_2709183 ) ) ( not ( = ?auto_2709175 ?auto_2709184 ) ) ( not ( = ?auto_2709175 ?auto_2709185 ) ) ( not ( = ?auto_2709175 ?auto_2709186 ) ) ( not ( = ?auto_2709175 ?auto_2709188 ) ) ( not ( = ?auto_2709176 ?auto_2709173 ) ) ( not ( = ?auto_2709176 ?auto_2709177 ) ) ( not ( = ?auto_2709176 ?auto_2709179 ) ) ( not ( = ?auto_2709176 ?auto_2709178 ) ) ( not ( = ?auto_2709176 ?auto_2709180 ) ) ( not ( = ?auto_2709176 ?auto_2709181 ) ) ( not ( = ?auto_2709176 ?auto_2709182 ) ) ( not ( = ?auto_2709176 ?auto_2709183 ) ) ( not ( = ?auto_2709176 ?auto_2709184 ) ) ( not ( = ?auto_2709176 ?auto_2709185 ) ) ( not ( = ?auto_2709176 ?auto_2709186 ) ) ( not ( = ?auto_2709176 ?auto_2709188 ) ) ( not ( = ?auto_2709173 ?auto_2709177 ) ) ( not ( = ?auto_2709173 ?auto_2709179 ) ) ( not ( = ?auto_2709173 ?auto_2709178 ) ) ( not ( = ?auto_2709173 ?auto_2709180 ) ) ( not ( = ?auto_2709173 ?auto_2709181 ) ) ( not ( = ?auto_2709173 ?auto_2709182 ) ) ( not ( = ?auto_2709173 ?auto_2709183 ) ) ( not ( = ?auto_2709173 ?auto_2709184 ) ) ( not ( = ?auto_2709173 ?auto_2709185 ) ) ( not ( = ?auto_2709173 ?auto_2709186 ) ) ( not ( = ?auto_2709173 ?auto_2709188 ) ) ( not ( = ?auto_2709177 ?auto_2709179 ) ) ( not ( = ?auto_2709177 ?auto_2709178 ) ) ( not ( = ?auto_2709177 ?auto_2709180 ) ) ( not ( = ?auto_2709177 ?auto_2709181 ) ) ( not ( = ?auto_2709177 ?auto_2709182 ) ) ( not ( = ?auto_2709177 ?auto_2709183 ) ) ( not ( = ?auto_2709177 ?auto_2709184 ) ) ( not ( = ?auto_2709177 ?auto_2709185 ) ) ( not ( = ?auto_2709177 ?auto_2709186 ) ) ( not ( = ?auto_2709177 ?auto_2709188 ) ) ( not ( = ?auto_2709179 ?auto_2709178 ) ) ( not ( = ?auto_2709179 ?auto_2709180 ) ) ( not ( = ?auto_2709179 ?auto_2709181 ) ) ( not ( = ?auto_2709179 ?auto_2709182 ) ) ( not ( = ?auto_2709179 ?auto_2709183 ) ) ( not ( = ?auto_2709179 ?auto_2709184 ) ) ( not ( = ?auto_2709179 ?auto_2709185 ) ) ( not ( = ?auto_2709179 ?auto_2709186 ) ) ( not ( = ?auto_2709179 ?auto_2709188 ) ) ( not ( = ?auto_2709178 ?auto_2709180 ) ) ( not ( = ?auto_2709178 ?auto_2709181 ) ) ( not ( = ?auto_2709178 ?auto_2709182 ) ) ( not ( = ?auto_2709178 ?auto_2709183 ) ) ( not ( = ?auto_2709178 ?auto_2709184 ) ) ( not ( = ?auto_2709178 ?auto_2709185 ) ) ( not ( = ?auto_2709178 ?auto_2709186 ) ) ( not ( = ?auto_2709178 ?auto_2709188 ) ) ( not ( = ?auto_2709180 ?auto_2709181 ) ) ( not ( = ?auto_2709180 ?auto_2709182 ) ) ( not ( = ?auto_2709180 ?auto_2709183 ) ) ( not ( = ?auto_2709180 ?auto_2709184 ) ) ( not ( = ?auto_2709180 ?auto_2709185 ) ) ( not ( = ?auto_2709180 ?auto_2709186 ) ) ( not ( = ?auto_2709180 ?auto_2709188 ) ) ( not ( = ?auto_2709181 ?auto_2709182 ) ) ( not ( = ?auto_2709181 ?auto_2709183 ) ) ( not ( = ?auto_2709181 ?auto_2709184 ) ) ( not ( = ?auto_2709181 ?auto_2709185 ) ) ( not ( = ?auto_2709181 ?auto_2709186 ) ) ( not ( = ?auto_2709181 ?auto_2709188 ) ) ( not ( = ?auto_2709182 ?auto_2709183 ) ) ( not ( = ?auto_2709182 ?auto_2709184 ) ) ( not ( = ?auto_2709182 ?auto_2709185 ) ) ( not ( = ?auto_2709182 ?auto_2709186 ) ) ( not ( = ?auto_2709182 ?auto_2709188 ) ) ( not ( = ?auto_2709183 ?auto_2709184 ) ) ( not ( = ?auto_2709183 ?auto_2709185 ) ) ( not ( = ?auto_2709183 ?auto_2709186 ) ) ( not ( = ?auto_2709183 ?auto_2709188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709184 ?auto_2709185 ?auto_2709186 )
      ( MAKE-13CRATE-VERIFY ?auto_2709174 ?auto_2709175 ?auto_2709176 ?auto_2709173 ?auto_2709177 ?auto_2709179 ?auto_2709178 ?auto_2709180 ?auto_2709181 ?auto_2709182 ?auto_2709183 ?auto_2709184 ?auto_2709185 ?auto_2709186 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709357 - SURFACE
      ?auto_2709358 - SURFACE
      ?auto_2709359 - SURFACE
      ?auto_2709356 - SURFACE
      ?auto_2709360 - SURFACE
      ?auto_2709362 - SURFACE
      ?auto_2709361 - SURFACE
      ?auto_2709363 - SURFACE
      ?auto_2709364 - SURFACE
      ?auto_2709365 - SURFACE
      ?auto_2709366 - SURFACE
      ?auto_2709367 - SURFACE
      ?auto_2709368 - SURFACE
      ?auto_2709369 - SURFACE
    )
    :vars
    (
      ?auto_2709372 - HOIST
      ?auto_2709370 - PLACE
      ?auto_2709375 - PLACE
      ?auto_2709371 - HOIST
      ?auto_2709374 - SURFACE
      ?auto_2709373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709372 ?auto_2709370 ) ( IS-CRATE ?auto_2709369 ) ( not ( = ?auto_2709368 ?auto_2709369 ) ) ( not ( = ?auto_2709367 ?auto_2709368 ) ) ( not ( = ?auto_2709367 ?auto_2709369 ) ) ( not ( = ?auto_2709375 ?auto_2709370 ) ) ( HOIST-AT ?auto_2709371 ?auto_2709375 ) ( not ( = ?auto_2709372 ?auto_2709371 ) ) ( AVAILABLE ?auto_2709371 ) ( SURFACE-AT ?auto_2709369 ?auto_2709375 ) ( ON ?auto_2709369 ?auto_2709374 ) ( CLEAR ?auto_2709369 ) ( not ( = ?auto_2709368 ?auto_2709374 ) ) ( not ( = ?auto_2709369 ?auto_2709374 ) ) ( not ( = ?auto_2709367 ?auto_2709374 ) ) ( TRUCK-AT ?auto_2709373 ?auto_2709370 ) ( SURFACE-AT ?auto_2709367 ?auto_2709370 ) ( CLEAR ?auto_2709367 ) ( IS-CRATE ?auto_2709368 ) ( AVAILABLE ?auto_2709372 ) ( IN ?auto_2709368 ?auto_2709373 ) ( ON ?auto_2709358 ?auto_2709357 ) ( ON ?auto_2709359 ?auto_2709358 ) ( ON ?auto_2709356 ?auto_2709359 ) ( ON ?auto_2709360 ?auto_2709356 ) ( ON ?auto_2709362 ?auto_2709360 ) ( ON ?auto_2709361 ?auto_2709362 ) ( ON ?auto_2709363 ?auto_2709361 ) ( ON ?auto_2709364 ?auto_2709363 ) ( ON ?auto_2709365 ?auto_2709364 ) ( ON ?auto_2709366 ?auto_2709365 ) ( ON ?auto_2709367 ?auto_2709366 ) ( not ( = ?auto_2709357 ?auto_2709358 ) ) ( not ( = ?auto_2709357 ?auto_2709359 ) ) ( not ( = ?auto_2709357 ?auto_2709356 ) ) ( not ( = ?auto_2709357 ?auto_2709360 ) ) ( not ( = ?auto_2709357 ?auto_2709362 ) ) ( not ( = ?auto_2709357 ?auto_2709361 ) ) ( not ( = ?auto_2709357 ?auto_2709363 ) ) ( not ( = ?auto_2709357 ?auto_2709364 ) ) ( not ( = ?auto_2709357 ?auto_2709365 ) ) ( not ( = ?auto_2709357 ?auto_2709366 ) ) ( not ( = ?auto_2709357 ?auto_2709367 ) ) ( not ( = ?auto_2709357 ?auto_2709368 ) ) ( not ( = ?auto_2709357 ?auto_2709369 ) ) ( not ( = ?auto_2709357 ?auto_2709374 ) ) ( not ( = ?auto_2709358 ?auto_2709359 ) ) ( not ( = ?auto_2709358 ?auto_2709356 ) ) ( not ( = ?auto_2709358 ?auto_2709360 ) ) ( not ( = ?auto_2709358 ?auto_2709362 ) ) ( not ( = ?auto_2709358 ?auto_2709361 ) ) ( not ( = ?auto_2709358 ?auto_2709363 ) ) ( not ( = ?auto_2709358 ?auto_2709364 ) ) ( not ( = ?auto_2709358 ?auto_2709365 ) ) ( not ( = ?auto_2709358 ?auto_2709366 ) ) ( not ( = ?auto_2709358 ?auto_2709367 ) ) ( not ( = ?auto_2709358 ?auto_2709368 ) ) ( not ( = ?auto_2709358 ?auto_2709369 ) ) ( not ( = ?auto_2709358 ?auto_2709374 ) ) ( not ( = ?auto_2709359 ?auto_2709356 ) ) ( not ( = ?auto_2709359 ?auto_2709360 ) ) ( not ( = ?auto_2709359 ?auto_2709362 ) ) ( not ( = ?auto_2709359 ?auto_2709361 ) ) ( not ( = ?auto_2709359 ?auto_2709363 ) ) ( not ( = ?auto_2709359 ?auto_2709364 ) ) ( not ( = ?auto_2709359 ?auto_2709365 ) ) ( not ( = ?auto_2709359 ?auto_2709366 ) ) ( not ( = ?auto_2709359 ?auto_2709367 ) ) ( not ( = ?auto_2709359 ?auto_2709368 ) ) ( not ( = ?auto_2709359 ?auto_2709369 ) ) ( not ( = ?auto_2709359 ?auto_2709374 ) ) ( not ( = ?auto_2709356 ?auto_2709360 ) ) ( not ( = ?auto_2709356 ?auto_2709362 ) ) ( not ( = ?auto_2709356 ?auto_2709361 ) ) ( not ( = ?auto_2709356 ?auto_2709363 ) ) ( not ( = ?auto_2709356 ?auto_2709364 ) ) ( not ( = ?auto_2709356 ?auto_2709365 ) ) ( not ( = ?auto_2709356 ?auto_2709366 ) ) ( not ( = ?auto_2709356 ?auto_2709367 ) ) ( not ( = ?auto_2709356 ?auto_2709368 ) ) ( not ( = ?auto_2709356 ?auto_2709369 ) ) ( not ( = ?auto_2709356 ?auto_2709374 ) ) ( not ( = ?auto_2709360 ?auto_2709362 ) ) ( not ( = ?auto_2709360 ?auto_2709361 ) ) ( not ( = ?auto_2709360 ?auto_2709363 ) ) ( not ( = ?auto_2709360 ?auto_2709364 ) ) ( not ( = ?auto_2709360 ?auto_2709365 ) ) ( not ( = ?auto_2709360 ?auto_2709366 ) ) ( not ( = ?auto_2709360 ?auto_2709367 ) ) ( not ( = ?auto_2709360 ?auto_2709368 ) ) ( not ( = ?auto_2709360 ?auto_2709369 ) ) ( not ( = ?auto_2709360 ?auto_2709374 ) ) ( not ( = ?auto_2709362 ?auto_2709361 ) ) ( not ( = ?auto_2709362 ?auto_2709363 ) ) ( not ( = ?auto_2709362 ?auto_2709364 ) ) ( not ( = ?auto_2709362 ?auto_2709365 ) ) ( not ( = ?auto_2709362 ?auto_2709366 ) ) ( not ( = ?auto_2709362 ?auto_2709367 ) ) ( not ( = ?auto_2709362 ?auto_2709368 ) ) ( not ( = ?auto_2709362 ?auto_2709369 ) ) ( not ( = ?auto_2709362 ?auto_2709374 ) ) ( not ( = ?auto_2709361 ?auto_2709363 ) ) ( not ( = ?auto_2709361 ?auto_2709364 ) ) ( not ( = ?auto_2709361 ?auto_2709365 ) ) ( not ( = ?auto_2709361 ?auto_2709366 ) ) ( not ( = ?auto_2709361 ?auto_2709367 ) ) ( not ( = ?auto_2709361 ?auto_2709368 ) ) ( not ( = ?auto_2709361 ?auto_2709369 ) ) ( not ( = ?auto_2709361 ?auto_2709374 ) ) ( not ( = ?auto_2709363 ?auto_2709364 ) ) ( not ( = ?auto_2709363 ?auto_2709365 ) ) ( not ( = ?auto_2709363 ?auto_2709366 ) ) ( not ( = ?auto_2709363 ?auto_2709367 ) ) ( not ( = ?auto_2709363 ?auto_2709368 ) ) ( not ( = ?auto_2709363 ?auto_2709369 ) ) ( not ( = ?auto_2709363 ?auto_2709374 ) ) ( not ( = ?auto_2709364 ?auto_2709365 ) ) ( not ( = ?auto_2709364 ?auto_2709366 ) ) ( not ( = ?auto_2709364 ?auto_2709367 ) ) ( not ( = ?auto_2709364 ?auto_2709368 ) ) ( not ( = ?auto_2709364 ?auto_2709369 ) ) ( not ( = ?auto_2709364 ?auto_2709374 ) ) ( not ( = ?auto_2709365 ?auto_2709366 ) ) ( not ( = ?auto_2709365 ?auto_2709367 ) ) ( not ( = ?auto_2709365 ?auto_2709368 ) ) ( not ( = ?auto_2709365 ?auto_2709369 ) ) ( not ( = ?auto_2709365 ?auto_2709374 ) ) ( not ( = ?auto_2709366 ?auto_2709367 ) ) ( not ( = ?auto_2709366 ?auto_2709368 ) ) ( not ( = ?auto_2709366 ?auto_2709369 ) ) ( not ( = ?auto_2709366 ?auto_2709374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709367 ?auto_2709368 ?auto_2709369 )
      ( MAKE-13CRATE-VERIFY ?auto_2709357 ?auto_2709358 ?auto_2709359 ?auto_2709356 ?auto_2709360 ?auto_2709362 ?auto_2709361 ?auto_2709363 ?auto_2709364 ?auto_2709365 ?auto_2709366 ?auto_2709367 ?auto_2709368 ?auto_2709369 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723598 - SURFACE
      ?auto_2723599 - SURFACE
      ?auto_2723600 - SURFACE
      ?auto_2723597 - SURFACE
      ?auto_2723601 - SURFACE
      ?auto_2723603 - SURFACE
      ?auto_2723602 - SURFACE
      ?auto_2723604 - SURFACE
      ?auto_2723605 - SURFACE
      ?auto_2723606 - SURFACE
      ?auto_2723607 - SURFACE
      ?auto_2723608 - SURFACE
      ?auto_2723609 - SURFACE
      ?auto_2723610 - SURFACE
      ?auto_2723611 - SURFACE
    )
    :vars
    (
      ?auto_2723612 - HOIST
      ?auto_2723613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723612 ?auto_2723613 ) ( SURFACE-AT ?auto_2723610 ?auto_2723613 ) ( CLEAR ?auto_2723610 ) ( LIFTING ?auto_2723612 ?auto_2723611 ) ( IS-CRATE ?auto_2723611 ) ( not ( = ?auto_2723610 ?auto_2723611 ) ) ( ON ?auto_2723599 ?auto_2723598 ) ( ON ?auto_2723600 ?auto_2723599 ) ( ON ?auto_2723597 ?auto_2723600 ) ( ON ?auto_2723601 ?auto_2723597 ) ( ON ?auto_2723603 ?auto_2723601 ) ( ON ?auto_2723602 ?auto_2723603 ) ( ON ?auto_2723604 ?auto_2723602 ) ( ON ?auto_2723605 ?auto_2723604 ) ( ON ?auto_2723606 ?auto_2723605 ) ( ON ?auto_2723607 ?auto_2723606 ) ( ON ?auto_2723608 ?auto_2723607 ) ( ON ?auto_2723609 ?auto_2723608 ) ( ON ?auto_2723610 ?auto_2723609 ) ( not ( = ?auto_2723598 ?auto_2723599 ) ) ( not ( = ?auto_2723598 ?auto_2723600 ) ) ( not ( = ?auto_2723598 ?auto_2723597 ) ) ( not ( = ?auto_2723598 ?auto_2723601 ) ) ( not ( = ?auto_2723598 ?auto_2723603 ) ) ( not ( = ?auto_2723598 ?auto_2723602 ) ) ( not ( = ?auto_2723598 ?auto_2723604 ) ) ( not ( = ?auto_2723598 ?auto_2723605 ) ) ( not ( = ?auto_2723598 ?auto_2723606 ) ) ( not ( = ?auto_2723598 ?auto_2723607 ) ) ( not ( = ?auto_2723598 ?auto_2723608 ) ) ( not ( = ?auto_2723598 ?auto_2723609 ) ) ( not ( = ?auto_2723598 ?auto_2723610 ) ) ( not ( = ?auto_2723598 ?auto_2723611 ) ) ( not ( = ?auto_2723599 ?auto_2723600 ) ) ( not ( = ?auto_2723599 ?auto_2723597 ) ) ( not ( = ?auto_2723599 ?auto_2723601 ) ) ( not ( = ?auto_2723599 ?auto_2723603 ) ) ( not ( = ?auto_2723599 ?auto_2723602 ) ) ( not ( = ?auto_2723599 ?auto_2723604 ) ) ( not ( = ?auto_2723599 ?auto_2723605 ) ) ( not ( = ?auto_2723599 ?auto_2723606 ) ) ( not ( = ?auto_2723599 ?auto_2723607 ) ) ( not ( = ?auto_2723599 ?auto_2723608 ) ) ( not ( = ?auto_2723599 ?auto_2723609 ) ) ( not ( = ?auto_2723599 ?auto_2723610 ) ) ( not ( = ?auto_2723599 ?auto_2723611 ) ) ( not ( = ?auto_2723600 ?auto_2723597 ) ) ( not ( = ?auto_2723600 ?auto_2723601 ) ) ( not ( = ?auto_2723600 ?auto_2723603 ) ) ( not ( = ?auto_2723600 ?auto_2723602 ) ) ( not ( = ?auto_2723600 ?auto_2723604 ) ) ( not ( = ?auto_2723600 ?auto_2723605 ) ) ( not ( = ?auto_2723600 ?auto_2723606 ) ) ( not ( = ?auto_2723600 ?auto_2723607 ) ) ( not ( = ?auto_2723600 ?auto_2723608 ) ) ( not ( = ?auto_2723600 ?auto_2723609 ) ) ( not ( = ?auto_2723600 ?auto_2723610 ) ) ( not ( = ?auto_2723600 ?auto_2723611 ) ) ( not ( = ?auto_2723597 ?auto_2723601 ) ) ( not ( = ?auto_2723597 ?auto_2723603 ) ) ( not ( = ?auto_2723597 ?auto_2723602 ) ) ( not ( = ?auto_2723597 ?auto_2723604 ) ) ( not ( = ?auto_2723597 ?auto_2723605 ) ) ( not ( = ?auto_2723597 ?auto_2723606 ) ) ( not ( = ?auto_2723597 ?auto_2723607 ) ) ( not ( = ?auto_2723597 ?auto_2723608 ) ) ( not ( = ?auto_2723597 ?auto_2723609 ) ) ( not ( = ?auto_2723597 ?auto_2723610 ) ) ( not ( = ?auto_2723597 ?auto_2723611 ) ) ( not ( = ?auto_2723601 ?auto_2723603 ) ) ( not ( = ?auto_2723601 ?auto_2723602 ) ) ( not ( = ?auto_2723601 ?auto_2723604 ) ) ( not ( = ?auto_2723601 ?auto_2723605 ) ) ( not ( = ?auto_2723601 ?auto_2723606 ) ) ( not ( = ?auto_2723601 ?auto_2723607 ) ) ( not ( = ?auto_2723601 ?auto_2723608 ) ) ( not ( = ?auto_2723601 ?auto_2723609 ) ) ( not ( = ?auto_2723601 ?auto_2723610 ) ) ( not ( = ?auto_2723601 ?auto_2723611 ) ) ( not ( = ?auto_2723603 ?auto_2723602 ) ) ( not ( = ?auto_2723603 ?auto_2723604 ) ) ( not ( = ?auto_2723603 ?auto_2723605 ) ) ( not ( = ?auto_2723603 ?auto_2723606 ) ) ( not ( = ?auto_2723603 ?auto_2723607 ) ) ( not ( = ?auto_2723603 ?auto_2723608 ) ) ( not ( = ?auto_2723603 ?auto_2723609 ) ) ( not ( = ?auto_2723603 ?auto_2723610 ) ) ( not ( = ?auto_2723603 ?auto_2723611 ) ) ( not ( = ?auto_2723602 ?auto_2723604 ) ) ( not ( = ?auto_2723602 ?auto_2723605 ) ) ( not ( = ?auto_2723602 ?auto_2723606 ) ) ( not ( = ?auto_2723602 ?auto_2723607 ) ) ( not ( = ?auto_2723602 ?auto_2723608 ) ) ( not ( = ?auto_2723602 ?auto_2723609 ) ) ( not ( = ?auto_2723602 ?auto_2723610 ) ) ( not ( = ?auto_2723602 ?auto_2723611 ) ) ( not ( = ?auto_2723604 ?auto_2723605 ) ) ( not ( = ?auto_2723604 ?auto_2723606 ) ) ( not ( = ?auto_2723604 ?auto_2723607 ) ) ( not ( = ?auto_2723604 ?auto_2723608 ) ) ( not ( = ?auto_2723604 ?auto_2723609 ) ) ( not ( = ?auto_2723604 ?auto_2723610 ) ) ( not ( = ?auto_2723604 ?auto_2723611 ) ) ( not ( = ?auto_2723605 ?auto_2723606 ) ) ( not ( = ?auto_2723605 ?auto_2723607 ) ) ( not ( = ?auto_2723605 ?auto_2723608 ) ) ( not ( = ?auto_2723605 ?auto_2723609 ) ) ( not ( = ?auto_2723605 ?auto_2723610 ) ) ( not ( = ?auto_2723605 ?auto_2723611 ) ) ( not ( = ?auto_2723606 ?auto_2723607 ) ) ( not ( = ?auto_2723606 ?auto_2723608 ) ) ( not ( = ?auto_2723606 ?auto_2723609 ) ) ( not ( = ?auto_2723606 ?auto_2723610 ) ) ( not ( = ?auto_2723606 ?auto_2723611 ) ) ( not ( = ?auto_2723607 ?auto_2723608 ) ) ( not ( = ?auto_2723607 ?auto_2723609 ) ) ( not ( = ?auto_2723607 ?auto_2723610 ) ) ( not ( = ?auto_2723607 ?auto_2723611 ) ) ( not ( = ?auto_2723608 ?auto_2723609 ) ) ( not ( = ?auto_2723608 ?auto_2723610 ) ) ( not ( = ?auto_2723608 ?auto_2723611 ) ) ( not ( = ?auto_2723609 ?auto_2723610 ) ) ( not ( = ?auto_2723609 ?auto_2723611 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2723610 ?auto_2723611 )
      ( MAKE-14CRATE-VERIFY ?auto_2723598 ?auto_2723599 ?auto_2723600 ?auto_2723597 ?auto_2723601 ?auto_2723603 ?auto_2723602 ?auto_2723604 ?auto_2723605 ?auto_2723606 ?auto_2723607 ?auto_2723608 ?auto_2723609 ?auto_2723610 ?auto_2723611 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723758 - SURFACE
      ?auto_2723759 - SURFACE
      ?auto_2723760 - SURFACE
      ?auto_2723757 - SURFACE
      ?auto_2723761 - SURFACE
      ?auto_2723763 - SURFACE
      ?auto_2723762 - SURFACE
      ?auto_2723764 - SURFACE
      ?auto_2723765 - SURFACE
      ?auto_2723766 - SURFACE
      ?auto_2723767 - SURFACE
      ?auto_2723768 - SURFACE
      ?auto_2723769 - SURFACE
      ?auto_2723770 - SURFACE
      ?auto_2723771 - SURFACE
    )
    :vars
    (
      ?auto_2723772 - HOIST
      ?auto_2723773 - PLACE
      ?auto_2723774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723772 ?auto_2723773 ) ( SURFACE-AT ?auto_2723770 ?auto_2723773 ) ( CLEAR ?auto_2723770 ) ( IS-CRATE ?auto_2723771 ) ( not ( = ?auto_2723770 ?auto_2723771 ) ) ( TRUCK-AT ?auto_2723774 ?auto_2723773 ) ( AVAILABLE ?auto_2723772 ) ( IN ?auto_2723771 ?auto_2723774 ) ( ON ?auto_2723770 ?auto_2723769 ) ( not ( = ?auto_2723769 ?auto_2723770 ) ) ( not ( = ?auto_2723769 ?auto_2723771 ) ) ( ON ?auto_2723759 ?auto_2723758 ) ( ON ?auto_2723760 ?auto_2723759 ) ( ON ?auto_2723757 ?auto_2723760 ) ( ON ?auto_2723761 ?auto_2723757 ) ( ON ?auto_2723763 ?auto_2723761 ) ( ON ?auto_2723762 ?auto_2723763 ) ( ON ?auto_2723764 ?auto_2723762 ) ( ON ?auto_2723765 ?auto_2723764 ) ( ON ?auto_2723766 ?auto_2723765 ) ( ON ?auto_2723767 ?auto_2723766 ) ( ON ?auto_2723768 ?auto_2723767 ) ( ON ?auto_2723769 ?auto_2723768 ) ( not ( = ?auto_2723758 ?auto_2723759 ) ) ( not ( = ?auto_2723758 ?auto_2723760 ) ) ( not ( = ?auto_2723758 ?auto_2723757 ) ) ( not ( = ?auto_2723758 ?auto_2723761 ) ) ( not ( = ?auto_2723758 ?auto_2723763 ) ) ( not ( = ?auto_2723758 ?auto_2723762 ) ) ( not ( = ?auto_2723758 ?auto_2723764 ) ) ( not ( = ?auto_2723758 ?auto_2723765 ) ) ( not ( = ?auto_2723758 ?auto_2723766 ) ) ( not ( = ?auto_2723758 ?auto_2723767 ) ) ( not ( = ?auto_2723758 ?auto_2723768 ) ) ( not ( = ?auto_2723758 ?auto_2723769 ) ) ( not ( = ?auto_2723758 ?auto_2723770 ) ) ( not ( = ?auto_2723758 ?auto_2723771 ) ) ( not ( = ?auto_2723759 ?auto_2723760 ) ) ( not ( = ?auto_2723759 ?auto_2723757 ) ) ( not ( = ?auto_2723759 ?auto_2723761 ) ) ( not ( = ?auto_2723759 ?auto_2723763 ) ) ( not ( = ?auto_2723759 ?auto_2723762 ) ) ( not ( = ?auto_2723759 ?auto_2723764 ) ) ( not ( = ?auto_2723759 ?auto_2723765 ) ) ( not ( = ?auto_2723759 ?auto_2723766 ) ) ( not ( = ?auto_2723759 ?auto_2723767 ) ) ( not ( = ?auto_2723759 ?auto_2723768 ) ) ( not ( = ?auto_2723759 ?auto_2723769 ) ) ( not ( = ?auto_2723759 ?auto_2723770 ) ) ( not ( = ?auto_2723759 ?auto_2723771 ) ) ( not ( = ?auto_2723760 ?auto_2723757 ) ) ( not ( = ?auto_2723760 ?auto_2723761 ) ) ( not ( = ?auto_2723760 ?auto_2723763 ) ) ( not ( = ?auto_2723760 ?auto_2723762 ) ) ( not ( = ?auto_2723760 ?auto_2723764 ) ) ( not ( = ?auto_2723760 ?auto_2723765 ) ) ( not ( = ?auto_2723760 ?auto_2723766 ) ) ( not ( = ?auto_2723760 ?auto_2723767 ) ) ( not ( = ?auto_2723760 ?auto_2723768 ) ) ( not ( = ?auto_2723760 ?auto_2723769 ) ) ( not ( = ?auto_2723760 ?auto_2723770 ) ) ( not ( = ?auto_2723760 ?auto_2723771 ) ) ( not ( = ?auto_2723757 ?auto_2723761 ) ) ( not ( = ?auto_2723757 ?auto_2723763 ) ) ( not ( = ?auto_2723757 ?auto_2723762 ) ) ( not ( = ?auto_2723757 ?auto_2723764 ) ) ( not ( = ?auto_2723757 ?auto_2723765 ) ) ( not ( = ?auto_2723757 ?auto_2723766 ) ) ( not ( = ?auto_2723757 ?auto_2723767 ) ) ( not ( = ?auto_2723757 ?auto_2723768 ) ) ( not ( = ?auto_2723757 ?auto_2723769 ) ) ( not ( = ?auto_2723757 ?auto_2723770 ) ) ( not ( = ?auto_2723757 ?auto_2723771 ) ) ( not ( = ?auto_2723761 ?auto_2723763 ) ) ( not ( = ?auto_2723761 ?auto_2723762 ) ) ( not ( = ?auto_2723761 ?auto_2723764 ) ) ( not ( = ?auto_2723761 ?auto_2723765 ) ) ( not ( = ?auto_2723761 ?auto_2723766 ) ) ( not ( = ?auto_2723761 ?auto_2723767 ) ) ( not ( = ?auto_2723761 ?auto_2723768 ) ) ( not ( = ?auto_2723761 ?auto_2723769 ) ) ( not ( = ?auto_2723761 ?auto_2723770 ) ) ( not ( = ?auto_2723761 ?auto_2723771 ) ) ( not ( = ?auto_2723763 ?auto_2723762 ) ) ( not ( = ?auto_2723763 ?auto_2723764 ) ) ( not ( = ?auto_2723763 ?auto_2723765 ) ) ( not ( = ?auto_2723763 ?auto_2723766 ) ) ( not ( = ?auto_2723763 ?auto_2723767 ) ) ( not ( = ?auto_2723763 ?auto_2723768 ) ) ( not ( = ?auto_2723763 ?auto_2723769 ) ) ( not ( = ?auto_2723763 ?auto_2723770 ) ) ( not ( = ?auto_2723763 ?auto_2723771 ) ) ( not ( = ?auto_2723762 ?auto_2723764 ) ) ( not ( = ?auto_2723762 ?auto_2723765 ) ) ( not ( = ?auto_2723762 ?auto_2723766 ) ) ( not ( = ?auto_2723762 ?auto_2723767 ) ) ( not ( = ?auto_2723762 ?auto_2723768 ) ) ( not ( = ?auto_2723762 ?auto_2723769 ) ) ( not ( = ?auto_2723762 ?auto_2723770 ) ) ( not ( = ?auto_2723762 ?auto_2723771 ) ) ( not ( = ?auto_2723764 ?auto_2723765 ) ) ( not ( = ?auto_2723764 ?auto_2723766 ) ) ( not ( = ?auto_2723764 ?auto_2723767 ) ) ( not ( = ?auto_2723764 ?auto_2723768 ) ) ( not ( = ?auto_2723764 ?auto_2723769 ) ) ( not ( = ?auto_2723764 ?auto_2723770 ) ) ( not ( = ?auto_2723764 ?auto_2723771 ) ) ( not ( = ?auto_2723765 ?auto_2723766 ) ) ( not ( = ?auto_2723765 ?auto_2723767 ) ) ( not ( = ?auto_2723765 ?auto_2723768 ) ) ( not ( = ?auto_2723765 ?auto_2723769 ) ) ( not ( = ?auto_2723765 ?auto_2723770 ) ) ( not ( = ?auto_2723765 ?auto_2723771 ) ) ( not ( = ?auto_2723766 ?auto_2723767 ) ) ( not ( = ?auto_2723766 ?auto_2723768 ) ) ( not ( = ?auto_2723766 ?auto_2723769 ) ) ( not ( = ?auto_2723766 ?auto_2723770 ) ) ( not ( = ?auto_2723766 ?auto_2723771 ) ) ( not ( = ?auto_2723767 ?auto_2723768 ) ) ( not ( = ?auto_2723767 ?auto_2723769 ) ) ( not ( = ?auto_2723767 ?auto_2723770 ) ) ( not ( = ?auto_2723767 ?auto_2723771 ) ) ( not ( = ?auto_2723768 ?auto_2723769 ) ) ( not ( = ?auto_2723768 ?auto_2723770 ) ) ( not ( = ?auto_2723768 ?auto_2723771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723769 ?auto_2723770 ?auto_2723771 )
      ( MAKE-14CRATE-VERIFY ?auto_2723758 ?auto_2723759 ?auto_2723760 ?auto_2723757 ?auto_2723761 ?auto_2723763 ?auto_2723762 ?auto_2723764 ?auto_2723765 ?auto_2723766 ?auto_2723767 ?auto_2723768 ?auto_2723769 ?auto_2723770 ?auto_2723771 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723933 - SURFACE
      ?auto_2723934 - SURFACE
      ?auto_2723935 - SURFACE
      ?auto_2723932 - SURFACE
      ?auto_2723936 - SURFACE
      ?auto_2723938 - SURFACE
      ?auto_2723937 - SURFACE
      ?auto_2723939 - SURFACE
      ?auto_2723940 - SURFACE
      ?auto_2723941 - SURFACE
      ?auto_2723942 - SURFACE
      ?auto_2723943 - SURFACE
      ?auto_2723944 - SURFACE
      ?auto_2723945 - SURFACE
      ?auto_2723946 - SURFACE
    )
    :vars
    (
      ?auto_2723949 - HOIST
      ?auto_2723950 - PLACE
      ?auto_2723948 - TRUCK
      ?auto_2723947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723949 ?auto_2723950 ) ( SURFACE-AT ?auto_2723945 ?auto_2723950 ) ( CLEAR ?auto_2723945 ) ( IS-CRATE ?auto_2723946 ) ( not ( = ?auto_2723945 ?auto_2723946 ) ) ( AVAILABLE ?auto_2723949 ) ( IN ?auto_2723946 ?auto_2723948 ) ( ON ?auto_2723945 ?auto_2723944 ) ( not ( = ?auto_2723944 ?auto_2723945 ) ) ( not ( = ?auto_2723944 ?auto_2723946 ) ) ( TRUCK-AT ?auto_2723948 ?auto_2723947 ) ( not ( = ?auto_2723947 ?auto_2723950 ) ) ( ON ?auto_2723934 ?auto_2723933 ) ( ON ?auto_2723935 ?auto_2723934 ) ( ON ?auto_2723932 ?auto_2723935 ) ( ON ?auto_2723936 ?auto_2723932 ) ( ON ?auto_2723938 ?auto_2723936 ) ( ON ?auto_2723937 ?auto_2723938 ) ( ON ?auto_2723939 ?auto_2723937 ) ( ON ?auto_2723940 ?auto_2723939 ) ( ON ?auto_2723941 ?auto_2723940 ) ( ON ?auto_2723942 ?auto_2723941 ) ( ON ?auto_2723943 ?auto_2723942 ) ( ON ?auto_2723944 ?auto_2723943 ) ( not ( = ?auto_2723933 ?auto_2723934 ) ) ( not ( = ?auto_2723933 ?auto_2723935 ) ) ( not ( = ?auto_2723933 ?auto_2723932 ) ) ( not ( = ?auto_2723933 ?auto_2723936 ) ) ( not ( = ?auto_2723933 ?auto_2723938 ) ) ( not ( = ?auto_2723933 ?auto_2723937 ) ) ( not ( = ?auto_2723933 ?auto_2723939 ) ) ( not ( = ?auto_2723933 ?auto_2723940 ) ) ( not ( = ?auto_2723933 ?auto_2723941 ) ) ( not ( = ?auto_2723933 ?auto_2723942 ) ) ( not ( = ?auto_2723933 ?auto_2723943 ) ) ( not ( = ?auto_2723933 ?auto_2723944 ) ) ( not ( = ?auto_2723933 ?auto_2723945 ) ) ( not ( = ?auto_2723933 ?auto_2723946 ) ) ( not ( = ?auto_2723934 ?auto_2723935 ) ) ( not ( = ?auto_2723934 ?auto_2723932 ) ) ( not ( = ?auto_2723934 ?auto_2723936 ) ) ( not ( = ?auto_2723934 ?auto_2723938 ) ) ( not ( = ?auto_2723934 ?auto_2723937 ) ) ( not ( = ?auto_2723934 ?auto_2723939 ) ) ( not ( = ?auto_2723934 ?auto_2723940 ) ) ( not ( = ?auto_2723934 ?auto_2723941 ) ) ( not ( = ?auto_2723934 ?auto_2723942 ) ) ( not ( = ?auto_2723934 ?auto_2723943 ) ) ( not ( = ?auto_2723934 ?auto_2723944 ) ) ( not ( = ?auto_2723934 ?auto_2723945 ) ) ( not ( = ?auto_2723934 ?auto_2723946 ) ) ( not ( = ?auto_2723935 ?auto_2723932 ) ) ( not ( = ?auto_2723935 ?auto_2723936 ) ) ( not ( = ?auto_2723935 ?auto_2723938 ) ) ( not ( = ?auto_2723935 ?auto_2723937 ) ) ( not ( = ?auto_2723935 ?auto_2723939 ) ) ( not ( = ?auto_2723935 ?auto_2723940 ) ) ( not ( = ?auto_2723935 ?auto_2723941 ) ) ( not ( = ?auto_2723935 ?auto_2723942 ) ) ( not ( = ?auto_2723935 ?auto_2723943 ) ) ( not ( = ?auto_2723935 ?auto_2723944 ) ) ( not ( = ?auto_2723935 ?auto_2723945 ) ) ( not ( = ?auto_2723935 ?auto_2723946 ) ) ( not ( = ?auto_2723932 ?auto_2723936 ) ) ( not ( = ?auto_2723932 ?auto_2723938 ) ) ( not ( = ?auto_2723932 ?auto_2723937 ) ) ( not ( = ?auto_2723932 ?auto_2723939 ) ) ( not ( = ?auto_2723932 ?auto_2723940 ) ) ( not ( = ?auto_2723932 ?auto_2723941 ) ) ( not ( = ?auto_2723932 ?auto_2723942 ) ) ( not ( = ?auto_2723932 ?auto_2723943 ) ) ( not ( = ?auto_2723932 ?auto_2723944 ) ) ( not ( = ?auto_2723932 ?auto_2723945 ) ) ( not ( = ?auto_2723932 ?auto_2723946 ) ) ( not ( = ?auto_2723936 ?auto_2723938 ) ) ( not ( = ?auto_2723936 ?auto_2723937 ) ) ( not ( = ?auto_2723936 ?auto_2723939 ) ) ( not ( = ?auto_2723936 ?auto_2723940 ) ) ( not ( = ?auto_2723936 ?auto_2723941 ) ) ( not ( = ?auto_2723936 ?auto_2723942 ) ) ( not ( = ?auto_2723936 ?auto_2723943 ) ) ( not ( = ?auto_2723936 ?auto_2723944 ) ) ( not ( = ?auto_2723936 ?auto_2723945 ) ) ( not ( = ?auto_2723936 ?auto_2723946 ) ) ( not ( = ?auto_2723938 ?auto_2723937 ) ) ( not ( = ?auto_2723938 ?auto_2723939 ) ) ( not ( = ?auto_2723938 ?auto_2723940 ) ) ( not ( = ?auto_2723938 ?auto_2723941 ) ) ( not ( = ?auto_2723938 ?auto_2723942 ) ) ( not ( = ?auto_2723938 ?auto_2723943 ) ) ( not ( = ?auto_2723938 ?auto_2723944 ) ) ( not ( = ?auto_2723938 ?auto_2723945 ) ) ( not ( = ?auto_2723938 ?auto_2723946 ) ) ( not ( = ?auto_2723937 ?auto_2723939 ) ) ( not ( = ?auto_2723937 ?auto_2723940 ) ) ( not ( = ?auto_2723937 ?auto_2723941 ) ) ( not ( = ?auto_2723937 ?auto_2723942 ) ) ( not ( = ?auto_2723937 ?auto_2723943 ) ) ( not ( = ?auto_2723937 ?auto_2723944 ) ) ( not ( = ?auto_2723937 ?auto_2723945 ) ) ( not ( = ?auto_2723937 ?auto_2723946 ) ) ( not ( = ?auto_2723939 ?auto_2723940 ) ) ( not ( = ?auto_2723939 ?auto_2723941 ) ) ( not ( = ?auto_2723939 ?auto_2723942 ) ) ( not ( = ?auto_2723939 ?auto_2723943 ) ) ( not ( = ?auto_2723939 ?auto_2723944 ) ) ( not ( = ?auto_2723939 ?auto_2723945 ) ) ( not ( = ?auto_2723939 ?auto_2723946 ) ) ( not ( = ?auto_2723940 ?auto_2723941 ) ) ( not ( = ?auto_2723940 ?auto_2723942 ) ) ( not ( = ?auto_2723940 ?auto_2723943 ) ) ( not ( = ?auto_2723940 ?auto_2723944 ) ) ( not ( = ?auto_2723940 ?auto_2723945 ) ) ( not ( = ?auto_2723940 ?auto_2723946 ) ) ( not ( = ?auto_2723941 ?auto_2723942 ) ) ( not ( = ?auto_2723941 ?auto_2723943 ) ) ( not ( = ?auto_2723941 ?auto_2723944 ) ) ( not ( = ?auto_2723941 ?auto_2723945 ) ) ( not ( = ?auto_2723941 ?auto_2723946 ) ) ( not ( = ?auto_2723942 ?auto_2723943 ) ) ( not ( = ?auto_2723942 ?auto_2723944 ) ) ( not ( = ?auto_2723942 ?auto_2723945 ) ) ( not ( = ?auto_2723942 ?auto_2723946 ) ) ( not ( = ?auto_2723943 ?auto_2723944 ) ) ( not ( = ?auto_2723943 ?auto_2723945 ) ) ( not ( = ?auto_2723943 ?auto_2723946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723944 ?auto_2723945 ?auto_2723946 )
      ( MAKE-14CRATE-VERIFY ?auto_2723933 ?auto_2723934 ?auto_2723935 ?auto_2723932 ?auto_2723936 ?auto_2723938 ?auto_2723937 ?auto_2723939 ?auto_2723940 ?auto_2723941 ?auto_2723942 ?auto_2723943 ?auto_2723944 ?auto_2723945 ?auto_2723946 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2724122 - SURFACE
      ?auto_2724123 - SURFACE
      ?auto_2724124 - SURFACE
      ?auto_2724121 - SURFACE
      ?auto_2724125 - SURFACE
      ?auto_2724127 - SURFACE
      ?auto_2724126 - SURFACE
      ?auto_2724128 - SURFACE
      ?auto_2724129 - SURFACE
      ?auto_2724130 - SURFACE
      ?auto_2724131 - SURFACE
      ?auto_2724132 - SURFACE
      ?auto_2724133 - SURFACE
      ?auto_2724134 - SURFACE
      ?auto_2724135 - SURFACE
    )
    :vars
    (
      ?auto_2724140 - HOIST
      ?auto_2724139 - PLACE
      ?auto_2724138 - TRUCK
      ?auto_2724137 - PLACE
      ?auto_2724136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724140 ?auto_2724139 ) ( SURFACE-AT ?auto_2724134 ?auto_2724139 ) ( CLEAR ?auto_2724134 ) ( IS-CRATE ?auto_2724135 ) ( not ( = ?auto_2724134 ?auto_2724135 ) ) ( AVAILABLE ?auto_2724140 ) ( ON ?auto_2724134 ?auto_2724133 ) ( not ( = ?auto_2724133 ?auto_2724134 ) ) ( not ( = ?auto_2724133 ?auto_2724135 ) ) ( TRUCK-AT ?auto_2724138 ?auto_2724137 ) ( not ( = ?auto_2724137 ?auto_2724139 ) ) ( HOIST-AT ?auto_2724136 ?auto_2724137 ) ( LIFTING ?auto_2724136 ?auto_2724135 ) ( not ( = ?auto_2724140 ?auto_2724136 ) ) ( ON ?auto_2724123 ?auto_2724122 ) ( ON ?auto_2724124 ?auto_2724123 ) ( ON ?auto_2724121 ?auto_2724124 ) ( ON ?auto_2724125 ?auto_2724121 ) ( ON ?auto_2724127 ?auto_2724125 ) ( ON ?auto_2724126 ?auto_2724127 ) ( ON ?auto_2724128 ?auto_2724126 ) ( ON ?auto_2724129 ?auto_2724128 ) ( ON ?auto_2724130 ?auto_2724129 ) ( ON ?auto_2724131 ?auto_2724130 ) ( ON ?auto_2724132 ?auto_2724131 ) ( ON ?auto_2724133 ?auto_2724132 ) ( not ( = ?auto_2724122 ?auto_2724123 ) ) ( not ( = ?auto_2724122 ?auto_2724124 ) ) ( not ( = ?auto_2724122 ?auto_2724121 ) ) ( not ( = ?auto_2724122 ?auto_2724125 ) ) ( not ( = ?auto_2724122 ?auto_2724127 ) ) ( not ( = ?auto_2724122 ?auto_2724126 ) ) ( not ( = ?auto_2724122 ?auto_2724128 ) ) ( not ( = ?auto_2724122 ?auto_2724129 ) ) ( not ( = ?auto_2724122 ?auto_2724130 ) ) ( not ( = ?auto_2724122 ?auto_2724131 ) ) ( not ( = ?auto_2724122 ?auto_2724132 ) ) ( not ( = ?auto_2724122 ?auto_2724133 ) ) ( not ( = ?auto_2724122 ?auto_2724134 ) ) ( not ( = ?auto_2724122 ?auto_2724135 ) ) ( not ( = ?auto_2724123 ?auto_2724124 ) ) ( not ( = ?auto_2724123 ?auto_2724121 ) ) ( not ( = ?auto_2724123 ?auto_2724125 ) ) ( not ( = ?auto_2724123 ?auto_2724127 ) ) ( not ( = ?auto_2724123 ?auto_2724126 ) ) ( not ( = ?auto_2724123 ?auto_2724128 ) ) ( not ( = ?auto_2724123 ?auto_2724129 ) ) ( not ( = ?auto_2724123 ?auto_2724130 ) ) ( not ( = ?auto_2724123 ?auto_2724131 ) ) ( not ( = ?auto_2724123 ?auto_2724132 ) ) ( not ( = ?auto_2724123 ?auto_2724133 ) ) ( not ( = ?auto_2724123 ?auto_2724134 ) ) ( not ( = ?auto_2724123 ?auto_2724135 ) ) ( not ( = ?auto_2724124 ?auto_2724121 ) ) ( not ( = ?auto_2724124 ?auto_2724125 ) ) ( not ( = ?auto_2724124 ?auto_2724127 ) ) ( not ( = ?auto_2724124 ?auto_2724126 ) ) ( not ( = ?auto_2724124 ?auto_2724128 ) ) ( not ( = ?auto_2724124 ?auto_2724129 ) ) ( not ( = ?auto_2724124 ?auto_2724130 ) ) ( not ( = ?auto_2724124 ?auto_2724131 ) ) ( not ( = ?auto_2724124 ?auto_2724132 ) ) ( not ( = ?auto_2724124 ?auto_2724133 ) ) ( not ( = ?auto_2724124 ?auto_2724134 ) ) ( not ( = ?auto_2724124 ?auto_2724135 ) ) ( not ( = ?auto_2724121 ?auto_2724125 ) ) ( not ( = ?auto_2724121 ?auto_2724127 ) ) ( not ( = ?auto_2724121 ?auto_2724126 ) ) ( not ( = ?auto_2724121 ?auto_2724128 ) ) ( not ( = ?auto_2724121 ?auto_2724129 ) ) ( not ( = ?auto_2724121 ?auto_2724130 ) ) ( not ( = ?auto_2724121 ?auto_2724131 ) ) ( not ( = ?auto_2724121 ?auto_2724132 ) ) ( not ( = ?auto_2724121 ?auto_2724133 ) ) ( not ( = ?auto_2724121 ?auto_2724134 ) ) ( not ( = ?auto_2724121 ?auto_2724135 ) ) ( not ( = ?auto_2724125 ?auto_2724127 ) ) ( not ( = ?auto_2724125 ?auto_2724126 ) ) ( not ( = ?auto_2724125 ?auto_2724128 ) ) ( not ( = ?auto_2724125 ?auto_2724129 ) ) ( not ( = ?auto_2724125 ?auto_2724130 ) ) ( not ( = ?auto_2724125 ?auto_2724131 ) ) ( not ( = ?auto_2724125 ?auto_2724132 ) ) ( not ( = ?auto_2724125 ?auto_2724133 ) ) ( not ( = ?auto_2724125 ?auto_2724134 ) ) ( not ( = ?auto_2724125 ?auto_2724135 ) ) ( not ( = ?auto_2724127 ?auto_2724126 ) ) ( not ( = ?auto_2724127 ?auto_2724128 ) ) ( not ( = ?auto_2724127 ?auto_2724129 ) ) ( not ( = ?auto_2724127 ?auto_2724130 ) ) ( not ( = ?auto_2724127 ?auto_2724131 ) ) ( not ( = ?auto_2724127 ?auto_2724132 ) ) ( not ( = ?auto_2724127 ?auto_2724133 ) ) ( not ( = ?auto_2724127 ?auto_2724134 ) ) ( not ( = ?auto_2724127 ?auto_2724135 ) ) ( not ( = ?auto_2724126 ?auto_2724128 ) ) ( not ( = ?auto_2724126 ?auto_2724129 ) ) ( not ( = ?auto_2724126 ?auto_2724130 ) ) ( not ( = ?auto_2724126 ?auto_2724131 ) ) ( not ( = ?auto_2724126 ?auto_2724132 ) ) ( not ( = ?auto_2724126 ?auto_2724133 ) ) ( not ( = ?auto_2724126 ?auto_2724134 ) ) ( not ( = ?auto_2724126 ?auto_2724135 ) ) ( not ( = ?auto_2724128 ?auto_2724129 ) ) ( not ( = ?auto_2724128 ?auto_2724130 ) ) ( not ( = ?auto_2724128 ?auto_2724131 ) ) ( not ( = ?auto_2724128 ?auto_2724132 ) ) ( not ( = ?auto_2724128 ?auto_2724133 ) ) ( not ( = ?auto_2724128 ?auto_2724134 ) ) ( not ( = ?auto_2724128 ?auto_2724135 ) ) ( not ( = ?auto_2724129 ?auto_2724130 ) ) ( not ( = ?auto_2724129 ?auto_2724131 ) ) ( not ( = ?auto_2724129 ?auto_2724132 ) ) ( not ( = ?auto_2724129 ?auto_2724133 ) ) ( not ( = ?auto_2724129 ?auto_2724134 ) ) ( not ( = ?auto_2724129 ?auto_2724135 ) ) ( not ( = ?auto_2724130 ?auto_2724131 ) ) ( not ( = ?auto_2724130 ?auto_2724132 ) ) ( not ( = ?auto_2724130 ?auto_2724133 ) ) ( not ( = ?auto_2724130 ?auto_2724134 ) ) ( not ( = ?auto_2724130 ?auto_2724135 ) ) ( not ( = ?auto_2724131 ?auto_2724132 ) ) ( not ( = ?auto_2724131 ?auto_2724133 ) ) ( not ( = ?auto_2724131 ?auto_2724134 ) ) ( not ( = ?auto_2724131 ?auto_2724135 ) ) ( not ( = ?auto_2724132 ?auto_2724133 ) ) ( not ( = ?auto_2724132 ?auto_2724134 ) ) ( not ( = ?auto_2724132 ?auto_2724135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2724133 ?auto_2724134 ?auto_2724135 )
      ( MAKE-14CRATE-VERIFY ?auto_2724122 ?auto_2724123 ?auto_2724124 ?auto_2724121 ?auto_2724125 ?auto_2724127 ?auto_2724126 ?auto_2724128 ?auto_2724129 ?auto_2724130 ?auto_2724131 ?auto_2724132 ?auto_2724133 ?auto_2724134 ?auto_2724135 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2724325 - SURFACE
      ?auto_2724326 - SURFACE
      ?auto_2724327 - SURFACE
      ?auto_2724324 - SURFACE
      ?auto_2724328 - SURFACE
      ?auto_2724330 - SURFACE
      ?auto_2724329 - SURFACE
      ?auto_2724331 - SURFACE
      ?auto_2724332 - SURFACE
      ?auto_2724333 - SURFACE
      ?auto_2724334 - SURFACE
      ?auto_2724335 - SURFACE
      ?auto_2724336 - SURFACE
      ?auto_2724337 - SURFACE
      ?auto_2724338 - SURFACE
    )
    :vars
    (
      ?auto_2724343 - HOIST
      ?auto_2724341 - PLACE
      ?auto_2724340 - TRUCK
      ?auto_2724344 - PLACE
      ?auto_2724339 - HOIST
      ?auto_2724342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724343 ?auto_2724341 ) ( SURFACE-AT ?auto_2724337 ?auto_2724341 ) ( CLEAR ?auto_2724337 ) ( IS-CRATE ?auto_2724338 ) ( not ( = ?auto_2724337 ?auto_2724338 ) ) ( AVAILABLE ?auto_2724343 ) ( ON ?auto_2724337 ?auto_2724336 ) ( not ( = ?auto_2724336 ?auto_2724337 ) ) ( not ( = ?auto_2724336 ?auto_2724338 ) ) ( TRUCK-AT ?auto_2724340 ?auto_2724344 ) ( not ( = ?auto_2724344 ?auto_2724341 ) ) ( HOIST-AT ?auto_2724339 ?auto_2724344 ) ( not ( = ?auto_2724343 ?auto_2724339 ) ) ( AVAILABLE ?auto_2724339 ) ( SURFACE-AT ?auto_2724338 ?auto_2724344 ) ( ON ?auto_2724338 ?auto_2724342 ) ( CLEAR ?auto_2724338 ) ( not ( = ?auto_2724337 ?auto_2724342 ) ) ( not ( = ?auto_2724338 ?auto_2724342 ) ) ( not ( = ?auto_2724336 ?auto_2724342 ) ) ( ON ?auto_2724326 ?auto_2724325 ) ( ON ?auto_2724327 ?auto_2724326 ) ( ON ?auto_2724324 ?auto_2724327 ) ( ON ?auto_2724328 ?auto_2724324 ) ( ON ?auto_2724330 ?auto_2724328 ) ( ON ?auto_2724329 ?auto_2724330 ) ( ON ?auto_2724331 ?auto_2724329 ) ( ON ?auto_2724332 ?auto_2724331 ) ( ON ?auto_2724333 ?auto_2724332 ) ( ON ?auto_2724334 ?auto_2724333 ) ( ON ?auto_2724335 ?auto_2724334 ) ( ON ?auto_2724336 ?auto_2724335 ) ( not ( = ?auto_2724325 ?auto_2724326 ) ) ( not ( = ?auto_2724325 ?auto_2724327 ) ) ( not ( = ?auto_2724325 ?auto_2724324 ) ) ( not ( = ?auto_2724325 ?auto_2724328 ) ) ( not ( = ?auto_2724325 ?auto_2724330 ) ) ( not ( = ?auto_2724325 ?auto_2724329 ) ) ( not ( = ?auto_2724325 ?auto_2724331 ) ) ( not ( = ?auto_2724325 ?auto_2724332 ) ) ( not ( = ?auto_2724325 ?auto_2724333 ) ) ( not ( = ?auto_2724325 ?auto_2724334 ) ) ( not ( = ?auto_2724325 ?auto_2724335 ) ) ( not ( = ?auto_2724325 ?auto_2724336 ) ) ( not ( = ?auto_2724325 ?auto_2724337 ) ) ( not ( = ?auto_2724325 ?auto_2724338 ) ) ( not ( = ?auto_2724325 ?auto_2724342 ) ) ( not ( = ?auto_2724326 ?auto_2724327 ) ) ( not ( = ?auto_2724326 ?auto_2724324 ) ) ( not ( = ?auto_2724326 ?auto_2724328 ) ) ( not ( = ?auto_2724326 ?auto_2724330 ) ) ( not ( = ?auto_2724326 ?auto_2724329 ) ) ( not ( = ?auto_2724326 ?auto_2724331 ) ) ( not ( = ?auto_2724326 ?auto_2724332 ) ) ( not ( = ?auto_2724326 ?auto_2724333 ) ) ( not ( = ?auto_2724326 ?auto_2724334 ) ) ( not ( = ?auto_2724326 ?auto_2724335 ) ) ( not ( = ?auto_2724326 ?auto_2724336 ) ) ( not ( = ?auto_2724326 ?auto_2724337 ) ) ( not ( = ?auto_2724326 ?auto_2724338 ) ) ( not ( = ?auto_2724326 ?auto_2724342 ) ) ( not ( = ?auto_2724327 ?auto_2724324 ) ) ( not ( = ?auto_2724327 ?auto_2724328 ) ) ( not ( = ?auto_2724327 ?auto_2724330 ) ) ( not ( = ?auto_2724327 ?auto_2724329 ) ) ( not ( = ?auto_2724327 ?auto_2724331 ) ) ( not ( = ?auto_2724327 ?auto_2724332 ) ) ( not ( = ?auto_2724327 ?auto_2724333 ) ) ( not ( = ?auto_2724327 ?auto_2724334 ) ) ( not ( = ?auto_2724327 ?auto_2724335 ) ) ( not ( = ?auto_2724327 ?auto_2724336 ) ) ( not ( = ?auto_2724327 ?auto_2724337 ) ) ( not ( = ?auto_2724327 ?auto_2724338 ) ) ( not ( = ?auto_2724327 ?auto_2724342 ) ) ( not ( = ?auto_2724324 ?auto_2724328 ) ) ( not ( = ?auto_2724324 ?auto_2724330 ) ) ( not ( = ?auto_2724324 ?auto_2724329 ) ) ( not ( = ?auto_2724324 ?auto_2724331 ) ) ( not ( = ?auto_2724324 ?auto_2724332 ) ) ( not ( = ?auto_2724324 ?auto_2724333 ) ) ( not ( = ?auto_2724324 ?auto_2724334 ) ) ( not ( = ?auto_2724324 ?auto_2724335 ) ) ( not ( = ?auto_2724324 ?auto_2724336 ) ) ( not ( = ?auto_2724324 ?auto_2724337 ) ) ( not ( = ?auto_2724324 ?auto_2724338 ) ) ( not ( = ?auto_2724324 ?auto_2724342 ) ) ( not ( = ?auto_2724328 ?auto_2724330 ) ) ( not ( = ?auto_2724328 ?auto_2724329 ) ) ( not ( = ?auto_2724328 ?auto_2724331 ) ) ( not ( = ?auto_2724328 ?auto_2724332 ) ) ( not ( = ?auto_2724328 ?auto_2724333 ) ) ( not ( = ?auto_2724328 ?auto_2724334 ) ) ( not ( = ?auto_2724328 ?auto_2724335 ) ) ( not ( = ?auto_2724328 ?auto_2724336 ) ) ( not ( = ?auto_2724328 ?auto_2724337 ) ) ( not ( = ?auto_2724328 ?auto_2724338 ) ) ( not ( = ?auto_2724328 ?auto_2724342 ) ) ( not ( = ?auto_2724330 ?auto_2724329 ) ) ( not ( = ?auto_2724330 ?auto_2724331 ) ) ( not ( = ?auto_2724330 ?auto_2724332 ) ) ( not ( = ?auto_2724330 ?auto_2724333 ) ) ( not ( = ?auto_2724330 ?auto_2724334 ) ) ( not ( = ?auto_2724330 ?auto_2724335 ) ) ( not ( = ?auto_2724330 ?auto_2724336 ) ) ( not ( = ?auto_2724330 ?auto_2724337 ) ) ( not ( = ?auto_2724330 ?auto_2724338 ) ) ( not ( = ?auto_2724330 ?auto_2724342 ) ) ( not ( = ?auto_2724329 ?auto_2724331 ) ) ( not ( = ?auto_2724329 ?auto_2724332 ) ) ( not ( = ?auto_2724329 ?auto_2724333 ) ) ( not ( = ?auto_2724329 ?auto_2724334 ) ) ( not ( = ?auto_2724329 ?auto_2724335 ) ) ( not ( = ?auto_2724329 ?auto_2724336 ) ) ( not ( = ?auto_2724329 ?auto_2724337 ) ) ( not ( = ?auto_2724329 ?auto_2724338 ) ) ( not ( = ?auto_2724329 ?auto_2724342 ) ) ( not ( = ?auto_2724331 ?auto_2724332 ) ) ( not ( = ?auto_2724331 ?auto_2724333 ) ) ( not ( = ?auto_2724331 ?auto_2724334 ) ) ( not ( = ?auto_2724331 ?auto_2724335 ) ) ( not ( = ?auto_2724331 ?auto_2724336 ) ) ( not ( = ?auto_2724331 ?auto_2724337 ) ) ( not ( = ?auto_2724331 ?auto_2724338 ) ) ( not ( = ?auto_2724331 ?auto_2724342 ) ) ( not ( = ?auto_2724332 ?auto_2724333 ) ) ( not ( = ?auto_2724332 ?auto_2724334 ) ) ( not ( = ?auto_2724332 ?auto_2724335 ) ) ( not ( = ?auto_2724332 ?auto_2724336 ) ) ( not ( = ?auto_2724332 ?auto_2724337 ) ) ( not ( = ?auto_2724332 ?auto_2724338 ) ) ( not ( = ?auto_2724332 ?auto_2724342 ) ) ( not ( = ?auto_2724333 ?auto_2724334 ) ) ( not ( = ?auto_2724333 ?auto_2724335 ) ) ( not ( = ?auto_2724333 ?auto_2724336 ) ) ( not ( = ?auto_2724333 ?auto_2724337 ) ) ( not ( = ?auto_2724333 ?auto_2724338 ) ) ( not ( = ?auto_2724333 ?auto_2724342 ) ) ( not ( = ?auto_2724334 ?auto_2724335 ) ) ( not ( = ?auto_2724334 ?auto_2724336 ) ) ( not ( = ?auto_2724334 ?auto_2724337 ) ) ( not ( = ?auto_2724334 ?auto_2724338 ) ) ( not ( = ?auto_2724334 ?auto_2724342 ) ) ( not ( = ?auto_2724335 ?auto_2724336 ) ) ( not ( = ?auto_2724335 ?auto_2724337 ) ) ( not ( = ?auto_2724335 ?auto_2724338 ) ) ( not ( = ?auto_2724335 ?auto_2724342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2724336 ?auto_2724337 ?auto_2724338 )
      ( MAKE-14CRATE-VERIFY ?auto_2724325 ?auto_2724326 ?auto_2724327 ?auto_2724324 ?auto_2724328 ?auto_2724330 ?auto_2724329 ?auto_2724331 ?auto_2724332 ?auto_2724333 ?auto_2724334 ?auto_2724335 ?auto_2724336 ?auto_2724337 ?auto_2724338 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2724529 - SURFACE
      ?auto_2724530 - SURFACE
      ?auto_2724531 - SURFACE
      ?auto_2724528 - SURFACE
      ?auto_2724532 - SURFACE
      ?auto_2724534 - SURFACE
      ?auto_2724533 - SURFACE
      ?auto_2724535 - SURFACE
      ?auto_2724536 - SURFACE
      ?auto_2724537 - SURFACE
      ?auto_2724538 - SURFACE
      ?auto_2724539 - SURFACE
      ?auto_2724540 - SURFACE
      ?auto_2724541 - SURFACE
      ?auto_2724542 - SURFACE
    )
    :vars
    (
      ?auto_2724543 - HOIST
      ?auto_2724548 - PLACE
      ?auto_2724546 - PLACE
      ?auto_2724547 - HOIST
      ?auto_2724545 - SURFACE
      ?auto_2724544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724543 ?auto_2724548 ) ( SURFACE-AT ?auto_2724541 ?auto_2724548 ) ( CLEAR ?auto_2724541 ) ( IS-CRATE ?auto_2724542 ) ( not ( = ?auto_2724541 ?auto_2724542 ) ) ( AVAILABLE ?auto_2724543 ) ( ON ?auto_2724541 ?auto_2724540 ) ( not ( = ?auto_2724540 ?auto_2724541 ) ) ( not ( = ?auto_2724540 ?auto_2724542 ) ) ( not ( = ?auto_2724546 ?auto_2724548 ) ) ( HOIST-AT ?auto_2724547 ?auto_2724546 ) ( not ( = ?auto_2724543 ?auto_2724547 ) ) ( AVAILABLE ?auto_2724547 ) ( SURFACE-AT ?auto_2724542 ?auto_2724546 ) ( ON ?auto_2724542 ?auto_2724545 ) ( CLEAR ?auto_2724542 ) ( not ( = ?auto_2724541 ?auto_2724545 ) ) ( not ( = ?auto_2724542 ?auto_2724545 ) ) ( not ( = ?auto_2724540 ?auto_2724545 ) ) ( TRUCK-AT ?auto_2724544 ?auto_2724548 ) ( ON ?auto_2724530 ?auto_2724529 ) ( ON ?auto_2724531 ?auto_2724530 ) ( ON ?auto_2724528 ?auto_2724531 ) ( ON ?auto_2724532 ?auto_2724528 ) ( ON ?auto_2724534 ?auto_2724532 ) ( ON ?auto_2724533 ?auto_2724534 ) ( ON ?auto_2724535 ?auto_2724533 ) ( ON ?auto_2724536 ?auto_2724535 ) ( ON ?auto_2724537 ?auto_2724536 ) ( ON ?auto_2724538 ?auto_2724537 ) ( ON ?auto_2724539 ?auto_2724538 ) ( ON ?auto_2724540 ?auto_2724539 ) ( not ( = ?auto_2724529 ?auto_2724530 ) ) ( not ( = ?auto_2724529 ?auto_2724531 ) ) ( not ( = ?auto_2724529 ?auto_2724528 ) ) ( not ( = ?auto_2724529 ?auto_2724532 ) ) ( not ( = ?auto_2724529 ?auto_2724534 ) ) ( not ( = ?auto_2724529 ?auto_2724533 ) ) ( not ( = ?auto_2724529 ?auto_2724535 ) ) ( not ( = ?auto_2724529 ?auto_2724536 ) ) ( not ( = ?auto_2724529 ?auto_2724537 ) ) ( not ( = ?auto_2724529 ?auto_2724538 ) ) ( not ( = ?auto_2724529 ?auto_2724539 ) ) ( not ( = ?auto_2724529 ?auto_2724540 ) ) ( not ( = ?auto_2724529 ?auto_2724541 ) ) ( not ( = ?auto_2724529 ?auto_2724542 ) ) ( not ( = ?auto_2724529 ?auto_2724545 ) ) ( not ( = ?auto_2724530 ?auto_2724531 ) ) ( not ( = ?auto_2724530 ?auto_2724528 ) ) ( not ( = ?auto_2724530 ?auto_2724532 ) ) ( not ( = ?auto_2724530 ?auto_2724534 ) ) ( not ( = ?auto_2724530 ?auto_2724533 ) ) ( not ( = ?auto_2724530 ?auto_2724535 ) ) ( not ( = ?auto_2724530 ?auto_2724536 ) ) ( not ( = ?auto_2724530 ?auto_2724537 ) ) ( not ( = ?auto_2724530 ?auto_2724538 ) ) ( not ( = ?auto_2724530 ?auto_2724539 ) ) ( not ( = ?auto_2724530 ?auto_2724540 ) ) ( not ( = ?auto_2724530 ?auto_2724541 ) ) ( not ( = ?auto_2724530 ?auto_2724542 ) ) ( not ( = ?auto_2724530 ?auto_2724545 ) ) ( not ( = ?auto_2724531 ?auto_2724528 ) ) ( not ( = ?auto_2724531 ?auto_2724532 ) ) ( not ( = ?auto_2724531 ?auto_2724534 ) ) ( not ( = ?auto_2724531 ?auto_2724533 ) ) ( not ( = ?auto_2724531 ?auto_2724535 ) ) ( not ( = ?auto_2724531 ?auto_2724536 ) ) ( not ( = ?auto_2724531 ?auto_2724537 ) ) ( not ( = ?auto_2724531 ?auto_2724538 ) ) ( not ( = ?auto_2724531 ?auto_2724539 ) ) ( not ( = ?auto_2724531 ?auto_2724540 ) ) ( not ( = ?auto_2724531 ?auto_2724541 ) ) ( not ( = ?auto_2724531 ?auto_2724542 ) ) ( not ( = ?auto_2724531 ?auto_2724545 ) ) ( not ( = ?auto_2724528 ?auto_2724532 ) ) ( not ( = ?auto_2724528 ?auto_2724534 ) ) ( not ( = ?auto_2724528 ?auto_2724533 ) ) ( not ( = ?auto_2724528 ?auto_2724535 ) ) ( not ( = ?auto_2724528 ?auto_2724536 ) ) ( not ( = ?auto_2724528 ?auto_2724537 ) ) ( not ( = ?auto_2724528 ?auto_2724538 ) ) ( not ( = ?auto_2724528 ?auto_2724539 ) ) ( not ( = ?auto_2724528 ?auto_2724540 ) ) ( not ( = ?auto_2724528 ?auto_2724541 ) ) ( not ( = ?auto_2724528 ?auto_2724542 ) ) ( not ( = ?auto_2724528 ?auto_2724545 ) ) ( not ( = ?auto_2724532 ?auto_2724534 ) ) ( not ( = ?auto_2724532 ?auto_2724533 ) ) ( not ( = ?auto_2724532 ?auto_2724535 ) ) ( not ( = ?auto_2724532 ?auto_2724536 ) ) ( not ( = ?auto_2724532 ?auto_2724537 ) ) ( not ( = ?auto_2724532 ?auto_2724538 ) ) ( not ( = ?auto_2724532 ?auto_2724539 ) ) ( not ( = ?auto_2724532 ?auto_2724540 ) ) ( not ( = ?auto_2724532 ?auto_2724541 ) ) ( not ( = ?auto_2724532 ?auto_2724542 ) ) ( not ( = ?auto_2724532 ?auto_2724545 ) ) ( not ( = ?auto_2724534 ?auto_2724533 ) ) ( not ( = ?auto_2724534 ?auto_2724535 ) ) ( not ( = ?auto_2724534 ?auto_2724536 ) ) ( not ( = ?auto_2724534 ?auto_2724537 ) ) ( not ( = ?auto_2724534 ?auto_2724538 ) ) ( not ( = ?auto_2724534 ?auto_2724539 ) ) ( not ( = ?auto_2724534 ?auto_2724540 ) ) ( not ( = ?auto_2724534 ?auto_2724541 ) ) ( not ( = ?auto_2724534 ?auto_2724542 ) ) ( not ( = ?auto_2724534 ?auto_2724545 ) ) ( not ( = ?auto_2724533 ?auto_2724535 ) ) ( not ( = ?auto_2724533 ?auto_2724536 ) ) ( not ( = ?auto_2724533 ?auto_2724537 ) ) ( not ( = ?auto_2724533 ?auto_2724538 ) ) ( not ( = ?auto_2724533 ?auto_2724539 ) ) ( not ( = ?auto_2724533 ?auto_2724540 ) ) ( not ( = ?auto_2724533 ?auto_2724541 ) ) ( not ( = ?auto_2724533 ?auto_2724542 ) ) ( not ( = ?auto_2724533 ?auto_2724545 ) ) ( not ( = ?auto_2724535 ?auto_2724536 ) ) ( not ( = ?auto_2724535 ?auto_2724537 ) ) ( not ( = ?auto_2724535 ?auto_2724538 ) ) ( not ( = ?auto_2724535 ?auto_2724539 ) ) ( not ( = ?auto_2724535 ?auto_2724540 ) ) ( not ( = ?auto_2724535 ?auto_2724541 ) ) ( not ( = ?auto_2724535 ?auto_2724542 ) ) ( not ( = ?auto_2724535 ?auto_2724545 ) ) ( not ( = ?auto_2724536 ?auto_2724537 ) ) ( not ( = ?auto_2724536 ?auto_2724538 ) ) ( not ( = ?auto_2724536 ?auto_2724539 ) ) ( not ( = ?auto_2724536 ?auto_2724540 ) ) ( not ( = ?auto_2724536 ?auto_2724541 ) ) ( not ( = ?auto_2724536 ?auto_2724542 ) ) ( not ( = ?auto_2724536 ?auto_2724545 ) ) ( not ( = ?auto_2724537 ?auto_2724538 ) ) ( not ( = ?auto_2724537 ?auto_2724539 ) ) ( not ( = ?auto_2724537 ?auto_2724540 ) ) ( not ( = ?auto_2724537 ?auto_2724541 ) ) ( not ( = ?auto_2724537 ?auto_2724542 ) ) ( not ( = ?auto_2724537 ?auto_2724545 ) ) ( not ( = ?auto_2724538 ?auto_2724539 ) ) ( not ( = ?auto_2724538 ?auto_2724540 ) ) ( not ( = ?auto_2724538 ?auto_2724541 ) ) ( not ( = ?auto_2724538 ?auto_2724542 ) ) ( not ( = ?auto_2724538 ?auto_2724545 ) ) ( not ( = ?auto_2724539 ?auto_2724540 ) ) ( not ( = ?auto_2724539 ?auto_2724541 ) ) ( not ( = ?auto_2724539 ?auto_2724542 ) ) ( not ( = ?auto_2724539 ?auto_2724545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2724540 ?auto_2724541 ?auto_2724542 )
      ( MAKE-14CRATE-VERIFY ?auto_2724529 ?auto_2724530 ?auto_2724531 ?auto_2724528 ?auto_2724532 ?auto_2724534 ?auto_2724533 ?auto_2724535 ?auto_2724536 ?auto_2724537 ?auto_2724538 ?auto_2724539 ?auto_2724540 ?auto_2724541 ?auto_2724542 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2724733 - SURFACE
      ?auto_2724734 - SURFACE
      ?auto_2724735 - SURFACE
      ?auto_2724732 - SURFACE
      ?auto_2724736 - SURFACE
      ?auto_2724738 - SURFACE
      ?auto_2724737 - SURFACE
      ?auto_2724739 - SURFACE
      ?auto_2724740 - SURFACE
      ?auto_2724741 - SURFACE
      ?auto_2724742 - SURFACE
      ?auto_2724743 - SURFACE
      ?auto_2724744 - SURFACE
      ?auto_2724745 - SURFACE
      ?auto_2724746 - SURFACE
    )
    :vars
    (
      ?auto_2724748 - HOIST
      ?auto_2724749 - PLACE
      ?auto_2724751 - PLACE
      ?auto_2724747 - HOIST
      ?auto_2724752 - SURFACE
      ?auto_2724750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724748 ?auto_2724749 ) ( IS-CRATE ?auto_2724746 ) ( not ( = ?auto_2724745 ?auto_2724746 ) ) ( not ( = ?auto_2724744 ?auto_2724745 ) ) ( not ( = ?auto_2724744 ?auto_2724746 ) ) ( not ( = ?auto_2724751 ?auto_2724749 ) ) ( HOIST-AT ?auto_2724747 ?auto_2724751 ) ( not ( = ?auto_2724748 ?auto_2724747 ) ) ( AVAILABLE ?auto_2724747 ) ( SURFACE-AT ?auto_2724746 ?auto_2724751 ) ( ON ?auto_2724746 ?auto_2724752 ) ( CLEAR ?auto_2724746 ) ( not ( = ?auto_2724745 ?auto_2724752 ) ) ( not ( = ?auto_2724746 ?auto_2724752 ) ) ( not ( = ?auto_2724744 ?auto_2724752 ) ) ( TRUCK-AT ?auto_2724750 ?auto_2724749 ) ( SURFACE-AT ?auto_2724744 ?auto_2724749 ) ( CLEAR ?auto_2724744 ) ( LIFTING ?auto_2724748 ?auto_2724745 ) ( IS-CRATE ?auto_2724745 ) ( ON ?auto_2724734 ?auto_2724733 ) ( ON ?auto_2724735 ?auto_2724734 ) ( ON ?auto_2724732 ?auto_2724735 ) ( ON ?auto_2724736 ?auto_2724732 ) ( ON ?auto_2724738 ?auto_2724736 ) ( ON ?auto_2724737 ?auto_2724738 ) ( ON ?auto_2724739 ?auto_2724737 ) ( ON ?auto_2724740 ?auto_2724739 ) ( ON ?auto_2724741 ?auto_2724740 ) ( ON ?auto_2724742 ?auto_2724741 ) ( ON ?auto_2724743 ?auto_2724742 ) ( ON ?auto_2724744 ?auto_2724743 ) ( not ( = ?auto_2724733 ?auto_2724734 ) ) ( not ( = ?auto_2724733 ?auto_2724735 ) ) ( not ( = ?auto_2724733 ?auto_2724732 ) ) ( not ( = ?auto_2724733 ?auto_2724736 ) ) ( not ( = ?auto_2724733 ?auto_2724738 ) ) ( not ( = ?auto_2724733 ?auto_2724737 ) ) ( not ( = ?auto_2724733 ?auto_2724739 ) ) ( not ( = ?auto_2724733 ?auto_2724740 ) ) ( not ( = ?auto_2724733 ?auto_2724741 ) ) ( not ( = ?auto_2724733 ?auto_2724742 ) ) ( not ( = ?auto_2724733 ?auto_2724743 ) ) ( not ( = ?auto_2724733 ?auto_2724744 ) ) ( not ( = ?auto_2724733 ?auto_2724745 ) ) ( not ( = ?auto_2724733 ?auto_2724746 ) ) ( not ( = ?auto_2724733 ?auto_2724752 ) ) ( not ( = ?auto_2724734 ?auto_2724735 ) ) ( not ( = ?auto_2724734 ?auto_2724732 ) ) ( not ( = ?auto_2724734 ?auto_2724736 ) ) ( not ( = ?auto_2724734 ?auto_2724738 ) ) ( not ( = ?auto_2724734 ?auto_2724737 ) ) ( not ( = ?auto_2724734 ?auto_2724739 ) ) ( not ( = ?auto_2724734 ?auto_2724740 ) ) ( not ( = ?auto_2724734 ?auto_2724741 ) ) ( not ( = ?auto_2724734 ?auto_2724742 ) ) ( not ( = ?auto_2724734 ?auto_2724743 ) ) ( not ( = ?auto_2724734 ?auto_2724744 ) ) ( not ( = ?auto_2724734 ?auto_2724745 ) ) ( not ( = ?auto_2724734 ?auto_2724746 ) ) ( not ( = ?auto_2724734 ?auto_2724752 ) ) ( not ( = ?auto_2724735 ?auto_2724732 ) ) ( not ( = ?auto_2724735 ?auto_2724736 ) ) ( not ( = ?auto_2724735 ?auto_2724738 ) ) ( not ( = ?auto_2724735 ?auto_2724737 ) ) ( not ( = ?auto_2724735 ?auto_2724739 ) ) ( not ( = ?auto_2724735 ?auto_2724740 ) ) ( not ( = ?auto_2724735 ?auto_2724741 ) ) ( not ( = ?auto_2724735 ?auto_2724742 ) ) ( not ( = ?auto_2724735 ?auto_2724743 ) ) ( not ( = ?auto_2724735 ?auto_2724744 ) ) ( not ( = ?auto_2724735 ?auto_2724745 ) ) ( not ( = ?auto_2724735 ?auto_2724746 ) ) ( not ( = ?auto_2724735 ?auto_2724752 ) ) ( not ( = ?auto_2724732 ?auto_2724736 ) ) ( not ( = ?auto_2724732 ?auto_2724738 ) ) ( not ( = ?auto_2724732 ?auto_2724737 ) ) ( not ( = ?auto_2724732 ?auto_2724739 ) ) ( not ( = ?auto_2724732 ?auto_2724740 ) ) ( not ( = ?auto_2724732 ?auto_2724741 ) ) ( not ( = ?auto_2724732 ?auto_2724742 ) ) ( not ( = ?auto_2724732 ?auto_2724743 ) ) ( not ( = ?auto_2724732 ?auto_2724744 ) ) ( not ( = ?auto_2724732 ?auto_2724745 ) ) ( not ( = ?auto_2724732 ?auto_2724746 ) ) ( not ( = ?auto_2724732 ?auto_2724752 ) ) ( not ( = ?auto_2724736 ?auto_2724738 ) ) ( not ( = ?auto_2724736 ?auto_2724737 ) ) ( not ( = ?auto_2724736 ?auto_2724739 ) ) ( not ( = ?auto_2724736 ?auto_2724740 ) ) ( not ( = ?auto_2724736 ?auto_2724741 ) ) ( not ( = ?auto_2724736 ?auto_2724742 ) ) ( not ( = ?auto_2724736 ?auto_2724743 ) ) ( not ( = ?auto_2724736 ?auto_2724744 ) ) ( not ( = ?auto_2724736 ?auto_2724745 ) ) ( not ( = ?auto_2724736 ?auto_2724746 ) ) ( not ( = ?auto_2724736 ?auto_2724752 ) ) ( not ( = ?auto_2724738 ?auto_2724737 ) ) ( not ( = ?auto_2724738 ?auto_2724739 ) ) ( not ( = ?auto_2724738 ?auto_2724740 ) ) ( not ( = ?auto_2724738 ?auto_2724741 ) ) ( not ( = ?auto_2724738 ?auto_2724742 ) ) ( not ( = ?auto_2724738 ?auto_2724743 ) ) ( not ( = ?auto_2724738 ?auto_2724744 ) ) ( not ( = ?auto_2724738 ?auto_2724745 ) ) ( not ( = ?auto_2724738 ?auto_2724746 ) ) ( not ( = ?auto_2724738 ?auto_2724752 ) ) ( not ( = ?auto_2724737 ?auto_2724739 ) ) ( not ( = ?auto_2724737 ?auto_2724740 ) ) ( not ( = ?auto_2724737 ?auto_2724741 ) ) ( not ( = ?auto_2724737 ?auto_2724742 ) ) ( not ( = ?auto_2724737 ?auto_2724743 ) ) ( not ( = ?auto_2724737 ?auto_2724744 ) ) ( not ( = ?auto_2724737 ?auto_2724745 ) ) ( not ( = ?auto_2724737 ?auto_2724746 ) ) ( not ( = ?auto_2724737 ?auto_2724752 ) ) ( not ( = ?auto_2724739 ?auto_2724740 ) ) ( not ( = ?auto_2724739 ?auto_2724741 ) ) ( not ( = ?auto_2724739 ?auto_2724742 ) ) ( not ( = ?auto_2724739 ?auto_2724743 ) ) ( not ( = ?auto_2724739 ?auto_2724744 ) ) ( not ( = ?auto_2724739 ?auto_2724745 ) ) ( not ( = ?auto_2724739 ?auto_2724746 ) ) ( not ( = ?auto_2724739 ?auto_2724752 ) ) ( not ( = ?auto_2724740 ?auto_2724741 ) ) ( not ( = ?auto_2724740 ?auto_2724742 ) ) ( not ( = ?auto_2724740 ?auto_2724743 ) ) ( not ( = ?auto_2724740 ?auto_2724744 ) ) ( not ( = ?auto_2724740 ?auto_2724745 ) ) ( not ( = ?auto_2724740 ?auto_2724746 ) ) ( not ( = ?auto_2724740 ?auto_2724752 ) ) ( not ( = ?auto_2724741 ?auto_2724742 ) ) ( not ( = ?auto_2724741 ?auto_2724743 ) ) ( not ( = ?auto_2724741 ?auto_2724744 ) ) ( not ( = ?auto_2724741 ?auto_2724745 ) ) ( not ( = ?auto_2724741 ?auto_2724746 ) ) ( not ( = ?auto_2724741 ?auto_2724752 ) ) ( not ( = ?auto_2724742 ?auto_2724743 ) ) ( not ( = ?auto_2724742 ?auto_2724744 ) ) ( not ( = ?auto_2724742 ?auto_2724745 ) ) ( not ( = ?auto_2724742 ?auto_2724746 ) ) ( not ( = ?auto_2724742 ?auto_2724752 ) ) ( not ( = ?auto_2724743 ?auto_2724744 ) ) ( not ( = ?auto_2724743 ?auto_2724745 ) ) ( not ( = ?auto_2724743 ?auto_2724746 ) ) ( not ( = ?auto_2724743 ?auto_2724752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2724744 ?auto_2724745 ?auto_2724746 )
      ( MAKE-14CRATE-VERIFY ?auto_2724733 ?auto_2724734 ?auto_2724735 ?auto_2724732 ?auto_2724736 ?auto_2724738 ?auto_2724737 ?auto_2724739 ?auto_2724740 ?auto_2724741 ?auto_2724742 ?auto_2724743 ?auto_2724744 ?auto_2724745 ?auto_2724746 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2724937 - SURFACE
      ?auto_2724938 - SURFACE
      ?auto_2724939 - SURFACE
      ?auto_2724936 - SURFACE
      ?auto_2724940 - SURFACE
      ?auto_2724942 - SURFACE
      ?auto_2724941 - SURFACE
      ?auto_2724943 - SURFACE
      ?auto_2724944 - SURFACE
      ?auto_2724945 - SURFACE
      ?auto_2724946 - SURFACE
      ?auto_2724947 - SURFACE
      ?auto_2724948 - SURFACE
      ?auto_2724949 - SURFACE
      ?auto_2724950 - SURFACE
    )
    :vars
    (
      ?auto_2724954 - HOIST
      ?auto_2724953 - PLACE
      ?auto_2724951 - PLACE
      ?auto_2724955 - HOIST
      ?auto_2724956 - SURFACE
      ?auto_2724952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724954 ?auto_2724953 ) ( IS-CRATE ?auto_2724950 ) ( not ( = ?auto_2724949 ?auto_2724950 ) ) ( not ( = ?auto_2724948 ?auto_2724949 ) ) ( not ( = ?auto_2724948 ?auto_2724950 ) ) ( not ( = ?auto_2724951 ?auto_2724953 ) ) ( HOIST-AT ?auto_2724955 ?auto_2724951 ) ( not ( = ?auto_2724954 ?auto_2724955 ) ) ( AVAILABLE ?auto_2724955 ) ( SURFACE-AT ?auto_2724950 ?auto_2724951 ) ( ON ?auto_2724950 ?auto_2724956 ) ( CLEAR ?auto_2724950 ) ( not ( = ?auto_2724949 ?auto_2724956 ) ) ( not ( = ?auto_2724950 ?auto_2724956 ) ) ( not ( = ?auto_2724948 ?auto_2724956 ) ) ( TRUCK-AT ?auto_2724952 ?auto_2724953 ) ( SURFACE-AT ?auto_2724948 ?auto_2724953 ) ( CLEAR ?auto_2724948 ) ( IS-CRATE ?auto_2724949 ) ( AVAILABLE ?auto_2724954 ) ( IN ?auto_2724949 ?auto_2724952 ) ( ON ?auto_2724938 ?auto_2724937 ) ( ON ?auto_2724939 ?auto_2724938 ) ( ON ?auto_2724936 ?auto_2724939 ) ( ON ?auto_2724940 ?auto_2724936 ) ( ON ?auto_2724942 ?auto_2724940 ) ( ON ?auto_2724941 ?auto_2724942 ) ( ON ?auto_2724943 ?auto_2724941 ) ( ON ?auto_2724944 ?auto_2724943 ) ( ON ?auto_2724945 ?auto_2724944 ) ( ON ?auto_2724946 ?auto_2724945 ) ( ON ?auto_2724947 ?auto_2724946 ) ( ON ?auto_2724948 ?auto_2724947 ) ( not ( = ?auto_2724937 ?auto_2724938 ) ) ( not ( = ?auto_2724937 ?auto_2724939 ) ) ( not ( = ?auto_2724937 ?auto_2724936 ) ) ( not ( = ?auto_2724937 ?auto_2724940 ) ) ( not ( = ?auto_2724937 ?auto_2724942 ) ) ( not ( = ?auto_2724937 ?auto_2724941 ) ) ( not ( = ?auto_2724937 ?auto_2724943 ) ) ( not ( = ?auto_2724937 ?auto_2724944 ) ) ( not ( = ?auto_2724937 ?auto_2724945 ) ) ( not ( = ?auto_2724937 ?auto_2724946 ) ) ( not ( = ?auto_2724937 ?auto_2724947 ) ) ( not ( = ?auto_2724937 ?auto_2724948 ) ) ( not ( = ?auto_2724937 ?auto_2724949 ) ) ( not ( = ?auto_2724937 ?auto_2724950 ) ) ( not ( = ?auto_2724937 ?auto_2724956 ) ) ( not ( = ?auto_2724938 ?auto_2724939 ) ) ( not ( = ?auto_2724938 ?auto_2724936 ) ) ( not ( = ?auto_2724938 ?auto_2724940 ) ) ( not ( = ?auto_2724938 ?auto_2724942 ) ) ( not ( = ?auto_2724938 ?auto_2724941 ) ) ( not ( = ?auto_2724938 ?auto_2724943 ) ) ( not ( = ?auto_2724938 ?auto_2724944 ) ) ( not ( = ?auto_2724938 ?auto_2724945 ) ) ( not ( = ?auto_2724938 ?auto_2724946 ) ) ( not ( = ?auto_2724938 ?auto_2724947 ) ) ( not ( = ?auto_2724938 ?auto_2724948 ) ) ( not ( = ?auto_2724938 ?auto_2724949 ) ) ( not ( = ?auto_2724938 ?auto_2724950 ) ) ( not ( = ?auto_2724938 ?auto_2724956 ) ) ( not ( = ?auto_2724939 ?auto_2724936 ) ) ( not ( = ?auto_2724939 ?auto_2724940 ) ) ( not ( = ?auto_2724939 ?auto_2724942 ) ) ( not ( = ?auto_2724939 ?auto_2724941 ) ) ( not ( = ?auto_2724939 ?auto_2724943 ) ) ( not ( = ?auto_2724939 ?auto_2724944 ) ) ( not ( = ?auto_2724939 ?auto_2724945 ) ) ( not ( = ?auto_2724939 ?auto_2724946 ) ) ( not ( = ?auto_2724939 ?auto_2724947 ) ) ( not ( = ?auto_2724939 ?auto_2724948 ) ) ( not ( = ?auto_2724939 ?auto_2724949 ) ) ( not ( = ?auto_2724939 ?auto_2724950 ) ) ( not ( = ?auto_2724939 ?auto_2724956 ) ) ( not ( = ?auto_2724936 ?auto_2724940 ) ) ( not ( = ?auto_2724936 ?auto_2724942 ) ) ( not ( = ?auto_2724936 ?auto_2724941 ) ) ( not ( = ?auto_2724936 ?auto_2724943 ) ) ( not ( = ?auto_2724936 ?auto_2724944 ) ) ( not ( = ?auto_2724936 ?auto_2724945 ) ) ( not ( = ?auto_2724936 ?auto_2724946 ) ) ( not ( = ?auto_2724936 ?auto_2724947 ) ) ( not ( = ?auto_2724936 ?auto_2724948 ) ) ( not ( = ?auto_2724936 ?auto_2724949 ) ) ( not ( = ?auto_2724936 ?auto_2724950 ) ) ( not ( = ?auto_2724936 ?auto_2724956 ) ) ( not ( = ?auto_2724940 ?auto_2724942 ) ) ( not ( = ?auto_2724940 ?auto_2724941 ) ) ( not ( = ?auto_2724940 ?auto_2724943 ) ) ( not ( = ?auto_2724940 ?auto_2724944 ) ) ( not ( = ?auto_2724940 ?auto_2724945 ) ) ( not ( = ?auto_2724940 ?auto_2724946 ) ) ( not ( = ?auto_2724940 ?auto_2724947 ) ) ( not ( = ?auto_2724940 ?auto_2724948 ) ) ( not ( = ?auto_2724940 ?auto_2724949 ) ) ( not ( = ?auto_2724940 ?auto_2724950 ) ) ( not ( = ?auto_2724940 ?auto_2724956 ) ) ( not ( = ?auto_2724942 ?auto_2724941 ) ) ( not ( = ?auto_2724942 ?auto_2724943 ) ) ( not ( = ?auto_2724942 ?auto_2724944 ) ) ( not ( = ?auto_2724942 ?auto_2724945 ) ) ( not ( = ?auto_2724942 ?auto_2724946 ) ) ( not ( = ?auto_2724942 ?auto_2724947 ) ) ( not ( = ?auto_2724942 ?auto_2724948 ) ) ( not ( = ?auto_2724942 ?auto_2724949 ) ) ( not ( = ?auto_2724942 ?auto_2724950 ) ) ( not ( = ?auto_2724942 ?auto_2724956 ) ) ( not ( = ?auto_2724941 ?auto_2724943 ) ) ( not ( = ?auto_2724941 ?auto_2724944 ) ) ( not ( = ?auto_2724941 ?auto_2724945 ) ) ( not ( = ?auto_2724941 ?auto_2724946 ) ) ( not ( = ?auto_2724941 ?auto_2724947 ) ) ( not ( = ?auto_2724941 ?auto_2724948 ) ) ( not ( = ?auto_2724941 ?auto_2724949 ) ) ( not ( = ?auto_2724941 ?auto_2724950 ) ) ( not ( = ?auto_2724941 ?auto_2724956 ) ) ( not ( = ?auto_2724943 ?auto_2724944 ) ) ( not ( = ?auto_2724943 ?auto_2724945 ) ) ( not ( = ?auto_2724943 ?auto_2724946 ) ) ( not ( = ?auto_2724943 ?auto_2724947 ) ) ( not ( = ?auto_2724943 ?auto_2724948 ) ) ( not ( = ?auto_2724943 ?auto_2724949 ) ) ( not ( = ?auto_2724943 ?auto_2724950 ) ) ( not ( = ?auto_2724943 ?auto_2724956 ) ) ( not ( = ?auto_2724944 ?auto_2724945 ) ) ( not ( = ?auto_2724944 ?auto_2724946 ) ) ( not ( = ?auto_2724944 ?auto_2724947 ) ) ( not ( = ?auto_2724944 ?auto_2724948 ) ) ( not ( = ?auto_2724944 ?auto_2724949 ) ) ( not ( = ?auto_2724944 ?auto_2724950 ) ) ( not ( = ?auto_2724944 ?auto_2724956 ) ) ( not ( = ?auto_2724945 ?auto_2724946 ) ) ( not ( = ?auto_2724945 ?auto_2724947 ) ) ( not ( = ?auto_2724945 ?auto_2724948 ) ) ( not ( = ?auto_2724945 ?auto_2724949 ) ) ( not ( = ?auto_2724945 ?auto_2724950 ) ) ( not ( = ?auto_2724945 ?auto_2724956 ) ) ( not ( = ?auto_2724946 ?auto_2724947 ) ) ( not ( = ?auto_2724946 ?auto_2724948 ) ) ( not ( = ?auto_2724946 ?auto_2724949 ) ) ( not ( = ?auto_2724946 ?auto_2724950 ) ) ( not ( = ?auto_2724946 ?auto_2724956 ) ) ( not ( = ?auto_2724947 ?auto_2724948 ) ) ( not ( = ?auto_2724947 ?auto_2724949 ) ) ( not ( = ?auto_2724947 ?auto_2724950 ) ) ( not ( = ?auto_2724947 ?auto_2724956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2724948 ?auto_2724949 ?auto_2724950 )
      ( MAKE-14CRATE-VERIFY ?auto_2724937 ?auto_2724938 ?auto_2724939 ?auto_2724936 ?auto_2724940 ?auto_2724942 ?auto_2724941 ?auto_2724943 ?auto_2724944 ?auto_2724945 ?auto_2724946 ?auto_2724947 ?auto_2724948 ?auto_2724949 ?auto_2724950 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742127 - SURFACE
      ?auto_2742128 - SURFACE
      ?auto_2742129 - SURFACE
      ?auto_2742126 - SURFACE
      ?auto_2742130 - SURFACE
      ?auto_2742132 - SURFACE
      ?auto_2742131 - SURFACE
      ?auto_2742133 - SURFACE
      ?auto_2742134 - SURFACE
      ?auto_2742135 - SURFACE
      ?auto_2742136 - SURFACE
      ?auto_2742137 - SURFACE
      ?auto_2742138 - SURFACE
      ?auto_2742139 - SURFACE
      ?auto_2742140 - SURFACE
      ?auto_2742141 - SURFACE
    )
    :vars
    (
      ?auto_2742143 - HOIST
      ?auto_2742142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742143 ?auto_2742142 ) ( SURFACE-AT ?auto_2742140 ?auto_2742142 ) ( CLEAR ?auto_2742140 ) ( LIFTING ?auto_2742143 ?auto_2742141 ) ( IS-CRATE ?auto_2742141 ) ( not ( = ?auto_2742140 ?auto_2742141 ) ) ( ON ?auto_2742128 ?auto_2742127 ) ( ON ?auto_2742129 ?auto_2742128 ) ( ON ?auto_2742126 ?auto_2742129 ) ( ON ?auto_2742130 ?auto_2742126 ) ( ON ?auto_2742132 ?auto_2742130 ) ( ON ?auto_2742131 ?auto_2742132 ) ( ON ?auto_2742133 ?auto_2742131 ) ( ON ?auto_2742134 ?auto_2742133 ) ( ON ?auto_2742135 ?auto_2742134 ) ( ON ?auto_2742136 ?auto_2742135 ) ( ON ?auto_2742137 ?auto_2742136 ) ( ON ?auto_2742138 ?auto_2742137 ) ( ON ?auto_2742139 ?auto_2742138 ) ( ON ?auto_2742140 ?auto_2742139 ) ( not ( = ?auto_2742127 ?auto_2742128 ) ) ( not ( = ?auto_2742127 ?auto_2742129 ) ) ( not ( = ?auto_2742127 ?auto_2742126 ) ) ( not ( = ?auto_2742127 ?auto_2742130 ) ) ( not ( = ?auto_2742127 ?auto_2742132 ) ) ( not ( = ?auto_2742127 ?auto_2742131 ) ) ( not ( = ?auto_2742127 ?auto_2742133 ) ) ( not ( = ?auto_2742127 ?auto_2742134 ) ) ( not ( = ?auto_2742127 ?auto_2742135 ) ) ( not ( = ?auto_2742127 ?auto_2742136 ) ) ( not ( = ?auto_2742127 ?auto_2742137 ) ) ( not ( = ?auto_2742127 ?auto_2742138 ) ) ( not ( = ?auto_2742127 ?auto_2742139 ) ) ( not ( = ?auto_2742127 ?auto_2742140 ) ) ( not ( = ?auto_2742127 ?auto_2742141 ) ) ( not ( = ?auto_2742128 ?auto_2742129 ) ) ( not ( = ?auto_2742128 ?auto_2742126 ) ) ( not ( = ?auto_2742128 ?auto_2742130 ) ) ( not ( = ?auto_2742128 ?auto_2742132 ) ) ( not ( = ?auto_2742128 ?auto_2742131 ) ) ( not ( = ?auto_2742128 ?auto_2742133 ) ) ( not ( = ?auto_2742128 ?auto_2742134 ) ) ( not ( = ?auto_2742128 ?auto_2742135 ) ) ( not ( = ?auto_2742128 ?auto_2742136 ) ) ( not ( = ?auto_2742128 ?auto_2742137 ) ) ( not ( = ?auto_2742128 ?auto_2742138 ) ) ( not ( = ?auto_2742128 ?auto_2742139 ) ) ( not ( = ?auto_2742128 ?auto_2742140 ) ) ( not ( = ?auto_2742128 ?auto_2742141 ) ) ( not ( = ?auto_2742129 ?auto_2742126 ) ) ( not ( = ?auto_2742129 ?auto_2742130 ) ) ( not ( = ?auto_2742129 ?auto_2742132 ) ) ( not ( = ?auto_2742129 ?auto_2742131 ) ) ( not ( = ?auto_2742129 ?auto_2742133 ) ) ( not ( = ?auto_2742129 ?auto_2742134 ) ) ( not ( = ?auto_2742129 ?auto_2742135 ) ) ( not ( = ?auto_2742129 ?auto_2742136 ) ) ( not ( = ?auto_2742129 ?auto_2742137 ) ) ( not ( = ?auto_2742129 ?auto_2742138 ) ) ( not ( = ?auto_2742129 ?auto_2742139 ) ) ( not ( = ?auto_2742129 ?auto_2742140 ) ) ( not ( = ?auto_2742129 ?auto_2742141 ) ) ( not ( = ?auto_2742126 ?auto_2742130 ) ) ( not ( = ?auto_2742126 ?auto_2742132 ) ) ( not ( = ?auto_2742126 ?auto_2742131 ) ) ( not ( = ?auto_2742126 ?auto_2742133 ) ) ( not ( = ?auto_2742126 ?auto_2742134 ) ) ( not ( = ?auto_2742126 ?auto_2742135 ) ) ( not ( = ?auto_2742126 ?auto_2742136 ) ) ( not ( = ?auto_2742126 ?auto_2742137 ) ) ( not ( = ?auto_2742126 ?auto_2742138 ) ) ( not ( = ?auto_2742126 ?auto_2742139 ) ) ( not ( = ?auto_2742126 ?auto_2742140 ) ) ( not ( = ?auto_2742126 ?auto_2742141 ) ) ( not ( = ?auto_2742130 ?auto_2742132 ) ) ( not ( = ?auto_2742130 ?auto_2742131 ) ) ( not ( = ?auto_2742130 ?auto_2742133 ) ) ( not ( = ?auto_2742130 ?auto_2742134 ) ) ( not ( = ?auto_2742130 ?auto_2742135 ) ) ( not ( = ?auto_2742130 ?auto_2742136 ) ) ( not ( = ?auto_2742130 ?auto_2742137 ) ) ( not ( = ?auto_2742130 ?auto_2742138 ) ) ( not ( = ?auto_2742130 ?auto_2742139 ) ) ( not ( = ?auto_2742130 ?auto_2742140 ) ) ( not ( = ?auto_2742130 ?auto_2742141 ) ) ( not ( = ?auto_2742132 ?auto_2742131 ) ) ( not ( = ?auto_2742132 ?auto_2742133 ) ) ( not ( = ?auto_2742132 ?auto_2742134 ) ) ( not ( = ?auto_2742132 ?auto_2742135 ) ) ( not ( = ?auto_2742132 ?auto_2742136 ) ) ( not ( = ?auto_2742132 ?auto_2742137 ) ) ( not ( = ?auto_2742132 ?auto_2742138 ) ) ( not ( = ?auto_2742132 ?auto_2742139 ) ) ( not ( = ?auto_2742132 ?auto_2742140 ) ) ( not ( = ?auto_2742132 ?auto_2742141 ) ) ( not ( = ?auto_2742131 ?auto_2742133 ) ) ( not ( = ?auto_2742131 ?auto_2742134 ) ) ( not ( = ?auto_2742131 ?auto_2742135 ) ) ( not ( = ?auto_2742131 ?auto_2742136 ) ) ( not ( = ?auto_2742131 ?auto_2742137 ) ) ( not ( = ?auto_2742131 ?auto_2742138 ) ) ( not ( = ?auto_2742131 ?auto_2742139 ) ) ( not ( = ?auto_2742131 ?auto_2742140 ) ) ( not ( = ?auto_2742131 ?auto_2742141 ) ) ( not ( = ?auto_2742133 ?auto_2742134 ) ) ( not ( = ?auto_2742133 ?auto_2742135 ) ) ( not ( = ?auto_2742133 ?auto_2742136 ) ) ( not ( = ?auto_2742133 ?auto_2742137 ) ) ( not ( = ?auto_2742133 ?auto_2742138 ) ) ( not ( = ?auto_2742133 ?auto_2742139 ) ) ( not ( = ?auto_2742133 ?auto_2742140 ) ) ( not ( = ?auto_2742133 ?auto_2742141 ) ) ( not ( = ?auto_2742134 ?auto_2742135 ) ) ( not ( = ?auto_2742134 ?auto_2742136 ) ) ( not ( = ?auto_2742134 ?auto_2742137 ) ) ( not ( = ?auto_2742134 ?auto_2742138 ) ) ( not ( = ?auto_2742134 ?auto_2742139 ) ) ( not ( = ?auto_2742134 ?auto_2742140 ) ) ( not ( = ?auto_2742134 ?auto_2742141 ) ) ( not ( = ?auto_2742135 ?auto_2742136 ) ) ( not ( = ?auto_2742135 ?auto_2742137 ) ) ( not ( = ?auto_2742135 ?auto_2742138 ) ) ( not ( = ?auto_2742135 ?auto_2742139 ) ) ( not ( = ?auto_2742135 ?auto_2742140 ) ) ( not ( = ?auto_2742135 ?auto_2742141 ) ) ( not ( = ?auto_2742136 ?auto_2742137 ) ) ( not ( = ?auto_2742136 ?auto_2742138 ) ) ( not ( = ?auto_2742136 ?auto_2742139 ) ) ( not ( = ?auto_2742136 ?auto_2742140 ) ) ( not ( = ?auto_2742136 ?auto_2742141 ) ) ( not ( = ?auto_2742137 ?auto_2742138 ) ) ( not ( = ?auto_2742137 ?auto_2742139 ) ) ( not ( = ?auto_2742137 ?auto_2742140 ) ) ( not ( = ?auto_2742137 ?auto_2742141 ) ) ( not ( = ?auto_2742138 ?auto_2742139 ) ) ( not ( = ?auto_2742138 ?auto_2742140 ) ) ( not ( = ?auto_2742138 ?auto_2742141 ) ) ( not ( = ?auto_2742139 ?auto_2742140 ) ) ( not ( = ?auto_2742139 ?auto_2742141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2742140 ?auto_2742141 )
      ( MAKE-15CRATE-VERIFY ?auto_2742127 ?auto_2742128 ?auto_2742129 ?auto_2742126 ?auto_2742130 ?auto_2742132 ?auto_2742131 ?auto_2742133 ?auto_2742134 ?auto_2742135 ?auto_2742136 ?auto_2742137 ?auto_2742138 ?auto_2742139 ?auto_2742140 ?auto_2742141 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742306 - SURFACE
      ?auto_2742307 - SURFACE
      ?auto_2742308 - SURFACE
      ?auto_2742305 - SURFACE
      ?auto_2742309 - SURFACE
      ?auto_2742311 - SURFACE
      ?auto_2742310 - SURFACE
      ?auto_2742312 - SURFACE
      ?auto_2742313 - SURFACE
      ?auto_2742314 - SURFACE
      ?auto_2742315 - SURFACE
      ?auto_2742316 - SURFACE
      ?auto_2742317 - SURFACE
      ?auto_2742318 - SURFACE
      ?auto_2742319 - SURFACE
      ?auto_2742320 - SURFACE
    )
    :vars
    (
      ?auto_2742323 - HOIST
      ?auto_2742322 - PLACE
      ?auto_2742321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742323 ?auto_2742322 ) ( SURFACE-AT ?auto_2742319 ?auto_2742322 ) ( CLEAR ?auto_2742319 ) ( IS-CRATE ?auto_2742320 ) ( not ( = ?auto_2742319 ?auto_2742320 ) ) ( TRUCK-AT ?auto_2742321 ?auto_2742322 ) ( AVAILABLE ?auto_2742323 ) ( IN ?auto_2742320 ?auto_2742321 ) ( ON ?auto_2742319 ?auto_2742318 ) ( not ( = ?auto_2742318 ?auto_2742319 ) ) ( not ( = ?auto_2742318 ?auto_2742320 ) ) ( ON ?auto_2742307 ?auto_2742306 ) ( ON ?auto_2742308 ?auto_2742307 ) ( ON ?auto_2742305 ?auto_2742308 ) ( ON ?auto_2742309 ?auto_2742305 ) ( ON ?auto_2742311 ?auto_2742309 ) ( ON ?auto_2742310 ?auto_2742311 ) ( ON ?auto_2742312 ?auto_2742310 ) ( ON ?auto_2742313 ?auto_2742312 ) ( ON ?auto_2742314 ?auto_2742313 ) ( ON ?auto_2742315 ?auto_2742314 ) ( ON ?auto_2742316 ?auto_2742315 ) ( ON ?auto_2742317 ?auto_2742316 ) ( ON ?auto_2742318 ?auto_2742317 ) ( not ( = ?auto_2742306 ?auto_2742307 ) ) ( not ( = ?auto_2742306 ?auto_2742308 ) ) ( not ( = ?auto_2742306 ?auto_2742305 ) ) ( not ( = ?auto_2742306 ?auto_2742309 ) ) ( not ( = ?auto_2742306 ?auto_2742311 ) ) ( not ( = ?auto_2742306 ?auto_2742310 ) ) ( not ( = ?auto_2742306 ?auto_2742312 ) ) ( not ( = ?auto_2742306 ?auto_2742313 ) ) ( not ( = ?auto_2742306 ?auto_2742314 ) ) ( not ( = ?auto_2742306 ?auto_2742315 ) ) ( not ( = ?auto_2742306 ?auto_2742316 ) ) ( not ( = ?auto_2742306 ?auto_2742317 ) ) ( not ( = ?auto_2742306 ?auto_2742318 ) ) ( not ( = ?auto_2742306 ?auto_2742319 ) ) ( not ( = ?auto_2742306 ?auto_2742320 ) ) ( not ( = ?auto_2742307 ?auto_2742308 ) ) ( not ( = ?auto_2742307 ?auto_2742305 ) ) ( not ( = ?auto_2742307 ?auto_2742309 ) ) ( not ( = ?auto_2742307 ?auto_2742311 ) ) ( not ( = ?auto_2742307 ?auto_2742310 ) ) ( not ( = ?auto_2742307 ?auto_2742312 ) ) ( not ( = ?auto_2742307 ?auto_2742313 ) ) ( not ( = ?auto_2742307 ?auto_2742314 ) ) ( not ( = ?auto_2742307 ?auto_2742315 ) ) ( not ( = ?auto_2742307 ?auto_2742316 ) ) ( not ( = ?auto_2742307 ?auto_2742317 ) ) ( not ( = ?auto_2742307 ?auto_2742318 ) ) ( not ( = ?auto_2742307 ?auto_2742319 ) ) ( not ( = ?auto_2742307 ?auto_2742320 ) ) ( not ( = ?auto_2742308 ?auto_2742305 ) ) ( not ( = ?auto_2742308 ?auto_2742309 ) ) ( not ( = ?auto_2742308 ?auto_2742311 ) ) ( not ( = ?auto_2742308 ?auto_2742310 ) ) ( not ( = ?auto_2742308 ?auto_2742312 ) ) ( not ( = ?auto_2742308 ?auto_2742313 ) ) ( not ( = ?auto_2742308 ?auto_2742314 ) ) ( not ( = ?auto_2742308 ?auto_2742315 ) ) ( not ( = ?auto_2742308 ?auto_2742316 ) ) ( not ( = ?auto_2742308 ?auto_2742317 ) ) ( not ( = ?auto_2742308 ?auto_2742318 ) ) ( not ( = ?auto_2742308 ?auto_2742319 ) ) ( not ( = ?auto_2742308 ?auto_2742320 ) ) ( not ( = ?auto_2742305 ?auto_2742309 ) ) ( not ( = ?auto_2742305 ?auto_2742311 ) ) ( not ( = ?auto_2742305 ?auto_2742310 ) ) ( not ( = ?auto_2742305 ?auto_2742312 ) ) ( not ( = ?auto_2742305 ?auto_2742313 ) ) ( not ( = ?auto_2742305 ?auto_2742314 ) ) ( not ( = ?auto_2742305 ?auto_2742315 ) ) ( not ( = ?auto_2742305 ?auto_2742316 ) ) ( not ( = ?auto_2742305 ?auto_2742317 ) ) ( not ( = ?auto_2742305 ?auto_2742318 ) ) ( not ( = ?auto_2742305 ?auto_2742319 ) ) ( not ( = ?auto_2742305 ?auto_2742320 ) ) ( not ( = ?auto_2742309 ?auto_2742311 ) ) ( not ( = ?auto_2742309 ?auto_2742310 ) ) ( not ( = ?auto_2742309 ?auto_2742312 ) ) ( not ( = ?auto_2742309 ?auto_2742313 ) ) ( not ( = ?auto_2742309 ?auto_2742314 ) ) ( not ( = ?auto_2742309 ?auto_2742315 ) ) ( not ( = ?auto_2742309 ?auto_2742316 ) ) ( not ( = ?auto_2742309 ?auto_2742317 ) ) ( not ( = ?auto_2742309 ?auto_2742318 ) ) ( not ( = ?auto_2742309 ?auto_2742319 ) ) ( not ( = ?auto_2742309 ?auto_2742320 ) ) ( not ( = ?auto_2742311 ?auto_2742310 ) ) ( not ( = ?auto_2742311 ?auto_2742312 ) ) ( not ( = ?auto_2742311 ?auto_2742313 ) ) ( not ( = ?auto_2742311 ?auto_2742314 ) ) ( not ( = ?auto_2742311 ?auto_2742315 ) ) ( not ( = ?auto_2742311 ?auto_2742316 ) ) ( not ( = ?auto_2742311 ?auto_2742317 ) ) ( not ( = ?auto_2742311 ?auto_2742318 ) ) ( not ( = ?auto_2742311 ?auto_2742319 ) ) ( not ( = ?auto_2742311 ?auto_2742320 ) ) ( not ( = ?auto_2742310 ?auto_2742312 ) ) ( not ( = ?auto_2742310 ?auto_2742313 ) ) ( not ( = ?auto_2742310 ?auto_2742314 ) ) ( not ( = ?auto_2742310 ?auto_2742315 ) ) ( not ( = ?auto_2742310 ?auto_2742316 ) ) ( not ( = ?auto_2742310 ?auto_2742317 ) ) ( not ( = ?auto_2742310 ?auto_2742318 ) ) ( not ( = ?auto_2742310 ?auto_2742319 ) ) ( not ( = ?auto_2742310 ?auto_2742320 ) ) ( not ( = ?auto_2742312 ?auto_2742313 ) ) ( not ( = ?auto_2742312 ?auto_2742314 ) ) ( not ( = ?auto_2742312 ?auto_2742315 ) ) ( not ( = ?auto_2742312 ?auto_2742316 ) ) ( not ( = ?auto_2742312 ?auto_2742317 ) ) ( not ( = ?auto_2742312 ?auto_2742318 ) ) ( not ( = ?auto_2742312 ?auto_2742319 ) ) ( not ( = ?auto_2742312 ?auto_2742320 ) ) ( not ( = ?auto_2742313 ?auto_2742314 ) ) ( not ( = ?auto_2742313 ?auto_2742315 ) ) ( not ( = ?auto_2742313 ?auto_2742316 ) ) ( not ( = ?auto_2742313 ?auto_2742317 ) ) ( not ( = ?auto_2742313 ?auto_2742318 ) ) ( not ( = ?auto_2742313 ?auto_2742319 ) ) ( not ( = ?auto_2742313 ?auto_2742320 ) ) ( not ( = ?auto_2742314 ?auto_2742315 ) ) ( not ( = ?auto_2742314 ?auto_2742316 ) ) ( not ( = ?auto_2742314 ?auto_2742317 ) ) ( not ( = ?auto_2742314 ?auto_2742318 ) ) ( not ( = ?auto_2742314 ?auto_2742319 ) ) ( not ( = ?auto_2742314 ?auto_2742320 ) ) ( not ( = ?auto_2742315 ?auto_2742316 ) ) ( not ( = ?auto_2742315 ?auto_2742317 ) ) ( not ( = ?auto_2742315 ?auto_2742318 ) ) ( not ( = ?auto_2742315 ?auto_2742319 ) ) ( not ( = ?auto_2742315 ?auto_2742320 ) ) ( not ( = ?auto_2742316 ?auto_2742317 ) ) ( not ( = ?auto_2742316 ?auto_2742318 ) ) ( not ( = ?auto_2742316 ?auto_2742319 ) ) ( not ( = ?auto_2742316 ?auto_2742320 ) ) ( not ( = ?auto_2742317 ?auto_2742318 ) ) ( not ( = ?auto_2742317 ?auto_2742319 ) ) ( not ( = ?auto_2742317 ?auto_2742320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742318 ?auto_2742319 ?auto_2742320 )
      ( MAKE-15CRATE-VERIFY ?auto_2742306 ?auto_2742307 ?auto_2742308 ?auto_2742305 ?auto_2742309 ?auto_2742311 ?auto_2742310 ?auto_2742312 ?auto_2742313 ?auto_2742314 ?auto_2742315 ?auto_2742316 ?auto_2742317 ?auto_2742318 ?auto_2742319 ?auto_2742320 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742501 - SURFACE
      ?auto_2742502 - SURFACE
      ?auto_2742503 - SURFACE
      ?auto_2742500 - SURFACE
      ?auto_2742504 - SURFACE
      ?auto_2742506 - SURFACE
      ?auto_2742505 - SURFACE
      ?auto_2742507 - SURFACE
      ?auto_2742508 - SURFACE
      ?auto_2742509 - SURFACE
      ?auto_2742510 - SURFACE
      ?auto_2742511 - SURFACE
      ?auto_2742512 - SURFACE
      ?auto_2742513 - SURFACE
      ?auto_2742514 - SURFACE
      ?auto_2742515 - SURFACE
    )
    :vars
    (
      ?auto_2742516 - HOIST
      ?auto_2742518 - PLACE
      ?auto_2742517 - TRUCK
      ?auto_2742519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742516 ?auto_2742518 ) ( SURFACE-AT ?auto_2742514 ?auto_2742518 ) ( CLEAR ?auto_2742514 ) ( IS-CRATE ?auto_2742515 ) ( not ( = ?auto_2742514 ?auto_2742515 ) ) ( AVAILABLE ?auto_2742516 ) ( IN ?auto_2742515 ?auto_2742517 ) ( ON ?auto_2742514 ?auto_2742513 ) ( not ( = ?auto_2742513 ?auto_2742514 ) ) ( not ( = ?auto_2742513 ?auto_2742515 ) ) ( TRUCK-AT ?auto_2742517 ?auto_2742519 ) ( not ( = ?auto_2742519 ?auto_2742518 ) ) ( ON ?auto_2742502 ?auto_2742501 ) ( ON ?auto_2742503 ?auto_2742502 ) ( ON ?auto_2742500 ?auto_2742503 ) ( ON ?auto_2742504 ?auto_2742500 ) ( ON ?auto_2742506 ?auto_2742504 ) ( ON ?auto_2742505 ?auto_2742506 ) ( ON ?auto_2742507 ?auto_2742505 ) ( ON ?auto_2742508 ?auto_2742507 ) ( ON ?auto_2742509 ?auto_2742508 ) ( ON ?auto_2742510 ?auto_2742509 ) ( ON ?auto_2742511 ?auto_2742510 ) ( ON ?auto_2742512 ?auto_2742511 ) ( ON ?auto_2742513 ?auto_2742512 ) ( not ( = ?auto_2742501 ?auto_2742502 ) ) ( not ( = ?auto_2742501 ?auto_2742503 ) ) ( not ( = ?auto_2742501 ?auto_2742500 ) ) ( not ( = ?auto_2742501 ?auto_2742504 ) ) ( not ( = ?auto_2742501 ?auto_2742506 ) ) ( not ( = ?auto_2742501 ?auto_2742505 ) ) ( not ( = ?auto_2742501 ?auto_2742507 ) ) ( not ( = ?auto_2742501 ?auto_2742508 ) ) ( not ( = ?auto_2742501 ?auto_2742509 ) ) ( not ( = ?auto_2742501 ?auto_2742510 ) ) ( not ( = ?auto_2742501 ?auto_2742511 ) ) ( not ( = ?auto_2742501 ?auto_2742512 ) ) ( not ( = ?auto_2742501 ?auto_2742513 ) ) ( not ( = ?auto_2742501 ?auto_2742514 ) ) ( not ( = ?auto_2742501 ?auto_2742515 ) ) ( not ( = ?auto_2742502 ?auto_2742503 ) ) ( not ( = ?auto_2742502 ?auto_2742500 ) ) ( not ( = ?auto_2742502 ?auto_2742504 ) ) ( not ( = ?auto_2742502 ?auto_2742506 ) ) ( not ( = ?auto_2742502 ?auto_2742505 ) ) ( not ( = ?auto_2742502 ?auto_2742507 ) ) ( not ( = ?auto_2742502 ?auto_2742508 ) ) ( not ( = ?auto_2742502 ?auto_2742509 ) ) ( not ( = ?auto_2742502 ?auto_2742510 ) ) ( not ( = ?auto_2742502 ?auto_2742511 ) ) ( not ( = ?auto_2742502 ?auto_2742512 ) ) ( not ( = ?auto_2742502 ?auto_2742513 ) ) ( not ( = ?auto_2742502 ?auto_2742514 ) ) ( not ( = ?auto_2742502 ?auto_2742515 ) ) ( not ( = ?auto_2742503 ?auto_2742500 ) ) ( not ( = ?auto_2742503 ?auto_2742504 ) ) ( not ( = ?auto_2742503 ?auto_2742506 ) ) ( not ( = ?auto_2742503 ?auto_2742505 ) ) ( not ( = ?auto_2742503 ?auto_2742507 ) ) ( not ( = ?auto_2742503 ?auto_2742508 ) ) ( not ( = ?auto_2742503 ?auto_2742509 ) ) ( not ( = ?auto_2742503 ?auto_2742510 ) ) ( not ( = ?auto_2742503 ?auto_2742511 ) ) ( not ( = ?auto_2742503 ?auto_2742512 ) ) ( not ( = ?auto_2742503 ?auto_2742513 ) ) ( not ( = ?auto_2742503 ?auto_2742514 ) ) ( not ( = ?auto_2742503 ?auto_2742515 ) ) ( not ( = ?auto_2742500 ?auto_2742504 ) ) ( not ( = ?auto_2742500 ?auto_2742506 ) ) ( not ( = ?auto_2742500 ?auto_2742505 ) ) ( not ( = ?auto_2742500 ?auto_2742507 ) ) ( not ( = ?auto_2742500 ?auto_2742508 ) ) ( not ( = ?auto_2742500 ?auto_2742509 ) ) ( not ( = ?auto_2742500 ?auto_2742510 ) ) ( not ( = ?auto_2742500 ?auto_2742511 ) ) ( not ( = ?auto_2742500 ?auto_2742512 ) ) ( not ( = ?auto_2742500 ?auto_2742513 ) ) ( not ( = ?auto_2742500 ?auto_2742514 ) ) ( not ( = ?auto_2742500 ?auto_2742515 ) ) ( not ( = ?auto_2742504 ?auto_2742506 ) ) ( not ( = ?auto_2742504 ?auto_2742505 ) ) ( not ( = ?auto_2742504 ?auto_2742507 ) ) ( not ( = ?auto_2742504 ?auto_2742508 ) ) ( not ( = ?auto_2742504 ?auto_2742509 ) ) ( not ( = ?auto_2742504 ?auto_2742510 ) ) ( not ( = ?auto_2742504 ?auto_2742511 ) ) ( not ( = ?auto_2742504 ?auto_2742512 ) ) ( not ( = ?auto_2742504 ?auto_2742513 ) ) ( not ( = ?auto_2742504 ?auto_2742514 ) ) ( not ( = ?auto_2742504 ?auto_2742515 ) ) ( not ( = ?auto_2742506 ?auto_2742505 ) ) ( not ( = ?auto_2742506 ?auto_2742507 ) ) ( not ( = ?auto_2742506 ?auto_2742508 ) ) ( not ( = ?auto_2742506 ?auto_2742509 ) ) ( not ( = ?auto_2742506 ?auto_2742510 ) ) ( not ( = ?auto_2742506 ?auto_2742511 ) ) ( not ( = ?auto_2742506 ?auto_2742512 ) ) ( not ( = ?auto_2742506 ?auto_2742513 ) ) ( not ( = ?auto_2742506 ?auto_2742514 ) ) ( not ( = ?auto_2742506 ?auto_2742515 ) ) ( not ( = ?auto_2742505 ?auto_2742507 ) ) ( not ( = ?auto_2742505 ?auto_2742508 ) ) ( not ( = ?auto_2742505 ?auto_2742509 ) ) ( not ( = ?auto_2742505 ?auto_2742510 ) ) ( not ( = ?auto_2742505 ?auto_2742511 ) ) ( not ( = ?auto_2742505 ?auto_2742512 ) ) ( not ( = ?auto_2742505 ?auto_2742513 ) ) ( not ( = ?auto_2742505 ?auto_2742514 ) ) ( not ( = ?auto_2742505 ?auto_2742515 ) ) ( not ( = ?auto_2742507 ?auto_2742508 ) ) ( not ( = ?auto_2742507 ?auto_2742509 ) ) ( not ( = ?auto_2742507 ?auto_2742510 ) ) ( not ( = ?auto_2742507 ?auto_2742511 ) ) ( not ( = ?auto_2742507 ?auto_2742512 ) ) ( not ( = ?auto_2742507 ?auto_2742513 ) ) ( not ( = ?auto_2742507 ?auto_2742514 ) ) ( not ( = ?auto_2742507 ?auto_2742515 ) ) ( not ( = ?auto_2742508 ?auto_2742509 ) ) ( not ( = ?auto_2742508 ?auto_2742510 ) ) ( not ( = ?auto_2742508 ?auto_2742511 ) ) ( not ( = ?auto_2742508 ?auto_2742512 ) ) ( not ( = ?auto_2742508 ?auto_2742513 ) ) ( not ( = ?auto_2742508 ?auto_2742514 ) ) ( not ( = ?auto_2742508 ?auto_2742515 ) ) ( not ( = ?auto_2742509 ?auto_2742510 ) ) ( not ( = ?auto_2742509 ?auto_2742511 ) ) ( not ( = ?auto_2742509 ?auto_2742512 ) ) ( not ( = ?auto_2742509 ?auto_2742513 ) ) ( not ( = ?auto_2742509 ?auto_2742514 ) ) ( not ( = ?auto_2742509 ?auto_2742515 ) ) ( not ( = ?auto_2742510 ?auto_2742511 ) ) ( not ( = ?auto_2742510 ?auto_2742512 ) ) ( not ( = ?auto_2742510 ?auto_2742513 ) ) ( not ( = ?auto_2742510 ?auto_2742514 ) ) ( not ( = ?auto_2742510 ?auto_2742515 ) ) ( not ( = ?auto_2742511 ?auto_2742512 ) ) ( not ( = ?auto_2742511 ?auto_2742513 ) ) ( not ( = ?auto_2742511 ?auto_2742514 ) ) ( not ( = ?auto_2742511 ?auto_2742515 ) ) ( not ( = ?auto_2742512 ?auto_2742513 ) ) ( not ( = ?auto_2742512 ?auto_2742514 ) ) ( not ( = ?auto_2742512 ?auto_2742515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742513 ?auto_2742514 ?auto_2742515 )
      ( MAKE-15CRATE-VERIFY ?auto_2742501 ?auto_2742502 ?auto_2742503 ?auto_2742500 ?auto_2742504 ?auto_2742506 ?auto_2742505 ?auto_2742507 ?auto_2742508 ?auto_2742509 ?auto_2742510 ?auto_2742511 ?auto_2742512 ?auto_2742513 ?auto_2742514 ?auto_2742515 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742711 - SURFACE
      ?auto_2742712 - SURFACE
      ?auto_2742713 - SURFACE
      ?auto_2742710 - SURFACE
      ?auto_2742714 - SURFACE
      ?auto_2742716 - SURFACE
      ?auto_2742715 - SURFACE
      ?auto_2742717 - SURFACE
      ?auto_2742718 - SURFACE
      ?auto_2742719 - SURFACE
      ?auto_2742720 - SURFACE
      ?auto_2742721 - SURFACE
      ?auto_2742722 - SURFACE
      ?auto_2742723 - SURFACE
      ?auto_2742724 - SURFACE
      ?auto_2742725 - SURFACE
    )
    :vars
    (
      ?auto_2742727 - HOIST
      ?auto_2742728 - PLACE
      ?auto_2742730 - TRUCK
      ?auto_2742729 - PLACE
      ?auto_2742726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742727 ?auto_2742728 ) ( SURFACE-AT ?auto_2742724 ?auto_2742728 ) ( CLEAR ?auto_2742724 ) ( IS-CRATE ?auto_2742725 ) ( not ( = ?auto_2742724 ?auto_2742725 ) ) ( AVAILABLE ?auto_2742727 ) ( ON ?auto_2742724 ?auto_2742723 ) ( not ( = ?auto_2742723 ?auto_2742724 ) ) ( not ( = ?auto_2742723 ?auto_2742725 ) ) ( TRUCK-AT ?auto_2742730 ?auto_2742729 ) ( not ( = ?auto_2742729 ?auto_2742728 ) ) ( HOIST-AT ?auto_2742726 ?auto_2742729 ) ( LIFTING ?auto_2742726 ?auto_2742725 ) ( not ( = ?auto_2742727 ?auto_2742726 ) ) ( ON ?auto_2742712 ?auto_2742711 ) ( ON ?auto_2742713 ?auto_2742712 ) ( ON ?auto_2742710 ?auto_2742713 ) ( ON ?auto_2742714 ?auto_2742710 ) ( ON ?auto_2742716 ?auto_2742714 ) ( ON ?auto_2742715 ?auto_2742716 ) ( ON ?auto_2742717 ?auto_2742715 ) ( ON ?auto_2742718 ?auto_2742717 ) ( ON ?auto_2742719 ?auto_2742718 ) ( ON ?auto_2742720 ?auto_2742719 ) ( ON ?auto_2742721 ?auto_2742720 ) ( ON ?auto_2742722 ?auto_2742721 ) ( ON ?auto_2742723 ?auto_2742722 ) ( not ( = ?auto_2742711 ?auto_2742712 ) ) ( not ( = ?auto_2742711 ?auto_2742713 ) ) ( not ( = ?auto_2742711 ?auto_2742710 ) ) ( not ( = ?auto_2742711 ?auto_2742714 ) ) ( not ( = ?auto_2742711 ?auto_2742716 ) ) ( not ( = ?auto_2742711 ?auto_2742715 ) ) ( not ( = ?auto_2742711 ?auto_2742717 ) ) ( not ( = ?auto_2742711 ?auto_2742718 ) ) ( not ( = ?auto_2742711 ?auto_2742719 ) ) ( not ( = ?auto_2742711 ?auto_2742720 ) ) ( not ( = ?auto_2742711 ?auto_2742721 ) ) ( not ( = ?auto_2742711 ?auto_2742722 ) ) ( not ( = ?auto_2742711 ?auto_2742723 ) ) ( not ( = ?auto_2742711 ?auto_2742724 ) ) ( not ( = ?auto_2742711 ?auto_2742725 ) ) ( not ( = ?auto_2742712 ?auto_2742713 ) ) ( not ( = ?auto_2742712 ?auto_2742710 ) ) ( not ( = ?auto_2742712 ?auto_2742714 ) ) ( not ( = ?auto_2742712 ?auto_2742716 ) ) ( not ( = ?auto_2742712 ?auto_2742715 ) ) ( not ( = ?auto_2742712 ?auto_2742717 ) ) ( not ( = ?auto_2742712 ?auto_2742718 ) ) ( not ( = ?auto_2742712 ?auto_2742719 ) ) ( not ( = ?auto_2742712 ?auto_2742720 ) ) ( not ( = ?auto_2742712 ?auto_2742721 ) ) ( not ( = ?auto_2742712 ?auto_2742722 ) ) ( not ( = ?auto_2742712 ?auto_2742723 ) ) ( not ( = ?auto_2742712 ?auto_2742724 ) ) ( not ( = ?auto_2742712 ?auto_2742725 ) ) ( not ( = ?auto_2742713 ?auto_2742710 ) ) ( not ( = ?auto_2742713 ?auto_2742714 ) ) ( not ( = ?auto_2742713 ?auto_2742716 ) ) ( not ( = ?auto_2742713 ?auto_2742715 ) ) ( not ( = ?auto_2742713 ?auto_2742717 ) ) ( not ( = ?auto_2742713 ?auto_2742718 ) ) ( not ( = ?auto_2742713 ?auto_2742719 ) ) ( not ( = ?auto_2742713 ?auto_2742720 ) ) ( not ( = ?auto_2742713 ?auto_2742721 ) ) ( not ( = ?auto_2742713 ?auto_2742722 ) ) ( not ( = ?auto_2742713 ?auto_2742723 ) ) ( not ( = ?auto_2742713 ?auto_2742724 ) ) ( not ( = ?auto_2742713 ?auto_2742725 ) ) ( not ( = ?auto_2742710 ?auto_2742714 ) ) ( not ( = ?auto_2742710 ?auto_2742716 ) ) ( not ( = ?auto_2742710 ?auto_2742715 ) ) ( not ( = ?auto_2742710 ?auto_2742717 ) ) ( not ( = ?auto_2742710 ?auto_2742718 ) ) ( not ( = ?auto_2742710 ?auto_2742719 ) ) ( not ( = ?auto_2742710 ?auto_2742720 ) ) ( not ( = ?auto_2742710 ?auto_2742721 ) ) ( not ( = ?auto_2742710 ?auto_2742722 ) ) ( not ( = ?auto_2742710 ?auto_2742723 ) ) ( not ( = ?auto_2742710 ?auto_2742724 ) ) ( not ( = ?auto_2742710 ?auto_2742725 ) ) ( not ( = ?auto_2742714 ?auto_2742716 ) ) ( not ( = ?auto_2742714 ?auto_2742715 ) ) ( not ( = ?auto_2742714 ?auto_2742717 ) ) ( not ( = ?auto_2742714 ?auto_2742718 ) ) ( not ( = ?auto_2742714 ?auto_2742719 ) ) ( not ( = ?auto_2742714 ?auto_2742720 ) ) ( not ( = ?auto_2742714 ?auto_2742721 ) ) ( not ( = ?auto_2742714 ?auto_2742722 ) ) ( not ( = ?auto_2742714 ?auto_2742723 ) ) ( not ( = ?auto_2742714 ?auto_2742724 ) ) ( not ( = ?auto_2742714 ?auto_2742725 ) ) ( not ( = ?auto_2742716 ?auto_2742715 ) ) ( not ( = ?auto_2742716 ?auto_2742717 ) ) ( not ( = ?auto_2742716 ?auto_2742718 ) ) ( not ( = ?auto_2742716 ?auto_2742719 ) ) ( not ( = ?auto_2742716 ?auto_2742720 ) ) ( not ( = ?auto_2742716 ?auto_2742721 ) ) ( not ( = ?auto_2742716 ?auto_2742722 ) ) ( not ( = ?auto_2742716 ?auto_2742723 ) ) ( not ( = ?auto_2742716 ?auto_2742724 ) ) ( not ( = ?auto_2742716 ?auto_2742725 ) ) ( not ( = ?auto_2742715 ?auto_2742717 ) ) ( not ( = ?auto_2742715 ?auto_2742718 ) ) ( not ( = ?auto_2742715 ?auto_2742719 ) ) ( not ( = ?auto_2742715 ?auto_2742720 ) ) ( not ( = ?auto_2742715 ?auto_2742721 ) ) ( not ( = ?auto_2742715 ?auto_2742722 ) ) ( not ( = ?auto_2742715 ?auto_2742723 ) ) ( not ( = ?auto_2742715 ?auto_2742724 ) ) ( not ( = ?auto_2742715 ?auto_2742725 ) ) ( not ( = ?auto_2742717 ?auto_2742718 ) ) ( not ( = ?auto_2742717 ?auto_2742719 ) ) ( not ( = ?auto_2742717 ?auto_2742720 ) ) ( not ( = ?auto_2742717 ?auto_2742721 ) ) ( not ( = ?auto_2742717 ?auto_2742722 ) ) ( not ( = ?auto_2742717 ?auto_2742723 ) ) ( not ( = ?auto_2742717 ?auto_2742724 ) ) ( not ( = ?auto_2742717 ?auto_2742725 ) ) ( not ( = ?auto_2742718 ?auto_2742719 ) ) ( not ( = ?auto_2742718 ?auto_2742720 ) ) ( not ( = ?auto_2742718 ?auto_2742721 ) ) ( not ( = ?auto_2742718 ?auto_2742722 ) ) ( not ( = ?auto_2742718 ?auto_2742723 ) ) ( not ( = ?auto_2742718 ?auto_2742724 ) ) ( not ( = ?auto_2742718 ?auto_2742725 ) ) ( not ( = ?auto_2742719 ?auto_2742720 ) ) ( not ( = ?auto_2742719 ?auto_2742721 ) ) ( not ( = ?auto_2742719 ?auto_2742722 ) ) ( not ( = ?auto_2742719 ?auto_2742723 ) ) ( not ( = ?auto_2742719 ?auto_2742724 ) ) ( not ( = ?auto_2742719 ?auto_2742725 ) ) ( not ( = ?auto_2742720 ?auto_2742721 ) ) ( not ( = ?auto_2742720 ?auto_2742722 ) ) ( not ( = ?auto_2742720 ?auto_2742723 ) ) ( not ( = ?auto_2742720 ?auto_2742724 ) ) ( not ( = ?auto_2742720 ?auto_2742725 ) ) ( not ( = ?auto_2742721 ?auto_2742722 ) ) ( not ( = ?auto_2742721 ?auto_2742723 ) ) ( not ( = ?auto_2742721 ?auto_2742724 ) ) ( not ( = ?auto_2742721 ?auto_2742725 ) ) ( not ( = ?auto_2742722 ?auto_2742723 ) ) ( not ( = ?auto_2742722 ?auto_2742724 ) ) ( not ( = ?auto_2742722 ?auto_2742725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742723 ?auto_2742724 ?auto_2742725 )
      ( MAKE-15CRATE-VERIFY ?auto_2742711 ?auto_2742712 ?auto_2742713 ?auto_2742710 ?auto_2742714 ?auto_2742716 ?auto_2742715 ?auto_2742717 ?auto_2742718 ?auto_2742719 ?auto_2742720 ?auto_2742721 ?auto_2742722 ?auto_2742723 ?auto_2742724 ?auto_2742725 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742936 - SURFACE
      ?auto_2742937 - SURFACE
      ?auto_2742938 - SURFACE
      ?auto_2742935 - SURFACE
      ?auto_2742939 - SURFACE
      ?auto_2742941 - SURFACE
      ?auto_2742940 - SURFACE
      ?auto_2742942 - SURFACE
      ?auto_2742943 - SURFACE
      ?auto_2742944 - SURFACE
      ?auto_2742945 - SURFACE
      ?auto_2742946 - SURFACE
      ?auto_2742947 - SURFACE
      ?auto_2742948 - SURFACE
      ?auto_2742949 - SURFACE
      ?auto_2742950 - SURFACE
    )
    :vars
    (
      ?auto_2742956 - HOIST
      ?auto_2742951 - PLACE
      ?auto_2742953 - TRUCK
      ?auto_2742955 - PLACE
      ?auto_2742954 - HOIST
      ?auto_2742952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742956 ?auto_2742951 ) ( SURFACE-AT ?auto_2742949 ?auto_2742951 ) ( CLEAR ?auto_2742949 ) ( IS-CRATE ?auto_2742950 ) ( not ( = ?auto_2742949 ?auto_2742950 ) ) ( AVAILABLE ?auto_2742956 ) ( ON ?auto_2742949 ?auto_2742948 ) ( not ( = ?auto_2742948 ?auto_2742949 ) ) ( not ( = ?auto_2742948 ?auto_2742950 ) ) ( TRUCK-AT ?auto_2742953 ?auto_2742955 ) ( not ( = ?auto_2742955 ?auto_2742951 ) ) ( HOIST-AT ?auto_2742954 ?auto_2742955 ) ( not ( = ?auto_2742956 ?auto_2742954 ) ) ( AVAILABLE ?auto_2742954 ) ( SURFACE-AT ?auto_2742950 ?auto_2742955 ) ( ON ?auto_2742950 ?auto_2742952 ) ( CLEAR ?auto_2742950 ) ( not ( = ?auto_2742949 ?auto_2742952 ) ) ( not ( = ?auto_2742950 ?auto_2742952 ) ) ( not ( = ?auto_2742948 ?auto_2742952 ) ) ( ON ?auto_2742937 ?auto_2742936 ) ( ON ?auto_2742938 ?auto_2742937 ) ( ON ?auto_2742935 ?auto_2742938 ) ( ON ?auto_2742939 ?auto_2742935 ) ( ON ?auto_2742941 ?auto_2742939 ) ( ON ?auto_2742940 ?auto_2742941 ) ( ON ?auto_2742942 ?auto_2742940 ) ( ON ?auto_2742943 ?auto_2742942 ) ( ON ?auto_2742944 ?auto_2742943 ) ( ON ?auto_2742945 ?auto_2742944 ) ( ON ?auto_2742946 ?auto_2742945 ) ( ON ?auto_2742947 ?auto_2742946 ) ( ON ?auto_2742948 ?auto_2742947 ) ( not ( = ?auto_2742936 ?auto_2742937 ) ) ( not ( = ?auto_2742936 ?auto_2742938 ) ) ( not ( = ?auto_2742936 ?auto_2742935 ) ) ( not ( = ?auto_2742936 ?auto_2742939 ) ) ( not ( = ?auto_2742936 ?auto_2742941 ) ) ( not ( = ?auto_2742936 ?auto_2742940 ) ) ( not ( = ?auto_2742936 ?auto_2742942 ) ) ( not ( = ?auto_2742936 ?auto_2742943 ) ) ( not ( = ?auto_2742936 ?auto_2742944 ) ) ( not ( = ?auto_2742936 ?auto_2742945 ) ) ( not ( = ?auto_2742936 ?auto_2742946 ) ) ( not ( = ?auto_2742936 ?auto_2742947 ) ) ( not ( = ?auto_2742936 ?auto_2742948 ) ) ( not ( = ?auto_2742936 ?auto_2742949 ) ) ( not ( = ?auto_2742936 ?auto_2742950 ) ) ( not ( = ?auto_2742936 ?auto_2742952 ) ) ( not ( = ?auto_2742937 ?auto_2742938 ) ) ( not ( = ?auto_2742937 ?auto_2742935 ) ) ( not ( = ?auto_2742937 ?auto_2742939 ) ) ( not ( = ?auto_2742937 ?auto_2742941 ) ) ( not ( = ?auto_2742937 ?auto_2742940 ) ) ( not ( = ?auto_2742937 ?auto_2742942 ) ) ( not ( = ?auto_2742937 ?auto_2742943 ) ) ( not ( = ?auto_2742937 ?auto_2742944 ) ) ( not ( = ?auto_2742937 ?auto_2742945 ) ) ( not ( = ?auto_2742937 ?auto_2742946 ) ) ( not ( = ?auto_2742937 ?auto_2742947 ) ) ( not ( = ?auto_2742937 ?auto_2742948 ) ) ( not ( = ?auto_2742937 ?auto_2742949 ) ) ( not ( = ?auto_2742937 ?auto_2742950 ) ) ( not ( = ?auto_2742937 ?auto_2742952 ) ) ( not ( = ?auto_2742938 ?auto_2742935 ) ) ( not ( = ?auto_2742938 ?auto_2742939 ) ) ( not ( = ?auto_2742938 ?auto_2742941 ) ) ( not ( = ?auto_2742938 ?auto_2742940 ) ) ( not ( = ?auto_2742938 ?auto_2742942 ) ) ( not ( = ?auto_2742938 ?auto_2742943 ) ) ( not ( = ?auto_2742938 ?auto_2742944 ) ) ( not ( = ?auto_2742938 ?auto_2742945 ) ) ( not ( = ?auto_2742938 ?auto_2742946 ) ) ( not ( = ?auto_2742938 ?auto_2742947 ) ) ( not ( = ?auto_2742938 ?auto_2742948 ) ) ( not ( = ?auto_2742938 ?auto_2742949 ) ) ( not ( = ?auto_2742938 ?auto_2742950 ) ) ( not ( = ?auto_2742938 ?auto_2742952 ) ) ( not ( = ?auto_2742935 ?auto_2742939 ) ) ( not ( = ?auto_2742935 ?auto_2742941 ) ) ( not ( = ?auto_2742935 ?auto_2742940 ) ) ( not ( = ?auto_2742935 ?auto_2742942 ) ) ( not ( = ?auto_2742935 ?auto_2742943 ) ) ( not ( = ?auto_2742935 ?auto_2742944 ) ) ( not ( = ?auto_2742935 ?auto_2742945 ) ) ( not ( = ?auto_2742935 ?auto_2742946 ) ) ( not ( = ?auto_2742935 ?auto_2742947 ) ) ( not ( = ?auto_2742935 ?auto_2742948 ) ) ( not ( = ?auto_2742935 ?auto_2742949 ) ) ( not ( = ?auto_2742935 ?auto_2742950 ) ) ( not ( = ?auto_2742935 ?auto_2742952 ) ) ( not ( = ?auto_2742939 ?auto_2742941 ) ) ( not ( = ?auto_2742939 ?auto_2742940 ) ) ( not ( = ?auto_2742939 ?auto_2742942 ) ) ( not ( = ?auto_2742939 ?auto_2742943 ) ) ( not ( = ?auto_2742939 ?auto_2742944 ) ) ( not ( = ?auto_2742939 ?auto_2742945 ) ) ( not ( = ?auto_2742939 ?auto_2742946 ) ) ( not ( = ?auto_2742939 ?auto_2742947 ) ) ( not ( = ?auto_2742939 ?auto_2742948 ) ) ( not ( = ?auto_2742939 ?auto_2742949 ) ) ( not ( = ?auto_2742939 ?auto_2742950 ) ) ( not ( = ?auto_2742939 ?auto_2742952 ) ) ( not ( = ?auto_2742941 ?auto_2742940 ) ) ( not ( = ?auto_2742941 ?auto_2742942 ) ) ( not ( = ?auto_2742941 ?auto_2742943 ) ) ( not ( = ?auto_2742941 ?auto_2742944 ) ) ( not ( = ?auto_2742941 ?auto_2742945 ) ) ( not ( = ?auto_2742941 ?auto_2742946 ) ) ( not ( = ?auto_2742941 ?auto_2742947 ) ) ( not ( = ?auto_2742941 ?auto_2742948 ) ) ( not ( = ?auto_2742941 ?auto_2742949 ) ) ( not ( = ?auto_2742941 ?auto_2742950 ) ) ( not ( = ?auto_2742941 ?auto_2742952 ) ) ( not ( = ?auto_2742940 ?auto_2742942 ) ) ( not ( = ?auto_2742940 ?auto_2742943 ) ) ( not ( = ?auto_2742940 ?auto_2742944 ) ) ( not ( = ?auto_2742940 ?auto_2742945 ) ) ( not ( = ?auto_2742940 ?auto_2742946 ) ) ( not ( = ?auto_2742940 ?auto_2742947 ) ) ( not ( = ?auto_2742940 ?auto_2742948 ) ) ( not ( = ?auto_2742940 ?auto_2742949 ) ) ( not ( = ?auto_2742940 ?auto_2742950 ) ) ( not ( = ?auto_2742940 ?auto_2742952 ) ) ( not ( = ?auto_2742942 ?auto_2742943 ) ) ( not ( = ?auto_2742942 ?auto_2742944 ) ) ( not ( = ?auto_2742942 ?auto_2742945 ) ) ( not ( = ?auto_2742942 ?auto_2742946 ) ) ( not ( = ?auto_2742942 ?auto_2742947 ) ) ( not ( = ?auto_2742942 ?auto_2742948 ) ) ( not ( = ?auto_2742942 ?auto_2742949 ) ) ( not ( = ?auto_2742942 ?auto_2742950 ) ) ( not ( = ?auto_2742942 ?auto_2742952 ) ) ( not ( = ?auto_2742943 ?auto_2742944 ) ) ( not ( = ?auto_2742943 ?auto_2742945 ) ) ( not ( = ?auto_2742943 ?auto_2742946 ) ) ( not ( = ?auto_2742943 ?auto_2742947 ) ) ( not ( = ?auto_2742943 ?auto_2742948 ) ) ( not ( = ?auto_2742943 ?auto_2742949 ) ) ( not ( = ?auto_2742943 ?auto_2742950 ) ) ( not ( = ?auto_2742943 ?auto_2742952 ) ) ( not ( = ?auto_2742944 ?auto_2742945 ) ) ( not ( = ?auto_2742944 ?auto_2742946 ) ) ( not ( = ?auto_2742944 ?auto_2742947 ) ) ( not ( = ?auto_2742944 ?auto_2742948 ) ) ( not ( = ?auto_2742944 ?auto_2742949 ) ) ( not ( = ?auto_2742944 ?auto_2742950 ) ) ( not ( = ?auto_2742944 ?auto_2742952 ) ) ( not ( = ?auto_2742945 ?auto_2742946 ) ) ( not ( = ?auto_2742945 ?auto_2742947 ) ) ( not ( = ?auto_2742945 ?auto_2742948 ) ) ( not ( = ?auto_2742945 ?auto_2742949 ) ) ( not ( = ?auto_2742945 ?auto_2742950 ) ) ( not ( = ?auto_2742945 ?auto_2742952 ) ) ( not ( = ?auto_2742946 ?auto_2742947 ) ) ( not ( = ?auto_2742946 ?auto_2742948 ) ) ( not ( = ?auto_2742946 ?auto_2742949 ) ) ( not ( = ?auto_2742946 ?auto_2742950 ) ) ( not ( = ?auto_2742946 ?auto_2742952 ) ) ( not ( = ?auto_2742947 ?auto_2742948 ) ) ( not ( = ?auto_2742947 ?auto_2742949 ) ) ( not ( = ?auto_2742947 ?auto_2742950 ) ) ( not ( = ?auto_2742947 ?auto_2742952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742948 ?auto_2742949 ?auto_2742950 )
      ( MAKE-15CRATE-VERIFY ?auto_2742936 ?auto_2742937 ?auto_2742938 ?auto_2742935 ?auto_2742939 ?auto_2742941 ?auto_2742940 ?auto_2742942 ?auto_2742943 ?auto_2742944 ?auto_2742945 ?auto_2742946 ?auto_2742947 ?auto_2742948 ?auto_2742949 ?auto_2742950 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2743162 - SURFACE
      ?auto_2743163 - SURFACE
      ?auto_2743164 - SURFACE
      ?auto_2743161 - SURFACE
      ?auto_2743165 - SURFACE
      ?auto_2743167 - SURFACE
      ?auto_2743166 - SURFACE
      ?auto_2743168 - SURFACE
      ?auto_2743169 - SURFACE
      ?auto_2743170 - SURFACE
      ?auto_2743171 - SURFACE
      ?auto_2743172 - SURFACE
      ?auto_2743173 - SURFACE
      ?auto_2743174 - SURFACE
      ?auto_2743175 - SURFACE
      ?auto_2743176 - SURFACE
    )
    :vars
    (
      ?auto_2743182 - HOIST
      ?auto_2743178 - PLACE
      ?auto_2743180 - PLACE
      ?auto_2743179 - HOIST
      ?auto_2743181 - SURFACE
      ?auto_2743177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2743182 ?auto_2743178 ) ( SURFACE-AT ?auto_2743175 ?auto_2743178 ) ( CLEAR ?auto_2743175 ) ( IS-CRATE ?auto_2743176 ) ( not ( = ?auto_2743175 ?auto_2743176 ) ) ( AVAILABLE ?auto_2743182 ) ( ON ?auto_2743175 ?auto_2743174 ) ( not ( = ?auto_2743174 ?auto_2743175 ) ) ( not ( = ?auto_2743174 ?auto_2743176 ) ) ( not ( = ?auto_2743180 ?auto_2743178 ) ) ( HOIST-AT ?auto_2743179 ?auto_2743180 ) ( not ( = ?auto_2743182 ?auto_2743179 ) ) ( AVAILABLE ?auto_2743179 ) ( SURFACE-AT ?auto_2743176 ?auto_2743180 ) ( ON ?auto_2743176 ?auto_2743181 ) ( CLEAR ?auto_2743176 ) ( not ( = ?auto_2743175 ?auto_2743181 ) ) ( not ( = ?auto_2743176 ?auto_2743181 ) ) ( not ( = ?auto_2743174 ?auto_2743181 ) ) ( TRUCK-AT ?auto_2743177 ?auto_2743178 ) ( ON ?auto_2743163 ?auto_2743162 ) ( ON ?auto_2743164 ?auto_2743163 ) ( ON ?auto_2743161 ?auto_2743164 ) ( ON ?auto_2743165 ?auto_2743161 ) ( ON ?auto_2743167 ?auto_2743165 ) ( ON ?auto_2743166 ?auto_2743167 ) ( ON ?auto_2743168 ?auto_2743166 ) ( ON ?auto_2743169 ?auto_2743168 ) ( ON ?auto_2743170 ?auto_2743169 ) ( ON ?auto_2743171 ?auto_2743170 ) ( ON ?auto_2743172 ?auto_2743171 ) ( ON ?auto_2743173 ?auto_2743172 ) ( ON ?auto_2743174 ?auto_2743173 ) ( not ( = ?auto_2743162 ?auto_2743163 ) ) ( not ( = ?auto_2743162 ?auto_2743164 ) ) ( not ( = ?auto_2743162 ?auto_2743161 ) ) ( not ( = ?auto_2743162 ?auto_2743165 ) ) ( not ( = ?auto_2743162 ?auto_2743167 ) ) ( not ( = ?auto_2743162 ?auto_2743166 ) ) ( not ( = ?auto_2743162 ?auto_2743168 ) ) ( not ( = ?auto_2743162 ?auto_2743169 ) ) ( not ( = ?auto_2743162 ?auto_2743170 ) ) ( not ( = ?auto_2743162 ?auto_2743171 ) ) ( not ( = ?auto_2743162 ?auto_2743172 ) ) ( not ( = ?auto_2743162 ?auto_2743173 ) ) ( not ( = ?auto_2743162 ?auto_2743174 ) ) ( not ( = ?auto_2743162 ?auto_2743175 ) ) ( not ( = ?auto_2743162 ?auto_2743176 ) ) ( not ( = ?auto_2743162 ?auto_2743181 ) ) ( not ( = ?auto_2743163 ?auto_2743164 ) ) ( not ( = ?auto_2743163 ?auto_2743161 ) ) ( not ( = ?auto_2743163 ?auto_2743165 ) ) ( not ( = ?auto_2743163 ?auto_2743167 ) ) ( not ( = ?auto_2743163 ?auto_2743166 ) ) ( not ( = ?auto_2743163 ?auto_2743168 ) ) ( not ( = ?auto_2743163 ?auto_2743169 ) ) ( not ( = ?auto_2743163 ?auto_2743170 ) ) ( not ( = ?auto_2743163 ?auto_2743171 ) ) ( not ( = ?auto_2743163 ?auto_2743172 ) ) ( not ( = ?auto_2743163 ?auto_2743173 ) ) ( not ( = ?auto_2743163 ?auto_2743174 ) ) ( not ( = ?auto_2743163 ?auto_2743175 ) ) ( not ( = ?auto_2743163 ?auto_2743176 ) ) ( not ( = ?auto_2743163 ?auto_2743181 ) ) ( not ( = ?auto_2743164 ?auto_2743161 ) ) ( not ( = ?auto_2743164 ?auto_2743165 ) ) ( not ( = ?auto_2743164 ?auto_2743167 ) ) ( not ( = ?auto_2743164 ?auto_2743166 ) ) ( not ( = ?auto_2743164 ?auto_2743168 ) ) ( not ( = ?auto_2743164 ?auto_2743169 ) ) ( not ( = ?auto_2743164 ?auto_2743170 ) ) ( not ( = ?auto_2743164 ?auto_2743171 ) ) ( not ( = ?auto_2743164 ?auto_2743172 ) ) ( not ( = ?auto_2743164 ?auto_2743173 ) ) ( not ( = ?auto_2743164 ?auto_2743174 ) ) ( not ( = ?auto_2743164 ?auto_2743175 ) ) ( not ( = ?auto_2743164 ?auto_2743176 ) ) ( not ( = ?auto_2743164 ?auto_2743181 ) ) ( not ( = ?auto_2743161 ?auto_2743165 ) ) ( not ( = ?auto_2743161 ?auto_2743167 ) ) ( not ( = ?auto_2743161 ?auto_2743166 ) ) ( not ( = ?auto_2743161 ?auto_2743168 ) ) ( not ( = ?auto_2743161 ?auto_2743169 ) ) ( not ( = ?auto_2743161 ?auto_2743170 ) ) ( not ( = ?auto_2743161 ?auto_2743171 ) ) ( not ( = ?auto_2743161 ?auto_2743172 ) ) ( not ( = ?auto_2743161 ?auto_2743173 ) ) ( not ( = ?auto_2743161 ?auto_2743174 ) ) ( not ( = ?auto_2743161 ?auto_2743175 ) ) ( not ( = ?auto_2743161 ?auto_2743176 ) ) ( not ( = ?auto_2743161 ?auto_2743181 ) ) ( not ( = ?auto_2743165 ?auto_2743167 ) ) ( not ( = ?auto_2743165 ?auto_2743166 ) ) ( not ( = ?auto_2743165 ?auto_2743168 ) ) ( not ( = ?auto_2743165 ?auto_2743169 ) ) ( not ( = ?auto_2743165 ?auto_2743170 ) ) ( not ( = ?auto_2743165 ?auto_2743171 ) ) ( not ( = ?auto_2743165 ?auto_2743172 ) ) ( not ( = ?auto_2743165 ?auto_2743173 ) ) ( not ( = ?auto_2743165 ?auto_2743174 ) ) ( not ( = ?auto_2743165 ?auto_2743175 ) ) ( not ( = ?auto_2743165 ?auto_2743176 ) ) ( not ( = ?auto_2743165 ?auto_2743181 ) ) ( not ( = ?auto_2743167 ?auto_2743166 ) ) ( not ( = ?auto_2743167 ?auto_2743168 ) ) ( not ( = ?auto_2743167 ?auto_2743169 ) ) ( not ( = ?auto_2743167 ?auto_2743170 ) ) ( not ( = ?auto_2743167 ?auto_2743171 ) ) ( not ( = ?auto_2743167 ?auto_2743172 ) ) ( not ( = ?auto_2743167 ?auto_2743173 ) ) ( not ( = ?auto_2743167 ?auto_2743174 ) ) ( not ( = ?auto_2743167 ?auto_2743175 ) ) ( not ( = ?auto_2743167 ?auto_2743176 ) ) ( not ( = ?auto_2743167 ?auto_2743181 ) ) ( not ( = ?auto_2743166 ?auto_2743168 ) ) ( not ( = ?auto_2743166 ?auto_2743169 ) ) ( not ( = ?auto_2743166 ?auto_2743170 ) ) ( not ( = ?auto_2743166 ?auto_2743171 ) ) ( not ( = ?auto_2743166 ?auto_2743172 ) ) ( not ( = ?auto_2743166 ?auto_2743173 ) ) ( not ( = ?auto_2743166 ?auto_2743174 ) ) ( not ( = ?auto_2743166 ?auto_2743175 ) ) ( not ( = ?auto_2743166 ?auto_2743176 ) ) ( not ( = ?auto_2743166 ?auto_2743181 ) ) ( not ( = ?auto_2743168 ?auto_2743169 ) ) ( not ( = ?auto_2743168 ?auto_2743170 ) ) ( not ( = ?auto_2743168 ?auto_2743171 ) ) ( not ( = ?auto_2743168 ?auto_2743172 ) ) ( not ( = ?auto_2743168 ?auto_2743173 ) ) ( not ( = ?auto_2743168 ?auto_2743174 ) ) ( not ( = ?auto_2743168 ?auto_2743175 ) ) ( not ( = ?auto_2743168 ?auto_2743176 ) ) ( not ( = ?auto_2743168 ?auto_2743181 ) ) ( not ( = ?auto_2743169 ?auto_2743170 ) ) ( not ( = ?auto_2743169 ?auto_2743171 ) ) ( not ( = ?auto_2743169 ?auto_2743172 ) ) ( not ( = ?auto_2743169 ?auto_2743173 ) ) ( not ( = ?auto_2743169 ?auto_2743174 ) ) ( not ( = ?auto_2743169 ?auto_2743175 ) ) ( not ( = ?auto_2743169 ?auto_2743176 ) ) ( not ( = ?auto_2743169 ?auto_2743181 ) ) ( not ( = ?auto_2743170 ?auto_2743171 ) ) ( not ( = ?auto_2743170 ?auto_2743172 ) ) ( not ( = ?auto_2743170 ?auto_2743173 ) ) ( not ( = ?auto_2743170 ?auto_2743174 ) ) ( not ( = ?auto_2743170 ?auto_2743175 ) ) ( not ( = ?auto_2743170 ?auto_2743176 ) ) ( not ( = ?auto_2743170 ?auto_2743181 ) ) ( not ( = ?auto_2743171 ?auto_2743172 ) ) ( not ( = ?auto_2743171 ?auto_2743173 ) ) ( not ( = ?auto_2743171 ?auto_2743174 ) ) ( not ( = ?auto_2743171 ?auto_2743175 ) ) ( not ( = ?auto_2743171 ?auto_2743176 ) ) ( not ( = ?auto_2743171 ?auto_2743181 ) ) ( not ( = ?auto_2743172 ?auto_2743173 ) ) ( not ( = ?auto_2743172 ?auto_2743174 ) ) ( not ( = ?auto_2743172 ?auto_2743175 ) ) ( not ( = ?auto_2743172 ?auto_2743176 ) ) ( not ( = ?auto_2743172 ?auto_2743181 ) ) ( not ( = ?auto_2743173 ?auto_2743174 ) ) ( not ( = ?auto_2743173 ?auto_2743175 ) ) ( not ( = ?auto_2743173 ?auto_2743176 ) ) ( not ( = ?auto_2743173 ?auto_2743181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2743174 ?auto_2743175 ?auto_2743176 )
      ( MAKE-15CRATE-VERIFY ?auto_2743162 ?auto_2743163 ?auto_2743164 ?auto_2743161 ?auto_2743165 ?auto_2743167 ?auto_2743166 ?auto_2743168 ?auto_2743169 ?auto_2743170 ?auto_2743171 ?auto_2743172 ?auto_2743173 ?auto_2743174 ?auto_2743175 ?auto_2743176 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2743388 - SURFACE
      ?auto_2743389 - SURFACE
      ?auto_2743390 - SURFACE
      ?auto_2743387 - SURFACE
      ?auto_2743391 - SURFACE
      ?auto_2743393 - SURFACE
      ?auto_2743392 - SURFACE
      ?auto_2743394 - SURFACE
      ?auto_2743395 - SURFACE
      ?auto_2743396 - SURFACE
      ?auto_2743397 - SURFACE
      ?auto_2743398 - SURFACE
      ?auto_2743399 - SURFACE
      ?auto_2743400 - SURFACE
      ?auto_2743401 - SURFACE
      ?auto_2743402 - SURFACE
    )
    :vars
    (
      ?auto_2743408 - HOIST
      ?auto_2743406 - PLACE
      ?auto_2743405 - PLACE
      ?auto_2743403 - HOIST
      ?auto_2743407 - SURFACE
      ?auto_2743404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2743408 ?auto_2743406 ) ( IS-CRATE ?auto_2743402 ) ( not ( = ?auto_2743401 ?auto_2743402 ) ) ( not ( = ?auto_2743400 ?auto_2743401 ) ) ( not ( = ?auto_2743400 ?auto_2743402 ) ) ( not ( = ?auto_2743405 ?auto_2743406 ) ) ( HOIST-AT ?auto_2743403 ?auto_2743405 ) ( not ( = ?auto_2743408 ?auto_2743403 ) ) ( AVAILABLE ?auto_2743403 ) ( SURFACE-AT ?auto_2743402 ?auto_2743405 ) ( ON ?auto_2743402 ?auto_2743407 ) ( CLEAR ?auto_2743402 ) ( not ( = ?auto_2743401 ?auto_2743407 ) ) ( not ( = ?auto_2743402 ?auto_2743407 ) ) ( not ( = ?auto_2743400 ?auto_2743407 ) ) ( TRUCK-AT ?auto_2743404 ?auto_2743406 ) ( SURFACE-AT ?auto_2743400 ?auto_2743406 ) ( CLEAR ?auto_2743400 ) ( LIFTING ?auto_2743408 ?auto_2743401 ) ( IS-CRATE ?auto_2743401 ) ( ON ?auto_2743389 ?auto_2743388 ) ( ON ?auto_2743390 ?auto_2743389 ) ( ON ?auto_2743387 ?auto_2743390 ) ( ON ?auto_2743391 ?auto_2743387 ) ( ON ?auto_2743393 ?auto_2743391 ) ( ON ?auto_2743392 ?auto_2743393 ) ( ON ?auto_2743394 ?auto_2743392 ) ( ON ?auto_2743395 ?auto_2743394 ) ( ON ?auto_2743396 ?auto_2743395 ) ( ON ?auto_2743397 ?auto_2743396 ) ( ON ?auto_2743398 ?auto_2743397 ) ( ON ?auto_2743399 ?auto_2743398 ) ( ON ?auto_2743400 ?auto_2743399 ) ( not ( = ?auto_2743388 ?auto_2743389 ) ) ( not ( = ?auto_2743388 ?auto_2743390 ) ) ( not ( = ?auto_2743388 ?auto_2743387 ) ) ( not ( = ?auto_2743388 ?auto_2743391 ) ) ( not ( = ?auto_2743388 ?auto_2743393 ) ) ( not ( = ?auto_2743388 ?auto_2743392 ) ) ( not ( = ?auto_2743388 ?auto_2743394 ) ) ( not ( = ?auto_2743388 ?auto_2743395 ) ) ( not ( = ?auto_2743388 ?auto_2743396 ) ) ( not ( = ?auto_2743388 ?auto_2743397 ) ) ( not ( = ?auto_2743388 ?auto_2743398 ) ) ( not ( = ?auto_2743388 ?auto_2743399 ) ) ( not ( = ?auto_2743388 ?auto_2743400 ) ) ( not ( = ?auto_2743388 ?auto_2743401 ) ) ( not ( = ?auto_2743388 ?auto_2743402 ) ) ( not ( = ?auto_2743388 ?auto_2743407 ) ) ( not ( = ?auto_2743389 ?auto_2743390 ) ) ( not ( = ?auto_2743389 ?auto_2743387 ) ) ( not ( = ?auto_2743389 ?auto_2743391 ) ) ( not ( = ?auto_2743389 ?auto_2743393 ) ) ( not ( = ?auto_2743389 ?auto_2743392 ) ) ( not ( = ?auto_2743389 ?auto_2743394 ) ) ( not ( = ?auto_2743389 ?auto_2743395 ) ) ( not ( = ?auto_2743389 ?auto_2743396 ) ) ( not ( = ?auto_2743389 ?auto_2743397 ) ) ( not ( = ?auto_2743389 ?auto_2743398 ) ) ( not ( = ?auto_2743389 ?auto_2743399 ) ) ( not ( = ?auto_2743389 ?auto_2743400 ) ) ( not ( = ?auto_2743389 ?auto_2743401 ) ) ( not ( = ?auto_2743389 ?auto_2743402 ) ) ( not ( = ?auto_2743389 ?auto_2743407 ) ) ( not ( = ?auto_2743390 ?auto_2743387 ) ) ( not ( = ?auto_2743390 ?auto_2743391 ) ) ( not ( = ?auto_2743390 ?auto_2743393 ) ) ( not ( = ?auto_2743390 ?auto_2743392 ) ) ( not ( = ?auto_2743390 ?auto_2743394 ) ) ( not ( = ?auto_2743390 ?auto_2743395 ) ) ( not ( = ?auto_2743390 ?auto_2743396 ) ) ( not ( = ?auto_2743390 ?auto_2743397 ) ) ( not ( = ?auto_2743390 ?auto_2743398 ) ) ( not ( = ?auto_2743390 ?auto_2743399 ) ) ( not ( = ?auto_2743390 ?auto_2743400 ) ) ( not ( = ?auto_2743390 ?auto_2743401 ) ) ( not ( = ?auto_2743390 ?auto_2743402 ) ) ( not ( = ?auto_2743390 ?auto_2743407 ) ) ( not ( = ?auto_2743387 ?auto_2743391 ) ) ( not ( = ?auto_2743387 ?auto_2743393 ) ) ( not ( = ?auto_2743387 ?auto_2743392 ) ) ( not ( = ?auto_2743387 ?auto_2743394 ) ) ( not ( = ?auto_2743387 ?auto_2743395 ) ) ( not ( = ?auto_2743387 ?auto_2743396 ) ) ( not ( = ?auto_2743387 ?auto_2743397 ) ) ( not ( = ?auto_2743387 ?auto_2743398 ) ) ( not ( = ?auto_2743387 ?auto_2743399 ) ) ( not ( = ?auto_2743387 ?auto_2743400 ) ) ( not ( = ?auto_2743387 ?auto_2743401 ) ) ( not ( = ?auto_2743387 ?auto_2743402 ) ) ( not ( = ?auto_2743387 ?auto_2743407 ) ) ( not ( = ?auto_2743391 ?auto_2743393 ) ) ( not ( = ?auto_2743391 ?auto_2743392 ) ) ( not ( = ?auto_2743391 ?auto_2743394 ) ) ( not ( = ?auto_2743391 ?auto_2743395 ) ) ( not ( = ?auto_2743391 ?auto_2743396 ) ) ( not ( = ?auto_2743391 ?auto_2743397 ) ) ( not ( = ?auto_2743391 ?auto_2743398 ) ) ( not ( = ?auto_2743391 ?auto_2743399 ) ) ( not ( = ?auto_2743391 ?auto_2743400 ) ) ( not ( = ?auto_2743391 ?auto_2743401 ) ) ( not ( = ?auto_2743391 ?auto_2743402 ) ) ( not ( = ?auto_2743391 ?auto_2743407 ) ) ( not ( = ?auto_2743393 ?auto_2743392 ) ) ( not ( = ?auto_2743393 ?auto_2743394 ) ) ( not ( = ?auto_2743393 ?auto_2743395 ) ) ( not ( = ?auto_2743393 ?auto_2743396 ) ) ( not ( = ?auto_2743393 ?auto_2743397 ) ) ( not ( = ?auto_2743393 ?auto_2743398 ) ) ( not ( = ?auto_2743393 ?auto_2743399 ) ) ( not ( = ?auto_2743393 ?auto_2743400 ) ) ( not ( = ?auto_2743393 ?auto_2743401 ) ) ( not ( = ?auto_2743393 ?auto_2743402 ) ) ( not ( = ?auto_2743393 ?auto_2743407 ) ) ( not ( = ?auto_2743392 ?auto_2743394 ) ) ( not ( = ?auto_2743392 ?auto_2743395 ) ) ( not ( = ?auto_2743392 ?auto_2743396 ) ) ( not ( = ?auto_2743392 ?auto_2743397 ) ) ( not ( = ?auto_2743392 ?auto_2743398 ) ) ( not ( = ?auto_2743392 ?auto_2743399 ) ) ( not ( = ?auto_2743392 ?auto_2743400 ) ) ( not ( = ?auto_2743392 ?auto_2743401 ) ) ( not ( = ?auto_2743392 ?auto_2743402 ) ) ( not ( = ?auto_2743392 ?auto_2743407 ) ) ( not ( = ?auto_2743394 ?auto_2743395 ) ) ( not ( = ?auto_2743394 ?auto_2743396 ) ) ( not ( = ?auto_2743394 ?auto_2743397 ) ) ( not ( = ?auto_2743394 ?auto_2743398 ) ) ( not ( = ?auto_2743394 ?auto_2743399 ) ) ( not ( = ?auto_2743394 ?auto_2743400 ) ) ( not ( = ?auto_2743394 ?auto_2743401 ) ) ( not ( = ?auto_2743394 ?auto_2743402 ) ) ( not ( = ?auto_2743394 ?auto_2743407 ) ) ( not ( = ?auto_2743395 ?auto_2743396 ) ) ( not ( = ?auto_2743395 ?auto_2743397 ) ) ( not ( = ?auto_2743395 ?auto_2743398 ) ) ( not ( = ?auto_2743395 ?auto_2743399 ) ) ( not ( = ?auto_2743395 ?auto_2743400 ) ) ( not ( = ?auto_2743395 ?auto_2743401 ) ) ( not ( = ?auto_2743395 ?auto_2743402 ) ) ( not ( = ?auto_2743395 ?auto_2743407 ) ) ( not ( = ?auto_2743396 ?auto_2743397 ) ) ( not ( = ?auto_2743396 ?auto_2743398 ) ) ( not ( = ?auto_2743396 ?auto_2743399 ) ) ( not ( = ?auto_2743396 ?auto_2743400 ) ) ( not ( = ?auto_2743396 ?auto_2743401 ) ) ( not ( = ?auto_2743396 ?auto_2743402 ) ) ( not ( = ?auto_2743396 ?auto_2743407 ) ) ( not ( = ?auto_2743397 ?auto_2743398 ) ) ( not ( = ?auto_2743397 ?auto_2743399 ) ) ( not ( = ?auto_2743397 ?auto_2743400 ) ) ( not ( = ?auto_2743397 ?auto_2743401 ) ) ( not ( = ?auto_2743397 ?auto_2743402 ) ) ( not ( = ?auto_2743397 ?auto_2743407 ) ) ( not ( = ?auto_2743398 ?auto_2743399 ) ) ( not ( = ?auto_2743398 ?auto_2743400 ) ) ( not ( = ?auto_2743398 ?auto_2743401 ) ) ( not ( = ?auto_2743398 ?auto_2743402 ) ) ( not ( = ?auto_2743398 ?auto_2743407 ) ) ( not ( = ?auto_2743399 ?auto_2743400 ) ) ( not ( = ?auto_2743399 ?auto_2743401 ) ) ( not ( = ?auto_2743399 ?auto_2743402 ) ) ( not ( = ?auto_2743399 ?auto_2743407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2743400 ?auto_2743401 ?auto_2743402 )
      ( MAKE-15CRATE-VERIFY ?auto_2743388 ?auto_2743389 ?auto_2743390 ?auto_2743387 ?auto_2743391 ?auto_2743393 ?auto_2743392 ?auto_2743394 ?auto_2743395 ?auto_2743396 ?auto_2743397 ?auto_2743398 ?auto_2743399 ?auto_2743400 ?auto_2743401 ?auto_2743402 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2743614 - SURFACE
      ?auto_2743615 - SURFACE
      ?auto_2743616 - SURFACE
      ?auto_2743613 - SURFACE
      ?auto_2743617 - SURFACE
      ?auto_2743619 - SURFACE
      ?auto_2743618 - SURFACE
      ?auto_2743620 - SURFACE
      ?auto_2743621 - SURFACE
      ?auto_2743622 - SURFACE
      ?auto_2743623 - SURFACE
      ?auto_2743624 - SURFACE
      ?auto_2743625 - SURFACE
      ?auto_2743626 - SURFACE
      ?auto_2743627 - SURFACE
      ?auto_2743628 - SURFACE
    )
    :vars
    (
      ?auto_2743632 - HOIST
      ?auto_2743629 - PLACE
      ?auto_2743634 - PLACE
      ?auto_2743631 - HOIST
      ?auto_2743633 - SURFACE
      ?auto_2743630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2743632 ?auto_2743629 ) ( IS-CRATE ?auto_2743628 ) ( not ( = ?auto_2743627 ?auto_2743628 ) ) ( not ( = ?auto_2743626 ?auto_2743627 ) ) ( not ( = ?auto_2743626 ?auto_2743628 ) ) ( not ( = ?auto_2743634 ?auto_2743629 ) ) ( HOIST-AT ?auto_2743631 ?auto_2743634 ) ( not ( = ?auto_2743632 ?auto_2743631 ) ) ( AVAILABLE ?auto_2743631 ) ( SURFACE-AT ?auto_2743628 ?auto_2743634 ) ( ON ?auto_2743628 ?auto_2743633 ) ( CLEAR ?auto_2743628 ) ( not ( = ?auto_2743627 ?auto_2743633 ) ) ( not ( = ?auto_2743628 ?auto_2743633 ) ) ( not ( = ?auto_2743626 ?auto_2743633 ) ) ( TRUCK-AT ?auto_2743630 ?auto_2743629 ) ( SURFACE-AT ?auto_2743626 ?auto_2743629 ) ( CLEAR ?auto_2743626 ) ( IS-CRATE ?auto_2743627 ) ( AVAILABLE ?auto_2743632 ) ( IN ?auto_2743627 ?auto_2743630 ) ( ON ?auto_2743615 ?auto_2743614 ) ( ON ?auto_2743616 ?auto_2743615 ) ( ON ?auto_2743613 ?auto_2743616 ) ( ON ?auto_2743617 ?auto_2743613 ) ( ON ?auto_2743619 ?auto_2743617 ) ( ON ?auto_2743618 ?auto_2743619 ) ( ON ?auto_2743620 ?auto_2743618 ) ( ON ?auto_2743621 ?auto_2743620 ) ( ON ?auto_2743622 ?auto_2743621 ) ( ON ?auto_2743623 ?auto_2743622 ) ( ON ?auto_2743624 ?auto_2743623 ) ( ON ?auto_2743625 ?auto_2743624 ) ( ON ?auto_2743626 ?auto_2743625 ) ( not ( = ?auto_2743614 ?auto_2743615 ) ) ( not ( = ?auto_2743614 ?auto_2743616 ) ) ( not ( = ?auto_2743614 ?auto_2743613 ) ) ( not ( = ?auto_2743614 ?auto_2743617 ) ) ( not ( = ?auto_2743614 ?auto_2743619 ) ) ( not ( = ?auto_2743614 ?auto_2743618 ) ) ( not ( = ?auto_2743614 ?auto_2743620 ) ) ( not ( = ?auto_2743614 ?auto_2743621 ) ) ( not ( = ?auto_2743614 ?auto_2743622 ) ) ( not ( = ?auto_2743614 ?auto_2743623 ) ) ( not ( = ?auto_2743614 ?auto_2743624 ) ) ( not ( = ?auto_2743614 ?auto_2743625 ) ) ( not ( = ?auto_2743614 ?auto_2743626 ) ) ( not ( = ?auto_2743614 ?auto_2743627 ) ) ( not ( = ?auto_2743614 ?auto_2743628 ) ) ( not ( = ?auto_2743614 ?auto_2743633 ) ) ( not ( = ?auto_2743615 ?auto_2743616 ) ) ( not ( = ?auto_2743615 ?auto_2743613 ) ) ( not ( = ?auto_2743615 ?auto_2743617 ) ) ( not ( = ?auto_2743615 ?auto_2743619 ) ) ( not ( = ?auto_2743615 ?auto_2743618 ) ) ( not ( = ?auto_2743615 ?auto_2743620 ) ) ( not ( = ?auto_2743615 ?auto_2743621 ) ) ( not ( = ?auto_2743615 ?auto_2743622 ) ) ( not ( = ?auto_2743615 ?auto_2743623 ) ) ( not ( = ?auto_2743615 ?auto_2743624 ) ) ( not ( = ?auto_2743615 ?auto_2743625 ) ) ( not ( = ?auto_2743615 ?auto_2743626 ) ) ( not ( = ?auto_2743615 ?auto_2743627 ) ) ( not ( = ?auto_2743615 ?auto_2743628 ) ) ( not ( = ?auto_2743615 ?auto_2743633 ) ) ( not ( = ?auto_2743616 ?auto_2743613 ) ) ( not ( = ?auto_2743616 ?auto_2743617 ) ) ( not ( = ?auto_2743616 ?auto_2743619 ) ) ( not ( = ?auto_2743616 ?auto_2743618 ) ) ( not ( = ?auto_2743616 ?auto_2743620 ) ) ( not ( = ?auto_2743616 ?auto_2743621 ) ) ( not ( = ?auto_2743616 ?auto_2743622 ) ) ( not ( = ?auto_2743616 ?auto_2743623 ) ) ( not ( = ?auto_2743616 ?auto_2743624 ) ) ( not ( = ?auto_2743616 ?auto_2743625 ) ) ( not ( = ?auto_2743616 ?auto_2743626 ) ) ( not ( = ?auto_2743616 ?auto_2743627 ) ) ( not ( = ?auto_2743616 ?auto_2743628 ) ) ( not ( = ?auto_2743616 ?auto_2743633 ) ) ( not ( = ?auto_2743613 ?auto_2743617 ) ) ( not ( = ?auto_2743613 ?auto_2743619 ) ) ( not ( = ?auto_2743613 ?auto_2743618 ) ) ( not ( = ?auto_2743613 ?auto_2743620 ) ) ( not ( = ?auto_2743613 ?auto_2743621 ) ) ( not ( = ?auto_2743613 ?auto_2743622 ) ) ( not ( = ?auto_2743613 ?auto_2743623 ) ) ( not ( = ?auto_2743613 ?auto_2743624 ) ) ( not ( = ?auto_2743613 ?auto_2743625 ) ) ( not ( = ?auto_2743613 ?auto_2743626 ) ) ( not ( = ?auto_2743613 ?auto_2743627 ) ) ( not ( = ?auto_2743613 ?auto_2743628 ) ) ( not ( = ?auto_2743613 ?auto_2743633 ) ) ( not ( = ?auto_2743617 ?auto_2743619 ) ) ( not ( = ?auto_2743617 ?auto_2743618 ) ) ( not ( = ?auto_2743617 ?auto_2743620 ) ) ( not ( = ?auto_2743617 ?auto_2743621 ) ) ( not ( = ?auto_2743617 ?auto_2743622 ) ) ( not ( = ?auto_2743617 ?auto_2743623 ) ) ( not ( = ?auto_2743617 ?auto_2743624 ) ) ( not ( = ?auto_2743617 ?auto_2743625 ) ) ( not ( = ?auto_2743617 ?auto_2743626 ) ) ( not ( = ?auto_2743617 ?auto_2743627 ) ) ( not ( = ?auto_2743617 ?auto_2743628 ) ) ( not ( = ?auto_2743617 ?auto_2743633 ) ) ( not ( = ?auto_2743619 ?auto_2743618 ) ) ( not ( = ?auto_2743619 ?auto_2743620 ) ) ( not ( = ?auto_2743619 ?auto_2743621 ) ) ( not ( = ?auto_2743619 ?auto_2743622 ) ) ( not ( = ?auto_2743619 ?auto_2743623 ) ) ( not ( = ?auto_2743619 ?auto_2743624 ) ) ( not ( = ?auto_2743619 ?auto_2743625 ) ) ( not ( = ?auto_2743619 ?auto_2743626 ) ) ( not ( = ?auto_2743619 ?auto_2743627 ) ) ( not ( = ?auto_2743619 ?auto_2743628 ) ) ( not ( = ?auto_2743619 ?auto_2743633 ) ) ( not ( = ?auto_2743618 ?auto_2743620 ) ) ( not ( = ?auto_2743618 ?auto_2743621 ) ) ( not ( = ?auto_2743618 ?auto_2743622 ) ) ( not ( = ?auto_2743618 ?auto_2743623 ) ) ( not ( = ?auto_2743618 ?auto_2743624 ) ) ( not ( = ?auto_2743618 ?auto_2743625 ) ) ( not ( = ?auto_2743618 ?auto_2743626 ) ) ( not ( = ?auto_2743618 ?auto_2743627 ) ) ( not ( = ?auto_2743618 ?auto_2743628 ) ) ( not ( = ?auto_2743618 ?auto_2743633 ) ) ( not ( = ?auto_2743620 ?auto_2743621 ) ) ( not ( = ?auto_2743620 ?auto_2743622 ) ) ( not ( = ?auto_2743620 ?auto_2743623 ) ) ( not ( = ?auto_2743620 ?auto_2743624 ) ) ( not ( = ?auto_2743620 ?auto_2743625 ) ) ( not ( = ?auto_2743620 ?auto_2743626 ) ) ( not ( = ?auto_2743620 ?auto_2743627 ) ) ( not ( = ?auto_2743620 ?auto_2743628 ) ) ( not ( = ?auto_2743620 ?auto_2743633 ) ) ( not ( = ?auto_2743621 ?auto_2743622 ) ) ( not ( = ?auto_2743621 ?auto_2743623 ) ) ( not ( = ?auto_2743621 ?auto_2743624 ) ) ( not ( = ?auto_2743621 ?auto_2743625 ) ) ( not ( = ?auto_2743621 ?auto_2743626 ) ) ( not ( = ?auto_2743621 ?auto_2743627 ) ) ( not ( = ?auto_2743621 ?auto_2743628 ) ) ( not ( = ?auto_2743621 ?auto_2743633 ) ) ( not ( = ?auto_2743622 ?auto_2743623 ) ) ( not ( = ?auto_2743622 ?auto_2743624 ) ) ( not ( = ?auto_2743622 ?auto_2743625 ) ) ( not ( = ?auto_2743622 ?auto_2743626 ) ) ( not ( = ?auto_2743622 ?auto_2743627 ) ) ( not ( = ?auto_2743622 ?auto_2743628 ) ) ( not ( = ?auto_2743622 ?auto_2743633 ) ) ( not ( = ?auto_2743623 ?auto_2743624 ) ) ( not ( = ?auto_2743623 ?auto_2743625 ) ) ( not ( = ?auto_2743623 ?auto_2743626 ) ) ( not ( = ?auto_2743623 ?auto_2743627 ) ) ( not ( = ?auto_2743623 ?auto_2743628 ) ) ( not ( = ?auto_2743623 ?auto_2743633 ) ) ( not ( = ?auto_2743624 ?auto_2743625 ) ) ( not ( = ?auto_2743624 ?auto_2743626 ) ) ( not ( = ?auto_2743624 ?auto_2743627 ) ) ( not ( = ?auto_2743624 ?auto_2743628 ) ) ( not ( = ?auto_2743624 ?auto_2743633 ) ) ( not ( = ?auto_2743625 ?auto_2743626 ) ) ( not ( = ?auto_2743625 ?auto_2743627 ) ) ( not ( = ?auto_2743625 ?auto_2743628 ) ) ( not ( = ?auto_2743625 ?auto_2743633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2743626 ?auto_2743627 ?auto_2743628 )
      ( MAKE-15CRATE-VERIFY ?auto_2743614 ?auto_2743615 ?auto_2743616 ?auto_2743613 ?auto_2743617 ?auto_2743619 ?auto_2743618 ?auto_2743620 ?auto_2743621 ?auto_2743622 ?auto_2743623 ?auto_2743624 ?auto_2743625 ?auto_2743626 ?auto_2743627 ?auto_2743628 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764070 - SURFACE
      ?auto_2764071 - SURFACE
      ?auto_2764072 - SURFACE
      ?auto_2764069 - SURFACE
      ?auto_2764073 - SURFACE
      ?auto_2764075 - SURFACE
      ?auto_2764074 - SURFACE
      ?auto_2764076 - SURFACE
      ?auto_2764077 - SURFACE
      ?auto_2764078 - SURFACE
      ?auto_2764079 - SURFACE
      ?auto_2764080 - SURFACE
      ?auto_2764081 - SURFACE
      ?auto_2764082 - SURFACE
      ?auto_2764083 - SURFACE
      ?auto_2764084 - SURFACE
      ?auto_2764085 - SURFACE
    )
    :vars
    (
      ?auto_2764086 - HOIST
      ?auto_2764087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764086 ?auto_2764087 ) ( SURFACE-AT ?auto_2764084 ?auto_2764087 ) ( CLEAR ?auto_2764084 ) ( LIFTING ?auto_2764086 ?auto_2764085 ) ( IS-CRATE ?auto_2764085 ) ( not ( = ?auto_2764084 ?auto_2764085 ) ) ( ON ?auto_2764071 ?auto_2764070 ) ( ON ?auto_2764072 ?auto_2764071 ) ( ON ?auto_2764069 ?auto_2764072 ) ( ON ?auto_2764073 ?auto_2764069 ) ( ON ?auto_2764075 ?auto_2764073 ) ( ON ?auto_2764074 ?auto_2764075 ) ( ON ?auto_2764076 ?auto_2764074 ) ( ON ?auto_2764077 ?auto_2764076 ) ( ON ?auto_2764078 ?auto_2764077 ) ( ON ?auto_2764079 ?auto_2764078 ) ( ON ?auto_2764080 ?auto_2764079 ) ( ON ?auto_2764081 ?auto_2764080 ) ( ON ?auto_2764082 ?auto_2764081 ) ( ON ?auto_2764083 ?auto_2764082 ) ( ON ?auto_2764084 ?auto_2764083 ) ( not ( = ?auto_2764070 ?auto_2764071 ) ) ( not ( = ?auto_2764070 ?auto_2764072 ) ) ( not ( = ?auto_2764070 ?auto_2764069 ) ) ( not ( = ?auto_2764070 ?auto_2764073 ) ) ( not ( = ?auto_2764070 ?auto_2764075 ) ) ( not ( = ?auto_2764070 ?auto_2764074 ) ) ( not ( = ?auto_2764070 ?auto_2764076 ) ) ( not ( = ?auto_2764070 ?auto_2764077 ) ) ( not ( = ?auto_2764070 ?auto_2764078 ) ) ( not ( = ?auto_2764070 ?auto_2764079 ) ) ( not ( = ?auto_2764070 ?auto_2764080 ) ) ( not ( = ?auto_2764070 ?auto_2764081 ) ) ( not ( = ?auto_2764070 ?auto_2764082 ) ) ( not ( = ?auto_2764070 ?auto_2764083 ) ) ( not ( = ?auto_2764070 ?auto_2764084 ) ) ( not ( = ?auto_2764070 ?auto_2764085 ) ) ( not ( = ?auto_2764071 ?auto_2764072 ) ) ( not ( = ?auto_2764071 ?auto_2764069 ) ) ( not ( = ?auto_2764071 ?auto_2764073 ) ) ( not ( = ?auto_2764071 ?auto_2764075 ) ) ( not ( = ?auto_2764071 ?auto_2764074 ) ) ( not ( = ?auto_2764071 ?auto_2764076 ) ) ( not ( = ?auto_2764071 ?auto_2764077 ) ) ( not ( = ?auto_2764071 ?auto_2764078 ) ) ( not ( = ?auto_2764071 ?auto_2764079 ) ) ( not ( = ?auto_2764071 ?auto_2764080 ) ) ( not ( = ?auto_2764071 ?auto_2764081 ) ) ( not ( = ?auto_2764071 ?auto_2764082 ) ) ( not ( = ?auto_2764071 ?auto_2764083 ) ) ( not ( = ?auto_2764071 ?auto_2764084 ) ) ( not ( = ?auto_2764071 ?auto_2764085 ) ) ( not ( = ?auto_2764072 ?auto_2764069 ) ) ( not ( = ?auto_2764072 ?auto_2764073 ) ) ( not ( = ?auto_2764072 ?auto_2764075 ) ) ( not ( = ?auto_2764072 ?auto_2764074 ) ) ( not ( = ?auto_2764072 ?auto_2764076 ) ) ( not ( = ?auto_2764072 ?auto_2764077 ) ) ( not ( = ?auto_2764072 ?auto_2764078 ) ) ( not ( = ?auto_2764072 ?auto_2764079 ) ) ( not ( = ?auto_2764072 ?auto_2764080 ) ) ( not ( = ?auto_2764072 ?auto_2764081 ) ) ( not ( = ?auto_2764072 ?auto_2764082 ) ) ( not ( = ?auto_2764072 ?auto_2764083 ) ) ( not ( = ?auto_2764072 ?auto_2764084 ) ) ( not ( = ?auto_2764072 ?auto_2764085 ) ) ( not ( = ?auto_2764069 ?auto_2764073 ) ) ( not ( = ?auto_2764069 ?auto_2764075 ) ) ( not ( = ?auto_2764069 ?auto_2764074 ) ) ( not ( = ?auto_2764069 ?auto_2764076 ) ) ( not ( = ?auto_2764069 ?auto_2764077 ) ) ( not ( = ?auto_2764069 ?auto_2764078 ) ) ( not ( = ?auto_2764069 ?auto_2764079 ) ) ( not ( = ?auto_2764069 ?auto_2764080 ) ) ( not ( = ?auto_2764069 ?auto_2764081 ) ) ( not ( = ?auto_2764069 ?auto_2764082 ) ) ( not ( = ?auto_2764069 ?auto_2764083 ) ) ( not ( = ?auto_2764069 ?auto_2764084 ) ) ( not ( = ?auto_2764069 ?auto_2764085 ) ) ( not ( = ?auto_2764073 ?auto_2764075 ) ) ( not ( = ?auto_2764073 ?auto_2764074 ) ) ( not ( = ?auto_2764073 ?auto_2764076 ) ) ( not ( = ?auto_2764073 ?auto_2764077 ) ) ( not ( = ?auto_2764073 ?auto_2764078 ) ) ( not ( = ?auto_2764073 ?auto_2764079 ) ) ( not ( = ?auto_2764073 ?auto_2764080 ) ) ( not ( = ?auto_2764073 ?auto_2764081 ) ) ( not ( = ?auto_2764073 ?auto_2764082 ) ) ( not ( = ?auto_2764073 ?auto_2764083 ) ) ( not ( = ?auto_2764073 ?auto_2764084 ) ) ( not ( = ?auto_2764073 ?auto_2764085 ) ) ( not ( = ?auto_2764075 ?auto_2764074 ) ) ( not ( = ?auto_2764075 ?auto_2764076 ) ) ( not ( = ?auto_2764075 ?auto_2764077 ) ) ( not ( = ?auto_2764075 ?auto_2764078 ) ) ( not ( = ?auto_2764075 ?auto_2764079 ) ) ( not ( = ?auto_2764075 ?auto_2764080 ) ) ( not ( = ?auto_2764075 ?auto_2764081 ) ) ( not ( = ?auto_2764075 ?auto_2764082 ) ) ( not ( = ?auto_2764075 ?auto_2764083 ) ) ( not ( = ?auto_2764075 ?auto_2764084 ) ) ( not ( = ?auto_2764075 ?auto_2764085 ) ) ( not ( = ?auto_2764074 ?auto_2764076 ) ) ( not ( = ?auto_2764074 ?auto_2764077 ) ) ( not ( = ?auto_2764074 ?auto_2764078 ) ) ( not ( = ?auto_2764074 ?auto_2764079 ) ) ( not ( = ?auto_2764074 ?auto_2764080 ) ) ( not ( = ?auto_2764074 ?auto_2764081 ) ) ( not ( = ?auto_2764074 ?auto_2764082 ) ) ( not ( = ?auto_2764074 ?auto_2764083 ) ) ( not ( = ?auto_2764074 ?auto_2764084 ) ) ( not ( = ?auto_2764074 ?auto_2764085 ) ) ( not ( = ?auto_2764076 ?auto_2764077 ) ) ( not ( = ?auto_2764076 ?auto_2764078 ) ) ( not ( = ?auto_2764076 ?auto_2764079 ) ) ( not ( = ?auto_2764076 ?auto_2764080 ) ) ( not ( = ?auto_2764076 ?auto_2764081 ) ) ( not ( = ?auto_2764076 ?auto_2764082 ) ) ( not ( = ?auto_2764076 ?auto_2764083 ) ) ( not ( = ?auto_2764076 ?auto_2764084 ) ) ( not ( = ?auto_2764076 ?auto_2764085 ) ) ( not ( = ?auto_2764077 ?auto_2764078 ) ) ( not ( = ?auto_2764077 ?auto_2764079 ) ) ( not ( = ?auto_2764077 ?auto_2764080 ) ) ( not ( = ?auto_2764077 ?auto_2764081 ) ) ( not ( = ?auto_2764077 ?auto_2764082 ) ) ( not ( = ?auto_2764077 ?auto_2764083 ) ) ( not ( = ?auto_2764077 ?auto_2764084 ) ) ( not ( = ?auto_2764077 ?auto_2764085 ) ) ( not ( = ?auto_2764078 ?auto_2764079 ) ) ( not ( = ?auto_2764078 ?auto_2764080 ) ) ( not ( = ?auto_2764078 ?auto_2764081 ) ) ( not ( = ?auto_2764078 ?auto_2764082 ) ) ( not ( = ?auto_2764078 ?auto_2764083 ) ) ( not ( = ?auto_2764078 ?auto_2764084 ) ) ( not ( = ?auto_2764078 ?auto_2764085 ) ) ( not ( = ?auto_2764079 ?auto_2764080 ) ) ( not ( = ?auto_2764079 ?auto_2764081 ) ) ( not ( = ?auto_2764079 ?auto_2764082 ) ) ( not ( = ?auto_2764079 ?auto_2764083 ) ) ( not ( = ?auto_2764079 ?auto_2764084 ) ) ( not ( = ?auto_2764079 ?auto_2764085 ) ) ( not ( = ?auto_2764080 ?auto_2764081 ) ) ( not ( = ?auto_2764080 ?auto_2764082 ) ) ( not ( = ?auto_2764080 ?auto_2764083 ) ) ( not ( = ?auto_2764080 ?auto_2764084 ) ) ( not ( = ?auto_2764080 ?auto_2764085 ) ) ( not ( = ?auto_2764081 ?auto_2764082 ) ) ( not ( = ?auto_2764081 ?auto_2764083 ) ) ( not ( = ?auto_2764081 ?auto_2764084 ) ) ( not ( = ?auto_2764081 ?auto_2764085 ) ) ( not ( = ?auto_2764082 ?auto_2764083 ) ) ( not ( = ?auto_2764082 ?auto_2764084 ) ) ( not ( = ?auto_2764082 ?auto_2764085 ) ) ( not ( = ?auto_2764083 ?auto_2764084 ) ) ( not ( = ?auto_2764083 ?auto_2764085 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2764084 ?auto_2764085 )
      ( MAKE-16CRATE-VERIFY ?auto_2764070 ?auto_2764071 ?auto_2764072 ?auto_2764069 ?auto_2764073 ?auto_2764075 ?auto_2764074 ?auto_2764076 ?auto_2764077 ?auto_2764078 ?auto_2764079 ?auto_2764080 ?auto_2764081 ?auto_2764082 ?auto_2764083 ?auto_2764084 ?auto_2764085 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764269 - SURFACE
      ?auto_2764270 - SURFACE
      ?auto_2764271 - SURFACE
      ?auto_2764268 - SURFACE
      ?auto_2764272 - SURFACE
      ?auto_2764274 - SURFACE
      ?auto_2764273 - SURFACE
      ?auto_2764275 - SURFACE
      ?auto_2764276 - SURFACE
      ?auto_2764277 - SURFACE
      ?auto_2764278 - SURFACE
      ?auto_2764279 - SURFACE
      ?auto_2764280 - SURFACE
      ?auto_2764281 - SURFACE
      ?auto_2764282 - SURFACE
      ?auto_2764283 - SURFACE
      ?auto_2764284 - SURFACE
    )
    :vars
    (
      ?auto_2764287 - HOIST
      ?auto_2764286 - PLACE
      ?auto_2764285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764287 ?auto_2764286 ) ( SURFACE-AT ?auto_2764283 ?auto_2764286 ) ( CLEAR ?auto_2764283 ) ( IS-CRATE ?auto_2764284 ) ( not ( = ?auto_2764283 ?auto_2764284 ) ) ( TRUCK-AT ?auto_2764285 ?auto_2764286 ) ( AVAILABLE ?auto_2764287 ) ( IN ?auto_2764284 ?auto_2764285 ) ( ON ?auto_2764283 ?auto_2764282 ) ( not ( = ?auto_2764282 ?auto_2764283 ) ) ( not ( = ?auto_2764282 ?auto_2764284 ) ) ( ON ?auto_2764270 ?auto_2764269 ) ( ON ?auto_2764271 ?auto_2764270 ) ( ON ?auto_2764268 ?auto_2764271 ) ( ON ?auto_2764272 ?auto_2764268 ) ( ON ?auto_2764274 ?auto_2764272 ) ( ON ?auto_2764273 ?auto_2764274 ) ( ON ?auto_2764275 ?auto_2764273 ) ( ON ?auto_2764276 ?auto_2764275 ) ( ON ?auto_2764277 ?auto_2764276 ) ( ON ?auto_2764278 ?auto_2764277 ) ( ON ?auto_2764279 ?auto_2764278 ) ( ON ?auto_2764280 ?auto_2764279 ) ( ON ?auto_2764281 ?auto_2764280 ) ( ON ?auto_2764282 ?auto_2764281 ) ( not ( = ?auto_2764269 ?auto_2764270 ) ) ( not ( = ?auto_2764269 ?auto_2764271 ) ) ( not ( = ?auto_2764269 ?auto_2764268 ) ) ( not ( = ?auto_2764269 ?auto_2764272 ) ) ( not ( = ?auto_2764269 ?auto_2764274 ) ) ( not ( = ?auto_2764269 ?auto_2764273 ) ) ( not ( = ?auto_2764269 ?auto_2764275 ) ) ( not ( = ?auto_2764269 ?auto_2764276 ) ) ( not ( = ?auto_2764269 ?auto_2764277 ) ) ( not ( = ?auto_2764269 ?auto_2764278 ) ) ( not ( = ?auto_2764269 ?auto_2764279 ) ) ( not ( = ?auto_2764269 ?auto_2764280 ) ) ( not ( = ?auto_2764269 ?auto_2764281 ) ) ( not ( = ?auto_2764269 ?auto_2764282 ) ) ( not ( = ?auto_2764269 ?auto_2764283 ) ) ( not ( = ?auto_2764269 ?auto_2764284 ) ) ( not ( = ?auto_2764270 ?auto_2764271 ) ) ( not ( = ?auto_2764270 ?auto_2764268 ) ) ( not ( = ?auto_2764270 ?auto_2764272 ) ) ( not ( = ?auto_2764270 ?auto_2764274 ) ) ( not ( = ?auto_2764270 ?auto_2764273 ) ) ( not ( = ?auto_2764270 ?auto_2764275 ) ) ( not ( = ?auto_2764270 ?auto_2764276 ) ) ( not ( = ?auto_2764270 ?auto_2764277 ) ) ( not ( = ?auto_2764270 ?auto_2764278 ) ) ( not ( = ?auto_2764270 ?auto_2764279 ) ) ( not ( = ?auto_2764270 ?auto_2764280 ) ) ( not ( = ?auto_2764270 ?auto_2764281 ) ) ( not ( = ?auto_2764270 ?auto_2764282 ) ) ( not ( = ?auto_2764270 ?auto_2764283 ) ) ( not ( = ?auto_2764270 ?auto_2764284 ) ) ( not ( = ?auto_2764271 ?auto_2764268 ) ) ( not ( = ?auto_2764271 ?auto_2764272 ) ) ( not ( = ?auto_2764271 ?auto_2764274 ) ) ( not ( = ?auto_2764271 ?auto_2764273 ) ) ( not ( = ?auto_2764271 ?auto_2764275 ) ) ( not ( = ?auto_2764271 ?auto_2764276 ) ) ( not ( = ?auto_2764271 ?auto_2764277 ) ) ( not ( = ?auto_2764271 ?auto_2764278 ) ) ( not ( = ?auto_2764271 ?auto_2764279 ) ) ( not ( = ?auto_2764271 ?auto_2764280 ) ) ( not ( = ?auto_2764271 ?auto_2764281 ) ) ( not ( = ?auto_2764271 ?auto_2764282 ) ) ( not ( = ?auto_2764271 ?auto_2764283 ) ) ( not ( = ?auto_2764271 ?auto_2764284 ) ) ( not ( = ?auto_2764268 ?auto_2764272 ) ) ( not ( = ?auto_2764268 ?auto_2764274 ) ) ( not ( = ?auto_2764268 ?auto_2764273 ) ) ( not ( = ?auto_2764268 ?auto_2764275 ) ) ( not ( = ?auto_2764268 ?auto_2764276 ) ) ( not ( = ?auto_2764268 ?auto_2764277 ) ) ( not ( = ?auto_2764268 ?auto_2764278 ) ) ( not ( = ?auto_2764268 ?auto_2764279 ) ) ( not ( = ?auto_2764268 ?auto_2764280 ) ) ( not ( = ?auto_2764268 ?auto_2764281 ) ) ( not ( = ?auto_2764268 ?auto_2764282 ) ) ( not ( = ?auto_2764268 ?auto_2764283 ) ) ( not ( = ?auto_2764268 ?auto_2764284 ) ) ( not ( = ?auto_2764272 ?auto_2764274 ) ) ( not ( = ?auto_2764272 ?auto_2764273 ) ) ( not ( = ?auto_2764272 ?auto_2764275 ) ) ( not ( = ?auto_2764272 ?auto_2764276 ) ) ( not ( = ?auto_2764272 ?auto_2764277 ) ) ( not ( = ?auto_2764272 ?auto_2764278 ) ) ( not ( = ?auto_2764272 ?auto_2764279 ) ) ( not ( = ?auto_2764272 ?auto_2764280 ) ) ( not ( = ?auto_2764272 ?auto_2764281 ) ) ( not ( = ?auto_2764272 ?auto_2764282 ) ) ( not ( = ?auto_2764272 ?auto_2764283 ) ) ( not ( = ?auto_2764272 ?auto_2764284 ) ) ( not ( = ?auto_2764274 ?auto_2764273 ) ) ( not ( = ?auto_2764274 ?auto_2764275 ) ) ( not ( = ?auto_2764274 ?auto_2764276 ) ) ( not ( = ?auto_2764274 ?auto_2764277 ) ) ( not ( = ?auto_2764274 ?auto_2764278 ) ) ( not ( = ?auto_2764274 ?auto_2764279 ) ) ( not ( = ?auto_2764274 ?auto_2764280 ) ) ( not ( = ?auto_2764274 ?auto_2764281 ) ) ( not ( = ?auto_2764274 ?auto_2764282 ) ) ( not ( = ?auto_2764274 ?auto_2764283 ) ) ( not ( = ?auto_2764274 ?auto_2764284 ) ) ( not ( = ?auto_2764273 ?auto_2764275 ) ) ( not ( = ?auto_2764273 ?auto_2764276 ) ) ( not ( = ?auto_2764273 ?auto_2764277 ) ) ( not ( = ?auto_2764273 ?auto_2764278 ) ) ( not ( = ?auto_2764273 ?auto_2764279 ) ) ( not ( = ?auto_2764273 ?auto_2764280 ) ) ( not ( = ?auto_2764273 ?auto_2764281 ) ) ( not ( = ?auto_2764273 ?auto_2764282 ) ) ( not ( = ?auto_2764273 ?auto_2764283 ) ) ( not ( = ?auto_2764273 ?auto_2764284 ) ) ( not ( = ?auto_2764275 ?auto_2764276 ) ) ( not ( = ?auto_2764275 ?auto_2764277 ) ) ( not ( = ?auto_2764275 ?auto_2764278 ) ) ( not ( = ?auto_2764275 ?auto_2764279 ) ) ( not ( = ?auto_2764275 ?auto_2764280 ) ) ( not ( = ?auto_2764275 ?auto_2764281 ) ) ( not ( = ?auto_2764275 ?auto_2764282 ) ) ( not ( = ?auto_2764275 ?auto_2764283 ) ) ( not ( = ?auto_2764275 ?auto_2764284 ) ) ( not ( = ?auto_2764276 ?auto_2764277 ) ) ( not ( = ?auto_2764276 ?auto_2764278 ) ) ( not ( = ?auto_2764276 ?auto_2764279 ) ) ( not ( = ?auto_2764276 ?auto_2764280 ) ) ( not ( = ?auto_2764276 ?auto_2764281 ) ) ( not ( = ?auto_2764276 ?auto_2764282 ) ) ( not ( = ?auto_2764276 ?auto_2764283 ) ) ( not ( = ?auto_2764276 ?auto_2764284 ) ) ( not ( = ?auto_2764277 ?auto_2764278 ) ) ( not ( = ?auto_2764277 ?auto_2764279 ) ) ( not ( = ?auto_2764277 ?auto_2764280 ) ) ( not ( = ?auto_2764277 ?auto_2764281 ) ) ( not ( = ?auto_2764277 ?auto_2764282 ) ) ( not ( = ?auto_2764277 ?auto_2764283 ) ) ( not ( = ?auto_2764277 ?auto_2764284 ) ) ( not ( = ?auto_2764278 ?auto_2764279 ) ) ( not ( = ?auto_2764278 ?auto_2764280 ) ) ( not ( = ?auto_2764278 ?auto_2764281 ) ) ( not ( = ?auto_2764278 ?auto_2764282 ) ) ( not ( = ?auto_2764278 ?auto_2764283 ) ) ( not ( = ?auto_2764278 ?auto_2764284 ) ) ( not ( = ?auto_2764279 ?auto_2764280 ) ) ( not ( = ?auto_2764279 ?auto_2764281 ) ) ( not ( = ?auto_2764279 ?auto_2764282 ) ) ( not ( = ?auto_2764279 ?auto_2764283 ) ) ( not ( = ?auto_2764279 ?auto_2764284 ) ) ( not ( = ?auto_2764280 ?auto_2764281 ) ) ( not ( = ?auto_2764280 ?auto_2764282 ) ) ( not ( = ?auto_2764280 ?auto_2764283 ) ) ( not ( = ?auto_2764280 ?auto_2764284 ) ) ( not ( = ?auto_2764281 ?auto_2764282 ) ) ( not ( = ?auto_2764281 ?auto_2764283 ) ) ( not ( = ?auto_2764281 ?auto_2764284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764282 ?auto_2764283 ?auto_2764284 )
      ( MAKE-16CRATE-VERIFY ?auto_2764269 ?auto_2764270 ?auto_2764271 ?auto_2764268 ?auto_2764272 ?auto_2764274 ?auto_2764273 ?auto_2764275 ?auto_2764276 ?auto_2764277 ?auto_2764278 ?auto_2764279 ?auto_2764280 ?auto_2764281 ?auto_2764282 ?auto_2764283 ?auto_2764284 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764485 - SURFACE
      ?auto_2764486 - SURFACE
      ?auto_2764487 - SURFACE
      ?auto_2764484 - SURFACE
      ?auto_2764488 - SURFACE
      ?auto_2764490 - SURFACE
      ?auto_2764489 - SURFACE
      ?auto_2764491 - SURFACE
      ?auto_2764492 - SURFACE
      ?auto_2764493 - SURFACE
      ?auto_2764494 - SURFACE
      ?auto_2764495 - SURFACE
      ?auto_2764496 - SURFACE
      ?auto_2764497 - SURFACE
      ?auto_2764498 - SURFACE
      ?auto_2764499 - SURFACE
      ?auto_2764500 - SURFACE
    )
    :vars
    (
      ?auto_2764503 - HOIST
      ?auto_2764501 - PLACE
      ?auto_2764502 - TRUCK
      ?auto_2764504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764503 ?auto_2764501 ) ( SURFACE-AT ?auto_2764499 ?auto_2764501 ) ( CLEAR ?auto_2764499 ) ( IS-CRATE ?auto_2764500 ) ( not ( = ?auto_2764499 ?auto_2764500 ) ) ( AVAILABLE ?auto_2764503 ) ( IN ?auto_2764500 ?auto_2764502 ) ( ON ?auto_2764499 ?auto_2764498 ) ( not ( = ?auto_2764498 ?auto_2764499 ) ) ( not ( = ?auto_2764498 ?auto_2764500 ) ) ( TRUCK-AT ?auto_2764502 ?auto_2764504 ) ( not ( = ?auto_2764504 ?auto_2764501 ) ) ( ON ?auto_2764486 ?auto_2764485 ) ( ON ?auto_2764487 ?auto_2764486 ) ( ON ?auto_2764484 ?auto_2764487 ) ( ON ?auto_2764488 ?auto_2764484 ) ( ON ?auto_2764490 ?auto_2764488 ) ( ON ?auto_2764489 ?auto_2764490 ) ( ON ?auto_2764491 ?auto_2764489 ) ( ON ?auto_2764492 ?auto_2764491 ) ( ON ?auto_2764493 ?auto_2764492 ) ( ON ?auto_2764494 ?auto_2764493 ) ( ON ?auto_2764495 ?auto_2764494 ) ( ON ?auto_2764496 ?auto_2764495 ) ( ON ?auto_2764497 ?auto_2764496 ) ( ON ?auto_2764498 ?auto_2764497 ) ( not ( = ?auto_2764485 ?auto_2764486 ) ) ( not ( = ?auto_2764485 ?auto_2764487 ) ) ( not ( = ?auto_2764485 ?auto_2764484 ) ) ( not ( = ?auto_2764485 ?auto_2764488 ) ) ( not ( = ?auto_2764485 ?auto_2764490 ) ) ( not ( = ?auto_2764485 ?auto_2764489 ) ) ( not ( = ?auto_2764485 ?auto_2764491 ) ) ( not ( = ?auto_2764485 ?auto_2764492 ) ) ( not ( = ?auto_2764485 ?auto_2764493 ) ) ( not ( = ?auto_2764485 ?auto_2764494 ) ) ( not ( = ?auto_2764485 ?auto_2764495 ) ) ( not ( = ?auto_2764485 ?auto_2764496 ) ) ( not ( = ?auto_2764485 ?auto_2764497 ) ) ( not ( = ?auto_2764485 ?auto_2764498 ) ) ( not ( = ?auto_2764485 ?auto_2764499 ) ) ( not ( = ?auto_2764485 ?auto_2764500 ) ) ( not ( = ?auto_2764486 ?auto_2764487 ) ) ( not ( = ?auto_2764486 ?auto_2764484 ) ) ( not ( = ?auto_2764486 ?auto_2764488 ) ) ( not ( = ?auto_2764486 ?auto_2764490 ) ) ( not ( = ?auto_2764486 ?auto_2764489 ) ) ( not ( = ?auto_2764486 ?auto_2764491 ) ) ( not ( = ?auto_2764486 ?auto_2764492 ) ) ( not ( = ?auto_2764486 ?auto_2764493 ) ) ( not ( = ?auto_2764486 ?auto_2764494 ) ) ( not ( = ?auto_2764486 ?auto_2764495 ) ) ( not ( = ?auto_2764486 ?auto_2764496 ) ) ( not ( = ?auto_2764486 ?auto_2764497 ) ) ( not ( = ?auto_2764486 ?auto_2764498 ) ) ( not ( = ?auto_2764486 ?auto_2764499 ) ) ( not ( = ?auto_2764486 ?auto_2764500 ) ) ( not ( = ?auto_2764487 ?auto_2764484 ) ) ( not ( = ?auto_2764487 ?auto_2764488 ) ) ( not ( = ?auto_2764487 ?auto_2764490 ) ) ( not ( = ?auto_2764487 ?auto_2764489 ) ) ( not ( = ?auto_2764487 ?auto_2764491 ) ) ( not ( = ?auto_2764487 ?auto_2764492 ) ) ( not ( = ?auto_2764487 ?auto_2764493 ) ) ( not ( = ?auto_2764487 ?auto_2764494 ) ) ( not ( = ?auto_2764487 ?auto_2764495 ) ) ( not ( = ?auto_2764487 ?auto_2764496 ) ) ( not ( = ?auto_2764487 ?auto_2764497 ) ) ( not ( = ?auto_2764487 ?auto_2764498 ) ) ( not ( = ?auto_2764487 ?auto_2764499 ) ) ( not ( = ?auto_2764487 ?auto_2764500 ) ) ( not ( = ?auto_2764484 ?auto_2764488 ) ) ( not ( = ?auto_2764484 ?auto_2764490 ) ) ( not ( = ?auto_2764484 ?auto_2764489 ) ) ( not ( = ?auto_2764484 ?auto_2764491 ) ) ( not ( = ?auto_2764484 ?auto_2764492 ) ) ( not ( = ?auto_2764484 ?auto_2764493 ) ) ( not ( = ?auto_2764484 ?auto_2764494 ) ) ( not ( = ?auto_2764484 ?auto_2764495 ) ) ( not ( = ?auto_2764484 ?auto_2764496 ) ) ( not ( = ?auto_2764484 ?auto_2764497 ) ) ( not ( = ?auto_2764484 ?auto_2764498 ) ) ( not ( = ?auto_2764484 ?auto_2764499 ) ) ( not ( = ?auto_2764484 ?auto_2764500 ) ) ( not ( = ?auto_2764488 ?auto_2764490 ) ) ( not ( = ?auto_2764488 ?auto_2764489 ) ) ( not ( = ?auto_2764488 ?auto_2764491 ) ) ( not ( = ?auto_2764488 ?auto_2764492 ) ) ( not ( = ?auto_2764488 ?auto_2764493 ) ) ( not ( = ?auto_2764488 ?auto_2764494 ) ) ( not ( = ?auto_2764488 ?auto_2764495 ) ) ( not ( = ?auto_2764488 ?auto_2764496 ) ) ( not ( = ?auto_2764488 ?auto_2764497 ) ) ( not ( = ?auto_2764488 ?auto_2764498 ) ) ( not ( = ?auto_2764488 ?auto_2764499 ) ) ( not ( = ?auto_2764488 ?auto_2764500 ) ) ( not ( = ?auto_2764490 ?auto_2764489 ) ) ( not ( = ?auto_2764490 ?auto_2764491 ) ) ( not ( = ?auto_2764490 ?auto_2764492 ) ) ( not ( = ?auto_2764490 ?auto_2764493 ) ) ( not ( = ?auto_2764490 ?auto_2764494 ) ) ( not ( = ?auto_2764490 ?auto_2764495 ) ) ( not ( = ?auto_2764490 ?auto_2764496 ) ) ( not ( = ?auto_2764490 ?auto_2764497 ) ) ( not ( = ?auto_2764490 ?auto_2764498 ) ) ( not ( = ?auto_2764490 ?auto_2764499 ) ) ( not ( = ?auto_2764490 ?auto_2764500 ) ) ( not ( = ?auto_2764489 ?auto_2764491 ) ) ( not ( = ?auto_2764489 ?auto_2764492 ) ) ( not ( = ?auto_2764489 ?auto_2764493 ) ) ( not ( = ?auto_2764489 ?auto_2764494 ) ) ( not ( = ?auto_2764489 ?auto_2764495 ) ) ( not ( = ?auto_2764489 ?auto_2764496 ) ) ( not ( = ?auto_2764489 ?auto_2764497 ) ) ( not ( = ?auto_2764489 ?auto_2764498 ) ) ( not ( = ?auto_2764489 ?auto_2764499 ) ) ( not ( = ?auto_2764489 ?auto_2764500 ) ) ( not ( = ?auto_2764491 ?auto_2764492 ) ) ( not ( = ?auto_2764491 ?auto_2764493 ) ) ( not ( = ?auto_2764491 ?auto_2764494 ) ) ( not ( = ?auto_2764491 ?auto_2764495 ) ) ( not ( = ?auto_2764491 ?auto_2764496 ) ) ( not ( = ?auto_2764491 ?auto_2764497 ) ) ( not ( = ?auto_2764491 ?auto_2764498 ) ) ( not ( = ?auto_2764491 ?auto_2764499 ) ) ( not ( = ?auto_2764491 ?auto_2764500 ) ) ( not ( = ?auto_2764492 ?auto_2764493 ) ) ( not ( = ?auto_2764492 ?auto_2764494 ) ) ( not ( = ?auto_2764492 ?auto_2764495 ) ) ( not ( = ?auto_2764492 ?auto_2764496 ) ) ( not ( = ?auto_2764492 ?auto_2764497 ) ) ( not ( = ?auto_2764492 ?auto_2764498 ) ) ( not ( = ?auto_2764492 ?auto_2764499 ) ) ( not ( = ?auto_2764492 ?auto_2764500 ) ) ( not ( = ?auto_2764493 ?auto_2764494 ) ) ( not ( = ?auto_2764493 ?auto_2764495 ) ) ( not ( = ?auto_2764493 ?auto_2764496 ) ) ( not ( = ?auto_2764493 ?auto_2764497 ) ) ( not ( = ?auto_2764493 ?auto_2764498 ) ) ( not ( = ?auto_2764493 ?auto_2764499 ) ) ( not ( = ?auto_2764493 ?auto_2764500 ) ) ( not ( = ?auto_2764494 ?auto_2764495 ) ) ( not ( = ?auto_2764494 ?auto_2764496 ) ) ( not ( = ?auto_2764494 ?auto_2764497 ) ) ( not ( = ?auto_2764494 ?auto_2764498 ) ) ( not ( = ?auto_2764494 ?auto_2764499 ) ) ( not ( = ?auto_2764494 ?auto_2764500 ) ) ( not ( = ?auto_2764495 ?auto_2764496 ) ) ( not ( = ?auto_2764495 ?auto_2764497 ) ) ( not ( = ?auto_2764495 ?auto_2764498 ) ) ( not ( = ?auto_2764495 ?auto_2764499 ) ) ( not ( = ?auto_2764495 ?auto_2764500 ) ) ( not ( = ?auto_2764496 ?auto_2764497 ) ) ( not ( = ?auto_2764496 ?auto_2764498 ) ) ( not ( = ?auto_2764496 ?auto_2764499 ) ) ( not ( = ?auto_2764496 ?auto_2764500 ) ) ( not ( = ?auto_2764497 ?auto_2764498 ) ) ( not ( = ?auto_2764497 ?auto_2764499 ) ) ( not ( = ?auto_2764497 ?auto_2764500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764498 ?auto_2764499 ?auto_2764500 )
      ( MAKE-16CRATE-VERIFY ?auto_2764485 ?auto_2764486 ?auto_2764487 ?auto_2764484 ?auto_2764488 ?auto_2764490 ?auto_2764489 ?auto_2764491 ?auto_2764492 ?auto_2764493 ?auto_2764494 ?auto_2764495 ?auto_2764496 ?auto_2764497 ?auto_2764498 ?auto_2764499 ?auto_2764500 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764717 - SURFACE
      ?auto_2764718 - SURFACE
      ?auto_2764719 - SURFACE
      ?auto_2764716 - SURFACE
      ?auto_2764720 - SURFACE
      ?auto_2764722 - SURFACE
      ?auto_2764721 - SURFACE
      ?auto_2764723 - SURFACE
      ?auto_2764724 - SURFACE
      ?auto_2764725 - SURFACE
      ?auto_2764726 - SURFACE
      ?auto_2764727 - SURFACE
      ?auto_2764728 - SURFACE
      ?auto_2764729 - SURFACE
      ?auto_2764730 - SURFACE
      ?auto_2764731 - SURFACE
      ?auto_2764732 - SURFACE
    )
    :vars
    (
      ?auto_2764733 - HOIST
      ?auto_2764735 - PLACE
      ?auto_2764736 - TRUCK
      ?auto_2764737 - PLACE
      ?auto_2764734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764733 ?auto_2764735 ) ( SURFACE-AT ?auto_2764731 ?auto_2764735 ) ( CLEAR ?auto_2764731 ) ( IS-CRATE ?auto_2764732 ) ( not ( = ?auto_2764731 ?auto_2764732 ) ) ( AVAILABLE ?auto_2764733 ) ( ON ?auto_2764731 ?auto_2764730 ) ( not ( = ?auto_2764730 ?auto_2764731 ) ) ( not ( = ?auto_2764730 ?auto_2764732 ) ) ( TRUCK-AT ?auto_2764736 ?auto_2764737 ) ( not ( = ?auto_2764737 ?auto_2764735 ) ) ( HOIST-AT ?auto_2764734 ?auto_2764737 ) ( LIFTING ?auto_2764734 ?auto_2764732 ) ( not ( = ?auto_2764733 ?auto_2764734 ) ) ( ON ?auto_2764718 ?auto_2764717 ) ( ON ?auto_2764719 ?auto_2764718 ) ( ON ?auto_2764716 ?auto_2764719 ) ( ON ?auto_2764720 ?auto_2764716 ) ( ON ?auto_2764722 ?auto_2764720 ) ( ON ?auto_2764721 ?auto_2764722 ) ( ON ?auto_2764723 ?auto_2764721 ) ( ON ?auto_2764724 ?auto_2764723 ) ( ON ?auto_2764725 ?auto_2764724 ) ( ON ?auto_2764726 ?auto_2764725 ) ( ON ?auto_2764727 ?auto_2764726 ) ( ON ?auto_2764728 ?auto_2764727 ) ( ON ?auto_2764729 ?auto_2764728 ) ( ON ?auto_2764730 ?auto_2764729 ) ( not ( = ?auto_2764717 ?auto_2764718 ) ) ( not ( = ?auto_2764717 ?auto_2764719 ) ) ( not ( = ?auto_2764717 ?auto_2764716 ) ) ( not ( = ?auto_2764717 ?auto_2764720 ) ) ( not ( = ?auto_2764717 ?auto_2764722 ) ) ( not ( = ?auto_2764717 ?auto_2764721 ) ) ( not ( = ?auto_2764717 ?auto_2764723 ) ) ( not ( = ?auto_2764717 ?auto_2764724 ) ) ( not ( = ?auto_2764717 ?auto_2764725 ) ) ( not ( = ?auto_2764717 ?auto_2764726 ) ) ( not ( = ?auto_2764717 ?auto_2764727 ) ) ( not ( = ?auto_2764717 ?auto_2764728 ) ) ( not ( = ?auto_2764717 ?auto_2764729 ) ) ( not ( = ?auto_2764717 ?auto_2764730 ) ) ( not ( = ?auto_2764717 ?auto_2764731 ) ) ( not ( = ?auto_2764717 ?auto_2764732 ) ) ( not ( = ?auto_2764718 ?auto_2764719 ) ) ( not ( = ?auto_2764718 ?auto_2764716 ) ) ( not ( = ?auto_2764718 ?auto_2764720 ) ) ( not ( = ?auto_2764718 ?auto_2764722 ) ) ( not ( = ?auto_2764718 ?auto_2764721 ) ) ( not ( = ?auto_2764718 ?auto_2764723 ) ) ( not ( = ?auto_2764718 ?auto_2764724 ) ) ( not ( = ?auto_2764718 ?auto_2764725 ) ) ( not ( = ?auto_2764718 ?auto_2764726 ) ) ( not ( = ?auto_2764718 ?auto_2764727 ) ) ( not ( = ?auto_2764718 ?auto_2764728 ) ) ( not ( = ?auto_2764718 ?auto_2764729 ) ) ( not ( = ?auto_2764718 ?auto_2764730 ) ) ( not ( = ?auto_2764718 ?auto_2764731 ) ) ( not ( = ?auto_2764718 ?auto_2764732 ) ) ( not ( = ?auto_2764719 ?auto_2764716 ) ) ( not ( = ?auto_2764719 ?auto_2764720 ) ) ( not ( = ?auto_2764719 ?auto_2764722 ) ) ( not ( = ?auto_2764719 ?auto_2764721 ) ) ( not ( = ?auto_2764719 ?auto_2764723 ) ) ( not ( = ?auto_2764719 ?auto_2764724 ) ) ( not ( = ?auto_2764719 ?auto_2764725 ) ) ( not ( = ?auto_2764719 ?auto_2764726 ) ) ( not ( = ?auto_2764719 ?auto_2764727 ) ) ( not ( = ?auto_2764719 ?auto_2764728 ) ) ( not ( = ?auto_2764719 ?auto_2764729 ) ) ( not ( = ?auto_2764719 ?auto_2764730 ) ) ( not ( = ?auto_2764719 ?auto_2764731 ) ) ( not ( = ?auto_2764719 ?auto_2764732 ) ) ( not ( = ?auto_2764716 ?auto_2764720 ) ) ( not ( = ?auto_2764716 ?auto_2764722 ) ) ( not ( = ?auto_2764716 ?auto_2764721 ) ) ( not ( = ?auto_2764716 ?auto_2764723 ) ) ( not ( = ?auto_2764716 ?auto_2764724 ) ) ( not ( = ?auto_2764716 ?auto_2764725 ) ) ( not ( = ?auto_2764716 ?auto_2764726 ) ) ( not ( = ?auto_2764716 ?auto_2764727 ) ) ( not ( = ?auto_2764716 ?auto_2764728 ) ) ( not ( = ?auto_2764716 ?auto_2764729 ) ) ( not ( = ?auto_2764716 ?auto_2764730 ) ) ( not ( = ?auto_2764716 ?auto_2764731 ) ) ( not ( = ?auto_2764716 ?auto_2764732 ) ) ( not ( = ?auto_2764720 ?auto_2764722 ) ) ( not ( = ?auto_2764720 ?auto_2764721 ) ) ( not ( = ?auto_2764720 ?auto_2764723 ) ) ( not ( = ?auto_2764720 ?auto_2764724 ) ) ( not ( = ?auto_2764720 ?auto_2764725 ) ) ( not ( = ?auto_2764720 ?auto_2764726 ) ) ( not ( = ?auto_2764720 ?auto_2764727 ) ) ( not ( = ?auto_2764720 ?auto_2764728 ) ) ( not ( = ?auto_2764720 ?auto_2764729 ) ) ( not ( = ?auto_2764720 ?auto_2764730 ) ) ( not ( = ?auto_2764720 ?auto_2764731 ) ) ( not ( = ?auto_2764720 ?auto_2764732 ) ) ( not ( = ?auto_2764722 ?auto_2764721 ) ) ( not ( = ?auto_2764722 ?auto_2764723 ) ) ( not ( = ?auto_2764722 ?auto_2764724 ) ) ( not ( = ?auto_2764722 ?auto_2764725 ) ) ( not ( = ?auto_2764722 ?auto_2764726 ) ) ( not ( = ?auto_2764722 ?auto_2764727 ) ) ( not ( = ?auto_2764722 ?auto_2764728 ) ) ( not ( = ?auto_2764722 ?auto_2764729 ) ) ( not ( = ?auto_2764722 ?auto_2764730 ) ) ( not ( = ?auto_2764722 ?auto_2764731 ) ) ( not ( = ?auto_2764722 ?auto_2764732 ) ) ( not ( = ?auto_2764721 ?auto_2764723 ) ) ( not ( = ?auto_2764721 ?auto_2764724 ) ) ( not ( = ?auto_2764721 ?auto_2764725 ) ) ( not ( = ?auto_2764721 ?auto_2764726 ) ) ( not ( = ?auto_2764721 ?auto_2764727 ) ) ( not ( = ?auto_2764721 ?auto_2764728 ) ) ( not ( = ?auto_2764721 ?auto_2764729 ) ) ( not ( = ?auto_2764721 ?auto_2764730 ) ) ( not ( = ?auto_2764721 ?auto_2764731 ) ) ( not ( = ?auto_2764721 ?auto_2764732 ) ) ( not ( = ?auto_2764723 ?auto_2764724 ) ) ( not ( = ?auto_2764723 ?auto_2764725 ) ) ( not ( = ?auto_2764723 ?auto_2764726 ) ) ( not ( = ?auto_2764723 ?auto_2764727 ) ) ( not ( = ?auto_2764723 ?auto_2764728 ) ) ( not ( = ?auto_2764723 ?auto_2764729 ) ) ( not ( = ?auto_2764723 ?auto_2764730 ) ) ( not ( = ?auto_2764723 ?auto_2764731 ) ) ( not ( = ?auto_2764723 ?auto_2764732 ) ) ( not ( = ?auto_2764724 ?auto_2764725 ) ) ( not ( = ?auto_2764724 ?auto_2764726 ) ) ( not ( = ?auto_2764724 ?auto_2764727 ) ) ( not ( = ?auto_2764724 ?auto_2764728 ) ) ( not ( = ?auto_2764724 ?auto_2764729 ) ) ( not ( = ?auto_2764724 ?auto_2764730 ) ) ( not ( = ?auto_2764724 ?auto_2764731 ) ) ( not ( = ?auto_2764724 ?auto_2764732 ) ) ( not ( = ?auto_2764725 ?auto_2764726 ) ) ( not ( = ?auto_2764725 ?auto_2764727 ) ) ( not ( = ?auto_2764725 ?auto_2764728 ) ) ( not ( = ?auto_2764725 ?auto_2764729 ) ) ( not ( = ?auto_2764725 ?auto_2764730 ) ) ( not ( = ?auto_2764725 ?auto_2764731 ) ) ( not ( = ?auto_2764725 ?auto_2764732 ) ) ( not ( = ?auto_2764726 ?auto_2764727 ) ) ( not ( = ?auto_2764726 ?auto_2764728 ) ) ( not ( = ?auto_2764726 ?auto_2764729 ) ) ( not ( = ?auto_2764726 ?auto_2764730 ) ) ( not ( = ?auto_2764726 ?auto_2764731 ) ) ( not ( = ?auto_2764726 ?auto_2764732 ) ) ( not ( = ?auto_2764727 ?auto_2764728 ) ) ( not ( = ?auto_2764727 ?auto_2764729 ) ) ( not ( = ?auto_2764727 ?auto_2764730 ) ) ( not ( = ?auto_2764727 ?auto_2764731 ) ) ( not ( = ?auto_2764727 ?auto_2764732 ) ) ( not ( = ?auto_2764728 ?auto_2764729 ) ) ( not ( = ?auto_2764728 ?auto_2764730 ) ) ( not ( = ?auto_2764728 ?auto_2764731 ) ) ( not ( = ?auto_2764728 ?auto_2764732 ) ) ( not ( = ?auto_2764729 ?auto_2764730 ) ) ( not ( = ?auto_2764729 ?auto_2764731 ) ) ( not ( = ?auto_2764729 ?auto_2764732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764730 ?auto_2764731 ?auto_2764732 )
      ( MAKE-16CRATE-VERIFY ?auto_2764717 ?auto_2764718 ?auto_2764719 ?auto_2764716 ?auto_2764720 ?auto_2764722 ?auto_2764721 ?auto_2764723 ?auto_2764724 ?auto_2764725 ?auto_2764726 ?auto_2764727 ?auto_2764728 ?auto_2764729 ?auto_2764730 ?auto_2764731 ?auto_2764732 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764965 - SURFACE
      ?auto_2764966 - SURFACE
      ?auto_2764967 - SURFACE
      ?auto_2764964 - SURFACE
      ?auto_2764968 - SURFACE
      ?auto_2764970 - SURFACE
      ?auto_2764969 - SURFACE
      ?auto_2764971 - SURFACE
      ?auto_2764972 - SURFACE
      ?auto_2764973 - SURFACE
      ?auto_2764974 - SURFACE
      ?auto_2764975 - SURFACE
      ?auto_2764976 - SURFACE
      ?auto_2764977 - SURFACE
      ?auto_2764978 - SURFACE
      ?auto_2764979 - SURFACE
      ?auto_2764980 - SURFACE
    )
    :vars
    (
      ?auto_2764982 - HOIST
      ?auto_2764985 - PLACE
      ?auto_2764984 - TRUCK
      ?auto_2764983 - PLACE
      ?auto_2764986 - HOIST
      ?auto_2764981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764982 ?auto_2764985 ) ( SURFACE-AT ?auto_2764979 ?auto_2764985 ) ( CLEAR ?auto_2764979 ) ( IS-CRATE ?auto_2764980 ) ( not ( = ?auto_2764979 ?auto_2764980 ) ) ( AVAILABLE ?auto_2764982 ) ( ON ?auto_2764979 ?auto_2764978 ) ( not ( = ?auto_2764978 ?auto_2764979 ) ) ( not ( = ?auto_2764978 ?auto_2764980 ) ) ( TRUCK-AT ?auto_2764984 ?auto_2764983 ) ( not ( = ?auto_2764983 ?auto_2764985 ) ) ( HOIST-AT ?auto_2764986 ?auto_2764983 ) ( not ( = ?auto_2764982 ?auto_2764986 ) ) ( AVAILABLE ?auto_2764986 ) ( SURFACE-AT ?auto_2764980 ?auto_2764983 ) ( ON ?auto_2764980 ?auto_2764981 ) ( CLEAR ?auto_2764980 ) ( not ( = ?auto_2764979 ?auto_2764981 ) ) ( not ( = ?auto_2764980 ?auto_2764981 ) ) ( not ( = ?auto_2764978 ?auto_2764981 ) ) ( ON ?auto_2764966 ?auto_2764965 ) ( ON ?auto_2764967 ?auto_2764966 ) ( ON ?auto_2764964 ?auto_2764967 ) ( ON ?auto_2764968 ?auto_2764964 ) ( ON ?auto_2764970 ?auto_2764968 ) ( ON ?auto_2764969 ?auto_2764970 ) ( ON ?auto_2764971 ?auto_2764969 ) ( ON ?auto_2764972 ?auto_2764971 ) ( ON ?auto_2764973 ?auto_2764972 ) ( ON ?auto_2764974 ?auto_2764973 ) ( ON ?auto_2764975 ?auto_2764974 ) ( ON ?auto_2764976 ?auto_2764975 ) ( ON ?auto_2764977 ?auto_2764976 ) ( ON ?auto_2764978 ?auto_2764977 ) ( not ( = ?auto_2764965 ?auto_2764966 ) ) ( not ( = ?auto_2764965 ?auto_2764967 ) ) ( not ( = ?auto_2764965 ?auto_2764964 ) ) ( not ( = ?auto_2764965 ?auto_2764968 ) ) ( not ( = ?auto_2764965 ?auto_2764970 ) ) ( not ( = ?auto_2764965 ?auto_2764969 ) ) ( not ( = ?auto_2764965 ?auto_2764971 ) ) ( not ( = ?auto_2764965 ?auto_2764972 ) ) ( not ( = ?auto_2764965 ?auto_2764973 ) ) ( not ( = ?auto_2764965 ?auto_2764974 ) ) ( not ( = ?auto_2764965 ?auto_2764975 ) ) ( not ( = ?auto_2764965 ?auto_2764976 ) ) ( not ( = ?auto_2764965 ?auto_2764977 ) ) ( not ( = ?auto_2764965 ?auto_2764978 ) ) ( not ( = ?auto_2764965 ?auto_2764979 ) ) ( not ( = ?auto_2764965 ?auto_2764980 ) ) ( not ( = ?auto_2764965 ?auto_2764981 ) ) ( not ( = ?auto_2764966 ?auto_2764967 ) ) ( not ( = ?auto_2764966 ?auto_2764964 ) ) ( not ( = ?auto_2764966 ?auto_2764968 ) ) ( not ( = ?auto_2764966 ?auto_2764970 ) ) ( not ( = ?auto_2764966 ?auto_2764969 ) ) ( not ( = ?auto_2764966 ?auto_2764971 ) ) ( not ( = ?auto_2764966 ?auto_2764972 ) ) ( not ( = ?auto_2764966 ?auto_2764973 ) ) ( not ( = ?auto_2764966 ?auto_2764974 ) ) ( not ( = ?auto_2764966 ?auto_2764975 ) ) ( not ( = ?auto_2764966 ?auto_2764976 ) ) ( not ( = ?auto_2764966 ?auto_2764977 ) ) ( not ( = ?auto_2764966 ?auto_2764978 ) ) ( not ( = ?auto_2764966 ?auto_2764979 ) ) ( not ( = ?auto_2764966 ?auto_2764980 ) ) ( not ( = ?auto_2764966 ?auto_2764981 ) ) ( not ( = ?auto_2764967 ?auto_2764964 ) ) ( not ( = ?auto_2764967 ?auto_2764968 ) ) ( not ( = ?auto_2764967 ?auto_2764970 ) ) ( not ( = ?auto_2764967 ?auto_2764969 ) ) ( not ( = ?auto_2764967 ?auto_2764971 ) ) ( not ( = ?auto_2764967 ?auto_2764972 ) ) ( not ( = ?auto_2764967 ?auto_2764973 ) ) ( not ( = ?auto_2764967 ?auto_2764974 ) ) ( not ( = ?auto_2764967 ?auto_2764975 ) ) ( not ( = ?auto_2764967 ?auto_2764976 ) ) ( not ( = ?auto_2764967 ?auto_2764977 ) ) ( not ( = ?auto_2764967 ?auto_2764978 ) ) ( not ( = ?auto_2764967 ?auto_2764979 ) ) ( not ( = ?auto_2764967 ?auto_2764980 ) ) ( not ( = ?auto_2764967 ?auto_2764981 ) ) ( not ( = ?auto_2764964 ?auto_2764968 ) ) ( not ( = ?auto_2764964 ?auto_2764970 ) ) ( not ( = ?auto_2764964 ?auto_2764969 ) ) ( not ( = ?auto_2764964 ?auto_2764971 ) ) ( not ( = ?auto_2764964 ?auto_2764972 ) ) ( not ( = ?auto_2764964 ?auto_2764973 ) ) ( not ( = ?auto_2764964 ?auto_2764974 ) ) ( not ( = ?auto_2764964 ?auto_2764975 ) ) ( not ( = ?auto_2764964 ?auto_2764976 ) ) ( not ( = ?auto_2764964 ?auto_2764977 ) ) ( not ( = ?auto_2764964 ?auto_2764978 ) ) ( not ( = ?auto_2764964 ?auto_2764979 ) ) ( not ( = ?auto_2764964 ?auto_2764980 ) ) ( not ( = ?auto_2764964 ?auto_2764981 ) ) ( not ( = ?auto_2764968 ?auto_2764970 ) ) ( not ( = ?auto_2764968 ?auto_2764969 ) ) ( not ( = ?auto_2764968 ?auto_2764971 ) ) ( not ( = ?auto_2764968 ?auto_2764972 ) ) ( not ( = ?auto_2764968 ?auto_2764973 ) ) ( not ( = ?auto_2764968 ?auto_2764974 ) ) ( not ( = ?auto_2764968 ?auto_2764975 ) ) ( not ( = ?auto_2764968 ?auto_2764976 ) ) ( not ( = ?auto_2764968 ?auto_2764977 ) ) ( not ( = ?auto_2764968 ?auto_2764978 ) ) ( not ( = ?auto_2764968 ?auto_2764979 ) ) ( not ( = ?auto_2764968 ?auto_2764980 ) ) ( not ( = ?auto_2764968 ?auto_2764981 ) ) ( not ( = ?auto_2764970 ?auto_2764969 ) ) ( not ( = ?auto_2764970 ?auto_2764971 ) ) ( not ( = ?auto_2764970 ?auto_2764972 ) ) ( not ( = ?auto_2764970 ?auto_2764973 ) ) ( not ( = ?auto_2764970 ?auto_2764974 ) ) ( not ( = ?auto_2764970 ?auto_2764975 ) ) ( not ( = ?auto_2764970 ?auto_2764976 ) ) ( not ( = ?auto_2764970 ?auto_2764977 ) ) ( not ( = ?auto_2764970 ?auto_2764978 ) ) ( not ( = ?auto_2764970 ?auto_2764979 ) ) ( not ( = ?auto_2764970 ?auto_2764980 ) ) ( not ( = ?auto_2764970 ?auto_2764981 ) ) ( not ( = ?auto_2764969 ?auto_2764971 ) ) ( not ( = ?auto_2764969 ?auto_2764972 ) ) ( not ( = ?auto_2764969 ?auto_2764973 ) ) ( not ( = ?auto_2764969 ?auto_2764974 ) ) ( not ( = ?auto_2764969 ?auto_2764975 ) ) ( not ( = ?auto_2764969 ?auto_2764976 ) ) ( not ( = ?auto_2764969 ?auto_2764977 ) ) ( not ( = ?auto_2764969 ?auto_2764978 ) ) ( not ( = ?auto_2764969 ?auto_2764979 ) ) ( not ( = ?auto_2764969 ?auto_2764980 ) ) ( not ( = ?auto_2764969 ?auto_2764981 ) ) ( not ( = ?auto_2764971 ?auto_2764972 ) ) ( not ( = ?auto_2764971 ?auto_2764973 ) ) ( not ( = ?auto_2764971 ?auto_2764974 ) ) ( not ( = ?auto_2764971 ?auto_2764975 ) ) ( not ( = ?auto_2764971 ?auto_2764976 ) ) ( not ( = ?auto_2764971 ?auto_2764977 ) ) ( not ( = ?auto_2764971 ?auto_2764978 ) ) ( not ( = ?auto_2764971 ?auto_2764979 ) ) ( not ( = ?auto_2764971 ?auto_2764980 ) ) ( not ( = ?auto_2764971 ?auto_2764981 ) ) ( not ( = ?auto_2764972 ?auto_2764973 ) ) ( not ( = ?auto_2764972 ?auto_2764974 ) ) ( not ( = ?auto_2764972 ?auto_2764975 ) ) ( not ( = ?auto_2764972 ?auto_2764976 ) ) ( not ( = ?auto_2764972 ?auto_2764977 ) ) ( not ( = ?auto_2764972 ?auto_2764978 ) ) ( not ( = ?auto_2764972 ?auto_2764979 ) ) ( not ( = ?auto_2764972 ?auto_2764980 ) ) ( not ( = ?auto_2764972 ?auto_2764981 ) ) ( not ( = ?auto_2764973 ?auto_2764974 ) ) ( not ( = ?auto_2764973 ?auto_2764975 ) ) ( not ( = ?auto_2764973 ?auto_2764976 ) ) ( not ( = ?auto_2764973 ?auto_2764977 ) ) ( not ( = ?auto_2764973 ?auto_2764978 ) ) ( not ( = ?auto_2764973 ?auto_2764979 ) ) ( not ( = ?auto_2764973 ?auto_2764980 ) ) ( not ( = ?auto_2764973 ?auto_2764981 ) ) ( not ( = ?auto_2764974 ?auto_2764975 ) ) ( not ( = ?auto_2764974 ?auto_2764976 ) ) ( not ( = ?auto_2764974 ?auto_2764977 ) ) ( not ( = ?auto_2764974 ?auto_2764978 ) ) ( not ( = ?auto_2764974 ?auto_2764979 ) ) ( not ( = ?auto_2764974 ?auto_2764980 ) ) ( not ( = ?auto_2764974 ?auto_2764981 ) ) ( not ( = ?auto_2764975 ?auto_2764976 ) ) ( not ( = ?auto_2764975 ?auto_2764977 ) ) ( not ( = ?auto_2764975 ?auto_2764978 ) ) ( not ( = ?auto_2764975 ?auto_2764979 ) ) ( not ( = ?auto_2764975 ?auto_2764980 ) ) ( not ( = ?auto_2764975 ?auto_2764981 ) ) ( not ( = ?auto_2764976 ?auto_2764977 ) ) ( not ( = ?auto_2764976 ?auto_2764978 ) ) ( not ( = ?auto_2764976 ?auto_2764979 ) ) ( not ( = ?auto_2764976 ?auto_2764980 ) ) ( not ( = ?auto_2764976 ?auto_2764981 ) ) ( not ( = ?auto_2764977 ?auto_2764978 ) ) ( not ( = ?auto_2764977 ?auto_2764979 ) ) ( not ( = ?auto_2764977 ?auto_2764980 ) ) ( not ( = ?auto_2764977 ?auto_2764981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764978 ?auto_2764979 ?auto_2764980 )
      ( MAKE-16CRATE-VERIFY ?auto_2764965 ?auto_2764966 ?auto_2764967 ?auto_2764964 ?auto_2764968 ?auto_2764970 ?auto_2764969 ?auto_2764971 ?auto_2764972 ?auto_2764973 ?auto_2764974 ?auto_2764975 ?auto_2764976 ?auto_2764977 ?auto_2764978 ?auto_2764979 ?auto_2764980 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2765214 - SURFACE
      ?auto_2765215 - SURFACE
      ?auto_2765216 - SURFACE
      ?auto_2765213 - SURFACE
      ?auto_2765217 - SURFACE
      ?auto_2765219 - SURFACE
      ?auto_2765218 - SURFACE
      ?auto_2765220 - SURFACE
      ?auto_2765221 - SURFACE
      ?auto_2765222 - SURFACE
      ?auto_2765223 - SURFACE
      ?auto_2765224 - SURFACE
      ?auto_2765225 - SURFACE
      ?auto_2765226 - SURFACE
      ?auto_2765227 - SURFACE
      ?auto_2765228 - SURFACE
      ?auto_2765229 - SURFACE
    )
    :vars
    (
      ?auto_2765231 - HOIST
      ?auto_2765234 - PLACE
      ?auto_2765235 - PLACE
      ?auto_2765233 - HOIST
      ?auto_2765232 - SURFACE
      ?auto_2765230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2765231 ?auto_2765234 ) ( SURFACE-AT ?auto_2765228 ?auto_2765234 ) ( CLEAR ?auto_2765228 ) ( IS-CRATE ?auto_2765229 ) ( not ( = ?auto_2765228 ?auto_2765229 ) ) ( AVAILABLE ?auto_2765231 ) ( ON ?auto_2765228 ?auto_2765227 ) ( not ( = ?auto_2765227 ?auto_2765228 ) ) ( not ( = ?auto_2765227 ?auto_2765229 ) ) ( not ( = ?auto_2765235 ?auto_2765234 ) ) ( HOIST-AT ?auto_2765233 ?auto_2765235 ) ( not ( = ?auto_2765231 ?auto_2765233 ) ) ( AVAILABLE ?auto_2765233 ) ( SURFACE-AT ?auto_2765229 ?auto_2765235 ) ( ON ?auto_2765229 ?auto_2765232 ) ( CLEAR ?auto_2765229 ) ( not ( = ?auto_2765228 ?auto_2765232 ) ) ( not ( = ?auto_2765229 ?auto_2765232 ) ) ( not ( = ?auto_2765227 ?auto_2765232 ) ) ( TRUCK-AT ?auto_2765230 ?auto_2765234 ) ( ON ?auto_2765215 ?auto_2765214 ) ( ON ?auto_2765216 ?auto_2765215 ) ( ON ?auto_2765213 ?auto_2765216 ) ( ON ?auto_2765217 ?auto_2765213 ) ( ON ?auto_2765219 ?auto_2765217 ) ( ON ?auto_2765218 ?auto_2765219 ) ( ON ?auto_2765220 ?auto_2765218 ) ( ON ?auto_2765221 ?auto_2765220 ) ( ON ?auto_2765222 ?auto_2765221 ) ( ON ?auto_2765223 ?auto_2765222 ) ( ON ?auto_2765224 ?auto_2765223 ) ( ON ?auto_2765225 ?auto_2765224 ) ( ON ?auto_2765226 ?auto_2765225 ) ( ON ?auto_2765227 ?auto_2765226 ) ( not ( = ?auto_2765214 ?auto_2765215 ) ) ( not ( = ?auto_2765214 ?auto_2765216 ) ) ( not ( = ?auto_2765214 ?auto_2765213 ) ) ( not ( = ?auto_2765214 ?auto_2765217 ) ) ( not ( = ?auto_2765214 ?auto_2765219 ) ) ( not ( = ?auto_2765214 ?auto_2765218 ) ) ( not ( = ?auto_2765214 ?auto_2765220 ) ) ( not ( = ?auto_2765214 ?auto_2765221 ) ) ( not ( = ?auto_2765214 ?auto_2765222 ) ) ( not ( = ?auto_2765214 ?auto_2765223 ) ) ( not ( = ?auto_2765214 ?auto_2765224 ) ) ( not ( = ?auto_2765214 ?auto_2765225 ) ) ( not ( = ?auto_2765214 ?auto_2765226 ) ) ( not ( = ?auto_2765214 ?auto_2765227 ) ) ( not ( = ?auto_2765214 ?auto_2765228 ) ) ( not ( = ?auto_2765214 ?auto_2765229 ) ) ( not ( = ?auto_2765214 ?auto_2765232 ) ) ( not ( = ?auto_2765215 ?auto_2765216 ) ) ( not ( = ?auto_2765215 ?auto_2765213 ) ) ( not ( = ?auto_2765215 ?auto_2765217 ) ) ( not ( = ?auto_2765215 ?auto_2765219 ) ) ( not ( = ?auto_2765215 ?auto_2765218 ) ) ( not ( = ?auto_2765215 ?auto_2765220 ) ) ( not ( = ?auto_2765215 ?auto_2765221 ) ) ( not ( = ?auto_2765215 ?auto_2765222 ) ) ( not ( = ?auto_2765215 ?auto_2765223 ) ) ( not ( = ?auto_2765215 ?auto_2765224 ) ) ( not ( = ?auto_2765215 ?auto_2765225 ) ) ( not ( = ?auto_2765215 ?auto_2765226 ) ) ( not ( = ?auto_2765215 ?auto_2765227 ) ) ( not ( = ?auto_2765215 ?auto_2765228 ) ) ( not ( = ?auto_2765215 ?auto_2765229 ) ) ( not ( = ?auto_2765215 ?auto_2765232 ) ) ( not ( = ?auto_2765216 ?auto_2765213 ) ) ( not ( = ?auto_2765216 ?auto_2765217 ) ) ( not ( = ?auto_2765216 ?auto_2765219 ) ) ( not ( = ?auto_2765216 ?auto_2765218 ) ) ( not ( = ?auto_2765216 ?auto_2765220 ) ) ( not ( = ?auto_2765216 ?auto_2765221 ) ) ( not ( = ?auto_2765216 ?auto_2765222 ) ) ( not ( = ?auto_2765216 ?auto_2765223 ) ) ( not ( = ?auto_2765216 ?auto_2765224 ) ) ( not ( = ?auto_2765216 ?auto_2765225 ) ) ( not ( = ?auto_2765216 ?auto_2765226 ) ) ( not ( = ?auto_2765216 ?auto_2765227 ) ) ( not ( = ?auto_2765216 ?auto_2765228 ) ) ( not ( = ?auto_2765216 ?auto_2765229 ) ) ( not ( = ?auto_2765216 ?auto_2765232 ) ) ( not ( = ?auto_2765213 ?auto_2765217 ) ) ( not ( = ?auto_2765213 ?auto_2765219 ) ) ( not ( = ?auto_2765213 ?auto_2765218 ) ) ( not ( = ?auto_2765213 ?auto_2765220 ) ) ( not ( = ?auto_2765213 ?auto_2765221 ) ) ( not ( = ?auto_2765213 ?auto_2765222 ) ) ( not ( = ?auto_2765213 ?auto_2765223 ) ) ( not ( = ?auto_2765213 ?auto_2765224 ) ) ( not ( = ?auto_2765213 ?auto_2765225 ) ) ( not ( = ?auto_2765213 ?auto_2765226 ) ) ( not ( = ?auto_2765213 ?auto_2765227 ) ) ( not ( = ?auto_2765213 ?auto_2765228 ) ) ( not ( = ?auto_2765213 ?auto_2765229 ) ) ( not ( = ?auto_2765213 ?auto_2765232 ) ) ( not ( = ?auto_2765217 ?auto_2765219 ) ) ( not ( = ?auto_2765217 ?auto_2765218 ) ) ( not ( = ?auto_2765217 ?auto_2765220 ) ) ( not ( = ?auto_2765217 ?auto_2765221 ) ) ( not ( = ?auto_2765217 ?auto_2765222 ) ) ( not ( = ?auto_2765217 ?auto_2765223 ) ) ( not ( = ?auto_2765217 ?auto_2765224 ) ) ( not ( = ?auto_2765217 ?auto_2765225 ) ) ( not ( = ?auto_2765217 ?auto_2765226 ) ) ( not ( = ?auto_2765217 ?auto_2765227 ) ) ( not ( = ?auto_2765217 ?auto_2765228 ) ) ( not ( = ?auto_2765217 ?auto_2765229 ) ) ( not ( = ?auto_2765217 ?auto_2765232 ) ) ( not ( = ?auto_2765219 ?auto_2765218 ) ) ( not ( = ?auto_2765219 ?auto_2765220 ) ) ( not ( = ?auto_2765219 ?auto_2765221 ) ) ( not ( = ?auto_2765219 ?auto_2765222 ) ) ( not ( = ?auto_2765219 ?auto_2765223 ) ) ( not ( = ?auto_2765219 ?auto_2765224 ) ) ( not ( = ?auto_2765219 ?auto_2765225 ) ) ( not ( = ?auto_2765219 ?auto_2765226 ) ) ( not ( = ?auto_2765219 ?auto_2765227 ) ) ( not ( = ?auto_2765219 ?auto_2765228 ) ) ( not ( = ?auto_2765219 ?auto_2765229 ) ) ( not ( = ?auto_2765219 ?auto_2765232 ) ) ( not ( = ?auto_2765218 ?auto_2765220 ) ) ( not ( = ?auto_2765218 ?auto_2765221 ) ) ( not ( = ?auto_2765218 ?auto_2765222 ) ) ( not ( = ?auto_2765218 ?auto_2765223 ) ) ( not ( = ?auto_2765218 ?auto_2765224 ) ) ( not ( = ?auto_2765218 ?auto_2765225 ) ) ( not ( = ?auto_2765218 ?auto_2765226 ) ) ( not ( = ?auto_2765218 ?auto_2765227 ) ) ( not ( = ?auto_2765218 ?auto_2765228 ) ) ( not ( = ?auto_2765218 ?auto_2765229 ) ) ( not ( = ?auto_2765218 ?auto_2765232 ) ) ( not ( = ?auto_2765220 ?auto_2765221 ) ) ( not ( = ?auto_2765220 ?auto_2765222 ) ) ( not ( = ?auto_2765220 ?auto_2765223 ) ) ( not ( = ?auto_2765220 ?auto_2765224 ) ) ( not ( = ?auto_2765220 ?auto_2765225 ) ) ( not ( = ?auto_2765220 ?auto_2765226 ) ) ( not ( = ?auto_2765220 ?auto_2765227 ) ) ( not ( = ?auto_2765220 ?auto_2765228 ) ) ( not ( = ?auto_2765220 ?auto_2765229 ) ) ( not ( = ?auto_2765220 ?auto_2765232 ) ) ( not ( = ?auto_2765221 ?auto_2765222 ) ) ( not ( = ?auto_2765221 ?auto_2765223 ) ) ( not ( = ?auto_2765221 ?auto_2765224 ) ) ( not ( = ?auto_2765221 ?auto_2765225 ) ) ( not ( = ?auto_2765221 ?auto_2765226 ) ) ( not ( = ?auto_2765221 ?auto_2765227 ) ) ( not ( = ?auto_2765221 ?auto_2765228 ) ) ( not ( = ?auto_2765221 ?auto_2765229 ) ) ( not ( = ?auto_2765221 ?auto_2765232 ) ) ( not ( = ?auto_2765222 ?auto_2765223 ) ) ( not ( = ?auto_2765222 ?auto_2765224 ) ) ( not ( = ?auto_2765222 ?auto_2765225 ) ) ( not ( = ?auto_2765222 ?auto_2765226 ) ) ( not ( = ?auto_2765222 ?auto_2765227 ) ) ( not ( = ?auto_2765222 ?auto_2765228 ) ) ( not ( = ?auto_2765222 ?auto_2765229 ) ) ( not ( = ?auto_2765222 ?auto_2765232 ) ) ( not ( = ?auto_2765223 ?auto_2765224 ) ) ( not ( = ?auto_2765223 ?auto_2765225 ) ) ( not ( = ?auto_2765223 ?auto_2765226 ) ) ( not ( = ?auto_2765223 ?auto_2765227 ) ) ( not ( = ?auto_2765223 ?auto_2765228 ) ) ( not ( = ?auto_2765223 ?auto_2765229 ) ) ( not ( = ?auto_2765223 ?auto_2765232 ) ) ( not ( = ?auto_2765224 ?auto_2765225 ) ) ( not ( = ?auto_2765224 ?auto_2765226 ) ) ( not ( = ?auto_2765224 ?auto_2765227 ) ) ( not ( = ?auto_2765224 ?auto_2765228 ) ) ( not ( = ?auto_2765224 ?auto_2765229 ) ) ( not ( = ?auto_2765224 ?auto_2765232 ) ) ( not ( = ?auto_2765225 ?auto_2765226 ) ) ( not ( = ?auto_2765225 ?auto_2765227 ) ) ( not ( = ?auto_2765225 ?auto_2765228 ) ) ( not ( = ?auto_2765225 ?auto_2765229 ) ) ( not ( = ?auto_2765225 ?auto_2765232 ) ) ( not ( = ?auto_2765226 ?auto_2765227 ) ) ( not ( = ?auto_2765226 ?auto_2765228 ) ) ( not ( = ?auto_2765226 ?auto_2765229 ) ) ( not ( = ?auto_2765226 ?auto_2765232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2765227 ?auto_2765228 ?auto_2765229 )
      ( MAKE-16CRATE-VERIFY ?auto_2765214 ?auto_2765215 ?auto_2765216 ?auto_2765213 ?auto_2765217 ?auto_2765219 ?auto_2765218 ?auto_2765220 ?auto_2765221 ?auto_2765222 ?auto_2765223 ?auto_2765224 ?auto_2765225 ?auto_2765226 ?auto_2765227 ?auto_2765228 ?auto_2765229 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2765463 - SURFACE
      ?auto_2765464 - SURFACE
      ?auto_2765465 - SURFACE
      ?auto_2765462 - SURFACE
      ?auto_2765466 - SURFACE
      ?auto_2765468 - SURFACE
      ?auto_2765467 - SURFACE
      ?auto_2765469 - SURFACE
      ?auto_2765470 - SURFACE
      ?auto_2765471 - SURFACE
      ?auto_2765472 - SURFACE
      ?auto_2765473 - SURFACE
      ?auto_2765474 - SURFACE
      ?auto_2765475 - SURFACE
      ?auto_2765476 - SURFACE
      ?auto_2765477 - SURFACE
      ?auto_2765478 - SURFACE
    )
    :vars
    (
      ?auto_2765483 - HOIST
      ?auto_2765481 - PLACE
      ?auto_2765482 - PLACE
      ?auto_2765479 - HOIST
      ?auto_2765484 - SURFACE
      ?auto_2765480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2765483 ?auto_2765481 ) ( IS-CRATE ?auto_2765478 ) ( not ( = ?auto_2765477 ?auto_2765478 ) ) ( not ( = ?auto_2765476 ?auto_2765477 ) ) ( not ( = ?auto_2765476 ?auto_2765478 ) ) ( not ( = ?auto_2765482 ?auto_2765481 ) ) ( HOIST-AT ?auto_2765479 ?auto_2765482 ) ( not ( = ?auto_2765483 ?auto_2765479 ) ) ( AVAILABLE ?auto_2765479 ) ( SURFACE-AT ?auto_2765478 ?auto_2765482 ) ( ON ?auto_2765478 ?auto_2765484 ) ( CLEAR ?auto_2765478 ) ( not ( = ?auto_2765477 ?auto_2765484 ) ) ( not ( = ?auto_2765478 ?auto_2765484 ) ) ( not ( = ?auto_2765476 ?auto_2765484 ) ) ( TRUCK-AT ?auto_2765480 ?auto_2765481 ) ( SURFACE-AT ?auto_2765476 ?auto_2765481 ) ( CLEAR ?auto_2765476 ) ( LIFTING ?auto_2765483 ?auto_2765477 ) ( IS-CRATE ?auto_2765477 ) ( ON ?auto_2765464 ?auto_2765463 ) ( ON ?auto_2765465 ?auto_2765464 ) ( ON ?auto_2765462 ?auto_2765465 ) ( ON ?auto_2765466 ?auto_2765462 ) ( ON ?auto_2765468 ?auto_2765466 ) ( ON ?auto_2765467 ?auto_2765468 ) ( ON ?auto_2765469 ?auto_2765467 ) ( ON ?auto_2765470 ?auto_2765469 ) ( ON ?auto_2765471 ?auto_2765470 ) ( ON ?auto_2765472 ?auto_2765471 ) ( ON ?auto_2765473 ?auto_2765472 ) ( ON ?auto_2765474 ?auto_2765473 ) ( ON ?auto_2765475 ?auto_2765474 ) ( ON ?auto_2765476 ?auto_2765475 ) ( not ( = ?auto_2765463 ?auto_2765464 ) ) ( not ( = ?auto_2765463 ?auto_2765465 ) ) ( not ( = ?auto_2765463 ?auto_2765462 ) ) ( not ( = ?auto_2765463 ?auto_2765466 ) ) ( not ( = ?auto_2765463 ?auto_2765468 ) ) ( not ( = ?auto_2765463 ?auto_2765467 ) ) ( not ( = ?auto_2765463 ?auto_2765469 ) ) ( not ( = ?auto_2765463 ?auto_2765470 ) ) ( not ( = ?auto_2765463 ?auto_2765471 ) ) ( not ( = ?auto_2765463 ?auto_2765472 ) ) ( not ( = ?auto_2765463 ?auto_2765473 ) ) ( not ( = ?auto_2765463 ?auto_2765474 ) ) ( not ( = ?auto_2765463 ?auto_2765475 ) ) ( not ( = ?auto_2765463 ?auto_2765476 ) ) ( not ( = ?auto_2765463 ?auto_2765477 ) ) ( not ( = ?auto_2765463 ?auto_2765478 ) ) ( not ( = ?auto_2765463 ?auto_2765484 ) ) ( not ( = ?auto_2765464 ?auto_2765465 ) ) ( not ( = ?auto_2765464 ?auto_2765462 ) ) ( not ( = ?auto_2765464 ?auto_2765466 ) ) ( not ( = ?auto_2765464 ?auto_2765468 ) ) ( not ( = ?auto_2765464 ?auto_2765467 ) ) ( not ( = ?auto_2765464 ?auto_2765469 ) ) ( not ( = ?auto_2765464 ?auto_2765470 ) ) ( not ( = ?auto_2765464 ?auto_2765471 ) ) ( not ( = ?auto_2765464 ?auto_2765472 ) ) ( not ( = ?auto_2765464 ?auto_2765473 ) ) ( not ( = ?auto_2765464 ?auto_2765474 ) ) ( not ( = ?auto_2765464 ?auto_2765475 ) ) ( not ( = ?auto_2765464 ?auto_2765476 ) ) ( not ( = ?auto_2765464 ?auto_2765477 ) ) ( not ( = ?auto_2765464 ?auto_2765478 ) ) ( not ( = ?auto_2765464 ?auto_2765484 ) ) ( not ( = ?auto_2765465 ?auto_2765462 ) ) ( not ( = ?auto_2765465 ?auto_2765466 ) ) ( not ( = ?auto_2765465 ?auto_2765468 ) ) ( not ( = ?auto_2765465 ?auto_2765467 ) ) ( not ( = ?auto_2765465 ?auto_2765469 ) ) ( not ( = ?auto_2765465 ?auto_2765470 ) ) ( not ( = ?auto_2765465 ?auto_2765471 ) ) ( not ( = ?auto_2765465 ?auto_2765472 ) ) ( not ( = ?auto_2765465 ?auto_2765473 ) ) ( not ( = ?auto_2765465 ?auto_2765474 ) ) ( not ( = ?auto_2765465 ?auto_2765475 ) ) ( not ( = ?auto_2765465 ?auto_2765476 ) ) ( not ( = ?auto_2765465 ?auto_2765477 ) ) ( not ( = ?auto_2765465 ?auto_2765478 ) ) ( not ( = ?auto_2765465 ?auto_2765484 ) ) ( not ( = ?auto_2765462 ?auto_2765466 ) ) ( not ( = ?auto_2765462 ?auto_2765468 ) ) ( not ( = ?auto_2765462 ?auto_2765467 ) ) ( not ( = ?auto_2765462 ?auto_2765469 ) ) ( not ( = ?auto_2765462 ?auto_2765470 ) ) ( not ( = ?auto_2765462 ?auto_2765471 ) ) ( not ( = ?auto_2765462 ?auto_2765472 ) ) ( not ( = ?auto_2765462 ?auto_2765473 ) ) ( not ( = ?auto_2765462 ?auto_2765474 ) ) ( not ( = ?auto_2765462 ?auto_2765475 ) ) ( not ( = ?auto_2765462 ?auto_2765476 ) ) ( not ( = ?auto_2765462 ?auto_2765477 ) ) ( not ( = ?auto_2765462 ?auto_2765478 ) ) ( not ( = ?auto_2765462 ?auto_2765484 ) ) ( not ( = ?auto_2765466 ?auto_2765468 ) ) ( not ( = ?auto_2765466 ?auto_2765467 ) ) ( not ( = ?auto_2765466 ?auto_2765469 ) ) ( not ( = ?auto_2765466 ?auto_2765470 ) ) ( not ( = ?auto_2765466 ?auto_2765471 ) ) ( not ( = ?auto_2765466 ?auto_2765472 ) ) ( not ( = ?auto_2765466 ?auto_2765473 ) ) ( not ( = ?auto_2765466 ?auto_2765474 ) ) ( not ( = ?auto_2765466 ?auto_2765475 ) ) ( not ( = ?auto_2765466 ?auto_2765476 ) ) ( not ( = ?auto_2765466 ?auto_2765477 ) ) ( not ( = ?auto_2765466 ?auto_2765478 ) ) ( not ( = ?auto_2765466 ?auto_2765484 ) ) ( not ( = ?auto_2765468 ?auto_2765467 ) ) ( not ( = ?auto_2765468 ?auto_2765469 ) ) ( not ( = ?auto_2765468 ?auto_2765470 ) ) ( not ( = ?auto_2765468 ?auto_2765471 ) ) ( not ( = ?auto_2765468 ?auto_2765472 ) ) ( not ( = ?auto_2765468 ?auto_2765473 ) ) ( not ( = ?auto_2765468 ?auto_2765474 ) ) ( not ( = ?auto_2765468 ?auto_2765475 ) ) ( not ( = ?auto_2765468 ?auto_2765476 ) ) ( not ( = ?auto_2765468 ?auto_2765477 ) ) ( not ( = ?auto_2765468 ?auto_2765478 ) ) ( not ( = ?auto_2765468 ?auto_2765484 ) ) ( not ( = ?auto_2765467 ?auto_2765469 ) ) ( not ( = ?auto_2765467 ?auto_2765470 ) ) ( not ( = ?auto_2765467 ?auto_2765471 ) ) ( not ( = ?auto_2765467 ?auto_2765472 ) ) ( not ( = ?auto_2765467 ?auto_2765473 ) ) ( not ( = ?auto_2765467 ?auto_2765474 ) ) ( not ( = ?auto_2765467 ?auto_2765475 ) ) ( not ( = ?auto_2765467 ?auto_2765476 ) ) ( not ( = ?auto_2765467 ?auto_2765477 ) ) ( not ( = ?auto_2765467 ?auto_2765478 ) ) ( not ( = ?auto_2765467 ?auto_2765484 ) ) ( not ( = ?auto_2765469 ?auto_2765470 ) ) ( not ( = ?auto_2765469 ?auto_2765471 ) ) ( not ( = ?auto_2765469 ?auto_2765472 ) ) ( not ( = ?auto_2765469 ?auto_2765473 ) ) ( not ( = ?auto_2765469 ?auto_2765474 ) ) ( not ( = ?auto_2765469 ?auto_2765475 ) ) ( not ( = ?auto_2765469 ?auto_2765476 ) ) ( not ( = ?auto_2765469 ?auto_2765477 ) ) ( not ( = ?auto_2765469 ?auto_2765478 ) ) ( not ( = ?auto_2765469 ?auto_2765484 ) ) ( not ( = ?auto_2765470 ?auto_2765471 ) ) ( not ( = ?auto_2765470 ?auto_2765472 ) ) ( not ( = ?auto_2765470 ?auto_2765473 ) ) ( not ( = ?auto_2765470 ?auto_2765474 ) ) ( not ( = ?auto_2765470 ?auto_2765475 ) ) ( not ( = ?auto_2765470 ?auto_2765476 ) ) ( not ( = ?auto_2765470 ?auto_2765477 ) ) ( not ( = ?auto_2765470 ?auto_2765478 ) ) ( not ( = ?auto_2765470 ?auto_2765484 ) ) ( not ( = ?auto_2765471 ?auto_2765472 ) ) ( not ( = ?auto_2765471 ?auto_2765473 ) ) ( not ( = ?auto_2765471 ?auto_2765474 ) ) ( not ( = ?auto_2765471 ?auto_2765475 ) ) ( not ( = ?auto_2765471 ?auto_2765476 ) ) ( not ( = ?auto_2765471 ?auto_2765477 ) ) ( not ( = ?auto_2765471 ?auto_2765478 ) ) ( not ( = ?auto_2765471 ?auto_2765484 ) ) ( not ( = ?auto_2765472 ?auto_2765473 ) ) ( not ( = ?auto_2765472 ?auto_2765474 ) ) ( not ( = ?auto_2765472 ?auto_2765475 ) ) ( not ( = ?auto_2765472 ?auto_2765476 ) ) ( not ( = ?auto_2765472 ?auto_2765477 ) ) ( not ( = ?auto_2765472 ?auto_2765478 ) ) ( not ( = ?auto_2765472 ?auto_2765484 ) ) ( not ( = ?auto_2765473 ?auto_2765474 ) ) ( not ( = ?auto_2765473 ?auto_2765475 ) ) ( not ( = ?auto_2765473 ?auto_2765476 ) ) ( not ( = ?auto_2765473 ?auto_2765477 ) ) ( not ( = ?auto_2765473 ?auto_2765478 ) ) ( not ( = ?auto_2765473 ?auto_2765484 ) ) ( not ( = ?auto_2765474 ?auto_2765475 ) ) ( not ( = ?auto_2765474 ?auto_2765476 ) ) ( not ( = ?auto_2765474 ?auto_2765477 ) ) ( not ( = ?auto_2765474 ?auto_2765478 ) ) ( not ( = ?auto_2765474 ?auto_2765484 ) ) ( not ( = ?auto_2765475 ?auto_2765476 ) ) ( not ( = ?auto_2765475 ?auto_2765477 ) ) ( not ( = ?auto_2765475 ?auto_2765478 ) ) ( not ( = ?auto_2765475 ?auto_2765484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2765476 ?auto_2765477 ?auto_2765478 )
      ( MAKE-16CRATE-VERIFY ?auto_2765463 ?auto_2765464 ?auto_2765465 ?auto_2765462 ?auto_2765466 ?auto_2765468 ?auto_2765467 ?auto_2765469 ?auto_2765470 ?auto_2765471 ?auto_2765472 ?auto_2765473 ?auto_2765474 ?auto_2765475 ?auto_2765476 ?auto_2765477 ?auto_2765478 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2765712 - SURFACE
      ?auto_2765713 - SURFACE
      ?auto_2765714 - SURFACE
      ?auto_2765711 - SURFACE
      ?auto_2765715 - SURFACE
      ?auto_2765717 - SURFACE
      ?auto_2765716 - SURFACE
      ?auto_2765718 - SURFACE
      ?auto_2765719 - SURFACE
      ?auto_2765720 - SURFACE
      ?auto_2765721 - SURFACE
      ?auto_2765722 - SURFACE
      ?auto_2765723 - SURFACE
      ?auto_2765724 - SURFACE
      ?auto_2765725 - SURFACE
      ?auto_2765726 - SURFACE
      ?auto_2765727 - SURFACE
    )
    :vars
    (
      ?auto_2765731 - HOIST
      ?auto_2765733 - PLACE
      ?auto_2765732 - PLACE
      ?auto_2765730 - HOIST
      ?auto_2765729 - SURFACE
      ?auto_2765728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2765731 ?auto_2765733 ) ( IS-CRATE ?auto_2765727 ) ( not ( = ?auto_2765726 ?auto_2765727 ) ) ( not ( = ?auto_2765725 ?auto_2765726 ) ) ( not ( = ?auto_2765725 ?auto_2765727 ) ) ( not ( = ?auto_2765732 ?auto_2765733 ) ) ( HOIST-AT ?auto_2765730 ?auto_2765732 ) ( not ( = ?auto_2765731 ?auto_2765730 ) ) ( AVAILABLE ?auto_2765730 ) ( SURFACE-AT ?auto_2765727 ?auto_2765732 ) ( ON ?auto_2765727 ?auto_2765729 ) ( CLEAR ?auto_2765727 ) ( not ( = ?auto_2765726 ?auto_2765729 ) ) ( not ( = ?auto_2765727 ?auto_2765729 ) ) ( not ( = ?auto_2765725 ?auto_2765729 ) ) ( TRUCK-AT ?auto_2765728 ?auto_2765733 ) ( SURFACE-AT ?auto_2765725 ?auto_2765733 ) ( CLEAR ?auto_2765725 ) ( IS-CRATE ?auto_2765726 ) ( AVAILABLE ?auto_2765731 ) ( IN ?auto_2765726 ?auto_2765728 ) ( ON ?auto_2765713 ?auto_2765712 ) ( ON ?auto_2765714 ?auto_2765713 ) ( ON ?auto_2765711 ?auto_2765714 ) ( ON ?auto_2765715 ?auto_2765711 ) ( ON ?auto_2765717 ?auto_2765715 ) ( ON ?auto_2765716 ?auto_2765717 ) ( ON ?auto_2765718 ?auto_2765716 ) ( ON ?auto_2765719 ?auto_2765718 ) ( ON ?auto_2765720 ?auto_2765719 ) ( ON ?auto_2765721 ?auto_2765720 ) ( ON ?auto_2765722 ?auto_2765721 ) ( ON ?auto_2765723 ?auto_2765722 ) ( ON ?auto_2765724 ?auto_2765723 ) ( ON ?auto_2765725 ?auto_2765724 ) ( not ( = ?auto_2765712 ?auto_2765713 ) ) ( not ( = ?auto_2765712 ?auto_2765714 ) ) ( not ( = ?auto_2765712 ?auto_2765711 ) ) ( not ( = ?auto_2765712 ?auto_2765715 ) ) ( not ( = ?auto_2765712 ?auto_2765717 ) ) ( not ( = ?auto_2765712 ?auto_2765716 ) ) ( not ( = ?auto_2765712 ?auto_2765718 ) ) ( not ( = ?auto_2765712 ?auto_2765719 ) ) ( not ( = ?auto_2765712 ?auto_2765720 ) ) ( not ( = ?auto_2765712 ?auto_2765721 ) ) ( not ( = ?auto_2765712 ?auto_2765722 ) ) ( not ( = ?auto_2765712 ?auto_2765723 ) ) ( not ( = ?auto_2765712 ?auto_2765724 ) ) ( not ( = ?auto_2765712 ?auto_2765725 ) ) ( not ( = ?auto_2765712 ?auto_2765726 ) ) ( not ( = ?auto_2765712 ?auto_2765727 ) ) ( not ( = ?auto_2765712 ?auto_2765729 ) ) ( not ( = ?auto_2765713 ?auto_2765714 ) ) ( not ( = ?auto_2765713 ?auto_2765711 ) ) ( not ( = ?auto_2765713 ?auto_2765715 ) ) ( not ( = ?auto_2765713 ?auto_2765717 ) ) ( not ( = ?auto_2765713 ?auto_2765716 ) ) ( not ( = ?auto_2765713 ?auto_2765718 ) ) ( not ( = ?auto_2765713 ?auto_2765719 ) ) ( not ( = ?auto_2765713 ?auto_2765720 ) ) ( not ( = ?auto_2765713 ?auto_2765721 ) ) ( not ( = ?auto_2765713 ?auto_2765722 ) ) ( not ( = ?auto_2765713 ?auto_2765723 ) ) ( not ( = ?auto_2765713 ?auto_2765724 ) ) ( not ( = ?auto_2765713 ?auto_2765725 ) ) ( not ( = ?auto_2765713 ?auto_2765726 ) ) ( not ( = ?auto_2765713 ?auto_2765727 ) ) ( not ( = ?auto_2765713 ?auto_2765729 ) ) ( not ( = ?auto_2765714 ?auto_2765711 ) ) ( not ( = ?auto_2765714 ?auto_2765715 ) ) ( not ( = ?auto_2765714 ?auto_2765717 ) ) ( not ( = ?auto_2765714 ?auto_2765716 ) ) ( not ( = ?auto_2765714 ?auto_2765718 ) ) ( not ( = ?auto_2765714 ?auto_2765719 ) ) ( not ( = ?auto_2765714 ?auto_2765720 ) ) ( not ( = ?auto_2765714 ?auto_2765721 ) ) ( not ( = ?auto_2765714 ?auto_2765722 ) ) ( not ( = ?auto_2765714 ?auto_2765723 ) ) ( not ( = ?auto_2765714 ?auto_2765724 ) ) ( not ( = ?auto_2765714 ?auto_2765725 ) ) ( not ( = ?auto_2765714 ?auto_2765726 ) ) ( not ( = ?auto_2765714 ?auto_2765727 ) ) ( not ( = ?auto_2765714 ?auto_2765729 ) ) ( not ( = ?auto_2765711 ?auto_2765715 ) ) ( not ( = ?auto_2765711 ?auto_2765717 ) ) ( not ( = ?auto_2765711 ?auto_2765716 ) ) ( not ( = ?auto_2765711 ?auto_2765718 ) ) ( not ( = ?auto_2765711 ?auto_2765719 ) ) ( not ( = ?auto_2765711 ?auto_2765720 ) ) ( not ( = ?auto_2765711 ?auto_2765721 ) ) ( not ( = ?auto_2765711 ?auto_2765722 ) ) ( not ( = ?auto_2765711 ?auto_2765723 ) ) ( not ( = ?auto_2765711 ?auto_2765724 ) ) ( not ( = ?auto_2765711 ?auto_2765725 ) ) ( not ( = ?auto_2765711 ?auto_2765726 ) ) ( not ( = ?auto_2765711 ?auto_2765727 ) ) ( not ( = ?auto_2765711 ?auto_2765729 ) ) ( not ( = ?auto_2765715 ?auto_2765717 ) ) ( not ( = ?auto_2765715 ?auto_2765716 ) ) ( not ( = ?auto_2765715 ?auto_2765718 ) ) ( not ( = ?auto_2765715 ?auto_2765719 ) ) ( not ( = ?auto_2765715 ?auto_2765720 ) ) ( not ( = ?auto_2765715 ?auto_2765721 ) ) ( not ( = ?auto_2765715 ?auto_2765722 ) ) ( not ( = ?auto_2765715 ?auto_2765723 ) ) ( not ( = ?auto_2765715 ?auto_2765724 ) ) ( not ( = ?auto_2765715 ?auto_2765725 ) ) ( not ( = ?auto_2765715 ?auto_2765726 ) ) ( not ( = ?auto_2765715 ?auto_2765727 ) ) ( not ( = ?auto_2765715 ?auto_2765729 ) ) ( not ( = ?auto_2765717 ?auto_2765716 ) ) ( not ( = ?auto_2765717 ?auto_2765718 ) ) ( not ( = ?auto_2765717 ?auto_2765719 ) ) ( not ( = ?auto_2765717 ?auto_2765720 ) ) ( not ( = ?auto_2765717 ?auto_2765721 ) ) ( not ( = ?auto_2765717 ?auto_2765722 ) ) ( not ( = ?auto_2765717 ?auto_2765723 ) ) ( not ( = ?auto_2765717 ?auto_2765724 ) ) ( not ( = ?auto_2765717 ?auto_2765725 ) ) ( not ( = ?auto_2765717 ?auto_2765726 ) ) ( not ( = ?auto_2765717 ?auto_2765727 ) ) ( not ( = ?auto_2765717 ?auto_2765729 ) ) ( not ( = ?auto_2765716 ?auto_2765718 ) ) ( not ( = ?auto_2765716 ?auto_2765719 ) ) ( not ( = ?auto_2765716 ?auto_2765720 ) ) ( not ( = ?auto_2765716 ?auto_2765721 ) ) ( not ( = ?auto_2765716 ?auto_2765722 ) ) ( not ( = ?auto_2765716 ?auto_2765723 ) ) ( not ( = ?auto_2765716 ?auto_2765724 ) ) ( not ( = ?auto_2765716 ?auto_2765725 ) ) ( not ( = ?auto_2765716 ?auto_2765726 ) ) ( not ( = ?auto_2765716 ?auto_2765727 ) ) ( not ( = ?auto_2765716 ?auto_2765729 ) ) ( not ( = ?auto_2765718 ?auto_2765719 ) ) ( not ( = ?auto_2765718 ?auto_2765720 ) ) ( not ( = ?auto_2765718 ?auto_2765721 ) ) ( not ( = ?auto_2765718 ?auto_2765722 ) ) ( not ( = ?auto_2765718 ?auto_2765723 ) ) ( not ( = ?auto_2765718 ?auto_2765724 ) ) ( not ( = ?auto_2765718 ?auto_2765725 ) ) ( not ( = ?auto_2765718 ?auto_2765726 ) ) ( not ( = ?auto_2765718 ?auto_2765727 ) ) ( not ( = ?auto_2765718 ?auto_2765729 ) ) ( not ( = ?auto_2765719 ?auto_2765720 ) ) ( not ( = ?auto_2765719 ?auto_2765721 ) ) ( not ( = ?auto_2765719 ?auto_2765722 ) ) ( not ( = ?auto_2765719 ?auto_2765723 ) ) ( not ( = ?auto_2765719 ?auto_2765724 ) ) ( not ( = ?auto_2765719 ?auto_2765725 ) ) ( not ( = ?auto_2765719 ?auto_2765726 ) ) ( not ( = ?auto_2765719 ?auto_2765727 ) ) ( not ( = ?auto_2765719 ?auto_2765729 ) ) ( not ( = ?auto_2765720 ?auto_2765721 ) ) ( not ( = ?auto_2765720 ?auto_2765722 ) ) ( not ( = ?auto_2765720 ?auto_2765723 ) ) ( not ( = ?auto_2765720 ?auto_2765724 ) ) ( not ( = ?auto_2765720 ?auto_2765725 ) ) ( not ( = ?auto_2765720 ?auto_2765726 ) ) ( not ( = ?auto_2765720 ?auto_2765727 ) ) ( not ( = ?auto_2765720 ?auto_2765729 ) ) ( not ( = ?auto_2765721 ?auto_2765722 ) ) ( not ( = ?auto_2765721 ?auto_2765723 ) ) ( not ( = ?auto_2765721 ?auto_2765724 ) ) ( not ( = ?auto_2765721 ?auto_2765725 ) ) ( not ( = ?auto_2765721 ?auto_2765726 ) ) ( not ( = ?auto_2765721 ?auto_2765727 ) ) ( not ( = ?auto_2765721 ?auto_2765729 ) ) ( not ( = ?auto_2765722 ?auto_2765723 ) ) ( not ( = ?auto_2765722 ?auto_2765724 ) ) ( not ( = ?auto_2765722 ?auto_2765725 ) ) ( not ( = ?auto_2765722 ?auto_2765726 ) ) ( not ( = ?auto_2765722 ?auto_2765727 ) ) ( not ( = ?auto_2765722 ?auto_2765729 ) ) ( not ( = ?auto_2765723 ?auto_2765724 ) ) ( not ( = ?auto_2765723 ?auto_2765725 ) ) ( not ( = ?auto_2765723 ?auto_2765726 ) ) ( not ( = ?auto_2765723 ?auto_2765727 ) ) ( not ( = ?auto_2765723 ?auto_2765729 ) ) ( not ( = ?auto_2765724 ?auto_2765725 ) ) ( not ( = ?auto_2765724 ?auto_2765726 ) ) ( not ( = ?auto_2765724 ?auto_2765727 ) ) ( not ( = ?auto_2765724 ?auto_2765729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2765725 ?auto_2765726 ?auto_2765727 )
      ( MAKE-16CRATE-VERIFY ?auto_2765712 ?auto_2765713 ?auto_2765714 ?auto_2765711 ?auto_2765715 ?auto_2765717 ?auto_2765716 ?auto_2765718 ?auto_2765719 ?auto_2765720 ?auto_2765721 ?auto_2765722 ?auto_2765723 ?auto_2765724 ?auto_2765725 ?auto_2765726 ?auto_2765727 ) )
  )

)

