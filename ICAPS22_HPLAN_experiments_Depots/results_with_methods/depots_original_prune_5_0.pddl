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
      ?auto_3239 - SURFACE
      ?auto_3240 - SURFACE
    )
    :vars
    (
      ?auto_3241 - HOIST
      ?auto_3242 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3241 ?auto_3242 ) ( SURFACE-AT ?auto_3240 ?auto_3242 ) ( CLEAR ?auto_3240 ) ( LIFTING ?auto_3241 ?auto_3239 ) ( IS-CRATE ?auto_3239 ) ( not ( = ?auto_3239 ?auto_3240 ) ) )
    :subtasks
    ( ( !DROP ?auto_3241 ?auto_3239 ?auto_3240 ?auto_3242 )
      ( MAKE-ON-VERIFY ?auto_3239 ?auto_3240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3243 - SURFACE
      ?auto_3244 - SURFACE
    )
    :vars
    (
      ?auto_3246 - HOIST
      ?auto_3245 - PLACE
      ?auto_3247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3246 ?auto_3245 ) ( SURFACE-AT ?auto_3244 ?auto_3245 ) ( CLEAR ?auto_3244 ) ( IS-CRATE ?auto_3243 ) ( not ( = ?auto_3243 ?auto_3244 ) ) ( TRUCK-AT ?auto_3247 ?auto_3245 ) ( AVAILABLE ?auto_3246 ) ( IN ?auto_3243 ?auto_3247 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3246 ?auto_3243 ?auto_3247 ?auto_3245 )
      ( MAKE-ON ?auto_3243 ?auto_3244 )
      ( MAKE-ON-VERIFY ?auto_3243 ?auto_3244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3248 - SURFACE
      ?auto_3249 - SURFACE
    )
    :vars
    (
      ?auto_3251 - HOIST
      ?auto_3250 - PLACE
      ?auto_3252 - TRUCK
      ?auto_3253 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3251 ?auto_3250 ) ( SURFACE-AT ?auto_3249 ?auto_3250 ) ( CLEAR ?auto_3249 ) ( IS-CRATE ?auto_3248 ) ( not ( = ?auto_3248 ?auto_3249 ) ) ( AVAILABLE ?auto_3251 ) ( IN ?auto_3248 ?auto_3252 ) ( TRUCK-AT ?auto_3252 ?auto_3253 ) ( not ( = ?auto_3253 ?auto_3250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3252 ?auto_3253 ?auto_3250 )
      ( MAKE-ON ?auto_3248 ?auto_3249 )
      ( MAKE-ON-VERIFY ?auto_3248 ?auto_3249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3254 - SURFACE
      ?auto_3255 - SURFACE
    )
    :vars
    (
      ?auto_3259 - HOIST
      ?auto_3258 - PLACE
      ?auto_3257 - TRUCK
      ?auto_3256 - PLACE
      ?auto_3260 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3259 ?auto_3258 ) ( SURFACE-AT ?auto_3255 ?auto_3258 ) ( CLEAR ?auto_3255 ) ( IS-CRATE ?auto_3254 ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( AVAILABLE ?auto_3259 ) ( TRUCK-AT ?auto_3257 ?auto_3256 ) ( not ( = ?auto_3256 ?auto_3258 ) ) ( HOIST-AT ?auto_3260 ?auto_3256 ) ( LIFTING ?auto_3260 ?auto_3254 ) ( not ( = ?auto_3259 ?auto_3260 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3260 ?auto_3254 ?auto_3257 ?auto_3256 )
      ( MAKE-ON ?auto_3254 ?auto_3255 )
      ( MAKE-ON-VERIFY ?auto_3254 ?auto_3255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3261 - SURFACE
      ?auto_3262 - SURFACE
    )
    :vars
    (
      ?auto_3263 - HOIST
      ?auto_3265 - PLACE
      ?auto_3264 - TRUCK
      ?auto_3267 - PLACE
      ?auto_3266 - HOIST
      ?auto_3268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3263 ?auto_3265 ) ( SURFACE-AT ?auto_3262 ?auto_3265 ) ( CLEAR ?auto_3262 ) ( IS-CRATE ?auto_3261 ) ( not ( = ?auto_3261 ?auto_3262 ) ) ( AVAILABLE ?auto_3263 ) ( TRUCK-AT ?auto_3264 ?auto_3267 ) ( not ( = ?auto_3267 ?auto_3265 ) ) ( HOIST-AT ?auto_3266 ?auto_3267 ) ( not ( = ?auto_3263 ?auto_3266 ) ) ( AVAILABLE ?auto_3266 ) ( SURFACE-AT ?auto_3261 ?auto_3267 ) ( ON ?auto_3261 ?auto_3268 ) ( CLEAR ?auto_3261 ) ( not ( = ?auto_3261 ?auto_3268 ) ) ( not ( = ?auto_3262 ?auto_3268 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3266 ?auto_3261 ?auto_3268 ?auto_3267 )
      ( MAKE-ON ?auto_3261 ?auto_3262 )
      ( MAKE-ON-VERIFY ?auto_3261 ?auto_3262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3269 - SURFACE
      ?auto_3270 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3273 - PLACE
      ?auto_3275 - PLACE
      ?auto_3271 - HOIST
      ?auto_3272 - SURFACE
      ?auto_3276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3273 ) ( SURFACE-AT ?auto_3270 ?auto_3273 ) ( CLEAR ?auto_3270 ) ( IS-CRATE ?auto_3269 ) ( not ( = ?auto_3269 ?auto_3270 ) ) ( AVAILABLE ?auto_3274 ) ( not ( = ?auto_3275 ?auto_3273 ) ) ( HOIST-AT ?auto_3271 ?auto_3275 ) ( not ( = ?auto_3274 ?auto_3271 ) ) ( AVAILABLE ?auto_3271 ) ( SURFACE-AT ?auto_3269 ?auto_3275 ) ( ON ?auto_3269 ?auto_3272 ) ( CLEAR ?auto_3269 ) ( not ( = ?auto_3269 ?auto_3272 ) ) ( not ( = ?auto_3270 ?auto_3272 ) ) ( TRUCK-AT ?auto_3276 ?auto_3273 ) )
    :subtasks
    ( ( !DRIVE ?auto_3276 ?auto_3273 ?auto_3275 )
      ( MAKE-ON ?auto_3269 ?auto_3270 )
      ( MAKE-ON-VERIFY ?auto_3269 ?auto_3270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3317 - SURFACE
      ?auto_3318 - SURFACE
    )
    :vars
    (
      ?auto_3322 - HOIST
      ?auto_3319 - PLACE
      ?auto_3321 - PLACE
      ?auto_3323 - HOIST
      ?auto_3320 - SURFACE
      ?auto_3324 - TRUCK
      ?auto_3325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3322 ?auto_3319 ) ( IS-CRATE ?auto_3317 ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( not ( = ?auto_3321 ?auto_3319 ) ) ( HOIST-AT ?auto_3323 ?auto_3321 ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( AVAILABLE ?auto_3323 ) ( SURFACE-AT ?auto_3317 ?auto_3321 ) ( ON ?auto_3317 ?auto_3320 ) ( CLEAR ?auto_3317 ) ( not ( = ?auto_3317 ?auto_3320 ) ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( TRUCK-AT ?auto_3324 ?auto_3319 ) ( SURFACE-AT ?auto_3325 ?auto_3319 ) ( CLEAR ?auto_3325 ) ( LIFTING ?auto_3322 ?auto_3318 ) ( IS-CRATE ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3325 ) ) ( not ( = ?auto_3318 ?auto_3325 ) ) ( not ( = ?auto_3320 ?auto_3325 ) ) )
    :subtasks
    ( ( !DROP ?auto_3322 ?auto_3318 ?auto_3325 ?auto_3319 )
      ( MAKE-ON ?auto_3317 ?auto_3318 )
      ( MAKE-ON-VERIFY ?auto_3317 ?auto_3318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3326 - SURFACE
      ?auto_3327 - SURFACE
    )
    :vars
    (
      ?auto_3333 - HOIST
      ?auto_3329 - PLACE
      ?auto_3330 - PLACE
      ?auto_3331 - HOIST
      ?auto_3328 - SURFACE
      ?auto_3332 - TRUCK
      ?auto_3334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3333 ?auto_3329 ) ( IS-CRATE ?auto_3326 ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( not ( = ?auto_3330 ?auto_3329 ) ) ( HOIST-AT ?auto_3331 ?auto_3330 ) ( not ( = ?auto_3333 ?auto_3331 ) ) ( AVAILABLE ?auto_3331 ) ( SURFACE-AT ?auto_3326 ?auto_3330 ) ( ON ?auto_3326 ?auto_3328 ) ( CLEAR ?auto_3326 ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( TRUCK-AT ?auto_3332 ?auto_3329 ) ( SURFACE-AT ?auto_3334 ?auto_3329 ) ( CLEAR ?auto_3334 ) ( IS-CRATE ?auto_3327 ) ( not ( = ?auto_3326 ?auto_3334 ) ) ( not ( = ?auto_3327 ?auto_3334 ) ) ( not ( = ?auto_3328 ?auto_3334 ) ) ( AVAILABLE ?auto_3333 ) ( IN ?auto_3327 ?auto_3332 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3333 ?auto_3327 ?auto_3332 ?auto_3329 )
      ( MAKE-ON ?auto_3326 ?auto_3327 )
      ( MAKE-ON-VERIFY ?auto_3326 ?auto_3327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3335 - SURFACE
      ?auto_3336 - SURFACE
    )
    :vars
    (
      ?auto_3338 - HOIST
      ?auto_3343 - PLACE
      ?auto_3337 - PLACE
      ?auto_3339 - HOIST
      ?auto_3342 - SURFACE
      ?auto_3340 - SURFACE
      ?auto_3341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3338 ?auto_3343 ) ( IS-CRATE ?auto_3335 ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3337 ?auto_3343 ) ) ( HOIST-AT ?auto_3339 ?auto_3337 ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( AVAILABLE ?auto_3339 ) ( SURFACE-AT ?auto_3335 ?auto_3337 ) ( ON ?auto_3335 ?auto_3342 ) ( CLEAR ?auto_3335 ) ( not ( = ?auto_3335 ?auto_3342 ) ) ( not ( = ?auto_3336 ?auto_3342 ) ) ( SURFACE-AT ?auto_3340 ?auto_3343 ) ( CLEAR ?auto_3340 ) ( IS-CRATE ?auto_3336 ) ( not ( = ?auto_3335 ?auto_3340 ) ) ( not ( = ?auto_3336 ?auto_3340 ) ) ( not ( = ?auto_3342 ?auto_3340 ) ) ( AVAILABLE ?auto_3338 ) ( IN ?auto_3336 ?auto_3341 ) ( TRUCK-AT ?auto_3341 ?auto_3337 ) )
    :subtasks
    ( ( !DRIVE ?auto_3341 ?auto_3337 ?auto_3343 )
      ( MAKE-ON ?auto_3335 ?auto_3336 )
      ( MAKE-ON-VERIFY ?auto_3335 ?auto_3336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3344 - SURFACE
      ?auto_3345 - SURFACE
    )
    :vars
    (
      ?auto_3347 - HOIST
      ?auto_3350 - PLACE
      ?auto_3346 - PLACE
      ?auto_3352 - HOIST
      ?auto_3351 - SURFACE
      ?auto_3348 - SURFACE
      ?auto_3349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3347 ?auto_3350 ) ( IS-CRATE ?auto_3344 ) ( not ( = ?auto_3344 ?auto_3345 ) ) ( not ( = ?auto_3346 ?auto_3350 ) ) ( HOIST-AT ?auto_3352 ?auto_3346 ) ( not ( = ?auto_3347 ?auto_3352 ) ) ( SURFACE-AT ?auto_3344 ?auto_3346 ) ( ON ?auto_3344 ?auto_3351 ) ( CLEAR ?auto_3344 ) ( not ( = ?auto_3344 ?auto_3351 ) ) ( not ( = ?auto_3345 ?auto_3351 ) ) ( SURFACE-AT ?auto_3348 ?auto_3350 ) ( CLEAR ?auto_3348 ) ( IS-CRATE ?auto_3345 ) ( not ( = ?auto_3344 ?auto_3348 ) ) ( not ( = ?auto_3345 ?auto_3348 ) ) ( not ( = ?auto_3351 ?auto_3348 ) ) ( AVAILABLE ?auto_3347 ) ( TRUCK-AT ?auto_3349 ?auto_3346 ) ( LIFTING ?auto_3352 ?auto_3345 ) )
    :subtasks
    ( ( !LOAD ?auto_3352 ?auto_3345 ?auto_3349 ?auto_3346 )
      ( MAKE-ON ?auto_3344 ?auto_3345 )
      ( MAKE-ON-VERIFY ?auto_3344 ?auto_3345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3353 - SURFACE
      ?auto_3354 - SURFACE
    )
    :vars
    (
      ?auto_3355 - HOIST
      ?auto_3357 - PLACE
      ?auto_3361 - PLACE
      ?auto_3359 - HOIST
      ?auto_3358 - SURFACE
      ?auto_3356 - SURFACE
      ?auto_3360 - TRUCK
      ?auto_3362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3355 ?auto_3357 ) ( IS-CRATE ?auto_3353 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( not ( = ?auto_3361 ?auto_3357 ) ) ( HOIST-AT ?auto_3359 ?auto_3361 ) ( not ( = ?auto_3355 ?auto_3359 ) ) ( SURFACE-AT ?auto_3353 ?auto_3361 ) ( ON ?auto_3353 ?auto_3358 ) ( CLEAR ?auto_3353 ) ( not ( = ?auto_3353 ?auto_3358 ) ) ( not ( = ?auto_3354 ?auto_3358 ) ) ( SURFACE-AT ?auto_3356 ?auto_3357 ) ( CLEAR ?auto_3356 ) ( IS-CRATE ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3356 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( not ( = ?auto_3358 ?auto_3356 ) ) ( AVAILABLE ?auto_3355 ) ( TRUCK-AT ?auto_3360 ?auto_3361 ) ( AVAILABLE ?auto_3359 ) ( SURFACE-AT ?auto_3354 ?auto_3361 ) ( ON ?auto_3354 ?auto_3362 ) ( CLEAR ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3362 ) ) ( not ( = ?auto_3354 ?auto_3362 ) ) ( not ( = ?auto_3358 ?auto_3362 ) ) ( not ( = ?auto_3356 ?auto_3362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3359 ?auto_3354 ?auto_3362 ?auto_3361 )
      ( MAKE-ON ?auto_3353 ?auto_3354 )
      ( MAKE-ON-VERIFY ?auto_3353 ?auto_3354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3363 - SURFACE
      ?auto_3364 - SURFACE
    )
    :vars
    (
      ?auto_3368 - HOIST
      ?auto_3372 - PLACE
      ?auto_3367 - PLACE
      ?auto_3369 - HOIST
      ?auto_3371 - SURFACE
      ?auto_3370 - SURFACE
      ?auto_3366 - SURFACE
      ?auto_3365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3368 ?auto_3372 ) ( IS-CRATE ?auto_3363 ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( not ( = ?auto_3367 ?auto_3372 ) ) ( HOIST-AT ?auto_3369 ?auto_3367 ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( SURFACE-AT ?auto_3363 ?auto_3367 ) ( ON ?auto_3363 ?auto_3371 ) ( CLEAR ?auto_3363 ) ( not ( = ?auto_3363 ?auto_3371 ) ) ( not ( = ?auto_3364 ?auto_3371 ) ) ( SURFACE-AT ?auto_3370 ?auto_3372 ) ( CLEAR ?auto_3370 ) ( IS-CRATE ?auto_3364 ) ( not ( = ?auto_3363 ?auto_3370 ) ) ( not ( = ?auto_3364 ?auto_3370 ) ) ( not ( = ?auto_3371 ?auto_3370 ) ) ( AVAILABLE ?auto_3368 ) ( AVAILABLE ?auto_3369 ) ( SURFACE-AT ?auto_3364 ?auto_3367 ) ( ON ?auto_3364 ?auto_3366 ) ( CLEAR ?auto_3364 ) ( not ( = ?auto_3363 ?auto_3366 ) ) ( not ( = ?auto_3364 ?auto_3366 ) ) ( not ( = ?auto_3371 ?auto_3366 ) ) ( not ( = ?auto_3370 ?auto_3366 ) ) ( TRUCK-AT ?auto_3365 ?auto_3372 ) )
    :subtasks
    ( ( !DRIVE ?auto_3365 ?auto_3372 ?auto_3367 )
      ( MAKE-ON ?auto_3363 ?auto_3364 )
      ( MAKE-ON-VERIFY ?auto_3363 ?auto_3364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3437 - SURFACE
      ?auto_3438 - SURFACE
    )
    :vars
    (
      ?auto_3442 - HOIST
      ?auto_3441 - PLACE
      ?auto_3444 - PLACE
      ?auto_3440 - HOIST
      ?auto_3443 - SURFACE
      ?auto_3439 - TRUCK
      ?auto_3445 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3442 ?auto_3441 ) ( SURFACE-AT ?auto_3438 ?auto_3441 ) ( CLEAR ?auto_3438 ) ( IS-CRATE ?auto_3437 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( AVAILABLE ?auto_3442 ) ( not ( = ?auto_3444 ?auto_3441 ) ) ( HOIST-AT ?auto_3440 ?auto_3444 ) ( not ( = ?auto_3442 ?auto_3440 ) ) ( AVAILABLE ?auto_3440 ) ( SURFACE-AT ?auto_3437 ?auto_3444 ) ( ON ?auto_3437 ?auto_3443 ) ( CLEAR ?auto_3437 ) ( not ( = ?auto_3437 ?auto_3443 ) ) ( not ( = ?auto_3438 ?auto_3443 ) ) ( TRUCK-AT ?auto_3439 ?auto_3445 ) ( not ( = ?auto_3445 ?auto_3441 ) ) ( not ( = ?auto_3444 ?auto_3445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3439 ?auto_3445 ?auto_3441 )
      ( MAKE-ON ?auto_3437 ?auto_3438 )
      ( MAKE-ON-VERIFY ?auto_3437 ?auto_3438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3452 - SURFACE
      ?auto_3453 - SURFACE
    )
    :vars
    (
      ?auto_3459 - HOIST
      ?auto_3456 - PLACE
      ?auto_3455 - PLACE
      ?auto_3458 - HOIST
      ?auto_3457 - SURFACE
      ?auto_3454 - TRUCK
      ?auto_3460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3459 ?auto_3456 ) ( SURFACE-AT ?auto_3453 ?auto_3456 ) ( CLEAR ?auto_3453 ) ( IS-CRATE ?auto_3452 ) ( not ( = ?auto_3452 ?auto_3453 ) ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( HOIST-AT ?auto_3458 ?auto_3455 ) ( not ( = ?auto_3459 ?auto_3458 ) ) ( AVAILABLE ?auto_3458 ) ( SURFACE-AT ?auto_3452 ?auto_3455 ) ( ON ?auto_3452 ?auto_3457 ) ( CLEAR ?auto_3452 ) ( not ( = ?auto_3452 ?auto_3457 ) ) ( not ( = ?auto_3453 ?auto_3457 ) ) ( TRUCK-AT ?auto_3454 ?auto_3456 ) ( LIFTING ?auto_3459 ?auto_3460 ) ( IS-CRATE ?auto_3460 ) ( not ( = ?auto_3452 ?auto_3460 ) ) ( not ( = ?auto_3453 ?auto_3460 ) ) ( not ( = ?auto_3457 ?auto_3460 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3459 ?auto_3460 ?auto_3454 ?auto_3456 )
      ( MAKE-ON ?auto_3452 ?auto_3453 )
      ( MAKE-ON-VERIFY ?auto_3452 ?auto_3453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3658 - SURFACE
      ?auto_3659 - SURFACE
    )
    :vars
    (
      ?auto_3661 - HOIST
      ?auto_3663 - PLACE
      ?auto_3662 - PLACE
      ?auto_3664 - HOIST
      ?auto_3665 - SURFACE
      ?auto_3666 - SURFACE
      ?auto_3667 - SURFACE
      ?auto_3660 - TRUCK
      ?auto_3668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3661 ?auto_3663 ) ( IS-CRATE ?auto_3658 ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( not ( = ?auto_3662 ?auto_3663 ) ) ( HOIST-AT ?auto_3664 ?auto_3662 ) ( not ( = ?auto_3661 ?auto_3664 ) ) ( SURFACE-AT ?auto_3658 ?auto_3662 ) ( ON ?auto_3658 ?auto_3665 ) ( CLEAR ?auto_3658 ) ( not ( = ?auto_3658 ?auto_3665 ) ) ( not ( = ?auto_3659 ?auto_3665 ) ) ( IS-CRATE ?auto_3659 ) ( not ( = ?auto_3658 ?auto_3666 ) ) ( not ( = ?auto_3659 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( AVAILABLE ?auto_3664 ) ( SURFACE-AT ?auto_3659 ?auto_3662 ) ( ON ?auto_3659 ?auto_3667 ) ( CLEAR ?auto_3659 ) ( not ( = ?auto_3658 ?auto_3667 ) ) ( not ( = ?auto_3659 ?auto_3667 ) ) ( not ( = ?auto_3665 ?auto_3667 ) ) ( not ( = ?auto_3666 ?auto_3667 ) ) ( TRUCK-AT ?auto_3660 ?auto_3663 ) ( SURFACE-AT ?auto_3668 ?auto_3663 ) ( CLEAR ?auto_3668 ) ( LIFTING ?auto_3661 ?auto_3666 ) ( IS-CRATE ?auto_3666 ) ( not ( = ?auto_3658 ?auto_3668 ) ) ( not ( = ?auto_3659 ?auto_3668 ) ) ( not ( = ?auto_3665 ?auto_3668 ) ) ( not ( = ?auto_3666 ?auto_3668 ) ) ( not ( = ?auto_3667 ?auto_3668 ) ) )
    :subtasks
    ( ( !DROP ?auto_3661 ?auto_3666 ?auto_3668 ?auto_3663 )
      ( MAKE-ON ?auto_3658 ?auto_3659 )
      ( MAKE-ON-VERIFY ?auto_3658 ?auto_3659 ) )
  )

)

