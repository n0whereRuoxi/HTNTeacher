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
      ?auto_3142 - SURFACE
      ?auto_3143 - SURFACE
    )
    :vars
    (
      ?auto_3144 - HOIST
      ?auto_3145 - PLACE
      ?auto_3147 - PLACE
      ?auto_3148 - HOIST
      ?auto_3149 - SURFACE
      ?auto_3146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3144 ?auto_3145 ) ( SURFACE-AT ?auto_3143 ?auto_3145 ) ( CLEAR ?auto_3143 ) ( IS-CRATE ?auto_3142 ) ( AVAILABLE ?auto_3144 ) ( not ( = ?auto_3147 ?auto_3145 ) ) ( HOIST-AT ?auto_3148 ?auto_3147 ) ( AVAILABLE ?auto_3148 ) ( SURFACE-AT ?auto_3142 ?auto_3147 ) ( ON ?auto_3142 ?auto_3149 ) ( CLEAR ?auto_3142 ) ( TRUCK-AT ?auto_3146 ?auto_3145 ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3149 ) ) ( not ( = ?auto_3143 ?auto_3149 ) ) ( not ( = ?auto_3144 ?auto_3148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3146 ?auto_3145 ?auto_3147 )
      ( !LIFT ?auto_3148 ?auto_3142 ?auto_3149 ?auto_3147 )
      ( !LOAD ?auto_3148 ?auto_3142 ?auto_3146 ?auto_3147 )
      ( !DRIVE ?auto_3146 ?auto_3147 ?auto_3145 )
      ( !UNLOAD ?auto_3144 ?auto_3142 ?auto_3146 ?auto_3145 )
      ( !DROP ?auto_3144 ?auto_3142 ?auto_3143 ?auto_3145 )
      ( MAKE-ON-VERIFY ?auto_3142 ?auto_3143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3152 - SURFACE
      ?auto_3153 - SURFACE
    )
    :vars
    (
      ?auto_3154 - HOIST
      ?auto_3155 - PLACE
      ?auto_3157 - PLACE
      ?auto_3158 - HOIST
      ?auto_3159 - SURFACE
      ?auto_3156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3154 ?auto_3155 ) ( SURFACE-AT ?auto_3153 ?auto_3155 ) ( CLEAR ?auto_3153 ) ( IS-CRATE ?auto_3152 ) ( AVAILABLE ?auto_3154 ) ( not ( = ?auto_3157 ?auto_3155 ) ) ( HOIST-AT ?auto_3158 ?auto_3157 ) ( AVAILABLE ?auto_3158 ) ( SURFACE-AT ?auto_3152 ?auto_3157 ) ( ON ?auto_3152 ?auto_3159 ) ( CLEAR ?auto_3152 ) ( TRUCK-AT ?auto_3156 ?auto_3155 ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( not ( = ?auto_3152 ?auto_3159 ) ) ( not ( = ?auto_3153 ?auto_3159 ) ) ( not ( = ?auto_3154 ?auto_3158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3156 ?auto_3155 ?auto_3157 )
      ( !LIFT ?auto_3158 ?auto_3152 ?auto_3159 ?auto_3157 )
      ( !LOAD ?auto_3158 ?auto_3152 ?auto_3156 ?auto_3157 )
      ( !DRIVE ?auto_3156 ?auto_3157 ?auto_3155 )
      ( !UNLOAD ?auto_3154 ?auto_3152 ?auto_3156 ?auto_3155 )
      ( !DROP ?auto_3154 ?auto_3152 ?auto_3153 ?auto_3155 )
      ( MAKE-ON-VERIFY ?auto_3152 ?auto_3153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3162 - SURFACE
      ?auto_3163 - SURFACE
    )
    :vars
    (
      ?auto_3164 - HOIST
      ?auto_3165 - PLACE
      ?auto_3167 - PLACE
      ?auto_3168 - HOIST
      ?auto_3169 - SURFACE
      ?auto_3166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3164 ?auto_3165 ) ( SURFACE-AT ?auto_3163 ?auto_3165 ) ( CLEAR ?auto_3163 ) ( IS-CRATE ?auto_3162 ) ( AVAILABLE ?auto_3164 ) ( not ( = ?auto_3167 ?auto_3165 ) ) ( HOIST-AT ?auto_3168 ?auto_3167 ) ( AVAILABLE ?auto_3168 ) ( SURFACE-AT ?auto_3162 ?auto_3167 ) ( ON ?auto_3162 ?auto_3169 ) ( CLEAR ?auto_3162 ) ( TRUCK-AT ?auto_3166 ?auto_3165 ) ( not ( = ?auto_3162 ?auto_3163 ) ) ( not ( = ?auto_3162 ?auto_3169 ) ) ( not ( = ?auto_3163 ?auto_3169 ) ) ( not ( = ?auto_3164 ?auto_3168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3166 ?auto_3165 ?auto_3167 )
      ( !LIFT ?auto_3168 ?auto_3162 ?auto_3169 ?auto_3167 )
      ( !LOAD ?auto_3168 ?auto_3162 ?auto_3166 ?auto_3167 )
      ( !DRIVE ?auto_3166 ?auto_3167 ?auto_3165 )
      ( !UNLOAD ?auto_3164 ?auto_3162 ?auto_3166 ?auto_3165 )
      ( !DROP ?auto_3164 ?auto_3162 ?auto_3163 ?auto_3165 )
      ( MAKE-ON-VERIFY ?auto_3162 ?auto_3163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3172 - SURFACE
      ?auto_3173 - SURFACE
    )
    :vars
    (
      ?auto_3174 - HOIST
      ?auto_3175 - PLACE
      ?auto_3177 - PLACE
      ?auto_3178 - HOIST
      ?auto_3179 - SURFACE
      ?auto_3176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3174 ?auto_3175 ) ( SURFACE-AT ?auto_3173 ?auto_3175 ) ( CLEAR ?auto_3173 ) ( IS-CRATE ?auto_3172 ) ( AVAILABLE ?auto_3174 ) ( not ( = ?auto_3177 ?auto_3175 ) ) ( HOIST-AT ?auto_3178 ?auto_3177 ) ( AVAILABLE ?auto_3178 ) ( SURFACE-AT ?auto_3172 ?auto_3177 ) ( ON ?auto_3172 ?auto_3179 ) ( CLEAR ?auto_3172 ) ( TRUCK-AT ?auto_3176 ?auto_3175 ) ( not ( = ?auto_3172 ?auto_3173 ) ) ( not ( = ?auto_3172 ?auto_3179 ) ) ( not ( = ?auto_3173 ?auto_3179 ) ) ( not ( = ?auto_3174 ?auto_3178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3176 ?auto_3175 ?auto_3177 )
      ( !LIFT ?auto_3178 ?auto_3172 ?auto_3179 ?auto_3177 )
      ( !LOAD ?auto_3178 ?auto_3172 ?auto_3176 ?auto_3177 )
      ( !DRIVE ?auto_3176 ?auto_3177 ?auto_3175 )
      ( !UNLOAD ?auto_3174 ?auto_3172 ?auto_3176 ?auto_3175 )
      ( !DROP ?auto_3174 ?auto_3172 ?auto_3173 ?auto_3175 )
      ( MAKE-ON-VERIFY ?auto_3172 ?auto_3173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3182 - SURFACE
      ?auto_3183 - SURFACE
    )
    :vars
    (
      ?auto_3184 - HOIST
      ?auto_3185 - PLACE
      ?auto_3187 - PLACE
      ?auto_3188 - HOIST
      ?auto_3189 - SURFACE
      ?auto_3186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3184 ?auto_3185 ) ( SURFACE-AT ?auto_3183 ?auto_3185 ) ( CLEAR ?auto_3183 ) ( IS-CRATE ?auto_3182 ) ( AVAILABLE ?auto_3184 ) ( not ( = ?auto_3187 ?auto_3185 ) ) ( HOIST-AT ?auto_3188 ?auto_3187 ) ( AVAILABLE ?auto_3188 ) ( SURFACE-AT ?auto_3182 ?auto_3187 ) ( ON ?auto_3182 ?auto_3189 ) ( CLEAR ?auto_3182 ) ( TRUCK-AT ?auto_3186 ?auto_3185 ) ( not ( = ?auto_3182 ?auto_3183 ) ) ( not ( = ?auto_3182 ?auto_3189 ) ) ( not ( = ?auto_3183 ?auto_3189 ) ) ( not ( = ?auto_3184 ?auto_3188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3186 ?auto_3185 ?auto_3187 )
      ( !LIFT ?auto_3188 ?auto_3182 ?auto_3189 ?auto_3187 )
      ( !LOAD ?auto_3188 ?auto_3182 ?auto_3186 ?auto_3187 )
      ( !DRIVE ?auto_3186 ?auto_3187 ?auto_3185 )
      ( !UNLOAD ?auto_3184 ?auto_3182 ?auto_3186 ?auto_3185 )
      ( !DROP ?auto_3184 ?auto_3182 ?auto_3183 ?auto_3185 )
      ( MAKE-ON-VERIFY ?auto_3182 ?auto_3183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3192 - SURFACE
      ?auto_3193 - SURFACE
    )
    :vars
    (
      ?auto_3194 - HOIST
      ?auto_3195 - PLACE
      ?auto_3197 - PLACE
      ?auto_3198 - HOIST
      ?auto_3199 - SURFACE
      ?auto_3196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3194 ?auto_3195 ) ( SURFACE-AT ?auto_3193 ?auto_3195 ) ( CLEAR ?auto_3193 ) ( IS-CRATE ?auto_3192 ) ( AVAILABLE ?auto_3194 ) ( not ( = ?auto_3197 ?auto_3195 ) ) ( HOIST-AT ?auto_3198 ?auto_3197 ) ( AVAILABLE ?auto_3198 ) ( SURFACE-AT ?auto_3192 ?auto_3197 ) ( ON ?auto_3192 ?auto_3199 ) ( CLEAR ?auto_3192 ) ( TRUCK-AT ?auto_3196 ?auto_3195 ) ( not ( = ?auto_3192 ?auto_3193 ) ) ( not ( = ?auto_3192 ?auto_3199 ) ) ( not ( = ?auto_3193 ?auto_3199 ) ) ( not ( = ?auto_3194 ?auto_3198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3196 ?auto_3195 ?auto_3197 )
      ( !LIFT ?auto_3198 ?auto_3192 ?auto_3199 ?auto_3197 )
      ( !LOAD ?auto_3198 ?auto_3192 ?auto_3196 ?auto_3197 )
      ( !DRIVE ?auto_3196 ?auto_3197 ?auto_3195 )
      ( !UNLOAD ?auto_3194 ?auto_3192 ?auto_3196 ?auto_3195 )
      ( !DROP ?auto_3194 ?auto_3192 ?auto_3193 ?auto_3195 )
      ( MAKE-ON-VERIFY ?auto_3192 ?auto_3193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3202 - SURFACE
      ?auto_3203 - SURFACE
    )
    :vars
    (
      ?auto_3204 - HOIST
      ?auto_3205 - PLACE
      ?auto_3207 - PLACE
      ?auto_3208 - HOIST
      ?auto_3209 - SURFACE
      ?auto_3206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3204 ?auto_3205 ) ( SURFACE-AT ?auto_3203 ?auto_3205 ) ( CLEAR ?auto_3203 ) ( IS-CRATE ?auto_3202 ) ( AVAILABLE ?auto_3204 ) ( not ( = ?auto_3207 ?auto_3205 ) ) ( HOIST-AT ?auto_3208 ?auto_3207 ) ( AVAILABLE ?auto_3208 ) ( SURFACE-AT ?auto_3202 ?auto_3207 ) ( ON ?auto_3202 ?auto_3209 ) ( CLEAR ?auto_3202 ) ( TRUCK-AT ?auto_3206 ?auto_3205 ) ( not ( = ?auto_3202 ?auto_3203 ) ) ( not ( = ?auto_3202 ?auto_3209 ) ) ( not ( = ?auto_3203 ?auto_3209 ) ) ( not ( = ?auto_3204 ?auto_3208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3206 ?auto_3205 ?auto_3207 )
      ( !LIFT ?auto_3208 ?auto_3202 ?auto_3209 ?auto_3207 )
      ( !LOAD ?auto_3208 ?auto_3202 ?auto_3206 ?auto_3207 )
      ( !DRIVE ?auto_3206 ?auto_3207 ?auto_3205 )
      ( !UNLOAD ?auto_3204 ?auto_3202 ?auto_3206 ?auto_3205 )
      ( !DROP ?auto_3204 ?auto_3202 ?auto_3203 ?auto_3205 )
      ( MAKE-ON-VERIFY ?auto_3202 ?auto_3203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3212 - SURFACE
      ?auto_3213 - SURFACE
    )
    :vars
    (
      ?auto_3214 - HOIST
      ?auto_3215 - PLACE
      ?auto_3217 - PLACE
      ?auto_3218 - HOIST
      ?auto_3219 - SURFACE
      ?auto_3216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3214 ?auto_3215 ) ( SURFACE-AT ?auto_3213 ?auto_3215 ) ( CLEAR ?auto_3213 ) ( IS-CRATE ?auto_3212 ) ( AVAILABLE ?auto_3214 ) ( not ( = ?auto_3217 ?auto_3215 ) ) ( HOIST-AT ?auto_3218 ?auto_3217 ) ( AVAILABLE ?auto_3218 ) ( SURFACE-AT ?auto_3212 ?auto_3217 ) ( ON ?auto_3212 ?auto_3219 ) ( CLEAR ?auto_3212 ) ( TRUCK-AT ?auto_3216 ?auto_3215 ) ( not ( = ?auto_3212 ?auto_3213 ) ) ( not ( = ?auto_3212 ?auto_3219 ) ) ( not ( = ?auto_3213 ?auto_3219 ) ) ( not ( = ?auto_3214 ?auto_3218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3216 ?auto_3215 ?auto_3217 )
      ( !LIFT ?auto_3218 ?auto_3212 ?auto_3219 ?auto_3217 )
      ( !LOAD ?auto_3218 ?auto_3212 ?auto_3216 ?auto_3217 )
      ( !DRIVE ?auto_3216 ?auto_3217 ?auto_3215 )
      ( !UNLOAD ?auto_3214 ?auto_3212 ?auto_3216 ?auto_3215 )
      ( !DROP ?auto_3214 ?auto_3212 ?auto_3213 ?auto_3215 )
      ( MAKE-ON-VERIFY ?auto_3212 ?auto_3213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3222 - SURFACE
      ?auto_3223 - SURFACE
    )
    :vars
    (
      ?auto_3224 - HOIST
      ?auto_3225 - PLACE
      ?auto_3227 - PLACE
      ?auto_3228 - HOIST
      ?auto_3229 - SURFACE
      ?auto_3226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3224 ?auto_3225 ) ( SURFACE-AT ?auto_3223 ?auto_3225 ) ( CLEAR ?auto_3223 ) ( IS-CRATE ?auto_3222 ) ( AVAILABLE ?auto_3224 ) ( not ( = ?auto_3227 ?auto_3225 ) ) ( HOIST-AT ?auto_3228 ?auto_3227 ) ( AVAILABLE ?auto_3228 ) ( SURFACE-AT ?auto_3222 ?auto_3227 ) ( ON ?auto_3222 ?auto_3229 ) ( CLEAR ?auto_3222 ) ( TRUCK-AT ?auto_3226 ?auto_3225 ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( not ( = ?auto_3222 ?auto_3229 ) ) ( not ( = ?auto_3223 ?auto_3229 ) ) ( not ( = ?auto_3224 ?auto_3228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3226 ?auto_3225 ?auto_3227 )
      ( !LIFT ?auto_3228 ?auto_3222 ?auto_3229 ?auto_3227 )
      ( !LOAD ?auto_3228 ?auto_3222 ?auto_3226 ?auto_3227 )
      ( !DRIVE ?auto_3226 ?auto_3227 ?auto_3225 )
      ( !UNLOAD ?auto_3224 ?auto_3222 ?auto_3226 ?auto_3225 )
      ( !DROP ?auto_3224 ?auto_3222 ?auto_3223 ?auto_3225 )
      ( MAKE-ON-VERIFY ?auto_3222 ?auto_3223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3232 - SURFACE
      ?auto_3233 - SURFACE
    )
    :vars
    (
      ?auto_3234 - HOIST
      ?auto_3235 - PLACE
      ?auto_3237 - PLACE
      ?auto_3238 - HOIST
      ?auto_3239 - SURFACE
      ?auto_3236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3234 ?auto_3235 ) ( SURFACE-AT ?auto_3233 ?auto_3235 ) ( CLEAR ?auto_3233 ) ( IS-CRATE ?auto_3232 ) ( AVAILABLE ?auto_3234 ) ( not ( = ?auto_3237 ?auto_3235 ) ) ( HOIST-AT ?auto_3238 ?auto_3237 ) ( AVAILABLE ?auto_3238 ) ( SURFACE-AT ?auto_3232 ?auto_3237 ) ( ON ?auto_3232 ?auto_3239 ) ( CLEAR ?auto_3232 ) ( TRUCK-AT ?auto_3236 ?auto_3235 ) ( not ( = ?auto_3232 ?auto_3233 ) ) ( not ( = ?auto_3232 ?auto_3239 ) ) ( not ( = ?auto_3233 ?auto_3239 ) ) ( not ( = ?auto_3234 ?auto_3238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3236 ?auto_3235 ?auto_3237 )
      ( !LIFT ?auto_3238 ?auto_3232 ?auto_3239 ?auto_3237 )
      ( !LOAD ?auto_3238 ?auto_3232 ?auto_3236 ?auto_3237 )
      ( !DRIVE ?auto_3236 ?auto_3237 ?auto_3235 )
      ( !UNLOAD ?auto_3234 ?auto_3232 ?auto_3236 ?auto_3235 )
      ( !DROP ?auto_3234 ?auto_3232 ?auto_3233 ?auto_3235 )
      ( MAKE-ON-VERIFY ?auto_3232 ?auto_3233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3242 - SURFACE
      ?auto_3243 - SURFACE
    )
    :vars
    (
      ?auto_3244 - HOIST
      ?auto_3245 - PLACE
      ?auto_3247 - PLACE
      ?auto_3248 - HOIST
      ?auto_3249 - SURFACE
      ?auto_3246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3244 ?auto_3245 ) ( SURFACE-AT ?auto_3243 ?auto_3245 ) ( CLEAR ?auto_3243 ) ( IS-CRATE ?auto_3242 ) ( AVAILABLE ?auto_3244 ) ( not ( = ?auto_3247 ?auto_3245 ) ) ( HOIST-AT ?auto_3248 ?auto_3247 ) ( AVAILABLE ?auto_3248 ) ( SURFACE-AT ?auto_3242 ?auto_3247 ) ( ON ?auto_3242 ?auto_3249 ) ( CLEAR ?auto_3242 ) ( TRUCK-AT ?auto_3246 ?auto_3245 ) ( not ( = ?auto_3242 ?auto_3243 ) ) ( not ( = ?auto_3242 ?auto_3249 ) ) ( not ( = ?auto_3243 ?auto_3249 ) ) ( not ( = ?auto_3244 ?auto_3248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3246 ?auto_3245 ?auto_3247 )
      ( !LIFT ?auto_3248 ?auto_3242 ?auto_3249 ?auto_3247 )
      ( !LOAD ?auto_3248 ?auto_3242 ?auto_3246 ?auto_3247 )
      ( !DRIVE ?auto_3246 ?auto_3247 ?auto_3245 )
      ( !UNLOAD ?auto_3244 ?auto_3242 ?auto_3246 ?auto_3245 )
      ( !DROP ?auto_3244 ?auto_3242 ?auto_3243 ?auto_3245 )
      ( MAKE-ON-VERIFY ?auto_3242 ?auto_3243 ) )
  )

)

