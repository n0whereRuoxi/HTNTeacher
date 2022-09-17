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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3170 - SURFACE
      ?auto_3171 - SURFACE
    )
    :vars
    (
      ?auto_3172 - HOIST
      ?auto_3173 - PLACE
      ?auto_3175 - PLACE
      ?auto_3176 - HOIST
      ?auto_3177 - SURFACE
      ?auto_3174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3172 ?auto_3173 ) ( SURFACE-AT ?auto_3170 ?auto_3173 ) ( CLEAR ?auto_3170 ) ( IS-CRATE ?auto_3171 ) ( AVAILABLE ?auto_3172 ) ( not ( = ?auto_3175 ?auto_3173 ) ) ( HOIST-AT ?auto_3176 ?auto_3175 ) ( AVAILABLE ?auto_3176 ) ( SURFACE-AT ?auto_3171 ?auto_3175 ) ( ON ?auto_3171 ?auto_3177 ) ( CLEAR ?auto_3171 ) ( TRUCK-AT ?auto_3174 ?auto_3173 ) ( not ( = ?auto_3170 ?auto_3171 ) ) ( not ( = ?auto_3170 ?auto_3177 ) ) ( not ( = ?auto_3171 ?auto_3177 ) ) ( not ( = ?auto_3172 ?auto_3176 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3174 ?auto_3173 ?auto_3175 )
      ( !LIFT ?auto_3176 ?auto_3171 ?auto_3177 ?auto_3175 )
      ( !LOAD ?auto_3176 ?auto_3171 ?auto_3174 ?auto_3175 )
      ( !DRIVE ?auto_3174 ?auto_3175 ?auto_3173 )
      ( !UNLOAD ?auto_3172 ?auto_3171 ?auto_3174 ?auto_3173 )
      ( !DROP ?auto_3172 ?auto_3171 ?auto_3170 ?auto_3173 )
      ( MAKE-1CRATE-VERIFY ?auto_3170 ?auto_3171 ) )
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
      ?auto_3189 - HOIST
      ?auto_3186 - PLACE
      ?auto_3185 - PLACE
      ?auto_3184 - HOIST
      ?auto_3188 - SURFACE
      ?auto_3191 - PLACE
      ?auto_3192 - HOIST
      ?auto_3190 - SURFACE
      ?auto_3187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3189 ?auto_3186 ) ( IS-CRATE ?auto_3183 ) ( not ( = ?auto_3185 ?auto_3186 ) ) ( HOIST-AT ?auto_3184 ?auto_3185 ) ( AVAILABLE ?auto_3184 ) ( SURFACE-AT ?auto_3183 ?auto_3185 ) ( ON ?auto_3183 ?auto_3188 ) ( CLEAR ?auto_3183 ) ( not ( = ?auto_3182 ?auto_3183 ) ) ( not ( = ?auto_3182 ?auto_3188 ) ) ( not ( = ?auto_3183 ?auto_3188 ) ) ( not ( = ?auto_3189 ?auto_3184 ) ) ( SURFACE-AT ?auto_3181 ?auto_3186 ) ( CLEAR ?auto_3181 ) ( IS-CRATE ?auto_3182 ) ( AVAILABLE ?auto_3189 ) ( not ( = ?auto_3191 ?auto_3186 ) ) ( HOIST-AT ?auto_3192 ?auto_3191 ) ( AVAILABLE ?auto_3192 ) ( SURFACE-AT ?auto_3182 ?auto_3191 ) ( ON ?auto_3182 ?auto_3190 ) ( CLEAR ?auto_3182 ) ( TRUCK-AT ?auto_3187 ?auto_3186 ) ( not ( = ?auto_3181 ?auto_3182 ) ) ( not ( = ?auto_3181 ?auto_3190 ) ) ( not ( = ?auto_3182 ?auto_3190 ) ) ( not ( = ?auto_3189 ?auto_3192 ) ) ( not ( = ?auto_3181 ?auto_3183 ) ) ( not ( = ?auto_3181 ?auto_3188 ) ) ( not ( = ?auto_3183 ?auto_3190 ) ) ( not ( = ?auto_3185 ?auto_3191 ) ) ( not ( = ?auto_3184 ?auto_3192 ) ) ( not ( = ?auto_3188 ?auto_3190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3181 ?auto_3182 )
      ( MAKE-1CRATE ?auto_3182 ?auto_3183 )
      ( MAKE-2CRATE-VERIFY ?auto_3181 ?auto_3182 ?auto_3183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3195 - SURFACE
      ?auto_3196 - SURFACE
    )
    :vars
    (
      ?auto_3197 - HOIST
      ?auto_3198 - PLACE
      ?auto_3200 - PLACE
      ?auto_3201 - HOIST
      ?auto_3202 - SURFACE
      ?auto_3199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3197 ?auto_3198 ) ( SURFACE-AT ?auto_3195 ?auto_3198 ) ( CLEAR ?auto_3195 ) ( IS-CRATE ?auto_3196 ) ( AVAILABLE ?auto_3197 ) ( not ( = ?auto_3200 ?auto_3198 ) ) ( HOIST-AT ?auto_3201 ?auto_3200 ) ( AVAILABLE ?auto_3201 ) ( SURFACE-AT ?auto_3196 ?auto_3200 ) ( ON ?auto_3196 ?auto_3202 ) ( CLEAR ?auto_3196 ) ( TRUCK-AT ?auto_3199 ?auto_3198 ) ( not ( = ?auto_3195 ?auto_3196 ) ) ( not ( = ?auto_3195 ?auto_3202 ) ) ( not ( = ?auto_3196 ?auto_3202 ) ) ( not ( = ?auto_3197 ?auto_3201 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3199 ?auto_3198 ?auto_3200 )
      ( !LIFT ?auto_3201 ?auto_3196 ?auto_3202 ?auto_3200 )
      ( !LOAD ?auto_3201 ?auto_3196 ?auto_3199 ?auto_3200 )
      ( !DRIVE ?auto_3199 ?auto_3200 ?auto_3198 )
      ( !UNLOAD ?auto_3197 ?auto_3196 ?auto_3199 ?auto_3198 )
      ( !DROP ?auto_3197 ?auto_3196 ?auto_3195 ?auto_3198 )
      ( MAKE-1CRATE-VERIFY ?auto_3195 ?auto_3196 ) )
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
      ?auto_3216 - HOIST
      ?auto_3214 - PLACE
      ?auto_3215 - PLACE
      ?auto_3212 - HOIST
      ?auto_3211 - SURFACE
      ?auto_3222 - PLACE
      ?auto_3217 - HOIST
      ?auto_3218 - SURFACE
      ?auto_3220 - PLACE
      ?auto_3219 - HOIST
      ?auto_3221 - SURFACE
      ?auto_3213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3216 ?auto_3214 ) ( IS-CRATE ?auto_3210 ) ( not ( = ?auto_3215 ?auto_3214 ) ) ( HOIST-AT ?auto_3212 ?auto_3215 ) ( AVAILABLE ?auto_3212 ) ( SURFACE-AT ?auto_3210 ?auto_3215 ) ( ON ?auto_3210 ?auto_3211 ) ( CLEAR ?auto_3210 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3211 ) ) ( not ( = ?auto_3210 ?auto_3211 ) ) ( not ( = ?auto_3216 ?auto_3212 ) ) ( IS-CRATE ?auto_3209 ) ( not ( = ?auto_3222 ?auto_3214 ) ) ( HOIST-AT ?auto_3217 ?auto_3222 ) ( AVAILABLE ?auto_3217 ) ( SURFACE-AT ?auto_3209 ?auto_3222 ) ( ON ?auto_3209 ?auto_3218 ) ( CLEAR ?auto_3209 ) ( not ( = ?auto_3208 ?auto_3209 ) ) ( not ( = ?auto_3208 ?auto_3218 ) ) ( not ( = ?auto_3209 ?auto_3218 ) ) ( not ( = ?auto_3216 ?auto_3217 ) ) ( SURFACE-AT ?auto_3207 ?auto_3214 ) ( CLEAR ?auto_3207 ) ( IS-CRATE ?auto_3208 ) ( AVAILABLE ?auto_3216 ) ( not ( = ?auto_3220 ?auto_3214 ) ) ( HOIST-AT ?auto_3219 ?auto_3220 ) ( AVAILABLE ?auto_3219 ) ( SURFACE-AT ?auto_3208 ?auto_3220 ) ( ON ?auto_3208 ?auto_3221 ) ( CLEAR ?auto_3208 ) ( TRUCK-AT ?auto_3213 ?auto_3214 ) ( not ( = ?auto_3207 ?auto_3208 ) ) ( not ( = ?auto_3207 ?auto_3221 ) ) ( not ( = ?auto_3208 ?auto_3221 ) ) ( not ( = ?auto_3216 ?auto_3219 ) ) ( not ( = ?auto_3207 ?auto_3209 ) ) ( not ( = ?auto_3207 ?auto_3218 ) ) ( not ( = ?auto_3209 ?auto_3221 ) ) ( not ( = ?auto_3222 ?auto_3220 ) ) ( not ( = ?auto_3217 ?auto_3219 ) ) ( not ( = ?auto_3218 ?auto_3221 ) ) ( not ( = ?auto_3207 ?auto_3210 ) ) ( not ( = ?auto_3207 ?auto_3211 ) ) ( not ( = ?auto_3208 ?auto_3210 ) ) ( not ( = ?auto_3208 ?auto_3211 ) ) ( not ( = ?auto_3210 ?auto_3218 ) ) ( not ( = ?auto_3210 ?auto_3221 ) ) ( not ( = ?auto_3215 ?auto_3222 ) ) ( not ( = ?auto_3215 ?auto_3220 ) ) ( not ( = ?auto_3212 ?auto_3217 ) ) ( not ( = ?auto_3212 ?auto_3219 ) ) ( not ( = ?auto_3211 ?auto_3218 ) ) ( not ( = ?auto_3211 ?auto_3221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3207 ?auto_3208 ?auto_3209 )
      ( MAKE-1CRATE ?auto_3209 ?auto_3210 )
      ( MAKE-3CRATE-VERIFY ?auto_3207 ?auto_3208 ?auto_3209 ?auto_3210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3225 - SURFACE
      ?auto_3226 - SURFACE
    )
    :vars
    (
      ?auto_3227 - HOIST
      ?auto_3228 - PLACE
      ?auto_3230 - PLACE
      ?auto_3231 - HOIST
      ?auto_3232 - SURFACE
      ?auto_3229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3227 ?auto_3228 ) ( SURFACE-AT ?auto_3225 ?auto_3228 ) ( CLEAR ?auto_3225 ) ( IS-CRATE ?auto_3226 ) ( AVAILABLE ?auto_3227 ) ( not ( = ?auto_3230 ?auto_3228 ) ) ( HOIST-AT ?auto_3231 ?auto_3230 ) ( AVAILABLE ?auto_3231 ) ( SURFACE-AT ?auto_3226 ?auto_3230 ) ( ON ?auto_3226 ?auto_3232 ) ( CLEAR ?auto_3226 ) ( TRUCK-AT ?auto_3229 ?auto_3228 ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( not ( = ?auto_3225 ?auto_3232 ) ) ( not ( = ?auto_3226 ?auto_3232 ) ) ( not ( = ?auto_3227 ?auto_3231 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3229 ?auto_3228 ?auto_3230 )
      ( !LIFT ?auto_3231 ?auto_3226 ?auto_3232 ?auto_3230 )
      ( !LOAD ?auto_3231 ?auto_3226 ?auto_3229 ?auto_3230 )
      ( !DRIVE ?auto_3229 ?auto_3230 ?auto_3228 )
      ( !UNLOAD ?auto_3227 ?auto_3226 ?auto_3229 ?auto_3228 )
      ( !DROP ?auto_3227 ?auto_3226 ?auto_3225 ?auto_3228 )
      ( MAKE-1CRATE-VERIFY ?auto_3225 ?auto_3226 ) )
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
      ?auto_3246 - PLACE
      ?auto_3248 - PLACE
      ?auto_3243 - HOIST
      ?auto_3244 - SURFACE
      ?auto_3257 - PLACE
      ?auto_3256 - HOIST
      ?auto_3254 - SURFACE
      ?auto_3249 - PLACE
      ?auto_3255 - HOIST
      ?auto_3253 - SURFACE
      ?auto_3252 - PLACE
      ?auto_3250 - HOIST
      ?auto_3251 - SURFACE
      ?auto_3245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3247 ?auto_3246 ) ( IS-CRATE ?auto_3242 ) ( not ( = ?auto_3248 ?auto_3246 ) ) ( HOIST-AT ?auto_3243 ?auto_3248 ) ( AVAILABLE ?auto_3243 ) ( SURFACE-AT ?auto_3242 ?auto_3248 ) ( ON ?auto_3242 ?auto_3244 ) ( CLEAR ?auto_3242 ) ( not ( = ?auto_3241 ?auto_3242 ) ) ( not ( = ?auto_3241 ?auto_3244 ) ) ( not ( = ?auto_3242 ?auto_3244 ) ) ( not ( = ?auto_3247 ?auto_3243 ) ) ( IS-CRATE ?auto_3241 ) ( not ( = ?auto_3257 ?auto_3246 ) ) ( HOIST-AT ?auto_3256 ?auto_3257 ) ( AVAILABLE ?auto_3256 ) ( SURFACE-AT ?auto_3241 ?auto_3257 ) ( ON ?auto_3241 ?auto_3254 ) ( CLEAR ?auto_3241 ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( not ( = ?auto_3240 ?auto_3254 ) ) ( not ( = ?auto_3241 ?auto_3254 ) ) ( not ( = ?auto_3247 ?auto_3256 ) ) ( IS-CRATE ?auto_3240 ) ( not ( = ?auto_3249 ?auto_3246 ) ) ( HOIST-AT ?auto_3255 ?auto_3249 ) ( AVAILABLE ?auto_3255 ) ( SURFACE-AT ?auto_3240 ?auto_3249 ) ( ON ?auto_3240 ?auto_3253 ) ( CLEAR ?auto_3240 ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( not ( = ?auto_3239 ?auto_3253 ) ) ( not ( = ?auto_3240 ?auto_3253 ) ) ( not ( = ?auto_3247 ?auto_3255 ) ) ( SURFACE-AT ?auto_3238 ?auto_3246 ) ( CLEAR ?auto_3238 ) ( IS-CRATE ?auto_3239 ) ( AVAILABLE ?auto_3247 ) ( not ( = ?auto_3252 ?auto_3246 ) ) ( HOIST-AT ?auto_3250 ?auto_3252 ) ( AVAILABLE ?auto_3250 ) ( SURFACE-AT ?auto_3239 ?auto_3252 ) ( ON ?auto_3239 ?auto_3251 ) ( CLEAR ?auto_3239 ) ( TRUCK-AT ?auto_3245 ?auto_3246 ) ( not ( = ?auto_3238 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3251 ) ) ( not ( = ?auto_3239 ?auto_3251 ) ) ( not ( = ?auto_3247 ?auto_3250 ) ) ( not ( = ?auto_3238 ?auto_3240 ) ) ( not ( = ?auto_3238 ?auto_3253 ) ) ( not ( = ?auto_3240 ?auto_3251 ) ) ( not ( = ?auto_3249 ?auto_3252 ) ) ( not ( = ?auto_3255 ?auto_3250 ) ) ( not ( = ?auto_3253 ?auto_3251 ) ) ( not ( = ?auto_3238 ?auto_3241 ) ) ( not ( = ?auto_3238 ?auto_3254 ) ) ( not ( = ?auto_3239 ?auto_3241 ) ) ( not ( = ?auto_3239 ?auto_3254 ) ) ( not ( = ?auto_3241 ?auto_3253 ) ) ( not ( = ?auto_3241 ?auto_3251 ) ) ( not ( = ?auto_3257 ?auto_3249 ) ) ( not ( = ?auto_3257 ?auto_3252 ) ) ( not ( = ?auto_3256 ?auto_3255 ) ) ( not ( = ?auto_3256 ?auto_3250 ) ) ( not ( = ?auto_3254 ?auto_3253 ) ) ( not ( = ?auto_3254 ?auto_3251 ) ) ( not ( = ?auto_3238 ?auto_3242 ) ) ( not ( = ?auto_3238 ?auto_3244 ) ) ( not ( = ?auto_3239 ?auto_3242 ) ) ( not ( = ?auto_3239 ?auto_3244 ) ) ( not ( = ?auto_3240 ?auto_3242 ) ) ( not ( = ?auto_3240 ?auto_3244 ) ) ( not ( = ?auto_3242 ?auto_3254 ) ) ( not ( = ?auto_3242 ?auto_3253 ) ) ( not ( = ?auto_3242 ?auto_3251 ) ) ( not ( = ?auto_3248 ?auto_3257 ) ) ( not ( = ?auto_3248 ?auto_3249 ) ) ( not ( = ?auto_3248 ?auto_3252 ) ) ( not ( = ?auto_3243 ?auto_3256 ) ) ( not ( = ?auto_3243 ?auto_3255 ) ) ( not ( = ?auto_3243 ?auto_3250 ) ) ( not ( = ?auto_3244 ?auto_3254 ) ) ( not ( = ?auto_3244 ?auto_3253 ) ) ( not ( = ?auto_3244 ?auto_3251 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3238 ?auto_3239 ?auto_3240 ?auto_3241 )
      ( MAKE-1CRATE ?auto_3241 ?auto_3242 )
      ( MAKE-4CRATE-VERIFY ?auto_3238 ?auto_3239 ?auto_3240 ?auto_3241 ?auto_3242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3260 - SURFACE
      ?auto_3261 - SURFACE
    )
    :vars
    (
      ?auto_3262 - HOIST
      ?auto_3263 - PLACE
      ?auto_3265 - PLACE
      ?auto_3266 - HOIST
      ?auto_3267 - SURFACE
      ?auto_3264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3262 ?auto_3263 ) ( SURFACE-AT ?auto_3260 ?auto_3263 ) ( CLEAR ?auto_3260 ) ( IS-CRATE ?auto_3261 ) ( AVAILABLE ?auto_3262 ) ( not ( = ?auto_3265 ?auto_3263 ) ) ( HOIST-AT ?auto_3266 ?auto_3265 ) ( AVAILABLE ?auto_3266 ) ( SURFACE-AT ?auto_3261 ?auto_3265 ) ( ON ?auto_3261 ?auto_3267 ) ( CLEAR ?auto_3261 ) ( TRUCK-AT ?auto_3264 ?auto_3263 ) ( not ( = ?auto_3260 ?auto_3261 ) ) ( not ( = ?auto_3260 ?auto_3267 ) ) ( not ( = ?auto_3261 ?auto_3267 ) ) ( not ( = ?auto_3262 ?auto_3266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3264 ?auto_3263 ?auto_3265 )
      ( !LIFT ?auto_3266 ?auto_3261 ?auto_3267 ?auto_3265 )
      ( !LOAD ?auto_3266 ?auto_3261 ?auto_3264 ?auto_3265 )
      ( !DRIVE ?auto_3264 ?auto_3265 ?auto_3263 )
      ( !UNLOAD ?auto_3262 ?auto_3261 ?auto_3264 ?auto_3263 )
      ( !DROP ?auto_3262 ?auto_3261 ?auto_3260 ?auto_3263 )
      ( MAKE-1CRATE-VERIFY ?auto_3260 ?auto_3261 ) )
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
      ?auto_3281 - PLACE
      ?auto_3285 - PLACE
      ?auto_3282 - HOIST
      ?auto_3284 - SURFACE
      ?auto_3286 - PLACE
      ?auto_3288 - HOIST
      ?auto_3289 - SURFACE
      ?auto_3293 - PLACE
      ?auto_3297 - HOIST
      ?auto_3290 - SURFACE
      ?auto_3291 - PLACE
      ?auto_3296 - HOIST
      ?auto_3287 - SURFACE
      ?auto_3295 - PLACE
      ?auto_3294 - HOIST
      ?auto_3292 - SURFACE
      ?auto_3283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3280 ?auto_3281 ) ( IS-CRATE ?auto_3279 ) ( not ( = ?auto_3285 ?auto_3281 ) ) ( HOIST-AT ?auto_3282 ?auto_3285 ) ( AVAILABLE ?auto_3282 ) ( SURFACE-AT ?auto_3279 ?auto_3285 ) ( ON ?auto_3279 ?auto_3284 ) ( CLEAR ?auto_3279 ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3284 ) ) ( not ( = ?auto_3279 ?auto_3284 ) ) ( not ( = ?auto_3280 ?auto_3282 ) ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3286 ?auto_3281 ) ) ( HOIST-AT ?auto_3288 ?auto_3286 ) ( AVAILABLE ?auto_3288 ) ( SURFACE-AT ?auto_3278 ?auto_3286 ) ( ON ?auto_3278 ?auto_3289 ) ( CLEAR ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( not ( = ?auto_3277 ?auto_3289 ) ) ( not ( = ?auto_3278 ?auto_3289 ) ) ( not ( = ?auto_3280 ?auto_3288 ) ) ( IS-CRATE ?auto_3277 ) ( not ( = ?auto_3293 ?auto_3281 ) ) ( HOIST-AT ?auto_3297 ?auto_3293 ) ( AVAILABLE ?auto_3297 ) ( SURFACE-AT ?auto_3277 ?auto_3293 ) ( ON ?auto_3277 ?auto_3290 ) ( CLEAR ?auto_3277 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3290 ) ) ( not ( = ?auto_3277 ?auto_3290 ) ) ( not ( = ?auto_3280 ?auto_3297 ) ) ( IS-CRATE ?auto_3276 ) ( not ( = ?auto_3291 ?auto_3281 ) ) ( HOIST-AT ?auto_3296 ?auto_3291 ) ( AVAILABLE ?auto_3296 ) ( SURFACE-AT ?auto_3276 ?auto_3291 ) ( ON ?auto_3276 ?auto_3287 ) ( CLEAR ?auto_3276 ) ( not ( = ?auto_3275 ?auto_3276 ) ) ( not ( = ?auto_3275 ?auto_3287 ) ) ( not ( = ?auto_3276 ?auto_3287 ) ) ( not ( = ?auto_3280 ?auto_3296 ) ) ( SURFACE-AT ?auto_3274 ?auto_3281 ) ( CLEAR ?auto_3274 ) ( IS-CRATE ?auto_3275 ) ( AVAILABLE ?auto_3280 ) ( not ( = ?auto_3295 ?auto_3281 ) ) ( HOIST-AT ?auto_3294 ?auto_3295 ) ( AVAILABLE ?auto_3294 ) ( SURFACE-AT ?auto_3275 ?auto_3295 ) ( ON ?auto_3275 ?auto_3292 ) ( CLEAR ?auto_3275 ) ( TRUCK-AT ?auto_3283 ?auto_3281 ) ( not ( = ?auto_3274 ?auto_3275 ) ) ( not ( = ?auto_3274 ?auto_3292 ) ) ( not ( = ?auto_3275 ?auto_3292 ) ) ( not ( = ?auto_3280 ?auto_3294 ) ) ( not ( = ?auto_3274 ?auto_3276 ) ) ( not ( = ?auto_3274 ?auto_3287 ) ) ( not ( = ?auto_3276 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3295 ) ) ( not ( = ?auto_3296 ?auto_3294 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3277 ) ) ( not ( = ?auto_3274 ?auto_3290 ) ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( not ( = ?auto_3275 ?auto_3290 ) ) ( not ( = ?auto_3277 ?auto_3287 ) ) ( not ( = ?auto_3277 ?auto_3292 ) ) ( not ( = ?auto_3293 ?auto_3291 ) ) ( not ( = ?auto_3293 ?auto_3295 ) ) ( not ( = ?auto_3297 ?auto_3296 ) ) ( not ( = ?auto_3297 ?auto_3294 ) ) ( not ( = ?auto_3290 ?auto_3287 ) ) ( not ( = ?auto_3290 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3278 ) ) ( not ( = ?auto_3274 ?auto_3289 ) ) ( not ( = ?auto_3275 ?auto_3278 ) ) ( not ( = ?auto_3275 ?auto_3289 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( not ( = ?auto_3276 ?auto_3289 ) ) ( not ( = ?auto_3278 ?auto_3290 ) ) ( not ( = ?auto_3278 ?auto_3287 ) ) ( not ( = ?auto_3278 ?auto_3292 ) ) ( not ( = ?auto_3286 ?auto_3293 ) ) ( not ( = ?auto_3286 ?auto_3291 ) ) ( not ( = ?auto_3286 ?auto_3295 ) ) ( not ( = ?auto_3288 ?auto_3297 ) ) ( not ( = ?auto_3288 ?auto_3296 ) ) ( not ( = ?auto_3288 ?auto_3294 ) ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( not ( = ?auto_3289 ?auto_3287 ) ) ( not ( = ?auto_3289 ?auto_3292 ) ) ( not ( = ?auto_3274 ?auto_3279 ) ) ( not ( = ?auto_3274 ?auto_3284 ) ) ( not ( = ?auto_3275 ?auto_3279 ) ) ( not ( = ?auto_3275 ?auto_3284 ) ) ( not ( = ?auto_3276 ?auto_3279 ) ) ( not ( = ?auto_3276 ?auto_3284 ) ) ( not ( = ?auto_3277 ?auto_3279 ) ) ( not ( = ?auto_3277 ?auto_3284 ) ) ( not ( = ?auto_3279 ?auto_3289 ) ) ( not ( = ?auto_3279 ?auto_3290 ) ) ( not ( = ?auto_3279 ?auto_3287 ) ) ( not ( = ?auto_3279 ?auto_3292 ) ) ( not ( = ?auto_3285 ?auto_3286 ) ) ( not ( = ?auto_3285 ?auto_3293 ) ) ( not ( = ?auto_3285 ?auto_3291 ) ) ( not ( = ?auto_3285 ?auto_3295 ) ) ( not ( = ?auto_3282 ?auto_3288 ) ) ( not ( = ?auto_3282 ?auto_3297 ) ) ( not ( = ?auto_3282 ?auto_3296 ) ) ( not ( = ?auto_3282 ?auto_3294 ) ) ( not ( = ?auto_3284 ?auto_3289 ) ) ( not ( = ?auto_3284 ?auto_3290 ) ) ( not ( = ?auto_3284 ?auto_3287 ) ) ( not ( = ?auto_3284 ?auto_3292 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-1CRATE ?auto_3278 ?auto_3279 )
      ( MAKE-5CRATE-VERIFY ?auto_3274 ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 ?auto_3279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3300 - SURFACE
      ?auto_3301 - SURFACE
    )
    :vars
    (
      ?auto_3302 - HOIST
      ?auto_3303 - PLACE
      ?auto_3305 - PLACE
      ?auto_3306 - HOIST
      ?auto_3307 - SURFACE
      ?auto_3304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3302 ?auto_3303 ) ( SURFACE-AT ?auto_3300 ?auto_3303 ) ( CLEAR ?auto_3300 ) ( IS-CRATE ?auto_3301 ) ( AVAILABLE ?auto_3302 ) ( not ( = ?auto_3305 ?auto_3303 ) ) ( HOIST-AT ?auto_3306 ?auto_3305 ) ( AVAILABLE ?auto_3306 ) ( SURFACE-AT ?auto_3301 ?auto_3305 ) ( ON ?auto_3301 ?auto_3307 ) ( CLEAR ?auto_3301 ) ( TRUCK-AT ?auto_3304 ?auto_3303 ) ( not ( = ?auto_3300 ?auto_3301 ) ) ( not ( = ?auto_3300 ?auto_3307 ) ) ( not ( = ?auto_3301 ?auto_3307 ) ) ( not ( = ?auto_3302 ?auto_3306 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3304 ?auto_3303 ?auto_3305 )
      ( !LIFT ?auto_3306 ?auto_3301 ?auto_3307 ?auto_3305 )
      ( !LOAD ?auto_3306 ?auto_3301 ?auto_3304 ?auto_3305 )
      ( !DRIVE ?auto_3304 ?auto_3305 ?auto_3303 )
      ( !UNLOAD ?auto_3302 ?auto_3301 ?auto_3304 ?auto_3303 )
      ( !DROP ?auto_3302 ?auto_3301 ?auto_3300 ?auto_3303 )
      ( MAKE-1CRATE-VERIFY ?auto_3300 ?auto_3301 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3315 - SURFACE
      ?auto_3316 - SURFACE
      ?auto_3317 - SURFACE
      ?auto_3318 - SURFACE
      ?auto_3319 - SURFACE
      ?auto_3321 - SURFACE
      ?auto_3320 - SURFACE
    )
    :vars
    (
      ?auto_3324 - HOIST
      ?auto_3325 - PLACE
      ?auto_3327 - PLACE
      ?auto_3323 - HOIST
      ?auto_3326 - SURFACE
      ?auto_3330 - PLACE
      ?auto_3329 - HOIST
      ?auto_3331 - SURFACE
      ?auto_3336 - PLACE
      ?auto_3340 - HOIST
      ?auto_3332 - SURFACE
      ?auto_3342 - PLACE
      ?auto_3328 - HOIST
      ?auto_3339 - SURFACE
      ?auto_3338 - PLACE
      ?auto_3335 - HOIST
      ?auto_3333 - SURFACE
      ?auto_3334 - PLACE
      ?auto_3341 - HOIST
      ?auto_3337 - SURFACE
      ?auto_3322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3324 ?auto_3325 ) ( IS-CRATE ?auto_3320 ) ( not ( = ?auto_3327 ?auto_3325 ) ) ( HOIST-AT ?auto_3323 ?auto_3327 ) ( AVAILABLE ?auto_3323 ) ( SURFACE-AT ?auto_3320 ?auto_3327 ) ( ON ?auto_3320 ?auto_3326 ) ( CLEAR ?auto_3320 ) ( not ( = ?auto_3321 ?auto_3320 ) ) ( not ( = ?auto_3321 ?auto_3326 ) ) ( not ( = ?auto_3320 ?auto_3326 ) ) ( not ( = ?auto_3324 ?auto_3323 ) ) ( IS-CRATE ?auto_3321 ) ( not ( = ?auto_3330 ?auto_3325 ) ) ( HOIST-AT ?auto_3329 ?auto_3330 ) ( AVAILABLE ?auto_3329 ) ( SURFACE-AT ?auto_3321 ?auto_3330 ) ( ON ?auto_3321 ?auto_3331 ) ( CLEAR ?auto_3321 ) ( not ( = ?auto_3319 ?auto_3321 ) ) ( not ( = ?auto_3319 ?auto_3331 ) ) ( not ( = ?auto_3321 ?auto_3331 ) ) ( not ( = ?auto_3324 ?auto_3329 ) ) ( IS-CRATE ?auto_3319 ) ( not ( = ?auto_3336 ?auto_3325 ) ) ( HOIST-AT ?auto_3340 ?auto_3336 ) ( AVAILABLE ?auto_3340 ) ( SURFACE-AT ?auto_3319 ?auto_3336 ) ( ON ?auto_3319 ?auto_3332 ) ( CLEAR ?auto_3319 ) ( not ( = ?auto_3318 ?auto_3319 ) ) ( not ( = ?auto_3318 ?auto_3332 ) ) ( not ( = ?auto_3319 ?auto_3332 ) ) ( not ( = ?auto_3324 ?auto_3340 ) ) ( IS-CRATE ?auto_3318 ) ( not ( = ?auto_3342 ?auto_3325 ) ) ( HOIST-AT ?auto_3328 ?auto_3342 ) ( AVAILABLE ?auto_3328 ) ( SURFACE-AT ?auto_3318 ?auto_3342 ) ( ON ?auto_3318 ?auto_3339 ) ( CLEAR ?auto_3318 ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( not ( = ?auto_3317 ?auto_3339 ) ) ( not ( = ?auto_3318 ?auto_3339 ) ) ( not ( = ?auto_3324 ?auto_3328 ) ) ( IS-CRATE ?auto_3317 ) ( not ( = ?auto_3338 ?auto_3325 ) ) ( HOIST-AT ?auto_3335 ?auto_3338 ) ( AVAILABLE ?auto_3335 ) ( SURFACE-AT ?auto_3317 ?auto_3338 ) ( ON ?auto_3317 ?auto_3333 ) ( CLEAR ?auto_3317 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3333 ) ) ( not ( = ?auto_3317 ?auto_3333 ) ) ( not ( = ?auto_3324 ?auto_3335 ) ) ( SURFACE-AT ?auto_3315 ?auto_3325 ) ( CLEAR ?auto_3315 ) ( IS-CRATE ?auto_3316 ) ( AVAILABLE ?auto_3324 ) ( not ( = ?auto_3334 ?auto_3325 ) ) ( HOIST-AT ?auto_3341 ?auto_3334 ) ( AVAILABLE ?auto_3341 ) ( SURFACE-AT ?auto_3316 ?auto_3334 ) ( ON ?auto_3316 ?auto_3337 ) ( CLEAR ?auto_3316 ) ( TRUCK-AT ?auto_3322 ?auto_3325 ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3337 ) ) ( not ( = ?auto_3316 ?auto_3337 ) ) ( not ( = ?auto_3324 ?auto_3341 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3333 ) ) ( not ( = ?auto_3317 ?auto_3337 ) ) ( not ( = ?auto_3338 ?auto_3334 ) ) ( not ( = ?auto_3335 ?auto_3341 ) ) ( not ( = ?auto_3333 ?auto_3337 ) ) ( not ( = ?auto_3315 ?auto_3318 ) ) ( not ( = ?auto_3315 ?auto_3339 ) ) ( not ( = ?auto_3316 ?auto_3318 ) ) ( not ( = ?auto_3316 ?auto_3339 ) ) ( not ( = ?auto_3318 ?auto_3333 ) ) ( not ( = ?auto_3318 ?auto_3337 ) ) ( not ( = ?auto_3342 ?auto_3338 ) ) ( not ( = ?auto_3342 ?auto_3334 ) ) ( not ( = ?auto_3328 ?auto_3335 ) ) ( not ( = ?auto_3328 ?auto_3341 ) ) ( not ( = ?auto_3339 ?auto_3333 ) ) ( not ( = ?auto_3339 ?auto_3337 ) ) ( not ( = ?auto_3315 ?auto_3319 ) ) ( not ( = ?auto_3315 ?auto_3332 ) ) ( not ( = ?auto_3316 ?auto_3319 ) ) ( not ( = ?auto_3316 ?auto_3332 ) ) ( not ( = ?auto_3317 ?auto_3319 ) ) ( not ( = ?auto_3317 ?auto_3332 ) ) ( not ( = ?auto_3319 ?auto_3339 ) ) ( not ( = ?auto_3319 ?auto_3333 ) ) ( not ( = ?auto_3319 ?auto_3337 ) ) ( not ( = ?auto_3336 ?auto_3342 ) ) ( not ( = ?auto_3336 ?auto_3338 ) ) ( not ( = ?auto_3336 ?auto_3334 ) ) ( not ( = ?auto_3340 ?auto_3328 ) ) ( not ( = ?auto_3340 ?auto_3335 ) ) ( not ( = ?auto_3340 ?auto_3341 ) ) ( not ( = ?auto_3332 ?auto_3339 ) ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3337 ) ) ( not ( = ?auto_3315 ?auto_3321 ) ) ( not ( = ?auto_3315 ?auto_3331 ) ) ( not ( = ?auto_3316 ?auto_3321 ) ) ( not ( = ?auto_3316 ?auto_3331 ) ) ( not ( = ?auto_3317 ?auto_3321 ) ) ( not ( = ?auto_3317 ?auto_3331 ) ) ( not ( = ?auto_3318 ?auto_3321 ) ) ( not ( = ?auto_3318 ?auto_3331 ) ) ( not ( = ?auto_3321 ?auto_3332 ) ) ( not ( = ?auto_3321 ?auto_3339 ) ) ( not ( = ?auto_3321 ?auto_3333 ) ) ( not ( = ?auto_3321 ?auto_3337 ) ) ( not ( = ?auto_3330 ?auto_3336 ) ) ( not ( = ?auto_3330 ?auto_3342 ) ) ( not ( = ?auto_3330 ?auto_3338 ) ) ( not ( = ?auto_3330 ?auto_3334 ) ) ( not ( = ?auto_3329 ?auto_3340 ) ) ( not ( = ?auto_3329 ?auto_3328 ) ) ( not ( = ?auto_3329 ?auto_3335 ) ) ( not ( = ?auto_3329 ?auto_3341 ) ) ( not ( = ?auto_3331 ?auto_3332 ) ) ( not ( = ?auto_3331 ?auto_3339 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) ( not ( = ?auto_3331 ?auto_3337 ) ) ( not ( = ?auto_3315 ?auto_3320 ) ) ( not ( = ?auto_3315 ?auto_3326 ) ) ( not ( = ?auto_3316 ?auto_3320 ) ) ( not ( = ?auto_3316 ?auto_3326 ) ) ( not ( = ?auto_3317 ?auto_3320 ) ) ( not ( = ?auto_3317 ?auto_3326 ) ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( not ( = ?auto_3318 ?auto_3326 ) ) ( not ( = ?auto_3319 ?auto_3320 ) ) ( not ( = ?auto_3319 ?auto_3326 ) ) ( not ( = ?auto_3320 ?auto_3331 ) ) ( not ( = ?auto_3320 ?auto_3332 ) ) ( not ( = ?auto_3320 ?auto_3339 ) ) ( not ( = ?auto_3320 ?auto_3333 ) ) ( not ( = ?auto_3320 ?auto_3337 ) ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3327 ?auto_3336 ) ) ( not ( = ?auto_3327 ?auto_3342 ) ) ( not ( = ?auto_3327 ?auto_3338 ) ) ( not ( = ?auto_3327 ?auto_3334 ) ) ( not ( = ?auto_3323 ?auto_3329 ) ) ( not ( = ?auto_3323 ?auto_3340 ) ) ( not ( = ?auto_3323 ?auto_3328 ) ) ( not ( = ?auto_3323 ?auto_3335 ) ) ( not ( = ?auto_3323 ?auto_3341 ) ) ( not ( = ?auto_3326 ?auto_3331 ) ) ( not ( = ?auto_3326 ?auto_3332 ) ) ( not ( = ?auto_3326 ?auto_3339 ) ) ( not ( = ?auto_3326 ?auto_3333 ) ) ( not ( = ?auto_3326 ?auto_3337 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3315 ?auto_3316 ?auto_3317 ?auto_3318 ?auto_3319 ?auto_3321 )
      ( MAKE-1CRATE ?auto_3321 ?auto_3320 )
      ( MAKE-6CRATE-VERIFY ?auto_3315 ?auto_3316 ?auto_3317 ?auto_3318 ?auto_3319 ?auto_3321 ?auto_3320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3345 - SURFACE
      ?auto_3346 - SURFACE
    )
    :vars
    (
      ?auto_3347 - HOIST
      ?auto_3348 - PLACE
      ?auto_3350 - PLACE
      ?auto_3351 - HOIST
      ?auto_3352 - SURFACE
      ?auto_3349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3347 ?auto_3348 ) ( SURFACE-AT ?auto_3345 ?auto_3348 ) ( CLEAR ?auto_3345 ) ( IS-CRATE ?auto_3346 ) ( AVAILABLE ?auto_3347 ) ( not ( = ?auto_3350 ?auto_3348 ) ) ( HOIST-AT ?auto_3351 ?auto_3350 ) ( AVAILABLE ?auto_3351 ) ( SURFACE-AT ?auto_3346 ?auto_3350 ) ( ON ?auto_3346 ?auto_3352 ) ( CLEAR ?auto_3346 ) ( TRUCK-AT ?auto_3349 ?auto_3348 ) ( not ( = ?auto_3345 ?auto_3346 ) ) ( not ( = ?auto_3345 ?auto_3352 ) ) ( not ( = ?auto_3346 ?auto_3352 ) ) ( not ( = ?auto_3347 ?auto_3351 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3349 ?auto_3348 ?auto_3350 )
      ( !LIFT ?auto_3351 ?auto_3346 ?auto_3352 ?auto_3350 )
      ( !LOAD ?auto_3351 ?auto_3346 ?auto_3349 ?auto_3350 )
      ( !DRIVE ?auto_3349 ?auto_3350 ?auto_3348 )
      ( !UNLOAD ?auto_3347 ?auto_3346 ?auto_3349 ?auto_3348 )
      ( !DROP ?auto_3347 ?auto_3346 ?auto_3345 ?auto_3348 )
      ( MAKE-1CRATE-VERIFY ?auto_3345 ?auto_3346 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3361 - SURFACE
      ?auto_3362 - SURFACE
      ?auto_3363 - SURFACE
      ?auto_3364 - SURFACE
      ?auto_3365 - SURFACE
      ?auto_3367 - SURFACE
      ?auto_3366 - SURFACE
      ?auto_3368 - SURFACE
    )
    :vars
    (
      ?auto_3371 - HOIST
      ?auto_3370 - PLACE
      ?auto_3369 - PLACE
      ?auto_3374 - HOIST
      ?auto_3372 - SURFACE
      ?auto_3380 - PLACE
      ?auto_3376 - HOIST
      ?auto_3381 - SURFACE
      ?auto_3378 - PLACE
      ?auto_3377 - HOIST
      ?auto_3375 - SURFACE
      ?auto_3383 - PLACE
      ?auto_3387 - HOIST
      ?auto_3392 - SURFACE
      ?auto_3379 - PLACE
      ?auto_3382 - HOIST
      ?auto_3386 - SURFACE
      ?auto_3384 - PLACE
      ?auto_3389 - HOIST
      ?auto_3391 - SURFACE
      ?auto_3390 - PLACE
      ?auto_3388 - HOIST
      ?auto_3385 - SURFACE
      ?auto_3373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3371 ?auto_3370 ) ( IS-CRATE ?auto_3368 ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( HOIST-AT ?auto_3374 ?auto_3369 ) ( AVAILABLE ?auto_3374 ) ( SURFACE-AT ?auto_3368 ?auto_3369 ) ( ON ?auto_3368 ?auto_3372 ) ( CLEAR ?auto_3368 ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3366 ?auto_3372 ) ) ( not ( = ?auto_3368 ?auto_3372 ) ) ( not ( = ?auto_3371 ?auto_3374 ) ) ( IS-CRATE ?auto_3366 ) ( not ( = ?auto_3380 ?auto_3370 ) ) ( HOIST-AT ?auto_3376 ?auto_3380 ) ( AVAILABLE ?auto_3376 ) ( SURFACE-AT ?auto_3366 ?auto_3380 ) ( ON ?auto_3366 ?auto_3381 ) ( CLEAR ?auto_3366 ) ( not ( = ?auto_3367 ?auto_3366 ) ) ( not ( = ?auto_3367 ?auto_3381 ) ) ( not ( = ?auto_3366 ?auto_3381 ) ) ( not ( = ?auto_3371 ?auto_3376 ) ) ( IS-CRATE ?auto_3367 ) ( not ( = ?auto_3378 ?auto_3370 ) ) ( HOIST-AT ?auto_3377 ?auto_3378 ) ( AVAILABLE ?auto_3377 ) ( SURFACE-AT ?auto_3367 ?auto_3378 ) ( ON ?auto_3367 ?auto_3375 ) ( CLEAR ?auto_3367 ) ( not ( = ?auto_3365 ?auto_3367 ) ) ( not ( = ?auto_3365 ?auto_3375 ) ) ( not ( = ?auto_3367 ?auto_3375 ) ) ( not ( = ?auto_3371 ?auto_3377 ) ) ( IS-CRATE ?auto_3365 ) ( not ( = ?auto_3383 ?auto_3370 ) ) ( HOIST-AT ?auto_3387 ?auto_3383 ) ( AVAILABLE ?auto_3387 ) ( SURFACE-AT ?auto_3365 ?auto_3383 ) ( ON ?auto_3365 ?auto_3392 ) ( CLEAR ?auto_3365 ) ( not ( = ?auto_3364 ?auto_3365 ) ) ( not ( = ?auto_3364 ?auto_3392 ) ) ( not ( = ?auto_3365 ?auto_3392 ) ) ( not ( = ?auto_3371 ?auto_3387 ) ) ( IS-CRATE ?auto_3364 ) ( not ( = ?auto_3379 ?auto_3370 ) ) ( HOIST-AT ?auto_3382 ?auto_3379 ) ( AVAILABLE ?auto_3382 ) ( SURFACE-AT ?auto_3364 ?auto_3379 ) ( ON ?auto_3364 ?auto_3386 ) ( CLEAR ?auto_3364 ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3386 ) ) ( not ( = ?auto_3364 ?auto_3386 ) ) ( not ( = ?auto_3371 ?auto_3382 ) ) ( IS-CRATE ?auto_3363 ) ( not ( = ?auto_3384 ?auto_3370 ) ) ( HOIST-AT ?auto_3389 ?auto_3384 ) ( AVAILABLE ?auto_3389 ) ( SURFACE-AT ?auto_3363 ?auto_3384 ) ( ON ?auto_3363 ?auto_3391 ) ( CLEAR ?auto_3363 ) ( not ( = ?auto_3362 ?auto_3363 ) ) ( not ( = ?auto_3362 ?auto_3391 ) ) ( not ( = ?auto_3363 ?auto_3391 ) ) ( not ( = ?auto_3371 ?auto_3389 ) ) ( SURFACE-AT ?auto_3361 ?auto_3370 ) ( CLEAR ?auto_3361 ) ( IS-CRATE ?auto_3362 ) ( AVAILABLE ?auto_3371 ) ( not ( = ?auto_3390 ?auto_3370 ) ) ( HOIST-AT ?auto_3388 ?auto_3390 ) ( AVAILABLE ?auto_3388 ) ( SURFACE-AT ?auto_3362 ?auto_3390 ) ( ON ?auto_3362 ?auto_3385 ) ( CLEAR ?auto_3362 ) ( TRUCK-AT ?auto_3373 ?auto_3370 ) ( not ( = ?auto_3361 ?auto_3362 ) ) ( not ( = ?auto_3361 ?auto_3385 ) ) ( not ( = ?auto_3362 ?auto_3385 ) ) ( not ( = ?auto_3371 ?auto_3388 ) ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3361 ?auto_3391 ) ) ( not ( = ?auto_3363 ?auto_3385 ) ) ( not ( = ?auto_3384 ?auto_3390 ) ) ( not ( = ?auto_3389 ?auto_3388 ) ) ( not ( = ?auto_3391 ?auto_3385 ) ) ( not ( = ?auto_3361 ?auto_3364 ) ) ( not ( = ?auto_3361 ?auto_3386 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3362 ?auto_3386 ) ) ( not ( = ?auto_3364 ?auto_3391 ) ) ( not ( = ?auto_3364 ?auto_3385 ) ) ( not ( = ?auto_3379 ?auto_3384 ) ) ( not ( = ?auto_3379 ?auto_3390 ) ) ( not ( = ?auto_3382 ?auto_3389 ) ) ( not ( = ?auto_3382 ?auto_3388 ) ) ( not ( = ?auto_3386 ?auto_3391 ) ) ( not ( = ?auto_3386 ?auto_3385 ) ) ( not ( = ?auto_3361 ?auto_3365 ) ) ( not ( = ?auto_3361 ?auto_3392 ) ) ( not ( = ?auto_3362 ?auto_3365 ) ) ( not ( = ?auto_3362 ?auto_3392 ) ) ( not ( = ?auto_3363 ?auto_3365 ) ) ( not ( = ?auto_3363 ?auto_3392 ) ) ( not ( = ?auto_3365 ?auto_3386 ) ) ( not ( = ?auto_3365 ?auto_3391 ) ) ( not ( = ?auto_3365 ?auto_3385 ) ) ( not ( = ?auto_3383 ?auto_3379 ) ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3390 ) ) ( not ( = ?auto_3387 ?auto_3382 ) ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3388 ) ) ( not ( = ?auto_3392 ?auto_3386 ) ) ( not ( = ?auto_3392 ?auto_3391 ) ) ( not ( = ?auto_3392 ?auto_3385 ) ) ( not ( = ?auto_3361 ?auto_3367 ) ) ( not ( = ?auto_3361 ?auto_3375 ) ) ( not ( = ?auto_3362 ?auto_3367 ) ) ( not ( = ?auto_3362 ?auto_3375 ) ) ( not ( = ?auto_3363 ?auto_3367 ) ) ( not ( = ?auto_3363 ?auto_3375 ) ) ( not ( = ?auto_3364 ?auto_3367 ) ) ( not ( = ?auto_3364 ?auto_3375 ) ) ( not ( = ?auto_3367 ?auto_3392 ) ) ( not ( = ?auto_3367 ?auto_3386 ) ) ( not ( = ?auto_3367 ?auto_3391 ) ) ( not ( = ?auto_3367 ?auto_3385 ) ) ( not ( = ?auto_3378 ?auto_3383 ) ) ( not ( = ?auto_3378 ?auto_3379 ) ) ( not ( = ?auto_3378 ?auto_3384 ) ) ( not ( = ?auto_3378 ?auto_3390 ) ) ( not ( = ?auto_3377 ?auto_3387 ) ) ( not ( = ?auto_3377 ?auto_3382 ) ) ( not ( = ?auto_3377 ?auto_3389 ) ) ( not ( = ?auto_3377 ?auto_3388 ) ) ( not ( = ?auto_3375 ?auto_3392 ) ) ( not ( = ?auto_3375 ?auto_3386 ) ) ( not ( = ?auto_3375 ?auto_3391 ) ) ( not ( = ?auto_3375 ?auto_3385 ) ) ( not ( = ?auto_3361 ?auto_3366 ) ) ( not ( = ?auto_3361 ?auto_3381 ) ) ( not ( = ?auto_3362 ?auto_3366 ) ) ( not ( = ?auto_3362 ?auto_3381 ) ) ( not ( = ?auto_3363 ?auto_3366 ) ) ( not ( = ?auto_3363 ?auto_3381 ) ) ( not ( = ?auto_3364 ?auto_3366 ) ) ( not ( = ?auto_3364 ?auto_3381 ) ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( not ( = ?auto_3365 ?auto_3381 ) ) ( not ( = ?auto_3366 ?auto_3375 ) ) ( not ( = ?auto_3366 ?auto_3392 ) ) ( not ( = ?auto_3366 ?auto_3386 ) ) ( not ( = ?auto_3366 ?auto_3391 ) ) ( not ( = ?auto_3366 ?auto_3385 ) ) ( not ( = ?auto_3380 ?auto_3378 ) ) ( not ( = ?auto_3380 ?auto_3383 ) ) ( not ( = ?auto_3380 ?auto_3379 ) ) ( not ( = ?auto_3380 ?auto_3384 ) ) ( not ( = ?auto_3380 ?auto_3390 ) ) ( not ( = ?auto_3376 ?auto_3377 ) ) ( not ( = ?auto_3376 ?auto_3387 ) ) ( not ( = ?auto_3376 ?auto_3382 ) ) ( not ( = ?auto_3376 ?auto_3389 ) ) ( not ( = ?auto_3376 ?auto_3388 ) ) ( not ( = ?auto_3381 ?auto_3375 ) ) ( not ( = ?auto_3381 ?auto_3392 ) ) ( not ( = ?auto_3381 ?auto_3386 ) ) ( not ( = ?auto_3381 ?auto_3391 ) ) ( not ( = ?auto_3381 ?auto_3385 ) ) ( not ( = ?auto_3361 ?auto_3368 ) ) ( not ( = ?auto_3361 ?auto_3372 ) ) ( not ( = ?auto_3362 ?auto_3368 ) ) ( not ( = ?auto_3362 ?auto_3372 ) ) ( not ( = ?auto_3363 ?auto_3368 ) ) ( not ( = ?auto_3363 ?auto_3372 ) ) ( not ( = ?auto_3364 ?auto_3368 ) ) ( not ( = ?auto_3364 ?auto_3372 ) ) ( not ( = ?auto_3365 ?auto_3368 ) ) ( not ( = ?auto_3365 ?auto_3372 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( not ( = ?auto_3367 ?auto_3372 ) ) ( not ( = ?auto_3368 ?auto_3381 ) ) ( not ( = ?auto_3368 ?auto_3375 ) ) ( not ( = ?auto_3368 ?auto_3392 ) ) ( not ( = ?auto_3368 ?auto_3386 ) ) ( not ( = ?auto_3368 ?auto_3391 ) ) ( not ( = ?auto_3368 ?auto_3385 ) ) ( not ( = ?auto_3369 ?auto_3380 ) ) ( not ( = ?auto_3369 ?auto_3378 ) ) ( not ( = ?auto_3369 ?auto_3383 ) ) ( not ( = ?auto_3369 ?auto_3379 ) ) ( not ( = ?auto_3369 ?auto_3384 ) ) ( not ( = ?auto_3369 ?auto_3390 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3377 ) ) ( not ( = ?auto_3374 ?auto_3387 ) ) ( not ( = ?auto_3374 ?auto_3382 ) ) ( not ( = ?auto_3374 ?auto_3389 ) ) ( not ( = ?auto_3374 ?auto_3388 ) ) ( not ( = ?auto_3372 ?auto_3381 ) ) ( not ( = ?auto_3372 ?auto_3375 ) ) ( not ( = ?auto_3372 ?auto_3392 ) ) ( not ( = ?auto_3372 ?auto_3386 ) ) ( not ( = ?auto_3372 ?auto_3391 ) ) ( not ( = ?auto_3372 ?auto_3385 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3361 ?auto_3362 ?auto_3363 ?auto_3364 ?auto_3365 ?auto_3367 ?auto_3366 )
      ( MAKE-1CRATE ?auto_3366 ?auto_3368 )
      ( MAKE-7CRATE-VERIFY ?auto_3361 ?auto_3362 ?auto_3363 ?auto_3364 ?auto_3365 ?auto_3367 ?auto_3366 ?auto_3368 ) )
  )

)

