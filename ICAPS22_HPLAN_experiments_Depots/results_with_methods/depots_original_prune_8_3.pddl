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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
    )
    :vars
    (
      ?auto_14355 - HOIST
      ?auto_14356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14355 ?auto_14356 ) ( SURFACE-AT ?auto_14354 ?auto_14356 ) ( CLEAR ?auto_14354 ) ( LIFTING ?auto_14355 ?auto_14353 ) ( IS-CRATE ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14354 ) ) )
    :subtasks
    ( ( !DROP ?auto_14355 ?auto_14353 ?auto_14354 ?auto_14356 )
      ( MAKE-ON-VERIFY ?auto_14353 ?auto_14354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14357 - SURFACE
      ?auto_14358 - SURFACE
    )
    :vars
    (
      ?auto_14359 - HOIST
      ?auto_14360 - PLACE
      ?auto_14361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14359 ?auto_14360 ) ( SURFACE-AT ?auto_14358 ?auto_14360 ) ( CLEAR ?auto_14358 ) ( IS-CRATE ?auto_14357 ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( TRUCK-AT ?auto_14361 ?auto_14360 ) ( AVAILABLE ?auto_14359 ) ( IN ?auto_14357 ?auto_14361 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14359 ?auto_14357 ?auto_14361 ?auto_14360 )
      ( MAKE-ON ?auto_14357 ?auto_14358 )
      ( MAKE-ON-VERIFY ?auto_14357 ?auto_14358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14362 - SURFACE
      ?auto_14363 - SURFACE
    )
    :vars
    (
      ?auto_14366 - HOIST
      ?auto_14364 - PLACE
      ?auto_14365 - TRUCK
      ?auto_14367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14366 ?auto_14364 ) ( SURFACE-AT ?auto_14363 ?auto_14364 ) ( CLEAR ?auto_14363 ) ( IS-CRATE ?auto_14362 ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( AVAILABLE ?auto_14366 ) ( IN ?auto_14362 ?auto_14365 ) ( TRUCK-AT ?auto_14365 ?auto_14367 ) ( not ( = ?auto_14367 ?auto_14364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14365 ?auto_14367 ?auto_14364 )
      ( MAKE-ON ?auto_14362 ?auto_14363 )
      ( MAKE-ON-VERIFY ?auto_14362 ?auto_14363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14368 - SURFACE
      ?auto_14369 - SURFACE
    )
    :vars
    (
      ?auto_14370 - HOIST
      ?auto_14372 - PLACE
      ?auto_14373 - TRUCK
      ?auto_14371 - PLACE
      ?auto_14374 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14370 ?auto_14372 ) ( SURFACE-AT ?auto_14369 ?auto_14372 ) ( CLEAR ?auto_14369 ) ( IS-CRATE ?auto_14368 ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( AVAILABLE ?auto_14370 ) ( TRUCK-AT ?auto_14373 ?auto_14371 ) ( not ( = ?auto_14371 ?auto_14372 ) ) ( HOIST-AT ?auto_14374 ?auto_14371 ) ( LIFTING ?auto_14374 ?auto_14368 ) ( not ( = ?auto_14370 ?auto_14374 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14374 ?auto_14368 ?auto_14373 ?auto_14371 )
      ( MAKE-ON ?auto_14368 ?auto_14369 )
      ( MAKE-ON-VERIFY ?auto_14368 ?auto_14369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14375 - SURFACE
      ?auto_14376 - SURFACE
    )
    :vars
    (
      ?auto_14380 - HOIST
      ?auto_14378 - PLACE
      ?auto_14379 - TRUCK
      ?auto_14381 - PLACE
      ?auto_14377 - HOIST
      ?auto_14382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14380 ?auto_14378 ) ( SURFACE-AT ?auto_14376 ?auto_14378 ) ( CLEAR ?auto_14376 ) ( IS-CRATE ?auto_14375 ) ( not ( = ?auto_14375 ?auto_14376 ) ) ( AVAILABLE ?auto_14380 ) ( TRUCK-AT ?auto_14379 ?auto_14381 ) ( not ( = ?auto_14381 ?auto_14378 ) ) ( HOIST-AT ?auto_14377 ?auto_14381 ) ( not ( = ?auto_14380 ?auto_14377 ) ) ( AVAILABLE ?auto_14377 ) ( SURFACE-AT ?auto_14375 ?auto_14381 ) ( ON ?auto_14375 ?auto_14382 ) ( CLEAR ?auto_14375 ) ( not ( = ?auto_14375 ?auto_14382 ) ) ( not ( = ?auto_14376 ?auto_14382 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14377 ?auto_14375 ?auto_14382 ?auto_14381 )
      ( MAKE-ON ?auto_14375 ?auto_14376 )
      ( MAKE-ON-VERIFY ?auto_14375 ?auto_14376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14383 - SURFACE
      ?auto_14384 - SURFACE
    )
    :vars
    (
      ?auto_14387 - HOIST
      ?auto_14386 - PLACE
      ?auto_14388 - PLACE
      ?auto_14390 - HOIST
      ?auto_14389 - SURFACE
      ?auto_14385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14387 ?auto_14386 ) ( SURFACE-AT ?auto_14384 ?auto_14386 ) ( CLEAR ?auto_14384 ) ( IS-CRATE ?auto_14383 ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( AVAILABLE ?auto_14387 ) ( not ( = ?auto_14388 ?auto_14386 ) ) ( HOIST-AT ?auto_14390 ?auto_14388 ) ( not ( = ?auto_14387 ?auto_14390 ) ) ( AVAILABLE ?auto_14390 ) ( SURFACE-AT ?auto_14383 ?auto_14388 ) ( ON ?auto_14383 ?auto_14389 ) ( CLEAR ?auto_14383 ) ( not ( = ?auto_14383 ?auto_14389 ) ) ( not ( = ?auto_14384 ?auto_14389 ) ) ( TRUCK-AT ?auto_14385 ?auto_14386 ) )
    :subtasks
    ( ( !DRIVE ?auto_14385 ?auto_14386 ?auto_14388 )
      ( MAKE-ON ?auto_14383 ?auto_14384 )
      ( MAKE-ON-VERIFY ?auto_14383 ?auto_14384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14431 - SURFACE
      ?auto_14432 - SURFACE
    )
    :vars
    (
      ?auto_14437 - HOIST
      ?auto_14435 - PLACE
      ?auto_14436 - PLACE
      ?auto_14434 - HOIST
      ?auto_14438 - SURFACE
      ?auto_14433 - TRUCK
      ?auto_14439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14437 ?auto_14435 ) ( IS-CRATE ?auto_14431 ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14436 ?auto_14435 ) ) ( HOIST-AT ?auto_14434 ?auto_14436 ) ( not ( = ?auto_14437 ?auto_14434 ) ) ( AVAILABLE ?auto_14434 ) ( SURFACE-AT ?auto_14431 ?auto_14436 ) ( ON ?auto_14431 ?auto_14438 ) ( CLEAR ?auto_14431 ) ( not ( = ?auto_14431 ?auto_14438 ) ) ( not ( = ?auto_14432 ?auto_14438 ) ) ( TRUCK-AT ?auto_14433 ?auto_14435 ) ( SURFACE-AT ?auto_14439 ?auto_14435 ) ( CLEAR ?auto_14439 ) ( LIFTING ?auto_14437 ?auto_14432 ) ( IS-CRATE ?auto_14432 ) ( not ( = ?auto_14431 ?auto_14439 ) ) ( not ( = ?auto_14432 ?auto_14439 ) ) ( not ( = ?auto_14438 ?auto_14439 ) ) )
    :subtasks
    ( ( !DROP ?auto_14437 ?auto_14432 ?auto_14439 ?auto_14435 )
      ( MAKE-ON ?auto_14431 ?auto_14432 )
      ( MAKE-ON-VERIFY ?auto_14431 ?auto_14432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14440 - SURFACE
      ?auto_14441 - SURFACE
    )
    :vars
    (
      ?auto_14442 - HOIST
      ?auto_14447 - PLACE
      ?auto_14446 - PLACE
      ?auto_14443 - HOIST
      ?auto_14445 - SURFACE
      ?auto_14444 - TRUCK
      ?auto_14448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14442 ?auto_14447 ) ( IS-CRATE ?auto_14440 ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14446 ?auto_14447 ) ) ( HOIST-AT ?auto_14443 ?auto_14446 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( AVAILABLE ?auto_14443 ) ( SURFACE-AT ?auto_14440 ?auto_14446 ) ( ON ?auto_14440 ?auto_14445 ) ( CLEAR ?auto_14440 ) ( not ( = ?auto_14440 ?auto_14445 ) ) ( not ( = ?auto_14441 ?auto_14445 ) ) ( TRUCK-AT ?auto_14444 ?auto_14447 ) ( SURFACE-AT ?auto_14448 ?auto_14447 ) ( CLEAR ?auto_14448 ) ( IS-CRATE ?auto_14441 ) ( not ( = ?auto_14440 ?auto_14448 ) ) ( not ( = ?auto_14441 ?auto_14448 ) ) ( not ( = ?auto_14445 ?auto_14448 ) ) ( AVAILABLE ?auto_14442 ) ( IN ?auto_14441 ?auto_14444 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14442 ?auto_14441 ?auto_14444 ?auto_14447 )
      ( MAKE-ON ?auto_14440 ?auto_14441 )
      ( MAKE-ON-VERIFY ?auto_14440 ?auto_14441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14455 - SURFACE
      ?auto_14456 - SURFACE
    )
    :vars
    (
      ?auto_14460 - HOIST
      ?auto_14461 - PLACE
      ?auto_14462 - PLACE
      ?auto_14457 - HOIST
      ?auto_14459 - SURFACE
      ?auto_14458 - TRUCK
      ?auto_14463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14460 ?auto_14461 ) ( SURFACE-AT ?auto_14456 ?auto_14461 ) ( CLEAR ?auto_14456 ) ( IS-CRATE ?auto_14455 ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( AVAILABLE ?auto_14460 ) ( not ( = ?auto_14462 ?auto_14461 ) ) ( HOIST-AT ?auto_14457 ?auto_14462 ) ( not ( = ?auto_14460 ?auto_14457 ) ) ( AVAILABLE ?auto_14457 ) ( SURFACE-AT ?auto_14455 ?auto_14462 ) ( ON ?auto_14455 ?auto_14459 ) ( CLEAR ?auto_14455 ) ( not ( = ?auto_14455 ?auto_14459 ) ) ( not ( = ?auto_14456 ?auto_14459 ) ) ( TRUCK-AT ?auto_14458 ?auto_14463 ) ( not ( = ?auto_14463 ?auto_14461 ) ) ( not ( = ?auto_14462 ?auto_14463 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14458 ?auto_14463 ?auto_14461 )
      ( MAKE-ON ?auto_14455 ?auto_14456 )
      ( MAKE-ON-VERIFY ?auto_14455 ?auto_14456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14543 - SURFACE
      ?auto_14544 - SURFACE
    )
    :vars
    (
      ?auto_14548 - HOIST
      ?auto_14547 - PLACE
      ?auto_14545 - TRUCK
      ?auto_14546 - PLACE
      ?auto_14550 - HOIST
      ?auto_14549 - SURFACE
      ?auto_14551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14548 ?auto_14547 ) ( SURFACE-AT ?auto_14544 ?auto_14547 ) ( CLEAR ?auto_14544 ) ( IS-CRATE ?auto_14543 ) ( not ( = ?auto_14543 ?auto_14544 ) ) ( AVAILABLE ?auto_14548 ) ( TRUCK-AT ?auto_14545 ?auto_14546 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( HOIST-AT ?auto_14550 ?auto_14546 ) ( not ( = ?auto_14548 ?auto_14550 ) ) ( SURFACE-AT ?auto_14543 ?auto_14546 ) ( ON ?auto_14543 ?auto_14549 ) ( CLEAR ?auto_14543 ) ( not ( = ?auto_14543 ?auto_14549 ) ) ( not ( = ?auto_14544 ?auto_14549 ) ) ( LIFTING ?auto_14550 ?auto_14551 ) ( IS-CRATE ?auto_14551 ) ( not ( = ?auto_14543 ?auto_14551 ) ) ( not ( = ?auto_14544 ?auto_14551 ) ) ( not ( = ?auto_14549 ?auto_14551 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14550 ?auto_14551 ?auto_14545 ?auto_14546 )
      ( MAKE-ON ?auto_14543 ?auto_14544 )
      ( MAKE-ON-VERIFY ?auto_14543 ?auto_14544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14647 - SURFACE
      ?auto_14648 - SURFACE
    )
    :vars
    (
      ?auto_14649 - HOIST
      ?auto_14653 - PLACE
      ?auto_14651 - PLACE
      ?auto_14654 - HOIST
      ?auto_14650 - SURFACE
      ?auto_14652 - TRUCK
      ?auto_14655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14649 ?auto_14653 ) ( SURFACE-AT ?auto_14648 ?auto_14653 ) ( CLEAR ?auto_14648 ) ( IS-CRATE ?auto_14647 ) ( not ( = ?auto_14647 ?auto_14648 ) ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( HOIST-AT ?auto_14654 ?auto_14651 ) ( not ( = ?auto_14649 ?auto_14654 ) ) ( AVAILABLE ?auto_14654 ) ( SURFACE-AT ?auto_14647 ?auto_14651 ) ( ON ?auto_14647 ?auto_14650 ) ( CLEAR ?auto_14647 ) ( not ( = ?auto_14647 ?auto_14650 ) ) ( not ( = ?auto_14648 ?auto_14650 ) ) ( TRUCK-AT ?auto_14652 ?auto_14653 ) ( LIFTING ?auto_14649 ?auto_14655 ) ( IS-CRATE ?auto_14655 ) ( not ( = ?auto_14647 ?auto_14655 ) ) ( not ( = ?auto_14648 ?auto_14655 ) ) ( not ( = ?auto_14650 ?auto_14655 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14649 ?auto_14655 ?auto_14652 ?auto_14653 )
      ( MAKE-ON ?auto_14647 ?auto_14648 )
      ( MAKE-ON-VERIFY ?auto_14647 ?auto_14648 ) )
  )

)

