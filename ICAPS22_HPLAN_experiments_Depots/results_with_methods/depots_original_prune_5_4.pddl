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
      ?auto_5084 - SURFACE
      ?auto_5085 - SURFACE
    )
    :vars
    (
      ?auto_5086 - HOIST
      ?auto_5087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5086 ?auto_5087 ) ( SURFACE-AT ?auto_5085 ?auto_5087 ) ( CLEAR ?auto_5085 ) ( LIFTING ?auto_5086 ?auto_5084 ) ( IS-CRATE ?auto_5084 ) ( not ( = ?auto_5084 ?auto_5085 ) ) )
    :subtasks
    ( ( !DROP ?auto_5086 ?auto_5084 ?auto_5085 ?auto_5087 )
      ( MAKE-ON-VERIFY ?auto_5084 ?auto_5085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5088 - SURFACE
      ?auto_5089 - SURFACE
    )
    :vars
    (
      ?auto_5091 - HOIST
      ?auto_5090 - PLACE
      ?auto_5092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5091 ?auto_5090 ) ( SURFACE-AT ?auto_5089 ?auto_5090 ) ( CLEAR ?auto_5089 ) ( IS-CRATE ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( TRUCK-AT ?auto_5092 ?auto_5090 ) ( AVAILABLE ?auto_5091 ) ( IN ?auto_5088 ?auto_5092 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5091 ?auto_5088 ?auto_5092 ?auto_5090 )
      ( MAKE-ON ?auto_5088 ?auto_5089 )
      ( MAKE-ON-VERIFY ?auto_5088 ?auto_5089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5093 - SURFACE
      ?auto_5094 - SURFACE
    )
    :vars
    (
      ?auto_5096 - HOIST
      ?auto_5095 - PLACE
      ?auto_5097 - TRUCK
      ?auto_5098 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5096 ?auto_5095 ) ( SURFACE-AT ?auto_5094 ?auto_5095 ) ( CLEAR ?auto_5094 ) ( IS-CRATE ?auto_5093 ) ( not ( = ?auto_5093 ?auto_5094 ) ) ( AVAILABLE ?auto_5096 ) ( IN ?auto_5093 ?auto_5097 ) ( TRUCK-AT ?auto_5097 ?auto_5098 ) ( not ( = ?auto_5098 ?auto_5095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5097 ?auto_5098 ?auto_5095 )
      ( MAKE-ON ?auto_5093 ?auto_5094 )
      ( MAKE-ON-VERIFY ?auto_5093 ?auto_5094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5099 - SURFACE
      ?auto_5100 - SURFACE
    )
    :vars
    (
      ?auto_5102 - HOIST
      ?auto_5104 - PLACE
      ?auto_5103 - TRUCK
      ?auto_5101 - PLACE
      ?auto_5105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5102 ?auto_5104 ) ( SURFACE-AT ?auto_5100 ?auto_5104 ) ( CLEAR ?auto_5100 ) ( IS-CRATE ?auto_5099 ) ( not ( = ?auto_5099 ?auto_5100 ) ) ( AVAILABLE ?auto_5102 ) ( TRUCK-AT ?auto_5103 ?auto_5101 ) ( not ( = ?auto_5101 ?auto_5104 ) ) ( HOIST-AT ?auto_5105 ?auto_5101 ) ( LIFTING ?auto_5105 ?auto_5099 ) ( not ( = ?auto_5102 ?auto_5105 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5105 ?auto_5099 ?auto_5103 ?auto_5101 )
      ( MAKE-ON ?auto_5099 ?auto_5100 )
      ( MAKE-ON-VERIFY ?auto_5099 ?auto_5100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5106 - SURFACE
      ?auto_5107 - SURFACE
    )
    :vars
    (
      ?auto_5110 - HOIST
      ?auto_5111 - PLACE
      ?auto_5109 - TRUCK
      ?auto_5112 - PLACE
      ?auto_5108 - HOIST
      ?auto_5113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5110 ?auto_5111 ) ( SURFACE-AT ?auto_5107 ?auto_5111 ) ( CLEAR ?auto_5107 ) ( IS-CRATE ?auto_5106 ) ( not ( = ?auto_5106 ?auto_5107 ) ) ( AVAILABLE ?auto_5110 ) ( TRUCK-AT ?auto_5109 ?auto_5112 ) ( not ( = ?auto_5112 ?auto_5111 ) ) ( HOIST-AT ?auto_5108 ?auto_5112 ) ( not ( = ?auto_5110 ?auto_5108 ) ) ( AVAILABLE ?auto_5108 ) ( SURFACE-AT ?auto_5106 ?auto_5112 ) ( ON ?auto_5106 ?auto_5113 ) ( CLEAR ?auto_5106 ) ( not ( = ?auto_5106 ?auto_5113 ) ) ( not ( = ?auto_5107 ?auto_5113 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5108 ?auto_5106 ?auto_5113 ?auto_5112 )
      ( MAKE-ON ?auto_5106 ?auto_5107 )
      ( MAKE-ON-VERIFY ?auto_5106 ?auto_5107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5114 - SURFACE
      ?auto_5115 - SURFACE
    )
    :vars
    (
      ?auto_5120 - HOIST
      ?auto_5121 - PLACE
      ?auto_5116 - PLACE
      ?auto_5119 - HOIST
      ?auto_5118 - SURFACE
      ?auto_5117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5120 ?auto_5121 ) ( SURFACE-AT ?auto_5115 ?auto_5121 ) ( CLEAR ?auto_5115 ) ( IS-CRATE ?auto_5114 ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( AVAILABLE ?auto_5120 ) ( not ( = ?auto_5116 ?auto_5121 ) ) ( HOIST-AT ?auto_5119 ?auto_5116 ) ( not ( = ?auto_5120 ?auto_5119 ) ) ( AVAILABLE ?auto_5119 ) ( SURFACE-AT ?auto_5114 ?auto_5116 ) ( ON ?auto_5114 ?auto_5118 ) ( CLEAR ?auto_5114 ) ( not ( = ?auto_5114 ?auto_5118 ) ) ( not ( = ?auto_5115 ?auto_5118 ) ) ( TRUCK-AT ?auto_5117 ?auto_5121 ) )
    :subtasks
    ( ( !DRIVE ?auto_5117 ?auto_5121 ?auto_5116 )
      ( MAKE-ON ?auto_5114 ?auto_5115 )
      ( MAKE-ON-VERIFY ?auto_5114 ?auto_5115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5162 - SURFACE
      ?auto_5163 - SURFACE
    )
    :vars
    (
      ?auto_5165 - HOIST
      ?auto_5166 - PLACE
      ?auto_5169 - PLACE
      ?auto_5168 - HOIST
      ?auto_5167 - SURFACE
      ?auto_5164 - TRUCK
      ?auto_5170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5165 ?auto_5166 ) ( IS-CRATE ?auto_5162 ) ( not ( = ?auto_5162 ?auto_5163 ) ) ( not ( = ?auto_5169 ?auto_5166 ) ) ( HOIST-AT ?auto_5168 ?auto_5169 ) ( not ( = ?auto_5165 ?auto_5168 ) ) ( AVAILABLE ?auto_5168 ) ( SURFACE-AT ?auto_5162 ?auto_5169 ) ( ON ?auto_5162 ?auto_5167 ) ( CLEAR ?auto_5162 ) ( not ( = ?auto_5162 ?auto_5167 ) ) ( not ( = ?auto_5163 ?auto_5167 ) ) ( TRUCK-AT ?auto_5164 ?auto_5166 ) ( SURFACE-AT ?auto_5170 ?auto_5166 ) ( CLEAR ?auto_5170 ) ( LIFTING ?auto_5165 ?auto_5163 ) ( IS-CRATE ?auto_5163 ) ( not ( = ?auto_5162 ?auto_5170 ) ) ( not ( = ?auto_5163 ?auto_5170 ) ) ( not ( = ?auto_5167 ?auto_5170 ) ) )
    :subtasks
    ( ( !DROP ?auto_5165 ?auto_5163 ?auto_5170 ?auto_5166 )
      ( MAKE-ON ?auto_5162 ?auto_5163 )
      ( MAKE-ON-VERIFY ?auto_5162 ?auto_5163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5171 - SURFACE
      ?auto_5172 - SURFACE
    )
    :vars
    (
      ?auto_5177 - HOIST
      ?auto_5173 - PLACE
      ?auto_5178 - PLACE
      ?auto_5175 - HOIST
      ?auto_5176 - SURFACE
      ?auto_5174 - TRUCK
      ?auto_5179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5177 ?auto_5173 ) ( IS-CRATE ?auto_5171 ) ( not ( = ?auto_5171 ?auto_5172 ) ) ( not ( = ?auto_5178 ?auto_5173 ) ) ( HOIST-AT ?auto_5175 ?auto_5178 ) ( not ( = ?auto_5177 ?auto_5175 ) ) ( AVAILABLE ?auto_5175 ) ( SURFACE-AT ?auto_5171 ?auto_5178 ) ( ON ?auto_5171 ?auto_5176 ) ( CLEAR ?auto_5171 ) ( not ( = ?auto_5171 ?auto_5176 ) ) ( not ( = ?auto_5172 ?auto_5176 ) ) ( TRUCK-AT ?auto_5174 ?auto_5173 ) ( SURFACE-AT ?auto_5179 ?auto_5173 ) ( CLEAR ?auto_5179 ) ( IS-CRATE ?auto_5172 ) ( not ( = ?auto_5171 ?auto_5179 ) ) ( not ( = ?auto_5172 ?auto_5179 ) ) ( not ( = ?auto_5176 ?auto_5179 ) ) ( AVAILABLE ?auto_5177 ) ( IN ?auto_5172 ?auto_5174 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5177 ?auto_5172 ?auto_5174 ?auto_5173 )
      ( MAKE-ON ?auto_5171 ?auto_5172 )
      ( MAKE-ON-VERIFY ?auto_5171 ?auto_5172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5186 - SURFACE
      ?auto_5187 - SURFACE
    )
    :vars
    (
      ?auto_5193 - HOIST
      ?auto_5189 - PLACE
      ?auto_5191 - PLACE
      ?auto_5192 - HOIST
      ?auto_5188 - SURFACE
      ?auto_5190 - TRUCK
      ?auto_5194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5193 ?auto_5189 ) ( SURFACE-AT ?auto_5187 ?auto_5189 ) ( CLEAR ?auto_5187 ) ( IS-CRATE ?auto_5186 ) ( not ( = ?auto_5186 ?auto_5187 ) ) ( AVAILABLE ?auto_5193 ) ( not ( = ?auto_5191 ?auto_5189 ) ) ( HOIST-AT ?auto_5192 ?auto_5191 ) ( not ( = ?auto_5193 ?auto_5192 ) ) ( AVAILABLE ?auto_5192 ) ( SURFACE-AT ?auto_5186 ?auto_5191 ) ( ON ?auto_5186 ?auto_5188 ) ( CLEAR ?auto_5186 ) ( not ( = ?auto_5186 ?auto_5188 ) ) ( not ( = ?auto_5187 ?auto_5188 ) ) ( TRUCK-AT ?auto_5190 ?auto_5194 ) ( not ( = ?auto_5194 ?auto_5189 ) ) ( not ( = ?auto_5191 ?auto_5194 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5190 ?auto_5194 ?auto_5189 )
      ( MAKE-ON ?auto_5186 ?auto_5187 )
      ( MAKE-ON-VERIFY ?auto_5186 ?auto_5187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5253 - SURFACE
      ?auto_5254 - SURFACE
    )
    :vars
    (
      ?auto_5255 - HOIST
      ?auto_5257 - PLACE
      ?auto_5258 - PLACE
      ?auto_5259 - HOIST
      ?auto_5261 - SURFACE
      ?auto_5256 - SURFACE
      ?auto_5260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5255 ?auto_5257 ) ( IS-CRATE ?auto_5253 ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5258 ?auto_5257 ) ) ( HOIST-AT ?auto_5259 ?auto_5258 ) ( not ( = ?auto_5255 ?auto_5259 ) ) ( AVAILABLE ?auto_5259 ) ( SURFACE-AT ?auto_5253 ?auto_5258 ) ( ON ?auto_5253 ?auto_5261 ) ( CLEAR ?auto_5253 ) ( not ( = ?auto_5253 ?auto_5261 ) ) ( not ( = ?auto_5254 ?auto_5261 ) ) ( SURFACE-AT ?auto_5256 ?auto_5257 ) ( CLEAR ?auto_5256 ) ( IS-CRATE ?auto_5254 ) ( not ( = ?auto_5253 ?auto_5256 ) ) ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5261 ?auto_5256 ) ) ( AVAILABLE ?auto_5255 ) ( IN ?auto_5254 ?auto_5260 ) ( TRUCK-AT ?auto_5260 ?auto_5258 ) )
    :subtasks
    ( ( !DRIVE ?auto_5260 ?auto_5258 ?auto_5257 )
      ( MAKE-ON ?auto_5253 ?auto_5254 )
      ( MAKE-ON-VERIFY ?auto_5253 ?auto_5254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5262 - SURFACE
      ?auto_5263 - SURFACE
    )
    :vars
    (
      ?auto_5266 - HOIST
      ?auto_5267 - PLACE
      ?auto_5270 - PLACE
      ?auto_5265 - HOIST
      ?auto_5268 - SURFACE
      ?auto_5264 - SURFACE
      ?auto_5269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5266 ?auto_5267 ) ( IS-CRATE ?auto_5262 ) ( not ( = ?auto_5262 ?auto_5263 ) ) ( not ( = ?auto_5270 ?auto_5267 ) ) ( HOIST-AT ?auto_5265 ?auto_5270 ) ( not ( = ?auto_5266 ?auto_5265 ) ) ( SURFACE-AT ?auto_5262 ?auto_5270 ) ( ON ?auto_5262 ?auto_5268 ) ( CLEAR ?auto_5262 ) ( not ( = ?auto_5262 ?auto_5268 ) ) ( not ( = ?auto_5263 ?auto_5268 ) ) ( SURFACE-AT ?auto_5264 ?auto_5267 ) ( CLEAR ?auto_5264 ) ( IS-CRATE ?auto_5263 ) ( not ( = ?auto_5262 ?auto_5264 ) ) ( not ( = ?auto_5263 ?auto_5264 ) ) ( not ( = ?auto_5268 ?auto_5264 ) ) ( AVAILABLE ?auto_5266 ) ( TRUCK-AT ?auto_5269 ?auto_5270 ) ( LIFTING ?auto_5265 ?auto_5263 ) )
    :subtasks
    ( ( !LOAD ?auto_5265 ?auto_5263 ?auto_5269 ?auto_5270 )
      ( MAKE-ON ?auto_5262 ?auto_5263 )
      ( MAKE-ON-VERIFY ?auto_5262 ?auto_5263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5271 - SURFACE
      ?auto_5272 - SURFACE
    )
    :vars
    (
      ?auto_5275 - HOIST
      ?auto_5273 - PLACE
      ?auto_5274 - PLACE
      ?auto_5279 - HOIST
      ?auto_5277 - SURFACE
      ?auto_5276 - SURFACE
      ?auto_5278 - TRUCK
      ?auto_5280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5275 ?auto_5273 ) ( IS-CRATE ?auto_5271 ) ( not ( = ?auto_5271 ?auto_5272 ) ) ( not ( = ?auto_5274 ?auto_5273 ) ) ( HOIST-AT ?auto_5279 ?auto_5274 ) ( not ( = ?auto_5275 ?auto_5279 ) ) ( SURFACE-AT ?auto_5271 ?auto_5274 ) ( ON ?auto_5271 ?auto_5277 ) ( CLEAR ?auto_5271 ) ( not ( = ?auto_5271 ?auto_5277 ) ) ( not ( = ?auto_5272 ?auto_5277 ) ) ( SURFACE-AT ?auto_5276 ?auto_5273 ) ( CLEAR ?auto_5276 ) ( IS-CRATE ?auto_5272 ) ( not ( = ?auto_5271 ?auto_5276 ) ) ( not ( = ?auto_5272 ?auto_5276 ) ) ( not ( = ?auto_5277 ?auto_5276 ) ) ( AVAILABLE ?auto_5275 ) ( TRUCK-AT ?auto_5278 ?auto_5274 ) ( AVAILABLE ?auto_5279 ) ( SURFACE-AT ?auto_5272 ?auto_5274 ) ( ON ?auto_5272 ?auto_5280 ) ( CLEAR ?auto_5272 ) ( not ( = ?auto_5271 ?auto_5280 ) ) ( not ( = ?auto_5272 ?auto_5280 ) ) ( not ( = ?auto_5277 ?auto_5280 ) ) ( not ( = ?auto_5276 ?auto_5280 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5279 ?auto_5272 ?auto_5280 ?auto_5274 )
      ( MAKE-ON ?auto_5271 ?auto_5272 )
      ( MAKE-ON-VERIFY ?auto_5271 ?auto_5272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5281 - SURFACE
      ?auto_5282 - SURFACE
    )
    :vars
    (
      ?auto_5290 - HOIST
      ?auto_5283 - PLACE
      ?auto_5288 - PLACE
      ?auto_5285 - HOIST
      ?auto_5284 - SURFACE
      ?auto_5289 - SURFACE
      ?auto_5286 - SURFACE
      ?auto_5287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5290 ?auto_5283 ) ( IS-CRATE ?auto_5281 ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5288 ?auto_5283 ) ) ( HOIST-AT ?auto_5285 ?auto_5288 ) ( not ( = ?auto_5290 ?auto_5285 ) ) ( SURFACE-AT ?auto_5281 ?auto_5288 ) ( ON ?auto_5281 ?auto_5284 ) ( CLEAR ?auto_5281 ) ( not ( = ?auto_5281 ?auto_5284 ) ) ( not ( = ?auto_5282 ?auto_5284 ) ) ( SURFACE-AT ?auto_5289 ?auto_5283 ) ( CLEAR ?auto_5289 ) ( IS-CRATE ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5289 ) ) ( not ( = ?auto_5282 ?auto_5289 ) ) ( not ( = ?auto_5284 ?auto_5289 ) ) ( AVAILABLE ?auto_5290 ) ( AVAILABLE ?auto_5285 ) ( SURFACE-AT ?auto_5282 ?auto_5288 ) ( ON ?auto_5282 ?auto_5286 ) ( CLEAR ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5286 ) ) ( not ( = ?auto_5282 ?auto_5286 ) ) ( not ( = ?auto_5284 ?auto_5286 ) ) ( not ( = ?auto_5289 ?auto_5286 ) ) ( TRUCK-AT ?auto_5287 ?auto_5283 ) )
    :subtasks
    ( ( !DRIVE ?auto_5287 ?auto_5283 ?auto_5288 )
      ( MAKE-ON ?auto_5281 ?auto_5282 )
      ( MAKE-ON-VERIFY ?auto_5281 ?auto_5282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5291 - SURFACE
      ?auto_5292 - SURFACE
    )
    :vars
    (
      ?auto_5300 - HOIST
      ?auto_5295 - PLACE
      ?auto_5293 - PLACE
      ?auto_5296 - HOIST
      ?auto_5294 - SURFACE
      ?auto_5299 - SURFACE
      ?auto_5298 - SURFACE
      ?auto_5297 - TRUCK
      ?auto_5301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5300 ?auto_5295 ) ( IS-CRATE ?auto_5291 ) ( not ( = ?auto_5291 ?auto_5292 ) ) ( not ( = ?auto_5293 ?auto_5295 ) ) ( HOIST-AT ?auto_5296 ?auto_5293 ) ( not ( = ?auto_5300 ?auto_5296 ) ) ( SURFACE-AT ?auto_5291 ?auto_5293 ) ( ON ?auto_5291 ?auto_5294 ) ( CLEAR ?auto_5291 ) ( not ( = ?auto_5291 ?auto_5294 ) ) ( not ( = ?auto_5292 ?auto_5294 ) ) ( IS-CRATE ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5299 ) ) ( not ( = ?auto_5292 ?auto_5299 ) ) ( not ( = ?auto_5294 ?auto_5299 ) ) ( AVAILABLE ?auto_5296 ) ( SURFACE-AT ?auto_5292 ?auto_5293 ) ( ON ?auto_5292 ?auto_5298 ) ( CLEAR ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5298 ) ) ( not ( = ?auto_5292 ?auto_5298 ) ) ( not ( = ?auto_5294 ?auto_5298 ) ) ( not ( = ?auto_5299 ?auto_5298 ) ) ( TRUCK-AT ?auto_5297 ?auto_5295 ) ( SURFACE-AT ?auto_5301 ?auto_5295 ) ( CLEAR ?auto_5301 ) ( LIFTING ?auto_5300 ?auto_5299 ) ( IS-CRATE ?auto_5299 ) ( not ( = ?auto_5291 ?auto_5301 ) ) ( not ( = ?auto_5292 ?auto_5301 ) ) ( not ( = ?auto_5294 ?auto_5301 ) ) ( not ( = ?auto_5299 ?auto_5301 ) ) ( not ( = ?auto_5298 ?auto_5301 ) ) )
    :subtasks
    ( ( !DROP ?auto_5300 ?auto_5299 ?auto_5301 ?auto_5295 )
      ( MAKE-ON ?auto_5291 ?auto_5292 )
      ( MAKE-ON-VERIFY ?auto_5291 ?auto_5292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5391 - SURFACE
      ?auto_5392 - SURFACE
    )
    :vars
    (
      ?auto_5396 - HOIST
      ?auto_5394 - PLACE
      ?auto_5393 - PLACE
      ?auto_5395 - HOIST
      ?auto_5397 - SURFACE
      ?auto_5398 - TRUCK
      ?auto_5399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5396 ?auto_5394 ) ( SURFACE-AT ?auto_5392 ?auto_5394 ) ( CLEAR ?auto_5392 ) ( IS-CRATE ?auto_5391 ) ( not ( = ?auto_5391 ?auto_5392 ) ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( HOIST-AT ?auto_5395 ?auto_5393 ) ( not ( = ?auto_5396 ?auto_5395 ) ) ( AVAILABLE ?auto_5395 ) ( SURFACE-AT ?auto_5391 ?auto_5393 ) ( ON ?auto_5391 ?auto_5397 ) ( CLEAR ?auto_5391 ) ( not ( = ?auto_5391 ?auto_5397 ) ) ( not ( = ?auto_5392 ?auto_5397 ) ) ( TRUCK-AT ?auto_5398 ?auto_5394 ) ( LIFTING ?auto_5396 ?auto_5399 ) ( IS-CRATE ?auto_5399 ) ( not ( = ?auto_5391 ?auto_5399 ) ) ( not ( = ?auto_5392 ?auto_5399 ) ) ( not ( = ?auto_5397 ?auto_5399 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5396 ?auto_5399 ?auto_5398 ?auto_5394 )
      ( MAKE-ON ?auto_5391 ?auto_5392 )
      ( MAKE-ON-VERIFY ?auto_5391 ?auto_5392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5410 - SURFACE
      ?auto_5411 - SURFACE
    )
    :vars
    (
      ?auto_5415 - HOIST
      ?auto_5417 - PLACE
      ?auto_5414 - TRUCK
      ?auto_5416 - PLACE
      ?auto_5413 - HOIST
      ?auto_5412 - SURFACE
      ?auto_5418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5415 ?auto_5417 ) ( SURFACE-AT ?auto_5411 ?auto_5417 ) ( CLEAR ?auto_5411 ) ( IS-CRATE ?auto_5410 ) ( not ( = ?auto_5410 ?auto_5411 ) ) ( AVAILABLE ?auto_5415 ) ( TRUCK-AT ?auto_5414 ?auto_5416 ) ( not ( = ?auto_5416 ?auto_5417 ) ) ( HOIST-AT ?auto_5413 ?auto_5416 ) ( not ( = ?auto_5415 ?auto_5413 ) ) ( SURFACE-AT ?auto_5410 ?auto_5416 ) ( ON ?auto_5410 ?auto_5412 ) ( CLEAR ?auto_5410 ) ( not ( = ?auto_5410 ?auto_5412 ) ) ( not ( = ?auto_5411 ?auto_5412 ) ) ( LIFTING ?auto_5413 ?auto_5418 ) ( IS-CRATE ?auto_5418 ) ( not ( = ?auto_5410 ?auto_5418 ) ) ( not ( = ?auto_5411 ?auto_5418 ) ) ( not ( = ?auto_5412 ?auto_5418 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5413 ?auto_5418 ?auto_5414 ?auto_5416 )
      ( MAKE-ON ?auto_5410 ?auto_5411 )
      ( MAKE-ON-VERIFY ?auto_5410 ?auto_5411 ) )
  )

)

