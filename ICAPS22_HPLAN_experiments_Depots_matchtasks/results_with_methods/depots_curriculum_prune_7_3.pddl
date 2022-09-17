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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3160 - SURFACE
      ?auto_3161 - SURFACE
    )
    :vars
    (
      ?auto_3162 - HOIST
      ?auto_3163 - PLACE
      ?auto_3165 - PLACE
      ?auto_3166 - HOIST
      ?auto_3167 - SURFACE
      ?auto_3164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3162 ?auto_3163 ) ( SURFACE-AT ?auto_3160 ?auto_3163 ) ( CLEAR ?auto_3160 ) ( IS-CRATE ?auto_3161 ) ( AVAILABLE ?auto_3162 ) ( not ( = ?auto_3165 ?auto_3163 ) ) ( HOIST-AT ?auto_3166 ?auto_3165 ) ( AVAILABLE ?auto_3166 ) ( SURFACE-AT ?auto_3161 ?auto_3165 ) ( ON ?auto_3161 ?auto_3167 ) ( CLEAR ?auto_3161 ) ( TRUCK-AT ?auto_3164 ?auto_3163 ) ( not ( = ?auto_3160 ?auto_3161 ) ) ( not ( = ?auto_3160 ?auto_3167 ) ) ( not ( = ?auto_3161 ?auto_3167 ) ) ( not ( = ?auto_3162 ?auto_3166 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3164 ?auto_3163 ?auto_3165 )
      ( !LIFT ?auto_3166 ?auto_3161 ?auto_3167 ?auto_3165 )
      ( !LOAD ?auto_3166 ?auto_3161 ?auto_3164 ?auto_3165 )
      ( !DRIVE ?auto_3164 ?auto_3165 ?auto_3163 )
      ( !UNLOAD ?auto_3162 ?auto_3161 ?auto_3164 ?auto_3163 )
      ( !DROP ?auto_3162 ?auto_3161 ?auto_3160 ?auto_3163 )
      ( MAKE-1CRATE-VERIFY ?auto_3160 ?auto_3161 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3181 - SURFACE
      ?auto_3182 - SURFACE
      ?auto_3183 - SURFACE
    )
    :vars
    (
      ?auto_3185 - HOIST
      ?auto_3188 - PLACE
      ?auto_3184 - PLACE
      ?auto_3187 - HOIST
      ?auto_3189 - SURFACE
      ?auto_3190 - PLACE
      ?auto_3192 - HOIST
      ?auto_3191 - SURFACE
      ?auto_3186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3185 ?auto_3188 ) ( IS-CRATE ?auto_3183 ) ( not ( = ?auto_3184 ?auto_3188 ) ) ( HOIST-AT ?auto_3187 ?auto_3184 ) ( AVAILABLE ?auto_3187 ) ( SURFACE-AT ?auto_3183 ?auto_3184 ) ( ON ?auto_3183 ?auto_3189 ) ( CLEAR ?auto_3183 ) ( not ( = ?auto_3182 ?auto_3183 ) ) ( not ( = ?auto_3182 ?auto_3189 ) ) ( not ( = ?auto_3183 ?auto_3189 ) ) ( not ( = ?auto_3185 ?auto_3187 ) ) ( SURFACE-AT ?auto_3181 ?auto_3188 ) ( CLEAR ?auto_3181 ) ( IS-CRATE ?auto_3182 ) ( AVAILABLE ?auto_3185 ) ( not ( = ?auto_3190 ?auto_3188 ) ) ( HOIST-AT ?auto_3192 ?auto_3190 ) ( AVAILABLE ?auto_3192 ) ( SURFACE-AT ?auto_3182 ?auto_3190 ) ( ON ?auto_3182 ?auto_3191 ) ( CLEAR ?auto_3182 ) ( TRUCK-AT ?auto_3186 ?auto_3188 ) ( not ( = ?auto_3181 ?auto_3182 ) ) ( not ( = ?auto_3181 ?auto_3191 ) ) ( not ( = ?auto_3182 ?auto_3191 ) ) ( not ( = ?auto_3185 ?auto_3192 ) ) ( not ( = ?auto_3181 ?auto_3183 ) ) ( not ( = ?auto_3181 ?auto_3189 ) ) ( not ( = ?auto_3183 ?auto_3191 ) ) ( not ( = ?auto_3184 ?auto_3190 ) ) ( not ( = ?auto_3187 ?auto_3192 ) ) ( not ( = ?auto_3189 ?auto_3191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3181 ?auto_3182 )
      ( MAKE-1CRATE ?auto_3182 ?auto_3183 )
      ( MAKE-2CRATE-VERIFY ?auto_3181 ?auto_3182 ?auto_3183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3207 - SURFACE
      ?auto_3208 - SURFACE
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
    )
    :vars
    (
      ?auto_3213 - HOIST
      ?auto_3215 - PLACE
      ?auto_3214 - PLACE
      ?auto_3211 - HOIST
      ?auto_3212 - SURFACE
      ?auto_3222 - PLACE
      ?auto_3221 - HOIST
      ?auto_3220 - SURFACE
      ?auto_3217 - PLACE
      ?auto_3219 - HOIST
      ?auto_3218 - SURFACE
      ?auto_3216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3213 ?auto_3215 ) ( IS-CRATE ?auto_3210 ) ( not ( = ?auto_3214 ?auto_3215 ) ) ( HOIST-AT ?auto_3211 ?auto_3214 ) ( AVAILABLE ?auto_3211 ) ( SURFACE-AT ?auto_3210 ?auto_3214 ) ( ON ?auto_3210 ?auto_3212 ) ( CLEAR ?auto_3210 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3212 ) ) ( not ( = ?auto_3210 ?auto_3212 ) ) ( not ( = ?auto_3213 ?auto_3211 ) ) ( IS-CRATE ?auto_3209 ) ( not ( = ?auto_3222 ?auto_3215 ) ) ( HOIST-AT ?auto_3221 ?auto_3222 ) ( AVAILABLE ?auto_3221 ) ( SURFACE-AT ?auto_3209 ?auto_3222 ) ( ON ?auto_3209 ?auto_3220 ) ( CLEAR ?auto_3209 ) ( not ( = ?auto_3208 ?auto_3209 ) ) ( not ( = ?auto_3208 ?auto_3220 ) ) ( not ( = ?auto_3209 ?auto_3220 ) ) ( not ( = ?auto_3213 ?auto_3221 ) ) ( SURFACE-AT ?auto_3207 ?auto_3215 ) ( CLEAR ?auto_3207 ) ( IS-CRATE ?auto_3208 ) ( AVAILABLE ?auto_3213 ) ( not ( = ?auto_3217 ?auto_3215 ) ) ( HOIST-AT ?auto_3219 ?auto_3217 ) ( AVAILABLE ?auto_3219 ) ( SURFACE-AT ?auto_3208 ?auto_3217 ) ( ON ?auto_3208 ?auto_3218 ) ( CLEAR ?auto_3208 ) ( TRUCK-AT ?auto_3216 ?auto_3215 ) ( not ( = ?auto_3207 ?auto_3208 ) ) ( not ( = ?auto_3207 ?auto_3218 ) ) ( not ( = ?auto_3208 ?auto_3218 ) ) ( not ( = ?auto_3213 ?auto_3219 ) ) ( not ( = ?auto_3207 ?auto_3209 ) ) ( not ( = ?auto_3207 ?auto_3220 ) ) ( not ( = ?auto_3209 ?auto_3218 ) ) ( not ( = ?auto_3222 ?auto_3217 ) ) ( not ( = ?auto_3221 ?auto_3219 ) ) ( not ( = ?auto_3220 ?auto_3218 ) ) ( not ( = ?auto_3207 ?auto_3210 ) ) ( not ( = ?auto_3207 ?auto_3212 ) ) ( not ( = ?auto_3208 ?auto_3210 ) ) ( not ( = ?auto_3208 ?auto_3212 ) ) ( not ( = ?auto_3210 ?auto_3220 ) ) ( not ( = ?auto_3210 ?auto_3218 ) ) ( not ( = ?auto_3214 ?auto_3222 ) ) ( not ( = ?auto_3214 ?auto_3217 ) ) ( not ( = ?auto_3211 ?auto_3221 ) ) ( not ( = ?auto_3211 ?auto_3219 ) ) ( not ( = ?auto_3212 ?auto_3220 ) ) ( not ( = ?auto_3212 ?auto_3218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3207 ?auto_3208 ?auto_3209 )
      ( MAKE-1CRATE ?auto_3209 ?auto_3210 )
      ( MAKE-3CRATE-VERIFY ?auto_3207 ?auto_3208 ?auto_3209 ?auto_3210 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3238 - SURFACE
      ?auto_3239 - SURFACE
      ?auto_3240 - SURFACE
      ?auto_3241 - SURFACE
      ?auto_3242 - SURFACE
    )
    :vars
    (
      ?auto_3247 - HOIST
      ?auto_3243 - PLACE
      ?auto_3245 - PLACE
      ?auto_3248 - HOIST
      ?auto_3246 - SURFACE
      ?auto_3250 - PLACE
      ?auto_3251 - HOIST
      ?auto_3249 - SURFACE
      ?auto_3253 - PLACE
      ?auto_3256 - HOIST
      ?auto_3255 - SURFACE
      ?auto_3254 - PLACE
      ?auto_3257 - HOIST
      ?auto_3252 - SURFACE
      ?auto_3244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3247 ?auto_3243 ) ( IS-CRATE ?auto_3242 ) ( not ( = ?auto_3245 ?auto_3243 ) ) ( HOIST-AT ?auto_3248 ?auto_3245 ) ( AVAILABLE ?auto_3248 ) ( SURFACE-AT ?auto_3242 ?auto_3245 ) ( ON ?auto_3242 ?auto_3246 ) ( CLEAR ?auto_3242 ) ( not ( = ?auto_3241 ?auto_3242 ) ) ( not ( = ?auto_3241 ?auto_3246 ) ) ( not ( = ?auto_3242 ?auto_3246 ) ) ( not ( = ?auto_3247 ?auto_3248 ) ) ( IS-CRATE ?auto_3241 ) ( not ( = ?auto_3250 ?auto_3243 ) ) ( HOIST-AT ?auto_3251 ?auto_3250 ) ( AVAILABLE ?auto_3251 ) ( SURFACE-AT ?auto_3241 ?auto_3250 ) ( ON ?auto_3241 ?auto_3249 ) ( CLEAR ?auto_3241 ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( not ( = ?auto_3240 ?auto_3249 ) ) ( not ( = ?auto_3241 ?auto_3249 ) ) ( not ( = ?auto_3247 ?auto_3251 ) ) ( IS-CRATE ?auto_3240 ) ( not ( = ?auto_3253 ?auto_3243 ) ) ( HOIST-AT ?auto_3256 ?auto_3253 ) ( AVAILABLE ?auto_3256 ) ( SURFACE-AT ?auto_3240 ?auto_3253 ) ( ON ?auto_3240 ?auto_3255 ) ( CLEAR ?auto_3240 ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( not ( = ?auto_3239 ?auto_3255 ) ) ( not ( = ?auto_3240 ?auto_3255 ) ) ( not ( = ?auto_3247 ?auto_3256 ) ) ( SURFACE-AT ?auto_3238 ?auto_3243 ) ( CLEAR ?auto_3238 ) ( IS-CRATE ?auto_3239 ) ( AVAILABLE ?auto_3247 ) ( not ( = ?auto_3254 ?auto_3243 ) ) ( HOIST-AT ?auto_3257 ?auto_3254 ) ( AVAILABLE ?auto_3257 ) ( SURFACE-AT ?auto_3239 ?auto_3254 ) ( ON ?auto_3239 ?auto_3252 ) ( CLEAR ?auto_3239 ) ( TRUCK-AT ?auto_3244 ?auto_3243 ) ( not ( = ?auto_3238 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3252 ) ) ( not ( = ?auto_3239 ?auto_3252 ) ) ( not ( = ?auto_3247 ?auto_3257 ) ) ( not ( = ?auto_3238 ?auto_3240 ) ) ( not ( = ?auto_3238 ?auto_3255 ) ) ( not ( = ?auto_3240 ?auto_3252 ) ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( not ( = ?auto_3256 ?auto_3257 ) ) ( not ( = ?auto_3255 ?auto_3252 ) ) ( not ( = ?auto_3238 ?auto_3241 ) ) ( not ( = ?auto_3238 ?auto_3249 ) ) ( not ( = ?auto_3239 ?auto_3241 ) ) ( not ( = ?auto_3239 ?auto_3249 ) ) ( not ( = ?auto_3241 ?auto_3255 ) ) ( not ( = ?auto_3241 ?auto_3252 ) ) ( not ( = ?auto_3250 ?auto_3253 ) ) ( not ( = ?auto_3250 ?auto_3254 ) ) ( not ( = ?auto_3251 ?auto_3256 ) ) ( not ( = ?auto_3251 ?auto_3257 ) ) ( not ( = ?auto_3249 ?auto_3255 ) ) ( not ( = ?auto_3249 ?auto_3252 ) ) ( not ( = ?auto_3238 ?auto_3242 ) ) ( not ( = ?auto_3238 ?auto_3246 ) ) ( not ( = ?auto_3239 ?auto_3242 ) ) ( not ( = ?auto_3239 ?auto_3246 ) ) ( not ( = ?auto_3240 ?auto_3242 ) ) ( not ( = ?auto_3240 ?auto_3246 ) ) ( not ( = ?auto_3242 ?auto_3249 ) ) ( not ( = ?auto_3242 ?auto_3255 ) ) ( not ( = ?auto_3242 ?auto_3252 ) ) ( not ( = ?auto_3245 ?auto_3250 ) ) ( not ( = ?auto_3245 ?auto_3253 ) ) ( not ( = ?auto_3245 ?auto_3254 ) ) ( not ( = ?auto_3248 ?auto_3251 ) ) ( not ( = ?auto_3248 ?auto_3256 ) ) ( not ( = ?auto_3248 ?auto_3257 ) ) ( not ( = ?auto_3246 ?auto_3249 ) ) ( not ( = ?auto_3246 ?auto_3255 ) ) ( not ( = ?auto_3246 ?auto_3252 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3238 ?auto_3239 ?auto_3240 ?auto_3241 )
      ( MAKE-1CRATE ?auto_3241 ?auto_3242 )
      ( MAKE-4CRATE-VERIFY ?auto_3238 ?auto_3239 ?auto_3240 ?auto_3241 ?auto_3242 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3274 - SURFACE
      ?auto_3275 - SURFACE
      ?auto_3276 - SURFACE
      ?auto_3277 - SURFACE
      ?auto_3278 - SURFACE
      ?auto_3279 - SURFACE
    )
    :vars
    (
      ?auto_3280 - HOIST
      ?auto_3284 - PLACE
      ?auto_3283 - PLACE
      ?auto_3282 - HOIST
      ?auto_3285 - SURFACE
      ?auto_3287 - PLACE
      ?auto_3288 - HOIST
      ?auto_3296 - SURFACE
      ?auto_3289 - PLACE
      ?auto_3294 - HOIST
      ?auto_3293 - SURFACE
      ?auto_3291 - PLACE
      ?auto_3286 - HOIST
      ?auto_3297 - SURFACE
      ?auto_3292 - PLACE
      ?auto_3295 - HOIST
      ?auto_3290 - SURFACE
      ?auto_3281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3280 ?auto_3284 ) ( IS-CRATE ?auto_3279 ) ( not ( = ?auto_3283 ?auto_3284 ) ) ( HOIST-AT ?auto_3282 ?auto_3283 ) ( AVAILABLE ?auto_3282 ) ( SURFACE-AT ?auto_3279 ?auto_3283 ) ( ON ?auto_3279 ?auto_3285 ) ( CLEAR ?auto_3279 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3285 ) ) ( not ( = ?auto_3279 ?auto_3285 ) ) ( not ( = ?auto_3280 ?auto_3282 ) ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3287 ?auto_3284 ) ) ( HOIST-AT ?auto_3288 ?auto_3287 ) ( AVAILABLE ?auto_3288 ) ( SURFACE-AT ?auto_3278 ?auto_3287 ) ( ON ?auto_3278 ?auto_3296 ) ( CLEAR ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( not ( = ?auto_3277 ?auto_3296 ) ) ( not ( = ?auto_3278 ?auto_3296 ) ) ( not ( = ?auto_3280 ?auto_3288 ) ) ( IS-CRATE ?auto_3277 ) ( not ( = ?auto_3289 ?auto_3284 ) ) ( HOIST-AT ?auto_3294 ?auto_3289 ) ( AVAILABLE ?auto_3294 ) ( SURFACE-AT ?auto_3277 ?auto_3289 ) ( ON ?auto_3277 ?auto_3293 ) ( CLEAR ?auto_3277 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3293 ) ) ( not ( = ?auto_3277 ?auto_3293 ) ) ( not ( = ?auto_3280 ?auto_3294 ) ) ( IS-CRATE ?auto_3276 ) ( not ( = ?auto_3291 ?auto_3284 ) ) ( HOIST-AT ?auto_3286 ?auto_3291 ) ( AVAILABLE ?auto_3286 ) ( SURFACE-AT ?auto_3276 ?auto_3291 ) ( ON ?auto_3276 ?auto_3297 ) ( CLEAR ?auto_3276 ) ( not ( = ?auto_3275 ?auto_3276 ) ) ( not ( = ?auto_3275 ?auto_3297 ) ) ( not ( = ?auto_3276 ?auto_3297 ) ) ( not ( = ?auto_3280 ?auto_3286 ) ) ( SURFACE-AT ?auto_3274 ?auto_3284 ) ( CLEAR ?auto_3274 ) ( IS-CRATE ?auto_3275 ) ( AVAILABLE ?auto_3280 ) ( not ( = ?auto_3292 ?auto_3284 ) ) ( HOIST-AT ?auto_3295 ?auto_3292 ) ( AVAILABLE ?auto_3295 ) ( SURFACE-AT ?auto_3275 ?auto_3292 ) ( ON ?auto_3275 ?auto_3290 ) ( CLEAR ?auto_3275 ) ( TRUCK-AT ?auto_3281 ?auto_3284 ) ( not ( = ?auto_3274 ?auto_3275 ) ) ( not ( = ?auto_3274 ?auto_3290 ) ) ( not ( = ?auto_3275 ?auto_3290 ) ) ( not ( = ?auto_3280 ?auto_3295 ) ) ( not ( = ?auto_3274 ?auto_3276 ) ) ( not ( = ?auto_3274 ?auto_3297 ) ) ( not ( = ?auto_3276 ?auto_3290 ) ) ( not ( = ?auto_3291 ?auto_3292 ) ) ( not ( = ?auto_3286 ?auto_3295 ) ) ( not ( = ?auto_3297 ?auto_3290 ) ) ( not ( = ?auto_3274 ?auto_3277 ) ) ( not ( = ?auto_3274 ?auto_3293 ) ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( not ( = ?auto_3275 ?auto_3293 ) ) ( not ( = ?auto_3277 ?auto_3297 ) ) ( not ( = ?auto_3277 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3291 ) ) ( not ( = ?auto_3289 ?auto_3292 ) ) ( not ( = ?auto_3294 ?auto_3286 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( not ( = ?auto_3293 ?auto_3297 ) ) ( not ( = ?auto_3293 ?auto_3290 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) ( not ( = ?auto_3274 ?auto_3296 ) ) ( not ( = ?auto_3275 ?auto_3278 ) ) ( not ( = ?auto_3275 ?auto_3296 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( not ( = ?auto_3276 ?auto_3296 ) ) ( not ( = ?auto_3278 ?auto_3293 ) ) ( not ( = ?auto_3278 ?auto_3297 ) ) ( not ( = ?auto_3278 ?auto_3290 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3291 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) ( not ( = ?auto_3288 ?auto_3294 ) ) ( not ( = ?auto_3288 ?auto_3286 ) ) ( not ( = ?auto_3288 ?auto_3295 ) ) ( not ( = ?auto_3296 ?auto_3293 ) ) ( not ( = ?auto_3296 ?auto_3297 ) ) ( not ( = ?auto_3296 ?auto_3290 ) ) ( not ( = ?auto_3274 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3285 ) ) ( not ( = ?auto_3275 ?auto_3279 ) ) ( not ( = ?auto_3275 ?auto_3285 ) ) ( not ( = ?auto_3276 ?auto_3279 ) ) ( not ( = ?auto_3276 ?auto_3285 ) ) ( not ( = ?auto_3277 ?auto_3279 ) ) ( not ( = ?auto_3277 ?auto_3285 ) ) ( not ( = ?auto_3279 ?auto_3296 ) ) ( not ( = ?auto_3279 ?auto_3293 ) ) ( not ( = ?auto_3279 ?auto_3297 ) ) ( not ( = ?auto_3279 ?auto_3290 ) ) ( not ( = ?auto_3283 ?auto_3287 ) ) ( not ( = ?auto_3283 ?auto_3289 ) ) ( not ( = ?auto_3283 ?auto_3291 ) ) ( not ( = ?auto_3283 ?auto_3292 ) ) ( not ( = ?auto_3282 ?auto_3288 ) ) ( not ( = ?auto_3282 ?auto_3294 ) ) ( not ( = ?auto_3282 ?auto_3286 ) ) ( not ( = ?auto_3282 ?auto_3295 ) ) ( not ( = ?auto_3285 ?auto_3296 ) ) ( not ( = ?auto_3285 ?auto_3293 ) ) ( not ( = ?auto_3285 ?auto_3297 ) ) ( not ( = ?auto_3285 ?auto_3290 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-1CRATE ?auto_3278 ?auto_3279 )
      ( MAKE-5CRATE-VERIFY ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 ?auto_3279 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3315 - SURFACE
      ?auto_3316 - SURFACE
      ?auto_3317 - SURFACE
      ?auto_3318 - SURFACE
      ?auto_3319 - SURFACE
      ?auto_3320 - SURFACE
      ?auto_3321 - SURFACE
    )
    :vars
    (
      ?auto_3326 - HOIST
      ?auto_3323 - PLACE
      ?auto_3324 - PLACE
      ?auto_3322 - HOIST
      ?auto_3327 - SURFACE
      ?auto_3341 - PLACE
      ?auto_3340 - HOIST
      ?auto_3330 - SURFACE
      ?auto_3331 - PLACE
      ?auto_3332 - HOIST
      ?auto_3339 - SURFACE
      ?auto_3334 - PLACE
      ?auto_3328 - HOIST
      ?auto_3338 - SURFACE
      ?auto_3336 - PLACE
      ?auto_3333 - HOIST
      ?auto_3342 - SURFACE
      ?auto_3337 - PLACE
      ?auto_3329 - HOIST
      ?auto_3335 - SURFACE
      ?auto_3325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3326 ?auto_3323 ) ( IS-CRATE ?auto_3321 ) ( not ( = ?auto_3324 ?auto_3323 ) ) ( HOIST-AT ?auto_3322 ?auto_3324 ) ( AVAILABLE ?auto_3322 ) ( SURFACE-AT ?auto_3321 ?auto_3324 ) ( ON ?auto_3321 ?auto_3327 ) ( CLEAR ?auto_3321 ) ( not ( = ?auto_3320 ?auto_3321 ) ) ( not ( = ?auto_3320 ?auto_3327 ) ) ( not ( = ?auto_3321 ?auto_3327 ) ) ( not ( = ?auto_3326 ?auto_3322 ) ) ( IS-CRATE ?auto_3320 ) ( not ( = ?auto_3341 ?auto_3323 ) ) ( HOIST-AT ?auto_3340 ?auto_3341 ) ( AVAILABLE ?auto_3340 ) ( SURFACE-AT ?auto_3320 ?auto_3341 ) ( ON ?auto_3320 ?auto_3330 ) ( CLEAR ?auto_3320 ) ( not ( = ?auto_3319 ?auto_3320 ) ) ( not ( = ?auto_3319 ?auto_3330 ) ) ( not ( = ?auto_3320 ?auto_3330 ) ) ( not ( = ?auto_3326 ?auto_3340 ) ) ( IS-CRATE ?auto_3319 ) ( not ( = ?auto_3331 ?auto_3323 ) ) ( HOIST-AT ?auto_3332 ?auto_3331 ) ( AVAILABLE ?auto_3332 ) ( SURFACE-AT ?auto_3319 ?auto_3331 ) ( ON ?auto_3319 ?auto_3339 ) ( CLEAR ?auto_3319 ) ( not ( = ?auto_3318 ?auto_3319 ) ) ( not ( = ?auto_3318 ?auto_3339 ) ) ( not ( = ?auto_3319 ?auto_3339 ) ) ( not ( = ?auto_3326 ?auto_3332 ) ) ( IS-CRATE ?auto_3318 ) ( not ( = ?auto_3334 ?auto_3323 ) ) ( HOIST-AT ?auto_3328 ?auto_3334 ) ( AVAILABLE ?auto_3328 ) ( SURFACE-AT ?auto_3318 ?auto_3334 ) ( ON ?auto_3318 ?auto_3338 ) ( CLEAR ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( not ( = ?auto_3317 ?auto_3338 ) ) ( not ( = ?auto_3318 ?auto_3338 ) ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( IS-CRATE ?auto_3317 ) ( not ( = ?auto_3336 ?auto_3323 ) ) ( HOIST-AT ?auto_3333 ?auto_3336 ) ( AVAILABLE ?auto_3333 ) ( SURFACE-AT ?auto_3317 ?auto_3336 ) ( ON ?auto_3317 ?auto_3342 ) ( CLEAR ?auto_3317 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3342 ) ) ( not ( = ?auto_3317 ?auto_3342 ) ) ( not ( = ?auto_3326 ?auto_3333 ) ) ( SURFACE-AT ?auto_3315 ?auto_3323 ) ( CLEAR ?auto_3315 ) ( IS-CRATE ?auto_3316 ) ( AVAILABLE ?auto_3326 ) ( not ( = ?auto_3337 ?auto_3323 ) ) ( HOIST-AT ?auto_3329 ?auto_3337 ) ( AVAILABLE ?auto_3329 ) ( SURFACE-AT ?auto_3316 ?auto_3337 ) ( ON ?auto_3316 ?auto_3335 ) ( CLEAR ?auto_3316 ) ( TRUCK-AT ?auto_3325 ?auto_3323 ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3335 ) ) ( not ( = ?auto_3316 ?auto_3335 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3342 ) ) ( not ( = ?auto_3317 ?auto_3335 ) ) ( not ( = ?auto_3336 ?auto_3337 ) ) ( not ( = ?auto_3333 ?auto_3329 ) ) ( not ( = ?auto_3342 ?auto_3335 ) ) ( not ( = ?auto_3315 ?auto_3318 ) ) ( not ( = ?auto_3315 ?auto_3338 ) ) ( not ( = ?auto_3316 ?auto_3318 ) ) ( not ( = ?auto_3316 ?auto_3338 ) ) ( not ( = ?auto_3318 ?auto_3342 ) ) ( not ( = ?auto_3318 ?auto_3335 ) ) ( not ( = ?auto_3334 ?auto_3336 ) ) ( not ( = ?auto_3334 ?auto_3337 ) ) ( not ( = ?auto_3328 ?auto_3333 ) ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( not ( = ?auto_3338 ?auto_3342 ) ) ( not ( = ?auto_3338 ?auto_3335 ) ) ( not ( = ?auto_3315 ?auto_3319 ) ) ( not ( = ?auto_3315 ?auto_3339 ) ) ( not ( = ?auto_3316 ?auto_3319 ) ) ( not ( = ?auto_3316 ?auto_3339 ) ) ( not ( = ?auto_3317 ?auto_3319 ) ) ( not ( = ?auto_3317 ?auto_3339 ) ) ( not ( = ?auto_3319 ?auto_3338 ) ) ( not ( = ?auto_3319 ?auto_3342 ) ) ( not ( = ?auto_3319 ?auto_3335 ) ) ( not ( = ?auto_3331 ?auto_3334 ) ) ( not ( = ?auto_3331 ?auto_3336 ) ) ( not ( = ?auto_3331 ?auto_3337 ) ) ( not ( = ?auto_3332 ?auto_3328 ) ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3329 ) ) ( not ( = ?auto_3339 ?auto_3338 ) ) ( not ( = ?auto_3339 ?auto_3342 ) ) ( not ( = ?auto_3339 ?auto_3335 ) ) ( not ( = ?auto_3315 ?auto_3320 ) ) ( not ( = ?auto_3315 ?auto_3330 ) ) ( not ( = ?auto_3316 ?auto_3320 ) ) ( not ( = ?auto_3316 ?auto_3330 ) ) ( not ( = ?auto_3317 ?auto_3320 ) ) ( not ( = ?auto_3317 ?auto_3330 ) ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( not ( = ?auto_3318 ?auto_3330 ) ) ( not ( = ?auto_3320 ?auto_3339 ) ) ( not ( = ?auto_3320 ?auto_3338 ) ) ( not ( = ?auto_3320 ?auto_3342 ) ) ( not ( = ?auto_3320 ?auto_3335 ) ) ( not ( = ?auto_3341 ?auto_3331 ) ) ( not ( = ?auto_3341 ?auto_3334 ) ) ( not ( = ?auto_3341 ?auto_3336 ) ) ( not ( = ?auto_3341 ?auto_3337 ) ) ( not ( = ?auto_3340 ?auto_3332 ) ) ( not ( = ?auto_3340 ?auto_3328 ) ) ( not ( = ?auto_3340 ?auto_3333 ) ) ( not ( = ?auto_3340 ?auto_3329 ) ) ( not ( = ?auto_3330 ?auto_3339 ) ) ( not ( = ?auto_3330 ?auto_3338 ) ) ( not ( = ?auto_3330 ?auto_3342 ) ) ( not ( = ?auto_3330 ?auto_3335 ) ) ( not ( = ?auto_3315 ?auto_3321 ) ) ( not ( = ?auto_3315 ?auto_3327 ) ) ( not ( = ?auto_3316 ?auto_3321 ) ) ( not ( = ?auto_3316 ?auto_3327 ) ) ( not ( = ?auto_3317 ?auto_3321 ) ) ( not ( = ?auto_3317 ?auto_3327 ) ) ( not ( = ?auto_3318 ?auto_3321 ) ) ( not ( = ?auto_3318 ?auto_3327 ) ) ( not ( = ?auto_3319 ?auto_3321 ) ) ( not ( = ?auto_3319 ?auto_3327 ) ) ( not ( = ?auto_3321 ?auto_3330 ) ) ( not ( = ?auto_3321 ?auto_3339 ) ) ( not ( = ?auto_3321 ?auto_3338 ) ) ( not ( = ?auto_3321 ?auto_3342 ) ) ( not ( = ?auto_3321 ?auto_3335 ) ) ( not ( = ?auto_3324 ?auto_3341 ) ) ( not ( = ?auto_3324 ?auto_3331 ) ) ( not ( = ?auto_3324 ?auto_3334 ) ) ( not ( = ?auto_3324 ?auto_3336 ) ) ( not ( = ?auto_3324 ?auto_3337 ) ) ( not ( = ?auto_3322 ?auto_3340 ) ) ( not ( = ?auto_3322 ?auto_3332 ) ) ( not ( = ?auto_3322 ?auto_3328 ) ) ( not ( = ?auto_3322 ?auto_3333 ) ) ( not ( = ?auto_3322 ?auto_3329 ) ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3327 ?auto_3339 ) ) ( not ( = ?auto_3327 ?auto_3338 ) ) ( not ( = ?auto_3327 ?auto_3342 ) ) ( not ( = ?auto_3327 ?auto_3335 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3315 ?auto_3316 ?auto_3317 ?auto_3318 ?auto_3319 ?auto_3320 )
      ( MAKE-1CRATE ?auto_3320 ?auto_3321 )
      ( MAKE-6CRATE-VERIFY ?auto_3315 ?auto_3316 ?auto_3317 ?auto_3318 ?auto_3319 ?auto_3320 ?auto_3321 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3361 - SURFACE
      ?auto_3362 - SURFACE
      ?auto_3363 - SURFACE
      ?auto_3364 - SURFACE
      ?auto_3365 - SURFACE
      ?auto_3366 - SURFACE
      ?auto_3367 - SURFACE
      ?auto_3368 - SURFACE
    )
    :vars
    (
      ?auto_3369 - HOIST
      ?auto_3372 - PLACE
      ?auto_3373 - PLACE
      ?auto_3371 - HOIST
      ?auto_3370 - SURFACE
      ?auto_3380 - PLACE
      ?auto_3375 - HOIST
      ?auto_3381 - SURFACE
      ?auto_3382 - PLACE
      ?auto_3378 - HOIST
      ?auto_3384 - SURFACE
      ?auto_3386 - PLACE
      ?auto_3376 - HOIST
      ?auto_3388 - SURFACE
      ?auto_3387 - PLACE
      ?auto_3391 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3389 - PLACE
      ?auto_3390 - HOIST
      ?auto_3385 - SURFACE
      ?auto_3383 - PLACE
      ?auto_3392 - HOIST
      ?auto_3377 - SURFACE
      ?auto_3374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3369 ?auto_3372 ) ( IS-CRATE ?auto_3368 ) ( not ( = ?auto_3373 ?auto_3372 ) ) ( HOIST-AT ?auto_3371 ?auto_3373 ) ( AVAILABLE ?auto_3371 ) ( SURFACE-AT ?auto_3368 ?auto_3373 ) ( ON ?auto_3368 ?auto_3370 ) ( CLEAR ?auto_3368 ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( not ( = ?auto_3367 ?auto_3370 ) ) ( not ( = ?auto_3368 ?auto_3370 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( IS-CRATE ?auto_3367 ) ( not ( = ?auto_3380 ?auto_3372 ) ) ( HOIST-AT ?auto_3375 ?auto_3380 ) ( AVAILABLE ?auto_3375 ) ( SURFACE-AT ?auto_3367 ?auto_3380 ) ( ON ?auto_3367 ?auto_3381 ) ( CLEAR ?auto_3367 ) ( not ( = ?auto_3366 ?auto_3367 ) ) ( not ( = ?auto_3366 ?auto_3381 ) ) ( not ( = ?auto_3367 ?auto_3381 ) ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( IS-CRATE ?auto_3366 ) ( not ( = ?auto_3382 ?auto_3372 ) ) ( HOIST-AT ?auto_3378 ?auto_3382 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3366 ?auto_3382 ) ( ON ?auto_3366 ?auto_3384 ) ( CLEAR ?auto_3366 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( not ( = ?auto_3365 ?auto_3384 ) ) ( not ( = ?auto_3366 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3378 ) ) ( IS-CRATE ?auto_3365 ) ( not ( = ?auto_3386 ?auto_3372 ) ) ( HOIST-AT ?auto_3376 ?auto_3386 ) ( AVAILABLE ?auto_3376 ) ( SURFACE-AT ?auto_3365 ?auto_3386 ) ( ON ?auto_3365 ?auto_3388 ) ( CLEAR ?auto_3365 ) ( not ( = ?auto_3364 ?auto_3365 ) ) ( not ( = ?auto_3364 ?auto_3388 ) ) ( not ( = ?auto_3365 ?auto_3388 ) ) ( not ( = ?auto_3369 ?auto_3376 ) ) ( IS-CRATE ?auto_3364 ) ( not ( = ?auto_3387 ?auto_3372 ) ) ( HOIST-AT ?auto_3391 ?auto_3387 ) ( AVAILABLE ?auto_3391 ) ( SURFACE-AT ?auto_3364 ?auto_3387 ) ( ON ?auto_3364 ?auto_3379 ) ( CLEAR ?auto_3364 ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3379 ) ) ( not ( = ?auto_3364 ?auto_3379 ) ) ( not ( = ?auto_3369 ?auto_3391 ) ) ( IS-CRATE ?auto_3363 ) ( not ( = ?auto_3389 ?auto_3372 ) ) ( HOIST-AT ?auto_3390 ?auto_3389 ) ( AVAILABLE ?auto_3390 ) ( SURFACE-AT ?auto_3363 ?auto_3389 ) ( ON ?auto_3363 ?auto_3385 ) ( CLEAR ?auto_3363 ) ( not ( = ?auto_3362 ?auto_3363 ) ) ( not ( = ?auto_3362 ?auto_3385 ) ) ( not ( = ?auto_3363 ?auto_3385 ) ) ( not ( = ?auto_3369 ?auto_3390 ) ) ( SURFACE-AT ?auto_3361 ?auto_3372 ) ( CLEAR ?auto_3361 ) ( IS-CRATE ?auto_3362 ) ( AVAILABLE ?auto_3369 ) ( not ( = ?auto_3383 ?auto_3372 ) ) ( HOIST-AT ?auto_3392 ?auto_3383 ) ( AVAILABLE ?auto_3392 ) ( SURFACE-AT ?auto_3362 ?auto_3383 ) ( ON ?auto_3362 ?auto_3377 ) ( CLEAR ?auto_3362 ) ( TRUCK-AT ?auto_3374 ?auto_3372 ) ( not ( = ?auto_3361 ?auto_3362 ) ) ( not ( = ?auto_3361 ?auto_3377 ) ) ( not ( = ?auto_3362 ?auto_3377 ) ) ( not ( = ?auto_3369 ?auto_3392 ) ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3361 ?auto_3385 ) ) ( not ( = ?auto_3363 ?auto_3377 ) ) ( not ( = ?auto_3389 ?auto_3383 ) ) ( not ( = ?auto_3390 ?auto_3392 ) ) ( not ( = ?auto_3385 ?auto_3377 ) ) ( not ( = ?auto_3361 ?auto_3364 ) ) ( not ( = ?auto_3361 ?auto_3379 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3362 ?auto_3379 ) ) ( not ( = ?auto_3364 ?auto_3385 ) ) ( not ( = ?auto_3364 ?auto_3377 ) ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3383 ) ) ( not ( = ?auto_3391 ?auto_3390 ) ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( not ( = ?auto_3379 ?auto_3385 ) ) ( not ( = ?auto_3379 ?auto_3377 ) ) ( not ( = ?auto_3361 ?auto_3365 ) ) ( not ( = ?auto_3361 ?auto_3388 ) ) ( not ( = ?auto_3362 ?auto_3365 ) ) ( not ( = ?auto_3362 ?auto_3388 ) ) ( not ( = ?auto_3363 ?auto_3365 ) ) ( not ( = ?auto_3363 ?auto_3388 ) ) ( not ( = ?auto_3365 ?auto_3379 ) ) ( not ( = ?auto_3365 ?auto_3385 ) ) ( not ( = ?auto_3365 ?auto_3377 ) ) ( not ( = ?auto_3386 ?auto_3387 ) ) ( not ( = ?auto_3386 ?auto_3389 ) ) ( not ( = ?auto_3386 ?auto_3383 ) ) ( not ( = ?auto_3376 ?auto_3391 ) ) ( not ( = ?auto_3376 ?auto_3390 ) ) ( not ( = ?auto_3376 ?auto_3392 ) ) ( not ( = ?auto_3388 ?auto_3379 ) ) ( not ( = ?auto_3388 ?auto_3385 ) ) ( not ( = ?auto_3388 ?auto_3377 ) ) ( not ( = ?auto_3361 ?auto_3366 ) ) ( not ( = ?auto_3361 ?auto_3384 ) ) ( not ( = ?auto_3362 ?auto_3366 ) ) ( not ( = ?auto_3362 ?auto_3384 ) ) ( not ( = ?auto_3363 ?auto_3366 ) ) ( not ( = ?auto_3363 ?auto_3384 ) ) ( not ( = ?auto_3364 ?auto_3366 ) ) ( not ( = ?auto_3364 ?auto_3384 ) ) ( not ( = ?auto_3366 ?auto_3388 ) ) ( not ( = ?auto_3366 ?auto_3379 ) ) ( not ( = ?auto_3366 ?auto_3385 ) ) ( not ( = ?auto_3366 ?auto_3377 ) ) ( not ( = ?auto_3382 ?auto_3386 ) ) ( not ( = ?auto_3382 ?auto_3387 ) ) ( not ( = ?auto_3382 ?auto_3389 ) ) ( not ( = ?auto_3382 ?auto_3383 ) ) ( not ( = ?auto_3378 ?auto_3376 ) ) ( not ( = ?auto_3378 ?auto_3391 ) ) ( not ( = ?auto_3378 ?auto_3390 ) ) ( not ( = ?auto_3378 ?auto_3392 ) ) ( not ( = ?auto_3384 ?auto_3388 ) ) ( not ( = ?auto_3384 ?auto_3379 ) ) ( not ( = ?auto_3384 ?auto_3385 ) ) ( not ( = ?auto_3384 ?auto_3377 ) ) ( not ( = ?auto_3361 ?auto_3367 ) ) ( not ( = ?auto_3361 ?auto_3381 ) ) ( not ( = ?auto_3362 ?auto_3367 ) ) ( not ( = ?auto_3362 ?auto_3381 ) ) ( not ( = ?auto_3363 ?auto_3367 ) ) ( not ( = ?auto_3363 ?auto_3381 ) ) ( not ( = ?auto_3364 ?auto_3367 ) ) ( not ( = ?auto_3364 ?auto_3381 ) ) ( not ( = ?auto_3365 ?auto_3367 ) ) ( not ( = ?auto_3365 ?auto_3381 ) ) ( not ( = ?auto_3367 ?auto_3384 ) ) ( not ( = ?auto_3367 ?auto_3388 ) ) ( not ( = ?auto_3367 ?auto_3379 ) ) ( not ( = ?auto_3367 ?auto_3385 ) ) ( not ( = ?auto_3367 ?auto_3377 ) ) ( not ( = ?auto_3380 ?auto_3382 ) ) ( not ( = ?auto_3380 ?auto_3386 ) ) ( not ( = ?auto_3380 ?auto_3387 ) ) ( not ( = ?auto_3380 ?auto_3389 ) ) ( not ( = ?auto_3380 ?auto_3383 ) ) ( not ( = ?auto_3375 ?auto_3378 ) ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3375 ?auto_3391 ) ) ( not ( = ?auto_3375 ?auto_3390 ) ) ( not ( = ?auto_3375 ?auto_3392 ) ) ( not ( = ?auto_3381 ?auto_3384 ) ) ( not ( = ?auto_3381 ?auto_3388 ) ) ( not ( = ?auto_3381 ?auto_3379 ) ) ( not ( = ?auto_3381 ?auto_3385 ) ) ( not ( = ?auto_3381 ?auto_3377 ) ) ( not ( = ?auto_3361 ?auto_3368 ) ) ( not ( = ?auto_3361 ?auto_3370 ) ) ( not ( = ?auto_3362 ?auto_3368 ) ) ( not ( = ?auto_3362 ?auto_3370 ) ) ( not ( = ?auto_3363 ?auto_3368 ) ) ( not ( = ?auto_3363 ?auto_3370 ) ) ( not ( = ?auto_3364 ?auto_3368 ) ) ( not ( = ?auto_3364 ?auto_3370 ) ) ( not ( = ?auto_3365 ?auto_3368 ) ) ( not ( = ?auto_3365 ?auto_3370 ) ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3366 ?auto_3370 ) ) ( not ( = ?auto_3368 ?auto_3381 ) ) ( not ( = ?auto_3368 ?auto_3384 ) ) ( not ( = ?auto_3368 ?auto_3388 ) ) ( not ( = ?auto_3368 ?auto_3379 ) ) ( not ( = ?auto_3368 ?auto_3385 ) ) ( not ( = ?auto_3368 ?auto_3377 ) ) ( not ( = ?auto_3373 ?auto_3380 ) ) ( not ( = ?auto_3373 ?auto_3382 ) ) ( not ( = ?auto_3373 ?auto_3386 ) ) ( not ( = ?auto_3373 ?auto_3387 ) ) ( not ( = ?auto_3373 ?auto_3389 ) ) ( not ( = ?auto_3373 ?auto_3383 ) ) ( not ( = ?auto_3371 ?auto_3375 ) ) ( not ( = ?auto_3371 ?auto_3378 ) ) ( not ( = ?auto_3371 ?auto_3376 ) ) ( not ( = ?auto_3371 ?auto_3391 ) ) ( not ( = ?auto_3371 ?auto_3390 ) ) ( not ( = ?auto_3371 ?auto_3392 ) ) ( not ( = ?auto_3370 ?auto_3381 ) ) ( not ( = ?auto_3370 ?auto_3384 ) ) ( not ( = ?auto_3370 ?auto_3388 ) ) ( not ( = ?auto_3370 ?auto_3379 ) ) ( not ( = ?auto_3370 ?auto_3385 ) ) ( not ( = ?auto_3370 ?auto_3377 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3361 ?auto_3362 ?auto_3363 ?auto_3364 ?auto_3365 ?auto_3366 ?auto_3367 )
      ( MAKE-1CRATE ?auto_3367 ?auto_3368 )
      ( MAKE-7CRATE-VERIFY ?auto_3361 ?auto_3362 ?auto_3363 ?auto_3364 ?auto_3365 ?auto_3366 ?auto_3367 ?auto_3368 ) )
  )

)

