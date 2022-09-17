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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166261 - SURFACE
      ?auto_166262 - SURFACE
    )
    :vars
    (
      ?auto_166263 - HOIST
      ?auto_166264 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166263 ?auto_166264 ) ( SURFACE-AT ?auto_166261 ?auto_166264 ) ( CLEAR ?auto_166261 ) ( LIFTING ?auto_166263 ?auto_166262 ) ( IS-CRATE ?auto_166262 ) ( not ( = ?auto_166261 ?auto_166262 ) ) )
    :subtasks
    ( ( !DROP ?auto_166263 ?auto_166262 ?auto_166261 ?auto_166264 )
      ( MAKE-1CRATE-VERIFY ?auto_166261 ?auto_166262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166265 - SURFACE
      ?auto_166266 - SURFACE
    )
    :vars
    (
      ?auto_166268 - HOIST
      ?auto_166267 - PLACE
      ?auto_166269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166268 ?auto_166267 ) ( SURFACE-AT ?auto_166265 ?auto_166267 ) ( CLEAR ?auto_166265 ) ( IS-CRATE ?auto_166266 ) ( not ( = ?auto_166265 ?auto_166266 ) ) ( TRUCK-AT ?auto_166269 ?auto_166267 ) ( AVAILABLE ?auto_166268 ) ( IN ?auto_166266 ?auto_166269 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166268 ?auto_166266 ?auto_166269 ?auto_166267 )
      ( MAKE-1CRATE ?auto_166265 ?auto_166266 )
      ( MAKE-1CRATE-VERIFY ?auto_166265 ?auto_166266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166270 - SURFACE
      ?auto_166271 - SURFACE
    )
    :vars
    (
      ?auto_166273 - HOIST
      ?auto_166272 - PLACE
      ?auto_166274 - TRUCK
      ?auto_166275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166273 ?auto_166272 ) ( SURFACE-AT ?auto_166270 ?auto_166272 ) ( CLEAR ?auto_166270 ) ( IS-CRATE ?auto_166271 ) ( not ( = ?auto_166270 ?auto_166271 ) ) ( AVAILABLE ?auto_166273 ) ( IN ?auto_166271 ?auto_166274 ) ( TRUCK-AT ?auto_166274 ?auto_166275 ) ( not ( = ?auto_166275 ?auto_166272 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166274 ?auto_166275 ?auto_166272 )
      ( MAKE-1CRATE ?auto_166270 ?auto_166271 )
      ( MAKE-1CRATE-VERIFY ?auto_166270 ?auto_166271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166276 - SURFACE
      ?auto_166277 - SURFACE
    )
    :vars
    (
      ?auto_166278 - HOIST
      ?auto_166279 - PLACE
      ?auto_166280 - TRUCK
      ?auto_166281 - PLACE
      ?auto_166282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166278 ?auto_166279 ) ( SURFACE-AT ?auto_166276 ?auto_166279 ) ( CLEAR ?auto_166276 ) ( IS-CRATE ?auto_166277 ) ( not ( = ?auto_166276 ?auto_166277 ) ) ( AVAILABLE ?auto_166278 ) ( TRUCK-AT ?auto_166280 ?auto_166281 ) ( not ( = ?auto_166281 ?auto_166279 ) ) ( HOIST-AT ?auto_166282 ?auto_166281 ) ( LIFTING ?auto_166282 ?auto_166277 ) ( not ( = ?auto_166278 ?auto_166282 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166282 ?auto_166277 ?auto_166280 ?auto_166281 )
      ( MAKE-1CRATE ?auto_166276 ?auto_166277 )
      ( MAKE-1CRATE-VERIFY ?auto_166276 ?auto_166277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166283 - SURFACE
      ?auto_166284 - SURFACE
    )
    :vars
    (
      ?auto_166285 - HOIST
      ?auto_166286 - PLACE
      ?auto_166289 - TRUCK
      ?auto_166288 - PLACE
      ?auto_166287 - HOIST
      ?auto_166290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166285 ?auto_166286 ) ( SURFACE-AT ?auto_166283 ?auto_166286 ) ( CLEAR ?auto_166283 ) ( IS-CRATE ?auto_166284 ) ( not ( = ?auto_166283 ?auto_166284 ) ) ( AVAILABLE ?auto_166285 ) ( TRUCK-AT ?auto_166289 ?auto_166288 ) ( not ( = ?auto_166288 ?auto_166286 ) ) ( HOIST-AT ?auto_166287 ?auto_166288 ) ( not ( = ?auto_166285 ?auto_166287 ) ) ( AVAILABLE ?auto_166287 ) ( SURFACE-AT ?auto_166284 ?auto_166288 ) ( ON ?auto_166284 ?auto_166290 ) ( CLEAR ?auto_166284 ) ( not ( = ?auto_166283 ?auto_166290 ) ) ( not ( = ?auto_166284 ?auto_166290 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166287 ?auto_166284 ?auto_166290 ?auto_166288 )
      ( MAKE-1CRATE ?auto_166283 ?auto_166284 )
      ( MAKE-1CRATE-VERIFY ?auto_166283 ?auto_166284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166291 - SURFACE
      ?auto_166292 - SURFACE
    )
    :vars
    (
      ?auto_166293 - HOIST
      ?auto_166297 - PLACE
      ?auto_166294 - PLACE
      ?auto_166296 - HOIST
      ?auto_166295 - SURFACE
      ?auto_166298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166293 ?auto_166297 ) ( SURFACE-AT ?auto_166291 ?auto_166297 ) ( CLEAR ?auto_166291 ) ( IS-CRATE ?auto_166292 ) ( not ( = ?auto_166291 ?auto_166292 ) ) ( AVAILABLE ?auto_166293 ) ( not ( = ?auto_166294 ?auto_166297 ) ) ( HOIST-AT ?auto_166296 ?auto_166294 ) ( not ( = ?auto_166293 ?auto_166296 ) ) ( AVAILABLE ?auto_166296 ) ( SURFACE-AT ?auto_166292 ?auto_166294 ) ( ON ?auto_166292 ?auto_166295 ) ( CLEAR ?auto_166292 ) ( not ( = ?auto_166291 ?auto_166295 ) ) ( not ( = ?auto_166292 ?auto_166295 ) ) ( TRUCK-AT ?auto_166298 ?auto_166297 ) )
    :subtasks
    ( ( !DRIVE ?auto_166298 ?auto_166297 ?auto_166294 )
      ( MAKE-1CRATE ?auto_166291 ?auto_166292 )
      ( MAKE-1CRATE-VERIFY ?auto_166291 ?auto_166292 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166308 - SURFACE
      ?auto_166309 - SURFACE
      ?auto_166310 - SURFACE
    )
    :vars
    (
      ?auto_166311 - HOIST
      ?auto_166312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166311 ?auto_166312 ) ( SURFACE-AT ?auto_166309 ?auto_166312 ) ( CLEAR ?auto_166309 ) ( LIFTING ?auto_166311 ?auto_166310 ) ( IS-CRATE ?auto_166310 ) ( not ( = ?auto_166309 ?auto_166310 ) ) ( ON ?auto_166309 ?auto_166308 ) ( not ( = ?auto_166308 ?auto_166309 ) ) ( not ( = ?auto_166308 ?auto_166310 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166309 ?auto_166310 )
      ( MAKE-2CRATE-VERIFY ?auto_166308 ?auto_166309 ?auto_166310 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166318 - SURFACE
      ?auto_166319 - SURFACE
      ?auto_166320 - SURFACE
    )
    :vars
    (
      ?auto_166321 - HOIST
      ?auto_166322 - PLACE
      ?auto_166323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166321 ?auto_166322 ) ( SURFACE-AT ?auto_166319 ?auto_166322 ) ( CLEAR ?auto_166319 ) ( IS-CRATE ?auto_166320 ) ( not ( = ?auto_166319 ?auto_166320 ) ) ( TRUCK-AT ?auto_166323 ?auto_166322 ) ( AVAILABLE ?auto_166321 ) ( IN ?auto_166320 ?auto_166323 ) ( ON ?auto_166319 ?auto_166318 ) ( not ( = ?auto_166318 ?auto_166319 ) ) ( not ( = ?auto_166318 ?auto_166320 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166319 ?auto_166320 )
      ( MAKE-2CRATE-VERIFY ?auto_166318 ?auto_166319 ?auto_166320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166324 - SURFACE
      ?auto_166325 - SURFACE
    )
    :vars
    (
      ?auto_166327 - HOIST
      ?auto_166328 - PLACE
      ?auto_166329 - TRUCK
      ?auto_166326 - SURFACE
      ?auto_166330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166327 ?auto_166328 ) ( SURFACE-AT ?auto_166324 ?auto_166328 ) ( CLEAR ?auto_166324 ) ( IS-CRATE ?auto_166325 ) ( not ( = ?auto_166324 ?auto_166325 ) ) ( AVAILABLE ?auto_166327 ) ( IN ?auto_166325 ?auto_166329 ) ( ON ?auto_166324 ?auto_166326 ) ( not ( = ?auto_166326 ?auto_166324 ) ) ( not ( = ?auto_166326 ?auto_166325 ) ) ( TRUCK-AT ?auto_166329 ?auto_166330 ) ( not ( = ?auto_166330 ?auto_166328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166329 ?auto_166330 ?auto_166328 )
      ( MAKE-2CRATE ?auto_166326 ?auto_166324 ?auto_166325 )
      ( MAKE-1CRATE-VERIFY ?auto_166324 ?auto_166325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166331 - SURFACE
      ?auto_166332 - SURFACE
      ?auto_166333 - SURFACE
    )
    :vars
    (
      ?auto_166336 - HOIST
      ?auto_166335 - PLACE
      ?auto_166334 - TRUCK
      ?auto_166337 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166336 ?auto_166335 ) ( SURFACE-AT ?auto_166332 ?auto_166335 ) ( CLEAR ?auto_166332 ) ( IS-CRATE ?auto_166333 ) ( not ( = ?auto_166332 ?auto_166333 ) ) ( AVAILABLE ?auto_166336 ) ( IN ?auto_166333 ?auto_166334 ) ( ON ?auto_166332 ?auto_166331 ) ( not ( = ?auto_166331 ?auto_166332 ) ) ( not ( = ?auto_166331 ?auto_166333 ) ) ( TRUCK-AT ?auto_166334 ?auto_166337 ) ( not ( = ?auto_166337 ?auto_166335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166332 ?auto_166333 )
      ( MAKE-2CRATE-VERIFY ?auto_166331 ?auto_166332 ?auto_166333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166338 - SURFACE
      ?auto_166339 - SURFACE
    )
    :vars
    (
      ?auto_166343 - HOIST
      ?auto_166342 - PLACE
      ?auto_166341 - SURFACE
      ?auto_166344 - TRUCK
      ?auto_166340 - PLACE
      ?auto_166345 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166343 ?auto_166342 ) ( SURFACE-AT ?auto_166338 ?auto_166342 ) ( CLEAR ?auto_166338 ) ( IS-CRATE ?auto_166339 ) ( not ( = ?auto_166338 ?auto_166339 ) ) ( AVAILABLE ?auto_166343 ) ( ON ?auto_166338 ?auto_166341 ) ( not ( = ?auto_166341 ?auto_166338 ) ) ( not ( = ?auto_166341 ?auto_166339 ) ) ( TRUCK-AT ?auto_166344 ?auto_166340 ) ( not ( = ?auto_166340 ?auto_166342 ) ) ( HOIST-AT ?auto_166345 ?auto_166340 ) ( LIFTING ?auto_166345 ?auto_166339 ) ( not ( = ?auto_166343 ?auto_166345 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166345 ?auto_166339 ?auto_166344 ?auto_166340 )
      ( MAKE-2CRATE ?auto_166341 ?auto_166338 ?auto_166339 )
      ( MAKE-1CRATE-VERIFY ?auto_166338 ?auto_166339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166346 - SURFACE
      ?auto_166347 - SURFACE
      ?auto_166348 - SURFACE
    )
    :vars
    (
      ?auto_166351 - HOIST
      ?auto_166352 - PLACE
      ?auto_166353 - TRUCK
      ?auto_166349 - PLACE
      ?auto_166350 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166351 ?auto_166352 ) ( SURFACE-AT ?auto_166347 ?auto_166352 ) ( CLEAR ?auto_166347 ) ( IS-CRATE ?auto_166348 ) ( not ( = ?auto_166347 ?auto_166348 ) ) ( AVAILABLE ?auto_166351 ) ( ON ?auto_166347 ?auto_166346 ) ( not ( = ?auto_166346 ?auto_166347 ) ) ( not ( = ?auto_166346 ?auto_166348 ) ) ( TRUCK-AT ?auto_166353 ?auto_166349 ) ( not ( = ?auto_166349 ?auto_166352 ) ) ( HOIST-AT ?auto_166350 ?auto_166349 ) ( LIFTING ?auto_166350 ?auto_166348 ) ( not ( = ?auto_166351 ?auto_166350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166347 ?auto_166348 )
      ( MAKE-2CRATE-VERIFY ?auto_166346 ?auto_166347 ?auto_166348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166354 - SURFACE
      ?auto_166355 - SURFACE
    )
    :vars
    (
      ?auto_166360 - HOIST
      ?auto_166359 - PLACE
      ?auto_166356 - SURFACE
      ?auto_166361 - TRUCK
      ?auto_166357 - PLACE
      ?auto_166358 - HOIST
      ?auto_166362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166360 ?auto_166359 ) ( SURFACE-AT ?auto_166354 ?auto_166359 ) ( CLEAR ?auto_166354 ) ( IS-CRATE ?auto_166355 ) ( not ( = ?auto_166354 ?auto_166355 ) ) ( AVAILABLE ?auto_166360 ) ( ON ?auto_166354 ?auto_166356 ) ( not ( = ?auto_166356 ?auto_166354 ) ) ( not ( = ?auto_166356 ?auto_166355 ) ) ( TRUCK-AT ?auto_166361 ?auto_166357 ) ( not ( = ?auto_166357 ?auto_166359 ) ) ( HOIST-AT ?auto_166358 ?auto_166357 ) ( not ( = ?auto_166360 ?auto_166358 ) ) ( AVAILABLE ?auto_166358 ) ( SURFACE-AT ?auto_166355 ?auto_166357 ) ( ON ?auto_166355 ?auto_166362 ) ( CLEAR ?auto_166355 ) ( not ( = ?auto_166354 ?auto_166362 ) ) ( not ( = ?auto_166355 ?auto_166362 ) ) ( not ( = ?auto_166356 ?auto_166362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166358 ?auto_166355 ?auto_166362 ?auto_166357 )
      ( MAKE-2CRATE ?auto_166356 ?auto_166354 ?auto_166355 )
      ( MAKE-1CRATE-VERIFY ?auto_166354 ?auto_166355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166363 - SURFACE
      ?auto_166364 - SURFACE
      ?auto_166365 - SURFACE
    )
    :vars
    (
      ?auto_166370 - HOIST
      ?auto_166366 - PLACE
      ?auto_166371 - TRUCK
      ?auto_166369 - PLACE
      ?auto_166368 - HOIST
      ?auto_166367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166370 ?auto_166366 ) ( SURFACE-AT ?auto_166364 ?auto_166366 ) ( CLEAR ?auto_166364 ) ( IS-CRATE ?auto_166365 ) ( not ( = ?auto_166364 ?auto_166365 ) ) ( AVAILABLE ?auto_166370 ) ( ON ?auto_166364 ?auto_166363 ) ( not ( = ?auto_166363 ?auto_166364 ) ) ( not ( = ?auto_166363 ?auto_166365 ) ) ( TRUCK-AT ?auto_166371 ?auto_166369 ) ( not ( = ?auto_166369 ?auto_166366 ) ) ( HOIST-AT ?auto_166368 ?auto_166369 ) ( not ( = ?auto_166370 ?auto_166368 ) ) ( AVAILABLE ?auto_166368 ) ( SURFACE-AT ?auto_166365 ?auto_166369 ) ( ON ?auto_166365 ?auto_166367 ) ( CLEAR ?auto_166365 ) ( not ( = ?auto_166364 ?auto_166367 ) ) ( not ( = ?auto_166365 ?auto_166367 ) ) ( not ( = ?auto_166363 ?auto_166367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166364 ?auto_166365 )
      ( MAKE-2CRATE-VERIFY ?auto_166363 ?auto_166364 ?auto_166365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166372 - SURFACE
      ?auto_166373 - SURFACE
    )
    :vars
    (
      ?auto_166380 - HOIST
      ?auto_166376 - PLACE
      ?auto_166379 - SURFACE
      ?auto_166374 - PLACE
      ?auto_166375 - HOIST
      ?auto_166378 - SURFACE
      ?auto_166377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166380 ?auto_166376 ) ( SURFACE-AT ?auto_166372 ?auto_166376 ) ( CLEAR ?auto_166372 ) ( IS-CRATE ?auto_166373 ) ( not ( = ?auto_166372 ?auto_166373 ) ) ( AVAILABLE ?auto_166380 ) ( ON ?auto_166372 ?auto_166379 ) ( not ( = ?auto_166379 ?auto_166372 ) ) ( not ( = ?auto_166379 ?auto_166373 ) ) ( not ( = ?auto_166374 ?auto_166376 ) ) ( HOIST-AT ?auto_166375 ?auto_166374 ) ( not ( = ?auto_166380 ?auto_166375 ) ) ( AVAILABLE ?auto_166375 ) ( SURFACE-AT ?auto_166373 ?auto_166374 ) ( ON ?auto_166373 ?auto_166378 ) ( CLEAR ?auto_166373 ) ( not ( = ?auto_166372 ?auto_166378 ) ) ( not ( = ?auto_166373 ?auto_166378 ) ) ( not ( = ?auto_166379 ?auto_166378 ) ) ( TRUCK-AT ?auto_166377 ?auto_166376 ) )
    :subtasks
    ( ( !DRIVE ?auto_166377 ?auto_166376 ?auto_166374 )
      ( MAKE-2CRATE ?auto_166379 ?auto_166372 ?auto_166373 )
      ( MAKE-1CRATE-VERIFY ?auto_166372 ?auto_166373 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166381 - SURFACE
      ?auto_166382 - SURFACE
      ?auto_166383 - SURFACE
    )
    :vars
    (
      ?auto_166386 - HOIST
      ?auto_166389 - PLACE
      ?auto_166385 - PLACE
      ?auto_166387 - HOIST
      ?auto_166388 - SURFACE
      ?auto_166384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166386 ?auto_166389 ) ( SURFACE-AT ?auto_166382 ?auto_166389 ) ( CLEAR ?auto_166382 ) ( IS-CRATE ?auto_166383 ) ( not ( = ?auto_166382 ?auto_166383 ) ) ( AVAILABLE ?auto_166386 ) ( ON ?auto_166382 ?auto_166381 ) ( not ( = ?auto_166381 ?auto_166382 ) ) ( not ( = ?auto_166381 ?auto_166383 ) ) ( not ( = ?auto_166385 ?auto_166389 ) ) ( HOIST-AT ?auto_166387 ?auto_166385 ) ( not ( = ?auto_166386 ?auto_166387 ) ) ( AVAILABLE ?auto_166387 ) ( SURFACE-AT ?auto_166383 ?auto_166385 ) ( ON ?auto_166383 ?auto_166388 ) ( CLEAR ?auto_166383 ) ( not ( = ?auto_166382 ?auto_166388 ) ) ( not ( = ?auto_166383 ?auto_166388 ) ) ( not ( = ?auto_166381 ?auto_166388 ) ) ( TRUCK-AT ?auto_166384 ?auto_166389 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166382 ?auto_166383 )
      ( MAKE-2CRATE-VERIFY ?auto_166381 ?auto_166382 ?auto_166383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166390 - SURFACE
      ?auto_166391 - SURFACE
    )
    :vars
    (
      ?auto_166398 - HOIST
      ?auto_166397 - PLACE
      ?auto_166392 - SURFACE
      ?auto_166393 - PLACE
      ?auto_166395 - HOIST
      ?auto_166396 - SURFACE
      ?auto_166394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166398 ?auto_166397 ) ( IS-CRATE ?auto_166391 ) ( not ( = ?auto_166390 ?auto_166391 ) ) ( not ( = ?auto_166392 ?auto_166390 ) ) ( not ( = ?auto_166392 ?auto_166391 ) ) ( not ( = ?auto_166393 ?auto_166397 ) ) ( HOIST-AT ?auto_166395 ?auto_166393 ) ( not ( = ?auto_166398 ?auto_166395 ) ) ( AVAILABLE ?auto_166395 ) ( SURFACE-AT ?auto_166391 ?auto_166393 ) ( ON ?auto_166391 ?auto_166396 ) ( CLEAR ?auto_166391 ) ( not ( = ?auto_166390 ?auto_166396 ) ) ( not ( = ?auto_166391 ?auto_166396 ) ) ( not ( = ?auto_166392 ?auto_166396 ) ) ( TRUCK-AT ?auto_166394 ?auto_166397 ) ( SURFACE-AT ?auto_166392 ?auto_166397 ) ( CLEAR ?auto_166392 ) ( LIFTING ?auto_166398 ?auto_166390 ) ( IS-CRATE ?auto_166390 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166392 ?auto_166390 )
      ( MAKE-2CRATE ?auto_166392 ?auto_166390 ?auto_166391 )
      ( MAKE-1CRATE-VERIFY ?auto_166390 ?auto_166391 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166399 - SURFACE
      ?auto_166400 - SURFACE
      ?auto_166401 - SURFACE
    )
    :vars
    (
      ?auto_166407 - HOIST
      ?auto_166405 - PLACE
      ?auto_166402 - PLACE
      ?auto_166406 - HOIST
      ?auto_166404 - SURFACE
      ?auto_166403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166407 ?auto_166405 ) ( IS-CRATE ?auto_166401 ) ( not ( = ?auto_166400 ?auto_166401 ) ) ( not ( = ?auto_166399 ?auto_166400 ) ) ( not ( = ?auto_166399 ?auto_166401 ) ) ( not ( = ?auto_166402 ?auto_166405 ) ) ( HOIST-AT ?auto_166406 ?auto_166402 ) ( not ( = ?auto_166407 ?auto_166406 ) ) ( AVAILABLE ?auto_166406 ) ( SURFACE-AT ?auto_166401 ?auto_166402 ) ( ON ?auto_166401 ?auto_166404 ) ( CLEAR ?auto_166401 ) ( not ( = ?auto_166400 ?auto_166404 ) ) ( not ( = ?auto_166401 ?auto_166404 ) ) ( not ( = ?auto_166399 ?auto_166404 ) ) ( TRUCK-AT ?auto_166403 ?auto_166405 ) ( SURFACE-AT ?auto_166399 ?auto_166405 ) ( CLEAR ?auto_166399 ) ( LIFTING ?auto_166407 ?auto_166400 ) ( IS-CRATE ?auto_166400 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166400 ?auto_166401 )
      ( MAKE-2CRATE-VERIFY ?auto_166399 ?auto_166400 ?auto_166401 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166408 - SURFACE
      ?auto_166409 - SURFACE
    )
    :vars
    (
      ?auto_166412 - HOIST
      ?auto_166413 - PLACE
      ?auto_166414 - SURFACE
      ?auto_166410 - PLACE
      ?auto_166415 - HOIST
      ?auto_166411 - SURFACE
      ?auto_166416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166412 ?auto_166413 ) ( IS-CRATE ?auto_166409 ) ( not ( = ?auto_166408 ?auto_166409 ) ) ( not ( = ?auto_166414 ?auto_166408 ) ) ( not ( = ?auto_166414 ?auto_166409 ) ) ( not ( = ?auto_166410 ?auto_166413 ) ) ( HOIST-AT ?auto_166415 ?auto_166410 ) ( not ( = ?auto_166412 ?auto_166415 ) ) ( AVAILABLE ?auto_166415 ) ( SURFACE-AT ?auto_166409 ?auto_166410 ) ( ON ?auto_166409 ?auto_166411 ) ( CLEAR ?auto_166409 ) ( not ( = ?auto_166408 ?auto_166411 ) ) ( not ( = ?auto_166409 ?auto_166411 ) ) ( not ( = ?auto_166414 ?auto_166411 ) ) ( TRUCK-AT ?auto_166416 ?auto_166413 ) ( SURFACE-AT ?auto_166414 ?auto_166413 ) ( CLEAR ?auto_166414 ) ( IS-CRATE ?auto_166408 ) ( AVAILABLE ?auto_166412 ) ( IN ?auto_166408 ?auto_166416 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166412 ?auto_166408 ?auto_166416 ?auto_166413 )
      ( MAKE-2CRATE ?auto_166414 ?auto_166408 ?auto_166409 )
      ( MAKE-1CRATE-VERIFY ?auto_166408 ?auto_166409 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166417 - SURFACE
      ?auto_166418 - SURFACE
      ?auto_166419 - SURFACE
    )
    :vars
    (
      ?auto_166421 - HOIST
      ?auto_166425 - PLACE
      ?auto_166423 - PLACE
      ?auto_166424 - HOIST
      ?auto_166420 - SURFACE
      ?auto_166422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166421 ?auto_166425 ) ( IS-CRATE ?auto_166419 ) ( not ( = ?auto_166418 ?auto_166419 ) ) ( not ( = ?auto_166417 ?auto_166418 ) ) ( not ( = ?auto_166417 ?auto_166419 ) ) ( not ( = ?auto_166423 ?auto_166425 ) ) ( HOIST-AT ?auto_166424 ?auto_166423 ) ( not ( = ?auto_166421 ?auto_166424 ) ) ( AVAILABLE ?auto_166424 ) ( SURFACE-AT ?auto_166419 ?auto_166423 ) ( ON ?auto_166419 ?auto_166420 ) ( CLEAR ?auto_166419 ) ( not ( = ?auto_166418 ?auto_166420 ) ) ( not ( = ?auto_166419 ?auto_166420 ) ) ( not ( = ?auto_166417 ?auto_166420 ) ) ( TRUCK-AT ?auto_166422 ?auto_166425 ) ( SURFACE-AT ?auto_166417 ?auto_166425 ) ( CLEAR ?auto_166417 ) ( IS-CRATE ?auto_166418 ) ( AVAILABLE ?auto_166421 ) ( IN ?auto_166418 ?auto_166422 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166418 ?auto_166419 )
      ( MAKE-2CRATE-VERIFY ?auto_166417 ?auto_166418 ?auto_166419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166462 - SURFACE
      ?auto_166463 - SURFACE
    )
    :vars
    (
      ?auto_166466 - HOIST
      ?auto_166465 - PLACE
      ?auto_166468 - SURFACE
      ?auto_166469 - PLACE
      ?auto_166467 - HOIST
      ?auto_166464 - SURFACE
      ?auto_166470 - TRUCK
      ?auto_166471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166466 ?auto_166465 ) ( SURFACE-AT ?auto_166462 ?auto_166465 ) ( CLEAR ?auto_166462 ) ( IS-CRATE ?auto_166463 ) ( not ( = ?auto_166462 ?auto_166463 ) ) ( AVAILABLE ?auto_166466 ) ( ON ?auto_166462 ?auto_166468 ) ( not ( = ?auto_166468 ?auto_166462 ) ) ( not ( = ?auto_166468 ?auto_166463 ) ) ( not ( = ?auto_166469 ?auto_166465 ) ) ( HOIST-AT ?auto_166467 ?auto_166469 ) ( not ( = ?auto_166466 ?auto_166467 ) ) ( AVAILABLE ?auto_166467 ) ( SURFACE-AT ?auto_166463 ?auto_166469 ) ( ON ?auto_166463 ?auto_166464 ) ( CLEAR ?auto_166463 ) ( not ( = ?auto_166462 ?auto_166464 ) ) ( not ( = ?auto_166463 ?auto_166464 ) ) ( not ( = ?auto_166468 ?auto_166464 ) ) ( TRUCK-AT ?auto_166470 ?auto_166471 ) ( not ( = ?auto_166471 ?auto_166465 ) ) ( not ( = ?auto_166469 ?auto_166471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166470 ?auto_166471 ?auto_166465 )
      ( MAKE-1CRATE ?auto_166462 ?auto_166463 )
      ( MAKE-1CRATE-VERIFY ?auto_166462 ?auto_166463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166502 - SURFACE
      ?auto_166503 - SURFACE
      ?auto_166504 - SURFACE
      ?auto_166501 - SURFACE
    )
    :vars
    (
      ?auto_166506 - HOIST
      ?auto_166505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166506 ?auto_166505 ) ( SURFACE-AT ?auto_166504 ?auto_166505 ) ( CLEAR ?auto_166504 ) ( LIFTING ?auto_166506 ?auto_166501 ) ( IS-CRATE ?auto_166501 ) ( not ( = ?auto_166504 ?auto_166501 ) ) ( ON ?auto_166503 ?auto_166502 ) ( ON ?auto_166504 ?auto_166503 ) ( not ( = ?auto_166502 ?auto_166503 ) ) ( not ( = ?auto_166502 ?auto_166504 ) ) ( not ( = ?auto_166502 ?auto_166501 ) ) ( not ( = ?auto_166503 ?auto_166504 ) ) ( not ( = ?auto_166503 ?auto_166501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166504 ?auto_166501 )
      ( MAKE-3CRATE-VERIFY ?auto_166502 ?auto_166503 ?auto_166504 ?auto_166501 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166519 - SURFACE
      ?auto_166520 - SURFACE
      ?auto_166521 - SURFACE
      ?auto_166518 - SURFACE
    )
    :vars
    (
      ?auto_166523 - HOIST
      ?auto_166524 - PLACE
      ?auto_166522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166523 ?auto_166524 ) ( SURFACE-AT ?auto_166521 ?auto_166524 ) ( CLEAR ?auto_166521 ) ( IS-CRATE ?auto_166518 ) ( not ( = ?auto_166521 ?auto_166518 ) ) ( TRUCK-AT ?auto_166522 ?auto_166524 ) ( AVAILABLE ?auto_166523 ) ( IN ?auto_166518 ?auto_166522 ) ( ON ?auto_166521 ?auto_166520 ) ( not ( = ?auto_166520 ?auto_166521 ) ) ( not ( = ?auto_166520 ?auto_166518 ) ) ( ON ?auto_166520 ?auto_166519 ) ( not ( = ?auto_166519 ?auto_166520 ) ) ( not ( = ?auto_166519 ?auto_166521 ) ) ( not ( = ?auto_166519 ?auto_166518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166520 ?auto_166521 ?auto_166518 )
      ( MAKE-3CRATE-VERIFY ?auto_166519 ?auto_166520 ?auto_166521 ?auto_166518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166540 - SURFACE
      ?auto_166541 - SURFACE
      ?auto_166542 - SURFACE
      ?auto_166539 - SURFACE
    )
    :vars
    (
      ?auto_166546 - HOIST
      ?auto_166545 - PLACE
      ?auto_166544 - TRUCK
      ?auto_166543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166546 ?auto_166545 ) ( SURFACE-AT ?auto_166542 ?auto_166545 ) ( CLEAR ?auto_166542 ) ( IS-CRATE ?auto_166539 ) ( not ( = ?auto_166542 ?auto_166539 ) ) ( AVAILABLE ?auto_166546 ) ( IN ?auto_166539 ?auto_166544 ) ( ON ?auto_166542 ?auto_166541 ) ( not ( = ?auto_166541 ?auto_166542 ) ) ( not ( = ?auto_166541 ?auto_166539 ) ) ( TRUCK-AT ?auto_166544 ?auto_166543 ) ( not ( = ?auto_166543 ?auto_166545 ) ) ( ON ?auto_166541 ?auto_166540 ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( not ( = ?auto_166540 ?auto_166542 ) ) ( not ( = ?auto_166540 ?auto_166539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166541 ?auto_166542 ?auto_166539 )
      ( MAKE-3CRATE-VERIFY ?auto_166540 ?auto_166541 ?auto_166542 ?auto_166539 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166564 - SURFACE
      ?auto_166565 - SURFACE
      ?auto_166566 - SURFACE
      ?auto_166563 - SURFACE
    )
    :vars
    (
      ?auto_166570 - HOIST
      ?auto_166571 - PLACE
      ?auto_166567 - TRUCK
      ?auto_166568 - PLACE
      ?auto_166569 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166570 ?auto_166571 ) ( SURFACE-AT ?auto_166566 ?auto_166571 ) ( CLEAR ?auto_166566 ) ( IS-CRATE ?auto_166563 ) ( not ( = ?auto_166566 ?auto_166563 ) ) ( AVAILABLE ?auto_166570 ) ( ON ?auto_166566 ?auto_166565 ) ( not ( = ?auto_166565 ?auto_166566 ) ) ( not ( = ?auto_166565 ?auto_166563 ) ) ( TRUCK-AT ?auto_166567 ?auto_166568 ) ( not ( = ?auto_166568 ?auto_166571 ) ) ( HOIST-AT ?auto_166569 ?auto_166568 ) ( LIFTING ?auto_166569 ?auto_166563 ) ( not ( = ?auto_166570 ?auto_166569 ) ) ( ON ?auto_166565 ?auto_166564 ) ( not ( = ?auto_166564 ?auto_166565 ) ) ( not ( = ?auto_166564 ?auto_166566 ) ) ( not ( = ?auto_166564 ?auto_166563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166565 ?auto_166566 ?auto_166563 )
      ( MAKE-3CRATE-VERIFY ?auto_166564 ?auto_166565 ?auto_166566 ?auto_166563 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166591 - SURFACE
      ?auto_166592 - SURFACE
      ?auto_166593 - SURFACE
      ?auto_166590 - SURFACE
    )
    :vars
    (
      ?auto_166594 - HOIST
      ?auto_166598 - PLACE
      ?auto_166597 - TRUCK
      ?auto_166599 - PLACE
      ?auto_166595 - HOIST
      ?auto_166596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166594 ?auto_166598 ) ( SURFACE-AT ?auto_166593 ?auto_166598 ) ( CLEAR ?auto_166593 ) ( IS-CRATE ?auto_166590 ) ( not ( = ?auto_166593 ?auto_166590 ) ) ( AVAILABLE ?auto_166594 ) ( ON ?auto_166593 ?auto_166592 ) ( not ( = ?auto_166592 ?auto_166593 ) ) ( not ( = ?auto_166592 ?auto_166590 ) ) ( TRUCK-AT ?auto_166597 ?auto_166599 ) ( not ( = ?auto_166599 ?auto_166598 ) ) ( HOIST-AT ?auto_166595 ?auto_166599 ) ( not ( = ?auto_166594 ?auto_166595 ) ) ( AVAILABLE ?auto_166595 ) ( SURFACE-AT ?auto_166590 ?auto_166599 ) ( ON ?auto_166590 ?auto_166596 ) ( CLEAR ?auto_166590 ) ( not ( = ?auto_166593 ?auto_166596 ) ) ( not ( = ?auto_166590 ?auto_166596 ) ) ( not ( = ?auto_166592 ?auto_166596 ) ) ( ON ?auto_166592 ?auto_166591 ) ( not ( = ?auto_166591 ?auto_166592 ) ) ( not ( = ?auto_166591 ?auto_166593 ) ) ( not ( = ?auto_166591 ?auto_166590 ) ) ( not ( = ?auto_166591 ?auto_166596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166592 ?auto_166593 ?auto_166590 )
      ( MAKE-3CRATE-VERIFY ?auto_166591 ?auto_166592 ?auto_166593 ?auto_166590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166619 - SURFACE
      ?auto_166620 - SURFACE
      ?auto_166621 - SURFACE
      ?auto_166618 - SURFACE
    )
    :vars
    (
      ?auto_166624 - HOIST
      ?auto_166627 - PLACE
      ?auto_166626 - PLACE
      ?auto_166623 - HOIST
      ?auto_166622 - SURFACE
      ?auto_166625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166624 ?auto_166627 ) ( SURFACE-AT ?auto_166621 ?auto_166627 ) ( CLEAR ?auto_166621 ) ( IS-CRATE ?auto_166618 ) ( not ( = ?auto_166621 ?auto_166618 ) ) ( AVAILABLE ?auto_166624 ) ( ON ?auto_166621 ?auto_166620 ) ( not ( = ?auto_166620 ?auto_166621 ) ) ( not ( = ?auto_166620 ?auto_166618 ) ) ( not ( = ?auto_166626 ?auto_166627 ) ) ( HOIST-AT ?auto_166623 ?auto_166626 ) ( not ( = ?auto_166624 ?auto_166623 ) ) ( AVAILABLE ?auto_166623 ) ( SURFACE-AT ?auto_166618 ?auto_166626 ) ( ON ?auto_166618 ?auto_166622 ) ( CLEAR ?auto_166618 ) ( not ( = ?auto_166621 ?auto_166622 ) ) ( not ( = ?auto_166618 ?auto_166622 ) ) ( not ( = ?auto_166620 ?auto_166622 ) ) ( TRUCK-AT ?auto_166625 ?auto_166627 ) ( ON ?auto_166620 ?auto_166619 ) ( not ( = ?auto_166619 ?auto_166620 ) ) ( not ( = ?auto_166619 ?auto_166621 ) ) ( not ( = ?auto_166619 ?auto_166618 ) ) ( not ( = ?auto_166619 ?auto_166622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166620 ?auto_166621 ?auto_166618 )
      ( MAKE-3CRATE-VERIFY ?auto_166619 ?auto_166620 ?auto_166621 ?auto_166618 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166647 - SURFACE
      ?auto_166648 - SURFACE
      ?auto_166649 - SURFACE
      ?auto_166646 - SURFACE
    )
    :vars
    (
      ?auto_166653 - HOIST
      ?auto_166652 - PLACE
      ?auto_166655 - PLACE
      ?auto_166651 - HOIST
      ?auto_166650 - SURFACE
      ?auto_166654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166653 ?auto_166652 ) ( IS-CRATE ?auto_166646 ) ( not ( = ?auto_166649 ?auto_166646 ) ) ( not ( = ?auto_166648 ?auto_166649 ) ) ( not ( = ?auto_166648 ?auto_166646 ) ) ( not ( = ?auto_166655 ?auto_166652 ) ) ( HOIST-AT ?auto_166651 ?auto_166655 ) ( not ( = ?auto_166653 ?auto_166651 ) ) ( AVAILABLE ?auto_166651 ) ( SURFACE-AT ?auto_166646 ?auto_166655 ) ( ON ?auto_166646 ?auto_166650 ) ( CLEAR ?auto_166646 ) ( not ( = ?auto_166649 ?auto_166650 ) ) ( not ( = ?auto_166646 ?auto_166650 ) ) ( not ( = ?auto_166648 ?auto_166650 ) ) ( TRUCK-AT ?auto_166654 ?auto_166652 ) ( SURFACE-AT ?auto_166648 ?auto_166652 ) ( CLEAR ?auto_166648 ) ( LIFTING ?auto_166653 ?auto_166649 ) ( IS-CRATE ?auto_166649 ) ( ON ?auto_166648 ?auto_166647 ) ( not ( = ?auto_166647 ?auto_166648 ) ) ( not ( = ?auto_166647 ?auto_166649 ) ) ( not ( = ?auto_166647 ?auto_166646 ) ) ( not ( = ?auto_166647 ?auto_166650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166648 ?auto_166649 ?auto_166646 )
      ( MAKE-3CRATE-VERIFY ?auto_166647 ?auto_166648 ?auto_166649 ?auto_166646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166675 - SURFACE
      ?auto_166676 - SURFACE
      ?auto_166677 - SURFACE
      ?auto_166674 - SURFACE
    )
    :vars
    (
      ?auto_166678 - HOIST
      ?auto_166681 - PLACE
      ?auto_166680 - PLACE
      ?auto_166679 - HOIST
      ?auto_166683 - SURFACE
      ?auto_166682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166678 ?auto_166681 ) ( IS-CRATE ?auto_166674 ) ( not ( = ?auto_166677 ?auto_166674 ) ) ( not ( = ?auto_166676 ?auto_166677 ) ) ( not ( = ?auto_166676 ?auto_166674 ) ) ( not ( = ?auto_166680 ?auto_166681 ) ) ( HOIST-AT ?auto_166679 ?auto_166680 ) ( not ( = ?auto_166678 ?auto_166679 ) ) ( AVAILABLE ?auto_166679 ) ( SURFACE-AT ?auto_166674 ?auto_166680 ) ( ON ?auto_166674 ?auto_166683 ) ( CLEAR ?auto_166674 ) ( not ( = ?auto_166677 ?auto_166683 ) ) ( not ( = ?auto_166674 ?auto_166683 ) ) ( not ( = ?auto_166676 ?auto_166683 ) ) ( TRUCK-AT ?auto_166682 ?auto_166681 ) ( SURFACE-AT ?auto_166676 ?auto_166681 ) ( CLEAR ?auto_166676 ) ( IS-CRATE ?auto_166677 ) ( AVAILABLE ?auto_166678 ) ( IN ?auto_166677 ?auto_166682 ) ( ON ?auto_166676 ?auto_166675 ) ( not ( = ?auto_166675 ?auto_166676 ) ) ( not ( = ?auto_166675 ?auto_166677 ) ) ( not ( = ?auto_166675 ?auto_166674 ) ) ( not ( = ?auto_166675 ?auto_166683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166676 ?auto_166677 ?auto_166674 )
      ( MAKE-3CRATE-VERIFY ?auto_166675 ?auto_166676 ?auto_166677 ?auto_166674 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_166966 - SURFACE
      ?auto_166967 - SURFACE
      ?auto_166968 - SURFACE
      ?auto_166965 - SURFACE
      ?auto_166969 - SURFACE
    )
    :vars
    (
      ?auto_166971 - HOIST
      ?auto_166970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166971 ?auto_166970 ) ( SURFACE-AT ?auto_166965 ?auto_166970 ) ( CLEAR ?auto_166965 ) ( LIFTING ?auto_166971 ?auto_166969 ) ( IS-CRATE ?auto_166969 ) ( not ( = ?auto_166965 ?auto_166969 ) ) ( ON ?auto_166967 ?auto_166966 ) ( ON ?auto_166968 ?auto_166967 ) ( ON ?auto_166965 ?auto_166968 ) ( not ( = ?auto_166966 ?auto_166967 ) ) ( not ( = ?auto_166966 ?auto_166968 ) ) ( not ( = ?auto_166966 ?auto_166965 ) ) ( not ( = ?auto_166966 ?auto_166969 ) ) ( not ( = ?auto_166967 ?auto_166968 ) ) ( not ( = ?auto_166967 ?auto_166965 ) ) ( not ( = ?auto_166967 ?auto_166969 ) ) ( not ( = ?auto_166968 ?auto_166965 ) ) ( not ( = ?auto_166968 ?auto_166969 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166965 ?auto_166969 )
      ( MAKE-4CRATE-VERIFY ?auto_166966 ?auto_166967 ?auto_166968 ?auto_166965 ?auto_166969 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_166991 - SURFACE
      ?auto_166992 - SURFACE
      ?auto_166993 - SURFACE
      ?auto_166990 - SURFACE
      ?auto_166994 - SURFACE
    )
    :vars
    (
      ?auto_166997 - HOIST
      ?auto_166995 - PLACE
      ?auto_166996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166997 ?auto_166995 ) ( SURFACE-AT ?auto_166990 ?auto_166995 ) ( CLEAR ?auto_166990 ) ( IS-CRATE ?auto_166994 ) ( not ( = ?auto_166990 ?auto_166994 ) ) ( TRUCK-AT ?auto_166996 ?auto_166995 ) ( AVAILABLE ?auto_166997 ) ( IN ?auto_166994 ?auto_166996 ) ( ON ?auto_166990 ?auto_166993 ) ( not ( = ?auto_166993 ?auto_166990 ) ) ( not ( = ?auto_166993 ?auto_166994 ) ) ( ON ?auto_166992 ?auto_166991 ) ( ON ?auto_166993 ?auto_166992 ) ( not ( = ?auto_166991 ?auto_166992 ) ) ( not ( = ?auto_166991 ?auto_166993 ) ) ( not ( = ?auto_166991 ?auto_166990 ) ) ( not ( = ?auto_166991 ?auto_166994 ) ) ( not ( = ?auto_166992 ?auto_166993 ) ) ( not ( = ?auto_166992 ?auto_166990 ) ) ( not ( = ?auto_166992 ?auto_166994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166993 ?auto_166990 ?auto_166994 )
      ( MAKE-4CRATE-VERIFY ?auto_166991 ?auto_166992 ?auto_166993 ?auto_166990 ?auto_166994 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167021 - SURFACE
      ?auto_167022 - SURFACE
      ?auto_167023 - SURFACE
      ?auto_167020 - SURFACE
      ?auto_167024 - SURFACE
    )
    :vars
    (
      ?auto_167025 - HOIST
      ?auto_167028 - PLACE
      ?auto_167026 - TRUCK
      ?auto_167027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167025 ?auto_167028 ) ( SURFACE-AT ?auto_167020 ?auto_167028 ) ( CLEAR ?auto_167020 ) ( IS-CRATE ?auto_167024 ) ( not ( = ?auto_167020 ?auto_167024 ) ) ( AVAILABLE ?auto_167025 ) ( IN ?auto_167024 ?auto_167026 ) ( ON ?auto_167020 ?auto_167023 ) ( not ( = ?auto_167023 ?auto_167020 ) ) ( not ( = ?auto_167023 ?auto_167024 ) ) ( TRUCK-AT ?auto_167026 ?auto_167027 ) ( not ( = ?auto_167027 ?auto_167028 ) ) ( ON ?auto_167022 ?auto_167021 ) ( ON ?auto_167023 ?auto_167022 ) ( not ( = ?auto_167021 ?auto_167022 ) ) ( not ( = ?auto_167021 ?auto_167023 ) ) ( not ( = ?auto_167021 ?auto_167020 ) ) ( not ( = ?auto_167021 ?auto_167024 ) ) ( not ( = ?auto_167022 ?auto_167023 ) ) ( not ( = ?auto_167022 ?auto_167020 ) ) ( not ( = ?auto_167022 ?auto_167024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167023 ?auto_167020 ?auto_167024 )
      ( MAKE-4CRATE-VERIFY ?auto_167021 ?auto_167022 ?auto_167023 ?auto_167020 ?auto_167024 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167055 - SURFACE
      ?auto_167056 - SURFACE
      ?auto_167057 - SURFACE
      ?auto_167054 - SURFACE
      ?auto_167058 - SURFACE
    )
    :vars
    (
      ?auto_167062 - HOIST
      ?auto_167059 - PLACE
      ?auto_167060 - TRUCK
      ?auto_167063 - PLACE
      ?auto_167061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_167062 ?auto_167059 ) ( SURFACE-AT ?auto_167054 ?auto_167059 ) ( CLEAR ?auto_167054 ) ( IS-CRATE ?auto_167058 ) ( not ( = ?auto_167054 ?auto_167058 ) ) ( AVAILABLE ?auto_167062 ) ( ON ?auto_167054 ?auto_167057 ) ( not ( = ?auto_167057 ?auto_167054 ) ) ( not ( = ?auto_167057 ?auto_167058 ) ) ( TRUCK-AT ?auto_167060 ?auto_167063 ) ( not ( = ?auto_167063 ?auto_167059 ) ) ( HOIST-AT ?auto_167061 ?auto_167063 ) ( LIFTING ?auto_167061 ?auto_167058 ) ( not ( = ?auto_167062 ?auto_167061 ) ) ( ON ?auto_167056 ?auto_167055 ) ( ON ?auto_167057 ?auto_167056 ) ( not ( = ?auto_167055 ?auto_167056 ) ) ( not ( = ?auto_167055 ?auto_167057 ) ) ( not ( = ?auto_167055 ?auto_167054 ) ) ( not ( = ?auto_167055 ?auto_167058 ) ) ( not ( = ?auto_167056 ?auto_167057 ) ) ( not ( = ?auto_167056 ?auto_167054 ) ) ( not ( = ?auto_167056 ?auto_167058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167057 ?auto_167054 ?auto_167058 )
      ( MAKE-4CRATE-VERIFY ?auto_167055 ?auto_167056 ?auto_167057 ?auto_167054 ?auto_167058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167093 - SURFACE
      ?auto_167094 - SURFACE
      ?auto_167095 - SURFACE
      ?auto_167092 - SURFACE
      ?auto_167096 - SURFACE
    )
    :vars
    (
      ?auto_167101 - HOIST
      ?auto_167100 - PLACE
      ?auto_167098 - TRUCK
      ?auto_167099 - PLACE
      ?auto_167097 - HOIST
      ?auto_167102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167101 ?auto_167100 ) ( SURFACE-AT ?auto_167092 ?auto_167100 ) ( CLEAR ?auto_167092 ) ( IS-CRATE ?auto_167096 ) ( not ( = ?auto_167092 ?auto_167096 ) ) ( AVAILABLE ?auto_167101 ) ( ON ?auto_167092 ?auto_167095 ) ( not ( = ?auto_167095 ?auto_167092 ) ) ( not ( = ?auto_167095 ?auto_167096 ) ) ( TRUCK-AT ?auto_167098 ?auto_167099 ) ( not ( = ?auto_167099 ?auto_167100 ) ) ( HOIST-AT ?auto_167097 ?auto_167099 ) ( not ( = ?auto_167101 ?auto_167097 ) ) ( AVAILABLE ?auto_167097 ) ( SURFACE-AT ?auto_167096 ?auto_167099 ) ( ON ?auto_167096 ?auto_167102 ) ( CLEAR ?auto_167096 ) ( not ( = ?auto_167092 ?auto_167102 ) ) ( not ( = ?auto_167096 ?auto_167102 ) ) ( not ( = ?auto_167095 ?auto_167102 ) ) ( ON ?auto_167094 ?auto_167093 ) ( ON ?auto_167095 ?auto_167094 ) ( not ( = ?auto_167093 ?auto_167094 ) ) ( not ( = ?auto_167093 ?auto_167095 ) ) ( not ( = ?auto_167093 ?auto_167092 ) ) ( not ( = ?auto_167093 ?auto_167096 ) ) ( not ( = ?auto_167093 ?auto_167102 ) ) ( not ( = ?auto_167094 ?auto_167095 ) ) ( not ( = ?auto_167094 ?auto_167092 ) ) ( not ( = ?auto_167094 ?auto_167096 ) ) ( not ( = ?auto_167094 ?auto_167102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167095 ?auto_167092 ?auto_167096 )
      ( MAKE-4CRATE-VERIFY ?auto_167093 ?auto_167094 ?auto_167095 ?auto_167092 ?auto_167096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167132 - SURFACE
      ?auto_167133 - SURFACE
      ?auto_167134 - SURFACE
      ?auto_167131 - SURFACE
      ?auto_167135 - SURFACE
    )
    :vars
    (
      ?auto_167140 - HOIST
      ?auto_167136 - PLACE
      ?auto_167137 - PLACE
      ?auto_167139 - HOIST
      ?auto_167138 - SURFACE
      ?auto_167141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167140 ?auto_167136 ) ( SURFACE-AT ?auto_167131 ?auto_167136 ) ( CLEAR ?auto_167131 ) ( IS-CRATE ?auto_167135 ) ( not ( = ?auto_167131 ?auto_167135 ) ) ( AVAILABLE ?auto_167140 ) ( ON ?auto_167131 ?auto_167134 ) ( not ( = ?auto_167134 ?auto_167131 ) ) ( not ( = ?auto_167134 ?auto_167135 ) ) ( not ( = ?auto_167137 ?auto_167136 ) ) ( HOIST-AT ?auto_167139 ?auto_167137 ) ( not ( = ?auto_167140 ?auto_167139 ) ) ( AVAILABLE ?auto_167139 ) ( SURFACE-AT ?auto_167135 ?auto_167137 ) ( ON ?auto_167135 ?auto_167138 ) ( CLEAR ?auto_167135 ) ( not ( = ?auto_167131 ?auto_167138 ) ) ( not ( = ?auto_167135 ?auto_167138 ) ) ( not ( = ?auto_167134 ?auto_167138 ) ) ( TRUCK-AT ?auto_167141 ?auto_167136 ) ( ON ?auto_167133 ?auto_167132 ) ( ON ?auto_167134 ?auto_167133 ) ( not ( = ?auto_167132 ?auto_167133 ) ) ( not ( = ?auto_167132 ?auto_167134 ) ) ( not ( = ?auto_167132 ?auto_167131 ) ) ( not ( = ?auto_167132 ?auto_167135 ) ) ( not ( = ?auto_167132 ?auto_167138 ) ) ( not ( = ?auto_167133 ?auto_167134 ) ) ( not ( = ?auto_167133 ?auto_167131 ) ) ( not ( = ?auto_167133 ?auto_167135 ) ) ( not ( = ?auto_167133 ?auto_167138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167134 ?auto_167131 ?auto_167135 )
      ( MAKE-4CRATE-VERIFY ?auto_167132 ?auto_167133 ?auto_167134 ?auto_167131 ?auto_167135 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167171 - SURFACE
      ?auto_167172 - SURFACE
      ?auto_167173 - SURFACE
      ?auto_167170 - SURFACE
      ?auto_167174 - SURFACE
    )
    :vars
    (
      ?auto_167178 - HOIST
      ?auto_167179 - PLACE
      ?auto_167176 - PLACE
      ?auto_167175 - HOIST
      ?auto_167180 - SURFACE
      ?auto_167177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167178 ?auto_167179 ) ( IS-CRATE ?auto_167174 ) ( not ( = ?auto_167170 ?auto_167174 ) ) ( not ( = ?auto_167173 ?auto_167170 ) ) ( not ( = ?auto_167173 ?auto_167174 ) ) ( not ( = ?auto_167176 ?auto_167179 ) ) ( HOIST-AT ?auto_167175 ?auto_167176 ) ( not ( = ?auto_167178 ?auto_167175 ) ) ( AVAILABLE ?auto_167175 ) ( SURFACE-AT ?auto_167174 ?auto_167176 ) ( ON ?auto_167174 ?auto_167180 ) ( CLEAR ?auto_167174 ) ( not ( = ?auto_167170 ?auto_167180 ) ) ( not ( = ?auto_167174 ?auto_167180 ) ) ( not ( = ?auto_167173 ?auto_167180 ) ) ( TRUCK-AT ?auto_167177 ?auto_167179 ) ( SURFACE-AT ?auto_167173 ?auto_167179 ) ( CLEAR ?auto_167173 ) ( LIFTING ?auto_167178 ?auto_167170 ) ( IS-CRATE ?auto_167170 ) ( ON ?auto_167172 ?auto_167171 ) ( ON ?auto_167173 ?auto_167172 ) ( not ( = ?auto_167171 ?auto_167172 ) ) ( not ( = ?auto_167171 ?auto_167173 ) ) ( not ( = ?auto_167171 ?auto_167170 ) ) ( not ( = ?auto_167171 ?auto_167174 ) ) ( not ( = ?auto_167171 ?auto_167180 ) ) ( not ( = ?auto_167172 ?auto_167173 ) ) ( not ( = ?auto_167172 ?auto_167170 ) ) ( not ( = ?auto_167172 ?auto_167174 ) ) ( not ( = ?auto_167172 ?auto_167180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167173 ?auto_167170 ?auto_167174 )
      ( MAKE-4CRATE-VERIFY ?auto_167171 ?auto_167172 ?auto_167173 ?auto_167170 ?auto_167174 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167210 - SURFACE
      ?auto_167211 - SURFACE
      ?auto_167212 - SURFACE
      ?auto_167209 - SURFACE
      ?auto_167213 - SURFACE
    )
    :vars
    (
      ?auto_167214 - HOIST
      ?auto_167215 - PLACE
      ?auto_167216 - PLACE
      ?auto_167218 - HOIST
      ?auto_167217 - SURFACE
      ?auto_167219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167214 ?auto_167215 ) ( IS-CRATE ?auto_167213 ) ( not ( = ?auto_167209 ?auto_167213 ) ) ( not ( = ?auto_167212 ?auto_167209 ) ) ( not ( = ?auto_167212 ?auto_167213 ) ) ( not ( = ?auto_167216 ?auto_167215 ) ) ( HOIST-AT ?auto_167218 ?auto_167216 ) ( not ( = ?auto_167214 ?auto_167218 ) ) ( AVAILABLE ?auto_167218 ) ( SURFACE-AT ?auto_167213 ?auto_167216 ) ( ON ?auto_167213 ?auto_167217 ) ( CLEAR ?auto_167213 ) ( not ( = ?auto_167209 ?auto_167217 ) ) ( not ( = ?auto_167213 ?auto_167217 ) ) ( not ( = ?auto_167212 ?auto_167217 ) ) ( TRUCK-AT ?auto_167219 ?auto_167215 ) ( SURFACE-AT ?auto_167212 ?auto_167215 ) ( CLEAR ?auto_167212 ) ( IS-CRATE ?auto_167209 ) ( AVAILABLE ?auto_167214 ) ( IN ?auto_167209 ?auto_167219 ) ( ON ?auto_167211 ?auto_167210 ) ( ON ?auto_167212 ?auto_167211 ) ( not ( = ?auto_167210 ?auto_167211 ) ) ( not ( = ?auto_167210 ?auto_167212 ) ) ( not ( = ?auto_167210 ?auto_167209 ) ) ( not ( = ?auto_167210 ?auto_167213 ) ) ( not ( = ?auto_167210 ?auto_167217 ) ) ( not ( = ?auto_167211 ?auto_167212 ) ) ( not ( = ?auto_167211 ?auto_167209 ) ) ( not ( = ?auto_167211 ?auto_167213 ) ) ( not ( = ?auto_167211 ?auto_167217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167212 ?auto_167209 ?auto_167213 )
      ( MAKE-4CRATE-VERIFY ?auto_167210 ?auto_167211 ?auto_167212 ?auto_167209 ?auto_167213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167710 - SURFACE
      ?auto_167711 - SURFACE
    )
    :vars
    (
      ?auto_167713 - HOIST
      ?auto_167714 - PLACE
      ?auto_167715 - SURFACE
      ?auto_167716 - TRUCK
      ?auto_167718 - PLACE
      ?auto_167712 - HOIST
      ?auto_167717 - SURFACE
      ?auto_167719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167713 ?auto_167714 ) ( SURFACE-AT ?auto_167710 ?auto_167714 ) ( CLEAR ?auto_167710 ) ( IS-CRATE ?auto_167711 ) ( not ( = ?auto_167710 ?auto_167711 ) ) ( AVAILABLE ?auto_167713 ) ( ON ?auto_167710 ?auto_167715 ) ( not ( = ?auto_167715 ?auto_167710 ) ) ( not ( = ?auto_167715 ?auto_167711 ) ) ( TRUCK-AT ?auto_167716 ?auto_167718 ) ( not ( = ?auto_167718 ?auto_167714 ) ) ( HOIST-AT ?auto_167712 ?auto_167718 ) ( not ( = ?auto_167713 ?auto_167712 ) ) ( SURFACE-AT ?auto_167711 ?auto_167718 ) ( ON ?auto_167711 ?auto_167717 ) ( CLEAR ?auto_167711 ) ( not ( = ?auto_167710 ?auto_167717 ) ) ( not ( = ?auto_167711 ?auto_167717 ) ) ( not ( = ?auto_167715 ?auto_167717 ) ) ( LIFTING ?auto_167712 ?auto_167719 ) ( IS-CRATE ?auto_167719 ) ( not ( = ?auto_167710 ?auto_167719 ) ) ( not ( = ?auto_167711 ?auto_167719 ) ) ( not ( = ?auto_167715 ?auto_167719 ) ) ( not ( = ?auto_167717 ?auto_167719 ) ) )
    :subtasks
    ( ( !LOAD ?auto_167712 ?auto_167719 ?auto_167716 ?auto_167718 )
      ( MAKE-1CRATE ?auto_167710 ?auto_167711 )
      ( MAKE-1CRATE-VERIFY ?auto_167710 ?auto_167711 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167870 - SURFACE
      ?auto_167871 - SURFACE
      ?auto_167872 - SURFACE
      ?auto_167869 - SURFACE
      ?auto_167873 - SURFACE
      ?auto_167874 - SURFACE
    )
    :vars
    (
      ?auto_167876 - HOIST
      ?auto_167875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167876 ?auto_167875 ) ( SURFACE-AT ?auto_167873 ?auto_167875 ) ( CLEAR ?auto_167873 ) ( LIFTING ?auto_167876 ?auto_167874 ) ( IS-CRATE ?auto_167874 ) ( not ( = ?auto_167873 ?auto_167874 ) ) ( ON ?auto_167871 ?auto_167870 ) ( ON ?auto_167872 ?auto_167871 ) ( ON ?auto_167869 ?auto_167872 ) ( ON ?auto_167873 ?auto_167869 ) ( not ( = ?auto_167870 ?auto_167871 ) ) ( not ( = ?auto_167870 ?auto_167872 ) ) ( not ( = ?auto_167870 ?auto_167869 ) ) ( not ( = ?auto_167870 ?auto_167873 ) ) ( not ( = ?auto_167870 ?auto_167874 ) ) ( not ( = ?auto_167871 ?auto_167872 ) ) ( not ( = ?auto_167871 ?auto_167869 ) ) ( not ( = ?auto_167871 ?auto_167873 ) ) ( not ( = ?auto_167871 ?auto_167874 ) ) ( not ( = ?auto_167872 ?auto_167869 ) ) ( not ( = ?auto_167872 ?auto_167873 ) ) ( not ( = ?auto_167872 ?auto_167874 ) ) ( not ( = ?auto_167869 ?auto_167873 ) ) ( not ( = ?auto_167869 ?auto_167874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167873 ?auto_167874 )
      ( MAKE-5CRATE-VERIFY ?auto_167870 ?auto_167871 ?auto_167872 ?auto_167869 ?auto_167873 ?auto_167874 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167904 - SURFACE
      ?auto_167905 - SURFACE
      ?auto_167906 - SURFACE
      ?auto_167903 - SURFACE
      ?auto_167907 - SURFACE
      ?auto_167908 - SURFACE
    )
    :vars
    (
      ?auto_167909 - HOIST
      ?auto_167911 - PLACE
      ?auto_167910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167909 ?auto_167911 ) ( SURFACE-AT ?auto_167907 ?auto_167911 ) ( CLEAR ?auto_167907 ) ( IS-CRATE ?auto_167908 ) ( not ( = ?auto_167907 ?auto_167908 ) ) ( TRUCK-AT ?auto_167910 ?auto_167911 ) ( AVAILABLE ?auto_167909 ) ( IN ?auto_167908 ?auto_167910 ) ( ON ?auto_167907 ?auto_167903 ) ( not ( = ?auto_167903 ?auto_167907 ) ) ( not ( = ?auto_167903 ?auto_167908 ) ) ( ON ?auto_167905 ?auto_167904 ) ( ON ?auto_167906 ?auto_167905 ) ( ON ?auto_167903 ?auto_167906 ) ( not ( = ?auto_167904 ?auto_167905 ) ) ( not ( = ?auto_167904 ?auto_167906 ) ) ( not ( = ?auto_167904 ?auto_167903 ) ) ( not ( = ?auto_167904 ?auto_167907 ) ) ( not ( = ?auto_167904 ?auto_167908 ) ) ( not ( = ?auto_167905 ?auto_167906 ) ) ( not ( = ?auto_167905 ?auto_167903 ) ) ( not ( = ?auto_167905 ?auto_167907 ) ) ( not ( = ?auto_167905 ?auto_167908 ) ) ( not ( = ?auto_167906 ?auto_167903 ) ) ( not ( = ?auto_167906 ?auto_167907 ) ) ( not ( = ?auto_167906 ?auto_167908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167903 ?auto_167907 ?auto_167908 )
      ( MAKE-5CRATE-VERIFY ?auto_167904 ?auto_167905 ?auto_167906 ?auto_167903 ?auto_167907 ?auto_167908 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167944 - SURFACE
      ?auto_167945 - SURFACE
      ?auto_167946 - SURFACE
      ?auto_167943 - SURFACE
      ?auto_167947 - SURFACE
      ?auto_167948 - SURFACE
    )
    :vars
    (
      ?auto_167951 - HOIST
      ?auto_167950 - PLACE
      ?auto_167952 - TRUCK
      ?auto_167949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167951 ?auto_167950 ) ( SURFACE-AT ?auto_167947 ?auto_167950 ) ( CLEAR ?auto_167947 ) ( IS-CRATE ?auto_167948 ) ( not ( = ?auto_167947 ?auto_167948 ) ) ( AVAILABLE ?auto_167951 ) ( IN ?auto_167948 ?auto_167952 ) ( ON ?auto_167947 ?auto_167943 ) ( not ( = ?auto_167943 ?auto_167947 ) ) ( not ( = ?auto_167943 ?auto_167948 ) ) ( TRUCK-AT ?auto_167952 ?auto_167949 ) ( not ( = ?auto_167949 ?auto_167950 ) ) ( ON ?auto_167945 ?auto_167944 ) ( ON ?auto_167946 ?auto_167945 ) ( ON ?auto_167943 ?auto_167946 ) ( not ( = ?auto_167944 ?auto_167945 ) ) ( not ( = ?auto_167944 ?auto_167946 ) ) ( not ( = ?auto_167944 ?auto_167943 ) ) ( not ( = ?auto_167944 ?auto_167947 ) ) ( not ( = ?auto_167944 ?auto_167948 ) ) ( not ( = ?auto_167945 ?auto_167946 ) ) ( not ( = ?auto_167945 ?auto_167943 ) ) ( not ( = ?auto_167945 ?auto_167947 ) ) ( not ( = ?auto_167945 ?auto_167948 ) ) ( not ( = ?auto_167946 ?auto_167943 ) ) ( not ( = ?auto_167946 ?auto_167947 ) ) ( not ( = ?auto_167946 ?auto_167948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167943 ?auto_167947 ?auto_167948 )
      ( MAKE-5CRATE-VERIFY ?auto_167944 ?auto_167945 ?auto_167946 ?auto_167943 ?auto_167947 ?auto_167948 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_167989 - SURFACE
      ?auto_167990 - SURFACE
      ?auto_167991 - SURFACE
      ?auto_167988 - SURFACE
      ?auto_167992 - SURFACE
      ?auto_167993 - SURFACE
    )
    :vars
    (
      ?auto_167996 - HOIST
      ?auto_167998 - PLACE
      ?auto_167995 - TRUCK
      ?auto_167994 - PLACE
      ?auto_167997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_167996 ?auto_167998 ) ( SURFACE-AT ?auto_167992 ?auto_167998 ) ( CLEAR ?auto_167992 ) ( IS-CRATE ?auto_167993 ) ( not ( = ?auto_167992 ?auto_167993 ) ) ( AVAILABLE ?auto_167996 ) ( ON ?auto_167992 ?auto_167988 ) ( not ( = ?auto_167988 ?auto_167992 ) ) ( not ( = ?auto_167988 ?auto_167993 ) ) ( TRUCK-AT ?auto_167995 ?auto_167994 ) ( not ( = ?auto_167994 ?auto_167998 ) ) ( HOIST-AT ?auto_167997 ?auto_167994 ) ( LIFTING ?auto_167997 ?auto_167993 ) ( not ( = ?auto_167996 ?auto_167997 ) ) ( ON ?auto_167990 ?auto_167989 ) ( ON ?auto_167991 ?auto_167990 ) ( ON ?auto_167988 ?auto_167991 ) ( not ( = ?auto_167989 ?auto_167990 ) ) ( not ( = ?auto_167989 ?auto_167991 ) ) ( not ( = ?auto_167989 ?auto_167988 ) ) ( not ( = ?auto_167989 ?auto_167992 ) ) ( not ( = ?auto_167989 ?auto_167993 ) ) ( not ( = ?auto_167990 ?auto_167991 ) ) ( not ( = ?auto_167990 ?auto_167988 ) ) ( not ( = ?auto_167990 ?auto_167992 ) ) ( not ( = ?auto_167990 ?auto_167993 ) ) ( not ( = ?auto_167991 ?auto_167988 ) ) ( not ( = ?auto_167991 ?auto_167992 ) ) ( not ( = ?auto_167991 ?auto_167993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167988 ?auto_167992 ?auto_167993 )
      ( MAKE-5CRATE-VERIFY ?auto_167989 ?auto_167990 ?auto_167991 ?auto_167988 ?auto_167992 ?auto_167993 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168039 - SURFACE
      ?auto_168040 - SURFACE
      ?auto_168041 - SURFACE
      ?auto_168038 - SURFACE
      ?auto_168042 - SURFACE
      ?auto_168043 - SURFACE
    )
    :vars
    (
      ?auto_168049 - HOIST
      ?auto_168046 - PLACE
      ?auto_168045 - TRUCK
      ?auto_168044 - PLACE
      ?auto_168048 - HOIST
      ?auto_168047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_168049 ?auto_168046 ) ( SURFACE-AT ?auto_168042 ?auto_168046 ) ( CLEAR ?auto_168042 ) ( IS-CRATE ?auto_168043 ) ( not ( = ?auto_168042 ?auto_168043 ) ) ( AVAILABLE ?auto_168049 ) ( ON ?auto_168042 ?auto_168038 ) ( not ( = ?auto_168038 ?auto_168042 ) ) ( not ( = ?auto_168038 ?auto_168043 ) ) ( TRUCK-AT ?auto_168045 ?auto_168044 ) ( not ( = ?auto_168044 ?auto_168046 ) ) ( HOIST-AT ?auto_168048 ?auto_168044 ) ( not ( = ?auto_168049 ?auto_168048 ) ) ( AVAILABLE ?auto_168048 ) ( SURFACE-AT ?auto_168043 ?auto_168044 ) ( ON ?auto_168043 ?auto_168047 ) ( CLEAR ?auto_168043 ) ( not ( = ?auto_168042 ?auto_168047 ) ) ( not ( = ?auto_168043 ?auto_168047 ) ) ( not ( = ?auto_168038 ?auto_168047 ) ) ( ON ?auto_168040 ?auto_168039 ) ( ON ?auto_168041 ?auto_168040 ) ( ON ?auto_168038 ?auto_168041 ) ( not ( = ?auto_168039 ?auto_168040 ) ) ( not ( = ?auto_168039 ?auto_168041 ) ) ( not ( = ?auto_168039 ?auto_168038 ) ) ( not ( = ?auto_168039 ?auto_168042 ) ) ( not ( = ?auto_168039 ?auto_168043 ) ) ( not ( = ?auto_168039 ?auto_168047 ) ) ( not ( = ?auto_168040 ?auto_168041 ) ) ( not ( = ?auto_168040 ?auto_168038 ) ) ( not ( = ?auto_168040 ?auto_168042 ) ) ( not ( = ?auto_168040 ?auto_168043 ) ) ( not ( = ?auto_168040 ?auto_168047 ) ) ( not ( = ?auto_168041 ?auto_168038 ) ) ( not ( = ?auto_168041 ?auto_168042 ) ) ( not ( = ?auto_168041 ?auto_168043 ) ) ( not ( = ?auto_168041 ?auto_168047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168038 ?auto_168042 ?auto_168043 )
      ( MAKE-5CRATE-VERIFY ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168038 ?auto_168042 ?auto_168043 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168090 - SURFACE
      ?auto_168091 - SURFACE
      ?auto_168092 - SURFACE
      ?auto_168089 - SURFACE
      ?auto_168093 - SURFACE
      ?auto_168094 - SURFACE
    )
    :vars
    (
      ?auto_168095 - HOIST
      ?auto_168100 - PLACE
      ?auto_168097 - PLACE
      ?auto_168098 - HOIST
      ?auto_168096 - SURFACE
      ?auto_168099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168095 ?auto_168100 ) ( SURFACE-AT ?auto_168093 ?auto_168100 ) ( CLEAR ?auto_168093 ) ( IS-CRATE ?auto_168094 ) ( not ( = ?auto_168093 ?auto_168094 ) ) ( AVAILABLE ?auto_168095 ) ( ON ?auto_168093 ?auto_168089 ) ( not ( = ?auto_168089 ?auto_168093 ) ) ( not ( = ?auto_168089 ?auto_168094 ) ) ( not ( = ?auto_168097 ?auto_168100 ) ) ( HOIST-AT ?auto_168098 ?auto_168097 ) ( not ( = ?auto_168095 ?auto_168098 ) ) ( AVAILABLE ?auto_168098 ) ( SURFACE-AT ?auto_168094 ?auto_168097 ) ( ON ?auto_168094 ?auto_168096 ) ( CLEAR ?auto_168094 ) ( not ( = ?auto_168093 ?auto_168096 ) ) ( not ( = ?auto_168094 ?auto_168096 ) ) ( not ( = ?auto_168089 ?auto_168096 ) ) ( TRUCK-AT ?auto_168099 ?auto_168100 ) ( ON ?auto_168091 ?auto_168090 ) ( ON ?auto_168092 ?auto_168091 ) ( ON ?auto_168089 ?auto_168092 ) ( not ( = ?auto_168090 ?auto_168091 ) ) ( not ( = ?auto_168090 ?auto_168092 ) ) ( not ( = ?auto_168090 ?auto_168089 ) ) ( not ( = ?auto_168090 ?auto_168093 ) ) ( not ( = ?auto_168090 ?auto_168094 ) ) ( not ( = ?auto_168090 ?auto_168096 ) ) ( not ( = ?auto_168091 ?auto_168092 ) ) ( not ( = ?auto_168091 ?auto_168089 ) ) ( not ( = ?auto_168091 ?auto_168093 ) ) ( not ( = ?auto_168091 ?auto_168094 ) ) ( not ( = ?auto_168091 ?auto_168096 ) ) ( not ( = ?auto_168092 ?auto_168089 ) ) ( not ( = ?auto_168092 ?auto_168093 ) ) ( not ( = ?auto_168092 ?auto_168094 ) ) ( not ( = ?auto_168092 ?auto_168096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168089 ?auto_168093 ?auto_168094 )
      ( MAKE-5CRATE-VERIFY ?auto_168090 ?auto_168091 ?auto_168092 ?auto_168089 ?auto_168093 ?auto_168094 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168141 - SURFACE
      ?auto_168142 - SURFACE
      ?auto_168143 - SURFACE
      ?auto_168140 - SURFACE
      ?auto_168144 - SURFACE
      ?auto_168145 - SURFACE
    )
    :vars
    (
      ?auto_168150 - HOIST
      ?auto_168146 - PLACE
      ?auto_168147 - PLACE
      ?auto_168151 - HOIST
      ?auto_168148 - SURFACE
      ?auto_168149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168150 ?auto_168146 ) ( IS-CRATE ?auto_168145 ) ( not ( = ?auto_168144 ?auto_168145 ) ) ( not ( = ?auto_168140 ?auto_168144 ) ) ( not ( = ?auto_168140 ?auto_168145 ) ) ( not ( = ?auto_168147 ?auto_168146 ) ) ( HOIST-AT ?auto_168151 ?auto_168147 ) ( not ( = ?auto_168150 ?auto_168151 ) ) ( AVAILABLE ?auto_168151 ) ( SURFACE-AT ?auto_168145 ?auto_168147 ) ( ON ?auto_168145 ?auto_168148 ) ( CLEAR ?auto_168145 ) ( not ( = ?auto_168144 ?auto_168148 ) ) ( not ( = ?auto_168145 ?auto_168148 ) ) ( not ( = ?auto_168140 ?auto_168148 ) ) ( TRUCK-AT ?auto_168149 ?auto_168146 ) ( SURFACE-AT ?auto_168140 ?auto_168146 ) ( CLEAR ?auto_168140 ) ( LIFTING ?auto_168150 ?auto_168144 ) ( IS-CRATE ?auto_168144 ) ( ON ?auto_168142 ?auto_168141 ) ( ON ?auto_168143 ?auto_168142 ) ( ON ?auto_168140 ?auto_168143 ) ( not ( = ?auto_168141 ?auto_168142 ) ) ( not ( = ?auto_168141 ?auto_168143 ) ) ( not ( = ?auto_168141 ?auto_168140 ) ) ( not ( = ?auto_168141 ?auto_168144 ) ) ( not ( = ?auto_168141 ?auto_168145 ) ) ( not ( = ?auto_168141 ?auto_168148 ) ) ( not ( = ?auto_168142 ?auto_168143 ) ) ( not ( = ?auto_168142 ?auto_168140 ) ) ( not ( = ?auto_168142 ?auto_168144 ) ) ( not ( = ?auto_168142 ?auto_168145 ) ) ( not ( = ?auto_168142 ?auto_168148 ) ) ( not ( = ?auto_168143 ?auto_168140 ) ) ( not ( = ?auto_168143 ?auto_168144 ) ) ( not ( = ?auto_168143 ?auto_168145 ) ) ( not ( = ?auto_168143 ?auto_168148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168140 ?auto_168144 ?auto_168145 )
      ( MAKE-5CRATE-VERIFY ?auto_168141 ?auto_168142 ?auto_168143 ?auto_168140 ?auto_168144 ?auto_168145 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168192 - SURFACE
      ?auto_168193 - SURFACE
      ?auto_168194 - SURFACE
      ?auto_168191 - SURFACE
      ?auto_168195 - SURFACE
      ?auto_168196 - SURFACE
    )
    :vars
    (
      ?auto_168199 - HOIST
      ?auto_168200 - PLACE
      ?auto_168201 - PLACE
      ?auto_168198 - HOIST
      ?auto_168197 - SURFACE
      ?auto_168202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168199 ?auto_168200 ) ( IS-CRATE ?auto_168196 ) ( not ( = ?auto_168195 ?auto_168196 ) ) ( not ( = ?auto_168191 ?auto_168195 ) ) ( not ( = ?auto_168191 ?auto_168196 ) ) ( not ( = ?auto_168201 ?auto_168200 ) ) ( HOIST-AT ?auto_168198 ?auto_168201 ) ( not ( = ?auto_168199 ?auto_168198 ) ) ( AVAILABLE ?auto_168198 ) ( SURFACE-AT ?auto_168196 ?auto_168201 ) ( ON ?auto_168196 ?auto_168197 ) ( CLEAR ?auto_168196 ) ( not ( = ?auto_168195 ?auto_168197 ) ) ( not ( = ?auto_168196 ?auto_168197 ) ) ( not ( = ?auto_168191 ?auto_168197 ) ) ( TRUCK-AT ?auto_168202 ?auto_168200 ) ( SURFACE-AT ?auto_168191 ?auto_168200 ) ( CLEAR ?auto_168191 ) ( IS-CRATE ?auto_168195 ) ( AVAILABLE ?auto_168199 ) ( IN ?auto_168195 ?auto_168202 ) ( ON ?auto_168193 ?auto_168192 ) ( ON ?auto_168194 ?auto_168193 ) ( ON ?auto_168191 ?auto_168194 ) ( not ( = ?auto_168192 ?auto_168193 ) ) ( not ( = ?auto_168192 ?auto_168194 ) ) ( not ( = ?auto_168192 ?auto_168191 ) ) ( not ( = ?auto_168192 ?auto_168195 ) ) ( not ( = ?auto_168192 ?auto_168196 ) ) ( not ( = ?auto_168192 ?auto_168197 ) ) ( not ( = ?auto_168193 ?auto_168194 ) ) ( not ( = ?auto_168193 ?auto_168191 ) ) ( not ( = ?auto_168193 ?auto_168195 ) ) ( not ( = ?auto_168193 ?auto_168196 ) ) ( not ( = ?auto_168193 ?auto_168197 ) ) ( not ( = ?auto_168194 ?auto_168191 ) ) ( not ( = ?auto_168194 ?auto_168195 ) ) ( not ( = ?auto_168194 ?auto_168196 ) ) ( not ( = ?auto_168194 ?auto_168197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168191 ?auto_168195 ?auto_168196 )
      ( MAKE-5CRATE-VERIFY ?auto_168192 ?auto_168193 ?auto_168194 ?auto_168191 ?auto_168195 ?auto_168196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_169183 - SURFACE
      ?auto_169184 - SURFACE
    )
    :vars
    (
      ?auto_169187 - HOIST
      ?auto_169188 - PLACE
      ?auto_169186 - SURFACE
      ?auto_169185 - PLACE
      ?auto_169189 - HOIST
      ?auto_169190 - SURFACE
      ?auto_169191 - TRUCK
      ?auto_169192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169187 ?auto_169188 ) ( SURFACE-AT ?auto_169183 ?auto_169188 ) ( CLEAR ?auto_169183 ) ( IS-CRATE ?auto_169184 ) ( not ( = ?auto_169183 ?auto_169184 ) ) ( ON ?auto_169183 ?auto_169186 ) ( not ( = ?auto_169186 ?auto_169183 ) ) ( not ( = ?auto_169186 ?auto_169184 ) ) ( not ( = ?auto_169185 ?auto_169188 ) ) ( HOIST-AT ?auto_169189 ?auto_169185 ) ( not ( = ?auto_169187 ?auto_169189 ) ) ( AVAILABLE ?auto_169189 ) ( SURFACE-AT ?auto_169184 ?auto_169185 ) ( ON ?auto_169184 ?auto_169190 ) ( CLEAR ?auto_169184 ) ( not ( = ?auto_169183 ?auto_169190 ) ) ( not ( = ?auto_169184 ?auto_169190 ) ) ( not ( = ?auto_169186 ?auto_169190 ) ) ( TRUCK-AT ?auto_169191 ?auto_169188 ) ( LIFTING ?auto_169187 ?auto_169192 ) ( IS-CRATE ?auto_169192 ) ( not ( = ?auto_169183 ?auto_169192 ) ) ( not ( = ?auto_169184 ?auto_169192 ) ) ( not ( = ?auto_169186 ?auto_169192 ) ) ( not ( = ?auto_169190 ?auto_169192 ) ) )
    :subtasks
    ( ( !LOAD ?auto_169187 ?auto_169192 ?auto_169191 ?auto_169188 )
      ( MAKE-1CRATE ?auto_169183 ?auto_169184 )
      ( MAKE-1CRATE-VERIFY ?auto_169183 ?auto_169184 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169399 - SURFACE
      ?auto_169400 - SURFACE
      ?auto_169401 - SURFACE
      ?auto_169398 - SURFACE
      ?auto_169402 - SURFACE
      ?auto_169404 - SURFACE
      ?auto_169403 - SURFACE
    )
    :vars
    (
      ?auto_169405 - HOIST
      ?auto_169406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169405 ?auto_169406 ) ( SURFACE-AT ?auto_169404 ?auto_169406 ) ( CLEAR ?auto_169404 ) ( LIFTING ?auto_169405 ?auto_169403 ) ( IS-CRATE ?auto_169403 ) ( not ( = ?auto_169404 ?auto_169403 ) ) ( ON ?auto_169400 ?auto_169399 ) ( ON ?auto_169401 ?auto_169400 ) ( ON ?auto_169398 ?auto_169401 ) ( ON ?auto_169402 ?auto_169398 ) ( ON ?auto_169404 ?auto_169402 ) ( not ( = ?auto_169399 ?auto_169400 ) ) ( not ( = ?auto_169399 ?auto_169401 ) ) ( not ( = ?auto_169399 ?auto_169398 ) ) ( not ( = ?auto_169399 ?auto_169402 ) ) ( not ( = ?auto_169399 ?auto_169404 ) ) ( not ( = ?auto_169399 ?auto_169403 ) ) ( not ( = ?auto_169400 ?auto_169401 ) ) ( not ( = ?auto_169400 ?auto_169398 ) ) ( not ( = ?auto_169400 ?auto_169402 ) ) ( not ( = ?auto_169400 ?auto_169404 ) ) ( not ( = ?auto_169400 ?auto_169403 ) ) ( not ( = ?auto_169401 ?auto_169398 ) ) ( not ( = ?auto_169401 ?auto_169402 ) ) ( not ( = ?auto_169401 ?auto_169404 ) ) ( not ( = ?auto_169401 ?auto_169403 ) ) ( not ( = ?auto_169398 ?auto_169402 ) ) ( not ( = ?auto_169398 ?auto_169404 ) ) ( not ( = ?auto_169398 ?auto_169403 ) ) ( not ( = ?auto_169402 ?auto_169404 ) ) ( not ( = ?auto_169402 ?auto_169403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_169404 ?auto_169403 )
      ( MAKE-6CRATE-VERIFY ?auto_169399 ?auto_169400 ?auto_169401 ?auto_169398 ?auto_169402 ?auto_169404 ?auto_169403 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169443 - SURFACE
      ?auto_169444 - SURFACE
      ?auto_169445 - SURFACE
      ?auto_169442 - SURFACE
      ?auto_169446 - SURFACE
      ?auto_169448 - SURFACE
      ?auto_169447 - SURFACE
    )
    :vars
    (
      ?auto_169449 - HOIST
      ?auto_169451 - PLACE
      ?auto_169450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169449 ?auto_169451 ) ( SURFACE-AT ?auto_169448 ?auto_169451 ) ( CLEAR ?auto_169448 ) ( IS-CRATE ?auto_169447 ) ( not ( = ?auto_169448 ?auto_169447 ) ) ( TRUCK-AT ?auto_169450 ?auto_169451 ) ( AVAILABLE ?auto_169449 ) ( IN ?auto_169447 ?auto_169450 ) ( ON ?auto_169448 ?auto_169446 ) ( not ( = ?auto_169446 ?auto_169448 ) ) ( not ( = ?auto_169446 ?auto_169447 ) ) ( ON ?auto_169444 ?auto_169443 ) ( ON ?auto_169445 ?auto_169444 ) ( ON ?auto_169442 ?auto_169445 ) ( ON ?auto_169446 ?auto_169442 ) ( not ( = ?auto_169443 ?auto_169444 ) ) ( not ( = ?auto_169443 ?auto_169445 ) ) ( not ( = ?auto_169443 ?auto_169442 ) ) ( not ( = ?auto_169443 ?auto_169446 ) ) ( not ( = ?auto_169443 ?auto_169448 ) ) ( not ( = ?auto_169443 ?auto_169447 ) ) ( not ( = ?auto_169444 ?auto_169445 ) ) ( not ( = ?auto_169444 ?auto_169442 ) ) ( not ( = ?auto_169444 ?auto_169446 ) ) ( not ( = ?auto_169444 ?auto_169448 ) ) ( not ( = ?auto_169444 ?auto_169447 ) ) ( not ( = ?auto_169445 ?auto_169442 ) ) ( not ( = ?auto_169445 ?auto_169446 ) ) ( not ( = ?auto_169445 ?auto_169448 ) ) ( not ( = ?auto_169445 ?auto_169447 ) ) ( not ( = ?auto_169442 ?auto_169446 ) ) ( not ( = ?auto_169442 ?auto_169448 ) ) ( not ( = ?auto_169442 ?auto_169447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169446 ?auto_169448 ?auto_169447 )
      ( MAKE-6CRATE-VERIFY ?auto_169443 ?auto_169444 ?auto_169445 ?auto_169442 ?auto_169446 ?auto_169448 ?auto_169447 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169494 - SURFACE
      ?auto_169495 - SURFACE
      ?auto_169496 - SURFACE
      ?auto_169493 - SURFACE
      ?auto_169497 - SURFACE
      ?auto_169499 - SURFACE
      ?auto_169498 - SURFACE
    )
    :vars
    (
      ?auto_169503 - HOIST
      ?auto_169502 - PLACE
      ?auto_169501 - TRUCK
      ?auto_169500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169503 ?auto_169502 ) ( SURFACE-AT ?auto_169499 ?auto_169502 ) ( CLEAR ?auto_169499 ) ( IS-CRATE ?auto_169498 ) ( not ( = ?auto_169499 ?auto_169498 ) ) ( AVAILABLE ?auto_169503 ) ( IN ?auto_169498 ?auto_169501 ) ( ON ?auto_169499 ?auto_169497 ) ( not ( = ?auto_169497 ?auto_169499 ) ) ( not ( = ?auto_169497 ?auto_169498 ) ) ( TRUCK-AT ?auto_169501 ?auto_169500 ) ( not ( = ?auto_169500 ?auto_169502 ) ) ( ON ?auto_169495 ?auto_169494 ) ( ON ?auto_169496 ?auto_169495 ) ( ON ?auto_169493 ?auto_169496 ) ( ON ?auto_169497 ?auto_169493 ) ( not ( = ?auto_169494 ?auto_169495 ) ) ( not ( = ?auto_169494 ?auto_169496 ) ) ( not ( = ?auto_169494 ?auto_169493 ) ) ( not ( = ?auto_169494 ?auto_169497 ) ) ( not ( = ?auto_169494 ?auto_169499 ) ) ( not ( = ?auto_169494 ?auto_169498 ) ) ( not ( = ?auto_169495 ?auto_169496 ) ) ( not ( = ?auto_169495 ?auto_169493 ) ) ( not ( = ?auto_169495 ?auto_169497 ) ) ( not ( = ?auto_169495 ?auto_169499 ) ) ( not ( = ?auto_169495 ?auto_169498 ) ) ( not ( = ?auto_169496 ?auto_169493 ) ) ( not ( = ?auto_169496 ?auto_169497 ) ) ( not ( = ?auto_169496 ?auto_169499 ) ) ( not ( = ?auto_169496 ?auto_169498 ) ) ( not ( = ?auto_169493 ?auto_169497 ) ) ( not ( = ?auto_169493 ?auto_169499 ) ) ( not ( = ?auto_169493 ?auto_169498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169497 ?auto_169499 ?auto_169498 )
      ( MAKE-6CRATE-VERIFY ?auto_169494 ?auto_169495 ?auto_169496 ?auto_169493 ?auto_169497 ?auto_169499 ?auto_169498 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169551 - SURFACE
      ?auto_169552 - SURFACE
      ?auto_169553 - SURFACE
      ?auto_169550 - SURFACE
      ?auto_169554 - SURFACE
      ?auto_169556 - SURFACE
      ?auto_169555 - SURFACE
    )
    :vars
    (
      ?auto_169558 - HOIST
      ?auto_169561 - PLACE
      ?auto_169557 - TRUCK
      ?auto_169559 - PLACE
      ?auto_169560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_169558 ?auto_169561 ) ( SURFACE-AT ?auto_169556 ?auto_169561 ) ( CLEAR ?auto_169556 ) ( IS-CRATE ?auto_169555 ) ( not ( = ?auto_169556 ?auto_169555 ) ) ( AVAILABLE ?auto_169558 ) ( ON ?auto_169556 ?auto_169554 ) ( not ( = ?auto_169554 ?auto_169556 ) ) ( not ( = ?auto_169554 ?auto_169555 ) ) ( TRUCK-AT ?auto_169557 ?auto_169559 ) ( not ( = ?auto_169559 ?auto_169561 ) ) ( HOIST-AT ?auto_169560 ?auto_169559 ) ( LIFTING ?auto_169560 ?auto_169555 ) ( not ( = ?auto_169558 ?auto_169560 ) ) ( ON ?auto_169552 ?auto_169551 ) ( ON ?auto_169553 ?auto_169552 ) ( ON ?auto_169550 ?auto_169553 ) ( ON ?auto_169554 ?auto_169550 ) ( not ( = ?auto_169551 ?auto_169552 ) ) ( not ( = ?auto_169551 ?auto_169553 ) ) ( not ( = ?auto_169551 ?auto_169550 ) ) ( not ( = ?auto_169551 ?auto_169554 ) ) ( not ( = ?auto_169551 ?auto_169556 ) ) ( not ( = ?auto_169551 ?auto_169555 ) ) ( not ( = ?auto_169552 ?auto_169553 ) ) ( not ( = ?auto_169552 ?auto_169550 ) ) ( not ( = ?auto_169552 ?auto_169554 ) ) ( not ( = ?auto_169552 ?auto_169556 ) ) ( not ( = ?auto_169552 ?auto_169555 ) ) ( not ( = ?auto_169553 ?auto_169550 ) ) ( not ( = ?auto_169553 ?auto_169554 ) ) ( not ( = ?auto_169553 ?auto_169556 ) ) ( not ( = ?auto_169553 ?auto_169555 ) ) ( not ( = ?auto_169550 ?auto_169554 ) ) ( not ( = ?auto_169550 ?auto_169556 ) ) ( not ( = ?auto_169550 ?auto_169555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169554 ?auto_169556 ?auto_169555 )
      ( MAKE-6CRATE-VERIFY ?auto_169551 ?auto_169552 ?auto_169553 ?auto_169550 ?auto_169554 ?auto_169556 ?auto_169555 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169614 - SURFACE
      ?auto_169615 - SURFACE
      ?auto_169616 - SURFACE
      ?auto_169613 - SURFACE
      ?auto_169617 - SURFACE
      ?auto_169619 - SURFACE
      ?auto_169618 - SURFACE
    )
    :vars
    (
      ?auto_169622 - HOIST
      ?auto_169620 - PLACE
      ?auto_169623 - TRUCK
      ?auto_169624 - PLACE
      ?auto_169621 - HOIST
      ?auto_169625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169622 ?auto_169620 ) ( SURFACE-AT ?auto_169619 ?auto_169620 ) ( CLEAR ?auto_169619 ) ( IS-CRATE ?auto_169618 ) ( not ( = ?auto_169619 ?auto_169618 ) ) ( AVAILABLE ?auto_169622 ) ( ON ?auto_169619 ?auto_169617 ) ( not ( = ?auto_169617 ?auto_169619 ) ) ( not ( = ?auto_169617 ?auto_169618 ) ) ( TRUCK-AT ?auto_169623 ?auto_169624 ) ( not ( = ?auto_169624 ?auto_169620 ) ) ( HOIST-AT ?auto_169621 ?auto_169624 ) ( not ( = ?auto_169622 ?auto_169621 ) ) ( AVAILABLE ?auto_169621 ) ( SURFACE-AT ?auto_169618 ?auto_169624 ) ( ON ?auto_169618 ?auto_169625 ) ( CLEAR ?auto_169618 ) ( not ( = ?auto_169619 ?auto_169625 ) ) ( not ( = ?auto_169618 ?auto_169625 ) ) ( not ( = ?auto_169617 ?auto_169625 ) ) ( ON ?auto_169615 ?auto_169614 ) ( ON ?auto_169616 ?auto_169615 ) ( ON ?auto_169613 ?auto_169616 ) ( ON ?auto_169617 ?auto_169613 ) ( not ( = ?auto_169614 ?auto_169615 ) ) ( not ( = ?auto_169614 ?auto_169616 ) ) ( not ( = ?auto_169614 ?auto_169613 ) ) ( not ( = ?auto_169614 ?auto_169617 ) ) ( not ( = ?auto_169614 ?auto_169619 ) ) ( not ( = ?auto_169614 ?auto_169618 ) ) ( not ( = ?auto_169614 ?auto_169625 ) ) ( not ( = ?auto_169615 ?auto_169616 ) ) ( not ( = ?auto_169615 ?auto_169613 ) ) ( not ( = ?auto_169615 ?auto_169617 ) ) ( not ( = ?auto_169615 ?auto_169619 ) ) ( not ( = ?auto_169615 ?auto_169618 ) ) ( not ( = ?auto_169615 ?auto_169625 ) ) ( not ( = ?auto_169616 ?auto_169613 ) ) ( not ( = ?auto_169616 ?auto_169617 ) ) ( not ( = ?auto_169616 ?auto_169619 ) ) ( not ( = ?auto_169616 ?auto_169618 ) ) ( not ( = ?auto_169616 ?auto_169625 ) ) ( not ( = ?auto_169613 ?auto_169617 ) ) ( not ( = ?auto_169613 ?auto_169619 ) ) ( not ( = ?auto_169613 ?auto_169618 ) ) ( not ( = ?auto_169613 ?auto_169625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169617 ?auto_169619 ?auto_169618 )
      ( MAKE-6CRATE-VERIFY ?auto_169614 ?auto_169615 ?auto_169616 ?auto_169613 ?auto_169617 ?auto_169619 ?auto_169618 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169678 - SURFACE
      ?auto_169679 - SURFACE
      ?auto_169680 - SURFACE
      ?auto_169677 - SURFACE
      ?auto_169681 - SURFACE
      ?auto_169683 - SURFACE
      ?auto_169682 - SURFACE
    )
    :vars
    (
      ?auto_169687 - HOIST
      ?auto_169688 - PLACE
      ?auto_169685 - PLACE
      ?auto_169686 - HOIST
      ?auto_169689 - SURFACE
      ?auto_169684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169687 ?auto_169688 ) ( SURFACE-AT ?auto_169683 ?auto_169688 ) ( CLEAR ?auto_169683 ) ( IS-CRATE ?auto_169682 ) ( not ( = ?auto_169683 ?auto_169682 ) ) ( AVAILABLE ?auto_169687 ) ( ON ?auto_169683 ?auto_169681 ) ( not ( = ?auto_169681 ?auto_169683 ) ) ( not ( = ?auto_169681 ?auto_169682 ) ) ( not ( = ?auto_169685 ?auto_169688 ) ) ( HOIST-AT ?auto_169686 ?auto_169685 ) ( not ( = ?auto_169687 ?auto_169686 ) ) ( AVAILABLE ?auto_169686 ) ( SURFACE-AT ?auto_169682 ?auto_169685 ) ( ON ?auto_169682 ?auto_169689 ) ( CLEAR ?auto_169682 ) ( not ( = ?auto_169683 ?auto_169689 ) ) ( not ( = ?auto_169682 ?auto_169689 ) ) ( not ( = ?auto_169681 ?auto_169689 ) ) ( TRUCK-AT ?auto_169684 ?auto_169688 ) ( ON ?auto_169679 ?auto_169678 ) ( ON ?auto_169680 ?auto_169679 ) ( ON ?auto_169677 ?auto_169680 ) ( ON ?auto_169681 ?auto_169677 ) ( not ( = ?auto_169678 ?auto_169679 ) ) ( not ( = ?auto_169678 ?auto_169680 ) ) ( not ( = ?auto_169678 ?auto_169677 ) ) ( not ( = ?auto_169678 ?auto_169681 ) ) ( not ( = ?auto_169678 ?auto_169683 ) ) ( not ( = ?auto_169678 ?auto_169682 ) ) ( not ( = ?auto_169678 ?auto_169689 ) ) ( not ( = ?auto_169679 ?auto_169680 ) ) ( not ( = ?auto_169679 ?auto_169677 ) ) ( not ( = ?auto_169679 ?auto_169681 ) ) ( not ( = ?auto_169679 ?auto_169683 ) ) ( not ( = ?auto_169679 ?auto_169682 ) ) ( not ( = ?auto_169679 ?auto_169689 ) ) ( not ( = ?auto_169680 ?auto_169677 ) ) ( not ( = ?auto_169680 ?auto_169681 ) ) ( not ( = ?auto_169680 ?auto_169683 ) ) ( not ( = ?auto_169680 ?auto_169682 ) ) ( not ( = ?auto_169680 ?auto_169689 ) ) ( not ( = ?auto_169677 ?auto_169681 ) ) ( not ( = ?auto_169677 ?auto_169683 ) ) ( not ( = ?auto_169677 ?auto_169682 ) ) ( not ( = ?auto_169677 ?auto_169689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169681 ?auto_169683 ?auto_169682 )
      ( MAKE-6CRATE-VERIFY ?auto_169678 ?auto_169679 ?auto_169680 ?auto_169677 ?auto_169681 ?auto_169683 ?auto_169682 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169742 - SURFACE
      ?auto_169743 - SURFACE
      ?auto_169744 - SURFACE
      ?auto_169741 - SURFACE
      ?auto_169745 - SURFACE
      ?auto_169747 - SURFACE
      ?auto_169746 - SURFACE
    )
    :vars
    (
      ?auto_169750 - HOIST
      ?auto_169751 - PLACE
      ?auto_169748 - PLACE
      ?auto_169752 - HOIST
      ?auto_169749 - SURFACE
      ?auto_169753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169750 ?auto_169751 ) ( IS-CRATE ?auto_169746 ) ( not ( = ?auto_169747 ?auto_169746 ) ) ( not ( = ?auto_169745 ?auto_169747 ) ) ( not ( = ?auto_169745 ?auto_169746 ) ) ( not ( = ?auto_169748 ?auto_169751 ) ) ( HOIST-AT ?auto_169752 ?auto_169748 ) ( not ( = ?auto_169750 ?auto_169752 ) ) ( AVAILABLE ?auto_169752 ) ( SURFACE-AT ?auto_169746 ?auto_169748 ) ( ON ?auto_169746 ?auto_169749 ) ( CLEAR ?auto_169746 ) ( not ( = ?auto_169747 ?auto_169749 ) ) ( not ( = ?auto_169746 ?auto_169749 ) ) ( not ( = ?auto_169745 ?auto_169749 ) ) ( TRUCK-AT ?auto_169753 ?auto_169751 ) ( SURFACE-AT ?auto_169745 ?auto_169751 ) ( CLEAR ?auto_169745 ) ( LIFTING ?auto_169750 ?auto_169747 ) ( IS-CRATE ?auto_169747 ) ( ON ?auto_169743 ?auto_169742 ) ( ON ?auto_169744 ?auto_169743 ) ( ON ?auto_169741 ?auto_169744 ) ( ON ?auto_169745 ?auto_169741 ) ( not ( = ?auto_169742 ?auto_169743 ) ) ( not ( = ?auto_169742 ?auto_169744 ) ) ( not ( = ?auto_169742 ?auto_169741 ) ) ( not ( = ?auto_169742 ?auto_169745 ) ) ( not ( = ?auto_169742 ?auto_169747 ) ) ( not ( = ?auto_169742 ?auto_169746 ) ) ( not ( = ?auto_169742 ?auto_169749 ) ) ( not ( = ?auto_169743 ?auto_169744 ) ) ( not ( = ?auto_169743 ?auto_169741 ) ) ( not ( = ?auto_169743 ?auto_169745 ) ) ( not ( = ?auto_169743 ?auto_169747 ) ) ( not ( = ?auto_169743 ?auto_169746 ) ) ( not ( = ?auto_169743 ?auto_169749 ) ) ( not ( = ?auto_169744 ?auto_169741 ) ) ( not ( = ?auto_169744 ?auto_169745 ) ) ( not ( = ?auto_169744 ?auto_169747 ) ) ( not ( = ?auto_169744 ?auto_169746 ) ) ( not ( = ?auto_169744 ?auto_169749 ) ) ( not ( = ?auto_169741 ?auto_169745 ) ) ( not ( = ?auto_169741 ?auto_169747 ) ) ( not ( = ?auto_169741 ?auto_169746 ) ) ( not ( = ?auto_169741 ?auto_169749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169745 ?auto_169747 ?auto_169746 )
      ( MAKE-6CRATE-VERIFY ?auto_169742 ?auto_169743 ?auto_169744 ?auto_169741 ?auto_169745 ?auto_169747 ?auto_169746 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169806 - SURFACE
      ?auto_169807 - SURFACE
      ?auto_169808 - SURFACE
      ?auto_169805 - SURFACE
      ?auto_169809 - SURFACE
      ?auto_169811 - SURFACE
      ?auto_169810 - SURFACE
    )
    :vars
    (
      ?auto_169816 - HOIST
      ?auto_169815 - PLACE
      ?auto_169817 - PLACE
      ?auto_169813 - HOIST
      ?auto_169814 - SURFACE
      ?auto_169812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169816 ?auto_169815 ) ( IS-CRATE ?auto_169810 ) ( not ( = ?auto_169811 ?auto_169810 ) ) ( not ( = ?auto_169809 ?auto_169811 ) ) ( not ( = ?auto_169809 ?auto_169810 ) ) ( not ( = ?auto_169817 ?auto_169815 ) ) ( HOIST-AT ?auto_169813 ?auto_169817 ) ( not ( = ?auto_169816 ?auto_169813 ) ) ( AVAILABLE ?auto_169813 ) ( SURFACE-AT ?auto_169810 ?auto_169817 ) ( ON ?auto_169810 ?auto_169814 ) ( CLEAR ?auto_169810 ) ( not ( = ?auto_169811 ?auto_169814 ) ) ( not ( = ?auto_169810 ?auto_169814 ) ) ( not ( = ?auto_169809 ?auto_169814 ) ) ( TRUCK-AT ?auto_169812 ?auto_169815 ) ( SURFACE-AT ?auto_169809 ?auto_169815 ) ( CLEAR ?auto_169809 ) ( IS-CRATE ?auto_169811 ) ( AVAILABLE ?auto_169816 ) ( IN ?auto_169811 ?auto_169812 ) ( ON ?auto_169807 ?auto_169806 ) ( ON ?auto_169808 ?auto_169807 ) ( ON ?auto_169805 ?auto_169808 ) ( ON ?auto_169809 ?auto_169805 ) ( not ( = ?auto_169806 ?auto_169807 ) ) ( not ( = ?auto_169806 ?auto_169808 ) ) ( not ( = ?auto_169806 ?auto_169805 ) ) ( not ( = ?auto_169806 ?auto_169809 ) ) ( not ( = ?auto_169806 ?auto_169811 ) ) ( not ( = ?auto_169806 ?auto_169810 ) ) ( not ( = ?auto_169806 ?auto_169814 ) ) ( not ( = ?auto_169807 ?auto_169808 ) ) ( not ( = ?auto_169807 ?auto_169805 ) ) ( not ( = ?auto_169807 ?auto_169809 ) ) ( not ( = ?auto_169807 ?auto_169811 ) ) ( not ( = ?auto_169807 ?auto_169810 ) ) ( not ( = ?auto_169807 ?auto_169814 ) ) ( not ( = ?auto_169808 ?auto_169805 ) ) ( not ( = ?auto_169808 ?auto_169809 ) ) ( not ( = ?auto_169808 ?auto_169811 ) ) ( not ( = ?auto_169808 ?auto_169810 ) ) ( not ( = ?auto_169808 ?auto_169814 ) ) ( not ( = ?auto_169805 ?auto_169809 ) ) ( not ( = ?auto_169805 ?auto_169811 ) ) ( not ( = ?auto_169805 ?auto_169810 ) ) ( not ( = ?auto_169805 ?auto_169814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169809 ?auto_169811 ?auto_169810 )
      ( MAKE-6CRATE-VERIFY ?auto_169806 ?auto_169807 ?auto_169808 ?auto_169805 ?auto_169809 ?auto_169811 ?auto_169810 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171762 - SURFACE
      ?auto_171763 - SURFACE
      ?auto_171764 - SURFACE
      ?auto_171761 - SURFACE
      ?auto_171765 - SURFACE
      ?auto_171767 - SURFACE
      ?auto_171766 - SURFACE
      ?auto_171768 - SURFACE
    )
    :vars
    (
      ?auto_171770 - HOIST
      ?auto_171769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171770 ?auto_171769 ) ( SURFACE-AT ?auto_171766 ?auto_171769 ) ( CLEAR ?auto_171766 ) ( LIFTING ?auto_171770 ?auto_171768 ) ( IS-CRATE ?auto_171768 ) ( not ( = ?auto_171766 ?auto_171768 ) ) ( ON ?auto_171763 ?auto_171762 ) ( ON ?auto_171764 ?auto_171763 ) ( ON ?auto_171761 ?auto_171764 ) ( ON ?auto_171765 ?auto_171761 ) ( ON ?auto_171767 ?auto_171765 ) ( ON ?auto_171766 ?auto_171767 ) ( not ( = ?auto_171762 ?auto_171763 ) ) ( not ( = ?auto_171762 ?auto_171764 ) ) ( not ( = ?auto_171762 ?auto_171761 ) ) ( not ( = ?auto_171762 ?auto_171765 ) ) ( not ( = ?auto_171762 ?auto_171767 ) ) ( not ( = ?auto_171762 ?auto_171766 ) ) ( not ( = ?auto_171762 ?auto_171768 ) ) ( not ( = ?auto_171763 ?auto_171764 ) ) ( not ( = ?auto_171763 ?auto_171761 ) ) ( not ( = ?auto_171763 ?auto_171765 ) ) ( not ( = ?auto_171763 ?auto_171767 ) ) ( not ( = ?auto_171763 ?auto_171766 ) ) ( not ( = ?auto_171763 ?auto_171768 ) ) ( not ( = ?auto_171764 ?auto_171761 ) ) ( not ( = ?auto_171764 ?auto_171765 ) ) ( not ( = ?auto_171764 ?auto_171767 ) ) ( not ( = ?auto_171764 ?auto_171766 ) ) ( not ( = ?auto_171764 ?auto_171768 ) ) ( not ( = ?auto_171761 ?auto_171765 ) ) ( not ( = ?auto_171761 ?auto_171767 ) ) ( not ( = ?auto_171761 ?auto_171766 ) ) ( not ( = ?auto_171761 ?auto_171768 ) ) ( not ( = ?auto_171765 ?auto_171767 ) ) ( not ( = ?auto_171765 ?auto_171766 ) ) ( not ( = ?auto_171765 ?auto_171768 ) ) ( not ( = ?auto_171767 ?auto_171766 ) ) ( not ( = ?auto_171767 ?auto_171768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_171766 ?auto_171768 )
      ( MAKE-7CRATE-VERIFY ?auto_171762 ?auto_171763 ?auto_171764 ?auto_171761 ?auto_171765 ?auto_171767 ?auto_171766 ?auto_171768 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171817 - SURFACE
      ?auto_171818 - SURFACE
      ?auto_171819 - SURFACE
      ?auto_171816 - SURFACE
      ?auto_171820 - SURFACE
      ?auto_171822 - SURFACE
      ?auto_171821 - SURFACE
      ?auto_171823 - SURFACE
    )
    :vars
    (
      ?auto_171825 - HOIST
      ?auto_171824 - PLACE
      ?auto_171826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_171825 ?auto_171824 ) ( SURFACE-AT ?auto_171821 ?auto_171824 ) ( CLEAR ?auto_171821 ) ( IS-CRATE ?auto_171823 ) ( not ( = ?auto_171821 ?auto_171823 ) ) ( TRUCK-AT ?auto_171826 ?auto_171824 ) ( AVAILABLE ?auto_171825 ) ( IN ?auto_171823 ?auto_171826 ) ( ON ?auto_171821 ?auto_171822 ) ( not ( = ?auto_171822 ?auto_171821 ) ) ( not ( = ?auto_171822 ?auto_171823 ) ) ( ON ?auto_171818 ?auto_171817 ) ( ON ?auto_171819 ?auto_171818 ) ( ON ?auto_171816 ?auto_171819 ) ( ON ?auto_171820 ?auto_171816 ) ( ON ?auto_171822 ?auto_171820 ) ( not ( = ?auto_171817 ?auto_171818 ) ) ( not ( = ?auto_171817 ?auto_171819 ) ) ( not ( = ?auto_171817 ?auto_171816 ) ) ( not ( = ?auto_171817 ?auto_171820 ) ) ( not ( = ?auto_171817 ?auto_171822 ) ) ( not ( = ?auto_171817 ?auto_171821 ) ) ( not ( = ?auto_171817 ?auto_171823 ) ) ( not ( = ?auto_171818 ?auto_171819 ) ) ( not ( = ?auto_171818 ?auto_171816 ) ) ( not ( = ?auto_171818 ?auto_171820 ) ) ( not ( = ?auto_171818 ?auto_171822 ) ) ( not ( = ?auto_171818 ?auto_171821 ) ) ( not ( = ?auto_171818 ?auto_171823 ) ) ( not ( = ?auto_171819 ?auto_171816 ) ) ( not ( = ?auto_171819 ?auto_171820 ) ) ( not ( = ?auto_171819 ?auto_171822 ) ) ( not ( = ?auto_171819 ?auto_171821 ) ) ( not ( = ?auto_171819 ?auto_171823 ) ) ( not ( = ?auto_171816 ?auto_171820 ) ) ( not ( = ?auto_171816 ?auto_171822 ) ) ( not ( = ?auto_171816 ?auto_171821 ) ) ( not ( = ?auto_171816 ?auto_171823 ) ) ( not ( = ?auto_171820 ?auto_171822 ) ) ( not ( = ?auto_171820 ?auto_171821 ) ) ( not ( = ?auto_171820 ?auto_171823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171822 ?auto_171821 ?auto_171823 )
      ( MAKE-7CRATE-VERIFY ?auto_171817 ?auto_171818 ?auto_171819 ?auto_171816 ?auto_171820 ?auto_171822 ?auto_171821 ?auto_171823 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171880 - SURFACE
      ?auto_171881 - SURFACE
      ?auto_171882 - SURFACE
      ?auto_171879 - SURFACE
      ?auto_171883 - SURFACE
      ?auto_171885 - SURFACE
      ?auto_171884 - SURFACE
      ?auto_171886 - SURFACE
    )
    :vars
    (
      ?auto_171887 - HOIST
      ?auto_171890 - PLACE
      ?auto_171889 - TRUCK
      ?auto_171888 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171887 ?auto_171890 ) ( SURFACE-AT ?auto_171884 ?auto_171890 ) ( CLEAR ?auto_171884 ) ( IS-CRATE ?auto_171886 ) ( not ( = ?auto_171884 ?auto_171886 ) ) ( AVAILABLE ?auto_171887 ) ( IN ?auto_171886 ?auto_171889 ) ( ON ?auto_171884 ?auto_171885 ) ( not ( = ?auto_171885 ?auto_171884 ) ) ( not ( = ?auto_171885 ?auto_171886 ) ) ( TRUCK-AT ?auto_171889 ?auto_171888 ) ( not ( = ?auto_171888 ?auto_171890 ) ) ( ON ?auto_171881 ?auto_171880 ) ( ON ?auto_171882 ?auto_171881 ) ( ON ?auto_171879 ?auto_171882 ) ( ON ?auto_171883 ?auto_171879 ) ( ON ?auto_171885 ?auto_171883 ) ( not ( = ?auto_171880 ?auto_171881 ) ) ( not ( = ?auto_171880 ?auto_171882 ) ) ( not ( = ?auto_171880 ?auto_171879 ) ) ( not ( = ?auto_171880 ?auto_171883 ) ) ( not ( = ?auto_171880 ?auto_171885 ) ) ( not ( = ?auto_171880 ?auto_171884 ) ) ( not ( = ?auto_171880 ?auto_171886 ) ) ( not ( = ?auto_171881 ?auto_171882 ) ) ( not ( = ?auto_171881 ?auto_171879 ) ) ( not ( = ?auto_171881 ?auto_171883 ) ) ( not ( = ?auto_171881 ?auto_171885 ) ) ( not ( = ?auto_171881 ?auto_171884 ) ) ( not ( = ?auto_171881 ?auto_171886 ) ) ( not ( = ?auto_171882 ?auto_171879 ) ) ( not ( = ?auto_171882 ?auto_171883 ) ) ( not ( = ?auto_171882 ?auto_171885 ) ) ( not ( = ?auto_171882 ?auto_171884 ) ) ( not ( = ?auto_171882 ?auto_171886 ) ) ( not ( = ?auto_171879 ?auto_171883 ) ) ( not ( = ?auto_171879 ?auto_171885 ) ) ( not ( = ?auto_171879 ?auto_171884 ) ) ( not ( = ?auto_171879 ?auto_171886 ) ) ( not ( = ?auto_171883 ?auto_171885 ) ) ( not ( = ?auto_171883 ?auto_171884 ) ) ( not ( = ?auto_171883 ?auto_171886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171885 ?auto_171884 ?auto_171886 )
      ( MAKE-7CRATE-VERIFY ?auto_171880 ?auto_171881 ?auto_171882 ?auto_171879 ?auto_171883 ?auto_171885 ?auto_171884 ?auto_171886 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171950 - SURFACE
      ?auto_171951 - SURFACE
      ?auto_171952 - SURFACE
      ?auto_171949 - SURFACE
      ?auto_171953 - SURFACE
      ?auto_171955 - SURFACE
      ?auto_171954 - SURFACE
      ?auto_171956 - SURFACE
    )
    :vars
    (
      ?auto_171959 - HOIST
      ?auto_171960 - PLACE
      ?auto_171957 - TRUCK
      ?auto_171961 - PLACE
      ?auto_171958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_171959 ?auto_171960 ) ( SURFACE-AT ?auto_171954 ?auto_171960 ) ( CLEAR ?auto_171954 ) ( IS-CRATE ?auto_171956 ) ( not ( = ?auto_171954 ?auto_171956 ) ) ( AVAILABLE ?auto_171959 ) ( ON ?auto_171954 ?auto_171955 ) ( not ( = ?auto_171955 ?auto_171954 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( TRUCK-AT ?auto_171957 ?auto_171961 ) ( not ( = ?auto_171961 ?auto_171960 ) ) ( HOIST-AT ?auto_171958 ?auto_171961 ) ( LIFTING ?auto_171958 ?auto_171956 ) ( not ( = ?auto_171959 ?auto_171958 ) ) ( ON ?auto_171951 ?auto_171950 ) ( ON ?auto_171952 ?auto_171951 ) ( ON ?auto_171949 ?auto_171952 ) ( ON ?auto_171953 ?auto_171949 ) ( ON ?auto_171955 ?auto_171953 ) ( not ( = ?auto_171950 ?auto_171951 ) ) ( not ( = ?auto_171950 ?auto_171952 ) ) ( not ( = ?auto_171950 ?auto_171949 ) ) ( not ( = ?auto_171950 ?auto_171953 ) ) ( not ( = ?auto_171950 ?auto_171955 ) ) ( not ( = ?auto_171950 ?auto_171954 ) ) ( not ( = ?auto_171950 ?auto_171956 ) ) ( not ( = ?auto_171951 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171949 ) ) ( not ( = ?auto_171951 ?auto_171953 ) ) ( not ( = ?auto_171951 ?auto_171955 ) ) ( not ( = ?auto_171951 ?auto_171954 ) ) ( not ( = ?auto_171951 ?auto_171956 ) ) ( not ( = ?auto_171952 ?auto_171949 ) ) ( not ( = ?auto_171952 ?auto_171953 ) ) ( not ( = ?auto_171952 ?auto_171955 ) ) ( not ( = ?auto_171952 ?auto_171954 ) ) ( not ( = ?auto_171952 ?auto_171956 ) ) ( not ( = ?auto_171949 ?auto_171953 ) ) ( not ( = ?auto_171949 ?auto_171955 ) ) ( not ( = ?auto_171949 ?auto_171954 ) ) ( not ( = ?auto_171949 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171955 ) ) ( not ( = ?auto_171953 ?auto_171954 ) ) ( not ( = ?auto_171953 ?auto_171956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171955 ?auto_171954 ?auto_171956 )
      ( MAKE-7CRATE-VERIFY ?auto_171950 ?auto_171951 ?auto_171952 ?auto_171949 ?auto_171953 ?auto_171955 ?auto_171954 ?auto_171956 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172027 - SURFACE
      ?auto_172028 - SURFACE
      ?auto_172029 - SURFACE
      ?auto_172026 - SURFACE
      ?auto_172030 - SURFACE
      ?auto_172032 - SURFACE
      ?auto_172031 - SURFACE
      ?auto_172033 - SURFACE
    )
    :vars
    (
      ?auto_172036 - HOIST
      ?auto_172034 - PLACE
      ?auto_172039 - TRUCK
      ?auto_172037 - PLACE
      ?auto_172035 - HOIST
      ?auto_172038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_172036 ?auto_172034 ) ( SURFACE-AT ?auto_172031 ?auto_172034 ) ( CLEAR ?auto_172031 ) ( IS-CRATE ?auto_172033 ) ( not ( = ?auto_172031 ?auto_172033 ) ) ( AVAILABLE ?auto_172036 ) ( ON ?auto_172031 ?auto_172032 ) ( not ( = ?auto_172032 ?auto_172031 ) ) ( not ( = ?auto_172032 ?auto_172033 ) ) ( TRUCK-AT ?auto_172039 ?auto_172037 ) ( not ( = ?auto_172037 ?auto_172034 ) ) ( HOIST-AT ?auto_172035 ?auto_172037 ) ( not ( = ?auto_172036 ?auto_172035 ) ) ( AVAILABLE ?auto_172035 ) ( SURFACE-AT ?auto_172033 ?auto_172037 ) ( ON ?auto_172033 ?auto_172038 ) ( CLEAR ?auto_172033 ) ( not ( = ?auto_172031 ?auto_172038 ) ) ( not ( = ?auto_172033 ?auto_172038 ) ) ( not ( = ?auto_172032 ?auto_172038 ) ) ( ON ?auto_172028 ?auto_172027 ) ( ON ?auto_172029 ?auto_172028 ) ( ON ?auto_172026 ?auto_172029 ) ( ON ?auto_172030 ?auto_172026 ) ( ON ?auto_172032 ?auto_172030 ) ( not ( = ?auto_172027 ?auto_172028 ) ) ( not ( = ?auto_172027 ?auto_172029 ) ) ( not ( = ?auto_172027 ?auto_172026 ) ) ( not ( = ?auto_172027 ?auto_172030 ) ) ( not ( = ?auto_172027 ?auto_172032 ) ) ( not ( = ?auto_172027 ?auto_172031 ) ) ( not ( = ?auto_172027 ?auto_172033 ) ) ( not ( = ?auto_172027 ?auto_172038 ) ) ( not ( = ?auto_172028 ?auto_172029 ) ) ( not ( = ?auto_172028 ?auto_172026 ) ) ( not ( = ?auto_172028 ?auto_172030 ) ) ( not ( = ?auto_172028 ?auto_172032 ) ) ( not ( = ?auto_172028 ?auto_172031 ) ) ( not ( = ?auto_172028 ?auto_172033 ) ) ( not ( = ?auto_172028 ?auto_172038 ) ) ( not ( = ?auto_172029 ?auto_172026 ) ) ( not ( = ?auto_172029 ?auto_172030 ) ) ( not ( = ?auto_172029 ?auto_172032 ) ) ( not ( = ?auto_172029 ?auto_172031 ) ) ( not ( = ?auto_172029 ?auto_172033 ) ) ( not ( = ?auto_172029 ?auto_172038 ) ) ( not ( = ?auto_172026 ?auto_172030 ) ) ( not ( = ?auto_172026 ?auto_172032 ) ) ( not ( = ?auto_172026 ?auto_172031 ) ) ( not ( = ?auto_172026 ?auto_172033 ) ) ( not ( = ?auto_172026 ?auto_172038 ) ) ( not ( = ?auto_172030 ?auto_172032 ) ) ( not ( = ?auto_172030 ?auto_172031 ) ) ( not ( = ?auto_172030 ?auto_172033 ) ) ( not ( = ?auto_172030 ?auto_172038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172032 ?auto_172031 ?auto_172033 )
      ( MAKE-7CRATE-VERIFY ?auto_172027 ?auto_172028 ?auto_172029 ?auto_172026 ?auto_172030 ?auto_172032 ?auto_172031 ?auto_172033 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172105 - SURFACE
      ?auto_172106 - SURFACE
      ?auto_172107 - SURFACE
      ?auto_172104 - SURFACE
      ?auto_172108 - SURFACE
      ?auto_172110 - SURFACE
      ?auto_172109 - SURFACE
      ?auto_172111 - SURFACE
    )
    :vars
    (
      ?auto_172113 - HOIST
      ?auto_172116 - PLACE
      ?auto_172117 - PLACE
      ?auto_172112 - HOIST
      ?auto_172115 - SURFACE
      ?auto_172114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172113 ?auto_172116 ) ( SURFACE-AT ?auto_172109 ?auto_172116 ) ( CLEAR ?auto_172109 ) ( IS-CRATE ?auto_172111 ) ( not ( = ?auto_172109 ?auto_172111 ) ) ( AVAILABLE ?auto_172113 ) ( ON ?auto_172109 ?auto_172110 ) ( not ( = ?auto_172110 ?auto_172109 ) ) ( not ( = ?auto_172110 ?auto_172111 ) ) ( not ( = ?auto_172117 ?auto_172116 ) ) ( HOIST-AT ?auto_172112 ?auto_172117 ) ( not ( = ?auto_172113 ?auto_172112 ) ) ( AVAILABLE ?auto_172112 ) ( SURFACE-AT ?auto_172111 ?auto_172117 ) ( ON ?auto_172111 ?auto_172115 ) ( CLEAR ?auto_172111 ) ( not ( = ?auto_172109 ?auto_172115 ) ) ( not ( = ?auto_172111 ?auto_172115 ) ) ( not ( = ?auto_172110 ?auto_172115 ) ) ( TRUCK-AT ?auto_172114 ?auto_172116 ) ( ON ?auto_172106 ?auto_172105 ) ( ON ?auto_172107 ?auto_172106 ) ( ON ?auto_172104 ?auto_172107 ) ( ON ?auto_172108 ?auto_172104 ) ( ON ?auto_172110 ?auto_172108 ) ( not ( = ?auto_172105 ?auto_172106 ) ) ( not ( = ?auto_172105 ?auto_172107 ) ) ( not ( = ?auto_172105 ?auto_172104 ) ) ( not ( = ?auto_172105 ?auto_172108 ) ) ( not ( = ?auto_172105 ?auto_172110 ) ) ( not ( = ?auto_172105 ?auto_172109 ) ) ( not ( = ?auto_172105 ?auto_172111 ) ) ( not ( = ?auto_172105 ?auto_172115 ) ) ( not ( = ?auto_172106 ?auto_172107 ) ) ( not ( = ?auto_172106 ?auto_172104 ) ) ( not ( = ?auto_172106 ?auto_172108 ) ) ( not ( = ?auto_172106 ?auto_172110 ) ) ( not ( = ?auto_172106 ?auto_172109 ) ) ( not ( = ?auto_172106 ?auto_172111 ) ) ( not ( = ?auto_172106 ?auto_172115 ) ) ( not ( = ?auto_172107 ?auto_172104 ) ) ( not ( = ?auto_172107 ?auto_172108 ) ) ( not ( = ?auto_172107 ?auto_172110 ) ) ( not ( = ?auto_172107 ?auto_172109 ) ) ( not ( = ?auto_172107 ?auto_172111 ) ) ( not ( = ?auto_172107 ?auto_172115 ) ) ( not ( = ?auto_172104 ?auto_172108 ) ) ( not ( = ?auto_172104 ?auto_172110 ) ) ( not ( = ?auto_172104 ?auto_172109 ) ) ( not ( = ?auto_172104 ?auto_172111 ) ) ( not ( = ?auto_172104 ?auto_172115 ) ) ( not ( = ?auto_172108 ?auto_172110 ) ) ( not ( = ?auto_172108 ?auto_172109 ) ) ( not ( = ?auto_172108 ?auto_172111 ) ) ( not ( = ?auto_172108 ?auto_172115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172110 ?auto_172109 ?auto_172111 )
      ( MAKE-7CRATE-VERIFY ?auto_172105 ?auto_172106 ?auto_172107 ?auto_172104 ?auto_172108 ?auto_172110 ?auto_172109 ?auto_172111 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172183 - SURFACE
      ?auto_172184 - SURFACE
      ?auto_172185 - SURFACE
      ?auto_172182 - SURFACE
      ?auto_172186 - SURFACE
      ?auto_172188 - SURFACE
      ?auto_172187 - SURFACE
      ?auto_172189 - SURFACE
    )
    :vars
    (
      ?auto_172191 - HOIST
      ?auto_172194 - PLACE
      ?auto_172195 - PLACE
      ?auto_172190 - HOIST
      ?auto_172193 - SURFACE
      ?auto_172192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172191 ?auto_172194 ) ( IS-CRATE ?auto_172189 ) ( not ( = ?auto_172187 ?auto_172189 ) ) ( not ( = ?auto_172188 ?auto_172187 ) ) ( not ( = ?auto_172188 ?auto_172189 ) ) ( not ( = ?auto_172195 ?auto_172194 ) ) ( HOIST-AT ?auto_172190 ?auto_172195 ) ( not ( = ?auto_172191 ?auto_172190 ) ) ( AVAILABLE ?auto_172190 ) ( SURFACE-AT ?auto_172189 ?auto_172195 ) ( ON ?auto_172189 ?auto_172193 ) ( CLEAR ?auto_172189 ) ( not ( = ?auto_172187 ?auto_172193 ) ) ( not ( = ?auto_172189 ?auto_172193 ) ) ( not ( = ?auto_172188 ?auto_172193 ) ) ( TRUCK-AT ?auto_172192 ?auto_172194 ) ( SURFACE-AT ?auto_172188 ?auto_172194 ) ( CLEAR ?auto_172188 ) ( LIFTING ?auto_172191 ?auto_172187 ) ( IS-CRATE ?auto_172187 ) ( ON ?auto_172184 ?auto_172183 ) ( ON ?auto_172185 ?auto_172184 ) ( ON ?auto_172182 ?auto_172185 ) ( ON ?auto_172186 ?auto_172182 ) ( ON ?auto_172188 ?auto_172186 ) ( not ( = ?auto_172183 ?auto_172184 ) ) ( not ( = ?auto_172183 ?auto_172185 ) ) ( not ( = ?auto_172183 ?auto_172182 ) ) ( not ( = ?auto_172183 ?auto_172186 ) ) ( not ( = ?auto_172183 ?auto_172188 ) ) ( not ( = ?auto_172183 ?auto_172187 ) ) ( not ( = ?auto_172183 ?auto_172189 ) ) ( not ( = ?auto_172183 ?auto_172193 ) ) ( not ( = ?auto_172184 ?auto_172185 ) ) ( not ( = ?auto_172184 ?auto_172182 ) ) ( not ( = ?auto_172184 ?auto_172186 ) ) ( not ( = ?auto_172184 ?auto_172188 ) ) ( not ( = ?auto_172184 ?auto_172187 ) ) ( not ( = ?auto_172184 ?auto_172189 ) ) ( not ( = ?auto_172184 ?auto_172193 ) ) ( not ( = ?auto_172185 ?auto_172182 ) ) ( not ( = ?auto_172185 ?auto_172186 ) ) ( not ( = ?auto_172185 ?auto_172188 ) ) ( not ( = ?auto_172185 ?auto_172187 ) ) ( not ( = ?auto_172185 ?auto_172189 ) ) ( not ( = ?auto_172185 ?auto_172193 ) ) ( not ( = ?auto_172182 ?auto_172186 ) ) ( not ( = ?auto_172182 ?auto_172188 ) ) ( not ( = ?auto_172182 ?auto_172187 ) ) ( not ( = ?auto_172182 ?auto_172189 ) ) ( not ( = ?auto_172182 ?auto_172193 ) ) ( not ( = ?auto_172186 ?auto_172188 ) ) ( not ( = ?auto_172186 ?auto_172187 ) ) ( not ( = ?auto_172186 ?auto_172189 ) ) ( not ( = ?auto_172186 ?auto_172193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172188 ?auto_172187 ?auto_172189 )
      ( MAKE-7CRATE-VERIFY ?auto_172183 ?auto_172184 ?auto_172185 ?auto_172182 ?auto_172186 ?auto_172188 ?auto_172187 ?auto_172189 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172261 - SURFACE
      ?auto_172262 - SURFACE
      ?auto_172263 - SURFACE
      ?auto_172260 - SURFACE
      ?auto_172264 - SURFACE
      ?auto_172266 - SURFACE
      ?auto_172265 - SURFACE
      ?auto_172267 - SURFACE
    )
    :vars
    (
      ?auto_172273 - HOIST
      ?auto_172269 - PLACE
      ?auto_172272 - PLACE
      ?auto_172268 - HOIST
      ?auto_172270 - SURFACE
      ?auto_172271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172273 ?auto_172269 ) ( IS-CRATE ?auto_172267 ) ( not ( = ?auto_172265 ?auto_172267 ) ) ( not ( = ?auto_172266 ?auto_172265 ) ) ( not ( = ?auto_172266 ?auto_172267 ) ) ( not ( = ?auto_172272 ?auto_172269 ) ) ( HOIST-AT ?auto_172268 ?auto_172272 ) ( not ( = ?auto_172273 ?auto_172268 ) ) ( AVAILABLE ?auto_172268 ) ( SURFACE-AT ?auto_172267 ?auto_172272 ) ( ON ?auto_172267 ?auto_172270 ) ( CLEAR ?auto_172267 ) ( not ( = ?auto_172265 ?auto_172270 ) ) ( not ( = ?auto_172267 ?auto_172270 ) ) ( not ( = ?auto_172266 ?auto_172270 ) ) ( TRUCK-AT ?auto_172271 ?auto_172269 ) ( SURFACE-AT ?auto_172266 ?auto_172269 ) ( CLEAR ?auto_172266 ) ( IS-CRATE ?auto_172265 ) ( AVAILABLE ?auto_172273 ) ( IN ?auto_172265 ?auto_172271 ) ( ON ?auto_172262 ?auto_172261 ) ( ON ?auto_172263 ?auto_172262 ) ( ON ?auto_172260 ?auto_172263 ) ( ON ?auto_172264 ?auto_172260 ) ( ON ?auto_172266 ?auto_172264 ) ( not ( = ?auto_172261 ?auto_172262 ) ) ( not ( = ?auto_172261 ?auto_172263 ) ) ( not ( = ?auto_172261 ?auto_172260 ) ) ( not ( = ?auto_172261 ?auto_172264 ) ) ( not ( = ?auto_172261 ?auto_172266 ) ) ( not ( = ?auto_172261 ?auto_172265 ) ) ( not ( = ?auto_172261 ?auto_172267 ) ) ( not ( = ?auto_172261 ?auto_172270 ) ) ( not ( = ?auto_172262 ?auto_172263 ) ) ( not ( = ?auto_172262 ?auto_172260 ) ) ( not ( = ?auto_172262 ?auto_172264 ) ) ( not ( = ?auto_172262 ?auto_172266 ) ) ( not ( = ?auto_172262 ?auto_172265 ) ) ( not ( = ?auto_172262 ?auto_172267 ) ) ( not ( = ?auto_172262 ?auto_172270 ) ) ( not ( = ?auto_172263 ?auto_172260 ) ) ( not ( = ?auto_172263 ?auto_172264 ) ) ( not ( = ?auto_172263 ?auto_172266 ) ) ( not ( = ?auto_172263 ?auto_172265 ) ) ( not ( = ?auto_172263 ?auto_172267 ) ) ( not ( = ?auto_172263 ?auto_172270 ) ) ( not ( = ?auto_172260 ?auto_172264 ) ) ( not ( = ?auto_172260 ?auto_172266 ) ) ( not ( = ?auto_172260 ?auto_172265 ) ) ( not ( = ?auto_172260 ?auto_172267 ) ) ( not ( = ?auto_172260 ?auto_172270 ) ) ( not ( = ?auto_172264 ?auto_172266 ) ) ( not ( = ?auto_172264 ?auto_172265 ) ) ( not ( = ?auto_172264 ?auto_172267 ) ) ( not ( = ?auto_172264 ?auto_172270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172266 ?auto_172265 ?auto_172267 )
      ( MAKE-7CRATE-VERIFY ?auto_172261 ?auto_172262 ?auto_172263 ?auto_172260 ?auto_172264 ?auto_172266 ?auto_172265 ?auto_172267 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175180 - SURFACE
      ?auto_175181 - SURFACE
      ?auto_175182 - SURFACE
      ?auto_175179 - SURFACE
      ?auto_175183 - SURFACE
      ?auto_175185 - SURFACE
      ?auto_175184 - SURFACE
      ?auto_175186 - SURFACE
      ?auto_175187 - SURFACE
    )
    :vars
    (
      ?auto_175189 - HOIST
      ?auto_175188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175189 ?auto_175188 ) ( SURFACE-AT ?auto_175186 ?auto_175188 ) ( CLEAR ?auto_175186 ) ( LIFTING ?auto_175189 ?auto_175187 ) ( IS-CRATE ?auto_175187 ) ( not ( = ?auto_175186 ?auto_175187 ) ) ( ON ?auto_175181 ?auto_175180 ) ( ON ?auto_175182 ?auto_175181 ) ( ON ?auto_175179 ?auto_175182 ) ( ON ?auto_175183 ?auto_175179 ) ( ON ?auto_175185 ?auto_175183 ) ( ON ?auto_175184 ?auto_175185 ) ( ON ?auto_175186 ?auto_175184 ) ( not ( = ?auto_175180 ?auto_175181 ) ) ( not ( = ?auto_175180 ?auto_175182 ) ) ( not ( = ?auto_175180 ?auto_175179 ) ) ( not ( = ?auto_175180 ?auto_175183 ) ) ( not ( = ?auto_175180 ?auto_175185 ) ) ( not ( = ?auto_175180 ?auto_175184 ) ) ( not ( = ?auto_175180 ?auto_175186 ) ) ( not ( = ?auto_175180 ?auto_175187 ) ) ( not ( = ?auto_175181 ?auto_175182 ) ) ( not ( = ?auto_175181 ?auto_175179 ) ) ( not ( = ?auto_175181 ?auto_175183 ) ) ( not ( = ?auto_175181 ?auto_175185 ) ) ( not ( = ?auto_175181 ?auto_175184 ) ) ( not ( = ?auto_175181 ?auto_175186 ) ) ( not ( = ?auto_175181 ?auto_175187 ) ) ( not ( = ?auto_175182 ?auto_175179 ) ) ( not ( = ?auto_175182 ?auto_175183 ) ) ( not ( = ?auto_175182 ?auto_175185 ) ) ( not ( = ?auto_175182 ?auto_175184 ) ) ( not ( = ?auto_175182 ?auto_175186 ) ) ( not ( = ?auto_175182 ?auto_175187 ) ) ( not ( = ?auto_175179 ?auto_175183 ) ) ( not ( = ?auto_175179 ?auto_175185 ) ) ( not ( = ?auto_175179 ?auto_175184 ) ) ( not ( = ?auto_175179 ?auto_175186 ) ) ( not ( = ?auto_175179 ?auto_175187 ) ) ( not ( = ?auto_175183 ?auto_175185 ) ) ( not ( = ?auto_175183 ?auto_175184 ) ) ( not ( = ?auto_175183 ?auto_175186 ) ) ( not ( = ?auto_175183 ?auto_175187 ) ) ( not ( = ?auto_175185 ?auto_175184 ) ) ( not ( = ?auto_175185 ?auto_175186 ) ) ( not ( = ?auto_175185 ?auto_175187 ) ) ( not ( = ?auto_175184 ?auto_175186 ) ) ( not ( = ?auto_175184 ?auto_175187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_175186 ?auto_175187 )
      ( MAKE-8CRATE-VERIFY ?auto_175180 ?auto_175181 ?auto_175182 ?auto_175179 ?auto_175183 ?auto_175185 ?auto_175184 ?auto_175186 ?auto_175187 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175247 - SURFACE
      ?auto_175248 - SURFACE
      ?auto_175249 - SURFACE
      ?auto_175246 - SURFACE
      ?auto_175250 - SURFACE
      ?auto_175252 - SURFACE
      ?auto_175251 - SURFACE
      ?auto_175253 - SURFACE
      ?auto_175254 - SURFACE
    )
    :vars
    (
      ?auto_175257 - HOIST
      ?auto_175256 - PLACE
      ?auto_175255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175257 ?auto_175256 ) ( SURFACE-AT ?auto_175253 ?auto_175256 ) ( CLEAR ?auto_175253 ) ( IS-CRATE ?auto_175254 ) ( not ( = ?auto_175253 ?auto_175254 ) ) ( TRUCK-AT ?auto_175255 ?auto_175256 ) ( AVAILABLE ?auto_175257 ) ( IN ?auto_175254 ?auto_175255 ) ( ON ?auto_175253 ?auto_175251 ) ( not ( = ?auto_175251 ?auto_175253 ) ) ( not ( = ?auto_175251 ?auto_175254 ) ) ( ON ?auto_175248 ?auto_175247 ) ( ON ?auto_175249 ?auto_175248 ) ( ON ?auto_175246 ?auto_175249 ) ( ON ?auto_175250 ?auto_175246 ) ( ON ?auto_175252 ?auto_175250 ) ( ON ?auto_175251 ?auto_175252 ) ( not ( = ?auto_175247 ?auto_175248 ) ) ( not ( = ?auto_175247 ?auto_175249 ) ) ( not ( = ?auto_175247 ?auto_175246 ) ) ( not ( = ?auto_175247 ?auto_175250 ) ) ( not ( = ?auto_175247 ?auto_175252 ) ) ( not ( = ?auto_175247 ?auto_175251 ) ) ( not ( = ?auto_175247 ?auto_175253 ) ) ( not ( = ?auto_175247 ?auto_175254 ) ) ( not ( = ?auto_175248 ?auto_175249 ) ) ( not ( = ?auto_175248 ?auto_175246 ) ) ( not ( = ?auto_175248 ?auto_175250 ) ) ( not ( = ?auto_175248 ?auto_175252 ) ) ( not ( = ?auto_175248 ?auto_175251 ) ) ( not ( = ?auto_175248 ?auto_175253 ) ) ( not ( = ?auto_175248 ?auto_175254 ) ) ( not ( = ?auto_175249 ?auto_175246 ) ) ( not ( = ?auto_175249 ?auto_175250 ) ) ( not ( = ?auto_175249 ?auto_175252 ) ) ( not ( = ?auto_175249 ?auto_175251 ) ) ( not ( = ?auto_175249 ?auto_175253 ) ) ( not ( = ?auto_175249 ?auto_175254 ) ) ( not ( = ?auto_175246 ?auto_175250 ) ) ( not ( = ?auto_175246 ?auto_175252 ) ) ( not ( = ?auto_175246 ?auto_175251 ) ) ( not ( = ?auto_175246 ?auto_175253 ) ) ( not ( = ?auto_175246 ?auto_175254 ) ) ( not ( = ?auto_175250 ?auto_175252 ) ) ( not ( = ?auto_175250 ?auto_175251 ) ) ( not ( = ?auto_175250 ?auto_175253 ) ) ( not ( = ?auto_175250 ?auto_175254 ) ) ( not ( = ?auto_175252 ?auto_175251 ) ) ( not ( = ?auto_175252 ?auto_175253 ) ) ( not ( = ?auto_175252 ?auto_175254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175251 ?auto_175253 ?auto_175254 )
      ( MAKE-8CRATE-VERIFY ?auto_175247 ?auto_175248 ?auto_175249 ?auto_175246 ?auto_175250 ?auto_175252 ?auto_175251 ?auto_175253 ?auto_175254 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175323 - SURFACE
      ?auto_175324 - SURFACE
      ?auto_175325 - SURFACE
      ?auto_175322 - SURFACE
      ?auto_175326 - SURFACE
      ?auto_175328 - SURFACE
      ?auto_175327 - SURFACE
      ?auto_175329 - SURFACE
      ?auto_175330 - SURFACE
    )
    :vars
    (
      ?auto_175331 - HOIST
      ?auto_175332 - PLACE
      ?auto_175334 - TRUCK
      ?auto_175333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175331 ?auto_175332 ) ( SURFACE-AT ?auto_175329 ?auto_175332 ) ( CLEAR ?auto_175329 ) ( IS-CRATE ?auto_175330 ) ( not ( = ?auto_175329 ?auto_175330 ) ) ( AVAILABLE ?auto_175331 ) ( IN ?auto_175330 ?auto_175334 ) ( ON ?auto_175329 ?auto_175327 ) ( not ( = ?auto_175327 ?auto_175329 ) ) ( not ( = ?auto_175327 ?auto_175330 ) ) ( TRUCK-AT ?auto_175334 ?auto_175333 ) ( not ( = ?auto_175333 ?auto_175332 ) ) ( ON ?auto_175324 ?auto_175323 ) ( ON ?auto_175325 ?auto_175324 ) ( ON ?auto_175322 ?auto_175325 ) ( ON ?auto_175326 ?auto_175322 ) ( ON ?auto_175328 ?auto_175326 ) ( ON ?auto_175327 ?auto_175328 ) ( not ( = ?auto_175323 ?auto_175324 ) ) ( not ( = ?auto_175323 ?auto_175325 ) ) ( not ( = ?auto_175323 ?auto_175322 ) ) ( not ( = ?auto_175323 ?auto_175326 ) ) ( not ( = ?auto_175323 ?auto_175328 ) ) ( not ( = ?auto_175323 ?auto_175327 ) ) ( not ( = ?auto_175323 ?auto_175329 ) ) ( not ( = ?auto_175323 ?auto_175330 ) ) ( not ( = ?auto_175324 ?auto_175325 ) ) ( not ( = ?auto_175324 ?auto_175322 ) ) ( not ( = ?auto_175324 ?auto_175326 ) ) ( not ( = ?auto_175324 ?auto_175328 ) ) ( not ( = ?auto_175324 ?auto_175327 ) ) ( not ( = ?auto_175324 ?auto_175329 ) ) ( not ( = ?auto_175324 ?auto_175330 ) ) ( not ( = ?auto_175325 ?auto_175322 ) ) ( not ( = ?auto_175325 ?auto_175326 ) ) ( not ( = ?auto_175325 ?auto_175328 ) ) ( not ( = ?auto_175325 ?auto_175327 ) ) ( not ( = ?auto_175325 ?auto_175329 ) ) ( not ( = ?auto_175325 ?auto_175330 ) ) ( not ( = ?auto_175322 ?auto_175326 ) ) ( not ( = ?auto_175322 ?auto_175328 ) ) ( not ( = ?auto_175322 ?auto_175327 ) ) ( not ( = ?auto_175322 ?auto_175329 ) ) ( not ( = ?auto_175322 ?auto_175330 ) ) ( not ( = ?auto_175326 ?auto_175328 ) ) ( not ( = ?auto_175326 ?auto_175327 ) ) ( not ( = ?auto_175326 ?auto_175329 ) ) ( not ( = ?auto_175326 ?auto_175330 ) ) ( not ( = ?auto_175328 ?auto_175327 ) ) ( not ( = ?auto_175328 ?auto_175329 ) ) ( not ( = ?auto_175328 ?auto_175330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175327 ?auto_175329 ?auto_175330 )
      ( MAKE-8CRATE-VERIFY ?auto_175323 ?auto_175324 ?auto_175325 ?auto_175322 ?auto_175326 ?auto_175328 ?auto_175327 ?auto_175329 ?auto_175330 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175407 - SURFACE
      ?auto_175408 - SURFACE
      ?auto_175409 - SURFACE
      ?auto_175406 - SURFACE
      ?auto_175410 - SURFACE
      ?auto_175412 - SURFACE
      ?auto_175411 - SURFACE
      ?auto_175413 - SURFACE
      ?auto_175414 - SURFACE
    )
    :vars
    (
      ?auto_175416 - HOIST
      ?auto_175417 - PLACE
      ?auto_175415 - TRUCK
      ?auto_175418 - PLACE
      ?auto_175419 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_175416 ?auto_175417 ) ( SURFACE-AT ?auto_175413 ?auto_175417 ) ( CLEAR ?auto_175413 ) ( IS-CRATE ?auto_175414 ) ( not ( = ?auto_175413 ?auto_175414 ) ) ( AVAILABLE ?auto_175416 ) ( ON ?auto_175413 ?auto_175411 ) ( not ( = ?auto_175411 ?auto_175413 ) ) ( not ( = ?auto_175411 ?auto_175414 ) ) ( TRUCK-AT ?auto_175415 ?auto_175418 ) ( not ( = ?auto_175418 ?auto_175417 ) ) ( HOIST-AT ?auto_175419 ?auto_175418 ) ( LIFTING ?auto_175419 ?auto_175414 ) ( not ( = ?auto_175416 ?auto_175419 ) ) ( ON ?auto_175408 ?auto_175407 ) ( ON ?auto_175409 ?auto_175408 ) ( ON ?auto_175406 ?auto_175409 ) ( ON ?auto_175410 ?auto_175406 ) ( ON ?auto_175412 ?auto_175410 ) ( ON ?auto_175411 ?auto_175412 ) ( not ( = ?auto_175407 ?auto_175408 ) ) ( not ( = ?auto_175407 ?auto_175409 ) ) ( not ( = ?auto_175407 ?auto_175406 ) ) ( not ( = ?auto_175407 ?auto_175410 ) ) ( not ( = ?auto_175407 ?auto_175412 ) ) ( not ( = ?auto_175407 ?auto_175411 ) ) ( not ( = ?auto_175407 ?auto_175413 ) ) ( not ( = ?auto_175407 ?auto_175414 ) ) ( not ( = ?auto_175408 ?auto_175409 ) ) ( not ( = ?auto_175408 ?auto_175406 ) ) ( not ( = ?auto_175408 ?auto_175410 ) ) ( not ( = ?auto_175408 ?auto_175412 ) ) ( not ( = ?auto_175408 ?auto_175411 ) ) ( not ( = ?auto_175408 ?auto_175413 ) ) ( not ( = ?auto_175408 ?auto_175414 ) ) ( not ( = ?auto_175409 ?auto_175406 ) ) ( not ( = ?auto_175409 ?auto_175410 ) ) ( not ( = ?auto_175409 ?auto_175412 ) ) ( not ( = ?auto_175409 ?auto_175411 ) ) ( not ( = ?auto_175409 ?auto_175413 ) ) ( not ( = ?auto_175409 ?auto_175414 ) ) ( not ( = ?auto_175406 ?auto_175410 ) ) ( not ( = ?auto_175406 ?auto_175412 ) ) ( not ( = ?auto_175406 ?auto_175411 ) ) ( not ( = ?auto_175406 ?auto_175413 ) ) ( not ( = ?auto_175406 ?auto_175414 ) ) ( not ( = ?auto_175410 ?auto_175412 ) ) ( not ( = ?auto_175410 ?auto_175411 ) ) ( not ( = ?auto_175410 ?auto_175413 ) ) ( not ( = ?auto_175410 ?auto_175414 ) ) ( not ( = ?auto_175412 ?auto_175411 ) ) ( not ( = ?auto_175412 ?auto_175413 ) ) ( not ( = ?auto_175412 ?auto_175414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175411 ?auto_175413 ?auto_175414 )
      ( MAKE-8CRATE-VERIFY ?auto_175407 ?auto_175408 ?auto_175409 ?auto_175406 ?auto_175410 ?auto_175412 ?auto_175411 ?auto_175413 ?auto_175414 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175499 - SURFACE
      ?auto_175500 - SURFACE
      ?auto_175501 - SURFACE
      ?auto_175498 - SURFACE
      ?auto_175502 - SURFACE
      ?auto_175504 - SURFACE
      ?auto_175503 - SURFACE
      ?auto_175505 - SURFACE
      ?auto_175506 - SURFACE
    )
    :vars
    (
      ?auto_175507 - HOIST
      ?auto_175512 - PLACE
      ?auto_175510 - TRUCK
      ?auto_175509 - PLACE
      ?auto_175511 - HOIST
      ?auto_175508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175507 ?auto_175512 ) ( SURFACE-AT ?auto_175505 ?auto_175512 ) ( CLEAR ?auto_175505 ) ( IS-CRATE ?auto_175506 ) ( not ( = ?auto_175505 ?auto_175506 ) ) ( AVAILABLE ?auto_175507 ) ( ON ?auto_175505 ?auto_175503 ) ( not ( = ?auto_175503 ?auto_175505 ) ) ( not ( = ?auto_175503 ?auto_175506 ) ) ( TRUCK-AT ?auto_175510 ?auto_175509 ) ( not ( = ?auto_175509 ?auto_175512 ) ) ( HOIST-AT ?auto_175511 ?auto_175509 ) ( not ( = ?auto_175507 ?auto_175511 ) ) ( AVAILABLE ?auto_175511 ) ( SURFACE-AT ?auto_175506 ?auto_175509 ) ( ON ?auto_175506 ?auto_175508 ) ( CLEAR ?auto_175506 ) ( not ( = ?auto_175505 ?auto_175508 ) ) ( not ( = ?auto_175506 ?auto_175508 ) ) ( not ( = ?auto_175503 ?auto_175508 ) ) ( ON ?auto_175500 ?auto_175499 ) ( ON ?auto_175501 ?auto_175500 ) ( ON ?auto_175498 ?auto_175501 ) ( ON ?auto_175502 ?auto_175498 ) ( ON ?auto_175504 ?auto_175502 ) ( ON ?auto_175503 ?auto_175504 ) ( not ( = ?auto_175499 ?auto_175500 ) ) ( not ( = ?auto_175499 ?auto_175501 ) ) ( not ( = ?auto_175499 ?auto_175498 ) ) ( not ( = ?auto_175499 ?auto_175502 ) ) ( not ( = ?auto_175499 ?auto_175504 ) ) ( not ( = ?auto_175499 ?auto_175503 ) ) ( not ( = ?auto_175499 ?auto_175505 ) ) ( not ( = ?auto_175499 ?auto_175506 ) ) ( not ( = ?auto_175499 ?auto_175508 ) ) ( not ( = ?auto_175500 ?auto_175501 ) ) ( not ( = ?auto_175500 ?auto_175498 ) ) ( not ( = ?auto_175500 ?auto_175502 ) ) ( not ( = ?auto_175500 ?auto_175504 ) ) ( not ( = ?auto_175500 ?auto_175503 ) ) ( not ( = ?auto_175500 ?auto_175505 ) ) ( not ( = ?auto_175500 ?auto_175506 ) ) ( not ( = ?auto_175500 ?auto_175508 ) ) ( not ( = ?auto_175501 ?auto_175498 ) ) ( not ( = ?auto_175501 ?auto_175502 ) ) ( not ( = ?auto_175501 ?auto_175504 ) ) ( not ( = ?auto_175501 ?auto_175503 ) ) ( not ( = ?auto_175501 ?auto_175505 ) ) ( not ( = ?auto_175501 ?auto_175506 ) ) ( not ( = ?auto_175501 ?auto_175508 ) ) ( not ( = ?auto_175498 ?auto_175502 ) ) ( not ( = ?auto_175498 ?auto_175504 ) ) ( not ( = ?auto_175498 ?auto_175503 ) ) ( not ( = ?auto_175498 ?auto_175505 ) ) ( not ( = ?auto_175498 ?auto_175506 ) ) ( not ( = ?auto_175498 ?auto_175508 ) ) ( not ( = ?auto_175502 ?auto_175504 ) ) ( not ( = ?auto_175502 ?auto_175503 ) ) ( not ( = ?auto_175502 ?auto_175505 ) ) ( not ( = ?auto_175502 ?auto_175506 ) ) ( not ( = ?auto_175502 ?auto_175508 ) ) ( not ( = ?auto_175504 ?auto_175503 ) ) ( not ( = ?auto_175504 ?auto_175505 ) ) ( not ( = ?auto_175504 ?auto_175506 ) ) ( not ( = ?auto_175504 ?auto_175508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175503 ?auto_175505 ?auto_175506 )
      ( MAKE-8CRATE-VERIFY ?auto_175499 ?auto_175500 ?auto_175501 ?auto_175498 ?auto_175502 ?auto_175504 ?auto_175503 ?auto_175505 ?auto_175506 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175592 - SURFACE
      ?auto_175593 - SURFACE
      ?auto_175594 - SURFACE
      ?auto_175591 - SURFACE
      ?auto_175595 - SURFACE
      ?auto_175597 - SURFACE
      ?auto_175596 - SURFACE
      ?auto_175598 - SURFACE
      ?auto_175599 - SURFACE
    )
    :vars
    (
      ?auto_175602 - HOIST
      ?auto_175603 - PLACE
      ?auto_175604 - PLACE
      ?auto_175601 - HOIST
      ?auto_175600 - SURFACE
      ?auto_175605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175602 ?auto_175603 ) ( SURFACE-AT ?auto_175598 ?auto_175603 ) ( CLEAR ?auto_175598 ) ( IS-CRATE ?auto_175599 ) ( not ( = ?auto_175598 ?auto_175599 ) ) ( AVAILABLE ?auto_175602 ) ( ON ?auto_175598 ?auto_175596 ) ( not ( = ?auto_175596 ?auto_175598 ) ) ( not ( = ?auto_175596 ?auto_175599 ) ) ( not ( = ?auto_175604 ?auto_175603 ) ) ( HOIST-AT ?auto_175601 ?auto_175604 ) ( not ( = ?auto_175602 ?auto_175601 ) ) ( AVAILABLE ?auto_175601 ) ( SURFACE-AT ?auto_175599 ?auto_175604 ) ( ON ?auto_175599 ?auto_175600 ) ( CLEAR ?auto_175599 ) ( not ( = ?auto_175598 ?auto_175600 ) ) ( not ( = ?auto_175599 ?auto_175600 ) ) ( not ( = ?auto_175596 ?auto_175600 ) ) ( TRUCK-AT ?auto_175605 ?auto_175603 ) ( ON ?auto_175593 ?auto_175592 ) ( ON ?auto_175594 ?auto_175593 ) ( ON ?auto_175591 ?auto_175594 ) ( ON ?auto_175595 ?auto_175591 ) ( ON ?auto_175597 ?auto_175595 ) ( ON ?auto_175596 ?auto_175597 ) ( not ( = ?auto_175592 ?auto_175593 ) ) ( not ( = ?auto_175592 ?auto_175594 ) ) ( not ( = ?auto_175592 ?auto_175591 ) ) ( not ( = ?auto_175592 ?auto_175595 ) ) ( not ( = ?auto_175592 ?auto_175597 ) ) ( not ( = ?auto_175592 ?auto_175596 ) ) ( not ( = ?auto_175592 ?auto_175598 ) ) ( not ( = ?auto_175592 ?auto_175599 ) ) ( not ( = ?auto_175592 ?auto_175600 ) ) ( not ( = ?auto_175593 ?auto_175594 ) ) ( not ( = ?auto_175593 ?auto_175591 ) ) ( not ( = ?auto_175593 ?auto_175595 ) ) ( not ( = ?auto_175593 ?auto_175597 ) ) ( not ( = ?auto_175593 ?auto_175596 ) ) ( not ( = ?auto_175593 ?auto_175598 ) ) ( not ( = ?auto_175593 ?auto_175599 ) ) ( not ( = ?auto_175593 ?auto_175600 ) ) ( not ( = ?auto_175594 ?auto_175591 ) ) ( not ( = ?auto_175594 ?auto_175595 ) ) ( not ( = ?auto_175594 ?auto_175597 ) ) ( not ( = ?auto_175594 ?auto_175596 ) ) ( not ( = ?auto_175594 ?auto_175598 ) ) ( not ( = ?auto_175594 ?auto_175599 ) ) ( not ( = ?auto_175594 ?auto_175600 ) ) ( not ( = ?auto_175591 ?auto_175595 ) ) ( not ( = ?auto_175591 ?auto_175597 ) ) ( not ( = ?auto_175591 ?auto_175596 ) ) ( not ( = ?auto_175591 ?auto_175598 ) ) ( not ( = ?auto_175591 ?auto_175599 ) ) ( not ( = ?auto_175591 ?auto_175600 ) ) ( not ( = ?auto_175595 ?auto_175597 ) ) ( not ( = ?auto_175595 ?auto_175596 ) ) ( not ( = ?auto_175595 ?auto_175598 ) ) ( not ( = ?auto_175595 ?auto_175599 ) ) ( not ( = ?auto_175595 ?auto_175600 ) ) ( not ( = ?auto_175597 ?auto_175596 ) ) ( not ( = ?auto_175597 ?auto_175598 ) ) ( not ( = ?auto_175597 ?auto_175599 ) ) ( not ( = ?auto_175597 ?auto_175600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175596 ?auto_175598 ?auto_175599 )
      ( MAKE-8CRATE-VERIFY ?auto_175592 ?auto_175593 ?auto_175594 ?auto_175591 ?auto_175595 ?auto_175597 ?auto_175596 ?auto_175598 ?auto_175599 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175685 - SURFACE
      ?auto_175686 - SURFACE
      ?auto_175687 - SURFACE
      ?auto_175684 - SURFACE
      ?auto_175688 - SURFACE
      ?auto_175690 - SURFACE
      ?auto_175689 - SURFACE
      ?auto_175691 - SURFACE
      ?auto_175692 - SURFACE
    )
    :vars
    (
      ?auto_175696 - HOIST
      ?auto_175695 - PLACE
      ?auto_175693 - PLACE
      ?auto_175694 - HOIST
      ?auto_175697 - SURFACE
      ?auto_175698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175696 ?auto_175695 ) ( IS-CRATE ?auto_175692 ) ( not ( = ?auto_175691 ?auto_175692 ) ) ( not ( = ?auto_175689 ?auto_175691 ) ) ( not ( = ?auto_175689 ?auto_175692 ) ) ( not ( = ?auto_175693 ?auto_175695 ) ) ( HOIST-AT ?auto_175694 ?auto_175693 ) ( not ( = ?auto_175696 ?auto_175694 ) ) ( AVAILABLE ?auto_175694 ) ( SURFACE-AT ?auto_175692 ?auto_175693 ) ( ON ?auto_175692 ?auto_175697 ) ( CLEAR ?auto_175692 ) ( not ( = ?auto_175691 ?auto_175697 ) ) ( not ( = ?auto_175692 ?auto_175697 ) ) ( not ( = ?auto_175689 ?auto_175697 ) ) ( TRUCK-AT ?auto_175698 ?auto_175695 ) ( SURFACE-AT ?auto_175689 ?auto_175695 ) ( CLEAR ?auto_175689 ) ( LIFTING ?auto_175696 ?auto_175691 ) ( IS-CRATE ?auto_175691 ) ( ON ?auto_175686 ?auto_175685 ) ( ON ?auto_175687 ?auto_175686 ) ( ON ?auto_175684 ?auto_175687 ) ( ON ?auto_175688 ?auto_175684 ) ( ON ?auto_175690 ?auto_175688 ) ( ON ?auto_175689 ?auto_175690 ) ( not ( = ?auto_175685 ?auto_175686 ) ) ( not ( = ?auto_175685 ?auto_175687 ) ) ( not ( = ?auto_175685 ?auto_175684 ) ) ( not ( = ?auto_175685 ?auto_175688 ) ) ( not ( = ?auto_175685 ?auto_175690 ) ) ( not ( = ?auto_175685 ?auto_175689 ) ) ( not ( = ?auto_175685 ?auto_175691 ) ) ( not ( = ?auto_175685 ?auto_175692 ) ) ( not ( = ?auto_175685 ?auto_175697 ) ) ( not ( = ?auto_175686 ?auto_175687 ) ) ( not ( = ?auto_175686 ?auto_175684 ) ) ( not ( = ?auto_175686 ?auto_175688 ) ) ( not ( = ?auto_175686 ?auto_175690 ) ) ( not ( = ?auto_175686 ?auto_175689 ) ) ( not ( = ?auto_175686 ?auto_175691 ) ) ( not ( = ?auto_175686 ?auto_175692 ) ) ( not ( = ?auto_175686 ?auto_175697 ) ) ( not ( = ?auto_175687 ?auto_175684 ) ) ( not ( = ?auto_175687 ?auto_175688 ) ) ( not ( = ?auto_175687 ?auto_175690 ) ) ( not ( = ?auto_175687 ?auto_175689 ) ) ( not ( = ?auto_175687 ?auto_175691 ) ) ( not ( = ?auto_175687 ?auto_175692 ) ) ( not ( = ?auto_175687 ?auto_175697 ) ) ( not ( = ?auto_175684 ?auto_175688 ) ) ( not ( = ?auto_175684 ?auto_175690 ) ) ( not ( = ?auto_175684 ?auto_175689 ) ) ( not ( = ?auto_175684 ?auto_175691 ) ) ( not ( = ?auto_175684 ?auto_175692 ) ) ( not ( = ?auto_175684 ?auto_175697 ) ) ( not ( = ?auto_175688 ?auto_175690 ) ) ( not ( = ?auto_175688 ?auto_175689 ) ) ( not ( = ?auto_175688 ?auto_175691 ) ) ( not ( = ?auto_175688 ?auto_175692 ) ) ( not ( = ?auto_175688 ?auto_175697 ) ) ( not ( = ?auto_175690 ?auto_175689 ) ) ( not ( = ?auto_175690 ?auto_175691 ) ) ( not ( = ?auto_175690 ?auto_175692 ) ) ( not ( = ?auto_175690 ?auto_175697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175689 ?auto_175691 ?auto_175692 )
      ( MAKE-8CRATE-VERIFY ?auto_175685 ?auto_175686 ?auto_175687 ?auto_175684 ?auto_175688 ?auto_175690 ?auto_175689 ?auto_175691 ?auto_175692 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175778 - SURFACE
      ?auto_175779 - SURFACE
      ?auto_175780 - SURFACE
      ?auto_175777 - SURFACE
      ?auto_175781 - SURFACE
      ?auto_175783 - SURFACE
      ?auto_175782 - SURFACE
      ?auto_175784 - SURFACE
      ?auto_175785 - SURFACE
    )
    :vars
    (
      ?auto_175790 - HOIST
      ?auto_175791 - PLACE
      ?auto_175788 - PLACE
      ?auto_175786 - HOIST
      ?auto_175789 - SURFACE
      ?auto_175787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175790 ?auto_175791 ) ( IS-CRATE ?auto_175785 ) ( not ( = ?auto_175784 ?auto_175785 ) ) ( not ( = ?auto_175782 ?auto_175784 ) ) ( not ( = ?auto_175782 ?auto_175785 ) ) ( not ( = ?auto_175788 ?auto_175791 ) ) ( HOIST-AT ?auto_175786 ?auto_175788 ) ( not ( = ?auto_175790 ?auto_175786 ) ) ( AVAILABLE ?auto_175786 ) ( SURFACE-AT ?auto_175785 ?auto_175788 ) ( ON ?auto_175785 ?auto_175789 ) ( CLEAR ?auto_175785 ) ( not ( = ?auto_175784 ?auto_175789 ) ) ( not ( = ?auto_175785 ?auto_175789 ) ) ( not ( = ?auto_175782 ?auto_175789 ) ) ( TRUCK-AT ?auto_175787 ?auto_175791 ) ( SURFACE-AT ?auto_175782 ?auto_175791 ) ( CLEAR ?auto_175782 ) ( IS-CRATE ?auto_175784 ) ( AVAILABLE ?auto_175790 ) ( IN ?auto_175784 ?auto_175787 ) ( ON ?auto_175779 ?auto_175778 ) ( ON ?auto_175780 ?auto_175779 ) ( ON ?auto_175777 ?auto_175780 ) ( ON ?auto_175781 ?auto_175777 ) ( ON ?auto_175783 ?auto_175781 ) ( ON ?auto_175782 ?auto_175783 ) ( not ( = ?auto_175778 ?auto_175779 ) ) ( not ( = ?auto_175778 ?auto_175780 ) ) ( not ( = ?auto_175778 ?auto_175777 ) ) ( not ( = ?auto_175778 ?auto_175781 ) ) ( not ( = ?auto_175778 ?auto_175783 ) ) ( not ( = ?auto_175778 ?auto_175782 ) ) ( not ( = ?auto_175778 ?auto_175784 ) ) ( not ( = ?auto_175778 ?auto_175785 ) ) ( not ( = ?auto_175778 ?auto_175789 ) ) ( not ( = ?auto_175779 ?auto_175780 ) ) ( not ( = ?auto_175779 ?auto_175777 ) ) ( not ( = ?auto_175779 ?auto_175781 ) ) ( not ( = ?auto_175779 ?auto_175783 ) ) ( not ( = ?auto_175779 ?auto_175782 ) ) ( not ( = ?auto_175779 ?auto_175784 ) ) ( not ( = ?auto_175779 ?auto_175785 ) ) ( not ( = ?auto_175779 ?auto_175789 ) ) ( not ( = ?auto_175780 ?auto_175777 ) ) ( not ( = ?auto_175780 ?auto_175781 ) ) ( not ( = ?auto_175780 ?auto_175783 ) ) ( not ( = ?auto_175780 ?auto_175782 ) ) ( not ( = ?auto_175780 ?auto_175784 ) ) ( not ( = ?auto_175780 ?auto_175785 ) ) ( not ( = ?auto_175780 ?auto_175789 ) ) ( not ( = ?auto_175777 ?auto_175781 ) ) ( not ( = ?auto_175777 ?auto_175783 ) ) ( not ( = ?auto_175777 ?auto_175782 ) ) ( not ( = ?auto_175777 ?auto_175784 ) ) ( not ( = ?auto_175777 ?auto_175785 ) ) ( not ( = ?auto_175777 ?auto_175789 ) ) ( not ( = ?auto_175781 ?auto_175783 ) ) ( not ( = ?auto_175781 ?auto_175782 ) ) ( not ( = ?auto_175781 ?auto_175784 ) ) ( not ( = ?auto_175781 ?auto_175785 ) ) ( not ( = ?auto_175781 ?auto_175789 ) ) ( not ( = ?auto_175783 ?auto_175782 ) ) ( not ( = ?auto_175783 ?auto_175784 ) ) ( not ( = ?auto_175783 ?auto_175785 ) ) ( not ( = ?auto_175783 ?auto_175789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175782 ?auto_175784 ?auto_175785 )
      ( MAKE-8CRATE-VERIFY ?auto_175778 ?auto_175779 ?auto_175780 ?auto_175777 ?auto_175781 ?auto_175783 ?auto_175782 ?auto_175784 ?auto_175785 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179885 - SURFACE
      ?auto_179886 - SURFACE
      ?auto_179887 - SURFACE
      ?auto_179884 - SURFACE
      ?auto_179888 - SURFACE
      ?auto_179890 - SURFACE
      ?auto_179889 - SURFACE
      ?auto_179891 - SURFACE
      ?auto_179892 - SURFACE
      ?auto_179893 - SURFACE
    )
    :vars
    (
      ?auto_179894 - HOIST
      ?auto_179895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_179894 ?auto_179895 ) ( SURFACE-AT ?auto_179892 ?auto_179895 ) ( CLEAR ?auto_179892 ) ( LIFTING ?auto_179894 ?auto_179893 ) ( IS-CRATE ?auto_179893 ) ( not ( = ?auto_179892 ?auto_179893 ) ) ( ON ?auto_179886 ?auto_179885 ) ( ON ?auto_179887 ?auto_179886 ) ( ON ?auto_179884 ?auto_179887 ) ( ON ?auto_179888 ?auto_179884 ) ( ON ?auto_179890 ?auto_179888 ) ( ON ?auto_179889 ?auto_179890 ) ( ON ?auto_179891 ?auto_179889 ) ( ON ?auto_179892 ?auto_179891 ) ( not ( = ?auto_179885 ?auto_179886 ) ) ( not ( = ?auto_179885 ?auto_179887 ) ) ( not ( = ?auto_179885 ?auto_179884 ) ) ( not ( = ?auto_179885 ?auto_179888 ) ) ( not ( = ?auto_179885 ?auto_179890 ) ) ( not ( = ?auto_179885 ?auto_179889 ) ) ( not ( = ?auto_179885 ?auto_179891 ) ) ( not ( = ?auto_179885 ?auto_179892 ) ) ( not ( = ?auto_179885 ?auto_179893 ) ) ( not ( = ?auto_179886 ?auto_179887 ) ) ( not ( = ?auto_179886 ?auto_179884 ) ) ( not ( = ?auto_179886 ?auto_179888 ) ) ( not ( = ?auto_179886 ?auto_179890 ) ) ( not ( = ?auto_179886 ?auto_179889 ) ) ( not ( = ?auto_179886 ?auto_179891 ) ) ( not ( = ?auto_179886 ?auto_179892 ) ) ( not ( = ?auto_179886 ?auto_179893 ) ) ( not ( = ?auto_179887 ?auto_179884 ) ) ( not ( = ?auto_179887 ?auto_179888 ) ) ( not ( = ?auto_179887 ?auto_179890 ) ) ( not ( = ?auto_179887 ?auto_179889 ) ) ( not ( = ?auto_179887 ?auto_179891 ) ) ( not ( = ?auto_179887 ?auto_179892 ) ) ( not ( = ?auto_179887 ?auto_179893 ) ) ( not ( = ?auto_179884 ?auto_179888 ) ) ( not ( = ?auto_179884 ?auto_179890 ) ) ( not ( = ?auto_179884 ?auto_179889 ) ) ( not ( = ?auto_179884 ?auto_179891 ) ) ( not ( = ?auto_179884 ?auto_179892 ) ) ( not ( = ?auto_179884 ?auto_179893 ) ) ( not ( = ?auto_179888 ?auto_179890 ) ) ( not ( = ?auto_179888 ?auto_179889 ) ) ( not ( = ?auto_179888 ?auto_179891 ) ) ( not ( = ?auto_179888 ?auto_179892 ) ) ( not ( = ?auto_179888 ?auto_179893 ) ) ( not ( = ?auto_179890 ?auto_179889 ) ) ( not ( = ?auto_179890 ?auto_179891 ) ) ( not ( = ?auto_179890 ?auto_179892 ) ) ( not ( = ?auto_179890 ?auto_179893 ) ) ( not ( = ?auto_179889 ?auto_179891 ) ) ( not ( = ?auto_179889 ?auto_179892 ) ) ( not ( = ?auto_179889 ?auto_179893 ) ) ( not ( = ?auto_179891 ?auto_179892 ) ) ( not ( = ?auto_179891 ?auto_179893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_179892 ?auto_179893 )
      ( MAKE-9CRATE-VERIFY ?auto_179885 ?auto_179886 ?auto_179887 ?auto_179884 ?auto_179888 ?auto_179890 ?auto_179889 ?auto_179891 ?auto_179892 ?auto_179893 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_179965 - SURFACE
      ?auto_179966 - SURFACE
      ?auto_179967 - SURFACE
      ?auto_179964 - SURFACE
      ?auto_179968 - SURFACE
      ?auto_179970 - SURFACE
      ?auto_179969 - SURFACE
      ?auto_179971 - SURFACE
      ?auto_179972 - SURFACE
      ?auto_179973 - SURFACE
    )
    :vars
    (
      ?auto_179976 - HOIST
      ?auto_179975 - PLACE
      ?auto_179974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_179976 ?auto_179975 ) ( SURFACE-AT ?auto_179972 ?auto_179975 ) ( CLEAR ?auto_179972 ) ( IS-CRATE ?auto_179973 ) ( not ( = ?auto_179972 ?auto_179973 ) ) ( TRUCK-AT ?auto_179974 ?auto_179975 ) ( AVAILABLE ?auto_179976 ) ( IN ?auto_179973 ?auto_179974 ) ( ON ?auto_179972 ?auto_179971 ) ( not ( = ?auto_179971 ?auto_179972 ) ) ( not ( = ?auto_179971 ?auto_179973 ) ) ( ON ?auto_179966 ?auto_179965 ) ( ON ?auto_179967 ?auto_179966 ) ( ON ?auto_179964 ?auto_179967 ) ( ON ?auto_179968 ?auto_179964 ) ( ON ?auto_179970 ?auto_179968 ) ( ON ?auto_179969 ?auto_179970 ) ( ON ?auto_179971 ?auto_179969 ) ( not ( = ?auto_179965 ?auto_179966 ) ) ( not ( = ?auto_179965 ?auto_179967 ) ) ( not ( = ?auto_179965 ?auto_179964 ) ) ( not ( = ?auto_179965 ?auto_179968 ) ) ( not ( = ?auto_179965 ?auto_179970 ) ) ( not ( = ?auto_179965 ?auto_179969 ) ) ( not ( = ?auto_179965 ?auto_179971 ) ) ( not ( = ?auto_179965 ?auto_179972 ) ) ( not ( = ?auto_179965 ?auto_179973 ) ) ( not ( = ?auto_179966 ?auto_179967 ) ) ( not ( = ?auto_179966 ?auto_179964 ) ) ( not ( = ?auto_179966 ?auto_179968 ) ) ( not ( = ?auto_179966 ?auto_179970 ) ) ( not ( = ?auto_179966 ?auto_179969 ) ) ( not ( = ?auto_179966 ?auto_179971 ) ) ( not ( = ?auto_179966 ?auto_179972 ) ) ( not ( = ?auto_179966 ?auto_179973 ) ) ( not ( = ?auto_179967 ?auto_179964 ) ) ( not ( = ?auto_179967 ?auto_179968 ) ) ( not ( = ?auto_179967 ?auto_179970 ) ) ( not ( = ?auto_179967 ?auto_179969 ) ) ( not ( = ?auto_179967 ?auto_179971 ) ) ( not ( = ?auto_179967 ?auto_179972 ) ) ( not ( = ?auto_179967 ?auto_179973 ) ) ( not ( = ?auto_179964 ?auto_179968 ) ) ( not ( = ?auto_179964 ?auto_179970 ) ) ( not ( = ?auto_179964 ?auto_179969 ) ) ( not ( = ?auto_179964 ?auto_179971 ) ) ( not ( = ?auto_179964 ?auto_179972 ) ) ( not ( = ?auto_179964 ?auto_179973 ) ) ( not ( = ?auto_179968 ?auto_179970 ) ) ( not ( = ?auto_179968 ?auto_179969 ) ) ( not ( = ?auto_179968 ?auto_179971 ) ) ( not ( = ?auto_179968 ?auto_179972 ) ) ( not ( = ?auto_179968 ?auto_179973 ) ) ( not ( = ?auto_179970 ?auto_179969 ) ) ( not ( = ?auto_179970 ?auto_179971 ) ) ( not ( = ?auto_179970 ?auto_179972 ) ) ( not ( = ?auto_179970 ?auto_179973 ) ) ( not ( = ?auto_179969 ?auto_179971 ) ) ( not ( = ?auto_179969 ?auto_179972 ) ) ( not ( = ?auto_179969 ?auto_179973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_179971 ?auto_179972 ?auto_179973 )
      ( MAKE-9CRATE-VERIFY ?auto_179965 ?auto_179966 ?auto_179967 ?auto_179964 ?auto_179968 ?auto_179970 ?auto_179969 ?auto_179971 ?auto_179972 ?auto_179973 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180055 - SURFACE
      ?auto_180056 - SURFACE
      ?auto_180057 - SURFACE
      ?auto_180054 - SURFACE
      ?auto_180058 - SURFACE
      ?auto_180060 - SURFACE
      ?auto_180059 - SURFACE
      ?auto_180061 - SURFACE
      ?auto_180062 - SURFACE
      ?auto_180063 - SURFACE
    )
    :vars
    (
      ?auto_180064 - HOIST
      ?auto_180066 - PLACE
      ?auto_180065 - TRUCK
      ?auto_180067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180064 ?auto_180066 ) ( SURFACE-AT ?auto_180062 ?auto_180066 ) ( CLEAR ?auto_180062 ) ( IS-CRATE ?auto_180063 ) ( not ( = ?auto_180062 ?auto_180063 ) ) ( AVAILABLE ?auto_180064 ) ( IN ?auto_180063 ?auto_180065 ) ( ON ?auto_180062 ?auto_180061 ) ( not ( = ?auto_180061 ?auto_180062 ) ) ( not ( = ?auto_180061 ?auto_180063 ) ) ( TRUCK-AT ?auto_180065 ?auto_180067 ) ( not ( = ?auto_180067 ?auto_180066 ) ) ( ON ?auto_180056 ?auto_180055 ) ( ON ?auto_180057 ?auto_180056 ) ( ON ?auto_180054 ?auto_180057 ) ( ON ?auto_180058 ?auto_180054 ) ( ON ?auto_180060 ?auto_180058 ) ( ON ?auto_180059 ?auto_180060 ) ( ON ?auto_180061 ?auto_180059 ) ( not ( = ?auto_180055 ?auto_180056 ) ) ( not ( = ?auto_180055 ?auto_180057 ) ) ( not ( = ?auto_180055 ?auto_180054 ) ) ( not ( = ?auto_180055 ?auto_180058 ) ) ( not ( = ?auto_180055 ?auto_180060 ) ) ( not ( = ?auto_180055 ?auto_180059 ) ) ( not ( = ?auto_180055 ?auto_180061 ) ) ( not ( = ?auto_180055 ?auto_180062 ) ) ( not ( = ?auto_180055 ?auto_180063 ) ) ( not ( = ?auto_180056 ?auto_180057 ) ) ( not ( = ?auto_180056 ?auto_180054 ) ) ( not ( = ?auto_180056 ?auto_180058 ) ) ( not ( = ?auto_180056 ?auto_180060 ) ) ( not ( = ?auto_180056 ?auto_180059 ) ) ( not ( = ?auto_180056 ?auto_180061 ) ) ( not ( = ?auto_180056 ?auto_180062 ) ) ( not ( = ?auto_180056 ?auto_180063 ) ) ( not ( = ?auto_180057 ?auto_180054 ) ) ( not ( = ?auto_180057 ?auto_180058 ) ) ( not ( = ?auto_180057 ?auto_180060 ) ) ( not ( = ?auto_180057 ?auto_180059 ) ) ( not ( = ?auto_180057 ?auto_180061 ) ) ( not ( = ?auto_180057 ?auto_180062 ) ) ( not ( = ?auto_180057 ?auto_180063 ) ) ( not ( = ?auto_180054 ?auto_180058 ) ) ( not ( = ?auto_180054 ?auto_180060 ) ) ( not ( = ?auto_180054 ?auto_180059 ) ) ( not ( = ?auto_180054 ?auto_180061 ) ) ( not ( = ?auto_180054 ?auto_180062 ) ) ( not ( = ?auto_180054 ?auto_180063 ) ) ( not ( = ?auto_180058 ?auto_180060 ) ) ( not ( = ?auto_180058 ?auto_180059 ) ) ( not ( = ?auto_180058 ?auto_180061 ) ) ( not ( = ?auto_180058 ?auto_180062 ) ) ( not ( = ?auto_180058 ?auto_180063 ) ) ( not ( = ?auto_180060 ?auto_180059 ) ) ( not ( = ?auto_180060 ?auto_180061 ) ) ( not ( = ?auto_180060 ?auto_180062 ) ) ( not ( = ?auto_180060 ?auto_180063 ) ) ( not ( = ?auto_180059 ?auto_180061 ) ) ( not ( = ?auto_180059 ?auto_180062 ) ) ( not ( = ?auto_180059 ?auto_180063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180061 ?auto_180062 ?auto_180063 )
      ( MAKE-9CRATE-VERIFY ?auto_180055 ?auto_180056 ?auto_180057 ?auto_180054 ?auto_180058 ?auto_180060 ?auto_180059 ?auto_180061 ?auto_180062 ?auto_180063 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180154 - SURFACE
      ?auto_180155 - SURFACE
      ?auto_180156 - SURFACE
      ?auto_180153 - SURFACE
      ?auto_180157 - SURFACE
      ?auto_180159 - SURFACE
      ?auto_180158 - SURFACE
      ?auto_180160 - SURFACE
      ?auto_180161 - SURFACE
      ?auto_180162 - SURFACE
    )
    :vars
    (
      ?auto_180165 - HOIST
      ?auto_180163 - PLACE
      ?auto_180164 - TRUCK
      ?auto_180166 - PLACE
      ?auto_180167 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_180165 ?auto_180163 ) ( SURFACE-AT ?auto_180161 ?auto_180163 ) ( CLEAR ?auto_180161 ) ( IS-CRATE ?auto_180162 ) ( not ( = ?auto_180161 ?auto_180162 ) ) ( AVAILABLE ?auto_180165 ) ( ON ?auto_180161 ?auto_180160 ) ( not ( = ?auto_180160 ?auto_180161 ) ) ( not ( = ?auto_180160 ?auto_180162 ) ) ( TRUCK-AT ?auto_180164 ?auto_180166 ) ( not ( = ?auto_180166 ?auto_180163 ) ) ( HOIST-AT ?auto_180167 ?auto_180166 ) ( LIFTING ?auto_180167 ?auto_180162 ) ( not ( = ?auto_180165 ?auto_180167 ) ) ( ON ?auto_180155 ?auto_180154 ) ( ON ?auto_180156 ?auto_180155 ) ( ON ?auto_180153 ?auto_180156 ) ( ON ?auto_180157 ?auto_180153 ) ( ON ?auto_180159 ?auto_180157 ) ( ON ?auto_180158 ?auto_180159 ) ( ON ?auto_180160 ?auto_180158 ) ( not ( = ?auto_180154 ?auto_180155 ) ) ( not ( = ?auto_180154 ?auto_180156 ) ) ( not ( = ?auto_180154 ?auto_180153 ) ) ( not ( = ?auto_180154 ?auto_180157 ) ) ( not ( = ?auto_180154 ?auto_180159 ) ) ( not ( = ?auto_180154 ?auto_180158 ) ) ( not ( = ?auto_180154 ?auto_180160 ) ) ( not ( = ?auto_180154 ?auto_180161 ) ) ( not ( = ?auto_180154 ?auto_180162 ) ) ( not ( = ?auto_180155 ?auto_180156 ) ) ( not ( = ?auto_180155 ?auto_180153 ) ) ( not ( = ?auto_180155 ?auto_180157 ) ) ( not ( = ?auto_180155 ?auto_180159 ) ) ( not ( = ?auto_180155 ?auto_180158 ) ) ( not ( = ?auto_180155 ?auto_180160 ) ) ( not ( = ?auto_180155 ?auto_180161 ) ) ( not ( = ?auto_180155 ?auto_180162 ) ) ( not ( = ?auto_180156 ?auto_180153 ) ) ( not ( = ?auto_180156 ?auto_180157 ) ) ( not ( = ?auto_180156 ?auto_180159 ) ) ( not ( = ?auto_180156 ?auto_180158 ) ) ( not ( = ?auto_180156 ?auto_180160 ) ) ( not ( = ?auto_180156 ?auto_180161 ) ) ( not ( = ?auto_180156 ?auto_180162 ) ) ( not ( = ?auto_180153 ?auto_180157 ) ) ( not ( = ?auto_180153 ?auto_180159 ) ) ( not ( = ?auto_180153 ?auto_180158 ) ) ( not ( = ?auto_180153 ?auto_180160 ) ) ( not ( = ?auto_180153 ?auto_180161 ) ) ( not ( = ?auto_180153 ?auto_180162 ) ) ( not ( = ?auto_180157 ?auto_180159 ) ) ( not ( = ?auto_180157 ?auto_180158 ) ) ( not ( = ?auto_180157 ?auto_180160 ) ) ( not ( = ?auto_180157 ?auto_180161 ) ) ( not ( = ?auto_180157 ?auto_180162 ) ) ( not ( = ?auto_180159 ?auto_180158 ) ) ( not ( = ?auto_180159 ?auto_180160 ) ) ( not ( = ?auto_180159 ?auto_180161 ) ) ( not ( = ?auto_180159 ?auto_180162 ) ) ( not ( = ?auto_180158 ?auto_180160 ) ) ( not ( = ?auto_180158 ?auto_180161 ) ) ( not ( = ?auto_180158 ?auto_180162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180160 ?auto_180161 ?auto_180162 )
      ( MAKE-9CRATE-VERIFY ?auto_180154 ?auto_180155 ?auto_180156 ?auto_180153 ?auto_180157 ?auto_180159 ?auto_180158 ?auto_180160 ?auto_180161 ?auto_180162 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180262 - SURFACE
      ?auto_180263 - SURFACE
      ?auto_180264 - SURFACE
      ?auto_180261 - SURFACE
      ?auto_180265 - SURFACE
      ?auto_180267 - SURFACE
      ?auto_180266 - SURFACE
      ?auto_180268 - SURFACE
      ?auto_180269 - SURFACE
      ?auto_180270 - SURFACE
    )
    :vars
    (
      ?auto_180273 - HOIST
      ?auto_180276 - PLACE
      ?auto_180271 - TRUCK
      ?auto_180272 - PLACE
      ?auto_180274 - HOIST
      ?auto_180275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180273 ?auto_180276 ) ( SURFACE-AT ?auto_180269 ?auto_180276 ) ( CLEAR ?auto_180269 ) ( IS-CRATE ?auto_180270 ) ( not ( = ?auto_180269 ?auto_180270 ) ) ( AVAILABLE ?auto_180273 ) ( ON ?auto_180269 ?auto_180268 ) ( not ( = ?auto_180268 ?auto_180269 ) ) ( not ( = ?auto_180268 ?auto_180270 ) ) ( TRUCK-AT ?auto_180271 ?auto_180272 ) ( not ( = ?auto_180272 ?auto_180276 ) ) ( HOIST-AT ?auto_180274 ?auto_180272 ) ( not ( = ?auto_180273 ?auto_180274 ) ) ( AVAILABLE ?auto_180274 ) ( SURFACE-AT ?auto_180270 ?auto_180272 ) ( ON ?auto_180270 ?auto_180275 ) ( CLEAR ?auto_180270 ) ( not ( = ?auto_180269 ?auto_180275 ) ) ( not ( = ?auto_180270 ?auto_180275 ) ) ( not ( = ?auto_180268 ?auto_180275 ) ) ( ON ?auto_180263 ?auto_180262 ) ( ON ?auto_180264 ?auto_180263 ) ( ON ?auto_180261 ?auto_180264 ) ( ON ?auto_180265 ?auto_180261 ) ( ON ?auto_180267 ?auto_180265 ) ( ON ?auto_180266 ?auto_180267 ) ( ON ?auto_180268 ?auto_180266 ) ( not ( = ?auto_180262 ?auto_180263 ) ) ( not ( = ?auto_180262 ?auto_180264 ) ) ( not ( = ?auto_180262 ?auto_180261 ) ) ( not ( = ?auto_180262 ?auto_180265 ) ) ( not ( = ?auto_180262 ?auto_180267 ) ) ( not ( = ?auto_180262 ?auto_180266 ) ) ( not ( = ?auto_180262 ?auto_180268 ) ) ( not ( = ?auto_180262 ?auto_180269 ) ) ( not ( = ?auto_180262 ?auto_180270 ) ) ( not ( = ?auto_180262 ?auto_180275 ) ) ( not ( = ?auto_180263 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180261 ) ) ( not ( = ?auto_180263 ?auto_180265 ) ) ( not ( = ?auto_180263 ?auto_180267 ) ) ( not ( = ?auto_180263 ?auto_180266 ) ) ( not ( = ?auto_180263 ?auto_180268 ) ) ( not ( = ?auto_180263 ?auto_180269 ) ) ( not ( = ?auto_180263 ?auto_180270 ) ) ( not ( = ?auto_180263 ?auto_180275 ) ) ( not ( = ?auto_180264 ?auto_180261 ) ) ( not ( = ?auto_180264 ?auto_180265 ) ) ( not ( = ?auto_180264 ?auto_180267 ) ) ( not ( = ?auto_180264 ?auto_180266 ) ) ( not ( = ?auto_180264 ?auto_180268 ) ) ( not ( = ?auto_180264 ?auto_180269 ) ) ( not ( = ?auto_180264 ?auto_180270 ) ) ( not ( = ?auto_180264 ?auto_180275 ) ) ( not ( = ?auto_180261 ?auto_180265 ) ) ( not ( = ?auto_180261 ?auto_180267 ) ) ( not ( = ?auto_180261 ?auto_180266 ) ) ( not ( = ?auto_180261 ?auto_180268 ) ) ( not ( = ?auto_180261 ?auto_180269 ) ) ( not ( = ?auto_180261 ?auto_180270 ) ) ( not ( = ?auto_180261 ?auto_180275 ) ) ( not ( = ?auto_180265 ?auto_180267 ) ) ( not ( = ?auto_180265 ?auto_180266 ) ) ( not ( = ?auto_180265 ?auto_180268 ) ) ( not ( = ?auto_180265 ?auto_180269 ) ) ( not ( = ?auto_180265 ?auto_180270 ) ) ( not ( = ?auto_180265 ?auto_180275 ) ) ( not ( = ?auto_180267 ?auto_180266 ) ) ( not ( = ?auto_180267 ?auto_180268 ) ) ( not ( = ?auto_180267 ?auto_180269 ) ) ( not ( = ?auto_180267 ?auto_180270 ) ) ( not ( = ?auto_180267 ?auto_180275 ) ) ( not ( = ?auto_180266 ?auto_180268 ) ) ( not ( = ?auto_180266 ?auto_180269 ) ) ( not ( = ?auto_180266 ?auto_180270 ) ) ( not ( = ?auto_180266 ?auto_180275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180268 ?auto_180269 ?auto_180270 )
      ( MAKE-9CRATE-VERIFY ?auto_180262 ?auto_180263 ?auto_180264 ?auto_180261 ?auto_180265 ?auto_180267 ?auto_180266 ?auto_180268 ?auto_180269 ?auto_180270 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180371 - SURFACE
      ?auto_180372 - SURFACE
      ?auto_180373 - SURFACE
      ?auto_180370 - SURFACE
      ?auto_180374 - SURFACE
      ?auto_180376 - SURFACE
      ?auto_180375 - SURFACE
      ?auto_180377 - SURFACE
      ?auto_180378 - SURFACE
      ?auto_180379 - SURFACE
    )
    :vars
    (
      ?auto_180385 - HOIST
      ?auto_180381 - PLACE
      ?auto_180383 - PLACE
      ?auto_180382 - HOIST
      ?auto_180380 - SURFACE
      ?auto_180384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180385 ?auto_180381 ) ( SURFACE-AT ?auto_180378 ?auto_180381 ) ( CLEAR ?auto_180378 ) ( IS-CRATE ?auto_180379 ) ( not ( = ?auto_180378 ?auto_180379 ) ) ( AVAILABLE ?auto_180385 ) ( ON ?auto_180378 ?auto_180377 ) ( not ( = ?auto_180377 ?auto_180378 ) ) ( not ( = ?auto_180377 ?auto_180379 ) ) ( not ( = ?auto_180383 ?auto_180381 ) ) ( HOIST-AT ?auto_180382 ?auto_180383 ) ( not ( = ?auto_180385 ?auto_180382 ) ) ( AVAILABLE ?auto_180382 ) ( SURFACE-AT ?auto_180379 ?auto_180383 ) ( ON ?auto_180379 ?auto_180380 ) ( CLEAR ?auto_180379 ) ( not ( = ?auto_180378 ?auto_180380 ) ) ( not ( = ?auto_180379 ?auto_180380 ) ) ( not ( = ?auto_180377 ?auto_180380 ) ) ( TRUCK-AT ?auto_180384 ?auto_180381 ) ( ON ?auto_180372 ?auto_180371 ) ( ON ?auto_180373 ?auto_180372 ) ( ON ?auto_180370 ?auto_180373 ) ( ON ?auto_180374 ?auto_180370 ) ( ON ?auto_180376 ?auto_180374 ) ( ON ?auto_180375 ?auto_180376 ) ( ON ?auto_180377 ?auto_180375 ) ( not ( = ?auto_180371 ?auto_180372 ) ) ( not ( = ?auto_180371 ?auto_180373 ) ) ( not ( = ?auto_180371 ?auto_180370 ) ) ( not ( = ?auto_180371 ?auto_180374 ) ) ( not ( = ?auto_180371 ?auto_180376 ) ) ( not ( = ?auto_180371 ?auto_180375 ) ) ( not ( = ?auto_180371 ?auto_180377 ) ) ( not ( = ?auto_180371 ?auto_180378 ) ) ( not ( = ?auto_180371 ?auto_180379 ) ) ( not ( = ?auto_180371 ?auto_180380 ) ) ( not ( = ?auto_180372 ?auto_180373 ) ) ( not ( = ?auto_180372 ?auto_180370 ) ) ( not ( = ?auto_180372 ?auto_180374 ) ) ( not ( = ?auto_180372 ?auto_180376 ) ) ( not ( = ?auto_180372 ?auto_180375 ) ) ( not ( = ?auto_180372 ?auto_180377 ) ) ( not ( = ?auto_180372 ?auto_180378 ) ) ( not ( = ?auto_180372 ?auto_180379 ) ) ( not ( = ?auto_180372 ?auto_180380 ) ) ( not ( = ?auto_180373 ?auto_180370 ) ) ( not ( = ?auto_180373 ?auto_180374 ) ) ( not ( = ?auto_180373 ?auto_180376 ) ) ( not ( = ?auto_180373 ?auto_180375 ) ) ( not ( = ?auto_180373 ?auto_180377 ) ) ( not ( = ?auto_180373 ?auto_180378 ) ) ( not ( = ?auto_180373 ?auto_180379 ) ) ( not ( = ?auto_180373 ?auto_180380 ) ) ( not ( = ?auto_180370 ?auto_180374 ) ) ( not ( = ?auto_180370 ?auto_180376 ) ) ( not ( = ?auto_180370 ?auto_180375 ) ) ( not ( = ?auto_180370 ?auto_180377 ) ) ( not ( = ?auto_180370 ?auto_180378 ) ) ( not ( = ?auto_180370 ?auto_180379 ) ) ( not ( = ?auto_180370 ?auto_180380 ) ) ( not ( = ?auto_180374 ?auto_180376 ) ) ( not ( = ?auto_180374 ?auto_180375 ) ) ( not ( = ?auto_180374 ?auto_180377 ) ) ( not ( = ?auto_180374 ?auto_180378 ) ) ( not ( = ?auto_180374 ?auto_180379 ) ) ( not ( = ?auto_180374 ?auto_180380 ) ) ( not ( = ?auto_180376 ?auto_180375 ) ) ( not ( = ?auto_180376 ?auto_180377 ) ) ( not ( = ?auto_180376 ?auto_180378 ) ) ( not ( = ?auto_180376 ?auto_180379 ) ) ( not ( = ?auto_180376 ?auto_180380 ) ) ( not ( = ?auto_180375 ?auto_180377 ) ) ( not ( = ?auto_180375 ?auto_180378 ) ) ( not ( = ?auto_180375 ?auto_180379 ) ) ( not ( = ?auto_180375 ?auto_180380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180377 ?auto_180378 ?auto_180379 )
      ( MAKE-9CRATE-VERIFY ?auto_180371 ?auto_180372 ?auto_180373 ?auto_180370 ?auto_180374 ?auto_180376 ?auto_180375 ?auto_180377 ?auto_180378 ?auto_180379 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180480 - SURFACE
      ?auto_180481 - SURFACE
      ?auto_180482 - SURFACE
      ?auto_180479 - SURFACE
      ?auto_180483 - SURFACE
      ?auto_180485 - SURFACE
      ?auto_180484 - SURFACE
      ?auto_180486 - SURFACE
      ?auto_180487 - SURFACE
      ?auto_180488 - SURFACE
    )
    :vars
    (
      ?auto_180490 - HOIST
      ?auto_180491 - PLACE
      ?auto_180489 - PLACE
      ?auto_180494 - HOIST
      ?auto_180493 - SURFACE
      ?auto_180492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180490 ?auto_180491 ) ( IS-CRATE ?auto_180488 ) ( not ( = ?auto_180487 ?auto_180488 ) ) ( not ( = ?auto_180486 ?auto_180487 ) ) ( not ( = ?auto_180486 ?auto_180488 ) ) ( not ( = ?auto_180489 ?auto_180491 ) ) ( HOIST-AT ?auto_180494 ?auto_180489 ) ( not ( = ?auto_180490 ?auto_180494 ) ) ( AVAILABLE ?auto_180494 ) ( SURFACE-AT ?auto_180488 ?auto_180489 ) ( ON ?auto_180488 ?auto_180493 ) ( CLEAR ?auto_180488 ) ( not ( = ?auto_180487 ?auto_180493 ) ) ( not ( = ?auto_180488 ?auto_180493 ) ) ( not ( = ?auto_180486 ?auto_180493 ) ) ( TRUCK-AT ?auto_180492 ?auto_180491 ) ( SURFACE-AT ?auto_180486 ?auto_180491 ) ( CLEAR ?auto_180486 ) ( LIFTING ?auto_180490 ?auto_180487 ) ( IS-CRATE ?auto_180487 ) ( ON ?auto_180481 ?auto_180480 ) ( ON ?auto_180482 ?auto_180481 ) ( ON ?auto_180479 ?auto_180482 ) ( ON ?auto_180483 ?auto_180479 ) ( ON ?auto_180485 ?auto_180483 ) ( ON ?auto_180484 ?auto_180485 ) ( ON ?auto_180486 ?auto_180484 ) ( not ( = ?auto_180480 ?auto_180481 ) ) ( not ( = ?auto_180480 ?auto_180482 ) ) ( not ( = ?auto_180480 ?auto_180479 ) ) ( not ( = ?auto_180480 ?auto_180483 ) ) ( not ( = ?auto_180480 ?auto_180485 ) ) ( not ( = ?auto_180480 ?auto_180484 ) ) ( not ( = ?auto_180480 ?auto_180486 ) ) ( not ( = ?auto_180480 ?auto_180487 ) ) ( not ( = ?auto_180480 ?auto_180488 ) ) ( not ( = ?auto_180480 ?auto_180493 ) ) ( not ( = ?auto_180481 ?auto_180482 ) ) ( not ( = ?auto_180481 ?auto_180479 ) ) ( not ( = ?auto_180481 ?auto_180483 ) ) ( not ( = ?auto_180481 ?auto_180485 ) ) ( not ( = ?auto_180481 ?auto_180484 ) ) ( not ( = ?auto_180481 ?auto_180486 ) ) ( not ( = ?auto_180481 ?auto_180487 ) ) ( not ( = ?auto_180481 ?auto_180488 ) ) ( not ( = ?auto_180481 ?auto_180493 ) ) ( not ( = ?auto_180482 ?auto_180479 ) ) ( not ( = ?auto_180482 ?auto_180483 ) ) ( not ( = ?auto_180482 ?auto_180485 ) ) ( not ( = ?auto_180482 ?auto_180484 ) ) ( not ( = ?auto_180482 ?auto_180486 ) ) ( not ( = ?auto_180482 ?auto_180487 ) ) ( not ( = ?auto_180482 ?auto_180488 ) ) ( not ( = ?auto_180482 ?auto_180493 ) ) ( not ( = ?auto_180479 ?auto_180483 ) ) ( not ( = ?auto_180479 ?auto_180485 ) ) ( not ( = ?auto_180479 ?auto_180484 ) ) ( not ( = ?auto_180479 ?auto_180486 ) ) ( not ( = ?auto_180479 ?auto_180487 ) ) ( not ( = ?auto_180479 ?auto_180488 ) ) ( not ( = ?auto_180479 ?auto_180493 ) ) ( not ( = ?auto_180483 ?auto_180485 ) ) ( not ( = ?auto_180483 ?auto_180484 ) ) ( not ( = ?auto_180483 ?auto_180486 ) ) ( not ( = ?auto_180483 ?auto_180487 ) ) ( not ( = ?auto_180483 ?auto_180488 ) ) ( not ( = ?auto_180483 ?auto_180493 ) ) ( not ( = ?auto_180485 ?auto_180484 ) ) ( not ( = ?auto_180485 ?auto_180486 ) ) ( not ( = ?auto_180485 ?auto_180487 ) ) ( not ( = ?auto_180485 ?auto_180488 ) ) ( not ( = ?auto_180485 ?auto_180493 ) ) ( not ( = ?auto_180484 ?auto_180486 ) ) ( not ( = ?auto_180484 ?auto_180487 ) ) ( not ( = ?auto_180484 ?auto_180488 ) ) ( not ( = ?auto_180484 ?auto_180493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180486 ?auto_180487 ?auto_180488 )
      ( MAKE-9CRATE-VERIFY ?auto_180480 ?auto_180481 ?auto_180482 ?auto_180479 ?auto_180483 ?auto_180485 ?auto_180484 ?auto_180486 ?auto_180487 ?auto_180488 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180589 - SURFACE
      ?auto_180590 - SURFACE
      ?auto_180591 - SURFACE
      ?auto_180588 - SURFACE
      ?auto_180592 - SURFACE
      ?auto_180594 - SURFACE
      ?auto_180593 - SURFACE
      ?auto_180595 - SURFACE
      ?auto_180596 - SURFACE
      ?auto_180597 - SURFACE
    )
    :vars
    (
      ?auto_180601 - HOIST
      ?auto_180599 - PLACE
      ?auto_180603 - PLACE
      ?auto_180598 - HOIST
      ?auto_180600 - SURFACE
      ?auto_180602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180601 ?auto_180599 ) ( IS-CRATE ?auto_180597 ) ( not ( = ?auto_180596 ?auto_180597 ) ) ( not ( = ?auto_180595 ?auto_180596 ) ) ( not ( = ?auto_180595 ?auto_180597 ) ) ( not ( = ?auto_180603 ?auto_180599 ) ) ( HOIST-AT ?auto_180598 ?auto_180603 ) ( not ( = ?auto_180601 ?auto_180598 ) ) ( AVAILABLE ?auto_180598 ) ( SURFACE-AT ?auto_180597 ?auto_180603 ) ( ON ?auto_180597 ?auto_180600 ) ( CLEAR ?auto_180597 ) ( not ( = ?auto_180596 ?auto_180600 ) ) ( not ( = ?auto_180597 ?auto_180600 ) ) ( not ( = ?auto_180595 ?auto_180600 ) ) ( TRUCK-AT ?auto_180602 ?auto_180599 ) ( SURFACE-AT ?auto_180595 ?auto_180599 ) ( CLEAR ?auto_180595 ) ( IS-CRATE ?auto_180596 ) ( AVAILABLE ?auto_180601 ) ( IN ?auto_180596 ?auto_180602 ) ( ON ?auto_180590 ?auto_180589 ) ( ON ?auto_180591 ?auto_180590 ) ( ON ?auto_180588 ?auto_180591 ) ( ON ?auto_180592 ?auto_180588 ) ( ON ?auto_180594 ?auto_180592 ) ( ON ?auto_180593 ?auto_180594 ) ( ON ?auto_180595 ?auto_180593 ) ( not ( = ?auto_180589 ?auto_180590 ) ) ( not ( = ?auto_180589 ?auto_180591 ) ) ( not ( = ?auto_180589 ?auto_180588 ) ) ( not ( = ?auto_180589 ?auto_180592 ) ) ( not ( = ?auto_180589 ?auto_180594 ) ) ( not ( = ?auto_180589 ?auto_180593 ) ) ( not ( = ?auto_180589 ?auto_180595 ) ) ( not ( = ?auto_180589 ?auto_180596 ) ) ( not ( = ?auto_180589 ?auto_180597 ) ) ( not ( = ?auto_180589 ?auto_180600 ) ) ( not ( = ?auto_180590 ?auto_180591 ) ) ( not ( = ?auto_180590 ?auto_180588 ) ) ( not ( = ?auto_180590 ?auto_180592 ) ) ( not ( = ?auto_180590 ?auto_180594 ) ) ( not ( = ?auto_180590 ?auto_180593 ) ) ( not ( = ?auto_180590 ?auto_180595 ) ) ( not ( = ?auto_180590 ?auto_180596 ) ) ( not ( = ?auto_180590 ?auto_180597 ) ) ( not ( = ?auto_180590 ?auto_180600 ) ) ( not ( = ?auto_180591 ?auto_180588 ) ) ( not ( = ?auto_180591 ?auto_180592 ) ) ( not ( = ?auto_180591 ?auto_180594 ) ) ( not ( = ?auto_180591 ?auto_180593 ) ) ( not ( = ?auto_180591 ?auto_180595 ) ) ( not ( = ?auto_180591 ?auto_180596 ) ) ( not ( = ?auto_180591 ?auto_180597 ) ) ( not ( = ?auto_180591 ?auto_180600 ) ) ( not ( = ?auto_180588 ?auto_180592 ) ) ( not ( = ?auto_180588 ?auto_180594 ) ) ( not ( = ?auto_180588 ?auto_180593 ) ) ( not ( = ?auto_180588 ?auto_180595 ) ) ( not ( = ?auto_180588 ?auto_180596 ) ) ( not ( = ?auto_180588 ?auto_180597 ) ) ( not ( = ?auto_180588 ?auto_180600 ) ) ( not ( = ?auto_180592 ?auto_180594 ) ) ( not ( = ?auto_180592 ?auto_180593 ) ) ( not ( = ?auto_180592 ?auto_180595 ) ) ( not ( = ?auto_180592 ?auto_180596 ) ) ( not ( = ?auto_180592 ?auto_180597 ) ) ( not ( = ?auto_180592 ?auto_180600 ) ) ( not ( = ?auto_180594 ?auto_180593 ) ) ( not ( = ?auto_180594 ?auto_180595 ) ) ( not ( = ?auto_180594 ?auto_180596 ) ) ( not ( = ?auto_180594 ?auto_180597 ) ) ( not ( = ?auto_180594 ?auto_180600 ) ) ( not ( = ?auto_180593 ?auto_180595 ) ) ( not ( = ?auto_180593 ?auto_180596 ) ) ( not ( = ?auto_180593 ?auto_180597 ) ) ( not ( = ?auto_180593 ?auto_180600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180595 ?auto_180596 ?auto_180597 )
      ( MAKE-9CRATE-VERIFY ?auto_180589 ?auto_180590 ?auto_180591 ?auto_180588 ?auto_180592 ?auto_180594 ?auto_180593 ?auto_180595 ?auto_180596 ?auto_180597 ) )
  )

)

