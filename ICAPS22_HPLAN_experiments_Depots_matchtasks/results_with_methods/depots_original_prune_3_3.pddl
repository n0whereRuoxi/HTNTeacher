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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3200 - SURFACE
      ?auto_3201 - SURFACE
    )
    :vars
    (
      ?auto_3202 - HOIST
      ?auto_3203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3202 ?auto_3203 ) ( SURFACE-AT ?auto_3200 ?auto_3203 ) ( CLEAR ?auto_3200 ) ( LIFTING ?auto_3202 ?auto_3201 ) ( IS-CRATE ?auto_3201 ) ( not ( = ?auto_3200 ?auto_3201 ) ) )
    :subtasks
    ( ( !DROP ?auto_3202 ?auto_3201 ?auto_3200 ?auto_3203 )
      ( MAKE-1CRATE-VERIFY ?auto_3200 ?auto_3201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3204 - SURFACE
      ?auto_3205 - SURFACE
    )
    :vars
    (
      ?auto_3206 - HOIST
      ?auto_3207 - PLACE
      ?auto_3208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3206 ?auto_3207 ) ( SURFACE-AT ?auto_3204 ?auto_3207 ) ( CLEAR ?auto_3204 ) ( IS-CRATE ?auto_3205 ) ( not ( = ?auto_3204 ?auto_3205 ) ) ( TRUCK-AT ?auto_3208 ?auto_3207 ) ( AVAILABLE ?auto_3206 ) ( IN ?auto_3205 ?auto_3208 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3206 ?auto_3205 ?auto_3208 ?auto_3207 )
      ( MAKE-1CRATE ?auto_3204 ?auto_3205 )
      ( MAKE-1CRATE-VERIFY ?auto_3204 ?auto_3205 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
    )
    :vars
    (
      ?auto_3213 - HOIST
      ?auto_3212 - PLACE
      ?auto_3211 - TRUCK
      ?auto_3214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3213 ?auto_3212 ) ( SURFACE-AT ?auto_3209 ?auto_3212 ) ( CLEAR ?auto_3209 ) ( IS-CRATE ?auto_3210 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( AVAILABLE ?auto_3213 ) ( IN ?auto_3210 ?auto_3211 ) ( TRUCK-AT ?auto_3211 ?auto_3214 ) ( not ( = ?auto_3214 ?auto_3212 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3211 ?auto_3214 ?auto_3212 )
      ( MAKE-1CRATE ?auto_3209 ?auto_3210 )
      ( MAKE-1CRATE-VERIFY ?auto_3209 ?auto_3210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3215 - SURFACE
      ?auto_3216 - SURFACE
    )
    :vars
    (
      ?auto_3217 - HOIST
      ?auto_3219 - PLACE
      ?auto_3218 - TRUCK
      ?auto_3220 - PLACE
      ?auto_3221 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3217 ?auto_3219 ) ( SURFACE-AT ?auto_3215 ?auto_3219 ) ( CLEAR ?auto_3215 ) ( IS-CRATE ?auto_3216 ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( AVAILABLE ?auto_3217 ) ( TRUCK-AT ?auto_3218 ?auto_3220 ) ( not ( = ?auto_3220 ?auto_3219 ) ) ( HOIST-AT ?auto_3221 ?auto_3220 ) ( LIFTING ?auto_3221 ?auto_3216 ) ( not ( = ?auto_3217 ?auto_3221 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3221 ?auto_3216 ?auto_3218 ?auto_3220 )
      ( MAKE-1CRATE ?auto_3215 ?auto_3216 )
      ( MAKE-1CRATE-VERIFY ?auto_3215 ?auto_3216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3222 - SURFACE
      ?auto_3223 - SURFACE
    )
    :vars
    (
      ?auto_3225 - HOIST
      ?auto_3224 - PLACE
      ?auto_3227 - TRUCK
      ?auto_3226 - PLACE
      ?auto_3228 - HOIST
      ?auto_3229 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3225 ?auto_3224 ) ( SURFACE-AT ?auto_3222 ?auto_3224 ) ( CLEAR ?auto_3222 ) ( IS-CRATE ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( AVAILABLE ?auto_3225 ) ( TRUCK-AT ?auto_3227 ?auto_3226 ) ( not ( = ?auto_3226 ?auto_3224 ) ) ( HOIST-AT ?auto_3228 ?auto_3226 ) ( not ( = ?auto_3225 ?auto_3228 ) ) ( AVAILABLE ?auto_3228 ) ( SURFACE-AT ?auto_3223 ?auto_3226 ) ( ON ?auto_3223 ?auto_3229 ) ( CLEAR ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3229 ) ) ( not ( = ?auto_3223 ?auto_3229 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3228 ?auto_3223 ?auto_3229 ?auto_3226 )
      ( MAKE-1CRATE ?auto_3222 ?auto_3223 )
      ( MAKE-1CRATE-VERIFY ?auto_3222 ?auto_3223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3230 - SURFACE
      ?auto_3231 - SURFACE
    )
    :vars
    (
      ?auto_3233 - HOIST
      ?auto_3236 - PLACE
      ?auto_3235 - PLACE
      ?auto_3237 - HOIST
      ?auto_3234 - SURFACE
      ?auto_3232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3233 ?auto_3236 ) ( SURFACE-AT ?auto_3230 ?auto_3236 ) ( CLEAR ?auto_3230 ) ( IS-CRATE ?auto_3231 ) ( not ( = ?auto_3230 ?auto_3231 ) ) ( AVAILABLE ?auto_3233 ) ( not ( = ?auto_3235 ?auto_3236 ) ) ( HOIST-AT ?auto_3237 ?auto_3235 ) ( not ( = ?auto_3233 ?auto_3237 ) ) ( AVAILABLE ?auto_3237 ) ( SURFACE-AT ?auto_3231 ?auto_3235 ) ( ON ?auto_3231 ?auto_3234 ) ( CLEAR ?auto_3231 ) ( not ( = ?auto_3230 ?auto_3234 ) ) ( not ( = ?auto_3231 ?auto_3234 ) ) ( TRUCK-AT ?auto_3232 ?auto_3236 ) )
    :subtasks
    ( ( !DRIVE ?auto_3232 ?auto_3236 ?auto_3235 )
      ( MAKE-1CRATE ?auto_3230 ?auto_3231 )
      ( MAKE-1CRATE-VERIFY ?auto_3230 ?auto_3231 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3247 - SURFACE
      ?auto_3248 - SURFACE
      ?auto_3249 - SURFACE
    )
    :vars
    (
      ?auto_3250 - HOIST
      ?auto_3251 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3250 ?auto_3251 ) ( SURFACE-AT ?auto_3248 ?auto_3251 ) ( CLEAR ?auto_3248 ) ( LIFTING ?auto_3250 ?auto_3249 ) ( IS-CRATE ?auto_3249 ) ( not ( = ?auto_3248 ?auto_3249 ) ) ( ON ?auto_3248 ?auto_3247 ) ( not ( = ?auto_3247 ?auto_3248 ) ) ( not ( = ?auto_3247 ?auto_3249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3248 ?auto_3249 )
      ( MAKE-2CRATE-VERIFY ?auto_3247 ?auto_3248 ?auto_3249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3257 - SURFACE
      ?auto_3258 - SURFACE
      ?auto_3259 - SURFACE
    )
    :vars
    (
      ?auto_3261 - HOIST
      ?auto_3260 - PLACE
      ?auto_3262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3261 ?auto_3260 ) ( SURFACE-AT ?auto_3258 ?auto_3260 ) ( CLEAR ?auto_3258 ) ( IS-CRATE ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3259 ) ) ( TRUCK-AT ?auto_3262 ?auto_3260 ) ( AVAILABLE ?auto_3261 ) ( IN ?auto_3259 ?auto_3262 ) ( ON ?auto_3258 ?auto_3257 ) ( not ( = ?auto_3257 ?auto_3258 ) ) ( not ( = ?auto_3257 ?auto_3259 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3258 ?auto_3259 )
      ( MAKE-2CRATE-VERIFY ?auto_3257 ?auto_3258 ?auto_3259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3263 - SURFACE
      ?auto_3264 - SURFACE
    )
    :vars
    (
      ?auto_3268 - HOIST
      ?auto_3267 - PLACE
      ?auto_3265 - TRUCK
      ?auto_3266 - SURFACE
      ?auto_3269 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3268 ?auto_3267 ) ( SURFACE-AT ?auto_3263 ?auto_3267 ) ( CLEAR ?auto_3263 ) ( IS-CRATE ?auto_3264 ) ( not ( = ?auto_3263 ?auto_3264 ) ) ( AVAILABLE ?auto_3268 ) ( IN ?auto_3264 ?auto_3265 ) ( ON ?auto_3263 ?auto_3266 ) ( not ( = ?auto_3266 ?auto_3263 ) ) ( not ( = ?auto_3266 ?auto_3264 ) ) ( TRUCK-AT ?auto_3265 ?auto_3269 ) ( not ( = ?auto_3269 ?auto_3267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3265 ?auto_3269 ?auto_3267 )
      ( MAKE-2CRATE ?auto_3266 ?auto_3263 ?auto_3264 )
      ( MAKE-1CRATE-VERIFY ?auto_3263 ?auto_3264 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3270 - SURFACE
      ?auto_3271 - SURFACE
      ?auto_3272 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3275 - PLACE
      ?auto_3273 - TRUCK
      ?auto_3276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3275 ) ( SURFACE-AT ?auto_3271 ?auto_3275 ) ( CLEAR ?auto_3271 ) ( IS-CRATE ?auto_3272 ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( AVAILABLE ?auto_3274 ) ( IN ?auto_3272 ?auto_3273 ) ( ON ?auto_3271 ?auto_3270 ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( not ( = ?auto_3270 ?auto_3272 ) ) ( TRUCK-AT ?auto_3273 ?auto_3276 ) ( not ( = ?auto_3276 ?auto_3275 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3271 ?auto_3272 )
      ( MAKE-2CRATE-VERIFY ?auto_3270 ?auto_3271 ?auto_3272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3277 - SURFACE
      ?auto_3278 - SURFACE
    )
    :vars
    (
      ?auto_3282 - HOIST
      ?auto_3281 - PLACE
      ?auto_3279 - SURFACE
      ?auto_3280 - TRUCK
      ?auto_3283 - PLACE
      ?auto_3284 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3282 ?auto_3281 ) ( SURFACE-AT ?auto_3277 ?auto_3281 ) ( CLEAR ?auto_3277 ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( AVAILABLE ?auto_3282 ) ( ON ?auto_3277 ?auto_3279 ) ( not ( = ?auto_3279 ?auto_3277 ) ) ( not ( = ?auto_3279 ?auto_3278 ) ) ( TRUCK-AT ?auto_3280 ?auto_3283 ) ( not ( = ?auto_3283 ?auto_3281 ) ) ( HOIST-AT ?auto_3284 ?auto_3283 ) ( LIFTING ?auto_3284 ?auto_3278 ) ( not ( = ?auto_3282 ?auto_3284 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3284 ?auto_3278 ?auto_3280 ?auto_3283 )
      ( MAKE-2CRATE ?auto_3279 ?auto_3277 ?auto_3278 )
      ( MAKE-1CRATE-VERIFY ?auto_3277 ?auto_3278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3285 - SURFACE
      ?auto_3286 - SURFACE
      ?auto_3287 - SURFACE
    )
    :vars
    (
      ?auto_3292 - HOIST
      ?auto_3291 - PLACE
      ?auto_3289 - TRUCK
      ?auto_3290 - PLACE
      ?auto_3288 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3292 ?auto_3291 ) ( SURFACE-AT ?auto_3286 ?auto_3291 ) ( CLEAR ?auto_3286 ) ( IS-CRATE ?auto_3287 ) ( not ( = ?auto_3286 ?auto_3287 ) ) ( AVAILABLE ?auto_3292 ) ( ON ?auto_3286 ?auto_3285 ) ( not ( = ?auto_3285 ?auto_3286 ) ) ( not ( = ?auto_3285 ?auto_3287 ) ) ( TRUCK-AT ?auto_3289 ?auto_3290 ) ( not ( = ?auto_3290 ?auto_3291 ) ) ( HOIST-AT ?auto_3288 ?auto_3290 ) ( LIFTING ?auto_3288 ?auto_3287 ) ( not ( = ?auto_3292 ?auto_3288 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3286 ?auto_3287 )
      ( MAKE-2CRATE-VERIFY ?auto_3285 ?auto_3286 ?auto_3287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3293 - SURFACE
      ?auto_3294 - SURFACE
    )
    :vars
    (
      ?auto_3300 - HOIST
      ?auto_3295 - PLACE
      ?auto_3296 - SURFACE
      ?auto_3299 - TRUCK
      ?auto_3297 - PLACE
      ?auto_3298 - HOIST
      ?auto_3301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3300 ?auto_3295 ) ( SURFACE-AT ?auto_3293 ?auto_3295 ) ( CLEAR ?auto_3293 ) ( IS-CRATE ?auto_3294 ) ( not ( = ?auto_3293 ?auto_3294 ) ) ( AVAILABLE ?auto_3300 ) ( ON ?auto_3293 ?auto_3296 ) ( not ( = ?auto_3296 ?auto_3293 ) ) ( not ( = ?auto_3296 ?auto_3294 ) ) ( TRUCK-AT ?auto_3299 ?auto_3297 ) ( not ( = ?auto_3297 ?auto_3295 ) ) ( HOIST-AT ?auto_3298 ?auto_3297 ) ( not ( = ?auto_3300 ?auto_3298 ) ) ( AVAILABLE ?auto_3298 ) ( SURFACE-AT ?auto_3294 ?auto_3297 ) ( ON ?auto_3294 ?auto_3301 ) ( CLEAR ?auto_3294 ) ( not ( = ?auto_3293 ?auto_3301 ) ) ( not ( = ?auto_3294 ?auto_3301 ) ) ( not ( = ?auto_3296 ?auto_3301 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3298 ?auto_3294 ?auto_3301 ?auto_3297 )
      ( MAKE-2CRATE ?auto_3296 ?auto_3293 ?auto_3294 )
      ( MAKE-1CRATE-VERIFY ?auto_3293 ?auto_3294 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3302 - SURFACE
      ?auto_3303 - SURFACE
      ?auto_3304 - SURFACE
    )
    :vars
    (
      ?auto_3305 - HOIST
      ?auto_3307 - PLACE
      ?auto_3306 - TRUCK
      ?auto_3308 - PLACE
      ?auto_3310 - HOIST
      ?auto_3309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3305 ?auto_3307 ) ( SURFACE-AT ?auto_3303 ?auto_3307 ) ( CLEAR ?auto_3303 ) ( IS-CRATE ?auto_3304 ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( AVAILABLE ?auto_3305 ) ( ON ?auto_3303 ?auto_3302 ) ( not ( = ?auto_3302 ?auto_3303 ) ) ( not ( = ?auto_3302 ?auto_3304 ) ) ( TRUCK-AT ?auto_3306 ?auto_3308 ) ( not ( = ?auto_3308 ?auto_3307 ) ) ( HOIST-AT ?auto_3310 ?auto_3308 ) ( not ( = ?auto_3305 ?auto_3310 ) ) ( AVAILABLE ?auto_3310 ) ( SURFACE-AT ?auto_3304 ?auto_3308 ) ( ON ?auto_3304 ?auto_3309 ) ( CLEAR ?auto_3304 ) ( not ( = ?auto_3303 ?auto_3309 ) ) ( not ( = ?auto_3304 ?auto_3309 ) ) ( not ( = ?auto_3302 ?auto_3309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3303 ?auto_3304 )
      ( MAKE-2CRATE-VERIFY ?auto_3302 ?auto_3303 ?auto_3304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3311 - SURFACE
      ?auto_3312 - SURFACE
    )
    :vars
    (
      ?auto_3316 - HOIST
      ?auto_3319 - PLACE
      ?auto_3313 - SURFACE
      ?auto_3315 - PLACE
      ?auto_3317 - HOIST
      ?auto_3314 - SURFACE
      ?auto_3318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3316 ?auto_3319 ) ( SURFACE-AT ?auto_3311 ?auto_3319 ) ( CLEAR ?auto_3311 ) ( IS-CRATE ?auto_3312 ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( AVAILABLE ?auto_3316 ) ( ON ?auto_3311 ?auto_3313 ) ( not ( = ?auto_3313 ?auto_3311 ) ) ( not ( = ?auto_3313 ?auto_3312 ) ) ( not ( = ?auto_3315 ?auto_3319 ) ) ( HOIST-AT ?auto_3317 ?auto_3315 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( AVAILABLE ?auto_3317 ) ( SURFACE-AT ?auto_3312 ?auto_3315 ) ( ON ?auto_3312 ?auto_3314 ) ( CLEAR ?auto_3312 ) ( not ( = ?auto_3311 ?auto_3314 ) ) ( not ( = ?auto_3312 ?auto_3314 ) ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( TRUCK-AT ?auto_3318 ?auto_3319 ) )
    :subtasks
    ( ( !DRIVE ?auto_3318 ?auto_3319 ?auto_3315 )
      ( MAKE-2CRATE ?auto_3313 ?auto_3311 ?auto_3312 )
      ( MAKE-1CRATE-VERIFY ?auto_3311 ?auto_3312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3320 - SURFACE
      ?auto_3321 - SURFACE
      ?auto_3322 - SURFACE
    )
    :vars
    (
      ?auto_3323 - HOIST
      ?auto_3328 - PLACE
      ?auto_3325 - PLACE
      ?auto_3324 - HOIST
      ?auto_3327 - SURFACE
      ?auto_3326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3323 ?auto_3328 ) ( SURFACE-AT ?auto_3321 ?auto_3328 ) ( CLEAR ?auto_3321 ) ( IS-CRATE ?auto_3322 ) ( not ( = ?auto_3321 ?auto_3322 ) ) ( AVAILABLE ?auto_3323 ) ( ON ?auto_3321 ?auto_3320 ) ( not ( = ?auto_3320 ?auto_3321 ) ) ( not ( = ?auto_3320 ?auto_3322 ) ) ( not ( = ?auto_3325 ?auto_3328 ) ) ( HOIST-AT ?auto_3324 ?auto_3325 ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( AVAILABLE ?auto_3324 ) ( SURFACE-AT ?auto_3322 ?auto_3325 ) ( ON ?auto_3322 ?auto_3327 ) ( CLEAR ?auto_3322 ) ( not ( = ?auto_3321 ?auto_3327 ) ) ( not ( = ?auto_3322 ?auto_3327 ) ) ( not ( = ?auto_3320 ?auto_3327 ) ) ( TRUCK-AT ?auto_3326 ?auto_3328 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3321 ?auto_3322 )
      ( MAKE-2CRATE-VERIFY ?auto_3320 ?auto_3321 ?auto_3322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3329 - SURFACE
      ?auto_3330 - SURFACE
    )
    :vars
    (
      ?auto_3331 - HOIST
      ?auto_3336 - PLACE
      ?auto_3332 - SURFACE
      ?auto_3333 - PLACE
      ?auto_3337 - HOIST
      ?auto_3334 - SURFACE
      ?auto_3335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3331 ?auto_3336 ) ( IS-CRATE ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( not ( = ?auto_3332 ?auto_3329 ) ) ( not ( = ?auto_3332 ?auto_3330 ) ) ( not ( = ?auto_3333 ?auto_3336 ) ) ( HOIST-AT ?auto_3337 ?auto_3333 ) ( not ( = ?auto_3331 ?auto_3337 ) ) ( AVAILABLE ?auto_3337 ) ( SURFACE-AT ?auto_3330 ?auto_3333 ) ( ON ?auto_3330 ?auto_3334 ) ( CLEAR ?auto_3330 ) ( not ( = ?auto_3329 ?auto_3334 ) ) ( not ( = ?auto_3330 ?auto_3334 ) ) ( not ( = ?auto_3332 ?auto_3334 ) ) ( TRUCK-AT ?auto_3335 ?auto_3336 ) ( SURFACE-AT ?auto_3332 ?auto_3336 ) ( CLEAR ?auto_3332 ) ( LIFTING ?auto_3331 ?auto_3329 ) ( IS-CRATE ?auto_3329 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3332 ?auto_3329 )
      ( MAKE-2CRATE ?auto_3332 ?auto_3329 ?auto_3330 )
      ( MAKE-1CRATE-VERIFY ?auto_3329 ?auto_3330 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3338 - SURFACE
      ?auto_3339 - SURFACE
      ?auto_3340 - SURFACE
    )
    :vars
    (
      ?auto_3341 - HOIST
      ?auto_3345 - PLACE
      ?auto_3343 - PLACE
      ?auto_3342 - HOIST
      ?auto_3344 - SURFACE
      ?auto_3346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3341 ?auto_3345 ) ( IS-CRATE ?auto_3340 ) ( not ( = ?auto_3339 ?auto_3340 ) ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( not ( = ?auto_3343 ?auto_3345 ) ) ( HOIST-AT ?auto_3342 ?auto_3343 ) ( not ( = ?auto_3341 ?auto_3342 ) ) ( AVAILABLE ?auto_3342 ) ( SURFACE-AT ?auto_3340 ?auto_3343 ) ( ON ?auto_3340 ?auto_3344 ) ( CLEAR ?auto_3340 ) ( not ( = ?auto_3339 ?auto_3344 ) ) ( not ( = ?auto_3340 ?auto_3344 ) ) ( not ( = ?auto_3338 ?auto_3344 ) ) ( TRUCK-AT ?auto_3346 ?auto_3345 ) ( SURFACE-AT ?auto_3338 ?auto_3345 ) ( CLEAR ?auto_3338 ) ( LIFTING ?auto_3341 ?auto_3339 ) ( IS-CRATE ?auto_3339 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3339 ?auto_3340 )
      ( MAKE-2CRATE-VERIFY ?auto_3338 ?auto_3339 ?auto_3340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3347 - SURFACE
      ?auto_3348 - SURFACE
    )
    :vars
    (
      ?auto_3353 - HOIST
      ?auto_3351 - PLACE
      ?auto_3355 - SURFACE
      ?auto_3349 - PLACE
      ?auto_3354 - HOIST
      ?auto_3350 - SURFACE
      ?auto_3352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3353 ?auto_3351 ) ( IS-CRATE ?auto_3348 ) ( not ( = ?auto_3347 ?auto_3348 ) ) ( not ( = ?auto_3355 ?auto_3347 ) ) ( not ( = ?auto_3355 ?auto_3348 ) ) ( not ( = ?auto_3349 ?auto_3351 ) ) ( HOIST-AT ?auto_3354 ?auto_3349 ) ( not ( = ?auto_3353 ?auto_3354 ) ) ( AVAILABLE ?auto_3354 ) ( SURFACE-AT ?auto_3348 ?auto_3349 ) ( ON ?auto_3348 ?auto_3350 ) ( CLEAR ?auto_3348 ) ( not ( = ?auto_3347 ?auto_3350 ) ) ( not ( = ?auto_3348 ?auto_3350 ) ) ( not ( = ?auto_3355 ?auto_3350 ) ) ( TRUCK-AT ?auto_3352 ?auto_3351 ) ( SURFACE-AT ?auto_3355 ?auto_3351 ) ( CLEAR ?auto_3355 ) ( IS-CRATE ?auto_3347 ) ( AVAILABLE ?auto_3353 ) ( IN ?auto_3347 ?auto_3352 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3353 ?auto_3347 ?auto_3352 ?auto_3351 )
      ( MAKE-2CRATE ?auto_3355 ?auto_3347 ?auto_3348 )
      ( MAKE-1CRATE-VERIFY ?auto_3347 ?auto_3348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3356 - SURFACE
      ?auto_3357 - SURFACE
      ?auto_3358 - SURFACE
    )
    :vars
    (
      ?auto_3362 - HOIST
      ?auto_3359 - PLACE
      ?auto_3360 - PLACE
      ?auto_3361 - HOIST
      ?auto_3364 - SURFACE
      ?auto_3363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3362 ?auto_3359 ) ( IS-CRATE ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( not ( = ?auto_3360 ?auto_3359 ) ) ( HOIST-AT ?auto_3361 ?auto_3360 ) ( not ( = ?auto_3362 ?auto_3361 ) ) ( AVAILABLE ?auto_3361 ) ( SURFACE-AT ?auto_3358 ?auto_3360 ) ( ON ?auto_3358 ?auto_3364 ) ( CLEAR ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3364 ) ) ( not ( = ?auto_3358 ?auto_3364 ) ) ( not ( = ?auto_3356 ?auto_3364 ) ) ( TRUCK-AT ?auto_3363 ?auto_3359 ) ( SURFACE-AT ?auto_3356 ?auto_3359 ) ( CLEAR ?auto_3356 ) ( IS-CRATE ?auto_3357 ) ( AVAILABLE ?auto_3362 ) ( IN ?auto_3357 ?auto_3363 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3357 ?auto_3358 )
      ( MAKE-2CRATE-VERIFY ?auto_3356 ?auto_3357 ?auto_3358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3365 - SURFACE
      ?auto_3366 - SURFACE
    )
    :vars
    (
      ?auto_3367 - HOIST
      ?auto_3370 - PLACE
      ?auto_3371 - SURFACE
      ?auto_3372 - PLACE
      ?auto_3368 - HOIST
      ?auto_3369 - SURFACE
      ?auto_3373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3367 ?auto_3370 ) ( IS-CRATE ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( not ( = ?auto_3371 ?auto_3365 ) ) ( not ( = ?auto_3371 ?auto_3366 ) ) ( not ( = ?auto_3372 ?auto_3370 ) ) ( HOIST-AT ?auto_3368 ?auto_3372 ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( AVAILABLE ?auto_3368 ) ( SURFACE-AT ?auto_3366 ?auto_3372 ) ( ON ?auto_3366 ?auto_3369 ) ( CLEAR ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3369 ) ) ( not ( = ?auto_3366 ?auto_3369 ) ) ( not ( = ?auto_3371 ?auto_3369 ) ) ( SURFACE-AT ?auto_3371 ?auto_3370 ) ( CLEAR ?auto_3371 ) ( IS-CRATE ?auto_3365 ) ( AVAILABLE ?auto_3367 ) ( IN ?auto_3365 ?auto_3373 ) ( TRUCK-AT ?auto_3373 ?auto_3372 ) )
    :subtasks
    ( ( !DRIVE ?auto_3373 ?auto_3372 ?auto_3370 )
      ( MAKE-2CRATE ?auto_3371 ?auto_3365 ?auto_3366 )
      ( MAKE-1CRATE-VERIFY ?auto_3365 ?auto_3366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3374 - SURFACE
      ?auto_3375 - SURFACE
      ?auto_3376 - SURFACE
    )
    :vars
    (
      ?auto_3380 - HOIST
      ?auto_3377 - PLACE
      ?auto_3382 - PLACE
      ?auto_3379 - HOIST
      ?auto_3378 - SURFACE
      ?auto_3381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3380 ?auto_3377 ) ( IS-CRATE ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3382 ?auto_3377 ) ) ( HOIST-AT ?auto_3379 ?auto_3382 ) ( not ( = ?auto_3380 ?auto_3379 ) ) ( AVAILABLE ?auto_3379 ) ( SURFACE-AT ?auto_3376 ?auto_3382 ) ( ON ?auto_3376 ?auto_3378 ) ( CLEAR ?auto_3376 ) ( not ( = ?auto_3375 ?auto_3378 ) ) ( not ( = ?auto_3376 ?auto_3378 ) ) ( not ( = ?auto_3374 ?auto_3378 ) ) ( SURFACE-AT ?auto_3374 ?auto_3377 ) ( CLEAR ?auto_3374 ) ( IS-CRATE ?auto_3375 ) ( AVAILABLE ?auto_3380 ) ( IN ?auto_3375 ?auto_3381 ) ( TRUCK-AT ?auto_3381 ?auto_3382 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3375 ?auto_3376 )
      ( MAKE-2CRATE-VERIFY ?auto_3374 ?auto_3375 ?auto_3376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3383 - SURFACE
      ?auto_3384 - SURFACE
    )
    :vars
    (
      ?auto_3389 - HOIST
      ?auto_3386 - PLACE
      ?auto_3385 - SURFACE
      ?auto_3391 - PLACE
      ?auto_3388 - HOIST
      ?auto_3390 - SURFACE
      ?auto_3387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3389 ?auto_3386 ) ( IS-CRATE ?auto_3384 ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3385 ?auto_3383 ) ) ( not ( = ?auto_3385 ?auto_3384 ) ) ( not ( = ?auto_3391 ?auto_3386 ) ) ( HOIST-AT ?auto_3388 ?auto_3391 ) ( not ( = ?auto_3389 ?auto_3388 ) ) ( SURFACE-AT ?auto_3384 ?auto_3391 ) ( ON ?auto_3384 ?auto_3390 ) ( CLEAR ?auto_3384 ) ( not ( = ?auto_3383 ?auto_3390 ) ) ( not ( = ?auto_3384 ?auto_3390 ) ) ( not ( = ?auto_3385 ?auto_3390 ) ) ( SURFACE-AT ?auto_3385 ?auto_3386 ) ( CLEAR ?auto_3385 ) ( IS-CRATE ?auto_3383 ) ( AVAILABLE ?auto_3389 ) ( TRUCK-AT ?auto_3387 ?auto_3391 ) ( LIFTING ?auto_3388 ?auto_3383 ) )
    :subtasks
    ( ( !LOAD ?auto_3388 ?auto_3383 ?auto_3387 ?auto_3391 )
      ( MAKE-2CRATE ?auto_3385 ?auto_3383 ?auto_3384 )
      ( MAKE-1CRATE-VERIFY ?auto_3383 ?auto_3384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3392 - SURFACE
      ?auto_3393 - SURFACE
      ?auto_3394 - SURFACE
    )
    :vars
    (
      ?auto_3397 - HOIST
      ?auto_3399 - PLACE
      ?auto_3400 - PLACE
      ?auto_3395 - HOIST
      ?auto_3398 - SURFACE
      ?auto_3396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3397 ?auto_3399 ) ( IS-CRATE ?auto_3394 ) ( not ( = ?auto_3393 ?auto_3394 ) ) ( not ( = ?auto_3392 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3394 ) ) ( not ( = ?auto_3400 ?auto_3399 ) ) ( HOIST-AT ?auto_3395 ?auto_3400 ) ( not ( = ?auto_3397 ?auto_3395 ) ) ( SURFACE-AT ?auto_3394 ?auto_3400 ) ( ON ?auto_3394 ?auto_3398 ) ( CLEAR ?auto_3394 ) ( not ( = ?auto_3393 ?auto_3398 ) ) ( not ( = ?auto_3394 ?auto_3398 ) ) ( not ( = ?auto_3392 ?auto_3398 ) ) ( SURFACE-AT ?auto_3392 ?auto_3399 ) ( CLEAR ?auto_3392 ) ( IS-CRATE ?auto_3393 ) ( AVAILABLE ?auto_3397 ) ( TRUCK-AT ?auto_3396 ?auto_3400 ) ( LIFTING ?auto_3395 ?auto_3393 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3393 ?auto_3394 )
      ( MAKE-2CRATE-VERIFY ?auto_3392 ?auto_3393 ?auto_3394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3401 - SURFACE
      ?auto_3402 - SURFACE
    )
    :vars
    (
      ?auto_3406 - HOIST
      ?auto_3407 - PLACE
      ?auto_3408 - SURFACE
      ?auto_3404 - PLACE
      ?auto_3409 - HOIST
      ?auto_3403 - SURFACE
      ?auto_3405 - TRUCK
      ?auto_3410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3406 ?auto_3407 ) ( IS-CRATE ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3402 ) ) ( not ( = ?auto_3408 ?auto_3401 ) ) ( not ( = ?auto_3408 ?auto_3402 ) ) ( not ( = ?auto_3404 ?auto_3407 ) ) ( HOIST-AT ?auto_3409 ?auto_3404 ) ( not ( = ?auto_3406 ?auto_3409 ) ) ( SURFACE-AT ?auto_3402 ?auto_3404 ) ( ON ?auto_3402 ?auto_3403 ) ( CLEAR ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3403 ) ) ( not ( = ?auto_3402 ?auto_3403 ) ) ( not ( = ?auto_3408 ?auto_3403 ) ) ( SURFACE-AT ?auto_3408 ?auto_3407 ) ( CLEAR ?auto_3408 ) ( IS-CRATE ?auto_3401 ) ( AVAILABLE ?auto_3406 ) ( TRUCK-AT ?auto_3405 ?auto_3404 ) ( AVAILABLE ?auto_3409 ) ( SURFACE-AT ?auto_3401 ?auto_3404 ) ( ON ?auto_3401 ?auto_3410 ) ( CLEAR ?auto_3401 ) ( not ( = ?auto_3401 ?auto_3410 ) ) ( not ( = ?auto_3402 ?auto_3410 ) ) ( not ( = ?auto_3408 ?auto_3410 ) ) ( not ( = ?auto_3403 ?auto_3410 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3409 ?auto_3401 ?auto_3410 ?auto_3404 )
      ( MAKE-2CRATE ?auto_3408 ?auto_3401 ?auto_3402 )
      ( MAKE-1CRATE-VERIFY ?auto_3401 ?auto_3402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3411 - SURFACE
      ?auto_3412 - SURFACE
      ?auto_3413 - SURFACE
    )
    :vars
    (
      ?auto_3414 - HOIST
      ?auto_3419 - PLACE
      ?auto_3415 - PLACE
      ?auto_3420 - HOIST
      ?auto_3417 - SURFACE
      ?auto_3418 - TRUCK
      ?auto_3416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3414 ?auto_3419 ) ( IS-CRATE ?auto_3413 ) ( not ( = ?auto_3412 ?auto_3413 ) ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( not ( = ?auto_3411 ?auto_3413 ) ) ( not ( = ?auto_3415 ?auto_3419 ) ) ( HOIST-AT ?auto_3420 ?auto_3415 ) ( not ( = ?auto_3414 ?auto_3420 ) ) ( SURFACE-AT ?auto_3413 ?auto_3415 ) ( ON ?auto_3413 ?auto_3417 ) ( CLEAR ?auto_3413 ) ( not ( = ?auto_3412 ?auto_3417 ) ) ( not ( = ?auto_3413 ?auto_3417 ) ) ( not ( = ?auto_3411 ?auto_3417 ) ) ( SURFACE-AT ?auto_3411 ?auto_3419 ) ( CLEAR ?auto_3411 ) ( IS-CRATE ?auto_3412 ) ( AVAILABLE ?auto_3414 ) ( TRUCK-AT ?auto_3418 ?auto_3415 ) ( AVAILABLE ?auto_3420 ) ( SURFACE-AT ?auto_3412 ?auto_3415 ) ( ON ?auto_3412 ?auto_3416 ) ( CLEAR ?auto_3412 ) ( not ( = ?auto_3412 ?auto_3416 ) ) ( not ( = ?auto_3413 ?auto_3416 ) ) ( not ( = ?auto_3411 ?auto_3416 ) ) ( not ( = ?auto_3417 ?auto_3416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3412 ?auto_3413 )
      ( MAKE-2CRATE-VERIFY ?auto_3411 ?auto_3412 ?auto_3413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3421 - SURFACE
      ?auto_3422 - SURFACE
    )
    :vars
    (
      ?auto_3424 - HOIST
      ?auto_3423 - PLACE
      ?auto_3428 - SURFACE
      ?auto_3427 - PLACE
      ?auto_3429 - HOIST
      ?auto_3426 - SURFACE
      ?auto_3425 - SURFACE
      ?auto_3430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3424 ?auto_3423 ) ( IS-CRATE ?auto_3422 ) ( not ( = ?auto_3421 ?auto_3422 ) ) ( not ( = ?auto_3428 ?auto_3421 ) ) ( not ( = ?auto_3428 ?auto_3422 ) ) ( not ( = ?auto_3427 ?auto_3423 ) ) ( HOIST-AT ?auto_3429 ?auto_3427 ) ( not ( = ?auto_3424 ?auto_3429 ) ) ( SURFACE-AT ?auto_3422 ?auto_3427 ) ( ON ?auto_3422 ?auto_3426 ) ( CLEAR ?auto_3422 ) ( not ( = ?auto_3421 ?auto_3426 ) ) ( not ( = ?auto_3422 ?auto_3426 ) ) ( not ( = ?auto_3428 ?auto_3426 ) ) ( SURFACE-AT ?auto_3428 ?auto_3423 ) ( CLEAR ?auto_3428 ) ( IS-CRATE ?auto_3421 ) ( AVAILABLE ?auto_3424 ) ( AVAILABLE ?auto_3429 ) ( SURFACE-AT ?auto_3421 ?auto_3427 ) ( ON ?auto_3421 ?auto_3425 ) ( CLEAR ?auto_3421 ) ( not ( = ?auto_3421 ?auto_3425 ) ) ( not ( = ?auto_3422 ?auto_3425 ) ) ( not ( = ?auto_3428 ?auto_3425 ) ) ( not ( = ?auto_3426 ?auto_3425 ) ) ( TRUCK-AT ?auto_3430 ?auto_3423 ) )
    :subtasks
    ( ( !DRIVE ?auto_3430 ?auto_3423 ?auto_3427 )
      ( MAKE-2CRATE ?auto_3428 ?auto_3421 ?auto_3422 )
      ( MAKE-1CRATE-VERIFY ?auto_3421 ?auto_3422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3431 - SURFACE
      ?auto_3432 - SURFACE
      ?auto_3433 - SURFACE
    )
    :vars
    (
      ?auto_3434 - HOIST
      ?auto_3436 - PLACE
      ?auto_3440 - PLACE
      ?auto_3438 - HOIST
      ?auto_3437 - SURFACE
      ?auto_3435 - SURFACE
      ?auto_3439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3434 ?auto_3436 ) ( IS-CRATE ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( not ( = ?auto_3440 ?auto_3436 ) ) ( HOIST-AT ?auto_3438 ?auto_3440 ) ( not ( = ?auto_3434 ?auto_3438 ) ) ( SURFACE-AT ?auto_3433 ?auto_3440 ) ( ON ?auto_3433 ?auto_3437 ) ( CLEAR ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3437 ) ) ( not ( = ?auto_3433 ?auto_3437 ) ) ( not ( = ?auto_3431 ?auto_3437 ) ) ( SURFACE-AT ?auto_3431 ?auto_3436 ) ( CLEAR ?auto_3431 ) ( IS-CRATE ?auto_3432 ) ( AVAILABLE ?auto_3434 ) ( AVAILABLE ?auto_3438 ) ( SURFACE-AT ?auto_3432 ?auto_3440 ) ( ON ?auto_3432 ?auto_3435 ) ( CLEAR ?auto_3432 ) ( not ( = ?auto_3432 ?auto_3435 ) ) ( not ( = ?auto_3433 ?auto_3435 ) ) ( not ( = ?auto_3431 ?auto_3435 ) ) ( not ( = ?auto_3437 ?auto_3435 ) ) ( TRUCK-AT ?auto_3439 ?auto_3436 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3432 ?auto_3433 )
      ( MAKE-2CRATE-VERIFY ?auto_3431 ?auto_3432 ?auto_3433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3460 - SURFACE
      ?auto_3461 - SURFACE
      ?auto_3462 - SURFACE
      ?auto_3459 - SURFACE
    )
    :vars
    (
      ?auto_3463 - HOIST
      ?auto_3464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3463 ?auto_3464 ) ( SURFACE-AT ?auto_3462 ?auto_3464 ) ( CLEAR ?auto_3462 ) ( LIFTING ?auto_3463 ?auto_3459 ) ( IS-CRATE ?auto_3459 ) ( not ( = ?auto_3462 ?auto_3459 ) ) ( ON ?auto_3461 ?auto_3460 ) ( ON ?auto_3462 ?auto_3461 ) ( not ( = ?auto_3460 ?auto_3461 ) ) ( not ( = ?auto_3460 ?auto_3462 ) ) ( not ( = ?auto_3460 ?auto_3459 ) ) ( not ( = ?auto_3461 ?auto_3462 ) ) ( not ( = ?auto_3461 ?auto_3459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3462 ?auto_3459 )
      ( MAKE-3CRATE-VERIFY ?auto_3460 ?auto_3461 ?auto_3462 ?auto_3459 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3477 - SURFACE
      ?auto_3478 - SURFACE
      ?auto_3479 - SURFACE
      ?auto_3476 - SURFACE
    )
    :vars
    (
      ?auto_3482 - HOIST
      ?auto_3481 - PLACE
      ?auto_3480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3482 ?auto_3481 ) ( SURFACE-AT ?auto_3479 ?auto_3481 ) ( CLEAR ?auto_3479 ) ( IS-CRATE ?auto_3476 ) ( not ( = ?auto_3479 ?auto_3476 ) ) ( TRUCK-AT ?auto_3480 ?auto_3481 ) ( AVAILABLE ?auto_3482 ) ( IN ?auto_3476 ?auto_3480 ) ( ON ?auto_3479 ?auto_3478 ) ( not ( = ?auto_3478 ?auto_3479 ) ) ( not ( = ?auto_3478 ?auto_3476 ) ) ( ON ?auto_3478 ?auto_3477 ) ( not ( = ?auto_3477 ?auto_3478 ) ) ( not ( = ?auto_3477 ?auto_3479 ) ) ( not ( = ?auto_3477 ?auto_3476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3478 ?auto_3479 ?auto_3476 )
      ( MAKE-3CRATE-VERIFY ?auto_3477 ?auto_3478 ?auto_3479 ?auto_3476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3498 - SURFACE
      ?auto_3499 - SURFACE
      ?auto_3500 - SURFACE
      ?auto_3497 - SURFACE
    )
    :vars
    (
      ?auto_3504 - HOIST
      ?auto_3501 - PLACE
      ?auto_3502 - TRUCK
      ?auto_3503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3504 ?auto_3501 ) ( SURFACE-AT ?auto_3500 ?auto_3501 ) ( CLEAR ?auto_3500 ) ( IS-CRATE ?auto_3497 ) ( not ( = ?auto_3500 ?auto_3497 ) ) ( AVAILABLE ?auto_3504 ) ( IN ?auto_3497 ?auto_3502 ) ( ON ?auto_3500 ?auto_3499 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3497 ) ) ( TRUCK-AT ?auto_3502 ?auto_3503 ) ( not ( = ?auto_3503 ?auto_3501 ) ) ( ON ?auto_3499 ?auto_3498 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( not ( = ?auto_3498 ?auto_3497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3499 ?auto_3500 ?auto_3497 )
      ( MAKE-3CRATE-VERIFY ?auto_3498 ?auto_3499 ?auto_3500 ?auto_3497 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3522 - SURFACE
      ?auto_3523 - SURFACE
      ?auto_3524 - SURFACE
      ?auto_3521 - SURFACE
    )
    :vars
    (
      ?auto_3525 - HOIST
      ?auto_3527 - PLACE
      ?auto_3529 - TRUCK
      ?auto_3526 - PLACE
      ?auto_3528 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3525 ?auto_3527 ) ( SURFACE-AT ?auto_3524 ?auto_3527 ) ( CLEAR ?auto_3524 ) ( IS-CRATE ?auto_3521 ) ( not ( = ?auto_3524 ?auto_3521 ) ) ( AVAILABLE ?auto_3525 ) ( ON ?auto_3524 ?auto_3523 ) ( not ( = ?auto_3523 ?auto_3524 ) ) ( not ( = ?auto_3523 ?auto_3521 ) ) ( TRUCK-AT ?auto_3529 ?auto_3526 ) ( not ( = ?auto_3526 ?auto_3527 ) ) ( HOIST-AT ?auto_3528 ?auto_3526 ) ( LIFTING ?auto_3528 ?auto_3521 ) ( not ( = ?auto_3525 ?auto_3528 ) ) ( ON ?auto_3523 ?auto_3522 ) ( not ( = ?auto_3522 ?auto_3523 ) ) ( not ( = ?auto_3522 ?auto_3524 ) ) ( not ( = ?auto_3522 ?auto_3521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3523 ?auto_3524 ?auto_3521 )
      ( MAKE-3CRATE-VERIFY ?auto_3522 ?auto_3523 ?auto_3524 ?auto_3521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3549 - SURFACE
      ?auto_3550 - SURFACE
      ?auto_3551 - SURFACE
      ?auto_3548 - SURFACE
    )
    :vars
    (
      ?auto_3553 - HOIST
      ?auto_3554 - PLACE
      ?auto_3552 - TRUCK
      ?auto_3555 - PLACE
      ?auto_3556 - HOIST
      ?auto_3557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3553 ?auto_3554 ) ( SURFACE-AT ?auto_3551 ?auto_3554 ) ( CLEAR ?auto_3551 ) ( IS-CRATE ?auto_3548 ) ( not ( = ?auto_3551 ?auto_3548 ) ) ( AVAILABLE ?auto_3553 ) ( ON ?auto_3551 ?auto_3550 ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( not ( = ?auto_3550 ?auto_3548 ) ) ( TRUCK-AT ?auto_3552 ?auto_3555 ) ( not ( = ?auto_3555 ?auto_3554 ) ) ( HOIST-AT ?auto_3556 ?auto_3555 ) ( not ( = ?auto_3553 ?auto_3556 ) ) ( AVAILABLE ?auto_3556 ) ( SURFACE-AT ?auto_3548 ?auto_3555 ) ( ON ?auto_3548 ?auto_3557 ) ( CLEAR ?auto_3548 ) ( not ( = ?auto_3551 ?auto_3557 ) ) ( not ( = ?auto_3548 ?auto_3557 ) ) ( not ( = ?auto_3550 ?auto_3557 ) ) ( ON ?auto_3550 ?auto_3549 ) ( not ( = ?auto_3549 ?auto_3550 ) ) ( not ( = ?auto_3549 ?auto_3551 ) ) ( not ( = ?auto_3549 ?auto_3548 ) ) ( not ( = ?auto_3549 ?auto_3557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3550 ?auto_3551 ?auto_3548 )
      ( MAKE-3CRATE-VERIFY ?auto_3549 ?auto_3550 ?auto_3551 ?auto_3548 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3577 - SURFACE
      ?auto_3578 - SURFACE
      ?auto_3579 - SURFACE
      ?auto_3576 - SURFACE
    )
    :vars
    (
      ?auto_3582 - HOIST
      ?auto_3584 - PLACE
      ?auto_3583 - PLACE
      ?auto_3581 - HOIST
      ?auto_3580 - SURFACE
      ?auto_3585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3582 ?auto_3584 ) ( SURFACE-AT ?auto_3579 ?auto_3584 ) ( CLEAR ?auto_3579 ) ( IS-CRATE ?auto_3576 ) ( not ( = ?auto_3579 ?auto_3576 ) ) ( AVAILABLE ?auto_3582 ) ( ON ?auto_3579 ?auto_3578 ) ( not ( = ?auto_3578 ?auto_3579 ) ) ( not ( = ?auto_3578 ?auto_3576 ) ) ( not ( = ?auto_3583 ?auto_3584 ) ) ( HOIST-AT ?auto_3581 ?auto_3583 ) ( not ( = ?auto_3582 ?auto_3581 ) ) ( AVAILABLE ?auto_3581 ) ( SURFACE-AT ?auto_3576 ?auto_3583 ) ( ON ?auto_3576 ?auto_3580 ) ( CLEAR ?auto_3576 ) ( not ( = ?auto_3579 ?auto_3580 ) ) ( not ( = ?auto_3576 ?auto_3580 ) ) ( not ( = ?auto_3578 ?auto_3580 ) ) ( TRUCK-AT ?auto_3585 ?auto_3584 ) ( ON ?auto_3578 ?auto_3577 ) ( not ( = ?auto_3577 ?auto_3578 ) ) ( not ( = ?auto_3577 ?auto_3579 ) ) ( not ( = ?auto_3577 ?auto_3576 ) ) ( not ( = ?auto_3577 ?auto_3580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3578 ?auto_3579 ?auto_3576 )
      ( MAKE-3CRATE-VERIFY ?auto_3577 ?auto_3578 ?auto_3579 ?auto_3576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3605 - SURFACE
      ?auto_3606 - SURFACE
      ?auto_3607 - SURFACE
      ?auto_3604 - SURFACE
    )
    :vars
    (
      ?auto_3609 - HOIST
      ?auto_3611 - PLACE
      ?auto_3610 - PLACE
      ?auto_3613 - HOIST
      ?auto_3608 - SURFACE
      ?auto_3612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3609 ?auto_3611 ) ( IS-CRATE ?auto_3604 ) ( not ( = ?auto_3607 ?auto_3604 ) ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( not ( = ?auto_3606 ?auto_3604 ) ) ( not ( = ?auto_3610 ?auto_3611 ) ) ( HOIST-AT ?auto_3613 ?auto_3610 ) ( not ( = ?auto_3609 ?auto_3613 ) ) ( AVAILABLE ?auto_3613 ) ( SURFACE-AT ?auto_3604 ?auto_3610 ) ( ON ?auto_3604 ?auto_3608 ) ( CLEAR ?auto_3604 ) ( not ( = ?auto_3607 ?auto_3608 ) ) ( not ( = ?auto_3604 ?auto_3608 ) ) ( not ( = ?auto_3606 ?auto_3608 ) ) ( TRUCK-AT ?auto_3612 ?auto_3611 ) ( SURFACE-AT ?auto_3606 ?auto_3611 ) ( CLEAR ?auto_3606 ) ( LIFTING ?auto_3609 ?auto_3607 ) ( IS-CRATE ?auto_3607 ) ( ON ?auto_3606 ?auto_3605 ) ( not ( = ?auto_3605 ?auto_3606 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( not ( = ?auto_3605 ?auto_3604 ) ) ( not ( = ?auto_3605 ?auto_3608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3606 ?auto_3607 ?auto_3604 )
      ( MAKE-3CRATE-VERIFY ?auto_3605 ?auto_3606 ?auto_3607 ?auto_3604 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3633 - SURFACE
      ?auto_3634 - SURFACE
      ?auto_3635 - SURFACE
      ?auto_3632 - SURFACE
    )
    :vars
    (
      ?auto_3640 - HOIST
      ?auto_3637 - PLACE
      ?auto_3636 - PLACE
      ?auto_3641 - HOIST
      ?auto_3638 - SURFACE
      ?auto_3639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3640 ?auto_3637 ) ( IS-CRATE ?auto_3632 ) ( not ( = ?auto_3635 ?auto_3632 ) ) ( not ( = ?auto_3634 ?auto_3635 ) ) ( not ( = ?auto_3634 ?auto_3632 ) ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( HOIST-AT ?auto_3641 ?auto_3636 ) ( not ( = ?auto_3640 ?auto_3641 ) ) ( AVAILABLE ?auto_3641 ) ( SURFACE-AT ?auto_3632 ?auto_3636 ) ( ON ?auto_3632 ?auto_3638 ) ( CLEAR ?auto_3632 ) ( not ( = ?auto_3635 ?auto_3638 ) ) ( not ( = ?auto_3632 ?auto_3638 ) ) ( not ( = ?auto_3634 ?auto_3638 ) ) ( TRUCK-AT ?auto_3639 ?auto_3637 ) ( SURFACE-AT ?auto_3634 ?auto_3637 ) ( CLEAR ?auto_3634 ) ( IS-CRATE ?auto_3635 ) ( AVAILABLE ?auto_3640 ) ( IN ?auto_3635 ?auto_3639 ) ( ON ?auto_3634 ?auto_3633 ) ( not ( = ?auto_3633 ?auto_3634 ) ) ( not ( = ?auto_3633 ?auto_3635 ) ) ( not ( = ?auto_3633 ?auto_3632 ) ) ( not ( = ?auto_3633 ?auto_3638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3634 ?auto_3635 ?auto_3632 )
      ( MAKE-3CRATE-VERIFY ?auto_3633 ?auto_3634 ?auto_3635 ?auto_3632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3711 - SURFACE
      ?auto_3712 - SURFACE
    )
    :vars
    (
      ?auto_3714 - HOIST
      ?auto_3713 - PLACE
      ?auto_3716 - SURFACE
      ?auto_3718 - PLACE
      ?auto_3715 - HOIST
      ?auto_3719 - SURFACE
      ?auto_3717 - TRUCK
      ?auto_3720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3714 ?auto_3713 ) ( SURFACE-AT ?auto_3711 ?auto_3713 ) ( CLEAR ?auto_3711 ) ( IS-CRATE ?auto_3712 ) ( not ( = ?auto_3711 ?auto_3712 ) ) ( AVAILABLE ?auto_3714 ) ( ON ?auto_3711 ?auto_3716 ) ( not ( = ?auto_3716 ?auto_3711 ) ) ( not ( = ?auto_3716 ?auto_3712 ) ) ( not ( = ?auto_3718 ?auto_3713 ) ) ( HOIST-AT ?auto_3715 ?auto_3718 ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( AVAILABLE ?auto_3715 ) ( SURFACE-AT ?auto_3712 ?auto_3718 ) ( ON ?auto_3712 ?auto_3719 ) ( CLEAR ?auto_3712 ) ( not ( = ?auto_3711 ?auto_3719 ) ) ( not ( = ?auto_3712 ?auto_3719 ) ) ( not ( = ?auto_3716 ?auto_3719 ) ) ( TRUCK-AT ?auto_3717 ?auto_3720 ) ( not ( = ?auto_3720 ?auto_3713 ) ) ( not ( = ?auto_3718 ?auto_3720 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3717 ?auto_3720 ?auto_3713 )
      ( MAKE-1CRATE ?auto_3711 ?auto_3712 )
      ( MAKE-1CRATE-VERIFY ?auto_3711 ?auto_3712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3817 - SURFACE
      ?auto_3818 - SURFACE
    )
    :vars
    (
      ?auto_3824 - HOIST
      ?auto_3825 - PLACE
      ?auto_3823 - SURFACE
      ?auto_3820 - PLACE
      ?auto_3821 - HOIST
      ?auto_3819 - SURFACE
      ?auto_3822 - TRUCK
      ?auto_3826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3824 ?auto_3825 ) ( SURFACE-AT ?auto_3817 ?auto_3825 ) ( CLEAR ?auto_3817 ) ( IS-CRATE ?auto_3818 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( ON ?auto_3817 ?auto_3823 ) ( not ( = ?auto_3823 ?auto_3817 ) ) ( not ( = ?auto_3823 ?auto_3818 ) ) ( not ( = ?auto_3820 ?auto_3825 ) ) ( HOIST-AT ?auto_3821 ?auto_3820 ) ( not ( = ?auto_3824 ?auto_3821 ) ) ( AVAILABLE ?auto_3821 ) ( SURFACE-AT ?auto_3818 ?auto_3820 ) ( ON ?auto_3818 ?auto_3819 ) ( CLEAR ?auto_3818 ) ( not ( = ?auto_3817 ?auto_3819 ) ) ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3823 ?auto_3819 ) ) ( TRUCK-AT ?auto_3822 ?auto_3825 ) ( LIFTING ?auto_3824 ?auto_3826 ) ( IS-CRATE ?auto_3826 ) ( not ( = ?auto_3817 ?auto_3826 ) ) ( not ( = ?auto_3818 ?auto_3826 ) ) ( not ( = ?auto_3823 ?auto_3826 ) ) ( not ( = ?auto_3819 ?auto_3826 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3824 ?auto_3826 ?auto_3822 ?auto_3825 )
      ( MAKE-1CRATE ?auto_3817 ?auto_3818 )
      ( MAKE-1CRATE-VERIFY ?auto_3817 ?auto_3818 ) )
  )

)

