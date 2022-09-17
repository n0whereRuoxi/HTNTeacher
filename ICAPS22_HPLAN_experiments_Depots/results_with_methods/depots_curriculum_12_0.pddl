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
      ?auto_3252 - SURFACE
      ?auto_3253 - SURFACE
    )
    :vars
    (
      ?auto_3254 - HOIST
      ?auto_3255 - PLACE
      ?auto_3257 - PLACE
      ?auto_3258 - HOIST
      ?auto_3259 - SURFACE
      ?auto_3256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3254 ?auto_3255 ) ( SURFACE-AT ?auto_3253 ?auto_3255 ) ( CLEAR ?auto_3253 ) ( IS-CRATE ?auto_3252 ) ( AVAILABLE ?auto_3254 ) ( not ( = ?auto_3257 ?auto_3255 ) ) ( HOIST-AT ?auto_3258 ?auto_3257 ) ( AVAILABLE ?auto_3258 ) ( SURFACE-AT ?auto_3252 ?auto_3257 ) ( ON ?auto_3252 ?auto_3259 ) ( CLEAR ?auto_3252 ) ( TRUCK-AT ?auto_3256 ?auto_3255 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3259 ) ) ( not ( = ?auto_3253 ?auto_3259 ) ) ( not ( = ?auto_3254 ?auto_3258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3256 ?auto_3255 ?auto_3257 )
      ( !LIFT ?auto_3258 ?auto_3252 ?auto_3259 ?auto_3257 )
      ( !LOAD ?auto_3258 ?auto_3252 ?auto_3256 ?auto_3257 )
      ( !DRIVE ?auto_3256 ?auto_3257 ?auto_3255 )
      ( !UNLOAD ?auto_3254 ?auto_3252 ?auto_3256 ?auto_3255 )
      ( !DROP ?auto_3254 ?auto_3252 ?auto_3253 ?auto_3255 )
      ( MAKE-ON-VERIFY ?auto_3252 ?auto_3253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3262 - SURFACE
      ?auto_3263 - SURFACE
    )
    :vars
    (
      ?auto_3264 - HOIST
      ?auto_3265 - PLACE
      ?auto_3267 - PLACE
      ?auto_3268 - HOIST
      ?auto_3269 - SURFACE
      ?auto_3266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3264 ?auto_3265 ) ( SURFACE-AT ?auto_3263 ?auto_3265 ) ( CLEAR ?auto_3263 ) ( IS-CRATE ?auto_3262 ) ( AVAILABLE ?auto_3264 ) ( not ( = ?auto_3267 ?auto_3265 ) ) ( HOIST-AT ?auto_3268 ?auto_3267 ) ( AVAILABLE ?auto_3268 ) ( SURFACE-AT ?auto_3262 ?auto_3267 ) ( ON ?auto_3262 ?auto_3269 ) ( CLEAR ?auto_3262 ) ( TRUCK-AT ?auto_3266 ?auto_3265 ) ( not ( = ?auto_3262 ?auto_3263 ) ) ( not ( = ?auto_3262 ?auto_3269 ) ) ( not ( = ?auto_3263 ?auto_3269 ) ) ( not ( = ?auto_3264 ?auto_3268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3266 ?auto_3265 ?auto_3267 )
      ( !LIFT ?auto_3268 ?auto_3262 ?auto_3269 ?auto_3267 )
      ( !LOAD ?auto_3268 ?auto_3262 ?auto_3266 ?auto_3267 )
      ( !DRIVE ?auto_3266 ?auto_3267 ?auto_3265 )
      ( !UNLOAD ?auto_3264 ?auto_3262 ?auto_3266 ?auto_3265 )
      ( !DROP ?auto_3264 ?auto_3262 ?auto_3263 ?auto_3265 )
      ( MAKE-ON-VERIFY ?auto_3262 ?auto_3263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3272 - SURFACE
      ?auto_3273 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3275 - PLACE
      ?auto_3277 - PLACE
      ?auto_3278 - HOIST
      ?auto_3279 - SURFACE
      ?auto_3276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3275 ) ( SURFACE-AT ?auto_3273 ?auto_3275 ) ( CLEAR ?auto_3273 ) ( IS-CRATE ?auto_3272 ) ( AVAILABLE ?auto_3274 ) ( not ( = ?auto_3277 ?auto_3275 ) ) ( HOIST-AT ?auto_3278 ?auto_3277 ) ( AVAILABLE ?auto_3278 ) ( SURFACE-AT ?auto_3272 ?auto_3277 ) ( ON ?auto_3272 ?auto_3279 ) ( CLEAR ?auto_3272 ) ( TRUCK-AT ?auto_3276 ?auto_3275 ) ( not ( = ?auto_3272 ?auto_3273 ) ) ( not ( = ?auto_3272 ?auto_3279 ) ) ( not ( = ?auto_3273 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3276 ?auto_3275 ?auto_3277 )
      ( !LIFT ?auto_3278 ?auto_3272 ?auto_3279 ?auto_3277 )
      ( !LOAD ?auto_3278 ?auto_3272 ?auto_3276 ?auto_3277 )
      ( !DRIVE ?auto_3276 ?auto_3277 ?auto_3275 )
      ( !UNLOAD ?auto_3274 ?auto_3272 ?auto_3276 ?auto_3275 )
      ( !DROP ?auto_3274 ?auto_3272 ?auto_3273 ?auto_3275 )
      ( MAKE-ON-VERIFY ?auto_3272 ?auto_3273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3282 - SURFACE
      ?auto_3283 - SURFACE
    )
    :vars
    (
      ?auto_3284 - HOIST
      ?auto_3285 - PLACE
      ?auto_3287 - PLACE
      ?auto_3288 - HOIST
      ?auto_3289 - SURFACE
      ?auto_3286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3284 ?auto_3285 ) ( SURFACE-AT ?auto_3283 ?auto_3285 ) ( CLEAR ?auto_3283 ) ( IS-CRATE ?auto_3282 ) ( AVAILABLE ?auto_3284 ) ( not ( = ?auto_3287 ?auto_3285 ) ) ( HOIST-AT ?auto_3288 ?auto_3287 ) ( AVAILABLE ?auto_3288 ) ( SURFACE-AT ?auto_3282 ?auto_3287 ) ( ON ?auto_3282 ?auto_3289 ) ( CLEAR ?auto_3282 ) ( TRUCK-AT ?auto_3286 ?auto_3285 ) ( not ( = ?auto_3282 ?auto_3283 ) ) ( not ( = ?auto_3282 ?auto_3289 ) ) ( not ( = ?auto_3283 ?auto_3289 ) ) ( not ( = ?auto_3284 ?auto_3288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3286 ?auto_3285 ?auto_3287 )
      ( !LIFT ?auto_3288 ?auto_3282 ?auto_3289 ?auto_3287 )
      ( !LOAD ?auto_3288 ?auto_3282 ?auto_3286 ?auto_3287 )
      ( !DRIVE ?auto_3286 ?auto_3287 ?auto_3285 )
      ( !UNLOAD ?auto_3284 ?auto_3282 ?auto_3286 ?auto_3285 )
      ( !DROP ?auto_3284 ?auto_3282 ?auto_3283 ?auto_3285 )
      ( MAKE-ON-VERIFY ?auto_3282 ?auto_3283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3292 - SURFACE
      ?auto_3293 - SURFACE
    )
    :vars
    (
      ?auto_3294 - HOIST
      ?auto_3295 - PLACE
      ?auto_3297 - PLACE
      ?auto_3298 - HOIST
      ?auto_3299 - SURFACE
      ?auto_3296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3294 ?auto_3295 ) ( SURFACE-AT ?auto_3293 ?auto_3295 ) ( CLEAR ?auto_3293 ) ( IS-CRATE ?auto_3292 ) ( AVAILABLE ?auto_3294 ) ( not ( = ?auto_3297 ?auto_3295 ) ) ( HOIST-AT ?auto_3298 ?auto_3297 ) ( AVAILABLE ?auto_3298 ) ( SURFACE-AT ?auto_3292 ?auto_3297 ) ( ON ?auto_3292 ?auto_3299 ) ( CLEAR ?auto_3292 ) ( TRUCK-AT ?auto_3296 ?auto_3295 ) ( not ( = ?auto_3292 ?auto_3293 ) ) ( not ( = ?auto_3292 ?auto_3299 ) ) ( not ( = ?auto_3293 ?auto_3299 ) ) ( not ( = ?auto_3294 ?auto_3298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3296 ?auto_3295 ?auto_3297 )
      ( !LIFT ?auto_3298 ?auto_3292 ?auto_3299 ?auto_3297 )
      ( !LOAD ?auto_3298 ?auto_3292 ?auto_3296 ?auto_3297 )
      ( !DRIVE ?auto_3296 ?auto_3297 ?auto_3295 )
      ( !UNLOAD ?auto_3294 ?auto_3292 ?auto_3296 ?auto_3295 )
      ( !DROP ?auto_3294 ?auto_3292 ?auto_3293 ?auto_3295 )
      ( MAKE-ON-VERIFY ?auto_3292 ?auto_3293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3302 - SURFACE
      ?auto_3303 - SURFACE
    )
    :vars
    (
      ?auto_3304 - HOIST
      ?auto_3305 - PLACE
      ?auto_3307 - PLACE
      ?auto_3308 - HOIST
      ?auto_3309 - SURFACE
      ?auto_3306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3304 ?auto_3305 ) ( SURFACE-AT ?auto_3303 ?auto_3305 ) ( CLEAR ?auto_3303 ) ( IS-CRATE ?auto_3302 ) ( AVAILABLE ?auto_3304 ) ( not ( = ?auto_3307 ?auto_3305 ) ) ( HOIST-AT ?auto_3308 ?auto_3307 ) ( AVAILABLE ?auto_3308 ) ( SURFACE-AT ?auto_3302 ?auto_3307 ) ( ON ?auto_3302 ?auto_3309 ) ( CLEAR ?auto_3302 ) ( TRUCK-AT ?auto_3306 ?auto_3305 ) ( not ( = ?auto_3302 ?auto_3303 ) ) ( not ( = ?auto_3302 ?auto_3309 ) ) ( not ( = ?auto_3303 ?auto_3309 ) ) ( not ( = ?auto_3304 ?auto_3308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3306 ?auto_3305 ?auto_3307 )
      ( !LIFT ?auto_3308 ?auto_3302 ?auto_3309 ?auto_3307 )
      ( !LOAD ?auto_3308 ?auto_3302 ?auto_3306 ?auto_3307 )
      ( !DRIVE ?auto_3306 ?auto_3307 ?auto_3305 )
      ( !UNLOAD ?auto_3304 ?auto_3302 ?auto_3306 ?auto_3305 )
      ( !DROP ?auto_3304 ?auto_3302 ?auto_3303 ?auto_3305 )
      ( MAKE-ON-VERIFY ?auto_3302 ?auto_3303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3312 - SURFACE
      ?auto_3313 - SURFACE
    )
    :vars
    (
      ?auto_3314 - HOIST
      ?auto_3315 - PLACE
      ?auto_3317 - PLACE
      ?auto_3318 - HOIST
      ?auto_3319 - SURFACE
      ?auto_3316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3314 ?auto_3315 ) ( SURFACE-AT ?auto_3313 ?auto_3315 ) ( CLEAR ?auto_3313 ) ( IS-CRATE ?auto_3312 ) ( AVAILABLE ?auto_3314 ) ( not ( = ?auto_3317 ?auto_3315 ) ) ( HOIST-AT ?auto_3318 ?auto_3317 ) ( AVAILABLE ?auto_3318 ) ( SURFACE-AT ?auto_3312 ?auto_3317 ) ( ON ?auto_3312 ?auto_3319 ) ( CLEAR ?auto_3312 ) ( TRUCK-AT ?auto_3316 ?auto_3315 ) ( not ( = ?auto_3312 ?auto_3313 ) ) ( not ( = ?auto_3312 ?auto_3319 ) ) ( not ( = ?auto_3313 ?auto_3319 ) ) ( not ( = ?auto_3314 ?auto_3318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3316 ?auto_3315 ?auto_3317 )
      ( !LIFT ?auto_3318 ?auto_3312 ?auto_3319 ?auto_3317 )
      ( !LOAD ?auto_3318 ?auto_3312 ?auto_3316 ?auto_3317 )
      ( !DRIVE ?auto_3316 ?auto_3317 ?auto_3315 )
      ( !UNLOAD ?auto_3314 ?auto_3312 ?auto_3316 ?auto_3315 )
      ( !DROP ?auto_3314 ?auto_3312 ?auto_3313 ?auto_3315 )
      ( MAKE-ON-VERIFY ?auto_3312 ?auto_3313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3322 - SURFACE
      ?auto_3323 - SURFACE
    )
    :vars
    (
      ?auto_3324 - HOIST
      ?auto_3325 - PLACE
      ?auto_3327 - PLACE
      ?auto_3328 - HOIST
      ?auto_3329 - SURFACE
      ?auto_3326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3324 ?auto_3325 ) ( SURFACE-AT ?auto_3323 ?auto_3325 ) ( CLEAR ?auto_3323 ) ( IS-CRATE ?auto_3322 ) ( AVAILABLE ?auto_3324 ) ( not ( = ?auto_3327 ?auto_3325 ) ) ( HOIST-AT ?auto_3328 ?auto_3327 ) ( AVAILABLE ?auto_3328 ) ( SURFACE-AT ?auto_3322 ?auto_3327 ) ( ON ?auto_3322 ?auto_3329 ) ( CLEAR ?auto_3322 ) ( TRUCK-AT ?auto_3326 ?auto_3325 ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( not ( = ?auto_3322 ?auto_3329 ) ) ( not ( = ?auto_3323 ?auto_3329 ) ) ( not ( = ?auto_3324 ?auto_3328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3326 ?auto_3325 ?auto_3327 )
      ( !LIFT ?auto_3328 ?auto_3322 ?auto_3329 ?auto_3327 )
      ( !LOAD ?auto_3328 ?auto_3322 ?auto_3326 ?auto_3327 )
      ( !DRIVE ?auto_3326 ?auto_3327 ?auto_3325 )
      ( !UNLOAD ?auto_3324 ?auto_3322 ?auto_3326 ?auto_3325 )
      ( !DROP ?auto_3324 ?auto_3322 ?auto_3323 ?auto_3325 )
      ( MAKE-ON-VERIFY ?auto_3322 ?auto_3323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3332 - SURFACE
      ?auto_3333 - SURFACE
    )
    :vars
    (
      ?auto_3334 - HOIST
      ?auto_3335 - PLACE
      ?auto_3337 - PLACE
      ?auto_3338 - HOIST
      ?auto_3339 - SURFACE
      ?auto_3336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3334 ?auto_3335 ) ( SURFACE-AT ?auto_3333 ?auto_3335 ) ( CLEAR ?auto_3333 ) ( IS-CRATE ?auto_3332 ) ( AVAILABLE ?auto_3334 ) ( not ( = ?auto_3337 ?auto_3335 ) ) ( HOIST-AT ?auto_3338 ?auto_3337 ) ( AVAILABLE ?auto_3338 ) ( SURFACE-AT ?auto_3332 ?auto_3337 ) ( ON ?auto_3332 ?auto_3339 ) ( CLEAR ?auto_3332 ) ( TRUCK-AT ?auto_3336 ?auto_3335 ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3339 ) ) ( not ( = ?auto_3333 ?auto_3339 ) ) ( not ( = ?auto_3334 ?auto_3338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3336 ?auto_3335 ?auto_3337 )
      ( !LIFT ?auto_3338 ?auto_3332 ?auto_3339 ?auto_3337 )
      ( !LOAD ?auto_3338 ?auto_3332 ?auto_3336 ?auto_3337 )
      ( !DRIVE ?auto_3336 ?auto_3337 ?auto_3335 )
      ( !UNLOAD ?auto_3334 ?auto_3332 ?auto_3336 ?auto_3335 )
      ( !DROP ?auto_3334 ?auto_3332 ?auto_3333 ?auto_3335 )
      ( MAKE-ON-VERIFY ?auto_3332 ?auto_3333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3342 - SURFACE
      ?auto_3343 - SURFACE
    )
    :vars
    (
      ?auto_3344 - HOIST
      ?auto_3345 - PLACE
      ?auto_3347 - PLACE
      ?auto_3348 - HOIST
      ?auto_3349 - SURFACE
      ?auto_3346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3344 ?auto_3345 ) ( SURFACE-AT ?auto_3343 ?auto_3345 ) ( CLEAR ?auto_3343 ) ( IS-CRATE ?auto_3342 ) ( AVAILABLE ?auto_3344 ) ( not ( = ?auto_3347 ?auto_3345 ) ) ( HOIST-AT ?auto_3348 ?auto_3347 ) ( AVAILABLE ?auto_3348 ) ( SURFACE-AT ?auto_3342 ?auto_3347 ) ( ON ?auto_3342 ?auto_3349 ) ( CLEAR ?auto_3342 ) ( TRUCK-AT ?auto_3346 ?auto_3345 ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3349 ) ) ( not ( = ?auto_3343 ?auto_3349 ) ) ( not ( = ?auto_3344 ?auto_3348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3346 ?auto_3345 ?auto_3347 )
      ( !LIFT ?auto_3348 ?auto_3342 ?auto_3349 ?auto_3347 )
      ( !LOAD ?auto_3348 ?auto_3342 ?auto_3346 ?auto_3347 )
      ( !DRIVE ?auto_3346 ?auto_3347 ?auto_3345 )
      ( !UNLOAD ?auto_3344 ?auto_3342 ?auto_3346 ?auto_3345 )
      ( !DROP ?auto_3344 ?auto_3342 ?auto_3343 ?auto_3345 )
      ( MAKE-ON-VERIFY ?auto_3342 ?auto_3343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3352 - SURFACE
      ?auto_3353 - SURFACE
    )
    :vars
    (
      ?auto_3354 - HOIST
      ?auto_3355 - PLACE
      ?auto_3357 - PLACE
      ?auto_3358 - HOIST
      ?auto_3359 - SURFACE
      ?auto_3356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3354 ?auto_3355 ) ( SURFACE-AT ?auto_3353 ?auto_3355 ) ( CLEAR ?auto_3353 ) ( IS-CRATE ?auto_3352 ) ( AVAILABLE ?auto_3354 ) ( not ( = ?auto_3357 ?auto_3355 ) ) ( HOIST-AT ?auto_3358 ?auto_3357 ) ( AVAILABLE ?auto_3358 ) ( SURFACE-AT ?auto_3352 ?auto_3357 ) ( ON ?auto_3352 ?auto_3359 ) ( CLEAR ?auto_3352 ) ( TRUCK-AT ?auto_3356 ?auto_3355 ) ( not ( = ?auto_3352 ?auto_3353 ) ) ( not ( = ?auto_3352 ?auto_3359 ) ) ( not ( = ?auto_3353 ?auto_3359 ) ) ( not ( = ?auto_3354 ?auto_3358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3356 ?auto_3355 ?auto_3357 )
      ( !LIFT ?auto_3358 ?auto_3352 ?auto_3359 ?auto_3357 )
      ( !LOAD ?auto_3358 ?auto_3352 ?auto_3356 ?auto_3357 )
      ( !DRIVE ?auto_3356 ?auto_3357 ?auto_3355 )
      ( !UNLOAD ?auto_3354 ?auto_3352 ?auto_3356 ?auto_3355 )
      ( !DROP ?auto_3354 ?auto_3352 ?auto_3353 ?auto_3355 )
      ( MAKE-ON-VERIFY ?auto_3352 ?auto_3353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3362 - SURFACE
      ?auto_3363 - SURFACE
    )
    :vars
    (
      ?auto_3364 - HOIST
      ?auto_3365 - PLACE
      ?auto_3367 - PLACE
      ?auto_3368 - HOIST
      ?auto_3369 - SURFACE
      ?auto_3366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3364 ?auto_3365 ) ( SURFACE-AT ?auto_3363 ?auto_3365 ) ( CLEAR ?auto_3363 ) ( IS-CRATE ?auto_3362 ) ( AVAILABLE ?auto_3364 ) ( not ( = ?auto_3367 ?auto_3365 ) ) ( HOIST-AT ?auto_3368 ?auto_3367 ) ( AVAILABLE ?auto_3368 ) ( SURFACE-AT ?auto_3362 ?auto_3367 ) ( ON ?auto_3362 ?auto_3369 ) ( CLEAR ?auto_3362 ) ( TRUCK-AT ?auto_3366 ?auto_3365 ) ( not ( = ?auto_3362 ?auto_3363 ) ) ( not ( = ?auto_3362 ?auto_3369 ) ) ( not ( = ?auto_3363 ?auto_3369 ) ) ( not ( = ?auto_3364 ?auto_3368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3366 ?auto_3365 ?auto_3367 )
      ( !LIFT ?auto_3368 ?auto_3362 ?auto_3369 ?auto_3367 )
      ( !LOAD ?auto_3368 ?auto_3362 ?auto_3366 ?auto_3367 )
      ( !DRIVE ?auto_3366 ?auto_3367 ?auto_3365 )
      ( !UNLOAD ?auto_3364 ?auto_3362 ?auto_3366 ?auto_3365 )
      ( !DROP ?auto_3364 ?auto_3362 ?auto_3363 ?auto_3365 )
      ( MAKE-ON-VERIFY ?auto_3362 ?auto_3363 ) )
  )

)

