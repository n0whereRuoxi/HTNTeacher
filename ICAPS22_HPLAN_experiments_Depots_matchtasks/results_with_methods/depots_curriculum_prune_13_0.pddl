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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13356 - SURFACE
      ?auto_13357 - SURFACE
    )
    :vars
    (
      ?auto_13358 - HOIST
      ?auto_13359 - PLACE
      ?auto_13361 - PLACE
      ?auto_13362 - HOIST
      ?auto_13363 - SURFACE
      ?auto_13360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13358 ?auto_13359 ) ( SURFACE-AT ?auto_13356 ?auto_13359 ) ( CLEAR ?auto_13356 ) ( IS-CRATE ?auto_13357 ) ( AVAILABLE ?auto_13358 ) ( not ( = ?auto_13361 ?auto_13359 ) ) ( HOIST-AT ?auto_13362 ?auto_13361 ) ( AVAILABLE ?auto_13362 ) ( SURFACE-AT ?auto_13357 ?auto_13361 ) ( ON ?auto_13357 ?auto_13363 ) ( CLEAR ?auto_13357 ) ( TRUCK-AT ?auto_13360 ?auto_13359 ) ( not ( = ?auto_13356 ?auto_13357 ) ) ( not ( = ?auto_13356 ?auto_13363 ) ) ( not ( = ?auto_13357 ?auto_13363 ) ) ( not ( = ?auto_13358 ?auto_13362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13360 ?auto_13359 ?auto_13361 )
      ( !LIFT ?auto_13362 ?auto_13357 ?auto_13363 ?auto_13361 )
      ( !LOAD ?auto_13362 ?auto_13357 ?auto_13360 ?auto_13361 )
      ( !DRIVE ?auto_13360 ?auto_13361 ?auto_13359 )
      ( !UNLOAD ?auto_13358 ?auto_13357 ?auto_13360 ?auto_13359 )
      ( !DROP ?auto_13358 ?auto_13357 ?auto_13356 ?auto_13359 )
      ( MAKE-1CRATE-VERIFY ?auto_13356 ?auto_13357 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13377 - SURFACE
      ?auto_13378 - SURFACE
      ?auto_13379 - SURFACE
    )
    :vars
    (
      ?auto_13380 - HOIST
      ?auto_13381 - PLACE
      ?auto_13382 - PLACE
      ?auto_13385 - HOIST
      ?auto_13384 - SURFACE
      ?auto_13387 - PLACE
      ?auto_13386 - HOIST
      ?auto_13388 - SURFACE
      ?auto_13383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13380 ?auto_13381 ) ( IS-CRATE ?auto_13379 ) ( not ( = ?auto_13382 ?auto_13381 ) ) ( HOIST-AT ?auto_13385 ?auto_13382 ) ( AVAILABLE ?auto_13385 ) ( SURFACE-AT ?auto_13379 ?auto_13382 ) ( ON ?auto_13379 ?auto_13384 ) ( CLEAR ?auto_13379 ) ( not ( = ?auto_13378 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13384 ) ) ( not ( = ?auto_13379 ?auto_13384 ) ) ( not ( = ?auto_13380 ?auto_13385 ) ) ( SURFACE-AT ?auto_13377 ?auto_13381 ) ( CLEAR ?auto_13377 ) ( IS-CRATE ?auto_13378 ) ( AVAILABLE ?auto_13380 ) ( not ( = ?auto_13387 ?auto_13381 ) ) ( HOIST-AT ?auto_13386 ?auto_13387 ) ( AVAILABLE ?auto_13386 ) ( SURFACE-AT ?auto_13378 ?auto_13387 ) ( ON ?auto_13378 ?auto_13388 ) ( CLEAR ?auto_13378 ) ( TRUCK-AT ?auto_13383 ?auto_13381 ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13388 ) ) ( not ( = ?auto_13378 ?auto_13388 ) ) ( not ( = ?auto_13380 ?auto_13386 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13384 ) ) ( not ( = ?auto_13379 ?auto_13388 ) ) ( not ( = ?auto_13382 ?auto_13387 ) ) ( not ( = ?auto_13385 ?auto_13386 ) ) ( not ( = ?auto_13384 ?auto_13388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13377 ?auto_13378 )
      ( MAKE-1CRATE ?auto_13378 ?auto_13379 )
      ( MAKE-2CRATE-VERIFY ?auto_13377 ?auto_13378 ?auto_13379 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13403 - SURFACE
      ?auto_13404 - SURFACE
      ?auto_13405 - SURFACE
      ?auto_13406 - SURFACE
    )
    :vars
    (
      ?auto_13407 - HOIST
      ?auto_13411 - PLACE
      ?auto_13410 - PLACE
      ?auto_13409 - HOIST
      ?auto_13412 - SURFACE
      ?auto_13416 - PLACE
      ?auto_13414 - HOIST
      ?auto_13417 - SURFACE
      ?auto_13413 - PLACE
      ?auto_13415 - HOIST
      ?auto_13418 - SURFACE
      ?auto_13408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13407 ?auto_13411 ) ( IS-CRATE ?auto_13406 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( HOIST-AT ?auto_13409 ?auto_13410 ) ( AVAILABLE ?auto_13409 ) ( SURFACE-AT ?auto_13406 ?auto_13410 ) ( ON ?auto_13406 ?auto_13412 ) ( CLEAR ?auto_13406 ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13412 ) ) ( not ( = ?auto_13406 ?auto_13412 ) ) ( not ( = ?auto_13407 ?auto_13409 ) ) ( IS-CRATE ?auto_13405 ) ( not ( = ?auto_13416 ?auto_13411 ) ) ( HOIST-AT ?auto_13414 ?auto_13416 ) ( AVAILABLE ?auto_13414 ) ( SURFACE-AT ?auto_13405 ?auto_13416 ) ( ON ?auto_13405 ?auto_13417 ) ( CLEAR ?auto_13405 ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13417 ) ) ( not ( = ?auto_13405 ?auto_13417 ) ) ( not ( = ?auto_13407 ?auto_13414 ) ) ( SURFACE-AT ?auto_13403 ?auto_13411 ) ( CLEAR ?auto_13403 ) ( IS-CRATE ?auto_13404 ) ( AVAILABLE ?auto_13407 ) ( not ( = ?auto_13413 ?auto_13411 ) ) ( HOIST-AT ?auto_13415 ?auto_13413 ) ( AVAILABLE ?auto_13415 ) ( SURFACE-AT ?auto_13404 ?auto_13413 ) ( ON ?auto_13404 ?auto_13418 ) ( CLEAR ?auto_13404 ) ( TRUCK-AT ?auto_13408 ?auto_13411 ) ( not ( = ?auto_13403 ?auto_13404 ) ) ( not ( = ?auto_13403 ?auto_13418 ) ) ( not ( = ?auto_13404 ?auto_13418 ) ) ( not ( = ?auto_13407 ?auto_13415 ) ) ( not ( = ?auto_13403 ?auto_13405 ) ) ( not ( = ?auto_13403 ?auto_13417 ) ) ( not ( = ?auto_13405 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13413 ) ) ( not ( = ?auto_13414 ?auto_13415 ) ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13403 ?auto_13406 ) ) ( not ( = ?auto_13403 ?auto_13412 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13404 ?auto_13412 ) ) ( not ( = ?auto_13406 ?auto_13417 ) ) ( not ( = ?auto_13406 ?auto_13418 ) ) ( not ( = ?auto_13410 ?auto_13416 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13409 ?auto_13414 ) ) ( not ( = ?auto_13409 ?auto_13415 ) ) ( not ( = ?auto_13412 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13403 ?auto_13404 ?auto_13405 )
      ( MAKE-1CRATE ?auto_13405 ?auto_13406 )
      ( MAKE-3CRATE-VERIFY ?auto_13403 ?auto_13404 ?auto_13405 ?auto_13406 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13434 - SURFACE
      ?auto_13435 - SURFACE
      ?auto_13436 - SURFACE
      ?auto_13437 - SURFACE
      ?auto_13438 - SURFACE
    )
    :vars
    (
      ?auto_13442 - HOIST
      ?auto_13439 - PLACE
      ?auto_13440 - PLACE
      ?auto_13441 - HOIST
      ?auto_13444 - SURFACE
      ?auto_13446 - PLACE
      ?auto_13445 - HOIST
      ?auto_13450 - SURFACE
      ?auto_13452 - PLACE
      ?auto_13453 - HOIST
      ?auto_13448 - SURFACE
      ?auto_13449 - PLACE
      ?auto_13451 - HOIST
      ?auto_13447 - SURFACE
      ?auto_13443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13442 ?auto_13439 ) ( IS-CRATE ?auto_13438 ) ( not ( = ?auto_13440 ?auto_13439 ) ) ( HOIST-AT ?auto_13441 ?auto_13440 ) ( AVAILABLE ?auto_13441 ) ( SURFACE-AT ?auto_13438 ?auto_13440 ) ( ON ?auto_13438 ?auto_13444 ) ( CLEAR ?auto_13438 ) ( not ( = ?auto_13437 ?auto_13438 ) ) ( not ( = ?auto_13437 ?auto_13444 ) ) ( not ( = ?auto_13438 ?auto_13444 ) ) ( not ( = ?auto_13442 ?auto_13441 ) ) ( IS-CRATE ?auto_13437 ) ( not ( = ?auto_13446 ?auto_13439 ) ) ( HOIST-AT ?auto_13445 ?auto_13446 ) ( AVAILABLE ?auto_13445 ) ( SURFACE-AT ?auto_13437 ?auto_13446 ) ( ON ?auto_13437 ?auto_13450 ) ( CLEAR ?auto_13437 ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( not ( = ?auto_13436 ?auto_13450 ) ) ( not ( = ?auto_13437 ?auto_13450 ) ) ( not ( = ?auto_13442 ?auto_13445 ) ) ( IS-CRATE ?auto_13436 ) ( not ( = ?auto_13452 ?auto_13439 ) ) ( HOIST-AT ?auto_13453 ?auto_13452 ) ( AVAILABLE ?auto_13453 ) ( SURFACE-AT ?auto_13436 ?auto_13452 ) ( ON ?auto_13436 ?auto_13448 ) ( CLEAR ?auto_13436 ) ( not ( = ?auto_13435 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13448 ) ) ( not ( = ?auto_13436 ?auto_13448 ) ) ( not ( = ?auto_13442 ?auto_13453 ) ) ( SURFACE-AT ?auto_13434 ?auto_13439 ) ( CLEAR ?auto_13434 ) ( IS-CRATE ?auto_13435 ) ( AVAILABLE ?auto_13442 ) ( not ( = ?auto_13449 ?auto_13439 ) ) ( HOIST-AT ?auto_13451 ?auto_13449 ) ( AVAILABLE ?auto_13451 ) ( SURFACE-AT ?auto_13435 ?auto_13449 ) ( ON ?auto_13435 ?auto_13447 ) ( CLEAR ?auto_13435 ) ( TRUCK-AT ?auto_13443 ?auto_13439 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( not ( = ?auto_13434 ?auto_13447 ) ) ( not ( = ?auto_13435 ?auto_13447 ) ) ( not ( = ?auto_13442 ?auto_13451 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13448 ) ) ( not ( = ?auto_13436 ?auto_13447 ) ) ( not ( = ?auto_13452 ?auto_13449 ) ) ( not ( = ?auto_13453 ?auto_13451 ) ) ( not ( = ?auto_13448 ?auto_13447 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13450 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13435 ?auto_13450 ) ) ( not ( = ?auto_13437 ?auto_13448 ) ) ( not ( = ?auto_13437 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13452 ) ) ( not ( = ?auto_13446 ?auto_13449 ) ) ( not ( = ?auto_13445 ?auto_13453 ) ) ( not ( = ?auto_13445 ?auto_13451 ) ) ( not ( = ?auto_13450 ?auto_13448 ) ) ( not ( = ?auto_13450 ?auto_13447 ) ) ( not ( = ?auto_13434 ?auto_13438 ) ) ( not ( = ?auto_13434 ?auto_13444 ) ) ( not ( = ?auto_13435 ?auto_13438 ) ) ( not ( = ?auto_13435 ?auto_13444 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( not ( = ?auto_13436 ?auto_13444 ) ) ( not ( = ?auto_13438 ?auto_13450 ) ) ( not ( = ?auto_13438 ?auto_13448 ) ) ( not ( = ?auto_13438 ?auto_13447 ) ) ( not ( = ?auto_13440 ?auto_13446 ) ) ( not ( = ?auto_13440 ?auto_13452 ) ) ( not ( = ?auto_13440 ?auto_13449 ) ) ( not ( = ?auto_13441 ?auto_13445 ) ) ( not ( = ?auto_13441 ?auto_13453 ) ) ( not ( = ?auto_13441 ?auto_13451 ) ) ( not ( = ?auto_13444 ?auto_13450 ) ) ( not ( = ?auto_13444 ?auto_13448 ) ) ( not ( = ?auto_13444 ?auto_13447 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13437 )
      ( MAKE-1CRATE ?auto_13437 ?auto_13438 )
      ( MAKE-4CRATE-VERIFY ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13437 ?auto_13438 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13470 - SURFACE
      ?auto_13471 - SURFACE
      ?auto_13472 - SURFACE
      ?auto_13473 - SURFACE
      ?auto_13474 - SURFACE
      ?auto_13475 - SURFACE
    )
    :vars
    (
      ?auto_13477 - HOIST
      ?auto_13480 - PLACE
      ?auto_13476 - PLACE
      ?auto_13481 - HOIST
      ?auto_13478 - SURFACE
      ?auto_13491 - PLACE
      ?auto_13486 - HOIST
      ?auto_13492 - SURFACE
      ?auto_13493 - PLACE
      ?auto_13483 - HOIST
      ?auto_13489 - SURFACE
      ?auto_13487 - PLACE
      ?auto_13482 - HOIST
      ?auto_13485 - SURFACE
      ?auto_13490 - PLACE
      ?auto_13488 - HOIST
      ?auto_13484 - SURFACE
      ?auto_13479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13477 ?auto_13480 ) ( IS-CRATE ?auto_13475 ) ( not ( = ?auto_13476 ?auto_13480 ) ) ( HOIST-AT ?auto_13481 ?auto_13476 ) ( AVAILABLE ?auto_13481 ) ( SURFACE-AT ?auto_13475 ?auto_13476 ) ( ON ?auto_13475 ?auto_13478 ) ( CLEAR ?auto_13475 ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13478 ) ) ( not ( = ?auto_13475 ?auto_13478 ) ) ( not ( = ?auto_13477 ?auto_13481 ) ) ( IS-CRATE ?auto_13474 ) ( not ( = ?auto_13491 ?auto_13480 ) ) ( HOIST-AT ?auto_13486 ?auto_13491 ) ( AVAILABLE ?auto_13486 ) ( SURFACE-AT ?auto_13474 ?auto_13491 ) ( ON ?auto_13474 ?auto_13492 ) ( CLEAR ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13492 ) ) ( not ( = ?auto_13474 ?auto_13492 ) ) ( not ( = ?auto_13477 ?auto_13486 ) ) ( IS-CRATE ?auto_13473 ) ( not ( = ?auto_13493 ?auto_13480 ) ) ( HOIST-AT ?auto_13483 ?auto_13493 ) ( AVAILABLE ?auto_13483 ) ( SURFACE-AT ?auto_13473 ?auto_13493 ) ( ON ?auto_13473 ?auto_13489 ) ( CLEAR ?auto_13473 ) ( not ( = ?auto_13472 ?auto_13473 ) ) ( not ( = ?auto_13472 ?auto_13489 ) ) ( not ( = ?auto_13473 ?auto_13489 ) ) ( not ( = ?auto_13477 ?auto_13483 ) ) ( IS-CRATE ?auto_13472 ) ( not ( = ?auto_13487 ?auto_13480 ) ) ( HOIST-AT ?auto_13482 ?auto_13487 ) ( AVAILABLE ?auto_13482 ) ( SURFACE-AT ?auto_13472 ?auto_13487 ) ( ON ?auto_13472 ?auto_13485 ) ( CLEAR ?auto_13472 ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13485 ) ) ( not ( = ?auto_13472 ?auto_13485 ) ) ( not ( = ?auto_13477 ?auto_13482 ) ) ( SURFACE-AT ?auto_13470 ?auto_13480 ) ( CLEAR ?auto_13470 ) ( IS-CRATE ?auto_13471 ) ( AVAILABLE ?auto_13477 ) ( not ( = ?auto_13490 ?auto_13480 ) ) ( HOIST-AT ?auto_13488 ?auto_13490 ) ( AVAILABLE ?auto_13488 ) ( SURFACE-AT ?auto_13471 ?auto_13490 ) ( ON ?auto_13471 ?auto_13484 ) ( CLEAR ?auto_13471 ) ( TRUCK-AT ?auto_13479 ?auto_13480 ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( not ( = ?auto_13470 ?auto_13484 ) ) ( not ( = ?auto_13471 ?auto_13484 ) ) ( not ( = ?auto_13477 ?auto_13488 ) ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13470 ?auto_13485 ) ) ( not ( = ?auto_13472 ?auto_13484 ) ) ( not ( = ?auto_13487 ?auto_13490 ) ) ( not ( = ?auto_13482 ?auto_13488 ) ) ( not ( = ?auto_13485 ?auto_13484 ) ) ( not ( = ?auto_13470 ?auto_13473 ) ) ( not ( = ?auto_13470 ?auto_13489 ) ) ( not ( = ?auto_13471 ?auto_13473 ) ) ( not ( = ?auto_13471 ?auto_13489 ) ) ( not ( = ?auto_13473 ?auto_13485 ) ) ( not ( = ?auto_13473 ?auto_13484 ) ) ( not ( = ?auto_13493 ?auto_13487 ) ) ( not ( = ?auto_13493 ?auto_13490 ) ) ( not ( = ?auto_13483 ?auto_13482 ) ) ( not ( = ?auto_13483 ?auto_13488 ) ) ( not ( = ?auto_13489 ?auto_13485 ) ) ( not ( = ?auto_13489 ?auto_13484 ) ) ( not ( = ?auto_13470 ?auto_13474 ) ) ( not ( = ?auto_13470 ?auto_13492 ) ) ( not ( = ?auto_13471 ?auto_13474 ) ) ( not ( = ?auto_13471 ?auto_13492 ) ) ( not ( = ?auto_13472 ?auto_13474 ) ) ( not ( = ?auto_13472 ?auto_13492 ) ) ( not ( = ?auto_13474 ?auto_13489 ) ) ( not ( = ?auto_13474 ?auto_13485 ) ) ( not ( = ?auto_13474 ?auto_13484 ) ) ( not ( = ?auto_13491 ?auto_13493 ) ) ( not ( = ?auto_13491 ?auto_13487 ) ) ( not ( = ?auto_13491 ?auto_13490 ) ) ( not ( = ?auto_13486 ?auto_13483 ) ) ( not ( = ?auto_13486 ?auto_13482 ) ) ( not ( = ?auto_13486 ?auto_13488 ) ) ( not ( = ?auto_13492 ?auto_13489 ) ) ( not ( = ?auto_13492 ?auto_13485 ) ) ( not ( = ?auto_13492 ?auto_13484 ) ) ( not ( = ?auto_13470 ?auto_13475 ) ) ( not ( = ?auto_13470 ?auto_13478 ) ) ( not ( = ?auto_13471 ?auto_13475 ) ) ( not ( = ?auto_13471 ?auto_13478 ) ) ( not ( = ?auto_13472 ?auto_13475 ) ) ( not ( = ?auto_13472 ?auto_13478 ) ) ( not ( = ?auto_13473 ?auto_13475 ) ) ( not ( = ?auto_13473 ?auto_13478 ) ) ( not ( = ?auto_13475 ?auto_13492 ) ) ( not ( = ?auto_13475 ?auto_13489 ) ) ( not ( = ?auto_13475 ?auto_13485 ) ) ( not ( = ?auto_13475 ?auto_13484 ) ) ( not ( = ?auto_13476 ?auto_13491 ) ) ( not ( = ?auto_13476 ?auto_13493 ) ) ( not ( = ?auto_13476 ?auto_13487 ) ) ( not ( = ?auto_13476 ?auto_13490 ) ) ( not ( = ?auto_13481 ?auto_13486 ) ) ( not ( = ?auto_13481 ?auto_13483 ) ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13488 ) ) ( not ( = ?auto_13478 ?auto_13492 ) ) ( not ( = ?auto_13478 ?auto_13489 ) ) ( not ( = ?auto_13478 ?auto_13485 ) ) ( not ( = ?auto_13478 ?auto_13484 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13470 ?auto_13471 ?auto_13472 ?auto_13473 ?auto_13474 )
      ( MAKE-1CRATE ?auto_13474 ?auto_13475 )
      ( MAKE-5CRATE-VERIFY ?auto_13470 ?auto_13471 ?auto_13472 ?auto_13473 ?auto_13474 ?auto_13475 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13511 - SURFACE
      ?auto_13512 - SURFACE
      ?auto_13513 - SURFACE
      ?auto_13514 - SURFACE
      ?auto_13515 - SURFACE
      ?auto_13516 - SURFACE
      ?auto_13517 - SURFACE
    )
    :vars
    (
      ?auto_13520 - HOIST
      ?auto_13522 - PLACE
      ?auto_13519 - PLACE
      ?auto_13523 - HOIST
      ?auto_13521 - SURFACE
      ?auto_13524 - PLACE
      ?auto_13525 - HOIST
      ?auto_13526 - SURFACE
      ?auto_13529 - PLACE
      ?auto_13534 - HOIST
      ?auto_13537 - SURFACE
      ?auto_13530 - PLACE
      ?auto_13527 - HOIST
      ?auto_13531 - SURFACE
      ?auto_13533 - PLACE
      ?auto_13538 - HOIST
      ?auto_13528 - SURFACE
      ?auto_13536 - PLACE
      ?auto_13532 - HOIST
      ?auto_13535 - SURFACE
      ?auto_13518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13520 ?auto_13522 ) ( IS-CRATE ?auto_13517 ) ( not ( = ?auto_13519 ?auto_13522 ) ) ( HOIST-AT ?auto_13523 ?auto_13519 ) ( AVAILABLE ?auto_13523 ) ( SURFACE-AT ?auto_13517 ?auto_13519 ) ( ON ?auto_13517 ?auto_13521 ) ( CLEAR ?auto_13517 ) ( not ( = ?auto_13516 ?auto_13517 ) ) ( not ( = ?auto_13516 ?auto_13521 ) ) ( not ( = ?auto_13517 ?auto_13521 ) ) ( not ( = ?auto_13520 ?auto_13523 ) ) ( IS-CRATE ?auto_13516 ) ( not ( = ?auto_13524 ?auto_13522 ) ) ( HOIST-AT ?auto_13525 ?auto_13524 ) ( AVAILABLE ?auto_13525 ) ( SURFACE-AT ?auto_13516 ?auto_13524 ) ( ON ?auto_13516 ?auto_13526 ) ( CLEAR ?auto_13516 ) ( not ( = ?auto_13515 ?auto_13516 ) ) ( not ( = ?auto_13515 ?auto_13526 ) ) ( not ( = ?auto_13516 ?auto_13526 ) ) ( not ( = ?auto_13520 ?auto_13525 ) ) ( IS-CRATE ?auto_13515 ) ( not ( = ?auto_13529 ?auto_13522 ) ) ( HOIST-AT ?auto_13534 ?auto_13529 ) ( AVAILABLE ?auto_13534 ) ( SURFACE-AT ?auto_13515 ?auto_13529 ) ( ON ?auto_13515 ?auto_13537 ) ( CLEAR ?auto_13515 ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13537 ) ) ( not ( = ?auto_13515 ?auto_13537 ) ) ( not ( = ?auto_13520 ?auto_13534 ) ) ( IS-CRATE ?auto_13514 ) ( not ( = ?auto_13530 ?auto_13522 ) ) ( HOIST-AT ?auto_13527 ?auto_13530 ) ( AVAILABLE ?auto_13527 ) ( SURFACE-AT ?auto_13514 ?auto_13530 ) ( ON ?auto_13514 ?auto_13531 ) ( CLEAR ?auto_13514 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13531 ) ) ( not ( = ?auto_13514 ?auto_13531 ) ) ( not ( = ?auto_13520 ?auto_13527 ) ) ( IS-CRATE ?auto_13513 ) ( not ( = ?auto_13533 ?auto_13522 ) ) ( HOIST-AT ?auto_13538 ?auto_13533 ) ( AVAILABLE ?auto_13538 ) ( SURFACE-AT ?auto_13513 ?auto_13533 ) ( ON ?auto_13513 ?auto_13528 ) ( CLEAR ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13528 ) ) ( not ( = ?auto_13513 ?auto_13528 ) ) ( not ( = ?auto_13520 ?auto_13538 ) ) ( SURFACE-AT ?auto_13511 ?auto_13522 ) ( CLEAR ?auto_13511 ) ( IS-CRATE ?auto_13512 ) ( AVAILABLE ?auto_13520 ) ( not ( = ?auto_13536 ?auto_13522 ) ) ( HOIST-AT ?auto_13532 ?auto_13536 ) ( AVAILABLE ?auto_13532 ) ( SURFACE-AT ?auto_13512 ?auto_13536 ) ( ON ?auto_13512 ?auto_13535 ) ( CLEAR ?auto_13512 ) ( TRUCK-AT ?auto_13518 ?auto_13522 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13535 ) ) ( not ( = ?auto_13512 ?auto_13535 ) ) ( not ( = ?auto_13520 ?auto_13532 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13528 ) ) ( not ( = ?auto_13513 ?auto_13535 ) ) ( not ( = ?auto_13533 ?auto_13536 ) ) ( not ( = ?auto_13538 ?auto_13532 ) ) ( not ( = ?auto_13528 ?auto_13535 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13511 ?auto_13531 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13531 ) ) ( not ( = ?auto_13514 ?auto_13528 ) ) ( not ( = ?auto_13514 ?auto_13535 ) ) ( not ( = ?auto_13530 ?auto_13533 ) ) ( not ( = ?auto_13530 ?auto_13536 ) ) ( not ( = ?auto_13527 ?auto_13538 ) ) ( not ( = ?auto_13527 ?auto_13532 ) ) ( not ( = ?auto_13531 ?auto_13528 ) ) ( not ( = ?auto_13531 ?auto_13535 ) ) ( not ( = ?auto_13511 ?auto_13515 ) ) ( not ( = ?auto_13511 ?auto_13537 ) ) ( not ( = ?auto_13512 ?auto_13515 ) ) ( not ( = ?auto_13512 ?auto_13537 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13537 ) ) ( not ( = ?auto_13515 ?auto_13531 ) ) ( not ( = ?auto_13515 ?auto_13528 ) ) ( not ( = ?auto_13515 ?auto_13535 ) ) ( not ( = ?auto_13529 ?auto_13530 ) ) ( not ( = ?auto_13529 ?auto_13533 ) ) ( not ( = ?auto_13529 ?auto_13536 ) ) ( not ( = ?auto_13534 ?auto_13527 ) ) ( not ( = ?auto_13534 ?auto_13538 ) ) ( not ( = ?auto_13534 ?auto_13532 ) ) ( not ( = ?auto_13537 ?auto_13531 ) ) ( not ( = ?auto_13537 ?auto_13528 ) ) ( not ( = ?auto_13537 ?auto_13535 ) ) ( not ( = ?auto_13511 ?auto_13516 ) ) ( not ( = ?auto_13511 ?auto_13526 ) ) ( not ( = ?auto_13512 ?auto_13516 ) ) ( not ( = ?auto_13512 ?auto_13526 ) ) ( not ( = ?auto_13513 ?auto_13516 ) ) ( not ( = ?auto_13513 ?auto_13526 ) ) ( not ( = ?auto_13514 ?auto_13516 ) ) ( not ( = ?auto_13514 ?auto_13526 ) ) ( not ( = ?auto_13516 ?auto_13537 ) ) ( not ( = ?auto_13516 ?auto_13531 ) ) ( not ( = ?auto_13516 ?auto_13528 ) ) ( not ( = ?auto_13516 ?auto_13535 ) ) ( not ( = ?auto_13524 ?auto_13529 ) ) ( not ( = ?auto_13524 ?auto_13530 ) ) ( not ( = ?auto_13524 ?auto_13533 ) ) ( not ( = ?auto_13524 ?auto_13536 ) ) ( not ( = ?auto_13525 ?auto_13534 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13538 ) ) ( not ( = ?auto_13525 ?auto_13532 ) ) ( not ( = ?auto_13526 ?auto_13537 ) ) ( not ( = ?auto_13526 ?auto_13531 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13535 ) ) ( not ( = ?auto_13511 ?auto_13517 ) ) ( not ( = ?auto_13511 ?auto_13521 ) ) ( not ( = ?auto_13512 ?auto_13517 ) ) ( not ( = ?auto_13512 ?auto_13521 ) ) ( not ( = ?auto_13513 ?auto_13517 ) ) ( not ( = ?auto_13513 ?auto_13521 ) ) ( not ( = ?auto_13514 ?auto_13517 ) ) ( not ( = ?auto_13514 ?auto_13521 ) ) ( not ( = ?auto_13515 ?auto_13517 ) ) ( not ( = ?auto_13515 ?auto_13521 ) ) ( not ( = ?auto_13517 ?auto_13526 ) ) ( not ( = ?auto_13517 ?auto_13537 ) ) ( not ( = ?auto_13517 ?auto_13531 ) ) ( not ( = ?auto_13517 ?auto_13528 ) ) ( not ( = ?auto_13517 ?auto_13535 ) ) ( not ( = ?auto_13519 ?auto_13524 ) ) ( not ( = ?auto_13519 ?auto_13529 ) ) ( not ( = ?auto_13519 ?auto_13530 ) ) ( not ( = ?auto_13519 ?auto_13533 ) ) ( not ( = ?auto_13519 ?auto_13536 ) ) ( not ( = ?auto_13523 ?auto_13525 ) ) ( not ( = ?auto_13523 ?auto_13534 ) ) ( not ( = ?auto_13523 ?auto_13527 ) ) ( not ( = ?auto_13523 ?auto_13538 ) ) ( not ( = ?auto_13523 ?auto_13532 ) ) ( not ( = ?auto_13521 ?auto_13526 ) ) ( not ( = ?auto_13521 ?auto_13537 ) ) ( not ( = ?auto_13521 ?auto_13531 ) ) ( not ( = ?auto_13521 ?auto_13528 ) ) ( not ( = ?auto_13521 ?auto_13535 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ?auto_13515 ?auto_13516 )
      ( MAKE-1CRATE ?auto_13516 ?auto_13517 )
      ( MAKE-6CRATE-VERIFY ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ?auto_13515 ?auto_13516 ?auto_13517 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13557 - SURFACE
      ?auto_13558 - SURFACE
      ?auto_13559 - SURFACE
      ?auto_13560 - SURFACE
      ?auto_13561 - SURFACE
      ?auto_13562 - SURFACE
      ?auto_13563 - SURFACE
      ?auto_13564 - SURFACE
    )
    :vars
    (
      ?auto_13568 - HOIST
      ?auto_13570 - PLACE
      ?auto_13567 - PLACE
      ?auto_13565 - HOIST
      ?auto_13566 - SURFACE
      ?auto_13583 - PLACE
      ?auto_13588 - HOIST
      ?auto_13586 - SURFACE
      ?auto_13584 - PLACE
      ?auto_13587 - HOIST
      ?auto_13581 - SURFACE
      ?auto_13572 - PLACE
      ?auto_13574 - HOIST
      ?auto_13578 - SURFACE
      ?auto_13571 - PLACE
      ?auto_13580 - HOIST
      ?auto_13579 - SURFACE
      ?auto_13575 - PLACE
      ?auto_13582 - HOIST
      ?auto_13573 - SURFACE
      ?auto_13577 - PLACE
      ?auto_13585 - HOIST
      ?auto_13576 - SURFACE
      ?auto_13569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13568 ?auto_13570 ) ( IS-CRATE ?auto_13564 ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( HOIST-AT ?auto_13565 ?auto_13567 ) ( AVAILABLE ?auto_13565 ) ( SURFACE-AT ?auto_13564 ?auto_13567 ) ( ON ?auto_13564 ?auto_13566 ) ( CLEAR ?auto_13564 ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13566 ) ) ( not ( = ?auto_13564 ?auto_13566 ) ) ( not ( = ?auto_13568 ?auto_13565 ) ) ( IS-CRATE ?auto_13563 ) ( not ( = ?auto_13583 ?auto_13570 ) ) ( HOIST-AT ?auto_13588 ?auto_13583 ) ( AVAILABLE ?auto_13588 ) ( SURFACE-AT ?auto_13563 ?auto_13583 ) ( ON ?auto_13563 ?auto_13586 ) ( CLEAR ?auto_13563 ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( not ( = ?auto_13562 ?auto_13586 ) ) ( not ( = ?auto_13563 ?auto_13586 ) ) ( not ( = ?auto_13568 ?auto_13588 ) ) ( IS-CRATE ?auto_13562 ) ( not ( = ?auto_13584 ?auto_13570 ) ) ( HOIST-AT ?auto_13587 ?auto_13584 ) ( AVAILABLE ?auto_13587 ) ( SURFACE-AT ?auto_13562 ?auto_13584 ) ( ON ?auto_13562 ?auto_13581 ) ( CLEAR ?auto_13562 ) ( not ( = ?auto_13561 ?auto_13562 ) ) ( not ( = ?auto_13561 ?auto_13581 ) ) ( not ( = ?auto_13562 ?auto_13581 ) ) ( not ( = ?auto_13568 ?auto_13587 ) ) ( IS-CRATE ?auto_13561 ) ( not ( = ?auto_13572 ?auto_13570 ) ) ( HOIST-AT ?auto_13574 ?auto_13572 ) ( AVAILABLE ?auto_13574 ) ( SURFACE-AT ?auto_13561 ?auto_13572 ) ( ON ?auto_13561 ?auto_13578 ) ( CLEAR ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13578 ) ) ( not ( = ?auto_13561 ?auto_13578 ) ) ( not ( = ?auto_13568 ?auto_13574 ) ) ( IS-CRATE ?auto_13560 ) ( not ( = ?auto_13571 ?auto_13570 ) ) ( HOIST-AT ?auto_13580 ?auto_13571 ) ( AVAILABLE ?auto_13580 ) ( SURFACE-AT ?auto_13560 ?auto_13571 ) ( ON ?auto_13560 ?auto_13579 ) ( CLEAR ?auto_13560 ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13559 ?auto_13579 ) ) ( not ( = ?auto_13560 ?auto_13579 ) ) ( not ( = ?auto_13568 ?auto_13580 ) ) ( IS-CRATE ?auto_13559 ) ( not ( = ?auto_13575 ?auto_13570 ) ) ( HOIST-AT ?auto_13582 ?auto_13575 ) ( AVAILABLE ?auto_13582 ) ( SURFACE-AT ?auto_13559 ?auto_13575 ) ( ON ?auto_13559 ?auto_13573 ) ( CLEAR ?auto_13559 ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13573 ) ) ( not ( = ?auto_13559 ?auto_13573 ) ) ( not ( = ?auto_13568 ?auto_13582 ) ) ( SURFACE-AT ?auto_13557 ?auto_13570 ) ( CLEAR ?auto_13557 ) ( IS-CRATE ?auto_13558 ) ( AVAILABLE ?auto_13568 ) ( not ( = ?auto_13577 ?auto_13570 ) ) ( HOIST-AT ?auto_13585 ?auto_13577 ) ( AVAILABLE ?auto_13585 ) ( SURFACE-AT ?auto_13558 ?auto_13577 ) ( ON ?auto_13558 ?auto_13576 ) ( CLEAR ?auto_13558 ) ( TRUCK-AT ?auto_13569 ?auto_13570 ) ( not ( = ?auto_13557 ?auto_13558 ) ) ( not ( = ?auto_13557 ?auto_13576 ) ) ( not ( = ?auto_13558 ?auto_13576 ) ) ( not ( = ?auto_13568 ?auto_13585 ) ) ( not ( = ?auto_13557 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13573 ) ) ( not ( = ?auto_13559 ?auto_13576 ) ) ( not ( = ?auto_13575 ?auto_13577 ) ) ( not ( = ?auto_13582 ?auto_13585 ) ) ( not ( = ?auto_13573 ?auto_13576 ) ) ( not ( = ?auto_13557 ?auto_13560 ) ) ( not ( = ?auto_13557 ?auto_13579 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13579 ) ) ( not ( = ?auto_13560 ?auto_13573 ) ) ( not ( = ?auto_13560 ?auto_13576 ) ) ( not ( = ?auto_13571 ?auto_13575 ) ) ( not ( = ?auto_13571 ?auto_13577 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13580 ?auto_13585 ) ) ( not ( = ?auto_13579 ?auto_13573 ) ) ( not ( = ?auto_13579 ?auto_13576 ) ) ( not ( = ?auto_13557 ?auto_13561 ) ) ( not ( = ?auto_13557 ?auto_13578 ) ) ( not ( = ?auto_13558 ?auto_13561 ) ) ( not ( = ?auto_13558 ?auto_13578 ) ) ( not ( = ?auto_13559 ?auto_13561 ) ) ( not ( = ?auto_13559 ?auto_13578 ) ) ( not ( = ?auto_13561 ?auto_13579 ) ) ( not ( = ?auto_13561 ?auto_13573 ) ) ( not ( = ?auto_13561 ?auto_13576 ) ) ( not ( = ?auto_13572 ?auto_13571 ) ) ( not ( = ?auto_13572 ?auto_13575 ) ) ( not ( = ?auto_13572 ?auto_13577 ) ) ( not ( = ?auto_13574 ?auto_13580 ) ) ( not ( = ?auto_13574 ?auto_13582 ) ) ( not ( = ?auto_13574 ?auto_13585 ) ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13573 ) ) ( not ( = ?auto_13578 ?auto_13576 ) ) ( not ( = ?auto_13557 ?auto_13562 ) ) ( not ( = ?auto_13557 ?auto_13581 ) ) ( not ( = ?auto_13558 ?auto_13562 ) ) ( not ( = ?auto_13558 ?auto_13581 ) ) ( not ( = ?auto_13559 ?auto_13562 ) ) ( not ( = ?auto_13559 ?auto_13581 ) ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13581 ) ) ( not ( = ?auto_13562 ?auto_13578 ) ) ( not ( = ?auto_13562 ?auto_13579 ) ) ( not ( = ?auto_13562 ?auto_13573 ) ) ( not ( = ?auto_13562 ?auto_13576 ) ) ( not ( = ?auto_13584 ?auto_13572 ) ) ( not ( = ?auto_13584 ?auto_13571 ) ) ( not ( = ?auto_13584 ?auto_13575 ) ) ( not ( = ?auto_13584 ?auto_13577 ) ) ( not ( = ?auto_13587 ?auto_13574 ) ) ( not ( = ?auto_13587 ?auto_13580 ) ) ( not ( = ?auto_13587 ?auto_13582 ) ) ( not ( = ?auto_13587 ?auto_13585 ) ) ( not ( = ?auto_13581 ?auto_13578 ) ) ( not ( = ?auto_13581 ?auto_13579 ) ) ( not ( = ?auto_13581 ?auto_13573 ) ) ( not ( = ?auto_13581 ?auto_13576 ) ) ( not ( = ?auto_13557 ?auto_13563 ) ) ( not ( = ?auto_13557 ?auto_13586 ) ) ( not ( = ?auto_13558 ?auto_13563 ) ) ( not ( = ?auto_13558 ?auto_13586 ) ) ( not ( = ?auto_13559 ?auto_13563 ) ) ( not ( = ?auto_13559 ?auto_13586 ) ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13560 ?auto_13586 ) ) ( not ( = ?auto_13561 ?auto_13563 ) ) ( not ( = ?auto_13561 ?auto_13586 ) ) ( not ( = ?auto_13563 ?auto_13581 ) ) ( not ( = ?auto_13563 ?auto_13578 ) ) ( not ( = ?auto_13563 ?auto_13579 ) ) ( not ( = ?auto_13563 ?auto_13573 ) ) ( not ( = ?auto_13563 ?auto_13576 ) ) ( not ( = ?auto_13583 ?auto_13584 ) ) ( not ( = ?auto_13583 ?auto_13572 ) ) ( not ( = ?auto_13583 ?auto_13571 ) ) ( not ( = ?auto_13583 ?auto_13575 ) ) ( not ( = ?auto_13583 ?auto_13577 ) ) ( not ( = ?auto_13588 ?auto_13587 ) ) ( not ( = ?auto_13588 ?auto_13574 ) ) ( not ( = ?auto_13588 ?auto_13580 ) ) ( not ( = ?auto_13588 ?auto_13582 ) ) ( not ( = ?auto_13588 ?auto_13585 ) ) ( not ( = ?auto_13586 ?auto_13581 ) ) ( not ( = ?auto_13586 ?auto_13578 ) ) ( not ( = ?auto_13586 ?auto_13579 ) ) ( not ( = ?auto_13586 ?auto_13573 ) ) ( not ( = ?auto_13586 ?auto_13576 ) ) ( not ( = ?auto_13557 ?auto_13564 ) ) ( not ( = ?auto_13557 ?auto_13566 ) ) ( not ( = ?auto_13558 ?auto_13564 ) ) ( not ( = ?auto_13558 ?auto_13566 ) ) ( not ( = ?auto_13559 ?auto_13564 ) ) ( not ( = ?auto_13559 ?auto_13566 ) ) ( not ( = ?auto_13560 ?auto_13564 ) ) ( not ( = ?auto_13560 ?auto_13566 ) ) ( not ( = ?auto_13561 ?auto_13564 ) ) ( not ( = ?auto_13561 ?auto_13566 ) ) ( not ( = ?auto_13562 ?auto_13564 ) ) ( not ( = ?auto_13562 ?auto_13566 ) ) ( not ( = ?auto_13564 ?auto_13586 ) ) ( not ( = ?auto_13564 ?auto_13581 ) ) ( not ( = ?auto_13564 ?auto_13578 ) ) ( not ( = ?auto_13564 ?auto_13579 ) ) ( not ( = ?auto_13564 ?auto_13573 ) ) ( not ( = ?auto_13564 ?auto_13576 ) ) ( not ( = ?auto_13567 ?auto_13583 ) ) ( not ( = ?auto_13567 ?auto_13584 ) ) ( not ( = ?auto_13567 ?auto_13572 ) ) ( not ( = ?auto_13567 ?auto_13571 ) ) ( not ( = ?auto_13567 ?auto_13575 ) ) ( not ( = ?auto_13567 ?auto_13577 ) ) ( not ( = ?auto_13565 ?auto_13588 ) ) ( not ( = ?auto_13565 ?auto_13587 ) ) ( not ( = ?auto_13565 ?auto_13574 ) ) ( not ( = ?auto_13565 ?auto_13580 ) ) ( not ( = ?auto_13565 ?auto_13582 ) ) ( not ( = ?auto_13565 ?auto_13585 ) ) ( not ( = ?auto_13566 ?auto_13586 ) ) ( not ( = ?auto_13566 ?auto_13581 ) ) ( not ( = ?auto_13566 ?auto_13578 ) ) ( not ( = ?auto_13566 ?auto_13579 ) ) ( not ( = ?auto_13566 ?auto_13573 ) ) ( not ( = ?auto_13566 ?auto_13576 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13557 ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 )
      ( MAKE-1CRATE ?auto_13563 ?auto_13564 )
      ( MAKE-7CRATE-VERIFY ?auto_13557 ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 ?auto_13564 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13608 - SURFACE
      ?auto_13609 - SURFACE
      ?auto_13610 - SURFACE
      ?auto_13611 - SURFACE
      ?auto_13612 - SURFACE
      ?auto_13613 - SURFACE
      ?auto_13614 - SURFACE
      ?auto_13615 - SURFACE
      ?auto_13616 - SURFACE
    )
    :vars
    (
      ?auto_13619 - HOIST
      ?auto_13620 - PLACE
      ?auto_13621 - PLACE
      ?auto_13618 - HOIST
      ?auto_13617 - SURFACE
      ?auto_13626 - PLACE
      ?auto_13638 - HOIST
      ?auto_13627 - SURFACE
      ?auto_13635 - PLACE
      ?auto_13625 - HOIST
      ?auto_13630 - SURFACE
      ?auto_13636 - PLACE
      ?auto_13628 - HOIST
      ?auto_13632 - SURFACE
      ?auto_13643 - PLACE
      ?auto_13642 - HOIST
      ?auto_13637 - SURFACE
      ?auto_13629 - PLACE
      ?auto_13633 - HOIST
      ?auto_13631 - SURFACE
      ?auto_13641 - PLACE
      ?auto_13634 - HOIST
      ?auto_13623 - SURFACE
      ?auto_13639 - PLACE
      ?auto_13624 - HOIST
      ?auto_13640 - SURFACE
      ?auto_13622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13619 ?auto_13620 ) ( IS-CRATE ?auto_13616 ) ( not ( = ?auto_13621 ?auto_13620 ) ) ( HOIST-AT ?auto_13618 ?auto_13621 ) ( AVAILABLE ?auto_13618 ) ( SURFACE-AT ?auto_13616 ?auto_13621 ) ( ON ?auto_13616 ?auto_13617 ) ( CLEAR ?auto_13616 ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13619 ?auto_13618 ) ) ( IS-CRATE ?auto_13615 ) ( not ( = ?auto_13626 ?auto_13620 ) ) ( HOIST-AT ?auto_13638 ?auto_13626 ) ( AVAILABLE ?auto_13638 ) ( SURFACE-AT ?auto_13615 ?auto_13626 ) ( ON ?auto_13615 ?auto_13627 ) ( CLEAR ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13614 ?auto_13627 ) ) ( not ( = ?auto_13615 ?auto_13627 ) ) ( not ( = ?auto_13619 ?auto_13638 ) ) ( IS-CRATE ?auto_13614 ) ( not ( = ?auto_13635 ?auto_13620 ) ) ( HOIST-AT ?auto_13625 ?auto_13635 ) ( AVAILABLE ?auto_13625 ) ( SURFACE-AT ?auto_13614 ?auto_13635 ) ( ON ?auto_13614 ?auto_13630 ) ( CLEAR ?auto_13614 ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13630 ) ) ( not ( = ?auto_13614 ?auto_13630 ) ) ( not ( = ?auto_13619 ?auto_13625 ) ) ( IS-CRATE ?auto_13613 ) ( not ( = ?auto_13636 ?auto_13620 ) ) ( HOIST-AT ?auto_13628 ?auto_13636 ) ( AVAILABLE ?auto_13628 ) ( SURFACE-AT ?auto_13613 ?auto_13636 ) ( ON ?auto_13613 ?auto_13632 ) ( CLEAR ?auto_13613 ) ( not ( = ?auto_13612 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13632 ) ) ( not ( = ?auto_13613 ?auto_13632 ) ) ( not ( = ?auto_13619 ?auto_13628 ) ) ( IS-CRATE ?auto_13612 ) ( not ( = ?auto_13643 ?auto_13620 ) ) ( HOIST-AT ?auto_13642 ?auto_13643 ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13612 ?auto_13643 ) ( ON ?auto_13612 ?auto_13637 ) ( CLEAR ?auto_13612 ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( not ( = ?auto_13611 ?auto_13637 ) ) ( not ( = ?auto_13612 ?auto_13637 ) ) ( not ( = ?auto_13619 ?auto_13642 ) ) ( IS-CRATE ?auto_13611 ) ( not ( = ?auto_13629 ?auto_13620 ) ) ( HOIST-AT ?auto_13633 ?auto_13629 ) ( AVAILABLE ?auto_13633 ) ( SURFACE-AT ?auto_13611 ?auto_13629 ) ( ON ?auto_13611 ?auto_13631 ) ( CLEAR ?auto_13611 ) ( not ( = ?auto_13610 ?auto_13611 ) ) ( not ( = ?auto_13610 ?auto_13631 ) ) ( not ( = ?auto_13611 ?auto_13631 ) ) ( not ( = ?auto_13619 ?auto_13633 ) ) ( IS-CRATE ?auto_13610 ) ( not ( = ?auto_13641 ?auto_13620 ) ) ( HOIST-AT ?auto_13634 ?auto_13641 ) ( AVAILABLE ?auto_13634 ) ( SURFACE-AT ?auto_13610 ?auto_13641 ) ( ON ?auto_13610 ?auto_13623 ) ( CLEAR ?auto_13610 ) ( not ( = ?auto_13609 ?auto_13610 ) ) ( not ( = ?auto_13609 ?auto_13623 ) ) ( not ( = ?auto_13610 ?auto_13623 ) ) ( not ( = ?auto_13619 ?auto_13634 ) ) ( SURFACE-AT ?auto_13608 ?auto_13620 ) ( CLEAR ?auto_13608 ) ( IS-CRATE ?auto_13609 ) ( AVAILABLE ?auto_13619 ) ( not ( = ?auto_13639 ?auto_13620 ) ) ( HOIST-AT ?auto_13624 ?auto_13639 ) ( AVAILABLE ?auto_13624 ) ( SURFACE-AT ?auto_13609 ?auto_13639 ) ( ON ?auto_13609 ?auto_13640 ) ( CLEAR ?auto_13609 ) ( TRUCK-AT ?auto_13622 ?auto_13620 ) ( not ( = ?auto_13608 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13640 ) ) ( not ( = ?auto_13609 ?auto_13640 ) ) ( not ( = ?auto_13619 ?auto_13624 ) ) ( not ( = ?auto_13608 ?auto_13610 ) ) ( not ( = ?auto_13608 ?auto_13623 ) ) ( not ( = ?auto_13610 ?auto_13640 ) ) ( not ( = ?auto_13641 ?auto_13639 ) ) ( not ( = ?auto_13634 ?auto_13624 ) ) ( not ( = ?auto_13623 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13611 ) ) ( not ( = ?auto_13608 ?auto_13631 ) ) ( not ( = ?auto_13609 ?auto_13611 ) ) ( not ( = ?auto_13609 ?auto_13631 ) ) ( not ( = ?auto_13611 ?auto_13623 ) ) ( not ( = ?auto_13611 ?auto_13640 ) ) ( not ( = ?auto_13629 ?auto_13641 ) ) ( not ( = ?auto_13629 ?auto_13639 ) ) ( not ( = ?auto_13633 ?auto_13634 ) ) ( not ( = ?auto_13633 ?auto_13624 ) ) ( not ( = ?auto_13631 ?auto_13623 ) ) ( not ( = ?auto_13631 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13612 ) ) ( not ( = ?auto_13608 ?auto_13637 ) ) ( not ( = ?auto_13609 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13637 ) ) ( not ( = ?auto_13610 ?auto_13612 ) ) ( not ( = ?auto_13610 ?auto_13637 ) ) ( not ( = ?auto_13612 ?auto_13631 ) ) ( not ( = ?auto_13612 ?auto_13623 ) ) ( not ( = ?auto_13612 ?auto_13640 ) ) ( not ( = ?auto_13643 ?auto_13629 ) ) ( not ( = ?auto_13643 ?auto_13641 ) ) ( not ( = ?auto_13643 ?auto_13639 ) ) ( not ( = ?auto_13642 ?auto_13633 ) ) ( not ( = ?auto_13642 ?auto_13634 ) ) ( not ( = ?auto_13642 ?auto_13624 ) ) ( not ( = ?auto_13637 ?auto_13631 ) ) ( not ( = ?auto_13637 ?auto_13623 ) ) ( not ( = ?auto_13637 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13613 ) ) ( not ( = ?auto_13608 ?auto_13632 ) ) ( not ( = ?auto_13609 ?auto_13613 ) ) ( not ( = ?auto_13609 ?auto_13632 ) ) ( not ( = ?auto_13610 ?auto_13613 ) ) ( not ( = ?auto_13610 ?auto_13632 ) ) ( not ( = ?auto_13611 ?auto_13613 ) ) ( not ( = ?auto_13611 ?auto_13632 ) ) ( not ( = ?auto_13613 ?auto_13637 ) ) ( not ( = ?auto_13613 ?auto_13631 ) ) ( not ( = ?auto_13613 ?auto_13623 ) ) ( not ( = ?auto_13613 ?auto_13640 ) ) ( not ( = ?auto_13636 ?auto_13643 ) ) ( not ( = ?auto_13636 ?auto_13629 ) ) ( not ( = ?auto_13636 ?auto_13641 ) ) ( not ( = ?auto_13636 ?auto_13639 ) ) ( not ( = ?auto_13628 ?auto_13642 ) ) ( not ( = ?auto_13628 ?auto_13633 ) ) ( not ( = ?auto_13628 ?auto_13634 ) ) ( not ( = ?auto_13628 ?auto_13624 ) ) ( not ( = ?auto_13632 ?auto_13637 ) ) ( not ( = ?auto_13632 ?auto_13631 ) ) ( not ( = ?auto_13632 ?auto_13623 ) ) ( not ( = ?auto_13632 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13614 ) ) ( not ( = ?auto_13608 ?auto_13630 ) ) ( not ( = ?auto_13609 ?auto_13614 ) ) ( not ( = ?auto_13609 ?auto_13630 ) ) ( not ( = ?auto_13610 ?auto_13614 ) ) ( not ( = ?auto_13610 ?auto_13630 ) ) ( not ( = ?auto_13611 ?auto_13614 ) ) ( not ( = ?auto_13611 ?auto_13630 ) ) ( not ( = ?auto_13612 ?auto_13614 ) ) ( not ( = ?auto_13612 ?auto_13630 ) ) ( not ( = ?auto_13614 ?auto_13632 ) ) ( not ( = ?auto_13614 ?auto_13637 ) ) ( not ( = ?auto_13614 ?auto_13631 ) ) ( not ( = ?auto_13614 ?auto_13623 ) ) ( not ( = ?auto_13614 ?auto_13640 ) ) ( not ( = ?auto_13635 ?auto_13636 ) ) ( not ( = ?auto_13635 ?auto_13643 ) ) ( not ( = ?auto_13635 ?auto_13629 ) ) ( not ( = ?auto_13635 ?auto_13641 ) ) ( not ( = ?auto_13635 ?auto_13639 ) ) ( not ( = ?auto_13625 ?auto_13628 ) ) ( not ( = ?auto_13625 ?auto_13642 ) ) ( not ( = ?auto_13625 ?auto_13633 ) ) ( not ( = ?auto_13625 ?auto_13634 ) ) ( not ( = ?auto_13625 ?auto_13624 ) ) ( not ( = ?auto_13630 ?auto_13632 ) ) ( not ( = ?auto_13630 ?auto_13637 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13623 ) ) ( not ( = ?auto_13630 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13615 ) ) ( not ( = ?auto_13608 ?auto_13627 ) ) ( not ( = ?auto_13609 ?auto_13615 ) ) ( not ( = ?auto_13609 ?auto_13627 ) ) ( not ( = ?auto_13610 ?auto_13615 ) ) ( not ( = ?auto_13610 ?auto_13627 ) ) ( not ( = ?auto_13611 ?auto_13615 ) ) ( not ( = ?auto_13611 ?auto_13627 ) ) ( not ( = ?auto_13612 ?auto_13615 ) ) ( not ( = ?auto_13612 ?auto_13627 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13613 ?auto_13627 ) ) ( not ( = ?auto_13615 ?auto_13630 ) ) ( not ( = ?auto_13615 ?auto_13632 ) ) ( not ( = ?auto_13615 ?auto_13637 ) ) ( not ( = ?auto_13615 ?auto_13631 ) ) ( not ( = ?auto_13615 ?auto_13623 ) ) ( not ( = ?auto_13615 ?auto_13640 ) ) ( not ( = ?auto_13626 ?auto_13635 ) ) ( not ( = ?auto_13626 ?auto_13636 ) ) ( not ( = ?auto_13626 ?auto_13643 ) ) ( not ( = ?auto_13626 ?auto_13629 ) ) ( not ( = ?auto_13626 ?auto_13641 ) ) ( not ( = ?auto_13626 ?auto_13639 ) ) ( not ( = ?auto_13638 ?auto_13625 ) ) ( not ( = ?auto_13638 ?auto_13628 ) ) ( not ( = ?auto_13638 ?auto_13642 ) ) ( not ( = ?auto_13638 ?auto_13633 ) ) ( not ( = ?auto_13638 ?auto_13634 ) ) ( not ( = ?auto_13638 ?auto_13624 ) ) ( not ( = ?auto_13627 ?auto_13630 ) ) ( not ( = ?auto_13627 ?auto_13632 ) ) ( not ( = ?auto_13627 ?auto_13637 ) ) ( not ( = ?auto_13627 ?auto_13631 ) ) ( not ( = ?auto_13627 ?auto_13623 ) ) ( not ( = ?auto_13627 ?auto_13640 ) ) ( not ( = ?auto_13608 ?auto_13616 ) ) ( not ( = ?auto_13608 ?auto_13617 ) ) ( not ( = ?auto_13609 ?auto_13616 ) ) ( not ( = ?auto_13609 ?auto_13617 ) ) ( not ( = ?auto_13610 ?auto_13616 ) ) ( not ( = ?auto_13610 ?auto_13617 ) ) ( not ( = ?auto_13611 ?auto_13616 ) ) ( not ( = ?auto_13611 ?auto_13617 ) ) ( not ( = ?auto_13612 ?auto_13616 ) ) ( not ( = ?auto_13612 ?auto_13617 ) ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13617 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13627 ) ) ( not ( = ?auto_13616 ?auto_13630 ) ) ( not ( = ?auto_13616 ?auto_13632 ) ) ( not ( = ?auto_13616 ?auto_13637 ) ) ( not ( = ?auto_13616 ?auto_13631 ) ) ( not ( = ?auto_13616 ?auto_13623 ) ) ( not ( = ?auto_13616 ?auto_13640 ) ) ( not ( = ?auto_13621 ?auto_13626 ) ) ( not ( = ?auto_13621 ?auto_13635 ) ) ( not ( = ?auto_13621 ?auto_13636 ) ) ( not ( = ?auto_13621 ?auto_13643 ) ) ( not ( = ?auto_13621 ?auto_13629 ) ) ( not ( = ?auto_13621 ?auto_13641 ) ) ( not ( = ?auto_13621 ?auto_13639 ) ) ( not ( = ?auto_13618 ?auto_13638 ) ) ( not ( = ?auto_13618 ?auto_13625 ) ) ( not ( = ?auto_13618 ?auto_13628 ) ) ( not ( = ?auto_13618 ?auto_13642 ) ) ( not ( = ?auto_13618 ?auto_13633 ) ) ( not ( = ?auto_13618 ?auto_13634 ) ) ( not ( = ?auto_13618 ?auto_13624 ) ) ( not ( = ?auto_13617 ?auto_13627 ) ) ( not ( = ?auto_13617 ?auto_13630 ) ) ( not ( = ?auto_13617 ?auto_13632 ) ) ( not ( = ?auto_13617 ?auto_13637 ) ) ( not ( = ?auto_13617 ?auto_13631 ) ) ( not ( = ?auto_13617 ?auto_13623 ) ) ( not ( = ?auto_13617 ?auto_13640 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13608 ?auto_13609 ?auto_13610 ?auto_13611 ?auto_13612 ?auto_13613 ?auto_13614 ?auto_13615 )
      ( MAKE-1CRATE ?auto_13615 ?auto_13616 )
      ( MAKE-8CRATE-VERIFY ?auto_13608 ?auto_13609 ?auto_13610 ?auto_13611 ?auto_13612 ?auto_13613 ?auto_13614 ?auto_13615 ?auto_13616 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13664 - SURFACE
      ?auto_13665 - SURFACE
      ?auto_13666 - SURFACE
      ?auto_13667 - SURFACE
      ?auto_13668 - SURFACE
      ?auto_13669 - SURFACE
      ?auto_13670 - SURFACE
      ?auto_13671 - SURFACE
      ?auto_13672 - SURFACE
      ?auto_13673 - SURFACE
    )
    :vars
    (
      ?auto_13679 - HOIST
      ?auto_13677 - PLACE
      ?auto_13674 - PLACE
      ?auto_13676 - HOIST
      ?auto_13678 - SURFACE
      ?auto_13699 - PLACE
      ?auto_13692 - HOIST
      ?auto_13696 - SURFACE
      ?auto_13703 - PLACE
      ?auto_13701 - HOIST
      ?auto_13694 - SURFACE
      ?auto_13685 - PLACE
      ?auto_13691 - HOIST
      ?auto_13687 - SURFACE
      ?auto_13686 - PLACE
      ?auto_13693 - HOIST
      ?auto_13683 - SURFACE
      ?auto_13689 - PLACE
      ?auto_13680 - HOIST
      ?auto_13697 - SURFACE
      ?auto_13688 - PLACE
      ?auto_13682 - HOIST
      ?auto_13681 - SURFACE
      ?auto_13702 - PLACE
      ?auto_13684 - HOIST
      ?auto_13700 - SURFACE
      ?auto_13698 - PLACE
      ?auto_13690 - HOIST
      ?auto_13695 - SURFACE
      ?auto_13675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13679 ?auto_13677 ) ( IS-CRATE ?auto_13673 ) ( not ( = ?auto_13674 ?auto_13677 ) ) ( HOIST-AT ?auto_13676 ?auto_13674 ) ( AVAILABLE ?auto_13676 ) ( SURFACE-AT ?auto_13673 ?auto_13674 ) ( ON ?auto_13673 ?auto_13678 ) ( CLEAR ?auto_13673 ) ( not ( = ?auto_13672 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13678 ) ) ( not ( = ?auto_13673 ?auto_13678 ) ) ( not ( = ?auto_13679 ?auto_13676 ) ) ( IS-CRATE ?auto_13672 ) ( not ( = ?auto_13699 ?auto_13677 ) ) ( HOIST-AT ?auto_13692 ?auto_13699 ) ( AVAILABLE ?auto_13692 ) ( SURFACE-AT ?auto_13672 ?auto_13699 ) ( ON ?auto_13672 ?auto_13696 ) ( CLEAR ?auto_13672 ) ( not ( = ?auto_13671 ?auto_13672 ) ) ( not ( = ?auto_13671 ?auto_13696 ) ) ( not ( = ?auto_13672 ?auto_13696 ) ) ( not ( = ?auto_13679 ?auto_13692 ) ) ( IS-CRATE ?auto_13671 ) ( not ( = ?auto_13703 ?auto_13677 ) ) ( HOIST-AT ?auto_13701 ?auto_13703 ) ( AVAILABLE ?auto_13701 ) ( SURFACE-AT ?auto_13671 ?auto_13703 ) ( ON ?auto_13671 ?auto_13694 ) ( CLEAR ?auto_13671 ) ( not ( = ?auto_13670 ?auto_13671 ) ) ( not ( = ?auto_13670 ?auto_13694 ) ) ( not ( = ?auto_13671 ?auto_13694 ) ) ( not ( = ?auto_13679 ?auto_13701 ) ) ( IS-CRATE ?auto_13670 ) ( not ( = ?auto_13685 ?auto_13677 ) ) ( HOIST-AT ?auto_13691 ?auto_13685 ) ( AVAILABLE ?auto_13691 ) ( SURFACE-AT ?auto_13670 ?auto_13685 ) ( ON ?auto_13670 ?auto_13687 ) ( CLEAR ?auto_13670 ) ( not ( = ?auto_13669 ?auto_13670 ) ) ( not ( = ?auto_13669 ?auto_13687 ) ) ( not ( = ?auto_13670 ?auto_13687 ) ) ( not ( = ?auto_13679 ?auto_13691 ) ) ( IS-CRATE ?auto_13669 ) ( not ( = ?auto_13686 ?auto_13677 ) ) ( HOIST-AT ?auto_13693 ?auto_13686 ) ( AVAILABLE ?auto_13693 ) ( SURFACE-AT ?auto_13669 ?auto_13686 ) ( ON ?auto_13669 ?auto_13683 ) ( CLEAR ?auto_13669 ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13683 ) ) ( not ( = ?auto_13669 ?auto_13683 ) ) ( not ( = ?auto_13679 ?auto_13693 ) ) ( IS-CRATE ?auto_13668 ) ( not ( = ?auto_13689 ?auto_13677 ) ) ( HOIST-AT ?auto_13680 ?auto_13689 ) ( AVAILABLE ?auto_13680 ) ( SURFACE-AT ?auto_13668 ?auto_13689 ) ( ON ?auto_13668 ?auto_13697 ) ( CLEAR ?auto_13668 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13697 ) ) ( not ( = ?auto_13668 ?auto_13697 ) ) ( not ( = ?auto_13679 ?auto_13680 ) ) ( IS-CRATE ?auto_13667 ) ( not ( = ?auto_13688 ?auto_13677 ) ) ( HOIST-AT ?auto_13682 ?auto_13688 ) ( AVAILABLE ?auto_13682 ) ( SURFACE-AT ?auto_13667 ?auto_13688 ) ( ON ?auto_13667 ?auto_13681 ) ( CLEAR ?auto_13667 ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13681 ) ) ( not ( = ?auto_13667 ?auto_13681 ) ) ( not ( = ?auto_13679 ?auto_13682 ) ) ( IS-CRATE ?auto_13666 ) ( not ( = ?auto_13702 ?auto_13677 ) ) ( HOIST-AT ?auto_13684 ?auto_13702 ) ( AVAILABLE ?auto_13684 ) ( SURFACE-AT ?auto_13666 ?auto_13702 ) ( ON ?auto_13666 ?auto_13700 ) ( CLEAR ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13700 ) ) ( not ( = ?auto_13666 ?auto_13700 ) ) ( not ( = ?auto_13679 ?auto_13684 ) ) ( SURFACE-AT ?auto_13664 ?auto_13677 ) ( CLEAR ?auto_13664 ) ( IS-CRATE ?auto_13665 ) ( AVAILABLE ?auto_13679 ) ( not ( = ?auto_13698 ?auto_13677 ) ) ( HOIST-AT ?auto_13690 ?auto_13698 ) ( AVAILABLE ?auto_13690 ) ( SURFACE-AT ?auto_13665 ?auto_13698 ) ( ON ?auto_13665 ?auto_13695 ) ( CLEAR ?auto_13665 ) ( TRUCK-AT ?auto_13675 ?auto_13677 ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13695 ) ) ( not ( = ?auto_13665 ?auto_13695 ) ) ( not ( = ?auto_13679 ?auto_13690 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13700 ) ) ( not ( = ?auto_13666 ?auto_13695 ) ) ( not ( = ?auto_13702 ?auto_13698 ) ) ( not ( = ?auto_13684 ?auto_13690 ) ) ( not ( = ?auto_13700 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13664 ?auto_13681 ) ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13681 ) ) ( not ( = ?auto_13667 ?auto_13700 ) ) ( not ( = ?auto_13667 ?auto_13695 ) ) ( not ( = ?auto_13688 ?auto_13702 ) ) ( not ( = ?auto_13688 ?auto_13698 ) ) ( not ( = ?auto_13682 ?auto_13684 ) ) ( not ( = ?auto_13682 ?auto_13690 ) ) ( not ( = ?auto_13681 ?auto_13700 ) ) ( not ( = ?auto_13681 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13697 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13697 ) ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13666 ?auto_13697 ) ) ( not ( = ?auto_13668 ?auto_13681 ) ) ( not ( = ?auto_13668 ?auto_13700 ) ) ( not ( = ?auto_13668 ?auto_13695 ) ) ( not ( = ?auto_13689 ?auto_13688 ) ) ( not ( = ?auto_13689 ?auto_13702 ) ) ( not ( = ?auto_13689 ?auto_13698 ) ) ( not ( = ?auto_13680 ?auto_13682 ) ) ( not ( = ?auto_13680 ?auto_13684 ) ) ( not ( = ?auto_13680 ?auto_13690 ) ) ( not ( = ?auto_13697 ?auto_13681 ) ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( not ( = ?auto_13697 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13669 ) ) ( not ( = ?auto_13664 ?auto_13683 ) ) ( not ( = ?auto_13665 ?auto_13669 ) ) ( not ( = ?auto_13665 ?auto_13683 ) ) ( not ( = ?auto_13666 ?auto_13669 ) ) ( not ( = ?auto_13666 ?auto_13683 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( not ( = ?auto_13667 ?auto_13683 ) ) ( not ( = ?auto_13669 ?auto_13697 ) ) ( not ( = ?auto_13669 ?auto_13681 ) ) ( not ( = ?auto_13669 ?auto_13700 ) ) ( not ( = ?auto_13669 ?auto_13695 ) ) ( not ( = ?auto_13686 ?auto_13689 ) ) ( not ( = ?auto_13686 ?auto_13688 ) ) ( not ( = ?auto_13686 ?auto_13702 ) ) ( not ( = ?auto_13686 ?auto_13698 ) ) ( not ( = ?auto_13693 ?auto_13680 ) ) ( not ( = ?auto_13693 ?auto_13682 ) ) ( not ( = ?auto_13693 ?auto_13684 ) ) ( not ( = ?auto_13693 ?auto_13690 ) ) ( not ( = ?auto_13683 ?auto_13697 ) ) ( not ( = ?auto_13683 ?auto_13681 ) ) ( not ( = ?auto_13683 ?auto_13700 ) ) ( not ( = ?auto_13683 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13670 ) ) ( not ( = ?auto_13664 ?auto_13687 ) ) ( not ( = ?auto_13665 ?auto_13670 ) ) ( not ( = ?auto_13665 ?auto_13687 ) ) ( not ( = ?auto_13666 ?auto_13670 ) ) ( not ( = ?auto_13666 ?auto_13687 ) ) ( not ( = ?auto_13667 ?auto_13670 ) ) ( not ( = ?auto_13667 ?auto_13687 ) ) ( not ( = ?auto_13668 ?auto_13670 ) ) ( not ( = ?auto_13668 ?auto_13687 ) ) ( not ( = ?auto_13670 ?auto_13683 ) ) ( not ( = ?auto_13670 ?auto_13697 ) ) ( not ( = ?auto_13670 ?auto_13681 ) ) ( not ( = ?auto_13670 ?auto_13700 ) ) ( not ( = ?auto_13670 ?auto_13695 ) ) ( not ( = ?auto_13685 ?auto_13686 ) ) ( not ( = ?auto_13685 ?auto_13689 ) ) ( not ( = ?auto_13685 ?auto_13688 ) ) ( not ( = ?auto_13685 ?auto_13702 ) ) ( not ( = ?auto_13685 ?auto_13698 ) ) ( not ( = ?auto_13691 ?auto_13693 ) ) ( not ( = ?auto_13691 ?auto_13680 ) ) ( not ( = ?auto_13691 ?auto_13682 ) ) ( not ( = ?auto_13691 ?auto_13684 ) ) ( not ( = ?auto_13691 ?auto_13690 ) ) ( not ( = ?auto_13687 ?auto_13683 ) ) ( not ( = ?auto_13687 ?auto_13697 ) ) ( not ( = ?auto_13687 ?auto_13681 ) ) ( not ( = ?auto_13687 ?auto_13700 ) ) ( not ( = ?auto_13687 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13671 ) ) ( not ( = ?auto_13664 ?auto_13694 ) ) ( not ( = ?auto_13665 ?auto_13671 ) ) ( not ( = ?auto_13665 ?auto_13694 ) ) ( not ( = ?auto_13666 ?auto_13671 ) ) ( not ( = ?auto_13666 ?auto_13694 ) ) ( not ( = ?auto_13667 ?auto_13671 ) ) ( not ( = ?auto_13667 ?auto_13694 ) ) ( not ( = ?auto_13668 ?auto_13671 ) ) ( not ( = ?auto_13668 ?auto_13694 ) ) ( not ( = ?auto_13669 ?auto_13671 ) ) ( not ( = ?auto_13669 ?auto_13694 ) ) ( not ( = ?auto_13671 ?auto_13687 ) ) ( not ( = ?auto_13671 ?auto_13683 ) ) ( not ( = ?auto_13671 ?auto_13697 ) ) ( not ( = ?auto_13671 ?auto_13681 ) ) ( not ( = ?auto_13671 ?auto_13700 ) ) ( not ( = ?auto_13671 ?auto_13695 ) ) ( not ( = ?auto_13703 ?auto_13685 ) ) ( not ( = ?auto_13703 ?auto_13686 ) ) ( not ( = ?auto_13703 ?auto_13689 ) ) ( not ( = ?auto_13703 ?auto_13688 ) ) ( not ( = ?auto_13703 ?auto_13702 ) ) ( not ( = ?auto_13703 ?auto_13698 ) ) ( not ( = ?auto_13701 ?auto_13691 ) ) ( not ( = ?auto_13701 ?auto_13693 ) ) ( not ( = ?auto_13701 ?auto_13680 ) ) ( not ( = ?auto_13701 ?auto_13682 ) ) ( not ( = ?auto_13701 ?auto_13684 ) ) ( not ( = ?auto_13701 ?auto_13690 ) ) ( not ( = ?auto_13694 ?auto_13687 ) ) ( not ( = ?auto_13694 ?auto_13683 ) ) ( not ( = ?auto_13694 ?auto_13697 ) ) ( not ( = ?auto_13694 ?auto_13681 ) ) ( not ( = ?auto_13694 ?auto_13700 ) ) ( not ( = ?auto_13694 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13672 ) ) ( not ( = ?auto_13664 ?auto_13696 ) ) ( not ( = ?auto_13665 ?auto_13672 ) ) ( not ( = ?auto_13665 ?auto_13696 ) ) ( not ( = ?auto_13666 ?auto_13672 ) ) ( not ( = ?auto_13666 ?auto_13696 ) ) ( not ( = ?auto_13667 ?auto_13672 ) ) ( not ( = ?auto_13667 ?auto_13696 ) ) ( not ( = ?auto_13668 ?auto_13672 ) ) ( not ( = ?auto_13668 ?auto_13696 ) ) ( not ( = ?auto_13669 ?auto_13672 ) ) ( not ( = ?auto_13669 ?auto_13696 ) ) ( not ( = ?auto_13670 ?auto_13672 ) ) ( not ( = ?auto_13670 ?auto_13696 ) ) ( not ( = ?auto_13672 ?auto_13694 ) ) ( not ( = ?auto_13672 ?auto_13687 ) ) ( not ( = ?auto_13672 ?auto_13683 ) ) ( not ( = ?auto_13672 ?auto_13697 ) ) ( not ( = ?auto_13672 ?auto_13681 ) ) ( not ( = ?auto_13672 ?auto_13700 ) ) ( not ( = ?auto_13672 ?auto_13695 ) ) ( not ( = ?auto_13699 ?auto_13703 ) ) ( not ( = ?auto_13699 ?auto_13685 ) ) ( not ( = ?auto_13699 ?auto_13686 ) ) ( not ( = ?auto_13699 ?auto_13689 ) ) ( not ( = ?auto_13699 ?auto_13688 ) ) ( not ( = ?auto_13699 ?auto_13702 ) ) ( not ( = ?auto_13699 ?auto_13698 ) ) ( not ( = ?auto_13692 ?auto_13701 ) ) ( not ( = ?auto_13692 ?auto_13691 ) ) ( not ( = ?auto_13692 ?auto_13693 ) ) ( not ( = ?auto_13692 ?auto_13680 ) ) ( not ( = ?auto_13692 ?auto_13682 ) ) ( not ( = ?auto_13692 ?auto_13684 ) ) ( not ( = ?auto_13692 ?auto_13690 ) ) ( not ( = ?auto_13696 ?auto_13694 ) ) ( not ( = ?auto_13696 ?auto_13687 ) ) ( not ( = ?auto_13696 ?auto_13683 ) ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( not ( = ?auto_13696 ?auto_13681 ) ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13696 ?auto_13695 ) ) ( not ( = ?auto_13664 ?auto_13673 ) ) ( not ( = ?auto_13664 ?auto_13678 ) ) ( not ( = ?auto_13665 ?auto_13673 ) ) ( not ( = ?auto_13665 ?auto_13678 ) ) ( not ( = ?auto_13666 ?auto_13673 ) ) ( not ( = ?auto_13666 ?auto_13678 ) ) ( not ( = ?auto_13667 ?auto_13673 ) ) ( not ( = ?auto_13667 ?auto_13678 ) ) ( not ( = ?auto_13668 ?auto_13673 ) ) ( not ( = ?auto_13668 ?auto_13678 ) ) ( not ( = ?auto_13669 ?auto_13673 ) ) ( not ( = ?auto_13669 ?auto_13678 ) ) ( not ( = ?auto_13670 ?auto_13673 ) ) ( not ( = ?auto_13670 ?auto_13678 ) ) ( not ( = ?auto_13671 ?auto_13673 ) ) ( not ( = ?auto_13671 ?auto_13678 ) ) ( not ( = ?auto_13673 ?auto_13696 ) ) ( not ( = ?auto_13673 ?auto_13694 ) ) ( not ( = ?auto_13673 ?auto_13687 ) ) ( not ( = ?auto_13673 ?auto_13683 ) ) ( not ( = ?auto_13673 ?auto_13697 ) ) ( not ( = ?auto_13673 ?auto_13681 ) ) ( not ( = ?auto_13673 ?auto_13700 ) ) ( not ( = ?auto_13673 ?auto_13695 ) ) ( not ( = ?auto_13674 ?auto_13699 ) ) ( not ( = ?auto_13674 ?auto_13703 ) ) ( not ( = ?auto_13674 ?auto_13685 ) ) ( not ( = ?auto_13674 ?auto_13686 ) ) ( not ( = ?auto_13674 ?auto_13689 ) ) ( not ( = ?auto_13674 ?auto_13688 ) ) ( not ( = ?auto_13674 ?auto_13702 ) ) ( not ( = ?auto_13674 ?auto_13698 ) ) ( not ( = ?auto_13676 ?auto_13692 ) ) ( not ( = ?auto_13676 ?auto_13701 ) ) ( not ( = ?auto_13676 ?auto_13691 ) ) ( not ( = ?auto_13676 ?auto_13693 ) ) ( not ( = ?auto_13676 ?auto_13680 ) ) ( not ( = ?auto_13676 ?auto_13682 ) ) ( not ( = ?auto_13676 ?auto_13684 ) ) ( not ( = ?auto_13676 ?auto_13690 ) ) ( not ( = ?auto_13678 ?auto_13696 ) ) ( not ( = ?auto_13678 ?auto_13694 ) ) ( not ( = ?auto_13678 ?auto_13687 ) ) ( not ( = ?auto_13678 ?auto_13683 ) ) ( not ( = ?auto_13678 ?auto_13697 ) ) ( not ( = ?auto_13678 ?auto_13681 ) ) ( not ( = ?auto_13678 ?auto_13700 ) ) ( not ( = ?auto_13678 ?auto_13695 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ?auto_13669 ?auto_13670 ?auto_13671 ?auto_13672 )
      ( MAKE-1CRATE ?auto_13672 ?auto_13673 )
      ( MAKE-9CRATE-VERIFY ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ?auto_13669 ?auto_13670 ?auto_13671 ?auto_13672 ?auto_13673 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13725 - SURFACE
      ?auto_13726 - SURFACE
      ?auto_13727 - SURFACE
      ?auto_13728 - SURFACE
      ?auto_13729 - SURFACE
      ?auto_13730 - SURFACE
      ?auto_13731 - SURFACE
      ?auto_13732 - SURFACE
      ?auto_13733 - SURFACE
      ?auto_13734 - SURFACE
      ?auto_13735 - SURFACE
    )
    :vars
    (
      ?auto_13736 - HOIST
      ?auto_13740 - PLACE
      ?auto_13737 - PLACE
      ?auto_13741 - HOIST
      ?auto_13739 - SURFACE
      ?auto_13746 - PLACE
      ?auto_13743 - HOIST
      ?auto_13742 - SURFACE
      ?auto_13762 - PLACE
      ?auto_13754 - HOIST
      ?auto_13758 - SURFACE
      ?auto_13768 - PLACE
      ?auto_13747 - HOIST
      ?auto_13767 - SURFACE
      ?auto_13761 - PLACE
      ?auto_13749 - HOIST
      ?auto_13756 - SURFACE
      ?auto_13760 - PLACE
      ?auto_13755 - HOIST
      ?auto_13750 - SURFACE
      ?auto_13752 - PLACE
      ?auto_13757 - HOIST
      ?auto_13759 - SURFACE
      ?auto_13748 - PLACE
      ?auto_13766 - HOIST
      ?auto_13753 - SURFACE
      ?auto_13745 - PLACE
      ?auto_13764 - HOIST
      ?auto_13763 - SURFACE
      ?auto_13751 - PLACE
      ?auto_13765 - HOIST
      ?auto_13744 - SURFACE
      ?auto_13738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13736 ?auto_13740 ) ( IS-CRATE ?auto_13735 ) ( not ( = ?auto_13737 ?auto_13740 ) ) ( HOIST-AT ?auto_13741 ?auto_13737 ) ( AVAILABLE ?auto_13741 ) ( SURFACE-AT ?auto_13735 ?auto_13737 ) ( ON ?auto_13735 ?auto_13739 ) ( CLEAR ?auto_13735 ) ( not ( = ?auto_13734 ?auto_13735 ) ) ( not ( = ?auto_13734 ?auto_13739 ) ) ( not ( = ?auto_13735 ?auto_13739 ) ) ( not ( = ?auto_13736 ?auto_13741 ) ) ( IS-CRATE ?auto_13734 ) ( not ( = ?auto_13746 ?auto_13740 ) ) ( HOIST-AT ?auto_13743 ?auto_13746 ) ( AVAILABLE ?auto_13743 ) ( SURFACE-AT ?auto_13734 ?auto_13746 ) ( ON ?auto_13734 ?auto_13742 ) ( CLEAR ?auto_13734 ) ( not ( = ?auto_13733 ?auto_13734 ) ) ( not ( = ?auto_13733 ?auto_13742 ) ) ( not ( = ?auto_13734 ?auto_13742 ) ) ( not ( = ?auto_13736 ?auto_13743 ) ) ( IS-CRATE ?auto_13733 ) ( not ( = ?auto_13762 ?auto_13740 ) ) ( HOIST-AT ?auto_13754 ?auto_13762 ) ( AVAILABLE ?auto_13754 ) ( SURFACE-AT ?auto_13733 ?auto_13762 ) ( ON ?auto_13733 ?auto_13758 ) ( CLEAR ?auto_13733 ) ( not ( = ?auto_13732 ?auto_13733 ) ) ( not ( = ?auto_13732 ?auto_13758 ) ) ( not ( = ?auto_13733 ?auto_13758 ) ) ( not ( = ?auto_13736 ?auto_13754 ) ) ( IS-CRATE ?auto_13732 ) ( not ( = ?auto_13768 ?auto_13740 ) ) ( HOIST-AT ?auto_13747 ?auto_13768 ) ( AVAILABLE ?auto_13747 ) ( SURFACE-AT ?auto_13732 ?auto_13768 ) ( ON ?auto_13732 ?auto_13767 ) ( CLEAR ?auto_13732 ) ( not ( = ?auto_13731 ?auto_13732 ) ) ( not ( = ?auto_13731 ?auto_13767 ) ) ( not ( = ?auto_13732 ?auto_13767 ) ) ( not ( = ?auto_13736 ?auto_13747 ) ) ( IS-CRATE ?auto_13731 ) ( not ( = ?auto_13761 ?auto_13740 ) ) ( HOIST-AT ?auto_13749 ?auto_13761 ) ( AVAILABLE ?auto_13749 ) ( SURFACE-AT ?auto_13731 ?auto_13761 ) ( ON ?auto_13731 ?auto_13756 ) ( CLEAR ?auto_13731 ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13756 ) ) ( not ( = ?auto_13731 ?auto_13756 ) ) ( not ( = ?auto_13736 ?auto_13749 ) ) ( IS-CRATE ?auto_13730 ) ( not ( = ?auto_13760 ?auto_13740 ) ) ( HOIST-AT ?auto_13755 ?auto_13760 ) ( AVAILABLE ?auto_13755 ) ( SURFACE-AT ?auto_13730 ?auto_13760 ) ( ON ?auto_13730 ?auto_13750 ) ( CLEAR ?auto_13730 ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13750 ) ) ( not ( = ?auto_13730 ?auto_13750 ) ) ( not ( = ?auto_13736 ?auto_13755 ) ) ( IS-CRATE ?auto_13729 ) ( not ( = ?auto_13752 ?auto_13740 ) ) ( HOIST-AT ?auto_13757 ?auto_13752 ) ( AVAILABLE ?auto_13757 ) ( SURFACE-AT ?auto_13729 ?auto_13752 ) ( ON ?auto_13729 ?auto_13759 ) ( CLEAR ?auto_13729 ) ( not ( = ?auto_13728 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13759 ) ) ( not ( = ?auto_13729 ?auto_13759 ) ) ( not ( = ?auto_13736 ?auto_13757 ) ) ( IS-CRATE ?auto_13728 ) ( not ( = ?auto_13748 ?auto_13740 ) ) ( HOIST-AT ?auto_13766 ?auto_13748 ) ( AVAILABLE ?auto_13766 ) ( SURFACE-AT ?auto_13728 ?auto_13748 ) ( ON ?auto_13728 ?auto_13753 ) ( CLEAR ?auto_13728 ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13753 ) ) ( not ( = ?auto_13728 ?auto_13753 ) ) ( not ( = ?auto_13736 ?auto_13766 ) ) ( IS-CRATE ?auto_13727 ) ( not ( = ?auto_13745 ?auto_13740 ) ) ( HOIST-AT ?auto_13764 ?auto_13745 ) ( AVAILABLE ?auto_13764 ) ( SURFACE-AT ?auto_13727 ?auto_13745 ) ( ON ?auto_13727 ?auto_13763 ) ( CLEAR ?auto_13727 ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13763 ) ) ( not ( = ?auto_13727 ?auto_13763 ) ) ( not ( = ?auto_13736 ?auto_13764 ) ) ( SURFACE-AT ?auto_13725 ?auto_13740 ) ( CLEAR ?auto_13725 ) ( IS-CRATE ?auto_13726 ) ( AVAILABLE ?auto_13736 ) ( not ( = ?auto_13751 ?auto_13740 ) ) ( HOIST-AT ?auto_13765 ?auto_13751 ) ( AVAILABLE ?auto_13765 ) ( SURFACE-AT ?auto_13726 ?auto_13751 ) ( ON ?auto_13726 ?auto_13744 ) ( CLEAR ?auto_13726 ) ( TRUCK-AT ?auto_13738 ?auto_13740 ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13744 ) ) ( not ( = ?auto_13726 ?auto_13744 ) ) ( not ( = ?auto_13736 ?auto_13765 ) ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13725 ?auto_13763 ) ) ( not ( = ?auto_13727 ?auto_13744 ) ) ( not ( = ?auto_13745 ?auto_13751 ) ) ( not ( = ?auto_13764 ?auto_13765 ) ) ( not ( = ?auto_13763 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13728 ) ) ( not ( = ?auto_13725 ?auto_13753 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13753 ) ) ( not ( = ?auto_13728 ?auto_13763 ) ) ( not ( = ?auto_13728 ?auto_13744 ) ) ( not ( = ?auto_13748 ?auto_13745 ) ) ( not ( = ?auto_13748 ?auto_13751 ) ) ( not ( = ?auto_13766 ?auto_13764 ) ) ( not ( = ?auto_13766 ?auto_13765 ) ) ( not ( = ?auto_13753 ?auto_13763 ) ) ( not ( = ?auto_13753 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13729 ) ) ( not ( = ?auto_13725 ?auto_13759 ) ) ( not ( = ?auto_13726 ?auto_13729 ) ) ( not ( = ?auto_13726 ?auto_13759 ) ) ( not ( = ?auto_13727 ?auto_13729 ) ) ( not ( = ?auto_13727 ?auto_13759 ) ) ( not ( = ?auto_13729 ?auto_13753 ) ) ( not ( = ?auto_13729 ?auto_13763 ) ) ( not ( = ?auto_13729 ?auto_13744 ) ) ( not ( = ?auto_13752 ?auto_13748 ) ) ( not ( = ?auto_13752 ?auto_13745 ) ) ( not ( = ?auto_13752 ?auto_13751 ) ) ( not ( = ?auto_13757 ?auto_13766 ) ) ( not ( = ?auto_13757 ?auto_13764 ) ) ( not ( = ?auto_13757 ?auto_13765 ) ) ( not ( = ?auto_13759 ?auto_13753 ) ) ( not ( = ?auto_13759 ?auto_13763 ) ) ( not ( = ?auto_13759 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13730 ) ) ( not ( = ?auto_13725 ?auto_13750 ) ) ( not ( = ?auto_13726 ?auto_13730 ) ) ( not ( = ?auto_13726 ?auto_13750 ) ) ( not ( = ?auto_13727 ?auto_13730 ) ) ( not ( = ?auto_13727 ?auto_13750 ) ) ( not ( = ?auto_13728 ?auto_13730 ) ) ( not ( = ?auto_13728 ?auto_13750 ) ) ( not ( = ?auto_13730 ?auto_13759 ) ) ( not ( = ?auto_13730 ?auto_13753 ) ) ( not ( = ?auto_13730 ?auto_13763 ) ) ( not ( = ?auto_13730 ?auto_13744 ) ) ( not ( = ?auto_13760 ?auto_13752 ) ) ( not ( = ?auto_13760 ?auto_13748 ) ) ( not ( = ?auto_13760 ?auto_13745 ) ) ( not ( = ?auto_13760 ?auto_13751 ) ) ( not ( = ?auto_13755 ?auto_13757 ) ) ( not ( = ?auto_13755 ?auto_13766 ) ) ( not ( = ?auto_13755 ?auto_13764 ) ) ( not ( = ?auto_13755 ?auto_13765 ) ) ( not ( = ?auto_13750 ?auto_13759 ) ) ( not ( = ?auto_13750 ?auto_13753 ) ) ( not ( = ?auto_13750 ?auto_13763 ) ) ( not ( = ?auto_13750 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13731 ) ) ( not ( = ?auto_13725 ?auto_13756 ) ) ( not ( = ?auto_13726 ?auto_13731 ) ) ( not ( = ?auto_13726 ?auto_13756 ) ) ( not ( = ?auto_13727 ?auto_13731 ) ) ( not ( = ?auto_13727 ?auto_13756 ) ) ( not ( = ?auto_13728 ?auto_13731 ) ) ( not ( = ?auto_13728 ?auto_13756 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13756 ) ) ( not ( = ?auto_13731 ?auto_13750 ) ) ( not ( = ?auto_13731 ?auto_13759 ) ) ( not ( = ?auto_13731 ?auto_13753 ) ) ( not ( = ?auto_13731 ?auto_13763 ) ) ( not ( = ?auto_13731 ?auto_13744 ) ) ( not ( = ?auto_13761 ?auto_13760 ) ) ( not ( = ?auto_13761 ?auto_13752 ) ) ( not ( = ?auto_13761 ?auto_13748 ) ) ( not ( = ?auto_13761 ?auto_13745 ) ) ( not ( = ?auto_13761 ?auto_13751 ) ) ( not ( = ?auto_13749 ?auto_13755 ) ) ( not ( = ?auto_13749 ?auto_13757 ) ) ( not ( = ?auto_13749 ?auto_13766 ) ) ( not ( = ?auto_13749 ?auto_13764 ) ) ( not ( = ?auto_13749 ?auto_13765 ) ) ( not ( = ?auto_13756 ?auto_13750 ) ) ( not ( = ?auto_13756 ?auto_13759 ) ) ( not ( = ?auto_13756 ?auto_13753 ) ) ( not ( = ?auto_13756 ?auto_13763 ) ) ( not ( = ?auto_13756 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13732 ) ) ( not ( = ?auto_13725 ?auto_13767 ) ) ( not ( = ?auto_13726 ?auto_13732 ) ) ( not ( = ?auto_13726 ?auto_13767 ) ) ( not ( = ?auto_13727 ?auto_13732 ) ) ( not ( = ?auto_13727 ?auto_13767 ) ) ( not ( = ?auto_13728 ?auto_13732 ) ) ( not ( = ?auto_13728 ?auto_13767 ) ) ( not ( = ?auto_13729 ?auto_13732 ) ) ( not ( = ?auto_13729 ?auto_13767 ) ) ( not ( = ?auto_13730 ?auto_13732 ) ) ( not ( = ?auto_13730 ?auto_13767 ) ) ( not ( = ?auto_13732 ?auto_13756 ) ) ( not ( = ?auto_13732 ?auto_13750 ) ) ( not ( = ?auto_13732 ?auto_13759 ) ) ( not ( = ?auto_13732 ?auto_13753 ) ) ( not ( = ?auto_13732 ?auto_13763 ) ) ( not ( = ?auto_13732 ?auto_13744 ) ) ( not ( = ?auto_13768 ?auto_13761 ) ) ( not ( = ?auto_13768 ?auto_13760 ) ) ( not ( = ?auto_13768 ?auto_13752 ) ) ( not ( = ?auto_13768 ?auto_13748 ) ) ( not ( = ?auto_13768 ?auto_13745 ) ) ( not ( = ?auto_13768 ?auto_13751 ) ) ( not ( = ?auto_13747 ?auto_13749 ) ) ( not ( = ?auto_13747 ?auto_13755 ) ) ( not ( = ?auto_13747 ?auto_13757 ) ) ( not ( = ?auto_13747 ?auto_13766 ) ) ( not ( = ?auto_13747 ?auto_13764 ) ) ( not ( = ?auto_13747 ?auto_13765 ) ) ( not ( = ?auto_13767 ?auto_13756 ) ) ( not ( = ?auto_13767 ?auto_13750 ) ) ( not ( = ?auto_13767 ?auto_13759 ) ) ( not ( = ?auto_13767 ?auto_13753 ) ) ( not ( = ?auto_13767 ?auto_13763 ) ) ( not ( = ?auto_13767 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13733 ) ) ( not ( = ?auto_13725 ?auto_13758 ) ) ( not ( = ?auto_13726 ?auto_13733 ) ) ( not ( = ?auto_13726 ?auto_13758 ) ) ( not ( = ?auto_13727 ?auto_13733 ) ) ( not ( = ?auto_13727 ?auto_13758 ) ) ( not ( = ?auto_13728 ?auto_13733 ) ) ( not ( = ?auto_13728 ?auto_13758 ) ) ( not ( = ?auto_13729 ?auto_13733 ) ) ( not ( = ?auto_13729 ?auto_13758 ) ) ( not ( = ?auto_13730 ?auto_13733 ) ) ( not ( = ?auto_13730 ?auto_13758 ) ) ( not ( = ?auto_13731 ?auto_13733 ) ) ( not ( = ?auto_13731 ?auto_13758 ) ) ( not ( = ?auto_13733 ?auto_13767 ) ) ( not ( = ?auto_13733 ?auto_13756 ) ) ( not ( = ?auto_13733 ?auto_13750 ) ) ( not ( = ?auto_13733 ?auto_13759 ) ) ( not ( = ?auto_13733 ?auto_13753 ) ) ( not ( = ?auto_13733 ?auto_13763 ) ) ( not ( = ?auto_13733 ?auto_13744 ) ) ( not ( = ?auto_13762 ?auto_13768 ) ) ( not ( = ?auto_13762 ?auto_13761 ) ) ( not ( = ?auto_13762 ?auto_13760 ) ) ( not ( = ?auto_13762 ?auto_13752 ) ) ( not ( = ?auto_13762 ?auto_13748 ) ) ( not ( = ?auto_13762 ?auto_13745 ) ) ( not ( = ?auto_13762 ?auto_13751 ) ) ( not ( = ?auto_13754 ?auto_13747 ) ) ( not ( = ?auto_13754 ?auto_13749 ) ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13754 ?auto_13757 ) ) ( not ( = ?auto_13754 ?auto_13766 ) ) ( not ( = ?auto_13754 ?auto_13764 ) ) ( not ( = ?auto_13754 ?auto_13765 ) ) ( not ( = ?auto_13758 ?auto_13767 ) ) ( not ( = ?auto_13758 ?auto_13756 ) ) ( not ( = ?auto_13758 ?auto_13750 ) ) ( not ( = ?auto_13758 ?auto_13759 ) ) ( not ( = ?auto_13758 ?auto_13753 ) ) ( not ( = ?auto_13758 ?auto_13763 ) ) ( not ( = ?auto_13758 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13734 ) ) ( not ( = ?auto_13725 ?auto_13742 ) ) ( not ( = ?auto_13726 ?auto_13734 ) ) ( not ( = ?auto_13726 ?auto_13742 ) ) ( not ( = ?auto_13727 ?auto_13734 ) ) ( not ( = ?auto_13727 ?auto_13742 ) ) ( not ( = ?auto_13728 ?auto_13734 ) ) ( not ( = ?auto_13728 ?auto_13742 ) ) ( not ( = ?auto_13729 ?auto_13734 ) ) ( not ( = ?auto_13729 ?auto_13742 ) ) ( not ( = ?auto_13730 ?auto_13734 ) ) ( not ( = ?auto_13730 ?auto_13742 ) ) ( not ( = ?auto_13731 ?auto_13734 ) ) ( not ( = ?auto_13731 ?auto_13742 ) ) ( not ( = ?auto_13732 ?auto_13734 ) ) ( not ( = ?auto_13732 ?auto_13742 ) ) ( not ( = ?auto_13734 ?auto_13758 ) ) ( not ( = ?auto_13734 ?auto_13767 ) ) ( not ( = ?auto_13734 ?auto_13756 ) ) ( not ( = ?auto_13734 ?auto_13750 ) ) ( not ( = ?auto_13734 ?auto_13759 ) ) ( not ( = ?auto_13734 ?auto_13753 ) ) ( not ( = ?auto_13734 ?auto_13763 ) ) ( not ( = ?auto_13734 ?auto_13744 ) ) ( not ( = ?auto_13746 ?auto_13762 ) ) ( not ( = ?auto_13746 ?auto_13768 ) ) ( not ( = ?auto_13746 ?auto_13761 ) ) ( not ( = ?auto_13746 ?auto_13760 ) ) ( not ( = ?auto_13746 ?auto_13752 ) ) ( not ( = ?auto_13746 ?auto_13748 ) ) ( not ( = ?auto_13746 ?auto_13745 ) ) ( not ( = ?auto_13746 ?auto_13751 ) ) ( not ( = ?auto_13743 ?auto_13754 ) ) ( not ( = ?auto_13743 ?auto_13747 ) ) ( not ( = ?auto_13743 ?auto_13749 ) ) ( not ( = ?auto_13743 ?auto_13755 ) ) ( not ( = ?auto_13743 ?auto_13757 ) ) ( not ( = ?auto_13743 ?auto_13766 ) ) ( not ( = ?auto_13743 ?auto_13764 ) ) ( not ( = ?auto_13743 ?auto_13765 ) ) ( not ( = ?auto_13742 ?auto_13758 ) ) ( not ( = ?auto_13742 ?auto_13767 ) ) ( not ( = ?auto_13742 ?auto_13756 ) ) ( not ( = ?auto_13742 ?auto_13750 ) ) ( not ( = ?auto_13742 ?auto_13759 ) ) ( not ( = ?auto_13742 ?auto_13753 ) ) ( not ( = ?auto_13742 ?auto_13763 ) ) ( not ( = ?auto_13742 ?auto_13744 ) ) ( not ( = ?auto_13725 ?auto_13735 ) ) ( not ( = ?auto_13725 ?auto_13739 ) ) ( not ( = ?auto_13726 ?auto_13735 ) ) ( not ( = ?auto_13726 ?auto_13739 ) ) ( not ( = ?auto_13727 ?auto_13735 ) ) ( not ( = ?auto_13727 ?auto_13739 ) ) ( not ( = ?auto_13728 ?auto_13735 ) ) ( not ( = ?auto_13728 ?auto_13739 ) ) ( not ( = ?auto_13729 ?auto_13735 ) ) ( not ( = ?auto_13729 ?auto_13739 ) ) ( not ( = ?auto_13730 ?auto_13735 ) ) ( not ( = ?auto_13730 ?auto_13739 ) ) ( not ( = ?auto_13731 ?auto_13735 ) ) ( not ( = ?auto_13731 ?auto_13739 ) ) ( not ( = ?auto_13732 ?auto_13735 ) ) ( not ( = ?auto_13732 ?auto_13739 ) ) ( not ( = ?auto_13733 ?auto_13735 ) ) ( not ( = ?auto_13733 ?auto_13739 ) ) ( not ( = ?auto_13735 ?auto_13742 ) ) ( not ( = ?auto_13735 ?auto_13758 ) ) ( not ( = ?auto_13735 ?auto_13767 ) ) ( not ( = ?auto_13735 ?auto_13756 ) ) ( not ( = ?auto_13735 ?auto_13750 ) ) ( not ( = ?auto_13735 ?auto_13759 ) ) ( not ( = ?auto_13735 ?auto_13753 ) ) ( not ( = ?auto_13735 ?auto_13763 ) ) ( not ( = ?auto_13735 ?auto_13744 ) ) ( not ( = ?auto_13737 ?auto_13746 ) ) ( not ( = ?auto_13737 ?auto_13762 ) ) ( not ( = ?auto_13737 ?auto_13768 ) ) ( not ( = ?auto_13737 ?auto_13761 ) ) ( not ( = ?auto_13737 ?auto_13760 ) ) ( not ( = ?auto_13737 ?auto_13752 ) ) ( not ( = ?auto_13737 ?auto_13748 ) ) ( not ( = ?auto_13737 ?auto_13745 ) ) ( not ( = ?auto_13737 ?auto_13751 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13754 ) ) ( not ( = ?auto_13741 ?auto_13747 ) ) ( not ( = ?auto_13741 ?auto_13749 ) ) ( not ( = ?auto_13741 ?auto_13755 ) ) ( not ( = ?auto_13741 ?auto_13757 ) ) ( not ( = ?auto_13741 ?auto_13766 ) ) ( not ( = ?auto_13741 ?auto_13764 ) ) ( not ( = ?auto_13741 ?auto_13765 ) ) ( not ( = ?auto_13739 ?auto_13742 ) ) ( not ( = ?auto_13739 ?auto_13758 ) ) ( not ( = ?auto_13739 ?auto_13767 ) ) ( not ( = ?auto_13739 ?auto_13756 ) ) ( not ( = ?auto_13739 ?auto_13750 ) ) ( not ( = ?auto_13739 ?auto_13759 ) ) ( not ( = ?auto_13739 ?auto_13753 ) ) ( not ( = ?auto_13739 ?auto_13763 ) ) ( not ( = ?auto_13739 ?auto_13744 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13729 ?auto_13730 ?auto_13731 ?auto_13732 ?auto_13733 ?auto_13734 )
      ( MAKE-1CRATE ?auto_13734 ?auto_13735 )
      ( MAKE-10CRATE-VERIFY ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13729 ?auto_13730 ?auto_13731 ?auto_13732 ?auto_13733 ?auto_13734 ?auto_13735 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13791 - SURFACE
      ?auto_13792 - SURFACE
      ?auto_13793 - SURFACE
      ?auto_13794 - SURFACE
      ?auto_13795 - SURFACE
      ?auto_13796 - SURFACE
      ?auto_13797 - SURFACE
      ?auto_13798 - SURFACE
      ?auto_13799 - SURFACE
      ?auto_13800 - SURFACE
      ?auto_13801 - SURFACE
      ?auto_13802 - SURFACE
    )
    :vars
    (
      ?auto_13806 - HOIST
      ?auto_13803 - PLACE
      ?auto_13805 - PLACE
      ?auto_13804 - HOIST
      ?auto_13807 - SURFACE
      ?auto_13831 - PLACE
      ?auto_13816 - HOIST
      ?auto_13815 - SURFACE
      ?auto_13817 - PLACE
      ?auto_13812 - HOIST
      ?auto_13819 - SURFACE
      ?auto_13836 - PLACE
      ?auto_13829 - HOIST
      ?auto_13821 - SURFACE
      ?auto_13826 - PLACE
      ?auto_13828 - HOIST
      ?auto_13832 - SURFACE
      ?auto_13834 - PLACE
      ?auto_13835 - HOIST
      ?auto_13813 - SURFACE
      ?auto_13824 - PLACE
      ?auto_13810 - HOIST
      ?auto_13838 - SURFACE
      ?auto_13809 - PLACE
      ?auto_13830 - HOIST
      ?auto_13825 - SURFACE
      ?auto_13811 - PLACE
      ?auto_13827 - HOIST
      ?auto_13820 - SURFACE
      ?auto_13818 - PLACE
      ?auto_13833 - HOIST
      ?auto_13837 - SURFACE
      ?auto_13814 - PLACE
      ?auto_13822 - HOIST
      ?auto_13823 - SURFACE
      ?auto_13808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13806 ?auto_13803 ) ( IS-CRATE ?auto_13802 ) ( not ( = ?auto_13805 ?auto_13803 ) ) ( HOIST-AT ?auto_13804 ?auto_13805 ) ( AVAILABLE ?auto_13804 ) ( SURFACE-AT ?auto_13802 ?auto_13805 ) ( ON ?auto_13802 ?auto_13807 ) ( CLEAR ?auto_13802 ) ( not ( = ?auto_13801 ?auto_13802 ) ) ( not ( = ?auto_13801 ?auto_13807 ) ) ( not ( = ?auto_13802 ?auto_13807 ) ) ( not ( = ?auto_13806 ?auto_13804 ) ) ( IS-CRATE ?auto_13801 ) ( not ( = ?auto_13831 ?auto_13803 ) ) ( HOIST-AT ?auto_13816 ?auto_13831 ) ( AVAILABLE ?auto_13816 ) ( SURFACE-AT ?auto_13801 ?auto_13831 ) ( ON ?auto_13801 ?auto_13815 ) ( CLEAR ?auto_13801 ) ( not ( = ?auto_13800 ?auto_13801 ) ) ( not ( = ?auto_13800 ?auto_13815 ) ) ( not ( = ?auto_13801 ?auto_13815 ) ) ( not ( = ?auto_13806 ?auto_13816 ) ) ( IS-CRATE ?auto_13800 ) ( not ( = ?auto_13817 ?auto_13803 ) ) ( HOIST-AT ?auto_13812 ?auto_13817 ) ( AVAILABLE ?auto_13812 ) ( SURFACE-AT ?auto_13800 ?auto_13817 ) ( ON ?auto_13800 ?auto_13819 ) ( CLEAR ?auto_13800 ) ( not ( = ?auto_13799 ?auto_13800 ) ) ( not ( = ?auto_13799 ?auto_13819 ) ) ( not ( = ?auto_13800 ?auto_13819 ) ) ( not ( = ?auto_13806 ?auto_13812 ) ) ( IS-CRATE ?auto_13799 ) ( not ( = ?auto_13836 ?auto_13803 ) ) ( HOIST-AT ?auto_13829 ?auto_13836 ) ( AVAILABLE ?auto_13829 ) ( SURFACE-AT ?auto_13799 ?auto_13836 ) ( ON ?auto_13799 ?auto_13821 ) ( CLEAR ?auto_13799 ) ( not ( = ?auto_13798 ?auto_13799 ) ) ( not ( = ?auto_13798 ?auto_13821 ) ) ( not ( = ?auto_13799 ?auto_13821 ) ) ( not ( = ?auto_13806 ?auto_13829 ) ) ( IS-CRATE ?auto_13798 ) ( not ( = ?auto_13826 ?auto_13803 ) ) ( HOIST-AT ?auto_13828 ?auto_13826 ) ( AVAILABLE ?auto_13828 ) ( SURFACE-AT ?auto_13798 ?auto_13826 ) ( ON ?auto_13798 ?auto_13832 ) ( CLEAR ?auto_13798 ) ( not ( = ?auto_13797 ?auto_13798 ) ) ( not ( = ?auto_13797 ?auto_13832 ) ) ( not ( = ?auto_13798 ?auto_13832 ) ) ( not ( = ?auto_13806 ?auto_13828 ) ) ( IS-CRATE ?auto_13797 ) ( not ( = ?auto_13834 ?auto_13803 ) ) ( HOIST-AT ?auto_13835 ?auto_13834 ) ( AVAILABLE ?auto_13835 ) ( SURFACE-AT ?auto_13797 ?auto_13834 ) ( ON ?auto_13797 ?auto_13813 ) ( CLEAR ?auto_13797 ) ( not ( = ?auto_13796 ?auto_13797 ) ) ( not ( = ?auto_13796 ?auto_13813 ) ) ( not ( = ?auto_13797 ?auto_13813 ) ) ( not ( = ?auto_13806 ?auto_13835 ) ) ( IS-CRATE ?auto_13796 ) ( not ( = ?auto_13824 ?auto_13803 ) ) ( HOIST-AT ?auto_13810 ?auto_13824 ) ( AVAILABLE ?auto_13810 ) ( SURFACE-AT ?auto_13796 ?auto_13824 ) ( ON ?auto_13796 ?auto_13838 ) ( CLEAR ?auto_13796 ) ( not ( = ?auto_13795 ?auto_13796 ) ) ( not ( = ?auto_13795 ?auto_13838 ) ) ( not ( = ?auto_13796 ?auto_13838 ) ) ( not ( = ?auto_13806 ?auto_13810 ) ) ( IS-CRATE ?auto_13795 ) ( not ( = ?auto_13809 ?auto_13803 ) ) ( HOIST-AT ?auto_13830 ?auto_13809 ) ( AVAILABLE ?auto_13830 ) ( SURFACE-AT ?auto_13795 ?auto_13809 ) ( ON ?auto_13795 ?auto_13825 ) ( CLEAR ?auto_13795 ) ( not ( = ?auto_13794 ?auto_13795 ) ) ( not ( = ?auto_13794 ?auto_13825 ) ) ( not ( = ?auto_13795 ?auto_13825 ) ) ( not ( = ?auto_13806 ?auto_13830 ) ) ( IS-CRATE ?auto_13794 ) ( not ( = ?auto_13811 ?auto_13803 ) ) ( HOIST-AT ?auto_13827 ?auto_13811 ) ( AVAILABLE ?auto_13827 ) ( SURFACE-AT ?auto_13794 ?auto_13811 ) ( ON ?auto_13794 ?auto_13820 ) ( CLEAR ?auto_13794 ) ( not ( = ?auto_13793 ?auto_13794 ) ) ( not ( = ?auto_13793 ?auto_13820 ) ) ( not ( = ?auto_13794 ?auto_13820 ) ) ( not ( = ?auto_13806 ?auto_13827 ) ) ( IS-CRATE ?auto_13793 ) ( not ( = ?auto_13818 ?auto_13803 ) ) ( HOIST-AT ?auto_13833 ?auto_13818 ) ( AVAILABLE ?auto_13833 ) ( SURFACE-AT ?auto_13793 ?auto_13818 ) ( ON ?auto_13793 ?auto_13837 ) ( CLEAR ?auto_13793 ) ( not ( = ?auto_13792 ?auto_13793 ) ) ( not ( = ?auto_13792 ?auto_13837 ) ) ( not ( = ?auto_13793 ?auto_13837 ) ) ( not ( = ?auto_13806 ?auto_13833 ) ) ( SURFACE-AT ?auto_13791 ?auto_13803 ) ( CLEAR ?auto_13791 ) ( IS-CRATE ?auto_13792 ) ( AVAILABLE ?auto_13806 ) ( not ( = ?auto_13814 ?auto_13803 ) ) ( HOIST-AT ?auto_13822 ?auto_13814 ) ( AVAILABLE ?auto_13822 ) ( SURFACE-AT ?auto_13792 ?auto_13814 ) ( ON ?auto_13792 ?auto_13823 ) ( CLEAR ?auto_13792 ) ( TRUCK-AT ?auto_13808 ?auto_13803 ) ( not ( = ?auto_13791 ?auto_13792 ) ) ( not ( = ?auto_13791 ?auto_13823 ) ) ( not ( = ?auto_13792 ?auto_13823 ) ) ( not ( = ?auto_13806 ?auto_13822 ) ) ( not ( = ?auto_13791 ?auto_13793 ) ) ( not ( = ?auto_13791 ?auto_13837 ) ) ( not ( = ?auto_13793 ?auto_13823 ) ) ( not ( = ?auto_13818 ?auto_13814 ) ) ( not ( = ?auto_13833 ?auto_13822 ) ) ( not ( = ?auto_13837 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13794 ) ) ( not ( = ?auto_13791 ?auto_13820 ) ) ( not ( = ?auto_13792 ?auto_13794 ) ) ( not ( = ?auto_13792 ?auto_13820 ) ) ( not ( = ?auto_13794 ?auto_13837 ) ) ( not ( = ?auto_13794 ?auto_13823 ) ) ( not ( = ?auto_13811 ?auto_13818 ) ) ( not ( = ?auto_13811 ?auto_13814 ) ) ( not ( = ?auto_13827 ?auto_13833 ) ) ( not ( = ?auto_13827 ?auto_13822 ) ) ( not ( = ?auto_13820 ?auto_13837 ) ) ( not ( = ?auto_13820 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13795 ) ) ( not ( = ?auto_13791 ?auto_13825 ) ) ( not ( = ?auto_13792 ?auto_13795 ) ) ( not ( = ?auto_13792 ?auto_13825 ) ) ( not ( = ?auto_13793 ?auto_13795 ) ) ( not ( = ?auto_13793 ?auto_13825 ) ) ( not ( = ?auto_13795 ?auto_13820 ) ) ( not ( = ?auto_13795 ?auto_13837 ) ) ( not ( = ?auto_13795 ?auto_13823 ) ) ( not ( = ?auto_13809 ?auto_13811 ) ) ( not ( = ?auto_13809 ?auto_13818 ) ) ( not ( = ?auto_13809 ?auto_13814 ) ) ( not ( = ?auto_13830 ?auto_13827 ) ) ( not ( = ?auto_13830 ?auto_13833 ) ) ( not ( = ?auto_13830 ?auto_13822 ) ) ( not ( = ?auto_13825 ?auto_13820 ) ) ( not ( = ?auto_13825 ?auto_13837 ) ) ( not ( = ?auto_13825 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13796 ) ) ( not ( = ?auto_13791 ?auto_13838 ) ) ( not ( = ?auto_13792 ?auto_13796 ) ) ( not ( = ?auto_13792 ?auto_13838 ) ) ( not ( = ?auto_13793 ?auto_13796 ) ) ( not ( = ?auto_13793 ?auto_13838 ) ) ( not ( = ?auto_13794 ?auto_13796 ) ) ( not ( = ?auto_13794 ?auto_13838 ) ) ( not ( = ?auto_13796 ?auto_13825 ) ) ( not ( = ?auto_13796 ?auto_13820 ) ) ( not ( = ?auto_13796 ?auto_13837 ) ) ( not ( = ?auto_13796 ?auto_13823 ) ) ( not ( = ?auto_13824 ?auto_13809 ) ) ( not ( = ?auto_13824 ?auto_13811 ) ) ( not ( = ?auto_13824 ?auto_13818 ) ) ( not ( = ?auto_13824 ?auto_13814 ) ) ( not ( = ?auto_13810 ?auto_13830 ) ) ( not ( = ?auto_13810 ?auto_13827 ) ) ( not ( = ?auto_13810 ?auto_13833 ) ) ( not ( = ?auto_13810 ?auto_13822 ) ) ( not ( = ?auto_13838 ?auto_13825 ) ) ( not ( = ?auto_13838 ?auto_13820 ) ) ( not ( = ?auto_13838 ?auto_13837 ) ) ( not ( = ?auto_13838 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13797 ) ) ( not ( = ?auto_13791 ?auto_13813 ) ) ( not ( = ?auto_13792 ?auto_13797 ) ) ( not ( = ?auto_13792 ?auto_13813 ) ) ( not ( = ?auto_13793 ?auto_13797 ) ) ( not ( = ?auto_13793 ?auto_13813 ) ) ( not ( = ?auto_13794 ?auto_13797 ) ) ( not ( = ?auto_13794 ?auto_13813 ) ) ( not ( = ?auto_13795 ?auto_13797 ) ) ( not ( = ?auto_13795 ?auto_13813 ) ) ( not ( = ?auto_13797 ?auto_13838 ) ) ( not ( = ?auto_13797 ?auto_13825 ) ) ( not ( = ?auto_13797 ?auto_13820 ) ) ( not ( = ?auto_13797 ?auto_13837 ) ) ( not ( = ?auto_13797 ?auto_13823 ) ) ( not ( = ?auto_13834 ?auto_13824 ) ) ( not ( = ?auto_13834 ?auto_13809 ) ) ( not ( = ?auto_13834 ?auto_13811 ) ) ( not ( = ?auto_13834 ?auto_13818 ) ) ( not ( = ?auto_13834 ?auto_13814 ) ) ( not ( = ?auto_13835 ?auto_13810 ) ) ( not ( = ?auto_13835 ?auto_13830 ) ) ( not ( = ?auto_13835 ?auto_13827 ) ) ( not ( = ?auto_13835 ?auto_13833 ) ) ( not ( = ?auto_13835 ?auto_13822 ) ) ( not ( = ?auto_13813 ?auto_13838 ) ) ( not ( = ?auto_13813 ?auto_13825 ) ) ( not ( = ?auto_13813 ?auto_13820 ) ) ( not ( = ?auto_13813 ?auto_13837 ) ) ( not ( = ?auto_13813 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13798 ) ) ( not ( = ?auto_13791 ?auto_13832 ) ) ( not ( = ?auto_13792 ?auto_13798 ) ) ( not ( = ?auto_13792 ?auto_13832 ) ) ( not ( = ?auto_13793 ?auto_13798 ) ) ( not ( = ?auto_13793 ?auto_13832 ) ) ( not ( = ?auto_13794 ?auto_13798 ) ) ( not ( = ?auto_13794 ?auto_13832 ) ) ( not ( = ?auto_13795 ?auto_13798 ) ) ( not ( = ?auto_13795 ?auto_13832 ) ) ( not ( = ?auto_13796 ?auto_13798 ) ) ( not ( = ?auto_13796 ?auto_13832 ) ) ( not ( = ?auto_13798 ?auto_13813 ) ) ( not ( = ?auto_13798 ?auto_13838 ) ) ( not ( = ?auto_13798 ?auto_13825 ) ) ( not ( = ?auto_13798 ?auto_13820 ) ) ( not ( = ?auto_13798 ?auto_13837 ) ) ( not ( = ?auto_13798 ?auto_13823 ) ) ( not ( = ?auto_13826 ?auto_13834 ) ) ( not ( = ?auto_13826 ?auto_13824 ) ) ( not ( = ?auto_13826 ?auto_13809 ) ) ( not ( = ?auto_13826 ?auto_13811 ) ) ( not ( = ?auto_13826 ?auto_13818 ) ) ( not ( = ?auto_13826 ?auto_13814 ) ) ( not ( = ?auto_13828 ?auto_13835 ) ) ( not ( = ?auto_13828 ?auto_13810 ) ) ( not ( = ?auto_13828 ?auto_13830 ) ) ( not ( = ?auto_13828 ?auto_13827 ) ) ( not ( = ?auto_13828 ?auto_13833 ) ) ( not ( = ?auto_13828 ?auto_13822 ) ) ( not ( = ?auto_13832 ?auto_13813 ) ) ( not ( = ?auto_13832 ?auto_13838 ) ) ( not ( = ?auto_13832 ?auto_13825 ) ) ( not ( = ?auto_13832 ?auto_13820 ) ) ( not ( = ?auto_13832 ?auto_13837 ) ) ( not ( = ?auto_13832 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13799 ) ) ( not ( = ?auto_13791 ?auto_13821 ) ) ( not ( = ?auto_13792 ?auto_13799 ) ) ( not ( = ?auto_13792 ?auto_13821 ) ) ( not ( = ?auto_13793 ?auto_13799 ) ) ( not ( = ?auto_13793 ?auto_13821 ) ) ( not ( = ?auto_13794 ?auto_13799 ) ) ( not ( = ?auto_13794 ?auto_13821 ) ) ( not ( = ?auto_13795 ?auto_13799 ) ) ( not ( = ?auto_13795 ?auto_13821 ) ) ( not ( = ?auto_13796 ?auto_13799 ) ) ( not ( = ?auto_13796 ?auto_13821 ) ) ( not ( = ?auto_13797 ?auto_13799 ) ) ( not ( = ?auto_13797 ?auto_13821 ) ) ( not ( = ?auto_13799 ?auto_13832 ) ) ( not ( = ?auto_13799 ?auto_13813 ) ) ( not ( = ?auto_13799 ?auto_13838 ) ) ( not ( = ?auto_13799 ?auto_13825 ) ) ( not ( = ?auto_13799 ?auto_13820 ) ) ( not ( = ?auto_13799 ?auto_13837 ) ) ( not ( = ?auto_13799 ?auto_13823 ) ) ( not ( = ?auto_13836 ?auto_13826 ) ) ( not ( = ?auto_13836 ?auto_13834 ) ) ( not ( = ?auto_13836 ?auto_13824 ) ) ( not ( = ?auto_13836 ?auto_13809 ) ) ( not ( = ?auto_13836 ?auto_13811 ) ) ( not ( = ?auto_13836 ?auto_13818 ) ) ( not ( = ?auto_13836 ?auto_13814 ) ) ( not ( = ?auto_13829 ?auto_13828 ) ) ( not ( = ?auto_13829 ?auto_13835 ) ) ( not ( = ?auto_13829 ?auto_13810 ) ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13827 ) ) ( not ( = ?auto_13829 ?auto_13833 ) ) ( not ( = ?auto_13829 ?auto_13822 ) ) ( not ( = ?auto_13821 ?auto_13832 ) ) ( not ( = ?auto_13821 ?auto_13813 ) ) ( not ( = ?auto_13821 ?auto_13838 ) ) ( not ( = ?auto_13821 ?auto_13825 ) ) ( not ( = ?auto_13821 ?auto_13820 ) ) ( not ( = ?auto_13821 ?auto_13837 ) ) ( not ( = ?auto_13821 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13800 ) ) ( not ( = ?auto_13791 ?auto_13819 ) ) ( not ( = ?auto_13792 ?auto_13800 ) ) ( not ( = ?auto_13792 ?auto_13819 ) ) ( not ( = ?auto_13793 ?auto_13800 ) ) ( not ( = ?auto_13793 ?auto_13819 ) ) ( not ( = ?auto_13794 ?auto_13800 ) ) ( not ( = ?auto_13794 ?auto_13819 ) ) ( not ( = ?auto_13795 ?auto_13800 ) ) ( not ( = ?auto_13795 ?auto_13819 ) ) ( not ( = ?auto_13796 ?auto_13800 ) ) ( not ( = ?auto_13796 ?auto_13819 ) ) ( not ( = ?auto_13797 ?auto_13800 ) ) ( not ( = ?auto_13797 ?auto_13819 ) ) ( not ( = ?auto_13798 ?auto_13800 ) ) ( not ( = ?auto_13798 ?auto_13819 ) ) ( not ( = ?auto_13800 ?auto_13821 ) ) ( not ( = ?auto_13800 ?auto_13832 ) ) ( not ( = ?auto_13800 ?auto_13813 ) ) ( not ( = ?auto_13800 ?auto_13838 ) ) ( not ( = ?auto_13800 ?auto_13825 ) ) ( not ( = ?auto_13800 ?auto_13820 ) ) ( not ( = ?auto_13800 ?auto_13837 ) ) ( not ( = ?auto_13800 ?auto_13823 ) ) ( not ( = ?auto_13817 ?auto_13836 ) ) ( not ( = ?auto_13817 ?auto_13826 ) ) ( not ( = ?auto_13817 ?auto_13834 ) ) ( not ( = ?auto_13817 ?auto_13824 ) ) ( not ( = ?auto_13817 ?auto_13809 ) ) ( not ( = ?auto_13817 ?auto_13811 ) ) ( not ( = ?auto_13817 ?auto_13818 ) ) ( not ( = ?auto_13817 ?auto_13814 ) ) ( not ( = ?auto_13812 ?auto_13829 ) ) ( not ( = ?auto_13812 ?auto_13828 ) ) ( not ( = ?auto_13812 ?auto_13835 ) ) ( not ( = ?auto_13812 ?auto_13810 ) ) ( not ( = ?auto_13812 ?auto_13830 ) ) ( not ( = ?auto_13812 ?auto_13827 ) ) ( not ( = ?auto_13812 ?auto_13833 ) ) ( not ( = ?auto_13812 ?auto_13822 ) ) ( not ( = ?auto_13819 ?auto_13821 ) ) ( not ( = ?auto_13819 ?auto_13832 ) ) ( not ( = ?auto_13819 ?auto_13813 ) ) ( not ( = ?auto_13819 ?auto_13838 ) ) ( not ( = ?auto_13819 ?auto_13825 ) ) ( not ( = ?auto_13819 ?auto_13820 ) ) ( not ( = ?auto_13819 ?auto_13837 ) ) ( not ( = ?auto_13819 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13801 ) ) ( not ( = ?auto_13791 ?auto_13815 ) ) ( not ( = ?auto_13792 ?auto_13801 ) ) ( not ( = ?auto_13792 ?auto_13815 ) ) ( not ( = ?auto_13793 ?auto_13801 ) ) ( not ( = ?auto_13793 ?auto_13815 ) ) ( not ( = ?auto_13794 ?auto_13801 ) ) ( not ( = ?auto_13794 ?auto_13815 ) ) ( not ( = ?auto_13795 ?auto_13801 ) ) ( not ( = ?auto_13795 ?auto_13815 ) ) ( not ( = ?auto_13796 ?auto_13801 ) ) ( not ( = ?auto_13796 ?auto_13815 ) ) ( not ( = ?auto_13797 ?auto_13801 ) ) ( not ( = ?auto_13797 ?auto_13815 ) ) ( not ( = ?auto_13798 ?auto_13801 ) ) ( not ( = ?auto_13798 ?auto_13815 ) ) ( not ( = ?auto_13799 ?auto_13801 ) ) ( not ( = ?auto_13799 ?auto_13815 ) ) ( not ( = ?auto_13801 ?auto_13819 ) ) ( not ( = ?auto_13801 ?auto_13821 ) ) ( not ( = ?auto_13801 ?auto_13832 ) ) ( not ( = ?auto_13801 ?auto_13813 ) ) ( not ( = ?auto_13801 ?auto_13838 ) ) ( not ( = ?auto_13801 ?auto_13825 ) ) ( not ( = ?auto_13801 ?auto_13820 ) ) ( not ( = ?auto_13801 ?auto_13837 ) ) ( not ( = ?auto_13801 ?auto_13823 ) ) ( not ( = ?auto_13831 ?auto_13817 ) ) ( not ( = ?auto_13831 ?auto_13836 ) ) ( not ( = ?auto_13831 ?auto_13826 ) ) ( not ( = ?auto_13831 ?auto_13834 ) ) ( not ( = ?auto_13831 ?auto_13824 ) ) ( not ( = ?auto_13831 ?auto_13809 ) ) ( not ( = ?auto_13831 ?auto_13811 ) ) ( not ( = ?auto_13831 ?auto_13818 ) ) ( not ( = ?auto_13831 ?auto_13814 ) ) ( not ( = ?auto_13816 ?auto_13812 ) ) ( not ( = ?auto_13816 ?auto_13829 ) ) ( not ( = ?auto_13816 ?auto_13828 ) ) ( not ( = ?auto_13816 ?auto_13835 ) ) ( not ( = ?auto_13816 ?auto_13810 ) ) ( not ( = ?auto_13816 ?auto_13830 ) ) ( not ( = ?auto_13816 ?auto_13827 ) ) ( not ( = ?auto_13816 ?auto_13833 ) ) ( not ( = ?auto_13816 ?auto_13822 ) ) ( not ( = ?auto_13815 ?auto_13819 ) ) ( not ( = ?auto_13815 ?auto_13821 ) ) ( not ( = ?auto_13815 ?auto_13832 ) ) ( not ( = ?auto_13815 ?auto_13813 ) ) ( not ( = ?auto_13815 ?auto_13838 ) ) ( not ( = ?auto_13815 ?auto_13825 ) ) ( not ( = ?auto_13815 ?auto_13820 ) ) ( not ( = ?auto_13815 ?auto_13837 ) ) ( not ( = ?auto_13815 ?auto_13823 ) ) ( not ( = ?auto_13791 ?auto_13802 ) ) ( not ( = ?auto_13791 ?auto_13807 ) ) ( not ( = ?auto_13792 ?auto_13802 ) ) ( not ( = ?auto_13792 ?auto_13807 ) ) ( not ( = ?auto_13793 ?auto_13802 ) ) ( not ( = ?auto_13793 ?auto_13807 ) ) ( not ( = ?auto_13794 ?auto_13802 ) ) ( not ( = ?auto_13794 ?auto_13807 ) ) ( not ( = ?auto_13795 ?auto_13802 ) ) ( not ( = ?auto_13795 ?auto_13807 ) ) ( not ( = ?auto_13796 ?auto_13802 ) ) ( not ( = ?auto_13796 ?auto_13807 ) ) ( not ( = ?auto_13797 ?auto_13802 ) ) ( not ( = ?auto_13797 ?auto_13807 ) ) ( not ( = ?auto_13798 ?auto_13802 ) ) ( not ( = ?auto_13798 ?auto_13807 ) ) ( not ( = ?auto_13799 ?auto_13802 ) ) ( not ( = ?auto_13799 ?auto_13807 ) ) ( not ( = ?auto_13800 ?auto_13802 ) ) ( not ( = ?auto_13800 ?auto_13807 ) ) ( not ( = ?auto_13802 ?auto_13815 ) ) ( not ( = ?auto_13802 ?auto_13819 ) ) ( not ( = ?auto_13802 ?auto_13821 ) ) ( not ( = ?auto_13802 ?auto_13832 ) ) ( not ( = ?auto_13802 ?auto_13813 ) ) ( not ( = ?auto_13802 ?auto_13838 ) ) ( not ( = ?auto_13802 ?auto_13825 ) ) ( not ( = ?auto_13802 ?auto_13820 ) ) ( not ( = ?auto_13802 ?auto_13837 ) ) ( not ( = ?auto_13802 ?auto_13823 ) ) ( not ( = ?auto_13805 ?auto_13831 ) ) ( not ( = ?auto_13805 ?auto_13817 ) ) ( not ( = ?auto_13805 ?auto_13836 ) ) ( not ( = ?auto_13805 ?auto_13826 ) ) ( not ( = ?auto_13805 ?auto_13834 ) ) ( not ( = ?auto_13805 ?auto_13824 ) ) ( not ( = ?auto_13805 ?auto_13809 ) ) ( not ( = ?auto_13805 ?auto_13811 ) ) ( not ( = ?auto_13805 ?auto_13818 ) ) ( not ( = ?auto_13805 ?auto_13814 ) ) ( not ( = ?auto_13804 ?auto_13816 ) ) ( not ( = ?auto_13804 ?auto_13812 ) ) ( not ( = ?auto_13804 ?auto_13829 ) ) ( not ( = ?auto_13804 ?auto_13828 ) ) ( not ( = ?auto_13804 ?auto_13835 ) ) ( not ( = ?auto_13804 ?auto_13810 ) ) ( not ( = ?auto_13804 ?auto_13830 ) ) ( not ( = ?auto_13804 ?auto_13827 ) ) ( not ( = ?auto_13804 ?auto_13833 ) ) ( not ( = ?auto_13804 ?auto_13822 ) ) ( not ( = ?auto_13807 ?auto_13815 ) ) ( not ( = ?auto_13807 ?auto_13819 ) ) ( not ( = ?auto_13807 ?auto_13821 ) ) ( not ( = ?auto_13807 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13813 ) ) ( not ( = ?auto_13807 ?auto_13838 ) ) ( not ( = ?auto_13807 ?auto_13825 ) ) ( not ( = ?auto_13807 ?auto_13820 ) ) ( not ( = ?auto_13807 ?auto_13837 ) ) ( not ( = ?auto_13807 ?auto_13823 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13791 ?auto_13792 ?auto_13793 ?auto_13794 ?auto_13795 ?auto_13796 ?auto_13797 ?auto_13798 ?auto_13799 ?auto_13800 ?auto_13801 )
      ( MAKE-1CRATE ?auto_13801 ?auto_13802 )
      ( MAKE-11CRATE-VERIFY ?auto_13791 ?auto_13792 ?auto_13793 ?auto_13794 ?auto_13795 ?auto_13796 ?auto_13797 ?auto_13798 ?auto_13799 ?auto_13800 ?auto_13801 ?auto_13802 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13862 - SURFACE
      ?auto_13863 - SURFACE
      ?auto_13864 - SURFACE
      ?auto_13865 - SURFACE
      ?auto_13866 - SURFACE
      ?auto_13867 - SURFACE
      ?auto_13868 - SURFACE
      ?auto_13869 - SURFACE
      ?auto_13870 - SURFACE
      ?auto_13871 - SURFACE
      ?auto_13872 - SURFACE
      ?auto_13873 - SURFACE
      ?auto_13874 - SURFACE
    )
    :vars
    (
      ?auto_13877 - HOIST
      ?auto_13878 - PLACE
      ?auto_13880 - PLACE
      ?auto_13876 - HOIST
      ?auto_13875 - SURFACE
      ?auto_13888 - PLACE
      ?auto_13887 - HOIST
      ?auto_13885 - SURFACE
      ?auto_13893 - PLACE
      ?auto_13905 - HOIST
      ?auto_13911 - SURFACE
      ?auto_13896 - PLACE
      ?auto_13898 - HOIST
      ?auto_13889 - SURFACE
      ?auto_13894 - PLACE
      ?auto_13884 - HOIST
      ?auto_13904 - SURFACE
      ?auto_13892 - SURFACE
      ?auto_13903 - PLACE
      ?auto_13897 - HOIST
      ?auto_13881 - SURFACE
      ?auto_13883 - PLACE
      ?auto_13886 - HOIST
      ?auto_13907 - SURFACE
      ?auto_13899 - PLACE
      ?auto_13900 - HOIST
      ?auto_13891 - SURFACE
      ?auto_13909 - PLACE
      ?auto_13906 - HOIST
      ?auto_13908 - SURFACE
      ?auto_13890 - PLACE
      ?auto_13910 - HOIST
      ?auto_13902 - SURFACE
      ?auto_13895 - PLACE
      ?auto_13882 - HOIST
      ?auto_13901 - SURFACE
      ?auto_13879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13877 ?auto_13878 ) ( IS-CRATE ?auto_13874 ) ( not ( = ?auto_13880 ?auto_13878 ) ) ( HOIST-AT ?auto_13876 ?auto_13880 ) ( SURFACE-AT ?auto_13874 ?auto_13880 ) ( ON ?auto_13874 ?auto_13875 ) ( CLEAR ?auto_13874 ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( not ( = ?auto_13874 ?auto_13875 ) ) ( not ( = ?auto_13877 ?auto_13876 ) ) ( IS-CRATE ?auto_13873 ) ( not ( = ?auto_13888 ?auto_13878 ) ) ( HOIST-AT ?auto_13887 ?auto_13888 ) ( AVAILABLE ?auto_13887 ) ( SURFACE-AT ?auto_13873 ?auto_13888 ) ( ON ?auto_13873 ?auto_13885 ) ( CLEAR ?auto_13873 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13885 ) ) ( not ( = ?auto_13873 ?auto_13885 ) ) ( not ( = ?auto_13877 ?auto_13887 ) ) ( IS-CRATE ?auto_13872 ) ( not ( = ?auto_13893 ?auto_13878 ) ) ( HOIST-AT ?auto_13905 ?auto_13893 ) ( AVAILABLE ?auto_13905 ) ( SURFACE-AT ?auto_13872 ?auto_13893 ) ( ON ?auto_13872 ?auto_13911 ) ( CLEAR ?auto_13872 ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13911 ) ) ( not ( = ?auto_13872 ?auto_13911 ) ) ( not ( = ?auto_13877 ?auto_13905 ) ) ( IS-CRATE ?auto_13871 ) ( not ( = ?auto_13896 ?auto_13878 ) ) ( HOIST-AT ?auto_13898 ?auto_13896 ) ( AVAILABLE ?auto_13898 ) ( SURFACE-AT ?auto_13871 ?auto_13896 ) ( ON ?auto_13871 ?auto_13889 ) ( CLEAR ?auto_13871 ) ( not ( = ?auto_13870 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13889 ) ) ( not ( = ?auto_13871 ?auto_13889 ) ) ( not ( = ?auto_13877 ?auto_13898 ) ) ( IS-CRATE ?auto_13870 ) ( not ( = ?auto_13894 ?auto_13878 ) ) ( HOIST-AT ?auto_13884 ?auto_13894 ) ( AVAILABLE ?auto_13884 ) ( SURFACE-AT ?auto_13870 ?auto_13894 ) ( ON ?auto_13870 ?auto_13904 ) ( CLEAR ?auto_13870 ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13904 ) ) ( not ( = ?auto_13870 ?auto_13904 ) ) ( not ( = ?auto_13877 ?auto_13884 ) ) ( IS-CRATE ?auto_13869 ) ( AVAILABLE ?auto_13876 ) ( SURFACE-AT ?auto_13869 ?auto_13880 ) ( ON ?auto_13869 ?auto_13892 ) ( CLEAR ?auto_13869 ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( not ( = ?auto_13868 ?auto_13892 ) ) ( not ( = ?auto_13869 ?auto_13892 ) ) ( IS-CRATE ?auto_13868 ) ( not ( = ?auto_13903 ?auto_13878 ) ) ( HOIST-AT ?auto_13897 ?auto_13903 ) ( AVAILABLE ?auto_13897 ) ( SURFACE-AT ?auto_13868 ?auto_13903 ) ( ON ?auto_13868 ?auto_13881 ) ( CLEAR ?auto_13868 ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13881 ) ) ( not ( = ?auto_13868 ?auto_13881 ) ) ( not ( = ?auto_13877 ?auto_13897 ) ) ( IS-CRATE ?auto_13867 ) ( not ( = ?auto_13883 ?auto_13878 ) ) ( HOIST-AT ?auto_13886 ?auto_13883 ) ( AVAILABLE ?auto_13886 ) ( SURFACE-AT ?auto_13867 ?auto_13883 ) ( ON ?auto_13867 ?auto_13907 ) ( CLEAR ?auto_13867 ) ( not ( = ?auto_13866 ?auto_13867 ) ) ( not ( = ?auto_13866 ?auto_13907 ) ) ( not ( = ?auto_13867 ?auto_13907 ) ) ( not ( = ?auto_13877 ?auto_13886 ) ) ( IS-CRATE ?auto_13866 ) ( not ( = ?auto_13899 ?auto_13878 ) ) ( HOIST-AT ?auto_13900 ?auto_13899 ) ( AVAILABLE ?auto_13900 ) ( SURFACE-AT ?auto_13866 ?auto_13899 ) ( ON ?auto_13866 ?auto_13891 ) ( CLEAR ?auto_13866 ) ( not ( = ?auto_13865 ?auto_13866 ) ) ( not ( = ?auto_13865 ?auto_13891 ) ) ( not ( = ?auto_13866 ?auto_13891 ) ) ( not ( = ?auto_13877 ?auto_13900 ) ) ( IS-CRATE ?auto_13865 ) ( not ( = ?auto_13909 ?auto_13878 ) ) ( HOIST-AT ?auto_13906 ?auto_13909 ) ( AVAILABLE ?auto_13906 ) ( SURFACE-AT ?auto_13865 ?auto_13909 ) ( ON ?auto_13865 ?auto_13908 ) ( CLEAR ?auto_13865 ) ( not ( = ?auto_13864 ?auto_13865 ) ) ( not ( = ?auto_13864 ?auto_13908 ) ) ( not ( = ?auto_13865 ?auto_13908 ) ) ( not ( = ?auto_13877 ?auto_13906 ) ) ( IS-CRATE ?auto_13864 ) ( not ( = ?auto_13890 ?auto_13878 ) ) ( HOIST-AT ?auto_13910 ?auto_13890 ) ( AVAILABLE ?auto_13910 ) ( SURFACE-AT ?auto_13864 ?auto_13890 ) ( ON ?auto_13864 ?auto_13902 ) ( CLEAR ?auto_13864 ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( not ( = ?auto_13863 ?auto_13902 ) ) ( not ( = ?auto_13864 ?auto_13902 ) ) ( not ( = ?auto_13877 ?auto_13910 ) ) ( SURFACE-AT ?auto_13862 ?auto_13878 ) ( CLEAR ?auto_13862 ) ( IS-CRATE ?auto_13863 ) ( AVAILABLE ?auto_13877 ) ( not ( = ?auto_13895 ?auto_13878 ) ) ( HOIST-AT ?auto_13882 ?auto_13895 ) ( AVAILABLE ?auto_13882 ) ( SURFACE-AT ?auto_13863 ?auto_13895 ) ( ON ?auto_13863 ?auto_13901 ) ( CLEAR ?auto_13863 ) ( TRUCK-AT ?auto_13879 ?auto_13878 ) ( not ( = ?auto_13862 ?auto_13863 ) ) ( not ( = ?auto_13862 ?auto_13901 ) ) ( not ( = ?auto_13863 ?auto_13901 ) ) ( not ( = ?auto_13877 ?auto_13882 ) ) ( not ( = ?auto_13862 ?auto_13864 ) ) ( not ( = ?auto_13862 ?auto_13902 ) ) ( not ( = ?auto_13864 ?auto_13901 ) ) ( not ( = ?auto_13890 ?auto_13895 ) ) ( not ( = ?auto_13910 ?auto_13882 ) ) ( not ( = ?auto_13902 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13865 ) ) ( not ( = ?auto_13862 ?auto_13908 ) ) ( not ( = ?auto_13863 ?auto_13865 ) ) ( not ( = ?auto_13863 ?auto_13908 ) ) ( not ( = ?auto_13865 ?auto_13902 ) ) ( not ( = ?auto_13865 ?auto_13901 ) ) ( not ( = ?auto_13909 ?auto_13890 ) ) ( not ( = ?auto_13909 ?auto_13895 ) ) ( not ( = ?auto_13906 ?auto_13910 ) ) ( not ( = ?auto_13906 ?auto_13882 ) ) ( not ( = ?auto_13908 ?auto_13902 ) ) ( not ( = ?auto_13908 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13866 ) ) ( not ( = ?auto_13862 ?auto_13891 ) ) ( not ( = ?auto_13863 ?auto_13866 ) ) ( not ( = ?auto_13863 ?auto_13891 ) ) ( not ( = ?auto_13864 ?auto_13866 ) ) ( not ( = ?auto_13864 ?auto_13891 ) ) ( not ( = ?auto_13866 ?auto_13908 ) ) ( not ( = ?auto_13866 ?auto_13902 ) ) ( not ( = ?auto_13866 ?auto_13901 ) ) ( not ( = ?auto_13899 ?auto_13909 ) ) ( not ( = ?auto_13899 ?auto_13890 ) ) ( not ( = ?auto_13899 ?auto_13895 ) ) ( not ( = ?auto_13900 ?auto_13906 ) ) ( not ( = ?auto_13900 ?auto_13910 ) ) ( not ( = ?auto_13900 ?auto_13882 ) ) ( not ( = ?auto_13891 ?auto_13908 ) ) ( not ( = ?auto_13891 ?auto_13902 ) ) ( not ( = ?auto_13891 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13867 ) ) ( not ( = ?auto_13862 ?auto_13907 ) ) ( not ( = ?auto_13863 ?auto_13867 ) ) ( not ( = ?auto_13863 ?auto_13907 ) ) ( not ( = ?auto_13864 ?auto_13867 ) ) ( not ( = ?auto_13864 ?auto_13907 ) ) ( not ( = ?auto_13865 ?auto_13867 ) ) ( not ( = ?auto_13865 ?auto_13907 ) ) ( not ( = ?auto_13867 ?auto_13891 ) ) ( not ( = ?auto_13867 ?auto_13908 ) ) ( not ( = ?auto_13867 ?auto_13902 ) ) ( not ( = ?auto_13867 ?auto_13901 ) ) ( not ( = ?auto_13883 ?auto_13899 ) ) ( not ( = ?auto_13883 ?auto_13909 ) ) ( not ( = ?auto_13883 ?auto_13890 ) ) ( not ( = ?auto_13883 ?auto_13895 ) ) ( not ( = ?auto_13886 ?auto_13900 ) ) ( not ( = ?auto_13886 ?auto_13906 ) ) ( not ( = ?auto_13886 ?auto_13910 ) ) ( not ( = ?auto_13886 ?auto_13882 ) ) ( not ( = ?auto_13907 ?auto_13891 ) ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( not ( = ?auto_13907 ?auto_13902 ) ) ( not ( = ?auto_13907 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13868 ) ) ( not ( = ?auto_13862 ?auto_13881 ) ) ( not ( = ?auto_13863 ?auto_13868 ) ) ( not ( = ?auto_13863 ?auto_13881 ) ) ( not ( = ?auto_13864 ?auto_13868 ) ) ( not ( = ?auto_13864 ?auto_13881 ) ) ( not ( = ?auto_13865 ?auto_13868 ) ) ( not ( = ?auto_13865 ?auto_13881 ) ) ( not ( = ?auto_13866 ?auto_13868 ) ) ( not ( = ?auto_13866 ?auto_13881 ) ) ( not ( = ?auto_13868 ?auto_13907 ) ) ( not ( = ?auto_13868 ?auto_13891 ) ) ( not ( = ?auto_13868 ?auto_13908 ) ) ( not ( = ?auto_13868 ?auto_13902 ) ) ( not ( = ?auto_13868 ?auto_13901 ) ) ( not ( = ?auto_13903 ?auto_13883 ) ) ( not ( = ?auto_13903 ?auto_13899 ) ) ( not ( = ?auto_13903 ?auto_13909 ) ) ( not ( = ?auto_13903 ?auto_13890 ) ) ( not ( = ?auto_13903 ?auto_13895 ) ) ( not ( = ?auto_13897 ?auto_13886 ) ) ( not ( = ?auto_13897 ?auto_13900 ) ) ( not ( = ?auto_13897 ?auto_13906 ) ) ( not ( = ?auto_13897 ?auto_13910 ) ) ( not ( = ?auto_13897 ?auto_13882 ) ) ( not ( = ?auto_13881 ?auto_13907 ) ) ( not ( = ?auto_13881 ?auto_13891 ) ) ( not ( = ?auto_13881 ?auto_13908 ) ) ( not ( = ?auto_13881 ?auto_13902 ) ) ( not ( = ?auto_13881 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13869 ) ) ( not ( = ?auto_13862 ?auto_13892 ) ) ( not ( = ?auto_13863 ?auto_13869 ) ) ( not ( = ?auto_13863 ?auto_13892 ) ) ( not ( = ?auto_13864 ?auto_13869 ) ) ( not ( = ?auto_13864 ?auto_13892 ) ) ( not ( = ?auto_13865 ?auto_13869 ) ) ( not ( = ?auto_13865 ?auto_13892 ) ) ( not ( = ?auto_13866 ?auto_13869 ) ) ( not ( = ?auto_13866 ?auto_13892 ) ) ( not ( = ?auto_13867 ?auto_13869 ) ) ( not ( = ?auto_13867 ?auto_13892 ) ) ( not ( = ?auto_13869 ?auto_13881 ) ) ( not ( = ?auto_13869 ?auto_13907 ) ) ( not ( = ?auto_13869 ?auto_13891 ) ) ( not ( = ?auto_13869 ?auto_13908 ) ) ( not ( = ?auto_13869 ?auto_13902 ) ) ( not ( = ?auto_13869 ?auto_13901 ) ) ( not ( = ?auto_13880 ?auto_13903 ) ) ( not ( = ?auto_13880 ?auto_13883 ) ) ( not ( = ?auto_13880 ?auto_13899 ) ) ( not ( = ?auto_13880 ?auto_13909 ) ) ( not ( = ?auto_13880 ?auto_13890 ) ) ( not ( = ?auto_13880 ?auto_13895 ) ) ( not ( = ?auto_13876 ?auto_13897 ) ) ( not ( = ?auto_13876 ?auto_13886 ) ) ( not ( = ?auto_13876 ?auto_13900 ) ) ( not ( = ?auto_13876 ?auto_13906 ) ) ( not ( = ?auto_13876 ?auto_13910 ) ) ( not ( = ?auto_13876 ?auto_13882 ) ) ( not ( = ?auto_13892 ?auto_13881 ) ) ( not ( = ?auto_13892 ?auto_13907 ) ) ( not ( = ?auto_13892 ?auto_13891 ) ) ( not ( = ?auto_13892 ?auto_13908 ) ) ( not ( = ?auto_13892 ?auto_13902 ) ) ( not ( = ?auto_13892 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13870 ) ) ( not ( = ?auto_13862 ?auto_13904 ) ) ( not ( = ?auto_13863 ?auto_13870 ) ) ( not ( = ?auto_13863 ?auto_13904 ) ) ( not ( = ?auto_13864 ?auto_13870 ) ) ( not ( = ?auto_13864 ?auto_13904 ) ) ( not ( = ?auto_13865 ?auto_13870 ) ) ( not ( = ?auto_13865 ?auto_13904 ) ) ( not ( = ?auto_13866 ?auto_13870 ) ) ( not ( = ?auto_13866 ?auto_13904 ) ) ( not ( = ?auto_13867 ?auto_13870 ) ) ( not ( = ?auto_13867 ?auto_13904 ) ) ( not ( = ?auto_13868 ?auto_13870 ) ) ( not ( = ?auto_13868 ?auto_13904 ) ) ( not ( = ?auto_13870 ?auto_13892 ) ) ( not ( = ?auto_13870 ?auto_13881 ) ) ( not ( = ?auto_13870 ?auto_13907 ) ) ( not ( = ?auto_13870 ?auto_13891 ) ) ( not ( = ?auto_13870 ?auto_13908 ) ) ( not ( = ?auto_13870 ?auto_13902 ) ) ( not ( = ?auto_13870 ?auto_13901 ) ) ( not ( = ?auto_13894 ?auto_13880 ) ) ( not ( = ?auto_13894 ?auto_13903 ) ) ( not ( = ?auto_13894 ?auto_13883 ) ) ( not ( = ?auto_13894 ?auto_13899 ) ) ( not ( = ?auto_13894 ?auto_13909 ) ) ( not ( = ?auto_13894 ?auto_13890 ) ) ( not ( = ?auto_13894 ?auto_13895 ) ) ( not ( = ?auto_13884 ?auto_13876 ) ) ( not ( = ?auto_13884 ?auto_13897 ) ) ( not ( = ?auto_13884 ?auto_13886 ) ) ( not ( = ?auto_13884 ?auto_13900 ) ) ( not ( = ?auto_13884 ?auto_13906 ) ) ( not ( = ?auto_13884 ?auto_13910 ) ) ( not ( = ?auto_13884 ?auto_13882 ) ) ( not ( = ?auto_13904 ?auto_13892 ) ) ( not ( = ?auto_13904 ?auto_13881 ) ) ( not ( = ?auto_13904 ?auto_13907 ) ) ( not ( = ?auto_13904 ?auto_13891 ) ) ( not ( = ?auto_13904 ?auto_13908 ) ) ( not ( = ?auto_13904 ?auto_13902 ) ) ( not ( = ?auto_13904 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13871 ) ) ( not ( = ?auto_13862 ?auto_13889 ) ) ( not ( = ?auto_13863 ?auto_13871 ) ) ( not ( = ?auto_13863 ?auto_13889 ) ) ( not ( = ?auto_13864 ?auto_13871 ) ) ( not ( = ?auto_13864 ?auto_13889 ) ) ( not ( = ?auto_13865 ?auto_13871 ) ) ( not ( = ?auto_13865 ?auto_13889 ) ) ( not ( = ?auto_13866 ?auto_13871 ) ) ( not ( = ?auto_13866 ?auto_13889 ) ) ( not ( = ?auto_13867 ?auto_13871 ) ) ( not ( = ?auto_13867 ?auto_13889 ) ) ( not ( = ?auto_13868 ?auto_13871 ) ) ( not ( = ?auto_13868 ?auto_13889 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13889 ) ) ( not ( = ?auto_13871 ?auto_13904 ) ) ( not ( = ?auto_13871 ?auto_13892 ) ) ( not ( = ?auto_13871 ?auto_13881 ) ) ( not ( = ?auto_13871 ?auto_13907 ) ) ( not ( = ?auto_13871 ?auto_13891 ) ) ( not ( = ?auto_13871 ?auto_13908 ) ) ( not ( = ?auto_13871 ?auto_13902 ) ) ( not ( = ?auto_13871 ?auto_13901 ) ) ( not ( = ?auto_13896 ?auto_13894 ) ) ( not ( = ?auto_13896 ?auto_13880 ) ) ( not ( = ?auto_13896 ?auto_13903 ) ) ( not ( = ?auto_13896 ?auto_13883 ) ) ( not ( = ?auto_13896 ?auto_13899 ) ) ( not ( = ?auto_13896 ?auto_13909 ) ) ( not ( = ?auto_13896 ?auto_13890 ) ) ( not ( = ?auto_13896 ?auto_13895 ) ) ( not ( = ?auto_13898 ?auto_13884 ) ) ( not ( = ?auto_13898 ?auto_13876 ) ) ( not ( = ?auto_13898 ?auto_13897 ) ) ( not ( = ?auto_13898 ?auto_13886 ) ) ( not ( = ?auto_13898 ?auto_13900 ) ) ( not ( = ?auto_13898 ?auto_13906 ) ) ( not ( = ?auto_13898 ?auto_13910 ) ) ( not ( = ?auto_13898 ?auto_13882 ) ) ( not ( = ?auto_13889 ?auto_13904 ) ) ( not ( = ?auto_13889 ?auto_13892 ) ) ( not ( = ?auto_13889 ?auto_13881 ) ) ( not ( = ?auto_13889 ?auto_13907 ) ) ( not ( = ?auto_13889 ?auto_13891 ) ) ( not ( = ?auto_13889 ?auto_13908 ) ) ( not ( = ?auto_13889 ?auto_13902 ) ) ( not ( = ?auto_13889 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13872 ) ) ( not ( = ?auto_13862 ?auto_13911 ) ) ( not ( = ?auto_13863 ?auto_13872 ) ) ( not ( = ?auto_13863 ?auto_13911 ) ) ( not ( = ?auto_13864 ?auto_13872 ) ) ( not ( = ?auto_13864 ?auto_13911 ) ) ( not ( = ?auto_13865 ?auto_13872 ) ) ( not ( = ?auto_13865 ?auto_13911 ) ) ( not ( = ?auto_13866 ?auto_13872 ) ) ( not ( = ?auto_13866 ?auto_13911 ) ) ( not ( = ?auto_13867 ?auto_13872 ) ) ( not ( = ?auto_13867 ?auto_13911 ) ) ( not ( = ?auto_13868 ?auto_13872 ) ) ( not ( = ?auto_13868 ?auto_13911 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) ( not ( = ?auto_13869 ?auto_13911 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( not ( = ?auto_13870 ?auto_13911 ) ) ( not ( = ?auto_13872 ?auto_13889 ) ) ( not ( = ?auto_13872 ?auto_13904 ) ) ( not ( = ?auto_13872 ?auto_13892 ) ) ( not ( = ?auto_13872 ?auto_13881 ) ) ( not ( = ?auto_13872 ?auto_13907 ) ) ( not ( = ?auto_13872 ?auto_13891 ) ) ( not ( = ?auto_13872 ?auto_13908 ) ) ( not ( = ?auto_13872 ?auto_13902 ) ) ( not ( = ?auto_13872 ?auto_13901 ) ) ( not ( = ?auto_13893 ?auto_13896 ) ) ( not ( = ?auto_13893 ?auto_13894 ) ) ( not ( = ?auto_13893 ?auto_13880 ) ) ( not ( = ?auto_13893 ?auto_13903 ) ) ( not ( = ?auto_13893 ?auto_13883 ) ) ( not ( = ?auto_13893 ?auto_13899 ) ) ( not ( = ?auto_13893 ?auto_13909 ) ) ( not ( = ?auto_13893 ?auto_13890 ) ) ( not ( = ?auto_13893 ?auto_13895 ) ) ( not ( = ?auto_13905 ?auto_13898 ) ) ( not ( = ?auto_13905 ?auto_13884 ) ) ( not ( = ?auto_13905 ?auto_13876 ) ) ( not ( = ?auto_13905 ?auto_13897 ) ) ( not ( = ?auto_13905 ?auto_13886 ) ) ( not ( = ?auto_13905 ?auto_13900 ) ) ( not ( = ?auto_13905 ?auto_13906 ) ) ( not ( = ?auto_13905 ?auto_13910 ) ) ( not ( = ?auto_13905 ?auto_13882 ) ) ( not ( = ?auto_13911 ?auto_13889 ) ) ( not ( = ?auto_13911 ?auto_13904 ) ) ( not ( = ?auto_13911 ?auto_13892 ) ) ( not ( = ?auto_13911 ?auto_13881 ) ) ( not ( = ?auto_13911 ?auto_13907 ) ) ( not ( = ?auto_13911 ?auto_13891 ) ) ( not ( = ?auto_13911 ?auto_13908 ) ) ( not ( = ?auto_13911 ?auto_13902 ) ) ( not ( = ?auto_13911 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13873 ) ) ( not ( = ?auto_13862 ?auto_13885 ) ) ( not ( = ?auto_13863 ?auto_13873 ) ) ( not ( = ?auto_13863 ?auto_13885 ) ) ( not ( = ?auto_13864 ?auto_13873 ) ) ( not ( = ?auto_13864 ?auto_13885 ) ) ( not ( = ?auto_13865 ?auto_13873 ) ) ( not ( = ?auto_13865 ?auto_13885 ) ) ( not ( = ?auto_13866 ?auto_13873 ) ) ( not ( = ?auto_13866 ?auto_13885 ) ) ( not ( = ?auto_13867 ?auto_13873 ) ) ( not ( = ?auto_13867 ?auto_13885 ) ) ( not ( = ?auto_13868 ?auto_13873 ) ) ( not ( = ?auto_13868 ?auto_13885 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) ( not ( = ?auto_13869 ?auto_13885 ) ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( not ( = ?auto_13870 ?auto_13885 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13885 ) ) ( not ( = ?auto_13873 ?auto_13911 ) ) ( not ( = ?auto_13873 ?auto_13889 ) ) ( not ( = ?auto_13873 ?auto_13904 ) ) ( not ( = ?auto_13873 ?auto_13892 ) ) ( not ( = ?auto_13873 ?auto_13881 ) ) ( not ( = ?auto_13873 ?auto_13907 ) ) ( not ( = ?auto_13873 ?auto_13891 ) ) ( not ( = ?auto_13873 ?auto_13908 ) ) ( not ( = ?auto_13873 ?auto_13902 ) ) ( not ( = ?auto_13873 ?auto_13901 ) ) ( not ( = ?auto_13888 ?auto_13893 ) ) ( not ( = ?auto_13888 ?auto_13896 ) ) ( not ( = ?auto_13888 ?auto_13894 ) ) ( not ( = ?auto_13888 ?auto_13880 ) ) ( not ( = ?auto_13888 ?auto_13903 ) ) ( not ( = ?auto_13888 ?auto_13883 ) ) ( not ( = ?auto_13888 ?auto_13899 ) ) ( not ( = ?auto_13888 ?auto_13909 ) ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( not ( = ?auto_13888 ?auto_13895 ) ) ( not ( = ?auto_13887 ?auto_13905 ) ) ( not ( = ?auto_13887 ?auto_13898 ) ) ( not ( = ?auto_13887 ?auto_13884 ) ) ( not ( = ?auto_13887 ?auto_13876 ) ) ( not ( = ?auto_13887 ?auto_13897 ) ) ( not ( = ?auto_13887 ?auto_13886 ) ) ( not ( = ?auto_13887 ?auto_13900 ) ) ( not ( = ?auto_13887 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13910 ) ) ( not ( = ?auto_13887 ?auto_13882 ) ) ( not ( = ?auto_13885 ?auto_13911 ) ) ( not ( = ?auto_13885 ?auto_13889 ) ) ( not ( = ?auto_13885 ?auto_13904 ) ) ( not ( = ?auto_13885 ?auto_13892 ) ) ( not ( = ?auto_13885 ?auto_13881 ) ) ( not ( = ?auto_13885 ?auto_13907 ) ) ( not ( = ?auto_13885 ?auto_13891 ) ) ( not ( = ?auto_13885 ?auto_13908 ) ) ( not ( = ?auto_13885 ?auto_13902 ) ) ( not ( = ?auto_13885 ?auto_13901 ) ) ( not ( = ?auto_13862 ?auto_13874 ) ) ( not ( = ?auto_13862 ?auto_13875 ) ) ( not ( = ?auto_13863 ?auto_13874 ) ) ( not ( = ?auto_13863 ?auto_13875 ) ) ( not ( = ?auto_13864 ?auto_13874 ) ) ( not ( = ?auto_13864 ?auto_13875 ) ) ( not ( = ?auto_13865 ?auto_13874 ) ) ( not ( = ?auto_13865 ?auto_13875 ) ) ( not ( = ?auto_13866 ?auto_13874 ) ) ( not ( = ?auto_13866 ?auto_13875 ) ) ( not ( = ?auto_13867 ?auto_13874 ) ) ( not ( = ?auto_13867 ?auto_13875 ) ) ( not ( = ?auto_13868 ?auto_13874 ) ) ( not ( = ?auto_13868 ?auto_13875 ) ) ( not ( = ?auto_13869 ?auto_13874 ) ) ( not ( = ?auto_13869 ?auto_13875 ) ) ( not ( = ?auto_13870 ?auto_13874 ) ) ( not ( = ?auto_13870 ?auto_13875 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13875 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13874 ?auto_13885 ) ) ( not ( = ?auto_13874 ?auto_13911 ) ) ( not ( = ?auto_13874 ?auto_13889 ) ) ( not ( = ?auto_13874 ?auto_13904 ) ) ( not ( = ?auto_13874 ?auto_13892 ) ) ( not ( = ?auto_13874 ?auto_13881 ) ) ( not ( = ?auto_13874 ?auto_13907 ) ) ( not ( = ?auto_13874 ?auto_13891 ) ) ( not ( = ?auto_13874 ?auto_13908 ) ) ( not ( = ?auto_13874 ?auto_13902 ) ) ( not ( = ?auto_13874 ?auto_13901 ) ) ( not ( = ?auto_13875 ?auto_13885 ) ) ( not ( = ?auto_13875 ?auto_13911 ) ) ( not ( = ?auto_13875 ?auto_13889 ) ) ( not ( = ?auto_13875 ?auto_13904 ) ) ( not ( = ?auto_13875 ?auto_13892 ) ) ( not ( = ?auto_13875 ?auto_13881 ) ) ( not ( = ?auto_13875 ?auto_13907 ) ) ( not ( = ?auto_13875 ?auto_13891 ) ) ( not ( = ?auto_13875 ?auto_13908 ) ) ( not ( = ?auto_13875 ?auto_13902 ) ) ( not ( = ?auto_13875 ?auto_13901 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13862 ?auto_13863 ?auto_13864 ?auto_13865 ?auto_13866 ?auto_13867 ?auto_13868 ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 )
      ( MAKE-1CRATE ?auto_13873 ?auto_13874 )
      ( MAKE-12CRATE-VERIFY ?auto_13862 ?auto_13863 ?auto_13864 ?auto_13865 ?auto_13866 ?auto_13867 ?auto_13868 ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_13936 - SURFACE
      ?auto_13937 - SURFACE
      ?auto_13938 - SURFACE
      ?auto_13939 - SURFACE
      ?auto_13940 - SURFACE
      ?auto_13941 - SURFACE
      ?auto_13942 - SURFACE
      ?auto_13943 - SURFACE
      ?auto_13944 - SURFACE
      ?auto_13945 - SURFACE
      ?auto_13946 - SURFACE
      ?auto_13947 - SURFACE
      ?auto_13948 - SURFACE
      ?auto_13949 - SURFACE
    )
    :vars
    (
      ?auto_13952 - HOIST
      ?auto_13951 - PLACE
      ?auto_13954 - PLACE
      ?auto_13953 - HOIST
      ?auto_13955 - SURFACE
      ?auto_13958 - PLACE
      ?auto_13966 - HOIST
      ?auto_13957 - SURFACE
      ?auto_13983 - PLACE
      ?auto_13984 - HOIST
      ?auto_13978 - SURFACE
      ?auto_13972 - PLACE
      ?auto_13973 - HOIST
      ?auto_13979 - SURFACE
      ?auto_13970 - SURFACE
      ?auto_13960 - PLACE
      ?auto_13987 - HOIST
      ?auto_13986 - SURFACE
      ?auto_13968 - SURFACE
      ?auto_13964 - PLACE
      ?auto_13982 - HOIST
      ?auto_13965 - SURFACE
      ?auto_13975 - PLACE
      ?auto_13974 - HOIST
      ?auto_13962 - SURFACE
      ?auto_13981 - PLACE
      ?auto_13961 - HOIST
      ?auto_13959 - SURFACE
      ?auto_13967 - PLACE
      ?auto_13956 - HOIST
      ?auto_13985 - SURFACE
      ?auto_13976 - PLACE
      ?auto_13980 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13963 - PLACE
      ?auto_13971 - HOIST
      ?auto_13969 - SURFACE
      ?auto_13950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13952 ?auto_13951 ) ( IS-CRATE ?auto_13949 ) ( not ( = ?auto_13954 ?auto_13951 ) ) ( HOIST-AT ?auto_13953 ?auto_13954 ) ( SURFACE-AT ?auto_13949 ?auto_13954 ) ( ON ?auto_13949 ?auto_13955 ) ( CLEAR ?auto_13949 ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13955 ) ) ( not ( = ?auto_13949 ?auto_13955 ) ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( IS-CRATE ?auto_13948 ) ( not ( = ?auto_13958 ?auto_13951 ) ) ( HOIST-AT ?auto_13966 ?auto_13958 ) ( SURFACE-AT ?auto_13948 ?auto_13958 ) ( ON ?auto_13948 ?auto_13957 ) ( CLEAR ?auto_13948 ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13957 ) ) ( not ( = ?auto_13948 ?auto_13957 ) ) ( not ( = ?auto_13952 ?auto_13966 ) ) ( IS-CRATE ?auto_13947 ) ( not ( = ?auto_13983 ?auto_13951 ) ) ( HOIST-AT ?auto_13984 ?auto_13983 ) ( AVAILABLE ?auto_13984 ) ( SURFACE-AT ?auto_13947 ?auto_13983 ) ( ON ?auto_13947 ?auto_13978 ) ( CLEAR ?auto_13947 ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13978 ) ) ( not ( = ?auto_13947 ?auto_13978 ) ) ( not ( = ?auto_13952 ?auto_13984 ) ) ( IS-CRATE ?auto_13946 ) ( not ( = ?auto_13972 ?auto_13951 ) ) ( HOIST-AT ?auto_13973 ?auto_13972 ) ( AVAILABLE ?auto_13973 ) ( SURFACE-AT ?auto_13946 ?auto_13972 ) ( ON ?auto_13946 ?auto_13979 ) ( CLEAR ?auto_13946 ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13979 ) ) ( not ( = ?auto_13946 ?auto_13979 ) ) ( not ( = ?auto_13952 ?auto_13973 ) ) ( IS-CRATE ?auto_13945 ) ( AVAILABLE ?auto_13953 ) ( SURFACE-AT ?auto_13945 ?auto_13954 ) ( ON ?auto_13945 ?auto_13970 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13944 ?auto_13970 ) ) ( not ( = ?auto_13945 ?auto_13970 ) ) ( IS-CRATE ?auto_13944 ) ( not ( = ?auto_13960 ?auto_13951 ) ) ( HOIST-AT ?auto_13987 ?auto_13960 ) ( AVAILABLE ?auto_13987 ) ( SURFACE-AT ?auto_13944 ?auto_13960 ) ( ON ?auto_13944 ?auto_13986 ) ( CLEAR ?auto_13944 ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13986 ) ) ( not ( = ?auto_13944 ?auto_13986 ) ) ( not ( = ?auto_13952 ?auto_13987 ) ) ( IS-CRATE ?auto_13943 ) ( AVAILABLE ?auto_13966 ) ( SURFACE-AT ?auto_13943 ?auto_13958 ) ( ON ?auto_13943 ?auto_13968 ) ( CLEAR ?auto_13943 ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( not ( = ?auto_13942 ?auto_13968 ) ) ( not ( = ?auto_13943 ?auto_13968 ) ) ( IS-CRATE ?auto_13942 ) ( not ( = ?auto_13964 ?auto_13951 ) ) ( HOIST-AT ?auto_13982 ?auto_13964 ) ( AVAILABLE ?auto_13982 ) ( SURFACE-AT ?auto_13942 ?auto_13964 ) ( ON ?auto_13942 ?auto_13965 ) ( CLEAR ?auto_13942 ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13965 ) ) ( not ( = ?auto_13942 ?auto_13965 ) ) ( not ( = ?auto_13952 ?auto_13982 ) ) ( IS-CRATE ?auto_13941 ) ( not ( = ?auto_13975 ?auto_13951 ) ) ( HOIST-AT ?auto_13974 ?auto_13975 ) ( AVAILABLE ?auto_13974 ) ( SURFACE-AT ?auto_13941 ?auto_13975 ) ( ON ?auto_13941 ?auto_13962 ) ( CLEAR ?auto_13941 ) ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13962 ) ) ( not ( = ?auto_13941 ?auto_13962 ) ) ( not ( = ?auto_13952 ?auto_13974 ) ) ( IS-CRATE ?auto_13940 ) ( not ( = ?auto_13981 ?auto_13951 ) ) ( HOIST-AT ?auto_13961 ?auto_13981 ) ( AVAILABLE ?auto_13961 ) ( SURFACE-AT ?auto_13940 ?auto_13981 ) ( ON ?auto_13940 ?auto_13959 ) ( CLEAR ?auto_13940 ) ( not ( = ?auto_13939 ?auto_13940 ) ) ( not ( = ?auto_13939 ?auto_13959 ) ) ( not ( = ?auto_13940 ?auto_13959 ) ) ( not ( = ?auto_13952 ?auto_13961 ) ) ( IS-CRATE ?auto_13939 ) ( not ( = ?auto_13967 ?auto_13951 ) ) ( HOIST-AT ?auto_13956 ?auto_13967 ) ( AVAILABLE ?auto_13956 ) ( SURFACE-AT ?auto_13939 ?auto_13967 ) ( ON ?auto_13939 ?auto_13985 ) ( CLEAR ?auto_13939 ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13985 ) ) ( not ( = ?auto_13939 ?auto_13985 ) ) ( not ( = ?auto_13952 ?auto_13956 ) ) ( IS-CRATE ?auto_13938 ) ( not ( = ?auto_13976 ?auto_13951 ) ) ( HOIST-AT ?auto_13980 ?auto_13976 ) ( AVAILABLE ?auto_13980 ) ( SURFACE-AT ?auto_13938 ?auto_13976 ) ( ON ?auto_13938 ?auto_13977 ) ( CLEAR ?auto_13938 ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13977 ) ) ( not ( = ?auto_13938 ?auto_13977 ) ) ( not ( = ?auto_13952 ?auto_13980 ) ) ( SURFACE-AT ?auto_13936 ?auto_13951 ) ( CLEAR ?auto_13936 ) ( IS-CRATE ?auto_13937 ) ( AVAILABLE ?auto_13952 ) ( not ( = ?auto_13963 ?auto_13951 ) ) ( HOIST-AT ?auto_13971 ?auto_13963 ) ( AVAILABLE ?auto_13971 ) ( SURFACE-AT ?auto_13937 ?auto_13963 ) ( ON ?auto_13937 ?auto_13969 ) ( CLEAR ?auto_13937 ) ( TRUCK-AT ?auto_13950 ?auto_13951 ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13969 ) ) ( not ( = ?auto_13937 ?auto_13969 ) ) ( not ( = ?auto_13952 ?auto_13971 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13977 ) ) ( not ( = ?auto_13938 ?auto_13969 ) ) ( not ( = ?auto_13976 ?auto_13963 ) ) ( not ( = ?auto_13980 ?auto_13971 ) ) ( not ( = ?auto_13977 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13985 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13985 ) ) ( not ( = ?auto_13939 ?auto_13977 ) ) ( not ( = ?auto_13939 ?auto_13969 ) ) ( not ( = ?auto_13967 ?auto_13976 ) ) ( not ( = ?auto_13967 ?auto_13963 ) ) ( not ( = ?auto_13956 ?auto_13980 ) ) ( not ( = ?auto_13956 ?auto_13971 ) ) ( not ( = ?auto_13985 ?auto_13977 ) ) ( not ( = ?auto_13985 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13940 ) ) ( not ( = ?auto_13936 ?auto_13959 ) ) ( not ( = ?auto_13937 ?auto_13940 ) ) ( not ( = ?auto_13937 ?auto_13959 ) ) ( not ( = ?auto_13938 ?auto_13940 ) ) ( not ( = ?auto_13938 ?auto_13959 ) ) ( not ( = ?auto_13940 ?auto_13985 ) ) ( not ( = ?auto_13940 ?auto_13977 ) ) ( not ( = ?auto_13940 ?auto_13969 ) ) ( not ( = ?auto_13981 ?auto_13967 ) ) ( not ( = ?auto_13981 ?auto_13976 ) ) ( not ( = ?auto_13981 ?auto_13963 ) ) ( not ( = ?auto_13961 ?auto_13956 ) ) ( not ( = ?auto_13961 ?auto_13980 ) ) ( not ( = ?auto_13961 ?auto_13971 ) ) ( not ( = ?auto_13959 ?auto_13985 ) ) ( not ( = ?auto_13959 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13941 ) ) ( not ( = ?auto_13936 ?auto_13962 ) ) ( not ( = ?auto_13937 ?auto_13941 ) ) ( not ( = ?auto_13937 ?auto_13962 ) ) ( not ( = ?auto_13938 ?auto_13941 ) ) ( not ( = ?auto_13938 ?auto_13962 ) ) ( not ( = ?auto_13939 ?auto_13941 ) ) ( not ( = ?auto_13939 ?auto_13962 ) ) ( not ( = ?auto_13941 ?auto_13959 ) ) ( not ( = ?auto_13941 ?auto_13985 ) ) ( not ( = ?auto_13941 ?auto_13977 ) ) ( not ( = ?auto_13941 ?auto_13969 ) ) ( not ( = ?auto_13975 ?auto_13981 ) ) ( not ( = ?auto_13975 ?auto_13967 ) ) ( not ( = ?auto_13975 ?auto_13976 ) ) ( not ( = ?auto_13975 ?auto_13963 ) ) ( not ( = ?auto_13974 ?auto_13961 ) ) ( not ( = ?auto_13974 ?auto_13956 ) ) ( not ( = ?auto_13974 ?auto_13980 ) ) ( not ( = ?auto_13974 ?auto_13971 ) ) ( not ( = ?auto_13962 ?auto_13959 ) ) ( not ( = ?auto_13962 ?auto_13985 ) ) ( not ( = ?auto_13962 ?auto_13977 ) ) ( not ( = ?auto_13962 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( not ( = ?auto_13936 ?auto_13965 ) ) ( not ( = ?auto_13937 ?auto_13942 ) ) ( not ( = ?auto_13937 ?auto_13965 ) ) ( not ( = ?auto_13938 ?auto_13942 ) ) ( not ( = ?auto_13938 ?auto_13965 ) ) ( not ( = ?auto_13939 ?auto_13942 ) ) ( not ( = ?auto_13939 ?auto_13965 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13965 ) ) ( not ( = ?auto_13942 ?auto_13962 ) ) ( not ( = ?auto_13942 ?auto_13959 ) ) ( not ( = ?auto_13942 ?auto_13985 ) ) ( not ( = ?auto_13942 ?auto_13977 ) ) ( not ( = ?auto_13942 ?auto_13969 ) ) ( not ( = ?auto_13964 ?auto_13975 ) ) ( not ( = ?auto_13964 ?auto_13981 ) ) ( not ( = ?auto_13964 ?auto_13967 ) ) ( not ( = ?auto_13964 ?auto_13976 ) ) ( not ( = ?auto_13964 ?auto_13963 ) ) ( not ( = ?auto_13982 ?auto_13974 ) ) ( not ( = ?auto_13982 ?auto_13961 ) ) ( not ( = ?auto_13982 ?auto_13956 ) ) ( not ( = ?auto_13982 ?auto_13980 ) ) ( not ( = ?auto_13982 ?auto_13971 ) ) ( not ( = ?auto_13965 ?auto_13962 ) ) ( not ( = ?auto_13965 ?auto_13959 ) ) ( not ( = ?auto_13965 ?auto_13985 ) ) ( not ( = ?auto_13965 ?auto_13977 ) ) ( not ( = ?auto_13965 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13943 ) ) ( not ( = ?auto_13936 ?auto_13968 ) ) ( not ( = ?auto_13937 ?auto_13943 ) ) ( not ( = ?auto_13937 ?auto_13968 ) ) ( not ( = ?auto_13938 ?auto_13943 ) ) ( not ( = ?auto_13938 ?auto_13968 ) ) ( not ( = ?auto_13939 ?auto_13943 ) ) ( not ( = ?auto_13939 ?auto_13968 ) ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13940 ?auto_13968 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( not ( = ?auto_13941 ?auto_13968 ) ) ( not ( = ?auto_13943 ?auto_13965 ) ) ( not ( = ?auto_13943 ?auto_13962 ) ) ( not ( = ?auto_13943 ?auto_13959 ) ) ( not ( = ?auto_13943 ?auto_13985 ) ) ( not ( = ?auto_13943 ?auto_13977 ) ) ( not ( = ?auto_13943 ?auto_13969 ) ) ( not ( = ?auto_13958 ?auto_13964 ) ) ( not ( = ?auto_13958 ?auto_13975 ) ) ( not ( = ?auto_13958 ?auto_13981 ) ) ( not ( = ?auto_13958 ?auto_13967 ) ) ( not ( = ?auto_13958 ?auto_13976 ) ) ( not ( = ?auto_13958 ?auto_13963 ) ) ( not ( = ?auto_13966 ?auto_13982 ) ) ( not ( = ?auto_13966 ?auto_13974 ) ) ( not ( = ?auto_13966 ?auto_13961 ) ) ( not ( = ?auto_13966 ?auto_13956 ) ) ( not ( = ?auto_13966 ?auto_13980 ) ) ( not ( = ?auto_13966 ?auto_13971 ) ) ( not ( = ?auto_13968 ?auto_13965 ) ) ( not ( = ?auto_13968 ?auto_13962 ) ) ( not ( = ?auto_13968 ?auto_13959 ) ) ( not ( = ?auto_13968 ?auto_13985 ) ) ( not ( = ?auto_13968 ?auto_13977 ) ) ( not ( = ?auto_13968 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13944 ) ) ( not ( = ?auto_13936 ?auto_13986 ) ) ( not ( = ?auto_13937 ?auto_13944 ) ) ( not ( = ?auto_13937 ?auto_13986 ) ) ( not ( = ?auto_13938 ?auto_13944 ) ) ( not ( = ?auto_13938 ?auto_13986 ) ) ( not ( = ?auto_13939 ?auto_13944 ) ) ( not ( = ?auto_13939 ?auto_13986 ) ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13940 ?auto_13986 ) ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13986 ) ) ( not ( = ?auto_13942 ?auto_13944 ) ) ( not ( = ?auto_13942 ?auto_13986 ) ) ( not ( = ?auto_13944 ?auto_13968 ) ) ( not ( = ?auto_13944 ?auto_13965 ) ) ( not ( = ?auto_13944 ?auto_13962 ) ) ( not ( = ?auto_13944 ?auto_13959 ) ) ( not ( = ?auto_13944 ?auto_13985 ) ) ( not ( = ?auto_13944 ?auto_13977 ) ) ( not ( = ?auto_13944 ?auto_13969 ) ) ( not ( = ?auto_13960 ?auto_13958 ) ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13960 ?auto_13975 ) ) ( not ( = ?auto_13960 ?auto_13981 ) ) ( not ( = ?auto_13960 ?auto_13967 ) ) ( not ( = ?auto_13960 ?auto_13976 ) ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13987 ?auto_13966 ) ) ( not ( = ?auto_13987 ?auto_13982 ) ) ( not ( = ?auto_13987 ?auto_13974 ) ) ( not ( = ?auto_13987 ?auto_13961 ) ) ( not ( = ?auto_13987 ?auto_13956 ) ) ( not ( = ?auto_13987 ?auto_13980 ) ) ( not ( = ?auto_13987 ?auto_13971 ) ) ( not ( = ?auto_13986 ?auto_13968 ) ) ( not ( = ?auto_13986 ?auto_13965 ) ) ( not ( = ?auto_13986 ?auto_13962 ) ) ( not ( = ?auto_13986 ?auto_13959 ) ) ( not ( = ?auto_13986 ?auto_13985 ) ) ( not ( = ?auto_13986 ?auto_13977 ) ) ( not ( = ?auto_13986 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13945 ) ) ( not ( = ?auto_13936 ?auto_13970 ) ) ( not ( = ?auto_13937 ?auto_13945 ) ) ( not ( = ?auto_13937 ?auto_13970 ) ) ( not ( = ?auto_13938 ?auto_13945 ) ) ( not ( = ?auto_13938 ?auto_13970 ) ) ( not ( = ?auto_13939 ?auto_13945 ) ) ( not ( = ?auto_13939 ?auto_13970 ) ) ( not ( = ?auto_13940 ?auto_13945 ) ) ( not ( = ?auto_13940 ?auto_13970 ) ) ( not ( = ?auto_13941 ?auto_13945 ) ) ( not ( = ?auto_13941 ?auto_13970 ) ) ( not ( = ?auto_13942 ?auto_13945 ) ) ( not ( = ?auto_13942 ?auto_13970 ) ) ( not ( = ?auto_13943 ?auto_13945 ) ) ( not ( = ?auto_13943 ?auto_13970 ) ) ( not ( = ?auto_13945 ?auto_13986 ) ) ( not ( = ?auto_13945 ?auto_13968 ) ) ( not ( = ?auto_13945 ?auto_13965 ) ) ( not ( = ?auto_13945 ?auto_13962 ) ) ( not ( = ?auto_13945 ?auto_13959 ) ) ( not ( = ?auto_13945 ?auto_13985 ) ) ( not ( = ?auto_13945 ?auto_13977 ) ) ( not ( = ?auto_13945 ?auto_13969 ) ) ( not ( = ?auto_13954 ?auto_13960 ) ) ( not ( = ?auto_13954 ?auto_13958 ) ) ( not ( = ?auto_13954 ?auto_13964 ) ) ( not ( = ?auto_13954 ?auto_13975 ) ) ( not ( = ?auto_13954 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13967 ) ) ( not ( = ?auto_13954 ?auto_13976 ) ) ( not ( = ?auto_13954 ?auto_13963 ) ) ( not ( = ?auto_13953 ?auto_13987 ) ) ( not ( = ?auto_13953 ?auto_13966 ) ) ( not ( = ?auto_13953 ?auto_13982 ) ) ( not ( = ?auto_13953 ?auto_13974 ) ) ( not ( = ?auto_13953 ?auto_13961 ) ) ( not ( = ?auto_13953 ?auto_13956 ) ) ( not ( = ?auto_13953 ?auto_13980 ) ) ( not ( = ?auto_13953 ?auto_13971 ) ) ( not ( = ?auto_13970 ?auto_13986 ) ) ( not ( = ?auto_13970 ?auto_13968 ) ) ( not ( = ?auto_13970 ?auto_13965 ) ) ( not ( = ?auto_13970 ?auto_13962 ) ) ( not ( = ?auto_13970 ?auto_13959 ) ) ( not ( = ?auto_13970 ?auto_13985 ) ) ( not ( = ?auto_13970 ?auto_13977 ) ) ( not ( = ?auto_13970 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13946 ) ) ( not ( = ?auto_13936 ?auto_13979 ) ) ( not ( = ?auto_13937 ?auto_13946 ) ) ( not ( = ?auto_13937 ?auto_13979 ) ) ( not ( = ?auto_13938 ?auto_13946 ) ) ( not ( = ?auto_13938 ?auto_13979 ) ) ( not ( = ?auto_13939 ?auto_13946 ) ) ( not ( = ?auto_13939 ?auto_13979 ) ) ( not ( = ?auto_13940 ?auto_13946 ) ) ( not ( = ?auto_13940 ?auto_13979 ) ) ( not ( = ?auto_13941 ?auto_13946 ) ) ( not ( = ?auto_13941 ?auto_13979 ) ) ( not ( = ?auto_13942 ?auto_13946 ) ) ( not ( = ?auto_13942 ?auto_13979 ) ) ( not ( = ?auto_13943 ?auto_13946 ) ) ( not ( = ?auto_13943 ?auto_13979 ) ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13944 ?auto_13979 ) ) ( not ( = ?auto_13946 ?auto_13970 ) ) ( not ( = ?auto_13946 ?auto_13986 ) ) ( not ( = ?auto_13946 ?auto_13968 ) ) ( not ( = ?auto_13946 ?auto_13965 ) ) ( not ( = ?auto_13946 ?auto_13962 ) ) ( not ( = ?auto_13946 ?auto_13959 ) ) ( not ( = ?auto_13946 ?auto_13985 ) ) ( not ( = ?auto_13946 ?auto_13977 ) ) ( not ( = ?auto_13946 ?auto_13969 ) ) ( not ( = ?auto_13972 ?auto_13954 ) ) ( not ( = ?auto_13972 ?auto_13960 ) ) ( not ( = ?auto_13972 ?auto_13958 ) ) ( not ( = ?auto_13972 ?auto_13964 ) ) ( not ( = ?auto_13972 ?auto_13975 ) ) ( not ( = ?auto_13972 ?auto_13981 ) ) ( not ( = ?auto_13972 ?auto_13967 ) ) ( not ( = ?auto_13972 ?auto_13976 ) ) ( not ( = ?auto_13972 ?auto_13963 ) ) ( not ( = ?auto_13973 ?auto_13953 ) ) ( not ( = ?auto_13973 ?auto_13987 ) ) ( not ( = ?auto_13973 ?auto_13966 ) ) ( not ( = ?auto_13973 ?auto_13982 ) ) ( not ( = ?auto_13973 ?auto_13974 ) ) ( not ( = ?auto_13973 ?auto_13961 ) ) ( not ( = ?auto_13973 ?auto_13956 ) ) ( not ( = ?auto_13973 ?auto_13980 ) ) ( not ( = ?auto_13973 ?auto_13971 ) ) ( not ( = ?auto_13979 ?auto_13970 ) ) ( not ( = ?auto_13979 ?auto_13986 ) ) ( not ( = ?auto_13979 ?auto_13968 ) ) ( not ( = ?auto_13979 ?auto_13965 ) ) ( not ( = ?auto_13979 ?auto_13962 ) ) ( not ( = ?auto_13979 ?auto_13959 ) ) ( not ( = ?auto_13979 ?auto_13985 ) ) ( not ( = ?auto_13979 ?auto_13977 ) ) ( not ( = ?auto_13979 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13947 ) ) ( not ( = ?auto_13936 ?auto_13978 ) ) ( not ( = ?auto_13937 ?auto_13947 ) ) ( not ( = ?auto_13937 ?auto_13978 ) ) ( not ( = ?auto_13938 ?auto_13947 ) ) ( not ( = ?auto_13938 ?auto_13978 ) ) ( not ( = ?auto_13939 ?auto_13947 ) ) ( not ( = ?auto_13939 ?auto_13978 ) ) ( not ( = ?auto_13940 ?auto_13947 ) ) ( not ( = ?auto_13940 ?auto_13978 ) ) ( not ( = ?auto_13941 ?auto_13947 ) ) ( not ( = ?auto_13941 ?auto_13978 ) ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13942 ?auto_13978 ) ) ( not ( = ?auto_13943 ?auto_13947 ) ) ( not ( = ?auto_13943 ?auto_13978 ) ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13944 ?auto_13978 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13978 ) ) ( not ( = ?auto_13947 ?auto_13979 ) ) ( not ( = ?auto_13947 ?auto_13970 ) ) ( not ( = ?auto_13947 ?auto_13986 ) ) ( not ( = ?auto_13947 ?auto_13968 ) ) ( not ( = ?auto_13947 ?auto_13965 ) ) ( not ( = ?auto_13947 ?auto_13962 ) ) ( not ( = ?auto_13947 ?auto_13959 ) ) ( not ( = ?auto_13947 ?auto_13985 ) ) ( not ( = ?auto_13947 ?auto_13977 ) ) ( not ( = ?auto_13947 ?auto_13969 ) ) ( not ( = ?auto_13983 ?auto_13972 ) ) ( not ( = ?auto_13983 ?auto_13954 ) ) ( not ( = ?auto_13983 ?auto_13960 ) ) ( not ( = ?auto_13983 ?auto_13958 ) ) ( not ( = ?auto_13983 ?auto_13964 ) ) ( not ( = ?auto_13983 ?auto_13975 ) ) ( not ( = ?auto_13983 ?auto_13981 ) ) ( not ( = ?auto_13983 ?auto_13967 ) ) ( not ( = ?auto_13983 ?auto_13976 ) ) ( not ( = ?auto_13983 ?auto_13963 ) ) ( not ( = ?auto_13984 ?auto_13973 ) ) ( not ( = ?auto_13984 ?auto_13953 ) ) ( not ( = ?auto_13984 ?auto_13987 ) ) ( not ( = ?auto_13984 ?auto_13966 ) ) ( not ( = ?auto_13984 ?auto_13982 ) ) ( not ( = ?auto_13984 ?auto_13974 ) ) ( not ( = ?auto_13984 ?auto_13961 ) ) ( not ( = ?auto_13984 ?auto_13956 ) ) ( not ( = ?auto_13984 ?auto_13980 ) ) ( not ( = ?auto_13984 ?auto_13971 ) ) ( not ( = ?auto_13978 ?auto_13979 ) ) ( not ( = ?auto_13978 ?auto_13970 ) ) ( not ( = ?auto_13978 ?auto_13986 ) ) ( not ( = ?auto_13978 ?auto_13968 ) ) ( not ( = ?auto_13978 ?auto_13965 ) ) ( not ( = ?auto_13978 ?auto_13962 ) ) ( not ( = ?auto_13978 ?auto_13959 ) ) ( not ( = ?auto_13978 ?auto_13985 ) ) ( not ( = ?auto_13978 ?auto_13977 ) ) ( not ( = ?auto_13978 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13948 ) ) ( not ( = ?auto_13936 ?auto_13957 ) ) ( not ( = ?auto_13937 ?auto_13948 ) ) ( not ( = ?auto_13937 ?auto_13957 ) ) ( not ( = ?auto_13938 ?auto_13948 ) ) ( not ( = ?auto_13938 ?auto_13957 ) ) ( not ( = ?auto_13939 ?auto_13948 ) ) ( not ( = ?auto_13939 ?auto_13957 ) ) ( not ( = ?auto_13940 ?auto_13948 ) ) ( not ( = ?auto_13940 ?auto_13957 ) ) ( not ( = ?auto_13941 ?auto_13948 ) ) ( not ( = ?auto_13941 ?auto_13957 ) ) ( not ( = ?auto_13942 ?auto_13948 ) ) ( not ( = ?auto_13942 ?auto_13957 ) ) ( not ( = ?auto_13943 ?auto_13948 ) ) ( not ( = ?auto_13943 ?auto_13957 ) ) ( not ( = ?auto_13944 ?auto_13948 ) ) ( not ( = ?auto_13944 ?auto_13957 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13945 ?auto_13957 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13957 ) ) ( not ( = ?auto_13948 ?auto_13978 ) ) ( not ( = ?auto_13948 ?auto_13979 ) ) ( not ( = ?auto_13948 ?auto_13970 ) ) ( not ( = ?auto_13948 ?auto_13986 ) ) ( not ( = ?auto_13948 ?auto_13968 ) ) ( not ( = ?auto_13948 ?auto_13965 ) ) ( not ( = ?auto_13948 ?auto_13962 ) ) ( not ( = ?auto_13948 ?auto_13959 ) ) ( not ( = ?auto_13948 ?auto_13985 ) ) ( not ( = ?auto_13948 ?auto_13977 ) ) ( not ( = ?auto_13948 ?auto_13969 ) ) ( not ( = ?auto_13957 ?auto_13978 ) ) ( not ( = ?auto_13957 ?auto_13979 ) ) ( not ( = ?auto_13957 ?auto_13970 ) ) ( not ( = ?auto_13957 ?auto_13986 ) ) ( not ( = ?auto_13957 ?auto_13968 ) ) ( not ( = ?auto_13957 ?auto_13965 ) ) ( not ( = ?auto_13957 ?auto_13962 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13985 ) ) ( not ( = ?auto_13957 ?auto_13977 ) ) ( not ( = ?auto_13957 ?auto_13969 ) ) ( not ( = ?auto_13936 ?auto_13949 ) ) ( not ( = ?auto_13936 ?auto_13955 ) ) ( not ( = ?auto_13937 ?auto_13949 ) ) ( not ( = ?auto_13937 ?auto_13955 ) ) ( not ( = ?auto_13938 ?auto_13949 ) ) ( not ( = ?auto_13938 ?auto_13955 ) ) ( not ( = ?auto_13939 ?auto_13949 ) ) ( not ( = ?auto_13939 ?auto_13955 ) ) ( not ( = ?auto_13940 ?auto_13949 ) ) ( not ( = ?auto_13940 ?auto_13955 ) ) ( not ( = ?auto_13941 ?auto_13949 ) ) ( not ( = ?auto_13941 ?auto_13955 ) ) ( not ( = ?auto_13942 ?auto_13949 ) ) ( not ( = ?auto_13942 ?auto_13955 ) ) ( not ( = ?auto_13943 ?auto_13949 ) ) ( not ( = ?auto_13943 ?auto_13955 ) ) ( not ( = ?auto_13944 ?auto_13949 ) ) ( not ( = ?auto_13944 ?auto_13955 ) ) ( not ( = ?auto_13945 ?auto_13949 ) ) ( not ( = ?auto_13945 ?auto_13955 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13955 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13955 ) ) ( not ( = ?auto_13949 ?auto_13957 ) ) ( not ( = ?auto_13949 ?auto_13978 ) ) ( not ( = ?auto_13949 ?auto_13979 ) ) ( not ( = ?auto_13949 ?auto_13970 ) ) ( not ( = ?auto_13949 ?auto_13986 ) ) ( not ( = ?auto_13949 ?auto_13968 ) ) ( not ( = ?auto_13949 ?auto_13965 ) ) ( not ( = ?auto_13949 ?auto_13962 ) ) ( not ( = ?auto_13949 ?auto_13959 ) ) ( not ( = ?auto_13949 ?auto_13985 ) ) ( not ( = ?auto_13949 ?auto_13977 ) ) ( not ( = ?auto_13949 ?auto_13969 ) ) ( not ( = ?auto_13955 ?auto_13957 ) ) ( not ( = ?auto_13955 ?auto_13978 ) ) ( not ( = ?auto_13955 ?auto_13979 ) ) ( not ( = ?auto_13955 ?auto_13970 ) ) ( not ( = ?auto_13955 ?auto_13986 ) ) ( not ( = ?auto_13955 ?auto_13968 ) ) ( not ( = ?auto_13955 ?auto_13965 ) ) ( not ( = ?auto_13955 ?auto_13962 ) ) ( not ( = ?auto_13955 ?auto_13959 ) ) ( not ( = ?auto_13955 ?auto_13985 ) ) ( not ( = ?auto_13955 ?auto_13977 ) ) ( not ( = ?auto_13955 ?auto_13969 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ?auto_13944 ?auto_13945 ?auto_13946 ?auto_13947 ?auto_13948 )
      ( MAKE-1CRATE ?auto_13948 ?auto_13949 )
      ( MAKE-13CRATE-VERIFY ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ?auto_13944 ?auto_13945 ?auto_13946 ?auto_13947 ?auto_13948 ?auto_13949 ) )
  )

)

