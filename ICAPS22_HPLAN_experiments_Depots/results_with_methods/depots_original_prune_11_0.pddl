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
      ?auto_27210 - SURFACE
      ?auto_27211 - SURFACE
    )
    :vars
    (
      ?auto_27212 - HOIST
      ?auto_27213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27212 ?auto_27213 ) ( SURFACE-AT ?auto_27211 ?auto_27213 ) ( CLEAR ?auto_27211 ) ( LIFTING ?auto_27212 ?auto_27210 ) ( IS-CRATE ?auto_27210 ) ( not ( = ?auto_27210 ?auto_27211 ) ) )
    :subtasks
    ( ( !DROP ?auto_27212 ?auto_27210 ?auto_27211 ?auto_27213 )
      ( MAKE-ON-VERIFY ?auto_27210 ?auto_27211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27214 - SURFACE
      ?auto_27215 - SURFACE
    )
    :vars
    (
      ?auto_27217 - HOIST
      ?auto_27216 - PLACE
      ?auto_27218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27217 ?auto_27216 ) ( SURFACE-AT ?auto_27215 ?auto_27216 ) ( CLEAR ?auto_27215 ) ( IS-CRATE ?auto_27214 ) ( not ( = ?auto_27214 ?auto_27215 ) ) ( TRUCK-AT ?auto_27218 ?auto_27216 ) ( AVAILABLE ?auto_27217 ) ( IN ?auto_27214 ?auto_27218 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27217 ?auto_27214 ?auto_27218 ?auto_27216 )
      ( MAKE-ON ?auto_27214 ?auto_27215 )
      ( MAKE-ON-VERIFY ?auto_27214 ?auto_27215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27219 - SURFACE
      ?auto_27220 - SURFACE
    )
    :vars
    (
      ?auto_27223 - HOIST
      ?auto_27222 - PLACE
      ?auto_27221 - TRUCK
      ?auto_27224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27223 ?auto_27222 ) ( SURFACE-AT ?auto_27220 ?auto_27222 ) ( CLEAR ?auto_27220 ) ( IS-CRATE ?auto_27219 ) ( not ( = ?auto_27219 ?auto_27220 ) ) ( AVAILABLE ?auto_27223 ) ( IN ?auto_27219 ?auto_27221 ) ( TRUCK-AT ?auto_27221 ?auto_27224 ) ( not ( = ?auto_27224 ?auto_27222 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27221 ?auto_27224 ?auto_27222 )
      ( MAKE-ON ?auto_27219 ?auto_27220 )
      ( MAKE-ON-VERIFY ?auto_27219 ?auto_27220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27225 - SURFACE
      ?auto_27226 - SURFACE
    )
    :vars
    (
      ?auto_27228 - HOIST
      ?auto_27227 - PLACE
      ?auto_27230 - TRUCK
      ?auto_27229 - PLACE
      ?auto_27231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27228 ?auto_27227 ) ( SURFACE-AT ?auto_27226 ?auto_27227 ) ( CLEAR ?auto_27226 ) ( IS-CRATE ?auto_27225 ) ( not ( = ?auto_27225 ?auto_27226 ) ) ( AVAILABLE ?auto_27228 ) ( TRUCK-AT ?auto_27230 ?auto_27229 ) ( not ( = ?auto_27229 ?auto_27227 ) ) ( HOIST-AT ?auto_27231 ?auto_27229 ) ( LIFTING ?auto_27231 ?auto_27225 ) ( not ( = ?auto_27228 ?auto_27231 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27231 ?auto_27225 ?auto_27230 ?auto_27229 )
      ( MAKE-ON ?auto_27225 ?auto_27226 )
      ( MAKE-ON-VERIFY ?auto_27225 ?auto_27226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27232 - SURFACE
      ?auto_27233 - SURFACE
    )
    :vars
    (
      ?auto_27234 - HOIST
      ?auto_27238 - PLACE
      ?auto_27236 - TRUCK
      ?auto_27237 - PLACE
      ?auto_27235 - HOIST
      ?auto_27239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27234 ?auto_27238 ) ( SURFACE-AT ?auto_27233 ?auto_27238 ) ( CLEAR ?auto_27233 ) ( IS-CRATE ?auto_27232 ) ( not ( = ?auto_27232 ?auto_27233 ) ) ( AVAILABLE ?auto_27234 ) ( TRUCK-AT ?auto_27236 ?auto_27237 ) ( not ( = ?auto_27237 ?auto_27238 ) ) ( HOIST-AT ?auto_27235 ?auto_27237 ) ( not ( = ?auto_27234 ?auto_27235 ) ) ( AVAILABLE ?auto_27235 ) ( SURFACE-AT ?auto_27232 ?auto_27237 ) ( ON ?auto_27232 ?auto_27239 ) ( CLEAR ?auto_27232 ) ( not ( = ?auto_27232 ?auto_27239 ) ) ( not ( = ?auto_27233 ?auto_27239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27235 ?auto_27232 ?auto_27239 ?auto_27237 )
      ( MAKE-ON ?auto_27232 ?auto_27233 )
      ( MAKE-ON-VERIFY ?auto_27232 ?auto_27233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27240 - SURFACE
      ?auto_27241 - SURFACE
    )
    :vars
    (
      ?auto_27242 - HOIST
      ?auto_27247 - PLACE
      ?auto_27246 - PLACE
      ?auto_27245 - HOIST
      ?auto_27243 - SURFACE
      ?auto_27244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27242 ?auto_27247 ) ( SURFACE-AT ?auto_27241 ?auto_27247 ) ( CLEAR ?auto_27241 ) ( IS-CRATE ?auto_27240 ) ( not ( = ?auto_27240 ?auto_27241 ) ) ( AVAILABLE ?auto_27242 ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( HOIST-AT ?auto_27245 ?auto_27246 ) ( not ( = ?auto_27242 ?auto_27245 ) ) ( AVAILABLE ?auto_27245 ) ( SURFACE-AT ?auto_27240 ?auto_27246 ) ( ON ?auto_27240 ?auto_27243 ) ( CLEAR ?auto_27240 ) ( not ( = ?auto_27240 ?auto_27243 ) ) ( not ( = ?auto_27241 ?auto_27243 ) ) ( TRUCK-AT ?auto_27244 ?auto_27247 ) )
    :subtasks
    ( ( !DRIVE ?auto_27244 ?auto_27247 ?auto_27246 )
      ( MAKE-ON ?auto_27240 ?auto_27241 )
      ( MAKE-ON-VERIFY ?auto_27240 ?auto_27241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27288 - SURFACE
      ?auto_27289 - SURFACE
    )
    :vars
    (
      ?auto_27291 - HOIST
      ?auto_27295 - PLACE
      ?auto_27293 - PLACE
      ?auto_27294 - HOIST
      ?auto_27292 - SURFACE
      ?auto_27290 - TRUCK
      ?auto_27296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27291 ?auto_27295 ) ( IS-CRATE ?auto_27288 ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27293 ?auto_27295 ) ) ( HOIST-AT ?auto_27294 ?auto_27293 ) ( not ( = ?auto_27291 ?auto_27294 ) ) ( AVAILABLE ?auto_27294 ) ( SURFACE-AT ?auto_27288 ?auto_27293 ) ( ON ?auto_27288 ?auto_27292 ) ( CLEAR ?auto_27288 ) ( not ( = ?auto_27288 ?auto_27292 ) ) ( not ( = ?auto_27289 ?auto_27292 ) ) ( TRUCK-AT ?auto_27290 ?auto_27295 ) ( SURFACE-AT ?auto_27296 ?auto_27295 ) ( CLEAR ?auto_27296 ) ( LIFTING ?auto_27291 ?auto_27289 ) ( IS-CRATE ?auto_27289 ) ( not ( = ?auto_27288 ?auto_27296 ) ) ( not ( = ?auto_27289 ?auto_27296 ) ) ( not ( = ?auto_27292 ?auto_27296 ) ) )
    :subtasks
    ( ( !DROP ?auto_27291 ?auto_27289 ?auto_27296 ?auto_27295 )
      ( MAKE-ON ?auto_27288 ?auto_27289 )
      ( MAKE-ON-VERIFY ?auto_27288 ?auto_27289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27297 - SURFACE
      ?auto_27298 - SURFACE
    )
    :vars
    (
      ?auto_27305 - HOIST
      ?auto_27304 - PLACE
      ?auto_27300 - PLACE
      ?auto_27299 - HOIST
      ?auto_27303 - SURFACE
      ?auto_27302 - TRUCK
      ?auto_27301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27305 ?auto_27304 ) ( IS-CRATE ?auto_27297 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( HOIST-AT ?auto_27299 ?auto_27300 ) ( not ( = ?auto_27305 ?auto_27299 ) ) ( AVAILABLE ?auto_27299 ) ( SURFACE-AT ?auto_27297 ?auto_27300 ) ( ON ?auto_27297 ?auto_27303 ) ( CLEAR ?auto_27297 ) ( not ( = ?auto_27297 ?auto_27303 ) ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( TRUCK-AT ?auto_27302 ?auto_27304 ) ( SURFACE-AT ?auto_27301 ?auto_27304 ) ( CLEAR ?auto_27301 ) ( IS-CRATE ?auto_27298 ) ( not ( = ?auto_27297 ?auto_27301 ) ) ( not ( = ?auto_27298 ?auto_27301 ) ) ( not ( = ?auto_27303 ?auto_27301 ) ) ( AVAILABLE ?auto_27305 ) ( IN ?auto_27298 ?auto_27302 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27305 ?auto_27298 ?auto_27302 ?auto_27304 )
      ( MAKE-ON ?auto_27297 ?auto_27298 )
      ( MAKE-ON-VERIFY ?auto_27297 ?auto_27298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27312 - SURFACE
      ?auto_27313 - SURFACE
    )
    :vars
    (
      ?auto_27318 - HOIST
      ?auto_27316 - PLACE
      ?auto_27317 - PLACE
      ?auto_27319 - HOIST
      ?auto_27315 - SURFACE
      ?auto_27314 - TRUCK
      ?auto_27320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27318 ?auto_27316 ) ( SURFACE-AT ?auto_27313 ?auto_27316 ) ( CLEAR ?auto_27313 ) ( IS-CRATE ?auto_27312 ) ( not ( = ?auto_27312 ?auto_27313 ) ) ( AVAILABLE ?auto_27318 ) ( not ( = ?auto_27317 ?auto_27316 ) ) ( HOIST-AT ?auto_27319 ?auto_27317 ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( AVAILABLE ?auto_27319 ) ( SURFACE-AT ?auto_27312 ?auto_27317 ) ( ON ?auto_27312 ?auto_27315 ) ( CLEAR ?auto_27312 ) ( not ( = ?auto_27312 ?auto_27315 ) ) ( not ( = ?auto_27313 ?auto_27315 ) ) ( TRUCK-AT ?auto_27314 ?auto_27320 ) ( not ( = ?auto_27320 ?auto_27316 ) ) ( not ( = ?auto_27317 ?auto_27320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27314 ?auto_27320 ?auto_27316 )
      ( MAKE-ON ?auto_27312 ?auto_27313 )
      ( MAKE-ON-VERIFY ?auto_27312 ?auto_27313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27379 - SURFACE
      ?auto_27380 - SURFACE
    )
    :vars
    (
      ?auto_27384 - HOIST
      ?auto_27386 - PLACE
      ?auto_27381 - PLACE
      ?auto_27387 - HOIST
      ?auto_27383 - SURFACE
      ?auto_27385 - SURFACE
      ?auto_27382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27384 ?auto_27386 ) ( IS-CRATE ?auto_27379 ) ( not ( = ?auto_27379 ?auto_27380 ) ) ( not ( = ?auto_27381 ?auto_27386 ) ) ( HOIST-AT ?auto_27387 ?auto_27381 ) ( not ( = ?auto_27384 ?auto_27387 ) ) ( AVAILABLE ?auto_27387 ) ( SURFACE-AT ?auto_27379 ?auto_27381 ) ( ON ?auto_27379 ?auto_27383 ) ( CLEAR ?auto_27379 ) ( not ( = ?auto_27379 ?auto_27383 ) ) ( not ( = ?auto_27380 ?auto_27383 ) ) ( SURFACE-AT ?auto_27385 ?auto_27386 ) ( CLEAR ?auto_27385 ) ( IS-CRATE ?auto_27380 ) ( not ( = ?auto_27379 ?auto_27385 ) ) ( not ( = ?auto_27380 ?auto_27385 ) ) ( not ( = ?auto_27383 ?auto_27385 ) ) ( AVAILABLE ?auto_27384 ) ( IN ?auto_27380 ?auto_27382 ) ( TRUCK-AT ?auto_27382 ?auto_27381 ) )
    :subtasks
    ( ( !DRIVE ?auto_27382 ?auto_27381 ?auto_27386 )
      ( MAKE-ON ?auto_27379 ?auto_27380 )
      ( MAKE-ON-VERIFY ?auto_27379 ?auto_27380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27388 - SURFACE
      ?auto_27389 - SURFACE
    )
    :vars
    (
      ?auto_27394 - HOIST
      ?auto_27391 - PLACE
      ?auto_27390 - PLACE
      ?auto_27396 - HOIST
      ?auto_27395 - SURFACE
      ?auto_27393 - SURFACE
      ?auto_27392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27394 ?auto_27391 ) ( IS-CRATE ?auto_27388 ) ( not ( = ?auto_27388 ?auto_27389 ) ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( HOIST-AT ?auto_27396 ?auto_27390 ) ( not ( = ?auto_27394 ?auto_27396 ) ) ( SURFACE-AT ?auto_27388 ?auto_27390 ) ( ON ?auto_27388 ?auto_27395 ) ( CLEAR ?auto_27388 ) ( not ( = ?auto_27388 ?auto_27395 ) ) ( not ( = ?auto_27389 ?auto_27395 ) ) ( SURFACE-AT ?auto_27393 ?auto_27391 ) ( CLEAR ?auto_27393 ) ( IS-CRATE ?auto_27389 ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( not ( = ?auto_27389 ?auto_27393 ) ) ( not ( = ?auto_27395 ?auto_27393 ) ) ( AVAILABLE ?auto_27394 ) ( TRUCK-AT ?auto_27392 ?auto_27390 ) ( LIFTING ?auto_27396 ?auto_27389 ) )
    :subtasks
    ( ( !LOAD ?auto_27396 ?auto_27389 ?auto_27392 ?auto_27390 )
      ( MAKE-ON ?auto_27388 ?auto_27389 )
      ( MAKE-ON-VERIFY ?auto_27388 ?auto_27389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27397 - SURFACE
      ?auto_27398 - SURFACE
    )
    :vars
    (
      ?auto_27399 - HOIST
      ?auto_27401 - PLACE
      ?auto_27402 - PLACE
      ?auto_27400 - HOIST
      ?auto_27403 - SURFACE
      ?auto_27405 - SURFACE
      ?auto_27404 - TRUCK
      ?auto_27406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27399 ?auto_27401 ) ( IS-CRATE ?auto_27397 ) ( not ( = ?auto_27397 ?auto_27398 ) ) ( not ( = ?auto_27402 ?auto_27401 ) ) ( HOIST-AT ?auto_27400 ?auto_27402 ) ( not ( = ?auto_27399 ?auto_27400 ) ) ( SURFACE-AT ?auto_27397 ?auto_27402 ) ( ON ?auto_27397 ?auto_27403 ) ( CLEAR ?auto_27397 ) ( not ( = ?auto_27397 ?auto_27403 ) ) ( not ( = ?auto_27398 ?auto_27403 ) ) ( SURFACE-AT ?auto_27405 ?auto_27401 ) ( CLEAR ?auto_27405 ) ( IS-CRATE ?auto_27398 ) ( not ( = ?auto_27397 ?auto_27405 ) ) ( not ( = ?auto_27398 ?auto_27405 ) ) ( not ( = ?auto_27403 ?auto_27405 ) ) ( AVAILABLE ?auto_27399 ) ( TRUCK-AT ?auto_27404 ?auto_27402 ) ( AVAILABLE ?auto_27400 ) ( SURFACE-AT ?auto_27398 ?auto_27402 ) ( ON ?auto_27398 ?auto_27406 ) ( CLEAR ?auto_27398 ) ( not ( = ?auto_27397 ?auto_27406 ) ) ( not ( = ?auto_27398 ?auto_27406 ) ) ( not ( = ?auto_27403 ?auto_27406 ) ) ( not ( = ?auto_27405 ?auto_27406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27400 ?auto_27398 ?auto_27406 ?auto_27402 )
      ( MAKE-ON ?auto_27397 ?auto_27398 )
      ( MAKE-ON-VERIFY ?auto_27397 ?auto_27398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27407 - SURFACE
      ?auto_27408 - SURFACE
    )
    :vars
    (
      ?auto_27411 - HOIST
      ?auto_27412 - PLACE
      ?auto_27413 - PLACE
      ?auto_27414 - HOIST
      ?auto_27409 - SURFACE
      ?auto_27416 - SURFACE
      ?auto_27415 - SURFACE
      ?auto_27410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27411 ?auto_27412 ) ( IS-CRATE ?auto_27407 ) ( not ( = ?auto_27407 ?auto_27408 ) ) ( not ( = ?auto_27413 ?auto_27412 ) ) ( HOIST-AT ?auto_27414 ?auto_27413 ) ( not ( = ?auto_27411 ?auto_27414 ) ) ( SURFACE-AT ?auto_27407 ?auto_27413 ) ( ON ?auto_27407 ?auto_27409 ) ( CLEAR ?auto_27407 ) ( not ( = ?auto_27407 ?auto_27409 ) ) ( not ( = ?auto_27408 ?auto_27409 ) ) ( SURFACE-AT ?auto_27416 ?auto_27412 ) ( CLEAR ?auto_27416 ) ( IS-CRATE ?auto_27408 ) ( not ( = ?auto_27407 ?auto_27416 ) ) ( not ( = ?auto_27408 ?auto_27416 ) ) ( not ( = ?auto_27409 ?auto_27416 ) ) ( AVAILABLE ?auto_27411 ) ( AVAILABLE ?auto_27414 ) ( SURFACE-AT ?auto_27408 ?auto_27413 ) ( ON ?auto_27408 ?auto_27415 ) ( CLEAR ?auto_27408 ) ( not ( = ?auto_27407 ?auto_27415 ) ) ( not ( = ?auto_27408 ?auto_27415 ) ) ( not ( = ?auto_27409 ?auto_27415 ) ) ( not ( = ?auto_27416 ?auto_27415 ) ) ( TRUCK-AT ?auto_27410 ?auto_27412 ) )
    :subtasks
    ( ( !DRIVE ?auto_27410 ?auto_27412 ?auto_27413 )
      ( MAKE-ON ?auto_27407 ?auto_27408 )
      ( MAKE-ON-VERIFY ?auto_27407 ?auto_27408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27417 - SURFACE
      ?auto_27418 - SURFACE
    )
    :vars
    (
      ?auto_27426 - HOIST
      ?auto_27425 - PLACE
      ?auto_27422 - PLACE
      ?auto_27420 - HOIST
      ?auto_27421 - SURFACE
      ?auto_27424 - SURFACE
      ?auto_27419 - SURFACE
      ?auto_27423 - TRUCK
      ?auto_27427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27426 ?auto_27425 ) ( IS-CRATE ?auto_27417 ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27422 ?auto_27425 ) ) ( HOIST-AT ?auto_27420 ?auto_27422 ) ( not ( = ?auto_27426 ?auto_27420 ) ) ( SURFACE-AT ?auto_27417 ?auto_27422 ) ( ON ?auto_27417 ?auto_27421 ) ( CLEAR ?auto_27417 ) ( not ( = ?auto_27417 ?auto_27421 ) ) ( not ( = ?auto_27418 ?auto_27421 ) ) ( IS-CRATE ?auto_27418 ) ( not ( = ?auto_27417 ?auto_27424 ) ) ( not ( = ?auto_27418 ?auto_27424 ) ) ( not ( = ?auto_27421 ?auto_27424 ) ) ( AVAILABLE ?auto_27420 ) ( SURFACE-AT ?auto_27418 ?auto_27422 ) ( ON ?auto_27418 ?auto_27419 ) ( CLEAR ?auto_27418 ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27421 ?auto_27419 ) ) ( not ( = ?auto_27424 ?auto_27419 ) ) ( TRUCK-AT ?auto_27423 ?auto_27425 ) ( SURFACE-AT ?auto_27427 ?auto_27425 ) ( CLEAR ?auto_27427 ) ( LIFTING ?auto_27426 ?auto_27424 ) ( IS-CRATE ?auto_27424 ) ( not ( = ?auto_27417 ?auto_27427 ) ) ( not ( = ?auto_27418 ?auto_27427 ) ) ( not ( = ?auto_27421 ?auto_27427 ) ) ( not ( = ?auto_27424 ?auto_27427 ) ) ( not ( = ?auto_27419 ?auto_27427 ) ) )
    :subtasks
    ( ( !DROP ?auto_27426 ?auto_27424 ?auto_27427 ?auto_27425 )
      ( MAKE-ON ?auto_27417 ?auto_27418 )
      ( MAKE-ON-VERIFY ?auto_27417 ?auto_27418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27517 - SURFACE
      ?auto_27518 - SURFACE
    )
    :vars
    (
      ?auto_27522 - HOIST
      ?auto_27523 - PLACE
      ?auto_27524 - PLACE
      ?auto_27519 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27521 - TRUCK
      ?auto_27525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27522 ?auto_27523 ) ( SURFACE-AT ?auto_27518 ?auto_27523 ) ( CLEAR ?auto_27518 ) ( IS-CRATE ?auto_27517 ) ( not ( = ?auto_27517 ?auto_27518 ) ) ( not ( = ?auto_27524 ?auto_27523 ) ) ( HOIST-AT ?auto_27519 ?auto_27524 ) ( not ( = ?auto_27522 ?auto_27519 ) ) ( AVAILABLE ?auto_27519 ) ( SURFACE-AT ?auto_27517 ?auto_27524 ) ( ON ?auto_27517 ?auto_27520 ) ( CLEAR ?auto_27517 ) ( not ( = ?auto_27517 ?auto_27520 ) ) ( not ( = ?auto_27518 ?auto_27520 ) ) ( TRUCK-AT ?auto_27521 ?auto_27523 ) ( LIFTING ?auto_27522 ?auto_27525 ) ( IS-CRATE ?auto_27525 ) ( not ( = ?auto_27517 ?auto_27525 ) ) ( not ( = ?auto_27518 ?auto_27525 ) ) ( not ( = ?auto_27520 ?auto_27525 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27522 ?auto_27525 ?auto_27521 ?auto_27523 )
      ( MAKE-ON ?auto_27517 ?auto_27518 )
      ( MAKE-ON-VERIFY ?auto_27517 ?auto_27518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28083 - SURFACE
      ?auto_28084 - SURFACE
    )
    :vars
    (
      ?auto_28087 - HOIST
      ?auto_28089 - PLACE
      ?auto_28090 - TRUCK
      ?auto_28085 - PLACE
      ?auto_28086 - HOIST
      ?auto_28088 - SURFACE
      ?auto_28091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28087 ?auto_28089 ) ( SURFACE-AT ?auto_28084 ?auto_28089 ) ( CLEAR ?auto_28084 ) ( IS-CRATE ?auto_28083 ) ( not ( = ?auto_28083 ?auto_28084 ) ) ( AVAILABLE ?auto_28087 ) ( TRUCK-AT ?auto_28090 ?auto_28085 ) ( not ( = ?auto_28085 ?auto_28089 ) ) ( HOIST-AT ?auto_28086 ?auto_28085 ) ( not ( = ?auto_28087 ?auto_28086 ) ) ( SURFACE-AT ?auto_28083 ?auto_28085 ) ( ON ?auto_28083 ?auto_28088 ) ( CLEAR ?auto_28083 ) ( not ( = ?auto_28083 ?auto_28088 ) ) ( not ( = ?auto_28084 ?auto_28088 ) ) ( LIFTING ?auto_28086 ?auto_28091 ) ( IS-CRATE ?auto_28091 ) ( not ( = ?auto_28083 ?auto_28091 ) ) ( not ( = ?auto_28084 ?auto_28091 ) ) ( not ( = ?auto_28088 ?auto_28091 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28086 ?auto_28091 ?auto_28090 ?auto_28085 )
      ( MAKE-ON ?auto_28083 ?auto_28084 )
      ( MAKE-ON-VERIFY ?auto_28083 ?auto_28084 ) )
  )

)

