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

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15186 - SURFACE
      ?auto_15187 - SURFACE
    )
    :vars
    (
      ?auto_15188 - HOIST
      ?auto_15189 - PLACE
      ?auto_15191 - PLACE
      ?auto_15192 - HOIST
      ?auto_15193 - SURFACE
      ?auto_15190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15188 ?auto_15189 ) ( SURFACE-AT ?auto_15186 ?auto_15189 ) ( CLEAR ?auto_15186 ) ( IS-CRATE ?auto_15187 ) ( AVAILABLE ?auto_15188 ) ( not ( = ?auto_15191 ?auto_15189 ) ) ( HOIST-AT ?auto_15192 ?auto_15191 ) ( AVAILABLE ?auto_15192 ) ( SURFACE-AT ?auto_15187 ?auto_15191 ) ( ON ?auto_15187 ?auto_15193 ) ( CLEAR ?auto_15187 ) ( TRUCK-AT ?auto_15190 ?auto_15189 ) ( not ( = ?auto_15186 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15193 ) ) ( not ( = ?auto_15187 ?auto_15193 ) ) ( not ( = ?auto_15188 ?auto_15192 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15190 ?auto_15189 ?auto_15191 )
      ( !LIFT ?auto_15192 ?auto_15187 ?auto_15193 ?auto_15191 )
      ( !LOAD ?auto_15192 ?auto_15187 ?auto_15190 ?auto_15191 )
      ( !DRIVE ?auto_15190 ?auto_15191 ?auto_15189 )
      ( !UNLOAD ?auto_15188 ?auto_15187 ?auto_15190 ?auto_15189 )
      ( !DROP ?auto_15188 ?auto_15187 ?auto_15186 ?auto_15189 )
      ( MAKE-1CRATE-VERIFY ?auto_15186 ?auto_15187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15207 - SURFACE
      ?auto_15208 - SURFACE
      ?auto_15209 - SURFACE
    )
    :vars
    (
      ?auto_15212 - HOIST
      ?auto_15210 - PLACE
      ?auto_15211 - PLACE
      ?auto_15214 - HOIST
      ?auto_15213 - SURFACE
      ?auto_15216 - PLACE
      ?auto_15218 - HOIST
      ?auto_15217 - SURFACE
      ?auto_15215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15212 ?auto_15210 ) ( IS-CRATE ?auto_15209 ) ( not ( = ?auto_15211 ?auto_15210 ) ) ( HOIST-AT ?auto_15214 ?auto_15211 ) ( AVAILABLE ?auto_15214 ) ( SURFACE-AT ?auto_15209 ?auto_15211 ) ( ON ?auto_15209 ?auto_15213 ) ( CLEAR ?auto_15209 ) ( not ( = ?auto_15208 ?auto_15209 ) ) ( not ( = ?auto_15208 ?auto_15213 ) ) ( not ( = ?auto_15209 ?auto_15213 ) ) ( not ( = ?auto_15212 ?auto_15214 ) ) ( SURFACE-AT ?auto_15207 ?auto_15210 ) ( CLEAR ?auto_15207 ) ( IS-CRATE ?auto_15208 ) ( AVAILABLE ?auto_15212 ) ( not ( = ?auto_15216 ?auto_15210 ) ) ( HOIST-AT ?auto_15218 ?auto_15216 ) ( AVAILABLE ?auto_15218 ) ( SURFACE-AT ?auto_15208 ?auto_15216 ) ( ON ?auto_15208 ?auto_15217 ) ( CLEAR ?auto_15208 ) ( TRUCK-AT ?auto_15215 ?auto_15210 ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15217 ) ) ( not ( = ?auto_15208 ?auto_15217 ) ) ( not ( = ?auto_15212 ?auto_15218 ) ) ( not ( = ?auto_15207 ?auto_15209 ) ) ( not ( = ?auto_15207 ?auto_15213 ) ) ( not ( = ?auto_15209 ?auto_15217 ) ) ( not ( = ?auto_15211 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15218 ) ) ( not ( = ?auto_15213 ?auto_15217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15207 ?auto_15208 )
      ( MAKE-1CRATE ?auto_15208 ?auto_15209 )
      ( MAKE-2CRATE-VERIFY ?auto_15207 ?auto_15208 ?auto_15209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15233 - SURFACE
      ?auto_15234 - SURFACE
      ?auto_15235 - SURFACE
      ?auto_15236 - SURFACE
    )
    :vars
    (
      ?auto_15241 - HOIST
      ?auto_15240 - PLACE
      ?auto_15237 - PLACE
      ?auto_15239 - HOIST
      ?auto_15242 - SURFACE
      ?auto_15248 - PLACE
      ?auto_15247 - HOIST
      ?auto_15244 - SURFACE
      ?auto_15243 - PLACE
      ?auto_15246 - HOIST
      ?auto_15245 - SURFACE
      ?auto_15238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15241 ?auto_15240 ) ( IS-CRATE ?auto_15236 ) ( not ( = ?auto_15237 ?auto_15240 ) ) ( HOIST-AT ?auto_15239 ?auto_15237 ) ( AVAILABLE ?auto_15239 ) ( SURFACE-AT ?auto_15236 ?auto_15237 ) ( ON ?auto_15236 ?auto_15242 ) ( CLEAR ?auto_15236 ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15242 ) ) ( not ( = ?auto_15236 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15239 ) ) ( IS-CRATE ?auto_15235 ) ( not ( = ?auto_15248 ?auto_15240 ) ) ( HOIST-AT ?auto_15247 ?auto_15248 ) ( AVAILABLE ?auto_15247 ) ( SURFACE-AT ?auto_15235 ?auto_15248 ) ( ON ?auto_15235 ?auto_15244 ) ( CLEAR ?auto_15235 ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( not ( = ?auto_15234 ?auto_15244 ) ) ( not ( = ?auto_15235 ?auto_15244 ) ) ( not ( = ?auto_15241 ?auto_15247 ) ) ( SURFACE-AT ?auto_15233 ?auto_15240 ) ( CLEAR ?auto_15233 ) ( IS-CRATE ?auto_15234 ) ( AVAILABLE ?auto_15241 ) ( not ( = ?auto_15243 ?auto_15240 ) ) ( HOIST-AT ?auto_15246 ?auto_15243 ) ( AVAILABLE ?auto_15246 ) ( SURFACE-AT ?auto_15234 ?auto_15243 ) ( ON ?auto_15234 ?auto_15245 ) ( CLEAR ?auto_15234 ) ( TRUCK-AT ?auto_15238 ?auto_15240 ) ( not ( = ?auto_15233 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15245 ) ) ( not ( = ?auto_15234 ?auto_15245 ) ) ( not ( = ?auto_15241 ?auto_15246 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15244 ) ) ( not ( = ?auto_15235 ?auto_15245 ) ) ( not ( = ?auto_15248 ?auto_15243 ) ) ( not ( = ?auto_15247 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15245 ) ) ( not ( = ?auto_15233 ?auto_15236 ) ) ( not ( = ?auto_15233 ?auto_15242 ) ) ( not ( = ?auto_15234 ?auto_15236 ) ) ( not ( = ?auto_15234 ?auto_15242 ) ) ( not ( = ?auto_15236 ?auto_15244 ) ) ( not ( = ?auto_15236 ?auto_15245 ) ) ( not ( = ?auto_15237 ?auto_15248 ) ) ( not ( = ?auto_15237 ?auto_15243 ) ) ( not ( = ?auto_15239 ?auto_15247 ) ) ( not ( = ?auto_15239 ?auto_15246 ) ) ( not ( = ?auto_15242 ?auto_15244 ) ) ( not ( = ?auto_15242 ?auto_15245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15233 ?auto_15234 ?auto_15235 )
      ( MAKE-1CRATE ?auto_15235 ?auto_15236 )
      ( MAKE-3CRATE-VERIFY ?auto_15233 ?auto_15234 ?auto_15235 ?auto_15236 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15264 - SURFACE
      ?auto_15265 - SURFACE
      ?auto_15266 - SURFACE
      ?auto_15267 - SURFACE
      ?auto_15268 - SURFACE
    )
    :vars
    (
      ?auto_15273 - HOIST
      ?auto_15269 - PLACE
      ?auto_15271 - PLACE
      ?auto_15274 - HOIST
      ?auto_15272 - SURFACE
      ?auto_15282 - PLACE
      ?auto_15281 - HOIST
      ?auto_15283 - SURFACE
      ?auto_15275 - PLACE
      ?auto_15276 - HOIST
      ?auto_15280 - SURFACE
      ?auto_15279 - PLACE
      ?auto_15278 - HOIST
      ?auto_15277 - SURFACE
      ?auto_15270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15273 ?auto_15269 ) ( IS-CRATE ?auto_15268 ) ( not ( = ?auto_15271 ?auto_15269 ) ) ( HOIST-AT ?auto_15274 ?auto_15271 ) ( AVAILABLE ?auto_15274 ) ( SURFACE-AT ?auto_15268 ?auto_15271 ) ( ON ?auto_15268 ?auto_15272 ) ( CLEAR ?auto_15268 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15272 ) ) ( not ( = ?auto_15268 ?auto_15272 ) ) ( not ( = ?auto_15273 ?auto_15274 ) ) ( IS-CRATE ?auto_15267 ) ( not ( = ?auto_15282 ?auto_15269 ) ) ( HOIST-AT ?auto_15281 ?auto_15282 ) ( AVAILABLE ?auto_15281 ) ( SURFACE-AT ?auto_15267 ?auto_15282 ) ( ON ?auto_15267 ?auto_15283 ) ( CLEAR ?auto_15267 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15283 ) ) ( not ( = ?auto_15267 ?auto_15283 ) ) ( not ( = ?auto_15273 ?auto_15281 ) ) ( IS-CRATE ?auto_15266 ) ( not ( = ?auto_15275 ?auto_15269 ) ) ( HOIST-AT ?auto_15276 ?auto_15275 ) ( AVAILABLE ?auto_15276 ) ( SURFACE-AT ?auto_15266 ?auto_15275 ) ( ON ?auto_15266 ?auto_15280 ) ( CLEAR ?auto_15266 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15280 ) ) ( not ( = ?auto_15266 ?auto_15280 ) ) ( not ( = ?auto_15273 ?auto_15276 ) ) ( SURFACE-AT ?auto_15264 ?auto_15269 ) ( CLEAR ?auto_15264 ) ( IS-CRATE ?auto_15265 ) ( AVAILABLE ?auto_15273 ) ( not ( = ?auto_15279 ?auto_15269 ) ) ( HOIST-AT ?auto_15278 ?auto_15279 ) ( AVAILABLE ?auto_15278 ) ( SURFACE-AT ?auto_15265 ?auto_15279 ) ( ON ?auto_15265 ?auto_15277 ) ( CLEAR ?auto_15265 ) ( TRUCK-AT ?auto_15270 ?auto_15269 ) ( not ( = ?auto_15264 ?auto_15265 ) ) ( not ( = ?auto_15264 ?auto_15277 ) ) ( not ( = ?auto_15265 ?auto_15277 ) ) ( not ( = ?auto_15273 ?auto_15278 ) ) ( not ( = ?auto_15264 ?auto_15266 ) ) ( not ( = ?auto_15264 ?auto_15280 ) ) ( not ( = ?auto_15266 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15279 ) ) ( not ( = ?auto_15276 ?auto_15278 ) ) ( not ( = ?auto_15280 ?auto_15277 ) ) ( not ( = ?auto_15264 ?auto_15267 ) ) ( not ( = ?auto_15264 ?auto_15283 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15283 ) ) ( not ( = ?auto_15267 ?auto_15280 ) ) ( not ( = ?auto_15267 ?auto_15277 ) ) ( not ( = ?auto_15282 ?auto_15275 ) ) ( not ( = ?auto_15282 ?auto_15279 ) ) ( not ( = ?auto_15281 ?auto_15276 ) ) ( not ( = ?auto_15281 ?auto_15278 ) ) ( not ( = ?auto_15283 ?auto_15280 ) ) ( not ( = ?auto_15283 ?auto_15277 ) ) ( not ( = ?auto_15264 ?auto_15268 ) ) ( not ( = ?auto_15264 ?auto_15272 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15272 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15272 ) ) ( not ( = ?auto_15268 ?auto_15283 ) ) ( not ( = ?auto_15268 ?auto_15280 ) ) ( not ( = ?auto_15268 ?auto_15277 ) ) ( not ( = ?auto_15271 ?auto_15282 ) ) ( not ( = ?auto_15271 ?auto_15275 ) ) ( not ( = ?auto_15271 ?auto_15279 ) ) ( not ( = ?auto_15274 ?auto_15281 ) ) ( not ( = ?auto_15274 ?auto_15276 ) ) ( not ( = ?auto_15274 ?auto_15278 ) ) ( not ( = ?auto_15272 ?auto_15283 ) ) ( not ( = ?auto_15272 ?auto_15280 ) ) ( not ( = ?auto_15272 ?auto_15277 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15264 ?auto_15265 ?auto_15266 ?auto_15267 )
      ( MAKE-1CRATE ?auto_15267 ?auto_15268 )
      ( MAKE-4CRATE-VERIFY ?auto_15264 ?auto_15265 ?auto_15266 ?auto_15267 ?auto_15268 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15300 - SURFACE
      ?auto_15301 - SURFACE
      ?auto_15302 - SURFACE
      ?auto_15303 - SURFACE
      ?auto_15304 - SURFACE
      ?auto_15305 - SURFACE
    )
    :vars
    (
      ?auto_15307 - HOIST
      ?auto_15306 - PLACE
      ?auto_15311 - PLACE
      ?auto_15310 - HOIST
      ?auto_15308 - SURFACE
      ?auto_15320 - PLACE
      ?auto_15313 - HOIST
      ?auto_15323 - SURFACE
      ?auto_15312 - PLACE
      ?auto_15317 - HOIST
      ?auto_15321 - SURFACE
      ?auto_15322 - PLACE
      ?auto_15315 - HOIST
      ?auto_15318 - SURFACE
      ?auto_15319 - PLACE
      ?auto_15316 - HOIST
      ?auto_15314 - SURFACE
      ?auto_15309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15307 ?auto_15306 ) ( IS-CRATE ?auto_15305 ) ( not ( = ?auto_15311 ?auto_15306 ) ) ( HOIST-AT ?auto_15310 ?auto_15311 ) ( AVAILABLE ?auto_15310 ) ( SURFACE-AT ?auto_15305 ?auto_15311 ) ( ON ?auto_15305 ?auto_15308 ) ( CLEAR ?auto_15305 ) ( not ( = ?auto_15304 ?auto_15305 ) ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15307 ?auto_15310 ) ) ( IS-CRATE ?auto_15304 ) ( not ( = ?auto_15320 ?auto_15306 ) ) ( HOIST-AT ?auto_15313 ?auto_15320 ) ( AVAILABLE ?auto_15313 ) ( SURFACE-AT ?auto_15304 ?auto_15320 ) ( ON ?auto_15304 ?auto_15323 ) ( CLEAR ?auto_15304 ) ( not ( = ?auto_15303 ?auto_15304 ) ) ( not ( = ?auto_15303 ?auto_15323 ) ) ( not ( = ?auto_15304 ?auto_15323 ) ) ( not ( = ?auto_15307 ?auto_15313 ) ) ( IS-CRATE ?auto_15303 ) ( not ( = ?auto_15312 ?auto_15306 ) ) ( HOIST-AT ?auto_15317 ?auto_15312 ) ( AVAILABLE ?auto_15317 ) ( SURFACE-AT ?auto_15303 ?auto_15312 ) ( ON ?auto_15303 ?auto_15321 ) ( CLEAR ?auto_15303 ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( not ( = ?auto_15302 ?auto_15321 ) ) ( not ( = ?auto_15303 ?auto_15321 ) ) ( not ( = ?auto_15307 ?auto_15317 ) ) ( IS-CRATE ?auto_15302 ) ( not ( = ?auto_15322 ?auto_15306 ) ) ( HOIST-AT ?auto_15315 ?auto_15322 ) ( AVAILABLE ?auto_15315 ) ( SURFACE-AT ?auto_15302 ?auto_15322 ) ( ON ?auto_15302 ?auto_15318 ) ( CLEAR ?auto_15302 ) ( not ( = ?auto_15301 ?auto_15302 ) ) ( not ( = ?auto_15301 ?auto_15318 ) ) ( not ( = ?auto_15302 ?auto_15318 ) ) ( not ( = ?auto_15307 ?auto_15315 ) ) ( SURFACE-AT ?auto_15300 ?auto_15306 ) ( CLEAR ?auto_15300 ) ( IS-CRATE ?auto_15301 ) ( AVAILABLE ?auto_15307 ) ( not ( = ?auto_15319 ?auto_15306 ) ) ( HOIST-AT ?auto_15316 ?auto_15319 ) ( AVAILABLE ?auto_15316 ) ( SURFACE-AT ?auto_15301 ?auto_15319 ) ( ON ?auto_15301 ?auto_15314 ) ( CLEAR ?auto_15301 ) ( TRUCK-AT ?auto_15309 ?auto_15306 ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( not ( = ?auto_15300 ?auto_15314 ) ) ( not ( = ?auto_15301 ?auto_15314 ) ) ( not ( = ?auto_15307 ?auto_15316 ) ) ( not ( = ?auto_15300 ?auto_15302 ) ) ( not ( = ?auto_15300 ?auto_15318 ) ) ( not ( = ?auto_15302 ?auto_15314 ) ) ( not ( = ?auto_15322 ?auto_15319 ) ) ( not ( = ?auto_15315 ?auto_15316 ) ) ( not ( = ?auto_15318 ?auto_15314 ) ) ( not ( = ?auto_15300 ?auto_15303 ) ) ( not ( = ?auto_15300 ?auto_15321 ) ) ( not ( = ?auto_15301 ?auto_15303 ) ) ( not ( = ?auto_15301 ?auto_15321 ) ) ( not ( = ?auto_15303 ?auto_15318 ) ) ( not ( = ?auto_15303 ?auto_15314 ) ) ( not ( = ?auto_15312 ?auto_15322 ) ) ( not ( = ?auto_15312 ?auto_15319 ) ) ( not ( = ?auto_15317 ?auto_15315 ) ) ( not ( = ?auto_15317 ?auto_15316 ) ) ( not ( = ?auto_15321 ?auto_15318 ) ) ( not ( = ?auto_15321 ?auto_15314 ) ) ( not ( = ?auto_15300 ?auto_15304 ) ) ( not ( = ?auto_15300 ?auto_15323 ) ) ( not ( = ?auto_15301 ?auto_15304 ) ) ( not ( = ?auto_15301 ?auto_15323 ) ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( not ( = ?auto_15302 ?auto_15323 ) ) ( not ( = ?auto_15304 ?auto_15321 ) ) ( not ( = ?auto_15304 ?auto_15318 ) ) ( not ( = ?auto_15304 ?auto_15314 ) ) ( not ( = ?auto_15320 ?auto_15312 ) ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15320 ?auto_15319 ) ) ( not ( = ?auto_15313 ?auto_15317 ) ) ( not ( = ?auto_15313 ?auto_15315 ) ) ( not ( = ?auto_15313 ?auto_15316 ) ) ( not ( = ?auto_15323 ?auto_15321 ) ) ( not ( = ?auto_15323 ?auto_15318 ) ) ( not ( = ?auto_15323 ?auto_15314 ) ) ( not ( = ?auto_15300 ?auto_15305 ) ) ( not ( = ?auto_15300 ?auto_15308 ) ) ( not ( = ?auto_15301 ?auto_15305 ) ) ( not ( = ?auto_15301 ?auto_15308 ) ) ( not ( = ?auto_15302 ?auto_15305 ) ) ( not ( = ?auto_15302 ?auto_15308 ) ) ( not ( = ?auto_15303 ?auto_15305 ) ) ( not ( = ?auto_15303 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15323 ) ) ( not ( = ?auto_15305 ?auto_15321 ) ) ( not ( = ?auto_15305 ?auto_15318 ) ) ( not ( = ?auto_15305 ?auto_15314 ) ) ( not ( = ?auto_15311 ?auto_15320 ) ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( not ( = ?auto_15311 ?auto_15322 ) ) ( not ( = ?auto_15311 ?auto_15319 ) ) ( not ( = ?auto_15310 ?auto_15313 ) ) ( not ( = ?auto_15310 ?auto_15317 ) ) ( not ( = ?auto_15310 ?auto_15315 ) ) ( not ( = ?auto_15310 ?auto_15316 ) ) ( not ( = ?auto_15308 ?auto_15323 ) ) ( not ( = ?auto_15308 ?auto_15321 ) ) ( not ( = ?auto_15308 ?auto_15318 ) ) ( not ( = ?auto_15308 ?auto_15314 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15300 ?auto_15301 ?auto_15302 ?auto_15303 ?auto_15304 )
      ( MAKE-1CRATE ?auto_15304 ?auto_15305 )
      ( MAKE-5CRATE-VERIFY ?auto_15300 ?auto_15301 ?auto_15302 ?auto_15303 ?auto_15304 ?auto_15305 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15341 - SURFACE
      ?auto_15342 - SURFACE
      ?auto_15343 - SURFACE
      ?auto_15344 - SURFACE
      ?auto_15345 - SURFACE
      ?auto_15346 - SURFACE
      ?auto_15347 - SURFACE
    )
    :vars
    (
      ?auto_15351 - HOIST
      ?auto_15348 - PLACE
      ?auto_15353 - PLACE
      ?auto_15352 - HOIST
      ?auto_15349 - SURFACE
      ?auto_15363 - PLACE
      ?auto_15364 - HOIST
      ?auto_15354 - SURFACE
      ?auto_15355 - PLACE
      ?auto_15357 - HOIST
      ?auto_15360 - SURFACE
      ?auto_15367 - PLACE
      ?auto_15362 - HOIST
      ?auto_15359 - SURFACE
      ?auto_15368 - PLACE
      ?auto_15356 - HOIST
      ?auto_15361 - SURFACE
      ?auto_15366 - PLACE
      ?auto_15365 - HOIST
      ?auto_15358 - SURFACE
      ?auto_15350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15351 ?auto_15348 ) ( IS-CRATE ?auto_15347 ) ( not ( = ?auto_15353 ?auto_15348 ) ) ( HOIST-AT ?auto_15352 ?auto_15353 ) ( AVAILABLE ?auto_15352 ) ( SURFACE-AT ?auto_15347 ?auto_15353 ) ( ON ?auto_15347 ?auto_15349 ) ( CLEAR ?auto_15347 ) ( not ( = ?auto_15346 ?auto_15347 ) ) ( not ( = ?auto_15346 ?auto_15349 ) ) ( not ( = ?auto_15347 ?auto_15349 ) ) ( not ( = ?auto_15351 ?auto_15352 ) ) ( IS-CRATE ?auto_15346 ) ( not ( = ?auto_15363 ?auto_15348 ) ) ( HOIST-AT ?auto_15364 ?auto_15363 ) ( AVAILABLE ?auto_15364 ) ( SURFACE-AT ?auto_15346 ?auto_15363 ) ( ON ?auto_15346 ?auto_15354 ) ( CLEAR ?auto_15346 ) ( not ( = ?auto_15345 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15354 ) ) ( not ( = ?auto_15346 ?auto_15354 ) ) ( not ( = ?auto_15351 ?auto_15364 ) ) ( IS-CRATE ?auto_15345 ) ( not ( = ?auto_15355 ?auto_15348 ) ) ( HOIST-AT ?auto_15357 ?auto_15355 ) ( AVAILABLE ?auto_15357 ) ( SURFACE-AT ?auto_15345 ?auto_15355 ) ( ON ?auto_15345 ?auto_15360 ) ( CLEAR ?auto_15345 ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15360 ) ) ( not ( = ?auto_15345 ?auto_15360 ) ) ( not ( = ?auto_15351 ?auto_15357 ) ) ( IS-CRATE ?auto_15344 ) ( not ( = ?auto_15367 ?auto_15348 ) ) ( HOIST-AT ?auto_15362 ?auto_15367 ) ( AVAILABLE ?auto_15362 ) ( SURFACE-AT ?auto_15344 ?auto_15367 ) ( ON ?auto_15344 ?auto_15359 ) ( CLEAR ?auto_15344 ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15359 ) ) ( not ( = ?auto_15344 ?auto_15359 ) ) ( not ( = ?auto_15351 ?auto_15362 ) ) ( IS-CRATE ?auto_15343 ) ( not ( = ?auto_15368 ?auto_15348 ) ) ( HOIST-AT ?auto_15356 ?auto_15368 ) ( AVAILABLE ?auto_15356 ) ( SURFACE-AT ?auto_15343 ?auto_15368 ) ( ON ?auto_15343 ?auto_15361 ) ( CLEAR ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15361 ) ) ( not ( = ?auto_15343 ?auto_15361 ) ) ( not ( = ?auto_15351 ?auto_15356 ) ) ( SURFACE-AT ?auto_15341 ?auto_15348 ) ( CLEAR ?auto_15341 ) ( IS-CRATE ?auto_15342 ) ( AVAILABLE ?auto_15351 ) ( not ( = ?auto_15366 ?auto_15348 ) ) ( HOIST-AT ?auto_15365 ?auto_15366 ) ( AVAILABLE ?auto_15365 ) ( SURFACE-AT ?auto_15342 ?auto_15366 ) ( ON ?auto_15342 ?auto_15358 ) ( CLEAR ?auto_15342 ) ( TRUCK-AT ?auto_15350 ?auto_15348 ) ( not ( = ?auto_15341 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15358 ) ) ( not ( = ?auto_15342 ?auto_15358 ) ) ( not ( = ?auto_15351 ?auto_15365 ) ) ( not ( = ?auto_15341 ?auto_15343 ) ) ( not ( = ?auto_15341 ?auto_15361 ) ) ( not ( = ?auto_15343 ?auto_15358 ) ) ( not ( = ?auto_15368 ?auto_15366 ) ) ( not ( = ?auto_15356 ?auto_15365 ) ) ( not ( = ?auto_15361 ?auto_15358 ) ) ( not ( = ?auto_15341 ?auto_15344 ) ) ( not ( = ?auto_15341 ?auto_15359 ) ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( not ( = ?auto_15342 ?auto_15359 ) ) ( not ( = ?auto_15344 ?auto_15361 ) ) ( not ( = ?auto_15344 ?auto_15358 ) ) ( not ( = ?auto_15367 ?auto_15368 ) ) ( not ( = ?auto_15367 ?auto_15366 ) ) ( not ( = ?auto_15362 ?auto_15356 ) ) ( not ( = ?auto_15362 ?auto_15365 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15359 ?auto_15358 ) ) ( not ( = ?auto_15341 ?auto_15345 ) ) ( not ( = ?auto_15341 ?auto_15360 ) ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15360 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15360 ) ) ( not ( = ?auto_15345 ?auto_15359 ) ) ( not ( = ?auto_15345 ?auto_15361 ) ) ( not ( = ?auto_15345 ?auto_15358 ) ) ( not ( = ?auto_15355 ?auto_15367 ) ) ( not ( = ?auto_15355 ?auto_15368 ) ) ( not ( = ?auto_15355 ?auto_15366 ) ) ( not ( = ?auto_15357 ?auto_15362 ) ) ( not ( = ?auto_15357 ?auto_15356 ) ) ( not ( = ?auto_15357 ?auto_15365 ) ) ( not ( = ?auto_15360 ?auto_15359 ) ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( not ( = ?auto_15360 ?auto_15358 ) ) ( not ( = ?auto_15341 ?auto_15346 ) ) ( not ( = ?auto_15341 ?auto_15354 ) ) ( not ( = ?auto_15342 ?auto_15346 ) ) ( not ( = ?auto_15342 ?auto_15354 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) ( not ( = ?auto_15343 ?auto_15354 ) ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15344 ?auto_15354 ) ) ( not ( = ?auto_15346 ?auto_15360 ) ) ( not ( = ?auto_15346 ?auto_15359 ) ) ( not ( = ?auto_15346 ?auto_15361 ) ) ( not ( = ?auto_15346 ?auto_15358 ) ) ( not ( = ?auto_15363 ?auto_15355 ) ) ( not ( = ?auto_15363 ?auto_15367 ) ) ( not ( = ?auto_15363 ?auto_15368 ) ) ( not ( = ?auto_15363 ?auto_15366 ) ) ( not ( = ?auto_15364 ?auto_15357 ) ) ( not ( = ?auto_15364 ?auto_15362 ) ) ( not ( = ?auto_15364 ?auto_15356 ) ) ( not ( = ?auto_15364 ?auto_15365 ) ) ( not ( = ?auto_15354 ?auto_15360 ) ) ( not ( = ?auto_15354 ?auto_15359 ) ) ( not ( = ?auto_15354 ?auto_15361 ) ) ( not ( = ?auto_15354 ?auto_15358 ) ) ( not ( = ?auto_15341 ?auto_15347 ) ) ( not ( = ?auto_15341 ?auto_15349 ) ) ( not ( = ?auto_15342 ?auto_15347 ) ) ( not ( = ?auto_15342 ?auto_15349 ) ) ( not ( = ?auto_15343 ?auto_15347 ) ) ( not ( = ?auto_15343 ?auto_15349 ) ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( not ( = ?auto_15344 ?auto_15349 ) ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15345 ?auto_15349 ) ) ( not ( = ?auto_15347 ?auto_15354 ) ) ( not ( = ?auto_15347 ?auto_15360 ) ) ( not ( = ?auto_15347 ?auto_15359 ) ) ( not ( = ?auto_15347 ?auto_15361 ) ) ( not ( = ?auto_15347 ?auto_15358 ) ) ( not ( = ?auto_15353 ?auto_15363 ) ) ( not ( = ?auto_15353 ?auto_15355 ) ) ( not ( = ?auto_15353 ?auto_15367 ) ) ( not ( = ?auto_15353 ?auto_15368 ) ) ( not ( = ?auto_15353 ?auto_15366 ) ) ( not ( = ?auto_15352 ?auto_15364 ) ) ( not ( = ?auto_15352 ?auto_15357 ) ) ( not ( = ?auto_15352 ?auto_15362 ) ) ( not ( = ?auto_15352 ?auto_15356 ) ) ( not ( = ?auto_15352 ?auto_15365 ) ) ( not ( = ?auto_15349 ?auto_15354 ) ) ( not ( = ?auto_15349 ?auto_15360 ) ) ( not ( = ?auto_15349 ?auto_15359 ) ) ( not ( = ?auto_15349 ?auto_15361 ) ) ( not ( = ?auto_15349 ?auto_15358 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15341 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15346 )
      ( MAKE-1CRATE ?auto_15346 ?auto_15347 )
      ( MAKE-6CRATE-VERIFY ?auto_15341 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15346 ?auto_15347 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_15387 - SURFACE
      ?auto_15388 - SURFACE
      ?auto_15389 - SURFACE
      ?auto_15390 - SURFACE
      ?auto_15391 - SURFACE
      ?auto_15392 - SURFACE
      ?auto_15393 - SURFACE
      ?auto_15394 - SURFACE
    )
    :vars
    (
      ?auto_15400 - HOIST
      ?auto_15398 - PLACE
      ?auto_15395 - PLACE
      ?auto_15397 - HOIST
      ?auto_15396 - SURFACE
      ?auto_15406 - PLACE
      ?auto_15403 - HOIST
      ?auto_15402 - SURFACE
      ?auto_15408 - PLACE
      ?auto_15407 - HOIST
      ?auto_15404 - SURFACE
      ?auto_15415 - PLACE
      ?auto_15414 - HOIST
      ?auto_15412 - SURFACE
      ?auto_15413 - SURFACE
      ?auto_15401 - PLACE
      ?auto_15416 - HOIST
      ?auto_15411 - SURFACE
      ?auto_15410 - PLACE
      ?auto_15409 - HOIST
      ?auto_15405 - SURFACE
      ?auto_15399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15400 ?auto_15398 ) ( IS-CRATE ?auto_15394 ) ( not ( = ?auto_15395 ?auto_15398 ) ) ( HOIST-AT ?auto_15397 ?auto_15395 ) ( SURFACE-AT ?auto_15394 ?auto_15395 ) ( ON ?auto_15394 ?auto_15396 ) ( CLEAR ?auto_15394 ) ( not ( = ?auto_15393 ?auto_15394 ) ) ( not ( = ?auto_15393 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15396 ) ) ( not ( = ?auto_15400 ?auto_15397 ) ) ( IS-CRATE ?auto_15393 ) ( not ( = ?auto_15406 ?auto_15398 ) ) ( HOIST-AT ?auto_15403 ?auto_15406 ) ( AVAILABLE ?auto_15403 ) ( SURFACE-AT ?auto_15393 ?auto_15406 ) ( ON ?auto_15393 ?auto_15402 ) ( CLEAR ?auto_15393 ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15392 ?auto_15402 ) ) ( not ( = ?auto_15393 ?auto_15402 ) ) ( not ( = ?auto_15400 ?auto_15403 ) ) ( IS-CRATE ?auto_15392 ) ( not ( = ?auto_15408 ?auto_15398 ) ) ( HOIST-AT ?auto_15407 ?auto_15408 ) ( AVAILABLE ?auto_15407 ) ( SURFACE-AT ?auto_15392 ?auto_15408 ) ( ON ?auto_15392 ?auto_15404 ) ( CLEAR ?auto_15392 ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15404 ) ) ( not ( = ?auto_15392 ?auto_15404 ) ) ( not ( = ?auto_15400 ?auto_15407 ) ) ( IS-CRATE ?auto_15391 ) ( not ( = ?auto_15415 ?auto_15398 ) ) ( HOIST-AT ?auto_15414 ?auto_15415 ) ( AVAILABLE ?auto_15414 ) ( SURFACE-AT ?auto_15391 ?auto_15415 ) ( ON ?auto_15391 ?auto_15412 ) ( CLEAR ?auto_15391 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15390 ?auto_15412 ) ) ( not ( = ?auto_15391 ?auto_15412 ) ) ( not ( = ?auto_15400 ?auto_15414 ) ) ( IS-CRATE ?auto_15390 ) ( AVAILABLE ?auto_15397 ) ( SURFACE-AT ?auto_15390 ?auto_15395 ) ( ON ?auto_15390 ?auto_15413 ) ( CLEAR ?auto_15390 ) ( not ( = ?auto_15389 ?auto_15390 ) ) ( not ( = ?auto_15389 ?auto_15413 ) ) ( not ( = ?auto_15390 ?auto_15413 ) ) ( IS-CRATE ?auto_15389 ) ( not ( = ?auto_15401 ?auto_15398 ) ) ( HOIST-AT ?auto_15416 ?auto_15401 ) ( AVAILABLE ?auto_15416 ) ( SURFACE-AT ?auto_15389 ?auto_15401 ) ( ON ?auto_15389 ?auto_15411 ) ( CLEAR ?auto_15389 ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15388 ?auto_15411 ) ) ( not ( = ?auto_15389 ?auto_15411 ) ) ( not ( = ?auto_15400 ?auto_15416 ) ) ( SURFACE-AT ?auto_15387 ?auto_15398 ) ( CLEAR ?auto_15387 ) ( IS-CRATE ?auto_15388 ) ( AVAILABLE ?auto_15400 ) ( not ( = ?auto_15410 ?auto_15398 ) ) ( HOIST-AT ?auto_15409 ?auto_15410 ) ( AVAILABLE ?auto_15409 ) ( SURFACE-AT ?auto_15388 ?auto_15410 ) ( ON ?auto_15388 ?auto_15405 ) ( CLEAR ?auto_15388 ) ( TRUCK-AT ?auto_15399 ?auto_15398 ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15405 ) ) ( not ( = ?auto_15388 ?auto_15405 ) ) ( not ( = ?auto_15400 ?auto_15409 ) ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15411 ) ) ( not ( = ?auto_15389 ?auto_15405 ) ) ( not ( = ?auto_15401 ?auto_15410 ) ) ( not ( = ?auto_15416 ?auto_15409 ) ) ( not ( = ?auto_15411 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15390 ) ) ( not ( = ?auto_15387 ?auto_15413 ) ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15388 ?auto_15413 ) ) ( not ( = ?auto_15390 ?auto_15411 ) ) ( not ( = ?auto_15390 ?auto_15405 ) ) ( not ( = ?auto_15395 ?auto_15401 ) ) ( not ( = ?auto_15395 ?auto_15410 ) ) ( not ( = ?auto_15397 ?auto_15416 ) ) ( not ( = ?auto_15397 ?auto_15409 ) ) ( not ( = ?auto_15413 ?auto_15411 ) ) ( not ( = ?auto_15413 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15391 ) ) ( not ( = ?auto_15387 ?auto_15412 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15412 ) ) ( not ( = ?auto_15389 ?auto_15391 ) ) ( not ( = ?auto_15389 ?auto_15412 ) ) ( not ( = ?auto_15391 ?auto_15413 ) ) ( not ( = ?auto_15391 ?auto_15411 ) ) ( not ( = ?auto_15391 ?auto_15405 ) ) ( not ( = ?auto_15415 ?auto_15395 ) ) ( not ( = ?auto_15415 ?auto_15401 ) ) ( not ( = ?auto_15415 ?auto_15410 ) ) ( not ( = ?auto_15414 ?auto_15397 ) ) ( not ( = ?auto_15414 ?auto_15416 ) ) ( not ( = ?auto_15414 ?auto_15409 ) ) ( not ( = ?auto_15412 ?auto_15413 ) ) ( not ( = ?auto_15412 ?auto_15411 ) ) ( not ( = ?auto_15412 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15392 ) ) ( not ( = ?auto_15387 ?auto_15404 ) ) ( not ( = ?auto_15388 ?auto_15392 ) ) ( not ( = ?auto_15388 ?auto_15404 ) ) ( not ( = ?auto_15389 ?auto_15392 ) ) ( not ( = ?auto_15389 ?auto_15404 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15404 ) ) ( not ( = ?auto_15392 ?auto_15412 ) ) ( not ( = ?auto_15392 ?auto_15413 ) ) ( not ( = ?auto_15392 ?auto_15411 ) ) ( not ( = ?auto_15392 ?auto_15405 ) ) ( not ( = ?auto_15408 ?auto_15415 ) ) ( not ( = ?auto_15408 ?auto_15395 ) ) ( not ( = ?auto_15408 ?auto_15401 ) ) ( not ( = ?auto_15408 ?auto_15410 ) ) ( not ( = ?auto_15407 ?auto_15414 ) ) ( not ( = ?auto_15407 ?auto_15397 ) ) ( not ( = ?auto_15407 ?auto_15416 ) ) ( not ( = ?auto_15407 ?auto_15409 ) ) ( not ( = ?auto_15404 ?auto_15412 ) ) ( not ( = ?auto_15404 ?auto_15413 ) ) ( not ( = ?auto_15404 ?auto_15411 ) ) ( not ( = ?auto_15404 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15393 ) ) ( not ( = ?auto_15387 ?auto_15402 ) ) ( not ( = ?auto_15388 ?auto_15393 ) ) ( not ( = ?auto_15388 ?auto_15402 ) ) ( not ( = ?auto_15389 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15402 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15402 ) ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15391 ?auto_15402 ) ) ( not ( = ?auto_15393 ?auto_15404 ) ) ( not ( = ?auto_15393 ?auto_15412 ) ) ( not ( = ?auto_15393 ?auto_15413 ) ) ( not ( = ?auto_15393 ?auto_15411 ) ) ( not ( = ?auto_15393 ?auto_15405 ) ) ( not ( = ?auto_15406 ?auto_15408 ) ) ( not ( = ?auto_15406 ?auto_15415 ) ) ( not ( = ?auto_15406 ?auto_15395 ) ) ( not ( = ?auto_15406 ?auto_15401 ) ) ( not ( = ?auto_15406 ?auto_15410 ) ) ( not ( = ?auto_15403 ?auto_15407 ) ) ( not ( = ?auto_15403 ?auto_15414 ) ) ( not ( = ?auto_15403 ?auto_15397 ) ) ( not ( = ?auto_15403 ?auto_15416 ) ) ( not ( = ?auto_15403 ?auto_15409 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15412 ) ) ( not ( = ?auto_15402 ?auto_15413 ) ) ( not ( = ?auto_15402 ?auto_15411 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15394 ) ) ( not ( = ?auto_15387 ?auto_15396 ) ) ( not ( = ?auto_15388 ?auto_15394 ) ) ( not ( = ?auto_15388 ?auto_15396 ) ) ( not ( = ?auto_15389 ?auto_15394 ) ) ( not ( = ?auto_15389 ?auto_15396 ) ) ( not ( = ?auto_15390 ?auto_15394 ) ) ( not ( = ?auto_15390 ?auto_15396 ) ) ( not ( = ?auto_15391 ?auto_15394 ) ) ( not ( = ?auto_15391 ?auto_15396 ) ) ( not ( = ?auto_15392 ?auto_15394 ) ) ( not ( = ?auto_15392 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15402 ) ) ( not ( = ?auto_15394 ?auto_15404 ) ) ( not ( = ?auto_15394 ?auto_15412 ) ) ( not ( = ?auto_15394 ?auto_15413 ) ) ( not ( = ?auto_15394 ?auto_15411 ) ) ( not ( = ?auto_15394 ?auto_15405 ) ) ( not ( = ?auto_15396 ?auto_15402 ) ) ( not ( = ?auto_15396 ?auto_15404 ) ) ( not ( = ?auto_15396 ?auto_15412 ) ) ( not ( = ?auto_15396 ?auto_15413 ) ) ( not ( = ?auto_15396 ?auto_15411 ) ) ( not ( = ?auto_15396 ?auto_15405 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15387 ?auto_15388 ?auto_15389 ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 )
      ( MAKE-1CRATE ?auto_15393 ?auto_15394 )
      ( MAKE-7CRATE-VERIFY ?auto_15387 ?auto_15388 ?auto_15389 ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 ?auto_15394 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_15436 - SURFACE
      ?auto_15437 - SURFACE
      ?auto_15438 - SURFACE
      ?auto_15439 - SURFACE
      ?auto_15440 - SURFACE
      ?auto_15441 - SURFACE
      ?auto_15442 - SURFACE
      ?auto_15443 - SURFACE
      ?auto_15444 - SURFACE
    )
    :vars
    (
      ?auto_15450 - HOIST
      ?auto_15448 - PLACE
      ?auto_15447 - PLACE
      ?auto_15445 - HOIST
      ?auto_15449 - SURFACE
      ?auto_15462 - PLACE
      ?auto_15468 - HOIST
      ?auto_15469 - SURFACE
      ?auto_15456 - PLACE
      ?auto_15460 - HOIST
      ?auto_15459 - SURFACE
      ?auto_15454 - PLACE
      ?auto_15455 - HOIST
      ?auto_15458 - SURFACE
      ?auto_15461 - PLACE
      ?auto_15453 - HOIST
      ?auto_15467 - SURFACE
      ?auto_15452 - SURFACE
      ?auto_15464 - PLACE
      ?auto_15451 - HOIST
      ?auto_15465 - SURFACE
      ?auto_15466 - PLACE
      ?auto_15463 - HOIST
      ?auto_15457 - SURFACE
      ?auto_15446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15450 ?auto_15448 ) ( IS-CRATE ?auto_15444 ) ( not ( = ?auto_15447 ?auto_15448 ) ) ( HOIST-AT ?auto_15445 ?auto_15447 ) ( AVAILABLE ?auto_15445 ) ( SURFACE-AT ?auto_15444 ?auto_15447 ) ( ON ?auto_15444 ?auto_15449 ) ( CLEAR ?auto_15444 ) ( not ( = ?auto_15443 ?auto_15444 ) ) ( not ( = ?auto_15443 ?auto_15449 ) ) ( not ( = ?auto_15444 ?auto_15449 ) ) ( not ( = ?auto_15450 ?auto_15445 ) ) ( IS-CRATE ?auto_15443 ) ( not ( = ?auto_15462 ?auto_15448 ) ) ( HOIST-AT ?auto_15468 ?auto_15462 ) ( SURFACE-AT ?auto_15443 ?auto_15462 ) ( ON ?auto_15443 ?auto_15469 ) ( CLEAR ?auto_15443 ) ( not ( = ?auto_15442 ?auto_15443 ) ) ( not ( = ?auto_15442 ?auto_15469 ) ) ( not ( = ?auto_15443 ?auto_15469 ) ) ( not ( = ?auto_15450 ?auto_15468 ) ) ( IS-CRATE ?auto_15442 ) ( not ( = ?auto_15456 ?auto_15448 ) ) ( HOIST-AT ?auto_15460 ?auto_15456 ) ( AVAILABLE ?auto_15460 ) ( SURFACE-AT ?auto_15442 ?auto_15456 ) ( ON ?auto_15442 ?auto_15459 ) ( CLEAR ?auto_15442 ) ( not ( = ?auto_15441 ?auto_15442 ) ) ( not ( = ?auto_15441 ?auto_15459 ) ) ( not ( = ?auto_15442 ?auto_15459 ) ) ( not ( = ?auto_15450 ?auto_15460 ) ) ( IS-CRATE ?auto_15441 ) ( not ( = ?auto_15454 ?auto_15448 ) ) ( HOIST-AT ?auto_15455 ?auto_15454 ) ( AVAILABLE ?auto_15455 ) ( SURFACE-AT ?auto_15441 ?auto_15454 ) ( ON ?auto_15441 ?auto_15458 ) ( CLEAR ?auto_15441 ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15458 ) ) ( not ( = ?auto_15441 ?auto_15458 ) ) ( not ( = ?auto_15450 ?auto_15455 ) ) ( IS-CRATE ?auto_15440 ) ( not ( = ?auto_15461 ?auto_15448 ) ) ( HOIST-AT ?auto_15453 ?auto_15461 ) ( AVAILABLE ?auto_15453 ) ( SURFACE-AT ?auto_15440 ?auto_15461 ) ( ON ?auto_15440 ?auto_15467 ) ( CLEAR ?auto_15440 ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15467 ) ) ( not ( = ?auto_15440 ?auto_15467 ) ) ( not ( = ?auto_15450 ?auto_15453 ) ) ( IS-CRATE ?auto_15439 ) ( AVAILABLE ?auto_15468 ) ( SURFACE-AT ?auto_15439 ?auto_15462 ) ( ON ?auto_15439 ?auto_15452 ) ( CLEAR ?auto_15439 ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15452 ) ) ( not ( = ?auto_15439 ?auto_15452 ) ) ( IS-CRATE ?auto_15438 ) ( not ( = ?auto_15464 ?auto_15448 ) ) ( HOIST-AT ?auto_15451 ?auto_15464 ) ( AVAILABLE ?auto_15451 ) ( SURFACE-AT ?auto_15438 ?auto_15464 ) ( ON ?auto_15438 ?auto_15465 ) ( CLEAR ?auto_15438 ) ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15465 ) ) ( not ( = ?auto_15438 ?auto_15465 ) ) ( not ( = ?auto_15450 ?auto_15451 ) ) ( SURFACE-AT ?auto_15436 ?auto_15448 ) ( CLEAR ?auto_15436 ) ( IS-CRATE ?auto_15437 ) ( AVAILABLE ?auto_15450 ) ( not ( = ?auto_15466 ?auto_15448 ) ) ( HOIST-AT ?auto_15463 ?auto_15466 ) ( AVAILABLE ?auto_15463 ) ( SURFACE-AT ?auto_15437 ?auto_15466 ) ( ON ?auto_15437 ?auto_15457 ) ( CLEAR ?auto_15437 ) ( TRUCK-AT ?auto_15446 ?auto_15448 ) ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15457 ) ) ( not ( = ?auto_15437 ?auto_15457 ) ) ( not ( = ?auto_15450 ?auto_15463 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15465 ) ) ( not ( = ?auto_15438 ?auto_15457 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15451 ?auto_15463 ) ) ( not ( = ?auto_15465 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15439 ) ) ( not ( = ?auto_15436 ?auto_15452 ) ) ( not ( = ?auto_15437 ?auto_15439 ) ) ( not ( = ?auto_15437 ?auto_15452 ) ) ( not ( = ?auto_15439 ?auto_15465 ) ) ( not ( = ?auto_15439 ?auto_15457 ) ) ( not ( = ?auto_15462 ?auto_15464 ) ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( not ( = ?auto_15468 ?auto_15451 ) ) ( not ( = ?auto_15468 ?auto_15463 ) ) ( not ( = ?auto_15452 ?auto_15465 ) ) ( not ( = ?auto_15452 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15436 ?auto_15467 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15437 ?auto_15467 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15467 ) ) ( not ( = ?auto_15440 ?auto_15452 ) ) ( not ( = ?auto_15440 ?auto_15465 ) ) ( not ( = ?auto_15440 ?auto_15457 ) ) ( not ( = ?auto_15461 ?auto_15462 ) ) ( not ( = ?auto_15461 ?auto_15464 ) ) ( not ( = ?auto_15461 ?auto_15466 ) ) ( not ( = ?auto_15453 ?auto_15468 ) ) ( not ( = ?auto_15453 ?auto_15451 ) ) ( not ( = ?auto_15453 ?auto_15463 ) ) ( not ( = ?auto_15467 ?auto_15452 ) ) ( not ( = ?auto_15467 ?auto_15465 ) ) ( not ( = ?auto_15467 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15441 ) ) ( not ( = ?auto_15436 ?auto_15458 ) ) ( not ( = ?auto_15437 ?auto_15441 ) ) ( not ( = ?auto_15437 ?auto_15458 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( not ( = ?auto_15438 ?auto_15458 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15458 ) ) ( not ( = ?auto_15441 ?auto_15467 ) ) ( not ( = ?auto_15441 ?auto_15452 ) ) ( not ( = ?auto_15441 ?auto_15465 ) ) ( not ( = ?auto_15441 ?auto_15457 ) ) ( not ( = ?auto_15454 ?auto_15461 ) ) ( not ( = ?auto_15454 ?auto_15462 ) ) ( not ( = ?auto_15454 ?auto_15464 ) ) ( not ( = ?auto_15454 ?auto_15466 ) ) ( not ( = ?auto_15455 ?auto_15453 ) ) ( not ( = ?auto_15455 ?auto_15468 ) ) ( not ( = ?auto_15455 ?auto_15451 ) ) ( not ( = ?auto_15455 ?auto_15463 ) ) ( not ( = ?auto_15458 ?auto_15467 ) ) ( not ( = ?auto_15458 ?auto_15452 ) ) ( not ( = ?auto_15458 ?auto_15465 ) ) ( not ( = ?auto_15458 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15442 ) ) ( not ( = ?auto_15436 ?auto_15459 ) ) ( not ( = ?auto_15437 ?auto_15442 ) ) ( not ( = ?auto_15437 ?auto_15459 ) ) ( not ( = ?auto_15438 ?auto_15442 ) ) ( not ( = ?auto_15438 ?auto_15459 ) ) ( not ( = ?auto_15439 ?auto_15442 ) ) ( not ( = ?auto_15439 ?auto_15459 ) ) ( not ( = ?auto_15440 ?auto_15442 ) ) ( not ( = ?auto_15440 ?auto_15459 ) ) ( not ( = ?auto_15442 ?auto_15458 ) ) ( not ( = ?auto_15442 ?auto_15467 ) ) ( not ( = ?auto_15442 ?auto_15452 ) ) ( not ( = ?auto_15442 ?auto_15465 ) ) ( not ( = ?auto_15442 ?auto_15457 ) ) ( not ( = ?auto_15456 ?auto_15454 ) ) ( not ( = ?auto_15456 ?auto_15461 ) ) ( not ( = ?auto_15456 ?auto_15462 ) ) ( not ( = ?auto_15456 ?auto_15464 ) ) ( not ( = ?auto_15456 ?auto_15466 ) ) ( not ( = ?auto_15460 ?auto_15455 ) ) ( not ( = ?auto_15460 ?auto_15453 ) ) ( not ( = ?auto_15460 ?auto_15468 ) ) ( not ( = ?auto_15460 ?auto_15451 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15459 ?auto_15458 ) ) ( not ( = ?auto_15459 ?auto_15467 ) ) ( not ( = ?auto_15459 ?auto_15452 ) ) ( not ( = ?auto_15459 ?auto_15465 ) ) ( not ( = ?auto_15459 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15443 ) ) ( not ( = ?auto_15436 ?auto_15469 ) ) ( not ( = ?auto_15437 ?auto_15443 ) ) ( not ( = ?auto_15437 ?auto_15469 ) ) ( not ( = ?auto_15438 ?auto_15443 ) ) ( not ( = ?auto_15438 ?auto_15469 ) ) ( not ( = ?auto_15439 ?auto_15443 ) ) ( not ( = ?auto_15439 ?auto_15469 ) ) ( not ( = ?auto_15440 ?auto_15443 ) ) ( not ( = ?auto_15440 ?auto_15469 ) ) ( not ( = ?auto_15441 ?auto_15443 ) ) ( not ( = ?auto_15441 ?auto_15469 ) ) ( not ( = ?auto_15443 ?auto_15459 ) ) ( not ( = ?auto_15443 ?auto_15458 ) ) ( not ( = ?auto_15443 ?auto_15467 ) ) ( not ( = ?auto_15443 ?auto_15452 ) ) ( not ( = ?auto_15443 ?auto_15465 ) ) ( not ( = ?auto_15443 ?auto_15457 ) ) ( not ( = ?auto_15469 ?auto_15459 ) ) ( not ( = ?auto_15469 ?auto_15458 ) ) ( not ( = ?auto_15469 ?auto_15467 ) ) ( not ( = ?auto_15469 ?auto_15452 ) ) ( not ( = ?auto_15469 ?auto_15465 ) ) ( not ( = ?auto_15469 ?auto_15457 ) ) ( not ( = ?auto_15436 ?auto_15444 ) ) ( not ( = ?auto_15436 ?auto_15449 ) ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( not ( = ?auto_15437 ?auto_15449 ) ) ( not ( = ?auto_15438 ?auto_15444 ) ) ( not ( = ?auto_15438 ?auto_15449 ) ) ( not ( = ?auto_15439 ?auto_15444 ) ) ( not ( = ?auto_15439 ?auto_15449 ) ) ( not ( = ?auto_15440 ?auto_15444 ) ) ( not ( = ?auto_15440 ?auto_15449 ) ) ( not ( = ?auto_15441 ?auto_15444 ) ) ( not ( = ?auto_15441 ?auto_15449 ) ) ( not ( = ?auto_15442 ?auto_15444 ) ) ( not ( = ?auto_15442 ?auto_15449 ) ) ( not ( = ?auto_15444 ?auto_15469 ) ) ( not ( = ?auto_15444 ?auto_15459 ) ) ( not ( = ?auto_15444 ?auto_15458 ) ) ( not ( = ?auto_15444 ?auto_15467 ) ) ( not ( = ?auto_15444 ?auto_15452 ) ) ( not ( = ?auto_15444 ?auto_15465 ) ) ( not ( = ?auto_15444 ?auto_15457 ) ) ( not ( = ?auto_15447 ?auto_15462 ) ) ( not ( = ?auto_15447 ?auto_15456 ) ) ( not ( = ?auto_15447 ?auto_15454 ) ) ( not ( = ?auto_15447 ?auto_15461 ) ) ( not ( = ?auto_15447 ?auto_15464 ) ) ( not ( = ?auto_15447 ?auto_15466 ) ) ( not ( = ?auto_15445 ?auto_15468 ) ) ( not ( = ?auto_15445 ?auto_15460 ) ) ( not ( = ?auto_15445 ?auto_15455 ) ) ( not ( = ?auto_15445 ?auto_15453 ) ) ( not ( = ?auto_15445 ?auto_15451 ) ) ( not ( = ?auto_15445 ?auto_15463 ) ) ( not ( = ?auto_15449 ?auto_15469 ) ) ( not ( = ?auto_15449 ?auto_15459 ) ) ( not ( = ?auto_15449 ?auto_15458 ) ) ( not ( = ?auto_15449 ?auto_15467 ) ) ( not ( = ?auto_15449 ?auto_15452 ) ) ( not ( = ?auto_15449 ?auto_15465 ) ) ( not ( = ?auto_15449 ?auto_15457 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15436 ?auto_15437 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15441 ?auto_15442 ?auto_15443 )
      ( MAKE-1CRATE ?auto_15443 ?auto_15444 )
      ( MAKE-8CRATE-VERIFY ?auto_15436 ?auto_15437 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15441 ?auto_15442 ?auto_15443 ?auto_15444 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_15490 - SURFACE
      ?auto_15491 - SURFACE
      ?auto_15492 - SURFACE
      ?auto_15493 - SURFACE
      ?auto_15494 - SURFACE
      ?auto_15495 - SURFACE
      ?auto_15496 - SURFACE
      ?auto_15497 - SURFACE
      ?auto_15498 - SURFACE
      ?auto_15499 - SURFACE
    )
    :vars
    (
      ?auto_15500 - HOIST
      ?auto_15504 - PLACE
      ?auto_15501 - PLACE
      ?auto_15505 - HOIST
      ?auto_15502 - SURFACE
      ?auto_15513 - SURFACE
      ?auto_15518 - PLACE
      ?auto_15514 - HOIST
      ?auto_15525 - SURFACE
      ?auto_15523 - PLACE
      ?auto_15517 - HOIST
      ?auto_15515 - SURFACE
      ?auto_15512 - PLACE
      ?auto_15524 - HOIST
      ?auto_15521 - SURFACE
      ?auto_15516 - PLACE
      ?auto_15509 - HOIST
      ?auto_15507 - SURFACE
      ?auto_15506 - SURFACE
      ?auto_15520 - PLACE
      ?auto_15510 - HOIST
      ?auto_15508 - SURFACE
      ?auto_15511 - PLACE
      ?auto_15519 - HOIST
      ?auto_15522 - SURFACE
      ?auto_15503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15500 ?auto_15504 ) ( IS-CRATE ?auto_15499 ) ( not ( = ?auto_15501 ?auto_15504 ) ) ( HOIST-AT ?auto_15505 ?auto_15501 ) ( SURFACE-AT ?auto_15499 ?auto_15501 ) ( ON ?auto_15499 ?auto_15502 ) ( CLEAR ?auto_15499 ) ( not ( = ?auto_15498 ?auto_15499 ) ) ( not ( = ?auto_15498 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15500 ?auto_15505 ) ) ( IS-CRATE ?auto_15498 ) ( AVAILABLE ?auto_15505 ) ( SURFACE-AT ?auto_15498 ?auto_15501 ) ( ON ?auto_15498 ?auto_15513 ) ( CLEAR ?auto_15498 ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( not ( = ?auto_15497 ?auto_15513 ) ) ( not ( = ?auto_15498 ?auto_15513 ) ) ( IS-CRATE ?auto_15497 ) ( not ( = ?auto_15518 ?auto_15504 ) ) ( HOIST-AT ?auto_15514 ?auto_15518 ) ( SURFACE-AT ?auto_15497 ?auto_15518 ) ( ON ?auto_15497 ?auto_15525 ) ( CLEAR ?auto_15497 ) ( not ( = ?auto_15496 ?auto_15497 ) ) ( not ( = ?auto_15496 ?auto_15525 ) ) ( not ( = ?auto_15497 ?auto_15525 ) ) ( not ( = ?auto_15500 ?auto_15514 ) ) ( IS-CRATE ?auto_15496 ) ( not ( = ?auto_15523 ?auto_15504 ) ) ( HOIST-AT ?auto_15517 ?auto_15523 ) ( AVAILABLE ?auto_15517 ) ( SURFACE-AT ?auto_15496 ?auto_15523 ) ( ON ?auto_15496 ?auto_15515 ) ( CLEAR ?auto_15496 ) ( not ( = ?auto_15495 ?auto_15496 ) ) ( not ( = ?auto_15495 ?auto_15515 ) ) ( not ( = ?auto_15496 ?auto_15515 ) ) ( not ( = ?auto_15500 ?auto_15517 ) ) ( IS-CRATE ?auto_15495 ) ( not ( = ?auto_15512 ?auto_15504 ) ) ( HOIST-AT ?auto_15524 ?auto_15512 ) ( AVAILABLE ?auto_15524 ) ( SURFACE-AT ?auto_15495 ?auto_15512 ) ( ON ?auto_15495 ?auto_15521 ) ( CLEAR ?auto_15495 ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15521 ) ) ( not ( = ?auto_15495 ?auto_15521 ) ) ( not ( = ?auto_15500 ?auto_15524 ) ) ( IS-CRATE ?auto_15494 ) ( not ( = ?auto_15516 ?auto_15504 ) ) ( HOIST-AT ?auto_15509 ?auto_15516 ) ( AVAILABLE ?auto_15509 ) ( SURFACE-AT ?auto_15494 ?auto_15516 ) ( ON ?auto_15494 ?auto_15507 ) ( CLEAR ?auto_15494 ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15507 ) ) ( not ( = ?auto_15494 ?auto_15507 ) ) ( not ( = ?auto_15500 ?auto_15509 ) ) ( IS-CRATE ?auto_15493 ) ( AVAILABLE ?auto_15514 ) ( SURFACE-AT ?auto_15493 ?auto_15518 ) ( ON ?auto_15493 ?auto_15506 ) ( CLEAR ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( not ( = ?auto_15492 ?auto_15506 ) ) ( not ( = ?auto_15493 ?auto_15506 ) ) ( IS-CRATE ?auto_15492 ) ( not ( = ?auto_15520 ?auto_15504 ) ) ( HOIST-AT ?auto_15510 ?auto_15520 ) ( AVAILABLE ?auto_15510 ) ( SURFACE-AT ?auto_15492 ?auto_15520 ) ( ON ?auto_15492 ?auto_15508 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15491 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15508 ) ) ( not ( = ?auto_15492 ?auto_15508 ) ) ( not ( = ?auto_15500 ?auto_15510 ) ) ( SURFACE-AT ?auto_15490 ?auto_15504 ) ( CLEAR ?auto_15490 ) ( IS-CRATE ?auto_15491 ) ( AVAILABLE ?auto_15500 ) ( not ( = ?auto_15511 ?auto_15504 ) ) ( HOIST-AT ?auto_15519 ?auto_15511 ) ( AVAILABLE ?auto_15519 ) ( SURFACE-AT ?auto_15491 ?auto_15511 ) ( ON ?auto_15491 ?auto_15522 ) ( CLEAR ?auto_15491 ) ( TRUCK-AT ?auto_15503 ?auto_15504 ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15522 ) ) ( not ( = ?auto_15491 ?auto_15522 ) ) ( not ( = ?auto_15500 ?auto_15519 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15490 ?auto_15508 ) ) ( not ( = ?auto_15492 ?auto_15522 ) ) ( not ( = ?auto_15520 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15519 ) ) ( not ( = ?auto_15508 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15493 ) ) ( not ( = ?auto_15490 ?auto_15506 ) ) ( not ( = ?auto_15491 ?auto_15493 ) ) ( not ( = ?auto_15491 ?auto_15506 ) ) ( not ( = ?auto_15493 ?auto_15508 ) ) ( not ( = ?auto_15493 ?auto_15522 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15511 ) ) ( not ( = ?auto_15514 ?auto_15510 ) ) ( not ( = ?auto_15514 ?auto_15519 ) ) ( not ( = ?auto_15506 ?auto_15508 ) ) ( not ( = ?auto_15506 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15494 ) ) ( not ( = ?auto_15490 ?auto_15507 ) ) ( not ( = ?auto_15491 ?auto_15494 ) ) ( not ( = ?auto_15491 ?auto_15507 ) ) ( not ( = ?auto_15492 ?auto_15494 ) ) ( not ( = ?auto_15492 ?auto_15507 ) ) ( not ( = ?auto_15494 ?auto_15506 ) ) ( not ( = ?auto_15494 ?auto_15508 ) ) ( not ( = ?auto_15494 ?auto_15522 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15520 ) ) ( not ( = ?auto_15516 ?auto_15511 ) ) ( not ( = ?auto_15509 ?auto_15514 ) ) ( not ( = ?auto_15509 ?auto_15510 ) ) ( not ( = ?auto_15509 ?auto_15519 ) ) ( not ( = ?auto_15507 ?auto_15506 ) ) ( not ( = ?auto_15507 ?auto_15508 ) ) ( not ( = ?auto_15507 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15495 ) ) ( not ( = ?auto_15490 ?auto_15521 ) ) ( not ( = ?auto_15491 ?auto_15495 ) ) ( not ( = ?auto_15491 ?auto_15521 ) ) ( not ( = ?auto_15492 ?auto_15495 ) ) ( not ( = ?auto_15492 ?auto_15521 ) ) ( not ( = ?auto_15493 ?auto_15495 ) ) ( not ( = ?auto_15493 ?auto_15521 ) ) ( not ( = ?auto_15495 ?auto_15507 ) ) ( not ( = ?auto_15495 ?auto_15506 ) ) ( not ( = ?auto_15495 ?auto_15508 ) ) ( not ( = ?auto_15495 ?auto_15522 ) ) ( not ( = ?auto_15512 ?auto_15516 ) ) ( not ( = ?auto_15512 ?auto_15518 ) ) ( not ( = ?auto_15512 ?auto_15520 ) ) ( not ( = ?auto_15512 ?auto_15511 ) ) ( not ( = ?auto_15524 ?auto_15509 ) ) ( not ( = ?auto_15524 ?auto_15514 ) ) ( not ( = ?auto_15524 ?auto_15510 ) ) ( not ( = ?auto_15524 ?auto_15519 ) ) ( not ( = ?auto_15521 ?auto_15507 ) ) ( not ( = ?auto_15521 ?auto_15506 ) ) ( not ( = ?auto_15521 ?auto_15508 ) ) ( not ( = ?auto_15521 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15496 ) ) ( not ( = ?auto_15490 ?auto_15515 ) ) ( not ( = ?auto_15491 ?auto_15496 ) ) ( not ( = ?auto_15491 ?auto_15515 ) ) ( not ( = ?auto_15492 ?auto_15496 ) ) ( not ( = ?auto_15492 ?auto_15515 ) ) ( not ( = ?auto_15493 ?auto_15496 ) ) ( not ( = ?auto_15493 ?auto_15515 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15515 ) ) ( not ( = ?auto_15496 ?auto_15521 ) ) ( not ( = ?auto_15496 ?auto_15507 ) ) ( not ( = ?auto_15496 ?auto_15506 ) ) ( not ( = ?auto_15496 ?auto_15508 ) ) ( not ( = ?auto_15496 ?auto_15522 ) ) ( not ( = ?auto_15523 ?auto_15512 ) ) ( not ( = ?auto_15523 ?auto_15516 ) ) ( not ( = ?auto_15523 ?auto_15518 ) ) ( not ( = ?auto_15523 ?auto_15520 ) ) ( not ( = ?auto_15523 ?auto_15511 ) ) ( not ( = ?auto_15517 ?auto_15524 ) ) ( not ( = ?auto_15517 ?auto_15509 ) ) ( not ( = ?auto_15517 ?auto_15514 ) ) ( not ( = ?auto_15517 ?auto_15510 ) ) ( not ( = ?auto_15517 ?auto_15519 ) ) ( not ( = ?auto_15515 ?auto_15521 ) ) ( not ( = ?auto_15515 ?auto_15507 ) ) ( not ( = ?auto_15515 ?auto_15506 ) ) ( not ( = ?auto_15515 ?auto_15508 ) ) ( not ( = ?auto_15515 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15497 ) ) ( not ( = ?auto_15490 ?auto_15525 ) ) ( not ( = ?auto_15491 ?auto_15497 ) ) ( not ( = ?auto_15491 ?auto_15525 ) ) ( not ( = ?auto_15492 ?auto_15497 ) ) ( not ( = ?auto_15492 ?auto_15525 ) ) ( not ( = ?auto_15493 ?auto_15497 ) ) ( not ( = ?auto_15493 ?auto_15525 ) ) ( not ( = ?auto_15494 ?auto_15497 ) ) ( not ( = ?auto_15494 ?auto_15525 ) ) ( not ( = ?auto_15495 ?auto_15497 ) ) ( not ( = ?auto_15495 ?auto_15525 ) ) ( not ( = ?auto_15497 ?auto_15515 ) ) ( not ( = ?auto_15497 ?auto_15521 ) ) ( not ( = ?auto_15497 ?auto_15507 ) ) ( not ( = ?auto_15497 ?auto_15506 ) ) ( not ( = ?auto_15497 ?auto_15508 ) ) ( not ( = ?auto_15497 ?auto_15522 ) ) ( not ( = ?auto_15525 ?auto_15515 ) ) ( not ( = ?auto_15525 ?auto_15521 ) ) ( not ( = ?auto_15525 ?auto_15507 ) ) ( not ( = ?auto_15525 ?auto_15506 ) ) ( not ( = ?auto_15525 ?auto_15508 ) ) ( not ( = ?auto_15525 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15498 ) ) ( not ( = ?auto_15490 ?auto_15513 ) ) ( not ( = ?auto_15491 ?auto_15498 ) ) ( not ( = ?auto_15491 ?auto_15513 ) ) ( not ( = ?auto_15492 ?auto_15498 ) ) ( not ( = ?auto_15492 ?auto_15513 ) ) ( not ( = ?auto_15493 ?auto_15498 ) ) ( not ( = ?auto_15493 ?auto_15513 ) ) ( not ( = ?auto_15494 ?auto_15498 ) ) ( not ( = ?auto_15494 ?auto_15513 ) ) ( not ( = ?auto_15495 ?auto_15498 ) ) ( not ( = ?auto_15495 ?auto_15513 ) ) ( not ( = ?auto_15496 ?auto_15498 ) ) ( not ( = ?auto_15496 ?auto_15513 ) ) ( not ( = ?auto_15498 ?auto_15525 ) ) ( not ( = ?auto_15498 ?auto_15515 ) ) ( not ( = ?auto_15498 ?auto_15521 ) ) ( not ( = ?auto_15498 ?auto_15507 ) ) ( not ( = ?auto_15498 ?auto_15506 ) ) ( not ( = ?auto_15498 ?auto_15508 ) ) ( not ( = ?auto_15498 ?auto_15522 ) ) ( not ( = ?auto_15501 ?auto_15518 ) ) ( not ( = ?auto_15501 ?auto_15523 ) ) ( not ( = ?auto_15501 ?auto_15512 ) ) ( not ( = ?auto_15501 ?auto_15516 ) ) ( not ( = ?auto_15501 ?auto_15520 ) ) ( not ( = ?auto_15501 ?auto_15511 ) ) ( not ( = ?auto_15505 ?auto_15514 ) ) ( not ( = ?auto_15505 ?auto_15517 ) ) ( not ( = ?auto_15505 ?auto_15524 ) ) ( not ( = ?auto_15505 ?auto_15509 ) ) ( not ( = ?auto_15505 ?auto_15510 ) ) ( not ( = ?auto_15505 ?auto_15519 ) ) ( not ( = ?auto_15513 ?auto_15525 ) ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15521 ) ) ( not ( = ?auto_15513 ?auto_15507 ) ) ( not ( = ?auto_15513 ?auto_15506 ) ) ( not ( = ?auto_15513 ?auto_15508 ) ) ( not ( = ?auto_15513 ?auto_15522 ) ) ( not ( = ?auto_15490 ?auto_15499 ) ) ( not ( = ?auto_15490 ?auto_15502 ) ) ( not ( = ?auto_15491 ?auto_15499 ) ) ( not ( = ?auto_15491 ?auto_15502 ) ) ( not ( = ?auto_15492 ?auto_15499 ) ) ( not ( = ?auto_15492 ?auto_15502 ) ) ( not ( = ?auto_15493 ?auto_15499 ) ) ( not ( = ?auto_15493 ?auto_15502 ) ) ( not ( = ?auto_15494 ?auto_15499 ) ) ( not ( = ?auto_15494 ?auto_15502 ) ) ( not ( = ?auto_15495 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15502 ) ) ( not ( = ?auto_15496 ?auto_15499 ) ) ( not ( = ?auto_15496 ?auto_15502 ) ) ( not ( = ?auto_15497 ?auto_15499 ) ) ( not ( = ?auto_15497 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15513 ) ) ( not ( = ?auto_15499 ?auto_15525 ) ) ( not ( = ?auto_15499 ?auto_15515 ) ) ( not ( = ?auto_15499 ?auto_15521 ) ) ( not ( = ?auto_15499 ?auto_15507 ) ) ( not ( = ?auto_15499 ?auto_15506 ) ) ( not ( = ?auto_15499 ?auto_15508 ) ) ( not ( = ?auto_15499 ?auto_15522 ) ) ( not ( = ?auto_15502 ?auto_15513 ) ) ( not ( = ?auto_15502 ?auto_15525 ) ) ( not ( = ?auto_15502 ?auto_15515 ) ) ( not ( = ?auto_15502 ?auto_15521 ) ) ( not ( = ?auto_15502 ?auto_15507 ) ) ( not ( = ?auto_15502 ?auto_15506 ) ) ( not ( = ?auto_15502 ?auto_15508 ) ) ( not ( = ?auto_15502 ?auto_15522 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15490 ?auto_15491 ?auto_15492 ?auto_15493 ?auto_15494 ?auto_15495 ?auto_15496 ?auto_15497 ?auto_15498 )
      ( MAKE-1CRATE ?auto_15498 ?auto_15499 )
      ( MAKE-9CRATE-VERIFY ?auto_15490 ?auto_15491 ?auto_15492 ?auto_15493 ?auto_15494 ?auto_15495 ?auto_15496 ?auto_15497 ?auto_15498 ?auto_15499 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_15547 - SURFACE
      ?auto_15548 - SURFACE
      ?auto_15549 - SURFACE
      ?auto_15550 - SURFACE
      ?auto_15551 - SURFACE
      ?auto_15552 - SURFACE
      ?auto_15553 - SURFACE
      ?auto_15554 - SURFACE
      ?auto_15555 - SURFACE
      ?auto_15556 - SURFACE
      ?auto_15557 - SURFACE
    )
    :vars
    (
      ?auto_15561 - HOIST
      ?auto_15560 - PLACE
      ?auto_15558 - PLACE
      ?auto_15559 - HOIST
      ?auto_15563 - SURFACE
      ?auto_15572 - PLACE
      ?auto_15584 - HOIST
      ?auto_15571 - SURFACE
      ?auto_15574 - SURFACE
      ?auto_15564 - PLACE
      ?auto_15585 - HOIST
      ?auto_15580 - SURFACE
      ?auto_15582 - PLACE
      ?auto_15586 - HOIST
      ?auto_15570 - SURFACE
      ?auto_15575 - PLACE
      ?auto_15578 - HOIST
      ?auto_15583 - SURFACE
      ?auto_15581 - PLACE
      ?auto_15579 - HOIST
      ?auto_15567 - SURFACE
      ?auto_15573 - SURFACE
      ?auto_15569 - PLACE
      ?auto_15577 - HOIST
      ?auto_15565 - SURFACE
      ?auto_15576 - PLACE
      ?auto_15568 - HOIST
      ?auto_15566 - SURFACE
      ?auto_15562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15561 ?auto_15560 ) ( IS-CRATE ?auto_15557 ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( HOIST-AT ?auto_15559 ?auto_15558 ) ( AVAILABLE ?auto_15559 ) ( SURFACE-AT ?auto_15557 ?auto_15558 ) ( ON ?auto_15557 ?auto_15563 ) ( CLEAR ?auto_15557 ) ( not ( = ?auto_15556 ?auto_15557 ) ) ( not ( = ?auto_15556 ?auto_15563 ) ) ( not ( = ?auto_15557 ?auto_15563 ) ) ( not ( = ?auto_15561 ?auto_15559 ) ) ( IS-CRATE ?auto_15556 ) ( not ( = ?auto_15572 ?auto_15560 ) ) ( HOIST-AT ?auto_15584 ?auto_15572 ) ( SURFACE-AT ?auto_15556 ?auto_15572 ) ( ON ?auto_15556 ?auto_15571 ) ( CLEAR ?auto_15556 ) ( not ( = ?auto_15555 ?auto_15556 ) ) ( not ( = ?auto_15555 ?auto_15571 ) ) ( not ( = ?auto_15556 ?auto_15571 ) ) ( not ( = ?auto_15561 ?auto_15584 ) ) ( IS-CRATE ?auto_15555 ) ( AVAILABLE ?auto_15584 ) ( SURFACE-AT ?auto_15555 ?auto_15572 ) ( ON ?auto_15555 ?auto_15574 ) ( CLEAR ?auto_15555 ) ( not ( = ?auto_15554 ?auto_15555 ) ) ( not ( = ?auto_15554 ?auto_15574 ) ) ( not ( = ?auto_15555 ?auto_15574 ) ) ( IS-CRATE ?auto_15554 ) ( not ( = ?auto_15564 ?auto_15560 ) ) ( HOIST-AT ?auto_15585 ?auto_15564 ) ( SURFACE-AT ?auto_15554 ?auto_15564 ) ( ON ?auto_15554 ?auto_15580 ) ( CLEAR ?auto_15554 ) ( not ( = ?auto_15553 ?auto_15554 ) ) ( not ( = ?auto_15553 ?auto_15580 ) ) ( not ( = ?auto_15554 ?auto_15580 ) ) ( not ( = ?auto_15561 ?auto_15585 ) ) ( IS-CRATE ?auto_15553 ) ( not ( = ?auto_15582 ?auto_15560 ) ) ( HOIST-AT ?auto_15586 ?auto_15582 ) ( AVAILABLE ?auto_15586 ) ( SURFACE-AT ?auto_15553 ?auto_15582 ) ( ON ?auto_15553 ?auto_15570 ) ( CLEAR ?auto_15553 ) ( not ( = ?auto_15552 ?auto_15553 ) ) ( not ( = ?auto_15552 ?auto_15570 ) ) ( not ( = ?auto_15553 ?auto_15570 ) ) ( not ( = ?auto_15561 ?auto_15586 ) ) ( IS-CRATE ?auto_15552 ) ( not ( = ?auto_15575 ?auto_15560 ) ) ( HOIST-AT ?auto_15578 ?auto_15575 ) ( AVAILABLE ?auto_15578 ) ( SURFACE-AT ?auto_15552 ?auto_15575 ) ( ON ?auto_15552 ?auto_15583 ) ( CLEAR ?auto_15552 ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( not ( = ?auto_15551 ?auto_15583 ) ) ( not ( = ?auto_15552 ?auto_15583 ) ) ( not ( = ?auto_15561 ?auto_15578 ) ) ( IS-CRATE ?auto_15551 ) ( not ( = ?auto_15581 ?auto_15560 ) ) ( HOIST-AT ?auto_15579 ?auto_15581 ) ( AVAILABLE ?auto_15579 ) ( SURFACE-AT ?auto_15551 ?auto_15581 ) ( ON ?auto_15551 ?auto_15567 ) ( CLEAR ?auto_15551 ) ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15567 ) ) ( not ( = ?auto_15551 ?auto_15567 ) ) ( not ( = ?auto_15561 ?auto_15579 ) ) ( IS-CRATE ?auto_15550 ) ( AVAILABLE ?auto_15585 ) ( SURFACE-AT ?auto_15550 ?auto_15564 ) ( ON ?auto_15550 ?auto_15573 ) ( CLEAR ?auto_15550 ) ( not ( = ?auto_15549 ?auto_15550 ) ) ( not ( = ?auto_15549 ?auto_15573 ) ) ( not ( = ?auto_15550 ?auto_15573 ) ) ( IS-CRATE ?auto_15549 ) ( not ( = ?auto_15569 ?auto_15560 ) ) ( HOIST-AT ?auto_15577 ?auto_15569 ) ( AVAILABLE ?auto_15577 ) ( SURFACE-AT ?auto_15549 ?auto_15569 ) ( ON ?auto_15549 ?auto_15565 ) ( CLEAR ?auto_15549 ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15565 ) ) ( not ( = ?auto_15549 ?auto_15565 ) ) ( not ( = ?auto_15561 ?auto_15577 ) ) ( SURFACE-AT ?auto_15547 ?auto_15560 ) ( CLEAR ?auto_15547 ) ( IS-CRATE ?auto_15548 ) ( AVAILABLE ?auto_15561 ) ( not ( = ?auto_15576 ?auto_15560 ) ) ( HOIST-AT ?auto_15568 ?auto_15576 ) ( AVAILABLE ?auto_15568 ) ( SURFACE-AT ?auto_15548 ?auto_15576 ) ( ON ?auto_15548 ?auto_15566 ) ( CLEAR ?auto_15548 ) ( TRUCK-AT ?auto_15562 ?auto_15560 ) ( not ( = ?auto_15547 ?auto_15548 ) ) ( not ( = ?auto_15547 ?auto_15566 ) ) ( not ( = ?auto_15548 ?auto_15566 ) ) ( not ( = ?auto_15561 ?auto_15568 ) ) ( not ( = ?auto_15547 ?auto_15549 ) ) ( not ( = ?auto_15547 ?auto_15565 ) ) ( not ( = ?auto_15549 ?auto_15566 ) ) ( not ( = ?auto_15569 ?auto_15576 ) ) ( not ( = ?auto_15577 ?auto_15568 ) ) ( not ( = ?auto_15565 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15550 ) ) ( not ( = ?auto_15547 ?auto_15573 ) ) ( not ( = ?auto_15548 ?auto_15550 ) ) ( not ( = ?auto_15548 ?auto_15573 ) ) ( not ( = ?auto_15550 ?auto_15565 ) ) ( not ( = ?auto_15550 ?auto_15566 ) ) ( not ( = ?auto_15564 ?auto_15569 ) ) ( not ( = ?auto_15564 ?auto_15576 ) ) ( not ( = ?auto_15585 ?auto_15577 ) ) ( not ( = ?auto_15585 ?auto_15568 ) ) ( not ( = ?auto_15573 ?auto_15565 ) ) ( not ( = ?auto_15573 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15551 ) ) ( not ( = ?auto_15547 ?auto_15567 ) ) ( not ( = ?auto_15548 ?auto_15551 ) ) ( not ( = ?auto_15548 ?auto_15567 ) ) ( not ( = ?auto_15549 ?auto_15551 ) ) ( not ( = ?auto_15549 ?auto_15567 ) ) ( not ( = ?auto_15551 ?auto_15573 ) ) ( not ( = ?auto_15551 ?auto_15565 ) ) ( not ( = ?auto_15551 ?auto_15566 ) ) ( not ( = ?auto_15581 ?auto_15564 ) ) ( not ( = ?auto_15581 ?auto_15569 ) ) ( not ( = ?auto_15581 ?auto_15576 ) ) ( not ( = ?auto_15579 ?auto_15585 ) ) ( not ( = ?auto_15579 ?auto_15577 ) ) ( not ( = ?auto_15579 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15573 ) ) ( not ( = ?auto_15567 ?auto_15565 ) ) ( not ( = ?auto_15567 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15552 ) ) ( not ( = ?auto_15547 ?auto_15583 ) ) ( not ( = ?auto_15548 ?auto_15552 ) ) ( not ( = ?auto_15548 ?auto_15583 ) ) ( not ( = ?auto_15549 ?auto_15552 ) ) ( not ( = ?auto_15549 ?auto_15583 ) ) ( not ( = ?auto_15550 ?auto_15552 ) ) ( not ( = ?auto_15550 ?auto_15583 ) ) ( not ( = ?auto_15552 ?auto_15567 ) ) ( not ( = ?auto_15552 ?auto_15573 ) ) ( not ( = ?auto_15552 ?auto_15565 ) ) ( not ( = ?auto_15552 ?auto_15566 ) ) ( not ( = ?auto_15575 ?auto_15581 ) ) ( not ( = ?auto_15575 ?auto_15564 ) ) ( not ( = ?auto_15575 ?auto_15569 ) ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15577 ) ) ( not ( = ?auto_15578 ?auto_15568 ) ) ( not ( = ?auto_15583 ?auto_15567 ) ) ( not ( = ?auto_15583 ?auto_15573 ) ) ( not ( = ?auto_15583 ?auto_15565 ) ) ( not ( = ?auto_15583 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15553 ) ) ( not ( = ?auto_15547 ?auto_15570 ) ) ( not ( = ?auto_15548 ?auto_15553 ) ) ( not ( = ?auto_15548 ?auto_15570 ) ) ( not ( = ?auto_15549 ?auto_15553 ) ) ( not ( = ?auto_15549 ?auto_15570 ) ) ( not ( = ?auto_15550 ?auto_15553 ) ) ( not ( = ?auto_15550 ?auto_15570 ) ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( not ( = ?auto_15551 ?auto_15570 ) ) ( not ( = ?auto_15553 ?auto_15583 ) ) ( not ( = ?auto_15553 ?auto_15567 ) ) ( not ( = ?auto_15553 ?auto_15573 ) ) ( not ( = ?auto_15553 ?auto_15565 ) ) ( not ( = ?auto_15553 ?auto_15566 ) ) ( not ( = ?auto_15582 ?auto_15575 ) ) ( not ( = ?auto_15582 ?auto_15581 ) ) ( not ( = ?auto_15582 ?auto_15564 ) ) ( not ( = ?auto_15582 ?auto_15569 ) ) ( not ( = ?auto_15582 ?auto_15576 ) ) ( not ( = ?auto_15586 ?auto_15578 ) ) ( not ( = ?auto_15586 ?auto_15579 ) ) ( not ( = ?auto_15586 ?auto_15585 ) ) ( not ( = ?auto_15586 ?auto_15577 ) ) ( not ( = ?auto_15586 ?auto_15568 ) ) ( not ( = ?auto_15570 ?auto_15583 ) ) ( not ( = ?auto_15570 ?auto_15567 ) ) ( not ( = ?auto_15570 ?auto_15573 ) ) ( not ( = ?auto_15570 ?auto_15565 ) ) ( not ( = ?auto_15570 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15554 ) ) ( not ( = ?auto_15547 ?auto_15580 ) ) ( not ( = ?auto_15548 ?auto_15554 ) ) ( not ( = ?auto_15548 ?auto_15580 ) ) ( not ( = ?auto_15549 ?auto_15554 ) ) ( not ( = ?auto_15549 ?auto_15580 ) ) ( not ( = ?auto_15550 ?auto_15554 ) ) ( not ( = ?auto_15550 ?auto_15580 ) ) ( not ( = ?auto_15551 ?auto_15554 ) ) ( not ( = ?auto_15551 ?auto_15580 ) ) ( not ( = ?auto_15552 ?auto_15554 ) ) ( not ( = ?auto_15552 ?auto_15580 ) ) ( not ( = ?auto_15554 ?auto_15570 ) ) ( not ( = ?auto_15554 ?auto_15583 ) ) ( not ( = ?auto_15554 ?auto_15567 ) ) ( not ( = ?auto_15554 ?auto_15573 ) ) ( not ( = ?auto_15554 ?auto_15565 ) ) ( not ( = ?auto_15554 ?auto_15566 ) ) ( not ( = ?auto_15580 ?auto_15570 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15567 ) ) ( not ( = ?auto_15580 ?auto_15573 ) ) ( not ( = ?auto_15580 ?auto_15565 ) ) ( not ( = ?auto_15580 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15555 ) ) ( not ( = ?auto_15547 ?auto_15574 ) ) ( not ( = ?auto_15548 ?auto_15555 ) ) ( not ( = ?auto_15548 ?auto_15574 ) ) ( not ( = ?auto_15549 ?auto_15555 ) ) ( not ( = ?auto_15549 ?auto_15574 ) ) ( not ( = ?auto_15550 ?auto_15555 ) ) ( not ( = ?auto_15550 ?auto_15574 ) ) ( not ( = ?auto_15551 ?auto_15555 ) ) ( not ( = ?auto_15551 ?auto_15574 ) ) ( not ( = ?auto_15552 ?auto_15555 ) ) ( not ( = ?auto_15552 ?auto_15574 ) ) ( not ( = ?auto_15553 ?auto_15555 ) ) ( not ( = ?auto_15553 ?auto_15574 ) ) ( not ( = ?auto_15555 ?auto_15580 ) ) ( not ( = ?auto_15555 ?auto_15570 ) ) ( not ( = ?auto_15555 ?auto_15583 ) ) ( not ( = ?auto_15555 ?auto_15567 ) ) ( not ( = ?auto_15555 ?auto_15573 ) ) ( not ( = ?auto_15555 ?auto_15565 ) ) ( not ( = ?auto_15555 ?auto_15566 ) ) ( not ( = ?auto_15572 ?auto_15564 ) ) ( not ( = ?auto_15572 ?auto_15582 ) ) ( not ( = ?auto_15572 ?auto_15575 ) ) ( not ( = ?auto_15572 ?auto_15581 ) ) ( not ( = ?auto_15572 ?auto_15569 ) ) ( not ( = ?auto_15572 ?auto_15576 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( not ( = ?auto_15584 ?auto_15578 ) ) ( not ( = ?auto_15584 ?auto_15579 ) ) ( not ( = ?auto_15584 ?auto_15577 ) ) ( not ( = ?auto_15584 ?auto_15568 ) ) ( not ( = ?auto_15574 ?auto_15580 ) ) ( not ( = ?auto_15574 ?auto_15570 ) ) ( not ( = ?auto_15574 ?auto_15583 ) ) ( not ( = ?auto_15574 ?auto_15567 ) ) ( not ( = ?auto_15574 ?auto_15573 ) ) ( not ( = ?auto_15574 ?auto_15565 ) ) ( not ( = ?auto_15574 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15556 ) ) ( not ( = ?auto_15547 ?auto_15571 ) ) ( not ( = ?auto_15548 ?auto_15556 ) ) ( not ( = ?auto_15548 ?auto_15571 ) ) ( not ( = ?auto_15549 ?auto_15556 ) ) ( not ( = ?auto_15549 ?auto_15571 ) ) ( not ( = ?auto_15550 ?auto_15556 ) ) ( not ( = ?auto_15550 ?auto_15571 ) ) ( not ( = ?auto_15551 ?auto_15556 ) ) ( not ( = ?auto_15551 ?auto_15571 ) ) ( not ( = ?auto_15552 ?auto_15556 ) ) ( not ( = ?auto_15552 ?auto_15571 ) ) ( not ( = ?auto_15553 ?auto_15556 ) ) ( not ( = ?auto_15553 ?auto_15571 ) ) ( not ( = ?auto_15554 ?auto_15556 ) ) ( not ( = ?auto_15554 ?auto_15571 ) ) ( not ( = ?auto_15556 ?auto_15574 ) ) ( not ( = ?auto_15556 ?auto_15580 ) ) ( not ( = ?auto_15556 ?auto_15570 ) ) ( not ( = ?auto_15556 ?auto_15583 ) ) ( not ( = ?auto_15556 ?auto_15567 ) ) ( not ( = ?auto_15556 ?auto_15573 ) ) ( not ( = ?auto_15556 ?auto_15565 ) ) ( not ( = ?auto_15556 ?auto_15566 ) ) ( not ( = ?auto_15571 ?auto_15574 ) ) ( not ( = ?auto_15571 ?auto_15580 ) ) ( not ( = ?auto_15571 ?auto_15570 ) ) ( not ( = ?auto_15571 ?auto_15583 ) ) ( not ( = ?auto_15571 ?auto_15567 ) ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15571 ?auto_15565 ) ) ( not ( = ?auto_15571 ?auto_15566 ) ) ( not ( = ?auto_15547 ?auto_15557 ) ) ( not ( = ?auto_15547 ?auto_15563 ) ) ( not ( = ?auto_15548 ?auto_15557 ) ) ( not ( = ?auto_15548 ?auto_15563 ) ) ( not ( = ?auto_15549 ?auto_15557 ) ) ( not ( = ?auto_15549 ?auto_15563 ) ) ( not ( = ?auto_15550 ?auto_15557 ) ) ( not ( = ?auto_15550 ?auto_15563 ) ) ( not ( = ?auto_15551 ?auto_15557 ) ) ( not ( = ?auto_15551 ?auto_15563 ) ) ( not ( = ?auto_15552 ?auto_15557 ) ) ( not ( = ?auto_15552 ?auto_15563 ) ) ( not ( = ?auto_15553 ?auto_15557 ) ) ( not ( = ?auto_15553 ?auto_15563 ) ) ( not ( = ?auto_15554 ?auto_15557 ) ) ( not ( = ?auto_15554 ?auto_15563 ) ) ( not ( = ?auto_15555 ?auto_15557 ) ) ( not ( = ?auto_15555 ?auto_15563 ) ) ( not ( = ?auto_15557 ?auto_15571 ) ) ( not ( = ?auto_15557 ?auto_15574 ) ) ( not ( = ?auto_15557 ?auto_15580 ) ) ( not ( = ?auto_15557 ?auto_15570 ) ) ( not ( = ?auto_15557 ?auto_15583 ) ) ( not ( = ?auto_15557 ?auto_15567 ) ) ( not ( = ?auto_15557 ?auto_15573 ) ) ( not ( = ?auto_15557 ?auto_15565 ) ) ( not ( = ?auto_15557 ?auto_15566 ) ) ( not ( = ?auto_15558 ?auto_15572 ) ) ( not ( = ?auto_15558 ?auto_15564 ) ) ( not ( = ?auto_15558 ?auto_15582 ) ) ( not ( = ?auto_15558 ?auto_15575 ) ) ( not ( = ?auto_15558 ?auto_15581 ) ) ( not ( = ?auto_15558 ?auto_15569 ) ) ( not ( = ?auto_15558 ?auto_15576 ) ) ( not ( = ?auto_15559 ?auto_15584 ) ) ( not ( = ?auto_15559 ?auto_15585 ) ) ( not ( = ?auto_15559 ?auto_15586 ) ) ( not ( = ?auto_15559 ?auto_15578 ) ) ( not ( = ?auto_15559 ?auto_15579 ) ) ( not ( = ?auto_15559 ?auto_15577 ) ) ( not ( = ?auto_15559 ?auto_15568 ) ) ( not ( = ?auto_15563 ?auto_15571 ) ) ( not ( = ?auto_15563 ?auto_15574 ) ) ( not ( = ?auto_15563 ?auto_15580 ) ) ( not ( = ?auto_15563 ?auto_15570 ) ) ( not ( = ?auto_15563 ?auto_15583 ) ) ( not ( = ?auto_15563 ?auto_15567 ) ) ( not ( = ?auto_15563 ?auto_15573 ) ) ( not ( = ?auto_15563 ?auto_15565 ) ) ( not ( = ?auto_15563 ?auto_15566 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15547 ?auto_15548 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15552 ?auto_15553 ?auto_15554 ?auto_15555 ?auto_15556 )
      ( MAKE-1CRATE ?auto_15556 ?auto_15557 )
      ( MAKE-10CRATE-VERIFY ?auto_15547 ?auto_15548 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15552 ?auto_15553 ?auto_15554 ?auto_15555 ?auto_15556 ?auto_15557 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15609 - SURFACE
      ?auto_15610 - SURFACE
      ?auto_15611 - SURFACE
      ?auto_15612 - SURFACE
      ?auto_15613 - SURFACE
      ?auto_15614 - SURFACE
      ?auto_15615 - SURFACE
      ?auto_15616 - SURFACE
      ?auto_15617 - SURFACE
      ?auto_15618 - SURFACE
      ?auto_15619 - SURFACE
      ?auto_15620 - SURFACE
    )
    :vars
    (
      ?auto_15625 - HOIST
      ?auto_15624 - PLACE
      ?auto_15622 - PLACE
      ?auto_15623 - HOIST
      ?auto_15621 - SURFACE
      ?auto_15650 - PLACE
      ?auto_15652 - HOIST
      ?auto_15637 - SURFACE
      ?auto_15628 - PLACE
      ?auto_15640 - HOIST
      ?auto_15641 - SURFACE
      ?auto_15635 - SURFACE
      ?auto_15651 - PLACE
      ?auto_15642 - HOIST
      ?auto_15630 - SURFACE
      ?auto_15632 - PLACE
      ?auto_15645 - HOIST
      ?auto_15633 - SURFACE
      ?auto_15638 - PLACE
      ?auto_15646 - HOIST
      ?auto_15643 - SURFACE
      ?auto_15639 - PLACE
      ?auto_15634 - HOIST
      ?auto_15644 - SURFACE
      ?auto_15636 - SURFACE
      ?auto_15629 - PLACE
      ?auto_15647 - HOIST
      ?auto_15649 - SURFACE
      ?auto_15648 - PLACE
      ?auto_15627 - HOIST
      ?auto_15631 - SURFACE
      ?auto_15626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15625 ?auto_15624 ) ( IS-CRATE ?auto_15620 ) ( not ( = ?auto_15622 ?auto_15624 ) ) ( HOIST-AT ?auto_15623 ?auto_15622 ) ( AVAILABLE ?auto_15623 ) ( SURFACE-AT ?auto_15620 ?auto_15622 ) ( ON ?auto_15620 ?auto_15621 ) ( CLEAR ?auto_15620 ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( not ( = ?auto_15619 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15621 ) ) ( not ( = ?auto_15625 ?auto_15623 ) ) ( IS-CRATE ?auto_15619 ) ( not ( = ?auto_15650 ?auto_15624 ) ) ( HOIST-AT ?auto_15652 ?auto_15650 ) ( AVAILABLE ?auto_15652 ) ( SURFACE-AT ?auto_15619 ?auto_15650 ) ( ON ?auto_15619 ?auto_15637 ) ( CLEAR ?auto_15619 ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15618 ?auto_15637 ) ) ( not ( = ?auto_15619 ?auto_15637 ) ) ( not ( = ?auto_15625 ?auto_15652 ) ) ( IS-CRATE ?auto_15618 ) ( not ( = ?auto_15628 ?auto_15624 ) ) ( HOIST-AT ?auto_15640 ?auto_15628 ) ( SURFACE-AT ?auto_15618 ?auto_15628 ) ( ON ?auto_15618 ?auto_15641 ) ( CLEAR ?auto_15618 ) ( not ( = ?auto_15617 ?auto_15618 ) ) ( not ( = ?auto_15617 ?auto_15641 ) ) ( not ( = ?auto_15618 ?auto_15641 ) ) ( not ( = ?auto_15625 ?auto_15640 ) ) ( IS-CRATE ?auto_15617 ) ( AVAILABLE ?auto_15640 ) ( SURFACE-AT ?auto_15617 ?auto_15628 ) ( ON ?auto_15617 ?auto_15635 ) ( CLEAR ?auto_15617 ) ( not ( = ?auto_15616 ?auto_15617 ) ) ( not ( = ?auto_15616 ?auto_15635 ) ) ( not ( = ?auto_15617 ?auto_15635 ) ) ( IS-CRATE ?auto_15616 ) ( not ( = ?auto_15651 ?auto_15624 ) ) ( HOIST-AT ?auto_15642 ?auto_15651 ) ( SURFACE-AT ?auto_15616 ?auto_15651 ) ( ON ?auto_15616 ?auto_15630 ) ( CLEAR ?auto_15616 ) ( not ( = ?auto_15615 ?auto_15616 ) ) ( not ( = ?auto_15615 ?auto_15630 ) ) ( not ( = ?auto_15616 ?auto_15630 ) ) ( not ( = ?auto_15625 ?auto_15642 ) ) ( IS-CRATE ?auto_15615 ) ( not ( = ?auto_15632 ?auto_15624 ) ) ( HOIST-AT ?auto_15645 ?auto_15632 ) ( AVAILABLE ?auto_15645 ) ( SURFACE-AT ?auto_15615 ?auto_15632 ) ( ON ?auto_15615 ?auto_15633 ) ( CLEAR ?auto_15615 ) ( not ( = ?auto_15614 ?auto_15615 ) ) ( not ( = ?auto_15614 ?auto_15633 ) ) ( not ( = ?auto_15615 ?auto_15633 ) ) ( not ( = ?auto_15625 ?auto_15645 ) ) ( IS-CRATE ?auto_15614 ) ( not ( = ?auto_15638 ?auto_15624 ) ) ( HOIST-AT ?auto_15646 ?auto_15638 ) ( AVAILABLE ?auto_15646 ) ( SURFACE-AT ?auto_15614 ?auto_15638 ) ( ON ?auto_15614 ?auto_15643 ) ( CLEAR ?auto_15614 ) ( not ( = ?auto_15613 ?auto_15614 ) ) ( not ( = ?auto_15613 ?auto_15643 ) ) ( not ( = ?auto_15614 ?auto_15643 ) ) ( not ( = ?auto_15625 ?auto_15646 ) ) ( IS-CRATE ?auto_15613 ) ( not ( = ?auto_15639 ?auto_15624 ) ) ( HOIST-AT ?auto_15634 ?auto_15639 ) ( AVAILABLE ?auto_15634 ) ( SURFACE-AT ?auto_15613 ?auto_15639 ) ( ON ?auto_15613 ?auto_15644 ) ( CLEAR ?auto_15613 ) ( not ( = ?auto_15612 ?auto_15613 ) ) ( not ( = ?auto_15612 ?auto_15644 ) ) ( not ( = ?auto_15613 ?auto_15644 ) ) ( not ( = ?auto_15625 ?auto_15634 ) ) ( IS-CRATE ?auto_15612 ) ( AVAILABLE ?auto_15642 ) ( SURFACE-AT ?auto_15612 ?auto_15651 ) ( ON ?auto_15612 ?auto_15636 ) ( CLEAR ?auto_15612 ) ( not ( = ?auto_15611 ?auto_15612 ) ) ( not ( = ?auto_15611 ?auto_15636 ) ) ( not ( = ?auto_15612 ?auto_15636 ) ) ( IS-CRATE ?auto_15611 ) ( not ( = ?auto_15629 ?auto_15624 ) ) ( HOIST-AT ?auto_15647 ?auto_15629 ) ( AVAILABLE ?auto_15647 ) ( SURFACE-AT ?auto_15611 ?auto_15629 ) ( ON ?auto_15611 ?auto_15649 ) ( CLEAR ?auto_15611 ) ( not ( = ?auto_15610 ?auto_15611 ) ) ( not ( = ?auto_15610 ?auto_15649 ) ) ( not ( = ?auto_15611 ?auto_15649 ) ) ( not ( = ?auto_15625 ?auto_15647 ) ) ( SURFACE-AT ?auto_15609 ?auto_15624 ) ( CLEAR ?auto_15609 ) ( IS-CRATE ?auto_15610 ) ( AVAILABLE ?auto_15625 ) ( not ( = ?auto_15648 ?auto_15624 ) ) ( HOIST-AT ?auto_15627 ?auto_15648 ) ( AVAILABLE ?auto_15627 ) ( SURFACE-AT ?auto_15610 ?auto_15648 ) ( ON ?auto_15610 ?auto_15631 ) ( CLEAR ?auto_15610 ) ( TRUCK-AT ?auto_15626 ?auto_15624 ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15631 ) ) ( not ( = ?auto_15610 ?auto_15631 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15609 ?auto_15611 ) ) ( not ( = ?auto_15609 ?auto_15649 ) ) ( not ( = ?auto_15611 ?auto_15631 ) ) ( not ( = ?auto_15629 ?auto_15648 ) ) ( not ( = ?auto_15647 ?auto_15627 ) ) ( not ( = ?auto_15649 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15612 ) ) ( not ( = ?auto_15609 ?auto_15636 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15636 ) ) ( not ( = ?auto_15612 ?auto_15649 ) ) ( not ( = ?auto_15612 ?auto_15631 ) ) ( not ( = ?auto_15651 ?auto_15629 ) ) ( not ( = ?auto_15651 ?auto_15648 ) ) ( not ( = ?auto_15642 ?auto_15647 ) ) ( not ( = ?auto_15642 ?auto_15627 ) ) ( not ( = ?auto_15636 ?auto_15649 ) ) ( not ( = ?auto_15636 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15613 ) ) ( not ( = ?auto_15609 ?auto_15644 ) ) ( not ( = ?auto_15610 ?auto_15613 ) ) ( not ( = ?auto_15610 ?auto_15644 ) ) ( not ( = ?auto_15611 ?auto_15613 ) ) ( not ( = ?auto_15611 ?auto_15644 ) ) ( not ( = ?auto_15613 ?auto_15636 ) ) ( not ( = ?auto_15613 ?auto_15649 ) ) ( not ( = ?auto_15613 ?auto_15631 ) ) ( not ( = ?auto_15639 ?auto_15651 ) ) ( not ( = ?auto_15639 ?auto_15629 ) ) ( not ( = ?auto_15639 ?auto_15648 ) ) ( not ( = ?auto_15634 ?auto_15642 ) ) ( not ( = ?auto_15634 ?auto_15647 ) ) ( not ( = ?auto_15634 ?auto_15627 ) ) ( not ( = ?auto_15644 ?auto_15636 ) ) ( not ( = ?auto_15644 ?auto_15649 ) ) ( not ( = ?auto_15644 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15614 ) ) ( not ( = ?auto_15609 ?auto_15643 ) ) ( not ( = ?auto_15610 ?auto_15614 ) ) ( not ( = ?auto_15610 ?auto_15643 ) ) ( not ( = ?auto_15611 ?auto_15614 ) ) ( not ( = ?auto_15611 ?auto_15643 ) ) ( not ( = ?auto_15612 ?auto_15614 ) ) ( not ( = ?auto_15612 ?auto_15643 ) ) ( not ( = ?auto_15614 ?auto_15644 ) ) ( not ( = ?auto_15614 ?auto_15636 ) ) ( not ( = ?auto_15614 ?auto_15649 ) ) ( not ( = ?auto_15614 ?auto_15631 ) ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15651 ) ) ( not ( = ?auto_15638 ?auto_15629 ) ) ( not ( = ?auto_15638 ?auto_15648 ) ) ( not ( = ?auto_15646 ?auto_15634 ) ) ( not ( = ?auto_15646 ?auto_15642 ) ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15627 ) ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15636 ) ) ( not ( = ?auto_15643 ?auto_15649 ) ) ( not ( = ?auto_15643 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15615 ) ) ( not ( = ?auto_15609 ?auto_15633 ) ) ( not ( = ?auto_15610 ?auto_15615 ) ) ( not ( = ?auto_15610 ?auto_15633 ) ) ( not ( = ?auto_15611 ?auto_15615 ) ) ( not ( = ?auto_15611 ?auto_15633 ) ) ( not ( = ?auto_15612 ?auto_15615 ) ) ( not ( = ?auto_15612 ?auto_15633 ) ) ( not ( = ?auto_15613 ?auto_15615 ) ) ( not ( = ?auto_15613 ?auto_15633 ) ) ( not ( = ?auto_15615 ?auto_15643 ) ) ( not ( = ?auto_15615 ?auto_15644 ) ) ( not ( = ?auto_15615 ?auto_15636 ) ) ( not ( = ?auto_15615 ?auto_15649 ) ) ( not ( = ?auto_15615 ?auto_15631 ) ) ( not ( = ?auto_15632 ?auto_15638 ) ) ( not ( = ?auto_15632 ?auto_15639 ) ) ( not ( = ?auto_15632 ?auto_15651 ) ) ( not ( = ?auto_15632 ?auto_15629 ) ) ( not ( = ?auto_15632 ?auto_15648 ) ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15634 ) ) ( not ( = ?auto_15645 ?auto_15642 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( not ( = ?auto_15645 ?auto_15627 ) ) ( not ( = ?auto_15633 ?auto_15643 ) ) ( not ( = ?auto_15633 ?auto_15644 ) ) ( not ( = ?auto_15633 ?auto_15636 ) ) ( not ( = ?auto_15633 ?auto_15649 ) ) ( not ( = ?auto_15633 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15616 ) ) ( not ( = ?auto_15609 ?auto_15630 ) ) ( not ( = ?auto_15610 ?auto_15616 ) ) ( not ( = ?auto_15610 ?auto_15630 ) ) ( not ( = ?auto_15611 ?auto_15616 ) ) ( not ( = ?auto_15611 ?auto_15630 ) ) ( not ( = ?auto_15612 ?auto_15616 ) ) ( not ( = ?auto_15612 ?auto_15630 ) ) ( not ( = ?auto_15613 ?auto_15616 ) ) ( not ( = ?auto_15613 ?auto_15630 ) ) ( not ( = ?auto_15614 ?auto_15616 ) ) ( not ( = ?auto_15614 ?auto_15630 ) ) ( not ( = ?auto_15616 ?auto_15633 ) ) ( not ( = ?auto_15616 ?auto_15643 ) ) ( not ( = ?auto_15616 ?auto_15644 ) ) ( not ( = ?auto_15616 ?auto_15636 ) ) ( not ( = ?auto_15616 ?auto_15649 ) ) ( not ( = ?auto_15616 ?auto_15631 ) ) ( not ( = ?auto_15630 ?auto_15633 ) ) ( not ( = ?auto_15630 ?auto_15643 ) ) ( not ( = ?auto_15630 ?auto_15644 ) ) ( not ( = ?auto_15630 ?auto_15636 ) ) ( not ( = ?auto_15630 ?auto_15649 ) ) ( not ( = ?auto_15630 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15617 ) ) ( not ( = ?auto_15609 ?auto_15635 ) ) ( not ( = ?auto_15610 ?auto_15617 ) ) ( not ( = ?auto_15610 ?auto_15635 ) ) ( not ( = ?auto_15611 ?auto_15617 ) ) ( not ( = ?auto_15611 ?auto_15635 ) ) ( not ( = ?auto_15612 ?auto_15617 ) ) ( not ( = ?auto_15612 ?auto_15635 ) ) ( not ( = ?auto_15613 ?auto_15617 ) ) ( not ( = ?auto_15613 ?auto_15635 ) ) ( not ( = ?auto_15614 ?auto_15617 ) ) ( not ( = ?auto_15614 ?auto_15635 ) ) ( not ( = ?auto_15615 ?auto_15617 ) ) ( not ( = ?auto_15615 ?auto_15635 ) ) ( not ( = ?auto_15617 ?auto_15630 ) ) ( not ( = ?auto_15617 ?auto_15633 ) ) ( not ( = ?auto_15617 ?auto_15643 ) ) ( not ( = ?auto_15617 ?auto_15644 ) ) ( not ( = ?auto_15617 ?auto_15636 ) ) ( not ( = ?auto_15617 ?auto_15649 ) ) ( not ( = ?auto_15617 ?auto_15631 ) ) ( not ( = ?auto_15628 ?auto_15651 ) ) ( not ( = ?auto_15628 ?auto_15632 ) ) ( not ( = ?auto_15628 ?auto_15638 ) ) ( not ( = ?auto_15628 ?auto_15639 ) ) ( not ( = ?auto_15628 ?auto_15629 ) ) ( not ( = ?auto_15628 ?auto_15648 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15645 ) ) ( not ( = ?auto_15640 ?auto_15646 ) ) ( not ( = ?auto_15640 ?auto_15634 ) ) ( not ( = ?auto_15640 ?auto_15647 ) ) ( not ( = ?auto_15640 ?auto_15627 ) ) ( not ( = ?auto_15635 ?auto_15630 ) ) ( not ( = ?auto_15635 ?auto_15633 ) ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15635 ?auto_15644 ) ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15649 ) ) ( not ( = ?auto_15635 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15618 ) ) ( not ( = ?auto_15609 ?auto_15641 ) ) ( not ( = ?auto_15610 ?auto_15618 ) ) ( not ( = ?auto_15610 ?auto_15641 ) ) ( not ( = ?auto_15611 ?auto_15618 ) ) ( not ( = ?auto_15611 ?auto_15641 ) ) ( not ( = ?auto_15612 ?auto_15618 ) ) ( not ( = ?auto_15612 ?auto_15641 ) ) ( not ( = ?auto_15613 ?auto_15618 ) ) ( not ( = ?auto_15613 ?auto_15641 ) ) ( not ( = ?auto_15614 ?auto_15618 ) ) ( not ( = ?auto_15614 ?auto_15641 ) ) ( not ( = ?auto_15615 ?auto_15618 ) ) ( not ( = ?auto_15615 ?auto_15641 ) ) ( not ( = ?auto_15616 ?auto_15618 ) ) ( not ( = ?auto_15616 ?auto_15641 ) ) ( not ( = ?auto_15618 ?auto_15635 ) ) ( not ( = ?auto_15618 ?auto_15630 ) ) ( not ( = ?auto_15618 ?auto_15633 ) ) ( not ( = ?auto_15618 ?auto_15643 ) ) ( not ( = ?auto_15618 ?auto_15644 ) ) ( not ( = ?auto_15618 ?auto_15636 ) ) ( not ( = ?auto_15618 ?auto_15649 ) ) ( not ( = ?auto_15618 ?auto_15631 ) ) ( not ( = ?auto_15641 ?auto_15635 ) ) ( not ( = ?auto_15641 ?auto_15630 ) ) ( not ( = ?auto_15641 ?auto_15633 ) ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15641 ?auto_15644 ) ) ( not ( = ?auto_15641 ?auto_15636 ) ) ( not ( = ?auto_15641 ?auto_15649 ) ) ( not ( = ?auto_15641 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15619 ) ) ( not ( = ?auto_15609 ?auto_15637 ) ) ( not ( = ?auto_15610 ?auto_15619 ) ) ( not ( = ?auto_15610 ?auto_15637 ) ) ( not ( = ?auto_15611 ?auto_15619 ) ) ( not ( = ?auto_15611 ?auto_15637 ) ) ( not ( = ?auto_15612 ?auto_15619 ) ) ( not ( = ?auto_15612 ?auto_15637 ) ) ( not ( = ?auto_15613 ?auto_15619 ) ) ( not ( = ?auto_15613 ?auto_15637 ) ) ( not ( = ?auto_15614 ?auto_15619 ) ) ( not ( = ?auto_15614 ?auto_15637 ) ) ( not ( = ?auto_15615 ?auto_15619 ) ) ( not ( = ?auto_15615 ?auto_15637 ) ) ( not ( = ?auto_15616 ?auto_15619 ) ) ( not ( = ?auto_15616 ?auto_15637 ) ) ( not ( = ?auto_15617 ?auto_15619 ) ) ( not ( = ?auto_15617 ?auto_15637 ) ) ( not ( = ?auto_15619 ?auto_15641 ) ) ( not ( = ?auto_15619 ?auto_15635 ) ) ( not ( = ?auto_15619 ?auto_15630 ) ) ( not ( = ?auto_15619 ?auto_15633 ) ) ( not ( = ?auto_15619 ?auto_15643 ) ) ( not ( = ?auto_15619 ?auto_15644 ) ) ( not ( = ?auto_15619 ?auto_15636 ) ) ( not ( = ?auto_15619 ?auto_15649 ) ) ( not ( = ?auto_15619 ?auto_15631 ) ) ( not ( = ?auto_15650 ?auto_15628 ) ) ( not ( = ?auto_15650 ?auto_15651 ) ) ( not ( = ?auto_15650 ?auto_15632 ) ) ( not ( = ?auto_15650 ?auto_15638 ) ) ( not ( = ?auto_15650 ?auto_15639 ) ) ( not ( = ?auto_15650 ?auto_15629 ) ) ( not ( = ?auto_15650 ?auto_15648 ) ) ( not ( = ?auto_15652 ?auto_15640 ) ) ( not ( = ?auto_15652 ?auto_15642 ) ) ( not ( = ?auto_15652 ?auto_15645 ) ) ( not ( = ?auto_15652 ?auto_15646 ) ) ( not ( = ?auto_15652 ?auto_15634 ) ) ( not ( = ?auto_15652 ?auto_15647 ) ) ( not ( = ?auto_15652 ?auto_15627 ) ) ( not ( = ?auto_15637 ?auto_15641 ) ) ( not ( = ?auto_15637 ?auto_15635 ) ) ( not ( = ?auto_15637 ?auto_15630 ) ) ( not ( = ?auto_15637 ?auto_15633 ) ) ( not ( = ?auto_15637 ?auto_15643 ) ) ( not ( = ?auto_15637 ?auto_15644 ) ) ( not ( = ?auto_15637 ?auto_15636 ) ) ( not ( = ?auto_15637 ?auto_15649 ) ) ( not ( = ?auto_15637 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15620 ) ) ( not ( = ?auto_15609 ?auto_15621 ) ) ( not ( = ?auto_15610 ?auto_15620 ) ) ( not ( = ?auto_15610 ?auto_15621 ) ) ( not ( = ?auto_15611 ?auto_15620 ) ) ( not ( = ?auto_15611 ?auto_15621 ) ) ( not ( = ?auto_15612 ?auto_15620 ) ) ( not ( = ?auto_15612 ?auto_15621 ) ) ( not ( = ?auto_15613 ?auto_15620 ) ) ( not ( = ?auto_15613 ?auto_15621 ) ) ( not ( = ?auto_15614 ?auto_15620 ) ) ( not ( = ?auto_15614 ?auto_15621 ) ) ( not ( = ?auto_15615 ?auto_15620 ) ) ( not ( = ?auto_15615 ?auto_15621 ) ) ( not ( = ?auto_15616 ?auto_15620 ) ) ( not ( = ?auto_15616 ?auto_15621 ) ) ( not ( = ?auto_15617 ?auto_15620 ) ) ( not ( = ?auto_15617 ?auto_15621 ) ) ( not ( = ?auto_15618 ?auto_15620 ) ) ( not ( = ?auto_15618 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15637 ) ) ( not ( = ?auto_15620 ?auto_15641 ) ) ( not ( = ?auto_15620 ?auto_15635 ) ) ( not ( = ?auto_15620 ?auto_15630 ) ) ( not ( = ?auto_15620 ?auto_15633 ) ) ( not ( = ?auto_15620 ?auto_15643 ) ) ( not ( = ?auto_15620 ?auto_15644 ) ) ( not ( = ?auto_15620 ?auto_15636 ) ) ( not ( = ?auto_15620 ?auto_15649 ) ) ( not ( = ?auto_15620 ?auto_15631 ) ) ( not ( = ?auto_15622 ?auto_15650 ) ) ( not ( = ?auto_15622 ?auto_15628 ) ) ( not ( = ?auto_15622 ?auto_15651 ) ) ( not ( = ?auto_15622 ?auto_15632 ) ) ( not ( = ?auto_15622 ?auto_15638 ) ) ( not ( = ?auto_15622 ?auto_15639 ) ) ( not ( = ?auto_15622 ?auto_15629 ) ) ( not ( = ?auto_15622 ?auto_15648 ) ) ( not ( = ?auto_15623 ?auto_15652 ) ) ( not ( = ?auto_15623 ?auto_15640 ) ) ( not ( = ?auto_15623 ?auto_15642 ) ) ( not ( = ?auto_15623 ?auto_15645 ) ) ( not ( = ?auto_15623 ?auto_15646 ) ) ( not ( = ?auto_15623 ?auto_15634 ) ) ( not ( = ?auto_15623 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15627 ) ) ( not ( = ?auto_15621 ?auto_15637 ) ) ( not ( = ?auto_15621 ?auto_15641 ) ) ( not ( = ?auto_15621 ?auto_15635 ) ) ( not ( = ?auto_15621 ?auto_15630 ) ) ( not ( = ?auto_15621 ?auto_15633 ) ) ( not ( = ?auto_15621 ?auto_15643 ) ) ( not ( = ?auto_15621 ?auto_15644 ) ) ( not ( = ?auto_15621 ?auto_15636 ) ) ( not ( = ?auto_15621 ?auto_15649 ) ) ( not ( = ?auto_15621 ?auto_15631 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15609 ?auto_15610 ?auto_15611 ?auto_15612 ?auto_15613 ?auto_15614 ?auto_15615 ?auto_15616 ?auto_15617 ?auto_15618 ?auto_15619 )
      ( MAKE-1CRATE ?auto_15619 ?auto_15620 )
      ( MAKE-11CRATE-VERIFY ?auto_15609 ?auto_15610 ?auto_15611 ?auto_15612 ?auto_15613 ?auto_15614 ?auto_15615 ?auto_15616 ?auto_15617 ?auto_15618 ?auto_15619 ?auto_15620 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15676 - SURFACE
      ?auto_15677 - SURFACE
      ?auto_15678 - SURFACE
      ?auto_15679 - SURFACE
      ?auto_15680 - SURFACE
      ?auto_15681 - SURFACE
      ?auto_15682 - SURFACE
      ?auto_15683 - SURFACE
      ?auto_15684 - SURFACE
      ?auto_15685 - SURFACE
      ?auto_15686 - SURFACE
      ?auto_15687 - SURFACE
      ?auto_15688 - SURFACE
    )
    :vars
    (
      ?auto_15689 - HOIST
      ?auto_15694 - PLACE
      ?auto_15690 - PLACE
      ?auto_15691 - HOIST
      ?auto_15693 - SURFACE
      ?auto_15699 - PLACE
      ?auto_15720 - HOIST
      ?auto_15695 - SURFACE
      ?auto_15698 - PLACE
      ?auto_15707 - HOIST
      ?auto_15697 - SURFACE
      ?auto_15718 - PLACE
      ?auto_15721 - HOIST
      ?auto_15710 - SURFACE
      ?auto_15713 - SURFACE
      ?auto_15703 - PLACE
      ?auto_15704 - HOIST
      ?auto_15715 - SURFACE
      ?auto_15717 - PLACE
      ?auto_15716 - HOIST
      ?auto_15701 - SURFACE
      ?auto_15719 - PLACE
      ?auto_15705 - HOIST
      ?auto_15700 - SURFACE
      ?auto_15709 - PLACE
      ?auto_15708 - HOIST
      ?auto_15702 - SURFACE
      ?auto_15696 - SURFACE
      ?auto_15706 - PLACE
      ?auto_15723 - HOIST
      ?auto_15712 - SURFACE
      ?auto_15714 - PLACE
      ?auto_15711 - HOIST
      ?auto_15722 - SURFACE
      ?auto_15692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15689 ?auto_15694 ) ( IS-CRATE ?auto_15688 ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( HOIST-AT ?auto_15691 ?auto_15690 ) ( AVAILABLE ?auto_15691 ) ( SURFACE-AT ?auto_15688 ?auto_15690 ) ( ON ?auto_15688 ?auto_15693 ) ( CLEAR ?auto_15688 ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15693 ) ) ( not ( = ?auto_15688 ?auto_15693 ) ) ( not ( = ?auto_15689 ?auto_15691 ) ) ( IS-CRATE ?auto_15687 ) ( not ( = ?auto_15699 ?auto_15694 ) ) ( HOIST-AT ?auto_15720 ?auto_15699 ) ( AVAILABLE ?auto_15720 ) ( SURFACE-AT ?auto_15687 ?auto_15699 ) ( ON ?auto_15687 ?auto_15695 ) ( CLEAR ?auto_15687 ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15695 ) ) ( not ( = ?auto_15687 ?auto_15695 ) ) ( not ( = ?auto_15689 ?auto_15720 ) ) ( IS-CRATE ?auto_15686 ) ( not ( = ?auto_15698 ?auto_15694 ) ) ( HOIST-AT ?auto_15707 ?auto_15698 ) ( AVAILABLE ?auto_15707 ) ( SURFACE-AT ?auto_15686 ?auto_15698 ) ( ON ?auto_15686 ?auto_15697 ) ( CLEAR ?auto_15686 ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15685 ?auto_15697 ) ) ( not ( = ?auto_15686 ?auto_15697 ) ) ( not ( = ?auto_15689 ?auto_15707 ) ) ( IS-CRATE ?auto_15685 ) ( not ( = ?auto_15718 ?auto_15694 ) ) ( HOIST-AT ?auto_15721 ?auto_15718 ) ( SURFACE-AT ?auto_15685 ?auto_15718 ) ( ON ?auto_15685 ?auto_15710 ) ( CLEAR ?auto_15685 ) ( not ( = ?auto_15684 ?auto_15685 ) ) ( not ( = ?auto_15684 ?auto_15710 ) ) ( not ( = ?auto_15685 ?auto_15710 ) ) ( not ( = ?auto_15689 ?auto_15721 ) ) ( IS-CRATE ?auto_15684 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15684 ?auto_15718 ) ( ON ?auto_15684 ?auto_15713 ) ( CLEAR ?auto_15684 ) ( not ( = ?auto_15683 ?auto_15684 ) ) ( not ( = ?auto_15683 ?auto_15713 ) ) ( not ( = ?auto_15684 ?auto_15713 ) ) ( IS-CRATE ?auto_15683 ) ( not ( = ?auto_15703 ?auto_15694 ) ) ( HOIST-AT ?auto_15704 ?auto_15703 ) ( SURFACE-AT ?auto_15683 ?auto_15703 ) ( ON ?auto_15683 ?auto_15715 ) ( CLEAR ?auto_15683 ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15715 ) ) ( not ( = ?auto_15683 ?auto_15715 ) ) ( not ( = ?auto_15689 ?auto_15704 ) ) ( IS-CRATE ?auto_15682 ) ( not ( = ?auto_15717 ?auto_15694 ) ) ( HOIST-AT ?auto_15716 ?auto_15717 ) ( AVAILABLE ?auto_15716 ) ( SURFACE-AT ?auto_15682 ?auto_15717 ) ( ON ?auto_15682 ?auto_15701 ) ( CLEAR ?auto_15682 ) ( not ( = ?auto_15681 ?auto_15682 ) ) ( not ( = ?auto_15681 ?auto_15701 ) ) ( not ( = ?auto_15682 ?auto_15701 ) ) ( not ( = ?auto_15689 ?auto_15716 ) ) ( IS-CRATE ?auto_15681 ) ( not ( = ?auto_15719 ?auto_15694 ) ) ( HOIST-AT ?auto_15705 ?auto_15719 ) ( AVAILABLE ?auto_15705 ) ( SURFACE-AT ?auto_15681 ?auto_15719 ) ( ON ?auto_15681 ?auto_15700 ) ( CLEAR ?auto_15681 ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15700 ) ) ( not ( = ?auto_15681 ?auto_15700 ) ) ( not ( = ?auto_15689 ?auto_15705 ) ) ( IS-CRATE ?auto_15680 ) ( not ( = ?auto_15709 ?auto_15694 ) ) ( HOIST-AT ?auto_15708 ?auto_15709 ) ( AVAILABLE ?auto_15708 ) ( SURFACE-AT ?auto_15680 ?auto_15709 ) ( ON ?auto_15680 ?auto_15702 ) ( CLEAR ?auto_15680 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15702 ) ) ( not ( = ?auto_15680 ?auto_15702 ) ) ( not ( = ?auto_15689 ?auto_15708 ) ) ( IS-CRATE ?auto_15679 ) ( AVAILABLE ?auto_15704 ) ( SURFACE-AT ?auto_15679 ?auto_15703 ) ( ON ?auto_15679 ?auto_15696 ) ( CLEAR ?auto_15679 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15696 ) ) ( not ( = ?auto_15679 ?auto_15696 ) ) ( IS-CRATE ?auto_15678 ) ( not ( = ?auto_15706 ?auto_15694 ) ) ( HOIST-AT ?auto_15723 ?auto_15706 ) ( AVAILABLE ?auto_15723 ) ( SURFACE-AT ?auto_15678 ?auto_15706 ) ( ON ?auto_15678 ?auto_15712 ) ( CLEAR ?auto_15678 ) ( not ( = ?auto_15677 ?auto_15678 ) ) ( not ( = ?auto_15677 ?auto_15712 ) ) ( not ( = ?auto_15678 ?auto_15712 ) ) ( not ( = ?auto_15689 ?auto_15723 ) ) ( SURFACE-AT ?auto_15676 ?auto_15694 ) ( CLEAR ?auto_15676 ) ( IS-CRATE ?auto_15677 ) ( AVAILABLE ?auto_15689 ) ( not ( = ?auto_15714 ?auto_15694 ) ) ( HOIST-AT ?auto_15711 ?auto_15714 ) ( AVAILABLE ?auto_15711 ) ( SURFACE-AT ?auto_15677 ?auto_15714 ) ( ON ?auto_15677 ?auto_15722 ) ( CLEAR ?auto_15677 ) ( TRUCK-AT ?auto_15692 ?auto_15694 ) ( not ( = ?auto_15676 ?auto_15677 ) ) ( not ( = ?auto_15676 ?auto_15722 ) ) ( not ( = ?auto_15677 ?auto_15722 ) ) ( not ( = ?auto_15689 ?auto_15711 ) ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15676 ?auto_15712 ) ) ( not ( = ?auto_15678 ?auto_15722 ) ) ( not ( = ?auto_15706 ?auto_15714 ) ) ( not ( = ?auto_15723 ?auto_15711 ) ) ( not ( = ?auto_15712 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15679 ) ) ( not ( = ?auto_15676 ?auto_15696 ) ) ( not ( = ?auto_15677 ?auto_15679 ) ) ( not ( = ?auto_15677 ?auto_15696 ) ) ( not ( = ?auto_15679 ?auto_15712 ) ) ( not ( = ?auto_15679 ?auto_15722 ) ) ( not ( = ?auto_15703 ?auto_15706 ) ) ( not ( = ?auto_15703 ?auto_15714 ) ) ( not ( = ?auto_15704 ?auto_15723 ) ) ( not ( = ?auto_15704 ?auto_15711 ) ) ( not ( = ?auto_15696 ?auto_15712 ) ) ( not ( = ?auto_15696 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15680 ) ) ( not ( = ?auto_15676 ?auto_15702 ) ) ( not ( = ?auto_15677 ?auto_15680 ) ) ( not ( = ?auto_15677 ?auto_15702 ) ) ( not ( = ?auto_15678 ?auto_15680 ) ) ( not ( = ?auto_15678 ?auto_15702 ) ) ( not ( = ?auto_15680 ?auto_15696 ) ) ( not ( = ?auto_15680 ?auto_15712 ) ) ( not ( = ?auto_15680 ?auto_15722 ) ) ( not ( = ?auto_15709 ?auto_15703 ) ) ( not ( = ?auto_15709 ?auto_15706 ) ) ( not ( = ?auto_15709 ?auto_15714 ) ) ( not ( = ?auto_15708 ?auto_15704 ) ) ( not ( = ?auto_15708 ?auto_15723 ) ) ( not ( = ?auto_15708 ?auto_15711 ) ) ( not ( = ?auto_15702 ?auto_15696 ) ) ( not ( = ?auto_15702 ?auto_15712 ) ) ( not ( = ?auto_15702 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15681 ) ) ( not ( = ?auto_15676 ?auto_15700 ) ) ( not ( = ?auto_15677 ?auto_15681 ) ) ( not ( = ?auto_15677 ?auto_15700 ) ) ( not ( = ?auto_15678 ?auto_15681 ) ) ( not ( = ?auto_15678 ?auto_15700 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) ( not ( = ?auto_15679 ?auto_15700 ) ) ( not ( = ?auto_15681 ?auto_15702 ) ) ( not ( = ?auto_15681 ?auto_15696 ) ) ( not ( = ?auto_15681 ?auto_15712 ) ) ( not ( = ?auto_15681 ?auto_15722 ) ) ( not ( = ?auto_15719 ?auto_15709 ) ) ( not ( = ?auto_15719 ?auto_15703 ) ) ( not ( = ?auto_15719 ?auto_15706 ) ) ( not ( = ?auto_15719 ?auto_15714 ) ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15705 ?auto_15704 ) ) ( not ( = ?auto_15705 ?auto_15723 ) ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15696 ) ) ( not ( = ?auto_15700 ?auto_15712 ) ) ( not ( = ?auto_15700 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15682 ) ) ( not ( = ?auto_15676 ?auto_15701 ) ) ( not ( = ?auto_15677 ?auto_15682 ) ) ( not ( = ?auto_15677 ?auto_15701 ) ) ( not ( = ?auto_15678 ?auto_15682 ) ) ( not ( = ?auto_15678 ?auto_15701 ) ) ( not ( = ?auto_15679 ?auto_15682 ) ) ( not ( = ?auto_15679 ?auto_15701 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15701 ) ) ( not ( = ?auto_15682 ?auto_15700 ) ) ( not ( = ?auto_15682 ?auto_15702 ) ) ( not ( = ?auto_15682 ?auto_15696 ) ) ( not ( = ?auto_15682 ?auto_15712 ) ) ( not ( = ?auto_15682 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15719 ) ) ( not ( = ?auto_15717 ?auto_15709 ) ) ( not ( = ?auto_15717 ?auto_15703 ) ) ( not ( = ?auto_15717 ?auto_15706 ) ) ( not ( = ?auto_15717 ?auto_15714 ) ) ( not ( = ?auto_15716 ?auto_15705 ) ) ( not ( = ?auto_15716 ?auto_15708 ) ) ( not ( = ?auto_15716 ?auto_15704 ) ) ( not ( = ?auto_15716 ?auto_15723 ) ) ( not ( = ?auto_15716 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15700 ) ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15696 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( not ( = ?auto_15701 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15683 ) ) ( not ( = ?auto_15676 ?auto_15715 ) ) ( not ( = ?auto_15677 ?auto_15683 ) ) ( not ( = ?auto_15677 ?auto_15715 ) ) ( not ( = ?auto_15678 ?auto_15683 ) ) ( not ( = ?auto_15678 ?auto_15715 ) ) ( not ( = ?auto_15679 ?auto_15683 ) ) ( not ( = ?auto_15679 ?auto_15715 ) ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15680 ?auto_15715 ) ) ( not ( = ?auto_15681 ?auto_15683 ) ) ( not ( = ?auto_15681 ?auto_15715 ) ) ( not ( = ?auto_15683 ?auto_15701 ) ) ( not ( = ?auto_15683 ?auto_15700 ) ) ( not ( = ?auto_15683 ?auto_15702 ) ) ( not ( = ?auto_15683 ?auto_15696 ) ) ( not ( = ?auto_15683 ?auto_15712 ) ) ( not ( = ?auto_15683 ?auto_15722 ) ) ( not ( = ?auto_15715 ?auto_15701 ) ) ( not ( = ?auto_15715 ?auto_15700 ) ) ( not ( = ?auto_15715 ?auto_15702 ) ) ( not ( = ?auto_15715 ?auto_15696 ) ) ( not ( = ?auto_15715 ?auto_15712 ) ) ( not ( = ?auto_15715 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15684 ) ) ( not ( = ?auto_15676 ?auto_15713 ) ) ( not ( = ?auto_15677 ?auto_15684 ) ) ( not ( = ?auto_15677 ?auto_15713 ) ) ( not ( = ?auto_15678 ?auto_15684 ) ) ( not ( = ?auto_15678 ?auto_15713 ) ) ( not ( = ?auto_15679 ?auto_15684 ) ) ( not ( = ?auto_15679 ?auto_15713 ) ) ( not ( = ?auto_15680 ?auto_15684 ) ) ( not ( = ?auto_15680 ?auto_15713 ) ) ( not ( = ?auto_15681 ?auto_15684 ) ) ( not ( = ?auto_15681 ?auto_15713 ) ) ( not ( = ?auto_15682 ?auto_15684 ) ) ( not ( = ?auto_15682 ?auto_15713 ) ) ( not ( = ?auto_15684 ?auto_15715 ) ) ( not ( = ?auto_15684 ?auto_15701 ) ) ( not ( = ?auto_15684 ?auto_15700 ) ) ( not ( = ?auto_15684 ?auto_15702 ) ) ( not ( = ?auto_15684 ?auto_15696 ) ) ( not ( = ?auto_15684 ?auto_15712 ) ) ( not ( = ?auto_15684 ?auto_15722 ) ) ( not ( = ?auto_15718 ?auto_15703 ) ) ( not ( = ?auto_15718 ?auto_15717 ) ) ( not ( = ?auto_15718 ?auto_15719 ) ) ( not ( = ?auto_15718 ?auto_15709 ) ) ( not ( = ?auto_15718 ?auto_15706 ) ) ( not ( = ?auto_15718 ?auto_15714 ) ) ( not ( = ?auto_15721 ?auto_15704 ) ) ( not ( = ?auto_15721 ?auto_15716 ) ) ( not ( = ?auto_15721 ?auto_15705 ) ) ( not ( = ?auto_15721 ?auto_15708 ) ) ( not ( = ?auto_15721 ?auto_15723 ) ) ( not ( = ?auto_15721 ?auto_15711 ) ) ( not ( = ?auto_15713 ?auto_15715 ) ) ( not ( = ?auto_15713 ?auto_15701 ) ) ( not ( = ?auto_15713 ?auto_15700 ) ) ( not ( = ?auto_15713 ?auto_15702 ) ) ( not ( = ?auto_15713 ?auto_15696 ) ) ( not ( = ?auto_15713 ?auto_15712 ) ) ( not ( = ?auto_15713 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15685 ) ) ( not ( = ?auto_15676 ?auto_15710 ) ) ( not ( = ?auto_15677 ?auto_15685 ) ) ( not ( = ?auto_15677 ?auto_15710 ) ) ( not ( = ?auto_15678 ?auto_15685 ) ) ( not ( = ?auto_15678 ?auto_15710 ) ) ( not ( = ?auto_15679 ?auto_15685 ) ) ( not ( = ?auto_15679 ?auto_15710 ) ) ( not ( = ?auto_15680 ?auto_15685 ) ) ( not ( = ?auto_15680 ?auto_15710 ) ) ( not ( = ?auto_15681 ?auto_15685 ) ) ( not ( = ?auto_15681 ?auto_15710 ) ) ( not ( = ?auto_15682 ?auto_15685 ) ) ( not ( = ?auto_15682 ?auto_15710 ) ) ( not ( = ?auto_15683 ?auto_15685 ) ) ( not ( = ?auto_15683 ?auto_15710 ) ) ( not ( = ?auto_15685 ?auto_15713 ) ) ( not ( = ?auto_15685 ?auto_15715 ) ) ( not ( = ?auto_15685 ?auto_15701 ) ) ( not ( = ?auto_15685 ?auto_15700 ) ) ( not ( = ?auto_15685 ?auto_15702 ) ) ( not ( = ?auto_15685 ?auto_15696 ) ) ( not ( = ?auto_15685 ?auto_15712 ) ) ( not ( = ?auto_15685 ?auto_15722 ) ) ( not ( = ?auto_15710 ?auto_15713 ) ) ( not ( = ?auto_15710 ?auto_15715 ) ) ( not ( = ?auto_15710 ?auto_15701 ) ) ( not ( = ?auto_15710 ?auto_15700 ) ) ( not ( = ?auto_15710 ?auto_15702 ) ) ( not ( = ?auto_15710 ?auto_15696 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15686 ) ) ( not ( = ?auto_15676 ?auto_15697 ) ) ( not ( = ?auto_15677 ?auto_15686 ) ) ( not ( = ?auto_15677 ?auto_15697 ) ) ( not ( = ?auto_15678 ?auto_15686 ) ) ( not ( = ?auto_15678 ?auto_15697 ) ) ( not ( = ?auto_15679 ?auto_15686 ) ) ( not ( = ?auto_15679 ?auto_15697 ) ) ( not ( = ?auto_15680 ?auto_15686 ) ) ( not ( = ?auto_15680 ?auto_15697 ) ) ( not ( = ?auto_15681 ?auto_15686 ) ) ( not ( = ?auto_15681 ?auto_15697 ) ) ( not ( = ?auto_15682 ?auto_15686 ) ) ( not ( = ?auto_15682 ?auto_15697 ) ) ( not ( = ?auto_15683 ?auto_15686 ) ) ( not ( = ?auto_15683 ?auto_15697 ) ) ( not ( = ?auto_15684 ?auto_15686 ) ) ( not ( = ?auto_15684 ?auto_15697 ) ) ( not ( = ?auto_15686 ?auto_15710 ) ) ( not ( = ?auto_15686 ?auto_15713 ) ) ( not ( = ?auto_15686 ?auto_15715 ) ) ( not ( = ?auto_15686 ?auto_15701 ) ) ( not ( = ?auto_15686 ?auto_15700 ) ) ( not ( = ?auto_15686 ?auto_15702 ) ) ( not ( = ?auto_15686 ?auto_15696 ) ) ( not ( = ?auto_15686 ?auto_15712 ) ) ( not ( = ?auto_15686 ?auto_15722 ) ) ( not ( = ?auto_15698 ?auto_15718 ) ) ( not ( = ?auto_15698 ?auto_15703 ) ) ( not ( = ?auto_15698 ?auto_15717 ) ) ( not ( = ?auto_15698 ?auto_15719 ) ) ( not ( = ?auto_15698 ?auto_15709 ) ) ( not ( = ?auto_15698 ?auto_15706 ) ) ( not ( = ?auto_15698 ?auto_15714 ) ) ( not ( = ?auto_15707 ?auto_15721 ) ) ( not ( = ?auto_15707 ?auto_15704 ) ) ( not ( = ?auto_15707 ?auto_15716 ) ) ( not ( = ?auto_15707 ?auto_15705 ) ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15723 ) ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15697 ?auto_15710 ) ) ( not ( = ?auto_15697 ?auto_15713 ) ) ( not ( = ?auto_15697 ?auto_15715 ) ) ( not ( = ?auto_15697 ?auto_15701 ) ) ( not ( = ?auto_15697 ?auto_15700 ) ) ( not ( = ?auto_15697 ?auto_15702 ) ) ( not ( = ?auto_15697 ?auto_15696 ) ) ( not ( = ?auto_15697 ?auto_15712 ) ) ( not ( = ?auto_15697 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15687 ) ) ( not ( = ?auto_15676 ?auto_15695 ) ) ( not ( = ?auto_15677 ?auto_15687 ) ) ( not ( = ?auto_15677 ?auto_15695 ) ) ( not ( = ?auto_15678 ?auto_15687 ) ) ( not ( = ?auto_15678 ?auto_15695 ) ) ( not ( = ?auto_15679 ?auto_15687 ) ) ( not ( = ?auto_15679 ?auto_15695 ) ) ( not ( = ?auto_15680 ?auto_15687 ) ) ( not ( = ?auto_15680 ?auto_15695 ) ) ( not ( = ?auto_15681 ?auto_15687 ) ) ( not ( = ?auto_15681 ?auto_15695 ) ) ( not ( = ?auto_15682 ?auto_15687 ) ) ( not ( = ?auto_15682 ?auto_15695 ) ) ( not ( = ?auto_15683 ?auto_15687 ) ) ( not ( = ?auto_15683 ?auto_15695 ) ) ( not ( = ?auto_15684 ?auto_15687 ) ) ( not ( = ?auto_15684 ?auto_15695 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) ( not ( = ?auto_15685 ?auto_15695 ) ) ( not ( = ?auto_15687 ?auto_15697 ) ) ( not ( = ?auto_15687 ?auto_15710 ) ) ( not ( = ?auto_15687 ?auto_15713 ) ) ( not ( = ?auto_15687 ?auto_15715 ) ) ( not ( = ?auto_15687 ?auto_15701 ) ) ( not ( = ?auto_15687 ?auto_15700 ) ) ( not ( = ?auto_15687 ?auto_15702 ) ) ( not ( = ?auto_15687 ?auto_15696 ) ) ( not ( = ?auto_15687 ?auto_15712 ) ) ( not ( = ?auto_15687 ?auto_15722 ) ) ( not ( = ?auto_15699 ?auto_15698 ) ) ( not ( = ?auto_15699 ?auto_15718 ) ) ( not ( = ?auto_15699 ?auto_15703 ) ) ( not ( = ?auto_15699 ?auto_15717 ) ) ( not ( = ?auto_15699 ?auto_15719 ) ) ( not ( = ?auto_15699 ?auto_15709 ) ) ( not ( = ?auto_15699 ?auto_15706 ) ) ( not ( = ?auto_15699 ?auto_15714 ) ) ( not ( = ?auto_15720 ?auto_15707 ) ) ( not ( = ?auto_15720 ?auto_15721 ) ) ( not ( = ?auto_15720 ?auto_15704 ) ) ( not ( = ?auto_15720 ?auto_15716 ) ) ( not ( = ?auto_15720 ?auto_15705 ) ) ( not ( = ?auto_15720 ?auto_15708 ) ) ( not ( = ?auto_15720 ?auto_15723 ) ) ( not ( = ?auto_15720 ?auto_15711 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15710 ) ) ( not ( = ?auto_15695 ?auto_15713 ) ) ( not ( = ?auto_15695 ?auto_15715 ) ) ( not ( = ?auto_15695 ?auto_15701 ) ) ( not ( = ?auto_15695 ?auto_15700 ) ) ( not ( = ?auto_15695 ?auto_15702 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15712 ) ) ( not ( = ?auto_15695 ?auto_15722 ) ) ( not ( = ?auto_15676 ?auto_15688 ) ) ( not ( = ?auto_15676 ?auto_15693 ) ) ( not ( = ?auto_15677 ?auto_15688 ) ) ( not ( = ?auto_15677 ?auto_15693 ) ) ( not ( = ?auto_15678 ?auto_15688 ) ) ( not ( = ?auto_15678 ?auto_15693 ) ) ( not ( = ?auto_15679 ?auto_15688 ) ) ( not ( = ?auto_15679 ?auto_15693 ) ) ( not ( = ?auto_15680 ?auto_15688 ) ) ( not ( = ?auto_15680 ?auto_15693 ) ) ( not ( = ?auto_15681 ?auto_15688 ) ) ( not ( = ?auto_15681 ?auto_15693 ) ) ( not ( = ?auto_15682 ?auto_15688 ) ) ( not ( = ?auto_15682 ?auto_15693 ) ) ( not ( = ?auto_15683 ?auto_15688 ) ) ( not ( = ?auto_15683 ?auto_15693 ) ) ( not ( = ?auto_15684 ?auto_15688 ) ) ( not ( = ?auto_15684 ?auto_15693 ) ) ( not ( = ?auto_15685 ?auto_15688 ) ) ( not ( = ?auto_15685 ?auto_15693 ) ) ( not ( = ?auto_15686 ?auto_15688 ) ) ( not ( = ?auto_15686 ?auto_15693 ) ) ( not ( = ?auto_15688 ?auto_15695 ) ) ( not ( = ?auto_15688 ?auto_15697 ) ) ( not ( = ?auto_15688 ?auto_15710 ) ) ( not ( = ?auto_15688 ?auto_15713 ) ) ( not ( = ?auto_15688 ?auto_15715 ) ) ( not ( = ?auto_15688 ?auto_15701 ) ) ( not ( = ?auto_15688 ?auto_15700 ) ) ( not ( = ?auto_15688 ?auto_15702 ) ) ( not ( = ?auto_15688 ?auto_15696 ) ) ( not ( = ?auto_15688 ?auto_15712 ) ) ( not ( = ?auto_15688 ?auto_15722 ) ) ( not ( = ?auto_15690 ?auto_15699 ) ) ( not ( = ?auto_15690 ?auto_15698 ) ) ( not ( = ?auto_15690 ?auto_15718 ) ) ( not ( = ?auto_15690 ?auto_15703 ) ) ( not ( = ?auto_15690 ?auto_15717 ) ) ( not ( = ?auto_15690 ?auto_15719 ) ) ( not ( = ?auto_15690 ?auto_15709 ) ) ( not ( = ?auto_15690 ?auto_15706 ) ) ( not ( = ?auto_15690 ?auto_15714 ) ) ( not ( = ?auto_15691 ?auto_15720 ) ) ( not ( = ?auto_15691 ?auto_15707 ) ) ( not ( = ?auto_15691 ?auto_15721 ) ) ( not ( = ?auto_15691 ?auto_15704 ) ) ( not ( = ?auto_15691 ?auto_15716 ) ) ( not ( = ?auto_15691 ?auto_15705 ) ) ( not ( = ?auto_15691 ?auto_15708 ) ) ( not ( = ?auto_15691 ?auto_15723 ) ) ( not ( = ?auto_15691 ?auto_15711 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15697 ) ) ( not ( = ?auto_15693 ?auto_15710 ) ) ( not ( = ?auto_15693 ?auto_15713 ) ) ( not ( = ?auto_15693 ?auto_15715 ) ) ( not ( = ?auto_15693 ?auto_15701 ) ) ( not ( = ?auto_15693 ?auto_15700 ) ) ( not ( = ?auto_15693 ?auto_15702 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15712 ) ) ( not ( = ?auto_15693 ?auto_15722 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15681 ?auto_15682 ?auto_15683 ?auto_15684 ?auto_15685 ?auto_15686 ?auto_15687 )
      ( MAKE-1CRATE ?auto_15687 ?auto_15688 )
      ( MAKE-12CRATE-VERIFY ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15681 ?auto_15682 ?auto_15683 ?auto_15684 ?auto_15685 ?auto_15686 ?auto_15687 ?auto_15688 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15748 - SURFACE
      ?auto_15749 - SURFACE
      ?auto_15750 - SURFACE
      ?auto_15751 - SURFACE
      ?auto_15752 - SURFACE
      ?auto_15753 - SURFACE
      ?auto_15754 - SURFACE
      ?auto_15755 - SURFACE
      ?auto_15756 - SURFACE
      ?auto_15757 - SURFACE
      ?auto_15758 - SURFACE
      ?auto_15759 - SURFACE
      ?auto_15760 - SURFACE
      ?auto_15761 - SURFACE
    )
    :vars
    (
      ?auto_15764 - HOIST
      ?auto_15766 - PLACE
      ?auto_15765 - PLACE
      ?auto_15763 - HOIST
      ?auto_15762 - SURFACE
      ?auto_15780 - SURFACE
      ?auto_15777 - PLACE
      ?auto_15772 - HOIST
      ?auto_15797 - SURFACE
      ?auto_15770 - PLACE
      ?auto_15782 - HOIST
      ?auto_15768 - SURFACE
      ?auto_15795 - PLACE
      ?auto_15783 - HOIST
      ?auto_15793 - SURFACE
      ?auto_15788 - SURFACE
      ?auto_15792 - PLACE
      ?auto_15773 - HOIST
      ?auto_15791 - SURFACE
      ?auto_15785 - PLACE
      ?auto_15774 - HOIST
      ?auto_15789 - SURFACE
      ?auto_15775 - PLACE
      ?auto_15787 - HOIST
      ?auto_15769 - SURFACE
      ?auto_15786 - PLACE
      ?auto_15771 - HOIST
      ?auto_15796 - SURFACE
      ?auto_15794 - SURFACE
      ?auto_15778 - PLACE
      ?auto_15779 - HOIST
      ?auto_15784 - SURFACE
      ?auto_15776 - PLACE
      ?auto_15781 - HOIST
      ?auto_15790 - SURFACE
      ?auto_15767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15764 ?auto_15766 ) ( IS-CRATE ?auto_15761 ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( HOIST-AT ?auto_15763 ?auto_15765 ) ( SURFACE-AT ?auto_15761 ?auto_15765 ) ( ON ?auto_15761 ?auto_15762 ) ( CLEAR ?auto_15761 ) ( not ( = ?auto_15760 ?auto_15761 ) ) ( not ( = ?auto_15760 ?auto_15762 ) ) ( not ( = ?auto_15761 ?auto_15762 ) ) ( not ( = ?auto_15764 ?auto_15763 ) ) ( IS-CRATE ?auto_15760 ) ( AVAILABLE ?auto_15763 ) ( SURFACE-AT ?auto_15760 ?auto_15765 ) ( ON ?auto_15760 ?auto_15780 ) ( CLEAR ?auto_15760 ) ( not ( = ?auto_15759 ?auto_15760 ) ) ( not ( = ?auto_15759 ?auto_15780 ) ) ( not ( = ?auto_15760 ?auto_15780 ) ) ( IS-CRATE ?auto_15759 ) ( not ( = ?auto_15777 ?auto_15766 ) ) ( HOIST-AT ?auto_15772 ?auto_15777 ) ( AVAILABLE ?auto_15772 ) ( SURFACE-AT ?auto_15759 ?auto_15777 ) ( ON ?auto_15759 ?auto_15797 ) ( CLEAR ?auto_15759 ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15797 ) ) ( not ( = ?auto_15759 ?auto_15797 ) ) ( not ( = ?auto_15764 ?auto_15772 ) ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15770 ?auto_15766 ) ) ( HOIST-AT ?auto_15782 ?auto_15770 ) ( AVAILABLE ?auto_15782 ) ( SURFACE-AT ?auto_15758 ?auto_15770 ) ( ON ?auto_15758 ?auto_15768 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15768 ) ) ( not ( = ?auto_15758 ?auto_15768 ) ) ( not ( = ?auto_15764 ?auto_15782 ) ) ( IS-CRATE ?auto_15757 ) ( not ( = ?auto_15795 ?auto_15766 ) ) ( HOIST-AT ?auto_15783 ?auto_15795 ) ( SURFACE-AT ?auto_15757 ?auto_15795 ) ( ON ?auto_15757 ?auto_15793 ) ( CLEAR ?auto_15757 ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15793 ) ) ( not ( = ?auto_15757 ?auto_15793 ) ) ( not ( = ?auto_15764 ?auto_15783 ) ) ( IS-CRATE ?auto_15756 ) ( AVAILABLE ?auto_15783 ) ( SURFACE-AT ?auto_15756 ?auto_15795 ) ( ON ?auto_15756 ?auto_15788 ) ( CLEAR ?auto_15756 ) ( not ( = ?auto_15755 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15788 ) ) ( not ( = ?auto_15756 ?auto_15788 ) ) ( IS-CRATE ?auto_15755 ) ( not ( = ?auto_15792 ?auto_15766 ) ) ( HOIST-AT ?auto_15773 ?auto_15792 ) ( SURFACE-AT ?auto_15755 ?auto_15792 ) ( ON ?auto_15755 ?auto_15791 ) ( CLEAR ?auto_15755 ) ( not ( = ?auto_15754 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15791 ) ) ( not ( = ?auto_15755 ?auto_15791 ) ) ( not ( = ?auto_15764 ?auto_15773 ) ) ( IS-CRATE ?auto_15754 ) ( not ( = ?auto_15785 ?auto_15766 ) ) ( HOIST-AT ?auto_15774 ?auto_15785 ) ( AVAILABLE ?auto_15774 ) ( SURFACE-AT ?auto_15754 ?auto_15785 ) ( ON ?auto_15754 ?auto_15789 ) ( CLEAR ?auto_15754 ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( not ( = ?auto_15753 ?auto_15789 ) ) ( not ( = ?auto_15754 ?auto_15789 ) ) ( not ( = ?auto_15764 ?auto_15774 ) ) ( IS-CRATE ?auto_15753 ) ( not ( = ?auto_15775 ?auto_15766 ) ) ( HOIST-AT ?auto_15787 ?auto_15775 ) ( AVAILABLE ?auto_15787 ) ( SURFACE-AT ?auto_15753 ?auto_15775 ) ( ON ?auto_15753 ?auto_15769 ) ( CLEAR ?auto_15753 ) ( not ( = ?auto_15752 ?auto_15753 ) ) ( not ( = ?auto_15752 ?auto_15769 ) ) ( not ( = ?auto_15753 ?auto_15769 ) ) ( not ( = ?auto_15764 ?auto_15787 ) ) ( IS-CRATE ?auto_15752 ) ( not ( = ?auto_15786 ?auto_15766 ) ) ( HOIST-AT ?auto_15771 ?auto_15786 ) ( AVAILABLE ?auto_15771 ) ( SURFACE-AT ?auto_15752 ?auto_15786 ) ( ON ?auto_15752 ?auto_15796 ) ( CLEAR ?auto_15752 ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( not ( = ?auto_15751 ?auto_15796 ) ) ( not ( = ?auto_15752 ?auto_15796 ) ) ( not ( = ?auto_15764 ?auto_15771 ) ) ( IS-CRATE ?auto_15751 ) ( AVAILABLE ?auto_15773 ) ( SURFACE-AT ?auto_15751 ?auto_15792 ) ( ON ?auto_15751 ?auto_15794 ) ( CLEAR ?auto_15751 ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( not ( = ?auto_15750 ?auto_15794 ) ) ( not ( = ?auto_15751 ?auto_15794 ) ) ( IS-CRATE ?auto_15750 ) ( not ( = ?auto_15778 ?auto_15766 ) ) ( HOIST-AT ?auto_15779 ?auto_15778 ) ( AVAILABLE ?auto_15779 ) ( SURFACE-AT ?auto_15750 ?auto_15778 ) ( ON ?auto_15750 ?auto_15784 ) ( CLEAR ?auto_15750 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( not ( = ?auto_15749 ?auto_15784 ) ) ( not ( = ?auto_15750 ?auto_15784 ) ) ( not ( = ?auto_15764 ?auto_15779 ) ) ( SURFACE-AT ?auto_15748 ?auto_15766 ) ( CLEAR ?auto_15748 ) ( IS-CRATE ?auto_15749 ) ( AVAILABLE ?auto_15764 ) ( not ( = ?auto_15776 ?auto_15766 ) ) ( HOIST-AT ?auto_15781 ?auto_15776 ) ( AVAILABLE ?auto_15781 ) ( SURFACE-AT ?auto_15749 ?auto_15776 ) ( ON ?auto_15749 ?auto_15790 ) ( CLEAR ?auto_15749 ) ( TRUCK-AT ?auto_15767 ?auto_15766 ) ( not ( = ?auto_15748 ?auto_15749 ) ) ( not ( = ?auto_15748 ?auto_15790 ) ) ( not ( = ?auto_15749 ?auto_15790 ) ) ( not ( = ?auto_15764 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15750 ) ) ( not ( = ?auto_15748 ?auto_15784 ) ) ( not ( = ?auto_15750 ?auto_15790 ) ) ( not ( = ?auto_15778 ?auto_15776 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15784 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15751 ) ) ( not ( = ?auto_15748 ?auto_15794 ) ) ( not ( = ?auto_15749 ?auto_15751 ) ) ( not ( = ?auto_15749 ?auto_15794 ) ) ( not ( = ?auto_15751 ?auto_15784 ) ) ( not ( = ?auto_15751 ?auto_15790 ) ) ( not ( = ?auto_15792 ?auto_15778 ) ) ( not ( = ?auto_15792 ?auto_15776 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( not ( = ?auto_15773 ?auto_15781 ) ) ( not ( = ?auto_15794 ?auto_15784 ) ) ( not ( = ?auto_15794 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15752 ) ) ( not ( = ?auto_15748 ?auto_15796 ) ) ( not ( = ?auto_15749 ?auto_15752 ) ) ( not ( = ?auto_15749 ?auto_15796 ) ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15750 ?auto_15796 ) ) ( not ( = ?auto_15752 ?auto_15794 ) ) ( not ( = ?auto_15752 ?auto_15784 ) ) ( not ( = ?auto_15752 ?auto_15790 ) ) ( not ( = ?auto_15786 ?auto_15792 ) ) ( not ( = ?auto_15786 ?auto_15778 ) ) ( not ( = ?auto_15786 ?auto_15776 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15779 ) ) ( not ( = ?auto_15771 ?auto_15781 ) ) ( not ( = ?auto_15796 ?auto_15794 ) ) ( not ( = ?auto_15796 ?auto_15784 ) ) ( not ( = ?auto_15796 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15753 ) ) ( not ( = ?auto_15748 ?auto_15769 ) ) ( not ( = ?auto_15749 ?auto_15753 ) ) ( not ( = ?auto_15749 ?auto_15769 ) ) ( not ( = ?auto_15750 ?auto_15753 ) ) ( not ( = ?auto_15750 ?auto_15769 ) ) ( not ( = ?auto_15751 ?auto_15753 ) ) ( not ( = ?auto_15751 ?auto_15769 ) ) ( not ( = ?auto_15753 ?auto_15796 ) ) ( not ( = ?auto_15753 ?auto_15794 ) ) ( not ( = ?auto_15753 ?auto_15784 ) ) ( not ( = ?auto_15753 ?auto_15790 ) ) ( not ( = ?auto_15775 ?auto_15786 ) ) ( not ( = ?auto_15775 ?auto_15792 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15787 ?auto_15771 ) ) ( not ( = ?auto_15787 ?auto_15773 ) ) ( not ( = ?auto_15787 ?auto_15779 ) ) ( not ( = ?auto_15787 ?auto_15781 ) ) ( not ( = ?auto_15769 ?auto_15796 ) ) ( not ( = ?auto_15769 ?auto_15794 ) ) ( not ( = ?auto_15769 ?auto_15784 ) ) ( not ( = ?auto_15769 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15754 ) ) ( not ( = ?auto_15748 ?auto_15789 ) ) ( not ( = ?auto_15749 ?auto_15754 ) ) ( not ( = ?auto_15749 ?auto_15789 ) ) ( not ( = ?auto_15750 ?auto_15754 ) ) ( not ( = ?auto_15750 ?auto_15789 ) ) ( not ( = ?auto_15751 ?auto_15754 ) ) ( not ( = ?auto_15751 ?auto_15789 ) ) ( not ( = ?auto_15752 ?auto_15754 ) ) ( not ( = ?auto_15752 ?auto_15789 ) ) ( not ( = ?auto_15754 ?auto_15769 ) ) ( not ( = ?auto_15754 ?auto_15796 ) ) ( not ( = ?auto_15754 ?auto_15794 ) ) ( not ( = ?auto_15754 ?auto_15784 ) ) ( not ( = ?auto_15754 ?auto_15790 ) ) ( not ( = ?auto_15785 ?auto_15775 ) ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15792 ) ) ( not ( = ?auto_15785 ?auto_15778 ) ) ( not ( = ?auto_15785 ?auto_15776 ) ) ( not ( = ?auto_15774 ?auto_15787 ) ) ( not ( = ?auto_15774 ?auto_15771 ) ) ( not ( = ?auto_15774 ?auto_15773 ) ) ( not ( = ?auto_15774 ?auto_15779 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15789 ?auto_15769 ) ) ( not ( = ?auto_15789 ?auto_15796 ) ) ( not ( = ?auto_15789 ?auto_15794 ) ) ( not ( = ?auto_15789 ?auto_15784 ) ) ( not ( = ?auto_15789 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15755 ) ) ( not ( = ?auto_15748 ?auto_15791 ) ) ( not ( = ?auto_15749 ?auto_15755 ) ) ( not ( = ?auto_15749 ?auto_15791 ) ) ( not ( = ?auto_15750 ?auto_15755 ) ) ( not ( = ?auto_15750 ?auto_15791 ) ) ( not ( = ?auto_15751 ?auto_15755 ) ) ( not ( = ?auto_15751 ?auto_15791 ) ) ( not ( = ?auto_15752 ?auto_15755 ) ) ( not ( = ?auto_15752 ?auto_15791 ) ) ( not ( = ?auto_15753 ?auto_15755 ) ) ( not ( = ?auto_15753 ?auto_15791 ) ) ( not ( = ?auto_15755 ?auto_15789 ) ) ( not ( = ?auto_15755 ?auto_15769 ) ) ( not ( = ?auto_15755 ?auto_15796 ) ) ( not ( = ?auto_15755 ?auto_15794 ) ) ( not ( = ?auto_15755 ?auto_15784 ) ) ( not ( = ?auto_15755 ?auto_15790 ) ) ( not ( = ?auto_15791 ?auto_15789 ) ) ( not ( = ?auto_15791 ?auto_15769 ) ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15791 ?auto_15794 ) ) ( not ( = ?auto_15791 ?auto_15784 ) ) ( not ( = ?auto_15791 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15756 ) ) ( not ( = ?auto_15748 ?auto_15788 ) ) ( not ( = ?auto_15749 ?auto_15756 ) ) ( not ( = ?auto_15749 ?auto_15788 ) ) ( not ( = ?auto_15750 ?auto_15756 ) ) ( not ( = ?auto_15750 ?auto_15788 ) ) ( not ( = ?auto_15751 ?auto_15756 ) ) ( not ( = ?auto_15751 ?auto_15788 ) ) ( not ( = ?auto_15752 ?auto_15756 ) ) ( not ( = ?auto_15752 ?auto_15788 ) ) ( not ( = ?auto_15753 ?auto_15756 ) ) ( not ( = ?auto_15753 ?auto_15788 ) ) ( not ( = ?auto_15754 ?auto_15756 ) ) ( not ( = ?auto_15754 ?auto_15788 ) ) ( not ( = ?auto_15756 ?auto_15791 ) ) ( not ( = ?auto_15756 ?auto_15789 ) ) ( not ( = ?auto_15756 ?auto_15769 ) ) ( not ( = ?auto_15756 ?auto_15796 ) ) ( not ( = ?auto_15756 ?auto_15794 ) ) ( not ( = ?auto_15756 ?auto_15784 ) ) ( not ( = ?auto_15756 ?auto_15790 ) ) ( not ( = ?auto_15795 ?auto_15792 ) ) ( not ( = ?auto_15795 ?auto_15785 ) ) ( not ( = ?auto_15795 ?auto_15775 ) ) ( not ( = ?auto_15795 ?auto_15786 ) ) ( not ( = ?auto_15795 ?auto_15778 ) ) ( not ( = ?auto_15795 ?auto_15776 ) ) ( not ( = ?auto_15783 ?auto_15773 ) ) ( not ( = ?auto_15783 ?auto_15774 ) ) ( not ( = ?auto_15783 ?auto_15787 ) ) ( not ( = ?auto_15783 ?auto_15771 ) ) ( not ( = ?auto_15783 ?auto_15779 ) ) ( not ( = ?auto_15783 ?auto_15781 ) ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( not ( = ?auto_15788 ?auto_15789 ) ) ( not ( = ?auto_15788 ?auto_15769 ) ) ( not ( = ?auto_15788 ?auto_15796 ) ) ( not ( = ?auto_15788 ?auto_15794 ) ) ( not ( = ?auto_15788 ?auto_15784 ) ) ( not ( = ?auto_15788 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15757 ) ) ( not ( = ?auto_15748 ?auto_15793 ) ) ( not ( = ?auto_15749 ?auto_15757 ) ) ( not ( = ?auto_15749 ?auto_15793 ) ) ( not ( = ?auto_15750 ?auto_15757 ) ) ( not ( = ?auto_15750 ?auto_15793 ) ) ( not ( = ?auto_15751 ?auto_15757 ) ) ( not ( = ?auto_15751 ?auto_15793 ) ) ( not ( = ?auto_15752 ?auto_15757 ) ) ( not ( = ?auto_15752 ?auto_15793 ) ) ( not ( = ?auto_15753 ?auto_15757 ) ) ( not ( = ?auto_15753 ?auto_15793 ) ) ( not ( = ?auto_15754 ?auto_15757 ) ) ( not ( = ?auto_15754 ?auto_15793 ) ) ( not ( = ?auto_15755 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15793 ) ) ( not ( = ?auto_15757 ?auto_15788 ) ) ( not ( = ?auto_15757 ?auto_15791 ) ) ( not ( = ?auto_15757 ?auto_15789 ) ) ( not ( = ?auto_15757 ?auto_15769 ) ) ( not ( = ?auto_15757 ?auto_15796 ) ) ( not ( = ?auto_15757 ?auto_15794 ) ) ( not ( = ?auto_15757 ?auto_15784 ) ) ( not ( = ?auto_15757 ?auto_15790 ) ) ( not ( = ?auto_15793 ?auto_15788 ) ) ( not ( = ?auto_15793 ?auto_15791 ) ) ( not ( = ?auto_15793 ?auto_15789 ) ) ( not ( = ?auto_15793 ?auto_15769 ) ) ( not ( = ?auto_15793 ?auto_15796 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15784 ) ) ( not ( = ?auto_15793 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15758 ) ) ( not ( = ?auto_15748 ?auto_15768 ) ) ( not ( = ?auto_15749 ?auto_15758 ) ) ( not ( = ?auto_15749 ?auto_15768 ) ) ( not ( = ?auto_15750 ?auto_15758 ) ) ( not ( = ?auto_15750 ?auto_15768 ) ) ( not ( = ?auto_15751 ?auto_15758 ) ) ( not ( = ?auto_15751 ?auto_15768 ) ) ( not ( = ?auto_15752 ?auto_15758 ) ) ( not ( = ?auto_15752 ?auto_15768 ) ) ( not ( = ?auto_15753 ?auto_15758 ) ) ( not ( = ?auto_15753 ?auto_15768 ) ) ( not ( = ?auto_15754 ?auto_15758 ) ) ( not ( = ?auto_15754 ?auto_15768 ) ) ( not ( = ?auto_15755 ?auto_15758 ) ) ( not ( = ?auto_15755 ?auto_15768 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15768 ) ) ( not ( = ?auto_15758 ?auto_15793 ) ) ( not ( = ?auto_15758 ?auto_15788 ) ) ( not ( = ?auto_15758 ?auto_15791 ) ) ( not ( = ?auto_15758 ?auto_15789 ) ) ( not ( = ?auto_15758 ?auto_15769 ) ) ( not ( = ?auto_15758 ?auto_15796 ) ) ( not ( = ?auto_15758 ?auto_15794 ) ) ( not ( = ?auto_15758 ?auto_15784 ) ) ( not ( = ?auto_15758 ?auto_15790 ) ) ( not ( = ?auto_15770 ?auto_15795 ) ) ( not ( = ?auto_15770 ?auto_15792 ) ) ( not ( = ?auto_15770 ?auto_15785 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( not ( = ?auto_15770 ?auto_15786 ) ) ( not ( = ?auto_15770 ?auto_15778 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( not ( = ?auto_15782 ?auto_15783 ) ) ( not ( = ?auto_15782 ?auto_15773 ) ) ( not ( = ?auto_15782 ?auto_15774 ) ) ( not ( = ?auto_15782 ?auto_15787 ) ) ( not ( = ?auto_15782 ?auto_15771 ) ) ( not ( = ?auto_15782 ?auto_15779 ) ) ( not ( = ?auto_15782 ?auto_15781 ) ) ( not ( = ?auto_15768 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15788 ) ) ( not ( = ?auto_15768 ?auto_15791 ) ) ( not ( = ?auto_15768 ?auto_15789 ) ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15796 ) ) ( not ( = ?auto_15768 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15784 ) ) ( not ( = ?auto_15768 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15759 ) ) ( not ( = ?auto_15748 ?auto_15797 ) ) ( not ( = ?auto_15749 ?auto_15759 ) ) ( not ( = ?auto_15749 ?auto_15797 ) ) ( not ( = ?auto_15750 ?auto_15759 ) ) ( not ( = ?auto_15750 ?auto_15797 ) ) ( not ( = ?auto_15751 ?auto_15759 ) ) ( not ( = ?auto_15751 ?auto_15797 ) ) ( not ( = ?auto_15752 ?auto_15759 ) ) ( not ( = ?auto_15752 ?auto_15797 ) ) ( not ( = ?auto_15753 ?auto_15759 ) ) ( not ( = ?auto_15753 ?auto_15797 ) ) ( not ( = ?auto_15754 ?auto_15759 ) ) ( not ( = ?auto_15754 ?auto_15797 ) ) ( not ( = ?auto_15755 ?auto_15759 ) ) ( not ( = ?auto_15755 ?auto_15797 ) ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( not ( = ?auto_15756 ?auto_15797 ) ) ( not ( = ?auto_15757 ?auto_15759 ) ) ( not ( = ?auto_15757 ?auto_15797 ) ) ( not ( = ?auto_15759 ?auto_15768 ) ) ( not ( = ?auto_15759 ?auto_15793 ) ) ( not ( = ?auto_15759 ?auto_15788 ) ) ( not ( = ?auto_15759 ?auto_15791 ) ) ( not ( = ?auto_15759 ?auto_15789 ) ) ( not ( = ?auto_15759 ?auto_15769 ) ) ( not ( = ?auto_15759 ?auto_15796 ) ) ( not ( = ?auto_15759 ?auto_15794 ) ) ( not ( = ?auto_15759 ?auto_15784 ) ) ( not ( = ?auto_15759 ?auto_15790 ) ) ( not ( = ?auto_15777 ?auto_15770 ) ) ( not ( = ?auto_15777 ?auto_15795 ) ) ( not ( = ?auto_15777 ?auto_15792 ) ) ( not ( = ?auto_15777 ?auto_15785 ) ) ( not ( = ?auto_15777 ?auto_15775 ) ) ( not ( = ?auto_15777 ?auto_15786 ) ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15776 ) ) ( not ( = ?auto_15772 ?auto_15782 ) ) ( not ( = ?auto_15772 ?auto_15783 ) ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15787 ) ) ( not ( = ?auto_15772 ?auto_15771 ) ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15772 ?auto_15781 ) ) ( not ( = ?auto_15797 ?auto_15768 ) ) ( not ( = ?auto_15797 ?auto_15793 ) ) ( not ( = ?auto_15797 ?auto_15788 ) ) ( not ( = ?auto_15797 ?auto_15791 ) ) ( not ( = ?auto_15797 ?auto_15789 ) ) ( not ( = ?auto_15797 ?auto_15769 ) ) ( not ( = ?auto_15797 ?auto_15796 ) ) ( not ( = ?auto_15797 ?auto_15794 ) ) ( not ( = ?auto_15797 ?auto_15784 ) ) ( not ( = ?auto_15797 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15760 ) ) ( not ( = ?auto_15748 ?auto_15780 ) ) ( not ( = ?auto_15749 ?auto_15760 ) ) ( not ( = ?auto_15749 ?auto_15780 ) ) ( not ( = ?auto_15750 ?auto_15760 ) ) ( not ( = ?auto_15750 ?auto_15780 ) ) ( not ( = ?auto_15751 ?auto_15760 ) ) ( not ( = ?auto_15751 ?auto_15780 ) ) ( not ( = ?auto_15752 ?auto_15760 ) ) ( not ( = ?auto_15752 ?auto_15780 ) ) ( not ( = ?auto_15753 ?auto_15760 ) ) ( not ( = ?auto_15753 ?auto_15780 ) ) ( not ( = ?auto_15754 ?auto_15760 ) ) ( not ( = ?auto_15754 ?auto_15780 ) ) ( not ( = ?auto_15755 ?auto_15760 ) ) ( not ( = ?auto_15755 ?auto_15780 ) ) ( not ( = ?auto_15756 ?auto_15760 ) ) ( not ( = ?auto_15756 ?auto_15780 ) ) ( not ( = ?auto_15757 ?auto_15760 ) ) ( not ( = ?auto_15757 ?auto_15780 ) ) ( not ( = ?auto_15758 ?auto_15760 ) ) ( not ( = ?auto_15758 ?auto_15780 ) ) ( not ( = ?auto_15760 ?auto_15797 ) ) ( not ( = ?auto_15760 ?auto_15768 ) ) ( not ( = ?auto_15760 ?auto_15793 ) ) ( not ( = ?auto_15760 ?auto_15788 ) ) ( not ( = ?auto_15760 ?auto_15791 ) ) ( not ( = ?auto_15760 ?auto_15789 ) ) ( not ( = ?auto_15760 ?auto_15769 ) ) ( not ( = ?auto_15760 ?auto_15796 ) ) ( not ( = ?auto_15760 ?auto_15794 ) ) ( not ( = ?auto_15760 ?auto_15784 ) ) ( not ( = ?auto_15760 ?auto_15790 ) ) ( not ( = ?auto_15765 ?auto_15777 ) ) ( not ( = ?auto_15765 ?auto_15770 ) ) ( not ( = ?auto_15765 ?auto_15795 ) ) ( not ( = ?auto_15765 ?auto_15792 ) ) ( not ( = ?auto_15765 ?auto_15785 ) ) ( not ( = ?auto_15765 ?auto_15775 ) ) ( not ( = ?auto_15765 ?auto_15786 ) ) ( not ( = ?auto_15765 ?auto_15778 ) ) ( not ( = ?auto_15765 ?auto_15776 ) ) ( not ( = ?auto_15763 ?auto_15772 ) ) ( not ( = ?auto_15763 ?auto_15782 ) ) ( not ( = ?auto_15763 ?auto_15783 ) ) ( not ( = ?auto_15763 ?auto_15773 ) ) ( not ( = ?auto_15763 ?auto_15774 ) ) ( not ( = ?auto_15763 ?auto_15787 ) ) ( not ( = ?auto_15763 ?auto_15771 ) ) ( not ( = ?auto_15763 ?auto_15779 ) ) ( not ( = ?auto_15763 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15797 ) ) ( not ( = ?auto_15780 ?auto_15768 ) ) ( not ( = ?auto_15780 ?auto_15793 ) ) ( not ( = ?auto_15780 ?auto_15788 ) ) ( not ( = ?auto_15780 ?auto_15791 ) ) ( not ( = ?auto_15780 ?auto_15789 ) ) ( not ( = ?auto_15780 ?auto_15769 ) ) ( not ( = ?auto_15780 ?auto_15796 ) ) ( not ( = ?auto_15780 ?auto_15794 ) ) ( not ( = ?auto_15780 ?auto_15784 ) ) ( not ( = ?auto_15780 ?auto_15790 ) ) ( not ( = ?auto_15748 ?auto_15761 ) ) ( not ( = ?auto_15748 ?auto_15762 ) ) ( not ( = ?auto_15749 ?auto_15761 ) ) ( not ( = ?auto_15749 ?auto_15762 ) ) ( not ( = ?auto_15750 ?auto_15761 ) ) ( not ( = ?auto_15750 ?auto_15762 ) ) ( not ( = ?auto_15751 ?auto_15761 ) ) ( not ( = ?auto_15751 ?auto_15762 ) ) ( not ( = ?auto_15752 ?auto_15761 ) ) ( not ( = ?auto_15752 ?auto_15762 ) ) ( not ( = ?auto_15753 ?auto_15761 ) ) ( not ( = ?auto_15753 ?auto_15762 ) ) ( not ( = ?auto_15754 ?auto_15761 ) ) ( not ( = ?auto_15754 ?auto_15762 ) ) ( not ( = ?auto_15755 ?auto_15761 ) ) ( not ( = ?auto_15755 ?auto_15762 ) ) ( not ( = ?auto_15756 ?auto_15761 ) ) ( not ( = ?auto_15756 ?auto_15762 ) ) ( not ( = ?auto_15757 ?auto_15761 ) ) ( not ( = ?auto_15757 ?auto_15762 ) ) ( not ( = ?auto_15758 ?auto_15761 ) ) ( not ( = ?auto_15758 ?auto_15762 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( not ( = ?auto_15761 ?auto_15780 ) ) ( not ( = ?auto_15761 ?auto_15797 ) ) ( not ( = ?auto_15761 ?auto_15768 ) ) ( not ( = ?auto_15761 ?auto_15793 ) ) ( not ( = ?auto_15761 ?auto_15788 ) ) ( not ( = ?auto_15761 ?auto_15791 ) ) ( not ( = ?auto_15761 ?auto_15789 ) ) ( not ( = ?auto_15761 ?auto_15769 ) ) ( not ( = ?auto_15761 ?auto_15796 ) ) ( not ( = ?auto_15761 ?auto_15794 ) ) ( not ( = ?auto_15761 ?auto_15784 ) ) ( not ( = ?auto_15761 ?auto_15790 ) ) ( not ( = ?auto_15762 ?auto_15780 ) ) ( not ( = ?auto_15762 ?auto_15797 ) ) ( not ( = ?auto_15762 ?auto_15768 ) ) ( not ( = ?auto_15762 ?auto_15793 ) ) ( not ( = ?auto_15762 ?auto_15788 ) ) ( not ( = ?auto_15762 ?auto_15791 ) ) ( not ( = ?auto_15762 ?auto_15789 ) ) ( not ( = ?auto_15762 ?auto_15769 ) ) ( not ( = ?auto_15762 ?auto_15796 ) ) ( not ( = ?auto_15762 ?auto_15794 ) ) ( not ( = ?auto_15762 ?auto_15784 ) ) ( not ( = ?auto_15762 ?auto_15790 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15748 ?auto_15749 ?auto_15750 ?auto_15751 ?auto_15752 ?auto_15753 ?auto_15754 ?auto_15755 ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 )
      ( MAKE-1CRATE ?auto_15760 ?auto_15761 )
      ( MAKE-13CRATE-VERIFY ?auto_15748 ?auto_15749 ?auto_15750 ?auto_15751 ?auto_15752 ?auto_15753 ?auto_15754 ?auto_15755 ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 ?auto_15761 ) )
  )

)

