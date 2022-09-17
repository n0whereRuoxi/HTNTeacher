( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3148 - OBJ
      ?auto_3149 - LOCATION
    )
    :vars
    (
      ?auto_3150 - TRUCK
      ?auto_3151 - LOCATION
      ?auto_3152 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3150 ?auto_3151 ) ( IN-CITY ?auto_3151 ?auto_3152 ) ( IN-CITY ?auto_3149 ?auto_3152 ) ( not ( = ?auto_3149 ?auto_3151 ) ) ( OBJ-AT ?auto_3148 ?auto_3151 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3148 ?auto_3150 ?auto_3151 )
      ( !DRIVE-TRUCK ?auto_3150 ?auto_3151 ?auto_3149 ?auto_3152 )
      ( !UNLOAD-TRUCK ?auto_3148 ?auto_3150 ?auto_3149 )
      ( DELIVER-1PKG-VERIFY ?auto_3148 ?auto_3149 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3155 - OBJ
      ?auto_3156 - LOCATION
    )
    :vars
    (
      ?auto_3157 - LOCATION
      ?auto_3158 - CITY
      ?auto_3159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3157 ?auto_3158 ) ( IN-CITY ?auto_3156 ?auto_3158 ) ( not ( = ?auto_3156 ?auto_3157 ) ) ( OBJ-AT ?auto_3155 ?auto_3157 ) ( TRUCK-AT ?auto_3159 ?auto_3156 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3159 ?auto_3156 ?auto_3157 ?auto_3158 )
      ( DELIVER-1PKG ?auto_3155 ?auto_3156 )
      ( DELIVER-1PKG-VERIFY ?auto_3155 ?auto_3156 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3162 - OBJ
      ?auto_3163 - LOCATION
    )
    :vars
    (
      ?auto_3164 - TRUCK
      ?auto_3165 - LOCATION
      ?auto_3166 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3164 ?auto_3165 ) ( IN-CITY ?auto_3165 ?auto_3166 ) ( IN-CITY ?auto_3163 ?auto_3166 ) ( not ( = ?auto_3163 ?auto_3165 ) ) ( OBJ-AT ?auto_3162 ?auto_3165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3162 ?auto_3164 ?auto_3165 )
      ( !DRIVE-TRUCK ?auto_3164 ?auto_3165 ?auto_3163 ?auto_3166 )
      ( !UNLOAD-TRUCK ?auto_3162 ?auto_3164 ?auto_3163 )
      ( DELIVER-1PKG-VERIFY ?auto_3162 ?auto_3163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3169 - OBJ
      ?auto_3170 - LOCATION
    )
    :vars
    (
      ?auto_3172 - LOCATION
      ?auto_3171 - CITY
      ?auto_3173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3172 ?auto_3171 ) ( IN-CITY ?auto_3170 ?auto_3171 ) ( not ( = ?auto_3170 ?auto_3172 ) ) ( OBJ-AT ?auto_3169 ?auto_3172 ) ( TRUCK-AT ?auto_3173 ?auto_3170 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3173 ?auto_3170 ?auto_3172 ?auto_3171 )
      ( DELIVER-1PKG ?auto_3169 ?auto_3170 )
      ( DELIVER-1PKG-VERIFY ?auto_3169 ?auto_3170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3177 - OBJ
      ?auto_3179 - OBJ
      ?auto_3178 - LOCATION
    )
    :vars
    (
      ?auto_3182 - LOCATION
      ?auto_3181 - CITY
      ?auto_3180 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3179 ?auto_3177 ) ( IN-CITY ?auto_3182 ?auto_3181 ) ( IN-CITY ?auto_3178 ?auto_3181 ) ( not ( = ?auto_3178 ?auto_3182 ) ) ( OBJ-AT ?auto_3179 ?auto_3182 ) ( TRUCK-AT ?auto_3180 ?auto_3182 ) ( OBJ-AT ?auto_3177 ?auto_3182 ) ( not ( = ?auto_3177 ?auto_3179 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3177 ?auto_3178 )
      ( DELIVER-1PKG ?auto_3179 ?auto_3178 )
      ( DELIVER-2PKG-VERIFY ?auto_3177 ?auto_3179 ?auto_3178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3186 - OBJ
      ?auto_3188 - OBJ
      ?auto_3187 - LOCATION
    )
    :vars
    (
      ?auto_3189 - LOCATION
      ?auto_3191 - CITY
      ?auto_3190 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3188 ?auto_3186 ) ( IN-CITY ?auto_3189 ?auto_3191 ) ( IN-CITY ?auto_3187 ?auto_3191 ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( OBJ-AT ?auto_3188 ?auto_3189 ) ( OBJ-AT ?auto_3186 ?auto_3189 ) ( not ( = ?auto_3186 ?auto_3188 ) ) ( TRUCK-AT ?auto_3190 ?auto_3187 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3190 ?auto_3187 ?auto_3189 ?auto_3191 )
      ( DELIVER-2PKG ?auto_3186 ?auto_3188 ?auto_3187 )
      ( DELIVER-2PKG-VERIFY ?auto_3186 ?auto_3188 ?auto_3187 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3194 - OBJ
      ?auto_3195 - LOCATION
    )
    :vars
    (
      ?auto_3196 - TRUCK
      ?auto_3197 - LOCATION
      ?auto_3198 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3196 ?auto_3197 ) ( IN-CITY ?auto_3197 ?auto_3198 ) ( IN-CITY ?auto_3195 ?auto_3198 ) ( not ( = ?auto_3195 ?auto_3197 ) ) ( OBJ-AT ?auto_3194 ?auto_3197 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3194 ?auto_3196 ?auto_3197 )
      ( !DRIVE-TRUCK ?auto_3196 ?auto_3197 ?auto_3195 ?auto_3198 )
      ( !UNLOAD-TRUCK ?auto_3194 ?auto_3196 ?auto_3195 )
      ( DELIVER-1PKG-VERIFY ?auto_3194 ?auto_3195 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3201 - OBJ
      ?auto_3202 - LOCATION
    )
    :vars
    (
      ?auto_3205 - LOCATION
      ?auto_3204 - CITY
      ?auto_3203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3205 ?auto_3204 ) ( IN-CITY ?auto_3202 ?auto_3204 ) ( not ( = ?auto_3202 ?auto_3205 ) ) ( OBJ-AT ?auto_3201 ?auto_3205 ) ( TRUCK-AT ?auto_3203 ?auto_3202 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3203 ?auto_3202 ?auto_3205 ?auto_3204 )
      ( DELIVER-1PKG ?auto_3201 ?auto_3202 )
      ( DELIVER-1PKG-VERIFY ?auto_3201 ?auto_3202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3210 - OBJ
      ?auto_3212 - OBJ
      ?auto_3213 - OBJ
      ?auto_3211 - LOCATION
    )
    :vars
    (
      ?auto_3214 - LOCATION
      ?auto_3216 - CITY
      ?auto_3217 - LOCATION
      ?auto_3215 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3212 ?auto_3210 ) ( GREATER-THAN ?auto_3213 ?auto_3210 ) ( GREATER-THAN ?auto_3213 ?auto_3212 ) ( IN-CITY ?auto_3214 ?auto_3216 ) ( IN-CITY ?auto_3211 ?auto_3216 ) ( not ( = ?auto_3211 ?auto_3214 ) ) ( OBJ-AT ?auto_3213 ?auto_3214 ) ( IN-CITY ?auto_3217 ?auto_3216 ) ( not ( = ?auto_3211 ?auto_3217 ) ) ( OBJ-AT ?auto_3212 ?auto_3217 ) ( TRUCK-AT ?auto_3215 ?auto_3217 ) ( OBJ-AT ?auto_3210 ?auto_3217 ) ( not ( = ?auto_3210 ?auto_3212 ) ) ( not ( = ?auto_3210 ?auto_3213 ) ) ( not ( = ?auto_3212 ?auto_3213 ) ) ( not ( = ?auto_3214 ?auto_3217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3210 ?auto_3212 ?auto_3211 )
      ( DELIVER-1PKG ?auto_3213 ?auto_3211 )
      ( DELIVER-3PKG-VERIFY ?auto_3210 ?auto_3212 ?auto_3213 ?auto_3211 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3222 - OBJ
      ?auto_3224 - OBJ
      ?auto_3225 - OBJ
      ?auto_3223 - LOCATION
    )
    :vars
    (
      ?auto_3226 - LOCATION
      ?auto_3227 - CITY
      ?auto_3228 - LOCATION
      ?auto_3229 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3224 ?auto_3222 ) ( GREATER-THAN ?auto_3225 ?auto_3222 ) ( GREATER-THAN ?auto_3225 ?auto_3224 ) ( IN-CITY ?auto_3226 ?auto_3227 ) ( IN-CITY ?auto_3223 ?auto_3227 ) ( not ( = ?auto_3223 ?auto_3226 ) ) ( OBJ-AT ?auto_3225 ?auto_3226 ) ( IN-CITY ?auto_3228 ?auto_3227 ) ( not ( = ?auto_3223 ?auto_3228 ) ) ( OBJ-AT ?auto_3224 ?auto_3228 ) ( OBJ-AT ?auto_3222 ?auto_3228 ) ( not ( = ?auto_3222 ?auto_3224 ) ) ( not ( = ?auto_3222 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3226 ?auto_3228 ) ) ( TRUCK-AT ?auto_3229 ?auto_3223 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3229 ?auto_3223 ?auto_3228 ?auto_3227 )
      ( DELIVER-3PKG ?auto_3222 ?auto_3224 ?auto_3225 ?auto_3223 )
      ( DELIVER-3PKG-VERIFY ?auto_3222 ?auto_3224 ?auto_3225 ?auto_3223 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3232 - OBJ
      ?auto_3233 - LOCATION
    )
    :vars
    (
      ?auto_3234 - TRUCK
      ?auto_3235 - LOCATION
      ?auto_3236 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3234 ?auto_3235 ) ( IN-CITY ?auto_3235 ?auto_3236 ) ( IN-CITY ?auto_3233 ?auto_3236 ) ( not ( = ?auto_3233 ?auto_3235 ) ) ( OBJ-AT ?auto_3232 ?auto_3235 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3232 ?auto_3234 ?auto_3235 )
      ( !DRIVE-TRUCK ?auto_3234 ?auto_3235 ?auto_3233 ?auto_3236 )
      ( !UNLOAD-TRUCK ?auto_3232 ?auto_3234 ?auto_3233 )
      ( DELIVER-1PKG-VERIFY ?auto_3232 ?auto_3233 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3239 - OBJ
      ?auto_3240 - LOCATION
    )
    :vars
    (
      ?auto_3241 - LOCATION
      ?auto_3243 - CITY
      ?auto_3242 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3241 ?auto_3243 ) ( IN-CITY ?auto_3240 ?auto_3243 ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( OBJ-AT ?auto_3239 ?auto_3241 ) ( TRUCK-AT ?auto_3242 ?auto_3240 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3242 ?auto_3240 ?auto_3241 ?auto_3243 )
      ( DELIVER-1PKG ?auto_3239 ?auto_3240 )
      ( DELIVER-1PKG-VERIFY ?auto_3239 ?auto_3240 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3249 - OBJ
      ?auto_3251 - OBJ
      ?auto_3252 - OBJ
      ?auto_3253 - OBJ
      ?auto_3250 - LOCATION
    )
    :vars
    (
      ?auto_3255 - LOCATION
      ?auto_3256 - CITY
      ?auto_3257 - LOCATION
      ?auto_3254 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3251 ?auto_3249 ) ( GREATER-THAN ?auto_3252 ?auto_3249 ) ( GREATER-THAN ?auto_3252 ?auto_3251 ) ( GREATER-THAN ?auto_3253 ?auto_3249 ) ( GREATER-THAN ?auto_3253 ?auto_3251 ) ( GREATER-THAN ?auto_3253 ?auto_3252 ) ( IN-CITY ?auto_3255 ?auto_3256 ) ( IN-CITY ?auto_3250 ?auto_3256 ) ( not ( = ?auto_3250 ?auto_3255 ) ) ( OBJ-AT ?auto_3253 ?auto_3255 ) ( IN-CITY ?auto_3257 ?auto_3256 ) ( not ( = ?auto_3250 ?auto_3257 ) ) ( OBJ-AT ?auto_3252 ?auto_3257 ) ( OBJ-AT ?auto_3251 ?auto_3255 ) ( TRUCK-AT ?auto_3254 ?auto_3255 ) ( OBJ-AT ?auto_3249 ?auto_3255 ) ( not ( = ?auto_3249 ?auto_3251 ) ) ( not ( = ?auto_3249 ?auto_3252 ) ) ( not ( = ?auto_3251 ?auto_3252 ) ) ( not ( = ?auto_3257 ?auto_3255 ) ) ( not ( = ?auto_3249 ?auto_3253 ) ) ( not ( = ?auto_3251 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3253 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3249 ?auto_3251 ?auto_3252 ?auto_3250 )
      ( DELIVER-1PKG ?auto_3253 ?auto_3250 )
      ( DELIVER-4PKG-VERIFY ?auto_3249 ?auto_3251 ?auto_3252 ?auto_3253 ?auto_3250 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3263 - OBJ
      ?auto_3265 - OBJ
      ?auto_3266 - OBJ
      ?auto_3267 - OBJ
      ?auto_3264 - LOCATION
    )
    :vars
    (
      ?auto_3270 - LOCATION
      ?auto_3271 - CITY
      ?auto_3269 - LOCATION
      ?auto_3268 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3265 ?auto_3263 ) ( GREATER-THAN ?auto_3266 ?auto_3263 ) ( GREATER-THAN ?auto_3266 ?auto_3265 ) ( GREATER-THAN ?auto_3267 ?auto_3263 ) ( GREATER-THAN ?auto_3267 ?auto_3265 ) ( GREATER-THAN ?auto_3267 ?auto_3266 ) ( IN-CITY ?auto_3270 ?auto_3271 ) ( IN-CITY ?auto_3264 ?auto_3271 ) ( not ( = ?auto_3264 ?auto_3270 ) ) ( OBJ-AT ?auto_3267 ?auto_3270 ) ( IN-CITY ?auto_3269 ?auto_3271 ) ( not ( = ?auto_3264 ?auto_3269 ) ) ( OBJ-AT ?auto_3266 ?auto_3269 ) ( OBJ-AT ?auto_3265 ?auto_3270 ) ( OBJ-AT ?auto_3263 ?auto_3270 ) ( not ( = ?auto_3263 ?auto_3265 ) ) ( not ( = ?auto_3263 ?auto_3266 ) ) ( not ( = ?auto_3265 ?auto_3266 ) ) ( not ( = ?auto_3269 ?auto_3270 ) ) ( not ( = ?auto_3263 ?auto_3267 ) ) ( not ( = ?auto_3265 ?auto_3267 ) ) ( not ( = ?auto_3266 ?auto_3267 ) ) ( TRUCK-AT ?auto_3268 ?auto_3264 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3268 ?auto_3264 ?auto_3270 ?auto_3271 )
      ( DELIVER-4PKG ?auto_3263 ?auto_3265 ?auto_3266 ?auto_3267 ?auto_3264 )
      ( DELIVER-4PKG-VERIFY ?auto_3263 ?auto_3265 ?auto_3266 ?auto_3267 ?auto_3264 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3274 - OBJ
      ?auto_3275 - LOCATION
    )
    :vars
    (
      ?auto_3276 - TRUCK
      ?auto_3277 - LOCATION
      ?auto_3278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3276 ?auto_3277 ) ( IN-CITY ?auto_3277 ?auto_3278 ) ( IN-CITY ?auto_3275 ?auto_3278 ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( OBJ-AT ?auto_3274 ?auto_3277 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3274 ?auto_3276 ?auto_3277 )
      ( !DRIVE-TRUCK ?auto_3276 ?auto_3277 ?auto_3275 ?auto_3278 )
      ( !UNLOAD-TRUCK ?auto_3274 ?auto_3276 ?auto_3275 )
      ( DELIVER-1PKG-VERIFY ?auto_3274 ?auto_3275 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3281 - OBJ
      ?auto_3282 - LOCATION
    )
    :vars
    (
      ?auto_3285 - LOCATION
      ?auto_3283 - CITY
      ?auto_3284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3285 ?auto_3283 ) ( IN-CITY ?auto_3282 ?auto_3283 ) ( not ( = ?auto_3282 ?auto_3285 ) ) ( OBJ-AT ?auto_3281 ?auto_3285 ) ( TRUCK-AT ?auto_3284 ?auto_3282 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3284 ?auto_3282 ?auto_3285 ?auto_3283 )
      ( DELIVER-1PKG ?auto_3281 ?auto_3282 )
      ( DELIVER-1PKG-VERIFY ?auto_3281 ?auto_3282 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3292 - OBJ
      ?auto_3294 - OBJ
      ?auto_3295 - OBJ
      ?auto_3297 - OBJ
      ?auto_3296 - OBJ
      ?auto_3293 - LOCATION
    )
    :vars
    (
      ?auto_3299 - LOCATION
      ?auto_3298 - CITY
      ?auto_3301 - LOCATION
      ?auto_3300 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3294 ?auto_3292 ) ( GREATER-THAN ?auto_3295 ?auto_3292 ) ( GREATER-THAN ?auto_3295 ?auto_3294 ) ( GREATER-THAN ?auto_3297 ?auto_3292 ) ( GREATER-THAN ?auto_3297 ?auto_3294 ) ( GREATER-THAN ?auto_3297 ?auto_3295 ) ( GREATER-THAN ?auto_3296 ?auto_3292 ) ( GREATER-THAN ?auto_3296 ?auto_3294 ) ( GREATER-THAN ?auto_3296 ?auto_3295 ) ( GREATER-THAN ?auto_3296 ?auto_3297 ) ( IN-CITY ?auto_3299 ?auto_3298 ) ( IN-CITY ?auto_3293 ?auto_3298 ) ( not ( = ?auto_3293 ?auto_3299 ) ) ( OBJ-AT ?auto_3296 ?auto_3299 ) ( IN-CITY ?auto_3301 ?auto_3298 ) ( not ( = ?auto_3293 ?auto_3301 ) ) ( OBJ-AT ?auto_3297 ?auto_3301 ) ( OBJ-AT ?auto_3295 ?auto_3299 ) ( OBJ-AT ?auto_3294 ?auto_3301 ) ( TRUCK-AT ?auto_3300 ?auto_3301 ) ( OBJ-AT ?auto_3292 ?auto_3301 ) ( not ( = ?auto_3292 ?auto_3294 ) ) ( not ( = ?auto_3292 ?auto_3295 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( not ( = ?auto_3299 ?auto_3301 ) ) ( not ( = ?auto_3292 ?auto_3297 ) ) ( not ( = ?auto_3294 ?auto_3297 ) ) ( not ( = ?auto_3295 ?auto_3297 ) ) ( not ( = ?auto_3292 ?auto_3296 ) ) ( not ( = ?auto_3294 ?auto_3296 ) ) ( not ( = ?auto_3295 ?auto_3296 ) ) ( not ( = ?auto_3297 ?auto_3296 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3292 ?auto_3294 ?auto_3295 ?auto_3297 ?auto_3293 )
      ( DELIVER-1PKG ?auto_3296 ?auto_3293 )
      ( DELIVER-5PKG-VERIFY ?auto_3292 ?auto_3294 ?auto_3295 ?auto_3297 ?auto_3296 ?auto_3293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3308 - OBJ
      ?auto_3310 - OBJ
      ?auto_3311 - OBJ
      ?auto_3313 - OBJ
      ?auto_3312 - OBJ
      ?auto_3309 - LOCATION
    )
    :vars
    (
      ?auto_3316 - LOCATION
      ?auto_3314 - CITY
      ?auto_3315 - LOCATION
      ?auto_3317 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3310 ?auto_3308 ) ( GREATER-THAN ?auto_3311 ?auto_3308 ) ( GREATER-THAN ?auto_3311 ?auto_3310 ) ( GREATER-THAN ?auto_3313 ?auto_3308 ) ( GREATER-THAN ?auto_3313 ?auto_3310 ) ( GREATER-THAN ?auto_3313 ?auto_3311 ) ( GREATER-THAN ?auto_3312 ?auto_3308 ) ( GREATER-THAN ?auto_3312 ?auto_3310 ) ( GREATER-THAN ?auto_3312 ?auto_3311 ) ( GREATER-THAN ?auto_3312 ?auto_3313 ) ( IN-CITY ?auto_3316 ?auto_3314 ) ( IN-CITY ?auto_3309 ?auto_3314 ) ( not ( = ?auto_3309 ?auto_3316 ) ) ( OBJ-AT ?auto_3312 ?auto_3316 ) ( IN-CITY ?auto_3315 ?auto_3314 ) ( not ( = ?auto_3309 ?auto_3315 ) ) ( OBJ-AT ?auto_3313 ?auto_3315 ) ( OBJ-AT ?auto_3311 ?auto_3316 ) ( OBJ-AT ?auto_3310 ?auto_3315 ) ( OBJ-AT ?auto_3308 ?auto_3315 ) ( not ( = ?auto_3308 ?auto_3310 ) ) ( not ( = ?auto_3308 ?auto_3311 ) ) ( not ( = ?auto_3310 ?auto_3311 ) ) ( not ( = ?auto_3316 ?auto_3315 ) ) ( not ( = ?auto_3308 ?auto_3313 ) ) ( not ( = ?auto_3310 ?auto_3313 ) ) ( not ( = ?auto_3311 ?auto_3313 ) ) ( not ( = ?auto_3308 ?auto_3312 ) ) ( not ( = ?auto_3310 ?auto_3312 ) ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( not ( = ?auto_3313 ?auto_3312 ) ) ( TRUCK-AT ?auto_3317 ?auto_3309 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3317 ?auto_3309 ?auto_3315 ?auto_3314 )
      ( DELIVER-5PKG ?auto_3308 ?auto_3310 ?auto_3311 ?auto_3313 ?auto_3312 ?auto_3309 )
      ( DELIVER-5PKG-VERIFY ?auto_3308 ?auto_3310 ?auto_3311 ?auto_3313 ?auto_3312 ?auto_3309 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3320 - OBJ
      ?auto_3321 - LOCATION
    )
    :vars
    (
      ?auto_3322 - TRUCK
      ?auto_3323 - LOCATION
      ?auto_3324 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3322 ?auto_3323 ) ( IN-CITY ?auto_3323 ?auto_3324 ) ( IN-CITY ?auto_3321 ?auto_3324 ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( OBJ-AT ?auto_3320 ?auto_3323 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3320 ?auto_3322 ?auto_3323 )
      ( !DRIVE-TRUCK ?auto_3322 ?auto_3323 ?auto_3321 ?auto_3324 )
      ( !UNLOAD-TRUCK ?auto_3320 ?auto_3322 ?auto_3321 )
      ( DELIVER-1PKG-VERIFY ?auto_3320 ?auto_3321 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3327 - OBJ
      ?auto_3328 - LOCATION
    )
    :vars
    (
      ?auto_3329 - LOCATION
      ?auto_3331 - CITY
      ?auto_3330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3329 ?auto_3331 ) ( IN-CITY ?auto_3328 ?auto_3331 ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( OBJ-AT ?auto_3327 ?auto_3329 ) ( TRUCK-AT ?auto_3330 ?auto_3328 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3330 ?auto_3328 ?auto_3329 ?auto_3331 )
      ( DELIVER-1PKG ?auto_3327 ?auto_3328 )
      ( DELIVER-1PKG-VERIFY ?auto_3327 ?auto_3328 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3339 - OBJ
      ?auto_3341 - OBJ
      ?auto_3342 - OBJ
      ?auto_3344 - OBJ
      ?auto_3343 - OBJ
      ?auto_3345 - OBJ
      ?auto_3340 - LOCATION
    )
    :vars
    (
      ?auto_3348 - LOCATION
      ?auto_3346 - CITY
      ?auto_3350 - LOCATION
      ?auto_3349 - LOCATION
      ?auto_3347 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3341 ?auto_3339 ) ( GREATER-THAN ?auto_3342 ?auto_3339 ) ( GREATER-THAN ?auto_3342 ?auto_3341 ) ( GREATER-THAN ?auto_3344 ?auto_3339 ) ( GREATER-THAN ?auto_3344 ?auto_3341 ) ( GREATER-THAN ?auto_3344 ?auto_3342 ) ( GREATER-THAN ?auto_3343 ?auto_3339 ) ( GREATER-THAN ?auto_3343 ?auto_3341 ) ( GREATER-THAN ?auto_3343 ?auto_3342 ) ( GREATER-THAN ?auto_3343 ?auto_3344 ) ( GREATER-THAN ?auto_3345 ?auto_3339 ) ( GREATER-THAN ?auto_3345 ?auto_3341 ) ( GREATER-THAN ?auto_3345 ?auto_3342 ) ( GREATER-THAN ?auto_3345 ?auto_3344 ) ( GREATER-THAN ?auto_3345 ?auto_3343 ) ( IN-CITY ?auto_3348 ?auto_3346 ) ( IN-CITY ?auto_3340 ?auto_3346 ) ( not ( = ?auto_3340 ?auto_3348 ) ) ( OBJ-AT ?auto_3345 ?auto_3348 ) ( IN-CITY ?auto_3350 ?auto_3346 ) ( not ( = ?auto_3340 ?auto_3350 ) ) ( OBJ-AT ?auto_3343 ?auto_3350 ) ( IN-CITY ?auto_3349 ?auto_3346 ) ( not ( = ?auto_3340 ?auto_3349 ) ) ( OBJ-AT ?auto_3344 ?auto_3349 ) ( OBJ-AT ?auto_3342 ?auto_3350 ) ( OBJ-AT ?auto_3341 ?auto_3349 ) ( TRUCK-AT ?auto_3347 ?auto_3349 ) ( OBJ-AT ?auto_3339 ?auto_3349 ) ( not ( = ?auto_3339 ?auto_3341 ) ) ( not ( = ?auto_3339 ?auto_3342 ) ) ( not ( = ?auto_3341 ?auto_3342 ) ) ( not ( = ?auto_3350 ?auto_3349 ) ) ( not ( = ?auto_3339 ?auto_3344 ) ) ( not ( = ?auto_3341 ?auto_3344 ) ) ( not ( = ?auto_3342 ?auto_3344 ) ) ( not ( = ?auto_3339 ?auto_3343 ) ) ( not ( = ?auto_3341 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( not ( = ?auto_3344 ?auto_3343 ) ) ( not ( = ?auto_3339 ?auto_3345 ) ) ( not ( = ?auto_3341 ?auto_3345 ) ) ( not ( = ?auto_3342 ?auto_3345 ) ) ( not ( = ?auto_3344 ?auto_3345 ) ) ( not ( = ?auto_3343 ?auto_3345 ) ) ( not ( = ?auto_3348 ?auto_3350 ) ) ( not ( = ?auto_3348 ?auto_3349 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3339 ?auto_3341 ?auto_3342 ?auto_3344 ?auto_3343 ?auto_3340 )
      ( DELIVER-1PKG ?auto_3345 ?auto_3340 )
      ( DELIVER-6PKG-VERIFY ?auto_3339 ?auto_3341 ?auto_3342 ?auto_3344 ?auto_3343 ?auto_3345 ?auto_3340 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3358 - OBJ
      ?auto_3360 - OBJ
      ?auto_3361 - OBJ
      ?auto_3363 - OBJ
      ?auto_3362 - OBJ
      ?auto_3364 - OBJ
      ?auto_3359 - LOCATION
    )
    :vars
    (
      ?auto_3365 - LOCATION
      ?auto_3366 - CITY
      ?auto_3369 - LOCATION
      ?auto_3367 - LOCATION
      ?auto_3368 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3360 ?auto_3358 ) ( GREATER-THAN ?auto_3361 ?auto_3358 ) ( GREATER-THAN ?auto_3361 ?auto_3360 ) ( GREATER-THAN ?auto_3363 ?auto_3358 ) ( GREATER-THAN ?auto_3363 ?auto_3360 ) ( GREATER-THAN ?auto_3363 ?auto_3361 ) ( GREATER-THAN ?auto_3362 ?auto_3358 ) ( GREATER-THAN ?auto_3362 ?auto_3360 ) ( GREATER-THAN ?auto_3362 ?auto_3361 ) ( GREATER-THAN ?auto_3362 ?auto_3363 ) ( GREATER-THAN ?auto_3364 ?auto_3358 ) ( GREATER-THAN ?auto_3364 ?auto_3360 ) ( GREATER-THAN ?auto_3364 ?auto_3361 ) ( GREATER-THAN ?auto_3364 ?auto_3363 ) ( GREATER-THAN ?auto_3364 ?auto_3362 ) ( IN-CITY ?auto_3365 ?auto_3366 ) ( IN-CITY ?auto_3359 ?auto_3366 ) ( not ( = ?auto_3359 ?auto_3365 ) ) ( OBJ-AT ?auto_3364 ?auto_3365 ) ( IN-CITY ?auto_3369 ?auto_3366 ) ( not ( = ?auto_3359 ?auto_3369 ) ) ( OBJ-AT ?auto_3362 ?auto_3369 ) ( IN-CITY ?auto_3367 ?auto_3366 ) ( not ( = ?auto_3359 ?auto_3367 ) ) ( OBJ-AT ?auto_3363 ?auto_3367 ) ( OBJ-AT ?auto_3361 ?auto_3369 ) ( OBJ-AT ?auto_3360 ?auto_3367 ) ( OBJ-AT ?auto_3358 ?auto_3367 ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3358 ?auto_3361 ) ) ( not ( = ?auto_3360 ?auto_3361 ) ) ( not ( = ?auto_3369 ?auto_3367 ) ) ( not ( = ?auto_3358 ?auto_3363 ) ) ( not ( = ?auto_3360 ?auto_3363 ) ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3358 ?auto_3362 ) ) ( not ( = ?auto_3360 ?auto_3362 ) ) ( not ( = ?auto_3361 ?auto_3362 ) ) ( not ( = ?auto_3363 ?auto_3362 ) ) ( not ( = ?auto_3358 ?auto_3364 ) ) ( not ( = ?auto_3360 ?auto_3364 ) ) ( not ( = ?auto_3361 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3365 ?auto_3369 ) ) ( not ( = ?auto_3365 ?auto_3367 ) ) ( TRUCK-AT ?auto_3368 ?auto_3359 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3368 ?auto_3359 ?auto_3367 ?auto_3366 )
      ( DELIVER-6PKG ?auto_3358 ?auto_3360 ?auto_3361 ?auto_3363 ?auto_3362 ?auto_3364 ?auto_3359 )
      ( DELIVER-6PKG-VERIFY ?auto_3358 ?auto_3360 ?auto_3361 ?auto_3363 ?auto_3362 ?auto_3364 ?auto_3359 ) )
  )

)

