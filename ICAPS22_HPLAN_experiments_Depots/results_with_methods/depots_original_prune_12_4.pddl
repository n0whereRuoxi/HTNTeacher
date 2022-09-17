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
      ?auto_40340 - SURFACE
      ?auto_40341 - SURFACE
    )
    :vars
    (
      ?auto_40342 - HOIST
      ?auto_40343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40342 ?auto_40343 ) ( SURFACE-AT ?auto_40341 ?auto_40343 ) ( CLEAR ?auto_40341 ) ( LIFTING ?auto_40342 ?auto_40340 ) ( IS-CRATE ?auto_40340 ) ( not ( = ?auto_40340 ?auto_40341 ) ) )
    :subtasks
    ( ( !DROP ?auto_40342 ?auto_40340 ?auto_40341 ?auto_40343 )
      ( MAKE-ON-VERIFY ?auto_40340 ?auto_40341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40344 - SURFACE
      ?auto_40345 - SURFACE
    )
    :vars
    (
      ?auto_40346 - HOIST
      ?auto_40347 - PLACE
      ?auto_40348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40346 ?auto_40347 ) ( SURFACE-AT ?auto_40345 ?auto_40347 ) ( CLEAR ?auto_40345 ) ( IS-CRATE ?auto_40344 ) ( not ( = ?auto_40344 ?auto_40345 ) ) ( TRUCK-AT ?auto_40348 ?auto_40347 ) ( AVAILABLE ?auto_40346 ) ( IN ?auto_40344 ?auto_40348 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40346 ?auto_40344 ?auto_40348 ?auto_40347 )
      ( MAKE-ON ?auto_40344 ?auto_40345 )
      ( MAKE-ON-VERIFY ?auto_40344 ?auto_40345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40349 - SURFACE
      ?auto_40350 - SURFACE
    )
    :vars
    (
      ?auto_40351 - HOIST
      ?auto_40352 - PLACE
      ?auto_40353 - TRUCK
      ?auto_40354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40351 ?auto_40352 ) ( SURFACE-AT ?auto_40350 ?auto_40352 ) ( CLEAR ?auto_40350 ) ( IS-CRATE ?auto_40349 ) ( not ( = ?auto_40349 ?auto_40350 ) ) ( AVAILABLE ?auto_40351 ) ( IN ?auto_40349 ?auto_40353 ) ( TRUCK-AT ?auto_40353 ?auto_40354 ) ( not ( = ?auto_40354 ?auto_40352 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40353 ?auto_40354 ?auto_40352 )
      ( MAKE-ON ?auto_40349 ?auto_40350 )
      ( MAKE-ON-VERIFY ?auto_40349 ?auto_40350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40355 - SURFACE
      ?auto_40356 - SURFACE
    )
    :vars
    (
      ?auto_40359 - HOIST
      ?auto_40358 - PLACE
      ?auto_40360 - TRUCK
      ?auto_40357 - PLACE
      ?auto_40361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40359 ?auto_40358 ) ( SURFACE-AT ?auto_40356 ?auto_40358 ) ( CLEAR ?auto_40356 ) ( IS-CRATE ?auto_40355 ) ( not ( = ?auto_40355 ?auto_40356 ) ) ( AVAILABLE ?auto_40359 ) ( TRUCK-AT ?auto_40360 ?auto_40357 ) ( not ( = ?auto_40357 ?auto_40358 ) ) ( HOIST-AT ?auto_40361 ?auto_40357 ) ( LIFTING ?auto_40361 ?auto_40355 ) ( not ( = ?auto_40359 ?auto_40361 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40361 ?auto_40355 ?auto_40360 ?auto_40357 )
      ( MAKE-ON ?auto_40355 ?auto_40356 )
      ( MAKE-ON-VERIFY ?auto_40355 ?auto_40356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40362 - SURFACE
      ?auto_40363 - SURFACE
    )
    :vars
    (
      ?auto_40366 - HOIST
      ?auto_40367 - PLACE
      ?auto_40365 - TRUCK
      ?auto_40368 - PLACE
      ?auto_40364 - HOIST
      ?auto_40369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40366 ?auto_40367 ) ( SURFACE-AT ?auto_40363 ?auto_40367 ) ( CLEAR ?auto_40363 ) ( IS-CRATE ?auto_40362 ) ( not ( = ?auto_40362 ?auto_40363 ) ) ( AVAILABLE ?auto_40366 ) ( TRUCK-AT ?auto_40365 ?auto_40368 ) ( not ( = ?auto_40368 ?auto_40367 ) ) ( HOIST-AT ?auto_40364 ?auto_40368 ) ( not ( = ?auto_40366 ?auto_40364 ) ) ( AVAILABLE ?auto_40364 ) ( SURFACE-AT ?auto_40362 ?auto_40368 ) ( ON ?auto_40362 ?auto_40369 ) ( CLEAR ?auto_40362 ) ( not ( = ?auto_40362 ?auto_40369 ) ) ( not ( = ?auto_40363 ?auto_40369 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40364 ?auto_40362 ?auto_40369 ?auto_40368 )
      ( MAKE-ON ?auto_40362 ?auto_40363 )
      ( MAKE-ON-VERIFY ?auto_40362 ?auto_40363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40370 - SURFACE
      ?auto_40371 - SURFACE
    )
    :vars
    (
      ?auto_40373 - HOIST
      ?auto_40372 - PLACE
      ?auto_40376 - PLACE
      ?auto_40377 - HOIST
      ?auto_40374 - SURFACE
      ?auto_40375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40373 ?auto_40372 ) ( SURFACE-AT ?auto_40371 ?auto_40372 ) ( CLEAR ?auto_40371 ) ( IS-CRATE ?auto_40370 ) ( not ( = ?auto_40370 ?auto_40371 ) ) ( AVAILABLE ?auto_40373 ) ( not ( = ?auto_40376 ?auto_40372 ) ) ( HOIST-AT ?auto_40377 ?auto_40376 ) ( not ( = ?auto_40373 ?auto_40377 ) ) ( AVAILABLE ?auto_40377 ) ( SURFACE-AT ?auto_40370 ?auto_40376 ) ( ON ?auto_40370 ?auto_40374 ) ( CLEAR ?auto_40370 ) ( not ( = ?auto_40370 ?auto_40374 ) ) ( not ( = ?auto_40371 ?auto_40374 ) ) ( TRUCK-AT ?auto_40375 ?auto_40372 ) )
    :subtasks
    ( ( !DRIVE ?auto_40375 ?auto_40372 ?auto_40376 )
      ( MAKE-ON ?auto_40370 ?auto_40371 )
      ( MAKE-ON-VERIFY ?auto_40370 ?auto_40371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40418 - SURFACE
      ?auto_40419 - SURFACE
    )
    :vars
    (
      ?auto_40424 - HOIST
      ?auto_40421 - PLACE
      ?auto_40420 - PLACE
      ?auto_40423 - HOIST
      ?auto_40422 - SURFACE
      ?auto_40425 - TRUCK
      ?auto_40426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40424 ?auto_40421 ) ( IS-CRATE ?auto_40418 ) ( not ( = ?auto_40418 ?auto_40419 ) ) ( not ( = ?auto_40420 ?auto_40421 ) ) ( HOIST-AT ?auto_40423 ?auto_40420 ) ( not ( = ?auto_40424 ?auto_40423 ) ) ( AVAILABLE ?auto_40423 ) ( SURFACE-AT ?auto_40418 ?auto_40420 ) ( ON ?auto_40418 ?auto_40422 ) ( CLEAR ?auto_40418 ) ( not ( = ?auto_40418 ?auto_40422 ) ) ( not ( = ?auto_40419 ?auto_40422 ) ) ( TRUCK-AT ?auto_40425 ?auto_40421 ) ( SURFACE-AT ?auto_40426 ?auto_40421 ) ( CLEAR ?auto_40426 ) ( LIFTING ?auto_40424 ?auto_40419 ) ( IS-CRATE ?auto_40419 ) ( not ( = ?auto_40418 ?auto_40426 ) ) ( not ( = ?auto_40419 ?auto_40426 ) ) ( not ( = ?auto_40422 ?auto_40426 ) ) )
    :subtasks
    ( ( !DROP ?auto_40424 ?auto_40419 ?auto_40426 ?auto_40421 )
      ( MAKE-ON ?auto_40418 ?auto_40419 )
      ( MAKE-ON-VERIFY ?auto_40418 ?auto_40419 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40427 - SURFACE
      ?auto_40428 - SURFACE
    )
    :vars
    (
      ?auto_40431 - HOIST
      ?auto_40432 - PLACE
      ?auto_40429 - PLACE
      ?auto_40433 - HOIST
      ?auto_40430 - SURFACE
      ?auto_40434 - TRUCK
      ?auto_40435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40431 ?auto_40432 ) ( IS-CRATE ?auto_40427 ) ( not ( = ?auto_40427 ?auto_40428 ) ) ( not ( = ?auto_40429 ?auto_40432 ) ) ( HOIST-AT ?auto_40433 ?auto_40429 ) ( not ( = ?auto_40431 ?auto_40433 ) ) ( AVAILABLE ?auto_40433 ) ( SURFACE-AT ?auto_40427 ?auto_40429 ) ( ON ?auto_40427 ?auto_40430 ) ( CLEAR ?auto_40427 ) ( not ( = ?auto_40427 ?auto_40430 ) ) ( not ( = ?auto_40428 ?auto_40430 ) ) ( TRUCK-AT ?auto_40434 ?auto_40432 ) ( SURFACE-AT ?auto_40435 ?auto_40432 ) ( CLEAR ?auto_40435 ) ( IS-CRATE ?auto_40428 ) ( not ( = ?auto_40427 ?auto_40435 ) ) ( not ( = ?auto_40428 ?auto_40435 ) ) ( not ( = ?auto_40430 ?auto_40435 ) ) ( AVAILABLE ?auto_40431 ) ( IN ?auto_40428 ?auto_40434 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40431 ?auto_40428 ?auto_40434 ?auto_40432 )
      ( MAKE-ON ?auto_40427 ?auto_40428 )
      ( MAKE-ON-VERIFY ?auto_40427 ?auto_40428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40442 - SURFACE
      ?auto_40443 - SURFACE
    )
    :vars
    (
      ?auto_40449 - HOIST
      ?auto_40445 - PLACE
      ?auto_40447 - PLACE
      ?auto_40444 - HOIST
      ?auto_40448 - SURFACE
      ?auto_40446 - TRUCK
      ?auto_40450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40449 ?auto_40445 ) ( SURFACE-AT ?auto_40443 ?auto_40445 ) ( CLEAR ?auto_40443 ) ( IS-CRATE ?auto_40442 ) ( not ( = ?auto_40442 ?auto_40443 ) ) ( AVAILABLE ?auto_40449 ) ( not ( = ?auto_40447 ?auto_40445 ) ) ( HOIST-AT ?auto_40444 ?auto_40447 ) ( not ( = ?auto_40449 ?auto_40444 ) ) ( AVAILABLE ?auto_40444 ) ( SURFACE-AT ?auto_40442 ?auto_40447 ) ( ON ?auto_40442 ?auto_40448 ) ( CLEAR ?auto_40442 ) ( not ( = ?auto_40442 ?auto_40448 ) ) ( not ( = ?auto_40443 ?auto_40448 ) ) ( TRUCK-AT ?auto_40446 ?auto_40450 ) ( not ( = ?auto_40450 ?auto_40445 ) ) ( not ( = ?auto_40447 ?auto_40450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40446 ?auto_40450 ?auto_40445 )
      ( MAKE-ON ?auto_40442 ?auto_40443 )
      ( MAKE-ON-VERIFY ?auto_40442 ?auto_40443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41135 - SURFACE
      ?auto_41136 - SURFACE
    )
    :vars
    (
      ?auto_41138 - HOIST
      ?auto_41139 - PLACE
      ?auto_41142 - TRUCK
      ?auto_41140 - PLACE
      ?auto_41137 - HOIST
      ?auto_41141 - SURFACE
      ?auto_41143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41138 ?auto_41139 ) ( SURFACE-AT ?auto_41136 ?auto_41139 ) ( CLEAR ?auto_41136 ) ( IS-CRATE ?auto_41135 ) ( not ( = ?auto_41135 ?auto_41136 ) ) ( AVAILABLE ?auto_41138 ) ( TRUCK-AT ?auto_41142 ?auto_41140 ) ( not ( = ?auto_41140 ?auto_41139 ) ) ( HOIST-AT ?auto_41137 ?auto_41140 ) ( not ( = ?auto_41138 ?auto_41137 ) ) ( SURFACE-AT ?auto_41135 ?auto_41140 ) ( ON ?auto_41135 ?auto_41141 ) ( CLEAR ?auto_41135 ) ( not ( = ?auto_41135 ?auto_41141 ) ) ( not ( = ?auto_41136 ?auto_41141 ) ) ( LIFTING ?auto_41137 ?auto_41143 ) ( IS-CRATE ?auto_41143 ) ( not ( = ?auto_41135 ?auto_41143 ) ) ( not ( = ?auto_41136 ?auto_41143 ) ) ( not ( = ?auto_41141 ?auto_41143 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41137 ?auto_41143 ?auto_41142 ?auto_41140 )
      ( MAKE-ON ?auto_41135 ?auto_41136 )
      ( MAKE-ON-VERIFY ?auto_41135 ?auto_41136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41299 - SURFACE
      ?auto_41300 - SURFACE
    )
    :vars
    (
      ?auto_41306 - HOIST
      ?auto_41303 - PLACE
      ?auto_41302 - PLACE
      ?auto_41301 - HOIST
      ?auto_41304 - SURFACE
      ?auto_41305 - TRUCK
      ?auto_41307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41306 ?auto_41303 ) ( SURFACE-AT ?auto_41300 ?auto_41303 ) ( CLEAR ?auto_41300 ) ( IS-CRATE ?auto_41299 ) ( not ( = ?auto_41299 ?auto_41300 ) ) ( not ( = ?auto_41302 ?auto_41303 ) ) ( HOIST-AT ?auto_41301 ?auto_41302 ) ( not ( = ?auto_41306 ?auto_41301 ) ) ( AVAILABLE ?auto_41301 ) ( SURFACE-AT ?auto_41299 ?auto_41302 ) ( ON ?auto_41299 ?auto_41304 ) ( CLEAR ?auto_41299 ) ( not ( = ?auto_41299 ?auto_41304 ) ) ( not ( = ?auto_41300 ?auto_41304 ) ) ( TRUCK-AT ?auto_41305 ?auto_41303 ) ( LIFTING ?auto_41306 ?auto_41307 ) ( IS-CRATE ?auto_41307 ) ( not ( = ?auto_41299 ?auto_41307 ) ) ( not ( = ?auto_41300 ?auto_41307 ) ) ( not ( = ?auto_41304 ?auto_41307 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41306 ?auto_41307 ?auto_41305 ?auto_41303 )
      ( MAKE-ON ?auto_41299 ?auto_41300 )
      ( MAKE-ON-VERIFY ?auto_41299 ?auto_41300 ) )
  )

)

