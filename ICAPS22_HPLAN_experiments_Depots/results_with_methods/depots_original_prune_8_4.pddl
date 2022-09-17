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
      ?auto_15191 - SURFACE
      ?auto_15192 - SURFACE
    )
    :vars
    (
      ?auto_15193 - HOIST
      ?auto_15194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15193 ?auto_15194 ) ( SURFACE-AT ?auto_15192 ?auto_15194 ) ( CLEAR ?auto_15192 ) ( LIFTING ?auto_15193 ?auto_15191 ) ( IS-CRATE ?auto_15191 ) ( not ( = ?auto_15191 ?auto_15192 ) ) )
    :subtasks
    ( ( !DROP ?auto_15193 ?auto_15191 ?auto_15192 ?auto_15194 )
      ( MAKE-ON-VERIFY ?auto_15191 ?auto_15192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15195 - SURFACE
      ?auto_15196 - SURFACE
    )
    :vars
    (
      ?auto_15198 - HOIST
      ?auto_15197 - PLACE
      ?auto_15199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15198 ?auto_15197 ) ( SURFACE-AT ?auto_15196 ?auto_15197 ) ( CLEAR ?auto_15196 ) ( IS-CRATE ?auto_15195 ) ( not ( = ?auto_15195 ?auto_15196 ) ) ( TRUCK-AT ?auto_15199 ?auto_15197 ) ( AVAILABLE ?auto_15198 ) ( IN ?auto_15195 ?auto_15199 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15198 ?auto_15195 ?auto_15199 ?auto_15197 )
      ( MAKE-ON ?auto_15195 ?auto_15196 )
      ( MAKE-ON-VERIFY ?auto_15195 ?auto_15196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15200 - SURFACE
      ?auto_15201 - SURFACE
    )
    :vars
    (
      ?auto_15204 - HOIST
      ?auto_15202 - PLACE
      ?auto_15203 - TRUCK
      ?auto_15205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15204 ?auto_15202 ) ( SURFACE-AT ?auto_15201 ?auto_15202 ) ( CLEAR ?auto_15201 ) ( IS-CRATE ?auto_15200 ) ( not ( = ?auto_15200 ?auto_15201 ) ) ( AVAILABLE ?auto_15204 ) ( IN ?auto_15200 ?auto_15203 ) ( TRUCK-AT ?auto_15203 ?auto_15205 ) ( not ( = ?auto_15205 ?auto_15202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15203 ?auto_15205 ?auto_15202 )
      ( MAKE-ON ?auto_15200 ?auto_15201 )
      ( MAKE-ON-VERIFY ?auto_15200 ?auto_15201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15206 - SURFACE
      ?auto_15207 - SURFACE
    )
    :vars
    (
      ?auto_15208 - HOIST
      ?auto_15210 - PLACE
      ?auto_15211 - TRUCK
      ?auto_15209 - PLACE
      ?auto_15212 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15208 ?auto_15210 ) ( SURFACE-AT ?auto_15207 ?auto_15210 ) ( CLEAR ?auto_15207 ) ( IS-CRATE ?auto_15206 ) ( not ( = ?auto_15206 ?auto_15207 ) ) ( AVAILABLE ?auto_15208 ) ( TRUCK-AT ?auto_15211 ?auto_15209 ) ( not ( = ?auto_15209 ?auto_15210 ) ) ( HOIST-AT ?auto_15212 ?auto_15209 ) ( LIFTING ?auto_15212 ?auto_15206 ) ( not ( = ?auto_15208 ?auto_15212 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15212 ?auto_15206 ?auto_15211 ?auto_15209 )
      ( MAKE-ON ?auto_15206 ?auto_15207 )
      ( MAKE-ON-VERIFY ?auto_15206 ?auto_15207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15213 - SURFACE
      ?auto_15214 - SURFACE
    )
    :vars
    (
      ?auto_15216 - HOIST
      ?auto_15218 - PLACE
      ?auto_15219 - TRUCK
      ?auto_15217 - PLACE
      ?auto_15215 - HOIST
      ?auto_15220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15216 ?auto_15218 ) ( SURFACE-AT ?auto_15214 ?auto_15218 ) ( CLEAR ?auto_15214 ) ( IS-CRATE ?auto_15213 ) ( not ( = ?auto_15213 ?auto_15214 ) ) ( AVAILABLE ?auto_15216 ) ( TRUCK-AT ?auto_15219 ?auto_15217 ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( HOIST-AT ?auto_15215 ?auto_15217 ) ( not ( = ?auto_15216 ?auto_15215 ) ) ( AVAILABLE ?auto_15215 ) ( SURFACE-AT ?auto_15213 ?auto_15217 ) ( ON ?auto_15213 ?auto_15220 ) ( CLEAR ?auto_15213 ) ( not ( = ?auto_15213 ?auto_15220 ) ) ( not ( = ?auto_15214 ?auto_15220 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15215 ?auto_15213 ?auto_15220 ?auto_15217 )
      ( MAKE-ON ?auto_15213 ?auto_15214 )
      ( MAKE-ON-VERIFY ?auto_15213 ?auto_15214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15221 - SURFACE
      ?auto_15222 - SURFACE
    )
    :vars
    (
      ?auto_15223 - HOIST
      ?auto_15224 - PLACE
      ?auto_15226 - PLACE
      ?auto_15227 - HOIST
      ?auto_15228 - SURFACE
      ?auto_15225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15223 ?auto_15224 ) ( SURFACE-AT ?auto_15222 ?auto_15224 ) ( CLEAR ?auto_15222 ) ( IS-CRATE ?auto_15221 ) ( not ( = ?auto_15221 ?auto_15222 ) ) ( AVAILABLE ?auto_15223 ) ( not ( = ?auto_15226 ?auto_15224 ) ) ( HOIST-AT ?auto_15227 ?auto_15226 ) ( not ( = ?auto_15223 ?auto_15227 ) ) ( AVAILABLE ?auto_15227 ) ( SURFACE-AT ?auto_15221 ?auto_15226 ) ( ON ?auto_15221 ?auto_15228 ) ( CLEAR ?auto_15221 ) ( not ( = ?auto_15221 ?auto_15228 ) ) ( not ( = ?auto_15222 ?auto_15228 ) ) ( TRUCK-AT ?auto_15225 ?auto_15224 ) )
    :subtasks
    ( ( !DRIVE ?auto_15225 ?auto_15224 ?auto_15226 )
      ( MAKE-ON ?auto_15221 ?auto_15222 )
      ( MAKE-ON-VERIFY ?auto_15221 ?auto_15222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15269 - SURFACE
      ?auto_15270 - SURFACE
    )
    :vars
    (
      ?auto_15276 - HOIST
      ?auto_15273 - PLACE
      ?auto_15274 - PLACE
      ?auto_15272 - HOIST
      ?auto_15271 - SURFACE
      ?auto_15275 - TRUCK
      ?auto_15277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15276 ?auto_15273 ) ( IS-CRATE ?auto_15269 ) ( not ( = ?auto_15269 ?auto_15270 ) ) ( not ( = ?auto_15274 ?auto_15273 ) ) ( HOIST-AT ?auto_15272 ?auto_15274 ) ( not ( = ?auto_15276 ?auto_15272 ) ) ( AVAILABLE ?auto_15272 ) ( SURFACE-AT ?auto_15269 ?auto_15274 ) ( ON ?auto_15269 ?auto_15271 ) ( CLEAR ?auto_15269 ) ( not ( = ?auto_15269 ?auto_15271 ) ) ( not ( = ?auto_15270 ?auto_15271 ) ) ( TRUCK-AT ?auto_15275 ?auto_15273 ) ( SURFACE-AT ?auto_15277 ?auto_15273 ) ( CLEAR ?auto_15277 ) ( LIFTING ?auto_15276 ?auto_15270 ) ( IS-CRATE ?auto_15270 ) ( not ( = ?auto_15269 ?auto_15277 ) ) ( not ( = ?auto_15270 ?auto_15277 ) ) ( not ( = ?auto_15271 ?auto_15277 ) ) )
    :subtasks
    ( ( !DROP ?auto_15276 ?auto_15270 ?auto_15277 ?auto_15273 )
      ( MAKE-ON ?auto_15269 ?auto_15270 )
      ( MAKE-ON-VERIFY ?auto_15269 ?auto_15270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15278 - SURFACE
      ?auto_15279 - SURFACE
    )
    :vars
    (
      ?auto_15283 - HOIST
      ?auto_15285 - PLACE
      ?auto_15281 - PLACE
      ?auto_15280 - HOIST
      ?auto_15286 - SURFACE
      ?auto_15284 - TRUCK
      ?auto_15282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15283 ?auto_15285 ) ( IS-CRATE ?auto_15278 ) ( not ( = ?auto_15278 ?auto_15279 ) ) ( not ( = ?auto_15281 ?auto_15285 ) ) ( HOIST-AT ?auto_15280 ?auto_15281 ) ( not ( = ?auto_15283 ?auto_15280 ) ) ( AVAILABLE ?auto_15280 ) ( SURFACE-AT ?auto_15278 ?auto_15281 ) ( ON ?auto_15278 ?auto_15286 ) ( CLEAR ?auto_15278 ) ( not ( = ?auto_15278 ?auto_15286 ) ) ( not ( = ?auto_15279 ?auto_15286 ) ) ( TRUCK-AT ?auto_15284 ?auto_15285 ) ( SURFACE-AT ?auto_15282 ?auto_15285 ) ( CLEAR ?auto_15282 ) ( IS-CRATE ?auto_15279 ) ( not ( = ?auto_15278 ?auto_15282 ) ) ( not ( = ?auto_15279 ?auto_15282 ) ) ( not ( = ?auto_15286 ?auto_15282 ) ) ( AVAILABLE ?auto_15283 ) ( IN ?auto_15279 ?auto_15284 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15283 ?auto_15279 ?auto_15284 ?auto_15285 )
      ( MAKE-ON ?auto_15278 ?auto_15279 )
      ( MAKE-ON-VERIFY ?auto_15278 ?auto_15279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15293 - SURFACE
      ?auto_15294 - SURFACE
    )
    :vars
    (
      ?auto_15297 - HOIST
      ?auto_15298 - PLACE
      ?auto_15299 - PLACE
      ?auto_15296 - HOIST
      ?auto_15295 - SURFACE
      ?auto_15300 - TRUCK
      ?auto_15301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15297 ?auto_15298 ) ( SURFACE-AT ?auto_15294 ?auto_15298 ) ( CLEAR ?auto_15294 ) ( IS-CRATE ?auto_15293 ) ( not ( = ?auto_15293 ?auto_15294 ) ) ( AVAILABLE ?auto_15297 ) ( not ( = ?auto_15299 ?auto_15298 ) ) ( HOIST-AT ?auto_15296 ?auto_15299 ) ( not ( = ?auto_15297 ?auto_15296 ) ) ( AVAILABLE ?auto_15296 ) ( SURFACE-AT ?auto_15293 ?auto_15299 ) ( ON ?auto_15293 ?auto_15295 ) ( CLEAR ?auto_15293 ) ( not ( = ?auto_15293 ?auto_15295 ) ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( TRUCK-AT ?auto_15300 ?auto_15301 ) ( not ( = ?auto_15301 ?auto_15298 ) ) ( not ( = ?auto_15299 ?auto_15301 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15300 ?auto_15301 ?auto_15298 )
      ( MAKE-ON ?auto_15293 ?auto_15294 )
      ( MAKE-ON-VERIFY ?auto_15293 ?auto_15294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15360 - SURFACE
      ?auto_15361 - SURFACE
    )
    :vars
    (
      ?auto_15365 - HOIST
      ?auto_15366 - PLACE
      ?auto_15364 - PLACE
      ?auto_15363 - HOIST
      ?auto_15362 - SURFACE
      ?auto_15368 - SURFACE
      ?auto_15367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15365 ?auto_15366 ) ( IS-CRATE ?auto_15360 ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( not ( = ?auto_15364 ?auto_15366 ) ) ( HOIST-AT ?auto_15363 ?auto_15364 ) ( not ( = ?auto_15365 ?auto_15363 ) ) ( AVAILABLE ?auto_15363 ) ( SURFACE-AT ?auto_15360 ?auto_15364 ) ( ON ?auto_15360 ?auto_15362 ) ( CLEAR ?auto_15360 ) ( not ( = ?auto_15360 ?auto_15362 ) ) ( not ( = ?auto_15361 ?auto_15362 ) ) ( SURFACE-AT ?auto_15368 ?auto_15366 ) ( CLEAR ?auto_15368 ) ( IS-CRATE ?auto_15361 ) ( not ( = ?auto_15360 ?auto_15368 ) ) ( not ( = ?auto_15361 ?auto_15368 ) ) ( not ( = ?auto_15362 ?auto_15368 ) ) ( AVAILABLE ?auto_15365 ) ( IN ?auto_15361 ?auto_15367 ) ( TRUCK-AT ?auto_15367 ?auto_15364 ) )
    :subtasks
    ( ( !DRIVE ?auto_15367 ?auto_15364 ?auto_15366 )
      ( MAKE-ON ?auto_15360 ?auto_15361 )
      ( MAKE-ON-VERIFY ?auto_15360 ?auto_15361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15369 - SURFACE
      ?auto_15370 - SURFACE
    )
    :vars
    (
      ?auto_15377 - HOIST
      ?auto_15376 - PLACE
      ?auto_15371 - PLACE
      ?auto_15373 - HOIST
      ?auto_15375 - SURFACE
      ?auto_15372 - SURFACE
      ?auto_15374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15377 ?auto_15376 ) ( IS-CRATE ?auto_15369 ) ( not ( = ?auto_15369 ?auto_15370 ) ) ( not ( = ?auto_15371 ?auto_15376 ) ) ( HOIST-AT ?auto_15373 ?auto_15371 ) ( not ( = ?auto_15377 ?auto_15373 ) ) ( SURFACE-AT ?auto_15369 ?auto_15371 ) ( ON ?auto_15369 ?auto_15375 ) ( CLEAR ?auto_15369 ) ( not ( = ?auto_15369 ?auto_15375 ) ) ( not ( = ?auto_15370 ?auto_15375 ) ) ( SURFACE-AT ?auto_15372 ?auto_15376 ) ( CLEAR ?auto_15372 ) ( IS-CRATE ?auto_15370 ) ( not ( = ?auto_15369 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( not ( = ?auto_15375 ?auto_15372 ) ) ( AVAILABLE ?auto_15377 ) ( TRUCK-AT ?auto_15374 ?auto_15371 ) ( LIFTING ?auto_15373 ?auto_15370 ) )
    :subtasks
    ( ( !LOAD ?auto_15373 ?auto_15370 ?auto_15374 ?auto_15371 )
      ( MAKE-ON ?auto_15369 ?auto_15370 )
      ( MAKE-ON-VERIFY ?auto_15369 ?auto_15370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15378 - SURFACE
      ?auto_15379 - SURFACE
    )
    :vars
    (
      ?auto_15380 - HOIST
      ?auto_15383 - PLACE
      ?auto_15382 - PLACE
      ?auto_15386 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15384 - SURFACE
      ?auto_15381 - TRUCK
      ?auto_15387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15380 ?auto_15383 ) ( IS-CRATE ?auto_15378 ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( not ( = ?auto_15382 ?auto_15383 ) ) ( HOIST-AT ?auto_15386 ?auto_15382 ) ( not ( = ?auto_15380 ?auto_15386 ) ) ( SURFACE-AT ?auto_15378 ?auto_15382 ) ( ON ?auto_15378 ?auto_15385 ) ( CLEAR ?auto_15378 ) ( not ( = ?auto_15378 ?auto_15385 ) ) ( not ( = ?auto_15379 ?auto_15385 ) ) ( SURFACE-AT ?auto_15384 ?auto_15383 ) ( CLEAR ?auto_15384 ) ( IS-CRATE ?auto_15379 ) ( not ( = ?auto_15378 ?auto_15384 ) ) ( not ( = ?auto_15379 ?auto_15384 ) ) ( not ( = ?auto_15385 ?auto_15384 ) ) ( AVAILABLE ?auto_15380 ) ( TRUCK-AT ?auto_15381 ?auto_15382 ) ( AVAILABLE ?auto_15386 ) ( SURFACE-AT ?auto_15379 ?auto_15382 ) ( ON ?auto_15379 ?auto_15387 ) ( CLEAR ?auto_15379 ) ( not ( = ?auto_15378 ?auto_15387 ) ) ( not ( = ?auto_15379 ?auto_15387 ) ) ( not ( = ?auto_15385 ?auto_15387 ) ) ( not ( = ?auto_15384 ?auto_15387 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15386 ?auto_15379 ?auto_15387 ?auto_15382 )
      ( MAKE-ON ?auto_15378 ?auto_15379 )
      ( MAKE-ON-VERIFY ?auto_15378 ?auto_15379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15388 - SURFACE
      ?auto_15389 - SURFACE
    )
    :vars
    (
      ?auto_15395 - HOIST
      ?auto_15390 - PLACE
      ?auto_15391 - PLACE
      ?auto_15394 - HOIST
      ?auto_15393 - SURFACE
      ?auto_15396 - SURFACE
      ?auto_15392 - SURFACE
      ?auto_15397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15395 ?auto_15390 ) ( IS-CRATE ?auto_15388 ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15391 ?auto_15390 ) ) ( HOIST-AT ?auto_15394 ?auto_15391 ) ( not ( = ?auto_15395 ?auto_15394 ) ) ( SURFACE-AT ?auto_15388 ?auto_15391 ) ( ON ?auto_15388 ?auto_15393 ) ( CLEAR ?auto_15388 ) ( not ( = ?auto_15388 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15393 ) ) ( SURFACE-AT ?auto_15396 ?auto_15390 ) ( CLEAR ?auto_15396 ) ( IS-CRATE ?auto_15389 ) ( not ( = ?auto_15388 ?auto_15396 ) ) ( not ( = ?auto_15389 ?auto_15396 ) ) ( not ( = ?auto_15393 ?auto_15396 ) ) ( AVAILABLE ?auto_15395 ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15389 ?auto_15391 ) ( ON ?auto_15389 ?auto_15392 ) ( CLEAR ?auto_15389 ) ( not ( = ?auto_15388 ?auto_15392 ) ) ( not ( = ?auto_15389 ?auto_15392 ) ) ( not ( = ?auto_15393 ?auto_15392 ) ) ( not ( = ?auto_15396 ?auto_15392 ) ) ( TRUCK-AT ?auto_15397 ?auto_15390 ) )
    :subtasks
    ( ( !DRIVE ?auto_15397 ?auto_15390 ?auto_15391 )
      ( MAKE-ON ?auto_15388 ?auto_15389 )
      ( MAKE-ON-VERIFY ?auto_15388 ?auto_15389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15398 - SURFACE
      ?auto_15399 - SURFACE
    )
    :vars
    (
      ?auto_15404 - HOIST
      ?auto_15400 - PLACE
      ?auto_15403 - PLACE
      ?auto_15406 - HOIST
      ?auto_15401 - SURFACE
      ?auto_15407 - SURFACE
      ?auto_15405 - SURFACE
      ?auto_15402 - TRUCK
      ?auto_15408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15404 ?auto_15400 ) ( IS-CRATE ?auto_15398 ) ( not ( = ?auto_15398 ?auto_15399 ) ) ( not ( = ?auto_15403 ?auto_15400 ) ) ( HOIST-AT ?auto_15406 ?auto_15403 ) ( not ( = ?auto_15404 ?auto_15406 ) ) ( SURFACE-AT ?auto_15398 ?auto_15403 ) ( ON ?auto_15398 ?auto_15401 ) ( CLEAR ?auto_15398 ) ( not ( = ?auto_15398 ?auto_15401 ) ) ( not ( = ?auto_15399 ?auto_15401 ) ) ( IS-CRATE ?auto_15399 ) ( not ( = ?auto_15398 ?auto_15407 ) ) ( not ( = ?auto_15399 ?auto_15407 ) ) ( not ( = ?auto_15401 ?auto_15407 ) ) ( AVAILABLE ?auto_15406 ) ( SURFACE-AT ?auto_15399 ?auto_15403 ) ( ON ?auto_15399 ?auto_15405 ) ( CLEAR ?auto_15399 ) ( not ( = ?auto_15398 ?auto_15405 ) ) ( not ( = ?auto_15399 ?auto_15405 ) ) ( not ( = ?auto_15401 ?auto_15405 ) ) ( not ( = ?auto_15407 ?auto_15405 ) ) ( TRUCK-AT ?auto_15402 ?auto_15400 ) ( SURFACE-AT ?auto_15408 ?auto_15400 ) ( CLEAR ?auto_15408 ) ( LIFTING ?auto_15404 ?auto_15407 ) ( IS-CRATE ?auto_15407 ) ( not ( = ?auto_15398 ?auto_15408 ) ) ( not ( = ?auto_15399 ?auto_15408 ) ) ( not ( = ?auto_15401 ?auto_15408 ) ) ( not ( = ?auto_15407 ?auto_15408 ) ) ( not ( = ?auto_15405 ?auto_15408 ) ) )
    :subtasks
    ( ( !DROP ?auto_15404 ?auto_15407 ?auto_15408 ?auto_15400 )
      ( MAKE-ON ?auto_15398 ?auto_15399 )
      ( MAKE-ON-VERIFY ?auto_15398 ?auto_15399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15498 - SURFACE
      ?auto_15499 - SURFACE
    )
    :vars
    (
      ?auto_15500 - HOIST
      ?auto_15505 - PLACE
      ?auto_15504 - PLACE
      ?auto_15501 - HOIST
      ?auto_15503 - SURFACE
      ?auto_15502 - TRUCK
      ?auto_15506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15500 ?auto_15505 ) ( SURFACE-AT ?auto_15499 ?auto_15505 ) ( CLEAR ?auto_15499 ) ( IS-CRATE ?auto_15498 ) ( not ( = ?auto_15498 ?auto_15499 ) ) ( not ( = ?auto_15504 ?auto_15505 ) ) ( HOIST-AT ?auto_15501 ?auto_15504 ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( AVAILABLE ?auto_15501 ) ( SURFACE-AT ?auto_15498 ?auto_15504 ) ( ON ?auto_15498 ?auto_15503 ) ( CLEAR ?auto_15498 ) ( not ( = ?auto_15498 ?auto_15503 ) ) ( not ( = ?auto_15499 ?auto_15503 ) ) ( TRUCK-AT ?auto_15502 ?auto_15505 ) ( LIFTING ?auto_15500 ?auto_15506 ) ( IS-CRATE ?auto_15506 ) ( not ( = ?auto_15498 ?auto_15506 ) ) ( not ( = ?auto_15499 ?auto_15506 ) ) ( not ( = ?auto_15503 ?auto_15506 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15500 ?auto_15506 ?auto_15502 ?auto_15505 )
      ( MAKE-ON ?auto_15498 ?auto_15499 )
      ( MAKE-ON-VERIFY ?auto_15498 ?auto_15499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15517 - SURFACE
      ?auto_15518 - SURFACE
    )
    :vars
    (
      ?auto_15524 - HOIST
      ?auto_15521 - PLACE
      ?auto_15522 - TRUCK
      ?auto_15523 - PLACE
      ?auto_15519 - HOIST
      ?auto_15520 - SURFACE
      ?auto_15525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15524 ?auto_15521 ) ( SURFACE-AT ?auto_15518 ?auto_15521 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15517 ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( AVAILABLE ?auto_15524 ) ( TRUCK-AT ?auto_15522 ?auto_15523 ) ( not ( = ?auto_15523 ?auto_15521 ) ) ( HOIST-AT ?auto_15519 ?auto_15523 ) ( not ( = ?auto_15524 ?auto_15519 ) ) ( SURFACE-AT ?auto_15517 ?auto_15523 ) ( ON ?auto_15517 ?auto_15520 ) ( CLEAR ?auto_15517 ) ( not ( = ?auto_15517 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( LIFTING ?auto_15519 ?auto_15525 ) ( IS-CRATE ?auto_15525 ) ( not ( = ?auto_15517 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15520 ?auto_15525 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15519 ?auto_15525 ?auto_15522 ?auto_15523 )
      ( MAKE-ON ?auto_15517 ?auto_15518 )
      ( MAKE-ON-VERIFY ?auto_15517 ?auto_15518 ) )
  )

)

