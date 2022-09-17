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
      ?auto_25230 - SURFACE
      ?auto_25231 - SURFACE
    )
    :vars
    (
      ?auto_25232 - HOIST
      ?auto_25233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25232 ?auto_25233 ) ( SURFACE-AT ?auto_25231 ?auto_25233 ) ( CLEAR ?auto_25231 ) ( LIFTING ?auto_25232 ?auto_25230 ) ( IS-CRATE ?auto_25230 ) ( not ( = ?auto_25230 ?auto_25231 ) ) )
    :subtasks
    ( ( !DROP ?auto_25232 ?auto_25230 ?auto_25231 ?auto_25233 )
      ( MAKE-ON-VERIFY ?auto_25230 ?auto_25231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25234 - SURFACE
      ?auto_25235 - SURFACE
    )
    :vars
    (
      ?auto_25236 - HOIST
      ?auto_25237 - PLACE
      ?auto_25238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25236 ?auto_25237 ) ( SURFACE-AT ?auto_25235 ?auto_25237 ) ( CLEAR ?auto_25235 ) ( IS-CRATE ?auto_25234 ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( TRUCK-AT ?auto_25238 ?auto_25237 ) ( AVAILABLE ?auto_25236 ) ( IN ?auto_25234 ?auto_25238 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25236 ?auto_25234 ?auto_25238 ?auto_25237 )
      ( MAKE-ON ?auto_25234 ?auto_25235 )
      ( MAKE-ON-VERIFY ?auto_25234 ?auto_25235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25239 - SURFACE
      ?auto_25240 - SURFACE
    )
    :vars
    (
      ?auto_25241 - HOIST
      ?auto_25243 - PLACE
      ?auto_25242 - TRUCK
      ?auto_25244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25241 ?auto_25243 ) ( SURFACE-AT ?auto_25240 ?auto_25243 ) ( CLEAR ?auto_25240 ) ( IS-CRATE ?auto_25239 ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( AVAILABLE ?auto_25241 ) ( IN ?auto_25239 ?auto_25242 ) ( TRUCK-AT ?auto_25242 ?auto_25244 ) ( not ( = ?auto_25244 ?auto_25243 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25242 ?auto_25244 ?auto_25243 )
      ( MAKE-ON ?auto_25239 ?auto_25240 )
      ( MAKE-ON-VERIFY ?auto_25239 ?auto_25240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25245 - SURFACE
      ?auto_25246 - SURFACE
    )
    :vars
    (
      ?auto_25250 - HOIST
      ?auto_25248 - PLACE
      ?auto_25249 - TRUCK
      ?auto_25247 - PLACE
      ?auto_25251 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25250 ?auto_25248 ) ( SURFACE-AT ?auto_25246 ?auto_25248 ) ( CLEAR ?auto_25246 ) ( IS-CRATE ?auto_25245 ) ( not ( = ?auto_25245 ?auto_25246 ) ) ( AVAILABLE ?auto_25250 ) ( TRUCK-AT ?auto_25249 ?auto_25247 ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( HOIST-AT ?auto_25251 ?auto_25247 ) ( LIFTING ?auto_25251 ?auto_25245 ) ( not ( = ?auto_25250 ?auto_25251 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25251 ?auto_25245 ?auto_25249 ?auto_25247 )
      ( MAKE-ON ?auto_25245 ?auto_25246 )
      ( MAKE-ON-VERIFY ?auto_25245 ?auto_25246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25252 - SURFACE
      ?auto_25253 - SURFACE
    )
    :vars
    (
      ?auto_25257 - HOIST
      ?auto_25258 - PLACE
      ?auto_25254 - TRUCK
      ?auto_25255 - PLACE
      ?auto_25256 - HOIST
      ?auto_25259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25257 ?auto_25258 ) ( SURFACE-AT ?auto_25253 ?auto_25258 ) ( CLEAR ?auto_25253 ) ( IS-CRATE ?auto_25252 ) ( not ( = ?auto_25252 ?auto_25253 ) ) ( AVAILABLE ?auto_25257 ) ( TRUCK-AT ?auto_25254 ?auto_25255 ) ( not ( = ?auto_25255 ?auto_25258 ) ) ( HOIST-AT ?auto_25256 ?auto_25255 ) ( not ( = ?auto_25257 ?auto_25256 ) ) ( AVAILABLE ?auto_25256 ) ( SURFACE-AT ?auto_25252 ?auto_25255 ) ( ON ?auto_25252 ?auto_25259 ) ( CLEAR ?auto_25252 ) ( not ( = ?auto_25252 ?auto_25259 ) ) ( not ( = ?auto_25253 ?auto_25259 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25256 ?auto_25252 ?auto_25259 ?auto_25255 )
      ( MAKE-ON ?auto_25252 ?auto_25253 )
      ( MAKE-ON-VERIFY ?auto_25252 ?auto_25253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25260 - SURFACE
      ?auto_25261 - SURFACE
    )
    :vars
    (
      ?auto_25264 - HOIST
      ?auto_25263 - PLACE
      ?auto_25265 - PLACE
      ?auto_25262 - HOIST
      ?auto_25267 - SURFACE
      ?auto_25266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25264 ?auto_25263 ) ( SURFACE-AT ?auto_25261 ?auto_25263 ) ( CLEAR ?auto_25261 ) ( IS-CRATE ?auto_25260 ) ( not ( = ?auto_25260 ?auto_25261 ) ) ( AVAILABLE ?auto_25264 ) ( not ( = ?auto_25265 ?auto_25263 ) ) ( HOIST-AT ?auto_25262 ?auto_25265 ) ( not ( = ?auto_25264 ?auto_25262 ) ) ( AVAILABLE ?auto_25262 ) ( SURFACE-AT ?auto_25260 ?auto_25265 ) ( ON ?auto_25260 ?auto_25267 ) ( CLEAR ?auto_25260 ) ( not ( = ?auto_25260 ?auto_25267 ) ) ( not ( = ?auto_25261 ?auto_25267 ) ) ( TRUCK-AT ?auto_25266 ?auto_25263 ) )
    :subtasks
    ( ( !DRIVE ?auto_25266 ?auto_25263 ?auto_25265 )
      ( MAKE-ON ?auto_25260 ?auto_25261 )
      ( MAKE-ON-VERIFY ?auto_25260 ?auto_25261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25270 - SURFACE
      ?auto_25271 - SURFACE
    )
    :vars
    (
      ?auto_25272 - HOIST
      ?auto_25273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25272 ?auto_25273 ) ( SURFACE-AT ?auto_25271 ?auto_25273 ) ( CLEAR ?auto_25271 ) ( LIFTING ?auto_25272 ?auto_25270 ) ( IS-CRATE ?auto_25270 ) ( not ( = ?auto_25270 ?auto_25271 ) ) )
    :subtasks
    ( ( !DROP ?auto_25272 ?auto_25270 ?auto_25271 ?auto_25273 )
      ( MAKE-ON-VERIFY ?auto_25270 ?auto_25271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25274 - SURFACE
      ?auto_25275 - SURFACE
    )
    :vars
    (
      ?auto_25276 - HOIST
      ?auto_25277 - PLACE
      ?auto_25278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25276 ?auto_25277 ) ( SURFACE-AT ?auto_25275 ?auto_25277 ) ( CLEAR ?auto_25275 ) ( IS-CRATE ?auto_25274 ) ( not ( = ?auto_25274 ?auto_25275 ) ) ( TRUCK-AT ?auto_25278 ?auto_25277 ) ( AVAILABLE ?auto_25276 ) ( IN ?auto_25274 ?auto_25278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25276 ?auto_25274 ?auto_25278 ?auto_25277 )
      ( MAKE-ON ?auto_25274 ?auto_25275 )
      ( MAKE-ON-VERIFY ?auto_25274 ?auto_25275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25279 - SURFACE
      ?auto_25280 - SURFACE
    )
    :vars
    (
      ?auto_25281 - HOIST
      ?auto_25282 - PLACE
      ?auto_25283 - TRUCK
      ?auto_25284 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25281 ?auto_25282 ) ( SURFACE-AT ?auto_25280 ?auto_25282 ) ( CLEAR ?auto_25280 ) ( IS-CRATE ?auto_25279 ) ( not ( = ?auto_25279 ?auto_25280 ) ) ( AVAILABLE ?auto_25281 ) ( IN ?auto_25279 ?auto_25283 ) ( TRUCK-AT ?auto_25283 ?auto_25284 ) ( not ( = ?auto_25284 ?auto_25282 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25283 ?auto_25284 ?auto_25282 )
      ( MAKE-ON ?auto_25279 ?auto_25280 )
      ( MAKE-ON-VERIFY ?auto_25279 ?auto_25280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25285 - SURFACE
      ?auto_25286 - SURFACE
    )
    :vars
    (
      ?auto_25288 - HOIST
      ?auto_25290 - PLACE
      ?auto_25287 - TRUCK
      ?auto_25289 - PLACE
      ?auto_25291 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25288 ?auto_25290 ) ( SURFACE-AT ?auto_25286 ?auto_25290 ) ( CLEAR ?auto_25286 ) ( IS-CRATE ?auto_25285 ) ( not ( = ?auto_25285 ?auto_25286 ) ) ( AVAILABLE ?auto_25288 ) ( TRUCK-AT ?auto_25287 ?auto_25289 ) ( not ( = ?auto_25289 ?auto_25290 ) ) ( HOIST-AT ?auto_25291 ?auto_25289 ) ( LIFTING ?auto_25291 ?auto_25285 ) ( not ( = ?auto_25288 ?auto_25291 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25291 ?auto_25285 ?auto_25287 ?auto_25289 )
      ( MAKE-ON ?auto_25285 ?auto_25286 )
      ( MAKE-ON-VERIFY ?auto_25285 ?auto_25286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25292 - SURFACE
      ?auto_25293 - SURFACE
    )
    :vars
    (
      ?auto_25294 - HOIST
      ?auto_25297 - PLACE
      ?auto_25298 - TRUCK
      ?auto_25295 - PLACE
      ?auto_25296 - HOIST
      ?auto_25299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25294 ?auto_25297 ) ( SURFACE-AT ?auto_25293 ?auto_25297 ) ( CLEAR ?auto_25293 ) ( IS-CRATE ?auto_25292 ) ( not ( = ?auto_25292 ?auto_25293 ) ) ( AVAILABLE ?auto_25294 ) ( TRUCK-AT ?auto_25298 ?auto_25295 ) ( not ( = ?auto_25295 ?auto_25297 ) ) ( HOIST-AT ?auto_25296 ?auto_25295 ) ( not ( = ?auto_25294 ?auto_25296 ) ) ( AVAILABLE ?auto_25296 ) ( SURFACE-AT ?auto_25292 ?auto_25295 ) ( ON ?auto_25292 ?auto_25299 ) ( CLEAR ?auto_25292 ) ( not ( = ?auto_25292 ?auto_25299 ) ) ( not ( = ?auto_25293 ?auto_25299 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25296 ?auto_25292 ?auto_25299 ?auto_25295 )
      ( MAKE-ON ?auto_25292 ?auto_25293 )
      ( MAKE-ON-VERIFY ?auto_25292 ?auto_25293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25300 - SURFACE
      ?auto_25301 - SURFACE
    )
    :vars
    (
      ?auto_25304 - HOIST
      ?auto_25303 - PLACE
      ?auto_25305 - PLACE
      ?auto_25307 - HOIST
      ?auto_25306 - SURFACE
      ?auto_25302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25304 ?auto_25303 ) ( SURFACE-AT ?auto_25301 ?auto_25303 ) ( CLEAR ?auto_25301 ) ( IS-CRATE ?auto_25300 ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( AVAILABLE ?auto_25304 ) ( not ( = ?auto_25305 ?auto_25303 ) ) ( HOIST-AT ?auto_25307 ?auto_25305 ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( AVAILABLE ?auto_25307 ) ( SURFACE-AT ?auto_25300 ?auto_25305 ) ( ON ?auto_25300 ?auto_25306 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25300 ?auto_25306 ) ) ( not ( = ?auto_25301 ?auto_25306 ) ) ( TRUCK-AT ?auto_25302 ?auto_25303 ) )
    :subtasks
    ( ( !DRIVE ?auto_25302 ?auto_25303 ?auto_25305 )
      ( MAKE-ON ?auto_25300 ?auto_25301 )
      ( MAKE-ON-VERIFY ?auto_25300 ?auto_25301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25308 - SURFACE
      ?auto_25309 - SURFACE
    )
    :vars
    (
      ?auto_25313 - HOIST
      ?auto_25311 - PLACE
      ?auto_25310 - PLACE
      ?auto_25312 - HOIST
      ?auto_25315 - SURFACE
      ?auto_25314 - TRUCK
      ?auto_25316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25313 ?auto_25311 ) ( IS-CRATE ?auto_25308 ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25310 ?auto_25311 ) ) ( HOIST-AT ?auto_25312 ?auto_25310 ) ( not ( = ?auto_25313 ?auto_25312 ) ) ( AVAILABLE ?auto_25312 ) ( SURFACE-AT ?auto_25308 ?auto_25310 ) ( ON ?auto_25308 ?auto_25315 ) ( CLEAR ?auto_25308 ) ( not ( = ?auto_25308 ?auto_25315 ) ) ( not ( = ?auto_25309 ?auto_25315 ) ) ( TRUCK-AT ?auto_25314 ?auto_25311 ) ( SURFACE-AT ?auto_25316 ?auto_25311 ) ( CLEAR ?auto_25316 ) ( LIFTING ?auto_25313 ?auto_25309 ) ( IS-CRATE ?auto_25309 ) ( not ( = ?auto_25308 ?auto_25316 ) ) ( not ( = ?auto_25309 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25316 ) ) )
    :subtasks
    ( ( !DROP ?auto_25313 ?auto_25309 ?auto_25316 ?auto_25311 )
      ( MAKE-ON ?auto_25308 ?auto_25309 )
      ( MAKE-ON-VERIFY ?auto_25308 ?auto_25309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25317 - SURFACE
      ?auto_25318 - SURFACE
    )
    :vars
    (
      ?auto_25321 - HOIST
      ?auto_25323 - PLACE
      ?auto_25320 - PLACE
      ?auto_25324 - HOIST
      ?auto_25322 - SURFACE
      ?auto_25319 - TRUCK
      ?auto_25325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25321 ?auto_25323 ) ( IS-CRATE ?auto_25317 ) ( not ( = ?auto_25317 ?auto_25318 ) ) ( not ( = ?auto_25320 ?auto_25323 ) ) ( HOIST-AT ?auto_25324 ?auto_25320 ) ( not ( = ?auto_25321 ?auto_25324 ) ) ( AVAILABLE ?auto_25324 ) ( SURFACE-AT ?auto_25317 ?auto_25320 ) ( ON ?auto_25317 ?auto_25322 ) ( CLEAR ?auto_25317 ) ( not ( = ?auto_25317 ?auto_25322 ) ) ( not ( = ?auto_25318 ?auto_25322 ) ) ( TRUCK-AT ?auto_25319 ?auto_25323 ) ( SURFACE-AT ?auto_25325 ?auto_25323 ) ( CLEAR ?auto_25325 ) ( IS-CRATE ?auto_25318 ) ( not ( = ?auto_25317 ?auto_25325 ) ) ( not ( = ?auto_25318 ?auto_25325 ) ) ( not ( = ?auto_25322 ?auto_25325 ) ) ( AVAILABLE ?auto_25321 ) ( IN ?auto_25318 ?auto_25319 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25321 ?auto_25318 ?auto_25319 ?auto_25323 )
      ( MAKE-ON ?auto_25317 ?auto_25318 )
      ( MAKE-ON-VERIFY ?auto_25317 ?auto_25318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25326 - SURFACE
      ?auto_25327 - SURFACE
    )
    :vars
    (
      ?auto_25332 - HOIST
      ?auto_25333 - PLACE
      ?auto_25331 - PLACE
      ?auto_25329 - HOIST
      ?auto_25328 - SURFACE
      ?auto_25334 - SURFACE
      ?auto_25330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25332 ?auto_25333 ) ( IS-CRATE ?auto_25326 ) ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25331 ?auto_25333 ) ) ( HOIST-AT ?auto_25329 ?auto_25331 ) ( not ( = ?auto_25332 ?auto_25329 ) ) ( AVAILABLE ?auto_25329 ) ( SURFACE-AT ?auto_25326 ?auto_25331 ) ( ON ?auto_25326 ?auto_25328 ) ( CLEAR ?auto_25326 ) ( not ( = ?auto_25326 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( SURFACE-AT ?auto_25334 ?auto_25333 ) ( CLEAR ?auto_25334 ) ( IS-CRATE ?auto_25327 ) ( not ( = ?auto_25326 ?auto_25334 ) ) ( not ( = ?auto_25327 ?auto_25334 ) ) ( not ( = ?auto_25328 ?auto_25334 ) ) ( AVAILABLE ?auto_25332 ) ( IN ?auto_25327 ?auto_25330 ) ( TRUCK-AT ?auto_25330 ?auto_25331 ) )
    :subtasks
    ( ( !DRIVE ?auto_25330 ?auto_25331 ?auto_25333 )
      ( MAKE-ON ?auto_25326 ?auto_25327 )
      ( MAKE-ON-VERIFY ?auto_25326 ?auto_25327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25335 - SURFACE
      ?auto_25336 - SURFACE
    )
    :vars
    (
      ?auto_25339 - HOIST
      ?auto_25337 - PLACE
      ?auto_25343 - PLACE
      ?auto_25340 - HOIST
      ?auto_25341 - SURFACE
      ?auto_25338 - SURFACE
      ?auto_25342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25339 ?auto_25337 ) ( IS-CRATE ?auto_25335 ) ( not ( = ?auto_25335 ?auto_25336 ) ) ( not ( = ?auto_25343 ?auto_25337 ) ) ( HOIST-AT ?auto_25340 ?auto_25343 ) ( not ( = ?auto_25339 ?auto_25340 ) ) ( SURFACE-AT ?auto_25335 ?auto_25343 ) ( ON ?auto_25335 ?auto_25341 ) ( CLEAR ?auto_25335 ) ( not ( = ?auto_25335 ?auto_25341 ) ) ( not ( = ?auto_25336 ?auto_25341 ) ) ( SURFACE-AT ?auto_25338 ?auto_25337 ) ( CLEAR ?auto_25338 ) ( IS-CRATE ?auto_25336 ) ( not ( = ?auto_25335 ?auto_25338 ) ) ( not ( = ?auto_25336 ?auto_25338 ) ) ( not ( = ?auto_25341 ?auto_25338 ) ) ( AVAILABLE ?auto_25339 ) ( TRUCK-AT ?auto_25342 ?auto_25343 ) ( LIFTING ?auto_25340 ?auto_25336 ) )
    :subtasks
    ( ( !LOAD ?auto_25340 ?auto_25336 ?auto_25342 ?auto_25343 )
      ( MAKE-ON ?auto_25335 ?auto_25336 )
      ( MAKE-ON-VERIFY ?auto_25335 ?auto_25336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25344 - SURFACE
      ?auto_25345 - SURFACE
    )
    :vars
    (
      ?auto_25350 - HOIST
      ?auto_25347 - PLACE
      ?auto_25351 - PLACE
      ?auto_25346 - HOIST
      ?auto_25352 - SURFACE
      ?auto_25349 - SURFACE
      ?auto_25348 - TRUCK
      ?auto_25353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25350 ?auto_25347 ) ( IS-CRATE ?auto_25344 ) ( not ( = ?auto_25344 ?auto_25345 ) ) ( not ( = ?auto_25351 ?auto_25347 ) ) ( HOIST-AT ?auto_25346 ?auto_25351 ) ( not ( = ?auto_25350 ?auto_25346 ) ) ( SURFACE-AT ?auto_25344 ?auto_25351 ) ( ON ?auto_25344 ?auto_25352 ) ( CLEAR ?auto_25344 ) ( not ( = ?auto_25344 ?auto_25352 ) ) ( not ( = ?auto_25345 ?auto_25352 ) ) ( SURFACE-AT ?auto_25349 ?auto_25347 ) ( CLEAR ?auto_25349 ) ( IS-CRATE ?auto_25345 ) ( not ( = ?auto_25344 ?auto_25349 ) ) ( not ( = ?auto_25345 ?auto_25349 ) ) ( not ( = ?auto_25352 ?auto_25349 ) ) ( AVAILABLE ?auto_25350 ) ( TRUCK-AT ?auto_25348 ?auto_25351 ) ( AVAILABLE ?auto_25346 ) ( SURFACE-AT ?auto_25345 ?auto_25351 ) ( ON ?auto_25345 ?auto_25353 ) ( CLEAR ?auto_25345 ) ( not ( = ?auto_25344 ?auto_25353 ) ) ( not ( = ?auto_25345 ?auto_25353 ) ) ( not ( = ?auto_25352 ?auto_25353 ) ) ( not ( = ?auto_25349 ?auto_25353 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25346 ?auto_25345 ?auto_25353 ?auto_25351 )
      ( MAKE-ON ?auto_25344 ?auto_25345 )
      ( MAKE-ON-VERIFY ?auto_25344 ?auto_25345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25354 - SURFACE
      ?auto_25355 - SURFACE
    )
    :vars
    (
      ?auto_25358 - HOIST
      ?auto_25363 - PLACE
      ?auto_25360 - PLACE
      ?auto_25359 - HOIST
      ?auto_25356 - SURFACE
      ?auto_25357 - SURFACE
      ?auto_25361 - SURFACE
      ?auto_25362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25358 ?auto_25363 ) ( IS-CRATE ?auto_25354 ) ( not ( = ?auto_25354 ?auto_25355 ) ) ( not ( = ?auto_25360 ?auto_25363 ) ) ( HOIST-AT ?auto_25359 ?auto_25360 ) ( not ( = ?auto_25358 ?auto_25359 ) ) ( SURFACE-AT ?auto_25354 ?auto_25360 ) ( ON ?auto_25354 ?auto_25356 ) ( CLEAR ?auto_25354 ) ( not ( = ?auto_25354 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( SURFACE-AT ?auto_25357 ?auto_25363 ) ( CLEAR ?auto_25357 ) ( IS-CRATE ?auto_25355 ) ( not ( = ?auto_25354 ?auto_25357 ) ) ( not ( = ?auto_25355 ?auto_25357 ) ) ( not ( = ?auto_25356 ?auto_25357 ) ) ( AVAILABLE ?auto_25358 ) ( AVAILABLE ?auto_25359 ) ( SURFACE-AT ?auto_25355 ?auto_25360 ) ( ON ?auto_25355 ?auto_25361 ) ( CLEAR ?auto_25355 ) ( not ( = ?auto_25354 ?auto_25361 ) ) ( not ( = ?auto_25355 ?auto_25361 ) ) ( not ( = ?auto_25356 ?auto_25361 ) ) ( not ( = ?auto_25357 ?auto_25361 ) ) ( TRUCK-AT ?auto_25362 ?auto_25363 ) )
    :subtasks
    ( ( !DRIVE ?auto_25362 ?auto_25363 ?auto_25360 )
      ( MAKE-ON ?auto_25354 ?auto_25355 )
      ( MAKE-ON-VERIFY ?auto_25354 ?auto_25355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25366 - SURFACE
      ?auto_25367 - SURFACE
    )
    :vars
    (
      ?auto_25368 - HOIST
      ?auto_25369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25368 ?auto_25369 ) ( SURFACE-AT ?auto_25367 ?auto_25369 ) ( CLEAR ?auto_25367 ) ( LIFTING ?auto_25368 ?auto_25366 ) ( IS-CRATE ?auto_25366 ) ( not ( = ?auto_25366 ?auto_25367 ) ) )
    :subtasks
    ( ( !DROP ?auto_25368 ?auto_25366 ?auto_25367 ?auto_25369 )
      ( MAKE-ON-VERIFY ?auto_25366 ?auto_25367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25370 - SURFACE
      ?auto_25371 - SURFACE
    )
    :vars
    (
      ?auto_25372 - HOIST
      ?auto_25373 - PLACE
      ?auto_25374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25372 ?auto_25373 ) ( SURFACE-AT ?auto_25371 ?auto_25373 ) ( CLEAR ?auto_25371 ) ( IS-CRATE ?auto_25370 ) ( not ( = ?auto_25370 ?auto_25371 ) ) ( TRUCK-AT ?auto_25374 ?auto_25373 ) ( AVAILABLE ?auto_25372 ) ( IN ?auto_25370 ?auto_25374 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25372 ?auto_25370 ?auto_25374 ?auto_25373 )
      ( MAKE-ON ?auto_25370 ?auto_25371 )
      ( MAKE-ON-VERIFY ?auto_25370 ?auto_25371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25375 - SURFACE
      ?auto_25376 - SURFACE
    )
    :vars
    (
      ?auto_25379 - HOIST
      ?auto_25377 - PLACE
      ?auto_25378 - TRUCK
      ?auto_25380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25379 ?auto_25377 ) ( SURFACE-AT ?auto_25376 ?auto_25377 ) ( CLEAR ?auto_25376 ) ( IS-CRATE ?auto_25375 ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( AVAILABLE ?auto_25379 ) ( IN ?auto_25375 ?auto_25378 ) ( TRUCK-AT ?auto_25378 ?auto_25380 ) ( not ( = ?auto_25380 ?auto_25377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25378 ?auto_25380 ?auto_25377 )
      ( MAKE-ON ?auto_25375 ?auto_25376 )
      ( MAKE-ON-VERIFY ?auto_25375 ?auto_25376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25381 - SURFACE
      ?auto_25382 - SURFACE
    )
    :vars
    (
      ?auto_25383 - HOIST
      ?auto_25386 - PLACE
      ?auto_25384 - TRUCK
      ?auto_25385 - PLACE
      ?auto_25387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25383 ?auto_25386 ) ( SURFACE-AT ?auto_25382 ?auto_25386 ) ( CLEAR ?auto_25382 ) ( IS-CRATE ?auto_25381 ) ( not ( = ?auto_25381 ?auto_25382 ) ) ( AVAILABLE ?auto_25383 ) ( TRUCK-AT ?auto_25384 ?auto_25385 ) ( not ( = ?auto_25385 ?auto_25386 ) ) ( HOIST-AT ?auto_25387 ?auto_25385 ) ( LIFTING ?auto_25387 ?auto_25381 ) ( not ( = ?auto_25383 ?auto_25387 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25387 ?auto_25381 ?auto_25384 ?auto_25385 )
      ( MAKE-ON ?auto_25381 ?auto_25382 )
      ( MAKE-ON-VERIFY ?auto_25381 ?auto_25382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25388 - SURFACE
      ?auto_25389 - SURFACE
    )
    :vars
    (
      ?auto_25391 - HOIST
      ?auto_25392 - PLACE
      ?auto_25390 - TRUCK
      ?auto_25394 - PLACE
      ?auto_25393 - HOIST
      ?auto_25395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25391 ?auto_25392 ) ( SURFACE-AT ?auto_25389 ?auto_25392 ) ( CLEAR ?auto_25389 ) ( IS-CRATE ?auto_25388 ) ( not ( = ?auto_25388 ?auto_25389 ) ) ( AVAILABLE ?auto_25391 ) ( TRUCK-AT ?auto_25390 ?auto_25394 ) ( not ( = ?auto_25394 ?auto_25392 ) ) ( HOIST-AT ?auto_25393 ?auto_25394 ) ( not ( = ?auto_25391 ?auto_25393 ) ) ( AVAILABLE ?auto_25393 ) ( SURFACE-AT ?auto_25388 ?auto_25394 ) ( ON ?auto_25388 ?auto_25395 ) ( CLEAR ?auto_25388 ) ( not ( = ?auto_25388 ?auto_25395 ) ) ( not ( = ?auto_25389 ?auto_25395 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25393 ?auto_25388 ?auto_25395 ?auto_25394 )
      ( MAKE-ON ?auto_25388 ?auto_25389 )
      ( MAKE-ON-VERIFY ?auto_25388 ?auto_25389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25396 - SURFACE
      ?auto_25397 - SURFACE
    )
    :vars
    (
      ?auto_25403 - HOIST
      ?auto_25400 - PLACE
      ?auto_25402 - PLACE
      ?auto_25398 - HOIST
      ?auto_25401 - SURFACE
      ?auto_25399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25403 ?auto_25400 ) ( SURFACE-AT ?auto_25397 ?auto_25400 ) ( CLEAR ?auto_25397 ) ( IS-CRATE ?auto_25396 ) ( not ( = ?auto_25396 ?auto_25397 ) ) ( AVAILABLE ?auto_25403 ) ( not ( = ?auto_25402 ?auto_25400 ) ) ( HOIST-AT ?auto_25398 ?auto_25402 ) ( not ( = ?auto_25403 ?auto_25398 ) ) ( AVAILABLE ?auto_25398 ) ( SURFACE-AT ?auto_25396 ?auto_25402 ) ( ON ?auto_25396 ?auto_25401 ) ( CLEAR ?auto_25396 ) ( not ( = ?auto_25396 ?auto_25401 ) ) ( not ( = ?auto_25397 ?auto_25401 ) ) ( TRUCK-AT ?auto_25399 ?auto_25400 ) )
    :subtasks
    ( ( !DRIVE ?auto_25399 ?auto_25400 ?auto_25402 )
      ( MAKE-ON ?auto_25396 ?auto_25397 )
      ( MAKE-ON-VERIFY ?auto_25396 ?auto_25397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25404 - SURFACE
      ?auto_25405 - SURFACE
    )
    :vars
    (
      ?auto_25411 - HOIST
      ?auto_25406 - PLACE
      ?auto_25410 - PLACE
      ?auto_25408 - HOIST
      ?auto_25407 - SURFACE
      ?auto_25409 - TRUCK
      ?auto_25412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25411 ?auto_25406 ) ( IS-CRATE ?auto_25404 ) ( not ( = ?auto_25404 ?auto_25405 ) ) ( not ( = ?auto_25410 ?auto_25406 ) ) ( HOIST-AT ?auto_25408 ?auto_25410 ) ( not ( = ?auto_25411 ?auto_25408 ) ) ( AVAILABLE ?auto_25408 ) ( SURFACE-AT ?auto_25404 ?auto_25410 ) ( ON ?auto_25404 ?auto_25407 ) ( CLEAR ?auto_25404 ) ( not ( = ?auto_25404 ?auto_25407 ) ) ( not ( = ?auto_25405 ?auto_25407 ) ) ( TRUCK-AT ?auto_25409 ?auto_25406 ) ( SURFACE-AT ?auto_25412 ?auto_25406 ) ( CLEAR ?auto_25412 ) ( LIFTING ?auto_25411 ?auto_25405 ) ( IS-CRATE ?auto_25405 ) ( not ( = ?auto_25404 ?auto_25412 ) ) ( not ( = ?auto_25405 ?auto_25412 ) ) ( not ( = ?auto_25407 ?auto_25412 ) ) )
    :subtasks
    ( ( !DROP ?auto_25411 ?auto_25405 ?auto_25412 ?auto_25406 )
      ( MAKE-ON ?auto_25404 ?auto_25405 )
      ( MAKE-ON-VERIFY ?auto_25404 ?auto_25405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25413 - SURFACE
      ?auto_25414 - SURFACE
    )
    :vars
    (
      ?auto_25415 - HOIST
      ?auto_25416 - PLACE
      ?auto_25417 - PLACE
      ?auto_25421 - HOIST
      ?auto_25420 - SURFACE
      ?auto_25419 - TRUCK
      ?auto_25418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25415 ?auto_25416 ) ( IS-CRATE ?auto_25413 ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25417 ?auto_25416 ) ) ( HOIST-AT ?auto_25421 ?auto_25417 ) ( not ( = ?auto_25415 ?auto_25421 ) ) ( AVAILABLE ?auto_25421 ) ( SURFACE-AT ?auto_25413 ?auto_25417 ) ( ON ?auto_25413 ?auto_25420 ) ( CLEAR ?auto_25413 ) ( not ( = ?auto_25413 ?auto_25420 ) ) ( not ( = ?auto_25414 ?auto_25420 ) ) ( TRUCK-AT ?auto_25419 ?auto_25416 ) ( SURFACE-AT ?auto_25418 ?auto_25416 ) ( CLEAR ?auto_25418 ) ( IS-CRATE ?auto_25414 ) ( not ( = ?auto_25413 ?auto_25418 ) ) ( not ( = ?auto_25414 ?auto_25418 ) ) ( not ( = ?auto_25420 ?auto_25418 ) ) ( AVAILABLE ?auto_25415 ) ( IN ?auto_25414 ?auto_25419 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25415 ?auto_25414 ?auto_25419 ?auto_25416 )
      ( MAKE-ON ?auto_25413 ?auto_25414 )
      ( MAKE-ON-VERIFY ?auto_25413 ?auto_25414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25422 - SURFACE
      ?auto_25423 - SURFACE
    )
    :vars
    (
      ?auto_25427 - HOIST
      ?auto_25428 - PLACE
      ?auto_25424 - PLACE
      ?auto_25425 - HOIST
      ?auto_25430 - SURFACE
      ?auto_25426 - SURFACE
      ?auto_25429 - TRUCK
      ?auto_25431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25427 ?auto_25428 ) ( IS-CRATE ?auto_25422 ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( not ( = ?auto_25424 ?auto_25428 ) ) ( HOIST-AT ?auto_25425 ?auto_25424 ) ( not ( = ?auto_25427 ?auto_25425 ) ) ( AVAILABLE ?auto_25425 ) ( SURFACE-AT ?auto_25422 ?auto_25424 ) ( ON ?auto_25422 ?auto_25430 ) ( CLEAR ?auto_25422 ) ( not ( = ?auto_25422 ?auto_25430 ) ) ( not ( = ?auto_25423 ?auto_25430 ) ) ( SURFACE-AT ?auto_25426 ?auto_25428 ) ( CLEAR ?auto_25426 ) ( IS-CRATE ?auto_25423 ) ( not ( = ?auto_25422 ?auto_25426 ) ) ( not ( = ?auto_25423 ?auto_25426 ) ) ( not ( = ?auto_25430 ?auto_25426 ) ) ( AVAILABLE ?auto_25427 ) ( IN ?auto_25423 ?auto_25429 ) ( TRUCK-AT ?auto_25429 ?auto_25431 ) ( not ( = ?auto_25431 ?auto_25428 ) ) ( not ( = ?auto_25424 ?auto_25431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25429 ?auto_25431 ?auto_25428 )
      ( MAKE-ON ?auto_25422 ?auto_25423 )
      ( MAKE-ON-VERIFY ?auto_25422 ?auto_25423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25432 - SURFACE
      ?auto_25433 - SURFACE
    )
    :vars
    (
      ?auto_25441 - HOIST
      ?auto_25436 - PLACE
      ?auto_25439 - PLACE
      ?auto_25435 - HOIST
      ?auto_25440 - SURFACE
      ?auto_25437 - SURFACE
      ?auto_25434 - TRUCK
      ?auto_25438 - PLACE
      ?auto_25442 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25441 ?auto_25436 ) ( IS-CRATE ?auto_25432 ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25439 ?auto_25436 ) ) ( HOIST-AT ?auto_25435 ?auto_25439 ) ( not ( = ?auto_25441 ?auto_25435 ) ) ( AVAILABLE ?auto_25435 ) ( SURFACE-AT ?auto_25432 ?auto_25439 ) ( ON ?auto_25432 ?auto_25440 ) ( CLEAR ?auto_25432 ) ( not ( = ?auto_25432 ?auto_25440 ) ) ( not ( = ?auto_25433 ?auto_25440 ) ) ( SURFACE-AT ?auto_25437 ?auto_25436 ) ( CLEAR ?auto_25437 ) ( IS-CRATE ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25437 ) ) ( not ( = ?auto_25433 ?auto_25437 ) ) ( not ( = ?auto_25440 ?auto_25437 ) ) ( AVAILABLE ?auto_25441 ) ( TRUCK-AT ?auto_25434 ?auto_25438 ) ( not ( = ?auto_25438 ?auto_25436 ) ) ( not ( = ?auto_25439 ?auto_25438 ) ) ( HOIST-AT ?auto_25442 ?auto_25438 ) ( LIFTING ?auto_25442 ?auto_25433 ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( not ( = ?auto_25435 ?auto_25442 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25442 ?auto_25433 ?auto_25434 ?auto_25438 )
      ( MAKE-ON ?auto_25432 ?auto_25433 )
      ( MAKE-ON-VERIFY ?auto_25432 ?auto_25433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25443 - SURFACE
      ?auto_25444 - SURFACE
    )
    :vars
    (
      ?auto_25449 - HOIST
      ?auto_25452 - PLACE
      ?auto_25446 - PLACE
      ?auto_25448 - HOIST
      ?auto_25453 - SURFACE
      ?auto_25447 - SURFACE
      ?auto_25451 - TRUCK
      ?auto_25450 - PLACE
      ?auto_25445 - HOIST
      ?auto_25454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25449 ?auto_25452 ) ( IS-CRATE ?auto_25443 ) ( not ( = ?auto_25443 ?auto_25444 ) ) ( not ( = ?auto_25446 ?auto_25452 ) ) ( HOIST-AT ?auto_25448 ?auto_25446 ) ( not ( = ?auto_25449 ?auto_25448 ) ) ( AVAILABLE ?auto_25448 ) ( SURFACE-AT ?auto_25443 ?auto_25446 ) ( ON ?auto_25443 ?auto_25453 ) ( CLEAR ?auto_25443 ) ( not ( = ?auto_25443 ?auto_25453 ) ) ( not ( = ?auto_25444 ?auto_25453 ) ) ( SURFACE-AT ?auto_25447 ?auto_25452 ) ( CLEAR ?auto_25447 ) ( IS-CRATE ?auto_25444 ) ( not ( = ?auto_25443 ?auto_25447 ) ) ( not ( = ?auto_25444 ?auto_25447 ) ) ( not ( = ?auto_25453 ?auto_25447 ) ) ( AVAILABLE ?auto_25449 ) ( TRUCK-AT ?auto_25451 ?auto_25450 ) ( not ( = ?auto_25450 ?auto_25452 ) ) ( not ( = ?auto_25446 ?auto_25450 ) ) ( HOIST-AT ?auto_25445 ?auto_25450 ) ( not ( = ?auto_25449 ?auto_25445 ) ) ( not ( = ?auto_25448 ?auto_25445 ) ) ( AVAILABLE ?auto_25445 ) ( SURFACE-AT ?auto_25444 ?auto_25450 ) ( ON ?auto_25444 ?auto_25454 ) ( CLEAR ?auto_25444 ) ( not ( = ?auto_25443 ?auto_25454 ) ) ( not ( = ?auto_25444 ?auto_25454 ) ) ( not ( = ?auto_25453 ?auto_25454 ) ) ( not ( = ?auto_25447 ?auto_25454 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25445 ?auto_25444 ?auto_25454 ?auto_25450 )
      ( MAKE-ON ?auto_25443 ?auto_25444 )
      ( MAKE-ON-VERIFY ?auto_25443 ?auto_25444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25455 - SURFACE
      ?auto_25456 - SURFACE
    )
    :vars
    (
      ?auto_25464 - HOIST
      ?auto_25466 - PLACE
      ?auto_25465 - PLACE
      ?auto_25458 - HOIST
      ?auto_25463 - SURFACE
      ?auto_25460 - SURFACE
      ?auto_25462 - PLACE
      ?auto_25461 - HOIST
      ?auto_25457 - SURFACE
      ?auto_25459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25464 ?auto_25466 ) ( IS-CRATE ?auto_25455 ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25465 ?auto_25466 ) ) ( HOIST-AT ?auto_25458 ?auto_25465 ) ( not ( = ?auto_25464 ?auto_25458 ) ) ( AVAILABLE ?auto_25458 ) ( SURFACE-AT ?auto_25455 ?auto_25465 ) ( ON ?auto_25455 ?auto_25463 ) ( CLEAR ?auto_25455 ) ( not ( = ?auto_25455 ?auto_25463 ) ) ( not ( = ?auto_25456 ?auto_25463 ) ) ( SURFACE-AT ?auto_25460 ?auto_25466 ) ( CLEAR ?auto_25460 ) ( IS-CRATE ?auto_25456 ) ( not ( = ?auto_25455 ?auto_25460 ) ) ( not ( = ?auto_25456 ?auto_25460 ) ) ( not ( = ?auto_25463 ?auto_25460 ) ) ( AVAILABLE ?auto_25464 ) ( not ( = ?auto_25462 ?auto_25466 ) ) ( not ( = ?auto_25465 ?auto_25462 ) ) ( HOIST-AT ?auto_25461 ?auto_25462 ) ( not ( = ?auto_25464 ?auto_25461 ) ) ( not ( = ?auto_25458 ?auto_25461 ) ) ( AVAILABLE ?auto_25461 ) ( SURFACE-AT ?auto_25456 ?auto_25462 ) ( ON ?auto_25456 ?auto_25457 ) ( CLEAR ?auto_25456 ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25456 ?auto_25457 ) ) ( not ( = ?auto_25463 ?auto_25457 ) ) ( not ( = ?auto_25460 ?auto_25457 ) ) ( TRUCK-AT ?auto_25459 ?auto_25466 ) )
    :subtasks
    ( ( !DRIVE ?auto_25459 ?auto_25466 ?auto_25462 )
      ( MAKE-ON ?auto_25455 ?auto_25456 )
      ( MAKE-ON-VERIFY ?auto_25455 ?auto_25456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25467 - SURFACE
      ?auto_25468 - SURFACE
    )
    :vars
    (
      ?auto_25475 - HOIST
      ?auto_25470 - PLACE
      ?auto_25478 - PLACE
      ?auto_25469 - HOIST
      ?auto_25476 - SURFACE
      ?auto_25477 - SURFACE
      ?auto_25473 - PLACE
      ?auto_25472 - HOIST
      ?auto_25471 - SURFACE
      ?auto_25474 - TRUCK
      ?auto_25479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25475 ?auto_25470 ) ( IS-CRATE ?auto_25467 ) ( not ( = ?auto_25467 ?auto_25468 ) ) ( not ( = ?auto_25478 ?auto_25470 ) ) ( HOIST-AT ?auto_25469 ?auto_25478 ) ( not ( = ?auto_25475 ?auto_25469 ) ) ( AVAILABLE ?auto_25469 ) ( SURFACE-AT ?auto_25467 ?auto_25478 ) ( ON ?auto_25467 ?auto_25476 ) ( CLEAR ?auto_25467 ) ( not ( = ?auto_25467 ?auto_25476 ) ) ( not ( = ?auto_25468 ?auto_25476 ) ) ( IS-CRATE ?auto_25468 ) ( not ( = ?auto_25467 ?auto_25477 ) ) ( not ( = ?auto_25468 ?auto_25477 ) ) ( not ( = ?auto_25476 ?auto_25477 ) ) ( not ( = ?auto_25473 ?auto_25470 ) ) ( not ( = ?auto_25478 ?auto_25473 ) ) ( HOIST-AT ?auto_25472 ?auto_25473 ) ( not ( = ?auto_25475 ?auto_25472 ) ) ( not ( = ?auto_25469 ?auto_25472 ) ) ( AVAILABLE ?auto_25472 ) ( SURFACE-AT ?auto_25468 ?auto_25473 ) ( ON ?auto_25468 ?auto_25471 ) ( CLEAR ?auto_25468 ) ( not ( = ?auto_25467 ?auto_25471 ) ) ( not ( = ?auto_25468 ?auto_25471 ) ) ( not ( = ?auto_25476 ?auto_25471 ) ) ( not ( = ?auto_25477 ?auto_25471 ) ) ( TRUCK-AT ?auto_25474 ?auto_25470 ) ( SURFACE-AT ?auto_25479 ?auto_25470 ) ( CLEAR ?auto_25479 ) ( LIFTING ?auto_25475 ?auto_25477 ) ( IS-CRATE ?auto_25477 ) ( not ( = ?auto_25467 ?auto_25479 ) ) ( not ( = ?auto_25468 ?auto_25479 ) ) ( not ( = ?auto_25476 ?auto_25479 ) ) ( not ( = ?auto_25477 ?auto_25479 ) ) ( not ( = ?auto_25471 ?auto_25479 ) ) )
    :subtasks
    ( ( !DROP ?auto_25475 ?auto_25477 ?auto_25479 ?auto_25470 )
      ( MAKE-ON ?auto_25467 ?auto_25468 )
      ( MAKE-ON-VERIFY ?auto_25467 ?auto_25468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25480 - SURFACE
      ?auto_25481 - SURFACE
    )
    :vars
    (
      ?auto_25483 - HOIST
      ?auto_25485 - PLACE
      ?auto_25482 - PLACE
      ?auto_25487 - HOIST
      ?auto_25489 - SURFACE
      ?auto_25488 - SURFACE
      ?auto_25484 - PLACE
      ?auto_25491 - HOIST
      ?auto_25492 - SURFACE
      ?auto_25490 - TRUCK
      ?auto_25486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25483 ?auto_25485 ) ( IS-CRATE ?auto_25480 ) ( not ( = ?auto_25480 ?auto_25481 ) ) ( not ( = ?auto_25482 ?auto_25485 ) ) ( HOIST-AT ?auto_25487 ?auto_25482 ) ( not ( = ?auto_25483 ?auto_25487 ) ) ( AVAILABLE ?auto_25487 ) ( SURFACE-AT ?auto_25480 ?auto_25482 ) ( ON ?auto_25480 ?auto_25489 ) ( CLEAR ?auto_25480 ) ( not ( = ?auto_25480 ?auto_25489 ) ) ( not ( = ?auto_25481 ?auto_25489 ) ) ( IS-CRATE ?auto_25481 ) ( not ( = ?auto_25480 ?auto_25488 ) ) ( not ( = ?auto_25481 ?auto_25488 ) ) ( not ( = ?auto_25489 ?auto_25488 ) ) ( not ( = ?auto_25484 ?auto_25485 ) ) ( not ( = ?auto_25482 ?auto_25484 ) ) ( HOIST-AT ?auto_25491 ?auto_25484 ) ( not ( = ?auto_25483 ?auto_25491 ) ) ( not ( = ?auto_25487 ?auto_25491 ) ) ( AVAILABLE ?auto_25491 ) ( SURFACE-AT ?auto_25481 ?auto_25484 ) ( ON ?auto_25481 ?auto_25492 ) ( CLEAR ?auto_25481 ) ( not ( = ?auto_25480 ?auto_25492 ) ) ( not ( = ?auto_25481 ?auto_25492 ) ) ( not ( = ?auto_25489 ?auto_25492 ) ) ( not ( = ?auto_25488 ?auto_25492 ) ) ( TRUCK-AT ?auto_25490 ?auto_25485 ) ( SURFACE-AT ?auto_25486 ?auto_25485 ) ( CLEAR ?auto_25486 ) ( IS-CRATE ?auto_25488 ) ( not ( = ?auto_25480 ?auto_25486 ) ) ( not ( = ?auto_25481 ?auto_25486 ) ) ( not ( = ?auto_25489 ?auto_25486 ) ) ( not ( = ?auto_25488 ?auto_25486 ) ) ( not ( = ?auto_25492 ?auto_25486 ) ) ( AVAILABLE ?auto_25483 ) ( IN ?auto_25488 ?auto_25490 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25483 ?auto_25488 ?auto_25490 ?auto_25485 )
      ( MAKE-ON ?auto_25480 ?auto_25481 )
      ( MAKE-ON-VERIFY ?auto_25480 ?auto_25481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25493 - SURFACE
      ?auto_25494 - SURFACE
    )
    :vars
    (
      ?auto_25500 - HOIST
      ?auto_25498 - PLACE
      ?auto_25502 - PLACE
      ?auto_25499 - HOIST
      ?auto_25503 - SURFACE
      ?auto_25495 - SURFACE
      ?auto_25501 - PLACE
      ?auto_25504 - HOIST
      ?auto_25497 - SURFACE
      ?auto_25505 - SURFACE
      ?auto_25496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25500 ?auto_25498 ) ( IS-CRATE ?auto_25493 ) ( not ( = ?auto_25493 ?auto_25494 ) ) ( not ( = ?auto_25502 ?auto_25498 ) ) ( HOIST-AT ?auto_25499 ?auto_25502 ) ( not ( = ?auto_25500 ?auto_25499 ) ) ( AVAILABLE ?auto_25499 ) ( SURFACE-AT ?auto_25493 ?auto_25502 ) ( ON ?auto_25493 ?auto_25503 ) ( CLEAR ?auto_25493 ) ( not ( = ?auto_25493 ?auto_25503 ) ) ( not ( = ?auto_25494 ?auto_25503 ) ) ( IS-CRATE ?auto_25494 ) ( not ( = ?auto_25493 ?auto_25495 ) ) ( not ( = ?auto_25494 ?auto_25495 ) ) ( not ( = ?auto_25503 ?auto_25495 ) ) ( not ( = ?auto_25501 ?auto_25498 ) ) ( not ( = ?auto_25502 ?auto_25501 ) ) ( HOIST-AT ?auto_25504 ?auto_25501 ) ( not ( = ?auto_25500 ?auto_25504 ) ) ( not ( = ?auto_25499 ?auto_25504 ) ) ( AVAILABLE ?auto_25504 ) ( SURFACE-AT ?auto_25494 ?auto_25501 ) ( ON ?auto_25494 ?auto_25497 ) ( CLEAR ?auto_25494 ) ( not ( = ?auto_25493 ?auto_25497 ) ) ( not ( = ?auto_25494 ?auto_25497 ) ) ( not ( = ?auto_25503 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25497 ) ) ( SURFACE-AT ?auto_25505 ?auto_25498 ) ( CLEAR ?auto_25505 ) ( IS-CRATE ?auto_25495 ) ( not ( = ?auto_25493 ?auto_25505 ) ) ( not ( = ?auto_25494 ?auto_25505 ) ) ( not ( = ?auto_25503 ?auto_25505 ) ) ( not ( = ?auto_25495 ?auto_25505 ) ) ( not ( = ?auto_25497 ?auto_25505 ) ) ( AVAILABLE ?auto_25500 ) ( IN ?auto_25495 ?auto_25496 ) ( TRUCK-AT ?auto_25496 ?auto_25501 ) )
    :subtasks
    ( ( !DRIVE ?auto_25496 ?auto_25501 ?auto_25498 )
      ( MAKE-ON ?auto_25493 ?auto_25494 )
      ( MAKE-ON-VERIFY ?auto_25493 ?auto_25494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25506 - SURFACE
      ?auto_25507 - SURFACE
    )
    :vars
    (
      ?auto_25514 - HOIST
      ?auto_25509 - PLACE
      ?auto_25517 - PLACE
      ?auto_25510 - HOIST
      ?auto_25516 - SURFACE
      ?auto_25511 - SURFACE
      ?auto_25518 - PLACE
      ?auto_25508 - HOIST
      ?auto_25515 - SURFACE
      ?auto_25513 - SURFACE
      ?auto_25512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25514 ?auto_25509 ) ( IS-CRATE ?auto_25506 ) ( not ( = ?auto_25506 ?auto_25507 ) ) ( not ( = ?auto_25517 ?auto_25509 ) ) ( HOIST-AT ?auto_25510 ?auto_25517 ) ( not ( = ?auto_25514 ?auto_25510 ) ) ( AVAILABLE ?auto_25510 ) ( SURFACE-AT ?auto_25506 ?auto_25517 ) ( ON ?auto_25506 ?auto_25516 ) ( CLEAR ?auto_25506 ) ( not ( = ?auto_25506 ?auto_25516 ) ) ( not ( = ?auto_25507 ?auto_25516 ) ) ( IS-CRATE ?auto_25507 ) ( not ( = ?auto_25506 ?auto_25511 ) ) ( not ( = ?auto_25507 ?auto_25511 ) ) ( not ( = ?auto_25516 ?auto_25511 ) ) ( not ( = ?auto_25518 ?auto_25509 ) ) ( not ( = ?auto_25517 ?auto_25518 ) ) ( HOIST-AT ?auto_25508 ?auto_25518 ) ( not ( = ?auto_25514 ?auto_25508 ) ) ( not ( = ?auto_25510 ?auto_25508 ) ) ( SURFACE-AT ?auto_25507 ?auto_25518 ) ( ON ?auto_25507 ?auto_25515 ) ( CLEAR ?auto_25507 ) ( not ( = ?auto_25506 ?auto_25515 ) ) ( not ( = ?auto_25507 ?auto_25515 ) ) ( not ( = ?auto_25516 ?auto_25515 ) ) ( not ( = ?auto_25511 ?auto_25515 ) ) ( SURFACE-AT ?auto_25513 ?auto_25509 ) ( CLEAR ?auto_25513 ) ( IS-CRATE ?auto_25511 ) ( not ( = ?auto_25506 ?auto_25513 ) ) ( not ( = ?auto_25507 ?auto_25513 ) ) ( not ( = ?auto_25516 ?auto_25513 ) ) ( not ( = ?auto_25511 ?auto_25513 ) ) ( not ( = ?auto_25515 ?auto_25513 ) ) ( AVAILABLE ?auto_25514 ) ( TRUCK-AT ?auto_25512 ?auto_25518 ) ( LIFTING ?auto_25508 ?auto_25511 ) )
    :subtasks
    ( ( !LOAD ?auto_25508 ?auto_25511 ?auto_25512 ?auto_25518 )
      ( MAKE-ON ?auto_25506 ?auto_25507 )
      ( MAKE-ON-VERIFY ?auto_25506 ?auto_25507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25519 - SURFACE
      ?auto_25520 - SURFACE
    )
    :vars
    (
      ?auto_25525 - HOIST
      ?auto_25530 - PLACE
      ?auto_25529 - PLACE
      ?auto_25521 - HOIST
      ?auto_25527 - SURFACE
      ?auto_25523 - SURFACE
      ?auto_25522 - PLACE
      ?auto_25531 - HOIST
      ?auto_25528 - SURFACE
      ?auto_25526 - SURFACE
      ?auto_25524 - TRUCK
      ?auto_25532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25525 ?auto_25530 ) ( IS-CRATE ?auto_25519 ) ( not ( = ?auto_25519 ?auto_25520 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( HOIST-AT ?auto_25521 ?auto_25529 ) ( not ( = ?auto_25525 ?auto_25521 ) ) ( AVAILABLE ?auto_25521 ) ( SURFACE-AT ?auto_25519 ?auto_25529 ) ( ON ?auto_25519 ?auto_25527 ) ( CLEAR ?auto_25519 ) ( not ( = ?auto_25519 ?auto_25527 ) ) ( not ( = ?auto_25520 ?auto_25527 ) ) ( IS-CRATE ?auto_25520 ) ( not ( = ?auto_25519 ?auto_25523 ) ) ( not ( = ?auto_25520 ?auto_25523 ) ) ( not ( = ?auto_25527 ?auto_25523 ) ) ( not ( = ?auto_25522 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25522 ) ) ( HOIST-AT ?auto_25531 ?auto_25522 ) ( not ( = ?auto_25525 ?auto_25531 ) ) ( not ( = ?auto_25521 ?auto_25531 ) ) ( SURFACE-AT ?auto_25520 ?auto_25522 ) ( ON ?auto_25520 ?auto_25528 ) ( CLEAR ?auto_25520 ) ( not ( = ?auto_25519 ?auto_25528 ) ) ( not ( = ?auto_25520 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25523 ?auto_25528 ) ) ( SURFACE-AT ?auto_25526 ?auto_25530 ) ( CLEAR ?auto_25526 ) ( IS-CRATE ?auto_25523 ) ( not ( = ?auto_25519 ?auto_25526 ) ) ( not ( = ?auto_25520 ?auto_25526 ) ) ( not ( = ?auto_25527 ?auto_25526 ) ) ( not ( = ?auto_25523 ?auto_25526 ) ) ( not ( = ?auto_25528 ?auto_25526 ) ) ( AVAILABLE ?auto_25525 ) ( TRUCK-AT ?auto_25524 ?auto_25522 ) ( AVAILABLE ?auto_25531 ) ( SURFACE-AT ?auto_25523 ?auto_25522 ) ( ON ?auto_25523 ?auto_25532 ) ( CLEAR ?auto_25523 ) ( not ( = ?auto_25519 ?auto_25532 ) ) ( not ( = ?auto_25520 ?auto_25532 ) ) ( not ( = ?auto_25527 ?auto_25532 ) ) ( not ( = ?auto_25523 ?auto_25532 ) ) ( not ( = ?auto_25528 ?auto_25532 ) ) ( not ( = ?auto_25526 ?auto_25532 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25531 ?auto_25523 ?auto_25532 ?auto_25522 )
      ( MAKE-ON ?auto_25519 ?auto_25520 )
      ( MAKE-ON-VERIFY ?auto_25519 ?auto_25520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25533 - SURFACE
      ?auto_25534 - SURFACE
    )
    :vars
    (
      ?auto_25541 - HOIST
      ?auto_25538 - PLACE
      ?auto_25540 - PLACE
      ?auto_25537 - HOIST
      ?auto_25539 - SURFACE
      ?auto_25546 - SURFACE
      ?auto_25535 - PLACE
      ?auto_25543 - HOIST
      ?auto_25536 - SURFACE
      ?auto_25542 - SURFACE
      ?auto_25544 - SURFACE
      ?auto_25545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25541 ?auto_25538 ) ( IS-CRATE ?auto_25533 ) ( not ( = ?auto_25533 ?auto_25534 ) ) ( not ( = ?auto_25540 ?auto_25538 ) ) ( HOIST-AT ?auto_25537 ?auto_25540 ) ( not ( = ?auto_25541 ?auto_25537 ) ) ( AVAILABLE ?auto_25537 ) ( SURFACE-AT ?auto_25533 ?auto_25540 ) ( ON ?auto_25533 ?auto_25539 ) ( CLEAR ?auto_25533 ) ( not ( = ?auto_25533 ?auto_25539 ) ) ( not ( = ?auto_25534 ?auto_25539 ) ) ( IS-CRATE ?auto_25534 ) ( not ( = ?auto_25533 ?auto_25546 ) ) ( not ( = ?auto_25534 ?auto_25546 ) ) ( not ( = ?auto_25539 ?auto_25546 ) ) ( not ( = ?auto_25535 ?auto_25538 ) ) ( not ( = ?auto_25540 ?auto_25535 ) ) ( HOIST-AT ?auto_25543 ?auto_25535 ) ( not ( = ?auto_25541 ?auto_25543 ) ) ( not ( = ?auto_25537 ?auto_25543 ) ) ( SURFACE-AT ?auto_25534 ?auto_25535 ) ( ON ?auto_25534 ?auto_25536 ) ( CLEAR ?auto_25534 ) ( not ( = ?auto_25533 ?auto_25536 ) ) ( not ( = ?auto_25534 ?auto_25536 ) ) ( not ( = ?auto_25539 ?auto_25536 ) ) ( not ( = ?auto_25546 ?auto_25536 ) ) ( SURFACE-AT ?auto_25542 ?auto_25538 ) ( CLEAR ?auto_25542 ) ( IS-CRATE ?auto_25546 ) ( not ( = ?auto_25533 ?auto_25542 ) ) ( not ( = ?auto_25534 ?auto_25542 ) ) ( not ( = ?auto_25539 ?auto_25542 ) ) ( not ( = ?auto_25546 ?auto_25542 ) ) ( not ( = ?auto_25536 ?auto_25542 ) ) ( AVAILABLE ?auto_25541 ) ( AVAILABLE ?auto_25543 ) ( SURFACE-AT ?auto_25546 ?auto_25535 ) ( ON ?auto_25546 ?auto_25544 ) ( CLEAR ?auto_25546 ) ( not ( = ?auto_25533 ?auto_25544 ) ) ( not ( = ?auto_25534 ?auto_25544 ) ) ( not ( = ?auto_25539 ?auto_25544 ) ) ( not ( = ?auto_25546 ?auto_25544 ) ) ( not ( = ?auto_25536 ?auto_25544 ) ) ( not ( = ?auto_25542 ?auto_25544 ) ) ( TRUCK-AT ?auto_25545 ?auto_25538 ) )
    :subtasks
    ( ( !DRIVE ?auto_25545 ?auto_25538 ?auto_25535 )
      ( MAKE-ON ?auto_25533 ?auto_25534 )
      ( MAKE-ON-VERIFY ?auto_25533 ?auto_25534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25549 - SURFACE
      ?auto_25550 - SURFACE
    )
    :vars
    (
      ?auto_25551 - HOIST
      ?auto_25552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25551 ?auto_25552 ) ( SURFACE-AT ?auto_25550 ?auto_25552 ) ( CLEAR ?auto_25550 ) ( LIFTING ?auto_25551 ?auto_25549 ) ( IS-CRATE ?auto_25549 ) ( not ( = ?auto_25549 ?auto_25550 ) ) )
    :subtasks
    ( ( !DROP ?auto_25551 ?auto_25549 ?auto_25550 ?auto_25552 )
      ( MAKE-ON-VERIFY ?auto_25549 ?auto_25550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25553 - SURFACE
      ?auto_25554 - SURFACE
    )
    :vars
    (
      ?auto_25555 - HOIST
      ?auto_25556 - PLACE
      ?auto_25557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25555 ?auto_25556 ) ( SURFACE-AT ?auto_25554 ?auto_25556 ) ( CLEAR ?auto_25554 ) ( IS-CRATE ?auto_25553 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( TRUCK-AT ?auto_25557 ?auto_25556 ) ( AVAILABLE ?auto_25555 ) ( IN ?auto_25553 ?auto_25557 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25555 ?auto_25553 ?auto_25557 ?auto_25556 )
      ( MAKE-ON ?auto_25553 ?auto_25554 )
      ( MAKE-ON-VERIFY ?auto_25553 ?auto_25554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25558 - SURFACE
      ?auto_25559 - SURFACE
    )
    :vars
    (
      ?auto_25561 - HOIST
      ?auto_25560 - PLACE
      ?auto_25562 - TRUCK
      ?auto_25563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25561 ?auto_25560 ) ( SURFACE-AT ?auto_25559 ?auto_25560 ) ( CLEAR ?auto_25559 ) ( IS-CRATE ?auto_25558 ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( AVAILABLE ?auto_25561 ) ( IN ?auto_25558 ?auto_25562 ) ( TRUCK-AT ?auto_25562 ?auto_25563 ) ( not ( = ?auto_25563 ?auto_25560 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25562 ?auto_25563 ?auto_25560 )
      ( MAKE-ON ?auto_25558 ?auto_25559 )
      ( MAKE-ON-VERIFY ?auto_25558 ?auto_25559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25564 - SURFACE
      ?auto_25565 - SURFACE
    )
    :vars
    (
      ?auto_25566 - HOIST
      ?auto_25568 - PLACE
      ?auto_25569 - TRUCK
      ?auto_25567 - PLACE
      ?auto_25570 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25566 ?auto_25568 ) ( SURFACE-AT ?auto_25565 ?auto_25568 ) ( CLEAR ?auto_25565 ) ( IS-CRATE ?auto_25564 ) ( not ( = ?auto_25564 ?auto_25565 ) ) ( AVAILABLE ?auto_25566 ) ( TRUCK-AT ?auto_25569 ?auto_25567 ) ( not ( = ?auto_25567 ?auto_25568 ) ) ( HOIST-AT ?auto_25570 ?auto_25567 ) ( LIFTING ?auto_25570 ?auto_25564 ) ( not ( = ?auto_25566 ?auto_25570 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25570 ?auto_25564 ?auto_25569 ?auto_25567 )
      ( MAKE-ON ?auto_25564 ?auto_25565 )
      ( MAKE-ON-VERIFY ?auto_25564 ?auto_25565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25571 - SURFACE
      ?auto_25572 - SURFACE
    )
    :vars
    (
      ?auto_25573 - HOIST
      ?auto_25574 - PLACE
      ?auto_25577 - TRUCK
      ?auto_25575 - PLACE
      ?auto_25576 - HOIST
      ?auto_25578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25573 ?auto_25574 ) ( SURFACE-AT ?auto_25572 ?auto_25574 ) ( CLEAR ?auto_25572 ) ( IS-CRATE ?auto_25571 ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( AVAILABLE ?auto_25573 ) ( TRUCK-AT ?auto_25577 ?auto_25575 ) ( not ( = ?auto_25575 ?auto_25574 ) ) ( HOIST-AT ?auto_25576 ?auto_25575 ) ( not ( = ?auto_25573 ?auto_25576 ) ) ( AVAILABLE ?auto_25576 ) ( SURFACE-AT ?auto_25571 ?auto_25575 ) ( ON ?auto_25571 ?auto_25578 ) ( CLEAR ?auto_25571 ) ( not ( = ?auto_25571 ?auto_25578 ) ) ( not ( = ?auto_25572 ?auto_25578 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25576 ?auto_25571 ?auto_25578 ?auto_25575 )
      ( MAKE-ON ?auto_25571 ?auto_25572 )
      ( MAKE-ON-VERIFY ?auto_25571 ?auto_25572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25579 - SURFACE
      ?auto_25580 - SURFACE
    )
    :vars
    (
      ?auto_25586 - HOIST
      ?auto_25585 - PLACE
      ?auto_25584 - PLACE
      ?auto_25583 - HOIST
      ?auto_25582 - SURFACE
      ?auto_25581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25586 ?auto_25585 ) ( SURFACE-AT ?auto_25580 ?auto_25585 ) ( CLEAR ?auto_25580 ) ( IS-CRATE ?auto_25579 ) ( not ( = ?auto_25579 ?auto_25580 ) ) ( AVAILABLE ?auto_25586 ) ( not ( = ?auto_25584 ?auto_25585 ) ) ( HOIST-AT ?auto_25583 ?auto_25584 ) ( not ( = ?auto_25586 ?auto_25583 ) ) ( AVAILABLE ?auto_25583 ) ( SURFACE-AT ?auto_25579 ?auto_25584 ) ( ON ?auto_25579 ?auto_25582 ) ( CLEAR ?auto_25579 ) ( not ( = ?auto_25579 ?auto_25582 ) ) ( not ( = ?auto_25580 ?auto_25582 ) ) ( TRUCK-AT ?auto_25581 ?auto_25585 ) )
    :subtasks
    ( ( !DRIVE ?auto_25581 ?auto_25585 ?auto_25584 )
      ( MAKE-ON ?auto_25579 ?auto_25580 )
      ( MAKE-ON-VERIFY ?auto_25579 ?auto_25580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25587 - SURFACE
      ?auto_25588 - SURFACE
    )
    :vars
    (
      ?auto_25589 - HOIST
      ?auto_25594 - PLACE
      ?auto_25593 - PLACE
      ?auto_25592 - HOIST
      ?auto_25590 - SURFACE
      ?auto_25591 - TRUCK
      ?auto_25595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25589 ?auto_25594 ) ( IS-CRATE ?auto_25587 ) ( not ( = ?auto_25587 ?auto_25588 ) ) ( not ( = ?auto_25593 ?auto_25594 ) ) ( HOIST-AT ?auto_25592 ?auto_25593 ) ( not ( = ?auto_25589 ?auto_25592 ) ) ( AVAILABLE ?auto_25592 ) ( SURFACE-AT ?auto_25587 ?auto_25593 ) ( ON ?auto_25587 ?auto_25590 ) ( CLEAR ?auto_25587 ) ( not ( = ?auto_25587 ?auto_25590 ) ) ( not ( = ?auto_25588 ?auto_25590 ) ) ( TRUCK-AT ?auto_25591 ?auto_25594 ) ( SURFACE-AT ?auto_25595 ?auto_25594 ) ( CLEAR ?auto_25595 ) ( LIFTING ?auto_25589 ?auto_25588 ) ( IS-CRATE ?auto_25588 ) ( not ( = ?auto_25587 ?auto_25595 ) ) ( not ( = ?auto_25588 ?auto_25595 ) ) ( not ( = ?auto_25590 ?auto_25595 ) ) )
    :subtasks
    ( ( !DROP ?auto_25589 ?auto_25588 ?auto_25595 ?auto_25594 )
      ( MAKE-ON ?auto_25587 ?auto_25588 )
      ( MAKE-ON-VERIFY ?auto_25587 ?auto_25588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25596 - SURFACE
      ?auto_25597 - SURFACE
    )
    :vars
    (
      ?auto_25602 - HOIST
      ?auto_25603 - PLACE
      ?auto_25600 - PLACE
      ?auto_25604 - HOIST
      ?auto_25598 - SURFACE
      ?auto_25599 - TRUCK
      ?auto_25601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25602 ?auto_25603 ) ( IS-CRATE ?auto_25596 ) ( not ( = ?auto_25596 ?auto_25597 ) ) ( not ( = ?auto_25600 ?auto_25603 ) ) ( HOIST-AT ?auto_25604 ?auto_25600 ) ( not ( = ?auto_25602 ?auto_25604 ) ) ( AVAILABLE ?auto_25604 ) ( SURFACE-AT ?auto_25596 ?auto_25600 ) ( ON ?auto_25596 ?auto_25598 ) ( CLEAR ?auto_25596 ) ( not ( = ?auto_25596 ?auto_25598 ) ) ( not ( = ?auto_25597 ?auto_25598 ) ) ( TRUCK-AT ?auto_25599 ?auto_25603 ) ( SURFACE-AT ?auto_25601 ?auto_25603 ) ( CLEAR ?auto_25601 ) ( IS-CRATE ?auto_25597 ) ( not ( = ?auto_25596 ?auto_25601 ) ) ( not ( = ?auto_25597 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25601 ) ) ( AVAILABLE ?auto_25602 ) ( IN ?auto_25597 ?auto_25599 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25602 ?auto_25597 ?auto_25599 ?auto_25603 )
      ( MAKE-ON ?auto_25596 ?auto_25597 )
      ( MAKE-ON-VERIFY ?auto_25596 ?auto_25597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25605 - SURFACE
      ?auto_25606 - SURFACE
    )
    :vars
    (
      ?auto_25609 - HOIST
      ?auto_25613 - PLACE
      ?auto_25610 - PLACE
      ?auto_25608 - HOIST
      ?auto_25612 - SURFACE
      ?auto_25611 - SURFACE
      ?auto_25607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25609 ?auto_25613 ) ( IS-CRATE ?auto_25605 ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( not ( = ?auto_25610 ?auto_25613 ) ) ( HOIST-AT ?auto_25608 ?auto_25610 ) ( not ( = ?auto_25609 ?auto_25608 ) ) ( AVAILABLE ?auto_25608 ) ( SURFACE-AT ?auto_25605 ?auto_25610 ) ( ON ?auto_25605 ?auto_25612 ) ( CLEAR ?auto_25605 ) ( not ( = ?auto_25605 ?auto_25612 ) ) ( not ( = ?auto_25606 ?auto_25612 ) ) ( SURFACE-AT ?auto_25611 ?auto_25613 ) ( CLEAR ?auto_25611 ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25605 ?auto_25611 ) ) ( not ( = ?auto_25606 ?auto_25611 ) ) ( not ( = ?auto_25612 ?auto_25611 ) ) ( AVAILABLE ?auto_25609 ) ( IN ?auto_25606 ?auto_25607 ) ( TRUCK-AT ?auto_25607 ?auto_25610 ) )
    :subtasks
    ( ( !DRIVE ?auto_25607 ?auto_25610 ?auto_25613 )
      ( MAKE-ON ?auto_25605 ?auto_25606 )
      ( MAKE-ON-VERIFY ?auto_25605 ?auto_25606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25614 - SURFACE
      ?auto_25615 - SURFACE
    )
    :vars
    (
      ?auto_25620 - HOIST
      ?auto_25621 - PLACE
      ?auto_25622 - PLACE
      ?auto_25617 - HOIST
      ?auto_25619 - SURFACE
      ?auto_25616 - SURFACE
      ?auto_25618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25620 ?auto_25621 ) ( IS-CRATE ?auto_25614 ) ( not ( = ?auto_25614 ?auto_25615 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( HOIST-AT ?auto_25617 ?auto_25622 ) ( not ( = ?auto_25620 ?auto_25617 ) ) ( SURFACE-AT ?auto_25614 ?auto_25622 ) ( ON ?auto_25614 ?auto_25619 ) ( CLEAR ?auto_25614 ) ( not ( = ?auto_25614 ?auto_25619 ) ) ( not ( = ?auto_25615 ?auto_25619 ) ) ( SURFACE-AT ?auto_25616 ?auto_25621 ) ( CLEAR ?auto_25616 ) ( IS-CRATE ?auto_25615 ) ( not ( = ?auto_25614 ?auto_25616 ) ) ( not ( = ?auto_25615 ?auto_25616 ) ) ( not ( = ?auto_25619 ?auto_25616 ) ) ( AVAILABLE ?auto_25620 ) ( TRUCK-AT ?auto_25618 ?auto_25622 ) ( LIFTING ?auto_25617 ?auto_25615 ) )
    :subtasks
    ( ( !LOAD ?auto_25617 ?auto_25615 ?auto_25618 ?auto_25622 )
      ( MAKE-ON ?auto_25614 ?auto_25615 )
      ( MAKE-ON-VERIFY ?auto_25614 ?auto_25615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25623 - SURFACE
      ?auto_25624 - SURFACE
    )
    :vars
    (
      ?auto_25628 - HOIST
      ?auto_25629 - PLACE
      ?auto_25631 - PLACE
      ?auto_25627 - HOIST
      ?auto_25630 - SURFACE
      ?auto_25626 - SURFACE
      ?auto_25625 - TRUCK
      ?auto_25632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25628 ?auto_25629 ) ( IS-CRATE ?auto_25623 ) ( not ( = ?auto_25623 ?auto_25624 ) ) ( not ( = ?auto_25631 ?auto_25629 ) ) ( HOIST-AT ?auto_25627 ?auto_25631 ) ( not ( = ?auto_25628 ?auto_25627 ) ) ( SURFACE-AT ?auto_25623 ?auto_25631 ) ( ON ?auto_25623 ?auto_25630 ) ( CLEAR ?auto_25623 ) ( not ( = ?auto_25623 ?auto_25630 ) ) ( not ( = ?auto_25624 ?auto_25630 ) ) ( SURFACE-AT ?auto_25626 ?auto_25629 ) ( CLEAR ?auto_25626 ) ( IS-CRATE ?auto_25624 ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25624 ?auto_25626 ) ) ( not ( = ?auto_25630 ?auto_25626 ) ) ( AVAILABLE ?auto_25628 ) ( TRUCK-AT ?auto_25625 ?auto_25631 ) ( AVAILABLE ?auto_25627 ) ( SURFACE-AT ?auto_25624 ?auto_25631 ) ( ON ?auto_25624 ?auto_25632 ) ( CLEAR ?auto_25624 ) ( not ( = ?auto_25623 ?auto_25632 ) ) ( not ( = ?auto_25624 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( not ( = ?auto_25626 ?auto_25632 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25627 ?auto_25624 ?auto_25632 ?auto_25631 )
      ( MAKE-ON ?auto_25623 ?auto_25624 )
      ( MAKE-ON-VERIFY ?auto_25623 ?auto_25624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25633 - SURFACE
      ?auto_25634 - SURFACE
    )
    :vars
    (
      ?auto_25635 - HOIST
      ?auto_25638 - PLACE
      ?auto_25642 - PLACE
      ?auto_25640 - HOIST
      ?auto_25637 - SURFACE
      ?auto_25639 - SURFACE
      ?auto_25641 - SURFACE
      ?auto_25636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25635 ?auto_25638 ) ( IS-CRATE ?auto_25633 ) ( not ( = ?auto_25633 ?auto_25634 ) ) ( not ( = ?auto_25642 ?auto_25638 ) ) ( HOIST-AT ?auto_25640 ?auto_25642 ) ( not ( = ?auto_25635 ?auto_25640 ) ) ( SURFACE-AT ?auto_25633 ?auto_25642 ) ( ON ?auto_25633 ?auto_25637 ) ( CLEAR ?auto_25633 ) ( not ( = ?auto_25633 ?auto_25637 ) ) ( not ( = ?auto_25634 ?auto_25637 ) ) ( SURFACE-AT ?auto_25639 ?auto_25638 ) ( CLEAR ?auto_25639 ) ( IS-CRATE ?auto_25634 ) ( not ( = ?auto_25633 ?auto_25639 ) ) ( not ( = ?auto_25634 ?auto_25639 ) ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( AVAILABLE ?auto_25635 ) ( AVAILABLE ?auto_25640 ) ( SURFACE-AT ?auto_25634 ?auto_25642 ) ( ON ?auto_25634 ?auto_25641 ) ( CLEAR ?auto_25634 ) ( not ( = ?auto_25633 ?auto_25641 ) ) ( not ( = ?auto_25634 ?auto_25641 ) ) ( not ( = ?auto_25637 ?auto_25641 ) ) ( not ( = ?auto_25639 ?auto_25641 ) ) ( TRUCK-AT ?auto_25636 ?auto_25638 ) )
    :subtasks
    ( ( !DRIVE ?auto_25636 ?auto_25638 ?auto_25642 )
      ( MAKE-ON ?auto_25633 ?auto_25634 )
      ( MAKE-ON-VERIFY ?auto_25633 ?auto_25634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25643 - SURFACE
      ?auto_25644 - SURFACE
    )
    :vars
    (
      ?auto_25651 - HOIST
      ?auto_25652 - PLACE
      ?auto_25649 - PLACE
      ?auto_25646 - HOIST
      ?auto_25648 - SURFACE
      ?auto_25645 - SURFACE
      ?auto_25647 - SURFACE
      ?auto_25650 - TRUCK
      ?auto_25653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25651 ?auto_25652 ) ( IS-CRATE ?auto_25643 ) ( not ( = ?auto_25643 ?auto_25644 ) ) ( not ( = ?auto_25649 ?auto_25652 ) ) ( HOIST-AT ?auto_25646 ?auto_25649 ) ( not ( = ?auto_25651 ?auto_25646 ) ) ( SURFACE-AT ?auto_25643 ?auto_25649 ) ( ON ?auto_25643 ?auto_25648 ) ( CLEAR ?auto_25643 ) ( not ( = ?auto_25643 ?auto_25648 ) ) ( not ( = ?auto_25644 ?auto_25648 ) ) ( IS-CRATE ?auto_25644 ) ( not ( = ?auto_25643 ?auto_25645 ) ) ( not ( = ?auto_25644 ?auto_25645 ) ) ( not ( = ?auto_25648 ?auto_25645 ) ) ( AVAILABLE ?auto_25646 ) ( SURFACE-AT ?auto_25644 ?auto_25649 ) ( ON ?auto_25644 ?auto_25647 ) ( CLEAR ?auto_25644 ) ( not ( = ?auto_25643 ?auto_25647 ) ) ( not ( = ?auto_25644 ?auto_25647 ) ) ( not ( = ?auto_25648 ?auto_25647 ) ) ( not ( = ?auto_25645 ?auto_25647 ) ) ( TRUCK-AT ?auto_25650 ?auto_25652 ) ( SURFACE-AT ?auto_25653 ?auto_25652 ) ( CLEAR ?auto_25653 ) ( LIFTING ?auto_25651 ?auto_25645 ) ( IS-CRATE ?auto_25645 ) ( not ( = ?auto_25643 ?auto_25653 ) ) ( not ( = ?auto_25644 ?auto_25653 ) ) ( not ( = ?auto_25648 ?auto_25653 ) ) ( not ( = ?auto_25645 ?auto_25653 ) ) ( not ( = ?auto_25647 ?auto_25653 ) ) )
    :subtasks
    ( ( !DROP ?auto_25651 ?auto_25645 ?auto_25653 ?auto_25652 )
      ( MAKE-ON ?auto_25643 ?auto_25644 )
      ( MAKE-ON-VERIFY ?auto_25643 ?auto_25644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25654 - SURFACE
      ?auto_25655 - SURFACE
    )
    :vars
    (
      ?auto_25664 - HOIST
      ?auto_25663 - PLACE
      ?auto_25658 - PLACE
      ?auto_25662 - HOIST
      ?auto_25656 - SURFACE
      ?auto_25657 - SURFACE
      ?auto_25660 - SURFACE
      ?auto_25661 - TRUCK
      ?auto_25659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25664 ?auto_25663 ) ( IS-CRATE ?auto_25654 ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( HOIST-AT ?auto_25662 ?auto_25658 ) ( not ( = ?auto_25664 ?auto_25662 ) ) ( SURFACE-AT ?auto_25654 ?auto_25658 ) ( ON ?auto_25654 ?auto_25656 ) ( CLEAR ?auto_25654 ) ( not ( = ?auto_25654 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( IS-CRATE ?auto_25655 ) ( not ( = ?auto_25654 ?auto_25657 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( AVAILABLE ?auto_25662 ) ( SURFACE-AT ?auto_25655 ?auto_25658 ) ( ON ?auto_25655 ?auto_25660 ) ( CLEAR ?auto_25655 ) ( not ( = ?auto_25654 ?auto_25660 ) ) ( not ( = ?auto_25655 ?auto_25660 ) ) ( not ( = ?auto_25656 ?auto_25660 ) ) ( not ( = ?auto_25657 ?auto_25660 ) ) ( TRUCK-AT ?auto_25661 ?auto_25663 ) ( SURFACE-AT ?auto_25659 ?auto_25663 ) ( CLEAR ?auto_25659 ) ( IS-CRATE ?auto_25657 ) ( not ( = ?auto_25654 ?auto_25659 ) ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25656 ?auto_25659 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25660 ?auto_25659 ) ) ( AVAILABLE ?auto_25664 ) ( IN ?auto_25657 ?auto_25661 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25664 ?auto_25657 ?auto_25661 ?auto_25663 )
      ( MAKE-ON ?auto_25654 ?auto_25655 )
      ( MAKE-ON-VERIFY ?auto_25654 ?auto_25655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25665 - SURFACE
      ?auto_25666 - SURFACE
    )
    :vars
    (
      ?auto_25667 - HOIST
      ?auto_25669 - PLACE
      ?auto_25675 - PLACE
      ?auto_25670 - HOIST
      ?auto_25668 - SURFACE
      ?auto_25671 - SURFACE
      ?auto_25672 - SURFACE
      ?auto_25673 - SURFACE
      ?auto_25674 - TRUCK
      ?auto_25676 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25667 ?auto_25669 ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25675 ?auto_25669 ) ) ( HOIST-AT ?auto_25670 ?auto_25675 ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( SURFACE-AT ?auto_25665 ?auto_25675 ) ( ON ?auto_25665 ?auto_25668 ) ( CLEAR ?auto_25665 ) ( not ( = ?auto_25665 ?auto_25668 ) ) ( not ( = ?auto_25666 ?auto_25668 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25671 ) ) ( not ( = ?auto_25666 ?auto_25671 ) ) ( not ( = ?auto_25668 ?auto_25671 ) ) ( AVAILABLE ?auto_25670 ) ( SURFACE-AT ?auto_25666 ?auto_25675 ) ( ON ?auto_25666 ?auto_25672 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25672 ) ) ( not ( = ?auto_25666 ?auto_25672 ) ) ( not ( = ?auto_25668 ?auto_25672 ) ) ( not ( = ?auto_25671 ?auto_25672 ) ) ( SURFACE-AT ?auto_25673 ?auto_25669 ) ( CLEAR ?auto_25673 ) ( IS-CRATE ?auto_25671 ) ( not ( = ?auto_25665 ?auto_25673 ) ) ( not ( = ?auto_25666 ?auto_25673 ) ) ( not ( = ?auto_25668 ?auto_25673 ) ) ( not ( = ?auto_25671 ?auto_25673 ) ) ( not ( = ?auto_25672 ?auto_25673 ) ) ( AVAILABLE ?auto_25667 ) ( IN ?auto_25671 ?auto_25674 ) ( TRUCK-AT ?auto_25674 ?auto_25676 ) ( not ( = ?auto_25676 ?auto_25669 ) ) ( not ( = ?auto_25675 ?auto_25676 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25674 ?auto_25676 ?auto_25669 )
      ( MAKE-ON ?auto_25665 ?auto_25666 )
      ( MAKE-ON-VERIFY ?auto_25665 ?auto_25666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25677 - SURFACE
      ?auto_25678 - SURFACE
    )
    :vars
    (
      ?auto_25682 - HOIST
      ?auto_25686 - PLACE
      ?auto_25685 - PLACE
      ?auto_25683 - HOIST
      ?auto_25680 - SURFACE
      ?auto_25679 - SURFACE
      ?auto_25687 - SURFACE
      ?auto_25684 - SURFACE
      ?auto_25688 - TRUCK
      ?auto_25681 - PLACE
      ?auto_25689 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25682 ?auto_25686 ) ( IS-CRATE ?auto_25677 ) ( not ( = ?auto_25677 ?auto_25678 ) ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( HOIST-AT ?auto_25683 ?auto_25685 ) ( not ( = ?auto_25682 ?auto_25683 ) ) ( SURFACE-AT ?auto_25677 ?auto_25685 ) ( ON ?auto_25677 ?auto_25680 ) ( CLEAR ?auto_25677 ) ( not ( = ?auto_25677 ?auto_25680 ) ) ( not ( = ?auto_25678 ?auto_25680 ) ) ( IS-CRATE ?auto_25678 ) ( not ( = ?auto_25677 ?auto_25679 ) ) ( not ( = ?auto_25678 ?auto_25679 ) ) ( not ( = ?auto_25680 ?auto_25679 ) ) ( AVAILABLE ?auto_25683 ) ( SURFACE-AT ?auto_25678 ?auto_25685 ) ( ON ?auto_25678 ?auto_25687 ) ( CLEAR ?auto_25678 ) ( not ( = ?auto_25677 ?auto_25687 ) ) ( not ( = ?auto_25678 ?auto_25687 ) ) ( not ( = ?auto_25680 ?auto_25687 ) ) ( not ( = ?auto_25679 ?auto_25687 ) ) ( SURFACE-AT ?auto_25684 ?auto_25686 ) ( CLEAR ?auto_25684 ) ( IS-CRATE ?auto_25679 ) ( not ( = ?auto_25677 ?auto_25684 ) ) ( not ( = ?auto_25678 ?auto_25684 ) ) ( not ( = ?auto_25680 ?auto_25684 ) ) ( not ( = ?auto_25679 ?auto_25684 ) ) ( not ( = ?auto_25687 ?auto_25684 ) ) ( AVAILABLE ?auto_25682 ) ( TRUCK-AT ?auto_25688 ?auto_25681 ) ( not ( = ?auto_25681 ?auto_25686 ) ) ( not ( = ?auto_25685 ?auto_25681 ) ) ( HOIST-AT ?auto_25689 ?auto_25681 ) ( LIFTING ?auto_25689 ?auto_25679 ) ( not ( = ?auto_25682 ?auto_25689 ) ) ( not ( = ?auto_25683 ?auto_25689 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25689 ?auto_25679 ?auto_25688 ?auto_25681 )
      ( MAKE-ON ?auto_25677 ?auto_25678 )
      ( MAKE-ON-VERIFY ?auto_25677 ?auto_25678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25690 - SURFACE
      ?auto_25691 - SURFACE
    )
    :vars
    (
      ?auto_25701 - HOIST
      ?auto_25698 - PLACE
      ?auto_25702 - PLACE
      ?auto_25696 - HOIST
      ?auto_25694 - SURFACE
      ?auto_25692 - SURFACE
      ?auto_25699 - SURFACE
      ?auto_25700 - SURFACE
      ?auto_25697 - TRUCK
      ?auto_25695 - PLACE
      ?auto_25693 - HOIST
      ?auto_25703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25701 ?auto_25698 ) ( IS-CRATE ?auto_25690 ) ( not ( = ?auto_25690 ?auto_25691 ) ) ( not ( = ?auto_25702 ?auto_25698 ) ) ( HOIST-AT ?auto_25696 ?auto_25702 ) ( not ( = ?auto_25701 ?auto_25696 ) ) ( SURFACE-AT ?auto_25690 ?auto_25702 ) ( ON ?auto_25690 ?auto_25694 ) ( CLEAR ?auto_25690 ) ( not ( = ?auto_25690 ?auto_25694 ) ) ( not ( = ?auto_25691 ?auto_25694 ) ) ( IS-CRATE ?auto_25691 ) ( not ( = ?auto_25690 ?auto_25692 ) ) ( not ( = ?auto_25691 ?auto_25692 ) ) ( not ( = ?auto_25694 ?auto_25692 ) ) ( AVAILABLE ?auto_25696 ) ( SURFACE-AT ?auto_25691 ?auto_25702 ) ( ON ?auto_25691 ?auto_25699 ) ( CLEAR ?auto_25691 ) ( not ( = ?auto_25690 ?auto_25699 ) ) ( not ( = ?auto_25691 ?auto_25699 ) ) ( not ( = ?auto_25694 ?auto_25699 ) ) ( not ( = ?auto_25692 ?auto_25699 ) ) ( SURFACE-AT ?auto_25700 ?auto_25698 ) ( CLEAR ?auto_25700 ) ( IS-CRATE ?auto_25692 ) ( not ( = ?auto_25690 ?auto_25700 ) ) ( not ( = ?auto_25691 ?auto_25700 ) ) ( not ( = ?auto_25694 ?auto_25700 ) ) ( not ( = ?auto_25692 ?auto_25700 ) ) ( not ( = ?auto_25699 ?auto_25700 ) ) ( AVAILABLE ?auto_25701 ) ( TRUCK-AT ?auto_25697 ?auto_25695 ) ( not ( = ?auto_25695 ?auto_25698 ) ) ( not ( = ?auto_25702 ?auto_25695 ) ) ( HOIST-AT ?auto_25693 ?auto_25695 ) ( not ( = ?auto_25701 ?auto_25693 ) ) ( not ( = ?auto_25696 ?auto_25693 ) ) ( AVAILABLE ?auto_25693 ) ( SURFACE-AT ?auto_25692 ?auto_25695 ) ( ON ?auto_25692 ?auto_25703 ) ( CLEAR ?auto_25692 ) ( not ( = ?auto_25690 ?auto_25703 ) ) ( not ( = ?auto_25691 ?auto_25703 ) ) ( not ( = ?auto_25694 ?auto_25703 ) ) ( not ( = ?auto_25692 ?auto_25703 ) ) ( not ( = ?auto_25699 ?auto_25703 ) ) ( not ( = ?auto_25700 ?auto_25703 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25693 ?auto_25692 ?auto_25703 ?auto_25695 )
      ( MAKE-ON ?auto_25690 ?auto_25691 )
      ( MAKE-ON-VERIFY ?auto_25690 ?auto_25691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25704 - SURFACE
      ?auto_25705 - SURFACE
    )
    :vars
    (
      ?auto_25708 - HOIST
      ?auto_25707 - PLACE
      ?auto_25711 - PLACE
      ?auto_25710 - HOIST
      ?auto_25709 - SURFACE
      ?auto_25717 - SURFACE
      ?auto_25706 - SURFACE
      ?auto_25712 - SURFACE
      ?auto_25715 - PLACE
      ?auto_25713 - HOIST
      ?auto_25716 - SURFACE
      ?auto_25714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25708 ?auto_25707 ) ( IS-CRATE ?auto_25704 ) ( not ( = ?auto_25704 ?auto_25705 ) ) ( not ( = ?auto_25711 ?auto_25707 ) ) ( HOIST-AT ?auto_25710 ?auto_25711 ) ( not ( = ?auto_25708 ?auto_25710 ) ) ( SURFACE-AT ?auto_25704 ?auto_25711 ) ( ON ?auto_25704 ?auto_25709 ) ( CLEAR ?auto_25704 ) ( not ( = ?auto_25704 ?auto_25709 ) ) ( not ( = ?auto_25705 ?auto_25709 ) ) ( IS-CRATE ?auto_25705 ) ( not ( = ?auto_25704 ?auto_25717 ) ) ( not ( = ?auto_25705 ?auto_25717 ) ) ( not ( = ?auto_25709 ?auto_25717 ) ) ( AVAILABLE ?auto_25710 ) ( SURFACE-AT ?auto_25705 ?auto_25711 ) ( ON ?auto_25705 ?auto_25706 ) ( CLEAR ?auto_25705 ) ( not ( = ?auto_25704 ?auto_25706 ) ) ( not ( = ?auto_25705 ?auto_25706 ) ) ( not ( = ?auto_25709 ?auto_25706 ) ) ( not ( = ?auto_25717 ?auto_25706 ) ) ( SURFACE-AT ?auto_25712 ?auto_25707 ) ( CLEAR ?auto_25712 ) ( IS-CRATE ?auto_25717 ) ( not ( = ?auto_25704 ?auto_25712 ) ) ( not ( = ?auto_25705 ?auto_25712 ) ) ( not ( = ?auto_25709 ?auto_25712 ) ) ( not ( = ?auto_25717 ?auto_25712 ) ) ( not ( = ?auto_25706 ?auto_25712 ) ) ( AVAILABLE ?auto_25708 ) ( not ( = ?auto_25715 ?auto_25707 ) ) ( not ( = ?auto_25711 ?auto_25715 ) ) ( HOIST-AT ?auto_25713 ?auto_25715 ) ( not ( = ?auto_25708 ?auto_25713 ) ) ( not ( = ?auto_25710 ?auto_25713 ) ) ( AVAILABLE ?auto_25713 ) ( SURFACE-AT ?auto_25717 ?auto_25715 ) ( ON ?auto_25717 ?auto_25716 ) ( CLEAR ?auto_25717 ) ( not ( = ?auto_25704 ?auto_25716 ) ) ( not ( = ?auto_25705 ?auto_25716 ) ) ( not ( = ?auto_25709 ?auto_25716 ) ) ( not ( = ?auto_25717 ?auto_25716 ) ) ( not ( = ?auto_25706 ?auto_25716 ) ) ( not ( = ?auto_25712 ?auto_25716 ) ) ( TRUCK-AT ?auto_25714 ?auto_25707 ) )
    :subtasks
    ( ( !DRIVE ?auto_25714 ?auto_25707 ?auto_25715 )
      ( MAKE-ON ?auto_25704 ?auto_25705 )
      ( MAKE-ON-VERIFY ?auto_25704 ?auto_25705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25718 - SURFACE
      ?auto_25719 - SURFACE
    )
    :vars
    (
      ?auto_25731 - HOIST
      ?auto_25724 - PLACE
      ?auto_25723 - PLACE
      ?auto_25720 - HOIST
      ?auto_25721 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25725 - SURFACE
      ?auto_25722 - SURFACE
      ?auto_25729 - PLACE
      ?auto_25726 - HOIST
      ?auto_25728 - SURFACE
      ?auto_25727 - TRUCK
      ?auto_25732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25731 ?auto_25724 ) ( IS-CRATE ?auto_25718 ) ( not ( = ?auto_25718 ?auto_25719 ) ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( HOIST-AT ?auto_25720 ?auto_25723 ) ( not ( = ?auto_25731 ?auto_25720 ) ) ( SURFACE-AT ?auto_25718 ?auto_25723 ) ( ON ?auto_25718 ?auto_25721 ) ( CLEAR ?auto_25718 ) ( not ( = ?auto_25718 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( IS-CRATE ?auto_25719 ) ( not ( = ?auto_25718 ?auto_25730 ) ) ( not ( = ?auto_25719 ?auto_25730 ) ) ( not ( = ?auto_25721 ?auto_25730 ) ) ( AVAILABLE ?auto_25720 ) ( SURFACE-AT ?auto_25719 ?auto_25723 ) ( ON ?auto_25719 ?auto_25725 ) ( CLEAR ?auto_25719 ) ( not ( = ?auto_25718 ?auto_25725 ) ) ( not ( = ?auto_25719 ?auto_25725 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25730 ?auto_25725 ) ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25718 ?auto_25722 ) ) ( not ( = ?auto_25719 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25730 ?auto_25722 ) ) ( not ( = ?auto_25725 ?auto_25722 ) ) ( not ( = ?auto_25729 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( HOIST-AT ?auto_25726 ?auto_25729 ) ( not ( = ?auto_25731 ?auto_25726 ) ) ( not ( = ?auto_25720 ?auto_25726 ) ) ( AVAILABLE ?auto_25726 ) ( SURFACE-AT ?auto_25730 ?auto_25729 ) ( ON ?auto_25730 ?auto_25728 ) ( CLEAR ?auto_25730 ) ( not ( = ?auto_25718 ?auto_25728 ) ) ( not ( = ?auto_25719 ?auto_25728 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( not ( = ?auto_25730 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( TRUCK-AT ?auto_25727 ?auto_25724 ) ( SURFACE-AT ?auto_25732 ?auto_25724 ) ( CLEAR ?auto_25732 ) ( LIFTING ?auto_25731 ?auto_25722 ) ( IS-CRATE ?auto_25722 ) ( not ( = ?auto_25718 ?auto_25732 ) ) ( not ( = ?auto_25719 ?auto_25732 ) ) ( not ( = ?auto_25721 ?auto_25732 ) ) ( not ( = ?auto_25730 ?auto_25732 ) ) ( not ( = ?auto_25725 ?auto_25732 ) ) ( not ( = ?auto_25722 ?auto_25732 ) ) ( not ( = ?auto_25728 ?auto_25732 ) ) )
    :subtasks
    ( ( !DROP ?auto_25731 ?auto_25722 ?auto_25732 ?auto_25724 )
      ( MAKE-ON ?auto_25718 ?auto_25719 )
      ( MAKE-ON-VERIFY ?auto_25718 ?auto_25719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25733 - SURFACE
      ?auto_25734 - SURFACE
    )
    :vars
    (
      ?auto_25740 - HOIST
      ?auto_25747 - PLACE
      ?auto_25745 - PLACE
      ?auto_25743 - HOIST
      ?auto_25744 - SURFACE
      ?auto_25737 - SURFACE
      ?auto_25738 - SURFACE
      ?auto_25735 - SURFACE
      ?auto_25741 - PLACE
      ?auto_25742 - HOIST
      ?auto_25736 - SURFACE
      ?auto_25746 - TRUCK
      ?auto_25739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25740 ?auto_25747 ) ( IS-CRATE ?auto_25733 ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( not ( = ?auto_25745 ?auto_25747 ) ) ( HOIST-AT ?auto_25743 ?auto_25745 ) ( not ( = ?auto_25740 ?auto_25743 ) ) ( SURFACE-AT ?auto_25733 ?auto_25745 ) ( ON ?auto_25733 ?auto_25744 ) ( CLEAR ?auto_25733 ) ( not ( = ?auto_25733 ?auto_25744 ) ) ( not ( = ?auto_25734 ?auto_25744 ) ) ( IS-CRATE ?auto_25734 ) ( not ( = ?auto_25733 ?auto_25737 ) ) ( not ( = ?auto_25734 ?auto_25737 ) ) ( not ( = ?auto_25744 ?auto_25737 ) ) ( AVAILABLE ?auto_25743 ) ( SURFACE-AT ?auto_25734 ?auto_25745 ) ( ON ?auto_25734 ?auto_25738 ) ( CLEAR ?auto_25734 ) ( not ( = ?auto_25733 ?auto_25738 ) ) ( not ( = ?auto_25734 ?auto_25738 ) ) ( not ( = ?auto_25744 ?auto_25738 ) ) ( not ( = ?auto_25737 ?auto_25738 ) ) ( IS-CRATE ?auto_25737 ) ( not ( = ?auto_25733 ?auto_25735 ) ) ( not ( = ?auto_25734 ?auto_25735 ) ) ( not ( = ?auto_25744 ?auto_25735 ) ) ( not ( = ?auto_25737 ?auto_25735 ) ) ( not ( = ?auto_25738 ?auto_25735 ) ) ( not ( = ?auto_25741 ?auto_25747 ) ) ( not ( = ?auto_25745 ?auto_25741 ) ) ( HOIST-AT ?auto_25742 ?auto_25741 ) ( not ( = ?auto_25740 ?auto_25742 ) ) ( not ( = ?auto_25743 ?auto_25742 ) ) ( AVAILABLE ?auto_25742 ) ( SURFACE-AT ?auto_25737 ?auto_25741 ) ( ON ?auto_25737 ?auto_25736 ) ( CLEAR ?auto_25737 ) ( not ( = ?auto_25733 ?auto_25736 ) ) ( not ( = ?auto_25734 ?auto_25736 ) ) ( not ( = ?auto_25744 ?auto_25736 ) ) ( not ( = ?auto_25737 ?auto_25736 ) ) ( not ( = ?auto_25738 ?auto_25736 ) ) ( not ( = ?auto_25735 ?auto_25736 ) ) ( TRUCK-AT ?auto_25746 ?auto_25747 ) ( SURFACE-AT ?auto_25739 ?auto_25747 ) ( CLEAR ?auto_25739 ) ( IS-CRATE ?auto_25735 ) ( not ( = ?auto_25733 ?auto_25739 ) ) ( not ( = ?auto_25734 ?auto_25739 ) ) ( not ( = ?auto_25744 ?auto_25739 ) ) ( not ( = ?auto_25737 ?auto_25739 ) ) ( not ( = ?auto_25738 ?auto_25739 ) ) ( not ( = ?auto_25735 ?auto_25739 ) ) ( not ( = ?auto_25736 ?auto_25739 ) ) ( AVAILABLE ?auto_25740 ) ( IN ?auto_25735 ?auto_25746 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25740 ?auto_25735 ?auto_25746 ?auto_25747 )
      ( MAKE-ON ?auto_25733 ?auto_25734 )
      ( MAKE-ON-VERIFY ?auto_25733 ?auto_25734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25748 - SURFACE
      ?auto_25749 - SURFACE
    )
    :vars
    (
      ?auto_25752 - HOIST
      ?auto_25760 - PLACE
      ?auto_25751 - PLACE
      ?auto_25750 - HOIST
      ?auto_25757 - SURFACE
      ?auto_25758 - SURFACE
      ?auto_25761 - SURFACE
      ?auto_25755 - SURFACE
      ?auto_25753 - PLACE
      ?auto_25754 - HOIST
      ?auto_25762 - SURFACE
      ?auto_25759 - SURFACE
      ?auto_25756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25752 ?auto_25760 ) ( IS-CRATE ?auto_25748 ) ( not ( = ?auto_25748 ?auto_25749 ) ) ( not ( = ?auto_25751 ?auto_25760 ) ) ( HOIST-AT ?auto_25750 ?auto_25751 ) ( not ( = ?auto_25752 ?auto_25750 ) ) ( SURFACE-AT ?auto_25748 ?auto_25751 ) ( ON ?auto_25748 ?auto_25757 ) ( CLEAR ?auto_25748 ) ( not ( = ?auto_25748 ?auto_25757 ) ) ( not ( = ?auto_25749 ?auto_25757 ) ) ( IS-CRATE ?auto_25749 ) ( not ( = ?auto_25748 ?auto_25758 ) ) ( not ( = ?auto_25749 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( AVAILABLE ?auto_25750 ) ( SURFACE-AT ?auto_25749 ?auto_25751 ) ( ON ?auto_25749 ?auto_25761 ) ( CLEAR ?auto_25749 ) ( not ( = ?auto_25748 ?auto_25761 ) ) ( not ( = ?auto_25749 ?auto_25761 ) ) ( not ( = ?auto_25757 ?auto_25761 ) ) ( not ( = ?auto_25758 ?auto_25761 ) ) ( IS-CRATE ?auto_25758 ) ( not ( = ?auto_25748 ?auto_25755 ) ) ( not ( = ?auto_25749 ?auto_25755 ) ) ( not ( = ?auto_25757 ?auto_25755 ) ) ( not ( = ?auto_25758 ?auto_25755 ) ) ( not ( = ?auto_25761 ?auto_25755 ) ) ( not ( = ?auto_25753 ?auto_25760 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( HOIST-AT ?auto_25754 ?auto_25753 ) ( not ( = ?auto_25752 ?auto_25754 ) ) ( not ( = ?auto_25750 ?auto_25754 ) ) ( AVAILABLE ?auto_25754 ) ( SURFACE-AT ?auto_25758 ?auto_25753 ) ( ON ?auto_25758 ?auto_25762 ) ( CLEAR ?auto_25758 ) ( not ( = ?auto_25748 ?auto_25762 ) ) ( not ( = ?auto_25749 ?auto_25762 ) ) ( not ( = ?auto_25757 ?auto_25762 ) ) ( not ( = ?auto_25758 ?auto_25762 ) ) ( not ( = ?auto_25761 ?auto_25762 ) ) ( not ( = ?auto_25755 ?auto_25762 ) ) ( SURFACE-AT ?auto_25759 ?auto_25760 ) ( CLEAR ?auto_25759 ) ( IS-CRATE ?auto_25755 ) ( not ( = ?auto_25748 ?auto_25759 ) ) ( not ( = ?auto_25749 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25761 ?auto_25759 ) ) ( not ( = ?auto_25755 ?auto_25759 ) ) ( not ( = ?auto_25762 ?auto_25759 ) ) ( AVAILABLE ?auto_25752 ) ( IN ?auto_25755 ?auto_25756 ) ( TRUCK-AT ?auto_25756 ?auto_25753 ) )
    :subtasks
    ( ( !DRIVE ?auto_25756 ?auto_25753 ?auto_25760 )
      ( MAKE-ON ?auto_25748 ?auto_25749 )
      ( MAKE-ON-VERIFY ?auto_25748 ?auto_25749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25763 - SURFACE
      ?auto_25764 - SURFACE
    )
    :vars
    (
      ?auto_25771 - HOIST
      ?auto_25770 - PLACE
      ?auto_25774 - PLACE
      ?auto_25772 - HOIST
      ?auto_25769 - SURFACE
      ?auto_25775 - SURFACE
      ?auto_25765 - SURFACE
      ?auto_25767 - SURFACE
      ?auto_25776 - PLACE
      ?auto_25773 - HOIST
      ?auto_25768 - SURFACE
      ?auto_25777 - SURFACE
      ?auto_25766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25771 ?auto_25770 ) ( IS-CRATE ?auto_25763 ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( not ( = ?auto_25774 ?auto_25770 ) ) ( HOIST-AT ?auto_25772 ?auto_25774 ) ( not ( = ?auto_25771 ?auto_25772 ) ) ( SURFACE-AT ?auto_25763 ?auto_25774 ) ( ON ?auto_25763 ?auto_25769 ) ( CLEAR ?auto_25763 ) ( not ( = ?auto_25763 ?auto_25769 ) ) ( not ( = ?auto_25764 ?auto_25769 ) ) ( IS-CRATE ?auto_25764 ) ( not ( = ?auto_25763 ?auto_25775 ) ) ( not ( = ?auto_25764 ?auto_25775 ) ) ( not ( = ?auto_25769 ?auto_25775 ) ) ( AVAILABLE ?auto_25772 ) ( SURFACE-AT ?auto_25764 ?auto_25774 ) ( ON ?auto_25764 ?auto_25765 ) ( CLEAR ?auto_25764 ) ( not ( = ?auto_25763 ?auto_25765 ) ) ( not ( = ?auto_25764 ?auto_25765 ) ) ( not ( = ?auto_25769 ?auto_25765 ) ) ( not ( = ?auto_25775 ?auto_25765 ) ) ( IS-CRATE ?auto_25775 ) ( not ( = ?auto_25763 ?auto_25767 ) ) ( not ( = ?auto_25764 ?auto_25767 ) ) ( not ( = ?auto_25769 ?auto_25767 ) ) ( not ( = ?auto_25775 ?auto_25767 ) ) ( not ( = ?auto_25765 ?auto_25767 ) ) ( not ( = ?auto_25776 ?auto_25770 ) ) ( not ( = ?auto_25774 ?auto_25776 ) ) ( HOIST-AT ?auto_25773 ?auto_25776 ) ( not ( = ?auto_25771 ?auto_25773 ) ) ( not ( = ?auto_25772 ?auto_25773 ) ) ( SURFACE-AT ?auto_25775 ?auto_25776 ) ( ON ?auto_25775 ?auto_25768 ) ( CLEAR ?auto_25775 ) ( not ( = ?auto_25763 ?auto_25768 ) ) ( not ( = ?auto_25764 ?auto_25768 ) ) ( not ( = ?auto_25769 ?auto_25768 ) ) ( not ( = ?auto_25775 ?auto_25768 ) ) ( not ( = ?auto_25765 ?auto_25768 ) ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( SURFACE-AT ?auto_25777 ?auto_25770 ) ( CLEAR ?auto_25777 ) ( IS-CRATE ?auto_25767 ) ( not ( = ?auto_25763 ?auto_25777 ) ) ( not ( = ?auto_25764 ?auto_25777 ) ) ( not ( = ?auto_25769 ?auto_25777 ) ) ( not ( = ?auto_25775 ?auto_25777 ) ) ( not ( = ?auto_25765 ?auto_25777 ) ) ( not ( = ?auto_25767 ?auto_25777 ) ) ( not ( = ?auto_25768 ?auto_25777 ) ) ( AVAILABLE ?auto_25771 ) ( TRUCK-AT ?auto_25766 ?auto_25776 ) ( LIFTING ?auto_25773 ?auto_25767 ) )
    :subtasks
    ( ( !LOAD ?auto_25773 ?auto_25767 ?auto_25766 ?auto_25776 )
      ( MAKE-ON ?auto_25763 ?auto_25764 )
      ( MAKE-ON-VERIFY ?auto_25763 ?auto_25764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25778 - SURFACE
      ?auto_25779 - SURFACE
    )
    :vars
    (
      ?auto_25789 - HOIST
      ?auto_25785 - PLACE
      ?auto_25786 - PLACE
      ?auto_25782 - HOIST
      ?auto_25791 - SURFACE
      ?auto_25780 - SURFACE
      ?auto_25792 - SURFACE
      ?auto_25788 - SURFACE
      ?auto_25784 - PLACE
      ?auto_25781 - HOIST
      ?auto_25787 - SURFACE
      ?auto_25783 - SURFACE
      ?auto_25790 - TRUCK
      ?auto_25793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25789 ?auto_25785 ) ( IS-CRATE ?auto_25778 ) ( not ( = ?auto_25778 ?auto_25779 ) ) ( not ( = ?auto_25786 ?auto_25785 ) ) ( HOIST-AT ?auto_25782 ?auto_25786 ) ( not ( = ?auto_25789 ?auto_25782 ) ) ( SURFACE-AT ?auto_25778 ?auto_25786 ) ( ON ?auto_25778 ?auto_25791 ) ( CLEAR ?auto_25778 ) ( not ( = ?auto_25778 ?auto_25791 ) ) ( not ( = ?auto_25779 ?auto_25791 ) ) ( IS-CRATE ?auto_25779 ) ( not ( = ?auto_25778 ?auto_25780 ) ) ( not ( = ?auto_25779 ?auto_25780 ) ) ( not ( = ?auto_25791 ?auto_25780 ) ) ( AVAILABLE ?auto_25782 ) ( SURFACE-AT ?auto_25779 ?auto_25786 ) ( ON ?auto_25779 ?auto_25792 ) ( CLEAR ?auto_25779 ) ( not ( = ?auto_25778 ?auto_25792 ) ) ( not ( = ?auto_25779 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( not ( = ?auto_25780 ?auto_25792 ) ) ( IS-CRATE ?auto_25780 ) ( not ( = ?auto_25778 ?auto_25788 ) ) ( not ( = ?auto_25779 ?auto_25788 ) ) ( not ( = ?auto_25791 ?auto_25788 ) ) ( not ( = ?auto_25780 ?auto_25788 ) ) ( not ( = ?auto_25792 ?auto_25788 ) ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25786 ?auto_25784 ) ) ( HOIST-AT ?auto_25781 ?auto_25784 ) ( not ( = ?auto_25789 ?auto_25781 ) ) ( not ( = ?auto_25782 ?auto_25781 ) ) ( SURFACE-AT ?auto_25780 ?auto_25784 ) ( ON ?auto_25780 ?auto_25787 ) ( CLEAR ?auto_25780 ) ( not ( = ?auto_25778 ?auto_25787 ) ) ( not ( = ?auto_25779 ?auto_25787 ) ) ( not ( = ?auto_25791 ?auto_25787 ) ) ( not ( = ?auto_25780 ?auto_25787 ) ) ( not ( = ?auto_25792 ?auto_25787 ) ) ( not ( = ?auto_25788 ?auto_25787 ) ) ( SURFACE-AT ?auto_25783 ?auto_25785 ) ( CLEAR ?auto_25783 ) ( IS-CRATE ?auto_25788 ) ( not ( = ?auto_25778 ?auto_25783 ) ) ( not ( = ?auto_25779 ?auto_25783 ) ) ( not ( = ?auto_25791 ?auto_25783 ) ) ( not ( = ?auto_25780 ?auto_25783 ) ) ( not ( = ?auto_25792 ?auto_25783 ) ) ( not ( = ?auto_25788 ?auto_25783 ) ) ( not ( = ?auto_25787 ?auto_25783 ) ) ( AVAILABLE ?auto_25789 ) ( TRUCK-AT ?auto_25790 ?auto_25784 ) ( AVAILABLE ?auto_25781 ) ( SURFACE-AT ?auto_25788 ?auto_25784 ) ( ON ?auto_25788 ?auto_25793 ) ( CLEAR ?auto_25788 ) ( not ( = ?auto_25778 ?auto_25793 ) ) ( not ( = ?auto_25779 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25780 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25788 ?auto_25793 ) ) ( not ( = ?auto_25787 ?auto_25793 ) ) ( not ( = ?auto_25783 ?auto_25793 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25781 ?auto_25788 ?auto_25793 ?auto_25784 )
      ( MAKE-ON ?auto_25778 ?auto_25779 )
      ( MAKE-ON-VERIFY ?auto_25778 ?auto_25779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25794 - SURFACE
      ?auto_25795 - SURFACE
    )
    :vars
    (
      ?auto_25800 - HOIST
      ?auto_25798 - PLACE
      ?auto_25797 - PLACE
      ?auto_25803 - HOIST
      ?auto_25806 - SURFACE
      ?auto_25804 - SURFACE
      ?auto_25809 - SURFACE
      ?auto_25802 - SURFACE
      ?auto_25796 - PLACE
      ?auto_25805 - HOIST
      ?auto_25808 - SURFACE
      ?auto_25807 - SURFACE
      ?auto_25801 - SURFACE
      ?auto_25799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25800 ?auto_25798 ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25797 ?auto_25798 ) ) ( HOIST-AT ?auto_25803 ?auto_25797 ) ( not ( = ?auto_25800 ?auto_25803 ) ) ( SURFACE-AT ?auto_25794 ?auto_25797 ) ( ON ?auto_25794 ?auto_25806 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25794 ?auto_25806 ) ) ( not ( = ?auto_25795 ?auto_25806 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25804 ) ) ( not ( = ?auto_25795 ?auto_25804 ) ) ( not ( = ?auto_25806 ?auto_25804 ) ) ( AVAILABLE ?auto_25803 ) ( SURFACE-AT ?auto_25795 ?auto_25797 ) ( ON ?auto_25795 ?auto_25809 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25809 ) ) ( not ( = ?auto_25795 ?auto_25809 ) ) ( not ( = ?auto_25806 ?auto_25809 ) ) ( not ( = ?auto_25804 ?auto_25809 ) ) ( IS-CRATE ?auto_25804 ) ( not ( = ?auto_25794 ?auto_25802 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25806 ?auto_25802 ) ) ( not ( = ?auto_25804 ?auto_25802 ) ) ( not ( = ?auto_25809 ?auto_25802 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25797 ?auto_25796 ) ) ( HOIST-AT ?auto_25805 ?auto_25796 ) ( not ( = ?auto_25800 ?auto_25805 ) ) ( not ( = ?auto_25803 ?auto_25805 ) ) ( SURFACE-AT ?auto_25804 ?auto_25796 ) ( ON ?auto_25804 ?auto_25808 ) ( CLEAR ?auto_25804 ) ( not ( = ?auto_25794 ?auto_25808 ) ) ( not ( = ?auto_25795 ?auto_25808 ) ) ( not ( = ?auto_25806 ?auto_25808 ) ) ( not ( = ?auto_25804 ?auto_25808 ) ) ( not ( = ?auto_25809 ?auto_25808 ) ) ( not ( = ?auto_25802 ?auto_25808 ) ) ( SURFACE-AT ?auto_25807 ?auto_25798 ) ( CLEAR ?auto_25807 ) ( IS-CRATE ?auto_25802 ) ( not ( = ?auto_25794 ?auto_25807 ) ) ( not ( = ?auto_25795 ?auto_25807 ) ) ( not ( = ?auto_25806 ?auto_25807 ) ) ( not ( = ?auto_25804 ?auto_25807 ) ) ( not ( = ?auto_25809 ?auto_25807 ) ) ( not ( = ?auto_25802 ?auto_25807 ) ) ( not ( = ?auto_25808 ?auto_25807 ) ) ( AVAILABLE ?auto_25800 ) ( AVAILABLE ?auto_25805 ) ( SURFACE-AT ?auto_25802 ?auto_25796 ) ( ON ?auto_25802 ?auto_25801 ) ( CLEAR ?auto_25802 ) ( not ( = ?auto_25794 ?auto_25801 ) ) ( not ( = ?auto_25795 ?auto_25801 ) ) ( not ( = ?auto_25806 ?auto_25801 ) ) ( not ( = ?auto_25804 ?auto_25801 ) ) ( not ( = ?auto_25809 ?auto_25801 ) ) ( not ( = ?auto_25802 ?auto_25801 ) ) ( not ( = ?auto_25808 ?auto_25801 ) ) ( not ( = ?auto_25807 ?auto_25801 ) ) ( TRUCK-AT ?auto_25799 ?auto_25798 ) )
    :subtasks
    ( ( !DRIVE ?auto_25799 ?auto_25798 ?auto_25796 )
      ( MAKE-ON ?auto_25794 ?auto_25795 )
      ( MAKE-ON-VERIFY ?auto_25794 ?auto_25795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25812 - SURFACE
      ?auto_25813 - SURFACE
    )
    :vars
    (
      ?auto_25814 - HOIST
      ?auto_25815 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25814 ?auto_25815 ) ( SURFACE-AT ?auto_25813 ?auto_25815 ) ( CLEAR ?auto_25813 ) ( LIFTING ?auto_25814 ?auto_25812 ) ( IS-CRATE ?auto_25812 ) ( not ( = ?auto_25812 ?auto_25813 ) ) )
    :subtasks
    ( ( !DROP ?auto_25814 ?auto_25812 ?auto_25813 ?auto_25815 )
      ( MAKE-ON-VERIFY ?auto_25812 ?auto_25813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25816 - SURFACE
      ?auto_25817 - SURFACE
    )
    :vars
    (
      ?auto_25819 - HOIST
      ?auto_25818 - PLACE
      ?auto_25820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25819 ?auto_25818 ) ( SURFACE-AT ?auto_25817 ?auto_25818 ) ( CLEAR ?auto_25817 ) ( IS-CRATE ?auto_25816 ) ( not ( = ?auto_25816 ?auto_25817 ) ) ( TRUCK-AT ?auto_25820 ?auto_25818 ) ( AVAILABLE ?auto_25819 ) ( IN ?auto_25816 ?auto_25820 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25819 ?auto_25816 ?auto_25820 ?auto_25818 )
      ( MAKE-ON ?auto_25816 ?auto_25817 )
      ( MAKE-ON-VERIFY ?auto_25816 ?auto_25817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25821 - SURFACE
      ?auto_25822 - SURFACE
    )
    :vars
    (
      ?auto_25823 - HOIST
      ?auto_25825 - PLACE
      ?auto_25824 - TRUCK
      ?auto_25826 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25823 ?auto_25825 ) ( SURFACE-AT ?auto_25822 ?auto_25825 ) ( CLEAR ?auto_25822 ) ( IS-CRATE ?auto_25821 ) ( not ( = ?auto_25821 ?auto_25822 ) ) ( AVAILABLE ?auto_25823 ) ( IN ?auto_25821 ?auto_25824 ) ( TRUCK-AT ?auto_25824 ?auto_25826 ) ( not ( = ?auto_25826 ?auto_25825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25824 ?auto_25826 ?auto_25825 )
      ( MAKE-ON ?auto_25821 ?auto_25822 )
      ( MAKE-ON-VERIFY ?auto_25821 ?auto_25822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25827 - SURFACE
      ?auto_25828 - SURFACE
    )
    :vars
    (
      ?auto_25829 - HOIST
      ?auto_25830 - PLACE
      ?auto_25832 - TRUCK
      ?auto_25831 - PLACE
      ?auto_25833 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25829 ?auto_25830 ) ( SURFACE-AT ?auto_25828 ?auto_25830 ) ( CLEAR ?auto_25828 ) ( IS-CRATE ?auto_25827 ) ( not ( = ?auto_25827 ?auto_25828 ) ) ( AVAILABLE ?auto_25829 ) ( TRUCK-AT ?auto_25832 ?auto_25831 ) ( not ( = ?auto_25831 ?auto_25830 ) ) ( HOIST-AT ?auto_25833 ?auto_25831 ) ( LIFTING ?auto_25833 ?auto_25827 ) ( not ( = ?auto_25829 ?auto_25833 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25833 ?auto_25827 ?auto_25832 ?auto_25831 )
      ( MAKE-ON ?auto_25827 ?auto_25828 )
      ( MAKE-ON-VERIFY ?auto_25827 ?auto_25828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25834 - SURFACE
      ?auto_25835 - SURFACE
    )
    :vars
    (
      ?auto_25839 - HOIST
      ?auto_25838 - PLACE
      ?auto_25840 - TRUCK
      ?auto_25837 - PLACE
      ?auto_25836 - HOIST
      ?auto_25841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25839 ?auto_25838 ) ( SURFACE-AT ?auto_25835 ?auto_25838 ) ( CLEAR ?auto_25835 ) ( IS-CRATE ?auto_25834 ) ( not ( = ?auto_25834 ?auto_25835 ) ) ( AVAILABLE ?auto_25839 ) ( TRUCK-AT ?auto_25840 ?auto_25837 ) ( not ( = ?auto_25837 ?auto_25838 ) ) ( HOIST-AT ?auto_25836 ?auto_25837 ) ( not ( = ?auto_25839 ?auto_25836 ) ) ( AVAILABLE ?auto_25836 ) ( SURFACE-AT ?auto_25834 ?auto_25837 ) ( ON ?auto_25834 ?auto_25841 ) ( CLEAR ?auto_25834 ) ( not ( = ?auto_25834 ?auto_25841 ) ) ( not ( = ?auto_25835 ?auto_25841 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25836 ?auto_25834 ?auto_25841 ?auto_25837 )
      ( MAKE-ON ?auto_25834 ?auto_25835 )
      ( MAKE-ON-VERIFY ?auto_25834 ?auto_25835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25842 - SURFACE
      ?auto_25843 - SURFACE
    )
    :vars
    (
      ?auto_25847 - HOIST
      ?auto_25849 - PLACE
      ?auto_25845 - PLACE
      ?auto_25848 - HOIST
      ?auto_25844 - SURFACE
      ?auto_25846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25847 ?auto_25849 ) ( SURFACE-AT ?auto_25843 ?auto_25849 ) ( CLEAR ?auto_25843 ) ( IS-CRATE ?auto_25842 ) ( not ( = ?auto_25842 ?auto_25843 ) ) ( AVAILABLE ?auto_25847 ) ( not ( = ?auto_25845 ?auto_25849 ) ) ( HOIST-AT ?auto_25848 ?auto_25845 ) ( not ( = ?auto_25847 ?auto_25848 ) ) ( AVAILABLE ?auto_25848 ) ( SURFACE-AT ?auto_25842 ?auto_25845 ) ( ON ?auto_25842 ?auto_25844 ) ( CLEAR ?auto_25842 ) ( not ( = ?auto_25842 ?auto_25844 ) ) ( not ( = ?auto_25843 ?auto_25844 ) ) ( TRUCK-AT ?auto_25846 ?auto_25849 ) )
    :subtasks
    ( ( !DRIVE ?auto_25846 ?auto_25849 ?auto_25845 )
      ( MAKE-ON ?auto_25842 ?auto_25843 )
      ( MAKE-ON-VERIFY ?auto_25842 ?auto_25843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25850 - SURFACE
      ?auto_25851 - SURFACE
    )
    :vars
    (
      ?auto_25857 - HOIST
      ?auto_25855 - PLACE
      ?auto_25852 - PLACE
      ?auto_25853 - HOIST
      ?auto_25856 - SURFACE
      ?auto_25854 - TRUCK
      ?auto_25858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25857 ?auto_25855 ) ( IS-CRATE ?auto_25850 ) ( not ( = ?auto_25850 ?auto_25851 ) ) ( not ( = ?auto_25852 ?auto_25855 ) ) ( HOIST-AT ?auto_25853 ?auto_25852 ) ( not ( = ?auto_25857 ?auto_25853 ) ) ( AVAILABLE ?auto_25853 ) ( SURFACE-AT ?auto_25850 ?auto_25852 ) ( ON ?auto_25850 ?auto_25856 ) ( CLEAR ?auto_25850 ) ( not ( = ?auto_25850 ?auto_25856 ) ) ( not ( = ?auto_25851 ?auto_25856 ) ) ( TRUCK-AT ?auto_25854 ?auto_25855 ) ( SURFACE-AT ?auto_25858 ?auto_25855 ) ( CLEAR ?auto_25858 ) ( LIFTING ?auto_25857 ?auto_25851 ) ( IS-CRATE ?auto_25851 ) ( not ( = ?auto_25850 ?auto_25858 ) ) ( not ( = ?auto_25851 ?auto_25858 ) ) ( not ( = ?auto_25856 ?auto_25858 ) ) )
    :subtasks
    ( ( !DROP ?auto_25857 ?auto_25851 ?auto_25858 ?auto_25855 )
      ( MAKE-ON ?auto_25850 ?auto_25851 )
      ( MAKE-ON-VERIFY ?auto_25850 ?auto_25851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25859 - SURFACE
      ?auto_25860 - SURFACE
    )
    :vars
    (
      ?auto_25863 - HOIST
      ?auto_25867 - PLACE
      ?auto_25861 - PLACE
      ?auto_25864 - HOIST
      ?auto_25862 - SURFACE
      ?auto_25865 - TRUCK
      ?auto_25866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25863 ?auto_25867 ) ( IS-CRATE ?auto_25859 ) ( not ( = ?auto_25859 ?auto_25860 ) ) ( not ( = ?auto_25861 ?auto_25867 ) ) ( HOIST-AT ?auto_25864 ?auto_25861 ) ( not ( = ?auto_25863 ?auto_25864 ) ) ( AVAILABLE ?auto_25864 ) ( SURFACE-AT ?auto_25859 ?auto_25861 ) ( ON ?auto_25859 ?auto_25862 ) ( CLEAR ?auto_25859 ) ( not ( = ?auto_25859 ?auto_25862 ) ) ( not ( = ?auto_25860 ?auto_25862 ) ) ( TRUCK-AT ?auto_25865 ?auto_25867 ) ( SURFACE-AT ?auto_25866 ?auto_25867 ) ( CLEAR ?auto_25866 ) ( IS-CRATE ?auto_25860 ) ( not ( = ?auto_25859 ?auto_25866 ) ) ( not ( = ?auto_25860 ?auto_25866 ) ) ( not ( = ?auto_25862 ?auto_25866 ) ) ( AVAILABLE ?auto_25863 ) ( IN ?auto_25860 ?auto_25865 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25863 ?auto_25860 ?auto_25865 ?auto_25867 )
      ( MAKE-ON ?auto_25859 ?auto_25860 )
      ( MAKE-ON-VERIFY ?auto_25859 ?auto_25860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25868 - SURFACE
      ?auto_25869 - SURFACE
    )
    :vars
    (
      ?auto_25874 - HOIST
      ?auto_25873 - PLACE
      ?auto_25876 - PLACE
      ?auto_25872 - HOIST
      ?auto_25870 - SURFACE
      ?auto_25875 - SURFACE
      ?auto_25871 - TRUCK
      ?auto_25877 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25874 ?auto_25873 ) ( IS-CRATE ?auto_25868 ) ( not ( = ?auto_25868 ?auto_25869 ) ) ( not ( = ?auto_25876 ?auto_25873 ) ) ( HOIST-AT ?auto_25872 ?auto_25876 ) ( not ( = ?auto_25874 ?auto_25872 ) ) ( AVAILABLE ?auto_25872 ) ( SURFACE-AT ?auto_25868 ?auto_25876 ) ( ON ?auto_25868 ?auto_25870 ) ( CLEAR ?auto_25868 ) ( not ( = ?auto_25868 ?auto_25870 ) ) ( not ( = ?auto_25869 ?auto_25870 ) ) ( SURFACE-AT ?auto_25875 ?auto_25873 ) ( CLEAR ?auto_25875 ) ( IS-CRATE ?auto_25869 ) ( not ( = ?auto_25868 ?auto_25875 ) ) ( not ( = ?auto_25869 ?auto_25875 ) ) ( not ( = ?auto_25870 ?auto_25875 ) ) ( AVAILABLE ?auto_25874 ) ( IN ?auto_25869 ?auto_25871 ) ( TRUCK-AT ?auto_25871 ?auto_25877 ) ( not ( = ?auto_25877 ?auto_25873 ) ) ( not ( = ?auto_25876 ?auto_25877 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25871 ?auto_25877 ?auto_25873 )
      ( MAKE-ON ?auto_25868 ?auto_25869 )
      ( MAKE-ON-VERIFY ?auto_25868 ?auto_25869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25878 - SURFACE
      ?auto_25879 - SURFACE
    )
    :vars
    (
      ?auto_25883 - HOIST
      ?auto_25886 - PLACE
      ?auto_25885 - PLACE
      ?auto_25880 - HOIST
      ?auto_25881 - SURFACE
      ?auto_25887 - SURFACE
      ?auto_25882 - TRUCK
      ?auto_25884 - PLACE
      ?auto_25888 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25883 ?auto_25886 ) ( IS-CRATE ?auto_25878 ) ( not ( = ?auto_25878 ?auto_25879 ) ) ( not ( = ?auto_25885 ?auto_25886 ) ) ( HOIST-AT ?auto_25880 ?auto_25885 ) ( not ( = ?auto_25883 ?auto_25880 ) ) ( AVAILABLE ?auto_25880 ) ( SURFACE-AT ?auto_25878 ?auto_25885 ) ( ON ?auto_25878 ?auto_25881 ) ( CLEAR ?auto_25878 ) ( not ( = ?auto_25878 ?auto_25881 ) ) ( not ( = ?auto_25879 ?auto_25881 ) ) ( SURFACE-AT ?auto_25887 ?auto_25886 ) ( CLEAR ?auto_25887 ) ( IS-CRATE ?auto_25879 ) ( not ( = ?auto_25878 ?auto_25887 ) ) ( not ( = ?auto_25879 ?auto_25887 ) ) ( not ( = ?auto_25881 ?auto_25887 ) ) ( AVAILABLE ?auto_25883 ) ( TRUCK-AT ?auto_25882 ?auto_25884 ) ( not ( = ?auto_25884 ?auto_25886 ) ) ( not ( = ?auto_25885 ?auto_25884 ) ) ( HOIST-AT ?auto_25888 ?auto_25884 ) ( LIFTING ?auto_25888 ?auto_25879 ) ( not ( = ?auto_25883 ?auto_25888 ) ) ( not ( = ?auto_25880 ?auto_25888 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25888 ?auto_25879 ?auto_25882 ?auto_25884 )
      ( MAKE-ON ?auto_25878 ?auto_25879 )
      ( MAKE-ON-VERIFY ?auto_25878 ?auto_25879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25889 - SURFACE
      ?auto_25890 - SURFACE
    )
    :vars
    (
      ?auto_25895 - HOIST
      ?auto_25892 - PLACE
      ?auto_25894 - PLACE
      ?auto_25893 - HOIST
      ?auto_25898 - SURFACE
      ?auto_25899 - SURFACE
      ?auto_25891 - TRUCK
      ?auto_25896 - PLACE
      ?auto_25897 - HOIST
      ?auto_25900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25895 ?auto_25892 ) ( IS-CRATE ?auto_25889 ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25894 ?auto_25892 ) ) ( HOIST-AT ?auto_25893 ?auto_25894 ) ( not ( = ?auto_25895 ?auto_25893 ) ) ( AVAILABLE ?auto_25893 ) ( SURFACE-AT ?auto_25889 ?auto_25894 ) ( ON ?auto_25889 ?auto_25898 ) ( CLEAR ?auto_25889 ) ( not ( = ?auto_25889 ?auto_25898 ) ) ( not ( = ?auto_25890 ?auto_25898 ) ) ( SURFACE-AT ?auto_25899 ?auto_25892 ) ( CLEAR ?auto_25899 ) ( IS-CRATE ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25899 ) ) ( not ( = ?auto_25890 ?auto_25899 ) ) ( not ( = ?auto_25898 ?auto_25899 ) ) ( AVAILABLE ?auto_25895 ) ( TRUCK-AT ?auto_25891 ?auto_25896 ) ( not ( = ?auto_25896 ?auto_25892 ) ) ( not ( = ?auto_25894 ?auto_25896 ) ) ( HOIST-AT ?auto_25897 ?auto_25896 ) ( not ( = ?auto_25895 ?auto_25897 ) ) ( not ( = ?auto_25893 ?auto_25897 ) ) ( AVAILABLE ?auto_25897 ) ( SURFACE-AT ?auto_25890 ?auto_25896 ) ( ON ?auto_25890 ?auto_25900 ) ( CLEAR ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25900 ) ) ( not ( = ?auto_25890 ?auto_25900 ) ) ( not ( = ?auto_25898 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25900 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25897 ?auto_25890 ?auto_25900 ?auto_25896 )
      ( MAKE-ON ?auto_25889 ?auto_25890 )
      ( MAKE-ON-VERIFY ?auto_25889 ?auto_25890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25901 - SURFACE
      ?auto_25902 - SURFACE
    )
    :vars
    (
      ?auto_25910 - HOIST
      ?auto_25908 - PLACE
      ?auto_25911 - PLACE
      ?auto_25909 - HOIST
      ?auto_25905 - SURFACE
      ?auto_25904 - SURFACE
      ?auto_25907 - PLACE
      ?auto_25903 - HOIST
      ?auto_25906 - SURFACE
      ?auto_25912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25910 ?auto_25908 ) ( IS-CRATE ?auto_25901 ) ( not ( = ?auto_25901 ?auto_25902 ) ) ( not ( = ?auto_25911 ?auto_25908 ) ) ( HOIST-AT ?auto_25909 ?auto_25911 ) ( not ( = ?auto_25910 ?auto_25909 ) ) ( AVAILABLE ?auto_25909 ) ( SURFACE-AT ?auto_25901 ?auto_25911 ) ( ON ?auto_25901 ?auto_25905 ) ( CLEAR ?auto_25901 ) ( not ( = ?auto_25901 ?auto_25905 ) ) ( not ( = ?auto_25902 ?auto_25905 ) ) ( SURFACE-AT ?auto_25904 ?auto_25908 ) ( CLEAR ?auto_25904 ) ( IS-CRATE ?auto_25902 ) ( not ( = ?auto_25901 ?auto_25904 ) ) ( not ( = ?auto_25902 ?auto_25904 ) ) ( not ( = ?auto_25905 ?auto_25904 ) ) ( AVAILABLE ?auto_25910 ) ( not ( = ?auto_25907 ?auto_25908 ) ) ( not ( = ?auto_25911 ?auto_25907 ) ) ( HOIST-AT ?auto_25903 ?auto_25907 ) ( not ( = ?auto_25910 ?auto_25903 ) ) ( not ( = ?auto_25909 ?auto_25903 ) ) ( AVAILABLE ?auto_25903 ) ( SURFACE-AT ?auto_25902 ?auto_25907 ) ( ON ?auto_25902 ?auto_25906 ) ( CLEAR ?auto_25902 ) ( not ( = ?auto_25901 ?auto_25906 ) ) ( not ( = ?auto_25902 ?auto_25906 ) ) ( not ( = ?auto_25905 ?auto_25906 ) ) ( not ( = ?auto_25904 ?auto_25906 ) ) ( TRUCK-AT ?auto_25912 ?auto_25908 ) )
    :subtasks
    ( ( !DRIVE ?auto_25912 ?auto_25908 ?auto_25907 )
      ( MAKE-ON ?auto_25901 ?auto_25902 )
      ( MAKE-ON-VERIFY ?auto_25901 ?auto_25902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25913 - SURFACE
      ?auto_25914 - SURFACE
    )
    :vars
    (
      ?auto_25923 - HOIST
      ?auto_25922 - PLACE
      ?auto_25919 - PLACE
      ?auto_25916 - HOIST
      ?auto_25915 - SURFACE
      ?auto_25921 - SURFACE
      ?auto_25917 - PLACE
      ?auto_25924 - HOIST
      ?auto_25918 - SURFACE
      ?auto_25920 - TRUCK
      ?auto_25925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25923 ?auto_25922 ) ( IS-CRATE ?auto_25913 ) ( not ( = ?auto_25913 ?auto_25914 ) ) ( not ( = ?auto_25919 ?auto_25922 ) ) ( HOIST-AT ?auto_25916 ?auto_25919 ) ( not ( = ?auto_25923 ?auto_25916 ) ) ( AVAILABLE ?auto_25916 ) ( SURFACE-AT ?auto_25913 ?auto_25919 ) ( ON ?auto_25913 ?auto_25915 ) ( CLEAR ?auto_25913 ) ( not ( = ?auto_25913 ?auto_25915 ) ) ( not ( = ?auto_25914 ?auto_25915 ) ) ( IS-CRATE ?auto_25914 ) ( not ( = ?auto_25913 ?auto_25921 ) ) ( not ( = ?auto_25914 ?auto_25921 ) ) ( not ( = ?auto_25915 ?auto_25921 ) ) ( not ( = ?auto_25917 ?auto_25922 ) ) ( not ( = ?auto_25919 ?auto_25917 ) ) ( HOIST-AT ?auto_25924 ?auto_25917 ) ( not ( = ?auto_25923 ?auto_25924 ) ) ( not ( = ?auto_25916 ?auto_25924 ) ) ( AVAILABLE ?auto_25924 ) ( SURFACE-AT ?auto_25914 ?auto_25917 ) ( ON ?auto_25914 ?auto_25918 ) ( CLEAR ?auto_25914 ) ( not ( = ?auto_25913 ?auto_25918 ) ) ( not ( = ?auto_25914 ?auto_25918 ) ) ( not ( = ?auto_25915 ?auto_25918 ) ) ( not ( = ?auto_25921 ?auto_25918 ) ) ( TRUCK-AT ?auto_25920 ?auto_25922 ) ( SURFACE-AT ?auto_25925 ?auto_25922 ) ( CLEAR ?auto_25925 ) ( LIFTING ?auto_25923 ?auto_25921 ) ( IS-CRATE ?auto_25921 ) ( not ( = ?auto_25913 ?auto_25925 ) ) ( not ( = ?auto_25914 ?auto_25925 ) ) ( not ( = ?auto_25915 ?auto_25925 ) ) ( not ( = ?auto_25921 ?auto_25925 ) ) ( not ( = ?auto_25918 ?auto_25925 ) ) )
    :subtasks
    ( ( !DROP ?auto_25923 ?auto_25921 ?auto_25925 ?auto_25922 )
      ( MAKE-ON ?auto_25913 ?auto_25914 )
      ( MAKE-ON-VERIFY ?auto_25913 ?auto_25914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25926 - SURFACE
      ?auto_25927 - SURFACE
    )
    :vars
    (
      ?auto_25932 - HOIST
      ?auto_25929 - PLACE
      ?auto_25938 - PLACE
      ?auto_25937 - HOIST
      ?auto_25933 - SURFACE
      ?auto_25931 - SURFACE
      ?auto_25934 - PLACE
      ?auto_25930 - HOIST
      ?auto_25936 - SURFACE
      ?auto_25935 - TRUCK
      ?auto_25928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25932 ?auto_25929 ) ( IS-CRATE ?auto_25926 ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( not ( = ?auto_25938 ?auto_25929 ) ) ( HOIST-AT ?auto_25937 ?auto_25938 ) ( not ( = ?auto_25932 ?auto_25937 ) ) ( AVAILABLE ?auto_25937 ) ( SURFACE-AT ?auto_25926 ?auto_25938 ) ( ON ?auto_25926 ?auto_25933 ) ( CLEAR ?auto_25926 ) ( not ( = ?auto_25926 ?auto_25933 ) ) ( not ( = ?auto_25927 ?auto_25933 ) ) ( IS-CRATE ?auto_25927 ) ( not ( = ?auto_25926 ?auto_25931 ) ) ( not ( = ?auto_25927 ?auto_25931 ) ) ( not ( = ?auto_25933 ?auto_25931 ) ) ( not ( = ?auto_25934 ?auto_25929 ) ) ( not ( = ?auto_25938 ?auto_25934 ) ) ( HOIST-AT ?auto_25930 ?auto_25934 ) ( not ( = ?auto_25932 ?auto_25930 ) ) ( not ( = ?auto_25937 ?auto_25930 ) ) ( AVAILABLE ?auto_25930 ) ( SURFACE-AT ?auto_25927 ?auto_25934 ) ( ON ?auto_25927 ?auto_25936 ) ( CLEAR ?auto_25927 ) ( not ( = ?auto_25926 ?auto_25936 ) ) ( not ( = ?auto_25927 ?auto_25936 ) ) ( not ( = ?auto_25933 ?auto_25936 ) ) ( not ( = ?auto_25931 ?auto_25936 ) ) ( TRUCK-AT ?auto_25935 ?auto_25929 ) ( SURFACE-AT ?auto_25928 ?auto_25929 ) ( CLEAR ?auto_25928 ) ( IS-CRATE ?auto_25931 ) ( not ( = ?auto_25926 ?auto_25928 ) ) ( not ( = ?auto_25927 ?auto_25928 ) ) ( not ( = ?auto_25933 ?auto_25928 ) ) ( not ( = ?auto_25931 ?auto_25928 ) ) ( not ( = ?auto_25936 ?auto_25928 ) ) ( AVAILABLE ?auto_25932 ) ( IN ?auto_25931 ?auto_25935 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25932 ?auto_25931 ?auto_25935 ?auto_25929 )
      ( MAKE-ON ?auto_25926 ?auto_25927 )
      ( MAKE-ON-VERIFY ?auto_25926 ?auto_25927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25939 - SURFACE
      ?auto_25940 - SURFACE
    )
    :vars
    (
      ?auto_25949 - HOIST
      ?auto_25950 - PLACE
      ?auto_25945 - PLACE
      ?auto_25944 - HOIST
      ?auto_25943 - SURFACE
      ?auto_25946 - SURFACE
      ?auto_25941 - PLACE
      ?auto_25942 - HOIST
      ?auto_25951 - SURFACE
      ?auto_25948 - SURFACE
      ?auto_25947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25949 ?auto_25950 ) ( IS-CRATE ?auto_25939 ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( not ( = ?auto_25945 ?auto_25950 ) ) ( HOIST-AT ?auto_25944 ?auto_25945 ) ( not ( = ?auto_25949 ?auto_25944 ) ) ( AVAILABLE ?auto_25944 ) ( SURFACE-AT ?auto_25939 ?auto_25945 ) ( ON ?auto_25939 ?auto_25943 ) ( CLEAR ?auto_25939 ) ( not ( = ?auto_25939 ?auto_25943 ) ) ( not ( = ?auto_25940 ?auto_25943 ) ) ( IS-CRATE ?auto_25940 ) ( not ( = ?auto_25939 ?auto_25946 ) ) ( not ( = ?auto_25940 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25941 ?auto_25950 ) ) ( not ( = ?auto_25945 ?auto_25941 ) ) ( HOIST-AT ?auto_25942 ?auto_25941 ) ( not ( = ?auto_25949 ?auto_25942 ) ) ( not ( = ?auto_25944 ?auto_25942 ) ) ( AVAILABLE ?auto_25942 ) ( SURFACE-AT ?auto_25940 ?auto_25941 ) ( ON ?auto_25940 ?auto_25951 ) ( CLEAR ?auto_25940 ) ( not ( = ?auto_25939 ?auto_25951 ) ) ( not ( = ?auto_25940 ?auto_25951 ) ) ( not ( = ?auto_25943 ?auto_25951 ) ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( SURFACE-AT ?auto_25948 ?auto_25950 ) ( CLEAR ?auto_25948 ) ( IS-CRATE ?auto_25946 ) ( not ( = ?auto_25939 ?auto_25948 ) ) ( not ( = ?auto_25940 ?auto_25948 ) ) ( not ( = ?auto_25943 ?auto_25948 ) ) ( not ( = ?auto_25946 ?auto_25948 ) ) ( not ( = ?auto_25951 ?auto_25948 ) ) ( AVAILABLE ?auto_25949 ) ( IN ?auto_25946 ?auto_25947 ) ( TRUCK-AT ?auto_25947 ?auto_25941 ) )
    :subtasks
    ( ( !DRIVE ?auto_25947 ?auto_25941 ?auto_25950 )
      ( MAKE-ON ?auto_25939 ?auto_25940 )
      ( MAKE-ON-VERIFY ?auto_25939 ?auto_25940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25952 - SURFACE
      ?auto_25953 - SURFACE
    )
    :vars
    (
      ?auto_25959 - HOIST
      ?auto_25960 - PLACE
      ?auto_25957 - PLACE
      ?auto_25962 - HOIST
      ?auto_25958 - SURFACE
      ?auto_25954 - SURFACE
      ?auto_25964 - PLACE
      ?auto_25963 - HOIST
      ?auto_25956 - SURFACE
      ?auto_25961 - SURFACE
      ?auto_25955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25959 ?auto_25960 ) ( IS-CRATE ?auto_25952 ) ( not ( = ?auto_25952 ?auto_25953 ) ) ( not ( = ?auto_25957 ?auto_25960 ) ) ( HOIST-AT ?auto_25962 ?auto_25957 ) ( not ( = ?auto_25959 ?auto_25962 ) ) ( AVAILABLE ?auto_25962 ) ( SURFACE-AT ?auto_25952 ?auto_25957 ) ( ON ?auto_25952 ?auto_25958 ) ( CLEAR ?auto_25952 ) ( not ( = ?auto_25952 ?auto_25958 ) ) ( not ( = ?auto_25953 ?auto_25958 ) ) ( IS-CRATE ?auto_25953 ) ( not ( = ?auto_25952 ?auto_25954 ) ) ( not ( = ?auto_25953 ?auto_25954 ) ) ( not ( = ?auto_25958 ?auto_25954 ) ) ( not ( = ?auto_25964 ?auto_25960 ) ) ( not ( = ?auto_25957 ?auto_25964 ) ) ( HOIST-AT ?auto_25963 ?auto_25964 ) ( not ( = ?auto_25959 ?auto_25963 ) ) ( not ( = ?auto_25962 ?auto_25963 ) ) ( SURFACE-AT ?auto_25953 ?auto_25964 ) ( ON ?auto_25953 ?auto_25956 ) ( CLEAR ?auto_25953 ) ( not ( = ?auto_25952 ?auto_25956 ) ) ( not ( = ?auto_25953 ?auto_25956 ) ) ( not ( = ?auto_25958 ?auto_25956 ) ) ( not ( = ?auto_25954 ?auto_25956 ) ) ( SURFACE-AT ?auto_25961 ?auto_25960 ) ( CLEAR ?auto_25961 ) ( IS-CRATE ?auto_25954 ) ( not ( = ?auto_25952 ?auto_25961 ) ) ( not ( = ?auto_25953 ?auto_25961 ) ) ( not ( = ?auto_25958 ?auto_25961 ) ) ( not ( = ?auto_25954 ?auto_25961 ) ) ( not ( = ?auto_25956 ?auto_25961 ) ) ( AVAILABLE ?auto_25959 ) ( TRUCK-AT ?auto_25955 ?auto_25964 ) ( LIFTING ?auto_25963 ?auto_25954 ) )
    :subtasks
    ( ( !LOAD ?auto_25963 ?auto_25954 ?auto_25955 ?auto_25964 )
      ( MAKE-ON ?auto_25952 ?auto_25953 )
      ( MAKE-ON-VERIFY ?auto_25952 ?auto_25953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25965 - SURFACE
      ?auto_25966 - SURFACE
    )
    :vars
    (
      ?auto_25971 - HOIST
      ?auto_25974 - PLACE
      ?auto_25973 - PLACE
      ?auto_25967 - HOIST
      ?auto_25968 - SURFACE
      ?auto_25972 - SURFACE
      ?auto_25975 - PLACE
      ?auto_25976 - HOIST
      ?auto_25970 - SURFACE
      ?auto_25969 - SURFACE
      ?auto_25977 - TRUCK
      ?auto_25978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25971 ?auto_25974 ) ( IS-CRATE ?auto_25965 ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25973 ?auto_25974 ) ) ( HOIST-AT ?auto_25967 ?auto_25973 ) ( not ( = ?auto_25971 ?auto_25967 ) ) ( AVAILABLE ?auto_25967 ) ( SURFACE-AT ?auto_25965 ?auto_25973 ) ( ON ?auto_25965 ?auto_25968 ) ( CLEAR ?auto_25965 ) ( not ( = ?auto_25965 ?auto_25968 ) ) ( not ( = ?auto_25966 ?auto_25968 ) ) ( IS-CRATE ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25972 ) ) ( not ( = ?auto_25966 ?auto_25972 ) ) ( not ( = ?auto_25968 ?auto_25972 ) ) ( not ( = ?auto_25975 ?auto_25974 ) ) ( not ( = ?auto_25973 ?auto_25975 ) ) ( HOIST-AT ?auto_25976 ?auto_25975 ) ( not ( = ?auto_25971 ?auto_25976 ) ) ( not ( = ?auto_25967 ?auto_25976 ) ) ( SURFACE-AT ?auto_25966 ?auto_25975 ) ( ON ?auto_25966 ?auto_25970 ) ( CLEAR ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25970 ) ) ( not ( = ?auto_25966 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25972 ?auto_25970 ) ) ( SURFACE-AT ?auto_25969 ?auto_25974 ) ( CLEAR ?auto_25969 ) ( IS-CRATE ?auto_25972 ) ( not ( = ?auto_25965 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25972 ?auto_25969 ) ) ( not ( = ?auto_25970 ?auto_25969 ) ) ( AVAILABLE ?auto_25971 ) ( TRUCK-AT ?auto_25977 ?auto_25975 ) ( AVAILABLE ?auto_25976 ) ( SURFACE-AT ?auto_25972 ?auto_25975 ) ( ON ?auto_25972 ?auto_25978 ) ( CLEAR ?auto_25972 ) ( not ( = ?auto_25965 ?auto_25978 ) ) ( not ( = ?auto_25966 ?auto_25978 ) ) ( not ( = ?auto_25968 ?auto_25978 ) ) ( not ( = ?auto_25972 ?auto_25978 ) ) ( not ( = ?auto_25970 ?auto_25978 ) ) ( not ( = ?auto_25969 ?auto_25978 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25976 ?auto_25972 ?auto_25978 ?auto_25975 )
      ( MAKE-ON ?auto_25965 ?auto_25966 )
      ( MAKE-ON-VERIFY ?auto_25965 ?auto_25966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25979 - SURFACE
      ?auto_25980 - SURFACE
    )
    :vars
    (
      ?auto_25984 - HOIST
      ?auto_25985 - PLACE
      ?auto_25992 - PLACE
      ?auto_25982 - HOIST
      ?auto_25986 - SURFACE
      ?auto_25988 - SURFACE
      ?auto_25983 - PLACE
      ?auto_25989 - HOIST
      ?auto_25991 - SURFACE
      ?auto_25987 - SURFACE
      ?auto_25990 - SURFACE
      ?auto_25981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25984 ?auto_25985 ) ( IS-CRATE ?auto_25979 ) ( not ( = ?auto_25979 ?auto_25980 ) ) ( not ( = ?auto_25992 ?auto_25985 ) ) ( HOIST-AT ?auto_25982 ?auto_25992 ) ( not ( = ?auto_25984 ?auto_25982 ) ) ( AVAILABLE ?auto_25982 ) ( SURFACE-AT ?auto_25979 ?auto_25992 ) ( ON ?auto_25979 ?auto_25986 ) ( CLEAR ?auto_25979 ) ( not ( = ?auto_25979 ?auto_25986 ) ) ( not ( = ?auto_25980 ?auto_25986 ) ) ( IS-CRATE ?auto_25980 ) ( not ( = ?auto_25979 ?auto_25988 ) ) ( not ( = ?auto_25980 ?auto_25988 ) ) ( not ( = ?auto_25986 ?auto_25988 ) ) ( not ( = ?auto_25983 ?auto_25985 ) ) ( not ( = ?auto_25992 ?auto_25983 ) ) ( HOIST-AT ?auto_25989 ?auto_25983 ) ( not ( = ?auto_25984 ?auto_25989 ) ) ( not ( = ?auto_25982 ?auto_25989 ) ) ( SURFACE-AT ?auto_25980 ?auto_25983 ) ( ON ?auto_25980 ?auto_25991 ) ( CLEAR ?auto_25980 ) ( not ( = ?auto_25979 ?auto_25991 ) ) ( not ( = ?auto_25980 ?auto_25991 ) ) ( not ( = ?auto_25986 ?auto_25991 ) ) ( not ( = ?auto_25988 ?auto_25991 ) ) ( SURFACE-AT ?auto_25987 ?auto_25985 ) ( CLEAR ?auto_25987 ) ( IS-CRATE ?auto_25988 ) ( not ( = ?auto_25979 ?auto_25987 ) ) ( not ( = ?auto_25980 ?auto_25987 ) ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( not ( = ?auto_25988 ?auto_25987 ) ) ( not ( = ?auto_25991 ?auto_25987 ) ) ( AVAILABLE ?auto_25984 ) ( AVAILABLE ?auto_25989 ) ( SURFACE-AT ?auto_25988 ?auto_25983 ) ( ON ?auto_25988 ?auto_25990 ) ( CLEAR ?auto_25988 ) ( not ( = ?auto_25979 ?auto_25990 ) ) ( not ( = ?auto_25980 ?auto_25990 ) ) ( not ( = ?auto_25986 ?auto_25990 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25991 ?auto_25990 ) ) ( not ( = ?auto_25987 ?auto_25990 ) ) ( TRUCK-AT ?auto_25981 ?auto_25985 ) )
    :subtasks
    ( ( !DRIVE ?auto_25981 ?auto_25985 ?auto_25983 )
      ( MAKE-ON ?auto_25979 ?auto_25980 )
      ( MAKE-ON-VERIFY ?auto_25979 ?auto_25980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25993 - SURFACE
      ?auto_25994 - SURFACE
    )
    :vars
    (
      ?auto_25996 - HOIST
      ?auto_25997 - PLACE
      ?auto_26005 - PLACE
      ?auto_26006 - HOIST
      ?auto_26000 - SURFACE
      ?auto_25998 - SURFACE
      ?auto_26003 - PLACE
      ?auto_25999 - HOIST
      ?auto_26002 - SURFACE
      ?auto_26004 - SURFACE
      ?auto_26001 - SURFACE
      ?auto_25995 - TRUCK
      ?auto_26007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25996 ?auto_25997 ) ( IS-CRATE ?auto_25993 ) ( not ( = ?auto_25993 ?auto_25994 ) ) ( not ( = ?auto_26005 ?auto_25997 ) ) ( HOIST-AT ?auto_26006 ?auto_26005 ) ( not ( = ?auto_25996 ?auto_26006 ) ) ( AVAILABLE ?auto_26006 ) ( SURFACE-AT ?auto_25993 ?auto_26005 ) ( ON ?auto_25993 ?auto_26000 ) ( CLEAR ?auto_25993 ) ( not ( = ?auto_25993 ?auto_26000 ) ) ( not ( = ?auto_25994 ?auto_26000 ) ) ( IS-CRATE ?auto_25994 ) ( not ( = ?auto_25993 ?auto_25998 ) ) ( not ( = ?auto_25994 ?auto_25998 ) ) ( not ( = ?auto_26000 ?auto_25998 ) ) ( not ( = ?auto_26003 ?auto_25997 ) ) ( not ( = ?auto_26005 ?auto_26003 ) ) ( HOIST-AT ?auto_25999 ?auto_26003 ) ( not ( = ?auto_25996 ?auto_25999 ) ) ( not ( = ?auto_26006 ?auto_25999 ) ) ( SURFACE-AT ?auto_25994 ?auto_26003 ) ( ON ?auto_25994 ?auto_26002 ) ( CLEAR ?auto_25994 ) ( not ( = ?auto_25993 ?auto_26002 ) ) ( not ( = ?auto_25994 ?auto_26002 ) ) ( not ( = ?auto_26000 ?auto_26002 ) ) ( not ( = ?auto_25998 ?auto_26002 ) ) ( IS-CRATE ?auto_25998 ) ( not ( = ?auto_25993 ?auto_26004 ) ) ( not ( = ?auto_25994 ?auto_26004 ) ) ( not ( = ?auto_26000 ?auto_26004 ) ) ( not ( = ?auto_25998 ?auto_26004 ) ) ( not ( = ?auto_26002 ?auto_26004 ) ) ( AVAILABLE ?auto_25999 ) ( SURFACE-AT ?auto_25998 ?auto_26003 ) ( ON ?auto_25998 ?auto_26001 ) ( CLEAR ?auto_25998 ) ( not ( = ?auto_25993 ?auto_26001 ) ) ( not ( = ?auto_25994 ?auto_26001 ) ) ( not ( = ?auto_26000 ?auto_26001 ) ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_26002 ?auto_26001 ) ) ( not ( = ?auto_26004 ?auto_26001 ) ) ( TRUCK-AT ?auto_25995 ?auto_25997 ) ( SURFACE-AT ?auto_26007 ?auto_25997 ) ( CLEAR ?auto_26007 ) ( LIFTING ?auto_25996 ?auto_26004 ) ( IS-CRATE ?auto_26004 ) ( not ( = ?auto_25993 ?auto_26007 ) ) ( not ( = ?auto_25994 ?auto_26007 ) ) ( not ( = ?auto_26000 ?auto_26007 ) ) ( not ( = ?auto_25998 ?auto_26007 ) ) ( not ( = ?auto_26002 ?auto_26007 ) ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26001 ?auto_26007 ) ) )
    :subtasks
    ( ( !DROP ?auto_25996 ?auto_26004 ?auto_26007 ?auto_25997 )
      ( MAKE-ON ?auto_25993 ?auto_25994 )
      ( MAKE-ON-VERIFY ?auto_25993 ?auto_25994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26008 - SURFACE
      ?auto_26009 - SURFACE
    )
    :vars
    (
      ?auto_26021 - HOIST
      ?auto_26019 - PLACE
      ?auto_26022 - PLACE
      ?auto_26016 - HOIST
      ?auto_26012 - SURFACE
      ?auto_26011 - SURFACE
      ?auto_26017 - PLACE
      ?auto_26020 - HOIST
      ?auto_26010 - SURFACE
      ?auto_26014 - SURFACE
      ?auto_26013 - SURFACE
      ?auto_26018 - TRUCK
      ?auto_26015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26021 ?auto_26019 ) ( IS-CRATE ?auto_26008 ) ( not ( = ?auto_26008 ?auto_26009 ) ) ( not ( = ?auto_26022 ?auto_26019 ) ) ( HOIST-AT ?auto_26016 ?auto_26022 ) ( not ( = ?auto_26021 ?auto_26016 ) ) ( AVAILABLE ?auto_26016 ) ( SURFACE-AT ?auto_26008 ?auto_26022 ) ( ON ?auto_26008 ?auto_26012 ) ( CLEAR ?auto_26008 ) ( not ( = ?auto_26008 ?auto_26012 ) ) ( not ( = ?auto_26009 ?auto_26012 ) ) ( IS-CRATE ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26011 ) ) ( not ( = ?auto_26009 ?auto_26011 ) ) ( not ( = ?auto_26012 ?auto_26011 ) ) ( not ( = ?auto_26017 ?auto_26019 ) ) ( not ( = ?auto_26022 ?auto_26017 ) ) ( HOIST-AT ?auto_26020 ?auto_26017 ) ( not ( = ?auto_26021 ?auto_26020 ) ) ( not ( = ?auto_26016 ?auto_26020 ) ) ( SURFACE-AT ?auto_26009 ?auto_26017 ) ( ON ?auto_26009 ?auto_26010 ) ( CLEAR ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26010 ) ) ( not ( = ?auto_26009 ?auto_26010 ) ) ( not ( = ?auto_26012 ?auto_26010 ) ) ( not ( = ?auto_26011 ?auto_26010 ) ) ( IS-CRATE ?auto_26011 ) ( not ( = ?auto_26008 ?auto_26014 ) ) ( not ( = ?auto_26009 ?auto_26014 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26011 ?auto_26014 ) ) ( not ( = ?auto_26010 ?auto_26014 ) ) ( AVAILABLE ?auto_26020 ) ( SURFACE-AT ?auto_26011 ?auto_26017 ) ( ON ?auto_26011 ?auto_26013 ) ( CLEAR ?auto_26011 ) ( not ( = ?auto_26008 ?auto_26013 ) ) ( not ( = ?auto_26009 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26011 ?auto_26013 ) ) ( not ( = ?auto_26010 ?auto_26013 ) ) ( not ( = ?auto_26014 ?auto_26013 ) ) ( TRUCK-AT ?auto_26018 ?auto_26019 ) ( SURFACE-AT ?auto_26015 ?auto_26019 ) ( CLEAR ?auto_26015 ) ( IS-CRATE ?auto_26014 ) ( not ( = ?auto_26008 ?auto_26015 ) ) ( not ( = ?auto_26009 ?auto_26015 ) ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26011 ?auto_26015 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( AVAILABLE ?auto_26021 ) ( IN ?auto_26014 ?auto_26018 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26021 ?auto_26014 ?auto_26018 ?auto_26019 )
      ( MAKE-ON ?auto_26008 ?auto_26009 )
      ( MAKE-ON-VERIFY ?auto_26008 ?auto_26009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26023 - SURFACE
      ?auto_26024 - SURFACE
    )
    :vars
    (
      ?auto_26032 - HOIST
      ?auto_26036 - PLACE
      ?auto_26026 - PLACE
      ?auto_26025 - HOIST
      ?auto_26031 - SURFACE
      ?auto_26035 - SURFACE
      ?auto_26037 - PLACE
      ?auto_26027 - HOIST
      ?auto_26030 - SURFACE
      ?auto_26034 - SURFACE
      ?auto_26029 - SURFACE
      ?auto_26033 - SURFACE
      ?auto_26028 - TRUCK
      ?auto_26038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26032 ?auto_26036 ) ( IS-CRATE ?auto_26023 ) ( not ( = ?auto_26023 ?auto_26024 ) ) ( not ( = ?auto_26026 ?auto_26036 ) ) ( HOIST-AT ?auto_26025 ?auto_26026 ) ( not ( = ?auto_26032 ?auto_26025 ) ) ( AVAILABLE ?auto_26025 ) ( SURFACE-AT ?auto_26023 ?auto_26026 ) ( ON ?auto_26023 ?auto_26031 ) ( CLEAR ?auto_26023 ) ( not ( = ?auto_26023 ?auto_26031 ) ) ( not ( = ?auto_26024 ?auto_26031 ) ) ( IS-CRATE ?auto_26024 ) ( not ( = ?auto_26023 ?auto_26035 ) ) ( not ( = ?auto_26024 ?auto_26035 ) ) ( not ( = ?auto_26031 ?auto_26035 ) ) ( not ( = ?auto_26037 ?auto_26036 ) ) ( not ( = ?auto_26026 ?auto_26037 ) ) ( HOIST-AT ?auto_26027 ?auto_26037 ) ( not ( = ?auto_26032 ?auto_26027 ) ) ( not ( = ?auto_26025 ?auto_26027 ) ) ( SURFACE-AT ?auto_26024 ?auto_26037 ) ( ON ?auto_26024 ?auto_26030 ) ( CLEAR ?auto_26024 ) ( not ( = ?auto_26023 ?auto_26030 ) ) ( not ( = ?auto_26024 ?auto_26030 ) ) ( not ( = ?auto_26031 ?auto_26030 ) ) ( not ( = ?auto_26035 ?auto_26030 ) ) ( IS-CRATE ?auto_26035 ) ( not ( = ?auto_26023 ?auto_26034 ) ) ( not ( = ?auto_26024 ?auto_26034 ) ) ( not ( = ?auto_26031 ?auto_26034 ) ) ( not ( = ?auto_26035 ?auto_26034 ) ) ( not ( = ?auto_26030 ?auto_26034 ) ) ( AVAILABLE ?auto_26027 ) ( SURFACE-AT ?auto_26035 ?auto_26037 ) ( ON ?auto_26035 ?auto_26029 ) ( CLEAR ?auto_26035 ) ( not ( = ?auto_26023 ?auto_26029 ) ) ( not ( = ?auto_26024 ?auto_26029 ) ) ( not ( = ?auto_26031 ?auto_26029 ) ) ( not ( = ?auto_26035 ?auto_26029 ) ) ( not ( = ?auto_26030 ?auto_26029 ) ) ( not ( = ?auto_26034 ?auto_26029 ) ) ( SURFACE-AT ?auto_26033 ?auto_26036 ) ( CLEAR ?auto_26033 ) ( IS-CRATE ?auto_26034 ) ( not ( = ?auto_26023 ?auto_26033 ) ) ( not ( = ?auto_26024 ?auto_26033 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( not ( = ?auto_26035 ?auto_26033 ) ) ( not ( = ?auto_26030 ?auto_26033 ) ) ( not ( = ?auto_26034 ?auto_26033 ) ) ( not ( = ?auto_26029 ?auto_26033 ) ) ( AVAILABLE ?auto_26032 ) ( IN ?auto_26034 ?auto_26028 ) ( TRUCK-AT ?auto_26028 ?auto_26038 ) ( not ( = ?auto_26038 ?auto_26036 ) ) ( not ( = ?auto_26026 ?auto_26038 ) ) ( not ( = ?auto_26037 ?auto_26038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26028 ?auto_26038 ?auto_26036 )
      ( MAKE-ON ?auto_26023 ?auto_26024 )
      ( MAKE-ON-VERIFY ?auto_26023 ?auto_26024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26039 - SURFACE
      ?auto_26040 - SURFACE
    )
    :vars
    (
      ?auto_26049 - HOIST
      ?auto_26046 - PLACE
      ?auto_26053 - PLACE
      ?auto_26045 - HOIST
      ?auto_26041 - SURFACE
      ?auto_26042 - SURFACE
      ?auto_26050 - PLACE
      ?auto_26052 - HOIST
      ?auto_26051 - SURFACE
      ?auto_26048 - SURFACE
      ?auto_26047 - SURFACE
      ?auto_26043 - SURFACE
      ?auto_26054 - TRUCK
      ?auto_26044 - PLACE
      ?auto_26055 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26049 ?auto_26046 ) ( IS-CRATE ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26053 ?auto_26046 ) ) ( HOIST-AT ?auto_26045 ?auto_26053 ) ( not ( = ?auto_26049 ?auto_26045 ) ) ( AVAILABLE ?auto_26045 ) ( SURFACE-AT ?auto_26039 ?auto_26053 ) ( ON ?auto_26039 ?auto_26041 ) ( CLEAR ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26040 ?auto_26041 ) ) ( IS-CRATE ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26050 ?auto_26046 ) ) ( not ( = ?auto_26053 ?auto_26050 ) ) ( HOIST-AT ?auto_26052 ?auto_26050 ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( SURFACE-AT ?auto_26040 ?auto_26050 ) ( ON ?auto_26040 ?auto_26051 ) ( CLEAR ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26051 ) ) ( not ( = ?auto_26040 ?auto_26051 ) ) ( not ( = ?auto_26041 ?auto_26051 ) ) ( not ( = ?auto_26042 ?auto_26051 ) ) ( IS-CRATE ?auto_26042 ) ( not ( = ?auto_26039 ?auto_26048 ) ) ( not ( = ?auto_26040 ?auto_26048 ) ) ( not ( = ?auto_26041 ?auto_26048 ) ) ( not ( = ?auto_26042 ?auto_26048 ) ) ( not ( = ?auto_26051 ?auto_26048 ) ) ( AVAILABLE ?auto_26052 ) ( SURFACE-AT ?auto_26042 ?auto_26050 ) ( ON ?auto_26042 ?auto_26047 ) ( CLEAR ?auto_26042 ) ( not ( = ?auto_26039 ?auto_26047 ) ) ( not ( = ?auto_26040 ?auto_26047 ) ) ( not ( = ?auto_26041 ?auto_26047 ) ) ( not ( = ?auto_26042 ?auto_26047 ) ) ( not ( = ?auto_26051 ?auto_26047 ) ) ( not ( = ?auto_26048 ?auto_26047 ) ) ( SURFACE-AT ?auto_26043 ?auto_26046 ) ( CLEAR ?auto_26043 ) ( IS-CRATE ?auto_26048 ) ( not ( = ?auto_26039 ?auto_26043 ) ) ( not ( = ?auto_26040 ?auto_26043 ) ) ( not ( = ?auto_26041 ?auto_26043 ) ) ( not ( = ?auto_26042 ?auto_26043 ) ) ( not ( = ?auto_26051 ?auto_26043 ) ) ( not ( = ?auto_26048 ?auto_26043 ) ) ( not ( = ?auto_26047 ?auto_26043 ) ) ( AVAILABLE ?auto_26049 ) ( TRUCK-AT ?auto_26054 ?auto_26044 ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26053 ?auto_26044 ) ) ( not ( = ?auto_26050 ?auto_26044 ) ) ( HOIST-AT ?auto_26055 ?auto_26044 ) ( LIFTING ?auto_26055 ?auto_26048 ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( not ( = ?auto_26045 ?auto_26055 ) ) ( not ( = ?auto_26052 ?auto_26055 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26055 ?auto_26048 ?auto_26054 ?auto_26044 )
      ( MAKE-ON ?auto_26039 ?auto_26040 )
      ( MAKE-ON-VERIFY ?auto_26039 ?auto_26040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26056 - SURFACE
      ?auto_26057 - SURFACE
    )
    :vars
    (
      ?auto_26064 - HOIST
      ?auto_26067 - PLACE
      ?auto_26070 - PLACE
      ?auto_26063 - HOIST
      ?auto_26059 - SURFACE
      ?auto_26072 - SURFACE
      ?auto_26065 - PLACE
      ?auto_26066 - HOIST
      ?auto_26058 - SURFACE
      ?auto_26060 - SURFACE
      ?auto_26071 - SURFACE
      ?auto_26068 - SURFACE
      ?auto_26062 - TRUCK
      ?auto_26061 - PLACE
      ?auto_26069 - HOIST
      ?auto_26073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26064 ?auto_26067 ) ( IS-CRATE ?auto_26056 ) ( not ( = ?auto_26056 ?auto_26057 ) ) ( not ( = ?auto_26070 ?auto_26067 ) ) ( HOIST-AT ?auto_26063 ?auto_26070 ) ( not ( = ?auto_26064 ?auto_26063 ) ) ( AVAILABLE ?auto_26063 ) ( SURFACE-AT ?auto_26056 ?auto_26070 ) ( ON ?auto_26056 ?auto_26059 ) ( CLEAR ?auto_26056 ) ( not ( = ?auto_26056 ?auto_26059 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( IS-CRATE ?auto_26057 ) ( not ( = ?auto_26056 ?auto_26072 ) ) ( not ( = ?auto_26057 ?auto_26072 ) ) ( not ( = ?auto_26059 ?auto_26072 ) ) ( not ( = ?auto_26065 ?auto_26067 ) ) ( not ( = ?auto_26070 ?auto_26065 ) ) ( HOIST-AT ?auto_26066 ?auto_26065 ) ( not ( = ?auto_26064 ?auto_26066 ) ) ( not ( = ?auto_26063 ?auto_26066 ) ) ( SURFACE-AT ?auto_26057 ?auto_26065 ) ( ON ?auto_26057 ?auto_26058 ) ( CLEAR ?auto_26057 ) ( not ( = ?auto_26056 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26059 ?auto_26058 ) ) ( not ( = ?auto_26072 ?auto_26058 ) ) ( IS-CRATE ?auto_26072 ) ( not ( = ?auto_26056 ?auto_26060 ) ) ( not ( = ?auto_26057 ?auto_26060 ) ) ( not ( = ?auto_26059 ?auto_26060 ) ) ( not ( = ?auto_26072 ?auto_26060 ) ) ( not ( = ?auto_26058 ?auto_26060 ) ) ( AVAILABLE ?auto_26066 ) ( SURFACE-AT ?auto_26072 ?auto_26065 ) ( ON ?auto_26072 ?auto_26071 ) ( CLEAR ?auto_26072 ) ( not ( = ?auto_26056 ?auto_26071 ) ) ( not ( = ?auto_26057 ?auto_26071 ) ) ( not ( = ?auto_26059 ?auto_26071 ) ) ( not ( = ?auto_26072 ?auto_26071 ) ) ( not ( = ?auto_26058 ?auto_26071 ) ) ( not ( = ?auto_26060 ?auto_26071 ) ) ( SURFACE-AT ?auto_26068 ?auto_26067 ) ( CLEAR ?auto_26068 ) ( IS-CRATE ?auto_26060 ) ( not ( = ?auto_26056 ?auto_26068 ) ) ( not ( = ?auto_26057 ?auto_26068 ) ) ( not ( = ?auto_26059 ?auto_26068 ) ) ( not ( = ?auto_26072 ?auto_26068 ) ) ( not ( = ?auto_26058 ?auto_26068 ) ) ( not ( = ?auto_26060 ?auto_26068 ) ) ( not ( = ?auto_26071 ?auto_26068 ) ) ( AVAILABLE ?auto_26064 ) ( TRUCK-AT ?auto_26062 ?auto_26061 ) ( not ( = ?auto_26061 ?auto_26067 ) ) ( not ( = ?auto_26070 ?auto_26061 ) ) ( not ( = ?auto_26065 ?auto_26061 ) ) ( HOIST-AT ?auto_26069 ?auto_26061 ) ( not ( = ?auto_26064 ?auto_26069 ) ) ( not ( = ?auto_26063 ?auto_26069 ) ) ( not ( = ?auto_26066 ?auto_26069 ) ) ( AVAILABLE ?auto_26069 ) ( SURFACE-AT ?auto_26060 ?auto_26061 ) ( ON ?auto_26060 ?auto_26073 ) ( CLEAR ?auto_26060 ) ( not ( = ?auto_26056 ?auto_26073 ) ) ( not ( = ?auto_26057 ?auto_26073 ) ) ( not ( = ?auto_26059 ?auto_26073 ) ) ( not ( = ?auto_26072 ?auto_26073 ) ) ( not ( = ?auto_26058 ?auto_26073 ) ) ( not ( = ?auto_26060 ?auto_26073 ) ) ( not ( = ?auto_26071 ?auto_26073 ) ) ( not ( = ?auto_26068 ?auto_26073 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26069 ?auto_26060 ?auto_26073 ?auto_26061 )
      ( MAKE-ON ?auto_26056 ?auto_26057 )
      ( MAKE-ON-VERIFY ?auto_26056 ?auto_26057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26074 - SURFACE
      ?auto_26075 - SURFACE
    )
    :vars
    (
      ?auto_26089 - HOIST
      ?auto_26082 - PLACE
      ?auto_26076 - PLACE
      ?auto_26084 - HOIST
      ?auto_26091 - SURFACE
      ?auto_26090 - SURFACE
      ?auto_26088 - PLACE
      ?auto_26083 - HOIST
      ?auto_26085 - SURFACE
      ?auto_26079 - SURFACE
      ?auto_26077 - SURFACE
      ?auto_26078 - SURFACE
      ?auto_26087 - PLACE
      ?auto_26081 - HOIST
      ?auto_26080 - SURFACE
      ?auto_26086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26089 ?auto_26082 ) ( IS-CRATE ?auto_26074 ) ( not ( = ?auto_26074 ?auto_26075 ) ) ( not ( = ?auto_26076 ?auto_26082 ) ) ( HOIST-AT ?auto_26084 ?auto_26076 ) ( not ( = ?auto_26089 ?auto_26084 ) ) ( AVAILABLE ?auto_26084 ) ( SURFACE-AT ?auto_26074 ?auto_26076 ) ( ON ?auto_26074 ?auto_26091 ) ( CLEAR ?auto_26074 ) ( not ( = ?auto_26074 ?auto_26091 ) ) ( not ( = ?auto_26075 ?auto_26091 ) ) ( IS-CRATE ?auto_26075 ) ( not ( = ?auto_26074 ?auto_26090 ) ) ( not ( = ?auto_26075 ?auto_26090 ) ) ( not ( = ?auto_26091 ?auto_26090 ) ) ( not ( = ?auto_26088 ?auto_26082 ) ) ( not ( = ?auto_26076 ?auto_26088 ) ) ( HOIST-AT ?auto_26083 ?auto_26088 ) ( not ( = ?auto_26089 ?auto_26083 ) ) ( not ( = ?auto_26084 ?auto_26083 ) ) ( SURFACE-AT ?auto_26075 ?auto_26088 ) ( ON ?auto_26075 ?auto_26085 ) ( CLEAR ?auto_26075 ) ( not ( = ?auto_26074 ?auto_26085 ) ) ( not ( = ?auto_26075 ?auto_26085 ) ) ( not ( = ?auto_26091 ?auto_26085 ) ) ( not ( = ?auto_26090 ?auto_26085 ) ) ( IS-CRATE ?auto_26090 ) ( not ( = ?auto_26074 ?auto_26079 ) ) ( not ( = ?auto_26075 ?auto_26079 ) ) ( not ( = ?auto_26091 ?auto_26079 ) ) ( not ( = ?auto_26090 ?auto_26079 ) ) ( not ( = ?auto_26085 ?auto_26079 ) ) ( AVAILABLE ?auto_26083 ) ( SURFACE-AT ?auto_26090 ?auto_26088 ) ( ON ?auto_26090 ?auto_26077 ) ( CLEAR ?auto_26090 ) ( not ( = ?auto_26074 ?auto_26077 ) ) ( not ( = ?auto_26075 ?auto_26077 ) ) ( not ( = ?auto_26091 ?auto_26077 ) ) ( not ( = ?auto_26090 ?auto_26077 ) ) ( not ( = ?auto_26085 ?auto_26077 ) ) ( not ( = ?auto_26079 ?auto_26077 ) ) ( SURFACE-AT ?auto_26078 ?auto_26082 ) ( CLEAR ?auto_26078 ) ( IS-CRATE ?auto_26079 ) ( not ( = ?auto_26074 ?auto_26078 ) ) ( not ( = ?auto_26075 ?auto_26078 ) ) ( not ( = ?auto_26091 ?auto_26078 ) ) ( not ( = ?auto_26090 ?auto_26078 ) ) ( not ( = ?auto_26085 ?auto_26078 ) ) ( not ( = ?auto_26079 ?auto_26078 ) ) ( not ( = ?auto_26077 ?auto_26078 ) ) ( AVAILABLE ?auto_26089 ) ( not ( = ?auto_26087 ?auto_26082 ) ) ( not ( = ?auto_26076 ?auto_26087 ) ) ( not ( = ?auto_26088 ?auto_26087 ) ) ( HOIST-AT ?auto_26081 ?auto_26087 ) ( not ( = ?auto_26089 ?auto_26081 ) ) ( not ( = ?auto_26084 ?auto_26081 ) ) ( not ( = ?auto_26083 ?auto_26081 ) ) ( AVAILABLE ?auto_26081 ) ( SURFACE-AT ?auto_26079 ?auto_26087 ) ( ON ?auto_26079 ?auto_26080 ) ( CLEAR ?auto_26079 ) ( not ( = ?auto_26074 ?auto_26080 ) ) ( not ( = ?auto_26075 ?auto_26080 ) ) ( not ( = ?auto_26091 ?auto_26080 ) ) ( not ( = ?auto_26090 ?auto_26080 ) ) ( not ( = ?auto_26085 ?auto_26080 ) ) ( not ( = ?auto_26079 ?auto_26080 ) ) ( not ( = ?auto_26077 ?auto_26080 ) ) ( not ( = ?auto_26078 ?auto_26080 ) ) ( TRUCK-AT ?auto_26086 ?auto_26082 ) )
    :subtasks
    ( ( !DRIVE ?auto_26086 ?auto_26082 ?auto_26087 )
      ( MAKE-ON ?auto_26074 ?auto_26075 )
      ( MAKE-ON-VERIFY ?auto_26074 ?auto_26075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26092 - SURFACE
      ?auto_26093 - SURFACE
    )
    :vars
    (
      ?auto_26104 - HOIST
      ?auto_26097 - PLACE
      ?auto_26105 - PLACE
      ?auto_26098 - HOIST
      ?auto_26095 - SURFACE
      ?auto_26094 - SURFACE
      ?auto_26107 - PLACE
      ?auto_26102 - HOIST
      ?auto_26100 - SURFACE
      ?auto_26103 - SURFACE
      ?auto_26096 - SURFACE
      ?auto_26101 - SURFACE
      ?auto_26099 - PLACE
      ?auto_26109 - HOIST
      ?auto_26108 - SURFACE
      ?auto_26106 - TRUCK
      ?auto_26110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26104 ?auto_26097 ) ( IS-CRATE ?auto_26092 ) ( not ( = ?auto_26092 ?auto_26093 ) ) ( not ( = ?auto_26105 ?auto_26097 ) ) ( HOIST-AT ?auto_26098 ?auto_26105 ) ( not ( = ?auto_26104 ?auto_26098 ) ) ( AVAILABLE ?auto_26098 ) ( SURFACE-AT ?auto_26092 ?auto_26105 ) ( ON ?auto_26092 ?auto_26095 ) ( CLEAR ?auto_26092 ) ( not ( = ?auto_26092 ?auto_26095 ) ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( IS-CRATE ?auto_26093 ) ( not ( = ?auto_26092 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26095 ?auto_26094 ) ) ( not ( = ?auto_26107 ?auto_26097 ) ) ( not ( = ?auto_26105 ?auto_26107 ) ) ( HOIST-AT ?auto_26102 ?auto_26107 ) ( not ( = ?auto_26104 ?auto_26102 ) ) ( not ( = ?auto_26098 ?auto_26102 ) ) ( SURFACE-AT ?auto_26093 ?auto_26107 ) ( ON ?auto_26093 ?auto_26100 ) ( CLEAR ?auto_26093 ) ( not ( = ?auto_26092 ?auto_26100 ) ) ( not ( = ?auto_26093 ?auto_26100 ) ) ( not ( = ?auto_26095 ?auto_26100 ) ) ( not ( = ?auto_26094 ?auto_26100 ) ) ( IS-CRATE ?auto_26094 ) ( not ( = ?auto_26092 ?auto_26103 ) ) ( not ( = ?auto_26093 ?auto_26103 ) ) ( not ( = ?auto_26095 ?auto_26103 ) ) ( not ( = ?auto_26094 ?auto_26103 ) ) ( not ( = ?auto_26100 ?auto_26103 ) ) ( AVAILABLE ?auto_26102 ) ( SURFACE-AT ?auto_26094 ?auto_26107 ) ( ON ?auto_26094 ?auto_26096 ) ( CLEAR ?auto_26094 ) ( not ( = ?auto_26092 ?auto_26096 ) ) ( not ( = ?auto_26093 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26096 ) ) ( not ( = ?auto_26094 ?auto_26096 ) ) ( not ( = ?auto_26100 ?auto_26096 ) ) ( not ( = ?auto_26103 ?auto_26096 ) ) ( IS-CRATE ?auto_26103 ) ( not ( = ?auto_26092 ?auto_26101 ) ) ( not ( = ?auto_26093 ?auto_26101 ) ) ( not ( = ?auto_26095 ?auto_26101 ) ) ( not ( = ?auto_26094 ?auto_26101 ) ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( not ( = ?auto_26103 ?auto_26101 ) ) ( not ( = ?auto_26096 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26097 ) ) ( not ( = ?auto_26105 ?auto_26099 ) ) ( not ( = ?auto_26107 ?auto_26099 ) ) ( HOIST-AT ?auto_26109 ?auto_26099 ) ( not ( = ?auto_26104 ?auto_26109 ) ) ( not ( = ?auto_26098 ?auto_26109 ) ) ( not ( = ?auto_26102 ?auto_26109 ) ) ( AVAILABLE ?auto_26109 ) ( SURFACE-AT ?auto_26103 ?auto_26099 ) ( ON ?auto_26103 ?auto_26108 ) ( CLEAR ?auto_26103 ) ( not ( = ?auto_26092 ?auto_26108 ) ) ( not ( = ?auto_26093 ?auto_26108 ) ) ( not ( = ?auto_26095 ?auto_26108 ) ) ( not ( = ?auto_26094 ?auto_26108 ) ) ( not ( = ?auto_26100 ?auto_26108 ) ) ( not ( = ?auto_26103 ?auto_26108 ) ) ( not ( = ?auto_26096 ?auto_26108 ) ) ( not ( = ?auto_26101 ?auto_26108 ) ) ( TRUCK-AT ?auto_26106 ?auto_26097 ) ( SURFACE-AT ?auto_26110 ?auto_26097 ) ( CLEAR ?auto_26110 ) ( LIFTING ?auto_26104 ?auto_26101 ) ( IS-CRATE ?auto_26101 ) ( not ( = ?auto_26092 ?auto_26110 ) ) ( not ( = ?auto_26093 ?auto_26110 ) ) ( not ( = ?auto_26095 ?auto_26110 ) ) ( not ( = ?auto_26094 ?auto_26110 ) ) ( not ( = ?auto_26100 ?auto_26110 ) ) ( not ( = ?auto_26103 ?auto_26110 ) ) ( not ( = ?auto_26096 ?auto_26110 ) ) ( not ( = ?auto_26101 ?auto_26110 ) ) ( not ( = ?auto_26108 ?auto_26110 ) ) )
    :subtasks
    ( ( !DROP ?auto_26104 ?auto_26101 ?auto_26110 ?auto_26097 )
      ( MAKE-ON ?auto_26092 ?auto_26093 )
      ( MAKE-ON-VERIFY ?auto_26092 ?auto_26093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26111 - SURFACE
      ?auto_26112 - SURFACE
    )
    :vars
    (
      ?auto_26117 - HOIST
      ?auto_26120 - PLACE
      ?auto_26114 - PLACE
      ?auto_26119 - HOIST
      ?auto_26127 - SURFACE
      ?auto_26128 - SURFACE
      ?auto_26122 - PLACE
      ?auto_26116 - HOIST
      ?auto_26126 - SURFACE
      ?auto_26124 - SURFACE
      ?auto_26113 - SURFACE
      ?auto_26123 - SURFACE
      ?auto_26118 - PLACE
      ?auto_26115 - HOIST
      ?auto_26125 - SURFACE
      ?auto_26129 - TRUCK
      ?auto_26121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26117 ?auto_26120 ) ( IS-CRATE ?auto_26111 ) ( not ( = ?auto_26111 ?auto_26112 ) ) ( not ( = ?auto_26114 ?auto_26120 ) ) ( HOIST-AT ?auto_26119 ?auto_26114 ) ( not ( = ?auto_26117 ?auto_26119 ) ) ( AVAILABLE ?auto_26119 ) ( SURFACE-AT ?auto_26111 ?auto_26114 ) ( ON ?auto_26111 ?auto_26127 ) ( CLEAR ?auto_26111 ) ( not ( = ?auto_26111 ?auto_26127 ) ) ( not ( = ?auto_26112 ?auto_26127 ) ) ( IS-CRATE ?auto_26112 ) ( not ( = ?auto_26111 ?auto_26128 ) ) ( not ( = ?auto_26112 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( not ( = ?auto_26122 ?auto_26120 ) ) ( not ( = ?auto_26114 ?auto_26122 ) ) ( HOIST-AT ?auto_26116 ?auto_26122 ) ( not ( = ?auto_26117 ?auto_26116 ) ) ( not ( = ?auto_26119 ?auto_26116 ) ) ( SURFACE-AT ?auto_26112 ?auto_26122 ) ( ON ?auto_26112 ?auto_26126 ) ( CLEAR ?auto_26112 ) ( not ( = ?auto_26111 ?auto_26126 ) ) ( not ( = ?auto_26112 ?auto_26126 ) ) ( not ( = ?auto_26127 ?auto_26126 ) ) ( not ( = ?auto_26128 ?auto_26126 ) ) ( IS-CRATE ?auto_26128 ) ( not ( = ?auto_26111 ?auto_26124 ) ) ( not ( = ?auto_26112 ?auto_26124 ) ) ( not ( = ?auto_26127 ?auto_26124 ) ) ( not ( = ?auto_26128 ?auto_26124 ) ) ( not ( = ?auto_26126 ?auto_26124 ) ) ( AVAILABLE ?auto_26116 ) ( SURFACE-AT ?auto_26128 ?auto_26122 ) ( ON ?auto_26128 ?auto_26113 ) ( CLEAR ?auto_26128 ) ( not ( = ?auto_26111 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( not ( = ?auto_26127 ?auto_26113 ) ) ( not ( = ?auto_26128 ?auto_26113 ) ) ( not ( = ?auto_26126 ?auto_26113 ) ) ( not ( = ?auto_26124 ?auto_26113 ) ) ( IS-CRATE ?auto_26124 ) ( not ( = ?auto_26111 ?auto_26123 ) ) ( not ( = ?auto_26112 ?auto_26123 ) ) ( not ( = ?auto_26127 ?auto_26123 ) ) ( not ( = ?auto_26128 ?auto_26123 ) ) ( not ( = ?auto_26126 ?auto_26123 ) ) ( not ( = ?auto_26124 ?auto_26123 ) ) ( not ( = ?auto_26113 ?auto_26123 ) ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( not ( = ?auto_26114 ?auto_26118 ) ) ( not ( = ?auto_26122 ?auto_26118 ) ) ( HOIST-AT ?auto_26115 ?auto_26118 ) ( not ( = ?auto_26117 ?auto_26115 ) ) ( not ( = ?auto_26119 ?auto_26115 ) ) ( not ( = ?auto_26116 ?auto_26115 ) ) ( AVAILABLE ?auto_26115 ) ( SURFACE-AT ?auto_26124 ?auto_26118 ) ( ON ?auto_26124 ?auto_26125 ) ( CLEAR ?auto_26124 ) ( not ( = ?auto_26111 ?auto_26125 ) ) ( not ( = ?auto_26112 ?auto_26125 ) ) ( not ( = ?auto_26127 ?auto_26125 ) ) ( not ( = ?auto_26128 ?auto_26125 ) ) ( not ( = ?auto_26126 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26125 ) ) ( not ( = ?auto_26113 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( TRUCK-AT ?auto_26129 ?auto_26120 ) ( SURFACE-AT ?auto_26121 ?auto_26120 ) ( CLEAR ?auto_26121 ) ( IS-CRATE ?auto_26123 ) ( not ( = ?auto_26111 ?auto_26121 ) ) ( not ( = ?auto_26112 ?auto_26121 ) ) ( not ( = ?auto_26127 ?auto_26121 ) ) ( not ( = ?auto_26128 ?auto_26121 ) ) ( not ( = ?auto_26126 ?auto_26121 ) ) ( not ( = ?auto_26124 ?auto_26121 ) ) ( not ( = ?auto_26113 ?auto_26121 ) ) ( not ( = ?auto_26123 ?auto_26121 ) ) ( not ( = ?auto_26125 ?auto_26121 ) ) ( AVAILABLE ?auto_26117 ) ( IN ?auto_26123 ?auto_26129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26117 ?auto_26123 ?auto_26129 ?auto_26120 )
      ( MAKE-ON ?auto_26111 ?auto_26112 )
      ( MAKE-ON-VERIFY ?auto_26111 ?auto_26112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26130 - SURFACE
      ?auto_26131 - SURFACE
    )
    :vars
    (
      ?auto_26133 - HOIST
      ?auto_26134 - PLACE
      ?auto_26132 - PLACE
      ?auto_26141 - HOIST
      ?auto_26138 - SURFACE
      ?auto_26144 - SURFACE
      ?auto_26142 - PLACE
      ?auto_26136 - HOIST
      ?auto_26137 - SURFACE
      ?auto_26147 - SURFACE
      ?auto_26135 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26140 - PLACE
      ?auto_26143 - HOIST
      ?auto_26145 - SURFACE
      ?auto_26148 - SURFACE
      ?auto_26146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26133 ?auto_26134 ) ( IS-CRATE ?auto_26130 ) ( not ( = ?auto_26130 ?auto_26131 ) ) ( not ( = ?auto_26132 ?auto_26134 ) ) ( HOIST-AT ?auto_26141 ?auto_26132 ) ( not ( = ?auto_26133 ?auto_26141 ) ) ( AVAILABLE ?auto_26141 ) ( SURFACE-AT ?auto_26130 ?auto_26132 ) ( ON ?auto_26130 ?auto_26138 ) ( CLEAR ?auto_26130 ) ( not ( = ?auto_26130 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26144 ) ) ( not ( = ?auto_26131 ?auto_26144 ) ) ( not ( = ?auto_26138 ?auto_26144 ) ) ( not ( = ?auto_26142 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26142 ) ) ( HOIST-AT ?auto_26136 ?auto_26142 ) ( not ( = ?auto_26133 ?auto_26136 ) ) ( not ( = ?auto_26141 ?auto_26136 ) ) ( SURFACE-AT ?auto_26131 ?auto_26142 ) ( ON ?auto_26131 ?auto_26137 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26137 ) ) ( not ( = ?auto_26131 ?auto_26137 ) ) ( not ( = ?auto_26138 ?auto_26137 ) ) ( not ( = ?auto_26144 ?auto_26137 ) ) ( IS-CRATE ?auto_26144 ) ( not ( = ?auto_26130 ?auto_26147 ) ) ( not ( = ?auto_26131 ?auto_26147 ) ) ( not ( = ?auto_26138 ?auto_26147 ) ) ( not ( = ?auto_26144 ?auto_26147 ) ) ( not ( = ?auto_26137 ?auto_26147 ) ) ( AVAILABLE ?auto_26136 ) ( SURFACE-AT ?auto_26144 ?auto_26142 ) ( ON ?auto_26144 ?auto_26135 ) ( CLEAR ?auto_26144 ) ( not ( = ?auto_26130 ?auto_26135 ) ) ( not ( = ?auto_26131 ?auto_26135 ) ) ( not ( = ?auto_26138 ?auto_26135 ) ) ( not ( = ?auto_26144 ?auto_26135 ) ) ( not ( = ?auto_26137 ?auto_26135 ) ) ( not ( = ?auto_26147 ?auto_26135 ) ) ( IS-CRATE ?auto_26147 ) ( not ( = ?auto_26130 ?auto_26139 ) ) ( not ( = ?auto_26131 ?auto_26139 ) ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26144 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( not ( = ?auto_26147 ?auto_26139 ) ) ( not ( = ?auto_26135 ?auto_26139 ) ) ( not ( = ?auto_26140 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26140 ) ) ( not ( = ?auto_26142 ?auto_26140 ) ) ( HOIST-AT ?auto_26143 ?auto_26140 ) ( not ( = ?auto_26133 ?auto_26143 ) ) ( not ( = ?auto_26141 ?auto_26143 ) ) ( not ( = ?auto_26136 ?auto_26143 ) ) ( AVAILABLE ?auto_26143 ) ( SURFACE-AT ?auto_26147 ?auto_26140 ) ( ON ?auto_26147 ?auto_26145 ) ( CLEAR ?auto_26147 ) ( not ( = ?auto_26130 ?auto_26145 ) ) ( not ( = ?auto_26131 ?auto_26145 ) ) ( not ( = ?auto_26138 ?auto_26145 ) ) ( not ( = ?auto_26144 ?auto_26145 ) ) ( not ( = ?auto_26137 ?auto_26145 ) ) ( not ( = ?auto_26147 ?auto_26145 ) ) ( not ( = ?auto_26135 ?auto_26145 ) ) ( not ( = ?auto_26139 ?auto_26145 ) ) ( SURFACE-AT ?auto_26148 ?auto_26134 ) ( CLEAR ?auto_26148 ) ( IS-CRATE ?auto_26139 ) ( not ( = ?auto_26130 ?auto_26148 ) ) ( not ( = ?auto_26131 ?auto_26148 ) ) ( not ( = ?auto_26138 ?auto_26148 ) ) ( not ( = ?auto_26144 ?auto_26148 ) ) ( not ( = ?auto_26137 ?auto_26148 ) ) ( not ( = ?auto_26147 ?auto_26148 ) ) ( not ( = ?auto_26135 ?auto_26148 ) ) ( not ( = ?auto_26139 ?auto_26148 ) ) ( not ( = ?auto_26145 ?auto_26148 ) ) ( AVAILABLE ?auto_26133 ) ( IN ?auto_26139 ?auto_26146 ) ( TRUCK-AT ?auto_26146 ?auto_26140 ) )
    :subtasks
    ( ( !DRIVE ?auto_26146 ?auto_26140 ?auto_26134 )
      ( MAKE-ON ?auto_26130 ?auto_26131 )
      ( MAKE-ON-VERIFY ?auto_26130 ?auto_26131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26149 - SURFACE
      ?auto_26150 - SURFACE
    )
    :vars
    (
      ?auto_26161 - HOIST
      ?auto_26157 - PLACE
      ?auto_26164 - PLACE
      ?auto_26155 - HOIST
      ?auto_26156 - SURFACE
      ?auto_26153 - SURFACE
      ?auto_26160 - PLACE
      ?auto_26165 - HOIST
      ?auto_26159 - SURFACE
      ?auto_26163 - SURFACE
      ?auto_26166 - SURFACE
      ?auto_26167 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26162 - HOIST
      ?auto_26158 - SURFACE
      ?auto_26154 - SURFACE
      ?auto_26152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26161 ?auto_26157 ) ( IS-CRATE ?auto_26149 ) ( not ( = ?auto_26149 ?auto_26150 ) ) ( not ( = ?auto_26164 ?auto_26157 ) ) ( HOIST-AT ?auto_26155 ?auto_26164 ) ( not ( = ?auto_26161 ?auto_26155 ) ) ( AVAILABLE ?auto_26155 ) ( SURFACE-AT ?auto_26149 ?auto_26164 ) ( ON ?auto_26149 ?auto_26156 ) ( CLEAR ?auto_26149 ) ( not ( = ?auto_26149 ?auto_26156 ) ) ( not ( = ?auto_26150 ?auto_26156 ) ) ( IS-CRATE ?auto_26150 ) ( not ( = ?auto_26149 ?auto_26153 ) ) ( not ( = ?auto_26150 ?auto_26153 ) ) ( not ( = ?auto_26156 ?auto_26153 ) ) ( not ( = ?auto_26160 ?auto_26157 ) ) ( not ( = ?auto_26164 ?auto_26160 ) ) ( HOIST-AT ?auto_26165 ?auto_26160 ) ( not ( = ?auto_26161 ?auto_26165 ) ) ( not ( = ?auto_26155 ?auto_26165 ) ) ( SURFACE-AT ?auto_26150 ?auto_26160 ) ( ON ?auto_26150 ?auto_26159 ) ( CLEAR ?auto_26150 ) ( not ( = ?auto_26149 ?auto_26159 ) ) ( not ( = ?auto_26150 ?auto_26159 ) ) ( not ( = ?auto_26156 ?auto_26159 ) ) ( not ( = ?auto_26153 ?auto_26159 ) ) ( IS-CRATE ?auto_26153 ) ( not ( = ?auto_26149 ?auto_26163 ) ) ( not ( = ?auto_26150 ?auto_26163 ) ) ( not ( = ?auto_26156 ?auto_26163 ) ) ( not ( = ?auto_26153 ?auto_26163 ) ) ( not ( = ?auto_26159 ?auto_26163 ) ) ( AVAILABLE ?auto_26165 ) ( SURFACE-AT ?auto_26153 ?auto_26160 ) ( ON ?auto_26153 ?auto_26166 ) ( CLEAR ?auto_26153 ) ( not ( = ?auto_26149 ?auto_26166 ) ) ( not ( = ?auto_26150 ?auto_26166 ) ) ( not ( = ?auto_26156 ?auto_26166 ) ) ( not ( = ?auto_26153 ?auto_26166 ) ) ( not ( = ?auto_26159 ?auto_26166 ) ) ( not ( = ?auto_26163 ?auto_26166 ) ) ( IS-CRATE ?auto_26163 ) ( not ( = ?auto_26149 ?auto_26167 ) ) ( not ( = ?auto_26150 ?auto_26167 ) ) ( not ( = ?auto_26156 ?auto_26167 ) ) ( not ( = ?auto_26153 ?auto_26167 ) ) ( not ( = ?auto_26159 ?auto_26167 ) ) ( not ( = ?auto_26163 ?auto_26167 ) ) ( not ( = ?auto_26166 ?auto_26167 ) ) ( not ( = ?auto_26151 ?auto_26157 ) ) ( not ( = ?auto_26164 ?auto_26151 ) ) ( not ( = ?auto_26160 ?auto_26151 ) ) ( HOIST-AT ?auto_26162 ?auto_26151 ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( not ( = ?auto_26155 ?auto_26162 ) ) ( not ( = ?auto_26165 ?auto_26162 ) ) ( SURFACE-AT ?auto_26163 ?auto_26151 ) ( ON ?auto_26163 ?auto_26158 ) ( CLEAR ?auto_26163 ) ( not ( = ?auto_26149 ?auto_26158 ) ) ( not ( = ?auto_26150 ?auto_26158 ) ) ( not ( = ?auto_26156 ?auto_26158 ) ) ( not ( = ?auto_26153 ?auto_26158 ) ) ( not ( = ?auto_26159 ?auto_26158 ) ) ( not ( = ?auto_26163 ?auto_26158 ) ) ( not ( = ?auto_26166 ?auto_26158 ) ) ( not ( = ?auto_26167 ?auto_26158 ) ) ( SURFACE-AT ?auto_26154 ?auto_26157 ) ( CLEAR ?auto_26154 ) ( IS-CRATE ?auto_26167 ) ( not ( = ?auto_26149 ?auto_26154 ) ) ( not ( = ?auto_26150 ?auto_26154 ) ) ( not ( = ?auto_26156 ?auto_26154 ) ) ( not ( = ?auto_26153 ?auto_26154 ) ) ( not ( = ?auto_26159 ?auto_26154 ) ) ( not ( = ?auto_26163 ?auto_26154 ) ) ( not ( = ?auto_26166 ?auto_26154 ) ) ( not ( = ?auto_26167 ?auto_26154 ) ) ( not ( = ?auto_26158 ?auto_26154 ) ) ( AVAILABLE ?auto_26161 ) ( TRUCK-AT ?auto_26152 ?auto_26151 ) ( LIFTING ?auto_26162 ?auto_26167 ) )
    :subtasks
    ( ( !LOAD ?auto_26162 ?auto_26167 ?auto_26152 ?auto_26151 )
      ( MAKE-ON ?auto_26149 ?auto_26150 )
      ( MAKE-ON-VERIFY ?auto_26149 ?auto_26150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26168 - SURFACE
      ?auto_26169 - SURFACE
    )
    :vars
    (
      ?auto_26181 - HOIST
      ?auto_26177 - PLACE
      ?auto_26172 - PLACE
      ?auto_26182 - HOIST
      ?auto_26174 - SURFACE
      ?auto_26176 - SURFACE
      ?auto_26175 - PLACE
      ?auto_26171 - HOIST
      ?auto_26178 - SURFACE
      ?auto_26183 - SURFACE
      ?auto_26170 - SURFACE
      ?auto_26179 - SURFACE
      ?auto_26180 - PLACE
      ?auto_26185 - HOIST
      ?auto_26173 - SURFACE
      ?auto_26184 - SURFACE
      ?auto_26186 - TRUCK
      ?auto_26187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26181 ?auto_26177 ) ( IS-CRATE ?auto_26168 ) ( not ( = ?auto_26168 ?auto_26169 ) ) ( not ( = ?auto_26172 ?auto_26177 ) ) ( HOIST-AT ?auto_26182 ?auto_26172 ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( AVAILABLE ?auto_26182 ) ( SURFACE-AT ?auto_26168 ?auto_26172 ) ( ON ?auto_26168 ?auto_26174 ) ( CLEAR ?auto_26168 ) ( not ( = ?auto_26168 ?auto_26174 ) ) ( not ( = ?auto_26169 ?auto_26174 ) ) ( IS-CRATE ?auto_26169 ) ( not ( = ?auto_26168 ?auto_26176 ) ) ( not ( = ?auto_26169 ?auto_26176 ) ) ( not ( = ?auto_26174 ?auto_26176 ) ) ( not ( = ?auto_26175 ?auto_26177 ) ) ( not ( = ?auto_26172 ?auto_26175 ) ) ( HOIST-AT ?auto_26171 ?auto_26175 ) ( not ( = ?auto_26181 ?auto_26171 ) ) ( not ( = ?auto_26182 ?auto_26171 ) ) ( SURFACE-AT ?auto_26169 ?auto_26175 ) ( ON ?auto_26169 ?auto_26178 ) ( CLEAR ?auto_26169 ) ( not ( = ?auto_26168 ?auto_26178 ) ) ( not ( = ?auto_26169 ?auto_26178 ) ) ( not ( = ?auto_26174 ?auto_26178 ) ) ( not ( = ?auto_26176 ?auto_26178 ) ) ( IS-CRATE ?auto_26176 ) ( not ( = ?auto_26168 ?auto_26183 ) ) ( not ( = ?auto_26169 ?auto_26183 ) ) ( not ( = ?auto_26174 ?auto_26183 ) ) ( not ( = ?auto_26176 ?auto_26183 ) ) ( not ( = ?auto_26178 ?auto_26183 ) ) ( AVAILABLE ?auto_26171 ) ( SURFACE-AT ?auto_26176 ?auto_26175 ) ( ON ?auto_26176 ?auto_26170 ) ( CLEAR ?auto_26176 ) ( not ( = ?auto_26168 ?auto_26170 ) ) ( not ( = ?auto_26169 ?auto_26170 ) ) ( not ( = ?auto_26174 ?auto_26170 ) ) ( not ( = ?auto_26176 ?auto_26170 ) ) ( not ( = ?auto_26178 ?auto_26170 ) ) ( not ( = ?auto_26183 ?auto_26170 ) ) ( IS-CRATE ?auto_26183 ) ( not ( = ?auto_26168 ?auto_26179 ) ) ( not ( = ?auto_26169 ?auto_26179 ) ) ( not ( = ?auto_26174 ?auto_26179 ) ) ( not ( = ?auto_26176 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26183 ?auto_26179 ) ) ( not ( = ?auto_26170 ?auto_26179 ) ) ( not ( = ?auto_26180 ?auto_26177 ) ) ( not ( = ?auto_26172 ?auto_26180 ) ) ( not ( = ?auto_26175 ?auto_26180 ) ) ( HOIST-AT ?auto_26185 ?auto_26180 ) ( not ( = ?auto_26181 ?auto_26185 ) ) ( not ( = ?auto_26182 ?auto_26185 ) ) ( not ( = ?auto_26171 ?auto_26185 ) ) ( SURFACE-AT ?auto_26183 ?auto_26180 ) ( ON ?auto_26183 ?auto_26173 ) ( CLEAR ?auto_26183 ) ( not ( = ?auto_26168 ?auto_26173 ) ) ( not ( = ?auto_26169 ?auto_26173 ) ) ( not ( = ?auto_26174 ?auto_26173 ) ) ( not ( = ?auto_26176 ?auto_26173 ) ) ( not ( = ?auto_26178 ?auto_26173 ) ) ( not ( = ?auto_26183 ?auto_26173 ) ) ( not ( = ?auto_26170 ?auto_26173 ) ) ( not ( = ?auto_26179 ?auto_26173 ) ) ( SURFACE-AT ?auto_26184 ?auto_26177 ) ( CLEAR ?auto_26184 ) ( IS-CRATE ?auto_26179 ) ( not ( = ?auto_26168 ?auto_26184 ) ) ( not ( = ?auto_26169 ?auto_26184 ) ) ( not ( = ?auto_26174 ?auto_26184 ) ) ( not ( = ?auto_26176 ?auto_26184 ) ) ( not ( = ?auto_26178 ?auto_26184 ) ) ( not ( = ?auto_26183 ?auto_26184 ) ) ( not ( = ?auto_26170 ?auto_26184 ) ) ( not ( = ?auto_26179 ?auto_26184 ) ) ( not ( = ?auto_26173 ?auto_26184 ) ) ( AVAILABLE ?auto_26181 ) ( TRUCK-AT ?auto_26186 ?auto_26180 ) ( AVAILABLE ?auto_26185 ) ( SURFACE-AT ?auto_26179 ?auto_26180 ) ( ON ?auto_26179 ?auto_26187 ) ( CLEAR ?auto_26179 ) ( not ( = ?auto_26168 ?auto_26187 ) ) ( not ( = ?auto_26169 ?auto_26187 ) ) ( not ( = ?auto_26174 ?auto_26187 ) ) ( not ( = ?auto_26176 ?auto_26187 ) ) ( not ( = ?auto_26178 ?auto_26187 ) ) ( not ( = ?auto_26183 ?auto_26187 ) ) ( not ( = ?auto_26170 ?auto_26187 ) ) ( not ( = ?auto_26179 ?auto_26187 ) ) ( not ( = ?auto_26173 ?auto_26187 ) ) ( not ( = ?auto_26184 ?auto_26187 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26185 ?auto_26179 ?auto_26187 ?auto_26180 )
      ( MAKE-ON ?auto_26168 ?auto_26169 )
      ( MAKE-ON-VERIFY ?auto_26168 ?auto_26169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26188 - SURFACE
      ?auto_26189 - SURFACE
    )
    :vars
    (
      ?auto_26190 - HOIST
      ?auto_26193 - PLACE
      ?auto_26196 - PLACE
      ?auto_26203 - HOIST
      ?auto_26191 - SURFACE
      ?auto_26200 - SURFACE
      ?auto_26195 - PLACE
      ?auto_26202 - HOIST
      ?auto_26204 - SURFACE
      ?auto_26207 - SURFACE
      ?auto_26205 - SURFACE
      ?auto_26194 - SURFACE
      ?auto_26199 - PLACE
      ?auto_26198 - HOIST
      ?auto_26201 - SURFACE
      ?auto_26192 - SURFACE
      ?auto_26206 - SURFACE
      ?auto_26197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26190 ?auto_26193 ) ( IS-CRATE ?auto_26188 ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( not ( = ?auto_26196 ?auto_26193 ) ) ( HOIST-AT ?auto_26203 ?auto_26196 ) ( not ( = ?auto_26190 ?auto_26203 ) ) ( AVAILABLE ?auto_26203 ) ( SURFACE-AT ?auto_26188 ?auto_26196 ) ( ON ?auto_26188 ?auto_26191 ) ( CLEAR ?auto_26188 ) ( not ( = ?auto_26188 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( IS-CRATE ?auto_26189 ) ( not ( = ?auto_26188 ?auto_26200 ) ) ( not ( = ?auto_26189 ?auto_26200 ) ) ( not ( = ?auto_26191 ?auto_26200 ) ) ( not ( = ?auto_26195 ?auto_26193 ) ) ( not ( = ?auto_26196 ?auto_26195 ) ) ( HOIST-AT ?auto_26202 ?auto_26195 ) ( not ( = ?auto_26190 ?auto_26202 ) ) ( not ( = ?auto_26203 ?auto_26202 ) ) ( SURFACE-AT ?auto_26189 ?auto_26195 ) ( ON ?auto_26189 ?auto_26204 ) ( CLEAR ?auto_26189 ) ( not ( = ?auto_26188 ?auto_26204 ) ) ( not ( = ?auto_26189 ?auto_26204 ) ) ( not ( = ?auto_26191 ?auto_26204 ) ) ( not ( = ?auto_26200 ?auto_26204 ) ) ( IS-CRATE ?auto_26200 ) ( not ( = ?auto_26188 ?auto_26207 ) ) ( not ( = ?auto_26189 ?auto_26207 ) ) ( not ( = ?auto_26191 ?auto_26207 ) ) ( not ( = ?auto_26200 ?auto_26207 ) ) ( not ( = ?auto_26204 ?auto_26207 ) ) ( AVAILABLE ?auto_26202 ) ( SURFACE-AT ?auto_26200 ?auto_26195 ) ( ON ?auto_26200 ?auto_26205 ) ( CLEAR ?auto_26200 ) ( not ( = ?auto_26188 ?auto_26205 ) ) ( not ( = ?auto_26189 ?auto_26205 ) ) ( not ( = ?auto_26191 ?auto_26205 ) ) ( not ( = ?auto_26200 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26207 ?auto_26205 ) ) ( IS-CRATE ?auto_26207 ) ( not ( = ?auto_26188 ?auto_26194 ) ) ( not ( = ?auto_26189 ?auto_26194 ) ) ( not ( = ?auto_26191 ?auto_26194 ) ) ( not ( = ?auto_26200 ?auto_26194 ) ) ( not ( = ?auto_26204 ?auto_26194 ) ) ( not ( = ?auto_26207 ?auto_26194 ) ) ( not ( = ?auto_26205 ?auto_26194 ) ) ( not ( = ?auto_26199 ?auto_26193 ) ) ( not ( = ?auto_26196 ?auto_26199 ) ) ( not ( = ?auto_26195 ?auto_26199 ) ) ( HOIST-AT ?auto_26198 ?auto_26199 ) ( not ( = ?auto_26190 ?auto_26198 ) ) ( not ( = ?auto_26203 ?auto_26198 ) ) ( not ( = ?auto_26202 ?auto_26198 ) ) ( SURFACE-AT ?auto_26207 ?auto_26199 ) ( ON ?auto_26207 ?auto_26201 ) ( CLEAR ?auto_26207 ) ( not ( = ?auto_26188 ?auto_26201 ) ) ( not ( = ?auto_26189 ?auto_26201 ) ) ( not ( = ?auto_26191 ?auto_26201 ) ) ( not ( = ?auto_26200 ?auto_26201 ) ) ( not ( = ?auto_26204 ?auto_26201 ) ) ( not ( = ?auto_26207 ?auto_26201 ) ) ( not ( = ?auto_26205 ?auto_26201 ) ) ( not ( = ?auto_26194 ?auto_26201 ) ) ( SURFACE-AT ?auto_26192 ?auto_26193 ) ( CLEAR ?auto_26192 ) ( IS-CRATE ?auto_26194 ) ( not ( = ?auto_26188 ?auto_26192 ) ) ( not ( = ?auto_26189 ?auto_26192 ) ) ( not ( = ?auto_26191 ?auto_26192 ) ) ( not ( = ?auto_26200 ?auto_26192 ) ) ( not ( = ?auto_26204 ?auto_26192 ) ) ( not ( = ?auto_26207 ?auto_26192 ) ) ( not ( = ?auto_26205 ?auto_26192 ) ) ( not ( = ?auto_26194 ?auto_26192 ) ) ( not ( = ?auto_26201 ?auto_26192 ) ) ( AVAILABLE ?auto_26190 ) ( AVAILABLE ?auto_26198 ) ( SURFACE-AT ?auto_26194 ?auto_26199 ) ( ON ?auto_26194 ?auto_26206 ) ( CLEAR ?auto_26194 ) ( not ( = ?auto_26188 ?auto_26206 ) ) ( not ( = ?auto_26189 ?auto_26206 ) ) ( not ( = ?auto_26191 ?auto_26206 ) ) ( not ( = ?auto_26200 ?auto_26206 ) ) ( not ( = ?auto_26204 ?auto_26206 ) ) ( not ( = ?auto_26207 ?auto_26206 ) ) ( not ( = ?auto_26205 ?auto_26206 ) ) ( not ( = ?auto_26194 ?auto_26206 ) ) ( not ( = ?auto_26201 ?auto_26206 ) ) ( not ( = ?auto_26192 ?auto_26206 ) ) ( TRUCK-AT ?auto_26197 ?auto_26193 ) )
    :subtasks
    ( ( !DRIVE ?auto_26197 ?auto_26193 ?auto_26199 )
      ( MAKE-ON ?auto_26188 ?auto_26189 )
      ( MAKE-ON-VERIFY ?auto_26188 ?auto_26189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26210 - SURFACE
      ?auto_26211 - SURFACE
    )
    :vars
    (
      ?auto_26212 - HOIST
      ?auto_26213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26212 ?auto_26213 ) ( SURFACE-AT ?auto_26211 ?auto_26213 ) ( CLEAR ?auto_26211 ) ( LIFTING ?auto_26212 ?auto_26210 ) ( IS-CRATE ?auto_26210 ) ( not ( = ?auto_26210 ?auto_26211 ) ) )
    :subtasks
    ( ( !DROP ?auto_26212 ?auto_26210 ?auto_26211 ?auto_26213 )
      ( MAKE-ON-VERIFY ?auto_26210 ?auto_26211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26214 - SURFACE
      ?auto_26215 - SURFACE
    )
    :vars
    (
      ?auto_26217 - HOIST
      ?auto_26216 - PLACE
      ?auto_26218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26217 ?auto_26216 ) ( SURFACE-AT ?auto_26215 ?auto_26216 ) ( CLEAR ?auto_26215 ) ( IS-CRATE ?auto_26214 ) ( not ( = ?auto_26214 ?auto_26215 ) ) ( TRUCK-AT ?auto_26218 ?auto_26216 ) ( AVAILABLE ?auto_26217 ) ( IN ?auto_26214 ?auto_26218 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26217 ?auto_26214 ?auto_26218 ?auto_26216 )
      ( MAKE-ON ?auto_26214 ?auto_26215 )
      ( MAKE-ON-VERIFY ?auto_26214 ?auto_26215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26219 - SURFACE
      ?auto_26220 - SURFACE
    )
    :vars
    (
      ?auto_26221 - HOIST
      ?auto_26223 - PLACE
      ?auto_26222 - TRUCK
      ?auto_26224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26221 ?auto_26223 ) ( SURFACE-AT ?auto_26220 ?auto_26223 ) ( CLEAR ?auto_26220 ) ( IS-CRATE ?auto_26219 ) ( not ( = ?auto_26219 ?auto_26220 ) ) ( AVAILABLE ?auto_26221 ) ( IN ?auto_26219 ?auto_26222 ) ( TRUCK-AT ?auto_26222 ?auto_26224 ) ( not ( = ?auto_26224 ?auto_26223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26222 ?auto_26224 ?auto_26223 )
      ( MAKE-ON ?auto_26219 ?auto_26220 )
      ( MAKE-ON-VERIFY ?auto_26219 ?auto_26220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26225 - SURFACE
      ?auto_26226 - SURFACE
    )
    :vars
    (
      ?auto_26230 - HOIST
      ?auto_26228 - PLACE
      ?auto_26229 - TRUCK
      ?auto_26227 - PLACE
      ?auto_26231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26230 ?auto_26228 ) ( SURFACE-AT ?auto_26226 ?auto_26228 ) ( CLEAR ?auto_26226 ) ( IS-CRATE ?auto_26225 ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( AVAILABLE ?auto_26230 ) ( TRUCK-AT ?auto_26229 ?auto_26227 ) ( not ( = ?auto_26227 ?auto_26228 ) ) ( HOIST-AT ?auto_26231 ?auto_26227 ) ( LIFTING ?auto_26231 ?auto_26225 ) ( not ( = ?auto_26230 ?auto_26231 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26231 ?auto_26225 ?auto_26229 ?auto_26227 )
      ( MAKE-ON ?auto_26225 ?auto_26226 )
      ( MAKE-ON-VERIFY ?auto_26225 ?auto_26226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26232 - SURFACE
      ?auto_26233 - SURFACE
    )
    :vars
    (
      ?auto_26236 - HOIST
      ?auto_26238 - PLACE
      ?auto_26234 - TRUCK
      ?auto_26237 - PLACE
      ?auto_26235 - HOIST
      ?auto_26239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26236 ?auto_26238 ) ( SURFACE-AT ?auto_26233 ?auto_26238 ) ( CLEAR ?auto_26233 ) ( IS-CRATE ?auto_26232 ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( AVAILABLE ?auto_26236 ) ( TRUCK-AT ?auto_26234 ?auto_26237 ) ( not ( = ?auto_26237 ?auto_26238 ) ) ( HOIST-AT ?auto_26235 ?auto_26237 ) ( not ( = ?auto_26236 ?auto_26235 ) ) ( AVAILABLE ?auto_26235 ) ( SURFACE-AT ?auto_26232 ?auto_26237 ) ( ON ?auto_26232 ?auto_26239 ) ( CLEAR ?auto_26232 ) ( not ( = ?auto_26232 ?auto_26239 ) ) ( not ( = ?auto_26233 ?auto_26239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26235 ?auto_26232 ?auto_26239 ?auto_26237 )
      ( MAKE-ON ?auto_26232 ?auto_26233 )
      ( MAKE-ON-VERIFY ?auto_26232 ?auto_26233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26240 - SURFACE
      ?auto_26241 - SURFACE
    )
    :vars
    (
      ?auto_26245 - HOIST
      ?auto_26242 - PLACE
      ?auto_26247 - PLACE
      ?auto_26246 - HOIST
      ?auto_26243 - SURFACE
      ?auto_26244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26245 ?auto_26242 ) ( SURFACE-AT ?auto_26241 ?auto_26242 ) ( CLEAR ?auto_26241 ) ( IS-CRATE ?auto_26240 ) ( not ( = ?auto_26240 ?auto_26241 ) ) ( AVAILABLE ?auto_26245 ) ( not ( = ?auto_26247 ?auto_26242 ) ) ( HOIST-AT ?auto_26246 ?auto_26247 ) ( not ( = ?auto_26245 ?auto_26246 ) ) ( AVAILABLE ?auto_26246 ) ( SURFACE-AT ?auto_26240 ?auto_26247 ) ( ON ?auto_26240 ?auto_26243 ) ( CLEAR ?auto_26240 ) ( not ( = ?auto_26240 ?auto_26243 ) ) ( not ( = ?auto_26241 ?auto_26243 ) ) ( TRUCK-AT ?auto_26244 ?auto_26242 ) )
    :subtasks
    ( ( !DRIVE ?auto_26244 ?auto_26242 ?auto_26247 )
      ( MAKE-ON ?auto_26240 ?auto_26241 )
      ( MAKE-ON-VERIFY ?auto_26240 ?auto_26241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26248 - SURFACE
      ?auto_26249 - SURFACE
    )
    :vars
    (
      ?auto_26254 - HOIST
      ?auto_26252 - PLACE
      ?auto_26251 - PLACE
      ?auto_26250 - HOIST
      ?auto_26253 - SURFACE
      ?auto_26255 - TRUCK
      ?auto_26256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26254 ?auto_26252 ) ( IS-CRATE ?auto_26248 ) ( not ( = ?auto_26248 ?auto_26249 ) ) ( not ( = ?auto_26251 ?auto_26252 ) ) ( HOIST-AT ?auto_26250 ?auto_26251 ) ( not ( = ?auto_26254 ?auto_26250 ) ) ( AVAILABLE ?auto_26250 ) ( SURFACE-AT ?auto_26248 ?auto_26251 ) ( ON ?auto_26248 ?auto_26253 ) ( CLEAR ?auto_26248 ) ( not ( = ?auto_26248 ?auto_26253 ) ) ( not ( = ?auto_26249 ?auto_26253 ) ) ( TRUCK-AT ?auto_26255 ?auto_26252 ) ( SURFACE-AT ?auto_26256 ?auto_26252 ) ( CLEAR ?auto_26256 ) ( LIFTING ?auto_26254 ?auto_26249 ) ( IS-CRATE ?auto_26249 ) ( not ( = ?auto_26248 ?auto_26256 ) ) ( not ( = ?auto_26249 ?auto_26256 ) ) ( not ( = ?auto_26253 ?auto_26256 ) ) )
    :subtasks
    ( ( !DROP ?auto_26254 ?auto_26249 ?auto_26256 ?auto_26252 )
      ( MAKE-ON ?auto_26248 ?auto_26249 )
      ( MAKE-ON-VERIFY ?auto_26248 ?auto_26249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26257 - SURFACE
      ?auto_26258 - SURFACE
    )
    :vars
    (
      ?auto_26261 - HOIST
      ?auto_26264 - PLACE
      ?auto_26265 - PLACE
      ?auto_26259 - HOIST
      ?auto_26260 - SURFACE
      ?auto_26263 - TRUCK
      ?auto_26262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26261 ?auto_26264 ) ( IS-CRATE ?auto_26257 ) ( not ( = ?auto_26257 ?auto_26258 ) ) ( not ( = ?auto_26265 ?auto_26264 ) ) ( HOIST-AT ?auto_26259 ?auto_26265 ) ( not ( = ?auto_26261 ?auto_26259 ) ) ( AVAILABLE ?auto_26259 ) ( SURFACE-AT ?auto_26257 ?auto_26265 ) ( ON ?auto_26257 ?auto_26260 ) ( CLEAR ?auto_26257 ) ( not ( = ?auto_26257 ?auto_26260 ) ) ( not ( = ?auto_26258 ?auto_26260 ) ) ( TRUCK-AT ?auto_26263 ?auto_26264 ) ( SURFACE-AT ?auto_26262 ?auto_26264 ) ( CLEAR ?auto_26262 ) ( IS-CRATE ?auto_26258 ) ( not ( = ?auto_26257 ?auto_26262 ) ) ( not ( = ?auto_26258 ?auto_26262 ) ) ( not ( = ?auto_26260 ?auto_26262 ) ) ( AVAILABLE ?auto_26261 ) ( IN ?auto_26258 ?auto_26263 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26261 ?auto_26258 ?auto_26263 ?auto_26264 )
      ( MAKE-ON ?auto_26257 ?auto_26258 )
      ( MAKE-ON-VERIFY ?auto_26257 ?auto_26258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26266 - SURFACE
      ?auto_26267 - SURFACE
    )
    :vars
    (
      ?auto_26268 - HOIST
      ?auto_26269 - PLACE
      ?auto_26274 - PLACE
      ?auto_26273 - HOIST
      ?auto_26270 - SURFACE
      ?auto_26272 - SURFACE
      ?auto_26271 - TRUCK
      ?auto_26275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26268 ?auto_26269 ) ( IS-CRATE ?auto_26266 ) ( not ( = ?auto_26266 ?auto_26267 ) ) ( not ( = ?auto_26274 ?auto_26269 ) ) ( HOIST-AT ?auto_26273 ?auto_26274 ) ( not ( = ?auto_26268 ?auto_26273 ) ) ( AVAILABLE ?auto_26273 ) ( SURFACE-AT ?auto_26266 ?auto_26274 ) ( ON ?auto_26266 ?auto_26270 ) ( CLEAR ?auto_26266 ) ( not ( = ?auto_26266 ?auto_26270 ) ) ( not ( = ?auto_26267 ?auto_26270 ) ) ( SURFACE-AT ?auto_26272 ?auto_26269 ) ( CLEAR ?auto_26272 ) ( IS-CRATE ?auto_26267 ) ( not ( = ?auto_26266 ?auto_26272 ) ) ( not ( = ?auto_26267 ?auto_26272 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( AVAILABLE ?auto_26268 ) ( IN ?auto_26267 ?auto_26271 ) ( TRUCK-AT ?auto_26271 ?auto_26275 ) ( not ( = ?auto_26275 ?auto_26269 ) ) ( not ( = ?auto_26274 ?auto_26275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26271 ?auto_26275 ?auto_26269 )
      ( MAKE-ON ?auto_26266 ?auto_26267 )
      ( MAKE-ON-VERIFY ?auto_26266 ?auto_26267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26276 - SURFACE
      ?auto_26277 - SURFACE
    )
    :vars
    (
      ?auto_26285 - HOIST
      ?auto_26283 - PLACE
      ?auto_26284 - PLACE
      ?auto_26279 - HOIST
      ?auto_26280 - SURFACE
      ?auto_26282 - SURFACE
      ?auto_26278 - TRUCK
      ?auto_26281 - PLACE
      ?auto_26286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26285 ?auto_26283 ) ( IS-CRATE ?auto_26276 ) ( not ( = ?auto_26276 ?auto_26277 ) ) ( not ( = ?auto_26284 ?auto_26283 ) ) ( HOIST-AT ?auto_26279 ?auto_26284 ) ( not ( = ?auto_26285 ?auto_26279 ) ) ( AVAILABLE ?auto_26279 ) ( SURFACE-AT ?auto_26276 ?auto_26284 ) ( ON ?auto_26276 ?auto_26280 ) ( CLEAR ?auto_26276 ) ( not ( = ?auto_26276 ?auto_26280 ) ) ( not ( = ?auto_26277 ?auto_26280 ) ) ( SURFACE-AT ?auto_26282 ?auto_26283 ) ( CLEAR ?auto_26282 ) ( IS-CRATE ?auto_26277 ) ( not ( = ?auto_26276 ?auto_26282 ) ) ( not ( = ?auto_26277 ?auto_26282 ) ) ( not ( = ?auto_26280 ?auto_26282 ) ) ( AVAILABLE ?auto_26285 ) ( TRUCK-AT ?auto_26278 ?auto_26281 ) ( not ( = ?auto_26281 ?auto_26283 ) ) ( not ( = ?auto_26284 ?auto_26281 ) ) ( HOIST-AT ?auto_26286 ?auto_26281 ) ( LIFTING ?auto_26286 ?auto_26277 ) ( not ( = ?auto_26285 ?auto_26286 ) ) ( not ( = ?auto_26279 ?auto_26286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26286 ?auto_26277 ?auto_26278 ?auto_26281 )
      ( MAKE-ON ?auto_26276 ?auto_26277 )
      ( MAKE-ON-VERIFY ?auto_26276 ?auto_26277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26287 - SURFACE
      ?auto_26288 - SURFACE
    )
    :vars
    (
      ?auto_26292 - HOIST
      ?auto_26291 - PLACE
      ?auto_26290 - PLACE
      ?auto_26289 - HOIST
      ?auto_26293 - SURFACE
      ?auto_26294 - SURFACE
      ?auto_26296 - TRUCK
      ?auto_26297 - PLACE
      ?auto_26295 - HOIST
      ?auto_26298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26292 ?auto_26291 ) ( IS-CRATE ?auto_26287 ) ( not ( = ?auto_26287 ?auto_26288 ) ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( HOIST-AT ?auto_26289 ?auto_26290 ) ( not ( = ?auto_26292 ?auto_26289 ) ) ( AVAILABLE ?auto_26289 ) ( SURFACE-AT ?auto_26287 ?auto_26290 ) ( ON ?auto_26287 ?auto_26293 ) ( CLEAR ?auto_26287 ) ( not ( = ?auto_26287 ?auto_26293 ) ) ( not ( = ?auto_26288 ?auto_26293 ) ) ( SURFACE-AT ?auto_26294 ?auto_26291 ) ( CLEAR ?auto_26294 ) ( IS-CRATE ?auto_26288 ) ( not ( = ?auto_26287 ?auto_26294 ) ) ( not ( = ?auto_26288 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( AVAILABLE ?auto_26292 ) ( TRUCK-AT ?auto_26296 ?auto_26297 ) ( not ( = ?auto_26297 ?auto_26291 ) ) ( not ( = ?auto_26290 ?auto_26297 ) ) ( HOIST-AT ?auto_26295 ?auto_26297 ) ( not ( = ?auto_26292 ?auto_26295 ) ) ( not ( = ?auto_26289 ?auto_26295 ) ) ( AVAILABLE ?auto_26295 ) ( SURFACE-AT ?auto_26288 ?auto_26297 ) ( ON ?auto_26288 ?auto_26298 ) ( CLEAR ?auto_26288 ) ( not ( = ?auto_26287 ?auto_26298 ) ) ( not ( = ?auto_26288 ?auto_26298 ) ) ( not ( = ?auto_26293 ?auto_26298 ) ) ( not ( = ?auto_26294 ?auto_26298 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26295 ?auto_26288 ?auto_26298 ?auto_26297 )
      ( MAKE-ON ?auto_26287 ?auto_26288 )
      ( MAKE-ON-VERIFY ?auto_26287 ?auto_26288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26299 - SURFACE
      ?auto_26300 - SURFACE
    )
    :vars
    (
      ?auto_26306 - HOIST
      ?auto_26301 - PLACE
      ?auto_26308 - PLACE
      ?auto_26303 - HOIST
      ?auto_26310 - SURFACE
      ?auto_26305 - SURFACE
      ?auto_26302 - PLACE
      ?auto_26309 - HOIST
      ?auto_26304 - SURFACE
      ?auto_26307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26306 ?auto_26301 ) ( IS-CRATE ?auto_26299 ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( not ( = ?auto_26308 ?auto_26301 ) ) ( HOIST-AT ?auto_26303 ?auto_26308 ) ( not ( = ?auto_26306 ?auto_26303 ) ) ( AVAILABLE ?auto_26303 ) ( SURFACE-AT ?auto_26299 ?auto_26308 ) ( ON ?auto_26299 ?auto_26310 ) ( CLEAR ?auto_26299 ) ( not ( = ?auto_26299 ?auto_26310 ) ) ( not ( = ?auto_26300 ?auto_26310 ) ) ( SURFACE-AT ?auto_26305 ?auto_26301 ) ( CLEAR ?auto_26305 ) ( IS-CRATE ?auto_26300 ) ( not ( = ?auto_26299 ?auto_26305 ) ) ( not ( = ?auto_26300 ?auto_26305 ) ) ( not ( = ?auto_26310 ?auto_26305 ) ) ( AVAILABLE ?auto_26306 ) ( not ( = ?auto_26302 ?auto_26301 ) ) ( not ( = ?auto_26308 ?auto_26302 ) ) ( HOIST-AT ?auto_26309 ?auto_26302 ) ( not ( = ?auto_26306 ?auto_26309 ) ) ( not ( = ?auto_26303 ?auto_26309 ) ) ( AVAILABLE ?auto_26309 ) ( SURFACE-AT ?auto_26300 ?auto_26302 ) ( ON ?auto_26300 ?auto_26304 ) ( CLEAR ?auto_26300 ) ( not ( = ?auto_26299 ?auto_26304 ) ) ( not ( = ?auto_26300 ?auto_26304 ) ) ( not ( = ?auto_26310 ?auto_26304 ) ) ( not ( = ?auto_26305 ?auto_26304 ) ) ( TRUCK-AT ?auto_26307 ?auto_26301 ) )
    :subtasks
    ( ( !DRIVE ?auto_26307 ?auto_26301 ?auto_26302 )
      ( MAKE-ON ?auto_26299 ?auto_26300 )
      ( MAKE-ON-VERIFY ?auto_26299 ?auto_26300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26311 - SURFACE
      ?auto_26312 - SURFACE
    )
    :vars
    (
      ?auto_26316 - HOIST
      ?auto_26317 - PLACE
      ?auto_26321 - PLACE
      ?auto_26315 - HOIST
      ?auto_26320 - SURFACE
      ?auto_26314 - SURFACE
      ?auto_26319 - PLACE
      ?auto_26322 - HOIST
      ?auto_26313 - SURFACE
      ?auto_26318 - TRUCK
      ?auto_26323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26316 ?auto_26317 ) ( IS-CRATE ?auto_26311 ) ( not ( = ?auto_26311 ?auto_26312 ) ) ( not ( = ?auto_26321 ?auto_26317 ) ) ( HOIST-AT ?auto_26315 ?auto_26321 ) ( not ( = ?auto_26316 ?auto_26315 ) ) ( AVAILABLE ?auto_26315 ) ( SURFACE-AT ?auto_26311 ?auto_26321 ) ( ON ?auto_26311 ?auto_26320 ) ( CLEAR ?auto_26311 ) ( not ( = ?auto_26311 ?auto_26320 ) ) ( not ( = ?auto_26312 ?auto_26320 ) ) ( IS-CRATE ?auto_26312 ) ( not ( = ?auto_26311 ?auto_26314 ) ) ( not ( = ?auto_26312 ?auto_26314 ) ) ( not ( = ?auto_26320 ?auto_26314 ) ) ( not ( = ?auto_26319 ?auto_26317 ) ) ( not ( = ?auto_26321 ?auto_26319 ) ) ( HOIST-AT ?auto_26322 ?auto_26319 ) ( not ( = ?auto_26316 ?auto_26322 ) ) ( not ( = ?auto_26315 ?auto_26322 ) ) ( AVAILABLE ?auto_26322 ) ( SURFACE-AT ?auto_26312 ?auto_26319 ) ( ON ?auto_26312 ?auto_26313 ) ( CLEAR ?auto_26312 ) ( not ( = ?auto_26311 ?auto_26313 ) ) ( not ( = ?auto_26312 ?auto_26313 ) ) ( not ( = ?auto_26320 ?auto_26313 ) ) ( not ( = ?auto_26314 ?auto_26313 ) ) ( TRUCK-AT ?auto_26318 ?auto_26317 ) ( SURFACE-AT ?auto_26323 ?auto_26317 ) ( CLEAR ?auto_26323 ) ( LIFTING ?auto_26316 ?auto_26314 ) ( IS-CRATE ?auto_26314 ) ( not ( = ?auto_26311 ?auto_26323 ) ) ( not ( = ?auto_26312 ?auto_26323 ) ) ( not ( = ?auto_26320 ?auto_26323 ) ) ( not ( = ?auto_26314 ?auto_26323 ) ) ( not ( = ?auto_26313 ?auto_26323 ) ) )
    :subtasks
    ( ( !DROP ?auto_26316 ?auto_26314 ?auto_26323 ?auto_26317 )
      ( MAKE-ON ?auto_26311 ?auto_26312 )
      ( MAKE-ON-VERIFY ?auto_26311 ?auto_26312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26324 - SURFACE
      ?auto_26325 - SURFACE
    )
    :vars
    (
      ?auto_26332 - HOIST
      ?auto_26330 - PLACE
      ?auto_26328 - PLACE
      ?auto_26334 - HOIST
      ?auto_26327 - SURFACE
      ?auto_26331 - SURFACE
      ?auto_26336 - PLACE
      ?auto_26326 - HOIST
      ?auto_26329 - SURFACE
      ?auto_26333 - TRUCK
      ?auto_26335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26332 ?auto_26330 ) ( IS-CRATE ?auto_26324 ) ( not ( = ?auto_26324 ?auto_26325 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) ( HOIST-AT ?auto_26334 ?auto_26328 ) ( not ( = ?auto_26332 ?auto_26334 ) ) ( AVAILABLE ?auto_26334 ) ( SURFACE-AT ?auto_26324 ?auto_26328 ) ( ON ?auto_26324 ?auto_26327 ) ( CLEAR ?auto_26324 ) ( not ( = ?auto_26324 ?auto_26327 ) ) ( not ( = ?auto_26325 ?auto_26327 ) ) ( IS-CRATE ?auto_26325 ) ( not ( = ?auto_26324 ?auto_26331 ) ) ( not ( = ?auto_26325 ?auto_26331 ) ) ( not ( = ?auto_26327 ?auto_26331 ) ) ( not ( = ?auto_26336 ?auto_26330 ) ) ( not ( = ?auto_26328 ?auto_26336 ) ) ( HOIST-AT ?auto_26326 ?auto_26336 ) ( not ( = ?auto_26332 ?auto_26326 ) ) ( not ( = ?auto_26334 ?auto_26326 ) ) ( AVAILABLE ?auto_26326 ) ( SURFACE-AT ?auto_26325 ?auto_26336 ) ( ON ?auto_26325 ?auto_26329 ) ( CLEAR ?auto_26325 ) ( not ( = ?auto_26324 ?auto_26329 ) ) ( not ( = ?auto_26325 ?auto_26329 ) ) ( not ( = ?auto_26327 ?auto_26329 ) ) ( not ( = ?auto_26331 ?auto_26329 ) ) ( TRUCK-AT ?auto_26333 ?auto_26330 ) ( SURFACE-AT ?auto_26335 ?auto_26330 ) ( CLEAR ?auto_26335 ) ( IS-CRATE ?auto_26331 ) ( not ( = ?auto_26324 ?auto_26335 ) ) ( not ( = ?auto_26325 ?auto_26335 ) ) ( not ( = ?auto_26327 ?auto_26335 ) ) ( not ( = ?auto_26331 ?auto_26335 ) ) ( not ( = ?auto_26329 ?auto_26335 ) ) ( AVAILABLE ?auto_26332 ) ( IN ?auto_26331 ?auto_26333 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26332 ?auto_26331 ?auto_26333 ?auto_26330 )
      ( MAKE-ON ?auto_26324 ?auto_26325 )
      ( MAKE-ON-VERIFY ?auto_26324 ?auto_26325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26337 - SURFACE
      ?auto_26338 - SURFACE
    )
    :vars
    (
      ?auto_26340 - HOIST
      ?auto_26339 - PLACE
      ?auto_26343 - PLACE
      ?auto_26345 - HOIST
      ?auto_26344 - SURFACE
      ?auto_26347 - SURFACE
      ?auto_26348 - PLACE
      ?auto_26346 - HOIST
      ?auto_26349 - SURFACE
      ?auto_26341 - SURFACE
      ?auto_26342 - TRUCK
      ?auto_26350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26340 ?auto_26339 ) ( IS-CRATE ?auto_26337 ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26343 ?auto_26339 ) ) ( HOIST-AT ?auto_26345 ?auto_26343 ) ( not ( = ?auto_26340 ?auto_26345 ) ) ( AVAILABLE ?auto_26345 ) ( SURFACE-AT ?auto_26337 ?auto_26343 ) ( ON ?auto_26337 ?auto_26344 ) ( CLEAR ?auto_26337 ) ( not ( = ?auto_26337 ?auto_26344 ) ) ( not ( = ?auto_26338 ?auto_26344 ) ) ( IS-CRATE ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26347 ) ) ( not ( = ?auto_26338 ?auto_26347 ) ) ( not ( = ?auto_26344 ?auto_26347 ) ) ( not ( = ?auto_26348 ?auto_26339 ) ) ( not ( = ?auto_26343 ?auto_26348 ) ) ( HOIST-AT ?auto_26346 ?auto_26348 ) ( not ( = ?auto_26340 ?auto_26346 ) ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( AVAILABLE ?auto_26346 ) ( SURFACE-AT ?auto_26338 ?auto_26348 ) ( ON ?auto_26338 ?auto_26349 ) ( CLEAR ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26349 ) ) ( not ( = ?auto_26338 ?auto_26349 ) ) ( not ( = ?auto_26344 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( SURFACE-AT ?auto_26341 ?auto_26339 ) ( CLEAR ?auto_26341 ) ( IS-CRATE ?auto_26347 ) ( not ( = ?auto_26337 ?auto_26341 ) ) ( not ( = ?auto_26338 ?auto_26341 ) ) ( not ( = ?auto_26344 ?auto_26341 ) ) ( not ( = ?auto_26347 ?auto_26341 ) ) ( not ( = ?auto_26349 ?auto_26341 ) ) ( AVAILABLE ?auto_26340 ) ( IN ?auto_26347 ?auto_26342 ) ( TRUCK-AT ?auto_26342 ?auto_26350 ) ( not ( = ?auto_26350 ?auto_26339 ) ) ( not ( = ?auto_26343 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26342 ?auto_26350 ?auto_26339 )
      ( MAKE-ON ?auto_26337 ?auto_26338 )
      ( MAKE-ON-VERIFY ?auto_26337 ?auto_26338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26351 - SURFACE
      ?auto_26352 - SURFACE
    )
    :vars
    (
      ?auto_26353 - HOIST
      ?auto_26360 - PLACE
      ?auto_26361 - PLACE
      ?auto_26363 - HOIST
      ?auto_26354 - SURFACE
      ?auto_26362 - SURFACE
      ?auto_26356 - PLACE
      ?auto_26355 - HOIST
      ?auto_26364 - SURFACE
      ?auto_26357 - SURFACE
      ?auto_26359 - TRUCK
      ?auto_26358 - PLACE
      ?auto_26365 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26353 ?auto_26360 ) ( IS-CRATE ?auto_26351 ) ( not ( = ?auto_26351 ?auto_26352 ) ) ( not ( = ?auto_26361 ?auto_26360 ) ) ( HOIST-AT ?auto_26363 ?auto_26361 ) ( not ( = ?auto_26353 ?auto_26363 ) ) ( AVAILABLE ?auto_26363 ) ( SURFACE-AT ?auto_26351 ?auto_26361 ) ( ON ?auto_26351 ?auto_26354 ) ( CLEAR ?auto_26351 ) ( not ( = ?auto_26351 ?auto_26354 ) ) ( not ( = ?auto_26352 ?auto_26354 ) ) ( IS-CRATE ?auto_26352 ) ( not ( = ?auto_26351 ?auto_26362 ) ) ( not ( = ?auto_26352 ?auto_26362 ) ) ( not ( = ?auto_26354 ?auto_26362 ) ) ( not ( = ?auto_26356 ?auto_26360 ) ) ( not ( = ?auto_26361 ?auto_26356 ) ) ( HOIST-AT ?auto_26355 ?auto_26356 ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( not ( = ?auto_26363 ?auto_26355 ) ) ( AVAILABLE ?auto_26355 ) ( SURFACE-AT ?auto_26352 ?auto_26356 ) ( ON ?auto_26352 ?auto_26364 ) ( CLEAR ?auto_26352 ) ( not ( = ?auto_26351 ?auto_26364 ) ) ( not ( = ?auto_26352 ?auto_26364 ) ) ( not ( = ?auto_26354 ?auto_26364 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( SURFACE-AT ?auto_26357 ?auto_26360 ) ( CLEAR ?auto_26357 ) ( IS-CRATE ?auto_26362 ) ( not ( = ?auto_26351 ?auto_26357 ) ) ( not ( = ?auto_26352 ?auto_26357 ) ) ( not ( = ?auto_26354 ?auto_26357 ) ) ( not ( = ?auto_26362 ?auto_26357 ) ) ( not ( = ?auto_26364 ?auto_26357 ) ) ( AVAILABLE ?auto_26353 ) ( TRUCK-AT ?auto_26359 ?auto_26358 ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26361 ?auto_26358 ) ) ( not ( = ?auto_26356 ?auto_26358 ) ) ( HOIST-AT ?auto_26365 ?auto_26358 ) ( LIFTING ?auto_26365 ?auto_26362 ) ( not ( = ?auto_26353 ?auto_26365 ) ) ( not ( = ?auto_26363 ?auto_26365 ) ) ( not ( = ?auto_26355 ?auto_26365 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26365 ?auto_26362 ?auto_26359 ?auto_26358 )
      ( MAKE-ON ?auto_26351 ?auto_26352 )
      ( MAKE-ON-VERIFY ?auto_26351 ?auto_26352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26366 - SURFACE
      ?auto_26367 - SURFACE
    )
    :vars
    (
      ?auto_26373 - HOIST
      ?auto_26378 - PLACE
      ?auto_26369 - PLACE
      ?auto_26372 - HOIST
      ?auto_26371 - SURFACE
      ?auto_26376 - SURFACE
      ?auto_26370 - PLACE
      ?auto_26377 - HOIST
      ?auto_26375 - SURFACE
      ?auto_26374 - SURFACE
      ?auto_26368 - TRUCK
      ?auto_26379 - PLACE
      ?auto_26380 - HOIST
      ?auto_26381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26373 ?auto_26378 ) ( IS-CRATE ?auto_26366 ) ( not ( = ?auto_26366 ?auto_26367 ) ) ( not ( = ?auto_26369 ?auto_26378 ) ) ( HOIST-AT ?auto_26372 ?auto_26369 ) ( not ( = ?auto_26373 ?auto_26372 ) ) ( AVAILABLE ?auto_26372 ) ( SURFACE-AT ?auto_26366 ?auto_26369 ) ( ON ?auto_26366 ?auto_26371 ) ( CLEAR ?auto_26366 ) ( not ( = ?auto_26366 ?auto_26371 ) ) ( not ( = ?auto_26367 ?auto_26371 ) ) ( IS-CRATE ?auto_26367 ) ( not ( = ?auto_26366 ?auto_26376 ) ) ( not ( = ?auto_26367 ?auto_26376 ) ) ( not ( = ?auto_26371 ?auto_26376 ) ) ( not ( = ?auto_26370 ?auto_26378 ) ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( HOIST-AT ?auto_26377 ?auto_26370 ) ( not ( = ?auto_26373 ?auto_26377 ) ) ( not ( = ?auto_26372 ?auto_26377 ) ) ( AVAILABLE ?auto_26377 ) ( SURFACE-AT ?auto_26367 ?auto_26370 ) ( ON ?auto_26367 ?auto_26375 ) ( CLEAR ?auto_26367 ) ( not ( = ?auto_26366 ?auto_26375 ) ) ( not ( = ?auto_26367 ?auto_26375 ) ) ( not ( = ?auto_26371 ?auto_26375 ) ) ( not ( = ?auto_26376 ?auto_26375 ) ) ( SURFACE-AT ?auto_26374 ?auto_26378 ) ( CLEAR ?auto_26374 ) ( IS-CRATE ?auto_26376 ) ( not ( = ?auto_26366 ?auto_26374 ) ) ( not ( = ?auto_26367 ?auto_26374 ) ) ( not ( = ?auto_26371 ?auto_26374 ) ) ( not ( = ?auto_26376 ?auto_26374 ) ) ( not ( = ?auto_26375 ?auto_26374 ) ) ( AVAILABLE ?auto_26373 ) ( TRUCK-AT ?auto_26368 ?auto_26379 ) ( not ( = ?auto_26379 ?auto_26378 ) ) ( not ( = ?auto_26369 ?auto_26379 ) ) ( not ( = ?auto_26370 ?auto_26379 ) ) ( HOIST-AT ?auto_26380 ?auto_26379 ) ( not ( = ?auto_26373 ?auto_26380 ) ) ( not ( = ?auto_26372 ?auto_26380 ) ) ( not ( = ?auto_26377 ?auto_26380 ) ) ( AVAILABLE ?auto_26380 ) ( SURFACE-AT ?auto_26376 ?auto_26379 ) ( ON ?auto_26376 ?auto_26381 ) ( CLEAR ?auto_26376 ) ( not ( = ?auto_26366 ?auto_26381 ) ) ( not ( = ?auto_26367 ?auto_26381 ) ) ( not ( = ?auto_26371 ?auto_26381 ) ) ( not ( = ?auto_26376 ?auto_26381 ) ) ( not ( = ?auto_26375 ?auto_26381 ) ) ( not ( = ?auto_26374 ?auto_26381 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26380 ?auto_26376 ?auto_26381 ?auto_26379 )
      ( MAKE-ON ?auto_26366 ?auto_26367 )
      ( MAKE-ON-VERIFY ?auto_26366 ?auto_26367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26382 - SURFACE
      ?auto_26383 - SURFACE
    )
    :vars
    (
      ?auto_26395 - HOIST
      ?auto_26391 - PLACE
      ?auto_26397 - PLACE
      ?auto_26396 - HOIST
      ?auto_26384 - SURFACE
      ?auto_26394 - SURFACE
      ?auto_26386 - PLACE
      ?auto_26387 - HOIST
      ?auto_26389 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26392 - PLACE
      ?auto_26385 - HOIST
      ?auto_26390 - SURFACE
      ?auto_26393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26395 ?auto_26391 ) ( IS-CRATE ?auto_26382 ) ( not ( = ?auto_26382 ?auto_26383 ) ) ( not ( = ?auto_26397 ?auto_26391 ) ) ( HOIST-AT ?auto_26396 ?auto_26397 ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( AVAILABLE ?auto_26396 ) ( SURFACE-AT ?auto_26382 ?auto_26397 ) ( ON ?auto_26382 ?auto_26384 ) ( CLEAR ?auto_26382 ) ( not ( = ?auto_26382 ?auto_26384 ) ) ( not ( = ?auto_26383 ?auto_26384 ) ) ( IS-CRATE ?auto_26383 ) ( not ( = ?auto_26382 ?auto_26394 ) ) ( not ( = ?auto_26383 ?auto_26394 ) ) ( not ( = ?auto_26384 ?auto_26394 ) ) ( not ( = ?auto_26386 ?auto_26391 ) ) ( not ( = ?auto_26397 ?auto_26386 ) ) ( HOIST-AT ?auto_26387 ?auto_26386 ) ( not ( = ?auto_26395 ?auto_26387 ) ) ( not ( = ?auto_26396 ?auto_26387 ) ) ( AVAILABLE ?auto_26387 ) ( SURFACE-AT ?auto_26383 ?auto_26386 ) ( ON ?auto_26383 ?auto_26389 ) ( CLEAR ?auto_26383 ) ( not ( = ?auto_26382 ?auto_26389 ) ) ( not ( = ?auto_26383 ?auto_26389 ) ) ( not ( = ?auto_26384 ?auto_26389 ) ) ( not ( = ?auto_26394 ?auto_26389 ) ) ( SURFACE-AT ?auto_26388 ?auto_26391 ) ( CLEAR ?auto_26388 ) ( IS-CRATE ?auto_26394 ) ( not ( = ?auto_26382 ?auto_26388 ) ) ( not ( = ?auto_26383 ?auto_26388 ) ) ( not ( = ?auto_26384 ?auto_26388 ) ) ( not ( = ?auto_26394 ?auto_26388 ) ) ( not ( = ?auto_26389 ?auto_26388 ) ) ( AVAILABLE ?auto_26395 ) ( not ( = ?auto_26392 ?auto_26391 ) ) ( not ( = ?auto_26397 ?auto_26392 ) ) ( not ( = ?auto_26386 ?auto_26392 ) ) ( HOIST-AT ?auto_26385 ?auto_26392 ) ( not ( = ?auto_26395 ?auto_26385 ) ) ( not ( = ?auto_26396 ?auto_26385 ) ) ( not ( = ?auto_26387 ?auto_26385 ) ) ( AVAILABLE ?auto_26385 ) ( SURFACE-AT ?auto_26394 ?auto_26392 ) ( ON ?auto_26394 ?auto_26390 ) ( CLEAR ?auto_26394 ) ( not ( = ?auto_26382 ?auto_26390 ) ) ( not ( = ?auto_26383 ?auto_26390 ) ) ( not ( = ?auto_26384 ?auto_26390 ) ) ( not ( = ?auto_26394 ?auto_26390 ) ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( TRUCK-AT ?auto_26393 ?auto_26391 ) )
    :subtasks
    ( ( !DRIVE ?auto_26393 ?auto_26391 ?auto_26392 )
      ( MAKE-ON ?auto_26382 ?auto_26383 )
      ( MAKE-ON-VERIFY ?auto_26382 ?auto_26383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26398 - SURFACE
      ?auto_26399 - SURFACE
    )
    :vars
    (
      ?auto_26401 - HOIST
      ?auto_26407 - PLACE
      ?auto_26402 - PLACE
      ?auto_26408 - HOIST
      ?auto_26405 - SURFACE
      ?auto_26406 - SURFACE
      ?auto_26413 - PLACE
      ?auto_26403 - HOIST
      ?auto_26409 - SURFACE
      ?auto_26411 - SURFACE
      ?auto_26404 - PLACE
      ?auto_26400 - HOIST
      ?auto_26412 - SURFACE
      ?auto_26410 - TRUCK
      ?auto_26414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26401 ?auto_26407 ) ( IS-CRATE ?auto_26398 ) ( not ( = ?auto_26398 ?auto_26399 ) ) ( not ( = ?auto_26402 ?auto_26407 ) ) ( HOIST-AT ?auto_26408 ?auto_26402 ) ( not ( = ?auto_26401 ?auto_26408 ) ) ( AVAILABLE ?auto_26408 ) ( SURFACE-AT ?auto_26398 ?auto_26402 ) ( ON ?auto_26398 ?auto_26405 ) ( CLEAR ?auto_26398 ) ( not ( = ?auto_26398 ?auto_26405 ) ) ( not ( = ?auto_26399 ?auto_26405 ) ) ( IS-CRATE ?auto_26399 ) ( not ( = ?auto_26398 ?auto_26406 ) ) ( not ( = ?auto_26399 ?auto_26406 ) ) ( not ( = ?auto_26405 ?auto_26406 ) ) ( not ( = ?auto_26413 ?auto_26407 ) ) ( not ( = ?auto_26402 ?auto_26413 ) ) ( HOIST-AT ?auto_26403 ?auto_26413 ) ( not ( = ?auto_26401 ?auto_26403 ) ) ( not ( = ?auto_26408 ?auto_26403 ) ) ( AVAILABLE ?auto_26403 ) ( SURFACE-AT ?auto_26399 ?auto_26413 ) ( ON ?auto_26399 ?auto_26409 ) ( CLEAR ?auto_26399 ) ( not ( = ?auto_26398 ?auto_26409 ) ) ( not ( = ?auto_26399 ?auto_26409 ) ) ( not ( = ?auto_26405 ?auto_26409 ) ) ( not ( = ?auto_26406 ?auto_26409 ) ) ( IS-CRATE ?auto_26406 ) ( not ( = ?auto_26398 ?auto_26411 ) ) ( not ( = ?auto_26399 ?auto_26411 ) ) ( not ( = ?auto_26405 ?auto_26411 ) ) ( not ( = ?auto_26406 ?auto_26411 ) ) ( not ( = ?auto_26409 ?auto_26411 ) ) ( not ( = ?auto_26404 ?auto_26407 ) ) ( not ( = ?auto_26402 ?auto_26404 ) ) ( not ( = ?auto_26413 ?auto_26404 ) ) ( HOIST-AT ?auto_26400 ?auto_26404 ) ( not ( = ?auto_26401 ?auto_26400 ) ) ( not ( = ?auto_26408 ?auto_26400 ) ) ( not ( = ?auto_26403 ?auto_26400 ) ) ( AVAILABLE ?auto_26400 ) ( SURFACE-AT ?auto_26406 ?auto_26404 ) ( ON ?auto_26406 ?auto_26412 ) ( CLEAR ?auto_26406 ) ( not ( = ?auto_26398 ?auto_26412 ) ) ( not ( = ?auto_26399 ?auto_26412 ) ) ( not ( = ?auto_26405 ?auto_26412 ) ) ( not ( = ?auto_26406 ?auto_26412 ) ) ( not ( = ?auto_26409 ?auto_26412 ) ) ( not ( = ?auto_26411 ?auto_26412 ) ) ( TRUCK-AT ?auto_26410 ?auto_26407 ) ( SURFACE-AT ?auto_26414 ?auto_26407 ) ( CLEAR ?auto_26414 ) ( LIFTING ?auto_26401 ?auto_26411 ) ( IS-CRATE ?auto_26411 ) ( not ( = ?auto_26398 ?auto_26414 ) ) ( not ( = ?auto_26399 ?auto_26414 ) ) ( not ( = ?auto_26405 ?auto_26414 ) ) ( not ( = ?auto_26406 ?auto_26414 ) ) ( not ( = ?auto_26409 ?auto_26414 ) ) ( not ( = ?auto_26411 ?auto_26414 ) ) ( not ( = ?auto_26412 ?auto_26414 ) ) )
    :subtasks
    ( ( !DROP ?auto_26401 ?auto_26411 ?auto_26414 ?auto_26407 )
      ( MAKE-ON ?auto_26398 ?auto_26399 )
      ( MAKE-ON-VERIFY ?auto_26398 ?auto_26399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26415 - SURFACE
      ?auto_26416 - SURFACE
    )
    :vars
    (
      ?auto_26421 - HOIST
      ?auto_26431 - PLACE
      ?auto_26427 - PLACE
      ?auto_26425 - HOIST
      ?auto_26419 - SURFACE
      ?auto_26418 - SURFACE
      ?auto_26420 - PLACE
      ?auto_26422 - HOIST
      ?auto_26429 - SURFACE
      ?auto_26424 - SURFACE
      ?auto_26430 - PLACE
      ?auto_26428 - HOIST
      ?auto_26426 - SURFACE
      ?auto_26417 - TRUCK
      ?auto_26423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26421 ?auto_26431 ) ( IS-CRATE ?auto_26415 ) ( not ( = ?auto_26415 ?auto_26416 ) ) ( not ( = ?auto_26427 ?auto_26431 ) ) ( HOIST-AT ?auto_26425 ?auto_26427 ) ( not ( = ?auto_26421 ?auto_26425 ) ) ( AVAILABLE ?auto_26425 ) ( SURFACE-AT ?auto_26415 ?auto_26427 ) ( ON ?auto_26415 ?auto_26419 ) ( CLEAR ?auto_26415 ) ( not ( = ?auto_26415 ?auto_26419 ) ) ( not ( = ?auto_26416 ?auto_26419 ) ) ( IS-CRATE ?auto_26416 ) ( not ( = ?auto_26415 ?auto_26418 ) ) ( not ( = ?auto_26416 ?auto_26418 ) ) ( not ( = ?auto_26419 ?auto_26418 ) ) ( not ( = ?auto_26420 ?auto_26431 ) ) ( not ( = ?auto_26427 ?auto_26420 ) ) ( HOIST-AT ?auto_26422 ?auto_26420 ) ( not ( = ?auto_26421 ?auto_26422 ) ) ( not ( = ?auto_26425 ?auto_26422 ) ) ( AVAILABLE ?auto_26422 ) ( SURFACE-AT ?auto_26416 ?auto_26420 ) ( ON ?auto_26416 ?auto_26429 ) ( CLEAR ?auto_26416 ) ( not ( = ?auto_26415 ?auto_26429 ) ) ( not ( = ?auto_26416 ?auto_26429 ) ) ( not ( = ?auto_26419 ?auto_26429 ) ) ( not ( = ?auto_26418 ?auto_26429 ) ) ( IS-CRATE ?auto_26418 ) ( not ( = ?auto_26415 ?auto_26424 ) ) ( not ( = ?auto_26416 ?auto_26424 ) ) ( not ( = ?auto_26419 ?auto_26424 ) ) ( not ( = ?auto_26418 ?auto_26424 ) ) ( not ( = ?auto_26429 ?auto_26424 ) ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( not ( = ?auto_26427 ?auto_26430 ) ) ( not ( = ?auto_26420 ?auto_26430 ) ) ( HOIST-AT ?auto_26428 ?auto_26430 ) ( not ( = ?auto_26421 ?auto_26428 ) ) ( not ( = ?auto_26425 ?auto_26428 ) ) ( not ( = ?auto_26422 ?auto_26428 ) ) ( AVAILABLE ?auto_26428 ) ( SURFACE-AT ?auto_26418 ?auto_26430 ) ( ON ?auto_26418 ?auto_26426 ) ( CLEAR ?auto_26418 ) ( not ( = ?auto_26415 ?auto_26426 ) ) ( not ( = ?auto_26416 ?auto_26426 ) ) ( not ( = ?auto_26419 ?auto_26426 ) ) ( not ( = ?auto_26418 ?auto_26426 ) ) ( not ( = ?auto_26429 ?auto_26426 ) ) ( not ( = ?auto_26424 ?auto_26426 ) ) ( TRUCK-AT ?auto_26417 ?auto_26431 ) ( SURFACE-AT ?auto_26423 ?auto_26431 ) ( CLEAR ?auto_26423 ) ( IS-CRATE ?auto_26424 ) ( not ( = ?auto_26415 ?auto_26423 ) ) ( not ( = ?auto_26416 ?auto_26423 ) ) ( not ( = ?auto_26419 ?auto_26423 ) ) ( not ( = ?auto_26418 ?auto_26423 ) ) ( not ( = ?auto_26429 ?auto_26423 ) ) ( not ( = ?auto_26424 ?auto_26423 ) ) ( not ( = ?auto_26426 ?auto_26423 ) ) ( AVAILABLE ?auto_26421 ) ( IN ?auto_26424 ?auto_26417 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26421 ?auto_26424 ?auto_26417 ?auto_26431 )
      ( MAKE-ON ?auto_26415 ?auto_26416 )
      ( MAKE-ON-VERIFY ?auto_26415 ?auto_26416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26432 - SURFACE
      ?auto_26433 - SURFACE
    )
    :vars
    (
      ?auto_26440 - HOIST
      ?auto_26443 - PLACE
      ?auto_26448 - PLACE
      ?auto_26439 - HOIST
      ?auto_26435 - SURFACE
      ?auto_26441 - SURFACE
      ?auto_26434 - PLACE
      ?auto_26436 - HOIST
      ?auto_26446 - SURFACE
      ?auto_26445 - SURFACE
      ?auto_26444 - PLACE
      ?auto_26447 - HOIST
      ?auto_26437 - SURFACE
      ?auto_26438 - SURFACE
      ?auto_26442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26440 ?auto_26443 ) ( IS-CRATE ?auto_26432 ) ( not ( = ?auto_26432 ?auto_26433 ) ) ( not ( = ?auto_26448 ?auto_26443 ) ) ( HOIST-AT ?auto_26439 ?auto_26448 ) ( not ( = ?auto_26440 ?auto_26439 ) ) ( AVAILABLE ?auto_26439 ) ( SURFACE-AT ?auto_26432 ?auto_26448 ) ( ON ?auto_26432 ?auto_26435 ) ( CLEAR ?auto_26432 ) ( not ( = ?auto_26432 ?auto_26435 ) ) ( not ( = ?auto_26433 ?auto_26435 ) ) ( IS-CRATE ?auto_26433 ) ( not ( = ?auto_26432 ?auto_26441 ) ) ( not ( = ?auto_26433 ?auto_26441 ) ) ( not ( = ?auto_26435 ?auto_26441 ) ) ( not ( = ?auto_26434 ?auto_26443 ) ) ( not ( = ?auto_26448 ?auto_26434 ) ) ( HOIST-AT ?auto_26436 ?auto_26434 ) ( not ( = ?auto_26440 ?auto_26436 ) ) ( not ( = ?auto_26439 ?auto_26436 ) ) ( AVAILABLE ?auto_26436 ) ( SURFACE-AT ?auto_26433 ?auto_26434 ) ( ON ?auto_26433 ?auto_26446 ) ( CLEAR ?auto_26433 ) ( not ( = ?auto_26432 ?auto_26446 ) ) ( not ( = ?auto_26433 ?auto_26446 ) ) ( not ( = ?auto_26435 ?auto_26446 ) ) ( not ( = ?auto_26441 ?auto_26446 ) ) ( IS-CRATE ?auto_26441 ) ( not ( = ?auto_26432 ?auto_26445 ) ) ( not ( = ?auto_26433 ?auto_26445 ) ) ( not ( = ?auto_26435 ?auto_26445 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26446 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26443 ) ) ( not ( = ?auto_26448 ?auto_26444 ) ) ( not ( = ?auto_26434 ?auto_26444 ) ) ( HOIST-AT ?auto_26447 ?auto_26444 ) ( not ( = ?auto_26440 ?auto_26447 ) ) ( not ( = ?auto_26439 ?auto_26447 ) ) ( not ( = ?auto_26436 ?auto_26447 ) ) ( AVAILABLE ?auto_26447 ) ( SURFACE-AT ?auto_26441 ?auto_26444 ) ( ON ?auto_26441 ?auto_26437 ) ( CLEAR ?auto_26441 ) ( not ( = ?auto_26432 ?auto_26437 ) ) ( not ( = ?auto_26433 ?auto_26437 ) ) ( not ( = ?auto_26435 ?auto_26437 ) ) ( not ( = ?auto_26441 ?auto_26437 ) ) ( not ( = ?auto_26446 ?auto_26437 ) ) ( not ( = ?auto_26445 ?auto_26437 ) ) ( SURFACE-AT ?auto_26438 ?auto_26443 ) ( CLEAR ?auto_26438 ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26432 ?auto_26438 ) ) ( not ( = ?auto_26433 ?auto_26438 ) ) ( not ( = ?auto_26435 ?auto_26438 ) ) ( not ( = ?auto_26441 ?auto_26438 ) ) ( not ( = ?auto_26446 ?auto_26438 ) ) ( not ( = ?auto_26445 ?auto_26438 ) ) ( not ( = ?auto_26437 ?auto_26438 ) ) ( AVAILABLE ?auto_26440 ) ( IN ?auto_26445 ?auto_26442 ) ( TRUCK-AT ?auto_26442 ?auto_26444 ) )
    :subtasks
    ( ( !DRIVE ?auto_26442 ?auto_26444 ?auto_26443 )
      ( MAKE-ON ?auto_26432 ?auto_26433 )
      ( MAKE-ON-VERIFY ?auto_26432 ?auto_26433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26449 - SURFACE
      ?auto_26450 - SURFACE
    )
    :vars
    (
      ?auto_26462 - HOIST
      ?auto_26463 - PLACE
      ?auto_26454 - PLACE
      ?auto_26452 - HOIST
      ?auto_26459 - SURFACE
      ?auto_26456 - SURFACE
      ?auto_26458 - PLACE
      ?auto_26451 - HOIST
      ?auto_26455 - SURFACE
      ?auto_26465 - SURFACE
      ?auto_26460 - PLACE
      ?auto_26453 - HOIST
      ?auto_26461 - SURFACE
      ?auto_26464 - SURFACE
      ?auto_26457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26462 ?auto_26463 ) ( IS-CRATE ?auto_26449 ) ( not ( = ?auto_26449 ?auto_26450 ) ) ( not ( = ?auto_26454 ?auto_26463 ) ) ( HOIST-AT ?auto_26452 ?auto_26454 ) ( not ( = ?auto_26462 ?auto_26452 ) ) ( AVAILABLE ?auto_26452 ) ( SURFACE-AT ?auto_26449 ?auto_26454 ) ( ON ?auto_26449 ?auto_26459 ) ( CLEAR ?auto_26449 ) ( not ( = ?auto_26449 ?auto_26459 ) ) ( not ( = ?auto_26450 ?auto_26459 ) ) ( IS-CRATE ?auto_26450 ) ( not ( = ?auto_26449 ?auto_26456 ) ) ( not ( = ?auto_26450 ?auto_26456 ) ) ( not ( = ?auto_26459 ?auto_26456 ) ) ( not ( = ?auto_26458 ?auto_26463 ) ) ( not ( = ?auto_26454 ?auto_26458 ) ) ( HOIST-AT ?auto_26451 ?auto_26458 ) ( not ( = ?auto_26462 ?auto_26451 ) ) ( not ( = ?auto_26452 ?auto_26451 ) ) ( AVAILABLE ?auto_26451 ) ( SURFACE-AT ?auto_26450 ?auto_26458 ) ( ON ?auto_26450 ?auto_26455 ) ( CLEAR ?auto_26450 ) ( not ( = ?auto_26449 ?auto_26455 ) ) ( not ( = ?auto_26450 ?auto_26455 ) ) ( not ( = ?auto_26459 ?auto_26455 ) ) ( not ( = ?auto_26456 ?auto_26455 ) ) ( IS-CRATE ?auto_26456 ) ( not ( = ?auto_26449 ?auto_26465 ) ) ( not ( = ?auto_26450 ?auto_26465 ) ) ( not ( = ?auto_26459 ?auto_26465 ) ) ( not ( = ?auto_26456 ?auto_26465 ) ) ( not ( = ?auto_26455 ?auto_26465 ) ) ( not ( = ?auto_26460 ?auto_26463 ) ) ( not ( = ?auto_26454 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( HOIST-AT ?auto_26453 ?auto_26460 ) ( not ( = ?auto_26462 ?auto_26453 ) ) ( not ( = ?auto_26452 ?auto_26453 ) ) ( not ( = ?auto_26451 ?auto_26453 ) ) ( SURFACE-AT ?auto_26456 ?auto_26460 ) ( ON ?auto_26456 ?auto_26461 ) ( CLEAR ?auto_26456 ) ( not ( = ?auto_26449 ?auto_26461 ) ) ( not ( = ?auto_26450 ?auto_26461 ) ) ( not ( = ?auto_26459 ?auto_26461 ) ) ( not ( = ?auto_26456 ?auto_26461 ) ) ( not ( = ?auto_26455 ?auto_26461 ) ) ( not ( = ?auto_26465 ?auto_26461 ) ) ( SURFACE-AT ?auto_26464 ?auto_26463 ) ( CLEAR ?auto_26464 ) ( IS-CRATE ?auto_26465 ) ( not ( = ?auto_26449 ?auto_26464 ) ) ( not ( = ?auto_26450 ?auto_26464 ) ) ( not ( = ?auto_26459 ?auto_26464 ) ) ( not ( = ?auto_26456 ?auto_26464 ) ) ( not ( = ?auto_26455 ?auto_26464 ) ) ( not ( = ?auto_26465 ?auto_26464 ) ) ( not ( = ?auto_26461 ?auto_26464 ) ) ( AVAILABLE ?auto_26462 ) ( TRUCK-AT ?auto_26457 ?auto_26460 ) ( LIFTING ?auto_26453 ?auto_26465 ) )
    :subtasks
    ( ( !LOAD ?auto_26453 ?auto_26465 ?auto_26457 ?auto_26460 )
      ( MAKE-ON ?auto_26449 ?auto_26450 )
      ( MAKE-ON-VERIFY ?auto_26449 ?auto_26450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26466 - SURFACE
      ?auto_26467 - SURFACE
    )
    :vars
    (
      ?auto_26475 - HOIST
      ?auto_26479 - PLACE
      ?auto_26470 - PLACE
      ?auto_26478 - HOIST
      ?auto_26477 - SURFACE
      ?auto_26469 - SURFACE
      ?auto_26480 - PLACE
      ?auto_26482 - HOIST
      ?auto_26472 - SURFACE
      ?auto_26468 - SURFACE
      ?auto_26474 - PLACE
      ?auto_26476 - HOIST
      ?auto_26473 - SURFACE
      ?auto_26481 - SURFACE
      ?auto_26471 - TRUCK
      ?auto_26483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26475 ?auto_26479 ) ( IS-CRATE ?auto_26466 ) ( not ( = ?auto_26466 ?auto_26467 ) ) ( not ( = ?auto_26470 ?auto_26479 ) ) ( HOIST-AT ?auto_26478 ?auto_26470 ) ( not ( = ?auto_26475 ?auto_26478 ) ) ( AVAILABLE ?auto_26478 ) ( SURFACE-AT ?auto_26466 ?auto_26470 ) ( ON ?auto_26466 ?auto_26477 ) ( CLEAR ?auto_26466 ) ( not ( = ?auto_26466 ?auto_26477 ) ) ( not ( = ?auto_26467 ?auto_26477 ) ) ( IS-CRATE ?auto_26467 ) ( not ( = ?auto_26466 ?auto_26469 ) ) ( not ( = ?auto_26467 ?auto_26469 ) ) ( not ( = ?auto_26477 ?auto_26469 ) ) ( not ( = ?auto_26480 ?auto_26479 ) ) ( not ( = ?auto_26470 ?auto_26480 ) ) ( HOIST-AT ?auto_26482 ?auto_26480 ) ( not ( = ?auto_26475 ?auto_26482 ) ) ( not ( = ?auto_26478 ?auto_26482 ) ) ( AVAILABLE ?auto_26482 ) ( SURFACE-AT ?auto_26467 ?auto_26480 ) ( ON ?auto_26467 ?auto_26472 ) ( CLEAR ?auto_26467 ) ( not ( = ?auto_26466 ?auto_26472 ) ) ( not ( = ?auto_26467 ?auto_26472 ) ) ( not ( = ?auto_26477 ?auto_26472 ) ) ( not ( = ?auto_26469 ?auto_26472 ) ) ( IS-CRATE ?auto_26469 ) ( not ( = ?auto_26466 ?auto_26468 ) ) ( not ( = ?auto_26467 ?auto_26468 ) ) ( not ( = ?auto_26477 ?auto_26468 ) ) ( not ( = ?auto_26469 ?auto_26468 ) ) ( not ( = ?auto_26472 ?auto_26468 ) ) ( not ( = ?auto_26474 ?auto_26479 ) ) ( not ( = ?auto_26470 ?auto_26474 ) ) ( not ( = ?auto_26480 ?auto_26474 ) ) ( HOIST-AT ?auto_26476 ?auto_26474 ) ( not ( = ?auto_26475 ?auto_26476 ) ) ( not ( = ?auto_26478 ?auto_26476 ) ) ( not ( = ?auto_26482 ?auto_26476 ) ) ( SURFACE-AT ?auto_26469 ?auto_26474 ) ( ON ?auto_26469 ?auto_26473 ) ( CLEAR ?auto_26469 ) ( not ( = ?auto_26466 ?auto_26473 ) ) ( not ( = ?auto_26467 ?auto_26473 ) ) ( not ( = ?auto_26477 ?auto_26473 ) ) ( not ( = ?auto_26469 ?auto_26473 ) ) ( not ( = ?auto_26472 ?auto_26473 ) ) ( not ( = ?auto_26468 ?auto_26473 ) ) ( SURFACE-AT ?auto_26481 ?auto_26479 ) ( CLEAR ?auto_26481 ) ( IS-CRATE ?auto_26468 ) ( not ( = ?auto_26466 ?auto_26481 ) ) ( not ( = ?auto_26467 ?auto_26481 ) ) ( not ( = ?auto_26477 ?auto_26481 ) ) ( not ( = ?auto_26469 ?auto_26481 ) ) ( not ( = ?auto_26472 ?auto_26481 ) ) ( not ( = ?auto_26468 ?auto_26481 ) ) ( not ( = ?auto_26473 ?auto_26481 ) ) ( AVAILABLE ?auto_26475 ) ( TRUCK-AT ?auto_26471 ?auto_26474 ) ( AVAILABLE ?auto_26476 ) ( SURFACE-AT ?auto_26468 ?auto_26474 ) ( ON ?auto_26468 ?auto_26483 ) ( CLEAR ?auto_26468 ) ( not ( = ?auto_26466 ?auto_26483 ) ) ( not ( = ?auto_26467 ?auto_26483 ) ) ( not ( = ?auto_26477 ?auto_26483 ) ) ( not ( = ?auto_26469 ?auto_26483 ) ) ( not ( = ?auto_26472 ?auto_26483 ) ) ( not ( = ?auto_26468 ?auto_26483 ) ) ( not ( = ?auto_26473 ?auto_26483 ) ) ( not ( = ?auto_26481 ?auto_26483 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26476 ?auto_26468 ?auto_26483 ?auto_26474 )
      ( MAKE-ON ?auto_26466 ?auto_26467 )
      ( MAKE-ON-VERIFY ?auto_26466 ?auto_26467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26484 - SURFACE
      ?auto_26485 - SURFACE
    )
    :vars
    (
      ?auto_26497 - HOIST
      ?auto_26488 - PLACE
      ?auto_26498 - PLACE
      ?auto_26489 - HOIST
      ?auto_26494 - SURFACE
      ?auto_26499 - SURFACE
      ?auto_26487 - PLACE
      ?auto_26491 - HOIST
      ?auto_26492 - SURFACE
      ?auto_26500 - SURFACE
      ?auto_26486 - PLACE
      ?auto_26495 - HOIST
      ?auto_26501 - SURFACE
      ?auto_26496 - SURFACE
      ?auto_26490 - SURFACE
      ?auto_26493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26497 ?auto_26488 ) ( IS-CRATE ?auto_26484 ) ( not ( = ?auto_26484 ?auto_26485 ) ) ( not ( = ?auto_26498 ?auto_26488 ) ) ( HOIST-AT ?auto_26489 ?auto_26498 ) ( not ( = ?auto_26497 ?auto_26489 ) ) ( AVAILABLE ?auto_26489 ) ( SURFACE-AT ?auto_26484 ?auto_26498 ) ( ON ?auto_26484 ?auto_26494 ) ( CLEAR ?auto_26484 ) ( not ( = ?auto_26484 ?auto_26494 ) ) ( not ( = ?auto_26485 ?auto_26494 ) ) ( IS-CRATE ?auto_26485 ) ( not ( = ?auto_26484 ?auto_26499 ) ) ( not ( = ?auto_26485 ?auto_26499 ) ) ( not ( = ?auto_26494 ?auto_26499 ) ) ( not ( = ?auto_26487 ?auto_26488 ) ) ( not ( = ?auto_26498 ?auto_26487 ) ) ( HOIST-AT ?auto_26491 ?auto_26487 ) ( not ( = ?auto_26497 ?auto_26491 ) ) ( not ( = ?auto_26489 ?auto_26491 ) ) ( AVAILABLE ?auto_26491 ) ( SURFACE-AT ?auto_26485 ?auto_26487 ) ( ON ?auto_26485 ?auto_26492 ) ( CLEAR ?auto_26485 ) ( not ( = ?auto_26484 ?auto_26492 ) ) ( not ( = ?auto_26485 ?auto_26492 ) ) ( not ( = ?auto_26494 ?auto_26492 ) ) ( not ( = ?auto_26499 ?auto_26492 ) ) ( IS-CRATE ?auto_26499 ) ( not ( = ?auto_26484 ?auto_26500 ) ) ( not ( = ?auto_26485 ?auto_26500 ) ) ( not ( = ?auto_26494 ?auto_26500 ) ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26492 ?auto_26500 ) ) ( not ( = ?auto_26486 ?auto_26488 ) ) ( not ( = ?auto_26498 ?auto_26486 ) ) ( not ( = ?auto_26487 ?auto_26486 ) ) ( HOIST-AT ?auto_26495 ?auto_26486 ) ( not ( = ?auto_26497 ?auto_26495 ) ) ( not ( = ?auto_26489 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( SURFACE-AT ?auto_26499 ?auto_26486 ) ( ON ?auto_26499 ?auto_26501 ) ( CLEAR ?auto_26499 ) ( not ( = ?auto_26484 ?auto_26501 ) ) ( not ( = ?auto_26485 ?auto_26501 ) ) ( not ( = ?auto_26494 ?auto_26501 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( not ( = ?auto_26492 ?auto_26501 ) ) ( not ( = ?auto_26500 ?auto_26501 ) ) ( SURFACE-AT ?auto_26496 ?auto_26488 ) ( CLEAR ?auto_26496 ) ( IS-CRATE ?auto_26500 ) ( not ( = ?auto_26484 ?auto_26496 ) ) ( not ( = ?auto_26485 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( not ( = ?auto_26499 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( not ( = ?auto_26500 ?auto_26496 ) ) ( not ( = ?auto_26501 ?auto_26496 ) ) ( AVAILABLE ?auto_26497 ) ( AVAILABLE ?auto_26495 ) ( SURFACE-AT ?auto_26500 ?auto_26486 ) ( ON ?auto_26500 ?auto_26490 ) ( CLEAR ?auto_26500 ) ( not ( = ?auto_26484 ?auto_26490 ) ) ( not ( = ?auto_26485 ?auto_26490 ) ) ( not ( = ?auto_26494 ?auto_26490 ) ) ( not ( = ?auto_26499 ?auto_26490 ) ) ( not ( = ?auto_26492 ?auto_26490 ) ) ( not ( = ?auto_26500 ?auto_26490 ) ) ( not ( = ?auto_26501 ?auto_26490 ) ) ( not ( = ?auto_26496 ?auto_26490 ) ) ( TRUCK-AT ?auto_26493 ?auto_26488 ) )
    :subtasks
    ( ( !DRIVE ?auto_26493 ?auto_26488 ?auto_26486 )
      ( MAKE-ON ?auto_26484 ?auto_26485 )
      ( MAKE-ON-VERIFY ?auto_26484 ?auto_26485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26502 - SURFACE
      ?auto_26503 - SURFACE
    )
    :vars
    (
      ?auto_26518 - HOIST
      ?auto_26507 - PLACE
      ?auto_26513 - PLACE
      ?auto_26506 - HOIST
      ?auto_26512 - SURFACE
      ?auto_26508 - SURFACE
      ?auto_26514 - PLACE
      ?auto_26509 - HOIST
      ?auto_26511 - SURFACE
      ?auto_26516 - SURFACE
      ?auto_26510 - PLACE
      ?auto_26515 - HOIST
      ?auto_26517 - SURFACE
      ?auto_26505 - SURFACE
      ?auto_26504 - SURFACE
      ?auto_26519 - TRUCK
      ?auto_26520 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26518 ?auto_26507 ) ( IS-CRATE ?auto_26502 ) ( not ( = ?auto_26502 ?auto_26503 ) ) ( not ( = ?auto_26513 ?auto_26507 ) ) ( HOIST-AT ?auto_26506 ?auto_26513 ) ( not ( = ?auto_26518 ?auto_26506 ) ) ( AVAILABLE ?auto_26506 ) ( SURFACE-AT ?auto_26502 ?auto_26513 ) ( ON ?auto_26502 ?auto_26512 ) ( CLEAR ?auto_26502 ) ( not ( = ?auto_26502 ?auto_26512 ) ) ( not ( = ?auto_26503 ?auto_26512 ) ) ( IS-CRATE ?auto_26503 ) ( not ( = ?auto_26502 ?auto_26508 ) ) ( not ( = ?auto_26503 ?auto_26508 ) ) ( not ( = ?auto_26512 ?auto_26508 ) ) ( not ( = ?auto_26514 ?auto_26507 ) ) ( not ( = ?auto_26513 ?auto_26514 ) ) ( HOIST-AT ?auto_26509 ?auto_26514 ) ( not ( = ?auto_26518 ?auto_26509 ) ) ( not ( = ?auto_26506 ?auto_26509 ) ) ( AVAILABLE ?auto_26509 ) ( SURFACE-AT ?auto_26503 ?auto_26514 ) ( ON ?auto_26503 ?auto_26511 ) ( CLEAR ?auto_26503 ) ( not ( = ?auto_26502 ?auto_26511 ) ) ( not ( = ?auto_26503 ?auto_26511 ) ) ( not ( = ?auto_26512 ?auto_26511 ) ) ( not ( = ?auto_26508 ?auto_26511 ) ) ( IS-CRATE ?auto_26508 ) ( not ( = ?auto_26502 ?auto_26516 ) ) ( not ( = ?auto_26503 ?auto_26516 ) ) ( not ( = ?auto_26512 ?auto_26516 ) ) ( not ( = ?auto_26508 ?auto_26516 ) ) ( not ( = ?auto_26511 ?auto_26516 ) ) ( not ( = ?auto_26510 ?auto_26507 ) ) ( not ( = ?auto_26513 ?auto_26510 ) ) ( not ( = ?auto_26514 ?auto_26510 ) ) ( HOIST-AT ?auto_26515 ?auto_26510 ) ( not ( = ?auto_26518 ?auto_26515 ) ) ( not ( = ?auto_26506 ?auto_26515 ) ) ( not ( = ?auto_26509 ?auto_26515 ) ) ( SURFACE-AT ?auto_26508 ?auto_26510 ) ( ON ?auto_26508 ?auto_26517 ) ( CLEAR ?auto_26508 ) ( not ( = ?auto_26502 ?auto_26517 ) ) ( not ( = ?auto_26503 ?auto_26517 ) ) ( not ( = ?auto_26512 ?auto_26517 ) ) ( not ( = ?auto_26508 ?auto_26517 ) ) ( not ( = ?auto_26511 ?auto_26517 ) ) ( not ( = ?auto_26516 ?auto_26517 ) ) ( IS-CRATE ?auto_26516 ) ( not ( = ?auto_26502 ?auto_26505 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( not ( = ?auto_26512 ?auto_26505 ) ) ( not ( = ?auto_26508 ?auto_26505 ) ) ( not ( = ?auto_26511 ?auto_26505 ) ) ( not ( = ?auto_26516 ?auto_26505 ) ) ( not ( = ?auto_26517 ?auto_26505 ) ) ( AVAILABLE ?auto_26515 ) ( SURFACE-AT ?auto_26516 ?auto_26510 ) ( ON ?auto_26516 ?auto_26504 ) ( CLEAR ?auto_26516 ) ( not ( = ?auto_26502 ?auto_26504 ) ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( not ( = ?auto_26512 ?auto_26504 ) ) ( not ( = ?auto_26508 ?auto_26504 ) ) ( not ( = ?auto_26511 ?auto_26504 ) ) ( not ( = ?auto_26516 ?auto_26504 ) ) ( not ( = ?auto_26517 ?auto_26504 ) ) ( not ( = ?auto_26505 ?auto_26504 ) ) ( TRUCK-AT ?auto_26519 ?auto_26507 ) ( SURFACE-AT ?auto_26520 ?auto_26507 ) ( CLEAR ?auto_26520 ) ( LIFTING ?auto_26518 ?auto_26505 ) ( IS-CRATE ?auto_26505 ) ( not ( = ?auto_26502 ?auto_26520 ) ) ( not ( = ?auto_26503 ?auto_26520 ) ) ( not ( = ?auto_26512 ?auto_26520 ) ) ( not ( = ?auto_26508 ?auto_26520 ) ) ( not ( = ?auto_26511 ?auto_26520 ) ) ( not ( = ?auto_26516 ?auto_26520 ) ) ( not ( = ?auto_26517 ?auto_26520 ) ) ( not ( = ?auto_26505 ?auto_26520 ) ) ( not ( = ?auto_26504 ?auto_26520 ) ) )
    :subtasks
    ( ( !DROP ?auto_26518 ?auto_26505 ?auto_26520 ?auto_26507 )
      ( MAKE-ON ?auto_26502 ?auto_26503 )
      ( MAKE-ON-VERIFY ?auto_26502 ?auto_26503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26521 - SURFACE
      ?auto_26522 - SURFACE
    )
    :vars
    (
      ?auto_26527 - HOIST
      ?auto_26537 - PLACE
      ?auto_26526 - PLACE
      ?auto_26536 - HOIST
      ?auto_26532 - SURFACE
      ?auto_26538 - SURFACE
      ?auto_26534 - PLACE
      ?auto_26533 - HOIST
      ?auto_26528 - SURFACE
      ?auto_26525 - SURFACE
      ?auto_26523 - PLACE
      ?auto_26529 - HOIST
      ?auto_26535 - SURFACE
      ?auto_26524 - SURFACE
      ?auto_26531 - SURFACE
      ?auto_26539 - TRUCK
      ?auto_26530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26527 ?auto_26537 ) ( IS-CRATE ?auto_26521 ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( not ( = ?auto_26526 ?auto_26537 ) ) ( HOIST-AT ?auto_26536 ?auto_26526 ) ( not ( = ?auto_26527 ?auto_26536 ) ) ( AVAILABLE ?auto_26536 ) ( SURFACE-AT ?auto_26521 ?auto_26526 ) ( ON ?auto_26521 ?auto_26532 ) ( CLEAR ?auto_26521 ) ( not ( = ?auto_26521 ?auto_26532 ) ) ( not ( = ?auto_26522 ?auto_26532 ) ) ( IS-CRATE ?auto_26522 ) ( not ( = ?auto_26521 ?auto_26538 ) ) ( not ( = ?auto_26522 ?auto_26538 ) ) ( not ( = ?auto_26532 ?auto_26538 ) ) ( not ( = ?auto_26534 ?auto_26537 ) ) ( not ( = ?auto_26526 ?auto_26534 ) ) ( HOIST-AT ?auto_26533 ?auto_26534 ) ( not ( = ?auto_26527 ?auto_26533 ) ) ( not ( = ?auto_26536 ?auto_26533 ) ) ( AVAILABLE ?auto_26533 ) ( SURFACE-AT ?auto_26522 ?auto_26534 ) ( ON ?auto_26522 ?auto_26528 ) ( CLEAR ?auto_26522 ) ( not ( = ?auto_26521 ?auto_26528 ) ) ( not ( = ?auto_26522 ?auto_26528 ) ) ( not ( = ?auto_26532 ?auto_26528 ) ) ( not ( = ?auto_26538 ?auto_26528 ) ) ( IS-CRATE ?auto_26538 ) ( not ( = ?auto_26521 ?auto_26525 ) ) ( not ( = ?auto_26522 ?auto_26525 ) ) ( not ( = ?auto_26532 ?auto_26525 ) ) ( not ( = ?auto_26538 ?auto_26525 ) ) ( not ( = ?auto_26528 ?auto_26525 ) ) ( not ( = ?auto_26523 ?auto_26537 ) ) ( not ( = ?auto_26526 ?auto_26523 ) ) ( not ( = ?auto_26534 ?auto_26523 ) ) ( HOIST-AT ?auto_26529 ?auto_26523 ) ( not ( = ?auto_26527 ?auto_26529 ) ) ( not ( = ?auto_26536 ?auto_26529 ) ) ( not ( = ?auto_26533 ?auto_26529 ) ) ( SURFACE-AT ?auto_26538 ?auto_26523 ) ( ON ?auto_26538 ?auto_26535 ) ( CLEAR ?auto_26538 ) ( not ( = ?auto_26521 ?auto_26535 ) ) ( not ( = ?auto_26522 ?auto_26535 ) ) ( not ( = ?auto_26532 ?auto_26535 ) ) ( not ( = ?auto_26538 ?auto_26535 ) ) ( not ( = ?auto_26528 ?auto_26535 ) ) ( not ( = ?auto_26525 ?auto_26535 ) ) ( IS-CRATE ?auto_26525 ) ( not ( = ?auto_26521 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26532 ?auto_26524 ) ) ( not ( = ?auto_26538 ?auto_26524 ) ) ( not ( = ?auto_26528 ?auto_26524 ) ) ( not ( = ?auto_26525 ?auto_26524 ) ) ( not ( = ?auto_26535 ?auto_26524 ) ) ( AVAILABLE ?auto_26529 ) ( SURFACE-AT ?auto_26525 ?auto_26523 ) ( ON ?auto_26525 ?auto_26531 ) ( CLEAR ?auto_26525 ) ( not ( = ?auto_26521 ?auto_26531 ) ) ( not ( = ?auto_26522 ?auto_26531 ) ) ( not ( = ?auto_26532 ?auto_26531 ) ) ( not ( = ?auto_26538 ?auto_26531 ) ) ( not ( = ?auto_26528 ?auto_26531 ) ) ( not ( = ?auto_26525 ?auto_26531 ) ) ( not ( = ?auto_26535 ?auto_26531 ) ) ( not ( = ?auto_26524 ?auto_26531 ) ) ( TRUCK-AT ?auto_26539 ?auto_26537 ) ( SURFACE-AT ?auto_26530 ?auto_26537 ) ( CLEAR ?auto_26530 ) ( IS-CRATE ?auto_26524 ) ( not ( = ?auto_26521 ?auto_26530 ) ) ( not ( = ?auto_26522 ?auto_26530 ) ) ( not ( = ?auto_26532 ?auto_26530 ) ) ( not ( = ?auto_26538 ?auto_26530 ) ) ( not ( = ?auto_26528 ?auto_26530 ) ) ( not ( = ?auto_26525 ?auto_26530 ) ) ( not ( = ?auto_26535 ?auto_26530 ) ) ( not ( = ?auto_26524 ?auto_26530 ) ) ( not ( = ?auto_26531 ?auto_26530 ) ) ( AVAILABLE ?auto_26527 ) ( IN ?auto_26524 ?auto_26539 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26527 ?auto_26524 ?auto_26539 ?auto_26537 )
      ( MAKE-ON ?auto_26521 ?auto_26522 )
      ( MAKE-ON-VERIFY ?auto_26521 ?auto_26522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26540 - SURFACE
      ?auto_26541 - SURFACE
    )
    :vars
    (
      ?auto_26545 - HOIST
      ?auto_26553 - PLACE
      ?auto_26547 - PLACE
      ?auto_26557 - HOIST
      ?auto_26556 - SURFACE
      ?auto_26543 - SURFACE
      ?auto_26550 - PLACE
      ?auto_26554 - HOIST
      ?auto_26555 - SURFACE
      ?auto_26551 - SURFACE
      ?auto_26552 - PLACE
      ?auto_26548 - HOIST
      ?auto_26542 - SURFACE
      ?auto_26558 - SURFACE
      ?auto_26549 - SURFACE
      ?auto_26546 - SURFACE
      ?auto_26544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26545 ?auto_26553 ) ( IS-CRATE ?auto_26540 ) ( not ( = ?auto_26540 ?auto_26541 ) ) ( not ( = ?auto_26547 ?auto_26553 ) ) ( HOIST-AT ?auto_26557 ?auto_26547 ) ( not ( = ?auto_26545 ?auto_26557 ) ) ( AVAILABLE ?auto_26557 ) ( SURFACE-AT ?auto_26540 ?auto_26547 ) ( ON ?auto_26540 ?auto_26556 ) ( CLEAR ?auto_26540 ) ( not ( = ?auto_26540 ?auto_26556 ) ) ( not ( = ?auto_26541 ?auto_26556 ) ) ( IS-CRATE ?auto_26541 ) ( not ( = ?auto_26540 ?auto_26543 ) ) ( not ( = ?auto_26541 ?auto_26543 ) ) ( not ( = ?auto_26556 ?auto_26543 ) ) ( not ( = ?auto_26550 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26550 ) ) ( HOIST-AT ?auto_26554 ?auto_26550 ) ( not ( = ?auto_26545 ?auto_26554 ) ) ( not ( = ?auto_26557 ?auto_26554 ) ) ( AVAILABLE ?auto_26554 ) ( SURFACE-AT ?auto_26541 ?auto_26550 ) ( ON ?auto_26541 ?auto_26555 ) ( CLEAR ?auto_26541 ) ( not ( = ?auto_26540 ?auto_26555 ) ) ( not ( = ?auto_26541 ?auto_26555 ) ) ( not ( = ?auto_26556 ?auto_26555 ) ) ( not ( = ?auto_26543 ?auto_26555 ) ) ( IS-CRATE ?auto_26543 ) ( not ( = ?auto_26540 ?auto_26551 ) ) ( not ( = ?auto_26541 ?auto_26551 ) ) ( not ( = ?auto_26556 ?auto_26551 ) ) ( not ( = ?auto_26543 ?auto_26551 ) ) ( not ( = ?auto_26555 ?auto_26551 ) ) ( not ( = ?auto_26552 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( HOIST-AT ?auto_26548 ?auto_26552 ) ( not ( = ?auto_26545 ?auto_26548 ) ) ( not ( = ?auto_26557 ?auto_26548 ) ) ( not ( = ?auto_26554 ?auto_26548 ) ) ( SURFACE-AT ?auto_26543 ?auto_26552 ) ( ON ?auto_26543 ?auto_26542 ) ( CLEAR ?auto_26543 ) ( not ( = ?auto_26540 ?auto_26542 ) ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( not ( = ?auto_26556 ?auto_26542 ) ) ( not ( = ?auto_26543 ?auto_26542 ) ) ( not ( = ?auto_26555 ?auto_26542 ) ) ( not ( = ?auto_26551 ?auto_26542 ) ) ( IS-CRATE ?auto_26551 ) ( not ( = ?auto_26540 ?auto_26558 ) ) ( not ( = ?auto_26541 ?auto_26558 ) ) ( not ( = ?auto_26556 ?auto_26558 ) ) ( not ( = ?auto_26543 ?auto_26558 ) ) ( not ( = ?auto_26555 ?auto_26558 ) ) ( not ( = ?auto_26551 ?auto_26558 ) ) ( not ( = ?auto_26542 ?auto_26558 ) ) ( AVAILABLE ?auto_26548 ) ( SURFACE-AT ?auto_26551 ?auto_26552 ) ( ON ?auto_26551 ?auto_26549 ) ( CLEAR ?auto_26551 ) ( not ( = ?auto_26540 ?auto_26549 ) ) ( not ( = ?auto_26541 ?auto_26549 ) ) ( not ( = ?auto_26556 ?auto_26549 ) ) ( not ( = ?auto_26543 ?auto_26549 ) ) ( not ( = ?auto_26555 ?auto_26549 ) ) ( not ( = ?auto_26551 ?auto_26549 ) ) ( not ( = ?auto_26542 ?auto_26549 ) ) ( not ( = ?auto_26558 ?auto_26549 ) ) ( SURFACE-AT ?auto_26546 ?auto_26553 ) ( CLEAR ?auto_26546 ) ( IS-CRATE ?auto_26558 ) ( not ( = ?auto_26540 ?auto_26546 ) ) ( not ( = ?auto_26541 ?auto_26546 ) ) ( not ( = ?auto_26556 ?auto_26546 ) ) ( not ( = ?auto_26543 ?auto_26546 ) ) ( not ( = ?auto_26555 ?auto_26546 ) ) ( not ( = ?auto_26551 ?auto_26546 ) ) ( not ( = ?auto_26542 ?auto_26546 ) ) ( not ( = ?auto_26558 ?auto_26546 ) ) ( not ( = ?auto_26549 ?auto_26546 ) ) ( AVAILABLE ?auto_26545 ) ( IN ?auto_26558 ?auto_26544 ) ( TRUCK-AT ?auto_26544 ?auto_26547 ) )
    :subtasks
    ( ( !DRIVE ?auto_26544 ?auto_26547 ?auto_26553 )
      ( MAKE-ON ?auto_26540 ?auto_26541 )
      ( MAKE-ON-VERIFY ?auto_26540 ?auto_26541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26559 - SURFACE
      ?auto_26560 - SURFACE
    )
    :vars
    (
      ?auto_26577 - HOIST
      ?auto_26568 - PLACE
      ?auto_26576 - PLACE
      ?auto_26574 - HOIST
      ?auto_26565 - SURFACE
      ?auto_26561 - SURFACE
      ?auto_26563 - PLACE
      ?auto_26567 - HOIST
      ?auto_26562 - SURFACE
      ?auto_26569 - SURFACE
      ?auto_26571 - PLACE
      ?auto_26566 - HOIST
      ?auto_26573 - SURFACE
      ?auto_26572 - SURFACE
      ?auto_26575 - SURFACE
      ?auto_26570 - SURFACE
      ?auto_26564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26577 ?auto_26568 ) ( IS-CRATE ?auto_26559 ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26576 ?auto_26568 ) ) ( HOIST-AT ?auto_26574 ?auto_26576 ) ( not ( = ?auto_26577 ?auto_26574 ) ) ( SURFACE-AT ?auto_26559 ?auto_26576 ) ( ON ?auto_26559 ?auto_26565 ) ( CLEAR ?auto_26559 ) ( not ( = ?auto_26559 ?auto_26565 ) ) ( not ( = ?auto_26560 ?auto_26565 ) ) ( IS-CRATE ?auto_26560 ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26565 ?auto_26561 ) ) ( not ( = ?auto_26563 ?auto_26568 ) ) ( not ( = ?auto_26576 ?auto_26563 ) ) ( HOIST-AT ?auto_26567 ?auto_26563 ) ( not ( = ?auto_26577 ?auto_26567 ) ) ( not ( = ?auto_26574 ?auto_26567 ) ) ( AVAILABLE ?auto_26567 ) ( SURFACE-AT ?auto_26560 ?auto_26563 ) ( ON ?auto_26560 ?auto_26562 ) ( CLEAR ?auto_26560 ) ( not ( = ?auto_26559 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26565 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( IS-CRATE ?auto_26561 ) ( not ( = ?auto_26559 ?auto_26569 ) ) ( not ( = ?auto_26560 ?auto_26569 ) ) ( not ( = ?auto_26565 ?auto_26569 ) ) ( not ( = ?auto_26561 ?auto_26569 ) ) ( not ( = ?auto_26562 ?auto_26569 ) ) ( not ( = ?auto_26571 ?auto_26568 ) ) ( not ( = ?auto_26576 ?auto_26571 ) ) ( not ( = ?auto_26563 ?auto_26571 ) ) ( HOIST-AT ?auto_26566 ?auto_26571 ) ( not ( = ?auto_26577 ?auto_26566 ) ) ( not ( = ?auto_26574 ?auto_26566 ) ) ( not ( = ?auto_26567 ?auto_26566 ) ) ( SURFACE-AT ?auto_26561 ?auto_26571 ) ( ON ?auto_26561 ?auto_26573 ) ( CLEAR ?auto_26561 ) ( not ( = ?auto_26559 ?auto_26573 ) ) ( not ( = ?auto_26560 ?auto_26573 ) ) ( not ( = ?auto_26565 ?auto_26573 ) ) ( not ( = ?auto_26561 ?auto_26573 ) ) ( not ( = ?auto_26562 ?auto_26573 ) ) ( not ( = ?auto_26569 ?auto_26573 ) ) ( IS-CRATE ?auto_26569 ) ( not ( = ?auto_26559 ?auto_26572 ) ) ( not ( = ?auto_26560 ?auto_26572 ) ) ( not ( = ?auto_26565 ?auto_26572 ) ) ( not ( = ?auto_26561 ?auto_26572 ) ) ( not ( = ?auto_26562 ?auto_26572 ) ) ( not ( = ?auto_26569 ?auto_26572 ) ) ( not ( = ?auto_26573 ?auto_26572 ) ) ( AVAILABLE ?auto_26566 ) ( SURFACE-AT ?auto_26569 ?auto_26571 ) ( ON ?auto_26569 ?auto_26575 ) ( CLEAR ?auto_26569 ) ( not ( = ?auto_26559 ?auto_26575 ) ) ( not ( = ?auto_26560 ?auto_26575 ) ) ( not ( = ?auto_26565 ?auto_26575 ) ) ( not ( = ?auto_26561 ?auto_26575 ) ) ( not ( = ?auto_26562 ?auto_26575 ) ) ( not ( = ?auto_26569 ?auto_26575 ) ) ( not ( = ?auto_26573 ?auto_26575 ) ) ( not ( = ?auto_26572 ?auto_26575 ) ) ( SURFACE-AT ?auto_26570 ?auto_26568 ) ( CLEAR ?auto_26570 ) ( IS-CRATE ?auto_26572 ) ( not ( = ?auto_26559 ?auto_26570 ) ) ( not ( = ?auto_26560 ?auto_26570 ) ) ( not ( = ?auto_26565 ?auto_26570 ) ) ( not ( = ?auto_26561 ?auto_26570 ) ) ( not ( = ?auto_26562 ?auto_26570 ) ) ( not ( = ?auto_26569 ?auto_26570 ) ) ( not ( = ?auto_26573 ?auto_26570 ) ) ( not ( = ?auto_26572 ?auto_26570 ) ) ( not ( = ?auto_26575 ?auto_26570 ) ) ( AVAILABLE ?auto_26577 ) ( TRUCK-AT ?auto_26564 ?auto_26576 ) ( LIFTING ?auto_26574 ?auto_26572 ) )
    :subtasks
    ( ( !LOAD ?auto_26574 ?auto_26572 ?auto_26564 ?auto_26576 )
      ( MAKE-ON ?auto_26559 ?auto_26560 )
      ( MAKE-ON-VERIFY ?auto_26559 ?auto_26560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26578 - SURFACE
      ?auto_26579 - SURFACE
    )
    :vars
    (
      ?auto_26583 - HOIST
      ?auto_26582 - PLACE
      ?auto_26584 - PLACE
      ?auto_26596 - HOIST
      ?auto_26580 - SURFACE
      ?auto_26581 - SURFACE
      ?auto_26590 - PLACE
      ?auto_26586 - HOIST
      ?auto_26594 - SURFACE
      ?auto_26587 - SURFACE
      ?auto_26585 - PLACE
      ?auto_26595 - HOIST
      ?auto_26591 - SURFACE
      ?auto_26593 - SURFACE
      ?auto_26588 - SURFACE
      ?auto_26589 - SURFACE
      ?auto_26592 - TRUCK
      ?auto_26597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26583 ?auto_26582 ) ( IS-CRATE ?auto_26578 ) ( not ( = ?auto_26578 ?auto_26579 ) ) ( not ( = ?auto_26584 ?auto_26582 ) ) ( HOIST-AT ?auto_26596 ?auto_26584 ) ( not ( = ?auto_26583 ?auto_26596 ) ) ( SURFACE-AT ?auto_26578 ?auto_26584 ) ( ON ?auto_26578 ?auto_26580 ) ( CLEAR ?auto_26578 ) ( not ( = ?auto_26578 ?auto_26580 ) ) ( not ( = ?auto_26579 ?auto_26580 ) ) ( IS-CRATE ?auto_26579 ) ( not ( = ?auto_26578 ?auto_26581 ) ) ( not ( = ?auto_26579 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26590 ?auto_26582 ) ) ( not ( = ?auto_26584 ?auto_26590 ) ) ( HOIST-AT ?auto_26586 ?auto_26590 ) ( not ( = ?auto_26583 ?auto_26586 ) ) ( not ( = ?auto_26596 ?auto_26586 ) ) ( AVAILABLE ?auto_26586 ) ( SURFACE-AT ?auto_26579 ?auto_26590 ) ( ON ?auto_26579 ?auto_26594 ) ( CLEAR ?auto_26579 ) ( not ( = ?auto_26578 ?auto_26594 ) ) ( not ( = ?auto_26579 ?auto_26594 ) ) ( not ( = ?auto_26580 ?auto_26594 ) ) ( not ( = ?auto_26581 ?auto_26594 ) ) ( IS-CRATE ?auto_26581 ) ( not ( = ?auto_26578 ?auto_26587 ) ) ( not ( = ?auto_26579 ?auto_26587 ) ) ( not ( = ?auto_26580 ?auto_26587 ) ) ( not ( = ?auto_26581 ?auto_26587 ) ) ( not ( = ?auto_26594 ?auto_26587 ) ) ( not ( = ?auto_26585 ?auto_26582 ) ) ( not ( = ?auto_26584 ?auto_26585 ) ) ( not ( = ?auto_26590 ?auto_26585 ) ) ( HOIST-AT ?auto_26595 ?auto_26585 ) ( not ( = ?auto_26583 ?auto_26595 ) ) ( not ( = ?auto_26596 ?auto_26595 ) ) ( not ( = ?auto_26586 ?auto_26595 ) ) ( SURFACE-AT ?auto_26581 ?auto_26585 ) ( ON ?auto_26581 ?auto_26591 ) ( CLEAR ?auto_26581 ) ( not ( = ?auto_26578 ?auto_26591 ) ) ( not ( = ?auto_26579 ?auto_26591 ) ) ( not ( = ?auto_26580 ?auto_26591 ) ) ( not ( = ?auto_26581 ?auto_26591 ) ) ( not ( = ?auto_26594 ?auto_26591 ) ) ( not ( = ?auto_26587 ?auto_26591 ) ) ( IS-CRATE ?auto_26587 ) ( not ( = ?auto_26578 ?auto_26593 ) ) ( not ( = ?auto_26579 ?auto_26593 ) ) ( not ( = ?auto_26580 ?auto_26593 ) ) ( not ( = ?auto_26581 ?auto_26593 ) ) ( not ( = ?auto_26594 ?auto_26593 ) ) ( not ( = ?auto_26587 ?auto_26593 ) ) ( not ( = ?auto_26591 ?auto_26593 ) ) ( AVAILABLE ?auto_26595 ) ( SURFACE-AT ?auto_26587 ?auto_26585 ) ( ON ?auto_26587 ?auto_26588 ) ( CLEAR ?auto_26587 ) ( not ( = ?auto_26578 ?auto_26588 ) ) ( not ( = ?auto_26579 ?auto_26588 ) ) ( not ( = ?auto_26580 ?auto_26588 ) ) ( not ( = ?auto_26581 ?auto_26588 ) ) ( not ( = ?auto_26594 ?auto_26588 ) ) ( not ( = ?auto_26587 ?auto_26588 ) ) ( not ( = ?auto_26591 ?auto_26588 ) ) ( not ( = ?auto_26593 ?auto_26588 ) ) ( SURFACE-AT ?auto_26589 ?auto_26582 ) ( CLEAR ?auto_26589 ) ( IS-CRATE ?auto_26593 ) ( not ( = ?auto_26578 ?auto_26589 ) ) ( not ( = ?auto_26579 ?auto_26589 ) ) ( not ( = ?auto_26580 ?auto_26589 ) ) ( not ( = ?auto_26581 ?auto_26589 ) ) ( not ( = ?auto_26594 ?auto_26589 ) ) ( not ( = ?auto_26587 ?auto_26589 ) ) ( not ( = ?auto_26591 ?auto_26589 ) ) ( not ( = ?auto_26593 ?auto_26589 ) ) ( not ( = ?auto_26588 ?auto_26589 ) ) ( AVAILABLE ?auto_26583 ) ( TRUCK-AT ?auto_26592 ?auto_26584 ) ( AVAILABLE ?auto_26596 ) ( SURFACE-AT ?auto_26593 ?auto_26584 ) ( ON ?auto_26593 ?auto_26597 ) ( CLEAR ?auto_26593 ) ( not ( = ?auto_26578 ?auto_26597 ) ) ( not ( = ?auto_26579 ?auto_26597 ) ) ( not ( = ?auto_26580 ?auto_26597 ) ) ( not ( = ?auto_26581 ?auto_26597 ) ) ( not ( = ?auto_26594 ?auto_26597 ) ) ( not ( = ?auto_26587 ?auto_26597 ) ) ( not ( = ?auto_26591 ?auto_26597 ) ) ( not ( = ?auto_26593 ?auto_26597 ) ) ( not ( = ?auto_26588 ?auto_26597 ) ) ( not ( = ?auto_26589 ?auto_26597 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26596 ?auto_26593 ?auto_26597 ?auto_26584 )
      ( MAKE-ON ?auto_26578 ?auto_26579 )
      ( MAKE-ON-VERIFY ?auto_26578 ?auto_26579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26598 - SURFACE
      ?auto_26599 - SURFACE
    )
    :vars
    (
      ?auto_26605 - HOIST
      ?auto_26606 - PLACE
      ?auto_26617 - PLACE
      ?auto_26611 - HOIST
      ?auto_26609 - SURFACE
      ?auto_26613 - SURFACE
      ?auto_26602 - PLACE
      ?auto_26603 - HOIST
      ?auto_26615 - SURFACE
      ?auto_26614 - SURFACE
      ?auto_26612 - PLACE
      ?auto_26607 - HOIST
      ?auto_26616 - SURFACE
      ?auto_26601 - SURFACE
      ?auto_26608 - SURFACE
      ?auto_26600 - SURFACE
      ?auto_26610 - SURFACE
      ?auto_26604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26605 ?auto_26606 ) ( IS-CRATE ?auto_26598 ) ( not ( = ?auto_26598 ?auto_26599 ) ) ( not ( = ?auto_26617 ?auto_26606 ) ) ( HOIST-AT ?auto_26611 ?auto_26617 ) ( not ( = ?auto_26605 ?auto_26611 ) ) ( SURFACE-AT ?auto_26598 ?auto_26617 ) ( ON ?auto_26598 ?auto_26609 ) ( CLEAR ?auto_26598 ) ( not ( = ?auto_26598 ?auto_26609 ) ) ( not ( = ?auto_26599 ?auto_26609 ) ) ( IS-CRATE ?auto_26599 ) ( not ( = ?auto_26598 ?auto_26613 ) ) ( not ( = ?auto_26599 ?auto_26613 ) ) ( not ( = ?auto_26609 ?auto_26613 ) ) ( not ( = ?auto_26602 ?auto_26606 ) ) ( not ( = ?auto_26617 ?auto_26602 ) ) ( HOIST-AT ?auto_26603 ?auto_26602 ) ( not ( = ?auto_26605 ?auto_26603 ) ) ( not ( = ?auto_26611 ?auto_26603 ) ) ( AVAILABLE ?auto_26603 ) ( SURFACE-AT ?auto_26599 ?auto_26602 ) ( ON ?auto_26599 ?auto_26615 ) ( CLEAR ?auto_26599 ) ( not ( = ?auto_26598 ?auto_26615 ) ) ( not ( = ?auto_26599 ?auto_26615 ) ) ( not ( = ?auto_26609 ?auto_26615 ) ) ( not ( = ?auto_26613 ?auto_26615 ) ) ( IS-CRATE ?auto_26613 ) ( not ( = ?auto_26598 ?auto_26614 ) ) ( not ( = ?auto_26599 ?auto_26614 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) ( not ( = ?auto_26613 ?auto_26614 ) ) ( not ( = ?auto_26615 ?auto_26614 ) ) ( not ( = ?auto_26612 ?auto_26606 ) ) ( not ( = ?auto_26617 ?auto_26612 ) ) ( not ( = ?auto_26602 ?auto_26612 ) ) ( HOIST-AT ?auto_26607 ?auto_26612 ) ( not ( = ?auto_26605 ?auto_26607 ) ) ( not ( = ?auto_26611 ?auto_26607 ) ) ( not ( = ?auto_26603 ?auto_26607 ) ) ( SURFACE-AT ?auto_26613 ?auto_26612 ) ( ON ?auto_26613 ?auto_26616 ) ( CLEAR ?auto_26613 ) ( not ( = ?auto_26598 ?auto_26616 ) ) ( not ( = ?auto_26599 ?auto_26616 ) ) ( not ( = ?auto_26609 ?auto_26616 ) ) ( not ( = ?auto_26613 ?auto_26616 ) ) ( not ( = ?auto_26615 ?auto_26616 ) ) ( not ( = ?auto_26614 ?auto_26616 ) ) ( IS-CRATE ?auto_26614 ) ( not ( = ?auto_26598 ?auto_26601 ) ) ( not ( = ?auto_26599 ?auto_26601 ) ) ( not ( = ?auto_26609 ?auto_26601 ) ) ( not ( = ?auto_26613 ?auto_26601 ) ) ( not ( = ?auto_26615 ?auto_26601 ) ) ( not ( = ?auto_26614 ?auto_26601 ) ) ( not ( = ?auto_26616 ?auto_26601 ) ) ( AVAILABLE ?auto_26607 ) ( SURFACE-AT ?auto_26614 ?auto_26612 ) ( ON ?auto_26614 ?auto_26608 ) ( CLEAR ?auto_26614 ) ( not ( = ?auto_26598 ?auto_26608 ) ) ( not ( = ?auto_26599 ?auto_26608 ) ) ( not ( = ?auto_26609 ?auto_26608 ) ) ( not ( = ?auto_26613 ?auto_26608 ) ) ( not ( = ?auto_26615 ?auto_26608 ) ) ( not ( = ?auto_26614 ?auto_26608 ) ) ( not ( = ?auto_26616 ?auto_26608 ) ) ( not ( = ?auto_26601 ?auto_26608 ) ) ( SURFACE-AT ?auto_26600 ?auto_26606 ) ( CLEAR ?auto_26600 ) ( IS-CRATE ?auto_26601 ) ( not ( = ?auto_26598 ?auto_26600 ) ) ( not ( = ?auto_26599 ?auto_26600 ) ) ( not ( = ?auto_26609 ?auto_26600 ) ) ( not ( = ?auto_26613 ?auto_26600 ) ) ( not ( = ?auto_26615 ?auto_26600 ) ) ( not ( = ?auto_26614 ?auto_26600 ) ) ( not ( = ?auto_26616 ?auto_26600 ) ) ( not ( = ?auto_26601 ?auto_26600 ) ) ( not ( = ?auto_26608 ?auto_26600 ) ) ( AVAILABLE ?auto_26605 ) ( AVAILABLE ?auto_26611 ) ( SURFACE-AT ?auto_26601 ?auto_26617 ) ( ON ?auto_26601 ?auto_26610 ) ( CLEAR ?auto_26601 ) ( not ( = ?auto_26598 ?auto_26610 ) ) ( not ( = ?auto_26599 ?auto_26610 ) ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26613 ?auto_26610 ) ) ( not ( = ?auto_26615 ?auto_26610 ) ) ( not ( = ?auto_26614 ?auto_26610 ) ) ( not ( = ?auto_26616 ?auto_26610 ) ) ( not ( = ?auto_26601 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) ( not ( = ?auto_26600 ?auto_26610 ) ) ( TRUCK-AT ?auto_26604 ?auto_26606 ) )
    :subtasks
    ( ( !DRIVE ?auto_26604 ?auto_26606 ?auto_26617 )
      ( MAKE-ON ?auto_26598 ?auto_26599 )
      ( MAKE-ON-VERIFY ?auto_26598 ?auto_26599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26618 - SURFACE
      ?auto_26619 - SURFACE
    )
    :vars
    (
      ?auto_26628 - HOIST
      ?auto_26633 - PLACE
      ?auto_26636 - PLACE
      ?auto_26634 - HOIST
      ?auto_26624 - SURFACE
      ?auto_26631 - SURFACE
      ?auto_26623 - PLACE
      ?auto_26630 - HOIST
      ?auto_26626 - SURFACE
      ?auto_26625 - SURFACE
      ?auto_26629 - PLACE
      ?auto_26620 - HOIST
      ?auto_26635 - SURFACE
      ?auto_26627 - SURFACE
      ?auto_26622 - SURFACE
      ?auto_26637 - SURFACE
      ?auto_26632 - SURFACE
      ?auto_26621 - TRUCK
      ?auto_26638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26628 ?auto_26633 ) ( IS-CRATE ?auto_26618 ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26636 ?auto_26633 ) ) ( HOIST-AT ?auto_26634 ?auto_26636 ) ( not ( = ?auto_26628 ?auto_26634 ) ) ( SURFACE-AT ?auto_26618 ?auto_26636 ) ( ON ?auto_26618 ?auto_26624 ) ( CLEAR ?auto_26618 ) ( not ( = ?auto_26618 ?auto_26624 ) ) ( not ( = ?auto_26619 ?auto_26624 ) ) ( IS-CRATE ?auto_26619 ) ( not ( = ?auto_26618 ?auto_26631 ) ) ( not ( = ?auto_26619 ?auto_26631 ) ) ( not ( = ?auto_26624 ?auto_26631 ) ) ( not ( = ?auto_26623 ?auto_26633 ) ) ( not ( = ?auto_26636 ?auto_26623 ) ) ( HOIST-AT ?auto_26630 ?auto_26623 ) ( not ( = ?auto_26628 ?auto_26630 ) ) ( not ( = ?auto_26634 ?auto_26630 ) ) ( AVAILABLE ?auto_26630 ) ( SURFACE-AT ?auto_26619 ?auto_26623 ) ( ON ?auto_26619 ?auto_26626 ) ( CLEAR ?auto_26619 ) ( not ( = ?auto_26618 ?auto_26626 ) ) ( not ( = ?auto_26619 ?auto_26626 ) ) ( not ( = ?auto_26624 ?auto_26626 ) ) ( not ( = ?auto_26631 ?auto_26626 ) ) ( IS-CRATE ?auto_26631 ) ( not ( = ?auto_26618 ?auto_26625 ) ) ( not ( = ?auto_26619 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26631 ?auto_26625 ) ) ( not ( = ?auto_26626 ?auto_26625 ) ) ( not ( = ?auto_26629 ?auto_26633 ) ) ( not ( = ?auto_26636 ?auto_26629 ) ) ( not ( = ?auto_26623 ?auto_26629 ) ) ( HOIST-AT ?auto_26620 ?auto_26629 ) ( not ( = ?auto_26628 ?auto_26620 ) ) ( not ( = ?auto_26634 ?auto_26620 ) ) ( not ( = ?auto_26630 ?auto_26620 ) ) ( SURFACE-AT ?auto_26631 ?auto_26629 ) ( ON ?auto_26631 ?auto_26635 ) ( CLEAR ?auto_26631 ) ( not ( = ?auto_26618 ?auto_26635 ) ) ( not ( = ?auto_26619 ?auto_26635 ) ) ( not ( = ?auto_26624 ?auto_26635 ) ) ( not ( = ?auto_26631 ?auto_26635 ) ) ( not ( = ?auto_26626 ?auto_26635 ) ) ( not ( = ?auto_26625 ?auto_26635 ) ) ( IS-CRATE ?auto_26625 ) ( not ( = ?auto_26618 ?auto_26627 ) ) ( not ( = ?auto_26619 ?auto_26627 ) ) ( not ( = ?auto_26624 ?auto_26627 ) ) ( not ( = ?auto_26631 ?auto_26627 ) ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( not ( = ?auto_26635 ?auto_26627 ) ) ( AVAILABLE ?auto_26620 ) ( SURFACE-AT ?auto_26625 ?auto_26629 ) ( ON ?auto_26625 ?auto_26622 ) ( CLEAR ?auto_26625 ) ( not ( = ?auto_26618 ?auto_26622 ) ) ( not ( = ?auto_26619 ?auto_26622 ) ) ( not ( = ?auto_26624 ?auto_26622 ) ) ( not ( = ?auto_26631 ?auto_26622 ) ) ( not ( = ?auto_26626 ?auto_26622 ) ) ( not ( = ?auto_26625 ?auto_26622 ) ) ( not ( = ?auto_26635 ?auto_26622 ) ) ( not ( = ?auto_26627 ?auto_26622 ) ) ( IS-CRATE ?auto_26627 ) ( not ( = ?auto_26618 ?auto_26637 ) ) ( not ( = ?auto_26619 ?auto_26637 ) ) ( not ( = ?auto_26624 ?auto_26637 ) ) ( not ( = ?auto_26631 ?auto_26637 ) ) ( not ( = ?auto_26626 ?auto_26637 ) ) ( not ( = ?auto_26625 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( not ( = ?auto_26627 ?auto_26637 ) ) ( not ( = ?auto_26622 ?auto_26637 ) ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26627 ?auto_26636 ) ( ON ?auto_26627 ?auto_26632 ) ( CLEAR ?auto_26627 ) ( not ( = ?auto_26618 ?auto_26632 ) ) ( not ( = ?auto_26619 ?auto_26632 ) ) ( not ( = ?auto_26624 ?auto_26632 ) ) ( not ( = ?auto_26631 ?auto_26632 ) ) ( not ( = ?auto_26626 ?auto_26632 ) ) ( not ( = ?auto_26625 ?auto_26632 ) ) ( not ( = ?auto_26635 ?auto_26632 ) ) ( not ( = ?auto_26627 ?auto_26632 ) ) ( not ( = ?auto_26622 ?auto_26632 ) ) ( not ( = ?auto_26637 ?auto_26632 ) ) ( TRUCK-AT ?auto_26621 ?auto_26633 ) ( SURFACE-AT ?auto_26638 ?auto_26633 ) ( CLEAR ?auto_26638 ) ( LIFTING ?auto_26628 ?auto_26637 ) ( IS-CRATE ?auto_26637 ) ( not ( = ?auto_26618 ?auto_26638 ) ) ( not ( = ?auto_26619 ?auto_26638 ) ) ( not ( = ?auto_26624 ?auto_26638 ) ) ( not ( = ?auto_26631 ?auto_26638 ) ) ( not ( = ?auto_26626 ?auto_26638 ) ) ( not ( = ?auto_26625 ?auto_26638 ) ) ( not ( = ?auto_26635 ?auto_26638 ) ) ( not ( = ?auto_26627 ?auto_26638 ) ) ( not ( = ?auto_26622 ?auto_26638 ) ) ( not ( = ?auto_26637 ?auto_26638 ) ) ( not ( = ?auto_26632 ?auto_26638 ) ) )
    :subtasks
    ( ( !DROP ?auto_26628 ?auto_26637 ?auto_26638 ?auto_26633 )
      ( MAKE-ON ?auto_26618 ?auto_26619 )
      ( MAKE-ON-VERIFY ?auto_26618 ?auto_26619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26639 - SURFACE
      ?auto_26640 - SURFACE
    )
    :vars
    (
      ?auto_26647 - HOIST
      ?auto_26642 - PLACE
      ?auto_26644 - PLACE
      ?auto_26650 - HOIST
      ?auto_26641 - SURFACE
      ?auto_26654 - SURFACE
      ?auto_26646 - PLACE
      ?auto_26643 - HOIST
      ?auto_26649 - SURFACE
      ?auto_26657 - SURFACE
      ?auto_26655 - PLACE
      ?auto_26653 - HOIST
      ?auto_26652 - SURFACE
      ?auto_26656 - SURFACE
      ?auto_26648 - SURFACE
      ?auto_26645 - SURFACE
      ?auto_26658 - SURFACE
      ?auto_26659 - TRUCK
      ?auto_26651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26647 ?auto_26642 ) ( IS-CRATE ?auto_26639 ) ( not ( = ?auto_26639 ?auto_26640 ) ) ( not ( = ?auto_26644 ?auto_26642 ) ) ( HOIST-AT ?auto_26650 ?auto_26644 ) ( not ( = ?auto_26647 ?auto_26650 ) ) ( SURFACE-AT ?auto_26639 ?auto_26644 ) ( ON ?auto_26639 ?auto_26641 ) ( CLEAR ?auto_26639 ) ( not ( = ?auto_26639 ?auto_26641 ) ) ( not ( = ?auto_26640 ?auto_26641 ) ) ( IS-CRATE ?auto_26640 ) ( not ( = ?auto_26639 ?auto_26654 ) ) ( not ( = ?auto_26640 ?auto_26654 ) ) ( not ( = ?auto_26641 ?auto_26654 ) ) ( not ( = ?auto_26646 ?auto_26642 ) ) ( not ( = ?auto_26644 ?auto_26646 ) ) ( HOIST-AT ?auto_26643 ?auto_26646 ) ( not ( = ?auto_26647 ?auto_26643 ) ) ( not ( = ?auto_26650 ?auto_26643 ) ) ( AVAILABLE ?auto_26643 ) ( SURFACE-AT ?auto_26640 ?auto_26646 ) ( ON ?auto_26640 ?auto_26649 ) ( CLEAR ?auto_26640 ) ( not ( = ?auto_26639 ?auto_26649 ) ) ( not ( = ?auto_26640 ?auto_26649 ) ) ( not ( = ?auto_26641 ?auto_26649 ) ) ( not ( = ?auto_26654 ?auto_26649 ) ) ( IS-CRATE ?auto_26654 ) ( not ( = ?auto_26639 ?auto_26657 ) ) ( not ( = ?auto_26640 ?auto_26657 ) ) ( not ( = ?auto_26641 ?auto_26657 ) ) ( not ( = ?auto_26654 ?auto_26657 ) ) ( not ( = ?auto_26649 ?auto_26657 ) ) ( not ( = ?auto_26655 ?auto_26642 ) ) ( not ( = ?auto_26644 ?auto_26655 ) ) ( not ( = ?auto_26646 ?auto_26655 ) ) ( HOIST-AT ?auto_26653 ?auto_26655 ) ( not ( = ?auto_26647 ?auto_26653 ) ) ( not ( = ?auto_26650 ?auto_26653 ) ) ( not ( = ?auto_26643 ?auto_26653 ) ) ( SURFACE-AT ?auto_26654 ?auto_26655 ) ( ON ?auto_26654 ?auto_26652 ) ( CLEAR ?auto_26654 ) ( not ( = ?auto_26639 ?auto_26652 ) ) ( not ( = ?auto_26640 ?auto_26652 ) ) ( not ( = ?auto_26641 ?auto_26652 ) ) ( not ( = ?auto_26654 ?auto_26652 ) ) ( not ( = ?auto_26649 ?auto_26652 ) ) ( not ( = ?auto_26657 ?auto_26652 ) ) ( IS-CRATE ?auto_26657 ) ( not ( = ?auto_26639 ?auto_26656 ) ) ( not ( = ?auto_26640 ?auto_26656 ) ) ( not ( = ?auto_26641 ?auto_26656 ) ) ( not ( = ?auto_26654 ?auto_26656 ) ) ( not ( = ?auto_26649 ?auto_26656 ) ) ( not ( = ?auto_26657 ?auto_26656 ) ) ( not ( = ?auto_26652 ?auto_26656 ) ) ( AVAILABLE ?auto_26653 ) ( SURFACE-AT ?auto_26657 ?auto_26655 ) ( ON ?auto_26657 ?auto_26648 ) ( CLEAR ?auto_26657 ) ( not ( = ?auto_26639 ?auto_26648 ) ) ( not ( = ?auto_26640 ?auto_26648 ) ) ( not ( = ?auto_26641 ?auto_26648 ) ) ( not ( = ?auto_26654 ?auto_26648 ) ) ( not ( = ?auto_26649 ?auto_26648 ) ) ( not ( = ?auto_26657 ?auto_26648 ) ) ( not ( = ?auto_26652 ?auto_26648 ) ) ( not ( = ?auto_26656 ?auto_26648 ) ) ( IS-CRATE ?auto_26656 ) ( not ( = ?auto_26639 ?auto_26645 ) ) ( not ( = ?auto_26640 ?auto_26645 ) ) ( not ( = ?auto_26641 ?auto_26645 ) ) ( not ( = ?auto_26654 ?auto_26645 ) ) ( not ( = ?auto_26649 ?auto_26645 ) ) ( not ( = ?auto_26657 ?auto_26645 ) ) ( not ( = ?auto_26652 ?auto_26645 ) ) ( not ( = ?auto_26656 ?auto_26645 ) ) ( not ( = ?auto_26648 ?auto_26645 ) ) ( AVAILABLE ?auto_26650 ) ( SURFACE-AT ?auto_26656 ?auto_26644 ) ( ON ?auto_26656 ?auto_26658 ) ( CLEAR ?auto_26656 ) ( not ( = ?auto_26639 ?auto_26658 ) ) ( not ( = ?auto_26640 ?auto_26658 ) ) ( not ( = ?auto_26641 ?auto_26658 ) ) ( not ( = ?auto_26654 ?auto_26658 ) ) ( not ( = ?auto_26649 ?auto_26658 ) ) ( not ( = ?auto_26657 ?auto_26658 ) ) ( not ( = ?auto_26652 ?auto_26658 ) ) ( not ( = ?auto_26656 ?auto_26658 ) ) ( not ( = ?auto_26648 ?auto_26658 ) ) ( not ( = ?auto_26645 ?auto_26658 ) ) ( TRUCK-AT ?auto_26659 ?auto_26642 ) ( SURFACE-AT ?auto_26651 ?auto_26642 ) ( CLEAR ?auto_26651 ) ( IS-CRATE ?auto_26645 ) ( not ( = ?auto_26639 ?auto_26651 ) ) ( not ( = ?auto_26640 ?auto_26651 ) ) ( not ( = ?auto_26641 ?auto_26651 ) ) ( not ( = ?auto_26654 ?auto_26651 ) ) ( not ( = ?auto_26649 ?auto_26651 ) ) ( not ( = ?auto_26657 ?auto_26651 ) ) ( not ( = ?auto_26652 ?auto_26651 ) ) ( not ( = ?auto_26656 ?auto_26651 ) ) ( not ( = ?auto_26648 ?auto_26651 ) ) ( not ( = ?auto_26645 ?auto_26651 ) ) ( not ( = ?auto_26658 ?auto_26651 ) ) ( AVAILABLE ?auto_26647 ) ( IN ?auto_26645 ?auto_26659 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26647 ?auto_26645 ?auto_26659 ?auto_26642 )
      ( MAKE-ON ?auto_26639 ?auto_26640 )
      ( MAKE-ON-VERIFY ?auto_26639 ?auto_26640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26660 - SURFACE
      ?auto_26661 - SURFACE
    )
    :vars
    (
      ?auto_26672 - HOIST
      ?auto_26671 - PLACE
      ?auto_26674 - PLACE
      ?auto_26680 - HOIST
      ?auto_26678 - SURFACE
      ?auto_26670 - SURFACE
      ?auto_26677 - PLACE
      ?auto_26667 - HOIST
      ?auto_26664 - SURFACE
      ?auto_26666 - SURFACE
      ?auto_26675 - PLACE
      ?auto_26676 - HOIST
      ?auto_26669 - SURFACE
      ?auto_26673 - SURFACE
      ?auto_26668 - SURFACE
      ?auto_26663 - SURFACE
      ?auto_26665 - SURFACE
      ?auto_26662 - SURFACE
      ?auto_26679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26672 ?auto_26671 ) ( IS-CRATE ?auto_26660 ) ( not ( = ?auto_26660 ?auto_26661 ) ) ( not ( = ?auto_26674 ?auto_26671 ) ) ( HOIST-AT ?auto_26680 ?auto_26674 ) ( not ( = ?auto_26672 ?auto_26680 ) ) ( SURFACE-AT ?auto_26660 ?auto_26674 ) ( ON ?auto_26660 ?auto_26678 ) ( CLEAR ?auto_26660 ) ( not ( = ?auto_26660 ?auto_26678 ) ) ( not ( = ?auto_26661 ?auto_26678 ) ) ( IS-CRATE ?auto_26661 ) ( not ( = ?auto_26660 ?auto_26670 ) ) ( not ( = ?auto_26661 ?auto_26670 ) ) ( not ( = ?auto_26678 ?auto_26670 ) ) ( not ( = ?auto_26677 ?auto_26671 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( HOIST-AT ?auto_26667 ?auto_26677 ) ( not ( = ?auto_26672 ?auto_26667 ) ) ( not ( = ?auto_26680 ?auto_26667 ) ) ( AVAILABLE ?auto_26667 ) ( SURFACE-AT ?auto_26661 ?auto_26677 ) ( ON ?auto_26661 ?auto_26664 ) ( CLEAR ?auto_26661 ) ( not ( = ?auto_26660 ?auto_26664 ) ) ( not ( = ?auto_26661 ?auto_26664 ) ) ( not ( = ?auto_26678 ?auto_26664 ) ) ( not ( = ?auto_26670 ?auto_26664 ) ) ( IS-CRATE ?auto_26670 ) ( not ( = ?auto_26660 ?auto_26666 ) ) ( not ( = ?auto_26661 ?auto_26666 ) ) ( not ( = ?auto_26678 ?auto_26666 ) ) ( not ( = ?auto_26670 ?auto_26666 ) ) ( not ( = ?auto_26664 ?auto_26666 ) ) ( not ( = ?auto_26675 ?auto_26671 ) ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26677 ?auto_26675 ) ) ( HOIST-AT ?auto_26676 ?auto_26675 ) ( not ( = ?auto_26672 ?auto_26676 ) ) ( not ( = ?auto_26680 ?auto_26676 ) ) ( not ( = ?auto_26667 ?auto_26676 ) ) ( SURFACE-AT ?auto_26670 ?auto_26675 ) ( ON ?auto_26670 ?auto_26669 ) ( CLEAR ?auto_26670 ) ( not ( = ?auto_26660 ?auto_26669 ) ) ( not ( = ?auto_26661 ?auto_26669 ) ) ( not ( = ?auto_26678 ?auto_26669 ) ) ( not ( = ?auto_26670 ?auto_26669 ) ) ( not ( = ?auto_26664 ?auto_26669 ) ) ( not ( = ?auto_26666 ?auto_26669 ) ) ( IS-CRATE ?auto_26666 ) ( not ( = ?auto_26660 ?auto_26673 ) ) ( not ( = ?auto_26661 ?auto_26673 ) ) ( not ( = ?auto_26678 ?auto_26673 ) ) ( not ( = ?auto_26670 ?auto_26673 ) ) ( not ( = ?auto_26664 ?auto_26673 ) ) ( not ( = ?auto_26666 ?auto_26673 ) ) ( not ( = ?auto_26669 ?auto_26673 ) ) ( AVAILABLE ?auto_26676 ) ( SURFACE-AT ?auto_26666 ?auto_26675 ) ( ON ?auto_26666 ?auto_26668 ) ( CLEAR ?auto_26666 ) ( not ( = ?auto_26660 ?auto_26668 ) ) ( not ( = ?auto_26661 ?auto_26668 ) ) ( not ( = ?auto_26678 ?auto_26668 ) ) ( not ( = ?auto_26670 ?auto_26668 ) ) ( not ( = ?auto_26664 ?auto_26668 ) ) ( not ( = ?auto_26666 ?auto_26668 ) ) ( not ( = ?auto_26669 ?auto_26668 ) ) ( not ( = ?auto_26673 ?auto_26668 ) ) ( IS-CRATE ?auto_26673 ) ( not ( = ?auto_26660 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26678 ?auto_26663 ) ) ( not ( = ?auto_26670 ?auto_26663 ) ) ( not ( = ?auto_26664 ?auto_26663 ) ) ( not ( = ?auto_26666 ?auto_26663 ) ) ( not ( = ?auto_26669 ?auto_26663 ) ) ( not ( = ?auto_26673 ?auto_26663 ) ) ( not ( = ?auto_26668 ?auto_26663 ) ) ( AVAILABLE ?auto_26680 ) ( SURFACE-AT ?auto_26673 ?auto_26674 ) ( ON ?auto_26673 ?auto_26665 ) ( CLEAR ?auto_26673 ) ( not ( = ?auto_26660 ?auto_26665 ) ) ( not ( = ?auto_26661 ?auto_26665 ) ) ( not ( = ?auto_26678 ?auto_26665 ) ) ( not ( = ?auto_26670 ?auto_26665 ) ) ( not ( = ?auto_26664 ?auto_26665 ) ) ( not ( = ?auto_26666 ?auto_26665 ) ) ( not ( = ?auto_26669 ?auto_26665 ) ) ( not ( = ?auto_26673 ?auto_26665 ) ) ( not ( = ?auto_26668 ?auto_26665 ) ) ( not ( = ?auto_26663 ?auto_26665 ) ) ( SURFACE-AT ?auto_26662 ?auto_26671 ) ( CLEAR ?auto_26662 ) ( IS-CRATE ?auto_26663 ) ( not ( = ?auto_26660 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26678 ?auto_26662 ) ) ( not ( = ?auto_26670 ?auto_26662 ) ) ( not ( = ?auto_26664 ?auto_26662 ) ) ( not ( = ?auto_26666 ?auto_26662 ) ) ( not ( = ?auto_26669 ?auto_26662 ) ) ( not ( = ?auto_26673 ?auto_26662 ) ) ( not ( = ?auto_26668 ?auto_26662 ) ) ( not ( = ?auto_26663 ?auto_26662 ) ) ( not ( = ?auto_26665 ?auto_26662 ) ) ( AVAILABLE ?auto_26672 ) ( IN ?auto_26663 ?auto_26679 ) ( TRUCK-AT ?auto_26679 ?auto_26674 ) )
    :subtasks
    ( ( !DRIVE ?auto_26679 ?auto_26674 ?auto_26671 )
      ( MAKE-ON ?auto_26660 ?auto_26661 )
      ( MAKE-ON-VERIFY ?auto_26660 ?auto_26661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26681 - SURFACE
      ?auto_26682 - SURFACE
    )
    :vars
    (
      ?auto_26693 - HOIST
      ?auto_26694 - PLACE
      ?auto_26687 - PLACE
      ?auto_26698 - HOIST
      ?auto_26696 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26684 - PLACE
      ?auto_26699 - HOIST
      ?auto_26686 - SURFACE
      ?auto_26692 - SURFACE
      ?auto_26691 - PLACE
      ?auto_26689 - HOIST
      ?auto_26683 - SURFACE
      ?auto_26695 - SURFACE
      ?auto_26690 - SURFACE
      ?auto_26688 - SURFACE
      ?auto_26700 - SURFACE
      ?auto_26701 - SURFACE
      ?auto_26697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26693 ?auto_26694 ) ( IS-CRATE ?auto_26681 ) ( not ( = ?auto_26681 ?auto_26682 ) ) ( not ( = ?auto_26687 ?auto_26694 ) ) ( HOIST-AT ?auto_26698 ?auto_26687 ) ( not ( = ?auto_26693 ?auto_26698 ) ) ( SURFACE-AT ?auto_26681 ?auto_26687 ) ( ON ?auto_26681 ?auto_26696 ) ( CLEAR ?auto_26681 ) ( not ( = ?auto_26681 ?auto_26696 ) ) ( not ( = ?auto_26682 ?auto_26696 ) ) ( IS-CRATE ?auto_26682 ) ( not ( = ?auto_26681 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26696 ?auto_26685 ) ) ( not ( = ?auto_26684 ?auto_26694 ) ) ( not ( = ?auto_26687 ?auto_26684 ) ) ( HOIST-AT ?auto_26699 ?auto_26684 ) ( not ( = ?auto_26693 ?auto_26699 ) ) ( not ( = ?auto_26698 ?auto_26699 ) ) ( AVAILABLE ?auto_26699 ) ( SURFACE-AT ?auto_26682 ?auto_26684 ) ( ON ?auto_26682 ?auto_26686 ) ( CLEAR ?auto_26682 ) ( not ( = ?auto_26681 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26696 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( IS-CRATE ?auto_26685 ) ( not ( = ?auto_26681 ?auto_26692 ) ) ( not ( = ?auto_26682 ?auto_26692 ) ) ( not ( = ?auto_26696 ?auto_26692 ) ) ( not ( = ?auto_26685 ?auto_26692 ) ) ( not ( = ?auto_26686 ?auto_26692 ) ) ( not ( = ?auto_26691 ?auto_26694 ) ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26684 ?auto_26691 ) ) ( HOIST-AT ?auto_26689 ?auto_26691 ) ( not ( = ?auto_26693 ?auto_26689 ) ) ( not ( = ?auto_26698 ?auto_26689 ) ) ( not ( = ?auto_26699 ?auto_26689 ) ) ( SURFACE-AT ?auto_26685 ?auto_26691 ) ( ON ?auto_26685 ?auto_26683 ) ( CLEAR ?auto_26685 ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26696 ?auto_26683 ) ) ( not ( = ?auto_26685 ?auto_26683 ) ) ( not ( = ?auto_26686 ?auto_26683 ) ) ( not ( = ?auto_26692 ?auto_26683 ) ) ( IS-CRATE ?auto_26692 ) ( not ( = ?auto_26681 ?auto_26695 ) ) ( not ( = ?auto_26682 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26695 ) ) ( not ( = ?auto_26685 ?auto_26695 ) ) ( not ( = ?auto_26686 ?auto_26695 ) ) ( not ( = ?auto_26692 ?auto_26695 ) ) ( not ( = ?auto_26683 ?auto_26695 ) ) ( AVAILABLE ?auto_26689 ) ( SURFACE-AT ?auto_26692 ?auto_26691 ) ( ON ?auto_26692 ?auto_26690 ) ( CLEAR ?auto_26692 ) ( not ( = ?auto_26681 ?auto_26690 ) ) ( not ( = ?auto_26682 ?auto_26690 ) ) ( not ( = ?auto_26696 ?auto_26690 ) ) ( not ( = ?auto_26685 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26692 ?auto_26690 ) ) ( not ( = ?auto_26683 ?auto_26690 ) ) ( not ( = ?auto_26695 ?auto_26690 ) ) ( IS-CRATE ?auto_26695 ) ( not ( = ?auto_26681 ?auto_26688 ) ) ( not ( = ?auto_26682 ?auto_26688 ) ) ( not ( = ?auto_26696 ?auto_26688 ) ) ( not ( = ?auto_26685 ?auto_26688 ) ) ( not ( = ?auto_26686 ?auto_26688 ) ) ( not ( = ?auto_26692 ?auto_26688 ) ) ( not ( = ?auto_26683 ?auto_26688 ) ) ( not ( = ?auto_26695 ?auto_26688 ) ) ( not ( = ?auto_26690 ?auto_26688 ) ) ( SURFACE-AT ?auto_26695 ?auto_26687 ) ( ON ?auto_26695 ?auto_26700 ) ( CLEAR ?auto_26695 ) ( not ( = ?auto_26681 ?auto_26700 ) ) ( not ( = ?auto_26682 ?auto_26700 ) ) ( not ( = ?auto_26696 ?auto_26700 ) ) ( not ( = ?auto_26685 ?auto_26700 ) ) ( not ( = ?auto_26686 ?auto_26700 ) ) ( not ( = ?auto_26692 ?auto_26700 ) ) ( not ( = ?auto_26683 ?auto_26700 ) ) ( not ( = ?auto_26695 ?auto_26700 ) ) ( not ( = ?auto_26690 ?auto_26700 ) ) ( not ( = ?auto_26688 ?auto_26700 ) ) ( SURFACE-AT ?auto_26701 ?auto_26694 ) ( CLEAR ?auto_26701 ) ( IS-CRATE ?auto_26688 ) ( not ( = ?auto_26681 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26701 ) ) ( not ( = ?auto_26696 ?auto_26701 ) ) ( not ( = ?auto_26685 ?auto_26701 ) ) ( not ( = ?auto_26686 ?auto_26701 ) ) ( not ( = ?auto_26692 ?auto_26701 ) ) ( not ( = ?auto_26683 ?auto_26701 ) ) ( not ( = ?auto_26695 ?auto_26701 ) ) ( not ( = ?auto_26690 ?auto_26701 ) ) ( not ( = ?auto_26688 ?auto_26701 ) ) ( not ( = ?auto_26700 ?auto_26701 ) ) ( AVAILABLE ?auto_26693 ) ( TRUCK-AT ?auto_26697 ?auto_26687 ) ( LIFTING ?auto_26698 ?auto_26688 ) )
    :subtasks
    ( ( !LOAD ?auto_26698 ?auto_26688 ?auto_26697 ?auto_26687 )
      ( MAKE-ON ?auto_26681 ?auto_26682 )
      ( MAKE-ON-VERIFY ?auto_26681 ?auto_26682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26702 - SURFACE
      ?auto_26703 - SURFACE
    )
    :vars
    (
      ?auto_26705 - HOIST
      ?auto_26704 - PLACE
      ?auto_26717 - PLACE
      ?auto_26716 - HOIST
      ?auto_26709 - SURFACE
      ?auto_26707 - SURFACE
      ?auto_26708 - PLACE
      ?auto_26720 - HOIST
      ?auto_26713 - SURFACE
      ?auto_26710 - SURFACE
      ?auto_26719 - PLACE
      ?auto_26711 - HOIST
      ?auto_26721 - SURFACE
      ?auto_26706 - SURFACE
      ?auto_26712 - SURFACE
      ?auto_26715 - SURFACE
      ?auto_26714 - SURFACE
      ?auto_26718 - SURFACE
      ?auto_26722 - TRUCK
      ?auto_26723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26705 ?auto_26704 ) ( IS-CRATE ?auto_26702 ) ( not ( = ?auto_26702 ?auto_26703 ) ) ( not ( = ?auto_26717 ?auto_26704 ) ) ( HOIST-AT ?auto_26716 ?auto_26717 ) ( not ( = ?auto_26705 ?auto_26716 ) ) ( SURFACE-AT ?auto_26702 ?auto_26717 ) ( ON ?auto_26702 ?auto_26709 ) ( CLEAR ?auto_26702 ) ( not ( = ?auto_26702 ?auto_26709 ) ) ( not ( = ?auto_26703 ?auto_26709 ) ) ( IS-CRATE ?auto_26703 ) ( not ( = ?auto_26702 ?auto_26707 ) ) ( not ( = ?auto_26703 ?auto_26707 ) ) ( not ( = ?auto_26709 ?auto_26707 ) ) ( not ( = ?auto_26708 ?auto_26704 ) ) ( not ( = ?auto_26717 ?auto_26708 ) ) ( HOIST-AT ?auto_26720 ?auto_26708 ) ( not ( = ?auto_26705 ?auto_26720 ) ) ( not ( = ?auto_26716 ?auto_26720 ) ) ( AVAILABLE ?auto_26720 ) ( SURFACE-AT ?auto_26703 ?auto_26708 ) ( ON ?auto_26703 ?auto_26713 ) ( CLEAR ?auto_26703 ) ( not ( = ?auto_26702 ?auto_26713 ) ) ( not ( = ?auto_26703 ?auto_26713 ) ) ( not ( = ?auto_26709 ?auto_26713 ) ) ( not ( = ?auto_26707 ?auto_26713 ) ) ( IS-CRATE ?auto_26707 ) ( not ( = ?auto_26702 ?auto_26710 ) ) ( not ( = ?auto_26703 ?auto_26710 ) ) ( not ( = ?auto_26709 ?auto_26710 ) ) ( not ( = ?auto_26707 ?auto_26710 ) ) ( not ( = ?auto_26713 ?auto_26710 ) ) ( not ( = ?auto_26719 ?auto_26704 ) ) ( not ( = ?auto_26717 ?auto_26719 ) ) ( not ( = ?auto_26708 ?auto_26719 ) ) ( HOIST-AT ?auto_26711 ?auto_26719 ) ( not ( = ?auto_26705 ?auto_26711 ) ) ( not ( = ?auto_26716 ?auto_26711 ) ) ( not ( = ?auto_26720 ?auto_26711 ) ) ( SURFACE-AT ?auto_26707 ?auto_26719 ) ( ON ?auto_26707 ?auto_26721 ) ( CLEAR ?auto_26707 ) ( not ( = ?auto_26702 ?auto_26721 ) ) ( not ( = ?auto_26703 ?auto_26721 ) ) ( not ( = ?auto_26709 ?auto_26721 ) ) ( not ( = ?auto_26707 ?auto_26721 ) ) ( not ( = ?auto_26713 ?auto_26721 ) ) ( not ( = ?auto_26710 ?auto_26721 ) ) ( IS-CRATE ?auto_26710 ) ( not ( = ?auto_26702 ?auto_26706 ) ) ( not ( = ?auto_26703 ?auto_26706 ) ) ( not ( = ?auto_26709 ?auto_26706 ) ) ( not ( = ?auto_26707 ?auto_26706 ) ) ( not ( = ?auto_26713 ?auto_26706 ) ) ( not ( = ?auto_26710 ?auto_26706 ) ) ( not ( = ?auto_26721 ?auto_26706 ) ) ( AVAILABLE ?auto_26711 ) ( SURFACE-AT ?auto_26710 ?auto_26719 ) ( ON ?auto_26710 ?auto_26712 ) ( CLEAR ?auto_26710 ) ( not ( = ?auto_26702 ?auto_26712 ) ) ( not ( = ?auto_26703 ?auto_26712 ) ) ( not ( = ?auto_26709 ?auto_26712 ) ) ( not ( = ?auto_26707 ?auto_26712 ) ) ( not ( = ?auto_26713 ?auto_26712 ) ) ( not ( = ?auto_26710 ?auto_26712 ) ) ( not ( = ?auto_26721 ?auto_26712 ) ) ( not ( = ?auto_26706 ?auto_26712 ) ) ( IS-CRATE ?auto_26706 ) ( not ( = ?auto_26702 ?auto_26715 ) ) ( not ( = ?auto_26703 ?auto_26715 ) ) ( not ( = ?auto_26709 ?auto_26715 ) ) ( not ( = ?auto_26707 ?auto_26715 ) ) ( not ( = ?auto_26713 ?auto_26715 ) ) ( not ( = ?auto_26710 ?auto_26715 ) ) ( not ( = ?auto_26721 ?auto_26715 ) ) ( not ( = ?auto_26706 ?auto_26715 ) ) ( not ( = ?auto_26712 ?auto_26715 ) ) ( SURFACE-AT ?auto_26706 ?auto_26717 ) ( ON ?auto_26706 ?auto_26714 ) ( CLEAR ?auto_26706 ) ( not ( = ?auto_26702 ?auto_26714 ) ) ( not ( = ?auto_26703 ?auto_26714 ) ) ( not ( = ?auto_26709 ?auto_26714 ) ) ( not ( = ?auto_26707 ?auto_26714 ) ) ( not ( = ?auto_26713 ?auto_26714 ) ) ( not ( = ?auto_26710 ?auto_26714 ) ) ( not ( = ?auto_26721 ?auto_26714 ) ) ( not ( = ?auto_26706 ?auto_26714 ) ) ( not ( = ?auto_26712 ?auto_26714 ) ) ( not ( = ?auto_26715 ?auto_26714 ) ) ( SURFACE-AT ?auto_26718 ?auto_26704 ) ( CLEAR ?auto_26718 ) ( IS-CRATE ?auto_26715 ) ( not ( = ?auto_26702 ?auto_26718 ) ) ( not ( = ?auto_26703 ?auto_26718 ) ) ( not ( = ?auto_26709 ?auto_26718 ) ) ( not ( = ?auto_26707 ?auto_26718 ) ) ( not ( = ?auto_26713 ?auto_26718 ) ) ( not ( = ?auto_26710 ?auto_26718 ) ) ( not ( = ?auto_26721 ?auto_26718 ) ) ( not ( = ?auto_26706 ?auto_26718 ) ) ( not ( = ?auto_26712 ?auto_26718 ) ) ( not ( = ?auto_26715 ?auto_26718 ) ) ( not ( = ?auto_26714 ?auto_26718 ) ) ( AVAILABLE ?auto_26705 ) ( TRUCK-AT ?auto_26722 ?auto_26717 ) ( AVAILABLE ?auto_26716 ) ( SURFACE-AT ?auto_26715 ?auto_26717 ) ( ON ?auto_26715 ?auto_26723 ) ( CLEAR ?auto_26715 ) ( not ( = ?auto_26702 ?auto_26723 ) ) ( not ( = ?auto_26703 ?auto_26723 ) ) ( not ( = ?auto_26709 ?auto_26723 ) ) ( not ( = ?auto_26707 ?auto_26723 ) ) ( not ( = ?auto_26713 ?auto_26723 ) ) ( not ( = ?auto_26710 ?auto_26723 ) ) ( not ( = ?auto_26721 ?auto_26723 ) ) ( not ( = ?auto_26706 ?auto_26723 ) ) ( not ( = ?auto_26712 ?auto_26723 ) ) ( not ( = ?auto_26715 ?auto_26723 ) ) ( not ( = ?auto_26714 ?auto_26723 ) ) ( not ( = ?auto_26718 ?auto_26723 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26716 ?auto_26715 ?auto_26723 ?auto_26717 )
      ( MAKE-ON ?auto_26702 ?auto_26703 )
      ( MAKE-ON-VERIFY ?auto_26702 ?auto_26703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26724 - SURFACE
      ?auto_26725 - SURFACE
    )
    :vars
    (
      ?auto_26729 - HOIST
      ?auto_26744 - PLACE
      ?auto_26738 - PLACE
      ?auto_26737 - HOIST
      ?auto_26743 - SURFACE
      ?auto_26740 - SURFACE
      ?auto_26739 - PLACE
      ?auto_26733 - HOIST
      ?auto_26745 - SURFACE
      ?auto_26732 - SURFACE
      ?auto_26735 - PLACE
      ?auto_26728 - HOIST
      ?auto_26734 - SURFACE
      ?auto_26736 - SURFACE
      ?auto_26726 - SURFACE
      ?auto_26742 - SURFACE
      ?auto_26741 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26730 - SURFACE
      ?auto_26731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26729 ?auto_26744 ) ( IS-CRATE ?auto_26724 ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( not ( = ?auto_26738 ?auto_26744 ) ) ( HOIST-AT ?auto_26737 ?auto_26738 ) ( not ( = ?auto_26729 ?auto_26737 ) ) ( SURFACE-AT ?auto_26724 ?auto_26738 ) ( ON ?auto_26724 ?auto_26743 ) ( CLEAR ?auto_26724 ) ( not ( = ?auto_26724 ?auto_26743 ) ) ( not ( = ?auto_26725 ?auto_26743 ) ) ( IS-CRATE ?auto_26725 ) ( not ( = ?auto_26724 ?auto_26740 ) ) ( not ( = ?auto_26725 ?auto_26740 ) ) ( not ( = ?auto_26743 ?auto_26740 ) ) ( not ( = ?auto_26739 ?auto_26744 ) ) ( not ( = ?auto_26738 ?auto_26739 ) ) ( HOIST-AT ?auto_26733 ?auto_26739 ) ( not ( = ?auto_26729 ?auto_26733 ) ) ( not ( = ?auto_26737 ?auto_26733 ) ) ( AVAILABLE ?auto_26733 ) ( SURFACE-AT ?auto_26725 ?auto_26739 ) ( ON ?auto_26725 ?auto_26745 ) ( CLEAR ?auto_26725 ) ( not ( = ?auto_26724 ?auto_26745 ) ) ( not ( = ?auto_26725 ?auto_26745 ) ) ( not ( = ?auto_26743 ?auto_26745 ) ) ( not ( = ?auto_26740 ?auto_26745 ) ) ( IS-CRATE ?auto_26740 ) ( not ( = ?auto_26724 ?auto_26732 ) ) ( not ( = ?auto_26725 ?auto_26732 ) ) ( not ( = ?auto_26743 ?auto_26732 ) ) ( not ( = ?auto_26740 ?auto_26732 ) ) ( not ( = ?auto_26745 ?auto_26732 ) ) ( not ( = ?auto_26735 ?auto_26744 ) ) ( not ( = ?auto_26738 ?auto_26735 ) ) ( not ( = ?auto_26739 ?auto_26735 ) ) ( HOIST-AT ?auto_26728 ?auto_26735 ) ( not ( = ?auto_26729 ?auto_26728 ) ) ( not ( = ?auto_26737 ?auto_26728 ) ) ( not ( = ?auto_26733 ?auto_26728 ) ) ( SURFACE-AT ?auto_26740 ?auto_26735 ) ( ON ?auto_26740 ?auto_26734 ) ( CLEAR ?auto_26740 ) ( not ( = ?auto_26724 ?auto_26734 ) ) ( not ( = ?auto_26725 ?auto_26734 ) ) ( not ( = ?auto_26743 ?auto_26734 ) ) ( not ( = ?auto_26740 ?auto_26734 ) ) ( not ( = ?auto_26745 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( IS-CRATE ?auto_26732 ) ( not ( = ?auto_26724 ?auto_26736 ) ) ( not ( = ?auto_26725 ?auto_26736 ) ) ( not ( = ?auto_26743 ?auto_26736 ) ) ( not ( = ?auto_26740 ?auto_26736 ) ) ( not ( = ?auto_26745 ?auto_26736 ) ) ( not ( = ?auto_26732 ?auto_26736 ) ) ( not ( = ?auto_26734 ?auto_26736 ) ) ( AVAILABLE ?auto_26728 ) ( SURFACE-AT ?auto_26732 ?auto_26735 ) ( ON ?auto_26732 ?auto_26726 ) ( CLEAR ?auto_26732 ) ( not ( = ?auto_26724 ?auto_26726 ) ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( not ( = ?auto_26743 ?auto_26726 ) ) ( not ( = ?auto_26740 ?auto_26726 ) ) ( not ( = ?auto_26745 ?auto_26726 ) ) ( not ( = ?auto_26732 ?auto_26726 ) ) ( not ( = ?auto_26734 ?auto_26726 ) ) ( not ( = ?auto_26736 ?auto_26726 ) ) ( IS-CRATE ?auto_26736 ) ( not ( = ?auto_26724 ?auto_26742 ) ) ( not ( = ?auto_26725 ?auto_26742 ) ) ( not ( = ?auto_26743 ?auto_26742 ) ) ( not ( = ?auto_26740 ?auto_26742 ) ) ( not ( = ?auto_26745 ?auto_26742 ) ) ( not ( = ?auto_26732 ?auto_26742 ) ) ( not ( = ?auto_26734 ?auto_26742 ) ) ( not ( = ?auto_26736 ?auto_26742 ) ) ( not ( = ?auto_26726 ?auto_26742 ) ) ( SURFACE-AT ?auto_26736 ?auto_26738 ) ( ON ?auto_26736 ?auto_26741 ) ( CLEAR ?auto_26736 ) ( not ( = ?auto_26724 ?auto_26741 ) ) ( not ( = ?auto_26725 ?auto_26741 ) ) ( not ( = ?auto_26743 ?auto_26741 ) ) ( not ( = ?auto_26740 ?auto_26741 ) ) ( not ( = ?auto_26745 ?auto_26741 ) ) ( not ( = ?auto_26732 ?auto_26741 ) ) ( not ( = ?auto_26734 ?auto_26741 ) ) ( not ( = ?auto_26736 ?auto_26741 ) ) ( not ( = ?auto_26726 ?auto_26741 ) ) ( not ( = ?auto_26742 ?auto_26741 ) ) ( SURFACE-AT ?auto_26727 ?auto_26744 ) ( CLEAR ?auto_26727 ) ( IS-CRATE ?auto_26742 ) ( not ( = ?auto_26724 ?auto_26727 ) ) ( not ( = ?auto_26725 ?auto_26727 ) ) ( not ( = ?auto_26743 ?auto_26727 ) ) ( not ( = ?auto_26740 ?auto_26727 ) ) ( not ( = ?auto_26745 ?auto_26727 ) ) ( not ( = ?auto_26732 ?auto_26727 ) ) ( not ( = ?auto_26734 ?auto_26727 ) ) ( not ( = ?auto_26736 ?auto_26727 ) ) ( not ( = ?auto_26726 ?auto_26727 ) ) ( not ( = ?auto_26742 ?auto_26727 ) ) ( not ( = ?auto_26741 ?auto_26727 ) ) ( AVAILABLE ?auto_26729 ) ( AVAILABLE ?auto_26737 ) ( SURFACE-AT ?auto_26742 ?auto_26738 ) ( ON ?auto_26742 ?auto_26730 ) ( CLEAR ?auto_26742 ) ( not ( = ?auto_26724 ?auto_26730 ) ) ( not ( = ?auto_26725 ?auto_26730 ) ) ( not ( = ?auto_26743 ?auto_26730 ) ) ( not ( = ?auto_26740 ?auto_26730 ) ) ( not ( = ?auto_26745 ?auto_26730 ) ) ( not ( = ?auto_26732 ?auto_26730 ) ) ( not ( = ?auto_26734 ?auto_26730 ) ) ( not ( = ?auto_26736 ?auto_26730 ) ) ( not ( = ?auto_26726 ?auto_26730 ) ) ( not ( = ?auto_26742 ?auto_26730 ) ) ( not ( = ?auto_26741 ?auto_26730 ) ) ( not ( = ?auto_26727 ?auto_26730 ) ) ( TRUCK-AT ?auto_26731 ?auto_26744 ) )
    :subtasks
    ( ( !DRIVE ?auto_26731 ?auto_26744 ?auto_26738 )
      ( MAKE-ON ?auto_26724 ?auto_26725 )
      ( MAKE-ON-VERIFY ?auto_26724 ?auto_26725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
    )
    :vars
    (
      ?auto_26750 - HOIST
      ?auto_26751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26750 ?auto_26751 ) ( SURFACE-AT ?auto_26749 ?auto_26751 ) ( CLEAR ?auto_26749 ) ( LIFTING ?auto_26750 ?auto_26748 ) ( IS-CRATE ?auto_26748 ) ( not ( = ?auto_26748 ?auto_26749 ) ) )
    :subtasks
    ( ( !DROP ?auto_26750 ?auto_26748 ?auto_26749 ?auto_26751 )
      ( MAKE-ON-VERIFY ?auto_26748 ?auto_26749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26752 - SURFACE
      ?auto_26753 - SURFACE
    )
    :vars
    (
      ?auto_26754 - HOIST
      ?auto_26755 - PLACE
      ?auto_26756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26754 ?auto_26755 ) ( SURFACE-AT ?auto_26753 ?auto_26755 ) ( CLEAR ?auto_26753 ) ( IS-CRATE ?auto_26752 ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( TRUCK-AT ?auto_26756 ?auto_26755 ) ( AVAILABLE ?auto_26754 ) ( IN ?auto_26752 ?auto_26756 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26754 ?auto_26752 ?auto_26756 ?auto_26755 )
      ( MAKE-ON ?auto_26752 ?auto_26753 )
      ( MAKE-ON-VERIFY ?auto_26752 ?auto_26753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26757 - SURFACE
      ?auto_26758 - SURFACE
    )
    :vars
    (
      ?auto_26761 - HOIST
      ?auto_26760 - PLACE
      ?auto_26759 - TRUCK
      ?auto_26762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26761 ?auto_26760 ) ( SURFACE-AT ?auto_26758 ?auto_26760 ) ( CLEAR ?auto_26758 ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( AVAILABLE ?auto_26761 ) ( IN ?auto_26757 ?auto_26759 ) ( TRUCK-AT ?auto_26759 ?auto_26762 ) ( not ( = ?auto_26762 ?auto_26760 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26759 ?auto_26762 ?auto_26760 )
      ( MAKE-ON ?auto_26757 ?auto_26758 )
      ( MAKE-ON-VERIFY ?auto_26757 ?auto_26758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26763 - SURFACE
      ?auto_26764 - SURFACE
    )
    :vars
    (
      ?auto_26768 - HOIST
      ?auto_26766 - PLACE
      ?auto_26767 - TRUCK
      ?auto_26765 - PLACE
      ?auto_26769 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26768 ?auto_26766 ) ( SURFACE-AT ?auto_26764 ?auto_26766 ) ( CLEAR ?auto_26764 ) ( IS-CRATE ?auto_26763 ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( AVAILABLE ?auto_26768 ) ( TRUCK-AT ?auto_26767 ?auto_26765 ) ( not ( = ?auto_26765 ?auto_26766 ) ) ( HOIST-AT ?auto_26769 ?auto_26765 ) ( LIFTING ?auto_26769 ?auto_26763 ) ( not ( = ?auto_26768 ?auto_26769 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26769 ?auto_26763 ?auto_26767 ?auto_26765 )
      ( MAKE-ON ?auto_26763 ?auto_26764 )
      ( MAKE-ON-VERIFY ?auto_26763 ?auto_26764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26770 - SURFACE
      ?auto_26771 - SURFACE
    )
    :vars
    (
      ?auto_26772 - HOIST
      ?auto_26774 - PLACE
      ?auto_26773 - TRUCK
      ?auto_26776 - PLACE
      ?auto_26775 - HOIST
      ?auto_26777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26772 ?auto_26774 ) ( SURFACE-AT ?auto_26771 ?auto_26774 ) ( CLEAR ?auto_26771 ) ( IS-CRATE ?auto_26770 ) ( not ( = ?auto_26770 ?auto_26771 ) ) ( AVAILABLE ?auto_26772 ) ( TRUCK-AT ?auto_26773 ?auto_26776 ) ( not ( = ?auto_26776 ?auto_26774 ) ) ( HOIST-AT ?auto_26775 ?auto_26776 ) ( not ( = ?auto_26772 ?auto_26775 ) ) ( AVAILABLE ?auto_26775 ) ( SURFACE-AT ?auto_26770 ?auto_26776 ) ( ON ?auto_26770 ?auto_26777 ) ( CLEAR ?auto_26770 ) ( not ( = ?auto_26770 ?auto_26777 ) ) ( not ( = ?auto_26771 ?auto_26777 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26775 ?auto_26770 ?auto_26777 ?auto_26776 )
      ( MAKE-ON ?auto_26770 ?auto_26771 )
      ( MAKE-ON-VERIFY ?auto_26770 ?auto_26771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26778 - SURFACE
      ?auto_26779 - SURFACE
    )
    :vars
    (
      ?auto_26785 - HOIST
      ?auto_26782 - PLACE
      ?auto_26783 - PLACE
      ?auto_26781 - HOIST
      ?auto_26780 - SURFACE
      ?auto_26784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26785 ?auto_26782 ) ( SURFACE-AT ?auto_26779 ?auto_26782 ) ( CLEAR ?auto_26779 ) ( IS-CRATE ?auto_26778 ) ( not ( = ?auto_26778 ?auto_26779 ) ) ( AVAILABLE ?auto_26785 ) ( not ( = ?auto_26783 ?auto_26782 ) ) ( HOIST-AT ?auto_26781 ?auto_26783 ) ( not ( = ?auto_26785 ?auto_26781 ) ) ( AVAILABLE ?auto_26781 ) ( SURFACE-AT ?auto_26778 ?auto_26783 ) ( ON ?auto_26778 ?auto_26780 ) ( CLEAR ?auto_26778 ) ( not ( = ?auto_26778 ?auto_26780 ) ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( TRUCK-AT ?auto_26784 ?auto_26782 ) )
    :subtasks
    ( ( !DRIVE ?auto_26784 ?auto_26782 ?auto_26783 )
      ( MAKE-ON ?auto_26778 ?auto_26779 )
      ( MAKE-ON-VERIFY ?auto_26778 ?auto_26779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26786 - SURFACE
      ?auto_26787 - SURFACE
    )
    :vars
    (
      ?auto_26789 - HOIST
      ?auto_26793 - PLACE
      ?auto_26788 - PLACE
      ?auto_26791 - HOIST
      ?auto_26790 - SURFACE
      ?auto_26792 - TRUCK
      ?auto_26794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26789 ?auto_26793 ) ( IS-CRATE ?auto_26786 ) ( not ( = ?auto_26786 ?auto_26787 ) ) ( not ( = ?auto_26788 ?auto_26793 ) ) ( HOIST-AT ?auto_26791 ?auto_26788 ) ( not ( = ?auto_26789 ?auto_26791 ) ) ( AVAILABLE ?auto_26791 ) ( SURFACE-AT ?auto_26786 ?auto_26788 ) ( ON ?auto_26786 ?auto_26790 ) ( CLEAR ?auto_26786 ) ( not ( = ?auto_26786 ?auto_26790 ) ) ( not ( = ?auto_26787 ?auto_26790 ) ) ( TRUCK-AT ?auto_26792 ?auto_26793 ) ( SURFACE-AT ?auto_26794 ?auto_26793 ) ( CLEAR ?auto_26794 ) ( LIFTING ?auto_26789 ?auto_26787 ) ( IS-CRATE ?auto_26787 ) ( not ( = ?auto_26786 ?auto_26794 ) ) ( not ( = ?auto_26787 ?auto_26794 ) ) ( not ( = ?auto_26790 ?auto_26794 ) ) )
    :subtasks
    ( ( !DROP ?auto_26789 ?auto_26787 ?auto_26794 ?auto_26793 )
      ( MAKE-ON ?auto_26786 ?auto_26787 )
      ( MAKE-ON-VERIFY ?auto_26786 ?auto_26787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26795 - SURFACE
      ?auto_26796 - SURFACE
    )
    :vars
    (
      ?auto_26802 - HOIST
      ?auto_26803 - PLACE
      ?auto_26800 - PLACE
      ?auto_26799 - HOIST
      ?auto_26801 - SURFACE
      ?auto_26798 - TRUCK
      ?auto_26797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26802 ?auto_26803 ) ( IS-CRATE ?auto_26795 ) ( not ( = ?auto_26795 ?auto_26796 ) ) ( not ( = ?auto_26800 ?auto_26803 ) ) ( HOIST-AT ?auto_26799 ?auto_26800 ) ( not ( = ?auto_26802 ?auto_26799 ) ) ( AVAILABLE ?auto_26799 ) ( SURFACE-AT ?auto_26795 ?auto_26800 ) ( ON ?auto_26795 ?auto_26801 ) ( CLEAR ?auto_26795 ) ( not ( = ?auto_26795 ?auto_26801 ) ) ( not ( = ?auto_26796 ?auto_26801 ) ) ( TRUCK-AT ?auto_26798 ?auto_26803 ) ( SURFACE-AT ?auto_26797 ?auto_26803 ) ( CLEAR ?auto_26797 ) ( IS-CRATE ?auto_26796 ) ( not ( = ?auto_26795 ?auto_26797 ) ) ( not ( = ?auto_26796 ?auto_26797 ) ) ( not ( = ?auto_26801 ?auto_26797 ) ) ( AVAILABLE ?auto_26802 ) ( IN ?auto_26796 ?auto_26798 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26802 ?auto_26796 ?auto_26798 ?auto_26803 )
      ( MAKE-ON ?auto_26795 ?auto_26796 )
      ( MAKE-ON-VERIFY ?auto_26795 ?auto_26796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26804 - SURFACE
      ?auto_26805 - SURFACE
    )
    :vars
    (
      ?auto_26809 - HOIST
      ?auto_26812 - PLACE
      ?auto_26806 - PLACE
      ?auto_26811 - HOIST
      ?auto_26807 - SURFACE
      ?auto_26808 - SURFACE
      ?auto_26810 - TRUCK
      ?auto_26813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26809 ?auto_26812 ) ( IS-CRATE ?auto_26804 ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( not ( = ?auto_26806 ?auto_26812 ) ) ( HOIST-AT ?auto_26811 ?auto_26806 ) ( not ( = ?auto_26809 ?auto_26811 ) ) ( AVAILABLE ?auto_26811 ) ( SURFACE-AT ?auto_26804 ?auto_26806 ) ( ON ?auto_26804 ?auto_26807 ) ( CLEAR ?auto_26804 ) ( not ( = ?auto_26804 ?auto_26807 ) ) ( not ( = ?auto_26805 ?auto_26807 ) ) ( SURFACE-AT ?auto_26808 ?auto_26812 ) ( CLEAR ?auto_26808 ) ( IS-CRATE ?auto_26805 ) ( not ( = ?auto_26804 ?auto_26808 ) ) ( not ( = ?auto_26805 ?auto_26808 ) ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( AVAILABLE ?auto_26809 ) ( IN ?auto_26805 ?auto_26810 ) ( TRUCK-AT ?auto_26810 ?auto_26813 ) ( not ( = ?auto_26813 ?auto_26812 ) ) ( not ( = ?auto_26806 ?auto_26813 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26810 ?auto_26813 ?auto_26812 )
      ( MAKE-ON ?auto_26804 ?auto_26805 )
      ( MAKE-ON-VERIFY ?auto_26804 ?auto_26805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26814 - SURFACE
      ?auto_26815 - SURFACE
    )
    :vars
    (
      ?auto_26819 - HOIST
      ?auto_26816 - PLACE
      ?auto_26820 - PLACE
      ?auto_26821 - HOIST
      ?auto_26822 - SURFACE
      ?auto_26818 - SURFACE
      ?auto_26823 - TRUCK
      ?auto_26817 - PLACE
      ?auto_26824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26819 ?auto_26816 ) ( IS-CRATE ?auto_26814 ) ( not ( = ?auto_26814 ?auto_26815 ) ) ( not ( = ?auto_26820 ?auto_26816 ) ) ( HOIST-AT ?auto_26821 ?auto_26820 ) ( not ( = ?auto_26819 ?auto_26821 ) ) ( AVAILABLE ?auto_26821 ) ( SURFACE-AT ?auto_26814 ?auto_26820 ) ( ON ?auto_26814 ?auto_26822 ) ( CLEAR ?auto_26814 ) ( not ( = ?auto_26814 ?auto_26822 ) ) ( not ( = ?auto_26815 ?auto_26822 ) ) ( SURFACE-AT ?auto_26818 ?auto_26816 ) ( CLEAR ?auto_26818 ) ( IS-CRATE ?auto_26815 ) ( not ( = ?auto_26814 ?auto_26818 ) ) ( not ( = ?auto_26815 ?auto_26818 ) ) ( not ( = ?auto_26822 ?auto_26818 ) ) ( AVAILABLE ?auto_26819 ) ( TRUCK-AT ?auto_26823 ?auto_26817 ) ( not ( = ?auto_26817 ?auto_26816 ) ) ( not ( = ?auto_26820 ?auto_26817 ) ) ( HOIST-AT ?auto_26824 ?auto_26817 ) ( LIFTING ?auto_26824 ?auto_26815 ) ( not ( = ?auto_26819 ?auto_26824 ) ) ( not ( = ?auto_26821 ?auto_26824 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26824 ?auto_26815 ?auto_26823 ?auto_26817 )
      ( MAKE-ON ?auto_26814 ?auto_26815 )
      ( MAKE-ON-VERIFY ?auto_26814 ?auto_26815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26825 - SURFACE
      ?auto_26826 - SURFACE
    )
    :vars
    (
      ?auto_26833 - HOIST
      ?auto_26834 - PLACE
      ?auto_26835 - PLACE
      ?auto_26829 - HOIST
      ?auto_26830 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26828 - TRUCK
      ?auto_26827 - PLACE
      ?auto_26832 - HOIST
      ?auto_26836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26833 ?auto_26834 ) ( IS-CRATE ?auto_26825 ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26835 ?auto_26834 ) ) ( HOIST-AT ?auto_26829 ?auto_26835 ) ( not ( = ?auto_26833 ?auto_26829 ) ) ( AVAILABLE ?auto_26829 ) ( SURFACE-AT ?auto_26825 ?auto_26835 ) ( ON ?auto_26825 ?auto_26830 ) ( CLEAR ?auto_26825 ) ( not ( = ?auto_26825 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( SURFACE-AT ?auto_26831 ?auto_26834 ) ( CLEAR ?auto_26831 ) ( IS-CRATE ?auto_26826 ) ( not ( = ?auto_26825 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( AVAILABLE ?auto_26833 ) ( TRUCK-AT ?auto_26828 ?auto_26827 ) ( not ( = ?auto_26827 ?auto_26834 ) ) ( not ( = ?auto_26835 ?auto_26827 ) ) ( HOIST-AT ?auto_26832 ?auto_26827 ) ( not ( = ?auto_26833 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( AVAILABLE ?auto_26832 ) ( SURFACE-AT ?auto_26826 ?auto_26827 ) ( ON ?auto_26826 ?auto_26836 ) ( CLEAR ?auto_26826 ) ( not ( = ?auto_26825 ?auto_26836 ) ) ( not ( = ?auto_26826 ?auto_26836 ) ) ( not ( = ?auto_26830 ?auto_26836 ) ) ( not ( = ?auto_26831 ?auto_26836 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26832 ?auto_26826 ?auto_26836 ?auto_26827 )
      ( MAKE-ON ?auto_26825 ?auto_26826 )
      ( MAKE-ON-VERIFY ?auto_26825 ?auto_26826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26837 - SURFACE
      ?auto_26838 - SURFACE
    )
    :vars
    (
      ?auto_26842 - HOIST
      ?auto_26844 - PLACE
      ?auto_26847 - PLACE
      ?auto_26846 - HOIST
      ?auto_26841 - SURFACE
      ?auto_26843 - SURFACE
      ?auto_26839 - PLACE
      ?auto_26840 - HOIST
      ?auto_26848 - SURFACE
      ?auto_26845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26842 ?auto_26844 ) ( IS-CRATE ?auto_26837 ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26847 ?auto_26844 ) ) ( HOIST-AT ?auto_26846 ?auto_26847 ) ( not ( = ?auto_26842 ?auto_26846 ) ) ( AVAILABLE ?auto_26846 ) ( SURFACE-AT ?auto_26837 ?auto_26847 ) ( ON ?auto_26837 ?auto_26841 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26837 ?auto_26841 ) ) ( not ( = ?auto_26838 ?auto_26841 ) ) ( SURFACE-AT ?auto_26843 ?auto_26844 ) ( CLEAR ?auto_26843 ) ( IS-CRATE ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26843 ) ) ( not ( = ?auto_26838 ?auto_26843 ) ) ( not ( = ?auto_26841 ?auto_26843 ) ) ( AVAILABLE ?auto_26842 ) ( not ( = ?auto_26839 ?auto_26844 ) ) ( not ( = ?auto_26847 ?auto_26839 ) ) ( HOIST-AT ?auto_26840 ?auto_26839 ) ( not ( = ?auto_26842 ?auto_26840 ) ) ( not ( = ?auto_26846 ?auto_26840 ) ) ( AVAILABLE ?auto_26840 ) ( SURFACE-AT ?auto_26838 ?auto_26839 ) ( ON ?auto_26838 ?auto_26848 ) ( CLEAR ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26848 ) ) ( not ( = ?auto_26838 ?auto_26848 ) ) ( not ( = ?auto_26841 ?auto_26848 ) ) ( not ( = ?auto_26843 ?auto_26848 ) ) ( TRUCK-AT ?auto_26845 ?auto_26844 ) )
    :subtasks
    ( ( !DRIVE ?auto_26845 ?auto_26844 ?auto_26839 )
      ( MAKE-ON ?auto_26837 ?auto_26838 )
      ( MAKE-ON-VERIFY ?auto_26837 ?auto_26838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26849 - SURFACE
      ?auto_26850 - SURFACE
    )
    :vars
    (
      ?auto_26859 - HOIST
      ?auto_26854 - PLACE
      ?auto_26860 - PLACE
      ?auto_26853 - HOIST
      ?auto_26855 - SURFACE
      ?auto_26852 - SURFACE
      ?auto_26857 - PLACE
      ?auto_26851 - HOIST
      ?auto_26856 - SURFACE
      ?auto_26858 - TRUCK
      ?auto_26861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26859 ?auto_26854 ) ( IS-CRATE ?auto_26849 ) ( not ( = ?auto_26849 ?auto_26850 ) ) ( not ( = ?auto_26860 ?auto_26854 ) ) ( HOIST-AT ?auto_26853 ?auto_26860 ) ( not ( = ?auto_26859 ?auto_26853 ) ) ( AVAILABLE ?auto_26853 ) ( SURFACE-AT ?auto_26849 ?auto_26860 ) ( ON ?auto_26849 ?auto_26855 ) ( CLEAR ?auto_26849 ) ( not ( = ?auto_26849 ?auto_26855 ) ) ( not ( = ?auto_26850 ?auto_26855 ) ) ( IS-CRATE ?auto_26850 ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26850 ?auto_26852 ) ) ( not ( = ?auto_26855 ?auto_26852 ) ) ( not ( = ?auto_26857 ?auto_26854 ) ) ( not ( = ?auto_26860 ?auto_26857 ) ) ( HOIST-AT ?auto_26851 ?auto_26857 ) ( not ( = ?auto_26859 ?auto_26851 ) ) ( not ( = ?auto_26853 ?auto_26851 ) ) ( AVAILABLE ?auto_26851 ) ( SURFACE-AT ?auto_26850 ?auto_26857 ) ( ON ?auto_26850 ?auto_26856 ) ( CLEAR ?auto_26850 ) ( not ( = ?auto_26849 ?auto_26856 ) ) ( not ( = ?auto_26850 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26856 ) ) ( not ( = ?auto_26852 ?auto_26856 ) ) ( TRUCK-AT ?auto_26858 ?auto_26854 ) ( SURFACE-AT ?auto_26861 ?auto_26854 ) ( CLEAR ?auto_26861 ) ( LIFTING ?auto_26859 ?auto_26852 ) ( IS-CRATE ?auto_26852 ) ( not ( = ?auto_26849 ?auto_26861 ) ) ( not ( = ?auto_26850 ?auto_26861 ) ) ( not ( = ?auto_26855 ?auto_26861 ) ) ( not ( = ?auto_26852 ?auto_26861 ) ) ( not ( = ?auto_26856 ?auto_26861 ) ) )
    :subtasks
    ( ( !DROP ?auto_26859 ?auto_26852 ?auto_26861 ?auto_26854 )
      ( MAKE-ON ?auto_26849 ?auto_26850 )
      ( MAKE-ON-VERIFY ?auto_26849 ?auto_26850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26862 - SURFACE
      ?auto_26863 - SURFACE
    )
    :vars
    (
      ?auto_26864 - HOIST
      ?auto_26872 - PLACE
      ?auto_26869 - PLACE
      ?auto_26871 - HOIST
      ?auto_26873 - SURFACE
      ?auto_26874 - SURFACE
      ?auto_26868 - PLACE
      ?auto_26867 - HOIST
      ?auto_26866 - SURFACE
      ?auto_26870 - TRUCK
      ?auto_26865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26864 ?auto_26872 ) ( IS-CRATE ?auto_26862 ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( HOIST-AT ?auto_26871 ?auto_26869 ) ( not ( = ?auto_26864 ?auto_26871 ) ) ( AVAILABLE ?auto_26871 ) ( SURFACE-AT ?auto_26862 ?auto_26869 ) ( ON ?auto_26862 ?auto_26873 ) ( CLEAR ?auto_26862 ) ( not ( = ?auto_26862 ?auto_26873 ) ) ( not ( = ?auto_26863 ?auto_26873 ) ) ( IS-CRATE ?auto_26863 ) ( not ( = ?auto_26862 ?auto_26874 ) ) ( not ( = ?auto_26863 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26868 ?auto_26872 ) ) ( not ( = ?auto_26869 ?auto_26868 ) ) ( HOIST-AT ?auto_26867 ?auto_26868 ) ( not ( = ?auto_26864 ?auto_26867 ) ) ( not ( = ?auto_26871 ?auto_26867 ) ) ( AVAILABLE ?auto_26867 ) ( SURFACE-AT ?auto_26863 ?auto_26868 ) ( ON ?auto_26863 ?auto_26866 ) ( CLEAR ?auto_26863 ) ( not ( = ?auto_26862 ?auto_26866 ) ) ( not ( = ?auto_26863 ?auto_26866 ) ) ( not ( = ?auto_26873 ?auto_26866 ) ) ( not ( = ?auto_26874 ?auto_26866 ) ) ( TRUCK-AT ?auto_26870 ?auto_26872 ) ( SURFACE-AT ?auto_26865 ?auto_26872 ) ( CLEAR ?auto_26865 ) ( IS-CRATE ?auto_26874 ) ( not ( = ?auto_26862 ?auto_26865 ) ) ( not ( = ?auto_26863 ?auto_26865 ) ) ( not ( = ?auto_26873 ?auto_26865 ) ) ( not ( = ?auto_26874 ?auto_26865 ) ) ( not ( = ?auto_26866 ?auto_26865 ) ) ( AVAILABLE ?auto_26864 ) ( IN ?auto_26874 ?auto_26870 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26864 ?auto_26874 ?auto_26870 ?auto_26872 )
      ( MAKE-ON ?auto_26862 ?auto_26863 )
      ( MAKE-ON-VERIFY ?auto_26862 ?auto_26863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26875 - SURFACE
      ?auto_26876 - SURFACE
    )
    :vars
    (
      ?auto_26887 - HOIST
      ?auto_26877 - PLACE
      ?auto_26885 - PLACE
      ?auto_26879 - HOIST
      ?auto_26882 - SURFACE
      ?auto_26883 - SURFACE
      ?auto_26880 - PLACE
      ?auto_26884 - HOIST
      ?auto_26886 - SURFACE
      ?auto_26878 - SURFACE
      ?auto_26881 - TRUCK
      ?auto_26888 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26887 ?auto_26877 ) ( IS-CRATE ?auto_26875 ) ( not ( = ?auto_26875 ?auto_26876 ) ) ( not ( = ?auto_26885 ?auto_26877 ) ) ( HOIST-AT ?auto_26879 ?auto_26885 ) ( not ( = ?auto_26887 ?auto_26879 ) ) ( AVAILABLE ?auto_26879 ) ( SURFACE-AT ?auto_26875 ?auto_26885 ) ( ON ?auto_26875 ?auto_26882 ) ( CLEAR ?auto_26875 ) ( not ( = ?auto_26875 ?auto_26882 ) ) ( not ( = ?auto_26876 ?auto_26882 ) ) ( IS-CRATE ?auto_26876 ) ( not ( = ?auto_26875 ?auto_26883 ) ) ( not ( = ?auto_26876 ?auto_26883 ) ) ( not ( = ?auto_26882 ?auto_26883 ) ) ( not ( = ?auto_26880 ?auto_26877 ) ) ( not ( = ?auto_26885 ?auto_26880 ) ) ( HOIST-AT ?auto_26884 ?auto_26880 ) ( not ( = ?auto_26887 ?auto_26884 ) ) ( not ( = ?auto_26879 ?auto_26884 ) ) ( AVAILABLE ?auto_26884 ) ( SURFACE-AT ?auto_26876 ?auto_26880 ) ( ON ?auto_26876 ?auto_26886 ) ( CLEAR ?auto_26876 ) ( not ( = ?auto_26875 ?auto_26886 ) ) ( not ( = ?auto_26876 ?auto_26886 ) ) ( not ( = ?auto_26882 ?auto_26886 ) ) ( not ( = ?auto_26883 ?auto_26886 ) ) ( SURFACE-AT ?auto_26878 ?auto_26877 ) ( CLEAR ?auto_26878 ) ( IS-CRATE ?auto_26883 ) ( not ( = ?auto_26875 ?auto_26878 ) ) ( not ( = ?auto_26876 ?auto_26878 ) ) ( not ( = ?auto_26882 ?auto_26878 ) ) ( not ( = ?auto_26883 ?auto_26878 ) ) ( not ( = ?auto_26886 ?auto_26878 ) ) ( AVAILABLE ?auto_26887 ) ( IN ?auto_26883 ?auto_26881 ) ( TRUCK-AT ?auto_26881 ?auto_26888 ) ( not ( = ?auto_26888 ?auto_26877 ) ) ( not ( = ?auto_26885 ?auto_26888 ) ) ( not ( = ?auto_26880 ?auto_26888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26881 ?auto_26888 ?auto_26877 )
      ( MAKE-ON ?auto_26875 ?auto_26876 )
      ( MAKE-ON-VERIFY ?auto_26875 ?auto_26876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26889 - SURFACE
      ?auto_26890 - SURFACE
    )
    :vars
    (
      ?auto_26894 - HOIST
      ?auto_26902 - PLACE
      ?auto_26896 - PLACE
      ?auto_26901 - HOIST
      ?auto_26898 - SURFACE
      ?auto_26895 - SURFACE
      ?auto_26893 - PLACE
      ?auto_26899 - HOIST
      ?auto_26900 - SURFACE
      ?auto_26891 - SURFACE
      ?auto_26897 - TRUCK
      ?auto_26892 - PLACE
      ?auto_26903 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26894 ?auto_26902 ) ( IS-CRATE ?auto_26889 ) ( not ( = ?auto_26889 ?auto_26890 ) ) ( not ( = ?auto_26896 ?auto_26902 ) ) ( HOIST-AT ?auto_26901 ?auto_26896 ) ( not ( = ?auto_26894 ?auto_26901 ) ) ( AVAILABLE ?auto_26901 ) ( SURFACE-AT ?auto_26889 ?auto_26896 ) ( ON ?auto_26889 ?auto_26898 ) ( CLEAR ?auto_26889 ) ( not ( = ?auto_26889 ?auto_26898 ) ) ( not ( = ?auto_26890 ?auto_26898 ) ) ( IS-CRATE ?auto_26890 ) ( not ( = ?auto_26889 ?auto_26895 ) ) ( not ( = ?auto_26890 ?auto_26895 ) ) ( not ( = ?auto_26898 ?auto_26895 ) ) ( not ( = ?auto_26893 ?auto_26902 ) ) ( not ( = ?auto_26896 ?auto_26893 ) ) ( HOIST-AT ?auto_26899 ?auto_26893 ) ( not ( = ?auto_26894 ?auto_26899 ) ) ( not ( = ?auto_26901 ?auto_26899 ) ) ( AVAILABLE ?auto_26899 ) ( SURFACE-AT ?auto_26890 ?auto_26893 ) ( ON ?auto_26890 ?auto_26900 ) ( CLEAR ?auto_26890 ) ( not ( = ?auto_26889 ?auto_26900 ) ) ( not ( = ?auto_26890 ?auto_26900 ) ) ( not ( = ?auto_26898 ?auto_26900 ) ) ( not ( = ?auto_26895 ?auto_26900 ) ) ( SURFACE-AT ?auto_26891 ?auto_26902 ) ( CLEAR ?auto_26891 ) ( IS-CRATE ?auto_26895 ) ( not ( = ?auto_26889 ?auto_26891 ) ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26898 ?auto_26891 ) ) ( not ( = ?auto_26895 ?auto_26891 ) ) ( not ( = ?auto_26900 ?auto_26891 ) ) ( AVAILABLE ?auto_26894 ) ( TRUCK-AT ?auto_26897 ?auto_26892 ) ( not ( = ?auto_26892 ?auto_26902 ) ) ( not ( = ?auto_26896 ?auto_26892 ) ) ( not ( = ?auto_26893 ?auto_26892 ) ) ( HOIST-AT ?auto_26903 ?auto_26892 ) ( LIFTING ?auto_26903 ?auto_26895 ) ( not ( = ?auto_26894 ?auto_26903 ) ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26899 ?auto_26903 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26903 ?auto_26895 ?auto_26897 ?auto_26892 )
      ( MAKE-ON ?auto_26889 ?auto_26890 )
      ( MAKE-ON-VERIFY ?auto_26889 ?auto_26890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26904 - SURFACE
      ?auto_26905 - SURFACE
    )
    :vars
    (
      ?auto_26917 - HOIST
      ?auto_26909 - PLACE
      ?auto_26907 - PLACE
      ?auto_26916 - HOIST
      ?auto_26908 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26911 - PLACE
      ?auto_26914 - HOIST
      ?auto_26910 - SURFACE
      ?auto_26906 - SURFACE
      ?auto_26913 - TRUCK
      ?auto_26918 - PLACE
      ?auto_26912 - HOIST
      ?auto_26919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26917 ?auto_26909 ) ( IS-CRATE ?auto_26904 ) ( not ( = ?auto_26904 ?auto_26905 ) ) ( not ( = ?auto_26907 ?auto_26909 ) ) ( HOIST-AT ?auto_26916 ?auto_26907 ) ( not ( = ?auto_26917 ?auto_26916 ) ) ( AVAILABLE ?auto_26916 ) ( SURFACE-AT ?auto_26904 ?auto_26907 ) ( ON ?auto_26904 ?auto_26908 ) ( CLEAR ?auto_26904 ) ( not ( = ?auto_26904 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( IS-CRATE ?auto_26905 ) ( not ( = ?auto_26904 ?auto_26915 ) ) ( not ( = ?auto_26905 ?auto_26915 ) ) ( not ( = ?auto_26908 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26911 ) ) ( HOIST-AT ?auto_26914 ?auto_26911 ) ( not ( = ?auto_26917 ?auto_26914 ) ) ( not ( = ?auto_26916 ?auto_26914 ) ) ( AVAILABLE ?auto_26914 ) ( SURFACE-AT ?auto_26905 ?auto_26911 ) ( ON ?auto_26905 ?auto_26910 ) ( CLEAR ?auto_26905 ) ( not ( = ?auto_26904 ?auto_26910 ) ) ( not ( = ?auto_26905 ?auto_26910 ) ) ( not ( = ?auto_26908 ?auto_26910 ) ) ( not ( = ?auto_26915 ?auto_26910 ) ) ( SURFACE-AT ?auto_26906 ?auto_26909 ) ( CLEAR ?auto_26906 ) ( IS-CRATE ?auto_26915 ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26908 ?auto_26906 ) ) ( not ( = ?auto_26915 ?auto_26906 ) ) ( not ( = ?auto_26910 ?auto_26906 ) ) ( AVAILABLE ?auto_26917 ) ( TRUCK-AT ?auto_26913 ?auto_26918 ) ( not ( = ?auto_26918 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( HOIST-AT ?auto_26912 ?auto_26918 ) ( not ( = ?auto_26917 ?auto_26912 ) ) ( not ( = ?auto_26916 ?auto_26912 ) ) ( not ( = ?auto_26914 ?auto_26912 ) ) ( AVAILABLE ?auto_26912 ) ( SURFACE-AT ?auto_26915 ?auto_26918 ) ( ON ?auto_26915 ?auto_26919 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26904 ?auto_26919 ) ) ( not ( = ?auto_26905 ?auto_26919 ) ) ( not ( = ?auto_26908 ?auto_26919 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26910 ?auto_26919 ) ) ( not ( = ?auto_26906 ?auto_26919 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26912 ?auto_26915 ?auto_26919 ?auto_26918 )
      ( MAKE-ON ?auto_26904 ?auto_26905 )
      ( MAKE-ON-VERIFY ?auto_26904 ?auto_26905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26920 - SURFACE
      ?auto_26921 - SURFACE
    )
    :vars
    (
      ?auto_26930 - HOIST
      ?auto_26935 - PLACE
      ?auto_26931 - PLACE
      ?auto_26934 - HOIST
      ?auto_26926 - SURFACE
      ?auto_26925 - SURFACE
      ?auto_26932 - PLACE
      ?auto_26927 - HOIST
      ?auto_26933 - SURFACE
      ?auto_26929 - SURFACE
      ?auto_26924 - PLACE
      ?auto_26923 - HOIST
      ?auto_26928 - SURFACE
      ?auto_26922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26930 ?auto_26935 ) ( IS-CRATE ?auto_26920 ) ( not ( = ?auto_26920 ?auto_26921 ) ) ( not ( = ?auto_26931 ?auto_26935 ) ) ( HOIST-AT ?auto_26934 ?auto_26931 ) ( not ( = ?auto_26930 ?auto_26934 ) ) ( AVAILABLE ?auto_26934 ) ( SURFACE-AT ?auto_26920 ?auto_26931 ) ( ON ?auto_26920 ?auto_26926 ) ( CLEAR ?auto_26920 ) ( not ( = ?auto_26920 ?auto_26926 ) ) ( not ( = ?auto_26921 ?auto_26926 ) ) ( IS-CRATE ?auto_26921 ) ( not ( = ?auto_26920 ?auto_26925 ) ) ( not ( = ?auto_26921 ?auto_26925 ) ) ( not ( = ?auto_26926 ?auto_26925 ) ) ( not ( = ?auto_26932 ?auto_26935 ) ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( HOIST-AT ?auto_26927 ?auto_26932 ) ( not ( = ?auto_26930 ?auto_26927 ) ) ( not ( = ?auto_26934 ?auto_26927 ) ) ( AVAILABLE ?auto_26927 ) ( SURFACE-AT ?auto_26921 ?auto_26932 ) ( ON ?auto_26921 ?auto_26933 ) ( CLEAR ?auto_26921 ) ( not ( = ?auto_26920 ?auto_26933 ) ) ( not ( = ?auto_26921 ?auto_26933 ) ) ( not ( = ?auto_26926 ?auto_26933 ) ) ( not ( = ?auto_26925 ?auto_26933 ) ) ( SURFACE-AT ?auto_26929 ?auto_26935 ) ( CLEAR ?auto_26929 ) ( IS-CRATE ?auto_26925 ) ( not ( = ?auto_26920 ?auto_26929 ) ) ( not ( = ?auto_26921 ?auto_26929 ) ) ( not ( = ?auto_26926 ?auto_26929 ) ) ( not ( = ?auto_26925 ?auto_26929 ) ) ( not ( = ?auto_26933 ?auto_26929 ) ) ( AVAILABLE ?auto_26930 ) ( not ( = ?auto_26924 ?auto_26935 ) ) ( not ( = ?auto_26931 ?auto_26924 ) ) ( not ( = ?auto_26932 ?auto_26924 ) ) ( HOIST-AT ?auto_26923 ?auto_26924 ) ( not ( = ?auto_26930 ?auto_26923 ) ) ( not ( = ?auto_26934 ?auto_26923 ) ) ( not ( = ?auto_26927 ?auto_26923 ) ) ( AVAILABLE ?auto_26923 ) ( SURFACE-AT ?auto_26925 ?auto_26924 ) ( ON ?auto_26925 ?auto_26928 ) ( CLEAR ?auto_26925 ) ( not ( = ?auto_26920 ?auto_26928 ) ) ( not ( = ?auto_26921 ?auto_26928 ) ) ( not ( = ?auto_26926 ?auto_26928 ) ) ( not ( = ?auto_26925 ?auto_26928 ) ) ( not ( = ?auto_26933 ?auto_26928 ) ) ( not ( = ?auto_26929 ?auto_26928 ) ) ( TRUCK-AT ?auto_26922 ?auto_26935 ) )
    :subtasks
    ( ( !DRIVE ?auto_26922 ?auto_26935 ?auto_26924 )
      ( MAKE-ON ?auto_26920 ?auto_26921 )
      ( MAKE-ON-VERIFY ?auto_26920 ?auto_26921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26936 - SURFACE
      ?auto_26937 - SURFACE
    )
    :vars
    (
      ?auto_26949 - HOIST
      ?auto_26947 - PLACE
      ?auto_26943 - PLACE
      ?auto_26941 - HOIST
      ?auto_26942 - SURFACE
      ?auto_26950 - SURFACE
      ?auto_26945 - PLACE
      ?auto_26944 - HOIST
      ?auto_26951 - SURFACE
      ?auto_26939 - SURFACE
      ?auto_26946 - PLACE
      ?auto_26940 - HOIST
      ?auto_26938 - SURFACE
      ?auto_26948 - TRUCK
      ?auto_26952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26949 ?auto_26947 ) ( IS-CRATE ?auto_26936 ) ( not ( = ?auto_26936 ?auto_26937 ) ) ( not ( = ?auto_26943 ?auto_26947 ) ) ( HOIST-AT ?auto_26941 ?auto_26943 ) ( not ( = ?auto_26949 ?auto_26941 ) ) ( AVAILABLE ?auto_26941 ) ( SURFACE-AT ?auto_26936 ?auto_26943 ) ( ON ?auto_26936 ?auto_26942 ) ( CLEAR ?auto_26936 ) ( not ( = ?auto_26936 ?auto_26942 ) ) ( not ( = ?auto_26937 ?auto_26942 ) ) ( IS-CRATE ?auto_26937 ) ( not ( = ?auto_26936 ?auto_26950 ) ) ( not ( = ?auto_26937 ?auto_26950 ) ) ( not ( = ?auto_26942 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26943 ?auto_26945 ) ) ( HOIST-AT ?auto_26944 ?auto_26945 ) ( not ( = ?auto_26949 ?auto_26944 ) ) ( not ( = ?auto_26941 ?auto_26944 ) ) ( AVAILABLE ?auto_26944 ) ( SURFACE-AT ?auto_26937 ?auto_26945 ) ( ON ?auto_26937 ?auto_26951 ) ( CLEAR ?auto_26937 ) ( not ( = ?auto_26936 ?auto_26951 ) ) ( not ( = ?auto_26937 ?auto_26951 ) ) ( not ( = ?auto_26942 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( IS-CRATE ?auto_26950 ) ( not ( = ?auto_26936 ?auto_26939 ) ) ( not ( = ?auto_26937 ?auto_26939 ) ) ( not ( = ?auto_26942 ?auto_26939 ) ) ( not ( = ?auto_26950 ?auto_26939 ) ) ( not ( = ?auto_26951 ?auto_26939 ) ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26943 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( HOIST-AT ?auto_26940 ?auto_26946 ) ( not ( = ?auto_26949 ?auto_26940 ) ) ( not ( = ?auto_26941 ?auto_26940 ) ) ( not ( = ?auto_26944 ?auto_26940 ) ) ( AVAILABLE ?auto_26940 ) ( SURFACE-AT ?auto_26950 ?auto_26946 ) ( ON ?auto_26950 ?auto_26938 ) ( CLEAR ?auto_26950 ) ( not ( = ?auto_26936 ?auto_26938 ) ) ( not ( = ?auto_26937 ?auto_26938 ) ) ( not ( = ?auto_26942 ?auto_26938 ) ) ( not ( = ?auto_26950 ?auto_26938 ) ) ( not ( = ?auto_26951 ?auto_26938 ) ) ( not ( = ?auto_26939 ?auto_26938 ) ) ( TRUCK-AT ?auto_26948 ?auto_26947 ) ( SURFACE-AT ?auto_26952 ?auto_26947 ) ( CLEAR ?auto_26952 ) ( LIFTING ?auto_26949 ?auto_26939 ) ( IS-CRATE ?auto_26939 ) ( not ( = ?auto_26936 ?auto_26952 ) ) ( not ( = ?auto_26937 ?auto_26952 ) ) ( not ( = ?auto_26942 ?auto_26952 ) ) ( not ( = ?auto_26950 ?auto_26952 ) ) ( not ( = ?auto_26951 ?auto_26952 ) ) ( not ( = ?auto_26939 ?auto_26952 ) ) ( not ( = ?auto_26938 ?auto_26952 ) ) )
    :subtasks
    ( ( !DROP ?auto_26949 ?auto_26939 ?auto_26952 ?auto_26947 )
      ( MAKE-ON ?auto_26936 ?auto_26937 )
      ( MAKE-ON-VERIFY ?auto_26936 ?auto_26937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26953 - SURFACE
      ?auto_26954 - SURFACE
    )
    :vars
    (
      ?auto_26962 - HOIST
      ?auto_26955 - PLACE
      ?auto_26961 - PLACE
      ?auto_26966 - HOIST
      ?auto_26959 - SURFACE
      ?auto_26958 - SURFACE
      ?auto_26960 - PLACE
      ?auto_26968 - HOIST
      ?auto_26964 - SURFACE
      ?auto_26965 - SURFACE
      ?auto_26963 - PLACE
      ?auto_26957 - HOIST
      ?auto_26956 - SURFACE
      ?auto_26969 - TRUCK
      ?auto_26967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26962 ?auto_26955 ) ( IS-CRATE ?auto_26953 ) ( not ( = ?auto_26953 ?auto_26954 ) ) ( not ( = ?auto_26961 ?auto_26955 ) ) ( HOIST-AT ?auto_26966 ?auto_26961 ) ( not ( = ?auto_26962 ?auto_26966 ) ) ( AVAILABLE ?auto_26966 ) ( SURFACE-AT ?auto_26953 ?auto_26961 ) ( ON ?auto_26953 ?auto_26959 ) ( CLEAR ?auto_26953 ) ( not ( = ?auto_26953 ?auto_26959 ) ) ( not ( = ?auto_26954 ?auto_26959 ) ) ( IS-CRATE ?auto_26954 ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( not ( = ?auto_26959 ?auto_26958 ) ) ( not ( = ?auto_26960 ?auto_26955 ) ) ( not ( = ?auto_26961 ?auto_26960 ) ) ( HOIST-AT ?auto_26968 ?auto_26960 ) ( not ( = ?auto_26962 ?auto_26968 ) ) ( not ( = ?auto_26966 ?auto_26968 ) ) ( AVAILABLE ?auto_26968 ) ( SURFACE-AT ?auto_26954 ?auto_26960 ) ( ON ?auto_26954 ?auto_26964 ) ( CLEAR ?auto_26954 ) ( not ( = ?auto_26953 ?auto_26964 ) ) ( not ( = ?auto_26954 ?auto_26964 ) ) ( not ( = ?auto_26959 ?auto_26964 ) ) ( not ( = ?auto_26958 ?auto_26964 ) ) ( IS-CRATE ?auto_26958 ) ( not ( = ?auto_26953 ?auto_26965 ) ) ( not ( = ?auto_26954 ?auto_26965 ) ) ( not ( = ?auto_26959 ?auto_26965 ) ) ( not ( = ?auto_26958 ?auto_26965 ) ) ( not ( = ?auto_26964 ?auto_26965 ) ) ( not ( = ?auto_26963 ?auto_26955 ) ) ( not ( = ?auto_26961 ?auto_26963 ) ) ( not ( = ?auto_26960 ?auto_26963 ) ) ( HOIST-AT ?auto_26957 ?auto_26963 ) ( not ( = ?auto_26962 ?auto_26957 ) ) ( not ( = ?auto_26966 ?auto_26957 ) ) ( not ( = ?auto_26968 ?auto_26957 ) ) ( AVAILABLE ?auto_26957 ) ( SURFACE-AT ?auto_26958 ?auto_26963 ) ( ON ?auto_26958 ?auto_26956 ) ( CLEAR ?auto_26958 ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26954 ?auto_26956 ) ) ( not ( = ?auto_26959 ?auto_26956 ) ) ( not ( = ?auto_26958 ?auto_26956 ) ) ( not ( = ?auto_26964 ?auto_26956 ) ) ( not ( = ?auto_26965 ?auto_26956 ) ) ( TRUCK-AT ?auto_26969 ?auto_26955 ) ( SURFACE-AT ?auto_26967 ?auto_26955 ) ( CLEAR ?auto_26967 ) ( IS-CRATE ?auto_26965 ) ( not ( = ?auto_26953 ?auto_26967 ) ) ( not ( = ?auto_26954 ?auto_26967 ) ) ( not ( = ?auto_26959 ?auto_26967 ) ) ( not ( = ?auto_26958 ?auto_26967 ) ) ( not ( = ?auto_26964 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26967 ) ) ( not ( = ?auto_26956 ?auto_26967 ) ) ( AVAILABLE ?auto_26962 ) ( IN ?auto_26965 ?auto_26969 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26962 ?auto_26965 ?auto_26969 ?auto_26955 )
      ( MAKE-ON ?auto_26953 ?auto_26954 )
      ( MAKE-ON-VERIFY ?auto_26953 ?auto_26954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26970 - SURFACE
      ?auto_26971 - SURFACE
    )
    :vars
    (
      ?auto_26972 - HOIST
      ?auto_26979 - PLACE
      ?auto_26985 - PLACE
      ?auto_26983 - HOIST
      ?auto_26973 - SURFACE
      ?auto_26980 - SURFACE
      ?auto_26982 - PLACE
      ?auto_26978 - HOIST
      ?auto_26975 - SURFACE
      ?auto_26976 - SURFACE
      ?auto_26986 - PLACE
      ?auto_26981 - HOIST
      ?auto_26977 - SURFACE
      ?auto_26974 - SURFACE
      ?auto_26984 - TRUCK
      ?auto_26987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26972 ?auto_26979 ) ( IS-CRATE ?auto_26970 ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26985 ?auto_26979 ) ) ( HOIST-AT ?auto_26983 ?auto_26985 ) ( not ( = ?auto_26972 ?auto_26983 ) ) ( AVAILABLE ?auto_26983 ) ( SURFACE-AT ?auto_26970 ?auto_26985 ) ( ON ?auto_26970 ?auto_26973 ) ( CLEAR ?auto_26970 ) ( not ( = ?auto_26970 ?auto_26973 ) ) ( not ( = ?auto_26971 ?auto_26973 ) ) ( IS-CRATE ?auto_26971 ) ( not ( = ?auto_26970 ?auto_26980 ) ) ( not ( = ?auto_26971 ?auto_26980 ) ) ( not ( = ?auto_26973 ?auto_26980 ) ) ( not ( = ?auto_26982 ?auto_26979 ) ) ( not ( = ?auto_26985 ?auto_26982 ) ) ( HOIST-AT ?auto_26978 ?auto_26982 ) ( not ( = ?auto_26972 ?auto_26978 ) ) ( not ( = ?auto_26983 ?auto_26978 ) ) ( AVAILABLE ?auto_26978 ) ( SURFACE-AT ?auto_26971 ?auto_26982 ) ( ON ?auto_26971 ?auto_26975 ) ( CLEAR ?auto_26971 ) ( not ( = ?auto_26970 ?auto_26975 ) ) ( not ( = ?auto_26971 ?auto_26975 ) ) ( not ( = ?auto_26973 ?auto_26975 ) ) ( not ( = ?auto_26980 ?auto_26975 ) ) ( IS-CRATE ?auto_26980 ) ( not ( = ?auto_26970 ?auto_26976 ) ) ( not ( = ?auto_26971 ?auto_26976 ) ) ( not ( = ?auto_26973 ?auto_26976 ) ) ( not ( = ?auto_26980 ?auto_26976 ) ) ( not ( = ?auto_26975 ?auto_26976 ) ) ( not ( = ?auto_26986 ?auto_26979 ) ) ( not ( = ?auto_26985 ?auto_26986 ) ) ( not ( = ?auto_26982 ?auto_26986 ) ) ( HOIST-AT ?auto_26981 ?auto_26986 ) ( not ( = ?auto_26972 ?auto_26981 ) ) ( not ( = ?auto_26983 ?auto_26981 ) ) ( not ( = ?auto_26978 ?auto_26981 ) ) ( AVAILABLE ?auto_26981 ) ( SURFACE-AT ?auto_26980 ?auto_26986 ) ( ON ?auto_26980 ?auto_26977 ) ( CLEAR ?auto_26980 ) ( not ( = ?auto_26970 ?auto_26977 ) ) ( not ( = ?auto_26971 ?auto_26977 ) ) ( not ( = ?auto_26973 ?auto_26977 ) ) ( not ( = ?auto_26980 ?auto_26977 ) ) ( not ( = ?auto_26975 ?auto_26977 ) ) ( not ( = ?auto_26976 ?auto_26977 ) ) ( SURFACE-AT ?auto_26974 ?auto_26979 ) ( CLEAR ?auto_26974 ) ( IS-CRATE ?auto_26976 ) ( not ( = ?auto_26970 ?auto_26974 ) ) ( not ( = ?auto_26971 ?auto_26974 ) ) ( not ( = ?auto_26973 ?auto_26974 ) ) ( not ( = ?auto_26980 ?auto_26974 ) ) ( not ( = ?auto_26975 ?auto_26974 ) ) ( not ( = ?auto_26976 ?auto_26974 ) ) ( not ( = ?auto_26977 ?auto_26974 ) ) ( AVAILABLE ?auto_26972 ) ( IN ?auto_26976 ?auto_26984 ) ( TRUCK-AT ?auto_26984 ?auto_26987 ) ( not ( = ?auto_26987 ?auto_26979 ) ) ( not ( = ?auto_26985 ?auto_26987 ) ) ( not ( = ?auto_26982 ?auto_26987 ) ) ( not ( = ?auto_26986 ?auto_26987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26984 ?auto_26987 ?auto_26979 )
      ( MAKE-ON ?auto_26970 ?auto_26971 )
      ( MAKE-ON-VERIFY ?auto_26970 ?auto_26971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26988 - SURFACE
      ?auto_26989 - SURFACE
    )
    :vars
    (
      ?auto_27000 - HOIST
      ?auto_26995 - PLACE
      ?auto_26993 - PLACE
      ?auto_26991 - HOIST
      ?auto_26998 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_27005 - PLACE
      ?auto_27002 - HOIST
      ?auto_27004 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26994 - PLACE
      ?auto_27003 - HOIST
      ?auto_26996 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26992 - TRUCK
      ?auto_27001 - PLACE
      ?auto_27006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27000 ?auto_26995 ) ( IS-CRATE ?auto_26988 ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( HOIST-AT ?auto_26991 ?auto_26993 ) ( not ( = ?auto_27000 ?auto_26991 ) ) ( AVAILABLE ?auto_26991 ) ( SURFACE-AT ?auto_26988 ?auto_26993 ) ( ON ?auto_26988 ?auto_26998 ) ( CLEAR ?auto_26988 ) ( not ( = ?auto_26988 ?auto_26998 ) ) ( not ( = ?auto_26989 ?auto_26998 ) ) ( IS-CRATE ?auto_26989 ) ( not ( = ?auto_26988 ?auto_26999 ) ) ( not ( = ?auto_26989 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_27005 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_27005 ) ) ( HOIST-AT ?auto_27002 ?auto_27005 ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_26991 ?auto_27002 ) ) ( AVAILABLE ?auto_27002 ) ( SURFACE-AT ?auto_26989 ?auto_27005 ) ( ON ?auto_26989 ?auto_27004 ) ( CLEAR ?auto_26989 ) ( not ( = ?auto_26988 ?auto_27004 ) ) ( not ( = ?auto_26989 ?auto_27004 ) ) ( not ( = ?auto_26998 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26998 ?auto_26990 ) ) ( not ( = ?auto_26999 ?auto_26990 ) ) ( not ( = ?auto_27004 ?auto_26990 ) ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_26994 ) ) ( not ( = ?auto_27005 ?auto_26994 ) ) ( HOIST-AT ?auto_27003 ?auto_26994 ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_26991 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( AVAILABLE ?auto_27003 ) ( SURFACE-AT ?auto_26999 ?auto_26994 ) ( ON ?auto_26999 ?auto_26996 ) ( CLEAR ?auto_26999 ) ( not ( = ?auto_26988 ?auto_26996 ) ) ( not ( = ?auto_26989 ?auto_26996 ) ) ( not ( = ?auto_26998 ?auto_26996 ) ) ( not ( = ?auto_26999 ?auto_26996 ) ) ( not ( = ?auto_27004 ?auto_26996 ) ) ( not ( = ?auto_26990 ?auto_26996 ) ) ( SURFACE-AT ?auto_26997 ?auto_26995 ) ( CLEAR ?auto_26997 ) ( IS-CRATE ?auto_26990 ) ( not ( = ?auto_26988 ?auto_26997 ) ) ( not ( = ?auto_26989 ?auto_26997 ) ) ( not ( = ?auto_26998 ?auto_26997 ) ) ( not ( = ?auto_26999 ?auto_26997 ) ) ( not ( = ?auto_27004 ?auto_26997 ) ) ( not ( = ?auto_26990 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( AVAILABLE ?auto_27000 ) ( TRUCK-AT ?auto_26992 ?auto_27001 ) ( not ( = ?auto_27001 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_27001 ) ) ( not ( = ?auto_27005 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( HOIST-AT ?auto_27006 ?auto_27001 ) ( LIFTING ?auto_27006 ?auto_26990 ) ( not ( = ?auto_27000 ?auto_27006 ) ) ( not ( = ?auto_26991 ?auto_27006 ) ) ( not ( = ?auto_27002 ?auto_27006 ) ) ( not ( = ?auto_27003 ?auto_27006 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27006 ?auto_26990 ?auto_26992 ?auto_27001 )
      ( MAKE-ON ?auto_26988 ?auto_26989 )
      ( MAKE-ON-VERIFY ?auto_26988 ?auto_26989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27007 - SURFACE
      ?auto_27008 - SURFACE
    )
    :vars
    (
      ?auto_27014 - HOIST
      ?auto_27017 - PLACE
      ?auto_27011 - PLACE
      ?auto_27024 - HOIST
      ?auto_27010 - SURFACE
      ?auto_27019 - SURFACE
      ?auto_27009 - PLACE
      ?auto_27025 - HOIST
      ?auto_27016 - SURFACE
      ?auto_27015 - SURFACE
      ?auto_27013 - PLACE
      ?auto_27012 - HOIST
      ?auto_27020 - SURFACE
      ?auto_27023 - SURFACE
      ?auto_27022 - TRUCK
      ?auto_27018 - PLACE
      ?auto_27021 - HOIST
      ?auto_27026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27014 ?auto_27017 ) ( IS-CRATE ?auto_27007 ) ( not ( = ?auto_27007 ?auto_27008 ) ) ( not ( = ?auto_27011 ?auto_27017 ) ) ( HOIST-AT ?auto_27024 ?auto_27011 ) ( not ( = ?auto_27014 ?auto_27024 ) ) ( AVAILABLE ?auto_27024 ) ( SURFACE-AT ?auto_27007 ?auto_27011 ) ( ON ?auto_27007 ?auto_27010 ) ( CLEAR ?auto_27007 ) ( not ( = ?auto_27007 ?auto_27010 ) ) ( not ( = ?auto_27008 ?auto_27010 ) ) ( IS-CRATE ?auto_27008 ) ( not ( = ?auto_27007 ?auto_27019 ) ) ( not ( = ?auto_27008 ?auto_27019 ) ) ( not ( = ?auto_27010 ?auto_27019 ) ) ( not ( = ?auto_27009 ?auto_27017 ) ) ( not ( = ?auto_27011 ?auto_27009 ) ) ( HOIST-AT ?auto_27025 ?auto_27009 ) ( not ( = ?auto_27014 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( AVAILABLE ?auto_27025 ) ( SURFACE-AT ?auto_27008 ?auto_27009 ) ( ON ?auto_27008 ?auto_27016 ) ( CLEAR ?auto_27008 ) ( not ( = ?auto_27007 ?auto_27016 ) ) ( not ( = ?auto_27008 ?auto_27016 ) ) ( not ( = ?auto_27010 ?auto_27016 ) ) ( not ( = ?auto_27019 ?auto_27016 ) ) ( IS-CRATE ?auto_27019 ) ( not ( = ?auto_27007 ?auto_27015 ) ) ( not ( = ?auto_27008 ?auto_27015 ) ) ( not ( = ?auto_27010 ?auto_27015 ) ) ( not ( = ?auto_27019 ?auto_27015 ) ) ( not ( = ?auto_27016 ?auto_27015 ) ) ( not ( = ?auto_27013 ?auto_27017 ) ) ( not ( = ?auto_27011 ?auto_27013 ) ) ( not ( = ?auto_27009 ?auto_27013 ) ) ( HOIST-AT ?auto_27012 ?auto_27013 ) ( not ( = ?auto_27014 ?auto_27012 ) ) ( not ( = ?auto_27024 ?auto_27012 ) ) ( not ( = ?auto_27025 ?auto_27012 ) ) ( AVAILABLE ?auto_27012 ) ( SURFACE-AT ?auto_27019 ?auto_27013 ) ( ON ?auto_27019 ?auto_27020 ) ( CLEAR ?auto_27019 ) ( not ( = ?auto_27007 ?auto_27020 ) ) ( not ( = ?auto_27008 ?auto_27020 ) ) ( not ( = ?auto_27010 ?auto_27020 ) ) ( not ( = ?auto_27019 ?auto_27020 ) ) ( not ( = ?auto_27016 ?auto_27020 ) ) ( not ( = ?auto_27015 ?auto_27020 ) ) ( SURFACE-AT ?auto_27023 ?auto_27017 ) ( CLEAR ?auto_27023 ) ( IS-CRATE ?auto_27015 ) ( not ( = ?auto_27007 ?auto_27023 ) ) ( not ( = ?auto_27008 ?auto_27023 ) ) ( not ( = ?auto_27010 ?auto_27023 ) ) ( not ( = ?auto_27019 ?auto_27023 ) ) ( not ( = ?auto_27016 ?auto_27023 ) ) ( not ( = ?auto_27015 ?auto_27023 ) ) ( not ( = ?auto_27020 ?auto_27023 ) ) ( AVAILABLE ?auto_27014 ) ( TRUCK-AT ?auto_27022 ?auto_27018 ) ( not ( = ?auto_27018 ?auto_27017 ) ) ( not ( = ?auto_27011 ?auto_27018 ) ) ( not ( = ?auto_27009 ?auto_27018 ) ) ( not ( = ?auto_27013 ?auto_27018 ) ) ( HOIST-AT ?auto_27021 ?auto_27018 ) ( not ( = ?auto_27014 ?auto_27021 ) ) ( not ( = ?auto_27024 ?auto_27021 ) ) ( not ( = ?auto_27025 ?auto_27021 ) ) ( not ( = ?auto_27012 ?auto_27021 ) ) ( AVAILABLE ?auto_27021 ) ( SURFACE-AT ?auto_27015 ?auto_27018 ) ( ON ?auto_27015 ?auto_27026 ) ( CLEAR ?auto_27015 ) ( not ( = ?auto_27007 ?auto_27026 ) ) ( not ( = ?auto_27008 ?auto_27026 ) ) ( not ( = ?auto_27010 ?auto_27026 ) ) ( not ( = ?auto_27019 ?auto_27026 ) ) ( not ( = ?auto_27016 ?auto_27026 ) ) ( not ( = ?auto_27015 ?auto_27026 ) ) ( not ( = ?auto_27020 ?auto_27026 ) ) ( not ( = ?auto_27023 ?auto_27026 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27021 ?auto_27015 ?auto_27026 ?auto_27018 )
      ( MAKE-ON ?auto_27007 ?auto_27008 )
      ( MAKE-ON-VERIFY ?auto_27007 ?auto_27008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27027 - SURFACE
      ?auto_27028 - SURFACE
    )
    :vars
    (
      ?auto_27042 - HOIST
      ?auto_27037 - PLACE
      ?auto_27030 - PLACE
      ?auto_27039 - HOIST
      ?auto_27031 - SURFACE
      ?auto_27043 - SURFACE
      ?auto_27035 - PLACE
      ?auto_27041 - HOIST
      ?auto_27040 - SURFACE
      ?auto_27029 - SURFACE
      ?auto_27033 - PLACE
      ?auto_27032 - HOIST
      ?auto_27044 - SURFACE
      ?auto_27046 - SURFACE
      ?auto_27038 - PLACE
      ?auto_27034 - HOIST
      ?auto_27045 - SURFACE
      ?auto_27036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27042 ?auto_27037 ) ( IS-CRATE ?auto_27027 ) ( not ( = ?auto_27027 ?auto_27028 ) ) ( not ( = ?auto_27030 ?auto_27037 ) ) ( HOIST-AT ?auto_27039 ?auto_27030 ) ( not ( = ?auto_27042 ?auto_27039 ) ) ( AVAILABLE ?auto_27039 ) ( SURFACE-AT ?auto_27027 ?auto_27030 ) ( ON ?auto_27027 ?auto_27031 ) ( CLEAR ?auto_27027 ) ( not ( = ?auto_27027 ?auto_27031 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( IS-CRATE ?auto_27028 ) ( not ( = ?auto_27027 ?auto_27043 ) ) ( not ( = ?auto_27028 ?auto_27043 ) ) ( not ( = ?auto_27031 ?auto_27043 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27035 ) ) ( HOIST-AT ?auto_27041 ?auto_27035 ) ( not ( = ?auto_27042 ?auto_27041 ) ) ( not ( = ?auto_27039 ?auto_27041 ) ) ( AVAILABLE ?auto_27041 ) ( SURFACE-AT ?auto_27028 ?auto_27035 ) ( ON ?auto_27028 ?auto_27040 ) ( CLEAR ?auto_27028 ) ( not ( = ?auto_27027 ?auto_27040 ) ) ( not ( = ?auto_27028 ?auto_27040 ) ) ( not ( = ?auto_27031 ?auto_27040 ) ) ( not ( = ?auto_27043 ?auto_27040 ) ) ( IS-CRATE ?auto_27043 ) ( not ( = ?auto_27027 ?auto_27029 ) ) ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27031 ?auto_27029 ) ) ( not ( = ?auto_27043 ?auto_27029 ) ) ( not ( = ?auto_27040 ?auto_27029 ) ) ( not ( = ?auto_27033 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27035 ?auto_27033 ) ) ( HOIST-AT ?auto_27032 ?auto_27033 ) ( not ( = ?auto_27042 ?auto_27032 ) ) ( not ( = ?auto_27039 ?auto_27032 ) ) ( not ( = ?auto_27041 ?auto_27032 ) ) ( AVAILABLE ?auto_27032 ) ( SURFACE-AT ?auto_27043 ?auto_27033 ) ( ON ?auto_27043 ?auto_27044 ) ( CLEAR ?auto_27043 ) ( not ( = ?auto_27027 ?auto_27044 ) ) ( not ( = ?auto_27028 ?auto_27044 ) ) ( not ( = ?auto_27031 ?auto_27044 ) ) ( not ( = ?auto_27043 ?auto_27044 ) ) ( not ( = ?auto_27040 ?auto_27044 ) ) ( not ( = ?auto_27029 ?auto_27044 ) ) ( SURFACE-AT ?auto_27046 ?auto_27037 ) ( CLEAR ?auto_27046 ) ( IS-CRATE ?auto_27029 ) ( not ( = ?auto_27027 ?auto_27046 ) ) ( not ( = ?auto_27028 ?auto_27046 ) ) ( not ( = ?auto_27031 ?auto_27046 ) ) ( not ( = ?auto_27043 ?auto_27046 ) ) ( not ( = ?auto_27040 ?auto_27046 ) ) ( not ( = ?auto_27029 ?auto_27046 ) ) ( not ( = ?auto_27044 ?auto_27046 ) ) ( AVAILABLE ?auto_27042 ) ( not ( = ?auto_27038 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27038 ) ) ( not ( = ?auto_27035 ?auto_27038 ) ) ( not ( = ?auto_27033 ?auto_27038 ) ) ( HOIST-AT ?auto_27034 ?auto_27038 ) ( not ( = ?auto_27042 ?auto_27034 ) ) ( not ( = ?auto_27039 ?auto_27034 ) ) ( not ( = ?auto_27041 ?auto_27034 ) ) ( not ( = ?auto_27032 ?auto_27034 ) ) ( AVAILABLE ?auto_27034 ) ( SURFACE-AT ?auto_27029 ?auto_27038 ) ( ON ?auto_27029 ?auto_27045 ) ( CLEAR ?auto_27029 ) ( not ( = ?auto_27027 ?auto_27045 ) ) ( not ( = ?auto_27028 ?auto_27045 ) ) ( not ( = ?auto_27031 ?auto_27045 ) ) ( not ( = ?auto_27043 ?auto_27045 ) ) ( not ( = ?auto_27040 ?auto_27045 ) ) ( not ( = ?auto_27029 ?auto_27045 ) ) ( not ( = ?auto_27044 ?auto_27045 ) ) ( not ( = ?auto_27046 ?auto_27045 ) ) ( TRUCK-AT ?auto_27036 ?auto_27037 ) )
    :subtasks
    ( ( !DRIVE ?auto_27036 ?auto_27037 ?auto_27038 )
      ( MAKE-ON ?auto_27027 ?auto_27028 )
      ( MAKE-ON-VERIFY ?auto_27027 ?auto_27028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27047 - SURFACE
      ?auto_27048 - SURFACE
    )
    :vars
    (
      ?auto_27064 - HOIST
      ?auto_27057 - PLACE
      ?auto_27066 - PLACE
      ?auto_27051 - HOIST
      ?auto_27063 - SURFACE
      ?auto_27055 - SURFACE
      ?auto_27058 - PLACE
      ?auto_27054 - HOIST
      ?auto_27052 - SURFACE
      ?auto_27059 - SURFACE
      ?auto_27061 - PLACE
      ?auto_27062 - HOIST
      ?auto_27050 - SURFACE
      ?auto_27049 - SURFACE
      ?auto_27056 - PLACE
      ?auto_27060 - HOIST
      ?auto_27065 - SURFACE
      ?auto_27053 - TRUCK
      ?auto_27067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27064 ?auto_27057 ) ( IS-CRATE ?auto_27047 ) ( not ( = ?auto_27047 ?auto_27048 ) ) ( not ( = ?auto_27066 ?auto_27057 ) ) ( HOIST-AT ?auto_27051 ?auto_27066 ) ( not ( = ?auto_27064 ?auto_27051 ) ) ( AVAILABLE ?auto_27051 ) ( SURFACE-AT ?auto_27047 ?auto_27066 ) ( ON ?auto_27047 ?auto_27063 ) ( CLEAR ?auto_27047 ) ( not ( = ?auto_27047 ?auto_27063 ) ) ( not ( = ?auto_27048 ?auto_27063 ) ) ( IS-CRATE ?auto_27048 ) ( not ( = ?auto_27047 ?auto_27055 ) ) ( not ( = ?auto_27048 ?auto_27055 ) ) ( not ( = ?auto_27063 ?auto_27055 ) ) ( not ( = ?auto_27058 ?auto_27057 ) ) ( not ( = ?auto_27066 ?auto_27058 ) ) ( HOIST-AT ?auto_27054 ?auto_27058 ) ( not ( = ?auto_27064 ?auto_27054 ) ) ( not ( = ?auto_27051 ?auto_27054 ) ) ( AVAILABLE ?auto_27054 ) ( SURFACE-AT ?auto_27048 ?auto_27058 ) ( ON ?auto_27048 ?auto_27052 ) ( CLEAR ?auto_27048 ) ( not ( = ?auto_27047 ?auto_27052 ) ) ( not ( = ?auto_27048 ?auto_27052 ) ) ( not ( = ?auto_27063 ?auto_27052 ) ) ( not ( = ?auto_27055 ?auto_27052 ) ) ( IS-CRATE ?auto_27055 ) ( not ( = ?auto_27047 ?auto_27059 ) ) ( not ( = ?auto_27048 ?auto_27059 ) ) ( not ( = ?auto_27063 ?auto_27059 ) ) ( not ( = ?auto_27055 ?auto_27059 ) ) ( not ( = ?auto_27052 ?auto_27059 ) ) ( not ( = ?auto_27061 ?auto_27057 ) ) ( not ( = ?auto_27066 ?auto_27061 ) ) ( not ( = ?auto_27058 ?auto_27061 ) ) ( HOIST-AT ?auto_27062 ?auto_27061 ) ( not ( = ?auto_27064 ?auto_27062 ) ) ( not ( = ?auto_27051 ?auto_27062 ) ) ( not ( = ?auto_27054 ?auto_27062 ) ) ( AVAILABLE ?auto_27062 ) ( SURFACE-AT ?auto_27055 ?auto_27061 ) ( ON ?auto_27055 ?auto_27050 ) ( CLEAR ?auto_27055 ) ( not ( = ?auto_27047 ?auto_27050 ) ) ( not ( = ?auto_27048 ?auto_27050 ) ) ( not ( = ?auto_27063 ?auto_27050 ) ) ( not ( = ?auto_27055 ?auto_27050 ) ) ( not ( = ?auto_27052 ?auto_27050 ) ) ( not ( = ?auto_27059 ?auto_27050 ) ) ( IS-CRATE ?auto_27059 ) ( not ( = ?auto_27047 ?auto_27049 ) ) ( not ( = ?auto_27048 ?auto_27049 ) ) ( not ( = ?auto_27063 ?auto_27049 ) ) ( not ( = ?auto_27055 ?auto_27049 ) ) ( not ( = ?auto_27052 ?auto_27049 ) ) ( not ( = ?auto_27059 ?auto_27049 ) ) ( not ( = ?auto_27050 ?auto_27049 ) ) ( not ( = ?auto_27056 ?auto_27057 ) ) ( not ( = ?auto_27066 ?auto_27056 ) ) ( not ( = ?auto_27058 ?auto_27056 ) ) ( not ( = ?auto_27061 ?auto_27056 ) ) ( HOIST-AT ?auto_27060 ?auto_27056 ) ( not ( = ?auto_27064 ?auto_27060 ) ) ( not ( = ?auto_27051 ?auto_27060 ) ) ( not ( = ?auto_27054 ?auto_27060 ) ) ( not ( = ?auto_27062 ?auto_27060 ) ) ( AVAILABLE ?auto_27060 ) ( SURFACE-AT ?auto_27059 ?auto_27056 ) ( ON ?auto_27059 ?auto_27065 ) ( CLEAR ?auto_27059 ) ( not ( = ?auto_27047 ?auto_27065 ) ) ( not ( = ?auto_27048 ?auto_27065 ) ) ( not ( = ?auto_27063 ?auto_27065 ) ) ( not ( = ?auto_27055 ?auto_27065 ) ) ( not ( = ?auto_27052 ?auto_27065 ) ) ( not ( = ?auto_27059 ?auto_27065 ) ) ( not ( = ?auto_27050 ?auto_27065 ) ) ( not ( = ?auto_27049 ?auto_27065 ) ) ( TRUCK-AT ?auto_27053 ?auto_27057 ) ( SURFACE-AT ?auto_27067 ?auto_27057 ) ( CLEAR ?auto_27067 ) ( LIFTING ?auto_27064 ?auto_27049 ) ( IS-CRATE ?auto_27049 ) ( not ( = ?auto_27047 ?auto_27067 ) ) ( not ( = ?auto_27048 ?auto_27067 ) ) ( not ( = ?auto_27063 ?auto_27067 ) ) ( not ( = ?auto_27055 ?auto_27067 ) ) ( not ( = ?auto_27052 ?auto_27067 ) ) ( not ( = ?auto_27059 ?auto_27067 ) ) ( not ( = ?auto_27050 ?auto_27067 ) ) ( not ( = ?auto_27049 ?auto_27067 ) ) ( not ( = ?auto_27065 ?auto_27067 ) ) )
    :subtasks
    ( ( !DROP ?auto_27064 ?auto_27049 ?auto_27067 ?auto_27057 )
      ( MAKE-ON ?auto_27047 ?auto_27048 )
      ( MAKE-ON-VERIFY ?auto_27047 ?auto_27048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27068 - SURFACE
      ?auto_27069 - SURFACE
    )
    :vars
    (
      ?auto_27073 - HOIST
      ?auto_27077 - PLACE
      ?auto_27079 - PLACE
      ?auto_27081 - HOIST
      ?auto_27070 - SURFACE
      ?auto_27072 - SURFACE
      ?auto_27074 - PLACE
      ?auto_27084 - HOIST
      ?auto_27082 - SURFACE
      ?auto_27085 - SURFACE
      ?auto_27071 - PLACE
      ?auto_27086 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27078 - SURFACE
      ?auto_27087 - PLACE
      ?auto_27088 - HOIST
      ?auto_27075 - SURFACE
      ?auto_27083 - TRUCK
      ?auto_27076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27073 ?auto_27077 ) ( IS-CRATE ?auto_27068 ) ( not ( = ?auto_27068 ?auto_27069 ) ) ( not ( = ?auto_27079 ?auto_27077 ) ) ( HOIST-AT ?auto_27081 ?auto_27079 ) ( not ( = ?auto_27073 ?auto_27081 ) ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27068 ?auto_27079 ) ( ON ?auto_27068 ?auto_27070 ) ( CLEAR ?auto_27068 ) ( not ( = ?auto_27068 ?auto_27070 ) ) ( not ( = ?auto_27069 ?auto_27070 ) ) ( IS-CRATE ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27072 ) ) ( not ( = ?auto_27069 ?auto_27072 ) ) ( not ( = ?auto_27070 ?auto_27072 ) ) ( not ( = ?auto_27074 ?auto_27077 ) ) ( not ( = ?auto_27079 ?auto_27074 ) ) ( HOIST-AT ?auto_27084 ?auto_27074 ) ( not ( = ?auto_27073 ?auto_27084 ) ) ( not ( = ?auto_27081 ?auto_27084 ) ) ( AVAILABLE ?auto_27084 ) ( SURFACE-AT ?auto_27069 ?auto_27074 ) ( ON ?auto_27069 ?auto_27082 ) ( CLEAR ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27082 ) ) ( not ( = ?auto_27069 ?auto_27082 ) ) ( not ( = ?auto_27070 ?auto_27082 ) ) ( not ( = ?auto_27072 ?auto_27082 ) ) ( IS-CRATE ?auto_27072 ) ( not ( = ?auto_27068 ?auto_27085 ) ) ( not ( = ?auto_27069 ?auto_27085 ) ) ( not ( = ?auto_27070 ?auto_27085 ) ) ( not ( = ?auto_27072 ?auto_27085 ) ) ( not ( = ?auto_27082 ?auto_27085 ) ) ( not ( = ?auto_27071 ?auto_27077 ) ) ( not ( = ?auto_27079 ?auto_27071 ) ) ( not ( = ?auto_27074 ?auto_27071 ) ) ( HOIST-AT ?auto_27086 ?auto_27071 ) ( not ( = ?auto_27073 ?auto_27086 ) ) ( not ( = ?auto_27081 ?auto_27086 ) ) ( not ( = ?auto_27084 ?auto_27086 ) ) ( AVAILABLE ?auto_27086 ) ( SURFACE-AT ?auto_27072 ?auto_27071 ) ( ON ?auto_27072 ?auto_27080 ) ( CLEAR ?auto_27072 ) ( not ( = ?auto_27068 ?auto_27080 ) ) ( not ( = ?auto_27069 ?auto_27080 ) ) ( not ( = ?auto_27070 ?auto_27080 ) ) ( not ( = ?auto_27072 ?auto_27080 ) ) ( not ( = ?auto_27082 ?auto_27080 ) ) ( not ( = ?auto_27085 ?auto_27080 ) ) ( IS-CRATE ?auto_27085 ) ( not ( = ?auto_27068 ?auto_27078 ) ) ( not ( = ?auto_27069 ?auto_27078 ) ) ( not ( = ?auto_27070 ?auto_27078 ) ) ( not ( = ?auto_27072 ?auto_27078 ) ) ( not ( = ?auto_27082 ?auto_27078 ) ) ( not ( = ?auto_27085 ?auto_27078 ) ) ( not ( = ?auto_27080 ?auto_27078 ) ) ( not ( = ?auto_27087 ?auto_27077 ) ) ( not ( = ?auto_27079 ?auto_27087 ) ) ( not ( = ?auto_27074 ?auto_27087 ) ) ( not ( = ?auto_27071 ?auto_27087 ) ) ( HOIST-AT ?auto_27088 ?auto_27087 ) ( not ( = ?auto_27073 ?auto_27088 ) ) ( not ( = ?auto_27081 ?auto_27088 ) ) ( not ( = ?auto_27084 ?auto_27088 ) ) ( not ( = ?auto_27086 ?auto_27088 ) ) ( AVAILABLE ?auto_27088 ) ( SURFACE-AT ?auto_27085 ?auto_27087 ) ( ON ?auto_27085 ?auto_27075 ) ( CLEAR ?auto_27085 ) ( not ( = ?auto_27068 ?auto_27075 ) ) ( not ( = ?auto_27069 ?auto_27075 ) ) ( not ( = ?auto_27070 ?auto_27075 ) ) ( not ( = ?auto_27072 ?auto_27075 ) ) ( not ( = ?auto_27082 ?auto_27075 ) ) ( not ( = ?auto_27085 ?auto_27075 ) ) ( not ( = ?auto_27080 ?auto_27075 ) ) ( not ( = ?auto_27078 ?auto_27075 ) ) ( TRUCK-AT ?auto_27083 ?auto_27077 ) ( SURFACE-AT ?auto_27076 ?auto_27077 ) ( CLEAR ?auto_27076 ) ( IS-CRATE ?auto_27078 ) ( not ( = ?auto_27068 ?auto_27076 ) ) ( not ( = ?auto_27069 ?auto_27076 ) ) ( not ( = ?auto_27070 ?auto_27076 ) ) ( not ( = ?auto_27072 ?auto_27076 ) ) ( not ( = ?auto_27082 ?auto_27076 ) ) ( not ( = ?auto_27085 ?auto_27076 ) ) ( not ( = ?auto_27080 ?auto_27076 ) ) ( not ( = ?auto_27078 ?auto_27076 ) ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( AVAILABLE ?auto_27073 ) ( IN ?auto_27078 ?auto_27083 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27073 ?auto_27078 ?auto_27083 ?auto_27077 )
      ( MAKE-ON ?auto_27068 ?auto_27069 )
      ( MAKE-ON-VERIFY ?auto_27068 ?auto_27069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27089 - SURFACE
      ?auto_27090 - SURFACE
    )
    :vars
    (
      ?auto_27091 - HOIST
      ?auto_27093 - PLACE
      ?auto_27092 - PLACE
      ?auto_27101 - HOIST
      ?auto_27102 - SURFACE
      ?auto_27095 - SURFACE
      ?auto_27109 - PLACE
      ?auto_27103 - HOIST
      ?auto_27099 - SURFACE
      ?auto_27098 - SURFACE
      ?auto_27108 - PLACE
      ?auto_27104 - HOIST
      ?auto_27096 - SURFACE
      ?auto_27100 - SURFACE
      ?auto_27105 - PLACE
      ?auto_27106 - HOIST
      ?auto_27094 - SURFACE
      ?auto_27097 - SURFACE
      ?auto_27107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27091 ?auto_27093 ) ( IS-CRATE ?auto_27089 ) ( not ( = ?auto_27089 ?auto_27090 ) ) ( not ( = ?auto_27092 ?auto_27093 ) ) ( HOIST-AT ?auto_27101 ?auto_27092 ) ( not ( = ?auto_27091 ?auto_27101 ) ) ( AVAILABLE ?auto_27101 ) ( SURFACE-AT ?auto_27089 ?auto_27092 ) ( ON ?auto_27089 ?auto_27102 ) ( CLEAR ?auto_27089 ) ( not ( = ?auto_27089 ?auto_27102 ) ) ( not ( = ?auto_27090 ?auto_27102 ) ) ( IS-CRATE ?auto_27090 ) ( not ( = ?auto_27089 ?auto_27095 ) ) ( not ( = ?auto_27090 ?auto_27095 ) ) ( not ( = ?auto_27102 ?auto_27095 ) ) ( not ( = ?auto_27109 ?auto_27093 ) ) ( not ( = ?auto_27092 ?auto_27109 ) ) ( HOIST-AT ?auto_27103 ?auto_27109 ) ( not ( = ?auto_27091 ?auto_27103 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( AVAILABLE ?auto_27103 ) ( SURFACE-AT ?auto_27090 ?auto_27109 ) ( ON ?auto_27090 ?auto_27099 ) ( CLEAR ?auto_27090 ) ( not ( = ?auto_27089 ?auto_27099 ) ) ( not ( = ?auto_27090 ?auto_27099 ) ) ( not ( = ?auto_27102 ?auto_27099 ) ) ( not ( = ?auto_27095 ?auto_27099 ) ) ( IS-CRATE ?auto_27095 ) ( not ( = ?auto_27089 ?auto_27098 ) ) ( not ( = ?auto_27090 ?auto_27098 ) ) ( not ( = ?auto_27102 ?auto_27098 ) ) ( not ( = ?auto_27095 ?auto_27098 ) ) ( not ( = ?auto_27099 ?auto_27098 ) ) ( not ( = ?auto_27108 ?auto_27093 ) ) ( not ( = ?auto_27092 ?auto_27108 ) ) ( not ( = ?auto_27109 ?auto_27108 ) ) ( HOIST-AT ?auto_27104 ?auto_27108 ) ( not ( = ?auto_27091 ?auto_27104 ) ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( not ( = ?auto_27103 ?auto_27104 ) ) ( AVAILABLE ?auto_27104 ) ( SURFACE-AT ?auto_27095 ?auto_27108 ) ( ON ?auto_27095 ?auto_27096 ) ( CLEAR ?auto_27095 ) ( not ( = ?auto_27089 ?auto_27096 ) ) ( not ( = ?auto_27090 ?auto_27096 ) ) ( not ( = ?auto_27102 ?auto_27096 ) ) ( not ( = ?auto_27095 ?auto_27096 ) ) ( not ( = ?auto_27099 ?auto_27096 ) ) ( not ( = ?auto_27098 ?auto_27096 ) ) ( IS-CRATE ?auto_27098 ) ( not ( = ?auto_27089 ?auto_27100 ) ) ( not ( = ?auto_27090 ?auto_27100 ) ) ( not ( = ?auto_27102 ?auto_27100 ) ) ( not ( = ?auto_27095 ?auto_27100 ) ) ( not ( = ?auto_27099 ?auto_27100 ) ) ( not ( = ?auto_27098 ?auto_27100 ) ) ( not ( = ?auto_27096 ?auto_27100 ) ) ( not ( = ?auto_27105 ?auto_27093 ) ) ( not ( = ?auto_27092 ?auto_27105 ) ) ( not ( = ?auto_27109 ?auto_27105 ) ) ( not ( = ?auto_27108 ?auto_27105 ) ) ( HOIST-AT ?auto_27106 ?auto_27105 ) ( not ( = ?auto_27091 ?auto_27106 ) ) ( not ( = ?auto_27101 ?auto_27106 ) ) ( not ( = ?auto_27103 ?auto_27106 ) ) ( not ( = ?auto_27104 ?auto_27106 ) ) ( AVAILABLE ?auto_27106 ) ( SURFACE-AT ?auto_27098 ?auto_27105 ) ( ON ?auto_27098 ?auto_27094 ) ( CLEAR ?auto_27098 ) ( not ( = ?auto_27089 ?auto_27094 ) ) ( not ( = ?auto_27090 ?auto_27094 ) ) ( not ( = ?auto_27102 ?auto_27094 ) ) ( not ( = ?auto_27095 ?auto_27094 ) ) ( not ( = ?auto_27099 ?auto_27094 ) ) ( not ( = ?auto_27098 ?auto_27094 ) ) ( not ( = ?auto_27096 ?auto_27094 ) ) ( not ( = ?auto_27100 ?auto_27094 ) ) ( SURFACE-AT ?auto_27097 ?auto_27093 ) ( CLEAR ?auto_27097 ) ( IS-CRATE ?auto_27100 ) ( not ( = ?auto_27089 ?auto_27097 ) ) ( not ( = ?auto_27090 ?auto_27097 ) ) ( not ( = ?auto_27102 ?auto_27097 ) ) ( not ( = ?auto_27095 ?auto_27097 ) ) ( not ( = ?auto_27099 ?auto_27097 ) ) ( not ( = ?auto_27098 ?auto_27097 ) ) ( not ( = ?auto_27096 ?auto_27097 ) ) ( not ( = ?auto_27100 ?auto_27097 ) ) ( not ( = ?auto_27094 ?auto_27097 ) ) ( AVAILABLE ?auto_27091 ) ( IN ?auto_27100 ?auto_27107 ) ( TRUCK-AT ?auto_27107 ?auto_27105 ) )
    :subtasks
    ( ( !DRIVE ?auto_27107 ?auto_27105 ?auto_27093 )
      ( MAKE-ON ?auto_27089 ?auto_27090 )
      ( MAKE-ON-VERIFY ?auto_27089 ?auto_27090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27110 - SURFACE
      ?auto_27111 - SURFACE
    )
    :vars
    (
      ?auto_27128 - HOIST
      ?auto_27116 - PLACE
      ?auto_27120 - PLACE
      ?auto_27119 - HOIST
      ?auto_27126 - SURFACE
      ?auto_27129 - SURFACE
      ?auto_27122 - PLACE
      ?auto_27117 - HOIST
      ?auto_27115 - SURFACE
      ?auto_27125 - SURFACE
      ?auto_27121 - PLACE
      ?auto_27112 - HOIST
      ?auto_27118 - SURFACE
      ?auto_27127 - SURFACE
      ?auto_27114 - PLACE
      ?auto_27123 - HOIST
      ?auto_27130 - SURFACE
      ?auto_27113 - SURFACE
      ?auto_27124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27128 ?auto_27116 ) ( IS-CRATE ?auto_27110 ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27120 ?auto_27116 ) ) ( HOIST-AT ?auto_27119 ?auto_27120 ) ( not ( = ?auto_27128 ?auto_27119 ) ) ( AVAILABLE ?auto_27119 ) ( SURFACE-AT ?auto_27110 ?auto_27120 ) ( ON ?auto_27110 ?auto_27126 ) ( CLEAR ?auto_27110 ) ( not ( = ?auto_27110 ?auto_27126 ) ) ( not ( = ?auto_27111 ?auto_27126 ) ) ( IS-CRATE ?auto_27111 ) ( not ( = ?auto_27110 ?auto_27129 ) ) ( not ( = ?auto_27111 ?auto_27129 ) ) ( not ( = ?auto_27126 ?auto_27129 ) ) ( not ( = ?auto_27122 ?auto_27116 ) ) ( not ( = ?auto_27120 ?auto_27122 ) ) ( HOIST-AT ?auto_27117 ?auto_27122 ) ( not ( = ?auto_27128 ?auto_27117 ) ) ( not ( = ?auto_27119 ?auto_27117 ) ) ( AVAILABLE ?auto_27117 ) ( SURFACE-AT ?auto_27111 ?auto_27122 ) ( ON ?auto_27111 ?auto_27115 ) ( CLEAR ?auto_27111 ) ( not ( = ?auto_27110 ?auto_27115 ) ) ( not ( = ?auto_27111 ?auto_27115 ) ) ( not ( = ?auto_27126 ?auto_27115 ) ) ( not ( = ?auto_27129 ?auto_27115 ) ) ( IS-CRATE ?auto_27129 ) ( not ( = ?auto_27110 ?auto_27125 ) ) ( not ( = ?auto_27111 ?auto_27125 ) ) ( not ( = ?auto_27126 ?auto_27125 ) ) ( not ( = ?auto_27129 ?auto_27125 ) ) ( not ( = ?auto_27115 ?auto_27125 ) ) ( not ( = ?auto_27121 ?auto_27116 ) ) ( not ( = ?auto_27120 ?auto_27121 ) ) ( not ( = ?auto_27122 ?auto_27121 ) ) ( HOIST-AT ?auto_27112 ?auto_27121 ) ( not ( = ?auto_27128 ?auto_27112 ) ) ( not ( = ?auto_27119 ?auto_27112 ) ) ( not ( = ?auto_27117 ?auto_27112 ) ) ( AVAILABLE ?auto_27112 ) ( SURFACE-AT ?auto_27129 ?auto_27121 ) ( ON ?auto_27129 ?auto_27118 ) ( CLEAR ?auto_27129 ) ( not ( = ?auto_27110 ?auto_27118 ) ) ( not ( = ?auto_27111 ?auto_27118 ) ) ( not ( = ?auto_27126 ?auto_27118 ) ) ( not ( = ?auto_27129 ?auto_27118 ) ) ( not ( = ?auto_27115 ?auto_27118 ) ) ( not ( = ?auto_27125 ?auto_27118 ) ) ( IS-CRATE ?auto_27125 ) ( not ( = ?auto_27110 ?auto_27127 ) ) ( not ( = ?auto_27111 ?auto_27127 ) ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27129 ?auto_27127 ) ) ( not ( = ?auto_27115 ?auto_27127 ) ) ( not ( = ?auto_27125 ?auto_27127 ) ) ( not ( = ?auto_27118 ?auto_27127 ) ) ( not ( = ?auto_27114 ?auto_27116 ) ) ( not ( = ?auto_27120 ?auto_27114 ) ) ( not ( = ?auto_27122 ?auto_27114 ) ) ( not ( = ?auto_27121 ?auto_27114 ) ) ( HOIST-AT ?auto_27123 ?auto_27114 ) ( not ( = ?auto_27128 ?auto_27123 ) ) ( not ( = ?auto_27119 ?auto_27123 ) ) ( not ( = ?auto_27117 ?auto_27123 ) ) ( not ( = ?auto_27112 ?auto_27123 ) ) ( SURFACE-AT ?auto_27125 ?auto_27114 ) ( ON ?auto_27125 ?auto_27130 ) ( CLEAR ?auto_27125 ) ( not ( = ?auto_27110 ?auto_27130 ) ) ( not ( = ?auto_27111 ?auto_27130 ) ) ( not ( = ?auto_27126 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27115 ?auto_27130 ) ) ( not ( = ?auto_27125 ?auto_27130 ) ) ( not ( = ?auto_27118 ?auto_27130 ) ) ( not ( = ?auto_27127 ?auto_27130 ) ) ( SURFACE-AT ?auto_27113 ?auto_27116 ) ( CLEAR ?auto_27113 ) ( IS-CRATE ?auto_27127 ) ( not ( = ?auto_27110 ?auto_27113 ) ) ( not ( = ?auto_27111 ?auto_27113 ) ) ( not ( = ?auto_27126 ?auto_27113 ) ) ( not ( = ?auto_27129 ?auto_27113 ) ) ( not ( = ?auto_27115 ?auto_27113 ) ) ( not ( = ?auto_27125 ?auto_27113 ) ) ( not ( = ?auto_27118 ?auto_27113 ) ) ( not ( = ?auto_27127 ?auto_27113 ) ) ( not ( = ?auto_27130 ?auto_27113 ) ) ( AVAILABLE ?auto_27128 ) ( TRUCK-AT ?auto_27124 ?auto_27114 ) ( LIFTING ?auto_27123 ?auto_27127 ) )
    :subtasks
    ( ( !LOAD ?auto_27123 ?auto_27127 ?auto_27124 ?auto_27114 )
      ( MAKE-ON ?auto_27110 ?auto_27111 )
      ( MAKE-ON-VERIFY ?auto_27110 ?auto_27111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27131 - SURFACE
      ?auto_27132 - SURFACE
    )
    :vars
    (
      ?auto_27150 - HOIST
      ?auto_27135 - PLACE
      ?auto_27144 - PLACE
      ?auto_27138 - HOIST
      ?auto_27137 - SURFACE
      ?auto_27143 - SURFACE
      ?auto_27133 - PLACE
      ?auto_27149 - HOIST
      ?auto_27145 - SURFACE
      ?auto_27141 - SURFACE
      ?auto_27136 - PLACE
      ?auto_27134 - HOIST
      ?auto_27146 - SURFACE
      ?auto_27139 - SURFACE
      ?auto_27140 - PLACE
      ?auto_27147 - HOIST
      ?auto_27142 - SURFACE
      ?auto_27148 - SURFACE
      ?auto_27151 - TRUCK
      ?auto_27152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27150 ?auto_27135 ) ( IS-CRATE ?auto_27131 ) ( not ( = ?auto_27131 ?auto_27132 ) ) ( not ( = ?auto_27144 ?auto_27135 ) ) ( HOIST-AT ?auto_27138 ?auto_27144 ) ( not ( = ?auto_27150 ?auto_27138 ) ) ( AVAILABLE ?auto_27138 ) ( SURFACE-AT ?auto_27131 ?auto_27144 ) ( ON ?auto_27131 ?auto_27137 ) ( CLEAR ?auto_27131 ) ( not ( = ?auto_27131 ?auto_27137 ) ) ( not ( = ?auto_27132 ?auto_27137 ) ) ( IS-CRATE ?auto_27132 ) ( not ( = ?auto_27131 ?auto_27143 ) ) ( not ( = ?auto_27132 ?auto_27143 ) ) ( not ( = ?auto_27137 ?auto_27143 ) ) ( not ( = ?auto_27133 ?auto_27135 ) ) ( not ( = ?auto_27144 ?auto_27133 ) ) ( HOIST-AT ?auto_27149 ?auto_27133 ) ( not ( = ?auto_27150 ?auto_27149 ) ) ( not ( = ?auto_27138 ?auto_27149 ) ) ( AVAILABLE ?auto_27149 ) ( SURFACE-AT ?auto_27132 ?auto_27133 ) ( ON ?auto_27132 ?auto_27145 ) ( CLEAR ?auto_27132 ) ( not ( = ?auto_27131 ?auto_27145 ) ) ( not ( = ?auto_27132 ?auto_27145 ) ) ( not ( = ?auto_27137 ?auto_27145 ) ) ( not ( = ?auto_27143 ?auto_27145 ) ) ( IS-CRATE ?auto_27143 ) ( not ( = ?auto_27131 ?auto_27141 ) ) ( not ( = ?auto_27132 ?auto_27141 ) ) ( not ( = ?auto_27137 ?auto_27141 ) ) ( not ( = ?auto_27143 ?auto_27141 ) ) ( not ( = ?auto_27145 ?auto_27141 ) ) ( not ( = ?auto_27136 ?auto_27135 ) ) ( not ( = ?auto_27144 ?auto_27136 ) ) ( not ( = ?auto_27133 ?auto_27136 ) ) ( HOIST-AT ?auto_27134 ?auto_27136 ) ( not ( = ?auto_27150 ?auto_27134 ) ) ( not ( = ?auto_27138 ?auto_27134 ) ) ( not ( = ?auto_27149 ?auto_27134 ) ) ( AVAILABLE ?auto_27134 ) ( SURFACE-AT ?auto_27143 ?auto_27136 ) ( ON ?auto_27143 ?auto_27146 ) ( CLEAR ?auto_27143 ) ( not ( = ?auto_27131 ?auto_27146 ) ) ( not ( = ?auto_27132 ?auto_27146 ) ) ( not ( = ?auto_27137 ?auto_27146 ) ) ( not ( = ?auto_27143 ?auto_27146 ) ) ( not ( = ?auto_27145 ?auto_27146 ) ) ( not ( = ?auto_27141 ?auto_27146 ) ) ( IS-CRATE ?auto_27141 ) ( not ( = ?auto_27131 ?auto_27139 ) ) ( not ( = ?auto_27132 ?auto_27139 ) ) ( not ( = ?auto_27137 ?auto_27139 ) ) ( not ( = ?auto_27143 ?auto_27139 ) ) ( not ( = ?auto_27145 ?auto_27139 ) ) ( not ( = ?auto_27141 ?auto_27139 ) ) ( not ( = ?auto_27146 ?auto_27139 ) ) ( not ( = ?auto_27140 ?auto_27135 ) ) ( not ( = ?auto_27144 ?auto_27140 ) ) ( not ( = ?auto_27133 ?auto_27140 ) ) ( not ( = ?auto_27136 ?auto_27140 ) ) ( HOIST-AT ?auto_27147 ?auto_27140 ) ( not ( = ?auto_27150 ?auto_27147 ) ) ( not ( = ?auto_27138 ?auto_27147 ) ) ( not ( = ?auto_27149 ?auto_27147 ) ) ( not ( = ?auto_27134 ?auto_27147 ) ) ( SURFACE-AT ?auto_27141 ?auto_27140 ) ( ON ?auto_27141 ?auto_27142 ) ( CLEAR ?auto_27141 ) ( not ( = ?auto_27131 ?auto_27142 ) ) ( not ( = ?auto_27132 ?auto_27142 ) ) ( not ( = ?auto_27137 ?auto_27142 ) ) ( not ( = ?auto_27143 ?auto_27142 ) ) ( not ( = ?auto_27145 ?auto_27142 ) ) ( not ( = ?auto_27141 ?auto_27142 ) ) ( not ( = ?auto_27146 ?auto_27142 ) ) ( not ( = ?auto_27139 ?auto_27142 ) ) ( SURFACE-AT ?auto_27148 ?auto_27135 ) ( CLEAR ?auto_27148 ) ( IS-CRATE ?auto_27139 ) ( not ( = ?auto_27131 ?auto_27148 ) ) ( not ( = ?auto_27132 ?auto_27148 ) ) ( not ( = ?auto_27137 ?auto_27148 ) ) ( not ( = ?auto_27143 ?auto_27148 ) ) ( not ( = ?auto_27145 ?auto_27148 ) ) ( not ( = ?auto_27141 ?auto_27148 ) ) ( not ( = ?auto_27146 ?auto_27148 ) ) ( not ( = ?auto_27139 ?auto_27148 ) ) ( not ( = ?auto_27142 ?auto_27148 ) ) ( AVAILABLE ?auto_27150 ) ( TRUCK-AT ?auto_27151 ?auto_27140 ) ( AVAILABLE ?auto_27147 ) ( SURFACE-AT ?auto_27139 ?auto_27140 ) ( ON ?auto_27139 ?auto_27152 ) ( CLEAR ?auto_27139 ) ( not ( = ?auto_27131 ?auto_27152 ) ) ( not ( = ?auto_27132 ?auto_27152 ) ) ( not ( = ?auto_27137 ?auto_27152 ) ) ( not ( = ?auto_27143 ?auto_27152 ) ) ( not ( = ?auto_27145 ?auto_27152 ) ) ( not ( = ?auto_27141 ?auto_27152 ) ) ( not ( = ?auto_27146 ?auto_27152 ) ) ( not ( = ?auto_27139 ?auto_27152 ) ) ( not ( = ?auto_27142 ?auto_27152 ) ) ( not ( = ?auto_27148 ?auto_27152 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27147 ?auto_27139 ?auto_27152 ?auto_27140 )
      ( MAKE-ON ?auto_27131 ?auto_27132 )
      ( MAKE-ON-VERIFY ?auto_27131 ?auto_27132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27153 - SURFACE
      ?auto_27154 - SURFACE
    )
    :vars
    (
      ?auto_27159 - HOIST
      ?auto_27164 - PLACE
      ?auto_27158 - PLACE
      ?auto_27173 - HOIST
      ?auto_27157 - SURFACE
      ?auto_27163 - SURFACE
      ?auto_27166 - PLACE
      ?auto_27160 - HOIST
      ?auto_27161 - SURFACE
      ?auto_27165 - SURFACE
      ?auto_27155 - PLACE
      ?auto_27174 - HOIST
      ?auto_27172 - SURFACE
      ?auto_27162 - SURFACE
      ?auto_27168 - PLACE
      ?auto_27167 - HOIST
      ?auto_27169 - SURFACE
      ?auto_27156 - SURFACE
      ?auto_27171 - SURFACE
      ?auto_27170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27159 ?auto_27164 ) ( IS-CRATE ?auto_27153 ) ( not ( = ?auto_27153 ?auto_27154 ) ) ( not ( = ?auto_27158 ?auto_27164 ) ) ( HOIST-AT ?auto_27173 ?auto_27158 ) ( not ( = ?auto_27159 ?auto_27173 ) ) ( AVAILABLE ?auto_27173 ) ( SURFACE-AT ?auto_27153 ?auto_27158 ) ( ON ?auto_27153 ?auto_27157 ) ( CLEAR ?auto_27153 ) ( not ( = ?auto_27153 ?auto_27157 ) ) ( not ( = ?auto_27154 ?auto_27157 ) ) ( IS-CRATE ?auto_27154 ) ( not ( = ?auto_27153 ?auto_27163 ) ) ( not ( = ?auto_27154 ?auto_27163 ) ) ( not ( = ?auto_27157 ?auto_27163 ) ) ( not ( = ?auto_27166 ?auto_27164 ) ) ( not ( = ?auto_27158 ?auto_27166 ) ) ( HOIST-AT ?auto_27160 ?auto_27166 ) ( not ( = ?auto_27159 ?auto_27160 ) ) ( not ( = ?auto_27173 ?auto_27160 ) ) ( AVAILABLE ?auto_27160 ) ( SURFACE-AT ?auto_27154 ?auto_27166 ) ( ON ?auto_27154 ?auto_27161 ) ( CLEAR ?auto_27154 ) ( not ( = ?auto_27153 ?auto_27161 ) ) ( not ( = ?auto_27154 ?auto_27161 ) ) ( not ( = ?auto_27157 ?auto_27161 ) ) ( not ( = ?auto_27163 ?auto_27161 ) ) ( IS-CRATE ?auto_27163 ) ( not ( = ?auto_27153 ?auto_27165 ) ) ( not ( = ?auto_27154 ?auto_27165 ) ) ( not ( = ?auto_27157 ?auto_27165 ) ) ( not ( = ?auto_27163 ?auto_27165 ) ) ( not ( = ?auto_27161 ?auto_27165 ) ) ( not ( = ?auto_27155 ?auto_27164 ) ) ( not ( = ?auto_27158 ?auto_27155 ) ) ( not ( = ?auto_27166 ?auto_27155 ) ) ( HOIST-AT ?auto_27174 ?auto_27155 ) ( not ( = ?auto_27159 ?auto_27174 ) ) ( not ( = ?auto_27173 ?auto_27174 ) ) ( not ( = ?auto_27160 ?auto_27174 ) ) ( AVAILABLE ?auto_27174 ) ( SURFACE-AT ?auto_27163 ?auto_27155 ) ( ON ?auto_27163 ?auto_27172 ) ( CLEAR ?auto_27163 ) ( not ( = ?auto_27153 ?auto_27172 ) ) ( not ( = ?auto_27154 ?auto_27172 ) ) ( not ( = ?auto_27157 ?auto_27172 ) ) ( not ( = ?auto_27163 ?auto_27172 ) ) ( not ( = ?auto_27161 ?auto_27172 ) ) ( not ( = ?auto_27165 ?auto_27172 ) ) ( IS-CRATE ?auto_27165 ) ( not ( = ?auto_27153 ?auto_27162 ) ) ( not ( = ?auto_27154 ?auto_27162 ) ) ( not ( = ?auto_27157 ?auto_27162 ) ) ( not ( = ?auto_27163 ?auto_27162 ) ) ( not ( = ?auto_27161 ?auto_27162 ) ) ( not ( = ?auto_27165 ?auto_27162 ) ) ( not ( = ?auto_27172 ?auto_27162 ) ) ( not ( = ?auto_27168 ?auto_27164 ) ) ( not ( = ?auto_27158 ?auto_27168 ) ) ( not ( = ?auto_27166 ?auto_27168 ) ) ( not ( = ?auto_27155 ?auto_27168 ) ) ( HOIST-AT ?auto_27167 ?auto_27168 ) ( not ( = ?auto_27159 ?auto_27167 ) ) ( not ( = ?auto_27173 ?auto_27167 ) ) ( not ( = ?auto_27160 ?auto_27167 ) ) ( not ( = ?auto_27174 ?auto_27167 ) ) ( SURFACE-AT ?auto_27165 ?auto_27168 ) ( ON ?auto_27165 ?auto_27169 ) ( CLEAR ?auto_27165 ) ( not ( = ?auto_27153 ?auto_27169 ) ) ( not ( = ?auto_27154 ?auto_27169 ) ) ( not ( = ?auto_27157 ?auto_27169 ) ) ( not ( = ?auto_27163 ?auto_27169 ) ) ( not ( = ?auto_27161 ?auto_27169 ) ) ( not ( = ?auto_27165 ?auto_27169 ) ) ( not ( = ?auto_27172 ?auto_27169 ) ) ( not ( = ?auto_27162 ?auto_27169 ) ) ( SURFACE-AT ?auto_27156 ?auto_27164 ) ( CLEAR ?auto_27156 ) ( IS-CRATE ?auto_27162 ) ( not ( = ?auto_27153 ?auto_27156 ) ) ( not ( = ?auto_27154 ?auto_27156 ) ) ( not ( = ?auto_27157 ?auto_27156 ) ) ( not ( = ?auto_27163 ?auto_27156 ) ) ( not ( = ?auto_27161 ?auto_27156 ) ) ( not ( = ?auto_27165 ?auto_27156 ) ) ( not ( = ?auto_27172 ?auto_27156 ) ) ( not ( = ?auto_27162 ?auto_27156 ) ) ( not ( = ?auto_27169 ?auto_27156 ) ) ( AVAILABLE ?auto_27159 ) ( AVAILABLE ?auto_27167 ) ( SURFACE-AT ?auto_27162 ?auto_27168 ) ( ON ?auto_27162 ?auto_27171 ) ( CLEAR ?auto_27162 ) ( not ( = ?auto_27153 ?auto_27171 ) ) ( not ( = ?auto_27154 ?auto_27171 ) ) ( not ( = ?auto_27157 ?auto_27171 ) ) ( not ( = ?auto_27163 ?auto_27171 ) ) ( not ( = ?auto_27161 ?auto_27171 ) ) ( not ( = ?auto_27165 ?auto_27171 ) ) ( not ( = ?auto_27172 ?auto_27171 ) ) ( not ( = ?auto_27162 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27156 ?auto_27171 ) ) ( TRUCK-AT ?auto_27170 ?auto_27164 ) )
    :subtasks
    ( ( !DRIVE ?auto_27170 ?auto_27164 ?auto_27168 )
      ( MAKE-ON ?auto_27153 ?auto_27154 )
      ( MAKE-ON-VERIFY ?auto_27153 ?auto_27154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27175 - SURFACE
      ?auto_27176 - SURFACE
    )
    :vars
    (
      ?auto_27196 - HOIST
      ?auto_27194 - PLACE
      ?auto_27189 - PLACE
      ?auto_27178 - HOIST
      ?auto_27192 - SURFACE
      ?auto_27193 - SURFACE
      ?auto_27183 - PLACE
      ?auto_27190 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27179 - SURFACE
      ?auto_27186 - PLACE
      ?auto_27181 - HOIST
      ?auto_27185 - SURFACE
      ?auto_27195 - SURFACE
      ?auto_27177 - PLACE
      ?auto_27188 - HOIST
      ?auto_27187 - SURFACE
      ?auto_27180 - SURFACE
      ?auto_27182 - SURFACE
      ?auto_27191 - TRUCK
      ?auto_27197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27196 ?auto_27194 ) ( IS-CRATE ?auto_27175 ) ( not ( = ?auto_27175 ?auto_27176 ) ) ( not ( = ?auto_27189 ?auto_27194 ) ) ( HOIST-AT ?auto_27178 ?auto_27189 ) ( not ( = ?auto_27196 ?auto_27178 ) ) ( AVAILABLE ?auto_27178 ) ( SURFACE-AT ?auto_27175 ?auto_27189 ) ( ON ?auto_27175 ?auto_27192 ) ( CLEAR ?auto_27175 ) ( not ( = ?auto_27175 ?auto_27192 ) ) ( not ( = ?auto_27176 ?auto_27192 ) ) ( IS-CRATE ?auto_27176 ) ( not ( = ?auto_27175 ?auto_27193 ) ) ( not ( = ?auto_27176 ?auto_27193 ) ) ( not ( = ?auto_27192 ?auto_27193 ) ) ( not ( = ?auto_27183 ?auto_27194 ) ) ( not ( = ?auto_27189 ?auto_27183 ) ) ( HOIST-AT ?auto_27190 ?auto_27183 ) ( not ( = ?auto_27196 ?auto_27190 ) ) ( not ( = ?auto_27178 ?auto_27190 ) ) ( AVAILABLE ?auto_27190 ) ( SURFACE-AT ?auto_27176 ?auto_27183 ) ( ON ?auto_27176 ?auto_27184 ) ( CLEAR ?auto_27176 ) ( not ( = ?auto_27175 ?auto_27184 ) ) ( not ( = ?auto_27176 ?auto_27184 ) ) ( not ( = ?auto_27192 ?auto_27184 ) ) ( not ( = ?auto_27193 ?auto_27184 ) ) ( IS-CRATE ?auto_27193 ) ( not ( = ?auto_27175 ?auto_27179 ) ) ( not ( = ?auto_27176 ?auto_27179 ) ) ( not ( = ?auto_27192 ?auto_27179 ) ) ( not ( = ?auto_27193 ?auto_27179 ) ) ( not ( = ?auto_27184 ?auto_27179 ) ) ( not ( = ?auto_27186 ?auto_27194 ) ) ( not ( = ?auto_27189 ?auto_27186 ) ) ( not ( = ?auto_27183 ?auto_27186 ) ) ( HOIST-AT ?auto_27181 ?auto_27186 ) ( not ( = ?auto_27196 ?auto_27181 ) ) ( not ( = ?auto_27178 ?auto_27181 ) ) ( not ( = ?auto_27190 ?auto_27181 ) ) ( AVAILABLE ?auto_27181 ) ( SURFACE-AT ?auto_27193 ?auto_27186 ) ( ON ?auto_27193 ?auto_27185 ) ( CLEAR ?auto_27193 ) ( not ( = ?auto_27175 ?auto_27185 ) ) ( not ( = ?auto_27176 ?auto_27185 ) ) ( not ( = ?auto_27192 ?auto_27185 ) ) ( not ( = ?auto_27193 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27179 ?auto_27185 ) ) ( IS-CRATE ?auto_27179 ) ( not ( = ?auto_27175 ?auto_27195 ) ) ( not ( = ?auto_27176 ?auto_27195 ) ) ( not ( = ?auto_27192 ?auto_27195 ) ) ( not ( = ?auto_27193 ?auto_27195 ) ) ( not ( = ?auto_27184 ?auto_27195 ) ) ( not ( = ?auto_27179 ?auto_27195 ) ) ( not ( = ?auto_27185 ?auto_27195 ) ) ( not ( = ?auto_27177 ?auto_27194 ) ) ( not ( = ?auto_27189 ?auto_27177 ) ) ( not ( = ?auto_27183 ?auto_27177 ) ) ( not ( = ?auto_27186 ?auto_27177 ) ) ( HOIST-AT ?auto_27188 ?auto_27177 ) ( not ( = ?auto_27196 ?auto_27188 ) ) ( not ( = ?auto_27178 ?auto_27188 ) ) ( not ( = ?auto_27190 ?auto_27188 ) ) ( not ( = ?auto_27181 ?auto_27188 ) ) ( SURFACE-AT ?auto_27179 ?auto_27177 ) ( ON ?auto_27179 ?auto_27187 ) ( CLEAR ?auto_27179 ) ( not ( = ?auto_27175 ?auto_27187 ) ) ( not ( = ?auto_27176 ?auto_27187 ) ) ( not ( = ?auto_27192 ?auto_27187 ) ) ( not ( = ?auto_27193 ?auto_27187 ) ) ( not ( = ?auto_27184 ?auto_27187 ) ) ( not ( = ?auto_27179 ?auto_27187 ) ) ( not ( = ?auto_27185 ?auto_27187 ) ) ( not ( = ?auto_27195 ?auto_27187 ) ) ( IS-CRATE ?auto_27195 ) ( not ( = ?auto_27175 ?auto_27180 ) ) ( not ( = ?auto_27176 ?auto_27180 ) ) ( not ( = ?auto_27192 ?auto_27180 ) ) ( not ( = ?auto_27193 ?auto_27180 ) ) ( not ( = ?auto_27184 ?auto_27180 ) ) ( not ( = ?auto_27179 ?auto_27180 ) ) ( not ( = ?auto_27185 ?auto_27180 ) ) ( not ( = ?auto_27195 ?auto_27180 ) ) ( not ( = ?auto_27187 ?auto_27180 ) ) ( AVAILABLE ?auto_27188 ) ( SURFACE-AT ?auto_27195 ?auto_27177 ) ( ON ?auto_27195 ?auto_27182 ) ( CLEAR ?auto_27195 ) ( not ( = ?auto_27175 ?auto_27182 ) ) ( not ( = ?auto_27176 ?auto_27182 ) ) ( not ( = ?auto_27192 ?auto_27182 ) ) ( not ( = ?auto_27193 ?auto_27182 ) ) ( not ( = ?auto_27184 ?auto_27182 ) ) ( not ( = ?auto_27179 ?auto_27182 ) ) ( not ( = ?auto_27185 ?auto_27182 ) ) ( not ( = ?auto_27195 ?auto_27182 ) ) ( not ( = ?auto_27187 ?auto_27182 ) ) ( not ( = ?auto_27180 ?auto_27182 ) ) ( TRUCK-AT ?auto_27191 ?auto_27194 ) ( SURFACE-AT ?auto_27197 ?auto_27194 ) ( CLEAR ?auto_27197 ) ( LIFTING ?auto_27196 ?auto_27180 ) ( IS-CRATE ?auto_27180 ) ( not ( = ?auto_27175 ?auto_27197 ) ) ( not ( = ?auto_27176 ?auto_27197 ) ) ( not ( = ?auto_27192 ?auto_27197 ) ) ( not ( = ?auto_27193 ?auto_27197 ) ) ( not ( = ?auto_27184 ?auto_27197 ) ) ( not ( = ?auto_27179 ?auto_27197 ) ) ( not ( = ?auto_27185 ?auto_27197 ) ) ( not ( = ?auto_27195 ?auto_27197 ) ) ( not ( = ?auto_27187 ?auto_27197 ) ) ( not ( = ?auto_27180 ?auto_27197 ) ) ( not ( = ?auto_27182 ?auto_27197 ) ) )
    :subtasks
    ( ( !DROP ?auto_27196 ?auto_27180 ?auto_27197 ?auto_27194 )
      ( MAKE-ON ?auto_27175 ?auto_27176 )
      ( MAKE-ON-VERIFY ?auto_27175 ?auto_27176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27198 - SURFACE
      ?auto_27199 - SURFACE
    )
    :vars
    (
      ?auto_27208 - HOIST
      ?auto_27209 - PLACE
      ?auto_27207 - PLACE
      ?auto_27220 - HOIST
      ?auto_27203 - SURFACE
      ?auto_27211 - SURFACE
      ?auto_27204 - PLACE
      ?auto_27206 - HOIST
      ?auto_27217 - SURFACE
      ?auto_27213 - SURFACE
      ?auto_27216 - PLACE
      ?auto_27205 - HOIST
      ?auto_27214 - SURFACE
      ?auto_27210 - SURFACE
      ?auto_27202 - PLACE
      ?auto_27219 - HOIST
      ?auto_27215 - SURFACE
      ?auto_27212 - SURFACE
      ?auto_27218 - SURFACE
      ?auto_27200 - TRUCK
      ?auto_27201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27208 ?auto_27209 ) ( IS-CRATE ?auto_27198 ) ( not ( = ?auto_27198 ?auto_27199 ) ) ( not ( = ?auto_27207 ?auto_27209 ) ) ( HOIST-AT ?auto_27220 ?auto_27207 ) ( not ( = ?auto_27208 ?auto_27220 ) ) ( AVAILABLE ?auto_27220 ) ( SURFACE-AT ?auto_27198 ?auto_27207 ) ( ON ?auto_27198 ?auto_27203 ) ( CLEAR ?auto_27198 ) ( not ( = ?auto_27198 ?auto_27203 ) ) ( not ( = ?auto_27199 ?auto_27203 ) ) ( IS-CRATE ?auto_27199 ) ( not ( = ?auto_27198 ?auto_27211 ) ) ( not ( = ?auto_27199 ?auto_27211 ) ) ( not ( = ?auto_27203 ?auto_27211 ) ) ( not ( = ?auto_27204 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27204 ) ) ( HOIST-AT ?auto_27206 ?auto_27204 ) ( not ( = ?auto_27208 ?auto_27206 ) ) ( not ( = ?auto_27220 ?auto_27206 ) ) ( AVAILABLE ?auto_27206 ) ( SURFACE-AT ?auto_27199 ?auto_27204 ) ( ON ?auto_27199 ?auto_27217 ) ( CLEAR ?auto_27199 ) ( not ( = ?auto_27198 ?auto_27217 ) ) ( not ( = ?auto_27199 ?auto_27217 ) ) ( not ( = ?auto_27203 ?auto_27217 ) ) ( not ( = ?auto_27211 ?auto_27217 ) ) ( IS-CRATE ?auto_27211 ) ( not ( = ?auto_27198 ?auto_27213 ) ) ( not ( = ?auto_27199 ?auto_27213 ) ) ( not ( = ?auto_27203 ?auto_27213 ) ) ( not ( = ?auto_27211 ?auto_27213 ) ) ( not ( = ?auto_27217 ?auto_27213 ) ) ( not ( = ?auto_27216 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27216 ) ) ( not ( = ?auto_27204 ?auto_27216 ) ) ( HOIST-AT ?auto_27205 ?auto_27216 ) ( not ( = ?auto_27208 ?auto_27205 ) ) ( not ( = ?auto_27220 ?auto_27205 ) ) ( not ( = ?auto_27206 ?auto_27205 ) ) ( AVAILABLE ?auto_27205 ) ( SURFACE-AT ?auto_27211 ?auto_27216 ) ( ON ?auto_27211 ?auto_27214 ) ( CLEAR ?auto_27211 ) ( not ( = ?auto_27198 ?auto_27214 ) ) ( not ( = ?auto_27199 ?auto_27214 ) ) ( not ( = ?auto_27203 ?auto_27214 ) ) ( not ( = ?auto_27211 ?auto_27214 ) ) ( not ( = ?auto_27217 ?auto_27214 ) ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( IS-CRATE ?auto_27213 ) ( not ( = ?auto_27198 ?auto_27210 ) ) ( not ( = ?auto_27199 ?auto_27210 ) ) ( not ( = ?auto_27203 ?auto_27210 ) ) ( not ( = ?auto_27211 ?auto_27210 ) ) ( not ( = ?auto_27217 ?auto_27210 ) ) ( not ( = ?auto_27213 ?auto_27210 ) ) ( not ( = ?auto_27214 ?auto_27210 ) ) ( not ( = ?auto_27202 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27202 ) ) ( not ( = ?auto_27204 ?auto_27202 ) ) ( not ( = ?auto_27216 ?auto_27202 ) ) ( HOIST-AT ?auto_27219 ?auto_27202 ) ( not ( = ?auto_27208 ?auto_27219 ) ) ( not ( = ?auto_27220 ?auto_27219 ) ) ( not ( = ?auto_27206 ?auto_27219 ) ) ( not ( = ?auto_27205 ?auto_27219 ) ) ( SURFACE-AT ?auto_27213 ?auto_27202 ) ( ON ?auto_27213 ?auto_27215 ) ( CLEAR ?auto_27213 ) ( not ( = ?auto_27198 ?auto_27215 ) ) ( not ( = ?auto_27199 ?auto_27215 ) ) ( not ( = ?auto_27203 ?auto_27215 ) ) ( not ( = ?auto_27211 ?auto_27215 ) ) ( not ( = ?auto_27217 ?auto_27215 ) ) ( not ( = ?auto_27213 ?auto_27215 ) ) ( not ( = ?auto_27214 ?auto_27215 ) ) ( not ( = ?auto_27210 ?auto_27215 ) ) ( IS-CRATE ?auto_27210 ) ( not ( = ?auto_27198 ?auto_27212 ) ) ( not ( = ?auto_27199 ?auto_27212 ) ) ( not ( = ?auto_27203 ?auto_27212 ) ) ( not ( = ?auto_27211 ?auto_27212 ) ) ( not ( = ?auto_27217 ?auto_27212 ) ) ( not ( = ?auto_27213 ?auto_27212 ) ) ( not ( = ?auto_27214 ?auto_27212 ) ) ( not ( = ?auto_27210 ?auto_27212 ) ) ( not ( = ?auto_27215 ?auto_27212 ) ) ( AVAILABLE ?auto_27219 ) ( SURFACE-AT ?auto_27210 ?auto_27202 ) ( ON ?auto_27210 ?auto_27218 ) ( CLEAR ?auto_27210 ) ( not ( = ?auto_27198 ?auto_27218 ) ) ( not ( = ?auto_27199 ?auto_27218 ) ) ( not ( = ?auto_27203 ?auto_27218 ) ) ( not ( = ?auto_27211 ?auto_27218 ) ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27210 ?auto_27218 ) ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( TRUCK-AT ?auto_27200 ?auto_27209 ) ( SURFACE-AT ?auto_27201 ?auto_27209 ) ( CLEAR ?auto_27201 ) ( IS-CRATE ?auto_27212 ) ( not ( = ?auto_27198 ?auto_27201 ) ) ( not ( = ?auto_27199 ?auto_27201 ) ) ( not ( = ?auto_27203 ?auto_27201 ) ) ( not ( = ?auto_27211 ?auto_27201 ) ) ( not ( = ?auto_27217 ?auto_27201 ) ) ( not ( = ?auto_27213 ?auto_27201 ) ) ( not ( = ?auto_27214 ?auto_27201 ) ) ( not ( = ?auto_27210 ?auto_27201 ) ) ( not ( = ?auto_27215 ?auto_27201 ) ) ( not ( = ?auto_27212 ?auto_27201 ) ) ( not ( = ?auto_27218 ?auto_27201 ) ) ( AVAILABLE ?auto_27208 ) ( IN ?auto_27212 ?auto_27200 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27208 ?auto_27212 ?auto_27200 ?auto_27209 )
      ( MAKE-ON ?auto_27198 ?auto_27199 )
      ( MAKE-ON-VERIFY ?auto_27198 ?auto_27199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27221 - SURFACE
      ?auto_27222 - SURFACE
    )
    :vars
    (
      ?auto_27243 - HOIST
      ?auto_27240 - PLACE
      ?auto_27225 - PLACE
      ?auto_27230 - HOIST
      ?auto_27226 - SURFACE
      ?auto_27224 - SURFACE
      ?auto_27235 - PLACE
      ?auto_27242 - HOIST
      ?auto_27238 - SURFACE
      ?auto_27223 - SURFACE
      ?auto_27233 - PLACE
      ?auto_27227 - HOIST
      ?auto_27232 - SURFACE
      ?auto_27228 - SURFACE
      ?auto_27236 - PLACE
      ?auto_27229 - HOIST
      ?auto_27237 - SURFACE
      ?auto_27241 - SURFACE
      ?auto_27231 - SURFACE
      ?auto_27234 - SURFACE
      ?auto_27239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27243 ?auto_27240 ) ( IS-CRATE ?auto_27221 ) ( not ( = ?auto_27221 ?auto_27222 ) ) ( not ( = ?auto_27225 ?auto_27240 ) ) ( HOIST-AT ?auto_27230 ?auto_27225 ) ( not ( = ?auto_27243 ?auto_27230 ) ) ( AVAILABLE ?auto_27230 ) ( SURFACE-AT ?auto_27221 ?auto_27225 ) ( ON ?auto_27221 ?auto_27226 ) ( CLEAR ?auto_27221 ) ( not ( = ?auto_27221 ?auto_27226 ) ) ( not ( = ?auto_27222 ?auto_27226 ) ) ( IS-CRATE ?auto_27222 ) ( not ( = ?auto_27221 ?auto_27224 ) ) ( not ( = ?auto_27222 ?auto_27224 ) ) ( not ( = ?auto_27226 ?auto_27224 ) ) ( not ( = ?auto_27235 ?auto_27240 ) ) ( not ( = ?auto_27225 ?auto_27235 ) ) ( HOIST-AT ?auto_27242 ?auto_27235 ) ( not ( = ?auto_27243 ?auto_27242 ) ) ( not ( = ?auto_27230 ?auto_27242 ) ) ( AVAILABLE ?auto_27242 ) ( SURFACE-AT ?auto_27222 ?auto_27235 ) ( ON ?auto_27222 ?auto_27238 ) ( CLEAR ?auto_27222 ) ( not ( = ?auto_27221 ?auto_27238 ) ) ( not ( = ?auto_27222 ?auto_27238 ) ) ( not ( = ?auto_27226 ?auto_27238 ) ) ( not ( = ?auto_27224 ?auto_27238 ) ) ( IS-CRATE ?auto_27224 ) ( not ( = ?auto_27221 ?auto_27223 ) ) ( not ( = ?auto_27222 ?auto_27223 ) ) ( not ( = ?auto_27226 ?auto_27223 ) ) ( not ( = ?auto_27224 ?auto_27223 ) ) ( not ( = ?auto_27238 ?auto_27223 ) ) ( not ( = ?auto_27233 ?auto_27240 ) ) ( not ( = ?auto_27225 ?auto_27233 ) ) ( not ( = ?auto_27235 ?auto_27233 ) ) ( HOIST-AT ?auto_27227 ?auto_27233 ) ( not ( = ?auto_27243 ?auto_27227 ) ) ( not ( = ?auto_27230 ?auto_27227 ) ) ( not ( = ?auto_27242 ?auto_27227 ) ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27224 ?auto_27233 ) ( ON ?auto_27224 ?auto_27232 ) ( CLEAR ?auto_27224 ) ( not ( = ?auto_27221 ?auto_27232 ) ) ( not ( = ?auto_27222 ?auto_27232 ) ) ( not ( = ?auto_27226 ?auto_27232 ) ) ( not ( = ?auto_27224 ?auto_27232 ) ) ( not ( = ?auto_27238 ?auto_27232 ) ) ( not ( = ?auto_27223 ?auto_27232 ) ) ( IS-CRATE ?auto_27223 ) ( not ( = ?auto_27221 ?auto_27228 ) ) ( not ( = ?auto_27222 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27224 ?auto_27228 ) ) ( not ( = ?auto_27238 ?auto_27228 ) ) ( not ( = ?auto_27223 ?auto_27228 ) ) ( not ( = ?auto_27232 ?auto_27228 ) ) ( not ( = ?auto_27236 ?auto_27240 ) ) ( not ( = ?auto_27225 ?auto_27236 ) ) ( not ( = ?auto_27235 ?auto_27236 ) ) ( not ( = ?auto_27233 ?auto_27236 ) ) ( HOIST-AT ?auto_27229 ?auto_27236 ) ( not ( = ?auto_27243 ?auto_27229 ) ) ( not ( = ?auto_27230 ?auto_27229 ) ) ( not ( = ?auto_27242 ?auto_27229 ) ) ( not ( = ?auto_27227 ?auto_27229 ) ) ( SURFACE-AT ?auto_27223 ?auto_27236 ) ( ON ?auto_27223 ?auto_27237 ) ( CLEAR ?auto_27223 ) ( not ( = ?auto_27221 ?auto_27237 ) ) ( not ( = ?auto_27222 ?auto_27237 ) ) ( not ( = ?auto_27226 ?auto_27237 ) ) ( not ( = ?auto_27224 ?auto_27237 ) ) ( not ( = ?auto_27238 ?auto_27237 ) ) ( not ( = ?auto_27223 ?auto_27237 ) ) ( not ( = ?auto_27232 ?auto_27237 ) ) ( not ( = ?auto_27228 ?auto_27237 ) ) ( IS-CRATE ?auto_27228 ) ( not ( = ?auto_27221 ?auto_27241 ) ) ( not ( = ?auto_27222 ?auto_27241 ) ) ( not ( = ?auto_27226 ?auto_27241 ) ) ( not ( = ?auto_27224 ?auto_27241 ) ) ( not ( = ?auto_27238 ?auto_27241 ) ) ( not ( = ?auto_27223 ?auto_27241 ) ) ( not ( = ?auto_27232 ?auto_27241 ) ) ( not ( = ?auto_27228 ?auto_27241 ) ) ( not ( = ?auto_27237 ?auto_27241 ) ) ( AVAILABLE ?auto_27229 ) ( SURFACE-AT ?auto_27228 ?auto_27236 ) ( ON ?auto_27228 ?auto_27231 ) ( CLEAR ?auto_27228 ) ( not ( = ?auto_27221 ?auto_27231 ) ) ( not ( = ?auto_27222 ?auto_27231 ) ) ( not ( = ?auto_27226 ?auto_27231 ) ) ( not ( = ?auto_27224 ?auto_27231 ) ) ( not ( = ?auto_27238 ?auto_27231 ) ) ( not ( = ?auto_27223 ?auto_27231 ) ) ( not ( = ?auto_27232 ?auto_27231 ) ) ( not ( = ?auto_27228 ?auto_27231 ) ) ( not ( = ?auto_27237 ?auto_27231 ) ) ( not ( = ?auto_27241 ?auto_27231 ) ) ( SURFACE-AT ?auto_27234 ?auto_27240 ) ( CLEAR ?auto_27234 ) ( IS-CRATE ?auto_27241 ) ( not ( = ?auto_27221 ?auto_27234 ) ) ( not ( = ?auto_27222 ?auto_27234 ) ) ( not ( = ?auto_27226 ?auto_27234 ) ) ( not ( = ?auto_27224 ?auto_27234 ) ) ( not ( = ?auto_27238 ?auto_27234 ) ) ( not ( = ?auto_27223 ?auto_27234 ) ) ( not ( = ?auto_27232 ?auto_27234 ) ) ( not ( = ?auto_27228 ?auto_27234 ) ) ( not ( = ?auto_27237 ?auto_27234 ) ) ( not ( = ?auto_27241 ?auto_27234 ) ) ( not ( = ?auto_27231 ?auto_27234 ) ) ( AVAILABLE ?auto_27243 ) ( IN ?auto_27241 ?auto_27239 ) ( TRUCK-AT ?auto_27239 ?auto_27235 ) )
    :subtasks
    ( ( !DRIVE ?auto_27239 ?auto_27235 ?auto_27240 )
      ( MAKE-ON ?auto_27221 ?auto_27222 )
      ( MAKE-ON-VERIFY ?auto_27221 ?auto_27222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27244 - SURFACE
      ?auto_27245 - SURFACE
    )
    :vars
    (
      ?auto_27265 - HOIST
      ?auto_27259 - PLACE
      ?auto_27264 - PLACE
      ?auto_27257 - HOIST
      ?auto_27254 - SURFACE
      ?auto_27256 - SURFACE
      ?auto_27263 - PLACE
      ?auto_27249 - HOIST
      ?auto_27246 - SURFACE
      ?auto_27262 - SURFACE
      ?auto_27247 - PLACE
      ?auto_27266 - HOIST
      ?auto_27252 - SURFACE
      ?auto_27255 - SURFACE
      ?auto_27248 - PLACE
      ?auto_27253 - HOIST
      ?auto_27260 - SURFACE
      ?auto_27250 - SURFACE
      ?auto_27261 - SURFACE
      ?auto_27251 - SURFACE
      ?auto_27258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27265 ?auto_27259 ) ( IS-CRATE ?auto_27244 ) ( not ( = ?auto_27244 ?auto_27245 ) ) ( not ( = ?auto_27264 ?auto_27259 ) ) ( HOIST-AT ?auto_27257 ?auto_27264 ) ( not ( = ?auto_27265 ?auto_27257 ) ) ( AVAILABLE ?auto_27257 ) ( SURFACE-AT ?auto_27244 ?auto_27264 ) ( ON ?auto_27244 ?auto_27254 ) ( CLEAR ?auto_27244 ) ( not ( = ?auto_27244 ?auto_27254 ) ) ( not ( = ?auto_27245 ?auto_27254 ) ) ( IS-CRATE ?auto_27245 ) ( not ( = ?auto_27244 ?auto_27256 ) ) ( not ( = ?auto_27245 ?auto_27256 ) ) ( not ( = ?auto_27254 ?auto_27256 ) ) ( not ( = ?auto_27263 ?auto_27259 ) ) ( not ( = ?auto_27264 ?auto_27263 ) ) ( HOIST-AT ?auto_27249 ?auto_27263 ) ( not ( = ?auto_27265 ?auto_27249 ) ) ( not ( = ?auto_27257 ?auto_27249 ) ) ( SURFACE-AT ?auto_27245 ?auto_27263 ) ( ON ?auto_27245 ?auto_27246 ) ( CLEAR ?auto_27245 ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27254 ?auto_27246 ) ) ( not ( = ?auto_27256 ?auto_27246 ) ) ( IS-CRATE ?auto_27256 ) ( not ( = ?auto_27244 ?auto_27262 ) ) ( not ( = ?auto_27245 ?auto_27262 ) ) ( not ( = ?auto_27254 ?auto_27262 ) ) ( not ( = ?auto_27256 ?auto_27262 ) ) ( not ( = ?auto_27246 ?auto_27262 ) ) ( not ( = ?auto_27247 ?auto_27259 ) ) ( not ( = ?auto_27264 ?auto_27247 ) ) ( not ( = ?auto_27263 ?auto_27247 ) ) ( HOIST-AT ?auto_27266 ?auto_27247 ) ( not ( = ?auto_27265 ?auto_27266 ) ) ( not ( = ?auto_27257 ?auto_27266 ) ) ( not ( = ?auto_27249 ?auto_27266 ) ) ( AVAILABLE ?auto_27266 ) ( SURFACE-AT ?auto_27256 ?auto_27247 ) ( ON ?auto_27256 ?auto_27252 ) ( CLEAR ?auto_27256 ) ( not ( = ?auto_27244 ?auto_27252 ) ) ( not ( = ?auto_27245 ?auto_27252 ) ) ( not ( = ?auto_27254 ?auto_27252 ) ) ( not ( = ?auto_27256 ?auto_27252 ) ) ( not ( = ?auto_27246 ?auto_27252 ) ) ( not ( = ?auto_27262 ?auto_27252 ) ) ( IS-CRATE ?auto_27262 ) ( not ( = ?auto_27244 ?auto_27255 ) ) ( not ( = ?auto_27245 ?auto_27255 ) ) ( not ( = ?auto_27254 ?auto_27255 ) ) ( not ( = ?auto_27256 ?auto_27255 ) ) ( not ( = ?auto_27246 ?auto_27255 ) ) ( not ( = ?auto_27262 ?auto_27255 ) ) ( not ( = ?auto_27252 ?auto_27255 ) ) ( not ( = ?auto_27248 ?auto_27259 ) ) ( not ( = ?auto_27264 ?auto_27248 ) ) ( not ( = ?auto_27263 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( HOIST-AT ?auto_27253 ?auto_27248 ) ( not ( = ?auto_27265 ?auto_27253 ) ) ( not ( = ?auto_27257 ?auto_27253 ) ) ( not ( = ?auto_27249 ?auto_27253 ) ) ( not ( = ?auto_27266 ?auto_27253 ) ) ( SURFACE-AT ?auto_27262 ?auto_27248 ) ( ON ?auto_27262 ?auto_27260 ) ( CLEAR ?auto_27262 ) ( not ( = ?auto_27244 ?auto_27260 ) ) ( not ( = ?auto_27245 ?auto_27260 ) ) ( not ( = ?auto_27254 ?auto_27260 ) ) ( not ( = ?auto_27256 ?auto_27260 ) ) ( not ( = ?auto_27246 ?auto_27260 ) ) ( not ( = ?auto_27262 ?auto_27260 ) ) ( not ( = ?auto_27252 ?auto_27260 ) ) ( not ( = ?auto_27255 ?auto_27260 ) ) ( IS-CRATE ?auto_27255 ) ( not ( = ?auto_27244 ?auto_27250 ) ) ( not ( = ?auto_27245 ?auto_27250 ) ) ( not ( = ?auto_27254 ?auto_27250 ) ) ( not ( = ?auto_27256 ?auto_27250 ) ) ( not ( = ?auto_27246 ?auto_27250 ) ) ( not ( = ?auto_27262 ?auto_27250 ) ) ( not ( = ?auto_27252 ?auto_27250 ) ) ( not ( = ?auto_27255 ?auto_27250 ) ) ( not ( = ?auto_27260 ?auto_27250 ) ) ( AVAILABLE ?auto_27253 ) ( SURFACE-AT ?auto_27255 ?auto_27248 ) ( ON ?auto_27255 ?auto_27261 ) ( CLEAR ?auto_27255 ) ( not ( = ?auto_27244 ?auto_27261 ) ) ( not ( = ?auto_27245 ?auto_27261 ) ) ( not ( = ?auto_27254 ?auto_27261 ) ) ( not ( = ?auto_27256 ?auto_27261 ) ) ( not ( = ?auto_27246 ?auto_27261 ) ) ( not ( = ?auto_27262 ?auto_27261 ) ) ( not ( = ?auto_27252 ?auto_27261 ) ) ( not ( = ?auto_27255 ?auto_27261 ) ) ( not ( = ?auto_27260 ?auto_27261 ) ) ( not ( = ?auto_27250 ?auto_27261 ) ) ( SURFACE-AT ?auto_27251 ?auto_27259 ) ( CLEAR ?auto_27251 ) ( IS-CRATE ?auto_27250 ) ( not ( = ?auto_27244 ?auto_27251 ) ) ( not ( = ?auto_27245 ?auto_27251 ) ) ( not ( = ?auto_27254 ?auto_27251 ) ) ( not ( = ?auto_27256 ?auto_27251 ) ) ( not ( = ?auto_27246 ?auto_27251 ) ) ( not ( = ?auto_27262 ?auto_27251 ) ) ( not ( = ?auto_27252 ?auto_27251 ) ) ( not ( = ?auto_27255 ?auto_27251 ) ) ( not ( = ?auto_27260 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27261 ?auto_27251 ) ) ( AVAILABLE ?auto_27265 ) ( TRUCK-AT ?auto_27258 ?auto_27263 ) ( LIFTING ?auto_27249 ?auto_27250 ) )
    :subtasks
    ( ( !LOAD ?auto_27249 ?auto_27250 ?auto_27258 ?auto_27263 )
      ( MAKE-ON ?auto_27244 ?auto_27245 )
      ( MAKE-ON-VERIFY ?auto_27244 ?auto_27245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27267 - SURFACE
      ?auto_27268 - SURFACE
    )
    :vars
    (
      ?auto_27270 - HOIST
      ?auto_27277 - PLACE
      ?auto_27273 - PLACE
      ?auto_27288 - HOIST
      ?auto_27274 - SURFACE
      ?auto_27289 - SURFACE
      ?auto_27279 - PLACE
      ?auto_27285 - HOIST
      ?auto_27280 - SURFACE
      ?auto_27276 - SURFACE
      ?auto_27284 - PLACE
      ?auto_27271 - HOIST
      ?auto_27278 - SURFACE
      ?auto_27275 - SURFACE
      ?auto_27283 - PLACE
      ?auto_27282 - HOIST
      ?auto_27281 - SURFACE
      ?auto_27286 - SURFACE
      ?auto_27272 - SURFACE
      ?auto_27269 - SURFACE
      ?auto_27287 - TRUCK
      ?auto_27290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27270 ?auto_27277 ) ( IS-CRATE ?auto_27267 ) ( not ( = ?auto_27267 ?auto_27268 ) ) ( not ( = ?auto_27273 ?auto_27277 ) ) ( HOIST-AT ?auto_27288 ?auto_27273 ) ( not ( = ?auto_27270 ?auto_27288 ) ) ( AVAILABLE ?auto_27288 ) ( SURFACE-AT ?auto_27267 ?auto_27273 ) ( ON ?auto_27267 ?auto_27274 ) ( CLEAR ?auto_27267 ) ( not ( = ?auto_27267 ?auto_27274 ) ) ( not ( = ?auto_27268 ?auto_27274 ) ) ( IS-CRATE ?auto_27268 ) ( not ( = ?auto_27267 ?auto_27289 ) ) ( not ( = ?auto_27268 ?auto_27289 ) ) ( not ( = ?auto_27274 ?auto_27289 ) ) ( not ( = ?auto_27279 ?auto_27277 ) ) ( not ( = ?auto_27273 ?auto_27279 ) ) ( HOIST-AT ?auto_27285 ?auto_27279 ) ( not ( = ?auto_27270 ?auto_27285 ) ) ( not ( = ?auto_27288 ?auto_27285 ) ) ( SURFACE-AT ?auto_27268 ?auto_27279 ) ( ON ?auto_27268 ?auto_27280 ) ( CLEAR ?auto_27268 ) ( not ( = ?auto_27267 ?auto_27280 ) ) ( not ( = ?auto_27268 ?auto_27280 ) ) ( not ( = ?auto_27274 ?auto_27280 ) ) ( not ( = ?auto_27289 ?auto_27280 ) ) ( IS-CRATE ?auto_27289 ) ( not ( = ?auto_27267 ?auto_27276 ) ) ( not ( = ?auto_27268 ?auto_27276 ) ) ( not ( = ?auto_27274 ?auto_27276 ) ) ( not ( = ?auto_27289 ?auto_27276 ) ) ( not ( = ?auto_27280 ?auto_27276 ) ) ( not ( = ?auto_27284 ?auto_27277 ) ) ( not ( = ?auto_27273 ?auto_27284 ) ) ( not ( = ?auto_27279 ?auto_27284 ) ) ( HOIST-AT ?auto_27271 ?auto_27284 ) ( not ( = ?auto_27270 ?auto_27271 ) ) ( not ( = ?auto_27288 ?auto_27271 ) ) ( not ( = ?auto_27285 ?auto_27271 ) ) ( AVAILABLE ?auto_27271 ) ( SURFACE-AT ?auto_27289 ?auto_27284 ) ( ON ?auto_27289 ?auto_27278 ) ( CLEAR ?auto_27289 ) ( not ( = ?auto_27267 ?auto_27278 ) ) ( not ( = ?auto_27268 ?auto_27278 ) ) ( not ( = ?auto_27274 ?auto_27278 ) ) ( not ( = ?auto_27289 ?auto_27278 ) ) ( not ( = ?auto_27280 ?auto_27278 ) ) ( not ( = ?auto_27276 ?auto_27278 ) ) ( IS-CRATE ?auto_27276 ) ( not ( = ?auto_27267 ?auto_27275 ) ) ( not ( = ?auto_27268 ?auto_27275 ) ) ( not ( = ?auto_27274 ?auto_27275 ) ) ( not ( = ?auto_27289 ?auto_27275 ) ) ( not ( = ?auto_27280 ?auto_27275 ) ) ( not ( = ?auto_27276 ?auto_27275 ) ) ( not ( = ?auto_27278 ?auto_27275 ) ) ( not ( = ?auto_27283 ?auto_27277 ) ) ( not ( = ?auto_27273 ?auto_27283 ) ) ( not ( = ?auto_27279 ?auto_27283 ) ) ( not ( = ?auto_27284 ?auto_27283 ) ) ( HOIST-AT ?auto_27282 ?auto_27283 ) ( not ( = ?auto_27270 ?auto_27282 ) ) ( not ( = ?auto_27288 ?auto_27282 ) ) ( not ( = ?auto_27285 ?auto_27282 ) ) ( not ( = ?auto_27271 ?auto_27282 ) ) ( SURFACE-AT ?auto_27276 ?auto_27283 ) ( ON ?auto_27276 ?auto_27281 ) ( CLEAR ?auto_27276 ) ( not ( = ?auto_27267 ?auto_27281 ) ) ( not ( = ?auto_27268 ?auto_27281 ) ) ( not ( = ?auto_27274 ?auto_27281 ) ) ( not ( = ?auto_27289 ?auto_27281 ) ) ( not ( = ?auto_27280 ?auto_27281 ) ) ( not ( = ?auto_27276 ?auto_27281 ) ) ( not ( = ?auto_27278 ?auto_27281 ) ) ( not ( = ?auto_27275 ?auto_27281 ) ) ( IS-CRATE ?auto_27275 ) ( not ( = ?auto_27267 ?auto_27286 ) ) ( not ( = ?auto_27268 ?auto_27286 ) ) ( not ( = ?auto_27274 ?auto_27286 ) ) ( not ( = ?auto_27289 ?auto_27286 ) ) ( not ( = ?auto_27280 ?auto_27286 ) ) ( not ( = ?auto_27276 ?auto_27286 ) ) ( not ( = ?auto_27278 ?auto_27286 ) ) ( not ( = ?auto_27275 ?auto_27286 ) ) ( not ( = ?auto_27281 ?auto_27286 ) ) ( AVAILABLE ?auto_27282 ) ( SURFACE-AT ?auto_27275 ?auto_27283 ) ( ON ?auto_27275 ?auto_27272 ) ( CLEAR ?auto_27275 ) ( not ( = ?auto_27267 ?auto_27272 ) ) ( not ( = ?auto_27268 ?auto_27272 ) ) ( not ( = ?auto_27274 ?auto_27272 ) ) ( not ( = ?auto_27289 ?auto_27272 ) ) ( not ( = ?auto_27280 ?auto_27272 ) ) ( not ( = ?auto_27276 ?auto_27272 ) ) ( not ( = ?auto_27278 ?auto_27272 ) ) ( not ( = ?auto_27275 ?auto_27272 ) ) ( not ( = ?auto_27281 ?auto_27272 ) ) ( not ( = ?auto_27286 ?auto_27272 ) ) ( SURFACE-AT ?auto_27269 ?auto_27277 ) ( CLEAR ?auto_27269 ) ( IS-CRATE ?auto_27286 ) ( not ( = ?auto_27267 ?auto_27269 ) ) ( not ( = ?auto_27268 ?auto_27269 ) ) ( not ( = ?auto_27274 ?auto_27269 ) ) ( not ( = ?auto_27289 ?auto_27269 ) ) ( not ( = ?auto_27280 ?auto_27269 ) ) ( not ( = ?auto_27276 ?auto_27269 ) ) ( not ( = ?auto_27278 ?auto_27269 ) ) ( not ( = ?auto_27275 ?auto_27269 ) ) ( not ( = ?auto_27281 ?auto_27269 ) ) ( not ( = ?auto_27286 ?auto_27269 ) ) ( not ( = ?auto_27272 ?auto_27269 ) ) ( AVAILABLE ?auto_27270 ) ( TRUCK-AT ?auto_27287 ?auto_27279 ) ( AVAILABLE ?auto_27285 ) ( SURFACE-AT ?auto_27286 ?auto_27279 ) ( ON ?auto_27286 ?auto_27290 ) ( CLEAR ?auto_27286 ) ( not ( = ?auto_27267 ?auto_27290 ) ) ( not ( = ?auto_27268 ?auto_27290 ) ) ( not ( = ?auto_27274 ?auto_27290 ) ) ( not ( = ?auto_27289 ?auto_27290 ) ) ( not ( = ?auto_27280 ?auto_27290 ) ) ( not ( = ?auto_27276 ?auto_27290 ) ) ( not ( = ?auto_27278 ?auto_27290 ) ) ( not ( = ?auto_27275 ?auto_27290 ) ) ( not ( = ?auto_27281 ?auto_27290 ) ) ( not ( = ?auto_27286 ?auto_27290 ) ) ( not ( = ?auto_27272 ?auto_27290 ) ) ( not ( = ?auto_27269 ?auto_27290 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27285 ?auto_27286 ?auto_27290 ?auto_27279 )
      ( MAKE-ON ?auto_27267 ?auto_27268 )
      ( MAKE-ON-VERIFY ?auto_27267 ?auto_27268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27291 - SURFACE
      ?auto_27292 - SURFACE
    )
    :vars
    (
      ?auto_27314 - HOIST
      ?auto_27294 - PLACE
      ?auto_27293 - PLACE
      ?auto_27312 - HOIST
      ?auto_27301 - SURFACE
      ?auto_27313 - SURFACE
      ?auto_27295 - PLACE
      ?auto_27309 - HOIST
      ?auto_27298 - SURFACE
      ?auto_27303 - SURFACE
      ?auto_27299 - PLACE
      ?auto_27305 - HOIST
      ?auto_27296 - SURFACE
      ?auto_27308 - SURFACE
      ?auto_27307 - PLACE
      ?auto_27302 - HOIST
      ?auto_27297 - SURFACE
      ?auto_27310 - SURFACE
      ?auto_27304 - SURFACE
      ?auto_27300 - SURFACE
      ?auto_27306 - SURFACE
      ?auto_27311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27314 ?auto_27294 ) ( IS-CRATE ?auto_27291 ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( HOIST-AT ?auto_27312 ?auto_27293 ) ( not ( = ?auto_27314 ?auto_27312 ) ) ( AVAILABLE ?auto_27312 ) ( SURFACE-AT ?auto_27291 ?auto_27293 ) ( ON ?auto_27291 ?auto_27301 ) ( CLEAR ?auto_27291 ) ( not ( = ?auto_27291 ?auto_27301 ) ) ( not ( = ?auto_27292 ?auto_27301 ) ) ( IS-CRATE ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27313 ) ) ( not ( = ?auto_27292 ?auto_27313 ) ) ( not ( = ?auto_27301 ?auto_27313 ) ) ( not ( = ?auto_27295 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27295 ) ) ( HOIST-AT ?auto_27309 ?auto_27295 ) ( not ( = ?auto_27314 ?auto_27309 ) ) ( not ( = ?auto_27312 ?auto_27309 ) ) ( SURFACE-AT ?auto_27292 ?auto_27295 ) ( ON ?auto_27292 ?auto_27298 ) ( CLEAR ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27298 ) ) ( not ( = ?auto_27292 ?auto_27298 ) ) ( not ( = ?auto_27301 ?auto_27298 ) ) ( not ( = ?auto_27313 ?auto_27298 ) ) ( IS-CRATE ?auto_27313 ) ( not ( = ?auto_27291 ?auto_27303 ) ) ( not ( = ?auto_27292 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27313 ?auto_27303 ) ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( not ( = ?auto_27299 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27299 ) ) ( not ( = ?auto_27295 ?auto_27299 ) ) ( HOIST-AT ?auto_27305 ?auto_27299 ) ( not ( = ?auto_27314 ?auto_27305 ) ) ( not ( = ?auto_27312 ?auto_27305 ) ) ( not ( = ?auto_27309 ?auto_27305 ) ) ( AVAILABLE ?auto_27305 ) ( SURFACE-AT ?auto_27313 ?auto_27299 ) ( ON ?auto_27313 ?auto_27296 ) ( CLEAR ?auto_27313 ) ( not ( = ?auto_27291 ?auto_27296 ) ) ( not ( = ?auto_27292 ?auto_27296 ) ) ( not ( = ?auto_27301 ?auto_27296 ) ) ( not ( = ?auto_27313 ?auto_27296 ) ) ( not ( = ?auto_27298 ?auto_27296 ) ) ( not ( = ?auto_27303 ?auto_27296 ) ) ( IS-CRATE ?auto_27303 ) ( not ( = ?auto_27291 ?auto_27308 ) ) ( not ( = ?auto_27292 ?auto_27308 ) ) ( not ( = ?auto_27301 ?auto_27308 ) ) ( not ( = ?auto_27313 ?auto_27308 ) ) ( not ( = ?auto_27298 ?auto_27308 ) ) ( not ( = ?auto_27303 ?auto_27308 ) ) ( not ( = ?auto_27296 ?auto_27308 ) ) ( not ( = ?auto_27307 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27307 ) ) ( not ( = ?auto_27295 ?auto_27307 ) ) ( not ( = ?auto_27299 ?auto_27307 ) ) ( HOIST-AT ?auto_27302 ?auto_27307 ) ( not ( = ?auto_27314 ?auto_27302 ) ) ( not ( = ?auto_27312 ?auto_27302 ) ) ( not ( = ?auto_27309 ?auto_27302 ) ) ( not ( = ?auto_27305 ?auto_27302 ) ) ( SURFACE-AT ?auto_27303 ?auto_27307 ) ( ON ?auto_27303 ?auto_27297 ) ( CLEAR ?auto_27303 ) ( not ( = ?auto_27291 ?auto_27297 ) ) ( not ( = ?auto_27292 ?auto_27297 ) ) ( not ( = ?auto_27301 ?auto_27297 ) ) ( not ( = ?auto_27313 ?auto_27297 ) ) ( not ( = ?auto_27298 ?auto_27297 ) ) ( not ( = ?auto_27303 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( not ( = ?auto_27308 ?auto_27297 ) ) ( IS-CRATE ?auto_27308 ) ( not ( = ?auto_27291 ?auto_27310 ) ) ( not ( = ?auto_27292 ?auto_27310 ) ) ( not ( = ?auto_27301 ?auto_27310 ) ) ( not ( = ?auto_27313 ?auto_27310 ) ) ( not ( = ?auto_27298 ?auto_27310 ) ) ( not ( = ?auto_27303 ?auto_27310 ) ) ( not ( = ?auto_27296 ?auto_27310 ) ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27297 ?auto_27310 ) ) ( AVAILABLE ?auto_27302 ) ( SURFACE-AT ?auto_27308 ?auto_27307 ) ( ON ?auto_27308 ?auto_27304 ) ( CLEAR ?auto_27308 ) ( not ( = ?auto_27291 ?auto_27304 ) ) ( not ( = ?auto_27292 ?auto_27304 ) ) ( not ( = ?auto_27301 ?auto_27304 ) ) ( not ( = ?auto_27313 ?auto_27304 ) ) ( not ( = ?auto_27298 ?auto_27304 ) ) ( not ( = ?auto_27303 ?auto_27304 ) ) ( not ( = ?auto_27296 ?auto_27304 ) ) ( not ( = ?auto_27308 ?auto_27304 ) ) ( not ( = ?auto_27297 ?auto_27304 ) ) ( not ( = ?auto_27310 ?auto_27304 ) ) ( SURFACE-AT ?auto_27300 ?auto_27294 ) ( CLEAR ?auto_27300 ) ( IS-CRATE ?auto_27310 ) ( not ( = ?auto_27291 ?auto_27300 ) ) ( not ( = ?auto_27292 ?auto_27300 ) ) ( not ( = ?auto_27301 ?auto_27300 ) ) ( not ( = ?auto_27313 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27303 ?auto_27300 ) ) ( not ( = ?auto_27296 ?auto_27300 ) ) ( not ( = ?auto_27308 ?auto_27300 ) ) ( not ( = ?auto_27297 ?auto_27300 ) ) ( not ( = ?auto_27310 ?auto_27300 ) ) ( not ( = ?auto_27304 ?auto_27300 ) ) ( AVAILABLE ?auto_27314 ) ( AVAILABLE ?auto_27309 ) ( SURFACE-AT ?auto_27310 ?auto_27295 ) ( ON ?auto_27310 ?auto_27306 ) ( CLEAR ?auto_27310 ) ( not ( = ?auto_27291 ?auto_27306 ) ) ( not ( = ?auto_27292 ?auto_27306 ) ) ( not ( = ?auto_27301 ?auto_27306 ) ) ( not ( = ?auto_27313 ?auto_27306 ) ) ( not ( = ?auto_27298 ?auto_27306 ) ) ( not ( = ?auto_27303 ?auto_27306 ) ) ( not ( = ?auto_27296 ?auto_27306 ) ) ( not ( = ?auto_27308 ?auto_27306 ) ) ( not ( = ?auto_27297 ?auto_27306 ) ) ( not ( = ?auto_27310 ?auto_27306 ) ) ( not ( = ?auto_27304 ?auto_27306 ) ) ( not ( = ?auto_27300 ?auto_27306 ) ) ( TRUCK-AT ?auto_27311 ?auto_27294 ) )
    :subtasks
    ( ( !DRIVE ?auto_27311 ?auto_27294 ?auto_27295 )
      ( MAKE-ON ?auto_27291 ?auto_27292 )
      ( MAKE-ON-VERIFY ?auto_27291 ?auto_27292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27315 - SURFACE
      ?auto_27316 - SURFACE
    )
    :vars
    (
      ?auto_27318 - HOIST
      ?auto_27333 - PLACE
      ?auto_27326 - PLACE
      ?auto_27319 - HOIST
      ?auto_27331 - SURFACE
      ?auto_27317 - SURFACE
      ?auto_27335 - PLACE
      ?auto_27332 - HOIST
      ?auto_27338 - SURFACE
      ?auto_27324 - SURFACE
      ?auto_27330 - PLACE
      ?auto_27327 - HOIST
      ?auto_27321 - SURFACE
      ?auto_27329 - SURFACE
      ?auto_27334 - PLACE
      ?auto_27325 - HOIST
      ?auto_27322 - SURFACE
      ?auto_27320 - SURFACE
      ?auto_27337 - SURFACE
      ?auto_27323 - SURFACE
      ?auto_27336 - SURFACE
      ?auto_27328 - TRUCK
      ?auto_27339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27318 ?auto_27333 ) ( IS-CRATE ?auto_27315 ) ( not ( = ?auto_27315 ?auto_27316 ) ) ( not ( = ?auto_27326 ?auto_27333 ) ) ( HOIST-AT ?auto_27319 ?auto_27326 ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( AVAILABLE ?auto_27319 ) ( SURFACE-AT ?auto_27315 ?auto_27326 ) ( ON ?auto_27315 ?auto_27331 ) ( CLEAR ?auto_27315 ) ( not ( = ?auto_27315 ?auto_27331 ) ) ( not ( = ?auto_27316 ?auto_27331 ) ) ( IS-CRATE ?auto_27316 ) ( not ( = ?auto_27315 ?auto_27317 ) ) ( not ( = ?auto_27316 ?auto_27317 ) ) ( not ( = ?auto_27331 ?auto_27317 ) ) ( not ( = ?auto_27335 ?auto_27333 ) ) ( not ( = ?auto_27326 ?auto_27335 ) ) ( HOIST-AT ?auto_27332 ?auto_27335 ) ( not ( = ?auto_27318 ?auto_27332 ) ) ( not ( = ?auto_27319 ?auto_27332 ) ) ( SURFACE-AT ?auto_27316 ?auto_27335 ) ( ON ?auto_27316 ?auto_27338 ) ( CLEAR ?auto_27316 ) ( not ( = ?auto_27315 ?auto_27338 ) ) ( not ( = ?auto_27316 ?auto_27338 ) ) ( not ( = ?auto_27331 ?auto_27338 ) ) ( not ( = ?auto_27317 ?auto_27338 ) ) ( IS-CRATE ?auto_27317 ) ( not ( = ?auto_27315 ?auto_27324 ) ) ( not ( = ?auto_27316 ?auto_27324 ) ) ( not ( = ?auto_27331 ?auto_27324 ) ) ( not ( = ?auto_27317 ?auto_27324 ) ) ( not ( = ?auto_27338 ?auto_27324 ) ) ( not ( = ?auto_27330 ?auto_27333 ) ) ( not ( = ?auto_27326 ?auto_27330 ) ) ( not ( = ?auto_27335 ?auto_27330 ) ) ( HOIST-AT ?auto_27327 ?auto_27330 ) ( not ( = ?auto_27318 ?auto_27327 ) ) ( not ( = ?auto_27319 ?auto_27327 ) ) ( not ( = ?auto_27332 ?auto_27327 ) ) ( AVAILABLE ?auto_27327 ) ( SURFACE-AT ?auto_27317 ?auto_27330 ) ( ON ?auto_27317 ?auto_27321 ) ( CLEAR ?auto_27317 ) ( not ( = ?auto_27315 ?auto_27321 ) ) ( not ( = ?auto_27316 ?auto_27321 ) ) ( not ( = ?auto_27331 ?auto_27321 ) ) ( not ( = ?auto_27317 ?auto_27321 ) ) ( not ( = ?auto_27338 ?auto_27321 ) ) ( not ( = ?auto_27324 ?auto_27321 ) ) ( IS-CRATE ?auto_27324 ) ( not ( = ?auto_27315 ?auto_27329 ) ) ( not ( = ?auto_27316 ?auto_27329 ) ) ( not ( = ?auto_27331 ?auto_27329 ) ) ( not ( = ?auto_27317 ?auto_27329 ) ) ( not ( = ?auto_27338 ?auto_27329 ) ) ( not ( = ?auto_27324 ?auto_27329 ) ) ( not ( = ?auto_27321 ?auto_27329 ) ) ( not ( = ?auto_27334 ?auto_27333 ) ) ( not ( = ?auto_27326 ?auto_27334 ) ) ( not ( = ?auto_27335 ?auto_27334 ) ) ( not ( = ?auto_27330 ?auto_27334 ) ) ( HOIST-AT ?auto_27325 ?auto_27334 ) ( not ( = ?auto_27318 ?auto_27325 ) ) ( not ( = ?auto_27319 ?auto_27325 ) ) ( not ( = ?auto_27332 ?auto_27325 ) ) ( not ( = ?auto_27327 ?auto_27325 ) ) ( SURFACE-AT ?auto_27324 ?auto_27334 ) ( ON ?auto_27324 ?auto_27322 ) ( CLEAR ?auto_27324 ) ( not ( = ?auto_27315 ?auto_27322 ) ) ( not ( = ?auto_27316 ?auto_27322 ) ) ( not ( = ?auto_27331 ?auto_27322 ) ) ( not ( = ?auto_27317 ?auto_27322 ) ) ( not ( = ?auto_27338 ?auto_27322 ) ) ( not ( = ?auto_27324 ?auto_27322 ) ) ( not ( = ?auto_27321 ?auto_27322 ) ) ( not ( = ?auto_27329 ?auto_27322 ) ) ( IS-CRATE ?auto_27329 ) ( not ( = ?auto_27315 ?auto_27320 ) ) ( not ( = ?auto_27316 ?auto_27320 ) ) ( not ( = ?auto_27331 ?auto_27320 ) ) ( not ( = ?auto_27317 ?auto_27320 ) ) ( not ( = ?auto_27338 ?auto_27320 ) ) ( not ( = ?auto_27324 ?auto_27320 ) ) ( not ( = ?auto_27321 ?auto_27320 ) ) ( not ( = ?auto_27329 ?auto_27320 ) ) ( not ( = ?auto_27322 ?auto_27320 ) ) ( AVAILABLE ?auto_27325 ) ( SURFACE-AT ?auto_27329 ?auto_27334 ) ( ON ?auto_27329 ?auto_27337 ) ( CLEAR ?auto_27329 ) ( not ( = ?auto_27315 ?auto_27337 ) ) ( not ( = ?auto_27316 ?auto_27337 ) ) ( not ( = ?auto_27331 ?auto_27337 ) ) ( not ( = ?auto_27317 ?auto_27337 ) ) ( not ( = ?auto_27338 ?auto_27337 ) ) ( not ( = ?auto_27324 ?auto_27337 ) ) ( not ( = ?auto_27321 ?auto_27337 ) ) ( not ( = ?auto_27329 ?auto_27337 ) ) ( not ( = ?auto_27322 ?auto_27337 ) ) ( not ( = ?auto_27320 ?auto_27337 ) ) ( IS-CRATE ?auto_27320 ) ( not ( = ?auto_27315 ?auto_27323 ) ) ( not ( = ?auto_27316 ?auto_27323 ) ) ( not ( = ?auto_27331 ?auto_27323 ) ) ( not ( = ?auto_27317 ?auto_27323 ) ) ( not ( = ?auto_27338 ?auto_27323 ) ) ( not ( = ?auto_27324 ?auto_27323 ) ) ( not ( = ?auto_27321 ?auto_27323 ) ) ( not ( = ?auto_27329 ?auto_27323 ) ) ( not ( = ?auto_27322 ?auto_27323 ) ) ( not ( = ?auto_27320 ?auto_27323 ) ) ( not ( = ?auto_27337 ?auto_27323 ) ) ( AVAILABLE ?auto_27332 ) ( SURFACE-AT ?auto_27320 ?auto_27335 ) ( ON ?auto_27320 ?auto_27336 ) ( CLEAR ?auto_27320 ) ( not ( = ?auto_27315 ?auto_27336 ) ) ( not ( = ?auto_27316 ?auto_27336 ) ) ( not ( = ?auto_27331 ?auto_27336 ) ) ( not ( = ?auto_27317 ?auto_27336 ) ) ( not ( = ?auto_27338 ?auto_27336 ) ) ( not ( = ?auto_27324 ?auto_27336 ) ) ( not ( = ?auto_27321 ?auto_27336 ) ) ( not ( = ?auto_27329 ?auto_27336 ) ) ( not ( = ?auto_27322 ?auto_27336 ) ) ( not ( = ?auto_27320 ?auto_27336 ) ) ( not ( = ?auto_27337 ?auto_27336 ) ) ( not ( = ?auto_27323 ?auto_27336 ) ) ( TRUCK-AT ?auto_27328 ?auto_27333 ) ( SURFACE-AT ?auto_27339 ?auto_27333 ) ( CLEAR ?auto_27339 ) ( LIFTING ?auto_27318 ?auto_27323 ) ( IS-CRATE ?auto_27323 ) ( not ( = ?auto_27315 ?auto_27339 ) ) ( not ( = ?auto_27316 ?auto_27339 ) ) ( not ( = ?auto_27331 ?auto_27339 ) ) ( not ( = ?auto_27317 ?auto_27339 ) ) ( not ( = ?auto_27338 ?auto_27339 ) ) ( not ( = ?auto_27324 ?auto_27339 ) ) ( not ( = ?auto_27321 ?auto_27339 ) ) ( not ( = ?auto_27329 ?auto_27339 ) ) ( not ( = ?auto_27322 ?auto_27339 ) ) ( not ( = ?auto_27320 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( not ( = ?auto_27323 ?auto_27339 ) ) ( not ( = ?auto_27336 ?auto_27339 ) ) )
    :subtasks
    ( ( !DROP ?auto_27318 ?auto_27323 ?auto_27339 ?auto_27333 )
      ( MAKE-ON ?auto_27315 ?auto_27316 )
      ( MAKE-ON-VERIFY ?auto_27315 ?auto_27316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27340 - SURFACE
      ?auto_27341 - SURFACE
    )
    :vars
    (
      ?auto_27352 - HOIST
      ?auto_27345 - PLACE
      ?auto_27347 - PLACE
      ?auto_27358 - HOIST
      ?auto_27351 - SURFACE
      ?auto_27363 - SURFACE
      ?auto_27349 - PLACE
      ?auto_27354 - HOIST
      ?auto_27353 - SURFACE
      ?auto_27346 - SURFACE
      ?auto_27342 - PLACE
      ?auto_27360 - HOIST
      ?auto_27350 - SURFACE
      ?auto_27344 - SURFACE
      ?auto_27348 - PLACE
      ?auto_27362 - HOIST
      ?auto_27359 - SURFACE
      ?auto_27361 - SURFACE
      ?auto_27357 - SURFACE
      ?auto_27355 - SURFACE
      ?auto_27356 - SURFACE
      ?auto_27343 - TRUCK
      ?auto_27364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27352 ?auto_27345 ) ( IS-CRATE ?auto_27340 ) ( not ( = ?auto_27340 ?auto_27341 ) ) ( not ( = ?auto_27347 ?auto_27345 ) ) ( HOIST-AT ?auto_27358 ?auto_27347 ) ( not ( = ?auto_27352 ?auto_27358 ) ) ( AVAILABLE ?auto_27358 ) ( SURFACE-AT ?auto_27340 ?auto_27347 ) ( ON ?auto_27340 ?auto_27351 ) ( CLEAR ?auto_27340 ) ( not ( = ?auto_27340 ?auto_27351 ) ) ( not ( = ?auto_27341 ?auto_27351 ) ) ( IS-CRATE ?auto_27341 ) ( not ( = ?auto_27340 ?auto_27363 ) ) ( not ( = ?auto_27341 ?auto_27363 ) ) ( not ( = ?auto_27351 ?auto_27363 ) ) ( not ( = ?auto_27349 ?auto_27345 ) ) ( not ( = ?auto_27347 ?auto_27349 ) ) ( HOIST-AT ?auto_27354 ?auto_27349 ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( not ( = ?auto_27358 ?auto_27354 ) ) ( SURFACE-AT ?auto_27341 ?auto_27349 ) ( ON ?auto_27341 ?auto_27353 ) ( CLEAR ?auto_27341 ) ( not ( = ?auto_27340 ?auto_27353 ) ) ( not ( = ?auto_27341 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27353 ) ) ( not ( = ?auto_27363 ?auto_27353 ) ) ( IS-CRATE ?auto_27363 ) ( not ( = ?auto_27340 ?auto_27346 ) ) ( not ( = ?auto_27341 ?auto_27346 ) ) ( not ( = ?auto_27351 ?auto_27346 ) ) ( not ( = ?auto_27363 ?auto_27346 ) ) ( not ( = ?auto_27353 ?auto_27346 ) ) ( not ( = ?auto_27342 ?auto_27345 ) ) ( not ( = ?auto_27347 ?auto_27342 ) ) ( not ( = ?auto_27349 ?auto_27342 ) ) ( HOIST-AT ?auto_27360 ?auto_27342 ) ( not ( = ?auto_27352 ?auto_27360 ) ) ( not ( = ?auto_27358 ?auto_27360 ) ) ( not ( = ?auto_27354 ?auto_27360 ) ) ( AVAILABLE ?auto_27360 ) ( SURFACE-AT ?auto_27363 ?auto_27342 ) ( ON ?auto_27363 ?auto_27350 ) ( CLEAR ?auto_27363 ) ( not ( = ?auto_27340 ?auto_27350 ) ) ( not ( = ?auto_27341 ?auto_27350 ) ) ( not ( = ?auto_27351 ?auto_27350 ) ) ( not ( = ?auto_27363 ?auto_27350 ) ) ( not ( = ?auto_27353 ?auto_27350 ) ) ( not ( = ?auto_27346 ?auto_27350 ) ) ( IS-CRATE ?auto_27346 ) ( not ( = ?auto_27340 ?auto_27344 ) ) ( not ( = ?auto_27341 ?auto_27344 ) ) ( not ( = ?auto_27351 ?auto_27344 ) ) ( not ( = ?auto_27363 ?auto_27344 ) ) ( not ( = ?auto_27353 ?auto_27344 ) ) ( not ( = ?auto_27346 ?auto_27344 ) ) ( not ( = ?auto_27350 ?auto_27344 ) ) ( not ( = ?auto_27348 ?auto_27345 ) ) ( not ( = ?auto_27347 ?auto_27348 ) ) ( not ( = ?auto_27349 ?auto_27348 ) ) ( not ( = ?auto_27342 ?auto_27348 ) ) ( HOIST-AT ?auto_27362 ?auto_27348 ) ( not ( = ?auto_27352 ?auto_27362 ) ) ( not ( = ?auto_27358 ?auto_27362 ) ) ( not ( = ?auto_27354 ?auto_27362 ) ) ( not ( = ?auto_27360 ?auto_27362 ) ) ( SURFACE-AT ?auto_27346 ?auto_27348 ) ( ON ?auto_27346 ?auto_27359 ) ( CLEAR ?auto_27346 ) ( not ( = ?auto_27340 ?auto_27359 ) ) ( not ( = ?auto_27341 ?auto_27359 ) ) ( not ( = ?auto_27351 ?auto_27359 ) ) ( not ( = ?auto_27363 ?auto_27359 ) ) ( not ( = ?auto_27353 ?auto_27359 ) ) ( not ( = ?auto_27346 ?auto_27359 ) ) ( not ( = ?auto_27350 ?auto_27359 ) ) ( not ( = ?auto_27344 ?auto_27359 ) ) ( IS-CRATE ?auto_27344 ) ( not ( = ?auto_27340 ?auto_27361 ) ) ( not ( = ?auto_27341 ?auto_27361 ) ) ( not ( = ?auto_27351 ?auto_27361 ) ) ( not ( = ?auto_27363 ?auto_27361 ) ) ( not ( = ?auto_27353 ?auto_27361 ) ) ( not ( = ?auto_27346 ?auto_27361 ) ) ( not ( = ?auto_27350 ?auto_27361 ) ) ( not ( = ?auto_27344 ?auto_27361 ) ) ( not ( = ?auto_27359 ?auto_27361 ) ) ( AVAILABLE ?auto_27362 ) ( SURFACE-AT ?auto_27344 ?auto_27348 ) ( ON ?auto_27344 ?auto_27357 ) ( CLEAR ?auto_27344 ) ( not ( = ?auto_27340 ?auto_27357 ) ) ( not ( = ?auto_27341 ?auto_27357 ) ) ( not ( = ?auto_27351 ?auto_27357 ) ) ( not ( = ?auto_27363 ?auto_27357 ) ) ( not ( = ?auto_27353 ?auto_27357 ) ) ( not ( = ?auto_27346 ?auto_27357 ) ) ( not ( = ?auto_27350 ?auto_27357 ) ) ( not ( = ?auto_27344 ?auto_27357 ) ) ( not ( = ?auto_27359 ?auto_27357 ) ) ( not ( = ?auto_27361 ?auto_27357 ) ) ( IS-CRATE ?auto_27361 ) ( not ( = ?auto_27340 ?auto_27355 ) ) ( not ( = ?auto_27341 ?auto_27355 ) ) ( not ( = ?auto_27351 ?auto_27355 ) ) ( not ( = ?auto_27363 ?auto_27355 ) ) ( not ( = ?auto_27353 ?auto_27355 ) ) ( not ( = ?auto_27346 ?auto_27355 ) ) ( not ( = ?auto_27350 ?auto_27355 ) ) ( not ( = ?auto_27344 ?auto_27355 ) ) ( not ( = ?auto_27359 ?auto_27355 ) ) ( not ( = ?auto_27361 ?auto_27355 ) ) ( not ( = ?auto_27357 ?auto_27355 ) ) ( AVAILABLE ?auto_27354 ) ( SURFACE-AT ?auto_27361 ?auto_27349 ) ( ON ?auto_27361 ?auto_27356 ) ( CLEAR ?auto_27361 ) ( not ( = ?auto_27340 ?auto_27356 ) ) ( not ( = ?auto_27341 ?auto_27356 ) ) ( not ( = ?auto_27351 ?auto_27356 ) ) ( not ( = ?auto_27363 ?auto_27356 ) ) ( not ( = ?auto_27353 ?auto_27356 ) ) ( not ( = ?auto_27346 ?auto_27356 ) ) ( not ( = ?auto_27350 ?auto_27356 ) ) ( not ( = ?auto_27344 ?auto_27356 ) ) ( not ( = ?auto_27359 ?auto_27356 ) ) ( not ( = ?auto_27361 ?auto_27356 ) ) ( not ( = ?auto_27357 ?auto_27356 ) ) ( not ( = ?auto_27355 ?auto_27356 ) ) ( TRUCK-AT ?auto_27343 ?auto_27345 ) ( SURFACE-AT ?auto_27364 ?auto_27345 ) ( CLEAR ?auto_27364 ) ( IS-CRATE ?auto_27355 ) ( not ( = ?auto_27340 ?auto_27364 ) ) ( not ( = ?auto_27341 ?auto_27364 ) ) ( not ( = ?auto_27351 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27353 ?auto_27364 ) ) ( not ( = ?auto_27346 ?auto_27364 ) ) ( not ( = ?auto_27350 ?auto_27364 ) ) ( not ( = ?auto_27344 ?auto_27364 ) ) ( not ( = ?auto_27359 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27357 ?auto_27364 ) ) ( not ( = ?auto_27355 ?auto_27364 ) ) ( not ( = ?auto_27356 ?auto_27364 ) ) ( AVAILABLE ?auto_27352 ) ( IN ?auto_27355 ?auto_27343 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27352 ?auto_27355 ?auto_27343 ?auto_27345 )
      ( MAKE-ON ?auto_27340 ?auto_27341 )
      ( MAKE-ON-VERIFY ?auto_27340 ?auto_27341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27365 - SURFACE
      ?auto_27366 - SURFACE
    )
    :vars
    (
      ?auto_27371 - HOIST
      ?auto_27388 - PLACE
      ?auto_27380 - PLACE
      ?auto_27374 - HOIST
      ?auto_27368 - SURFACE
      ?auto_27376 - SURFACE
      ?auto_27382 - PLACE
      ?auto_27381 - HOIST
      ?auto_27367 - SURFACE
      ?auto_27386 - SURFACE
      ?auto_27383 - PLACE
      ?auto_27378 - HOIST
      ?auto_27387 - SURFACE
      ?auto_27372 - SURFACE
      ?auto_27369 - PLACE
      ?auto_27375 - HOIST
      ?auto_27377 - SURFACE
      ?auto_27379 - SURFACE
      ?auto_27385 - SURFACE
      ?auto_27373 - SURFACE
      ?auto_27384 - SURFACE
      ?auto_27389 - SURFACE
      ?auto_27370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27371 ?auto_27388 ) ( IS-CRATE ?auto_27365 ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27380 ?auto_27388 ) ) ( HOIST-AT ?auto_27374 ?auto_27380 ) ( not ( = ?auto_27371 ?auto_27374 ) ) ( AVAILABLE ?auto_27374 ) ( SURFACE-AT ?auto_27365 ?auto_27380 ) ( ON ?auto_27365 ?auto_27368 ) ( CLEAR ?auto_27365 ) ( not ( = ?auto_27365 ?auto_27368 ) ) ( not ( = ?auto_27366 ?auto_27368 ) ) ( IS-CRATE ?auto_27366 ) ( not ( = ?auto_27365 ?auto_27376 ) ) ( not ( = ?auto_27366 ?auto_27376 ) ) ( not ( = ?auto_27368 ?auto_27376 ) ) ( not ( = ?auto_27382 ?auto_27388 ) ) ( not ( = ?auto_27380 ?auto_27382 ) ) ( HOIST-AT ?auto_27381 ?auto_27382 ) ( not ( = ?auto_27371 ?auto_27381 ) ) ( not ( = ?auto_27374 ?auto_27381 ) ) ( SURFACE-AT ?auto_27366 ?auto_27382 ) ( ON ?auto_27366 ?auto_27367 ) ( CLEAR ?auto_27366 ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27366 ?auto_27367 ) ) ( not ( = ?auto_27368 ?auto_27367 ) ) ( not ( = ?auto_27376 ?auto_27367 ) ) ( IS-CRATE ?auto_27376 ) ( not ( = ?auto_27365 ?auto_27386 ) ) ( not ( = ?auto_27366 ?auto_27386 ) ) ( not ( = ?auto_27368 ?auto_27386 ) ) ( not ( = ?auto_27376 ?auto_27386 ) ) ( not ( = ?auto_27367 ?auto_27386 ) ) ( not ( = ?auto_27383 ?auto_27388 ) ) ( not ( = ?auto_27380 ?auto_27383 ) ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( HOIST-AT ?auto_27378 ?auto_27383 ) ( not ( = ?auto_27371 ?auto_27378 ) ) ( not ( = ?auto_27374 ?auto_27378 ) ) ( not ( = ?auto_27381 ?auto_27378 ) ) ( AVAILABLE ?auto_27378 ) ( SURFACE-AT ?auto_27376 ?auto_27383 ) ( ON ?auto_27376 ?auto_27387 ) ( CLEAR ?auto_27376 ) ( not ( = ?auto_27365 ?auto_27387 ) ) ( not ( = ?auto_27366 ?auto_27387 ) ) ( not ( = ?auto_27368 ?auto_27387 ) ) ( not ( = ?auto_27376 ?auto_27387 ) ) ( not ( = ?auto_27367 ?auto_27387 ) ) ( not ( = ?auto_27386 ?auto_27387 ) ) ( IS-CRATE ?auto_27386 ) ( not ( = ?auto_27365 ?auto_27372 ) ) ( not ( = ?auto_27366 ?auto_27372 ) ) ( not ( = ?auto_27368 ?auto_27372 ) ) ( not ( = ?auto_27376 ?auto_27372 ) ) ( not ( = ?auto_27367 ?auto_27372 ) ) ( not ( = ?auto_27386 ?auto_27372 ) ) ( not ( = ?auto_27387 ?auto_27372 ) ) ( not ( = ?auto_27369 ?auto_27388 ) ) ( not ( = ?auto_27380 ?auto_27369 ) ) ( not ( = ?auto_27382 ?auto_27369 ) ) ( not ( = ?auto_27383 ?auto_27369 ) ) ( HOIST-AT ?auto_27375 ?auto_27369 ) ( not ( = ?auto_27371 ?auto_27375 ) ) ( not ( = ?auto_27374 ?auto_27375 ) ) ( not ( = ?auto_27381 ?auto_27375 ) ) ( not ( = ?auto_27378 ?auto_27375 ) ) ( SURFACE-AT ?auto_27386 ?auto_27369 ) ( ON ?auto_27386 ?auto_27377 ) ( CLEAR ?auto_27386 ) ( not ( = ?auto_27365 ?auto_27377 ) ) ( not ( = ?auto_27366 ?auto_27377 ) ) ( not ( = ?auto_27368 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27367 ?auto_27377 ) ) ( not ( = ?auto_27386 ?auto_27377 ) ) ( not ( = ?auto_27387 ?auto_27377 ) ) ( not ( = ?auto_27372 ?auto_27377 ) ) ( IS-CRATE ?auto_27372 ) ( not ( = ?auto_27365 ?auto_27379 ) ) ( not ( = ?auto_27366 ?auto_27379 ) ) ( not ( = ?auto_27368 ?auto_27379 ) ) ( not ( = ?auto_27376 ?auto_27379 ) ) ( not ( = ?auto_27367 ?auto_27379 ) ) ( not ( = ?auto_27386 ?auto_27379 ) ) ( not ( = ?auto_27387 ?auto_27379 ) ) ( not ( = ?auto_27372 ?auto_27379 ) ) ( not ( = ?auto_27377 ?auto_27379 ) ) ( AVAILABLE ?auto_27375 ) ( SURFACE-AT ?auto_27372 ?auto_27369 ) ( ON ?auto_27372 ?auto_27385 ) ( CLEAR ?auto_27372 ) ( not ( = ?auto_27365 ?auto_27385 ) ) ( not ( = ?auto_27366 ?auto_27385 ) ) ( not ( = ?auto_27368 ?auto_27385 ) ) ( not ( = ?auto_27376 ?auto_27385 ) ) ( not ( = ?auto_27367 ?auto_27385 ) ) ( not ( = ?auto_27386 ?auto_27385 ) ) ( not ( = ?auto_27387 ?auto_27385 ) ) ( not ( = ?auto_27372 ?auto_27385 ) ) ( not ( = ?auto_27377 ?auto_27385 ) ) ( not ( = ?auto_27379 ?auto_27385 ) ) ( IS-CRATE ?auto_27379 ) ( not ( = ?auto_27365 ?auto_27373 ) ) ( not ( = ?auto_27366 ?auto_27373 ) ) ( not ( = ?auto_27368 ?auto_27373 ) ) ( not ( = ?auto_27376 ?auto_27373 ) ) ( not ( = ?auto_27367 ?auto_27373 ) ) ( not ( = ?auto_27386 ?auto_27373 ) ) ( not ( = ?auto_27387 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27373 ) ) ( not ( = ?auto_27377 ?auto_27373 ) ) ( not ( = ?auto_27379 ?auto_27373 ) ) ( not ( = ?auto_27385 ?auto_27373 ) ) ( AVAILABLE ?auto_27381 ) ( SURFACE-AT ?auto_27379 ?auto_27382 ) ( ON ?auto_27379 ?auto_27384 ) ( CLEAR ?auto_27379 ) ( not ( = ?auto_27365 ?auto_27384 ) ) ( not ( = ?auto_27366 ?auto_27384 ) ) ( not ( = ?auto_27368 ?auto_27384 ) ) ( not ( = ?auto_27376 ?auto_27384 ) ) ( not ( = ?auto_27367 ?auto_27384 ) ) ( not ( = ?auto_27386 ?auto_27384 ) ) ( not ( = ?auto_27387 ?auto_27384 ) ) ( not ( = ?auto_27372 ?auto_27384 ) ) ( not ( = ?auto_27377 ?auto_27384 ) ) ( not ( = ?auto_27379 ?auto_27384 ) ) ( not ( = ?auto_27385 ?auto_27384 ) ) ( not ( = ?auto_27373 ?auto_27384 ) ) ( SURFACE-AT ?auto_27389 ?auto_27388 ) ( CLEAR ?auto_27389 ) ( IS-CRATE ?auto_27373 ) ( not ( = ?auto_27365 ?auto_27389 ) ) ( not ( = ?auto_27366 ?auto_27389 ) ) ( not ( = ?auto_27368 ?auto_27389 ) ) ( not ( = ?auto_27376 ?auto_27389 ) ) ( not ( = ?auto_27367 ?auto_27389 ) ) ( not ( = ?auto_27386 ?auto_27389 ) ) ( not ( = ?auto_27387 ?auto_27389 ) ) ( not ( = ?auto_27372 ?auto_27389 ) ) ( not ( = ?auto_27377 ?auto_27389 ) ) ( not ( = ?auto_27379 ?auto_27389 ) ) ( not ( = ?auto_27385 ?auto_27389 ) ) ( not ( = ?auto_27373 ?auto_27389 ) ) ( not ( = ?auto_27384 ?auto_27389 ) ) ( AVAILABLE ?auto_27371 ) ( IN ?auto_27373 ?auto_27370 ) ( TRUCK-AT ?auto_27370 ?auto_27382 ) )
    :subtasks
    ( ( !DRIVE ?auto_27370 ?auto_27382 ?auto_27388 )
      ( MAKE-ON ?auto_27365 ?auto_27366 )
      ( MAKE-ON-VERIFY ?auto_27365 ?auto_27366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27390 - SURFACE
      ?auto_27391 - SURFACE
    )
    :vars
    (
      ?auto_27414 - HOIST
      ?auto_27409 - PLACE
      ?auto_27397 - PLACE
      ?auto_27392 - HOIST
      ?auto_27401 - SURFACE
      ?auto_27396 - SURFACE
      ?auto_27411 - PLACE
      ?auto_27405 - HOIST
      ?auto_27412 - SURFACE
      ?auto_27407 - SURFACE
      ?auto_27395 - PLACE
      ?auto_27403 - HOIST
      ?auto_27408 - SURFACE
      ?auto_27402 - SURFACE
      ?auto_27398 - PLACE
      ?auto_27404 - HOIST
      ?auto_27413 - SURFACE
      ?auto_27399 - SURFACE
      ?auto_27393 - SURFACE
      ?auto_27406 - SURFACE
      ?auto_27394 - SURFACE
      ?auto_27410 - SURFACE
      ?auto_27400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27414 ?auto_27409 ) ( IS-CRATE ?auto_27390 ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27397 ?auto_27409 ) ) ( HOIST-AT ?auto_27392 ?auto_27397 ) ( not ( = ?auto_27414 ?auto_27392 ) ) ( AVAILABLE ?auto_27392 ) ( SURFACE-AT ?auto_27390 ?auto_27397 ) ( ON ?auto_27390 ?auto_27401 ) ( CLEAR ?auto_27390 ) ( not ( = ?auto_27390 ?auto_27401 ) ) ( not ( = ?auto_27391 ?auto_27401 ) ) ( IS-CRATE ?auto_27391 ) ( not ( = ?auto_27390 ?auto_27396 ) ) ( not ( = ?auto_27391 ?auto_27396 ) ) ( not ( = ?auto_27401 ?auto_27396 ) ) ( not ( = ?auto_27411 ?auto_27409 ) ) ( not ( = ?auto_27397 ?auto_27411 ) ) ( HOIST-AT ?auto_27405 ?auto_27411 ) ( not ( = ?auto_27414 ?auto_27405 ) ) ( not ( = ?auto_27392 ?auto_27405 ) ) ( SURFACE-AT ?auto_27391 ?auto_27411 ) ( ON ?auto_27391 ?auto_27412 ) ( CLEAR ?auto_27391 ) ( not ( = ?auto_27390 ?auto_27412 ) ) ( not ( = ?auto_27391 ?auto_27412 ) ) ( not ( = ?auto_27401 ?auto_27412 ) ) ( not ( = ?auto_27396 ?auto_27412 ) ) ( IS-CRATE ?auto_27396 ) ( not ( = ?auto_27390 ?auto_27407 ) ) ( not ( = ?auto_27391 ?auto_27407 ) ) ( not ( = ?auto_27401 ?auto_27407 ) ) ( not ( = ?auto_27396 ?auto_27407 ) ) ( not ( = ?auto_27412 ?auto_27407 ) ) ( not ( = ?auto_27395 ?auto_27409 ) ) ( not ( = ?auto_27397 ?auto_27395 ) ) ( not ( = ?auto_27411 ?auto_27395 ) ) ( HOIST-AT ?auto_27403 ?auto_27395 ) ( not ( = ?auto_27414 ?auto_27403 ) ) ( not ( = ?auto_27392 ?auto_27403 ) ) ( not ( = ?auto_27405 ?auto_27403 ) ) ( AVAILABLE ?auto_27403 ) ( SURFACE-AT ?auto_27396 ?auto_27395 ) ( ON ?auto_27396 ?auto_27408 ) ( CLEAR ?auto_27396 ) ( not ( = ?auto_27390 ?auto_27408 ) ) ( not ( = ?auto_27391 ?auto_27408 ) ) ( not ( = ?auto_27401 ?auto_27408 ) ) ( not ( = ?auto_27396 ?auto_27408 ) ) ( not ( = ?auto_27412 ?auto_27408 ) ) ( not ( = ?auto_27407 ?auto_27408 ) ) ( IS-CRATE ?auto_27407 ) ( not ( = ?auto_27390 ?auto_27402 ) ) ( not ( = ?auto_27391 ?auto_27402 ) ) ( not ( = ?auto_27401 ?auto_27402 ) ) ( not ( = ?auto_27396 ?auto_27402 ) ) ( not ( = ?auto_27412 ?auto_27402 ) ) ( not ( = ?auto_27407 ?auto_27402 ) ) ( not ( = ?auto_27408 ?auto_27402 ) ) ( not ( = ?auto_27398 ?auto_27409 ) ) ( not ( = ?auto_27397 ?auto_27398 ) ) ( not ( = ?auto_27411 ?auto_27398 ) ) ( not ( = ?auto_27395 ?auto_27398 ) ) ( HOIST-AT ?auto_27404 ?auto_27398 ) ( not ( = ?auto_27414 ?auto_27404 ) ) ( not ( = ?auto_27392 ?auto_27404 ) ) ( not ( = ?auto_27405 ?auto_27404 ) ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( SURFACE-AT ?auto_27407 ?auto_27398 ) ( ON ?auto_27407 ?auto_27413 ) ( CLEAR ?auto_27407 ) ( not ( = ?auto_27390 ?auto_27413 ) ) ( not ( = ?auto_27391 ?auto_27413 ) ) ( not ( = ?auto_27401 ?auto_27413 ) ) ( not ( = ?auto_27396 ?auto_27413 ) ) ( not ( = ?auto_27412 ?auto_27413 ) ) ( not ( = ?auto_27407 ?auto_27413 ) ) ( not ( = ?auto_27408 ?auto_27413 ) ) ( not ( = ?auto_27402 ?auto_27413 ) ) ( IS-CRATE ?auto_27402 ) ( not ( = ?auto_27390 ?auto_27399 ) ) ( not ( = ?auto_27391 ?auto_27399 ) ) ( not ( = ?auto_27401 ?auto_27399 ) ) ( not ( = ?auto_27396 ?auto_27399 ) ) ( not ( = ?auto_27412 ?auto_27399 ) ) ( not ( = ?auto_27407 ?auto_27399 ) ) ( not ( = ?auto_27408 ?auto_27399 ) ) ( not ( = ?auto_27402 ?auto_27399 ) ) ( not ( = ?auto_27413 ?auto_27399 ) ) ( AVAILABLE ?auto_27404 ) ( SURFACE-AT ?auto_27402 ?auto_27398 ) ( ON ?auto_27402 ?auto_27393 ) ( CLEAR ?auto_27402 ) ( not ( = ?auto_27390 ?auto_27393 ) ) ( not ( = ?auto_27391 ?auto_27393 ) ) ( not ( = ?auto_27401 ?auto_27393 ) ) ( not ( = ?auto_27396 ?auto_27393 ) ) ( not ( = ?auto_27412 ?auto_27393 ) ) ( not ( = ?auto_27407 ?auto_27393 ) ) ( not ( = ?auto_27408 ?auto_27393 ) ) ( not ( = ?auto_27402 ?auto_27393 ) ) ( not ( = ?auto_27413 ?auto_27393 ) ) ( not ( = ?auto_27399 ?auto_27393 ) ) ( IS-CRATE ?auto_27399 ) ( not ( = ?auto_27390 ?auto_27406 ) ) ( not ( = ?auto_27391 ?auto_27406 ) ) ( not ( = ?auto_27401 ?auto_27406 ) ) ( not ( = ?auto_27396 ?auto_27406 ) ) ( not ( = ?auto_27412 ?auto_27406 ) ) ( not ( = ?auto_27407 ?auto_27406 ) ) ( not ( = ?auto_27408 ?auto_27406 ) ) ( not ( = ?auto_27402 ?auto_27406 ) ) ( not ( = ?auto_27413 ?auto_27406 ) ) ( not ( = ?auto_27399 ?auto_27406 ) ) ( not ( = ?auto_27393 ?auto_27406 ) ) ( SURFACE-AT ?auto_27399 ?auto_27411 ) ( ON ?auto_27399 ?auto_27394 ) ( CLEAR ?auto_27399 ) ( not ( = ?auto_27390 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( not ( = ?auto_27401 ?auto_27394 ) ) ( not ( = ?auto_27396 ?auto_27394 ) ) ( not ( = ?auto_27412 ?auto_27394 ) ) ( not ( = ?auto_27407 ?auto_27394 ) ) ( not ( = ?auto_27408 ?auto_27394 ) ) ( not ( = ?auto_27402 ?auto_27394 ) ) ( not ( = ?auto_27413 ?auto_27394 ) ) ( not ( = ?auto_27399 ?auto_27394 ) ) ( not ( = ?auto_27393 ?auto_27394 ) ) ( not ( = ?auto_27406 ?auto_27394 ) ) ( SURFACE-AT ?auto_27410 ?auto_27409 ) ( CLEAR ?auto_27410 ) ( IS-CRATE ?auto_27406 ) ( not ( = ?auto_27390 ?auto_27410 ) ) ( not ( = ?auto_27391 ?auto_27410 ) ) ( not ( = ?auto_27401 ?auto_27410 ) ) ( not ( = ?auto_27396 ?auto_27410 ) ) ( not ( = ?auto_27412 ?auto_27410 ) ) ( not ( = ?auto_27407 ?auto_27410 ) ) ( not ( = ?auto_27408 ?auto_27410 ) ) ( not ( = ?auto_27402 ?auto_27410 ) ) ( not ( = ?auto_27413 ?auto_27410 ) ) ( not ( = ?auto_27399 ?auto_27410 ) ) ( not ( = ?auto_27393 ?auto_27410 ) ) ( not ( = ?auto_27406 ?auto_27410 ) ) ( not ( = ?auto_27394 ?auto_27410 ) ) ( AVAILABLE ?auto_27414 ) ( TRUCK-AT ?auto_27400 ?auto_27411 ) ( LIFTING ?auto_27405 ?auto_27406 ) )
    :subtasks
    ( ( !LOAD ?auto_27405 ?auto_27406 ?auto_27400 ?auto_27411 )
      ( MAKE-ON ?auto_27390 ?auto_27391 )
      ( MAKE-ON-VERIFY ?auto_27390 ?auto_27391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27415 - SURFACE
      ?auto_27416 - SURFACE
    )
    :vars
    (
      ?auto_27428 - HOIST
      ?auto_27419 - PLACE
      ?auto_27432 - PLACE
      ?auto_27424 - HOIST
      ?auto_27439 - SURFACE
      ?auto_27435 - SURFACE
      ?auto_27421 - PLACE
      ?auto_27436 - HOIST
      ?auto_27420 - SURFACE
      ?auto_27429 - SURFACE
      ?auto_27437 - PLACE
      ?auto_27434 - HOIST
      ?auto_27417 - SURFACE
      ?auto_27431 - SURFACE
      ?auto_27426 - PLACE
      ?auto_27438 - HOIST
      ?auto_27418 - SURFACE
      ?auto_27422 - SURFACE
      ?auto_27433 - SURFACE
      ?auto_27430 - SURFACE
      ?auto_27423 - SURFACE
      ?auto_27425 - SURFACE
      ?auto_27427 - TRUCK
      ?auto_27440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27428 ?auto_27419 ) ( IS-CRATE ?auto_27415 ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27432 ?auto_27419 ) ) ( HOIST-AT ?auto_27424 ?auto_27432 ) ( not ( = ?auto_27428 ?auto_27424 ) ) ( AVAILABLE ?auto_27424 ) ( SURFACE-AT ?auto_27415 ?auto_27432 ) ( ON ?auto_27415 ?auto_27439 ) ( CLEAR ?auto_27415 ) ( not ( = ?auto_27415 ?auto_27439 ) ) ( not ( = ?auto_27416 ?auto_27439 ) ) ( IS-CRATE ?auto_27416 ) ( not ( = ?auto_27415 ?auto_27435 ) ) ( not ( = ?auto_27416 ?auto_27435 ) ) ( not ( = ?auto_27439 ?auto_27435 ) ) ( not ( = ?auto_27421 ?auto_27419 ) ) ( not ( = ?auto_27432 ?auto_27421 ) ) ( HOIST-AT ?auto_27436 ?auto_27421 ) ( not ( = ?auto_27428 ?auto_27436 ) ) ( not ( = ?auto_27424 ?auto_27436 ) ) ( SURFACE-AT ?auto_27416 ?auto_27421 ) ( ON ?auto_27416 ?auto_27420 ) ( CLEAR ?auto_27416 ) ( not ( = ?auto_27415 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) ( not ( = ?auto_27439 ?auto_27420 ) ) ( not ( = ?auto_27435 ?auto_27420 ) ) ( IS-CRATE ?auto_27435 ) ( not ( = ?auto_27415 ?auto_27429 ) ) ( not ( = ?auto_27416 ?auto_27429 ) ) ( not ( = ?auto_27439 ?auto_27429 ) ) ( not ( = ?auto_27435 ?auto_27429 ) ) ( not ( = ?auto_27420 ?auto_27429 ) ) ( not ( = ?auto_27437 ?auto_27419 ) ) ( not ( = ?auto_27432 ?auto_27437 ) ) ( not ( = ?auto_27421 ?auto_27437 ) ) ( HOIST-AT ?auto_27434 ?auto_27437 ) ( not ( = ?auto_27428 ?auto_27434 ) ) ( not ( = ?auto_27424 ?auto_27434 ) ) ( not ( = ?auto_27436 ?auto_27434 ) ) ( AVAILABLE ?auto_27434 ) ( SURFACE-AT ?auto_27435 ?auto_27437 ) ( ON ?auto_27435 ?auto_27417 ) ( CLEAR ?auto_27435 ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( not ( = ?auto_27439 ?auto_27417 ) ) ( not ( = ?auto_27435 ?auto_27417 ) ) ( not ( = ?auto_27420 ?auto_27417 ) ) ( not ( = ?auto_27429 ?auto_27417 ) ) ( IS-CRATE ?auto_27429 ) ( not ( = ?auto_27415 ?auto_27431 ) ) ( not ( = ?auto_27416 ?auto_27431 ) ) ( not ( = ?auto_27439 ?auto_27431 ) ) ( not ( = ?auto_27435 ?auto_27431 ) ) ( not ( = ?auto_27420 ?auto_27431 ) ) ( not ( = ?auto_27429 ?auto_27431 ) ) ( not ( = ?auto_27417 ?auto_27431 ) ) ( not ( = ?auto_27426 ?auto_27419 ) ) ( not ( = ?auto_27432 ?auto_27426 ) ) ( not ( = ?auto_27421 ?auto_27426 ) ) ( not ( = ?auto_27437 ?auto_27426 ) ) ( HOIST-AT ?auto_27438 ?auto_27426 ) ( not ( = ?auto_27428 ?auto_27438 ) ) ( not ( = ?auto_27424 ?auto_27438 ) ) ( not ( = ?auto_27436 ?auto_27438 ) ) ( not ( = ?auto_27434 ?auto_27438 ) ) ( SURFACE-AT ?auto_27429 ?auto_27426 ) ( ON ?auto_27429 ?auto_27418 ) ( CLEAR ?auto_27429 ) ( not ( = ?auto_27415 ?auto_27418 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( not ( = ?auto_27439 ?auto_27418 ) ) ( not ( = ?auto_27435 ?auto_27418 ) ) ( not ( = ?auto_27420 ?auto_27418 ) ) ( not ( = ?auto_27429 ?auto_27418 ) ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27431 ?auto_27418 ) ) ( IS-CRATE ?auto_27431 ) ( not ( = ?auto_27415 ?auto_27422 ) ) ( not ( = ?auto_27416 ?auto_27422 ) ) ( not ( = ?auto_27439 ?auto_27422 ) ) ( not ( = ?auto_27435 ?auto_27422 ) ) ( not ( = ?auto_27420 ?auto_27422 ) ) ( not ( = ?auto_27429 ?auto_27422 ) ) ( not ( = ?auto_27417 ?auto_27422 ) ) ( not ( = ?auto_27431 ?auto_27422 ) ) ( not ( = ?auto_27418 ?auto_27422 ) ) ( AVAILABLE ?auto_27438 ) ( SURFACE-AT ?auto_27431 ?auto_27426 ) ( ON ?auto_27431 ?auto_27433 ) ( CLEAR ?auto_27431 ) ( not ( = ?auto_27415 ?auto_27433 ) ) ( not ( = ?auto_27416 ?auto_27433 ) ) ( not ( = ?auto_27439 ?auto_27433 ) ) ( not ( = ?auto_27435 ?auto_27433 ) ) ( not ( = ?auto_27420 ?auto_27433 ) ) ( not ( = ?auto_27429 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27433 ) ) ( not ( = ?auto_27431 ?auto_27433 ) ) ( not ( = ?auto_27418 ?auto_27433 ) ) ( not ( = ?auto_27422 ?auto_27433 ) ) ( IS-CRATE ?auto_27422 ) ( not ( = ?auto_27415 ?auto_27430 ) ) ( not ( = ?auto_27416 ?auto_27430 ) ) ( not ( = ?auto_27439 ?auto_27430 ) ) ( not ( = ?auto_27435 ?auto_27430 ) ) ( not ( = ?auto_27420 ?auto_27430 ) ) ( not ( = ?auto_27429 ?auto_27430 ) ) ( not ( = ?auto_27417 ?auto_27430 ) ) ( not ( = ?auto_27431 ?auto_27430 ) ) ( not ( = ?auto_27418 ?auto_27430 ) ) ( not ( = ?auto_27422 ?auto_27430 ) ) ( not ( = ?auto_27433 ?auto_27430 ) ) ( SURFACE-AT ?auto_27422 ?auto_27421 ) ( ON ?auto_27422 ?auto_27423 ) ( CLEAR ?auto_27422 ) ( not ( = ?auto_27415 ?auto_27423 ) ) ( not ( = ?auto_27416 ?auto_27423 ) ) ( not ( = ?auto_27439 ?auto_27423 ) ) ( not ( = ?auto_27435 ?auto_27423 ) ) ( not ( = ?auto_27420 ?auto_27423 ) ) ( not ( = ?auto_27429 ?auto_27423 ) ) ( not ( = ?auto_27417 ?auto_27423 ) ) ( not ( = ?auto_27431 ?auto_27423 ) ) ( not ( = ?auto_27418 ?auto_27423 ) ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( not ( = ?auto_27433 ?auto_27423 ) ) ( not ( = ?auto_27430 ?auto_27423 ) ) ( SURFACE-AT ?auto_27425 ?auto_27419 ) ( CLEAR ?auto_27425 ) ( IS-CRATE ?auto_27430 ) ( not ( = ?auto_27415 ?auto_27425 ) ) ( not ( = ?auto_27416 ?auto_27425 ) ) ( not ( = ?auto_27439 ?auto_27425 ) ) ( not ( = ?auto_27435 ?auto_27425 ) ) ( not ( = ?auto_27420 ?auto_27425 ) ) ( not ( = ?auto_27429 ?auto_27425 ) ) ( not ( = ?auto_27417 ?auto_27425 ) ) ( not ( = ?auto_27431 ?auto_27425 ) ) ( not ( = ?auto_27418 ?auto_27425 ) ) ( not ( = ?auto_27422 ?auto_27425 ) ) ( not ( = ?auto_27433 ?auto_27425 ) ) ( not ( = ?auto_27430 ?auto_27425 ) ) ( not ( = ?auto_27423 ?auto_27425 ) ) ( AVAILABLE ?auto_27428 ) ( TRUCK-AT ?auto_27427 ?auto_27421 ) ( AVAILABLE ?auto_27436 ) ( SURFACE-AT ?auto_27430 ?auto_27421 ) ( ON ?auto_27430 ?auto_27440 ) ( CLEAR ?auto_27430 ) ( not ( = ?auto_27415 ?auto_27440 ) ) ( not ( = ?auto_27416 ?auto_27440 ) ) ( not ( = ?auto_27439 ?auto_27440 ) ) ( not ( = ?auto_27435 ?auto_27440 ) ) ( not ( = ?auto_27420 ?auto_27440 ) ) ( not ( = ?auto_27429 ?auto_27440 ) ) ( not ( = ?auto_27417 ?auto_27440 ) ) ( not ( = ?auto_27431 ?auto_27440 ) ) ( not ( = ?auto_27418 ?auto_27440 ) ) ( not ( = ?auto_27422 ?auto_27440 ) ) ( not ( = ?auto_27433 ?auto_27440 ) ) ( not ( = ?auto_27430 ?auto_27440 ) ) ( not ( = ?auto_27423 ?auto_27440 ) ) ( not ( = ?auto_27425 ?auto_27440 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27436 ?auto_27430 ?auto_27440 ?auto_27421 )
      ( MAKE-ON ?auto_27415 ?auto_27416 )
      ( MAKE-ON-VERIFY ?auto_27415 ?auto_27416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27441 - SURFACE
      ?auto_27442 - SURFACE
    )
    :vars
    (
      ?auto_27454 - HOIST
      ?auto_27444 - PLACE
      ?auto_27451 - PLACE
      ?auto_27448 - HOIST
      ?auto_27465 - SURFACE
      ?auto_27461 - SURFACE
      ?auto_27455 - PLACE
      ?auto_27462 - HOIST
      ?auto_27446 - SURFACE
      ?auto_27447 - SURFACE
      ?auto_27463 - PLACE
      ?auto_27460 - HOIST
      ?auto_27458 - SURFACE
      ?auto_27445 - SURFACE
      ?auto_27443 - PLACE
      ?auto_27464 - HOIST
      ?auto_27456 - SURFACE
      ?auto_27450 - SURFACE
      ?auto_27459 - SURFACE
      ?auto_27453 - SURFACE
      ?auto_27452 - SURFACE
      ?auto_27457 - SURFACE
      ?auto_27466 - SURFACE
      ?auto_27449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27454 ?auto_27444 ) ( IS-CRATE ?auto_27441 ) ( not ( = ?auto_27441 ?auto_27442 ) ) ( not ( = ?auto_27451 ?auto_27444 ) ) ( HOIST-AT ?auto_27448 ?auto_27451 ) ( not ( = ?auto_27454 ?auto_27448 ) ) ( AVAILABLE ?auto_27448 ) ( SURFACE-AT ?auto_27441 ?auto_27451 ) ( ON ?auto_27441 ?auto_27465 ) ( CLEAR ?auto_27441 ) ( not ( = ?auto_27441 ?auto_27465 ) ) ( not ( = ?auto_27442 ?auto_27465 ) ) ( IS-CRATE ?auto_27442 ) ( not ( = ?auto_27441 ?auto_27461 ) ) ( not ( = ?auto_27442 ?auto_27461 ) ) ( not ( = ?auto_27465 ?auto_27461 ) ) ( not ( = ?auto_27455 ?auto_27444 ) ) ( not ( = ?auto_27451 ?auto_27455 ) ) ( HOIST-AT ?auto_27462 ?auto_27455 ) ( not ( = ?auto_27454 ?auto_27462 ) ) ( not ( = ?auto_27448 ?auto_27462 ) ) ( SURFACE-AT ?auto_27442 ?auto_27455 ) ( ON ?auto_27442 ?auto_27446 ) ( CLEAR ?auto_27442 ) ( not ( = ?auto_27441 ?auto_27446 ) ) ( not ( = ?auto_27442 ?auto_27446 ) ) ( not ( = ?auto_27465 ?auto_27446 ) ) ( not ( = ?auto_27461 ?auto_27446 ) ) ( IS-CRATE ?auto_27461 ) ( not ( = ?auto_27441 ?auto_27447 ) ) ( not ( = ?auto_27442 ?auto_27447 ) ) ( not ( = ?auto_27465 ?auto_27447 ) ) ( not ( = ?auto_27461 ?auto_27447 ) ) ( not ( = ?auto_27446 ?auto_27447 ) ) ( not ( = ?auto_27463 ?auto_27444 ) ) ( not ( = ?auto_27451 ?auto_27463 ) ) ( not ( = ?auto_27455 ?auto_27463 ) ) ( HOIST-AT ?auto_27460 ?auto_27463 ) ( not ( = ?auto_27454 ?auto_27460 ) ) ( not ( = ?auto_27448 ?auto_27460 ) ) ( not ( = ?auto_27462 ?auto_27460 ) ) ( AVAILABLE ?auto_27460 ) ( SURFACE-AT ?auto_27461 ?auto_27463 ) ( ON ?auto_27461 ?auto_27458 ) ( CLEAR ?auto_27461 ) ( not ( = ?auto_27441 ?auto_27458 ) ) ( not ( = ?auto_27442 ?auto_27458 ) ) ( not ( = ?auto_27465 ?auto_27458 ) ) ( not ( = ?auto_27461 ?auto_27458 ) ) ( not ( = ?auto_27446 ?auto_27458 ) ) ( not ( = ?auto_27447 ?auto_27458 ) ) ( IS-CRATE ?auto_27447 ) ( not ( = ?auto_27441 ?auto_27445 ) ) ( not ( = ?auto_27442 ?auto_27445 ) ) ( not ( = ?auto_27465 ?auto_27445 ) ) ( not ( = ?auto_27461 ?auto_27445 ) ) ( not ( = ?auto_27446 ?auto_27445 ) ) ( not ( = ?auto_27447 ?auto_27445 ) ) ( not ( = ?auto_27458 ?auto_27445 ) ) ( not ( = ?auto_27443 ?auto_27444 ) ) ( not ( = ?auto_27451 ?auto_27443 ) ) ( not ( = ?auto_27455 ?auto_27443 ) ) ( not ( = ?auto_27463 ?auto_27443 ) ) ( HOIST-AT ?auto_27464 ?auto_27443 ) ( not ( = ?auto_27454 ?auto_27464 ) ) ( not ( = ?auto_27448 ?auto_27464 ) ) ( not ( = ?auto_27462 ?auto_27464 ) ) ( not ( = ?auto_27460 ?auto_27464 ) ) ( SURFACE-AT ?auto_27447 ?auto_27443 ) ( ON ?auto_27447 ?auto_27456 ) ( CLEAR ?auto_27447 ) ( not ( = ?auto_27441 ?auto_27456 ) ) ( not ( = ?auto_27442 ?auto_27456 ) ) ( not ( = ?auto_27465 ?auto_27456 ) ) ( not ( = ?auto_27461 ?auto_27456 ) ) ( not ( = ?auto_27446 ?auto_27456 ) ) ( not ( = ?auto_27447 ?auto_27456 ) ) ( not ( = ?auto_27458 ?auto_27456 ) ) ( not ( = ?auto_27445 ?auto_27456 ) ) ( IS-CRATE ?auto_27445 ) ( not ( = ?auto_27441 ?auto_27450 ) ) ( not ( = ?auto_27442 ?auto_27450 ) ) ( not ( = ?auto_27465 ?auto_27450 ) ) ( not ( = ?auto_27461 ?auto_27450 ) ) ( not ( = ?auto_27446 ?auto_27450 ) ) ( not ( = ?auto_27447 ?auto_27450 ) ) ( not ( = ?auto_27458 ?auto_27450 ) ) ( not ( = ?auto_27445 ?auto_27450 ) ) ( not ( = ?auto_27456 ?auto_27450 ) ) ( AVAILABLE ?auto_27464 ) ( SURFACE-AT ?auto_27445 ?auto_27443 ) ( ON ?auto_27445 ?auto_27459 ) ( CLEAR ?auto_27445 ) ( not ( = ?auto_27441 ?auto_27459 ) ) ( not ( = ?auto_27442 ?auto_27459 ) ) ( not ( = ?auto_27465 ?auto_27459 ) ) ( not ( = ?auto_27461 ?auto_27459 ) ) ( not ( = ?auto_27446 ?auto_27459 ) ) ( not ( = ?auto_27447 ?auto_27459 ) ) ( not ( = ?auto_27458 ?auto_27459 ) ) ( not ( = ?auto_27445 ?auto_27459 ) ) ( not ( = ?auto_27456 ?auto_27459 ) ) ( not ( = ?auto_27450 ?auto_27459 ) ) ( IS-CRATE ?auto_27450 ) ( not ( = ?auto_27441 ?auto_27453 ) ) ( not ( = ?auto_27442 ?auto_27453 ) ) ( not ( = ?auto_27465 ?auto_27453 ) ) ( not ( = ?auto_27461 ?auto_27453 ) ) ( not ( = ?auto_27446 ?auto_27453 ) ) ( not ( = ?auto_27447 ?auto_27453 ) ) ( not ( = ?auto_27458 ?auto_27453 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27456 ?auto_27453 ) ) ( not ( = ?auto_27450 ?auto_27453 ) ) ( not ( = ?auto_27459 ?auto_27453 ) ) ( SURFACE-AT ?auto_27450 ?auto_27455 ) ( ON ?auto_27450 ?auto_27452 ) ( CLEAR ?auto_27450 ) ( not ( = ?auto_27441 ?auto_27452 ) ) ( not ( = ?auto_27442 ?auto_27452 ) ) ( not ( = ?auto_27465 ?auto_27452 ) ) ( not ( = ?auto_27461 ?auto_27452 ) ) ( not ( = ?auto_27446 ?auto_27452 ) ) ( not ( = ?auto_27447 ?auto_27452 ) ) ( not ( = ?auto_27458 ?auto_27452 ) ) ( not ( = ?auto_27445 ?auto_27452 ) ) ( not ( = ?auto_27456 ?auto_27452 ) ) ( not ( = ?auto_27450 ?auto_27452 ) ) ( not ( = ?auto_27459 ?auto_27452 ) ) ( not ( = ?auto_27453 ?auto_27452 ) ) ( SURFACE-AT ?auto_27457 ?auto_27444 ) ( CLEAR ?auto_27457 ) ( IS-CRATE ?auto_27453 ) ( not ( = ?auto_27441 ?auto_27457 ) ) ( not ( = ?auto_27442 ?auto_27457 ) ) ( not ( = ?auto_27465 ?auto_27457 ) ) ( not ( = ?auto_27461 ?auto_27457 ) ) ( not ( = ?auto_27446 ?auto_27457 ) ) ( not ( = ?auto_27447 ?auto_27457 ) ) ( not ( = ?auto_27458 ?auto_27457 ) ) ( not ( = ?auto_27445 ?auto_27457 ) ) ( not ( = ?auto_27456 ?auto_27457 ) ) ( not ( = ?auto_27450 ?auto_27457 ) ) ( not ( = ?auto_27459 ?auto_27457 ) ) ( not ( = ?auto_27453 ?auto_27457 ) ) ( not ( = ?auto_27452 ?auto_27457 ) ) ( AVAILABLE ?auto_27454 ) ( AVAILABLE ?auto_27462 ) ( SURFACE-AT ?auto_27453 ?auto_27455 ) ( ON ?auto_27453 ?auto_27466 ) ( CLEAR ?auto_27453 ) ( not ( = ?auto_27441 ?auto_27466 ) ) ( not ( = ?auto_27442 ?auto_27466 ) ) ( not ( = ?auto_27465 ?auto_27466 ) ) ( not ( = ?auto_27461 ?auto_27466 ) ) ( not ( = ?auto_27446 ?auto_27466 ) ) ( not ( = ?auto_27447 ?auto_27466 ) ) ( not ( = ?auto_27458 ?auto_27466 ) ) ( not ( = ?auto_27445 ?auto_27466 ) ) ( not ( = ?auto_27456 ?auto_27466 ) ) ( not ( = ?auto_27450 ?auto_27466 ) ) ( not ( = ?auto_27459 ?auto_27466 ) ) ( not ( = ?auto_27453 ?auto_27466 ) ) ( not ( = ?auto_27452 ?auto_27466 ) ) ( not ( = ?auto_27457 ?auto_27466 ) ) ( TRUCK-AT ?auto_27449 ?auto_27444 ) )
    :subtasks
    ( ( !DRIVE ?auto_27449 ?auto_27444 ?auto_27455 )
      ( MAKE-ON ?auto_27441 ?auto_27442 )
      ( MAKE-ON-VERIFY ?auto_27441 ?auto_27442 ) )
  )

)

