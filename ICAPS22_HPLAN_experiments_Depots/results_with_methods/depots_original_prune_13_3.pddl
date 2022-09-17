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
      ?auto_47097 - SURFACE
      ?auto_47098 - SURFACE
    )
    :vars
    (
      ?auto_47099 - HOIST
      ?auto_47100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47099 ?auto_47100 ) ( SURFACE-AT ?auto_47098 ?auto_47100 ) ( CLEAR ?auto_47098 ) ( LIFTING ?auto_47099 ?auto_47097 ) ( IS-CRATE ?auto_47097 ) ( not ( = ?auto_47097 ?auto_47098 ) ) )
    :subtasks
    ( ( !DROP ?auto_47099 ?auto_47097 ?auto_47098 ?auto_47100 )
      ( MAKE-ON-VERIFY ?auto_47097 ?auto_47098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47101 - SURFACE
      ?auto_47102 - SURFACE
    )
    :vars
    (
      ?auto_47104 - HOIST
      ?auto_47103 - PLACE
      ?auto_47105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47104 ?auto_47103 ) ( SURFACE-AT ?auto_47102 ?auto_47103 ) ( CLEAR ?auto_47102 ) ( IS-CRATE ?auto_47101 ) ( not ( = ?auto_47101 ?auto_47102 ) ) ( TRUCK-AT ?auto_47105 ?auto_47103 ) ( AVAILABLE ?auto_47104 ) ( IN ?auto_47101 ?auto_47105 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47104 ?auto_47101 ?auto_47105 ?auto_47103 )
      ( MAKE-ON ?auto_47101 ?auto_47102 )
      ( MAKE-ON-VERIFY ?auto_47101 ?auto_47102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47106 - SURFACE
      ?auto_47107 - SURFACE
    )
    :vars
    (
      ?auto_47108 - HOIST
      ?auto_47110 - PLACE
      ?auto_47109 - TRUCK
      ?auto_47111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47108 ?auto_47110 ) ( SURFACE-AT ?auto_47107 ?auto_47110 ) ( CLEAR ?auto_47107 ) ( IS-CRATE ?auto_47106 ) ( not ( = ?auto_47106 ?auto_47107 ) ) ( AVAILABLE ?auto_47108 ) ( IN ?auto_47106 ?auto_47109 ) ( TRUCK-AT ?auto_47109 ?auto_47111 ) ( not ( = ?auto_47111 ?auto_47110 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47109 ?auto_47111 ?auto_47110 )
      ( MAKE-ON ?auto_47106 ?auto_47107 )
      ( MAKE-ON-VERIFY ?auto_47106 ?auto_47107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47112 - SURFACE
      ?auto_47113 - SURFACE
    )
    :vars
    (
      ?auto_47114 - HOIST
      ?auto_47117 - PLACE
      ?auto_47115 - TRUCK
      ?auto_47116 - PLACE
      ?auto_47118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47114 ?auto_47117 ) ( SURFACE-AT ?auto_47113 ?auto_47117 ) ( CLEAR ?auto_47113 ) ( IS-CRATE ?auto_47112 ) ( not ( = ?auto_47112 ?auto_47113 ) ) ( AVAILABLE ?auto_47114 ) ( TRUCK-AT ?auto_47115 ?auto_47116 ) ( not ( = ?auto_47116 ?auto_47117 ) ) ( HOIST-AT ?auto_47118 ?auto_47116 ) ( LIFTING ?auto_47118 ?auto_47112 ) ( not ( = ?auto_47114 ?auto_47118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47118 ?auto_47112 ?auto_47115 ?auto_47116 )
      ( MAKE-ON ?auto_47112 ?auto_47113 )
      ( MAKE-ON-VERIFY ?auto_47112 ?auto_47113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47119 - SURFACE
      ?auto_47120 - SURFACE
    )
    :vars
    (
      ?auto_47125 - HOIST
      ?auto_47124 - PLACE
      ?auto_47123 - TRUCK
      ?auto_47121 - PLACE
      ?auto_47122 - HOIST
      ?auto_47126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47125 ?auto_47124 ) ( SURFACE-AT ?auto_47120 ?auto_47124 ) ( CLEAR ?auto_47120 ) ( IS-CRATE ?auto_47119 ) ( not ( = ?auto_47119 ?auto_47120 ) ) ( AVAILABLE ?auto_47125 ) ( TRUCK-AT ?auto_47123 ?auto_47121 ) ( not ( = ?auto_47121 ?auto_47124 ) ) ( HOIST-AT ?auto_47122 ?auto_47121 ) ( not ( = ?auto_47125 ?auto_47122 ) ) ( AVAILABLE ?auto_47122 ) ( SURFACE-AT ?auto_47119 ?auto_47121 ) ( ON ?auto_47119 ?auto_47126 ) ( CLEAR ?auto_47119 ) ( not ( = ?auto_47119 ?auto_47126 ) ) ( not ( = ?auto_47120 ?auto_47126 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47122 ?auto_47119 ?auto_47126 ?auto_47121 )
      ( MAKE-ON ?auto_47119 ?auto_47120 )
      ( MAKE-ON-VERIFY ?auto_47119 ?auto_47120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47127 - SURFACE
      ?auto_47128 - SURFACE
    )
    :vars
    (
      ?auto_47130 - HOIST
      ?auto_47131 - PLACE
      ?auto_47129 - PLACE
      ?auto_47132 - HOIST
      ?auto_47133 - SURFACE
      ?auto_47134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47130 ?auto_47131 ) ( SURFACE-AT ?auto_47128 ?auto_47131 ) ( CLEAR ?auto_47128 ) ( IS-CRATE ?auto_47127 ) ( not ( = ?auto_47127 ?auto_47128 ) ) ( AVAILABLE ?auto_47130 ) ( not ( = ?auto_47129 ?auto_47131 ) ) ( HOIST-AT ?auto_47132 ?auto_47129 ) ( not ( = ?auto_47130 ?auto_47132 ) ) ( AVAILABLE ?auto_47132 ) ( SURFACE-AT ?auto_47127 ?auto_47129 ) ( ON ?auto_47127 ?auto_47133 ) ( CLEAR ?auto_47127 ) ( not ( = ?auto_47127 ?auto_47133 ) ) ( not ( = ?auto_47128 ?auto_47133 ) ) ( TRUCK-AT ?auto_47134 ?auto_47131 ) )
    :subtasks
    ( ( !DRIVE ?auto_47134 ?auto_47131 ?auto_47129 )
      ( MAKE-ON ?auto_47127 ?auto_47128 )
      ( MAKE-ON-VERIFY ?auto_47127 ?auto_47128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47175 - SURFACE
      ?auto_47176 - SURFACE
    )
    :vars
    (
      ?auto_47181 - HOIST
      ?auto_47177 - PLACE
      ?auto_47179 - PLACE
      ?auto_47182 - HOIST
      ?auto_47180 - SURFACE
      ?auto_47178 - TRUCK
      ?auto_47183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47181 ?auto_47177 ) ( IS-CRATE ?auto_47175 ) ( not ( = ?auto_47175 ?auto_47176 ) ) ( not ( = ?auto_47179 ?auto_47177 ) ) ( HOIST-AT ?auto_47182 ?auto_47179 ) ( not ( = ?auto_47181 ?auto_47182 ) ) ( AVAILABLE ?auto_47182 ) ( SURFACE-AT ?auto_47175 ?auto_47179 ) ( ON ?auto_47175 ?auto_47180 ) ( CLEAR ?auto_47175 ) ( not ( = ?auto_47175 ?auto_47180 ) ) ( not ( = ?auto_47176 ?auto_47180 ) ) ( TRUCK-AT ?auto_47178 ?auto_47177 ) ( SURFACE-AT ?auto_47183 ?auto_47177 ) ( CLEAR ?auto_47183 ) ( LIFTING ?auto_47181 ?auto_47176 ) ( IS-CRATE ?auto_47176 ) ( not ( = ?auto_47175 ?auto_47183 ) ) ( not ( = ?auto_47176 ?auto_47183 ) ) ( not ( = ?auto_47180 ?auto_47183 ) ) )
    :subtasks
    ( ( !DROP ?auto_47181 ?auto_47176 ?auto_47183 ?auto_47177 )
      ( MAKE-ON ?auto_47175 ?auto_47176 )
      ( MAKE-ON-VERIFY ?auto_47175 ?auto_47176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47184 - SURFACE
      ?auto_47185 - SURFACE
    )
    :vars
    (
      ?auto_47188 - HOIST
      ?auto_47187 - PLACE
      ?auto_47191 - PLACE
      ?auto_47192 - HOIST
      ?auto_47189 - SURFACE
      ?auto_47190 - TRUCK
      ?auto_47186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47188 ?auto_47187 ) ( IS-CRATE ?auto_47184 ) ( not ( = ?auto_47184 ?auto_47185 ) ) ( not ( = ?auto_47191 ?auto_47187 ) ) ( HOIST-AT ?auto_47192 ?auto_47191 ) ( not ( = ?auto_47188 ?auto_47192 ) ) ( AVAILABLE ?auto_47192 ) ( SURFACE-AT ?auto_47184 ?auto_47191 ) ( ON ?auto_47184 ?auto_47189 ) ( CLEAR ?auto_47184 ) ( not ( = ?auto_47184 ?auto_47189 ) ) ( not ( = ?auto_47185 ?auto_47189 ) ) ( TRUCK-AT ?auto_47190 ?auto_47187 ) ( SURFACE-AT ?auto_47186 ?auto_47187 ) ( CLEAR ?auto_47186 ) ( IS-CRATE ?auto_47185 ) ( not ( = ?auto_47184 ?auto_47186 ) ) ( not ( = ?auto_47185 ?auto_47186 ) ) ( not ( = ?auto_47189 ?auto_47186 ) ) ( AVAILABLE ?auto_47188 ) ( IN ?auto_47185 ?auto_47190 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47188 ?auto_47185 ?auto_47190 ?auto_47187 )
      ( MAKE-ON ?auto_47184 ?auto_47185 )
      ( MAKE-ON-VERIFY ?auto_47184 ?auto_47185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47199 - SURFACE
      ?auto_47200 - SURFACE
    )
    :vars
    (
      ?auto_47206 - HOIST
      ?auto_47204 - PLACE
      ?auto_47203 - PLACE
      ?auto_47202 - HOIST
      ?auto_47201 - SURFACE
      ?auto_47205 - TRUCK
      ?auto_47207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47206 ?auto_47204 ) ( SURFACE-AT ?auto_47200 ?auto_47204 ) ( CLEAR ?auto_47200 ) ( IS-CRATE ?auto_47199 ) ( not ( = ?auto_47199 ?auto_47200 ) ) ( AVAILABLE ?auto_47206 ) ( not ( = ?auto_47203 ?auto_47204 ) ) ( HOIST-AT ?auto_47202 ?auto_47203 ) ( not ( = ?auto_47206 ?auto_47202 ) ) ( AVAILABLE ?auto_47202 ) ( SURFACE-AT ?auto_47199 ?auto_47203 ) ( ON ?auto_47199 ?auto_47201 ) ( CLEAR ?auto_47199 ) ( not ( = ?auto_47199 ?auto_47201 ) ) ( not ( = ?auto_47200 ?auto_47201 ) ) ( TRUCK-AT ?auto_47205 ?auto_47207 ) ( not ( = ?auto_47207 ?auto_47204 ) ) ( not ( = ?auto_47203 ?auto_47207 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47205 ?auto_47207 ?auto_47204 )
      ( MAKE-ON ?auto_47199 ?auto_47200 )
      ( MAKE-ON-VERIFY ?auto_47199 ?auto_47200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47351 - SURFACE
      ?auto_47352 - SURFACE
    )
    :vars
    (
      ?auto_47356 - HOIST
      ?auto_47357 - PLACE
      ?auto_47353 - PLACE
      ?auto_47355 - HOIST
      ?auto_47359 - SURFACE
      ?auto_47354 - SURFACE
      ?auto_47358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47356 ?auto_47357 ) ( IS-CRATE ?auto_47351 ) ( not ( = ?auto_47351 ?auto_47352 ) ) ( not ( = ?auto_47353 ?auto_47357 ) ) ( HOIST-AT ?auto_47355 ?auto_47353 ) ( not ( = ?auto_47356 ?auto_47355 ) ) ( AVAILABLE ?auto_47355 ) ( SURFACE-AT ?auto_47351 ?auto_47353 ) ( ON ?auto_47351 ?auto_47359 ) ( CLEAR ?auto_47351 ) ( not ( = ?auto_47351 ?auto_47359 ) ) ( not ( = ?auto_47352 ?auto_47359 ) ) ( SURFACE-AT ?auto_47354 ?auto_47357 ) ( CLEAR ?auto_47354 ) ( IS-CRATE ?auto_47352 ) ( not ( = ?auto_47351 ?auto_47354 ) ) ( not ( = ?auto_47352 ?auto_47354 ) ) ( not ( = ?auto_47359 ?auto_47354 ) ) ( AVAILABLE ?auto_47356 ) ( IN ?auto_47352 ?auto_47358 ) ( TRUCK-AT ?auto_47358 ?auto_47353 ) )
    :subtasks
    ( ( !DRIVE ?auto_47358 ?auto_47353 ?auto_47357 )
      ( MAKE-ON ?auto_47351 ?auto_47352 )
      ( MAKE-ON-VERIFY ?auto_47351 ?auto_47352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47360 - SURFACE
      ?auto_47361 - SURFACE
    )
    :vars
    (
      ?auto_47364 - HOIST
      ?auto_47362 - PLACE
      ?auto_47368 - PLACE
      ?auto_47366 - HOIST
      ?auto_47363 - SURFACE
      ?auto_47365 - SURFACE
      ?auto_47367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47364 ?auto_47362 ) ( IS-CRATE ?auto_47360 ) ( not ( = ?auto_47360 ?auto_47361 ) ) ( not ( = ?auto_47368 ?auto_47362 ) ) ( HOIST-AT ?auto_47366 ?auto_47368 ) ( not ( = ?auto_47364 ?auto_47366 ) ) ( SURFACE-AT ?auto_47360 ?auto_47368 ) ( ON ?auto_47360 ?auto_47363 ) ( CLEAR ?auto_47360 ) ( not ( = ?auto_47360 ?auto_47363 ) ) ( not ( = ?auto_47361 ?auto_47363 ) ) ( SURFACE-AT ?auto_47365 ?auto_47362 ) ( CLEAR ?auto_47365 ) ( IS-CRATE ?auto_47361 ) ( not ( = ?auto_47360 ?auto_47365 ) ) ( not ( = ?auto_47361 ?auto_47365 ) ) ( not ( = ?auto_47363 ?auto_47365 ) ) ( AVAILABLE ?auto_47364 ) ( TRUCK-AT ?auto_47367 ?auto_47368 ) ( LIFTING ?auto_47366 ?auto_47361 ) )
    :subtasks
    ( ( !LOAD ?auto_47366 ?auto_47361 ?auto_47367 ?auto_47368 )
      ( MAKE-ON ?auto_47360 ?auto_47361 )
      ( MAKE-ON-VERIFY ?auto_47360 ?auto_47361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47369 - SURFACE
      ?auto_47370 - SURFACE
    )
    :vars
    (
      ?auto_47373 - HOIST
      ?auto_47372 - PLACE
      ?auto_47374 - PLACE
      ?auto_47376 - HOIST
      ?auto_47377 - SURFACE
      ?auto_47375 - SURFACE
      ?auto_47371 - TRUCK
      ?auto_47378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47373 ?auto_47372 ) ( IS-CRATE ?auto_47369 ) ( not ( = ?auto_47369 ?auto_47370 ) ) ( not ( = ?auto_47374 ?auto_47372 ) ) ( HOIST-AT ?auto_47376 ?auto_47374 ) ( not ( = ?auto_47373 ?auto_47376 ) ) ( SURFACE-AT ?auto_47369 ?auto_47374 ) ( ON ?auto_47369 ?auto_47377 ) ( CLEAR ?auto_47369 ) ( not ( = ?auto_47369 ?auto_47377 ) ) ( not ( = ?auto_47370 ?auto_47377 ) ) ( SURFACE-AT ?auto_47375 ?auto_47372 ) ( CLEAR ?auto_47375 ) ( IS-CRATE ?auto_47370 ) ( not ( = ?auto_47369 ?auto_47375 ) ) ( not ( = ?auto_47370 ?auto_47375 ) ) ( not ( = ?auto_47377 ?auto_47375 ) ) ( AVAILABLE ?auto_47373 ) ( TRUCK-AT ?auto_47371 ?auto_47374 ) ( AVAILABLE ?auto_47376 ) ( SURFACE-AT ?auto_47370 ?auto_47374 ) ( ON ?auto_47370 ?auto_47378 ) ( CLEAR ?auto_47370 ) ( not ( = ?auto_47369 ?auto_47378 ) ) ( not ( = ?auto_47370 ?auto_47378 ) ) ( not ( = ?auto_47377 ?auto_47378 ) ) ( not ( = ?auto_47375 ?auto_47378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47376 ?auto_47370 ?auto_47378 ?auto_47374 )
      ( MAKE-ON ?auto_47369 ?auto_47370 )
      ( MAKE-ON-VERIFY ?auto_47369 ?auto_47370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47379 - SURFACE
      ?auto_47380 - SURFACE
    )
    :vars
    (
      ?auto_47383 - HOIST
      ?auto_47387 - PLACE
      ?auto_47385 - PLACE
      ?auto_47382 - HOIST
      ?auto_47381 - SURFACE
      ?auto_47386 - SURFACE
      ?auto_47384 - SURFACE
      ?auto_47388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47383 ?auto_47387 ) ( IS-CRATE ?auto_47379 ) ( not ( = ?auto_47379 ?auto_47380 ) ) ( not ( = ?auto_47385 ?auto_47387 ) ) ( HOIST-AT ?auto_47382 ?auto_47385 ) ( not ( = ?auto_47383 ?auto_47382 ) ) ( SURFACE-AT ?auto_47379 ?auto_47385 ) ( ON ?auto_47379 ?auto_47381 ) ( CLEAR ?auto_47379 ) ( not ( = ?auto_47379 ?auto_47381 ) ) ( not ( = ?auto_47380 ?auto_47381 ) ) ( SURFACE-AT ?auto_47386 ?auto_47387 ) ( CLEAR ?auto_47386 ) ( IS-CRATE ?auto_47380 ) ( not ( = ?auto_47379 ?auto_47386 ) ) ( not ( = ?auto_47380 ?auto_47386 ) ) ( not ( = ?auto_47381 ?auto_47386 ) ) ( AVAILABLE ?auto_47383 ) ( AVAILABLE ?auto_47382 ) ( SURFACE-AT ?auto_47380 ?auto_47385 ) ( ON ?auto_47380 ?auto_47384 ) ( CLEAR ?auto_47380 ) ( not ( = ?auto_47379 ?auto_47384 ) ) ( not ( = ?auto_47380 ?auto_47384 ) ) ( not ( = ?auto_47381 ?auto_47384 ) ) ( not ( = ?auto_47386 ?auto_47384 ) ) ( TRUCK-AT ?auto_47388 ?auto_47387 ) )
    :subtasks
    ( ( !DRIVE ?auto_47388 ?auto_47387 ?auto_47385 )
      ( MAKE-ON ?auto_47379 ?auto_47380 )
      ( MAKE-ON-VERIFY ?auto_47379 ?auto_47380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47389 - SURFACE
      ?auto_47390 - SURFACE
    )
    :vars
    (
      ?auto_47394 - HOIST
      ?auto_47391 - PLACE
      ?auto_47392 - PLACE
      ?auto_47398 - HOIST
      ?auto_47393 - SURFACE
      ?auto_47396 - SURFACE
      ?auto_47397 - SURFACE
      ?auto_47395 - TRUCK
      ?auto_47399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47394 ?auto_47391 ) ( IS-CRATE ?auto_47389 ) ( not ( = ?auto_47389 ?auto_47390 ) ) ( not ( = ?auto_47392 ?auto_47391 ) ) ( HOIST-AT ?auto_47398 ?auto_47392 ) ( not ( = ?auto_47394 ?auto_47398 ) ) ( SURFACE-AT ?auto_47389 ?auto_47392 ) ( ON ?auto_47389 ?auto_47393 ) ( CLEAR ?auto_47389 ) ( not ( = ?auto_47389 ?auto_47393 ) ) ( not ( = ?auto_47390 ?auto_47393 ) ) ( IS-CRATE ?auto_47390 ) ( not ( = ?auto_47389 ?auto_47396 ) ) ( not ( = ?auto_47390 ?auto_47396 ) ) ( not ( = ?auto_47393 ?auto_47396 ) ) ( AVAILABLE ?auto_47398 ) ( SURFACE-AT ?auto_47390 ?auto_47392 ) ( ON ?auto_47390 ?auto_47397 ) ( CLEAR ?auto_47390 ) ( not ( = ?auto_47389 ?auto_47397 ) ) ( not ( = ?auto_47390 ?auto_47397 ) ) ( not ( = ?auto_47393 ?auto_47397 ) ) ( not ( = ?auto_47396 ?auto_47397 ) ) ( TRUCK-AT ?auto_47395 ?auto_47391 ) ( SURFACE-AT ?auto_47399 ?auto_47391 ) ( CLEAR ?auto_47399 ) ( LIFTING ?auto_47394 ?auto_47396 ) ( IS-CRATE ?auto_47396 ) ( not ( = ?auto_47389 ?auto_47399 ) ) ( not ( = ?auto_47390 ?auto_47399 ) ) ( not ( = ?auto_47393 ?auto_47399 ) ) ( not ( = ?auto_47396 ?auto_47399 ) ) ( not ( = ?auto_47397 ?auto_47399 ) ) )
    :subtasks
    ( ( !DROP ?auto_47394 ?auto_47396 ?auto_47399 ?auto_47391 )
      ( MAKE-ON ?auto_47389 ?auto_47390 )
      ( MAKE-ON-VERIFY ?auto_47389 ?auto_47390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47501 - SURFACE
      ?auto_47502 - SURFACE
    )
    :vars
    (
      ?auto_47506 - HOIST
      ?auto_47507 - PLACE
      ?auto_47505 - PLACE
      ?auto_47503 - HOIST
      ?auto_47504 - SURFACE
      ?auto_47508 - TRUCK
      ?auto_47509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47506 ?auto_47507 ) ( SURFACE-AT ?auto_47502 ?auto_47507 ) ( CLEAR ?auto_47502 ) ( IS-CRATE ?auto_47501 ) ( not ( = ?auto_47501 ?auto_47502 ) ) ( not ( = ?auto_47505 ?auto_47507 ) ) ( HOIST-AT ?auto_47503 ?auto_47505 ) ( not ( = ?auto_47506 ?auto_47503 ) ) ( AVAILABLE ?auto_47503 ) ( SURFACE-AT ?auto_47501 ?auto_47505 ) ( ON ?auto_47501 ?auto_47504 ) ( CLEAR ?auto_47501 ) ( not ( = ?auto_47501 ?auto_47504 ) ) ( not ( = ?auto_47502 ?auto_47504 ) ) ( TRUCK-AT ?auto_47508 ?auto_47507 ) ( LIFTING ?auto_47506 ?auto_47509 ) ( IS-CRATE ?auto_47509 ) ( not ( = ?auto_47501 ?auto_47509 ) ) ( not ( = ?auto_47502 ?auto_47509 ) ) ( not ( = ?auto_47504 ?auto_47509 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47506 ?auto_47509 ?auto_47508 ?auto_47507 )
      ( MAKE-ON ?auto_47501 ?auto_47502 )
      ( MAKE-ON-VERIFY ?auto_47501 ?auto_47502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47617 - SURFACE
      ?auto_47618 - SURFACE
    )
    :vars
    (
      ?auto_47623 - HOIST
      ?auto_47620 - PLACE
      ?auto_47619 - TRUCK
      ?auto_47622 - PLACE
      ?auto_47624 - HOIST
      ?auto_47621 - SURFACE
      ?auto_47625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47623 ?auto_47620 ) ( SURFACE-AT ?auto_47618 ?auto_47620 ) ( CLEAR ?auto_47618 ) ( IS-CRATE ?auto_47617 ) ( not ( = ?auto_47617 ?auto_47618 ) ) ( AVAILABLE ?auto_47623 ) ( TRUCK-AT ?auto_47619 ?auto_47622 ) ( not ( = ?auto_47622 ?auto_47620 ) ) ( HOIST-AT ?auto_47624 ?auto_47622 ) ( not ( = ?auto_47623 ?auto_47624 ) ) ( SURFACE-AT ?auto_47617 ?auto_47622 ) ( ON ?auto_47617 ?auto_47621 ) ( CLEAR ?auto_47617 ) ( not ( = ?auto_47617 ?auto_47621 ) ) ( not ( = ?auto_47618 ?auto_47621 ) ) ( LIFTING ?auto_47624 ?auto_47625 ) ( IS-CRATE ?auto_47625 ) ( not ( = ?auto_47617 ?auto_47625 ) ) ( not ( = ?auto_47618 ?auto_47625 ) ) ( not ( = ?auto_47621 ?auto_47625 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47624 ?auto_47625 ?auto_47619 ?auto_47622 )
      ( MAKE-ON ?auto_47617 ?auto_47618 )
      ( MAKE-ON-VERIFY ?auto_47617 ?auto_47618 ) )
  )

)

