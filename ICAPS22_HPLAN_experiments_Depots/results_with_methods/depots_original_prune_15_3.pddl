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
      ?auto_67371 - SURFACE
      ?auto_67372 - SURFACE
    )
    :vars
    (
      ?auto_67373 - HOIST
      ?auto_67374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67373 ?auto_67374 ) ( SURFACE-AT ?auto_67372 ?auto_67374 ) ( CLEAR ?auto_67372 ) ( LIFTING ?auto_67373 ?auto_67371 ) ( IS-CRATE ?auto_67371 ) ( not ( = ?auto_67371 ?auto_67372 ) ) )
    :subtasks
    ( ( !DROP ?auto_67373 ?auto_67371 ?auto_67372 ?auto_67374 )
      ( MAKE-ON-VERIFY ?auto_67371 ?auto_67372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67375 - SURFACE
      ?auto_67376 - SURFACE
    )
    :vars
    (
      ?auto_67377 - HOIST
      ?auto_67378 - PLACE
      ?auto_67379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67377 ?auto_67378 ) ( SURFACE-AT ?auto_67376 ?auto_67378 ) ( CLEAR ?auto_67376 ) ( IS-CRATE ?auto_67375 ) ( not ( = ?auto_67375 ?auto_67376 ) ) ( TRUCK-AT ?auto_67379 ?auto_67378 ) ( AVAILABLE ?auto_67377 ) ( IN ?auto_67375 ?auto_67379 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67377 ?auto_67375 ?auto_67379 ?auto_67378 )
      ( MAKE-ON ?auto_67375 ?auto_67376 )
      ( MAKE-ON-VERIFY ?auto_67375 ?auto_67376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67380 - SURFACE
      ?auto_67381 - SURFACE
    )
    :vars
    (
      ?auto_67384 - HOIST
      ?auto_67383 - PLACE
      ?auto_67382 - TRUCK
      ?auto_67385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67384 ?auto_67383 ) ( SURFACE-AT ?auto_67381 ?auto_67383 ) ( CLEAR ?auto_67381 ) ( IS-CRATE ?auto_67380 ) ( not ( = ?auto_67380 ?auto_67381 ) ) ( AVAILABLE ?auto_67384 ) ( IN ?auto_67380 ?auto_67382 ) ( TRUCK-AT ?auto_67382 ?auto_67385 ) ( not ( = ?auto_67385 ?auto_67383 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67382 ?auto_67385 ?auto_67383 )
      ( MAKE-ON ?auto_67380 ?auto_67381 )
      ( MAKE-ON-VERIFY ?auto_67380 ?auto_67381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67386 - SURFACE
      ?auto_67387 - SURFACE
    )
    :vars
    (
      ?auto_67390 - HOIST
      ?auto_67391 - PLACE
      ?auto_67388 - TRUCK
      ?auto_67389 - PLACE
      ?auto_67392 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67390 ?auto_67391 ) ( SURFACE-AT ?auto_67387 ?auto_67391 ) ( CLEAR ?auto_67387 ) ( IS-CRATE ?auto_67386 ) ( not ( = ?auto_67386 ?auto_67387 ) ) ( AVAILABLE ?auto_67390 ) ( TRUCK-AT ?auto_67388 ?auto_67389 ) ( not ( = ?auto_67389 ?auto_67391 ) ) ( HOIST-AT ?auto_67392 ?auto_67389 ) ( LIFTING ?auto_67392 ?auto_67386 ) ( not ( = ?auto_67390 ?auto_67392 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67392 ?auto_67386 ?auto_67388 ?auto_67389 )
      ( MAKE-ON ?auto_67386 ?auto_67387 )
      ( MAKE-ON-VERIFY ?auto_67386 ?auto_67387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67393 - SURFACE
      ?auto_67394 - SURFACE
    )
    :vars
    (
      ?auto_67397 - HOIST
      ?auto_67395 - PLACE
      ?auto_67396 - TRUCK
      ?auto_67398 - PLACE
      ?auto_67399 - HOIST
      ?auto_67400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67397 ?auto_67395 ) ( SURFACE-AT ?auto_67394 ?auto_67395 ) ( CLEAR ?auto_67394 ) ( IS-CRATE ?auto_67393 ) ( not ( = ?auto_67393 ?auto_67394 ) ) ( AVAILABLE ?auto_67397 ) ( TRUCK-AT ?auto_67396 ?auto_67398 ) ( not ( = ?auto_67398 ?auto_67395 ) ) ( HOIST-AT ?auto_67399 ?auto_67398 ) ( not ( = ?auto_67397 ?auto_67399 ) ) ( AVAILABLE ?auto_67399 ) ( SURFACE-AT ?auto_67393 ?auto_67398 ) ( ON ?auto_67393 ?auto_67400 ) ( CLEAR ?auto_67393 ) ( not ( = ?auto_67393 ?auto_67400 ) ) ( not ( = ?auto_67394 ?auto_67400 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67399 ?auto_67393 ?auto_67400 ?auto_67398 )
      ( MAKE-ON ?auto_67393 ?auto_67394 )
      ( MAKE-ON-VERIFY ?auto_67393 ?auto_67394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67401 - SURFACE
      ?auto_67402 - SURFACE
    )
    :vars
    (
      ?auto_67404 - HOIST
      ?auto_67403 - PLACE
      ?auto_67406 - PLACE
      ?auto_67407 - HOIST
      ?auto_67408 - SURFACE
      ?auto_67405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67404 ?auto_67403 ) ( SURFACE-AT ?auto_67402 ?auto_67403 ) ( CLEAR ?auto_67402 ) ( IS-CRATE ?auto_67401 ) ( not ( = ?auto_67401 ?auto_67402 ) ) ( AVAILABLE ?auto_67404 ) ( not ( = ?auto_67406 ?auto_67403 ) ) ( HOIST-AT ?auto_67407 ?auto_67406 ) ( not ( = ?auto_67404 ?auto_67407 ) ) ( AVAILABLE ?auto_67407 ) ( SURFACE-AT ?auto_67401 ?auto_67406 ) ( ON ?auto_67401 ?auto_67408 ) ( CLEAR ?auto_67401 ) ( not ( = ?auto_67401 ?auto_67408 ) ) ( not ( = ?auto_67402 ?auto_67408 ) ) ( TRUCK-AT ?auto_67405 ?auto_67403 ) )
    :subtasks
    ( ( !DRIVE ?auto_67405 ?auto_67403 ?auto_67406 )
      ( MAKE-ON ?auto_67401 ?auto_67402 )
      ( MAKE-ON-VERIFY ?auto_67401 ?auto_67402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67449 - SURFACE
      ?auto_67450 - SURFACE
    )
    :vars
    (
      ?auto_67453 - HOIST
      ?auto_67456 - PLACE
      ?auto_67451 - PLACE
      ?auto_67455 - HOIST
      ?auto_67454 - SURFACE
      ?auto_67452 - TRUCK
      ?auto_67457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67453 ?auto_67456 ) ( IS-CRATE ?auto_67449 ) ( not ( = ?auto_67449 ?auto_67450 ) ) ( not ( = ?auto_67451 ?auto_67456 ) ) ( HOIST-AT ?auto_67455 ?auto_67451 ) ( not ( = ?auto_67453 ?auto_67455 ) ) ( AVAILABLE ?auto_67455 ) ( SURFACE-AT ?auto_67449 ?auto_67451 ) ( ON ?auto_67449 ?auto_67454 ) ( CLEAR ?auto_67449 ) ( not ( = ?auto_67449 ?auto_67454 ) ) ( not ( = ?auto_67450 ?auto_67454 ) ) ( TRUCK-AT ?auto_67452 ?auto_67456 ) ( SURFACE-AT ?auto_67457 ?auto_67456 ) ( CLEAR ?auto_67457 ) ( LIFTING ?auto_67453 ?auto_67450 ) ( IS-CRATE ?auto_67450 ) ( not ( = ?auto_67449 ?auto_67457 ) ) ( not ( = ?auto_67450 ?auto_67457 ) ) ( not ( = ?auto_67454 ?auto_67457 ) ) )
    :subtasks
    ( ( !DROP ?auto_67453 ?auto_67450 ?auto_67457 ?auto_67456 )
      ( MAKE-ON ?auto_67449 ?auto_67450 )
      ( MAKE-ON-VERIFY ?auto_67449 ?auto_67450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67458 - SURFACE
      ?auto_67459 - SURFACE
    )
    :vars
    (
      ?auto_67460 - HOIST
      ?auto_67465 - PLACE
      ?auto_67466 - PLACE
      ?auto_67462 - HOIST
      ?auto_67463 - SURFACE
      ?auto_67461 - TRUCK
      ?auto_67464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67460 ?auto_67465 ) ( IS-CRATE ?auto_67458 ) ( not ( = ?auto_67458 ?auto_67459 ) ) ( not ( = ?auto_67466 ?auto_67465 ) ) ( HOIST-AT ?auto_67462 ?auto_67466 ) ( not ( = ?auto_67460 ?auto_67462 ) ) ( AVAILABLE ?auto_67462 ) ( SURFACE-AT ?auto_67458 ?auto_67466 ) ( ON ?auto_67458 ?auto_67463 ) ( CLEAR ?auto_67458 ) ( not ( = ?auto_67458 ?auto_67463 ) ) ( not ( = ?auto_67459 ?auto_67463 ) ) ( TRUCK-AT ?auto_67461 ?auto_67465 ) ( SURFACE-AT ?auto_67464 ?auto_67465 ) ( CLEAR ?auto_67464 ) ( IS-CRATE ?auto_67459 ) ( not ( = ?auto_67458 ?auto_67464 ) ) ( not ( = ?auto_67459 ?auto_67464 ) ) ( not ( = ?auto_67463 ?auto_67464 ) ) ( AVAILABLE ?auto_67460 ) ( IN ?auto_67459 ?auto_67461 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67460 ?auto_67459 ?auto_67461 ?auto_67465 )
      ( MAKE-ON ?auto_67458 ?auto_67459 )
      ( MAKE-ON-VERIFY ?auto_67458 ?auto_67459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67473 - SURFACE
      ?auto_67474 - SURFACE
    )
    :vars
    (
      ?auto_67478 - HOIST
      ?auto_67480 - PLACE
      ?auto_67475 - PLACE
      ?auto_67479 - HOIST
      ?auto_67476 - SURFACE
      ?auto_67477 - TRUCK
      ?auto_67481 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67478 ?auto_67480 ) ( SURFACE-AT ?auto_67474 ?auto_67480 ) ( CLEAR ?auto_67474 ) ( IS-CRATE ?auto_67473 ) ( not ( = ?auto_67473 ?auto_67474 ) ) ( AVAILABLE ?auto_67478 ) ( not ( = ?auto_67475 ?auto_67480 ) ) ( HOIST-AT ?auto_67479 ?auto_67475 ) ( not ( = ?auto_67478 ?auto_67479 ) ) ( AVAILABLE ?auto_67479 ) ( SURFACE-AT ?auto_67473 ?auto_67475 ) ( ON ?auto_67473 ?auto_67476 ) ( CLEAR ?auto_67473 ) ( not ( = ?auto_67473 ?auto_67476 ) ) ( not ( = ?auto_67474 ?auto_67476 ) ) ( TRUCK-AT ?auto_67477 ?auto_67481 ) ( not ( = ?auto_67481 ?auto_67480 ) ) ( not ( = ?auto_67475 ?auto_67481 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67477 ?auto_67481 ?auto_67480 )
      ( MAKE-ON ?auto_67473 ?auto_67474 )
      ( MAKE-ON-VERIFY ?auto_67473 ?auto_67474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67743 - SURFACE
      ?auto_67744 - SURFACE
    )
    :vars
    (
      ?auto_67749 - HOIST
      ?auto_67748 - PLACE
      ?auto_67745 - TRUCK
      ?auto_67746 - PLACE
      ?auto_67750 - HOIST
      ?auto_67747 - SURFACE
      ?auto_67751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67749 ?auto_67748 ) ( SURFACE-AT ?auto_67744 ?auto_67748 ) ( CLEAR ?auto_67744 ) ( IS-CRATE ?auto_67743 ) ( not ( = ?auto_67743 ?auto_67744 ) ) ( AVAILABLE ?auto_67749 ) ( TRUCK-AT ?auto_67745 ?auto_67746 ) ( not ( = ?auto_67746 ?auto_67748 ) ) ( HOIST-AT ?auto_67750 ?auto_67746 ) ( not ( = ?auto_67749 ?auto_67750 ) ) ( SURFACE-AT ?auto_67743 ?auto_67746 ) ( ON ?auto_67743 ?auto_67747 ) ( CLEAR ?auto_67743 ) ( not ( = ?auto_67743 ?auto_67747 ) ) ( not ( = ?auto_67744 ?auto_67747 ) ) ( LIFTING ?auto_67750 ?auto_67751 ) ( IS-CRATE ?auto_67751 ) ( not ( = ?auto_67743 ?auto_67751 ) ) ( not ( = ?auto_67744 ?auto_67751 ) ) ( not ( = ?auto_67747 ?auto_67751 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67750 ?auto_67751 ?auto_67745 ?auto_67746 )
      ( MAKE-ON ?auto_67743 ?auto_67744 )
      ( MAKE-ON-VERIFY ?auto_67743 ?auto_67744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67871 - SURFACE
      ?auto_67872 - SURFACE
    )
    :vars
    (
      ?auto_67873 - HOIST
      ?auto_67874 - PLACE
      ?auto_67876 - PLACE
      ?auto_67875 - HOIST
      ?auto_67878 - SURFACE
      ?auto_67877 - TRUCK
      ?auto_67879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67873 ?auto_67874 ) ( SURFACE-AT ?auto_67872 ?auto_67874 ) ( CLEAR ?auto_67872 ) ( IS-CRATE ?auto_67871 ) ( not ( = ?auto_67871 ?auto_67872 ) ) ( not ( = ?auto_67876 ?auto_67874 ) ) ( HOIST-AT ?auto_67875 ?auto_67876 ) ( not ( = ?auto_67873 ?auto_67875 ) ) ( AVAILABLE ?auto_67875 ) ( SURFACE-AT ?auto_67871 ?auto_67876 ) ( ON ?auto_67871 ?auto_67878 ) ( CLEAR ?auto_67871 ) ( not ( = ?auto_67871 ?auto_67878 ) ) ( not ( = ?auto_67872 ?auto_67878 ) ) ( TRUCK-AT ?auto_67877 ?auto_67874 ) ( LIFTING ?auto_67873 ?auto_67879 ) ( IS-CRATE ?auto_67879 ) ( not ( = ?auto_67871 ?auto_67879 ) ) ( not ( = ?auto_67872 ?auto_67879 ) ) ( not ( = ?auto_67878 ?auto_67879 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67873 ?auto_67879 ?auto_67877 ?auto_67874 )
      ( MAKE-ON ?auto_67871 ?auto_67872 )
      ( MAKE-ON-VERIFY ?auto_67871 ?auto_67872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68408 - SURFACE
      ?auto_68409 - SURFACE
    )
    :vars
    (
      ?auto_68414 - HOIST
      ?auto_68411 - PLACE
      ?auto_68413 - PLACE
      ?auto_68416 - HOIST
      ?auto_68415 - SURFACE
      ?auto_68412 - SURFACE
      ?auto_68410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_68414 ?auto_68411 ) ( IS-CRATE ?auto_68408 ) ( not ( = ?auto_68408 ?auto_68409 ) ) ( not ( = ?auto_68413 ?auto_68411 ) ) ( HOIST-AT ?auto_68416 ?auto_68413 ) ( not ( = ?auto_68414 ?auto_68416 ) ) ( AVAILABLE ?auto_68416 ) ( SURFACE-AT ?auto_68408 ?auto_68413 ) ( ON ?auto_68408 ?auto_68415 ) ( CLEAR ?auto_68408 ) ( not ( = ?auto_68408 ?auto_68415 ) ) ( not ( = ?auto_68409 ?auto_68415 ) ) ( SURFACE-AT ?auto_68412 ?auto_68411 ) ( CLEAR ?auto_68412 ) ( IS-CRATE ?auto_68409 ) ( not ( = ?auto_68408 ?auto_68412 ) ) ( not ( = ?auto_68409 ?auto_68412 ) ) ( not ( = ?auto_68415 ?auto_68412 ) ) ( AVAILABLE ?auto_68414 ) ( IN ?auto_68409 ?auto_68410 ) ( TRUCK-AT ?auto_68410 ?auto_68413 ) )
    :subtasks
    ( ( !DRIVE ?auto_68410 ?auto_68413 ?auto_68411 )
      ( MAKE-ON ?auto_68408 ?auto_68409 )
      ( MAKE-ON-VERIFY ?auto_68408 ?auto_68409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68417 - SURFACE
      ?auto_68418 - SURFACE
    )
    :vars
    (
      ?auto_68425 - HOIST
      ?auto_68424 - PLACE
      ?auto_68421 - PLACE
      ?auto_68420 - HOIST
      ?auto_68422 - SURFACE
      ?auto_68423 - SURFACE
      ?auto_68419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_68425 ?auto_68424 ) ( IS-CRATE ?auto_68417 ) ( not ( = ?auto_68417 ?auto_68418 ) ) ( not ( = ?auto_68421 ?auto_68424 ) ) ( HOIST-AT ?auto_68420 ?auto_68421 ) ( not ( = ?auto_68425 ?auto_68420 ) ) ( SURFACE-AT ?auto_68417 ?auto_68421 ) ( ON ?auto_68417 ?auto_68422 ) ( CLEAR ?auto_68417 ) ( not ( = ?auto_68417 ?auto_68422 ) ) ( not ( = ?auto_68418 ?auto_68422 ) ) ( SURFACE-AT ?auto_68423 ?auto_68424 ) ( CLEAR ?auto_68423 ) ( IS-CRATE ?auto_68418 ) ( not ( = ?auto_68417 ?auto_68423 ) ) ( not ( = ?auto_68418 ?auto_68423 ) ) ( not ( = ?auto_68422 ?auto_68423 ) ) ( AVAILABLE ?auto_68425 ) ( TRUCK-AT ?auto_68419 ?auto_68421 ) ( LIFTING ?auto_68420 ?auto_68418 ) )
    :subtasks
    ( ( !LOAD ?auto_68420 ?auto_68418 ?auto_68419 ?auto_68421 )
      ( MAKE-ON ?auto_68417 ?auto_68418 )
      ( MAKE-ON-VERIFY ?auto_68417 ?auto_68418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68426 - SURFACE
      ?auto_68427 - SURFACE
    )
    :vars
    (
      ?auto_68433 - HOIST
      ?auto_68434 - PLACE
      ?auto_68432 - PLACE
      ?auto_68429 - HOIST
      ?auto_68428 - SURFACE
      ?auto_68431 - SURFACE
      ?auto_68430 - TRUCK
      ?auto_68435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68433 ?auto_68434 ) ( IS-CRATE ?auto_68426 ) ( not ( = ?auto_68426 ?auto_68427 ) ) ( not ( = ?auto_68432 ?auto_68434 ) ) ( HOIST-AT ?auto_68429 ?auto_68432 ) ( not ( = ?auto_68433 ?auto_68429 ) ) ( SURFACE-AT ?auto_68426 ?auto_68432 ) ( ON ?auto_68426 ?auto_68428 ) ( CLEAR ?auto_68426 ) ( not ( = ?auto_68426 ?auto_68428 ) ) ( not ( = ?auto_68427 ?auto_68428 ) ) ( SURFACE-AT ?auto_68431 ?auto_68434 ) ( CLEAR ?auto_68431 ) ( IS-CRATE ?auto_68427 ) ( not ( = ?auto_68426 ?auto_68431 ) ) ( not ( = ?auto_68427 ?auto_68431 ) ) ( not ( = ?auto_68428 ?auto_68431 ) ) ( AVAILABLE ?auto_68433 ) ( TRUCK-AT ?auto_68430 ?auto_68432 ) ( AVAILABLE ?auto_68429 ) ( SURFACE-AT ?auto_68427 ?auto_68432 ) ( ON ?auto_68427 ?auto_68435 ) ( CLEAR ?auto_68427 ) ( not ( = ?auto_68426 ?auto_68435 ) ) ( not ( = ?auto_68427 ?auto_68435 ) ) ( not ( = ?auto_68428 ?auto_68435 ) ) ( not ( = ?auto_68431 ?auto_68435 ) ) )
    :subtasks
    ( ( !LIFT ?auto_68429 ?auto_68427 ?auto_68435 ?auto_68432 )
      ( MAKE-ON ?auto_68426 ?auto_68427 )
      ( MAKE-ON-VERIFY ?auto_68426 ?auto_68427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68436 - SURFACE
      ?auto_68437 - SURFACE
    )
    :vars
    (
      ?auto_68444 - HOIST
      ?auto_68443 - PLACE
      ?auto_68438 - PLACE
      ?auto_68439 - HOIST
      ?auto_68442 - SURFACE
      ?auto_68445 - SURFACE
      ?auto_68441 - SURFACE
      ?auto_68440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_68444 ?auto_68443 ) ( IS-CRATE ?auto_68436 ) ( not ( = ?auto_68436 ?auto_68437 ) ) ( not ( = ?auto_68438 ?auto_68443 ) ) ( HOIST-AT ?auto_68439 ?auto_68438 ) ( not ( = ?auto_68444 ?auto_68439 ) ) ( SURFACE-AT ?auto_68436 ?auto_68438 ) ( ON ?auto_68436 ?auto_68442 ) ( CLEAR ?auto_68436 ) ( not ( = ?auto_68436 ?auto_68442 ) ) ( not ( = ?auto_68437 ?auto_68442 ) ) ( SURFACE-AT ?auto_68445 ?auto_68443 ) ( CLEAR ?auto_68445 ) ( IS-CRATE ?auto_68437 ) ( not ( = ?auto_68436 ?auto_68445 ) ) ( not ( = ?auto_68437 ?auto_68445 ) ) ( not ( = ?auto_68442 ?auto_68445 ) ) ( AVAILABLE ?auto_68444 ) ( AVAILABLE ?auto_68439 ) ( SURFACE-AT ?auto_68437 ?auto_68438 ) ( ON ?auto_68437 ?auto_68441 ) ( CLEAR ?auto_68437 ) ( not ( = ?auto_68436 ?auto_68441 ) ) ( not ( = ?auto_68437 ?auto_68441 ) ) ( not ( = ?auto_68442 ?auto_68441 ) ) ( not ( = ?auto_68445 ?auto_68441 ) ) ( TRUCK-AT ?auto_68440 ?auto_68443 ) )
    :subtasks
    ( ( !DRIVE ?auto_68440 ?auto_68443 ?auto_68438 )
      ( MAKE-ON ?auto_68436 ?auto_68437 )
      ( MAKE-ON-VERIFY ?auto_68436 ?auto_68437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68446 - SURFACE
      ?auto_68447 - SURFACE
    )
    :vars
    (
      ?auto_68452 - HOIST
      ?auto_68453 - PLACE
      ?auto_68451 - PLACE
      ?auto_68449 - HOIST
      ?auto_68450 - SURFACE
      ?auto_68448 - SURFACE
      ?auto_68455 - SURFACE
      ?auto_68454 - TRUCK
      ?auto_68456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68452 ?auto_68453 ) ( IS-CRATE ?auto_68446 ) ( not ( = ?auto_68446 ?auto_68447 ) ) ( not ( = ?auto_68451 ?auto_68453 ) ) ( HOIST-AT ?auto_68449 ?auto_68451 ) ( not ( = ?auto_68452 ?auto_68449 ) ) ( SURFACE-AT ?auto_68446 ?auto_68451 ) ( ON ?auto_68446 ?auto_68450 ) ( CLEAR ?auto_68446 ) ( not ( = ?auto_68446 ?auto_68450 ) ) ( not ( = ?auto_68447 ?auto_68450 ) ) ( IS-CRATE ?auto_68447 ) ( not ( = ?auto_68446 ?auto_68448 ) ) ( not ( = ?auto_68447 ?auto_68448 ) ) ( not ( = ?auto_68450 ?auto_68448 ) ) ( AVAILABLE ?auto_68449 ) ( SURFACE-AT ?auto_68447 ?auto_68451 ) ( ON ?auto_68447 ?auto_68455 ) ( CLEAR ?auto_68447 ) ( not ( = ?auto_68446 ?auto_68455 ) ) ( not ( = ?auto_68447 ?auto_68455 ) ) ( not ( = ?auto_68450 ?auto_68455 ) ) ( not ( = ?auto_68448 ?auto_68455 ) ) ( TRUCK-AT ?auto_68454 ?auto_68453 ) ( SURFACE-AT ?auto_68456 ?auto_68453 ) ( CLEAR ?auto_68456 ) ( LIFTING ?auto_68452 ?auto_68448 ) ( IS-CRATE ?auto_68448 ) ( not ( = ?auto_68446 ?auto_68456 ) ) ( not ( = ?auto_68447 ?auto_68456 ) ) ( not ( = ?auto_68450 ?auto_68456 ) ) ( not ( = ?auto_68448 ?auto_68456 ) ) ( not ( = ?auto_68455 ?auto_68456 ) ) )
    :subtasks
    ( ( !DROP ?auto_68452 ?auto_68448 ?auto_68456 ?auto_68453 )
      ( MAKE-ON ?auto_68446 ?auto_68447 )
      ( MAKE-ON-VERIFY ?auto_68446 ?auto_68447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68509 - SURFACE
      ?auto_68510 - SURFACE
    )
    :vars
    (
      ?auto_68518 - HOIST
      ?auto_68513 - PLACE
      ?auto_68516 - PLACE
      ?auto_68512 - HOIST
      ?auto_68511 - SURFACE
      ?auto_68514 - SURFACE
      ?auto_68515 - TRUCK
      ?auto_68517 - SURFACE
      ?auto_68519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68518 ?auto_68513 ) ( IS-CRATE ?auto_68509 ) ( not ( = ?auto_68509 ?auto_68510 ) ) ( not ( = ?auto_68516 ?auto_68513 ) ) ( HOIST-AT ?auto_68512 ?auto_68516 ) ( not ( = ?auto_68518 ?auto_68512 ) ) ( SURFACE-AT ?auto_68509 ?auto_68516 ) ( ON ?auto_68509 ?auto_68511 ) ( CLEAR ?auto_68509 ) ( not ( = ?auto_68509 ?auto_68511 ) ) ( not ( = ?auto_68510 ?auto_68511 ) ) ( SURFACE-AT ?auto_68514 ?auto_68513 ) ( CLEAR ?auto_68514 ) ( IS-CRATE ?auto_68510 ) ( not ( = ?auto_68509 ?auto_68514 ) ) ( not ( = ?auto_68510 ?auto_68514 ) ) ( not ( = ?auto_68511 ?auto_68514 ) ) ( AVAILABLE ?auto_68518 ) ( TRUCK-AT ?auto_68515 ?auto_68516 ) ( SURFACE-AT ?auto_68510 ?auto_68516 ) ( ON ?auto_68510 ?auto_68517 ) ( CLEAR ?auto_68510 ) ( not ( = ?auto_68509 ?auto_68517 ) ) ( not ( = ?auto_68510 ?auto_68517 ) ) ( not ( = ?auto_68511 ?auto_68517 ) ) ( not ( = ?auto_68514 ?auto_68517 ) ) ( LIFTING ?auto_68512 ?auto_68519 ) ( IS-CRATE ?auto_68519 ) ( not ( = ?auto_68509 ?auto_68519 ) ) ( not ( = ?auto_68510 ?auto_68519 ) ) ( not ( = ?auto_68511 ?auto_68519 ) ) ( not ( = ?auto_68514 ?auto_68519 ) ) ( not ( = ?auto_68517 ?auto_68519 ) ) )
    :subtasks
    ( ( !LOAD ?auto_68512 ?auto_68519 ?auto_68515 ?auto_68516 )
      ( MAKE-ON ?auto_68509 ?auto_68510 )
      ( MAKE-ON-VERIFY ?auto_68509 ?auto_68510 ) )
  )

)

