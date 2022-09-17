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
      ?auto_6080 - SURFACE
      ?auto_6081 - SURFACE
    )
    :vars
    (
      ?auto_6082 - HOIST
      ?auto_6083 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6082 ?auto_6083 ) ( SURFACE-AT ?auto_6081 ?auto_6083 ) ( CLEAR ?auto_6081 ) ( LIFTING ?auto_6082 ?auto_6080 ) ( IS-CRATE ?auto_6080 ) ( not ( = ?auto_6080 ?auto_6081 ) ) )
    :subtasks
    ( ( !DROP ?auto_6082 ?auto_6080 ?auto_6081 ?auto_6083 )
      ( MAKE-ON-VERIFY ?auto_6080 ?auto_6081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6084 - SURFACE
      ?auto_6085 - SURFACE
    )
    :vars
    (
      ?auto_6087 - HOIST
      ?auto_6086 - PLACE
      ?auto_6088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6087 ?auto_6086 ) ( SURFACE-AT ?auto_6085 ?auto_6086 ) ( CLEAR ?auto_6085 ) ( IS-CRATE ?auto_6084 ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( TRUCK-AT ?auto_6088 ?auto_6086 ) ( AVAILABLE ?auto_6087 ) ( IN ?auto_6084 ?auto_6088 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6087 ?auto_6084 ?auto_6088 ?auto_6086 )
      ( MAKE-ON ?auto_6084 ?auto_6085 )
      ( MAKE-ON-VERIFY ?auto_6084 ?auto_6085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6089 - SURFACE
      ?auto_6090 - SURFACE
    )
    :vars
    (
      ?auto_6091 - HOIST
      ?auto_6092 - PLACE
      ?auto_6093 - TRUCK
      ?auto_6094 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6091 ?auto_6092 ) ( SURFACE-AT ?auto_6090 ?auto_6092 ) ( CLEAR ?auto_6090 ) ( IS-CRATE ?auto_6089 ) ( not ( = ?auto_6089 ?auto_6090 ) ) ( AVAILABLE ?auto_6091 ) ( IN ?auto_6089 ?auto_6093 ) ( TRUCK-AT ?auto_6093 ?auto_6094 ) ( not ( = ?auto_6094 ?auto_6092 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6093 ?auto_6094 ?auto_6092 )
      ( MAKE-ON ?auto_6089 ?auto_6090 )
      ( MAKE-ON-VERIFY ?auto_6089 ?auto_6090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6095 - SURFACE
      ?auto_6096 - SURFACE
    )
    :vars
    (
      ?auto_6100 - HOIST
      ?auto_6098 - PLACE
      ?auto_6097 - TRUCK
      ?auto_6099 - PLACE
      ?auto_6101 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6100 ?auto_6098 ) ( SURFACE-AT ?auto_6096 ?auto_6098 ) ( CLEAR ?auto_6096 ) ( IS-CRATE ?auto_6095 ) ( not ( = ?auto_6095 ?auto_6096 ) ) ( AVAILABLE ?auto_6100 ) ( TRUCK-AT ?auto_6097 ?auto_6099 ) ( not ( = ?auto_6099 ?auto_6098 ) ) ( HOIST-AT ?auto_6101 ?auto_6099 ) ( LIFTING ?auto_6101 ?auto_6095 ) ( not ( = ?auto_6100 ?auto_6101 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6101 ?auto_6095 ?auto_6097 ?auto_6099 )
      ( MAKE-ON ?auto_6095 ?auto_6096 )
      ( MAKE-ON-VERIFY ?auto_6095 ?auto_6096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6102 - SURFACE
      ?auto_6103 - SURFACE
    )
    :vars
    (
      ?auto_6107 - HOIST
      ?auto_6106 - PLACE
      ?auto_6108 - TRUCK
      ?auto_6104 - PLACE
      ?auto_6105 - HOIST
      ?auto_6109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6107 ?auto_6106 ) ( SURFACE-AT ?auto_6103 ?auto_6106 ) ( CLEAR ?auto_6103 ) ( IS-CRATE ?auto_6102 ) ( not ( = ?auto_6102 ?auto_6103 ) ) ( AVAILABLE ?auto_6107 ) ( TRUCK-AT ?auto_6108 ?auto_6104 ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( HOIST-AT ?auto_6105 ?auto_6104 ) ( not ( = ?auto_6107 ?auto_6105 ) ) ( AVAILABLE ?auto_6105 ) ( SURFACE-AT ?auto_6102 ?auto_6104 ) ( ON ?auto_6102 ?auto_6109 ) ( CLEAR ?auto_6102 ) ( not ( = ?auto_6102 ?auto_6109 ) ) ( not ( = ?auto_6103 ?auto_6109 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6105 ?auto_6102 ?auto_6109 ?auto_6104 )
      ( MAKE-ON ?auto_6102 ?auto_6103 )
      ( MAKE-ON-VERIFY ?auto_6102 ?auto_6103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6110 - SURFACE
      ?auto_6111 - SURFACE
    )
    :vars
    (
      ?auto_6115 - HOIST
      ?auto_6114 - PLACE
      ?auto_6117 - PLACE
      ?auto_6113 - HOIST
      ?auto_6112 - SURFACE
      ?auto_6116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6115 ?auto_6114 ) ( SURFACE-AT ?auto_6111 ?auto_6114 ) ( CLEAR ?auto_6111 ) ( IS-CRATE ?auto_6110 ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( AVAILABLE ?auto_6115 ) ( not ( = ?auto_6117 ?auto_6114 ) ) ( HOIST-AT ?auto_6113 ?auto_6117 ) ( not ( = ?auto_6115 ?auto_6113 ) ) ( AVAILABLE ?auto_6113 ) ( SURFACE-AT ?auto_6110 ?auto_6117 ) ( ON ?auto_6110 ?auto_6112 ) ( CLEAR ?auto_6110 ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6111 ?auto_6112 ) ) ( TRUCK-AT ?auto_6116 ?auto_6114 ) )
    :subtasks
    ( ( !DRIVE ?auto_6116 ?auto_6114 ?auto_6117 )
      ( MAKE-ON ?auto_6110 ?auto_6111 )
      ( MAKE-ON-VERIFY ?auto_6110 ?auto_6111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6158 - SURFACE
      ?auto_6159 - SURFACE
    )
    :vars
    (
      ?auto_6165 - HOIST
      ?auto_6161 - PLACE
      ?auto_6160 - PLACE
      ?auto_6164 - HOIST
      ?auto_6163 - SURFACE
      ?auto_6162 - TRUCK
      ?auto_6166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6165 ?auto_6161 ) ( IS-CRATE ?auto_6158 ) ( not ( = ?auto_6158 ?auto_6159 ) ) ( not ( = ?auto_6160 ?auto_6161 ) ) ( HOIST-AT ?auto_6164 ?auto_6160 ) ( not ( = ?auto_6165 ?auto_6164 ) ) ( AVAILABLE ?auto_6164 ) ( SURFACE-AT ?auto_6158 ?auto_6160 ) ( ON ?auto_6158 ?auto_6163 ) ( CLEAR ?auto_6158 ) ( not ( = ?auto_6158 ?auto_6163 ) ) ( not ( = ?auto_6159 ?auto_6163 ) ) ( TRUCK-AT ?auto_6162 ?auto_6161 ) ( SURFACE-AT ?auto_6166 ?auto_6161 ) ( CLEAR ?auto_6166 ) ( LIFTING ?auto_6165 ?auto_6159 ) ( IS-CRATE ?auto_6159 ) ( not ( = ?auto_6158 ?auto_6166 ) ) ( not ( = ?auto_6159 ?auto_6166 ) ) ( not ( = ?auto_6163 ?auto_6166 ) ) )
    :subtasks
    ( ( !DROP ?auto_6165 ?auto_6159 ?auto_6166 ?auto_6161 )
      ( MAKE-ON ?auto_6158 ?auto_6159 )
      ( MAKE-ON-VERIFY ?auto_6158 ?auto_6159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6167 - SURFACE
      ?auto_6168 - SURFACE
    )
    :vars
    (
      ?auto_6172 - HOIST
      ?auto_6175 - PLACE
      ?auto_6169 - PLACE
      ?auto_6170 - HOIST
      ?auto_6174 - SURFACE
      ?auto_6171 - TRUCK
      ?auto_6173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6172 ?auto_6175 ) ( IS-CRATE ?auto_6167 ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6169 ?auto_6175 ) ) ( HOIST-AT ?auto_6170 ?auto_6169 ) ( not ( = ?auto_6172 ?auto_6170 ) ) ( AVAILABLE ?auto_6170 ) ( SURFACE-AT ?auto_6167 ?auto_6169 ) ( ON ?auto_6167 ?auto_6174 ) ( CLEAR ?auto_6167 ) ( not ( = ?auto_6167 ?auto_6174 ) ) ( not ( = ?auto_6168 ?auto_6174 ) ) ( TRUCK-AT ?auto_6171 ?auto_6175 ) ( SURFACE-AT ?auto_6173 ?auto_6175 ) ( CLEAR ?auto_6173 ) ( IS-CRATE ?auto_6168 ) ( not ( = ?auto_6167 ?auto_6173 ) ) ( not ( = ?auto_6168 ?auto_6173 ) ) ( not ( = ?auto_6174 ?auto_6173 ) ) ( AVAILABLE ?auto_6172 ) ( IN ?auto_6168 ?auto_6171 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6172 ?auto_6168 ?auto_6171 ?auto_6175 )
      ( MAKE-ON ?auto_6167 ?auto_6168 )
      ( MAKE-ON-VERIFY ?auto_6167 ?auto_6168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6182 - SURFACE
      ?auto_6183 - SURFACE
    )
    :vars
    (
      ?auto_6186 - HOIST
      ?auto_6188 - PLACE
      ?auto_6189 - PLACE
      ?auto_6184 - HOIST
      ?auto_6185 - SURFACE
      ?auto_6187 - TRUCK
      ?auto_6190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6186 ?auto_6188 ) ( SURFACE-AT ?auto_6183 ?auto_6188 ) ( CLEAR ?auto_6183 ) ( IS-CRATE ?auto_6182 ) ( not ( = ?auto_6182 ?auto_6183 ) ) ( AVAILABLE ?auto_6186 ) ( not ( = ?auto_6189 ?auto_6188 ) ) ( HOIST-AT ?auto_6184 ?auto_6189 ) ( not ( = ?auto_6186 ?auto_6184 ) ) ( AVAILABLE ?auto_6184 ) ( SURFACE-AT ?auto_6182 ?auto_6189 ) ( ON ?auto_6182 ?auto_6185 ) ( CLEAR ?auto_6182 ) ( not ( = ?auto_6182 ?auto_6185 ) ) ( not ( = ?auto_6183 ?auto_6185 ) ) ( TRUCK-AT ?auto_6187 ?auto_6190 ) ( not ( = ?auto_6190 ?auto_6188 ) ) ( not ( = ?auto_6189 ?auto_6190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6187 ?auto_6190 ?auto_6188 )
      ( MAKE-ON ?auto_6182 ?auto_6183 )
      ( MAKE-ON-VERIFY ?auto_6182 ?auto_6183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6270 - SURFACE
      ?auto_6271 - SURFACE
    )
    :vars
    (
      ?auto_6273 - HOIST
      ?auto_6274 - PLACE
      ?auto_6272 - TRUCK
      ?auto_6276 - PLACE
      ?auto_6277 - HOIST
      ?auto_6275 - SURFACE
      ?auto_6278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6273 ?auto_6274 ) ( SURFACE-AT ?auto_6271 ?auto_6274 ) ( CLEAR ?auto_6271 ) ( IS-CRATE ?auto_6270 ) ( not ( = ?auto_6270 ?auto_6271 ) ) ( AVAILABLE ?auto_6273 ) ( TRUCK-AT ?auto_6272 ?auto_6276 ) ( not ( = ?auto_6276 ?auto_6274 ) ) ( HOIST-AT ?auto_6277 ?auto_6276 ) ( not ( = ?auto_6273 ?auto_6277 ) ) ( SURFACE-AT ?auto_6270 ?auto_6276 ) ( ON ?auto_6270 ?auto_6275 ) ( CLEAR ?auto_6270 ) ( not ( = ?auto_6270 ?auto_6275 ) ) ( not ( = ?auto_6271 ?auto_6275 ) ) ( LIFTING ?auto_6277 ?auto_6278 ) ( IS-CRATE ?auto_6278 ) ( not ( = ?auto_6270 ?auto_6278 ) ) ( not ( = ?auto_6271 ?auto_6278 ) ) ( not ( = ?auto_6275 ?auto_6278 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6277 ?auto_6278 ?auto_6272 ?auto_6276 )
      ( MAKE-ON ?auto_6270 ?auto_6271 )
      ( MAKE-ON-VERIFY ?auto_6270 ?auto_6271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6341 - SURFACE
      ?auto_6342 - SURFACE
    )
    :vars
    (
      ?auto_6344 - HOIST
      ?auto_6349 - PLACE
      ?auto_6343 - PLACE
      ?auto_6348 - HOIST
      ?auto_6347 - SURFACE
      ?auto_6346 - SURFACE
      ?auto_6345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6344 ?auto_6349 ) ( IS-CRATE ?auto_6341 ) ( not ( = ?auto_6341 ?auto_6342 ) ) ( not ( = ?auto_6343 ?auto_6349 ) ) ( HOIST-AT ?auto_6348 ?auto_6343 ) ( not ( = ?auto_6344 ?auto_6348 ) ) ( AVAILABLE ?auto_6348 ) ( SURFACE-AT ?auto_6341 ?auto_6343 ) ( ON ?auto_6341 ?auto_6347 ) ( CLEAR ?auto_6341 ) ( not ( = ?auto_6341 ?auto_6347 ) ) ( not ( = ?auto_6342 ?auto_6347 ) ) ( SURFACE-AT ?auto_6346 ?auto_6349 ) ( CLEAR ?auto_6346 ) ( IS-CRATE ?auto_6342 ) ( not ( = ?auto_6341 ?auto_6346 ) ) ( not ( = ?auto_6342 ?auto_6346 ) ) ( not ( = ?auto_6347 ?auto_6346 ) ) ( AVAILABLE ?auto_6344 ) ( IN ?auto_6342 ?auto_6345 ) ( TRUCK-AT ?auto_6345 ?auto_6343 ) )
    :subtasks
    ( ( !DRIVE ?auto_6345 ?auto_6343 ?auto_6349 )
      ( MAKE-ON ?auto_6341 ?auto_6342 )
      ( MAKE-ON-VERIFY ?auto_6341 ?auto_6342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6350 - SURFACE
      ?auto_6351 - SURFACE
    )
    :vars
    (
      ?auto_6355 - HOIST
      ?auto_6356 - PLACE
      ?auto_6358 - PLACE
      ?auto_6354 - HOIST
      ?auto_6352 - SURFACE
      ?auto_6357 - SURFACE
      ?auto_6353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6355 ?auto_6356 ) ( IS-CRATE ?auto_6350 ) ( not ( = ?auto_6350 ?auto_6351 ) ) ( not ( = ?auto_6358 ?auto_6356 ) ) ( HOIST-AT ?auto_6354 ?auto_6358 ) ( not ( = ?auto_6355 ?auto_6354 ) ) ( SURFACE-AT ?auto_6350 ?auto_6358 ) ( ON ?auto_6350 ?auto_6352 ) ( CLEAR ?auto_6350 ) ( not ( = ?auto_6350 ?auto_6352 ) ) ( not ( = ?auto_6351 ?auto_6352 ) ) ( SURFACE-AT ?auto_6357 ?auto_6356 ) ( CLEAR ?auto_6357 ) ( IS-CRATE ?auto_6351 ) ( not ( = ?auto_6350 ?auto_6357 ) ) ( not ( = ?auto_6351 ?auto_6357 ) ) ( not ( = ?auto_6352 ?auto_6357 ) ) ( AVAILABLE ?auto_6355 ) ( TRUCK-AT ?auto_6353 ?auto_6358 ) ( LIFTING ?auto_6354 ?auto_6351 ) )
    :subtasks
    ( ( !LOAD ?auto_6354 ?auto_6351 ?auto_6353 ?auto_6358 )
      ( MAKE-ON ?auto_6350 ?auto_6351 )
      ( MAKE-ON-VERIFY ?auto_6350 ?auto_6351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6359 - SURFACE
      ?auto_6360 - SURFACE
    )
    :vars
    (
      ?auto_6367 - HOIST
      ?auto_6366 - PLACE
      ?auto_6364 - PLACE
      ?auto_6361 - HOIST
      ?auto_6365 - SURFACE
      ?auto_6362 - SURFACE
      ?auto_6363 - TRUCK
      ?auto_6368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6367 ?auto_6366 ) ( IS-CRATE ?auto_6359 ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6364 ?auto_6366 ) ) ( HOIST-AT ?auto_6361 ?auto_6364 ) ( not ( = ?auto_6367 ?auto_6361 ) ) ( SURFACE-AT ?auto_6359 ?auto_6364 ) ( ON ?auto_6359 ?auto_6365 ) ( CLEAR ?auto_6359 ) ( not ( = ?auto_6359 ?auto_6365 ) ) ( not ( = ?auto_6360 ?auto_6365 ) ) ( SURFACE-AT ?auto_6362 ?auto_6366 ) ( CLEAR ?auto_6362 ) ( IS-CRATE ?auto_6360 ) ( not ( = ?auto_6359 ?auto_6362 ) ) ( not ( = ?auto_6360 ?auto_6362 ) ) ( not ( = ?auto_6365 ?auto_6362 ) ) ( AVAILABLE ?auto_6367 ) ( TRUCK-AT ?auto_6363 ?auto_6364 ) ( AVAILABLE ?auto_6361 ) ( SURFACE-AT ?auto_6360 ?auto_6364 ) ( ON ?auto_6360 ?auto_6368 ) ( CLEAR ?auto_6360 ) ( not ( = ?auto_6359 ?auto_6368 ) ) ( not ( = ?auto_6360 ?auto_6368 ) ) ( not ( = ?auto_6365 ?auto_6368 ) ) ( not ( = ?auto_6362 ?auto_6368 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6361 ?auto_6360 ?auto_6368 ?auto_6364 )
      ( MAKE-ON ?auto_6359 ?auto_6360 )
      ( MAKE-ON-VERIFY ?auto_6359 ?auto_6360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6369 - SURFACE
      ?auto_6370 - SURFACE
    )
    :vars
    (
      ?auto_6371 - HOIST
      ?auto_6374 - PLACE
      ?auto_6378 - PLACE
      ?auto_6372 - HOIST
      ?auto_6377 - SURFACE
      ?auto_6375 - SURFACE
      ?auto_6376 - SURFACE
      ?auto_6373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6371 ?auto_6374 ) ( IS-CRATE ?auto_6369 ) ( not ( = ?auto_6369 ?auto_6370 ) ) ( not ( = ?auto_6378 ?auto_6374 ) ) ( HOIST-AT ?auto_6372 ?auto_6378 ) ( not ( = ?auto_6371 ?auto_6372 ) ) ( SURFACE-AT ?auto_6369 ?auto_6378 ) ( ON ?auto_6369 ?auto_6377 ) ( CLEAR ?auto_6369 ) ( not ( = ?auto_6369 ?auto_6377 ) ) ( not ( = ?auto_6370 ?auto_6377 ) ) ( SURFACE-AT ?auto_6375 ?auto_6374 ) ( CLEAR ?auto_6375 ) ( IS-CRATE ?auto_6370 ) ( not ( = ?auto_6369 ?auto_6375 ) ) ( not ( = ?auto_6370 ?auto_6375 ) ) ( not ( = ?auto_6377 ?auto_6375 ) ) ( AVAILABLE ?auto_6371 ) ( AVAILABLE ?auto_6372 ) ( SURFACE-AT ?auto_6370 ?auto_6378 ) ( ON ?auto_6370 ?auto_6376 ) ( CLEAR ?auto_6370 ) ( not ( = ?auto_6369 ?auto_6376 ) ) ( not ( = ?auto_6370 ?auto_6376 ) ) ( not ( = ?auto_6377 ?auto_6376 ) ) ( not ( = ?auto_6375 ?auto_6376 ) ) ( TRUCK-AT ?auto_6373 ?auto_6374 ) )
    :subtasks
    ( ( !DRIVE ?auto_6373 ?auto_6374 ?auto_6378 )
      ( MAKE-ON ?auto_6369 ?auto_6370 )
      ( MAKE-ON-VERIFY ?auto_6369 ?auto_6370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6379 - SURFACE
      ?auto_6380 - SURFACE
    )
    :vars
    (
      ?auto_6386 - HOIST
      ?auto_6384 - PLACE
      ?auto_6382 - PLACE
      ?auto_6387 - HOIST
      ?auto_6381 - SURFACE
      ?auto_6388 - SURFACE
      ?auto_6385 - SURFACE
      ?auto_6383 - TRUCK
      ?auto_6389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6386 ?auto_6384 ) ( IS-CRATE ?auto_6379 ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( HOIST-AT ?auto_6387 ?auto_6382 ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( SURFACE-AT ?auto_6379 ?auto_6382 ) ( ON ?auto_6379 ?auto_6381 ) ( CLEAR ?auto_6379 ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6380 ?auto_6381 ) ) ( IS-CRATE ?auto_6380 ) ( not ( = ?auto_6379 ?auto_6388 ) ) ( not ( = ?auto_6380 ?auto_6388 ) ) ( not ( = ?auto_6381 ?auto_6388 ) ) ( AVAILABLE ?auto_6387 ) ( SURFACE-AT ?auto_6380 ?auto_6382 ) ( ON ?auto_6380 ?auto_6385 ) ( CLEAR ?auto_6380 ) ( not ( = ?auto_6379 ?auto_6385 ) ) ( not ( = ?auto_6380 ?auto_6385 ) ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6388 ?auto_6385 ) ) ( TRUCK-AT ?auto_6383 ?auto_6384 ) ( SURFACE-AT ?auto_6389 ?auto_6384 ) ( CLEAR ?auto_6389 ) ( LIFTING ?auto_6386 ?auto_6388 ) ( IS-CRATE ?auto_6388 ) ( not ( = ?auto_6379 ?auto_6389 ) ) ( not ( = ?auto_6380 ?auto_6389 ) ) ( not ( = ?auto_6381 ?auto_6389 ) ) ( not ( = ?auto_6388 ?auto_6389 ) ) ( not ( = ?auto_6385 ?auto_6389 ) ) )
    :subtasks
    ( ( !DROP ?auto_6386 ?auto_6388 ?auto_6389 ?auto_6384 )
      ( MAKE-ON ?auto_6379 ?auto_6380 )
      ( MAKE-ON-VERIFY ?auto_6379 ?auto_6380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6406 - SURFACE
      ?auto_6407 - SURFACE
    )
    :vars
    (
      ?auto_6409 - HOIST
      ?auto_6411 - PLACE
      ?auto_6415 - PLACE
      ?auto_6408 - HOIST
      ?auto_6414 - SURFACE
      ?auto_6410 - SURFACE
      ?auto_6412 - TRUCK
      ?auto_6413 - SURFACE
      ?auto_6416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6409 ?auto_6411 ) ( IS-CRATE ?auto_6406 ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6415 ?auto_6411 ) ) ( HOIST-AT ?auto_6408 ?auto_6415 ) ( not ( = ?auto_6409 ?auto_6408 ) ) ( SURFACE-AT ?auto_6406 ?auto_6415 ) ( ON ?auto_6406 ?auto_6414 ) ( CLEAR ?auto_6406 ) ( not ( = ?auto_6406 ?auto_6414 ) ) ( not ( = ?auto_6407 ?auto_6414 ) ) ( SURFACE-AT ?auto_6410 ?auto_6411 ) ( CLEAR ?auto_6410 ) ( IS-CRATE ?auto_6407 ) ( not ( = ?auto_6406 ?auto_6410 ) ) ( not ( = ?auto_6407 ?auto_6410 ) ) ( not ( = ?auto_6414 ?auto_6410 ) ) ( AVAILABLE ?auto_6409 ) ( TRUCK-AT ?auto_6412 ?auto_6415 ) ( SURFACE-AT ?auto_6407 ?auto_6415 ) ( ON ?auto_6407 ?auto_6413 ) ( CLEAR ?auto_6407 ) ( not ( = ?auto_6406 ?auto_6413 ) ) ( not ( = ?auto_6407 ?auto_6413 ) ) ( not ( = ?auto_6414 ?auto_6413 ) ) ( not ( = ?auto_6410 ?auto_6413 ) ) ( LIFTING ?auto_6408 ?auto_6416 ) ( IS-CRATE ?auto_6416 ) ( not ( = ?auto_6406 ?auto_6416 ) ) ( not ( = ?auto_6407 ?auto_6416 ) ) ( not ( = ?auto_6414 ?auto_6416 ) ) ( not ( = ?auto_6410 ?auto_6416 ) ) ( not ( = ?auto_6413 ?auto_6416 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6408 ?auto_6416 ?auto_6412 ?auto_6415 )
      ( MAKE-ON ?auto_6406 ?auto_6407 )
      ( MAKE-ON-VERIFY ?auto_6406 ?auto_6407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6500 - SURFACE
      ?auto_6501 - SURFACE
    )
    :vars
    (
      ?auto_6502 - HOIST
      ?auto_6506 - PLACE
      ?auto_6504 - PLACE
      ?auto_6507 - HOIST
      ?auto_6505 - SURFACE
      ?auto_6503 - TRUCK
      ?auto_6508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6502 ?auto_6506 ) ( SURFACE-AT ?auto_6501 ?auto_6506 ) ( CLEAR ?auto_6501 ) ( IS-CRATE ?auto_6500 ) ( not ( = ?auto_6500 ?auto_6501 ) ) ( not ( = ?auto_6504 ?auto_6506 ) ) ( HOIST-AT ?auto_6507 ?auto_6504 ) ( not ( = ?auto_6502 ?auto_6507 ) ) ( AVAILABLE ?auto_6507 ) ( SURFACE-AT ?auto_6500 ?auto_6504 ) ( ON ?auto_6500 ?auto_6505 ) ( CLEAR ?auto_6500 ) ( not ( = ?auto_6500 ?auto_6505 ) ) ( not ( = ?auto_6501 ?auto_6505 ) ) ( TRUCK-AT ?auto_6503 ?auto_6506 ) ( LIFTING ?auto_6502 ?auto_6508 ) ( IS-CRATE ?auto_6508 ) ( not ( = ?auto_6500 ?auto_6508 ) ) ( not ( = ?auto_6501 ?auto_6508 ) ) ( not ( = ?auto_6505 ?auto_6508 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6502 ?auto_6508 ?auto_6503 ?auto_6506 )
      ( MAKE-ON ?auto_6500 ?auto_6501 )
      ( MAKE-ON-VERIFY ?auto_6500 ?auto_6501 ) )
  )

)

