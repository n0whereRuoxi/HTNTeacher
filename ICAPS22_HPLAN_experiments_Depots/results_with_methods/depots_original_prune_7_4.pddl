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
      ?auto_11113 - SURFACE
      ?auto_11114 - SURFACE
    )
    :vars
    (
      ?auto_11115 - HOIST
      ?auto_11116 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11115 ?auto_11116 ) ( SURFACE-AT ?auto_11114 ?auto_11116 ) ( CLEAR ?auto_11114 ) ( LIFTING ?auto_11115 ?auto_11113 ) ( IS-CRATE ?auto_11113 ) ( not ( = ?auto_11113 ?auto_11114 ) ) )
    :subtasks
    ( ( !DROP ?auto_11115 ?auto_11113 ?auto_11114 ?auto_11116 )
      ( MAKE-ON-VERIFY ?auto_11113 ?auto_11114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11117 - SURFACE
      ?auto_11118 - SURFACE
    )
    :vars
    (
      ?auto_11120 - HOIST
      ?auto_11119 - PLACE
      ?auto_11121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11120 ?auto_11119 ) ( SURFACE-AT ?auto_11118 ?auto_11119 ) ( CLEAR ?auto_11118 ) ( IS-CRATE ?auto_11117 ) ( not ( = ?auto_11117 ?auto_11118 ) ) ( TRUCK-AT ?auto_11121 ?auto_11119 ) ( AVAILABLE ?auto_11120 ) ( IN ?auto_11117 ?auto_11121 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11120 ?auto_11117 ?auto_11121 ?auto_11119 )
      ( MAKE-ON ?auto_11117 ?auto_11118 )
      ( MAKE-ON-VERIFY ?auto_11117 ?auto_11118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11122 - SURFACE
      ?auto_11123 - SURFACE
    )
    :vars
    (
      ?auto_11124 - HOIST
      ?auto_11126 - PLACE
      ?auto_11125 - TRUCK
      ?auto_11127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11124 ?auto_11126 ) ( SURFACE-AT ?auto_11123 ?auto_11126 ) ( CLEAR ?auto_11123 ) ( IS-CRATE ?auto_11122 ) ( not ( = ?auto_11122 ?auto_11123 ) ) ( AVAILABLE ?auto_11124 ) ( IN ?auto_11122 ?auto_11125 ) ( TRUCK-AT ?auto_11125 ?auto_11127 ) ( not ( = ?auto_11127 ?auto_11126 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11125 ?auto_11127 ?auto_11126 )
      ( MAKE-ON ?auto_11122 ?auto_11123 )
      ( MAKE-ON-VERIFY ?auto_11122 ?auto_11123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11128 - SURFACE
      ?auto_11129 - SURFACE
    )
    :vars
    (
      ?auto_11131 - HOIST
      ?auto_11132 - PLACE
      ?auto_11130 - TRUCK
      ?auto_11133 - PLACE
      ?auto_11134 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11131 ?auto_11132 ) ( SURFACE-AT ?auto_11129 ?auto_11132 ) ( CLEAR ?auto_11129 ) ( IS-CRATE ?auto_11128 ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( AVAILABLE ?auto_11131 ) ( TRUCK-AT ?auto_11130 ?auto_11133 ) ( not ( = ?auto_11133 ?auto_11132 ) ) ( HOIST-AT ?auto_11134 ?auto_11133 ) ( LIFTING ?auto_11134 ?auto_11128 ) ( not ( = ?auto_11131 ?auto_11134 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11134 ?auto_11128 ?auto_11130 ?auto_11133 )
      ( MAKE-ON ?auto_11128 ?auto_11129 )
      ( MAKE-ON-VERIFY ?auto_11128 ?auto_11129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11135 - SURFACE
      ?auto_11136 - SURFACE
    )
    :vars
    (
      ?auto_11141 - HOIST
      ?auto_11139 - PLACE
      ?auto_11138 - TRUCK
      ?auto_11137 - PLACE
      ?auto_11140 - HOIST
      ?auto_11142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11141 ?auto_11139 ) ( SURFACE-AT ?auto_11136 ?auto_11139 ) ( CLEAR ?auto_11136 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11135 ?auto_11136 ) ) ( AVAILABLE ?auto_11141 ) ( TRUCK-AT ?auto_11138 ?auto_11137 ) ( not ( = ?auto_11137 ?auto_11139 ) ) ( HOIST-AT ?auto_11140 ?auto_11137 ) ( not ( = ?auto_11141 ?auto_11140 ) ) ( AVAILABLE ?auto_11140 ) ( SURFACE-AT ?auto_11135 ?auto_11137 ) ( ON ?auto_11135 ?auto_11142 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11135 ?auto_11142 ) ) ( not ( = ?auto_11136 ?auto_11142 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11140 ?auto_11135 ?auto_11142 ?auto_11137 )
      ( MAKE-ON ?auto_11135 ?auto_11136 )
      ( MAKE-ON-VERIFY ?auto_11135 ?auto_11136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11143 - SURFACE
      ?auto_11144 - SURFACE
    )
    :vars
    (
      ?auto_11150 - HOIST
      ?auto_11147 - PLACE
      ?auto_11149 - PLACE
      ?auto_11145 - HOIST
      ?auto_11146 - SURFACE
      ?auto_11148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11150 ?auto_11147 ) ( SURFACE-AT ?auto_11144 ?auto_11147 ) ( CLEAR ?auto_11144 ) ( IS-CRATE ?auto_11143 ) ( not ( = ?auto_11143 ?auto_11144 ) ) ( AVAILABLE ?auto_11150 ) ( not ( = ?auto_11149 ?auto_11147 ) ) ( HOIST-AT ?auto_11145 ?auto_11149 ) ( not ( = ?auto_11150 ?auto_11145 ) ) ( AVAILABLE ?auto_11145 ) ( SURFACE-AT ?auto_11143 ?auto_11149 ) ( ON ?auto_11143 ?auto_11146 ) ( CLEAR ?auto_11143 ) ( not ( = ?auto_11143 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( TRUCK-AT ?auto_11148 ?auto_11147 ) )
    :subtasks
    ( ( !DRIVE ?auto_11148 ?auto_11147 ?auto_11149 )
      ( MAKE-ON ?auto_11143 ?auto_11144 )
      ( MAKE-ON-VERIFY ?auto_11143 ?auto_11144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11191 - SURFACE
      ?auto_11192 - SURFACE
    )
    :vars
    (
      ?auto_11195 - HOIST
      ?auto_11194 - PLACE
      ?auto_11198 - PLACE
      ?auto_11197 - HOIST
      ?auto_11193 - SURFACE
      ?auto_11196 - TRUCK
      ?auto_11199 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11195 ?auto_11194 ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11198 ?auto_11194 ) ) ( HOIST-AT ?auto_11197 ?auto_11198 ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( AVAILABLE ?auto_11197 ) ( SURFACE-AT ?auto_11191 ?auto_11198 ) ( ON ?auto_11191 ?auto_11193 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( TRUCK-AT ?auto_11196 ?auto_11194 ) ( SURFACE-AT ?auto_11199 ?auto_11194 ) ( CLEAR ?auto_11199 ) ( LIFTING ?auto_11195 ?auto_11192 ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11191 ?auto_11199 ) ) ( not ( = ?auto_11192 ?auto_11199 ) ) ( not ( = ?auto_11193 ?auto_11199 ) ) )
    :subtasks
    ( ( !DROP ?auto_11195 ?auto_11192 ?auto_11199 ?auto_11194 )
      ( MAKE-ON ?auto_11191 ?auto_11192 )
      ( MAKE-ON-VERIFY ?auto_11191 ?auto_11192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11200 - SURFACE
      ?auto_11201 - SURFACE
    )
    :vars
    (
      ?auto_11207 - HOIST
      ?auto_11208 - PLACE
      ?auto_11206 - PLACE
      ?auto_11205 - HOIST
      ?auto_11202 - SURFACE
      ?auto_11204 - TRUCK
      ?auto_11203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11207 ?auto_11208 ) ( IS-CRATE ?auto_11200 ) ( not ( = ?auto_11200 ?auto_11201 ) ) ( not ( = ?auto_11206 ?auto_11208 ) ) ( HOIST-AT ?auto_11205 ?auto_11206 ) ( not ( = ?auto_11207 ?auto_11205 ) ) ( AVAILABLE ?auto_11205 ) ( SURFACE-AT ?auto_11200 ?auto_11206 ) ( ON ?auto_11200 ?auto_11202 ) ( CLEAR ?auto_11200 ) ( not ( = ?auto_11200 ?auto_11202 ) ) ( not ( = ?auto_11201 ?auto_11202 ) ) ( TRUCK-AT ?auto_11204 ?auto_11208 ) ( SURFACE-AT ?auto_11203 ?auto_11208 ) ( CLEAR ?auto_11203 ) ( IS-CRATE ?auto_11201 ) ( not ( = ?auto_11200 ?auto_11203 ) ) ( not ( = ?auto_11201 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( AVAILABLE ?auto_11207 ) ( IN ?auto_11201 ?auto_11204 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11207 ?auto_11201 ?auto_11204 ?auto_11208 )
      ( MAKE-ON ?auto_11200 ?auto_11201 )
      ( MAKE-ON-VERIFY ?auto_11200 ?auto_11201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11215 - SURFACE
      ?auto_11216 - SURFACE
    )
    :vars
    (
      ?auto_11218 - HOIST
      ?auto_11222 - PLACE
      ?auto_11221 - PLACE
      ?auto_11220 - HOIST
      ?auto_11217 - SURFACE
      ?auto_11219 - TRUCK
      ?auto_11223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11218 ?auto_11222 ) ( SURFACE-AT ?auto_11216 ?auto_11222 ) ( CLEAR ?auto_11216 ) ( IS-CRATE ?auto_11215 ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( AVAILABLE ?auto_11218 ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( HOIST-AT ?auto_11220 ?auto_11221 ) ( not ( = ?auto_11218 ?auto_11220 ) ) ( AVAILABLE ?auto_11220 ) ( SURFACE-AT ?auto_11215 ?auto_11221 ) ( ON ?auto_11215 ?auto_11217 ) ( CLEAR ?auto_11215 ) ( not ( = ?auto_11215 ?auto_11217 ) ) ( not ( = ?auto_11216 ?auto_11217 ) ) ( TRUCK-AT ?auto_11219 ?auto_11223 ) ( not ( = ?auto_11223 ?auto_11222 ) ) ( not ( = ?auto_11221 ?auto_11223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11219 ?auto_11223 ?auto_11222 )
      ( MAKE-ON ?auto_11215 ?auto_11216 )
      ( MAKE-ON-VERIFY ?auto_11215 ?auto_11216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11282 - SURFACE
      ?auto_11283 - SURFACE
    )
    :vars
    (
      ?auto_11288 - HOIST
      ?auto_11285 - PLACE
      ?auto_11286 - PLACE
      ?auto_11284 - HOIST
      ?auto_11287 - SURFACE
      ?auto_11290 - SURFACE
      ?auto_11289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11288 ?auto_11285 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11286 ?auto_11285 ) ) ( HOIST-AT ?auto_11284 ?auto_11286 ) ( not ( = ?auto_11288 ?auto_11284 ) ) ( AVAILABLE ?auto_11284 ) ( SURFACE-AT ?auto_11282 ?auto_11286 ) ( ON ?auto_11282 ?auto_11287 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11282 ?auto_11287 ) ) ( not ( = ?auto_11283 ?auto_11287 ) ) ( SURFACE-AT ?auto_11290 ?auto_11285 ) ( CLEAR ?auto_11290 ) ( IS-CRATE ?auto_11283 ) ( not ( = ?auto_11282 ?auto_11290 ) ) ( not ( = ?auto_11283 ?auto_11290 ) ) ( not ( = ?auto_11287 ?auto_11290 ) ) ( AVAILABLE ?auto_11288 ) ( IN ?auto_11283 ?auto_11289 ) ( TRUCK-AT ?auto_11289 ?auto_11286 ) )
    :subtasks
    ( ( !DRIVE ?auto_11289 ?auto_11286 ?auto_11285 )
      ( MAKE-ON ?auto_11282 ?auto_11283 )
      ( MAKE-ON-VERIFY ?auto_11282 ?auto_11283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11291 - SURFACE
      ?auto_11292 - SURFACE
    )
    :vars
    (
      ?auto_11294 - HOIST
      ?auto_11293 - PLACE
      ?auto_11299 - PLACE
      ?auto_11297 - HOIST
      ?auto_11298 - SURFACE
      ?auto_11296 - SURFACE
      ?auto_11295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11294 ?auto_11293 ) ( IS-CRATE ?auto_11291 ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( not ( = ?auto_11299 ?auto_11293 ) ) ( HOIST-AT ?auto_11297 ?auto_11299 ) ( not ( = ?auto_11294 ?auto_11297 ) ) ( SURFACE-AT ?auto_11291 ?auto_11299 ) ( ON ?auto_11291 ?auto_11298 ) ( CLEAR ?auto_11291 ) ( not ( = ?auto_11291 ?auto_11298 ) ) ( not ( = ?auto_11292 ?auto_11298 ) ) ( SURFACE-AT ?auto_11296 ?auto_11293 ) ( CLEAR ?auto_11296 ) ( IS-CRATE ?auto_11292 ) ( not ( = ?auto_11291 ?auto_11296 ) ) ( not ( = ?auto_11292 ?auto_11296 ) ) ( not ( = ?auto_11298 ?auto_11296 ) ) ( AVAILABLE ?auto_11294 ) ( TRUCK-AT ?auto_11295 ?auto_11299 ) ( LIFTING ?auto_11297 ?auto_11292 ) )
    :subtasks
    ( ( !LOAD ?auto_11297 ?auto_11292 ?auto_11295 ?auto_11299 )
      ( MAKE-ON ?auto_11291 ?auto_11292 )
      ( MAKE-ON-VERIFY ?auto_11291 ?auto_11292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11300 - SURFACE
      ?auto_11301 - SURFACE
    )
    :vars
    (
      ?auto_11303 - HOIST
      ?auto_11308 - PLACE
      ?auto_11305 - PLACE
      ?auto_11302 - HOIST
      ?auto_11306 - SURFACE
      ?auto_11304 - SURFACE
      ?auto_11307 - TRUCK
      ?auto_11309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11303 ?auto_11308 ) ( IS-CRATE ?auto_11300 ) ( not ( = ?auto_11300 ?auto_11301 ) ) ( not ( = ?auto_11305 ?auto_11308 ) ) ( HOIST-AT ?auto_11302 ?auto_11305 ) ( not ( = ?auto_11303 ?auto_11302 ) ) ( SURFACE-AT ?auto_11300 ?auto_11305 ) ( ON ?auto_11300 ?auto_11306 ) ( CLEAR ?auto_11300 ) ( not ( = ?auto_11300 ?auto_11306 ) ) ( not ( = ?auto_11301 ?auto_11306 ) ) ( SURFACE-AT ?auto_11304 ?auto_11308 ) ( CLEAR ?auto_11304 ) ( IS-CRATE ?auto_11301 ) ( not ( = ?auto_11300 ?auto_11304 ) ) ( not ( = ?auto_11301 ?auto_11304 ) ) ( not ( = ?auto_11306 ?auto_11304 ) ) ( AVAILABLE ?auto_11303 ) ( TRUCK-AT ?auto_11307 ?auto_11305 ) ( AVAILABLE ?auto_11302 ) ( SURFACE-AT ?auto_11301 ?auto_11305 ) ( ON ?auto_11301 ?auto_11309 ) ( CLEAR ?auto_11301 ) ( not ( = ?auto_11300 ?auto_11309 ) ) ( not ( = ?auto_11301 ?auto_11309 ) ) ( not ( = ?auto_11306 ?auto_11309 ) ) ( not ( = ?auto_11304 ?auto_11309 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11302 ?auto_11301 ?auto_11309 ?auto_11305 )
      ( MAKE-ON ?auto_11300 ?auto_11301 )
      ( MAKE-ON-VERIFY ?auto_11300 ?auto_11301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11310 - SURFACE
      ?auto_11311 - SURFACE
    )
    :vars
    (
      ?auto_11318 - HOIST
      ?auto_11316 - PLACE
      ?auto_11313 - PLACE
      ?auto_11319 - HOIST
      ?auto_11317 - SURFACE
      ?auto_11312 - SURFACE
      ?auto_11315 - SURFACE
      ?auto_11314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11318 ?auto_11316 ) ( IS-CRATE ?auto_11310 ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11313 ?auto_11316 ) ) ( HOIST-AT ?auto_11319 ?auto_11313 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( SURFACE-AT ?auto_11310 ?auto_11313 ) ( ON ?auto_11310 ?auto_11317 ) ( CLEAR ?auto_11310 ) ( not ( = ?auto_11310 ?auto_11317 ) ) ( not ( = ?auto_11311 ?auto_11317 ) ) ( SURFACE-AT ?auto_11312 ?auto_11316 ) ( CLEAR ?auto_11312 ) ( IS-CRATE ?auto_11311 ) ( not ( = ?auto_11310 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11317 ?auto_11312 ) ) ( AVAILABLE ?auto_11318 ) ( AVAILABLE ?auto_11319 ) ( SURFACE-AT ?auto_11311 ?auto_11313 ) ( ON ?auto_11311 ?auto_11315 ) ( CLEAR ?auto_11311 ) ( not ( = ?auto_11310 ?auto_11315 ) ) ( not ( = ?auto_11311 ?auto_11315 ) ) ( not ( = ?auto_11317 ?auto_11315 ) ) ( not ( = ?auto_11312 ?auto_11315 ) ) ( TRUCK-AT ?auto_11314 ?auto_11316 ) )
    :subtasks
    ( ( !DRIVE ?auto_11314 ?auto_11316 ?auto_11313 )
      ( MAKE-ON ?auto_11310 ?auto_11311 )
      ( MAKE-ON-VERIFY ?auto_11310 ?auto_11311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11320 - SURFACE
      ?auto_11321 - SURFACE
    )
    :vars
    (
      ?auto_11324 - HOIST
      ?auto_11323 - PLACE
      ?auto_11325 - PLACE
      ?auto_11329 - HOIST
      ?auto_11326 - SURFACE
      ?auto_11322 - SURFACE
      ?auto_11327 - SURFACE
      ?auto_11328 - TRUCK
      ?auto_11330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11324 ?auto_11323 ) ( IS-CRATE ?auto_11320 ) ( not ( = ?auto_11320 ?auto_11321 ) ) ( not ( = ?auto_11325 ?auto_11323 ) ) ( HOIST-AT ?auto_11329 ?auto_11325 ) ( not ( = ?auto_11324 ?auto_11329 ) ) ( SURFACE-AT ?auto_11320 ?auto_11325 ) ( ON ?auto_11320 ?auto_11326 ) ( CLEAR ?auto_11320 ) ( not ( = ?auto_11320 ?auto_11326 ) ) ( not ( = ?auto_11321 ?auto_11326 ) ) ( IS-CRATE ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11322 ) ) ( not ( = ?auto_11321 ?auto_11322 ) ) ( not ( = ?auto_11326 ?auto_11322 ) ) ( AVAILABLE ?auto_11329 ) ( SURFACE-AT ?auto_11321 ?auto_11325 ) ( ON ?auto_11321 ?auto_11327 ) ( CLEAR ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11327 ) ) ( not ( = ?auto_11321 ?auto_11327 ) ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( not ( = ?auto_11322 ?auto_11327 ) ) ( TRUCK-AT ?auto_11328 ?auto_11323 ) ( SURFACE-AT ?auto_11330 ?auto_11323 ) ( CLEAR ?auto_11330 ) ( LIFTING ?auto_11324 ?auto_11322 ) ( IS-CRATE ?auto_11322 ) ( not ( = ?auto_11320 ?auto_11330 ) ) ( not ( = ?auto_11321 ?auto_11330 ) ) ( not ( = ?auto_11326 ?auto_11330 ) ) ( not ( = ?auto_11322 ?auto_11330 ) ) ( not ( = ?auto_11327 ?auto_11330 ) ) )
    :subtasks
    ( ( !DROP ?auto_11324 ?auto_11322 ?auto_11330 ?auto_11323 )
      ( MAKE-ON ?auto_11320 ?auto_11321 )
      ( MAKE-ON-VERIFY ?auto_11320 ?auto_11321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11420 - SURFACE
      ?auto_11421 - SURFACE
    )
    :vars
    (
      ?auto_11423 - HOIST
      ?auto_11422 - PLACE
      ?auto_11424 - PLACE
      ?auto_11425 - HOIST
      ?auto_11427 - SURFACE
      ?auto_11426 - TRUCK
      ?auto_11428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11423 ?auto_11422 ) ( SURFACE-AT ?auto_11421 ?auto_11422 ) ( CLEAR ?auto_11421 ) ( IS-CRATE ?auto_11420 ) ( not ( = ?auto_11420 ?auto_11421 ) ) ( not ( = ?auto_11424 ?auto_11422 ) ) ( HOIST-AT ?auto_11425 ?auto_11424 ) ( not ( = ?auto_11423 ?auto_11425 ) ) ( AVAILABLE ?auto_11425 ) ( SURFACE-AT ?auto_11420 ?auto_11424 ) ( ON ?auto_11420 ?auto_11427 ) ( CLEAR ?auto_11420 ) ( not ( = ?auto_11420 ?auto_11427 ) ) ( not ( = ?auto_11421 ?auto_11427 ) ) ( TRUCK-AT ?auto_11426 ?auto_11422 ) ( LIFTING ?auto_11423 ?auto_11428 ) ( IS-CRATE ?auto_11428 ) ( not ( = ?auto_11420 ?auto_11428 ) ) ( not ( = ?auto_11421 ?auto_11428 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11423 ?auto_11428 ?auto_11426 ?auto_11422 )
      ( MAKE-ON ?auto_11420 ?auto_11421 )
      ( MAKE-ON-VERIFY ?auto_11420 ?auto_11421 ) )
  )

)

