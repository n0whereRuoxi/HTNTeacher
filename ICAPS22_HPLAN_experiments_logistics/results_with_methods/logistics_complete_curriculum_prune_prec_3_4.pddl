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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3029 - OBJ
      ?auto_3030 - LOCATION
    )
    :vars
    (
      ?auto_3031 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3031 ?auto_3030 ) ( IN-TRUCK ?auto_3029 ?auto_3031 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3029 ?auto_3031 ?auto_3030 )
      ( DELIVER-1PKG-VERIFY ?auto_3029 ?auto_3030 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3036 - OBJ
      ?auto_3037 - LOCATION
    )
    :vars
    (
      ?auto_3038 - TRUCK
      ?auto_3042 - LOCATION
      ?auto_3043 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3036 ?auto_3038 ) ( TRUCK-AT ?auto_3038 ?auto_3042 ) ( IN-CITY ?auto_3042 ?auto_3043 ) ( IN-CITY ?auto_3037 ?auto_3043 ) ( not ( = ?auto_3037 ?auto_3042 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3038 ?auto_3042 ?auto_3037 ?auto_3043 )
      ( DELIVER-1PKG ?auto_3036 ?auto_3037 )
      ( DELIVER-1PKG-VERIFY ?auto_3036 ?auto_3037 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3047 - OBJ
      ?auto_3048 - LOCATION
    )
    :vars
    (
      ?auto_3049 - TRUCK
      ?auto_3050 - LOCATION
      ?auto_3052 - CITY
      ?auto_3055 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3049 ?auto_3050 ) ( IN-CITY ?auto_3050 ?auto_3052 ) ( IN-CITY ?auto_3048 ?auto_3052 ) ( not ( = ?auto_3048 ?auto_3050 ) ) ( TRUCK-AT ?auto_3049 ?auto_3055 ) ( OBJ-AT ?auto_3047 ?auto_3055 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3047 ?auto_3049 ?auto_3055 )
      ( DELIVER-1PKG ?auto_3047 ?auto_3048 )
      ( DELIVER-1PKG-VERIFY ?auto_3047 ?auto_3048 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3059 - OBJ
      ?auto_3060 - LOCATION
    )
    :vars
    (
      ?auto_3063 - LOCATION
      ?auto_3062 - CITY
      ?auto_3061 - TRUCK
      ?auto_3068 - LOCATION
      ?auto_3069 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_3063 ?auto_3062 ) ( IN-CITY ?auto_3060 ?auto_3062 ) ( not ( = ?auto_3060 ?auto_3063 ) ) ( OBJ-AT ?auto_3059 ?auto_3063 ) ( TRUCK-AT ?auto_3061 ?auto_3068 ) ( IN-CITY ?auto_3068 ?auto_3069 ) ( IN-CITY ?auto_3063 ?auto_3069 ) ( not ( = ?auto_3063 ?auto_3068 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3061 ?auto_3068 ?auto_3063 ?auto_3069 )
      ( DELIVER-1PKG ?auto_3059 ?auto_3060 )
      ( DELIVER-1PKG-VERIFY ?auto_3059 ?auto_3060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3118 - OBJ
      ?auto_3120 - OBJ
      ?auto_3119 - LOCATION
    )
    :vars
    (
      ?auto_3121 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3120 ?auto_3118 ) ( TRUCK-AT ?auto_3121 ?auto_3119 ) ( IN-TRUCK ?auto_3120 ?auto_3121 ) ( OBJ-AT ?auto_3118 ?auto_3119 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3120 ?auto_3119 )
      ( DELIVER-2PKG-VERIFY ?auto_3118 ?auto_3120 ?auto_3119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3127 - OBJ
      ?auto_3129 - OBJ
      ?auto_3128 - LOCATION
    )
    :vars
    (
      ?auto_3130 - TRUCK
      ?auto_3134 - LOCATION
      ?auto_3131 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3129 ?auto_3127 ) ( IN-TRUCK ?auto_3129 ?auto_3130 ) ( TRUCK-AT ?auto_3130 ?auto_3134 ) ( IN-CITY ?auto_3134 ?auto_3131 ) ( IN-CITY ?auto_3128 ?auto_3131 ) ( not ( = ?auto_3128 ?auto_3134 ) ) ( OBJ-AT ?auto_3127 ?auto_3128 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3129 ?auto_3128 )
      ( DELIVER-2PKG-VERIFY ?auto_3127 ?auto_3129 ?auto_3128 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3138 - OBJ
      ?auto_3140 - OBJ
      ?auto_3139 - LOCATION
    )
    :vars
    (
      ?auto_3146 - TRUCK
      ?auto_3142 - LOCATION
      ?auto_3141 - CITY
      ?auto_3144 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3140 ?auto_3138 ) ( TRUCK-AT ?auto_3146 ?auto_3142 ) ( IN-CITY ?auto_3142 ?auto_3141 ) ( IN-CITY ?auto_3139 ?auto_3141 ) ( not ( = ?auto_3139 ?auto_3142 ) ) ( TRUCK-AT ?auto_3146 ?auto_3144 ) ( OBJ-AT ?auto_3140 ?auto_3144 ) ( OBJ-AT ?auto_3138 ?auto_3139 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3140 ?auto_3139 )
      ( DELIVER-2PKG-VERIFY ?auto_3138 ?auto_3140 ?auto_3139 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3150 - OBJ
      ?auto_3152 - OBJ
      ?auto_3151 - LOCATION
    )
    :vars
    (
      ?auto_3157 - LOCATION
      ?auto_3154 - CITY
      ?auto_3158 - TRUCK
      ?auto_3159 - LOCATION
      ?auto_3155 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3152 ?auto_3150 ) ( IN-CITY ?auto_3157 ?auto_3154 ) ( IN-CITY ?auto_3151 ?auto_3154 ) ( not ( = ?auto_3151 ?auto_3157 ) ) ( OBJ-AT ?auto_3152 ?auto_3157 ) ( TRUCK-AT ?auto_3158 ?auto_3159 ) ( IN-CITY ?auto_3159 ?auto_3155 ) ( IN-CITY ?auto_3157 ?auto_3155 ) ( not ( = ?auto_3157 ?auto_3159 ) ) ( OBJ-AT ?auto_3150 ?auto_3151 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3152 ?auto_3151 )
      ( DELIVER-2PKG-VERIFY ?auto_3150 ?auto_3152 ?auto_3151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3168 - OBJ
      ?auto_3165 - OBJ
      ?auto_3164 - LOCATION
    )
    :vars
    (
      ?auto_3166 - LOCATION
      ?auto_3172 - CITY
      ?auto_3167 - TRUCK
      ?auto_3170 - LOCATION
      ?auto_3173 - CITY
      ?auto_3174 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3165 ?auto_3168 ) ( IN-CITY ?auto_3166 ?auto_3172 ) ( IN-CITY ?auto_3164 ?auto_3172 ) ( not ( = ?auto_3164 ?auto_3166 ) ) ( OBJ-AT ?auto_3165 ?auto_3166 ) ( TRUCK-AT ?auto_3167 ?auto_3170 ) ( IN-CITY ?auto_3170 ?auto_3173 ) ( IN-CITY ?auto_3166 ?auto_3173 ) ( not ( = ?auto_3166 ?auto_3170 ) ) ( TRUCK-AT ?auto_3174 ?auto_3164 ) ( IN-TRUCK ?auto_3168 ?auto_3174 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3168 ?auto_3164 )
      ( DELIVER-2PKG ?auto_3168 ?auto_3165 ?auto_3164 )
      ( DELIVER-2PKG-VERIFY ?auto_3168 ?auto_3165 ?auto_3164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3180 - OBJ
      ?auto_3182 - OBJ
      ?auto_3181 - LOCATION
    )
    :vars
    (
      ?auto_3186 - LOCATION
      ?auto_3189 - CITY
      ?auto_3184 - CITY
      ?auto_3190 - TRUCK
      ?auto_3193 - LOCATION
      ?auto_3194 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3182 ?auto_3180 ) ( IN-CITY ?auto_3186 ?auto_3189 ) ( IN-CITY ?auto_3181 ?auto_3189 ) ( not ( = ?auto_3181 ?auto_3186 ) ) ( OBJ-AT ?auto_3182 ?auto_3186 ) ( IN-CITY ?auto_3181 ?auto_3184 ) ( IN-CITY ?auto_3186 ?auto_3184 ) ( IN-TRUCK ?auto_3180 ?auto_3190 ) ( TRUCK-AT ?auto_3190 ?auto_3193 ) ( IN-CITY ?auto_3193 ?auto_3194 ) ( IN-CITY ?auto_3181 ?auto_3194 ) ( not ( = ?auto_3181 ?auto_3193 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3190 ?auto_3193 ?auto_3181 ?auto_3194 )
      ( DELIVER-2PKG ?auto_3180 ?auto_3182 ?auto_3181 )
      ( DELIVER-2PKG-VERIFY ?auto_3180 ?auto_3182 ?auto_3181 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3199 - OBJ
      ?auto_3201 - OBJ
      ?auto_3200 - LOCATION
    )
    :vars
    (
      ?auto_3203 - LOCATION
      ?auto_3204 - CITY
      ?auto_3202 - CITY
      ?auto_3207 - TRUCK
      ?auto_3208 - LOCATION
      ?auto_3209 - CITY
      ?auto_3212 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3201 ?auto_3199 ) ( IN-CITY ?auto_3203 ?auto_3204 ) ( IN-CITY ?auto_3200 ?auto_3204 ) ( not ( = ?auto_3200 ?auto_3203 ) ) ( OBJ-AT ?auto_3201 ?auto_3203 ) ( IN-CITY ?auto_3200 ?auto_3202 ) ( IN-CITY ?auto_3203 ?auto_3202 ) ( TRUCK-AT ?auto_3207 ?auto_3208 ) ( IN-CITY ?auto_3208 ?auto_3209 ) ( IN-CITY ?auto_3200 ?auto_3209 ) ( not ( = ?auto_3200 ?auto_3208 ) ) ( TRUCK-AT ?auto_3207 ?auto_3212 ) ( OBJ-AT ?auto_3199 ?auto_3212 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3199 ?auto_3207 ?auto_3212 )
      ( DELIVER-2PKG ?auto_3199 ?auto_3201 ?auto_3200 )
      ( DELIVER-2PKG-VERIFY ?auto_3199 ?auto_3201 ?auto_3200 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3217 - OBJ
      ?auto_3219 - OBJ
      ?auto_3218 - LOCATION
    )
    :vars
    (
      ?auto_3229 - LOCATION
      ?auto_3223 - CITY
      ?auto_3224 - CITY
      ?auto_3222 - LOCATION
      ?auto_3226 - CITY
      ?auto_3220 - TRUCK
      ?auto_3231 - LOCATION
      ?auto_3232 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3219 ?auto_3217 ) ( IN-CITY ?auto_3229 ?auto_3223 ) ( IN-CITY ?auto_3218 ?auto_3223 ) ( not ( = ?auto_3218 ?auto_3229 ) ) ( OBJ-AT ?auto_3219 ?auto_3229 ) ( IN-CITY ?auto_3218 ?auto_3224 ) ( IN-CITY ?auto_3229 ?auto_3224 ) ( IN-CITY ?auto_3222 ?auto_3226 ) ( IN-CITY ?auto_3218 ?auto_3226 ) ( not ( = ?auto_3218 ?auto_3222 ) ) ( OBJ-AT ?auto_3217 ?auto_3222 ) ( TRUCK-AT ?auto_3220 ?auto_3231 ) ( IN-CITY ?auto_3231 ?auto_3232 ) ( IN-CITY ?auto_3222 ?auto_3232 ) ( not ( = ?auto_3222 ?auto_3231 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3220 ?auto_3231 ?auto_3222 ?auto_3232 )
      ( DELIVER-2PKG ?auto_3217 ?auto_3219 ?auto_3218 )
      ( DELIVER-2PKG-VERIFY ?auto_3217 ?auto_3219 ?auto_3218 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3282 - OBJ
      ?auto_3284 - OBJ
      ?auto_3285 - OBJ
      ?auto_3283 - LOCATION
    )
    :vars
    (
      ?auto_3287 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3284 ?auto_3282 ) ( GREATER-THAN ?auto_3285 ?auto_3282 ) ( GREATER-THAN ?auto_3285 ?auto_3284 ) ( TRUCK-AT ?auto_3287 ?auto_3283 ) ( IN-TRUCK ?auto_3285 ?auto_3287 ) ( OBJ-AT ?auto_3282 ?auto_3283 ) ( OBJ-AT ?auto_3284 ?auto_3283 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3285 ?auto_3283 )
      ( DELIVER-3PKG-VERIFY ?auto_3282 ?auto_3284 ?auto_3285 ?auto_3283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3293 - OBJ
      ?auto_3295 - OBJ
      ?auto_3296 - OBJ
      ?auto_3294 - LOCATION
    )
    :vars
    (
      ?auto_3301 - TRUCK
      ?auto_3299 - LOCATION
      ?auto_3298 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3295 ?auto_3293 ) ( GREATER-THAN ?auto_3296 ?auto_3293 ) ( GREATER-THAN ?auto_3296 ?auto_3295 ) ( IN-TRUCK ?auto_3296 ?auto_3301 ) ( TRUCK-AT ?auto_3301 ?auto_3299 ) ( IN-CITY ?auto_3299 ?auto_3298 ) ( IN-CITY ?auto_3294 ?auto_3298 ) ( not ( = ?auto_3294 ?auto_3299 ) ) ( OBJ-AT ?auto_3293 ?auto_3294 ) ( OBJ-AT ?auto_3295 ?auto_3294 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3296 ?auto_3294 )
      ( DELIVER-3PKG-VERIFY ?auto_3293 ?auto_3295 ?auto_3296 ?auto_3294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3306 - OBJ
      ?auto_3308 - OBJ
      ?auto_3309 - OBJ
      ?auto_3307 - LOCATION
    )
    :vars
    (
      ?auto_3315 - TRUCK
      ?auto_3313 - LOCATION
      ?auto_3314 - CITY
      ?auto_3310 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3308 ?auto_3306 ) ( GREATER-THAN ?auto_3309 ?auto_3306 ) ( GREATER-THAN ?auto_3309 ?auto_3308 ) ( TRUCK-AT ?auto_3315 ?auto_3313 ) ( IN-CITY ?auto_3313 ?auto_3314 ) ( IN-CITY ?auto_3307 ?auto_3314 ) ( not ( = ?auto_3307 ?auto_3313 ) ) ( TRUCK-AT ?auto_3315 ?auto_3310 ) ( OBJ-AT ?auto_3309 ?auto_3310 ) ( OBJ-AT ?auto_3306 ?auto_3307 ) ( OBJ-AT ?auto_3308 ?auto_3307 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3309 ?auto_3307 )
      ( DELIVER-3PKG-VERIFY ?auto_3306 ?auto_3308 ?auto_3309 ?auto_3307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3320 - OBJ
      ?auto_3322 - OBJ
      ?auto_3323 - OBJ
      ?auto_3321 - LOCATION
    )
    :vars
    (
      ?auto_3325 - LOCATION
      ?auto_3328 - CITY
      ?auto_3326 - TRUCK
      ?auto_3324 - LOCATION
      ?auto_3330 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3322 ?auto_3320 ) ( GREATER-THAN ?auto_3323 ?auto_3320 ) ( GREATER-THAN ?auto_3323 ?auto_3322 ) ( IN-CITY ?auto_3325 ?auto_3328 ) ( IN-CITY ?auto_3321 ?auto_3328 ) ( not ( = ?auto_3321 ?auto_3325 ) ) ( OBJ-AT ?auto_3323 ?auto_3325 ) ( TRUCK-AT ?auto_3326 ?auto_3324 ) ( IN-CITY ?auto_3324 ?auto_3330 ) ( IN-CITY ?auto_3325 ?auto_3330 ) ( not ( = ?auto_3325 ?auto_3324 ) ) ( OBJ-AT ?auto_3320 ?auto_3321 ) ( OBJ-AT ?auto_3322 ?auto_3321 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3323 ?auto_3321 )
      ( DELIVER-3PKG-VERIFY ?auto_3320 ?auto_3322 ?auto_3323 ?auto_3321 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3335 - OBJ
      ?auto_3340 - OBJ
      ?auto_3338 - OBJ
      ?auto_3336 - LOCATION
    )
    :vars
    (
      ?auto_3341 - OBJ
      ?auto_3344 - LOCATION
      ?auto_3347 - CITY
      ?auto_3342 - TRUCK
      ?auto_3343 - LOCATION
      ?auto_3346 - CITY
      ?auto_3348 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3340 ?auto_3335 ) ( GREATER-THAN ?auto_3338 ?auto_3335 ) ( GREATER-THAN ?auto_3338 ?auto_3340 ) ( GREATER-THAN ?auto_3340 ?auto_3341 ) ( GREATER-THAN ?auto_3338 ?auto_3341 ) ( IN-CITY ?auto_3344 ?auto_3347 ) ( IN-CITY ?auto_3336 ?auto_3347 ) ( not ( = ?auto_3336 ?auto_3344 ) ) ( OBJ-AT ?auto_3338 ?auto_3344 ) ( TRUCK-AT ?auto_3342 ?auto_3343 ) ( IN-CITY ?auto_3343 ?auto_3346 ) ( IN-CITY ?auto_3344 ?auto_3346 ) ( not ( = ?auto_3344 ?auto_3343 ) ) ( OBJ-AT ?auto_3341 ?auto_3336 ) ( TRUCK-AT ?auto_3348 ?auto_3336 ) ( IN-TRUCK ?auto_3340 ?auto_3348 ) ( OBJ-AT ?auto_3335 ?auto_3336 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3340 ?auto_3336 )
      ( DELIVER-3PKG ?auto_3341 ?auto_3340 ?auto_3338 ?auto_3336 )
      ( DELIVER-3PKG-VERIFY ?auto_3335 ?auto_3340 ?auto_3338 ?auto_3336 ) )
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
      ?auto_3369 - OBJ
      ?auto_3359 - OBJ
      ?auto_3363 - LOCATION
      ?auto_3364 - CITY
      ?auto_3361 - CITY
      ?auto_3367 - TRUCK
      ?auto_3371 - LOCATION
      ?auto_3372 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3357 ?auto_3355 ) ( GREATER-THAN ?auto_3358 ?auto_3355 ) ( GREATER-THAN ?auto_3358 ?auto_3357 ) ( GREATER-THAN ?auto_3357 ?auto_3369 ) ( GREATER-THAN ?auto_3358 ?auto_3369 ) ( GREATER-THAN ?auto_3357 ?auto_3359 ) ( GREATER-THAN ?auto_3358 ?auto_3359 ) ( IN-CITY ?auto_3363 ?auto_3364 ) ( IN-CITY ?auto_3356 ?auto_3364 ) ( not ( = ?auto_3356 ?auto_3363 ) ) ( OBJ-AT ?auto_3358 ?auto_3363 ) ( IN-CITY ?auto_3356 ?auto_3361 ) ( IN-CITY ?auto_3363 ?auto_3361 ) ( OBJ-AT ?auto_3359 ?auto_3356 ) ( IN-TRUCK ?auto_3357 ?auto_3367 ) ( OBJ-AT ?auto_3369 ?auto_3356 ) ( TRUCK-AT ?auto_3367 ?auto_3371 ) ( IN-CITY ?auto_3371 ?auto_3372 ) ( IN-CITY ?auto_3356 ?auto_3372 ) ( not ( = ?auto_3356 ?auto_3371 ) ) ( OBJ-AT ?auto_3355 ?auto_3356 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3367 ?auto_3371 ?auto_3356 ?auto_3372 )
      ( DELIVER-3PKG ?auto_3369 ?auto_3357 ?auto_3358 ?auto_3356 )
      ( DELIVER-3PKG-VERIFY ?auto_3355 ?auto_3357 ?auto_3358 ?auto_3356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3378 - OBJ
      ?auto_3380 - OBJ
      ?auto_3381 - OBJ
      ?auto_3379 - LOCATION
    )
    :vars
    (
      ?auto_3393 - OBJ
      ?auto_3389 - OBJ
      ?auto_3391 - OBJ
      ?auto_3382 - LOCATION
      ?auto_3383 - CITY
      ?auto_3386 - CITY
      ?auto_3388 - TRUCK
      ?auto_3392 - LOCATION
      ?auto_3387 - CITY
      ?auto_3395 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3380 ?auto_3378 ) ( GREATER-THAN ?auto_3381 ?auto_3378 ) ( GREATER-THAN ?auto_3381 ?auto_3380 ) ( GREATER-THAN ?auto_3380 ?auto_3393 ) ( GREATER-THAN ?auto_3381 ?auto_3393 ) ( GREATER-THAN ?auto_3380 ?auto_3389 ) ( GREATER-THAN ?auto_3381 ?auto_3389 ) ( GREATER-THAN ?auto_3380 ?auto_3391 ) ( GREATER-THAN ?auto_3381 ?auto_3391 ) ( IN-CITY ?auto_3382 ?auto_3383 ) ( IN-CITY ?auto_3379 ?auto_3383 ) ( not ( = ?auto_3379 ?auto_3382 ) ) ( OBJ-AT ?auto_3381 ?auto_3382 ) ( IN-CITY ?auto_3379 ?auto_3386 ) ( IN-CITY ?auto_3382 ?auto_3386 ) ( OBJ-AT ?auto_3391 ?auto_3379 ) ( OBJ-AT ?auto_3389 ?auto_3379 ) ( TRUCK-AT ?auto_3388 ?auto_3392 ) ( IN-CITY ?auto_3392 ?auto_3387 ) ( IN-CITY ?auto_3379 ?auto_3387 ) ( not ( = ?auto_3379 ?auto_3392 ) ) ( OBJ-AT ?auto_3393 ?auto_3379 ) ( TRUCK-AT ?auto_3388 ?auto_3395 ) ( OBJ-AT ?auto_3380 ?auto_3395 ) ( OBJ-AT ?auto_3378 ?auto_3379 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3380 ?auto_3388 ?auto_3395 )
      ( DELIVER-3PKG ?auto_3393 ?auto_3380 ?auto_3381 ?auto_3379 )
      ( DELIVER-3PKG-VERIFY ?auto_3378 ?auto_3380 ?auto_3381 ?auto_3379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3401 - OBJ
      ?auto_3403 - OBJ
      ?auto_3404 - OBJ
      ?auto_3402 - LOCATION
    )
    :vars
    (
      ?auto_3418 - OBJ
      ?auto_3414 - OBJ
      ?auto_3409 - OBJ
      ?auto_3407 - OBJ
      ?auto_3411 - LOCATION
      ?auto_3405 - CITY
      ?auto_3406 - CITY
      ?auto_3417 - LOCATION
      ?auto_3413 - CITY
      ?auto_3410 - TRUCK
      ?auto_3420 - LOCATION
      ?auto_3421 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3403 ?auto_3401 ) ( GREATER-THAN ?auto_3404 ?auto_3401 ) ( GREATER-THAN ?auto_3404 ?auto_3403 ) ( GREATER-THAN ?auto_3403 ?auto_3418 ) ( GREATER-THAN ?auto_3404 ?auto_3418 ) ( GREATER-THAN ?auto_3403 ?auto_3414 ) ( GREATER-THAN ?auto_3404 ?auto_3414 ) ( GREATER-THAN ?auto_3403 ?auto_3409 ) ( GREATER-THAN ?auto_3404 ?auto_3409 ) ( GREATER-THAN ?auto_3403 ?auto_3407 ) ( GREATER-THAN ?auto_3404 ?auto_3407 ) ( IN-CITY ?auto_3411 ?auto_3405 ) ( IN-CITY ?auto_3402 ?auto_3405 ) ( not ( = ?auto_3402 ?auto_3411 ) ) ( OBJ-AT ?auto_3404 ?auto_3411 ) ( IN-CITY ?auto_3402 ?auto_3406 ) ( IN-CITY ?auto_3411 ?auto_3406 ) ( OBJ-AT ?auto_3407 ?auto_3402 ) ( OBJ-AT ?auto_3409 ?auto_3402 ) ( IN-CITY ?auto_3417 ?auto_3413 ) ( IN-CITY ?auto_3402 ?auto_3413 ) ( not ( = ?auto_3402 ?auto_3417 ) ) ( OBJ-AT ?auto_3414 ?auto_3402 ) ( OBJ-AT ?auto_3403 ?auto_3417 ) ( OBJ-AT ?auto_3418 ?auto_3402 ) ( TRUCK-AT ?auto_3410 ?auto_3420 ) ( IN-CITY ?auto_3420 ?auto_3421 ) ( IN-CITY ?auto_3417 ?auto_3421 ) ( not ( = ?auto_3417 ?auto_3420 ) ) ( OBJ-AT ?auto_3401 ?auto_3402 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3410 ?auto_3420 ?auto_3417 ?auto_3421 )
      ( DELIVER-3PKG ?auto_3418 ?auto_3403 ?auto_3404 ?auto_3402 )
      ( DELIVER-3PKG-VERIFY ?auto_3401 ?auto_3403 ?auto_3404 ?auto_3402 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3446 - OBJ
      ?auto_3429 - OBJ
      ?auto_3430 - OBJ
      ?auto_3428 - LOCATION
    )
    :vars
    (
      ?auto_3441 - LOCATION
      ?auto_3443 - CITY
      ?auto_3434 - CITY
      ?auto_3437 - LOCATION
      ?auto_3442 - CITY
      ?auto_3439 - TRUCK
      ?auto_3432 - LOCATION
      ?auto_3435 - CITY
      ?auto_3447 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3429 ?auto_3446 ) ( GREATER-THAN ?auto_3430 ?auto_3446 ) ( GREATER-THAN ?auto_3430 ?auto_3429 ) ( IN-CITY ?auto_3441 ?auto_3443 ) ( IN-CITY ?auto_3428 ?auto_3443 ) ( not ( = ?auto_3428 ?auto_3441 ) ) ( OBJ-AT ?auto_3430 ?auto_3441 ) ( IN-CITY ?auto_3428 ?auto_3434 ) ( IN-CITY ?auto_3441 ?auto_3434 ) ( IN-CITY ?auto_3437 ?auto_3442 ) ( IN-CITY ?auto_3428 ?auto_3442 ) ( not ( = ?auto_3428 ?auto_3437 ) ) ( OBJ-AT ?auto_3429 ?auto_3437 ) ( TRUCK-AT ?auto_3439 ?auto_3432 ) ( IN-CITY ?auto_3432 ?auto_3435 ) ( IN-CITY ?auto_3437 ?auto_3435 ) ( not ( = ?auto_3437 ?auto_3432 ) ) ( TRUCK-AT ?auto_3447 ?auto_3428 ) ( IN-TRUCK ?auto_3446 ?auto_3447 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3446 ?auto_3428 )
      ( DELIVER-3PKG ?auto_3446 ?auto_3429 ?auto_3430 ?auto_3428 )
      ( DELIVER-3PKG-VERIFY ?auto_3446 ?auto_3429 ?auto_3430 ?auto_3428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3454 - OBJ
      ?auto_3456 - OBJ
      ?auto_3457 - OBJ
      ?auto_3455 - LOCATION
    )
    :vars
    (
      ?auto_3461 - LOCATION
      ?auto_3459 - CITY
      ?auto_3467 - CITY
      ?auto_3465 - LOCATION
      ?auto_3463 - CITY
      ?auto_3469 - CITY
      ?auto_3466 - TRUCK
      ?auto_3472 - LOCATION
      ?auto_3473 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3456 ?auto_3454 ) ( GREATER-THAN ?auto_3457 ?auto_3454 ) ( GREATER-THAN ?auto_3457 ?auto_3456 ) ( IN-CITY ?auto_3461 ?auto_3459 ) ( IN-CITY ?auto_3455 ?auto_3459 ) ( not ( = ?auto_3455 ?auto_3461 ) ) ( OBJ-AT ?auto_3457 ?auto_3461 ) ( IN-CITY ?auto_3455 ?auto_3467 ) ( IN-CITY ?auto_3461 ?auto_3467 ) ( IN-CITY ?auto_3465 ?auto_3463 ) ( IN-CITY ?auto_3455 ?auto_3463 ) ( not ( = ?auto_3455 ?auto_3465 ) ) ( OBJ-AT ?auto_3456 ?auto_3465 ) ( IN-CITY ?auto_3455 ?auto_3469 ) ( IN-CITY ?auto_3465 ?auto_3469 ) ( IN-TRUCK ?auto_3454 ?auto_3466 ) ( TRUCK-AT ?auto_3466 ?auto_3472 ) ( IN-CITY ?auto_3472 ?auto_3473 ) ( IN-CITY ?auto_3455 ?auto_3473 ) ( not ( = ?auto_3455 ?auto_3472 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3466 ?auto_3472 ?auto_3455 ?auto_3473 )
      ( DELIVER-3PKG ?auto_3454 ?auto_3456 ?auto_3457 ?auto_3455 )
      ( DELIVER-3PKG-VERIFY ?auto_3454 ?auto_3456 ?auto_3457 ?auto_3455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3479 - OBJ
      ?auto_3481 - OBJ
      ?auto_3482 - OBJ
      ?auto_3480 - LOCATION
    )
    :vars
    (
      ?auto_3492 - LOCATION
      ?auto_3491 - CITY
      ?auto_3493 - CITY
      ?auto_3486 - LOCATION
      ?auto_3488 - CITY
      ?auto_3490 - CITY
      ?auto_3494 - TRUCK
      ?auto_3495 - LOCATION
      ?auto_3487 - CITY
      ?auto_3497 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3481 ?auto_3479 ) ( GREATER-THAN ?auto_3482 ?auto_3479 ) ( GREATER-THAN ?auto_3482 ?auto_3481 ) ( IN-CITY ?auto_3492 ?auto_3491 ) ( IN-CITY ?auto_3480 ?auto_3491 ) ( not ( = ?auto_3480 ?auto_3492 ) ) ( OBJ-AT ?auto_3482 ?auto_3492 ) ( IN-CITY ?auto_3480 ?auto_3493 ) ( IN-CITY ?auto_3492 ?auto_3493 ) ( IN-CITY ?auto_3486 ?auto_3488 ) ( IN-CITY ?auto_3480 ?auto_3488 ) ( not ( = ?auto_3480 ?auto_3486 ) ) ( OBJ-AT ?auto_3481 ?auto_3486 ) ( IN-CITY ?auto_3480 ?auto_3490 ) ( IN-CITY ?auto_3486 ?auto_3490 ) ( TRUCK-AT ?auto_3494 ?auto_3495 ) ( IN-CITY ?auto_3495 ?auto_3487 ) ( IN-CITY ?auto_3480 ?auto_3487 ) ( not ( = ?auto_3480 ?auto_3495 ) ) ( TRUCK-AT ?auto_3494 ?auto_3497 ) ( OBJ-AT ?auto_3479 ?auto_3497 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3479 ?auto_3494 ?auto_3497 )
      ( DELIVER-3PKG ?auto_3479 ?auto_3481 ?auto_3482 ?auto_3480 )
      ( DELIVER-3PKG-VERIFY ?auto_3479 ?auto_3481 ?auto_3482 ?auto_3480 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3503 - OBJ
      ?auto_3505 - OBJ
      ?auto_3506 - OBJ
      ?auto_3504 - LOCATION
    )
    :vars
    (
      ?auto_3519 - LOCATION
      ?auto_3520 - CITY
      ?auto_3515 - CITY
      ?auto_3509 - LOCATION
      ?auto_3517 - CITY
      ?auto_3510 - CITY
      ?auto_3518 - LOCATION
      ?auto_3516 - CITY
      ?auto_3512 - TRUCK
      ?auto_3522 - LOCATION
      ?auto_3523 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3505 ?auto_3503 ) ( GREATER-THAN ?auto_3506 ?auto_3503 ) ( GREATER-THAN ?auto_3506 ?auto_3505 ) ( IN-CITY ?auto_3519 ?auto_3520 ) ( IN-CITY ?auto_3504 ?auto_3520 ) ( not ( = ?auto_3504 ?auto_3519 ) ) ( OBJ-AT ?auto_3506 ?auto_3519 ) ( IN-CITY ?auto_3504 ?auto_3515 ) ( IN-CITY ?auto_3519 ?auto_3515 ) ( IN-CITY ?auto_3509 ?auto_3517 ) ( IN-CITY ?auto_3504 ?auto_3517 ) ( not ( = ?auto_3504 ?auto_3509 ) ) ( OBJ-AT ?auto_3505 ?auto_3509 ) ( IN-CITY ?auto_3504 ?auto_3510 ) ( IN-CITY ?auto_3509 ?auto_3510 ) ( IN-CITY ?auto_3518 ?auto_3516 ) ( IN-CITY ?auto_3504 ?auto_3516 ) ( not ( = ?auto_3504 ?auto_3518 ) ) ( OBJ-AT ?auto_3503 ?auto_3518 ) ( TRUCK-AT ?auto_3512 ?auto_3522 ) ( IN-CITY ?auto_3522 ?auto_3523 ) ( IN-CITY ?auto_3518 ?auto_3523 ) ( not ( = ?auto_3518 ?auto_3522 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3512 ?auto_3522 ?auto_3518 ?auto_3523 )
      ( DELIVER-3PKG ?auto_3503 ?auto_3505 ?auto_3506 ?auto_3504 )
      ( DELIVER-3PKG-VERIFY ?auto_3503 ?auto_3505 ?auto_3506 ?auto_3504 ) )
  )

)

