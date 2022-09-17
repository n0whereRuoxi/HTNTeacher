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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24188 - SURFACE
      ?auto_24189 - SURFACE
    )
    :vars
    (
      ?auto_24190 - HOIST
      ?auto_24191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24190 ?auto_24191 ) ( SURFACE-AT ?auto_24188 ?auto_24191 ) ( CLEAR ?auto_24188 ) ( LIFTING ?auto_24190 ?auto_24189 ) ( IS-CRATE ?auto_24189 ) ( not ( = ?auto_24188 ?auto_24189 ) ) )
    :subtasks
    ( ( !DROP ?auto_24190 ?auto_24189 ?auto_24188 ?auto_24191 )
      ( MAKE-1CRATE-VERIFY ?auto_24188 ?auto_24189 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24192 - SURFACE
      ?auto_24193 - SURFACE
    )
    :vars
    (
      ?auto_24195 - HOIST
      ?auto_24194 - PLACE
      ?auto_24196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24195 ?auto_24194 ) ( SURFACE-AT ?auto_24192 ?auto_24194 ) ( CLEAR ?auto_24192 ) ( IS-CRATE ?auto_24193 ) ( not ( = ?auto_24192 ?auto_24193 ) ) ( TRUCK-AT ?auto_24196 ?auto_24194 ) ( AVAILABLE ?auto_24195 ) ( IN ?auto_24193 ?auto_24196 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24195 ?auto_24193 ?auto_24196 ?auto_24194 )
      ( MAKE-1CRATE ?auto_24192 ?auto_24193 )
      ( MAKE-1CRATE-VERIFY ?auto_24192 ?auto_24193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24197 - SURFACE
      ?auto_24198 - SURFACE
    )
    :vars
    (
      ?auto_24199 - HOIST
      ?auto_24201 - PLACE
      ?auto_24200 - TRUCK
      ?auto_24202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24199 ?auto_24201 ) ( SURFACE-AT ?auto_24197 ?auto_24201 ) ( CLEAR ?auto_24197 ) ( IS-CRATE ?auto_24198 ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( AVAILABLE ?auto_24199 ) ( IN ?auto_24198 ?auto_24200 ) ( TRUCK-AT ?auto_24200 ?auto_24202 ) ( not ( = ?auto_24202 ?auto_24201 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24200 ?auto_24202 ?auto_24201 )
      ( MAKE-1CRATE ?auto_24197 ?auto_24198 )
      ( MAKE-1CRATE-VERIFY ?auto_24197 ?auto_24198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24203 - SURFACE
      ?auto_24204 - SURFACE
    )
    :vars
    (
      ?auto_24208 - HOIST
      ?auto_24207 - PLACE
      ?auto_24205 - TRUCK
      ?auto_24206 - PLACE
      ?auto_24209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24208 ?auto_24207 ) ( SURFACE-AT ?auto_24203 ?auto_24207 ) ( CLEAR ?auto_24203 ) ( IS-CRATE ?auto_24204 ) ( not ( = ?auto_24203 ?auto_24204 ) ) ( AVAILABLE ?auto_24208 ) ( TRUCK-AT ?auto_24205 ?auto_24206 ) ( not ( = ?auto_24206 ?auto_24207 ) ) ( HOIST-AT ?auto_24209 ?auto_24206 ) ( LIFTING ?auto_24209 ?auto_24204 ) ( not ( = ?auto_24208 ?auto_24209 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24209 ?auto_24204 ?auto_24205 ?auto_24206 )
      ( MAKE-1CRATE ?auto_24203 ?auto_24204 )
      ( MAKE-1CRATE-VERIFY ?auto_24203 ?auto_24204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24210 - SURFACE
      ?auto_24211 - SURFACE
    )
    :vars
    (
      ?auto_24215 - HOIST
      ?auto_24214 - PLACE
      ?auto_24212 - TRUCK
      ?auto_24213 - PLACE
      ?auto_24216 - HOIST
      ?auto_24217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24215 ?auto_24214 ) ( SURFACE-AT ?auto_24210 ?auto_24214 ) ( CLEAR ?auto_24210 ) ( IS-CRATE ?auto_24211 ) ( not ( = ?auto_24210 ?auto_24211 ) ) ( AVAILABLE ?auto_24215 ) ( TRUCK-AT ?auto_24212 ?auto_24213 ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( HOIST-AT ?auto_24216 ?auto_24213 ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( AVAILABLE ?auto_24216 ) ( SURFACE-AT ?auto_24211 ?auto_24213 ) ( ON ?auto_24211 ?auto_24217 ) ( CLEAR ?auto_24211 ) ( not ( = ?auto_24210 ?auto_24217 ) ) ( not ( = ?auto_24211 ?auto_24217 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24216 ?auto_24211 ?auto_24217 ?auto_24213 )
      ( MAKE-1CRATE ?auto_24210 ?auto_24211 )
      ( MAKE-1CRATE-VERIFY ?auto_24210 ?auto_24211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24218 - SURFACE
      ?auto_24219 - SURFACE
    )
    :vars
    (
      ?auto_24223 - HOIST
      ?auto_24225 - PLACE
      ?auto_24221 - PLACE
      ?auto_24224 - HOIST
      ?auto_24222 - SURFACE
      ?auto_24220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24223 ?auto_24225 ) ( SURFACE-AT ?auto_24218 ?auto_24225 ) ( CLEAR ?auto_24218 ) ( IS-CRATE ?auto_24219 ) ( not ( = ?auto_24218 ?auto_24219 ) ) ( AVAILABLE ?auto_24223 ) ( not ( = ?auto_24221 ?auto_24225 ) ) ( HOIST-AT ?auto_24224 ?auto_24221 ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( AVAILABLE ?auto_24224 ) ( SURFACE-AT ?auto_24219 ?auto_24221 ) ( ON ?auto_24219 ?auto_24222 ) ( CLEAR ?auto_24219 ) ( not ( = ?auto_24218 ?auto_24222 ) ) ( not ( = ?auto_24219 ?auto_24222 ) ) ( TRUCK-AT ?auto_24220 ?auto_24225 ) )
    :subtasks
    ( ( !DRIVE ?auto_24220 ?auto_24225 ?auto_24221 )
      ( MAKE-1CRATE ?auto_24218 ?auto_24219 )
      ( MAKE-1CRATE-VERIFY ?auto_24218 ?auto_24219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24231 - SURFACE
      ?auto_24232 - SURFACE
    )
    :vars
    (
      ?auto_24233 - HOIST
      ?auto_24234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24233 ?auto_24234 ) ( SURFACE-AT ?auto_24231 ?auto_24234 ) ( CLEAR ?auto_24231 ) ( LIFTING ?auto_24233 ?auto_24232 ) ( IS-CRATE ?auto_24232 ) ( not ( = ?auto_24231 ?auto_24232 ) ) )
    :subtasks
    ( ( !DROP ?auto_24233 ?auto_24232 ?auto_24231 ?auto_24234 )
      ( MAKE-1CRATE-VERIFY ?auto_24231 ?auto_24232 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24235 - SURFACE
      ?auto_24236 - SURFACE
      ?auto_24237 - SURFACE
    )
    :vars
    (
      ?auto_24239 - HOIST
      ?auto_24238 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24239 ?auto_24238 ) ( SURFACE-AT ?auto_24236 ?auto_24238 ) ( CLEAR ?auto_24236 ) ( LIFTING ?auto_24239 ?auto_24237 ) ( IS-CRATE ?auto_24237 ) ( not ( = ?auto_24236 ?auto_24237 ) ) ( ON ?auto_24236 ?auto_24235 ) ( not ( = ?auto_24235 ?auto_24236 ) ) ( not ( = ?auto_24235 ?auto_24237 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24236 ?auto_24237 )
      ( MAKE-2CRATE-VERIFY ?auto_24235 ?auto_24236 ?auto_24237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24240 - SURFACE
      ?auto_24241 - SURFACE
    )
    :vars
    (
      ?auto_24243 - HOIST
      ?auto_24242 - PLACE
      ?auto_24244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24243 ?auto_24242 ) ( SURFACE-AT ?auto_24240 ?auto_24242 ) ( CLEAR ?auto_24240 ) ( IS-CRATE ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( TRUCK-AT ?auto_24244 ?auto_24242 ) ( AVAILABLE ?auto_24243 ) ( IN ?auto_24241 ?auto_24244 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24243 ?auto_24241 ?auto_24244 ?auto_24242 )
      ( MAKE-1CRATE ?auto_24240 ?auto_24241 )
      ( MAKE-1CRATE-VERIFY ?auto_24240 ?auto_24241 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24245 - SURFACE
      ?auto_24246 - SURFACE
      ?auto_24247 - SURFACE
    )
    :vars
    (
      ?auto_24250 - HOIST
      ?auto_24249 - PLACE
      ?auto_24248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24250 ?auto_24249 ) ( SURFACE-AT ?auto_24246 ?auto_24249 ) ( CLEAR ?auto_24246 ) ( IS-CRATE ?auto_24247 ) ( not ( = ?auto_24246 ?auto_24247 ) ) ( TRUCK-AT ?auto_24248 ?auto_24249 ) ( AVAILABLE ?auto_24250 ) ( IN ?auto_24247 ?auto_24248 ) ( ON ?auto_24246 ?auto_24245 ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24245 ?auto_24247 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24246 ?auto_24247 )
      ( MAKE-2CRATE-VERIFY ?auto_24245 ?auto_24246 ?auto_24247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24251 - SURFACE
      ?auto_24252 - SURFACE
    )
    :vars
    (
      ?auto_24255 - HOIST
      ?auto_24256 - PLACE
      ?auto_24253 - TRUCK
      ?auto_24254 - SURFACE
      ?auto_24257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24255 ?auto_24256 ) ( SURFACE-AT ?auto_24251 ?auto_24256 ) ( CLEAR ?auto_24251 ) ( IS-CRATE ?auto_24252 ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( AVAILABLE ?auto_24255 ) ( IN ?auto_24252 ?auto_24253 ) ( ON ?auto_24251 ?auto_24254 ) ( not ( = ?auto_24254 ?auto_24251 ) ) ( not ( = ?auto_24254 ?auto_24252 ) ) ( TRUCK-AT ?auto_24253 ?auto_24257 ) ( not ( = ?auto_24257 ?auto_24256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24253 ?auto_24257 ?auto_24256 )
      ( MAKE-2CRATE ?auto_24254 ?auto_24251 ?auto_24252 )
      ( MAKE-1CRATE-VERIFY ?auto_24251 ?auto_24252 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24258 - SURFACE
      ?auto_24259 - SURFACE
      ?auto_24260 - SURFACE
    )
    :vars
    (
      ?auto_24261 - HOIST
      ?auto_24262 - PLACE
      ?auto_24264 - TRUCK
      ?auto_24263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24261 ?auto_24262 ) ( SURFACE-AT ?auto_24259 ?auto_24262 ) ( CLEAR ?auto_24259 ) ( IS-CRATE ?auto_24260 ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( AVAILABLE ?auto_24261 ) ( IN ?auto_24260 ?auto_24264 ) ( ON ?auto_24259 ?auto_24258 ) ( not ( = ?auto_24258 ?auto_24259 ) ) ( not ( = ?auto_24258 ?auto_24260 ) ) ( TRUCK-AT ?auto_24264 ?auto_24263 ) ( not ( = ?auto_24263 ?auto_24262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24259 ?auto_24260 )
      ( MAKE-2CRATE-VERIFY ?auto_24258 ?auto_24259 ?auto_24260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24265 - SURFACE
      ?auto_24266 - SURFACE
    )
    :vars
    (
      ?auto_24269 - HOIST
      ?auto_24268 - PLACE
      ?auto_24271 - SURFACE
      ?auto_24270 - TRUCK
      ?auto_24267 - PLACE
      ?auto_24272 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24269 ?auto_24268 ) ( SURFACE-AT ?auto_24265 ?auto_24268 ) ( CLEAR ?auto_24265 ) ( IS-CRATE ?auto_24266 ) ( not ( = ?auto_24265 ?auto_24266 ) ) ( AVAILABLE ?auto_24269 ) ( ON ?auto_24265 ?auto_24271 ) ( not ( = ?auto_24271 ?auto_24265 ) ) ( not ( = ?auto_24271 ?auto_24266 ) ) ( TRUCK-AT ?auto_24270 ?auto_24267 ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( HOIST-AT ?auto_24272 ?auto_24267 ) ( LIFTING ?auto_24272 ?auto_24266 ) ( not ( = ?auto_24269 ?auto_24272 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24272 ?auto_24266 ?auto_24270 ?auto_24267 )
      ( MAKE-2CRATE ?auto_24271 ?auto_24265 ?auto_24266 )
      ( MAKE-1CRATE-VERIFY ?auto_24265 ?auto_24266 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24273 - SURFACE
      ?auto_24274 - SURFACE
      ?auto_24275 - SURFACE
    )
    :vars
    (
      ?auto_24280 - HOIST
      ?auto_24276 - PLACE
      ?auto_24279 - TRUCK
      ?auto_24278 - PLACE
      ?auto_24277 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24280 ?auto_24276 ) ( SURFACE-AT ?auto_24274 ?auto_24276 ) ( CLEAR ?auto_24274 ) ( IS-CRATE ?auto_24275 ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( AVAILABLE ?auto_24280 ) ( ON ?auto_24274 ?auto_24273 ) ( not ( = ?auto_24273 ?auto_24274 ) ) ( not ( = ?auto_24273 ?auto_24275 ) ) ( TRUCK-AT ?auto_24279 ?auto_24278 ) ( not ( = ?auto_24278 ?auto_24276 ) ) ( HOIST-AT ?auto_24277 ?auto_24278 ) ( LIFTING ?auto_24277 ?auto_24275 ) ( not ( = ?auto_24280 ?auto_24277 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24274 ?auto_24275 )
      ( MAKE-2CRATE-VERIFY ?auto_24273 ?auto_24274 ?auto_24275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24281 - SURFACE
      ?auto_24282 - SURFACE
    )
    :vars
    (
      ?auto_24284 - HOIST
      ?auto_24286 - PLACE
      ?auto_24288 - SURFACE
      ?auto_24283 - TRUCK
      ?auto_24287 - PLACE
      ?auto_24285 - HOIST
      ?auto_24289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24284 ?auto_24286 ) ( SURFACE-AT ?auto_24281 ?auto_24286 ) ( CLEAR ?auto_24281 ) ( IS-CRATE ?auto_24282 ) ( not ( = ?auto_24281 ?auto_24282 ) ) ( AVAILABLE ?auto_24284 ) ( ON ?auto_24281 ?auto_24288 ) ( not ( = ?auto_24288 ?auto_24281 ) ) ( not ( = ?auto_24288 ?auto_24282 ) ) ( TRUCK-AT ?auto_24283 ?auto_24287 ) ( not ( = ?auto_24287 ?auto_24286 ) ) ( HOIST-AT ?auto_24285 ?auto_24287 ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( AVAILABLE ?auto_24285 ) ( SURFACE-AT ?auto_24282 ?auto_24287 ) ( ON ?auto_24282 ?auto_24289 ) ( CLEAR ?auto_24282 ) ( not ( = ?auto_24281 ?auto_24289 ) ) ( not ( = ?auto_24282 ?auto_24289 ) ) ( not ( = ?auto_24288 ?auto_24289 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24285 ?auto_24282 ?auto_24289 ?auto_24287 )
      ( MAKE-2CRATE ?auto_24288 ?auto_24281 ?auto_24282 )
      ( MAKE-1CRATE-VERIFY ?auto_24281 ?auto_24282 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24290 - SURFACE
      ?auto_24291 - SURFACE
      ?auto_24292 - SURFACE
    )
    :vars
    (
      ?auto_24295 - HOIST
      ?auto_24296 - PLACE
      ?auto_24298 - TRUCK
      ?auto_24294 - PLACE
      ?auto_24297 - HOIST
      ?auto_24293 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24295 ?auto_24296 ) ( SURFACE-AT ?auto_24291 ?auto_24296 ) ( CLEAR ?auto_24291 ) ( IS-CRATE ?auto_24292 ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( AVAILABLE ?auto_24295 ) ( ON ?auto_24291 ?auto_24290 ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( TRUCK-AT ?auto_24298 ?auto_24294 ) ( not ( = ?auto_24294 ?auto_24296 ) ) ( HOIST-AT ?auto_24297 ?auto_24294 ) ( not ( = ?auto_24295 ?auto_24297 ) ) ( AVAILABLE ?auto_24297 ) ( SURFACE-AT ?auto_24292 ?auto_24294 ) ( ON ?auto_24292 ?auto_24293 ) ( CLEAR ?auto_24292 ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24291 ?auto_24292 )
      ( MAKE-2CRATE-VERIFY ?auto_24290 ?auto_24291 ?auto_24292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24299 - SURFACE
      ?auto_24300 - SURFACE
    )
    :vars
    (
      ?auto_24304 - HOIST
      ?auto_24307 - PLACE
      ?auto_24303 - SURFACE
      ?auto_24302 - PLACE
      ?auto_24305 - HOIST
      ?auto_24301 - SURFACE
      ?auto_24306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24304 ?auto_24307 ) ( SURFACE-AT ?auto_24299 ?auto_24307 ) ( CLEAR ?auto_24299 ) ( IS-CRATE ?auto_24300 ) ( not ( = ?auto_24299 ?auto_24300 ) ) ( AVAILABLE ?auto_24304 ) ( ON ?auto_24299 ?auto_24303 ) ( not ( = ?auto_24303 ?auto_24299 ) ) ( not ( = ?auto_24303 ?auto_24300 ) ) ( not ( = ?auto_24302 ?auto_24307 ) ) ( HOIST-AT ?auto_24305 ?auto_24302 ) ( not ( = ?auto_24304 ?auto_24305 ) ) ( AVAILABLE ?auto_24305 ) ( SURFACE-AT ?auto_24300 ?auto_24302 ) ( ON ?auto_24300 ?auto_24301 ) ( CLEAR ?auto_24300 ) ( not ( = ?auto_24299 ?auto_24301 ) ) ( not ( = ?auto_24300 ?auto_24301 ) ) ( not ( = ?auto_24303 ?auto_24301 ) ) ( TRUCK-AT ?auto_24306 ?auto_24307 ) )
    :subtasks
    ( ( !DRIVE ?auto_24306 ?auto_24307 ?auto_24302 )
      ( MAKE-2CRATE ?auto_24303 ?auto_24299 ?auto_24300 )
      ( MAKE-1CRATE-VERIFY ?auto_24299 ?auto_24300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24308 - SURFACE
      ?auto_24309 - SURFACE
      ?auto_24310 - SURFACE
    )
    :vars
    (
      ?auto_24316 - HOIST
      ?auto_24314 - PLACE
      ?auto_24312 - PLACE
      ?auto_24313 - HOIST
      ?auto_24315 - SURFACE
      ?auto_24311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24316 ?auto_24314 ) ( SURFACE-AT ?auto_24309 ?auto_24314 ) ( CLEAR ?auto_24309 ) ( IS-CRATE ?auto_24310 ) ( not ( = ?auto_24309 ?auto_24310 ) ) ( AVAILABLE ?auto_24316 ) ( ON ?auto_24309 ?auto_24308 ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( HOIST-AT ?auto_24313 ?auto_24312 ) ( not ( = ?auto_24316 ?auto_24313 ) ) ( AVAILABLE ?auto_24313 ) ( SURFACE-AT ?auto_24310 ?auto_24312 ) ( ON ?auto_24310 ?auto_24315 ) ( CLEAR ?auto_24310 ) ( not ( = ?auto_24309 ?auto_24315 ) ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24308 ?auto_24315 ) ) ( TRUCK-AT ?auto_24311 ?auto_24314 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24309 ?auto_24310 )
      ( MAKE-2CRATE-VERIFY ?auto_24308 ?auto_24309 ?auto_24310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24317 - SURFACE
      ?auto_24318 - SURFACE
    )
    :vars
    (
      ?auto_24322 - HOIST
      ?auto_24320 - PLACE
      ?auto_24325 - SURFACE
      ?auto_24324 - PLACE
      ?auto_24321 - HOIST
      ?auto_24319 - SURFACE
      ?auto_24323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24322 ?auto_24320 ) ( IS-CRATE ?auto_24318 ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24325 ?auto_24317 ) ) ( not ( = ?auto_24325 ?auto_24318 ) ) ( not ( = ?auto_24324 ?auto_24320 ) ) ( HOIST-AT ?auto_24321 ?auto_24324 ) ( not ( = ?auto_24322 ?auto_24321 ) ) ( AVAILABLE ?auto_24321 ) ( SURFACE-AT ?auto_24318 ?auto_24324 ) ( ON ?auto_24318 ?auto_24319 ) ( CLEAR ?auto_24318 ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24325 ?auto_24319 ) ) ( TRUCK-AT ?auto_24323 ?auto_24320 ) ( SURFACE-AT ?auto_24325 ?auto_24320 ) ( CLEAR ?auto_24325 ) ( LIFTING ?auto_24322 ?auto_24317 ) ( IS-CRATE ?auto_24317 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24325 ?auto_24317 )
      ( MAKE-2CRATE ?auto_24325 ?auto_24317 ?auto_24318 )
      ( MAKE-1CRATE-VERIFY ?auto_24317 ?auto_24318 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24326 - SURFACE
      ?auto_24327 - SURFACE
      ?auto_24328 - SURFACE
    )
    :vars
    (
      ?auto_24332 - HOIST
      ?auto_24334 - PLACE
      ?auto_24333 - PLACE
      ?auto_24330 - HOIST
      ?auto_24331 - SURFACE
      ?auto_24329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24332 ?auto_24334 ) ( IS-CRATE ?auto_24328 ) ( not ( = ?auto_24327 ?auto_24328 ) ) ( not ( = ?auto_24326 ?auto_24327 ) ) ( not ( = ?auto_24326 ?auto_24328 ) ) ( not ( = ?auto_24333 ?auto_24334 ) ) ( HOIST-AT ?auto_24330 ?auto_24333 ) ( not ( = ?auto_24332 ?auto_24330 ) ) ( AVAILABLE ?auto_24330 ) ( SURFACE-AT ?auto_24328 ?auto_24333 ) ( ON ?auto_24328 ?auto_24331 ) ( CLEAR ?auto_24328 ) ( not ( = ?auto_24327 ?auto_24331 ) ) ( not ( = ?auto_24328 ?auto_24331 ) ) ( not ( = ?auto_24326 ?auto_24331 ) ) ( TRUCK-AT ?auto_24329 ?auto_24334 ) ( SURFACE-AT ?auto_24326 ?auto_24334 ) ( CLEAR ?auto_24326 ) ( LIFTING ?auto_24332 ?auto_24327 ) ( IS-CRATE ?auto_24327 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24327 ?auto_24328 )
      ( MAKE-2CRATE-VERIFY ?auto_24326 ?auto_24327 ?auto_24328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24335 - SURFACE
      ?auto_24336 - SURFACE
    )
    :vars
    (
      ?auto_24337 - HOIST
      ?auto_24340 - PLACE
      ?auto_24343 - SURFACE
      ?auto_24342 - PLACE
      ?auto_24341 - HOIST
      ?auto_24338 - SURFACE
      ?auto_24339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24337 ?auto_24340 ) ( IS-CRATE ?auto_24336 ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( not ( = ?auto_24343 ?auto_24335 ) ) ( not ( = ?auto_24343 ?auto_24336 ) ) ( not ( = ?auto_24342 ?auto_24340 ) ) ( HOIST-AT ?auto_24341 ?auto_24342 ) ( not ( = ?auto_24337 ?auto_24341 ) ) ( AVAILABLE ?auto_24341 ) ( SURFACE-AT ?auto_24336 ?auto_24342 ) ( ON ?auto_24336 ?auto_24338 ) ( CLEAR ?auto_24336 ) ( not ( = ?auto_24335 ?auto_24338 ) ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24343 ?auto_24338 ) ) ( TRUCK-AT ?auto_24339 ?auto_24340 ) ( SURFACE-AT ?auto_24343 ?auto_24340 ) ( CLEAR ?auto_24343 ) ( IS-CRATE ?auto_24335 ) ( AVAILABLE ?auto_24337 ) ( IN ?auto_24335 ?auto_24339 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24337 ?auto_24335 ?auto_24339 ?auto_24340 )
      ( MAKE-2CRATE ?auto_24343 ?auto_24335 ?auto_24336 )
      ( MAKE-1CRATE-VERIFY ?auto_24335 ?auto_24336 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24344 - SURFACE
      ?auto_24345 - SURFACE
      ?auto_24346 - SURFACE
    )
    :vars
    (
      ?auto_24350 - HOIST
      ?auto_24348 - PLACE
      ?auto_24352 - PLACE
      ?auto_24347 - HOIST
      ?auto_24349 - SURFACE
      ?auto_24351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24350 ?auto_24348 ) ( IS-CRATE ?auto_24346 ) ( not ( = ?auto_24345 ?auto_24346 ) ) ( not ( = ?auto_24344 ?auto_24345 ) ) ( not ( = ?auto_24344 ?auto_24346 ) ) ( not ( = ?auto_24352 ?auto_24348 ) ) ( HOIST-AT ?auto_24347 ?auto_24352 ) ( not ( = ?auto_24350 ?auto_24347 ) ) ( AVAILABLE ?auto_24347 ) ( SURFACE-AT ?auto_24346 ?auto_24352 ) ( ON ?auto_24346 ?auto_24349 ) ( CLEAR ?auto_24346 ) ( not ( = ?auto_24345 ?auto_24349 ) ) ( not ( = ?auto_24346 ?auto_24349 ) ) ( not ( = ?auto_24344 ?auto_24349 ) ) ( TRUCK-AT ?auto_24351 ?auto_24348 ) ( SURFACE-AT ?auto_24344 ?auto_24348 ) ( CLEAR ?auto_24344 ) ( IS-CRATE ?auto_24345 ) ( AVAILABLE ?auto_24350 ) ( IN ?auto_24345 ?auto_24351 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24345 ?auto_24346 )
      ( MAKE-2CRATE-VERIFY ?auto_24344 ?auto_24345 ?auto_24346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24353 - SURFACE
      ?auto_24354 - SURFACE
    )
    :vars
    (
      ?auto_24355 - HOIST
      ?auto_24357 - PLACE
      ?auto_24361 - SURFACE
      ?auto_24358 - PLACE
      ?auto_24359 - HOIST
      ?auto_24356 - SURFACE
      ?auto_24360 - TRUCK
      ?auto_24362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24355 ?auto_24357 ) ( IS-CRATE ?auto_24354 ) ( not ( = ?auto_24353 ?auto_24354 ) ) ( not ( = ?auto_24361 ?auto_24353 ) ) ( not ( = ?auto_24361 ?auto_24354 ) ) ( not ( = ?auto_24358 ?auto_24357 ) ) ( HOIST-AT ?auto_24359 ?auto_24358 ) ( not ( = ?auto_24355 ?auto_24359 ) ) ( AVAILABLE ?auto_24359 ) ( SURFACE-AT ?auto_24354 ?auto_24358 ) ( ON ?auto_24354 ?auto_24356 ) ( CLEAR ?auto_24354 ) ( not ( = ?auto_24353 ?auto_24356 ) ) ( not ( = ?auto_24354 ?auto_24356 ) ) ( not ( = ?auto_24361 ?auto_24356 ) ) ( SURFACE-AT ?auto_24361 ?auto_24357 ) ( CLEAR ?auto_24361 ) ( IS-CRATE ?auto_24353 ) ( AVAILABLE ?auto_24355 ) ( IN ?auto_24353 ?auto_24360 ) ( TRUCK-AT ?auto_24360 ?auto_24362 ) ( not ( = ?auto_24362 ?auto_24357 ) ) ( not ( = ?auto_24358 ?auto_24362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24360 ?auto_24362 ?auto_24357 )
      ( MAKE-2CRATE ?auto_24361 ?auto_24353 ?auto_24354 )
      ( MAKE-1CRATE-VERIFY ?auto_24353 ?auto_24354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24363 - SURFACE
      ?auto_24364 - SURFACE
      ?auto_24365 - SURFACE
    )
    :vars
    (
      ?auto_24366 - HOIST
      ?auto_24369 - PLACE
      ?auto_24370 - PLACE
      ?auto_24371 - HOIST
      ?auto_24367 - SURFACE
      ?auto_24372 - TRUCK
      ?auto_24368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24366 ?auto_24369 ) ( IS-CRATE ?auto_24365 ) ( not ( = ?auto_24364 ?auto_24365 ) ) ( not ( = ?auto_24363 ?auto_24364 ) ) ( not ( = ?auto_24363 ?auto_24365 ) ) ( not ( = ?auto_24370 ?auto_24369 ) ) ( HOIST-AT ?auto_24371 ?auto_24370 ) ( not ( = ?auto_24366 ?auto_24371 ) ) ( AVAILABLE ?auto_24371 ) ( SURFACE-AT ?auto_24365 ?auto_24370 ) ( ON ?auto_24365 ?auto_24367 ) ( CLEAR ?auto_24365 ) ( not ( = ?auto_24364 ?auto_24367 ) ) ( not ( = ?auto_24365 ?auto_24367 ) ) ( not ( = ?auto_24363 ?auto_24367 ) ) ( SURFACE-AT ?auto_24363 ?auto_24369 ) ( CLEAR ?auto_24363 ) ( IS-CRATE ?auto_24364 ) ( AVAILABLE ?auto_24366 ) ( IN ?auto_24364 ?auto_24372 ) ( TRUCK-AT ?auto_24372 ?auto_24368 ) ( not ( = ?auto_24368 ?auto_24369 ) ) ( not ( = ?auto_24370 ?auto_24368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24364 ?auto_24365 )
      ( MAKE-2CRATE-VERIFY ?auto_24363 ?auto_24364 ?auto_24365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24373 - SURFACE
      ?auto_24374 - SURFACE
    )
    :vars
    (
      ?auto_24382 - HOIST
      ?auto_24375 - PLACE
      ?auto_24379 - SURFACE
      ?auto_24378 - PLACE
      ?auto_24381 - HOIST
      ?auto_24380 - SURFACE
      ?auto_24376 - TRUCK
      ?auto_24377 - PLACE
      ?auto_24383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24382 ?auto_24375 ) ( IS-CRATE ?auto_24374 ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( not ( = ?auto_24379 ?auto_24373 ) ) ( not ( = ?auto_24379 ?auto_24374 ) ) ( not ( = ?auto_24378 ?auto_24375 ) ) ( HOIST-AT ?auto_24381 ?auto_24378 ) ( not ( = ?auto_24382 ?auto_24381 ) ) ( AVAILABLE ?auto_24381 ) ( SURFACE-AT ?auto_24374 ?auto_24378 ) ( ON ?auto_24374 ?auto_24380 ) ( CLEAR ?auto_24374 ) ( not ( = ?auto_24373 ?auto_24380 ) ) ( not ( = ?auto_24374 ?auto_24380 ) ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( SURFACE-AT ?auto_24379 ?auto_24375 ) ( CLEAR ?auto_24379 ) ( IS-CRATE ?auto_24373 ) ( AVAILABLE ?auto_24382 ) ( TRUCK-AT ?auto_24376 ?auto_24377 ) ( not ( = ?auto_24377 ?auto_24375 ) ) ( not ( = ?auto_24378 ?auto_24377 ) ) ( HOIST-AT ?auto_24383 ?auto_24377 ) ( LIFTING ?auto_24383 ?auto_24373 ) ( not ( = ?auto_24382 ?auto_24383 ) ) ( not ( = ?auto_24381 ?auto_24383 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24383 ?auto_24373 ?auto_24376 ?auto_24377 )
      ( MAKE-2CRATE ?auto_24379 ?auto_24373 ?auto_24374 )
      ( MAKE-1CRATE-VERIFY ?auto_24373 ?auto_24374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24384 - SURFACE
      ?auto_24385 - SURFACE
      ?auto_24386 - SURFACE
    )
    :vars
    (
      ?auto_24391 - HOIST
      ?auto_24389 - PLACE
      ?auto_24388 - PLACE
      ?auto_24390 - HOIST
      ?auto_24394 - SURFACE
      ?auto_24393 - TRUCK
      ?auto_24387 - PLACE
      ?auto_24392 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24391 ?auto_24389 ) ( IS-CRATE ?auto_24386 ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24386 ) ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( HOIST-AT ?auto_24390 ?auto_24388 ) ( not ( = ?auto_24391 ?auto_24390 ) ) ( AVAILABLE ?auto_24390 ) ( SURFACE-AT ?auto_24386 ?auto_24388 ) ( ON ?auto_24386 ?auto_24394 ) ( CLEAR ?auto_24386 ) ( not ( = ?auto_24385 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24394 ) ) ( not ( = ?auto_24384 ?auto_24394 ) ) ( SURFACE-AT ?auto_24384 ?auto_24389 ) ( CLEAR ?auto_24384 ) ( IS-CRATE ?auto_24385 ) ( AVAILABLE ?auto_24391 ) ( TRUCK-AT ?auto_24393 ?auto_24387 ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24387 ) ) ( HOIST-AT ?auto_24392 ?auto_24387 ) ( LIFTING ?auto_24392 ?auto_24385 ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24385 ?auto_24386 )
      ( MAKE-2CRATE-VERIFY ?auto_24384 ?auto_24385 ?auto_24386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24395 - SURFACE
      ?auto_24396 - SURFACE
    )
    :vars
    (
      ?auto_24404 - HOIST
      ?auto_24399 - PLACE
      ?auto_24401 - SURFACE
      ?auto_24405 - PLACE
      ?auto_24398 - HOIST
      ?auto_24397 - SURFACE
      ?auto_24400 - TRUCK
      ?auto_24403 - PLACE
      ?auto_24402 - HOIST
      ?auto_24406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24404 ?auto_24399 ) ( IS-CRATE ?auto_24396 ) ( not ( = ?auto_24395 ?auto_24396 ) ) ( not ( = ?auto_24401 ?auto_24395 ) ) ( not ( = ?auto_24401 ?auto_24396 ) ) ( not ( = ?auto_24405 ?auto_24399 ) ) ( HOIST-AT ?auto_24398 ?auto_24405 ) ( not ( = ?auto_24404 ?auto_24398 ) ) ( AVAILABLE ?auto_24398 ) ( SURFACE-AT ?auto_24396 ?auto_24405 ) ( ON ?auto_24396 ?auto_24397 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24395 ?auto_24397 ) ) ( not ( = ?auto_24396 ?auto_24397 ) ) ( not ( = ?auto_24401 ?auto_24397 ) ) ( SURFACE-AT ?auto_24401 ?auto_24399 ) ( CLEAR ?auto_24401 ) ( IS-CRATE ?auto_24395 ) ( AVAILABLE ?auto_24404 ) ( TRUCK-AT ?auto_24400 ?auto_24403 ) ( not ( = ?auto_24403 ?auto_24399 ) ) ( not ( = ?auto_24405 ?auto_24403 ) ) ( HOIST-AT ?auto_24402 ?auto_24403 ) ( not ( = ?auto_24404 ?auto_24402 ) ) ( not ( = ?auto_24398 ?auto_24402 ) ) ( AVAILABLE ?auto_24402 ) ( SURFACE-AT ?auto_24395 ?auto_24403 ) ( ON ?auto_24395 ?auto_24406 ) ( CLEAR ?auto_24395 ) ( not ( = ?auto_24395 ?auto_24406 ) ) ( not ( = ?auto_24396 ?auto_24406 ) ) ( not ( = ?auto_24401 ?auto_24406 ) ) ( not ( = ?auto_24397 ?auto_24406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24402 ?auto_24395 ?auto_24406 ?auto_24403 )
      ( MAKE-2CRATE ?auto_24401 ?auto_24395 ?auto_24396 )
      ( MAKE-1CRATE-VERIFY ?auto_24395 ?auto_24396 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24407 - SURFACE
      ?auto_24408 - SURFACE
      ?auto_24409 - SURFACE
    )
    :vars
    (
      ?auto_24413 - HOIST
      ?auto_24411 - PLACE
      ?auto_24418 - PLACE
      ?auto_24415 - HOIST
      ?auto_24412 - SURFACE
      ?auto_24410 - TRUCK
      ?auto_24414 - PLACE
      ?auto_24417 - HOIST
      ?auto_24416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24413 ?auto_24411 ) ( IS-CRATE ?auto_24409 ) ( not ( = ?auto_24408 ?auto_24409 ) ) ( not ( = ?auto_24407 ?auto_24408 ) ) ( not ( = ?auto_24407 ?auto_24409 ) ) ( not ( = ?auto_24418 ?auto_24411 ) ) ( HOIST-AT ?auto_24415 ?auto_24418 ) ( not ( = ?auto_24413 ?auto_24415 ) ) ( AVAILABLE ?auto_24415 ) ( SURFACE-AT ?auto_24409 ?auto_24418 ) ( ON ?auto_24409 ?auto_24412 ) ( CLEAR ?auto_24409 ) ( not ( = ?auto_24408 ?auto_24412 ) ) ( not ( = ?auto_24409 ?auto_24412 ) ) ( not ( = ?auto_24407 ?auto_24412 ) ) ( SURFACE-AT ?auto_24407 ?auto_24411 ) ( CLEAR ?auto_24407 ) ( IS-CRATE ?auto_24408 ) ( AVAILABLE ?auto_24413 ) ( TRUCK-AT ?auto_24410 ?auto_24414 ) ( not ( = ?auto_24414 ?auto_24411 ) ) ( not ( = ?auto_24418 ?auto_24414 ) ) ( HOIST-AT ?auto_24417 ?auto_24414 ) ( not ( = ?auto_24413 ?auto_24417 ) ) ( not ( = ?auto_24415 ?auto_24417 ) ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24408 ?auto_24414 ) ( ON ?auto_24408 ?auto_24416 ) ( CLEAR ?auto_24408 ) ( not ( = ?auto_24408 ?auto_24416 ) ) ( not ( = ?auto_24409 ?auto_24416 ) ) ( not ( = ?auto_24407 ?auto_24416 ) ) ( not ( = ?auto_24412 ?auto_24416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24408 ?auto_24409 )
      ( MAKE-2CRATE-VERIFY ?auto_24407 ?auto_24408 ?auto_24409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24419 - SURFACE
      ?auto_24420 - SURFACE
    )
    :vars
    (
      ?auto_24423 - HOIST
      ?auto_24427 - PLACE
      ?auto_24424 - SURFACE
      ?auto_24426 - PLACE
      ?auto_24421 - HOIST
      ?auto_24430 - SURFACE
      ?auto_24428 - PLACE
      ?auto_24429 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24423 ?auto_24427 ) ( IS-CRATE ?auto_24420 ) ( not ( = ?auto_24419 ?auto_24420 ) ) ( not ( = ?auto_24424 ?auto_24419 ) ) ( not ( = ?auto_24424 ?auto_24420 ) ) ( not ( = ?auto_24426 ?auto_24427 ) ) ( HOIST-AT ?auto_24421 ?auto_24426 ) ( not ( = ?auto_24423 ?auto_24421 ) ) ( AVAILABLE ?auto_24421 ) ( SURFACE-AT ?auto_24420 ?auto_24426 ) ( ON ?auto_24420 ?auto_24430 ) ( CLEAR ?auto_24420 ) ( not ( = ?auto_24419 ?auto_24430 ) ) ( not ( = ?auto_24420 ?auto_24430 ) ) ( not ( = ?auto_24424 ?auto_24430 ) ) ( SURFACE-AT ?auto_24424 ?auto_24427 ) ( CLEAR ?auto_24424 ) ( IS-CRATE ?auto_24419 ) ( AVAILABLE ?auto_24423 ) ( not ( = ?auto_24428 ?auto_24427 ) ) ( not ( = ?auto_24426 ?auto_24428 ) ) ( HOIST-AT ?auto_24429 ?auto_24428 ) ( not ( = ?auto_24423 ?auto_24429 ) ) ( not ( = ?auto_24421 ?auto_24429 ) ) ( AVAILABLE ?auto_24429 ) ( SURFACE-AT ?auto_24419 ?auto_24428 ) ( ON ?auto_24419 ?auto_24425 ) ( CLEAR ?auto_24419 ) ( not ( = ?auto_24419 ?auto_24425 ) ) ( not ( = ?auto_24420 ?auto_24425 ) ) ( not ( = ?auto_24424 ?auto_24425 ) ) ( not ( = ?auto_24430 ?auto_24425 ) ) ( TRUCK-AT ?auto_24422 ?auto_24427 ) )
    :subtasks
    ( ( !DRIVE ?auto_24422 ?auto_24427 ?auto_24428 )
      ( MAKE-2CRATE ?auto_24424 ?auto_24419 ?auto_24420 )
      ( MAKE-1CRATE-VERIFY ?auto_24419 ?auto_24420 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24431 - SURFACE
      ?auto_24432 - SURFACE
      ?auto_24433 - SURFACE
    )
    :vars
    (
      ?auto_24441 - HOIST
      ?auto_24440 - PLACE
      ?auto_24434 - PLACE
      ?auto_24442 - HOIST
      ?auto_24436 - SURFACE
      ?auto_24438 - PLACE
      ?auto_24437 - HOIST
      ?auto_24435 - SURFACE
      ?auto_24439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24441 ?auto_24440 ) ( IS-CRATE ?auto_24433 ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24434 ?auto_24440 ) ) ( HOIST-AT ?auto_24442 ?auto_24434 ) ( not ( = ?auto_24441 ?auto_24442 ) ) ( AVAILABLE ?auto_24442 ) ( SURFACE-AT ?auto_24433 ?auto_24434 ) ( ON ?auto_24433 ?auto_24436 ) ( CLEAR ?auto_24433 ) ( not ( = ?auto_24432 ?auto_24436 ) ) ( not ( = ?auto_24433 ?auto_24436 ) ) ( not ( = ?auto_24431 ?auto_24436 ) ) ( SURFACE-AT ?auto_24431 ?auto_24440 ) ( CLEAR ?auto_24431 ) ( IS-CRATE ?auto_24432 ) ( AVAILABLE ?auto_24441 ) ( not ( = ?auto_24438 ?auto_24440 ) ) ( not ( = ?auto_24434 ?auto_24438 ) ) ( HOIST-AT ?auto_24437 ?auto_24438 ) ( not ( = ?auto_24441 ?auto_24437 ) ) ( not ( = ?auto_24442 ?auto_24437 ) ) ( AVAILABLE ?auto_24437 ) ( SURFACE-AT ?auto_24432 ?auto_24438 ) ( ON ?auto_24432 ?auto_24435 ) ( CLEAR ?auto_24432 ) ( not ( = ?auto_24432 ?auto_24435 ) ) ( not ( = ?auto_24433 ?auto_24435 ) ) ( not ( = ?auto_24431 ?auto_24435 ) ) ( not ( = ?auto_24436 ?auto_24435 ) ) ( TRUCK-AT ?auto_24439 ?auto_24440 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24432 ?auto_24433 )
      ( MAKE-2CRATE-VERIFY ?auto_24431 ?auto_24432 ?auto_24433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24452 - SURFACE
      ?auto_24453 - SURFACE
    )
    :vars
    (
      ?auto_24454 - HOIST
      ?auto_24455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24454 ?auto_24455 ) ( SURFACE-AT ?auto_24452 ?auto_24455 ) ( CLEAR ?auto_24452 ) ( LIFTING ?auto_24454 ?auto_24453 ) ( IS-CRATE ?auto_24453 ) ( not ( = ?auto_24452 ?auto_24453 ) ) )
    :subtasks
    ( ( !DROP ?auto_24454 ?auto_24453 ?auto_24452 ?auto_24455 )
      ( MAKE-1CRATE-VERIFY ?auto_24452 ?auto_24453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24456 - SURFACE
      ?auto_24457 - SURFACE
      ?auto_24458 - SURFACE
    )
    :vars
    (
      ?auto_24459 - HOIST
      ?auto_24460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24459 ?auto_24460 ) ( SURFACE-AT ?auto_24457 ?auto_24460 ) ( CLEAR ?auto_24457 ) ( LIFTING ?auto_24459 ?auto_24458 ) ( IS-CRATE ?auto_24458 ) ( not ( = ?auto_24457 ?auto_24458 ) ) ( ON ?auto_24457 ?auto_24456 ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( not ( = ?auto_24456 ?auto_24458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24457 ?auto_24458 )
      ( MAKE-2CRATE-VERIFY ?auto_24456 ?auto_24457 ?auto_24458 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24461 - SURFACE
      ?auto_24462 - SURFACE
      ?auto_24463 - SURFACE
      ?auto_24464 - SURFACE
    )
    :vars
    (
      ?auto_24465 - HOIST
      ?auto_24466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24465 ?auto_24466 ) ( SURFACE-AT ?auto_24463 ?auto_24466 ) ( CLEAR ?auto_24463 ) ( LIFTING ?auto_24465 ?auto_24464 ) ( IS-CRATE ?auto_24464 ) ( not ( = ?auto_24463 ?auto_24464 ) ) ( ON ?auto_24462 ?auto_24461 ) ( ON ?auto_24463 ?auto_24462 ) ( not ( = ?auto_24461 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24461 ?auto_24464 ) ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24463 ?auto_24464 )
      ( MAKE-3CRATE-VERIFY ?auto_24461 ?auto_24462 ?auto_24463 ?auto_24464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24467 - SURFACE
      ?auto_24468 - SURFACE
    )
    :vars
    (
      ?auto_24469 - HOIST
      ?auto_24470 - PLACE
      ?auto_24471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24469 ?auto_24470 ) ( SURFACE-AT ?auto_24467 ?auto_24470 ) ( CLEAR ?auto_24467 ) ( IS-CRATE ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( TRUCK-AT ?auto_24471 ?auto_24470 ) ( AVAILABLE ?auto_24469 ) ( IN ?auto_24468 ?auto_24471 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24469 ?auto_24468 ?auto_24471 ?auto_24470 )
      ( MAKE-1CRATE ?auto_24467 ?auto_24468 )
      ( MAKE-1CRATE-VERIFY ?auto_24467 ?auto_24468 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24472 - SURFACE
      ?auto_24473 - SURFACE
      ?auto_24474 - SURFACE
    )
    :vars
    (
      ?auto_24475 - HOIST
      ?auto_24476 - PLACE
      ?auto_24477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24475 ?auto_24476 ) ( SURFACE-AT ?auto_24473 ?auto_24476 ) ( CLEAR ?auto_24473 ) ( IS-CRATE ?auto_24474 ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( TRUCK-AT ?auto_24477 ?auto_24476 ) ( AVAILABLE ?auto_24475 ) ( IN ?auto_24474 ?auto_24477 ) ( ON ?auto_24473 ?auto_24472 ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( not ( = ?auto_24472 ?auto_24474 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24473 ?auto_24474 )
      ( MAKE-2CRATE-VERIFY ?auto_24472 ?auto_24473 ?auto_24474 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24478 - SURFACE
      ?auto_24479 - SURFACE
      ?auto_24480 - SURFACE
      ?auto_24481 - SURFACE
    )
    :vars
    (
      ?auto_24482 - HOIST
      ?auto_24483 - PLACE
      ?auto_24484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24482 ?auto_24483 ) ( SURFACE-AT ?auto_24480 ?auto_24483 ) ( CLEAR ?auto_24480 ) ( IS-CRATE ?auto_24481 ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( TRUCK-AT ?auto_24484 ?auto_24483 ) ( AVAILABLE ?auto_24482 ) ( IN ?auto_24481 ?auto_24484 ) ( ON ?auto_24480 ?auto_24479 ) ( not ( = ?auto_24479 ?auto_24480 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( ON ?auto_24479 ?auto_24478 ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24479 ?auto_24480 ?auto_24481 )
      ( MAKE-3CRATE-VERIFY ?auto_24478 ?auto_24479 ?auto_24480 ?auto_24481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24485 - SURFACE
      ?auto_24486 - SURFACE
    )
    :vars
    (
      ?auto_24487 - HOIST
      ?auto_24489 - PLACE
      ?auto_24490 - TRUCK
      ?auto_24488 - SURFACE
      ?auto_24491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24487 ?auto_24489 ) ( SURFACE-AT ?auto_24485 ?auto_24489 ) ( CLEAR ?auto_24485 ) ( IS-CRATE ?auto_24486 ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( AVAILABLE ?auto_24487 ) ( IN ?auto_24486 ?auto_24490 ) ( ON ?auto_24485 ?auto_24488 ) ( not ( = ?auto_24488 ?auto_24485 ) ) ( not ( = ?auto_24488 ?auto_24486 ) ) ( TRUCK-AT ?auto_24490 ?auto_24491 ) ( not ( = ?auto_24491 ?auto_24489 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24490 ?auto_24491 ?auto_24489 )
      ( MAKE-2CRATE ?auto_24488 ?auto_24485 ?auto_24486 )
      ( MAKE-1CRATE-VERIFY ?auto_24485 ?auto_24486 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24492 - SURFACE
      ?auto_24493 - SURFACE
      ?auto_24494 - SURFACE
    )
    :vars
    (
      ?auto_24497 - HOIST
      ?auto_24496 - PLACE
      ?auto_24498 - TRUCK
      ?auto_24495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24497 ?auto_24496 ) ( SURFACE-AT ?auto_24493 ?auto_24496 ) ( CLEAR ?auto_24493 ) ( IS-CRATE ?auto_24494 ) ( not ( = ?auto_24493 ?auto_24494 ) ) ( AVAILABLE ?auto_24497 ) ( IN ?auto_24494 ?auto_24498 ) ( ON ?auto_24493 ?auto_24492 ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( not ( = ?auto_24492 ?auto_24494 ) ) ( TRUCK-AT ?auto_24498 ?auto_24495 ) ( not ( = ?auto_24495 ?auto_24496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24493 ?auto_24494 )
      ( MAKE-2CRATE-VERIFY ?auto_24492 ?auto_24493 ?auto_24494 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24499 - SURFACE
      ?auto_24500 - SURFACE
      ?auto_24501 - SURFACE
      ?auto_24502 - SURFACE
    )
    :vars
    (
      ?auto_24506 - HOIST
      ?auto_24505 - PLACE
      ?auto_24503 - TRUCK
      ?auto_24504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24506 ?auto_24505 ) ( SURFACE-AT ?auto_24501 ?auto_24505 ) ( CLEAR ?auto_24501 ) ( IS-CRATE ?auto_24502 ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( AVAILABLE ?auto_24506 ) ( IN ?auto_24502 ?auto_24503 ) ( ON ?auto_24501 ?auto_24500 ) ( not ( = ?auto_24500 ?auto_24501 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( TRUCK-AT ?auto_24503 ?auto_24504 ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( ON ?auto_24500 ?auto_24499 ) ( not ( = ?auto_24499 ?auto_24500 ) ) ( not ( = ?auto_24499 ?auto_24501 ) ) ( not ( = ?auto_24499 ?auto_24502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24500 ?auto_24501 ?auto_24502 )
      ( MAKE-3CRATE-VERIFY ?auto_24499 ?auto_24500 ?auto_24501 ?auto_24502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24507 - SURFACE
      ?auto_24508 - SURFACE
    )
    :vars
    (
      ?auto_24513 - HOIST
      ?auto_24511 - PLACE
      ?auto_24512 - SURFACE
      ?auto_24509 - TRUCK
      ?auto_24510 - PLACE
      ?auto_24514 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24513 ?auto_24511 ) ( SURFACE-AT ?auto_24507 ?auto_24511 ) ( CLEAR ?auto_24507 ) ( IS-CRATE ?auto_24508 ) ( not ( = ?auto_24507 ?auto_24508 ) ) ( AVAILABLE ?auto_24513 ) ( ON ?auto_24507 ?auto_24512 ) ( not ( = ?auto_24512 ?auto_24507 ) ) ( not ( = ?auto_24512 ?auto_24508 ) ) ( TRUCK-AT ?auto_24509 ?auto_24510 ) ( not ( = ?auto_24510 ?auto_24511 ) ) ( HOIST-AT ?auto_24514 ?auto_24510 ) ( LIFTING ?auto_24514 ?auto_24508 ) ( not ( = ?auto_24513 ?auto_24514 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24514 ?auto_24508 ?auto_24509 ?auto_24510 )
      ( MAKE-2CRATE ?auto_24512 ?auto_24507 ?auto_24508 )
      ( MAKE-1CRATE-VERIFY ?auto_24507 ?auto_24508 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24515 - SURFACE
      ?auto_24516 - SURFACE
      ?auto_24517 - SURFACE
    )
    :vars
    (
      ?auto_24518 - HOIST
      ?auto_24519 - PLACE
      ?auto_24522 - TRUCK
      ?auto_24520 - PLACE
      ?auto_24521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24518 ?auto_24519 ) ( SURFACE-AT ?auto_24516 ?auto_24519 ) ( CLEAR ?auto_24516 ) ( IS-CRATE ?auto_24517 ) ( not ( = ?auto_24516 ?auto_24517 ) ) ( AVAILABLE ?auto_24518 ) ( ON ?auto_24516 ?auto_24515 ) ( not ( = ?auto_24515 ?auto_24516 ) ) ( not ( = ?auto_24515 ?auto_24517 ) ) ( TRUCK-AT ?auto_24522 ?auto_24520 ) ( not ( = ?auto_24520 ?auto_24519 ) ) ( HOIST-AT ?auto_24521 ?auto_24520 ) ( LIFTING ?auto_24521 ?auto_24517 ) ( not ( = ?auto_24518 ?auto_24521 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24516 ?auto_24517 )
      ( MAKE-2CRATE-VERIFY ?auto_24515 ?auto_24516 ?auto_24517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24523 - SURFACE
      ?auto_24524 - SURFACE
      ?auto_24525 - SURFACE
      ?auto_24526 - SURFACE
    )
    :vars
    (
      ?auto_24527 - HOIST
      ?auto_24528 - PLACE
      ?auto_24529 - TRUCK
      ?auto_24531 - PLACE
      ?auto_24530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24527 ?auto_24528 ) ( SURFACE-AT ?auto_24525 ?auto_24528 ) ( CLEAR ?auto_24525 ) ( IS-CRATE ?auto_24526 ) ( not ( = ?auto_24525 ?auto_24526 ) ) ( AVAILABLE ?auto_24527 ) ( ON ?auto_24525 ?auto_24524 ) ( not ( = ?auto_24524 ?auto_24525 ) ) ( not ( = ?auto_24524 ?auto_24526 ) ) ( TRUCK-AT ?auto_24529 ?auto_24531 ) ( not ( = ?auto_24531 ?auto_24528 ) ) ( HOIST-AT ?auto_24530 ?auto_24531 ) ( LIFTING ?auto_24530 ?auto_24526 ) ( not ( = ?auto_24527 ?auto_24530 ) ) ( ON ?auto_24524 ?auto_24523 ) ( not ( = ?auto_24523 ?auto_24524 ) ) ( not ( = ?auto_24523 ?auto_24525 ) ) ( not ( = ?auto_24523 ?auto_24526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24524 ?auto_24525 ?auto_24526 )
      ( MAKE-3CRATE-VERIFY ?auto_24523 ?auto_24524 ?auto_24525 ?auto_24526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24532 - SURFACE
      ?auto_24533 - SURFACE
    )
    :vars
    (
      ?auto_24535 - HOIST
      ?auto_24536 - PLACE
      ?auto_24534 - SURFACE
      ?auto_24537 - TRUCK
      ?auto_24539 - PLACE
      ?auto_24538 - HOIST
      ?auto_24540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24535 ?auto_24536 ) ( SURFACE-AT ?auto_24532 ?auto_24536 ) ( CLEAR ?auto_24532 ) ( IS-CRATE ?auto_24533 ) ( not ( = ?auto_24532 ?auto_24533 ) ) ( AVAILABLE ?auto_24535 ) ( ON ?auto_24532 ?auto_24534 ) ( not ( = ?auto_24534 ?auto_24532 ) ) ( not ( = ?auto_24534 ?auto_24533 ) ) ( TRUCK-AT ?auto_24537 ?auto_24539 ) ( not ( = ?auto_24539 ?auto_24536 ) ) ( HOIST-AT ?auto_24538 ?auto_24539 ) ( not ( = ?auto_24535 ?auto_24538 ) ) ( AVAILABLE ?auto_24538 ) ( SURFACE-AT ?auto_24533 ?auto_24539 ) ( ON ?auto_24533 ?auto_24540 ) ( CLEAR ?auto_24533 ) ( not ( = ?auto_24532 ?auto_24540 ) ) ( not ( = ?auto_24533 ?auto_24540 ) ) ( not ( = ?auto_24534 ?auto_24540 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24538 ?auto_24533 ?auto_24540 ?auto_24539 )
      ( MAKE-2CRATE ?auto_24534 ?auto_24532 ?auto_24533 )
      ( MAKE-1CRATE-VERIFY ?auto_24532 ?auto_24533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24541 - SURFACE
      ?auto_24542 - SURFACE
      ?auto_24543 - SURFACE
    )
    :vars
    (
      ?auto_24544 - HOIST
      ?auto_24549 - PLACE
      ?auto_24546 - TRUCK
      ?auto_24545 - PLACE
      ?auto_24548 - HOIST
      ?auto_24547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24544 ?auto_24549 ) ( SURFACE-AT ?auto_24542 ?auto_24549 ) ( CLEAR ?auto_24542 ) ( IS-CRATE ?auto_24543 ) ( not ( = ?auto_24542 ?auto_24543 ) ) ( AVAILABLE ?auto_24544 ) ( ON ?auto_24542 ?auto_24541 ) ( not ( = ?auto_24541 ?auto_24542 ) ) ( not ( = ?auto_24541 ?auto_24543 ) ) ( TRUCK-AT ?auto_24546 ?auto_24545 ) ( not ( = ?auto_24545 ?auto_24549 ) ) ( HOIST-AT ?auto_24548 ?auto_24545 ) ( not ( = ?auto_24544 ?auto_24548 ) ) ( AVAILABLE ?auto_24548 ) ( SURFACE-AT ?auto_24543 ?auto_24545 ) ( ON ?auto_24543 ?auto_24547 ) ( CLEAR ?auto_24543 ) ( not ( = ?auto_24542 ?auto_24547 ) ) ( not ( = ?auto_24543 ?auto_24547 ) ) ( not ( = ?auto_24541 ?auto_24547 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24542 ?auto_24543 )
      ( MAKE-2CRATE-VERIFY ?auto_24541 ?auto_24542 ?auto_24543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24550 - SURFACE
      ?auto_24551 - SURFACE
      ?auto_24552 - SURFACE
      ?auto_24553 - SURFACE
    )
    :vars
    (
      ?auto_24559 - HOIST
      ?auto_24555 - PLACE
      ?auto_24554 - TRUCK
      ?auto_24558 - PLACE
      ?auto_24557 - HOIST
      ?auto_24556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24559 ?auto_24555 ) ( SURFACE-AT ?auto_24552 ?auto_24555 ) ( CLEAR ?auto_24552 ) ( IS-CRATE ?auto_24553 ) ( not ( = ?auto_24552 ?auto_24553 ) ) ( AVAILABLE ?auto_24559 ) ( ON ?auto_24552 ?auto_24551 ) ( not ( = ?auto_24551 ?auto_24552 ) ) ( not ( = ?auto_24551 ?auto_24553 ) ) ( TRUCK-AT ?auto_24554 ?auto_24558 ) ( not ( = ?auto_24558 ?auto_24555 ) ) ( HOIST-AT ?auto_24557 ?auto_24558 ) ( not ( = ?auto_24559 ?auto_24557 ) ) ( AVAILABLE ?auto_24557 ) ( SURFACE-AT ?auto_24553 ?auto_24558 ) ( ON ?auto_24553 ?auto_24556 ) ( CLEAR ?auto_24553 ) ( not ( = ?auto_24552 ?auto_24556 ) ) ( not ( = ?auto_24553 ?auto_24556 ) ) ( not ( = ?auto_24551 ?auto_24556 ) ) ( ON ?auto_24551 ?auto_24550 ) ( not ( = ?auto_24550 ?auto_24551 ) ) ( not ( = ?auto_24550 ?auto_24552 ) ) ( not ( = ?auto_24550 ?auto_24553 ) ) ( not ( = ?auto_24550 ?auto_24556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24551 ?auto_24552 ?auto_24553 )
      ( MAKE-3CRATE-VERIFY ?auto_24550 ?auto_24551 ?auto_24552 ?auto_24553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24560 - SURFACE
      ?auto_24561 - SURFACE
    )
    :vars
    (
      ?auto_24568 - HOIST
      ?auto_24564 - PLACE
      ?auto_24562 - SURFACE
      ?auto_24567 - PLACE
      ?auto_24566 - HOIST
      ?auto_24565 - SURFACE
      ?auto_24563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24568 ?auto_24564 ) ( SURFACE-AT ?auto_24560 ?auto_24564 ) ( CLEAR ?auto_24560 ) ( IS-CRATE ?auto_24561 ) ( not ( = ?auto_24560 ?auto_24561 ) ) ( AVAILABLE ?auto_24568 ) ( ON ?auto_24560 ?auto_24562 ) ( not ( = ?auto_24562 ?auto_24560 ) ) ( not ( = ?auto_24562 ?auto_24561 ) ) ( not ( = ?auto_24567 ?auto_24564 ) ) ( HOIST-AT ?auto_24566 ?auto_24567 ) ( not ( = ?auto_24568 ?auto_24566 ) ) ( AVAILABLE ?auto_24566 ) ( SURFACE-AT ?auto_24561 ?auto_24567 ) ( ON ?auto_24561 ?auto_24565 ) ( CLEAR ?auto_24561 ) ( not ( = ?auto_24560 ?auto_24565 ) ) ( not ( = ?auto_24561 ?auto_24565 ) ) ( not ( = ?auto_24562 ?auto_24565 ) ) ( TRUCK-AT ?auto_24563 ?auto_24564 ) )
    :subtasks
    ( ( !DRIVE ?auto_24563 ?auto_24564 ?auto_24567 )
      ( MAKE-2CRATE ?auto_24562 ?auto_24560 ?auto_24561 )
      ( MAKE-1CRATE-VERIFY ?auto_24560 ?auto_24561 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24569 - SURFACE
      ?auto_24570 - SURFACE
      ?auto_24571 - SURFACE
    )
    :vars
    (
      ?auto_24573 - HOIST
      ?auto_24574 - PLACE
      ?auto_24572 - PLACE
      ?auto_24575 - HOIST
      ?auto_24577 - SURFACE
      ?auto_24576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24573 ?auto_24574 ) ( SURFACE-AT ?auto_24570 ?auto_24574 ) ( CLEAR ?auto_24570 ) ( IS-CRATE ?auto_24571 ) ( not ( = ?auto_24570 ?auto_24571 ) ) ( AVAILABLE ?auto_24573 ) ( ON ?auto_24570 ?auto_24569 ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( not ( = ?auto_24569 ?auto_24571 ) ) ( not ( = ?auto_24572 ?auto_24574 ) ) ( HOIST-AT ?auto_24575 ?auto_24572 ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( AVAILABLE ?auto_24575 ) ( SURFACE-AT ?auto_24571 ?auto_24572 ) ( ON ?auto_24571 ?auto_24577 ) ( CLEAR ?auto_24571 ) ( not ( = ?auto_24570 ?auto_24577 ) ) ( not ( = ?auto_24571 ?auto_24577 ) ) ( not ( = ?auto_24569 ?auto_24577 ) ) ( TRUCK-AT ?auto_24576 ?auto_24574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24570 ?auto_24571 )
      ( MAKE-2CRATE-VERIFY ?auto_24569 ?auto_24570 ?auto_24571 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24578 - SURFACE
      ?auto_24579 - SURFACE
      ?auto_24580 - SURFACE
      ?auto_24581 - SURFACE
    )
    :vars
    (
      ?auto_24585 - HOIST
      ?auto_24583 - PLACE
      ?auto_24582 - PLACE
      ?auto_24586 - HOIST
      ?auto_24584 - SURFACE
      ?auto_24587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24585 ?auto_24583 ) ( SURFACE-AT ?auto_24580 ?auto_24583 ) ( CLEAR ?auto_24580 ) ( IS-CRATE ?auto_24581 ) ( not ( = ?auto_24580 ?auto_24581 ) ) ( AVAILABLE ?auto_24585 ) ( ON ?auto_24580 ?auto_24579 ) ( not ( = ?auto_24579 ?auto_24580 ) ) ( not ( = ?auto_24579 ?auto_24581 ) ) ( not ( = ?auto_24582 ?auto_24583 ) ) ( HOIST-AT ?auto_24586 ?auto_24582 ) ( not ( = ?auto_24585 ?auto_24586 ) ) ( AVAILABLE ?auto_24586 ) ( SURFACE-AT ?auto_24581 ?auto_24582 ) ( ON ?auto_24581 ?auto_24584 ) ( CLEAR ?auto_24581 ) ( not ( = ?auto_24580 ?auto_24584 ) ) ( not ( = ?auto_24581 ?auto_24584 ) ) ( not ( = ?auto_24579 ?auto_24584 ) ) ( TRUCK-AT ?auto_24587 ?auto_24583 ) ( ON ?auto_24579 ?auto_24578 ) ( not ( = ?auto_24578 ?auto_24579 ) ) ( not ( = ?auto_24578 ?auto_24580 ) ) ( not ( = ?auto_24578 ?auto_24581 ) ) ( not ( = ?auto_24578 ?auto_24584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24579 ?auto_24580 ?auto_24581 )
      ( MAKE-3CRATE-VERIFY ?auto_24578 ?auto_24579 ?auto_24580 ?auto_24581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24588 - SURFACE
      ?auto_24589 - SURFACE
    )
    :vars
    (
      ?auto_24594 - HOIST
      ?auto_24591 - PLACE
      ?auto_24592 - SURFACE
      ?auto_24590 - PLACE
      ?auto_24595 - HOIST
      ?auto_24593 - SURFACE
      ?auto_24596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24594 ?auto_24591 ) ( IS-CRATE ?auto_24589 ) ( not ( = ?auto_24588 ?auto_24589 ) ) ( not ( = ?auto_24592 ?auto_24588 ) ) ( not ( = ?auto_24592 ?auto_24589 ) ) ( not ( = ?auto_24590 ?auto_24591 ) ) ( HOIST-AT ?auto_24595 ?auto_24590 ) ( not ( = ?auto_24594 ?auto_24595 ) ) ( AVAILABLE ?auto_24595 ) ( SURFACE-AT ?auto_24589 ?auto_24590 ) ( ON ?auto_24589 ?auto_24593 ) ( CLEAR ?auto_24589 ) ( not ( = ?auto_24588 ?auto_24593 ) ) ( not ( = ?auto_24589 ?auto_24593 ) ) ( not ( = ?auto_24592 ?auto_24593 ) ) ( TRUCK-AT ?auto_24596 ?auto_24591 ) ( SURFACE-AT ?auto_24592 ?auto_24591 ) ( CLEAR ?auto_24592 ) ( LIFTING ?auto_24594 ?auto_24588 ) ( IS-CRATE ?auto_24588 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24592 ?auto_24588 )
      ( MAKE-2CRATE ?auto_24592 ?auto_24588 ?auto_24589 )
      ( MAKE-1CRATE-VERIFY ?auto_24588 ?auto_24589 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24597 - SURFACE
      ?auto_24598 - SURFACE
      ?auto_24599 - SURFACE
    )
    :vars
    (
      ?auto_24604 - HOIST
      ?auto_24600 - PLACE
      ?auto_24603 - PLACE
      ?auto_24602 - HOIST
      ?auto_24605 - SURFACE
      ?auto_24601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24604 ?auto_24600 ) ( IS-CRATE ?auto_24599 ) ( not ( = ?auto_24598 ?auto_24599 ) ) ( not ( = ?auto_24597 ?auto_24598 ) ) ( not ( = ?auto_24597 ?auto_24599 ) ) ( not ( = ?auto_24603 ?auto_24600 ) ) ( HOIST-AT ?auto_24602 ?auto_24603 ) ( not ( = ?auto_24604 ?auto_24602 ) ) ( AVAILABLE ?auto_24602 ) ( SURFACE-AT ?auto_24599 ?auto_24603 ) ( ON ?auto_24599 ?auto_24605 ) ( CLEAR ?auto_24599 ) ( not ( = ?auto_24598 ?auto_24605 ) ) ( not ( = ?auto_24599 ?auto_24605 ) ) ( not ( = ?auto_24597 ?auto_24605 ) ) ( TRUCK-AT ?auto_24601 ?auto_24600 ) ( SURFACE-AT ?auto_24597 ?auto_24600 ) ( CLEAR ?auto_24597 ) ( LIFTING ?auto_24604 ?auto_24598 ) ( IS-CRATE ?auto_24598 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24598 ?auto_24599 )
      ( MAKE-2CRATE-VERIFY ?auto_24597 ?auto_24598 ?auto_24599 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24606 - SURFACE
      ?auto_24607 - SURFACE
      ?auto_24608 - SURFACE
      ?auto_24609 - SURFACE
    )
    :vars
    (
      ?auto_24613 - HOIST
      ?auto_24611 - PLACE
      ?auto_24612 - PLACE
      ?auto_24615 - HOIST
      ?auto_24614 - SURFACE
      ?auto_24610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24613 ?auto_24611 ) ( IS-CRATE ?auto_24609 ) ( not ( = ?auto_24608 ?auto_24609 ) ) ( not ( = ?auto_24607 ?auto_24608 ) ) ( not ( = ?auto_24607 ?auto_24609 ) ) ( not ( = ?auto_24612 ?auto_24611 ) ) ( HOIST-AT ?auto_24615 ?auto_24612 ) ( not ( = ?auto_24613 ?auto_24615 ) ) ( AVAILABLE ?auto_24615 ) ( SURFACE-AT ?auto_24609 ?auto_24612 ) ( ON ?auto_24609 ?auto_24614 ) ( CLEAR ?auto_24609 ) ( not ( = ?auto_24608 ?auto_24614 ) ) ( not ( = ?auto_24609 ?auto_24614 ) ) ( not ( = ?auto_24607 ?auto_24614 ) ) ( TRUCK-AT ?auto_24610 ?auto_24611 ) ( SURFACE-AT ?auto_24607 ?auto_24611 ) ( CLEAR ?auto_24607 ) ( LIFTING ?auto_24613 ?auto_24608 ) ( IS-CRATE ?auto_24608 ) ( ON ?auto_24607 ?auto_24606 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( not ( = ?auto_24606 ?auto_24608 ) ) ( not ( = ?auto_24606 ?auto_24609 ) ) ( not ( = ?auto_24606 ?auto_24614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24607 ?auto_24608 ?auto_24609 )
      ( MAKE-3CRATE-VERIFY ?auto_24606 ?auto_24607 ?auto_24608 ?auto_24609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24616 - SURFACE
      ?auto_24617 - SURFACE
    )
    :vars
    (
      ?auto_24622 - HOIST
      ?auto_24620 - PLACE
      ?auto_24618 - SURFACE
      ?auto_24621 - PLACE
      ?auto_24624 - HOIST
      ?auto_24623 - SURFACE
      ?auto_24619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24622 ?auto_24620 ) ( IS-CRATE ?auto_24617 ) ( not ( = ?auto_24616 ?auto_24617 ) ) ( not ( = ?auto_24618 ?auto_24616 ) ) ( not ( = ?auto_24618 ?auto_24617 ) ) ( not ( = ?auto_24621 ?auto_24620 ) ) ( HOIST-AT ?auto_24624 ?auto_24621 ) ( not ( = ?auto_24622 ?auto_24624 ) ) ( AVAILABLE ?auto_24624 ) ( SURFACE-AT ?auto_24617 ?auto_24621 ) ( ON ?auto_24617 ?auto_24623 ) ( CLEAR ?auto_24617 ) ( not ( = ?auto_24616 ?auto_24623 ) ) ( not ( = ?auto_24617 ?auto_24623 ) ) ( not ( = ?auto_24618 ?auto_24623 ) ) ( TRUCK-AT ?auto_24619 ?auto_24620 ) ( SURFACE-AT ?auto_24618 ?auto_24620 ) ( CLEAR ?auto_24618 ) ( IS-CRATE ?auto_24616 ) ( AVAILABLE ?auto_24622 ) ( IN ?auto_24616 ?auto_24619 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24622 ?auto_24616 ?auto_24619 ?auto_24620 )
      ( MAKE-2CRATE ?auto_24618 ?auto_24616 ?auto_24617 )
      ( MAKE-1CRATE-VERIFY ?auto_24616 ?auto_24617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24625 - SURFACE
      ?auto_24626 - SURFACE
      ?auto_24627 - SURFACE
    )
    :vars
    (
      ?auto_24632 - HOIST
      ?auto_24629 - PLACE
      ?auto_24630 - PLACE
      ?auto_24628 - HOIST
      ?auto_24631 - SURFACE
      ?auto_24633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24632 ?auto_24629 ) ( IS-CRATE ?auto_24627 ) ( not ( = ?auto_24626 ?auto_24627 ) ) ( not ( = ?auto_24625 ?auto_24626 ) ) ( not ( = ?auto_24625 ?auto_24627 ) ) ( not ( = ?auto_24630 ?auto_24629 ) ) ( HOIST-AT ?auto_24628 ?auto_24630 ) ( not ( = ?auto_24632 ?auto_24628 ) ) ( AVAILABLE ?auto_24628 ) ( SURFACE-AT ?auto_24627 ?auto_24630 ) ( ON ?auto_24627 ?auto_24631 ) ( CLEAR ?auto_24627 ) ( not ( = ?auto_24626 ?auto_24631 ) ) ( not ( = ?auto_24627 ?auto_24631 ) ) ( not ( = ?auto_24625 ?auto_24631 ) ) ( TRUCK-AT ?auto_24633 ?auto_24629 ) ( SURFACE-AT ?auto_24625 ?auto_24629 ) ( CLEAR ?auto_24625 ) ( IS-CRATE ?auto_24626 ) ( AVAILABLE ?auto_24632 ) ( IN ?auto_24626 ?auto_24633 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24626 ?auto_24627 )
      ( MAKE-2CRATE-VERIFY ?auto_24625 ?auto_24626 ?auto_24627 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24634 - SURFACE
      ?auto_24635 - SURFACE
      ?auto_24636 - SURFACE
      ?auto_24637 - SURFACE
    )
    :vars
    (
      ?auto_24638 - HOIST
      ?auto_24640 - PLACE
      ?auto_24643 - PLACE
      ?auto_24639 - HOIST
      ?auto_24641 - SURFACE
      ?auto_24642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24638 ?auto_24640 ) ( IS-CRATE ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24637 ) ) ( not ( = ?auto_24635 ?auto_24636 ) ) ( not ( = ?auto_24635 ?auto_24637 ) ) ( not ( = ?auto_24643 ?auto_24640 ) ) ( HOIST-AT ?auto_24639 ?auto_24643 ) ( not ( = ?auto_24638 ?auto_24639 ) ) ( AVAILABLE ?auto_24639 ) ( SURFACE-AT ?auto_24637 ?auto_24643 ) ( ON ?auto_24637 ?auto_24641 ) ( CLEAR ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24641 ) ) ( not ( = ?auto_24637 ?auto_24641 ) ) ( not ( = ?auto_24635 ?auto_24641 ) ) ( TRUCK-AT ?auto_24642 ?auto_24640 ) ( SURFACE-AT ?auto_24635 ?auto_24640 ) ( CLEAR ?auto_24635 ) ( IS-CRATE ?auto_24636 ) ( AVAILABLE ?auto_24638 ) ( IN ?auto_24636 ?auto_24642 ) ( ON ?auto_24635 ?auto_24634 ) ( not ( = ?auto_24634 ?auto_24635 ) ) ( not ( = ?auto_24634 ?auto_24636 ) ) ( not ( = ?auto_24634 ?auto_24637 ) ) ( not ( = ?auto_24634 ?auto_24641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24635 ?auto_24636 ?auto_24637 )
      ( MAKE-3CRATE-VERIFY ?auto_24634 ?auto_24635 ?auto_24636 ?auto_24637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24644 - SURFACE
      ?auto_24645 - SURFACE
    )
    :vars
    (
      ?auto_24646 - HOIST
      ?auto_24648 - PLACE
      ?auto_24651 - SURFACE
      ?auto_24652 - PLACE
      ?auto_24647 - HOIST
      ?auto_24649 - SURFACE
      ?auto_24650 - TRUCK
      ?auto_24653 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24646 ?auto_24648 ) ( IS-CRATE ?auto_24645 ) ( not ( = ?auto_24644 ?auto_24645 ) ) ( not ( = ?auto_24651 ?auto_24644 ) ) ( not ( = ?auto_24651 ?auto_24645 ) ) ( not ( = ?auto_24652 ?auto_24648 ) ) ( HOIST-AT ?auto_24647 ?auto_24652 ) ( not ( = ?auto_24646 ?auto_24647 ) ) ( AVAILABLE ?auto_24647 ) ( SURFACE-AT ?auto_24645 ?auto_24652 ) ( ON ?auto_24645 ?auto_24649 ) ( CLEAR ?auto_24645 ) ( not ( = ?auto_24644 ?auto_24649 ) ) ( not ( = ?auto_24645 ?auto_24649 ) ) ( not ( = ?auto_24651 ?auto_24649 ) ) ( SURFACE-AT ?auto_24651 ?auto_24648 ) ( CLEAR ?auto_24651 ) ( IS-CRATE ?auto_24644 ) ( AVAILABLE ?auto_24646 ) ( IN ?auto_24644 ?auto_24650 ) ( TRUCK-AT ?auto_24650 ?auto_24653 ) ( not ( = ?auto_24653 ?auto_24648 ) ) ( not ( = ?auto_24652 ?auto_24653 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24650 ?auto_24653 ?auto_24648 )
      ( MAKE-2CRATE ?auto_24651 ?auto_24644 ?auto_24645 )
      ( MAKE-1CRATE-VERIFY ?auto_24644 ?auto_24645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24654 - SURFACE
      ?auto_24655 - SURFACE
      ?auto_24656 - SURFACE
    )
    :vars
    (
      ?auto_24658 - HOIST
      ?auto_24663 - PLACE
      ?auto_24661 - PLACE
      ?auto_24660 - HOIST
      ?auto_24659 - SURFACE
      ?auto_24657 - TRUCK
      ?auto_24662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24658 ?auto_24663 ) ( IS-CRATE ?auto_24656 ) ( not ( = ?auto_24655 ?auto_24656 ) ) ( not ( = ?auto_24654 ?auto_24655 ) ) ( not ( = ?auto_24654 ?auto_24656 ) ) ( not ( = ?auto_24661 ?auto_24663 ) ) ( HOIST-AT ?auto_24660 ?auto_24661 ) ( not ( = ?auto_24658 ?auto_24660 ) ) ( AVAILABLE ?auto_24660 ) ( SURFACE-AT ?auto_24656 ?auto_24661 ) ( ON ?auto_24656 ?auto_24659 ) ( CLEAR ?auto_24656 ) ( not ( = ?auto_24655 ?auto_24659 ) ) ( not ( = ?auto_24656 ?auto_24659 ) ) ( not ( = ?auto_24654 ?auto_24659 ) ) ( SURFACE-AT ?auto_24654 ?auto_24663 ) ( CLEAR ?auto_24654 ) ( IS-CRATE ?auto_24655 ) ( AVAILABLE ?auto_24658 ) ( IN ?auto_24655 ?auto_24657 ) ( TRUCK-AT ?auto_24657 ?auto_24662 ) ( not ( = ?auto_24662 ?auto_24663 ) ) ( not ( = ?auto_24661 ?auto_24662 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24655 ?auto_24656 )
      ( MAKE-2CRATE-VERIFY ?auto_24654 ?auto_24655 ?auto_24656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24664 - SURFACE
      ?auto_24665 - SURFACE
      ?auto_24666 - SURFACE
      ?auto_24667 - SURFACE
    )
    :vars
    (
      ?auto_24673 - HOIST
      ?auto_24670 - PLACE
      ?auto_24672 - PLACE
      ?auto_24674 - HOIST
      ?auto_24671 - SURFACE
      ?auto_24669 - TRUCK
      ?auto_24668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24673 ?auto_24670 ) ( IS-CRATE ?auto_24667 ) ( not ( = ?auto_24666 ?auto_24667 ) ) ( not ( = ?auto_24665 ?auto_24666 ) ) ( not ( = ?auto_24665 ?auto_24667 ) ) ( not ( = ?auto_24672 ?auto_24670 ) ) ( HOIST-AT ?auto_24674 ?auto_24672 ) ( not ( = ?auto_24673 ?auto_24674 ) ) ( AVAILABLE ?auto_24674 ) ( SURFACE-AT ?auto_24667 ?auto_24672 ) ( ON ?auto_24667 ?auto_24671 ) ( CLEAR ?auto_24667 ) ( not ( = ?auto_24666 ?auto_24671 ) ) ( not ( = ?auto_24667 ?auto_24671 ) ) ( not ( = ?auto_24665 ?auto_24671 ) ) ( SURFACE-AT ?auto_24665 ?auto_24670 ) ( CLEAR ?auto_24665 ) ( IS-CRATE ?auto_24666 ) ( AVAILABLE ?auto_24673 ) ( IN ?auto_24666 ?auto_24669 ) ( TRUCK-AT ?auto_24669 ?auto_24668 ) ( not ( = ?auto_24668 ?auto_24670 ) ) ( not ( = ?auto_24672 ?auto_24668 ) ) ( ON ?auto_24665 ?auto_24664 ) ( not ( = ?auto_24664 ?auto_24665 ) ) ( not ( = ?auto_24664 ?auto_24666 ) ) ( not ( = ?auto_24664 ?auto_24667 ) ) ( not ( = ?auto_24664 ?auto_24671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24665 ?auto_24666 ?auto_24667 )
      ( MAKE-3CRATE-VERIFY ?auto_24664 ?auto_24665 ?auto_24666 ?auto_24667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24675 - SURFACE
      ?auto_24676 - SURFACE
    )
    :vars
    (
      ?auto_24682 - HOIST
      ?auto_24679 - PLACE
      ?auto_24683 - SURFACE
      ?auto_24681 - PLACE
      ?auto_24684 - HOIST
      ?auto_24680 - SURFACE
      ?auto_24678 - TRUCK
      ?auto_24677 - PLACE
      ?auto_24685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24682 ?auto_24679 ) ( IS-CRATE ?auto_24676 ) ( not ( = ?auto_24675 ?auto_24676 ) ) ( not ( = ?auto_24683 ?auto_24675 ) ) ( not ( = ?auto_24683 ?auto_24676 ) ) ( not ( = ?auto_24681 ?auto_24679 ) ) ( HOIST-AT ?auto_24684 ?auto_24681 ) ( not ( = ?auto_24682 ?auto_24684 ) ) ( AVAILABLE ?auto_24684 ) ( SURFACE-AT ?auto_24676 ?auto_24681 ) ( ON ?auto_24676 ?auto_24680 ) ( CLEAR ?auto_24676 ) ( not ( = ?auto_24675 ?auto_24680 ) ) ( not ( = ?auto_24676 ?auto_24680 ) ) ( not ( = ?auto_24683 ?auto_24680 ) ) ( SURFACE-AT ?auto_24683 ?auto_24679 ) ( CLEAR ?auto_24683 ) ( IS-CRATE ?auto_24675 ) ( AVAILABLE ?auto_24682 ) ( TRUCK-AT ?auto_24678 ?auto_24677 ) ( not ( = ?auto_24677 ?auto_24679 ) ) ( not ( = ?auto_24681 ?auto_24677 ) ) ( HOIST-AT ?auto_24685 ?auto_24677 ) ( LIFTING ?auto_24685 ?auto_24675 ) ( not ( = ?auto_24682 ?auto_24685 ) ) ( not ( = ?auto_24684 ?auto_24685 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24685 ?auto_24675 ?auto_24678 ?auto_24677 )
      ( MAKE-2CRATE ?auto_24683 ?auto_24675 ?auto_24676 )
      ( MAKE-1CRATE-VERIFY ?auto_24675 ?auto_24676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24686 - SURFACE
      ?auto_24687 - SURFACE
      ?auto_24688 - SURFACE
    )
    :vars
    (
      ?auto_24695 - HOIST
      ?auto_24691 - PLACE
      ?auto_24692 - PLACE
      ?auto_24696 - HOIST
      ?auto_24694 - SURFACE
      ?auto_24693 - TRUCK
      ?auto_24689 - PLACE
      ?auto_24690 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24695 ?auto_24691 ) ( IS-CRATE ?auto_24688 ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24692 ?auto_24691 ) ) ( HOIST-AT ?auto_24696 ?auto_24692 ) ( not ( = ?auto_24695 ?auto_24696 ) ) ( AVAILABLE ?auto_24696 ) ( SURFACE-AT ?auto_24688 ?auto_24692 ) ( ON ?auto_24688 ?auto_24694 ) ( CLEAR ?auto_24688 ) ( not ( = ?auto_24687 ?auto_24694 ) ) ( not ( = ?auto_24688 ?auto_24694 ) ) ( not ( = ?auto_24686 ?auto_24694 ) ) ( SURFACE-AT ?auto_24686 ?auto_24691 ) ( CLEAR ?auto_24686 ) ( IS-CRATE ?auto_24687 ) ( AVAILABLE ?auto_24695 ) ( TRUCK-AT ?auto_24693 ?auto_24689 ) ( not ( = ?auto_24689 ?auto_24691 ) ) ( not ( = ?auto_24692 ?auto_24689 ) ) ( HOIST-AT ?auto_24690 ?auto_24689 ) ( LIFTING ?auto_24690 ?auto_24687 ) ( not ( = ?auto_24695 ?auto_24690 ) ) ( not ( = ?auto_24696 ?auto_24690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24687 ?auto_24688 )
      ( MAKE-2CRATE-VERIFY ?auto_24686 ?auto_24687 ?auto_24688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24697 - SURFACE
      ?auto_24698 - SURFACE
      ?auto_24699 - SURFACE
      ?auto_24700 - SURFACE
    )
    :vars
    (
      ?auto_24704 - HOIST
      ?auto_24705 - PLACE
      ?auto_24702 - PLACE
      ?auto_24706 - HOIST
      ?auto_24703 - SURFACE
      ?auto_24708 - TRUCK
      ?auto_24701 - PLACE
      ?auto_24707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24704 ?auto_24705 ) ( IS-CRATE ?auto_24700 ) ( not ( = ?auto_24699 ?auto_24700 ) ) ( not ( = ?auto_24698 ?auto_24699 ) ) ( not ( = ?auto_24698 ?auto_24700 ) ) ( not ( = ?auto_24702 ?auto_24705 ) ) ( HOIST-AT ?auto_24706 ?auto_24702 ) ( not ( = ?auto_24704 ?auto_24706 ) ) ( AVAILABLE ?auto_24706 ) ( SURFACE-AT ?auto_24700 ?auto_24702 ) ( ON ?auto_24700 ?auto_24703 ) ( CLEAR ?auto_24700 ) ( not ( = ?auto_24699 ?auto_24703 ) ) ( not ( = ?auto_24700 ?auto_24703 ) ) ( not ( = ?auto_24698 ?auto_24703 ) ) ( SURFACE-AT ?auto_24698 ?auto_24705 ) ( CLEAR ?auto_24698 ) ( IS-CRATE ?auto_24699 ) ( AVAILABLE ?auto_24704 ) ( TRUCK-AT ?auto_24708 ?auto_24701 ) ( not ( = ?auto_24701 ?auto_24705 ) ) ( not ( = ?auto_24702 ?auto_24701 ) ) ( HOIST-AT ?auto_24707 ?auto_24701 ) ( LIFTING ?auto_24707 ?auto_24699 ) ( not ( = ?auto_24704 ?auto_24707 ) ) ( not ( = ?auto_24706 ?auto_24707 ) ) ( ON ?auto_24698 ?auto_24697 ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24697 ?auto_24699 ) ) ( not ( = ?auto_24697 ?auto_24700 ) ) ( not ( = ?auto_24697 ?auto_24703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24698 ?auto_24699 ?auto_24700 )
      ( MAKE-3CRATE-VERIFY ?auto_24697 ?auto_24698 ?auto_24699 ?auto_24700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24709 - SURFACE
      ?auto_24710 - SURFACE
    )
    :vars
    (
      ?auto_24715 - HOIST
      ?auto_24716 - PLACE
      ?auto_24714 - SURFACE
      ?auto_24712 - PLACE
      ?auto_24717 - HOIST
      ?auto_24713 - SURFACE
      ?auto_24719 - TRUCK
      ?auto_24711 - PLACE
      ?auto_24718 - HOIST
      ?auto_24720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24715 ?auto_24716 ) ( IS-CRATE ?auto_24710 ) ( not ( = ?auto_24709 ?auto_24710 ) ) ( not ( = ?auto_24714 ?auto_24709 ) ) ( not ( = ?auto_24714 ?auto_24710 ) ) ( not ( = ?auto_24712 ?auto_24716 ) ) ( HOIST-AT ?auto_24717 ?auto_24712 ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( AVAILABLE ?auto_24717 ) ( SURFACE-AT ?auto_24710 ?auto_24712 ) ( ON ?auto_24710 ?auto_24713 ) ( CLEAR ?auto_24710 ) ( not ( = ?auto_24709 ?auto_24713 ) ) ( not ( = ?auto_24710 ?auto_24713 ) ) ( not ( = ?auto_24714 ?auto_24713 ) ) ( SURFACE-AT ?auto_24714 ?auto_24716 ) ( CLEAR ?auto_24714 ) ( IS-CRATE ?auto_24709 ) ( AVAILABLE ?auto_24715 ) ( TRUCK-AT ?auto_24719 ?auto_24711 ) ( not ( = ?auto_24711 ?auto_24716 ) ) ( not ( = ?auto_24712 ?auto_24711 ) ) ( HOIST-AT ?auto_24718 ?auto_24711 ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( AVAILABLE ?auto_24718 ) ( SURFACE-AT ?auto_24709 ?auto_24711 ) ( ON ?auto_24709 ?auto_24720 ) ( CLEAR ?auto_24709 ) ( not ( = ?auto_24709 ?auto_24720 ) ) ( not ( = ?auto_24710 ?auto_24720 ) ) ( not ( = ?auto_24714 ?auto_24720 ) ) ( not ( = ?auto_24713 ?auto_24720 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24718 ?auto_24709 ?auto_24720 ?auto_24711 )
      ( MAKE-2CRATE ?auto_24714 ?auto_24709 ?auto_24710 )
      ( MAKE-1CRATE-VERIFY ?auto_24709 ?auto_24710 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24721 - SURFACE
      ?auto_24722 - SURFACE
      ?auto_24723 - SURFACE
    )
    :vars
    (
      ?auto_24726 - HOIST
      ?auto_24728 - PLACE
      ?auto_24724 - PLACE
      ?auto_24731 - HOIST
      ?auto_24729 - SURFACE
      ?auto_24730 - TRUCK
      ?auto_24732 - PLACE
      ?auto_24725 - HOIST
      ?auto_24727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24726 ?auto_24728 ) ( IS-CRATE ?auto_24723 ) ( not ( = ?auto_24722 ?auto_24723 ) ) ( not ( = ?auto_24721 ?auto_24722 ) ) ( not ( = ?auto_24721 ?auto_24723 ) ) ( not ( = ?auto_24724 ?auto_24728 ) ) ( HOIST-AT ?auto_24731 ?auto_24724 ) ( not ( = ?auto_24726 ?auto_24731 ) ) ( AVAILABLE ?auto_24731 ) ( SURFACE-AT ?auto_24723 ?auto_24724 ) ( ON ?auto_24723 ?auto_24729 ) ( CLEAR ?auto_24723 ) ( not ( = ?auto_24722 ?auto_24729 ) ) ( not ( = ?auto_24723 ?auto_24729 ) ) ( not ( = ?auto_24721 ?auto_24729 ) ) ( SURFACE-AT ?auto_24721 ?auto_24728 ) ( CLEAR ?auto_24721 ) ( IS-CRATE ?auto_24722 ) ( AVAILABLE ?auto_24726 ) ( TRUCK-AT ?auto_24730 ?auto_24732 ) ( not ( = ?auto_24732 ?auto_24728 ) ) ( not ( = ?auto_24724 ?auto_24732 ) ) ( HOIST-AT ?auto_24725 ?auto_24732 ) ( not ( = ?auto_24726 ?auto_24725 ) ) ( not ( = ?auto_24731 ?auto_24725 ) ) ( AVAILABLE ?auto_24725 ) ( SURFACE-AT ?auto_24722 ?auto_24732 ) ( ON ?auto_24722 ?auto_24727 ) ( CLEAR ?auto_24722 ) ( not ( = ?auto_24722 ?auto_24727 ) ) ( not ( = ?auto_24723 ?auto_24727 ) ) ( not ( = ?auto_24721 ?auto_24727 ) ) ( not ( = ?auto_24729 ?auto_24727 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24722 ?auto_24723 )
      ( MAKE-2CRATE-VERIFY ?auto_24721 ?auto_24722 ?auto_24723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24733 - SURFACE
      ?auto_24734 - SURFACE
      ?auto_24735 - SURFACE
      ?auto_24736 - SURFACE
    )
    :vars
    (
      ?auto_24742 - HOIST
      ?auto_24738 - PLACE
      ?auto_24741 - PLACE
      ?auto_24740 - HOIST
      ?auto_24737 - SURFACE
      ?auto_24745 - TRUCK
      ?auto_24743 - PLACE
      ?auto_24744 - HOIST
      ?auto_24739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24742 ?auto_24738 ) ( IS-CRATE ?auto_24736 ) ( not ( = ?auto_24735 ?auto_24736 ) ) ( not ( = ?auto_24734 ?auto_24735 ) ) ( not ( = ?auto_24734 ?auto_24736 ) ) ( not ( = ?auto_24741 ?auto_24738 ) ) ( HOIST-AT ?auto_24740 ?auto_24741 ) ( not ( = ?auto_24742 ?auto_24740 ) ) ( AVAILABLE ?auto_24740 ) ( SURFACE-AT ?auto_24736 ?auto_24741 ) ( ON ?auto_24736 ?auto_24737 ) ( CLEAR ?auto_24736 ) ( not ( = ?auto_24735 ?auto_24737 ) ) ( not ( = ?auto_24736 ?auto_24737 ) ) ( not ( = ?auto_24734 ?auto_24737 ) ) ( SURFACE-AT ?auto_24734 ?auto_24738 ) ( CLEAR ?auto_24734 ) ( IS-CRATE ?auto_24735 ) ( AVAILABLE ?auto_24742 ) ( TRUCK-AT ?auto_24745 ?auto_24743 ) ( not ( = ?auto_24743 ?auto_24738 ) ) ( not ( = ?auto_24741 ?auto_24743 ) ) ( HOIST-AT ?auto_24744 ?auto_24743 ) ( not ( = ?auto_24742 ?auto_24744 ) ) ( not ( = ?auto_24740 ?auto_24744 ) ) ( AVAILABLE ?auto_24744 ) ( SURFACE-AT ?auto_24735 ?auto_24743 ) ( ON ?auto_24735 ?auto_24739 ) ( CLEAR ?auto_24735 ) ( not ( = ?auto_24735 ?auto_24739 ) ) ( not ( = ?auto_24736 ?auto_24739 ) ) ( not ( = ?auto_24734 ?auto_24739 ) ) ( not ( = ?auto_24737 ?auto_24739 ) ) ( ON ?auto_24734 ?auto_24733 ) ( not ( = ?auto_24733 ?auto_24734 ) ) ( not ( = ?auto_24733 ?auto_24735 ) ) ( not ( = ?auto_24733 ?auto_24736 ) ) ( not ( = ?auto_24733 ?auto_24737 ) ) ( not ( = ?auto_24733 ?auto_24739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24734 ?auto_24735 ?auto_24736 )
      ( MAKE-3CRATE-VERIFY ?auto_24733 ?auto_24734 ?auto_24735 ?auto_24736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24746 - SURFACE
      ?auto_24747 - SURFACE
    )
    :vars
    (
      ?auto_24753 - HOIST
      ?auto_24749 - PLACE
      ?auto_24754 - SURFACE
      ?auto_24752 - PLACE
      ?auto_24751 - HOIST
      ?auto_24748 - SURFACE
      ?auto_24755 - PLACE
      ?auto_24756 - HOIST
      ?auto_24750 - SURFACE
      ?auto_24757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24753 ?auto_24749 ) ( IS-CRATE ?auto_24747 ) ( not ( = ?auto_24746 ?auto_24747 ) ) ( not ( = ?auto_24754 ?auto_24746 ) ) ( not ( = ?auto_24754 ?auto_24747 ) ) ( not ( = ?auto_24752 ?auto_24749 ) ) ( HOIST-AT ?auto_24751 ?auto_24752 ) ( not ( = ?auto_24753 ?auto_24751 ) ) ( AVAILABLE ?auto_24751 ) ( SURFACE-AT ?auto_24747 ?auto_24752 ) ( ON ?auto_24747 ?auto_24748 ) ( CLEAR ?auto_24747 ) ( not ( = ?auto_24746 ?auto_24748 ) ) ( not ( = ?auto_24747 ?auto_24748 ) ) ( not ( = ?auto_24754 ?auto_24748 ) ) ( SURFACE-AT ?auto_24754 ?auto_24749 ) ( CLEAR ?auto_24754 ) ( IS-CRATE ?auto_24746 ) ( AVAILABLE ?auto_24753 ) ( not ( = ?auto_24755 ?auto_24749 ) ) ( not ( = ?auto_24752 ?auto_24755 ) ) ( HOIST-AT ?auto_24756 ?auto_24755 ) ( not ( = ?auto_24753 ?auto_24756 ) ) ( not ( = ?auto_24751 ?auto_24756 ) ) ( AVAILABLE ?auto_24756 ) ( SURFACE-AT ?auto_24746 ?auto_24755 ) ( ON ?auto_24746 ?auto_24750 ) ( CLEAR ?auto_24746 ) ( not ( = ?auto_24746 ?auto_24750 ) ) ( not ( = ?auto_24747 ?auto_24750 ) ) ( not ( = ?auto_24754 ?auto_24750 ) ) ( not ( = ?auto_24748 ?auto_24750 ) ) ( TRUCK-AT ?auto_24757 ?auto_24749 ) )
    :subtasks
    ( ( !DRIVE ?auto_24757 ?auto_24749 ?auto_24755 )
      ( MAKE-2CRATE ?auto_24754 ?auto_24746 ?auto_24747 )
      ( MAKE-1CRATE-VERIFY ?auto_24746 ?auto_24747 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24758 - SURFACE
      ?auto_24759 - SURFACE
      ?auto_24760 - SURFACE
    )
    :vars
    (
      ?auto_24769 - HOIST
      ?auto_24767 - PLACE
      ?auto_24763 - PLACE
      ?auto_24768 - HOIST
      ?auto_24762 - SURFACE
      ?auto_24765 - PLACE
      ?auto_24766 - HOIST
      ?auto_24764 - SURFACE
      ?auto_24761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24769 ?auto_24767 ) ( IS-CRATE ?auto_24760 ) ( not ( = ?auto_24759 ?auto_24760 ) ) ( not ( = ?auto_24758 ?auto_24759 ) ) ( not ( = ?auto_24758 ?auto_24760 ) ) ( not ( = ?auto_24763 ?auto_24767 ) ) ( HOIST-AT ?auto_24768 ?auto_24763 ) ( not ( = ?auto_24769 ?auto_24768 ) ) ( AVAILABLE ?auto_24768 ) ( SURFACE-AT ?auto_24760 ?auto_24763 ) ( ON ?auto_24760 ?auto_24762 ) ( CLEAR ?auto_24760 ) ( not ( = ?auto_24759 ?auto_24762 ) ) ( not ( = ?auto_24760 ?auto_24762 ) ) ( not ( = ?auto_24758 ?auto_24762 ) ) ( SURFACE-AT ?auto_24758 ?auto_24767 ) ( CLEAR ?auto_24758 ) ( IS-CRATE ?auto_24759 ) ( AVAILABLE ?auto_24769 ) ( not ( = ?auto_24765 ?auto_24767 ) ) ( not ( = ?auto_24763 ?auto_24765 ) ) ( HOIST-AT ?auto_24766 ?auto_24765 ) ( not ( = ?auto_24769 ?auto_24766 ) ) ( not ( = ?auto_24768 ?auto_24766 ) ) ( AVAILABLE ?auto_24766 ) ( SURFACE-AT ?auto_24759 ?auto_24765 ) ( ON ?auto_24759 ?auto_24764 ) ( CLEAR ?auto_24759 ) ( not ( = ?auto_24759 ?auto_24764 ) ) ( not ( = ?auto_24760 ?auto_24764 ) ) ( not ( = ?auto_24758 ?auto_24764 ) ) ( not ( = ?auto_24762 ?auto_24764 ) ) ( TRUCK-AT ?auto_24761 ?auto_24767 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24759 ?auto_24760 )
      ( MAKE-2CRATE-VERIFY ?auto_24758 ?auto_24759 ?auto_24760 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24770 - SURFACE
      ?auto_24771 - SURFACE
      ?auto_24772 - SURFACE
      ?auto_24773 - SURFACE
    )
    :vars
    (
      ?auto_24777 - HOIST
      ?auto_24782 - PLACE
      ?auto_24778 - PLACE
      ?auto_24774 - HOIST
      ?auto_24781 - SURFACE
      ?auto_24775 - PLACE
      ?auto_24779 - HOIST
      ?auto_24776 - SURFACE
      ?auto_24780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24777 ?auto_24782 ) ( IS-CRATE ?auto_24773 ) ( not ( = ?auto_24772 ?auto_24773 ) ) ( not ( = ?auto_24771 ?auto_24772 ) ) ( not ( = ?auto_24771 ?auto_24773 ) ) ( not ( = ?auto_24778 ?auto_24782 ) ) ( HOIST-AT ?auto_24774 ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24774 ) ) ( AVAILABLE ?auto_24774 ) ( SURFACE-AT ?auto_24773 ?auto_24778 ) ( ON ?auto_24773 ?auto_24781 ) ( CLEAR ?auto_24773 ) ( not ( = ?auto_24772 ?auto_24781 ) ) ( not ( = ?auto_24773 ?auto_24781 ) ) ( not ( = ?auto_24771 ?auto_24781 ) ) ( SURFACE-AT ?auto_24771 ?auto_24782 ) ( CLEAR ?auto_24771 ) ( IS-CRATE ?auto_24772 ) ( AVAILABLE ?auto_24777 ) ( not ( = ?auto_24775 ?auto_24782 ) ) ( not ( = ?auto_24778 ?auto_24775 ) ) ( HOIST-AT ?auto_24779 ?auto_24775 ) ( not ( = ?auto_24777 ?auto_24779 ) ) ( not ( = ?auto_24774 ?auto_24779 ) ) ( AVAILABLE ?auto_24779 ) ( SURFACE-AT ?auto_24772 ?auto_24775 ) ( ON ?auto_24772 ?auto_24776 ) ( CLEAR ?auto_24772 ) ( not ( = ?auto_24772 ?auto_24776 ) ) ( not ( = ?auto_24773 ?auto_24776 ) ) ( not ( = ?auto_24771 ?auto_24776 ) ) ( not ( = ?auto_24781 ?auto_24776 ) ) ( TRUCK-AT ?auto_24780 ?auto_24782 ) ( ON ?auto_24771 ?auto_24770 ) ( not ( = ?auto_24770 ?auto_24771 ) ) ( not ( = ?auto_24770 ?auto_24772 ) ) ( not ( = ?auto_24770 ?auto_24773 ) ) ( not ( = ?auto_24770 ?auto_24781 ) ) ( not ( = ?auto_24770 ?auto_24776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24771 ?auto_24772 ?auto_24773 )
      ( MAKE-3CRATE-VERIFY ?auto_24770 ?auto_24771 ?auto_24772 ?auto_24773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24783 - SURFACE
      ?auto_24784 - SURFACE
    )
    :vars
    (
      ?auto_24788 - HOIST
      ?auto_24794 - PLACE
      ?auto_24791 - SURFACE
      ?auto_24789 - PLACE
      ?auto_24785 - HOIST
      ?auto_24793 - SURFACE
      ?auto_24786 - PLACE
      ?auto_24790 - HOIST
      ?auto_24787 - SURFACE
      ?auto_24792 - TRUCK
      ?auto_24795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24788 ?auto_24794 ) ( IS-CRATE ?auto_24784 ) ( not ( = ?auto_24783 ?auto_24784 ) ) ( not ( = ?auto_24791 ?auto_24783 ) ) ( not ( = ?auto_24791 ?auto_24784 ) ) ( not ( = ?auto_24789 ?auto_24794 ) ) ( HOIST-AT ?auto_24785 ?auto_24789 ) ( not ( = ?auto_24788 ?auto_24785 ) ) ( AVAILABLE ?auto_24785 ) ( SURFACE-AT ?auto_24784 ?auto_24789 ) ( ON ?auto_24784 ?auto_24793 ) ( CLEAR ?auto_24784 ) ( not ( = ?auto_24783 ?auto_24793 ) ) ( not ( = ?auto_24784 ?auto_24793 ) ) ( not ( = ?auto_24791 ?auto_24793 ) ) ( IS-CRATE ?auto_24783 ) ( not ( = ?auto_24786 ?auto_24794 ) ) ( not ( = ?auto_24789 ?auto_24786 ) ) ( HOIST-AT ?auto_24790 ?auto_24786 ) ( not ( = ?auto_24788 ?auto_24790 ) ) ( not ( = ?auto_24785 ?auto_24790 ) ) ( AVAILABLE ?auto_24790 ) ( SURFACE-AT ?auto_24783 ?auto_24786 ) ( ON ?auto_24783 ?auto_24787 ) ( CLEAR ?auto_24783 ) ( not ( = ?auto_24783 ?auto_24787 ) ) ( not ( = ?auto_24784 ?auto_24787 ) ) ( not ( = ?auto_24791 ?auto_24787 ) ) ( not ( = ?auto_24793 ?auto_24787 ) ) ( TRUCK-AT ?auto_24792 ?auto_24794 ) ( SURFACE-AT ?auto_24795 ?auto_24794 ) ( CLEAR ?auto_24795 ) ( LIFTING ?auto_24788 ?auto_24791 ) ( IS-CRATE ?auto_24791 ) ( not ( = ?auto_24795 ?auto_24791 ) ) ( not ( = ?auto_24783 ?auto_24795 ) ) ( not ( = ?auto_24784 ?auto_24795 ) ) ( not ( = ?auto_24793 ?auto_24795 ) ) ( not ( = ?auto_24787 ?auto_24795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24795 ?auto_24791 )
      ( MAKE-2CRATE ?auto_24791 ?auto_24783 ?auto_24784 )
      ( MAKE-1CRATE-VERIFY ?auto_24783 ?auto_24784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24796 - SURFACE
      ?auto_24797 - SURFACE
      ?auto_24798 - SURFACE
    )
    :vars
    (
      ?auto_24802 - HOIST
      ?auto_24803 - PLACE
      ?auto_24799 - PLACE
      ?auto_24801 - HOIST
      ?auto_24806 - SURFACE
      ?auto_24805 - PLACE
      ?auto_24808 - HOIST
      ?auto_24800 - SURFACE
      ?auto_24807 - TRUCK
      ?auto_24804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24802 ?auto_24803 ) ( IS-CRATE ?auto_24798 ) ( not ( = ?auto_24797 ?auto_24798 ) ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( not ( = ?auto_24796 ?auto_24798 ) ) ( not ( = ?auto_24799 ?auto_24803 ) ) ( HOIST-AT ?auto_24801 ?auto_24799 ) ( not ( = ?auto_24802 ?auto_24801 ) ) ( AVAILABLE ?auto_24801 ) ( SURFACE-AT ?auto_24798 ?auto_24799 ) ( ON ?auto_24798 ?auto_24806 ) ( CLEAR ?auto_24798 ) ( not ( = ?auto_24797 ?auto_24806 ) ) ( not ( = ?auto_24798 ?auto_24806 ) ) ( not ( = ?auto_24796 ?auto_24806 ) ) ( IS-CRATE ?auto_24797 ) ( not ( = ?auto_24805 ?auto_24803 ) ) ( not ( = ?auto_24799 ?auto_24805 ) ) ( HOIST-AT ?auto_24808 ?auto_24805 ) ( not ( = ?auto_24802 ?auto_24808 ) ) ( not ( = ?auto_24801 ?auto_24808 ) ) ( AVAILABLE ?auto_24808 ) ( SURFACE-AT ?auto_24797 ?auto_24805 ) ( ON ?auto_24797 ?auto_24800 ) ( CLEAR ?auto_24797 ) ( not ( = ?auto_24797 ?auto_24800 ) ) ( not ( = ?auto_24798 ?auto_24800 ) ) ( not ( = ?auto_24796 ?auto_24800 ) ) ( not ( = ?auto_24806 ?auto_24800 ) ) ( TRUCK-AT ?auto_24807 ?auto_24803 ) ( SURFACE-AT ?auto_24804 ?auto_24803 ) ( CLEAR ?auto_24804 ) ( LIFTING ?auto_24802 ?auto_24796 ) ( IS-CRATE ?auto_24796 ) ( not ( = ?auto_24804 ?auto_24796 ) ) ( not ( = ?auto_24797 ?auto_24804 ) ) ( not ( = ?auto_24798 ?auto_24804 ) ) ( not ( = ?auto_24806 ?auto_24804 ) ) ( not ( = ?auto_24800 ?auto_24804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24797 ?auto_24798 )
      ( MAKE-2CRATE-VERIFY ?auto_24796 ?auto_24797 ?auto_24798 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24809 - SURFACE
      ?auto_24810 - SURFACE
      ?auto_24811 - SURFACE
      ?auto_24812 - SURFACE
    )
    :vars
    (
      ?auto_24813 - HOIST
      ?auto_24819 - PLACE
      ?auto_24816 - PLACE
      ?auto_24815 - HOIST
      ?auto_24817 - SURFACE
      ?auto_24821 - PLACE
      ?auto_24818 - HOIST
      ?auto_24820 - SURFACE
      ?auto_24814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24813 ?auto_24819 ) ( IS-CRATE ?auto_24812 ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( not ( = ?auto_24816 ?auto_24819 ) ) ( HOIST-AT ?auto_24815 ?auto_24816 ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( AVAILABLE ?auto_24815 ) ( SURFACE-AT ?auto_24812 ?auto_24816 ) ( ON ?auto_24812 ?auto_24817 ) ( CLEAR ?auto_24812 ) ( not ( = ?auto_24811 ?auto_24817 ) ) ( not ( = ?auto_24812 ?auto_24817 ) ) ( not ( = ?auto_24810 ?auto_24817 ) ) ( IS-CRATE ?auto_24811 ) ( not ( = ?auto_24821 ?auto_24819 ) ) ( not ( = ?auto_24816 ?auto_24821 ) ) ( HOIST-AT ?auto_24818 ?auto_24821 ) ( not ( = ?auto_24813 ?auto_24818 ) ) ( not ( = ?auto_24815 ?auto_24818 ) ) ( AVAILABLE ?auto_24818 ) ( SURFACE-AT ?auto_24811 ?auto_24821 ) ( ON ?auto_24811 ?auto_24820 ) ( CLEAR ?auto_24811 ) ( not ( = ?auto_24811 ?auto_24820 ) ) ( not ( = ?auto_24812 ?auto_24820 ) ) ( not ( = ?auto_24810 ?auto_24820 ) ) ( not ( = ?auto_24817 ?auto_24820 ) ) ( TRUCK-AT ?auto_24814 ?auto_24819 ) ( SURFACE-AT ?auto_24809 ?auto_24819 ) ( CLEAR ?auto_24809 ) ( LIFTING ?auto_24813 ?auto_24810 ) ( IS-CRATE ?auto_24810 ) ( not ( = ?auto_24809 ?auto_24810 ) ) ( not ( = ?auto_24811 ?auto_24809 ) ) ( not ( = ?auto_24812 ?auto_24809 ) ) ( not ( = ?auto_24817 ?auto_24809 ) ) ( not ( = ?auto_24820 ?auto_24809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24810 ?auto_24811 ?auto_24812 )
      ( MAKE-3CRATE-VERIFY ?auto_24809 ?auto_24810 ?auto_24811 ?auto_24812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24822 - SURFACE
      ?auto_24823 - SURFACE
    )
    :vars
    (
      ?auto_24824 - HOIST
      ?auto_24832 - PLACE
      ?auto_24830 - SURFACE
      ?auto_24828 - PLACE
      ?auto_24827 - HOIST
      ?auto_24829 - SURFACE
      ?auto_24834 - PLACE
      ?auto_24831 - HOIST
      ?auto_24833 - SURFACE
      ?auto_24826 - TRUCK
      ?auto_24825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24824 ?auto_24832 ) ( IS-CRATE ?auto_24823 ) ( not ( = ?auto_24822 ?auto_24823 ) ) ( not ( = ?auto_24830 ?auto_24822 ) ) ( not ( = ?auto_24830 ?auto_24823 ) ) ( not ( = ?auto_24828 ?auto_24832 ) ) ( HOIST-AT ?auto_24827 ?auto_24828 ) ( not ( = ?auto_24824 ?auto_24827 ) ) ( AVAILABLE ?auto_24827 ) ( SURFACE-AT ?auto_24823 ?auto_24828 ) ( ON ?auto_24823 ?auto_24829 ) ( CLEAR ?auto_24823 ) ( not ( = ?auto_24822 ?auto_24829 ) ) ( not ( = ?auto_24823 ?auto_24829 ) ) ( not ( = ?auto_24830 ?auto_24829 ) ) ( IS-CRATE ?auto_24822 ) ( not ( = ?auto_24834 ?auto_24832 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( HOIST-AT ?auto_24831 ?auto_24834 ) ( not ( = ?auto_24824 ?auto_24831 ) ) ( not ( = ?auto_24827 ?auto_24831 ) ) ( AVAILABLE ?auto_24831 ) ( SURFACE-AT ?auto_24822 ?auto_24834 ) ( ON ?auto_24822 ?auto_24833 ) ( CLEAR ?auto_24822 ) ( not ( = ?auto_24822 ?auto_24833 ) ) ( not ( = ?auto_24823 ?auto_24833 ) ) ( not ( = ?auto_24830 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( TRUCK-AT ?auto_24826 ?auto_24832 ) ( SURFACE-AT ?auto_24825 ?auto_24832 ) ( CLEAR ?auto_24825 ) ( IS-CRATE ?auto_24830 ) ( not ( = ?auto_24825 ?auto_24830 ) ) ( not ( = ?auto_24822 ?auto_24825 ) ) ( not ( = ?auto_24823 ?auto_24825 ) ) ( not ( = ?auto_24829 ?auto_24825 ) ) ( not ( = ?auto_24833 ?auto_24825 ) ) ( AVAILABLE ?auto_24824 ) ( IN ?auto_24830 ?auto_24826 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24824 ?auto_24830 ?auto_24826 ?auto_24832 )
      ( MAKE-2CRATE ?auto_24830 ?auto_24822 ?auto_24823 )
      ( MAKE-1CRATE-VERIFY ?auto_24822 ?auto_24823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24835 - SURFACE
      ?auto_24836 - SURFACE
      ?auto_24837 - SURFACE
    )
    :vars
    (
      ?auto_24840 - HOIST
      ?auto_24838 - PLACE
      ?auto_24839 - PLACE
      ?auto_24847 - HOIST
      ?auto_24844 - SURFACE
      ?auto_24841 - PLACE
      ?auto_24843 - HOIST
      ?auto_24845 - SURFACE
      ?auto_24842 - TRUCK
      ?auto_24846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24840 ?auto_24838 ) ( IS-CRATE ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24837 ) ) ( not ( = ?auto_24839 ?auto_24838 ) ) ( HOIST-AT ?auto_24847 ?auto_24839 ) ( not ( = ?auto_24840 ?auto_24847 ) ) ( AVAILABLE ?auto_24847 ) ( SURFACE-AT ?auto_24837 ?auto_24839 ) ( ON ?auto_24837 ?auto_24844 ) ( CLEAR ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24844 ) ) ( not ( = ?auto_24837 ?auto_24844 ) ) ( not ( = ?auto_24835 ?auto_24844 ) ) ( IS-CRATE ?auto_24836 ) ( not ( = ?auto_24841 ?auto_24838 ) ) ( not ( = ?auto_24839 ?auto_24841 ) ) ( HOIST-AT ?auto_24843 ?auto_24841 ) ( not ( = ?auto_24840 ?auto_24843 ) ) ( not ( = ?auto_24847 ?auto_24843 ) ) ( AVAILABLE ?auto_24843 ) ( SURFACE-AT ?auto_24836 ?auto_24841 ) ( ON ?auto_24836 ?auto_24845 ) ( CLEAR ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24845 ) ) ( not ( = ?auto_24837 ?auto_24845 ) ) ( not ( = ?auto_24835 ?auto_24845 ) ) ( not ( = ?auto_24844 ?auto_24845 ) ) ( TRUCK-AT ?auto_24842 ?auto_24838 ) ( SURFACE-AT ?auto_24846 ?auto_24838 ) ( CLEAR ?auto_24846 ) ( IS-CRATE ?auto_24835 ) ( not ( = ?auto_24846 ?auto_24835 ) ) ( not ( = ?auto_24836 ?auto_24846 ) ) ( not ( = ?auto_24837 ?auto_24846 ) ) ( not ( = ?auto_24844 ?auto_24846 ) ) ( not ( = ?auto_24845 ?auto_24846 ) ) ( AVAILABLE ?auto_24840 ) ( IN ?auto_24835 ?auto_24842 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24836 ?auto_24837 )
      ( MAKE-2CRATE-VERIFY ?auto_24835 ?auto_24836 ?auto_24837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24848 - SURFACE
      ?auto_24849 - SURFACE
      ?auto_24850 - SURFACE
      ?auto_24851 - SURFACE
    )
    :vars
    (
      ?auto_24854 - HOIST
      ?auto_24858 - PLACE
      ?auto_24856 - PLACE
      ?auto_24852 - HOIST
      ?auto_24859 - SURFACE
      ?auto_24857 - PLACE
      ?auto_24860 - HOIST
      ?auto_24855 - SURFACE
      ?auto_24853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24854 ?auto_24858 ) ( IS-CRATE ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24849 ?auto_24850 ) ) ( not ( = ?auto_24849 ?auto_24851 ) ) ( not ( = ?auto_24856 ?auto_24858 ) ) ( HOIST-AT ?auto_24852 ?auto_24856 ) ( not ( = ?auto_24854 ?auto_24852 ) ) ( AVAILABLE ?auto_24852 ) ( SURFACE-AT ?auto_24851 ?auto_24856 ) ( ON ?auto_24851 ?auto_24859 ) ( CLEAR ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24859 ) ) ( not ( = ?auto_24851 ?auto_24859 ) ) ( not ( = ?auto_24849 ?auto_24859 ) ) ( IS-CRATE ?auto_24850 ) ( not ( = ?auto_24857 ?auto_24858 ) ) ( not ( = ?auto_24856 ?auto_24857 ) ) ( HOIST-AT ?auto_24860 ?auto_24857 ) ( not ( = ?auto_24854 ?auto_24860 ) ) ( not ( = ?auto_24852 ?auto_24860 ) ) ( AVAILABLE ?auto_24860 ) ( SURFACE-AT ?auto_24850 ?auto_24857 ) ( ON ?auto_24850 ?auto_24855 ) ( CLEAR ?auto_24850 ) ( not ( = ?auto_24850 ?auto_24855 ) ) ( not ( = ?auto_24851 ?auto_24855 ) ) ( not ( = ?auto_24849 ?auto_24855 ) ) ( not ( = ?auto_24859 ?auto_24855 ) ) ( TRUCK-AT ?auto_24853 ?auto_24858 ) ( SURFACE-AT ?auto_24848 ?auto_24858 ) ( CLEAR ?auto_24848 ) ( IS-CRATE ?auto_24849 ) ( not ( = ?auto_24848 ?auto_24849 ) ) ( not ( = ?auto_24850 ?auto_24848 ) ) ( not ( = ?auto_24851 ?auto_24848 ) ) ( not ( = ?auto_24859 ?auto_24848 ) ) ( not ( = ?auto_24855 ?auto_24848 ) ) ( AVAILABLE ?auto_24854 ) ( IN ?auto_24849 ?auto_24853 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24849 ?auto_24850 ?auto_24851 )
      ( MAKE-3CRATE-VERIFY ?auto_24848 ?auto_24849 ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24861 - SURFACE
      ?auto_24862 - SURFACE
    )
    :vars
    (
      ?auto_24865 - HOIST
      ?auto_24870 - PLACE
      ?auto_24872 - SURFACE
      ?auto_24867 - PLACE
      ?auto_24863 - HOIST
      ?auto_24871 - SURFACE
      ?auto_24869 - PLACE
      ?auto_24873 - HOIST
      ?auto_24866 - SURFACE
      ?auto_24868 - SURFACE
      ?auto_24864 - TRUCK
      ?auto_24874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24865 ?auto_24870 ) ( IS-CRATE ?auto_24862 ) ( not ( = ?auto_24861 ?auto_24862 ) ) ( not ( = ?auto_24872 ?auto_24861 ) ) ( not ( = ?auto_24872 ?auto_24862 ) ) ( not ( = ?auto_24867 ?auto_24870 ) ) ( HOIST-AT ?auto_24863 ?auto_24867 ) ( not ( = ?auto_24865 ?auto_24863 ) ) ( AVAILABLE ?auto_24863 ) ( SURFACE-AT ?auto_24862 ?auto_24867 ) ( ON ?auto_24862 ?auto_24871 ) ( CLEAR ?auto_24862 ) ( not ( = ?auto_24861 ?auto_24871 ) ) ( not ( = ?auto_24862 ?auto_24871 ) ) ( not ( = ?auto_24872 ?auto_24871 ) ) ( IS-CRATE ?auto_24861 ) ( not ( = ?auto_24869 ?auto_24870 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( HOIST-AT ?auto_24873 ?auto_24869 ) ( not ( = ?auto_24865 ?auto_24873 ) ) ( not ( = ?auto_24863 ?auto_24873 ) ) ( AVAILABLE ?auto_24873 ) ( SURFACE-AT ?auto_24861 ?auto_24869 ) ( ON ?auto_24861 ?auto_24866 ) ( CLEAR ?auto_24861 ) ( not ( = ?auto_24861 ?auto_24866 ) ) ( not ( = ?auto_24862 ?auto_24866 ) ) ( not ( = ?auto_24872 ?auto_24866 ) ) ( not ( = ?auto_24871 ?auto_24866 ) ) ( SURFACE-AT ?auto_24868 ?auto_24870 ) ( CLEAR ?auto_24868 ) ( IS-CRATE ?auto_24872 ) ( not ( = ?auto_24868 ?auto_24872 ) ) ( not ( = ?auto_24861 ?auto_24868 ) ) ( not ( = ?auto_24862 ?auto_24868 ) ) ( not ( = ?auto_24871 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( AVAILABLE ?auto_24865 ) ( IN ?auto_24872 ?auto_24864 ) ( TRUCK-AT ?auto_24864 ?auto_24874 ) ( not ( = ?auto_24874 ?auto_24870 ) ) ( not ( = ?auto_24867 ?auto_24874 ) ) ( not ( = ?auto_24869 ?auto_24874 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24864 ?auto_24874 ?auto_24870 )
      ( MAKE-2CRATE ?auto_24872 ?auto_24861 ?auto_24862 )
      ( MAKE-1CRATE-VERIFY ?auto_24861 ?auto_24862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24875 - SURFACE
      ?auto_24876 - SURFACE
      ?auto_24877 - SURFACE
    )
    :vars
    (
      ?auto_24884 - HOIST
      ?auto_24887 - PLACE
      ?auto_24883 - PLACE
      ?auto_24880 - HOIST
      ?auto_24885 - SURFACE
      ?auto_24882 - PLACE
      ?auto_24888 - HOIST
      ?auto_24878 - SURFACE
      ?auto_24881 - SURFACE
      ?auto_24886 - TRUCK
      ?auto_24879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24884 ?auto_24887 ) ( IS-CRATE ?auto_24877 ) ( not ( = ?auto_24876 ?auto_24877 ) ) ( not ( = ?auto_24875 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24877 ) ) ( not ( = ?auto_24883 ?auto_24887 ) ) ( HOIST-AT ?auto_24880 ?auto_24883 ) ( not ( = ?auto_24884 ?auto_24880 ) ) ( AVAILABLE ?auto_24880 ) ( SURFACE-AT ?auto_24877 ?auto_24883 ) ( ON ?auto_24877 ?auto_24885 ) ( CLEAR ?auto_24877 ) ( not ( = ?auto_24876 ?auto_24885 ) ) ( not ( = ?auto_24877 ?auto_24885 ) ) ( not ( = ?auto_24875 ?auto_24885 ) ) ( IS-CRATE ?auto_24876 ) ( not ( = ?auto_24882 ?auto_24887 ) ) ( not ( = ?auto_24883 ?auto_24882 ) ) ( HOIST-AT ?auto_24888 ?auto_24882 ) ( not ( = ?auto_24884 ?auto_24888 ) ) ( not ( = ?auto_24880 ?auto_24888 ) ) ( AVAILABLE ?auto_24888 ) ( SURFACE-AT ?auto_24876 ?auto_24882 ) ( ON ?auto_24876 ?auto_24878 ) ( CLEAR ?auto_24876 ) ( not ( = ?auto_24876 ?auto_24878 ) ) ( not ( = ?auto_24877 ?auto_24878 ) ) ( not ( = ?auto_24875 ?auto_24878 ) ) ( not ( = ?auto_24885 ?auto_24878 ) ) ( SURFACE-AT ?auto_24881 ?auto_24887 ) ( CLEAR ?auto_24881 ) ( IS-CRATE ?auto_24875 ) ( not ( = ?auto_24881 ?auto_24875 ) ) ( not ( = ?auto_24876 ?auto_24881 ) ) ( not ( = ?auto_24877 ?auto_24881 ) ) ( not ( = ?auto_24885 ?auto_24881 ) ) ( not ( = ?auto_24878 ?auto_24881 ) ) ( AVAILABLE ?auto_24884 ) ( IN ?auto_24875 ?auto_24886 ) ( TRUCK-AT ?auto_24886 ?auto_24879 ) ( not ( = ?auto_24879 ?auto_24887 ) ) ( not ( = ?auto_24883 ?auto_24879 ) ) ( not ( = ?auto_24882 ?auto_24879 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24876 ?auto_24877 )
      ( MAKE-2CRATE-VERIFY ?auto_24875 ?auto_24876 ?auto_24877 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24889 - SURFACE
      ?auto_24890 - SURFACE
      ?auto_24891 - SURFACE
      ?auto_24892 - SURFACE
    )
    :vars
    (
      ?auto_24898 - HOIST
      ?auto_24902 - PLACE
      ?auto_24895 - PLACE
      ?auto_24901 - HOIST
      ?auto_24900 - SURFACE
      ?auto_24896 - PLACE
      ?auto_24893 - HOIST
      ?auto_24894 - SURFACE
      ?auto_24897 - TRUCK
      ?auto_24899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24898 ?auto_24902 ) ( IS-CRATE ?auto_24892 ) ( not ( = ?auto_24891 ?auto_24892 ) ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( not ( = ?auto_24890 ?auto_24892 ) ) ( not ( = ?auto_24895 ?auto_24902 ) ) ( HOIST-AT ?auto_24901 ?auto_24895 ) ( not ( = ?auto_24898 ?auto_24901 ) ) ( AVAILABLE ?auto_24901 ) ( SURFACE-AT ?auto_24892 ?auto_24895 ) ( ON ?auto_24892 ?auto_24900 ) ( CLEAR ?auto_24892 ) ( not ( = ?auto_24891 ?auto_24900 ) ) ( not ( = ?auto_24892 ?auto_24900 ) ) ( not ( = ?auto_24890 ?auto_24900 ) ) ( IS-CRATE ?auto_24891 ) ( not ( = ?auto_24896 ?auto_24902 ) ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( HOIST-AT ?auto_24893 ?auto_24896 ) ( not ( = ?auto_24898 ?auto_24893 ) ) ( not ( = ?auto_24901 ?auto_24893 ) ) ( AVAILABLE ?auto_24893 ) ( SURFACE-AT ?auto_24891 ?auto_24896 ) ( ON ?auto_24891 ?auto_24894 ) ( CLEAR ?auto_24891 ) ( not ( = ?auto_24891 ?auto_24894 ) ) ( not ( = ?auto_24892 ?auto_24894 ) ) ( not ( = ?auto_24890 ?auto_24894 ) ) ( not ( = ?auto_24900 ?auto_24894 ) ) ( SURFACE-AT ?auto_24889 ?auto_24902 ) ( CLEAR ?auto_24889 ) ( IS-CRATE ?auto_24890 ) ( not ( = ?auto_24889 ?auto_24890 ) ) ( not ( = ?auto_24891 ?auto_24889 ) ) ( not ( = ?auto_24892 ?auto_24889 ) ) ( not ( = ?auto_24900 ?auto_24889 ) ) ( not ( = ?auto_24894 ?auto_24889 ) ) ( AVAILABLE ?auto_24898 ) ( IN ?auto_24890 ?auto_24897 ) ( TRUCK-AT ?auto_24897 ?auto_24899 ) ( not ( = ?auto_24899 ?auto_24902 ) ) ( not ( = ?auto_24895 ?auto_24899 ) ) ( not ( = ?auto_24896 ?auto_24899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24890 ?auto_24891 ?auto_24892 )
      ( MAKE-3CRATE-VERIFY ?auto_24889 ?auto_24890 ?auto_24891 ?auto_24892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24903 - SURFACE
      ?auto_24904 - SURFACE
    )
    :vars
    (
      ?auto_24912 - HOIST
      ?auto_24916 - PLACE
      ?auto_24905 - SURFACE
      ?auto_24908 - PLACE
      ?auto_24915 - HOIST
      ?auto_24914 - SURFACE
      ?auto_24909 - PLACE
      ?auto_24906 - HOIST
      ?auto_24907 - SURFACE
      ?auto_24910 - SURFACE
      ?auto_24911 - TRUCK
      ?auto_24913 - PLACE
      ?auto_24917 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24912 ?auto_24916 ) ( IS-CRATE ?auto_24904 ) ( not ( = ?auto_24903 ?auto_24904 ) ) ( not ( = ?auto_24905 ?auto_24903 ) ) ( not ( = ?auto_24905 ?auto_24904 ) ) ( not ( = ?auto_24908 ?auto_24916 ) ) ( HOIST-AT ?auto_24915 ?auto_24908 ) ( not ( = ?auto_24912 ?auto_24915 ) ) ( AVAILABLE ?auto_24915 ) ( SURFACE-AT ?auto_24904 ?auto_24908 ) ( ON ?auto_24904 ?auto_24914 ) ( CLEAR ?auto_24904 ) ( not ( = ?auto_24903 ?auto_24914 ) ) ( not ( = ?auto_24904 ?auto_24914 ) ) ( not ( = ?auto_24905 ?auto_24914 ) ) ( IS-CRATE ?auto_24903 ) ( not ( = ?auto_24909 ?auto_24916 ) ) ( not ( = ?auto_24908 ?auto_24909 ) ) ( HOIST-AT ?auto_24906 ?auto_24909 ) ( not ( = ?auto_24912 ?auto_24906 ) ) ( not ( = ?auto_24915 ?auto_24906 ) ) ( AVAILABLE ?auto_24906 ) ( SURFACE-AT ?auto_24903 ?auto_24909 ) ( ON ?auto_24903 ?auto_24907 ) ( CLEAR ?auto_24903 ) ( not ( = ?auto_24903 ?auto_24907 ) ) ( not ( = ?auto_24904 ?auto_24907 ) ) ( not ( = ?auto_24905 ?auto_24907 ) ) ( not ( = ?auto_24914 ?auto_24907 ) ) ( SURFACE-AT ?auto_24910 ?auto_24916 ) ( CLEAR ?auto_24910 ) ( IS-CRATE ?auto_24905 ) ( not ( = ?auto_24910 ?auto_24905 ) ) ( not ( = ?auto_24903 ?auto_24910 ) ) ( not ( = ?auto_24904 ?auto_24910 ) ) ( not ( = ?auto_24914 ?auto_24910 ) ) ( not ( = ?auto_24907 ?auto_24910 ) ) ( AVAILABLE ?auto_24912 ) ( TRUCK-AT ?auto_24911 ?auto_24913 ) ( not ( = ?auto_24913 ?auto_24916 ) ) ( not ( = ?auto_24908 ?auto_24913 ) ) ( not ( = ?auto_24909 ?auto_24913 ) ) ( HOIST-AT ?auto_24917 ?auto_24913 ) ( LIFTING ?auto_24917 ?auto_24905 ) ( not ( = ?auto_24912 ?auto_24917 ) ) ( not ( = ?auto_24915 ?auto_24917 ) ) ( not ( = ?auto_24906 ?auto_24917 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24917 ?auto_24905 ?auto_24911 ?auto_24913 )
      ( MAKE-2CRATE ?auto_24905 ?auto_24903 ?auto_24904 )
      ( MAKE-1CRATE-VERIFY ?auto_24903 ?auto_24904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24918 - SURFACE
      ?auto_24919 - SURFACE
      ?auto_24920 - SURFACE
    )
    :vars
    (
      ?auto_24925 - HOIST
      ?auto_24930 - PLACE
      ?auto_24926 - PLACE
      ?auto_24927 - HOIST
      ?auto_24923 - SURFACE
      ?auto_24922 - PLACE
      ?auto_24932 - HOIST
      ?auto_24928 - SURFACE
      ?auto_24931 - SURFACE
      ?auto_24921 - TRUCK
      ?auto_24929 - PLACE
      ?auto_24924 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24925 ?auto_24930 ) ( IS-CRATE ?auto_24920 ) ( not ( = ?auto_24919 ?auto_24920 ) ) ( not ( = ?auto_24918 ?auto_24919 ) ) ( not ( = ?auto_24918 ?auto_24920 ) ) ( not ( = ?auto_24926 ?auto_24930 ) ) ( HOIST-AT ?auto_24927 ?auto_24926 ) ( not ( = ?auto_24925 ?auto_24927 ) ) ( AVAILABLE ?auto_24927 ) ( SURFACE-AT ?auto_24920 ?auto_24926 ) ( ON ?auto_24920 ?auto_24923 ) ( CLEAR ?auto_24920 ) ( not ( = ?auto_24919 ?auto_24923 ) ) ( not ( = ?auto_24920 ?auto_24923 ) ) ( not ( = ?auto_24918 ?auto_24923 ) ) ( IS-CRATE ?auto_24919 ) ( not ( = ?auto_24922 ?auto_24930 ) ) ( not ( = ?auto_24926 ?auto_24922 ) ) ( HOIST-AT ?auto_24932 ?auto_24922 ) ( not ( = ?auto_24925 ?auto_24932 ) ) ( not ( = ?auto_24927 ?auto_24932 ) ) ( AVAILABLE ?auto_24932 ) ( SURFACE-AT ?auto_24919 ?auto_24922 ) ( ON ?auto_24919 ?auto_24928 ) ( CLEAR ?auto_24919 ) ( not ( = ?auto_24919 ?auto_24928 ) ) ( not ( = ?auto_24920 ?auto_24928 ) ) ( not ( = ?auto_24918 ?auto_24928 ) ) ( not ( = ?auto_24923 ?auto_24928 ) ) ( SURFACE-AT ?auto_24931 ?auto_24930 ) ( CLEAR ?auto_24931 ) ( IS-CRATE ?auto_24918 ) ( not ( = ?auto_24931 ?auto_24918 ) ) ( not ( = ?auto_24919 ?auto_24931 ) ) ( not ( = ?auto_24920 ?auto_24931 ) ) ( not ( = ?auto_24923 ?auto_24931 ) ) ( not ( = ?auto_24928 ?auto_24931 ) ) ( AVAILABLE ?auto_24925 ) ( TRUCK-AT ?auto_24921 ?auto_24929 ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24926 ?auto_24929 ) ) ( not ( = ?auto_24922 ?auto_24929 ) ) ( HOIST-AT ?auto_24924 ?auto_24929 ) ( LIFTING ?auto_24924 ?auto_24918 ) ( not ( = ?auto_24925 ?auto_24924 ) ) ( not ( = ?auto_24927 ?auto_24924 ) ) ( not ( = ?auto_24932 ?auto_24924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24919 ?auto_24920 )
      ( MAKE-2CRATE-VERIFY ?auto_24918 ?auto_24919 ?auto_24920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24933 - SURFACE
      ?auto_24934 - SURFACE
      ?auto_24935 - SURFACE
      ?auto_24936 - SURFACE
    )
    :vars
    (
      ?auto_24940 - HOIST
      ?auto_24947 - PLACE
      ?auto_24944 - PLACE
      ?auto_24937 - HOIST
      ?auto_24938 - SURFACE
      ?auto_24942 - PLACE
      ?auto_24939 - HOIST
      ?auto_24945 - SURFACE
      ?auto_24943 - TRUCK
      ?auto_24946 - PLACE
      ?auto_24941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24940 ?auto_24947 ) ( IS-CRATE ?auto_24936 ) ( not ( = ?auto_24935 ?auto_24936 ) ) ( not ( = ?auto_24934 ?auto_24935 ) ) ( not ( = ?auto_24934 ?auto_24936 ) ) ( not ( = ?auto_24944 ?auto_24947 ) ) ( HOIST-AT ?auto_24937 ?auto_24944 ) ( not ( = ?auto_24940 ?auto_24937 ) ) ( AVAILABLE ?auto_24937 ) ( SURFACE-AT ?auto_24936 ?auto_24944 ) ( ON ?auto_24936 ?auto_24938 ) ( CLEAR ?auto_24936 ) ( not ( = ?auto_24935 ?auto_24938 ) ) ( not ( = ?auto_24936 ?auto_24938 ) ) ( not ( = ?auto_24934 ?auto_24938 ) ) ( IS-CRATE ?auto_24935 ) ( not ( = ?auto_24942 ?auto_24947 ) ) ( not ( = ?auto_24944 ?auto_24942 ) ) ( HOIST-AT ?auto_24939 ?auto_24942 ) ( not ( = ?auto_24940 ?auto_24939 ) ) ( not ( = ?auto_24937 ?auto_24939 ) ) ( AVAILABLE ?auto_24939 ) ( SURFACE-AT ?auto_24935 ?auto_24942 ) ( ON ?auto_24935 ?auto_24945 ) ( CLEAR ?auto_24935 ) ( not ( = ?auto_24935 ?auto_24945 ) ) ( not ( = ?auto_24936 ?auto_24945 ) ) ( not ( = ?auto_24934 ?auto_24945 ) ) ( not ( = ?auto_24938 ?auto_24945 ) ) ( SURFACE-AT ?auto_24933 ?auto_24947 ) ( CLEAR ?auto_24933 ) ( IS-CRATE ?auto_24934 ) ( not ( = ?auto_24933 ?auto_24934 ) ) ( not ( = ?auto_24935 ?auto_24933 ) ) ( not ( = ?auto_24936 ?auto_24933 ) ) ( not ( = ?auto_24938 ?auto_24933 ) ) ( not ( = ?auto_24945 ?auto_24933 ) ) ( AVAILABLE ?auto_24940 ) ( TRUCK-AT ?auto_24943 ?auto_24946 ) ( not ( = ?auto_24946 ?auto_24947 ) ) ( not ( = ?auto_24944 ?auto_24946 ) ) ( not ( = ?auto_24942 ?auto_24946 ) ) ( HOIST-AT ?auto_24941 ?auto_24946 ) ( LIFTING ?auto_24941 ?auto_24934 ) ( not ( = ?auto_24940 ?auto_24941 ) ) ( not ( = ?auto_24937 ?auto_24941 ) ) ( not ( = ?auto_24939 ?auto_24941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24934 ?auto_24935 ?auto_24936 )
      ( MAKE-3CRATE-VERIFY ?auto_24933 ?auto_24934 ?auto_24935 ?auto_24936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24948 - SURFACE
      ?auto_24949 - SURFACE
    )
    :vars
    (
      ?auto_24954 - HOIST
      ?auto_24961 - PLACE
      ?auto_24952 - SURFACE
      ?auto_24958 - PLACE
      ?auto_24950 - HOIST
      ?auto_24951 - SURFACE
      ?auto_24956 - PLACE
      ?auto_24953 - HOIST
      ?auto_24959 - SURFACE
      ?auto_24962 - SURFACE
      ?auto_24957 - TRUCK
      ?auto_24960 - PLACE
      ?auto_24955 - HOIST
      ?auto_24963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24954 ?auto_24961 ) ( IS-CRATE ?auto_24949 ) ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24952 ?auto_24948 ) ) ( not ( = ?auto_24952 ?auto_24949 ) ) ( not ( = ?auto_24958 ?auto_24961 ) ) ( HOIST-AT ?auto_24950 ?auto_24958 ) ( not ( = ?auto_24954 ?auto_24950 ) ) ( AVAILABLE ?auto_24950 ) ( SURFACE-AT ?auto_24949 ?auto_24958 ) ( ON ?auto_24949 ?auto_24951 ) ( CLEAR ?auto_24949 ) ( not ( = ?auto_24948 ?auto_24951 ) ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( not ( = ?auto_24952 ?auto_24951 ) ) ( IS-CRATE ?auto_24948 ) ( not ( = ?auto_24956 ?auto_24961 ) ) ( not ( = ?auto_24958 ?auto_24956 ) ) ( HOIST-AT ?auto_24953 ?auto_24956 ) ( not ( = ?auto_24954 ?auto_24953 ) ) ( not ( = ?auto_24950 ?auto_24953 ) ) ( AVAILABLE ?auto_24953 ) ( SURFACE-AT ?auto_24948 ?auto_24956 ) ( ON ?auto_24948 ?auto_24959 ) ( CLEAR ?auto_24948 ) ( not ( = ?auto_24948 ?auto_24959 ) ) ( not ( = ?auto_24949 ?auto_24959 ) ) ( not ( = ?auto_24952 ?auto_24959 ) ) ( not ( = ?auto_24951 ?auto_24959 ) ) ( SURFACE-AT ?auto_24962 ?auto_24961 ) ( CLEAR ?auto_24962 ) ( IS-CRATE ?auto_24952 ) ( not ( = ?auto_24962 ?auto_24952 ) ) ( not ( = ?auto_24948 ?auto_24962 ) ) ( not ( = ?auto_24949 ?auto_24962 ) ) ( not ( = ?auto_24951 ?auto_24962 ) ) ( not ( = ?auto_24959 ?auto_24962 ) ) ( AVAILABLE ?auto_24954 ) ( TRUCK-AT ?auto_24957 ?auto_24960 ) ( not ( = ?auto_24960 ?auto_24961 ) ) ( not ( = ?auto_24958 ?auto_24960 ) ) ( not ( = ?auto_24956 ?auto_24960 ) ) ( HOIST-AT ?auto_24955 ?auto_24960 ) ( not ( = ?auto_24954 ?auto_24955 ) ) ( not ( = ?auto_24950 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( AVAILABLE ?auto_24955 ) ( SURFACE-AT ?auto_24952 ?auto_24960 ) ( ON ?auto_24952 ?auto_24963 ) ( CLEAR ?auto_24952 ) ( not ( = ?auto_24948 ?auto_24963 ) ) ( not ( = ?auto_24949 ?auto_24963 ) ) ( not ( = ?auto_24952 ?auto_24963 ) ) ( not ( = ?auto_24951 ?auto_24963 ) ) ( not ( = ?auto_24959 ?auto_24963 ) ) ( not ( = ?auto_24962 ?auto_24963 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24955 ?auto_24952 ?auto_24963 ?auto_24960 )
      ( MAKE-2CRATE ?auto_24952 ?auto_24948 ?auto_24949 )
      ( MAKE-1CRATE-VERIFY ?auto_24948 ?auto_24949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24964 - SURFACE
      ?auto_24965 - SURFACE
      ?auto_24966 - SURFACE
    )
    :vars
    (
      ?auto_24967 - HOIST
      ?auto_24977 - PLACE
      ?auto_24975 - PLACE
      ?auto_24978 - HOIST
      ?auto_24973 - SURFACE
      ?auto_24968 - PLACE
      ?auto_24972 - HOIST
      ?auto_24974 - SURFACE
      ?auto_24970 - SURFACE
      ?auto_24971 - TRUCK
      ?auto_24979 - PLACE
      ?auto_24969 - HOIST
      ?auto_24976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24967 ?auto_24977 ) ( IS-CRATE ?auto_24966 ) ( not ( = ?auto_24965 ?auto_24966 ) ) ( not ( = ?auto_24964 ?auto_24965 ) ) ( not ( = ?auto_24964 ?auto_24966 ) ) ( not ( = ?auto_24975 ?auto_24977 ) ) ( HOIST-AT ?auto_24978 ?auto_24975 ) ( not ( = ?auto_24967 ?auto_24978 ) ) ( AVAILABLE ?auto_24978 ) ( SURFACE-AT ?auto_24966 ?auto_24975 ) ( ON ?auto_24966 ?auto_24973 ) ( CLEAR ?auto_24966 ) ( not ( = ?auto_24965 ?auto_24973 ) ) ( not ( = ?auto_24966 ?auto_24973 ) ) ( not ( = ?auto_24964 ?auto_24973 ) ) ( IS-CRATE ?auto_24965 ) ( not ( = ?auto_24968 ?auto_24977 ) ) ( not ( = ?auto_24975 ?auto_24968 ) ) ( HOIST-AT ?auto_24972 ?auto_24968 ) ( not ( = ?auto_24967 ?auto_24972 ) ) ( not ( = ?auto_24978 ?auto_24972 ) ) ( AVAILABLE ?auto_24972 ) ( SURFACE-AT ?auto_24965 ?auto_24968 ) ( ON ?auto_24965 ?auto_24974 ) ( CLEAR ?auto_24965 ) ( not ( = ?auto_24965 ?auto_24974 ) ) ( not ( = ?auto_24966 ?auto_24974 ) ) ( not ( = ?auto_24964 ?auto_24974 ) ) ( not ( = ?auto_24973 ?auto_24974 ) ) ( SURFACE-AT ?auto_24970 ?auto_24977 ) ( CLEAR ?auto_24970 ) ( IS-CRATE ?auto_24964 ) ( not ( = ?auto_24970 ?auto_24964 ) ) ( not ( = ?auto_24965 ?auto_24970 ) ) ( not ( = ?auto_24966 ?auto_24970 ) ) ( not ( = ?auto_24973 ?auto_24970 ) ) ( not ( = ?auto_24974 ?auto_24970 ) ) ( AVAILABLE ?auto_24967 ) ( TRUCK-AT ?auto_24971 ?auto_24979 ) ( not ( = ?auto_24979 ?auto_24977 ) ) ( not ( = ?auto_24975 ?auto_24979 ) ) ( not ( = ?auto_24968 ?auto_24979 ) ) ( HOIST-AT ?auto_24969 ?auto_24979 ) ( not ( = ?auto_24967 ?auto_24969 ) ) ( not ( = ?auto_24978 ?auto_24969 ) ) ( not ( = ?auto_24972 ?auto_24969 ) ) ( AVAILABLE ?auto_24969 ) ( SURFACE-AT ?auto_24964 ?auto_24979 ) ( ON ?auto_24964 ?auto_24976 ) ( CLEAR ?auto_24964 ) ( not ( = ?auto_24965 ?auto_24976 ) ) ( not ( = ?auto_24966 ?auto_24976 ) ) ( not ( = ?auto_24964 ?auto_24976 ) ) ( not ( = ?auto_24973 ?auto_24976 ) ) ( not ( = ?auto_24974 ?auto_24976 ) ) ( not ( = ?auto_24970 ?auto_24976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24965 ?auto_24966 )
      ( MAKE-2CRATE-VERIFY ?auto_24964 ?auto_24965 ?auto_24966 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24980 - SURFACE
      ?auto_24981 - SURFACE
      ?auto_24982 - SURFACE
      ?auto_24983 - SURFACE
    )
    :vars
    (
      ?auto_24986 - HOIST
      ?auto_24993 - PLACE
      ?auto_24992 - PLACE
      ?auto_24988 - HOIST
      ?auto_24985 - SURFACE
      ?auto_24989 - PLACE
      ?auto_24990 - HOIST
      ?auto_24984 - SURFACE
      ?auto_24987 - TRUCK
      ?auto_24991 - PLACE
      ?auto_24995 - HOIST
      ?auto_24994 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24986 ?auto_24993 ) ( IS-CRATE ?auto_24983 ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_24981 ?auto_24982 ) ) ( not ( = ?auto_24981 ?auto_24983 ) ) ( not ( = ?auto_24992 ?auto_24993 ) ) ( HOIST-AT ?auto_24988 ?auto_24992 ) ( not ( = ?auto_24986 ?auto_24988 ) ) ( AVAILABLE ?auto_24988 ) ( SURFACE-AT ?auto_24983 ?auto_24992 ) ( ON ?auto_24983 ?auto_24985 ) ( CLEAR ?auto_24983 ) ( not ( = ?auto_24982 ?auto_24985 ) ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( not ( = ?auto_24981 ?auto_24985 ) ) ( IS-CRATE ?auto_24982 ) ( not ( = ?auto_24989 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_24989 ) ) ( HOIST-AT ?auto_24990 ?auto_24989 ) ( not ( = ?auto_24986 ?auto_24990 ) ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( AVAILABLE ?auto_24990 ) ( SURFACE-AT ?auto_24982 ?auto_24989 ) ( ON ?auto_24982 ?auto_24984 ) ( CLEAR ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( not ( = ?auto_24981 ?auto_24984 ) ) ( not ( = ?auto_24985 ?auto_24984 ) ) ( SURFACE-AT ?auto_24980 ?auto_24993 ) ( CLEAR ?auto_24980 ) ( IS-CRATE ?auto_24981 ) ( not ( = ?auto_24980 ?auto_24981 ) ) ( not ( = ?auto_24982 ?auto_24980 ) ) ( not ( = ?auto_24983 ?auto_24980 ) ) ( not ( = ?auto_24985 ?auto_24980 ) ) ( not ( = ?auto_24984 ?auto_24980 ) ) ( AVAILABLE ?auto_24986 ) ( TRUCK-AT ?auto_24987 ?auto_24991 ) ( not ( = ?auto_24991 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_24991 ) ) ( not ( = ?auto_24989 ?auto_24991 ) ) ( HOIST-AT ?auto_24995 ?auto_24991 ) ( not ( = ?auto_24986 ?auto_24995 ) ) ( not ( = ?auto_24988 ?auto_24995 ) ) ( not ( = ?auto_24990 ?auto_24995 ) ) ( AVAILABLE ?auto_24995 ) ( SURFACE-AT ?auto_24981 ?auto_24991 ) ( ON ?auto_24981 ?auto_24994 ) ( CLEAR ?auto_24981 ) ( not ( = ?auto_24982 ?auto_24994 ) ) ( not ( = ?auto_24983 ?auto_24994 ) ) ( not ( = ?auto_24981 ?auto_24994 ) ) ( not ( = ?auto_24985 ?auto_24994 ) ) ( not ( = ?auto_24984 ?auto_24994 ) ) ( not ( = ?auto_24980 ?auto_24994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24981 ?auto_24982 ?auto_24983 )
      ( MAKE-3CRATE-VERIFY ?auto_24980 ?auto_24981 ?auto_24982 ?auto_24983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24996 - SURFACE
      ?auto_24997 - SURFACE
    )
    :vars
    (
      ?auto_25001 - HOIST
      ?auto_25009 - PLACE
      ?auto_24998 - SURFACE
      ?auto_25008 - PLACE
      ?auto_25003 - HOIST
      ?auto_25000 - SURFACE
      ?auto_25004 - PLACE
      ?auto_25006 - HOIST
      ?auto_24999 - SURFACE
      ?auto_25005 - SURFACE
      ?auto_25007 - PLACE
      ?auto_25011 - HOIST
      ?auto_25010 - SURFACE
      ?auto_25002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25001 ?auto_25009 ) ( IS-CRATE ?auto_24997 ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( not ( = ?auto_24998 ?auto_24996 ) ) ( not ( = ?auto_24998 ?auto_24997 ) ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( HOIST-AT ?auto_25003 ?auto_25008 ) ( not ( = ?auto_25001 ?auto_25003 ) ) ( AVAILABLE ?auto_25003 ) ( SURFACE-AT ?auto_24997 ?auto_25008 ) ( ON ?auto_24997 ?auto_25000 ) ( CLEAR ?auto_24997 ) ( not ( = ?auto_24996 ?auto_25000 ) ) ( not ( = ?auto_24997 ?auto_25000 ) ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( IS-CRATE ?auto_24996 ) ( not ( = ?auto_25004 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25004 ) ) ( HOIST-AT ?auto_25006 ?auto_25004 ) ( not ( = ?auto_25001 ?auto_25006 ) ) ( not ( = ?auto_25003 ?auto_25006 ) ) ( AVAILABLE ?auto_25006 ) ( SURFACE-AT ?auto_24996 ?auto_25004 ) ( ON ?auto_24996 ?auto_24999 ) ( CLEAR ?auto_24996 ) ( not ( = ?auto_24996 ?auto_24999 ) ) ( not ( = ?auto_24997 ?auto_24999 ) ) ( not ( = ?auto_24998 ?auto_24999 ) ) ( not ( = ?auto_25000 ?auto_24999 ) ) ( SURFACE-AT ?auto_25005 ?auto_25009 ) ( CLEAR ?auto_25005 ) ( IS-CRATE ?auto_24998 ) ( not ( = ?auto_25005 ?auto_24998 ) ) ( not ( = ?auto_24996 ?auto_25005 ) ) ( not ( = ?auto_24997 ?auto_25005 ) ) ( not ( = ?auto_25000 ?auto_25005 ) ) ( not ( = ?auto_24999 ?auto_25005 ) ) ( AVAILABLE ?auto_25001 ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25007 ) ) ( not ( = ?auto_25004 ?auto_25007 ) ) ( HOIST-AT ?auto_25011 ?auto_25007 ) ( not ( = ?auto_25001 ?auto_25011 ) ) ( not ( = ?auto_25003 ?auto_25011 ) ) ( not ( = ?auto_25006 ?auto_25011 ) ) ( AVAILABLE ?auto_25011 ) ( SURFACE-AT ?auto_24998 ?auto_25007 ) ( ON ?auto_24998 ?auto_25010 ) ( CLEAR ?auto_24998 ) ( not ( = ?auto_24996 ?auto_25010 ) ) ( not ( = ?auto_24997 ?auto_25010 ) ) ( not ( = ?auto_24998 ?auto_25010 ) ) ( not ( = ?auto_25000 ?auto_25010 ) ) ( not ( = ?auto_24999 ?auto_25010 ) ) ( not ( = ?auto_25005 ?auto_25010 ) ) ( TRUCK-AT ?auto_25002 ?auto_25009 ) )
    :subtasks
    ( ( !DRIVE ?auto_25002 ?auto_25009 ?auto_25007 )
      ( MAKE-2CRATE ?auto_24998 ?auto_24996 ?auto_24997 )
      ( MAKE-1CRATE-VERIFY ?auto_24996 ?auto_24997 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25012 - SURFACE
      ?auto_25013 - SURFACE
      ?auto_25014 - SURFACE
    )
    :vars
    (
      ?auto_25019 - HOIST
      ?auto_25016 - PLACE
      ?auto_25021 - PLACE
      ?auto_25015 - HOIST
      ?auto_25025 - SURFACE
      ?auto_25023 - PLACE
      ?auto_25027 - HOIST
      ?auto_25020 - SURFACE
      ?auto_25022 - SURFACE
      ?auto_25018 - PLACE
      ?auto_25024 - HOIST
      ?auto_25017 - SURFACE
      ?auto_25026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25019 ?auto_25016 ) ( IS-CRATE ?auto_25014 ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25021 ?auto_25016 ) ) ( HOIST-AT ?auto_25015 ?auto_25021 ) ( not ( = ?auto_25019 ?auto_25015 ) ) ( AVAILABLE ?auto_25015 ) ( SURFACE-AT ?auto_25014 ?auto_25021 ) ( ON ?auto_25014 ?auto_25025 ) ( CLEAR ?auto_25014 ) ( not ( = ?auto_25013 ?auto_25025 ) ) ( not ( = ?auto_25014 ?auto_25025 ) ) ( not ( = ?auto_25012 ?auto_25025 ) ) ( IS-CRATE ?auto_25013 ) ( not ( = ?auto_25023 ?auto_25016 ) ) ( not ( = ?auto_25021 ?auto_25023 ) ) ( HOIST-AT ?auto_25027 ?auto_25023 ) ( not ( = ?auto_25019 ?auto_25027 ) ) ( not ( = ?auto_25015 ?auto_25027 ) ) ( AVAILABLE ?auto_25027 ) ( SURFACE-AT ?auto_25013 ?auto_25023 ) ( ON ?auto_25013 ?auto_25020 ) ( CLEAR ?auto_25013 ) ( not ( = ?auto_25013 ?auto_25020 ) ) ( not ( = ?auto_25014 ?auto_25020 ) ) ( not ( = ?auto_25012 ?auto_25020 ) ) ( not ( = ?auto_25025 ?auto_25020 ) ) ( SURFACE-AT ?auto_25022 ?auto_25016 ) ( CLEAR ?auto_25022 ) ( IS-CRATE ?auto_25012 ) ( not ( = ?auto_25022 ?auto_25012 ) ) ( not ( = ?auto_25013 ?auto_25022 ) ) ( not ( = ?auto_25014 ?auto_25022 ) ) ( not ( = ?auto_25025 ?auto_25022 ) ) ( not ( = ?auto_25020 ?auto_25022 ) ) ( AVAILABLE ?auto_25019 ) ( not ( = ?auto_25018 ?auto_25016 ) ) ( not ( = ?auto_25021 ?auto_25018 ) ) ( not ( = ?auto_25023 ?auto_25018 ) ) ( HOIST-AT ?auto_25024 ?auto_25018 ) ( not ( = ?auto_25019 ?auto_25024 ) ) ( not ( = ?auto_25015 ?auto_25024 ) ) ( not ( = ?auto_25027 ?auto_25024 ) ) ( AVAILABLE ?auto_25024 ) ( SURFACE-AT ?auto_25012 ?auto_25018 ) ( ON ?auto_25012 ?auto_25017 ) ( CLEAR ?auto_25012 ) ( not ( = ?auto_25013 ?auto_25017 ) ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25012 ?auto_25017 ) ) ( not ( = ?auto_25025 ?auto_25017 ) ) ( not ( = ?auto_25020 ?auto_25017 ) ) ( not ( = ?auto_25022 ?auto_25017 ) ) ( TRUCK-AT ?auto_25026 ?auto_25016 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25013 ?auto_25014 )
      ( MAKE-2CRATE-VERIFY ?auto_25012 ?auto_25013 ?auto_25014 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25028 - SURFACE
      ?auto_25029 - SURFACE
      ?auto_25030 - SURFACE
      ?auto_25031 - SURFACE
    )
    :vars
    (
      ?auto_25038 - HOIST
      ?auto_25040 - PLACE
      ?auto_25042 - PLACE
      ?auto_25041 - HOIST
      ?auto_25034 - SURFACE
      ?auto_25043 - PLACE
      ?auto_25032 - HOIST
      ?auto_25033 - SURFACE
      ?auto_25036 - PLACE
      ?auto_25037 - HOIST
      ?auto_25035 - SURFACE
      ?auto_25039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25038 ?auto_25040 ) ( IS-CRATE ?auto_25031 ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25029 ?auto_25030 ) ) ( not ( = ?auto_25029 ?auto_25031 ) ) ( not ( = ?auto_25042 ?auto_25040 ) ) ( HOIST-AT ?auto_25041 ?auto_25042 ) ( not ( = ?auto_25038 ?auto_25041 ) ) ( AVAILABLE ?auto_25041 ) ( SURFACE-AT ?auto_25031 ?auto_25042 ) ( ON ?auto_25031 ?auto_25034 ) ( CLEAR ?auto_25031 ) ( not ( = ?auto_25030 ?auto_25034 ) ) ( not ( = ?auto_25031 ?auto_25034 ) ) ( not ( = ?auto_25029 ?auto_25034 ) ) ( IS-CRATE ?auto_25030 ) ( not ( = ?auto_25043 ?auto_25040 ) ) ( not ( = ?auto_25042 ?auto_25043 ) ) ( HOIST-AT ?auto_25032 ?auto_25043 ) ( not ( = ?auto_25038 ?auto_25032 ) ) ( not ( = ?auto_25041 ?auto_25032 ) ) ( AVAILABLE ?auto_25032 ) ( SURFACE-AT ?auto_25030 ?auto_25043 ) ( ON ?auto_25030 ?auto_25033 ) ( CLEAR ?auto_25030 ) ( not ( = ?auto_25030 ?auto_25033 ) ) ( not ( = ?auto_25031 ?auto_25033 ) ) ( not ( = ?auto_25029 ?auto_25033 ) ) ( not ( = ?auto_25034 ?auto_25033 ) ) ( SURFACE-AT ?auto_25028 ?auto_25040 ) ( CLEAR ?auto_25028 ) ( IS-CRATE ?auto_25029 ) ( not ( = ?auto_25028 ?auto_25029 ) ) ( not ( = ?auto_25030 ?auto_25028 ) ) ( not ( = ?auto_25031 ?auto_25028 ) ) ( not ( = ?auto_25034 ?auto_25028 ) ) ( not ( = ?auto_25033 ?auto_25028 ) ) ( AVAILABLE ?auto_25038 ) ( not ( = ?auto_25036 ?auto_25040 ) ) ( not ( = ?auto_25042 ?auto_25036 ) ) ( not ( = ?auto_25043 ?auto_25036 ) ) ( HOIST-AT ?auto_25037 ?auto_25036 ) ( not ( = ?auto_25038 ?auto_25037 ) ) ( not ( = ?auto_25041 ?auto_25037 ) ) ( not ( = ?auto_25032 ?auto_25037 ) ) ( AVAILABLE ?auto_25037 ) ( SURFACE-AT ?auto_25029 ?auto_25036 ) ( ON ?auto_25029 ?auto_25035 ) ( CLEAR ?auto_25029 ) ( not ( = ?auto_25030 ?auto_25035 ) ) ( not ( = ?auto_25031 ?auto_25035 ) ) ( not ( = ?auto_25029 ?auto_25035 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25028 ?auto_25035 ) ) ( TRUCK-AT ?auto_25039 ?auto_25040 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25029 ?auto_25030 ?auto_25031 )
      ( MAKE-3CRATE-VERIFY ?auto_25028 ?auto_25029 ?auto_25030 ?auto_25031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25058 - SURFACE
      ?auto_25059 - SURFACE
    )
    :vars
    (
      ?auto_25060 - HOIST
      ?auto_25061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25060 ?auto_25061 ) ( SURFACE-AT ?auto_25058 ?auto_25061 ) ( CLEAR ?auto_25058 ) ( LIFTING ?auto_25060 ?auto_25059 ) ( IS-CRATE ?auto_25059 ) ( not ( = ?auto_25058 ?auto_25059 ) ) )
    :subtasks
    ( ( !DROP ?auto_25060 ?auto_25059 ?auto_25058 ?auto_25061 )
      ( MAKE-1CRATE-VERIFY ?auto_25058 ?auto_25059 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25062 - SURFACE
      ?auto_25063 - SURFACE
      ?auto_25064 - SURFACE
    )
    :vars
    (
      ?auto_25066 - HOIST
      ?auto_25065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25066 ?auto_25065 ) ( SURFACE-AT ?auto_25063 ?auto_25065 ) ( CLEAR ?auto_25063 ) ( LIFTING ?auto_25066 ?auto_25064 ) ( IS-CRATE ?auto_25064 ) ( not ( = ?auto_25063 ?auto_25064 ) ) ( ON ?auto_25063 ?auto_25062 ) ( not ( = ?auto_25062 ?auto_25063 ) ) ( not ( = ?auto_25062 ?auto_25064 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25063 ?auto_25064 )
      ( MAKE-2CRATE-VERIFY ?auto_25062 ?auto_25063 ?auto_25064 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25067 - SURFACE
      ?auto_25068 - SURFACE
      ?auto_25069 - SURFACE
      ?auto_25070 - SURFACE
    )
    :vars
    (
      ?auto_25072 - HOIST
      ?auto_25071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25072 ?auto_25071 ) ( SURFACE-AT ?auto_25069 ?auto_25071 ) ( CLEAR ?auto_25069 ) ( LIFTING ?auto_25072 ?auto_25070 ) ( IS-CRATE ?auto_25070 ) ( not ( = ?auto_25069 ?auto_25070 ) ) ( ON ?auto_25068 ?auto_25067 ) ( ON ?auto_25069 ?auto_25068 ) ( not ( = ?auto_25067 ?auto_25068 ) ) ( not ( = ?auto_25067 ?auto_25069 ) ) ( not ( = ?auto_25067 ?auto_25070 ) ) ( not ( = ?auto_25068 ?auto_25069 ) ) ( not ( = ?auto_25068 ?auto_25070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25069 ?auto_25070 )
      ( MAKE-3CRATE-VERIFY ?auto_25067 ?auto_25068 ?auto_25069 ?auto_25070 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25073 - SURFACE
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
      ?auto_25077 - SURFACE
    )
    :vars
    (
      ?auto_25079 - HOIST
      ?auto_25078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25079 ?auto_25078 ) ( SURFACE-AT ?auto_25076 ?auto_25078 ) ( CLEAR ?auto_25076 ) ( LIFTING ?auto_25079 ?auto_25077 ) ( IS-CRATE ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( ON ?auto_25074 ?auto_25073 ) ( ON ?auto_25075 ?auto_25074 ) ( ON ?auto_25076 ?auto_25075 ) ( not ( = ?auto_25073 ?auto_25074 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25076 ) ) ( not ( = ?auto_25073 ?auto_25077 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25076 ?auto_25077 )
      ( MAKE-4CRATE-VERIFY ?auto_25073 ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25080 - SURFACE
      ?auto_25081 - SURFACE
    )
    :vars
    (
      ?auto_25083 - HOIST
      ?auto_25082 - PLACE
      ?auto_25084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25083 ?auto_25082 ) ( SURFACE-AT ?auto_25080 ?auto_25082 ) ( CLEAR ?auto_25080 ) ( IS-CRATE ?auto_25081 ) ( not ( = ?auto_25080 ?auto_25081 ) ) ( TRUCK-AT ?auto_25084 ?auto_25082 ) ( AVAILABLE ?auto_25083 ) ( IN ?auto_25081 ?auto_25084 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25083 ?auto_25081 ?auto_25084 ?auto_25082 )
      ( MAKE-1CRATE ?auto_25080 ?auto_25081 )
      ( MAKE-1CRATE-VERIFY ?auto_25080 ?auto_25081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25085 - SURFACE
      ?auto_25086 - SURFACE
      ?auto_25087 - SURFACE
    )
    :vars
    (
      ?auto_25090 - HOIST
      ?auto_25088 - PLACE
      ?auto_25089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25090 ?auto_25088 ) ( SURFACE-AT ?auto_25086 ?auto_25088 ) ( CLEAR ?auto_25086 ) ( IS-CRATE ?auto_25087 ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( TRUCK-AT ?auto_25089 ?auto_25088 ) ( AVAILABLE ?auto_25090 ) ( IN ?auto_25087 ?auto_25089 ) ( ON ?auto_25086 ?auto_25085 ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25086 ?auto_25087 )
      ( MAKE-2CRATE-VERIFY ?auto_25085 ?auto_25086 ?auto_25087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25091 - SURFACE
      ?auto_25092 - SURFACE
      ?auto_25093 - SURFACE
      ?auto_25094 - SURFACE
    )
    :vars
    (
      ?auto_25097 - HOIST
      ?auto_25096 - PLACE
      ?auto_25095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25097 ?auto_25096 ) ( SURFACE-AT ?auto_25093 ?auto_25096 ) ( CLEAR ?auto_25093 ) ( IS-CRATE ?auto_25094 ) ( not ( = ?auto_25093 ?auto_25094 ) ) ( TRUCK-AT ?auto_25095 ?auto_25096 ) ( AVAILABLE ?auto_25097 ) ( IN ?auto_25094 ?auto_25095 ) ( ON ?auto_25093 ?auto_25092 ) ( not ( = ?auto_25092 ?auto_25093 ) ) ( not ( = ?auto_25092 ?auto_25094 ) ) ( ON ?auto_25092 ?auto_25091 ) ( not ( = ?auto_25091 ?auto_25092 ) ) ( not ( = ?auto_25091 ?auto_25093 ) ) ( not ( = ?auto_25091 ?auto_25094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25092 ?auto_25093 ?auto_25094 )
      ( MAKE-3CRATE-VERIFY ?auto_25091 ?auto_25092 ?auto_25093 ?auto_25094 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25098 - SURFACE
      ?auto_25099 - SURFACE
      ?auto_25100 - SURFACE
      ?auto_25101 - SURFACE
      ?auto_25102 - SURFACE
    )
    :vars
    (
      ?auto_25105 - HOIST
      ?auto_25104 - PLACE
      ?auto_25103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25105 ?auto_25104 ) ( SURFACE-AT ?auto_25101 ?auto_25104 ) ( CLEAR ?auto_25101 ) ( IS-CRATE ?auto_25102 ) ( not ( = ?auto_25101 ?auto_25102 ) ) ( TRUCK-AT ?auto_25103 ?auto_25104 ) ( AVAILABLE ?auto_25105 ) ( IN ?auto_25102 ?auto_25103 ) ( ON ?auto_25101 ?auto_25100 ) ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( ON ?auto_25099 ?auto_25098 ) ( ON ?auto_25100 ?auto_25099 ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25100 ) ) ( not ( = ?auto_25098 ?auto_25101 ) ) ( not ( = ?auto_25098 ?auto_25102 ) ) ( not ( = ?auto_25099 ?auto_25100 ) ) ( not ( = ?auto_25099 ?auto_25101 ) ) ( not ( = ?auto_25099 ?auto_25102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25100 ?auto_25101 ?auto_25102 )
      ( MAKE-4CRATE-VERIFY ?auto_25098 ?auto_25099 ?auto_25100 ?auto_25101 ?auto_25102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25106 - SURFACE
      ?auto_25107 - SURFACE
    )
    :vars
    (
      ?auto_25111 - HOIST
      ?auto_25110 - PLACE
      ?auto_25108 - TRUCK
      ?auto_25109 - SURFACE
      ?auto_25112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25111 ?auto_25110 ) ( SURFACE-AT ?auto_25106 ?auto_25110 ) ( CLEAR ?auto_25106 ) ( IS-CRATE ?auto_25107 ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( AVAILABLE ?auto_25111 ) ( IN ?auto_25107 ?auto_25108 ) ( ON ?auto_25106 ?auto_25109 ) ( not ( = ?auto_25109 ?auto_25106 ) ) ( not ( = ?auto_25109 ?auto_25107 ) ) ( TRUCK-AT ?auto_25108 ?auto_25112 ) ( not ( = ?auto_25112 ?auto_25110 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25108 ?auto_25112 ?auto_25110 )
      ( MAKE-2CRATE ?auto_25109 ?auto_25106 ?auto_25107 )
      ( MAKE-1CRATE-VERIFY ?auto_25106 ?auto_25107 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25113 - SURFACE
      ?auto_25114 - SURFACE
      ?auto_25115 - SURFACE
    )
    :vars
    (
      ?auto_25119 - HOIST
      ?auto_25117 - PLACE
      ?auto_25116 - TRUCK
      ?auto_25118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25119 ?auto_25117 ) ( SURFACE-AT ?auto_25114 ?auto_25117 ) ( CLEAR ?auto_25114 ) ( IS-CRATE ?auto_25115 ) ( not ( = ?auto_25114 ?auto_25115 ) ) ( AVAILABLE ?auto_25119 ) ( IN ?auto_25115 ?auto_25116 ) ( ON ?auto_25114 ?auto_25113 ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25115 ) ) ( TRUCK-AT ?auto_25116 ?auto_25118 ) ( not ( = ?auto_25118 ?auto_25117 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25114 ?auto_25115 )
      ( MAKE-2CRATE-VERIFY ?auto_25113 ?auto_25114 ?auto_25115 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25120 - SURFACE
      ?auto_25121 - SURFACE
      ?auto_25122 - SURFACE
      ?auto_25123 - SURFACE
    )
    :vars
    (
      ?auto_25124 - HOIST
      ?auto_25125 - PLACE
      ?auto_25126 - TRUCK
      ?auto_25127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25124 ?auto_25125 ) ( SURFACE-AT ?auto_25122 ?auto_25125 ) ( CLEAR ?auto_25122 ) ( IS-CRATE ?auto_25123 ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( AVAILABLE ?auto_25124 ) ( IN ?auto_25123 ?auto_25126 ) ( ON ?auto_25122 ?auto_25121 ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( TRUCK-AT ?auto_25126 ?auto_25127 ) ( not ( = ?auto_25127 ?auto_25125 ) ) ( ON ?auto_25121 ?auto_25120 ) ( not ( = ?auto_25120 ?auto_25121 ) ) ( not ( = ?auto_25120 ?auto_25122 ) ) ( not ( = ?auto_25120 ?auto_25123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25121 ?auto_25122 ?auto_25123 )
      ( MAKE-3CRATE-VERIFY ?auto_25120 ?auto_25121 ?auto_25122 ?auto_25123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25128 - SURFACE
      ?auto_25129 - SURFACE
      ?auto_25130 - SURFACE
      ?auto_25131 - SURFACE
      ?auto_25132 - SURFACE
    )
    :vars
    (
      ?auto_25133 - HOIST
      ?auto_25134 - PLACE
      ?auto_25135 - TRUCK
      ?auto_25136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25133 ?auto_25134 ) ( SURFACE-AT ?auto_25131 ?auto_25134 ) ( CLEAR ?auto_25131 ) ( IS-CRATE ?auto_25132 ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( AVAILABLE ?auto_25133 ) ( IN ?auto_25132 ?auto_25135 ) ( ON ?auto_25131 ?auto_25130 ) ( not ( = ?auto_25130 ?auto_25131 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( TRUCK-AT ?auto_25135 ?auto_25136 ) ( not ( = ?auto_25136 ?auto_25134 ) ) ( ON ?auto_25129 ?auto_25128 ) ( ON ?auto_25130 ?auto_25129 ) ( not ( = ?auto_25128 ?auto_25129 ) ) ( not ( = ?auto_25128 ?auto_25130 ) ) ( not ( = ?auto_25128 ?auto_25131 ) ) ( not ( = ?auto_25128 ?auto_25132 ) ) ( not ( = ?auto_25129 ?auto_25130 ) ) ( not ( = ?auto_25129 ?auto_25131 ) ) ( not ( = ?auto_25129 ?auto_25132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25130 ?auto_25131 ?auto_25132 )
      ( MAKE-4CRATE-VERIFY ?auto_25128 ?auto_25129 ?auto_25130 ?auto_25131 ?auto_25132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25137 - SURFACE
      ?auto_25138 - SURFACE
    )
    :vars
    (
      ?auto_25139 - HOIST
      ?auto_25140 - PLACE
      ?auto_25143 - SURFACE
      ?auto_25141 - TRUCK
      ?auto_25142 - PLACE
      ?auto_25144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25139 ?auto_25140 ) ( SURFACE-AT ?auto_25137 ?auto_25140 ) ( CLEAR ?auto_25137 ) ( IS-CRATE ?auto_25138 ) ( not ( = ?auto_25137 ?auto_25138 ) ) ( AVAILABLE ?auto_25139 ) ( ON ?auto_25137 ?auto_25143 ) ( not ( = ?auto_25143 ?auto_25137 ) ) ( not ( = ?auto_25143 ?auto_25138 ) ) ( TRUCK-AT ?auto_25141 ?auto_25142 ) ( not ( = ?auto_25142 ?auto_25140 ) ) ( HOIST-AT ?auto_25144 ?auto_25142 ) ( LIFTING ?auto_25144 ?auto_25138 ) ( not ( = ?auto_25139 ?auto_25144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25144 ?auto_25138 ?auto_25141 ?auto_25142 )
      ( MAKE-2CRATE ?auto_25143 ?auto_25137 ?auto_25138 )
      ( MAKE-1CRATE-VERIFY ?auto_25137 ?auto_25138 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25145 - SURFACE
      ?auto_25146 - SURFACE
      ?auto_25147 - SURFACE
    )
    :vars
    (
      ?auto_25152 - HOIST
      ?auto_25149 - PLACE
      ?auto_25150 - TRUCK
      ?auto_25151 - PLACE
      ?auto_25148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25152 ?auto_25149 ) ( SURFACE-AT ?auto_25146 ?auto_25149 ) ( CLEAR ?auto_25146 ) ( IS-CRATE ?auto_25147 ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( AVAILABLE ?auto_25152 ) ( ON ?auto_25146 ?auto_25145 ) ( not ( = ?auto_25145 ?auto_25146 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( TRUCK-AT ?auto_25150 ?auto_25151 ) ( not ( = ?auto_25151 ?auto_25149 ) ) ( HOIST-AT ?auto_25148 ?auto_25151 ) ( LIFTING ?auto_25148 ?auto_25147 ) ( not ( = ?auto_25152 ?auto_25148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25146 ?auto_25147 )
      ( MAKE-2CRATE-VERIFY ?auto_25145 ?auto_25146 ?auto_25147 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25153 - SURFACE
      ?auto_25154 - SURFACE
      ?auto_25155 - SURFACE
      ?auto_25156 - SURFACE
    )
    :vars
    (
      ?auto_25160 - HOIST
      ?auto_25158 - PLACE
      ?auto_25157 - TRUCK
      ?auto_25161 - PLACE
      ?auto_25159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25160 ?auto_25158 ) ( SURFACE-AT ?auto_25155 ?auto_25158 ) ( CLEAR ?auto_25155 ) ( IS-CRATE ?auto_25156 ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( AVAILABLE ?auto_25160 ) ( ON ?auto_25155 ?auto_25154 ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( TRUCK-AT ?auto_25157 ?auto_25161 ) ( not ( = ?auto_25161 ?auto_25158 ) ) ( HOIST-AT ?auto_25159 ?auto_25161 ) ( LIFTING ?auto_25159 ?auto_25156 ) ( not ( = ?auto_25160 ?auto_25159 ) ) ( ON ?auto_25154 ?auto_25153 ) ( not ( = ?auto_25153 ?auto_25154 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25154 ?auto_25155 ?auto_25156 )
      ( MAKE-3CRATE-VERIFY ?auto_25153 ?auto_25154 ?auto_25155 ?auto_25156 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25162 - SURFACE
      ?auto_25163 - SURFACE
      ?auto_25164 - SURFACE
      ?auto_25165 - SURFACE
      ?auto_25166 - SURFACE
    )
    :vars
    (
      ?auto_25170 - HOIST
      ?auto_25168 - PLACE
      ?auto_25167 - TRUCK
      ?auto_25171 - PLACE
      ?auto_25169 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25170 ?auto_25168 ) ( SURFACE-AT ?auto_25165 ?auto_25168 ) ( CLEAR ?auto_25165 ) ( IS-CRATE ?auto_25166 ) ( not ( = ?auto_25165 ?auto_25166 ) ) ( AVAILABLE ?auto_25170 ) ( ON ?auto_25165 ?auto_25164 ) ( not ( = ?auto_25164 ?auto_25165 ) ) ( not ( = ?auto_25164 ?auto_25166 ) ) ( TRUCK-AT ?auto_25167 ?auto_25171 ) ( not ( = ?auto_25171 ?auto_25168 ) ) ( HOIST-AT ?auto_25169 ?auto_25171 ) ( LIFTING ?auto_25169 ?auto_25166 ) ( not ( = ?auto_25170 ?auto_25169 ) ) ( ON ?auto_25163 ?auto_25162 ) ( ON ?auto_25164 ?auto_25163 ) ( not ( = ?auto_25162 ?auto_25163 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( not ( = ?auto_25162 ?auto_25166 ) ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25165 ) ) ( not ( = ?auto_25163 ?auto_25166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25164 ?auto_25165 ?auto_25166 )
      ( MAKE-4CRATE-VERIFY ?auto_25162 ?auto_25163 ?auto_25164 ?auto_25165 ?auto_25166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25172 - SURFACE
      ?auto_25173 - SURFACE
    )
    :vars
    (
      ?auto_25178 - HOIST
      ?auto_25176 - PLACE
      ?auto_25174 - SURFACE
      ?auto_25175 - TRUCK
      ?auto_25179 - PLACE
      ?auto_25177 - HOIST
      ?auto_25180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25178 ?auto_25176 ) ( SURFACE-AT ?auto_25172 ?auto_25176 ) ( CLEAR ?auto_25172 ) ( IS-CRATE ?auto_25173 ) ( not ( = ?auto_25172 ?auto_25173 ) ) ( AVAILABLE ?auto_25178 ) ( ON ?auto_25172 ?auto_25174 ) ( not ( = ?auto_25174 ?auto_25172 ) ) ( not ( = ?auto_25174 ?auto_25173 ) ) ( TRUCK-AT ?auto_25175 ?auto_25179 ) ( not ( = ?auto_25179 ?auto_25176 ) ) ( HOIST-AT ?auto_25177 ?auto_25179 ) ( not ( = ?auto_25178 ?auto_25177 ) ) ( AVAILABLE ?auto_25177 ) ( SURFACE-AT ?auto_25173 ?auto_25179 ) ( ON ?auto_25173 ?auto_25180 ) ( CLEAR ?auto_25173 ) ( not ( = ?auto_25172 ?auto_25180 ) ) ( not ( = ?auto_25173 ?auto_25180 ) ) ( not ( = ?auto_25174 ?auto_25180 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25177 ?auto_25173 ?auto_25180 ?auto_25179 )
      ( MAKE-2CRATE ?auto_25174 ?auto_25172 ?auto_25173 )
      ( MAKE-1CRATE-VERIFY ?auto_25172 ?auto_25173 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25181 - SURFACE
      ?auto_25182 - SURFACE
      ?auto_25183 - SURFACE
    )
    :vars
    (
      ?auto_25186 - HOIST
      ?auto_25184 - PLACE
      ?auto_25189 - TRUCK
      ?auto_25185 - PLACE
      ?auto_25187 - HOIST
      ?auto_25188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25186 ?auto_25184 ) ( SURFACE-AT ?auto_25182 ?auto_25184 ) ( CLEAR ?auto_25182 ) ( IS-CRATE ?auto_25183 ) ( not ( = ?auto_25182 ?auto_25183 ) ) ( AVAILABLE ?auto_25186 ) ( ON ?auto_25182 ?auto_25181 ) ( not ( = ?auto_25181 ?auto_25182 ) ) ( not ( = ?auto_25181 ?auto_25183 ) ) ( TRUCK-AT ?auto_25189 ?auto_25185 ) ( not ( = ?auto_25185 ?auto_25184 ) ) ( HOIST-AT ?auto_25187 ?auto_25185 ) ( not ( = ?auto_25186 ?auto_25187 ) ) ( AVAILABLE ?auto_25187 ) ( SURFACE-AT ?auto_25183 ?auto_25185 ) ( ON ?auto_25183 ?auto_25188 ) ( CLEAR ?auto_25183 ) ( not ( = ?auto_25182 ?auto_25188 ) ) ( not ( = ?auto_25183 ?auto_25188 ) ) ( not ( = ?auto_25181 ?auto_25188 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25182 ?auto_25183 )
      ( MAKE-2CRATE-VERIFY ?auto_25181 ?auto_25182 ?auto_25183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25190 - SURFACE
      ?auto_25191 - SURFACE
      ?auto_25192 - SURFACE
      ?auto_25193 - SURFACE
    )
    :vars
    (
      ?auto_25199 - HOIST
      ?auto_25194 - PLACE
      ?auto_25196 - TRUCK
      ?auto_25197 - PLACE
      ?auto_25195 - HOIST
      ?auto_25198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25199 ?auto_25194 ) ( SURFACE-AT ?auto_25192 ?auto_25194 ) ( CLEAR ?auto_25192 ) ( IS-CRATE ?auto_25193 ) ( not ( = ?auto_25192 ?auto_25193 ) ) ( AVAILABLE ?auto_25199 ) ( ON ?auto_25192 ?auto_25191 ) ( not ( = ?auto_25191 ?auto_25192 ) ) ( not ( = ?auto_25191 ?auto_25193 ) ) ( TRUCK-AT ?auto_25196 ?auto_25197 ) ( not ( = ?auto_25197 ?auto_25194 ) ) ( HOIST-AT ?auto_25195 ?auto_25197 ) ( not ( = ?auto_25199 ?auto_25195 ) ) ( AVAILABLE ?auto_25195 ) ( SURFACE-AT ?auto_25193 ?auto_25197 ) ( ON ?auto_25193 ?auto_25198 ) ( CLEAR ?auto_25193 ) ( not ( = ?auto_25192 ?auto_25198 ) ) ( not ( = ?auto_25193 ?auto_25198 ) ) ( not ( = ?auto_25191 ?auto_25198 ) ) ( ON ?auto_25191 ?auto_25190 ) ( not ( = ?auto_25190 ?auto_25191 ) ) ( not ( = ?auto_25190 ?auto_25192 ) ) ( not ( = ?auto_25190 ?auto_25193 ) ) ( not ( = ?auto_25190 ?auto_25198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25191 ?auto_25192 ?auto_25193 )
      ( MAKE-3CRATE-VERIFY ?auto_25190 ?auto_25191 ?auto_25192 ?auto_25193 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25200 - SURFACE
      ?auto_25201 - SURFACE
      ?auto_25202 - SURFACE
      ?auto_25203 - SURFACE
      ?auto_25204 - SURFACE
    )
    :vars
    (
      ?auto_25210 - HOIST
      ?auto_25205 - PLACE
      ?auto_25207 - TRUCK
      ?auto_25208 - PLACE
      ?auto_25206 - HOIST
      ?auto_25209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25210 ?auto_25205 ) ( SURFACE-AT ?auto_25203 ?auto_25205 ) ( CLEAR ?auto_25203 ) ( IS-CRATE ?auto_25204 ) ( not ( = ?auto_25203 ?auto_25204 ) ) ( AVAILABLE ?auto_25210 ) ( ON ?auto_25203 ?auto_25202 ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( TRUCK-AT ?auto_25207 ?auto_25208 ) ( not ( = ?auto_25208 ?auto_25205 ) ) ( HOIST-AT ?auto_25206 ?auto_25208 ) ( not ( = ?auto_25210 ?auto_25206 ) ) ( AVAILABLE ?auto_25206 ) ( SURFACE-AT ?auto_25204 ?auto_25208 ) ( ON ?auto_25204 ?auto_25209 ) ( CLEAR ?auto_25204 ) ( not ( = ?auto_25203 ?auto_25209 ) ) ( not ( = ?auto_25204 ?auto_25209 ) ) ( not ( = ?auto_25202 ?auto_25209 ) ) ( ON ?auto_25201 ?auto_25200 ) ( ON ?auto_25202 ?auto_25201 ) ( not ( = ?auto_25200 ?auto_25201 ) ) ( not ( = ?auto_25200 ?auto_25202 ) ) ( not ( = ?auto_25200 ?auto_25203 ) ) ( not ( = ?auto_25200 ?auto_25204 ) ) ( not ( = ?auto_25200 ?auto_25209 ) ) ( not ( = ?auto_25201 ?auto_25202 ) ) ( not ( = ?auto_25201 ?auto_25203 ) ) ( not ( = ?auto_25201 ?auto_25204 ) ) ( not ( = ?auto_25201 ?auto_25209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25202 ?auto_25203 ?auto_25204 )
      ( MAKE-4CRATE-VERIFY ?auto_25200 ?auto_25201 ?auto_25202 ?auto_25203 ?auto_25204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25211 - SURFACE
      ?auto_25212 - SURFACE
    )
    :vars
    (
      ?auto_25219 - HOIST
      ?auto_25213 - PLACE
      ?auto_25214 - SURFACE
      ?auto_25217 - PLACE
      ?auto_25215 - HOIST
      ?auto_25218 - SURFACE
      ?auto_25216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25219 ?auto_25213 ) ( SURFACE-AT ?auto_25211 ?auto_25213 ) ( CLEAR ?auto_25211 ) ( IS-CRATE ?auto_25212 ) ( not ( = ?auto_25211 ?auto_25212 ) ) ( AVAILABLE ?auto_25219 ) ( ON ?auto_25211 ?auto_25214 ) ( not ( = ?auto_25214 ?auto_25211 ) ) ( not ( = ?auto_25214 ?auto_25212 ) ) ( not ( = ?auto_25217 ?auto_25213 ) ) ( HOIST-AT ?auto_25215 ?auto_25217 ) ( not ( = ?auto_25219 ?auto_25215 ) ) ( AVAILABLE ?auto_25215 ) ( SURFACE-AT ?auto_25212 ?auto_25217 ) ( ON ?auto_25212 ?auto_25218 ) ( CLEAR ?auto_25212 ) ( not ( = ?auto_25211 ?auto_25218 ) ) ( not ( = ?auto_25212 ?auto_25218 ) ) ( not ( = ?auto_25214 ?auto_25218 ) ) ( TRUCK-AT ?auto_25216 ?auto_25213 ) )
    :subtasks
    ( ( !DRIVE ?auto_25216 ?auto_25213 ?auto_25217 )
      ( MAKE-2CRATE ?auto_25214 ?auto_25211 ?auto_25212 )
      ( MAKE-1CRATE-VERIFY ?auto_25211 ?auto_25212 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25220 - SURFACE
      ?auto_25221 - SURFACE
      ?auto_25222 - SURFACE
    )
    :vars
    (
      ?auto_25227 - HOIST
      ?auto_25224 - PLACE
      ?auto_25226 - PLACE
      ?auto_25223 - HOIST
      ?auto_25228 - SURFACE
      ?auto_25225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25227 ?auto_25224 ) ( SURFACE-AT ?auto_25221 ?auto_25224 ) ( CLEAR ?auto_25221 ) ( IS-CRATE ?auto_25222 ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( AVAILABLE ?auto_25227 ) ( ON ?auto_25221 ?auto_25220 ) ( not ( = ?auto_25220 ?auto_25221 ) ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25226 ?auto_25224 ) ) ( HOIST-AT ?auto_25223 ?auto_25226 ) ( not ( = ?auto_25227 ?auto_25223 ) ) ( AVAILABLE ?auto_25223 ) ( SURFACE-AT ?auto_25222 ?auto_25226 ) ( ON ?auto_25222 ?auto_25228 ) ( CLEAR ?auto_25222 ) ( not ( = ?auto_25221 ?auto_25228 ) ) ( not ( = ?auto_25222 ?auto_25228 ) ) ( not ( = ?auto_25220 ?auto_25228 ) ) ( TRUCK-AT ?auto_25225 ?auto_25224 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25221 ?auto_25222 )
      ( MAKE-2CRATE-VERIFY ?auto_25220 ?auto_25221 ?auto_25222 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25229 - SURFACE
      ?auto_25230 - SURFACE
      ?auto_25231 - SURFACE
      ?auto_25232 - SURFACE
    )
    :vars
    (
      ?auto_25233 - HOIST
      ?auto_25237 - PLACE
      ?auto_25238 - PLACE
      ?auto_25234 - HOIST
      ?auto_25235 - SURFACE
      ?auto_25236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25233 ?auto_25237 ) ( SURFACE-AT ?auto_25231 ?auto_25237 ) ( CLEAR ?auto_25231 ) ( IS-CRATE ?auto_25232 ) ( not ( = ?auto_25231 ?auto_25232 ) ) ( AVAILABLE ?auto_25233 ) ( ON ?auto_25231 ?auto_25230 ) ( not ( = ?auto_25230 ?auto_25231 ) ) ( not ( = ?auto_25230 ?auto_25232 ) ) ( not ( = ?auto_25238 ?auto_25237 ) ) ( HOIST-AT ?auto_25234 ?auto_25238 ) ( not ( = ?auto_25233 ?auto_25234 ) ) ( AVAILABLE ?auto_25234 ) ( SURFACE-AT ?auto_25232 ?auto_25238 ) ( ON ?auto_25232 ?auto_25235 ) ( CLEAR ?auto_25232 ) ( not ( = ?auto_25231 ?auto_25235 ) ) ( not ( = ?auto_25232 ?auto_25235 ) ) ( not ( = ?auto_25230 ?auto_25235 ) ) ( TRUCK-AT ?auto_25236 ?auto_25237 ) ( ON ?auto_25230 ?auto_25229 ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25231 ) ) ( not ( = ?auto_25229 ?auto_25232 ) ) ( not ( = ?auto_25229 ?auto_25235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25230 ?auto_25231 ?auto_25232 )
      ( MAKE-3CRATE-VERIFY ?auto_25229 ?auto_25230 ?auto_25231 ?auto_25232 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25239 - SURFACE
      ?auto_25240 - SURFACE
      ?auto_25241 - SURFACE
      ?auto_25242 - SURFACE
      ?auto_25243 - SURFACE
    )
    :vars
    (
      ?auto_25244 - HOIST
      ?auto_25248 - PLACE
      ?auto_25249 - PLACE
      ?auto_25245 - HOIST
      ?auto_25246 - SURFACE
      ?auto_25247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25244 ?auto_25248 ) ( SURFACE-AT ?auto_25242 ?auto_25248 ) ( CLEAR ?auto_25242 ) ( IS-CRATE ?auto_25243 ) ( not ( = ?auto_25242 ?auto_25243 ) ) ( AVAILABLE ?auto_25244 ) ( ON ?auto_25242 ?auto_25241 ) ( not ( = ?auto_25241 ?auto_25242 ) ) ( not ( = ?auto_25241 ?auto_25243 ) ) ( not ( = ?auto_25249 ?auto_25248 ) ) ( HOIST-AT ?auto_25245 ?auto_25249 ) ( not ( = ?auto_25244 ?auto_25245 ) ) ( AVAILABLE ?auto_25245 ) ( SURFACE-AT ?auto_25243 ?auto_25249 ) ( ON ?auto_25243 ?auto_25246 ) ( CLEAR ?auto_25243 ) ( not ( = ?auto_25242 ?auto_25246 ) ) ( not ( = ?auto_25243 ?auto_25246 ) ) ( not ( = ?auto_25241 ?auto_25246 ) ) ( TRUCK-AT ?auto_25247 ?auto_25248 ) ( ON ?auto_25240 ?auto_25239 ) ( ON ?auto_25241 ?auto_25240 ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25241 ) ) ( not ( = ?auto_25239 ?auto_25242 ) ) ( not ( = ?auto_25239 ?auto_25243 ) ) ( not ( = ?auto_25239 ?auto_25246 ) ) ( not ( = ?auto_25240 ?auto_25241 ) ) ( not ( = ?auto_25240 ?auto_25242 ) ) ( not ( = ?auto_25240 ?auto_25243 ) ) ( not ( = ?auto_25240 ?auto_25246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25241 ?auto_25242 ?auto_25243 )
      ( MAKE-4CRATE-VERIFY ?auto_25239 ?auto_25240 ?auto_25241 ?auto_25242 ?auto_25243 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25250 - SURFACE
      ?auto_25251 - SURFACE
    )
    :vars
    (
      ?auto_25253 - HOIST
      ?auto_25257 - PLACE
      ?auto_25252 - SURFACE
      ?auto_25258 - PLACE
      ?auto_25254 - HOIST
      ?auto_25255 - SURFACE
      ?auto_25256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25253 ?auto_25257 ) ( IS-CRATE ?auto_25251 ) ( not ( = ?auto_25250 ?auto_25251 ) ) ( not ( = ?auto_25252 ?auto_25250 ) ) ( not ( = ?auto_25252 ?auto_25251 ) ) ( not ( = ?auto_25258 ?auto_25257 ) ) ( HOIST-AT ?auto_25254 ?auto_25258 ) ( not ( = ?auto_25253 ?auto_25254 ) ) ( AVAILABLE ?auto_25254 ) ( SURFACE-AT ?auto_25251 ?auto_25258 ) ( ON ?auto_25251 ?auto_25255 ) ( CLEAR ?auto_25251 ) ( not ( = ?auto_25250 ?auto_25255 ) ) ( not ( = ?auto_25251 ?auto_25255 ) ) ( not ( = ?auto_25252 ?auto_25255 ) ) ( TRUCK-AT ?auto_25256 ?auto_25257 ) ( SURFACE-AT ?auto_25252 ?auto_25257 ) ( CLEAR ?auto_25252 ) ( LIFTING ?auto_25253 ?auto_25250 ) ( IS-CRATE ?auto_25250 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25252 ?auto_25250 )
      ( MAKE-2CRATE ?auto_25252 ?auto_25250 ?auto_25251 )
      ( MAKE-1CRATE-VERIFY ?auto_25250 ?auto_25251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25259 - SURFACE
      ?auto_25260 - SURFACE
      ?auto_25261 - SURFACE
    )
    :vars
    (
      ?auto_25262 - HOIST
      ?auto_25264 - PLACE
      ?auto_25263 - PLACE
      ?auto_25267 - HOIST
      ?auto_25265 - SURFACE
      ?auto_25266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25262 ?auto_25264 ) ( IS-CRATE ?auto_25261 ) ( not ( = ?auto_25260 ?auto_25261 ) ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25259 ?auto_25261 ) ) ( not ( = ?auto_25263 ?auto_25264 ) ) ( HOIST-AT ?auto_25267 ?auto_25263 ) ( not ( = ?auto_25262 ?auto_25267 ) ) ( AVAILABLE ?auto_25267 ) ( SURFACE-AT ?auto_25261 ?auto_25263 ) ( ON ?auto_25261 ?auto_25265 ) ( CLEAR ?auto_25261 ) ( not ( = ?auto_25260 ?auto_25265 ) ) ( not ( = ?auto_25261 ?auto_25265 ) ) ( not ( = ?auto_25259 ?auto_25265 ) ) ( TRUCK-AT ?auto_25266 ?auto_25264 ) ( SURFACE-AT ?auto_25259 ?auto_25264 ) ( CLEAR ?auto_25259 ) ( LIFTING ?auto_25262 ?auto_25260 ) ( IS-CRATE ?auto_25260 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25260 ?auto_25261 )
      ( MAKE-2CRATE-VERIFY ?auto_25259 ?auto_25260 ?auto_25261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25268 - SURFACE
      ?auto_25269 - SURFACE
      ?auto_25270 - SURFACE
      ?auto_25271 - SURFACE
    )
    :vars
    (
      ?auto_25276 - HOIST
      ?auto_25273 - PLACE
      ?auto_25274 - PLACE
      ?auto_25277 - HOIST
      ?auto_25275 - SURFACE
      ?auto_25272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25276 ?auto_25273 ) ( IS-CRATE ?auto_25271 ) ( not ( = ?auto_25270 ?auto_25271 ) ) ( not ( = ?auto_25269 ?auto_25270 ) ) ( not ( = ?auto_25269 ?auto_25271 ) ) ( not ( = ?auto_25274 ?auto_25273 ) ) ( HOIST-AT ?auto_25277 ?auto_25274 ) ( not ( = ?auto_25276 ?auto_25277 ) ) ( AVAILABLE ?auto_25277 ) ( SURFACE-AT ?auto_25271 ?auto_25274 ) ( ON ?auto_25271 ?auto_25275 ) ( CLEAR ?auto_25271 ) ( not ( = ?auto_25270 ?auto_25275 ) ) ( not ( = ?auto_25271 ?auto_25275 ) ) ( not ( = ?auto_25269 ?auto_25275 ) ) ( TRUCK-AT ?auto_25272 ?auto_25273 ) ( SURFACE-AT ?auto_25269 ?auto_25273 ) ( CLEAR ?auto_25269 ) ( LIFTING ?auto_25276 ?auto_25270 ) ( IS-CRATE ?auto_25270 ) ( ON ?auto_25269 ?auto_25268 ) ( not ( = ?auto_25268 ?auto_25269 ) ) ( not ( = ?auto_25268 ?auto_25270 ) ) ( not ( = ?auto_25268 ?auto_25271 ) ) ( not ( = ?auto_25268 ?auto_25275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25269 ?auto_25270 ?auto_25271 )
      ( MAKE-3CRATE-VERIFY ?auto_25268 ?auto_25269 ?auto_25270 ?auto_25271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25278 - SURFACE
      ?auto_25279 - SURFACE
      ?auto_25280 - SURFACE
      ?auto_25281 - SURFACE
      ?auto_25282 - SURFACE
    )
    :vars
    (
      ?auto_25287 - HOIST
      ?auto_25284 - PLACE
      ?auto_25285 - PLACE
      ?auto_25288 - HOIST
      ?auto_25286 - SURFACE
      ?auto_25283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25287 ?auto_25284 ) ( IS-CRATE ?auto_25282 ) ( not ( = ?auto_25281 ?auto_25282 ) ) ( not ( = ?auto_25280 ?auto_25281 ) ) ( not ( = ?auto_25280 ?auto_25282 ) ) ( not ( = ?auto_25285 ?auto_25284 ) ) ( HOIST-AT ?auto_25288 ?auto_25285 ) ( not ( = ?auto_25287 ?auto_25288 ) ) ( AVAILABLE ?auto_25288 ) ( SURFACE-AT ?auto_25282 ?auto_25285 ) ( ON ?auto_25282 ?auto_25286 ) ( CLEAR ?auto_25282 ) ( not ( = ?auto_25281 ?auto_25286 ) ) ( not ( = ?auto_25282 ?auto_25286 ) ) ( not ( = ?auto_25280 ?auto_25286 ) ) ( TRUCK-AT ?auto_25283 ?auto_25284 ) ( SURFACE-AT ?auto_25280 ?auto_25284 ) ( CLEAR ?auto_25280 ) ( LIFTING ?auto_25287 ?auto_25281 ) ( IS-CRATE ?auto_25281 ) ( ON ?auto_25279 ?auto_25278 ) ( ON ?auto_25280 ?auto_25279 ) ( not ( = ?auto_25278 ?auto_25279 ) ) ( not ( = ?auto_25278 ?auto_25280 ) ) ( not ( = ?auto_25278 ?auto_25281 ) ) ( not ( = ?auto_25278 ?auto_25282 ) ) ( not ( = ?auto_25278 ?auto_25286 ) ) ( not ( = ?auto_25279 ?auto_25280 ) ) ( not ( = ?auto_25279 ?auto_25281 ) ) ( not ( = ?auto_25279 ?auto_25282 ) ) ( not ( = ?auto_25279 ?auto_25286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25280 ?auto_25281 ?auto_25282 )
      ( MAKE-4CRATE-VERIFY ?auto_25278 ?auto_25279 ?auto_25280 ?auto_25281 ?auto_25282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25289 - SURFACE
      ?auto_25290 - SURFACE
    )
    :vars
    (
      ?auto_25296 - HOIST
      ?auto_25293 - PLACE
      ?auto_25291 - SURFACE
      ?auto_25294 - PLACE
      ?auto_25297 - HOIST
      ?auto_25295 - SURFACE
      ?auto_25292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25296 ?auto_25293 ) ( IS-CRATE ?auto_25290 ) ( not ( = ?auto_25289 ?auto_25290 ) ) ( not ( = ?auto_25291 ?auto_25289 ) ) ( not ( = ?auto_25291 ?auto_25290 ) ) ( not ( = ?auto_25294 ?auto_25293 ) ) ( HOIST-AT ?auto_25297 ?auto_25294 ) ( not ( = ?auto_25296 ?auto_25297 ) ) ( AVAILABLE ?auto_25297 ) ( SURFACE-AT ?auto_25290 ?auto_25294 ) ( ON ?auto_25290 ?auto_25295 ) ( CLEAR ?auto_25290 ) ( not ( = ?auto_25289 ?auto_25295 ) ) ( not ( = ?auto_25290 ?auto_25295 ) ) ( not ( = ?auto_25291 ?auto_25295 ) ) ( TRUCK-AT ?auto_25292 ?auto_25293 ) ( SURFACE-AT ?auto_25291 ?auto_25293 ) ( CLEAR ?auto_25291 ) ( IS-CRATE ?auto_25289 ) ( AVAILABLE ?auto_25296 ) ( IN ?auto_25289 ?auto_25292 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25296 ?auto_25289 ?auto_25292 ?auto_25293 )
      ( MAKE-2CRATE ?auto_25291 ?auto_25289 ?auto_25290 )
      ( MAKE-1CRATE-VERIFY ?auto_25289 ?auto_25290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25298 - SURFACE
      ?auto_25299 - SURFACE
      ?auto_25300 - SURFACE
    )
    :vars
    (
      ?auto_25301 - HOIST
      ?auto_25302 - PLACE
      ?auto_25306 - PLACE
      ?auto_25303 - HOIST
      ?auto_25305 - SURFACE
      ?auto_25304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25301 ?auto_25302 ) ( IS-CRATE ?auto_25300 ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25306 ?auto_25302 ) ) ( HOIST-AT ?auto_25303 ?auto_25306 ) ( not ( = ?auto_25301 ?auto_25303 ) ) ( AVAILABLE ?auto_25303 ) ( SURFACE-AT ?auto_25300 ?auto_25306 ) ( ON ?auto_25300 ?auto_25305 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25299 ?auto_25305 ) ) ( not ( = ?auto_25300 ?auto_25305 ) ) ( not ( = ?auto_25298 ?auto_25305 ) ) ( TRUCK-AT ?auto_25304 ?auto_25302 ) ( SURFACE-AT ?auto_25298 ?auto_25302 ) ( CLEAR ?auto_25298 ) ( IS-CRATE ?auto_25299 ) ( AVAILABLE ?auto_25301 ) ( IN ?auto_25299 ?auto_25304 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25299 ?auto_25300 )
      ( MAKE-2CRATE-VERIFY ?auto_25298 ?auto_25299 ?auto_25300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25307 - SURFACE
      ?auto_25308 - SURFACE
      ?auto_25309 - SURFACE
      ?auto_25310 - SURFACE
    )
    :vars
    (
      ?auto_25313 - HOIST
      ?auto_25312 - PLACE
      ?auto_25316 - PLACE
      ?auto_25311 - HOIST
      ?auto_25314 - SURFACE
      ?auto_25315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25313 ?auto_25312 ) ( IS-CRATE ?auto_25310 ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25308 ?auto_25310 ) ) ( not ( = ?auto_25316 ?auto_25312 ) ) ( HOIST-AT ?auto_25311 ?auto_25316 ) ( not ( = ?auto_25313 ?auto_25311 ) ) ( AVAILABLE ?auto_25311 ) ( SURFACE-AT ?auto_25310 ?auto_25316 ) ( ON ?auto_25310 ?auto_25314 ) ( CLEAR ?auto_25310 ) ( not ( = ?auto_25309 ?auto_25314 ) ) ( not ( = ?auto_25310 ?auto_25314 ) ) ( not ( = ?auto_25308 ?auto_25314 ) ) ( TRUCK-AT ?auto_25315 ?auto_25312 ) ( SURFACE-AT ?auto_25308 ?auto_25312 ) ( CLEAR ?auto_25308 ) ( IS-CRATE ?auto_25309 ) ( AVAILABLE ?auto_25313 ) ( IN ?auto_25309 ?auto_25315 ) ( ON ?auto_25308 ?auto_25307 ) ( not ( = ?auto_25307 ?auto_25308 ) ) ( not ( = ?auto_25307 ?auto_25309 ) ) ( not ( = ?auto_25307 ?auto_25310 ) ) ( not ( = ?auto_25307 ?auto_25314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25308 ?auto_25309 ?auto_25310 )
      ( MAKE-3CRATE-VERIFY ?auto_25307 ?auto_25308 ?auto_25309 ?auto_25310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25317 - SURFACE
      ?auto_25318 - SURFACE
      ?auto_25319 - SURFACE
      ?auto_25320 - SURFACE
      ?auto_25321 - SURFACE
    )
    :vars
    (
      ?auto_25324 - HOIST
      ?auto_25323 - PLACE
      ?auto_25327 - PLACE
      ?auto_25322 - HOIST
      ?auto_25325 - SURFACE
      ?auto_25326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25324 ?auto_25323 ) ( IS-CRATE ?auto_25321 ) ( not ( = ?auto_25320 ?auto_25321 ) ) ( not ( = ?auto_25319 ?auto_25320 ) ) ( not ( = ?auto_25319 ?auto_25321 ) ) ( not ( = ?auto_25327 ?auto_25323 ) ) ( HOIST-AT ?auto_25322 ?auto_25327 ) ( not ( = ?auto_25324 ?auto_25322 ) ) ( AVAILABLE ?auto_25322 ) ( SURFACE-AT ?auto_25321 ?auto_25327 ) ( ON ?auto_25321 ?auto_25325 ) ( CLEAR ?auto_25321 ) ( not ( = ?auto_25320 ?auto_25325 ) ) ( not ( = ?auto_25321 ?auto_25325 ) ) ( not ( = ?auto_25319 ?auto_25325 ) ) ( TRUCK-AT ?auto_25326 ?auto_25323 ) ( SURFACE-AT ?auto_25319 ?auto_25323 ) ( CLEAR ?auto_25319 ) ( IS-CRATE ?auto_25320 ) ( AVAILABLE ?auto_25324 ) ( IN ?auto_25320 ?auto_25326 ) ( ON ?auto_25318 ?auto_25317 ) ( ON ?auto_25319 ?auto_25318 ) ( not ( = ?auto_25317 ?auto_25318 ) ) ( not ( = ?auto_25317 ?auto_25319 ) ) ( not ( = ?auto_25317 ?auto_25320 ) ) ( not ( = ?auto_25317 ?auto_25321 ) ) ( not ( = ?auto_25317 ?auto_25325 ) ) ( not ( = ?auto_25318 ?auto_25319 ) ) ( not ( = ?auto_25318 ?auto_25320 ) ) ( not ( = ?auto_25318 ?auto_25321 ) ) ( not ( = ?auto_25318 ?auto_25325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25319 ?auto_25320 ?auto_25321 )
      ( MAKE-4CRATE-VERIFY ?auto_25317 ?auto_25318 ?auto_25319 ?auto_25320 ?auto_25321 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25328 - SURFACE
      ?auto_25329 - SURFACE
    )
    :vars
    (
      ?auto_25333 - HOIST
      ?auto_25331 - PLACE
      ?auto_25332 - SURFACE
      ?auto_25336 - PLACE
      ?auto_25330 - HOIST
      ?auto_25334 - SURFACE
      ?auto_25335 - TRUCK
      ?auto_25337 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25333 ?auto_25331 ) ( IS-CRATE ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25329 ) ) ( not ( = ?auto_25332 ?auto_25328 ) ) ( not ( = ?auto_25332 ?auto_25329 ) ) ( not ( = ?auto_25336 ?auto_25331 ) ) ( HOIST-AT ?auto_25330 ?auto_25336 ) ( not ( = ?auto_25333 ?auto_25330 ) ) ( AVAILABLE ?auto_25330 ) ( SURFACE-AT ?auto_25329 ?auto_25336 ) ( ON ?auto_25329 ?auto_25334 ) ( CLEAR ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25334 ) ) ( not ( = ?auto_25329 ?auto_25334 ) ) ( not ( = ?auto_25332 ?auto_25334 ) ) ( SURFACE-AT ?auto_25332 ?auto_25331 ) ( CLEAR ?auto_25332 ) ( IS-CRATE ?auto_25328 ) ( AVAILABLE ?auto_25333 ) ( IN ?auto_25328 ?auto_25335 ) ( TRUCK-AT ?auto_25335 ?auto_25337 ) ( not ( = ?auto_25337 ?auto_25331 ) ) ( not ( = ?auto_25336 ?auto_25337 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25335 ?auto_25337 ?auto_25331 )
      ( MAKE-2CRATE ?auto_25332 ?auto_25328 ?auto_25329 )
      ( MAKE-1CRATE-VERIFY ?auto_25328 ?auto_25329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25338 - SURFACE
      ?auto_25339 - SURFACE
      ?auto_25340 - SURFACE
    )
    :vars
    (
      ?auto_25344 - HOIST
      ?auto_25343 - PLACE
      ?auto_25347 - PLACE
      ?auto_25345 - HOIST
      ?auto_25341 - SURFACE
      ?auto_25346 - TRUCK
      ?auto_25342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25344 ?auto_25343 ) ( IS-CRATE ?auto_25340 ) ( not ( = ?auto_25339 ?auto_25340 ) ) ( not ( = ?auto_25338 ?auto_25339 ) ) ( not ( = ?auto_25338 ?auto_25340 ) ) ( not ( = ?auto_25347 ?auto_25343 ) ) ( HOIST-AT ?auto_25345 ?auto_25347 ) ( not ( = ?auto_25344 ?auto_25345 ) ) ( AVAILABLE ?auto_25345 ) ( SURFACE-AT ?auto_25340 ?auto_25347 ) ( ON ?auto_25340 ?auto_25341 ) ( CLEAR ?auto_25340 ) ( not ( = ?auto_25339 ?auto_25341 ) ) ( not ( = ?auto_25340 ?auto_25341 ) ) ( not ( = ?auto_25338 ?auto_25341 ) ) ( SURFACE-AT ?auto_25338 ?auto_25343 ) ( CLEAR ?auto_25338 ) ( IS-CRATE ?auto_25339 ) ( AVAILABLE ?auto_25344 ) ( IN ?auto_25339 ?auto_25346 ) ( TRUCK-AT ?auto_25346 ?auto_25342 ) ( not ( = ?auto_25342 ?auto_25343 ) ) ( not ( = ?auto_25347 ?auto_25342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25339 ?auto_25340 )
      ( MAKE-2CRATE-VERIFY ?auto_25338 ?auto_25339 ?auto_25340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25348 - SURFACE
      ?auto_25349 - SURFACE
      ?auto_25350 - SURFACE
      ?auto_25351 - SURFACE
    )
    :vars
    (
      ?auto_25358 - HOIST
      ?auto_25356 - PLACE
      ?auto_25355 - PLACE
      ?auto_25357 - HOIST
      ?auto_25352 - SURFACE
      ?auto_25353 - TRUCK
      ?auto_25354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25358 ?auto_25356 ) ( IS-CRATE ?auto_25351 ) ( not ( = ?auto_25350 ?auto_25351 ) ) ( not ( = ?auto_25349 ?auto_25350 ) ) ( not ( = ?auto_25349 ?auto_25351 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( HOIST-AT ?auto_25357 ?auto_25355 ) ( not ( = ?auto_25358 ?auto_25357 ) ) ( AVAILABLE ?auto_25357 ) ( SURFACE-AT ?auto_25351 ?auto_25355 ) ( ON ?auto_25351 ?auto_25352 ) ( CLEAR ?auto_25351 ) ( not ( = ?auto_25350 ?auto_25352 ) ) ( not ( = ?auto_25351 ?auto_25352 ) ) ( not ( = ?auto_25349 ?auto_25352 ) ) ( SURFACE-AT ?auto_25349 ?auto_25356 ) ( CLEAR ?auto_25349 ) ( IS-CRATE ?auto_25350 ) ( AVAILABLE ?auto_25358 ) ( IN ?auto_25350 ?auto_25353 ) ( TRUCK-AT ?auto_25353 ?auto_25354 ) ( not ( = ?auto_25354 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25354 ) ) ( ON ?auto_25349 ?auto_25348 ) ( not ( = ?auto_25348 ?auto_25349 ) ) ( not ( = ?auto_25348 ?auto_25350 ) ) ( not ( = ?auto_25348 ?auto_25351 ) ) ( not ( = ?auto_25348 ?auto_25352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25349 ?auto_25350 ?auto_25351 )
      ( MAKE-3CRATE-VERIFY ?auto_25348 ?auto_25349 ?auto_25350 ?auto_25351 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25359 - SURFACE
      ?auto_25360 - SURFACE
      ?auto_25361 - SURFACE
      ?auto_25362 - SURFACE
      ?auto_25363 - SURFACE
    )
    :vars
    (
      ?auto_25370 - HOIST
      ?auto_25368 - PLACE
      ?auto_25367 - PLACE
      ?auto_25369 - HOIST
      ?auto_25364 - SURFACE
      ?auto_25365 - TRUCK
      ?auto_25366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25370 ?auto_25368 ) ( IS-CRATE ?auto_25363 ) ( not ( = ?auto_25362 ?auto_25363 ) ) ( not ( = ?auto_25361 ?auto_25362 ) ) ( not ( = ?auto_25361 ?auto_25363 ) ) ( not ( = ?auto_25367 ?auto_25368 ) ) ( HOIST-AT ?auto_25369 ?auto_25367 ) ( not ( = ?auto_25370 ?auto_25369 ) ) ( AVAILABLE ?auto_25369 ) ( SURFACE-AT ?auto_25363 ?auto_25367 ) ( ON ?auto_25363 ?auto_25364 ) ( CLEAR ?auto_25363 ) ( not ( = ?auto_25362 ?auto_25364 ) ) ( not ( = ?auto_25363 ?auto_25364 ) ) ( not ( = ?auto_25361 ?auto_25364 ) ) ( SURFACE-AT ?auto_25361 ?auto_25368 ) ( CLEAR ?auto_25361 ) ( IS-CRATE ?auto_25362 ) ( AVAILABLE ?auto_25370 ) ( IN ?auto_25362 ?auto_25365 ) ( TRUCK-AT ?auto_25365 ?auto_25366 ) ( not ( = ?auto_25366 ?auto_25368 ) ) ( not ( = ?auto_25367 ?auto_25366 ) ) ( ON ?auto_25360 ?auto_25359 ) ( ON ?auto_25361 ?auto_25360 ) ( not ( = ?auto_25359 ?auto_25360 ) ) ( not ( = ?auto_25359 ?auto_25361 ) ) ( not ( = ?auto_25359 ?auto_25362 ) ) ( not ( = ?auto_25359 ?auto_25363 ) ) ( not ( = ?auto_25359 ?auto_25364 ) ) ( not ( = ?auto_25360 ?auto_25361 ) ) ( not ( = ?auto_25360 ?auto_25362 ) ) ( not ( = ?auto_25360 ?auto_25363 ) ) ( not ( = ?auto_25360 ?auto_25364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25361 ?auto_25362 ?auto_25363 )
      ( MAKE-4CRATE-VERIFY ?auto_25359 ?auto_25360 ?auto_25361 ?auto_25362 ?auto_25363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25371 - SURFACE
      ?auto_25372 - SURFACE
    )
    :vars
    (
      ?auto_25380 - HOIST
      ?auto_25378 - PLACE
      ?auto_25377 - SURFACE
      ?auto_25376 - PLACE
      ?auto_25379 - HOIST
      ?auto_25373 - SURFACE
      ?auto_25374 - TRUCK
      ?auto_25375 - PLACE
      ?auto_25381 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25380 ?auto_25378 ) ( IS-CRATE ?auto_25372 ) ( not ( = ?auto_25371 ?auto_25372 ) ) ( not ( = ?auto_25377 ?auto_25371 ) ) ( not ( = ?auto_25377 ?auto_25372 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( HOIST-AT ?auto_25379 ?auto_25376 ) ( not ( = ?auto_25380 ?auto_25379 ) ) ( AVAILABLE ?auto_25379 ) ( SURFACE-AT ?auto_25372 ?auto_25376 ) ( ON ?auto_25372 ?auto_25373 ) ( CLEAR ?auto_25372 ) ( not ( = ?auto_25371 ?auto_25373 ) ) ( not ( = ?auto_25372 ?auto_25373 ) ) ( not ( = ?auto_25377 ?auto_25373 ) ) ( SURFACE-AT ?auto_25377 ?auto_25378 ) ( CLEAR ?auto_25377 ) ( IS-CRATE ?auto_25371 ) ( AVAILABLE ?auto_25380 ) ( TRUCK-AT ?auto_25374 ?auto_25375 ) ( not ( = ?auto_25375 ?auto_25378 ) ) ( not ( = ?auto_25376 ?auto_25375 ) ) ( HOIST-AT ?auto_25381 ?auto_25375 ) ( LIFTING ?auto_25381 ?auto_25371 ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( not ( = ?auto_25379 ?auto_25381 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25381 ?auto_25371 ?auto_25374 ?auto_25375 )
      ( MAKE-2CRATE ?auto_25377 ?auto_25371 ?auto_25372 )
      ( MAKE-1CRATE-VERIFY ?auto_25371 ?auto_25372 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25382 - SURFACE
      ?auto_25383 - SURFACE
      ?auto_25384 - SURFACE
    )
    :vars
    (
      ?auto_25389 - HOIST
      ?auto_25386 - PLACE
      ?auto_25390 - PLACE
      ?auto_25392 - HOIST
      ?auto_25388 - SURFACE
      ?auto_25391 - TRUCK
      ?auto_25385 - PLACE
      ?auto_25387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25389 ?auto_25386 ) ( IS-CRATE ?auto_25384 ) ( not ( = ?auto_25383 ?auto_25384 ) ) ( not ( = ?auto_25382 ?auto_25383 ) ) ( not ( = ?auto_25382 ?auto_25384 ) ) ( not ( = ?auto_25390 ?auto_25386 ) ) ( HOIST-AT ?auto_25392 ?auto_25390 ) ( not ( = ?auto_25389 ?auto_25392 ) ) ( AVAILABLE ?auto_25392 ) ( SURFACE-AT ?auto_25384 ?auto_25390 ) ( ON ?auto_25384 ?auto_25388 ) ( CLEAR ?auto_25384 ) ( not ( = ?auto_25383 ?auto_25388 ) ) ( not ( = ?auto_25384 ?auto_25388 ) ) ( not ( = ?auto_25382 ?auto_25388 ) ) ( SURFACE-AT ?auto_25382 ?auto_25386 ) ( CLEAR ?auto_25382 ) ( IS-CRATE ?auto_25383 ) ( AVAILABLE ?auto_25389 ) ( TRUCK-AT ?auto_25391 ?auto_25385 ) ( not ( = ?auto_25385 ?auto_25386 ) ) ( not ( = ?auto_25390 ?auto_25385 ) ) ( HOIST-AT ?auto_25387 ?auto_25385 ) ( LIFTING ?auto_25387 ?auto_25383 ) ( not ( = ?auto_25389 ?auto_25387 ) ) ( not ( = ?auto_25392 ?auto_25387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25383 ?auto_25384 )
      ( MAKE-2CRATE-VERIFY ?auto_25382 ?auto_25383 ?auto_25384 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25393 - SURFACE
      ?auto_25394 - SURFACE
      ?auto_25395 - SURFACE
      ?auto_25396 - SURFACE
    )
    :vars
    (
      ?auto_25400 - HOIST
      ?auto_25398 - PLACE
      ?auto_25404 - PLACE
      ?auto_25399 - HOIST
      ?auto_25397 - SURFACE
      ?auto_25402 - TRUCK
      ?auto_25403 - PLACE
      ?auto_25401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25400 ?auto_25398 ) ( IS-CRATE ?auto_25396 ) ( not ( = ?auto_25395 ?auto_25396 ) ) ( not ( = ?auto_25394 ?auto_25395 ) ) ( not ( = ?auto_25394 ?auto_25396 ) ) ( not ( = ?auto_25404 ?auto_25398 ) ) ( HOIST-AT ?auto_25399 ?auto_25404 ) ( not ( = ?auto_25400 ?auto_25399 ) ) ( AVAILABLE ?auto_25399 ) ( SURFACE-AT ?auto_25396 ?auto_25404 ) ( ON ?auto_25396 ?auto_25397 ) ( CLEAR ?auto_25396 ) ( not ( = ?auto_25395 ?auto_25397 ) ) ( not ( = ?auto_25396 ?auto_25397 ) ) ( not ( = ?auto_25394 ?auto_25397 ) ) ( SURFACE-AT ?auto_25394 ?auto_25398 ) ( CLEAR ?auto_25394 ) ( IS-CRATE ?auto_25395 ) ( AVAILABLE ?auto_25400 ) ( TRUCK-AT ?auto_25402 ?auto_25403 ) ( not ( = ?auto_25403 ?auto_25398 ) ) ( not ( = ?auto_25404 ?auto_25403 ) ) ( HOIST-AT ?auto_25401 ?auto_25403 ) ( LIFTING ?auto_25401 ?auto_25395 ) ( not ( = ?auto_25400 ?auto_25401 ) ) ( not ( = ?auto_25399 ?auto_25401 ) ) ( ON ?auto_25394 ?auto_25393 ) ( not ( = ?auto_25393 ?auto_25394 ) ) ( not ( = ?auto_25393 ?auto_25395 ) ) ( not ( = ?auto_25393 ?auto_25396 ) ) ( not ( = ?auto_25393 ?auto_25397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25394 ?auto_25395 ?auto_25396 )
      ( MAKE-3CRATE-VERIFY ?auto_25393 ?auto_25394 ?auto_25395 ?auto_25396 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25405 - SURFACE
      ?auto_25406 - SURFACE
      ?auto_25407 - SURFACE
      ?auto_25408 - SURFACE
      ?auto_25409 - SURFACE
    )
    :vars
    (
      ?auto_25413 - HOIST
      ?auto_25411 - PLACE
      ?auto_25417 - PLACE
      ?auto_25412 - HOIST
      ?auto_25410 - SURFACE
      ?auto_25415 - TRUCK
      ?auto_25416 - PLACE
      ?auto_25414 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25413 ?auto_25411 ) ( IS-CRATE ?auto_25409 ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25417 ?auto_25411 ) ) ( HOIST-AT ?auto_25412 ?auto_25417 ) ( not ( = ?auto_25413 ?auto_25412 ) ) ( AVAILABLE ?auto_25412 ) ( SURFACE-AT ?auto_25409 ?auto_25417 ) ( ON ?auto_25409 ?auto_25410 ) ( CLEAR ?auto_25409 ) ( not ( = ?auto_25408 ?auto_25410 ) ) ( not ( = ?auto_25409 ?auto_25410 ) ) ( not ( = ?auto_25407 ?auto_25410 ) ) ( SURFACE-AT ?auto_25407 ?auto_25411 ) ( CLEAR ?auto_25407 ) ( IS-CRATE ?auto_25408 ) ( AVAILABLE ?auto_25413 ) ( TRUCK-AT ?auto_25415 ?auto_25416 ) ( not ( = ?auto_25416 ?auto_25411 ) ) ( not ( = ?auto_25417 ?auto_25416 ) ) ( HOIST-AT ?auto_25414 ?auto_25416 ) ( LIFTING ?auto_25414 ?auto_25408 ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25412 ?auto_25414 ) ) ( ON ?auto_25406 ?auto_25405 ) ( ON ?auto_25407 ?auto_25406 ) ( not ( = ?auto_25405 ?auto_25406 ) ) ( not ( = ?auto_25405 ?auto_25407 ) ) ( not ( = ?auto_25405 ?auto_25408 ) ) ( not ( = ?auto_25405 ?auto_25409 ) ) ( not ( = ?auto_25405 ?auto_25410 ) ) ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( not ( = ?auto_25406 ?auto_25409 ) ) ( not ( = ?auto_25406 ?auto_25410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25407 ?auto_25408 ?auto_25409 )
      ( MAKE-4CRATE-VERIFY ?auto_25405 ?auto_25406 ?auto_25407 ?auto_25408 ?auto_25409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25418 - SURFACE
      ?auto_25419 - SURFACE
    )
    :vars
    (
      ?auto_25424 - HOIST
      ?auto_25421 - PLACE
      ?auto_25422 - SURFACE
      ?auto_25428 - PLACE
      ?auto_25423 - HOIST
      ?auto_25420 - SURFACE
      ?auto_25426 - TRUCK
      ?auto_25427 - PLACE
      ?auto_25425 - HOIST
      ?auto_25429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25424 ?auto_25421 ) ( IS-CRATE ?auto_25419 ) ( not ( = ?auto_25418 ?auto_25419 ) ) ( not ( = ?auto_25422 ?auto_25418 ) ) ( not ( = ?auto_25422 ?auto_25419 ) ) ( not ( = ?auto_25428 ?auto_25421 ) ) ( HOIST-AT ?auto_25423 ?auto_25428 ) ( not ( = ?auto_25424 ?auto_25423 ) ) ( AVAILABLE ?auto_25423 ) ( SURFACE-AT ?auto_25419 ?auto_25428 ) ( ON ?auto_25419 ?auto_25420 ) ( CLEAR ?auto_25419 ) ( not ( = ?auto_25418 ?auto_25420 ) ) ( not ( = ?auto_25419 ?auto_25420 ) ) ( not ( = ?auto_25422 ?auto_25420 ) ) ( SURFACE-AT ?auto_25422 ?auto_25421 ) ( CLEAR ?auto_25422 ) ( IS-CRATE ?auto_25418 ) ( AVAILABLE ?auto_25424 ) ( TRUCK-AT ?auto_25426 ?auto_25427 ) ( not ( = ?auto_25427 ?auto_25421 ) ) ( not ( = ?auto_25428 ?auto_25427 ) ) ( HOIST-AT ?auto_25425 ?auto_25427 ) ( not ( = ?auto_25424 ?auto_25425 ) ) ( not ( = ?auto_25423 ?auto_25425 ) ) ( AVAILABLE ?auto_25425 ) ( SURFACE-AT ?auto_25418 ?auto_25427 ) ( ON ?auto_25418 ?auto_25429 ) ( CLEAR ?auto_25418 ) ( not ( = ?auto_25418 ?auto_25429 ) ) ( not ( = ?auto_25419 ?auto_25429 ) ) ( not ( = ?auto_25422 ?auto_25429 ) ) ( not ( = ?auto_25420 ?auto_25429 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25425 ?auto_25418 ?auto_25429 ?auto_25427 )
      ( MAKE-2CRATE ?auto_25422 ?auto_25418 ?auto_25419 )
      ( MAKE-1CRATE-VERIFY ?auto_25418 ?auto_25419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25430 - SURFACE
      ?auto_25431 - SURFACE
      ?auto_25432 - SURFACE
    )
    :vars
    (
      ?auto_25440 - HOIST
      ?auto_25434 - PLACE
      ?auto_25436 - PLACE
      ?auto_25437 - HOIST
      ?auto_25438 - SURFACE
      ?auto_25435 - TRUCK
      ?auto_25439 - PLACE
      ?auto_25433 - HOIST
      ?auto_25441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25440 ?auto_25434 ) ( IS-CRATE ?auto_25432 ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25430 ?auto_25431 ) ) ( not ( = ?auto_25430 ?auto_25432 ) ) ( not ( = ?auto_25436 ?auto_25434 ) ) ( HOIST-AT ?auto_25437 ?auto_25436 ) ( not ( = ?auto_25440 ?auto_25437 ) ) ( AVAILABLE ?auto_25437 ) ( SURFACE-AT ?auto_25432 ?auto_25436 ) ( ON ?auto_25432 ?auto_25438 ) ( CLEAR ?auto_25432 ) ( not ( = ?auto_25431 ?auto_25438 ) ) ( not ( = ?auto_25432 ?auto_25438 ) ) ( not ( = ?auto_25430 ?auto_25438 ) ) ( SURFACE-AT ?auto_25430 ?auto_25434 ) ( CLEAR ?auto_25430 ) ( IS-CRATE ?auto_25431 ) ( AVAILABLE ?auto_25440 ) ( TRUCK-AT ?auto_25435 ?auto_25439 ) ( not ( = ?auto_25439 ?auto_25434 ) ) ( not ( = ?auto_25436 ?auto_25439 ) ) ( HOIST-AT ?auto_25433 ?auto_25439 ) ( not ( = ?auto_25440 ?auto_25433 ) ) ( not ( = ?auto_25437 ?auto_25433 ) ) ( AVAILABLE ?auto_25433 ) ( SURFACE-AT ?auto_25431 ?auto_25439 ) ( ON ?auto_25431 ?auto_25441 ) ( CLEAR ?auto_25431 ) ( not ( = ?auto_25431 ?auto_25441 ) ) ( not ( = ?auto_25432 ?auto_25441 ) ) ( not ( = ?auto_25430 ?auto_25441 ) ) ( not ( = ?auto_25438 ?auto_25441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25431 ?auto_25432 )
      ( MAKE-2CRATE-VERIFY ?auto_25430 ?auto_25431 ?auto_25432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25442 - SURFACE
      ?auto_25443 - SURFACE
      ?auto_25444 - SURFACE
      ?auto_25445 - SURFACE
    )
    :vars
    (
      ?auto_25446 - HOIST
      ?auto_25454 - PLACE
      ?auto_25452 - PLACE
      ?auto_25453 - HOIST
      ?auto_25449 - SURFACE
      ?auto_25448 - TRUCK
      ?auto_25447 - PLACE
      ?auto_25450 - HOIST
      ?auto_25451 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25446 ?auto_25454 ) ( IS-CRATE ?auto_25445 ) ( not ( = ?auto_25444 ?auto_25445 ) ) ( not ( = ?auto_25443 ?auto_25444 ) ) ( not ( = ?auto_25443 ?auto_25445 ) ) ( not ( = ?auto_25452 ?auto_25454 ) ) ( HOIST-AT ?auto_25453 ?auto_25452 ) ( not ( = ?auto_25446 ?auto_25453 ) ) ( AVAILABLE ?auto_25453 ) ( SURFACE-AT ?auto_25445 ?auto_25452 ) ( ON ?auto_25445 ?auto_25449 ) ( CLEAR ?auto_25445 ) ( not ( = ?auto_25444 ?auto_25449 ) ) ( not ( = ?auto_25445 ?auto_25449 ) ) ( not ( = ?auto_25443 ?auto_25449 ) ) ( SURFACE-AT ?auto_25443 ?auto_25454 ) ( CLEAR ?auto_25443 ) ( IS-CRATE ?auto_25444 ) ( AVAILABLE ?auto_25446 ) ( TRUCK-AT ?auto_25448 ?auto_25447 ) ( not ( = ?auto_25447 ?auto_25454 ) ) ( not ( = ?auto_25452 ?auto_25447 ) ) ( HOIST-AT ?auto_25450 ?auto_25447 ) ( not ( = ?auto_25446 ?auto_25450 ) ) ( not ( = ?auto_25453 ?auto_25450 ) ) ( AVAILABLE ?auto_25450 ) ( SURFACE-AT ?auto_25444 ?auto_25447 ) ( ON ?auto_25444 ?auto_25451 ) ( CLEAR ?auto_25444 ) ( not ( = ?auto_25444 ?auto_25451 ) ) ( not ( = ?auto_25445 ?auto_25451 ) ) ( not ( = ?auto_25443 ?auto_25451 ) ) ( not ( = ?auto_25449 ?auto_25451 ) ) ( ON ?auto_25443 ?auto_25442 ) ( not ( = ?auto_25442 ?auto_25443 ) ) ( not ( = ?auto_25442 ?auto_25444 ) ) ( not ( = ?auto_25442 ?auto_25445 ) ) ( not ( = ?auto_25442 ?auto_25449 ) ) ( not ( = ?auto_25442 ?auto_25451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25443 ?auto_25444 ?auto_25445 )
      ( MAKE-3CRATE-VERIFY ?auto_25442 ?auto_25443 ?auto_25444 ?auto_25445 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25455 - SURFACE
      ?auto_25456 - SURFACE
      ?auto_25457 - SURFACE
      ?auto_25458 - SURFACE
      ?auto_25459 - SURFACE
    )
    :vars
    (
      ?auto_25460 - HOIST
      ?auto_25468 - PLACE
      ?auto_25466 - PLACE
      ?auto_25467 - HOIST
      ?auto_25463 - SURFACE
      ?auto_25462 - TRUCK
      ?auto_25461 - PLACE
      ?auto_25464 - HOIST
      ?auto_25465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25460 ?auto_25468 ) ( IS-CRATE ?auto_25459 ) ( not ( = ?auto_25458 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25458 ) ) ( not ( = ?auto_25457 ?auto_25459 ) ) ( not ( = ?auto_25466 ?auto_25468 ) ) ( HOIST-AT ?auto_25467 ?auto_25466 ) ( not ( = ?auto_25460 ?auto_25467 ) ) ( AVAILABLE ?auto_25467 ) ( SURFACE-AT ?auto_25459 ?auto_25466 ) ( ON ?auto_25459 ?auto_25463 ) ( CLEAR ?auto_25459 ) ( not ( = ?auto_25458 ?auto_25463 ) ) ( not ( = ?auto_25459 ?auto_25463 ) ) ( not ( = ?auto_25457 ?auto_25463 ) ) ( SURFACE-AT ?auto_25457 ?auto_25468 ) ( CLEAR ?auto_25457 ) ( IS-CRATE ?auto_25458 ) ( AVAILABLE ?auto_25460 ) ( TRUCK-AT ?auto_25462 ?auto_25461 ) ( not ( = ?auto_25461 ?auto_25468 ) ) ( not ( = ?auto_25466 ?auto_25461 ) ) ( HOIST-AT ?auto_25464 ?auto_25461 ) ( not ( = ?auto_25460 ?auto_25464 ) ) ( not ( = ?auto_25467 ?auto_25464 ) ) ( AVAILABLE ?auto_25464 ) ( SURFACE-AT ?auto_25458 ?auto_25461 ) ( ON ?auto_25458 ?auto_25465 ) ( CLEAR ?auto_25458 ) ( not ( = ?auto_25458 ?auto_25465 ) ) ( not ( = ?auto_25459 ?auto_25465 ) ) ( not ( = ?auto_25457 ?auto_25465 ) ) ( not ( = ?auto_25463 ?auto_25465 ) ) ( ON ?auto_25456 ?auto_25455 ) ( ON ?auto_25457 ?auto_25456 ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25458 ) ) ( not ( = ?auto_25455 ?auto_25459 ) ) ( not ( = ?auto_25455 ?auto_25463 ) ) ( not ( = ?auto_25455 ?auto_25465 ) ) ( not ( = ?auto_25456 ?auto_25457 ) ) ( not ( = ?auto_25456 ?auto_25458 ) ) ( not ( = ?auto_25456 ?auto_25459 ) ) ( not ( = ?auto_25456 ?auto_25463 ) ) ( not ( = ?auto_25456 ?auto_25465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25457 ?auto_25458 ?auto_25459 )
      ( MAKE-4CRATE-VERIFY ?auto_25455 ?auto_25456 ?auto_25457 ?auto_25458 ?auto_25459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25469 - SURFACE
      ?auto_25470 - SURFACE
    )
    :vars
    (
      ?auto_25471 - HOIST
      ?auto_25480 - PLACE
      ?auto_25473 - SURFACE
      ?auto_25478 - PLACE
      ?auto_25479 - HOIST
      ?auto_25475 - SURFACE
      ?auto_25472 - PLACE
      ?auto_25476 - HOIST
      ?auto_25477 - SURFACE
      ?auto_25474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25471 ?auto_25480 ) ( IS-CRATE ?auto_25470 ) ( not ( = ?auto_25469 ?auto_25470 ) ) ( not ( = ?auto_25473 ?auto_25469 ) ) ( not ( = ?auto_25473 ?auto_25470 ) ) ( not ( = ?auto_25478 ?auto_25480 ) ) ( HOIST-AT ?auto_25479 ?auto_25478 ) ( not ( = ?auto_25471 ?auto_25479 ) ) ( AVAILABLE ?auto_25479 ) ( SURFACE-AT ?auto_25470 ?auto_25478 ) ( ON ?auto_25470 ?auto_25475 ) ( CLEAR ?auto_25470 ) ( not ( = ?auto_25469 ?auto_25475 ) ) ( not ( = ?auto_25470 ?auto_25475 ) ) ( not ( = ?auto_25473 ?auto_25475 ) ) ( SURFACE-AT ?auto_25473 ?auto_25480 ) ( CLEAR ?auto_25473 ) ( IS-CRATE ?auto_25469 ) ( AVAILABLE ?auto_25471 ) ( not ( = ?auto_25472 ?auto_25480 ) ) ( not ( = ?auto_25478 ?auto_25472 ) ) ( HOIST-AT ?auto_25476 ?auto_25472 ) ( not ( = ?auto_25471 ?auto_25476 ) ) ( not ( = ?auto_25479 ?auto_25476 ) ) ( AVAILABLE ?auto_25476 ) ( SURFACE-AT ?auto_25469 ?auto_25472 ) ( ON ?auto_25469 ?auto_25477 ) ( CLEAR ?auto_25469 ) ( not ( = ?auto_25469 ?auto_25477 ) ) ( not ( = ?auto_25470 ?auto_25477 ) ) ( not ( = ?auto_25473 ?auto_25477 ) ) ( not ( = ?auto_25475 ?auto_25477 ) ) ( TRUCK-AT ?auto_25474 ?auto_25480 ) )
    :subtasks
    ( ( !DRIVE ?auto_25474 ?auto_25480 ?auto_25472 )
      ( MAKE-2CRATE ?auto_25473 ?auto_25469 ?auto_25470 )
      ( MAKE-1CRATE-VERIFY ?auto_25469 ?auto_25470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25481 - SURFACE
      ?auto_25482 - SURFACE
      ?auto_25483 - SURFACE
    )
    :vars
    (
      ?auto_25491 - HOIST
      ?auto_25484 - PLACE
      ?auto_25492 - PLACE
      ?auto_25487 - HOIST
      ?auto_25486 - SURFACE
      ?auto_25490 - PLACE
      ?auto_25489 - HOIST
      ?auto_25488 - SURFACE
      ?auto_25485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25491 ?auto_25484 ) ( IS-CRATE ?auto_25483 ) ( not ( = ?auto_25482 ?auto_25483 ) ) ( not ( = ?auto_25481 ?auto_25482 ) ) ( not ( = ?auto_25481 ?auto_25483 ) ) ( not ( = ?auto_25492 ?auto_25484 ) ) ( HOIST-AT ?auto_25487 ?auto_25492 ) ( not ( = ?auto_25491 ?auto_25487 ) ) ( AVAILABLE ?auto_25487 ) ( SURFACE-AT ?auto_25483 ?auto_25492 ) ( ON ?auto_25483 ?auto_25486 ) ( CLEAR ?auto_25483 ) ( not ( = ?auto_25482 ?auto_25486 ) ) ( not ( = ?auto_25483 ?auto_25486 ) ) ( not ( = ?auto_25481 ?auto_25486 ) ) ( SURFACE-AT ?auto_25481 ?auto_25484 ) ( CLEAR ?auto_25481 ) ( IS-CRATE ?auto_25482 ) ( AVAILABLE ?auto_25491 ) ( not ( = ?auto_25490 ?auto_25484 ) ) ( not ( = ?auto_25492 ?auto_25490 ) ) ( HOIST-AT ?auto_25489 ?auto_25490 ) ( not ( = ?auto_25491 ?auto_25489 ) ) ( not ( = ?auto_25487 ?auto_25489 ) ) ( AVAILABLE ?auto_25489 ) ( SURFACE-AT ?auto_25482 ?auto_25490 ) ( ON ?auto_25482 ?auto_25488 ) ( CLEAR ?auto_25482 ) ( not ( = ?auto_25482 ?auto_25488 ) ) ( not ( = ?auto_25483 ?auto_25488 ) ) ( not ( = ?auto_25481 ?auto_25488 ) ) ( not ( = ?auto_25486 ?auto_25488 ) ) ( TRUCK-AT ?auto_25485 ?auto_25484 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25482 ?auto_25483 )
      ( MAKE-2CRATE-VERIFY ?auto_25481 ?auto_25482 ?auto_25483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25493 - SURFACE
      ?auto_25494 - SURFACE
      ?auto_25495 - SURFACE
      ?auto_25496 - SURFACE
    )
    :vars
    (
      ?auto_25501 - HOIST
      ?auto_25500 - PLACE
      ?auto_25497 - PLACE
      ?auto_25498 - HOIST
      ?auto_25502 - SURFACE
      ?auto_25499 - PLACE
      ?auto_25503 - HOIST
      ?auto_25505 - SURFACE
      ?auto_25504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25501 ?auto_25500 ) ( IS-CRATE ?auto_25496 ) ( not ( = ?auto_25495 ?auto_25496 ) ) ( not ( = ?auto_25494 ?auto_25495 ) ) ( not ( = ?auto_25494 ?auto_25496 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( HOIST-AT ?auto_25498 ?auto_25497 ) ( not ( = ?auto_25501 ?auto_25498 ) ) ( AVAILABLE ?auto_25498 ) ( SURFACE-AT ?auto_25496 ?auto_25497 ) ( ON ?auto_25496 ?auto_25502 ) ( CLEAR ?auto_25496 ) ( not ( = ?auto_25495 ?auto_25502 ) ) ( not ( = ?auto_25496 ?auto_25502 ) ) ( not ( = ?auto_25494 ?auto_25502 ) ) ( SURFACE-AT ?auto_25494 ?auto_25500 ) ( CLEAR ?auto_25494 ) ( IS-CRATE ?auto_25495 ) ( AVAILABLE ?auto_25501 ) ( not ( = ?auto_25499 ?auto_25500 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) ( HOIST-AT ?auto_25503 ?auto_25499 ) ( not ( = ?auto_25501 ?auto_25503 ) ) ( not ( = ?auto_25498 ?auto_25503 ) ) ( AVAILABLE ?auto_25503 ) ( SURFACE-AT ?auto_25495 ?auto_25499 ) ( ON ?auto_25495 ?auto_25505 ) ( CLEAR ?auto_25495 ) ( not ( = ?auto_25495 ?auto_25505 ) ) ( not ( = ?auto_25496 ?auto_25505 ) ) ( not ( = ?auto_25494 ?auto_25505 ) ) ( not ( = ?auto_25502 ?auto_25505 ) ) ( TRUCK-AT ?auto_25504 ?auto_25500 ) ( ON ?auto_25494 ?auto_25493 ) ( not ( = ?auto_25493 ?auto_25494 ) ) ( not ( = ?auto_25493 ?auto_25495 ) ) ( not ( = ?auto_25493 ?auto_25496 ) ) ( not ( = ?auto_25493 ?auto_25502 ) ) ( not ( = ?auto_25493 ?auto_25505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25494 ?auto_25495 ?auto_25496 )
      ( MAKE-3CRATE-VERIFY ?auto_25493 ?auto_25494 ?auto_25495 ?auto_25496 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25506 - SURFACE
      ?auto_25507 - SURFACE
      ?auto_25508 - SURFACE
      ?auto_25509 - SURFACE
      ?auto_25510 - SURFACE
    )
    :vars
    (
      ?auto_25515 - HOIST
      ?auto_25514 - PLACE
      ?auto_25511 - PLACE
      ?auto_25512 - HOIST
      ?auto_25516 - SURFACE
      ?auto_25513 - PLACE
      ?auto_25517 - HOIST
      ?auto_25519 - SURFACE
      ?auto_25518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25515 ?auto_25514 ) ( IS-CRATE ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25510 ) ) ( not ( = ?auto_25508 ?auto_25509 ) ) ( not ( = ?auto_25508 ?auto_25510 ) ) ( not ( = ?auto_25511 ?auto_25514 ) ) ( HOIST-AT ?auto_25512 ?auto_25511 ) ( not ( = ?auto_25515 ?auto_25512 ) ) ( AVAILABLE ?auto_25512 ) ( SURFACE-AT ?auto_25510 ?auto_25511 ) ( ON ?auto_25510 ?auto_25516 ) ( CLEAR ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25516 ) ) ( not ( = ?auto_25510 ?auto_25516 ) ) ( not ( = ?auto_25508 ?auto_25516 ) ) ( SURFACE-AT ?auto_25508 ?auto_25514 ) ( CLEAR ?auto_25508 ) ( IS-CRATE ?auto_25509 ) ( AVAILABLE ?auto_25515 ) ( not ( = ?auto_25513 ?auto_25514 ) ) ( not ( = ?auto_25511 ?auto_25513 ) ) ( HOIST-AT ?auto_25517 ?auto_25513 ) ( not ( = ?auto_25515 ?auto_25517 ) ) ( not ( = ?auto_25512 ?auto_25517 ) ) ( AVAILABLE ?auto_25517 ) ( SURFACE-AT ?auto_25509 ?auto_25513 ) ( ON ?auto_25509 ?auto_25519 ) ( CLEAR ?auto_25509 ) ( not ( = ?auto_25509 ?auto_25519 ) ) ( not ( = ?auto_25510 ?auto_25519 ) ) ( not ( = ?auto_25508 ?auto_25519 ) ) ( not ( = ?auto_25516 ?auto_25519 ) ) ( TRUCK-AT ?auto_25518 ?auto_25514 ) ( ON ?auto_25507 ?auto_25506 ) ( ON ?auto_25508 ?auto_25507 ) ( not ( = ?auto_25506 ?auto_25507 ) ) ( not ( = ?auto_25506 ?auto_25508 ) ) ( not ( = ?auto_25506 ?auto_25509 ) ) ( not ( = ?auto_25506 ?auto_25510 ) ) ( not ( = ?auto_25506 ?auto_25516 ) ) ( not ( = ?auto_25506 ?auto_25519 ) ) ( not ( = ?auto_25507 ?auto_25508 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25510 ) ) ( not ( = ?auto_25507 ?auto_25516 ) ) ( not ( = ?auto_25507 ?auto_25519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25508 ?auto_25509 ?auto_25510 )
      ( MAKE-4CRATE-VERIFY ?auto_25506 ?auto_25507 ?auto_25508 ?auto_25509 ?auto_25510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25520 - SURFACE
      ?auto_25521 - SURFACE
    )
    :vars
    (
      ?auto_25526 - HOIST
      ?auto_25525 - PLACE
      ?auto_25529 - SURFACE
      ?auto_25522 - PLACE
      ?auto_25523 - HOIST
      ?auto_25527 - SURFACE
      ?auto_25524 - PLACE
      ?auto_25528 - HOIST
      ?auto_25531 - SURFACE
      ?auto_25530 - TRUCK
      ?auto_25532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25526 ?auto_25525 ) ( IS-CRATE ?auto_25521 ) ( not ( = ?auto_25520 ?auto_25521 ) ) ( not ( = ?auto_25529 ?auto_25520 ) ) ( not ( = ?auto_25529 ?auto_25521 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( HOIST-AT ?auto_25523 ?auto_25522 ) ( not ( = ?auto_25526 ?auto_25523 ) ) ( AVAILABLE ?auto_25523 ) ( SURFACE-AT ?auto_25521 ?auto_25522 ) ( ON ?auto_25521 ?auto_25527 ) ( CLEAR ?auto_25521 ) ( not ( = ?auto_25520 ?auto_25527 ) ) ( not ( = ?auto_25521 ?auto_25527 ) ) ( not ( = ?auto_25529 ?auto_25527 ) ) ( IS-CRATE ?auto_25520 ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( HOIST-AT ?auto_25528 ?auto_25524 ) ( not ( = ?auto_25526 ?auto_25528 ) ) ( not ( = ?auto_25523 ?auto_25528 ) ) ( AVAILABLE ?auto_25528 ) ( SURFACE-AT ?auto_25520 ?auto_25524 ) ( ON ?auto_25520 ?auto_25531 ) ( CLEAR ?auto_25520 ) ( not ( = ?auto_25520 ?auto_25531 ) ) ( not ( = ?auto_25521 ?auto_25531 ) ) ( not ( = ?auto_25529 ?auto_25531 ) ) ( not ( = ?auto_25527 ?auto_25531 ) ) ( TRUCK-AT ?auto_25530 ?auto_25525 ) ( SURFACE-AT ?auto_25532 ?auto_25525 ) ( CLEAR ?auto_25532 ) ( LIFTING ?auto_25526 ?auto_25529 ) ( IS-CRATE ?auto_25529 ) ( not ( = ?auto_25532 ?auto_25529 ) ) ( not ( = ?auto_25520 ?auto_25532 ) ) ( not ( = ?auto_25521 ?auto_25532 ) ) ( not ( = ?auto_25527 ?auto_25532 ) ) ( not ( = ?auto_25531 ?auto_25532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25532 ?auto_25529 )
      ( MAKE-2CRATE ?auto_25529 ?auto_25520 ?auto_25521 )
      ( MAKE-1CRATE-VERIFY ?auto_25520 ?auto_25521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25533 - SURFACE
      ?auto_25534 - SURFACE
      ?auto_25535 - SURFACE
    )
    :vars
    (
      ?auto_25544 - HOIST
      ?auto_25538 - PLACE
      ?auto_25537 - PLACE
      ?auto_25536 - HOIST
      ?auto_25545 - SURFACE
      ?auto_25539 - PLACE
      ?auto_25542 - HOIST
      ?auto_25540 - SURFACE
      ?auto_25541 - TRUCK
      ?auto_25543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25544 ?auto_25538 ) ( IS-CRATE ?auto_25535 ) ( not ( = ?auto_25534 ?auto_25535 ) ) ( not ( = ?auto_25533 ?auto_25534 ) ) ( not ( = ?auto_25533 ?auto_25535 ) ) ( not ( = ?auto_25537 ?auto_25538 ) ) ( HOIST-AT ?auto_25536 ?auto_25537 ) ( not ( = ?auto_25544 ?auto_25536 ) ) ( AVAILABLE ?auto_25536 ) ( SURFACE-AT ?auto_25535 ?auto_25537 ) ( ON ?auto_25535 ?auto_25545 ) ( CLEAR ?auto_25535 ) ( not ( = ?auto_25534 ?auto_25545 ) ) ( not ( = ?auto_25535 ?auto_25545 ) ) ( not ( = ?auto_25533 ?auto_25545 ) ) ( IS-CRATE ?auto_25534 ) ( not ( = ?auto_25539 ?auto_25538 ) ) ( not ( = ?auto_25537 ?auto_25539 ) ) ( HOIST-AT ?auto_25542 ?auto_25539 ) ( not ( = ?auto_25544 ?auto_25542 ) ) ( not ( = ?auto_25536 ?auto_25542 ) ) ( AVAILABLE ?auto_25542 ) ( SURFACE-AT ?auto_25534 ?auto_25539 ) ( ON ?auto_25534 ?auto_25540 ) ( CLEAR ?auto_25534 ) ( not ( = ?auto_25534 ?auto_25540 ) ) ( not ( = ?auto_25535 ?auto_25540 ) ) ( not ( = ?auto_25533 ?auto_25540 ) ) ( not ( = ?auto_25545 ?auto_25540 ) ) ( TRUCK-AT ?auto_25541 ?auto_25538 ) ( SURFACE-AT ?auto_25543 ?auto_25538 ) ( CLEAR ?auto_25543 ) ( LIFTING ?auto_25544 ?auto_25533 ) ( IS-CRATE ?auto_25533 ) ( not ( = ?auto_25543 ?auto_25533 ) ) ( not ( = ?auto_25534 ?auto_25543 ) ) ( not ( = ?auto_25535 ?auto_25543 ) ) ( not ( = ?auto_25545 ?auto_25543 ) ) ( not ( = ?auto_25540 ?auto_25543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25534 ?auto_25535 )
      ( MAKE-2CRATE-VERIFY ?auto_25533 ?auto_25534 ?auto_25535 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25546 - SURFACE
      ?auto_25547 - SURFACE
      ?auto_25548 - SURFACE
      ?auto_25549 - SURFACE
    )
    :vars
    (
      ?auto_25553 - HOIST
      ?auto_25558 - PLACE
      ?auto_25555 - PLACE
      ?auto_25554 - HOIST
      ?auto_25550 - SURFACE
      ?auto_25551 - PLACE
      ?auto_25557 - HOIST
      ?auto_25556 - SURFACE
      ?auto_25552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25553 ?auto_25558 ) ( IS-CRATE ?auto_25549 ) ( not ( = ?auto_25548 ?auto_25549 ) ) ( not ( = ?auto_25547 ?auto_25548 ) ) ( not ( = ?auto_25547 ?auto_25549 ) ) ( not ( = ?auto_25555 ?auto_25558 ) ) ( HOIST-AT ?auto_25554 ?auto_25555 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( AVAILABLE ?auto_25554 ) ( SURFACE-AT ?auto_25549 ?auto_25555 ) ( ON ?auto_25549 ?auto_25550 ) ( CLEAR ?auto_25549 ) ( not ( = ?auto_25548 ?auto_25550 ) ) ( not ( = ?auto_25549 ?auto_25550 ) ) ( not ( = ?auto_25547 ?auto_25550 ) ) ( IS-CRATE ?auto_25548 ) ( not ( = ?auto_25551 ?auto_25558 ) ) ( not ( = ?auto_25555 ?auto_25551 ) ) ( HOIST-AT ?auto_25557 ?auto_25551 ) ( not ( = ?auto_25553 ?auto_25557 ) ) ( not ( = ?auto_25554 ?auto_25557 ) ) ( AVAILABLE ?auto_25557 ) ( SURFACE-AT ?auto_25548 ?auto_25551 ) ( ON ?auto_25548 ?auto_25556 ) ( CLEAR ?auto_25548 ) ( not ( = ?auto_25548 ?auto_25556 ) ) ( not ( = ?auto_25549 ?auto_25556 ) ) ( not ( = ?auto_25547 ?auto_25556 ) ) ( not ( = ?auto_25550 ?auto_25556 ) ) ( TRUCK-AT ?auto_25552 ?auto_25558 ) ( SURFACE-AT ?auto_25546 ?auto_25558 ) ( CLEAR ?auto_25546 ) ( LIFTING ?auto_25553 ?auto_25547 ) ( IS-CRATE ?auto_25547 ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25548 ?auto_25546 ) ) ( not ( = ?auto_25549 ?auto_25546 ) ) ( not ( = ?auto_25550 ?auto_25546 ) ) ( not ( = ?auto_25556 ?auto_25546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25547 ?auto_25548 ?auto_25549 )
      ( MAKE-3CRATE-VERIFY ?auto_25546 ?auto_25547 ?auto_25548 ?auto_25549 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25559 - SURFACE
      ?auto_25560 - SURFACE
      ?auto_25561 - SURFACE
      ?auto_25562 - SURFACE
      ?auto_25563 - SURFACE
    )
    :vars
    (
      ?auto_25567 - HOIST
      ?auto_25572 - PLACE
      ?auto_25569 - PLACE
      ?auto_25568 - HOIST
      ?auto_25564 - SURFACE
      ?auto_25565 - PLACE
      ?auto_25571 - HOIST
      ?auto_25570 - SURFACE
      ?auto_25566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25567 ?auto_25572 ) ( IS-CRATE ?auto_25563 ) ( not ( = ?auto_25562 ?auto_25563 ) ) ( not ( = ?auto_25561 ?auto_25562 ) ) ( not ( = ?auto_25561 ?auto_25563 ) ) ( not ( = ?auto_25569 ?auto_25572 ) ) ( HOIST-AT ?auto_25568 ?auto_25569 ) ( not ( = ?auto_25567 ?auto_25568 ) ) ( AVAILABLE ?auto_25568 ) ( SURFACE-AT ?auto_25563 ?auto_25569 ) ( ON ?auto_25563 ?auto_25564 ) ( CLEAR ?auto_25563 ) ( not ( = ?auto_25562 ?auto_25564 ) ) ( not ( = ?auto_25563 ?auto_25564 ) ) ( not ( = ?auto_25561 ?auto_25564 ) ) ( IS-CRATE ?auto_25562 ) ( not ( = ?auto_25565 ?auto_25572 ) ) ( not ( = ?auto_25569 ?auto_25565 ) ) ( HOIST-AT ?auto_25571 ?auto_25565 ) ( not ( = ?auto_25567 ?auto_25571 ) ) ( not ( = ?auto_25568 ?auto_25571 ) ) ( AVAILABLE ?auto_25571 ) ( SURFACE-AT ?auto_25562 ?auto_25565 ) ( ON ?auto_25562 ?auto_25570 ) ( CLEAR ?auto_25562 ) ( not ( = ?auto_25562 ?auto_25570 ) ) ( not ( = ?auto_25563 ?auto_25570 ) ) ( not ( = ?auto_25561 ?auto_25570 ) ) ( not ( = ?auto_25564 ?auto_25570 ) ) ( TRUCK-AT ?auto_25566 ?auto_25572 ) ( SURFACE-AT ?auto_25560 ?auto_25572 ) ( CLEAR ?auto_25560 ) ( LIFTING ?auto_25567 ?auto_25561 ) ( IS-CRATE ?auto_25561 ) ( not ( = ?auto_25560 ?auto_25561 ) ) ( not ( = ?auto_25562 ?auto_25560 ) ) ( not ( = ?auto_25563 ?auto_25560 ) ) ( not ( = ?auto_25564 ?auto_25560 ) ) ( not ( = ?auto_25570 ?auto_25560 ) ) ( ON ?auto_25560 ?auto_25559 ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25559 ?auto_25561 ) ) ( not ( = ?auto_25559 ?auto_25562 ) ) ( not ( = ?auto_25559 ?auto_25563 ) ) ( not ( = ?auto_25559 ?auto_25564 ) ) ( not ( = ?auto_25559 ?auto_25570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25561 ?auto_25562 ?auto_25563 )
      ( MAKE-4CRATE-VERIFY ?auto_25559 ?auto_25560 ?auto_25561 ?auto_25562 ?auto_25563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25573 - SURFACE
      ?auto_25574 - SURFACE
    )
    :vars
    (
      ?auto_25579 - HOIST
      ?auto_25585 - PLACE
      ?auto_25576 - SURFACE
      ?auto_25582 - PLACE
      ?auto_25580 - HOIST
      ?auto_25575 - SURFACE
      ?auto_25577 - PLACE
      ?auto_25584 - HOIST
      ?auto_25583 - SURFACE
      ?auto_25578 - TRUCK
      ?auto_25581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25579 ?auto_25585 ) ( IS-CRATE ?auto_25574 ) ( not ( = ?auto_25573 ?auto_25574 ) ) ( not ( = ?auto_25576 ?auto_25573 ) ) ( not ( = ?auto_25576 ?auto_25574 ) ) ( not ( = ?auto_25582 ?auto_25585 ) ) ( HOIST-AT ?auto_25580 ?auto_25582 ) ( not ( = ?auto_25579 ?auto_25580 ) ) ( AVAILABLE ?auto_25580 ) ( SURFACE-AT ?auto_25574 ?auto_25582 ) ( ON ?auto_25574 ?auto_25575 ) ( CLEAR ?auto_25574 ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25576 ?auto_25575 ) ) ( IS-CRATE ?auto_25573 ) ( not ( = ?auto_25577 ?auto_25585 ) ) ( not ( = ?auto_25582 ?auto_25577 ) ) ( HOIST-AT ?auto_25584 ?auto_25577 ) ( not ( = ?auto_25579 ?auto_25584 ) ) ( not ( = ?auto_25580 ?auto_25584 ) ) ( AVAILABLE ?auto_25584 ) ( SURFACE-AT ?auto_25573 ?auto_25577 ) ( ON ?auto_25573 ?auto_25583 ) ( CLEAR ?auto_25573 ) ( not ( = ?auto_25573 ?auto_25583 ) ) ( not ( = ?auto_25574 ?auto_25583 ) ) ( not ( = ?auto_25576 ?auto_25583 ) ) ( not ( = ?auto_25575 ?auto_25583 ) ) ( TRUCK-AT ?auto_25578 ?auto_25585 ) ( SURFACE-AT ?auto_25581 ?auto_25585 ) ( CLEAR ?auto_25581 ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25581 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25581 ) ) ( not ( = ?auto_25574 ?auto_25581 ) ) ( not ( = ?auto_25575 ?auto_25581 ) ) ( not ( = ?auto_25583 ?auto_25581 ) ) ( AVAILABLE ?auto_25579 ) ( IN ?auto_25576 ?auto_25578 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25579 ?auto_25576 ?auto_25578 ?auto_25585 )
      ( MAKE-2CRATE ?auto_25576 ?auto_25573 ?auto_25574 )
      ( MAKE-1CRATE-VERIFY ?auto_25573 ?auto_25574 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25586 - SURFACE
      ?auto_25587 - SURFACE
      ?auto_25588 - SURFACE
    )
    :vars
    (
      ?auto_25593 - HOIST
      ?auto_25592 - PLACE
      ?auto_25596 - PLACE
      ?auto_25591 - HOIST
      ?auto_25597 - SURFACE
      ?auto_25598 - PLACE
      ?auto_25590 - HOIST
      ?auto_25594 - SURFACE
      ?auto_25595 - TRUCK
      ?auto_25589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25593 ?auto_25592 ) ( IS-CRATE ?auto_25588 ) ( not ( = ?auto_25587 ?auto_25588 ) ) ( not ( = ?auto_25586 ?auto_25587 ) ) ( not ( = ?auto_25586 ?auto_25588 ) ) ( not ( = ?auto_25596 ?auto_25592 ) ) ( HOIST-AT ?auto_25591 ?auto_25596 ) ( not ( = ?auto_25593 ?auto_25591 ) ) ( AVAILABLE ?auto_25591 ) ( SURFACE-AT ?auto_25588 ?auto_25596 ) ( ON ?auto_25588 ?auto_25597 ) ( CLEAR ?auto_25588 ) ( not ( = ?auto_25587 ?auto_25597 ) ) ( not ( = ?auto_25588 ?auto_25597 ) ) ( not ( = ?auto_25586 ?auto_25597 ) ) ( IS-CRATE ?auto_25587 ) ( not ( = ?auto_25598 ?auto_25592 ) ) ( not ( = ?auto_25596 ?auto_25598 ) ) ( HOIST-AT ?auto_25590 ?auto_25598 ) ( not ( = ?auto_25593 ?auto_25590 ) ) ( not ( = ?auto_25591 ?auto_25590 ) ) ( AVAILABLE ?auto_25590 ) ( SURFACE-AT ?auto_25587 ?auto_25598 ) ( ON ?auto_25587 ?auto_25594 ) ( CLEAR ?auto_25587 ) ( not ( = ?auto_25587 ?auto_25594 ) ) ( not ( = ?auto_25588 ?auto_25594 ) ) ( not ( = ?auto_25586 ?auto_25594 ) ) ( not ( = ?auto_25597 ?auto_25594 ) ) ( TRUCK-AT ?auto_25595 ?auto_25592 ) ( SURFACE-AT ?auto_25589 ?auto_25592 ) ( CLEAR ?auto_25589 ) ( IS-CRATE ?auto_25586 ) ( not ( = ?auto_25589 ?auto_25586 ) ) ( not ( = ?auto_25587 ?auto_25589 ) ) ( not ( = ?auto_25588 ?auto_25589 ) ) ( not ( = ?auto_25597 ?auto_25589 ) ) ( not ( = ?auto_25594 ?auto_25589 ) ) ( AVAILABLE ?auto_25593 ) ( IN ?auto_25586 ?auto_25595 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25587 ?auto_25588 )
      ( MAKE-2CRATE-VERIFY ?auto_25586 ?auto_25587 ?auto_25588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25599 - SURFACE
      ?auto_25600 - SURFACE
      ?auto_25601 - SURFACE
      ?auto_25602 - SURFACE
    )
    :vars
    (
      ?auto_25604 - HOIST
      ?auto_25605 - PLACE
      ?auto_25606 - PLACE
      ?auto_25611 - HOIST
      ?auto_25608 - SURFACE
      ?auto_25603 - PLACE
      ?auto_25609 - HOIST
      ?auto_25607 - SURFACE
      ?auto_25610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25604 ?auto_25605 ) ( IS-CRATE ?auto_25602 ) ( not ( = ?auto_25601 ?auto_25602 ) ) ( not ( = ?auto_25600 ?auto_25601 ) ) ( not ( = ?auto_25600 ?auto_25602 ) ) ( not ( = ?auto_25606 ?auto_25605 ) ) ( HOIST-AT ?auto_25611 ?auto_25606 ) ( not ( = ?auto_25604 ?auto_25611 ) ) ( AVAILABLE ?auto_25611 ) ( SURFACE-AT ?auto_25602 ?auto_25606 ) ( ON ?auto_25602 ?auto_25608 ) ( CLEAR ?auto_25602 ) ( not ( = ?auto_25601 ?auto_25608 ) ) ( not ( = ?auto_25602 ?auto_25608 ) ) ( not ( = ?auto_25600 ?auto_25608 ) ) ( IS-CRATE ?auto_25601 ) ( not ( = ?auto_25603 ?auto_25605 ) ) ( not ( = ?auto_25606 ?auto_25603 ) ) ( HOIST-AT ?auto_25609 ?auto_25603 ) ( not ( = ?auto_25604 ?auto_25609 ) ) ( not ( = ?auto_25611 ?auto_25609 ) ) ( AVAILABLE ?auto_25609 ) ( SURFACE-AT ?auto_25601 ?auto_25603 ) ( ON ?auto_25601 ?auto_25607 ) ( CLEAR ?auto_25601 ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( not ( = ?auto_25602 ?auto_25607 ) ) ( not ( = ?auto_25600 ?auto_25607 ) ) ( not ( = ?auto_25608 ?auto_25607 ) ) ( TRUCK-AT ?auto_25610 ?auto_25605 ) ( SURFACE-AT ?auto_25599 ?auto_25605 ) ( CLEAR ?auto_25599 ) ( IS-CRATE ?auto_25600 ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( not ( = ?auto_25601 ?auto_25599 ) ) ( not ( = ?auto_25602 ?auto_25599 ) ) ( not ( = ?auto_25608 ?auto_25599 ) ) ( not ( = ?auto_25607 ?auto_25599 ) ) ( AVAILABLE ?auto_25604 ) ( IN ?auto_25600 ?auto_25610 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25600 ?auto_25601 ?auto_25602 )
      ( MAKE-3CRATE-VERIFY ?auto_25599 ?auto_25600 ?auto_25601 ?auto_25602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25612 - SURFACE
      ?auto_25613 - SURFACE
      ?auto_25614 - SURFACE
      ?auto_25615 - SURFACE
      ?auto_25616 - SURFACE
    )
    :vars
    (
      ?auto_25618 - HOIST
      ?auto_25619 - PLACE
      ?auto_25620 - PLACE
      ?auto_25625 - HOIST
      ?auto_25622 - SURFACE
      ?auto_25617 - PLACE
      ?auto_25623 - HOIST
      ?auto_25621 - SURFACE
      ?auto_25624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25618 ?auto_25619 ) ( IS-CRATE ?auto_25616 ) ( not ( = ?auto_25615 ?auto_25616 ) ) ( not ( = ?auto_25614 ?auto_25615 ) ) ( not ( = ?auto_25614 ?auto_25616 ) ) ( not ( = ?auto_25620 ?auto_25619 ) ) ( HOIST-AT ?auto_25625 ?auto_25620 ) ( not ( = ?auto_25618 ?auto_25625 ) ) ( AVAILABLE ?auto_25625 ) ( SURFACE-AT ?auto_25616 ?auto_25620 ) ( ON ?auto_25616 ?auto_25622 ) ( CLEAR ?auto_25616 ) ( not ( = ?auto_25615 ?auto_25622 ) ) ( not ( = ?auto_25616 ?auto_25622 ) ) ( not ( = ?auto_25614 ?auto_25622 ) ) ( IS-CRATE ?auto_25615 ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( not ( = ?auto_25620 ?auto_25617 ) ) ( HOIST-AT ?auto_25623 ?auto_25617 ) ( not ( = ?auto_25618 ?auto_25623 ) ) ( not ( = ?auto_25625 ?auto_25623 ) ) ( AVAILABLE ?auto_25623 ) ( SURFACE-AT ?auto_25615 ?auto_25617 ) ( ON ?auto_25615 ?auto_25621 ) ( CLEAR ?auto_25615 ) ( not ( = ?auto_25615 ?auto_25621 ) ) ( not ( = ?auto_25616 ?auto_25621 ) ) ( not ( = ?auto_25614 ?auto_25621 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( TRUCK-AT ?auto_25624 ?auto_25619 ) ( SURFACE-AT ?auto_25613 ?auto_25619 ) ( CLEAR ?auto_25613 ) ( IS-CRATE ?auto_25614 ) ( not ( = ?auto_25613 ?auto_25614 ) ) ( not ( = ?auto_25615 ?auto_25613 ) ) ( not ( = ?auto_25616 ?auto_25613 ) ) ( not ( = ?auto_25622 ?auto_25613 ) ) ( not ( = ?auto_25621 ?auto_25613 ) ) ( AVAILABLE ?auto_25618 ) ( IN ?auto_25614 ?auto_25624 ) ( ON ?auto_25613 ?auto_25612 ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25612 ?auto_25615 ) ) ( not ( = ?auto_25612 ?auto_25616 ) ) ( not ( = ?auto_25612 ?auto_25622 ) ) ( not ( = ?auto_25612 ?auto_25621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25614 ?auto_25615 ?auto_25616 )
      ( MAKE-4CRATE-VERIFY ?auto_25612 ?auto_25613 ?auto_25614 ?auto_25615 ?auto_25616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25626 - SURFACE
      ?auto_25627 - SURFACE
    )
    :vars
    (
      ?auto_25630 - HOIST
      ?auto_25631 - PLACE
      ?auto_25628 - SURFACE
      ?auto_25632 - PLACE
      ?auto_25638 - HOIST
      ?auto_25634 - SURFACE
      ?auto_25629 - PLACE
      ?auto_25636 - HOIST
      ?auto_25633 - SURFACE
      ?auto_25635 - SURFACE
      ?auto_25637 - TRUCK
      ?auto_25639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25630 ?auto_25631 ) ( IS-CRATE ?auto_25627 ) ( not ( = ?auto_25626 ?auto_25627 ) ) ( not ( = ?auto_25628 ?auto_25626 ) ) ( not ( = ?auto_25628 ?auto_25627 ) ) ( not ( = ?auto_25632 ?auto_25631 ) ) ( HOIST-AT ?auto_25638 ?auto_25632 ) ( not ( = ?auto_25630 ?auto_25638 ) ) ( AVAILABLE ?auto_25638 ) ( SURFACE-AT ?auto_25627 ?auto_25632 ) ( ON ?auto_25627 ?auto_25634 ) ( CLEAR ?auto_25627 ) ( not ( = ?auto_25626 ?auto_25634 ) ) ( not ( = ?auto_25627 ?auto_25634 ) ) ( not ( = ?auto_25628 ?auto_25634 ) ) ( IS-CRATE ?auto_25626 ) ( not ( = ?auto_25629 ?auto_25631 ) ) ( not ( = ?auto_25632 ?auto_25629 ) ) ( HOIST-AT ?auto_25636 ?auto_25629 ) ( not ( = ?auto_25630 ?auto_25636 ) ) ( not ( = ?auto_25638 ?auto_25636 ) ) ( AVAILABLE ?auto_25636 ) ( SURFACE-AT ?auto_25626 ?auto_25629 ) ( ON ?auto_25626 ?auto_25633 ) ( CLEAR ?auto_25626 ) ( not ( = ?auto_25626 ?auto_25633 ) ) ( not ( = ?auto_25627 ?auto_25633 ) ) ( not ( = ?auto_25628 ?auto_25633 ) ) ( not ( = ?auto_25634 ?auto_25633 ) ) ( SURFACE-AT ?auto_25635 ?auto_25631 ) ( CLEAR ?auto_25635 ) ( IS-CRATE ?auto_25628 ) ( not ( = ?auto_25635 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25635 ) ) ( not ( = ?auto_25627 ?auto_25635 ) ) ( not ( = ?auto_25634 ?auto_25635 ) ) ( not ( = ?auto_25633 ?auto_25635 ) ) ( AVAILABLE ?auto_25630 ) ( IN ?auto_25628 ?auto_25637 ) ( TRUCK-AT ?auto_25637 ?auto_25639 ) ( not ( = ?auto_25639 ?auto_25631 ) ) ( not ( = ?auto_25632 ?auto_25639 ) ) ( not ( = ?auto_25629 ?auto_25639 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25637 ?auto_25639 ?auto_25631 )
      ( MAKE-2CRATE ?auto_25628 ?auto_25626 ?auto_25627 )
      ( MAKE-1CRATE-VERIFY ?auto_25626 ?auto_25627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25640 - SURFACE
      ?auto_25641 - SURFACE
      ?auto_25642 - SURFACE
    )
    :vars
    (
      ?auto_25650 - HOIST
      ?auto_25646 - PLACE
      ?auto_25649 - PLACE
      ?auto_25651 - HOIST
      ?auto_25653 - SURFACE
      ?auto_25643 - PLACE
      ?auto_25647 - HOIST
      ?auto_25652 - SURFACE
      ?auto_25645 - SURFACE
      ?auto_25648 - TRUCK
      ?auto_25644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25650 ?auto_25646 ) ( IS-CRATE ?auto_25642 ) ( not ( = ?auto_25641 ?auto_25642 ) ) ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25642 ) ) ( not ( = ?auto_25649 ?auto_25646 ) ) ( HOIST-AT ?auto_25651 ?auto_25649 ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( AVAILABLE ?auto_25651 ) ( SURFACE-AT ?auto_25642 ?auto_25649 ) ( ON ?auto_25642 ?auto_25653 ) ( CLEAR ?auto_25642 ) ( not ( = ?auto_25641 ?auto_25653 ) ) ( not ( = ?auto_25642 ?auto_25653 ) ) ( not ( = ?auto_25640 ?auto_25653 ) ) ( IS-CRATE ?auto_25641 ) ( not ( = ?auto_25643 ?auto_25646 ) ) ( not ( = ?auto_25649 ?auto_25643 ) ) ( HOIST-AT ?auto_25647 ?auto_25643 ) ( not ( = ?auto_25650 ?auto_25647 ) ) ( not ( = ?auto_25651 ?auto_25647 ) ) ( AVAILABLE ?auto_25647 ) ( SURFACE-AT ?auto_25641 ?auto_25643 ) ( ON ?auto_25641 ?auto_25652 ) ( CLEAR ?auto_25641 ) ( not ( = ?auto_25641 ?auto_25652 ) ) ( not ( = ?auto_25642 ?auto_25652 ) ) ( not ( = ?auto_25640 ?auto_25652 ) ) ( not ( = ?auto_25653 ?auto_25652 ) ) ( SURFACE-AT ?auto_25645 ?auto_25646 ) ( CLEAR ?auto_25645 ) ( IS-CRATE ?auto_25640 ) ( not ( = ?auto_25645 ?auto_25640 ) ) ( not ( = ?auto_25641 ?auto_25645 ) ) ( not ( = ?auto_25642 ?auto_25645 ) ) ( not ( = ?auto_25653 ?auto_25645 ) ) ( not ( = ?auto_25652 ?auto_25645 ) ) ( AVAILABLE ?auto_25650 ) ( IN ?auto_25640 ?auto_25648 ) ( TRUCK-AT ?auto_25648 ?auto_25644 ) ( not ( = ?auto_25644 ?auto_25646 ) ) ( not ( = ?auto_25649 ?auto_25644 ) ) ( not ( = ?auto_25643 ?auto_25644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25641 ?auto_25642 )
      ( MAKE-2CRATE-VERIFY ?auto_25640 ?auto_25641 ?auto_25642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25654 - SURFACE
      ?auto_25655 - SURFACE
      ?auto_25656 - SURFACE
      ?auto_25657 - SURFACE
    )
    :vars
    (
      ?auto_25667 - HOIST
      ?auto_25666 - PLACE
      ?auto_25664 - PLACE
      ?auto_25660 - HOIST
      ?auto_25661 - SURFACE
      ?auto_25662 - PLACE
      ?auto_25663 - HOIST
      ?auto_25659 - SURFACE
      ?auto_25665 - TRUCK
      ?auto_25658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25667 ?auto_25666 ) ( IS-CRATE ?auto_25657 ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( HOIST-AT ?auto_25660 ?auto_25664 ) ( not ( = ?auto_25667 ?auto_25660 ) ) ( AVAILABLE ?auto_25660 ) ( SURFACE-AT ?auto_25657 ?auto_25664 ) ( ON ?auto_25657 ?auto_25661 ) ( CLEAR ?auto_25657 ) ( not ( = ?auto_25656 ?auto_25661 ) ) ( not ( = ?auto_25657 ?auto_25661 ) ) ( not ( = ?auto_25655 ?auto_25661 ) ) ( IS-CRATE ?auto_25656 ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25662 ) ) ( HOIST-AT ?auto_25663 ?auto_25662 ) ( not ( = ?auto_25667 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( AVAILABLE ?auto_25663 ) ( SURFACE-AT ?auto_25656 ?auto_25662 ) ( ON ?auto_25656 ?auto_25659 ) ( CLEAR ?auto_25656 ) ( not ( = ?auto_25656 ?auto_25659 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25661 ?auto_25659 ) ) ( SURFACE-AT ?auto_25654 ?auto_25666 ) ( CLEAR ?auto_25654 ) ( IS-CRATE ?auto_25655 ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( not ( = ?auto_25656 ?auto_25654 ) ) ( not ( = ?auto_25657 ?auto_25654 ) ) ( not ( = ?auto_25661 ?auto_25654 ) ) ( not ( = ?auto_25659 ?auto_25654 ) ) ( AVAILABLE ?auto_25667 ) ( IN ?auto_25655 ?auto_25665 ) ( TRUCK-AT ?auto_25665 ?auto_25658 ) ( not ( = ?auto_25658 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25658 ) ) ( not ( = ?auto_25662 ?auto_25658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25655 ?auto_25656 ?auto_25657 )
      ( MAKE-3CRATE-VERIFY ?auto_25654 ?auto_25655 ?auto_25656 ?auto_25657 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25668 - SURFACE
      ?auto_25669 - SURFACE
      ?auto_25670 - SURFACE
      ?auto_25671 - SURFACE
      ?auto_25672 - SURFACE
    )
    :vars
    (
      ?auto_25682 - HOIST
      ?auto_25681 - PLACE
      ?auto_25679 - PLACE
      ?auto_25675 - HOIST
      ?auto_25676 - SURFACE
      ?auto_25677 - PLACE
      ?auto_25678 - HOIST
      ?auto_25674 - SURFACE
      ?auto_25680 - TRUCK
      ?auto_25673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25682 ?auto_25681 ) ( IS-CRATE ?auto_25672 ) ( not ( = ?auto_25671 ?auto_25672 ) ) ( not ( = ?auto_25670 ?auto_25671 ) ) ( not ( = ?auto_25670 ?auto_25672 ) ) ( not ( = ?auto_25679 ?auto_25681 ) ) ( HOIST-AT ?auto_25675 ?auto_25679 ) ( not ( = ?auto_25682 ?auto_25675 ) ) ( AVAILABLE ?auto_25675 ) ( SURFACE-AT ?auto_25672 ?auto_25679 ) ( ON ?auto_25672 ?auto_25676 ) ( CLEAR ?auto_25672 ) ( not ( = ?auto_25671 ?auto_25676 ) ) ( not ( = ?auto_25672 ?auto_25676 ) ) ( not ( = ?auto_25670 ?auto_25676 ) ) ( IS-CRATE ?auto_25671 ) ( not ( = ?auto_25677 ?auto_25681 ) ) ( not ( = ?auto_25679 ?auto_25677 ) ) ( HOIST-AT ?auto_25678 ?auto_25677 ) ( not ( = ?auto_25682 ?auto_25678 ) ) ( not ( = ?auto_25675 ?auto_25678 ) ) ( AVAILABLE ?auto_25678 ) ( SURFACE-AT ?auto_25671 ?auto_25677 ) ( ON ?auto_25671 ?auto_25674 ) ( CLEAR ?auto_25671 ) ( not ( = ?auto_25671 ?auto_25674 ) ) ( not ( = ?auto_25672 ?auto_25674 ) ) ( not ( = ?auto_25670 ?auto_25674 ) ) ( not ( = ?auto_25676 ?auto_25674 ) ) ( SURFACE-AT ?auto_25669 ?auto_25681 ) ( CLEAR ?auto_25669 ) ( IS-CRATE ?auto_25670 ) ( not ( = ?auto_25669 ?auto_25670 ) ) ( not ( = ?auto_25671 ?auto_25669 ) ) ( not ( = ?auto_25672 ?auto_25669 ) ) ( not ( = ?auto_25676 ?auto_25669 ) ) ( not ( = ?auto_25674 ?auto_25669 ) ) ( AVAILABLE ?auto_25682 ) ( IN ?auto_25670 ?auto_25680 ) ( TRUCK-AT ?auto_25680 ?auto_25673 ) ( not ( = ?auto_25673 ?auto_25681 ) ) ( not ( = ?auto_25679 ?auto_25673 ) ) ( not ( = ?auto_25677 ?auto_25673 ) ) ( ON ?auto_25669 ?auto_25668 ) ( not ( = ?auto_25668 ?auto_25669 ) ) ( not ( = ?auto_25668 ?auto_25670 ) ) ( not ( = ?auto_25668 ?auto_25671 ) ) ( not ( = ?auto_25668 ?auto_25672 ) ) ( not ( = ?auto_25668 ?auto_25676 ) ) ( not ( = ?auto_25668 ?auto_25674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25670 ?auto_25671 ?auto_25672 )
      ( MAKE-4CRATE-VERIFY ?auto_25668 ?auto_25669 ?auto_25670 ?auto_25671 ?auto_25672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25683 - SURFACE
      ?auto_25684 - SURFACE
    )
    :vars
    (
      ?auto_25696 - HOIST
      ?auto_25693 - PLACE
      ?auto_25694 - SURFACE
      ?auto_25691 - PLACE
      ?auto_25687 - HOIST
      ?auto_25688 - SURFACE
      ?auto_25689 - PLACE
      ?auto_25690 - HOIST
      ?auto_25686 - SURFACE
      ?auto_25695 - SURFACE
      ?auto_25692 - TRUCK
      ?auto_25685 - PLACE
      ?auto_25697 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25696 ?auto_25693 ) ( IS-CRATE ?auto_25684 ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25694 ?auto_25683 ) ) ( not ( = ?auto_25694 ?auto_25684 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( HOIST-AT ?auto_25687 ?auto_25691 ) ( not ( = ?auto_25696 ?auto_25687 ) ) ( AVAILABLE ?auto_25687 ) ( SURFACE-AT ?auto_25684 ?auto_25691 ) ( ON ?auto_25684 ?auto_25688 ) ( CLEAR ?auto_25684 ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25694 ?auto_25688 ) ) ( IS-CRATE ?auto_25683 ) ( not ( = ?auto_25689 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25689 ) ) ( HOIST-AT ?auto_25690 ?auto_25689 ) ( not ( = ?auto_25696 ?auto_25690 ) ) ( not ( = ?auto_25687 ?auto_25690 ) ) ( AVAILABLE ?auto_25690 ) ( SURFACE-AT ?auto_25683 ?auto_25689 ) ( ON ?auto_25683 ?auto_25686 ) ( CLEAR ?auto_25683 ) ( not ( = ?auto_25683 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25694 ?auto_25686 ) ) ( not ( = ?auto_25688 ?auto_25686 ) ) ( SURFACE-AT ?auto_25695 ?auto_25693 ) ( CLEAR ?auto_25695 ) ( IS-CRATE ?auto_25694 ) ( not ( = ?auto_25695 ?auto_25694 ) ) ( not ( = ?auto_25683 ?auto_25695 ) ) ( not ( = ?auto_25684 ?auto_25695 ) ) ( not ( = ?auto_25688 ?auto_25695 ) ) ( not ( = ?auto_25686 ?auto_25695 ) ) ( AVAILABLE ?auto_25696 ) ( TRUCK-AT ?auto_25692 ?auto_25685 ) ( not ( = ?auto_25685 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25685 ) ) ( not ( = ?auto_25689 ?auto_25685 ) ) ( HOIST-AT ?auto_25697 ?auto_25685 ) ( LIFTING ?auto_25697 ?auto_25694 ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( not ( = ?auto_25687 ?auto_25697 ) ) ( not ( = ?auto_25690 ?auto_25697 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25697 ?auto_25694 ?auto_25692 ?auto_25685 )
      ( MAKE-2CRATE ?auto_25694 ?auto_25683 ?auto_25684 )
      ( MAKE-1CRATE-VERIFY ?auto_25683 ?auto_25684 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25698 - SURFACE
      ?auto_25699 - SURFACE
      ?auto_25700 - SURFACE
    )
    :vars
    (
      ?auto_25702 - HOIST
      ?auto_25701 - PLACE
      ?auto_25707 - PLACE
      ?auto_25709 - HOIST
      ?auto_25706 - SURFACE
      ?auto_25704 - PLACE
      ?auto_25708 - HOIST
      ?auto_25703 - SURFACE
      ?auto_25705 - SURFACE
      ?auto_25711 - TRUCK
      ?auto_25710 - PLACE
      ?auto_25712 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25702 ?auto_25701 ) ( IS-CRATE ?auto_25700 ) ( not ( = ?auto_25699 ?auto_25700 ) ) ( not ( = ?auto_25698 ?auto_25699 ) ) ( not ( = ?auto_25698 ?auto_25700 ) ) ( not ( = ?auto_25707 ?auto_25701 ) ) ( HOIST-AT ?auto_25709 ?auto_25707 ) ( not ( = ?auto_25702 ?auto_25709 ) ) ( AVAILABLE ?auto_25709 ) ( SURFACE-AT ?auto_25700 ?auto_25707 ) ( ON ?auto_25700 ?auto_25706 ) ( CLEAR ?auto_25700 ) ( not ( = ?auto_25699 ?auto_25706 ) ) ( not ( = ?auto_25700 ?auto_25706 ) ) ( not ( = ?auto_25698 ?auto_25706 ) ) ( IS-CRATE ?auto_25699 ) ( not ( = ?auto_25704 ?auto_25701 ) ) ( not ( = ?auto_25707 ?auto_25704 ) ) ( HOIST-AT ?auto_25708 ?auto_25704 ) ( not ( = ?auto_25702 ?auto_25708 ) ) ( not ( = ?auto_25709 ?auto_25708 ) ) ( AVAILABLE ?auto_25708 ) ( SURFACE-AT ?auto_25699 ?auto_25704 ) ( ON ?auto_25699 ?auto_25703 ) ( CLEAR ?auto_25699 ) ( not ( = ?auto_25699 ?auto_25703 ) ) ( not ( = ?auto_25700 ?auto_25703 ) ) ( not ( = ?auto_25698 ?auto_25703 ) ) ( not ( = ?auto_25706 ?auto_25703 ) ) ( SURFACE-AT ?auto_25705 ?auto_25701 ) ( CLEAR ?auto_25705 ) ( IS-CRATE ?auto_25698 ) ( not ( = ?auto_25705 ?auto_25698 ) ) ( not ( = ?auto_25699 ?auto_25705 ) ) ( not ( = ?auto_25700 ?auto_25705 ) ) ( not ( = ?auto_25706 ?auto_25705 ) ) ( not ( = ?auto_25703 ?auto_25705 ) ) ( AVAILABLE ?auto_25702 ) ( TRUCK-AT ?auto_25711 ?auto_25710 ) ( not ( = ?auto_25710 ?auto_25701 ) ) ( not ( = ?auto_25707 ?auto_25710 ) ) ( not ( = ?auto_25704 ?auto_25710 ) ) ( HOIST-AT ?auto_25712 ?auto_25710 ) ( LIFTING ?auto_25712 ?auto_25698 ) ( not ( = ?auto_25702 ?auto_25712 ) ) ( not ( = ?auto_25709 ?auto_25712 ) ) ( not ( = ?auto_25708 ?auto_25712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25699 ?auto_25700 )
      ( MAKE-2CRATE-VERIFY ?auto_25698 ?auto_25699 ?auto_25700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25713 - SURFACE
      ?auto_25714 - SURFACE
      ?auto_25715 - SURFACE
      ?auto_25716 - SURFACE
    )
    :vars
    (
      ?auto_25723 - HOIST
      ?auto_25721 - PLACE
      ?auto_25719 - PLACE
      ?auto_25725 - HOIST
      ?auto_25724 - SURFACE
      ?auto_25722 - PLACE
      ?auto_25717 - HOIST
      ?auto_25726 - SURFACE
      ?auto_25720 - TRUCK
      ?auto_25727 - PLACE
      ?auto_25718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25723 ?auto_25721 ) ( IS-CRATE ?auto_25716 ) ( not ( = ?auto_25715 ?auto_25716 ) ) ( not ( = ?auto_25714 ?auto_25715 ) ) ( not ( = ?auto_25714 ?auto_25716 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( HOIST-AT ?auto_25725 ?auto_25719 ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( AVAILABLE ?auto_25725 ) ( SURFACE-AT ?auto_25716 ?auto_25719 ) ( ON ?auto_25716 ?auto_25724 ) ( CLEAR ?auto_25716 ) ( not ( = ?auto_25715 ?auto_25724 ) ) ( not ( = ?auto_25716 ?auto_25724 ) ) ( not ( = ?auto_25714 ?auto_25724 ) ) ( IS-CRATE ?auto_25715 ) ( not ( = ?auto_25722 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25722 ) ) ( HOIST-AT ?auto_25717 ?auto_25722 ) ( not ( = ?auto_25723 ?auto_25717 ) ) ( not ( = ?auto_25725 ?auto_25717 ) ) ( AVAILABLE ?auto_25717 ) ( SURFACE-AT ?auto_25715 ?auto_25722 ) ( ON ?auto_25715 ?auto_25726 ) ( CLEAR ?auto_25715 ) ( not ( = ?auto_25715 ?auto_25726 ) ) ( not ( = ?auto_25716 ?auto_25726 ) ) ( not ( = ?auto_25714 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( SURFACE-AT ?auto_25713 ?auto_25721 ) ( CLEAR ?auto_25713 ) ( IS-CRATE ?auto_25714 ) ( not ( = ?auto_25713 ?auto_25714 ) ) ( not ( = ?auto_25715 ?auto_25713 ) ) ( not ( = ?auto_25716 ?auto_25713 ) ) ( not ( = ?auto_25724 ?auto_25713 ) ) ( not ( = ?auto_25726 ?auto_25713 ) ) ( AVAILABLE ?auto_25723 ) ( TRUCK-AT ?auto_25720 ?auto_25727 ) ( not ( = ?auto_25727 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( HOIST-AT ?auto_25718 ?auto_25727 ) ( LIFTING ?auto_25718 ?auto_25714 ) ( not ( = ?auto_25723 ?auto_25718 ) ) ( not ( = ?auto_25725 ?auto_25718 ) ) ( not ( = ?auto_25717 ?auto_25718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25714 ?auto_25715 ?auto_25716 )
      ( MAKE-3CRATE-VERIFY ?auto_25713 ?auto_25714 ?auto_25715 ?auto_25716 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25728 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25731 - SURFACE
      ?auto_25732 - SURFACE
    )
    :vars
    (
      ?auto_25739 - HOIST
      ?auto_25737 - PLACE
      ?auto_25735 - PLACE
      ?auto_25741 - HOIST
      ?auto_25740 - SURFACE
      ?auto_25738 - PLACE
      ?auto_25733 - HOIST
      ?auto_25742 - SURFACE
      ?auto_25736 - TRUCK
      ?auto_25743 - PLACE
      ?auto_25734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25739 ?auto_25737 ) ( IS-CRATE ?auto_25732 ) ( not ( = ?auto_25731 ?auto_25732 ) ) ( not ( = ?auto_25730 ?auto_25731 ) ) ( not ( = ?auto_25730 ?auto_25732 ) ) ( not ( = ?auto_25735 ?auto_25737 ) ) ( HOIST-AT ?auto_25741 ?auto_25735 ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( AVAILABLE ?auto_25741 ) ( SURFACE-AT ?auto_25732 ?auto_25735 ) ( ON ?auto_25732 ?auto_25740 ) ( CLEAR ?auto_25732 ) ( not ( = ?auto_25731 ?auto_25740 ) ) ( not ( = ?auto_25732 ?auto_25740 ) ) ( not ( = ?auto_25730 ?auto_25740 ) ) ( IS-CRATE ?auto_25731 ) ( not ( = ?auto_25738 ?auto_25737 ) ) ( not ( = ?auto_25735 ?auto_25738 ) ) ( HOIST-AT ?auto_25733 ?auto_25738 ) ( not ( = ?auto_25739 ?auto_25733 ) ) ( not ( = ?auto_25741 ?auto_25733 ) ) ( AVAILABLE ?auto_25733 ) ( SURFACE-AT ?auto_25731 ?auto_25738 ) ( ON ?auto_25731 ?auto_25742 ) ( CLEAR ?auto_25731 ) ( not ( = ?auto_25731 ?auto_25742 ) ) ( not ( = ?auto_25732 ?auto_25742 ) ) ( not ( = ?auto_25730 ?auto_25742 ) ) ( not ( = ?auto_25740 ?auto_25742 ) ) ( SURFACE-AT ?auto_25729 ?auto_25737 ) ( CLEAR ?auto_25729 ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25729 ?auto_25730 ) ) ( not ( = ?auto_25731 ?auto_25729 ) ) ( not ( = ?auto_25732 ?auto_25729 ) ) ( not ( = ?auto_25740 ?auto_25729 ) ) ( not ( = ?auto_25742 ?auto_25729 ) ) ( AVAILABLE ?auto_25739 ) ( TRUCK-AT ?auto_25736 ?auto_25743 ) ( not ( = ?auto_25743 ?auto_25737 ) ) ( not ( = ?auto_25735 ?auto_25743 ) ) ( not ( = ?auto_25738 ?auto_25743 ) ) ( HOIST-AT ?auto_25734 ?auto_25743 ) ( LIFTING ?auto_25734 ?auto_25730 ) ( not ( = ?auto_25739 ?auto_25734 ) ) ( not ( = ?auto_25741 ?auto_25734 ) ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( ON ?auto_25729 ?auto_25728 ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25730 ) ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25728 ?auto_25732 ) ) ( not ( = ?auto_25728 ?auto_25740 ) ) ( not ( = ?auto_25728 ?auto_25742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25730 ?auto_25731 ?auto_25732 )
      ( MAKE-4CRATE-VERIFY ?auto_25728 ?auto_25729 ?auto_25730 ?auto_25731 ?auto_25732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25744 - SURFACE
      ?auto_25745 - SURFACE
    )
    :vars
    (
      ?auto_25753 - HOIST
      ?auto_25751 - PLACE
      ?auto_25757 - SURFACE
      ?auto_25748 - PLACE
      ?auto_25755 - HOIST
      ?auto_25754 - SURFACE
      ?auto_25752 - PLACE
      ?auto_25746 - HOIST
      ?auto_25756 - SURFACE
      ?auto_25750 - SURFACE
      ?auto_25749 - TRUCK
      ?auto_25758 - PLACE
      ?auto_25747 - HOIST
      ?auto_25759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25753 ?auto_25751 ) ( IS-CRATE ?auto_25745 ) ( not ( = ?auto_25744 ?auto_25745 ) ) ( not ( = ?auto_25757 ?auto_25744 ) ) ( not ( = ?auto_25757 ?auto_25745 ) ) ( not ( = ?auto_25748 ?auto_25751 ) ) ( HOIST-AT ?auto_25755 ?auto_25748 ) ( not ( = ?auto_25753 ?auto_25755 ) ) ( AVAILABLE ?auto_25755 ) ( SURFACE-AT ?auto_25745 ?auto_25748 ) ( ON ?auto_25745 ?auto_25754 ) ( CLEAR ?auto_25745 ) ( not ( = ?auto_25744 ?auto_25754 ) ) ( not ( = ?auto_25745 ?auto_25754 ) ) ( not ( = ?auto_25757 ?auto_25754 ) ) ( IS-CRATE ?auto_25744 ) ( not ( = ?auto_25752 ?auto_25751 ) ) ( not ( = ?auto_25748 ?auto_25752 ) ) ( HOIST-AT ?auto_25746 ?auto_25752 ) ( not ( = ?auto_25753 ?auto_25746 ) ) ( not ( = ?auto_25755 ?auto_25746 ) ) ( AVAILABLE ?auto_25746 ) ( SURFACE-AT ?auto_25744 ?auto_25752 ) ( ON ?auto_25744 ?auto_25756 ) ( CLEAR ?auto_25744 ) ( not ( = ?auto_25744 ?auto_25756 ) ) ( not ( = ?auto_25745 ?auto_25756 ) ) ( not ( = ?auto_25757 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( SURFACE-AT ?auto_25750 ?auto_25751 ) ( CLEAR ?auto_25750 ) ( IS-CRATE ?auto_25757 ) ( not ( = ?auto_25750 ?auto_25757 ) ) ( not ( = ?auto_25744 ?auto_25750 ) ) ( not ( = ?auto_25745 ?auto_25750 ) ) ( not ( = ?auto_25754 ?auto_25750 ) ) ( not ( = ?auto_25756 ?auto_25750 ) ) ( AVAILABLE ?auto_25753 ) ( TRUCK-AT ?auto_25749 ?auto_25758 ) ( not ( = ?auto_25758 ?auto_25751 ) ) ( not ( = ?auto_25748 ?auto_25758 ) ) ( not ( = ?auto_25752 ?auto_25758 ) ) ( HOIST-AT ?auto_25747 ?auto_25758 ) ( not ( = ?auto_25753 ?auto_25747 ) ) ( not ( = ?auto_25755 ?auto_25747 ) ) ( not ( = ?auto_25746 ?auto_25747 ) ) ( AVAILABLE ?auto_25747 ) ( SURFACE-AT ?auto_25757 ?auto_25758 ) ( ON ?auto_25757 ?auto_25759 ) ( CLEAR ?auto_25757 ) ( not ( = ?auto_25744 ?auto_25759 ) ) ( not ( = ?auto_25745 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25754 ?auto_25759 ) ) ( not ( = ?auto_25756 ?auto_25759 ) ) ( not ( = ?auto_25750 ?auto_25759 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25747 ?auto_25757 ?auto_25759 ?auto_25758 )
      ( MAKE-2CRATE ?auto_25757 ?auto_25744 ?auto_25745 )
      ( MAKE-1CRATE-VERIFY ?auto_25744 ?auto_25745 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25760 - SURFACE
      ?auto_25761 - SURFACE
      ?auto_25762 - SURFACE
    )
    :vars
    (
      ?auto_25773 - HOIST
      ?auto_25774 - PLACE
      ?auto_25770 - PLACE
      ?auto_25772 - HOIST
      ?auto_25765 - SURFACE
      ?auto_25775 - PLACE
      ?auto_25771 - HOIST
      ?auto_25766 - SURFACE
      ?auto_25769 - SURFACE
      ?auto_25764 - TRUCK
      ?auto_25767 - PLACE
      ?auto_25763 - HOIST
      ?auto_25768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25773 ?auto_25774 ) ( IS-CRATE ?auto_25762 ) ( not ( = ?auto_25761 ?auto_25762 ) ) ( not ( = ?auto_25760 ?auto_25761 ) ) ( not ( = ?auto_25760 ?auto_25762 ) ) ( not ( = ?auto_25770 ?auto_25774 ) ) ( HOIST-AT ?auto_25772 ?auto_25770 ) ( not ( = ?auto_25773 ?auto_25772 ) ) ( AVAILABLE ?auto_25772 ) ( SURFACE-AT ?auto_25762 ?auto_25770 ) ( ON ?auto_25762 ?auto_25765 ) ( CLEAR ?auto_25762 ) ( not ( = ?auto_25761 ?auto_25765 ) ) ( not ( = ?auto_25762 ?auto_25765 ) ) ( not ( = ?auto_25760 ?auto_25765 ) ) ( IS-CRATE ?auto_25761 ) ( not ( = ?auto_25775 ?auto_25774 ) ) ( not ( = ?auto_25770 ?auto_25775 ) ) ( HOIST-AT ?auto_25771 ?auto_25775 ) ( not ( = ?auto_25773 ?auto_25771 ) ) ( not ( = ?auto_25772 ?auto_25771 ) ) ( AVAILABLE ?auto_25771 ) ( SURFACE-AT ?auto_25761 ?auto_25775 ) ( ON ?auto_25761 ?auto_25766 ) ( CLEAR ?auto_25761 ) ( not ( = ?auto_25761 ?auto_25766 ) ) ( not ( = ?auto_25762 ?auto_25766 ) ) ( not ( = ?auto_25760 ?auto_25766 ) ) ( not ( = ?auto_25765 ?auto_25766 ) ) ( SURFACE-AT ?auto_25769 ?auto_25774 ) ( CLEAR ?auto_25769 ) ( IS-CRATE ?auto_25760 ) ( not ( = ?auto_25769 ?auto_25760 ) ) ( not ( = ?auto_25761 ?auto_25769 ) ) ( not ( = ?auto_25762 ?auto_25769 ) ) ( not ( = ?auto_25765 ?auto_25769 ) ) ( not ( = ?auto_25766 ?auto_25769 ) ) ( AVAILABLE ?auto_25773 ) ( TRUCK-AT ?auto_25764 ?auto_25767 ) ( not ( = ?auto_25767 ?auto_25774 ) ) ( not ( = ?auto_25770 ?auto_25767 ) ) ( not ( = ?auto_25775 ?auto_25767 ) ) ( HOIST-AT ?auto_25763 ?auto_25767 ) ( not ( = ?auto_25773 ?auto_25763 ) ) ( not ( = ?auto_25772 ?auto_25763 ) ) ( not ( = ?auto_25771 ?auto_25763 ) ) ( AVAILABLE ?auto_25763 ) ( SURFACE-AT ?auto_25760 ?auto_25767 ) ( ON ?auto_25760 ?auto_25768 ) ( CLEAR ?auto_25760 ) ( not ( = ?auto_25761 ?auto_25768 ) ) ( not ( = ?auto_25762 ?auto_25768 ) ) ( not ( = ?auto_25760 ?auto_25768 ) ) ( not ( = ?auto_25765 ?auto_25768 ) ) ( not ( = ?auto_25766 ?auto_25768 ) ) ( not ( = ?auto_25769 ?auto_25768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25761 ?auto_25762 )
      ( MAKE-2CRATE-VERIFY ?auto_25760 ?auto_25761 ?auto_25762 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25776 - SURFACE
      ?auto_25777 - SURFACE
      ?auto_25778 - SURFACE
      ?auto_25779 - SURFACE
    )
    :vars
    (
      ?auto_25782 - HOIST
      ?auto_25789 - PLACE
      ?auto_25790 - PLACE
      ?auto_25786 - HOIST
      ?auto_25781 - SURFACE
      ?auto_25785 - PLACE
      ?auto_25784 - HOIST
      ?auto_25791 - SURFACE
      ?auto_25783 - TRUCK
      ?auto_25788 - PLACE
      ?auto_25780 - HOIST
      ?auto_25787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25782 ?auto_25789 ) ( IS-CRATE ?auto_25779 ) ( not ( = ?auto_25778 ?auto_25779 ) ) ( not ( = ?auto_25777 ?auto_25778 ) ) ( not ( = ?auto_25777 ?auto_25779 ) ) ( not ( = ?auto_25790 ?auto_25789 ) ) ( HOIST-AT ?auto_25786 ?auto_25790 ) ( not ( = ?auto_25782 ?auto_25786 ) ) ( AVAILABLE ?auto_25786 ) ( SURFACE-AT ?auto_25779 ?auto_25790 ) ( ON ?auto_25779 ?auto_25781 ) ( CLEAR ?auto_25779 ) ( not ( = ?auto_25778 ?auto_25781 ) ) ( not ( = ?auto_25779 ?auto_25781 ) ) ( not ( = ?auto_25777 ?auto_25781 ) ) ( IS-CRATE ?auto_25778 ) ( not ( = ?auto_25785 ?auto_25789 ) ) ( not ( = ?auto_25790 ?auto_25785 ) ) ( HOIST-AT ?auto_25784 ?auto_25785 ) ( not ( = ?auto_25782 ?auto_25784 ) ) ( not ( = ?auto_25786 ?auto_25784 ) ) ( AVAILABLE ?auto_25784 ) ( SURFACE-AT ?auto_25778 ?auto_25785 ) ( ON ?auto_25778 ?auto_25791 ) ( CLEAR ?auto_25778 ) ( not ( = ?auto_25778 ?auto_25791 ) ) ( not ( = ?auto_25779 ?auto_25791 ) ) ( not ( = ?auto_25777 ?auto_25791 ) ) ( not ( = ?auto_25781 ?auto_25791 ) ) ( SURFACE-AT ?auto_25776 ?auto_25789 ) ( CLEAR ?auto_25776 ) ( IS-CRATE ?auto_25777 ) ( not ( = ?auto_25776 ?auto_25777 ) ) ( not ( = ?auto_25778 ?auto_25776 ) ) ( not ( = ?auto_25779 ?auto_25776 ) ) ( not ( = ?auto_25781 ?auto_25776 ) ) ( not ( = ?auto_25791 ?auto_25776 ) ) ( AVAILABLE ?auto_25782 ) ( TRUCK-AT ?auto_25783 ?auto_25788 ) ( not ( = ?auto_25788 ?auto_25789 ) ) ( not ( = ?auto_25790 ?auto_25788 ) ) ( not ( = ?auto_25785 ?auto_25788 ) ) ( HOIST-AT ?auto_25780 ?auto_25788 ) ( not ( = ?auto_25782 ?auto_25780 ) ) ( not ( = ?auto_25786 ?auto_25780 ) ) ( not ( = ?auto_25784 ?auto_25780 ) ) ( AVAILABLE ?auto_25780 ) ( SURFACE-AT ?auto_25777 ?auto_25788 ) ( ON ?auto_25777 ?auto_25787 ) ( CLEAR ?auto_25777 ) ( not ( = ?auto_25778 ?auto_25787 ) ) ( not ( = ?auto_25779 ?auto_25787 ) ) ( not ( = ?auto_25777 ?auto_25787 ) ) ( not ( = ?auto_25781 ?auto_25787 ) ) ( not ( = ?auto_25791 ?auto_25787 ) ) ( not ( = ?auto_25776 ?auto_25787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25777 ?auto_25778 ?auto_25779 )
      ( MAKE-3CRATE-VERIFY ?auto_25776 ?auto_25777 ?auto_25778 ?auto_25779 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25792 - SURFACE
      ?auto_25793 - SURFACE
      ?auto_25794 - SURFACE
      ?auto_25795 - SURFACE
      ?auto_25796 - SURFACE
    )
    :vars
    (
      ?auto_25799 - HOIST
      ?auto_25806 - PLACE
      ?auto_25807 - PLACE
      ?auto_25803 - HOIST
      ?auto_25798 - SURFACE
      ?auto_25802 - PLACE
      ?auto_25801 - HOIST
      ?auto_25808 - SURFACE
      ?auto_25800 - TRUCK
      ?auto_25805 - PLACE
      ?auto_25797 - HOIST
      ?auto_25804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25799 ?auto_25806 ) ( IS-CRATE ?auto_25796 ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25807 ?auto_25806 ) ) ( HOIST-AT ?auto_25803 ?auto_25807 ) ( not ( = ?auto_25799 ?auto_25803 ) ) ( AVAILABLE ?auto_25803 ) ( SURFACE-AT ?auto_25796 ?auto_25807 ) ( ON ?auto_25796 ?auto_25798 ) ( CLEAR ?auto_25796 ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25802 ?auto_25806 ) ) ( not ( = ?auto_25807 ?auto_25802 ) ) ( HOIST-AT ?auto_25801 ?auto_25802 ) ( not ( = ?auto_25799 ?auto_25801 ) ) ( not ( = ?auto_25803 ?auto_25801 ) ) ( AVAILABLE ?auto_25801 ) ( SURFACE-AT ?auto_25795 ?auto_25802 ) ( ON ?auto_25795 ?auto_25808 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25795 ?auto_25808 ) ) ( not ( = ?auto_25796 ?auto_25808 ) ) ( not ( = ?auto_25794 ?auto_25808 ) ) ( not ( = ?auto_25798 ?auto_25808 ) ) ( SURFACE-AT ?auto_25793 ?auto_25806 ) ( CLEAR ?auto_25793 ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25795 ?auto_25793 ) ) ( not ( = ?auto_25796 ?auto_25793 ) ) ( not ( = ?auto_25798 ?auto_25793 ) ) ( not ( = ?auto_25808 ?auto_25793 ) ) ( AVAILABLE ?auto_25799 ) ( TRUCK-AT ?auto_25800 ?auto_25805 ) ( not ( = ?auto_25805 ?auto_25806 ) ) ( not ( = ?auto_25807 ?auto_25805 ) ) ( not ( = ?auto_25802 ?auto_25805 ) ) ( HOIST-AT ?auto_25797 ?auto_25805 ) ( not ( = ?auto_25799 ?auto_25797 ) ) ( not ( = ?auto_25803 ?auto_25797 ) ) ( not ( = ?auto_25801 ?auto_25797 ) ) ( AVAILABLE ?auto_25797 ) ( SURFACE-AT ?auto_25794 ?auto_25805 ) ( ON ?auto_25794 ?auto_25804 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25795 ?auto_25804 ) ) ( not ( = ?auto_25796 ?auto_25804 ) ) ( not ( = ?auto_25794 ?auto_25804 ) ) ( not ( = ?auto_25798 ?auto_25804 ) ) ( not ( = ?auto_25808 ?auto_25804 ) ) ( not ( = ?auto_25793 ?auto_25804 ) ) ( ON ?auto_25793 ?auto_25792 ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25792 ?auto_25808 ) ) ( not ( = ?auto_25792 ?auto_25804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25794 ?auto_25795 ?auto_25796 )
      ( MAKE-4CRATE-VERIFY ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25809 - SURFACE
      ?auto_25810 - SURFACE
    )
    :vars
    (
      ?auto_25813 - HOIST
      ?auto_25821 - PLACE
      ?auto_25822 - SURFACE
      ?auto_25823 - PLACE
      ?auto_25817 - HOIST
      ?auto_25812 - SURFACE
      ?auto_25816 - PLACE
      ?auto_25815 - HOIST
      ?auto_25824 - SURFACE
      ?auto_25818 - SURFACE
      ?auto_25820 - PLACE
      ?auto_25811 - HOIST
      ?auto_25819 - SURFACE
      ?auto_25814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25813 ?auto_25821 ) ( IS-CRATE ?auto_25810 ) ( not ( = ?auto_25809 ?auto_25810 ) ) ( not ( = ?auto_25822 ?auto_25809 ) ) ( not ( = ?auto_25822 ?auto_25810 ) ) ( not ( = ?auto_25823 ?auto_25821 ) ) ( HOIST-AT ?auto_25817 ?auto_25823 ) ( not ( = ?auto_25813 ?auto_25817 ) ) ( AVAILABLE ?auto_25817 ) ( SURFACE-AT ?auto_25810 ?auto_25823 ) ( ON ?auto_25810 ?auto_25812 ) ( CLEAR ?auto_25810 ) ( not ( = ?auto_25809 ?auto_25812 ) ) ( not ( = ?auto_25810 ?auto_25812 ) ) ( not ( = ?auto_25822 ?auto_25812 ) ) ( IS-CRATE ?auto_25809 ) ( not ( = ?auto_25816 ?auto_25821 ) ) ( not ( = ?auto_25823 ?auto_25816 ) ) ( HOIST-AT ?auto_25815 ?auto_25816 ) ( not ( = ?auto_25813 ?auto_25815 ) ) ( not ( = ?auto_25817 ?auto_25815 ) ) ( AVAILABLE ?auto_25815 ) ( SURFACE-AT ?auto_25809 ?auto_25816 ) ( ON ?auto_25809 ?auto_25824 ) ( CLEAR ?auto_25809 ) ( not ( = ?auto_25809 ?auto_25824 ) ) ( not ( = ?auto_25810 ?auto_25824 ) ) ( not ( = ?auto_25822 ?auto_25824 ) ) ( not ( = ?auto_25812 ?auto_25824 ) ) ( SURFACE-AT ?auto_25818 ?auto_25821 ) ( CLEAR ?auto_25818 ) ( IS-CRATE ?auto_25822 ) ( not ( = ?auto_25818 ?auto_25822 ) ) ( not ( = ?auto_25809 ?auto_25818 ) ) ( not ( = ?auto_25810 ?auto_25818 ) ) ( not ( = ?auto_25812 ?auto_25818 ) ) ( not ( = ?auto_25824 ?auto_25818 ) ) ( AVAILABLE ?auto_25813 ) ( not ( = ?auto_25820 ?auto_25821 ) ) ( not ( = ?auto_25823 ?auto_25820 ) ) ( not ( = ?auto_25816 ?auto_25820 ) ) ( HOIST-AT ?auto_25811 ?auto_25820 ) ( not ( = ?auto_25813 ?auto_25811 ) ) ( not ( = ?auto_25817 ?auto_25811 ) ) ( not ( = ?auto_25815 ?auto_25811 ) ) ( AVAILABLE ?auto_25811 ) ( SURFACE-AT ?auto_25822 ?auto_25820 ) ( ON ?auto_25822 ?auto_25819 ) ( CLEAR ?auto_25822 ) ( not ( = ?auto_25809 ?auto_25819 ) ) ( not ( = ?auto_25810 ?auto_25819 ) ) ( not ( = ?auto_25822 ?auto_25819 ) ) ( not ( = ?auto_25812 ?auto_25819 ) ) ( not ( = ?auto_25824 ?auto_25819 ) ) ( not ( = ?auto_25818 ?auto_25819 ) ) ( TRUCK-AT ?auto_25814 ?auto_25821 ) )
    :subtasks
    ( ( !DRIVE ?auto_25814 ?auto_25821 ?auto_25820 )
      ( MAKE-2CRATE ?auto_25822 ?auto_25809 ?auto_25810 )
      ( MAKE-1CRATE-VERIFY ?auto_25809 ?auto_25810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25825 - SURFACE
      ?auto_25826 - SURFACE
      ?auto_25827 - SURFACE
    )
    :vars
    (
      ?auto_25830 - HOIST
      ?auto_25828 - PLACE
      ?auto_25838 - PLACE
      ?auto_25834 - HOIST
      ?auto_25836 - SURFACE
      ?auto_25837 - PLACE
      ?auto_25831 - HOIST
      ?auto_25833 - SURFACE
      ?auto_25829 - SURFACE
      ?auto_25840 - PLACE
      ?auto_25832 - HOIST
      ?auto_25835 - SURFACE
      ?auto_25839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25830 ?auto_25828 ) ( IS-CRATE ?auto_25827 ) ( not ( = ?auto_25826 ?auto_25827 ) ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25825 ?auto_25827 ) ) ( not ( = ?auto_25838 ?auto_25828 ) ) ( HOIST-AT ?auto_25834 ?auto_25838 ) ( not ( = ?auto_25830 ?auto_25834 ) ) ( AVAILABLE ?auto_25834 ) ( SURFACE-AT ?auto_25827 ?auto_25838 ) ( ON ?auto_25827 ?auto_25836 ) ( CLEAR ?auto_25827 ) ( not ( = ?auto_25826 ?auto_25836 ) ) ( not ( = ?auto_25827 ?auto_25836 ) ) ( not ( = ?auto_25825 ?auto_25836 ) ) ( IS-CRATE ?auto_25826 ) ( not ( = ?auto_25837 ?auto_25828 ) ) ( not ( = ?auto_25838 ?auto_25837 ) ) ( HOIST-AT ?auto_25831 ?auto_25837 ) ( not ( = ?auto_25830 ?auto_25831 ) ) ( not ( = ?auto_25834 ?auto_25831 ) ) ( AVAILABLE ?auto_25831 ) ( SURFACE-AT ?auto_25826 ?auto_25837 ) ( ON ?auto_25826 ?auto_25833 ) ( CLEAR ?auto_25826 ) ( not ( = ?auto_25826 ?auto_25833 ) ) ( not ( = ?auto_25827 ?auto_25833 ) ) ( not ( = ?auto_25825 ?auto_25833 ) ) ( not ( = ?auto_25836 ?auto_25833 ) ) ( SURFACE-AT ?auto_25829 ?auto_25828 ) ( CLEAR ?auto_25829 ) ( IS-CRATE ?auto_25825 ) ( not ( = ?auto_25829 ?auto_25825 ) ) ( not ( = ?auto_25826 ?auto_25829 ) ) ( not ( = ?auto_25827 ?auto_25829 ) ) ( not ( = ?auto_25836 ?auto_25829 ) ) ( not ( = ?auto_25833 ?auto_25829 ) ) ( AVAILABLE ?auto_25830 ) ( not ( = ?auto_25840 ?auto_25828 ) ) ( not ( = ?auto_25838 ?auto_25840 ) ) ( not ( = ?auto_25837 ?auto_25840 ) ) ( HOIST-AT ?auto_25832 ?auto_25840 ) ( not ( = ?auto_25830 ?auto_25832 ) ) ( not ( = ?auto_25834 ?auto_25832 ) ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( AVAILABLE ?auto_25832 ) ( SURFACE-AT ?auto_25825 ?auto_25840 ) ( ON ?auto_25825 ?auto_25835 ) ( CLEAR ?auto_25825 ) ( not ( = ?auto_25826 ?auto_25835 ) ) ( not ( = ?auto_25827 ?auto_25835 ) ) ( not ( = ?auto_25825 ?auto_25835 ) ) ( not ( = ?auto_25836 ?auto_25835 ) ) ( not ( = ?auto_25833 ?auto_25835 ) ) ( not ( = ?auto_25829 ?auto_25835 ) ) ( TRUCK-AT ?auto_25839 ?auto_25828 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25826 ?auto_25827 )
      ( MAKE-2CRATE-VERIFY ?auto_25825 ?auto_25826 ?auto_25827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25841 - SURFACE
      ?auto_25842 - SURFACE
      ?auto_25843 - SURFACE
      ?auto_25844 - SURFACE
    )
    :vars
    (
      ?auto_25847 - HOIST
      ?auto_25856 - PLACE
      ?auto_25846 - PLACE
      ?auto_25854 - HOIST
      ?auto_25851 - SURFACE
      ?auto_25855 - PLACE
      ?auto_25848 - HOIST
      ?auto_25853 - SURFACE
      ?auto_25852 - PLACE
      ?auto_25850 - HOIST
      ?auto_25845 - SURFACE
      ?auto_25849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25847 ?auto_25856 ) ( IS-CRATE ?auto_25844 ) ( not ( = ?auto_25843 ?auto_25844 ) ) ( not ( = ?auto_25842 ?auto_25843 ) ) ( not ( = ?auto_25842 ?auto_25844 ) ) ( not ( = ?auto_25846 ?auto_25856 ) ) ( HOIST-AT ?auto_25854 ?auto_25846 ) ( not ( = ?auto_25847 ?auto_25854 ) ) ( AVAILABLE ?auto_25854 ) ( SURFACE-AT ?auto_25844 ?auto_25846 ) ( ON ?auto_25844 ?auto_25851 ) ( CLEAR ?auto_25844 ) ( not ( = ?auto_25843 ?auto_25851 ) ) ( not ( = ?auto_25844 ?auto_25851 ) ) ( not ( = ?auto_25842 ?auto_25851 ) ) ( IS-CRATE ?auto_25843 ) ( not ( = ?auto_25855 ?auto_25856 ) ) ( not ( = ?auto_25846 ?auto_25855 ) ) ( HOIST-AT ?auto_25848 ?auto_25855 ) ( not ( = ?auto_25847 ?auto_25848 ) ) ( not ( = ?auto_25854 ?auto_25848 ) ) ( AVAILABLE ?auto_25848 ) ( SURFACE-AT ?auto_25843 ?auto_25855 ) ( ON ?auto_25843 ?auto_25853 ) ( CLEAR ?auto_25843 ) ( not ( = ?auto_25843 ?auto_25853 ) ) ( not ( = ?auto_25844 ?auto_25853 ) ) ( not ( = ?auto_25842 ?auto_25853 ) ) ( not ( = ?auto_25851 ?auto_25853 ) ) ( SURFACE-AT ?auto_25841 ?auto_25856 ) ( CLEAR ?auto_25841 ) ( IS-CRATE ?auto_25842 ) ( not ( = ?auto_25841 ?auto_25842 ) ) ( not ( = ?auto_25843 ?auto_25841 ) ) ( not ( = ?auto_25844 ?auto_25841 ) ) ( not ( = ?auto_25851 ?auto_25841 ) ) ( not ( = ?auto_25853 ?auto_25841 ) ) ( AVAILABLE ?auto_25847 ) ( not ( = ?auto_25852 ?auto_25856 ) ) ( not ( = ?auto_25846 ?auto_25852 ) ) ( not ( = ?auto_25855 ?auto_25852 ) ) ( HOIST-AT ?auto_25850 ?auto_25852 ) ( not ( = ?auto_25847 ?auto_25850 ) ) ( not ( = ?auto_25854 ?auto_25850 ) ) ( not ( = ?auto_25848 ?auto_25850 ) ) ( AVAILABLE ?auto_25850 ) ( SURFACE-AT ?auto_25842 ?auto_25852 ) ( ON ?auto_25842 ?auto_25845 ) ( CLEAR ?auto_25842 ) ( not ( = ?auto_25843 ?auto_25845 ) ) ( not ( = ?auto_25844 ?auto_25845 ) ) ( not ( = ?auto_25842 ?auto_25845 ) ) ( not ( = ?auto_25851 ?auto_25845 ) ) ( not ( = ?auto_25853 ?auto_25845 ) ) ( not ( = ?auto_25841 ?auto_25845 ) ) ( TRUCK-AT ?auto_25849 ?auto_25856 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25842 ?auto_25843 ?auto_25844 )
      ( MAKE-3CRATE-VERIFY ?auto_25841 ?auto_25842 ?auto_25843 ?auto_25844 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25857 - SURFACE
      ?auto_25858 - SURFACE
      ?auto_25859 - SURFACE
      ?auto_25860 - SURFACE
      ?auto_25861 - SURFACE
    )
    :vars
    (
      ?auto_25864 - HOIST
      ?auto_25873 - PLACE
      ?auto_25863 - PLACE
      ?auto_25871 - HOIST
      ?auto_25868 - SURFACE
      ?auto_25872 - PLACE
      ?auto_25865 - HOIST
      ?auto_25870 - SURFACE
      ?auto_25869 - PLACE
      ?auto_25867 - HOIST
      ?auto_25862 - SURFACE
      ?auto_25866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25864 ?auto_25873 ) ( IS-CRATE ?auto_25861 ) ( not ( = ?auto_25860 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25863 ?auto_25873 ) ) ( HOIST-AT ?auto_25871 ?auto_25863 ) ( not ( = ?auto_25864 ?auto_25871 ) ) ( AVAILABLE ?auto_25871 ) ( SURFACE-AT ?auto_25861 ?auto_25863 ) ( ON ?auto_25861 ?auto_25868 ) ( CLEAR ?auto_25861 ) ( not ( = ?auto_25860 ?auto_25868 ) ) ( not ( = ?auto_25861 ?auto_25868 ) ) ( not ( = ?auto_25859 ?auto_25868 ) ) ( IS-CRATE ?auto_25860 ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( not ( = ?auto_25863 ?auto_25872 ) ) ( HOIST-AT ?auto_25865 ?auto_25872 ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25871 ?auto_25865 ) ) ( AVAILABLE ?auto_25865 ) ( SURFACE-AT ?auto_25860 ?auto_25872 ) ( ON ?auto_25860 ?auto_25870 ) ( CLEAR ?auto_25860 ) ( not ( = ?auto_25860 ?auto_25870 ) ) ( not ( = ?auto_25861 ?auto_25870 ) ) ( not ( = ?auto_25859 ?auto_25870 ) ) ( not ( = ?auto_25868 ?auto_25870 ) ) ( SURFACE-AT ?auto_25858 ?auto_25873 ) ( CLEAR ?auto_25858 ) ( IS-CRATE ?auto_25859 ) ( not ( = ?auto_25858 ?auto_25859 ) ) ( not ( = ?auto_25860 ?auto_25858 ) ) ( not ( = ?auto_25861 ?auto_25858 ) ) ( not ( = ?auto_25868 ?auto_25858 ) ) ( not ( = ?auto_25870 ?auto_25858 ) ) ( AVAILABLE ?auto_25864 ) ( not ( = ?auto_25869 ?auto_25873 ) ) ( not ( = ?auto_25863 ?auto_25869 ) ) ( not ( = ?auto_25872 ?auto_25869 ) ) ( HOIST-AT ?auto_25867 ?auto_25869 ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25871 ?auto_25867 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( AVAILABLE ?auto_25867 ) ( SURFACE-AT ?auto_25859 ?auto_25869 ) ( ON ?auto_25859 ?auto_25862 ) ( CLEAR ?auto_25859 ) ( not ( = ?auto_25860 ?auto_25862 ) ) ( not ( = ?auto_25861 ?auto_25862 ) ) ( not ( = ?auto_25859 ?auto_25862 ) ) ( not ( = ?auto_25868 ?auto_25862 ) ) ( not ( = ?auto_25870 ?auto_25862 ) ) ( not ( = ?auto_25858 ?auto_25862 ) ) ( TRUCK-AT ?auto_25866 ?auto_25873 ) ( ON ?auto_25858 ?auto_25857 ) ( not ( = ?auto_25857 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25859 ) ) ( not ( = ?auto_25857 ?auto_25860 ) ) ( not ( = ?auto_25857 ?auto_25861 ) ) ( not ( = ?auto_25857 ?auto_25868 ) ) ( not ( = ?auto_25857 ?auto_25870 ) ) ( not ( = ?auto_25857 ?auto_25862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25859 ?auto_25860 ?auto_25861 )
      ( MAKE-4CRATE-VERIFY ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25874 - SURFACE
      ?auto_25875 - SURFACE
    )
    :vars
    (
      ?auto_25878 - HOIST
      ?auto_25889 - PLACE
      ?auto_25881 - SURFACE
      ?auto_25877 - PLACE
      ?auto_25887 - HOIST
      ?auto_25883 - SURFACE
      ?auto_25888 - PLACE
      ?auto_25879 - HOIST
      ?auto_25886 - SURFACE
      ?auto_25884 - SURFACE
      ?auto_25885 - PLACE
      ?auto_25882 - HOIST
      ?auto_25876 - SURFACE
      ?auto_25880 - TRUCK
      ?auto_25890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25878 ?auto_25889 ) ( IS-CRATE ?auto_25875 ) ( not ( = ?auto_25874 ?auto_25875 ) ) ( not ( = ?auto_25881 ?auto_25874 ) ) ( not ( = ?auto_25881 ?auto_25875 ) ) ( not ( = ?auto_25877 ?auto_25889 ) ) ( HOIST-AT ?auto_25887 ?auto_25877 ) ( not ( = ?auto_25878 ?auto_25887 ) ) ( AVAILABLE ?auto_25887 ) ( SURFACE-AT ?auto_25875 ?auto_25877 ) ( ON ?auto_25875 ?auto_25883 ) ( CLEAR ?auto_25875 ) ( not ( = ?auto_25874 ?auto_25883 ) ) ( not ( = ?auto_25875 ?auto_25883 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( IS-CRATE ?auto_25874 ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( not ( = ?auto_25877 ?auto_25888 ) ) ( HOIST-AT ?auto_25879 ?auto_25888 ) ( not ( = ?auto_25878 ?auto_25879 ) ) ( not ( = ?auto_25887 ?auto_25879 ) ) ( AVAILABLE ?auto_25879 ) ( SURFACE-AT ?auto_25874 ?auto_25888 ) ( ON ?auto_25874 ?auto_25886 ) ( CLEAR ?auto_25874 ) ( not ( = ?auto_25874 ?auto_25886 ) ) ( not ( = ?auto_25875 ?auto_25886 ) ) ( not ( = ?auto_25881 ?auto_25886 ) ) ( not ( = ?auto_25883 ?auto_25886 ) ) ( IS-CRATE ?auto_25881 ) ( not ( = ?auto_25884 ?auto_25881 ) ) ( not ( = ?auto_25874 ?auto_25884 ) ) ( not ( = ?auto_25875 ?auto_25884 ) ) ( not ( = ?auto_25883 ?auto_25884 ) ) ( not ( = ?auto_25886 ?auto_25884 ) ) ( not ( = ?auto_25885 ?auto_25889 ) ) ( not ( = ?auto_25877 ?auto_25885 ) ) ( not ( = ?auto_25888 ?auto_25885 ) ) ( HOIST-AT ?auto_25882 ?auto_25885 ) ( not ( = ?auto_25878 ?auto_25882 ) ) ( not ( = ?auto_25887 ?auto_25882 ) ) ( not ( = ?auto_25879 ?auto_25882 ) ) ( AVAILABLE ?auto_25882 ) ( SURFACE-AT ?auto_25881 ?auto_25885 ) ( ON ?auto_25881 ?auto_25876 ) ( CLEAR ?auto_25881 ) ( not ( = ?auto_25874 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25881 ?auto_25876 ) ) ( not ( = ?auto_25883 ?auto_25876 ) ) ( not ( = ?auto_25886 ?auto_25876 ) ) ( not ( = ?auto_25884 ?auto_25876 ) ) ( TRUCK-AT ?auto_25880 ?auto_25889 ) ( SURFACE-AT ?auto_25890 ?auto_25889 ) ( CLEAR ?auto_25890 ) ( LIFTING ?auto_25878 ?auto_25884 ) ( IS-CRATE ?auto_25884 ) ( not ( = ?auto_25890 ?auto_25884 ) ) ( not ( = ?auto_25874 ?auto_25890 ) ) ( not ( = ?auto_25875 ?auto_25890 ) ) ( not ( = ?auto_25881 ?auto_25890 ) ) ( not ( = ?auto_25883 ?auto_25890 ) ) ( not ( = ?auto_25886 ?auto_25890 ) ) ( not ( = ?auto_25876 ?auto_25890 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25890 ?auto_25884 )
      ( MAKE-2CRATE ?auto_25881 ?auto_25874 ?auto_25875 )
      ( MAKE-1CRATE-VERIFY ?auto_25874 ?auto_25875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25891 - SURFACE
      ?auto_25892 - SURFACE
      ?auto_25893 - SURFACE
    )
    :vars
    (
      ?auto_25907 - HOIST
      ?auto_25905 - PLACE
      ?auto_25894 - PLACE
      ?auto_25898 - HOIST
      ?auto_25901 - SURFACE
      ?auto_25904 - PLACE
      ?auto_25906 - HOIST
      ?auto_25900 - SURFACE
      ?auto_25899 - SURFACE
      ?auto_25897 - PLACE
      ?auto_25903 - HOIST
      ?auto_25895 - SURFACE
      ?auto_25896 - TRUCK
      ?auto_25902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25907 ?auto_25905 ) ( IS-CRATE ?auto_25893 ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25893 ) ) ( not ( = ?auto_25894 ?auto_25905 ) ) ( HOIST-AT ?auto_25898 ?auto_25894 ) ( not ( = ?auto_25907 ?auto_25898 ) ) ( AVAILABLE ?auto_25898 ) ( SURFACE-AT ?auto_25893 ?auto_25894 ) ( ON ?auto_25893 ?auto_25901 ) ( CLEAR ?auto_25893 ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25893 ?auto_25901 ) ) ( not ( = ?auto_25891 ?auto_25901 ) ) ( IS-CRATE ?auto_25892 ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( not ( = ?auto_25894 ?auto_25904 ) ) ( HOIST-AT ?auto_25906 ?auto_25904 ) ( not ( = ?auto_25907 ?auto_25906 ) ) ( not ( = ?auto_25898 ?auto_25906 ) ) ( AVAILABLE ?auto_25906 ) ( SURFACE-AT ?auto_25892 ?auto_25904 ) ( ON ?auto_25892 ?auto_25900 ) ( CLEAR ?auto_25892 ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25893 ?auto_25900 ) ) ( not ( = ?auto_25891 ?auto_25900 ) ) ( not ( = ?auto_25901 ?auto_25900 ) ) ( IS-CRATE ?auto_25891 ) ( not ( = ?auto_25899 ?auto_25891 ) ) ( not ( = ?auto_25892 ?auto_25899 ) ) ( not ( = ?auto_25893 ?auto_25899 ) ) ( not ( = ?auto_25901 ?auto_25899 ) ) ( not ( = ?auto_25900 ?auto_25899 ) ) ( not ( = ?auto_25897 ?auto_25905 ) ) ( not ( = ?auto_25894 ?auto_25897 ) ) ( not ( = ?auto_25904 ?auto_25897 ) ) ( HOIST-AT ?auto_25903 ?auto_25897 ) ( not ( = ?auto_25907 ?auto_25903 ) ) ( not ( = ?auto_25898 ?auto_25903 ) ) ( not ( = ?auto_25906 ?auto_25903 ) ) ( AVAILABLE ?auto_25903 ) ( SURFACE-AT ?auto_25891 ?auto_25897 ) ( ON ?auto_25891 ?auto_25895 ) ( CLEAR ?auto_25891 ) ( not ( = ?auto_25892 ?auto_25895 ) ) ( not ( = ?auto_25893 ?auto_25895 ) ) ( not ( = ?auto_25891 ?auto_25895 ) ) ( not ( = ?auto_25901 ?auto_25895 ) ) ( not ( = ?auto_25900 ?auto_25895 ) ) ( not ( = ?auto_25899 ?auto_25895 ) ) ( TRUCK-AT ?auto_25896 ?auto_25905 ) ( SURFACE-AT ?auto_25902 ?auto_25905 ) ( CLEAR ?auto_25902 ) ( LIFTING ?auto_25907 ?auto_25899 ) ( IS-CRATE ?auto_25899 ) ( not ( = ?auto_25902 ?auto_25899 ) ) ( not ( = ?auto_25892 ?auto_25902 ) ) ( not ( = ?auto_25893 ?auto_25902 ) ) ( not ( = ?auto_25891 ?auto_25902 ) ) ( not ( = ?auto_25901 ?auto_25902 ) ) ( not ( = ?auto_25900 ?auto_25902 ) ) ( not ( = ?auto_25895 ?auto_25902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25892 ?auto_25893 )
      ( MAKE-2CRATE-VERIFY ?auto_25891 ?auto_25892 ?auto_25893 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25908 - SURFACE
      ?auto_25909 - SURFACE
      ?auto_25910 - SURFACE
      ?auto_25911 - SURFACE
    )
    :vars
    (
      ?auto_25920 - HOIST
      ?auto_25915 - PLACE
      ?auto_25923 - PLACE
      ?auto_25924 - HOIST
      ?auto_25921 - SURFACE
      ?auto_25913 - PLACE
      ?auto_25912 - HOIST
      ?auto_25917 - SURFACE
      ?auto_25918 - PLACE
      ?auto_25914 - HOIST
      ?auto_25919 - SURFACE
      ?auto_25916 - TRUCK
      ?auto_25922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25920 ?auto_25915 ) ( IS-CRATE ?auto_25911 ) ( not ( = ?auto_25910 ?auto_25911 ) ) ( not ( = ?auto_25909 ?auto_25910 ) ) ( not ( = ?auto_25909 ?auto_25911 ) ) ( not ( = ?auto_25923 ?auto_25915 ) ) ( HOIST-AT ?auto_25924 ?auto_25923 ) ( not ( = ?auto_25920 ?auto_25924 ) ) ( AVAILABLE ?auto_25924 ) ( SURFACE-AT ?auto_25911 ?auto_25923 ) ( ON ?auto_25911 ?auto_25921 ) ( CLEAR ?auto_25911 ) ( not ( = ?auto_25910 ?auto_25921 ) ) ( not ( = ?auto_25911 ?auto_25921 ) ) ( not ( = ?auto_25909 ?auto_25921 ) ) ( IS-CRATE ?auto_25910 ) ( not ( = ?auto_25913 ?auto_25915 ) ) ( not ( = ?auto_25923 ?auto_25913 ) ) ( HOIST-AT ?auto_25912 ?auto_25913 ) ( not ( = ?auto_25920 ?auto_25912 ) ) ( not ( = ?auto_25924 ?auto_25912 ) ) ( AVAILABLE ?auto_25912 ) ( SURFACE-AT ?auto_25910 ?auto_25913 ) ( ON ?auto_25910 ?auto_25917 ) ( CLEAR ?auto_25910 ) ( not ( = ?auto_25910 ?auto_25917 ) ) ( not ( = ?auto_25911 ?auto_25917 ) ) ( not ( = ?auto_25909 ?auto_25917 ) ) ( not ( = ?auto_25921 ?auto_25917 ) ) ( IS-CRATE ?auto_25909 ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( not ( = ?auto_25910 ?auto_25908 ) ) ( not ( = ?auto_25911 ?auto_25908 ) ) ( not ( = ?auto_25921 ?auto_25908 ) ) ( not ( = ?auto_25917 ?auto_25908 ) ) ( not ( = ?auto_25918 ?auto_25915 ) ) ( not ( = ?auto_25923 ?auto_25918 ) ) ( not ( = ?auto_25913 ?auto_25918 ) ) ( HOIST-AT ?auto_25914 ?auto_25918 ) ( not ( = ?auto_25920 ?auto_25914 ) ) ( not ( = ?auto_25924 ?auto_25914 ) ) ( not ( = ?auto_25912 ?auto_25914 ) ) ( AVAILABLE ?auto_25914 ) ( SURFACE-AT ?auto_25909 ?auto_25918 ) ( ON ?auto_25909 ?auto_25919 ) ( CLEAR ?auto_25909 ) ( not ( = ?auto_25910 ?auto_25919 ) ) ( not ( = ?auto_25911 ?auto_25919 ) ) ( not ( = ?auto_25909 ?auto_25919 ) ) ( not ( = ?auto_25921 ?auto_25919 ) ) ( not ( = ?auto_25917 ?auto_25919 ) ) ( not ( = ?auto_25908 ?auto_25919 ) ) ( TRUCK-AT ?auto_25916 ?auto_25915 ) ( SURFACE-AT ?auto_25922 ?auto_25915 ) ( CLEAR ?auto_25922 ) ( LIFTING ?auto_25920 ?auto_25908 ) ( IS-CRATE ?auto_25908 ) ( not ( = ?auto_25922 ?auto_25908 ) ) ( not ( = ?auto_25910 ?auto_25922 ) ) ( not ( = ?auto_25911 ?auto_25922 ) ) ( not ( = ?auto_25909 ?auto_25922 ) ) ( not ( = ?auto_25921 ?auto_25922 ) ) ( not ( = ?auto_25917 ?auto_25922 ) ) ( not ( = ?auto_25919 ?auto_25922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25909 ?auto_25910 ?auto_25911 )
      ( MAKE-3CRATE-VERIFY ?auto_25908 ?auto_25909 ?auto_25910 ?auto_25911 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25925 - SURFACE
      ?auto_25926 - SURFACE
      ?auto_25927 - SURFACE
      ?auto_25928 - SURFACE
      ?auto_25929 - SURFACE
    )
    :vars
    (
      ?auto_25938 - HOIST
      ?auto_25933 - PLACE
      ?auto_25940 - PLACE
      ?auto_25941 - HOIST
      ?auto_25939 - SURFACE
      ?auto_25931 - PLACE
      ?auto_25930 - HOIST
      ?auto_25935 - SURFACE
      ?auto_25936 - PLACE
      ?auto_25932 - HOIST
      ?auto_25937 - SURFACE
      ?auto_25934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25938 ?auto_25933 ) ( IS-CRATE ?auto_25929 ) ( not ( = ?auto_25928 ?auto_25929 ) ) ( not ( = ?auto_25927 ?auto_25928 ) ) ( not ( = ?auto_25927 ?auto_25929 ) ) ( not ( = ?auto_25940 ?auto_25933 ) ) ( HOIST-AT ?auto_25941 ?auto_25940 ) ( not ( = ?auto_25938 ?auto_25941 ) ) ( AVAILABLE ?auto_25941 ) ( SURFACE-AT ?auto_25929 ?auto_25940 ) ( ON ?auto_25929 ?auto_25939 ) ( CLEAR ?auto_25929 ) ( not ( = ?auto_25928 ?auto_25939 ) ) ( not ( = ?auto_25929 ?auto_25939 ) ) ( not ( = ?auto_25927 ?auto_25939 ) ) ( IS-CRATE ?auto_25928 ) ( not ( = ?auto_25931 ?auto_25933 ) ) ( not ( = ?auto_25940 ?auto_25931 ) ) ( HOIST-AT ?auto_25930 ?auto_25931 ) ( not ( = ?auto_25938 ?auto_25930 ) ) ( not ( = ?auto_25941 ?auto_25930 ) ) ( AVAILABLE ?auto_25930 ) ( SURFACE-AT ?auto_25928 ?auto_25931 ) ( ON ?auto_25928 ?auto_25935 ) ( CLEAR ?auto_25928 ) ( not ( = ?auto_25928 ?auto_25935 ) ) ( not ( = ?auto_25929 ?auto_25935 ) ) ( not ( = ?auto_25927 ?auto_25935 ) ) ( not ( = ?auto_25939 ?auto_25935 ) ) ( IS-CRATE ?auto_25927 ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( not ( = ?auto_25928 ?auto_25926 ) ) ( not ( = ?auto_25929 ?auto_25926 ) ) ( not ( = ?auto_25939 ?auto_25926 ) ) ( not ( = ?auto_25935 ?auto_25926 ) ) ( not ( = ?auto_25936 ?auto_25933 ) ) ( not ( = ?auto_25940 ?auto_25936 ) ) ( not ( = ?auto_25931 ?auto_25936 ) ) ( HOIST-AT ?auto_25932 ?auto_25936 ) ( not ( = ?auto_25938 ?auto_25932 ) ) ( not ( = ?auto_25941 ?auto_25932 ) ) ( not ( = ?auto_25930 ?auto_25932 ) ) ( AVAILABLE ?auto_25932 ) ( SURFACE-AT ?auto_25927 ?auto_25936 ) ( ON ?auto_25927 ?auto_25937 ) ( CLEAR ?auto_25927 ) ( not ( = ?auto_25928 ?auto_25937 ) ) ( not ( = ?auto_25929 ?auto_25937 ) ) ( not ( = ?auto_25927 ?auto_25937 ) ) ( not ( = ?auto_25939 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25926 ?auto_25937 ) ) ( TRUCK-AT ?auto_25934 ?auto_25933 ) ( SURFACE-AT ?auto_25925 ?auto_25933 ) ( CLEAR ?auto_25925 ) ( LIFTING ?auto_25938 ?auto_25926 ) ( IS-CRATE ?auto_25926 ) ( not ( = ?auto_25925 ?auto_25926 ) ) ( not ( = ?auto_25928 ?auto_25925 ) ) ( not ( = ?auto_25929 ?auto_25925 ) ) ( not ( = ?auto_25927 ?auto_25925 ) ) ( not ( = ?auto_25939 ?auto_25925 ) ) ( not ( = ?auto_25935 ?auto_25925 ) ) ( not ( = ?auto_25937 ?auto_25925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25927 ?auto_25928 ?auto_25929 )
      ( MAKE-4CRATE-VERIFY ?auto_25925 ?auto_25926 ?auto_25927 ?auto_25928 ?auto_25929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25942 - SURFACE
      ?auto_25943 - SURFACE
    )
    :vars
    (
      ?auto_25954 - HOIST
      ?auto_25948 - PLACE
      ?auto_25951 - SURFACE
      ?auto_25957 - PLACE
      ?auto_25958 - HOIST
      ?auto_25955 - SURFACE
      ?auto_25945 - PLACE
      ?auto_25944 - HOIST
      ?auto_25950 - SURFACE
      ?auto_25946 - SURFACE
      ?auto_25952 - PLACE
      ?auto_25947 - HOIST
      ?auto_25953 - SURFACE
      ?auto_25949 - TRUCK
      ?auto_25956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25954 ?auto_25948 ) ( IS-CRATE ?auto_25943 ) ( not ( = ?auto_25942 ?auto_25943 ) ) ( not ( = ?auto_25951 ?auto_25942 ) ) ( not ( = ?auto_25951 ?auto_25943 ) ) ( not ( = ?auto_25957 ?auto_25948 ) ) ( HOIST-AT ?auto_25958 ?auto_25957 ) ( not ( = ?auto_25954 ?auto_25958 ) ) ( AVAILABLE ?auto_25958 ) ( SURFACE-AT ?auto_25943 ?auto_25957 ) ( ON ?auto_25943 ?auto_25955 ) ( CLEAR ?auto_25943 ) ( not ( = ?auto_25942 ?auto_25955 ) ) ( not ( = ?auto_25943 ?auto_25955 ) ) ( not ( = ?auto_25951 ?auto_25955 ) ) ( IS-CRATE ?auto_25942 ) ( not ( = ?auto_25945 ?auto_25948 ) ) ( not ( = ?auto_25957 ?auto_25945 ) ) ( HOIST-AT ?auto_25944 ?auto_25945 ) ( not ( = ?auto_25954 ?auto_25944 ) ) ( not ( = ?auto_25958 ?auto_25944 ) ) ( AVAILABLE ?auto_25944 ) ( SURFACE-AT ?auto_25942 ?auto_25945 ) ( ON ?auto_25942 ?auto_25950 ) ( CLEAR ?auto_25942 ) ( not ( = ?auto_25942 ?auto_25950 ) ) ( not ( = ?auto_25943 ?auto_25950 ) ) ( not ( = ?auto_25951 ?auto_25950 ) ) ( not ( = ?auto_25955 ?auto_25950 ) ) ( IS-CRATE ?auto_25951 ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( not ( = ?auto_25942 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25955 ?auto_25946 ) ) ( not ( = ?auto_25950 ?auto_25946 ) ) ( not ( = ?auto_25952 ?auto_25948 ) ) ( not ( = ?auto_25957 ?auto_25952 ) ) ( not ( = ?auto_25945 ?auto_25952 ) ) ( HOIST-AT ?auto_25947 ?auto_25952 ) ( not ( = ?auto_25954 ?auto_25947 ) ) ( not ( = ?auto_25958 ?auto_25947 ) ) ( not ( = ?auto_25944 ?auto_25947 ) ) ( AVAILABLE ?auto_25947 ) ( SURFACE-AT ?auto_25951 ?auto_25952 ) ( ON ?auto_25951 ?auto_25953 ) ( CLEAR ?auto_25951 ) ( not ( = ?auto_25942 ?auto_25953 ) ) ( not ( = ?auto_25943 ?auto_25953 ) ) ( not ( = ?auto_25951 ?auto_25953 ) ) ( not ( = ?auto_25955 ?auto_25953 ) ) ( not ( = ?auto_25950 ?auto_25953 ) ) ( not ( = ?auto_25946 ?auto_25953 ) ) ( TRUCK-AT ?auto_25949 ?auto_25948 ) ( SURFACE-AT ?auto_25956 ?auto_25948 ) ( CLEAR ?auto_25956 ) ( IS-CRATE ?auto_25946 ) ( not ( = ?auto_25956 ?auto_25946 ) ) ( not ( = ?auto_25942 ?auto_25956 ) ) ( not ( = ?auto_25943 ?auto_25956 ) ) ( not ( = ?auto_25951 ?auto_25956 ) ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( not ( = ?auto_25950 ?auto_25956 ) ) ( not ( = ?auto_25953 ?auto_25956 ) ) ( AVAILABLE ?auto_25954 ) ( IN ?auto_25946 ?auto_25949 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25954 ?auto_25946 ?auto_25949 ?auto_25948 )
      ( MAKE-2CRATE ?auto_25951 ?auto_25942 ?auto_25943 )
      ( MAKE-1CRATE-VERIFY ?auto_25942 ?auto_25943 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25959 - SURFACE
      ?auto_25960 - SURFACE
      ?auto_25961 - SURFACE
    )
    :vars
    (
      ?auto_25971 - HOIST
      ?auto_25970 - PLACE
      ?auto_25972 - PLACE
      ?auto_25974 - HOIST
      ?auto_25962 - SURFACE
      ?auto_25963 - PLACE
      ?auto_25975 - HOIST
      ?auto_25968 - SURFACE
      ?auto_25966 - SURFACE
      ?auto_25973 - PLACE
      ?auto_25969 - HOIST
      ?auto_25964 - SURFACE
      ?auto_25967 - TRUCK
      ?auto_25965 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25971 ?auto_25970 ) ( IS-CRATE ?auto_25961 ) ( not ( = ?auto_25960 ?auto_25961 ) ) ( not ( = ?auto_25959 ?auto_25960 ) ) ( not ( = ?auto_25959 ?auto_25961 ) ) ( not ( = ?auto_25972 ?auto_25970 ) ) ( HOIST-AT ?auto_25974 ?auto_25972 ) ( not ( = ?auto_25971 ?auto_25974 ) ) ( AVAILABLE ?auto_25974 ) ( SURFACE-AT ?auto_25961 ?auto_25972 ) ( ON ?auto_25961 ?auto_25962 ) ( CLEAR ?auto_25961 ) ( not ( = ?auto_25960 ?auto_25962 ) ) ( not ( = ?auto_25961 ?auto_25962 ) ) ( not ( = ?auto_25959 ?auto_25962 ) ) ( IS-CRATE ?auto_25960 ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( not ( = ?auto_25972 ?auto_25963 ) ) ( HOIST-AT ?auto_25975 ?auto_25963 ) ( not ( = ?auto_25971 ?auto_25975 ) ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( AVAILABLE ?auto_25975 ) ( SURFACE-AT ?auto_25960 ?auto_25963 ) ( ON ?auto_25960 ?auto_25968 ) ( CLEAR ?auto_25960 ) ( not ( = ?auto_25960 ?auto_25968 ) ) ( not ( = ?auto_25961 ?auto_25968 ) ) ( not ( = ?auto_25959 ?auto_25968 ) ) ( not ( = ?auto_25962 ?auto_25968 ) ) ( IS-CRATE ?auto_25959 ) ( not ( = ?auto_25966 ?auto_25959 ) ) ( not ( = ?auto_25960 ?auto_25966 ) ) ( not ( = ?auto_25961 ?auto_25966 ) ) ( not ( = ?auto_25962 ?auto_25966 ) ) ( not ( = ?auto_25968 ?auto_25966 ) ) ( not ( = ?auto_25973 ?auto_25970 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25963 ?auto_25973 ) ) ( HOIST-AT ?auto_25969 ?auto_25973 ) ( not ( = ?auto_25971 ?auto_25969 ) ) ( not ( = ?auto_25974 ?auto_25969 ) ) ( not ( = ?auto_25975 ?auto_25969 ) ) ( AVAILABLE ?auto_25969 ) ( SURFACE-AT ?auto_25959 ?auto_25973 ) ( ON ?auto_25959 ?auto_25964 ) ( CLEAR ?auto_25959 ) ( not ( = ?auto_25960 ?auto_25964 ) ) ( not ( = ?auto_25961 ?auto_25964 ) ) ( not ( = ?auto_25959 ?auto_25964 ) ) ( not ( = ?auto_25962 ?auto_25964 ) ) ( not ( = ?auto_25968 ?auto_25964 ) ) ( not ( = ?auto_25966 ?auto_25964 ) ) ( TRUCK-AT ?auto_25967 ?auto_25970 ) ( SURFACE-AT ?auto_25965 ?auto_25970 ) ( CLEAR ?auto_25965 ) ( IS-CRATE ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25960 ?auto_25965 ) ) ( not ( = ?auto_25961 ?auto_25965 ) ) ( not ( = ?auto_25959 ?auto_25965 ) ) ( not ( = ?auto_25962 ?auto_25965 ) ) ( not ( = ?auto_25968 ?auto_25965 ) ) ( not ( = ?auto_25964 ?auto_25965 ) ) ( AVAILABLE ?auto_25971 ) ( IN ?auto_25966 ?auto_25967 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25960 ?auto_25961 )
      ( MAKE-2CRATE-VERIFY ?auto_25959 ?auto_25960 ?auto_25961 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25976 - SURFACE
      ?auto_25977 - SURFACE
      ?auto_25978 - SURFACE
      ?auto_25979 - SURFACE
    )
    :vars
    (
      ?auto_25987 - HOIST
      ?auto_25985 - PLACE
      ?auto_25980 - PLACE
      ?auto_25982 - HOIST
      ?auto_25984 - SURFACE
      ?auto_25986 - PLACE
      ?auto_25981 - HOIST
      ?auto_25992 - SURFACE
      ?auto_25983 - PLACE
      ?auto_25990 - HOIST
      ?auto_25989 - SURFACE
      ?auto_25988 - TRUCK
      ?auto_25991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25987 ?auto_25985 ) ( IS-CRATE ?auto_25979 ) ( not ( = ?auto_25978 ?auto_25979 ) ) ( not ( = ?auto_25977 ?auto_25978 ) ) ( not ( = ?auto_25977 ?auto_25979 ) ) ( not ( = ?auto_25980 ?auto_25985 ) ) ( HOIST-AT ?auto_25982 ?auto_25980 ) ( not ( = ?auto_25987 ?auto_25982 ) ) ( AVAILABLE ?auto_25982 ) ( SURFACE-AT ?auto_25979 ?auto_25980 ) ( ON ?auto_25979 ?auto_25984 ) ( CLEAR ?auto_25979 ) ( not ( = ?auto_25978 ?auto_25984 ) ) ( not ( = ?auto_25979 ?auto_25984 ) ) ( not ( = ?auto_25977 ?auto_25984 ) ) ( IS-CRATE ?auto_25978 ) ( not ( = ?auto_25986 ?auto_25985 ) ) ( not ( = ?auto_25980 ?auto_25986 ) ) ( HOIST-AT ?auto_25981 ?auto_25986 ) ( not ( = ?auto_25987 ?auto_25981 ) ) ( not ( = ?auto_25982 ?auto_25981 ) ) ( AVAILABLE ?auto_25981 ) ( SURFACE-AT ?auto_25978 ?auto_25986 ) ( ON ?auto_25978 ?auto_25992 ) ( CLEAR ?auto_25978 ) ( not ( = ?auto_25978 ?auto_25992 ) ) ( not ( = ?auto_25979 ?auto_25992 ) ) ( not ( = ?auto_25977 ?auto_25992 ) ) ( not ( = ?auto_25984 ?auto_25992 ) ) ( IS-CRATE ?auto_25977 ) ( not ( = ?auto_25976 ?auto_25977 ) ) ( not ( = ?auto_25978 ?auto_25976 ) ) ( not ( = ?auto_25979 ?auto_25976 ) ) ( not ( = ?auto_25984 ?auto_25976 ) ) ( not ( = ?auto_25992 ?auto_25976 ) ) ( not ( = ?auto_25983 ?auto_25985 ) ) ( not ( = ?auto_25980 ?auto_25983 ) ) ( not ( = ?auto_25986 ?auto_25983 ) ) ( HOIST-AT ?auto_25990 ?auto_25983 ) ( not ( = ?auto_25987 ?auto_25990 ) ) ( not ( = ?auto_25982 ?auto_25990 ) ) ( not ( = ?auto_25981 ?auto_25990 ) ) ( AVAILABLE ?auto_25990 ) ( SURFACE-AT ?auto_25977 ?auto_25983 ) ( ON ?auto_25977 ?auto_25989 ) ( CLEAR ?auto_25977 ) ( not ( = ?auto_25978 ?auto_25989 ) ) ( not ( = ?auto_25979 ?auto_25989 ) ) ( not ( = ?auto_25977 ?auto_25989 ) ) ( not ( = ?auto_25984 ?auto_25989 ) ) ( not ( = ?auto_25992 ?auto_25989 ) ) ( not ( = ?auto_25976 ?auto_25989 ) ) ( TRUCK-AT ?auto_25988 ?auto_25985 ) ( SURFACE-AT ?auto_25991 ?auto_25985 ) ( CLEAR ?auto_25991 ) ( IS-CRATE ?auto_25976 ) ( not ( = ?auto_25991 ?auto_25976 ) ) ( not ( = ?auto_25978 ?auto_25991 ) ) ( not ( = ?auto_25979 ?auto_25991 ) ) ( not ( = ?auto_25977 ?auto_25991 ) ) ( not ( = ?auto_25984 ?auto_25991 ) ) ( not ( = ?auto_25992 ?auto_25991 ) ) ( not ( = ?auto_25989 ?auto_25991 ) ) ( AVAILABLE ?auto_25987 ) ( IN ?auto_25976 ?auto_25988 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25977 ?auto_25978 ?auto_25979 )
      ( MAKE-3CRATE-VERIFY ?auto_25976 ?auto_25977 ?auto_25978 ?auto_25979 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25993 - SURFACE
      ?auto_25994 - SURFACE
      ?auto_25995 - SURFACE
      ?auto_25996 - SURFACE
      ?auto_25997 - SURFACE
    )
    :vars
    (
      ?auto_26005 - HOIST
      ?auto_26003 - PLACE
      ?auto_25998 - PLACE
      ?auto_26000 - HOIST
      ?auto_26002 - SURFACE
      ?auto_26004 - PLACE
      ?auto_25999 - HOIST
      ?auto_26009 - SURFACE
      ?auto_26001 - PLACE
      ?auto_26008 - HOIST
      ?auto_26007 - SURFACE
      ?auto_26006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26005 ?auto_26003 ) ( IS-CRATE ?auto_25997 ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( not ( = ?auto_25995 ?auto_25996 ) ) ( not ( = ?auto_25995 ?auto_25997 ) ) ( not ( = ?auto_25998 ?auto_26003 ) ) ( HOIST-AT ?auto_26000 ?auto_25998 ) ( not ( = ?auto_26005 ?auto_26000 ) ) ( AVAILABLE ?auto_26000 ) ( SURFACE-AT ?auto_25997 ?auto_25998 ) ( ON ?auto_25997 ?auto_26002 ) ( CLEAR ?auto_25997 ) ( not ( = ?auto_25996 ?auto_26002 ) ) ( not ( = ?auto_25997 ?auto_26002 ) ) ( not ( = ?auto_25995 ?auto_26002 ) ) ( IS-CRATE ?auto_25996 ) ( not ( = ?auto_26004 ?auto_26003 ) ) ( not ( = ?auto_25998 ?auto_26004 ) ) ( HOIST-AT ?auto_25999 ?auto_26004 ) ( not ( = ?auto_26005 ?auto_25999 ) ) ( not ( = ?auto_26000 ?auto_25999 ) ) ( AVAILABLE ?auto_25999 ) ( SURFACE-AT ?auto_25996 ?auto_26004 ) ( ON ?auto_25996 ?auto_26009 ) ( CLEAR ?auto_25996 ) ( not ( = ?auto_25996 ?auto_26009 ) ) ( not ( = ?auto_25997 ?auto_26009 ) ) ( not ( = ?auto_25995 ?auto_26009 ) ) ( not ( = ?auto_26002 ?auto_26009 ) ) ( IS-CRATE ?auto_25995 ) ( not ( = ?auto_25994 ?auto_25995 ) ) ( not ( = ?auto_25996 ?auto_25994 ) ) ( not ( = ?auto_25997 ?auto_25994 ) ) ( not ( = ?auto_26002 ?auto_25994 ) ) ( not ( = ?auto_26009 ?auto_25994 ) ) ( not ( = ?auto_26001 ?auto_26003 ) ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_26004 ?auto_26001 ) ) ( HOIST-AT ?auto_26008 ?auto_26001 ) ( not ( = ?auto_26005 ?auto_26008 ) ) ( not ( = ?auto_26000 ?auto_26008 ) ) ( not ( = ?auto_25999 ?auto_26008 ) ) ( AVAILABLE ?auto_26008 ) ( SURFACE-AT ?auto_25995 ?auto_26001 ) ( ON ?auto_25995 ?auto_26007 ) ( CLEAR ?auto_25995 ) ( not ( = ?auto_25996 ?auto_26007 ) ) ( not ( = ?auto_25997 ?auto_26007 ) ) ( not ( = ?auto_25995 ?auto_26007 ) ) ( not ( = ?auto_26002 ?auto_26007 ) ) ( not ( = ?auto_26009 ?auto_26007 ) ) ( not ( = ?auto_25994 ?auto_26007 ) ) ( TRUCK-AT ?auto_26006 ?auto_26003 ) ( SURFACE-AT ?auto_25993 ?auto_26003 ) ( CLEAR ?auto_25993 ) ( IS-CRATE ?auto_25994 ) ( not ( = ?auto_25993 ?auto_25994 ) ) ( not ( = ?auto_25996 ?auto_25993 ) ) ( not ( = ?auto_25997 ?auto_25993 ) ) ( not ( = ?auto_25995 ?auto_25993 ) ) ( not ( = ?auto_26002 ?auto_25993 ) ) ( not ( = ?auto_26009 ?auto_25993 ) ) ( not ( = ?auto_26007 ?auto_25993 ) ) ( AVAILABLE ?auto_26005 ) ( IN ?auto_25994 ?auto_26006 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25995 ?auto_25996 ?auto_25997 )
      ( MAKE-4CRATE-VERIFY ?auto_25993 ?auto_25994 ?auto_25995 ?auto_25996 ?auto_25997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26010 - SURFACE
      ?auto_26011 - SURFACE
    )
    :vars
    (
      ?auto_26020 - HOIST
      ?auto_26018 - PLACE
      ?auto_26016 - SURFACE
      ?auto_26012 - PLACE
      ?auto_26014 - HOIST
      ?auto_26017 - SURFACE
      ?auto_26019 - PLACE
      ?auto_26013 - HOIST
      ?auto_26026 - SURFACE
      ?auto_26021 - SURFACE
      ?auto_26015 - PLACE
      ?auto_26024 - HOIST
      ?auto_26023 - SURFACE
      ?auto_26025 - SURFACE
      ?auto_26022 - TRUCK
      ?auto_26027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26020 ?auto_26018 ) ( IS-CRATE ?auto_26011 ) ( not ( = ?auto_26010 ?auto_26011 ) ) ( not ( = ?auto_26016 ?auto_26010 ) ) ( not ( = ?auto_26016 ?auto_26011 ) ) ( not ( = ?auto_26012 ?auto_26018 ) ) ( HOIST-AT ?auto_26014 ?auto_26012 ) ( not ( = ?auto_26020 ?auto_26014 ) ) ( AVAILABLE ?auto_26014 ) ( SURFACE-AT ?auto_26011 ?auto_26012 ) ( ON ?auto_26011 ?auto_26017 ) ( CLEAR ?auto_26011 ) ( not ( = ?auto_26010 ?auto_26017 ) ) ( not ( = ?auto_26011 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( IS-CRATE ?auto_26010 ) ( not ( = ?auto_26019 ?auto_26018 ) ) ( not ( = ?auto_26012 ?auto_26019 ) ) ( HOIST-AT ?auto_26013 ?auto_26019 ) ( not ( = ?auto_26020 ?auto_26013 ) ) ( not ( = ?auto_26014 ?auto_26013 ) ) ( AVAILABLE ?auto_26013 ) ( SURFACE-AT ?auto_26010 ?auto_26019 ) ( ON ?auto_26010 ?auto_26026 ) ( CLEAR ?auto_26010 ) ( not ( = ?auto_26010 ?auto_26026 ) ) ( not ( = ?auto_26011 ?auto_26026 ) ) ( not ( = ?auto_26016 ?auto_26026 ) ) ( not ( = ?auto_26017 ?auto_26026 ) ) ( IS-CRATE ?auto_26016 ) ( not ( = ?auto_26021 ?auto_26016 ) ) ( not ( = ?auto_26010 ?auto_26021 ) ) ( not ( = ?auto_26011 ?auto_26021 ) ) ( not ( = ?auto_26017 ?auto_26021 ) ) ( not ( = ?auto_26026 ?auto_26021 ) ) ( not ( = ?auto_26015 ?auto_26018 ) ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26019 ?auto_26015 ) ) ( HOIST-AT ?auto_26024 ?auto_26015 ) ( not ( = ?auto_26020 ?auto_26024 ) ) ( not ( = ?auto_26014 ?auto_26024 ) ) ( not ( = ?auto_26013 ?auto_26024 ) ) ( AVAILABLE ?auto_26024 ) ( SURFACE-AT ?auto_26016 ?auto_26015 ) ( ON ?auto_26016 ?auto_26023 ) ( CLEAR ?auto_26016 ) ( not ( = ?auto_26010 ?auto_26023 ) ) ( not ( = ?auto_26011 ?auto_26023 ) ) ( not ( = ?auto_26016 ?auto_26023 ) ) ( not ( = ?auto_26017 ?auto_26023 ) ) ( not ( = ?auto_26026 ?auto_26023 ) ) ( not ( = ?auto_26021 ?auto_26023 ) ) ( SURFACE-AT ?auto_26025 ?auto_26018 ) ( CLEAR ?auto_26025 ) ( IS-CRATE ?auto_26021 ) ( not ( = ?auto_26025 ?auto_26021 ) ) ( not ( = ?auto_26010 ?auto_26025 ) ) ( not ( = ?auto_26011 ?auto_26025 ) ) ( not ( = ?auto_26016 ?auto_26025 ) ) ( not ( = ?auto_26017 ?auto_26025 ) ) ( not ( = ?auto_26026 ?auto_26025 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( AVAILABLE ?auto_26020 ) ( IN ?auto_26021 ?auto_26022 ) ( TRUCK-AT ?auto_26022 ?auto_26027 ) ( not ( = ?auto_26027 ?auto_26018 ) ) ( not ( = ?auto_26012 ?auto_26027 ) ) ( not ( = ?auto_26019 ?auto_26027 ) ) ( not ( = ?auto_26015 ?auto_26027 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26022 ?auto_26027 ?auto_26018 )
      ( MAKE-2CRATE ?auto_26016 ?auto_26010 ?auto_26011 )
      ( MAKE-1CRATE-VERIFY ?auto_26010 ?auto_26011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26028 - SURFACE
      ?auto_26029 - SURFACE
      ?auto_26030 - SURFACE
    )
    :vars
    (
      ?auto_26033 - HOIST
      ?auto_26045 - PLACE
      ?auto_26038 - PLACE
      ?auto_26031 - HOIST
      ?auto_26041 - SURFACE
      ?auto_26032 - PLACE
      ?auto_26043 - HOIST
      ?auto_26034 - SURFACE
      ?auto_26036 - SURFACE
      ?auto_26044 - PLACE
      ?auto_26040 - HOIST
      ?auto_26035 - SURFACE
      ?auto_26042 - SURFACE
      ?auto_26037 - TRUCK
      ?auto_26039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26033 ?auto_26045 ) ( IS-CRATE ?auto_26030 ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( not ( = ?auto_26038 ?auto_26045 ) ) ( HOIST-AT ?auto_26031 ?auto_26038 ) ( not ( = ?auto_26033 ?auto_26031 ) ) ( AVAILABLE ?auto_26031 ) ( SURFACE-AT ?auto_26030 ?auto_26038 ) ( ON ?auto_26030 ?auto_26041 ) ( CLEAR ?auto_26030 ) ( not ( = ?auto_26029 ?auto_26041 ) ) ( not ( = ?auto_26030 ?auto_26041 ) ) ( not ( = ?auto_26028 ?auto_26041 ) ) ( IS-CRATE ?auto_26029 ) ( not ( = ?auto_26032 ?auto_26045 ) ) ( not ( = ?auto_26038 ?auto_26032 ) ) ( HOIST-AT ?auto_26043 ?auto_26032 ) ( not ( = ?auto_26033 ?auto_26043 ) ) ( not ( = ?auto_26031 ?auto_26043 ) ) ( AVAILABLE ?auto_26043 ) ( SURFACE-AT ?auto_26029 ?auto_26032 ) ( ON ?auto_26029 ?auto_26034 ) ( CLEAR ?auto_26029 ) ( not ( = ?auto_26029 ?auto_26034 ) ) ( not ( = ?auto_26030 ?auto_26034 ) ) ( not ( = ?auto_26028 ?auto_26034 ) ) ( not ( = ?auto_26041 ?auto_26034 ) ) ( IS-CRATE ?auto_26028 ) ( not ( = ?auto_26036 ?auto_26028 ) ) ( not ( = ?auto_26029 ?auto_26036 ) ) ( not ( = ?auto_26030 ?auto_26036 ) ) ( not ( = ?auto_26041 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26038 ?auto_26044 ) ) ( not ( = ?auto_26032 ?auto_26044 ) ) ( HOIST-AT ?auto_26040 ?auto_26044 ) ( not ( = ?auto_26033 ?auto_26040 ) ) ( not ( = ?auto_26031 ?auto_26040 ) ) ( not ( = ?auto_26043 ?auto_26040 ) ) ( AVAILABLE ?auto_26040 ) ( SURFACE-AT ?auto_26028 ?auto_26044 ) ( ON ?auto_26028 ?auto_26035 ) ( CLEAR ?auto_26028 ) ( not ( = ?auto_26029 ?auto_26035 ) ) ( not ( = ?auto_26030 ?auto_26035 ) ) ( not ( = ?auto_26028 ?auto_26035 ) ) ( not ( = ?auto_26041 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( not ( = ?auto_26036 ?auto_26035 ) ) ( SURFACE-AT ?auto_26042 ?auto_26045 ) ( CLEAR ?auto_26042 ) ( IS-CRATE ?auto_26036 ) ( not ( = ?auto_26042 ?auto_26036 ) ) ( not ( = ?auto_26029 ?auto_26042 ) ) ( not ( = ?auto_26030 ?auto_26042 ) ) ( not ( = ?auto_26028 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26034 ?auto_26042 ) ) ( not ( = ?auto_26035 ?auto_26042 ) ) ( AVAILABLE ?auto_26033 ) ( IN ?auto_26036 ?auto_26037 ) ( TRUCK-AT ?auto_26037 ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26045 ) ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26032 ?auto_26039 ) ) ( not ( = ?auto_26044 ?auto_26039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26029 ?auto_26030 )
      ( MAKE-2CRATE-VERIFY ?auto_26028 ?auto_26029 ?auto_26030 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26046 - SURFACE
      ?auto_26047 - SURFACE
      ?auto_26048 - SURFACE
      ?auto_26049 - SURFACE
    )
    :vars
    (
      ?auto_26056 - HOIST
      ?auto_26053 - PLACE
      ?auto_26050 - PLACE
      ?auto_26054 - HOIST
      ?auto_26060 - SURFACE
      ?auto_26058 - PLACE
      ?auto_26061 - HOIST
      ?auto_26055 - SURFACE
      ?auto_26063 - PLACE
      ?auto_26052 - HOIST
      ?auto_26051 - SURFACE
      ?auto_26057 - SURFACE
      ?auto_26062 - TRUCK
      ?auto_26059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26056 ?auto_26053 ) ( IS-CRATE ?auto_26049 ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( HOIST-AT ?auto_26054 ?auto_26050 ) ( not ( = ?auto_26056 ?auto_26054 ) ) ( AVAILABLE ?auto_26054 ) ( SURFACE-AT ?auto_26049 ?auto_26050 ) ( ON ?auto_26049 ?auto_26060 ) ( CLEAR ?auto_26049 ) ( not ( = ?auto_26048 ?auto_26060 ) ) ( not ( = ?auto_26049 ?auto_26060 ) ) ( not ( = ?auto_26047 ?auto_26060 ) ) ( IS-CRATE ?auto_26048 ) ( not ( = ?auto_26058 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26058 ) ) ( HOIST-AT ?auto_26061 ?auto_26058 ) ( not ( = ?auto_26056 ?auto_26061 ) ) ( not ( = ?auto_26054 ?auto_26061 ) ) ( AVAILABLE ?auto_26061 ) ( SURFACE-AT ?auto_26048 ?auto_26058 ) ( ON ?auto_26048 ?auto_26055 ) ( CLEAR ?auto_26048 ) ( not ( = ?auto_26048 ?auto_26055 ) ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( not ( = ?auto_26047 ?auto_26055 ) ) ( not ( = ?auto_26060 ?auto_26055 ) ) ( IS-CRATE ?auto_26047 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( not ( = ?auto_26048 ?auto_26046 ) ) ( not ( = ?auto_26049 ?auto_26046 ) ) ( not ( = ?auto_26060 ?auto_26046 ) ) ( not ( = ?auto_26055 ?auto_26046 ) ) ( not ( = ?auto_26063 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26063 ) ) ( not ( = ?auto_26058 ?auto_26063 ) ) ( HOIST-AT ?auto_26052 ?auto_26063 ) ( not ( = ?auto_26056 ?auto_26052 ) ) ( not ( = ?auto_26054 ?auto_26052 ) ) ( not ( = ?auto_26061 ?auto_26052 ) ) ( AVAILABLE ?auto_26052 ) ( SURFACE-AT ?auto_26047 ?auto_26063 ) ( ON ?auto_26047 ?auto_26051 ) ( CLEAR ?auto_26047 ) ( not ( = ?auto_26048 ?auto_26051 ) ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26047 ?auto_26051 ) ) ( not ( = ?auto_26060 ?auto_26051 ) ) ( not ( = ?auto_26055 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26051 ) ) ( SURFACE-AT ?auto_26057 ?auto_26053 ) ( CLEAR ?auto_26057 ) ( IS-CRATE ?auto_26046 ) ( not ( = ?auto_26057 ?auto_26046 ) ) ( not ( = ?auto_26048 ?auto_26057 ) ) ( not ( = ?auto_26049 ?auto_26057 ) ) ( not ( = ?auto_26047 ?auto_26057 ) ) ( not ( = ?auto_26060 ?auto_26057 ) ) ( not ( = ?auto_26055 ?auto_26057 ) ) ( not ( = ?auto_26051 ?auto_26057 ) ) ( AVAILABLE ?auto_26056 ) ( IN ?auto_26046 ?auto_26062 ) ( TRUCK-AT ?auto_26062 ?auto_26059 ) ( not ( = ?auto_26059 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26059 ) ) ( not ( = ?auto_26058 ?auto_26059 ) ) ( not ( = ?auto_26063 ?auto_26059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26047 ?auto_26048 ?auto_26049 )
      ( MAKE-3CRATE-VERIFY ?auto_26046 ?auto_26047 ?auto_26048 ?auto_26049 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26064 - SURFACE
      ?auto_26065 - SURFACE
      ?auto_26066 - SURFACE
      ?auto_26067 - SURFACE
      ?auto_26068 - SURFACE
    )
    :vars
    (
      ?auto_26075 - HOIST
      ?auto_26072 - PLACE
      ?auto_26069 - PLACE
      ?auto_26073 - HOIST
      ?auto_26078 - SURFACE
      ?auto_26076 - PLACE
      ?auto_26079 - HOIST
      ?auto_26074 - SURFACE
      ?auto_26081 - PLACE
      ?auto_26071 - HOIST
      ?auto_26070 - SURFACE
      ?auto_26080 - TRUCK
      ?auto_26077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26075 ?auto_26072 ) ( IS-CRATE ?auto_26068 ) ( not ( = ?auto_26067 ?auto_26068 ) ) ( not ( = ?auto_26066 ?auto_26067 ) ) ( not ( = ?auto_26066 ?auto_26068 ) ) ( not ( = ?auto_26069 ?auto_26072 ) ) ( HOIST-AT ?auto_26073 ?auto_26069 ) ( not ( = ?auto_26075 ?auto_26073 ) ) ( AVAILABLE ?auto_26073 ) ( SURFACE-AT ?auto_26068 ?auto_26069 ) ( ON ?auto_26068 ?auto_26078 ) ( CLEAR ?auto_26068 ) ( not ( = ?auto_26067 ?auto_26078 ) ) ( not ( = ?auto_26068 ?auto_26078 ) ) ( not ( = ?auto_26066 ?auto_26078 ) ) ( IS-CRATE ?auto_26067 ) ( not ( = ?auto_26076 ?auto_26072 ) ) ( not ( = ?auto_26069 ?auto_26076 ) ) ( HOIST-AT ?auto_26079 ?auto_26076 ) ( not ( = ?auto_26075 ?auto_26079 ) ) ( not ( = ?auto_26073 ?auto_26079 ) ) ( AVAILABLE ?auto_26079 ) ( SURFACE-AT ?auto_26067 ?auto_26076 ) ( ON ?auto_26067 ?auto_26074 ) ( CLEAR ?auto_26067 ) ( not ( = ?auto_26067 ?auto_26074 ) ) ( not ( = ?auto_26068 ?auto_26074 ) ) ( not ( = ?auto_26066 ?auto_26074 ) ) ( not ( = ?auto_26078 ?auto_26074 ) ) ( IS-CRATE ?auto_26066 ) ( not ( = ?auto_26065 ?auto_26066 ) ) ( not ( = ?auto_26067 ?auto_26065 ) ) ( not ( = ?auto_26068 ?auto_26065 ) ) ( not ( = ?auto_26078 ?auto_26065 ) ) ( not ( = ?auto_26074 ?auto_26065 ) ) ( not ( = ?auto_26081 ?auto_26072 ) ) ( not ( = ?auto_26069 ?auto_26081 ) ) ( not ( = ?auto_26076 ?auto_26081 ) ) ( HOIST-AT ?auto_26071 ?auto_26081 ) ( not ( = ?auto_26075 ?auto_26071 ) ) ( not ( = ?auto_26073 ?auto_26071 ) ) ( not ( = ?auto_26079 ?auto_26071 ) ) ( AVAILABLE ?auto_26071 ) ( SURFACE-AT ?auto_26066 ?auto_26081 ) ( ON ?auto_26066 ?auto_26070 ) ( CLEAR ?auto_26066 ) ( not ( = ?auto_26067 ?auto_26070 ) ) ( not ( = ?auto_26068 ?auto_26070 ) ) ( not ( = ?auto_26066 ?auto_26070 ) ) ( not ( = ?auto_26078 ?auto_26070 ) ) ( not ( = ?auto_26074 ?auto_26070 ) ) ( not ( = ?auto_26065 ?auto_26070 ) ) ( SURFACE-AT ?auto_26064 ?auto_26072 ) ( CLEAR ?auto_26064 ) ( IS-CRATE ?auto_26065 ) ( not ( = ?auto_26064 ?auto_26065 ) ) ( not ( = ?auto_26067 ?auto_26064 ) ) ( not ( = ?auto_26068 ?auto_26064 ) ) ( not ( = ?auto_26066 ?auto_26064 ) ) ( not ( = ?auto_26078 ?auto_26064 ) ) ( not ( = ?auto_26074 ?auto_26064 ) ) ( not ( = ?auto_26070 ?auto_26064 ) ) ( AVAILABLE ?auto_26075 ) ( IN ?auto_26065 ?auto_26080 ) ( TRUCK-AT ?auto_26080 ?auto_26077 ) ( not ( = ?auto_26077 ?auto_26072 ) ) ( not ( = ?auto_26069 ?auto_26077 ) ) ( not ( = ?auto_26076 ?auto_26077 ) ) ( not ( = ?auto_26081 ?auto_26077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26066 ?auto_26067 ?auto_26068 )
      ( MAKE-4CRATE-VERIFY ?auto_26064 ?auto_26065 ?auto_26066 ?auto_26067 ?auto_26068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26082 - SURFACE
      ?auto_26083 - SURFACE
    )
    :vars
    (
      ?auto_26090 - HOIST
      ?auto_26087 - PLACE
      ?auto_26098 - SURFACE
      ?auto_26084 - PLACE
      ?auto_26088 - HOIST
      ?auto_26095 - SURFACE
      ?auto_26093 - PLACE
      ?auto_26096 - HOIST
      ?auto_26089 - SURFACE
      ?auto_26091 - SURFACE
      ?auto_26099 - PLACE
      ?auto_26086 - HOIST
      ?auto_26085 - SURFACE
      ?auto_26092 - SURFACE
      ?auto_26097 - TRUCK
      ?auto_26094 - PLACE
      ?auto_26100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26090 ?auto_26087 ) ( IS-CRATE ?auto_26083 ) ( not ( = ?auto_26082 ?auto_26083 ) ) ( not ( = ?auto_26098 ?auto_26082 ) ) ( not ( = ?auto_26098 ?auto_26083 ) ) ( not ( = ?auto_26084 ?auto_26087 ) ) ( HOIST-AT ?auto_26088 ?auto_26084 ) ( not ( = ?auto_26090 ?auto_26088 ) ) ( AVAILABLE ?auto_26088 ) ( SURFACE-AT ?auto_26083 ?auto_26084 ) ( ON ?auto_26083 ?auto_26095 ) ( CLEAR ?auto_26083 ) ( not ( = ?auto_26082 ?auto_26095 ) ) ( not ( = ?auto_26083 ?auto_26095 ) ) ( not ( = ?auto_26098 ?auto_26095 ) ) ( IS-CRATE ?auto_26082 ) ( not ( = ?auto_26093 ?auto_26087 ) ) ( not ( = ?auto_26084 ?auto_26093 ) ) ( HOIST-AT ?auto_26096 ?auto_26093 ) ( not ( = ?auto_26090 ?auto_26096 ) ) ( not ( = ?auto_26088 ?auto_26096 ) ) ( AVAILABLE ?auto_26096 ) ( SURFACE-AT ?auto_26082 ?auto_26093 ) ( ON ?auto_26082 ?auto_26089 ) ( CLEAR ?auto_26082 ) ( not ( = ?auto_26082 ?auto_26089 ) ) ( not ( = ?auto_26083 ?auto_26089 ) ) ( not ( = ?auto_26098 ?auto_26089 ) ) ( not ( = ?auto_26095 ?auto_26089 ) ) ( IS-CRATE ?auto_26098 ) ( not ( = ?auto_26091 ?auto_26098 ) ) ( not ( = ?auto_26082 ?auto_26091 ) ) ( not ( = ?auto_26083 ?auto_26091 ) ) ( not ( = ?auto_26095 ?auto_26091 ) ) ( not ( = ?auto_26089 ?auto_26091 ) ) ( not ( = ?auto_26099 ?auto_26087 ) ) ( not ( = ?auto_26084 ?auto_26099 ) ) ( not ( = ?auto_26093 ?auto_26099 ) ) ( HOIST-AT ?auto_26086 ?auto_26099 ) ( not ( = ?auto_26090 ?auto_26086 ) ) ( not ( = ?auto_26088 ?auto_26086 ) ) ( not ( = ?auto_26096 ?auto_26086 ) ) ( AVAILABLE ?auto_26086 ) ( SURFACE-AT ?auto_26098 ?auto_26099 ) ( ON ?auto_26098 ?auto_26085 ) ( CLEAR ?auto_26098 ) ( not ( = ?auto_26082 ?auto_26085 ) ) ( not ( = ?auto_26083 ?auto_26085 ) ) ( not ( = ?auto_26098 ?auto_26085 ) ) ( not ( = ?auto_26095 ?auto_26085 ) ) ( not ( = ?auto_26089 ?auto_26085 ) ) ( not ( = ?auto_26091 ?auto_26085 ) ) ( SURFACE-AT ?auto_26092 ?auto_26087 ) ( CLEAR ?auto_26092 ) ( IS-CRATE ?auto_26091 ) ( not ( = ?auto_26092 ?auto_26091 ) ) ( not ( = ?auto_26082 ?auto_26092 ) ) ( not ( = ?auto_26083 ?auto_26092 ) ) ( not ( = ?auto_26098 ?auto_26092 ) ) ( not ( = ?auto_26095 ?auto_26092 ) ) ( not ( = ?auto_26089 ?auto_26092 ) ) ( not ( = ?auto_26085 ?auto_26092 ) ) ( AVAILABLE ?auto_26090 ) ( TRUCK-AT ?auto_26097 ?auto_26094 ) ( not ( = ?auto_26094 ?auto_26087 ) ) ( not ( = ?auto_26084 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26099 ?auto_26094 ) ) ( HOIST-AT ?auto_26100 ?auto_26094 ) ( LIFTING ?auto_26100 ?auto_26091 ) ( not ( = ?auto_26090 ?auto_26100 ) ) ( not ( = ?auto_26088 ?auto_26100 ) ) ( not ( = ?auto_26096 ?auto_26100 ) ) ( not ( = ?auto_26086 ?auto_26100 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26100 ?auto_26091 ?auto_26097 ?auto_26094 )
      ( MAKE-2CRATE ?auto_26098 ?auto_26082 ?auto_26083 )
      ( MAKE-1CRATE-VERIFY ?auto_26082 ?auto_26083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26101 - SURFACE
      ?auto_26102 - SURFACE
      ?auto_26103 - SURFACE
    )
    :vars
    (
      ?auto_26115 - HOIST
      ?auto_26106 - PLACE
      ?auto_26109 - PLACE
      ?auto_26117 - HOIST
      ?auto_26107 - SURFACE
      ?auto_26119 - PLACE
      ?auto_26111 - HOIST
      ?auto_26113 - SURFACE
      ?auto_26104 - SURFACE
      ?auto_26114 - PLACE
      ?auto_26112 - HOIST
      ?auto_26110 - SURFACE
      ?auto_26116 - SURFACE
      ?auto_26108 - TRUCK
      ?auto_26118 - PLACE
      ?auto_26105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26115 ?auto_26106 ) ( IS-CRATE ?auto_26103 ) ( not ( = ?auto_26102 ?auto_26103 ) ) ( not ( = ?auto_26101 ?auto_26102 ) ) ( not ( = ?auto_26101 ?auto_26103 ) ) ( not ( = ?auto_26109 ?auto_26106 ) ) ( HOIST-AT ?auto_26117 ?auto_26109 ) ( not ( = ?auto_26115 ?auto_26117 ) ) ( AVAILABLE ?auto_26117 ) ( SURFACE-AT ?auto_26103 ?auto_26109 ) ( ON ?auto_26103 ?auto_26107 ) ( CLEAR ?auto_26103 ) ( not ( = ?auto_26102 ?auto_26107 ) ) ( not ( = ?auto_26103 ?auto_26107 ) ) ( not ( = ?auto_26101 ?auto_26107 ) ) ( IS-CRATE ?auto_26102 ) ( not ( = ?auto_26119 ?auto_26106 ) ) ( not ( = ?auto_26109 ?auto_26119 ) ) ( HOIST-AT ?auto_26111 ?auto_26119 ) ( not ( = ?auto_26115 ?auto_26111 ) ) ( not ( = ?auto_26117 ?auto_26111 ) ) ( AVAILABLE ?auto_26111 ) ( SURFACE-AT ?auto_26102 ?auto_26119 ) ( ON ?auto_26102 ?auto_26113 ) ( CLEAR ?auto_26102 ) ( not ( = ?auto_26102 ?auto_26113 ) ) ( not ( = ?auto_26103 ?auto_26113 ) ) ( not ( = ?auto_26101 ?auto_26113 ) ) ( not ( = ?auto_26107 ?auto_26113 ) ) ( IS-CRATE ?auto_26101 ) ( not ( = ?auto_26104 ?auto_26101 ) ) ( not ( = ?auto_26102 ?auto_26104 ) ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( not ( = ?auto_26107 ?auto_26104 ) ) ( not ( = ?auto_26113 ?auto_26104 ) ) ( not ( = ?auto_26114 ?auto_26106 ) ) ( not ( = ?auto_26109 ?auto_26114 ) ) ( not ( = ?auto_26119 ?auto_26114 ) ) ( HOIST-AT ?auto_26112 ?auto_26114 ) ( not ( = ?auto_26115 ?auto_26112 ) ) ( not ( = ?auto_26117 ?auto_26112 ) ) ( not ( = ?auto_26111 ?auto_26112 ) ) ( AVAILABLE ?auto_26112 ) ( SURFACE-AT ?auto_26101 ?auto_26114 ) ( ON ?auto_26101 ?auto_26110 ) ( CLEAR ?auto_26101 ) ( not ( = ?auto_26102 ?auto_26110 ) ) ( not ( = ?auto_26103 ?auto_26110 ) ) ( not ( = ?auto_26101 ?auto_26110 ) ) ( not ( = ?auto_26107 ?auto_26110 ) ) ( not ( = ?auto_26113 ?auto_26110 ) ) ( not ( = ?auto_26104 ?auto_26110 ) ) ( SURFACE-AT ?auto_26116 ?auto_26106 ) ( CLEAR ?auto_26116 ) ( IS-CRATE ?auto_26104 ) ( not ( = ?auto_26116 ?auto_26104 ) ) ( not ( = ?auto_26102 ?auto_26116 ) ) ( not ( = ?auto_26103 ?auto_26116 ) ) ( not ( = ?auto_26101 ?auto_26116 ) ) ( not ( = ?auto_26107 ?auto_26116 ) ) ( not ( = ?auto_26113 ?auto_26116 ) ) ( not ( = ?auto_26110 ?auto_26116 ) ) ( AVAILABLE ?auto_26115 ) ( TRUCK-AT ?auto_26108 ?auto_26118 ) ( not ( = ?auto_26118 ?auto_26106 ) ) ( not ( = ?auto_26109 ?auto_26118 ) ) ( not ( = ?auto_26119 ?auto_26118 ) ) ( not ( = ?auto_26114 ?auto_26118 ) ) ( HOIST-AT ?auto_26105 ?auto_26118 ) ( LIFTING ?auto_26105 ?auto_26104 ) ( not ( = ?auto_26115 ?auto_26105 ) ) ( not ( = ?auto_26117 ?auto_26105 ) ) ( not ( = ?auto_26111 ?auto_26105 ) ) ( not ( = ?auto_26112 ?auto_26105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26102 ?auto_26103 )
      ( MAKE-2CRATE-VERIFY ?auto_26101 ?auto_26102 ?auto_26103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26120 - SURFACE
      ?auto_26121 - SURFACE
      ?auto_26122 - SURFACE
      ?auto_26123 - SURFACE
    )
    :vars
    (
      ?auto_26125 - HOIST
      ?auto_26134 - PLACE
      ?auto_26124 - PLACE
      ?auto_26131 - HOIST
      ?auto_26132 - SURFACE
      ?auto_26128 - PLACE
      ?auto_26135 - HOIST
      ?auto_26133 - SURFACE
      ?auto_26130 - PLACE
      ?auto_26138 - HOIST
      ?auto_26136 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26126 - TRUCK
      ?auto_26137 - PLACE
      ?auto_26127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26125 ?auto_26134 ) ( IS-CRATE ?auto_26123 ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( not ( = ?auto_26121 ?auto_26122 ) ) ( not ( = ?auto_26121 ?auto_26123 ) ) ( not ( = ?auto_26124 ?auto_26134 ) ) ( HOIST-AT ?auto_26131 ?auto_26124 ) ( not ( = ?auto_26125 ?auto_26131 ) ) ( AVAILABLE ?auto_26131 ) ( SURFACE-AT ?auto_26123 ?auto_26124 ) ( ON ?auto_26123 ?auto_26132 ) ( CLEAR ?auto_26123 ) ( not ( = ?auto_26122 ?auto_26132 ) ) ( not ( = ?auto_26123 ?auto_26132 ) ) ( not ( = ?auto_26121 ?auto_26132 ) ) ( IS-CRATE ?auto_26122 ) ( not ( = ?auto_26128 ?auto_26134 ) ) ( not ( = ?auto_26124 ?auto_26128 ) ) ( HOIST-AT ?auto_26135 ?auto_26128 ) ( not ( = ?auto_26125 ?auto_26135 ) ) ( not ( = ?auto_26131 ?auto_26135 ) ) ( AVAILABLE ?auto_26135 ) ( SURFACE-AT ?auto_26122 ?auto_26128 ) ( ON ?auto_26122 ?auto_26133 ) ( CLEAR ?auto_26122 ) ( not ( = ?auto_26122 ?auto_26133 ) ) ( not ( = ?auto_26123 ?auto_26133 ) ) ( not ( = ?auto_26121 ?auto_26133 ) ) ( not ( = ?auto_26132 ?auto_26133 ) ) ( IS-CRATE ?auto_26121 ) ( not ( = ?auto_26120 ?auto_26121 ) ) ( not ( = ?auto_26122 ?auto_26120 ) ) ( not ( = ?auto_26123 ?auto_26120 ) ) ( not ( = ?auto_26132 ?auto_26120 ) ) ( not ( = ?auto_26133 ?auto_26120 ) ) ( not ( = ?auto_26130 ?auto_26134 ) ) ( not ( = ?auto_26124 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( HOIST-AT ?auto_26138 ?auto_26130 ) ( not ( = ?auto_26125 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( not ( = ?auto_26135 ?auto_26138 ) ) ( AVAILABLE ?auto_26138 ) ( SURFACE-AT ?auto_26121 ?auto_26130 ) ( ON ?auto_26121 ?auto_26136 ) ( CLEAR ?auto_26121 ) ( not ( = ?auto_26122 ?auto_26136 ) ) ( not ( = ?auto_26123 ?auto_26136 ) ) ( not ( = ?auto_26121 ?auto_26136 ) ) ( not ( = ?auto_26132 ?auto_26136 ) ) ( not ( = ?auto_26133 ?auto_26136 ) ) ( not ( = ?auto_26120 ?auto_26136 ) ) ( SURFACE-AT ?auto_26129 ?auto_26134 ) ( CLEAR ?auto_26129 ) ( IS-CRATE ?auto_26120 ) ( not ( = ?auto_26129 ?auto_26120 ) ) ( not ( = ?auto_26122 ?auto_26129 ) ) ( not ( = ?auto_26123 ?auto_26129 ) ) ( not ( = ?auto_26121 ?auto_26129 ) ) ( not ( = ?auto_26132 ?auto_26129 ) ) ( not ( = ?auto_26133 ?auto_26129 ) ) ( not ( = ?auto_26136 ?auto_26129 ) ) ( AVAILABLE ?auto_26125 ) ( TRUCK-AT ?auto_26126 ?auto_26137 ) ( not ( = ?auto_26137 ?auto_26134 ) ) ( not ( = ?auto_26124 ?auto_26137 ) ) ( not ( = ?auto_26128 ?auto_26137 ) ) ( not ( = ?auto_26130 ?auto_26137 ) ) ( HOIST-AT ?auto_26127 ?auto_26137 ) ( LIFTING ?auto_26127 ?auto_26120 ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( not ( = ?auto_26131 ?auto_26127 ) ) ( not ( = ?auto_26135 ?auto_26127 ) ) ( not ( = ?auto_26138 ?auto_26127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26121 ?auto_26122 ?auto_26123 )
      ( MAKE-3CRATE-VERIFY ?auto_26120 ?auto_26121 ?auto_26122 ?auto_26123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26139 - SURFACE
      ?auto_26140 - SURFACE
      ?auto_26141 - SURFACE
      ?auto_26142 - SURFACE
      ?auto_26143 - SURFACE
    )
    :vars
    (
      ?auto_26145 - HOIST
      ?auto_26153 - PLACE
      ?auto_26144 - PLACE
      ?auto_26150 - HOIST
      ?auto_26151 - SURFACE
      ?auto_26148 - PLACE
      ?auto_26154 - HOIST
      ?auto_26152 - SURFACE
      ?auto_26149 - PLACE
      ?auto_26157 - HOIST
      ?auto_26155 - SURFACE
      ?auto_26146 - TRUCK
      ?auto_26156 - PLACE
      ?auto_26147 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26145 ?auto_26153 ) ( IS-CRATE ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( not ( = ?auto_26141 ?auto_26142 ) ) ( not ( = ?auto_26141 ?auto_26143 ) ) ( not ( = ?auto_26144 ?auto_26153 ) ) ( HOIST-AT ?auto_26150 ?auto_26144 ) ( not ( = ?auto_26145 ?auto_26150 ) ) ( AVAILABLE ?auto_26150 ) ( SURFACE-AT ?auto_26143 ?auto_26144 ) ( ON ?auto_26143 ?auto_26151 ) ( CLEAR ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26151 ) ) ( not ( = ?auto_26143 ?auto_26151 ) ) ( not ( = ?auto_26141 ?auto_26151 ) ) ( IS-CRATE ?auto_26142 ) ( not ( = ?auto_26148 ?auto_26153 ) ) ( not ( = ?auto_26144 ?auto_26148 ) ) ( HOIST-AT ?auto_26154 ?auto_26148 ) ( not ( = ?auto_26145 ?auto_26154 ) ) ( not ( = ?auto_26150 ?auto_26154 ) ) ( AVAILABLE ?auto_26154 ) ( SURFACE-AT ?auto_26142 ?auto_26148 ) ( ON ?auto_26142 ?auto_26152 ) ( CLEAR ?auto_26142 ) ( not ( = ?auto_26142 ?auto_26152 ) ) ( not ( = ?auto_26143 ?auto_26152 ) ) ( not ( = ?auto_26141 ?auto_26152 ) ) ( not ( = ?auto_26151 ?auto_26152 ) ) ( IS-CRATE ?auto_26141 ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26142 ?auto_26140 ) ) ( not ( = ?auto_26143 ?auto_26140 ) ) ( not ( = ?auto_26151 ?auto_26140 ) ) ( not ( = ?auto_26152 ?auto_26140 ) ) ( not ( = ?auto_26149 ?auto_26153 ) ) ( not ( = ?auto_26144 ?auto_26149 ) ) ( not ( = ?auto_26148 ?auto_26149 ) ) ( HOIST-AT ?auto_26157 ?auto_26149 ) ( not ( = ?auto_26145 ?auto_26157 ) ) ( not ( = ?auto_26150 ?auto_26157 ) ) ( not ( = ?auto_26154 ?auto_26157 ) ) ( AVAILABLE ?auto_26157 ) ( SURFACE-AT ?auto_26141 ?auto_26149 ) ( ON ?auto_26141 ?auto_26155 ) ( CLEAR ?auto_26141 ) ( not ( = ?auto_26142 ?auto_26155 ) ) ( not ( = ?auto_26143 ?auto_26155 ) ) ( not ( = ?auto_26141 ?auto_26155 ) ) ( not ( = ?auto_26151 ?auto_26155 ) ) ( not ( = ?auto_26152 ?auto_26155 ) ) ( not ( = ?auto_26140 ?auto_26155 ) ) ( SURFACE-AT ?auto_26139 ?auto_26153 ) ( CLEAR ?auto_26139 ) ( IS-CRATE ?auto_26140 ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26142 ?auto_26139 ) ) ( not ( = ?auto_26143 ?auto_26139 ) ) ( not ( = ?auto_26141 ?auto_26139 ) ) ( not ( = ?auto_26151 ?auto_26139 ) ) ( not ( = ?auto_26152 ?auto_26139 ) ) ( not ( = ?auto_26155 ?auto_26139 ) ) ( AVAILABLE ?auto_26145 ) ( TRUCK-AT ?auto_26146 ?auto_26156 ) ( not ( = ?auto_26156 ?auto_26153 ) ) ( not ( = ?auto_26144 ?auto_26156 ) ) ( not ( = ?auto_26148 ?auto_26156 ) ) ( not ( = ?auto_26149 ?auto_26156 ) ) ( HOIST-AT ?auto_26147 ?auto_26156 ) ( LIFTING ?auto_26147 ?auto_26140 ) ( not ( = ?auto_26145 ?auto_26147 ) ) ( not ( = ?auto_26150 ?auto_26147 ) ) ( not ( = ?auto_26154 ?auto_26147 ) ) ( not ( = ?auto_26157 ?auto_26147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26141 ?auto_26142 ?auto_26143 )
      ( MAKE-4CRATE-VERIFY ?auto_26139 ?auto_26140 ?auto_26141 ?auto_26142 ?auto_26143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26158 - SURFACE
      ?auto_26159 - SURFACE
    )
    :vars
    (
      ?auto_26162 - HOIST
      ?auto_26171 - PLACE
      ?auto_26160 - SURFACE
      ?auto_26161 - PLACE
      ?auto_26168 - HOIST
      ?auto_26169 - SURFACE
      ?auto_26165 - PLACE
      ?auto_26172 - HOIST
      ?auto_26170 - SURFACE
      ?auto_26173 - SURFACE
      ?auto_26167 - PLACE
      ?auto_26176 - HOIST
      ?auto_26174 - SURFACE
      ?auto_26166 - SURFACE
      ?auto_26163 - TRUCK
      ?auto_26175 - PLACE
      ?auto_26164 - HOIST
      ?auto_26177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26162 ?auto_26171 ) ( IS-CRATE ?auto_26159 ) ( not ( = ?auto_26158 ?auto_26159 ) ) ( not ( = ?auto_26160 ?auto_26158 ) ) ( not ( = ?auto_26160 ?auto_26159 ) ) ( not ( = ?auto_26161 ?auto_26171 ) ) ( HOIST-AT ?auto_26168 ?auto_26161 ) ( not ( = ?auto_26162 ?auto_26168 ) ) ( AVAILABLE ?auto_26168 ) ( SURFACE-AT ?auto_26159 ?auto_26161 ) ( ON ?auto_26159 ?auto_26169 ) ( CLEAR ?auto_26159 ) ( not ( = ?auto_26158 ?auto_26169 ) ) ( not ( = ?auto_26159 ?auto_26169 ) ) ( not ( = ?auto_26160 ?auto_26169 ) ) ( IS-CRATE ?auto_26158 ) ( not ( = ?auto_26165 ?auto_26171 ) ) ( not ( = ?auto_26161 ?auto_26165 ) ) ( HOIST-AT ?auto_26172 ?auto_26165 ) ( not ( = ?auto_26162 ?auto_26172 ) ) ( not ( = ?auto_26168 ?auto_26172 ) ) ( AVAILABLE ?auto_26172 ) ( SURFACE-AT ?auto_26158 ?auto_26165 ) ( ON ?auto_26158 ?auto_26170 ) ( CLEAR ?auto_26158 ) ( not ( = ?auto_26158 ?auto_26170 ) ) ( not ( = ?auto_26159 ?auto_26170 ) ) ( not ( = ?auto_26160 ?auto_26170 ) ) ( not ( = ?auto_26169 ?auto_26170 ) ) ( IS-CRATE ?auto_26160 ) ( not ( = ?auto_26173 ?auto_26160 ) ) ( not ( = ?auto_26158 ?auto_26173 ) ) ( not ( = ?auto_26159 ?auto_26173 ) ) ( not ( = ?auto_26169 ?auto_26173 ) ) ( not ( = ?auto_26170 ?auto_26173 ) ) ( not ( = ?auto_26167 ?auto_26171 ) ) ( not ( = ?auto_26161 ?auto_26167 ) ) ( not ( = ?auto_26165 ?auto_26167 ) ) ( HOIST-AT ?auto_26176 ?auto_26167 ) ( not ( = ?auto_26162 ?auto_26176 ) ) ( not ( = ?auto_26168 ?auto_26176 ) ) ( not ( = ?auto_26172 ?auto_26176 ) ) ( AVAILABLE ?auto_26176 ) ( SURFACE-AT ?auto_26160 ?auto_26167 ) ( ON ?auto_26160 ?auto_26174 ) ( CLEAR ?auto_26160 ) ( not ( = ?auto_26158 ?auto_26174 ) ) ( not ( = ?auto_26159 ?auto_26174 ) ) ( not ( = ?auto_26160 ?auto_26174 ) ) ( not ( = ?auto_26169 ?auto_26174 ) ) ( not ( = ?auto_26170 ?auto_26174 ) ) ( not ( = ?auto_26173 ?auto_26174 ) ) ( SURFACE-AT ?auto_26166 ?auto_26171 ) ( CLEAR ?auto_26166 ) ( IS-CRATE ?auto_26173 ) ( not ( = ?auto_26166 ?auto_26173 ) ) ( not ( = ?auto_26158 ?auto_26166 ) ) ( not ( = ?auto_26159 ?auto_26166 ) ) ( not ( = ?auto_26160 ?auto_26166 ) ) ( not ( = ?auto_26169 ?auto_26166 ) ) ( not ( = ?auto_26170 ?auto_26166 ) ) ( not ( = ?auto_26174 ?auto_26166 ) ) ( AVAILABLE ?auto_26162 ) ( TRUCK-AT ?auto_26163 ?auto_26175 ) ( not ( = ?auto_26175 ?auto_26171 ) ) ( not ( = ?auto_26161 ?auto_26175 ) ) ( not ( = ?auto_26165 ?auto_26175 ) ) ( not ( = ?auto_26167 ?auto_26175 ) ) ( HOIST-AT ?auto_26164 ?auto_26175 ) ( not ( = ?auto_26162 ?auto_26164 ) ) ( not ( = ?auto_26168 ?auto_26164 ) ) ( not ( = ?auto_26172 ?auto_26164 ) ) ( not ( = ?auto_26176 ?auto_26164 ) ) ( AVAILABLE ?auto_26164 ) ( SURFACE-AT ?auto_26173 ?auto_26175 ) ( ON ?auto_26173 ?auto_26177 ) ( CLEAR ?auto_26173 ) ( not ( = ?auto_26158 ?auto_26177 ) ) ( not ( = ?auto_26159 ?auto_26177 ) ) ( not ( = ?auto_26160 ?auto_26177 ) ) ( not ( = ?auto_26169 ?auto_26177 ) ) ( not ( = ?auto_26170 ?auto_26177 ) ) ( not ( = ?auto_26173 ?auto_26177 ) ) ( not ( = ?auto_26174 ?auto_26177 ) ) ( not ( = ?auto_26166 ?auto_26177 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26164 ?auto_26173 ?auto_26177 ?auto_26175 )
      ( MAKE-2CRATE ?auto_26160 ?auto_26158 ?auto_26159 )
      ( MAKE-1CRATE-VERIFY ?auto_26158 ?auto_26159 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26178 - SURFACE
      ?auto_26179 - SURFACE
      ?auto_26180 - SURFACE
    )
    :vars
    (
      ?auto_26185 - HOIST
      ?auto_26194 - PLACE
      ?auto_26187 - PLACE
      ?auto_26183 - HOIST
      ?auto_26181 - SURFACE
      ?auto_26192 - PLACE
      ?auto_26188 - HOIST
      ?auto_26191 - SURFACE
      ?auto_26184 - SURFACE
      ?auto_26186 - PLACE
      ?auto_26196 - HOIST
      ?auto_26190 - SURFACE
      ?auto_26193 - SURFACE
      ?auto_26195 - TRUCK
      ?auto_26197 - PLACE
      ?auto_26189 - HOIST
      ?auto_26182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26185 ?auto_26194 ) ( IS-CRATE ?auto_26180 ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( not ( = ?auto_26187 ?auto_26194 ) ) ( HOIST-AT ?auto_26183 ?auto_26187 ) ( not ( = ?auto_26185 ?auto_26183 ) ) ( AVAILABLE ?auto_26183 ) ( SURFACE-AT ?auto_26180 ?auto_26187 ) ( ON ?auto_26180 ?auto_26181 ) ( CLEAR ?auto_26180 ) ( not ( = ?auto_26179 ?auto_26181 ) ) ( not ( = ?auto_26180 ?auto_26181 ) ) ( not ( = ?auto_26178 ?auto_26181 ) ) ( IS-CRATE ?auto_26179 ) ( not ( = ?auto_26192 ?auto_26194 ) ) ( not ( = ?auto_26187 ?auto_26192 ) ) ( HOIST-AT ?auto_26188 ?auto_26192 ) ( not ( = ?auto_26185 ?auto_26188 ) ) ( not ( = ?auto_26183 ?auto_26188 ) ) ( AVAILABLE ?auto_26188 ) ( SURFACE-AT ?auto_26179 ?auto_26192 ) ( ON ?auto_26179 ?auto_26191 ) ( CLEAR ?auto_26179 ) ( not ( = ?auto_26179 ?auto_26191 ) ) ( not ( = ?auto_26180 ?auto_26191 ) ) ( not ( = ?auto_26178 ?auto_26191 ) ) ( not ( = ?auto_26181 ?auto_26191 ) ) ( IS-CRATE ?auto_26178 ) ( not ( = ?auto_26184 ?auto_26178 ) ) ( not ( = ?auto_26179 ?auto_26184 ) ) ( not ( = ?auto_26180 ?auto_26184 ) ) ( not ( = ?auto_26181 ?auto_26184 ) ) ( not ( = ?auto_26191 ?auto_26184 ) ) ( not ( = ?auto_26186 ?auto_26194 ) ) ( not ( = ?auto_26187 ?auto_26186 ) ) ( not ( = ?auto_26192 ?auto_26186 ) ) ( HOIST-AT ?auto_26196 ?auto_26186 ) ( not ( = ?auto_26185 ?auto_26196 ) ) ( not ( = ?auto_26183 ?auto_26196 ) ) ( not ( = ?auto_26188 ?auto_26196 ) ) ( AVAILABLE ?auto_26196 ) ( SURFACE-AT ?auto_26178 ?auto_26186 ) ( ON ?auto_26178 ?auto_26190 ) ( CLEAR ?auto_26178 ) ( not ( = ?auto_26179 ?auto_26190 ) ) ( not ( = ?auto_26180 ?auto_26190 ) ) ( not ( = ?auto_26178 ?auto_26190 ) ) ( not ( = ?auto_26181 ?auto_26190 ) ) ( not ( = ?auto_26191 ?auto_26190 ) ) ( not ( = ?auto_26184 ?auto_26190 ) ) ( SURFACE-AT ?auto_26193 ?auto_26194 ) ( CLEAR ?auto_26193 ) ( IS-CRATE ?auto_26184 ) ( not ( = ?auto_26193 ?auto_26184 ) ) ( not ( = ?auto_26179 ?auto_26193 ) ) ( not ( = ?auto_26180 ?auto_26193 ) ) ( not ( = ?auto_26178 ?auto_26193 ) ) ( not ( = ?auto_26181 ?auto_26193 ) ) ( not ( = ?auto_26191 ?auto_26193 ) ) ( not ( = ?auto_26190 ?auto_26193 ) ) ( AVAILABLE ?auto_26185 ) ( TRUCK-AT ?auto_26195 ?auto_26197 ) ( not ( = ?auto_26197 ?auto_26194 ) ) ( not ( = ?auto_26187 ?auto_26197 ) ) ( not ( = ?auto_26192 ?auto_26197 ) ) ( not ( = ?auto_26186 ?auto_26197 ) ) ( HOIST-AT ?auto_26189 ?auto_26197 ) ( not ( = ?auto_26185 ?auto_26189 ) ) ( not ( = ?auto_26183 ?auto_26189 ) ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( not ( = ?auto_26196 ?auto_26189 ) ) ( AVAILABLE ?auto_26189 ) ( SURFACE-AT ?auto_26184 ?auto_26197 ) ( ON ?auto_26184 ?auto_26182 ) ( CLEAR ?auto_26184 ) ( not ( = ?auto_26179 ?auto_26182 ) ) ( not ( = ?auto_26180 ?auto_26182 ) ) ( not ( = ?auto_26178 ?auto_26182 ) ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( not ( = ?auto_26191 ?auto_26182 ) ) ( not ( = ?auto_26184 ?auto_26182 ) ) ( not ( = ?auto_26190 ?auto_26182 ) ) ( not ( = ?auto_26193 ?auto_26182 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26179 ?auto_26180 )
      ( MAKE-2CRATE-VERIFY ?auto_26178 ?auto_26179 ?auto_26180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26198 - SURFACE
      ?auto_26199 - SURFACE
      ?auto_26200 - SURFACE
      ?auto_26201 - SURFACE
    )
    :vars
    (
      ?auto_26203 - HOIST
      ?auto_26206 - PLACE
      ?auto_26214 - PLACE
      ?auto_26207 - HOIST
      ?auto_26202 - SURFACE
      ?auto_26209 - PLACE
      ?auto_26213 - HOIST
      ?auto_26204 - SURFACE
      ?auto_26215 - PLACE
      ?auto_26217 - HOIST
      ?auto_26212 - SURFACE
      ?auto_26205 - SURFACE
      ?auto_26210 - TRUCK
      ?auto_26211 - PLACE
      ?auto_26208 - HOIST
      ?auto_26216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26203 ?auto_26206 ) ( IS-CRATE ?auto_26201 ) ( not ( = ?auto_26200 ?auto_26201 ) ) ( not ( = ?auto_26199 ?auto_26200 ) ) ( not ( = ?auto_26199 ?auto_26201 ) ) ( not ( = ?auto_26214 ?auto_26206 ) ) ( HOIST-AT ?auto_26207 ?auto_26214 ) ( not ( = ?auto_26203 ?auto_26207 ) ) ( AVAILABLE ?auto_26207 ) ( SURFACE-AT ?auto_26201 ?auto_26214 ) ( ON ?auto_26201 ?auto_26202 ) ( CLEAR ?auto_26201 ) ( not ( = ?auto_26200 ?auto_26202 ) ) ( not ( = ?auto_26201 ?auto_26202 ) ) ( not ( = ?auto_26199 ?auto_26202 ) ) ( IS-CRATE ?auto_26200 ) ( not ( = ?auto_26209 ?auto_26206 ) ) ( not ( = ?auto_26214 ?auto_26209 ) ) ( HOIST-AT ?auto_26213 ?auto_26209 ) ( not ( = ?auto_26203 ?auto_26213 ) ) ( not ( = ?auto_26207 ?auto_26213 ) ) ( AVAILABLE ?auto_26213 ) ( SURFACE-AT ?auto_26200 ?auto_26209 ) ( ON ?auto_26200 ?auto_26204 ) ( CLEAR ?auto_26200 ) ( not ( = ?auto_26200 ?auto_26204 ) ) ( not ( = ?auto_26201 ?auto_26204 ) ) ( not ( = ?auto_26199 ?auto_26204 ) ) ( not ( = ?auto_26202 ?auto_26204 ) ) ( IS-CRATE ?auto_26199 ) ( not ( = ?auto_26198 ?auto_26199 ) ) ( not ( = ?auto_26200 ?auto_26198 ) ) ( not ( = ?auto_26201 ?auto_26198 ) ) ( not ( = ?auto_26202 ?auto_26198 ) ) ( not ( = ?auto_26204 ?auto_26198 ) ) ( not ( = ?auto_26215 ?auto_26206 ) ) ( not ( = ?auto_26214 ?auto_26215 ) ) ( not ( = ?auto_26209 ?auto_26215 ) ) ( HOIST-AT ?auto_26217 ?auto_26215 ) ( not ( = ?auto_26203 ?auto_26217 ) ) ( not ( = ?auto_26207 ?auto_26217 ) ) ( not ( = ?auto_26213 ?auto_26217 ) ) ( AVAILABLE ?auto_26217 ) ( SURFACE-AT ?auto_26199 ?auto_26215 ) ( ON ?auto_26199 ?auto_26212 ) ( CLEAR ?auto_26199 ) ( not ( = ?auto_26200 ?auto_26212 ) ) ( not ( = ?auto_26201 ?auto_26212 ) ) ( not ( = ?auto_26199 ?auto_26212 ) ) ( not ( = ?auto_26202 ?auto_26212 ) ) ( not ( = ?auto_26204 ?auto_26212 ) ) ( not ( = ?auto_26198 ?auto_26212 ) ) ( SURFACE-AT ?auto_26205 ?auto_26206 ) ( CLEAR ?auto_26205 ) ( IS-CRATE ?auto_26198 ) ( not ( = ?auto_26205 ?auto_26198 ) ) ( not ( = ?auto_26200 ?auto_26205 ) ) ( not ( = ?auto_26201 ?auto_26205 ) ) ( not ( = ?auto_26199 ?auto_26205 ) ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26212 ?auto_26205 ) ) ( AVAILABLE ?auto_26203 ) ( TRUCK-AT ?auto_26210 ?auto_26211 ) ( not ( = ?auto_26211 ?auto_26206 ) ) ( not ( = ?auto_26214 ?auto_26211 ) ) ( not ( = ?auto_26209 ?auto_26211 ) ) ( not ( = ?auto_26215 ?auto_26211 ) ) ( HOIST-AT ?auto_26208 ?auto_26211 ) ( not ( = ?auto_26203 ?auto_26208 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) ( not ( = ?auto_26213 ?auto_26208 ) ) ( not ( = ?auto_26217 ?auto_26208 ) ) ( AVAILABLE ?auto_26208 ) ( SURFACE-AT ?auto_26198 ?auto_26211 ) ( ON ?auto_26198 ?auto_26216 ) ( CLEAR ?auto_26198 ) ( not ( = ?auto_26200 ?auto_26216 ) ) ( not ( = ?auto_26201 ?auto_26216 ) ) ( not ( = ?auto_26199 ?auto_26216 ) ) ( not ( = ?auto_26202 ?auto_26216 ) ) ( not ( = ?auto_26204 ?auto_26216 ) ) ( not ( = ?auto_26198 ?auto_26216 ) ) ( not ( = ?auto_26212 ?auto_26216 ) ) ( not ( = ?auto_26205 ?auto_26216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26199 ?auto_26200 ?auto_26201 )
      ( MAKE-3CRATE-VERIFY ?auto_26198 ?auto_26199 ?auto_26200 ?auto_26201 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26218 - SURFACE
      ?auto_26219 - SURFACE
      ?auto_26220 - SURFACE
      ?auto_26221 - SURFACE
      ?auto_26222 - SURFACE
    )
    :vars
    (
      ?auto_26224 - HOIST
      ?auto_26226 - PLACE
      ?auto_26234 - PLACE
      ?auto_26227 - HOIST
      ?auto_26223 - SURFACE
      ?auto_26229 - PLACE
      ?auto_26233 - HOIST
      ?auto_26225 - SURFACE
      ?auto_26235 - PLACE
      ?auto_26237 - HOIST
      ?auto_26232 - SURFACE
      ?auto_26230 - TRUCK
      ?auto_26231 - PLACE
      ?auto_26228 - HOIST
      ?auto_26236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26224 ?auto_26226 ) ( IS-CRATE ?auto_26222 ) ( not ( = ?auto_26221 ?auto_26222 ) ) ( not ( = ?auto_26220 ?auto_26221 ) ) ( not ( = ?auto_26220 ?auto_26222 ) ) ( not ( = ?auto_26234 ?auto_26226 ) ) ( HOIST-AT ?auto_26227 ?auto_26234 ) ( not ( = ?auto_26224 ?auto_26227 ) ) ( AVAILABLE ?auto_26227 ) ( SURFACE-AT ?auto_26222 ?auto_26234 ) ( ON ?auto_26222 ?auto_26223 ) ( CLEAR ?auto_26222 ) ( not ( = ?auto_26221 ?auto_26223 ) ) ( not ( = ?auto_26222 ?auto_26223 ) ) ( not ( = ?auto_26220 ?auto_26223 ) ) ( IS-CRATE ?auto_26221 ) ( not ( = ?auto_26229 ?auto_26226 ) ) ( not ( = ?auto_26234 ?auto_26229 ) ) ( HOIST-AT ?auto_26233 ?auto_26229 ) ( not ( = ?auto_26224 ?auto_26233 ) ) ( not ( = ?auto_26227 ?auto_26233 ) ) ( AVAILABLE ?auto_26233 ) ( SURFACE-AT ?auto_26221 ?auto_26229 ) ( ON ?auto_26221 ?auto_26225 ) ( CLEAR ?auto_26221 ) ( not ( = ?auto_26221 ?auto_26225 ) ) ( not ( = ?auto_26222 ?auto_26225 ) ) ( not ( = ?auto_26220 ?auto_26225 ) ) ( not ( = ?auto_26223 ?auto_26225 ) ) ( IS-CRATE ?auto_26220 ) ( not ( = ?auto_26219 ?auto_26220 ) ) ( not ( = ?auto_26221 ?auto_26219 ) ) ( not ( = ?auto_26222 ?auto_26219 ) ) ( not ( = ?auto_26223 ?auto_26219 ) ) ( not ( = ?auto_26225 ?auto_26219 ) ) ( not ( = ?auto_26235 ?auto_26226 ) ) ( not ( = ?auto_26234 ?auto_26235 ) ) ( not ( = ?auto_26229 ?auto_26235 ) ) ( HOIST-AT ?auto_26237 ?auto_26235 ) ( not ( = ?auto_26224 ?auto_26237 ) ) ( not ( = ?auto_26227 ?auto_26237 ) ) ( not ( = ?auto_26233 ?auto_26237 ) ) ( AVAILABLE ?auto_26237 ) ( SURFACE-AT ?auto_26220 ?auto_26235 ) ( ON ?auto_26220 ?auto_26232 ) ( CLEAR ?auto_26220 ) ( not ( = ?auto_26221 ?auto_26232 ) ) ( not ( = ?auto_26222 ?auto_26232 ) ) ( not ( = ?auto_26220 ?auto_26232 ) ) ( not ( = ?auto_26223 ?auto_26232 ) ) ( not ( = ?auto_26225 ?auto_26232 ) ) ( not ( = ?auto_26219 ?auto_26232 ) ) ( SURFACE-AT ?auto_26218 ?auto_26226 ) ( CLEAR ?auto_26218 ) ( IS-CRATE ?auto_26219 ) ( not ( = ?auto_26218 ?auto_26219 ) ) ( not ( = ?auto_26221 ?auto_26218 ) ) ( not ( = ?auto_26222 ?auto_26218 ) ) ( not ( = ?auto_26220 ?auto_26218 ) ) ( not ( = ?auto_26223 ?auto_26218 ) ) ( not ( = ?auto_26225 ?auto_26218 ) ) ( not ( = ?auto_26232 ?auto_26218 ) ) ( AVAILABLE ?auto_26224 ) ( TRUCK-AT ?auto_26230 ?auto_26231 ) ( not ( = ?auto_26231 ?auto_26226 ) ) ( not ( = ?auto_26234 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) ( not ( = ?auto_26235 ?auto_26231 ) ) ( HOIST-AT ?auto_26228 ?auto_26231 ) ( not ( = ?auto_26224 ?auto_26228 ) ) ( not ( = ?auto_26227 ?auto_26228 ) ) ( not ( = ?auto_26233 ?auto_26228 ) ) ( not ( = ?auto_26237 ?auto_26228 ) ) ( AVAILABLE ?auto_26228 ) ( SURFACE-AT ?auto_26219 ?auto_26231 ) ( ON ?auto_26219 ?auto_26236 ) ( CLEAR ?auto_26219 ) ( not ( = ?auto_26221 ?auto_26236 ) ) ( not ( = ?auto_26222 ?auto_26236 ) ) ( not ( = ?auto_26220 ?auto_26236 ) ) ( not ( = ?auto_26223 ?auto_26236 ) ) ( not ( = ?auto_26225 ?auto_26236 ) ) ( not ( = ?auto_26219 ?auto_26236 ) ) ( not ( = ?auto_26232 ?auto_26236 ) ) ( not ( = ?auto_26218 ?auto_26236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26220 ?auto_26221 ?auto_26222 )
      ( MAKE-4CRATE-VERIFY ?auto_26218 ?auto_26219 ?auto_26220 ?auto_26221 ?auto_26222 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26238 - SURFACE
      ?auto_26239 - SURFACE
    )
    :vars
    (
      ?auto_26241 - HOIST
      ?auto_26244 - PLACE
      ?auto_26254 - SURFACE
      ?auto_26253 - PLACE
      ?auto_26245 - HOIST
      ?auto_26240 - SURFACE
      ?auto_26247 - PLACE
      ?auto_26252 - HOIST
      ?auto_26242 - SURFACE
      ?auto_26249 - SURFACE
      ?auto_26255 - PLACE
      ?auto_26257 - HOIST
      ?auto_26251 - SURFACE
      ?auto_26243 - SURFACE
      ?auto_26250 - PLACE
      ?auto_26246 - HOIST
      ?auto_26256 - SURFACE
      ?auto_26248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26241 ?auto_26244 ) ( IS-CRATE ?auto_26239 ) ( not ( = ?auto_26238 ?auto_26239 ) ) ( not ( = ?auto_26254 ?auto_26238 ) ) ( not ( = ?auto_26254 ?auto_26239 ) ) ( not ( = ?auto_26253 ?auto_26244 ) ) ( HOIST-AT ?auto_26245 ?auto_26253 ) ( not ( = ?auto_26241 ?auto_26245 ) ) ( AVAILABLE ?auto_26245 ) ( SURFACE-AT ?auto_26239 ?auto_26253 ) ( ON ?auto_26239 ?auto_26240 ) ( CLEAR ?auto_26239 ) ( not ( = ?auto_26238 ?auto_26240 ) ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26254 ?auto_26240 ) ) ( IS-CRATE ?auto_26238 ) ( not ( = ?auto_26247 ?auto_26244 ) ) ( not ( = ?auto_26253 ?auto_26247 ) ) ( HOIST-AT ?auto_26252 ?auto_26247 ) ( not ( = ?auto_26241 ?auto_26252 ) ) ( not ( = ?auto_26245 ?auto_26252 ) ) ( AVAILABLE ?auto_26252 ) ( SURFACE-AT ?auto_26238 ?auto_26247 ) ( ON ?auto_26238 ?auto_26242 ) ( CLEAR ?auto_26238 ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( not ( = ?auto_26239 ?auto_26242 ) ) ( not ( = ?auto_26254 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( IS-CRATE ?auto_26254 ) ( not ( = ?auto_26249 ?auto_26254 ) ) ( not ( = ?auto_26238 ?auto_26249 ) ) ( not ( = ?auto_26239 ?auto_26249 ) ) ( not ( = ?auto_26240 ?auto_26249 ) ) ( not ( = ?auto_26242 ?auto_26249 ) ) ( not ( = ?auto_26255 ?auto_26244 ) ) ( not ( = ?auto_26253 ?auto_26255 ) ) ( not ( = ?auto_26247 ?auto_26255 ) ) ( HOIST-AT ?auto_26257 ?auto_26255 ) ( not ( = ?auto_26241 ?auto_26257 ) ) ( not ( = ?auto_26245 ?auto_26257 ) ) ( not ( = ?auto_26252 ?auto_26257 ) ) ( AVAILABLE ?auto_26257 ) ( SURFACE-AT ?auto_26254 ?auto_26255 ) ( ON ?auto_26254 ?auto_26251 ) ( CLEAR ?auto_26254 ) ( not ( = ?auto_26238 ?auto_26251 ) ) ( not ( = ?auto_26239 ?auto_26251 ) ) ( not ( = ?auto_26254 ?auto_26251 ) ) ( not ( = ?auto_26240 ?auto_26251 ) ) ( not ( = ?auto_26242 ?auto_26251 ) ) ( not ( = ?auto_26249 ?auto_26251 ) ) ( SURFACE-AT ?auto_26243 ?auto_26244 ) ( CLEAR ?auto_26243 ) ( IS-CRATE ?auto_26249 ) ( not ( = ?auto_26243 ?auto_26249 ) ) ( not ( = ?auto_26238 ?auto_26243 ) ) ( not ( = ?auto_26239 ?auto_26243 ) ) ( not ( = ?auto_26254 ?auto_26243 ) ) ( not ( = ?auto_26240 ?auto_26243 ) ) ( not ( = ?auto_26242 ?auto_26243 ) ) ( not ( = ?auto_26251 ?auto_26243 ) ) ( AVAILABLE ?auto_26241 ) ( not ( = ?auto_26250 ?auto_26244 ) ) ( not ( = ?auto_26253 ?auto_26250 ) ) ( not ( = ?auto_26247 ?auto_26250 ) ) ( not ( = ?auto_26255 ?auto_26250 ) ) ( HOIST-AT ?auto_26246 ?auto_26250 ) ( not ( = ?auto_26241 ?auto_26246 ) ) ( not ( = ?auto_26245 ?auto_26246 ) ) ( not ( = ?auto_26252 ?auto_26246 ) ) ( not ( = ?auto_26257 ?auto_26246 ) ) ( AVAILABLE ?auto_26246 ) ( SURFACE-AT ?auto_26249 ?auto_26250 ) ( ON ?auto_26249 ?auto_26256 ) ( CLEAR ?auto_26249 ) ( not ( = ?auto_26238 ?auto_26256 ) ) ( not ( = ?auto_26239 ?auto_26256 ) ) ( not ( = ?auto_26254 ?auto_26256 ) ) ( not ( = ?auto_26240 ?auto_26256 ) ) ( not ( = ?auto_26242 ?auto_26256 ) ) ( not ( = ?auto_26249 ?auto_26256 ) ) ( not ( = ?auto_26251 ?auto_26256 ) ) ( not ( = ?auto_26243 ?auto_26256 ) ) ( TRUCK-AT ?auto_26248 ?auto_26244 ) )
    :subtasks
    ( ( !DRIVE ?auto_26248 ?auto_26244 ?auto_26250 )
      ( MAKE-2CRATE ?auto_26254 ?auto_26238 ?auto_26239 )
      ( MAKE-1CRATE-VERIFY ?auto_26238 ?auto_26239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26258 - SURFACE
      ?auto_26259 - SURFACE
      ?auto_26260 - SURFACE
    )
    :vars
    (
      ?auto_26277 - HOIST
      ?auto_26270 - PLACE
      ?auto_26263 - PLACE
      ?auto_26264 - HOIST
      ?auto_26269 - SURFACE
      ?auto_26274 - PLACE
      ?auto_26275 - HOIST
      ?auto_26272 - SURFACE
      ?auto_26273 - SURFACE
      ?auto_26261 - PLACE
      ?auto_26266 - HOIST
      ?auto_26265 - SURFACE
      ?auto_26267 - SURFACE
      ?auto_26262 - PLACE
      ?auto_26268 - HOIST
      ?auto_26271 - SURFACE
      ?auto_26276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26277 ?auto_26270 ) ( IS-CRATE ?auto_26260 ) ( not ( = ?auto_26259 ?auto_26260 ) ) ( not ( = ?auto_26258 ?auto_26259 ) ) ( not ( = ?auto_26258 ?auto_26260 ) ) ( not ( = ?auto_26263 ?auto_26270 ) ) ( HOIST-AT ?auto_26264 ?auto_26263 ) ( not ( = ?auto_26277 ?auto_26264 ) ) ( AVAILABLE ?auto_26264 ) ( SURFACE-AT ?auto_26260 ?auto_26263 ) ( ON ?auto_26260 ?auto_26269 ) ( CLEAR ?auto_26260 ) ( not ( = ?auto_26259 ?auto_26269 ) ) ( not ( = ?auto_26260 ?auto_26269 ) ) ( not ( = ?auto_26258 ?auto_26269 ) ) ( IS-CRATE ?auto_26259 ) ( not ( = ?auto_26274 ?auto_26270 ) ) ( not ( = ?auto_26263 ?auto_26274 ) ) ( HOIST-AT ?auto_26275 ?auto_26274 ) ( not ( = ?auto_26277 ?auto_26275 ) ) ( not ( = ?auto_26264 ?auto_26275 ) ) ( AVAILABLE ?auto_26275 ) ( SURFACE-AT ?auto_26259 ?auto_26274 ) ( ON ?auto_26259 ?auto_26272 ) ( CLEAR ?auto_26259 ) ( not ( = ?auto_26259 ?auto_26272 ) ) ( not ( = ?auto_26260 ?auto_26272 ) ) ( not ( = ?auto_26258 ?auto_26272 ) ) ( not ( = ?auto_26269 ?auto_26272 ) ) ( IS-CRATE ?auto_26258 ) ( not ( = ?auto_26273 ?auto_26258 ) ) ( not ( = ?auto_26259 ?auto_26273 ) ) ( not ( = ?auto_26260 ?auto_26273 ) ) ( not ( = ?auto_26269 ?auto_26273 ) ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( not ( = ?auto_26261 ?auto_26270 ) ) ( not ( = ?auto_26263 ?auto_26261 ) ) ( not ( = ?auto_26274 ?auto_26261 ) ) ( HOIST-AT ?auto_26266 ?auto_26261 ) ( not ( = ?auto_26277 ?auto_26266 ) ) ( not ( = ?auto_26264 ?auto_26266 ) ) ( not ( = ?auto_26275 ?auto_26266 ) ) ( AVAILABLE ?auto_26266 ) ( SURFACE-AT ?auto_26258 ?auto_26261 ) ( ON ?auto_26258 ?auto_26265 ) ( CLEAR ?auto_26258 ) ( not ( = ?auto_26259 ?auto_26265 ) ) ( not ( = ?auto_26260 ?auto_26265 ) ) ( not ( = ?auto_26258 ?auto_26265 ) ) ( not ( = ?auto_26269 ?auto_26265 ) ) ( not ( = ?auto_26272 ?auto_26265 ) ) ( not ( = ?auto_26273 ?auto_26265 ) ) ( SURFACE-AT ?auto_26267 ?auto_26270 ) ( CLEAR ?auto_26267 ) ( IS-CRATE ?auto_26273 ) ( not ( = ?auto_26267 ?auto_26273 ) ) ( not ( = ?auto_26259 ?auto_26267 ) ) ( not ( = ?auto_26260 ?auto_26267 ) ) ( not ( = ?auto_26258 ?auto_26267 ) ) ( not ( = ?auto_26269 ?auto_26267 ) ) ( not ( = ?auto_26272 ?auto_26267 ) ) ( not ( = ?auto_26265 ?auto_26267 ) ) ( AVAILABLE ?auto_26277 ) ( not ( = ?auto_26262 ?auto_26270 ) ) ( not ( = ?auto_26263 ?auto_26262 ) ) ( not ( = ?auto_26274 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( HOIST-AT ?auto_26268 ?auto_26262 ) ( not ( = ?auto_26277 ?auto_26268 ) ) ( not ( = ?auto_26264 ?auto_26268 ) ) ( not ( = ?auto_26275 ?auto_26268 ) ) ( not ( = ?auto_26266 ?auto_26268 ) ) ( AVAILABLE ?auto_26268 ) ( SURFACE-AT ?auto_26273 ?auto_26262 ) ( ON ?auto_26273 ?auto_26271 ) ( CLEAR ?auto_26273 ) ( not ( = ?auto_26259 ?auto_26271 ) ) ( not ( = ?auto_26260 ?auto_26271 ) ) ( not ( = ?auto_26258 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26271 ) ) ( not ( = ?auto_26272 ?auto_26271 ) ) ( not ( = ?auto_26273 ?auto_26271 ) ) ( not ( = ?auto_26265 ?auto_26271 ) ) ( not ( = ?auto_26267 ?auto_26271 ) ) ( TRUCK-AT ?auto_26276 ?auto_26270 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26259 ?auto_26260 )
      ( MAKE-2CRATE-VERIFY ?auto_26258 ?auto_26259 ?auto_26260 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26278 - SURFACE
      ?auto_26279 - SURFACE
      ?auto_26280 - SURFACE
      ?auto_26281 - SURFACE
    )
    :vars
    (
      ?auto_26287 - HOIST
      ?auto_26295 - PLACE
      ?auto_26288 - PLACE
      ?auto_26282 - HOIST
      ?auto_26283 - SURFACE
      ?auto_26291 - PLACE
      ?auto_26290 - HOIST
      ?auto_26296 - SURFACE
      ?auto_26294 - PLACE
      ?auto_26293 - HOIST
      ?auto_26284 - SURFACE
      ?auto_26286 - SURFACE
      ?auto_26297 - PLACE
      ?auto_26285 - HOIST
      ?auto_26292 - SURFACE
      ?auto_26289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26287 ?auto_26295 ) ( IS-CRATE ?auto_26281 ) ( not ( = ?auto_26280 ?auto_26281 ) ) ( not ( = ?auto_26279 ?auto_26280 ) ) ( not ( = ?auto_26279 ?auto_26281 ) ) ( not ( = ?auto_26288 ?auto_26295 ) ) ( HOIST-AT ?auto_26282 ?auto_26288 ) ( not ( = ?auto_26287 ?auto_26282 ) ) ( AVAILABLE ?auto_26282 ) ( SURFACE-AT ?auto_26281 ?auto_26288 ) ( ON ?auto_26281 ?auto_26283 ) ( CLEAR ?auto_26281 ) ( not ( = ?auto_26280 ?auto_26283 ) ) ( not ( = ?auto_26281 ?auto_26283 ) ) ( not ( = ?auto_26279 ?auto_26283 ) ) ( IS-CRATE ?auto_26280 ) ( not ( = ?auto_26291 ?auto_26295 ) ) ( not ( = ?auto_26288 ?auto_26291 ) ) ( HOIST-AT ?auto_26290 ?auto_26291 ) ( not ( = ?auto_26287 ?auto_26290 ) ) ( not ( = ?auto_26282 ?auto_26290 ) ) ( AVAILABLE ?auto_26290 ) ( SURFACE-AT ?auto_26280 ?auto_26291 ) ( ON ?auto_26280 ?auto_26296 ) ( CLEAR ?auto_26280 ) ( not ( = ?auto_26280 ?auto_26296 ) ) ( not ( = ?auto_26281 ?auto_26296 ) ) ( not ( = ?auto_26279 ?auto_26296 ) ) ( not ( = ?auto_26283 ?auto_26296 ) ) ( IS-CRATE ?auto_26279 ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26280 ?auto_26278 ) ) ( not ( = ?auto_26281 ?auto_26278 ) ) ( not ( = ?auto_26283 ?auto_26278 ) ) ( not ( = ?auto_26296 ?auto_26278 ) ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26288 ?auto_26294 ) ) ( not ( = ?auto_26291 ?auto_26294 ) ) ( HOIST-AT ?auto_26293 ?auto_26294 ) ( not ( = ?auto_26287 ?auto_26293 ) ) ( not ( = ?auto_26282 ?auto_26293 ) ) ( not ( = ?auto_26290 ?auto_26293 ) ) ( AVAILABLE ?auto_26293 ) ( SURFACE-AT ?auto_26279 ?auto_26294 ) ( ON ?auto_26279 ?auto_26284 ) ( CLEAR ?auto_26279 ) ( not ( = ?auto_26280 ?auto_26284 ) ) ( not ( = ?auto_26281 ?auto_26284 ) ) ( not ( = ?auto_26279 ?auto_26284 ) ) ( not ( = ?auto_26283 ?auto_26284 ) ) ( not ( = ?auto_26296 ?auto_26284 ) ) ( not ( = ?auto_26278 ?auto_26284 ) ) ( SURFACE-AT ?auto_26286 ?auto_26295 ) ( CLEAR ?auto_26286 ) ( IS-CRATE ?auto_26278 ) ( not ( = ?auto_26286 ?auto_26278 ) ) ( not ( = ?auto_26280 ?auto_26286 ) ) ( not ( = ?auto_26281 ?auto_26286 ) ) ( not ( = ?auto_26279 ?auto_26286 ) ) ( not ( = ?auto_26283 ?auto_26286 ) ) ( not ( = ?auto_26296 ?auto_26286 ) ) ( not ( = ?auto_26284 ?auto_26286 ) ) ( AVAILABLE ?auto_26287 ) ( not ( = ?auto_26297 ?auto_26295 ) ) ( not ( = ?auto_26288 ?auto_26297 ) ) ( not ( = ?auto_26291 ?auto_26297 ) ) ( not ( = ?auto_26294 ?auto_26297 ) ) ( HOIST-AT ?auto_26285 ?auto_26297 ) ( not ( = ?auto_26287 ?auto_26285 ) ) ( not ( = ?auto_26282 ?auto_26285 ) ) ( not ( = ?auto_26290 ?auto_26285 ) ) ( not ( = ?auto_26293 ?auto_26285 ) ) ( AVAILABLE ?auto_26285 ) ( SURFACE-AT ?auto_26278 ?auto_26297 ) ( ON ?auto_26278 ?auto_26292 ) ( CLEAR ?auto_26278 ) ( not ( = ?auto_26280 ?auto_26292 ) ) ( not ( = ?auto_26281 ?auto_26292 ) ) ( not ( = ?auto_26279 ?auto_26292 ) ) ( not ( = ?auto_26283 ?auto_26292 ) ) ( not ( = ?auto_26296 ?auto_26292 ) ) ( not ( = ?auto_26278 ?auto_26292 ) ) ( not ( = ?auto_26284 ?auto_26292 ) ) ( not ( = ?auto_26286 ?auto_26292 ) ) ( TRUCK-AT ?auto_26289 ?auto_26295 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26279 ?auto_26280 ?auto_26281 )
      ( MAKE-3CRATE-VERIFY ?auto_26278 ?auto_26279 ?auto_26280 ?auto_26281 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26298 - SURFACE
      ?auto_26299 - SURFACE
      ?auto_26300 - SURFACE
      ?auto_26301 - SURFACE
      ?auto_26302 - SURFACE
    )
    :vars
    (
      ?auto_26307 - HOIST
      ?auto_26315 - PLACE
      ?auto_26308 - PLACE
      ?auto_26303 - HOIST
      ?auto_26304 - SURFACE
      ?auto_26311 - PLACE
      ?auto_26310 - HOIST
      ?auto_26316 - SURFACE
      ?auto_26314 - PLACE
      ?auto_26313 - HOIST
      ?auto_26305 - SURFACE
      ?auto_26317 - PLACE
      ?auto_26306 - HOIST
      ?auto_26312 - SURFACE
      ?auto_26309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26307 ?auto_26315 ) ( IS-CRATE ?auto_26302 ) ( not ( = ?auto_26301 ?auto_26302 ) ) ( not ( = ?auto_26300 ?auto_26301 ) ) ( not ( = ?auto_26300 ?auto_26302 ) ) ( not ( = ?auto_26308 ?auto_26315 ) ) ( HOIST-AT ?auto_26303 ?auto_26308 ) ( not ( = ?auto_26307 ?auto_26303 ) ) ( AVAILABLE ?auto_26303 ) ( SURFACE-AT ?auto_26302 ?auto_26308 ) ( ON ?auto_26302 ?auto_26304 ) ( CLEAR ?auto_26302 ) ( not ( = ?auto_26301 ?auto_26304 ) ) ( not ( = ?auto_26302 ?auto_26304 ) ) ( not ( = ?auto_26300 ?auto_26304 ) ) ( IS-CRATE ?auto_26301 ) ( not ( = ?auto_26311 ?auto_26315 ) ) ( not ( = ?auto_26308 ?auto_26311 ) ) ( HOIST-AT ?auto_26310 ?auto_26311 ) ( not ( = ?auto_26307 ?auto_26310 ) ) ( not ( = ?auto_26303 ?auto_26310 ) ) ( AVAILABLE ?auto_26310 ) ( SURFACE-AT ?auto_26301 ?auto_26311 ) ( ON ?auto_26301 ?auto_26316 ) ( CLEAR ?auto_26301 ) ( not ( = ?auto_26301 ?auto_26316 ) ) ( not ( = ?auto_26302 ?auto_26316 ) ) ( not ( = ?auto_26300 ?auto_26316 ) ) ( not ( = ?auto_26304 ?auto_26316 ) ) ( IS-CRATE ?auto_26300 ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( not ( = ?auto_26301 ?auto_26299 ) ) ( not ( = ?auto_26302 ?auto_26299 ) ) ( not ( = ?auto_26304 ?auto_26299 ) ) ( not ( = ?auto_26316 ?auto_26299 ) ) ( not ( = ?auto_26314 ?auto_26315 ) ) ( not ( = ?auto_26308 ?auto_26314 ) ) ( not ( = ?auto_26311 ?auto_26314 ) ) ( HOIST-AT ?auto_26313 ?auto_26314 ) ( not ( = ?auto_26307 ?auto_26313 ) ) ( not ( = ?auto_26303 ?auto_26313 ) ) ( not ( = ?auto_26310 ?auto_26313 ) ) ( AVAILABLE ?auto_26313 ) ( SURFACE-AT ?auto_26300 ?auto_26314 ) ( ON ?auto_26300 ?auto_26305 ) ( CLEAR ?auto_26300 ) ( not ( = ?auto_26301 ?auto_26305 ) ) ( not ( = ?auto_26302 ?auto_26305 ) ) ( not ( = ?auto_26300 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26316 ?auto_26305 ) ) ( not ( = ?auto_26299 ?auto_26305 ) ) ( SURFACE-AT ?auto_26298 ?auto_26315 ) ( CLEAR ?auto_26298 ) ( IS-CRATE ?auto_26299 ) ( not ( = ?auto_26298 ?auto_26299 ) ) ( not ( = ?auto_26301 ?auto_26298 ) ) ( not ( = ?auto_26302 ?auto_26298 ) ) ( not ( = ?auto_26300 ?auto_26298 ) ) ( not ( = ?auto_26304 ?auto_26298 ) ) ( not ( = ?auto_26316 ?auto_26298 ) ) ( not ( = ?auto_26305 ?auto_26298 ) ) ( AVAILABLE ?auto_26307 ) ( not ( = ?auto_26317 ?auto_26315 ) ) ( not ( = ?auto_26308 ?auto_26317 ) ) ( not ( = ?auto_26311 ?auto_26317 ) ) ( not ( = ?auto_26314 ?auto_26317 ) ) ( HOIST-AT ?auto_26306 ?auto_26317 ) ( not ( = ?auto_26307 ?auto_26306 ) ) ( not ( = ?auto_26303 ?auto_26306 ) ) ( not ( = ?auto_26310 ?auto_26306 ) ) ( not ( = ?auto_26313 ?auto_26306 ) ) ( AVAILABLE ?auto_26306 ) ( SURFACE-AT ?auto_26299 ?auto_26317 ) ( ON ?auto_26299 ?auto_26312 ) ( CLEAR ?auto_26299 ) ( not ( = ?auto_26301 ?auto_26312 ) ) ( not ( = ?auto_26302 ?auto_26312 ) ) ( not ( = ?auto_26300 ?auto_26312 ) ) ( not ( = ?auto_26304 ?auto_26312 ) ) ( not ( = ?auto_26316 ?auto_26312 ) ) ( not ( = ?auto_26299 ?auto_26312 ) ) ( not ( = ?auto_26305 ?auto_26312 ) ) ( not ( = ?auto_26298 ?auto_26312 ) ) ( TRUCK-AT ?auto_26309 ?auto_26315 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26300 ?auto_26301 ?auto_26302 )
      ( MAKE-4CRATE-VERIFY ?auto_26298 ?auto_26299 ?auto_26300 ?auto_26301 ?auto_26302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26338 - SURFACE
      ?auto_26339 - SURFACE
    )
    :vars
    (
      ?auto_26340 - HOIST
      ?auto_26341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26340 ?auto_26341 ) ( SURFACE-AT ?auto_26338 ?auto_26341 ) ( CLEAR ?auto_26338 ) ( LIFTING ?auto_26340 ?auto_26339 ) ( IS-CRATE ?auto_26339 ) ( not ( = ?auto_26338 ?auto_26339 ) ) )
    :subtasks
    ( ( !DROP ?auto_26340 ?auto_26339 ?auto_26338 ?auto_26341 )
      ( MAKE-1CRATE-VERIFY ?auto_26338 ?auto_26339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26342 - SURFACE
      ?auto_26343 - SURFACE
      ?auto_26344 - SURFACE
    )
    :vars
    (
      ?auto_26346 - HOIST
      ?auto_26345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26346 ?auto_26345 ) ( SURFACE-AT ?auto_26343 ?auto_26345 ) ( CLEAR ?auto_26343 ) ( LIFTING ?auto_26346 ?auto_26344 ) ( IS-CRATE ?auto_26344 ) ( not ( = ?auto_26343 ?auto_26344 ) ) ( ON ?auto_26343 ?auto_26342 ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( not ( = ?auto_26342 ?auto_26344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26343 ?auto_26344 )
      ( MAKE-2CRATE-VERIFY ?auto_26342 ?auto_26343 ?auto_26344 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26347 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26349 - SURFACE
      ?auto_26350 - SURFACE
    )
    :vars
    (
      ?auto_26352 - HOIST
      ?auto_26351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26352 ?auto_26351 ) ( SURFACE-AT ?auto_26349 ?auto_26351 ) ( CLEAR ?auto_26349 ) ( LIFTING ?auto_26352 ?auto_26350 ) ( IS-CRATE ?auto_26350 ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( ON ?auto_26348 ?auto_26347 ) ( ON ?auto_26349 ?auto_26348 ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26349 ?auto_26350 )
      ( MAKE-3CRATE-VERIFY ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26350 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26353 - SURFACE
      ?auto_26354 - SURFACE
      ?auto_26355 - SURFACE
      ?auto_26356 - SURFACE
      ?auto_26357 - SURFACE
    )
    :vars
    (
      ?auto_26359 - HOIST
      ?auto_26358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26359 ?auto_26358 ) ( SURFACE-AT ?auto_26356 ?auto_26358 ) ( CLEAR ?auto_26356 ) ( LIFTING ?auto_26359 ?auto_26357 ) ( IS-CRATE ?auto_26357 ) ( not ( = ?auto_26356 ?auto_26357 ) ) ( ON ?auto_26354 ?auto_26353 ) ( ON ?auto_26355 ?auto_26354 ) ( ON ?auto_26356 ?auto_26355 ) ( not ( = ?auto_26353 ?auto_26354 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( not ( = ?auto_26353 ?auto_26356 ) ) ( not ( = ?auto_26353 ?auto_26357 ) ) ( not ( = ?auto_26354 ?auto_26355 ) ) ( not ( = ?auto_26354 ?auto_26356 ) ) ( not ( = ?auto_26354 ?auto_26357 ) ) ( not ( = ?auto_26355 ?auto_26356 ) ) ( not ( = ?auto_26355 ?auto_26357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26356 ?auto_26357 )
      ( MAKE-4CRATE-VERIFY ?auto_26353 ?auto_26354 ?auto_26355 ?auto_26356 ?auto_26357 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26360 - SURFACE
      ?auto_26361 - SURFACE
      ?auto_26362 - SURFACE
      ?auto_26363 - SURFACE
      ?auto_26364 - SURFACE
      ?auto_26365 - SURFACE
    )
    :vars
    (
      ?auto_26367 - HOIST
      ?auto_26366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26367 ?auto_26366 ) ( SURFACE-AT ?auto_26364 ?auto_26366 ) ( CLEAR ?auto_26364 ) ( LIFTING ?auto_26367 ?auto_26365 ) ( IS-CRATE ?auto_26365 ) ( not ( = ?auto_26364 ?auto_26365 ) ) ( ON ?auto_26361 ?auto_26360 ) ( ON ?auto_26362 ?auto_26361 ) ( ON ?auto_26363 ?auto_26362 ) ( ON ?auto_26364 ?auto_26363 ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26362 ) ) ( not ( = ?auto_26360 ?auto_26363 ) ) ( not ( = ?auto_26360 ?auto_26364 ) ) ( not ( = ?auto_26360 ?auto_26365 ) ) ( not ( = ?auto_26361 ?auto_26362 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( not ( = ?auto_26361 ?auto_26364 ) ) ( not ( = ?auto_26361 ?auto_26365 ) ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( not ( = ?auto_26362 ?auto_26365 ) ) ( not ( = ?auto_26363 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26364 ?auto_26365 )
      ( MAKE-5CRATE-VERIFY ?auto_26360 ?auto_26361 ?auto_26362 ?auto_26363 ?auto_26364 ?auto_26365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26368 - SURFACE
      ?auto_26369 - SURFACE
    )
    :vars
    (
      ?auto_26371 - HOIST
      ?auto_26370 - PLACE
      ?auto_26372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26371 ?auto_26370 ) ( SURFACE-AT ?auto_26368 ?auto_26370 ) ( CLEAR ?auto_26368 ) ( IS-CRATE ?auto_26369 ) ( not ( = ?auto_26368 ?auto_26369 ) ) ( TRUCK-AT ?auto_26372 ?auto_26370 ) ( AVAILABLE ?auto_26371 ) ( IN ?auto_26369 ?auto_26372 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26371 ?auto_26369 ?auto_26372 ?auto_26370 )
      ( MAKE-1CRATE ?auto_26368 ?auto_26369 )
      ( MAKE-1CRATE-VERIFY ?auto_26368 ?auto_26369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26373 - SURFACE
      ?auto_26374 - SURFACE
      ?auto_26375 - SURFACE
    )
    :vars
    (
      ?auto_26377 - HOIST
      ?auto_26378 - PLACE
      ?auto_26376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26377 ?auto_26378 ) ( SURFACE-AT ?auto_26374 ?auto_26378 ) ( CLEAR ?auto_26374 ) ( IS-CRATE ?auto_26375 ) ( not ( = ?auto_26374 ?auto_26375 ) ) ( TRUCK-AT ?auto_26376 ?auto_26378 ) ( AVAILABLE ?auto_26377 ) ( IN ?auto_26375 ?auto_26376 ) ( ON ?auto_26374 ?auto_26373 ) ( not ( = ?auto_26373 ?auto_26374 ) ) ( not ( = ?auto_26373 ?auto_26375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26374 ?auto_26375 )
      ( MAKE-2CRATE-VERIFY ?auto_26373 ?auto_26374 ?auto_26375 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26379 - SURFACE
      ?auto_26380 - SURFACE
      ?auto_26381 - SURFACE
      ?auto_26382 - SURFACE
    )
    :vars
    (
      ?auto_26384 - HOIST
      ?auto_26385 - PLACE
      ?auto_26383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26384 ?auto_26385 ) ( SURFACE-AT ?auto_26381 ?auto_26385 ) ( CLEAR ?auto_26381 ) ( IS-CRATE ?auto_26382 ) ( not ( = ?auto_26381 ?auto_26382 ) ) ( TRUCK-AT ?auto_26383 ?auto_26385 ) ( AVAILABLE ?auto_26384 ) ( IN ?auto_26382 ?auto_26383 ) ( ON ?auto_26381 ?auto_26380 ) ( not ( = ?auto_26380 ?auto_26381 ) ) ( not ( = ?auto_26380 ?auto_26382 ) ) ( ON ?auto_26380 ?auto_26379 ) ( not ( = ?auto_26379 ?auto_26380 ) ) ( not ( = ?auto_26379 ?auto_26381 ) ) ( not ( = ?auto_26379 ?auto_26382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26380 ?auto_26381 ?auto_26382 )
      ( MAKE-3CRATE-VERIFY ?auto_26379 ?auto_26380 ?auto_26381 ?auto_26382 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26386 - SURFACE
      ?auto_26387 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26389 - SURFACE
      ?auto_26390 - SURFACE
    )
    :vars
    (
      ?auto_26392 - HOIST
      ?auto_26393 - PLACE
      ?auto_26391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26392 ?auto_26393 ) ( SURFACE-AT ?auto_26389 ?auto_26393 ) ( CLEAR ?auto_26389 ) ( IS-CRATE ?auto_26390 ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( TRUCK-AT ?auto_26391 ?auto_26393 ) ( AVAILABLE ?auto_26392 ) ( IN ?auto_26390 ?auto_26391 ) ( ON ?auto_26389 ?auto_26388 ) ( not ( = ?auto_26388 ?auto_26389 ) ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( ON ?auto_26387 ?auto_26386 ) ( ON ?auto_26388 ?auto_26387 ) ( not ( = ?auto_26386 ?auto_26387 ) ) ( not ( = ?auto_26386 ?auto_26388 ) ) ( not ( = ?auto_26386 ?auto_26389 ) ) ( not ( = ?auto_26386 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26388 ) ) ( not ( = ?auto_26387 ?auto_26389 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26388 ?auto_26389 ?auto_26390 )
      ( MAKE-4CRATE-VERIFY ?auto_26386 ?auto_26387 ?auto_26388 ?auto_26389 ?auto_26390 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26394 - SURFACE
      ?auto_26395 - SURFACE
      ?auto_26396 - SURFACE
      ?auto_26397 - SURFACE
      ?auto_26398 - SURFACE
      ?auto_26399 - SURFACE
    )
    :vars
    (
      ?auto_26401 - HOIST
      ?auto_26402 - PLACE
      ?auto_26400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26401 ?auto_26402 ) ( SURFACE-AT ?auto_26398 ?auto_26402 ) ( CLEAR ?auto_26398 ) ( IS-CRATE ?auto_26399 ) ( not ( = ?auto_26398 ?auto_26399 ) ) ( TRUCK-AT ?auto_26400 ?auto_26402 ) ( AVAILABLE ?auto_26401 ) ( IN ?auto_26399 ?auto_26400 ) ( ON ?auto_26398 ?auto_26397 ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26399 ) ) ( ON ?auto_26395 ?auto_26394 ) ( ON ?auto_26396 ?auto_26395 ) ( ON ?auto_26397 ?auto_26396 ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26397 ) ) ( not ( = ?auto_26394 ?auto_26398 ) ) ( not ( = ?auto_26394 ?auto_26399 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26397 ) ) ( not ( = ?auto_26395 ?auto_26398 ) ) ( not ( = ?auto_26395 ?auto_26399 ) ) ( not ( = ?auto_26396 ?auto_26397 ) ) ( not ( = ?auto_26396 ?auto_26398 ) ) ( not ( = ?auto_26396 ?auto_26399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26397 ?auto_26398 ?auto_26399 )
      ( MAKE-5CRATE-VERIFY ?auto_26394 ?auto_26395 ?auto_26396 ?auto_26397 ?auto_26398 ?auto_26399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26403 - SURFACE
      ?auto_26404 - SURFACE
    )
    :vars
    (
      ?auto_26407 - HOIST
      ?auto_26408 - PLACE
      ?auto_26406 - TRUCK
      ?auto_26405 - SURFACE
      ?auto_26409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26407 ?auto_26408 ) ( SURFACE-AT ?auto_26403 ?auto_26408 ) ( CLEAR ?auto_26403 ) ( IS-CRATE ?auto_26404 ) ( not ( = ?auto_26403 ?auto_26404 ) ) ( AVAILABLE ?auto_26407 ) ( IN ?auto_26404 ?auto_26406 ) ( ON ?auto_26403 ?auto_26405 ) ( not ( = ?auto_26405 ?auto_26403 ) ) ( not ( = ?auto_26405 ?auto_26404 ) ) ( TRUCK-AT ?auto_26406 ?auto_26409 ) ( not ( = ?auto_26409 ?auto_26408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26406 ?auto_26409 ?auto_26408 )
      ( MAKE-2CRATE ?auto_26405 ?auto_26403 ?auto_26404 )
      ( MAKE-1CRATE-VERIFY ?auto_26403 ?auto_26404 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26410 - SURFACE
      ?auto_26411 - SURFACE
      ?auto_26412 - SURFACE
    )
    :vars
    (
      ?auto_26413 - HOIST
      ?auto_26414 - PLACE
      ?auto_26416 - TRUCK
      ?auto_26415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26413 ?auto_26414 ) ( SURFACE-AT ?auto_26411 ?auto_26414 ) ( CLEAR ?auto_26411 ) ( IS-CRATE ?auto_26412 ) ( not ( = ?auto_26411 ?auto_26412 ) ) ( AVAILABLE ?auto_26413 ) ( IN ?auto_26412 ?auto_26416 ) ( ON ?auto_26411 ?auto_26410 ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( not ( = ?auto_26410 ?auto_26412 ) ) ( TRUCK-AT ?auto_26416 ?auto_26415 ) ( not ( = ?auto_26415 ?auto_26414 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26411 ?auto_26412 )
      ( MAKE-2CRATE-VERIFY ?auto_26410 ?auto_26411 ?auto_26412 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26417 - SURFACE
      ?auto_26418 - SURFACE
      ?auto_26419 - SURFACE
      ?auto_26420 - SURFACE
    )
    :vars
    (
      ?auto_26422 - HOIST
      ?auto_26421 - PLACE
      ?auto_26424 - TRUCK
      ?auto_26423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26422 ?auto_26421 ) ( SURFACE-AT ?auto_26419 ?auto_26421 ) ( CLEAR ?auto_26419 ) ( IS-CRATE ?auto_26420 ) ( not ( = ?auto_26419 ?auto_26420 ) ) ( AVAILABLE ?auto_26422 ) ( IN ?auto_26420 ?auto_26424 ) ( ON ?auto_26419 ?auto_26418 ) ( not ( = ?auto_26418 ?auto_26419 ) ) ( not ( = ?auto_26418 ?auto_26420 ) ) ( TRUCK-AT ?auto_26424 ?auto_26423 ) ( not ( = ?auto_26423 ?auto_26421 ) ) ( ON ?auto_26418 ?auto_26417 ) ( not ( = ?auto_26417 ?auto_26418 ) ) ( not ( = ?auto_26417 ?auto_26419 ) ) ( not ( = ?auto_26417 ?auto_26420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26418 ?auto_26419 ?auto_26420 )
      ( MAKE-3CRATE-VERIFY ?auto_26417 ?auto_26418 ?auto_26419 ?auto_26420 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26425 - SURFACE
      ?auto_26426 - SURFACE
      ?auto_26427 - SURFACE
      ?auto_26428 - SURFACE
      ?auto_26429 - SURFACE
    )
    :vars
    (
      ?auto_26431 - HOIST
      ?auto_26430 - PLACE
      ?auto_26433 - TRUCK
      ?auto_26432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26431 ?auto_26430 ) ( SURFACE-AT ?auto_26428 ?auto_26430 ) ( CLEAR ?auto_26428 ) ( IS-CRATE ?auto_26429 ) ( not ( = ?auto_26428 ?auto_26429 ) ) ( AVAILABLE ?auto_26431 ) ( IN ?auto_26429 ?auto_26433 ) ( ON ?auto_26428 ?auto_26427 ) ( not ( = ?auto_26427 ?auto_26428 ) ) ( not ( = ?auto_26427 ?auto_26429 ) ) ( TRUCK-AT ?auto_26433 ?auto_26432 ) ( not ( = ?auto_26432 ?auto_26430 ) ) ( ON ?auto_26426 ?auto_26425 ) ( ON ?auto_26427 ?auto_26426 ) ( not ( = ?auto_26425 ?auto_26426 ) ) ( not ( = ?auto_26425 ?auto_26427 ) ) ( not ( = ?auto_26425 ?auto_26428 ) ) ( not ( = ?auto_26425 ?auto_26429 ) ) ( not ( = ?auto_26426 ?auto_26427 ) ) ( not ( = ?auto_26426 ?auto_26428 ) ) ( not ( = ?auto_26426 ?auto_26429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26427 ?auto_26428 ?auto_26429 )
      ( MAKE-4CRATE-VERIFY ?auto_26425 ?auto_26426 ?auto_26427 ?auto_26428 ?auto_26429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26434 - SURFACE
      ?auto_26435 - SURFACE
      ?auto_26436 - SURFACE
      ?auto_26437 - SURFACE
      ?auto_26438 - SURFACE
      ?auto_26439 - SURFACE
    )
    :vars
    (
      ?auto_26441 - HOIST
      ?auto_26440 - PLACE
      ?auto_26443 - TRUCK
      ?auto_26442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26441 ?auto_26440 ) ( SURFACE-AT ?auto_26438 ?auto_26440 ) ( CLEAR ?auto_26438 ) ( IS-CRATE ?auto_26439 ) ( not ( = ?auto_26438 ?auto_26439 ) ) ( AVAILABLE ?auto_26441 ) ( IN ?auto_26439 ?auto_26443 ) ( ON ?auto_26438 ?auto_26437 ) ( not ( = ?auto_26437 ?auto_26438 ) ) ( not ( = ?auto_26437 ?auto_26439 ) ) ( TRUCK-AT ?auto_26443 ?auto_26442 ) ( not ( = ?auto_26442 ?auto_26440 ) ) ( ON ?auto_26435 ?auto_26434 ) ( ON ?auto_26436 ?auto_26435 ) ( ON ?auto_26437 ?auto_26436 ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( not ( = ?auto_26434 ?auto_26436 ) ) ( not ( = ?auto_26434 ?auto_26437 ) ) ( not ( = ?auto_26434 ?auto_26438 ) ) ( not ( = ?auto_26434 ?auto_26439 ) ) ( not ( = ?auto_26435 ?auto_26436 ) ) ( not ( = ?auto_26435 ?auto_26437 ) ) ( not ( = ?auto_26435 ?auto_26438 ) ) ( not ( = ?auto_26435 ?auto_26439 ) ) ( not ( = ?auto_26436 ?auto_26437 ) ) ( not ( = ?auto_26436 ?auto_26438 ) ) ( not ( = ?auto_26436 ?auto_26439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26437 ?auto_26438 ?auto_26439 )
      ( MAKE-5CRATE-VERIFY ?auto_26434 ?auto_26435 ?auto_26436 ?auto_26437 ?auto_26438 ?auto_26439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
    )
    :vars
    (
      ?auto_26447 - HOIST
      ?auto_26446 - PLACE
      ?auto_26449 - SURFACE
      ?auto_26450 - TRUCK
      ?auto_26448 - PLACE
      ?auto_26451 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26447 ?auto_26446 ) ( SURFACE-AT ?auto_26444 ?auto_26446 ) ( CLEAR ?auto_26444 ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( AVAILABLE ?auto_26447 ) ( ON ?auto_26444 ?auto_26449 ) ( not ( = ?auto_26449 ?auto_26444 ) ) ( not ( = ?auto_26449 ?auto_26445 ) ) ( TRUCK-AT ?auto_26450 ?auto_26448 ) ( not ( = ?auto_26448 ?auto_26446 ) ) ( HOIST-AT ?auto_26451 ?auto_26448 ) ( LIFTING ?auto_26451 ?auto_26445 ) ( not ( = ?auto_26447 ?auto_26451 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26451 ?auto_26445 ?auto_26450 ?auto_26448 )
      ( MAKE-2CRATE ?auto_26449 ?auto_26444 ?auto_26445 )
      ( MAKE-1CRATE-VERIFY ?auto_26444 ?auto_26445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26452 - SURFACE
      ?auto_26453 - SURFACE
      ?auto_26454 - SURFACE
    )
    :vars
    (
      ?auto_26457 - HOIST
      ?auto_26456 - PLACE
      ?auto_26459 - TRUCK
      ?auto_26455 - PLACE
      ?auto_26458 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26457 ?auto_26456 ) ( SURFACE-AT ?auto_26453 ?auto_26456 ) ( CLEAR ?auto_26453 ) ( IS-CRATE ?auto_26454 ) ( not ( = ?auto_26453 ?auto_26454 ) ) ( AVAILABLE ?auto_26457 ) ( ON ?auto_26453 ?auto_26452 ) ( not ( = ?auto_26452 ?auto_26453 ) ) ( not ( = ?auto_26452 ?auto_26454 ) ) ( TRUCK-AT ?auto_26459 ?auto_26455 ) ( not ( = ?auto_26455 ?auto_26456 ) ) ( HOIST-AT ?auto_26458 ?auto_26455 ) ( LIFTING ?auto_26458 ?auto_26454 ) ( not ( = ?auto_26457 ?auto_26458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26453 ?auto_26454 )
      ( MAKE-2CRATE-VERIFY ?auto_26452 ?auto_26453 ?auto_26454 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26460 - SURFACE
      ?auto_26461 - SURFACE
      ?auto_26462 - SURFACE
      ?auto_26463 - SURFACE
    )
    :vars
    (
      ?auto_26464 - HOIST
      ?auto_26466 - PLACE
      ?auto_26467 - TRUCK
      ?auto_26465 - PLACE
      ?auto_26468 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26464 ?auto_26466 ) ( SURFACE-AT ?auto_26462 ?auto_26466 ) ( CLEAR ?auto_26462 ) ( IS-CRATE ?auto_26463 ) ( not ( = ?auto_26462 ?auto_26463 ) ) ( AVAILABLE ?auto_26464 ) ( ON ?auto_26462 ?auto_26461 ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( TRUCK-AT ?auto_26467 ?auto_26465 ) ( not ( = ?auto_26465 ?auto_26466 ) ) ( HOIST-AT ?auto_26468 ?auto_26465 ) ( LIFTING ?auto_26468 ?auto_26463 ) ( not ( = ?auto_26464 ?auto_26468 ) ) ( ON ?auto_26461 ?auto_26460 ) ( not ( = ?auto_26460 ?auto_26461 ) ) ( not ( = ?auto_26460 ?auto_26462 ) ) ( not ( = ?auto_26460 ?auto_26463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26461 ?auto_26462 ?auto_26463 )
      ( MAKE-3CRATE-VERIFY ?auto_26460 ?auto_26461 ?auto_26462 ?auto_26463 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26469 - SURFACE
      ?auto_26470 - SURFACE
      ?auto_26471 - SURFACE
      ?auto_26472 - SURFACE
      ?auto_26473 - SURFACE
    )
    :vars
    (
      ?auto_26474 - HOIST
      ?auto_26476 - PLACE
      ?auto_26477 - TRUCK
      ?auto_26475 - PLACE
      ?auto_26478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26474 ?auto_26476 ) ( SURFACE-AT ?auto_26472 ?auto_26476 ) ( CLEAR ?auto_26472 ) ( IS-CRATE ?auto_26473 ) ( not ( = ?auto_26472 ?auto_26473 ) ) ( AVAILABLE ?auto_26474 ) ( ON ?auto_26472 ?auto_26471 ) ( not ( = ?auto_26471 ?auto_26472 ) ) ( not ( = ?auto_26471 ?auto_26473 ) ) ( TRUCK-AT ?auto_26477 ?auto_26475 ) ( not ( = ?auto_26475 ?auto_26476 ) ) ( HOIST-AT ?auto_26478 ?auto_26475 ) ( LIFTING ?auto_26478 ?auto_26473 ) ( not ( = ?auto_26474 ?auto_26478 ) ) ( ON ?auto_26470 ?auto_26469 ) ( ON ?auto_26471 ?auto_26470 ) ( not ( = ?auto_26469 ?auto_26470 ) ) ( not ( = ?auto_26469 ?auto_26471 ) ) ( not ( = ?auto_26469 ?auto_26472 ) ) ( not ( = ?auto_26469 ?auto_26473 ) ) ( not ( = ?auto_26470 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26472 ) ) ( not ( = ?auto_26470 ?auto_26473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26471 ?auto_26472 ?auto_26473 )
      ( MAKE-4CRATE-VERIFY ?auto_26469 ?auto_26470 ?auto_26471 ?auto_26472 ?auto_26473 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26479 - SURFACE
      ?auto_26480 - SURFACE
      ?auto_26481 - SURFACE
      ?auto_26482 - SURFACE
      ?auto_26483 - SURFACE
      ?auto_26484 - SURFACE
    )
    :vars
    (
      ?auto_26485 - HOIST
      ?auto_26487 - PLACE
      ?auto_26488 - TRUCK
      ?auto_26486 - PLACE
      ?auto_26489 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26485 ?auto_26487 ) ( SURFACE-AT ?auto_26483 ?auto_26487 ) ( CLEAR ?auto_26483 ) ( IS-CRATE ?auto_26484 ) ( not ( = ?auto_26483 ?auto_26484 ) ) ( AVAILABLE ?auto_26485 ) ( ON ?auto_26483 ?auto_26482 ) ( not ( = ?auto_26482 ?auto_26483 ) ) ( not ( = ?auto_26482 ?auto_26484 ) ) ( TRUCK-AT ?auto_26488 ?auto_26486 ) ( not ( = ?auto_26486 ?auto_26487 ) ) ( HOIST-AT ?auto_26489 ?auto_26486 ) ( LIFTING ?auto_26489 ?auto_26484 ) ( not ( = ?auto_26485 ?auto_26489 ) ) ( ON ?auto_26480 ?auto_26479 ) ( ON ?auto_26481 ?auto_26480 ) ( ON ?auto_26482 ?auto_26481 ) ( not ( = ?auto_26479 ?auto_26480 ) ) ( not ( = ?auto_26479 ?auto_26481 ) ) ( not ( = ?auto_26479 ?auto_26482 ) ) ( not ( = ?auto_26479 ?auto_26483 ) ) ( not ( = ?auto_26479 ?auto_26484 ) ) ( not ( = ?auto_26480 ?auto_26481 ) ) ( not ( = ?auto_26480 ?auto_26482 ) ) ( not ( = ?auto_26480 ?auto_26483 ) ) ( not ( = ?auto_26480 ?auto_26484 ) ) ( not ( = ?auto_26481 ?auto_26482 ) ) ( not ( = ?auto_26481 ?auto_26483 ) ) ( not ( = ?auto_26481 ?auto_26484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26482 ?auto_26483 ?auto_26484 )
      ( MAKE-5CRATE-VERIFY ?auto_26479 ?auto_26480 ?auto_26481 ?auto_26482 ?auto_26483 ?auto_26484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26490 - SURFACE
      ?auto_26491 - SURFACE
    )
    :vars
    (
      ?auto_26492 - HOIST
      ?auto_26495 - PLACE
      ?auto_26493 - SURFACE
      ?auto_26496 - TRUCK
      ?auto_26494 - PLACE
      ?auto_26497 - HOIST
      ?auto_26498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26492 ?auto_26495 ) ( SURFACE-AT ?auto_26490 ?auto_26495 ) ( CLEAR ?auto_26490 ) ( IS-CRATE ?auto_26491 ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( AVAILABLE ?auto_26492 ) ( ON ?auto_26490 ?auto_26493 ) ( not ( = ?auto_26493 ?auto_26490 ) ) ( not ( = ?auto_26493 ?auto_26491 ) ) ( TRUCK-AT ?auto_26496 ?auto_26494 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( HOIST-AT ?auto_26497 ?auto_26494 ) ( not ( = ?auto_26492 ?auto_26497 ) ) ( AVAILABLE ?auto_26497 ) ( SURFACE-AT ?auto_26491 ?auto_26494 ) ( ON ?auto_26491 ?auto_26498 ) ( CLEAR ?auto_26491 ) ( not ( = ?auto_26490 ?auto_26498 ) ) ( not ( = ?auto_26491 ?auto_26498 ) ) ( not ( = ?auto_26493 ?auto_26498 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26497 ?auto_26491 ?auto_26498 ?auto_26494 )
      ( MAKE-2CRATE ?auto_26493 ?auto_26490 ?auto_26491 )
      ( MAKE-1CRATE-VERIFY ?auto_26490 ?auto_26491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26499 - SURFACE
      ?auto_26500 - SURFACE
      ?auto_26501 - SURFACE
    )
    :vars
    (
      ?auto_26507 - HOIST
      ?auto_26502 - PLACE
      ?auto_26505 - TRUCK
      ?auto_26503 - PLACE
      ?auto_26504 - HOIST
      ?auto_26506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26507 ?auto_26502 ) ( SURFACE-AT ?auto_26500 ?auto_26502 ) ( CLEAR ?auto_26500 ) ( IS-CRATE ?auto_26501 ) ( not ( = ?auto_26500 ?auto_26501 ) ) ( AVAILABLE ?auto_26507 ) ( ON ?auto_26500 ?auto_26499 ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( TRUCK-AT ?auto_26505 ?auto_26503 ) ( not ( = ?auto_26503 ?auto_26502 ) ) ( HOIST-AT ?auto_26504 ?auto_26503 ) ( not ( = ?auto_26507 ?auto_26504 ) ) ( AVAILABLE ?auto_26504 ) ( SURFACE-AT ?auto_26501 ?auto_26503 ) ( ON ?auto_26501 ?auto_26506 ) ( CLEAR ?auto_26501 ) ( not ( = ?auto_26500 ?auto_26506 ) ) ( not ( = ?auto_26501 ?auto_26506 ) ) ( not ( = ?auto_26499 ?auto_26506 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26500 ?auto_26501 )
      ( MAKE-2CRATE-VERIFY ?auto_26499 ?auto_26500 ?auto_26501 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26508 - SURFACE
      ?auto_26509 - SURFACE
      ?auto_26510 - SURFACE
      ?auto_26511 - SURFACE
    )
    :vars
    (
      ?auto_26516 - HOIST
      ?auto_26517 - PLACE
      ?auto_26514 - TRUCK
      ?auto_26512 - PLACE
      ?auto_26515 - HOIST
      ?auto_26513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26516 ?auto_26517 ) ( SURFACE-AT ?auto_26510 ?auto_26517 ) ( CLEAR ?auto_26510 ) ( IS-CRATE ?auto_26511 ) ( not ( = ?auto_26510 ?auto_26511 ) ) ( AVAILABLE ?auto_26516 ) ( ON ?auto_26510 ?auto_26509 ) ( not ( = ?auto_26509 ?auto_26510 ) ) ( not ( = ?auto_26509 ?auto_26511 ) ) ( TRUCK-AT ?auto_26514 ?auto_26512 ) ( not ( = ?auto_26512 ?auto_26517 ) ) ( HOIST-AT ?auto_26515 ?auto_26512 ) ( not ( = ?auto_26516 ?auto_26515 ) ) ( AVAILABLE ?auto_26515 ) ( SURFACE-AT ?auto_26511 ?auto_26512 ) ( ON ?auto_26511 ?auto_26513 ) ( CLEAR ?auto_26511 ) ( not ( = ?auto_26510 ?auto_26513 ) ) ( not ( = ?auto_26511 ?auto_26513 ) ) ( not ( = ?auto_26509 ?auto_26513 ) ) ( ON ?auto_26509 ?auto_26508 ) ( not ( = ?auto_26508 ?auto_26509 ) ) ( not ( = ?auto_26508 ?auto_26510 ) ) ( not ( = ?auto_26508 ?auto_26511 ) ) ( not ( = ?auto_26508 ?auto_26513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26509 ?auto_26510 ?auto_26511 )
      ( MAKE-3CRATE-VERIFY ?auto_26508 ?auto_26509 ?auto_26510 ?auto_26511 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26518 - SURFACE
      ?auto_26519 - SURFACE
      ?auto_26520 - SURFACE
      ?auto_26521 - SURFACE
      ?auto_26522 - SURFACE
    )
    :vars
    (
      ?auto_26527 - HOIST
      ?auto_26528 - PLACE
      ?auto_26525 - TRUCK
      ?auto_26523 - PLACE
      ?auto_26526 - HOIST
      ?auto_26524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26527 ?auto_26528 ) ( SURFACE-AT ?auto_26521 ?auto_26528 ) ( CLEAR ?auto_26521 ) ( IS-CRATE ?auto_26522 ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( AVAILABLE ?auto_26527 ) ( ON ?auto_26521 ?auto_26520 ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26520 ?auto_26522 ) ) ( TRUCK-AT ?auto_26525 ?auto_26523 ) ( not ( = ?auto_26523 ?auto_26528 ) ) ( HOIST-AT ?auto_26526 ?auto_26523 ) ( not ( = ?auto_26527 ?auto_26526 ) ) ( AVAILABLE ?auto_26526 ) ( SURFACE-AT ?auto_26522 ?auto_26523 ) ( ON ?auto_26522 ?auto_26524 ) ( CLEAR ?auto_26522 ) ( not ( = ?auto_26521 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26520 ?auto_26524 ) ) ( ON ?auto_26519 ?auto_26518 ) ( ON ?auto_26520 ?auto_26519 ) ( not ( = ?auto_26518 ?auto_26519 ) ) ( not ( = ?auto_26518 ?auto_26520 ) ) ( not ( = ?auto_26518 ?auto_26521 ) ) ( not ( = ?auto_26518 ?auto_26522 ) ) ( not ( = ?auto_26518 ?auto_26524 ) ) ( not ( = ?auto_26519 ?auto_26520 ) ) ( not ( = ?auto_26519 ?auto_26521 ) ) ( not ( = ?auto_26519 ?auto_26522 ) ) ( not ( = ?auto_26519 ?auto_26524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26520 ?auto_26521 ?auto_26522 )
      ( MAKE-4CRATE-VERIFY ?auto_26518 ?auto_26519 ?auto_26520 ?auto_26521 ?auto_26522 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26529 - SURFACE
      ?auto_26530 - SURFACE
      ?auto_26531 - SURFACE
      ?auto_26532 - SURFACE
      ?auto_26533 - SURFACE
      ?auto_26534 - SURFACE
    )
    :vars
    (
      ?auto_26539 - HOIST
      ?auto_26540 - PLACE
      ?auto_26537 - TRUCK
      ?auto_26535 - PLACE
      ?auto_26538 - HOIST
      ?auto_26536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26539 ?auto_26540 ) ( SURFACE-AT ?auto_26533 ?auto_26540 ) ( CLEAR ?auto_26533 ) ( IS-CRATE ?auto_26534 ) ( not ( = ?auto_26533 ?auto_26534 ) ) ( AVAILABLE ?auto_26539 ) ( ON ?auto_26533 ?auto_26532 ) ( not ( = ?auto_26532 ?auto_26533 ) ) ( not ( = ?auto_26532 ?auto_26534 ) ) ( TRUCK-AT ?auto_26537 ?auto_26535 ) ( not ( = ?auto_26535 ?auto_26540 ) ) ( HOIST-AT ?auto_26538 ?auto_26535 ) ( not ( = ?auto_26539 ?auto_26538 ) ) ( AVAILABLE ?auto_26538 ) ( SURFACE-AT ?auto_26534 ?auto_26535 ) ( ON ?auto_26534 ?auto_26536 ) ( CLEAR ?auto_26534 ) ( not ( = ?auto_26533 ?auto_26536 ) ) ( not ( = ?auto_26534 ?auto_26536 ) ) ( not ( = ?auto_26532 ?auto_26536 ) ) ( ON ?auto_26530 ?auto_26529 ) ( ON ?auto_26531 ?auto_26530 ) ( ON ?auto_26532 ?auto_26531 ) ( not ( = ?auto_26529 ?auto_26530 ) ) ( not ( = ?auto_26529 ?auto_26531 ) ) ( not ( = ?auto_26529 ?auto_26532 ) ) ( not ( = ?auto_26529 ?auto_26533 ) ) ( not ( = ?auto_26529 ?auto_26534 ) ) ( not ( = ?auto_26529 ?auto_26536 ) ) ( not ( = ?auto_26530 ?auto_26531 ) ) ( not ( = ?auto_26530 ?auto_26532 ) ) ( not ( = ?auto_26530 ?auto_26533 ) ) ( not ( = ?auto_26530 ?auto_26534 ) ) ( not ( = ?auto_26530 ?auto_26536 ) ) ( not ( = ?auto_26531 ?auto_26532 ) ) ( not ( = ?auto_26531 ?auto_26533 ) ) ( not ( = ?auto_26531 ?auto_26534 ) ) ( not ( = ?auto_26531 ?auto_26536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26532 ?auto_26533 ?auto_26534 )
      ( MAKE-5CRATE-VERIFY ?auto_26529 ?auto_26530 ?auto_26531 ?auto_26532 ?auto_26533 ?auto_26534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26541 - SURFACE
      ?auto_26542 - SURFACE
    )
    :vars
    (
      ?auto_26547 - HOIST
      ?auto_26549 - PLACE
      ?auto_26548 - SURFACE
      ?auto_26543 - PLACE
      ?auto_26546 - HOIST
      ?auto_26544 - SURFACE
      ?auto_26545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26547 ?auto_26549 ) ( SURFACE-AT ?auto_26541 ?auto_26549 ) ( CLEAR ?auto_26541 ) ( IS-CRATE ?auto_26542 ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( AVAILABLE ?auto_26547 ) ( ON ?auto_26541 ?auto_26548 ) ( not ( = ?auto_26548 ?auto_26541 ) ) ( not ( = ?auto_26548 ?auto_26542 ) ) ( not ( = ?auto_26543 ?auto_26549 ) ) ( HOIST-AT ?auto_26546 ?auto_26543 ) ( not ( = ?auto_26547 ?auto_26546 ) ) ( AVAILABLE ?auto_26546 ) ( SURFACE-AT ?auto_26542 ?auto_26543 ) ( ON ?auto_26542 ?auto_26544 ) ( CLEAR ?auto_26542 ) ( not ( = ?auto_26541 ?auto_26544 ) ) ( not ( = ?auto_26542 ?auto_26544 ) ) ( not ( = ?auto_26548 ?auto_26544 ) ) ( TRUCK-AT ?auto_26545 ?auto_26549 ) )
    :subtasks
    ( ( !DRIVE ?auto_26545 ?auto_26549 ?auto_26543 )
      ( MAKE-2CRATE ?auto_26548 ?auto_26541 ?auto_26542 )
      ( MAKE-1CRATE-VERIFY ?auto_26541 ?auto_26542 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26550 - SURFACE
      ?auto_26551 - SURFACE
      ?auto_26552 - SURFACE
    )
    :vars
    (
      ?auto_26556 - HOIST
      ?auto_26554 - PLACE
      ?auto_26553 - PLACE
      ?auto_26558 - HOIST
      ?auto_26557 - SURFACE
      ?auto_26555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26556 ?auto_26554 ) ( SURFACE-AT ?auto_26551 ?auto_26554 ) ( CLEAR ?auto_26551 ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26551 ?auto_26552 ) ) ( AVAILABLE ?auto_26556 ) ( ON ?auto_26551 ?auto_26550 ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( HOIST-AT ?auto_26558 ?auto_26553 ) ( not ( = ?auto_26556 ?auto_26558 ) ) ( AVAILABLE ?auto_26558 ) ( SURFACE-AT ?auto_26552 ?auto_26553 ) ( ON ?auto_26552 ?auto_26557 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26551 ?auto_26557 ) ) ( not ( = ?auto_26552 ?auto_26557 ) ) ( not ( = ?auto_26550 ?auto_26557 ) ) ( TRUCK-AT ?auto_26555 ?auto_26554 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26551 ?auto_26552 )
      ( MAKE-2CRATE-VERIFY ?auto_26550 ?auto_26551 ?auto_26552 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26559 - SURFACE
      ?auto_26560 - SURFACE
      ?auto_26561 - SURFACE
      ?auto_26562 - SURFACE
    )
    :vars
    (
      ?auto_26564 - HOIST
      ?auto_26566 - PLACE
      ?auto_26568 - PLACE
      ?auto_26563 - HOIST
      ?auto_26565 - SURFACE
      ?auto_26567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26564 ?auto_26566 ) ( SURFACE-AT ?auto_26561 ?auto_26566 ) ( CLEAR ?auto_26561 ) ( IS-CRATE ?auto_26562 ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( AVAILABLE ?auto_26564 ) ( ON ?auto_26561 ?auto_26560 ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26568 ?auto_26566 ) ) ( HOIST-AT ?auto_26563 ?auto_26568 ) ( not ( = ?auto_26564 ?auto_26563 ) ) ( AVAILABLE ?auto_26563 ) ( SURFACE-AT ?auto_26562 ?auto_26568 ) ( ON ?auto_26562 ?auto_26565 ) ( CLEAR ?auto_26562 ) ( not ( = ?auto_26561 ?auto_26565 ) ) ( not ( = ?auto_26562 ?auto_26565 ) ) ( not ( = ?auto_26560 ?auto_26565 ) ) ( TRUCK-AT ?auto_26567 ?auto_26566 ) ( ON ?auto_26560 ?auto_26559 ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26559 ?auto_26562 ) ) ( not ( = ?auto_26559 ?auto_26565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26560 ?auto_26561 ?auto_26562 )
      ( MAKE-3CRATE-VERIFY ?auto_26559 ?auto_26560 ?auto_26561 ?auto_26562 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26569 - SURFACE
      ?auto_26570 - SURFACE
      ?auto_26571 - SURFACE
      ?auto_26572 - SURFACE
      ?auto_26573 - SURFACE
    )
    :vars
    (
      ?auto_26575 - HOIST
      ?auto_26577 - PLACE
      ?auto_26579 - PLACE
      ?auto_26574 - HOIST
      ?auto_26576 - SURFACE
      ?auto_26578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26575 ?auto_26577 ) ( SURFACE-AT ?auto_26572 ?auto_26577 ) ( CLEAR ?auto_26572 ) ( IS-CRATE ?auto_26573 ) ( not ( = ?auto_26572 ?auto_26573 ) ) ( AVAILABLE ?auto_26575 ) ( ON ?auto_26572 ?auto_26571 ) ( not ( = ?auto_26571 ?auto_26572 ) ) ( not ( = ?auto_26571 ?auto_26573 ) ) ( not ( = ?auto_26579 ?auto_26577 ) ) ( HOIST-AT ?auto_26574 ?auto_26579 ) ( not ( = ?auto_26575 ?auto_26574 ) ) ( AVAILABLE ?auto_26574 ) ( SURFACE-AT ?auto_26573 ?auto_26579 ) ( ON ?auto_26573 ?auto_26576 ) ( CLEAR ?auto_26573 ) ( not ( = ?auto_26572 ?auto_26576 ) ) ( not ( = ?auto_26573 ?auto_26576 ) ) ( not ( = ?auto_26571 ?auto_26576 ) ) ( TRUCK-AT ?auto_26578 ?auto_26577 ) ( ON ?auto_26570 ?auto_26569 ) ( ON ?auto_26571 ?auto_26570 ) ( not ( = ?auto_26569 ?auto_26570 ) ) ( not ( = ?auto_26569 ?auto_26571 ) ) ( not ( = ?auto_26569 ?auto_26572 ) ) ( not ( = ?auto_26569 ?auto_26573 ) ) ( not ( = ?auto_26569 ?auto_26576 ) ) ( not ( = ?auto_26570 ?auto_26571 ) ) ( not ( = ?auto_26570 ?auto_26572 ) ) ( not ( = ?auto_26570 ?auto_26573 ) ) ( not ( = ?auto_26570 ?auto_26576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26571 ?auto_26572 ?auto_26573 )
      ( MAKE-4CRATE-VERIFY ?auto_26569 ?auto_26570 ?auto_26571 ?auto_26572 ?auto_26573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26580 - SURFACE
      ?auto_26581 - SURFACE
      ?auto_26582 - SURFACE
      ?auto_26583 - SURFACE
      ?auto_26584 - SURFACE
      ?auto_26585 - SURFACE
    )
    :vars
    (
      ?auto_26587 - HOIST
      ?auto_26589 - PLACE
      ?auto_26591 - PLACE
      ?auto_26586 - HOIST
      ?auto_26588 - SURFACE
      ?auto_26590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26587 ?auto_26589 ) ( SURFACE-AT ?auto_26584 ?auto_26589 ) ( CLEAR ?auto_26584 ) ( IS-CRATE ?auto_26585 ) ( not ( = ?auto_26584 ?auto_26585 ) ) ( AVAILABLE ?auto_26587 ) ( ON ?auto_26584 ?auto_26583 ) ( not ( = ?auto_26583 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26585 ) ) ( not ( = ?auto_26591 ?auto_26589 ) ) ( HOIST-AT ?auto_26586 ?auto_26591 ) ( not ( = ?auto_26587 ?auto_26586 ) ) ( AVAILABLE ?auto_26586 ) ( SURFACE-AT ?auto_26585 ?auto_26591 ) ( ON ?auto_26585 ?auto_26588 ) ( CLEAR ?auto_26585 ) ( not ( = ?auto_26584 ?auto_26588 ) ) ( not ( = ?auto_26585 ?auto_26588 ) ) ( not ( = ?auto_26583 ?auto_26588 ) ) ( TRUCK-AT ?auto_26590 ?auto_26589 ) ( ON ?auto_26581 ?auto_26580 ) ( ON ?auto_26582 ?auto_26581 ) ( ON ?auto_26583 ?auto_26582 ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26582 ) ) ( not ( = ?auto_26580 ?auto_26583 ) ) ( not ( = ?auto_26580 ?auto_26584 ) ) ( not ( = ?auto_26580 ?auto_26585 ) ) ( not ( = ?auto_26580 ?auto_26588 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26583 ) ) ( not ( = ?auto_26581 ?auto_26584 ) ) ( not ( = ?auto_26581 ?auto_26585 ) ) ( not ( = ?auto_26581 ?auto_26588 ) ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( not ( = ?auto_26582 ?auto_26585 ) ) ( not ( = ?auto_26582 ?auto_26588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26583 ?auto_26584 ?auto_26585 )
      ( MAKE-5CRATE-VERIFY ?auto_26580 ?auto_26581 ?auto_26582 ?auto_26583 ?auto_26584 ?auto_26585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26592 - SURFACE
      ?auto_26593 - SURFACE
    )
    :vars
    (
      ?auto_26595 - HOIST
      ?auto_26598 - PLACE
      ?auto_26596 - SURFACE
      ?auto_26600 - PLACE
      ?auto_26594 - HOIST
      ?auto_26597 - SURFACE
      ?auto_26599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26595 ?auto_26598 ) ( IS-CRATE ?auto_26593 ) ( not ( = ?auto_26592 ?auto_26593 ) ) ( not ( = ?auto_26596 ?auto_26592 ) ) ( not ( = ?auto_26596 ?auto_26593 ) ) ( not ( = ?auto_26600 ?auto_26598 ) ) ( HOIST-AT ?auto_26594 ?auto_26600 ) ( not ( = ?auto_26595 ?auto_26594 ) ) ( AVAILABLE ?auto_26594 ) ( SURFACE-AT ?auto_26593 ?auto_26600 ) ( ON ?auto_26593 ?auto_26597 ) ( CLEAR ?auto_26593 ) ( not ( = ?auto_26592 ?auto_26597 ) ) ( not ( = ?auto_26593 ?auto_26597 ) ) ( not ( = ?auto_26596 ?auto_26597 ) ) ( TRUCK-AT ?auto_26599 ?auto_26598 ) ( SURFACE-AT ?auto_26596 ?auto_26598 ) ( CLEAR ?auto_26596 ) ( LIFTING ?auto_26595 ?auto_26592 ) ( IS-CRATE ?auto_26592 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26596 ?auto_26592 )
      ( MAKE-2CRATE ?auto_26596 ?auto_26592 ?auto_26593 )
      ( MAKE-1CRATE-VERIFY ?auto_26592 ?auto_26593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26601 - SURFACE
      ?auto_26602 - SURFACE
      ?auto_26603 - SURFACE
    )
    :vars
    (
      ?auto_26608 - HOIST
      ?auto_26604 - PLACE
      ?auto_26609 - PLACE
      ?auto_26606 - HOIST
      ?auto_26605 - SURFACE
      ?auto_26607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26608 ?auto_26604 ) ( IS-CRATE ?auto_26603 ) ( not ( = ?auto_26602 ?auto_26603 ) ) ( not ( = ?auto_26601 ?auto_26602 ) ) ( not ( = ?auto_26601 ?auto_26603 ) ) ( not ( = ?auto_26609 ?auto_26604 ) ) ( HOIST-AT ?auto_26606 ?auto_26609 ) ( not ( = ?auto_26608 ?auto_26606 ) ) ( AVAILABLE ?auto_26606 ) ( SURFACE-AT ?auto_26603 ?auto_26609 ) ( ON ?auto_26603 ?auto_26605 ) ( CLEAR ?auto_26603 ) ( not ( = ?auto_26602 ?auto_26605 ) ) ( not ( = ?auto_26603 ?auto_26605 ) ) ( not ( = ?auto_26601 ?auto_26605 ) ) ( TRUCK-AT ?auto_26607 ?auto_26604 ) ( SURFACE-AT ?auto_26601 ?auto_26604 ) ( CLEAR ?auto_26601 ) ( LIFTING ?auto_26608 ?auto_26602 ) ( IS-CRATE ?auto_26602 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26602 ?auto_26603 )
      ( MAKE-2CRATE-VERIFY ?auto_26601 ?auto_26602 ?auto_26603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26610 - SURFACE
      ?auto_26611 - SURFACE
      ?auto_26612 - SURFACE
      ?auto_26613 - SURFACE
    )
    :vars
    (
      ?auto_26615 - HOIST
      ?auto_26616 - PLACE
      ?auto_26614 - PLACE
      ?auto_26618 - HOIST
      ?auto_26619 - SURFACE
      ?auto_26617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26615 ?auto_26616 ) ( IS-CRATE ?auto_26613 ) ( not ( = ?auto_26612 ?auto_26613 ) ) ( not ( = ?auto_26611 ?auto_26612 ) ) ( not ( = ?auto_26611 ?auto_26613 ) ) ( not ( = ?auto_26614 ?auto_26616 ) ) ( HOIST-AT ?auto_26618 ?auto_26614 ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( AVAILABLE ?auto_26618 ) ( SURFACE-AT ?auto_26613 ?auto_26614 ) ( ON ?auto_26613 ?auto_26619 ) ( CLEAR ?auto_26613 ) ( not ( = ?auto_26612 ?auto_26619 ) ) ( not ( = ?auto_26613 ?auto_26619 ) ) ( not ( = ?auto_26611 ?auto_26619 ) ) ( TRUCK-AT ?auto_26617 ?auto_26616 ) ( SURFACE-AT ?auto_26611 ?auto_26616 ) ( CLEAR ?auto_26611 ) ( LIFTING ?auto_26615 ?auto_26612 ) ( IS-CRATE ?auto_26612 ) ( ON ?auto_26611 ?auto_26610 ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26612 ) ) ( not ( = ?auto_26610 ?auto_26613 ) ) ( not ( = ?auto_26610 ?auto_26619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26611 ?auto_26612 ?auto_26613 )
      ( MAKE-3CRATE-VERIFY ?auto_26610 ?auto_26611 ?auto_26612 ?auto_26613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26620 - SURFACE
      ?auto_26621 - SURFACE
      ?auto_26622 - SURFACE
      ?auto_26623 - SURFACE
      ?auto_26624 - SURFACE
    )
    :vars
    (
      ?auto_26626 - HOIST
      ?auto_26627 - PLACE
      ?auto_26625 - PLACE
      ?auto_26629 - HOIST
      ?auto_26630 - SURFACE
      ?auto_26628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26626 ?auto_26627 ) ( IS-CRATE ?auto_26624 ) ( not ( = ?auto_26623 ?auto_26624 ) ) ( not ( = ?auto_26622 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( HOIST-AT ?auto_26629 ?auto_26625 ) ( not ( = ?auto_26626 ?auto_26629 ) ) ( AVAILABLE ?auto_26629 ) ( SURFACE-AT ?auto_26624 ?auto_26625 ) ( ON ?auto_26624 ?auto_26630 ) ( CLEAR ?auto_26624 ) ( not ( = ?auto_26623 ?auto_26630 ) ) ( not ( = ?auto_26624 ?auto_26630 ) ) ( not ( = ?auto_26622 ?auto_26630 ) ) ( TRUCK-AT ?auto_26628 ?auto_26627 ) ( SURFACE-AT ?auto_26622 ?auto_26627 ) ( CLEAR ?auto_26622 ) ( LIFTING ?auto_26626 ?auto_26623 ) ( IS-CRATE ?auto_26623 ) ( ON ?auto_26621 ?auto_26620 ) ( ON ?auto_26622 ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26621 ) ) ( not ( = ?auto_26620 ?auto_26622 ) ) ( not ( = ?auto_26620 ?auto_26623 ) ) ( not ( = ?auto_26620 ?auto_26624 ) ) ( not ( = ?auto_26620 ?auto_26630 ) ) ( not ( = ?auto_26621 ?auto_26622 ) ) ( not ( = ?auto_26621 ?auto_26623 ) ) ( not ( = ?auto_26621 ?auto_26624 ) ) ( not ( = ?auto_26621 ?auto_26630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26622 ?auto_26623 ?auto_26624 )
      ( MAKE-4CRATE-VERIFY ?auto_26620 ?auto_26621 ?auto_26622 ?auto_26623 ?auto_26624 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26631 - SURFACE
      ?auto_26632 - SURFACE
      ?auto_26633 - SURFACE
      ?auto_26634 - SURFACE
      ?auto_26635 - SURFACE
      ?auto_26636 - SURFACE
    )
    :vars
    (
      ?auto_26638 - HOIST
      ?auto_26639 - PLACE
      ?auto_26637 - PLACE
      ?auto_26641 - HOIST
      ?auto_26642 - SURFACE
      ?auto_26640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26638 ?auto_26639 ) ( IS-CRATE ?auto_26636 ) ( not ( = ?auto_26635 ?auto_26636 ) ) ( not ( = ?auto_26634 ?auto_26635 ) ) ( not ( = ?auto_26634 ?auto_26636 ) ) ( not ( = ?auto_26637 ?auto_26639 ) ) ( HOIST-AT ?auto_26641 ?auto_26637 ) ( not ( = ?auto_26638 ?auto_26641 ) ) ( AVAILABLE ?auto_26641 ) ( SURFACE-AT ?auto_26636 ?auto_26637 ) ( ON ?auto_26636 ?auto_26642 ) ( CLEAR ?auto_26636 ) ( not ( = ?auto_26635 ?auto_26642 ) ) ( not ( = ?auto_26636 ?auto_26642 ) ) ( not ( = ?auto_26634 ?auto_26642 ) ) ( TRUCK-AT ?auto_26640 ?auto_26639 ) ( SURFACE-AT ?auto_26634 ?auto_26639 ) ( CLEAR ?auto_26634 ) ( LIFTING ?auto_26638 ?auto_26635 ) ( IS-CRATE ?auto_26635 ) ( ON ?auto_26632 ?auto_26631 ) ( ON ?auto_26633 ?auto_26632 ) ( ON ?auto_26634 ?auto_26633 ) ( not ( = ?auto_26631 ?auto_26632 ) ) ( not ( = ?auto_26631 ?auto_26633 ) ) ( not ( = ?auto_26631 ?auto_26634 ) ) ( not ( = ?auto_26631 ?auto_26635 ) ) ( not ( = ?auto_26631 ?auto_26636 ) ) ( not ( = ?auto_26631 ?auto_26642 ) ) ( not ( = ?auto_26632 ?auto_26633 ) ) ( not ( = ?auto_26632 ?auto_26634 ) ) ( not ( = ?auto_26632 ?auto_26635 ) ) ( not ( = ?auto_26632 ?auto_26636 ) ) ( not ( = ?auto_26632 ?auto_26642 ) ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26636 ) ) ( not ( = ?auto_26633 ?auto_26642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26634 ?auto_26635 ?auto_26636 )
      ( MAKE-5CRATE-VERIFY ?auto_26631 ?auto_26632 ?auto_26633 ?auto_26634 ?auto_26635 ?auto_26636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26643 - SURFACE
      ?auto_26644 - SURFACE
    )
    :vars
    (
      ?auto_26646 - HOIST
      ?auto_26647 - PLACE
      ?auto_26651 - SURFACE
      ?auto_26645 - PLACE
      ?auto_26649 - HOIST
      ?auto_26650 - SURFACE
      ?auto_26648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26646 ?auto_26647 ) ( IS-CRATE ?auto_26644 ) ( not ( = ?auto_26643 ?auto_26644 ) ) ( not ( = ?auto_26651 ?auto_26643 ) ) ( not ( = ?auto_26651 ?auto_26644 ) ) ( not ( = ?auto_26645 ?auto_26647 ) ) ( HOIST-AT ?auto_26649 ?auto_26645 ) ( not ( = ?auto_26646 ?auto_26649 ) ) ( AVAILABLE ?auto_26649 ) ( SURFACE-AT ?auto_26644 ?auto_26645 ) ( ON ?auto_26644 ?auto_26650 ) ( CLEAR ?auto_26644 ) ( not ( = ?auto_26643 ?auto_26650 ) ) ( not ( = ?auto_26644 ?auto_26650 ) ) ( not ( = ?auto_26651 ?auto_26650 ) ) ( TRUCK-AT ?auto_26648 ?auto_26647 ) ( SURFACE-AT ?auto_26651 ?auto_26647 ) ( CLEAR ?auto_26651 ) ( IS-CRATE ?auto_26643 ) ( AVAILABLE ?auto_26646 ) ( IN ?auto_26643 ?auto_26648 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26646 ?auto_26643 ?auto_26648 ?auto_26647 )
      ( MAKE-2CRATE ?auto_26651 ?auto_26643 ?auto_26644 )
      ( MAKE-1CRATE-VERIFY ?auto_26643 ?auto_26644 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26652 - SURFACE
      ?auto_26653 - SURFACE
      ?auto_26654 - SURFACE
    )
    :vars
    (
      ?auto_26659 - HOIST
      ?auto_26655 - PLACE
      ?auto_26657 - PLACE
      ?auto_26658 - HOIST
      ?auto_26656 - SURFACE
      ?auto_26660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26659 ?auto_26655 ) ( IS-CRATE ?auto_26654 ) ( not ( = ?auto_26653 ?auto_26654 ) ) ( not ( = ?auto_26652 ?auto_26653 ) ) ( not ( = ?auto_26652 ?auto_26654 ) ) ( not ( = ?auto_26657 ?auto_26655 ) ) ( HOIST-AT ?auto_26658 ?auto_26657 ) ( not ( = ?auto_26659 ?auto_26658 ) ) ( AVAILABLE ?auto_26658 ) ( SURFACE-AT ?auto_26654 ?auto_26657 ) ( ON ?auto_26654 ?auto_26656 ) ( CLEAR ?auto_26654 ) ( not ( = ?auto_26653 ?auto_26656 ) ) ( not ( = ?auto_26654 ?auto_26656 ) ) ( not ( = ?auto_26652 ?auto_26656 ) ) ( TRUCK-AT ?auto_26660 ?auto_26655 ) ( SURFACE-AT ?auto_26652 ?auto_26655 ) ( CLEAR ?auto_26652 ) ( IS-CRATE ?auto_26653 ) ( AVAILABLE ?auto_26659 ) ( IN ?auto_26653 ?auto_26660 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26653 ?auto_26654 )
      ( MAKE-2CRATE-VERIFY ?auto_26652 ?auto_26653 ?auto_26654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26661 - SURFACE
      ?auto_26662 - SURFACE
      ?auto_26663 - SURFACE
      ?auto_26664 - SURFACE
    )
    :vars
    (
      ?auto_26666 - HOIST
      ?auto_26669 - PLACE
      ?auto_26665 - PLACE
      ?auto_26667 - HOIST
      ?auto_26668 - SURFACE
      ?auto_26670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26666 ?auto_26669 ) ( IS-CRATE ?auto_26664 ) ( not ( = ?auto_26663 ?auto_26664 ) ) ( not ( = ?auto_26662 ?auto_26663 ) ) ( not ( = ?auto_26662 ?auto_26664 ) ) ( not ( = ?auto_26665 ?auto_26669 ) ) ( HOIST-AT ?auto_26667 ?auto_26665 ) ( not ( = ?auto_26666 ?auto_26667 ) ) ( AVAILABLE ?auto_26667 ) ( SURFACE-AT ?auto_26664 ?auto_26665 ) ( ON ?auto_26664 ?auto_26668 ) ( CLEAR ?auto_26664 ) ( not ( = ?auto_26663 ?auto_26668 ) ) ( not ( = ?auto_26664 ?auto_26668 ) ) ( not ( = ?auto_26662 ?auto_26668 ) ) ( TRUCK-AT ?auto_26670 ?auto_26669 ) ( SURFACE-AT ?auto_26662 ?auto_26669 ) ( CLEAR ?auto_26662 ) ( IS-CRATE ?auto_26663 ) ( AVAILABLE ?auto_26666 ) ( IN ?auto_26663 ?auto_26670 ) ( ON ?auto_26662 ?auto_26661 ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26664 ) ) ( not ( = ?auto_26661 ?auto_26668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26662 ?auto_26663 ?auto_26664 )
      ( MAKE-3CRATE-VERIFY ?auto_26661 ?auto_26662 ?auto_26663 ?auto_26664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26671 - SURFACE
      ?auto_26672 - SURFACE
      ?auto_26673 - SURFACE
      ?auto_26674 - SURFACE
      ?auto_26675 - SURFACE
    )
    :vars
    (
      ?auto_26677 - HOIST
      ?auto_26680 - PLACE
      ?auto_26676 - PLACE
      ?auto_26678 - HOIST
      ?auto_26679 - SURFACE
      ?auto_26681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26677 ?auto_26680 ) ( IS-CRATE ?auto_26675 ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26673 ?auto_26674 ) ) ( not ( = ?auto_26673 ?auto_26675 ) ) ( not ( = ?auto_26676 ?auto_26680 ) ) ( HOIST-AT ?auto_26678 ?auto_26676 ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( AVAILABLE ?auto_26678 ) ( SURFACE-AT ?auto_26675 ?auto_26676 ) ( ON ?auto_26675 ?auto_26679 ) ( CLEAR ?auto_26675 ) ( not ( = ?auto_26674 ?auto_26679 ) ) ( not ( = ?auto_26675 ?auto_26679 ) ) ( not ( = ?auto_26673 ?auto_26679 ) ) ( TRUCK-AT ?auto_26681 ?auto_26680 ) ( SURFACE-AT ?auto_26673 ?auto_26680 ) ( CLEAR ?auto_26673 ) ( IS-CRATE ?auto_26674 ) ( AVAILABLE ?auto_26677 ) ( IN ?auto_26674 ?auto_26681 ) ( ON ?auto_26672 ?auto_26671 ) ( ON ?auto_26673 ?auto_26672 ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26673 ) ) ( not ( = ?auto_26671 ?auto_26674 ) ) ( not ( = ?auto_26671 ?auto_26675 ) ) ( not ( = ?auto_26671 ?auto_26679 ) ) ( not ( = ?auto_26672 ?auto_26673 ) ) ( not ( = ?auto_26672 ?auto_26674 ) ) ( not ( = ?auto_26672 ?auto_26675 ) ) ( not ( = ?auto_26672 ?auto_26679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26673 ?auto_26674 ?auto_26675 )
      ( MAKE-4CRATE-VERIFY ?auto_26671 ?auto_26672 ?auto_26673 ?auto_26674 ?auto_26675 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26682 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26686 - SURFACE
      ?auto_26687 - SURFACE
    )
    :vars
    (
      ?auto_26689 - HOIST
      ?auto_26692 - PLACE
      ?auto_26688 - PLACE
      ?auto_26690 - HOIST
      ?auto_26691 - SURFACE
      ?auto_26693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26689 ?auto_26692 ) ( IS-CRATE ?auto_26687 ) ( not ( = ?auto_26686 ?auto_26687 ) ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26687 ) ) ( not ( = ?auto_26688 ?auto_26692 ) ) ( HOIST-AT ?auto_26690 ?auto_26688 ) ( not ( = ?auto_26689 ?auto_26690 ) ) ( AVAILABLE ?auto_26690 ) ( SURFACE-AT ?auto_26687 ?auto_26688 ) ( ON ?auto_26687 ?auto_26691 ) ( CLEAR ?auto_26687 ) ( not ( = ?auto_26686 ?auto_26691 ) ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26685 ?auto_26691 ) ) ( TRUCK-AT ?auto_26693 ?auto_26692 ) ( SURFACE-AT ?auto_26685 ?auto_26692 ) ( CLEAR ?auto_26685 ) ( IS-CRATE ?auto_26686 ) ( AVAILABLE ?auto_26689 ) ( IN ?auto_26686 ?auto_26693 ) ( ON ?auto_26683 ?auto_26682 ) ( ON ?auto_26684 ?auto_26683 ) ( ON ?auto_26685 ?auto_26684 ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26687 ) ) ( not ( = ?auto_26682 ?auto_26691 ) ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26685 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26687 ) ) ( not ( = ?auto_26683 ?auto_26691 ) ) ( not ( = ?auto_26684 ?auto_26685 ) ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26687 ) ) ( not ( = ?auto_26684 ?auto_26691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26685 ?auto_26686 ?auto_26687 )
      ( MAKE-5CRATE-VERIFY ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ?auto_26687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26694 - SURFACE
      ?auto_26695 - SURFACE
    )
    :vars
    (
      ?auto_26698 - HOIST
      ?auto_26701 - PLACE
      ?auto_26696 - SURFACE
      ?auto_26697 - PLACE
      ?auto_26699 - HOIST
      ?auto_26700 - SURFACE
      ?auto_26702 - TRUCK
      ?auto_26703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26698 ?auto_26701 ) ( IS-CRATE ?auto_26695 ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26694 ) ) ( not ( = ?auto_26696 ?auto_26695 ) ) ( not ( = ?auto_26697 ?auto_26701 ) ) ( HOIST-AT ?auto_26699 ?auto_26697 ) ( not ( = ?auto_26698 ?auto_26699 ) ) ( AVAILABLE ?auto_26699 ) ( SURFACE-AT ?auto_26695 ?auto_26697 ) ( ON ?auto_26695 ?auto_26700 ) ( CLEAR ?auto_26695 ) ( not ( = ?auto_26694 ?auto_26700 ) ) ( not ( = ?auto_26695 ?auto_26700 ) ) ( not ( = ?auto_26696 ?auto_26700 ) ) ( SURFACE-AT ?auto_26696 ?auto_26701 ) ( CLEAR ?auto_26696 ) ( IS-CRATE ?auto_26694 ) ( AVAILABLE ?auto_26698 ) ( IN ?auto_26694 ?auto_26702 ) ( TRUCK-AT ?auto_26702 ?auto_26703 ) ( not ( = ?auto_26703 ?auto_26701 ) ) ( not ( = ?auto_26697 ?auto_26703 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26702 ?auto_26703 ?auto_26701 )
      ( MAKE-2CRATE ?auto_26696 ?auto_26694 ?auto_26695 )
      ( MAKE-1CRATE-VERIFY ?auto_26694 ?auto_26695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26704 - SURFACE
      ?auto_26705 - SURFACE
      ?auto_26706 - SURFACE
    )
    :vars
    (
      ?auto_26710 - HOIST
      ?auto_26712 - PLACE
      ?auto_26711 - PLACE
      ?auto_26708 - HOIST
      ?auto_26709 - SURFACE
      ?auto_26707 - TRUCK
      ?auto_26713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26710 ?auto_26712 ) ( IS-CRATE ?auto_26706 ) ( not ( = ?auto_26705 ?auto_26706 ) ) ( not ( = ?auto_26704 ?auto_26705 ) ) ( not ( = ?auto_26704 ?auto_26706 ) ) ( not ( = ?auto_26711 ?auto_26712 ) ) ( HOIST-AT ?auto_26708 ?auto_26711 ) ( not ( = ?auto_26710 ?auto_26708 ) ) ( AVAILABLE ?auto_26708 ) ( SURFACE-AT ?auto_26706 ?auto_26711 ) ( ON ?auto_26706 ?auto_26709 ) ( CLEAR ?auto_26706 ) ( not ( = ?auto_26705 ?auto_26709 ) ) ( not ( = ?auto_26706 ?auto_26709 ) ) ( not ( = ?auto_26704 ?auto_26709 ) ) ( SURFACE-AT ?auto_26704 ?auto_26712 ) ( CLEAR ?auto_26704 ) ( IS-CRATE ?auto_26705 ) ( AVAILABLE ?auto_26710 ) ( IN ?auto_26705 ?auto_26707 ) ( TRUCK-AT ?auto_26707 ?auto_26713 ) ( not ( = ?auto_26713 ?auto_26712 ) ) ( not ( = ?auto_26711 ?auto_26713 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26705 ?auto_26706 )
      ( MAKE-2CRATE-VERIFY ?auto_26704 ?auto_26705 ?auto_26706 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26714 - SURFACE
      ?auto_26715 - SURFACE
      ?auto_26716 - SURFACE
      ?auto_26717 - SURFACE
    )
    :vars
    (
      ?auto_26724 - HOIST
      ?auto_26719 - PLACE
      ?auto_26718 - PLACE
      ?auto_26720 - HOIST
      ?auto_26721 - SURFACE
      ?auto_26722 - TRUCK
      ?auto_26723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26724 ?auto_26719 ) ( IS-CRATE ?auto_26717 ) ( not ( = ?auto_26716 ?auto_26717 ) ) ( not ( = ?auto_26715 ?auto_26716 ) ) ( not ( = ?auto_26715 ?auto_26717 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( HOIST-AT ?auto_26720 ?auto_26718 ) ( not ( = ?auto_26724 ?auto_26720 ) ) ( AVAILABLE ?auto_26720 ) ( SURFACE-AT ?auto_26717 ?auto_26718 ) ( ON ?auto_26717 ?auto_26721 ) ( CLEAR ?auto_26717 ) ( not ( = ?auto_26716 ?auto_26721 ) ) ( not ( = ?auto_26717 ?auto_26721 ) ) ( not ( = ?auto_26715 ?auto_26721 ) ) ( SURFACE-AT ?auto_26715 ?auto_26719 ) ( CLEAR ?auto_26715 ) ( IS-CRATE ?auto_26716 ) ( AVAILABLE ?auto_26724 ) ( IN ?auto_26716 ?auto_26722 ) ( TRUCK-AT ?auto_26722 ?auto_26723 ) ( not ( = ?auto_26723 ?auto_26719 ) ) ( not ( = ?auto_26718 ?auto_26723 ) ) ( ON ?auto_26715 ?auto_26714 ) ( not ( = ?auto_26714 ?auto_26715 ) ) ( not ( = ?auto_26714 ?auto_26716 ) ) ( not ( = ?auto_26714 ?auto_26717 ) ) ( not ( = ?auto_26714 ?auto_26721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26715 ?auto_26716 ?auto_26717 )
      ( MAKE-3CRATE-VERIFY ?auto_26714 ?auto_26715 ?auto_26716 ?auto_26717 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26725 - SURFACE
      ?auto_26726 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26728 - SURFACE
      ?auto_26729 - SURFACE
    )
    :vars
    (
      ?auto_26736 - HOIST
      ?auto_26731 - PLACE
      ?auto_26730 - PLACE
      ?auto_26732 - HOIST
      ?auto_26733 - SURFACE
      ?auto_26734 - TRUCK
      ?auto_26735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26736 ?auto_26731 ) ( IS-CRATE ?auto_26729 ) ( not ( = ?auto_26728 ?auto_26729 ) ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( not ( = ?auto_26727 ?auto_26729 ) ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( HOIST-AT ?auto_26732 ?auto_26730 ) ( not ( = ?auto_26736 ?auto_26732 ) ) ( AVAILABLE ?auto_26732 ) ( SURFACE-AT ?auto_26729 ?auto_26730 ) ( ON ?auto_26729 ?auto_26733 ) ( CLEAR ?auto_26729 ) ( not ( = ?auto_26728 ?auto_26733 ) ) ( not ( = ?auto_26729 ?auto_26733 ) ) ( not ( = ?auto_26727 ?auto_26733 ) ) ( SURFACE-AT ?auto_26727 ?auto_26731 ) ( CLEAR ?auto_26727 ) ( IS-CRATE ?auto_26728 ) ( AVAILABLE ?auto_26736 ) ( IN ?auto_26728 ?auto_26734 ) ( TRUCK-AT ?auto_26734 ?auto_26735 ) ( not ( = ?auto_26735 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26735 ) ) ( ON ?auto_26726 ?auto_26725 ) ( ON ?auto_26727 ?auto_26726 ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( not ( = ?auto_26725 ?auto_26727 ) ) ( not ( = ?auto_26725 ?auto_26728 ) ) ( not ( = ?auto_26725 ?auto_26729 ) ) ( not ( = ?auto_26725 ?auto_26733 ) ) ( not ( = ?auto_26726 ?auto_26727 ) ) ( not ( = ?auto_26726 ?auto_26728 ) ) ( not ( = ?auto_26726 ?auto_26729 ) ) ( not ( = ?auto_26726 ?auto_26733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26727 ?auto_26728 ?auto_26729 )
      ( MAKE-4CRATE-VERIFY ?auto_26725 ?auto_26726 ?auto_26727 ?auto_26728 ?auto_26729 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26737 - SURFACE
      ?auto_26738 - SURFACE
      ?auto_26739 - SURFACE
      ?auto_26740 - SURFACE
      ?auto_26741 - SURFACE
      ?auto_26742 - SURFACE
    )
    :vars
    (
      ?auto_26749 - HOIST
      ?auto_26744 - PLACE
      ?auto_26743 - PLACE
      ?auto_26745 - HOIST
      ?auto_26746 - SURFACE
      ?auto_26747 - TRUCK
      ?auto_26748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26749 ?auto_26744 ) ( IS-CRATE ?auto_26742 ) ( not ( = ?auto_26741 ?auto_26742 ) ) ( not ( = ?auto_26740 ?auto_26741 ) ) ( not ( = ?auto_26740 ?auto_26742 ) ) ( not ( = ?auto_26743 ?auto_26744 ) ) ( HOIST-AT ?auto_26745 ?auto_26743 ) ( not ( = ?auto_26749 ?auto_26745 ) ) ( AVAILABLE ?auto_26745 ) ( SURFACE-AT ?auto_26742 ?auto_26743 ) ( ON ?auto_26742 ?auto_26746 ) ( CLEAR ?auto_26742 ) ( not ( = ?auto_26741 ?auto_26746 ) ) ( not ( = ?auto_26742 ?auto_26746 ) ) ( not ( = ?auto_26740 ?auto_26746 ) ) ( SURFACE-AT ?auto_26740 ?auto_26744 ) ( CLEAR ?auto_26740 ) ( IS-CRATE ?auto_26741 ) ( AVAILABLE ?auto_26749 ) ( IN ?auto_26741 ?auto_26747 ) ( TRUCK-AT ?auto_26747 ?auto_26748 ) ( not ( = ?auto_26748 ?auto_26744 ) ) ( not ( = ?auto_26743 ?auto_26748 ) ) ( ON ?auto_26738 ?auto_26737 ) ( ON ?auto_26739 ?auto_26738 ) ( ON ?auto_26740 ?auto_26739 ) ( not ( = ?auto_26737 ?auto_26738 ) ) ( not ( = ?auto_26737 ?auto_26739 ) ) ( not ( = ?auto_26737 ?auto_26740 ) ) ( not ( = ?auto_26737 ?auto_26741 ) ) ( not ( = ?auto_26737 ?auto_26742 ) ) ( not ( = ?auto_26737 ?auto_26746 ) ) ( not ( = ?auto_26738 ?auto_26739 ) ) ( not ( = ?auto_26738 ?auto_26740 ) ) ( not ( = ?auto_26738 ?auto_26741 ) ) ( not ( = ?auto_26738 ?auto_26742 ) ) ( not ( = ?auto_26738 ?auto_26746 ) ) ( not ( = ?auto_26739 ?auto_26740 ) ) ( not ( = ?auto_26739 ?auto_26741 ) ) ( not ( = ?auto_26739 ?auto_26742 ) ) ( not ( = ?auto_26739 ?auto_26746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26740 ?auto_26741 ?auto_26742 )
      ( MAKE-5CRATE-VERIFY ?auto_26737 ?auto_26738 ?auto_26739 ?auto_26740 ?auto_26741 ?auto_26742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26750 - SURFACE
      ?auto_26751 - SURFACE
    )
    :vars
    (
      ?auto_26759 - HOIST
      ?auto_26754 - PLACE
      ?auto_26753 - SURFACE
      ?auto_26752 - PLACE
      ?auto_26755 - HOIST
      ?auto_26756 - SURFACE
      ?auto_26757 - TRUCK
      ?auto_26758 - PLACE
      ?auto_26760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26759 ?auto_26754 ) ( IS-CRATE ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26753 ?auto_26750 ) ) ( not ( = ?auto_26753 ?auto_26751 ) ) ( not ( = ?auto_26752 ?auto_26754 ) ) ( HOIST-AT ?auto_26755 ?auto_26752 ) ( not ( = ?auto_26759 ?auto_26755 ) ) ( AVAILABLE ?auto_26755 ) ( SURFACE-AT ?auto_26751 ?auto_26752 ) ( ON ?auto_26751 ?auto_26756 ) ( CLEAR ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26756 ) ) ( not ( = ?auto_26751 ?auto_26756 ) ) ( not ( = ?auto_26753 ?auto_26756 ) ) ( SURFACE-AT ?auto_26753 ?auto_26754 ) ( CLEAR ?auto_26753 ) ( IS-CRATE ?auto_26750 ) ( AVAILABLE ?auto_26759 ) ( TRUCK-AT ?auto_26757 ?auto_26758 ) ( not ( = ?auto_26758 ?auto_26754 ) ) ( not ( = ?auto_26752 ?auto_26758 ) ) ( HOIST-AT ?auto_26760 ?auto_26758 ) ( LIFTING ?auto_26760 ?auto_26750 ) ( not ( = ?auto_26759 ?auto_26760 ) ) ( not ( = ?auto_26755 ?auto_26760 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26760 ?auto_26750 ?auto_26757 ?auto_26758 )
      ( MAKE-2CRATE ?auto_26753 ?auto_26750 ?auto_26751 )
      ( MAKE-1CRATE-VERIFY ?auto_26750 ?auto_26751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26761 - SURFACE
      ?auto_26762 - SURFACE
      ?auto_26763 - SURFACE
    )
    :vars
    (
      ?auto_26770 - HOIST
      ?auto_26767 - PLACE
      ?auto_26768 - PLACE
      ?auto_26771 - HOIST
      ?auto_26769 - SURFACE
      ?auto_26766 - TRUCK
      ?auto_26764 - PLACE
      ?auto_26765 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26770 ?auto_26767 ) ( IS-CRATE ?auto_26763 ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26768 ?auto_26767 ) ) ( HOIST-AT ?auto_26771 ?auto_26768 ) ( not ( = ?auto_26770 ?auto_26771 ) ) ( AVAILABLE ?auto_26771 ) ( SURFACE-AT ?auto_26763 ?auto_26768 ) ( ON ?auto_26763 ?auto_26769 ) ( CLEAR ?auto_26763 ) ( not ( = ?auto_26762 ?auto_26769 ) ) ( not ( = ?auto_26763 ?auto_26769 ) ) ( not ( = ?auto_26761 ?auto_26769 ) ) ( SURFACE-AT ?auto_26761 ?auto_26767 ) ( CLEAR ?auto_26761 ) ( IS-CRATE ?auto_26762 ) ( AVAILABLE ?auto_26770 ) ( TRUCK-AT ?auto_26766 ?auto_26764 ) ( not ( = ?auto_26764 ?auto_26767 ) ) ( not ( = ?auto_26768 ?auto_26764 ) ) ( HOIST-AT ?auto_26765 ?auto_26764 ) ( LIFTING ?auto_26765 ?auto_26762 ) ( not ( = ?auto_26770 ?auto_26765 ) ) ( not ( = ?auto_26771 ?auto_26765 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26762 ?auto_26763 )
      ( MAKE-2CRATE-VERIFY ?auto_26761 ?auto_26762 ?auto_26763 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26772 - SURFACE
      ?auto_26773 - SURFACE
      ?auto_26774 - SURFACE
      ?auto_26775 - SURFACE
    )
    :vars
    (
      ?auto_26779 - HOIST
      ?auto_26776 - PLACE
      ?auto_26777 - PLACE
      ?auto_26782 - HOIST
      ?auto_26778 - SURFACE
      ?auto_26781 - TRUCK
      ?auto_26783 - PLACE
      ?auto_26780 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26779 ?auto_26776 ) ( IS-CRATE ?auto_26775 ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( not ( = ?auto_26773 ?auto_26774 ) ) ( not ( = ?auto_26773 ?auto_26775 ) ) ( not ( = ?auto_26777 ?auto_26776 ) ) ( HOIST-AT ?auto_26782 ?auto_26777 ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( AVAILABLE ?auto_26782 ) ( SURFACE-AT ?auto_26775 ?auto_26777 ) ( ON ?auto_26775 ?auto_26778 ) ( CLEAR ?auto_26775 ) ( not ( = ?auto_26774 ?auto_26778 ) ) ( not ( = ?auto_26775 ?auto_26778 ) ) ( not ( = ?auto_26773 ?auto_26778 ) ) ( SURFACE-AT ?auto_26773 ?auto_26776 ) ( CLEAR ?auto_26773 ) ( IS-CRATE ?auto_26774 ) ( AVAILABLE ?auto_26779 ) ( TRUCK-AT ?auto_26781 ?auto_26783 ) ( not ( = ?auto_26783 ?auto_26776 ) ) ( not ( = ?auto_26777 ?auto_26783 ) ) ( HOIST-AT ?auto_26780 ?auto_26783 ) ( LIFTING ?auto_26780 ?auto_26774 ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( not ( = ?auto_26782 ?auto_26780 ) ) ( ON ?auto_26773 ?auto_26772 ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( not ( = ?auto_26772 ?auto_26774 ) ) ( not ( = ?auto_26772 ?auto_26775 ) ) ( not ( = ?auto_26772 ?auto_26778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26773 ?auto_26774 ?auto_26775 )
      ( MAKE-3CRATE-VERIFY ?auto_26772 ?auto_26773 ?auto_26774 ?auto_26775 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26784 - SURFACE
      ?auto_26785 - SURFACE
      ?auto_26786 - SURFACE
      ?auto_26787 - SURFACE
      ?auto_26788 - SURFACE
    )
    :vars
    (
      ?auto_26792 - HOIST
      ?auto_26789 - PLACE
      ?auto_26790 - PLACE
      ?auto_26795 - HOIST
      ?auto_26791 - SURFACE
      ?auto_26794 - TRUCK
      ?auto_26796 - PLACE
      ?auto_26793 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26792 ?auto_26789 ) ( IS-CRATE ?auto_26788 ) ( not ( = ?auto_26787 ?auto_26788 ) ) ( not ( = ?auto_26786 ?auto_26787 ) ) ( not ( = ?auto_26786 ?auto_26788 ) ) ( not ( = ?auto_26790 ?auto_26789 ) ) ( HOIST-AT ?auto_26795 ?auto_26790 ) ( not ( = ?auto_26792 ?auto_26795 ) ) ( AVAILABLE ?auto_26795 ) ( SURFACE-AT ?auto_26788 ?auto_26790 ) ( ON ?auto_26788 ?auto_26791 ) ( CLEAR ?auto_26788 ) ( not ( = ?auto_26787 ?auto_26791 ) ) ( not ( = ?auto_26788 ?auto_26791 ) ) ( not ( = ?auto_26786 ?auto_26791 ) ) ( SURFACE-AT ?auto_26786 ?auto_26789 ) ( CLEAR ?auto_26786 ) ( IS-CRATE ?auto_26787 ) ( AVAILABLE ?auto_26792 ) ( TRUCK-AT ?auto_26794 ?auto_26796 ) ( not ( = ?auto_26796 ?auto_26789 ) ) ( not ( = ?auto_26790 ?auto_26796 ) ) ( HOIST-AT ?auto_26793 ?auto_26796 ) ( LIFTING ?auto_26793 ?auto_26787 ) ( not ( = ?auto_26792 ?auto_26793 ) ) ( not ( = ?auto_26795 ?auto_26793 ) ) ( ON ?auto_26785 ?auto_26784 ) ( ON ?auto_26786 ?auto_26785 ) ( not ( = ?auto_26784 ?auto_26785 ) ) ( not ( = ?auto_26784 ?auto_26786 ) ) ( not ( = ?auto_26784 ?auto_26787 ) ) ( not ( = ?auto_26784 ?auto_26788 ) ) ( not ( = ?auto_26784 ?auto_26791 ) ) ( not ( = ?auto_26785 ?auto_26786 ) ) ( not ( = ?auto_26785 ?auto_26787 ) ) ( not ( = ?auto_26785 ?auto_26788 ) ) ( not ( = ?auto_26785 ?auto_26791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26786 ?auto_26787 ?auto_26788 )
      ( MAKE-4CRATE-VERIFY ?auto_26784 ?auto_26785 ?auto_26786 ?auto_26787 ?auto_26788 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26797 - SURFACE
      ?auto_26798 - SURFACE
      ?auto_26799 - SURFACE
      ?auto_26800 - SURFACE
      ?auto_26801 - SURFACE
      ?auto_26802 - SURFACE
    )
    :vars
    (
      ?auto_26806 - HOIST
      ?auto_26803 - PLACE
      ?auto_26804 - PLACE
      ?auto_26809 - HOIST
      ?auto_26805 - SURFACE
      ?auto_26808 - TRUCK
      ?auto_26810 - PLACE
      ?auto_26807 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26806 ?auto_26803 ) ( IS-CRATE ?auto_26802 ) ( not ( = ?auto_26801 ?auto_26802 ) ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26802 ) ) ( not ( = ?auto_26804 ?auto_26803 ) ) ( HOIST-AT ?auto_26809 ?auto_26804 ) ( not ( = ?auto_26806 ?auto_26809 ) ) ( AVAILABLE ?auto_26809 ) ( SURFACE-AT ?auto_26802 ?auto_26804 ) ( ON ?auto_26802 ?auto_26805 ) ( CLEAR ?auto_26802 ) ( not ( = ?auto_26801 ?auto_26805 ) ) ( not ( = ?auto_26802 ?auto_26805 ) ) ( not ( = ?auto_26800 ?auto_26805 ) ) ( SURFACE-AT ?auto_26800 ?auto_26803 ) ( CLEAR ?auto_26800 ) ( IS-CRATE ?auto_26801 ) ( AVAILABLE ?auto_26806 ) ( TRUCK-AT ?auto_26808 ?auto_26810 ) ( not ( = ?auto_26810 ?auto_26803 ) ) ( not ( = ?auto_26804 ?auto_26810 ) ) ( HOIST-AT ?auto_26807 ?auto_26810 ) ( LIFTING ?auto_26807 ?auto_26801 ) ( not ( = ?auto_26806 ?auto_26807 ) ) ( not ( = ?auto_26809 ?auto_26807 ) ) ( ON ?auto_26798 ?auto_26797 ) ( ON ?auto_26799 ?auto_26798 ) ( ON ?auto_26800 ?auto_26799 ) ( not ( = ?auto_26797 ?auto_26798 ) ) ( not ( = ?auto_26797 ?auto_26799 ) ) ( not ( = ?auto_26797 ?auto_26800 ) ) ( not ( = ?auto_26797 ?auto_26801 ) ) ( not ( = ?auto_26797 ?auto_26802 ) ) ( not ( = ?auto_26797 ?auto_26805 ) ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26798 ?auto_26801 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26805 ) ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26800 ?auto_26801 ?auto_26802 )
      ( MAKE-5CRATE-VERIFY ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26801 ?auto_26802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26811 - SURFACE
      ?auto_26812 - SURFACE
    )
    :vars
    (
      ?auto_26816 - HOIST
      ?auto_26813 - PLACE
      ?auto_26817 - SURFACE
      ?auto_26814 - PLACE
      ?auto_26820 - HOIST
      ?auto_26815 - SURFACE
      ?auto_26819 - TRUCK
      ?auto_26821 - PLACE
      ?auto_26818 - HOIST
      ?auto_26822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26816 ?auto_26813 ) ( IS-CRATE ?auto_26812 ) ( not ( = ?auto_26811 ?auto_26812 ) ) ( not ( = ?auto_26817 ?auto_26811 ) ) ( not ( = ?auto_26817 ?auto_26812 ) ) ( not ( = ?auto_26814 ?auto_26813 ) ) ( HOIST-AT ?auto_26820 ?auto_26814 ) ( not ( = ?auto_26816 ?auto_26820 ) ) ( AVAILABLE ?auto_26820 ) ( SURFACE-AT ?auto_26812 ?auto_26814 ) ( ON ?auto_26812 ?auto_26815 ) ( CLEAR ?auto_26812 ) ( not ( = ?auto_26811 ?auto_26815 ) ) ( not ( = ?auto_26812 ?auto_26815 ) ) ( not ( = ?auto_26817 ?auto_26815 ) ) ( SURFACE-AT ?auto_26817 ?auto_26813 ) ( CLEAR ?auto_26817 ) ( IS-CRATE ?auto_26811 ) ( AVAILABLE ?auto_26816 ) ( TRUCK-AT ?auto_26819 ?auto_26821 ) ( not ( = ?auto_26821 ?auto_26813 ) ) ( not ( = ?auto_26814 ?auto_26821 ) ) ( HOIST-AT ?auto_26818 ?auto_26821 ) ( not ( = ?auto_26816 ?auto_26818 ) ) ( not ( = ?auto_26820 ?auto_26818 ) ) ( AVAILABLE ?auto_26818 ) ( SURFACE-AT ?auto_26811 ?auto_26821 ) ( ON ?auto_26811 ?auto_26822 ) ( CLEAR ?auto_26811 ) ( not ( = ?auto_26811 ?auto_26822 ) ) ( not ( = ?auto_26812 ?auto_26822 ) ) ( not ( = ?auto_26817 ?auto_26822 ) ) ( not ( = ?auto_26815 ?auto_26822 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26818 ?auto_26811 ?auto_26822 ?auto_26821 )
      ( MAKE-2CRATE ?auto_26817 ?auto_26811 ?auto_26812 )
      ( MAKE-1CRATE-VERIFY ?auto_26811 ?auto_26812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26823 - SURFACE
      ?auto_26824 - SURFACE
      ?auto_26825 - SURFACE
    )
    :vars
    (
      ?auto_26830 - HOIST
      ?auto_26832 - PLACE
      ?auto_26834 - PLACE
      ?auto_26833 - HOIST
      ?auto_26828 - SURFACE
      ?auto_26831 - TRUCK
      ?auto_26826 - PLACE
      ?auto_26827 - HOIST
      ?auto_26829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26830 ?auto_26832 ) ( IS-CRATE ?auto_26825 ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26834 ?auto_26832 ) ) ( HOIST-AT ?auto_26833 ?auto_26834 ) ( not ( = ?auto_26830 ?auto_26833 ) ) ( AVAILABLE ?auto_26833 ) ( SURFACE-AT ?auto_26825 ?auto_26834 ) ( ON ?auto_26825 ?auto_26828 ) ( CLEAR ?auto_26825 ) ( not ( = ?auto_26824 ?auto_26828 ) ) ( not ( = ?auto_26825 ?auto_26828 ) ) ( not ( = ?auto_26823 ?auto_26828 ) ) ( SURFACE-AT ?auto_26823 ?auto_26832 ) ( CLEAR ?auto_26823 ) ( IS-CRATE ?auto_26824 ) ( AVAILABLE ?auto_26830 ) ( TRUCK-AT ?auto_26831 ?auto_26826 ) ( not ( = ?auto_26826 ?auto_26832 ) ) ( not ( = ?auto_26834 ?auto_26826 ) ) ( HOIST-AT ?auto_26827 ?auto_26826 ) ( not ( = ?auto_26830 ?auto_26827 ) ) ( not ( = ?auto_26833 ?auto_26827 ) ) ( AVAILABLE ?auto_26827 ) ( SURFACE-AT ?auto_26824 ?auto_26826 ) ( ON ?auto_26824 ?auto_26829 ) ( CLEAR ?auto_26824 ) ( not ( = ?auto_26824 ?auto_26829 ) ) ( not ( = ?auto_26825 ?auto_26829 ) ) ( not ( = ?auto_26823 ?auto_26829 ) ) ( not ( = ?auto_26828 ?auto_26829 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26824 ?auto_26825 )
      ( MAKE-2CRATE-VERIFY ?auto_26823 ?auto_26824 ?auto_26825 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26835 - SURFACE
      ?auto_26836 - SURFACE
      ?auto_26837 - SURFACE
      ?auto_26838 - SURFACE
    )
    :vars
    (
      ?auto_26842 - HOIST
      ?auto_26841 - PLACE
      ?auto_26845 - PLACE
      ?auto_26846 - HOIST
      ?auto_26844 - SURFACE
      ?auto_26847 - TRUCK
      ?auto_26839 - PLACE
      ?auto_26843 - HOIST
      ?auto_26840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26842 ?auto_26841 ) ( IS-CRATE ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26845 ?auto_26841 ) ) ( HOIST-AT ?auto_26846 ?auto_26845 ) ( not ( = ?auto_26842 ?auto_26846 ) ) ( AVAILABLE ?auto_26846 ) ( SURFACE-AT ?auto_26838 ?auto_26845 ) ( ON ?auto_26838 ?auto_26844 ) ( CLEAR ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26844 ) ) ( not ( = ?auto_26838 ?auto_26844 ) ) ( not ( = ?auto_26836 ?auto_26844 ) ) ( SURFACE-AT ?auto_26836 ?auto_26841 ) ( CLEAR ?auto_26836 ) ( IS-CRATE ?auto_26837 ) ( AVAILABLE ?auto_26842 ) ( TRUCK-AT ?auto_26847 ?auto_26839 ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26845 ?auto_26839 ) ) ( HOIST-AT ?auto_26843 ?auto_26839 ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26846 ?auto_26843 ) ) ( AVAILABLE ?auto_26843 ) ( SURFACE-AT ?auto_26837 ?auto_26839 ) ( ON ?auto_26837 ?auto_26840 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26837 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26844 ?auto_26840 ) ) ( ON ?auto_26836 ?auto_26835 ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26844 ) ) ( not ( = ?auto_26835 ?auto_26840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26836 ?auto_26837 ?auto_26838 )
      ( MAKE-3CRATE-VERIFY ?auto_26835 ?auto_26836 ?auto_26837 ?auto_26838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26848 - SURFACE
      ?auto_26849 - SURFACE
      ?auto_26850 - SURFACE
      ?auto_26851 - SURFACE
      ?auto_26852 - SURFACE
    )
    :vars
    (
      ?auto_26856 - HOIST
      ?auto_26855 - PLACE
      ?auto_26859 - PLACE
      ?auto_26860 - HOIST
      ?auto_26858 - SURFACE
      ?auto_26861 - TRUCK
      ?auto_26853 - PLACE
      ?auto_26857 - HOIST
      ?auto_26854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26856 ?auto_26855 ) ( IS-CRATE ?auto_26852 ) ( not ( = ?auto_26851 ?auto_26852 ) ) ( not ( = ?auto_26850 ?auto_26851 ) ) ( not ( = ?auto_26850 ?auto_26852 ) ) ( not ( = ?auto_26859 ?auto_26855 ) ) ( HOIST-AT ?auto_26860 ?auto_26859 ) ( not ( = ?auto_26856 ?auto_26860 ) ) ( AVAILABLE ?auto_26860 ) ( SURFACE-AT ?auto_26852 ?auto_26859 ) ( ON ?auto_26852 ?auto_26858 ) ( CLEAR ?auto_26852 ) ( not ( = ?auto_26851 ?auto_26858 ) ) ( not ( = ?auto_26852 ?auto_26858 ) ) ( not ( = ?auto_26850 ?auto_26858 ) ) ( SURFACE-AT ?auto_26850 ?auto_26855 ) ( CLEAR ?auto_26850 ) ( IS-CRATE ?auto_26851 ) ( AVAILABLE ?auto_26856 ) ( TRUCK-AT ?auto_26861 ?auto_26853 ) ( not ( = ?auto_26853 ?auto_26855 ) ) ( not ( = ?auto_26859 ?auto_26853 ) ) ( HOIST-AT ?auto_26857 ?auto_26853 ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( not ( = ?auto_26860 ?auto_26857 ) ) ( AVAILABLE ?auto_26857 ) ( SURFACE-AT ?auto_26851 ?auto_26853 ) ( ON ?auto_26851 ?auto_26854 ) ( CLEAR ?auto_26851 ) ( not ( = ?auto_26851 ?auto_26854 ) ) ( not ( = ?auto_26852 ?auto_26854 ) ) ( not ( = ?auto_26850 ?auto_26854 ) ) ( not ( = ?auto_26858 ?auto_26854 ) ) ( ON ?auto_26849 ?auto_26848 ) ( ON ?auto_26850 ?auto_26849 ) ( not ( = ?auto_26848 ?auto_26849 ) ) ( not ( = ?auto_26848 ?auto_26850 ) ) ( not ( = ?auto_26848 ?auto_26851 ) ) ( not ( = ?auto_26848 ?auto_26852 ) ) ( not ( = ?auto_26848 ?auto_26858 ) ) ( not ( = ?auto_26848 ?auto_26854 ) ) ( not ( = ?auto_26849 ?auto_26850 ) ) ( not ( = ?auto_26849 ?auto_26851 ) ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26849 ?auto_26858 ) ) ( not ( = ?auto_26849 ?auto_26854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26850 ?auto_26851 ?auto_26852 )
      ( MAKE-4CRATE-VERIFY ?auto_26848 ?auto_26849 ?auto_26850 ?auto_26851 ?auto_26852 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26862 - SURFACE
      ?auto_26863 - SURFACE
      ?auto_26864 - SURFACE
      ?auto_26865 - SURFACE
      ?auto_26866 - SURFACE
      ?auto_26867 - SURFACE
    )
    :vars
    (
      ?auto_26871 - HOIST
      ?auto_26870 - PLACE
      ?auto_26874 - PLACE
      ?auto_26875 - HOIST
      ?auto_26873 - SURFACE
      ?auto_26876 - TRUCK
      ?auto_26868 - PLACE
      ?auto_26872 - HOIST
      ?auto_26869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26871 ?auto_26870 ) ( IS-CRATE ?auto_26867 ) ( not ( = ?auto_26866 ?auto_26867 ) ) ( not ( = ?auto_26865 ?auto_26866 ) ) ( not ( = ?auto_26865 ?auto_26867 ) ) ( not ( = ?auto_26874 ?auto_26870 ) ) ( HOIST-AT ?auto_26875 ?auto_26874 ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( AVAILABLE ?auto_26875 ) ( SURFACE-AT ?auto_26867 ?auto_26874 ) ( ON ?auto_26867 ?auto_26873 ) ( CLEAR ?auto_26867 ) ( not ( = ?auto_26866 ?auto_26873 ) ) ( not ( = ?auto_26867 ?auto_26873 ) ) ( not ( = ?auto_26865 ?auto_26873 ) ) ( SURFACE-AT ?auto_26865 ?auto_26870 ) ( CLEAR ?auto_26865 ) ( IS-CRATE ?auto_26866 ) ( AVAILABLE ?auto_26871 ) ( TRUCK-AT ?auto_26876 ?auto_26868 ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26874 ?auto_26868 ) ) ( HOIST-AT ?auto_26872 ?auto_26868 ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26875 ?auto_26872 ) ) ( AVAILABLE ?auto_26872 ) ( SURFACE-AT ?auto_26866 ?auto_26868 ) ( ON ?auto_26866 ?auto_26869 ) ( CLEAR ?auto_26866 ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26865 ?auto_26869 ) ) ( not ( = ?auto_26873 ?auto_26869 ) ) ( ON ?auto_26863 ?auto_26862 ) ( ON ?auto_26864 ?auto_26863 ) ( ON ?auto_26865 ?auto_26864 ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( not ( = ?auto_26862 ?auto_26864 ) ) ( not ( = ?auto_26862 ?auto_26865 ) ) ( not ( = ?auto_26862 ?auto_26866 ) ) ( not ( = ?auto_26862 ?auto_26867 ) ) ( not ( = ?auto_26862 ?auto_26873 ) ) ( not ( = ?auto_26862 ?auto_26869 ) ) ( not ( = ?auto_26863 ?auto_26864 ) ) ( not ( = ?auto_26863 ?auto_26865 ) ) ( not ( = ?auto_26863 ?auto_26866 ) ) ( not ( = ?auto_26863 ?auto_26867 ) ) ( not ( = ?auto_26863 ?auto_26873 ) ) ( not ( = ?auto_26863 ?auto_26869 ) ) ( not ( = ?auto_26864 ?auto_26865 ) ) ( not ( = ?auto_26864 ?auto_26866 ) ) ( not ( = ?auto_26864 ?auto_26867 ) ) ( not ( = ?auto_26864 ?auto_26873 ) ) ( not ( = ?auto_26864 ?auto_26869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26865 ?auto_26866 ?auto_26867 )
      ( MAKE-5CRATE-VERIFY ?auto_26862 ?auto_26863 ?auto_26864 ?auto_26865 ?auto_26866 ?auto_26867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26877 - SURFACE
      ?auto_26878 - SURFACE
    )
    :vars
    (
      ?auto_26882 - HOIST
      ?auto_26881 - PLACE
      ?auto_26883 - SURFACE
      ?auto_26886 - PLACE
      ?auto_26887 - HOIST
      ?auto_26885 - SURFACE
      ?auto_26879 - PLACE
      ?auto_26884 - HOIST
      ?auto_26880 - SURFACE
      ?auto_26888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26882 ?auto_26881 ) ( IS-CRATE ?auto_26878 ) ( not ( = ?auto_26877 ?auto_26878 ) ) ( not ( = ?auto_26883 ?auto_26877 ) ) ( not ( = ?auto_26883 ?auto_26878 ) ) ( not ( = ?auto_26886 ?auto_26881 ) ) ( HOIST-AT ?auto_26887 ?auto_26886 ) ( not ( = ?auto_26882 ?auto_26887 ) ) ( AVAILABLE ?auto_26887 ) ( SURFACE-AT ?auto_26878 ?auto_26886 ) ( ON ?auto_26878 ?auto_26885 ) ( CLEAR ?auto_26878 ) ( not ( = ?auto_26877 ?auto_26885 ) ) ( not ( = ?auto_26878 ?auto_26885 ) ) ( not ( = ?auto_26883 ?auto_26885 ) ) ( SURFACE-AT ?auto_26883 ?auto_26881 ) ( CLEAR ?auto_26883 ) ( IS-CRATE ?auto_26877 ) ( AVAILABLE ?auto_26882 ) ( not ( = ?auto_26879 ?auto_26881 ) ) ( not ( = ?auto_26886 ?auto_26879 ) ) ( HOIST-AT ?auto_26884 ?auto_26879 ) ( not ( = ?auto_26882 ?auto_26884 ) ) ( not ( = ?auto_26887 ?auto_26884 ) ) ( AVAILABLE ?auto_26884 ) ( SURFACE-AT ?auto_26877 ?auto_26879 ) ( ON ?auto_26877 ?auto_26880 ) ( CLEAR ?auto_26877 ) ( not ( = ?auto_26877 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26880 ) ) ( not ( = ?auto_26883 ?auto_26880 ) ) ( not ( = ?auto_26885 ?auto_26880 ) ) ( TRUCK-AT ?auto_26888 ?auto_26881 ) )
    :subtasks
    ( ( !DRIVE ?auto_26888 ?auto_26881 ?auto_26879 )
      ( MAKE-2CRATE ?auto_26883 ?auto_26877 ?auto_26878 )
      ( MAKE-1CRATE-VERIFY ?auto_26877 ?auto_26878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26889 - SURFACE
      ?auto_26890 - SURFACE
      ?auto_26891 - SURFACE
    )
    :vars
    (
      ?auto_26895 - HOIST
      ?auto_26893 - PLACE
      ?auto_26892 - PLACE
      ?auto_26900 - HOIST
      ?auto_26896 - SURFACE
      ?auto_26899 - PLACE
      ?auto_26897 - HOIST
      ?auto_26898 - SURFACE
      ?auto_26894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26895 ?auto_26893 ) ( IS-CRATE ?auto_26891 ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26889 ?auto_26890 ) ) ( not ( = ?auto_26889 ?auto_26891 ) ) ( not ( = ?auto_26892 ?auto_26893 ) ) ( HOIST-AT ?auto_26900 ?auto_26892 ) ( not ( = ?auto_26895 ?auto_26900 ) ) ( AVAILABLE ?auto_26900 ) ( SURFACE-AT ?auto_26891 ?auto_26892 ) ( ON ?auto_26891 ?auto_26896 ) ( CLEAR ?auto_26891 ) ( not ( = ?auto_26890 ?auto_26896 ) ) ( not ( = ?auto_26891 ?auto_26896 ) ) ( not ( = ?auto_26889 ?auto_26896 ) ) ( SURFACE-AT ?auto_26889 ?auto_26893 ) ( CLEAR ?auto_26889 ) ( IS-CRATE ?auto_26890 ) ( AVAILABLE ?auto_26895 ) ( not ( = ?auto_26899 ?auto_26893 ) ) ( not ( = ?auto_26892 ?auto_26899 ) ) ( HOIST-AT ?auto_26897 ?auto_26899 ) ( not ( = ?auto_26895 ?auto_26897 ) ) ( not ( = ?auto_26900 ?auto_26897 ) ) ( AVAILABLE ?auto_26897 ) ( SURFACE-AT ?auto_26890 ?auto_26899 ) ( ON ?auto_26890 ?auto_26898 ) ( CLEAR ?auto_26890 ) ( not ( = ?auto_26890 ?auto_26898 ) ) ( not ( = ?auto_26891 ?auto_26898 ) ) ( not ( = ?auto_26889 ?auto_26898 ) ) ( not ( = ?auto_26896 ?auto_26898 ) ) ( TRUCK-AT ?auto_26894 ?auto_26893 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26890 ?auto_26891 )
      ( MAKE-2CRATE-VERIFY ?auto_26889 ?auto_26890 ?auto_26891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26901 - SURFACE
      ?auto_26902 - SURFACE
      ?auto_26903 - SURFACE
      ?auto_26904 - SURFACE
    )
    :vars
    (
      ?auto_26911 - HOIST
      ?auto_26913 - PLACE
      ?auto_26907 - PLACE
      ?auto_26908 - HOIST
      ?auto_26906 - SURFACE
      ?auto_26910 - PLACE
      ?auto_26905 - HOIST
      ?auto_26909 - SURFACE
      ?auto_26912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26911 ?auto_26913 ) ( IS-CRATE ?auto_26904 ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26907 ?auto_26913 ) ) ( HOIST-AT ?auto_26908 ?auto_26907 ) ( not ( = ?auto_26911 ?auto_26908 ) ) ( AVAILABLE ?auto_26908 ) ( SURFACE-AT ?auto_26904 ?auto_26907 ) ( ON ?auto_26904 ?auto_26906 ) ( CLEAR ?auto_26904 ) ( not ( = ?auto_26903 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26902 ?auto_26906 ) ) ( SURFACE-AT ?auto_26902 ?auto_26913 ) ( CLEAR ?auto_26902 ) ( IS-CRATE ?auto_26903 ) ( AVAILABLE ?auto_26911 ) ( not ( = ?auto_26910 ?auto_26913 ) ) ( not ( = ?auto_26907 ?auto_26910 ) ) ( HOIST-AT ?auto_26905 ?auto_26910 ) ( not ( = ?auto_26911 ?auto_26905 ) ) ( not ( = ?auto_26908 ?auto_26905 ) ) ( AVAILABLE ?auto_26905 ) ( SURFACE-AT ?auto_26903 ?auto_26910 ) ( ON ?auto_26903 ?auto_26909 ) ( CLEAR ?auto_26903 ) ( not ( = ?auto_26903 ?auto_26909 ) ) ( not ( = ?auto_26904 ?auto_26909 ) ) ( not ( = ?auto_26902 ?auto_26909 ) ) ( not ( = ?auto_26906 ?auto_26909 ) ) ( TRUCK-AT ?auto_26912 ?auto_26913 ) ( ON ?auto_26902 ?auto_26901 ) ( not ( = ?auto_26901 ?auto_26902 ) ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26901 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26906 ) ) ( not ( = ?auto_26901 ?auto_26909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26902 ?auto_26903 ?auto_26904 )
      ( MAKE-3CRATE-VERIFY ?auto_26901 ?auto_26902 ?auto_26903 ?auto_26904 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26914 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26917 - SURFACE
      ?auto_26918 - SURFACE
    )
    :vars
    (
      ?auto_26925 - HOIST
      ?auto_26927 - PLACE
      ?auto_26921 - PLACE
      ?auto_26922 - HOIST
      ?auto_26920 - SURFACE
      ?auto_26924 - PLACE
      ?auto_26919 - HOIST
      ?auto_26923 - SURFACE
      ?auto_26926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26925 ?auto_26927 ) ( IS-CRATE ?auto_26918 ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26921 ?auto_26927 ) ) ( HOIST-AT ?auto_26922 ?auto_26921 ) ( not ( = ?auto_26925 ?auto_26922 ) ) ( AVAILABLE ?auto_26922 ) ( SURFACE-AT ?auto_26918 ?auto_26921 ) ( ON ?auto_26918 ?auto_26920 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26917 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( SURFACE-AT ?auto_26916 ?auto_26927 ) ( CLEAR ?auto_26916 ) ( IS-CRATE ?auto_26917 ) ( AVAILABLE ?auto_26925 ) ( not ( = ?auto_26924 ?auto_26927 ) ) ( not ( = ?auto_26921 ?auto_26924 ) ) ( HOIST-AT ?auto_26919 ?auto_26924 ) ( not ( = ?auto_26925 ?auto_26919 ) ) ( not ( = ?auto_26922 ?auto_26919 ) ) ( AVAILABLE ?auto_26919 ) ( SURFACE-AT ?auto_26917 ?auto_26924 ) ( ON ?auto_26917 ?auto_26923 ) ( CLEAR ?auto_26917 ) ( not ( = ?auto_26917 ?auto_26923 ) ) ( not ( = ?auto_26918 ?auto_26923 ) ) ( not ( = ?auto_26916 ?auto_26923 ) ) ( not ( = ?auto_26920 ?auto_26923 ) ) ( TRUCK-AT ?auto_26926 ?auto_26927 ) ( ON ?auto_26915 ?auto_26914 ) ( ON ?auto_26916 ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26920 ) ) ( not ( = ?auto_26914 ?auto_26923 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26920 ) ) ( not ( = ?auto_26915 ?auto_26923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26916 ?auto_26917 ?auto_26918 )
      ( MAKE-4CRATE-VERIFY ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26928 - SURFACE
      ?auto_26929 - SURFACE
      ?auto_26930 - SURFACE
      ?auto_26931 - SURFACE
      ?auto_26932 - SURFACE
      ?auto_26933 - SURFACE
    )
    :vars
    (
      ?auto_26940 - HOIST
      ?auto_26942 - PLACE
      ?auto_26936 - PLACE
      ?auto_26937 - HOIST
      ?auto_26935 - SURFACE
      ?auto_26939 - PLACE
      ?auto_26934 - HOIST
      ?auto_26938 - SURFACE
      ?auto_26941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26940 ?auto_26942 ) ( IS-CRATE ?auto_26933 ) ( not ( = ?auto_26932 ?auto_26933 ) ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( not ( = ?auto_26931 ?auto_26933 ) ) ( not ( = ?auto_26936 ?auto_26942 ) ) ( HOIST-AT ?auto_26937 ?auto_26936 ) ( not ( = ?auto_26940 ?auto_26937 ) ) ( AVAILABLE ?auto_26937 ) ( SURFACE-AT ?auto_26933 ?auto_26936 ) ( ON ?auto_26933 ?auto_26935 ) ( CLEAR ?auto_26933 ) ( not ( = ?auto_26932 ?auto_26935 ) ) ( not ( = ?auto_26933 ?auto_26935 ) ) ( not ( = ?auto_26931 ?auto_26935 ) ) ( SURFACE-AT ?auto_26931 ?auto_26942 ) ( CLEAR ?auto_26931 ) ( IS-CRATE ?auto_26932 ) ( AVAILABLE ?auto_26940 ) ( not ( = ?auto_26939 ?auto_26942 ) ) ( not ( = ?auto_26936 ?auto_26939 ) ) ( HOIST-AT ?auto_26934 ?auto_26939 ) ( not ( = ?auto_26940 ?auto_26934 ) ) ( not ( = ?auto_26937 ?auto_26934 ) ) ( AVAILABLE ?auto_26934 ) ( SURFACE-AT ?auto_26932 ?auto_26939 ) ( ON ?auto_26932 ?auto_26938 ) ( CLEAR ?auto_26932 ) ( not ( = ?auto_26932 ?auto_26938 ) ) ( not ( = ?auto_26933 ?auto_26938 ) ) ( not ( = ?auto_26931 ?auto_26938 ) ) ( not ( = ?auto_26935 ?auto_26938 ) ) ( TRUCK-AT ?auto_26941 ?auto_26942 ) ( ON ?auto_26929 ?auto_26928 ) ( ON ?auto_26930 ?auto_26929 ) ( ON ?auto_26931 ?auto_26930 ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( not ( = ?auto_26928 ?auto_26930 ) ) ( not ( = ?auto_26928 ?auto_26931 ) ) ( not ( = ?auto_26928 ?auto_26932 ) ) ( not ( = ?auto_26928 ?auto_26933 ) ) ( not ( = ?auto_26928 ?auto_26935 ) ) ( not ( = ?auto_26928 ?auto_26938 ) ) ( not ( = ?auto_26929 ?auto_26930 ) ) ( not ( = ?auto_26929 ?auto_26931 ) ) ( not ( = ?auto_26929 ?auto_26932 ) ) ( not ( = ?auto_26929 ?auto_26933 ) ) ( not ( = ?auto_26929 ?auto_26935 ) ) ( not ( = ?auto_26929 ?auto_26938 ) ) ( not ( = ?auto_26930 ?auto_26931 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26935 ) ) ( not ( = ?auto_26930 ?auto_26938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26931 ?auto_26932 ?auto_26933 )
      ( MAKE-5CRATE-VERIFY ?auto_26928 ?auto_26929 ?auto_26930 ?auto_26931 ?auto_26932 ?auto_26933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26943 - SURFACE
      ?auto_26944 - SURFACE
    )
    :vars
    (
      ?auto_26951 - HOIST
      ?auto_26954 - PLACE
      ?auto_26952 - SURFACE
      ?auto_26947 - PLACE
      ?auto_26948 - HOIST
      ?auto_26946 - SURFACE
      ?auto_26950 - PLACE
      ?auto_26945 - HOIST
      ?auto_26949 - SURFACE
      ?auto_26953 - TRUCK
      ?auto_26955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26951 ?auto_26954 ) ( IS-CRATE ?auto_26944 ) ( not ( = ?auto_26943 ?auto_26944 ) ) ( not ( = ?auto_26952 ?auto_26943 ) ) ( not ( = ?auto_26952 ?auto_26944 ) ) ( not ( = ?auto_26947 ?auto_26954 ) ) ( HOIST-AT ?auto_26948 ?auto_26947 ) ( not ( = ?auto_26951 ?auto_26948 ) ) ( AVAILABLE ?auto_26948 ) ( SURFACE-AT ?auto_26944 ?auto_26947 ) ( ON ?auto_26944 ?auto_26946 ) ( CLEAR ?auto_26944 ) ( not ( = ?auto_26943 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26952 ?auto_26946 ) ) ( IS-CRATE ?auto_26943 ) ( not ( = ?auto_26950 ?auto_26954 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( HOIST-AT ?auto_26945 ?auto_26950 ) ( not ( = ?auto_26951 ?auto_26945 ) ) ( not ( = ?auto_26948 ?auto_26945 ) ) ( AVAILABLE ?auto_26945 ) ( SURFACE-AT ?auto_26943 ?auto_26950 ) ( ON ?auto_26943 ?auto_26949 ) ( CLEAR ?auto_26943 ) ( not ( = ?auto_26943 ?auto_26949 ) ) ( not ( = ?auto_26944 ?auto_26949 ) ) ( not ( = ?auto_26952 ?auto_26949 ) ) ( not ( = ?auto_26946 ?auto_26949 ) ) ( TRUCK-AT ?auto_26953 ?auto_26954 ) ( SURFACE-AT ?auto_26955 ?auto_26954 ) ( CLEAR ?auto_26955 ) ( LIFTING ?auto_26951 ?auto_26952 ) ( IS-CRATE ?auto_26952 ) ( not ( = ?auto_26955 ?auto_26952 ) ) ( not ( = ?auto_26943 ?auto_26955 ) ) ( not ( = ?auto_26944 ?auto_26955 ) ) ( not ( = ?auto_26946 ?auto_26955 ) ) ( not ( = ?auto_26949 ?auto_26955 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26955 ?auto_26952 )
      ( MAKE-2CRATE ?auto_26952 ?auto_26943 ?auto_26944 )
      ( MAKE-1CRATE-VERIFY ?auto_26943 ?auto_26944 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26956 - SURFACE
      ?auto_26957 - SURFACE
      ?auto_26958 - SURFACE
    )
    :vars
    (
      ?auto_26966 - HOIST
      ?auto_26967 - PLACE
      ?auto_26965 - PLACE
      ?auto_26963 - HOIST
      ?auto_26960 - SURFACE
      ?auto_26964 - PLACE
      ?auto_26962 - HOIST
      ?auto_26968 - SURFACE
      ?auto_26959 - TRUCK
      ?auto_26961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26966 ?auto_26967 ) ( IS-CRATE ?auto_26958 ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( not ( = ?auto_26965 ?auto_26967 ) ) ( HOIST-AT ?auto_26963 ?auto_26965 ) ( not ( = ?auto_26966 ?auto_26963 ) ) ( AVAILABLE ?auto_26963 ) ( SURFACE-AT ?auto_26958 ?auto_26965 ) ( ON ?auto_26958 ?auto_26960 ) ( CLEAR ?auto_26958 ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( IS-CRATE ?auto_26957 ) ( not ( = ?auto_26964 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26964 ) ) ( HOIST-AT ?auto_26962 ?auto_26964 ) ( not ( = ?auto_26966 ?auto_26962 ) ) ( not ( = ?auto_26963 ?auto_26962 ) ) ( AVAILABLE ?auto_26962 ) ( SURFACE-AT ?auto_26957 ?auto_26964 ) ( ON ?auto_26957 ?auto_26968 ) ( CLEAR ?auto_26957 ) ( not ( = ?auto_26957 ?auto_26968 ) ) ( not ( = ?auto_26958 ?auto_26968 ) ) ( not ( = ?auto_26956 ?auto_26968 ) ) ( not ( = ?auto_26960 ?auto_26968 ) ) ( TRUCK-AT ?auto_26959 ?auto_26967 ) ( SURFACE-AT ?auto_26961 ?auto_26967 ) ( CLEAR ?auto_26961 ) ( LIFTING ?auto_26966 ?auto_26956 ) ( IS-CRATE ?auto_26956 ) ( not ( = ?auto_26961 ?auto_26956 ) ) ( not ( = ?auto_26957 ?auto_26961 ) ) ( not ( = ?auto_26958 ?auto_26961 ) ) ( not ( = ?auto_26960 ?auto_26961 ) ) ( not ( = ?auto_26968 ?auto_26961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26957 ?auto_26958 )
      ( MAKE-2CRATE-VERIFY ?auto_26956 ?auto_26957 ?auto_26958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26969 - SURFACE
      ?auto_26970 - SURFACE
      ?auto_26971 - SURFACE
      ?auto_26972 - SURFACE
    )
    :vars
    (
      ?auto_26980 - HOIST
      ?auto_26981 - PLACE
      ?auto_26977 - PLACE
      ?auto_26978 - HOIST
      ?auto_26976 - SURFACE
      ?auto_26974 - PLACE
      ?auto_26973 - HOIST
      ?auto_26975 - SURFACE
      ?auto_26979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26980 ?auto_26981 ) ( IS-CRATE ?auto_26972 ) ( not ( = ?auto_26971 ?auto_26972 ) ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26970 ?auto_26972 ) ) ( not ( = ?auto_26977 ?auto_26981 ) ) ( HOIST-AT ?auto_26978 ?auto_26977 ) ( not ( = ?auto_26980 ?auto_26978 ) ) ( AVAILABLE ?auto_26978 ) ( SURFACE-AT ?auto_26972 ?auto_26977 ) ( ON ?auto_26972 ?auto_26976 ) ( CLEAR ?auto_26972 ) ( not ( = ?auto_26971 ?auto_26976 ) ) ( not ( = ?auto_26972 ?auto_26976 ) ) ( not ( = ?auto_26970 ?auto_26976 ) ) ( IS-CRATE ?auto_26971 ) ( not ( = ?auto_26974 ?auto_26981 ) ) ( not ( = ?auto_26977 ?auto_26974 ) ) ( HOIST-AT ?auto_26973 ?auto_26974 ) ( not ( = ?auto_26980 ?auto_26973 ) ) ( not ( = ?auto_26978 ?auto_26973 ) ) ( AVAILABLE ?auto_26973 ) ( SURFACE-AT ?auto_26971 ?auto_26974 ) ( ON ?auto_26971 ?auto_26975 ) ( CLEAR ?auto_26971 ) ( not ( = ?auto_26971 ?auto_26975 ) ) ( not ( = ?auto_26972 ?auto_26975 ) ) ( not ( = ?auto_26970 ?auto_26975 ) ) ( not ( = ?auto_26976 ?auto_26975 ) ) ( TRUCK-AT ?auto_26979 ?auto_26981 ) ( SURFACE-AT ?auto_26969 ?auto_26981 ) ( CLEAR ?auto_26969 ) ( LIFTING ?auto_26980 ?auto_26970 ) ( IS-CRATE ?auto_26970 ) ( not ( = ?auto_26969 ?auto_26970 ) ) ( not ( = ?auto_26971 ?auto_26969 ) ) ( not ( = ?auto_26972 ?auto_26969 ) ) ( not ( = ?auto_26976 ?auto_26969 ) ) ( not ( = ?auto_26975 ?auto_26969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26970 ?auto_26971 ?auto_26972 )
      ( MAKE-3CRATE-VERIFY ?auto_26969 ?auto_26970 ?auto_26971 ?auto_26972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26982 - SURFACE
      ?auto_26983 - SURFACE
      ?auto_26984 - SURFACE
      ?auto_26985 - SURFACE
      ?auto_26986 - SURFACE
    )
    :vars
    (
      ?auto_26994 - HOIST
      ?auto_26995 - PLACE
      ?auto_26991 - PLACE
      ?auto_26992 - HOIST
      ?auto_26990 - SURFACE
      ?auto_26988 - PLACE
      ?auto_26987 - HOIST
      ?auto_26989 - SURFACE
      ?auto_26993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26994 ?auto_26995 ) ( IS-CRATE ?auto_26986 ) ( not ( = ?auto_26985 ?auto_26986 ) ) ( not ( = ?auto_26984 ?auto_26985 ) ) ( not ( = ?auto_26984 ?auto_26986 ) ) ( not ( = ?auto_26991 ?auto_26995 ) ) ( HOIST-AT ?auto_26992 ?auto_26991 ) ( not ( = ?auto_26994 ?auto_26992 ) ) ( AVAILABLE ?auto_26992 ) ( SURFACE-AT ?auto_26986 ?auto_26991 ) ( ON ?auto_26986 ?auto_26990 ) ( CLEAR ?auto_26986 ) ( not ( = ?auto_26985 ?auto_26990 ) ) ( not ( = ?auto_26986 ?auto_26990 ) ) ( not ( = ?auto_26984 ?auto_26990 ) ) ( IS-CRATE ?auto_26985 ) ( not ( = ?auto_26988 ?auto_26995 ) ) ( not ( = ?auto_26991 ?auto_26988 ) ) ( HOIST-AT ?auto_26987 ?auto_26988 ) ( not ( = ?auto_26994 ?auto_26987 ) ) ( not ( = ?auto_26992 ?auto_26987 ) ) ( AVAILABLE ?auto_26987 ) ( SURFACE-AT ?auto_26985 ?auto_26988 ) ( ON ?auto_26985 ?auto_26989 ) ( CLEAR ?auto_26985 ) ( not ( = ?auto_26985 ?auto_26989 ) ) ( not ( = ?auto_26986 ?auto_26989 ) ) ( not ( = ?auto_26984 ?auto_26989 ) ) ( not ( = ?auto_26990 ?auto_26989 ) ) ( TRUCK-AT ?auto_26993 ?auto_26995 ) ( SURFACE-AT ?auto_26983 ?auto_26995 ) ( CLEAR ?auto_26983 ) ( LIFTING ?auto_26994 ?auto_26984 ) ( IS-CRATE ?auto_26984 ) ( not ( = ?auto_26983 ?auto_26984 ) ) ( not ( = ?auto_26985 ?auto_26983 ) ) ( not ( = ?auto_26986 ?auto_26983 ) ) ( not ( = ?auto_26990 ?auto_26983 ) ) ( not ( = ?auto_26989 ?auto_26983 ) ) ( ON ?auto_26983 ?auto_26982 ) ( not ( = ?auto_26982 ?auto_26983 ) ) ( not ( = ?auto_26982 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26985 ) ) ( not ( = ?auto_26982 ?auto_26986 ) ) ( not ( = ?auto_26982 ?auto_26990 ) ) ( not ( = ?auto_26982 ?auto_26989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26984 ?auto_26985 ?auto_26986 )
      ( MAKE-4CRATE-VERIFY ?auto_26982 ?auto_26983 ?auto_26984 ?auto_26985 ?auto_26986 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26996 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26998 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_27000 - SURFACE
      ?auto_27001 - SURFACE
    )
    :vars
    (
      ?auto_27009 - HOIST
      ?auto_27010 - PLACE
      ?auto_27006 - PLACE
      ?auto_27007 - HOIST
      ?auto_27005 - SURFACE
      ?auto_27003 - PLACE
      ?auto_27002 - HOIST
      ?auto_27004 - SURFACE
      ?auto_27008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27009 ?auto_27010 ) ( IS-CRATE ?auto_27001 ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_27006 ?auto_27010 ) ) ( HOIST-AT ?auto_27007 ?auto_27006 ) ( not ( = ?auto_27009 ?auto_27007 ) ) ( AVAILABLE ?auto_27007 ) ( SURFACE-AT ?auto_27001 ?auto_27006 ) ( ON ?auto_27001 ?auto_27005 ) ( CLEAR ?auto_27001 ) ( not ( = ?auto_27000 ?auto_27005 ) ) ( not ( = ?auto_27001 ?auto_27005 ) ) ( not ( = ?auto_26999 ?auto_27005 ) ) ( IS-CRATE ?auto_27000 ) ( not ( = ?auto_27003 ?auto_27010 ) ) ( not ( = ?auto_27006 ?auto_27003 ) ) ( HOIST-AT ?auto_27002 ?auto_27003 ) ( not ( = ?auto_27009 ?auto_27002 ) ) ( not ( = ?auto_27007 ?auto_27002 ) ) ( AVAILABLE ?auto_27002 ) ( SURFACE-AT ?auto_27000 ?auto_27003 ) ( ON ?auto_27000 ?auto_27004 ) ( CLEAR ?auto_27000 ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_27005 ?auto_27004 ) ) ( TRUCK-AT ?auto_27008 ?auto_27010 ) ( SURFACE-AT ?auto_26998 ?auto_27010 ) ( CLEAR ?auto_26998 ) ( LIFTING ?auto_27009 ?auto_26999 ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_27000 ?auto_26998 ) ) ( not ( = ?auto_27001 ?auto_26998 ) ) ( not ( = ?auto_27005 ?auto_26998 ) ) ( not ( = ?auto_27004 ?auto_26998 ) ) ( ON ?auto_26997 ?auto_26996 ) ( ON ?auto_26998 ?auto_26997 ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27005 ) ) ( not ( = ?auto_26996 ?auto_27004 ) ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26997 ?auto_26999 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_27001 ) ) ( not ( = ?auto_26997 ?auto_27005 ) ) ( not ( = ?auto_26997 ?auto_27004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26999 ?auto_27000 ?auto_27001 )
      ( MAKE-5CRATE-VERIFY ?auto_26996 ?auto_26997 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27011 - SURFACE
      ?auto_27012 - SURFACE
    )
    :vars
    (
      ?auto_27020 - HOIST
      ?auto_27021 - PLACE
      ?auto_27023 - SURFACE
      ?auto_27017 - PLACE
      ?auto_27018 - HOIST
      ?auto_27016 - SURFACE
      ?auto_27014 - PLACE
      ?auto_27013 - HOIST
      ?auto_27015 - SURFACE
      ?auto_27019 - TRUCK
      ?auto_27022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27020 ?auto_27021 ) ( IS-CRATE ?auto_27012 ) ( not ( = ?auto_27011 ?auto_27012 ) ) ( not ( = ?auto_27023 ?auto_27011 ) ) ( not ( = ?auto_27023 ?auto_27012 ) ) ( not ( = ?auto_27017 ?auto_27021 ) ) ( HOIST-AT ?auto_27018 ?auto_27017 ) ( not ( = ?auto_27020 ?auto_27018 ) ) ( AVAILABLE ?auto_27018 ) ( SURFACE-AT ?auto_27012 ?auto_27017 ) ( ON ?auto_27012 ?auto_27016 ) ( CLEAR ?auto_27012 ) ( not ( = ?auto_27011 ?auto_27016 ) ) ( not ( = ?auto_27012 ?auto_27016 ) ) ( not ( = ?auto_27023 ?auto_27016 ) ) ( IS-CRATE ?auto_27011 ) ( not ( = ?auto_27014 ?auto_27021 ) ) ( not ( = ?auto_27017 ?auto_27014 ) ) ( HOIST-AT ?auto_27013 ?auto_27014 ) ( not ( = ?auto_27020 ?auto_27013 ) ) ( not ( = ?auto_27018 ?auto_27013 ) ) ( AVAILABLE ?auto_27013 ) ( SURFACE-AT ?auto_27011 ?auto_27014 ) ( ON ?auto_27011 ?auto_27015 ) ( CLEAR ?auto_27011 ) ( not ( = ?auto_27011 ?auto_27015 ) ) ( not ( = ?auto_27012 ?auto_27015 ) ) ( not ( = ?auto_27023 ?auto_27015 ) ) ( not ( = ?auto_27016 ?auto_27015 ) ) ( TRUCK-AT ?auto_27019 ?auto_27021 ) ( SURFACE-AT ?auto_27022 ?auto_27021 ) ( CLEAR ?auto_27022 ) ( IS-CRATE ?auto_27023 ) ( not ( = ?auto_27022 ?auto_27023 ) ) ( not ( = ?auto_27011 ?auto_27022 ) ) ( not ( = ?auto_27012 ?auto_27022 ) ) ( not ( = ?auto_27016 ?auto_27022 ) ) ( not ( = ?auto_27015 ?auto_27022 ) ) ( AVAILABLE ?auto_27020 ) ( IN ?auto_27023 ?auto_27019 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27020 ?auto_27023 ?auto_27019 ?auto_27021 )
      ( MAKE-2CRATE ?auto_27023 ?auto_27011 ?auto_27012 )
      ( MAKE-1CRATE-VERIFY ?auto_27011 ?auto_27012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27024 - SURFACE
      ?auto_27025 - SURFACE
      ?auto_27026 - SURFACE
    )
    :vars
    (
      ?auto_27032 - HOIST
      ?auto_27035 - PLACE
      ?auto_27031 - PLACE
      ?auto_27034 - HOIST
      ?auto_27029 - SURFACE
      ?auto_27030 - PLACE
      ?auto_27028 - HOIST
      ?auto_27027 - SURFACE
      ?auto_27036 - TRUCK
      ?auto_27033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27032 ?auto_27035 ) ( IS-CRATE ?auto_27026 ) ( not ( = ?auto_27025 ?auto_27026 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27026 ) ) ( not ( = ?auto_27031 ?auto_27035 ) ) ( HOIST-AT ?auto_27034 ?auto_27031 ) ( not ( = ?auto_27032 ?auto_27034 ) ) ( AVAILABLE ?auto_27034 ) ( SURFACE-AT ?auto_27026 ?auto_27031 ) ( ON ?auto_27026 ?auto_27029 ) ( CLEAR ?auto_27026 ) ( not ( = ?auto_27025 ?auto_27029 ) ) ( not ( = ?auto_27026 ?auto_27029 ) ) ( not ( = ?auto_27024 ?auto_27029 ) ) ( IS-CRATE ?auto_27025 ) ( not ( = ?auto_27030 ?auto_27035 ) ) ( not ( = ?auto_27031 ?auto_27030 ) ) ( HOIST-AT ?auto_27028 ?auto_27030 ) ( not ( = ?auto_27032 ?auto_27028 ) ) ( not ( = ?auto_27034 ?auto_27028 ) ) ( AVAILABLE ?auto_27028 ) ( SURFACE-AT ?auto_27025 ?auto_27030 ) ( ON ?auto_27025 ?auto_27027 ) ( CLEAR ?auto_27025 ) ( not ( = ?auto_27025 ?auto_27027 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) ( not ( = ?auto_27024 ?auto_27027 ) ) ( not ( = ?auto_27029 ?auto_27027 ) ) ( TRUCK-AT ?auto_27036 ?auto_27035 ) ( SURFACE-AT ?auto_27033 ?auto_27035 ) ( CLEAR ?auto_27033 ) ( IS-CRATE ?auto_27024 ) ( not ( = ?auto_27033 ?auto_27024 ) ) ( not ( = ?auto_27025 ?auto_27033 ) ) ( not ( = ?auto_27026 ?auto_27033 ) ) ( not ( = ?auto_27029 ?auto_27033 ) ) ( not ( = ?auto_27027 ?auto_27033 ) ) ( AVAILABLE ?auto_27032 ) ( IN ?auto_27024 ?auto_27036 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27025 ?auto_27026 )
      ( MAKE-2CRATE-VERIFY ?auto_27024 ?auto_27025 ?auto_27026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27037 - SURFACE
      ?auto_27038 - SURFACE
      ?auto_27039 - SURFACE
      ?auto_27040 - SURFACE
    )
    :vars
    (
      ?auto_27047 - HOIST
      ?auto_27046 - PLACE
      ?auto_27041 - PLACE
      ?auto_27048 - HOIST
      ?auto_27045 - SURFACE
      ?auto_27042 - PLACE
      ?auto_27043 - HOIST
      ?auto_27049 - SURFACE
      ?auto_27044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27047 ?auto_27046 ) ( IS-CRATE ?auto_27040 ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( not ( = ?auto_27041 ?auto_27046 ) ) ( HOIST-AT ?auto_27048 ?auto_27041 ) ( not ( = ?auto_27047 ?auto_27048 ) ) ( AVAILABLE ?auto_27048 ) ( SURFACE-AT ?auto_27040 ?auto_27041 ) ( ON ?auto_27040 ?auto_27045 ) ( CLEAR ?auto_27040 ) ( not ( = ?auto_27039 ?auto_27045 ) ) ( not ( = ?auto_27040 ?auto_27045 ) ) ( not ( = ?auto_27038 ?auto_27045 ) ) ( IS-CRATE ?auto_27039 ) ( not ( = ?auto_27042 ?auto_27046 ) ) ( not ( = ?auto_27041 ?auto_27042 ) ) ( HOIST-AT ?auto_27043 ?auto_27042 ) ( not ( = ?auto_27047 ?auto_27043 ) ) ( not ( = ?auto_27048 ?auto_27043 ) ) ( AVAILABLE ?auto_27043 ) ( SURFACE-AT ?auto_27039 ?auto_27042 ) ( ON ?auto_27039 ?auto_27049 ) ( CLEAR ?auto_27039 ) ( not ( = ?auto_27039 ?auto_27049 ) ) ( not ( = ?auto_27040 ?auto_27049 ) ) ( not ( = ?auto_27038 ?auto_27049 ) ) ( not ( = ?auto_27045 ?auto_27049 ) ) ( TRUCK-AT ?auto_27044 ?auto_27046 ) ( SURFACE-AT ?auto_27037 ?auto_27046 ) ( CLEAR ?auto_27037 ) ( IS-CRATE ?auto_27038 ) ( not ( = ?auto_27037 ?auto_27038 ) ) ( not ( = ?auto_27039 ?auto_27037 ) ) ( not ( = ?auto_27040 ?auto_27037 ) ) ( not ( = ?auto_27045 ?auto_27037 ) ) ( not ( = ?auto_27049 ?auto_27037 ) ) ( AVAILABLE ?auto_27047 ) ( IN ?auto_27038 ?auto_27044 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27038 ?auto_27039 ?auto_27040 )
      ( MAKE-3CRATE-VERIFY ?auto_27037 ?auto_27038 ?auto_27039 ?auto_27040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27050 - SURFACE
      ?auto_27051 - SURFACE
      ?auto_27052 - SURFACE
      ?auto_27053 - SURFACE
      ?auto_27054 - SURFACE
    )
    :vars
    (
      ?auto_27061 - HOIST
      ?auto_27060 - PLACE
      ?auto_27055 - PLACE
      ?auto_27062 - HOIST
      ?auto_27059 - SURFACE
      ?auto_27056 - PLACE
      ?auto_27057 - HOIST
      ?auto_27063 - SURFACE
      ?auto_27058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27061 ?auto_27060 ) ( IS-CRATE ?auto_27054 ) ( not ( = ?auto_27053 ?auto_27054 ) ) ( not ( = ?auto_27052 ?auto_27053 ) ) ( not ( = ?auto_27052 ?auto_27054 ) ) ( not ( = ?auto_27055 ?auto_27060 ) ) ( HOIST-AT ?auto_27062 ?auto_27055 ) ( not ( = ?auto_27061 ?auto_27062 ) ) ( AVAILABLE ?auto_27062 ) ( SURFACE-AT ?auto_27054 ?auto_27055 ) ( ON ?auto_27054 ?auto_27059 ) ( CLEAR ?auto_27054 ) ( not ( = ?auto_27053 ?auto_27059 ) ) ( not ( = ?auto_27054 ?auto_27059 ) ) ( not ( = ?auto_27052 ?auto_27059 ) ) ( IS-CRATE ?auto_27053 ) ( not ( = ?auto_27056 ?auto_27060 ) ) ( not ( = ?auto_27055 ?auto_27056 ) ) ( HOIST-AT ?auto_27057 ?auto_27056 ) ( not ( = ?auto_27061 ?auto_27057 ) ) ( not ( = ?auto_27062 ?auto_27057 ) ) ( AVAILABLE ?auto_27057 ) ( SURFACE-AT ?auto_27053 ?auto_27056 ) ( ON ?auto_27053 ?auto_27063 ) ( CLEAR ?auto_27053 ) ( not ( = ?auto_27053 ?auto_27063 ) ) ( not ( = ?auto_27054 ?auto_27063 ) ) ( not ( = ?auto_27052 ?auto_27063 ) ) ( not ( = ?auto_27059 ?auto_27063 ) ) ( TRUCK-AT ?auto_27058 ?auto_27060 ) ( SURFACE-AT ?auto_27051 ?auto_27060 ) ( CLEAR ?auto_27051 ) ( IS-CRATE ?auto_27052 ) ( not ( = ?auto_27051 ?auto_27052 ) ) ( not ( = ?auto_27053 ?auto_27051 ) ) ( not ( = ?auto_27054 ?auto_27051 ) ) ( not ( = ?auto_27059 ?auto_27051 ) ) ( not ( = ?auto_27063 ?auto_27051 ) ) ( AVAILABLE ?auto_27061 ) ( IN ?auto_27052 ?auto_27058 ) ( ON ?auto_27051 ?auto_27050 ) ( not ( = ?auto_27050 ?auto_27051 ) ) ( not ( = ?auto_27050 ?auto_27052 ) ) ( not ( = ?auto_27050 ?auto_27053 ) ) ( not ( = ?auto_27050 ?auto_27054 ) ) ( not ( = ?auto_27050 ?auto_27059 ) ) ( not ( = ?auto_27050 ?auto_27063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27052 ?auto_27053 ?auto_27054 )
      ( MAKE-4CRATE-VERIFY ?auto_27050 ?auto_27051 ?auto_27052 ?auto_27053 ?auto_27054 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27064 - SURFACE
      ?auto_27065 - SURFACE
      ?auto_27066 - SURFACE
      ?auto_27067 - SURFACE
      ?auto_27068 - SURFACE
      ?auto_27069 - SURFACE
    )
    :vars
    (
      ?auto_27076 - HOIST
      ?auto_27075 - PLACE
      ?auto_27070 - PLACE
      ?auto_27077 - HOIST
      ?auto_27074 - SURFACE
      ?auto_27071 - PLACE
      ?auto_27072 - HOIST
      ?auto_27078 - SURFACE
      ?auto_27073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27076 ?auto_27075 ) ( IS-CRATE ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27069 ) ) ( not ( = ?auto_27067 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27069 ) ) ( not ( = ?auto_27070 ?auto_27075 ) ) ( HOIST-AT ?auto_27077 ?auto_27070 ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( AVAILABLE ?auto_27077 ) ( SURFACE-AT ?auto_27069 ?auto_27070 ) ( ON ?auto_27069 ?auto_27074 ) ( CLEAR ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27074 ) ) ( not ( = ?auto_27069 ?auto_27074 ) ) ( not ( = ?auto_27067 ?auto_27074 ) ) ( IS-CRATE ?auto_27068 ) ( not ( = ?auto_27071 ?auto_27075 ) ) ( not ( = ?auto_27070 ?auto_27071 ) ) ( HOIST-AT ?auto_27072 ?auto_27071 ) ( not ( = ?auto_27076 ?auto_27072 ) ) ( not ( = ?auto_27077 ?auto_27072 ) ) ( AVAILABLE ?auto_27072 ) ( SURFACE-AT ?auto_27068 ?auto_27071 ) ( ON ?auto_27068 ?auto_27078 ) ( CLEAR ?auto_27068 ) ( not ( = ?auto_27068 ?auto_27078 ) ) ( not ( = ?auto_27069 ?auto_27078 ) ) ( not ( = ?auto_27067 ?auto_27078 ) ) ( not ( = ?auto_27074 ?auto_27078 ) ) ( TRUCK-AT ?auto_27073 ?auto_27075 ) ( SURFACE-AT ?auto_27066 ?auto_27075 ) ( CLEAR ?auto_27066 ) ( IS-CRATE ?auto_27067 ) ( not ( = ?auto_27066 ?auto_27067 ) ) ( not ( = ?auto_27068 ?auto_27066 ) ) ( not ( = ?auto_27069 ?auto_27066 ) ) ( not ( = ?auto_27074 ?auto_27066 ) ) ( not ( = ?auto_27078 ?auto_27066 ) ) ( AVAILABLE ?auto_27076 ) ( IN ?auto_27067 ?auto_27073 ) ( ON ?auto_27065 ?auto_27064 ) ( ON ?auto_27066 ?auto_27065 ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27066 ) ) ( not ( = ?auto_27064 ?auto_27067 ) ) ( not ( = ?auto_27064 ?auto_27068 ) ) ( not ( = ?auto_27064 ?auto_27069 ) ) ( not ( = ?auto_27064 ?auto_27074 ) ) ( not ( = ?auto_27064 ?auto_27078 ) ) ( not ( = ?auto_27065 ?auto_27066 ) ) ( not ( = ?auto_27065 ?auto_27067 ) ) ( not ( = ?auto_27065 ?auto_27068 ) ) ( not ( = ?auto_27065 ?auto_27069 ) ) ( not ( = ?auto_27065 ?auto_27074 ) ) ( not ( = ?auto_27065 ?auto_27078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27067 ?auto_27068 ?auto_27069 )
      ( MAKE-5CRATE-VERIFY ?auto_27064 ?auto_27065 ?auto_27066 ?auto_27067 ?auto_27068 ?auto_27069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27079 - SURFACE
      ?auto_27080 - SURFACE
    )
    :vars
    (
      ?auto_27088 - HOIST
      ?auto_27087 - PLACE
      ?auto_27091 - SURFACE
      ?auto_27081 - PLACE
      ?auto_27089 - HOIST
      ?auto_27085 - SURFACE
      ?auto_27082 - PLACE
      ?auto_27083 - HOIST
      ?auto_27090 - SURFACE
      ?auto_27086 - SURFACE
      ?auto_27084 - TRUCK
      ?auto_27092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27088 ?auto_27087 ) ( IS-CRATE ?auto_27080 ) ( not ( = ?auto_27079 ?auto_27080 ) ) ( not ( = ?auto_27091 ?auto_27079 ) ) ( not ( = ?auto_27091 ?auto_27080 ) ) ( not ( = ?auto_27081 ?auto_27087 ) ) ( HOIST-AT ?auto_27089 ?auto_27081 ) ( not ( = ?auto_27088 ?auto_27089 ) ) ( AVAILABLE ?auto_27089 ) ( SURFACE-AT ?auto_27080 ?auto_27081 ) ( ON ?auto_27080 ?auto_27085 ) ( CLEAR ?auto_27080 ) ( not ( = ?auto_27079 ?auto_27085 ) ) ( not ( = ?auto_27080 ?auto_27085 ) ) ( not ( = ?auto_27091 ?auto_27085 ) ) ( IS-CRATE ?auto_27079 ) ( not ( = ?auto_27082 ?auto_27087 ) ) ( not ( = ?auto_27081 ?auto_27082 ) ) ( HOIST-AT ?auto_27083 ?auto_27082 ) ( not ( = ?auto_27088 ?auto_27083 ) ) ( not ( = ?auto_27089 ?auto_27083 ) ) ( AVAILABLE ?auto_27083 ) ( SURFACE-AT ?auto_27079 ?auto_27082 ) ( ON ?auto_27079 ?auto_27090 ) ( CLEAR ?auto_27079 ) ( not ( = ?auto_27079 ?auto_27090 ) ) ( not ( = ?auto_27080 ?auto_27090 ) ) ( not ( = ?auto_27091 ?auto_27090 ) ) ( not ( = ?auto_27085 ?auto_27090 ) ) ( SURFACE-AT ?auto_27086 ?auto_27087 ) ( CLEAR ?auto_27086 ) ( IS-CRATE ?auto_27091 ) ( not ( = ?auto_27086 ?auto_27091 ) ) ( not ( = ?auto_27079 ?auto_27086 ) ) ( not ( = ?auto_27080 ?auto_27086 ) ) ( not ( = ?auto_27085 ?auto_27086 ) ) ( not ( = ?auto_27090 ?auto_27086 ) ) ( AVAILABLE ?auto_27088 ) ( IN ?auto_27091 ?auto_27084 ) ( TRUCK-AT ?auto_27084 ?auto_27092 ) ( not ( = ?auto_27092 ?auto_27087 ) ) ( not ( = ?auto_27081 ?auto_27092 ) ) ( not ( = ?auto_27082 ?auto_27092 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27084 ?auto_27092 ?auto_27087 )
      ( MAKE-2CRATE ?auto_27091 ?auto_27079 ?auto_27080 )
      ( MAKE-1CRATE-VERIFY ?auto_27079 ?auto_27080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27093 - SURFACE
      ?auto_27094 - SURFACE
      ?auto_27095 - SURFACE
    )
    :vars
    (
      ?auto_27102 - HOIST
      ?auto_27097 - PLACE
      ?auto_27101 - PLACE
      ?auto_27096 - HOIST
      ?auto_27105 - SURFACE
      ?auto_27098 - PLACE
      ?auto_27099 - HOIST
      ?auto_27106 - SURFACE
      ?auto_27104 - SURFACE
      ?auto_27100 - TRUCK
      ?auto_27103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27102 ?auto_27097 ) ( IS-CRATE ?auto_27095 ) ( not ( = ?auto_27094 ?auto_27095 ) ) ( not ( = ?auto_27093 ?auto_27094 ) ) ( not ( = ?auto_27093 ?auto_27095 ) ) ( not ( = ?auto_27101 ?auto_27097 ) ) ( HOIST-AT ?auto_27096 ?auto_27101 ) ( not ( = ?auto_27102 ?auto_27096 ) ) ( AVAILABLE ?auto_27096 ) ( SURFACE-AT ?auto_27095 ?auto_27101 ) ( ON ?auto_27095 ?auto_27105 ) ( CLEAR ?auto_27095 ) ( not ( = ?auto_27094 ?auto_27105 ) ) ( not ( = ?auto_27095 ?auto_27105 ) ) ( not ( = ?auto_27093 ?auto_27105 ) ) ( IS-CRATE ?auto_27094 ) ( not ( = ?auto_27098 ?auto_27097 ) ) ( not ( = ?auto_27101 ?auto_27098 ) ) ( HOIST-AT ?auto_27099 ?auto_27098 ) ( not ( = ?auto_27102 ?auto_27099 ) ) ( not ( = ?auto_27096 ?auto_27099 ) ) ( AVAILABLE ?auto_27099 ) ( SURFACE-AT ?auto_27094 ?auto_27098 ) ( ON ?auto_27094 ?auto_27106 ) ( CLEAR ?auto_27094 ) ( not ( = ?auto_27094 ?auto_27106 ) ) ( not ( = ?auto_27095 ?auto_27106 ) ) ( not ( = ?auto_27093 ?auto_27106 ) ) ( not ( = ?auto_27105 ?auto_27106 ) ) ( SURFACE-AT ?auto_27104 ?auto_27097 ) ( CLEAR ?auto_27104 ) ( IS-CRATE ?auto_27093 ) ( not ( = ?auto_27104 ?auto_27093 ) ) ( not ( = ?auto_27094 ?auto_27104 ) ) ( not ( = ?auto_27095 ?auto_27104 ) ) ( not ( = ?auto_27105 ?auto_27104 ) ) ( not ( = ?auto_27106 ?auto_27104 ) ) ( AVAILABLE ?auto_27102 ) ( IN ?auto_27093 ?auto_27100 ) ( TRUCK-AT ?auto_27100 ?auto_27103 ) ( not ( = ?auto_27103 ?auto_27097 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( not ( = ?auto_27098 ?auto_27103 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27094 ?auto_27095 )
      ( MAKE-2CRATE-VERIFY ?auto_27093 ?auto_27094 ?auto_27095 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27107 - SURFACE
      ?auto_27108 - SURFACE
      ?auto_27109 - SURFACE
      ?auto_27110 - SURFACE
    )
    :vars
    (
      ?auto_27115 - HOIST
      ?auto_27116 - PLACE
      ?auto_27117 - PLACE
      ?auto_27114 - HOIST
      ?auto_27119 - SURFACE
      ?auto_27112 - PLACE
      ?auto_27120 - HOIST
      ?auto_27111 - SURFACE
      ?auto_27113 - TRUCK
      ?auto_27118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27115 ?auto_27116 ) ( IS-CRATE ?auto_27110 ) ( not ( = ?auto_27109 ?auto_27110 ) ) ( not ( = ?auto_27108 ?auto_27109 ) ) ( not ( = ?auto_27108 ?auto_27110 ) ) ( not ( = ?auto_27117 ?auto_27116 ) ) ( HOIST-AT ?auto_27114 ?auto_27117 ) ( not ( = ?auto_27115 ?auto_27114 ) ) ( AVAILABLE ?auto_27114 ) ( SURFACE-AT ?auto_27110 ?auto_27117 ) ( ON ?auto_27110 ?auto_27119 ) ( CLEAR ?auto_27110 ) ( not ( = ?auto_27109 ?auto_27119 ) ) ( not ( = ?auto_27110 ?auto_27119 ) ) ( not ( = ?auto_27108 ?auto_27119 ) ) ( IS-CRATE ?auto_27109 ) ( not ( = ?auto_27112 ?auto_27116 ) ) ( not ( = ?auto_27117 ?auto_27112 ) ) ( HOIST-AT ?auto_27120 ?auto_27112 ) ( not ( = ?auto_27115 ?auto_27120 ) ) ( not ( = ?auto_27114 ?auto_27120 ) ) ( AVAILABLE ?auto_27120 ) ( SURFACE-AT ?auto_27109 ?auto_27112 ) ( ON ?auto_27109 ?auto_27111 ) ( CLEAR ?auto_27109 ) ( not ( = ?auto_27109 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27108 ?auto_27111 ) ) ( not ( = ?auto_27119 ?auto_27111 ) ) ( SURFACE-AT ?auto_27107 ?auto_27116 ) ( CLEAR ?auto_27107 ) ( IS-CRATE ?auto_27108 ) ( not ( = ?auto_27107 ?auto_27108 ) ) ( not ( = ?auto_27109 ?auto_27107 ) ) ( not ( = ?auto_27110 ?auto_27107 ) ) ( not ( = ?auto_27119 ?auto_27107 ) ) ( not ( = ?auto_27111 ?auto_27107 ) ) ( AVAILABLE ?auto_27115 ) ( IN ?auto_27108 ?auto_27113 ) ( TRUCK-AT ?auto_27113 ?auto_27118 ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( not ( = ?auto_27117 ?auto_27118 ) ) ( not ( = ?auto_27112 ?auto_27118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27108 ?auto_27109 ?auto_27110 )
      ( MAKE-3CRATE-VERIFY ?auto_27107 ?auto_27108 ?auto_27109 ?auto_27110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27121 - SURFACE
      ?auto_27122 - SURFACE
      ?auto_27123 - SURFACE
      ?auto_27124 - SURFACE
      ?auto_27125 - SURFACE
    )
    :vars
    (
      ?auto_27130 - HOIST
      ?auto_27131 - PLACE
      ?auto_27132 - PLACE
      ?auto_27129 - HOIST
      ?auto_27134 - SURFACE
      ?auto_27127 - PLACE
      ?auto_27135 - HOIST
      ?auto_27126 - SURFACE
      ?auto_27128 - TRUCK
      ?auto_27133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27130 ?auto_27131 ) ( IS-CRATE ?auto_27125 ) ( not ( = ?auto_27124 ?auto_27125 ) ) ( not ( = ?auto_27123 ?auto_27124 ) ) ( not ( = ?auto_27123 ?auto_27125 ) ) ( not ( = ?auto_27132 ?auto_27131 ) ) ( HOIST-AT ?auto_27129 ?auto_27132 ) ( not ( = ?auto_27130 ?auto_27129 ) ) ( AVAILABLE ?auto_27129 ) ( SURFACE-AT ?auto_27125 ?auto_27132 ) ( ON ?auto_27125 ?auto_27134 ) ( CLEAR ?auto_27125 ) ( not ( = ?auto_27124 ?auto_27134 ) ) ( not ( = ?auto_27125 ?auto_27134 ) ) ( not ( = ?auto_27123 ?auto_27134 ) ) ( IS-CRATE ?auto_27124 ) ( not ( = ?auto_27127 ?auto_27131 ) ) ( not ( = ?auto_27132 ?auto_27127 ) ) ( HOIST-AT ?auto_27135 ?auto_27127 ) ( not ( = ?auto_27130 ?auto_27135 ) ) ( not ( = ?auto_27129 ?auto_27135 ) ) ( AVAILABLE ?auto_27135 ) ( SURFACE-AT ?auto_27124 ?auto_27127 ) ( ON ?auto_27124 ?auto_27126 ) ( CLEAR ?auto_27124 ) ( not ( = ?auto_27124 ?auto_27126 ) ) ( not ( = ?auto_27125 ?auto_27126 ) ) ( not ( = ?auto_27123 ?auto_27126 ) ) ( not ( = ?auto_27134 ?auto_27126 ) ) ( SURFACE-AT ?auto_27122 ?auto_27131 ) ( CLEAR ?auto_27122 ) ( IS-CRATE ?auto_27123 ) ( not ( = ?auto_27122 ?auto_27123 ) ) ( not ( = ?auto_27124 ?auto_27122 ) ) ( not ( = ?auto_27125 ?auto_27122 ) ) ( not ( = ?auto_27134 ?auto_27122 ) ) ( not ( = ?auto_27126 ?auto_27122 ) ) ( AVAILABLE ?auto_27130 ) ( IN ?auto_27123 ?auto_27128 ) ( TRUCK-AT ?auto_27128 ?auto_27133 ) ( not ( = ?auto_27133 ?auto_27131 ) ) ( not ( = ?auto_27132 ?auto_27133 ) ) ( not ( = ?auto_27127 ?auto_27133 ) ) ( ON ?auto_27122 ?auto_27121 ) ( not ( = ?auto_27121 ?auto_27122 ) ) ( not ( = ?auto_27121 ?auto_27123 ) ) ( not ( = ?auto_27121 ?auto_27124 ) ) ( not ( = ?auto_27121 ?auto_27125 ) ) ( not ( = ?auto_27121 ?auto_27134 ) ) ( not ( = ?auto_27121 ?auto_27126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27123 ?auto_27124 ?auto_27125 )
      ( MAKE-4CRATE-VERIFY ?auto_27121 ?auto_27122 ?auto_27123 ?auto_27124 ?auto_27125 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27136 - SURFACE
      ?auto_27137 - SURFACE
      ?auto_27138 - SURFACE
      ?auto_27139 - SURFACE
      ?auto_27140 - SURFACE
      ?auto_27141 - SURFACE
    )
    :vars
    (
      ?auto_27146 - HOIST
      ?auto_27147 - PLACE
      ?auto_27148 - PLACE
      ?auto_27145 - HOIST
      ?auto_27150 - SURFACE
      ?auto_27143 - PLACE
      ?auto_27151 - HOIST
      ?auto_27142 - SURFACE
      ?auto_27144 - TRUCK
      ?auto_27149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27146 ?auto_27147 ) ( IS-CRATE ?auto_27141 ) ( not ( = ?auto_27140 ?auto_27141 ) ) ( not ( = ?auto_27139 ?auto_27140 ) ) ( not ( = ?auto_27139 ?auto_27141 ) ) ( not ( = ?auto_27148 ?auto_27147 ) ) ( HOIST-AT ?auto_27145 ?auto_27148 ) ( not ( = ?auto_27146 ?auto_27145 ) ) ( AVAILABLE ?auto_27145 ) ( SURFACE-AT ?auto_27141 ?auto_27148 ) ( ON ?auto_27141 ?auto_27150 ) ( CLEAR ?auto_27141 ) ( not ( = ?auto_27140 ?auto_27150 ) ) ( not ( = ?auto_27141 ?auto_27150 ) ) ( not ( = ?auto_27139 ?auto_27150 ) ) ( IS-CRATE ?auto_27140 ) ( not ( = ?auto_27143 ?auto_27147 ) ) ( not ( = ?auto_27148 ?auto_27143 ) ) ( HOIST-AT ?auto_27151 ?auto_27143 ) ( not ( = ?auto_27146 ?auto_27151 ) ) ( not ( = ?auto_27145 ?auto_27151 ) ) ( AVAILABLE ?auto_27151 ) ( SURFACE-AT ?auto_27140 ?auto_27143 ) ( ON ?auto_27140 ?auto_27142 ) ( CLEAR ?auto_27140 ) ( not ( = ?auto_27140 ?auto_27142 ) ) ( not ( = ?auto_27141 ?auto_27142 ) ) ( not ( = ?auto_27139 ?auto_27142 ) ) ( not ( = ?auto_27150 ?auto_27142 ) ) ( SURFACE-AT ?auto_27138 ?auto_27147 ) ( CLEAR ?auto_27138 ) ( IS-CRATE ?auto_27139 ) ( not ( = ?auto_27138 ?auto_27139 ) ) ( not ( = ?auto_27140 ?auto_27138 ) ) ( not ( = ?auto_27141 ?auto_27138 ) ) ( not ( = ?auto_27150 ?auto_27138 ) ) ( not ( = ?auto_27142 ?auto_27138 ) ) ( AVAILABLE ?auto_27146 ) ( IN ?auto_27139 ?auto_27144 ) ( TRUCK-AT ?auto_27144 ?auto_27149 ) ( not ( = ?auto_27149 ?auto_27147 ) ) ( not ( = ?auto_27148 ?auto_27149 ) ) ( not ( = ?auto_27143 ?auto_27149 ) ) ( ON ?auto_27137 ?auto_27136 ) ( ON ?auto_27138 ?auto_27137 ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( not ( = ?auto_27136 ?auto_27138 ) ) ( not ( = ?auto_27136 ?auto_27139 ) ) ( not ( = ?auto_27136 ?auto_27140 ) ) ( not ( = ?auto_27136 ?auto_27141 ) ) ( not ( = ?auto_27136 ?auto_27150 ) ) ( not ( = ?auto_27136 ?auto_27142 ) ) ( not ( = ?auto_27137 ?auto_27138 ) ) ( not ( = ?auto_27137 ?auto_27139 ) ) ( not ( = ?auto_27137 ?auto_27140 ) ) ( not ( = ?auto_27137 ?auto_27141 ) ) ( not ( = ?auto_27137 ?auto_27150 ) ) ( not ( = ?auto_27137 ?auto_27142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27139 ?auto_27140 ?auto_27141 )
      ( MAKE-5CRATE-VERIFY ?auto_27136 ?auto_27137 ?auto_27138 ?auto_27139 ?auto_27140 ?auto_27141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27152 - SURFACE
      ?auto_27153 - SURFACE
    )
    :vars
    (
      ?auto_27160 - HOIST
      ?auto_27161 - PLACE
      ?auto_27158 - SURFACE
      ?auto_27162 - PLACE
      ?auto_27159 - HOIST
      ?auto_27164 - SURFACE
      ?auto_27155 - PLACE
      ?auto_27165 - HOIST
      ?auto_27154 - SURFACE
      ?auto_27156 - SURFACE
      ?auto_27157 - TRUCK
      ?auto_27163 - PLACE
      ?auto_27166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27160 ?auto_27161 ) ( IS-CRATE ?auto_27153 ) ( not ( = ?auto_27152 ?auto_27153 ) ) ( not ( = ?auto_27158 ?auto_27152 ) ) ( not ( = ?auto_27158 ?auto_27153 ) ) ( not ( = ?auto_27162 ?auto_27161 ) ) ( HOIST-AT ?auto_27159 ?auto_27162 ) ( not ( = ?auto_27160 ?auto_27159 ) ) ( AVAILABLE ?auto_27159 ) ( SURFACE-AT ?auto_27153 ?auto_27162 ) ( ON ?auto_27153 ?auto_27164 ) ( CLEAR ?auto_27153 ) ( not ( = ?auto_27152 ?auto_27164 ) ) ( not ( = ?auto_27153 ?auto_27164 ) ) ( not ( = ?auto_27158 ?auto_27164 ) ) ( IS-CRATE ?auto_27152 ) ( not ( = ?auto_27155 ?auto_27161 ) ) ( not ( = ?auto_27162 ?auto_27155 ) ) ( HOIST-AT ?auto_27165 ?auto_27155 ) ( not ( = ?auto_27160 ?auto_27165 ) ) ( not ( = ?auto_27159 ?auto_27165 ) ) ( AVAILABLE ?auto_27165 ) ( SURFACE-AT ?auto_27152 ?auto_27155 ) ( ON ?auto_27152 ?auto_27154 ) ( CLEAR ?auto_27152 ) ( not ( = ?auto_27152 ?auto_27154 ) ) ( not ( = ?auto_27153 ?auto_27154 ) ) ( not ( = ?auto_27158 ?auto_27154 ) ) ( not ( = ?auto_27164 ?auto_27154 ) ) ( SURFACE-AT ?auto_27156 ?auto_27161 ) ( CLEAR ?auto_27156 ) ( IS-CRATE ?auto_27158 ) ( not ( = ?auto_27156 ?auto_27158 ) ) ( not ( = ?auto_27152 ?auto_27156 ) ) ( not ( = ?auto_27153 ?auto_27156 ) ) ( not ( = ?auto_27164 ?auto_27156 ) ) ( not ( = ?auto_27154 ?auto_27156 ) ) ( AVAILABLE ?auto_27160 ) ( TRUCK-AT ?auto_27157 ?auto_27163 ) ( not ( = ?auto_27163 ?auto_27161 ) ) ( not ( = ?auto_27162 ?auto_27163 ) ) ( not ( = ?auto_27155 ?auto_27163 ) ) ( HOIST-AT ?auto_27166 ?auto_27163 ) ( LIFTING ?auto_27166 ?auto_27158 ) ( not ( = ?auto_27160 ?auto_27166 ) ) ( not ( = ?auto_27159 ?auto_27166 ) ) ( not ( = ?auto_27165 ?auto_27166 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27166 ?auto_27158 ?auto_27157 ?auto_27163 )
      ( MAKE-2CRATE ?auto_27158 ?auto_27152 ?auto_27153 )
      ( MAKE-1CRATE-VERIFY ?auto_27152 ?auto_27153 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27167 - SURFACE
      ?auto_27168 - SURFACE
      ?auto_27169 - SURFACE
    )
    :vars
    (
      ?auto_27174 - HOIST
      ?auto_27175 - PLACE
      ?auto_27178 - PLACE
      ?auto_27170 - HOIST
      ?auto_27181 - SURFACE
      ?auto_27173 - PLACE
      ?auto_27176 - HOIST
      ?auto_27179 - SURFACE
      ?auto_27172 - SURFACE
      ?auto_27177 - TRUCK
      ?auto_27180 - PLACE
      ?auto_27171 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27174 ?auto_27175 ) ( IS-CRATE ?auto_27169 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27167 ?auto_27168 ) ) ( not ( = ?auto_27167 ?auto_27169 ) ) ( not ( = ?auto_27178 ?auto_27175 ) ) ( HOIST-AT ?auto_27170 ?auto_27178 ) ( not ( = ?auto_27174 ?auto_27170 ) ) ( AVAILABLE ?auto_27170 ) ( SURFACE-AT ?auto_27169 ?auto_27178 ) ( ON ?auto_27169 ?auto_27181 ) ( CLEAR ?auto_27169 ) ( not ( = ?auto_27168 ?auto_27181 ) ) ( not ( = ?auto_27169 ?auto_27181 ) ) ( not ( = ?auto_27167 ?auto_27181 ) ) ( IS-CRATE ?auto_27168 ) ( not ( = ?auto_27173 ?auto_27175 ) ) ( not ( = ?auto_27178 ?auto_27173 ) ) ( HOIST-AT ?auto_27176 ?auto_27173 ) ( not ( = ?auto_27174 ?auto_27176 ) ) ( not ( = ?auto_27170 ?auto_27176 ) ) ( AVAILABLE ?auto_27176 ) ( SURFACE-AT ?auto_27168 ?auto_27173 ) ( ON ?auto_27168 ?auto_27179 ) ( CLEAR ?auto_27168 ) ( not ( = ?auto_27168 ?auto_27179 ) ) ( not ( = ?auto_27169 ?auto_27179 ) ) ( not ( = ?auto_27167 ?auto_27179 ) ) ( not ( = ?auto_27181 ?auto_27179 ) ) ( SURFACE-AT ?auto_27172 ?auto_27175 ) ( CLEAR ?auto_27172 ) ( IS-CRATE ?auto_27167 ) ( not ( = ?auto_27172 ?auto_27167 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27181 ?auto_27172 ) ) ( not ( = ?auto_27179 ?auto_27172 ) ) ( AVAILABLE ?auto_27174 ) ( TRUCK-AT ?auto_27177 ?auto_27180 ) ( not ( = ?auto_27180 ?auto_27175 ) ) ( not ( = ?auto_27178 ?auto_27180 ) ) ( not ( = ?auto_27173 ?auto_27180 ) ) ( HOIST-AT ?auto_27171 ?auto_27180 ) ( LIFTING ?auto_27171 ?auto_27167 ) ( not ( = ?auto_27174 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27171 ) ) ( not ( = ?auto_27176 ?auto_27171 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27168 ?auto_27169 )
      ( MAKE-2CRATE-VERIFY ?auto_27167 ?auto_27168 ?auto_27169 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27182 - SURFACE
      ?auto_27183 - SURFACE
      ?auto_27184 - SURFACE
      ?auto_27185 - SURFACE
    )
    :vars
    (
      ?auto_27186 - HOIST
      ?auto_27192 - PLACE
      ?auto_27194 - PLACE
      ?auto_27190 - HOIST
      ?auto_27196 - SURFACE
      ?auto_27189 - PLACE
      ?auto_27193 - HOIST
      ?auto_27188 - SURFACE
      ?auto_27191 - TRUCK
      ?auto_27187 - PLACE
      ?auto_27195 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27186 ?auto_27192 ) ( IS-CRATE ?auto_27185 ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27183 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27185 ) ) ( not ( = ?auto_27194 ?auto_27192 ) ) ( HOIST-AT ?auto_27190 ?auto_27194 ) ( not ( = ?auto_27186 ?auto_27190 ) ) ( AVAILABLE ?auto_27190 ) ( SURFACE-AT ?auto_27185 ?auto_27194 ) ( ON ?auto_27185 ?auto_27196 ) ( CLEAR ?auto_27185 ) ( not ( = ?auto_27184 ?auto_27196 ) ) ( not ( = ?auto_27185 ?auto_27196 ) ) ( not ( = ?auto_27183 ?auto_27196 ) ) ( IS-CRATE ?auto_27184 ) ( not ( = ?auto_27189 ?auto_27192 ) ) ( not ( = ?auto_27194 ?auto_27189 ) ) ( HOIST-AT ?auto_27193 ?auto_27189 ) ( not ( = ?auto_27186 ?auto_27193 ) ) ( not ( = ?auto_27190 ?auto_27193 ) ) ( AVAILABLE ?auto_27193 ) ( SURFACE-AT ?auto_27184 ?auto_27189 ) ( ON ?auto_27184 ?auto_27188 ) ( CLEAR ?auto_27184 ) ( not ( = ?auto_27184 ?auto_27188 ) ) ( not ( = ?auto_27185 ?auto_27188 ) ) ( not ( = ?auto_27183 ?auto_27188 ) ) ( not ( = ?auto_27196 ?auto_27188 ) ) ( SURFACE-AT ?auto_27182 ?auto_27192 ) ( CLEAR ?auto_27182 ) ( IS-CRATE ?auto_27183 ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( not ( = ?auto_27184 ?auto_27182 ) ) ( not ( = ?auto_27185 ?auto_27182 ) ) ( not ( = ?auto_27196 ?auto_27182 ) ) ( not ( = ?auto_27188 ?auto_27182 ) ) ( AVAILABLE ?auto_27186 ) ( TRUCK-AT ?auto_27191 ?auto_27187 ) ( not ( = ?auto_27187 ?auto_27192 ) ) ( not ( = ?auto_27194 ?auto_27187 ) ) ( not ( = ?auto_27189 ?auto_27187 ) ) ( HOIST-AT ?auto_27195 ?auto_27187 ) ( LIFTING ?auto_27195 ?auto_27183 ) ( not ( = ?auto_27186 ?auto_27195 ) ) ( not ( = ?auto_27190 ?auto_27195 ) ) ( not ( = ?auto_27193 ?auto_27195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27183 ?auto_27184 ?auto_27185 )
      ( MAKE-3CRATE-VERIFY ?auto_27182 ?auto_27183 ?auto_27184 ?auto_27185 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27197 - SURFACE
      ?auto_27198 - SURFACE
      ?auto_27199 - SURFACE
      ?auto_27200 - SURFACE
      ?auto_27201 - SURFACE
    )
    :vars
    (
      ?auto_27202 - HOIST
      ?auto_27208 - PLACE
      ?auto_27210 - PLACE
      ?auto_27206 - HOIST
      ?auto_27212 - SURFACE
      ?auto_27205 - PLACE
      ?auto_27209 - HOIST
      ?auto_27204 - SURFACE
      ?auto_27207 - TRUCK
      ?auto_27203 - PLACE
      ?auto_27211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27202 ?auto_27208 ) ( IS-CRATE ?auto_27201 ) ( not ( = ?auto_27200 ?auto_27201 ) ) ( not ( = ?auto_27199 ?auto_27200 ) ) ( not ( = ?auto_27199 ?auto_27201 ) ) ( not ( = ?auto_27210 ?auto_27208 ) ) ( HOIST-AT ?auto_27206 ?auto_27210 ) ( not ( = ?auto_27202 ?auto_27206 ) ) ( AVAILABLE ?auto_27206 ) ( SURFACE-AT ?auto_27201 ?auto_27210 ) ( ON ?auto_27201 ?auto_27212 ) ( CLEAR ?auto_27201 ) ( not ( = ?auto_27200 ?auto_27212 ) ) ( not ( = ?auto_27201 ?auto_27212 ) ) ( not ( = ?auto_27199 ?auto_27212 ) ) ( IS-CRATE ?auto_27200 ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27210 ?auto_27205 ) ) ( HOIST-AT ?auto_27209 ?auto_27205 ) ( not ( = ?auto_27202 ?auto_27209 ) ) ( not ( = ?auto_27206 ?auto_27209 ) ) ( AVAILABLE ?auto_27209 ) ( SURFACE-AT ?auto_27200 ?auto_27205 ) ( ON ?auto_27200 ?auto_27204 ) ( CLEAR ?auto_27200 ) ( not ( = ?auto_27200 ?auto_27204 ) ) ( not ( = ?auto_27201 ?auto_27204 ) ) ( not ( = ?auto_27199 ?auto_27204 ) ) ( not ( = ?auto_27212 ?auto_27204 ) ) ( SURFACE-AT ?auto_27198 ?auto_27208 ) ( CLEAR ?auto_27198 ) ( IS-CRATE ?auto_27199 ) ( not ( = ?auto_27198 ?auto_27199 ) ) ( not ( = ?auto_27200 ?auto_27198 ) ) ( not ( = ?auto_27201 ?auto_27198 ) ) ( not ( = ?auto_27212 ?auto_27198 ) ) ( not ( = ?auto_27204 ?auto_27198 ) ) ( AVAILABLE ?auto_27202 ) ( TRUCK-AT ?auto_27207 ?auto_27203 ) ( not ( = ?auto_27203 ?auto_27208 ) ) ( not ( = ?auto_27210 ?auto_27203 ) ) ( not ( = ?auto_27205 ?auto_27203 ) ) ( HOIST-AT ?auto_27211 ?auto_27203 ) ( LIFTING ?auto_27211 ?auto_27199 ) ( not ( = ?auto_27202 ?auto_27211 ) ) ( not ( = ?auto_27206 ?auto_27211 ) ) ( not ( = ?auto_27209 ?auto_27211 ) ) ( ON ?auto_27198 ?auto_27197 ) ( not ( = ?auto_27197 ?auto_27198 ) ) ( not ( = ?auto_27197 ?auto_27199 ) ) ( not ( = ?auto_27197 ?auto_27200 ) ) ( not ( = ?auto_27197 ?auto_27201 ) ) ( not ( = ?auto_27197 ?auto_27212 ) ) ( not ( = ?auto_27197 ?auto_27204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27199 ?auto_27200 ?auto_27201 )
      ( MAKE-4CRATE-VERIFY ?auto_27197 ?auto_27198 ?auto_27199 ?auto_27200 ?auto_27201 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27213 - SURFACE
      ?auto_27214 - SURFACE
      ?auto_27215 - SURFACE
      ?auto_27216 - SURFACE
      ?auto_27217 - SURFACE
      ?auto_27218 - SURFACE
    )
    :vars
    (
      ?auto_27219 - HOIST
      ?auto_27225 - PLACE
      ?auto_27227 - PLACE
      ?auto_27223 - HOIST
      ?auto_27229 - SURFACE
      ?auto_27222 - PLACE
      ?auto_27226 - HOIST
      ?auto_27221 - SURFACE
      ?auto_27224 - TRUCK
      ?auto_27220 - PLACE
      ?auto_27228 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27219 ?auto_27225 ) ( IS-CRATE ?auto_27218 ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( not ( = ?auto_27216 ?auto_27217 ) ) ( not ( = ?auto_27216 ?auto_27218 ) ) ( not ( = ?auto_27227 ?auto_27225 ) ) ( HOIST-AT ?auto_27223 ?auto_27227 ) ( not ( = ?auto_27219 ?auto_27223 ) ) ( AVAILABLE ?auto_27223 ) ( SURFACE-AT ?auto_27218 ?auto_27227 ) ( ON ?auto_27218 ?auto_27229 ) ( CLEAR ?auto_27218 ) ( not ( = ?auto_27217 ?auto_27229 ) ) ( not ( = ?auto_27218 ?auto_27229 ) ) ( not ( = ?auto_27216 ?auto_27229 ) ) ( IS-CRATE ?auto_27217 ) ( not ( = ?auto_27222 ?auto_27225 ) ) ( not ( = ?auto_27227 ?auto_27222 ) ) ( HOIST-AT ?auto_27226 ?auto_27222 ) ( not ( = ?auto_27219 ?auto_27226 ) ) ( not ( = ?auto_27223 ?auto_27226 ) ) ( AVAILABLE ?auto_27226 ) ( SURFACE-AT ?auto_27217 ?auto_27222 ) ( ON ?auto_27217 ?auto_27221 ) ( CLEAR ?auto_27217 ) ( not ( = ?auto_27217 ?auto_27221 ) ) ( not ( = ?auto_27218 ?auto_27221 ) ) ( not ( = ?auto_27216 ?auto_27221 ) ) ( not ( = ?auto_27229 ?auto_27221 ) ) ( SURFACE-AT ?auto_27215 ?auto_27225 ) ( CLEAR ?auto_27215 ) ( IS-CRATE ?auto_27216 ) ( not ( = ?auto_27215 ?auto_27216 ) ) ( not ( = ?auto_27217 ?auto_27215 ) ) ( not ( = ?auto_27218 ?auto_27215 ) ) ( not ( = ?auto_27229 ?auto_27215 ) ) ( not ( = ?auto_27221 ?auto_27215 ) ) ( AVAILABLE ?auto_27219 ) ( TRUCK-AT ?auto_27224 ?auto_27220 ) ( not ( = ?auto_27220 ?auto_27225 ) ) ( not ( = ?auto_27227 ?auto_27220 ) ) ( not ( = ?auto_27222 ?auto_27220 ) ) ( HOIST-AT ?auto_27228 ?auto_27220 ) ( LIFTING ?auto_27228 ?auto_27216 ) ( not ( = ?auto_27219 ?auto_27228 ) ) ( not ( = ?auto_27223 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( ON ?auto_27214 ?auto_27213 ) ( ON ?auto_27215 ?auto_27214 ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( not ( = ?auto_27213 ?auto_27215 ) ) ( not ( = ?auto_27213 ?auto_27216 ) ) ( not ( = ?auto_27213 ?auto_27217 ) ) ( not ( = ?auto_27213 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27229 ) ) ( not ( = ?auto_27213 ?auto_27221 ) ) ( not ( = ?auto_27214 ?auto_27215 ) ) ( not ( = ?auto_27214 ?auto_27216 ) ) ( not ( = ?auto_27214 ?auto_27217 ) ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27229 ) ) ( not ( = ?auto_27214 ?auto_27221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27216 ?auto_27217 ?auto_27218 )
      ( MAKE-5CRATE-VERIFY ?auto_27213 ?auto_27214 ?auto_27215 ?auto_27216 ?auto_27217 ?auto_27218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27230 - SURFACE
      ?auto_27231 - SURFACE
    )
    :vars
    (
      ?auto_27233 - HOIST
      ?auto_27239 - PLACE
      ?auto_27232 - SURFACE
      ?auto_27242 - PLACE
      ?auto_27237 - HOIST
      ?auto_27244 - SURFACE
      ?auto_27236 - PLACE
      ?auto_27240 - HOIST
      ?auto_27235 - SURFACE
      ?auto_27241 - SURFACE
      ?auto_27238 - TRUCK
      ?auto_27234 - PLACE
      ?auto_27243 - HOIST
      ?auto_27245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27233 ?auto_27239 ) ( IS-CRATE ?auto_27231 ) ( not ( = ?auto_27230 ?auto_27231 ) ) ( not ( = ?auto_27232 ?auto_27230 ) ) ( not ( = ?auto_27232 ?auto_27231 ) ) ( not ( = ?auto_27242 ?auto_27239 ) ) ( HOIST-AT ?auto_27237 ?auto_27242 ) ( not ( = ?auto_27233 ?auto_27237 ) ) ( AVAILABLE ?auto_27237 ) ( SURFACE-AT ?auto_27231 ?auto_27242 ) ( ON ?auto_27231 ?auto_27244 ) ( CLEAR ?auto_27231 ) ( not ( = ?auto_27230 ?auto_27244 ) ) ( not ( = ?auto_27231 ?auto_27244 ) ) ( not ( = ?auto_27232 ?auto_27244 ) ) ( IS-CRATE ?auto_27230 ) ( not ( = ?auto_27236 ?auto_27239 ) ) ( not ( = ?auto_27242 ?auto_27236 ) ) ( HOIST-AT ?auto_27240 ?auto_27236 ) ( not ( = ?auto_27233 ?auto_27240 ) ) ( not ( = ?auto_27237 ?auto_27240 ) ) ( AVAILABLE ?auto_27240 ) ( SURFACE-AT ?auto_27230 ?auto_27236 ) ( ON ?auto_27230 ?auto_27235 ) ( CLEAR ?auto_27230 ) ( not ( = ?auto_27230 ?auto_27235 ) ) ( not ( = ?auto_27231 ?auto_27235 ) ) ( not ( = ?auto_27232 ?auto_27235 ) ) ( not ( = ?auto_27244 ?auto_27235 ) ) ( SURFACE-AT ?auto_27241 ?auto_27239 ) ( CLEAR ?auto_27241 ) ( IS-CRATE ?auto_27232 ) ( not ( = ?auto_27241 ?auto_27232 ) ) ( not ( = ?auto_27230 ?auto_27241 ) ) ( not ( = ?auto_27231 ?auto_27241 ) ) ( not ( = ?auto_27244 ?auto_27241 ) ) ( not ( = ?auto_27235 ?auto_27241 ) ) ( AVAILABLE ?auto_27233 ) ( TRUCK-AT ?auto_27238 ?auto_27234 ) ( not ( = ?auto_27234 ?auto_27239 ) ) ( not ( = ?auto_27242 ?auto_27234 ) ) ( not ( = ?auto_27236 ?auto_27234 ) ) ( HOIST-AT ?auto_27243 ?auto_27234 ) ( not ( = ?auto_27233 ?auto_27243 ) ) ( not ( = ?auto_27237 ?auto_27243 ) ) ( not ( = ?auto_27240 ?auto_27243 ) ) ( AVAILABLE ?auto_27243 ) ( SURFACE-AT ?auto_27232 ?auto_27234 ) ( ON ?auto_27232 ?auto_27245 ) ( CLEAR ?auto_27232 ) ( not ( = ?auto_27230 ?auto_27245 ) ) ( not ( = ?auto_27231 ?auto_27245 ) ) ( not ( = ?auto_27232 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27245 ) ) ( not ( = ?auto_27235 ?auto_27245 ) ) ( not ( = ?auto_27241 ?auto_27245 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27243 ?auto_27232 ?auto_27245 ?auto_27234 )
      ( MAKE-2CRATE ?auto_27232 ?auto_27230 ?auto_27231 )
      ( MAKE-1CRATE-VERIFY ?auto_27230 ?auto_27231 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27246 - SURFACE
      ?auto_27247 - SURFACE
      ?auto_27248 - SURFACE
    )
    :vars
    (
      ?auto_27259 - HOIST
      ?auto_27254 - PLACE
      ?auto_27252 - PLACE
      ?auto_27250 - HOIST
      ?auto_27256 - SURFACE
      ?auto_27255 - PLACE
      ?auto_27253 - HOIST
      ?auto_27260 - SURFACE
      ?auto_27251 - SURFACE
      ?auto_27249 - TRUCK
      ?auto_27261 - PLACE
      ?auto_27257 - HOIST
      ?auto_27258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27259 ?auto_27254 ) ( IS-CRATE ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27246 ?auto_27248 ) ) ( not ( = ?auto_27252 ?auto_27254 ) ) ( HOIST-AT ?auto_27250 ?auto_27252 ) ( not ( = ?auto_27259 ?auto_27250 ) ) ( AVAILABLE ?auto_27250 ) ( SURFACE-AT ?auto_27248 ?auto_27252 ) ( ON ?auto_27248 ?auto_27256 ) ( CLEAR ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27256 ) ) ( not ( = ?auto_27248 ?auto_27256 ) ) ( not ( = ?auto_27246 ?auto_27256 ) ) ( IS-CRATE ?auto_27247 ) ( not ( = ?auto_27255 ?auto_27254 ) ) ( not ( = ?auto_27252 ?auto_27255 ) ) ( HOIST-AT ?auto_27253 ?auto_27255 ) ( not ( = ?auto_27259 ?auto_27253 ) ) ( not ( = ?auto_27250 ?auto_27253 ) ) ( AVAILABLE ?auto_27253 ) ( SURFACE-AT ?auto_27247 ?auto_27255 ) ( ON ?auto_27247 ?auto_27260 ) ( CLEAR ?auto_27247 ) ( not ( = ?auto_27247 ?auto_27260 ) ) ( not ( = ?auto_27248 ?auto_27260 ) ) ( not ( = ?auto_27246 ?auto_27260 ) ) ( not ( = ?auto_27256 ?auto_27260 ) ) ( SURFACE-AT ?auto_27251 ?auto_27254 ) ( CLEAR ?auto_27251 ) ( IS-CRATE ?auto_27246 ) ( not ( = ?auto_27251 ?auto_27246 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27248 ?auto_27251 ) ) ( not ( = ?auto_27256 ?auto_27251 ) ) ( not ( = ?auto_27260 ?auto_27251 ) ) ( AVAILABLE ?auto_27259 ) ( TRUCK-AT ?auto_27249 ?auto_27261 ) ( not ( = ?auto_27261 ?auto_27254 ) ) ( not ( = ?auto_27252 ?auto_27261 ) ) ( not ( = ?auto_27255 ?auto_27261 ) ) ( HOIST-AT ?auto_27257 ?auto_27261 ) ( not ( = ?auto_27259 ?auto_27257 ) ) ( not ( = ?auto_27250 ?auto_27257 ) ) ( not ( = ?auto_27253 ?auto_27257 ) ) ( AVAILABLE ?auto_27257 ) ( SURFACE-AT ?auto_27246 ?auto_27261 ) ( ON ?auto_27246 ?auto_27258 ) ( CLEAR ?auto_27246 ) ( not ( = ?auto_27247 ?auto_27258 ) ) ( not ( = ?auto_27248 ?auto_27258 ) ) ( not ( = ?auto_27246 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( not ( = ?auto_27260 ?auto_27258 ) ) ( not ( = ?auto_27251 ?auto_27258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27247 ?auto_27248 )
      ( MAKE-2CRATE-VERIFY ?auto_27246 ?auto_27247 ?auto_27248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27262 - SURFACE
      ?auto_27263 - SURFACE
      ?auto_27264 - SURFACE
      ?auto_27265 - SURFACE
    )
    :vars
    (
      ?auto_27274 - HOIST
      ?auto_27270 - PLACE
      ?auto_27267 - PLACE
      ?auto_27275 - HOIST
      ?auto_27271 - SURFACE
      ?auto_27272 - PLACE
      ?auto_27266 - HOIST
      ?auto_27273 - SURFACE
      ?auto_27276 - TRUCK
      ?auto_27269 - PLACE
      ?auto_27277 - HOIST
      ?auto_27268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27274 ?auto_27270 ) ( IS-CRATE ?auto_27265 ) ( not ( = ?auto_27264 ?auto_27265 ) ) ( not ( = ?auto_27263 ?auto_27264 ) ) ( not ( = ?auto_27263 ?auto_27265 ) ) ( not ( = ?auto_27267 ?auto_27270 ) ) ( HOIST-AT ?auto_27275 ?auto_27267 ) ( not ( = ?auto_27274 ?auto_27275 ) ) ( AVAILABLE ?auto_27275 ) ( SURFACE-AT ?auto_27265 ?auto_27267 ) ( ON ?auto_27265 ?auto_27271 ) ( CLEAR ?auto_27265 ) ( not ( = ?auto_27264 ?auto_27271 ) ) ( not ( = ?auto_27265 ?auto_27271 ) ) ( not ( = ?auto_27263 ?auto_27271 ) ) ( IS-CRATE ?auto_27264 ) ( not ( = ?auto_27272 ?auto_27270 ) ) ( not ( = ?auto_27267 ?auto_27272 ) ) ( HOIST-AT ?auto_27266 ?auto_27272 ) ( not ( = ?auto_27274 ?auto_27266 ) ) ( not ( = ?auto_27275 ?auto_27266 ) ) ( AVAILABLE ?auto_27266 ) ( SURFACE-AT ?auto_27264 ?auto_27272 ) ( ON ?auto_27264 ?auto_27273 ) ( CLEAR ?auto_27264 ) ( not ( = ?auto_27264 ?auto_27273 ) ) ( not ( = ?auto_27265 ?auto_27273 ) ) ( not ( = ?auto_27263 ?auto_27273 ) ) ( not ( = ?auto_27271 ?auto_27273 ) ) ( SURFACE-AT ?auto_27262 ?auto_27270 ) ( CLEAR ?auto_27262 ) ( IS-CRATE ?auto_27263 ) ( not ( = ?auto_27262 ?auto_27263 ) ) ( not ( = ?auto_27264 ?auto_27262 ) ) ( not ( = ?auto_27265 ?auto_27262 ) ) ( not ( = ?auto_27271 ?auto_27262 ) ) ( not ( = ?auto_27273 ?auto_27262 ) ) ( AVAILABLE ?auto_27274 ) ( TRUCK-AT ?auto_27276 ?auto_27269 ) ( not ( = ?auto_27269 ?auto_27270 ) ) ( not ( = ?auto_27267 ?auto_27269 ) ) ( not ( = ?auto_27272 ?auto_27269 ) ) ( HOIST-AT ?auto_27277 ?auto_27269 ) ( not ( = ?auto_27274 ?auto_27277 ) ) ( not ( = ?auto_27275 ?auto_27277 ) ) ( not ( = ?auto_27266 ?auto_27277 ) ) ( AVAILABLE ?auto_27277 ) ( SURFACE-AT ?auto_27263 ?auto_27269 ) ( ON ?auto_27263 ?auto_27268 ) ( CLEAR ?auto_27263 ) ( not ( = ?auto_27264 ?auto_27268 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27263 ?auto_27268 ) ) ( not ( = ?auto_27271 ?auto_27268 ) ) ( not ( = ?auto_27273 ?auto_27268 ) ) ( not ( = ?auto_27262 ?auto_27268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27263 ?auto_27264 ?auto_27265 )
      ( MAKE-3CRATE-VERIFY ?auto_27262 ?auto_27263 ?auto_27264 ?auto_27265 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27278 - SURFACE
      ?auto_27279 - SURFACE
      ?auto_27280 - SURFACE
      ?auto_27281 - SURFACE
      ?auto_27282 - SURFACE
    )
    :vars
    (
      ?auto_27291 - HOIST
      ?auto_27287 - PLACE
      ?auto_27284 - PLACE
      ?auto_27292 - HOIST
      ?auto_27288 - SURFACE
      ?auto_27289 - PLACE
      ?auto_27283 - HOIST
      ?auto_27290 - SURFACE
      ?auto_27293 - TRUCK
      ?auto_27286 - PLACE
      ?auto_27294 - HOIST
      ?auto_27285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27291 ?auto_27287 ) ( IS-CRATE ?auto_27282 ) ( not ( = ?auto_27281 ?auto_27282 ) ) ( not ( = ?auto_27280 ?auto_27281 ) ) ( not ( = ?auto_27280 ?auto_27282 ) ) ( not ( = ?auto_27284 ?auto_27287 ) ) ( HOIST-AT ?auto_27292 ?auto_27284 ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( AVAILABLE ?auto_27292 ) ( SURFACE-AT ?auto_27282 ?auto_27284 ) ( ON ?auto_27282 ?auto_27288 ) ( CLEAR ?auto_27282 ) ( not ( = ?auto_27281 ?auto_27288 ) ) ( not ( = ?auto_27282 ?auto_27288 ) ) ( not ( = ?auto_27280 ?auto_27288 ) ) ( IS-CRATE ?auto_27281 ) ( not ( = ?auto_27289 ?auto_27287 ) ) ( not ( = ?auto_27284 ?auto_27289 ) ) ( HOIST-AT ?auto_27283 ?auto_27289 ) ( not ( = ?auto_27291 ?auto_27283 ) ) ( not ( = ?auto_27292 ?auto_27283 ) ) ( AVAILABLE ?auto_27283 ) ( SURFACE-AT ?auto_27281 ?auto_27289 ) ( ON ?auto_27281 ?auto_27290 ) ( CLEAR ?auto_27281 ) ( not ( = ?auto_27281 ?auto_27290 ) ) ( not ( = ?auto_27282 ?auto_27290 ) ) ( not ( = ?auto_27280 ?auto_27290 ) ) ( not ( = ?auto_27288 ?auto_27290 ) ) ( SURFACE-AT ?auto_27279 ?auto_27287 ) ( CLEAR ?auto_27279 ) ( IS-CRATE ?auto_27280 ) ( not ( = ?auto_27279 ?auto_27280 ) ) ( not ( = ?auto_27281 ?auto_27279 ) ) ( not ( = ?auto_27282 ?auto_27279 ) ) ( not ( = ?auto_27288 ?auto_27279 ) ) ( not ( = ?auto_27290 ?auto_27279 ) ) ( AVAILABLE ?auto_27291 ) ( TRUCK-AT ?auto_27293 ?auto_27286 ) ( not ( = ?auto_27286 ?auto_27287 ) ) ( not ( = ?auto_27284 ?auto_27286 ) ) ( not ( = ?auto_27289 ?auto_27286 ) ) ( HOIST-AT ?auto_27294 ?auto_27286 ) ( not ( = ?auto_27291 ?auto_27294 ) ) ( not ( = ?auto_27292 ?auto_27294 ) ) ( not ( = ?auto_27283 ?auto_27294 ) ) ( AVAILABLE ?auto_27294 ) ( SURFACE-AT ?auto_27280 ?auto_27286 ) ( ON ?auto_27280 ?auto_27285 ) ( CLEAR ?auto_27280 ) ( not ( = ?auto_27281 ?auto_27285 ) ) ( not ( = ?auto_27282 ?auto_27285 ) ) ( not ( = ?auto_27280 ?auto_27285 ) ) ( not ( = ?auto_27288 ?auto_27285 ) ) ( not ( = ?auto_27290 ?auto_27285 ) ) ( not ( = ?auto_27279 ?auto_27285 ) ) ( ON ?auto_27279 ?auto_27278 ) ( not ( = ?auto_27278 ?auto_27279 ) ) ( not ( = ?auto_27278 ?auto_27280 ) ) ( not ( = ?auto_27278 ?auto_27281 ) ) ( not ( = ?auto_27278 ?auto_27282 ) ) ( not ( = ?auto_27278 ?auto_27288 ) ) ( not ( = ?auto_27278 ?auto_27290 ) ) ( not ( = ?auto_27278 ?auto_27285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27280 ?auto_27281 ?auto_27282 )
      ( MAKE-4CRATE-VERIFY ?auto_27278 ?auto_27279 ?auto_27280 ?auto_27281 ?auto_27282 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27295 - SURFACE
      ?auto_27296 - SURFACE
      ?auto_27297 - SURFACE
      ?auto_27298 - SURFACE
      ?auto_27299 - SURFACE
      ?auto_27300 - SURFACE
    )
    :vars
    (
      ?auto_27309 - HOIST
      ?auto_27305 - PLACE
      ?auto_27302 - PLACE
      ?auto_27310 - HOIST
      ?auto_27306 - SURFACE
      ?auto_27307 - PLACE
      ?auto_27301 - HOIST
      ?auto_27308 - SURFACE
      ?auto_27311 - TRUCK
      ?auto_27304 - PLACE
      ?auto_27312 - HOIST
      ?auto_27303 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27309 ?auto_27305 ) ( IS-CRATE ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27299 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27302 ?auto_27305 ) ) ( HOIST-AT ?auto_27310 ?auto_27302 ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( AVAILABLE ?auto_27310 ) ( SURFACE-AT ?auto_27300 ?auto_27302 ) ( ON ?auto_27300 ?auto_27306 ) ( CLEAR ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27306 ) ) ( not ( = ?auto_27300 ?auto_27306 ) ) ( not ( = ?auto_27298 ?auto_27306 ) ) ( IS-CRATE ?auto_27299 ) ( not ( = ?auto_27307 ?auto_27305 ) ) ( not ( = ?auto_27302 ?auto_27307 ) ) ( HOIST-AT ?auto_27301 ?auto_27307 ) ( not ( = ?auto_27309 ?auto_27301 ) ) ( not ( = ?auto_27310 ?auto_27301 ) ) ( AVAILABLE ?auto_27301 ) ( SURFACE-AT ?auto_27299 ?auto_27307 ) ( ON ?auto_27299 ?auto_27308 ) ( CLEAR ?auto_27299 ) ( not ( = ?auto_27299 ?auto_27308 ) ) ( not ( = ?auto_27300 ?auto_27308 ) ) ( not ( = ?auto_27298 ?auto_27308 ) ) ( not ( = ?auto_27306 ?auto_27308 ) ) ( SURFACE-AT ?auto_27297 ?auto_27305 ) ( CLEAR ?auto_27297 ) ( IS-CRATE ?auto_27298 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27299 ?auto_27297 ) ) ( not ( = ?auto_27300 ?auto_27297 ) ) ( not ( = ?auto_27306 ?auto_27297 ) ) ( not ( = ?auto_27308 ?auto_27297 ) ) ( AVAILABLE ?auto_27309 ) ( TRUCK-AT ?auto_27311 ?auto_27304 ) ( not ( = ?auto_27304 ?auto_27305 ) ) ( not ( = ?auto_27302 ?auto_27304 ) ) ( not ( = ?auto_27307 ?auto_27304 ) ) ( HOIST-AT ?auto_27312 ?auto_27304 ) ( not ( = ?auto_27309 ?auto_27312 ) ) ( not ( = ?auto_27310 ?auto_27312 ) ) ( not ( = ?auto_27301 ?auto_27312 ) ) ( AVAILABLE ?auto_27312 ) ( SURFACE-AT ?auto_27298 ?auto_27304 ) ( ON ?auto_27298 ?auto_27303 ) ( CLEAR ?auto_27298 ) ( not ( = ?auto_27299 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( not ( = ?auto_27306 ?auto_27303 ) ) ( not ( = ?auto_27308 ?auto_27303 ) ) ( not ( = ?auto_27297 ?auto_27303 ) ) ( ON ?auto_27296 ?auto_27295 ) ( ON ?auto_27297 ?auto_27296 ) ( not ( = ?auto_27295 ?auto_27296 ) ) ( not ( = ?auto_27295 ?auto_27297 ) ) ( not ( = ?auto_27295 ?auto_27298 ) ) ( not ( = ?auto_27295 ?auto_27299 ) ) ( not ( = ?auto_27295 ?auto_27300 ) ) ( not ( = ?auto_27295 ?auto_27306 ) ) ( not ( = ?auto_27295 ?auto_27308 ) ) ( not ( = ?auto_27295 ?auto_27303 ) ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27298 ) ) ( not ( = ?auto_27296 ?auto_27299 ) ) ( not ( = ?auto_27296 ?auto_27300 ) ) ( not ( = ?auto_27296 ?auto_27306 ) ) ( not ( = ?auto_27296 ?auto_27308 ) ) ( not ( = ?auto_27296 ?auto_27303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27298 ?auto_27299 ?auto_27300 )
      ( MAKE-5CRATE-VERIFY ?auto_27295 ?auto_27296 ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27313 - SURFACE
      ?auto_27314 - SURFACE
    )
    :vars
    (
      ?auto_27324 - HOIST
      ?auto_27319 - PLACE
      ?auto_27328 - SURFACE
      ?auto_27316 - PLACE
      ?auto_27325 - HOIST
      ?auto_27320 - SURFACE
      ?auto_27321 - PLACE
      ?auto_27315 - HOIST
      ?auto_27323 - SURFACE
      ?auto_27322 - SURFACE
      ?auto_27318 - PLACE
      ?auto_27327 - HOIST
      ?auto_27317 - SURFACE
      ?auto_27326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27324 ?auto_27319 ) ( IS-CRATE ?auto_27314 ) ( not ( = ?auto_27313 ?auto_27314 ) ) ( not ( = ?auto_27328 ?auto_27313 ) ) ( not ( = ?auto_27328 ?auto_27314 ) ) ( not ( = ?auto_27316 ?auto_27319 ) ) ( HOIST-AT ?auto_27325 ?auto_27316 ) ( not ( = ?auto_27324 ?auto_27325 ) ) ( AVAILABLE ?auto_27325 ) ( SURFACE-AT ?auto_27314 ?auto_27316 ) ( ON ?auto_27314 ?auto_27320 ) ( CLEAR ?auto_27314 ) ( not ( = ?auto_27313 ?auto_27320 ) ) ( not ( = ?auto_27314 ?auto_27320 ) ) ( not ( = ?auto_27328 ?auto_27320 ) ) ( IS-CRATE ?auto_27313 ) ( not ( = ?auto_27321 ?auto_27319 ) ) ( not ( = ?auto_27316 ?auto_27321 ) ) ( HOIST-AT ?auto_27315 ?auto_27321 ) ( not ( = ?auto_27324 ?auto_27315 ) ) ( not ( = ?auto_27325 ?auto_27315 ) ) ( AVAILABLE ?auto_27315 ) ( SURFACE-AT ?auto_27313 ?auto_27321 ) ( ON ?auto_27313 ?auto_27323 ) ( CLEAR ?auto_27313 ) ( not ( = ?auto_27313 ?auto_27323 ) ) ( not ( = ?auto_27314 ?auto_27323 ) ) ( not ( = ?auto_27328 ?auto_27323 ) ) ( not ( = ?auto_27320 ?auto_27323 ) ) ( SURFACE-AT ?auto_27322 ?auto_27319 ) ( CLEAR ?auto_27322 ) ( IS-CRATE ?auto_27328 ) ( not ( = ?auto_27322 ?auto_27328 ) ) ( not ( = ?auto_27313 ?auto_27322 ) ) ( not ( = ?auto_27314 ?auto_27322 ) ) ( not ( = ?auto_27320 ?auto_27322 ) ) ( not ( = ?auto_27323 ?auto_27322 ) ) ( AVAILABLE ?auto_27324 ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( not ( = ?auto_27316 ?auto_27318 ) ) ( not ( = ?auto_27321 ?auto_27318 ) ) ( HOIST-AT ?auto_27327 ?auto_27318 ) ( not ( = ?auto_27324 ?auto_27327 ) ) ( not ( = ?auto_27325 ?auto_27327 ) ) ( not ( = ?auto_27315 ?auto_27327 ) ) ( AVAILABLE ?auto_27327 ) ( SURFACE-AT ?auto_27328 ?auto_27318 ) ( ON ?auto_27328 ?auto_27317 ) ( CLEAR ?auto_27328 ) ( not ( = ?auto_27313 ?auto_27317 ) ) ( not ( = ?auto_27314 ?auto_27317 ) ) ( not ( = ?auto_27328 ?auto_27317 ) ) ( not ( = ?auto_27320 ?auto_27317 ) ) ( not ( = ?auto_27323 ?auto_27317 ) ) ( not ( = ?auto_27322 ?auto_27317 ) ) ( TRUCK-AT ?auto_27326 ?auto_27319 ) )
    :subtasks
    ( ( !DRIVE ?auto_27326 ?auto_27319 ?auto_27318 )
      ( MAKE-2CRATE ?auto_27328 ?auto_27313 ?auto_27314 )
      ( MAKE-1CRATE-VERIFY ?auto_27313 ?auto_27314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27329 - SURFACE
      ?auto_27330 - SURFACE
      ?auto_27331 - SURFACE
    )
    :vars
    (
      ?auto_27332 - HOIST
      ?auto_27333 - PLACE
      ?auto_27340 - PLACE
      ?auto_27342 - HOIST
      ?auto_27337 - SURFACE
      ?auto_27334 - PLACE
      ?auto_27341 - HOIST
      ?auto_27343 - SURFACE
      ?auto_27335 - SURFACE
      ?auto_27338 - PLACE
      ?auto_27336 - HOIST
      ?auto_27339 - SURFACE
      ?auto_27344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27332 ?auto_27333 ) ( IS-CRATE ?auto_27331 ) ( not ( = ?auto_27330 ?auto_27331 ) ) ( not ( = ?auto_27329 ?auto_27330 ) ) ( not ( = ?auto_27329 ?auto_27331 ) ) ( not ( = ?auto_27340 ?auto_27333 ) ) ( HOIST-AT ?auto_27342 ?auto_27340 ) ( not ( = ?auto_27332 ?auto_27342 ) ) ( AVAILABLE ?auto_27342 ) ( SURFACE-AT ?auto_27331 ?auto_27340 ) ( ON ?auto_27331 ?auto_27337 ) ( CLEAR ?auto_27331 ) ( not ( = ?auto_27330 ?auto_27337 ) ) ( not ( = ?auto_27331 ?auto_27337 ) ) ( not ( = ?auto_27329 ?auto_27337 ) ) ( IS-CRATE ?auto_27330 ) ( not ( = ?auto_27334 ?auto_27333 ) ) ( not ( = ?auto_27340 ?auto_27334 ) ) ( HOIST-AT ?auto_27341 ?auto_27334 ) ( not ( = ?auto_27332 ?auto_27341 ) ) ( not ( = ?auto_27342 ?auto_27341 ) ) ( AVAILABLE ?auto_27341 ) ( SURFACE-AT ?auto_27330 ?auto_27334 ) ( ON ?auto_27330 ?auto_27343 ) ( CLEAR ?auto_27330 ) ( not ( = ?auto_27330 ?auto_27343 ) ) ( not ( = ?auto_27331 ?auto_27343 ) ) ( not ( = ?auto_27329 ?auto_27343 ) ) ( not ( = ?auto_27337 ?auto_27343 ) ) ( SURFACE-AT ?auto_27335 ?auto_27333 ) ( CLEAR ?auto_27335 ) ( IS-CRATE ?auto_27329 ) ( not ( = ?auto_27335 ?auto_27329 ) ) ( not ( = ?auto_27330 ?auto_27335 ) ) ( not ( = ?auto_27331 ?auto_27335 ) ) ( not ( = ?auto_27337 ?auto_27335 ) ) ( not ( = ?auto_27343 ?auto_27335 ) ) ( AVAILABLE ?auto_27332 ) ( not ( = ?auto_27338 ?auto_27333 ) ) ( not ( = ?auto_27340 ?auto_27338 ) ) ( not ( = ?auto_27334 ?auto_27338 ) ) ( HOIST-AT ?auto_27336 ?auto_27338 ) ( not ( = ?auto_27332 ?auto_27336 ) ) ( not ( = ?auto_27342 ?auto_27336 ) ) ( not ( = ?auto_27341 ?auto_27336 ) ) ( AVAILABLE ?auto_27336 ) ( SURFACE-AT ?auto_27329 ?auto_27338 ) ( ON ?auto_27329 ?auto_27339 ) ( CLEAR ?auto_27329 ) ( not ( = ?auto_27330 ?auto_27339 ) ) ( not ( = ?auto_27331 ?auto_27339 ) ) ( not ( = ?auto_27329 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( not ( = ?auto_27343 ?auto_27339 ) ) ( not ( = ?auto_27335 ?auto_27339 ) ) ( TRUCK-AT ?auto_27344 ?auto_27333 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27330 ?auto_27331 )
      ( MAKE-2CRATE-VERIFY ?auto_27329 ?auto_27330 ?auto_27331 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27345 - SURFACE
      ?auto_27346 - SURFACE
      ?auto_27347 - SURFACE
      ?auto_27348 - SURFACE
    )
    :vars
    (
      ?auto_27359 - HOIST
      ?auto_27350 - PLACE
      ?auto_27352 - PLACE
      ?auto_27358 - HOIST
      ?auto_27353 - SURFACE
      ?auto_27354 - PLACE
      ?auto_27349 - HOIST
      ?auto_27357 - SURFACE
      ?auto_27356 - PLACE
      ?auto_27360 - HOIST
      ?auto_27351 - SURFACE
      ?auto_27355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27359 ?auto_27350 ) ( IS-CRATE ?auto_27348 ) ( not ( = ?auto_27347 ?auto_27348 ) ) ( not ( = ?auto_27346 ?auto_27347 ) ) ( not ( = ?auto_27346 ?auto_27348 ) ) ( not ( = ?auto_27352 ?auto_27350 ) ) ( HOIST-AT ?auto_27358 ?auto_27352 ) ( not ( = ?auto_27359 ?auto_27358 ) ) ( AVAILABLE ?auto_27358 ) ( SURFACE-AT ?auto_27348 ?auto_27352 ) ( ON ?auto_27348 ?auto_27353 ) ( CLEAR ?auto_27348 ) ( not ( = ?auto_27347 ?auto_27353 ) ) ( not ( = ?auto_27348 ?auto_27353 ) ) ( not ( = ?auto_27346 ?auto_27353 ) ) ( IS-CRATE ?auto_27347 ) ( not ( = ?auto_27354 ?auto_27350 ) ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( HOIST-AT ?auto_27349 ?auto_27354 ) ( not ( = ?auto_27359 ?auto_27349 ) ) ( not ( = ?auto_27358 ?auto_27349 ) ) ( AVAILABLE ?auto_27349 ) ( SURFACE-AT ?auto_27347 ?auto_27354 ) ( ON ?auto_27347 ?auto_27357 ) ( CLEAR ?auto_27347 ) ( not ( = ?auto_27347 ?auto_27357 ) ) ( not ( = ?auto_27348 ?auto_27357 ) ) ( not ( = ?auto_27346 ?auto_27357 ) ) ( not ( = ?auto_27353 ?auto_27357 ) ) ( SURFACE-AT ?auto_27345 ?auto_27350 ) ( CLEAR ?auto_27345 ) ( IS-CRATE ?auto_27346 ) ( not ( = ?auto_27345 ?auto_27346 ) ) ( not ( = ?auto_27347 ?auto_27345 ) ) ( not ( = ?auto_27348 ?auto_27345 ) ) ( not ( = ?auto_27353 ?auto_27345 ) ) ( not ( = ?auto_27357 ?auto_27345 ) ) ( AVAILABLE ?auto_27359 ) ( not ( = ?auto_27356 ?auto_27350 ) ) ( not ( = ?auto_27352 ?auto_27356 ) ) ( not ( = ?auto_27354 ?auto_27356 ) ) ( HOIST-AT ?auto_27360 ?auto_27356 ) ( not ( = ?auto_27359 ?auto_27360 ) ) ( not ( = ?auto_27358 ?auto_27360 ) ) ( not ( = ?auto_27349 ?auto_27360 ) ) ( AVAILABLE ?auto_27360 ) ( SURFACE-AT ?auto_27346 ?auto_27356 ) ( ON ?auto_27346 ?auto_27351 ) ( CLEAR ?auto_27346 ) ( not ( = ?auto_27347 ?auto_27351 ) ) ( not ( = ?auto_27348 ?auto_27351 ) ) ( not ( = ?auto_27346 ?auto_27351 ) ) ( not ( = ?auto_27353 ?auto_27351 ) ) ( not ( = ?auto_27357 ?auto_27351 ) ) ( not ( = ?auto_27345 ?auto_27351 ) ) ( TRUCK-AT ?auto_27355 ?auto_27350 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27346 ?auto_27347 ?auto_27348 )
      ( MAKE-3CRATE-VERIFY ?auto_27345 ?auto_27346 ?auto_27347 ?auto_27348 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27361 - SURFACE
      ?auto_27362 - SURFACE
      ?auto_27363 - SURFACE
      ?auto_27364 - SURFACE
      ?auto_27365 - SURFACE
    )
    :vars
    (
      ?auto_27376 - HOIST
      ?auto_27367 - PLACE
      ?auto_27369 - PLACE
      ?auto_27375 - HOIST
      ?auto_27370 - SURFACE
      ?auto_27371 - PLACE
      ?auto_27366 - HOIST
      ?auto_27374 - SURFACE
      ?auto_27373 - PLACE
      ?auto_27377 - HOIST
      ?auto_27368 - SURFACE
      ?auto_27372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27376 ?auto_27367 ) ( IS-CRATE ?auto_27365 ) ( not ( = ?auto_27364 ?auto_27365 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27365 ) ) ( not ( = ?auto_27369 ?auto_27367 ) ) ( HOIST-AT ?auto_27375 ?auto_27369 ) ( not ( = ?auto_27376 ?auto_27375 ) ) ( AVAILABLE ?auto_27375 ) ( SURFACE-AT ?auto_27365 ?auto_27369 ) ( ON ?auto_27365 ?auto_27370 ) ( CLEAR ?auto_27365 ) ( not ( = ?auto_27364 ?auto_27370 ) ) ( not ( = ?auto_27365 ?auto_27370 ) ) ( not ( = ?auto_27363 ?auto_27370 ) ) ( IS-CRATE ?auto_27364 ) ( not ( = ?auto_27371 ?auto_27367 ) ) ( not ( = ?auto_27369 ?auto_27371 ) ) ( HOIST-AT ?auto_27366 ?auto_27371 ) ( not ( = ?auto_27376 ?auto_27366 ) ) ( not ( = ?auto_27375 ?auto_27366 ) ) ( AVAILABLE ?auto_27366 ) ( SURFACE-AT ?auto_27364 ?auto_27371 ) ( ON ?auto_27364 ?auto_27374 ) ( CLEAR ?auto_27364 ) ( not ( = ?auto_27364 ?auto_27374 ) ) ( not ( = ?auto_27365 ?auto_27374 ) ) ( not ( = ?auto_27363 ?auto_27374 ) ) ( not ( = ?auto_27370 ?auto_27374 ) ) ( SURFACE-AT ?auto_27362 ?auto_27367 ) ( CLEAR ?auto_27362 ) ( IS-CRATE ?auto_27363 ) ( not ( = ?auto_27362 ?auto_27363 ) ) ( not ( = ?auto_27364 ?auto_27362 ) ) ( not ( = ?auto_27365 ?auto_27362 ) ) ( not ( = ?auto_27370 ?auto_27362 ) ) ( not ( = ?auto_27374 ?auto_27362 ) ) ( AVAILABLE ?auto_27376 ) ( not ( = ?auto_27373 ?auto_27367 ) ) ( not ( = ?auto_27369 ?auto_27373 ) ) ( not ( = ?auto_27371 ?auto_27373 ) ) ( HOIST-AT ?auto_27377 ?auto_27373 ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27375 ?auto_27377 ) ) ( not ( = ?auto_27366 ?auto_27377 ) ) ( AVAILABLE ?auto_27377 ) ( SURFACE-AT ?auto_27363 ?auto_27373 ) ( ON ?auto_27363 ?auto_27368 ) ( CLEAR ?auto_27363 ) ( not ( = ?auto_27364 ?auto_27368 ) ) ( not ( = ?auto_27365 ?auto_27368 ) ) ( not ( = ?auto_27363 ?auto_27368 ) ) ( not ( = ?auto_27370 ?auto_27368 ) ) ( not ( = ?auto_27374 ?auto_27368 ) ) ( not ( = ?auto_27362 ?auto_27368 ) ) ( TRUCK-AT ?auto_27372 ?auto_27367 ) ( ON ?auto_27362 ?auto_27361 ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27365 ) ) ( not ( = ?auto_27361 ?auto_27370 ) ) ( not ( = ?auto_27361 ?auto_27374 ) ) ( not ( = ?auto_27361 ?auto_27368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27363 ?auto_27364 ?auto_27365 )
      ( MAKE-4CRATE-VERIFY ?auto_27361 ?auto_27362 ?auto_27363 ?auto_27364 ?auto_27365 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27378 - SURFACE
      ?auto_27379 - SURFACE
      ?auto_27380 - SURFACE
      ?auto_27381 - SURFACE
      ?auto_27382 - SURFACE
      ?auto_27383 - SURFACE
    )
    :vars
    (
      ?auto_27394 - HOIST
      ?auto_27385 - PLACE
      ?auto_27387 - PLACE
      ?auto_27393 - HOIST
      ?auto_27388 - SURFACE
      ?auto_27389 - PLACE
      ?auto_27384 - HOIST
      ?auto_27392 - SURFACE
      ?auto_27391 - PLACE
      ?auto_27395 - HOIST
      ?auto_27386 - SURFACE
      ?auto_27390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27394 ?auto_27385 ) ( IS-CRATE ?auto_27383 ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( not ( = ?auto_27381 ?auto_27382 ) ) ( not ( = ?auto_27381 ?auto_27383 ) ) ( not ( = ?auto_27387 ?auto_27385 ) ) ( HOIST-AT ?auto_27393 ?auto_27387 ) ( not ( = ?auto_27394 ?auto_27393 ) ) ( AVAILABLE ?auto_27393 ) ( SURFACE-AT ?auto_27383 ?auto_27387 ) ( ON ?auto_27383 ?auto_27388 ) ( CLEAR ?auto_27383 ) ( not ( = ?auto_27382 ?auto_27388 ) ) ( not ( = ?auto_27383 ?auto_27388 ) ) ( not ( = ?auto_27381 ?auto_27388 ) ) ( IS-CRATE ?auto_27382 ) ( not ( = ?auto_27389 ?auto_27385 ) ) ( not ( = ?auto_27387 ?auto_27389 ) ) ( HOIST-AT ?auto_27384 ?auto_27389 ) ( not ( = ?auto_27394 ?auto_27384 ) ) ( not ( = ?auto_27393 ?auto_27384 ) ) ( AVAILABLE ?auto_27384 ) ( SURFACE-AT ?auto_27382 ?auto_27389 ) ( ON ?auto_27382 ?auto_27392 ) ( CLEAR ?auto_27382 ) ( not ( = ?auto_27382 ?auto_27392 ) ) ( not ( = ?auto_27383 ?auto_27392 ) ) ( not ( = ?auto_27381 ?auto_27392 ) ) ( not ( = ?auto_27388 ?auto_27392 ) ) ( SURFACE-AT ?auto_27380 ?auto_27385 ) ( CLEAR ?auto_27380 ) ( IS-CRATE ?auto_27381 ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( not ( = ?auto_27382 ?auto_27380 ) ) ( not ( = ?auto_27383 ?auto_27380 ) ) ( not ( = ?auto_27388 ?auto_27380 ) ) ( not ( = ?auto_27392 ?auto_27380 ) ) ( AVAILABLE ?auto_27394 ) ( not ( = ?auto_27391 ?auto_27385 ) ) ( not ( = ?auto_27387 ?auto_27391 ) ) ( not ( = ?auto_27389 ?auto_27391 ) ) ( HOIST-AT ?auto_27395 ?auto_27391 ) ( not ( = ?auto_27394 ?auto_27395 ) ) ( not ( = ?auto_27393 ?auto_27395 ) ) ( not ( = ?auto_27384 ?auto_27395 ) ) ( AVAILABLE ?auto_27395 ) ( SURFACE-AT ?auto_27381 ?auto_27391 ) ( ON ?auto_27381 ?auto_27386 ) ( CLEAR ?auto_27381 ) ( not ( = ?auto_27382 ?auto_27386 ) ) ( not ( = ?auto_27383 ?auto_27386 ) ) ( not ( = ?auto_27381 ?auto_27386 ) ) ( not ( = ?auto_27388 ?auto_27386 ) ) ( not ( = ?auto_27392 ?auto_27386 ) ) ( not ( = ?auto_27380 ?auto_27386 ) ) ( TRUCK-AT ?auto_27390 ?auto_27385 ) ( ON ?auto_27379 ?auto_27378 ) ( ON ?auto_27380 ?auto_27379 ) ( not ( = ?auto_27378 ?auto_27379 ) ) ( not ( = ?auto_27378 ?auto_27380 ) ) ( not ( = ?auto_27378 ?auto_27381 ) ) ( not ( = ?auto_27378 ?auto_27382 ) ) ( not ( = ?auto_27378 ?auto_27383 ) ) ( not ( = ?auto_27378 ?auto_27388 ) ) ( not ( = ?auto_27378 ?auto_27392 ) ) ( not ( = ?auto_27378 ?auto_27386 ) ) ( not ( = ?auto_27379 ?auto_27380 ) ) ( not ( = ?auto_27379 ?auto_27381 ) ) ( not ( = ?auto_27379 ?auto_27382 ) ) ( not ( = ?auto_27379 ?auto_27383 ) ) ( not ( = ?auto_27379 ?auto_27388 ) ) ( not ( = ?auto_27379 ?auto_27392 ) ) ( not ( = ?auto_27379 ?auto_27386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27381 ?auto_27382 ?auto_27383 )
      ( MAKE-5CRATE-VERIFY ?auto_27378 ?auto_27379 ?auto_27380 ?auto_27381 ?auto_27382 ?auto_27383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27396 - SURFACE
      ?auto_27397 - SURFACE
    )
    :vars
    (
      ?auto_27410 - HOIST
      ?auto_27399 - PLACE
      ?auto_27404 - SURFACE
      ?auto_27401 - PLACE
      ?auto_27409 - HOIST
      ?auto_27402 - SURFACE
      ?auto_27403 - PLACE
      ?auto_27398 - HOIST
      ?auto_27408 - SURFACE
      ?auto_27406 - SURFACE
      ?auto_27407 - PLACE
      ?auto_27411 - HOIST
      ?auto_27400 - SURFACE
      ?auto_27405 - TRUCK
      ?auto_27412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27410 ?auto_27399 ) ( IS-CRATE ?auto_27397 ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27404 ?auto_27396 ) ) ( not ( = ?auto_27404 ?auto_27397 ) ) ( not ( = ?auto_27401 ?auto_27399 ) ) ( HOIST-AT ?auto_27409 ?auto_27401 ) ( not ( = ?auto_27410 ?auto_27409 ) ) ( AVAILABLE ?auto_27409 ) ( SURFACE-AT ?auto_27397 ?auto_27401 ) ( ON ?auto_27397 ?auto_27402 ) ( CLEAR ?auto_27397 ) ( not ( = ?auto_27396 ?auto_27402 ) ) ( not ( = ?auto_27397 ?auto_27402 ) ) ( not ( = ?auto_27404 ?auto_27402 ) ) ( IS-CRATE ?auto_27396 ) ( not ( = ?auto_27403 ?auto_27399 ) ) ( not ( = ?auto_27401 ?auto_27403 ) ) ( HOIST-AT ?auto_27398 ?auto_27403 ) ( not ( = ?auto_27410 ?auto_27398 ) ) ( not ( = ?auto_27409 ?auto_27398 ) ) ( AVAILABLE ?auto_27398 ) ( SURFACE-AT ?auto_27396 ?auto_27403 ) ( ON ?auto_27396 ?auto_27408 ) ( CLEAR ?auto_27396 ) ( not ( = ?auto_27396 ?auto_27408 ) ) ( not ( = ?auto_27397 ?auto_27408 ) ) ( not ( = ?auto_27404 ?auto_27408 ) ) ( not ( = ?auto_27402 ?auto_27408 ) ) ( IS-CRATE ?auto_27404 ) ( not ( = ?auto_27406 ?auto_27404 ) ) ( not ( = ?auto_27396 ?auto_27406 ) ) ( not ( = ?auto_27397 ?auto_27406 ) ) ( not ( = ?auto_27402 ?auto_27406 ) ) ( not ( = ?auto_27408 ?auto_27406 ) ) ( not ( = ?auto_27407 ?auto_27399 ) ) ( not ( = ?auto_27401 ?auto_27407 ) ) ( not ( = ?auto_27403 ?auto_27407 ) ) ( HOIST-AT ?auto_27411 ?auto_27407 ) ( not ( = ?auto_27410 ?auto_27411 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27398 ?auto_27411 ) ) ( AVAILABLE ?auto_27411 ) ( SURFACE-AT ?auto_27404 ?auto_27407 ) ( ON ?auto_27404 ?auto_27400 ) ( CLEAR ?auto_27404 ) ( not ( = ?auto_27396 ?auto_27400 ) ) ( not ( = ?auto_27397 ?auto_27400 ) ) ( not ( = ?auto_27404 ?auto_27400 ) ) ( not ( = ?auto_27402 ?auto_27400 ) ) ( not ( = ?auto_27408 ?auto_27400 ) ) ( not ( = ?auto_27406 ?auto_27400 ) ) ( TRUCK-AT ?auto_27405 ?auto_27399 ) ( SURFACE-AT ?auto_27412 ?auto_27399 ) ( CLEAR ?auto_27412 ) ( LIFTING ?auto_27410 ?auto_27406 ) ( IS-CRATE ?auto_27406 ) ( not ( = ?auto_27412 ?auto_27406 ) ) ( not ( = ?auto_27396 ?auto_27412 ) ) ( not ( = ?auto_27397 ?auto_27412 ) ) ( not ( = ?auto_27404 ?auto_27412 ) ) ( not ( = ?auto_27402 ?auto_27412 ) ) ( not ( = ?auto_27408 ?auto_27412 ) ) ( not ( = ?auto_27400 ?auto_27412 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27412 ?auto_27406 )
      ( MAKE-2CRATE ?auto_27404 ?auto_27396 ?auto_27397 )
      ( MAKE-1CRATE-VERIFY ?auto_27396 ?auto_27397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27413 - SURFACE
      ?auto_27414 - SURFACE
      ?auto_27415 - SURFACE
    )
    :vars
    (
      ?auto_27419 - HOIST
      ?auto_27418 - PLACE
      ?auto_27422 - PLACE
      ?auto_27428 - HOIST
      ?auto_27426 - SURFACE
      ?auto_27429 - PLACE
      ?auto_27417 - HOIST
      ?auto_27421 - SURFACE
      ?auto_27423 - SURFACE
      ?auto_27427 - PLACE
      ?auto_27425 - HOIST
      ?auto_27416 - SURFACE
      ?auto_27424 - TRUCK
      ?auto_27420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27419 ?auto_27418 ) ( IS-CRATE ?auto_27415 ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27415 ) ) ( not ( = ?auto_27422 ?auto_27418 ) ) ( HOIST-AT ?auto_27428 ?auto_27422 ) ( not ( = ?auto_27419 ?auto_27428 ) ) ( AVAILABLE ?auto_27428 ) ( SURFACE-AT ?auto_27415 ?auto_27422 ) ( ON ?auto_27415 ?auto_27426 ) ( CLEAR ?auto_27415 ) ( not ( = ?auto_27414 ?auto_27426 ) ) ( not ( = ?auto_27415 ?auto_27426 ) ) ( not ( = ?auto_27413 ?auto_27426 ) ) ( IS-CRATE ?auto_27414 ) ( not ( = ?auto_27429 ?auto_27418 ) ) ( not ( = ?auto_27422 ?auto_27429 ) ) ( HOIST-AT ?auto_27417 ?auto_27429 ) ( not ( = ?auto_27419 ?auto_27417 ) ) ( not ( = ?auto_27428 ?auto_27417 ) ) ( AVAILABLE ?auto_27417 ) ( SURFACE-AT ?auto_27414 ?auto_27429 ) ( ON ?auto_27414 ?auto_27421 ) ( CLEAR ?auto_27414 ) ( not ( = ?auto_27414 ?auto_27421 ) ) ( not ( = ?auto_27415 ?auto_27421 ) ) ( not ( = ?auto_27413 ?auto_27421 ) ) ( not ( = ?auto_27426 ?auto_27421 ) ) ( IS-CRATE ?auto_27413 ) ( not ( = ?auto_27423 ?auto_27413 ) ) ( not ( = ?auto_27414 ?auto_27423 ) ) ( not ( = ?auto_27415 ?auto_27423 ) ) ( not ( = ?auto_27426 ?auto_27423 ) ) ( not ( = ?auto_27421 ?auto_27423 ) ) ( not ( = ?auto_27427 ?auto_27418 ) ) ( not ( = ?auto_27422 ?auto_27427 ) ) ( not ( = ?auto_27429 ?auto_27427 ) ) ( HOIST-AT ?auto_27425 ?auto_27427 ) ( not ( = ?auto_27419 ?auto_27425 ) ) ( not ( = ?auto_27428 ?auto_27425 ) ) ( not ( = ?auto_27417 ?auto_27425 ) ) ( AVAILABLE ?auto_27425 ) ( SURFACE-AT ?auto_27413 ?auto_27427 ) ( ON ?auto_27413 ?auto_27416 ) ( CLEAR ?auto_27413 ) ( not ( = ?auto_27414 ?auto_27416 ) ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27426 ?auto_27416 ) ) ( not ( = ?auto_27421 ?auto_27416 ) ) ( not ( = ?auto_27423 ?auto_27416 ) ) ( TRUCK-AT ?auto_27424 ?auto_27418 ) ( SURFACE-AT ?auto_27420 ?auto_27418 ) ( CLEAR ?auto_27420 ) ( LIFTING ?auto_27419 ?auto_27423 ) ( IS-CRATE ?auto_27423 ) ( not ( = ?auto_27420 ?auto_27423 ) ) ( not ( = ?auto_27414 ?auto_27420 ) ) ( not ( = ?auto_27415 ?auto_27420 ) ) ( not ( = ?auto_27413 ?auto_27420 ) ) ( not ( = ?auto_27426 ?auto_27420 ) ) ( not ( = ?auto_27421 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27414 ?auto_27415 )
      ( MAKE-2CRATE-VERIFY ?auto_27413 ?auto_27414 ?auto_27415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27430 - SURFACE
      ?auto_27431 - SURFACE
      ?auto_27432 - SURFACE
      ?auto_27433 - SURFACE
    )
    :vars
    (
      ?auto_27443 - HOIST
      ?auto_27437 - PLACE
      ?auto_27439 - PLACE
      ?auto_27435 - HOIST
      ?auto_27445 - SURFACE
      ?auto_27444 - PLACE
      ?auto_27440 - HOIST
      ?auto_27434 - SURFACE
      ?auto_27436 - PLACE
      ?auto_27446 - HOIST
      ?auto_27438 - SURFACE
      ?auto_27442 - TRUCK
      ?auto_27441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27443 ?auto_27437 ) ( IS-CRATE ?auto_27433 ) ( not ( = ?auto_27432 ?auto_27433 ) ) ( not ( = ?auto_27431 ?auto_27432 ) ) ( not ( = ?auto_27431 ?auto_27433 ) ) ( not ( = ?auto_27439 ?auto_27437 ) ) ( HOIST-AT ?auto_27435 ?auto_27439 ) ( not ( = ?auto_27443 ?auto_27435 ) ) ( AVAILABLE ?auto_27435 ) ( SURFACE-AT ?auto_27433 ?auto_27439 ) ( ON ?auto_27433 ?auto_27445 ) ( CLEAR ?auto_27433 ) ( not ( = ?auto_27432 ?auto_27445 ) ) ( not ( = ?auto_27433 ?auto_27445 ) ) ( not ( = ?auto_27431 ?auto_27445 ) ) ( IS-CRATE ?auto_27432 ) ( not ( = ?auto_27444 ?auto_27437 ) ) ( not ( = ?auto_27439 ?auto_27444 ) ) ( HOIST-AT ?auto_27440 ?auto_27444 ) ( not ( = ?auto_27443 ?auto_27440 ) ) ( not ( = ?auto_27435 ?auto_27440 ) ) ( AVAILABLE ?auto_27440 ) ( SURFACE-AT ?auto_27432 ?auto_27444 ) ( ON ?auto_27432 ?auto_27434 ) ( CLEAR ?auto_27432 ) ( not ( = ?auto_27432 ?auto_27434 ) ) ( not ( = ?auto_27433 ?auto_27434 ) ) ( not ( = ?auto_27431 ?auto_27434 ) ) ( not ( = ?auto_27445 ?auto_27434 ) ) ( IS-CRATE ?auto_27431 ) ( not ( = ?auto_27430 ?auto_27431 ) ) ( not ( = ?auto_27432 ?auto_27430 ) ) ( not ( = ?auto_27433 ?auto_27430 ) ) ( not ( = ?auto_27445 ?auto_27430 ) ) ( not ( = ?auto_27434 ?auto_27430 ) ) ( not ( = ?auto_27436 ?auto_27437 ) ) ( not ( = ?auto_27439 ?auto_27436 ) ) ( not ( = ?auto_27444 ?auto_27436 ) ) ( HOIST-AT ?auto_27446 ?auto_27436 ) ( not ( = ?auto_27443 ?auto_27446 ) ) ( not ( = ?auto_27435 ?auto_27446 ) ) ( not ( = ?auto_27440 ?auto_27446 ) ) ( AVAILABLE ?auto_27446 ) ( SURFACE-AT ?auto_27431 ?auto_27436 ) ( ON ?auto_27431 ?auto_27438 ) ( CLEAR ?auto_27431 ) ( not ( = ?auto_27432 ?auto_27438 ) ) ( not ( = ?auto_27433 ?auto_27438 ) ) ( not ( = ?auto_27431 ?auto_27438 ) ) ( not ( = ?auto_27445 ?auto_27438 ) ) ( not ( = ?auto_27434 ?auto_27438 ) ) ( not ( = ?auto_27430 ?auto_27438 ) ) ( TRUCK-AT ?auto_27442 ?auto_27437 ) ( SURFACE-AT ?auto_27441 ?auto_27437 ) ( CLEAR ?auto_27441 ) ( LIFTING ?auto_27443 ?auto_27430 ) ( IS-CRATE ?auto_27430 ) ( not ( = ?auto_27441 ?auto_27430 ) ) ( not ( = ?auto_27432 ?auto_27441 ) ) ( not ( = ?auto_27433 ?auto_27441 ) ) ( not ( = ?auto_27431 ?auto_27441 ) ) ( not ( = ?auto_27445 ?auto_27441 ) ) ( not ( = ?auto_27434 ?auto_27441 ) ) ( not ( = ?auto_27438 ?auto_27441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27431 ?auto_27432 ?auto_27433 )
      ( MAKE-3CRATE-VERIFY ?auto_27430 ?auto_27431 ?auto_27432 ?auto_27433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27447 - SURFACE
      ?auto_27448 - SURFACE
      ?auto_27449 - SURFACE
      ?auto_27450 - SURFACE
      ?auto_27451 - SURFACE
    )
    :vars
    (
      ?auto_27460 - HOIST
      ?auto_27455 - PLACE
      ?auto_27457 - PLACE
      ?auto_27453 - HOIST
      ?auto_27462 - SURFACE
      ?auto_27461 - PLACE
      ?auto_27458 - HOIST
      ?auto_27452 - SURFACE
      ?auto_27454 - PLACE
      ?auto_27463 - HOIST
      ?auto_27456 - SURFACE
      ?auto_27459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27460 ?auto_27455 ) ( IS-CRATE ?auto_27451 ) ( not ( = ?auto_27450 ?auto_27451 ) ) ( not ( = ?auto_27449 ?auto_27450 ) ) ( not ( = ?auto_27449 ?auto_27451 ) ) ( not ( = ?auto_27457 ?auto_27455 ) ) ( HOIST-AT ?auto_27453 ?auto_27457 ) ( not ( = ?auto_27460 ?auto_27453 ) ) ( AVAILABLE ?auto_27453 ) ( SURFACE-AT ?auto_27451 ?auto_27457 ) ( ON ?auto_27451 ?auto_27462 ) ( CLEAR ?auto_27451 ) ( not ( = ?auto_27450 ?auto_27462 ) ) ( not ( = ?auto_27451 ?auto_27462 ) ) ( not ( = ?auto_27449 ?auto_27462 ) ) ( IS-CRATE ?auto_27450 ) ( not ( = ?auto_27461 ?auto_27455 ) ) ( not ( = ?auto_27457 ?auto_27461 ) ) ( HOIST-AT ?auto_27458 ?auto_27461 ) ( not ( = ?auto_27460 ?auto_27458 ) ) ( not ( = ?auto_27453 ?auto_27458 ) ) ( AVAILABLE ?auto_27458 ) ( SURFACE-AT ?auto_27450 ?auto_27461 ) ( ON ?auto_27450 ?auto_27452 ) ( CLEAR ?auto_27450 ) ( not ( = ?auto_27450 ?auto_27452 ) ) ( not ( = ?auto_27451 ?auto_27452 ) ) ( not ( = ?auto_27449 ?auto_27452 ) ) ( not ( = ?auto_27462 ?auto_27452 ) ) ( IS-CRATE ?auto_27449 ) ( not ( = ?auto_27448 ?auto_27449 ) ) ( not ( = ?auto_27450 ?auto_27448 ) ) ( not ( = ?auto_27451 ?auto_27448 ) ) ( not ( = ?auto_27462 ?auto_27448 ) ) ( not ( = ?auto_27452 ?auto_27448 ) ) ( not ( = ?auto_27454 ?auto_27455 ) ) ( not ( = ?auto_27457 ?auto_27454 ) ) ( not ( = ?auto_27461 ?auto_27454 ) ) ( HOIST-AT ?auto_27463 ?auto_27454 ) ( not ( = ?auto_27460 ?auto_27463 ) ) ( not ( = ?auto_27453 ?auto_27463 ) ) ( not ( = ?auto_27458 ?auto_27463 ) ) ( AVAILABLE ?auto_27463 ) ( SURFACE-AT ?auto_27449 ?auto_27454 ) ( ON ?auto_27449 ?auto_27456 ) ( CLEAR ?auto_27449 ) ( not ( = ?auto_27450 ?auto_27456 ) ) ( not ( = ?auto_27451 ?auto_27456 ) ) ( not ( = ?auto_27449 ?auto_27456 ) ) ( not ( = ?auto_27462 ?auto_27456 ) ) ( not ( = ?auto_27452 ?auto_27456 ) ) ( not ( = ?auto_27448 ?auto_27456 ) ) ( TRUCK-AT ?auto_27459 ?auto_27455 ) ( SURFACE-AT ?auto_27447 ?auto_27455 ) ( CLEAR ?auto_27447 ) ( LIFTING ?auto_27460 ?auto_27448 ) ( IS-CRATE ?auto_27448 ) ( not ( = ?auto_27447 ?auto_27448 ) ) ( not ( = ?auto_27450 ?auto_27447 ) ) ( not ( = ?auto_27451 ?auto_27447 ) ) ( not ( = ?auto_27449 ?auto_27447 ) ) ( not ( = ?auto_27462 ?auto_27447 ) ) ( not ( = ?auto_27452 ?auto_27447 ) ) ( not ( = ?auto_27456 ?auto_27447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27449 ?auto_27450 ?auto_27451 )
      ( MAKE-4CRATE-VERIFY ?auto_27447 ?auto_27448 ?auto_27449 ?auto_27450 ?auto_27451 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27464 - SURFACE
      ?auto_27465 - SURFACE
      ?auto_27466 - SURFACE
      ?auto_27467 - SURFACE
      ?auto_27468 - SURFACE
      ?auto_27469 - SURFACE
    )
    :vars
    (
      ?auto_27478 - HOIST
      ?auto_27473 - PLACE
      ?auto_27475 - PLACE
      ?auto_27471 - HOIST
      ?auto_27480 - SURFACE
      ?auto_27479 - PLACE
      ?auto_27476 - HOIST
      ?auto_27470 - SURFACE
      ?auto_27472 - PLACE
      ?auto_27481 - HOIST
      ?auto_27474 - SURFACE
      ?auto_27477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27478 ?auto_27473 ) ( IS-CRATE ?auto_27469 ) ( not ( = ?auto_27468 ?auto_27469 ) ) ( not ( = ?auto_27467 ?auto_27468 ) ) ( not ( = ?auto_27467 ?auto_27469 ) ) ( not ( = ?auto_27475 ?auto_27473 ) ) ( HOIST-AT ?auto_27471 ?auto_27475 ) ( not ( = ?auto_27478 ?auto_27471 ) ) ( AVAILABLE ?auto_27471 ) ( SURFACE-AT ?auto_27469 ?auto_27475 ) ( ON ?auto_27469 ?auto_27480 ) ( CLEAR ?auto_27469 ) ( not ( = ?auto_27468 ?auto_27480 ) ) ( not ( = ?auto_27469 ?auto_27480 ) ) ( not ( = ?auto_27467 ?auto_27480 ) ) ( IS-CRATE ?auto_27468 ) ( not ( = ?auto_27479 ?auto_27473 ) ) ( not ( = ?auto_27475 ?auto_27479 ) ) ( HOIST-AT ?auto_27476 ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27476 ) ) ( not ( = ?auto_27471 ?auto_27476 ) ) ( AVAILABLE ?auto_27476 ) ( SURFACE-AT ?auto_27468 ?auto_27479 ) ( ON ?auto_27468 ?auto_27470 ) ( CLEAR ?auto_27468 ) ( not ( = ?auto_27468 ?auto_27470 ) ) ( not ( = ?auto_27469 ?auto_27470 ) ) ( not ( = ?auto_27467 ?auto_27470 ) ) ( not ( = ?auto_27480 ?auto_27470 ) ) ( IS-CRATE ?auto_27467 ) ( not ( = ?auto_27466 ?auto_27467 ) ) ( not ( = ?auto_27468 ?auto_27466 ) ) ( not ( = ?auto_27469 ?auto_27466 ) ) ( not ( = ?auto_27480 ?auto_27466 ) ) ( not ( = ?auto_27470 ?auto_27466 ) ) ( not ( = ?auto_27472 ?auto_27473 ) ) ( not ( = ?auto_27475 ?auto_27472 ) ) ( not ( = ?auto_27479 ?auto_27472 ) ) ( HOIST-AT ?auto_27481 ?auto_27472 ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27471 ?auto_27481 ) ) ( not ( = ?auto_27476 ?auto_27481 ) ) ( AVAILABLE ?auto_27481 ) ( SURFACE-AT ?auto_27467 ?auto_27472 ) ( ON ?auto_27467 ?auto_27474 ) ( CLEAR ?auto_27467 ) ( not ( = ?auto_27468 ?auto_27474 ) ) ( not ( = ?auto_27469 ?auto_27474 ) ) ( not ( = ?auto_27467 ?auto_27474 ) ) ( not ( = ?auto_27480 ?auto_27474 ) ) ( not ( = ?auto_27470 ?auto_27474 ) ) ( not ( = ?auto_27466 ?auto_27474 ) ) ( TRUCK-AT ?auto_27477 ?auto_27473 ) ( SURFACE-AT ?auto_27465 ?auto_27473 ) ( CLEAR ?auto_27465 ) ( LIFTING ?auto_27478 ?auto_27466 ) ( IS-CRATE ?auto_27466 ) ( not ( = ?auto_27465 ?auto_27466 ) ) ( not ( = ?auto_27468 ?auto_27465 ) ) ( not ( = ?auto_27469 ?auto_27465 ) ) ( not ( = ?auto_27467 ?auto_27465 ) ) ( not ( = ?auto_27480 ?auto_27465 ) ) ( not ( = ?auto_27470 ?auto_27465 ) ) ( not ( = ?auto_27474 ?auto_27465 ) ) ( ON ?auto_27465 ?auto_27464 ) ( not ( = ?auto_27464 ?auto_27465 ) ) ( not ( = ?auto_27464 ?auto_27466 ) ) ( not ( = ?auto_27464 ?auto_27467 ) ) ( not ( = ?auto_27464 ?auto_27468 ) ) ( not ( = ?auto_27464 ?auto_27469 ) ) ( not ( = ?auto_27464 ?auto_27480 ) ) ( not ( = ?auto_27464 ?auto_27470 ) ) ( not ( = ?auto_27464 ?auto_27474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27467 ?auto_27468 ?auto_27469 )
      ( MAKE-5CRATE-VERIFY ?auto_27464 ?auto_27465 ?auto_27466 ?auto_27467 ?auto_27468 ?auto_27469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27482 - SURFACE
      ?auto_27483 - SURFACE
    )
    :vars
    (
      ?auto_27495 - HOIST
      ?auto_27489 - PLACE
      ?auto_27486 - SURFACE
      ?auto_27491 - PLACE
      ?auto_27487 - HOIST
      ?auto_27497 - SURFACE
      ?auto_27496 - PLACE
      ?auto_27492 - HOIST
      ?auto_27485 - SURFACE
      ?auto_27484 - SURFACE
      ?auto_27488 - PLACE
      ?auto_27498 - HOIST
      ?auto_27490 - SURFACE
      ?auto_27494 - TRUCK
      ?auto_27493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27495 ?auto_27489 ) ( IS-CRATE ?auto_27483 ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27486 ?auto_27482 ) ) ( not ( = ?auto_27486 ?auto_27483 ) ) ( not ( = ?auto_27491 ?auto_27489 ) ) ( HOIST-AT ?auto_27487 ?auto_27491 ) ( not ( = ?auto_27495 ?auto_27487 ) ) ( AVAILABLE ?auto_27487 ) ( SURFACE-AT ?auto_27483 ?auto_27491 ) ( ON ?auto_27483 ?auto_27497 ) ( CLEAR ?auto_27483 ) ( not ( = ?auto_27482 ?auto_27497 ) ) ( not ( = ?auto_27483 ?auto_27497 ) ) ( not ( = ?auto_27486 ?auto_27497 ) ) ( IS-CRATE ?auto_27482 ) ( not ( = ?auto_27496 ?auto_27489 ) ) ( not ( = ?auto_27491 ?auto_27496 ) ) ( HOIST-AT ?auto_27492 ?auto_27496 ) ( not ( = ?auto_27495 ?auto_27492 ) ) ( not ( = ?auto_27487 ?auto_27492 ) ) ( AVAILABLE ?auto_27492 ) ( SURFACE-AT ?auto_27482 ?auto_27496 ) ( ON ?auto_27482 ?auto_27485 ) ( CLEAR ?auto_27482 ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( not ( = ?auto_27483 ?auto_27485 ) ) ( not ( = ?auto_27486 ?auto_27485 ) ) ( not ( = ?auto_27497 ?auto_27485 ) ) ( IS-CRATE ?auto_27486 ) ( not ( = ?auto_27484 ?auto_27486 ) ) ( not ( = ?auto_27482 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( not ( = ?auto_27497 ?auto_27484 ) ) ( not ( = ?auto_27485 ?auto_27484 ) ) ( not ( = ?auto_27488 ?auto_27489 ) ) ( not ( = ?auto_27491 ?auto_27488 ) ) ( not ( = ?auto_27496 ?auto_27488 ) ) ( HOIST-AT ?auto_27498 ?auto_27488 ) ( not ( = ?auto_27495 ?auto_27498 ) ) ( not ( = ?auto_27487 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27498 ) ) ( AVAILABLE ?auto_27498 ) ( SURFACE-AT ?auto_27486 ?auto_27488 ) ( ON ?auto_27486 ?auto_27490 ) ( CLEAR ?auto_27486 ) ( not ( = ?auto_27482 ?auto_27490 ) ) ( not ( = ?auto_27483 ?auto_27490 ) ) ( not ( = ?auto_27486 ?auto_27490 ) ) ( not ( = ?auto_27497 ?auto_27490 ) ) ( not ( = ?auto_27485 ?auto_27490 ) ) ( not ( = ?auto_27484 ?auto_27490 ) ) ( TRUCK-AT ?auto_27494 ?auto_27489 ) ( SURFACE-AT ?auto_27493 ?auto_27489 ) ( CLEAR ?auto_27493 ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27493 ?auto_27484 ) ) ( not ( = ?auto_27482 ?auto_27493 ) ) ( not ( = ?auto_27483 ?auto_27493 ) ) ( not ( = ?auto_27486 ?auto_27493 ) ) ( not ( = ?auto_27497 ?auto_27493 ) ) ( not ( = ?auto_27485 ?auto_27493 ) ) ( not ( = ?auto_27490 ?auto_27493 ) ) ( AVAILABLE ?auto_27495 ) ( IN ?auto_27484 ?auto_27494 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27495 ?auto_27484 ?auto_27494 ?auto_27489 )
      ( MAKE-2CRATE ?auto_27486 ?auto_27482 ?auto_27483 )
      ( MAKE-1CRATE-VERIFY ?auto_27482 ?auto_27483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27499 - SURFACE
      ?auto_27500 - SURFACE
      ?auto_27501 - SURFACE
    )
    :vars
    (
      ?auto_27502 - HOIST
      ?auto_27503 - PLACE
      ?auto_27512 - PLACE
      ?auto_27507 - HOIST
      ?auto_27514 - SURFACE
      ?auto_27504 - PLACE
      ?auto_27513 - HOIST
      ?auto_27509 - SURFACE
      ?auto_27511 - SURFACE
      ?auto_27505 - PLACE
      ?auto_27506 - HOIST
      ?auto_27508 - SURFACE
      ?auto_27510 - TRUCK
      ?auto_27515 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27502 ?auto_27503 ) ( IS-CRATE ?auto_27501 ) ( not ( = ?auto_27500 ?auto_27501 ) ) ( not ( = ?auto_27499 ?auto_27500 ) ) ( not ( = ?auto_27499 ?auto_27501 ) ) ( not ( = ?auto_27512 ?auto_27503 ) ) ( HOIST-AT ?auto_27507 ?auto_27512 ) ( not ( = ?auto_27502 ?auto_27507 ) ) ( AVAILABLE ?auto_27507 ) ( SURFACE-AT ?auto_27501 ?auto_27512 ) ( ON ?auto_27501 ?auto_27514 ) ( CLEAR ?auto_27501 ) ( not ( = ?auto_27500 ?auto_27514 ) ) ( not ( = ?auto_27501 ?auto_27514 ) ) ( not ( = ?auto_27499 ?auto_27514 ) ) ( IS-CRATE ?auto_27500 ) ( not ( = ?auto_27504 ?auto_27503 ) ) ( not ( = ?auto_27512 ?auto_27504 ) ) ( HOIST-AT ?auto_27513 ?auto_27504 ) ( not ( = ?auto_27502 ?auto_27513 ) ) ( not ( = ?auto_27507 ?auto_27513 ) ) ( AVAILABLE ?auto_27513 ) ( SURFACE-AT ?auto_27500 ?auto_27504 ) ( ON ?auto_27500 ?auto_27509 ) ( CLEAR ?auto_27500 ) ( not ( = ?auto_27500 ?auto_27509 ) ) ( not ( = ?auto_27501 ?auto_27509 ) ) ( not ( = ?auto_27499 ?auto_27509 ) ) ( not ( = ?auto_27514 ?auto_27509 ) ) ( IS-CRATE ?auto_27499 ) ( not ( = ?auto_27511 ?auto_27499 ) ) ( not ( = ?auto_27500 ?auto_27511 ) ) ( not ( = ?auto_27501 ?auto_27511 ) ) ( not ( = ?auto_27514 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27505 ?auto_27503 ) ) ( not ( = ?auto_27512 ?auto_27505 ) ) ( not ( = ?auto_27504 ?auto_27505 ) ) ( HOIST-AT ?auto_27506 ?auto_27505 ) ( not ( = ?auto_27502 ?auto_27506 ) ) ( not ( = ?auto_27507 ?auto_27506 ) ) ( not ( = ?auto_27513 ?auto_27506 ) ) ( AVAILABLE ?auto_27506 ) ( SURFACE-AT ?auto_27499 ?auto_27505 ) ( ON ?auto_27499 ?auto_27508 ) ( CLEAR ?auto_27499 ) ( not ( = ?auto_27500 ?auto_27508 ) ) ( not ( = ?auto_27501 ?auto_27508 ) ) ( not ( = ?auto_27499 ?auto_27508 ) ) ( not ( = ?auto_27514 ?auto_27508 ) ) ( not ( = ?auto_27509 ?auto_27508 ) ) ( not ( = ?auto_27511 ?auto_27508 ) ) ( TRUCK-AT ?auto_27510 ?auto_27503 ) ( SURFACE-AT ?auto_27515 ?auto_27503 ) ( CLEAR ?auto_27515 ) ( IS-CRATE ?auto_27511 ) ( not ( = ?auto_27515 ?auto_27511 ) ) ( not ( = ?auto_27500 ?auto_27515 ) ) ( not ( = ?auto_27501 ?auto_27515 ) ) ( not ( = ?auto_27499 ?auto_27515 ) ) ( not ( = ?auto_27514 ?auto_27515 ) ) ( not ( = ?auto_27509 ?auto_27515 ) ) ( not ( = ?auto_27508 ?auto_27515 ) ) ( AVAILABLE ?auto_27502 ) ( IN ?auto_27511 ?auto_27510 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27500 ?auto_27501 )
      ( MAKE-2CRATE-VERIFY ?auto_27499 ?auto_27500 ?auto_27501 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27516 - SURFACE
      ?auto_27517 - SURFACE
      ?auto_27518 - SURFACE
      ?auto_27519 - SURFACE
    )
    :vars
    (
      ?auto_27530 - HOIST
      ?auto_27524 - PLACE
      ?auto_27527 - PLACE
      ?auto_27529 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27521 - PLACE
      ?auto_27525 - HOIST
      ?auto_27523 - SURFACE
      ?auto_27522 - PLACE
      ?auto_27526 - HOIST
      ?auto_27528 - SURFACE
      ?auto_27532 - TRUCK
      ?auto_27531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27530 ?auto_27524 ) ( IS-CRATE ?auto_27519 ) ( not ( = ?auto_27518 ?auto_27519 ) ) ( not ( = ?auto_27517 ?auto_27518 ) ) ( not ( = ?auto_27517 ?auto_27519 ) ) ( not ( = ?auto_27527 ?auto_27524 ) ) ( HOIST-AT ?auto_27529 ?auto_27527 ) ( not ( = ?auto_27530 ?auto_27529 ) ) ( AVAILABLE ?auto_27529 ) ( SURFACE-AT ?auto_27519 ?auto_27527 ) ( ON ?auto_27519 ?auto_27520 ) ( CLEAR ?auto_27519 ) ( not ( = ?auto_27518 ?auto_27520 ) ) ( not ( = ?auto_27519 ?auto_27520 ) ) ( not ( = ?auto_27517 ?auto_27520 ) ) ( IS-CRATE ?auto_27518 ) ( not ( = ?auto_27521 ?auto_27524 ) ) ( not ( = ?auto_27527 ?auto_27521 ) ) ( HOIST-AT ?auto_27525 ?auto_27521 ) ( not ( = ?auto_27530 ?auto_27525 ) ) ( not ( = ?auto_27529 ?auto_27525 ) ) ( AVAILABLE ?auto_27525 ) ( SURFACE-AT ?auto_27518 ?auto_27521 ) ( ON ?auto_27518 ?auto_27523 ) ( CLEAR ?auto_27518 ) ( not ( = ?auto_27518 ?auto_27523 ) ) ( not ( = ?auto_27519 ?auto_27523 ) ) ( not ( = ?auto_27517 ?auto_27523 ) ) ( not ( = ?auto_27520 ?auto_27523 ) ) ( IS-CRATE ?auto_27517 ) ( not ( = ?auto_27516 ?auto_27517 ) ) ( not ( = ?auto_27518 ?auto_27516 ) ) ( not ( = ?auto_27519 ?auto_27516 ) ) ( not ( = ?auto_27520 ?auto_27516 ) ) ( not ( = ?auto_27523 ?auto_27516 ) ) ( not ( = ?auto_27522 ?auto_27524 ) ) ( not ( = ?auto_27527 ?auto_27522 ) ) ( not ( = ?auto_27521 ?auto_27522 ) ) ( HOIST-AT ?auto_27526 ?auto_27522 ) ( not ( = ?auto_27530 ?auto_27526 ) ) ( not ( = ?auto_27529 ?auto_27526 ) ) ( not ( = ?auto_27525 ?auto_27526 ) ) ( AVAILABLE ?auto_27526 ) ( SURFACE-AT ?auto_27517 ?auto_27522 ) ( ON ?auto_27517 ?auto_27528 ) ( CLEAR ?auto_27517 ) ( not ( = ?auto_27518 ?auto_27528 ) ) ( not ( = ?auto_27519 ?auto_27528 ) ) ( not ( = ?auto_27517 ?auto_27528 ) ) ( not ( = ?auto_27520 ?auto_27528 ) ) ( not ( = ?auto_27523 ?auto_27528 ) ) ( not ( = ?auto_27516 ?auto_27528 ) ) ( TRUCK-AT ?auto_27532 ?auto_27524 ) ( SURFACE-AT ?auto_27531 ?auto_27524 ) ( CLEAR ?auto_27531 ) ( IS-CRATE ?auto_27516 ) ( not ( = ?auto_27531 ?auto_27516 ) ) ( not ( = ?auto_27518 ?auto_27531 ) ) ( not ( = ?auto_27519 ?auto_27531 ) ) ( not ( = ?auto_27517 ?auto_27531 ) ) ( not ( = ?auto_27520 ?auto_27531 ) ) ( not ( = ?auto_27523 ?auto_27531 ) ) ( not ( = ?auto_27528 ?auto_27531 ) ) ( AVAILABLE ?auto_27530 ) ( IN ?auto_27516 ?auto_27532 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27517 ?auto_27518 ?auto_27519 )
      ( MAKE-3CRATE-VERIFY ?auto_27516 ?auto_27517 ?auto_27518 ?auto_27519 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27533 - SURFACE
      ?auto_27534 - SURFACE
      ?auto_27535 - SURFACE
      ?auto_27536 - SURFACE
      ?auto_27537 - SURFACE
    )
    :vars
    (
      ?auto_27548 - HOIST
      ?auto_27542 - PLACE
      ?auto_27545 - PLACE
      ?auto_27547 - HOIST
      ?auto_27538 - SURFACE
      ?auto_27539 - PLACE
      ?auto_27543 - HOIST
      ?auto_27541 - SURFACE
      ?auto_27540 - PLACE
      ?auto_27544 - HOIST
      ?auto_27546 - SURFACE
      ?auto_27549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27548 ?auto_27542 ) ( IS-CRATE ?auto_27537 ) ( not ( = ?auto_27536 ?auto_27537 ) ) ( not ( = ?auto_27535 ?auto_27536 ) ) ( not ( = ?auto_27535 ?auto_27537 ) ) ( not ( = ?auto_27545 ?auto_27542 ) ) ( HOIST-AT ?auto_27547 ?auto_27545 ) ( not ( = ?auto_27548 ?auto_27547 ) ) ( AVAILABLE ?auto_27547 ) ( SURFACE-AT ?auto_27537 ?auto_27545 ) ( ON ?auto_27537 ?auto_27538 ) ( CLEAR ?auto_27537 ) ( not ( = ?auto_27536 ?auto_27538 ) ) ( not ( = ?auto_27537 ?auto_27538 ) ) ( not ( = ?auto_27535 ?auto_27538 ) ) ( IS-CRATE ?auto_27536 ) ( not ( = ?auto_27539 ?auto_27542 ) ) ( not ( = ?auto_27545 ?auto_27539 ) ) ( HOIST-AT ?auto_27543 ?auto_27539 ) ( not ( = ?auto_27548 ?auto_27543 ) ) ( not ( = ?auto_27547 ?auto_27543 ) ) ( AVAILABLE ?auto_27543 ) ( SURFACE-AT ?auto_27536 ?auto_27539 ) ( ON ?auto_27536 ?auto_27541 ) ( CLEAR ?auto_27536 ) ( not ( = ?auto_27536 ?auto_27541 ) ) ( not ( = ?auto_27537 ?auto_27541 ) ) ( not ( = ?auto_27535 ?auto_27541 ) ) ( not ( = ?auto_27538 ?auto_27541 ) ) ( IS-CRATE ?auto_27535 ) ( not ( = ?auto_27534 ?auto_27535 ) ) ( not ( = ?auto_27536 ?auto_27534 ) ) ( not ( = ?auto_27537 ?auto_27534 ) ) ( not ( = ?auto_27538 ?auto_27534 ) ) ( not ( = ?auto_27541 ?auto_27534 ) ) ( not ( = ?auto_27540 ?auto_27542 ) ) ( not ( = ?auto_27545 ?auto_27540 ) ) ( not ( = ?auto_27539 ?auto_27540 ) ) ( HOIST-AT ?auto_27544 ?auto_27540 ) ( not ( = ?auto_27548 ?auto_27544 ) ) ( not ( = ?auto_27547 ?auto_27544 ) ) ( not ( = ?auto_27543 ?auto_27544 ) ) ( AVAILABLE ?auto_27544 ) ( SURFACE-AT ?auto_27535 ?auto_27540 ) ( ON ?auto_27535 ?auto_27546 ) ( CLEAR ?auto_27535 ) ( not ( = ?auto_27536 ?auto_27546 ) ) ( not ( = ?auto_27537 ?auto_27546 ) ) ( not ( = ?auto_27535 ?auto_27546 ) ) ( not ( = ?auto_27538 ?auto_27546 ) ) ( not ( = ?auto_27541 ?auto_27546 ) ) ( not ( = ?auto_27534 ?auto_27546 ) ) ( TRUCK-AT ?auto_27549 ?auto_27542 ) ( SURFACE-AT ?auto_27533 ?auto_27542 ) ( CLEAR ?auto_27533 ) ( IS-CRATE ?auto_27534 ) ( not ( = ?auto_27533 ?auto_27534 ) ) ( not ( = ?auto_27536 ?auto_27533 ) ) ( not ( = ?auto_27537 ?auto_27533 ) ) ( not ( = ?auto_27535 ?auto_27533 ) ) ( not ( = ?auto_27538 ?auto_27533 ) ) ( not ( = ?auto_27541 ?auto_27533 ) ) ( not ( = ?auto_27546 ?auto_27533 ) ) ( AVAILABLE ?auto_27548 ) ( IN ?auto_27534 ?auto_27549 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27535 ?auto_27536 ?auto_27537 )
      ( MAKE-4CRATE-VERIFY ?auto_27533 ?auto_27534 ?auto_27535 ?auto_27536 ?auto_27537 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27550 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27552 - SURFACE
      ?auto_27553 - SURFACE
      ?auto_27554 - SURFACE
      ?auto_27555 - SURFACE
    )
    :vars
    (
      ?auto_27566 - HOIST
      ?auto_27560 - PLACE
      ?auto_27563 - PLACE
      ?auto_27565 - HOIST
      ?auto_27556 - SURFACE
      ?auto_27557 - PLACE
      ?auto_27561 - HOIST
      ?auto_27559 - SURFACE
      ?auto_27558 - PLACE
      ?auto_27562 - HOIST
      ?auto_27564 - SURFACE
      ?auto_27567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27566 ?auto_27560 ) ( IS-CRATE ?auto_27555 ) ( not ( = ?auto_27554 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27563 ?auto_27560 ) ) ( HOIST-AT ?auto_27565 ?auto_27563 ) ( not ( = ?auto_27566 ?auto_27565 ) ) ( AVAILABLE ?auto_27565 ) ( SURFACE-AT ?auto_27555 ?auto_27563 ) ( ON ?auto_27555 ?auto_27556 ) ( CLEAR ?auto_27555 ) ( not ( = ?auto_27554 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27556 ) ) ( not ( = ?auto_27553 ?auto_27556 ) ) ( IS-CRATE ?auto_27554 ) ( not ( = ?auto_27557 ?auto_27560 ) ) ( not ( = ?auto_27563 ?auto_27557 ) ) ( HOIST-AT ?auto_27561 ?auto_27557 ) ( not ( = ?auto_27566 ?auto_27561 ) ) ( not ( = ?auto_27565 ?auto_27561 ) ) ( AVAILABLE ?auto_27561 ) ( SURFACE-AT ?auto_27554 ?auto_27557 ) ( ON ?auto_27554 ?auto_27559 ) ( CLEAR ?auto_27554 ) ( not ( = ?auto_27554 ?auto_27559 ) ) ( not ( = ?auto_27555 ?auto_27559 ) ) ( not ( = ?auto_27553 ?auto_27559 ) ) ( not ( = ?auto_27556 ?auto_27559 ) ) ( IS-CRATE ?auto_27553 ) ( not ( = ?auto_27552 ?auto_27553 ) ) ( not ( = ?auto_27554 ?auto_27552 ) ) ( not ( = ?auto_27555 ?auto_27552 ) ) ( not ( = ?auto_27556 ?auto_27552 ) ) ( not ( = ?auto_27559 ?auto_27552 ) ) ( not ( = ?auto_27558 ?auto_27560 ) ) ( not ( = ?auto_27563 ?auto_27558 ) ) ( not ( = ?auto_27557 ?auto_27558 ) ) ( HOIST-AT ?auto_27562 ?auto_27558 ) ( not ( = ?auto_27566 ?auto_27562 ) ) ( not ( = ?auto_27565 ?auto_27562 ) ) ( not ( = ?auto_27561 ?auto_27562 ) ) ( AVAILABLE ?auto_27562 ) ( SURFACE-AT ?auto_27553 ?auto_27558 ) ( ON ?auto_27553 ?auto_27564 ) ( CLEAR ?auto_27553 ) ( not ( = ?auto_27554 ?auto_27564 ) ) ( not ( = ?auto_27555 ?auto_27564 ) ) ( not ( = ?auto_27553 ?auto_27564 ) ) ( not ( = ?auto_27556 ?auto_27564 ) ) ( not ( = ?auto_27559 ?auto_27564 ) ) ( not ( = ?auto_27552 ?auto_27564 ) ) ( TRUCK-AT ?auto_27567 ?auto_27560 ) ( SURFACE-AT ?auto_27551 ?auto_27560 ) ( CLEAR ?auto_27551 ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27554 ?auto_27551 ) ) ( not ( = ?auto_27555 ?auto_27551 ) ) ( not ( = ?auto_27553 ?auto_27551 ) ) ( not ( = ?auto_27556 ?auto_27551 ) ) ( not ( = ?auto_27559 ?auto_27551 ) ) ( not ( = ?auto_27564 ?auto_27551 ) ) ( AVAILABLE ?auto_27566 ) ( IN ?auto_27552 ?auto_27567 ) ( ON ?auto_27551 ?auto_27550 ) ( not ( = ?auto_27550 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27553 ) ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27550 ?auto_27555 ) ) ( not ( = ?auto_27550 ?auto_27556 ) ) ( not ( = ?auto_27550 ?auto_27559 ) ) ( not ( = ?auto_27550 ?auto_27564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27553 ?auto_27554 ?auto_27555 )
      ( MAKE-5CRATE-VERIFY ?auto_27550 ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 ?auto_27555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27568 - SURFACE
      ?auto_27569 - SURFACE
    )
    :vars
    (
      ?auto_27582 - HOIST
      ?auto_27575 - PLACE
      ?auto_27571 - SURFACE
      ?auto_27579 - PLACE
      ?auto_27581 - HOIST
      ?auto_27570 - SURFACE
      ?auto_27572 - PLACE
      ?auto_27576 - HOIST
      ?auto_27574 - SURFACE
      ?auto_27577 - SURFACE
      ?auto_27573 - PLACE
      ?auto_27578 - HOIST
      ?auto_27580 - SURFACE
      ?auto_27583 - SURFACE
      ?auto_27584 - TRUCK
      ?auto_27585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27582 ?auto_27575 ) ( IS-CRATE ?auto_27569 ) ( not ( = ?auto_27568 ?auto_27569 ) ) ( not ( = ?auto_27571 ?auto_27568 ) ) ( not ( = ?auto_27571 ?auto_27569 ) ) ( not ( = ?auto_27579 ?auto_27575 ) ) ( HOIST-AT ?auto_27581 ?auto_27579 ) ( not ( = ?auto_27582 ?auto_27581 ) ) ( AVAILABLE ?auto_27581 ) ( SURFACE-AT ?auto_27569 ?auto_27579 ) ( ON ?auto_27569 ?auto_27570 ) ( CLEAR ?auto_27569 ) ( not ( = ?auto_27568 ?auto_27570 ) ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27571 ?auto_27570 ) ) ( IS-CRATE ?auto_27568 ) ( not ( = ?auto_27572 ?auto_27575 ) ) ( not ( = ?auto_27579 ?auto_27572 ) ) ( HOIST-AT ?auto_27576 ?auto_27572 ) ( not ( = ?auto_27582 ?auto_27576 ) ) ( not ( = ?auto_27581 ?auto_27576 ) ) ( AVAILABLE ?auto_27576 ) ( SURFACE-AT ?auto_27568 ?auto_27572 ) ( ON ?auto_27568 ?auto_27574 ) ( CLEAR ?auto_27568 ) ( not ( = ?auto_27568 ?auto_27574 ) ) ( not ( = ?auto_27569 ?auto_27574 ) ) ( not ( = ?auto_27571 ?auto_27574 ) ) ( not ( = ?auto_27570 ?auto_27574 ) ) ( IS-CRATE ?auto_27571 ) ( not ( = ?auto_27577 ?auto_27571 ) ) ( not ( = ?auto_27568 ?auto_27577 ) ) ( not ( = ?auto_27569 ?auto_27577 ) ) ( not ( = ?auto_27570 ?auto_27577 ) ) ( not ( = ?auto_27574 ?auto_27577 ) ) ( not ( = ?auto_27573 ?auto_27575 ) ) ( not ( = ?auto_27579 ?auto_27573 ) ) ( not ( = ?auto_27572 ?auto_27573 ) ) ( HOIST-AT ?auto_27578 ?auto_27573 ) ( not ( = ?auto_27582 ?auto_27578 ) ) ( not ( = ?auto_27581 ?auto_27578 ) ) ( not ( = ?auto_27576 ?auto_27578 ) ) ( AVAILABLE ?auto_27578 ) ( SURFACE-AT ?auto_27571 ?auto_27573 ) ( ON ?auto_27571 ?auto_27580 ) ( CLEAR ?auto_27571 ) ( not ( = ?auto_27568 ?auto_27580 ) ) ( not ( = ?auto_27569 ?auto_27580 ) ) ( not ( = ?auto_27571 ?auto_27580 ) ) ( not ( = ?auto_27570 ?auto_27580 ) ) ( not ( = ?auto_27574 ?auto_27580 ) ) ( not ( = ?auto_27577 ?auto_27580 ) ) ( SURFACE-AT ?auto_27583 ?auto_27575 ) ( CLEAR ?auto_27583 ) ( IS-CRATE ?auto_27577 ) ( not ( = ?auto_27583 ?auto_27577 ) ) ( not ( = ?auto_27568 ?auto_27583 ) ) ( not ( = ?auto_27569 ?auto_27583 ) ) ( not ( = ?auto_27571 ?auto_27583 ) ) ( not ( = ?auto_27570 ?auto_27583 ) ) ( not ( = ?auto_27574 ?auto_27583 ) ) ( not ( = ?auto_27580 ?auto_27583 ) ) ( AVAILABLE ?auto_27582 ) ( IN ?auto_27577 ?auto_27584 ) ( TRUCK-AT ?auto_27584 ?auto_27585 ) ( not ( = ?auto_27585 ?auto_27575 ) ) ( not ( = ?auto_27579 ?auto_27585 ) ) ( not ( = ?auto_27572 ?auto_27585 ) ) ( not ( = ?auto_27573 ?auto_27585 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27584 ?auto_27585 ?auto_27575 )
      ( MAKE-2CRATE ?auto_27571 ?auto_27568 ?auto_27569 )
      ( MAKE-1CRATE-VERIFY ?auto_27568 ?auto_27569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27586 - SURFACE
      ?auto_27587 - SURFACE
      ?auto_27588 - SURFACE
    )
    :vars
    (
      ?auto_27589 - HOIST
      ?auto_27596 - PLACE
      ?auto_27602 - PLACE
      ?auto_27592 - HOIST
      ?auto_27595 - SURFACE
      ?auto_27603 - PLACE
      ?auto_27591 - HOIST
      ?auto_27593 - SURFACE
      ?auto_27601 - SURFACE
      ?auto_27590 - PLACE
      ?auto_27598 - HOIST
      ?auto_27600 - SURFACE
      ?auto_27597 - SURFACE
      ?auto_27599 - TRUCK
      ?auto_27594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27589 ?auto_27596 ) ( IS-CRATE ?auto_27588 ) ( not ( = ?auto_27587 ?auto_27588 ) ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27588 ) ) ( not ( = ?auto_27602 ?auto_27596 ) ) ( HOIST-AT ?auto_27592 ?auto_27602 ) ( not ( = ?auto_27589 ?auto_27592 ) ) ( AVAILABLE ?auto_27592 ) ( SURFACE-AT ?auto_27588 ?auto_27602 ) ( ON ?auto_27588 ?auto_27595 ) ( CLEAR ?auto_27588 ) ( not ( = ?auto_27587 ?auto_27595 ) ) ( not ( = ?auto_27588 ?auto_27595 ) ) ( not ( = ?auto_27586 ?auto_27595 ) ) ( IS-CRATE ?auto_27587 ) ( not ( = ?auto_27603 ?auto_27596 ) ) ( not ( = ?auto_27602 ?auto_27603 ) ) ( HOIST-AT ?auto_27591 ?auto_27603 ) ( not ( = ?auto_27589 ?auto_27591 ) ) ( not ( = ?auto_27592 ?auto_27591 ) ) ( AVAILABLE ?auto_27591 ) ( SURFACE-AT ?auto_27587 ?auto_27603 ) ( ON ?auto_27587 ?auto_27593 ) ( CLEAR ?auto_27587 ) ( not ( = ?auto_27587 ?auto_27593 ) ) ( not ( = ?auto_27588 ?auto_27593 ) ) ( not ( = ?auto_27586 ?auto_27593 ) ) ( not ( = ?auto_27595 ?auto_27593 ) ) ( IS-CRATE ?auto_27586 ) ( not ( = ?auto_27601 ?auto_27586 ) ) ( not ( = ?auto_27587 ?auto_27601 ) ) ( not ( = ?auto_27588 ?auto_27601 ) ) ( not ( = ?auto_27595 ?auto_27601 ) ) ( not ( = ?auto_27593 ?auto_27601 ) ) ( not ( = ?auto_27590 ?auto_27596 ) ) ( not ( = ?auto_27602 ?auto_27590 ) ) ( not ( = ?auto_27603 ?auto_27590 ) ) ( HOIST-AT ?auto_27598 ?auto_27590 ) ( not ( = ?auto_27589 ?auto_27598 ) ) ( not ( = ?auto_27592 ?auto_27598 ) ) ( not ( = ?auto_27591 ?auto_27598 ) ) ( AVAILABLE ?auto_27598 ) ( SURFACE-AT ?auto_27586 ?auto_27590 ) ( ON ?auto_27586 ?auto_27600 ) ( CLEAR ?auto_27586 ) ( not ( = ?auto_27587 ?auto_27600 ) ) ( not ( = ?auto_27588 ?auto_27600 ) ) ( not ( = ?auto_27586 ?auto_27600 ) ) ( not ( = ?auto_27595 ?auto_27600 ) ) ( not ( = ?auto_27593 ?auto_27600 ) ) ( not ( = ?auto_27601 ?auto_27600 ) ) ( SURFACE-AT ?auto_27597 ?auto_27596 ) ( CLEAR ?auto_27597 ) ( IS-CRATE ?auto_27601 ) ( not ( = ?auto_27597 ?auto_27601 ) ) ( not ( = ?auto_27587 ?auto_27597 ) ) ( not ( = ?auto_27588 ?auto_27597 ) ) ( not ( = ?auto_27586 ?auto_27597 ) ) ( not ( = ?auto_27595 ?auto_27597 ) ) ( not ( = ?auto_27593 ?auto_27597 ) ) ( not ( = ?auto_27600 ?auto_27597 ) ) ( AVAILABLE ?auto_27589 ) ( IN ?auto_27601 ?auto_27599 ) ( TRUCK-AT ?auto_27599 ?auto_27594 ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( not ( = ?auto_27602 ?auto_27594 ) ) ( not ( = ?auto_27603 ?auto_27594 ) ) ( not ( = ?auto_27590 ?auto_27594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27587 ?auto_27588 )
      ( MAKE-2CRATE-VERIFY ?auto_27586 ?auto_27587 ?auto_27588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27604 - SURFACE
      ?auto_27605 - SURFACE
      ?auto_27606 - SURFACE
      ?auto_27607 - SURFACE
    )
    :vars
    (
      ?auto_27616 - HOIST
      ?auto_27618 - PLACE
      ?auto_27619 - PLACE
      ?auto_27615 - HOIST
      ?auto_27621 - SURFACE
      ?auto_27612 - PLACE
      ?auto_27620 - HOIST
      ?auto_27611 - SURFACE
      ?auto_27614 - PLACE
      ?auto_27617 - HOIST
      ?auto_27610 - SURFACE
      ?auto_27608 - SURFACE
      ?auto_27613 - TRUCK
      ?auto_27609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27616 ?auto_27618 ) ( IS-CRATE ?auto_27607 ) ( not ( = ?auto_27606 ?auto_27607 ) ) ( not ( = ?auto_27605 ?auto_27606 ) ) ( not ( = ?auto_27605 ?auto_27607 ) ) ( not ( = ?auto_27619 ?auto_27618 ) ) ( HOIST-AT ?auto_27615 ?auto_27619 ) ( not ( = ?auto_27616 ?auto_27615 ) ) ( AVAILABLE ?auto_27615 ) ( SURFACE-AT ?auto_27607 ?auto_27619 ) ( ON ?auto_27607 ?auto_27621 ) ( CLEAR ?auto_27607 ) ( not ( = ?auto_27606 ?auto_27621 ) ) ( not ( = ?auto_27607 ?auto_27621 ) ) ( not ( = ?auto_27605 ?auto_27621 ) ) ( IS-CRATE ?auto_27606 ) ( not ( = ?auto_27612 ?auto_27618 ) ) ( not ( = ?auto_27619 ?auto_27612 ) ) ( HOIST-AT ?auto_27620 ?auto_27612 ) ( not ( = ?auto_27616 ?auto_27620 ) ) ( not ( = ?auto_27615 ?auto_27620 ) ) ( AVAILABLE ?auto_27620 ) ( SURFACE-AT ?auto_27606 ?auto_27612 ) ( ON ?auto_27606 ?auto_27611 ) ( CLEAR ?auto_27606 ) ( not ( = ?auto_27606 ?auto_27611 ) ) ( not ( = ?auto_27607 ?auto_27611 ) ) ( not ( = ?auto_27605 ?auto_27611 ) ) ( not ( = ?auto_27621 ?auto_27611 ) ) ( IS-CRATE ?auto_27605 ) ( not ( = ?auto_27604 ?auto_27605 ) ) ( not ( = ?auto_27606 ?auto_27604 ) ) ( not ( = ?auto_27607 ?auto_27604 ) ) ( not ( = ?auto_27621 ?auto_27604 ) ) ( not ( = ?auto_27611 ?auto_27604 ) ) ( not ( = ?auto_27614 ?auto_27618 ) ) ( not ( = ?auto_27619 ?auto_27614 ) ) ( not ( = ?auto_27612 ?auto_27614 ) ) ( HOIST-AT ?auto_27617 ?auto_27614 ) ( not ( = ?auto_27616 ?auto_27617 ) ) ( not ( = ?auto_27615 ?auto_27617 ) ) ( not ( = ?auto_27620 ?auto_27617 ) ) ( AVAILABLE ?auto_27617 ) ( SURFACE-AT ?auto_27605 ?auto_27614 ) ( ON ?auto_27605 ?auto_27610 ) ( CLEAR ?auto_27605 ) ( not ( = ?auto_27606 ?auto_27610 ) ) ( not ( = ?auto_27607 ?auto_27610 ) ) ( not ( = ?auto_27605 ?auto_27610 ) ) ( not ( = ?auto_27621 ?auto_27610 ) ) ( not ( = ?auto_27611 ?auto_27610 ) ) ( not ( = ?auto_27604 ?auto_27610 ) ) ( SURFACE-AT ?auto_27608 ?auto_27618 ) ( CLEAR ?auto_27608 ) ( IS-CRATE ?auto_27604 ) ( not ( = ?auto_27608 ?auto_27604 ) ) ( not ( = ?auto_27606 ?auto_27608 ) ) ( not ( = ?auto_27607 ?auto_27608 ) ) ( not ( = ?auto_27605 ?auto_27608 ) ) ( not ( = ?auto_27621 ?auto_27608 ) ) ( not ( = ?auto_27611 ?auto_27608 ) ) ( not ( = ?auto_27610 ?auto_27608 ) ) ( AVAILABLE ?auto_27616 ) ( IN ?auto_27604 ?auto_27613 ) ( TRUCK-AT ?auto_27613 ?auto_27609 ) ( not ( = ?auto_27609 ?auto_27618 ) ) ( not ( = ?auto_27619 ?auto_27609 ) ) ( not ( = ?auto_27612 ?auto_27609 ) ) ( not ( = ?auto_27614 ?auto_27609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27605 ?auto_27606 ?auto_27607 )
      ( MAKE-3CRATE-VERIFY ?auto_27604 ?auto_27605 ?auto_27606 ?auto_27607 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27622 - SURFACE
      ?auto_27623 - SURFACE
      ?auto_27624 - SURFACE
      ?auto_27625 - SURFACE
      ?auto_27626 - SURFACE
    )
    :vars
    (
      ?auto_27634 - HOIST
      ?auto_27636 - PLACE
      ?auto_27637 - PLACE
      ?auto_27633 - HOIST
      ?auto_27639 - SURFACE
      ?auto_27630 - PLACE
      ?auto_27638 - HOIST
      ?auto_27629 - SURFACE
      ?auto_27632 - PLACE
      ?auto_27635 - HOIST
      ?auto_27628 - SURFACE
      ?auto_27631 - TRUCK
      ?auto_27627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27634 ?auto_27636 ) ( IS-CRATE ?auto_27626 ) ( not ( = ?auto_27625 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27637 ?auto_27636 ) ) ( HOIST-AT ?auto_27633 ?auto_27637 ) ( not ( = ?auto_27634 ?auto_27633 ) ) ( AVAILABLE ?auto_27633 ) ( SURFACE-AT ?auto_27626 ?auto_27637 ) ( ON ?auto_27626 ?auto_27639 ) ( CLEAR ?auto_27626 ) ( not ( = ?auto_27625 ?auto_27639 ) ) ( not ( = ?auto_27626 ?auto_27639 ) ) ( not ( = ?auto_27624 ?auto_27639 ) ) ( IS-CRATE ?auto_27625 ) ( not ( = ?auto_27630 ?auto_27636 ) ) ( not ( = ?auto_27637 ?auto_27630 ) ) ( HOIST-AT ?auto_27638 ?auto_27630 ) ( not ( = ?auto_27634 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27638 ) ) ( AVAILABLE ?auto_27638 ) ( SURFACE-AT ?auto_27625 ?auto_27630 ) ( ON ?auto_27625 ?auto_27629 ) ( CLEAR ?auto_27625 ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27624 ?auto_27629 ) ) ( not ( = ?auto_27639 ?auto_27629 ) ) ( IS-CRATE ?auto_27624 ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27625 ?auto_27623 ) ) ( not ( = ?auto_27626 ?auto_27623 ) ) ( not ( = ?auto_27639 ?auto_27623 ) ) ( not ( = ?auto_27629 ?auto_27623 ) ) ( not ( = ?auto_27632 ?auto_27636 ) ) ( not ( = ?auto_27637 ?auto_27632 ) ) ( not ( = ?auto_27630 ?auto_27632 ) ) ( HOIST-AT ?auto_27635 ?auto_27632 ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( not ( = ?auto_27633 ?auto_27635 ) ) ( not ( = ?auto_27638 ?auto_27635 ) ) ( AVAILABLE ?auto_27635 ) ( SURFACE-AT ?auto_27624 ?auto_27632 ) ( ON ?auto_27624 ?auto_27628 ) ( CLEAR ?auto_27624 ) ( not ( = ?auto_27625 ?auto_27628 ) ) ( not ( = ?auto_27626 ?auto_27628 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( not ( = ?auto_27639 ?auto_27628 ) ) ( not ( = ?auto_27629 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27628 ) ) ( SURFACE-AT ?auto_27622 ?auto_27636 ) ( CLEAR ?auto_27622 ) ( IS-CRATE ?auto_27623 ) ( not ( = ?auto_27622 ?auto_27623 ) ) ( not ( = ?auto_27625 ?auto_27622 ) ) ( not ( = ?auto_27626 ?auto_27622 ) ) ( not ( = ?auto_27624 ?auto_27622 ) ) ( not ( = ?auto_27639 ?auto_27622 ) ) ( not ( = ?auto_27629 ?auto_27622 ) ) ( not ( = ?auto_27628 ?auto_27622 ) ) ( AVAILABLE ?auto_27634 ) ( IN ?auto_27623 ?auto_27631 ) ( TRUCK-AT ?auto_27631 ?auto_27627 ) ( not ( = ?auto_27627 ?auto_27636 ) ) ( not ( = ?auto_27637 ?auto_27627 ) ) ( not ( = ?auto_27630 ?auto_27627 ) ) ( not ( = ?auto_27632 ?auto_27627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27624 ?auto_27625 ?auto_27626 )
      ( MAKE-4CRATE-VERIFY ?auto_27622 ?auto_27623 ?auto_27624 ?auto_27625 ?auto_27626 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27640 - SURFACE
      ?auto_27641 - SURFACE
      ?auto_27642 - SURFACE
      ?auto_27643 - SURFACE
      ?auto_27644 - SURFACE
      ?auto_27645 - SURFACE
    )
    :vars
    (
      ?auto_27653 - HOIST
      ?auto_27655 - PLACE
      ?auto_27656 - PLACE
      ?auto_27652 - HOIST
      ?auto_27658 - SURFACE
      ?auto_27649 - PLACE
      ?auto_27657 - HOIST
      ?auto_27648 - SURFACE
      ?auto_27651 - PLACE
      ?auto_27654 - HOIST
      ?auto_27647 - SURFACE
      ?auto_27650 - TRUCK
      ?auto_27646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27653 ?auto_27655 ) ( IS-CRATE ?auto_27645 ) ( not ( = ?auto_27644 ?auto_27645 ) ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27645 ) ) ( not ( = ?auto_27656 ?auto_27655 ) ) ( HOIST-AT ?auto_27652 ?auto_27656 ) ( not ( = ?auto_27653 ?auto_27652 ) ) ( AVAILABLE ?auto_27652 ) ( SURFACE-AT ?auto_27645 ?auto_27656 ) ( ON ?auto_27645 ?auto_27658 ) ( CLEAR ?auto_27645 ) ( not ( = ?auto_27644 ?auto_27658 ) ) ( not ( = ?auto_27645 ?auto_27658 ) ) ( not ( = ?auto_27643 ?auto_27658 ) ) ( IS-CRATE ?auto_27644 ) ( not ( = ?auto_27649 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27649 ) ) ( HOIST-AT ?auto_27657 ?auto_27649 ) ( not ( = ?auto_27653 ?auto_27657 ) ) ( not ( = ?auto_27652 ?auto_27657 ) ) ( AVAILABLE ?auto_27657 ) ( SURFACE-AT ?auto_27644 ?auto_27649 ) ( ON ?auto_27644 ?auto_27648 ) ( CLEAR ?auto_27644 ) ( not ( = ?auto_27644 ?auto_27648 ) ) ( not ( = ?auto_27645 ?auto_27648 ) ) ( not ( = ?auto_27643 ?auto_27648 ) ) ( not ( = ?auto_27658 ?auto_27648 ) ) ( IS-CRATE ?auto_27643 ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27644 ?auto_27642 ) ) ( not ( = ?auto_27645 ?auto_27642 ) ) ( not ( = ?auto_27658 ?auto_27642 ) ) ( not ( = ?auto_27648 ?auto_27642 ) ) ( not ( = ?auto_27651 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27651 ) ) ( not ( = ?auto_27649 ?auto_27651 ) ) ( HOIST-AT ?auto_27654 ?auto_27651 ) ( not ( = ?auto_27653 ?auto_27654 ) ) ( not ( = ?auto_27652 ?auto_27654 ) ) ( not ( = ?auto_27657 ?auto_27654 ) ) ( AVAILABLE ?auto_27654 ) ( SURFACE-AT ?auto_27643 ?auto_27651 ) ( ON ?auto_27643 ?auto_27647 ) ( CLEAR ?auto_27643 ) ( not ( = ?auto_27644 ?auto_27647 ) ) ( not ( = ?auto_27645 ?auto_27647 ) ) ( not ( = ?auto_27643 ?auto_27647 ) ) ( not ( = ?auto_27658 ?auto_27647 ) ) ( not ( = ?auto_27648 ?auto_27647 ) ) ( not ( = ?auto_27642 ?auto_27647 ) ) ( SURFACE-AT ?auto_27641 ?auto_27655 ) ( CLEAR ?auto_27641 ) ( IS-CRATE ?auto_27642 ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27644 ?auto_27641 ) ) ( not ( = ?auto_27645 ?auto_27641 ) ) ( not ( = ?auto_27643 ?auto_27641 ) ) ( not ( = ?auto_27658 ?auto_27641 ) ) ( not ( = ?auto_27648 ?auto_27641 ) ) ( not ( = ?auto_27647 ?auto_27641 ) ) ( AVAILABLE ?auto_27653 ) ( IN ?auto_27642 ?auto_27650 ) ( TRUCK-AT ?auto_27650 ?auto_27646 ) ( not ( = ?auto_27646 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27646 ) ) ( not ( = ?auto_27649 ?auto_27646 ) ) ( not ( = ?auto_27651 ?auto_27646 ) ) ( ON ?auto_27641 ?auto_27640 ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27645 ) ) ( not ( = ?auto_27640 ?auto_27658 ) ) ( not ( = ?auto_27640 ?auto_27648 ) ) ( not ( = ?auto_27640 ?auto_27647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27643 ?auto_27644 ?auto_27645 )
      ( MAKE-5CRATE-VERIFY ?auto_27640 ?auto_27641 ?auto_27642 ?auto_27643 ?auto_27644 ?auto_27645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27659 - SURFACE
      ?auto_27660 - SURFACE
    )
    :vars
    (
      ?auto_27671 - HOIST
      ?auto_27673 - PLACE
      ?auto_27666 - SURFACE
      ?auto_27674 - PLACE
      ?auto_27670 - HOIST
      ?auto_27676 - SURFACE
      ?auto_27667 - PLACE
      ?auto_27675 - HOIST
      ?auto_27665 - SURFACE
      ?auto_27663 - SURFACE
      ?auto_27669 - PLACE
      ?auto_27672 - HOIST
      ?auto_27664 - SURFACE
      ?auto_27661 - SURFACE
      ?auto_27668 - TRUCK
      ?auto_27662 - PLACE
      ?auto_27677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27671 ?auto_27673 ) ( IS-CRATE ?auto_27660 ) ( not ( = ?auto_27659 ?auto_27660 ) ) ( not ( = ?auto_27666 ?auto_27659 ) ) ( not ( = ?auto_27666 ?auto_27660 ) ) ( not ( = ?auto_27674 ?auto_27673 ) ) ( HOIST-AT ?auto_27670 ?auto_27674 ) ( not ( = ?auto_27671 ?auto_27670 ) ) ( AVAILABLE ?auto_27670 ) ( SURFACE-AT ?auto_27660 ?auto_27674 ) ( ON ?auto_27660 ?auto_27676 ) ( CLEAR ?auto_27660 ) ( not ( = ?auto_27659 ?auto_27676 ) ) ( not ( = ?auto_27660 ?auto_27676 ) ) ( not ( = ?auto_27666 ?auto_27676 ) ) ( IS-CRATE ?auto_27659 ) ( not ( = ?auto_27667 ?auto_27673 ) ) ( not ( = ?auto_27674 ?auto_27667 ) ) ( HOIST-AT ?auto_27675 ?auto_27667 ) ( not ( = ?auto_27671 ?auto_27675 ) ) ( not ( = ?auto_27670 ?auto_27675 ) ) ( AVAILABLE ?auto_27675 ) ( SURFACE-AT ?auto_27659 ?auto_27667 ) ( ON ?auto_27659 ?auto_27665 ) ( CLEAR ?auto_27659 ) ( not ( = ?auto_27659 ?auto_27665 ) ) ( not ( = ?auto_27660 ?auto_27665 ) ) ( not ( = ?auto_27666 ?auto_27665 ) ) ( not ( = ?auto_27676 ?auto_27665 ) ) ( IS-CRATE ?auto_27666 ) ( not ( = ?auto_27663 ?auto_27666 ) ) ( not ( = ?auto_27659 ?auto_27663 ) ) ( not ( = ?auto_27660 ?auto_27663 ) ) ( not ( = ?auto_27676 ?auto_27663 ) ) ( not ( = ?auto_27665 ?auto_27663 ) ) ( not ( = ?auto_27669 ?auto_27673 ) ) ( not ( = ?auto_27674 ?auto_27669 ) ) ( not ( = ?auto_27667 ?auto_27669 ) ) ( HOIST-AT ?auto_27672 ?auto_27669 ) ( not ( = ?auto_27671 ?auto_27672 ) ) ( not ( = ?auto_27670 ?auto_27672 ) ) ( not ( = ?auto_27675 ?auto_27672 ) ) ( AVAILABLE ?auto_27672 ) ( SURFACE-AT ?auto_27666 ?auto_27669 ) ( ON ?auto_27666 ?auto_27664 ) ( CLEAR ?auto_27666 ) ( not ( = ?auto_27659 ?auto_27664 ) ) ( not ( = ?auto_27660 ?auto_27664 ) ) ( not ( = ?auto_27666 ?auto_27664 ) ) ( not ( = ?auto_27676 ?auto_27664 ) ) ( not ( = ?auto_27665 ?auto_27664 ) ) ( not ( = ?auto_27663 ?auto_27664 ) ) ( SURFACE-AT ?auto_27661 ?auto_27673 ) ( CLEAR ?auto_27661 ) ( IS-CRATE ?auto_27663 ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27659 ?auto_27661 ) ) ( not ( = ?auto_27660 ?auto_27661 ) ) ( not ( = ?auto_27666 ?auto_27661 ) ) ( not ( = ?auto_27676 ?auto_27661 ) ) ( not ( = ?auto_27665 ?auto_27661 ) ) ( not ( = ?auto_27664 ?auto_27661 ) ) ( AVAILABLE ?auto_27671 ) ( TRUCK-AT ?auto_27668 ?auto_27662 ) ( not ( = ?auto_27662 ?auto_27673 ) ) ( not ( = ?auto_27674 ?auto_27662 ) ) ( not ( = ?auto_27667 ?auto_27662 ) ) ( not ( = ?auto_27669 ?auto_27662 ) ) ( HOIST-AT ?auto_27677 ?auto_27662 ) ( LIFTING ?auto_27677 ?auto_27663 ) ( not ( = ?auto_27671 ?auto_27677 ) ) ( not ( = ?auto_27670 ?auto_27677 ) ) ( not ( = ?auto_27675 ?auto_27677 ) ) ( not ( = ?auto_27672 ?auto_27677 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27677 ?auto_27663 ?auto_27668 ?auto_27662 )
      ( MAKE-2CRATE ?auto_27666 ?auto_27659 ?auto_27660 )
      ( MAKE-1CRATE-VERIFY ?auto_27659 ?auto_27660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27678 - SURFACE
      ?auto_27679 - SURFACE
      ?auto_27680 - SURFACE
    )
    :vars
    (
      ?auto_27693 - HOIST
      ?auto_27685 - PLACE
      ?auto_27686 - PLACE
      ?auto_27694 - HOIST
      ?auto_27683 - SURFACE
      ?auto_27695 - PLACE
      ?auto_27690 - HOIST
      ?auto_27682 - SURFACE
      ?auto_27689 - SURFACE
      ?auto_27696 - PLACE
      ?auto_27691 - HOIST
      ?auto_27692 - SURFACE
      ?auto_27684 - SURFACE
      ?auto_27681 - TRUCK
      ?auto_27687 - PLACE
      ?auto_27688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27693 ?auto_27685 ) ( IS-CRATE ?auto_27680 ) ( not ( = ?auto_27679 ?auto_27680 ) ) ( not ( = ?auto_27678 ?auto_27679 ) ) ( not ( = ?auto_27678 ?auto_27680 ) ) ( not ( = ?auto_27686 ?auto_27685 ) ) ( HOIST-AT ?auto_27694 ?auto_27686 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( AVAILABLE ?auto_27694 ) ( SURFACE-AT ?auto_27680 ?auto_27686 ) ( ON ?auto_27680 ?auto_27683 ) ( CLEAR ?auto_27680 ) ( not ( = ?auto_27679 ?auto_27683 ) ) ( not ( = ?auto_27680 ?auto_27683 ) ) ( not ( = ?auto_27678 ?auto_27683 ) ) ( IS-CRATE ?auto_27679 ) ( not ( = ?auto_27695 ?auto_27685 ) ) ( not ( = ?auto_27686 ?auto_27695 ) ) ( HOIST-AT ?auto_27690 ?auto_27695 ) ( not ( = ?auto_27693 ?auto_27690 ) ) ( not ( = ?auto_27694 ?auto_27690 ) ) ( AVAILABLE ?auto_27690 ) ( SURFACE-AT ?auto_27679 ?auto_27695 ) ( ON ?auto_27679 ?auto_27682 ) ( CLEAR ?auto_27679 ) ( not ( = ?auto_27679 ?auto_27682 ) ) ( not ( = ?auto_27680 ?auto_27682 ) ) ( not ( = ?auto_27678 ?auto_27682 ) ) ( not ( = ?auto_27683 ?auto_27682 ) ) ( IS-CRATE ?auto_27678 ) ( not ( = ?auto_27689 ?auto_27678 ) ) ( not ( = ?auto_27679 ?auto_27689 ) ) ( not ( = ?auto_27680 ?auto_27689 ) ) ( not ( = ?auto_27683 ?auto_27689 ) ) ( not ( = ?auto_27682 ?auto_27689 ) ) ( not ( = ?auto_27696 ?auto_27685 ) ) ( not ( = ?auto_27686 ?auto_27696 ) ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( HOIST-AT ?auto_27691 ?auto_27696 ) ( not ( = ?auto_27693 ?auto_27691 ) ) ( not ( = ?auto_27694 ?auto_27691 ) ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( AVAILABLE ?auto_27691 ) ( SURFACE-AT ?auto_27678 ?auto_27696 ) ( ON ?auto_27678 ?auto_27692 ) ( CLEAR ?auto_27678 ) ( not ( = ?auto_27679 ?auto_27692 ) ) ( not ( = ?auto_27680 ?auto_27692 ) ) ( not ( = ?auto_27678 ?auto_27692 ) ) ( not ( = ?auto_27683 ?auto_27692 ) ) ( not ( = ?auto_27682 ?auto_27692 ) ) ( not ( = ?auto_27689 ?auto_27692 ) ) ( SURFACE-AT ?auto_27684 ?auto_27685 ) ( CLEAR ?auto_27684 ) ( IS-CRATE ?auto_27689 ) ( not ( = ?auto_27684 ?auto_27689 ) ) ( not ( = ?auto_27679 ?auto_27684 ) ) ( not ( = ?auto_27680 ?auto_27684 ) ) ( not ( = ?auto_27678 ?auto_27684 ) ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27682 ?auto_27684 ) ) ( not ( = ?auto_27692 ?auto_27684 ) ) ( AVAILABLE ?auto_27693 ) ( TRUCK-AT ?auto_27681 ?auto_27687 ) ( not ( = ?auto_27687 ?auto_27685 ) ) ( not ( = ?auto_27686 ?auto_27687 ) ) ( not ( = ?auto_27695 ?auto_27687 ) ) ( not ( = ?auto_27696 ?auto_27687 ) ) ( HOIST-AT ?auto_27688 ?auto_27687 ) ( LIFTING ?auto_27688 ?auto_27689 ) ( not ( = ?auto_27693 ?auto_27688 ) ) ( not ( = ?auto_27694 ?auto_27688 ) ) ( not ( = ?auto_27690 ?auto_27688 ) ) ( not ( = ?auto_27691 ?auto_27688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27679 ?auto_27680 )
      ( MAKE-2CRATE-VERIFY ?auto_27678 ?auto_27679 ?auto_27680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27697 - SURFACE
      ?auto_27698 - SURFACE
      ?auto_27699 - SURFACE
      ?auto_27700 - SURFACE
    )
    :vars
    (
      ?auto_27705 - HOIST
      ?auto_27711 - PLACE
      ?auto_27714 - PLACE
      ?auto_27708 - HOIST
      ?auto_27709 - SURFACE
      ?auto_27710 - PLACE
      ?auto_27704 - HOIST
      ?auto_27713 - SURFACE
      ?auto_27702 - PLACE
      ?auto_27706 - HOIST
      ?auto_27712 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27715 - TRUCK
      ?auto_27701 - PLACE
      ?auto_27707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27705 ?auto_27711 ) ( IS-CRATE ?auto_27700 ) ( not ( = ?auto_27699 ?auto_27700 ) ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27700 ) ) ( not ( = ?auto_27714 ?auto_27711 ) ) ( HOIST-AT ?auto_27708 ?auto_27714 ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( AVAILABLE ?auto_27708 ) ( SURFACE-AT ?auto_27700 ?auto_27714 ) ( ON ?auto_27700 ?auto_27709 ) ( CLEAR ?auto_27700 ) ( not ( = ?auto_27699 ?auto_27709 ) ) ( not ( = ?auto_27700 ?auto_27709 ) ) ( not ( = ?auto_27698 ?auto_27709 ) ) ( IS-CRATE ?auto_27699 ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27714 ?auto_27710 ) ) ( HOIST-AT ?auto_27704 ?auto_27710 ) ( not ( = ?auto_27705 ?auto_27704 ) ) ( not ( = ?auto_27708 ?auto_27704 ) ) ( AVAILABLE ?auto_27704 ) ( SURFACE-AT ?auto_27699 ?auto_27710 ) ( ON ?auto_27699 ?auto_27713 ) ( CLEAR ?auto_27699 ) ( not ( = ?auto_27699 ?auto_27713 ) ) ( not ( = ?auto_27700 ?auto_27713 ) ) ( not ( = ?auto_27698 ?auto_27713 ) ) ( not ( = ?auto_27709 ?auto_27713 ) ) ( IS-CRATE ?auto_27698 ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( not ( = ?auto_27699 ?auto_27697 ) ) ( not ( = ?auto_27700 ?auto_27697 ) ) ( not ( = ?auto_27709 ?auto_27697 ) ) ( not ( = ?auto_27713 ?auto_27697 ) ) ( not ( = ?auto_27702 ?auto_27711 ) ) ( not ( = ?auto_27714 ?auto_27702 ) ) ( not ( = ?auto_27710 ?auto_27702 ) ) ( HOIST-AT ?auto_27706 ?auto_27702 ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27708 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( AVAILABLE ?auto_27706 ) ( SURFACE-AT ?auto_27698 ?auto_27702 ) ( ON ?auto_27698 ?auto_27712 ) ( CLEAR ?auto_27698 ) ( not ( = ?auto_27699 ?auto_27712 ) ) ( not ( = ?auto_27700 ?auto_27712 ) ) ( not ( = ?auto_27698 ?auto_27712 ) ) ( not ( = ?auto_27709 ?auto_27712 ) ) ( not ( = ?auto_27713 ?auto_27712 ) ) ( not ( = ?auto_27697 ?auto_27712 ) ) ( SURFACE-AT ?auto_27703 ?auto_27711 ) ( CLEAR ?auto_27703 ) ( IS-CRATE ?auto_27697 ) ( not ( = ?auto_27703 ?auto_27697 ) ) ( not ( = ?auto_27699 ?auto_27703 ) ) ( not ( = ?auto_27700 ?auto_27703 ) ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( not ( = ?auto_27709 ?auto_27703 ) ) ( not ( = ?auto_27713 ?auto_27703 ) ) ( not ( = ?auto_27712 ?auto_27703 ) ) ( AVAILABLE ?auto_27705 ) ( TRUCK-AT ?auto_27715 ?auto_27701 ) ( not ( = ?auto_27701 ?auto_27711 ) ) ( not ( = ?auto_27714 ?auto_27701 ) ) ( not ( = ?auto_27710 ?auto_27701 ) ) ( not ( = ?auto_27702 ?auto_27701 ) ) ( HOIST-AT ?auto_27707 ?auto_27701 ) ( LIFTING ?auto_27707 ?auto_27697 ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27708 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27698 ?auto_27699 ?auto_27700 )
      ( MAKE-3CRATE-VERIFY ?auto_27697 ?auto_27698 ?auto_27699 ?auto_27700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27716 - SURFACE
      ?auto_27717 - SURFACE
      ?auto_27718 - SURFACE
      ?auto_27719 - SURFACE
      ?auto_27720 - SURFACE
    )
    :vars
    (
      ?auto_27724 - HOIST
      ?auto_27730 - PLACE
      ?auto_27733 - PLACE
      ?auto_27727 - HOIST
      ?auto_27728 - SURFACE
      ?auto_27729 - PLACE
      ?auto_27723 - HOIST
      ?auto_27732 - SURFACE
      ?auto_27722 - PLACE
      ?auto_27725 - HOIST
      ?auto_27731 - SURFACE
      ?auto_27734 - TRUCK
      ?auto_27721 - PLACE
      ?auto_27726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27724 ?auto_27730 ) ( IS-CRATE ?auto_27720 ) ( not ( = ?auto_27719 ?auto_27720 ) ) ( not ( = ?auto_27718 ?auto_27719 ) ) ( not ( = ?auto_27718 ?auto_27720 ) ) ( not ( = ?auto_27733 ?auto_27730 ) ) ( HOIST-AT ?auto_27727 ?auto_27733 ) ( not ( = ?auto_27724 ?auto_27727 ) ) ( AVAILABLE ?auto_27727 ) ( SURFACE-AT ?auto_27720 ?auto_27733 ) ( ON ?auto_27720 ?auto_27728 ) ( CLEAR ?auto_27720 ) ( not ( = ?auto_27719 ?auto_27728 ) ) ( not ( = ?auto_27720 ?auto_27728 ) ) ( not ( = ?auto_27718 ?auto_27728 ) ) ( IS-CRATE ?auto_27719 ) ( not ( = ?auto_27729 ?auto_27730 ) ) ( not ( = ?auto_27733 ?auto_27729 ) ) ( HOIST-AT ?auto_27723 ?auto_27729 ) ( not ( = ?auto_27724 ?auto_27723 ) ) ( not ( = ?auto_27727 ?auto_27723 ) ) ( AVAILABLE ?auto_27723 ) ( SURFACE-AT ?auto_27719 ?auto_27729 ) ( ON ?auto_27719 ?auto_27732 ) ( CLEAR ?auto_27719 ) ( not ( = ?auto_27719 ?auto_27732 ) ) ( not ( = ?auto_27720 ?auto_27732 ) ) ( not ( = ?auto_27718 ?auto_27732 ) ) ( not ( = ?auto_27728 ?auto_27732 ) ) ( IS-CRATE ?auto_27718 ) ( not ( = ?auto_27717 ?auto_27718 ) ) ( not ( = ?auto_27719 ?auto_27717 ) ) ( not ( = ?auto_27720 ?auto_27717 ) ) ( not ( = ?auto_27728 ?auto_27717 ) ) ( not ( = ?auto_27732 ?auto_27717 ) ) ( not ( = ?auto_27722 ?auto_27730 ) ) ( not ( = ?auto_27733 ?auto_27722 ) ) ( not ( = ?auto_27729 ?auto_27722 ) ) ( HOIST-AT ?auto_27725 ?auto_27722 ) ( not ( = ?auto_27724 ?auto_27725 ) ) ( not ( = ?auto_27727 ?auto_27725 ) ) ( not ( = ?auto_27723 ?auto_27725 ) ) ( AVAILABLE ?auto_27725 ) ( SURFACE-AT ?auto_27718 ?auto_27722 ) ( ON ?auto_27718 ?auto_27731 ) ( CLEAR ?auto_27718 ) ( not ( = ?auto_27719 ?auto_27731 ) ) ( not ( = ?auto_27720 ?auto_27731 ) ) ( not ( = ?auto_27718 ?auto_27731 ) ) ( not ( = ?auto_27728 ?auto_27731 ) ) ( not ( = ?auto_27732 ?auto_27731 ) ) ( not ( = ?auto_27717 ?auto_27731 ) ) ( SURFACE-AT ?auto_27716 ?auto_27730 ) ( CLEAR ?auto_27716 ) ( IS-CRATE ?auto_27717 ) ( not ( = ?auto_27716 ?auto_27717 ) ) ( not ( = ?auto_27719 ?auto_27716 ) ) ( not ( = ?auto_27720 ?auto_27716 ) ) ( not ( = ?auto_27718 ?auto_27716 ) ) ( not ( = ?auto_27728 ?auto_27716 ) ) ( not ( = ?auto_27732 ?auto_27716 ) ) ( not ( = ?auto_27731 ?auto_27716 ) ) ( AVAILABLE ?auto_27724 ) ( TRUCK-AT ?auto_27734 ?auto_27721 ) ( not ( = ?auto_27721 ?auto_27730 ) ) ( not ( = ?auto_27733 ?auto_27721 ) ) ( not ( = ?auto_27729 ?auto_27721 ) ) ( not ( = ?auto_27722 ?auto_27721 ) ) ( HOIST-AT ?auto_27726 ?auto_27721 ) ( LIFTING ?auto_27726 ?auto_27717 ) ( not ( = ?auto_27724 ?auto_27726 ) ) ( not ( = ?auto_27727 ?auto_27726 ) ) ( not ( = ?auto_27723 ?auto_27726 ) ) ( not ( = ?auto_27725 ?auto_27726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27718 ?auto_27719 ?auto_27720 )
      ( MAKE-4CRATE-VERIFY ?auto_27716 ?auto_27717 ?auto_27718 ?auto_27719 ?auto_27720 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27735 - SURFACE
      ?auto_27736 - SURFACE
      ?auto_27737 - SURFACE
      ?auto_27738 - SURFACE
      ?auto_27739 - SURFACE
      ?auto_27740 - SURFACE
    )
    :vars
    (
      ?auto_27744 - HOIST
      ?auto_27750 - PLACE
      ?auto_27753 - PLACE
      ?auto_27747 - HOIST
      ?auto_27748 - SURFACE
      ?auto_27749 - PLACE
      ?auto_27743 - HOIST
      ?auto_27752 - SURFACE
      ?auto_27742 - PLACE
      ?auto_27745 - HOIST
      ?auto_27751 - SURFACE
      ?auto_27754 - TRUCK
      ?auto_27741 - PLACE
      ?auto_27746 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27744 ?auto_27750 ) ( IS-CRATE ?auto_27740 ) ( not ( = ?auto_27739 ?auto_27740 ) ) ( not ( = ?auto_27738 ?auto_27739 ) ) ( not ( = ?auto_27738 ?auto_27740 ) ) ( not ( = ?auto_27753 ?auto_27750 ) ) ( HOIST-AT ?auto_27747 ?auto_27753 ) ( not ( = ?auto_27744 ?auto_27747 ) ) ( AVAILABLE ?auto_27747 ) ( SURFACE-AT ?auto_27740 ?auto_27753 ) ( ON ?auto_27740 ?auto_27748 ) ( CLEAR ?auto_27740 ) ( not ( = ?auto_27739 ?auto_27748 ) ) ( not ( = ?auto_27740 ?auto_27748 ) ) ( not ( = ?auto_27738 ?auto_27748 ) ) ( IS-CRATE ?auto_27739 ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( not ( = ?auto_27753 ?auto_27749 ) ) ( HOIST-AT ?auto_27743 ?auto_27749 ) ( not ( = ?auto_27744 ?auto_27743 ) ) ( not ( = ?auto_27747 ?auto_27743 ) ) ( AVAILABLE ?auto_27743 ) ( SURFACE-AT ?auto_27739 ?auto_27749 ) ( ON ?auto_27739 ?auto_27752 ) ( CLEAR ?auto_27739 ) ( not ( = ?auto_27739 ?auto_27752 ) ) ( not ( = ?auto_27740 ?auto_27752 ) ) ( not ( = ?auto_27738 ?auto_27752 ) ) ( not ( = ?auto_27748 ?auto_27752 ) ) ( IS-CRATE ?auto_27738 ) ( not ( = ?auto_27737 ?auto_27738 ) ) ( not ( = ?auto_27739 ?auto_27737 ) ) ( not ( = ?auto_27740 ?auto_27737 ) ) ( not ( = ?auto_27748 ?auto_27737 ) ) ( not ( = ?auto_27752 ?auto_27737 ) ) ( not ( = ?auto_27742 ?auto_27750 ) ) ( not ( = ?auto_27753 ?auto_27742 ) ) ( not ( = ?auto_27749 ?auto_27742 ) ) ( HOIST-AT ?auto_27745 ?auto_27742 ) ( not ( = ?auto_27744 ?auto_27745 ) ) ( not ( = ?auto_27747 ?auto_27745 ) ) ( not ( = ?auto_27743 ?auto_27745 ) ) ( AVAILABLE ?auto_27745 ) ( SURFACE-AT ?auto_27738 ?auto_27742 ) ( ON ?auto_27738 ?auto_27751 ) ( CLEAR ?auto_27738 ) ( not ( = ?auto_27739 ?auto_27751 ) ) ( not ( = ?auto_27740 ?auto_27751 ) ) ( not ( = ?auto_27738 ?auto_27751 ) ) ( not ( = ?auto_27748 ?auto_27751 ) ) ( not ( = ?auto_27752 ?auto_27751 ) ) ( not ( = ?auto_27737 ?auto_27751 ) ) ( SURFACE-AT ?auto_27736 ?auto_27750 ) ( CLEAR ?auto_27736 ) ( IS-CRATE ?auto_27737 ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( not ( = ?auto_27739 ?auto_27736 ) ) ( not ( = ?auto_27740 ?auto_27736 ) ) ( not ( = ?auto_27738 ?auto_27736 ) ) ( not ( = ?auto_27748 ?auto_27736 ) ) ( not ( = ?auto_27752 ?auto_27736 ) ) ( not ( = ?auto_27751 ?auto_27736 ) ) ( AVAILABLE ?auto_27744 ) ( TRUCK-AT ?auto_27754 ?auto_27741 ) ( not ( = ?auto_27741 ?auto_27750 ) ) ( not ( = ?auto_27753 ?auto_27741 ) ) ( not ( = ?auto_27749 ?auto_27741 ) ) ( not ( = ?auto_27742 ?auto_27741 ) ) ( HOIST-AT ?auto_27746 ?auto_27741 ) ( LIFTING ?auto_27746 ?auto_27737 ) ( not ( = ?auto_27744 ?auto_27746 ) ) ( not ( = ?auto_27747 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27745 ?auto_27746 ) ) ( ON ?auto_27736 ?auto_27735 ) ( not ( = ?auto_27735 ?auto_27736 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27735 ?auto_27738 ) ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27735 ?auto_27740 ) ) ( not ( = ?auto_27735 ?auto_27748 ) ) ( not ( = ?auto_27735 ?auto_27752 ) ) ( not ( = ?auto_27735 ?auto_27751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27738 ?auto_27739 ?auto_27740 )
      ( MAKE-5CRATE-VERIFY ?auto_27735 ?auto_27736 ?auto_27737 ?auto_27738 ?auto_27739 ?auto_27740 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27755 - SURFACE
      ?auto_27756 - SURFACE
    )
    :vars
    (
      ?auto_27762 - HOIST
      ?auto_27768 - PLACE
      ?auto_27761 - SURFACE
      ?auto_27772 - PLACE
      ?auto_27765 - HOIST
      ?auto_27766 - SURFACE
      ?auto_27767 - PLACE
      ?auto_27760 - HOIST
      ?auto_27770 - SURFACE
      ?auto_27771 - SURFACE
      ?auto_27758 - PLACE
      ?auto_27763 - HOIST
      ?auto_27769 - SURFACE
      ?auto_27759 - SURFACE
      ?auto_27773 - TRUCK
      ?auto_27757 - PLACE
      ?auto_27764 - HOIST
      ?auto_27774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27762 ?auto_27768 ) ( IS-CRATE ?auto_27756 ) ( not ( = ?auto_27755 ?auto_27756 ) ) ( not ( = ?auto_27761 ?auto_27755 ) ) ( not ( = ?auto_27761 ?auto_27756 ) ) ( not ( = ?auto_27772 ?auto_27768 ) ) ( HOIST-AT ?auto_27765 ?auto_27772 ) ( not ( = ?auto_27762 ?auto_27765 ) ) ( AVAILABLE ?auto_27765 ) ( SURFACE-AT ?auto_27756 ?auto_27772 ) ( ON ?auto_27756 ?auto_27766 ) ( CLEAR ?auto_27756 ) ( not ( = ?auto_27755 ?auto_27766 ) ) ( not ( = ?auto_27756 ?auto_27766 ) ) ( not ( = ?auto_27761 ?auto_27766 ) ) ( IS-CRATE ?auto_27755 ) ( not ( = ?auto_27767 ?auto_27768 ) ) ( not ( = ?auto_27772 ?auto_27767 ) ) ( HOIST-AT ?auto_27760 ?auto_27767 ) ( not ( = ?auto_27762 ?auto_27760 ) ) ( not ( = ?auto_27765 ?auto_27760 ) ) ( AVAILABLE ?auto_27760 ) ( SURFACE-AT ?auto_27755 ?auto_27767 ) ( ON ?auto_27755 ?auto_27770 ) ( CLEAR ?auto_27755 ) ( not ( = ?auto_27755 ?auto_27770 ) ) ( not ( = ?auto_27756 ?auto_27770 ) ) ( not ( = ?auto_27761 ?auto_27770 ) ) ( not ( = ?auto_27766 ?auto_27770 ) ) ( IS-CRATE ?auto_27761 ) ( not ( = ?auto_27771 ?auto_27761 ) ) ( not ( = ?auto_27755 ?auto_27771 ) ) ( not ( = ?auto_27756 ?auto_27771 ) ) ( not ( = ?auto_27766 ?auto_27771 ) ) ( not ( = ?auto_27770 ?auto_27771 ) ) ( not ( = ?auto_27758 ?auto_27768 ) ) ( not ( = ?auto_27772 ?auto_27758 ) ) ( not ( = ?auto_27767 ?auto_27758 ) ) ( HOIST-AT ?auto_27763 ?auto_27758 ) ( not ( = ?auto_27762 ?auto_27763 ) ) ( not ( = ?auto_27765 ?auto_27763 ) ) ( not ( = ?auto_27760 ?auto_27763 ) ) ( AVAILABLE ?auto_27763 ) ( SURFACE-AT ?auto_27761 ?auto_27758 ) ( ON ?auto_27761 ?auto_27769 ) ( CLEAR ?auto_27761 ) ( not ( = ?auto_27755 ?auto_27769 ) ) ( not ( = ?auto_27756 ?auto_27769 ) ) ( not ( = ?auto_27761 ?auto_27769 ) ) ( not ( = ?auto_27766 ?auto_27769 ) ) ( not ( = ?auto_27770 ?auto_27769 ) ) ( not ( = ?auto_27771 ?auto_27769 ) ) ( SURFACE-AT ?auto_27759 ?auto_27768 ) ( CLEAR ?auto_27759 ) ( IS-CRATE ?auto_27771 ) ( not ( = ?auto_27759 ?auto_27771 ) ) ( not ( = ?auto_27755 ?auto_27759 ) ) ( not ( = ?auto_27756 ?auto_27759 ) ) ( not ( = ?auto_27761 ?auto_27759 ) ) ( not ( = ?auto_27766 ?auto_27759 ) ) ( not ( = ?auto_27770 ?auto_27759 ) ) ( not ( = ?auto_27769 ?auto_27759 ) ) ( AVAILABLE ?auto_27762 ) ( TRUCK-AT ?auto_27773 ?auto_27757 ) ( not ( = ?auto_27757 ?auto_27768 ) ) ( not ( = ?auto_27772 ?auto_27757 ) ) ( not ( = ?auto_27767 ?auto_27757 ) ) ( not ( = ?auto_27758 ?auto_27757 ) ) ( HOIST-AT ?auto_27764 ?auto_27757 ) ( not ( = ?auto_27762 ?auto_27764 ) ) ( not ( = ?auto_27765 ?auto_27764 ) ) ( not ( = ?auto_27760 ?auto_27764 ) ) ( not ( = ?auto_27763 ?auto_27764 ) ) ( AVAILABLE ?auto_27764 ) ( SURFACE-AT ?auto_27771 ?auto_27757 ) ( ON ?auto_27771 ?auto_27774 ) ( CLEAR ?auto_27771 ) ( not ( = ?auto_27755 ?auto_27774 ) ) ( not ( = ?auto_27756 ?auto_27774 ) ) ( not ( = ?auto_27761 ?auto_27774 ) ) ( not ( = ?auto_27766 ?auto_27774 ) ) ( not ( = ?auto_27770 ?auto_27774 ) ) ( not ( = ?auto_27771 ?auto_27774 ) ) ( not ( = ?auto_27769 ?auto_27774 ) ) ( not ( = ?auto_27759 ?auto_27774 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27764 ?auto_27771 ?auto_27774 ?auto_27757 )
      ( MAKE-2CRATE ?auto_27761 ?auto_27755 ?auto_27756 )
      ( MAKE-1CRATE-VERIFY ?auto_27755 ?auto_27756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
      ?auto_27777 - SURFACE
    )
    :vars
    (
      ?auto_27785 - HOIST
      ?auto_27781 - PLACE
      ?auto_27788 - PLACE
      ?auto_27778 - HOIST
      ?auto_27787 - SURFACE
      ?auto_27792 - PLACE
      ?auto_27793 - HOIST
      ?auto_27790 - SURFACE
      ?auto_27786 - SURFACE
      ?auto_27782 - PLACE
      ?auto_27780 - HOIST
      ?auto_27791 - SURFACE
      ?auto_27783 - SURFACE
      ?auto_27794 - TRUCK
      ?auto_27789 - PLACE
      ?auto_27784 - HOIST
      ?auto_27779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27785 ?auto_27781 ) ( IS-CRATE ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27788 ?auto_27781 ) ) ( HOIST-AT ?auto_27778 ?auto_27788 ) ( not ( = ?auto_27785 ?auto_27778 ) ) ( AVAILABLE ?auto_27778 ) ( SURFACE-AT ?auto_27777 ?auto_27788 ) ( ON ?auto_27777 ?auto_27787 ) ( CLEAR ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27787 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( not ( = ?auto_27775 ?auto_27787 ) ) ( IS-CRATE ?auto_27776 ) ( not ( = ?auto_27792 ?auto_27781 ) ) ( not ( = ?auto_27788 ?auto_27792 ) ) ( HOIST-AT ?auto_27793 ?auto_27792 ) ( not ( = ?auto_27785 ?auto_27793 ) ) ( not ( = ?auto_27778 ?auto_27793 ) ) ( AVAILABLE ?auto_27793 ) ( SURFACE-AT ?auto_27776 ?auto_27792 ) ( ON ?auto_27776 ?auto_27790 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27776 ?auto_27790 ) ) ( not ( = ?auto_27777 ?auto_27790 ) ) ( not ( = ?auto_27775 ?auto_27790 ) ) ( not ( = ?auto_27787 ?auto_27790 ) ) ( IS-CRATE ?auto_27775 ) ( not ( = ?auto_27786 ?auto_27775 ) ) ( not ( = ?auto_27776 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27786 ) ) ( not ( = ?auto_27787 ?auto_27786 ) ) ( not ( = ?auto_27790 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27781 ) ) ( not ( = ?auto_27788 ?auto_27782 ) ) ( not ( = ?auto_27792 ?auto_27782 ) ) ( HOIST-AT ?auto_27780 ?auto_27782 ) ( not ( = ?auto_27785 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27793 ?auto_27780 ) ) ( AVAILABLE ?auto_27780 ) ( SURFACE-AT ?auto_27775 ?auto_27782 ) ( ON ?auto_27775 ?auto_27791 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27776 ?auto_27791 ) ) ( not ( = ?auto_27777 ?auto_27791 ) ) ( not ( = ?auto_27775 ?auto_27791 ) ) ( not ( = ?auto_27787 ?auto_27791 ) ) ( not ( = ?auto_27790 ?auto_27791 ) ) ( not ( = ?auto_27786 ?auto_27791 ) ) ( SURFACE-AT ?auto_27783 ?auto_27781 ) ( CLEAR ?auto_27783 ) ( IS-CRATE ?auto_27786 ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27776 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27787 ?auto_27783 ) ) ( not ( = ?auto_27790 ?auto_27783 ) ) ( not ( = ?auto_27791 ?auto_27783 ) ) ( AVAILABLE ?auto_27785 ) ( TRUCK-AT ?auto_27794 ?auto_27789 ) ( not ( = ?auto_27789 ?auto_27781 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27792 ?auto_27789 ) ) ( not ( = ?auto_27782 ?auto_27789 ) ) ( HOIST-AT ?auto_27784 ?auto_27789 ) ( not ( = ?auto_27785 ?auto_27784 ) ) ( not ( = ?auto_27778 ?auto_27784 ) ) ( not ( = ?auto_27793 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( AVAILABLE ?auto_27784 ) ( SURFACE-AT ?auto_27786 ?auto_27789 ) ( ON ?auto_27786 ?auto_27779 ) ( CLEAR ?auto_27786 ) ( not ( = ?auto_27776 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27775 ?auto_27779 ) ) ( not ( = ?auto_27787 ?auto_27779 ) ) ( not ( = ?auto_27790 ?auto_27779 ) ) ( not ( = ?auto_27786 ?auto_27779 ) ) ( not ( = ?auto_27791 ?auto_27779 ) ) ( not ( = ?auto_27783 ?auto_27779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27776 ?auto_27777 )
      ( MAKE-2CRATE-VERIFY ?auto_27775 ?auto_27776 ?auto_27777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27795 - SURFACE
      ?auto_27796 - SURFACE
      ?auto_27797 - SURFACE
      ?auto_27798 - SURFACE
    )
    :vars
    (
      ?auto_27802 - HOIST
      ?auto_27801 - PLACE
      ?auto_27804 - PLACE
      ?auto_27812 - HOIST
      ?auto_27800 - SURFACE
      ?auto_27808 - PLACE
      ?auto_27799 - HOIST
      ?auto_27811 - SURFACE
      ?auto_27813 - PLACE
      ?auto_27814 - HOIST
      ?auto_27805 - SURFACE
      ?auto_27810 - SURFACE
      ?auto_27809 - TRUCK
      ?auto_27807 - PLACE
      ?auto_27803 - HOIST
      ?auto_27806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27802 ?auto_27801 ) ( IS-CRATE ?auto_27798 ) ( not ( = ?auto_27797 ?auto_27798 ) ) ( not ( = ?auto_27796 ?auto_27797 ) ) ( not ( = ?auto_27796 ?auto_27798 ) ) ( not ( = ?auto_27804 ?auto_27801 ) ) ( HOIST-AT ?auto_27812 ?auto_27804 ) ( not ( = ?auto_27802 ?auto_27812 ) ) ( AVAILABLE ?auto_27812 ) ( SURFACE-AT ?auto_27798 ?auto_27804 ) ( ON ?auto_27798 ?auto_27800 ) ( CLEAR ?auto_27798 ) ( not ( = ?auto_27797 ?auto_27800 ) ) ( not ( = ?auto_27798 ?auto_27800 ) ) ( not ( = ?auto_27796 ?auto_27800 ) ) ( IS-CRATE ?auto_27797 ) ( not ( = ?auto_27808 ?auto_27801 ) ) ( not ( = ?auto_27804 ?auto_27808 ) ) ( HOIST-AT ?auto_27799 ?auto_27808 ) ( not ( = ?auto_27802 ?auto_27799 ) ) ( not ( = ?auto_27812 ?auto_27799 ) ) ( AVAILABLE ?auto_27799 ) ( SURFACE-AT ?auto_27797 ?auto_27808 ) ( ON ?auto_27797 ?auto_27811 ) ( CLEAR ?auto_27797 ) ( not ( = ?auto_27797 ?auto_27811 ) ) ( not ( = ?auto_27798 ?auto_27811 ) ) ( not ( = ?auto_27796 ?auto_27811 ) ) ( not ( = ?auto_27800 ?auto_27811 ) ) ( IS-CRATE ?auto_27796 ) ( not ( = ?auto_27795 ?auto_27796 ) ) ( not ( = ?auto_27797 ?auto_27795 ) ) ( not ( = ?auto_27798 ?auto_27795 ) ) ( not ( = ?auto_27800 ?auto_27795 ) ) ( not ( = ?auto_27811 ?auto_27795 ) ) ( not ( = ?auto_27813 ?auto_27801 ) ) ( not ( = ?auto_27804 ?auto_27813 ) ) ( not ( = ?auto_27808 ?auto_27813 ) ) ( HOIST-AT ?auto_27814 ?auto_27813 ) ( not ( = ?auto_27802 ?auto_27814 ) ) ( not ( = ?auto_27812 ?auto_27814 ) ) ( not ( = ?auto_27799 ?auto_27814 ) ) ( AVAILABLE ?auto_27814 ) ( SURFACE-AT ?auto_27796 ?auto_27813 ) ( ON ?auto_27796 ?auto_27805 ) ( CLEAR ?auto_27796 ) ( not ( = ?auto_27797 ?auto_27805 ) ) ( not ( = ?auto_27798 ?auto_27805 ) ) ( not ( = ?auto_27796 ?auto_27805 ) ) ( not ( = ?auto_27800 ?auto_27805 ) ) ( not ( = ?auto_27811 ?auto_27805 ) ) ( not ( = ?auto_27795 ?auto_27805 ) ) ( SURFACE-AT ?auto_27810 ?auto_27801 ) ( CLEAR ?auto_27810 ) ( IS-CRATE ?auto_27795 ) ( not ( = ?auto_27810 ?auto_27795 ) ) ( not ( = ?auto_27797 ?auto_27810 ) ) ( not ( = ?auto_27798 ?auto_27810 ) ) ( not ( = ?auto_27796 ?auto_27810 ) ) ( not ( = ?auto_27800 ?auto_27810 ) ) ( not ( = ?auto_27811 ?auto_27810 ) ) ( not ( = ?auto_27805 ?auto_27810 ) ) ( AVAILABLE ?auto_27802 ) ( TRUCK-AT ?auto_27809 ?auto_27807 ) ( not ( = ?auto_27807 ?auto_27801 ) ) ( not ( = ?auto_27804 ?auto_27807 ) ) ( not ( = ?auto_27808 ?auto_27807 ) ) ( not ( = ?auto_27813 ?auto_27807 ) ) ( HOIST-AT ?auto_27803 ?auto_27807 ) ( not ( = ?auto_27802 ?auto_27803 ) ) ( not ( = ?auto_27812 ?auto_27803 ) ) ( not ( = ?auto_27799 ?auto_27803 ) ) ( not ( = ?auto_27814 ?auto_27803 ) ) ( AVAILABLE ?auto_27803 ) ( SURFACE-AT ?auto_27795 ?auto_27807 ) ( ON ?auto_27795 ?auto_27806 ) ( CLEAR ?auto_27795 ) ( not ( = ?auto_27797 ?auto_27806 ) ) ( not ( = ?auto_27798 ?auto_27806 ) ) ( not ( = ?auto_27796 ?auto_27806 ) ) ( not ( = ?auto_27800 ?auto_27806 ) ) ( not ( = ?auto_27811 ?auto_27806 ) ) ( not ( = ?auto_27795 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27810 ?auto_27806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27796 ?auto_27797 ?auto_27798 )
      ( MAKE-3CRATE-VERIFY ?auto_27795 ?auto_27796 ?auto_27797 ?auto_27798 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27815 - SURFACE
      ?auto_27816 - SURFACE
      ?auto_27817 - SURFACE
      ?auto_27818 - SURFACE
      ?auto_27819 - SURFACE
    )
    :vars
    (
      ?auto_27823 - HOIST
      ?auto_27822 - PLACE
      ?auto_27825 - PLACE
      ?auto_27832 - HOIST
      ?auto_27821 - SURFACE
      ?auto_27829 - PLACE
      ?auto_27820 - HOIST
      ?auto_27831 - SURFACE
      ?auto_27833 - PLACE
      ?auto_27834 - HOIST
      ?auto_27826 - SURFACE
      ?auto_27830 - TRUCK
      ?auto_27828 - PLACE
      ?auto_27824 - HOIST
      ?auto_27827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27823 ?auto_27822 ) ( IS-CRATE ?auto_27819 ) ( not ( = ?auto_27818 ?auto_27819 ) ) ( not ( = ?auto_27817 ?auto_27818 ) ) ( not ( = ?auto_27817 ?auto_27819 ) ) ( not ( = ?auto_27825 ?auto_27822 ) ) ( HOIST-AT ?auto_27832 ?auto_27825 ) ( not ( = ?auto_27823 ?auto_27832 ) ) ( AVAILABLE ?auto_27832 ) ( SURFACE-AT ?auto_27819 ?auto_27825 ) ( ON ?auto_27819 ?auto_27821 ) ( CLEAR ?auto_27819 ) ( not ( = ?auto_27818 ?auto_27821 ) ) ( not ( = ?auto_27819 ?auto_27821 ) ) ( not ( = ?auto_27817 ?auto_27821 ) ) ( IS-CRATE ?auto_27818 ) ( not ( = ?auto_27829 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27829 ) ) ( HOIST-AT ?auto_27820 ?auto_27829 ) ( not ( = ?auto_27823 ?auto_27820 ) ) ( not ( = ?auto_27832 ?auto_27820 ) ) ( AVAILABLE ?auto_27820 ) ( SURFACE-AT ?auto_27818 ?auto_27829 ) ( ON ?auto_27818 ?auto_27831 ) ( CLEAR ?auto_27818 ) ( not ( = ?auto_27818 ?auto_27831 ) ) ( not ( = ?auto_27819 ?auto_27831 ) ) ( not ( = ?auto_27817 ?auto_27831 ) ) ( not ( = ?auto_27821 ?auto_27831 ) ) ( IS-CRATE ?auto_27817 ) ( not ( = ?auto_27816 ?auto_27817 ) ) ( not ( = ?auto_27818 ?auto_27816 ) ) ( not ( = ?auto_27819 ?auto_27816 ) ) ( not ( = ?auto_27821 ?auto_27816 ) ) ( not ( = ?auto_27831 ?auto_27816 ) ) ( not ( = ?auto_27833 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27833 ) ) ( not ( = ?auto_27829 ?auto_27833 ) ) ( HOIST-AT ?auto_27834 ?auto_27833 ) ( not ( = ?auto_27823 ?auto_27834 ) ) ( not ( = ?auto_27832 ?auto_27834 ) ) ( not ( = ?auto_27820 ?auto_27834 ) ) ( AVAILABLE ?auto_27834 ) ( SURFACE-AT ?auto_27817 ?auto_27833 ) ( ON ?auto_27817 ?auto_27826 ) ( CLEAR ?auto_27817 ) ( not ( = ?auto_27818 ?auto_27826 ) ) ( not ( = ?auto_27819 ?auto_27826 ) ) ( not ( = ?auto_27817 ?auto_27826 ) ) ( not ( = ?auto_27821 ?auto_27826 ) ) ( not ( = ?auto_27831 ?auto_27826 ) ) ( not ( = ?auto_27816 ?auto_27826 ) ) ( SURFACE-AT ?auto_27815 ?auto_27822 ) ( CLEAR ?auto_27815 ) ( IS-CRATE ?auto_27816 ) ( not ( = ?auto_27815 ?auto_27816 ) ) ( not ( = ?auto_27818 ?auto_27815 ) ) ( not ( = ?auto_27819 ?auto_27815 ) ) ( not ( = ?auto_27817 ?auto_27815 ) ) ( not ( = ?auto_27821 ?auto_27815 ) ) ( not ( = ?auto_27831 ?auto_27815 ) ) ( not ( = ?auto_27826 ?auto_27815 ) ) ( AVAILABLE ?auto_27823 ) ( TRUCK-AT ?auto_27830 ?auto_27828 ) ( not ( = ?auto_27828 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27828 ) ) ( not ( = ?auto_27829 ?auto_27828 ) ) ( not ( = ?auto_27833 ?auto_27828 ) ) ( HOIST-AT ?auto_27824 ?auto_27828 ) ( not ( = ?auto_27823 ?auto_27824 ) ) ( not ( = ?auto_27832 ?auto_27824 ) ) ( not ( = ?auto_27820 ?auto_27824 ) ) ( not ( = ?auto_27834 ?auto_27824 ) ) ( AVAILABLE ?auto_27824 ) ( SURFACE-AT ?auto_27816 ?auto_27828 ) ( ON ?auto_27816 ?auto_27827 ) ( CLEAR ?auto_27816 ) ( not ( = ?auto_27818 ?auto_27827 ) ) ( not ( = ?auto_27819 ?auto_27827 ) ) ( not ( = ?auto_27817 ?auto_27827 ) ) ( not ( = ?auto_27821 ?auto_27827 ) ) ( not ( = ?auto_27831 ?auto_27827 ) ) ( not ( = ?auto_27816 ?auto_27827 ) ) ( not ( = ?auto_27826 ?auto_27827 ) ) ( not ( = ?auto_27815 ?auto_27827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27817 ?auto_27818 ?auto_27819 )
      ( MAKE-4CRATE-VERIFY ?auto_27815 ?auto_27816 ?auto_27817 ?auto_27818 ?auto_27819 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27835 - SURFACE
      ?auto_27836 - SURFACE
      ?auto_27837 - SURFACE
      ?auto_27838 - SURFACE
      ?auto_27839 - SURFACE
      ?auto_27840 - SURFACE
    )
    :vars
    (
      ?auto_27844 - HOIST
      ?auto_27843 - PLACE
      ?auto_27846 - PLACE
      ?auto_27853 - HOIST
      ?auto_27842 - SURFACE
      ?auto_27850 - PLACE
      ?auto_27841 - HOIST
      ?auto_27852 - SURFACE
      ?auto_27854 - PLACE
      ?auto_27855 - HOIST
      ?auto_27847 - SURFACE
      ?auto_27851 - TRUCK
      ?auto_27849 - PLACE
      ?auto_27845 - HOIST
      ?auto_27848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27844 ?auto_27843 ) ( IS-CRATE ?auto_27840 ) ( not ( = ?auto_27839 ?auto_27840 ) ) ( not ( = ?auto_27838 ?auto_27839 ) ) ( not ( = ?auto_27838 ?auto_27840 ) ) ( not ( = ?auto_27846 ?auto_27843 ) ) ( HOIST-AT ?auto_27853 ?auto_27846 ) ( not ( = ?auto_27844 ?auto_27853 ) ) ( AVAILABLE ?auto_27853 ) ( SURFACE-AT ?auto_27840 ?auto_27846 ) ( ON ?auto_27840 ?auto_27842 ) ( CLEAR ?auto_27840 ) ( not ( = ?auto_27839 ?auto_27842 ) ) ( not ( = ?auto_27840 ?auto_27842 ) ) ( not ( = ?auto_27838 ?auto_27842 ) ) ( IS-CRATE ?auto_27839 ) ( not ( = ?auto_27850 ?auto_27843 ) ) ( not ( = ?auto_27846 ?auto_27850 ) ) ( HOIST-AT ?auto_27841 ?auto_27850 ) ( not ( = ?auto_27844 ?auto_27841 ) ) ( not ( = ?auto_27853 ?auto_27841 ) ) ( AVAILABLE ?auto_27841 ) ( SURFACE-AT ?auto_27839 ?auto_27850 ) ( ON ?auto_27839 ?auto_27852 ) ( CLEAR ?auto_27839 ) ( not ( = ?auto_27839 ?auto_27852 ) ) ( not ( = ?auto_27840 ?auto_27852 ) ) ( not ( = ?auto_27838 ?auto_27852 ) ) ( not ( = ?auto_27842 ?auto_27852 ) ) ( IS-CRATE ?auto_27838 ) ( not ( = ?auto_27837 ?auto_27838 ) ) ( not ( = ?auto_27839 ?auto_27837 ) ) ( not ( = ?auto_27840 ?auto_27837 ) ) ( not ( = ?auto_27842 ?auto_27837 ) ) ( not ( = ?auto_27852 ?auto_27837 ) ) ( not ( = ?auto_27854 ?auto_27843 ) ) ( not ( = ?auto_27846 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( HOIST-AT ?auto_27855 ?auto_27854 ) ( not ( = ?auto_27844 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27841 ?auto_27855 ) ) ( AVAILABLE ?auto_27855 ) ( SURFACE-AT ?auto_27838 ?auto_27854 ) ( ON ?auto_27838 ?auto_27847 ) ( CLEAR ?auto_27838 ) ( not ( = ?auto_27839 ?auto_27847 ) ) ( not ( = ?auto_27840 ?auto_27847 ) ) ( not ( = ?auto_27838 ?auto_27847 ) ) ( not ( = ?auto_27842 ?auto_27847 ) ) ( not ( = ?auto_27852 ?auto_27847 ) ) ( not ( = ?auto_27837 ?auto_27847 ) ) ( SURFACE-AT ?auto_27836 ?auto_27843 ) ( CLEAR ?auto_27836 ) ( IS-CRATE ?auto_27837 ) ( not ( = ?auto_27836 ?auto_27837 ) ) ( not ( = ?auto_27839 ?auto_27836 ) ) ( not ( = ?auto_27840 ?auto_27836 ) ) ( not ( = ?auto_27838 ?auto_27836 ) ) ( not ( = ?auto_27842 ?auto_27836 ) ) ( not ( = ?auto_27852 ?auto_27836 ) ) ( not ( = ?auto_27847 ?auto_27836 ) ) ( AVAILABLE ?auto_27844 ) ( TRUCK-AT ?auto_27851 ?auto_27849 ) ( not ( = ?auto_27849 ?auto_27843 ) ) ( not ( = ?auto_27846 ?auto_27849 ) ) ( not ( = ?auto_27850 ?auto_27849 ) ) ( not ( = ?auto_27854 ?auto_27849 ) ) ( HOIST-AT ?auto_27845 ?auto_27849 ) ( not ( = ?auto_27844 ?auto_27845 ) ) ( not ( = ?auto_27853 ?auto_27845 ) ) ( not ( = ?auto_27841 ?auto_27845 ) ) ( not ( = ?auto_27855 ?auto_27845 ) ) ( AVAILABLE ?auto_27845 ) ( SURFACE-AT ?auto_27837 ?auto_27849 ) ( ON ?auto_27837 ?auto_27848 ) ( CLEAR ?auto_27837 ) ( not ( = ?auto_27839 ?auto_27848 ) ) ( not ( = ?auto_27840 ?auto_27848 ) ) ( not ( = ?auto_27838 ?auto_27848 ) ) ( not ( = ?auto_27842 ?auto_27848 ) ) ( not ( = ?auto_27852 ?auto_27848 ) ) ( not ( = ?auto_27837 ?auto_27848 ) ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( not ( = ?auto_27836 ?auto_27848 ) ) ( ON ?auto_27836 ?auto_27835 ) ( not ( = ?auto_27835 ?auto_27836 ) ) ( not ( = ?auto_27835 ?auto_27837 ) ) ( not ( = ?auto_27835 ?auto_27838 ) ) ( not ( = ?auto_27835 ?auto_27839 ) ) ( not ( = ?auto_27835 ?auto_27840 ) ) ( not ( = ?auto_27835 ?auto_27842 ) ) ( not ( = ?auto_27835 ?auto_27852 ) ) ( not ( = ?auto_27835 ?auto_27847 ) ) ( not ( = ?auto_27835 ?auto_27848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27838 ?auto_27839 ?auto_27840 )
      ( MAKE-5CRATE-VERIFY ?auto_27835 ?auto_27836 ?auto_27837 ?auto_27838 ?auto_27839 ?auto_27840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27856 - SURFACE
      ?auto_27857 - SURFACE
    )
    :vars
    (
      ?auto_27861 - HOIST
      ?auto_27860 - PLACE
      ?auto_27867 - SURFACE
      ?auto_27863 - PLACE
      ?auto_27873 - HOIST
      ?auto_27859 - SURFACE
      ?auto_27868 - PLACE
      ?auto_27858 - HOIST
      ?auto_27871 - SURFACE
      ?auto_27872 - SURFACE
      ?auto_27874 - PLACE
      ?auto_27875 - HOIST
      ?auto_27864 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27866 - PLACE
      ?auto_27862 - HOIST
      ?auto_27865 - SURFACE
      ?auto_27869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27861 ?auto_27860 ) ( IS-CRATE ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27857 ) ) ( not ( = ?auto_27867 ?auto_27856 ) ) ( not ( = ?auto_27867 ?auto_27857 ) ) ( not ( = ?auto_27863 ?auto_27860 ) ) ( HOIST-AT ?auto_27873 ?auto_27863 ) ( not ( = ?auto_27861 ?auto_27873 ) ) ( AVAILABLE ?auto_27873 ) ( SURFACE-AT ?auto_27857 ?auto_27863 ) ( ON ?auto_27857 ?auto_27859 ) ( CLEAR ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27867 ?auto_27859 ) ) ( IS-CRATE ?auto_27856 ) ( not ( = ?auto_27868 ?auto_27860 ) ) ( not ( = ?auto_27863 ?auto_27868 ) ) ( HOIST-AT ?auto_27858 ?auto_27868 ) ( not ( = ?auto_27861 ?auto_27858 ) ) ( not ( = ?auto_27873 ?auto_27858 ) ) ( AVAILABLE ?auto_27858 ) ( SURFACE-AT ?auto_27856 ?auto_27868 ) ( ON ?auto_27856 ?auto_27871 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27857 ?auto_27871 ) ) ( not ( = ?auto_27867 ?auto_27871 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( IS-CRATE ?auto_27867 ) ( not ( = ?auto_27872 ?auto_27867 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27872 ) ) ( not ( = ?auto_27859 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27874 ?auto_27860 ) ) ( not ( = ?auto_27863 ?auto_27874 ) ) ( not ( = ?auto_27868 ?auto_27874 ) ) ( HOIST-AT ?auto_27875 ?auto_27874 ) ( not ( = ?auto_27861 ?auto_27875 ) ) ( not ( = ?auto_27873 ?auto_27875 ) ) ( not ( = ?auto_27858 ?auto_27875 ) ) ( AVAILABLE ?auto_27875 ) ( SURFACE-AT ?auto_27867 ?auto_27874 ) ( ON ?auto_27867 ?auto_27864 ) ( CLEAR ?auto_27867 ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27857 ?auto_27864 ) ) ( not ( = ?auto_27867 ?auto_27864 ) ) ( not ( = ?auto_27859 ?auto_27864 ) ) ( not ( = ?auto_27871 ?auto_27864 ) ) ( not ( = ?auto_27872 ?auto_27864 ) ) ( SURFACE-AT ?auto_27870 ?auto_27860 ) ( CLEAR ?auto_27870 ) ( IS-CRATE ?auto_27872 ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27857 ?auto_27870 ) ) ( not ( = ?auto_27867 ?auto_27870 ) ) ( not ( = ?auto_27859 ?auto_27870 ) ) ( not ( = ?auto_27871 ?auto_27870 ) ) ( not ( = ?auto_27864 ?auto_27870 ) ) ( AVAILABLE ?auto_27861 ) ( not ( = ?auto_27866 ?auto_27860 ) ) ( not ( = ?auto_27863 ?auto_27866 ) ) ( not ( = ?auto_27868 ?auto_27866 ) ) ( not ( = ?auto_27874 ?auto_27866 ) ) ( HOIST-AT ?auto_27862 ?auto_27866 ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27873 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27875 ?auto_27862 ) ) ( AVAILABLE ?auto_27862 ) ( SURFACE-AT ?auto_27872 ?auto_27866 ) ( ON ?auto_27872 ?auto_27865 ) ( CLEAR ?auto_27872 ) ( not ( = ?auto_27856 ?auto_27865 ) ) ( not ( = ?auto_27857 ?auto_27865 ) ) ( not ( = ?auto_27867 ?auto_27865 ) ) ( not ( = ?auto_27859 ?auto_27865 ) ) ( not ( = ?auto_27871 ?auto_27865 ) ) ( not ( = ?auto_27872 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( not ( = ?auto_27870 ?auto_27865 ) ) ( TRUCK-AT ?auto_27869 ?auto_27860 ) )
    :subtasks
    ( ( !DRIVE ?auto_27869 ?auto_27860 ?auto_27866 )
      ( MAKE-2CRATE ?auto_27867 ?auto_27856 ?auto_27857 )
      ( MAKE-1CRATE-VERIFY ?auto_27856 ?auto_27857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27876 - SURFACE
      ?auto_27877 - SURFACE
      ?auto_27878 - SURFACE
    )
    :vars
    (
      ?auto_27882 - HOIST
      ?auto_27888 - PLACE
      ?auto_27885 - PLACE
      ?auto_27895 - HOIST
      ?auto_27881 - SURFACE
      ?auto_27880 - PLACE
      ?auto_27893 - HOIST
      ?auto_27883 - SURFACE
      ?auto_27890 - SURFACE
      ?auto_27884 - PLACE
      ?auto_27891 - HOIST
      ?auto_27894 - SURFACE
      ?auto_27886 - SURFACE
      ?auto_27892 - PLACE
      ?auto_27889 - HOIST
      ?auto_27887 - SURFACE
      ?auto_27879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27882 ?auto_27888 ) ( IS-CRATE ?auto_27878 ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( not ( = ?auto_27876 ?auto_27877 ) ) ( not ( = ?auto_27876 ?auto_27878 ) ) ( not ( = ?auto_27885 ?auto_27888 ) ) ( HOIST-AT ?auto_27895 ?auto_27885 ) ( not ( = ?auto_27882 ?auto_27895 ) ) ( AVAILABLE ?auto_27895 ) ( SURFACE-AT ?auto_27878 ?auto_27885 ) ( ON ?auto_27878 ?auto_27881 ) ( CLEAR ?auto_27878 ) ( not ( = ?auto_27877 ?auto_27881 ) ) ( not ( = ?auto_27878 ?auto_27881 ) ) ( not ( = ?auto_27876 ?auto_27881 ) ) ( IS-CRATE ?auto_27877 ) ( not ( = ?auto_27880 ?auto_27888 ) ) ( not ( = ?auto_27885 ?auto_27880 ) ) ( HOIST-AT ?auto_27893 ?auto_27880 ) ( not ( = ?auto_27882 ?auto_27893 ) ) ( not ( = ?auto_27895 ?auto_27893 ) ) ( AVAILABLE ?auto_27893 ) ( SURFACE-AT ?auto_27877 ?auto_27880 ) ( ON ?auto_27877 ?auto_27883 ) ( CLEAR ?auto_27877 ) ( not ( = ?auto_27877 ?auto_27883 ) ) ( not ( = ?auto_27878 ?auto_27883 ) ) ( not ( = ?auto_27876 ?auto_27883 ) ) ( not ( = ?auto_27881 ?auto_27883 ) ) ( IS-CRATE ?auto_27876 ) ( not ( = ?auto_27890 ?auto_27876 ) ) ( not ( = ?auto_27877 ?auto_27890 ) ) ( not ( = ?auto_27878 ?auto_27890 ) ) ( not ( = ?auto_27881 ?auto_27890 ) ) ( not ( = ?auto_27883 ?auto_27890 ) ) ( not ( = ?auto_27884 ?auto_27888 ) ) ( not ( = ?auto_27885 ?auto_27884 ) ) ( not ( = ?auto_27880 ?auto_27884 ) ) ( HOIST-AT ?auto_27891 ?auto_27884 ) ( not ( = ?auto_27882 ?auto_27891 ) ) ( not ( = ?auto_27895 ?auto_27891 ) ) ( not ( = ?auto_27893 ?auto_27891 ) ) ( AVAILABLE ?auto_27891 ) ( SURFACE-AT ?auto_27876 ?auto_27884 ) ( ON ?auto_27876 ?auto_27894 ) ( CLEAR ?auto_27876 ) ( not ( = ?auto_27877 ?auto_27894 ) ) ( not ( = ?auto_27878 ?auto_27894 ) ) ( not ( = ?auto_27876 ?auto_27894 ) ) ( not ( = ?auto_27881 ?auto_27894 ) ) ( not ( = ?auto_27883 ?auto_27894 ) ) ( not ( = ?auto_27890 ?auto_27894 ) ) ( SURFACE-AT ?auto_27886 ?auto_27888 ) ( CLEAR ?auto_27886 ) ( IS-CRATE ?auto_27890 ) ( not ( = ?auto_27886 ?auto_27890 ) ) ( not ( = ?auto_27877 ?auto_27886 ) ) ( not ( = ?auto_27878 ?auto_27886 ) ) ( not ( = ?auto_27876 ?auto_27886 ) ) ( not ( = ?auto_27881 ?auto_27886 ) ) ( not ( = ?auto_27883 ?auto_27886 ) ) ( not ( = ?auto_27894 ?auto_27886 ) ) ( AVAILABLE ?auto_27882 ) ( not ( = ?auto_27892 ?auto_27888 ) ) ( not ( = ?auto_27885 ?auto_27892 ) ) ( not ( = ?auto_27880 ?auto_27892 ) ) ( not ( = ?auto_27884 ?auto_27892 ) ) ( HOIST-AT ?auto_27889 ?auto_27892 ) ( not ( = ?auto_27882 ?auto_27889 ) ) ( not ( = ?auto_27895 ?auto_27889 ) ) ( not ( = ?auto_27893 ?auto_27889 ) ) ( not ( = ?auto_27891 ?auto_27889 ) ) ( AVAILABLE ?auto_27889 ) ( SURFACE-AT ?auto_27890 ?auto_27892 ) ( ON ?auto_27890 ?auto_27887 ) ( CLEAR ?auto_27890 ) ( not ( = ?auto_27877 ?auto_27887 ) ) ( not ( = ?auto_27878 ?auto_27887 ) ) ( not ( = ?auto_27876 ?auto_27887 ) ) ( not ( = ?auto_27881 ?auto_27887 ) ) ( not ( = ?auto_27883 ?auto_27887 ) ) ( not ( = ?auto_27890 ?auto_27887 ) ) ( not ( = ?auto_27894 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( TRUCK-AT ?auto_27879 ?auto_27888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27877 ?auto_27878 )
      ( MAKE-2CRATE-VERIFY ?auto_27876 ?auto_27877 ?auto_27878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27896 - SURFACE
      ?auto_27897 - SURFACE
      ?auto_27898 - SURFACE
      ?auto_27899 - SURFACE
    )
    :vars
    (
      ?auto_27906 - HOIST
      ?auto_27901 - PLACE
      ?auto_27903 - PLACE
      ?auto_27902 - HOIST
      ?auto_27904 - SURFACE
      ?auto_27911 - PLACE
      ?auto_27915 - HOIST
      ?auto_27910 - SURFACE
      ?auto_27913 - PLACE
      ?auto_27914 - HOIST
      ?auto_27912 - SURFACE
      ?auto_27900 - SURFACE
      ?auto_27905 - PLACE
      ?auto_27908 - HOIST
      ?auto_27909 - SURFACE
      ?auto_27907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27906 ?auto_27901 ) ( IS-CRATE ?auto_27899 ) ( not ( = ?auto_27898 ?auto_27899 ) ) ( not ( = ?auto_27897 ?auto_27898 ) ) ( not ( = ?auto_27897 ?auto_27899 ) ) ( not ( = ?auto_27903 ?auto_27901 ) ) ( HOIST-AT ?auto_27902 ?auto_27903 ) ( not ( = ?auto_27906 ?auto_27902 ) ) ( AVAILABLE ?auto_27902 ) ( SURFACE-AT ?auto_27899 ?auto_27903 ) ( ON ?auto_27899 ?auto_27904 ) ( CLEAR ?auto_27899 ) ( not ( = ?auto_27898 ?auto_27904 ) ) ( not ( = ?auto_27899 ?auto_27904 ) ) ( not ( = ?auto_27897 ?auto_27904 ) ) ( IS-CRATE ?auto_27898 ) ( not ( = ?auto_27911 ?auto_27901 ) ) ( not ( = ?auto_27903 ?auto_27911 ) ) ( HOIST-AT ?auto_27915 ?auto_27911 ) ( not ( = ?auto_27906 ?auto_27915 ) ) ( not ( = ?auto_27902 ?auto_27915 ) ) ( AVAILABLE ?auto_27915 ) ( SURFACE-AT ?auto_27898 ?auto_27911 ) ( ON ?auto_27898 ?auto_27910 ) ( CLEAR ?auto_27898 ) ( not ( = ?auto_27898 ?auto_27910 ) ) ( not ( = ?auto_27899 ?auto_27910 ) ) ( not ( = ?auto_27897 ?auto_27910 ) ) ( not ( = ?auto_27904 ?auto_27910 ) ) ( IS-CRATE ?auto_27897 ) ( not ( = ?auto_27896 ?auto_27897 ) ) ( not ( = ?auto_27898 ?auto_27896 ) ) ( not ( = ?auto_27899 ?auto_27896 ) ) ( not ( = ?auto_27904 ?auto_27896 ) ) ( not ( = ?auto_27910 ?auto_27896 ) ) ( not ( = ?auto_27913 ?auto_27901 ) ) ( not ( = ?auto_27903 ?auto_27913 ) ) ( not ( = ?auto_27911 ?auto_27913 ) ) ( HOIST-AT ?auto_27914 ?auto_27913 ) ( not ( = ?auto_27906 ?auto_27914 ) ) ( not ( = ?auto_27902 ?auto_27914 ) ) ( not ( = ?auto_27915 ?auto_27914 ) ) ( AVAILABLE ?auto_27914 ) ( SURFACE-AT ?auto_27897 ?auto_27913 ) ( ON ?auto_27897 ?auto_27912 ) ( CLEAR ?auto_27897 ) ( not ( = ?auto_27898 ?auto_27912 ) ) ( not ( = ?auto_27899 ?auto_27912 ) ) ( not ( = ?auto_27897 ?auto_27912 ) ) ( not ( = ?auto_27904 ?auto_27912 ) ) ( not ( = ?auto_27910 ?auto_27912 ) ) ( not ( = ?auto_27896 ?auto_27912 ) ) ( SURFACE-AT ?auto_27900 ?auto_27901 ) ( CLEAR ?auto_27900 ) ( IS-CRATE ?auto_27896 ) ( not ( = ?auto_27900 ?auto_27896 ) ) ( not ( = ?auto_27898 ?auto_27900 ) ) ( not ( = ?auto_27899 ?auto_27900 ) ) ( not ( = ?auto_27897 ?auto_27900 ) ) ( not ( = ?auto_27904 ?auto_27900 ) ) ( not ( = ?auto_27910 ?auto_27900 ) ) ( not ( = ?auto_27912 ?auto_27900 ) ) ( AVAILABLE ?auto_27906 ) ( not ( = ?auto_27905 ?auto_27901 ) ) ( not ( = ?auto_27903 ?auto_27905 ) ) ( not ( = ?auto_27911 ?auto_27905 ) ) ( not ( = ?auto_27913 ?auto_27905 ) ) ( HOIST-AT ?auto_27908 ?auto_27905 ) ( not ( = ?auto_27906 ?auto_27908 ) ) ( not ( = ?auto_27902 ?auto_27908 ) ) ( not ( = ?auto_27915 ?auto_27908 ) ) ( not ( = ?auto_27914 ?auto_27908 ) ) ( AVAILABLE ?auto_27908 ) ( SURFACE-AT ?auto_27896 ?auto_27905 ) ( ON ?auto_27896 ?auto_27909 ) ( CLEAR ?auto_27896 ) ( not ( = ?auto_27898 ?auto_27909 ) ) ( not ( = ?auto_27899 ?auto_27909 ) ) ( not ( = ?auto_27897 ?auto_27909 ) ) ( not ( = ?auto_27904 ?auto_27909 ) ) ( not ( = ?auto_27910 ?auto_27909 ) ) ( not ( = ?auto_27896 ?auto_27909 ) ) ( not ( = ?auto_27912 ?auto_27909 ) ) ( not ( = ?auto_27900 ?auto_27909 ) ) ( TRUCK-AT ?auto_27907 ?auto_27901 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27897 ?auto_27898 ?auto_27899 )
      ( MAKE-3CRATE-VERIFY ?auto_27896 ?auto_27897 ?auto_27898 ?auto_27899 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27916 - SURFACE
      ?auto_27917 - SURFACE
      ?auto_27918 - SURFACE
      ?auto_27919 - SURFACE
      ?auto_27920 - SURFACE
    )
    :vars
    (
      ?auto_27926 - HOIST
      ?auto_27921 - PLACE
      ?auto_27923 - PLACE
      ?auto_27922 - HOIST
      ?auto_27924 - SURFACE
      ?auto_27931 - PLACE
      ?auto_27935 - HOIST
      ?auto_27930 - SURFACE
      ?auto_27933 - PLACE
      ?auto_27934 - HOIST
      ?auto_27932 - SURFACE
      ?auto_27925 - PLACE
      ?auto_27928 - HOIST
      ?auto_27929 - SURFACE
      ?auto_27927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27926 ?auto_27921 ) ( IS-CRATE ?auto_27920 ) ( not ( = ?auto_27919 ?auto_27920 ) ) ( not ( = ?auto_27918 ?auto_27919 ) ) ( not ( = ?auto_27918 ?auto_27920 ) ) ( not ( = ?auto_27923 ?auto_27921 ) ) ( HOIST-AT ?auto_27922 ?auto_27923 ) ( not ( = ?auto_27926 ?auto_27922 ) ) ( AVAILABLE ?auto_27922 ) ( SURFACE-AT ?auto_27920 ?auto_27923 ) ( ON ?auto_27920 ?auto_27924 ) ( CLEAR ?auto_27920 ) ( not ( = ?auto_27919 ?auto_27924 ) ) ( not ( = ?auto_27920 ?auto_27924 ) ) ( not ( = ?auto_27918 ?auto_27924 ) ) ( IS-CRATE ?auto_27919 ) ( not ( = ?auto_27931 ?auto_27921 ) ) ( not ( = ?auto_27923 ?auto_27931 ) ) ( HOIST-AT ?auto_27935 ?auto_27931 ) ( not ( = ?auto_27926 ?auto_27935 ) ) ( not ( = ?auto_27922 ?auto_27935 ) ) ( AVAILABLE ?auto_27935 ) ( SURFACE-AT ?auto_27919 ?auto_27931 ) ( ON ?auto_27919 ?auto_27930 ) ( CLEAR ?auto_27919 ) ( not ( = ?auto_27919 ?auto_27930 ) ) ( not ( = ?auto_27920 ?auto_27930 ) ) ( not ( = ?auto_27918 ?auto_27930 ) ) ( not ( = ?auto_27924 ?auto_27930 ) ) ( IS-CRATE ?auto_27918 ) ( not ( = ?auto_27917 ?auto_27918 ) ) ( not ( = ?auto_27919 ?auto_27917 ) ) ( not ( = ?auto_27920 ?auto_27917 ) ) ( not ( = ?auto_27924 ?auto_27917 ) ) ( not ( = ?auto_27930 ?auto_27917 ) ) ( not ( = ?auto_27933 ?auto_27921 ) ) ( not ( = ?auto_27923 ?auto_27933 ) ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( HOIST-AT ?auto_27934 ?auto_27933 ) ( not ( = ?auto_27926 ?auto_27934 ) ) ( not ( = ?auto_27922 ?auto_27934 ) ) ( not ( = ?auto_27935 ?auto_27934 ) ) ( AVAILABLE ?auto_27934 ) ( SURFACE-AT ?auto_27918 ?auto_27933 ) ( ON ?auto_27918 ?auto_27932 ) ( CLEAR ?auto_27918 ) ( not ( = ?auto_27919 ?auto_27932 ) ) ( not ( = ?auto_27920 ?auto_27932 ) ) ( not ( = ?auto_27918 ?auto_27932 ) ) ( not ( = ?auto_27924 ?auto_27932 ) ) ( not ( = ?auto_27930 ?auto_27932 ) ) ( not ( = ?auto_27917 ?auto_27932 ) ) ( SURFACE-AT ?auto_27916 ?auto_27921 ) ( CLEAR ?auto_27916 ) ( IS-CRATE ?auto_27917 ) ( not ( = ?auto_27916 ?auto_27917 ) ) ( not ( = ?auto_27919 ?auto_27916 ) ) ( not ( = ?auto_27920 ?auto_27916 ) ) ( not ( = ?auto_27918 ?auto_27916 ) ) ( not ( = ?auto_27924 ?auto_27916 ) ) ( not ( = ?auto_27930 ?auto_27916 ) ) ( not ( = ?auto_27932 ?auto_27916 ) ) ( AVAILABLE ?auto_27926 ) ( not ( = ?auto_27925 ?auto_27921 ) ) ( not ( = ?auto_27923 ?auto_27925 ) ) ( not ( = ?auto_27931 ?auto_27925 ) ) ( not ( = ?auto_27933 ?auto_27925 ) ) ( HOIST-AT ?auto_27928 ?auto_27925 ) ( not ( = ?auto_27926 ?auto_27928 ) ) ( not ( = ?auto_27922 ?auto_27928 ) ) ( not ( = ?auto_27935 ?auto_27928 ) ) ( not ( = ?auto_27934 ?auto_27928 ) ) ( AVAILABLE ?auto_27928 ) ( SURFACE-AT ?auto_27917 ?auto_27925 ) ( ON ?auto_27917 ?auto_27929 ) ( CLEAR ?auto_27917 ) ( not ( = ?auto_27919 ?auto_27929 ) ) ( not ( = ?auto_27920 ?auto_27929 ) ) ( not ( = ?auto_27918 ?auto_27929 ) ) ( not ( = ?auto_27924 ?auto_27929 ) ) ( not ( = ?auto_27930 ?auto_27929 ) ) ( not ( = ?auto_27917 ?auto_27929 ) ) ( not ( = ?auto_27932 ?auto_27929 ) ) ( not ( = ?auto_27916 ?auto_27929 ) ) ( TRUCK-AT ?auto_27927 ?auto_27921 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27918 ?auto_27919 ?auto_27920 )
      ( MAKE-4CRATE-VERIFY ?auto_27916 ?auto_27917 ?auto_27918 ?auto_27919 ?auto_27920 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27936 - SURFACE
      ?auto_27937 - SURFACE
      ?auto_27938 - SURFACE
      ?auto_27939 - SURFACE
      ?auto_27940 - SURFACE
      ?auto_27941 - SURFACE
    )
    :vars
    (
      ?auto_27947 - HOIST
      ?auto_27942 - PLACE
      ?auto_27944 - PLACE
      ?auto_27943 - HOIST
      ?auto_27945 - SURFACE
      ?auto_27952 - PLACE
      ?auto_27956 - HOIST
      ?auto_27951 - SURFACE
      ?auto_27954 - PLACE
      ?auto_27955 - HOIST
      ?auto_27953 - SURFACE
      ?auto_27946 - PLACE
      ?auto_27949 - HOIST
      ?auto_27950 - SURFACE
      ?auto_27948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27947 ?auto_27942 ) ( IS-CRATE ?auto_27941 ) ( not ( = ?auto_27940 ?auto_27941 ) ) ( not ( = ?auto_27939 ?auto_27940 ) ) ( not ( = ?auto_27939 ?auto_27941 ) ) ( not ( = ?auto_27944 ?auto_27942 ) ) ( HOIST-AT ?auto_27943 ?auto_27944 ) ( not ( = ?auto_27947 ?auto_27943 ) ) ( AVAILABLE ?auto_27943 ) ( SURFACE-AT ?auto_27941 ?auto_27944 ) ( ON ?auto_27941 ?auto_27945 ) ( CLEAR ?auto_27941 ) ( not ( = ?auto_27940 ?auto_27945 ) ) ( not ( = ?auto_27941 ?auto_27945 ) ) ( not ( = ?auto_27939 ?auto_27945 ) ) ( IS-CRATE ?auto_27940 ) ( not ( = ?auto_27952 ?auto_27942 ) ) ( not ( = ?auto_27944 ?auto_27952 ) ) ( HOIST-AT ?auto_27956 ?auto_27952 ) ( not ( = ?auto_27947 ?auto_27956 ) ) ( not ( = ?auto_27943 ?auto_27956 ) ) ( AVAILABLE ?auto_27956 ) ( SURFACE-AT ?auto_27940 ?auto_27952 ) ( ON ?auto_27940 ?auto_27951 ) ( CLEAR ?auto_27940 ) ( not ( = ?auto_27940 ?auto_27951 ) ) ( not ( = ?auto_27941 ?auto_27951 ) ) ( not ( = ?auto_27939 ?auto_27951 ) ) ( not ( = ?auto_27945 ?auto_27951 ) ) ( IS-CRATE ?auto_27939 ) ( not ( = ?auto_27938 ?auto_27939 ) ) ( not ( = ?auto_27940 ?auto_27938 ) ) ( not ( = ?auto_27941 ?auto_27938 ) ) ( not ( = ?auto_27945 ?auto_27938 ) ) ( not ( = ?auto_27951 ?auto_27938 ) ) ( not ( = ?auto_27954 ?auto_27942 ) ) ( not ( = ?auto_27944 ?auto_27954 ) ) ( not ( = ?auto_27952 ?auto_27954 ) ) ( HOIST-AT ?auto_27955 ?auto_27954 ) ( not ( = ?auto_27947 ?auto_27955 ) ) ( not ( = ?auto_27943 ?auto_27955 ) ) ( not ( = ?auto_27956 ?auto_27955 ) ) ( AVAILABLE ?auto_27955 ) ( SURFACE-AT ?auto_27939 ?auto_27954 ) ( ON ?auto_27939 ?auto_27953 ) ( CLEAR ?auto_27939 ) ( not ( = ?auto_27940 ?auto_27953 ) ) ( not ( = ?auto_27941 ?auto_27953 ) ) ( not ( = ?auto_27939 ?auto_27953 ) ) ( not ( = ?auto_27945 ?auto_27953 ) ) ( not ( = ?auto_27951 ?auto_27953 ) ) ( not ( = ?auto_27938 ?auto_27953 ) ) ( SURFACE-AT ?auto_27937 ?auto_27942 ) ( CLEAR ?auto_27937 ) ( IS-CRATE ?auto_27938 ) ( not ( = ?auto_27937 ?auto_27938 ) ) ( not ( = ?auto_27940 ?auto_27937 ) ) ( not ( = ?auto_27941 ?auto_27937 ) ) ( not ( = ?auto_27939 ?auto_27937 ) ) ( not ( = ?auto_27945 ?auto_27937 ) ) ( not ( = ?auto_27951 ?auto_27937 ) ) ( not ( = ?auto_27953 ?auto_27937 ) ) ( AVAILABLE ?auto_27947 ) ( not ( = ?auto_27946 ?auto_27942 ) ) ( not ( = ?auto_27944 ?auto_27946 ) ) ( not ( = ?auto_27952 ?auto_27946 ) ) ( not ( = ?auto_27954 ?auto_27946 ) ) ( HOIST-AT ?auto_27949 ?auto_27946 ) ( not ( = ?auto_27947 ?auto_27949 ) ) ( not ( = ?auto_27943 ?auto_27949 ) ) ( not ( = ?auto_27956 ?auto_27949 ) ) ( not ( = ?auto_27955 ?auto_27949 ) ) ( AVAILABLE ?auto_27949 ) ( SURFACE-AT ?auto_27938 ?auto_27946 ) ( ON ?auto_27938 ?auto_27950 ) ( CLEAR ?auto_27938 ) ( not ( = ?auto_27940 ?auto_27950 ) ) ( not ( = ?auto_27941 ?auto_27950 ) ) ( not ( = ?auto_27939 ?auto_27950 ) ) ( not ( = ?auto_27945 ?auto_27950 ) ) ( not ( = ?auto_27951 ?auto_27950 ) ) ( not ( = ?auto_27938 ?auto_27950 ) ) ( not ( = ?auto_27953 ?auto_27950 ) ) ( not ( = ?auto_27937 ?auto_27950 ) ) ( TRUCK-AT ?auto_27948 ?auto_27942 ) ( ON ?auto_27937 ?auto_27936 ) ( not ( = ?auto_27936 ?auto_27937 ) ) ( not ( = ?auto_27936 ?auto_27938 ) ) ( not ( = ?auto_27936 ?auto_27939 ) ) ( not ( = ?auto_27936 ?auto_27940 ) ) ( not ( = ?auto_27936 ?auto_27941 ) ) ( not ( = ?auto_27936 ?auto_27945 ) ) ( not ( = ?auto_27936 ?auto_27951 ) ) ( not ( = ?auto_27936 ?auto_27953 ) ) ( not ( = ?auto_27936 ?auto_27950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27939 ?auto_27940 ?auto_27941 )
      ( MAKE-5CRATE-VERIFY ?auto_27936 ?auto_27937 ?auto_27938 ?auto_27939 ?auto_27940 ?auto_27941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27957 - SURFACE
      ?auto_27958 - SURFACE
    )
    :vars
    (
      ?auto_27965 - HOIST
      ?auto_27960 - PLACE
      ?auto_27970 - SURFACE
      ?auto_27962 - PLACE
      ?auto_27961 - HOIST
      ?auto_27963 - SURFACE
      ?auto_27972 - PLACE
      ?auto_27976 - HOIST
      ?auto_27971 - SURFACE
      ?auto_27967 - SURFACE
      ?auto_27974 - PLACE
      ?auto_27975 - HOIST
      ?auto_27973 - SURFACE
      ?auto_27959 - SURFACE
      ?auto_27964 - PLACE
      ?auto_27968 - HOIST
      ?auto_27969 - SURFACE
      ?auto_27966 - TRUCK
      ?auto_27977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27965 ?auto_27960 ) ( IS-CRATE ?auto_27958 ) ( not ( = ?auto_27957 ?auto_27958 ) ) ( not ( = ?auto_27970 ?auto_27957 ) ) ( not ( = ?auto_27970 ?auto_27958 ) ) ( not ( = ?auto_27962 ?auto_27960 ) ) ( HOIST-AT ?auto_27961 ?auto_27962 ) ( not ( = ?auto_27965 ?auto_27961 ) ) ( AVAILABLE ?auto_27961 ) ( SURFACE-AT ?auto_27958 ?auto_27962 ) ( ON ?auto_27958 ?auto_27963 ) ( CLEAR ?auto_27958 ) ( not ( = ?auto_27957 ?auto_27963 ) ) ( not ( = ?auto_27958 ?auto_27963 ) ) ( not ( = ?auto_27970 ?auto_27963 ) ) ( IS-CRATE ?auto_27957 ) ( not ( = ?auto_27972 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27972 ) ) ( HOIST-AT ?auto_27976 ?auto_27972 ) ( not ( = ?auto_27965 ?auto_27976 ) ) ( not ( = ?auto_27961 ?auto_27976 ) ) ( AVAILABLE ?auto_27976 ) ( SURFACE-AT ?auto_27957 ?auto_27972 ) ( ON ?auto_27957 ?auto_27971 ) ( CLEAR ?auto_27957 ) ( not ( = ?auto_27957 ?auto_27971 ) ) ( not ( = ?auto_27958 ?auto_27971 ) ) ( not ( = ?auto_27970 ?auto_27971 ) ) ( not ( = ?auto_27963 ?auto_27971 ) ) ( IS-CRATE ?auto_27970 ) ( not ( = ?auto_27967 ?auto_27970 ) ) ( not ( = ?auto_27957 ?auto_27967 ) ) ( not ( = ?auto_27958 ?auto_27967 ) ) ( not ( = ?auto_27963 ?auto_27967 ) ) ( not ( = ?auto_27971 ?auto_27967 ) ) ( not ( = ?auto_27974 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27974 ) ) ( not ( = ?auto_27972 ?auto_27974 ) ) ( HOIST-AT ?auto_27975 ?auto_27974 ) ( not ( = ?auto_27965 ?auto_27975 ) ) ( not ( = ?auto_27961 ?auto_27975 ) ) ( not ( = ?auto_27976 ?auto_27975 ) ) ( AVAILABLE ?auto_27975 ) ( SURFACE-AT ?auto_27970 ?auto_27974 ) ( ON ?auto_27970 ?auto_27973 ) ( CLEAR ?auto_27970 ) ( not ( = ?auto_27957 ?auto_27973 ) ) ( not ( = ?auto_27958 ?auto_27973 ) ) ( not ( = ?auto_27970 ?auto_27973 ) ) ( not ( = ?auto_27963 ?auto_27973 ) ) ( not ( = ?auto_27971 ?auto_27973 ) ) ( not ( = ?auto_27967 ?auto_27973 ) ) ( IS-CRATE ?auto_27967 ) ( not ( = ?auto_27959 ?auto_27967 ) ) ( not ( = ?auto_27957 ?auto_27959 ) ) ( not ( = ?auto_27958 ?auto_27959 ) ) ( not ( = ?auto_27970 ?auto_27959 ) ) ( not ( = ?auto_27963 ?auto_27959 ) ) ( not ( = ?auto_27971 ?auto_27959 ) ) ( not ( = ?auto_27973 ?auto_27959 ) ) ( not ( = ?auto_27964 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27964 ) ) ( not ( = ?auto_27972 ?auto_27964 ) ) ( not ( = ?auto_27974 ?auto_27964 ) ) ( HOIST-AT ?auto_27968 ?auto_27964 ) ( not ( = ?auto_27965 ?auto_27968 ) ) ( not ( = ?auto_27961 ?auto_27968 ) ) ( not ( = ?auto_27976 ?auto_27968 ) ) ( not ( = ?auto_27975 ?auto_27968 ) ) ( AVAILABLE ?auto_27968 ) ( SURFACE-AT ?auto_27967 ?auto_27964 ) ( ON ?auto_27967 ?auto_27969 ) ( CLEAR ?auto_27967 ) ( not ( = ?auto_27957 ?auto_27969 ) ) ( not ( = ?auto_27958 ?auto_27969 ) ) ( not ( = ?auto_27970 ?auto_27969 ) ) ( not ( = ?auto_27963 ?auto_27969 ) ) ( not ( = ?auto_27971 ?auto_27969 ) ) ( not ( = ?auto_27967 ?auto_27969 ) ) ( not ( = ?auto_27973 ?auto_27969 ) ) ( not ( = ?auto_27959 ?auto_27969 ) ) ( TRUCK-AT ?auto_27966 ?auto_27960 ) ( SURFACE-AT ?auto_27977 ?auto_27960 ) ( CLEAR ?auto_27977 ) ( LIFTING ?auto_27965 ?auto_27959 ) ( IS-CRATE ?auto_27959 ) ( not ( = ?auto_27977 ?auto_27959 ) ) ( not ( = ?auto_27957 ?auto_27977 ) ) ( not ( = ?auto_27958 ?auto_27977 ) ) ( not ( = ?auto_27970 ?auto_27977 ) ) ( not ( = ?auto_27963 ?auto_27977 ) ) ( not ( = ?auto_27971 ?auto_27977 ) ) ( not ( = ?auto_27967 ?auto_27977 ) ) ( not ( = ?auto_27973 ?auto_27977 ) ) ( not ( = ?auto_27969 ?auto_27977 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27977 ?auto_27959 )
      ( MAKE-2CRATE ?auto_27970 ?auto_27957 ?auto_27958 )
      ( MAKE-1CRATE-VERIFY ?auto_27957 ?auto_27958 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27978 - SURFACE
      ?auto_27979 - SURFACE
      ?auto_27980 - SURFACE
    )
    :vars
    (
      ?auto_27983 - HOIST
      ?auto_27997 - PLACE
      ?auto_27988 - PLACE
      ?auto_27982 - HOIST
      ?auto_27981 - SURFACE
      ?auto_27992 - PLACE
      ?auto_27985 - HOIST
      ?auto_27986 - SURFACE
      ?auto_27991 - SURFACE
      ?auto_27990 - PLACE
      ?auto_27989 - HOIST
      ?auto_27995 - SURFACE
      ?auto_27998 - SURFACE
      ?auto_27987 - PLACE
      ?auto_27984 - HOIST
      ?auto_27993 - SURFACE
      ?auto_27994 - TRUCK
      ?auto_27996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27983 ?auto_27997 ) ( IS-CRATE ?auto_27980 ) ( not ( = ?auto_27979 ?auto_27980 ) ) ( not ( = ?auto_27978 ?auto_27979 ) ) ( not ( = ?auto_27978 ?auto_27980 ) ) ( not ( = ?auto_27988 ?auto_27997 ) ) ( HOIST-AT ?auto_27982 ?auto_27988 ) ( not ( = ?auto_27983 ?auto_27982 ) ) ( AVAILABLE ?auto_27982 ) ( SURFACE-AT ?auto_27980 ?auto_27988 ) ( ON ?auto_27980 ?auto_27981 ) ( CLEAR ?auto_27980 ) ( not ( = ?auto_27979 ?auto_27981 ) ) ( not ( = ?auto_27980 ?auto_27981 ) ) ( not ( = ?auto_27978 ?auto_27981 ) ) ( IS-CRATE ?auto_27979 ) ( not ( = ?auto_27992 ?auto_27997 ) ) ( not ( = ?auto_27988 ?auto_27992 ) ) ( HOIST-AT ?auto_27985 ?auto_27992 ) ( not ( = ?auto_27983 ?auto_27985 ) ) ( not ( = ?auto_27982 ?auto_27985 ) ) ( AVAILABLE ?auto_27985 ) ( SURFACE-AT ?auto_27979 ?auto_27992 ) ( ON ?auto_27979 ?auto_27986 ) ( CLEAR ?auto_27979 ) ( not ( = ?auto_27979 ?auto_27986 ) ) ( not ( = ?auto_27980 ?auto_27986 ) ) ( not ( = ?auto_27978 ?auto_27986 ) ) ( not ( = ?auto_27981 ?auto_27986 ) ) ( IS-CRATE ?auto_27978 ) ( not ( = ?auto_27991 ?auto_27978 ) ) ( not ( = ?auto_27979 ?auto_27991 ) ) ( not ( = ?auto_27980 ?auto_27991 ) ) ( not ( = ?auto_27981 ?auto_27991 ) ) ( not ( = ?auto_27986 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27997 ) ) ( not ( = ?auto_27988 ?auto_27990 ) ) ( not ( = ?auto_27992 ?auto_27990 ) ) ( HOIST-AT ?auto_27989 ?auto_27990 ) ( not ( = ?auto_27983 ?auto_27989 ) ) ( not ( = ?auto_27982 ?auto_27989 ) ) ( not ( = ?auto_27985 ?auto_27989 ) ) ( AVAILABLE ?auto_27989 ) ( SURFACE-AT ?auto_27978 ?auto_27990 ) ( ON ?auto_27978 ?auto_27995 ) ( CLEAR ?auto_27978 ) ( not ( = ?auto_27979 ?auto_27995 ) ) ( not ( = ?auto_27980 ?auto_27995 ) ) ( not ( = ?auto_27978 ?auto_27995 ) ) ( not ( = ?auto_27981 ?auto_27995 ) ) ( not ( = ?auto_27986 ?auto_27995 ) ) ( not ( = ?auto_27991 ?auto_27995 ) ) ( IS-CRATE ?auto_27991 ) ( not ( = ?auto_27998 ?auto_27991 ) ) ( not ( = ?auto_27979 ?auto_27998 ) ) ( not ( = ?auto_27980 ?auto_27998 ) ) ( not ( = ?auto_27978 ?auto_27998 ) ) ( not ( = ?auto_27981 ?auto_27998 ) ) ( not ( = ?auto_27986 ?auto_27998 ) ) ( not ( = ?auto_27995 ?auto_27998 ) ) ( not ( = ?auto_27987 ?auto_27997 ) ) ( not ( = ?auto_27988 ?auto_27987 ) ) ( not ( = ?auto_27992 ?auto_27987 ) ) ( not ( = ?auto_27990 ?auto_27987 ) ) ( HOIST-AT ?auto_27984 ?auto_27987 ) ( not ( = ?auto_27983 ?auto_27984 ) ) ( not ( = ?auto_27982 ?auto_27984 ) ) ( not ( = ?auto_27985 ?auto_27984 ) ) ( not ( = ?auto_27989 ?auto_27984 ) ) ( AVAILABLE ?auto_27984 ) ( SURFACE-AT ?auto_27991 ?auto_27987 ) ( ON ?auto_27991 ?auto_27993 ) ( CLEAR ?auto_27991 ) ( not ( = ?auto_27979 ?auto_27993 ) ) ( not ( = ?auto_27980 ?auto_27993 ) ) ( not ( = ?auto_27978 ?auto_27993 ) ) ( not ( = ?auto_27981 ?auto_27993 ) ) ( not ( = ?auto_27986 ?auto_27993 ) ) ( not ( = ?auto_27991 ?auto_27993 ) ) ( not ( = ?auto_27995 ?auto_27993 ) ) ( not ( = ?auto_27998 ?auto_27993 ) ) ( TRUCK-AT ?auto_27994 ?auto_27997 ) ( SURFACE-AT ?auto_27996 ?auto_27997 ) ( CLEAR ?auto_27996 ) ( LIFTING ?auto_27983 ?auto_27998 ) ( IS-CRATE ?auto_27998 ) ( not ( = ?auto_27996 ?auto_27998 ) ) ( not ( = ?auto_27979 ?auto_27996 ) ) ( not ( = ?auto_27980 ?auto_27996 ) ) ( not ( = ?auto_27978 ?auto_27996 ) ) ( not ( = ?auto_27981 ?auto_27996 ) ) ( not ( = ?auto_27986 ?auto_27996 ) ) ( not ( = ?auto_27991 ?auto_27996 ) ) ( not ( = ?auto_27995 ?auto_27996 ) ) ( not ( = ?auto_27993 ?auto_27996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27979 ?auto_27980 )
      ( MAKE-2CRATE-VERIFY ?auto_27978 ?auto_27979 ?auto_27980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27999 - SURFACE
      ?auto_28000 - SURFACE
      ?auto_28001 - SURFACE
      ?auto_28002 - SURFACE
    )
    :vars
    (
      ?auto_28007 - HOIST
      ?auto_28008 - PLACE
      ?auto_28009 - PLACE
      ?auto_28012 - HOIST
      ?auto_28010 - SURFACE
      ?auto_28018 - PLACE
      ?auto_28017 - HOIST
      ?auto_28014 - SURFACE
      ?auto_28005 - PLACE
      ?auto_28003 - HOIST
      ?auto_28015 - SURFACE
      ?auto_28006 - SURFACE
      ?auto_28011 - PLACE
      ?auto_28004 - HOIST
      ?auto_28019 - SURFACE
      ?auto_28016 - TRUCK
      ?auto_28013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28007 ?auto_28008 ) ( IS-CRATE ?auto_28002 ) ( not ( = ?auto_28001 ?auto_28002 ) ) ( not ( = ?auto_28000 ?auto_28001 ) ) ( not ( = ?auto_28000 ?auto_28002 ) ) ( not ( = ?auto_28009 ?auto_28008 ) ) ( HOIST-AT ?auto_28012 ?auto_28009 ) ( not ( = ?auto_28007 ?auto_28012 ) ) ( AVAILABLE ?auto_28012 ) ( SURFACE-AT ?auto_28002 ?auto_28009 ) ( ON ?auto_28002 ?auto_28010 ) ( CLEAR ?auto_28002 ) ( not ( = ?auto_28001 ?auto_28010 ) ) ( not ( = ?auto_28002 ?auto_28010 ) ) ( not ( = ?auto_28000 ?auto_28010 ) ) ( IS-CRATE ?auto_28001 ) ( not ( = ?auto_28018 ?auto_28008 ) ) ( not ( = ?auto_28009 ?auto_28018 ) ) ( HOIST-AT ?auto_28017 ?auto_28018 ) ( not ( = ?auto_28007 ?auto_28017 ) ) ( not ( = ?auto_28012 ?auto_28017 ) ) ( AVAILABLE ?auto_28017 ) ( SURFACE-AT ?auto_28001 ?auto_28018 ) ( ON ?auto_28001 ?auto_28014 ) ( CLEAR ?auto_28001 ) ( not ( = ?auto_28001 ?auto_28014 ) ) ( not ( = ?auto_28002 ?auto_28014 ) ) ( not ( = ?auto_28000 ?auto_28014 ) ) ( not ( = ?auto_28010 ?auto_28014 ) ) ( IS-CRATE ?auto_28000 ) ( not ( = ?auto_27999 ?auto_28000 ) ) ( not ( = ?auto_28001 ?auto_27999 ) ) ( not ( = ?auto_28002 ?auto_27999 ) ) ( not ( = ?auto_28010 ?auto_27999 ) ) ( not ( = ?auto_28014 ?auto_27999 ) ) ( not ( = ?auto_28005 ?auto_28008 ) ) ( not ( = ?auto_28009 ?auto_28005 ) ) ( not ( = ?auto_28018 ?auto_28005 ) ) ( HOIST-AT ?auto_28003 ?auto_28005 ) ( not ( = ?auto_28007 ?auto_28003 ) ) ( not ( = ?auto_28012 ?auto_28003 ) ) ( not ( = ?auto_28017 ?auto_28003 ) ) ( AVAILABLE ?auto_28003 ) ( SURFACE-AT ?auto_28000 ?auto_28005 ) ( ON ?auto_28000 ?auto_28015 ) ( CLEAR ?auto_28000 ) ( not ( = ?auto_28001 ?auto_28015 ) ) ( not ( = ?auto_28002 ?auto_28015 ) ) ( not ( = ?auto_28000 ?auto_28015 ) ) ( not ( = ?auto_28010 ?auto_28015 ) ) ( not ( = ?auto_28014 ?auto_28015 ) ) ( not ( = ?auto_27999 ?auto_28015 ) ) ( IS-CRATE ?auto_27999 ) ( not ( = ?auto_28006 ?auto_27999 ) ) ( not ( = ?auto_28001 ?auto_28006 ) ) ( not ( = ?auto_28002 ?auto_28006 ) ) ( not ( = ?auto_28000 ?auto_28006 ) ) ( not ( = ?auto_28010 ?auto_28006 ) ) ( not ( = ?auto_28014 ?auto_28006 ) ) ( not ( = ?auto_28015 ?auto_28006 ) ) ( not ( = ?auto_28011 ?auto_28008 ) ) ( not ( = ?auto_28009 ?auto_28011 ) ) ( not ( = ?auto_28018 ?auto_28011 ) ) ( not ( = ?auto_28005 ?auto_28011 ) ) ( HOIST-AT ?auto_28004 ?auto_28011 ) ( not ( = ?auto_28007 ?auto_28004 ) ) ( not ( = ?auto_28012 ?auto_28004 ) ) ( not ( = ?auto_28017 ?auto_28004 ) ) ( not ( = ?auto_28003 ?auto_28004 ) ) ( AVAILABLE ?auto_28004 ) ( SURFACE-AT ?auto_27999 ?auto_28011 ) ( ON ?auto_27999 ?auto_28019 ) ( CLEAR ?auto_27999 ) ( not ( = ?auto_28001 ?auto_28019 ) ) ( not ( = ?auto_28002 ?auto_28019 ) ) ( not ( = ?auto_28000 ?auto_28019 ) ) ( not ( = ?auto_28010 ?auto_28019 ) ) ( not ( = ?auto_28014 ?auto_28019 ) ) ( not ( = ?auto_27999 ?auto_28019 ) ) ( not ( = ?auto_28015 ?auto_28019 ) ) ( not ( = ?auto_28006 ?auto_28019 ) ) ( TRUCK-AT ?auto_28016 ?auto_28008 ) ( SURFACE-AT ?auto_28013 ?auto_28008 ) ( CLEAR ?auto_28013 ) ( LIFTING ?auto_28007 ?auto_28006 ) ( IS-CRATE ?auto_28006 ) ( not ( = ?auto_28013 ?auto_28006 ) ) ( not ( = ?auto_28001 ?auto_28013 ) ) ( not ( = ?auto_28002 ?auto_28013 ) ) ( not ( = ?auto_28000 ?auto_28013 ) ) ( not ( = ?auto_28010 ?auto_28013 ) ) ( not ( = ?auto_28014 ?auto_28013 ) ) ( not ( = ?auto_27999 ?auto_28013 ) ) ( not ( = ?auto_28015 ?auto_28013 ) ) ( not ( = ?auto_28019 ?auto_28013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28000 ?auto_28001 ?auto_28002 )
      ( MAKE-3CRATE-VERIFY ?auto_27999 ?auto_28000 ?auto_28001 ?auto_28002 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28020 - SURFACE
      ?auto_28021 - SURFACE
      ?auto_28022 - SURFACE
      ?auto_28023 - SURFACE
      ?auto_28024 - SURFACE
    )
    :vars
    (
      ?auto_28028 - HOIST
      ?auto_28029 - PLACE
      ?auto_28030 - PLACE
      ?auto_28033 - HOIST
      ?auto_28031 - SURFACE
      ?auto_28039 - PLACE
      ?auto_28038 - HOIST
      ?auto_28035 - SURFACE
      ?auto_28027 - PLACE
      ?auto_28025 - HOIST
      ?auto_28036 - SURFACE
      ?auto_28032 - PLACE
      ?auto_28026 - HOIST
      ?auto_28040 - SURFACE
      ?auto_28037 - TRUCK
      ?auto_28034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28028 ?auto_28029 ) ( IS-CRATE ?auto_28024 ) ( not ( = ?auto_28023 ?auto_28024 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28024 ) ) ( not ( = ?auto_28030 ?auto_28029 ) ) ( HOIST-AT ?auto_28033 ?auto_28030 ) ( not ( = ?auto_28028 ?auto_28033 ) ) ( AVAILABLE ?auto_28033 ) ( SURFACE-AT ?auto_28024 ?auto_28030 ) ( ON ?auto_28024 ?auto_28031 ) ( CLEAR ?auto_28024 ) ( not ( = ?auto_28023 ?auto_28031 ) ) ( not ( = ?auto_28024 ?auto_28031 ) ) ( not ( = ?auto_28022 ?auto_28031 ) ) ( IS-CRATE ?auto_28023 ) ( not ( = ?auto_28039 ?auto_28029 ) ) ( not ( = ?auto_28030 ?auto_28039 ) ) ( HOIST-AT ?auto_28038 ?auto_28039 ) ( not ( = ?auto_28028 ?auto_28038 ) ) ( not ( = ?auto_28033 ?auto_28038 ) ) ( AVAILABLE ?auto_28038 ) ( SURFACE-AT ?auto_28023 ?auto_28039 ) ( ON ?auto_28023 ?auto_28035 ) ( CLEAR ?auto_28023 ) ( not ( = ?auto_28023 ?auto_28035 ) ) ( not ( = ?auto_28024 ?auto_28035 ) ) ( not ( = ?auto_28022 ?auto_28035 ) ) ( not ( = ?auto_28031 ?auto_28035 ) ) ( IS-CRATE ?auto_28022 ) ( not ( = ?auto_28021 ?auto_28022 ) ) ( not ( = ?auto_28023 ?auto_28021 ) ) ( not ( = ?auto_28024 ?auto_28021 ) ) ( not ( = ?auto_28031 ?auto_28021 ) ) ( not ( = ?auto_28035 ?auto_28021 ) ) ( not ( = ?auto_28027 ?auto_28029 ) ) ( not ( = ?auto_28030 ?auto_28027 ) ) ( not ( = ?auto_28039 ?auto_28027 ) ) ( HOIST-AT ?auto_28025 ?auto_28027 ) ( not ( = ?auto_28028 ?auto_28025 ) ) ( not ( = ?auto_28033 ?auto_28025 ) ) ( not ( = ?auto_28038 ?auto_28025 ) ) ( AVAILABLE ?auto_28025 ) ( SURFACE-AT ?auto_28022 ?auto_28027 ) ( ON ?auto_28022 ?auto_28036 ) ( CLEAR ?auto_28022 ) ( not ( = ?auto_28023 ?auto_28036 ) ) ( not ( = ?auto_28024 ?auto_28036 ) ) ( not ( = ?auto_28022 ?auto_28036 ) ) ( not ( = ?auto_28031 ?auto_28036 ) ) ( not ( = ?auto_28035 ?auto_28036 ) ) ( not ( = ?auto_28021 ?auto_28036 ) ) ( IS-CRATE ?auto_28021 ) ( not ( = ?auto_28020 ?auto_28021 ) ) ( not ( = ?auto_28023 ?auto_28020 ) ) ( not ( = ?auto_28024 ?auto_28020 ) ) ( not ( = ?auto_28022 ?auto_28020 ) ) ( not ( = ?auto_28031 ?auto_28020 ) ) ( not ( = ?auto_28035 ?auto_28020 ) ) ( not ( = ?auto_28036 ?auto_28020 ) ) ( not ( = ?auto_28032 ?auto_28029 ) ) ( not ( = ?auto_28030 ?auto_28032 ) ) ( not ( = ?auto_28039 ?auto_28032 ) ) ( not ( = ?auto_28027 ?auto_28032 ) ) ( HOIST-AT ?auto_28026 ?auto_28032 ) ( not ( = ?auto_28028 ?auto_28026 ) ) ( not ( = ?auto_28033 ?auto_28026 ) ) ( not ( = ?auto_28038 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( AVAILABLE ?auto_28026 ) ( SURFACE-AT ?auto_28021 ?auto_28032 ) ( ON ?auto_28021 ?auto_28040 ) ( CLEAR ?auto_28021 ) ( not ( = ?auto_28023 ?auto_28040 ) ) ( not ( = ?auto_28024 ?auto_28040 ) ) ( not ( = ?auto_28022 ?auto_28040 ) ) ( not ( = ?auto_28031 ?auto_28040 ) ) ( not ( = ?auto_28035 ?auto_28040 ) ) ( not ( = ?auto_28021 ?auto_28040 ) ) ( not ( = ?auto_28036 ?auto_28040 ) ) ( not ( = ?auto_28020 ?auto_28040 ) ) ( TRUCK-AT ?auto_28037 ?auto_28029 ) ( SURFACE-AT ?auto_28034 ?auto_28029 ) ( CLEAR ?auto_28034 ) ( LIFTING ?auto_28028 ?auto_28020 ) ( IS-CRATE ?auto_28020 ) ( not ( = ?auto_28034 ?auto_28020 ) ) ( not ( = ?auto_28023 ?auto_28034 ) ) ( not ( = ?auto_28024 ?auto_28034 ) ) ( not ( = ?auto_28022 ?auto_28034 ) ) ( not ( = ?auto_28031 ?auto_28034 ) ) ( not ( = ?auto_28035 ?auto_28034 ) ) ( not ( = ?auto_28021 ?auto_28034 ) ) ( not ( = ?auto_28036 ?auto_28034 ) ) ( not ( = ?auto_28040 ?auto_28034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28022 ?auto_28023 ?auto_28024 )
      ( MAKE-4CRATE-VERIFY ?auto_28020 ?auto_28021 ?auto_28022 ?auto_28023 ?auto_28024 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28041 - SURFACE
      ?auto_28042 - SURFACE
      ?auto_28043 - SURFACE
      ?auto_28044 - SURFACE
      ?auto_28045 - SURFACE
      ?auto_28046 - SURFACE
    )
    :vars
    (
      ?auto_28050 - HOIST
      ?auto_28051 - PLACE
      ?auto_28052 - PLACE
      ?auto_28055 - HOIST
      ?auto_28053 - SURFACE
      ?auto_28060 - PLACE
      ?auto_28059 - HOIST
      ?auto_28056 - SURFACE
      ?auto_28049 - PLACE
      ?auto_28047 - HOIST
      ?auto_28057 - SURFACE
      ?auto_28054 - PLACE
      ?auto_28048 - HOIST
      ?auto_28061 - SURFACE
      ?auto_28058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28050 ?auto_28051 ) ( IS-CRATE ?auto_28046 ) ( not ( = ?auto_28045 ?auto_28046 ) ) ( not ( = ?auto_28044 ?auto_28045 ) ) ( not ( = ?auto_28044 ?auto_28046 ) ) ( not ( = ?auto_28052 ?auto_28051 ) ) ( HOIST-AT ?auto_28055 ?auto_28052 ) ( not ( = ?auto_28050 ?auto_28055 ) ) ( AVAILABLE ?auto_28055 ) ( SURFACE-AT ?auto_28046 ?auto_28052 ) ( ON ?auto_28046 ?auto_28053 ) ( CLEAR ?auto_28046 ) ( not ( = ?auto_28045 ?auto_28053 ) ) ( not ( = ?auto_28046 ?auto_28053 ) ) ( not ( = ?auto_28044 ?auto_28053 ) ) ( IS-CRATE ?auto_28045 ) ( not ( = ?auto_28060 ?auto_28051 ) ) ( not ( = ?auto_28052 ?auto_28060 ) ) ( HOIST-AT ?auto_28059 ?auto_28060 ) ( not ( = ?auto_28050 ?auto_28059 ) ) ( not ( = ?auto_28055 ?auto_28059 ) ) ( AVAILABLE ?auto_28059 ) ( SURFACE-AT ?auto_28045 ?auto_28060 ) ( ON ?auto_28045 ?auto_28056 ) ( CLEAR ?auto_28045 ) ( not ( = ?auto_28045 ?auto_28056 ) ) ( not ( = ?auto_28046 ?auto_28056 ) ) ( not ( = ?auto_28044 ?auto_28056 ) ) ( not ( = ?auto_28053 ?auto_28056 ) ) ( IS-CRATE ?auto_28044 ) ( not ( = ?auto_28043 ?auto_28044 ) ) ( not ( = ?auto_28045 ?auto_28043 ) ) ( not ( = ?auto_28046 ?auto_28043 ) ) ( not ( = ?auto_28053 ?auto_28043 ) ) ( not ( = ?auto_28056 ?auto_28043 ) ) ( not ( = ?auto_28049 ?auto_28051 ) ) ( not ( = ?auto_28052 ?auto_28049 ) ) ( not ( = ?auto_28060 ?auto_28049 ) ) ( HOIST-AT ?auto_28047 ?auto_28049 ) ( not ( = ?auto_28050 ?auto_28047 ) ) ( not ( = ?auto_28055 ?auto_28047 ) ) ( not ( = ?auto_28059 ?auto_28047 ) ) ( AVAILABLE ?auto_28047 ) ( SURFACE-AT ?auto_28044 ?auto_28049 ) ( ON ?auto_28044 ?auto_28057 ) ( CLEAR ?auto_28044 ) ( not ( = ?auto_28045 ?auto_28057 ) ) ( not ( = ?auto_28046 ?auto_28057 ) ) ( not ( = ?auto_28044 ?auto_28057 ) ) ( not ( = ?auto_28053 ?auto_28057 ) ) ( not ( = ?auto_28056 ?auto_28057 ) ) ( not ( = ?auto_28043 ?auto_28057 ) ) ( IS-CRATE ?auto_28043 ) ( not ( = ?auto_28042 ?auto_28043 ) ) ( not ( = ?auto_28045 ?auto_28042 ) ) ( not ( = ?auto_28046 ?auto_28042 ) ) ( not ( = ?auto_28044 ?auto_28042 ) ) ( not ( = ?auto_28053 ?auto_28042 ) ) ( not ( = ?auto_28056 ?auto_28042 ) ) ( not ( = ?auto_28057 ?auto_28042 ) ) ( not ( = ?auto_28054 ?auto_28051 ) ) ( not ( = ?auto_28052 ?auto_28054 ) ) ( not ( = ?auto_28060 ?auto_28054 ) ) ( not ( = ?auto_28049 ?auto_28054 ) ) ( HOIST-AT ?auto_28048 ?auto_28054 ) ( not ( = ?auto_28050 ?auto_28048 ) ) ( not ( = ?auto_28055 ?auto_28048 ) ) ( not ( = ?auto_28059 ?auto_28048 ) ) ( not ( = ?auto_28047 ?auto_28048 ) ) ( AVAILABLE ?auto_28048 ) ( SURFACE-AT ?auto_28043 ?auto_28054 ) ( ON ?auto_28043 ?auto_28061 ) ( CLEAR ?auto_28043 ) ( not ( = ?auto_28045 ?auto_28061 ) ) ( not ( = ?auto_28046 ?auto_28061 ) ) ( not ( = ?auto_28044 ?auto_28061 ) ) ( not ( = ?auto_28053 ?auto_28061 ) ) ( not ( = ?auto_28056 ?auto_28061 ) ) ( not ( = ?auto_28043 ?auto_28061 ) ) ( not ( = ?auto_28057 ?auto_28061 ) ) ( not ( = ?auto_28042 ?auto_28061 ) ) ( TRUCK-AT ?auto_28058 ?auto_28051 ) ( SURFACE-AT ?auto_28041 ?auto_28051 ) ( CLEAR ?auto_28041 ) ( LIFTING ?auto_28050 ?auto_28042 ) ( IS-CRATE ?auto_28042 ) ( not ( = ?auto_28041 ?auto_28042 ) ) ( not ( = ?auto_28045 ?auto_28041 ) ) ( not ( = ?auto_28046 ?auto_28041 ) ) ( not ( = ?auto_28044 ?auto_28041 ) ) ( not ( = ?auto_28053 ?auto_28041 ) ) ( not ( = ?auto_28056 ?auto_28041 ) ) ( not ( = ?auto_28043 ?auto_28041 ) ) ( not ( = ?auto_28057 ?auto_28041 ) ) ( not ( = ?auto_28061 ?auto_28041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28044 ?auto_28045 ?auto_28046 )
      ( MAKE-5CRATE-VERIFY ?auto_28041 ?auto_28042 ?auto_28043 ?auto_28044 ?auto_28045 ?auto_28046 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28062 - SURFACE
      ?auto_28063 - SURFACE
    )
    :vars
    (
      ?auto_28068 - HOIST
      ?auto_28069 - PLACE
      ?auto_28078 - SURFACE
      ?auto_28070 - PLACE
      ?auto_28073 - HOIST
      ?auto_28071 - SURFACE
      ?auto_28080 - PLACE
      ?auto_28079 - HOIST
      ?auto_28075 - SURFACE
      ?auto_28081 - SURFACE
      ?auto_28066 - PLACE
      ?auto_28064 - HOIST
      ?auto_28076 - SURFACE
      ?auto_28067 - SURFACE
      ?auto_28072 - PLACE
      ?auto_28065 - HOIST
      ?auto_28082 - SURFACE
      ?auto_28077 - TRUCK
      ?auto_28074 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28068 ?auto_28069 ) ( IS-CRATE ?auto_28063 ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( not ( = ?auto_28078 ?auto_28062 ) ) ( not ( = ?auto_28078 ?auto_28063 ) ) ( not ( = ?auto_28070 ?auto_28069 ) ) ( HOIST-AT ?auto_28073 ?auto_28070 ) ( not ( = ?auto_28068 ?auto_28073 ) ) ( AVAILABLE ?auto_28073 ) ( SURFACE-AT ?auto_28063 ?auto_28070 ) ( ON ?auto_28063 ?auto_28071 ) ( CLEAR ?auto_28063 ) ( not ( = ?auto_28062 ?auto_28071 ) ) ( not ( = ?auto_28063 ?auto_28071 ) ) ( not ( = ?auto_28078 ?auto_28071 ) ) ( IS-CRATE ?auto_28062 ) ( not ( = ?auto_28080 ?auto_28069 ) ) ( not ( = ?auto_28070 ?auto_28080 ) ) ( HOIST-AT ?auto_28079 ?auto_28080 ) ( not ( = ?auto_28068 ?auto_28079 ) ) ( not ( = ?auto_28073 ?auto_28079 ) ) ( AVAILABLE ?auto_28079 ) ( SURFACE-AT ?auto_28062 ?auto_28080 ) ( ON ?auto_28062 ?auto_28075 ) ( CLEAR ?auto_28062 ) ( not ( = ?auto_28062 ?auto_28075 ) ) ( not ( = ?auto_28063 ?auto_28075 ) ) ( not ( = ?auto_28078 ?auto_28075 ) ) ( not ( = ?auto_28071 ?auto_28075 ) ) ( IS-CRATE ?auto_28078 ) ( not ( = ?auto_28081 ?auto_28078 ) ) ( not ( = ?auto_28062 ?auto_28081 ) ) ( not ( = ?auto_28063 ?auto_28081 ) ) ( not ( = ?auto_28071 ?auto_28081 ) ) ( not ( = ?auto_28075 ?auto_28081 ) ) ( not ( = ?auto_28066 ?auto_28069 ) ) ( not ( = ?auto_28070 ?auto_28066 ) ) ( not ( = ?auto_28080 ?auto_28066 ) ) ( HOIST-AT ?auto_28064 ?auto_28066 ) ( not ( = ?auto_28068 ?auto_28064 ) ) ( not ( = ?auto_28073 ?auto_28064 ) ) ( not ( = ?auto_28079 ?auto_28064 ) ) ( AVAILABLE ?auto_28064 ) ( SURFACE-AT ?auto_28078 ?auto_28066 ) ( ON ?auto_28078 ?auto_28076 ) ( CLEAR ?auto_28078 ) ( not ( = ?auto_28062 ?auto_28076 ) ) ( not ( = ?auto_28063 ?auto_28076 ) ) ( not ( = ?auto_28078 ?auto_28076 ) ) ( not ( = ?auto_28071 ?auto_28076 ) ) ( not ( = ?auto_28075 ?auto_28076 ) ) ( not ( = ?auto_28081 ?auto_28076 ) ) ( IS-CRATE ?auto_28081 ) ( not ( = ?auto_28067 ?auto_28081 ) ) ( not ( = ?auto_28062 ?auto_28067 ) ) ( not ( = ?auto_28063 ?auto_28067 ) ) ( not ( = ?auto_28078 ?auto_28067 ) ) ( not ( = ?auto_28071 ?auto_28067 ) ) ( not ( = ?auto_28075 ?auto_28067 ) ) ( not ( = ?auto_28076 ?auto_28067 ) ) ( not ( = ?auto_28072 ?auto_28069 ) ) ( not ( = ?auto_28070 ?auto_28072 ) ) ( not ( = ?auto_28080 ?auto_28072 ) ) ( not ( = ?auto_28066 ?auto_28072 ) ) ( HOIST-AT ?auto_28065 ?auto_28072 ) ( not ( = ?auto_28068 ?auto_28065 ) ) ( not ( = ?auto_28073 ?auto_28065 ) ) ( not ( = ?auto_28079 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28065 ) ) ( AVAILABLE ?auto_28065 ) ( SURFACE-AT ?auto_28081 ?auto_28072 ) ( ON ?auto_28081 ?auto_28082 ) ( CLEAR ?auto_28081 ) ( not ( = ?auto_28062 ?auto_28082 ) ) ( not ( = ?auto_28063 ?auto_28082 ) ) ( not ( = ?auto_28078 ?auto_28082 ) ) ( not ( = ?auto_28071 ?auto_28082 ) ) ( not ( = ?auto_28075 ?auto_28082 ) ) ( not ( = ?auto_28081 ?auto_28082 ) ) ( not ( = ?auto_28076 ?auto_28082 ) ) ( not ( = ?auto_28067 ?auto_28082 ) ) ( TRUCK-AT ?auto_28077 ?auto_28069 ) ( SURFACE-AT ?auto_28074 ?auto_28069 ) ( CLEAR ?auto_28074 ) ( IS-CRATE ?auto_28067 ) ( not ( = ?auto_28074 ?auto_28067 ) ) ( not ( = ?auto_28062 ?auto_28074 ) ) ( not ( = ?auto_28063 ?auto_28074 ) ) ( not ( = ?auto_28078 ?auto_28074 ) ) ( not ( = ?auto_28071 ?auto_28074 ) ) ( not ( = ?auto_28075 ?auto_28074 ) ) ( not ( = ?auto_28081 ?auto_28074 ) ) ( not ( = ?auto_28076 ?auto_28074 ) ) ( not ( = ?auto_28082 ?auto_28074 ) ) ( AVAILABLE ?auto_28068 ) ( IN ?auto_28067 ?auto_28077 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28068 ?auto_28067 ?auto_28077 ?auto_28069 )
      ( MAKE-2CRATE ?auto_28078 ?auto_28062 ?auto_28063 )
      ( MAKE-1CRATE-VERIFY ?auto_28062 ?auto_28063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28083 - SURFACE
      ?auto_28084 - SURFACE
      ?auto_28085 - SURFACE
    )
    :vars
    (
      ?auto_28092 - HOIST
      ?auto_28089 - PLACE
      ?auto_28095 - PLACE
      ?auto_28093 - HOIST
      ?auto_28090 - SURFACE
      ?auto_28098 - PLACE
      ?auto_28100 - HOIST
      ?auto_28103 - SURFACE
      ?auto_28099 - SURFACE
      ?auto_28102 - PLACE
      ?auto_28101 - HOIST
      ?auto_28096 - SURFACE
      ?auto_28088 - SURFACE
      ?auto_28097 - PLACE
      ?auto_28091 - HOIST
      ?auto_28094 - SURFACE
      ?auto_28087 - TRUCK
      ?auto_28086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28092 ?auto_28089 ) ( IS-CRATE ?auto_28085 ) ( not ( = ?auto_28084 ?auto_28085 ) ) ( not ( = ?auto_28083 ?auto_28084 ) ) ( not ( = ?auto_28083 ?auto_28085 ) ) ( not ( = ?auto_28095 ?auto_28089 ) ) ( HOIST-AT ?auto_28093 ?auto_28095 ) ( not ( = ?auto_28092 ?auto_28093 ) ) ( AVAILABLE ?auto_28093 ) ( SURFACE-AT ?auto_28085 ?auto_28095 ) ( ON ?auto_28085 ?auto_28090 ) ( CLEAR ?auto_28085 ) ( not ( = ?auto_28084 ?auto_28090 ) ) ( not ( = ?auto_28085 ?auto_28090 ) ) ( not ( = ?auto_28083 ?auto_28090 ) ) ( IS-CRATE ?auto_28084 ) ( not ( = ?auto_28098 ?auto_28089 ) ) ( not ( = ?auto_28095 ?auto_28098 ) ) ( HOIST-AT ?auto_28100 ?auto_28098 ) ( not ( = ?auto_28092 ?auto_28100 ) ) ( not ( = ?auto_28093 ?auto_28100 ) ) ( AVAILABLE ?auto_28100 ) ( SURFACE-AT ?auto_28084 ?auto_28098 ) ( ON ?auto_28084 ?auto_28103 ) ( CLEAR ?auto_28084 ) ( not ( = ?auto_28084 ?auto_28103 ) ) ( not ( = ?auto_28085 ?auto_28103 ) ) ( not ( = ?auto_28083 ?auto_28103 ) ) ( not ( = ?auto_28090 ?auto_28103 ) ) ( IS-CRATE ?auto_28083 ) ( not ( = ?auto_28099 ?auto_28083 ) ) ( not ( = ?auto_28084 ?auto_28099 ) ) ( not ( = ?auto_28085 ?auto_28099 ) ) ( not ( = ?auto_28090 ?auto_28099 ) ) ( not ( = ?auto_28103 ?auto_28099 ) ) ( not ( = ?auto_28102 ?auto_28089 ) ) ( not ( = ?auto_28095 ?auto_28102 ) ) ( not ( = ?auto_28098 ?auto_28102 ) ) ( HOIST-AT ?auto_28101 ?auto_28102 ) ( not ( = ?auto_28092 ?auto_28101 ) ) ( not ( = ?auto_28093 ?auto_28101 ) ) ( not ( = ?auto_28100 ?auto_28101 ) ) ( AVAILABLE ?auto_28101 ) ( SURFACE-AT ?auto_28083 ?auto_28102 ) ( ON ?auto_28083 ?auto_28096 ) ( CLEAR ?auto_28083 ) ( not ( = ?auto_28084 ?auto_28096 ) ) ( not ( = ?auto_28085 ?auto_28096 ) ) ( not ( = ?auto_28083 ?auto_28096 ) ) ( not ( = ?auto_28090 ?auto_28096 ) ) ( not ( = ?auto_28103 ?auto_28096 ) ) ( not ( = ?auto_28099 ?auto_28096 ) ) ( IS-CRATE ?auto_28099 ) ( not ( = ?auto_28088 ?auto_28099 ) ) ( not ( = ?auto_28084 ?auto_28088 ) ) ( not ( = ?auto_28085 ?auto_28088 ) ) ( not ( = ?auto_28083 ?auto_28088 ) ) ( not ( = ?auto_28090 ?auto_28088 ) ) ( not ( = ?auto_28103 ?auto_28088 ) ) ( not ( = ?auto_28096 ?auto_28088 ) ) ( not ( = ?auto_28097 ?auto_28089 ) ) ( not ( = ?auto_28095 ?auto_28097 ) ) ( not ( = ?auto_28098 ?auto_28097 ) ) ( not ( = ?auto_28102 ?auto_28097 ) ) ( HOIST-AT ?auto_28091 ?auto_28097 ) ( not ( = ?auto_28092 ?auto_28091 ) ) ( not ( = ?auto_28093 ?auto_28091 ) ) ( not ( = ?auto_28100 ?auto_28091 ) ) ( not ( = ?auto_28101 ?auto_28091 ) ) ( AVAILABLE ?auto_28091 ) ( SURFACE-AT ?auto_28099 ?auto_28097 ) ( ON ?auto_28099 ?auto_28094 ) ( CLEAR ?auto_28099 ) ( not ( = ?auto_28084 ?auto_28094 ) ) ( not ( = ?auto_28085 ?auto_28094 ) ) ( not ( = ?auto_28083 ?auto_28094 ) ) ( not ( = ?auto_28090 ?auto_28094 ) ) ( not ( = ?auto_28103 ?auto_28094 ) ) ( not ( = ?auto_28099 ?auto_28094 ) ) ( not ( = ?auto_28096 ?auto_28094 ) ) ( not ( = ?auto_28088 ?auto_28094 ) ) ( TRUCK-AT ?auto_28087 ?auto_28089 ) ( SURFACE-AT ?auto_28086 ?auto_28089 ) ( CLEAR ?auto_28086 ) ( IS-CRATE ?auto_28088 ) ( not ( = ?auto_28086 ?auto_28088 ) ) ( not ( = ?auto_28084 ?auto_28086 ) ) ( not ( = ?auto_28085 ?auto_28086 ) ) ( not ( = ?auto_28083 ?auto_28086 ) ) ( not ( = ?auto_28090 ?auto_28086 ) ) ( not ( = ?auto_28103 ?auto_28086 ) ) ( not ( = ?auto_28099 ?auto_28086 ) ) ( not ( = ?auto_28096 ?auto_28086 ) ) ( not ( = ?auto_28094 ?auto_28086 ) ) ( AVAILABLE ?auto_28092 ) ( IN ?auto_28088 ?auto_28087 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28084 ?auto_28085 )
      ( MAKE-2CRATE-VERIFY ?auto_28083 ?auto_28084 ?auto_28085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28104 - SURFACE
      ?auto_28105 - SURFACE
      ?auto_28106 - SURFACE
      ?auto_28107 - SURFACE
    )
    :vars
    (
      ?auto_28115 - HOIST
      ?auto_28117 - PLACE
      ?auto_28124 - PLACE
      ?auto_28116 - HOIST
      ?auto_28111 - SURFACE
      ?auto_28109 - PLACE
      ?auto_28120 - HOIST
      ?auto_28118 - SURFACE
      ?auto_28121 - PLACE
      ?auto_28119 - HOIST
      ?auto_28122 - SURFACE
      ?auto_28112 - SURFACE
      ?auto_28108 - PLACE
      ?auto_28123 - HOIST
      ?auto_28110 - SURFACE
      ?auto_28113 - TRUCK
      ?auto_28114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28115 ?auto_28117 ) ( IS-CRATE ?auto_28107 ) ( not ( = ?auto_28106 ?auto_28107 ) ) ( not ( = ?auto_28105 ?auto_28106 ) ) ( not ( = ?auto_28105 ?auto_28107 ) ) ( not ( = ?auto_28124 ?auto_28117 ) ) ( HOIST-AT ?auto_28116 ?auto_28124 ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( AVAILABLE ?auto_28116 ) ( SURFACE-AT ?auto_28107 ?auto_28124 ) ( ON ?auto_28107 ?auto_28111 ) ( CLEAR ?auto_28107 ) ( not ( = ?auto_28106 ?auto_28111 ) ) ( not ( = ?auto_28107 ?auto_28111 ) ) ( not ( = ?auto_28105 ?auto_28111 ) ) ( IS-CRATE ?auto_28106 ) ( not ( = ?auto_28109 ?auto_28117 ) ) ( not ( = ?auto_28124 ?auto_28109 ) ) ( HOIST-AT ?auto_28120 ?auto_28109 ) ( not ( = ?auto_28115 ?auto_28120 ) ) ( not ( = ?auto_28116 ?auto_28120 ) ) ( AVAILABLE ?auto_28120 ) ( SURFACE-AT ?auto_28106 ?auto_28109 ) ( ON ?auto_28106 ?auto_28118 ) ( CLEAR ?auto_28106 ) ( not ( = ?auto_28106 ?auto_28118 ) ) ( not ( = ?auto_28107 ?auto_28118 ) ) ( not ( = ?auto_28105 ?auto_28118 ) ) ( not ( = ?auto_28111 ?auto_28118 ) ) ( IS-CRATE ?auto_28105 ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( not ( = ?auto_28106 ?auto_28104 ) ) ( not ( = ?auto_28107 ?auto_28104 ) ) ( not ( = ?auto_28111 ?auto_28104 ) ) ( not ( = ?auto_28118 ?auto_28104 ) ) ( not ( = ?auto_28121 ?auto_28117 ) ) ( not ( = ?auto_28124 ?auto_28121 ) ) ( not ( = ?auto_28109 ?auto_28121 ) ) ( HOIST-AT ?auto_28119 ?auto_28121 ) ( not ( = ?auto_28115 ?auto_28119 ) ) ( not ( = ?auto_28116 ?auto_28119 ) ) ( not ( = ?auto_28120 ?auto_28119 ) ) ( AVAILABLE ?auto_28119 ) ( SURFACE-AT ?auto_28105 ?auto_28121 ) ( ON ?auto_28105 ?auto_28122 ) ( CLEAR ?auto_28105 ) ( not ( = ?auto_28106 ?auto_28122 ) ) ( not ( = ?auto_28107 ?auto_28122 ) ) ( not ( = ?auto_28105 ?auto_28122 ) ) ( not ( = ?auto_28111 ?auto_28122 ) ) ( not ( = ?auto_28118 ?auto_28122 ) ) ( not ( = ?auto_28104 ?auto_28122 ) ) ( IS-CRATE ?auto_28104 ) ( not ( = ?auto_28112 ?auto_28104 ) ) ( not ( = ?auto_28106 ?auto_28112 ) ) ( not ( = ?auto_28107 ?auto_28112 ) ) ( not ( = ?auto_28105 ?auto_28112 ) ) ( not ( = ?auto_28111 ?auto_28112 ) ) ( not ( = ?auto_28118 ?auto_28112 ) ) ( not ( = ?auto_28122 ?auto_28112 ) ) ( not ( = ?auto_28108 ?auto_28117 ) ) ( not ( = ?auto_28124 ?auto_28108 ) ) ( not ( = ?auto_28109 ?auto_28108 ) ) ( not ( = ?auto_28121 ?auto_28108 ) ) ( HOIST-AT ?auto_28123 ?auto_28108 ) ( not ( = ?auto_28115 ?auto_28123 ) ) ( not ( = ?auto_28116 ?auto_28123 ) ) ( not ( = ?auto_28120 ?auto_28123 ) ) ( not ( = ?auto_28119 ?auto_28123 ) ) ( AVAILABLE ?auto_28123 ) ( SURFACE-AT ?auto_28104 ?auto_28108 ) ( ON ?auto_28104 ?auto_28110 ) ( CLEAR ?auto_28104 ) ( not ( = ?auto_28106 ?auto_28110 ) ) ( not ( = ?auto_28107 ?auto_28110 ) ) ( not ( = ?auto_28105 ?auto_28110 ) ) ( not ( = ?auto_28111 ?auto_28110 ) ) ( not ( = ?auto_28118 ?auto_28110 ) ) ( not ( = ?auto_28104 ?auto_28110 ) ) ( not ( = ?auto_28122 ?auto_28110 ) ) ( not ( = ?auto_28112 ?auto_28110 ) ) ( TRUCK-AT ?auto_28113 ?auto_28117 ) ( SURFACE-AT ?auto_28114 ?auto_28117 ) ( CLEAR ?auto_28114 ) ( IS-CRATE ?auto_28112 ) ( not ( = ?auto_28114 ?auto_28112 ) ) ( not ( = ?auto_28106 ?auto_28114 ) ) ( not ( = ?auto_28107 ?auto_28114 ) ) ( not ( = ?auto_28105 ?auto_28114 ) ) ( not ( = ?auto_28111 ?auto_28114 ) ) ( not ( = ?auto_28118 ?auto_28114 ) ) ( not ( = ?auto_28104 ?auto_28114 ) ) ( not ( = ?auto_28122 ?auto_28114 ) ) ( not ( = ?auto_28110 ?auto_28114 ) ) ( AVAILABLE ?auto_28115 ) ( IN ?auto_28112 ?auto_28113 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28105 ?auto_28106 ?auto_28107 )
      ( MAKE-3CRATE-VERIFY ?auto_28104 ?auto_28105 ?auto_28106 ?auto_28107 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28125 - SURFACE
      ?auto_28126 - SURFACE
      ?auto_28127 - SURFACE
      ?auto_28128 - SURFACE
      ?auto_28129 - SURFACE
    )
    :vars
    (
      ?auto_28136 - HOIST
      ?auto_28138 - PLACE
      ?auto_28145 - PLACE
      ?auto_28137 - HOIST
      ?auto_28133 - SURFACE
      ?auto_28131 - PLACE
      ?auto_28141 - HOIST
      ?auto_28139 - SURFACE
      ?auto_28142 - PLACE
      ?auto_28140 - HOIST
      ?auto_28143 - SURFACE
      ?auto_28130 - PLACE
      ?auto_28144 - HOIST
      ?auto_28132 - SURFACE
      ?auto_28134 - TRUCK
      ?auto_28135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28136 ?auto_28138 ) ( IS-CRATE ?auto_28129 ) ( not ( = ?auto_28128 ?auto_28129 ) ) ( not ( = ?auto_28127 ?auto_28128 ) ) ( not ( = ?auto_28127 ?auto_28129 ) ) ( not ( = ?auto_28145 ?auto_28138 ) ) ( HOIST-AT ?auto_28137 ?auto_28145 ) ( not ( = ?auto_28136 ?auto_28137 ) ) ( AVAILABLE ?auto_28137 ) ( SURFACE-AT ?auto_28129 ?auto_28145 ) ( ON ?auto_28129 ?auto_28133 ) ( CLEAR ?auto_28129 ) ( not ( = ?auto_28128 ?auto_28133 ) ) ( not ( = ?auto_28129 ?auto_28133 ) ) ( not ( = ?auto_28127 ?auto_28133 ) ) ( IS-CRATE ?auto_28128 ) ( not ( = ?auto_28131 ?auto_28138 ) ) ( not ( = ?auto_28145 ?auto_28131 ) ) ( HOIST-AT ?auto_28141 ?auto_28131 ) ( not ( = ?auto_28136 ?auto_28141 ) ) ( not ( = ?auto_28137 ?auto_28141 ) ) ( AVAILABLE ?auto_28141 ) ( SURFACE-AT ?auto_28128 ?auto_28131 ) ( ON ?auto_28128 ?auto_28139 ) ( CLEAR ?auto_28128 ) ( not ( = ?auto_28128 ?auto_28139 ) ) ( not ( = ?auto_28129 ?auto_28139 ) ) ( not ( = ?auto_28127 ?auto_28139 ) ) ( not ( = ?auto_28133 ?auto_28139 ) ) ( IS-CRATE ?auto_28127 ) ( not ( = ?auto_28126 ?auto_28127 ) ) ( not ( = ?auto_28128 ?auto_28126 ) ) ( not ( = ?auto_28129 ?auto_28126 ) ) ( not ( = ?auto_28133 ?auto_28126 ) ) ( not ( = ?auto_28139 ?auto_28126 ) ) ( not ( = ?auto_28142 ?auto_28138 ) ) ( not ( = ?auto_28145 ?auto_28142 ) ) ( not ( = ?auto_28131 ?auto_28142 ) ) ( HOIST-AT ?auto_28140 ?auto_28142 ) ( not ( = ?auto_28136 ?auto_28140 ) ) ( not ( = ?auto_28137 ?auto_28140 ) ) ( not ( = ?auto_28141 ?auto_28140 ) ) ( AVAILABLE ?auto_28140 ) ( SURFACE-AT ?auto_28127 ?auto_28142 ) ( ON ?auto_28127 ?auto_28143 ) ( CLEAR ?auto_28127 ) ( not ( = ?auto_28128 ?auto_28143 ) ) ( not ( = ?auto_28129 ?auto_28143 ) ) ( not ( = ?auto_28127 ?auto_28143 ) ) ( not ( = ?auto_28133 ?auto_28143 ) ) ( not ( = ?auto_28139 ?auto_28143 ) ) ( not ( = ?auto_28126 ?auto_28143 ) ) ( IS-CRATE ?auto_28126 ) ( not ( = ?auto_28125 ?auto_28126 ) ) ( not ( = ?auto_28128 ?auto_28125 ) ) ( not ( = ?auto_28129 ?auto_28125 ) ) ( not ( = ?auto_28127 ?auto_28125 ) ) ( not ( = ?auto_28133 ?auto_28125 ) ) ( not ( = ?auto_28139 ?auto_28125 ) ) ( not ( = ?auto_28143 ?auto_28125 ) ) ( not ( = ?auto_28130 ?auto_28138 ) ) ( not ( = ?auto_28145 ?auto_28130 ) ) ( not ( = ?auto_28131 ?auto_28130 ) ) ( not ( = ?auto_28142 ?auto_28130 ) ) ( HOIST-AT ?auto_28144 ?auto_28130 ) ( not ( = ?auto_28136 ?auto_28144 ) ) ( not ( = ?auto_28137 ?auto_28144 ) ) ( not ( = ?auto_28141 ?auto_28144 ) ) ( not ( = ?auto_28140 ?auto_28144 ) ) ( AVAILABLE ?auto_28144 ) ( SURFACE-AT ?auto_28126 ?auto_28130 ) ( ON ?auto_28126 ?auto_28132 ) ( CLEAR ?auto_28126 ) ( not ( = ?auto_28128 ?auto_28132 ) ) ( not ( = ?auto_28129 ?auto_28132 ) ) ( not ( = ?auto_28127 ?auto_28132 ) ) ( not ( = ?auto_28133 ?auto_28132 ) ) ( not ( = ?auto_28139 ?auto_28132 ) ) ( not ( = ?auto_28126 ?auto_28132 ) ) ( not ( = ?auto_28143 ?auto_28132 ) ) ( not ( = ?auto_28125 ?auto_28132 ) ) ( TRUCK-AT ?auto_28134 ?auto_28138 ) ( SURFACE-AT ?auto_28135 ?auto_28138 ) ( CLEAR ?auto_28135 ) ( IS-CRATE ?auto_28125 ) ( not ( = ?auto_28135 ?auto_28125 ) ) ( not ( = ?auto_28128 ?auto_28135 ) ) ( not ( = ?auto_28129 ?auto_28135 ) ) ( not ( = ?auto_28127 ?auto_28135 ) ) ( not ( = ?auto_28133 ?auto_28135 ) ) ( not ( = ?auto_28139 ?auto_28135 ) ) ( not ( = ?auto_28126 ?auto_28135 ) ) ( not ( = ?auto_28143 ?auto_28135 ) ) ( not ( = ?auto_28132 ?auto_28135 ) ) ( AVAILABLE ?auto_28136 ) ( IN ?auto_28125 ?auto_28134 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28127 ?auto_28128 ?auto_28129 )
      ( MAKE-4CRATE-VERIFY ?auto_28125 ?auto_28126 ?auto_28127 ?auto_28128 ?auto_28129 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28146 - SURFACE
      ?auto_28147 - SURFACE
      ?auto_28148 - SURFACE
      ?auto_28149 - SURFACE
      ?auto_28150 - SURFACE
      ?auto_28151 - SURFACE
    )
    :vars
    (
      ?auto_28157 - HOIST
      ?auto_28159 - PLACE
      ?auto_28166 - PLACE
      ?auto_28158 - HOIST
      ?auto_28155 - SURFACE
      ?auto_28153 - PLACE
      ?auto_28162 - HOIST
      ?auto_28160 - SURFACE
      ?auto_28163 - PLACE
      ?auto_28161 - HOIST
      ?auto_28164 - SURFACE
      ?auto_28152 - PLACE
      ?auto_28165 - HOIST
      ?auto_28154 - SURFACE
      ?auto_28156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28157 ?auto_28159 ) ( IS-CRATE ?auto_28151 ) ( not ( = ?auto_28150 ?auto_28151 ) ) ( not ( = ?auto_28149 ?auto_28150 ) ) ( not ( = ?auto_28149 ?auto_28151 ) ) ( not ( = ?auto_28166 ?auto_28159 ) ) ( HOIST-AT ?auto_28158 ?auto_28166 ) ( not ( = ?auto_28157 ?auto_28158 ) ) ( AVAILABLE ?auto_28158 ) ( SURFACE-AT ?auto_28151 ?auto_28166 ) ( ON ?auto_28151 ?auto_28155 ) ( CLEAR ?auto_28151 ) ( not ( = ?auto_28150 ?auto_28155 ) ) ( not ( = ?auto_28151 ?auto_28155 ) ) ( not ( = ?auto_28149 ?auto_28155 ) ) ( IS-CRATE ?auto_28150 ) ( not ( = ?auto_28153 ?auto_28159 ) ) ( not ( = ?auto_28166 ?auto_28153 ) ) ( HOIST-AT ?auto_28162 ?auto_28153 ) ( not ( = ?auto_28157 ?auto_28162 ) ) ( not ( = ?auto_28158 ?auto_28162 ) ) ( AVAILABLE ?auto_28162 ) ( SURFACE-AT ?auto_28150 ?auto_28153 ) ( ON ?auto_28150 ?auto_28160 ) ( CLEAR ?auto_28150 ) ( not ( = ?auto_28150 ?auto_28160 ) ) ( not ( = ?auto_28151 ?auto_28160 ) ) ( not ( = ?auto_28149 ?auto_28160 ) ) ( not ( = ?auto_28155 ?auto_28160 ) ) ( IS-CRATE ?auto_28149 ) ( not ( = ?auto_28148 ?auto_28149 ) ) ( not ( = ?auto_28150 ?auto_28148 ) ) ( not ( = ?auto_28151 ?auto_28148 ) ) ( not ( = ?auto_28155 ?auto_28148 ) ) ( not ( = ?auto_28160 ?auto_28148 ) ) ( not ( = ?auto_28163 ?auto_28159 ) ) ( not ( = ?auto_28166 ?auto_28163 ) ) ( not ( = ?auto_28153 ?auto_28163 ) ) ( HOIST-AT ?auto_28161 ?auto_28163 ) ( not ( = ?auto_28157 ?auto_28161 ) ) ( not ( = ?auto_28158 ?auto_28161 ) ) ( not ( = ?auto_28162 ?auto_28161 ) ) ( AVAILABLE ?auto_28161 ) ( SURFACE-AT ?auto_28149 ?auto_28163 ) ( ON ?auto_28149 ?auto_28164 ) ( CLEAR ?auto_28149 ) ( not ( = ?auto_28150 ?auto_28164 ) ) ( not ( = ?auto_28151 ?auto_28164 ) ) ( not ( = ?auto_28149 ?auto_28164 ) ) ( not ( = ?auto_28155 ?auto_28164 ) ) ( not ( = ?auto_28160 ?auto_28164 ) ) ( not ( = ?auto_28148 ?auto_28164 ) ) ( IS-CRATE ?auto_28148 ) ( not ( = ?auto_28147 ?auto_28148 ) ) ( not ( = ?auto_28150 ?auto_28147 ) ) ( not ( = ?auto_28151 ?auto_28147 ) ) ( not ( = ?auto_28149 ?auto_28147 ) ) ( not ( = ?auto_28155 ?auto_28147 ) ) ( not ( = ?auto_28160 ?auto_28147 ) ) ( not ( = ?auto_28164 ?auto_28147 ) ) ( not ( = ?auto_28152 ?auto_28159 ) ) ( not ( = ?auto_28166 ?auto_28152 ) ) ( not ( = ?auto_28153 ?auto_28152 ) ) ( not ( = ?auto_28163 ?auto_28152 ) ) ( HOIST-AT ?auto_28165 ?auto_28152 ) ( not ( = ?auto_28157 ?auto_28165 ) ) ( not ( = ?auto_28158 ?auto_28165 ) ) ( not ( = ?auto_28162 ?auto_28165 ) ) ( not ( = ?auto_28161 ?auto_28165 ) ) ( AVAILABLE ?auto_28165 ) ( SURFACE-AT ?auto_28148 ?auto_28152 ) ( ON ?auto_28148 ?auto_28154 ) ( CLEAR ?auto_28148 ) ( not ( = ?auto_28150 ?auto_28154 ) ) ( not ( = ?auto_28151 ?auto_28154 ) ) ( not ( = ?auto_28149 ?auto_28154 ) ) ( not ( = ?auto_28155 ?auto_28154 ) ) ( not ( = ?auto_28160 ?auto_28154 ) ) ( not ( = ?auto_28148 ?auto_28154 ) ) ( not ( = ?auto_28164 ?auto_28154 ) ) ( not ( = ?auto_28147 ?auto_28154 ) ) ( TRUCK-AT ?auto_28156 ?auto_28159 ) ( SURFACE-AT ?auto_28146 ?auto_28159 ) ( CLEAR ?auto_28146 ) ( IS-CRATE ?auto_28147 ) ( not ( = ?auto_28146 ?auto_28147 ) ) ( not ( = ?auto_28150 ?auto_28146 ) ) ( not ( = ?auto_28151 ?auto_28146 ) ) ( not ( = ?auto_28149 ?auto_28146 ) ) ( not ( = ?auto_28155 ?auto_28146 ) ) ( not ( = ?auto_28160 ?auto_28146 ) ) ( not ( = ?auto_28148 ?auto_28146 ) ) ( not ( = ?auto_28164 ?auto_28146 ) ) ( not ( = ?auto_28154 ?auto_28146 ) ) ( AVAILABLE ?auto_28157 ) ( IN ?auto_28147 ?auto_28156 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28149 ?auto_28150 ?auto_28151 )
      ( MAKE-5CRATE-VERIFY ?auto_28146 ?auto_28147 ?auto_28148 ?auto_28149 ?auto_28150 ?auto_28151 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28167 - SURFACE
      ?auto_28168 - SURFACE
    )
    :vars
    (
      ?auto_28177 - HOIST
      ?auto_28179 - PLACE
      ?auto_28180 - SURFACE
      ?auto_28187 - PLACE
      ?auto_28178 - HOIST
      ?auto_28172 - SURFACE
      ?auto_28170 - PLACE
      ?auto_28183 - HOIST
      ?auto_28181 - SURFACE
      ?auto_28173 - SURFACE
      ?auto_28184 - PLACE
      ?auto_28182 - HOIST
      ?auto_28185 - SURFACE
      ?auto_28174 - SURFACE
      ?auto_28169 - PLACE
      ?auto_28186 - HOIST
      ?auto_28171 - SURFACE
      ?auto_28176 - SURFACE
      ?auto_28175 - TRUCK
      ?auto_28188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28177 ?auto_28179 ) ( IS-CRATE ?auto_28168 ) ( not ( = ?auto_28167 ?auto_28168 ) ) ( not ( = ?auto_28180 ?auto_28167 ) ) ( not ( = ?auto_28180 ?auto_28168 ) ) ( not ( = ?auto_28187 ?auto_28179 ) ) ( HOIST-AT ?auto_28178 ?auto_28187 ) ( not ( = ?auto_28177 ?auto_28178 ) ) ( AVAILABLE ?auto_28178 ) ( SURFACE-AT ?auto_28168 ?auto_28187 ) ( ON ?auto_28168 ?auto_28172 ) ( CLEAR ?auto_28168 ) ( not ( = ?auto_28167 ?auto_28172 ) ) ( not ( = ?auto_28168 ?auto_28172 ) ) ( not ( = ?auto_28180 ?auto_28172 ) ) ( IS-CRATE ?auto_28167 ) ( not ( = ?auto_28170 ?auto_28179 ) ) ( not ( = ?auto_28187 ?auto_28170 ) ) ( HOIST-AT ?auto_28183 ?auto_28170 ) ( not ( = ?auto_28177 ?auto_28183 ) ) ( not ( = ?auto_28178 ?auto_28183 ) ) ( AVAILABLE ?auto_28183 ) ( SURFACE-AT ?auto_28167 ?auto_28170 ) ( ON ?auto_28167 ?auto_28181 ) ( CLEAR ?auto_28167 ) ( not ( = ?auto_28167 ?auto_28181 ) ) ( not ( = ?auto_28168 ?auto_28181 ) ) ( not ( = ?auto_28180 ?auto_28181 ) ) ( not ( = ?auto_28172 ?auto_28181 ) ) ( IS-CRATE ?auto_28180 ) ( not ( = ?auto_28173 ?auto_28180 ) ) ( not ( = ?auto_28167 ?auto_28173 ) ) ( not ( = ?auto_28168 ?auto_28173 ) ) ( not ( = ?auto_28172 ?auto_28173 ) ) ( not ( = ?auto_28181 ?auto_28173 ) ) ( not ( = ?auto_28184 ?auto_28179 ) ) ( not ( = ?auto_28187 ?auto_28184 ) ) ( not ( = ?auto_28170 ?auto_28184 ) ) ( HOIST-AT ?auto_28182 ?auto_28184 ) ( not ( = ?auto_28177 ?auto_28182 ) ) ( not ( = ?auto_28178 ?auto_28182 ) ) ( not ( = ?auto_28183 ?auto_28182 ) ) ( AVAILABLE ?auto_28182 ) ( SURFACE-AT ?auto_28180 ?auto_28184 ) ( ON ?auto_28180 ?auto_28185 ) ( CLEAR ?auto_28180 ) ( not ( = ?auto_28167 ?auto_28185 ) ) ( not ( = ?auto_28168 ?auto_28185 ) ) ( not ( = ?auto_28180 ?auto_28185 ) ) ( not ( = ?auto_28172 ?auto_28185 ) ) ( not ( = ?auto_28181 ?auto_28185 ) ) ( not ( = ?auto_28173 ?auto_28185 ) ) ( IS-CRATE ?auto_28173 ) ( not ( = ?auto_28174 ?auto_28173 ) ) ( not ( = ?auto_28167 ?auto_28174 ) ) ( not ( = ?auto_28168 ?auto_28174 ) ) ( not ( = ?auto_28180 ?auto_28174 ) ) ( not ( = ?auto_28172 ?auto_28174 ) ) ( not ( = ?auto_28181 ?auto_28174 ) ) ( not ( = ?auto_28185 ?auto_28174 ) ) ( not ( = ?auto_28169 ?auto_28179 ) ) ( not ( = ?auto_28187 ?auto_28169 ) ) ( not ( = ?auto_28170 ?auto_28169 ) ) ( not ( = ?auto_28184 ?auto_28169 ) ) ( HOIST-AT ?auto_28186 ?auto_28169 ) ( not ( = ?auto_28177 ?auto_28186 ) ) ( not ( = ?auto_28178 ?auto_28186 ) ) ( not ( = ?auto_28183 ?auto_28186 ) ) ( not ( = ?auto_28182 ?auto_28186 ) ) ( AVAILABLE ?auto_28186 ) ( SURFACE-AT ?auto_28173 ?auto_28169 ) ( ON ?auto_28173 ?auto_28171 ) ( CLEAR ?auto_28173 ) ( not ( = ?auto_28167 ?auto_28171 ) ) ( not ( = ?auto_28168 ?auto_28171 ) ) ( not ( = ?auto_28180 ?auto_28171 ) ) ( not ( = ?auto_28172 ?auto_28171 ) ) ( not ( = ?auto_28181 ?auto_28171 ) ) ( not ( = ?auto_28173 ?auto_28171 ) ) ( not ( = ?auto_28185 ?auto_28171 ) ) ( not ( = ?auto_28174 ?auto_28171 ) ) ( SURFACE-AT ?auto_28176 ?auto_28179 ) ( CLEAR ?auto_28176 ) ( IS-CRATE ?auto_28174 ) ( not ( = ?auto_28176 ?auto_28174 ) ) ( not ( = ?auto_28167 ?auto_28176 ) ) ( not ( = ?auto_28168 ?auto_28176 ) ) ( not ( = ?auto_28180 ?auto_28176 ) ) ( not ( = ?auto_28172 ?auto_28176 ) ) ( not ( = ?auto_28181 ?auto_28176 ) ) ( not ( = ?auto_28173 ?auto_28176 ) ) ( not ( = ?auto_28185 ?auto_28176 ) ) ( not ( = ?auto_28171 ?auto_28176 ) ) ( AVAILABLE ?auto_28177 ) ( IN ?auto_28174 ?auto_28175 ) ( TRUCK-AT ?auto_28175 ?auto_28188 ) ( not ( = ?auto_28188 ?auto_28179 ) ) ( not ( = ?auto_28187 ?auto_28188 ) ) ( not ( = ?auto_28170 ?auto_28188 ) ) ( not ( = ?auto_28184 ?auto_28188 ) ) ( not ( = ?auto_28169 ?auto_28188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28175 ?auto_28188 ?auto_28179 )
      ( MAKE-2CRATE ?auto_28180 ?auto_28167 ?auto_28168 )
      ( MAKE-1CRATE-VERIFY ?auto_28167 ?auto_28168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28189 - SURFACE
      ?auto_28190 - SURFACE
      ?auto_28191 - SURFACE
    )
    :vars
    (
      ?auto_28202 - HOIST
      ?auto_28204 - PLACE
      ?auto_28201 - PLACE
      ?auto_28205 - HOIST
      ?auto_28203 - SURFACE
      ?auto_28196 - PLACE
      ?auto_28208 - HOIST
      ?auto_28197 - SURFACE
      ?auto_28206 - SURFACE
      ?auto_28198 - PLACE
      ?auto_28207 - HOIST
      ?auto_28194 - SURFACE
      ?auto_28200 - SURFACE
      ?auto_28193 - PLACE
      ?auto_28192 - HOIST
      ?auto_28199 - SURFACE
      ?auto_28209 - SURFACE
      ?auto_28195 - TRUCK
      ?auto_28210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28202 ?auto_28204 ) ( IS-CRATE ?auto_28191 ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( not ( = ?auto_28189 ?auto_28190 ) ) ( not ( = ?auto_28189 ?auto_28191 ) ) ( not ( = ?auto_28201 ?auto_28204 ) ) ( HOIST-AT ?auto_28205 ?auto_28201 ) ( not ( = ?auto_28202 ?auto_28205 ) ) ( AVAILABLE ?auto_28205 ) ( SURFACE-AT ?auto_28191 ?auto_28201 ) ( ON ?auto_28191 ?auto_28203 ) ( CLEAR ?auto_28191 ) ( not ( = ?auto_28190 ?auto_28203 ) ) ( not ( = ?auto_28191 ?auto_28203 ) ) ( not ( = ?auto_28189 ?auto_28203 ) ) ( IS-CRATE ?auto_28190 ) ( not ( = ?auto_28196 ?auto_28204 ) ) ( not ( = ?auto_28201 ?auto_28196 ) ) ( HOIST-AT ?auto_28208 ?auto_28196 ) ( not ( = ?auto_28202 ?auto_28208 ) ) ( not ( = ?auto_28205 ?auto_28208 ) ) ( AVAILABLE ?auto_28208 ) ( SURFACE-AT ?auto_28190 ?auto_28196 ) ( ON ?auto_28190 ?auto_28197 ) ( CLEAR ?auto_28190 ) ( not ( = ?auto_28190 ?auto_28197 ) ) ( not ( = ?auto_28191 ?auto_28197 ) ) ( not ( = ?auto_28189 ?auto_28197 ) ) ( not ( = ?auto_28203 ?auto_28197 ) ) ( IS-CRATE ?auto_28189 ) ( not ( = ?auto_28206 ?auto_28189 ) ) ( not ( = ?auto_28190 ?auto_28206 ) ) ( not ( = ?auto_28191 ?auto_28206 ) ) ( not ( = ?auto_28203 ?auto_28206 ) ) ( not ( = ?auto_28197 ?auto_28206 ) ) ( not ( = ?auto_28198 ?auto_28204 ) ) ( not ( = ?auto_28201 ?auto_28198 ) ) ( not ( = ?auto_28196 ?auto_28198 ) ) ( HOIST-AT ?auto_28207 ?auto_28198 ) ( not ( = ?auto_28202 ?auto_28207 ) ) ( not ( = ?auto_28205 ?auto_28207 ) ) ( not ( = ?auto_28208 ?auto_28207 ) ) ( AVAILABLE ?auto_28207 ) ( SURFACE-AT ?auto_28189 ?auto_28198 ) ( ON ?auto_28189 ?auto_28194 ) ( CLEAR ?auto_28189 ) ( not ( = ?auto_28190 ?auto_28194 ) ) ( not ( = ?auto_28191 ?auto_28194 ) ) ( not ( = ?auto_28189 ?auto_28194 ) ) ( not ( = ?auto_28203 ?auto_28194 ) ) ( not ( = ?auto_28197 ?auto_28194 ) ) ( not ( = ?auto_28206 ?auto_28194 ) ) ( IS-CRATE ?auto_28206 ) ( not ( = ?auto_28200 ?auto_28206 ) ) ( not ( = ?auto_28190 ?auto_28200 ) ) ( not ( = ?auto_28191 ?auto_28200 ) ) ( not ( = ?auto_28189 ?auto_28200 ) ) ( not ( = ?auto_28203 ?auto_28200 ) ) ( not ( = ?auto_28197 ?auto_28200 ) ) ( not ( = ?auto_28194 ?auto_28200 ) ) ( not ( = ?auto_28193 ?auto_28204 ) ) ( not ( = ?auto_28201 ?auto_28193 ) ) ( not ( = ?auto_28196 ?auto_28193 ) ) ( not ( = ?auto_28198 ?auto_28193 ) ) ( HOIST-AT ?auto_28192 ?auto_28193 ) ( not ( = ?auto_28202 ?auto_28192 ) ) ( not ( = ?auto_28205 ?auto_28192 ) ) ( not ( = ?auto_28208 ?auto_28192 ) ) ( not ( = ?auto_28207 ?auto_28192 ) ) ( AVAILABLE ?auto_28192 ) ( SURFACE-AT ?auto_28206 ?auto_28193 ) ( ON ?auto_28206 ?auto_28199 ) ( CLEAR ?auto_28206 ) ( not ( = ?auto_28190 ?auto_28199 ) ) ( not ( = ?auto_28191 ?auto_28199 ) ) ( not ( = ?auto_28189 ?auto_28199 ) ) ( not ( = ?auto_28203 ?auto_28199 ) ) ( not ( = ?auto_28197 ?auto_28199 ) ) ( not ( = ?auto_28206 ?auto_28199 ) ) ( not ( = ?auto_28194 ?auto_28199 ) ) ( not ( = ?auto_28200 ?auto_28199 ) ) ( SURFACE-AT ?auto_28209 ?auto_28204 ) ( CLEAR ?auto_28209 ) ( IS-CRATE ?auto_28200 ) ( not ( = ?auto_28209 ?auto_28200 ) ) ( not ( = ?auto_28190 ?auto_28209 ) ) ( not ( = ?auto_28191 ?auto_28209 ) ) ( not ( = ?auto_28189 ?auto_28209 ) ) ( not ( = ?auto_28203 ?auto_28209 ) ) ( not ( = ?auto_28197 ?auto_28209 ) ) ( not ( = ?auto_28206 ?auto_28209 ) ) ( not ( = ?auto_28194 ?auto_28209 ) ) ( not ( = ?auto_28199 ?auto_28209 ) ) ( AVAILABLE ?auto_28202 ) ( IN ?auto_28200 ?auto_28195 ) ( TRUCK-AT ?auto_28195 ?auto_28210 ) ( not ( = ?auto_28210 ?auto_28204 ) ) ( not ( = ?auto_28201 ?auto_28210 ) ) ( not ( = ?auto_28196 ?auto_28210 ) ) ( not ( = ?auto_28198 ?auto_28210 ) ) ( not ( = ?auto_28193 ?auto_28210 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28190 ?auto_28191 )
      ( MAKE-2CRATE-VERIFY ?auto_28189 ?auto_28190 ?auto_28191 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28211 - SURFACE
      ?auto_28212 - SURFACE
      ?auto_28213 - SURFACE
      ?auto_28214 - SURFACE
    )
    :vars
    (
      ?auto_28216 - HOIST
      ?auto_28228 - PLACE
      ?auto_28222 - PLACE
      ?auto_28220 - HOIST
      ?auto_28226 - SURFACE
      ?auto_28231 - PLACE
      ?auto_28227 - HOIST
      ?auto_28219 - SURFACE
      ?auto_28230 - PLACE
      ?auto_28221 - HOIST
      ?auto_28217 - SURFACE
      ?auto_28229 - SURFACE
      ?auto_28215 - PLACE
      ?auto_28225 - HOIST
      ?auto_28232 - SURFACE
      ?auto_28218 - SURFACE
      ?auto_28224 - TRUCK
      ?auto_28223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28216 ?auto_28228 ) ( IS-CRATE ?auto_28214 ) ( not ( = ?auto_28213 ?auto_28214 ) ) ( not ( = ?auto_28212 ?auto_28213 ) ) ( not ( = ?auto_28212 ?auto_28214 ) ) ( not ( = ?auto_28222 ?auto_28228 ) ) ( HOIST-AT ?auto_28220 ?auto_28222 ) ( not ( = ?auto_28216 ?auto_28220 ) ) ( AVAILABLE ?auto_28220 ) ( SURFACE-AT ?auto_28214 ?auto_28222 ) ( ON ?auto_28214 ?auto_28226 ) ( CLEAR ?auto_28214 ) ( not ( = ?auto_28213 ?auto_28226 ) ) ( not ( = ?auto_28214 ?auto_28226 ) ) ( not ( = ?auto_28212 ?auto_28226 ) ) ( IS-CRATE ?auto_28213 ) ( not ( = ?auto_28231 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28231 ) ) ( HOIST-AT ?auto_28227 ?auto_28231 ) ( not ( = ?auto_28216 ?auto_28227 ) ) ( not ( = ?auto_28220 ?auto_28227 ) ) ( AVAILABLE ?auto_28227 ) ( SURFACE-AT ?auto_28213 ?auto_28231 ) ( ON ?auto_28213 ?auto_28219 ) ( CLEAR ?auto_28213 ) ( not ( = ?auto_28213 ?auto_28219 ) ) ( not ( = ?auto_28214 ?auto_28219 ) ) ( not ( = ?auto_28212 ?auto_28219 ) ) ( not ( = ?auto_28226 ?auto_28219 ) ) ( IS-CRATE ?auto_28212 ) ( not ( = ?auto_28211 ?auto_28212 ) ) ( not ( = ?auto_28213 ?auto_28211 ) ) ( not ( = ?auto_28214 ?auto_28211 ) ) ( not ( = ?auto_28226 ?auto_28211 ) ) ( not ( = ?auto_28219 ?auto_28211 ) ) ( not ( = ?auto_28230 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28230 ) ) ( not ( = ?auto_28231 ?auto_28230 ) ) ( HOIST-AT ?auto_28221 ?auto_28230 ) ( not ( = ?auto_28216 ?auto_28221 ) ) ( not ( = ?auto_28220 ?auto_28221 ) ) ( not ( = ?auto_28227 ?auto_28221 ) ) ( AVAILABLE ?auto_28221 ) ( SURFACE-AT ?auto_28212 ?auto_28230 ) ( ON ?auto_28212 ?auto_28217 ) ( CLEAR ?auto_28212 ) ( not ( = ?auto_28213 ?auto_28217 ) ) ( not ( = ?auto_28214 ?auto_28217 ) ) ( not ( = ?auto_28212 ?auto_28217 ) ) ( not ( = ?auto_28226 ?auto_28217 ) ) ( not ( = ?auto_28219 ?auto_28217 ) ) ( not ( = ?auto_28211 ?auto_28217 ) ) ( IS-CRATE ?auto_28211 ) ( not ( = ?auto_28229 ?auto_28211 ) ) ( not ( = ?auto_28213 ?auto_28229 ) ) ( not ( = ?auto_28214 ?auto_28229 ) ) ( not ( = ?auto_28212 ?auto_28229 ) ) ( not ( = ?auto_28226 ?auto_28229 ) ) ( not ( = ?auto_28219 ?auto_28229 ) ) ( not ( = ?auto_28217 ?auto_28229 ) ) ( not ( = ?auto_28215 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28215 ) ) ( not ( = ?auto_28231 ?auto_28215 ) ) ( not ( = ?auto_28230 ?auto_28215 ) ) ( HOIST-AT ?auto_28225 ?auto_28215 ) ( not ( = ?auto_28216 ?auto_28225 ) ) ( not ( = ?auto_28220 ?auto_28225 ) ) ( not ( = ?auto_28227 ?auto_28225 ) ) ( not ( = ?auto_28221 ?auto_28225 ) ) ( AVAILABLE ?auto_28225 ) ( SURFACE-AT ?auto_28211 ?auto_28215 ) ( ON ?auto_28211 ?auto_28232 ) ( CLEAR ?auto_28211 ) ( not ( = ?auto_28213 ?auto_28232 ) ) ( not ( = ?auto_28214 ?auto_28232 ) ) ( not ( = ?auto_28212 ?auto_28232 ) ) ( not ( = ?auto_28226 ?auto_28232 ) ) ( not ( = ?auto_28219 ?auto_28232 ) ) ( not ( = ?auto_28211 ?auto_28232 ) ) ( not ( = ?auto_28217 ?auto_28232 ) ) ( not ( = ?auto_28229 ?auto_28232 ) ) ( SURFACE-AT ?auto_28218 ?auto_28228 ) ( CLEAR ?auto_28218 ) ( IS-CRATE ?auto_28229 ) ( not ( = ?auto_28218 ?auto_28229 ) ) ( not ( = ?auto_28213 ?auto_28218 ) ) ( not ( = ?auto_28214 ?auto_28218 ) ) ( not ( = ?auto_28212 ?auto_28218 ) ) ( not ( = ?auto_28226 ?auto_28218 ) ) ( not ( = ?auto_28219 ?auto_28218 ) ) ( not ( = ?auto_28211 ?auto_28218 ) ) ( not ( = ?auto_28217 ?auto_28218 ) ) ( not ( = ?auto_28232 ?auto_28218 ) ) ( AVAILABLE ?auto_28216 ) ( IN ?auto_28229 ?auto_28224 ) ( TRUCK-AT ?auto_28224 ?auto_28223 ) ( not ( = ?auto_28223 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28223 ) ) ( not ( = ?auto_28231 ?auto_28223 ) ) ( not ( = ?auto_28230 ?auto_28223 ) ) ( not ( = ?auto_28215 ?auto_28223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28212 ?auto_28213 ?auto_28214 )
      ( MAKE-3CRATE-VERIFY ?auto_28211 ?auto_28212 ?auto_28213 ?auto_28214 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28233 - SURFACE
      ?auto_28234 - SURFACE
      ?auto_28235 - SURFACE
      ?auto_28236 - SURFACE
      ?auto_28237 - SURFACE
    )
    :vars
    (
      ?auto_28239 - HOIST
      ?auto_28251 - PLACE
      ?auto_28245 - PLACE
      ?auto_28243 - HOIST
      ?auto_28249 - SURFACE
      ?auto_28253 - PLACE
      ?auto_28250 - HOIST
      ?auto_28242 - SURFACE
      ?auto_28252 - PLACE
      ?auto_28244 - HOIST
      ?auto_28240 - SURFACE
      ?auto_28238 - PLACE
      ?auto_28248 - HOIST
      ?auto_28254 - SURFACE
      ?auto_28241 - SURFACE
      ?auto_28247 - TRUCK
      ?auto_28246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28239 ?auto_28251 ) ( IS-CRATE ?auto_28237 ) ( not ( = ?auto_28236 ?auto_28237 ) ) ( not ( = ?auto_28235 ?auto_28236 ) ) ( not ( = ?auto_28235 ?auto_28237 ) ) ( not ( = ?auto_28245 ?auto_28251 ) ) ( HOIST-AT ?auto_28243 ?auto_28245 ) ( not ( = ?auto_28239 ?auto_28243 ) ) ( AVAILABLE ?auto_28243 ) ( SURFACE-AT ?auto_28237 ?auto_28245 ) ( ON ?auto_28237 ?auto_28249 ) ( CLEAR ?auto_28237 ) ( not ( = ?auto_28236 ?auto_28249 ) ) ( not ( = ?auto_28237 ?auto_28249 ) ) ( not ( = ?auto_28235 ?auto_28249 ) ) ( IS-CRATE ?auto_28236 ) ( not ( = ?auto_28253 ?auto_28251 ) ) ( not ( = ?auto_28245 ?auto_28253 ) ) ( HOIST-AT ?auto_28250 ?auto_28253 ) ( not ( = ?auto_28239 ?auto_28250 ) ) ( not ( = ?auto_28243 ?auto_28250 ) ) ( AVAILABLE ?auto_28250 ) ( SURFACE-AT ?auto_28236 ?auto_28253 ) ( ON ?auto_28236 ?auto_28242 ) ( CLEAR ?auto_28236 ) ( not ( = ?auto_28236 ?auto_28242 ) ) ( not ( = ?auto_28237 ?auto_28242 ) ) ( not ( = ?auto_28235 ?auto_28242 ) ) ( not ( = ?auto_28249 ?auto_28242 ) ) ( IS-CRATE ?auto_28235 ) ( not ( = ?auto_28234 ?auto_28235 ) ) ( not ( = ?auto_28236 ?auto_28234 ) ) ( not ( = ?auto_28237 ?auto_28234 ) ) ( not ( = ?auto_28249 ?auto_28234 ) ) ( not ( = ?auto_28242 ?auto_28234 ) ) ( not ( = ?auto_28252 ?auto_28251 ) ) ( not ( = ?auto_28245 ?auto_28252 ) ) ( not ( = ?auto_28253 ?auto_28252 ) ) ( HOIST-AT ?auto_28244 ?auto_28252 ) ( not ( = ?auto_28239 ?auto_28244 ) ) ( not ( = ?auto_28243 ?auto_28244 ) ) ( not ( = ?auto_28250 ?auto_28244 ) ) ( AVAILABLE ?auto_28244 ) ( SURFACE-AT ?auto_28235 ?auto_28252 ) ( ON ?auto_28235 ?auto_28240 ) ( CLEAR ?auto_28235 ) ( not ( = ?auto_28236 ?auto_28240 ) ) ( not ( = ?auto_28237 ?auto_28240 ) ) ( not ( = ?auto_28235 ?auto_28240 ) ) ( not ( = ?auto_28249 ?auto_28240 ) ) ( not ( = ?auto_28242 ?auto_28240 ) ) ( not ( = ?auto_28234 ?auto_28240 ) ) ( IS-CRATE ?auto_28234 ) ( not ( = ?auto_28233 ?auto_28234 ) ) ( not ( = ?auto_28236 ?auto_28233 ) ) ( not ( = ?auto_28237 ?auto_28233 ) ) ( not ( = ?auto_28235 ?auto_28233 ) ) ( not ( = ?auto_28249 ?auto_28233 ) ) ( not ( = ?auto_28242 ?auto_28233 ) ) ( not ( = ?auto_28240 ?auto_28233 ) ) ( not ( = ?auto_28238 ?auto_28251 ) ) ( not ( = ?auto_28245 ?auto_28238 ) ) ( not ( = ?auto_28253 ?auto_28238 ) ) ( not ( = ?auto_28252 ?auto_28238 ) ) ( HOIST-AT ?auto_28248 ?auto_28238 ) ( not ( = ?auto_28239 ?auto_28248 ) ) ( not ( = ?auto_28243 ?auto_28248 ) ) ( not ( = ?auto_28250 ?auto_28248 ) ) ( not ( = ?auto_28244 ?auto_28248 ) ) ( AVAILABLE ?auto_28248 ) ( SURFACE-AT ?auto_28234 ?auto_28238 ) ( ON ?auto_28234 ?auto_28254 ) ( CLEAR ?auto_28234 ) ( not ( = ?auto_28236 ?auto_28254 ) ) ( not ( = ?auto_28237 ?auto_28254 ) ) ( not ( = ?auto_28235 ?auto_28254 ) ) ( not ( = ?auto_28249 ?auto_28254 ) ) ( not ( = ?auto_28242 ?auto_28254 ) ) ( not ( = ?auto_28234 ?auto_28254 ) ) ( not ( = ?auto_28240 ?auto_28254 ) ) ( not ( = ?auto_28233 ?auto_28254 ) ) ( SURFACE-AT ?auto_28241 ?auto_28251 ) ( CLEAR ?auto_28241 ) ( IS-CRATE ?auto_28233 ) ( not ( = ?auto_28241 ?auto_28233 ) ) ( not ( = ?auto_28236 ?auto_28241 ) ) ( not ( = ?auto_28237 ?auto_28241 ) ) ( not ( = ?auto_28235 ?auto_28241 ) ) ( not ( = ?auto_28249 ?auto_28241 ) ) ( not ( = ?auto_28242 ?auto_28241 ) ) ( not ( = ?auto_28234 ?auto_28241 ) ) ( not ( = ?auto_28240 ?auto_28241 ) ) ( not ( = ?auto_28254 ?auto_28241 ) ) ( AVAILABLE ?auto_28239 ) ( IN ?auto_28233 ?auto_28247 ) ( TRUCK-AT ?auto_28247 ?auto_28246 ) ( not ( = ?auto_28246 ?auto_28251 ) ) ( not ( = ?auto_28245 ?auto_28246 ) ) ( not ( = ?auto_28253 ?auto_28246 ) ) ( not ( = ?auto_28252 ?auto_28246 ) ) ( not ( = ?auto_28238 ?auto_28246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28235 ?auto_28236 ?auto_28237 )
      ( MAKE-4CRATE-VERIFY ?auto_28233 ?auto_28234 ?auto_28235 ?auto_28236 ?auto_28237 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28255 - SURFACE
      ?auto_28256 - SURFACE
      ?auto_28257 - SURFACE
      ?auto_28258 - SURFACE
      ?auto_28259 - SURFACE
      ?auto_28260 - SURFACE
    )
    :vars
    (
      ?auto_28262 - HOIST
      ?auto_28273 - PLACE
      ?auto_28267 - PLACE
      ?auto_28265 - HOIST
      ?auto_28271 - SURFACE
      ?auto_28275 - PLACE
      ?auto_28272 - HOIST
      ?auto_28264 - SURFACE
      ?auto_28274 - PLACE
      ?auto_28266 - HOIST
      ?auto_28263 - SURFACE
      ?auto_28261 - PLACE
      ?auto_28270 - HOIST
      ?auto_28276 - SURFACE
      ?auto_28269 - TRUCK
      ?auto_28268 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28262 ?auto_28273 ) ( IS-CRATE ?auto_28260 ) ( not ( = ?auto_28259 ?auto_28260 ) ) ( not ( = ?auto_28258 ?auto_28259 ) ) ( not ( = ?auto_28258 ?auto_28260 ) ) ( not ( = ?auto_28267 ?auto_28273 ) ) ( HOIST-AT ?auto_28265 ?auto_28267 ) ( not ( = ?auto_28262 ?auto_28265 ) ) ( AVAILABLE ?auto_28265 ) ( SURFACE-AT ?auto_28260 ?auto_28267 ) ( ON ?auto_28260 ?auto_28271 ) ( CLEAR ?auto_28260 ) ( not ( = ?auto_28259 ?auto_28271 ) ) ( not ( = ?auto_28260 ?auto_28271 ) ) ( not ( = ?auto_28258 ?auto_28271 ) ) ( IS-CRATE ?auto_28259 ) ( not ( = ?auto_28275 ?auto_28273 ) ) ( not ( = ?auto_28267 ?auto_28275 ) ) ( HOIST-AT ?auto_28272 ?auto_28275 ) ( not ( = ?auto_28262 ?auto_28272 ) ) ( not ( = ?auto_28265 ?auto_28272 ) ) ( AVAILABLE ?auto_28272 ) ( SURFACE-AT ?auto_28259 ?auto_28275 ) ( ON ?auto_28259 ?auto_28264 ) ( CLEAR ?auto_28259 ) ( not ( = ?auto_28259 ?auto_28264 ) ) ( not ( = ?auto_28260 ?auto_28264 ) ) ( not ( = ?auto_28258 ?auto_28264 ) ) ( not ( = ?auto_28271 ?auto_28264 ) ) ( IS-CRATE ?auto_28258 ) ( not ( = ?auto_28257 ?auto_28258 ) ) ( not ( = ?auto_28259 ?auto_28257 ) ) ( not ( = ?auto_28260 ?auto_28257 ) ) ( not ( = ?auto_28271 ?auto_28257 ) ) ( not ( = ?auto_28264 ?auto_28257 ) ) ( not ( = ?auto_28274 ?auto_28273 ) ) ( not ( = ?auto_28267 ?auto_28274 ) ) ( not ( = ?auto_28275 ?auto_28274 ) ) ( HOIST-AT ?auto_28266 ?auto_28274 ) ( not ( = ?auto_28262 ?auto_28266 ) ) ( not ( = ?auto_28265 ?auto_28266 ) ) ( not ( = ?auto_28272 ?auto_28266 ) ) ( AVAILABLE ?auto_28266 ) ( SURFACE-AT ?auto_28258 ?auto_28274 ) ( ON ?auto_28258 ?auto_28263 ) ( CLEAR ?auto_28258 ) ( not ( = ?auto_28259 ?auto_28263 ) ) ( not ( = ?auto_28260 ?auto_28263 ) ) ( not ( = ?auto_28258 ?auto_28263 ) ) ( not ( = ?auto_28271 ?auto_28263 ) ) ( not ( = ?auto_28264 ?auto_28263 ) ) ( not ( = ?auto_28257 ?auto_28263 ) ) ( IS-CRATE ?auto_28257 ) ( not ( = ?auto_28256 ?auto_28257 ) ) ( not ( = ?auto_28259 ?auto_28256 ) ) ( not ( = ?auto_28260 ?auto_28256 ) ) ( not ( = ?auto_28258 ?auto_28256 ) ) ( not ( = ?auto_28271 ?auto_28256 ) ) ( not ( = ?auto_28264 ?auto_28256 ) ) ( not ( = ?auto_28263 ?auto_28256 ) ) ( not ( = ?auto_28261 ?auto_28273 ) ) ( not ( = ?auto_28267 ?auto_28261 ) ) ( not ( = ?auto_28275 ?auto_28261 ) ) ( not ( = ?auto_28274 ?auto_28261 ) ) ( HOIST-AT ?auto_28270 ?auto_28261 ) ( not ( = ?auto_28262 ?auto_28270 ) ) ( not ( = ?auto_28265 ?auto_28270 ) ) ( not ( = ?auto_28272 ?auto_28270 ) ) ( not ( = ?auto_28266 ?auto_28270 ) ) ( AVAILABLE ?auto_28270 ) ( SURFACE-AT ?auto_28257 ?auto_28261 ) ( ON ?auto_28257 ?auto_28276 ) ( CLEAR ?auto_28257 ) ( not ( = ?auto_28259 ?auto_28276 ) ) ( not ( = ?auto_28260 ?auto_28276 ) ) ( not ( = ?auto_28258 ?auto_28276 ) ) ( not ( = ?auto_28271 ?auto_28276 ) ) ( not ( = ?auto_28264 ?auto_28276 ) ) ( not ( = ?auto_28257 ?auto_28276 ) ) ( not ( = ?auto_28263 ?auto_28276 ) ) ( not ( = ?auto_28256 ?auto_28276 ) ) ( SURFACE-AT ?auto_28255 ?auto_28273 ) ( CLEAR ?auto_28255 ) ( IS-CRATE ?auto_28256 ) ( not ( = ?auto_28255 ?auto_28256 ) ) ( not ( = ?auto_28259 ?auto_28255 ) ) ( not ( = ?auto_28260 ?auto_28255 ) ) ( not ( = ?auto_28258 ?auto_28255 ) ) ( not ( = ?auto_28271 ?auto_28255 ) ) ( not ( = ?auto_28264 ?auto_28255 ) ) ( not ( = ?auto_28257 ?auto_28255 ) ) ( not ( = ?auto_28263 ?auto_28255 ) ) ( not ( = ?auto_28276 ?auto_28255 ) ) ( AVAILABLE ?auto_28262 ) ( IN ?auto_28256 ?auto_28269 ) ( TRUCK-AT ?auto_28269 ?auto_28268 ) ( not ( = ?auto_28268 ?auto_28273 ) ) ( not ( = ?auto_28267 ?auto_28268 ) ) ( not ( = ?auto_28275 ?auto_28268 ) ) ( not ( = ?auto_28274 ?auto_28268 ) ) ( not ( = ?auto_28261 ?auto_28268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28258 ?auto_28259 ?auto_28260 )
      ( MAKE-5CRATE-VERIFY ?auto_28255 ?auto_28256 ?auto_28257 ?auto_28258 ?auto_28259 ?auto_28260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28277 - SURFACE
      ?auto_28278 - SURFACE
    )
    :vars
    (
      ?auto_28280 - HOIST
      ?auto_28294 - PLACE
      ?auto_28289 - SURFACE
      ?auto_28286 - PLACE
      ?auto_28284 - HOIST
      ?auto_28292 - SURFACE
      ?auto_28297 - PLACE
      ?auto_28293 - HOIST
      ?auto_28283 - SURFACE
      ?auto_28288 - SURFACE
      ?auto_28296 - PLACE
      ?auto_28285 - HOIST
      ?auto_28281 - SURFACE
      ?auto_28295 - SURFACE
      ?auto_28279 - PLACE
      ?auto_28291 - HOIST
      ?auto_28298 - SURFACE
      ?auto_28282 - SURFACE
      ?auto_28290 - TRUCK
      ?auto_28287 - PLACE
      ?auto_28299 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28280 ?auto_28294 ) ( IS-CRATE ?auto_28278 ) ( not ( = ?auto_28277 ?auto_28278 ) ) ( not ( = ?auto_28289 ?auto_28277 ) ) ( not ( = ?auto_28289 ?auto_28278 ) ) ( not ( = ?auto_28286 ?auto_28294 ) ) ( HOIST-AT ?auto_28284 ?auto_28286 ) ( not ( = ?auto_28280 ?auto_28284 ) ) ( AVAILABLE ?auto_28284 ) ( SURFACE-AT ?auto_28278 ?auto_28286 ) ( ON ?auto_28278 ?auto_28292 ) ( CLEAR ?auto_28278 ) ( not ( = ?auto_28277 ?auto_28292 ) ) ( not ( = ?auto_28278 ?auto_28292 ) ) ( not ( = ?auto_28289 ?auto_28292 ) ) ( IS-CRATE ?auto_28277 ) ( not ( = ?auto_28297 ?auto_28294 ) ) ( not ( = ?auto_28286 ?auto_28297 ) ) ( HOIST-AT ?auto_28293 ?auto_28297 ) ( not ( = ?auto_28280 ?auto_28293 ) ) ( not ( = ?auto_28284 ?auto_28293 ) ) ( AVAILABLE ?auto_28293 ) ( SURFACE-AT ?auto_28277 ?auto_28297 ) ( ON ?auto_28277 ?auto_28283 ) ( CLEAR ?auto_28277 ) ( not ( = ?auto_28277 ?auto_28283 ) ) ( not ( = ?auto_28278 ?auto_28283 ) ) ( not ( = ?auto_28289 ?auto_28283 ) ) ( not ( = ?auto_28292 ?auto_28283 ) ) ( IS-CRATE ?auto_28289 ) ( not ( = ?auto_28288 ?auto_28289 ) ) ( not ( = ?auto_28277 ?auto_28288 ) ) ( not ( = ?auto_28278 ?auto_28288 ) ) ( not ( = ?auto_28292 ?auto_28288 ) ) ( not ( = ?auto_28283 ?auto_28288 ) ) ( not ( = ?auto_28296 ?auto_28294 ) ) ( not ( = ?auto_28286 ?auto_28296 ) ) ( not ( = ?auto_28297 ?auto_28296 ) ) ( HOIST-AT ?auto_28285 ?auto_28296 ) ( not ( = ?auto_28280 ?auto_28285 ) ) ( not ( = ?auto_28284 ?auto_28285 ) ) ( not ( = ?auto_28293 ?auto_28285 ) ) ( AVAILABLE ?auto_28285 ) ( SURFACE-AT ?auto_28289 ?auto_28296 ) ( ON ?auto_28289 ?auto_28281 ) ( CLEAR ?auto_28289 ) ( not ( = ?auto_28277 ?auto_28281 ) ) ( not ( = ?auto_28278 ?auto_28281 ) ) ( not ( = ?auto_28289 ?auto_28281 ) ) ( not ( = ?auto_28292 ?auto_28281 ) ) ( not ( = ?auto_28283 ?auto_28281 ) ) ( not ( = ?auto_28288 ?auto_28281 ) ) ( IS-CRATE ?auto_28288 ) ( not ( = ?auto_28295 ?auto_28288 ) ) ( not ( = ?auto_28277 ?auto_28295 ) ) ( not ( = ?auto_28278 ?auto_28295 ) ) ( not ( = ?auto_28289 ?auto_28295 ) ) ( not ( = ?auto_28292 ?auto_28295 ) ) ( not ( = ?auto_28283 ?auto_28295 ) ) ( not ( = ?auto_28281 ?auto_28295 ) ) ( not ( = ?auto_28279 ?auto_28294 ) ) ( not ( = ?auto_28286 ?auto_28279 ) ) ( not ( = ?auto_28297 ?auto_28279 ) ) ( not ( = ?auto_28296 ?auto_28279 ) ) ( HOIST-AT ?auto_28291 ?auto_28279 ) ( not ( = ?auto_28280 ?auto_28291 ) ) ( not ( = ?auto_28284 ?auto_28291 ) ) ( not ( = ?auto_28293 ?auto_28291 ) ) ( not ( = ?auto_28285 ?auto_28291 ) ) ( AVAILABLE ?auto_28291 ) ( SURFACE-AT ?auto_28288 ?auto_28279 ) ( ON ?auto_28288 ?auto_28298 ) ( CLEAR ?auto_28288 ) ( not ( = ?auto_28277 ?auto_28298 ) ) ( not ( = ?auto_28278 ?auto_28298 ) ) ( not ( = ?auto_28289 ?auto_28298 ) ) ( not ( = ?auto_28292 ?auto_28298 ) ) ( not ( = ?auto_28283 ?auto_28298 ) ) ( not ( = ?auto_28288 ?auto_28298 ) ) ( not ( = ?auto_28281 ?auto_28298 ) ) ( not ( = ?auto_28295 ?auto_28298 ) ) ( SURFACE-AT ?auto_28282 ?auto_28294 ) ( CLEAR ?auto_28282 ) ( IS-CRATE ?auto_28295 ) ( not ( = ?auto_28282 ?auto_28295 ) ) ( not ( = ?auto_28277 ?auto_28282 ) ) ( not ( = ?auto_28278 ?auto_28282 ) ) ( not ( = ?auto_28289 ?auto_28282 ) ) ( not ( = ?auto_28292 ?auto_28282 ) ) ( not ( = ?auto_28283 ?auto_28282 ) ) ( not ( = ?auto_28288 ?auto_28282 ) ) ( not ( = ?auto_28281 ?auto_28282 ) ) ( not ( = ?auto_28298 ?auto_28282 ) ) ( AVAILABLE ?auto_28280 ) ( TRUCK-AT ?auto_28290 ?auto_28287 ) ( not ( = ?auto_28287 ?auto_28294 ) ) ( not ( = ?auto_28286 ?auto_28287 ) ) ( not ( = ?auto_28297 ?auto_28287 ) ) ( not ( = ?auto_28296 ?auto_28287 ) ) ( not ( = ?auto_28279 ?auto_28287 ) ) ( HOIST-AT ?auto_28299 ?auto_28287 ) ( LIFTING ?auto_28299 ?auto_28295 ) ( not ( = ?auto_28280 ?auto_28299 ) ) ( not ( = ?auto_28284 ?auto_28299 ) ) ( not ( = ?auto_28293 ?auto_28299 ) ) ( not ( = ?auto_28285 ?auto_28299 ) ) ( not ( = ?auto_28291 ?auto_28299 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28299 ?auto_28295 ?auto_28290 ?auto_28287 )
      ( MAKE-2CRATE ?auto_28289 ?auto_28277 ?auto_28278 )
      ( MAKE-1CRATE-VERIFY ?auto_28277 ?auto_28278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28300 - SURFACE
      ?auto_28301 - SURFACE
      ?auto_28302 - SURFACE
    )
    :vars
    (
      ?auto_28314 - HOIST
      ?auto_28316 - PLACE
      ?auto_28319 - PLACE
      ?auto_28321 - HOIST
      ?auto_28307 - SURFACE
      ?auto_28305 - PLACE
      ?auto_28311 - HOIST
      ?auto_28320 - SURFACE
      ?auto_28310 - SURFACE
      ?auto_28315 - PLACE
      ?auto_28317 - HOIST
      ?auto_28313 - SURFACE
      ?auto_28303 - SURFACE
      ?auto_28304 - PLACE
      ?auto_28312 - HOIST
      ?auto_28309 - SURFACE
      ?auto_28306 - SURFACE
      ?auto_28308 - TRUCK
      ?auto_28318 - PLACE
      ?auto_28322 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28314 ?auto_28316 ) ( IS-CRATE ?auto_28302 ) ( not ( = ?auto_28301 ?auto_28302 ) ) ( not ( = ?auto_28300 ?auto_28301 ) ) ( not ( = ?auto_28300 ?auto_28302 ) ) ( not ( = ?auto_28319 ?auto_28316 ) ) ( HOIST-AT ?auto_28321 ?auto_28319 ) ( not ( = ?auto_28314 ?auto_28321 ) ) ( AVAILABLE ?auto_28321 ) ( SURFACE-AT ?auto_28302 ?auto_28319 ) ( ON ?auto_28302 ?auto_28307 ) ( CLEAR ?auto_28302 ) ( not ( = ?auto_28301 ?auto_28307 ) ) ( not ( = ?auto_28302 ?auto_28307 ) ) ( not ( = ?auto_28300 ?auto_28307 ) ) ( IS-CRATE ?auto_28301 ) ( not ( = ?auto_28305 ?auto_28316 ) ) ( not ( = ?auto_28319 ?auto_28305 ) ) ( HOIST-AT ?auto_28311 ?auto_28305 ) ( not ( = ?auto_28314 ?auto_28311 ) ) ( not ( = ?auto_28321 ?auto_28311 ) ) ( AVAILABLE ?auto_28311 ) ( SURFACE-AT ?auto_28301 ?auto_28305 ) ( ON ?auto_28301 ?auto_28320 ) ( CLEAR ?auto_28301 ) ( not ( = ?auto_28301 ?auto_28320 ) ) ( not ( = ?auto_28302 ?auto_28320 ) ) ( not ( = ?auto_28300 ?auto_28320 ) ) ( not ( = ?auto_28307 ?auto_28320 ) ) ( IS-CRATE ?auto_28300 ) ( not ( = ?auto_28310 ?auto_28300 ) ) ( not ( = ?auto_28301 ?auto_28310 ) ) ( not ( = ?auto_28302 ?auto_28310 ) ) ( not ( = ?auto_28307 ?auto_28310 ) ) ( not ( = ?auto_28320 ?auto_28310 ) ) ( not ( = ?auto_28315 ?auto_28316 ) ) ( not ( = ?auto_28319 ?auto_28315 ) ) ( not ( = ?auto_28305 ?auto_28315 ) ) ( HOIST-AT ?auto_28317 ?auto_28315 ) ( not ( = ?auto_28314 ?auto_28317 ) ) ( not ( = ?auto_28321 ?auto_28317 ) ) ( not ( = ?auto_28311 ?auto_28317 ) ) ( AVAILABLE ?auto_28317 ) ( SURFACE-AT ?auto_28300 ?auto_28315 ) ( ON ?auto_28300 ?auto_28313 ) ( CLEAR ?auto_28300 ) ( not ( = ?auto_28301 ?auto_28313 ) ) ( not ( = ?auto_28302 ?auto_28313 ) ) ( not ( = ?auto_28300 ?auto_28313 ) ) ( not ( = ?auto_28307 ?auto_28313 ) ) ( not ( = ?auto_28320 ?auto_28313 ) ) ( not ( = ?auto_28310 ?auto_28313 ) ) ( IS-CRATE ?auto_28310 ) ( not ( = ?auto_28303 ?auto_28310 ) ) ( not ( = ?auto_28301 ?auto_28303 ) ) ( not ( = ?auto_28302 ?auto_28303 ) ) ( not ( = ?auto_28300 ?auto_28303 ) ) ( not ( = ?auto_28307 ?auto_28303 ) ) ( not ( = ?auto_28320 ?auto_28303 ) ) ( not ( = ?auto_28313 ?auto_28303 ) ) ( not ( = ?auto_28304 ?auto_28316 ) ) ( not ( = ?auto_28319 ?auto_28304 ) ) ( not ( = ?auto_28305 ?auto_28304 ) ) ( not ( = ?auto_28315 ?auto_28304 ) ) ( HOIST-AT ?auto_28312 ?auto_28304 ) ( not ( = ?auto_28314 ?auto_28312 ) ) ( not ( = ?auto_28321 ?auto_28312 ) ) ( not ( = ?auto_28311 ?auto_28312 ) ) ( not ( = ?auto_28317 ?auto_28312 ) ) ( AVAILABLE ?auto_28312 ) ( SURFACE-AT ?auto_28310 ?auto_28304 ) ( ON ?auto_28310 ?auto_28309 ) ( CLEAR ?auto_28310 ) ( not ( = ?auto_28301 ?auto_28309 ) ) ( not ( = ?auto_28302 ?auto_28309 ) ) ( not ( = ?auto_28300 ?auto_28309 ) ) ( not ( = ?auto_28307 ?auto_28309 ) ) ( not ( = ?auto_28320 ?auto_28309 ) ) ( not ( = ?auto_28310 ?auto_28309 ) ) ( not ( = ?auto_28313 ?auto_28309 ) ) ( not ( = ?auto_28303 ?auto_28309 ) ) ( SURFACE-AT ?auto_28306 ?auto_28316 ) ( CLEAR ?auto_28306 ) ( IS-CRATE ?auto_28303 ) ( not ( = ?auto_28306 ?auto_28303 ) ) ( not ( = ?auto_28301 ?auto_28306 ) ) ( not ( = ?auto_28302 ?auto_28306 ) ) ( not ( = ?auto_28300 ?auto_28306 ) ) ( not ( = ?auto_28307 ?auto_28306 ) ) ( not ( = ?auto_28320 ?auto_28306 ) ) ( not ( = ?auto_28310 ?auto_28306 ) ) ( not ( = ?auto_28313 ?auto_28306 ) ) ( not ( = ?auto_28309 ?auto_28306 ) ) ( AVAILABLE ?auto_28314 ) ( TRUCK-AT ?auto_28308 ?auto_28318 ) ( not ( = ?auto_28318 ?auto_28316 ) ) ( not ( = ?auto_28319 ?auto_28318 ) ) ( not ( = ?auto_28305 ?auto_28318 ) ) ( not ( = ?auto_28315 ?auto_28318 ) ) ( not ( = ?auto_28304 ?auto_28318 ) ) ( HOIST-AT ?auto_28322 ?auto_28318 ) ( LIFTING ?auto_28322 ?auto_28303 ) ( not ( = ?auto_28314 ?auto_28322 ) ) ( not ( = ?auto_28321 ?auto_28322 ) ) ( not ( = ?auto_28311 ?auto_28322 ) ) ( not ( = ?auto_28317 ?auto_28322 ) ) ( not ( = ?auto_28312 ?auto_28322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28301 ?auto_28302 )
      ( MAKE-2CRATE-VERIFY ?auto_28300 ?auto_28301 ?auto_28302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28323 - SURFACE
      ?auto_28324 - SURFACE
      ?auto_28325 - SURFACE
      ?auto_28326 - SURFACE
    )
    :vars
    (
      ?auto_28327 - HOIST
      ?auto_28329 - PLACE
      ?auto_28336 - PLACE
      ?auto_28330 - HOIST
      ?auto_28335 - SURFACE
      ?auto_28333 - PLACE
      ?auto_28339 - HOIST
      ?auto_28340 - SURFACE
      ?auto_28341 - PLACE
      ?auto_28343 - HOIST
      ?auto_28338 - SURFACE
      ?auto_28342 - SURFACE
      ?auto_28332 - PLACE
      ?auto_28334 - HOIST
      ?auto_28331 - SURFACE
      ?auto_28328 - SURFACE
      ?auto_28337 - TRUCK
      ?auto_28345 - PLACE
      ?auto_28344 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28327 ?auto_28329 ) ( IS-CRATE ?auto_28326 ) ( not ( = ?auto_28325 ?auto_28326 ) ) ( not ( = ?auto_28324 ?auto_28325 ) ) ( not ( = ?auto_28324 ?auto_28326 ) ) ( not ( = ?auto_28336 ?auto_28329 ) ) ( HOIST-AT ?auto_28330 ?auto_28336 ) ( not ( = ?auto_28327 ?auto_28330 ) ) ( AVAILABLE ?auto_28330 ) ( SURFACE-AT ?auto_28326 ?auto_28336 ) ( ON ?auto_28326 ?auto_28335 ) ( CLEAR ?auto_28326 ) ( not ( = ?auto_28325 ?auto_28335 ) ) ( not ( = ?auto_28326 ?auto_28335 ) ) ( not ( = ?auto_28324 ?auto_28335 ) ) ( IS-CRATE ?auto_28325 ) ( not ( = ?auto_28333 ?auto_28329 ) ) ( not ( = ?auto_28336 ?auto_28333 ) ) ( HOIST-AT ?auto_28339 ?auto_28333 ) ( not ( = ?auto_28327 ?auto_28339 ) ) ( not ( = ?auto_28330 ?auto_28339 ) ) ( AVAILABLE ?auto_28339 ) ( SURFACE-AT ?auto_28325 ?auto_28333 ) ( ON ?auto_28325 ?auto_28340 ) ( CLEAR ?auto_28325 ) ( not ( = ?auto_28325 ?auto_28340 ) ) ( not ( = ?auto_28326 ?auto_28340 ) ) ( not ( = ?auto_28324 ?auto_28340 ) ) ( not ( = ?auto_28335 ?auto_28340 ) ) ( IS-CRATE ?auto_28324 ) ( not ( = ?auto_28323 ?auto_28324 ) ) ( not ( = ?auto_28325 ?auto_28323 ) ) ( not ( = ?auto_28326 ?auto_28323 ) ) ( not ( = ?auto_28335 ?auto_28323 ) ) ( not ( = ?auto_28340 ?auto_28323 ) ) ( not ( = ?auto_28341 ?auto_28329 ) ) ( not ( = ?auto_28336 ?auto_28341 ) ) ( not ( = ?auto_28333 ?auto_28341 ) ) ( HOIST-AT ?auto_28343 ?auto_28341 ) ( not ( = ?auto_28327 ?auto_28343 ) ) ( not ( = ?auto_28330 ?auto_28343 ) ) ( not ( = ?auto_28339 ?auto_28343 ) ) ( AVAILABLE ?auto_28343 ) ( SURFACE-AT ?auto_28324 ?auto_28341 ) ( ON ?auto_28324 ?auto_28338 ) ( CLEAR ?auto_28324 ) ( not ( = ?auto_28325 ?auto_28338 ) ) ( not ( = ?auto_28326 ?auto_28338 ) ) ( not ( = ?auto_28324 ?auto_28338 ) ) ( not ( = ?auto_28335 ?auto_28338 ) ) ( not ( = ?auto_28340 ?auto_28338 ) ) ( not ( = ?auto_28323 ?auto_28338 ) ) ( IS-CRATE ?auto_28323 ) ( not ( = ?auto_28342 ?auto_28323 ) ) ( not ( = ?auto_28325 ?auto_28342 ) ) ( not ( = ?auto_28326 ?auto_28342 ) ) ( not ( = ?auto_28324 ?auto_28342 ) ) ( not ( = ?auto_28335 ?auto_28342 ) ) ( not ( = ?auto_28340 ?auto_28342 ) ) ( not ( = ?auto_28338 ?auto_28342 ) ) ( not ( = ?auto_28332 ?auto_28329 ) ) ( not ( = ?auto_28336 ?auto_28332 ) ) ( not ( = ?auto_28333 ?auto_28332 ) ) ( not ( = ?auto_28341 ?auto_28332 ) ) ( HOIST-AT ?auto_28334 ?auto_28332 ) ( not ( = ?auto_28327 ?auto_28334 ) ) ( not ( = ?auto_28330 ?auto_28334 ) ) ( not ( = ?auto_28339 ?auto_28334 ) ) ( not ( = ?auto_28343 ?auto_28334 ) ) ( AVAILABLE ?auto_28334 ) ( SURFACE-AT ?auto_28323 ?auto_28332 ) ( ON ?auto_28323 ?auto_28331 ) ( CLEAR ?auto_28323 ) ( not ( = ?auto_28325 ?auto_28331 ) ) ( not ( = ?auto_28326 ?auto_28331 ) ) ( not ( = ?auto_28324 ?auto_28331 ) ) ( not ( = ?auto_28335 ?auto_28331 ) ) ( not ( = ?auto_28340 ?auto_28331 ) ) ( not ( = ?auto_28323 ?auto_28331 ) ) ( not ( = ?auto_28338 ?auto_28331 ) ) ( not ( = ?auto_28342 ?auto_28331 ) ) ( SURFACE-AT ?auto_28328 ?auto_28329 ) ( CLEAR ?auto_28328 ) ( IS-CRATE ?auto_28342 ) ( not ( = ?auto_28328 ?auto_28342 ) ) ( not ( = ?auto_28325 ?auto_28328 ) ) ( not ( = ?auto_28326 ?auto_28328 ) ) ( not ( = ?auto_28324 ?auto_28328 ) ) ( not ( = ?auto_28335 ?auto_28328 ) ) ( not ( = ?auto_28340 ?auto_28328 ) ) ( not ( = ?auto_28323 ?auto_28328 ) ) ( not ( = ?auto_28338 ?auto_28328 ) ) ( not ( = ?auto_28331 ?auto_28328 ) ) ( AVAILABLE ?auto_28327 ) ( TRUCK-AT ?auto_28337 ?auto_28345 ) ( not ( = ?auto_28345 ?auto_28329 ) ) ( not ( = ?auto_28336 ?auto_28345 ) ) ( not ( = ?auto_28333 ?auto_28345 ) ) ( not ( = ?auto_28341 ?auto_28345 ) ) ( not ( = ?auto_28332 ?auto_28345 ) ) ( HOIST-AT ?auto_28344 ?auto_28345 ) ( LIFTING ?auto_28344 ?auto_28342 ) ( not ( = ?auto_28327 ?auto_28344 ) ) ( not ( = ?auto_28330 ?auto_28344 ) ) ( not ( = ?auto_28339 ?auto_28344 ) ) ( not ( = ?auto_28343 ?auto_28344 ) ) ( not ( = ?auto_28334 ?auto_28344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28324 ?auto_28325 ?auto_28326 )
      ( MAKE-3CRATE-VERIFY ?auto_28323 ?auto_28324 ?auto_28325 ?auto_28326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28346 - SURFACE
      ?auto_28347 - SURFACE
      ?auto_28348 - SURFACE
      ?auto_28349 - SURFACE
      ?auto_28350 - SURFACE
    )
    :vars
    (
      ?auto_28351 - HOIST
      ?auto_28353 - PLACE
      ?auto_28360 - PLACE
      ?auto_28354 - HOIST
      ?auto_28359 - SURFACE
      ?auto_28357 - PLACE
      ?auto_28363 - HOIST
      ?auto_28364 - SURFACE
      ?auto_28365 - PLACE
      ?auto_28366 - HOIST
      ?auto_28362 - SURFACE
      ?auto_28356 - PLACE
      ?auto_28358 - HOIST
      ?auto_28355 - SURFACE
      ?auto_28352 - SURFACE
      ?auto_28361 - TRUCK
      ?auto_28368 - PLACE
      ?auto_28367 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28351 ?auto_28353 ) ( IS-CRATE ?auto_28350 ) ( not ( = ?auto_28349 ?auto_28350 ) ) ( not ( = ?auto_28348 ?auto_28349 ) ) ( not ( = ?auto_28348 ?auto_28350 ) ) ( not ( = ?auto_28360 ?auto_28353 ) ) ( HOIST-AT ?auto_28354 ?auto_28360 ) ( not ( = ?auto_28351 ?auto_28354 ) ) ( AVAILABLE ?auto_28354 ) ( SURFACE-AT ?auto_28350 ?auto_28360 ) ( ON ?auto_28350 ?auto_28359 ) ( CLEAR ?auto_28350 ) ( not ( = ?auto_28349 ?auto_28359 ) ) ( not ( = ?auto_28350 ?auto_28359 ) ) ( not ( = ?auto_28348 ?auto_28359 ) ) ( IS-CRATE ?auto_28349 ) ( not ( = ?auto_28357 ?auto_28353 ) ) ( not ( = ?auto_28360 ?auto_28357 ) ) ( HOIST-AT ?auto_28363 ?auto_28357 ) ( not ( = ?auto_28351 ?auto_28363 ) ) ( not ( = ?auto_28354 ?auto_28363 ) ) ( AVAILABLE ?auto_28363 ) ( SURFACE-AT ?auto_28349 ?auto_28357 ) ( ON ?auto_28349 ?auto_28364 ) ( CLEAR ?auto_28349 ) ( not ( = ?auto_28349 ?auto_28364 ) ) ( not ( = ?auto_28350 ?auto_28364 ) ) ( not ( = ?auto_28348 ?auto_28364 ) ) ( not ( = ?auto_28359 ?auto_28364 ) ) ( IS-CRATE ?auto_28348 ) ( not ( = ?auto_28347 ?auto_28348 ) ) ( not ( = ?auto_28349 ?auto_28347 ) ) ( not ( = ?auto_28350 ?auto_28347 ) ) ( not ( = ?auto_28359 ?auto_28347 ) ) ( not ( = ?auto_28364 ?auto_28347 ) ) ( not ( = ?auto_28365 ?auto_28353 ) ) ( not ( = ?auto_28360 ?auto_28365 ) ) ( not ( = ?auto_28357 ?auto_28365 ) ) ( HOIST-AT ?auto_28366 ?auto_28365 ) ( not ( = ?auto_28351 ?auto_28366 ) ) ( not ( = ?auto_28354 ?auto_28366 ) ) ( not ( = ?auto_28363 ?auto_28366 ) ) ( AVAILABLE ?auto_28366 ) ( SURFACE-AT ?auto_28348 ?auto_28365 ) ( ON ?auto_28348 ?auto_28362 ) ( CLEAR ?auto_28348 ) ( not ( = ?auto_28349 ?auto_28362 ) ) ( not ( = ?auto_28350 ?auto_28362 ) ) ( not ( = ?auto_28348 ?auto_28362 ) ) ( not ( = ?auto_28359 ?auto_28362 ) ) ( not ( = ?auto_28364 ?auto_28362 ) ) ( not ( = ?auto_28347 ?auto_28362 ) ) ( IS-CRATE ?auto_28347 ) ( not ( = ?auto_28346 ?auto_28347 ) ) ( not ( = ?auto_28349 ?auto_28346 ) ) ( not ( = ?auto_28350 ?auto_28346 ) ) ( not ( = ?auto_28348 ?auto_28346 ) ) ( not ( = ?auto_28359 ?auto_28346 ) ) ( not ( = ?auto_28364 ?auto_28346 ) ) ( not ( = ?auto_28362 ?auto_28346 ) ) ( not ( = ?auto_28356 ?auto_28353 ) ) ( not ( = ?auto_28360 ?auto_28356 ) ) ( not ( = ?auto_28357 ?auto_28356 ) ) ( not ( = ?auto_28365 ?auto_28356 ) ) ( HOIST-AT ?auto_28358 ?auto_28356 ) ( not ( = ?auto_28351 ?auto_28358 ) ) ( not ( = ?auto_28354 ?auto_28358 ) ) ( not ( = ?auto_28363 ?auto_28358 ) ) ( not ( = ?auto_28366 ?auto_28358 ) ) ( AVAILABLE ?auto_28358 ) ( SURFACE-AT ?auto_28347 ?auto_28356 ) ( ON ?auto_28347 ?auto_28355 ) ( CLEAR ?auto_28347 ) ( not ( = ?auto_28349 ?auto_28355 ) ) ( not ( = ?auto_28350 ?auto_28355 ) ) ( not ( = ?auto_28348 ?auto_28355 ) ) ( not ( = ?auto_28359 ?auto_28355 ) ) ( not ( = ?auto_28364 ?auto_28355 ) ) ( not ( = ?auto_28347 ?auto_28355 ) ) ( not ( = ?auto_28362 ?auto_28355 ) ) ( not ( = ?auto_28346 ?auto_28355 ) ) ( SURFACE-AT ?auto_28352 ?auto_28353 ) ( CLEAR ?auto_28352 ) ( IS-CRATE ?auto_28346 ) ( not ( = ?auto_28352 ?auto_28346 ) ) ( not ( = ?auto_28349 ?auto_28352 ) ) ( not ( = ?auto_28350 ?auto_28352 ) ) ( not ( = ?auto_28348 ?auto_28352 ) ) ( not ( = ?auto_28359 ?auto_28352 ) ) ( not ( = ?auto_28364 ?auto_28352 ) ) ( not ( = ?auto_28347 ?auto_28352 ) ) ( not ( = ?auto_28362 ?auto_28352 ) ) ( not ( = ?auto_28355 ?auto_28352 ) ) ( AVAILABLE ?auto_28351 ) ( TRUCK-AT ?auto_28361 ?auto_28368 ) ( not ( = ?auto_28368 ?auto_28353 ) ) ( not ( = ?auto_28360 ?auto_28368 ) ) ( not ( = ?auto_28357 ?auto_28368 ) ) ( not ( = ?auto_28365 ?auto_28368 ) ) ( not ( = ?auto_28356 ?auto_28368 ) ) ( HOIST-AT ?auto_28367 ?auto_28368 ) ( LIFTING ?auto_28367 ?auto_28346 ) ( not ( = ?auto_28351 ?auto_28367 ) ) ( not ( = ?auto_28354 ?auto_28367 ) ) ( not ( = ?auto_28363 ?auto_28367 ) ) ( not ( = ?auto_28366 ?auto_28367 ) ) ( not ( = ?auto_28358 ?auto_28367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28348 ?auto_28349 ?auto_28350 )
      ( MAKE-4CRATE-VERIFY ?auto_28346 ?auto_28347 ?auto_28348 ?auto_28349 ?auto_28350 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28369 - SURFACE
      ?auto_28370 - SURFACE
      ?auto_28371 - SURFACE
      ?auto_28372 - SURFACE
      ?auto_28373 - SURFACE
      ?auto_28374 - SURFACE
    )
    :vars
    (
      ?auto_28375 - HOIST
      ?auto_28376 - PLACE
      ?auto_28383 - PLACE
      ?auto_28377 - HOIST
      ?auto_28382 - SURFACE
      ?auto_28380 - PLACE
      ?auto_28386 - HOIST
      ?auto_28387 - SURFACE
      ?auto_28388 - PLACE
      ?auto_28389 - HOIST
      ?auto_28385 - SURFACE
      ?auto_28379 - PLACE
      ?auto_28381 - HOIST
      ?auto_28378 - SURFACE
      ?auto_28384 - TRUCK
      ?auto_28391 - PLACE
      ?auto_28390 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28375 ?auto_28376 ) ( IS-CRATE ?auto_28374 ) ( not ( = ?auto_28373 ?auto_28374 ) ) ( not ( = ?auto_28372 ?auto_28373 ) ) ( not ( = ?auto_28372 ?auto_28374 ) ) ( not ( = ?auto_28383 ?auto_28376 ) ) ( HOIST-AT ?auto_28377 ?auto_28383 ) ( not ( = ?auto_28375 ?auto_28377 ) ) ( AVAILABLE ?auto_28377 ) ( SURFACE-AT ?auto_28374 ?auto_28383 ) ( ON ?auto_28374 ?auto_28382 ) ( CLEAR ?auto_28374 ) ( not ( = ?auto_28373 ?auto_28382 ) ) ( not ( = ?auto_28374 ?auto_28382 ) ) ( not ( = ?auto_28372 ?auto_28382 ) ) ( IS-CRATE ?auto_28373 ) ( not ( = ?auto_28380 ?auto_28376 ) ) ( not ( = ?auto_28383 ?auto_28380 ) ) ( HOIST-AT ?auto_28386 ?auto_28380 ) ( not ( = ?auto_28375 ?auto_28386 ) ) ( not ( = ?auto_28377 ?auto_28386 ) ) ( AVAILABLE ?auto_28386 ) ( SURFACE-AT ?auto_28373 ?auto_28380 ) ( ON ?auto_28373 ?auto_28387 ) ( CLEAR ?auto_28373 ) ( not ( = ?auto_28373 ?auto_28387 ) ) ( not ( = ?auto_28374 ?auto_28387 ) ) ( not ( = ?auto_28372 ?auto_28387 ) ) ( not ( = ?auto_28382 ?auto_28387 ) ) ( IS-CRATE ?auto_28372 ) ( not ( = ?auto_28371 ?auto_28372 ) ) ( not ( = ?auto_28373 ?auto_28371 ) ) ( not ( = ?auto_28374 ?auto_28371 ) ) ( not ( = ?auto_28382 ?auto_28371 ) ) ( not ( = ?auto_28387 ?auto_28371 ) ) ( not ( = ?auto_28388 ?auto_28376 ) ) ( not ( = ?auto_28383 ?auto_28388 ) ) ( not ( = ?auto_28380 ?auto_28388 ) ) ( HOIST-AT ?auto_28389 ?auto_28388 ) ( not ( = ?auto_28375 ?auto_28389 ) ) ( not ( = ?auto_28377 ?auto_28389 ) ) ( not ( = ?auto_28386 ?auto_28389 ) ) ( AVAILABLE ?auto_28389 ) ( SURFACE-AT ?auto_28372 ?auto_28388 ) ( ON ?auto_28372 ?auto_28385 ) ( CLEAR ?auto_28372 ) ( not ( = ?auto_28373 ?auto_28385 ) ) ( not ( = ?auto_28374 ?auto_28385 ) ) ( not ( = ?auto_28372 ?auto_28385 ) ) ( not ( = ?auto_28382 ?auto_28385 ) ) ( not ( = ?auto_28387 ?auto_28385 ) ) ( not ( = ?auto_28371 ?auto_28385 ) ) ( IS-CRATE ?auto_28371 ) ( not ( = ?auto_28370 ?auto_28371 ) ) ( not ( = ?auto_28373 ?auto_28370 ) ) ( not ( = ?auto_28374 ?auto_28370 ) ) ( not ( = ?auto_28372 ?auto_28370 ) ) ( not ( = ?auto_28382 ?auto_28370 ) ) ( not ( = ?auto_28387 ?auto_28370 ) ) ( not ( = ?auto_28385 ?auto_28370 ) ) ( not ( = ?auto_28379 ?auto_28376 ) ) ( not ( = ?auto_28383 ?auto_28379 ) ) ( not ( = ?auto_28380 ?auto_28379 ) ) ( not ( = ?auto_28388 ?auto_28379 ) ) ( HOIST-AT ?auto_28381 ?auto_28379 ) ( not ( = ?auto_28375 ?auto_28381 ) ) ( not ( = ?auto_28377 ?auto_28381 ) ) ( not ( = ?auto_28386 ?auto_28381 ) ) ( not ( = ?auto_28389 ?auto_28381 ) ) ( AVAILABLE ?auto_28381 ) ( SURFACE-AT ?auto_28371 ?auto_28379 ) ( ON ?auto_28371 ?auto_28378 ) ( CLEAR ?auto_28371 ) ( not ( = ?auto_28373 ?auto_28378 ) ) ( not ( = ?auto_28374 ?auto_28378 ) ) ( not ( = ?auto_28372 ?auto_28378 ) ) ( not ( = ?auto_28382 ?auto_28378 ) ) ( not ( = ?auto_28387 ?auto_28378 ) ) ( not ( = ?auto_28371 ?auto_28378 ) ) ( not ( = ?auto_28385 ?auto_28378 ) ) ( not ( = ?auto_28370 ?auto_28378 ) ) ( SURFACE-AT ?auto_28369 ?auto_28376 ) ( CLEAR ?auto_28369 ) ( IS-CRATE ?auto_28370 ) ( not ( = ?auto_28369 ?auto_28370 ) ) ( not ( = ?auto_28373 ?auto_28369 ) ) ( not ( = ?auto_28374 ?auto_28369 ) ) ( not ( = ?auto_28372 ?auto_28369 ) ) ( not ( = ?auto_28382 ?auto_28369 ) ) ( not ( = ?auto_28387 ?auto_28369 ) ) ( not ( = ?auto_28371 ?auto_28369 ) ) ( not ( = ?auto_28385 ?auto_28369 ) ) ( not ( = ?auto_28378 ?auto_28369 ) ) ( AVAILABLE ?auto_28375 ) ( TRUCK-AT ?auto_28384 ?auto_28391 ) ( not ( = ?auto_28391 ?auto_28376 ) ) ( not ( = ?auto_28383 ?auto_28391 ) ) ( not ( = ?auto_28380 ?auto_28391 ) ) ( not ( = ?auto_28388 ?auto_28391 ) ) ( not ( = ?auto_28379 ?auto_28391 ) ) ( HOIST-AT ?auto_28390 ?auto_28391 ) ( LIFTING ?auto_28390 ?auto_28370 ) ( not ( = ?auto_28375 ?auto_28390 ) ) ( not ( = ?auto_28377 ?auto_28390 ) ) ( not ( = ?auto_28386 ?auto_28390 ) ) ( not ( = ?auto_28389 ?auto_28390 ) ) ( not ( = ?auto_28381 ?auto_28390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28372 ?auto_28373 ?auto_28374 )
      ( MAKE-5CRATE-VERIFY ?auto_28369 ?auto_28370 ?auto_28371 ?auto_28372 ?auto_28373 ?auto_28374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28392 - SURFACE
      ?auto_28393 - SURFACE
    )
    :vars
    (
      ?auto_28394 - HOIST
      ?auto_28396 - PLACE
      ?auto_28410 - SURFACE
      ?auto_28404 - PLACE
      ?auto_28397 - HOIST
      ?auto_28403 - SURFACE
      ?auto_28401 - PLACE
      ?auto_28407 - HOIST
      ?auto_28408 - SURFACE
      ?auto_28400 - SURFACE
      ?auto_28409 - PLACE
      ?auto_28412 - HOIST
      ?auto_28406 - SURFACE
      ?auto_28411 - SURFACE
      ?auto_28399 - PLACE
      ?auto_28402 - HOIST
      ?auto_28398 - SURFACE
      ?auto_28395 - SURFACE
      ?auto_28405 - TRUCK
      ?auto_28414 - PLACE
      ?auto_28413 - HOIST
      ?auto_28415 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28394 ?auto_28396 ) ( IS-CRATE ?auto_28393 ) ( not ( = ?auto_28392 ?auto_28393 ) ) ( not ( = ?auto_28410 ?auto_28392 ) ) ( not ( = ?auto_28410 ?auto_28393 ) ) ( not ( = ?auto_28404 ?auto_28396 ) ) ( HOIST-AT ?auto_28397 ?auto_28404 ) ( not ( = ?auto_28394 ?auto_28397 ) ) ( AVAILABLE ?auto_28397 ) ( SURFACE-AT ?auto_28393 ?auto_28404 ) ( ON ?auto_28393 ?auto_28403 ) ( CLEAR ?auto_28393 ) ( not ( = ?auto_28392 ?auto_28403 ) ) ( not ( = ?auto_28393 ?auto_28403 ) ) ( not ( = ?auto_28410 ?auto_28403 ) ) ( IS-CRATE ?auto_28392 ) ( not ( = ?auto_28401 ?auto_28396 ) ) ( not ( = ?auto_28404 ?auto_28401 ) ) ( HOIST-AT ?auto_28407 ?auto_28401 ) ( not ( = ?auto_28394 ?auto_28407 ) ) ( not ( = ?auto_28397 ?auto_28407 ) ) ( AVAILABLE ?auto_28407 ) ( SURFACE-AT ?auto_28392 ?auto_28401 ) ( ON ?auto_28392 ?auto_28408 ) ( CLEAR ?auto_28392 ) ( not ( = ?auto_28392 ?auto_28408 ) ) ( not ( = ?auto_28393 ?auto_28408 ) ) ( not ( = ?auto_28410 ?auto_28408 ) ) ( not ( = ?auto_28403 ?auto_28408 ) ) ( IS-CRATE ?auto_28410 ) ( not ( = ?auto_28400 ?auto_28410 ) ) ( not ( = ?auto_28392 ?auto_28400 ) ) ( not ( = ?auto_28393 ?auto_28400 ) ) ( not ( = ?auto_28403 ?auto_28400 ) ) ( not ( = ?auto_28408 ?auto_28400 ) ) ( not ( = ?auto_28409 ?auto_28396 ) ) ( not ( = ?auto_28404 ?auto_28409 ) ) ( not ( = ?auto_28401 ?auto_28409 ) ) ( HOIST-AT ?auto_28412 ?auto_28409 ) ( not ( = ?auto_28394 ?auto_28412 ) ) ( not ( = ?auto_28397 ?auto_28412 ) ) ( not ( = ?auto_28407 ?auto_28412 ) ) ( AVAILABLE ?auto_28412 ) ( SURFACE-AT ?auto_28410 ?auto_28409 ) ( ON ?auto_28410 ?auto_28406 ) ( CLEAR ?auto_28410 ) ( not ( = ?auto_28392 ?auto_28406 ) ) ( not ( = ?auto_28393 ?auto_28406 ) ) ( not ( = ?auto_28410 ?auto_28406 ) ) ( not ( = ?auto_28403 ?auto_28406 ) ) ( not ( = ?auto_28408 ?auto_28406 ) ) ( not ( = ?auto_28400 ?auto_28406 ) ) ( IS-CRATE ?auto_28400 ) ( not ( = ?auto_28411 ?auto_28400 ) ) ( not ( = ?auto_28392 ?auto_28411 ) ) ( not ( = ?auto_28393 ?auto_28411 ) ) ( not ( = ?auto_28410 ?auto_28411 ) ) ( not ( = ?auto_28403 ?auto_28411 ) ) ( not ( = ?auto_28408 ?auto_28411 ) ) ( not ( = ?auto_28406 ?auto_28411 ) ) ( not ( = ?auto_28399 ?auto_28396 ) ) ( not ( = ?auto_28404 ?auto_28399 ) ) ( not ( = ?auto_28401 ?auto_28399 ) ) ( not ( = ?auto_28409 ?auto_28399 ) ) ( HOIST-AT ?auto_28402 ?auto_28399 ) ( not ( = ?auto_28394 ?auto_28402 ) ) ( not ( = ?auto_28397 ?auto_28402 ) ) ( not ( = ?auto_28407 ?auto_28402 ) ) ( not ( = ?auto_28412 ?auto_28402 ) ) ( AVAILABLE ?auto_28402 ) ( SURFACE-AT ?auto_28400 ?auto_28399 ) ( ON ?auto_28400 ?auto_28398 ) ( CLEAR ?auto_28400 ) ( not ( = ?auto_28392 ?auto_28398 ) ) ( not ( = ?auto_28393 ?auto_28398 ) ) ( not ( = ?auto_28410 ?auto_28398 ) ) ( not ( = ?auto_28403 ?auto_28398 ) ) ( not ( = ?auto_28408 ?auto_28398 ) ) ( not ( = ?auto_28400 ?auto_28398 ) ) ( not ( = ?auto_28406 ?auto_28398 ) ) ( not ( = ?auto_28411 ?auto_28398 ) ) ( SURFACE-AT ?auto_28395 ?auto_28396 ) ( CLEAR ?auto_28395 ) ( IS-CRATE ?auto_28411 ) ( not ( = ?auto_28395 ?auto_28411 ) ) ( not ( = ?auto_28392 ?auto_28395 ) ) ( not ( = ?auto_28393 ?auto_28395 ) ) ( not ( = ?auto_28410 ?auto_28395 ) ) ( not ( = ?auto_28403 ?auto_28395 ) ) ( not ( = ?auto_28408 ?auto_28395 ) ) ( not ( = ?auto_28400 ?auto_28395 ) ) ( not ( = ?auto_28406 ?auto_28395 ) ) ( not ( = ?auto_28398 ?auto_28395 ) ) ( AVAILABLE ?auto_28394 ) ( TRUCK-AT ?auto_28405 ?auto_28414 ) ( not ( = ?auto_28414 ?auto_28396 ) ) ( not ( = ?auto_28404 ?auto_28414 ) ) ( not ( = ?auto_28401 ?auto_28414 ) ) ( not ( = ?auto_28409 ?auto_28414 ) ) ( not ( = ?auto_28399 ?auto_28414 ) ) ( HOIST-AT ?auto_28413 ?auto_28414 ) ( not ( = ?auto_28394 ?auto_28413 ) ) ( not ( = ?auto_28397 ?auto_28413 ) ) ( not ( = ?auto_28407 ?auto_28413 ) ) ( not ( = ?auto_28412 ?auto_28413 ) ) ( not ( = ?auto_28402 ?auto_28413 ) ) ( AVAILABLE ?auto_28413 ) ( SURFACE-AT ?auto_28411 ?auto_28414 ) ( ON ?auto_28411 ?auto_28415 ) ( CLEAR ?auto_28411 ) ( not ( = ?auto_28392 ?auto_28415 ) ) ( not ( = ?auto_28393 ?auto_28415 ) ) ( not ( = ?auto_28410 ?auto_28415 ) ) ( not ( = ?auto_28403 ?auto_28415 ) ) ( not ( = ?auto_28408 ?auto_28415 ) ) ( not ( = ?auto_28400 ?auto_28415 ) ) ( not ( = ?auto_28406 ?auto_28415 ) ) ( not ( = ?auto_28411 ?auto_28415 ) ) ( not ( = ?auto_28398 ?auto_28415 ) ) ( not ( = ?auto_28395 ?auto_28415 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28413 ?auto_28411 ?auto_28415 ?auto_28414 )
      ( MAKE-2CRATE ?auto_28410 ?auto_28392 ?auto_28393 )
      ( MAKE-1CRATE-VERIFY ?auto_28392 ?auto_28393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28416 - SURFACE
      ?auto_28417 - SURFACE
      ?auto_28418 - SURFACE
    )
    :vars
    (
      ?auto_28439 - HOIST
      ?auto_28432 - PLACE
      ?auto_28436 - PLACE
      ?auto_28419 - HOIST
      ?auto_28431 - SURFACE
      ?auto_28420 - PLACE
      ?auto_28433 - HOIST
      ?auto_28434 - SURFACE
      ?auto_28422 - SURFACE
      ?auto_28438 - PLACE
      ?auto_28435 - HOIST
      ?auto_28424 - SURFACE
      ?auto_28423 - SURFACE
      ?auto_28437 - PLACE
      ?auto_28425 - HOIST
      ?auto_28429 - SURFACE
      ?auto_28426 - SURFACE
      ?auto_28430 - TRUCK
      ?auto_28421 - PLACE
      ?auto_28428 - HOIST
      ?auto_28427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28439 ?auto_28432 ) ( IS-CRATE ?auto_28418 ) ( not ( = ?auto_28417 ?auto_28418 ) ) ( not ( = ?auto_28416 ?auto_28417 ) ) ( not ( = ?auto_28416 ?auto_28418 ) ) ( not ( = ?auto_28436 ?auto_28432 ) ) ( HOIST-AT ?auto_28419 ?auto_28436 ) ( not ( = ?auto_28439 ?auto_28419 ) ) ( AVAILABLE ?auto_28419 ) ( SURFACE-AT ?auto_28418 ?auto_28436 ) ( ON ?auto_28418 ?auto_28431 ) ( CLEAR ?auto_28418 ) ( not ( = ?auto_28417 ?auto_28431 ) ) ( not ( = ?auto_28418 ?auto_28431 ) ) ( not ( = ?auto_28416 ?auto_28431 ) ) ( IS-CRATE ?auto_28417 ) ( not ( = ?auto_28420 ?auto_28432 ) ) ( not ( = ?auto_28436 ?auto_28420 ) ) ( HOIST-AT ?auto_28433 ?auto_28420 ) ( not ( = ?auto_28439 ?auto_28433 ) ) ( not ( = ?auto_28419 ?auto_28433 ) ) ( AVAILABLE ?auto_28433 ) ( SURFACE-AT ?auto_28417 ?auto_28420 ) ( ON ?auto_28417 ?auto_28434 ) ( CLEAR ?auto_28417 ) ( not ( = ?auto_28417 ?auto_28434 ) ) ( not ( = ?auto_28418 ?auto_28434 ) ) ( not ( = ?auto_28416 ?auto_28434 ) ) ( not ( = ?auto_28431 ?auto_28434 ) ) ( IS-CRATE ?auto_28416 ) ( not ( = ?auto_28422 ?auto_28416 ) ) ( not ( = ?auto_28417 ?auto_28422 ) ) ( not ( = ?auto_28418 ?auto_28422 ) ) ( not ( = ?auto_28431 ?auto_28422 ) ) ( not ( = ?auto_28434 ?auto_28422 ) ) ( not ( = ?auto_28438 ?auto_28432 ) ) ( not ( = ?auto_28436 ?auto_28438 ) ) ( not ( = ?auto_28420 ?auto_28438 ) ) ( HOIST-AT ?auto_28435 ?auto_28438 ) ( not ( = ?auto_28439 ?auto_28435 ) ) ( not ( = ?auto_28419 ?auto_28435 ) ) ( not ( = ?auto_28433 ?auto_28435 ) ) ( AVAILABLE ?auto_28435 ) ( SURFACE-AT ?auto_28416 ?auto_28438 ) ( ON ?auto_28416 ?auto_28424 ) ( CLEAR ?auto_28416 ) ( not ( = ?auto_28417 ?auto_28424 ) ) ( not ( = ?auto_28418 ?auto_28424 ) ) ( not ( = ?auto_28416 ?auto_28424 ) ) ( not ( = ?auto_28431 ?auto_28424 ) ) ( not ( = ?auto_28434 ?auto_28424 ) ) ( not ( = ?auto_28422 ?auto_28424 ) ) ( IS-CRATE ?auto_28422 ) ( not ( = ?auto_28423 ?auto_28422 ) ) ( not ( = ?auto_28417 ?auto_28423 ) ) ( not ( = ?auto_28418 ?auto_28423 ) ) ( not ( = ?auto_28416 ?auto_28423 ) ) ( not ( = ?auto_28431 ?auto_28423 ) ) ( not ( = ?auto_28434 ?auto_28423 ) ) ( not ( = ?auto_28424 ?auto_28423 ) ) ( not ( = ?auto_28437 ?auto_28432 ) ) ( not ( = ?auto_28436 ?auto_28437 ) ) ( not ( = ?auto_28420 ?auto_28437 ) ) ( not ( = ?auto_28438 ?auto_28437 ) ) ( HOIST-AT ?auto_28425 ?auto_28437 ) ( not ( = ?auto_28439 ?auto_28425 ) ) ( not ( = ?auto_28419 ?auto_28425 ) ) ( not ( = ?auto_28433 ?auto_28425 ) ) ( not ( = ?auto_28435 ?auto_28425 ) ) ( AVAILABLE ?auto_28425 ) ( SURFACE-AT ?auto_28422 ?auto_28437 ) ( ON ?auto_28422 ?auto_28429 ) ( CLEAR ?auto_28422 ) ( not ( = ?auto_28417 ?auto_28429 ) ) ( not ( = ?auto_28418 ?auto_28429 ) ) ( not ( = ?auto_28416 ?auto_28429 ) ) ( not ( = ?auto_28431 ?auto_28429 ) ) ( not ( = ?auto_28434 ?auto_28429 ) ) ( not ( = ?auto_28422 ?auto_28429 ) ) ( not ( = ?auto_28424 ?auto_28429 ) ) ( not ( = ?auto_28423 ?auto_28429 ) ) ( SURFACE-AT ?auto_28426 ?auto_28432 ) ( CLEAR ?auto_28426 ) ( IS-CRATE ?auto_28423 ) ( not ( = ?auto_28426 ?auto_28423 ) ) ( not ( = ?auto_28417 ?auto_28426 ) ) ( not ( = ?auto_28418 ?auto_28426 ) ) ( not ( = ?auto_28416 ?auto_28426 ) ) ( not ( = ?auto_28431 ?auto_28426 ) ) ( not ( = ?auto_28434 ?auto_28426 ) ) ( not ( = ?auto_28422 ?auto_28426 ) ) ( not ( = ?auto_28424 ?auto_28426 ) ) ( not ( = ?auto_28429 ?auto_28426 ) ) ( AVAILABLE ?auto_28439 ) ( TRUCK-AT ?auto_28430 ?auto_28421 ) ( not ( = ?auto_28421 ?auto_28432 ) ) ( not ( = ?auto_28436 ?auto_28421 ) ) ( not ( = ?auto_28420 ?auto_28421 ) ) ( not ( = ?auto_28438 ?auto_28421 ) ) ( not ( = ?auto_28437 ?auto_28421 ) ) ( HOIST-AT ?auto_28428 ?auto_28421 ) ( not ( = ?auto_28439 ?auto_28428 ) ) ( not ( = ?auto_28419 ?auto_28428 ) ) ( not ( = ?auto_28433 ?auto_28428 ) ) ( not ( = ?auto_28435 ?auto_28428 ) ) ( not ( = ?auto_28425 ?auto_28428 ) ) ( AVAILABLE ?auto_28428 ) ( SURFACE-AT ?auto_28423 ?auto_28421 ) ( ON ?auto_28423 ?auto_28427 ) ( CLEAR ?auto_28423 ) ( not ( = ?auto_28417 ?auto_28427 ) ) ( not ( = ?auto_28418 ?auto_28427 ) ) ( not ( = ?auto_28416 ?auto_28427 ) ) ( not ( = ?auto_28431 ?auto_28427 ) ) ( not ( = ?auto_28434 ?auto_28427 ) ) ( not ( = ?auto_28422 ?auto_28427 ) ) ( not ( = ?auto_28424 ?auto_28427 ) ) ( not ( = ?auto_28423 ?auto_28427 ) ) ( not ( = ?auto_28429 ?auto_28427 ) ) ( not ( = ?auto_28426 ?auto_28427 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28417 ?auto_28418 )
      ( MAKE-2CRATE-VERIFY ?auto_28416 ?auto_28417 ?auto_28418 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28440 - SURFACE
      ?auto_28441 - SURFACE
      ?auto_28442 - SURFACE
      ?auto_28443 - SURFACE
    )
    :vars
    (
      ?auto_28446 - HOIST
      ?auto_28453 - PLACE
      ?auto_28459 - PLACE
      ?auto_28445 - HOIST
      ?auto_28460 - SURFACE
      ?auto_28451 - PLACE
      ?auto_28450 - HOIST
      ?auto_28444 - SURFACE
      ?auto_28457 - PLACE
      ?auto_28452 - HOIST
      ?auto_28448 - SURFACE
      ?auto_28456 - SURFACE
      ?auto_28458 - PLACE
      ?auto_28462 - HOIST
      ?auto_28449 - SURFACE
      ?auto_28447 - SURFACE
      ?auto_28454 - TRUCK
      ?auto_28455 - PLACE
      ?auto_28463 - HOIST
      ?auto_28461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28446 ?auto_28453 ) ( IS-CRATE ?auto_28443 ) ( not ( = ?auto_28442 ?auto_28443 ) ) ( not ( = ?auto_28441 ?auto_28442 ) ) ( not ( = ?auto_28441 ?auto_28443 ) ) ( not ( = ?auto_28459 ?auto_28453 ) ) ( HOIST-AT ?auto_28445 ?auto_28459 ) ( not ( = ?auto_28446 ?auto_28445 ) ) ( AVAILABLE ?auto_28445 ) ( SURFACE-AT ?auto_28443 ?auto_28459 ) ( ON ?auto_28443 ?auto_28460 ) ( CLEAR ?auto_28443 ) ( not ( = ?auto_28442 ?auto_28460 ) ) ( not ( = ?auto_28443 ?auto_28460 ) ) ( not ( = ?auto_28441 ?auto_28460 ) ) ( IS-CRATE ?auto_28442 ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( not ( = ?auto_28459 ?auto_28451 ) ) ( HOIST-AT ?auto_28450 ?auto_28451 ) ( not ( = ?auto_28446 ?auto_28450 ) ) ( not ( = ?auto_28445 ?auto_28450 ) ) ( AVAILABLE ?auto_28450 ) ( SURFACE-AT ?auto_28442 ?auto_28451 ) ( ON ?auto_28442 ?auto_28444 ) ( CLEAR ?auto_28442 ) ( not ( = ?auto_28442 ?auto_28444 ) ) ( not ( = ?auto_28443 ?auto_28444 ) ) ( not ( = ?auto_28441 ?auto_28444 ) ) ( not ( = ?auto_28460 ?auto_28444 ) ) ( IS-CRATE ?auto_28441 ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( not ( = ?auto_28442 ?auto_28440 ) ) ( not ( = ?auto_28443 ?auto_28440 ) ) ( not ( = ?auto_28460 ?auto_28440 ) ) ( not ( = ?auto_28444 ?auto_28440 ) ) ( not ( = ?auto_28457 ?auto_28453 ) ) ( not ( = ?auto_28459 ?auto_28457 ) ) ( not ( = ?auto_28451 ?auto_28457 ) ) ( HOIST-AT ?auto_28452 ?auto_28457 ) ( not ( = ?auto_28446 ?auto_28452 ) ) ( not ( = ?auto_28445 ?auto_28452 ) ) ( not ( = ?auto_28450 ?auto_28452 ) ) ( AVAILABLE ?auto_28452 ) ( SURFACE-AT ?auto_28441 ?auto_28457 ) ( ON ?auto_28441 ?auto_28448 ) ( CLEAR ?auto_28441 ) ( not ( = ?auto_28442 ?auto_28448 ) ) ( not ( = ?auto_28443 ?auto_28448 ) ) ( not ( = ?auto_28441 ?auto_28448 ) ) ( not ( = ?auto_28460 ?auto_28448 ) ) ( not ( = ?auto_28444 ?auto_28448 ) ) ( not ( = ?auto_28440 ?auto_28448 ) ) ( IS-CRATE ?auto_28440 ) ( not ( = ?auto_28456 ?auto_28440 ) ) ( not ( = ?auto_28442 ?auto_28456 ) ) ( not ( = ?auto_28443 ?auto_28456 ) ) ( not ( = ?auto_28441 ?auto_28456 ) ) ( not ( = ?auto_28460 ?auto_28456 ) ) ( not ( = ?auto_28444 ?auto_28456 ) ) ( not ( = ?auto_28448 ?auto_28456 ) ) ( not ( = ?auto_28458 ?auto_28453 ) ) ( not ( = ?auto_28459 ?auto_28458 ) ) ( not ( = ?auto_28451 ?auto_28458 ) ) ( not ( = ?auto_28457 ?auto_28458 ) ) ( HOIST-AT ?auto_28462 ?auto_28458 ) ( not ( = ?auto_28446 ?auto_28462 ) ) ( not ( = ?auto_28445 ?auto_28462 ) ) ( not ( = ?auto_28450 ?auto_28462 ) ) ( not ( = ?auto_28452 ?auto_28462 ) ) ( AVAILABLE ?auto_28462 ) ( SURFACE-AT ?auto_28440 ?auto_28458 ) ( ON ?auto_28440 ?auto_28449 ) ( CLEAR ?auto_28440 ) ( not ( = ?auto_28442 ?auto_28449 ) ) ( not ( = ?auto_28443 ?auto_28449 ) ) ( not ( = ?auto_28441 ?auto_28449 ) ) ( not ( = ?auto_28460 ?auto_28449 ) ) ( not ( = ?auto_28444 ?auto_28449 ) ) ( not ( = ?auto_28440 ?auto_28449 ) ) ( not ( = ?auto_28448 ?auto_28449 ) ) ( not ( = ?auto_28456 ?auto_28449 ) ) ( SURFACE-AT ?auto_28447 ?auto_28453 ) ( CLEAR ?auto_28447 ) ( IS-CRATE ?auto_28456 ) ( not ( = ?auto_28447 ?auto_28456 ) ) ( not ( = ?auto_28442 ?auto_28447 ) ) ( not ( = ?auto_28443 ?auto_28447 ) ) ( not ( = ?auto_28441 ?auto_28447 ) ) ( not ( = ?auto_28460 ?auto_28447 ) ) ( not ( = ?auto_28444 ?auto_28447 ) ) ( not ( = ?auto_28440 ?auto_28447 ) ) ( not ( = ?auto_28448 ?auto_28447 ) ) ( not ( = ?auto_28449 ?auto_28447 ) ) ( AVAILABLE ?auto_28446 ) ( TRUCK-AT ?auto_28454 ?auto_28455 ) ( not ( = ?auto_28455 ?auto_28453 ) ) ( not ( = ?auto_28459 ?auto_28455 ) ) ( not ( = ?auto_28451 ?auto_28455 ) ) ( not ( = ?auto_28457 ?auto_28455 ) ) ( not ( = ?auto_28458 ?auto_28455 ) ) ( HOIST-AT ?auto_28463 ?auto_28455 ) ( not ( = ?auto_28446 ?auto_28463 ) ) ( not ( = ?auto_28445 ?auto_28463 ) ) ( not ( = ?auto_28450 ?auto_28463 ) ) ( not ( = ?auto_28452 ?auto_28463 ) ) ( not ( = ?auto_28462 ?auto_28463 ) ) ( AVAILABLE ?auto_28463 ) ( SURFACE-AT ?auto_28456 ?auto_28455 ) ( ON ?auto_28456 ?auto_28461 ) ( CLEAR ?auto_28456 ) ( not ( = ?auto_28442 ?auto_28461 ) ) ( not ( = ?auto_28443 ?auto_28461 ) ) ( not ( = ?auto_28441 ?auto_28461 ) ) ( not ( = ?auto_28460 ?auto_28461 ) ) ( not ( = ?auto_28444 ?auto_28461 ) ) ( not ( = ?auto_28440 ?auto_28461 ) ) ( not ( = ?auto_28448 ?auto_28461 ) ) ( not ( = ?auto_28456 ?auto_28461 ) ) ( not ( = ?auto_28449 ?auto_28461 ) ) ( not ( = ?auto_28447 ?auto_28461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28441 ?auto_28442 ?auto_28443 )
      ( MAKE-3CRATE-VERIFY ?auto_28440 ?auto_28441 ?auto_28442 ?auto_28443 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28464 - SURFACE
      ?auto_28465 - SURFACE
      ?auto_28466 - SURFACE
      ?auto_28467 - SURFACE
      ?auto_28468 - SURFACE
    )
    :vars
    (
      ?auto_28471 - HOIST
      ?auto_28478 - PLACE
      ?auto_28483 - PLACE
      ?auto_28470 - HOIST
      ?auto_28484 - SURFACE
      ?auto_28476 - PLACE
      ?auto_28475 - HOIST
      ?auto_28469 - SURFACE
      ?auto_28481 - PLACE
      ?auto_28477 - HOIST
      ?auto_28473 - SURFACE
      ?auto_28482 - PLACE
      ?auto_28486 - HOIST
      ?auto_28474 - SURFACE
      ?auto_28472 - SURFACE
      ?auto_28479 - TRUCK
      ?auto_28480 - PLACE
      ?auto_28487 - HOIST
      ?auto_28485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28471 ?auto_28478 ) ( IS-CRATE ?auto_28468 ) ( not ( = ?auto_28467 ?auto_28468 ) ) ( not ( = ?auto_28466 ?auto_28467 ) ) ( not ( = ?auto_28466 ?auto_28468 ) ) ( not ( = ?auto_28483 ?auto_28478 ) ) ( HOIST-AT ?auto_28470 ?auto_28483 ) ( not ( = ?auto_28471 ?auto_28470 ) ) ( AVAILABLE ?auto_28470 ) ( SURFACE-AT ?auto_28468 ?auto_28483 ) ( ON ?auto_28468 ?auto_28484 ) ( CLEAR ?auto_28468 ) ( not ( = ?auto_28467 ?auto_28484 ) ) ( not ( = ?auto_28468 ?auto_28484 ) ) ( not ( = ?auto_28466 ?auto_28484 ) ) ( IS-CRATE ?auto_28467 ) ( not ( = ?auto_28476 ?auto_28478 ) ) ( not ( = ?auto_28483 ?auto_28476 ) ) ( HOIST-AT ?auto_28475 ?auto_28476 ) ( not ( = ?auto_28471 ?auto_28475 ) ) ( not ( = ?auto_28470 ?auto_28475 ) ) ( AVAILABLE ?auto_28475 ) ( SURFACE-AT ?auto_28467 ?auto_28476 ) ( ON ?auto_28467 ?auto_28469 ) ( CLEAR ?auto_28467 ) ( not ( = ?auto_28467 ?auto_28469 ) ) ( not ( = ?auto_28468 ?auto_28469 ) ) ( not ( = ?auto_28466 ?auto_28469 ) ) ( not ( = ?auto_28484 ?auto_28469 ) ) ( IS-CRATE ?auto_28466 ) ( not ( = ?auto_28465 ?auto_28466 ) ) ( not ( = ?auto_28467 ?auto_28465 ) ) ( not ( = ?auto_28468 ?auto_28465 ) ) ( not ( = ?auto_28484 ?auto_28465 ) ) ( not ( = ?auto_28469 ?auto_28465 ) ) ( not ( = ?auto_28481 ?auto_28478 ) ) ( not ( = ?auto_28483 ?auto_28481 ) ) ( not ( = ?auto_28476 ?auto_28481 ) ) ( HOIST-AT ?auto_28477 ?auto_28481 ) ( not ( = ?auto_28471 ?auto_28477 ) ) ( not ( = ?auto_28470 ?auto_28477 ) ) ( not ( = ?auto_28475 ?auto_28477 ) ) ( AVAILABLE ?auto_28477 ) ( SURFACE-AT ?auto_28466 ?auto_28481 ) ( ON ?auto_28466 ?auto_28473 ) ( CLEAR ?auto_28466 ) ( not ( = ?auto_28467 ?auto_28473 ) ) ( not ( = ?auto_28468 ?auto_28473 ) ) ( not ( = ?auto_28466 ?auto_28473 ) ) ( not ( = ?auto_28484 ?auto_28473 ) ) ( not ( = ?auto_28469 ?auto_28473 ) ) ( not ( = ?auto_28465 ?auto_28473 ) ) ( IS-CRATE ?auto_28465 ) ( not ( = ?auto_28464 ?auto_28465 ) ) ( not ( = ?auto_28467 ?auto_28464 ) ) ( not ( = ?auto_28468 ?auto_28464 ) ) ( not ( = ?auto_28466 ?auto_28464 ) ) ( not ( = ?auto_28484 ?auto_28464 ) ) ( not ( = ?auto_28469 ?auto_28464 ) ) ( not ( = ?auto_28473 ?auto_28464 ) ) ( not ( = ?auto_28482 ?auto_28478 ) ) ( not ( = ?auto_28483 ?auto_28482 ) ) ( not ( = ?auto_28476 ?auto_28482 ) ) ( not ( = ?auto_28481 ?auto_28482 ) ) ( HOIST-AT ?auto_28486 ?auto_28482 ) ( not ( = ?auto_28471 ?auto_28486 ) ) ( not ( = ?auto_28470 ?auto_28486 ) ) ( not ( = ?auto_28475 ?auto_28486 ) ) ( not ( = ?auto_28477 ?auto_28486 ) ) ( AVAILABLE ?auto_28486 ) ( SURFACE-AT ?auto_28465 ?auto_28482 ) ( ON ?auto_28465 ?auto_28474 ) ( CLEAR ?auto_28465 ) ( not ( = ?auto_28467 ?auto_28474 ) ) ( not ( = ?auto_28468 ?auto_28474 ) ) ( not ( = ?auto_28466 ?auto_28474 ) ) ( not ( = ?auto_28484 ?auto_28474 ) ) ( not ( = ?auto_28469 ?auto_28474 ) ) ( not ( = ?auto_28465 ?auto_28474 ) ) ( not ( = ?auto_28473 ?auto_28474 ) ) ( not ( = ?auto_28464 ?auto_28474 ) ) ( SURFACE-AT ?auto_28472 ?auto_28478 ) ( CLEAR ?auto_28472 ) ( IS-CRATE ?auto_28464 ) ( not ( = ?auto_28472 ?auto_28464 ) ) ( not ( = ?auto_28467 ?auto_28472 ) ) ( not ( = ?auto_28468 ?auto_28472 ) ) ( not ( = ?auto_28466 ?auto_28472 ) ) ( not ( = ?auto_28484 ?auto_28472 ) ) ( not ( = ?auto_28469 ?auto_28472 ) ) ( not ( = ?auto_28465 ?auto_28472 ) ) ( not ( = ?auto_28473 ?auto_28472 ) ) ( not ( = ?auto_28474 ?auto_28472 ) ) ( AVAILABLE ?auto_28471 ) ( TRUCK-AT ?auto_28479 ?auto_28480 ) ( not ( = ?auto_28480 ?auto_28478 ) ) ( not ( = ?auto_28483 ?auto_28480 ) ) ( not ( = ?auto_28476 ?auto_28480 ) ) ( not ( = ?auto_28481 ?auto_28480 ) ) ( not ( = ?auto_28482 ?auto_28480 ) ) ( HOIST-AT ?auto_28487 ?auto_28480 ) ( not ( = ?auto_28471 ?auto_28487 ) ) ( not ( = ?auto_28470 ?auto_28487 ) ) ( not ( = ?auto_28475 ?auto_28487 ) ) ( not ( = ?auto_28477 ?auto_28487 ) ) ( not ( = ?auto_28486 ?auto_28487 ) ) ( AVAILABLE ?auto_28487 ) ( SURFACE-AT ?auto_28464 ?auto_28480 ) ( ON ?auto_28464 ?auto_28485 ) ( CLEAR ?auto_28464 ) ( not ( = ?auto_28467 ?auto_28485 ) ) ( not ( = ?auto_28468 ?auto_28485 ) ) ( not ( = ?auto_28466 ?auto_28485 ) ) ( not ( = ?auto_28484 ?auto_28485 ) ) ( not ( = ?auto_28469 ?auto_28485 ) ) ( not ( = ?auto_28465 ?auto_28485 ) ) ( not ( = ?auto_28473 ?auto_28485 ) ) ( not ( = ?auto_28464 ?auto_28485 ) ) ( not ( = ?auto_28474 ?auto_28485 ) ) ( not ( = ?auto_28472 ?auto_28485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28466 ?auto_28467 ?auto_28468 )
      ( MAKE-4CRATE-VERIFY ?auto_28464 ?auto_28465 ?auto_28466 ?auto_28467 ?auto_28468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28488 - SURFACE
      ?auto_28489 - SURFACE
      ?auto_28490 - SURFACE
      ?auto_28491 - SURFACE
      ?auto_28492 - SURFACE
      ?auto_28493 - SURFACE
    )
    :vars
    (
      ?auto_28496 - HOIST
      ?auto_28502 - PLACE
      ?auto_28507 - PLACE
      ?auto_28495 - HOIST
      ?auto_28508 - SURFACE
      ?auto_28500 - PLACE
      ?auto_28499 - HOIST
      ?auto_28494 - SURFACE
      ?auto_28505 - PLACE
      ?auto_28501 - HOIST
      ?auto_28497 - SURFACE
      ?auto_28506 - PLACE
      ?auto_28510 - HOIST
      ?auto_28498 - SURFACE
      ?auto_28503 - TRUCK
      ?auto_28504 - PLACE
      ?auto_28511 - HOIST
      ?auto_28509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28496 ?auto_28502 ) ( IS-CRATE ?auto_28493 ) ( not ( = ?auto_28492 ?auto_28493 ) ) ( not ( = ?auto_28491 ?auto_28492 ) ) ( not ( = ?auto_28491 ?auto_28493 ) ) ( not ( = ?auto_28507 ?auto_28502 ) ) ( HOIST-AT ?auto_28495 ?auto_28507 ) ( not ( = ?auto_28496 ?auto_28495 ) ) ( AVAILABLE ?auto_28495 ) ( SURFACE-AT ?auto_28493 ?auto_28507 ) ( ON ?auto_28493 ?auto_28508 ) ( CLEAR ?auto_28493 ) ( not ( = ?auto_28492 ?auto_28508 ) ) ( not ( = ?auto_28493 ?auto_28508 ) ) ( not ( = ?auto_28491 ?auto_28508 ) ) ( IS-CRATE ?auto_28492 ) ( not ( = ?auto_28500 ?auto_28502 ) ) ( not ( = ?auto_28507 ?auto_28500 ) ) ( HOIST-AT ?auto_28499 ?auto_28500 ) ( not ( = ?auto_28496 ?auto_28499 ) ) ( not ( = ?auto_28495 ?auto_28499 ) ) ( AVAILABLE ?auto_28499 ) ( SURFACE-AT ?auto_28492 ?auto_28500 ) ( ON ?auto_28492 ?auto_28494 ) ( CLEAR ?auto_28492 ) ( not ( = ?auto_28492 ?auto_28494 ) ) ( not ( = ?auto_28493 ?auto_28494 ) ) ( not ( = ?auto_28491 ?auto_28494 ) ) ( not ( = ?auto_28508 ?auto_28494 ) ) ( IS-CRATE ?auto_28491 ) ( not ( = ?auto_28490 ?auto_28491 ) ) ( not ( = ?auto_28492 ?auto_28490 ) ) ( not ( = ?auto_28493 ?auto_28490 ) ) ( not ( = ?auto_28508 ?auto_28490 ) ) ( not ( = ?auto_28494 ?auto_28490 ) ) ( not ( = ?auto_28505 ?auto_28502 ) ) ( not ( = ?auto_28507 ?auto_28505 ) ) ( not ( = ?auto_28500 ?auto_28505 ) ) ( HOIST-AT ?auto_28501 ?auto_28505 ) ( not ( = ?auto_28496 ?auto_28501 ) ) ( not ( = ?auto_28495 ?auto_28501 ) ) ( not ( = ?auto_28499 ?auto_28501 ) ) ( AVAILABLE ?auto_28501 ) ( SURFACE-AT ?auto_28491 ?auto_28505 ) ( ON ?auto_28491 ?auto_28497 ) ( CLEAR ?auto_28491 ) ( not ( = ?auto_28492 ?auto_28497 ) ) ( not ( = ?auto_28493 ?auto_28497 ) ) ( not ( = ?auto_28491 ?auto_28497 ) ) ( not ( = ?auto_28508 ?auto_28497 ) ) ( not ( = ?auto_28494 ?auto_28497 ) ) ( not ( = ?auto_28490 ?auto_28497 ) ) ( IS-CRATE ?auto_28490 ) ( not ( = ?auto_28489 ?auto_28490 ) ) ( not ( = ?auto_28492 ?auto_28489 ) ) ( not ( = ?auto_28493 ?auto_28489 ) ) ( not ( = ?auto_28491 ?auto_28489 ) ) ( not ( = ?auto_28508 ?auto_28489 ) ) ( not ( = ?auto_28494 ?auto_28489 ) ) ( not ( = ?auto_28497 ?auto_28489 ) ) ( not ( = ?auto_28506 ?auto_28502 ) ) ( not ( = ?auto_28507 ?auto_28506 ) ) ( not ( = ?auto_28500 ?auto_28506 ) ) ( not ( = ?auto_28505 ?auto_28506 ) ) ( HOIST-AT ?auto_28510 ?auto_28506 ) ( not ( = ?auto_28496 ?auto_28510 ) ) ( not ( = ?auto_28495 ?auto_28510 ) ) ( not ( = ?auto_28499 ?auto_28510 ) ) ( not ( = ?auto_28501 ?auto_28510 ) ) ( AVAILABLE ?auto_28510 ) ( SURFACE-AT ?auto_28490 ?auto_28506 ) ( ON ?auto_28490 ?auto_28498 ) ( CLEAR ?auto_28490 ) ( not ( = ?auto_28492 ?auto_28498 ) ) ( not ( = ?auto_28493 ?auto_28498 ) ) ( not ( = ?auto_28491 ?auto_28498 ) ) ( not ( = ?auto_28508 ?auto_28498 ) ) ( not ( = ?auto_28494 ?auto_28498 ) ) ( not ( = ?auto_28490 ?auto_28498 ) ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( not ( = ?auto_28489 ?auto_28498 ) ) ( SURFACE-AT ?auto_28488 ?auto_28502 ) ( CLEAR ?auto_28488 ) ( IS-CRATE ?auto_28489 ) ( not ( = ?auto_28488 ?auto_28489 ) ) ( not ( = ?auto_28492 ?auto_28488 ) ) ( not ( = ?auto_28493 ?auto_28488 ) ) ( not ( = ?auto_28491 ?auto_28488 ) ) ( not ( = ?auto_28508 ?auto_28488 ) ) ( not ( = ?auto_28494 ?auto_28488 ) ) ( not ( = ?auto_28490 ?auto_28488 ) ) ( not ( = ?auto_28497 ?auto_28488 ) ) ( not ( = ?auto_28498 ?auto_28488 ) ) ( AVAILABLE ?auto_28496 ) ( TRUCK-AT ?auto_28503 ?auto_28504 ) ( not ( = ?auto_28504 ?auto_28502 ) ) ( not ( = ?auto_28507 ?auto_28504 ) ) ( not ( = ?auto_28500 ?auto_28504 ) ) ( not ( = ?auto_28505 ?auto_28504 ) ) ( not ( = ?auto_28506 ?auto_28504 ) ) ( HOIST-AT ?auto_28511 ?auto_28504 ) ( not ( = ?auto_28496 ?auto_28511 ) ) ( not ( = ?auto_28495 ?auto_28511 ) ) ( not ( = ?auto_28499 ?auto_28511 ) ) ( not ( = ?auto_28501 ?auto_28511 ) ) ( not ( = ?auto_28510 ?auto_28511 ) ) ( AVAILABLE ?auto_28511 ) ( SURFACE-AT ?auto_28489 ?auto_28504 ) ( ON ?auto_28489 ?auto_28509 ) ( CLEAR ?auto_28489 ) ( not ( = ?auto_28492 ?auto_28509 ) ) ( not ( = ?auto_28493 ?auto_28509 ) ) ( not ( = ?auto_28491 ?auto_28509 ) ) ( not ( = ?auto_28508 ?auto_28509 ) ) ( not ( = ?auto_28494 ?auto_28509 ) ) ( not ( = ?auto_28490 ?auto_28509 ) ) ( not ( = ?auto_28497 ?auto_28509 ) ) ( not ( = ?auto_28489 ?auto_28509 ) ) ( not ( = ?auto_28498 ?auto_28509 ) ) ( not ( = ?auto_28488 ?auto_28509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28491 ?auto_28492 ?auto_28493 )
      ( MAKE-5CRATE-VERIFY ?auto_28488 ?auto_28489 ?auto_28490 ?auto_28491 ?auto_28492 ?auto_28493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28512 - SURFACE
      ?auto_28513 - SURFACE
    )
    :vars
    (
      ?auto_28516 - HOIST
      ?auto_28523 - PLACE
      ?auto_28525 - SURFACE
      ?auto_28530 - PLACE
      ?auto_28515 - HOIST
      ?auto_28531 - SURFACE
      ?auto_28521 - PLACE
      ?auto_28520 - HOIST
      ?auto_28514 - SURFACE
      ?auto_28535 - SURFACE
      ?auto_28528 - PLACE
      ?auto_28522 - HOIST
      ?auto_28518 - SURFACE
      ?auto_28527 - SURFACE
      ?auto_28529 - PLACE
      ?auto_28533 - HOIST
      ?auto_28519 - SURFACE
      ?auto_28517 - SURFACE
      ?auto_28526 - PLACE
      ?auto_28534 - HOIST
      ?auto_28532 - SURFACE
      ?auto_28524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28516 ?auto_28523 ) ( IS-CRATE ?auto_28513 ) ( not ( = ?auto_28512 ?auto_28513 ) ) ( not ( = ?auto_28525 ?auto_28512 ) ) ( not ( = ?auto_28525 ?auto_28513 ) ) ( not ( = ?auto_28530 ?auto_28523 ) ) ( HOIST-AT ?auto_28515 ?auto_28530 ) ( not ( = ?auto_28516 ?auto_28515 ) ) ( AVAILABLE ?auto_28515 ) ( SURFACE-AT ?auto_28513 ?auto_28530 ) ( ON ?auto_28513 ?auto_28531 ) ( CLEAR ?auto_28513 ) ( not ( = ?auto_28512 ?auto_28531 ) ) ( not ( = ?auto_28513 ?auto_28531 ) ) ( not ( = ?auto_28525 ?auto_28531 ) ) ( IS-CRATE ?auto_28512 ) ( not ( = ?auto_28521 ?auto_28523 ) ) ( not ( = ?auto_28530 ?auto_28521 ) ) ( HOIST-AT ?auto_28520 ?auto_28521 ) ( not ( = ?auto_28516 ?auto_28520 ) ) ( not ( = ?auto_28515 ?auto_28520 ) ) ( AVAILABLE ?auto_28520 ) ( SURFACE-AT ?auto_28512 ?auto_28521 ) ( ON ?auto_28512 ?auto_28514 ) ( CLEAR ?auto_28512 ) ( not ( = ?auto_28512 ?auto_28514 ) ) ( not ( = ?auto_28513 ?auto_28514 ) ) ( not ( = ?auto_28525 ?auto_28514 ) ) ( not ( = ?auto_28531 ?auto_28514 ) ) ( IS-CRATE ?auto_28525 ) ( not ( = ?auto_28535 ?auto_28525 ) ) ( not ( = ?auto_28512 ?auto_28535 ) ) ( not ( = ?auto_28513 ?auto_28535 ) ) ( not ( = ?auto_28531 ?auto_28535 ) ) ( not ( = ?auto_28514 ?auto_28535 ) ) ( not ( = ?auto_28528 ?auto_28523 ) ) ( not ( = ?auto_28530 ?auto_28528 ) ) ( not ( = ?auto_28521 ?auto_28528 ) ) ( HOIST-AT ?auto_28522 ?auto_28528 ) ( not ( = ?auto_28516 ?auto_28522 ) ) ( not ( = ?auto_28515 ?auto_28522 ) ) ( not ( = ?auto_28520 ?auto_28522 ) ) ( AVAILABLE ?auto_28522 ) ( SURFACE-AT ?auto_28525 ?auto_28528 ) ( ON ?auto_28525 ?auto_28518 ) ( CLEAR ?auto_28525 ) ( not ( = ?auto_28512 ?auto_28518 ) ) ( not ( = ?auto_28513 ?auto_28518 ) ) ( not ( = ?auto_28525 ?auto_28518 ) ) ( not ( = ?auto_28531 ?auto_28518 ) ) ( not ( = ?auto_28514 ?auto_28518 ) ) ( not ( = ?auto_28535 ?auto_28518 ) ) ( IS-CRATE ?auto_28535 ) ( not ( = ?auto_28527 ?auto_28535 ) ) ( not ( = ?auto_28512 ?auto_28527 ) ) ( not ( = ?auto_28513 ?auto_28527 ) ) ( not ( = ?auto_28525 ?auto_28527 ) ) ( not ( = ?auto_28531 ?auto_28527 ) ) ( not ( = ?auto_28514 ?auto_28527 ) ) ( not ( = ?auto_28518 ?auto_28527 ) ) ( not ( = ?auto_28529 ?auto_28523 ) ) ( not ( = ?auto_28530 ?auto_28529 ) ) ( not ( = ?auto_28521 ?auto_28529 ) ) ( not ( = ?auto_28528 ?auto_28529 ) ) ( HOIST-AT ?auto_28533 ?auto_28529 ) ( not ( = ?auto_28516 ?auto_28533 ) ) ( not ( = ?auto_28515 ?auto_28533 ) ) ( not ( = ?auto_28520 ?auto_28533 ) ) ( not ( = ?auto_28522 ?auto_28533 ) ) ( AVAILABLE ?auto_28533 ) ( SURFACE-AT ?auto_28535 ?auto_28529 ) ( ON ?auto_28535 ?auto_28519 ) ( CLEAR ?auto_28535 ) ( not ( = ?auto_28512 ?auto_28519 ) ) ( not ( = ?auto_28513 ?auto_28519 ) ) ( not ( = ?auto_28525 ?auto_28519 ) ) ( not ( = ?auto_28531 ?auto_28519 ) ) ( not ( = ?auto_28514 ?auto_28519 ) ) ( not ( = ?auto_28535 ?auto_28519 ) ) ( not ( = ?auto_28518 ?auto_28519 ) ) ( not ( = ?auto_28527 ?auto_28519 ) ) ( SURFACE-AT ?auto_28517 ?auto_28523 ) ( CLEAR ?auto_28517 ) ( IS-CRATE ?auto_28527 ) ( not ( = ?auto_28517 ?auto_28527 ) ) ( not ( = ?auto_28512 ?auto_28517 ) ) ( not ( = ?auto_28513 ?auto_28517 ) ) ( not ( = ?auto_28525 ?auto_28517 ) ) ( not ( = ?auto_28531 ?auto_28517 ) ) ( not ( = ?auto_28514 ?auto_28517 ) ) ( not ( = ?auto_28535 ?auto_28517 ) ) ( not ( = ?auto_28518 ?auto_28517 ) ) ( not ( = ?auto_28519 ?auto_28517 ) ) ( AVAILABLE ?auto_28516 ) ( not ( = ?auto_28526 ?auto_28523 ) ) ( not ( = ?auto_28530 ?auto_28526 ) ) ( not ( = ?auto_28521 ?auto_28526 ) ) ( not ( = ?auto_28528 ?auto_28526 ) ) ( not ( = ?auto_28529 ?auto_28526 ) ) ( HOIST-AT ?auto_28534 ?auto_28526 ) ( not ( = ?auto_28516 ?auto_28534 ) ) ( not ( = ?auto_28515 ?auto_28534 ) ) ( not ( = ?auto_28520 ?auto_28534 ) ) ( not ( = ?auto_28522 ?auto_28534 ) ) ( not ( = ?auto_28533 ?auto_28534 ) ) ( AVAILABLE ?auto_28534 ) ( SURFACE-AT ?auto_28527 ?auto_28526 ) ( ON ?auto_28527 ?auto_28532 ) ( CLEAR ?auto_28527 ) ( not ( = ?auto_28512 ?auto_28532 ) ) ( not ( = ?auto_28513 ?auto_28532 ) ) ( not ( = ?auto_28525 ?auto_28532 ) ) ( not ( = ?auto_28531 ?auto_28532 ) ) ( not ( = ?auto_28514 ?auto_28532 ) ) ( not ( = ?auto_28535 ?auto_28532 ) ) ( not ( = ?auto_28518 ?auto_28532 ) ) ( not ( = ?auto_28527 ?auto_28532 ) ) ( not ( = ?auto_28519 ?auto_28532 ) ) ( not ( = ?auto_28517 ?auto_28532 ) ) ( TRUCK-AT ?auto_28524 ?auto_28523 ) )
    :subtasks
    ( ( !DRIVE ?auto_28524 ?auto_28523 ?auto_28526 )
      ( MAKE-2CRATE ?auto_28525 ?auto_28512 ?auto_28513 )
      ( MAKE-1CRATE-VERIFY ?auto_28512 ?auto_28513 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28536 - SURFACE
      ?auto_28537 - SURFACE
      ?auto_28538 - SURFACE
    )
    :vars
    (
      ?auto_28549 - HOIST
      ?auto_28543 - PLACE
      ?auto_28558 - PLACE
      ?auto_28556 - HOIST
      ?auto_28550 - SURFACE
      ?auto_28540 - PLACE
      ?auto_28553 - HOIST
      ?auto_28557 - SURFACE
      ?auto_28552 - SURFACE
      ?auto_28559 - PLACE
      ?auto_28554 - HOIST
      ?auto_28545 - SURFACE
      ?auto_28546 - SURFACE
      ?auto_28547 - PLACE
      ?auto_28541 - HOIST
      ?auto_28539 - SURFACE
      ?auto_28551 - SURFACE
      ?auto_28555 - PLACE
      ?auto_28548 - HOIST
      ?auto_28544 - SURFACE
      ?auto_28542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28549 ?auto_28543 ) ( IS-CRATE ?auto_28538 ) ( not ( = ?auto_28537 ?auto_28538 ) ) ( not ( = ?auto_28536 ?auto_28537 ) ) ( not ( = ?auto_28536 ?auto_28538 ) ) ( not ( = ?auto_28558 ?auto_28543 ) ) ( HOIST-AT ?auto_28556 ?auto_28558 ) ( not ( = ?auto_28549 ?auto_28556 ) ) ( AVAILABLE ?auto_28556 ) ( SURFACE-AT ?auto_28538 ?auto_28558 ) ( ON ?auto_28538 ?auto_28550 ) ( CLEAR ?auto_28538 ) ( not ( = ?auto_28537 ?auto_28550 ) ) ( not ( = ?auto_28538 ?auto_28550 ) ) ( not ( = ?auto_28536 ?auto_28550 ) ) ( IS-CRATE ?auto_28537 ) ( not ( = ?auto_28540 ?auto_28543 ) ) ( not ( = ?auto_28558 ?auto_28540 ) ) ( HOIST-AT ?auto_28553 ?auto_28540 ) ( not ( = ?auto_28549 ?auto_28553 ) ) ( not ( = ?auto_28556 ?auto_28553 ) ) ( AVAILABLE ?auto_28553 ) ( SURFACE-AT ?auto_28537 ?auto_28540 ) ( ON ?auto_28537 ?auto_28557 ) ( CLEAR ?auto_28537 ) ( not ( = ?auto_28537 ?auto_28557 ) ) ( not ( = ?auto_28538 ?auto_28557 ) ) ( not ( = ?auto_28536 ?auto_28557 ) ) ( not ( = ?auto_28550 ?auto_28557 ) ) ( IS-CRATE ?auto_28536 ) ( not ( = ?auto_28552 ?auto_28536 ) ) ( not ( = ?auto_28537 ?auto_28552 ) ) ( not ( = ?auto_28538 ?auto_28552 ) ) ( not ( = ?auto_28550 ?auto_28552 ) ) ( not ( = ?auto_28557 ?auto_28552 ) ) ( not ( = ?auto_28559 ?auto_28543 ) ) ( not ( = ?auto_28558 ?auto_28559 ) ) ( not ( = ?auto_28540 ?auto_28559 ) ) ( HOIST-AT ?auto_28554 ?auto_28559 ) ( not ( = ?auto_28549 ?auto_28554 ) ) ( not ( = ?auto_28556 ?auto_28554 ) ) ( not ( = ?auto_28553 ?auto_28554 ) ) ( AVAILABLE ?auto_28554 ) ( SURFACE-AT ?auto_28536 ?auto_28559 ) ( ON ?auto_28536 ?auto_28545 ) ( CLEAR ?auto_28536 ) ( not ( = ?auto_28537 ?auto_28545 ) ) ( not ( = ?auto_28538 ?auto_28545 ) ) ( not ( = ?auto_28536 ?auto_28545 ) ) ( not ( = ?auto_28550 ?auto_28545 ) ) ( not ( = ?auto_28557 ?auto_28545 ) ) ( not ( = ?auto_28552 ?auto_28545 ) ) ( IS-CRATE ?auto_28552 ) ( not ( = ?auto_28546 ?auto_28552 ) ) ( not ( = ?auto_28537 ?auto_28546 ) ) ( not ( = ?auto_28538 ?auto_28546 ) ) ( not ( = ?auto_28536 ?auto_28546 ) ) ( not ( = ?auto_28550 ?auto_28546 ) ) ( not ( = ?auto_28557 ?auto_28546 ) ) ( not ( = ?auto_28545 ?auto_28546 ) ) ( not ( = ?auto_28547 ?auto_28543 ) ) ( not ( = ?auto_28558 ?auto_28547 ) ) ( not ( = ?auto_28540 ?auto_28547 ) ) ( not ( = ?auto_28559 ?auto_28547 ) ) ( HOIST-AT ?auto_28541 ?auto_28547 ) ( not ( = ?auto_28549 ?auto_28541 ) ) ( not ( = ?auto_28556 ?auto_28541 ) ) ( not ( = ?auto_28553 ?auto_28541 ) ) ( not ( = ?auto_28554 ?auto_28541 ) ) ( AVAILABLE ?auto_28541 ) ( SURFACE-AT ?auto_28552 ?auto_28547 ) ( ON ?auto_28552 ?auto_28539 ) ( CLEAR ?auto_28552 ) ( not ( = ?auto_28537 ?auto_28539 ) ) ( not ( = ?auto_28538 ?auto_28539 ) ) ( not ( = ?auto_28536 ?auto_28539 ) ) ( not ( = ?auto_28550 ?auto_28539 ) ) ( not ( = ?auto_28557 ?auto_28539 ) ) ( not ( = ?auto_28552 ?auto_28539 ) ) ( not ( = ?auto_28545 ?auto_28539 ) ) ( not ( = ?auto_28546 ?auto_28539 ) ) ( SURFACE-AT ?auto_28551 ?auto_28543 ) ( CLEAR ?auto_28551 ) ( IS-CRATE ?auto_28546 ) ( not ( = ?auto_28551 ?auto_28546 ) ) ( not ( = ?auto_28537 ?auto_28551 ) ) ( not ( = ?auto_28538 ?auto_28551 ) ) ( not ( = ?auto_28536 ?auto_28551 ) ) ( not ( = ?auto_28550 ?auto_28551 ) ) ( not ( = ?auto_28557 ?auto_28551 ) ) ( not ( = ?auto_28552 ?auto_28551 ) ) ( not ( = ?auto_28545 ?auto_28551 ) ) ( not ( = ?auto_28539 ?auto_28551 ) ) ( AVAILABLE ?auto_28549 ) ( not ( = ?auto_28555 ?auto_28543 ) ) ( not ( = ?auto_28558 ?auto_28555 ) ) ( not ( = ?auto_28540 ?auto_28555 ) ) ( not ( = ?auto_28559 ?auto_28555 ) ) ( not ( = ?auto_28547 ?auto_28555 ) ) ( HOIST-AT ?auto_28548 ?auto_28555 ) ( not ( = ?auto_28549 ?auto_28548 ) ) ( not ( = ?auto_28556 ?auto_28548 ) ) ( not ( = ?auto_28553 ?auto_28548 ) ) ( not ( = ?auto_28554 ?auto_28548 ) ) ( not ( = ?auto_28541 ?auto_28548 ) ) ( AVAILABLE ?auto_28548 ) ( SURFACE-AT ?auto_28546 ?auto_28555 ) ( ON ?auto_28546 ?auto_28544 ) ( CLEAR ?auto_28546 ) ( not ( = ?auto_28537 ?auto_28544 ) ) ( not ( = ?auto_28538 ?auto_28544 ) ) ( not ( = ?auto_28536 ?auto_28544 ) ) ( not ( = ?auto_28550 ?auto_28544 ) ) ( not ( = ?auto_28557 ?auto_28544 ) ) ( not ( = ?auto_28552 ?auto_28544 ) ) ( not ( = ?auto_28545 ?auto_28544 ) ) ( not ( = ?auto_28546 ?auto_28544 ) ) ( not ( = ?auto_28539 ?auto_28544 ) ) ( not ( = ?auto_28551 ?auto_28544 ) ) ( TRUCK-AT ?auto_28542 ?auto_28543 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28537 ?auto_28538 )
      ( MAKE-2CRATE-VERIFY ?auto_28536 ?auto_28537 ?auto_28538 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28560 - SURFACE
      ?auto_28561 - SURFACE
      ?auto_28562 - SURFACE
      ?auto_28563 - SURFACE
    )
    :vars
    (
      ?auto_28566 - HOIST
      ?auto_28567 - PLACE
      ?auto_28574 - PLACE
      ?auto_28570 - HOIST
      ?auto_28573 - SURFACE
      ?auto_28576 - PLACE
      ?auto_28565 - HOIST
      ?auto_28577 - SURFACE
      ?auto_28579 - PLACE
      ?auto_28580 - HOIST
      ?auto_28569 - SURFACE
      ?auto_28572 - SURFACE
      ?auto_28578 - PLACE
      ?auto_28581 - HOIST
      ?auto_28575 - SURFACE
      ?auto_28571 - SURFACE
      ?auto_28582 - PLACE
      ?auto_28568 - HOIST
      ?auto_28564 - SURFACE
      ?auto_28583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28566 ?auto_28567 ) ( IS-CRATE ?auto_28563 ) ( not ( = ?auto_28562 ?auto_28563 ) ) ( not ( = ?auto_28561 ?auto_28562 ) ) ( not ( = ?auto_28561 ?auto_28563 ) ) ( not ( = ?auto_28574 ?auto_28567 ) ) ( HOIST-AT ?auto_28570 ?auto_28574 ) ( not ( = ?auto_28566 ?auto_28570 ) ) ( AVAILABLE ?auto_28570 ) ( SURFACE-AT ?auto_28563 ?auto_28574 ) ( ON ?auto_28563 ?auto_28573 ) ( CLEAR ?auto_28563 ) ( not ( = ?auto_28562 ?auto_28573 ) ) ( not ( = ?auto_28563 ?auto_28573 ) ) ( not ( = ?auto_28561 ?auto_28573 ) ) ( IS-CRATE ?auto_28562 ) ( not ( = ?auto_28576 ?auto_28567 ) ) ( not ( = ?auto_28574 ?auto_28576 ) ) ( HOIST-AT ?auto_28565 ?auto_28576 ) ( not ( = ?auto_28566 ?auto_28565 ) ) ( not ( = ?auto_28570 ?auto_28565 ) ) ( AVAILABLE ?auto_28565 ) ( SURFACE-AT ?auto_28562 ?auto_28576 ) ( ON ?auto_28562 ?auto_28577 ) ( CLEAR ?auto_28562 ) ( not ( = ?auto_28562 ?auto_28577 ) ) ( not ( = ?auto_28563 ?auto_28577 ) ) ( not ( = ?auto_28561 ?auto_28577 ) ) ( not ( = ?auto_28573 ?auto_28577 ) ) ( IS-CRATE ?auto_28561 ) ( not ( = ?auto_28560 ?auto_28561 ) ) ( not ( = ?auto_28562 ?auto_28560 ) ) ( not ( = ?auto_28563 ?auto_28560 ) ) ( not ( = ?auto_28573 ?auto_28560 ) ) ( not ( = ?auto_28577 ?auto_28560 ) ) ( not ( = ?auto_28579 ?auto_28567 ) ) ( not ( = ?auto_28574 ?auto_28579 ) ) ( not ( = ?auto_28576 ?auto_28579 ) ) ( HOIST-AT ?auto_28580 ?auto_28579 ) ( not ( = ?auto_28566 ?auto_28580 ) ) ( not ( = ?auto_28570 ?auto_28580 ) ) ( not ( = ?auto_28565 ?auto_28580 ) ) ( AVAILABLE ?auto_28580 ) ( SURFACE-AT ?auto_28561 ?auto_28579 ) ( ON ?auto_28561 ?auto_28569 ) ( CLEAR ?auto_28561 ) ( not ( = ?auto_28562 ?auto_28569 ) ) ( not ( = ?auto_28563 ?auto_28569 ) ) ( not ( = ?auto_28561 ?auto_28569 ) ) ( not ( = ?auto_28573 ?auto_28569 ) ) ( not ( = ?auto_28577 ?auto_28569 ) ) ( not ( = ?auto_28560 ?auto_28569 ) ) ( IS-CRATE ?auto_28560 ) ( not ( = ?auto_28572 ?auto_28560 ) ) ( not ( = ?auto_28562 ?auto_28572 ) ) ( not ( = ?auto_28563 ?auto_28572 ) ) ( not ( = ?auto_28561 ?auto_28572 ) ) ( not ( = ?auto_28573 ?auto_28572 ) ) ( not ( = ?auto_28577 ?auto_28572 ) ) ( not ( = ?auto_28569 ?auto_28572 ) ) ( not ( = ?auto_28578 ?auto_28567 ) ) ( not ( = ?auto_28574 ?auto_28578 ) ) ( not ( = ?auto_28576 ?auto_28578 ) ) ( not ( = ?auto_28579 ?auto_28578 ) ) ( HOIST-AT ?auto_28581 ?auto_28578 ) ( not ( = ?auto_28566 ?auto_28581 ) ) ( not ( = ?auto_28570 ?auto_28581 ) ) ( not ( = ?auto_28565 ?auto_28581 ) ) ( not ( = ?auto_28580 ?auto_28581 ) ) ( AVAILABLE ?auto_28581 ) ( SURFACE-AT ?auto_28560 ?auto_28578 ) ( ON ?auto_28560 ?auto_28575 ) ( CLEAR ?auto_28560 ) ( not ( = ?auto_28562 ?auto_28575 ) ) ( not ( = ?auto_28563 ?auto_28575 ) ) ( not ( = ?auto_28561 ?auto_28575 ) ) ( not ( = ?auto_28573 ?auto_28575 ) ) ( not ( = ?auto_28577 ?auto_28575 ) ) ( not ( = ?auto_28560 ?auto_28575 ) ) ( not ( = ?auto_28569 ?auto_28575 ) ) ( not ( = ?auto_28572 ?auto_28575 ) ) ( SURFACE-AT ?auto_28571 ?auto_28567 ) ( CLEAR ?auto_28571 ) ( IS-CRATE ?auto_28572 ) ( not ( = ?auto_28571 ?auto_28572 ) ) ( not ( = ?auto_28562 ?auto_28571 ) ) ( not ( = ?auto_28563 ?auto_28571 ) ) ( not ( = ?auto_28561 ?auto_28571 ) ) ( not ( = ?auto_28573 ?auto_28571 ) ) ( not ( = ?auto_28577 ?auto_28571 ) ) ( not ( = ?auto_28560 ?auto_28571 ) ) ( not ( = ?auto_28569 ?auto_28571 ) ) ( not ( = ?auto_28575 ?auto_28571 ) ) ( AVAILABLE ?auto_28566 ) ( not ( = ?auto_28582 ?auto_28567 ) ) ( not ( = ?auto_28574 ?auto_28582 ) ) ( not ( = ?auto_28576 ?auto_28582 ) ) ( not ( = ?auto_28579 ?auto_28582 ) ) ( not ( = ?auto_28578 ?auto_28582 ) ) ( HOIST-AT ?auto_28568 ?auto_28582 ) ( not ( = ?auto_28566 ?auto_28568 ) ) ( not ( = ?auto_28570 ?auto_28568 ) ) ( not ( = ?auto_28565 ?auto_28568 ) ) ( not ( = ?auto_28580 ?auto_28568 ) ) ( not ( = ?auto_28581 ?auto_28568 ) ) ( AVAILABLE ?auto_28568 ) ( SURFACE-AT ?auto_28572 ?auto_28582 ) ( ON ?auto_28572 ?auto_28564 ) ( CLEAR ?auto_28572 ) ( not ( = ?auto_28562 ?auto_28564 ) ) ( not ( = ?auto_28563 ?auto_28564 ) ) ( not ( = ?auto_28561 ?auto_28564 ) ) ( not ( = ?auto_28573 ?auto_28564 ) ) ( not ( = ?auto_28577 ?auto_28564 ) ) ( not ( = ?auto_28560 ?auto_28564 ) ) ( not ( = ?auto_28569 ?auto_28564 ) ) ( not ( = ?auto_28572 ?auto_28564 ) ) ( not ( = ?auto_28575 ?auto_28564 ) ) ( not ( = ?auto_28571 ?auto_28564 ) ) ( TRUCK-AT ?auto_28583 ?auto_28567 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28561 ?auto_28562 ?auto_28563 )
      ( MAKE-3CRATE-VERIFY ?auto_28560 ?auto_28561 ?auto_28562 ?auto_28563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28584 - SURFACE
      ?auto_28585 - SURFACE
      ?auto_28586 - SURFACE
      ?auto_28587 - SURFACE
      ?auto_28588 - SURFACE
    )
    :vars
    (
      ?auto_28591 - HOIST
      ?auto_28592 - PLACE
      ?auto_28598 - PLACE
      ?auto_28595 - HOIST
      ?auto_28597 - SURFACE
      ?auto_28600 - PLACE
      ?auto_28590 - HOIST
      ?auto_28601 - SURFACE
      ?auto_28603 - PLACE
      ?auto_28604 - HOIST
      ?auto_28594 - SURFACE
      ?auto_28602 - PLACE
      ?auto_28605 - HOIST
      ?auto_28599 - SURFACE
      ?auto_28596 - SURFACE
      ?auto_28606 - PLACE
      ?auto_28593 - HOIST
      ?auto_28589 - SURFACE
      ?auto_28607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28591 ?auto_28592 ) ( IS-CRATE ?auto_28588 ) ( not ( = ?auto_28587 ?auto_28588 ) ) ( not ( = ?auto_28586 ?auto_28587 ) ) ( not ( = ?auto_28586 ?auto_28588 ) ) ( not ( = ?auto_28598 ?auto_28592 ) ) ( HOIST-AT ?auto_28595 ?auto_28598 ) ( not ( = ?auto_28591 ?auto_28595 ) ) ( AVAILABLE ?auto_28595 ) ( SURFACE-AT ?auto_28588 ?auto_28598 ) ( ON ?auto_28588 ?auto_28597 ) ( CLEAR ?auto_28588 ) ( not ( = ?auto_28587 ?auto_28597 ) ) ( not ( = ?auto_28588 ?auto_28597 ) ) ( not ( = ?auto_28586 ?auto_28597 ) ) ( IS-CRATE ?auto_28587 ) ( not ( = ?auto_28600 ?auto_28592 ) ) ( not ( = ?auto_28598 ?auto_28600 ) ) ( HOIST-AT ?auto_28590 ?auto_28600 ) ( not ( = ?auto_28591 ?auto_28590 ) ) ( not ( = ?auto_28595 ?auto_28590 ) ) ( AVAILABLE ?auto_28590 ) ( SURFACE-AT ?auto_28587 ?auto_28600 ) ( ON ?auto_28587 ?auto_28601 ) ( CLEAR ?auto_28587 ) ( not ( = ?auto_28587 ?auto_28601 ) ) ( not ( = ?auto_28588 ?auto_28601 ) ) ( not ( = ?auto_28586 ?auto_28601 ) ) ( not ( = ?auto_28597 ?auto_28601 ) ) ( IS-CRATE ?auto_28586 ) ( not ( = ?auto_28585 ?auto_28586 ) ) ( not ( = ?auto_28587 ?auto_28585 ) ) ( not ( = ?auto_28588 ?auto_28585 ) ) ( not ( = ?auto_28597 ?auto_28585 ) ) ( not ( = ?auto_28601 ?auto_28585 ) ) ( not ( = ?auto_28603 ?auto_28592 ) ) ( not ( = ?auto_28598 ?auto_28603 ) ) ( not ( = ?auto_28600 ?auto_28603 ) ) ( HOIST-AT ?auto_28604 ?auto_28603 ) ( not ( = ?auto_28591 ?auto_28604 ) ) ( not ( = ?auto_28595 ?auto_28604 ) ) ( not ( = ?auto_28590 ?auto_28604 ) ) ( AVAILABLE ?auto_28604 ) ( SURFACE-AT ?auto_28586 ?auto_28603 ) ( ON ?auto_28586 ?auto_28594 ) ( CLEAR ?auto_28586 ) ( not ( = ?auto_28587 ?auto_28594 ) ) ( not ( = ?auto_28588 ?auto_28594 ) ) ( not ( = ?auto_28586 ?auto_28594 ) ) ( not ( = ?auto_28597 ?auto_28594 ) ) ( not ( = ?auto_28601 ?auto_28594 ) ) ( not ( = ?auto_28585 ?auto_28594 ) ) ( IS-CRATE ?auto_28585 ) ( not ( = ?auto_28584 ?auto_28585 ) ) ( not ( = ?auto_28587 ?auto_28584 ) ) ( not ( = ?auto_28588 ?auto_28584 ) ) ( not ( = ?auto_28586 ?auto_28584 ) ) ( not ( = ?auto_28597 ?auto_28584 ) ) ( not ( = ?auto_28601 ?auto_28584 ) ) ( not ( = ?auto_28594 ?auto_28584 ) ) ( not ( = ?auto_28602 ?auto_28592 ) ) ( not ( = ?auto_28598 ?auto_28602 ) ) ( not ( = ?auto_28600 ?auto_28602 ) ) ( not ( = ?auto_28603 ?auto_28602 ) ) ( HOIST-AT ?auto_28605 ?auto_28602 ) ( not ( = ?auto_28591 ?auto_28605 ) ) ( not ( = ?auto_28595 ?auto_28605 ) ) ( not ( = ?auto_28590 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28605 ) ) ( AVAILABLE ?auto_28605 ) ( SURFACE-AT ?auto_28585 ?auto_28602 ) ( ON ?auto_28585 ?auto_28599 ) ( CLEAR ?auto_28585 ) ( not ( = ?auto_28587 ?auto_28599 ) ) ( not ( = ?auto_28588 ?auto_28599 ) ) ( not ( = ?auto_28586 ?auto_28599 ) ) ( not ( = ?auto_28597 ?auto_28599 ) ) ( not ( = ?auto_28601 ?auto_28599 ) ) ( not ( = ?auto_28585 ?auto_28599 ) ) ( not ( = ?auto_28594 ?auto_28599 ) ) ( not ( = ?auto_28584 ?auto_28599 ) ) ( SURFACE-AT ?auto_28596 ?auto_28592 ) ( CLEAR ?auto_28596 ) ( IS-CRATE ?auto_28584 ) ( not ( = ?auto_28596 ?auto_28584 ) ) ( not ( = ?auto_28587 ?auto_28596 ) ) ( not ( = ?auto_28588 ?auto_28596 ) ) ( not ( = ?auto_28586 ?auto_28596 ) ) ( not ( = ?auto_28597 ?auto_28596 ) ) ( not ( = ?auto_28601 ?auto_28596 ) ) ( not ( = ?auto_28585 ?auto_28596 ) ) ( not ( = ?auto_28594 ?auto_28596 ) ) ( not ( = ?auto_28599 ?auto_28596 ) ) ( AVAILABLE ?auto_28591 ) ( not ( = ?auto_28606 ?auto_28592 ) ) ( not ( = ?auto_28598 ?auto_28606 ) ) ( not ( = ?auto_28600 ?auto_28606 ) ) ( not ( = ?auto_28603 ?auto_28606 ) ) ( not ( = ?auto_28602 ?auto_28606 ) ) ( HOIST-AT ?auto_28593 ?auto_28606 ) ( not ( = ?auto_28591 ?auto_28593 ) ) ( not ( = ?auto_28595 ?auto_28593 ) ) ( not ( = ?auto_28590 ?auto_28593 ) ) ( not ( = ?auto_28604 ?auto_28593 ) ) ( not ( = ?auto_28605 ?auto_28593 ) ) ( AVAILABLE ?auto_28593 ) ( SURFACE-AT ?auto_28584 ?auto_28606 ) ( ON ?auto_28584 ?auto_28589 ) ( CLEAR ?auto_28584 ) ( not ( = ?auto_28587 ?auto_28589 ) ) ( not ( = ?auto_28588 ?auto_28589 ) ) ( not ( = ?auto_28586 ?auto_28589 ) ) ( not ( = ?auto_28597 ?auto_28589 ) ) ( not ( = ?auto_28601 ?auto_28589 ) ) ( not ( = ?auto_28585 ?auto_28589 ) ) ( not ( = ?auto_28594 ?auto_28589 ) ) ( not ( = ?auto_28584 ?auto_28589 ) ) ( not ( = ?auto_28599 ?auto_28589 ) ) ( not ( = ?auto_28596 ?auto_28589 ) ) ( TRUCK-AT ?auto_28607 ?auto_28592 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28586 ?auto_28587 ?auto_28588 )
      ( MAKE-4CRATE-VERIFY ?auto_28584 ?auto_28585 ?auto_28586 ?auto_28587 ?auto_28588 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28608 - SURFACE
      ?auto_28609 - SURFACE
      ?auto_28610 - SURFACE
      ?auto_28611 - SURFACE
      ?auto_28612 - SURFACE
      ?auto_28613 - SURFACE
    )
    :vars
    (
      ?auto_28616 - HOIST
      ?auto_28617 - PLACE
      ?auto_28622 - PLACE
      ?auto_28620 - HOIST
      ?auto_28621 - SURFACE
      ?auto_28624 - PLACE
      ?auto_28615 - HOIST
      ?auto_28625 - SURFACE
      ?auto_28627 - PLACE
      ?auto_28628 - HOIST
      ?auto_28619 - SURFACE
      ?auto_28626 - PLACE
      ?auto_28629 - HOIST
      ?auto_28623 - SURFACE
      ?auto_28630 - PLACE
      ?auto_28618 - HOIST
      ?auto_28614 - SURFACE
      ?auto_28631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28616 ?auto_28617 ) ( IS-CRATE ?auto_28613 ) ( not ( = ?auto_28612 ?auto_28613 ) ) ( not ( = ?auto_28611 ?auto_28612 ) ) ( not ( = ?auto_28611 ?auto_28613 ) ) ( not ( = ?auto_28622 ?auto_28617 ) ) ( HOIST-AT ?auto_28620 ?auto_28622 ) ( not ( = ?auto_28616 ?auto_28620 ) ) ( AVAILABLE ?auto_28620 ) ( SURFACE-AT ?auto_28613 ?auto_28622 ) ( ON ?auto_28613 ?auto_28621 ) ( CLEAR ?auto_28613 ) ( not ( = ?auto_28612 ?auto_28621 ) ) ( not ( = ?auto_28613 ?auto_28621 ) ) ( not ( = ?auto_28611 ?auto_28621 ) ) ( IS-CRATE ?auto_28612 ) ( not ( = ?auto_28624 ?auto_28617 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( HOIST-AT ?auto_28615 ?auto_28624 ) ( not ( = ?auto_28616 ?auto_28615 ) ) ( not ( = ?auto_28620 ?auto_28615 ) ) ( AVAILABLE ?auto_28615 ) ( SURFACE-AT ?auto_28612 ?auto_28624 ) ( ON ?auto_28612 ?auto_28625 ) ( CLEAR ?auto_28612 ) ( not ( = ?auto_28612 ?auto_28625 ) ) ( not ( = ?auto_28613 ?auto_28625 ) ) ( not ( = ?auto_28611 ?auto_28625 ) ) ( not ( = ?auto_28621 ?auto_28625 ) ) ( IS-CRATE ?auto_28611 ) ( not ( = ?auto_28610 ?auto_28611 ) ) ( not ( = ?auto_28612 ?auto_28610 ) ) ( not ( = ?auto_28613 ?auto_28610 ) ) ( not ( = ?auto_28621 ?auto_28610 ) ) ( not ( = ?auto_28625 ?auto_28610 ) ) ( not ( = ?auto_28627 ?auto_28617 ) ) ( not ( = ?auto_28622 ?auto_28627 ) ) ( not ( = ?auto_28624 ?auto_28627 ) ) ( HOIST-AT ?auto_28628 ?auto_28627 ) ( not ( = ?auto_28616 ?auto_28628 ) ) ( not ( = ?auto_28620 ?auto_28628 ) ) ( not ( = ?auto_28615 ?auto_28628 ) ) ( AVAILABLE ?auto_28628 ) ( SURFACE-AT ?auto_28611 ?auto_28627 ) ( ON ?auto_28611 ?auto_28619 ) ( CLEAR ?auto_28611 ) ( not ( = ?auto_28612 ?auto_28619 ) ) ( not ( = ?auto_28613 ?auto_28619 ) ) ( not ( = ?auto_28611 ?auto_28619 ) ) ( not ( = ?auto_28621 ?auto_28619 ) ) ( not ( = ?auto_28625 ?auto_28619 ) ) ( not ( = ?auto_28610 ?auto_28619 ) ) ( IS-CRATE ?auto_28610 ) ( not ( = ?auto_28609 ?auto_28610 ) ) ( not ( = ?auto_28612 ?auto_28609 ) ) ( not ( = ?auto_28613 ?auto_28609 ) ) ( not ( = ?auto_28611 ?auto_28609 ) ) ( not ( = ?auto_28621 ?auto_28609 ) ) ( not ( = ?auto_28625 ?auto_28609 ) ) ( not ( = ?auto_28619 ?auto_28609 ) ) ( not ( = ?auto_28626 ?auto_28617 ) ) ( not ( = ?auto_28622 ?auto_28626 ) ) ( not ( = ?auto_28624 ?auto_28626 ) ) ( not ( = ?auto_28627 ?auto_28626 ) ) ( HOIST-AT ?auto_28629 ?auto_28626 ) ( not ( = ?auto_28616 ?auto_28629 ) ) ( not ( = ?auto_28620 ?auto_28629 ) ) ( not ( = ?auto_28615 ?auto_28629 ) ) ( not ( = ?auto_28628 ?auto_28629 ) ) ( AVAILABLE ?auto_28629 ) ( SURFACE-AT ?auto_28610 ?auto_28626 ) ( ON ?auto_28610 ?auto_28623 ) ( CLEAR ?auto_28610 ) ( not ( = ?auto_28612 ?auto_28623 ) ) ( not ( = ?auto_28613 ?auto_28623 ) ) ( not ( = ?auto_28611 ?auto_28623 ) ) ( not ( = ?auto_28621 ?auto_28623 ) ) ( not ( = ?auto_28625 ?auto_28623 ) ) ( not ( = ?auto_28610 ?auto_28623 ) ) ( not ( = ?auto_28619 ?auto_28623 ) ) ( not ( = ?auto_28609 ?auto_28623 ) ) ( SURFACE-AT ?auto_28608 ?auto_28617 ) ( CLEAR ?auto_28608 ) ( IS-CRATE ?auto_28609 ) ( not ( = ?auto_28608 ?auto_28609 ) ) ( not ( = ?auto_28612 ?auto_28608 ) ) ( not ( = ?auto_28613 ?auto_28608 ) ) ( not ( = ?auto_28611 ?auto_28608 ) ) ( not ( = ?auto_28621 ?auto_28608 ) ) ( not ( = ?auto_28625 ?auto_28608 ) ) ( not ( = ?auto_28610 ?auto_28608 ) ) ( not ( = ?auto_28619 ?auto_28608 ) ) ( not ( = ?auto_28623 ?auto_28608 ) ) ( AVAILABLE ?auto_28616 ) ( not ( = ?auto_28630 ?auto_28617 ) ) ( not ( = ?auto_28622 ?auto_28630 ) ) ( not ( = ?auto_28624 ?auto_28630 ) ) ( not ( = ?auto_28627 ?auto_28630 ) ) ( not ( = ?auto_28626 ?auto_28630 ) ) ( HOIST-AT ?auto_28618 ?auto_28630 ) ( not ( = ?auto_28616 ?auto_28618 ) ) ( not ( = ?auto_28620 ?auto_28618 ) ) ( not ( = ?auto_28615 ?auto_28618 ) ) ( not ( = ?auto_28628 ?auto_28618 ) ) ( not ( = ?auto_28629 ?auto_28618 ) ) ( AVAILABLE ?auto_28618 ) ( SURFACE-AT ?auto_28609 ?auto_28630 ) ( ON ?auto_28609 ?auto_28614 ) ( CLEAR ?auto_28609 ) ( not ( = ?auto_28612 ?auto_28614 ) ) ( not ( = ?auto_28613 ?auto_28614 ) ) ( not ( = ?auto_28611 ?auto_28614 ) ) ( not ( = ?auto_28621 ?auto_28614 ) ) ( not ( = ?auto_28625 ?auto_28614 ) ) ( not ( = ?auto_28610 ?auto_28614 ) ) ( not ( = ?auto_28619 ?auto_28614 ) ) ( not ( = ?auto_28609 ?auto_28614 ) ) ( not ( = ?auto_28623 ?auto_28614 ) ) ( not ( = ?auto_28608 ?auto_28614 ) ) ( TRUCK-AT ?auto_28631 ?auto_28617 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28611 ?auto_28612 ?auto_28613 )
      ( MAKE-5CRATE-VERIFY ?auto_28608 ?auto_28609 ?auto_28610 ?auto_28611 ?auto_28612 ?auto_28613 ) )
  )

)

