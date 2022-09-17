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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3105 - OBJ
      ?auto_3106 - LOCATION
    )
    :vars
    (
      ?auto_3107 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3107 ?auto_3106 ) ( IN-TRUCK ?auto_3105 ?auto_3107 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3105 ?auto_3107 ?auto_3106 )
      ( DELIVER-1PKG-VERIFY ?auto_3105 ?auto_3106 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3110 - OBJ
      ?auto_3111 - LOCATION
    )
    :vars
    (
      ?auto_3112 - TRUCK
      ?auto_3113 - LOCATION
      ?auto_3114 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3110 ?auto_3112 ) ( TRUCK-AT ?auto_3112 ?auto_3113 ) ( IN-CITY ?auto_3113 ?auto_3114 ) ( IN-CITY ?auto_3111 ?auto_3114 ) ( not ( = ?auto_3111 ?auto_3113 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3112 ?auto_3113 ?auto_3111 ?auto_3114 )
      ( DELIVER-1PKG ?auto_3110 ?auto_3111 )
      ( DELIVER-1PKG-VERIFY ?auto_3110 ?auto_3111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3117 - OBJ
      ?auto_3118 - LOCATION
    )
    :vars
    (
      ?auto_3119 - TRUCK
      ?auto_3121 - LOCATION
      ?auto_3120 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3119 ?auto_3121 ) ( IN-CITY ?auto_3121 ?auto_3120 ) ( IN-CITY ?auto_3118 ?auto_3120 ) ( not ( = ?auto_3118 ?auto_3121 ) ) ( OBJ-AT ?auto_3117 ?auto_3121 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3117 ?auto_3119 ?auto_3121 )
      ( DELIVER-1PKG ?auto_3117 ?auto_3118 )
      ( DELIVER-1PKG-VERIFY ?auto_3117 ?auto_3118 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3124 - OBJ
      ?auto_3125 - LOCATION
    )
    :vars
    (
      ?auto_3127 - LOCATION
      ?auto_3128 - CITY
      ?auto_3126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3127 ?auto_3128 ) ( IN-CITY ?auto_3125 ?auto_3128 ) ( not ( = ?auto_3125 ?auto_3127 ) ) ( OBJ-AT ?auto_3124 ?auto_3127 ) ( TRUCK-AT ?auto_3126 ?auto_3125 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3126 ?auto_3125 ?auto_3127 ?auto_3128 )
      ( DELIVER-1PKG ?auto_3124 ?auto_3125 )
      ( DELIVER-1PKG-VERIFY ?auto_3124 ?auto_3125 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3158 - OBJ
      ?auto_3160 - OBJ
      ?auto_3159 - LOCATION
    )
    :vars
    (
      ?auto_3161 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3160 ?auto_3158 ) ( TRUCK-AT ?auto_3161 ?auto_3159 ) ( IN-TRUCK ?auto_3160 ?auto_3161 ) ( OBJ-AT ?auto_3158 ?auto_3159 ) ( not ( = ?auto_3158 ?auto_3160 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3160 ?auto_3159 )
      ( DELIVER-2PKG-VERIFY ?auto_3158 ?auto_3160 ?auto_3159 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3165 - OBJ
      ?auto_3167 - OBJ
      ?auto_3166 - LOCATION
    )
    :vars
    (
      ?auto_3169 - TRUCK
      ?auto_3170 - LOCATION
      ?auto_3168 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3167 ?auto_3165 ) ( IN-TRUCK ?auto_3167 ?auto_3169 ) ( TRUCK-AT ?auto_3169 ?auto_3170 ) ( IN-CITY ?auto_3170 ?auto_3168 ) ( IN-CITY ?auto_3166 ?auto_3168 ) ( not ( = ?auto_3166 ?auto_3170 ) ) ( OBJ-AT ?auto_3165 ?auto_3166 ) ( not ( = ?auto_3165 ?auto_3167 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3167 ?auto_3166 )
      ( DELIVER-2PKG-VERIFY ?auto_3165 ?auto_3167 ?auto_3166 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3174 - OBJ
      ?auto_3176 - OBJ
      ?auto_3175 - LOCATION
    )
    :vars
    (
      ?auto_3177 - TRUCK
      ?auto_3179 - LOCATION
      ?auto_3178 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3176 ?auto_3174 ) ( TRUCK-AT ?auto_3177 ?auto_3179 ) ( IN-CITY ?auto_3179 ?auto_3178 ) ( IN-CITY ?auto_3175 ?auto_3178 ) ( not ( = ?auto_3175 ?auto_3179 ) ) ( OBJ-AT ?auto_3176 ?auto_3179 ) ( OBJ-AT ?auto_3174 ?auto_3175 ) ( not ( = ?auto_3174 ?auto_3176 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3176 ?auto_3175 )
      ( DELIVER-2PKG-VERIFY ?auto_3174 ?auto_3176 ?auto_3175 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3183 - OBJ
      ?auto_3185 - OBJ
      ?auto_3184 - LOCATION
    )
    :vars
    (
      ?auto_3186 - LOCATION
      ?auto_3188 - CITY
      ?auto_3187 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3185 ?auto_3183 ) ( IN-CITY ?auto_3186 ?auto_3188 ) ( IN-CITY ?auto_3184 ?auto_3188 ) ( not ( = ?auto_3184 ?auto_3186 ) ) ( OBJ-AT ?auto_3185 ?auto_3186 ) ( TRUCK-AT ?auto_3187 ?auto_3184 ) ( OBJ-AT ?auto_3183 ?auto_3184 ) ( not ( = ?auto_3183 ?auto_3185 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3185 ?auto_3184 )
      ( DELIVER-2PKG-VERIFY ?auto_3183 ?auto_3185 ?auto_3184 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3192 - OBJ
      ?auto_3194 - OBJ
      ?auto_3193 - LOCATION
    )
    :vars
    (
      ?auto_3195 - LOCATION
      ?auto_3197 - CITY
      ?auto_3196 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3194 ?auto_3192 ) ( IN-CITY ?auto_3195 ?auto_3197 ) ( IN-CITY ?auto_3193 ?auto_3197 ) ( not ( = ?auto_3193 ?auto_3195 ) ) ( OBJ-AT ?auto_3194 ?auto_3195 ) ( TRUCK-AT ?auto_3196 ?auto_3193 ) ( not ( = ?auto_3192 ?auto_3194 ) ) ( IN-TRUCK ?auto_3192 ?auto_3196 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3192 ?auto_3193 )
      ( DELIVER-2PKG ?auto_3192 ?auto_3194 ?auto_3193 )
      ( DELIVER-2PKG-VERIFY ?auto_3192 ?auto_3194 ?auto_3193 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3201 - OBJ
      ?auto_3203 - OBJ
      ?auto_3202 - LOCATION
    )
    :vars
    (
      ?auto_3206 - LOCATION
      ?auto_3205 - CITY
      ?auto_3204 - TRUCK
      ?auto_3207 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3203 ?auto_3201 ) ( IN-CITY ?auto_3206 ?auto_3205 ) ( IN-CITY ?auto_3202 ?auto_3205 ) ( not ( = ?auto_3202 ?auto_3206 ) ) ( OBJ-AT ?auto_3203 ?auto_3206 ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( IN-TRUCK ?auto_3201 ?auto_3204 ) ( TRUCK-AT ?auto_3204 ?auto_3207 ) ( IN-CITY ?auto_3207 ?auto_3205 ) ( not ( = ?auto_3202 ?auto_3207 ) ) ( not ( = ?auto_3206 ?auto_3207 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3204 ?auto_3207 ?auto_3202 ?auto_3205 )
      ( DELIVER-2PKG ?auto_3201 ?auto_3203 ?auto_3202 )
      ( DELIVER-2PKG-VERIFY ?auto_3201 ?auto_3203 ?auto_3202 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3211 - OBJ
      ?auto_3213 - OBJ
      ?auto_3212 - LOCATION
    )
    :vars
    (
      ?auto_3217 - LOCATION
      ?auto_3214 - CITY
      ?auto_3216 - TRUCK
      ?auto_3215 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3213 ?auto_3211 ) ( IN-CITY ?auto_3217 ?auto_3214 ) ( IN-CITY ?auto_3212 ?auto_3214 ) ( not ( = ?auto_3212 ?auto_3217 ) ) ( OBJ-AT ?auto_3213 ?auto_3217 ) ( not ( = ?auto_3211 ?auto_3213 ) ) ( TRUCK-AT ?auto_3216 ?auto_3215 ) ( IN-CITY ?auto_3215 ?auto_3214 ) ( not ( = ?auto_3212 ?auto_3215 ) ) ( not ( = ?auto_3217 ?auto_3215 ) ) ( OBJ-AT ?auto_3211 ?auto_3215 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3211 ?auto_3216 ?auto_3215 )
      ( DELIVER-2PKG ?auto_3211 ?auto_3213 ?auto_3212 )
      ( DELIVER-2PKG-VERIFY ?auto_3211 ?auto_3213 ?auto_3212 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3221 - OBJ
      ?auto_3223 - OBJ
      ?auto_3222 - LOCATION
    )
    :vars
    (
      ?auto_3226 - LOCATION
      ?auto_3225 - CITY
      ?auto_3227 - LOCATION
      ?auto_3224 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3223 ?auto_3221 ) ( IN-CITY ?auto_3226 ?auto_3225 ) ( IN-CITY ?auto_3222 ?auto_3225 ) ( not ( = ?auto_3222 ?auto_3226 ) ) ( OBJ-AT ?auto_3223 ?auto_3226 ) ( not ( = ?auto_3221 ?auto_3223 ) ) ( IN-CITY ?auto_3227 ?auto_3225 ) ( not ( = ?auto_3222 ?auto_3227 ) ) ( not ( = ?auto_3226 ?auto_3227 ) ) ( OBJ-AT ?auto_3221 ?auto_3227 ) ( TRUCK-AT ?auto_3224 ?auto_3222 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3224 ?auto_3222 ?auto_3227 ?auto_3225 )
      ( DELIVER-2PKG ?auto_3221 ?auto_3223 ?auto_3222 )
      ( DELIVER-2PKG-VERIFY ?auto_3221 ?auto_3223 ?auto_3222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3258 - OBJ
      ?auto_3260 - OBJ
      ?auto_3261 - OBJ
      ?auto_3259 - LOCATION
    )
    :vars
    (
      ?auto_3262 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3260 ?auto_3258 ) ( GREATER-THAN ?auto_3261 ?auto_3258 ) ( GREATER-THAN ?auto_3261 ?auto_3260 ) ( TRUCK-AT ?auto_3262 ?auto_3259 ) ( IN-TRUCK ?auto_3261 ?auto_3262 ) ( OBJ-AT ?auto_3258 ?auto_3259 ) ( OBJ-AT ?auto_3260 ?auto_3259 ) ( not ( = ?auto_3258 ?auto_3260 ) ) ( not ( = ?auto_3258 ?auto_3261 ) ) ( not ( = ?auto_3260 ?auto_3261 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3261 ?auto_3259 )
      ( DELIVER-3PKG-VERIFY ?auto_3258 ?auto_3260 ?auto_3261 ?auto_3259 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3267 - OBJ
      ?auto_3269 - OBJ
      ?auto_3270 - OBJ
      ?auto_3268 - LOCATION
    )
    :vars
    (
      ?auto_3271 - TRUCK
      ?auto_3272 - LOCATION
      ?auto_3273 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3269 ?auto_3267 ) ( GREATER-THAN ?auto_3270 ?auto_3267 ) ( GREATER-THAN ?auto_3270 ?auto_3269 ) ( IN-TRUCK ?auto_3270 ?auto_3271 ) ( TRUCK-AT ?auto_3271 ?auto_3272 ) ( IN-CITY ?auto_3272 ?auto_3273 ) ( IN-CITY ?auto_3268 ?auto_3273 ) ( not ( = ?auto_3268 ?auto_3272 ) ) ( OBJ-AT ?auto_3267 ?auto_3268 ) ( OBJ-AT ?auto_3269 ?auto_3268 ) ( not ( = ?auto_3267 ?auto_3269 ) ) ( not ( = ?auto_3267 ?auto_3270 ) ) ( not ( = ?auto_3269 ?auto_3270 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3270 ?auto_3268 )
      ( DELIVER-3PKG-VERIFY ?auto_3267 ?auto_3269 ?auto_3270 ?auto_3268 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3278 - OBJ
      ?auto_3280 - OBJ
      ?auto_3281 - OBJ
      ?auto_3279 - LOCATION
    )
    :vars
    (
      ?auto_3283 - TRUCK
      ?auto_3284 - LOCATION
      ?auto_3282 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3280 ?auto_3278 ) ( GREATER-THAN ?auto_3281 ?auto_3278 ) ( GREATER-THAN ?auto_3281 ?auto_3280 ) ( TRUCK-AT ?auto_3283 ?auto_3284 ) ( IN-CITY ?auto_3284 ?auto_3282 ) ( IN-CITY ?auto_3279 ?auto_3282 ) ( not ( = ?auto_3279 ?auto_3284 ) ) ( OBJ-AT ?auto_3281 ?auto_3284 ) ( OBJ-AT ?auto_3278 ?auto_3279 ) ( OBJ-AT ?auto_3280 ?auto_3279 ) ( not ( = ?auto_3278 ?auto_3280 ) ) ( not ( = ?auto_3278 ?auto_3281 ) ) ( not ( = ?auto_3280 ?auto_3281 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3281 ?auto_3279 )
      ( DELIVER-3PKG-VERIFY ?auto_3278 ?auto_3280 ?auto_3281 ?auto_3279 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3289 - OBJ
      ?auto_3291 - OBJ
      ?auto_3292 - OBJ
      ?auto_3290 - LOCATION
    )
    :vars
    (
      ?auto_3293 - LOCATION
      ?auto_3294 - CITY
      ?auto_3295 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3291 ?auto_3289 ) ( GREATER-THAN ?auto_3292 ?auto_3289 ) ( GREATER-THAN ?auto_3292 ?auto_3291 ) ( IN-CITY ?auto_3293 ?auto_3294 ) ( IN-CITY ?auto_3290 ?auto_3294 ) ( not ( = ?auto_3290 ?auto_3293 ) ) ( OBJ-AT ?auto_3292 ?auto_3293 ) ( TRUCK-AT ?auto_3295 ?auto_3290 ) ( OBJ-AT ?auto_3289 ?auto_3290 ) ( OBJ-AT ?auto_3291 ?auto_3290 ) ( not ( = ?auto_3289 ?auto_3291 ) ) ( not ( = ?auto_3289 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3292 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3292 ?auto_3290 )
      ( DELIVER-3PKG-VERIFY ?auto_3289 ?auto_3291 ?auto_3292 ?auto_3290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3300 - OBJ
      ?auto_3302 - OBJ
      ?auto_3303 - OBJ
      ?auto_3301 - LOCATION
    )
    :vars
    (
      ?auto_3305 - LOCATION
      ?auto_3306 - CITY
      ?auto_3304 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3302 ?auto_3300 ) ( GREATER-THAN ?auto_3303 ?auto_3300 ) ( GREATER-THAN ?auto_3303 ?auto_3302 ) ( IN-CITY ?auto_3305 ?auto_3306 ) ( IN-CITY ?auto_3301 ?auto_3306 ) ( not ( = ?auto_3301 ?auto_3305 ) ) ( OBJ-AT ?auto_3303 ?auto_3305 ) ( TRUCK-AT ?auto_3304 ?auto_3301 ) ( OBJ-AT ?auto_3300 ?auto_3301 ) ( not ( = ?auto_3300 ?auto_3302 ) ) ( not ( = ?auto_3300 ?auto_3303 ) ) ( not ( = ?auto_3302 ?auto_3303 ) ) ( IN-TRUCK ?auto_3302 ?auto_3304 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3302 ?auto_3301 )
      ( DELIVER-3PKG ?auto_3300 ?auto_3302 ?auto_3303 ?auto_3301 )
      ( DELIVER-3PKG-VERIFY ?auto_3300 ?auto_3302 ?auto_3303 ?auto_3301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3311 - OBJ
      ?auto_3313 - OBJ
      ?auto_3314 - OBJ
      ?auto_3312 - LOCATION
    )
    :vars
    (
      ?auto_3315 - LOCATION
      ?auto_3317 - CITY
      ?auto_3316 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3313 ?auto_3311 ) ( GREATER-THAN ?auto_3314 ?auto_3311 ) ( GREATER-THAN ?auto_3314 ?auto_3313 ) ( IN-CITY ?auto_3315 ?auto_3317 ) ( IN-CITY ?auto_3312 ?auto_3317 ) ( not ( = ?auto_3312 ?auto_3315 ) ) ( OBJ-AT ?auto_3314 ?auto_3315 ) ( OBJ-AT ?auto_3311 ?auto_3312 ) ( not ( = ?auto_3311 ?auto_3313 ) ) ( not ( = ?auto_3311 ?auto_3314 ) ) ( not ( = ?auto_3313 ?auto_3314 ) ) ( IN-TRUCK ?auto_3313 ?auto_3316 ) ( TRUCK-AT ?auto_3316 ?auto_3315 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3316 ?auto_3315 ?auto_3312 ?auto_3317 )
      ( DELIVER-3PKG ?auto_3311 ?auto_3313 ?auto_3314 ?auto_3312 )
      ( DELIVER-3PKG-VERIFY ?auto_3311 ?auto_3313 ?auto_3314 ?auto_3312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3322 - OBJ
      ?auto_3324 - OBJ
      ?auto_3325 - OBJ
      ?auto_3323 - LOCATION
    )
    :vars
    (
      ?auto_3328 - LOCATION
      ?auto_3326 - CITY
      ?auto_3327 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3324 ?auto_3322 ) ( GREATER-THAN ?auto_3325 ?auto_3322 ) ( GREATER-THAN ?auto_3325 ?auto_3324 ) ( IN-CITY ?auto_3328 ?auto_3326 ) ( IN-CITY ?auto_3323 ?auto_3326 ) ( not ( = ?auto_3323 ?auto_3328 ) ) ( OBJ-AT ?auto_3325 ?auto_3328 ) ( OBJ-AT ?auto_3322 ?auto_3323 ) ( not ( = ?auto_3322 ?auto_3324 ) ) ( not ( = ?auto_3322 ?auto_3325 ) ) ( not ( = ?auto_3324 ?auto_3325 ) ) ( TRUCK-AT ?auto_3327 ?auto_3328 ) ( OBJ-AT ?auto_3324 ?auto_3328 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3324 ?auto_3327 ?auto_3328 )
      ( DELIVER-3PKG ?auto_3322 ?auto_3324 ?auto_3325 ?auto_3323 )
      ( DELIVER-3PKG-VERIFY ?auto_3322 ?auto_3324 ?auto_3325 ?auto_3323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3333 - OBJ
      ?auto_3335 - OBJ
      ?auto_3336 - OBJ
      ?auto_3334 - LOCATION
    )
    :vars
    (
      ?auto_3338 - LOCATION
      ?auto_3337 - CITY
      ?auto_3339 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3335 ?auto_3333 ) ( GREATER-THAN ?auto_3336 ?auto_3333 ) ( GREATER-THAN ?auto_3336 ?auto_3335 ) ( IN-CITY ?auto_3338 ?auto_3337 ) ( IN-CITY ?auto_3334 ?auto_3337 ) ( not ( = ?auto_3334 ?auto_3338 ) ) ( OBJ-AT ?auto_3336 ?auto_3338 ) ( OBJ-AT ?auto_3333 ?auto_3334 ) ( not ( = ?auto_3333 ?auto_3335 ) ) ( not ( = ?auto_3333 ?auto_3336 ) ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( OBJ-AT ?auto_3335 ?auto_3338 ) ( TRUCK-AT ?auto_3339 ?auto_3334 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3339 ?auto_3334 ?auto_3338 ?auto_3337 )
      ( DELIVER-3PKG ?auto_3333 ?auto_3335 ?auto_3336 ?auto_3334 )
      ( DELIVER-3PKG-VERIFY ?auto_3333 ?auto_3335 ?auto_3336 ?auto_3334 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3344 - OBJ
      ?auto_3346 - OBJ
      ?auto_3347 - OBJ
      ?auto_3345 - LOCATION
    )
    :vars
    (
      ?auto_3349 - LOCATION
      ?auto_3348 - CITY
      ?auto_3350 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3346 ?auto_3344 ) ( GREATER-THAN ?auto_3347 ?auto_3344 ) ( GREATER-THAN ?auto_3347 ?auto_3346 ) ( IN-CITY ?auto_3349 ?auto_3348 ) ( IN-CITY ?auto_3345 ?auto_3348 ) ( not ( = ?auto_3345 ?auto_3349 ) ) ( OBJ-AT ?auto_3347 ?auto_3349 ) ( not ( = ?auto_3344 ?auto_3346 ) ) ( not ( = ?auto_3344 ?auto_3347 ) ) ( not ( = ?auto_3346 ?auto_3347 ) ) ( OBJ-AT ?auto_3346 ?auto_3349 ) ( TRUCK-AT ?auto_3350 ?auto_3345 ) ( IN-TRUCK ?auto_3344 ?auto_3350 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3344 ?auto_3345 )
      ( DELIVER-3PKG ?auto_3344 ?auto_3346 ?auto_3347 ?auto_3345 )
      ( DELIVER-3PKG-VERIFY ?auto_3344 ?auto_3346 ?auto_3347 ?auto_3345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3355 - OBJ
      ?auto_3357 - OBJ
      ?auto_3358 - OBJ
      ?auto_3356 - LOCATION
    )
    :vars
    (
      ?auto_3360 - LOCATION
      ?auto_3361 - CITY
      ?auto_3359 - TRUCK
      ?auto_3362 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3357 ?auto_3355 ) ( GREATER-THAN ?auto_3358 ?auto_3355 ) ( GREATER-THAN ?auto_3358 ?auto_3357 ) ( IN-CITY ?auto_3360 ?auto_3361 ) ( IN-CITY ?auto_3356 ?auto_3361 ) ( not ( = ?auto_3356 ?auto_3360 ) ) ( OBJ-AT ?auto_3358 ?auto_3360 ) ( not ( = ?auto_3355 ?auto_3357 ) ) ( not ( = ?auto_3355 ?auto_3358 ) ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( OBJ-AT ?auto_3357 ?auto_3360 ) ( IN-TRUCK ?auto_3355 ?auto_3359 ) ( TRUCK-AT ?auto_3359 ?auto_3362 ) ( IN-CITY ?auto_3362 ?auto_3361 ) ( not ( = ?auto_3356 ?auto_3362 ) ) ( not ( = ?auto_3360 ?auto_3362 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3359 ?auto_3362 ?auto_3356 ?auto_3361 )
      ( DELIVER-3PKG ?auto_3355 ?auto_3357 ?auto_3358 ?auto_3356 )
      ( DELIVER-3PKG-VERIFY ?auto_3355 ?auto_3357 ?auto_3358 ?auto_3356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3367 - OBJ
      ?auto_3369 - OBJ
      ?auto_3370 - OBJ
      ?auto_3368 - LOCATION
    )
    :vars
    (
      ?auto_3374 - LOCATION
      ?auto_3372 - CITY
      ?auto_3373 - TRUCK
      ?auto_3371 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3369 ?auto_3367 ) ( GREATER-THAN ?auto_3370 ?auto_3367 ) ( GREATER-THAN ?auto_3370 ?auto_3369 ) ( IN-CITY ?auto_3374 ?auto_3372 ) ( IN-CITY ?auto_3368 ?auto_3372 ) ( not ( = ?auto_3368 ?auto_3374 ) ) ( OBJ-AT ?auto_3370 ?auto_3374 ) ( not ( = ?auto_3367 ?auto_3369 ) ) ( not ( = ?auto_3367 ?auto_3370 ) ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( OBJ-AT ?auto_3369 ?auto_3374 ) ( TRUCK-AT ?auto_3373 ?auto_3371 ) ( IN-CITY ?auto_3371 ?auto_3372 ) ( not ( = ?auto_3368 ?auto_3371 ) ) ( not ( = ?auto_3374 ?auto_3371 ) ) ( OBJ-AT ?auto_3367 ?auto_3371 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3367 ?auto_3373 ?auto_3371 )
      ( DELIVER-3PKG ?auto_3367 ?auto_3369 ?auto_3370 ?auto_3368 )
      ( DELIVER-3PKG-VERIFY ?auto_3367 ?auto_3369 ?auto_3370 ?auto_3368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3379 - OBJ
      ?auto_3381 - OBJ
      ?auto_3382 - OBJ
      ?auto_3380 - LOCATION
    )
    :vars
    (
      ?auto_3386 - LOCATION
      ?auto_3385 - CITY
      ?auto_3383 - LOCATION
      ?auto_3384 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3381 ?auto_3379 ) ( GREATER-THAN ?auto_3382 ?auto_3379 ) ( GREATER-THAN ?auto_3382 ?auto_3381 ) ( IN-CITY ?auto_3386 ?auto_3385 ) ( IN-CITY ?auto_3380 ?auto_3385 ) ( not ( = ?auto_3380 ?auto_3386 ) ) ( OBJ-AT ?auto_3382 ?auto_3386 ) ( not ( = ?auto_3379 ?auto_3381 ) ) ( not ( = ?auto_3379 ?auto_3382 ) ) ( not ( = ?auto_3381 ?auto_3382 ) ) ( OBJ-AT ?auto_3381 ?auto_3386 ) ( IN-CITY ?auto_3383 ?auto_3385 ) ( not ( = ?auto_3380 ?auto_3383 ) ) ( not ( = ?auto_3386 ?auto_3383 ) ) ( OBJ-AT ?auto_3379 ?auto_3383 ) ( TRUCK-AT ?auto_3384 ?auto_3380 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3384 ?auto_3380 ?auto_3383 ?auto_3385 )
      ( DELIVER-3PKG ?auto_3379 ?auto_3381 ?auto_3382 ?auto_3380 )
      ( DELIVER-3PKG-VERIFY ?auto_3379 ?auto_3381 ?auto_3382 ?auto_3380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3418 - OBJ
      ?auto_3420 - OBJ
      ?auto_3421 - OBJ
      ?auto_3422 - OBJ
      ?auto_3419 - LOCATION
    )
    :vars
    (
      ?auto_3423 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3420 ?auto_3418 ) ( GREATER-THAN ?auto_3421 ?auto_3418 ) ( GREATER-THAN ?auto_3421 ?auto_3420 ) ( GREATER-THAN ?auto_3422 ?auto_3418 ) ( GREATER-THAN ?auto_3422 ?auto_3420 ) ( GREATER-THAN ?auto_3422 ?auto_3421 ) ( TRUCK-AT ?auto_3423 ?auto_3419 ) ( IN-TRUCK ?auto_3422 ?auto_3423 ) ( OBJ-AT ?auto_3418 ?auto_3419 ) ( OBJ-AT ?auto_3420 ?auto_3419 ) ( OBJ-AT ?auto_3421 ?auto_3419 ) ( not ( = ?auto_3418 ?auto_3420 ) ) ( not ( = ?auto_3418 ?auto_3421 ) ) ( not ( = ?auto_3418 ?auto_3422 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( not ( = ?auto_3420 ?auto_3422 ) ) ( not ( = ?auto_3421 ?auto_3422 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3422 ?auto_3419 )
      ( DELIVER-4PKG-VERIFY ?auto_3418 ?auto_3420 ?auto_3421 ?auto_3422 ?auto_3419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3429 - OBJ
      ?auto_3431 - OBJ
      ?auto_3432 - OBJ
      ?auto_3433 - OBJ
      ?auto_3430 - LOCATION
    )
    :vars
    (
      ?auto_3435 - TRUCK
      ?auto_3436 - LOCATION
      ?auto_3434 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3431 ?auto_3429 ) ( GREATER-THAN ?auto_3432 ?auto_3429 ) ( GREATER-THAN ?auto_3432 ?auto_3431 ) ( GREATER-THAN ?auto_3433 ?auto_3429 ) ( GREATER-THAN ?auto_3433 ?auto_3431 ) ( GREATER-THAN ?auto_3433 ?auto_3432 ) ( IN-TRUCK ?auto_3433 ?auto_3435 ) ( TRUCK-AT ?auto_3435 ?auto_3436 ) ( IN-CITY ?auto_3436 ?auto_3434 ) ( IN-CITY ?auto_3430 ?auto_3434 ) ( not ( = ?auto_3430 ?auto_3436 ) ) ( OBJ-AT ?auto_3429 ?auto_3430 ) ( OBJ-AT ?auto_3431 ?auto_3430 ) ( OBJ-AT ?auto_3432 ?auto_3430 ) ( not ( = ?auto_3429 ?auto_3431 ) ) ( not ( = ?auto_3429 ?auto_3432 ) ) ( not ( = ?auto_3429 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( not ( = ?auto_3432 ?auto_3433 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3433 ?auto_3430 )
      ( DELIVER-4PKG-VERIFY ?auto_3429 ?auto_3431 ?auto_3432 ?auto_3433 ?auto_3430 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3442 - OBJ
      ?auto_3444 - OBJ
      ?auto_3445 - OBJ
      ?auto_3446 - OBJ
      ?auto_3443 - LOCATION
    )
    :vars
    (
      ?auto_3447 - TRUCK
      ?auto_3449 - LOCATION
      ?auto_3448 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3444 ?auto_3442 ) ( GREATER-THAN ?auto_3445 ?auto_3442 ) ( GREATER-THAN ?auto_3445 ?auto_3444 ) ( GREATER-THAN ?auto_3446 ?auto_3442 ) ( GREATER-THAN ?auto_3446 ?auto_3444 ) ( GREATER-THAN ?auto_3446 ?auto_3445 ) ( TRUCK-AT ?auto_3447 ?auto_3449 ) ( IN-CITY ?auto_3449 ?auto_3448 ) ( IN-CITY ?auto_3443 ?auto_3448 ) ( not ( = ?auto_3443 ?auto_3449 ) ) ( OBJ-AT ?auto_3446 ?auto_3449 ) ( OBJ-AT ?auto_3442 ?auto_3443 ) ( OBJ-AT ?auto_3444 ?auto_3443 ) ( OBJ-AT ?auto_3445 ?auto_3443 ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3446 ) ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( not ( = ?auto_3444 ?auto_3446 ) ) ( not ( = ?auto_3445 ?auto_3446 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3446 ?auto_3443 )
      ( DELIVER-4PKG-VERIFY ?auto_3442 ?auto_3444 ?auto_3445 ?auto_3446 ?auto_3443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3455 - OBJ
      ?auto_3457 - OBJ
      ?auto_3458 - OBJ
      ?auto_3459 - OBJ
      ?auto_3456 - LOCATION
    )
    :vars
    (
      ?auto_3462 - LOCATION
      ?auto_3460 - CITY
      ?auto_3461 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3457 ?auto_3455 ) ( GREATER-THAN ?auto_3458 ?auto_3455 ) ( GREATER-THAN ?auto_3458 ?auto_3457 ) ( GREATER-THAN ?auto_3459 ?auto_3455 ) ( GREATER-THAN ?auto_3459 ?auto_3457 ) ( GREATER-THAN ?auto_3459 ?auto_3458 ) ( IN-CITY ?auto_3462 ?auto_3460 ) ( IN-CITY ?auto_3456 ?auto_3460 ) ( not ( = ?auto_3456 ?auto_3462 ) ) ( OBJ-AT ?auto_3459 ?auto_3462 ) ( TRUCK-AT ?auto_3461 ?auto_3456 ) ( OBJ-AT ?auto_3455 ?auto_3456 ) ( OBJ-AT ?auto_3457 ?auto_3456 ) ( OBJ-AT ?auto_3458 ?auto_3456 ) ( not ( = ?auto_3455 ?auto_3457 ) ) ( not ( = ?auto_3455 ?auto_3458 ) ) ( not ( = ?auto_3455 ?auto_3459 ) ) ( not ( = ?auto_3457 ?auto_3458 ) ) ( not ( = ?auto_3457 ?auto_3459 ) ) ( not ( = ?auto_3458 ?auto_3459 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3459 ?auto_3456 )
      ( DELIVER-4PKG-VERIFY ?auto_3455 ?auto_3457 ?auto_3458 ?auto_3459 ?auto_3456 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3468 - OBJ
      ?auto_3470 - OBJ
      ?auto_3471 - OBJ
      ?auto_3472 - OBJ
      ?auto_3469 - LOCATION
    )
    :vars
    (
      ?auto_3473 - LOCATION
      ?auto_3474 - CITY
      ?auto_3475 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3470 ?auto_3468 ) ( GREATER-THAN ?auto_3471 ?auto_3468 ) ( GREATER-THAN ?auto_3471 ?auto_3470 ) ( GREATER-THAN ?auto_3472 ?auto_3468 ) ( GREATER-THAN ?auto_3472 ?auto_3470 ) ( GREATER-THAN ?auto_3472 ?auto_3471 ) ( IN-CITY ?auto_3473 ?auto_3474 ) ( IN-CITY ?auto_3469 ?auto_3474 ) ( not ( = ?auto_3469 ?auto_3473 ) ) ( OBJ-AT ?auto_3472 ?auto_3473 ) ( TRUCK-AT ?auto_3475 ?auto_3469 ) ( OBJ-AT ?auto_3468 ?auto_3469 ) ( OBJ-AT ?auto_3470 ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3470 ) ) ( not ( = ?auto_3468 ?auto_3471 ) ) ( not ( = ?auto_3468 ?auto_3472 ) ) ( not ( = ?auto_3470 ?auto_3471 ) ) ( not ( = ?auto_3470 ?auto_3472 ) ) ( not ( = ?auto_3471 ?auto_3472 ) ) ( IN-TRUCK ?auto_3471 ?auto_3475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3471 ?auto_3469 )
      ( DELIVER-4PKG ?auto_3468 ?auto_3470 ?auto_3471 ?auto_3472 ?auto_3469 )
      ( DELIVER-4PKG-VERIFY ?auto_3468 ?auto_3470 ?auto_3471 ?auto_3472 ?auto_3469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3481 - OBJ
      ?auto_3483 - OBJ
      ?auto_3484 - OBJ
      ?auto_3485 - OBJ
      ?auto_3482 - LOCATION
    )
    :vars
    (
      ?auto_3488 - LOCATION
      ?auto_3487 - CITY
      ?auto_3486 - TRUCK
      ?auto_3489 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3483 ?auto_3481 ) ( GREATER-THAN ?auto_3484 ?auto_3481 ) ( GREATER-THAN ?auto_3484 ?auto_3483 ) ( GREATER-THAN ?auto_3485 ?auto_3481 ) ( GREATER-THAN ?auto_3485 ?auto_3483 ) ( GREATER-THAN ?auto_3485 ?auto_3484 ) ( IN-CITY ?auto_3488 ?auto_3487 ) ( IN-CITY ?auto_3482 ?auto_3487 ) ( not ( = ?auto_3482 ?auto_3488 ) ) ( OBJ-AT ?auto_3485 ?auto_3488 ) ( OBJ-AT ?auto_3481 ?auto_3482 ) ( OBJ-AT ?auto_3483 ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3481 ?auto_3484 ) ) ( not ( = ?auto_3481 ?auto_3485 ) ) ( not ( = ?auto_3483 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3485 ) ) ( not ( = ?auto_3484 ?auto_3485 ) ) ( IN-TRUCK ?auto_3484 ?auto_3486 ) ( TRUCK-AT ?auto_3486 ?auto_3489 ) ( IN-CITY ?auto_3489 ?auto_3487 ) ( not ( = ?auto_3482 ?auto_3489 ) ) ( not ( = ?auto_3488 ?auto_3489 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3486 ?auto_3489 ?auto_3482 ?auto_3487 )
      ( DELIVER-4PKG ?auto_3481 ?auto_3483 ?auto_3484 ?auto_3485 ?auto_3482 )
      ( DELIVER-4PKG-VERIFY ?auto_3481 ?auto_3483 ?auto_3484 ?auto_3485 ?auto_3482 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3495 - OBJ
      ?auto_3497 - OBJ
      ?auto_3498 - OBJ
      ?auto_3499 - OBJ
      ?auto_3496 - LOCATION
    )
    :vars
    (
      ?auto_3501 - LOCATION
      ?auto_3503 - CITY
      ?auto_3500 - TRUCK
      ?auto_3502 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3497 ?auto_3495 ) ( GREATER-THAN ?auto_3498 ?auto_3495 ) ( GREATER-THAN ?auto_3498 ?auto_3497 ) ( GREATER-THAN ?auto_3499 ?auto_3495 ) ( GREATER-THAN ?auto_3499 ?auto_3497 ) ( GREATER-THAN ?auto_3499 ?auto_3498 ) ( IN-CITY ?auto_3501 ?auto_3503 ) ( IN-CITY ?auto_3496 ?auto_3503 ) ( not ( = ?auto_3496 ?auto_3501 ) ) ( OBJ-AT ?auto_3499 ?auto_3501 ) ( OBJ-AT ?auto_3495 ?auto_3496 ) ( OBJ-AT ?auto_3497 ?auto_3496 ) ( not ( = ?auto_3495 ?auto_3497 ) ) ( not ( = ?auto_3495 ?auto_3498 ) ) ( not ( = ?auto_3495 ?auto_3499 ) ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( TRUCK-AT ?auto_3500 ?auto_3502 ) ( IN-CITY ?auto_3502 ?auto_3503 ) ( not ( = ?auto_3496 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3502 ) ) ( OBJ-AT ?auto_3498 ?auto_3502 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3498 ?auto_3500 ?auto_3502 )
      ( DELIVER-4PKG ?auto_3495 ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3496 )
      ( DELIVER-4PKG-VERIFY ?auto_3495 ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3509 - OBJ
      ?auto_3511 - OBJ
      ?auto_3512 - OBJ
      ?auto_3513 - OBJ
      ?auto_3510 - LOCATION
    )
    :vars
    (
      ?auto_3514 - LOCATION
      ?auto_3515 - CITY
      ?auto_3516 - LOCATION
      ?auto_3517 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3511 ?auto_3509 ) ( GREATER-THAN ?auto_3512 ?auto_3509 ) ( GREATER-THAN ?auto_3512 ?auto_3511 ) ( GREATER-THAN ?auto_3513 ?auto_3509 ) ( GREATER-THAN ?auto_3513 ?auto_3511 ) ( GREATER-THAN ?auto_3513 ?auto_3512 ) ( IN-CITY ?auto_3514 ?auto_3515 ) ( IN-CITY ?auto_3510 ?auto_3515 ) ( not ( = ?auto_3510 ?auto_3514 ) ) ( OBJ-AT ?auto_3513 ?auto_3514 ) ( OBJ-AT ?auto_3509 ?auto_3510 ) ( OBJ-AT ?auto_3511 ?auto_3510 ) ( not ( = ?auto_3509 ?auto_3511 ) ) ( not ( = ?auto_3509 ?auto_3512 ) ) ( not ( = ?auto_3509 ?auto_3513 ) ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( not ( = ?auto_3511 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( IN-CITY ?auto_3516 ?auto_3515 ) ( not ( = ?auto_3510 ?auto_3516 ) ) ( not ( = ?auto_3514 ?auto_3516 ) ) ( OBJ-AT ?auto_3512 ?auto_3516 ) ( TRUCK-AT ?auto_3517 ?auto_3510 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3517 ?auto_3510 ?auto_3516 ?auto_3515 )
      ( DELIVER-4PKG ?auto_3509 ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3510 )
      ( DELIVER-4PKG-VERIFY ?auto_3509 ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3510 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3523 - OBJ
      ?auto_3525 - OBJ
      ?auto_3526 - OBJ
      ?auto_3527 - OBJ
      ?auto_3524 - LOCATION
    )
    :vars
    (
      ?auto_3531 - LOCATION
      ?auto_3528 - CITY
      ?auto_3530 - LOCATION
      ?auto_3529 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3525 ?auto_3523 ) ( GREATER-THAN ?auto_3526 ?auto_3523 ) ( GREATER-THAN ?auto_3526 ?auto_3525 ) ( GREATER-THAN ?auto_3527 ?auto_3523 ) ( GREATER-THAN ?auto_3527 ?auto_3525 ) ( GREATER-THAN ?auto_3527 ?auto_3526 ) ( IN-CITY ?auto_3531 ?auto_3528 ) ( IN-CITY ?auto_3524 ?auto_3528 ) ( not ( = ?auto_3524 ?auto_3531 ) ) ( OBJ-AT ?auto_3527 ?auto_3531 ) ( OBJ-AT ?auto_3523 ?auto_3524 ) ( not ( = ?auto_3523 ?auto_3525 ) ) ( not ( = ?auto_3523 ?auto_3526 ) ) ( not ( = ?auto_3523 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3526 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3526 ?auto_3527 ) ) ( IN-CITY ?auto_3530 ?auto_3528 ) ( not ( = ?auto_3524 ?auto_3530 ) ) ( not ( = ?auto_3531 ?auto_3530 ) ) ( OBJ-AT ?auto_3526 ?auto_3530 ) ( TRUCK-AT ?auto_3529 ?auto_3524 ) ( IN-TRUCK ?auto_3525 ?auto_3529 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3525 ?auto_3524 )
      ( DELIVER-4PKG ?auto_3523 ?auto_3525 ?auto_3526 ?auto_3527 ?auto_3524 )
      ( DELIVER-4PKG-VERIFY ?auto_3523 ?auto_3525 ?auto_3526 ?auto_3527 ?auto_3524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3537 - OBJ
      ?auto_3539 - OBJ
      ?auto_3540 - OBJ
      ?auto_3541 - OBJ
      ?auto_3538 - LOCATION
    )
    :vars
    (
      ?auto_3544 - LOCATION
      ?auto_3542 - CITY
      ?auto_3545 - LOCATION
      ?auto_3543 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3539 ?auto_3537 ) ( GREATER-THAN ?auto_3540 ?auto_3537 ) ( GREATER-THAN ?auto_3540 ?auto_3539 ) ( GREATER-THAN ?auto_3541 ?auto_3537 ) ( GREATER-THAN ?auto_3541 ?auto_3539 ) ( GREATER-THAN ?auto_3541 ?auto_3540 ) ( IN-CITY ?auto_3544 ?auto_3542 ) ( IN-CITY ?auto_3538 ?auto_3542 ) ( not ( = ?auto_3538 ?auto_3544 ) ) ( OBJ-AT ?auto_3541 ?auto_3544 ) ( OBJ-AT ?auto_3537 ?auto_3538 ) ( not ( = ?auto_3537 ?auto_3539 ) ) ( not ( = ?auto_3537 ?auto_3540 ) ) ( not ( = ?auto_3537 ?auto_3541 ) ) ( not ( = ?auto_3539 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3541 ) ) ( not ( = ?auto_3540 ?auto_3541 ) ) ( IN-CITY ?auto_3545 ?auto_3542 ) ( not ( = ?auto_3538 ?auto_3545 ) ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( OBJ-AT ?auto_3540 ?auto_3545 ) ( IN-TRUCK ?auto_3539 ?auto_3543 ) ( TRUCK-AT ?auto_3543 ?auto_3545 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3543 ?auto_3545 ?auto_3538 ?auto_3542 )
      ( DELIVER-4PKG ?auto_3537 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3538 )
      ( DELIVER-4PKG-VERIFY ?auto_3537 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3538 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3551 - OBJ
      ?auto_3553 - OBJ
      ?auto_3554 - OBJ
      ?auto_3555 - OBJ
      ?auto_3552 - LOCATION
    )
    :vars
    (
      ?auto_3557 - LOCATION
      ?auto_3558 - CITY
      ?auto_3556 - LOCATION
      ?auto_3559 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3553 ?auto_3551 ) ( GREATER-THAN ?auto_3554 ?auto_3551 ) ( GREATER-THAN ?auto_3554 ?auto_3553 ) ( GREATER-THAN ?auto_3555 ?auto_3551 ) ( GREATER-THAN ?auto_3555 ?auto_3553 ) ( GREATER-THAN ?auto_3555 ?auto_3554 ) ( IN-CITY ?auto_3557 ?auto_3558 ) ( IN-CITY ?auto_3552 ?auto_3558 ) ( not ( = ?auto_3552 ?auto_3557 ) ) ( OBJ-AT ?auto_3555 ?auto_3557 ) ( OBJ-AT ?auto_3551 ?auto_3552 ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3554 ) ) ( not ( = ?auto_3551 ?auto_3555 ) ) ( not ( = ?auto_3553 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( IN-CITY ?auto_3556 ?auto_3558 ) ( not ( = ?auto_3552 ?auto_3556 ) ) ( not ( = ?auto_3557 ?auto_3556 ) ) ( OBJ-AT ?auto_3554 ?auto_3556 ) ( TRUCK-AT ?auto_3559 ?auto_3556 ) ( OBJ-AT ?auto_3553 ?auto_3556 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3553 ?auto_3559 ?auto_3556 )
      ( DELIVER-4PKG ?auto_3551 ?auto_3553 ?auto_3554 ?auto_3555 ?auto_3552 )
      ( DELIVER-4PKG-VERIFY ?auto_3551 ?auto_3553 ?auto_3554 ?auto_3555 ?auto_3552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3565 - OBJ
      ?auto_3567 - OBJ
      ?auto_3568 - OBJ
      ?auto_3569 - OBJ
      ?auto_3566 - LOCATION
    )
    :vars
    (
      ?auto_3573 - LOCATION
      ?auto_3570 - CITY
      ?auto_3572 - LOCATION
      ?auto_3571 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3567 ?auto_3565 ) ( GREATER-THAN ?auto_3568 ?auto_3565 ) ( GREATER-THAN ?auto_3568 ?auto_3567 ) ( GREATER-THAN ?auto_3569 ?auto_3565 ) ( GREATER-THAN ?auto_3569 ?auto_3567 ) ( GREATER-THAN ?auto_3569 ?auto_3568 ) ( IN-CITY ?auto_3573 ?auto_3570 ) ( IN-CITY ?auto_3566 ?auto_3570 ) ( not ( = ?auto_3566 ?auto_3573 ) ) ( OBJ-AT ?auto_3569 ?auto_3573 ) ( OBJ-AT ?auto_3565 ?auto_3566 ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( not ( = ?auto_3565 ?auto_3568 ) ) ( not ( = ?auto_3565 ?auto_3569 ) ) ( not ( = ?auto_3567 ?auto_3568 ) ) ( not ( = ?auto_3567 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( IN-CITY ?auto_3572 ?auto_3570 ) ( not ( = ?auto_3566 ?auto_3572 ) ) ( not ( = ?auto_3573 ?auto_3572 ) ) ( OBJ-AT ?auto_3568 ?auto_3572 ) ( OBJ-AT ?auto_3567 ?auto_3572 ) ( TRUCK-AT ?auto_3571 ?auto_3566 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3571 ?auto_3566 ?auto_3572 ?auto_3570 )
      ( DELIVER-4PKG ?auto_3565 ?auto_3567 ?auto_3568 ?auto_3569 ?auto_3566 )
      ( DELIVER-4PKG-VERIFY ?auto_3565 ?auto_3567 ?auto_3568 ?auto_3569 ?auto_3566 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3579 - OBJ
      ?auto_3581 - OBJ
      ?auto_3582 - OBJ
      ?auto_3583 - OBJ
      ?auto_3580 - LOCATION
    )
    :vars
    (
      ?auto_3584 - LOCATION
      ?auto_3586 - CITY
      ?auto_3587 - LOCATION
      ?auto_3585 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3581 ?auto_3579 ) ( GREATER-THAN ?auto_3582 ?auto_3579 ) ( GREATER-THAN ?auto_3582 ?auto_3581 ) ( GREATER-THAN ?auto_3583 ?auto_3579 ) ( GREATER-THAN ?auto_3583 ?auto_3581 ) ( GREATER-THAN ?auto_3583 ?auto_3582 ) ( IN-CITY ?auto_3584 ?auto_3586 ) ( IN-CITY ?auto_3580 ?auto_3586 ) ( not ( = ?auto_3580 ?auto_3584 ) ) ( OBJ-AT ?auto_3583 ?auto_3584 ) ( not ( = ?auto_3579 ?auto_3581 ) ) ( not ( = ?auto_3579 ?auto_3582 ) ) ( not ( = ?auto_3579 ?auto_3583 ) ) ( not ( = ?auto_3581 ?auto_3582 ) ) ( not ( = ?auto_3581 ?auto_3583 ) ) ( not ( = ?auto_3582 ?auto_3583 ) ) ( IN-CITY ?auto_3587 ?auto_3586 ) ( not ( = ?auto_3580 ?auto_3587 ) ) ( not ( = ?auto_3584 ?auto_3587 ) ) ( OBJ-AT ?auto_3582 ?auto_3587 ) ( OBJ-AT ?auto_3581 ?auto_3587 ) ( TRUCK-AT ?auto_3585 ?auto_3580 ) ( IN-TRUCK ?auto_3579 ?auto_3585 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3579 ?auto_3580 )
      ( DELIVER-4PKG ?auto_3579 ?auto_3581 ?auto_3582 ?auto_3583 ?auto_3580 )
      ( DELIVER-4PKG-VERIFY ?auto_3579 ?auto_3581 ?auto_3582 ?auto_3583 ?auto_3580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3593 - OBJ
      ?auto_3595 - OBJ
      ?auto_3596 - OBJ
      ?auto_3597 - OBJ
      ?auto_3594 - LOCATION
    )
    :vars
    (
      ?auto_3598 - LOCATION
      ?auto_3599 - CITY
      ?auto_3600 - LOCATION
      ?auto_3601 - TRUCK
      ?auto_3602 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3595 ?auto_3593 ) ( GREATER-THAN ?auto_3596 ?auto_3593 ) ( GREATER-THAN ?auto_3596 ?auto_3595 ) ( GREATER-THAN ?auto_3597 ?auto_3593 ) ( GREATER-THAN ?auto_3597 ?auto_3595 ) ( GREATER-THAN ?auto_3597 ?auto_3596 ) ( IN-CITY ?auto_3598 ?auto_3599 ) ( IN-CITY ?auto_3594 ?auto_3599 ) ( not ( = ?auto_3594 ?auto_3598 ) ) ( OBJ-AT ?auto_3597 ?auto_3598 ) ( not ( = ?auto_3593 ?auto_3595 ) ) ( not ( = ?auto_3593 ?auto_3596 ) ) ( not ( = ?auto_3593 ?auto_3597 ) ) ( not ( = ?auto_3595 ?auto_3596 ) ) ( not ( = ?auto_3595 ?auto_3597 ) ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( IN-CITY ?auto_3600 ?auto_3599 ) ( not ( = ?auto_3594 ?auto_3600 ) ) ( not ( = ?auto_3598 ?auto_3600 ) ) ( OBJ-AT ?auto_3596 ?auto_3600 ) ( OBJ-AT ?auto_3595 ?auto_3600 ) ( IN-TRUCK ?auto_3593 ?auto_3601 ) ( TRUCK-AT ?auto_3601 ?auto_3602 ) ( IN-CITY ?auto_3602 ?auto_3599 ) ( not ( = ?auto_3594 ?auto_3602 ) ) ( not ( = ?auto_3598 ?auto_3602 ) ) ( not ( = ?auto_3600 ?auto_3602 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3601 ?auto_3602 ?auto_3594 ?auto_3599 )
      ( DELIVER-4PKG ?auto_3593 ?auto_3595 ?auto_3596 ?auto_3597 ?auto_3594 )
      ( DELIVER-4PKG-VERIFY ?auto_3593 ?auto_3595 ?auto_3596 ?auto_3597 ?auto_3594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3608 - OBJ
      ?auto_3610 - OBJ
      ?auto_3611 - OBJ
      ?auto_3612 - OBJ
      ?auto_3609 - LOCATION
    )
    :vars
    (
      ?auto_3613 - LOCATION
      ?auto_3617 - CITY
      ?auto_3615 - LOCATION
      ?auto_3616 - TRUCK
      ?auto_3614 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3610 ?auto_3608 ) ( GREATER-THAN ?auto_3611 ?auto_3608 ) ( GREATER-THAN ?auto_3611 ?auto_3610 ) ( GREATER-THAN ?auto_3612 ?auto_3608 ) ( GREATER-THAN ?auto_3612 ?auto_3610 ) ( GREATER-THAN ?auto_3612 ?auto_3611 ) ( IN-CITY ?auto_3613 ?auto_3617 ) ( IN-CITY ?auto_3609 ?auto_3617 ) ( not ( = ?auto_3609 ?auto_3613 ) ) ( OBJ-AT ?auto_3612 ?auto_3613 ) ( not ( = ?auto_3608 ?auto_3610 ) ) ( not ( = ?auto_3608 ?auto_3611 ) ) ( not ( = ?auto_3608 ?auto_3612 ) ) ( not ( = ?auto_3610 ?auto_3611 ) ) ( not ( = ?auto_3610 ?auto_3612 ) ) ( not ( = ?auto_3611 ?auto_3612 ) ) ( IN-CITY ?auto_3615 ?auto_3617 ) ( not ( = ?auto_3609 ?auto_3615 ) ) ( not ( = ?auto_3613 ?auto_3615 ) ) ( OBJ-AT ?auto_3611 ?auto_3615 ) ( OBJ-AT ?auto_3610 ?auto_3615 ) ( TRUCK-AT ?auto_3616 ?auto_3614 ) ( IN-CITY ?auto_3614 ?auto_3617 ) ( not ( = ?auto_3609 ?auto_3614 ) ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( not ( = ?auto_3615 ?auto_3614 ) ) ( OBJ-AT ?auto_3608 ?auto_3614 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3608 ?auto_3616 ?auto_3614 )
      ( DELIVER-4PKG ?auto_3608 ?auto_3610 ?auto_3611 ?auto_3612 ?auto_3609 )
      ( DELIVER-4PKG-VERIFY ?auto_3608 ?auto_3610 ?auto_3611 ?auto_3612 ?auto_3609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3623 - OBJ
      ?auto_3625 - OBJ
      ?auto_3626 - OBJ
      ?auto_3627 - OBJ
      ?auto_3624 - LOCATION
    )
    :vars
    (
      ?auto_3632 - LOCATION
      ?auto_3628 - CITY
      ?auto_3630 - LOCATION
      ?auto_3629 - LOCATION
      ?auto_3631 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3625 ?auto_3623 ) ( GREATER-THAN ?auto_3626 ?auto_3623 ) ( GREATER-THAN ?auto_3626 ?auto_3625 ) ( GREATER-THAN ?auto_3627 ?auto_3623 ) ( GREATER-THAN ?auto_3627 ?auto_3625 ) ( GREATER-THAN ?auto_3627 ?auto_3626 ) ( IN-CITY ?auto_3632 ?auto_3628 ) ( IN-CITY ?auto_3624 ?auto_3628 ) ( not ( = ?auto_3624 ?auto_3632 ) ) ( OBJ-AT ?auto_3627 ?auto_3632 ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( not ( = ?auto_3623 ?auto_3626 ) ) ( not ( = ?auto_3623 ?auto_3627 ) ) ( not ( = ?auto_3625 ?auto_3626 ) ) ( not ( = ?auto_3625 ?auto_3627 ) ) ( not ( = ?auto_3626 ?auto_3627 ) ) ( IN-CITY ?auto_3630 ?auto_3628 ) ( not ( = ?auto_3624 ?auto_3630 ) ) ( not ( = ?auto_3632 ?auto_3630 ) ) ( OBJ-AT ?auto_3626 ?auto_3630 ) ( OBJ-AT ?auto_3625 ?auto_3630 ) ( IN-CITY ?auto_3629 ?auto_3628 ) ( not ( = ?auto_3624 ?auto_3629 ) ) ( not ( = ?auto_3632 ?auto_3629 ) ) ( not ( = ?auto_3630 ?auto_3629 ) ) ( OBJ-AT ?auto_3623 ?auto_3629 ) ( TRUCK-AT ?auto_3631 ?auto_3624 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3631 ?auto_3624 ?auto_3629 ?auto_3628 )
      ( DELIVER-4PKG ?auto_3623 ?auto_3625 ?auto_3626 ?auto_3627 ?auto_3624 )
      ( DELIVER-4PKG-VERIFY ?auto_3623 ?auto_3625 ?auto_3626 ?auto_3627 ?auto_3624 ) )
  )

)

