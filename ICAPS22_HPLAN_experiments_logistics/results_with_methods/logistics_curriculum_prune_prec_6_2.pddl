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
      ?auto_3098 - OBJ
      ?auto_3099 - LOCATION
    )
    :vars
    (
      ?auto_3108 - LOCATION
      ?auto_3105 - CITY
      ?auto_3100 - TRUCK
      ?auto_3111 - LOCATION
      ?auto_3112 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_3108 ?auto_3105 ) ( IN-CITY ?auto_3099 ?auto_3105 ) ( not ( = ?auto_3099 ?auto_3108 ) ) ( OBJ-AT ?auto_3098 ?auto_3108 ) ( TRUCK-AT ?auto_3100 ?auto_3111 ) ( IN-CITY ?auto_3111 ?auto_3112 ) ( IN-CITY ?auto_3108 ?auto_3112 ) ( not ( = ?auto_3108 ?auto_3111 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3100 ?auto_3111 ?auto_3108 ?auto_3112 )
      ( !LOAD-TRUCK ?auto_3098 ?auto_3100 ?auto_3108 )
      ( !DRIVE-TRUCK ?auto_3100 ?auto_3108 ?auto_3099 ?auto_3105 )
      ( !UNLOAD-TRUCK ?auto_3098 ?auto_3100 ?auto_3099 )
      ( DELIVER-1PKG-VERIFY ?auto_3098 ?auto_3099 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3135 - OBJ
      ?auto_3137 - OBJ
      ?auto_3142 - LOCATION
    )
    :vars
    (
      ?auto_3140 - LOCATION
      ?auto_3138 - CITY
      ?auto_3144 - CITY
      ?auto_3147 - LOCATION
      ?auto_3146 - CITY
      ?auto_3139 - TRUCK
      ?auto_3150 - LOCATION
      ?auto_3145 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3137 ?auto_3135 ) ( IN-CITY ?auto_3140 ?auto_3138 ) ( IN-CITY ?auto_3142 ?auto_3138 ) ( not ( = ?auto_3142 ?auto_3140 ) ) ( OBJ-AT ?auto_3137 ?auto_3140 ) ( IN-CITY ?auto_3142 ?auto_3144 ) ( IN-CITY ?auto_3140 ?auto_3144 ) ( IN-CITY ?auto_3147 ?auto_3146 ) ( IN-CITY ?auto_3142 ?auto_3146 ) ( not ( = ?auto_3142 ?auto_3147 ) ) ( OBJ-AT ?auto_3135 ?auto_3147 ) ( TRUCK-AT ?auto_3139 ?auto_3150 ) ( IN-CITY ?auto_3150 ?auto_3145 ) ( IN-CITY ?auto_3147 ?auto_3145 ) ( not ( = ?auto_3147 ?auto_3150 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3135 ?auto_3142 )
      ( DELIVER-1PKG ?auto_3137 ?auto_3142 )
      ( DELIVER-2PKG-VERIFY ?auto_3135 ?auto_3137 ?auto_3142 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3174 - OBJ
      ?auto_3176 - OBJ
      ?auto_3177 - OBJ
      ?auto_3179 - LOCATION
    )
    :vars
    (
      ?auto_3180 - LOCATION
      ?auto_3178 - CITY
      ?auto_3182 - CITY
      ?auto_3190 - LOCATION
      ?auto_3185 - CITY
      ?auto_3187 - CITY
      ?auto_3191 - LOCATION
      ?auto_3194 - CITY
      ?auto_3181 - TRUCK
      ?auto_3193 - LOCATION
      ?auto_3192 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3176 ?auto_3174 ) ( GREATER-THAN ?auto_3177 ?auto_3174 ) ( GREATER-THAN ?auto_3177 ?auto_3176 ) ( IN-CITY ?auto_3180 ?auto_3178 ) ( IN-CITY ?auto_3179 ?auto_3178 ) ( not ( = ?auto_3179 ?auto_3180 ) ) ( OBJ-AT ?auto_3177 ?auto_3180 ) ( IN-CITY ?auto_3179 ?auto_3182 ) ( IN-CITY ?auto_3180 ?auto_3182 ) ( IN-CITY ?auto_3190 ?auto_3185 ) ( IN-CITY ?auto_3179 ?auto_3185 ) ( not ( = ?auto_3179 ?auto_3190 ) ) ( OBJ-AT ?auto_3176 ?auto_3190 ) ( IN-CITY ?auto_3179 ?auto_3187 ) ( IN-CITY ?auto_3190 ?auto_3187 ) ( IN-CITY ?auto_3191 ?auto_3194 ) ( IN-CITY ?auto_3179 ?auto_3194 ) ( not ( = ?auto_3179 ?auto_3191 ) ) ( OBJ-AT ?auto_3174 ?auto_3191 ) ( TRUCK-AT ?auto_3181 ?auto_3193 ) ( IN-CITY ?auto_3193 ?auto_3192 ) ( IN-CITY ?auto_3191 ?auto_3192 ) ( not ( = ?auto_3191 ?auto_3193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3174 ?auto_3176 ?auto_3179 )
      ( DELIVER-1PKG ?auto_3177 ?auto_3179 )
      ( DELIVER-3PKG-VERIFY ?auto_3174 ?auto_3176 ?auto_3177 ?auto_3179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3219 - OBJ
      ?auto_3221 - OBJ
      ?auto_3222 - OBJ
      ?auto_3223 - OBJ
      ?auto_3228 - LOCATION
    )
    :vars
    (
      ?auto_3226 - LOCATION
      ?auto_3229 - CITY
      ?auto_3227 - CITY
      ?auto_3239 - LOCATION
      ?auto_3243 - CITY
      ?auto_3244 - CITY
      ?auto_3238 - LOCATION
      ?auto_3233 - CITY
      ?auto_3241 - CITY
      ?auto_3237 - LOCATION
      ?auto_3232 - CITY
      ?auto_3225 - TRUCK
      ?auto_3235 - LOCATION
      ?auto_3231 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3221 ?auto_3219 ) ( GREATER-THAN ?auto_3222 ?auto_3219 ) ( GREATER-THAN ?auto_3222 ?auto_3221 ) ( GREATER-THAN ?auto_3223 ?auto_3219 ) ( GREATER-THAN ?auto_3223 ?auto_3221 ) ( GREATER-THAN ?auto_3223 ?auto_3222 ) ( IN-CITY ?auto_3226 ?auto_3229 ) ( IN-CITY ?auto_3228 ?auto_3229 ) ( not ( = ?auto_3228 ?auto_3226 ) ) ( OBJ-AT ?auto_3223 ?auto_3226 ) ( IN-CITY ?auto_3228 ?auto_3227 ) ( IN-CITY ?auto_3226 ?auto_3227 ) ( IN-CITY ?auto_3239 ?auto_3243 ) ( IN-CITY ?auto_3228 ?auto_3243 ) ( not ( = ?auto_3228 ?auto_3239 ) ) ( OBJ-AT ?auto_3222 ?auto_3239 ) ( IN-CITY ?auto_3228 ?auto_3244 ) ( IN-CITY ?auto_3239 ?auto_3244 ) ( IN-CITY ?auto_3238 ?auto_3233 ) ( IN-CITY ?auto_3228 ?auto_3233 ) ( not ( = ?auto_3228 ?auto_3238 ) ) ( OBJ-AT ?auto_3221 ?auto_3238 ) ( IN-CITY ?auto_3228 ?auto_3241 ) ( IN-CITY ?auto_3238 ?auto_3241 ) ( IN-CITY ?auto_3237 ?auto_3232 ) ( IN-CITY ?auto_3228 ?auto_3232 ) ( not ( = ?auto_3228 ?auto_3237 ) ) ( OBJ-AT ?auto_3219 ?auto_3237 ) ( TRUCK-AT ?auto_3225 ?auto_3235 ) ( IN-CITY ?auto_3235 ?auto_3231 ) ( IN-CITY ?auto_3237 ?auto_3231 ) ( not ( = ?auto_3237 ?auto_3235 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3219 ?auto_3221 ?auto_3222 ?auto_3228 )
      ( DELIVER-1PKG ?auto_3223 ?auto_3228 )
      ( DELIVER-4PKG-VERIFY ?auto_3219 ?auto_3221 ?auto_3222 ?auto_3223 ?auto_3228 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3270 - OBJ
      ?auto_3272 - OBJ
      ?auto_3273 - OBJ
      ?auto_3274 - OBJ
      ?auto_3275 - OBJ
      ?auto_3280 - LOCATION
    )
    :vars
    (
      ?auto_3278 - LOCATION
      ?auto_3281 - CITY
      ?auto_3277 - CITY
      ?auto_3289 - LOCATION
      ?auto_3291 - CITY
      ?auto_3288 - CITY
      ?auto_3296 - LOCATION
      ?auto_3301 - CITY
      ?auto_3293 - CITY
      ?auto_3299 - LOCATION
      ?auto_3283 - CITY
      ?auto_3300 - CITY
      ?auto_3297 - LOCATION
      ?auto_3294 - CITY
      ?auto_3282 - TRUCK
      ?auto_3298 - LOCATION
      ?auto_3285 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3272 ?auto_3270 ) ( GREATER-THAN ?auto_3273 ?auto_3270 ) ( GREATER-THAN ?auto_3273 ?auto_3272 ) ( GREATER-THAN ?auto_3274 ?auto_3270 ) ( GREATER-THAN ?auto_3274 ?auto_3272 ) ( GREATER-THAN ?auto_3274 ?auto_3273 ) ( GREATER-THAN ?auto_3275 ?auto_3270 ) ( GREATER-THAN ?auto_3275 ?auto_3272 ) ( GREATER-THAN ?auto_3275 ?auto_3273 ) ( GREATER-THAN ?auto_3275 ?auto_3274 ) ( IN-CITY ?auto_3278 ?auto_3281 ) ( IN-CITY ?auto_3280 ?auto_3281 ) ( not ( = ?auto_3280 ?auto_3278 ) ) ( OBJ-AT ?auto_3275 ?auto_3278 ) ( IN-CITY ?auto_3280 ?auto_3277 ) ( IN-CITY ?auto_3278 ?auto_3277 ) ( IN-CITY ?auto_3289 ?auto_3291 ) ( IN-CITY ?auto_3280 ?auto_3291 ) ( not ( = ?auto_3280 ?auto_3289 ) ) ( OBJ-AT ?auto_3274 ?auto_3289 ) ( IN-CITY ?auto_3280 ?auto_3288 ) ( IN-CITY ?auto_3289 ?auto_3288 ) ( IN-CITY ?auto_3296 ?auto_3301 ) ( IN-CITY ?auto_3280 ?auto_3301 ) ( not ( = ?auto_3280 ?auto_3296 ) ) ( OBJ-AT ?auto_3273 ?auto_3296 ) ( IN-CITY ?auto_3280 ?auto_3293 ) ( IN-CITY ?auto_3296 ?auto_3293 ) ( IN-CITY ?auto_3299 ?auto_3283 ) ( IN-CITY ?auto_3280 ?auto_3283 ) ( not ( = ?auto_3280 ?auto_3299 ) ) ( OBJ-AT ?auto_3272 ?auto_3299 ) ( IN-CITY ?auto_3280 ?auto_3300 ) ( IN-CITY ?auto_3299 ?auto_3300 ) ( IN-CITY ?auto_3297 ?auto_3294 ) ( IN-CITY ?auto_3280 ?auto_3294 ) ( not ( = ?auto_3280 ?auto_3297 ) ) ( OBJ-AT ?auto_3270 ?auto_3297 ) ( TRUCK-AT ?auto_3282 ?auto_3298 ) ( IN-CITY ?auto_3298 ?auto_3285 ) ( IN-CITY ?auto_3297 ?auto_3285 ) ( not ( = ?auto_3297 ?auto_3298 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3270 ?auto_3272 ?auto_3273 ?auto_3274 ?auto_3280 )
      ( DELIVER-1PKG ?auto_3275 ?auto_3280 )
      ( DELIVER-5PKG-VERIFY ?auto_3270 ?auto_3272 ?auto_3273 ?auto_3274 ?auto_3275 ?auto_3280 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3327 - OBJ
      ?auto_3329 - OBJ
      ?auto_3330 - OBJ
      ?auto_3331 - OBJ
      ?auto_3332 - OBJ
      ?auto_3333 - OBJ
      ?auto_3338 - LOCATION
    )
    :vars
    (
      ?auto_3335 - LOCATION
      ?auto_3336 - CITY
      ?auto_3340 - CITY
      ?auto_3344 - LOCATION
      ?auto_3347 - CITY
      ?auto_3352 - CITY
      ?auto_3343 - LOCATION
      ?auto_3345 - CITY
      ?auto_3342 - CITY
      ?auto_3351 - LOCATION
      ?auto_3361 - CITY
      ?auto_3346 - CITY
      ?auto_3362 - LOCATION
      ?auto_3363 - CITY
      ?auto_3355 - CITY
      ?auto_3359 - LOCATION
      ?auto_3350 - CITY
      ?auto_3339 - TRUCK
      ?auto_3360 - LOCATION
      ?auto_3348 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3329 ?auto_3327 ) ( GREATER-THAN ?auto_3330 ?auto_3327 ) ( GREATER-THAN ?auto_3330 ?auto_3329 ) ( GREATER-THAN ?auto_3331 ?auto_3327 ) ( GREATER-THAN ?auto_3331 ?auto_3329 ) ( GREATER-THAN ?auto_3331 ?auto_3330 ) ( GREATER-THAN ?auto_3332 ?auto_3327 ) ( GREATER-THAN ?auto_3332 ?auto_3329 ) ( GREATER-THAN ?auto_3332 ?auto_3330 ) ( GREATER-THAN ?auto_3332 ?auto_3331 ) ( GREATER-THAN ?auto_3333 ?auto_3327 ) ( GREATER-THAN ?auto_3333 ?auto_3329 ) ( GREATER-THAN ?auto_3333 ?auto_3330 ) ( GREATER-THAN ?auto_3333 ?auto_3331 ) ( GREATER-THAN ?auto_3333 ?auto_3332 ) ( IN-CITY ?auto_3335 ?auto_3336 ) ( IN-CITY ?auto_3338 ?auto_3336 ) ( not ( = ?auto_3338 ?auto_3335 ) ) ( OBJ-AT ?auto_3333 ?auto_3335 ) ( IN-CITY ?auto_3338 ?auto_3340 ) ( IN-CITY ?auto_3335 ?auto_3340 ) ( IN-CITY ?auto_3344 ?auto_3347 ) ( IN-CITY ?auto_3338 ?auto_3347 ) ( not ( = ?auto_3338 ?auto_3344 ) ) ( OBJ-AT ?auto_3332 ?auto_3344 ) ( IN-CITY ?auto_3338 ?auto_3352 ) ( IN-CITY ?auto_3344 ?auto_3352 ) ( IN-CITY ?auto_3343 ?auto_3345 ) ( IN-CITY ?auto_3338 ?auto_3345 ) ( not ( = ?auto_3338 ?auto_3343 ) ) ( OBJ-AT ?auto_3331 ?auto_3343 ) ( IN-CITY ?auto_3338 ?auto_3342 ) ( IN-CITY ?auto_3343 ?auto_3342 ) ( IN-CITY ?auto_3351 ?auto_3361 ) ( IN-CITY ?auto_3338 ?auto_3361 ) ( not ( = ?auto_3338 ?auto_3351 ) ) ( OBJ-AT ?auto_3330 ?auto_3351 ) ( IN-CITY ?auto_3338 ?auto_3346 ) ( IN-CITY ?auto_3351 ?auto_3346 ) ( IN-CITY ?auto_3362 ?auto_3363 ) ( IN-CITY ?auto_3338 ?auto_3363 ) ( not ( = ?auto_3338 ?auto_3362 ) ) ( OBJ-AT ?auto_3329 ?auto_3362 ) ( IN-CITY ?auto_3338 ?auto_3355 ) ( IN-CITY ?auto_3362 ?auto_3355 ) ( IN-CITY ?auto_3359 ?auto_3350 ) ( IN-CITY ?auto_3338 ?auto_3350 ) ( not ( = ?auto_3338 ?auto_3359 ) ) ( OBJ-AT ?auto_3327 ?auto_3359 ) ( TRUCK-AT ?auto_3339 ?auto_3360 ) ( IN-CITY ?auto_3360 ?auto_3348 ) ( IN-CITY ?auto_3359 ?auto_3348 ) ( not ( = ?auto_3359 ?auto_3360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3327 ?auto_3329 ?auto_3330 ?auto_3331 ?auto_3332 ?auto_3338 )
      ( DELIVER-1PKG ?auto_3333 ?auto_3338 )
      ( DELIVER-6PKG-VERIFY ?auto_3327 ?auto_3329 ?auto_3330 ?auto_3331 ?auto_3332 ?auto_3333 ?auto_3338 ) )
  )

)

