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
      ?auto_9168 - OBJ
      ?auto_9169 - LOCATION
    )
    :vars
    (
      ?auto_9170 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9170 ?auto_9169 ) ( IN-TRUCK ?auto_9168 ?auto_9170 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9168 ?auto_9170 ?auto_9169 )
      ( DELIVER-1PKG-VERIFY ?auto_9168 ?auto_9169 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9173 - OBJ
      ?auto_9174 - LOCATION
    )
    :vars
    (
      ?auto_9175 - TRUCK
      ?auto_9176 - LOCATION
      ?auto_9177 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9173 ?auto_9175 ) ( TRUCK-AT ?auto_9175 ?auto_9176 ) ( IN-CITY ?auto_9176 ?auto_9177 ) ( IN-CITY ?auto_9174 ?auto_9177 ) ( not ( = ?auto_9174 ?auto_9176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9175 ?auto_9176 ?auto_9174 ?auto_9177 )
      ( DELIVER-1PKG ?auto_9173 ?auto_9174 )
      ( DELIVER-1PKG-VERIFY ?auto_9173 ?auto_9174 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9180 - OBJ
      ?auto_9181 - LOCATION
    )
    :vars
    (
      ?auto_9183 - TRUCK
      ?auto_9182 - LOCATION
      ?auto_9184 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9183 ?auto_9182 ) ( IN-CITY ?auto_9182 ?auto_9184 ) ( IN-CITY ?auto_9181 ?auto_9184 ) ( not ( = ?auto_9181 ?auto_9182 ) ) ( OBJ-AT ?auto_9180 ?auto_9182 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9180 ?auto_9183 ?auto_9182 )
      ( DELIVER-1PKG ?auto_9180 ?auto_9181 )
      ( DELIVER-1PKG-VERIFY ?auto_9180 ?auto_9181 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9187 - OBJ
      ?auto_9188 - LOCATION
    )
    :vars
    (
      ?auto_9190 - LOCATION
      ?auto_9191 - CITY
      ?auto_9189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9190 ?auto_9191 ) ( IN-CITY ?auto_9188 ?auto_9191 ) ( not ( = ?auto_9188 ?auto_9190 ) ) ( OBJ-AT ?auto_9187 ?auto_9190 ) ( TRUCK-AT ?auto_9189 ?auto_9188 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9189 ?auto_9188 ?auto_9190 ?auto_9191 )
      ( DELIVER-1PKG ?auto_9187 ?auto_9188 )
      ( DELIVER-1PKG-VERIFY ?auto_9187 ?auto_9188 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9221 - OBJ
      ?auto_9223 - OBJ
      ?auto_9222 - LOCATION
    )
    :vars
    (
      ?auto_9224 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9223 ?auto_9221 ) ( TRUCK-AT ?auto_9224 ?auto_9222 ) ( IN-TRUCK ?auto_9223 ?auto_9224 ) ( OBJ-AT ?auto_9221 ?auto_9222 ) ( not ( = ?auto_9221 ?auto_9223 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9223 ?auto_9222 )
      ( DELIVER-2PKG-VERIFY ?auto_9221 ?auto_9223 ?auto_9222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9228 - OBJ
      ?auto_9230 - OBJ
      ?auto_9229 - LOCATION
    )
    :vars
    (
      ?auto_9231 - TRUCK
      ?auto_9232 - LOCATION
      ?auto_9233 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9230 ?auto_9228 ) ( IN-TRUCK ?auto_9230 ?auto_9231 ) ( TRUCK-AT ?auto_9231 ?auto_9232 ) ( IN-CITY ?auto_9232 ?auto_9233 ) ( IN-CITY ?auto_9229 ?auto_9233 ) ( not ( = ?auto_9229 ?auto_9232 ) ) ( OBJ-AT ?auto_9228 ?auto_9229 ) ( not ( = ?auto_9228 ?auto_9230 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9230 ?auto_9229 )
      ( DELIVER-2PKG-VERIFY ?auto_9228 ?auto_9230 ?auto_9229 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9237 - OBJ
      ?auto_9239 - OBJ
      ?auto_9238 - LOCATION
    )
    :vars
    (
      ?auto_9240 - TRUCK
      ?auto_9241 - LOCATION
      ?auto_9242 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9239 ?auto_9237 ) ( TRUCK-AT ?auto_9240 ?auto_9241 ) ( IN-CITY ?auto_9241 ?auto_9242 ) ( IN-CITY ?auto_9238 ?auto_9242 ) ( not ( = ?auto_9238 ?auto_9241 ) ) ( OBJ-AT ?auto_9239 ?auto_9241 ) ( OBJ-AT ?auto_9237 ?auto_9238 ) ( not ( = ?auto_9237 ?auto_9239 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9239 ?auto_9238 )
      ( DELIVER-2PKG-VERIFY ?auto_9237 ?auto_9239 ?auto_9238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9246 - OBJ
      ?auto_9248 - OBJ
      ?auto_9247 - LOCATION
    )
    :vars
    (
      ?auto_9251 - LOCATION
      ?auto_9249 - CITY
      ?auto_9250 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9248 ?auto_9246 ) ( IN-CITY ?auto_9251 ?auto_9249 ) ( IN-CITY ?auto_9247 ?auto_9249 ) ( not ( = ?auto_9247 ?auto_9251 ) ) ( OBJ-AT ?auto_9248 ?auto_9251 ) ( TRUCK-AT ?auto_9250 ?auto_9247 ) ( OBJ-AT ?auto_9246 ?auto_9247 ) ( not ( = ?auto_9246 ?auto_9248 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9248 ?auto_9247 )
      ( DELIVER-2PKG-VERIFY ?auto_9246 ?auto_9248 ?auto_9247 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9255 - OBJ
      ?auto_9257 - OBJ
      ?auto_9256 - LOCATION
    )
    :vars
    (
      ?auto_9259 - LOCATION
      ?auto_9258 - CITY
      ?auto_9260 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9257 ?auto_9255 ) ( IN-CITY ?auto_9259 ?auto_9258 ) ( IN-CITY ?auto_9256 ?auto_9258 ) ( not ( = ?auto_9256 ?auto_9259 ) ) ( OBJ-AT ?auto_9257 ?auto_9259 ) ( TRUCK-AT ?auto_9260 ?auto_9256 ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( IN-TRUCK ?auto_9255 ?auto_9260 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9255 ?auto_9256 )
      ( DELIVER-2PKG ?auto_9255 ?auto_9257 ?auto_9256 )
      ( DELIVER-2PKG-VERIFY ?auto_9255 ?auto_9257 ?auto_9256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9264 - OBJ
      ?auto_9266 - OBJ
      ?auto_9265 - LOCATION
    )
    :vars
    (
      ?auto_9267 - LOCATION
      ?auto_9269 - CITY
      ?auto_9268 - TRUCK
      ?auto_9270 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9266 ?auto_9264 ) ( IN-CITY ?auto_9267 ?auto_9269 ) ( IN-CITY ?auto_9265 ?auto_9269 ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( OBJ-AT ?auto_9266 ?auto_9267 ) ( not ( = ?auto_9264 ?auto_9266 ) ) ( IN-TRUCK ?auto_9264 ?auto_9268 ) ( TRUCK-AT ?auto_9268 ?auto_9270 ) ( IN-CITY ?auto_9270 ?auto_9269 ) ( not ( = ?auto_9265 ?auto_9270 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9268 ?auto_9270 ?auto_9265 ?auto_9269 )
      ( DELIVER-2PKG ?auto_9264 ?auto_9266 ?auto_9265 )
      ( DELIVER-2PKG-VERIFY ?auto_9264 ?auto_9266 ?auto_9265 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9274 - OBJ
      ?auto_9276 - OBJ
      ?auto_9275 - LOCATION
    )
    :vars
    (
      ?auto_9278 - LOCATION
      ?auto_9277 - CITY
      ?auto_9280 - TRUCK
      ?auto_9279 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9276 ?auto_9274 ) ( IN-CITY ?auto_9278 ?auto_9277 ) ( IN-CITY ?auto_9275 ?auto_9277 ) ( not ( = ?auto_9275 ?auto_9278 ) ) ( OBJ-AT ?auto_9276 ?auto_9278 ) ( not ( = ?auto_9274 ?auto_9276 ) ) ( TRUCK-AT ?auto_9280 ?auto_9279 ) ( IN-CITY ?auto_9279 ?auto_9277 ) ( not ( = ?auto_9275 ?auto_9279 ) ) ( not ( = ?auto_9278 ?auto_9279 ) ) ( OBJ-AT ?auto_9274 ?auto_9279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9274 ?auto_9280 ?auto_9279 )
      ( DELIVER-2PKG ?auto_9274 ?auto_9276 ?auto_9275 )
      ( DELIVER-2PKG-VERIFY ?auto_9274 ?auto_9276 ?auto_9275 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9284 - OBJ
      ?auto_9286 - OBJ
      ?auto_9285 - LOCATION
    )
    :vars
    (
      ?auto_9290 - LOCATION
      ?auto_9289 - CITY
      ?auto_9287 - LOCATION
      ?auto_9288 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9286 ?auto_9284 ) ( IN-CITY ?auto_9290 ?auto_9289 ) ( IN-CITY ?auto_9285 ?auto_9289 ) ( not ( = ?auto_9285 ?auto_9290 ) ) ( OBJ-AT ?auto_9286 ?auto_9290 ) ( not ( = ?auto_9284 ?auto_9286 ) ) ( IN-CITY ?auto_9287 ?auto_9289 ) ( not ( = ?auto_9285 ?auto_9287 ) ) ( not ( = ?auto_9290 ?auto_9287 ) ) ( OBJ-AT ?auto_9284 ?auto_9287 ) ( TRUCK-AT ?auto_9288 ?auto_9285 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9288 ?auto_9285 ?auto_9287 ?auto_9289 )
      ( DELIVER-2PKG ?auto_9284 ?auto_9286 ?auto_9285 )
      ( DELIVER-2PKG-VERIFY ?auto_9284 ?auto_9286 ?auto_9285 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9321 - OBJ
      ?auto_9323 - OBJ
      ?auto_9324 - OBJ
      ?auto_9322 - LOCATION
    )
    :vars
    (
      ?auto_9325 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9323 ?auto_9321 ) ( GREATER-THAN ?auto_9324 ?auto_9321 ) ( GREATER-THAN ?auto_9324 ?auto_9323 ) ( TRUCK-AT ?auto_9325 ?auto_9322 ) ( IN-TRUCK ?auto_9324 ?auto_9325 ) ( OBJ-AT ?auto_9321 ?auto_9322 ) ( OBJ-AT ?auto_9323 ?auto_9322 ) ( not ( = ?auto_9321 ?auto_9323 ) ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9324 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9324 ?auto_9322 )
      ( DELIVER-3PKG-VERIFY ?auto_9321 ?auto_9323 ?auto_9324 ?auto_9322 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9330 - OBJ
      ?auto_9332 - OBJ
      ?auto_9333 - OBJ
      ?auto_9331 - LOCATION
    )
    :vars
    (
      ?auto_9336 - TRUCK
      ?auto_9334 - LOCATION
      ?auto_9335 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9332 ?auto_9330 ) ( GREATER-THAN ?auto_9333 ?auto_9330 ) ( GREATER-THAN ?auto_9333 ?auto_9332 ) ( IN-TRUCK ?auto_9333 ?auto_9336 ) ( TRUCK-AT ?auto_9336 ?auto_9334 ) ( IN-CITY ?auto_9334 ?auto_9335 ) ( IN-CITY ?auto_9331 ?auto_9335 ) ( not ( = ?auto_9331 ?auto_9334 ) ) ( OBJ-AT ?auto_9330 ?auto_9331 ) ( OBJ-AT ?auto_9332 ?auto_9331 ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( not ( = ?auto_9330 ?auto_9333 ) ) ( not ( = ?auto_9332 ?auto_9333 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9333 ?auto_9331 )
      ( DELIVER-3PKG-VERIFY ?auto_9330 ?auto_9332 ?auto_9333 ?auto_9331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9341 - OBJ
      ?auto_9343 - OBJ
      ?auto_9344 - OBJ
      ?auto_9342 - LOCATION
    )
    :vars
    (
      ?auto_9346 - TRUCK
      ?auto_9347 - LOCATION
      ?auto_9345 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9343 ?auto_9341 ) ( GREATER-THAN ?auto_9344 ?auto_9341 ) ( GREATER-THAN ?auto_9344 ?auto_9343 ) ( TRUCK-AT ?auto_9346 ?auto_9347 ) ( IN-CITY ?auto_9347 ?auto_9345 ) ( IN-CITY ?auto_9342 ?auto_9345 ) ( not ( = ?auto_9342 ?auto_9347 ) ) ( OBJ-AT ?auto_9344 ?auto_9347 ) ( OBJ-AT ?auto_9341 ?auto_9342 ) ( OBJ-AT ?auto_9343 ?auto_9342 ) ( not ( = ?auto_9341 ?auto_9343 ) ) ( not ( = ?auto_9341 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9344 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9344 ?auto_9342 )
      ( DELIVER-3PKG-VERIFY ?auto_9341 ?auto_9343 ?auto_9344 ?auto_9342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9352 - OBJ
      ?auto_9354 - OBJ
      ?auto_9355 - OBJ
      ?auto_9353 - LOCATION
    )
    :vars
    (
      ?auto_9357 - LOCATION
      ?auto_9356 - CITY
      ?auto_9358 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9354 ?auto_9352 ) ( GREATER-THAN ?auto_9355 ?auto_9352 ) ( GREATER-THAN ?auto_9355 ?auto_9354 ) ( IN-CITY ?auto_9357 ?auto_9356 ) ( IN-CITY ?auto_9353 ?auto_9356 ) ( not ( = ?auto_9353 ?auto_9357 ) ) ( OBJ-AT ?auto_9355 ?auto_9357 ) ( TRUCK-AT ?auto_9358 ?auto_9353 ) ( OBJ-AT ?auto_9352 ?auto_9353 ) ( OBJ-AT ?auto_9354 ?auto_9353 ) ( not ( = ?auto_9352 ?auto_9354 ) ) ( not ( = ?auto_9352 ?auto_9355 ) ) ( not ( = ?auto_9354 ?auto_9355 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9355 ?auto_9353 )
      ( DELIVER-3PKG-VERIFY ?auto_9352 ?auto_9354 ?auto_9355 ?auto_9353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9363 - OBJ
      ?auto_9365 - OBJ
      ?auto_9366 - OBJ
      ?auto_9364 - LOCATION
    )
    :vars
    (
      ?auto_9369 - LOCATION
      ?auto_9367 - CITY
      ?auto_9368 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9365 ?auto_9363 ) ( GREATER-THAN ?auto_9366 ?auto_9363 ) ( GREATER-THAN ?auto_9366 ?auto_9365 ) ( IN-CITY ?auto_9369 ?auto_9367 ) ( IN-CITY ?auto_9364 ?auto_9367 ) ( not ( = ?auto_9364 ?auto_9369 ) ) ( OBJ-AT ?auto_9366 ?auto_9369 ) ( TRUCK-AT ?auto_9368 ?auto_9364 ) ( OBJ-AT ?auto_9363 ?auto_9364 ) ( not ( = ?auto_9363 ?auto_9365 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( not ( = ?auto_9365 ?auto_9366 ) ) ( IN-TRUCK ?auto_9365 ?auto_9368 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9365 ?auto_9364 )
      ( DELIVER-3PKG ?auto_9363 ?auto_9365 ?auto_9366 ?auto_9364 )
      ( DELIVER-3PKG-VERIFY ?auto_9363 ?auto_9365 ?auto_9366 ?auto_9364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9374 - OBJ
      ?auto_9376 - OBJ
      ?auto_9377 - OBJ
      ?auto_9375 - LOCATION
    )
    :vars
    (
      ?auto_9379 - LOCATION
      ?auto_9380 - CITY
      ?auto_9378 - TRUCK
      ?auto_9381 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9376 ?auto_9374 ) ( GREATER-THAN ?auto_9377 ?auto_9374 ) ( GREATER-THAN ?auto_9377 ?auto_9376 ) ( IN-CITY ?auto_9379 ?auto_9380 ) ( IN-CITY ?auto_9375 ?auto_9380 ) ( not ( = ?auto_9375 ?auto_9379 ) ) ( OBJ-AT ?auto_9377 ?auto_9379 ) ( OBJ-AT ?auto_9374 ?auto_9375 ) ( not ( = ?auto_9374 ?auto_9376 ) ) ( not ( = ?auto_9374 ?auto_9377 ) ) ( not ( = ?auto_9376 ?auto_9377 ) ) ( IN-TRUCK ?auto_9376 ?auto_9378 ) ( TRUCK-AT ?auto_9378 ?auto_9381 ) ( IN-CITY ?auto_9381 ?auto_9380 ) ( not ( = ?auto_9375 ?auto_9381 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9378 ?auto_9381 ?auto_9375 ?auto_9380 )
      ( DELIVER-3PKG ?auto_9374 ?auto_9376 ?auto_9377 ?auto_9375 )
      ( DELIVER-3PKG-VERIFY ?auto_9374 ?auto_9376 ?auto_9377 ?auto_9375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9386 - OBJ
      ?auto_9388 - OBJ
      ?auto_9389 - OBJ
      ?auto_9387 - LOCATION
    )
    :vars
    (
      ?auto_9391 - LOCATION
      ?auto_9393 - CITY
      ?auto_9392 - TRUCK
      ?auto_9390 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9388 ?auto_9386 ) ( GREATER-THAN ?auto_9389 ?auto_9386 ) ( GREATER-THAN ?auto_9389 ?auto_9388 ) ( IN-CITY ?auto_9391 ?auto_9393 ) ( IN-CITY ?auto_9387 ?auto_9393 ) ( not ( = ?auto_9387 ?auto_9391 ) ) ( OBJ-AT ?auto_9389 ?auto_9391 ) ( OBJ-AT ?auto_9386 ?auto_9387 ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9389 ) ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( TRUCK-AT ?auto_9392 ?auto_9390 ) ( IN-CITY ?auto_9390 ?auto_9393 ) ( not ( = ?auto_9387 ?auto_9390 ) ) ( not ( = ?auto_9391 ?auto_9390 ) ) ( OBJ-AT ?auto_9388 ?auto_9390 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9388 ?auto_9392 ?auto_9390 )
      ( DELIVER-3PKG ?auto_9386 ?auto_9388 ?auto_9389 ?auto_9387 )
      ( DELIVER-3PKG-VERIFY ?auto_9386 ?auto_9388 ?auto_9389 ?auto_9387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9398 - OBJ
      ?auto_9400 - OBJ
      ?auto_9401 - OBJ
      ?auto_9399 - LOCATION
    )
    :vars
    (
      ?auto_9404 - LOCATION
      ?auto_9402 - CITY
      ?auto_9405 - LOCATION
      ?auto_9403 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9400 ?auto_9398 ) ( GREATER-THAN ?auto_9401 ?auto_9398 ) ( GREATER-THAN ?auto_9401 ?auto_9400 ) ( IN-CITY ?auto_9404 ?auto_9402 ) ( IN-CITY ?auto_9399 ?auto_9402 ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( OBJ-AT ?auto_9401 ?auto_9404 ) ( OBJ-AT ?auto_9398 ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( IN-CITY ?auto_9405 ?auto_9402 ) ( not ( = ?auto_9399 ?auto_9405 ) ) ( not ( = ?auto_9404 ?auto_9405 ) ) ( OBJ-AT ?auto_9400 ?auto_9405 ) ( TRUCK-AT ?auto_9403 ?auto_9399 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9403 ?auto_9399 ?auto_9405 ?auto_9402 )
      ( DELIVER-3PKG ?auto_9398 ?auto_9400 ?auto_9401 ?auto_9399 )
      ( DELIVER-3PKG-VERIFY ?auto_9398 ?auto_9400 ?auto_9401 ?auto_9399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9410 - OBJ
      ?auto_9412 - OBJ
      ?auto_9413 - OBJ
      ?auto_9411 - LOCATION
    )
    :vars
    (
      ?auto_9417 - LOCATION
      ?auto_9416 - CITY
      ?auto_9415 - LOCATION
      ?auto_9414 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9412 ?auto_9410 ) ( GREATER-THAN ?auto_9413 ?auto_9410 ) ( GREATER-THAN ?auto_9413 ?auto_9412 ) ( IN-CITY ?auto_9417 ?auto_9416 ) ( IN-CITY ?auto_9411 ?auto_9416 ) ( not ( = ?auto_9411 ?auto_9417 ) ) ( OBJ-AT ?auto_9413 ?auto_9417 ) ( not ( = ?auto_9410 ?auto_9412 ) ) ( not ( = ?auto_9410 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( IN-CITY ?auto_9415 ?auto_9416 ) ( not ( = ?auto_9411 ?auto_9415 ) ) ( not ( = ?auto_9417 ?auto_9415 ) ) ( OBJ-AT ?auto_9412 ?auto_9415 ) ( TRUCK-AT ?auto_9414 ?auto_9411 ) ( IN-TRUCK ?auto_9410 ?auto_9414 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9410 ?auto_9411 )
      ( DELIVER-3PKG ?auto_9410 ?auto_9412 ?auto_9413 ?auto_9411 )
      ( DELIVER-3PKG-VERIFY ?auto_9410 ?auto_9412 ?auto_9413 ?auto_9411 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9422 - OBJ
      ?auto_9424 - OBJ
      ?auto_9425 - OBJ
      ?auto_9423 - LOCATION
    )
    :vars
    (
      ?auto_9428 - LOCATION
      ?auto_9427 - CITY
      ?auto_9426 - LOCATION
      ?auto_9429 - TRUCK
      ?auto_9430 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9424 ?auto_9422 ) ( GREATER-THAN ?auto_9425 ?auto_9422 ) ( GREATER-THAN ?auto_9425 ?auto_9424 ) ( IN-CITY ?auto_9428 ?auto_9427 ) ( IN-CITY ?auto_9423 ?auto_9427 ) ( not ( = ?auto_9423 ?auto_9428 ) ) ( OBJ-AT ?auto_9425 ?auto_9428 ) ( not ( = ?auto_9422 ?auto_9424 ) ) ( not ( = ?auto_9422 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( IN-CITY ?auto_9426 ?auto_9427 ) ( not ( = ?auto_9423 ?auto_9426 ) ) ( not ( = ?auto_9428 ?auto_9426 ) ) ( OBJ-AT ?auto_9424 ?auto_9426 ) ( IN-TRUCK ?auto_9422 ?auto_9429 ) ( TRUCK-AT ?auto_9429 ?auto_9430 ) ( IN-CITY ?auto_9430 ?auto_9427 ) ( not ( = ?auto_9423 ?auto_9430 ) ) ( not ( = ?auto_9428 ?auto_9430 ) ) ( not ( = ?auto_9426 ?auto_9430 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9429 ?auto_9430 ?auto_9423 ?auto_9427 )
      ( DELIVER-3PKG ?auto_9422 ?auto_9424 ?auto_9425 ?auto_9423 )
      ( DELIVER-3PKG-VERIFY ?auto_9422 ?auto_9424 ?auto_9425 ?auto_9423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9435 - OBJ
      ?auto_9437 - OBJ
      ?auto_9438 - OBJ
      ?auto_9436 - LOCATION
    )
    :vars
    (
      ?auto_9441 - LOCATION
      ?auto_9442 - CITY
      ?auto_9439 - LOCATION
      ?auto_9440 - TRUCK
      ?auto_9443 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9437 ?auto_9435 ) ( GREATER-THAN ?auto_9438 ?auto_9435 ) ( GREATER-THAN ?auto_9438 ?auto_9437 ) ( IN-CITY ?auto_9441 ?auto_9442 ) ( IN-CITY ?auto_9436 ?auto_9442 ) ( not ( = ?auto_9436 ?auto_9441 ) ) ( OBJ-AT ?auto_9438 ?auto_9441 ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( not ( = ?auto_9435 ?auto_9438 ) ) ( not ( = ?auto_9437 ?auto_9438 ) ) ( IN-CITY ?auto_9439 ?auto_9442 ) ( not ( = ?auto_9436 ?auto_9439 ) ) ( not ( = ?auto_9441 ?auto_9439 ) ) ( OBJ-AT ?auto_9437 ?auto_9439 ) ( TRUCK-AT ?auto_9440 ?auto_9443 ) ( IN-CITY ?auto_9443 ?auto_9442 ) ( not ( = ?auto_9436 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9439 ?auto_9443 ) ) ( OBJ-AT ?auto_9435 ?auto_9443 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9435 ?auto_9440 ?auto_9443 )
      ( DELIVER-3PKG ?auto_9435 ?auto_9437 ?auto_9438 ?auto_9436 )
      ( DELIVER-3PKG-VERIFY ?auto_9435 ?auto_9437 ?auto_9438 ?auto_9436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9448 - OBJ
      ?auto_9450 - OBJ
      ?auto_9451 - OBJ
      ?auto_9449 - LOCATION
    )
    :vars
    (
      ?auto_9454 - LOCATION
      ?auto_9455 - CITY
      ?auto_9452 - LOCATION
      ?auto_9453 - LOCATION
      ?auto_9456 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9450 ?auto_9448 ) ( GREATER-THAN ?auto_9451 ?auto_9448 ) ( GREATER-THAN ?auto_9451 ?auto_9450 ) ( IN-CITY ?auto_9454 ?auto_9455 ) ( IN-CITY ?auto_9449 ?auto_9455 ) ( not ( = ?auto_9449 ?auto_9454 ) ) ( OBJ-AT ?auto_9451 ?auto_9454 ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( not ( = ?auto_9448 ?auto_9451 ) ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( IN-CITY ?auto_9452 ?auto_9455 ) ( not ( = ?auto_9449 ?auto_9452 ) ) ( not ( = ?auto_9454 ?auto_9452 ) ) ( OBJ-AT ?auto_9450 ?auto_9452 ) ( IN-CITY ?auto_9453 ?auto_9455 ) ( not ( = ?auto_9449 ?auto_9453 ) ) ( not ( = ?auto_9454 ?auto_9453 ) ) ( not ( = ?auto_9452 ?auto_9453 ) ) ( OBJ-AT ?auto_9448 ?auto_9453 ) ( TRUCK-AT ?auto_9456 ?auto_9449 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9456 ?auto_9449 ?auto_9453 ?auto_9455 )
      ( DELIVER-3PKG ?auto_9448 ?auto_9450 ?auto_9451 ?auto_9449 )
      ( DELIVER-3PKG-VERIFY ?auto_9448 ?auto_9450 ?auto_9451 ?auto_9449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9488 - OBJ
      ?auto_9490 - OBJ
      ?auto_9491 - OBJ
      ?auto_9492 - OBJ
      ?auto_9489 - LOCATION
    )
    :vars
    (
      ?auto_9493 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9490 ?auto_9488 ) ( GREATER-THAN ?auto_9491 ?auto_9488 ) ( GREATER-THAN ?auto_9491 ?auto_9490 ) ( GREATER-THAN ?auto_9492 ?auto_9488 ) ( GREATER-THAN ?auto_9492 ?auto_9490 ) ( GREATER-THAN ?auto_9492 ?auto_9491 ) ( TRUCK-AT ?auto_9493 ?auto_9489 ) ( IN-TRUCK ?auto_9492 ?auto_9493 ) ( OBJ-AT ?auto_9488 ?auto_9489 ) ( OBJ-AT ?auto_9490 ?auto_9489 ) ( OBJ-AT ?auto_9491 ?auto_9489 ) ( not ( = ?auto_9488 ?auto_9490 ) ) ( not ( = ?auto_9488 ?auto_9491 ) ) ( not ( = ?auto_9488 ?auto_9492 ) ) ( not ( = ?auto_9490 ?auto_9491 ) ) ( not ( = ?auto_9490 ?auto_9492 ) ) ( not ( = ?auto_9491 ?auto_9492 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9492 ?auto_9489 )
      ( DELIVER-4PKG-VERIFY ?auto_9488 ?auto_9490 ?auto_9491 ?auto_9492 ?auto_9489 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9499 - OBJ
      ?auto_9501 - OBJ
      ?auto_9502 - OBJ
      ?auto_9503 - OBJ
      ?auto_9500 - LOCATION
    )
    :vars
    (
      ?auto_9505 - TRUCK
      ?auto_9504 - LOCATION
      ?auto_9506 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9501 ?auto_9499 ) ( GREATER-THAN ?auto_9502 ?auto_9499 ) ( GREATER-THAN ?auto_9502 ?auto_9501 ) ( GREATER-THAN ?auto_9503 ?auto_9499 ) ( GREATER-THAN ?auto_9503 ?auto_9501 ) ( GREATER-THAN ?auto_9503 ?auto_9502 ) ( IN-TRUCK ?auto_9503 ?auto_9505 ) ( TRUCK-AT ?auto_9505 ?auto_9504 ) ( IN-CITY ?auto_9504 ?auto_9506 ) ( IN-CITY ?auto_9500 ?auto_9506 ) ( not ( = ?auto_9500 ?auto_9504 ) ) ( OBJ-AT ?auto_9499 ?auto_9500 ) ( OBJ-AT ?auto_9501 ?auto_9500 ) ( OBJ-AT ?auto_9502 ?auto_9500 ) ( not ( = ?auto_9499 ?auto_9501 ) ) ( not ( = ?auto_9499 ?auto_9502 ) ) ( not ( = ?auto_9499 ?auto_9503 ) ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( not ( = ?auto_9501 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9503 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9503 ?auto_9500 )
      ( DELIVER-4PKG-VERIFY ?auto_9499 ?auto_9501 ?auto_9502 ?auto_9503 ?auto_9500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9512 - OBJ
      ?auto_9514 - OBJ
      ?auto_9515 - OBJ
      ?auto_9516 - OBJ
      ?auto_9513 - LOCATION
    )
    :vars
    (
      ?auto_9519 - TRUCK
      ?auto_9517 - LOCATION
      ?auto_9518 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9514 ?auto_9512 ) ( GREATER-THAN ?auto_9515 ?auto_9512 ) ( GREATER-THAN ?auto_9515 ?auto_9514 ) ( GREATER-THAN ?auto_9516 ?auto_9512 ) ( GREATER-THAN ?auto_9516 ?auto_9514 ) ( GREATER-THAN ?auto_9516 ?auto_9515 ) ( TRUCK-AT ?auto_9519 ?auto_9517 ) ( IN-CITY ?auto_9517 ?auto_9518 ) ( IN-CITY ?auto_9513 ?auto_9518 ) ( not ( = ?auto_9513 ?auto_9517 ) ) ( OBJ-AT ?auto_9516 ?auto_9517 ) ( OBJ-AT ?auto_9512 ?auto_9513 ) ( OBJ-AT ?auto_9514 ?auto_9513 ) ( OBJ-AT ?auto_9515 ?auto_9513 ) ( not ( = ?auto_9512 ?auto_9514 ) ) ( not ( = ?auto_9512 ?auto_9515 ) ) ( not ( = ?auto_9512 ?auto_9516 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( not ( = ?auto_9514 ?auto_9516 ) ) ( not ( = ?auto_9515 ?auto_9516 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9516 ?auto_9513 )
      ( DELIVER-4PKG-VERIFY ?auto_9512 ?auto_9514 ?auto_9515 ?auto_9516 ?auto_9513 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9525 - OBJ
      ?auto_9527 - OBJ
      ?auto_9528 - OBJ
      ?auto_9529 - OBJ
      ?auto_9526 - LOCATION
    )
    :vars
    (
      ?auto_9531 - LOCATION
      ?auto_9530 - CITY
      ?auto_9532 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9527 ?auto_9525 ) ( GREATER-THAN ?auto_9528 ?auto_9525 ) ( GREATER-THAN ?auto_9528 ?auto_9527 ) ( GREATER-THAN ?auto_9529 ?auto_9525 ) ( GREATER-THAN ?auto_9529 ?auto_9527 ) ( GREATER-THAN ?auto_9529 ?auto_9528 ) ( IN-CITY ?auto_9531 ?auto_9530 ) ( IN-CITY ?auto_9526 ?auto_9530 ) ( not ( = ?auto_9526 ?auto_9531 ) ) ( OBJ-AT ?auto_9529 ?auto_9531 ) ( TRUCK-AT ?auto_9532 ?auto_9526 ) ( OBJ-AT ?auto_9525 ?auto_9526 ) ( OBJ-AT ?auto_9527 ?auto_9526 ) ( OBJ-AT ?auto_9528 ?auto_9526 ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( not ( = ?auto_9525 ?auto_9528 ) ) ( not ( = ?auto_9525 ?auto_9529 ) ) ( not ( = ?auto_9527 ?auto_9528 ) ) ( not ( = ?auto_9527 ?auto_9529 ) ) ( not ( = ?auto_9528 ?auto_9529 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9529 ?auto_9526 )
      ( DELIVER-4PKG-VERIFY ?auto_9525 ?auto_9527 ?auto_9528 ?auto_9529 ?auto_9526 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9538 - OBJ
      ?auto_9540 - OBJ
      ?auto_9541 - OBJ
      ?auto_9542 - OBJ
      ?auto_9539 - LOCATION
    )
    :vars
    (
      ?auto_9544 - LOCATION
      ?auto_9543 - CITY
      ?auto_9545 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9540 ?auto_9538 ) ( GREATER-THAN ?auto_9541 ?auto_9538 ) ( GREATER-THAN ?auto_9541 ?auto_9540 ) ( GREATER-THAN ?auto_9542 ?auto_9538 ) ( GREATER-THAN ?auto_9542 ?auto_9540 ) ( GREATER-THAN ?auto_9542 ?auto_9541 ) ( IN-CITY ?auto_9544 ?auto_9543 ) ( IN-CITY ?auto_9539 ?auto_9543 ) ( not ( = ?auto_9539 ?auto_9544 ) ) ( OBJ-AT ?auto_9542 ?auto_9544 ) ( TRUCK-AT ?auto_9545 ?auto_9539 ) ( OBJ-AT ?auto_9538 ?auto_9539 ) ( OBJ-AT ?auto_9540 ?auto_9539 ) ( not ( = ?auto_9538 ?auto_9540 ) ) ( not ( = ?auto_9538 ?auto_9541 ) ) ( not ( = ?auto_9538 ?auto_9542 ) ) ( not ( = ?auto_9540 ?auto_9541 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( not ( = ?auto_9541 ?auto_9542 ) ) ( IN-TRUCK ?auto_9541 ?auto_9545 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9541 ?auto_9539 )
      ( DELIVER-4PKG ?auto_9538 ?auto_9540 ?auto_9541 ?auto_9542 ?auto_9539 )
      ( DELIVER-4PKG-VERIFY ?auto_9538 ?auto_9540 ?auto_9541 ?auto_9542 ?auto_9539 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9551 - OBJ
      ?auto_9553 - OBJ
      ?auto_9554 - OBJ
      ?auto_9555 - OBJ
      ?auto_9552 - LOCATION
    )
    :vars
    (
      ?auto_9557 - LOCATION
      ?auto_9558 - CITY
      ?auto_9556 - TRUCK
      ?auto_9559 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9553 ?auto_9551 ) ( GREATER-THAN ?auto_9554 ?auto_9551 ) ( GREATER-THAN ?auto_9554 ?auto_9553 ) ( GREATER-THAN ?auto_9555 ?auto_9551 ) ( GREATER-THAN ?auto_9555 ?auto_9553 ) ( GREATER-THAN ?auto_9555 ?auto_9554 ) ( IN-CITY ?auto_9557 ?auto_9558 ) ( IN-CITY ?auto_9552 ?auto_9558 ) ( not ( = ?auto_9552 ?auto_9557 ) ) ( OBJ-AT ?auto_9555 ?auto_9557 ) ( OBJ-AT ?auto_9551 ?auto_9552 ) ( OBJ-AT ?auto_9553 ?auto_9552 ) ( not ( = ?auto_9551 ?auto_9553 ) ) ( not ( = ?auto_9551 ?auto_9554 ) ) ( not ( = ?auto_9551 ?auto_9555 ) ) ( not ( = ?auto_9553 ?auto_9554 ) ) ( not ( = ?auto_9553 ?auto_9555 ) ) ( not ( = ?auto_9554 ?auto_9555 ) ) ( IN-TRUCK ?auto_9554 ?auto_9556 ) ( TRUCK-AT ?auto_9556 ?auto_9559 ) ( IN-CITY ?auto_9559 ?auto_9558 ) ( not ( = ?auto_9552 ?auto_9559 ) ) ( not ( = ?auto_9557 ?auto_9559 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9556 ?auto_9559 ?auto_9552 ?auto_9558 )
      ( DELIVER-4PKG ?auto_9551 ?auto_9553 ?auto_9554 ?auto_9555 ?auto_9552 )
      ( DELIVER-4PKG-VERIFY ?auto_9551 ?auto_9553 ?auto_9554 ?auto_9555 ?auto_9552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9565 - OBJ
      ?auto_9567 - OBJ
      ?auto_9568 - OBJ
      ?auto_9569 - OBJ
      ?auto_9566 - LOCATION
    )
    :vars
    (
      ?auto_9571 - LOCATION
      ?auto_9573 - CITY
      ?auto_9572 - TRUCK
      ?auto_9570 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9567 ?auto_9565 ) ( GREATER-THAN ?auto_9568 ?auto_9565 ) ( GREATER-THAN ?auto_9568 ?auto_9567 ) ( GREATER-THAN ?auto_9569 ?auto_9565 ) ( GREATER-THAN ?auto_9569 ?auto_9567 ) ( GREATER-THAN ?auto_9569 ?auto_9568 ) ( IN-CITY ?auto_9571 ?auto_9573 ) ( IN-CITY ?auto_9566 ?auto_9573 ) ( not ( = ?auto_9566 ?auto_9571 ) ) ( OBJ-AT ?auto_9569 ?auto_9571 ) ( OBJ-AT ?auto_9565 ?auto_9566 ) ( OBJ-AT ?auto_9567 ?auto_9566 ) ( not ( = ?auto_9565 ?auto_9567 ) ) ( not ( = ?auto_9565 ?auto_9568 ) ) ( not ( = ?auto_9565 ?auto_9569 ) ) ( not ( = ?auto_9567 ?auto_9568 ) ) ( not ( = ?auto_9567 ?auto_9569 ) ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( TRUCK-AT ?auto_9572 ?auto_9570 ) ( IN-CITY ?auto_9570 ?auto_9573 ) ( not ( = ?auto_9566 ?auto_9570 ) ) ( not ( = ?auto_9571 ?auto_9570 ) ) ( OBJ-AT ?auto_9568 ?auto_9570 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9568 ?auto_9572 ?auto_9570 )
      ( DELIVER-4PKG ?auto_9565 ?auto_9567 ?auto_9568 ?auto_9569 ?auto_9566 )
      ( DELIVER-4PKG-VERIFY ?auto_9565 ?auto_9567 ?auto_9568 ?auto_9569 ?auto_9566 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9579 - OBJ
      ?auto_9581 - OBJ
      ?auto_9582 - OBJ
      ?auto_9583 - OBJ
      ?auto_9580 - LOCATION
    )
    :vars
    (
      ?auto_9587 - LOCATION
      ?auto_9585 - CITY
      ?auto_9584 - LOCATION
      ?auto_9586 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9581 ?auto_9579 ) ( GREATER-THAN ?auto_9582 ?auto_9579 ) ( GREATER-THAN ?auto_9582 ?auto_9581 ) ( GREATER-THAN ?auto_9583 ?auto_9579 ) ( GREATER-THAN ?auto_9583 ?auto_9581 ) ( GREATER-THAN ?auto_9583 ?auto_9582 ) ( IN-CITY ?auto_9587 ?auto_9585 ) ( IN-CITY ?auto_9580 ?auto_9585 ) ( not ( = ?auto_9580 ?auto_9587 ) ) ( OBJ-AT ?auto_9583 ?auto_9587 ) ( OBJ-AT ?auto_9579 ?auto_9580 ) ( OBJ-AT ?auto_9581 ?auto_9580 ) ( not ( = ?auto_9579 ?auto_9581 ) ) ( not ( = ?auto_9579 ?auto_9582 ) ) ( not ( = ?auto_9579 ?auto_9583 ) ) ( not ( = ?auto_9581 ?auto_9582 ) ) ( not ( = ?auto_9581 ?auto_9583 ) ) ( not ( = ?auto_9582 ?auto_9583 ) ) ( IN-CITY ?auto_9584 ?auto_9585 ) ( not ( = ?auto_9580 ?auto_9584 ) ) ( not ( = ?auto_9587 ?auto_9584 ) ) ( OBJ-AT ?auto_9582 ?auto_9584 ) ( TRUCK-AT ?auto_9586 ?auto_9580 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9586 ?auto_9580 ?auto_9584 ?auto_9585 )
      ( DELIVER-4PKG ?auto_9579 ?auto_9581 ?auto_9582 ?auto_9583 ?auto_9580 )
      ( DELIVER-4PKG-VERIFY ?auto_9579 ?auto_9581 ?auto_9582 ?auto_9583 ?auto_9580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9593 - OBJ
      ?auto_9595 - OBJ
      ?auto_9596 - OBJ
      ?auto_9597 - OBJ
      ?auto_9594 - LOCATION
    )
    :vars
    (
      ?auto_9601 - LOCATION
      ?auto_9598 - CITY
      ?auto_9600 - LOCATION
      ?auto_9599 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9595 ?auto_9593 ) ( GREATER-THAN ?auto_9596 ?auto_9593 ) ( GREATER-THAN ?auto_9596 ?auto_9595 ) ( GREATER-THAN ?auto_9597 ?auto_9593 ) ( GREATER-THAN ?auto_9597 ?auto_9595 ) ( GREATER-THAN ?auto_9597 ?auto_9596 ) ( IN-CITY ?auto_9601 ?auto_9598 ) ( IN-CITY ?auto_9594 ?auto_9598 ) ( not ( = ?auto_9594 ?auto_9601 ) ) ( OBJ-AT ?auto_9597 ?auto_9601 ) ( OBJ-AT ?auto_9593 ?auto_9594 ) ( not ( = ?auto_9593 ?auto_9595 ) ) ( not ( = ?auto_9593 ?auto_9596 ) ) ( not ( = ?auto_9593 ?auto_9597 ) ) ( not ( = ?auto_9595 ?auto_9596 ) ) ( not ( = ?auto_9595 ?auto_9597 ) ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( IN-CITY ?auto_9600 ?auto_9598 ) ( not ( = ?auto_9594 ?auto_9600 ) ) ( not ( = ?auto_9601 ?auto_9600 ) ) ( OBJ-AT ?auto_9596 ?auto_9600 ) ( TRUCK-AT ?auto_9599 ?auto_9594 ) ( IN-TRUCK ?auto_9595 ?auto_9599 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9595 ?auto_9594 )
      ( DELIVER-4PKG ?auto_9593 ?auto_9595 ?auto_9596 ?auto_9597 ?auto_9594 )
      ( DELIVER-4PKG-VERIFY ?auto_9593 ?auto_9595 ?auto_9596 ?auto_9597 ?auto_9594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9607 - OBJ
      ?auto_9609 - OBJ
      ?auto_9610 - OBJ
      ?auto_9611 - OBJ
      ?auto_9608 - LOCATION
    )
    :vars
    (
      ?auto_9613 - LOCATION
      ?auto_9614 - CITY
      ?auto_9612 - LOCATION
      ?auto_9615 - TRUCK
      ?auto_9616 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9609 ?auto_9607 ) ( GREATER-THAN ?auto_9610 ?auto_9607 ) ( GREATER-THAN ?auto_9610 ?auto_9609 ) ( GREATER-THAN ?auto_9611 ?auto_9607 ) ( GREATER-THAN ?auto_9611 ?auto_9609 ) ( GREATER-THAN ?auto_9611 ?auto_9610 ) ( IN-CITY ?auto_9613 ?auto_9614 ) ( IN-CITY ?auto_9608 ?auto_9614 ) ( not ( = ?auto_9608 ?auto_9613 ) ) ( OBJ-AT ?auto_9611 ?auto_9613 ) ( OBJ-AT ?auto_9607 ?auto_9608 ) ( not ( = ?auto_9607 ?auto_9609 ) ) ( not ( = ?auto_9607 ?auto_9610 ) ) ( not ( = ?auto_9607 ?auto_9611 ) ) ( not ( = ?auto_9609 ?auto_9610 ) ) ( not ( = ?auto_9609 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( IN-CITY ?auto_9612 ?auto_9614 ) ( not ( = ?auto_9608 ?auto_9612 ) ) ( not ( = ?auto_9613 ?auto_9612 ) ) ( OBJ-AT ?auto_9610 ?auto_9612 ) ( IN-TRUCK ?auto_9609 ?auto_9615 ) ( TRUCK-AT ?auto_9615 ?auto_9616 ) ( IN-CITY ?auto_9616 ?auto_9614 ) ( not ( = ?auto_9608 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9615 ?auto_9616 ?auto_9608 ?auto_9614 )
      ( DELIVER-4PKG ?auto_9607 ?auto_9609 ?auto_9610 ?auto_9611 ?auto_9608 )
      ( DELIVER-4PKG-VERIFY ?auto_9607 ?auto_9609 ?auto_9610 ?auto_9611 ?auto_9608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9622 - OBJ
      ?auto_9624 - OBJ
      ?auto_9625 - OBJ
      ?auto_9626 - OBJ
      ?auto_9623 - LOCATION
    )
    :vars
    (
      ?auto_9628 - LOCATION
      ?auto_9629 - CITY
      ?auto_9631 - LOCATION
      ?auto_9627 - TRUCK
      ?auto_9630 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9624 ?auto_9622 ) ( GREATER-THAN ?auto_9625 ?auto_9622 ) ( GREATER-THAN ?auto_9625 ?auto_9624 ) ( GREATER-THAN ?auto_9626 ?auto_9622 ) ( GREATER-THAN ?auto_9626 ?auto_9624 ) ( GREATER-THAN ?auto_9626 ?auto_9625 ) ( IN-CITY ?auto_9628 ?auto_9629 ) ( IN-CITY ?auto_9623 ?auto_9629 ) ( not ( = ?auto_9623 ?auto_9628 ) ) ( OBJ-AT ?auto_9626 ?auto_9628 ) ( OBJ-AT ?auto_9622 ?auto_9623 ) ( not ( = ?auto_9622 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9625 ) ) ( not ( = ?auto_9622 ?auto_9626 ) ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9626 ) ) ( not ( = ?auto_9625 ?auto_9626 ) ) ( IN-CITY ?auto_9631 ?auto_9629 ) ( not ( = ?auto_9623 ?auto_9631 ) ) ( not ( = ?auto_9628 ?auto_9631 ) ) ( OBJ-AT ?auto_9625 ?auto_9631 ) ( TRUCK-AT ?auto_9627 ?auto_9630 ) ( IN-CITY ?auto_9630 ?auto_9629 ) ( not ( = ?auto_9623 ?auto_9630 ) ) ( not ( = ?auto_9628 ?auto_9630 ) ) ( not ( = ?auto_9631 ?auto_9630 ) ) ( OBJ-AT ?auto_9624 ?auto_9630 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9624 ?auto_9627 ?auto_9630 )
      ( DELIVER-4PKG ?auto_9622 ?auto_9624 ?auto_9625 ?auto_9626 ?auto_9623 )
      ( DELIVER-4PKG-VERIFY ?auto_9622 ?auto_9624 ?auto_9625 ?auto_9626 ?auto_9623 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9637 - OBJ
      ?auto_9639 - OBJ
      ?auto_9640 - OBJ
      ?auto_9641 - OBJ
      ?auto_9638 - LOCATION
    )
    :vars
    (
      ?auto_9643 - LOCATION
      ?auto_9645 - CITY
      ?auto_9644 - LOCATION
      ?auto_9642 - LOCATION
      ?auto_9646 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9639 ?auto_9637 ) ( GREATER-THAN ?auto_9640 ?auto_9637 ) ( GREATER-THAN ?auto_9640 ?auto_9639 ) ( GREATER-THAN ?auto_9641 ?auto_9637 ) ( GREATER-THAN ?auto_9641 ?auto_9639 ) ( GREATER-THAN ?auto_9641 ?auto_9640 ) ( IN-CITY ?auto_9643 ?auto_9645 ) ( IN-CITY ?auto_9638 ?auto_9645 ) ( not ( = ?auto_9638 ?auto_9643 ) ) ( OBJ-AT ?auto_9641 ?auto_9643 ) ( OBJ-AT ?auto_9637 ?auto_9638 ) ( not ( = ?auto_9637 ?auto_9639 ) ) ( not ( = ?auto_9637 ?auto_9640 ) ) ( not ( = ?auto_9637 ?auto_9641 ) ) ( not ( = ?auto_9639 ?auto_9640 ) ) ( not ( = ?auto_9639 ?auto_9641 ) ) ( not ( = ?auto_9640 ?auto_9641 ) ) ( IN-CITY ?auto_9644 ?auto_9645 ) ( not ( = ?auto_9638 ?auto_9644 ) ) ( not ( = ?auto_9643 ?auto_9644 ) ) ( OBJ-AT ?auto_9640 ?auto_9644 ) ( IN-CITY ?auto_9642 ?auto_9645 ) ( not ( = ?auto_9638 ?auto_9642 ) ) ( not ( = ?auto_9643 ?auto_9642 ) ) ( not ( = ?auto_9644 ?auto_9642 ) ) ( OBJ-AT ?auto_9639 ?auto_9642 ) ( TRUCK-AT ?auto_9646 ?auto_9638 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9646 ?auto_9638 ?auto_9642 ?auto_9645 )
      ( DELIVER-4PKG ?auto_9637 ?auto_9639 ?auto_9640 ?auto_9641 ?auto_9638 )
      ( DELIVER-4PKG-VERIFY ?auto_9637 ?auto_9639 ?auto_9640 ?auto_9641 ?auto_9638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9652 - OBJ
      ?auto_9654 - OBJ
      ?auto_9655 - OBJ
      ?auto_9656 - OBJ
      ?auto_9653 - LOCATION
    )
    :vars
    (
      ?auto_9658 - LOCATION
      ?auto_9661 - CITY
      ?auto_9659 - LOCATION
      ?auto_9657 - LOCATION
      ?auto_9660 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9654 ?auto_9652 ) ( GREATER-THAN ?auto_9655 ?auto_9652 ) ( GREATER-THAN ?auto_9655 ?auto_9654 ) ( GREATER-THAN ?auto_9656 ?auto_9652 ) ( GREATER-THAN ?auto_9656 ?auto_9654 ) ( GREATER-THAN ?auto_9656 ?auto_9655 ) ( IN-CITY ?auto_9658 ?auto_9661 ) ( IN-CITY ?auto_9653 ?auto_9661 ) ( not ( = ?auto_9653 ?auto_9658 ) ) ( OBJ-AT ?auto_9656 ?auto_9658 ) ( not ( = ?auto_9652 ?auto_9654 ) ) ( not ( = ?auto_9652 ?auto_9655 ) ) ( not ( = ?auto_9652 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( IN-CITY ?auto_9659 ?auto_9661 ) ( not ( = ?auto_9653 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( OBJ-AT ?auto_9655 ?auto_9659 ) ( IN-CITY ?auto_9657 ?auto_9661 ) ( not ( = ?auto_9653 ?auto_9657 ) ) ( not ( = ?auto_9658 ?auto_9657 ) ) ( not ( = ?auto_9659 ?auto_9657 ) ) ( OBJ-AT ?auto_9654 ?auto_9657 ) ( TRUCK-AT ?auto_9660 ?auto_9653 ) ( IN-TRUCK ?auto_9652 ?auto_9660 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9652 ?auto_9653 )
      ( DELIVER-4PKG ?auto_9652 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9653 )
      ( DELIVER-4PKG-VERIFY ?auto_9652 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9653 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9667 - OBJ
      ?auto_9669 - OBJ
      ?auto_9670 - OBJ
      ?auto_9671 - OBJ
      ?auto_9668 - LOCATION
    )
    :vars
    (
      ?auto_9673 - LOCATION
      ?auto_9675 - CITY
      ?auto_9672 - LOCATION
      ?auto_9676 - LOCATION
      ?auto_9674 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9669 ?auto_9667 ) ( GREATER-THAN ?auto_9670 ?auto_9667 ) ( GREATER-THAN ?auto_9670 ?auto_9669 ) ( GREATER-THAN ?auto_9671 ?auto_9667 ) ( GREATER-THAN ?auto_9671 ?auto_9669 ) ( GREATER-THAN ?auto_9671 ?auto_9670 ) ( IN-CITY ?auto_9673 ?auto_9675 ) ( IN-CITY ?auto_9668 ?auto_9675 ) ( not ( = ?auto_9668 ?auto_9673 ) ) ( OBJ-AT ?auto_9671 ?auto_9673 ) ( not ( = ?auto_9667 ?auto_9669 ) ) ( not ( = ?auto_9667 ?auto_9670 ) ) ( not ( = ?auto_9667 ?auto_9671 ) ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9669 ?auto_9671 ) ) ( not ( = ?auto_9670 ?auto_9671 ) ) ( IN-CITY ?auto_9672 ?auto_9675 ) ( not ( = ?auto_9668 ?auto_9672 ) ) ( not ( = ?auto_9673 ?auto_9672 ) ) ( OBJ-AT ?auto_9670 ?auto_9672 ) ( IN-CITY ?auto_9676 ?auto_9675 ) ( not ( = ?auto_9668 ?auto_9676 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) ( not ( = ?auto_9672 ?auto_9676 ) ) ( OBJ-AT ?auto_9669 ?auto_9676 ) ( IN-TRUCK ?auto_9667 ?auto_9674 ) ( TRUCK-AT ?auto_9674 ?auto_9673 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9674 ?auto_9673 ?auto_9668 ?auto_9675 )
      ( DELIVER-4PKG ?auto_9667 ?auto_9669 ?auto_9670 ?auto_9671 ?auto_9668 )
      ( DELIVER-4PKG-VERIFY ?auto_9667 ?auto_9669 ?auto_9670 ?auto_9671 ?auto_9668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9682 - OBJ
      ?auto_9684 - OBJ
      ?auto_9685 - OBJ
      ?auto_9686 - OBJ
      ?auto_9683 - LOCATION
    )
    :vars
    (
      ?auto_9690 - LOCATION
      ?auto_9691 - CITY
      ?auto_9689 - LOCATION
      ?auto_9688 - LOCATION
      ?auto_9687 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9684 ?auto_9682 ) ( GREATER-THAN ?auto_9685 ?auto_9682 ) ( GREATER-THAN ?auto_9685 ?auto_9684 ) ( GREATER-THAN ?auto_9686 ?auto_9682 ) ( GREATER-THAN ?auto_9686 ?auto_9684 ) ( GREATER-THAN ?auto_9686 ?auto_9685 ) ( IN-CITY ?auto_9690 ?auto_9691 ) ( IN-CITY ?auto_9683 ?auto_9691 ) ( not ( = ?auto_9683 ?auto_9690 ) ) ( OBJ-AT ?auto_9686 ?auto_9690 ) ( not ( = ?auto_9682 ?auto_9684 ) ) ( not ( = ?auto_9682 ?auto_9685 ) ) ( not ( = ?auto_9682 ?auto_9686 ) ) ( not ( = ?auto_9684 ?auto_9685 ) ) ( not ( = ?auto_9684 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9686 ) ) ( IN-CITY ?auto_9689 ?auto_9691 ) ( not ( = ?auto_9683 ?auto_9689 ) ) ( not ( = ?auto_9690 ?auto_9689 ) ) ( OBJ-AT ?auto_9685 ?auto_9689 ) ( IN-CITY ?auto_9688 ?auto_9691 ) ( not ( = ?auto_9683 ?auto_9688 ) ) ( not ( = ?auto_9690 ?auto_9688 ) ) ( not ( = ?auto_9689 ?auto_9688 ) ) ( OBJ-AT ?auto_9684 ?auto_9688 ) ( TRUCK-AT ?auto_9687 ?auto_9690 ) ( OBJ-AT ?auto_9682 ?auto_9690 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9682 ?auto_9687 ?auto_9690 )
      ( DELIVER-4PKG ?auto_9682 ?auto_9684 ?auto_9685 ?auto_9686 ?auto_9683 )
      ( DELIVER-4PKG-VERIFY ?auto_9682 ?auto_9684 ?auto_9685 ?auto_9686 ?auto_9683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9697 - OBJ
      ?auto_9699 - OBJ
      ?auto_9700 - OBJ
      ?auto_9701 - OBJ
      ?auto_9698 - LOCATION
    )
    :vars
    (
      ?auto_9705 - LOCATION
      ?auto_9704 - CITY
      ?auto_9706 - LOCATION
      ?auto_9702 - LOCATION
      ?auto_9703 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9699 ?auto_9697 ) ( GREATER-THAN ?auto_9700 ?auto_9697 ) ( GREATER-THAN ?auto_9700 ?auto_9699 ) ( GREATER-THAN ?auto_9701 ?auto_9697 ) ( GREATER-THAN ?auto_9701 ?auto_9699 ) ( GREATER-THAN ?auto_9701 ?auto_9700 ) ( IN-CITY ?auto_9705 ?auto_9704 ) ( IN-CITY ?auto_9698 ?auto_9704 ) ( not ( = ?auto_9698 ?auto_9705 ) ) ( OBJ-AT ?auto_9701 ?auto_9705 ) ( not ( = ?auto_9697 ?auto_9699 ) ) ( not ( = ?auto_9697 ?auto_9700 ) ) ( not ( = ?auto_9697 ?auto_9701 ) ) ( not ( = ?auto_9699 ?auto_9700 ) ) ( not ( = ?auto_9699 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( IN-CITY ?auto_9706 ?auto_9704 ) ( not ( = ?auto_9698 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( OBJ-AT ?auto_9700 ?auto_9706 ) ( IN-CITY ?auto_9702 ?auto_9704 ) ( not ( = ?auto_9698 ?auto_9702 ) ) ( not ( = ?auto_9705 ?auto_9702 ) ) ( not ( = ?auto_9706 ?auto_9702 ) ) ( OBJ-AT ?auto_9699 ?auto_9702 ) ( OBJ-AT ?auto_9697 ?auto_9705 ) ( TRUCK-AT ?auto_9703 ?auto_9698 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9703 ?auto_9698 ?auto_9705 ?auto_9704 )
      ( DELIVER-4PKG ?auto_9697 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9698 )
      ( DELIVER-4PKG-VERIFY ?auto_9697 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9698 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9739 - OBJ
      ?auto_9741 - OBJ
      ?auto_9742 - OBJ
      ?auto_9743 - OBJ
      ?auto_9744 - OBJ
      ?auto_9740 - LOCATION
    )
    :vars
    (
      ?auto_9745 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9741 ?auto_9739 ) ( GREATER-THAN ?auto_9742 ?auto_9739 ) ( GREATER-THAN ?auto_9742 ?auto_9741 ) ( GREATER-THAN ?auto_9743 ?auto_9739 ) ( GREATER-THAN ?auto_9743 ?auto_9741 ) ( GREATER-THAN ?auto_9743 ?auto_9742 ) ( GREATER-THAN ?auto_9744 ?auto_9739 ) ( GREATER-THAN ?auto_9744 ?auto_9741 ) ( GREATER-THAN ?auto_9744 ?auto_9742 ) ( GREATER-THAN ?auto_9744 ?auto_9743 ) ( TRUCK-AT ?auto_9745 ?auto_9740 ) ( IN-TRUCK ?auto_9744 ?auto_9745 ) ( OBJ-AT ?auto_9739 ?auto_9740 ) ( OBJ-AT ?auto_9741 ?auto_9740 ) ( OBJ-AT ?auto_9742 ?auto_9740 ) ( OBJ-AT ?auto_9743 ?auto_9740 ) ( not ( = ?auto_9739 ?auto_9741 ) ) ( not ( = ?auto_9739 ?auto_9742 ) ) ( not ( = ?auto_9739 ?auto_9743 ) ) ( not ( = ?auto_9739 ?auto_9744 ) ) ( not ( = ?auto_9741 ?auto_9742 ) ) ( not ( = ?auto_9741 ?auto_9743 ) ) ( not ( = ?auto_9741 ?auto_9744 ) ) ( not ( = ?auto_9742 ?auto_9743 ) ) ( not ( = ?auto_9742 ?auto_9744 ) ) ( not ( = ?auto_9743 ?auto_9744 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9744 ?auto_9740 )
      ( DELIVER-5PKG-VERIFY ?auto_9739 ?auto_9741 ?auto_9742 ?auto_9743 ?auto_9744 ?auto_9740 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9752 - OBJ
      ?auto_9754 - OBJ
      ?auto_9755 - OBJ
      ?auto_9756 - OBJ
      ?auto_9757 - OBJ
      ?auto_9753 - LOCATION
    )
    :vars
    (
      ?auto_9760 - TRUCK
      ?auto_9759 - LOCATION
      ?auto_9758 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9754 ?auto_9752 ) ( GREATER-THAN ?auto_9755 ?auto_9752 ) ( GREATER-THAN ?auto_9755 ?auto_9754 ) ( GREATER-THAN ?auto_9756 ?auto_9752 ) ( GREATER-THAN ?auto_9756 ?auto_9754 ) ( GREATER-THAN ?auto_9756 ?auto_9755 ) ( GREATER-THAN ?auto_9757 ?auto_9752 ) ( GREATER-THAN ?auto_9757 ?auto_9754 ) ( GREATER-THAN ?auto_9757 ?auto_9755 ) ( GREATER-THAN ?auto_9757 ?auto_9756 ) ( IN-TRUCK ?auto_9757 ?auto_9760 ) ( TRUCK-AT ?auto_9760 ?auto_9759 ) ( IN-CITY ?auto_9759 ?auto_9758 ) ( IN-CITY ?auto_9753 ?auto_9758 ) ( not ( = ?auto_9753 ?auto_9759 ) ) ( OBJ-AT ?auto_9752 ?auto_9753 ) ( OBJ-AT ?auto_9754 ?auto_9753 ) ( OBJ-AT ?auto_9755 ?auto_9753 ) ( OBJ-AT ?auto_9756 ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( not ( = ?auto_9752 ?auto_9756 ) ) ( not ( = ?auto_9752 ?auto_9757 ) ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9755 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9757 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9757 ?auto_9753 )
      ( DELIVER-5PKG-VERIFY ?auto_9752 ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9753 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9767 - OBJ
      ?auto_9769 - OBJ
      ?auto_9770 - OBJ
      ?auto_9771 - OBJ
      ?auto_9772 - OBJ
      ?auto_9768 - LOCATION
    )
    :vars
    (
      ?auto_9775 - TRUCK
      ?auto_9773 - LOCATION
      ?auto_9774 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9769 ?auto_9767 ) ( GREATER-THAN ?auto_9770 ?auto_9767 ) ( GREATER-THAN ?auto_9770 ?auto_9769 ) ( GREATER-THAN ?auto_9771 ?auto_9767 ) ( GREATER-THAN ?auto_9771 ?auto_9769 ) ( GREATER-THAN ?auto_9771 ?auto_9770 ) ( GREATER-THAN ?auto_9772 ?auto_9767 ) ( GREATER-THAN ?auto_9772 ?auto_9769 ) ( GREATER-THAN ?auto_9772 ?auto_9770 ) ( GREATER-THAN ?auto_9772 ?auto_9771 ) ( TRUCK-AT ?auto_9775 ?auto_9773 ) ( IN-CITY ?auto_9773 ?auto_9774 ) ( IN-CITY ?auto_9768 ?auto_9774 ) ( not ( = ?auto_9768 ?auto_9773 ) ) ( OBJ-AT ?auto_9772 ?auto_9773 ) ( OBJ-AT ?auto_9767 ?auto_9768 ) ( OBJ-AT ?auto_9769 ?auto_9768 ) ( OBJ-AT ?auto_9770 ?auto_9768 ) ( OBJ-AT ?auto_9771 ?auto_9768 ) ( not ( = ?auto_9767 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9770 ) ) ( not ( = ?auto_9767 ?auto_9771 ) ) ( not ( = ?auto_9767 ?auto_9772 ) ) ( not ( = ?auto_9769 ?auto_9770 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9769 ?auto_9772 ) ) ( not ( = ?auto_9770 ?auto_9771 ) ) ( not ( = ?auto_9770 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9772 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9772 ?auto_9768 )
      ( DELIVER-5PKG-VERIFY ?auto_9767 ?auto_9769 ?auto_9770 ?auto_9771 ?auto_9772 ?auto_9768 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9782 - OBJ
      ?auto_9784 - OBJ
      ?auto_9785 - OBJ
      ?auto_9786 - OBJ
      ?auto_9787 - OBJ
      ?auto_9783 - LOCATION
    )
    :vars
    (
      ?auto_9790 - LOCATION
      ?auto_9788 - CITY
      ?auto_9789 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9784 ?auto_9782 ) ( GREATER-THAN ?auto_9785 ?auto_9782 ) ( GREATER-THAN ?auto_9785 ?auto_9784 ) ( GREATER-THAN ?auto_9786 ?auto_9782 ) ( GREATER-THAN ?auto_9786 ?auto_9784 ) ( GREATER-THAN ?auto_9786 ?auto_9785 ) ( GREATER-THAN ?auto_9787 ?auto_9782 ) ( GREATER-THAN ?auto_9787 ?auto_9784 ) ( GREATER-THAN ?auto_9787 ?auto_9785 ) ( GREATER-THAN ?auto_9787 ?auto_9786 ) ( IN-CITY ?auto_9790 ?auto_9788 ) ( IN-CITY ?auto_9783 ?auto_9788 ) ( not ( = ?auto_9783 ?auto_9790 ) ) ( OBJ-AT ?auto_9787 ?auto_9790 ) ( TRUCK-AT ?auto_9789 ?auto_9783 ) ( OBJ-AT ?auto_9782 ?auto_9783 ) ( OBJ-AT ?auto_9784 ?auto_9783 ) ( OBJ-AT ?auto_9785 ?auto_9783 ) ( OBJ-AT ?auto_9786 ?auto_9783 ) ( not ( = ?auto_9782 ?auto_9784 ) ) ( not ( = ?auto_9782 ?auto_9785 ) ) ( not ( = ?auto_9782 ?auto_9786 ) ) ( not ( = ?auto_9782 ?auto_9787 ) ) ( not ( = ?auto_9784 ?auto_9785 ) ) ( not ( = ?auto_9784 ?auto_9786 ) ) ( not ( = ?auto_9784 ?auto_9787 ) ) ( not ( = ?auto_9785 ?auto_9786 ) ) ( not ( = ?auto_9785 ?auto_9787 ) ) ( not ( = ?auto_9786 ?auto_9787 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9787 ?auto_9783 )
      ( DELIVER-5PKG-VERIFY ?auto_9782 ?auto_9784 ?auto_9785 ?auto_9786 ?auto_9787 ?auto_9783 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9797 - OBJ
      ?auto_9799 - OBJ
      ?auto_9800 - OBJ
      ?auto_9801 - OBJ
      ?auto_9802 - OBJ
      ?auto_9798 - LOCATION
    )
    :vars
    (
      ?auto_9805 - LOCATION
      ?auto_9804 - CITY
      ?auto_9803 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9799 ?auto_9797 ) ( GREATER-THAN ?auto_9800 ?auto_9797 ) ( GREATER-THAN ?auto_9800 ?auto_9799 ) ( GREATER-THAN ?auto_9801 ?auto_9797 ) ( GREATER-THAN ?auto_9801 ?auto_9799 ) ( GREATER-THAN ?auto_9801 ?auto_9800 ) ( GREATER-THAN ?auto_9802 ?auto_9797 ) ( GREATER-THAN ?auto_9802 ?auto_9799 ) ( GREATER-THAN ?auto_9802 ?auto_9800 ) ( GREATER-THAN ?auto_9802 ?auto_9801 ) ( IN-CITY ?auto_9805 ?auto_9804 ) ( IN-CITY ?auto_9798 ?auto_9804 ) ( not ( = ?auto_9798 ?auto_9805 ) ) ( OBJ-AT ?auto_9802 ?auto_9805 ) ( TRUCK-AT ?auto_9803 ?auto_9798 ) ( OBJ-AT ?auto_9797 ?auto_9798 ) ( OBJ-AT ?auto_9799 ?auto_9798 ) ( OBJ-AT ?auto_9800 ?auto_9798 ) ( not ( = ?auto_9797 ?auto_9799 ) ) ( not ( = ?auto_9797 ?auto_9800 ) ) ( not ( = ?auto_9797 ?auto_9801 ) ) ( not ( = ?auto_9797 ?auto_9802 ) ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9802 ) ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( not ( = ?auto_9800 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( IN-TRUCK ?auto_9801 ?auto_9803 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9801 ?auto_9798 )
      ( DELIVER-5PKG ?auto_9797 ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9798 )
      ( DELIVER-5PKG-VERIFY ?auto_9797 ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9798 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9812 - OBJ
      ?auto_9814 - OBJ
      ?auto_9815 - OBJ
      ?auto_9816 - OBJ
      ?auto_9817 - OBJ
      ?auto_9813 - LOCATION
    )
    :vars
    (
      ?auto_9818 - LOCATION
      ?auto_9820 - CITY
      ?auto_9819 - TRUCK
      ?auto_9821 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9814 ?auto_9812 ) ( GREATER-THAN ?auto_9815 ?auto_9812 ) ( GREATER-THAN ?auto_9815 ?auto_9814 ) ( GREATER-THAN ?auto_9816 ?auto_9812 ) ( GREATER-THAN ?auto_9816 ?auto_9814 ) ( GREATER-THAN ?auto_9816 ?auto_9815 ) ( GREATER-THAN ?auto_9817 ?auto_9812 ) ( GREATER-THAN ?auto_9817 ?auto_9814 ) ( GREATER-THAN ?auto_9817 ?auto_9815 ) ( GREATER-THAN ?auto_9817 ?auto_9816 ) ( IN-CITY ?auto_9818 ?auto_9820 ) ( IN-CITY ?auto_9813 ?auto_9820 ) ( not ( = ?auto_9813 ?auto_9818 ) ) ( OBJ-AT ?auto_9817 ?auto_9818 ) ( OBJ-AT ?auto_9812 ?auto_9813 ) ( OBJ-AT ?auto_9814 ?auto_9813 ) ( OBJ-AT ?auto_9815 ?auto_9813 ) ( not ( = ?auto_9812 ?auto_9814 ) ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9816 ) ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( IN-TRUCK ?auto_9816 ?auto_9819 ) ( TRUCK-AT ?auto_9819 ?auto_9821 ) ( IN-CITY ?auto_9821 ?auto_9820 ) ( not ( = ?auto_9813 ?auto_9821 ) ) ( not ( = ?auto_9818 ?auto_9821 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9819 ?auto_9821 ?auto_9813 ?auto_9820 )
      ( DELIVER-5PKG ?auto_9812 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9813 )
      ( DELIVER-5PKG-VERIFY ?auto_9812 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9813 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9828 - OBJ
      ?auto_9830 - OBJ
      ?auto_9831 - OBJ
      ?auto_9832 - OBJ
      ?auto_9833 - OBJ
      ?auto_9829 - LOCATION
    )
    :vars
    (
      ?auto_9834 - LOCATION
      ?auto_9835 - CITY
      ?auto_9836 - TRUCK
      ?auto_9837 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9830 ?auto_9828 ) ( GREATER-THAN ?auto_9831 ?auto_9828 ) ( GREATER-THAN ?auto_9831 ?auto_9830 ) ( GREATER-THAN ?auto_9832 ?auto_9828 ) ( GREATER-THAN ?auto_9832 ?auto_9830 ) ( GREATER-THAN ?auto_9832 ?auto_9831 ) ( GREATER-THAN ?auto_9833 ?auto_9828 ) ( GREATER-THAN ?auto_9833 ?auto_9830 ) ( GREATER-THAN ?auto_9833 ?auto_9831 ) ( GREATER-THAN ?auto_9833 ?auto_9832 ) ( IN-CITY ?auto_9834 ?auto_9835 ) ( IN-CITY ?auto_9829 ?auto_9835 ) ( not ( = ?auto_9829 ?auto_9834 ) ) ( OBJ-AT ?auto_9833 ?auto_9834 ) ( OBJ-AT ?auto_9828 ?auto_9829 ) ( OBJ-AT ?auto_9830 ?auto_9829 ) ( OBJ-AT ?auto_9831 ?auto_9829 ) ( not ( = ?auto_9828 ?auto_9830 ) ) ( not ( = ?auto_9828 ?auto_9831 ) ) ( not ( = ?auto_9828 ?auto_9832 ) ) ( not ( = ?auto_9828 ?auto_9833 ) ) ( not ( = ?auto_9830 ?auto_9831 ) ) ( not ( = ?auto_9830 ?auto_9832 ) ) ( not ( = ?auto_9830 ?auto_9833 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9833 ) ) ( not ( = ?auto_9832 ?auto_9833 ) ) ( TRUCK-AT ?auto_9836 ?auto_9837 ) ( IN-CITY ?auto_9837 ?auto_9835 ) ( not ( = ?auto_9829 ?auto_9837 ) ) ( not ( = ?auto_9834 ?auto_9837 ) ) ( OBJ-AT ?auto_9832 ?auto_9837 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9832 ?auto_9836 ?auto_9837 )
      ( DELIVER-5PKG ?auto_9828 ?auto_9830 ?auto_9831 ?auto_9832 ?auto_9833 ?auto_9829 )
      ( DELIVER-5PKG-VERIFY ?auto_9828 ?auto_9830 ?auto_9831 ?auto_9832 ?auto_9833 ?auto_9829 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9844 - OBJ
      ?auto_9846 - OBJ
      ?auto_9847 - OBJ
      ?auto_9848 - OBJ
      ?auto_9849 - OBJ
      ?auto_9845 - LOCATION
    )
    :vars
    (
      ?auto_9852 - LOCATION
      ?auto_9850 - CITY
      ?auto_9851 - LOCATION
      ?auto_9853 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9846 ?auto_9844 ) ( GREATER-THAN ?auto_9847 ?auto_9844 ) ( GREATER-THAN ?auto_9847 ?auto_9846 ) ( GREATER-THAN ?auto_9848 ?auto_9844 ) ( GREATER-THAN ?auto_9848 ?auto_9846 ) ( GREATER-THAN ?auto_9848 ?auto_9847 ) ( GREATER-THAN ?auto_9849 ?auto_9844 ) ( GREATER-THAN ?auto_9849 ?auto_9846 ) ( GREATER-THAN ?auto_9849 ?auto_9847 ) ( GREATER-THAN ?auto_9849 ?auto_9848 ) ( IN-CITY ?auto_9852 ?auto_9850 ) ( IN-CITY ?auto_9845 ?auto_9850 ) ( not ( = ?auto_9845 ?auto_9852 ) ) ( OBJ-AT ?auto_9849 ?auto_9852 ) ( OBJ-AT ?auto_9844 ?auto_9845 ) ( OBJ-AT ?auto_9846 ?auto_9845 ) ( OBJ-AT ?auto_9847 ?auto_9845 ) ( not ( = ?auto_9844 ?auto_9846 ) ) ( not ( = ?auto_9844 ?auto_9847 ) ) ( not ( = ?auto_9844 ?auto_9848 ) ) ( not ( = ?auto_9844 ?auto_9849 ) ) ( not ( = ?auto_9846 ?auto_9847 ) ) ( not ( = ?auto_9846 ?auto_9848 ) ) ( not ( = ?auto_9846 ?auto_9849 ) ) ( not ( = ?auto_9847 ?auto_9848 ) ) ( not ( = ?auto_9847 ?auto_9849 ) ) ( not ( = ?auto_9848 ?auto_9849 ) ) ( IN-CITY ?auto_9851 ?auto_9850 ) ( not ( = ?auto_9845 ?auto_9851 ) ) ( not ( = ?auto_9852 ?auto_9851 ) ) ( OBJ-AT ?auto_9848 ?auto_9851 ) ( TRUCK-AT ?auto_9853 ?auto_9845 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9853 ?auto_9845 ?auto_9851 ?auto_9850 )
      ( DELIVER-5PKG ?auto_9844 ?auto_9846 ?auto_9847 ?auto_9848 ?auto_9849 ?auto_9845 )
      ( DELIVER-5PKG-VERIFY ?auto_9844 ?auto_9846 ?auto_9847 ?auto_9848 ?auto_9849 ?auto_9845 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9860 - OBJ
      ?auto_9862 - OBJ
      ?auto_9863 - OBJ
      ?auto_9864 - OBJ
      ?auto_9865 - OBJ
      ?auto_9861 - LOCATION
    )
    :vars
    (
      ?auto_9868 - LOCATION
      ?auto_9867 - CITY
      ?auto_9866 - LOCATION
      ?auto_9869 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9862 ?auto_9860 ) ( GREATER-THAN ?auto_9863 ?auto_9860 ) ( GREATER-THAN ?auto_9863 ?auto_9862 ) ( GREATER-THAN ?auto_9864 ?auto_9860 ) ( GREATER-THAN ?auto_9864 ?auto_9862 ) ( GREATER-THAN ?auto_9864 ?auto_9863 ) ( GREATER-THAN ?auto_9865 ?auto_9860 ) ( GREATER-THAN ?auto_9865 ?auto_9862 ) ( GREATER-THAN ?auto_9865 ?auto_9863 ) ( GREATER-THAN ?auto_9865 ?auto_9864 ) ( IN-CITY ?auto_9868 ?auto_9867 ) ( IN-CITY ?auto_9861 ?auto_9867 ) ( not ( = ?auto_9861 ?auto_9868 ) ) ( OBJ-AT ?auto_9865 ?auto_9868 ) ( OBJ-AT ?auto_9860 ?auto_9861 ) ( OBJ-AT ?auto_9862 ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9860 ?auto_9864 ) ) ( not ( = ?auto_9860 ?auto_9865 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9865 ) ) ( not ( = ?auto_9863 ?auto_9864 ) ) ( not ( = ?auto_9863 ?auto_9865 ) ) ( not ( = ?auto_9864 ?auto_9865 ) ) ( IN-CITY ?auto_9866 ?auto_9867 ) ( not ( = ?auto_9861 ?auto_9866 ) ) ( not ( = ?auto_9868 ?auto_9866 ) ) ( OBJ-AT ?auto_9864 ?auto_9866 ) ( TRUCK-AT ?auto_9869 ?auto_9861 ) ( IN-TRUCK ?auto_9863 ?auto_9869 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9863 ?auto_9861 )
      ( DELIVER-5PKG ?auto_9860 ?auto_9862 ?auto_9863 ?auto_9864 ?auto_9865 ?auto_9861 )
      ( DELIVER-5PKG-VERIFY ?auto_9860 ?auto_9862 ?auto_9863 ?auto_9864 ?auto_9865 ?auto_9861 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9876 - OBJ
      ?auto_9878 - OBJ
      ?auto_9879 - OBJ
      ?auto_9880 - OBJ
      ?auto_9881 - OBJ
      ?auto_9877 - LOCATION
    )
    :vars
    (
      ?auto_9884 - LOCATION
      ?auto_9882 - CITY
      ?auto_9885 - LOCATION
      ?auto_9883 - TRUCK
      ?auto_9886 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9878 ?auto_9876 ) ( GREATER-THAN ?auto_9879 ?auto_9876 ) ( GREATER-THAN ?auto_9879 ?auto_9878 ) ( GREATER-THAN ?auto_9880 ?auto_9876 ) ( GREATER-THAN ?auto_9880 ?auto_9878 ) ( GREATER-THAN ?auto_9880 ?auto_9879 ) ( GREATER-THAN ?auto_9881 ?auto_9876 ) ( GREATER-THAN ?auto_9881 ?auto_9878 ) ( GREATER-THAN ?auto_9881 ?auto_9879 ) ( GREATER-THAN ?auto_9881 ?auto_9880 ) ( IN-CITY ?auto_9884 ?auto_9882 ) ( IN-CITY ?auto_9877 ?auto_9882 ) ( not ( = ?auto_9877 ?auto_9884 ) ) ( OBJ-AT ?auto_9881 ?auto_9884 ) ( OBJ-AT ?auto_9876 ?auto_9877 ) ( OBJ-AT ?auto_9878 ?auto_9877 ) ( not ( = ?auto_9876 ?auto_9878 ) ) ( not ( = ?auto_9876 ?auto_9879 ) ) ( not ( = ?auto_9876 ?auto_9880 ) ) ( not ( = ?auto_9876 ?auto_9881 ) ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( not ( = ?auto_9878 ?auto_9880 ) ) ( not ( = ?auto_9878 ?auto_9881 ) ) ( not ( = ?auto_9879 ?auto_9880 ) ) ( not ( = ?auto_9879 ?auto_9881 ) ) ( not ( = ?auto_9880 ?auto_9881 ) ) ( IN-CITY ?auto_9885 ?auto_9882 ) ( not ( = ?auto_9877 ?auto_9885 ) ) ( not ( = ?auto_9884 ?auto_9885 ) ) ( OBJ-AT ?auto_9880 ?auto_9885 ) ( IN-TRUCK ?auto_9879 ?auto_9883 ) ( TRUCK-AT ?auto_9883 ?auto_9886 ) ( IN-CITY ?auto_9886 ?auto_9882 ) ( not ( = ?auto_9877 ?auto_9886 ) ) ( not ( = ?auto_9884 ?auto_9886 ) ) ( not ( = ?auto_9885 ?auto_9886 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9883 ?auto_9886 ?auto_9877 ?auto_9882 )
      ( DELIVER-5PKG ?auto_9876 ?auto_9878 ?auto_9879 ?auto_9880 ?auto_9881 ?auto_9877 )
      ( DELIVER-5PKG-VERIFY ?auto_9876 ?auto_9878 ?auto_9879 ?auto_9880 ?auto_9881 ?auto_9877 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9893 - OBJ
      ?auto_9895 - OBJ
      ?auto_9896 - OBJ
      ?auto_9897 - OBJ
      ?auto_9898 - OBJ
      ?auto_9894 - LOCATION
    )
    :vars
    (
      ?auto_9901 - LOCATION
      ?auto_9903 - CITY
      ?auto_9900 - LOCATION
      ?auto_9899 - TRUCK
      ?auto_9902 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9895 ?auto_9893 ) ( GREATER-THAN ?auto_9896 ?auto_9893 ) ( GREATER-THAN ?auto_9896 ?auto_9895 ) ( GREATER-THAN ?auto_9897 ?auto_9893 ) ( GREATER-THAN ?auto_9897 ?auto_9895 ) ( GREATER-THAN ?auto_9897 ?auto_9896 ) ( GREATER-THAN ?auto_9898 ?auto_9893 ) ( GREATER-THAN ?auto_9898 ?auto_9895 ) ( GREATER-THAN ?auto_9898 ?auto_9896 ) ( GREATER-THAN ?auto_9898 ?auto_9897 ) ( IN-CITY ?auto_9901 ?auto_9903 ) ( IN-CITY ?auto_9894 ?auto_9903 ) ( not ( = ?auto_9894 ?auto_9901 ) ) ( OBJ-AT ?auto_9898 ?auto_9901 ) ( OBJ-AT ?auto_9893 ?auto_9894 ) ( OBJ-AT ?auto_9895 ?auto_9894 ) ( not ( = ?auto_9893 ?auto_9895 ) ) ( not ( = ?auto_9893 ?auto_9896 ) ) ( not ( = ?auto_9893 ?auto_9897 ) ) ( not ( = ?auto_9893 ?auto_9898 ) ) ( not ( = ?auto_9895 ?auto_9896 ) ) ( not ( = ?auto_9895 ?auto_9897 ) ) ( not ( = ?auto_9895 ?auto_9898 ) ) ( not ( = ?auto_9896 ?auto_9897 ) ) ( not ( = ?auto_9896 ?auto_9898 ) ) ( not ( = ?auto_9897 ?auto_9898 ) ) ( IN-CITY ?auto_9900 ?auto_9903 ) ( not ( = ?auto_9894 ?auto_9900 ) ) ( not ( = ?auto_9901 ?auto_9900 ) ) ( OBJ-AT ?auto_9897 ?auto_9900 ) ( TRUCK-AT ?auto_9899 ?auto_9902 ) ( IN-CITY ?auto_9902 ?auto_9903 ) ( not ( = ?auto_9894 ?auto_9902 ) ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( not ( = ?auto_9900 ?auto_9902 ) ) ( OBJ-AT ?auto_9896 ?auto_9902 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9896 ?auto_9899 ?auto_9902 )
      ( DELIVER-5PKG ?auto_9893 ?auto_9895 ?auto_9896 ?auto_9897 ?auto_9898 ?auto_9894 )
      ( DELIVER-5PKG-VERIFY ?auto_9893 ?auto_9895 ?auto_9896 ?auto_9897 ?auto_9898 ?auto_9894 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9910 - OBJ
      ?auto_9912 - OBJ
      ?auto_9913 - OBJ
      ?auto_9914 - OBJ
      ?auto_9915 - OBJ
      ?auto_9911 - LOCATION
    )
    :vars
    (
      ?auto_9916 - LOCATION
      ?auto_9919 - CITY
      ?auto_9918 - LOCATION
      ?auto_9920 - LOCATION
      ?auto_9917 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9912 ?auto_9910 ) ( GREATER-THAN ?auto_9913 ?auto_9910 ) ( GREATER-THAN ?auto_9913 ?auto_9912 ) ( GREATER-THAN ?auto_9914 ?auto_9910 ) ( GREATER-THAN ?auto_9914 ?auto_9912 ) ( GREATER-THAN ?auto_9914 ?auto_9913 ) ( GREATER-THAN ?auto_9915 ?auto_9910 ) ( GREATER-THAN ?auto_9915 ?auto_9912 ) ( GREATER-THAN ?auto_9915 ?auto_9913 ) ( GREATER-THAN ?auto_9915 ?auto_9914 ) ( IN-CITY ?auto_9916 ?auto_9919 ) ( IN-CITY ?auto_9911 ?auto_9919 ) ( not ( = ?auto_9911 ?auto_9916 ) ) ( OBJ-AT ?auto_9915 ?auto_9916 ) ( OBJ-AT ?auto_9910 ?auto_9911 ) ( OBJ-AT ?auto_9912 ?auto_9911 ) ( not ( = ?auto_9910 ?auto_9912 ) ) ( not ( = ?auto_9910 ?auto_9913 ) ) ( not ( = ?auto_9910 ?auto_9914 ) ) ( not ( = ?auto_9910 ?auto_9915 ) ) ( not ( = ?auto_9912 ?auto_9913 ) ) ( not ( = ?auto_9912 ?auto_9914 ) ) ( not ( = ?auto_9912 ?auto_9915 ) ) ( not ( = ?auto_9913 ?auto_9914 ) ) ( not ( = ?auto_9913 ?auto_9915 ) ) ( not ( = ?auto_9914 ?auto_9915 ) ) ( IN-CITY ?auto_9918 ?auto_9919 ) ( not ( = ?auto_9911 ?auto_9918 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( OBJ-AT ?auto_9914 ?auto_9918 ) ( IN-CITY ?auto_9920 ?auto_9919 ) ( not ( = ?auto_9911 ?auto_9920 ) ) ( not ( = ?auto_9916 ?auto_9920 ) ) ( not ( = ?auto_9918 ?auto_9920 ) ) ( OBJ-AT ?auto_9913 ?auto_9920 ) ( TRUCK-AT ?auto_9917 ?auto_9911 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9917 ?auto_9911 ?auto_9920 ?auto_9919 )
      ( DELIVER-5PKG ?auto_9910 ?auto_9912 ?auto_9913 ?auto_9914 ?auto_9915 ?auto_9911 )
      ( DELIVER-5PKG-VERIFY ?auto_9910 ?auto_9912 ?auto_9913 ?auto_9914 ?auto_9915 ?auto_9911 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9927 - OBJ
      ?auto_9929 - OBJ
      ?auto_9930 - OBJ
      ?auto_9931 - OBJ
      ?auto_9932 - OBJ
      ?auto_9928 - LOCATION
    )
    :vars
    (
      ?auto_9933 - LOCATION
      ?auto_9936 - CITY
      ?auto_9934 - LOCATION
      ?auto_9937 - LOCATION
      ?auto_9935 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9929 ?auto_9927 ) ( GREATER-THAN ?auto_9930 ?auto_9927 ) ( GREATER-THAN ?auto_9930 ?auto_9929 ) ( GREATER-THAN ?auto_9931 ?auto_9927 ) ( GREATER-THAN ?auto_9931 ?auto_9929 ) ( GREATER-THAN ?auto_9931 ?auto_9930 ) ( GREATER-THAN ?auto_9932 ?auto_9927 ) ( GREATER-THAN ?auto_9932 ?auto_9929 ) ( GREATER-THAN ?auto_9932 ?auto_9930 ) ( GREATER-THAN ?auto_9932 ?auto_9931 ) ( IN-CITY ?auto_9933 ?auto_9936 ) ( IN-CITY ?auto_9928 ?auto_9936 ) ( not ( = ?auto_9928 ?auto_9933 ) ) ( OBJ-AT ?auto_9932 ?auto_9933 ) ( OBJ-AT ?auto_9927 ?auto_9928 ) ( not ( = ?auto_9927 ?auto_9929 ) ) ( not ( = ?auto_9927 ?auto_9930 ) ) ( not ( = ?auto_9927 ?auto_9931 ) ) ( not ( = ?auto_9927 ?auto_9932 ) ) ( not ( = ?auto_9929 ?auto_9930 ) ) ( not ( = ?auto_9929 ?auto_9931 ) ) ( not ( = ?auto_9929 ?auto_9932 ) ) ( not ( = ?auto_9930 ?auto_9931 ) ) ( not ( = ?auto_9930 ?auto_9932 ) ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( IN-CITY ?auto_9934 ?auto_9936 ) ( not ( = ?auto_9928 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9934 ) ) ( OBJ-AT ?auto_9931 ?auto_9934 ) ( IN-CITY ?auto_9937 ?auto_9936 ) ( not ( = ?auto_9928 ?auto_9937 ) ) ( not ( = ?auto_9933 ?auto_9937 ) ) ( not ( = ?auto_9934 ?auto_9937 ) ) ( OBJ-AT ?auto_9930 ?auto_9937 ) ( TRUCK-AT ?auto_9935 ?auto_9928 ) ( IN-TRUCK ?auto_9929 ?auto_9935 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9929 ?auto_9928 )
      ( DELIVER-5PKG ?auto_9927 ?auto_9929 ?auto_9930 ?auto_9931 ?auto_9932 ?auto_9928 )
      ( DELIVER-5PKG-VERIFY ?auto_9927 ?auto_9929 ?auto_9930 ?auto_9931 ?auto_9932 ?auto_9928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9944 - OBJ
      ?auto_9946 - OBJ
      ?auto_9947 - OBJ
      ?auto_9948 - OBJ
      ?auto_9949 - OBJ
      ?auto_9945 - LOCATION
    )
    :vars
    (
      ?auto_9951 - LOCATION
      ?auto_9953 - CITY
      ?auto_9952 - LOCATION
      ?auto_9954 - LOCATION
      ?auto_9950 - TRUCK
      ?auto_9955 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9946 ?auto_9944 ) ( GREATER-THAN ?auto_9947 ?auto_9944 ) ( GREATER-THAN ?auto_9947 ?auto_9946 ) ( GREATER-THAN ?auto_9948 ?auto_9944 ) ( GREATER-THAN ?auto_9948 ?auto_9946 ) ( GREATER-THAN ?auto_9948 ?auto_9947 ) ( GREATER-THAN ?auto_9949 ?auto_9944 ) ( GREATER-THAN ?auto_9949 ?auto_9946 ) ( GREATER-THAN ?auto_9949 ?auto_9947 ) ( GREATER-THAN ?auto_9949 ?auto_9948 ) ( IN-CITY ?auto_9951 ?auto_9953 ) ( IN-CITY ?auto_9945 ?auto_9953 ) ( not ( = ?auto_9945 ?auto_9951 ) ) ( OBJ-AT ?auto_9949 ?auto_9951 ) ( OBJ-AT ?auto_9944 ?auto_9945 ) ( not ( = ?auto_9944 ?auto_9946 ) ) ( not ( = ?auto_9944 ?auto_9947 ) ) ( not ( = ?auto_9944 ?auto_9948 ) ) ( not ( = ?auto_9944 ?auto_9949 ) ) ( not ( = ?auto_9946 ?auto_9947 ) ) ( not ( = ?auto_9946 ?auto_9948 ) ) ( not ( = ?auto_9946 ?auto_9949 ) ) ( not ( = ?auto_9947 ?auto_9948 ) ) ( not ( = ?auto_9947 ?auto_9949 ) ) ( not ( = ?auto_9948 ?auto_9949 ) ) ( IN-CITY ?auto_9952 ?auto_9953 ) ( not ( = ?auto_9945 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( OBJ-AT ?auto_9948 ?auto_9952 ) ( IN-CITY ?auto_9954 ?auto_9953 ) ( not ( = ?auto_9945 ?auto_9954 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( OBJ-AT ?auto_9947 ?auto_9954 ) ( IN-TRUCK ?auto_9946 ?auto_9950 ) ( TRUCK-AT ?auto_9950 ?auto_9955 ) ( IN-CITY ?auto_9955 ?auto_9953 ) ( not ( = ?auto_9945 ?auto_9955 ) ) ( not ( = ?auto_9951 ?auto_9955 ) ) ( not ( = ?auto_9952 ?auto_9955 ) ) ( not ( = ?auto_9954 ?auto_9955 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9950 ?auto_9955 ?auto_9945 ?auto_9953 )
      ( DELIVER-5PKG ?auto_9944 ?auto_9946 ?auto_9947 ?auto_9948 ?auto_9949 ?auto_9945 )
      ( DELIVER-5PKG-VERIFY ?auto_9944 ?auto_9946 ?auto_9947 ?auto_9948 ?auto_9949 ?auto_9945 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9962 - OBJ
      ?auto_9964 - OBJ
      ?auto_9965 - OBJ
      ?auto_9966 - OBJ
      ?auto_9967 - OBJ
      ?auto_9963 - LOCATION
    )
    :vars
    (
      ?auto_9968 - LOCATION
      ?auto_9969 - CITY
      ?auto_9970 - LOCATION
      ?auto_9972 - LOCATION
      ?auto_9973 - TRUCK
      ?auto_9971 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9964 ?auto_9962 ) ( GREATER-THAN ?auto_9965 ?auto_9962 ) ( GREATER-THAN ?auto_9965 ?auto_9964 ) ( GREATER-THAN ?auto_9966 ?auto_9962 ) ( GREATER-THAN ?auto_9966 ?auto_9964 ) ( GREATER-THAN ?auto_9966 ?auto_9965 ) ( GREATER-THAN ?auto_9967 ?auto_9962 ) ( GREATER-THAN ?auto_9967 ?auto_9964 ) ( GREATER-THAN ?auto_9967 ?auto_9965 ) ( GREATER-THAN ?auto_9967 ?auto_9966 ) ( IN-CITY ?auto_9968 ?auto_9969 ) ( IN-CITY ?auto_9963 ?auto_9969 ) ( not ( = ?auto_9963 ?auto_9968 ) ) ( OBJ-AT ?auto_9967 ?auto_9968 ) ( OBJ-AT ?auto_9962 ?auto_9963 ) ( not ( = ?auto_9962 ?auto_9964 ) ) ( not ( = ?auto_9962 ?auto_9965 ) ) ( not ( = ?auto_9962 ?auto_9966 ) ) ( not ( = ?auto_9962 ?auto_9967 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) ( not ( = ?auto_9964 ?auto_9966 ) ) ( not ( = ?auto_9964 ?auto_9967 ) ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( not ( = ?auto_9965 ?auto_9967 ) ) ( not ( = ?auto_9966 ?auto_9967 ) ) ( IN-CITY ?auto_9970 ?auto_9969 ) ( not ( = ?auto_9963 ?auto_9970 ) ) ( not ( = ?auto_9968 ?auto_9970 ) ) ( OBJ-AT ?auto_9966 ?auto_9970 ) ( IN-CITY ?auto_9972 ?auto_9969 ) ( not ( = ?auto_9963 ?auto_9972 ) ) ( not ( = ?auto_9968 ?auto_9972 ) ) ( not ( = ?auto_9970 ?auto_9972 ) ) ( OBJ-AT ?auto_9965 ?auto_9972 ) ( TRUCK-AT ?auto_9973 ?auto_9971 ) ( IN-CITY ?auto_9971 ?auto_9969 ) ( not ( = ?auto_9963 ?auto_9971 ) ) ( not ( = ?auto_9968 ?auto_9971 ) ) ( not ( = ?auto_9970 ?auto_9971 ) ) ( not ( = ?auto_9972 ?auto_9971 ) ) ( OBJ-AT ?auto_9964 ?auto_9971 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9964 ?auto_9973 ?auto_9971 )
      ( DELIVER-5PKG ?auto_9962 ?auto_9964 ?auto_9965 ?auto_9966 ?auto_9967 ?auto_9963 )
      ( DELIVER-5PKG-VERIFY ?auto_9962 ?auto_9964 ?auto_9965 ?auto_9966 ?auto_9967 ?auto_9963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9980 - OBJ
      ?auto_9982 - OBJ
      ?auto_9983 - OBJ
      ?auto_9984 - OBJ
      ?auto_9985 - OBJ
      ?auto_9981 - LOCATION
    )
    :vars
    (
      ?auto_9988 - LOCATION
      ?auto_9986 - CITY
      ?auto_9991 - LOCATION
      ?auto_9989 - LOCATION
      ?auto_9990 - LOCATION
      ?auto_9987 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9982 ?auto_9980 ) ( GREATER-THAN ?auto_9983 ?auto_9980 ) ( GREATER-THAN ?auto_9983 ?auto_9982 ) ( GREATER-THAN ?auto_9984 ?auto_9980 ) ( GREATER-THAN ?auto_9984 ?auto_9982 ) ( GREATER-THAN ?auto_9984 ?auto_9983 ) ( GREATER-THAN ?auto_9985 ?auto_9980 ) ( GREATER-THAN ?auto_9985 ?auto_9982 ) ( GREATER-THAN ?auto_9985 ?auto_9983 ) ( GREATER-THAN ?auto_9985 ?auto_9984 ) ( IN-CITY ?auto_9988 ?auto_9986 ) ( IN-CITY ?auto_9981 ?auto_9986 ) ( not ( = ?auto_9981 ?auto_9988 ) ) ( OBJ-AT ?auto_9985 ?auto_9988 ) ( OBJ-AT ?auto_9980 ?auto_9981 ) ( not ( = ?auto_9980 ?auto_9982 ) ) ( not ( = ?auto_9980 ?auto_9983 ) ) ( not ( = ?auto_9980 ?auto_9984 ) ) ( not ( = ?auto_9980 ?auto_9985 ) ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9984 ) ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( not ( = ?auto_9983 ?auto_9985 ) ) ( not ( = ?auto_9984 ?auto_9985 ) ) ( IN-CITY ?auto_9991 ?auto_9986 ) ( not ( = ?auto_9981 ?auto_9991 ) ) ( not ( = ?auto_9988 ?auto_9991 ) ) ( OBJ-AT ?auto_9984 ?auto_9991 ) ( IN-CITY ?auto_9989 ?auto_9986 ) ( not ( = ?auto_9981 ?auto_9989 ) ) ( not ( = ?auto_9988 ?auto_9989 ) ) ( not ( = ?auto_9991 ?auto_9989 ) ) ( OBJ-AT ?auto_9983 ?auto_9989 ) ( IN-CITY ?auto_9990 ?auto_9986 ) ( not ( = ?auto_9981 ?auto_9990 ) ) ( not ( = ?auto_9988 ?auto_9990 ) ) ( not ( = ?auto_9991 ?auto_9990 ) ) ( not ( = ?auto_9989 ?auto_9990 ) ) ( OBJ-AT ?auto_9982 ?auto_9990 ) ( TRUCK-AT ?auto_9987 ?auto_9981 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9987 ?auto_9981 ?auto_9990 ?auto_9986 )
      ( DELIVER-5PKG ?auto_9980 ?auto_9982 ?auto_9983 ?auto_9984 ?auto_9985 ?auto_9981 )
      ( DELIVER-5PKG-VERIFY ?auto_9980 ?auto_9982 ?auto_9983 ?auto_9984 ?auto_9985 ?auto_9981 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9998 - OBJ
      ?auto_10000 - OBJ
      ?auto_10001 - OBJ
      ?auto_10002 - OBJ
      ?auto_10003 - OBJ
      ?auto_9999 - LOCATION
    )
    :vars
    (
      ?auto_10006 - LOCATION
      ?auto_10008 - CITY
      ?auto_10007 - LOCATION
      ?auto_10004 - LOCATION
      ?auto_10005 - LOCATION
      ?auto_10009 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10000 ?auto_9998 ) ( GREATER-THAN ?auto_10001 ?auto_9998 ) ( GREATER-THAN ?auto_10001 ?auto_10000 ) ( GREATER-THAN ?auto_10002 ?auto_9998 ) ( GREATER-THAN ?auto_10002 ?auto_10000 ) ( GREATER-THAN ?auto_10002 ?auto_10001 ) ( GREATER-THAN ?auto_10003 ?auto_9998 ) ( GREATER-THAN ?auto_10003 ?auto_10000 ) ( GREATER-THAN ?auto_10003 ?auto_10001 ) ( GREATER-THAN ?auto_10003 ?auto_10002 ) ( IN-CITY ?auto_10006 ?auto_10008 ) ( IN-CITY ?auto_9999 ?auto_10008 ) ( not ( = ?auto_9999 ?auto_10006 ) ) ( OBJ-AT ?auto_10003 ?auto_10006 ) ( not ( = ?auto_9998 ?auto_10000 ) ) ( not ( = ?auto_9998 ?auto_10001 ) ) ( not ( = ?auto_9998 ?auto_10002 ) ) ( not ( = ?auto_9998 ?auto_10003 ) ) ( not ( = ?auto_10000 ?auto_10001 ) ) ( not ( = ?auto_10000 ?auto_10002 ) ) ( not ( = ?auto_10000 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10002 ?auto_10003 ) ) ( IN-CITY ?auto_10007 ?auto_10008 ) ( not ( = ?auto_9999 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( OBJ-AT ?auto_10002 ?auto_10007 ) ( IN-CITY ?auto_10004 ?auto_10008 ) ( not ( = ?auto_9999 ?auto_10004 ) ) ( not ( = ?auto_10006 ?auto_10004 ) ) ( not ( = ?auto_10007 ?auto_10004 ) ) ( OBJ-AT ?auto_10001 ?auto_10004 ) ( IN-CITY ?auto_10005 ?auto_10008 ) ( not ( = ?auto_9999 ?auto_10005 ) ) ( not ( = ?auto_10006 ?auto_10005 ) ) ( not ( = ?auto_10007 ?auto_10005 ) ) ( not ( = ?auto_10004 ?auto_10005 ) ) ( OBJ-AT ?auto_10000 ?auto_10005 ) ( TRUCK-AT ?auto_10009 ?auto_9999 ) ( IN-TRUCK ?auto_9998 ?auto_10009 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9998 ?auto_9999 )
      ( DELIVER-5PKG ?auto_9998 ?auto_10000 ?auto_10001 ?auto_10002 ?auto_10003 ?auto_9999 )
      ( DELIVER-5PKG-VERIFY ?auto_9998 ?auto_10000 ?auto_10001 ?auto_10002 ?auto_10003 ?auto_9999 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_10016 - OBJ
      ?auto_10018 - OBJ
      ?auto_10019 - OBJ
      ?auto_10020 - OBJ
      ?auto_10021 - OBJ
      ?auto_10017 - LOCATION
    )
    :vars
    (
      ?auto_10025 - LOCATION
      ?auto_10022 - CITY
      ?auto_10023 - LOCATION
      ?auto_10026 - LOCATION
      ?auto_10027 - LOCATION
      ?auto_10024 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10018 ?auto_10016 ) ( GREATER-THAN ?auto_10019 ?auto_10016 ) ( GREATER-THAN ?auto_10019 ?auto_10018 ) ( GREATER-THAN ?auto_10020 ?auto_10016 ) ( GREATER-THAN ?auto_10020 ?auto_10018 ) ( GREATER-THAN ?auto_10020 ?auto_10019 ) ( GREATER-THAN ?auto_10021 ?auto_10016 ) ( GREATER-THAN ?auto_10021 ?auto_10018 ) ( GREATER-THAN ?auto_10021 ?auto_10019 ) ( GREATER-THAN ?auto_10021 ?auto_10020 ) ( IN-CITY ?auto_10025 ?auto_10022 ) ( IN-CITY ?auto_10017 ?auto_10022 ) ( not ( = ?auto_10017 ?auto_10025 ) ) ( OBJ-AT ?auto_10021 ?auto_10025 ) ( not ( = ?auto_10016 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10019 ) ) ( not ( = ?auto_10016 ?auto_10020 ) ) ( not ( = ?auto_10016 ?auto_10021 ) ) ( not ( = ?auto_10018 ?auto_10019 ) ) ( not ( = ?auto_10018 ?auto_10020 ) ) ( not ( = ?auto_10018 ?auto_10021 ) ) ( not ( = ?auto_10019 ?auto_10020 ) ) ( not ( = ?auto_10019 ?auto_10021 ) ) ( not ( = ?auto_10020 ?auto_10021 ) ) ( IN-CITY ?auto_10023 ?auto_10022 ) ( not ( = ?auto_10017 ?auto_10023 ) ) ( not ( = ?auto_10025 ?auto_10023 ) ) ( OBJ-AT ?auto_10020 ?auto_10023 ) ( IN-CITY ?auto_10026 ?auto_10022 ) ( not ( = ?auto_10017 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10023 ?auto_10026 ) ) ( OBJ-AT ?auto_10019 ?auto_10026 ) ( IN-CITY ?auto_10027 ?auto_10022 ) ( not ( = ?auto_10017 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10023 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( OBJ-AT ?auto_10018 ?auto_10027 ) ( IN-TRUCK ?auto_10016 ?auto_10024 ) ( TRUCK-AT ?auto_10024 ?auto_10023 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10024 ?auto_10023 ?auto_10017 ?auto_10022 )
      ( DELIVER-5PKG ?auto_10016 ?auto_10018 ?auto_10019 ?auto_10020 ?auto_10021 ?auto_10017 )
      ( DELIVER-5PKG-VERIFY ?auto_10016 ?auto_10018 ?auto_10019 ?auto_10020 ?auto_10021 ?auto_10017 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_10034 - OBJ
      ?auto_10036 - OBJ
      ?auto_10037 - OBJ
      ?auto_10038 - OBJ
      ?auto_10039 - OBJ
      ?auto_10035 - LOCATION
    )
    :vars
    (
      ?auto_10043 - LOCATION
      ?auto_10041 - CITY
      ?auto_10042 - LOCATION
      ?auto_10044 - LOCATION
      ?auto_10040 - LOCATION
      ?auto_10045 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10036 ?auto_10034 ) ( GREATER-THAN ?auto_10037 ?auto_10034 ) ( GREATER-THAN ?auto_10037 ?auto_10036 ) ( GREATER-THAN ?auto_10038 ?auto_10034 ) ( GREATER-THAN ?auto_10038 ?auto_10036 ) ( GREATER-THAN ?auto_10038 ?auto_10037 ) ( GREATER-THAN ?auto_10039 ?auto_10034 ) ( GREATER-THAN ?auto_10039 ?auto_10036 ) ( GREATER-THAN ?auto_10039 ?auto_10037 ) ( GREATER-THAN ?auto_10039 ?auto_10038 ) ( IN-CITY ?auto_10043 ?auto_10041 ) ( IN-CITY ?auto_10035 ?auto_10041 ) ( not ( = ?auto_10035 ?auto_10043 ) ) ( OBJ-AT ?auto_10039 ?auto_10043 ) ( not ( = ?auto_10034 ?auto_10036 ) ) ( not ( = ?auto_10034 ?auto_10037 ) ) ( not ( = ?auto_10034 ?auto_10038 ) ) ( not ( = ?auto_10034 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10036 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10039 ) ) ( not ( = ?auto_10037 ?auto_10038 ) ) ( not ( = ?auto_10037 ?auto_10039 ) ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( IN-CITY ?auto_10042 ?auto_10041 ) ( not ( = ?auto_10035 ?auto_10042 ) ) ( not ( = ?auto_10043 ?auto_10042 ) ) ( OBJ-AT ?auto_10038 ?auto_10042 ) ( IN-CITY ?auto_10044 ?auto_10041 ) ( not ( = ?auto_10035 ?auto_10044 ) ) ( not ( = ?auto_10043 ?auto_10044 ) ) ( not ( = ?auto_10042 ?auto_10044 ) ) ( OBJ-AT ?auto_10037 ?auto_10044 ) ( IN-CITY ?auto_10040 ?auto_10041 ) ( not ( = ?auto_10035 ?auto_10040 ) ) ( not ( = ?auto_10043 ?auto_10040 ) ) ( not ( = ?auto_10042 ?auto_10040 ) ) ( not ( = ?auto_10044 ?auto_10040 ) ) ( OBJ-AT ?auto_10036 ?auto_10040 ) ( TRUCK-AT ?auto_10045 ?auto_10042 ) ( OBJ-AT ?auto_10034 ?auto_10042 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10034 ?auto_10045 ?auto_10042 )
      ( DELIVER-5PKG ?auto_10034 ?auto_10036 ?auto_10037 ?auto_10038 ?auto_10039 ?auto_10035 )
      ( DELIVER-5PKG-VERIFY ?auto_10034 ?auto_10036 ?auto_10037 ?auto_10038 ?auto_10039 ?auto_10035 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_10052 - OBJ
      ?auto_10054 - OBJ
      ?auto_10055 - OBJ
      ?auto_10056 - OBJ
      ?auto_10057 - OBJ
      ?auto_10053 - LOCATION
    )
    :vars
    (
      ?auto_10060 - LOCATION
      ?auto_10063 - CITY
      ?auto_10059 - LOCATION
      ?auto_10058 - LOCATION
      ?auto_10061 - LOCATION
      ?auto_10062 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10054 ?auto_10052 ) ( GREATER-THAN ?auto_10055 ?auto_10052 ) ( GREATER-THAN ?auto_10055 ?auto_10054 ) ( GREATER-THAN ?auto_10056 ?auto_10052 ) ( GREATER-THAN ?auto_10056 ?auto_10054 ) ( GREATER-THAN ?auto_10056 ?auto_10055 ) ( GREATER-THAN ?auto_10057 ?auto_10052 ) ( GREATER-THAN ?auto_10057 ?auto_10054 ) ( GREATER-THAN ?auto_10057 ?auto_10055 ) ( GREATER-THAN ?auto_10057 ?auto_10056 ) ( IN-CITY ?auto_10060 ?auto_10063 ) ( IN-CITY ?auto_10053 ?auto_10063 ) ( not ( = ?auto_10053 ?auto_10060 ) ) ( OBJ-AT ?auto_10057 ?auto_10060 ) ( not ( = ?auto_10052 ?auto_10054 ) ) ( not ( = ?auto_10052 ?auto_10055 ) ) ( not ( = ?auto_10052 ?auto_10056 ) ) ( not ( = ?auto_10052 ?auto_10057 ) ) ( not ( = ?auto_10054 ?auto_10055 ) ) ( not ( = ?auto_10054 ?auto_10056 ) ) ( not ( = ?auto_10054 ?auto_10057 ) ) ( not ( = ?auto_10055 ?auto_10056 ) ) ( not ( = ?auto_10055 ?auto_10057 ) ) ( not ( = ?auto_10056 ?auto_10057 ) ) ( IN-CITY ?auto_10059 ?auto_10063 ) ( not ( = ?auto_10053 ?auto_10059 ) ) ( not ( = ?auto_10060 ?auto_10059 ) ) ( OBJ-AT ?auto_10056 ?auto_10059 ) ( IN-CITY ?auto_10058 ?auto_10063 ) ( not ( = ?auto_10053 ?auto_10058 ) ) ( not ( = ?auto_10060 ?auto_10058 ) ) ( not ( = ?auto_10059 ?auto_10058 ) ) ( OBJ-AT ?auto_10055 ?auto_10058 ) ( IN-CITY ?auto_10061 ?auto_10063 ) ( not ( = ?auto_10053 ?auto_10061 ) ) ( not ( = ?auto_10060 ?auto_10061 ) ) ( not ( = ?auto_10059 ?auto_10061 ) ) ( not ( = ?auto_10058 ?auto_10061 ) ) ( OBJ-AT ?auto_10054 ?auto_10061 ) ( OBJ-AT ?auto_10052 ?auto_10059 ) ( TRUCK-AT ?auto_10062 ?auto_10053 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10062 ?auto_10053 ?auto_10059 ?auto_10063 )
      ( DELIVER-5PKG ?auto_10052 ?auto_10054 ?auto_10055 ?auto_10056 ?auto_10057 ?auto_10053 )
      ( DELIVER-5PKG-VERIFY ?auto_10052 ?auto_10054 ?auto_10055 ?auto_10056 ?auto_10057 ?auto_10053 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10097 - OBJ
      ?auto_10099 - OBJ
      ?auto_10101 - OBJ
      ?auto_10102 - OBJ
      ?auto_10103 - OBJ
      ?auto_10100 - OBJ
      ?auto_10098 - LOCATION
    )
    :vars
    (
      ?auto_10104 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10099 ?auto_10097 ) ( GREATER-THAN ?auto_10101 ?auto_10097 ) ( GREATER-THAN ?auto_10101 ?auto_10099 ) ( GREATER-THAN ?auto_10102 ?auto_10097 ) ( GREATER-THAN ?auto_10102 ?auto_10099 ) ( GREATER-THAN ?auto_10102 ?auto_10101 ) ( GREATER-THAN ?auto_10103 ?auto_10097 ) ( GREATER-THAN ?auto_10103 ?auto_10099 ) ( GREATER-THAN ?auto_10103 ?auto_10101 ) ( GREATER-THAN ?auto_10103 ?auto_10102 ) ( GREATER-THAN ?auto_10100 ?auto_10097 ) ( GREATER-THAN ?auto_10100 ?auto_10099 ) ( GREATER-THAN ?auto_10100 ?auto_10101 ) ( GREATER-THAN ?auto_10100 ?auto_10102 ) ( GREATER-THAN ?auto_10100 ?auto_10103 ) ( TRUCK-AT ?auto_10104 ?auto_10098 ) ( IN-TRUCK ?auto_10100 ?auto_10104 ) ( OBJ-AT ?auto_10097 ?auto_10098 ) ( OBJ-AT ?auto_10099 ?auto_10098 ) ( OBJ-AT ?auto_10101 ?auto_10098 ) ( OBJ-AT ?auto_10102 ?auto_10098 ) ( OBJ-AT ?auto_10103 ?auto_10098 ) ( not ( = ?auto_10097 ?auto_10099 ) ) ( not ( = ?auto_10097 ?auto_10101 ) ) ( not ( = ?auto_10097 ?auto_10102 ) ) ( not ( = ?auto_10097 ?auto_10103 ) ) ( not ( = ?auto_10097 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10101 ) ) ( not ( = ?auto_10099 ?auto_10102 ) ) ( not ( = ?auto_10099 ?auto_10103 ) ) ( not ( = ?auto_10099 ?auto_10100 ) ) ( not ( = ?auto_10101 ?auto_10102 ) ) ( not ( = ?auto_10101 ?auto_10103 ) ) ( not ( = ?auto_10101 ?auto_10100 ) ) ( not ( = ?auto_10102 ?auto_10103 ) ) ( not ( = ?auto_10102 ?auto_10100 ) ) ( not ( = ?auto_10103 ?auto_10100 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10100 ?auto_10098 )
      ( DELIVER-6PKG-VERIFY ?auto_10097 ?auto_10099 ?auto_10101 ?auto_10102 ?auto_10103 ?auto_10100 ?auto_10098 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10112 - OBJ
      ?auto_10114 - OBJ
      ?auto_10116 - OBJ
      ?auto_10117 - OBJ
      ?auto_10118 - OBJ
      ?auto_10115 - OBJ
      ?auto_10113 - LOCATION
    )
    :vars
    (
      ?auto_10121 - TRUCK
      ?auto_10119 - LOCATION
      ?auto_10120 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10114 ?auto_10112 ) ( GREATER-THAN ?auto_10116 ?auto_10112 ) ( GREATER-THAN ?auto_10116 ?auto_10114 ) ( GREATER-THAN ?auto_10117 ?auto_10112 ) ( GREATER-THAN ?auto_10117 ?auto_10114 ) ( GREATER-THAN ?auto_10117 ?auto_10116 ) ( GREATER-THAN ?auto_10118 ?auto_10112 ) ( GREATER-THAN ?auto_10118 ?auto_10114 ) ( GREATER-THAN ?auto_10118 ?auto_10116 ) ( GREATER-THAN ?auto_10118 ?auto_10117 ) ( GREATER-THAN ?auto_10115 ?auto_10112 ) ( GREATER-THAN ?auto_10115 ?auto_10114 ) ( GREATER-THAN ?auto_10115 ?auto_10116 ) ( GREATER-THAN ?auto_10115 ?auto_10117 ) ( GREATER-THAN ?auto_10115 ?auto_10118 ) ( IN-TRUCK ?auto_10115 ?auto_10121 ) ( TRUCK-AT ?auto_10121 ?auto_10119 ) ( IN-CITY ?auto_10119 ?auto_10120 ) ( IN-CITY ?auto_10113 ?auto_10120 ) ( not ( = ?auto_10113 ?auto_10119 ) ) ( OBJ-AT ?auto_10112 ?auto_10113 ) ( OBJ-AT ?auto_10114 ?auto_10113 ) ( OBJ-AT ?auto_10116 ?auto_10113 ) ( OBJ-AT ?auto_10117 ?auto_10113 ) ( OBJ-AT ?auto_10118 ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10112 ?auto_10117 ) ) ( not ( = ?auto_10112 ?auto_10118 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10118 ) ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10115 ) ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10115 ) ) ( not ( = ?auto_10118 ?auto_10115 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10115 ?auto_10113 )
      ( DELIVER-6PKG-VERIFY ?auto_10112 ?auto_10114 ?auto_10116 ?auto_10117 ?auto_10118 ?auto_10115 ?auto_10113 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10129 - OBJ
      ?auto_10131 - OBJ
      ?auto_10133 - OBJ
      ?auto_10134 - OBJ
      ?auto_10135 - OBJ
      ?auto_10132 - OBJ
      ?auto_10130 - LOCATION
    )
    :vars
    (
      ?auto_10138 - TRUCK
      ?auto_10136 - LOCATION
      ?auto_10137 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10131 ?auto_10129 ) ( GREATER-THAN ?auto_10133 ?auto_10129 ) ( GREATER-THAN ?auto_10133 ?auto_10131 ) ( GREATER-THAN ?auto_10134 ?auto_10129 ) ( GREATER-THAN ?auto_10134 ?auto_10131 ) ( GREATER-THAN ?auto_10134 ?auto_10133 ) ( GREATER-THAN ?auto_10135 ?auto_10129 ) ( GREATER-THAN ?auto_10135 ?auto_10131 ) ( GREATER-THAN ?auto_10135 ?auto_10133 ) ( GREATER-THAN ?auto_10135 ?auto_10134 ) ( GREATER-THAN ?auto_10132 ?auto_10129 ) ( GREATER-THAN ?auto_10132 ?auto_10131 ) ( GREATER-THAN ?auto_10132 ?auto_10133 ) ( GREATER-THAN ?auto_10132 ?auto_10134 ) ( GREATER-THAN ?auto_10132 ?auto_10135 ) ( TRUCK-AT ?auto_10138 ?auto_10136 ) ( IN-CITY ?auto_10136 ?auto_10137 ) ( IN-CITY ?auto_10130 ?auto_10137 ) ( not ( = ?auto_10130 ?auto_10136 ) ) ( OBJ-AT ?auto_10132 ?auto_10136 ) ( OBJ-AT ?auto_10129 ?auto_10130 ) ( OBJ-AT ?auto_10131 ?auto_10130 ) ( OBJ-AT ?auto_10133 ?auto_10130 ) ( OBJ-AT ?auto_10134 ?auto_10130 ) ( OBJ-AT ?auto_10135 ?auto_10130 ) ( not ( = ?auto_10129 ?auto_10131 ) ) ( not ( = ?auto_10129 ?auto_10133 ) ) ( not ( = ?auto_10129 ?auto_10134 ) ) ( not ( = ?auto_10129 ?auto_10135 ) ) ( not ( = ?auto_10129 ?auto_10132 ) ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( not ( = ?auto_10131 ?auto_10134 ) ) ( not ( = ?auto_10131 ?auto_10135 ) ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( not ( = ?auto_10133 ?auto_10134 ) ) ( not ( = ?auto_10133 ?auto_10135 ) ) ( not ( = ?auto_10133 ?auto_10132 ) ) ( not ( = ?auto_10134 ?auto_10135 ) ) ( not ( = ?auto_10134 ?auto_10132 ) ) ( not ( = ?auto_10135 ?auto_10132 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10132 ?auto_10130 )
      ( DELIVER-6PKG-VERIFY ?auto_10129 ?auto_10131 ?auto_10133 ?auto_10134 ?auto_10135 ?auto_10132 ?auto_10130 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10146 - OBJ
      ?auto_10148 - OBJ
      ?auto_10150 - OBJ
      ?auto_10151 - OBJ
      ?auto_10152 - OBJ
      ?auto_10149 - OBJ
      ?auto_10147 - LOCATION
    )
    :vars
    (
      ?auto_10154 - LOCATION
      ?auto_10155 - CITY
      ?auto_10153 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10148 ?auto_10146 ) ( GREATER-THAN ?auto_10150 ?auto_10146 ) ( GREATER-THAN ?auto_10150 ?auto_10148 ) ( GREATER-THAN ?auto_10151 ?auto_10146 ) ( GREATER-THAN ?auto_10151 ?auto_10148 ) ( GREATER-THAN ?auto_10151 ?auto_10150 ) ( GREATER-THAN ?auto_10152 ?auto_10146 ) ( GREATER-THAN ?auto_10152 ?auto_10148 ) ( GREATER-THAN ?auto_10152 ?auto_10150 ) ( GREATER-THAN ?auto_10152 ?auto_10151 ) ( GREATER-THAN ?auto_10149 ?auto_10146 ) ( GREATER-THAN ?auto_10149 ?auto_10148 ) ( GREATER-THAN ?auto_10149 ?auto_10150 ) ( GREATER-THAN ?auto_10149 ?auto_10151 ) ( GREATER-THAN ?auto_10149 ?auto_10152 ) ( IN-CITY ?auto_10154 ?auto_10155 ) ( IN-CITY ?auto_10147 ?auto_10155 ) ( not ( = ?auto_10147 ?auto_10154 ) ) ( OBJ-AT ?auto_10149 ?auto_10154 ) ( TRUCK-AT ?auto_10153 ?auto_10147 ) ( OBJ-AT ?auto_10146 ?auto_10147 ) ( OBJ-AT ?auto_10148 ?auto_10147 ) ( OBJ-AT ?auto_10150 ?auto_10147 ) ( OBJ-AT ?auto_10151 ?auto_10147 ) ( OBJ-AT ?auto_10152 ?auto_10147 ) ( not ( = ?auto_10146 ?auto_10148 ) ) ( not ( = ?auto_10146 ?auto_10150 ) ) ( not ( = ?auto_10146 ?auto_10151 ) ) ( not ( = ?auto_10146 ?auto_10152 ) ) ( not ( = ?auto_10146 ?auto_10149 ) ) ( not ( = ?auto_10148 ?auto_10150 ) ) ( not ( = ?auto_10148 ?auto_10151 ) ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10148 ?auto_10149 ) ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( not ( = ?auto_10150 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10149 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10149 ) ) ( not ( = ?auto_10152 ?auto_10149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10149 ?auto_10147 )
      ( DELIVER-6PKG-VERIFY ?auto_10146 ?auto_10148 ?auto_10150 ?auto_10151 ?auto_10152 ?auto_10149 ?auto_10147 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10163 - OBJ
      ?auto_10165 - OBJ
      ?auto_10167 - OBJ
      ?auto_10168 - OBJ
      ?auto_10169 - OBJ
      ?auto_10166 - OBJ
      ?auto_10164 - LOCATION
    )
    :vars
    (
      ?auto_10170 - LOCATION
      ?auto_10172 - CITY
      ?auto_10171 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10165 ?auto_10163 ) ( GREATER-THAN ?auto_10167 ?auto_10163 ) ( GREATER-THAN ?auto_10167 ?auto_10165 ) ( GREATER-THAN ?auto_10168 ?auto_10163 ) ( GREATER-THAN ?auto_10168 ?auto_10165 ) ( GREATER-THAN ?auto_10168 ?auto_10167 ) ( GREATER-THAN ?auto_10169 ?auto_10163 ) ( GREATER-THAN ?auto_10169 ?auto_10165 ) ( GREATER-THAN ?auto_10169 ?auto_10167 ) ( GREATER-THAN ?auto_10169 ?auto_10168 ) ( GREATER-THAN ?auto_10166 ?auto_10163 ) ( GREATER-THAN ?auto_10166 ?auto_10165 ) ( GREATER-THAN ?auto_10166 ?auto_10167 ) ( GREATER-THAN ?auto_10166 ?auto_10168 ) ( GREATER-THAN ?auto_10166 ?auto_10169 ) ( IN-CITY ?auto_10170 ?auto_10172 ) ( IN-CITY ?auto_10164 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( OBJ-AT ?auto_10166 ?auto_10170 ) ( TRUCK-AT ?auto_10171 ?auto_10164 ) ( OBJ-AT ?auto_10163 ?auto_10164 ) ( OBJ-AT ?auto_10165 ?auto_10164 ) ( OBJ-AT ?auto_10167 ?auto_10164 ) ( OBJ-AT ?auto_10168 ?auto_10164 ) ( not ( = ?auto_10163 ?auto_10165 ) ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( not ( = ?auto_10163 ?auto_10168 ) ) ( not ( = ?auto_10163 ?auto_10169 ) ) ( not ( = ?auto_10163 ?auto_10166 ) ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10165 ?auto_10168 ) ) ( not ( = ?auto_10165 ?auto_10169 ) ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( not ( = ?auto_10167 ?auto_10168 ) ) ( not ( = ?auto_10167 ?auto_10169 ) ) ( not ( = ?auto_10167 ?auto_10166 ) ) ( not ( = ?auto_10168 ?auto_10169 ) ) ( not ( = ?auto_10168 ?auto_10166 ) ) ( not ( = ?auto_10169 ?auto_10166 ) ) ( IN-TRUCK ?auto_10169 ?auto_10171 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10169 ?auto_10164 )
      ( DELIVER-6PKG ?auto_10163 ?auto_10165 ?auto_10167 ?auto_10168 ?auto_10169 ?auto_10166 ?auto_10164 )
      ( DELIVER-6PKG-VERIFY ?auto_10163 ?auto_10165 ?auto_10167 ?auto_10168 ?auto_10169 ?auto_10166 ?auto_10164 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10180 - OBJ
      ?auto_10182 - OBJ
      ?auto_10184 - OBJ
      ?auto_10185 - OBJ
      ?auto_10186 - OBJ
      ?auto_10183 - OBJ
      ?auto_10181 - LOCATION
    )
    :vars
    (
      ?auto_10188 - LOCATION
      ?auto_10187 - CITY
      ?auto_10189 - TRUCK
      ?auto_10190 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10182 ?auto_10180 ) ( GREATER-THAN ?auto_10184 ?auto_10180 ) ( GREATER-THAN ?auto_10184 ?auto_10182 ) ( GREATER-THAN ?auto_10185 ?auto_10180 ) ( GREATER-THAN ?auto_10185 ?auto_10182 ) ( GREATER-THAN ?auto_10185 ?auto_10184 ) ( GREATER-THAN ?auto_10186 ?auto_10180 ) ( GREATER-THAN ?auto_10186 ?auto_10182 ) ( GREATER-THAN ?auto_10186 ?auto_10184 ) ( GREATER-THAN ?auto_10186 ?auto_10185 ) ( GREATER-THAN ?auto_10183 ?auto_10180 ) ( GREATER-THAN ?auto_10183 ?auto_10182 ) ( GREATER-THAN ?auto_10183 ?auto_10184 ) ( GREATER-THAN ?auto_10183 ?auto_10185 ) ( GREATER-THAN ?auto_10183 ?auto_10186 ) ( IN-CITY ?auto_10188 ?auto_10187 ) ( IN-CITY ?auto_10181 ?auto_10187 ) ( not ( = ?auto_10181 ?auto_10188 ) ) ( OBJ-AT ?auto_10183 ?auto_10188 ) ( OBJ-AT ?auto_10180 ?auto_10181 ) ( OBJ-AT ?auto_10182 ?auto_10181 ) ( OBJ-AT ?auto_10184 ?auto_10181 ) ( OBJ-AT ?auto_10185 ?auto_10181 ) ( not ( = ?auto_10180 ?auto_10182 ) ) ( not ( = ?auto_10180 ?auto_10184 ) ) ( not ( = ?auto_10180 ?auto_10185 ) ) ( not ( = ?auto_10180 ?auto_10186 ) ) ( not ( = ?auto_10180 ?auto_10183 ) ) ( not ( = ?auto_10182 ?auto_10184 ) ) ( not ( = ?auto_10182 ?auto_10185 ) ) ( not ( = ?auto_10182 ?auto_10186 ) ) ( not ( = ?auto_10182 ?auto_10183 ) ) ( not ( = ?auto_10184 ?auto_10185 ) ) ( not ( = ?auto_10184 ?auto_10186 ) ) ( not ( = ?auto_10184 ?auto_10183 ) ) ( not ( = ?auto_10185 ?auto_10186 ) ) ( not ( = ?auto_10185 ?auto_10183 ) ) ( not ( = ?auto_10186 ?auto_10183 ) ) ( IN-TRUCK ?auto_10186 ?auto_10189 ) ( TRUCK-AT ?auto_10189 ?auto_10190 ) ( IN-CITY ?auto_10190 ?auto_10187 ) ( not ( = ?auto_10181 ?auto_10190 ) ) ( not ( = ?auto_10188 ?auto_10190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10189 ?auto_10190 ?auto_10181 ?auto_10187 )
      ( DELIVER-6PKG ?auto_10180 ?auto_10182 ?auto_10184 ?auto_10185 ?auto_10186 ?auto_10183 ?auto_10181 )
      ( DELIVER-6PKG-VERIFY ?auto_10180 ?auto_10182 ?auto_10184 ?auto_10185 ?auto_10186 ?auto_10183 ?auto_10181 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10198 - OBJ
      ?auto_10200 - OBJ
      ?auto_10202 - OBJ
      ?auto_10203 - OBJ
      ?auto_10204 - OBJ
      ?auto_10201 - OBJ
      ?auto_10199 - LOCATION
    )
    :vars
    (
      ?auto_10207 - LOCATION
      ?auto_10208 - CITY
      ?auto_10206 - TRUCK
      ?auto_10205 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10200 ?auto_10198 ) ( GREATER-THAN ?auto_10202 ?auto_10198 ) ( GREATER-THAN ?auto_10202 ?auto_10200 ) ( GREATER-THAN ?auto_10203 ?auto_10198 ) ( GREATER-THAN ?auto_10203 ?auto_10200 ) ( GREATER-THAN ?auto_10203 ?auto_10202 ) ( GREATER-THAN ?auto_10204 ?auto_10198 ) ( GREATER-THAN ?auto_10204 ?auto_10200 ) ( GREATER-THAN ?auto_10204 ?auto_10202 ) ( GREATER-THAN ?auto_10204 ?auto_10203 ) ( GREATER-THAN ?auto_10201 ?auto_10198 ) ( GREATER-THAN ?auto_10201 ?auto_10200 ) ( GREATER-THAN ?auto_10201 ?auto_10202 ) ( GREATER-THAN ?auto_10201 ?auto_10203 ) ( GREATER-THAN ?auto_10201 ?auto_10204 ) ( IN-CITY ?auto_10207 ?auto_10208 ) ( IN-CITY ?auto_10199 ?auto_10208 ) ( not ( = ?auto_10199 ?auto_10207 ) ) ( OBJ-AT ?auto_10201 ?auto_10207 ) ( OBJ-AT ?auto_10198 ?auto_10199 ) ( OBJ-AT ?auto_10200 ?auto_10199 ) ( OBJ-AT ?auto_10202 ?auto_10199 ) ( OBJ-AT ?auto_10203 ?auto_10199 ) ( not ( = ?auto_10198 ?auto_10200 ) ) ( not ( = ?auto_10198 ?auto_10202 ) ) ( not ( = ?auto_10198 ?auto_10203 ) ) ( not ( = ?auto_10198 ?auto_10204 ) ) ( not ( = ?auto_10198 ?auto_10201 ) ) ( not ( = ?auto_10200 ?auto_10202 ) ) ( not ( = ?auto_10200 ?auto_10203 ) ) ( not ( = ?auto_10200 ?auto_10204 ) ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10202 ?auto_10203 ) ) ( not ( = ?auto_10202 ?auto_10204 ) ) ( not ( = ?auto_10202 ?auto_10201 ) ) ( not ( = ?auto_10203 ?auto_10204 ) ) ( not ( = ?auto_10203 ?auto_10201 ) ) ( not ( = ?auto_10204 ?auto_10201 ) ) ( TRUCK-AT ?auto_10206 ?auto_10205 ) ( IN-CITY ?auto_10205 ?auto_10208 ) ( not ( = ?auto_10199 ?auto_10205 ) ) ( not ( = ?auto_10207 ?auto_10205 ) ) ( OBJ-AT ?auto_10204 ?auto_10205 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10204 ?auto_10206 ?auto_10205 )
      ( DELIVER-6PKG ?auto_10198 ?auto_10200 ?auto_10202 ?auto_10203 ?auto_10204 ?auto_10201 ?auto_10199 )
      ( DELIVER-6PKG-VERIFY ?auto_10198 ?auto_10200 ?auto_10202 ?auto_10203 ?auto_10204 ?auto_10201 ?auto_10199 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10216 - OBJ
      ?auto_10218 - OBJ
      ?auto_10220 - OBJ
      ?auto_10221 - OBJ
      ?auto_10222 - OBJ
      ?auto_10219 - OBJ
      ?auto_10217 - LOCATION
    )
    :vars
    (
      ?auto_10225 - LOCATION
      ?auto_10224 - CITY
      ?auto_10226 - LOCATION
      ?auto_10223 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10218 ?auto_10216 ) ( GREATER-THAN ?auto_10220 ?auto_10216 ) ( GREATER-THAN ?auto_10220 ?auto_10218 ) ( GREATER-THAN ?auto_10221 ?auto_10216 ) ( GREATER-THAN ?auto_10221 ?auto_10218 ) ( GREATER-THAN ?auto_10221 ?auto_10220 ) ( GREATER-THAN ?auto_10222 ?auto_10216 ) ( GREATER-THAN ?auto_10222 ?auto_10218 ) ( GREATER-THAN ?auto_10222 ?auto_10220 ) ( GREATER-THAN ?auto_10222 ?auto_10221 ) ( GREATER-THAN ?auto_10219 ?auto_10216 ) ( GREATER-THAN ?auto_10219 ?auto_10218 ) ( GREATER-THAN ?auto_10219 ?auto_10220 ) ( GREATER-THAN ?auto_10219 ?auto_10221 ) ( GREATER-THAN ?auto_10219 ?auto_10222 ) ( IN-CITY ?auto_10225 ?auto_10224 ) ( IN-CITY ?auto_10217 ?auto_10224 ) ( not ( = ?auto_10217 ?auto_10225 ) ) ( OBJ-AT ?auto_10219 ?auto_10225 ) ( OBJ-AT ?auto_10216 ?auto_10217 ) ( OBJ-AT ?auto_10218 ?auto_10217 ) ( OBJ-AT ?auto_10220 ?auto_10217 ) ( OBJ-AT ?auto_10221 ?auto_10217 ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10220 ) ) ( not ( = ?auto_10216 ?auto_10221 ) ) ( not ( = ?auto_10216 ?auto_10222 ) ) ( not ( = ?auto_10216 ?auto_10219 ) ) ( not ( = ?auto_10218 ?auto_10220 ) ) ( not ( = ?auto_10218 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10222 ) ) ( not ( = ?auto_10218 ?auto_10219 ) ) ( not ( = ?auto_10220 ?auto_10221 ) ) ( not ( = ?auto_10220 ?auto_10222 ) ) ( not ( = ?auto_10220 ?auto_10219 ) ) ( not ( = ?auto_10221 ?auto_10222 ) ) ( not ( = ?auto_10221 ?auto_10219 ) ) ( not ( = ?auto_10222 ?auto_10219 ) ) ( IN-CITY ?auto_10226 ?auto_10224 ) ( not ( = ?auto_10217 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( OBJ-AT ?auto_10222 ?auto_10226 ) ( TRUCK-AT ?auto_10223 ?auto_10217 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10223 ?auto_10217 ?auto_10226 ?auto_10224 )
      ( DELIVER-6PKG ?auto_10216 ?auto_10218 ?auto_10220 ?auto_10221 ?auto_10222 ?auto_10219 ?auto_10217 )
      ( DELIVER-6PKG-VERIFY ?auto_10216 ?auto_10218 ?auto_10220 ?auto_10221 ?auto_10222 ?auto_10219 ?auto_10217 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10234 - OBJ
      ?auto_10236 - OBJ
      ?auto_10238 - OBJ
      ?auto_10239 - OBJ
      ?auto_10240 - OBJ
      ?auto_10237 - OBJ
      ?auto_10235 - LOCATION
    )
    :vars
    (
      ?auto_10241 - LOCATION
      ?auto_10243 - CITY
      ?auto_10242 - LOCATION
      ?auto_10244 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10236 ?auto_10234 ) ( GREATER-THAN ?auto_10238 ?auto_10234 ) ( GREATER-THAN ?auto_10238 ?auto_10236 ) ( GREATER-THAN ?auto_10239 ?auto_10234 ) ( GREATER-THAN ?auto_10239 ?auto_10236 ) ( GREATER-THAN ?auto_10239 ?auto_10238 ) ( GREATER-THAN ?auto_10240 ?auto_10234 ) ( GREATER-THAN ?auto_10240 ?auto_10236 ) ( GREATER-THAN ?auto_10240 ?auto_10238 ) ( GREATER-THAN ?auto_10240 ?auto_10239 ) ( GREATER-THAN ?auto_10237 ?auto_10234 ) ( GREATER-THAN ?auto_10237 ?auto_10236 ) ( GREATER-THAN ?auto_10237 ?auto_10238 ) ( GREATER-THAN ?auto_10237 ?auto_10239 ) ( GREATER-THAN ?auto_10237 ?auto_10240 ) ( IN-CITY ?auto_10241 ?auto_10243 ) ( IN-CITY ?auto_10235 ?auto_10243 ) ( not ( = ?auto_10235 ?auto_10241 ) ) ( OBJ-AT ?auto_10237 ?auto_10241 ) ( OBJ-AT ?auto_10234 ?auto_10235 ) ( OBJ-AT ?auto_10236 ?auto_10235 ) ( OBJ-AT ?auto_10238 ?auto_10235 ) ( not ( = ?auto_10234 ?auto_10236 ) ) ( not ( = ?auto_10234 ?auto_10238 ) ) ( not ( = ?auto_10234 ?auto_10239 ) ) ( not ( = ?auto_10234 ?auto_10240 ) ) ( not ( = ?auto_10234 ?auto_10237 ) ) ( not ( = ?auto_10236 ?auto_10238 ) ) ( not ( = ?auto_10236 ?auto_10239 ) ) ( not ( = ?auto_10236 ?auto_10240 ) ) ( not ( = ?auto_10236 ?auto_10237 ) ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10240 ) ) ( not ( = ?auto_10238 ?auto_10237 ) ) ( not ( = ?auto_10239 ?auto_10240 ) ) ( not ( = ?auto_10239 ?auto_10237 ) ) ( not ( = ?auto_10240 ?auto_10237 ) ) ( IN-CITY ?auto_10242 ?auto_10243 ) ( not ( = ?auto_10235 ?auto_10242 ) ) ( not ( = ?auto_10241 ?auto_10242 ) ) ( OBJ-AT ?auto_10240 ?auto_10242 ) ( TRUCK-AT ?auto_10244 ?auto_10235 ) ( IN-TRUCK ?auto_10239 ?auto_10244 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10239 ?auto_10235 )
      ( DELIVER-6PKG ?auto_10234 ?auto_10236 ?auto_10238 ?auto_10239 ?auto_10240 ?auto_10237 ?auto_10235 )
      ( DELIVER-6PKG-VERIFY ?auto_10234 ?auto_10236 ?auto_10238 ?auto_10239 ?auto_10240 ?auto_10237 ?auto_10235 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10252 - OBJ
      ?auto_10254 - OBJ
      ?auto_10256 - OBJ
      ?auto_10257 - OBJ
      ?auto_10258 - OBJ
      ?auto_10255 - OBJ
      ?auto_10253 - LOCATION
    )
    :vars
    (
      ?auto_10262 - LOCATION
      ?auto_10259 - CITY
      ?auto_10261 - LOCATION
      ?auto_10260 - TRUCK
      ?auto_10263 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10254 ?auto_10252 ) ( GREATER-THAN ?auto_10256 ?auto_10252 ) ( GREATER-THAN ?auto_10256 ?auto_10254 ) ( GREATER-THAN ?auto_10257 ?auto_10252 ) ( GREATER-THAN ?auto_10257 ?auto_10254 ) ( GREATER-THAN ?auto_10257 ?auto_10256 ) ( GREATER-THAN ?auto_10258 ?auto_10252 ) ( GREATER-THAN ?auto_10258 ?auto_10254 ) ( GREATER-THAN ?auto_10258 ?auto_10256 ) ( GREATER-THAN ?auto_10258 ?auto_10257 ) ( GREATER-THAN ?auto_10255 ?auto_10252 ) ( GREATER-THAN ?auto_10255 ?auto_10254 ) ( GREATER-THAN ?auto_10255 ?auto_10256 ) ( GREATER-THAN ?auto_10255 ?auto_10257 ) ( GREATER-THAN ?auto_10255 ?auto_10258 ) ( IN-CITY ?auto_10262 ?auto_10259 ) ( IN-CITY ?auto_10253 ?auto_10259 ) ( not ( = ?auto_10253 ?auto_10262 ) ) ( OBJ-AT ?auto_10255 ?auto_10262 ) ( OBJ-AT ?auto_10252 ?auto_10253 ) ( OBJ-AT ?auto_10254 ?auto_10253 ) ( OBJ-AT ?auto_10256 ?auto_10253 ) ( not ( = ?auto_10252 ?auto_10254 ) ) ( not ( = ?auto_10252 ?auto_10256 ) ) ( not ( = ?auto_10252 ?auto_10257 ) ) ( not ( = ?auto_10252 ?auto_10258 ) ) ( not ( = ?auto_10252 ?auto_10255 ) ) ( not ( = ?auto_10254 ?auto_10256 ) ) ( not ( = ?auto_10254 ?auto_10257 ) ) ( not ( = ?auto_10254 ?auto_10258 ) ) ( not ( = ?auto_10254 ?auto_10255 ) ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( not ( = ?auto_10256 ?auto_10258 ) ) ( not ( = ?auto_10256 ?auto_10255 ) ) ( not ( = ?auto_10257 ?auto_10258 ) ) ( not ( = ?auto_10257 ?auto_10255 ) ) ( not ( = ?auto_10258 ?auto_10255 ) ) ( IN-CITY ?auto_10261 ?auto_10259 ) ( not ( = ?auto_10253 ?auto_10261 ) ) ( not ( = ?auto_10262 ?auto_10261 ) ) ( OBJ-AT ?auto_10258 ?auto_10261 ) ( IN-TRUCK ?auto_10257 ?auto_10260 ) ( TRUCK-AT ?auto_10260 ?auto_10263 ) ( IN-CITY ?auto_10263 ?auto_10259 ) ( not ( = ?auto_10253 ?auto_10263 ) ) ( not ( = ?auto_10262 ?auto_10263 ) ) ( not ( = ?auto_10261 ?auto_10263 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10260 ?auto_10263 ?auto_10253 ?auto_10259 )
      ( DELIVER-6PKG ?auto_10252 ?auto_10254 ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10255 ?auto_10253 )
      ( DELIVER-6PKG-VERIFY ?auto_10252 ?auto_10254 ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10255 ?auto_10253 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10271 - OBJ
      ?auto_10273 - OBJ
      ?auto_10275 - OBJ
      ?auto_10276 - OBJ
      ?auto_10277 - OBJ
      ?auto_10274 - OBJ
      ?auto_10272 - LOCATION
    )
    :vars
    (
      ?auto_10281 - LOCATION
      ?auto_10280 - CITY
      ?auto_10279 - LOCATION
      ?auto_10282 - TRUCK
      ?auto_10278 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10273 ?auto_10271 ) ( GREATER-THAN ?auto_10275 ?auto_10271 ) ( GREATER-THAN ?auto_10275 ?auto_10273 ) ( GREATER-THAN ?auto_10276 ?auto_10271 ) ( GREATER-THAN ?auto_10276 ?auto_10273 ) ( GREATER-THAN ?auto_10276 ?auto_10275 ) ( GREATER-THAN ?auto_10277 ?auto_10271 ) ( GREATER-THAN ?auto_10277 ?auto_10273 ) ( GREATER-THAN ?auto_10277 ?auto_10275 ) ( GREATER-THAN ?auto_10277 ?auto_10276 ) ( GREATER-THAN ?auto_10274 ?auto_10271 ) ( GREATER-THAN ?auto_10274 ?auto_10273 ) ( GREATER-THAN ?auto_10274 ?auto_10275 ) ( GREATER-THAN ?auto_10274 ?auto_10276 ) ( GREATER-THAN ?auto_10274 ?auto_10277 ) ( IN-CITY ?auto_10281 ?auto_10280 ) ( IN-CITY ?auto_10272 ?auto_10280 ) ( not ( = ?auto_10272 ?auto_10281 ) ) ( OBJ-AT ?auto_10274 ?auto_10281 ) ( OBJ-AT ?auto_10271 ?auto_10272 ) ( OBJ-AT ?auto_10273 ?auto_10272 ) ( OBJ-AT ?auto_10275 ?auto_10272 ) ( not ( = ?auto_10271 ?auto_10273 ) ) ( not ( = ?auto_10271 ?auto_10275 ) ) ( not ( = ?auto_10271 ?auto_10276 ) ) ( not ( = ?auto_10271 ?auto_10277 ) ) ( not ( = ?auto_10271 ?auto_10274 ) ) ( not ( = ?auto_10273 ?auto_10275 ) ) ( not ( = ?auto_10273 ?auto_10276 ) ) ( not ( = ?auto_10273 ?auto_10277 ) ) ( not ( = ?auto_10273 ?auto_10274 ) ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10274 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10274 ) ) ( not ( = ?auto_10277 ?auto_10274 ) ) ( IN-CITY ?auto_10279 ?auto_10280 ) ( not ( = ?auto_10272 ?auto_10279 ) ) ( not ( = ?auto_10281 ?auto_10279 ) ) ( OBJ-AT ?auto_10277 ?auto_10279 ) ( TRUCK-AT ?auto_10282 ?auto_10278 ) ( IN-CITY ?auto_10278 ?auto_10280 ) ( not ( = ?auto_10272 ?auto_10278 ) ) ( not ( = ?auto_10281 ?auto_10278 ) ) ( not ( = ?auto_10279 ?auto_10278 ) ) ( OBJ-AT ?auto_10276 ?auto_10278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10276 ?auto_10282 ?auto_10278 )
      ( DELIVER-6PKG ?auto_10271 ?auto_10273 ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10274 ?auto_10272 )
      ( DELIVER-6PKG-VERIFY ?auto_10271 ?auto_10273 ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10274 ?auto_10272 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10290 - OBJ
      ?auto_10292 - OBJ
      ?auto_10294 - OBJ
      ?auto_10295 - OBJ
      ?auto_10296 - OBJ
      ?auto_10293 - OBJ
      ?auto_10291 - LOCATION
    )
    :vars
    (
      ?auto_10301 - LOCATION
      ?auto_10300 - CITY
      ?auto_10299 - LOCATION
      ?auto_10297 - LOCATION
      ?auto_10298 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10292 ?auto_10290 ) ( GREATER-THAN ?auto_10294 ?auto_10290 ) ( GREATER-THAN ?auto_10294 ?auto_10292 ) ( GREATER-THAN ?auto_10295 ?auto_10290 ) ( GREATER-THAN ?auto_10295 ?auto_10292 ) ( GREATER-THAN ?auto_10295 ?auto_10294 ) ( GREATER-THAN ?auto_10296 ?auto_10290 ) ( GREATER-THAN ?auto_10296 ?auto_10292 ) ( GREATER-THAN ?auto_10296 ?auto_10294 ) ( GREATER-THAN ?auto_10296 ?auto_10295 ) ( GREATER-THAN ?auto_10293 ?auto_10290 ) ( GREATER-THAN ?auto_10293 ?auto_10292 ) ( GREATER-THAN ?auto_10293 ?auto_10294 ) ( GREATER-THAN ?auto_10293 ?auto_10295 ) ( GREATER-THAN ?auto_10293 ?auto_10296 ) ( IN-CITY ?auto_10301 ?auto_10300 ) ( IN-CITY ?auto_10291 ?auto_10300 ) ( not ( = ?auto_10291 ?auto_10301 ) ) ( OBJ-AT ?auto_10293 ?auto_10301 ) ( OBJ-AT ?auto_10290 ?auto_10291 ) ( OBJ-AT ?auto_10292 ?auto_10291 ) ( OBJ-AT ?auto_10294 ?auto_10291 ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10294 ) ) ( not ( = ?auto_10290 ?auto_10295 ) ) ( not ( = ?auto_10290 ?auto_10296 ) ) ( not ( = ?auto_10290 ?auto_10293 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( not ( = ?auto_10292 ?auto_10295 ) ) ( not ( = ?auto_10292 ?auto_10296 ) ) ( not ( = ?auto_10292 ?auto_10293 ) ) ( not ( = ?auto_10294 ?auto_10295 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10293 ) ) ( not ( = ?auto_10295 ?auto_10296 ) ) ( not ( = ?auto_10295 ?auto_10293 ) ) ( not ( = ?auto_10296 ?auto_10293 ) ) ( IN-CITY ?auto_10299 ?auto_10300 ) ( not ( = ?auto_10291 ?auto_10299 ) ) ( not ( = ?auto_10301 ?auto_10299 ) ) ( OBJ-AT ?auto_10296 ?auto_10299 ) ( IN-CITY ?auto_10297 ?auto_10300 ) ( not ( = ?auto_10291 ?auto_10297 ) ) ( not ( = ?auto_10301 ?auto_10297 ) ) ( not ( = ?auto_10299 ?auto_10297 ) ) ( OBJ-AT ?auto_10295 ?auto_10297 ) ( TRUCK-AT ?auto_10298 ?auto_10291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10298 ?auto_10291 ?auto_10297 ?auto_10300 )
      ( DELIVER-6PKG ?auto_10290 ?auto_10292 ?auto_10294 ?auto_10295 ?auto_10296 ?auto_10293 ?auto_10291 )
      ( DELIVER-6PKG-VERIFY ?auto_10290 ?auto_10292 ?auto_10294 ?auto_10295 ?auto_10296 ?auto_10293 ?auto_10291 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10309 - OBJ
      ?auto_10311 - OBJ
      ?auto_10313 - OBJ
      ?auto_10314 - OBJ
      ?auto_10315 - OBJ
      ?auto_10312 - OBJ
      ?auto_10310 - LOCATION
    )
    :vars
    (
      ?auto_10317 - LOCATION
      ?auto_10319 - CITY
      ?auto_10318 - LOCATION
      ?auto_10316 - LOCATION
      ?auto_10320 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10311 ?auto_10309 ) ( GREATER-THAN ?auto_10313 ?auto_10309 ) ( GREATER-THAN ?auto_10313 ?auto_10311 ) ( GREATER-THAN ?auto_10314 ?auto_10309 ) ( GREATER-THAN ?auto_10314 ?auto_10311 ) ( GREATER-THAN ?auto_10314 ?auto_10313 ) ( GREATER-THAN ?auto_10315 ?auto_10309 ) ( GREATER-THAN ?auto_10315 ?auto_10311 ) ( GREATER-THAN ?auto_10315 ?auto_10313 ) ( GREATER-THAN ?auto_10315 ?auto_10314 ) ( GREATER-THAN ?auto_10312 ?auto_10309 ) ( GREATER-THAN ?auto_10312 ?auto_10311 ) ( GREATER-THAN ?auto_10312 ?auto_10313 ) ( GREATER-THAN ?auto_10312 ?auto_10314 ) ( GREATER-THAN ?auto_10312 ?auto_10315 ) ( IN-CITY ?auto_10317 ?auto_10319 ) ( IN-CITY ?auto_10310 ?auto_10319 ) ( not ( = ?auto_10310 ?auto_10317 ) ) ( OBJ-AT ?auto_10312 ?auto_10317 ) ( OBJ-AT ?auto_10309 ?auto_10310 ) ( OBJ-AT ?auto_10311 ?auto_10310 ) ( not ( = ?auto_10309 ?auto_10311 ) ) ( not ( = ?auto_10309 ?auto_10313 ) ) ( not ( = ?auto_10309 ?auto_10314 ) ) ( not ( = ?auto_10309 ?auto_10315 ) ) ( not ( = ?auto_10309 ?auto_10312 ) ) ( not ( = ?auto_10311 ?auto_10313 ) ) ( not ( = ?auto_10311 ?auto_10314 ) ) ( not ( = ?auto_10311 ?auto_10315 ) ) ( not ( = ?auto_10311 ?auto_10312 ) ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10312 ) ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10312 ) ) ( not ( = ?auto_10315 ?auto_10312 ) ) ( IN-CITY ?auto_10318 ?auto_10319 ) ( not ( = ?auto_10310 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( OBJ-AT ?auto_10315 ?auto_10318 ) ( IN-CITY ?auto_10316 ?auto_10319 ) ( not ( = ?auto_10310 ?auto_10316 ) ) ( not ( = ?auto_10317 ?auto_10316 ) ) ( not ( = ?auto_10318 ?auto_10316 ) ) ( OBJ-AT ?auto_10314 ?auto_10316 ) ( TRUCK-AT ?auto_10320 ?auto_10310 ) ( IN-TRUCK ?auto_10313 ?auto_10320 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10313 ?auto_10310 )
      ( DELIVER-6PKG ?auto_10309 ?auto_10311 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10312 ?auto_10310 )
      ( DELIVER-6PKG-VERIFY ?auto_10309 ?auto_10311 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10312 ?auto_10310 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10328 - OBJ
      ?auto_10330 - OBJ
      ?auto_10332 - OBJ
      ?auto_10333 - OBJ
      ?auto_10334 - OBJ
      ?auto_10331 - OBJ
      ?auto_10329 - LOCATION
    )
    :vars
    (
      ?auto_10338 - LOCATION
      ?auto_10339 - CITY
      ?auto_10337 - LOCATION
      ?auto_10335 - LOCATION
      ?auto_10336 - TRUCK
      ?auto_10340 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10330 ?auto_10328 ) ( GREATER-THAN ?auto_10332 ?auto_10328 ) ( GREATER-THAN ?auto_10332 ?auto_10330 ) ( GREATER-THAN ?auto_10333 ?auto_10328 ) ( GREATER-THAN ?auto_10333 ?auto_10330 ) ( GREATER-THAN ?auto_10333 ?auto_10332 ) ( GREATER-THAN ?auto_10334 ?auto_10328 ) ( GREATER-THAN ?auto_10334 ?auto_10330 ) ( GREATER-THAN ?auto_10334 ?auto_10332 ) ( GREATER-THAN ?auto_10334 ?auto_10333 ) ( GREATER-THAN ?auto_10331 ?auto_10328 ) ( GREATER-THAN ?auto_10331 ?auto_10330 ) ( GREATER-THAN ?auto_10331 ?auto_10332 ) ( GREATER-THAN ?auto_10331 ?auto_10333 ) ( GREATER-THAN ?auto_10331 ?auto_10334 ) ( IN-CITY ?auto_10338 ?auto_10339 ) ( IN-CITY ?auto_10329 ?auto_10339 ) ( not ( = ?auto_10329 ?auto_10338 ) ) ( OBJ-AT ?auto_10331 ?auto_10338 ) ( OBJ-AT ?auto_10328 ?auto_10329 ) ( OBJ-AT ?auto_10330 ?auto_10329 ) ( not ( = ?auto_10328 ?auto_10330 ) ) ( not ( = ?auto_10328 ?auto_10332 ) ) ( not ( = ?auto_10328 ?auto_10333 ) ) ( not ( = ?auto_10328 ?auto_10334 ) ) ( not ( = ?auto_10328 ?auto_10331 ) ) ( not ( = ?auto_10330 ?auto_10332 ) ) ( not ( = ?auto_10330 ?auto_10333 ) ) ( not ( = ?auto_10330 ?auto_10334 ) ) ( not ( = ?auto_10330 ?auto_10331 ) ) ( not ( = ?auto_10332 ?auto_10333 ) ) ( not ( = ?auto_10332 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10331 ) ) ( not ( = ?auto_10333 ?auto_10334 ) ) ( not ( = ?auto_10333 ?auto_10331 ) ) ( not ( = ?auto_10334 ?auto_10331 ) ) ( IN-CITY ?auto_10337 ?auto_10339 ) ( not ( = ?auto_10329 ?auto_10337 ) ) ( not ( = ?auto_10338 ?auto_10337 ) ) ( OBJ-AT ?auto_10334 ?auto_10337 ) ( IN-CITY ?auto_10335 ?auto_10339 ) ( not ( = ?auto_10329 ?auto_10335 ) ) ( not ( = ?auto_10338 ?auto_10335 ) ) ( not ( = ?auto_10337 ?auto_10335 ) ) ( OBJ-AT ?auto_10333 ?auto_10335 ) ( IN-TRUCK ?auto_10332 ?auto_10336 ) ( TRUCK-AT ?auto_10336 ?auto_10340 ) ( IN-CITY ?auto_10340 ?auto_10339 ) ( not ( = ?auto_10329 ?auto_10340 ) ) ( not ( = ?auto_10338 ?auto_10340 ) ) ( not ( = ?auto_10337 ?auto_10340 ) ) ( not ( = ?auto_10335 ?auto_10340 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10336 ?auto_10340 ?auto_10329 ?auto_10339 )
      ( DELIVER-6PKG ?auto_10328 ?auto_10330 ?auto_10332 ?auto_10333 ?auto_10334 ?auto_10331 ?auto_10329 )
      ( DELIVER-6PKG-VERIFY ?auto_10328 ?auto_10330 ?auto_10332 ?auto_10333 ?auto_10334 ?auto_10331 ?auto_10329 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10348 - OBJ
      ?auto_10350 - OBJ
      ?auto_10352 - OBJ
      ?auto_10353 - OBJ
      ?auto_10354 - OBJ
      ?auto_10351 - OBJ
      ?auto_10349 - LOCATION
    )
    :vars
    (
      ?auto_10358 - LOCATION
      ?auto_10355 - CITY
      ?auto_10356 - LOCATION
      ?auto_10359 - LOCATION
      ?auto_10357 - TRUCK
      ?auto_10360 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10350 ?auto_10348 ) ( GREATER-THAN ?auto_10352 ?auto_10348 ) ( GREATER-THAN ?auto_10352 ?auto_10350 ) ( GREATER-THAN ?auto_10353 ?auto_10348 ) ( GREATER-THAN ?auto_10353 ?auto_10350 ) ( GREATER-THAN ?auto_10353 ?auto_10352 ) ( GREATER-THAN ?auto_10354 ?auto_10348 ) ( GREATER-THAN ?auto_10354 ?auto_10350 ) ( GREATER-THAN ?auto_10354 ?auto_10352 ) ( GREATER-THAN ?auto_10354 ?auto_10353 ) ( GREATER-THAN ?auto_10351 ?auto_10348 ) ( GREATER-THAN ?auto_10351 ?auto_10350 ) ( GREATER-THAN ?auto_10351 ?auto_10352 ) ( GREATER-THAN ?auto_10351 ?auto_10353 ) ( GREATER-THAN ?auto_10351 ?auto_10354 ) ( IN-CITY ?auto_10358 ?auto_10355 ) ( IN-CITY ?auto_10349 ?auto_10355 ) ( not ( = ?auto_10349 ?auto_10358 ) ) ( OBJ-AT ?auto_10351 ?auto_10358 ) ( OBJ-AT ?auto_10348 ?auto_10349 ) ( OBJ-AT ?auto_10350 ?auto_10349 ) ( not ( = ?auto_10348 ?auto_10350 ) ) ( not ( = ?auto_10348 ?auto_10352 ) ) ( not ( = ?auto_10348 ?auto_10353 ) ) ( not ( = ?auto_10348 ?auto_10354 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10352 ) ) ( not ( = ?auto_10350 ?auto_10353 ) ) ( not ( = ?auto_10350 ?auto_10354 ) ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( not ( = ?auto_10352 ?auto_10353 ) ) ( not ( = ?auto_10352 ?auto_10354 ) ) ( not ( = ?auto_10352 ?auto_10351 ) ) ( not ( = ?auto_10353 ?auto_10354 ) ) ( not ( = ?auto_10353 ?auto_10351 ) ) ( not ( = ?auto_10354 ?auto_10351 ) ) ( IN-CITY ?auto_10356 ?auto_10355 ) ( not ( = ?auto_10349 ?auto_10356 ) ) ( not ( = ?auto_10358 ?auto_10356 ) ) ( OBJ-AT ?auto_10354 ?auto_10356 ) ( IN-CITY ?auto_10359 ?auto_10355 ) ( not ( = ?auto_10349 ?auto_10359 ) ) ( not ( = ?auto_10358 ?auto_10359 ) ) ( not ( = ?auto_10356 ?auto_10359 ) ) ( OBJ-AT ?auto_10353 ?auto_10359 ) ( TRUCK-AT ?auto_10357 ?auto_10360 ) ( IN-CITY ?auto_10360 ?auto_10355 ) ( not ( = ?auto_10349 ?auto_10360 ) ) ( not ( = ?auto_10358 ?auto_10360 ) ) ( not ( = ?auto_10356 ?auto_10360 ) ) ( not ( = ?auto_10359 ?auto_10360 ) ) ( OBJ-AT ?auto_10352 ?auto_10360 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10352 ?auto_10357 ?auto_10360 )
      ( DELIVER-6PKG ?auto_10348 ?auto_10350 ?auto_10352 ?auto_10353 ?auto_10354 ?auto_10351 ?auto_10349 )
      ( DELIVER-6PKG-VERIFY ?auto_10348 ?auto_10350 ?auto_10352 ?auto_10353 ?auto_10354 ?auto_10351 ?auto_10349 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10368 - OBJ
      ?auto_10370 - OBJ
      ?auto_10372 - OBJ
      ?auto_10373 - OBJ
      ?auto_10374 - OBJ
      ?auto_10371 - OBJ
      ?auto_10369 - LOCATION
    )
    :vars
    (
      ?auto_10375 - LOCATION
      ?auto_10380 - CITY
      ?auto_10377 - LOCATION
      ?auto_10378 - LOCATION
      ?auto_10379 - LOCATION
      ?auto_10376 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10370 ?auto_10368 ) ( GREATER-THAN ?auto_10372 ?auto_10368 ) ( GREATER-THAN ?auto_10372 ?auto_10370 ) ( GREATER-THAN ?auto_10373 ?auto_10368 ) ( GREATER-THAN ?auto_10373 ?auto_10370 ) ( GREATER-THAN ?auto_10373 ?auto_10372 ) ( GREATER-THAN ?auto_10374 ?auto_10368 ) ( GREATER-THAN ?auto_10374 ?auto_10370 ) ( GREATER-THAN ?auto_10374 ?auto_10372 ) ( GREATER-THAN ?auto_10374 ?auto_10373 ) ( GREATER-THAN ?auto_10371 ?auto_10368 ) ( GREATER-THAN ?auto_10371 ?auto_10370 ) ( GREATER-THAN ?auto_10371 ?auto_10372 ) ( GREATER-THAN ?auto_10371 ?auto_10373 ) ( GREATER-THAN ?auto_10371 ?auto_10374 ) ( IN-CITY ?auto_10375 ?auto_10380 ) ( IN-CITY ?auto_10369 ?auto_10380 ) ( not ( = ?auto_10369 ?auto_10375 ) ) ( OBJ-AT ?auto_10371 ?auto_10375 ) ( OBJ-AT ?auto_10368 ?auto_10369 ) ( OBJ-AT ?auto_10370 ?auto_10369 ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10372 ) ) ( not ( = ?auto_10368 ?auto_10373 ) ) ( not ( = ?auto_10368 ?auto_10374 ) ) ( not ( = ?auto_10368 ?auto_10371 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10370 ?auto_10373 ) ) ( not ( = ?auto_10370 ?auto_10374 ) ) ( not ( = ?auto_10370 ?auto_10371 ) ) ( not ( = ?auto_10372 ?auto_10373 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10372 ?auto_10371 ) ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10371 ) ) ( not ( = ?auto_10374 ?auto_10371 ) ) ( IN-CITY ?auto_10377 ?auto_10380 ) ( not ( = ?auto_10369 ?auto_10377 ) ) ( not ( = ?auto_10375 ?auto_10377 ) ) ( OBJ-AT ?auto_10374 ?auto_10377 ) ( IN-CITY ?auto_10378 ?auto_10380 ) ( not ( = ?auto_10369 ?auto_10378 ) ) ( not ( = ?auto_10375 ?auto_10378 ) ) ( not ( = ?auto_10377 ?auto_10378 ) ) ( OBJ-AT ?auto_10373 ?auto_10378 ) ( IN-CITY ?auto_10379 ?auto_10380 ) ( not ( = ?auto_10369 ?auto_10379 ) ) ( not ( = ?auto_10375 ?auto_10379 ) ) ( not ( = ?auto_10377 ?auto_10379 ) ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( OBJ-AT ?auto_10372 ?auto_10379 ) ( TRUCK-AT ?auto_10376 ?auto_10369 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10376 ?auto_10369 ?auto_10379 ?auto_10380 )
      ( DELIVER-6PKG ?auto_10368 ?auto_10370 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10371 ?auto_10369 )
      ( DELIVER-6PKG-VERIFY ?auto_10368 ?auto_10370 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10371 ?auto_10369 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10388 - OBJ
      ?auto_10390 - OBJ
      ?auto_10392 - OBJ
      ?auto_10393 - OBJ
      ?auto_10394 - OBJ
      ?auto_10391 - OBJ
      ?auto_10389 - LOCATION
    )
    :vars
    (
      ?auto_10398 - LOCATION
      ?auto_10396 - CITY
      ?auto_10400 - LOCATION
      ?auto_10397 - LOCATION
      ?auto_10395 - LOCATION
      ?auto_10399 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10390 ?auto_10388 ) ( GREATER-THAN ?auto_10392 ?auto_10388 ) ( GREATER-THAN ?auto_10392 ?auto_10390 ) ( GREATER-THAN ?auto_10393 ?auto_10388 ) ( GREATER-THAN ?auto_10393 ?auto_10390 ) ( GREATER-THAN ?auto_10393 ?auto_10392 ) ( GREATER-THAN ?auto_10394 ?auto_10388 ) ( GREATER-THAN ?auto_10394 ?auto_10390 ) ( GREATER-THAN ?auto_10394 ?auto_10392 ) ( GREATER-THAN ?auto_10394 ?auto_10393 ) ( GREATER-THAN ?auto_10391 ?auto_10388 ) ( GREATER-THAN ?auto_10391 ?auto_10390 ) ( GREATER-THAN ?auto_10391 ?auto_10392 ) ( GREATER-THAN ?auto_10391 ?auto_10393 ) ( GREATER-THAN ?auto_10391 ?auto_10394 ) ( IN-CITY ?auto_10398 ?auto_10396 ) ( IN-CITY ?auto_10389 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10398 ) ) ( OBJ-AT ?auto_10391 ?auto_10398 ) ( OBJ-AT ?auto_10388 ?auto_10389 ) ( not ( = ?auto_10388 ?auto_10390 ) ) ( not ( = ?auto_10388 ?auto_10392 ) ) ( not ( = ?auto_10388 ?auto_10393 ) ) ( not ( = ?auto_10388 ?auto_10394 ) ) ( not ( = ?auto_10388 ?auto_10391 ) ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10390 ?auto_10393 ) ) ( not ( = ?auto_10390 ?auto_10394 ) ) ( not ( = ?auto_10390 ?auto_10391 ) ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( not ( = ?auto_10392 ?auto_10394 ) ) ( not ( = ?auto_10392 ?auto_10391 ) ) ( not ( = ?auto_10393 ?auto_10394 ) ) ( not ( = ?auto_10393 ?auto_10391 ) ) ( not ( = ?auto_10394 ?auto_10391 ) ) ( IN-CITY ?auto_10400 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10400 ) ) ( not ( = ?auto_10398 ?auto_10400 ) ) ( OBJ-AT ?auto_10394 ?auto_10400 ) ( IN-CITY ?auto_10397 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10397 ) ) ( not ( = ?auto_10398 ?auto_10397 ) ) ( not ( = ?auto_10400 ?auto_10397 ) ) ( OBJ-AT ?auto_10393 ?auto_10397 ) ( IN-CITY ?auto_10395 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10395 ) ) ( not ( = ?auto_10398 ?auto_10395 ) ) ( not ( = ?auto_10400 ?auto_10395 ) ) ( not ( = ?auto_10397 ?auto_10395 ) ) ( OBJ-AT ?auto_10392 ?auto_10395 ) ( TRUCK-AT ?auto_10399 ?auto_10389 ) ( IN-TRUCK ?auto_10390 ?auto_10399 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10390 ?auto_10389 )
      ( DELIVER-6PKG ?auto_10388 ?auto_10390 ?auto_10392 ?auto_10393 ?auto_10394 ?auto_10391 ?auto_10389 )
      ( DELIVER-6PKG-VERIFY ?auto_10388 ?auto_10390 ?auto_10392 ?auto_10393 ?auto_10394 ?auto_10391 ?auto_10389 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10408 - OBJ
      ?auto_10410 - OBJ
      ?auto_10412 - OBJ
      ?auto_10413 - OBJ
      ?auto_10414 - OBJ
      ?auto_10411 - OBJ
      ?auto_10409 - LOCATION
    )
    :vars
    (
      ?auto_10420 - LOCATION
      ?auto_10415 - CITY
      ?auto_10417 - LOCATION
      ?auto_10416 - LOCATION
      ?auto_10419 - LOCATION
      ?auto_10418 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10410 ?auto_10408 ) ( GREATER-THAN ?auto_10412 ?auto_10408 ) ( GREATER-THAN ?auto_10412 ?auto_10410 ) ( GREATER-THAN ?auto_10413 ?auto_10408 ) ( GREATER-THAN ?auto_10413 ?auto_10410 ) ( GREATER-THAN ?auto_10413 ?auto_10412 ) ( GREATER-THAN ?auto_10414 ?auto_10408 ) ( GREATER-THAN ?auto_10414 ?auto_10410 ) ( GREATER-THAN ?auto_10414 ?auto_10412 ) ( GREATER-THAN ?auto_10414 ?auto_10413 ) ( GREATER-THAN ?auto_10411 ?auto_10408 ) ( GREATER-THAN ?auto_10411 ?auto_10410 ) ( GREATER-THAN ?auto_10411 ?auto_10412 ) ( GREATER-THAN ?auto_10411 ?auto_10413 ) ( GREATER-THAN ?auto_10411 ?auto_10414 ) ( IN-CITY ?auto_10420 ?auto_10415 ) ( IN-CITY ?auto_10409 ?auto_10415 ) ( not ( = ?auto_10409 ?auto_10420 ) ) ( OBJ-AT ?auto_10411 ?auto_10420 ) ( OBJ-AT ?auto_10408 ?auto_10409 ) ( not ( = ?auto_10408 ?auto_10410 ) ) ( not ( = ?auto_10408 ?auto_10412 ) ) ( not ( = ?auto_10408 ?auto_10413 ) ) ( not ( = ?auto_10408 ?auto_10414 ) ) ( not ( = ?auto_10408 ?auto_10411 ) ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( not ( = ?auto_10410 ?auto_10414 ) ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( not ( = ?auto_10412 ?auto_10413 ) ) ( not ( = ?auto_10412 ?auto_10414 ) ) ( not ( = ?auto_10412 ?auto_10411 ) ) ( not ( = ?auto_10413 ?auto_10414 ) ) ( not ( = ?auto_10413 ?auto_10411 ) ) ( not ( = ?auto_10414 ?auto_10411 ) ) ( IN-CITY ?auto_10417 ?auto_10415 ) ( not ( = ?auto_10409 ?auto_10417 ) ) ( not ( = ?auto_10420 ?auto_10417 ) ) ( OBJ-AT ?auto_10414 ?auto_10417 ) ( IN-CITY ?auto_10416 ?auto_10415 ) ( not ( = ?auto_10409 ?auto_10416 ) ) ( not ( = ?auto_10420 ?auto_10416 ) ) ( not ( = ?auto_10417 ?auto_10416 ) ) ( OBJ-AT ?auto_10413 ?auto_10416 ) ( IN-CITY ?auto_10419 ?auto_10415 ) ( not ( = ?auto_10409 ?auto_10419 ) ) ( not ( = ?auto_10420 ?auto_10419 ) ) ( not ( = ?auto_10417 ?auto_10419 ) ) ( not ( = ?auto_10416 ?auto_10419 ) ) ( OBJ-AT ?auto_10412 ?auto_10419 ) ( IN-TRUCK ?auto_10410 ?auto_10418 ) ( TRUCK-AT ?auto_10418 ?auto_10420 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10418 ?auto_10420 ?auto_10409 ?auto_10415 )
      ( DELIVER-6PKG ?auto_10408 ?auto_10410 ?auto_10412 ?auto_10413 ?auto_10414 ?auto_10411 ?auto_10409 )
      ( DELIVER-6PKG-VERIFY ?auto_10408 ?auto_10410 ?auto_10412 ?auto_10413 ?auto_10414 ?auto_10411 ?auto_10409 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10428 - OBJ
      ?auto_10430 - OBJ
      ?auto_10432 - OBJ
      ?auto_10433 - OBJ
      ?auto_10434 - OBJ
      ?auto_10431 - OBJ
      ?auto_10429 - LOCATION
    )
    :vars
    (
      ?auto_10437 - LOCATION
      ?auto_10440 - CITY
      ?auto_10438 - LOCATION
      ?auto_10435 - LOCATION
      ?auto_10439 - LOCATION
      ?auto_10436 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10430 ?auto_10428 ) ( GREATER-THAN ?auto_10432 ?auto_10428 ) ( GREATER-THAN ?auto_10432 ?auto_10430 ) ( GREATER-THAN ?auto_10433 ?auto_10428 ) ( GREATER-THAN ?auto_10433 ?auto_10430 ) ( GREATER-THAN ?auto_10433 ?auto_10432 ) ( GREATER-THAN ?auto_10434 ?auto_10428 ) ( GREATER-THAN ?auto_10434 ?auto_10430 ) ( GREATER-THAN ?auto_10434 ?auto_10432 ) ( GREATER-THAN ?auto_10434 ?auto_10433 ) ( GREATER-THAN ?auto_10431 ?auto_10428 ) ( GREATER-THAN ?auto_10431 ?auto_10430 ) ( GREATER-THAN ?auto_10431 ?auto_10432 ) ( GREATER-THAN ?auto_10431 ?auto_10433 ) ( GREATER-THAN ?auto_10431 ?auto_10434 ) ( IN-CITY ?auto_10437 ?auto_10440 ) ( IN-CITY ?auto_10429 ?auto_10440 ) ( not ( = ?auto_10429 ?auto_10437 ) ) ( OBJ-AT ?auto_10431 ?auto_10437 ) ( OBJ-AT ?auto_10428 ?auto_10429 ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10432 ) ) ( not ( = ?auto_10428 ?auto_10433 ) ) ( not ( = ?auto_10428 ?auto_10434 ) ) ( not ( = ?auto_10428 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10430 ?auto_10433 ) ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10432 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10431 ) ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( not ( = ?auto_10433 ?auto_10431 ) ) ( not ( = ?auto_10434 ?auto_10431 ) ) ( IN-CITY ?auto_10438 ?auto_10440 ) ( not ( = ?auto_10429 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10438 ) ) ( OBJ-AT ?auto_10434 ?auto_10438 ) ( IN-CITY ?auto_10435 ?auto_10440 ) ( not ( = ?auto_10429 ?auto_10435 ) ) ( not ( = ?auto_10437 ?auto_10435 ) ) ( not ( = ?auto_10438 ?auto_10435 ) ) ( OBJ-AT ?auto_10433 ?auto_10435 ) ( IN-CITY ?auto_10439 ?auto_10440 ) ( not ( = ?auto_10429 ?auto_10439 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( not ( = ?auto_10435 ?auto_10439 ) ) ( OBJ-AT ?auto_10432 ?auto_10439 ) ( TRUCK-AT ?auto_10436 ?auto_10437 ) ( OBJ-AT ?auto_10430 ?auto_10437 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10430 ?auto_10436 ?auto_10437 )
      ( DELIVER-6PKG ?auto_10428 ?auto_10430 ?auto_10432 ?auto_10433 ?auto_10434 ?auto_10431 ?auto_10429 )
      ( DELIVER-6PKG-VERIFY ?auto_10428 ?auto_10430 ?auto_10432 ?auto_10433 ?auto_10434 ?auto_10431 ?auto_10429 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10448 - OBJ
      ?auto_10450 - OBJ
      ?auto_10452 - OBJ
      ?auto_10453 - OBJ
      ?auto_10454 - OBJ
      ?auto_10451 - OBJ
      ?auto_10449 - LOCATION
    )
    :vars
    (
      ?auto_10456 - LOCATION
      ?auto_10460 - CITY
      ?auto_10458 - LOCATION
      ?auto_10457 - LOCATION
      ?auto_10455 - LOCATION
      ?auto_10459 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10450 ?auto_10448 ) ( GREATER-THAN ?auto_10452 ?auto_10448 ) ( GREATER-THAN ?auto_10452 ?auto_10450 ) ( GREATER-THAN ?auto_10453 ?auto_10448 ) ( GREATER-THAN ?auto_10453 ?auto_10450 ) ( GREATER-THAN ?auto_10453 ?auto_10452 ) ( GREATER-THAN ?auto_10454 ?auto_10448 ) ( GREATER-THAN ?auto_10454 ?auto_10450 ) ( GREATER-THAN ?auto_10454 ?auto_10452 ) ( GREATER-THAN ?auto_10454 ?auto_10453 ) ( GREATER-THAN ?auto_10451 ?auto_10448 ) ( GREATER-THAN ?auto_10451 ?auto_10450 ) ( GREATER-THAN ?auto_10451 ?auto_10452 ) ( GREATER-THAN ?auto_10451 ?auto_10453 ) ( GREATER-THAN ?auto_10451 ?auto_10454 ) ( IN-CITY ?auto_10456 ?auto_10460 ) ( IN-CITY ?auto_10449 ?auto_10460 ) ( not ( = ?auto_10449 ?auto_10456 ) ) ( OBJ-AT ?auto_10451 ?auto_10456 ) ( OBJ-AT ?auto_10448 ?auto_10449 ) ( not ( = ?auto_10448 ?auto_10450 ) ) ( not ( = ?auto_10448 ?auto_10452 ) ) ( not ( = ?auto_10448 ?auto_10453 ) ) ( not ( = ?auto_10448 ?auto_10454 ) ) ( not ( = ?auto_10448 ?auto_10451 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10453 ) ) ( not ( = ?auto_10450 ?auto_10454 ) ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( not ( = ?auto_10452 ?auto_10453 ) ) ( not ( = ?auto_10452 ?auto_10454 ) ) ( not ( = ?auto_10452 ?auto_10451 ) ) ( not ( = ?auto_10453 ?auto_10454 ) ) ( not ( = ?auto_10453 ?auto_10451 ) ) ( not ( = ?auto_10454 ?auto_10451 ) ) ( IN-CITY ?auto_10458 ?auto_10460 ) ( not ( = ?auto_10449 ?auto_10458 ) ) ( not ( = ?auto_10456 ?auto_10458 ) ) ( OBJ-AT ?auto_10454 ?auto_10458 ) ( IN-CITY ?auto_10457 ?auto_10460 ) ( not ( = ?auto_10449 ?auto_10457 ) ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( not ( = ?auto_10458 ?auto_10457 ) ) ( OBJ-AT ?auto_10453 ?auto_10457 ) ( IN-CITY ?auto_10455 ?auto_10460 ) ( not ( = ?auto_10449 ?auto_10455 ) ) ( not ( = ?auto_10456 ?auto_10455 ) ) ( not ( = ?auto_10458 ?auto_10455 ) ) ( not ( = ?auto_10457 ?auto_10455 ) ) ( OBJ-AT ?auto_10452 ?auto_10455 ) ( OBJ-AT ?auto_10450 ?auto_10456 ) ( TRUCK-AT ?auto_10459 ?auto_10449 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10459 ?auto_10449 ?auto_10456 ?auto_10460 )
      ( DELIVER-6PKG ?auto_10448 ?auto_10450 ?auto_10452 ?auto_10453 ?auto_10454 ?auto_10451 ?auto_10449 )
      ( DELIVER-6PKG-VERIFY ?auto_10448 ?auto_10450 ?auto_10452 ?auto_10453 ?auto_10454 ?auto_10451 ?auto_10449 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10468 - OBJ
      ?auto_10470 - OBJ
      ?auto_10472 - OBJ
      ?auto_10473 - OBJ
      ?auto_10474 - OBJ
      ?auto_10471 - OBJ
      ?auto_10469 - LOCATION
    )
    :vars
    (
      ?auto_10477 - LOCATION
      ?auto_10478 - CITY
      ?auto_10476 - LOCATION
      ?auto_10475 - LOCATION
      ?auto_10479 - LOCATION
      ?auto_10480 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10470 ?auto_10468 ) ( GREATER-THAN ?auto_10472 ?auto_10468 ) ( GREATER-THAN ?auto_10472 ?auto_10470 ) ( GREATER-THAN ?auto_10473 ?auto_10468 ) ( GREATER-THAN ?auto_10473 ?auto_10470 ) ( GREATER-THAN ?auto_10473 ?auto_10472 ) ( GREATER-THAN ?auto_10474 ?auto_10468 ) ( GREATER-THAN ?auto_10474 ?auto_10470 ) ( GREATER-THAN ?auto_10474 ?auto_10472 ) ( GREATER-THAN ?auto_10474 ?auto_10473 ) ( GREATER-THAN ?auto_10471 ?auto_10468 ) ( GREATER-THAN ?auto_10471 ?auto_10470 ) ( GREATER-THAN ?auto_10471 ?auto_10472 ) ( GREATER-THAN ?auto_10471 ?auto_10473 ) ( GREATER-THAN ?auto_10471 ?auto_10474 ) ( IN-CITY ?auto_10477 ?auto_10478 ) ( IN-CITY ?auto_10469 ?auto_10478 ) ( not ( = ?auto_10469 ?auto_10477 ) ) ( OBJ-AT ?auto_10471 ?auto_10477 ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( not ( = ?auto_10468 ?auto_10472 ) ) ( not ( = ?auto_10468 ?auto_10473 ) ) ( not ( = ?auto_10468 ?auto_10474 ) ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( not ( = ?auto_10470 ?auto_10473 ) ) ( not ( = ?auto_10470 ?auto_10474 ) ) ( not ( = ?auto_10470 ?auto_10471 ) ) ( not ( = ?auto_10472 ?auto_10473 ) ) ( not ( = ?auto_10472 ?auto_10474 ) ) ( not ( = ?auto_10472 ?auto_10471 ) ) ( not ( = ?auto_10473 ?auto_10474 ) ) ( not ( = ?auto_10473 ?auto_10471 ) ) ( not ( = ?auto_10474 ?auto_10471 ) ) ( IN-CITY ?auto_10476 ?auto_10478 ) ( not ( = ?auto_10469 ?auto_10476 ) ) ( not ( = ?auto_10477 ?auto_10476 ) ) ( OBJ-AT ?auto_10474 ?auto_10476 ) ( IN-CITY ?auto_10475 ?auto_10478 ) ( not ( = ?auto_10469 ?auto_10475 ) ) ( not ( = ?auto_10477 ?auto_10475 ) ) ( not ( = ?auto_10476 ?auto_10475 ) ) ( OBJ-AT ?auto_10473 ?auto_10475 ) ( IN-CITY ?auto_10479 ?auto_10478 ) ( not ( = ?auto_10469 ?auto_10479 ) ) ( not ( = ?auto_10477 ?auto_10479 ) ) ( not ( = ?auto_10476 ?auto_10479 ) ) ( not ( = ?auto_10475 ?auto_10479 ) ) ( OBJ-AT ?auto_10472 ?auto_10479 ) ( OBJ-AT ?auto_10470 ?auto_10477 ) ( TRUCK-AT ?auto_10480 ?auto_10469 ) ( IN-TRUCK ?auto_10468 ?auto_10480 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10468 ?auto_10469 )
      ( DELIVER-6PKG ?auto_10468 ?auto_10470 ?auto_10472 ?auto_10473 ?auto_10474 ?auto_10471 ?auto_10469 )
      ( DELIVER-6PKG-VERIFY ?auto_10468 ?auto_10470 ?auto_10472 ?auto_10473 ?auto_10474 ?auto_10471 ?auto_10469 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10488 - OBJ
      ?auto_10490 - OBJ
      ?auto_10492 - OBJ
      ?auto_10493 - OBJ
      ?auto_10494 - OBJ
      ?auto_10491 - OBJ
      ?auto_10489 - LOCATION
    )
    :vars
    (
      ?auto_10496 - LOCATION
      ?auto_10498 - CITY
      ?auto_10497 - LOCATION
      ?auto_10500 - LOCATION
      ?auto_10499 - LOCATION
      ?auto_10495 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10490 ?auto_10488 ) ( GREATER-THAN ?auto_10492 ?auto_10488 ) ( GREATER-THAN ?auto_10492 ?auto_10490 ) ( GREATER-THAN ?auto_10493 ?auto_10488 ) ( GREATER-THAN ?auto_10493 ?auto_10490 ) ( GREATER-THAN ?auto_10493 ?auto_10492 ) ( GREATER-THAN ?auto_10494 ?auto_10488 ) ( GREATER-THAN ?auto_10494 ?auto_10490 ) ( GREATER-THAN ?auto_10494 ?auto_10492 ) ( GREATER-THAN ?auto_10494 ?auto_10493 ) ( GREATER-THAN ?auto_10491 ?auto_10488 ) ( GREATER-THAN ?auto_10491 ?auto_10490 ) ( GREATER-THAN ?auto_10491 ?auto_10492 ) ( GREATER-THAN ?auto_10491 ?auto_10493 ) ( GREATER-THAN ?auto_10491 ?auto_10494 ) ( IN-CITY ?auto_10496 ?auto_10498 ) ( IN-CITY ?auto_10489 ?auto_10498 ) ( not ( = ?auto_10489 ?auto_10496 ) ) ( OBJ-AT ?auto_10491 ?auto_10496 ) ( not ( = ?auto_10488 ?auto_10490 ) ) ( not ( = ?auto_10488 ?auto_10492 ) ) ( not ( = ?auto_10488 ?auto_10493 ) ) ( not ( = ?auto_10488 ?auto_10494 ) ) ( not ( = ?auto_10488 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10492 ) ) ( not ( = ?auto_10490 ?auto_10493 ) ) ( not ( = ?auto_10490 ?auto_10494 ) ) ( not ( = ?auto_10490 ?auto_10491 ) ) ( not ( = ?auto_10492 ?auto_10493 ) ) ( not ( = ?auto_10492 ?auto_10494 ) ) ( not ( = ?auto_10492 ?auto_10491 ) ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( not ( = ?auto_10493 ?auto_10491 ) ) ( not ( = ?auto_10494 ?auto_10491 ) ) ( IN-CITY ?auto_10497 ?auto_10498 ) ( not ( = ?auto_10489 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( OBJ-AT ?auto_10494 ?auto_10497 ) ( IN-CITY ?auto_10500 ?auto_10498 ) ( not ( = ?auto_10489 ?auto_10500 ) ) ( not ( = ?auto_10496 ?auto_10500 ) ) ( not ( = ?auto_10497 ?auto_10500 ) ) ( OBJ-AT ?auto_10493 ?auto_10500 ) ( IN-CITY ?auto_10499 ?auto_10498 ) ( not ( = ?auto_10489 ?auto_10499 ) ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10497 ?auto_10499 ) ) ( not ( = ?auto_10500 ?auto_10499 ) ) ( OBJ-AT ?auto_10492 ?auto_10499 ) ( OBJ-AT ?auto_10490 ?auto_10496 ) ( IN-TRUCK ?auto_10488 ?auto_10495 ) ( TRUCK-AT ?auto_10495 ?auto_10500 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10495 ?auto_10500 ?auto_10489 ?auto_10498 )
      ( DELIVER-6PKG ?auto_10488 ?auto_10490 ?auto_10492 ?auto_10493 ?auto_10494 ?auto_10491 ?auto_10489 )
      ( DELIVER-6PKG-VERIFY ?auto_10488 ?auto_10490 ?auto_10492 ?auto_10493 ?auto_10494 ?auto_10491 ?auto_10489 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10508 - OBJ
      ?auto_10510 - OBJ
      ?auto_10512 - OBJ
      ?auto_10513 - OBJ
      ?auto_10514 - OBJ
      ?auto_10511 - OBJ
      ?auto_10509 - LOCATION
    )
    :vars
    (
      ?auto_10518 - LOCATION
      ?auto_10515 - CITY
      ?auto_10519 - LOCATION
      ?auto_10520 - LOCATION
      ?auto_10517 - LOCATION
      ?auto_10516 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10510 ?auto_10508 ) ( GREATER-THAN ?auto_10512 ?auto_10508 ) ( GREATER-THAN ?auto_10512 ?auto_10510 ) ( GREATER-THAN ?auto_10513 ?auto_10508 ) ( GREATER-THAN ?auto_10513 ?auto_10510 ) ( GREATER-THAN ?auto_10513 ?auto_10512 ) ( GREATER-THAN ?auto_10514 ?auto_10508 ) ( GREATER-THAN ?auto_10514 ?auto_10510 ) ( GREATER-THAN ?auto_10514 ?auto_10512 ) ( GREATER-THAN ?auto_10514 ?auto_10513 ) ( GREATER-THAN ?auto_10511 ?auto_10508 ) ( GREATER-THAN ?auto_10511 ?auto_10510 ) ( GREATER-THAN ?auto_10511 ?auto_10512 ) ( GREATER-THAN ?auto_10511 ?auto_10513 ) ( GREATER-THAN ?auto_10511 ?auto_10514 ) ( IN-CITY ?auto_10518 ?auto_10515 ) ( IN-CITY ?auto_10509 ?auto_10515 ) ( not ( = ?auto_10509 ?auto_10518 ) ) ( OBJ-AT ?auto_10511 ?auto_10518 ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10512 ) ) ( not ( = ?auto_10508 ?auto_10513 ) ) ( not ( = ?auto_10508 ?auto_10514 ) ) ( not ( = ?auto_10508 ?auto_10511 ) ) ( not ( = ?auto_10510 ?auto_10512 ) ) ( not ( = ?auto_10510 ?auto_10513 ) ) ( not ( = ?auto_10510 ?auto_10514 ) ) ( not ( = ?auto_10510 ?auto_10511 ) ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10512 ?auto_10511 ) ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10511 ) ) ( not ( = ?auto_10514 ?auto_10511 ) ) ( IN-CITY ?auto_10519 ?auto_10515 ) ( not ( = ?auto_10509 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( OBJ-AT ?auto_10514 ?auto_10519 ) ( IN-CITY ?auto_10520 ?auto_10515 ) ( not ( = ?auto_10509 ?auto_10520 ) ) ( not ( = ?auto_10518 ?auto_10520 ) ) ( not ( = ?auto_10519 ?auto_10520 ) ) ( OBJ-AT ?auto_10513 ?auto_10520 ) ( IN-CITY ?auto_10517 ?auto_10515 ) ( not ( = ?auto_10509 ?auto_10517 ) ) ( not ( = ?auto_10518 ?auto_10517 ) ) ( not ( = ?auto_10519 ?auto_10517 ) ) ( not ( = ?auto_10520 ?auto_10517 ) ) ( OBJ-AT ?auto_10512 ?auto_10517 ) ( OBJ-AT ?auto_10510 ?auto_10518 ) ( TRUCK-AT ?auto_10516 ?auto_10520 ) ( OBJ-AT ?auto_10508 ?auto_10520 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10508 ?auto_10516 ?auto_10520 )
      ( DELIVER-6PKG ?auto_10508 ?auto_10510 ?auto_10512 ?auto_10513 ?auto_10514 ?auto_10511 ?auto_10509 )
      ( DELIVER-6PKG-VERIFY ?auto_10508 ?auto_10510 ?auto_10512 ?auto_10513 ?auto_10514 ?auto_10511 ?auto_10509 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_10528 - OBJ
      ?auto_10530 - OBJ
      ?auto_10532 - OBJ
      ?auto_10533 - OBJ
      ?auto_10534 - OBJ
      ?auto_10531 - OBJ
      ?auto_10529 - LOCATION
    )
    :vars
    (
      ?auto_10535 - LOCATION
      ?auto_10537 - CITY
      ?auto_10536 - LOCATION
      ?auto_10540 - LOCATION
      ?auto_10538 - LOCATION
      ?auto_10539 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10530 ?auto_10528 ) ( GREATER-THAN ?auto_10532 ?auto_10528 ) ( GREATER-THAN ?auto_10532 ?auto_10530 ) ( GREATER-THAN ?auto_10533 ?auto_10528 ) ( GREATER-THAN ?auto_10533 ?auto_10530 ) ( GREATER-THAN ?auto_10533 ?auto_10532 ) ( GREATER-THAN ?auto_10534 ?auto_10528 ) ( GREATER-THAN ?auto_10534 ?auto_10530 ) ( GREATER-THAN ?auto_10534 ?auto_10532 ) ( GREATER-THAN ?auto_10534 ?auto_10533 ) ( GREATER-THAN ?auto_10531 ?auto_10528 ) ( GREATER-THAN ?auto_10531 ?auto_10530 ) ( GREATER-THAN ?auto_10531 ?auto_10532 ) ( GREATER-THAN ?auto_10531 ?auto_10533 ) ( GREATER-THAN ?auto_10531 ?auto_10534 ) ( IN-CITY ?auto_10535 ?auto_10537 ) ( IN-CITY ?auto_10529 ?auto_10537 ) ( not ( = ?auto_10529 ?auto_10535 ) ) ( OBJ-AT ?auto_10531 ?auto_10535 ) ( not ( = ?auto_10528 ?auto_10530 ) ) ( not ( = ?auto_10528 ?auto_10532 ) ) ( not ( = ?auto_10528 ?auto_10533 ) ) ( not ( = ?auto_10528 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10531 ) ) ( not ( = ?auto_10530 ?auto_10532 ) ) ( not ( = ?auto_10530 ?auto_10533 ) ) ( not ( = ?auto_10530 ?auto_10534 ) ) ( not ( = ?auto_10530 ?auto_10531 ) ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10531 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10531 ) ) ( not ( = ?auto_10534 ?auto_10531 ) ) ( IN-CITY ?auto_10536 ?auto_10537 ) ( not ( = ?auto_10529 ?auto_10536 ) ) ( not ( = ?auto_10535 ?auto_10536 ) ) ( OBJ-AT ?auto_10534 ?auto_10536 ) ( IN-CITY ?auto_10540 ?auto_10537 ) ( not ( = ?auto_10529 ?auto_10540 ) ) ( not ( = ?auto_10535 ?auto_10540 ) ) ( not ( = ?auto_10536 ?auto_10540 ) ) ( OBJ-AT ?auto_10533 ?auto_10540 ) ( IN-CITY ?auto_10538 ?auto_10537 ) ( not ( = ?auto_10529 ?auto_10538 ) ) ( not ( = ?auto_10535 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10540 ?auto_10538 ) ) ( OBJ-AT ?auto_10532 ?auto_10538 ) ( OBJ-AT ?auto_10530 ?auto_10535 ) ( OBJ-AT ?auto_10528 ?auto_10540 ) ( TRUCK-AT ?auto_10539 ?auto_10529 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10539 ?auto_10529 ?auto_10540 ?auto_10537 )
      ( DELIVER-6PKG ?auto_10528 ?auto_10530 ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10531 ?auto_10529 )
      ( DELIVER-6PKG-VERIFY ?auto_10528 ?auto_10530 ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10531 ?auto_10529 ) )
  )

)

