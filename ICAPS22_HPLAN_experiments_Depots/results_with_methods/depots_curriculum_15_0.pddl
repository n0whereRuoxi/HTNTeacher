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
      ?auto_5202 - SURFACE
      ?auto_5203 - SURFACE
    )
    :vars
    (
      ?auto_5204 - HOIST
      ?auto_5205 - PLACE
      ?auto_5207 - PLACE
      ?auto_5208 - HOIST
      ?auto_5209 - SURFACE
      ?auto_5206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5204 ?auto_5205 ) ( SURFACE-AT ?auto_5203 ?auto_5205 ) ( CLEAR ?auto_5203 ) ( IS-CRATE ?auto_5202 ) ( AVAILABLE ?auto_5204 ) ( not ( = ?auto_5207 ?auto_5205 ) ) ( HOIST-AT ?auto_5208 ?auto_5207 ) ( AVAILABLE ?auto_5208 ) ( SURFACE-AT ?auto_5202 ?auto_5207 ) ( ON ?auto_5202 ?auto_5209 ) ( CLEAR ?auto_5202 ) ( TRUCK-AT ?auto_5206 ?auto_5205 ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5209 ) ) ( not ( = ?auto_5203 ?auto_5209 ) ) ( not ( = ?auto_5204 ?auto_5208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5206 ?auto_5205 ?auto_5207 )
      ( !LIFT ?auto_5208 ?auto_5202 ?auto_5209 ?auto_5207 )
      ( !LOAD ?auto_5208 ?auto_5202 ?auto_5206 ?auto_5207 )
      ( !DRIVE ?auto_5206 ?auto_5207 ?auto_5205 )
      ( !UNLOAD ?auto_5204 ?auto_5202 ?auto_5206 ?auto_5205 )
      ( !DROP ?auto_5204 ?auto_5202 ?auto_5203 ?auto_5205 )
      ( MAKE-ON-VERIFY ?auto_5202 ?auto_5203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5212 - SURFACE
      ?auto_5213 - SURFACE
    )
    :vars
    (
      ?auto_5214 - HOIST
      ?auto_5215 - PLACE
      ?auto_5217 - PLACE
      ?auto_5218 - HOIST
      ?auto_5219 - SURFACE
      ?auto_5216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5214 ?auto_5215 ) ( SURFACE-AT ?auto_5213 ?auto_5215 ) ( CLEAR ?auto_5213 ) ( IS-CRATE ?auto_5212 ) ( AVAILABLE ?auto_5214 ) ( not ( = ?auto_5217 ?auto_5215 ) ) ( HOIST-AT ?auto_5218 ?auto_5217 ) ( AVAILABLE ?auto_5218 ) ( SURFACE-AT ?auto_5212 ?auto_5217 ) ( ON ?auto_5212 ?auto_5219 ) ( CLEAR ?auto_5212 ) ( TRUCK-AT ?auto_5216 ?auto_5215 ) ( not ( = ?auto_5212 ?auto_5213 ) ) ( not ( = ?auto_5212 ?auto_5219 ) ) ( not ( = ?auto_5213 ?auto_5219 ) ) ( not ( = ?auto_5214 ?auto_5218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5216 ?auto_5215 ?auto_5217 )
      ( !LIFT ?auto_5218 ?auto_5212 ?auto_5219 ?auto_5217 )
      ( !LOAD ?auto_5218 ?auto_5212 ?auto_5216 ?auto_5217 )
      ( !DRIVE ?auto_5216 ?auto_5217 ?auto_5215 )
      ( !UNLOAD ?auto_5214 ?auto_5212 ?auto_5216 ?auto_5215 )
      ( !DROP ?auto_5214 ?auto_5212 ?auto_5213 ?auto_5215 )
      ( MAKE-ON-VERIFY ?auto_5212 ?auto_5213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5222 - SURFACE
      ?auto_5223 - SURFACE
    )
    :vars
    (
      ?auto_5224 - HOIST
      ?auto_5225 - PLACE
      ?auto_5227 - PLACE
      ?auto_5228 - HOIST
      ?auto_5229 - SURFACE
      ?auto_5226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5224 ?auto_5225 ) ( SURFACE-AT ?auto_5223 ?auto_5225 ) ( CLEAR ?auto_5223 ) ( IS-CRATE ?auto_5222 ) ( AVAILABLE ?auto_5224 ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( HOIST-AT ?auto_5228 ?auto_5227 ) ( AVAILABLE ?auto_5228 ) ( SURFACE-AT ?auto_5222 ?auto_5227 ) ( ON ?auto_5222 ?auto_5229 ) ( CLEAR ?auto_5222 ) ( TRUCK-AT ?auto_5226 ?auto_5225 ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( not ( = ?auto_5222 ?auto_5229 ) ) ( not ( = ?auto_5223 ?auto_5229 ) ) ( not ( = ?auto_5224 ?auto_5228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5226 ?auto_5225 ?auto_5227 )
      ( !LIFT ?auto_5228 ?auto_5222 ?auto_5229 ?auto_5227 )
      ( !LOAD ?auto_5228 ?auto_5222 ?auto_5226 ?auto_5227 )
      ( !DRIVE ?auto_5226 ?auto_5227 ?auto_5225 )
      ( !UNLOAD ?auto_5224 ?auto_5222 ?auto_5226 ?auto_5225 )
      ( !DROP ?auto_5224 ?auto_5222 ?auto_5223 ?auto_5225 )
      ( MAKE-ON-VERIFY ?auto_5222 ?auto_5223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5232 - SURFACE
      ?auto_5233 - SURFACE
    )
    :vars
    (
      ?auto_5234 - HOIST
      ?auto_5235 - PLACE
      ?auto_5237 - PLACE
      ?auto_5238 - HOIST
      ?auto_5239 - SURFACE
      ?auto_5236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5234 ?auto_5235 ) ( SURFACE-AT ?auto_5233 ?auto_5235 ) ( CLEAR ?auto_5233 ) ( IS-CRATE ?auto_5232 ) ( AVAILABLE ?auto_5234 ) ( not ( = ?auto_5237 ?auto_5235 ) ) ( HOIST-AT ?auto_5238 ?auto_5237 ) ( AVAILABLE ?auto_5238 ) ( SURFACE-AT ?auto_5232 ?auto_5237 ) ( ON ?auto_5232 ?auto_5239 ) ( CLEAR ?auto_5232 ) ( TRUCK-AT ?auto_5236 ?auto_5235 ) ( not ( = ?auto_5232 ?auto_5233 ) ) ( not ( = ?auto_5232 ?auto_5239 ) ) ( not ( = ?auto_5233 ?auto_5239 ) ) ( not ( = ?auto_5234 ?auto_5238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5236 ?auto_5235 ?auto_5237 )
      ( !LIFT ?auto_5238 ?auto_5232 ?auto_5239 ?auto_5237 )
      ( !LOAD ?auto_5238 ?auto_5232 ?auto_5236 ?auto_5237 )
      ( !DRIVE ?auto_5236 ?auto_5237 ?auto_5235 )
      ( !UNLOAD ?auto_5234 ?auto_5232 ?auto_5236 ?auto_5235 )
      ( !DROP ?auto_5234 ?auto_5232 ?auto_5233 ?auto_5235 )
      ( MAKE-ON-VERIFY ?auto_5232 ?auto_5233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5242 - SURFACE
      ?auto_5243 - SURFACE
    )
    :vars
    (
      ?auto_5244 - HOIST
      ?auto_5245 - PLACE
      ?auto_5247 - PLACE
      ?auto_5248 - HOIST
      ?auto_5249 - SURFACE
      ?auto_5246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5244 ?auto_5245 ) ( SURFACE-AT ?auto_5243 ?auto_5245 ) ( CLEAR ?auto_5243 ) ( IS-CRATE ?auto_5242 ) ( AVAILABLE ?auto_5244 ) ( not ( = ?auto_5247 ?auto_5245 ) ) ( HOIST-AT ?auto_5248 ?auto_5247 ) ( AVAILABLE ?auto_5248 ) ( SURFACE-AT ?auto_5242 ?auto_5247 ) ( ON ?auto_5242 ?auto_5249 ) ( CLEAR ?auto_5242 ) ( TRUCK-AT ?auto_5246 ?auto_5245 ) ( not ( = ?auto_5242 ?auto_5243 ) ) ( not ( = ?auto_5242 ?auto_5249 ) ) ( not ( = ?auto_5243 ?auto_5249 ) ) ( not ( = ?auto_5244 ?auto_5248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5246 ?auto_5245 ?auto_5247 )
      ( !LIFT ?auto_5248 ?auto_5242 ?auto_5249 ?auto_5247 )
      ( !LOAD ?auto_5248 ?auto_5242 ?auto_5246 ?auto_5247 )
      ( !DRIVE ?auto_5246 ?auto_5247 ?auto_5245 )
      ( !UNLOAD ?auto_5244 ?auto_5242 ?auto_5246 ?auto_5245 )
      ( !DROP ?auto_5244 ?auto_5242 ?auto_5243 ?auto_5245 )
      ( MAKE-ON-VERIFY ?auto_5242 ?auto_5243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5252 - SURFACE
      ?auto_5253 - SURFACE
    )
    :vars
    (
      ?auto_5254 - HOIST
      ?auto_5255 - PLACE
      ?auto_5257 - PLACE
      ?auto_5258 - HOIST
      ?auto_5259 - SURFACE
      ?auto_5256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5254 ?auto_5255 ) ( SURFACE-AT ?auto_5253 ?auto_5255 ) ( CLEAR ?auto_5253 ) ( IS-CRATE ?auto_5252 ) ( AVAILABLE ?auto_5254 ) ( not ( = ?auto_5257 ?auto_5255 ) ) ( HOIST-AT ?auto_5258 ?auto_5257 ) ( AVAILABLE ?auto_5258 ) ( SURFACE-AT ?auto_5252 ?auto_5257 ) ( ON ?auto_5252 ?auto_5259 ) ( CLEAR ?auto_5252 ) ( TRUCK-AT ?auto_5256 ?auto_5255 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5259 ) ) ( not ( = ?auto_5253 ?auto_5259 ) ) ( not ( = ?auto_5254 ?auto_5258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5256 ?auto_5255 ?auto_5257 )
      ( !LIFT ?auto_5258 ?auto_5252 ?auto_5259 ?auto_5257 )
      ( !LOAD ?auto_5258 ?auto_5252 ?auto_5256 ?auto_5257 )
      ( !DRIVE ?auto_5256 ?auto_5257 ?auto_5255 )
      ( !UNLOAD ?auto_5254 ?auto_5252 ?auto_5256 ?auto_5255 )
      ( !DROP ?auto_5254 ?auto_5252 ?auto_5253 ?auto_5255 )
      ( MAKE-ON-VERIFY ?auto_5252 ?auto_5253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5262 - SURFACE
      ?auto_5263 - SURFACE
    )
    :vars
    (
      ?auto_5264 - HOIST
      ?auto_5265 - PLACE
      ?auto_5267 - PLACE
      ?auto_5268 - HOIST
      ?auto_5269 - SURFACE
      ?auto_5266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5264 ?auto_5265 ) ( SURFACE-AT ?auto_5263 ?auto_5265 ) ( CLEAR ?auto_5263 ) ( IS-CRATE ?auto_5262 ) ( AVAILABLE ?auto_5264 ) ( not ( = ?auto_5267 ?auto_5265 ) ) ( HOIST-AT ?auto_5268 ?auto_5267 ) ( AVAILABLE ?auto_5268 ) ( SURFACE-AT ?auto_5262 ?auto_5267 ) ( ON ?auto_5262 ?auto_5269 ) ( CLEAR ?auto_5262 ) ( TRUCK-AT ?auto_5266 ?auto_5265 ) ( not ( = ?auto_5262 ?auto_5263 ) ) ( not ( = ?auto_5262 ?auto_5269 ) ) ( not ( = ?auto_5263 ?auto_5269 ) ) ( not ( = ?auto_5264 ?auto_5268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5266 ?auto_5265 ?auto_5267 )
      ( !LIFT ?auto_5268 ?auto_5262 ?auto_5269 ?auto_5267 )
      ( !LOAD ?auto_5268 ?auto_5262 ?auto_5266 ?auto_5267 )
      ( !DRIVE ?auto_5266 ?auto_5267 ?auto_5265 )
      ( !UNLOAD ?auto_5264 ?auto_5262 ?auto_5266 ?auto_5265 )
      ( !DROP ?auto_5264 ?auto_5262 ?auto_5263 ?auto_5265 )
      ( MAKE-ON-VERIFY ?auto_5262 ?auto_5263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5272 - SURFACE
      ?auto_5273 - SURFACE
    )
    :vars
    (
      ?auto_5274 - HOIST
      ?auto_5275 - PLACE
      ?auto_5277 - PLACE
      ?auto_5278 - HOIST
      ?auto_5279 - SURFACE
      ?auto_5276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5274 ?auto_5275 ) ( SURFACE-AT ?auto_5273 ?auto_5275 ) ( CLEAR ?auto_5273 ) ( IS-CRATE ?auto_5272 ) ( AVAILABLE ?auto_5274 ) ( not ( = ?auto_5277 ?auto_5275 ) ) ( HOIST-AT ?auto_5278 ?auto_5277 ) ( AVAILABLE ?auto_5278 ) ( SURFACE-AT ?auto_5272 ?auto_5277 ) ( ON ?auto_5272 ?auto_5279 ) ( CLEAR ?auto_5272 ) ( TRUCK-AT ?auto_5276 ?auto_5275 ) ( not ( = ?auto_5272 ?auto_5273 ) ) ( not ( = ?auto_5272 ?auto_5279 ) ) ( not ( = ?auto_5273 ?auto_5279 ) ) ( not ( = ?auto_5274 ?auto_5278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5276 ?auto_5275 ?auto_5277 )
      ( !LIFT ?auto_5278 ?auto_5272 ?auto_5279 ?auto_5277 )
      ( !LOAD ?auto_5278 ?auto_5272 ?auto_5276 ?auto_5277 )
      ( !DRIVE ?auto_5276 ?auto_5277 ?auto_5275 )
      ( !UNLOAD ?auto_5274 ?auto_5272 ?auto_5276 ?auto_5275 )
      ( !DROP ?auto_5274 ?auto_5272 ?auto_5273 ?auto_5275 )
      ( MAKE-ON-VERIFY ?auto_5272 ?auto_5273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5282 - SURFACE
      ?auto_5283 - SURFACE
    )
    :vars
    (
      ?auto_5284 - HOIST
      ?auto_5285 - PLACE
      ?auto_5287 - PLACE
      ?auto_5288 - HOIST
      ?auto_5289 - SURFACE
      ?auto_5286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5284 ?auto_5285 ) ( SURFACE-AT ?auto_5283 ?auto_5285 ) ( CLEAR ?auto_5283 ) ( IS-CRATE ?auto_5282 ) ( AVAILABLE ?auto_5284 ) ( not ( = ?auto_5287 ?auto_5285 ) ) ( HOIST-AT ?auto_5288 ?auto_5287 ) ( AVAILABLE ?auto_5288 ) ( SURFACE-AT ?auto_5282 ?auto_5287 ) ( ON ?auto_5282 ?auto_5289 ) ( CLEAR ?auto_5282 ) ( TRUCK-AT ?auto_5286 ?auto_5285 ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5289 ) ) ( not ( = ?auto_5283 ?auto_5289 ) ) ( not ( = ?auto_5284 ?auto_5288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5286 ?auto_5285 ?auto_5287 )
      ( !LIFT ?auto_5288 ?auto_5282 ?auto_5289 ?auto_5287 )
      ( !LOAD ?auto_5288 ?auto_5282 ?auto_5286 ?auto_5287 )
      ( !DRIVE ?auto_5286 ?auto_5287 ?auto_5285 )
      ( !UNLOAD ?auto_5284 ?auto_5282 ?auto_5286 ?auto_5285 )
      ( !DROP ?auto_5284 ?auto_5282 ?auto_5283 ?auto_5285 )
      ( MAKE-ON-VERIFY ?auto_5282 ?auto_5283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5292 - SURFACE
      ?auto_5293 - SURFACE
    )
    :vars
    (
      ?auto_5294 - HOIST
      ?auto_5295 - PLACE
      ?auto_5297 - PLACE
      ?auto_5298 - HOIST
      ?auto_5299 - SURFACE
      ?auto_5296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5294 ?auto_5295 ) ( SURFACE-AT ?auto_5293 ?auto_5295 ) ( CLEAR ?auto_5293 ) ( IS-CRATE ?auto_5292 ) ( AVAILABLE ?auto_5294 ) ( not ( = ?auto_5297 ?auto_5295 ) ) ( HOIST-AT ?auto_5298 ?auto_5297 ) ( AVAILABLE ?auto_5298 ) ( SURFACE-AT ?auto_5292 ?auto_5297 ) ( ON ?auto_5292 ?auto_5299 ) ( CLEAR ?auto_5292 ) ( TRUCK-AT ?auto_5296 ?auto_5295 ) ( not ( = ?auto_5292 ?auto_5293 ) ) ( not ( = ?auto_5292 ?auto_5299 ) ) ( not ( = ?auto_5293 ?auto_5299 ) ) ( not ( = ?auto_5294 ?auto_5298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5296 ?auto_5295 ?auto_5297 )
      ( !LIFT ?auto_5298 ?auto_5292 ?auto_5299 ?auto_5297 )
      ( !LOAD ?auto_5298 ?auto_5292 ?auto_5296 ?auto_5297 )
      ( !DRIVE ?auto_5296 ?auto_5297 ?auto_5295 )
      ( !UNLOAD ?auto_5294 ?auto_5292 ?auto_5296 ?auto_5295 )
      ( !DROP ?auto_5294 ?auto_5292 ?auto_5293 ?auto_5295 )
      ( MAKE-ON-VERIFY ?auto_5292 ?auto_5293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5302 - SURFACE
      ?auto_5303 - SURFACE
    )
    :vars
    (
      ?auto_5304 - HOIST
      ?auto_5305 - PLACE
      ?auto_5307 - PLACE
      ?auto_5308 - HOIST
      ?auto_5309 - SURFACE
      ?auto_5306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5304 ?auto_5305 ) ( SURFACE-AT ?auto_5303 ?auto_5305 ) ( CLEAR ?auto_5303 ) ( IS-CRATE ?auto_5302 ) ( AVAILABLE ?auto_5304 ) ( not ( = ?auto_5307 ?auto_5305 ) ) ( HOIST-AT ?auto_5308 ?auto_5307 ) ( AVAILABLE ?auto_5308 ) ( SURFACE-AT ?auto_5302 ?auto_5307 ) ( ON ?auto_5302 ?auto_5309 ) ( CLEAR ?auto_5302 ) ( TRUCK-AT ?auto_5306 ?auto_5305 ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5309 ) ) ( not ( = ?auto_5303 ?auto_5309 ) ) ( not ( = ?auto_5304 ?auto_5308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5306 ?auto_5305 ?auto_5307 )
      ( !LIFT ?auto_5308 ?auto_5302 ?auto_5309 ?auto_5307 )
      ( !LOAD ?auto_5308 ?auto_5302 ?auto_5306 ?auto_5307 )
      ( !DRIVE ?auto_5306 ?auto_5307 ?auto_5305 )
      ( !UNLOAD ?auto_5304 ?auto_5302 ?auto_5306 ?auto_5305 )
      ( !DROP ?auto_5304 ?auto_5302 ?auto_5303 ?auto_5305 )
      ( MAKE-ON-VERIFY ?auto_5302 ?auto_5303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5312 - SURFACE
      ?auto_5313 - SURFACE
    )
    :vars
    (
      ?auto_5314 - HOIST
      ?auto_5315 - PLACE
      ?auto_5317 - PLACE
      ?auto_5318 - HOIST
      ?auto_5319 - SURFACE
      ?auto_5316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5314 ?auto_5315 ) ( SURFACE-AT ?auto_5313 ?auto_5315 ) ( CLEAR ?auto_5313 ) ( IS-CRATE ?auto_5312 ) ( AVAILABLE ?auto_5314 ) ( not ( = ?auto_5317 ?auto_5315 ) ) ( HOIST-AT ?auto_5318 ?auto_5317 ) ( AVAILABLE ?auto_5318 ) ( SURFACE-AT ?auto_5312 ?auto_5317 ) ( ON ?auto_5312 ?auto_5319 ) ( CLEAR ?auto_5312 ) ( TRUCK-AT ?auto_5316 ?auto_5315 ) ( not ( = ?auto_5312 ?auto_5313 ) ) ( not ( = ?auto_5312 ?auto_5319 ) ) ( not ( = ?auto_5313 ?auto_5319 ) ) ( not ( = ?auto_5314 ?auto_5318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5316 ?auto_5315 ?auto_5317 )
      ( !LIFT ?auto_5318 ?auto_5312 ?auto_5319 ?auto_5317 )
      ( !LOAD ?auto_5318 ?auto_5312 ?auto_5316 ?auto_5317 )
      ( !DRIVE ?auto_5316 ?auto_5317 ?auto_5315 )
      ( !UNLOAD ?auto_5314 ?auto_5312 ?auto_5316 ?auto_5315 )
      ( !DROP ?auto_5314 ?auto_5312 ?auto_5313 ?auto_5315 )
      ( MAKE-ON-VERIFY ?auto_5312 ?auto_5313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5322 - SURFACE
      ?auto_5323 - SURFACE
    )
    :vars
    (
      ?auto_5324 - HOIST
      ?auto_5325 - PLACE
      ?auto_5327 - PLACE
      ?auto_5328 - HOIST
      ?auto_5329 - SURFACE
      ?auto_5326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5324 ?auto_5325 ) ( SURFACE-AT ?auto_5323 ?auto_5325 ) ( CLEAR ?auto_5323 ) ( IS-CRATE ?auto_5322 ) ( AVAILABLE ?auto_5324 ) ( not ( = ?auto_5327 ?auto_5325 ) ) ( HOIST-AT ?auto_5328 ?auto_5327 ) ( AVAILABLE ?auto_5328 ) ( SURFACE-AT ?auto_5322 ?auto_5327 ) ( ON ?auto_5322 ?auto_5329 ) ( CLEAR ?auto_5322 ) ( TRUCK-AT ?auto_5326 ?auto_5325 ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( not ( = ?auto_5322 ?auto_5329 ) ) ( not ( = ?auto_5323 ?auto_5329 ) ) ( not ( = ?auto_5324 ?auto_5328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5326 ?auto_5325 ?auto_5327 )
      ( !LIFT ?auto_5328 ?auto_5322 ?auto_5329 ?auto_5327 )
      ( !LOAD ?auto_5328 ?auto_5322 ?auto_5326 ?auto_5327 )
      ( !DRIVE ?auto_5326 ?auto_5327 ?auto_5325 )
      ( !UNLOAD ?auto_5324 ?auto_5322 ?auto_5326 ?auto_5325 )
      ( !DROP ?auto_5324 ?auto_5322 ?auto_5323 ?auto_5325 )
      ( MAKE-ON-VERIFY ?auto_5322 ?auto_5323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5332 - SURFACE
      ?auto_5333 - SURFACE
    )
    :vars
    (
      ?auto_5334 - HOIST
      ?auto_5335 - PLACE
      ?auto_5337 - PLACE
      ?auto_5338 - HOIST
      ?auto_5339 - SURFACE
      ?auto_5336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5334 ?auto_5335 ) ( SURFACE-AT ?auto_5333 ?auto_5335 ) ( CLEAR ?auto_5333 ) ( IS-CRATE ?auto_5332 ) ( AVAILABLE ?auto_5334 ) ( not ( = ?auto_5337 ?auto_5335 ) ) ( HOIST-AT ?auto_5338 ?auto_5337 ) ( AVAILABLE ?auto_5338 ) ( SURFACE-AT ?auto_5332 ?auto_5337 ) ( ON ?auto_5332 ?auto_5339 ) ( CLEAR ?auto_5332 ) ( TRUCK-AT ?auto_5336 ?auto_5335 ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5339 ) ) ( not ( = ?auto_5333 ?auto_5339 ) ) ( not ( = ?auto_5334 ?auto_5338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5336 ?auto_5335 ?auto_5337 )
      ( !LIFT ?auto_5338 ?auto_5332 ?auto_5339 ?auto_5337 )
      ( !LOAD ?auto_5338 ?auto_5332 ?auto_5336 ?auto_5337 )
      ( !DRIVE ?auto_5336 ?auto_5337 ?auto_5335 )
      ( !UNLOAD ?auto_5334 ?auto_5332 ?auto_5336 ?auto_5335 )
      ( !DROP ?auto_5334 ?auto_5332 ?auto_5333 ?auto_5335 )
      ( MAKE-ON-VERIFY ?auto_5332 ?auto_5333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5342 - SURFACE
      ?auto_5343 - SURFACE
    )
    :vars
    (
      ?auto_5344 - HOIST
      ?auto_5345 - PLACE
      ?auto_5347 - PLACE
      ?auto_5348 - HOIST
      ?auto_5349 - SURFACE
      ?auto_5346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5344 ?auto_5345 ) ( SURFACE-AT ?auto_5343 ?auto_5345 ) ( CLEAR ?auto_5343 ) ( IS-CRATE ?auto_5342 ) ( AVAILABLE ?auto_5344 ) ( not ( = ?auto_5347 ?auto_5345 ) ) ( HOIST-AT ?auto_5348 ?auto_5347 ) ( AVAILABLE ?auto_5348 ) ( SURFACE-AT ?auto_5342 ?auto_5347 ) ( ON ?auto_5342 ?auto_5349 ) ( CLEAR ?auto_5342 ) ( TRUCK-AT ?auto_5346 ?auto_5345 ) ( not ( = ?auto_5342 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5349 ) ) ( not ( = ?auto_5343 ?auto_5349 ) ) ( not ( = ?auto_5344 ?auto_5348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5346 ?auto_5345 ?auto_5347 )
      ( !LIFT ?auto_5348 ?auto_5342 ?auto_5349 ?auto_5347 )
      ( !LOAD ?auto_5348 ?auto_5342 ?auto_5346 ?auto_5347 )
      ( !DRIVE ?auto_5346 ?auto_5347 ?auto_5345 )
      ( !UNLOAD ?auto_5344 ?auto_5342 ?auto_5346 ?auto_5345 )
      ( !DROP ?auto_5344 ?auto_5342 ?auto_5343 ?auto_5345 )
      ( MAKE-ON-VERIFY ?auto_5342 ?auto_5343 ) )
  )

)

