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

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-8PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?obj8 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) ( OBJ-AT ?obj8 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3158 - OBJ
      ?auto_3159 - LOCATION
    )
    :vars
    (
      ?auto_3161 - LOCATION
      ?auto_3162 - CITY
      ?auto_3160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3161 ?auto_3162 ) ( IN-CITY ?auto_3159 ?auto_3162 ) ( not ( = ?auto_3159 ?auto_3161 ) ) ( OBJ-AT ?auto_3158 ?auto_3161 ) ( TRUCK-AT ?auto_3160 ?auto_3159 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3160 ?auto_3159 ?auto_3161 ?auto_3162 )
      ( !LOAD-TRUCK ?auto_3158 ?auto_3160 ?auto_3161 )
      ( !DRIVE-TRUCK ?auto_3160 ?auto_3161 ?auto_3159 ?auto_3162 )
      ( !UNLOAD-TRUCK ?auto_3158 ?auto_3160 ?auto_3159 )
      ( DELIVER-1PKG-VERIFY ?auto_3158 ?auto_3159 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3173 - OBJ
      ?auto_3175 - OBJ
      ?auto_3174 - LOCATION
    )
    :vars
    (
      ?auto_3178 - LOCATION
      ?auto_3177 - CITY
      ?auto_3179 - LOCATION
      ?auto_3176 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3175 ?auto_3173 ) ( IN-CITY ?auto_3178 ?auto_3177 ) ( IN-CITY ?auto_3174 ?auto_3177 ) ( not ( = ?auto_3174 ?auto_3178 ) ) ( OBJ-AT ?auto_3175 ?auto_3178 ) ( IN-CITY ?auto_3179 ?auto_3177 ) ( not ( = ?auto_3174 ?auto_3179 ) ) ( OBJ-AT ?auto_3173 ?auto_3179 ) ( TRUCK-AT ?auto_3176 ?auto_3174 ) ( not ( = ?auto_3173 ?auto_3175 ) ) ( not ( = ?auto_3178 ?auto_3179 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3173 ?auto_3174 )
      ( DELIVER-1PKG ?auto_3175 ?auto_3174 )
      ( DELIVER-2PKG-VERIFY ?auto_3173 ?auto_3175 ?auto_3174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3191 - OBJ
      ?auto_3193 - OBJ
      ?auto_3194 - OBJ
      ?auto_3192 - LOCATION
    )
    :vars
    (
      ?auto_3195 - LOCATION
      ?auto_3197 - CITY
      ?auto_3198 - LOCATION
      ?auto_3199 - LOCATION
      ?auto_3196 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3193 ?auto_3191 ) ( GREATER-THAN ?auto_3194 ?auto_3191 ) ( GREATER-THAN ?auto_3194 ?auto_3193 ) ( IN-CITY ?auto_3195 ?auto_3197 ) ( IN-CITY ?auto_3192 ?auto_3197 ) ( not ( = ?auto_3192 ?auto_3195 ) ) ( OBJ-AT ?auto_3194 ?auto_3195 ) ( IN-CITY ?auto_3198 ?auto_3197 ) ( not ( = ?auto_3192 ?auto_3198 ) ) ( OBJ-AT ?auto_3193 ?auto_3198 ) ( IN-CITY ?auto_3199 ?auto_3197 ) ( not ( = ?auto_3192 ?auto_3199 ) ) ( OBJ-AT ?auto_3191 ?auto_3199 ) ( TRUCK-AT ?auto_3196 ?auto_3192 ) ( not ( = ?auto_3191 ?auto_3193 ) ) ( not ( = ?auto_3198 ?auto_3199 ) ) ( not ( = ?auto_3191 ?auto_3194 ) ) ( not ( = ?auto_3193 ?auto_3194 ) ) ( not ( = ?auto_3195 ?auto_3198 ) ) ( not ( = ?auto_3195 ?auto_3199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3191 ?auto_3193 ?auto_3192 )
      ( DELIVER-1PKG ?auto_3194 ?auto_3192 )
      ( DELIVER-3PKG-VERIFY ?auto_3191 ?auto_3193 ?auto_3194 ?auto_3192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3212 - OBJ
      ?auto_3214 - OBJ
      ?auto_3215 - OBJ
      ?auto_3216 - OBJ
      ?auto_3213 - LOCATION
    )
    :vars
    (
      ?auto_3218 - LOCATION
      ?auto_3219 - CITY
      ?auto_3220 - LOCATION
      ?auto_3221 - LOCATION
      ?auto_3217 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3214 ?auto_3212 ) ( GREATER-THAN ?auto_3215 ?auto_3212 ) ( GREATER-THAN ?auto_3215 ?auto_3214 ) ( GREATER-THAN ?auto_3216 ?auto_3212 ) ( GREATER-THAN ?auto_3216 ?auto_3214 ) ( GREATER-THAN ?auto_3216 ?auto_3215 ) ( IN-CITY ?auto_3218 ?auto_3219 ) ( IN-CITY ?auto_3213 ?auto_3219 ) ( not ( = ?auto_3213 ?auto_3218 ) ) ( OBJ-AT ?auto_3216 ?auto_3218 ) ( IN-CITY ?auto_3220 ?auto_3219 ) ( not ( = ?auto_3213 ?auto_3220 ) ) ( OBJ-AT ?auto_3215 ?auto_3220 ) ( OBJ-AT ?auto_3214 ?auto_3218 ) ( IN-CITY ?auto_3221 ?auto_3219 ) ( not ( = ?auto_3213 ?auto_3221 ) ) ( OBJ-AT ?auto_3212 ?auto_3221 ) ( TRUCK-AT ?auto_3217 ?auto_3213 ) ( not ( = ?auto_3212 ?auto_3214 ) ) ( not ( = ?auto_3218 ?auto_3221 ) ) ( not ( = ?auto_3212 ?auto_3215 ) ) ( not ( = ?auto_3214 ?auto_3215 ) ) ( not ( = ?auto_3220 ?auto_3218 ) ) ( not ( = ?auto_3220 ?auto_3221 ) ) ( not ( = ?auto_3212 ?auto_3216 ) ) ( not ( = ?auto_3214 ?auto_3216 ) ) ( not ( = ?auto_3215 ?auto_3216 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3212 ?auto_3214 ?auto_3215 ?auto_3213 )
      ( DELIVER-1PKG ?auto_3216 ?auto_3213 )
      ( DELIVER-4PKG-VERIFY ?auto_3212 ?auto_3214 ?auto_3215 ?auto_3216 ?auto_3213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3235 - OBJ
      ?auto_3237 - OBJ
      ?auto_3238 - OBJ
      ?auto_3239 - OBJ
      ?auto_3240 - OBJ
      ?auto_3236 - LOCATION
    )
    :vars
    (
      ?auto_3243 - LOCATION
      ?auto_3241 - CITY
      ?auto_3245 - LOCATION
      ?auto_3246 - LOCATION
      ?auto_3244 - LOCATION
      ?auto_3242 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3237 ?auto_3235 ) ( GREATER-THAN ?auto_3238 ?auto_3235 ) ( GREATER-THAN ?auto_3238 ?auto_3237 ) ( GREATER-THAN ?auto_3239 ?auto_3235 ) ( GREATER-THAN ?auto_3239 ?auto_3237 ) ( GREATER-THAN ?auto_3239 ?auto_3238 ) ( GREATER-THAN ?auto_3240 ?auto_3235 ) ( GREATER-THAN ?auto_3240 ?auto_3237 ) ( GREATER-THAN ?auto_3240 ?auto_3238 ) ( GREATER-THAN ?auto_3240 ?auto_3239 ) ( IN-CITY ?auto_3243 ?auto_3241 ) ( IN-CITY ?auto_3236 ?auto_3241 ) ( not ( = ?auto_3236 ?auto_3243 ) ) ( OBJ-AT ?auto_3240 ?auto_3243 ) ( IN-CITY ?auto_3245 ?auto_3241 ) ( not ( = ?auto_3236 ?auto_3245 ) ) ( OBJ-AT ?auto_3239 ?auto_3245 ) ( IN-CITY ?auto_3246 ?auto_3241 ) ( not ( = ?auto_3236 ?auto_3246 ) ) ( OBJ-AT ?auto_3238 ?auto_3246 ) ( OBJ-AT ?auto_3237 ?auto_3245 ) ( IN-CITY ?auto_3244 ?auto_3241 ) ( not ( = ?auto_3236 ?auto_3244 ) ) ( OBJ-AT ?auto_3235 ?auto_3244 ) ( TRUCK-AT ?auto_3242 ?auto_3236 ) ( not ( = ?auto_3235 ?auto_3237 ) ) ( not ( = ?auto_3245 ?auto_3244 ) ) ( not ( = ?auto_3235 ?auto_3238 ) ) ( not ( = ?auto_3237 ?auto_3238 ) ) ( not ( = ?auto_3246 ?auto_3245 ) ) ( not ( = ?auto_3246 ?auto_3244 ) ) ( not ( = ?auto_3235 ?auto_3239 ) ) ( not ( = ?auto_3237 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3239 ) ) ( not ( = ?auto_3235 ?auto_3240 ) ) ( not ( = ?auto_3237 ?auto_3240 ) ) ( not ( = ?auto_3238 ?auto_3240 ) ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( not ( = ?auto_3243 ?auto_3245 ) ) ( not ( = ?auto_3243 ?auto_3246 ) ) ( not ( = ?auto_3243 ?auto_3244 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3235 ?auto_3237 ?auto_3238 ?auto_3239 ?auto_3236 )
      ( DELIVER-1PKG ?auto_3240 ?auto_3236 )
      ( DELIVER-5PKG-VERIFY ?auto_3235 ?auto_3237 ?auto_3238 ?auto_3239 ?auto_3240 ?auto_3236 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3261 - OBJ
      ?auto_3263 - OBJ
      ?auto_3264 - OBJ
      ?auto_3265 - OBJ
      ?auto_3266 - OBJ
      ?auto_3267 - OBJ
      ?auto_3262 - LOCATION
    )
    :vars
    (
      ?auto_3270 - LOCATION
      ?auto_3269 - CITY
      ?auto_3273 - LOCATION
      ?auto_3271 - LOCATION
      ?auto_3274 - LOCATION
      ?auto_3272 - LOCATION
      ?auto_3268 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3263 ?auto_3261 ) ( GREATER-THAN ?auto_3264 ?auto_3261 ) ( GREATER-THAN ?auto_3264 ?auto_3263 ) ( GREATER-THAN ?auto_3265 ?auto_3261 ) ( GREATER-THAN ?auto_3265 ?auto_3263 ) ( GREATER-THAN ?auto_3265 ?auto_3264 ) ( GREATER-THAN ?auto_3266 ?auto_3261 ) ( GREATER-THAN ?auto_3266 ?auto_3263 ) ( GREATER-THAN ?auto_3266 ?auto_3264 ) ( GREATER-THAN ?auto_3266 ?auto_3265 ) ( GREATER-THAN ?auto_3267 ?auto_3261 ) ( GREATER-THAN ?auto_3267 ?auto_3263 ) ( GREATER-THAN ?auto_3267 ?auto_3264 ) ( GREATER-THAN ?auto_3267 ?auto_3265 ) ( GREATER-THAN ?auto_3267 ?auto_3266 ) ( IN-CITY ?auto_3270 ?auto_3269 ) ( IN-CITY ?auto_3262 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3270 ) ) ( OBJ-AT ?auto_3267 ?auto_3270 ) ( IN-CITY ?auto_3273 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3273 ) ) ( OBJ-AT ?auto_3266 ?auto_3273 ) ( IN-CITY ?auto_3271 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3271 ) ) ( OBJ-AT ?auto_3265 ?auto_3271 ) ( IN-CITY ?auto_3274 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3274 ) ) ( OBJ-AT ?auto_3264 ?auto_3274 ) ( OBJ-AT ?auto_3263 ?auto_3271 ) ( IN-CITY ?auto_3272 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3272 ) ) ( OBJ-AT ?auto_3261 ?auto_3272 ) ( TRUCK-AT ?auto_3268 ?auto_3262 ) ( not ( = ?auto_3261 ?auto_3263 ) ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( not ( = ?auto_3261 ?auto_3264 ) ) ( not ( = ?auto_3263 ?auto_3264 ) ) ( not ( = ?auto_3274 ?auto_3271 ) ) ( not ( = ?auto_3274 ?auto_3272 ) ) ( not ( = ?auto_3261 ?auto_3265 ) ) ( not ( = ?auto_3263 ?auto_3265 ) ) ( not ( = ?auto_3264 ?auto_3265 ) ) ( not ( = ?auto_3261 ?auto_3266 ) ) ( not ( = ?auto_3263 ?auto_3266 ) ) ( not ( = ?auto_3264 ?auto_3266 ) ) ( not ( = ?auto_3265 ?auto_3266 ) ) ( not ( = ?auto_3273 ?auto_3271 ) ) ( not ( = ?auto_3273 ?auto_3274 ) ) ( not ( = ?auto_3273 ?auto_3272 ) ) ( not ( = ?auto_3261 ?auto_3267 ) ) ( not ( = ?auto_3263 ?auto_3267 ) ) ( not ( = ?auto_3264 ?auto_3267 ) ) ( not ( = ?auto_3265 ?auto_3267 ) ) ( not ( = ?auto_3266 ?auto_3267 ) ) ( not ( = ?auto_3270 ?auto_3273 ) ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( not ( = ?auto_3270 ?auto_3274 ) ) ( not ( = ?auto_3270 ?auto_3272 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3261 ?auto_3263 ?auto_3264 ?auto_3265 ?auto_3266 ?auto_3262 )
      ( DELIVER-1PKG ?auto_3267 ?auto_3262 )
      ( DELIVER-6PKG-VERIFY ?auto_3261 ?auto_3263 ?auto_3264 ?auto_3265 ?auto_3266 ?auto_3267 ?auto_3262 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3290 - OBJ
      ?auto_3292 - OBJ
      ?auto_3293 - OBJ
      ?auto_3294 - OBJ
      ?auto_3295 - OBJ
      ?auto_3296 - OBJ
      ?auto_3297 - OBJ
      ?auto_3291 - LOCATION
    )
    :vars
    (
      ?auto_3298 - LOCATION
      ?auto_3300 - CITY
      ?auto_3302 - LOCATION
      ?auto_3304 - LOCATION
      ?auto_3301 - LOCATION
      ?auto_3303 - LOCATION
      ?auto_3299 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3292 ?auto_3290 ) ( GREATER-THAN ?auto_3293 ?auto_3290 ) ( GREATER-THAN ?auto_3293 ?auto_3292 ) ( GREATER-THAN ?auto_3294 ?auto_3290 ) ( GREATER-THAN ?auto_3294 ?auto_3292 ) ( GREATER-THAN ?auto_3294 ?auto_3293 ) ( GREATER-THAN ?auto_3295 ?auto_3290 ) ( GREATER-THAN ?auto_3295 ?auto_3292 ) ( GREATER-THAN ?auto_3295 ?auto_3293 ) ( GREATER-THAN ?auto_3295 ?auto_3294 ) ( GREATER-THAN ?auto_3296 ?auto_3290 ) ( GREATER-THAN ?auto_3296 ?auto_3292 ) ( GREATER-THAN ?auto_3296 ?auto_3293 ) ( GREATER-THAN ?auto_3296 ?auto_3294 ) ( GREATER-THAN ?auto_3296 ?auto_3295 ) ( GREATER-THAN ?auto_3297 ?auto_3290 ) ( GREATER-THAN ?auto_3297 ?auto_3292 ) ( GREATER-THAN ?auto_3297 ?auto_3293 ) ( GREATER-THAN ?auto_3297 ?auto_3294 ) ( GREATER-THAN ?auto_3297 ?auto_3295 ) ( GREATER-THAN ?auto_3297 ?auto_3296 ) ( IN-CITY ?auto_3298 ?auto_3300 ) ( IN-CITY ?auto_3291 ?auto_3300 ) ( not ( = ?auto_3291 ?auto_3298 ) ) ( OBJ-AT ?auto_3297 ?auto_3298 ) ( OBJ-AT ?auto_3296 ?auto_3298 ) ( IN-CITY ?auto_3302 ?auto_3300 ) ( not ( = ?auto_3291 ?auto_3302 ) ) ( OBJ-AT ?auto_3295 ?auto_3302 ) ( IN-CITY ?auto_3304 ?auto_3300 ) ( not ( = ?auto_3291 ?auto_3304 ) ) ( OBJ-AT ?auto_3294 ?auto_3304 ) ( IN-CITY ?auto_3301 ?auto_3300 ) ( not ( = ?auto_3291 ?auto_3301 ) ) ( OBJ-AT ?auto_3293 ?auto_3301 ) ( OBJ-AT ?auto_3292 ?auto_3304 ) ( IN-CITY ?auto_3303 ?auto_3300 ) ( not ( = ?auto_3291 ?auto_3303 ) ) ( OBJ-AT ?auto_3290 ?auto_3303 ) ( TRUCK-AT ?auto_3299 ?auto_3291 ) ( not ( = ?auto_3290 ?auto_3292 ) ) ( not ( = ?auto_3304 ?auto_3303 ) ) ( not ( = ?auto_3290 ?auto_3293 ) ) ( not ( = ?auto_3292 ?auto_3293 ) ) ( not ( = ?auto_3301 ?auto_3304 ) ) ( not ( = ?auto_3301 ?auto_3303 ) ) ( not ( = ?auto_3290 ?auto_3294 ) ) ( not ( = ?auto_3292 ?auto_3294 ) ) ( not ( = ?auto_3293 ?auto_3294 ) ) ( not ( = ?auto_3290 ?auto_3295 ) ) ( not ( = ?auto_3292 ?auto_3295 ) ) ( not ( = ?auto_3293 ?auto_3295 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( not ( = ?auto_3302 ?auto_3304 ) ) ( not ( = ?auto_3302 ?auto_3301 ) ) ( not ( = ?auto_3302 ?auto_3303 ) ) ( not ( = ?auto_3290 ?auto_3296 ) ) ( not ( = ?auto_3292 ?auto_3296 ) ) ( not ( = ?auto_3293 ?auto_3296 ) ) ( not ( = ?auto_3294 ?auto_3296 ) ) ( not ( = ?auto_3295 ?auto_3296 ) ) ( not ( = ?auto_3298 ?auto_3302 ) ) ( not ( = ?auto_3298 ?auto_3304 ) ) ( not ( = ?auto_3298 ?auto_3301 ) ) ( not ( = ?auto_3298 ?auto_3303 ) ) ( not ( = ?auto_3290 ?auto_3297 ) ) ( not ( = ?auto_3292 ?auto_3297 ) ) ( not ( = ?auto_3293 ?auto_3297 ) ) ( not ( = ?auto_3294 ?auto_3297 ) ) ( not ( = ?auto_3295 ?auto_3297 ) ) ( not ( = ?auto_3296 ?auto_3297 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3290 ?auto_3292 ?auto_3293 ?auto_3294 ?auto_3295 ?auto_3296 ?auto_3291 )
      ( DELIVER-1PKG ?auto_3297 ?auto_3291 )
      ( DELIVER-7PKG-VERIFY ?auto_3290 ?auto_3292 ?auto_3293 ?auto_3294 ?auto_3295 ?auto_3296 ?auto_3297 ?auto_3291 ) )
  )

  ( :method DELIVER-8PKG
    :parameters
    (
      ?auto_3321 - OBJ
      ?auto_3323 - OBJ
      ?auto_3324 - OBJ
      ?auto_3325 - OBJ
      ?auto_3326 - OBJ
      ?auto_3328 - OBJ
      ?auto_3329 - OBJ
      ?auto_3327 - OBJ
      ?auto_3322 - LOCATION
    )
    :vars
    (
      ?auto_3331 - LOCATION
      ?auto_3332 - CITY
      ?auto_3334 - LOCATION
      ?auto_3335 - LOCATION
      ?auto_3336 - LOCATION
      ?auto_3337 - LOCATION
      ?auto_3333 - LOCATION
      ?auto_3330 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3323 ?auto_3321 ) ( GREATER-THAN ?auto_3324 ?auto_3321 ) ( GREATER-THAN ?auto_3324 ?auto_3323 ) ( GREATER-THAN ?auto_3325 ?auto_3321 ) ( GREATER-THAN ?auto_3325 ?auto_3323 ) ( GREATER-THAN ?auto_3325 ?auto_3324 ) ( GREATER-THAN ?auto_3326 ?auto_3321 ) ( GREATER-THAN ?auto_3326 ?auto_3323 ) ( GREATER-THAN ?auto_3326 ?auto_3324 ) ( GREATER-THAN ?auto_3326 ?auto_3325 ) ( GREATER-THAN ?auto_3328 ?auto_3321 ) ( GREATER-THAN ?auto_3328 ?auto_3323 ) ( GREATER-THAN ?auto_3328 ?auto_3324 ) ( GREATER-THAN ?auto_3328 ?auto_3325 ) ( GREATER-THAN ?auto_3328 ?auto_3326 ) ( GREATER-THAN ?auto_3329 ?auto_3321 ) ( GREATER-THAN ?auto_3329 ?auto_3323 ) ( GREATER-THAN ?auto_3329 ?auto_3324 ) ( GREATER-THAN ?auto_3329 ?auto_3325 ) ( GREATER-THAN ?auto_3329 ?auto_3326 ) ( GREATER-THAN ?auto_3329 ?auto_3328 ) ( GREATER-THAN ?auto_3327 ?auto_3321 ) ( GREATER-THAN ?auto_3327 ?auto_3323 ) ( GREATER-THAN ?auto_3327 ?auto_3324 ) ( GREATER-THAN ?auto_3327 ?auto_3325 ) ( GREATER-THAN ?auto_3327 ?auto_3326 ) ( GREATER-THAN ?auto_3327 ?auto_3328 ) ( GREATER-THAN ?auto_3327 ?auto_3329 ) ( IN-CITY ?auto_3331 ?auto_3332 ) ( IN-CITY ?auto_3322 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3331 ) ) ( OBJ-AT ?auto_3327 ?auto_3331 ) ( IN-CITY ?auto_3334 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3334 ) ) ( OBJ-AT ?auto_3329 ?auto_3334 ) ( OBJ-AT ?auto_3328 ?auto_3334 ) ( IN-CITY ?auto_3335 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3335 ) ) ( OBJ-AT ?auto_3326 ?auto_3335 ) ( IN-CITY ?auto_3336 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3336 ) ) ( OBJ-AT ?auto_3325 ?auto_3336 ) ( IN-CITY ?auto_3337 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3337 ) ) ( OBJ-AT ?auto_3324 ?auto_3337 ) ( OBJ-AT ?auto_3323 ?auto_3336 ) ( IN-CITY ?auto_3333 ?auto_3332 ) ( not ( = ?auto_3322 ?auto_3333 ) ) ( OBJ-AT ?auto_3321 ?auto_3333 ) ( TRUCK-AT ?auto_3330 ?auto_3322 ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( not ( = ?auto_3336 ?auto_3333 ) ) ( not ( = ?auto_3321 ?auto_3324 ) ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( not ( = ?auto_3337 ?auto_3336 ) ) ( not ( = ?auto_3337 ?auto_3333 ) ) ( not ( = ?auto_3321 ?auto_3325 ) ) ( not ( = ?auto_3323 ?auto_3325 ) ) ( not ( = ?auto_3324 ?auto_3325 ) ) ( not ( = ?auto_3321 ?auto_3326 ) ) ( not ( = ?auto_3323 ?auto_3326 ) ) ( not ( = ?auto_3324 ?auto_3326 ) ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3335 ?auto_3337 ) ) ( not ( = ?auto_3335 ?auto_3333 ) ) ( not ( = ?auto_3321 ?auto_3328 ) ) ( not ( = ?auto_3323 ?auto_3328 ) ) ( not ( = ?auto_3324 ?auto_3328 ) ) ( not ( = ?auto_3325 ?auto_3328 ) ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( not ( = ?auto_3334 ?auto_3335 ) ) ( not ( = ?auto_3334 ?auto_3336 ) ) ( not ( = ?auto_3334 ?auto_3337 ) ) ( not ( = ?auto_3334 ?auto_3333 ) ) ( not ( = ?auto_3321 ?auto_3329 ) ) ( not ( = ?auto_3323 ?auto_3329 ) ) ( not ( = ?auto_3324 ?auto_3329 ) ) ( not ( = ?auto_3325 ?auto_3329 ) ) ( not ( = ?auto_3326 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( not ( = ?auto_3321 ?auto_3327 ) ) ( not ( = ?auto_3323 ?auto_3327 ) ) ( not ( = ?auto_3324 ?auto_3327 ) ) ( not ( = ?auto_3325 ?auto_3327 ) ) ( not ( = ?auto_3326 ?auto_3327 ) ) ( not ( = ?auto_3328 ?auto_3327 ) ) ( not ( = ?auto_3329 ?auto_3327 ) ) ( not ( = ?auto_3331 ?auto_3334 ) ) ( not ( = ?auto_3331 ?auto_3335 ) ) ( not ( = ?auto_3331 ?auto_3336 ) ) ( not ( = ?auto_3331 ?auto_3337 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) )
    :subtasks
    ( ( DELIVER-7PKG ?auto_3321 ?auto_3323 ?auto_3324 ?auto_3325 ?auto_3326 ?auto_3328 ?auto_3329 ?auto_3322 )
      ( DELIVER-1PKG ?auto_3327 ?auto_3322 )
      ( DELIVER-8PKG-VERIFY ?auto_3321 ?auto_3323 ?auto_3324 ?auto_3325 ?auto_3326 ?auto_3328 ?auto_3329 ?auto_3327 ?auto_3322 ) )
  )

)

