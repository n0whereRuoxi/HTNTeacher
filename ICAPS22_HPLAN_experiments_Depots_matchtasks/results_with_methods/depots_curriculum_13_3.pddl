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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15196 - SURFACE
      ?auto_15197 - SURFACE
    )
    :vars
    (
      ?auto_15198 - HOIST
      ?auto_15199 - PLACE
      ?auto_15201 - PLACE
      ?auto_15202 - HOIST
      ?auto_15203 - SURFACE
      ?auto_15200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15198 ?auto_15199 ) ( SURFACE-AT ?auto_15196 ?auto_15199 ) ( CLEAR ?auto_15196 ) ( IS-CRATE ?auto_15197 ) ( AVAILABLE ?auto_15198 ) ( not ( = ?auto_15201 ?auto_15199 ) ) ( HOIST-AT ?auto_15202 ?auto_15201 ) ( AVAILABLE ?auto_15202 ) ( SURFACE-AT ?auto_15197 ?auto_15201 ) ( ON ?auto_15197 ?auto_15203 ) ( CLEAR ?auto_15197 ) ( TRUCK-AT ?auto_15200 ?auto_15199 ) ( not ( = ?auto_15196 ?auto_15197 ) ) ( not ( = ?auto_15196 ?auto_15203 ) ) ( not ( = ?auto_15197 ?auto_15203 ) ) ( not ( = ?auto_15198 ?auto_15202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15200 ?auto_15199 ?auto_15201 )
      ( !LIFT ?auto_15202 ?auto_15197 ?auto_15203 ?auto_15201 )
      ( !LOAD ?auto_15202 ?auto_15197 ?auto_15200 ?auto_15201 )
      ( !DRIVE ?auto_15200 ?auto_15201 ?auto_15199 )
      ( !UNLOAD ?auto_15198 ?auto_15197 ?auto_15200 ?auto_15199 )
      ( !DROP ?auto_15198 ?auto_15197 ?auto_15196 ?auto_15199 )
      ( MAKE-1CRATE-VERIFY ?auto_15196 ?auto_15197 ) )
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
      ?auto_15211 - HOIST
      ?auto_15210 - PLACE
      ?auto_15213 - PLACE
      ?auto_15212 - HOIST
      ?auto_15215 - SURFACE
      ?auto_15218 - PLACE
      ?auto_15216 - HOIST
      ?auto_15217 - SURFACE
      ?auto_15214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15211 ?auto_15210 ) ( IS-CRATE ?auto_15209 ) ( not ( = ?auto_15213 ?auto_15210 ) ) ( HOIST-AT ?auto_15212 ?auto_15213 ) ( AVAILABLE ?auto_15212 ) ( SURFACE-AT ?auto_15209 ?auto_15213 ) ( ON ?auto_15209 ?auto_15215 ) ( CLEAR ?auto_15209 ) ( not ( = ?auto_15208 ?auto_15209 ) ) ( not ( = ?auto_15208 ?auto_15215 ) ) ( not ( = ?auto_15209 ?auto_15215 ) ) ( not ( = ?auto_15211 ?auto_15212 ) ) ( SURFACE-AT ?auto_15207 ?auto_15210 ) ( CLEAR ?auto_15207 ) ( IS-CRATE ?auto_15208 ) ( AVAILABLE ?auto_15211 ) ( not ( = ?auto_15218 ?auto_15210 ) ) ( HOIST-AT ?auto_15216 ?auto_15218 ) ( AVAILABLE ?auto_15216 ) ( SURFACE-AT ?auto_15208 ?auto_15218 ) ( ON ?auto_15208 ?auto_15217 ) ( CLEAR ?auto_15208 ) ( TRUCK-AT ?auto_15214 ?auto_15210 ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15217 ) ) ( not ( = ?auto_15208 ?auto_15217 ) ) ( not ( = ?auto_15211 ?auto_15216 ) ) ( not ( = ?auto_15207 ?auto_15209 ) ) ( not ( = ?auto_15207 ?auto_15215 ) ) ( not ( = ?auto_15209 ?auto_15217 ) ) ( not ( = ?auto_15213 ?auto_15218 ) ) ( not ( = ?auto_15212 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15207 ?auto_15208 )
      ( MAKE-1CRATE ?auto_15208 ?auto_15209 )
      ( MAKE-2CRATE-VERIFY ?auto_15207 ?auto_15208 ?auto_15209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15221 - SURFACE
      ?auto_15222 - SURFACE
    )
    :vars
    (
      ?auto_15223 - HOIST
      ?auto_15224 - PLACE
      ?auto_15226 - PLACE
      ?auto_15227 - HOIST
      ?auto_15228 - SURFACE
      ?auto_15225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15223 ?auto_15224 ) ( SURFACE-AT ?auto_15221 ?auto_15224 ) ( CLEAR ?auto_15221 ) ( IS-CRATE ?auto_15222 ) ( AVAILABLE ?auto_15223 ) ( not ( = ?auto_15226 ?auto_15224 ) ) ( HOIST-AT ?auto_15227 ?auto_15226 ) ( AVAILABLE ?auto_15227 ) ( SURFACE-AT ?auto_15222 ?auto_15226 ) ( ON ?auto_15222 ?auto_15228 ) ( CLEAR ?auto_15222 ) ( TRUCK-AT ?auto_15225 ?auto_15224 ) ( not ( = ?auto_15221 ?auto_15222 ) ) ( not ( = ?auto_15221 ?auto_15228 ) ) ( not ( = ?auto_15222 ?auto_15228 ) ) ( not ( = ?auto_15223 ?auto_15227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15225 ?auto_15224 ?auto_15226 )
      ( !LIFT ?auto_15227 ?auto_15222 ?auto_15228 ?auto_15226 )
      ( !LOAD ?auto_15227 ?auto_15222 ?auto_15225 ?auto_15226 )
      ( !DRIVE ?auto_15225 ?auto_15226 ?auto_15224 )
      ( !UNLOAD ?auto_15223 ?auto_15222 ?auto_15225 ?auto_15224 )
      ( !DROP ?auto_15223 ?auto_15222 ?auto_15221 ?auto_15224 )
      ( MAKE-1CRATE-VERIFY ?auto_15221 ?auto_15222 ) )
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
      ?auto_15242 - HOIST
      ?auto_15241 - PLACE
      ?auto_15238 - PLACE
      ?auto_15240 - HOIST
      ?auto_15237 - SURFACE
      ?auto_15246 - PLACE
      ?auto_15247 - HOIST
      ?auto_15245 - SURFACE
      ?auto_15243 - PLACE
      ?auto_15244 - HOIST
      ?auto_15248 - SURFACE
      ?auto_15239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15242 ?auto_15241 ) ( IS-CRATE ?auto_15236 ) ( not ( = ?auto_15238 ?auto_15241 ) ) ( HOIST-AT ?auto_15240 ?auto_15238 ) ( AVAILABLE ?auto_15240 ) ( SURFACE-AT ?auto_15236 ?auto_15238 ) ( ON ?auto_15236 ?auto_15237 ) ( CLEAR ?auto_15236 ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15237 ) ) ( not ( = ?auto_15242 ?auto_15240 ) ) ( IS-CRATE ?auto_15235 ) ( not ( = ?auto_15246 ?auto_15241 ) ) ( HOIST-AT ?auto_15247 ?auto_15246 ) ( AVAILABLE ?auto_15247 ) ( SURFACE-AT ?auto_15235 ?auto_15246 ) ( ON ?auto_15235 ?auto_15245 ) ( CLEAR ?auto_15235 ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( not ( = ?auto_15234 ?auto_15245 ) ) ( not ( = ?auto_15235 ?auto_15245 ) ) ( not ( = ?auto_15242 ?auto_15247 ) ) ( SURFACE-AT ?auto_15233 ?auto_15241 ) ( CLEAR ?auto_15233 ) ( IS-CRATE ?auto_15234 ) ( AVAILABLE ?auto_15242 ) ( not ( = ?auto_15243 ?auto_15241 ) ) ( HOIST-AT ?auto_15244 ?auto_15243 ) ( AVAILABLE ?auto_15244 ) ( SURFACE-AT ?auto_15234 ?auto_15243 ) ( ON ?auto_15234 ?auto_15248 ) ( CLEAR ?auto_15234 ) ( TRUCK-AT ?auto_15239 ?auto_15241 ) ( not ( = ?auto_15233 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15248 ) ) ( not ( = ?auto_15234 ?auto_15248 ) ) ( not ( = ?auto_15242 ?auto_15244 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15245 ) ) ( not ( = ?auto_15235 ?auto_15248 ) ) ( not ( = ?auto_15246 ?auto_15243 ) ) ( not ( = ?auto_15247 ?auto_15244 ) ) ( not ( = ?auto_15245 ?auto_15248 ) ) ( not ( = ?auto_15233 ?auto_15236 ) ) ( not ( = ?auto_15233 ?auto_15237 ) ) ( not ( = ?auto_15234 ?auto_15236 ) ) ( not ( = ?auto_15234 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15245 ) ) ( not ( = ?auto_15236 ?auto_15248 ) ) ( not ( = ?auto_15238 ?auto_15246 ) ) ( not ( = ?auto_15238 ?auto_15243 ) ) ( not ( = ?auto_15240 ?auto_15247 ) ) ( not ( = ?auto_15240 ?auto_15244 ) ) ( not ( = ?auto_15237 ?auto_15245 ) ) ( not ( = ?auto_15237 ?auto_15248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15233 ?auto_15234 ?auto_15235 )
      ( MAKE-1CRATE ?auto_15235 ?auto_15236 )
      ( MAKE-3CRATE-VERIFY ?auto_15233 ?auto_15234 ?auto_15235 ?auto_15236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15251 - SURFACE
      ?auto_15252 - SURFACE
    )
    :vars
    (
      ?auto_15253 - HOIST
      ?auto_15254 - PLACE
      ?auto_15256 - PLACE
      ?auto_15257 - HOIST
      ?auto_15258 - SURFACE
      ?auto_15255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15253 ?auto_15254 ) ( SURFACE-AT ?auto_15251 ?auto_15254 ) ( CLEAR ?auto_15251 ) ( IS-CRATE ?auto_15252 ) ( AVAILABLE ?auto_15253 ) ( not ( = ?auto_15256 ?auto_15254 ) ) ( HOIST-AT ?auto_15257 ?auto_15256 ) ( AVAILABLE ?auto_15257 ) ( SURFACE-AT ?auto_15252 ?auto_15256 ) ( ON ?auto_15252 ?auto_15258 ) ( CLEAR ?auto_15252 ) ( TRUCK-AT ?auto_15255 ?auto_15254 ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( not ( = ?auto_15251 ?auto_15258 ) ) ( not ( = ?auto_15252 ?auto_15258 ) ) ( not ( = ?auto_15253 ?auto_15257 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15255 ?auto_15254 ?auto_15256 )
      ( !LIFT ?auto_15257 ?auto_15252 ?auto_15258 ?auto_15256 )
      ( !LOAD ?auto_15257 ?auto_15252 ?auto_15255 ?auto_15256 )
      ( !DRIVE ?auto_15255 ?auto_15256 ?auto_15254 )
      ( !UNLOAD ?auto_15253 ?auto_15252 ?auto_15255 ?auto_15254 )
      ( !DROP ?auto_15253 ?auto_15252 ?auto_15251 ?auto_15254 )
      ( MAKE-1CRATE-VERIFY ?auto_15251 ?auto_15252 ) )
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
      ?auto_15272 - HOIST
      ?auto_15273 - PLACE
      ?auto_15271 - PLACE
      ?auto_15274 - HOIST
      ?auto_15270 - SURFACE
      ?auto_15280 - PLACE
      ?auto_15281 - HOIST
      ?auto_15283 - SURFACE
      ?auto_15279 - PLACE
      ?auto_15278 - HOIST
      ?auto_15275 - SURFACE
      ?auto_15276 - PLACE
      ?auto_15277 - HOIST
      ?auto_15282 - SURFACE
      ?auto_15269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15272 ?auto_15273 ) ( IS-CRATE ?auto_15268 ) ( not ( = ?auto_15271 ?auto_15273 ) ) ( HOIST-AT ?auto_15274 ?auto_15271 ) ( AVAILABLE ?auto_15274 ) ( SURFACE-AT ?auto_15268 ?auto_15271 ) ( ON ?auto_15268 ?auto_15270 ) ( CLEAR ?auto_15268 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15270 ) ) ( not ( = ?auto_15268 ?auto_15270 ) ) ( not ( = ?auto_15272 ?auto_15274 ) ) ( IS-CRATE ?auto_15267 ) ( not ( = ?auto_15280 ?auto_15273 ) ) ( HOIST-AT ?auto_15281 ?auto_15280 ) ( AVAILABLE ?auto_15281 ) ( SURFACE-AT ?auto_15267 ?auto_15280 ) ( ON ?auto_15267 ?auto_15283 ) ( CLEAR ?auto_15267 ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15283 ) ) ( not ( = ?auto_15267 ?auto_15283 ) ) ( not ( = ?auto_15272 ?auto_15281 ) ) ( IS-CRATE ?auto_15266 ) ( not ( = ?auto_15279 ?auto_15273 ) ) ( HOIST-AT ?auto_15278 ?auto_15279 ) ( AVAILABLE ?auto_15278 ) ( SURFACE-AT ?auto_15266 ?auto_15279 ) ( ON ?auto_15266 ?auto_15275 ) ( CLEAR ?auto_15266 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15275 ) ) ( not ( = ?auto_15266 ?auto_15275 ) ) ( not ( = ?auto_15272 ?auto_15278 ) ) ( SURFACE-AT ?auto_15264 ?auto_15273 ) ( CLEAR ?auto_15264 ) ( IS-CRATE ?auto_15265 ) ( AVAILABLE ?auto_15272 ) ( not ( = ?auto_15276 ?auto_15273 ) ) ( HOIST-AT ?auto_15277 ?auto_15276 ) ( AVAILABLE ?auto_15277 ) ( SURFACE-AT ?auto_15265 ?auto_15276 ) ( ON ?auto_15265 ?auto_15282 ) ( CLEAR ?auto_15265 ) ( TRUCK-AT ?auto_15269 ?auto_15273 ) ( not ( = ?auto_15264 ?auto_15265 ) ) ( not ( = ?auto_15264 ?auto_15282 ) ) ( not ( = ?auto_15265 ?auto_15282 ) ) ( not ( = ?auto_15272 ?auto_15277 ) ) ( not ( = ?auto_15264 ?auto_15266 ) ) ( not ( = ?auto_15264 ?auto_15275 ) ) ( not ( = ?auto_15266 ?auto_15282 ) ) ( not ( = ?auto_15279 ?auto_15276 ) ) ( not ( = ?auto_15278 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15282 ) ) ( not ( = ?auto_15264 ?auto_15267 ) ) ( not ( = ?auto_15264 ?auto_15283 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15283 ) ) ( not ( = ?auto_15267 ?auto_15275 ) ) ( not ( = ?auto_15267 ?auto_15282 ) ) ( not ( = ?auto_15280 ?auto_15279 ) ) ( not ( = ?auto_15280 ?auto_15276 ) ) ( not ( = ?auto_15281 ?auto_15278 ) ) ( not ( = ?auto_15281 ?auto_15277 ) ) ( not ( = ?auto_15283 ?auto_15275 ) ) ( not ( = ?auto_15283 ?auto_15282 ) ) ( not ( = ?auto_15264 ?auto_15268 ) ) ( not ( = ?auto_15264 ?auto_15270 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15270 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15270 ) ) ( not ( = ?auto_15268 ?auto_15283 ) ) ( not ( = ?auto_15268 ?auto_15275 ) ) ( not ( = ?auto_15268 ?auto_15282 ) ) ( not ( = ?auto_15271 ?auto_15280 ) ) ( not ( = ?auto_15271 ?auto_15279 ) ) ( not ( = ?auto_15271 ?auto_15276 ) ) ( not ( = ?auto_15274 ?auto_15281 ) ) ( not ( = ?auto_15274 ?auto_15278 ) ) ( not ( = ?auto_15274 ?auto_15277 ) ) ( not ( = ?auto_15270 ?auto_15283 ) ) ( not ( = ?auto_15270 ?auto_15275 ) ) ( not ( = ?auto_15270 ?auto_15282 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15264 ?auto_15265 ?auto_15266 ?auto_15267 )
      ( MAKE-1CRATE ?auto_15267 ?auto_15268 )
      ( MAKE-4CRATE-VERIFY ?auto_15264 ?auto_15265 ?auto_15266 ?auto_15267 ?auto_15268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15286 - SURFACE
      ?auto_15287 - SURFACE
    )
    :vars
    (
      ?auto_15288 - HOIST
      ?auto_15289 - PLACE
      ?auto_15291 - PLACE
      ?auto_15292 - HOIST
      ?auto_15293 - SURFACE
      ?auto_15290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15288 ?auto_15289 ) ( SURFACE-AT ?auto_15286 ?auto_15289 ) ( CLEAR ?auto_15286 ) ( IS-CRATE ?auto_15287 ) ( AVAILABLE ?auto_15288 ) ( not ( = ?auto_15291 ?auto_15289 ) ) ( HOIST-AT ?auto_15292 ?auto_15291 ) ( AVAILABLE ?auto_15292 ) ( SURFACE-AT ?auto_15287 ?auto_15291 ) ( ON ?auto_15287 ?auto_15293 ) ( CLEAR ?auto_15287 ) ( TRUCK-AT ?auto_15290 ?auto_15289 ) ( not ( = ?auto_15286 ?auto_15287 ) ) ( not ( = ?auto_15286 ?auto_15293 ) ) ( not ( = ?auto_15287 ?auto_15293 ) ) ( not ( = ?auto_15288 ?auto_15292 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15290 ?auto_15289 ?auto_15291 )
      ( !LIFT ?auto_15292 ?auto_15287 ?auto_15293 ?auto_15291 )
      ( !LOAD ?auto_15292 ?auto_15287 ?auto_15290 ?auto_15291 )
      ( !DRIVE ?auto_15290 ?auto_15291 ?auto_15289 )
      ( !UNLOAD ?auto_15288 ?auto_15287 ?auto_15290 ?auto_15289 )
      ( !DROP ?auto_15288 ?auto_15287 ?auto_15286 ?auto_15289 )
      ( MAKE-1CRATE-VERIFY ?auto_15286 ?auto_15287 ) )
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
      ?auto_15311 - HOIST
      ?auto_15308 - PLACE
      ?auto_15310 - PLACE
      ?auto_15307 - HOIST
      ?auto_15309 - SURFACE
      ?auto_15321 - PLACE
      ?auto_15317 - HOIST
      ?auto_15319 - SURFACE
      ?auto_15323 - PLACE
      ?auto_15316 - HOIST
      ?auto_15313 - SURFACE
      ?auto_15312 - PLACE
      ?auto_15314 - HOIST
      ?auto_15320 - SURFACE
      ?auto_15318 - PLACE
      ?auto_15315 - HOIST
      ?auto_15322 - SURFACE
      ?auto_15306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15311 ?auto_15308 ) ( IS-CRATE ?auto_15305 ) ( not ( = ?auto_15310 ?auto_15308 ) ) ( HOIST-AT ?auto_15307 ?auto_15310 ) ( AVAILABLE ?auto_15307 ) ( SURFACE-AT ?auto_15305 ?auto_15310 ) ( ON ?auto_15305 ?auto_15309 ) ( CLEAR ?auto_15305 ) ( not ( = ?auto_15304 ?auto_15305 ) ) ( not ( = ?auto_15304 ?auto_15309 ) ) ( not ( = ?auto_15305 ?auto_15309 ) ) ( not ( = ?auto_15311 ?auto_15307 ) ) ( IS-CRATE ?auto_15304 ) ( not ( = ?auto_15321 ?auto_15308 ) ) ( HOIST-AT ?auto_15317 ?auto_15321 ) ( AVAILABLE ?auto_15317 ) ( SURFACE-AT ?auto_15304 ?auto_15321 ) ( ON ?auto_15304 ?auto_15319 ) ( CLEAR ?auto_15304 ) ( not ( = ?auto_15303 ?auto_15304 ) ) ( not ( = ?auto_15303 ?auto_15319 ) ) ( not ( = ?auto_15304 ?auto_15319 ) ) ( not ( = ?auto_15311 ?auto_15317 ) ) ( IS-CRATE ?auto_15303 ) ( not ( = ?auto_15323 ?auto_15308 ) ) ( HOIST-AT ?auto_15316 ?auto_15323 ) ( AVAILABLE ?auto_15316 ) ( SURFACE-AT ?auto_15303 ?auto_15323 ) ( ON ?auto_15303 ?auto_15313 ) ( CLEAR ?auto_15303 ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( not ( = ?auto_15302 ?auto_15313 ) ) ( not ( = ?auto_15303 ?auto_15313 ) ) ( not ( = ?auto_15311 ?auto_15316 ) ) ( IS-CRATE ?auto_15302 ) ( not ( = ?auto_15312 ?auto_15308 ) ) ( HOIST-AT ?auto_15314 ?auto_15312 ) ( AVAILABLE ?auto_15314 ) ( SURFACE-AT ?auto_15302 ?auto_15312 ) ( ON ?auto_15302 ?auto_15320 ) ( CLEAR ?auto_15302 ) ( not ( = ?auto_15301 ?auto_15302 ) ) ( not ( = ?auto_15301 ?auto_15320 ) ) ( not ( = ?auto_15302 ?auto_15320 ) ) ( not ( = ?auto_15311 ?auto_15314 ) ) ( SURFACE-AT ?auto_15300 ?auto_15308 ) ( CLEAR ?auto_15300 ) ( IS-CRATE ?auto_15301 ) ( AVAILABLE ?auto_15311 ) ( not ( = ?auto_15318 ?auto_15308 ) ) ( HOIST-AT ?auto_15315 ?auto_15318 ) ( AVAILABLE ?auto_15315 ) ( SURFACE-AT ?auto_15301 ?auto_15318 ) ( ON ?auto_15301 ?auto_15322 ) ( CLEAR ?auto_15301 ) ( TRUCK-AT ?auto_15306 ?auto_15308 ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( not ( = ?auto_15300 ?auto_15322 ) ) ( not ( = ?auto_15301 ?auto_15322 ) ) ( not ( = ?auto_15311 ?auto_15315 ) ) ( not ( = ?auto_15300 ?auto_15302 ) ) ( not ( = ?auto_15300 ?auto_15320 ) ) ( not ( = ?auto_15302 ?auto_15322 ) ) ( not ( = ?auto_15312 ?auto_15318 ) ) ( not ( = ?auto_15314 ?auto_15315 ) ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15300 ?auto_15303 ) ) ( not ( = ?auto_15300 ?auto_15313 ) ) ( not ( = ?auto_15301 ?auto_15303 ) ) ( not ( = ?auto_15301 ?auto_15313 ) ) ( not ( = ?auto_15303 ?auto_15320 ) ) ( not ( = ?auto_15303 ?auto_15322 ) ) ( not ( = ?auto_15323 ?auto_15312 ) ) ( not ( = ?auto_15323 ?auto_15318 ) ) ( not ( = ?auto_15316 ?auto_15314 ) ) ( not ( = ?auto_15316 ?auto_15315 ) ) ( not ( = ?auto_15313 ?auto_15320 ) ) ( not ( = ?auto_15313 ?auto_15322 ) ) ( not ( = ?auto_15300 ?auto_15304 ) ) ( not ( = ?auto_15300 ?auto_15319 ) ) ( not ( = ?auto_15301 ?auto_15304 ) ) ( not ( = ?auto_15301 ?auto_15319 ) ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( not ( = ?auto_15302 ?auto_15319 ) ) ( not ( = ?auto_15304 ?auto_15313 ) ) ( not ( = ?auto_15304 ?auto_15320 ) ) ( not ( = ?auto_15304 ?auto_15322 ) ) ( not ( = ?auto_15321 ?auto_15323 ) ) ( not ( = ?auto_15321 ?auto_15312 ) ) ( not ( = ?auto_15321 ?auto_15318 ) ) ( not ( = ?auto_15317 ?auto_15316 ) ) ( not ( = ?auto_15317 ?auto_15314 ) ) ( not ( = ?auto_15317 ?auto_15315 ) ) ( not ( = ?auto_15319 ?auto_15313 ) ) ( not ( = ?auto_15319 ?auto_15320 ) ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( not ( = ?auto_15300 ?auto_15305 ) ) ( not ( = ?auto_15300 ?auto_15309 ) ) ( not ( = ?auto_15301 ?auto_15305 ) ) ( not ( = ?auto_15301 ?auto_15309 ) ) ( not ( = ?auto_15302 ?auto_15305 ) ) ( not ( = ?auto_15302 ?auto_15309 ) ) ( not ( = ?auto_15303 ?auto_15305 ) ) ( not ( = ?auto_15303 ?auto_15309 ) ) ( not ( = ?auto_15305 ?auto_15319 ) ) ( not ( = ?auto_15305 ?auto_15313 ) ) ( not ( = ?auto_15305 ?auto_15320 ) ) ( not ( = ?auto_15305 ?auto_15322 ) ) ( not ( = ?auto_15310 ?auto_15321 ) ) ( not ( = ?auto_15310 ?auto_15323 ) ) ( not ( = ?auto_15310 ?auto_15312 ) ) ( not ( = ?auto_15310 ?auto_15318 ) ) ( not ( = ?auto_15307 ?auto_15317 ) ) ( not ( = ?auto_15307 ?auto_15316 ) ) ( not ( = ?auto_15307 ?auto_15314 ) ) ( not ( = ?auto_15307 ?auto_15315 ) ) ( not ( = ?auto_15309 ?auto_15319 ) ) ( not ( = ?auto_15309 ?auto_15313 ) ) ( not ( = ?auto_15309 ?auto_15320 ) ) ( not ( = ?auto_15309 ?auto_15322 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15300 ?auto_15301 ?auto_15302 ?auto_15303 ?auto_15304 )
      ( MAKE-1CRATE ?auto_15304 ?auto_15305 )
      ( MAKE-5CRATE-VERIFY ?auto_15300 ?auto_15301 ?auto_15302 ?auto_15303 ?auto_15304 ?auto_15305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15326 - SURFACE
      ?auto_15327 - SURFACE
    )
    :vars
    (
      ?auto_15328 - HOIST
      ?auto_15329 - PLACE
      ?auto_15331 - PLACE
      ?auto_15332 - HOIST
      ?auto_15333 - SURFACE
      ?auto_15330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15328 ?auto_15329 ) ( SURFACE-AT ?auto_15326 ?auto_15329 ) ( CLEAR ?auto_15326 ) ( IS-CRATE ?auto_15327 ) ( AVAILABLE ?auto_15328 ) ( not ( = ?auto_15331 ?auto_15329 ) ) ( HOIST-AT ?auto_15332 ?auto_15331 ) ( AVAILABLE ?auto_15332 ) ( SURFACE-AT ?auto_15327 ?auto_15331 ) ( ON ?auto_15327 ?auto_15333 ) ( CLEAR ?auto_15327 ) ( TRUCK-AT ?auto_15330 ?auto_15329 ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( not ( = ?auto_15326 ?auto_15333 ) ) ( not ( = ?auto_15327 ?auto_15333 ) ) ( not ( = ?auto_15328 ?auto_15332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15330 ?auto_15329 ?auto_15331 )
      ( !LIFT ?auto_15332 ?auto_15327 ?auto_15333 ?auto_15331 )
      ( !LOAD ?auto_15332 ?auto_15327 ?auto_15330 ?auto_15331 )
      ( !DRIVE ?auto_15330 ?auto_15331 ?auto_15329 )
      ( !UNLOAD ?auto_15328 ?auto_15327 ?auto_15330 ?auto_15329 )
      ( !DROP ?auto_15328 ?auto_15327 ?auto_15326 ?auto_15329 )
      ( MAKE-1CRATE-VERIFY ?auto_15326 ?auto_15327 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15341 - SURFACE
      ?auto_15342 - SURFACE
      ?auto_15343 - SURFACE
      ?auto_15344 - SURFACE
      ?auto_15345 - SURFACE
      ?auto_15347 - SURFACE
      ?auto_15346 - SURFACE
    )
    :vars
    (
      ?auto_15352 - HOIST
      ?auto_15353 - PLACE
      ?auto_15351 - PLACE
      ?auto_15350 - HOIST
      ?auto_15348 - SURFACE
      ?auto_15367 - PLACE
      ?auto_15355 - HOIST
      ?auto_15354 - SURFACE
      ?auto_15363 - PLACE
      ?auto_15359 - HOIST
      ?auto_15357 - SURFACE
      ?auto_15356 - PLACE
      ?auto_15360 - HOIST
      ?auto_15364 - SURFACE
      ?auto_15361 - PLACE
      ?auto_15365 - HOIST
      ?auto_15362 - SURFACE
      ?auto_15358 - PLACE
      ?auto_15368 - HOIST
      ?auto_15366 - SURFACE
      ?auto_15349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15352 ?auto_15353 ) ( IS-CRATE ?auto_15346 ) ( not ( = ?auto_15351 ?auto_15353 ) ) ( HOIST-AT ?auto_15350 ?auto_15351 ) ( AVAILABLE ?auto_15350 ) ( SURFACE-AT ?auto_15346 ?auto_15351 ) ( ON ?auto_15346 ?auto_15348 ) ( CLEAR ?auto_15346 ) ( not ( = ?auto_15347 ?auto_15346 ) ) ( not ( = ?auto_15347 ?auto_15348 ) ) ( not ( = ?auto_15346 ?auto_15348 ) ) ( not ( = ?auto_15352 ?auto_15350 ) ) ( IS-CRATE ?auto_15347 ) ( not ( = ?auto_15367 ?auto_15353 ) ) ( HOIST-AT ?auto_15355 ?auto_15367 ) ( AVAILABLE ?auto_15355 ) ( SURFACE-AT ?auto_15347 ?auto_15367 ) ( ON ?auto_15347 ?auto_15354 ) ( CLEAR ?auto_15347 ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15345 ?auto_15354 ) ) ( not ( = ?auto_15347 ?auto_15354 ) ) ( not ( = ?auto_15352 ?auto_15355 ) ) ( IS-CRATE ?auto_15345 ) ( not ( = ?auto_15363 ?auto_15353 ) ) ( HOIST-AT ?auto_15359 ?auto_15363 ) ( AVAILABLE ?auto_15359 ) ( SURFACE-AT ?auto_15345 ?auto_15363 ) ( ON ?auto_15345 ?auto_15357 ) ( CLEAR ?auto_15345 ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15357 ) ) ( not ( = ?auto_15345 ?auto_15357 ) ) ( not ( = ?auto_15352 ?auto_15359 ) ) ( IS-CRATE ?auto_15344 ) ( not ( = ?auto_15356 ?auto_15353 ) ) ( HOIST-AT ?auto_15360 ?auto_15356 ) ( AVAILABLE ?auto_15360 ) ( SURFACE-AT ?auto_15344 ?auto_15356 ) ( ON ?auto_15344 ?auto_15364 ) ( CLEAR ?auto_15344 ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15364 ) ) ( not ( = ?auto_15344 ?auto_15364 ) ) ( not ( = ?auto_15352 ?auto_15360 ) ) ( IS-CRATE ?auto_15343 ) ( not ( = ?auto_15361 ?auto_15353 ) ) ( HOIST-AT ?auto_15365 ?auto_15361 ) ( AVAILABLE ?auto_15365 ) ( SURFACE-AT ?auto_15343 ?auto_15361 ) ( ON ?auto_15343 ?auto_15362 ) ( CLEAR ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15362 ) ) ( not ( = ?auto_15343 ?auto_15362 ) ) ( not ( = ?auto_15352 ?auto_15365 ) ) ( SURFACE-AT ?auto_15341 ?auto_15353 ) ( CLEAR ?auto_15341 ) ( IS-CRATE ?auto_15342 ) ( AVAILABLE ?auto_15352 ) ( not ( = ?auto_15358 ?auto_15353 ) ) ( HOIST-AT ?auto_15368 ?auto_15358 ) ( AVAILABLE ?auto_15368 ) ( SURFACE-AT ?auto_15342 ?auto_15358 ) ( ON ?auto_15342 ?auto_15366 ) ( CLEAR ?auto_15342 ) ( TRUCK-AT ?auto_15349 ?auto_15353 ) ( not ( = ?auto_15341 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15366 ) ) ( not ( = ?auto_15342 ?auto_15366 ) ) ( not ( = ?auto_15352 ?auto_15368 ) ) ( not ( = ?auto_15341 ?auto_15343 ) ) ( not ( = ?auto_15341 ?auto_15362 ) ) ( not ( = ?auto_15343 ?auto_15366 ) ) ( not ( = ?auto_15361 ?auto_15358 ) ) ( not ( = ?auto_15365 ?auto_15368 ) ) ( not ( = ?auto_15362 ?auto_15366 ) ) ( not ( = ?auto_15341 ?auto_15344 ) ) ( not ( = ?auto_15341 ?auto_15364 ) ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( not ( = ?auto_15342 ?auto_15364 ) ) ( not ( = ?auto_15344 ?auto_15362 ) ) ( not ( = ?auto_15344 ?auto_15366 ) ) ( not ( = ?auto_15356 ?auto_15361 ) ) ( not ( = ?auto_15356 ?auto_15358 ) ) ( not ( = ?auto_15360 ?auto_15365 ) ) ( not ( = ?auto_15360 ?auto_15368 ) ) ( not ( = ?auto_15364 ?auto_15362 ) ) ( not ( = ?auto_15364 ?auto_15366 ) ) ( not ( = ?auto_15341 ?auto_15345 ) ) ( not ( = ?auto_15341 ?auto_15357 ) ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15357 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15357 ) ) ( not ( = ?auto_15345 ?auto_15364 ) ) ( not ( = ?auto_15345 ?auto_15362 ) ) ( not ( = ?auto_15345 ?auto_15366 ) ) ( not ( = ?auto_15363 ?auto_15356 ) ) ( not ( = ?auto_15363 ?auto_15361 ) ) ( not ( = ?auto_15363 ?auto_15358 ) ) ( not ( = ?auto_15359 ?auto_15360 ) ) ( not ( = ?auto_15359 ?auto_15365 ) ) ( not ( = ?auto_15359 ?auto_15368 ) ) ( not ( = ?auto_15357 ?auto_15364 ) ) ( not ( = ?auto_15357 ?auto_15362 ) ) ( not ( = ?auto_15357 ?auto_15366 ) ) ( not ( = ?auto_15341 ?auto_15347 ) ) ( not ( = ?auto_15341 ?auto_15354 ) ) ( not ( = ?auto_15342 ?auto_15347 ) ) ( not ( = ?auto_15342 ?auto_15354 ) ) ( not ( = ?auto_15343 ?auto_15347 ) ) ( not ( = ?auto_15343 ?auto_15354 ) ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( not ( = ?auto_15344 ?auto_15354 ) ) ( not ( = ?auto_15347 ?auto_15357 ) ) ( not ( = ?auto_15347 ?auto_15364 ) ) ( not ( = ?auto_15347 ?auto_15362 ) ) ( not ( = ?auto_15347 ?auto_15366 ) ) ( not ( = ?auto_15367 ?auto_15363 ) ) ( not ( = ?auto_15367 ?auto_15356 ) ) ( not ( = ?auto_15367 ?auto_15361 ) ) ( not ( = ?auto_15367 ?auto_15358 ) ) ( not ( = ?auto_15355 ?auto_15359 ) ) ( not ( = ?auto_15355 ?auto_15360 ) ) ( not ( = ?auto_15355 ?auto_15365 ) ) ( not ( = ?auto_15355 ?auto_15368 ) ) ( not ( = ?auto_15354 ?auto_15357 ) ) ( not ( = ?auto_15354 ?auto_15364 ) ) ( not ( = ?auto_15354 ?auto_15362 ) ) ( not ( = ?auto_15354 ?auto_15366 ) ) ( not ( = ?auto_15341 ?auto_15346 ) ) ( not ( = ?auto_15341 ?auto_15348 ) ) ( not ( = ?auto_15342 ?auto_15346 ) ) ( not ( = ?auto_15342 ?auto_15348 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) ( not ( = ?auto_15343 ?auto_15348 ) ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15344 ?auto_15348 ) ) ( not ( = ?auto_15345 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15348 ) ) ( not ( = ?auto_15346 ?auto_15354 ) ) ( not ( = ?auto_15346 ?auto_15357 ) ) ( not ( = ?auto_15346 ?auto_15364 ) ) ( not ( = ?auto_15346 ?auto_15362 ) ) ( not ( = ?auto_15346 ?auto_15366 ) ) ( not ( = ?auto_15351 ?auto_15367 ) ) ( not ( = ?auto_15351 ?auto_15363 ) ) ( not ( = ?auto_15351 ?auto_15356 ) ) ( not ( = ?auto_15351 ?auto_15361 ) ) ( not ( = ?auto_15351 ?auto_15358 ) ) ( not ( = ?auto_15350 ?auto_15355 ) ) ( not ( = ?auto_15350 ?auto_15359 ) ) ( not ( = ?auto_15350 ?auto_15360 ) ) ( not ( = ?auto_15350 ?auto_15365 ) ) ( not ( = ?auto_15350 ?auto_15368 ) ) ( not ( = ?auto_15348 ?auto_15354 ) ) ( not ( = ?auto_15348 ?auto_15357 ) ) ( not ( = ?auto_15348 ?auto_15364 ) ) ( not ( = ?auto_15348 ?auto_15362 ) ) ( not ( = ?auto_15348 ?auto_15366 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15341 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15347 )
      ( MAKE-1CRATE ?auto_15347 ?auto_15346 )
      ( MAKE-6CRATE-VERIFY ?auto_15341 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15347 ?auto_15346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15371 - SURFACE
      ?auto_15372 - SURFACE
    )
    :vars
    (
      ?auto_15373 - HOIST
      ?auto_15374 - PLACE
      ?auto_15376 - PLACE
      ?auto_15377 - HOIST
      ?auto_15378 - SURFACE
      ?auto_15375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15373 ?auto_15374 ) ( SURFACE-AT ?auto_15371 ?auto_15374 ) ( CLEAR ?auto_15371 ) ( IS-CRATE ?auto_15372 ) ( AVAILABLE ?auto_15373 ) ( not ( = ?auto_15376 ?auto_15374 ) ) ( HOIST-AT ?auto_15377 ?auto_15376 ) ( AVAILABLE ?auto_15377 ) ( SURFACE-AT ?auto_15372 ?auto_15376 ) ( ON ?auto_15372 ?auto_15378 ) ( CLEAR ?auto_15372 ) ( TRUCK-AT ?auto_15375 ?auto_15374 ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15378 ) ) ( not ( = ?auto_15372 ?auto_15378 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15375 ?auto_15374 ?auto_15376 )
      ( !LIFT ?auto_15377 ?auto_15372 ?auto_15378 ?auto_15376 )
      ( !LOAD ?auto_15377 ?auto_15372 ?auto_15375 ?auto_15376 )
      ( !DRIVE ?auto_15375 ?auto_15376 ?auto_15374 )
      ( !UNLOAD ?auto_15373 ?auto_15372 ?auto_15375 ?auto_15374 )
      ( !DROP ?auto_15373 ?auto_15372 ?auto_15371 ?auto_15374 )
      ( MAKE-1CRATE-VERIFY ?auto_15371 ?auto_15372 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_15387 - SURFACE
      ?auto_15388 - SURFACE
      ?auto_15389 - SURFACE
      ?auto_15390 - SURFACE
      ?auto_15391 - SURFACE
      ?auto_15393 - SURFACE
      ?auto_15392 - SURFACE
      ?auto_15394 - SURFACE
    )
    :vars
    (
      ?auto_15400 - HOIST
      ?auto_15398 - PLACE
      ?auto_15397 - PLACE
      ?auto_15396 - HOIST
      ?auto_15395 - SURFACE
      ?auto_15404 - PLACE
      ?auto_15407 - HOIST
      ?auto_15403 - SURFACE
      ?auto_15414 - PLACE
      ?auto_15402 - HOIST
      ?auto_15408 - SURFACE
      ?auto_15411 - PLACE
      ?auto_15416 - HOIST
      ?auto_15401 - SURFACE
      ?auto_15410 - SURFACE
      ?auto_15415 - PLACE
      ?auto_15412 - HOIST
      ?auto_15409 - SURFACE
      ?auto_15406 - PLACE
      ?auto_15405 - HOIST
      ?auto_15413 - SURFACE
      ?auto_15399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15400 ?auto_15398 ) ( IS-CRATE ?auto_15394 ) ( not ( = ?auto_15397 ?auto_15398 ) ) ( HOIST-AT ?auto_15396 ?auto_15397 ) ( SURFACE-AT ?auto_15394 ?auto_15397 ) ( ON ?auto_15394 ?auto_15395 ) ( CLEAR ?auto_15394 ) ( not ( = ?auto_15392 ?auto_15394 ) ) ( not ( = ?auto_15392 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( not ( = ?auto_15400 ?auto_15396 ) ) ( IS-CRATE ?auto_15392 ) ( not ( = ?auto_15404 ?auto_15398 ) ) ( HOIST-AT ?auto_15407 ?auto_15404 ) ( AVAILABLE ?auto_15407 ) ( SURFACE-AT ?auto_15392 ?auto_15404 ) ( ON ?auto_15392 ?auto_15403 ) ( CLEAR ?auto_15392 ) ( not ( = ?auto_15393 ?auto_15392 ) ) ( not ( = ?auto_15393 ?auto_15403 ) ) ( not ( = ?auto_15392 ?auto_15403 ) ) ( not ( = ?auto_15400 ?auto_15407 ) ) ( IS-CRATE ?auto_15393 ) ( not ( = ?auto_15414 ?auto_15398 ) ) ( HOIST-AT ?auto_15402 ?auto_15414 ) ( AVAILABLE ?auto_15402 ) ( SURFACE-AT ?auto_15393 ?auto_15414 ) ( ON ?auto_15393 ?auto_15408 ) ( CLEAR ?auto_15393 ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15391 ?auto_15408 ) ) ( not ( = ?auto_15393 ?auto_15408 ) ) ( not ( = ?auto_15400 ?auto_15402 ) ) ( IS-CRATE ?auto_15391 ) ( not ( = ?auto_15411 ?auto_15398 ) ) ( HOIST-AT ?auto_15416 ?auto_15411 ) ( AVAILABLE ?auto_15416 ) ( SURFACE-AT ?auto_15391 ?auto_15411 ) ( ON ?auto_15391 ?auto_15401 ) ( CLEAR ?auto_15391 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15390 ?auto_15401 ) ) ( not ( = ?auto_15391 ?auto_15401 ) ) ( not ( = ?auto_15400 ?auto_15416 ) ) ( IS-CRATE ?auto_15390 ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15390 ?auto_15397 ) ( ON ?auto_15390 ?auto_15410 ) ( CLEAR ?auto_15390 ) ( not ( = ?auto_15389 ?auto_15390 ) ) ( not ( = ?auto_15389 ?auto_15410 ) ) ( not ( = ?auto_15390 ?auto_15410 ) ) ( IS-CRATE ?auto_15389 ) ( not ( = ?auto_15415 ?auto_15398 ) ) ( HOIST-AT ?auto_15412 ?auto_15415 ) ( AVAILABLE ?auto_15412 ) ( SURFACE-AT ?auto_15389 ?auto_15415 ) ( ON ?auto_15389 ?auto_15409 ) ( CLEAR ?auto_15389 ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15388 ?auto_15409 ) ) ( not ( = ?auto_15389 ?auto_15409 ) ) ( not ( = ?auto_15400 ?auto_15412 ) ) ( SURFACE-AT ?auto_15387 ?auto_15398 ) ( CLEAR ?auto_15387 ) ( IS-CRATE ?auto_15388 ) ( AVAILABLE ?auto_15400 ) ( not ( = ?auto_15406 ?auto_15398 ) ) ( HOIST-AT ?auto_15405 ?auto_15406 ) ( AVAILABLE ?auto_15405 ) ( SURFACE-AT ?auto_15388 ?auto_15406 ) ( ON ?auto_15388 ?auto_15413 ) ( CLEAR ?auto_15388 ) ( TRUCK-AT ?auto_15399 ?auto_15398 ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15413 ) ) ( not ( = ?auto_15388 ?auto_15413 ) ) ( not ( = ?auto_15400 ?auto_15405 ) ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15409 ) ) ( not ( = ?auto_15389 ?auto_15413 ) ) ( not ( = ?auto_15415 ?auto_15406 ) ) ( not ( = ?auto_15412 ?auto_15405 ) ) ( not ( = ?auto_15409 ?auto_15413 ) ) ( not ( = ?auto_15387 ?auto_15390 ) ) ( not ( = ?auto_15387 ?auto_15410 ) ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15388 ?auto_15410 ) ) ( not ( = ?auto_15390 ?auto_15409 ) ) ( not ( = ?auto_15390 ?auto_15413 ) ) ( not ( = ?auto_15397 ?auto_15415 ) ) ( not ( = ?auto_15397 ?auto_15406 ) ) ( not ( = ?auto_15396 ?auto_15412 ) ) ( not ( = ?auto_15396 ?auto_15405 ) ) ( not ( = ?auto_15410 ?auto_15409 ) ) ( not ( = ?auto_15410 ?auto_15413 ) ) ( not ( = ?auto_15387 ?auto_15391 ) ) ( not ( = ?auto_15387 ?auto_15401 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15401 ) ) ( not ( = ?auto_15389 ?auto_15391 ) ) ( not ( = ?auto_15389 ?auto_15401 ) ) ( not ( = ?auto_15391 ?auto_15410 ) ) ( not ( = ?auto_15391 ?auto_15409 ) ) ( not ( = ?auto_15391 ?auto_15413 ) ) ( not ( = ?auto_15411 ?auto_15397 ) ) ( not ( = ?auto_15411 ?auto_15415 ) ) ( not ( = ?auto_15411 ?auto_15406 ) ) ( not ( = ?auto_15416 ?auto_15396 ) ) ( not ( = ?auto_15416 ?auto_15412 ) ) ( not ( = ?auto_15416 ?auto_15405 ) ) ( not ( = ?auto_15401 ?auto_15410 ) ) ( not ( = ?auto_15401 ?auto_15409 ) ) ( not ( = ?auto_15401 ?auto_15413 ) ) ( not ( = ?auto_15387 ?auto_15393 ) ) ( not ( = ?auto_15387 ?auto_15408 ) ) ( not ( = ?auto_15388 ?auto_15393 ) ) ( not ( = ?auto_15388 ?auto_15408 ) ) ( not ( = ?auto_15389 ?auto_15393 ) ) ( not ( = ?auto_15389 ?auto_15408 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15408 ) ) ( not ( = ?auto_15393 ?auto_15401 ) ) ( not ( = ?auto_15393 ?auto_15410 ) ) ( not ( = ?auto_15393 ?auto_15409 ) ) ( not ( = ?auto_15393 ?auto_15413 ) ) ( not ( = ?auto_15414 ?auto_15411 ) ) ( not ( = ?auto_15414 ?auto_15397 ) ) ( not ( = ?auto_15414 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15406 ) ) ( not ( = ?auto_15402 ?auto_15416 ) ) ( not ( = ?auto_15402 ?auto_15396 ) ) ( not ( = ?auto_15402 ?auto_15412 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( not ( = ?auto_15408 ?auto_15401 ) ) ( not ( = ?auto_15408 ?auto_15410 ) ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( not ( = ?auto_15408 ?auto_15413 ) ) ( not ( = ?auto_15387 ?auto_15392 ) ) ( not ( = ?auto_15387 ?auto_15403 ) ) ( not ( = ?auto_15388 ?auto_15392 ) ) ( not ( = ?auto_15388 ?auto_15403 ) ) ( not ( = ?auto_15389 ?auto_15392 ) ) ( not ( = ?auto_15389 ?auto_15403 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15403 ) ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15403 ) ) ( not ( = ?auto_15392 ?auto_15408 ) ) ( not ( = ?auto_15392 ?auto_15401 ) ) ( not ( = ?auto_15392 ?auto_15410 ) ) ( not ( = ?auto_15392 ?auto_15409 ) ) ( not ( = ?auto_15392 ?auto_15413 ) ) ( not ( = ?auto_15404 ?auto_15414 ) ) ( not ( = ?auto_15404 ?auto_15411 ) ) ( not ( = ?auto_15404 ?auto_15397 ) ) ( not ( = ?auto_15404 ?auto_15415 ) ) ( not ( = ?auto_15404 ?auto_15406 ) ) ( not ( = ?auto_15407 ?auto_15402 ) ) ( not ( = ?auto_15407 ?auto_15416 ) ) ( not ( = ?auto_15407 ?auto_15396 ) ) ( not ( = ?auto_15407 ?auto_15412 ) ) ( not ( = ?auto_15407 ?auto_15405 ) ) ( not ( = ?auto_15403 ?auto_15408 ) ) ( not ( = ?auto_15403 ?auto_15401 ) ) ( not ( = ?auto_15403 ?auto_15410 ) ) ( not ( = ?auto_15403 ?auto_15409 ) ) ( not ( = ?auto_15403 ?auto_15413 ) ) ( not ( = ?auto_15387 ?auto_15394 ) ) ( not ( = ?auto_15387 ?auto_15395 ) ) ( not ( = ?auto_15388 ?auto_15394 ) ) ( not ( = ?auto_15388 ?auto_15395 ) ) ( not ( = ?auto_15389 ?auto_15394 ) ) ( not ( = ?auto_15389 ?auto_15395 ) ) ( not ( = ?auto_15390 ?auto_15394 ) ) ( not ( = ?auto_15390 ?auto_15395 ) ) ( not ( = ?auto_15391 ?auto_15394 ) ) ( not ( = ?auto_15391 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15394 ) ) ( not ( = ?auto_15393 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15403 ) ) ( not ( = ?auto_15394 ?auto_15408 ) ) ( not ( = ?auto_15394 ?auto_15401 ) ) ( not ( = ?auto_15394 ?auto_15410 ) ) ( not ( = ?auto_15394 ?auto_15409 ) ) ( not ( = ?auto_15394 ?auto_15413 ) ) ( not ( = ?auto_15395 ?auto_15403 ) ) ( not ( = ?auto_15395 ?auto_15408 ) ) ( not ( = ?auto_15395 ?auto_15401 ) ) ( not ( = ?auto_15395 ?auto_15410 ) ) ( not ( = ?auto_15395 ?auto_15409 ) ) ( not ( = ?auto_15395 ?auto_15413 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15387 ?auto_15388 ?auto_15389 ?auto_15390 ?auto_15391 ?auto_15393 ?auto_15392 )
      ( MAKE-1CRATE ?auto_15392 ?auto_15394 )
      ( MAKE-7CRATE-VERIFY ?auto_15387 ?auto_15388 ?auto_15389 ?auto_15390 ?auto_15391 ?auto_15393 ?auto_15392 ?auto_15394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15419 - SURFACE
      ?auto_15420 - SURFACE
    )
    :vars
    (
      ?auto_15421 - HOIST
      ?auto_15422 - PLACE
      ?auto_15424 - PLACE
      ?auto_15425 - HOIST
      ?auto_15426 - SURFACE
      ?auto_15423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15421 ?auto_15422 ) ( SURFACE-AT ?auto_15419 ?auto_15422 ) ( CLEAR ?auto_15419 ) ( IS-CRATE ?auto_15420 ) ( AVAILABLE ?auto_15421 ) ( not ( = ?auto_15424 ?auto_15422 ) ) ( HOIST-AT ?auto_15425 ?auto_15424 ) ( AVAILABLE ?auto_15425 ) ( SURFACE-AT ?auto_15420 ?auto_15424 ) ( ON ?auto_15420 ?auto_15426 ) ( CLEAR ?auto_15420 ) ( TRUCK-AT ?auto_15423 ?auto_15422 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15426 ) ) ( not ( = ?auto_15420 ?auto_15426 ) ) ( not ( = ?auto_15421 ?auto_15425 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15423 ?auto_15422 ?auto_15424 )
      ( !LIFT ?auto_15425 ?auto_15420 ?auto_15426 ?auto_15424 )
      ( !LOAD ?auto_15425 ?auto_15420 ?auto_15423 ?auto_15424 )
      ( !DRIVE ?auto_15423 ?auto_15424 ?auto_15422 )
      ( !UNLOAD ?auto_15421 ?auto_15420 ?auto_15423 ?auto_15422 )
      ( !DROP ?auto_15421 ?auto_15420 ?auto_15419 ?auto_15422 )
      ( MAKE-1CRATE-VERIFY ?auto_15419 ?auto_15420 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_15436 - SURFACE
      ?auto_15437 - SURFACE
      ?auto_15438 - SURFACE
      ?auto_15439 - SURFACE
      ?auto_15440 - SURFACE
      ?auto_15442 - SURFACE
      ?auto_15441 - SURFACE
      ?auto_15444 - SURFACE
      ?auto_15443 - SURFACE
    )
    :vars
    (
      ?auto_15449 - HOIST
      ?auto_15445 - PLACE
      ?auto_15448 - PLACE
      ?auto_15446 - HOIST
      ?auto_15450 - SURFACE
      ?auto_15466 - PLACE
      ?auto_15465 - HOIST
      ?auto_15469 - SURFACE
      ?auto_15468 - PLACE
      ?auto_15462 - HOIST
      ?auto_15453 - SURFACE
      ?auto_15460 - PLACE
      ?auto_15467 - HOIST
      ?auto_15461 - SURFACE
      ?auto_15456 - PLACE
      ?auto_15454 - HOIST
      ?auto_15452 - SURFACE
      ?auto_15457 - SURFACE
      ?auto_15451 - PLACE
      ?auto_15458 - HOIST
      ?auto_15455 - SURFACE
      ?auto_15463 - PLACE
      ?auto_15464 - HOIST
      ?auto_15459 - SURFACE
      ?auto_15447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15449 ?auto_15445 ) ( IS-CRATE ?auto_15443 ) ( not ( = ?auto_15448 ?auto_15445 ) ) ( HOIST-AT ?auto_15446 ?auto_15448 ) ( AVAILABLE ?auto_15446 ) ( SURFACE-AT ?auto_15443 ?auto_15448 ) ( ON ?auto_15443 ?auto_15450 ) ( CLEAR ?auto_15443 ) ( not ( = ?auto_15444 ?auto_15443 ) ) ( not ( = ?auto_15444 ?auto_15450 ) ) ( not ( = ?auto_15443 ?auto_15450 ) ) ( not ( = ?auto_15449 ?auto_15446 ) ) ( IS-CRATE ?auto_15444 ) ( not ( = ?auto_15466 ?auto_15445 ) ) ( HOIST-AT ?auto_15465 ?auto_15466 ) ( SURFACE-AT ?auto_15444 ?auto_15466 ) ( ON ?auto_15444 ?auto_15469 ) ( CLEAR ?auto_15444 ) ( not ( = ?auto_15441 ?auto_15444 ) ) ( not ( = ?auto_15441 ?auto_15469 ) ) ( not ( = ?auto_15444 ?auto_15469 ) ) ( not ( = ?auto_15449 ?auto_15465 ) ) ( IS-CRATE ?auto_15441 ) ( not ( = ?auto_15468 ?auto_15445 ) ) ( HOIST-AT ?auto_15462 ?auto_15468 ) ( AVAILABLE ?auto_15462 ) ( SURFACE-AT ?auto_15441 ?auto_15468 ) ( ON ?auto_15441 ?auto_15453 ) ( CLEAR ?auto_15441 ) ( not ( = ?auto_15442 ?auto_15441 ) ) ( not ( = ?auto_15442 ?auto_15453 ) ) ( not ( = ?auto_15441 ?auto_15453 ) ) ( not ( = ?auto_15449 ?auto_15462 ) ) ( IS-CRATE ?auto_15442 ) ( not ( = ?auto_15460 ?auto_15445 ) ) ( HOIST-AT ?auto_15467 ?auto_15460 ) ( AVAILABLE ?auto_15467 ) ( SURFACE-AT ?auto_15442 ?auto_15460 ) ( ON ?auto_15442 ?auto_15461 ) ( CLEAR ?auto_15442 ) ( not ( = ?auto_15440 ?auto_15442 ) ) ( not ( = ?auto_15440 ?auto_15461 ) ) ( not ( = ?auto_15442 ?auto_15461 ) ) ( not ( = ?auto_15449 ?auto_15467 ) ) ( IS-CRATE ?auto_15440 ) ( not ( = ?auto_15456 ?auto_15445 ) ) ( HOIST-AT ?auto_15454 ?auto_15456 ) ( AVAILABLE ?auto_15454 ) ( SURFACE-AT ?auto_15440 ?auto_15456 ) ( ON ?auto_15440 ?auto_15452 ) ( CLEAR ?auto_15440 ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15452 ) ) ( not ( = ?auto_15440 ?auto_15452 ) ) ( not ( = ?auto_15449 ?auto_15454 ) ) ( IS-CRATE ?auto_15439 ) ( AVAILABLE ?auto_15465 ) ( SURFACE-AT ?auto_15439 ?auto_15466 ) ( ON ?auto_15439 ?auto_15457 ) ( CLEAR ?auto_15439 ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15457 ) ) ( not ( = ?auto_15439 ?auto_15457 ) ) ( IS-CRATE ?auto_15438 ) ( not ( = ?auto_15451 ?auto_15445 ) ) ( HOIST-AT ?auto_15458 ?auto_15451 ) ( AVAILABLE ?auto_15458 ) ( SURFACE-AT ?auto_15438 ?auto_15451 ) ( ON ?auto_15438 ?auto_15455 ) ( CLEAR ?auto_15438 ) ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15455 ) ) ( not ( = ?auto_15438 ?auto_15455 ) ) ( not ( = ?auto_15449 ?auto_15458 ) ) ( SURFACE-AT ?auto_15436 ?auto_15445 ) ( CLEAR ?auto_15436 ) ( IS-CRATE ?auto_15437 ) ( AVAILABLE ?auto_15449 ) ( not ( = ?auto_15463 ?auto_15445 ) ) ( HOIST-AT ?auto_15464 ?auto_15463 ) ( AVAILABLE ?auto_15464 ) ( SURFACE-AT ?auto_15437 ?auto_15463 ) ( ON ?auto_15437 ?auto_15459 ) ( CLEAR ?auto_15437 ) ( TRUCK-AT ?auto_15447 ?auto_15445 ) ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15459 ) ) ( not ( = ?auto_15437 ?auto_15459 ) ) ( not ( = ?auto_15449 ?auto_15464 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15455 ) ) ( not ( = ?auto_15438 ?auto_15459 ) ) ( not ( = ?auto_15451 ?auto_15463 ) ) ( not ( = ?auto_15458 ?auto_15464 ) ) ( not ( = ?auto_15455 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15439 ) ) ( not ( = ?auto_15436 ?auto_15457 ) ) ( not ( = ?auto_15437 ?auto_15439 ) ) ( not ( = ?auto_15437 ?auto_15457 ) ) ( not ( = ?auto_15439 ?auto_15455 ) ) ( not ( = ?auto_15439 ?auto_15459 ) ) ( not ( = ?auto_15466 ?auto_15451 ) ) ( not ( = ?auto_15466 ?auto_15463 ) ) ( not ( = ?auto_15465 ?auto_15458 ) ) ( not ( = ?auto_15465 ?auto_15464 ) ) ( not ( = ?auto_15457 ?auto_15455 ) ) ( not ( = ?auto_15457 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15436 ?auto_15452 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15437 ?auto_15452 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15452 ) ) ( not ( = ?auto_15440 ?auto_15457 ) ) ( not ( = ?auto_15440 ?auto_15455 ) ) ( not ( = ?auto_15440 ?auto_15459 ) ) ( not ( = ?auto_15456 ?auto_15466 ) ) ( not ( = ?auto_15456 ?auto_15451 ) ) ( not ( = ?auto_15456 ?auto_15463 ) ) ( not ( = ?auto_15454 ?auto_15465 ) ) ( not ( = ?auto_15454 ?auto_15458 ) ) ( not ( = ?auto_15454 ?auto_15464 ) ) ( not ( = ?auto_15452 ?auto_15457 ) ) ( not ( = ?auto_15452 ?auto_15455 ) ) ( not ( = ?auto_15452 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15442 ) ) ( not ( = ?auto_15436 ?auto_15461 ) ) ( not ( = ?auto_15437 ?auto_15442 ) ) ( not ( = ?auto_15437 ?auto_15461 ) ) ( not ( = ?auto_15438 ?auto_15442 ) ) ( not ( = ?auto_15438 ?auto_15461 ) ) ( not ( = ?auto_15439 ?auto_15442 ) ) ( not ( = ?auto_15439 ?auto_15461 ) ) ( not ( = ?auto_15442 ?auto_15452 ) ) ( not ( = ?auto_15442 ?auto_15457 ) ) ( not ( = ?auto_15442 ?auto_15455 ) ) ( not ( = ?auto_15442 ?auto_15459 ) ) ( not ( = ?auto_15460 ?auto_15456 ) ) ( not ( = ?auto_15460 ?auto_15466 ) ) ( not ( = ?auto_15460 ?auto_15451 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15467 ?auto_15454 ) ) ( not ( = ?auto_15467 ?auto_15465 ) ) ( not ( = ?auto_15467 ?auto_15458 ) ) ( not ( = ?auto_15467 ?auto_15464 ) ) ( not ( = ?auto_15461 ?auto_15452 ) ) ( not ( = ?auto_15461 ?auto_15457 ) ) ( not ( = ?auto_15461 ?auto_15455 ) ) ( not ( = ?auto_15461 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15441 ) ) ( not ( = ?auto_15436 ?auto_15453 ) ) ( not ( = ?auto_15437 ?auto_15441 ) ) ( not ( = ?auto_15437 ?auto_15453 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( not ( = ?auto_15438 ?auto_15453 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15453 ) ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15453 ) ) ( not ( = ?auto_15441 ?auto_15461 ) ) ( not ( = ?auto_15441 ?auto_15452 ) ) ( not ( = ?auto_15441 ?auto_15457 ) ) ( not ( = ?auto_15441 ?auto_15455 ) ) ( not ( = ?auto_15441 ?auto_15459 ) ) ( not ( = ?auto_15468 ?auto_15460 ) ) ( not ( = ?auto_15468 ?auto_15456 ) ) ( not ( = ?auto_15468 ?auto_15466 ) ) ( not ( = ?auto_15468 ?auto_15451 ) ) ( not ( = ?auto_15468 ?auto_15463 ) ) ( not ( = ?auto_15462 ?auto_15467 ) ) ( not ( = ?auto_15462 ?auto_15454 ) ) ( not ( = ?auto_15462 ?auto_15465 ) ) ( not ( = ?auto_15462 ?auto_15458 ) ) ( not ( = ?auto_15462 ?auto_15464 ) ) ( not ( = ?auto_15453 ?auto_15461 ) ) ( not ( = ?auto_15453 ?auto_15452 ) ) ( not ( = ?auto_15453 ?auto_15457 ) ) ( not ( = ?auto_15453 ?auto_15455 ) ) ( not ( = ?auto_15453 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15444 ) ) ( not ( = ?auto_15436 ?auto_15469 ) ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( not ( = ?auto_15437 ?auto_15469 ) ) ( not ( = ?auto_15438 ?auto_15444 ) ) ( not ( = ?auto_15438 ?auto_15469 ) ) ( not ( = ?auto_15439 ?auto_15444 ) ) ( not ( = ?auto_15439 ?auto_15469 ) ) ( not ( = ?auto_15440 ?auto_15444 ) ) ( not ( = ?auto_15440 ?auto_15469 ) ) ( not ( = ?auto_15442 ?auto_15444 ) ) ( not ( = ?auto_15442 ?auto_15469 ) ) ( not ( = ?auto_15444 ?auto_15453 ) ) ( not ( = ?auto_15444 ?auto_15461 ) ) ( not ( = ?auto_15444 ?auto_15452 ) ) ( not ( = ?auto_15444 ?auto_15457 ) ) ( not ( = ?auto_15444 ?auto_15455 ) ) ( not ( = ?auto_15444 ?auto_15459 ) ) ( not ( = ?auto_15469 ?auto_15453 ) ) ( not ( = ?auto_15469 ?auto_15461 ) ) ( not ( = ?auto_15469 ?auto_15452 ) ) ( not ( = ?auto_15469 ?auto_15457 ) ) ( not ( = ?auto_15469 ?auto_15455 ) ) ( not ( = ?auto_15469 ?auto_15459 ) ) ( not ( = ?auto_15436 ?auto_15443 ) ) ( not ( = ?auto_15436 ?auto_15450 ) ) ( not ( = ?auto_15437 ?auto_15443 ) ) ( not ( = ?auto_15437 ?auto_15450 ) ) ( not ( = ?auto_15438 ?auto_15443 ) ) ( not ( = ?auto_15438 ?auto_15450 ) ) ( not ( = ?auto_15439 ?auto_15443 ) ) ( not ( = ?auto_15439 ?auto_15450 ) ) ( not ( = ?auto_15440 ?auto_15443 ) ) ( not ( = ?auto_15440 ?auto_15450 ) ) ( not ( = ?auto_15442 ?auto_15443 ) ) ( not ( = ?auto_15442 ?auto_15450 ) ) ( not ( = ?auto_15441 ?auto_15443 ) ) ( not ( = ?auto_15441 ?auto_15450 ) ) ( not ( = ?auto_15443 ?auto_15469 ) ) ( not ( = ?auto_15443 ?auto_15453 ) ) ( not ( = ?auto_15443 ?auto_15461 ) ) ( not ( = ?auto_15443 ?auto_15452 ) ) ( not ( = ?auto_15443 ?auto_15457 ) ) ( not ( = ?auto_15443 ?auto_15455 ) ) ( not ( = ?auto_15443 ?auto_15459 ) ) ( not ( = ?auto_15448 ?auto_15466 ) ) ( not ( = ?auto_15448 ?auto_15468 ) ) ( not ( = ?auto_15448 ?auto_15460 ) ) ( not ( = ?auto_15448 ?auto_15456 ) ) ( not ( = ?auto_15448 ?auto_15451 ) ) ( not ( = ?auto_15448 ?auto_15463 ) ) ( not ( = ?auto_15446 ?auto_15465 ) ) ( not ( = ?auto_15446 ?auto_15462 ) ) ( not ( = ?auto_15446 ?auto_15467 ) ) ( not ( = ?auto_15446 ?auto_15454 ) ) ( not ( = ?auto_15446 ?auto_15458 ) ) ( not ( = ?auto_15446 ?auto_15464 ) ) ( not ( = ?auto_15450 ?auto_15469 ) ) ( not ( = ?auto_15450 ?auto_15453 ) ) ( not ( = ?auto_15450 ?auto_15461 ) ) ( not ( = ?auto_15450 ?auto_15452 ) ) ( not ( = ?auto_15450 ?auto_15457 ) ) ( not ( = ?auto_15450 ?auto_15455 ) ) ( not ( = ?auto_15450 ?auto_15459 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15436 ?auto_15437 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15442 ?auto_15441 ?auto_15444 )
      ( MAKE-1CRATE ?auto_15444 ?auto_15443 )
      ( MAKE-8CRATE-VERIFY ?auto_15436 ?auto_15437 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15442 ?auto_15441 ?auto_15444 ?auto_15443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15472 - SURFACE
      ?auto_15473 - SURFACE
    )
    :vars
    (
      ?auto_15474 - HOIST
      ?auto_15475 - PLACE
      ?auto_15477 - PLACE
      ?auto_15478 - HOIST
      ?auto_15479 - SURFACE
      ?auto_15476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15474 ?auto_15475 ) ( SURFACE-AT ?auto_15472 ?auto_15475 ) ( CLEAR ?auto_15472 ) ( IS-CRATE ?auto_15473 ) ( AVAILABLE ?auto_15474 ) ( not ( = ?auto_15477 ?auto_15475 ) ) ( HOIST-AT ?auto_15478 ?auto_15477 ) ( AVAILABLE ?auto_15478 ) ( SURFACE-AT ?auto_15473 ?auto_15477 ) ( ON ?auto_15473 ?auto_15479 ) ( CLEAR ?auto_15473 ) ( TRUCK-AT ?auto_15476 ?auto_15475 ) ( not ( = ?auto_15472 ?auto_15473 ) ) ( not ( = ?auto_15472 ?auto_15479 ) ) ( not ( = ?auto_15473 ?auto_15479 ) ) ( not ( = ?auto_15474 ?auto_15478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15476 ?auto_15475 ?auto_15477 )
      ( !LIFT ?auto_15478 ?auto_15473 ?auto_15479 ?auto_15477 )
      ( !LOAD ?auto_15478 ?auto_15473 ?auto_15476 ?auto_15477 )
      ( !DRIVE ?auto_15476 ?auto_15477 ?auto_15475 )
      ( !UNLOAD ?auto_15474 ?auto_15473 ?auto_15476 ?auto_15475 )
      ( !DROP ?auto_15474 ?auto_15473 ?auto_15472 ?auto_15475 )
      ( MAKE-1CRATE-VERIFY ?auto_15472 ?auto_15473 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_15490 - SURFACE
      ?auto_15491 - SURFACE
      ?auto_15492 - SURFACE
      ?auto_15493 - SURFACE
      ?auto_15494 - SURFACE
      ?auto_15497 - SURFACE
      ?auto_15495 - SURFACE
      ?auto_15499 - SURFACE
      ?auto_15498 - SURFACE
      ?auto_15496 - SURFACE
    )
    :vars
    (
      ?auto_15505 - HOIST
      ?auto_15504 - PLACE
      ?auto_15501 - PLACE
      ?auto_15503 - HOIST
      ?auto_15502 - SURFACE
      ?auto_15525 - SURFACE
      ?auto_15512 - PLACE
      ?auto_15507 - HOIST
      ?auto_15511 - SURFACE
      ?auto_15508 - PLACE
      ?auto_15516 - HOIST
      ?auto_15523 - SURFACE
      ?auto_15515 - PLACE
      ?auto_15510 - HOIST
      ?auto_15514 - SURFACE
      ?auto_15521 - PLACE
      ?auto_15506 - HOIST
      ?auto_15524 - SURFACE
      ?auto_15520 - SURFACE
      ?auto_15509 - PLACE
      ?auto_15519 - HOIST
      ?auto_15522 - SURFACE
      ?auto_15517 - PLACE
      ?auto_15518 - HOIST
      ?auto_15513 - SURFACE
      ?auto_15500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15505 ?auto_15504 ) ( IS-CRATE ?auto_15496 ) ( not ( = ?auto_15501 ?auto_15504 ) ) ( HOIST-AT ?auto_15503 ?auto_15501 ) ( SURFACE-AT ?auto_15496 ?auto_15501 ) ( ON ?auto_15496 ?auto_15502 ) ( CLEAR ?auto_15496 ) ( not ( = ?auto_15498 ?auto_15496 ) ) ( not ( = ?auto_15498 ?auto_15502 ) ) ( not ( = ?auto_15496 ?auto_15502 ) ) ( not ( = ?auto_15505 ?auto_15503 ) ) ( IS-CRATE ?auto_15498 ) ( AVAILABLE ?auto_15503 ) ( SURFACE-AT ?auto_15498 ?auto_15501 ) ( ON ?auto_15498 ?auto_15525 ) ( CLEAR ?auto_15498 ) ( not ( = ?auto_15499 ?auto_15498 ) ) ( not ( = ?auto_15499 ?auto_15525 ) ) ( not ( = ?auto_15498 ?auto_15525 ) ) ( IS-CRATE ?auto_15499 ) ( not ( = ?auto_15512 ?auto_15504 ) ) ( HOIST-AT ?auto_15507 ?auto_15512 ) ( SURFACE-AT ?auto_15499 ?auto_15512 ) ( ON ?auto_15499 ?auto_15511 ) ( CLEAR ?auto_15499 ) ( not ( = ?auto_15495 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15511 ) ) ( not ( = ?auto_15499 ?auto_15511 ) ) ( not ( = ?auto_15505 ?auto_15507 ) ) ( IS-CRATE ?auto_15495 ) ( not ( = ?auto_15508 ?auto_15504 ) ) ( HOIST-AT ?auto_15516 ?auto_15508 ) ( AVAILABLE ?auto_15516 ) ( SURFACE-AT ?auto_15495 ?auto_15508 ) ( ON ?auto_15495 ?auto_15523 ) ( CLEAR ?auto_15495 ) ( not ( = ?auto_15497 ?auto_15495 ) ) ( not ( = ?auto_15497 ?auto_15523 ) ) ( not ( = ?auto_15495 ?auto_15523 ) ) ( not ( = ?auto_15505 ?auto_15516 ) ) ( IS-CRATE ?auto_15497 ) ( not ( = ?auto_15515 ?auto_15504 ) ) ( HOIST-AT ?auto_15510 ?auto_15515 ) ( AVAILABLE ?auto_15510 ) ( SURFACE-AT ?auto_15497 ?auto_15515 ) ( ON ?auto_15497 ?auto_15514 ) ( CLEAR ?auto_15497 ) ( not ( = ?auto_15494 ?auto_15497 ) ) ( not ( = ?auto_15494 ?auto_15514 ) ) ( not ( = ?auto_15497 ?auto_15514 ) ) ( not ( = ?auto_15505 ?auto_15510 ) ) ( IS-CRATE ?auto_15494 ) ( not ( = ?auto_15521 ?auto_15504 ) ) ( HOIST-AT ?auto_15506 ?auto_15521 ) ( AVAILABLE ?auto_15506 ) ( SURFACE-AT ?auto_15494 ?auto_15521 ) ( ON ?auto_15494 ?auto_15524 ) ( CLEAR ?auto_15494 ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15524 ) ) ( not ( = ?auto_15494 ?auto_15524 ) ) ( not ( = ?auto_15505 ?auto_15506 ) ) ( IS-CRATE ?auto_15493 ) ( AVAILABLE ?auto_15507 ) ( SURFACE-AT ?auto_15493 ?auto_15512 ) ( ON ?auto_15493 ?auto_15520 ) ( CLEAR ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( not ( = ?auto_15492 ?auto_15520 ) ) ( not ( = ?auto_15493 ?auto_15520 ) ) ( IS-CRATE ?auto_15492 ) ( not ( = ?auto_15509 ?auto_15504 ) ) ( HOIST-AT ?auto_15519 ?auto_15509 ) ( AVAILABLE ?auto_15519 ) ( SURFACE-AT ?auto_15492 ?auto_15509 ) ( ON ?auto_15492 ?auto_15522 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15491 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15522 ) ) ( not ( = ?auto_15492 ?auto_15522 ) ) ( not ( = ?auto_15505 ?auto_15519 ) ) ( SURFACE-AT ?auto_15490 ?auto_15504 ) ( CLEAR ?auto_15490 ) ( IS-CRATE ?auto_15491 ) ( AVAILABLE ?auto_15505 ) ( not ( = ?auto_15517 ?auto_15504 ) ) ( HOIST-AT ?auto_15518 ?auto_15517 ) ( AVAILABLE ?auto_15518 ) ( SURFACE-AT ?auto_15491 ?auto_15517 ) ( ON ?auto_15491 ?auto_15513 ) ( CLEAR ?auto_15491 ) ( TRUCK-AT ?auto_15500 ?auto_15504 ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15513 ) ) ( not ( = ?auto_15491 ?auto_15513 ) ) ( not ( = ?auto_15505 ?auto_15518 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15490 ?auto_15522 ) ) ( not ( = ?auto_15492 ?auto_15513 ) ) ( not ( = ?auto_15509 ?auto_15517 ) ) ( not ( = ?auto_15519 ?auto_15518 ) ) ( not ( = ?auto_15522 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15493 ) ) ( not ( = ?auto_15490 ?auto_15520 ) ) ( not ( = ?auto_15491 ?auto_15493 ) ) ( not ( = ?auto_15491 ?auto_15520 ) ) ( not ( = ?auto_15493 ?auto_15522 ) ) ( not ( = ?auto_15493 ?auto_15513 ) ) ( not ( = ?auto_15512 ?auto_15509 ) ) ( not ( = ?auto_15512 ?auto_15517 ) ) ( not ( = ?auto_15507 ?auto_15519 ) ) ( not ( = ?auto_15507 ?auto_15518 ) ) ( not ( = ?auto_15520 ?auto_15522 ) ) ( not ( = ?auto_15520 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15494 ) ) ( not ( = ?auto_15490 ?auto_15524 ) ) ( not ( = ?auto_15491 ?auto_15494 ) ) ( not ( = ?auto_15491 ?auto_15524 ) ) ( not ( = ?auto_15492 ?auto_15494 ) ) ( not ( = ?auto_15492 ?auto_15524 ) ) ( not ( = ?auto_15494 ?auto_15520 ) ) ( not ( = ?auto_15494 ?auto_15522 ) ) ( not ( = ?auto_15494 ?auto_15513 ) ) ( not ( = ?auto_15521 ?auto_15512 ) ) ( not ( = ?auto_15521 ?auto_15509 ) ) ( not ( = ?auto_15521 ?auto_15517 ) ) ( not ( = ?auto_15506 ?auto_15507 ) ) ( not ( = ?auto_15506 ?auto_15519 ) ) ( not ( = ?auto_15506 ?auto_15518 ) ) ( not ( = ?auto_15524 ?auto_15520 ) ) ( not ( = ?auto_15524 ?auto_15522 ) ) ( not ( = ?auto_15524 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15497 ) ) ( not ( = ?auto_15490 ?auto_15514 ) ) ( not ( = ?auto_15491 ?auto_15497 ) ) ( not ( = ?auto_15491 ?auto_15514 ) ) ( not ( = ?auto_15492 ?auto_15497 ) ) ( not ( = ?auto_15492 ?auto_15514 ) ) ( not ( = ?auto_15493 ?auto_15497 ) ) ( not ( = ?auto_15493 ?auto_15514 ) ) ( not ( = ?auto_15497 ?auto_15524 ) ) ( not ( = ?auto_15497 ?auto_15520 ) ) ( not ( = ?auto_15497 ?auto_15522 ) ) ( not ( = ?auto_15497 ?auto_15513 ) ) ( not ( = ?auto_15515 ?auto_15521 ) ) ( not ( = ?auto_15515 ?auto_15512 ) ) ( not ( = ?auto_15515 ?auto_15509 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15510 ?auto_15506 ) ) ( not ( = ?auto_15510 ?auto_15507 ) ) ( not ( = ?auto_15510 ?auto_15519 ) ) ( not ( = ?auto_15510 ?auto_15518 ) ) ( not ( = ?auto_15514 ?auto_15524 ) ) ( not ( = ?auto_15514 ?auto_15520 ) ) ( not ( = ?auto_15514 ?auto_15522 ) ) ( not ( = ?auto_15514 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15495 ) ) ( not ( = ?auto_15490 ?auto_15523 ) ) ( not ( = ?auto_15491 ?auto_15495 ) ) ( not ( = ?auto_15491 ?auto_15523 ) ) ( not ( = ?auto_15492 ?auto_15495 ) ) ( not ( = ?auto_15492 ?auto_15523 ) ) ( not ( = ?auto_15493 ?auto_15495 ) ) ( not ( = ?auto_15493 ?auto_15523 ) ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15523 ) ) ( not ( = ?auto_15495 ?auto_15514 ) ) ( not ( = ?auto_15495 ?auto_15524 ) ) ( not ( = ?auto_15495 ?auto_15520 ) ) ( not ( = ?auto_15495 ?auto_15522 ) ) ( not ( = ?auto_15495 ?auto_15513 ) ) ( not ( = ?auto_15508 ?auto_15515 ) ) ( not ( = ?auto_15508 ?auto_15521 ) ) ( not ( = ?auto_15508 ?auto_15512 ) ) ( not ( = ?auto_15508 ?auto_15509 ) ) ( not ( = ?auto_15508 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15510 ) ) ( not ( = ?auto_15516 ?auto_15506 ) ) ( not ( = ?auto_15516 ?auto_15507 ) ) ( not ( = ?auto_15516 ?auto_15519 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( not ( = ?auto_15523 ?auto_15514 ) ) ( not ( = ?auto_15523 ?auto_15524 ) ) ( not ( = ?auto_15523 ?auto_15520 ) ) ( not ( = ?auto_15523 ?auto_15522 ) ) ( not ( = ?auto_15523 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15499 ) ) ( not ( = ?auto_15490 ?auto_15511 ) ) ( not ( = ?auto_15491 ?auto_15499 ) ) ( not ( = ?auto_15491 ?auto_15511 ) ) ( not ( = ?auto_15492 ?auto_15499 ) ) ( not ( = ?auto_15492 ?auto_15511 ) ) ( not ( = ?auto_15493 ?auto_15499 ) ) ( not ( = ?auto_15493 ?auto_15511 ) ) ( not ( = ?auto_15494 ?auto_15499 ) ) ( not ( = ?auto_15494 ?auto_15511 ) ) ( not ( = ?auto_15497 ?auto_15499 ) ) ( not ( = ?auto_15497 ?auto_15511 ) ) ( not ( = ?auto_15499 ?auto_15523 ) ) ( not ( = ?auto_15499 ?auto_15514 ) ) ( not ( = ?auto_15499 ?auto_15524 ) ) ( not ( = ?auto_15499 ?auto_15520 ) ) ( not ( = ?auto_15499 ?auto_15522 ) ) ( not ( = ?auto_15499 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15523 ) ) ( not ( = ?auto_15511 ?auto_15514 ) ) ( not ( = ?auto_15511 ?auto_15524 ) ) ( not ( = ?auto_15511 ?auto_15520 ) ) ( not ( = ?auto_15511 ?auto_15522 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15498 ) ) ( not ( = ?auto_15490 ?auto_15525 ) ) ( not ( = ?auto_15491 ?auto_15498 ) ) ( not ( = ?auto_15491 ?auto_15525 ) ) ( not ( = ?auto_15492 ?auto_15498 ) ) ( not ( = ?auto_15492 ?auto_15525 ) ) ( not ( = ?auto_15493 ?auto_15498 ) ) ( not ( = ?auto_15493 ?auto_15525 ) ) ( not ( = ?auto_15494 ?auto_15498 ) ) ( not ( = ?auto_15494 ?auto_15525 ) ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( not ( = ?auto_15497 ?auto_15525 ) ) ( not ( = ?auto_15495 ?auto_15498 ) ) ( not ( = ?auto_15495 ?auto_15525 ) ) ( not ( = ?auto_15498 ?auto_15511 ) ) ( not ( = ?auto_15498 ?auto_15523 ) ) ( not ( = ?auto_15498 ?auto_15514 ) ) ( not ( = ?auto_15498 ?auto_15524 ) ) ( not ( = ?auto_15498 ?auto_15520 ) ) ( not ( = ?auto_15498 ?auto_15522 ) ) ( not ( = ?auto_15498 ?auto_15513 ) ) ( not ( = ?auto_15501 ?auto_15512 ) ) ( not ( = ?auto_15501 ?auto_15508 ) ) ( not ( = ?auto_15501 ?auto_15515 ) ) ( not ( = ?auto_15501 ?auto_15521 ) ) ( not ( = ?auto_15501 ?auto_15509 ) ) ( not ( = ?auto_15501 ?auto_15517 ) ) ( not ( = ?auto_15503 ?auto_15507 ) ) ( not ( = ?auto_15503 ?auto_15516 ) ) ( not ( = ?auto_15503 ?auto_15510 ) ) ( not ( = ?auto_15503 ?auto_15506 ) ) ( not ( = ?auto_15503 ?auto_15519 ) ) ( not ( = ?auto_15503 ?auto_15518 ) ) ( not ( = ?auto_15525 ?auto_15511 ) ) ( not ( = ?auto_15525 ?auto_15523 ) ) ( not ( = ?auto_15525 ?auto_15514 ) ) ( not ( = ?auto_15525 ?auto_15524 ) ) ( not ( = ?auto_15525 ?auto_15520 ) ) ( not ( = ?auto_15525 ?auto_15522 ) ) ( not ( = ?auto_15525 ?auto_15513 ) ) ( not ( = ?auto_15490 ?auto_15496 ) ) ( not ( = ?auto_15490 ?auto_15502 ) ) ( not ( = ?auto_15491 ?auto_15496 ) ) ( not ( = ?auto_15491 ?auto_15502 ) ) ( not ( = ?auto_15492 ?auto_15496 ) ) ( not ( = ?auto_15492 ?auto_15502 ) ) ( not ( = ?auto_15493 ?auto_15496 ) ) ( not ( = ?auto_15493 ?auto_15502 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15502 ) ) ( not ( = ?auto_15497 ?auto_15496 ) ) ( not ( = ?auto_15497 ?auto_15502 ) ) ( not ( = ?auto_15495 ?auto_15496 ) ) ( not ( = ?auto_15495 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15496 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15496 ?auto_15525 ) ) ( not ( = ?auto_15496 ?auto_15511 ) ) ( not ( = ?auto_15496 ?auto_15523 ) ) ( not ( = ?auto_15496 ?auto_15514 ) ) ( not ( = ?auto_15496 ?auto_15524 ) ) ( not ( = ?auto_15496 ?auto_15520 ) ) ( not ( = ?auto_15496 ?auto_15522 ) ) ( not ( = ?auto_15496 ?auto_15513 ) ) ( not ( = ?auto_15502 ?auto_15525 ) ) ( not ( = ?auto_15502 ?auto_15511 ) ) ( not ( = ?auto_15502 ?auto_15523 ) ) ( not ( = ?auto_15502 ?auto_15514 ) ) ( not ( = ?auto_15502 ?auto_15524 ) ) ( not ( = ?auto_15502 ?auto_15520 ) ) ( not ( = ?auto_15502 ?auto_15522 ) ) ( not ( = ?auto_15502 ?auto_15513 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15490 ?auto_15491 ?auto_15492 ?auto_15493 ?auto_15494 ?auto_15497 ?auto_15495 ?auto_15499 ?auto_15498 )
      ( MAKE-1CRATE ?auto_15498 ?auto_15496 )
      ( MAKE-9CRATE-VERIFY ?auto_15490 ?auto_15491 ?auto_15492 ?auto_15493 ?auto_15494 ?auto_15497 ?auto_15495 ?auto_15499 ?auto_15498 ?auto_15496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15528 - SURFACE
      ?auto_15529 - SURFACE
    )
    :vars
    (
      ?auto_15530 - HOIST
      ?auto_15531 - PLACE
      ?auto_15533 - PLACE
      ?auto_15534 - HOIST
      ?auto_15535 - SURFACE
      ?auto_15532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15530 ?auto_15531 ) ( SURFACE-AT ?auto_15528 ?auto_15531 ) ( CLEAR ?auto_15528 ) ( IS-CRATE ?auto_15529 ) ( AVAILABLE ?auto_15530 ) ( not ( = ?auto_15533 ?auto_15531 ) ) ( HOIST-AT ?auto_15534 ?auto_15533 ) ( AVAILABLE ?auto_15534 ) ( SURFACE-AT ?auto_15529 ?auto_15533 ) ( ON ?auto_15529 ?auto_15535 ) ( CLEAR ?auto_15529 ) ( TRUCK-AT ?auto_15532 ?auto_15531 ) ( not ( = ?auto_15528 ?auto_15529 ) ) ( not ( = ?auto_15528 ?auto_15535 ) ) ( not ( = ?auto_15529 ?auto_15535 ) ) ( not ( = ?auto_15530 ?auto_15534 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15532 ?auto_15531 ?auto_15533 )
      ( !LIFT ?auto_15534 ?auto_15529 ?auto_15535 ?auto_15533 )
      ( !LOAD ?auto_15534 ?auto_15529 ?auto_15532 ?auto_15533 )
      ( !DRIVE ?auto_15532 ?auto_15533 ?auto_15531 )
      ( !UNLOAD ?auto_15530 ?auto_15529 ?auto_15532 ?auto_15531 )
      ( !DROP ?auto_15530 ?auto_15529 ?auto_15528 ?auto_15531 )
      ( MAKE-1CRATE-VERIFY ?auto_15528 ?auto_15529 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_15547 - SURFACE
      ?auto_15548 - SURFACE
      ?auto_15549 - SURFACE
      ?auto_15550 - SURFACE
      ?auto_15551 - SURFACE
      ?auto_15554 - SURFACE
      ?auto_15552 - SURFACE
      ?auto_15556 - SURFACE
      ?auto_15555 - SURFACE
      ?auto_15553 - SURFACE
      ?auto_15557 - SURFACE
    )
    :vars
    (
      ?auto_15558 - HOIST
      ?auto_15562 - PLACE
      ?auto_15560 - PLACE
      ?auto_15559 - HOIST
      ?auto_15561 - SURFACE
      ?auto_15565 - PLACE
      ?auto_15564 - HOIST
      ?auto_15586 - SURFACE
      ?auto_15572 - SURFACE
      ?auto_15577 - PLACE
      ?auto_15583 - HOIST
      ?auto_15578 - SURFACE
      ?auto_15574 - PLACE
      ?auto_15575 - HOIST
      ?auto_15581 - SURFACE
      ?auto_15568 - PLACE
      ?auto_15579 - HOIST
      ?auto_15585 - SURFACE
      ?auto_15582 - PLACE
      ?auto_15566 - HOIST
      ?auto_15584 - SURFACE
      ?auto_15567 - SURFACE
      ?auto_15580 - PLACE
      ?auto_15570 - HOIST
      ?auto_15573 - SURFACE
      ?auto_15571 - PLACE
      ?auto_15569 - HOIST
      ?auto_15576 - SURFACE
      ?auto_15563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15558 ?auto_15562 ) ( IS-CRATE ?auto_15557 ) ( not ( = ?auto_15560 ?auto_15562 ) ) ( HOIST-AT ?auto_15559 ?auto_15560 ) ( AVAILABLE ?auto_15559 ) ( SURFACE-AT ?auto_15557 ?auto_15560 ) ( ON ?auto_15557 ?auto_15561 ) ( CLEAR ?auto_15557 ) ( not ( = ?auto_15553 ?auto_15557 ) ) ( not ( = ?auto_15553 ?auto_15561 ) ) ( not ( = ?auto_15557 ?auto_15561 ) ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( IS-CRATE ?auto_15553 ) ( not ( = ?auto_15565 ?auto_15562 ) ) ( HOIST-AT ?auto_15564 ?auto_15565 ) ( SURFACE-AT ?auto_15553 ?auto_15565 ) ( ON ?auto_15553 ?auto_15586 ) ( CLEAR ?auto_15553 ) ( not ( = ?auto_15555 ?auto_15553 ) ) ( not ( = ?auto_15555 ?auto_15586 ) ) ( not ( = ?auto_15553 ?auto_15586 ) ) ( not ( = ?auto_15558 ?auto_15564 ) ) ( IS-CRATE ?auto_15555 ) ( AVAILABLE ?auto_15564 ) ( SURFACE-AT ?auto_15555 ?auto_15565 ) ( ON ?auto_15555 ?auto_15572 ) ( CLEAR ?auto_15555 ) ( not ( = ?auto_15556 ?auto_15555 ) ) ( not ( = ?auto_15556 ?auto_15572 ) ) ( not ( = ?auto_15555 ?auto_15572 ) ) ( IS-CRATE ?auto_15556 ) ( not ( = ?auto_15577 ?auto_15562 ) ) ( HOIST-AT ?auto_15583 ?auto_15577 ) ( SURFACE-AT ?auto_15556 ?auto_15577 ) ( ON ?auto_15556 ?auto_15578 ) ( CLEAR ?auto_15556 ) ( not ( = ?auto_15552 ?auto_15556 ) ) ( not ( = ?auto_15552 ?auto_15578 ) ) ( not ( = ?auto_15556 ?auto_15578 ) ) ( not ( = ?auto_15558 ?auto_15583 ) ) ( IS-CRATE ?auto_15552 ) ( not ( = ?auto_15574 ?auto_15562 ) ) ( HOIST-AT ?auto_15575 ?auto_15574 ) ( AVAILABLE ?auto_15575 ) ( SURFACE-AT ?auto_15552 ?auto_15574 ) ( ON ?auto_15552 ?auto_15581 ) ( CLEAR ?auto_15552 ) ( not ( = ?auto_15554 ?auto_15552 ) ) ( not ( = ?auto_15554 ?auto_15581 ) ) ( not ( = ?auto_15552 ?auto_15581 ) ) ( not ( = ?auto_15558 ?auto_15575 ) ) ( IS-CRATE ?auto_15554 ) ( not ( = ?auto_15568 ?auto_15562 ) ) ( HOIST-AT ?auto_15579 ?auto_15568 ) ( AVAILABLE ?auto_15579 ) ( SURFACE-AT ?auto_15554 ?auto_15568 ) ( ON ?auto_15554 ?auto_15585 ) ( CLEAR ?auto_15554 ) ( not ( = ?auto_15551 ?auto_15554 ) ) ( not ( = ?auto_15551 ?auto_15585 ) ) ( not ( = ?auto_15554 ?auto_15585 ) ) ( not ( = ?auto_15558 ?auto_15579 ) ) ( IS-CRATE ?auto_15551 ) ( not ( = ?auto_15582 ?auto_15562 ) ) ( HOIST-AT ?auto_15566 ?auto_15582 ) ( AVAILABLE ?auto_15566 ) ( SURFACE-AT ?auto_15551 ?auto_15582 ) ( ON ?auto_15551 ?auto_15584 ) ( CLEAR ?auto_15551 ) ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15584 ) ) ( not ( = ?auto_15551 ?auto_15584 ) ) ( not ( = ?auto_15558 ?auto_15566 ) ) ( IS-CRATE ?auto_15550 ) ( AVAILABLE ?auto_15583 ) ( SURFACE-AT ?auto_15550 ?auto_15577 ) ( ON ?auto_15550 ?auto_15567 ) ( CLEAR ?auto_15550 ) ( not ( = ?auto_15549 ?auto_15550 ) ) ( not ( = ?auto_15549 ?auto_15567 ) ) ( not ( = ?auto_15550 ?auto_15567 ) ) ( IS-CRATE ?auto_15549 ) ( not ( = ?auto_15580 ?auto_15562 ) ) ( HOIST-AT ?auto_15570 ?auto_15580 ) ( AVAILABLE ?auto_15570 ) ( SURFACE-AT ?auto_15549 ?auto_15580 ) ( ON ?auto_15549 ?auto_15573 ) ( CLEAR ?auto_15549 ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15573 ) ) ( not ( = ?auto_15549 ?auto_15573 ) ) ( not ( = ?auto_15558 ?auto_15570 ) ) ( SURFACE-AT ?auto_15547 ?auto_15562 ) ( CLEAR ?auto_15547 ) ( IS-CRATE ?auto_15548 ) ( AVAILABLE ?auto_15558 ) ( not ( = ?auto_15571 ?auto_15562 ) ) ( HOIST-AT ?auto_15569 ?auto_15571 ) ( AVAILABLE ?auto_15569 ) ( SURFACE-AT ?auto_15548 ?auto_15571 ) ( ON ?auto_15548 ?auto_15576 ) ( CLEAR ?auto_15548 ) ( TRUCK-AT ?auto_15563 ?auto_15562 ) ( not ( = ?auto_15547 ?auto_15548 ) ) ( not ( = ?auto_15547 ?auto_15576 ) ) ( not ( = ?auto_15548 ?auto_15576 ) ) ( not ( = ?auto_15558 ?auto_15569 ) ) ( not ( = ?auto_15547 ?auto_15549 ) ) ( not ( = ?auto_15547 ?auto_15573 ) ) ( not ( = ?auto_15549 ?auto_15576 ) ) ( not ( = ?auto_15580 ?auto_15571 ) ) ( not ( = ?auto_15570 ?auto_15569 ) ) ( not ( = ?auto_15573 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15550 ) ) ( not ( = ?auto_15547 ?auto_15567 ) ) ( not ( = ?auto_15548 ?auto_15550 ) ) ( not ( = ?auto_15548 ?auto_15567 ) ) ( not ( = ?auto_15550 ?auto_15573 ) ) ( not ( = ?auto_15550 ?auto_15576 ) ) ( not ( = ?auto_15577 ?auto_15580 ) ) ( not ( = ?auto_15577 ?auto_15571 ) ) ( not ( = ?auto_15583 ?auto_15570 ) ) ( not ( = ?auto_15583 ?auto_15569 ) ) ( not ( = ?auto_15567 ?auto_15573 ) ) ( not ( = ?auto_15567 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15551 ) ) ( not ( = ?auto_15547 ?auto_15584 ) ) ( not ( = ?auto_15548 ?auto_15551 ) ) ( not ( = ?auto_15548 ?auto_15584 ) ) ( not ( = ?auto_15549 ?auto_15551 ) ) ( not ( = ?auto_15549 ?auto_15584 ) ) ( not ( = ?auto_15551 ?auto_15567 ) ) ( not ( = ?auto_15551 ?auto_15573 ) ) ( not ( = ?auto_15551 ?auto_15576 ) ) ( not ( = ?auto_15582 ?auto_15577 ) ) ( not ( = ?auto_15582 ?auto_15580 ) ) ( not ( = ?auto_15582 ?auto_15571 ) ) ( not ( = ?auto_15566 ?auto_15583 ) ) ( not ( = ?auto_15566 ?auto_15570 ) ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( not ( = ?auto_15584 ?auto_15567 ) ) ( not ( = ?auto_15584 ?auto_15573 ) ) ( not ( = ?auto_15584 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15554 ) ) ( not ( = ?auto_15547 ?auto_15585 ) ) ( not ( = ?auto_15548 ?auto_15554 ) ) ( not ( = ?auto_15548 ?auto_15585 ) ) ( not ( = ?auto_15549 ?auto_15554 ) ) ( not ( = ?auto_15549 ?auto_15585 ) ) ( not ( = ?auto_15550 ?auto_15554 ) ) ( not ( = ?auto_15550 ?auto_15585 ) ) ( not ( = ?auto_15554 ?auto_15584 ) ) ( not ( = ?auto_15554 ?auto_15567 ) ) ( not ( = ?auto_15554 ?auto_15573 ) ) ( not ( = ?auto_15554 ?auto_15576 ) ) ( not ( = ?auto_15568 ?auto_15582 ) ) ( not ( = ?auto_15568 ?auto_15577 ) ) ( not ( = ?auto_15568 ?auto_15580 ) ) ( not ( = ?auto_15568 ?auto_15571 ) ) ( not ( = ?auto_15579 ?auto_15566 ) ) ( not ( = ?auto_15579 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15570 ) ) ( not ( = ?auto_15579 ?auto_15569 ) ) ( not ( = ?auto_15585 ?auto_15584 ) ) ( not ( = ?auto_15585 ?auto_15567 ) ) ( not ( = ?auto_15585 ?auto_15573 ) ) ( not ( = ?auto_15585 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15552 ) ) ( not ( = ?auto_15547 ?auto_15581 ) ) ( not ( = ?auto_15548 ?auto_15552 ) ) ( not ( = ?auto_15548 ?auto_15581 ) ) ( not ( = ?auto_15549 ?auto_15552 ) ) ( not ( = ?auto_15549 ?auto_15581 ) ) ( not ( = ?auto_15550 ?auto_15552 ) ) ( not ( = ?auto_15550 ?auto_15581 ) ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( not ( = ?auto_15551 ?auto_15581 ) ) ( not ( = ?auto_15552 ?auto_15585 ) ) ( not ( = ?auto_15552 ?auto_15584 ) ) ( not ( = ?auto_15552 ?auto_15567 ) ) ( not ( = ?auto_15552 ?auto_15573 ) ) ( not ( = ?auto_15552 ?auto_15576 ) ) ( not ( = ?auto_15574 ?auto_15568 ) ) ( not ( = ?auto_15574 ?auto_15582 ) ) ( not ( = ?auto_15574 ?auto_15577 ) ) ( not ( = ?auto_15574 ?auto_15580 ) ) ( not ( = ?auto_15574 ?auto_15571 ) ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( not ( = ?auto_15575 ?auto_15566 ) ) ( not ( = ?auto_15575 ?auto_15583 ) ) ( not ( = ?auto_15575 ?auto_15570 ) ) ( not ( = ?auto_15575 ?auto_15569 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15567 ) ) ( not ( = ?auto_15581 ?auto_15573 ) ) ( not ( = ?auto_15581 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15556 ) ) ( not ( = ?auto_15547 ?auto_15578 ) ) ( not ( = ?auto_15548 ?auto_15556 ) ) ( not ( = ?auto_15548 ?auto_15578 ) ) ( not ( = ?auto_15549 ?auto_15556 ) ) ( not ( = ?auto_15549 ?auto_15578 ) ) ( not ( = ?auto_15550 ?auto_15556 ) ) ( not ( = ?auto_15550 ?auto_15578 ) ) ( not ( = ?auto_15551 ?auto_15556 ) ) ( not ( = ?auto_15551 ?auto_15578 ) ) ( not ( = ?auto_15554 ?auto_15556 ) ) ( not ( = ?auto_15554 ?auto_15578 ) ) ( not ( = ?auto_15556 ?auto_15581 ) ) ( not ( = ?auto_15556 ?auto_15585 ) ) ( not ( = ?auto_15556 ?auto_15584 ) ) ( not ( = ?auto_15556 ?auto_15567 ) ) ( not ( = ?auto_15556 ?auto_15573 ) ) ( not ( = ?auto_15556 ?auto_15576 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15567 ) ) ( not ( = ?auto_15578 ?auto_15573 ) ) ( not ( = ?auto_15578 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15555 ) ) ( not ( = ?auto_15547 ?auto_15572 ) ) ( not ( = ?auto_15548 ?auto_15555 ) ) ( not ( = ?auto_15548 ?auto_15572 ) ) ( not ( = ?auto_15549 ?auto_15555 ) ) ( not ( = ?auto_15549 ?auto_15572 ) ) ( not ( = ?auto_15550 ?auto_15555 ) ) ( not ( = ?auto_15550 ?auto_15572 ) ) ( not ( = ?auto_15551 ?auto_15555 ) ) ( not ( = ?auto_15551 ?auto_15572 ) ) ( not ( = ?auto_15554 ?auto_15555 ) ) ( not ( = ?auto_15554 ?auto_15572 ) ) ( not ( = ?auto_15552 ?auto_15555 ) ) ( not ( = ?auto_15552 ?auto_15572 ) ) ( not ( = ?auto_15555 ?auto_15578 ) ) ( not ( = ?auto_15555 ?auto_15581 ) ) ( not ( = ?auto_15555 ?auto_15585 ) ) ( not ( = ?auto_15555 ?auto_15584 ) ) ( not ( = ?auto_15555 ?auto_15567 ) ) ( not ( = ?auto_15555 ?auto_15573 ) ) ( not ( = ?auto_15555 ?auto_15576 ) ) ( not ( = ?auto_15565 ?auto_15577 ) ) ( not ( = ?auto_15565 ?auto_15574 ) ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15565 ?auto_15582 ) ) ( not ( = ?auto_15565 ?auto_15580 ) ) ( not ( = ?auto_15565 ?auto_15571 ) ) ( not ( = ?auto_15564 ?auto_15583 ) ) ( not ( = ?auto_15564 ?auto_15575 ) ) ( not ( = ?auto_15564 ?auto_15579 ) ) ( not ( = ?auto_15564 ?auto_15566 ) ) ( not ( = ?auto_15564 ?auto_15570 ) ) ( not ( = ?auto_15564 ?auto_15569 ) ) ( not ( = ?auto_15572 ?auto_15578 ) ) ( not ( = ?auto_15572 ?auto_15581 ) ) ( not ( = ?auto_15572 ?auto_15585 ) ) ( not ( = ?auto_15572 ?auto_15584 ) ) ( not ( = ?auto_15572 ?auto_15567 ) ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( not ( = ?auto_15572 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15553 ) ) ( not ( = ?auto_15547 ?auto_15586 ) ) ( not ( = ?auto_15548 ?auto_15553 ) ) ( not ( = ?auto_15548 ?auto_15586 ) ) ( not ( = ?auto_15549 ?auto_15553 ) ) ( not ( = ?auto_15549 ?auto_15586 ) ) ( not ( = ?auto_15550 ?auto_15553 ) ) ( not ( = ?auto_15550 ?auto_15586 ) ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( not ( = ?auto_15551 ?auto_15586 ) ) ( not ( = ?auto_15554 ?auto_15553 ) ) ( not ( = ?auto_15554 ?auto_15586 ) ) ( not ( = ?auto_15552 ?auto_15553 ) ) ( not ( = ?auto_15552 ?auto_15586 ) ) ( not ( = ?auto_15556 ?auto_15553 ) ) ( not ( = ?auto_15556 ?auto_15586 ) ) ( not ( = ?auto_15553 ?auto_15572 ) ) ( not ( = ?auto_15553 ?auto_15578 ) ) ( not ( = ?auto_15553 ?auto_15581 ) ) ( not ( = ?auto_15553 ?auto_15585 ) ) ( not ( = ?auto_15553 ?auto_15584 ) ) ( not ( = ?auto_15553 ?auto_15567 ) ) ( not ( = ?auto_15553 ?auto_15573 ) ) ( not ( = ?auto_15553 ?auto_15576 ) ) ( not ( = ?auto_15586 ?auto_15572 ) ) ( not ( = ?auto_15586 ?auto_15578 ) ) ( not ( = ?auto_15586 ?auto_15581 ) ) ( not ( = ?auto_15586 ?auto_15585 ) ) ( not ( = ?auto_15586 ?auto_15584 ) ) ( not ( = ?auto_15586 ?auto_15567 ) ) ( not ( = ?auto_15586 ?auto_15573 ) ) ( not ( = ?auto_15586 ?auto_15576 ) ) ( not ( = ?auto_15547 ?auto_15557 ) ) ( not ( = ?auto_15547 ?auto_15561 ) ) ( not ( = ?auto_15548 ?auto_15557 ) ) ( not ( = ?auto_15548 ?auto_15561 ) ) ( not ( = ?auto_15549 ?auto_15557 ) ) ( not ( = ?auto_15549 ?auto_15561 ) ) ( not ( = ?auto_15550 ?auto_15557 ) ) ( not ( = ?auto_15550 ?auto_15561 ) ) ( not ( = ?auto_15551 ?auto_15557 ) ) ( not ( = ?auto_15551 ?auto_15561 ) ) ( not ( = ?auto_15554 ?auto_15557 ) ) ( not ( = ?auto_15554 ?auto_15561 ) ) ( not ( = ?auto_15552 ?auto_15557 ) ) ( not ( = ?auto_15552 ?auto_15561 ) ) ( not ( = ?auto_15556 ?auto_15557 ) ) ( not ( = ?auto_15556 ?auto_15561 ) ) ( not ( = ?auto_15555 ?auto_15557 ) ) ( not ( = ?auto_15555 ?auto_15561 ) ) ( not ( = ?auto_15557 ?auto_15586 ) ) ( not ( = ?auto_15557 ?auto_15572 ) ) ( not ( = ?auto_15557 ?auto_15578 ) ) ( not ( = ?auto_15557 ?auto_15581 ) ) ( not ( = ?auto_15557 ?auto_15585 ) ) ( not ( = ?auto_15557 ?auto_15584 ) ) ( not ( = ?auto_15557 ?auto_15567 ) ) ( not ( = ?auto_15557 ?auto_15573 ) ) ( not ( = ?auto_15557 ?auto_15576 ) ) ( not ( = ?auto_15560 ?auto_15565 ) ) ( not ( = ?auto_15560 ?auto_15577 ) ) ( not ( = ?auto_15560 ?auto_15574 ) ) ( not ( = ?auto_15560 ?auto_15568 ) ) ( not ( = ?auto_15560 ?auto_15582 ) ) ( not ( = ?auto_15560 ?auto_15580 ) ) ( not ( = ?auto_15560 ?auto_15571 ) ) ( not ( = ?auto_15559 ?auto_15564 ) ) ( not ( = ?auto_15559 ?auto_15583 ) ) ( not ( = ?auto_15559 ?auto_15575 ) ) ( not ( = ?auto_15559 ?auto_15579 ) ) ( not ( = ?auto_15559 ?auto_15566 ) ) ( not ( = ?auto_15559 ?auto_15570 ) ) ( not ( = ?auto_15559 ?auto_15569 ) ) ( not ( = ?auto_15561 ?auto_15586 ) ) ( not ( = ?auto_15561 ?auto_15572 ) ) ( not ( = ?auto_15561 ?auto_15578 ) ) ( not ( = ?auto_15561 ?auto_15581 ) ) ( not ( = ?auto_15561 ?auto_15585 ) ) ( not ( = ?auto_15561 ?auto_15584 ) ) ( not ( = ?auto_15561 ?auto_15567 ) ) ( not ( = ?auto_15561 ?auto_15573 ) ) ( not ( = ?auto_15561 ?auto_15576 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15547 ?auto_15548 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15554 ?auto_15552 ?auto_15556 ?auto_15555 ?auto_15553 )
      ( MAKE-1CRATE ?auto_15553 ?auto_15557 )
      ( MAKE-10CRATE-VERIFY ?auto_15547 ?auto_15548 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15554 ?auto_15552 ?auto_15556 ?auto_15555 ?auto_15553 ?auto_15557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15589 - SURFACE
      ?auto_15590 - SURFACE
    )
    :vars
    (
      ?auto_15591 - HOIST
      ?auto_15592 - PLACE
      ?auto_15594 - PLACE
      ?auto_15595 - HOIST
      ?auto_15596 - SURFACE
      ?auto_15593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15591 ?auto_15592 ) ( SURFACE-AT ?auto_15589 ?auto_15592 ) ( CLEAR ?auto_15589 ) ( IS-CRATE ?auto_15590 ) ( AVAILABLE ?auto_15591 ) ( not ( = ?auto_15594 ?auto_15592 ) ) ( HOIST-AT ?auto_15595 ?auto_15594 ) ( AVAILABLE ?auto_15595 ) ( SURFACE-AT ?auto_15590 ?auto_15594 ) ( ON ?auto_15590 ?auto_15596 ) ( CLEAR ?auto_15590 ) ( TRUCK-AT ?auto_15593 ?auto_15592 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15589 ?auto_15596 ) ) ( not ( = ?auto_15590 ?auto_15596 ) ) ( not ( = ?auto_15591 ?auto_15595 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15593 ?auto_15592 ?auto_15594 )
      ( !LIFT ?auto_15595 ?auto_15590 ?auto_15596 ?auto_15594 )
      ( !LOAD ?auto_15595 ?auto_15590 ?auto_15593 ?auto_15594 )
      ( !DRIVE ?auto_15593 ?auto_15594 ?auto_15592 )
      ( !UNLOAD ?auto_15591 ?auto_15590 ?auto_15593 ?auto_15592 )
      ( !DROP ?auto_15591 ?auto_15590 ?auto_15589 ?auto_15592 )
      ( MAKE-1CRATE-VERIFY ?auto_15589 ?auto_15590 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15609 - SURFACE
      ?auto_15610 - SURFACE
      ?auto_15611 - SURFACE
      ?auto_15612 - SURFACE
      ?auto_15613 - SURFACE
      ?auto_15616 - SURFACE
      ?auto_15614 - SURFACE
      ?auto_15618 - SURFACE
      ?auto_15617 - SURFACE
      ?auto_15615 - SURFACE
      ?auto_15620 - SURFACE
      ?auto_15619 - SURFACE
    )
    :vars
    (
      ?auto_15623 - HOIST
      ?auto_15624 - PLACE
      ?auto_15626 - PLACE
      ?auto_15622 - HOIST
      ?auto_15625 - SURFACE
      ?auto_15651 - PLACE
      ?auto_15634 - HOIST
      ?auto_15646 - SURFACE
      ?auto_15630 - PLACE
      ?auto_15632 - HOIST
      ?auto_15649 - SURFACE
      ?auto_15627 - SURFACE
      ?auto_15643 - PLACE
      ?auto_15628 - HOIST
      ?auto_15645 - SURFACE
      ?auto_15642 - PLACE
      ?auto_15637 - HOIST
      ?auto_15639 - SURFACE
      ?auto_15640 - PLACE
      ?auto_15635 - HOIST
      ?auto_15629 - SURFACE
      ?auto_15638 - PLACE
      ?auto_15647 - HOIST
      ?auto_15650 - SURFACE
      ?auto_15633 - SURFACE
      ?auto_15648 - PLACE
      ?auto_15636 - HOIST
      ?auto_15644 - SURFACE
      ?auto_15652 - PLACE
      ?auto_15631 - HOIST
      ?auto_15641 - SURFACE
      ?auto_15621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15623 ?auto_15624 ) ( IS-CRATE ?auto_15619 ) ( not ( = ?auto_15626 ?auto_15624 ) ) ( HOIST-AT ?auto_15622 ?auto_15626 ) ( AVAILABLE ?auto_15622 ) ( SURFACE-AT ?auto_15619 ?auto_15626 ) ( ON ?auto_15619 ?auto_15625 ) ( CLEAR ?auto_15619 ) ( not ( = ?auto_15620 ?auto_15619 ) ) ( not ( = ?auto_15620 ?auto_15625 ) ) ( not ( = ?auto_15619 ?auto_15625 ) ) ( not ( = ?auto_15623 ?auto_15622 ) ) ( IS-CRATE ?auto_15620 ) ( not ( = ?auto_15651 ?auto_15624 ) ) ( HOIST-AT ?auto_15634 ?auto_15651 ) ( AVAILABLE ?auto_15634 ) ( SURFACE-AT ?auto_15620 ?auto_15651 ) ( ON ?auto_15620 ?auto_15646 ) ( CLEAR ?auto_15620 ) ( not ( = ?auto_15615 ?auto_15620 ) ) ( not ( = ?auto_15615 ?auto_15646 ) ) ( not ( = ?auto_15620 ?auto_15646 ) ) ( not ( = ?auto_15623 ?auto_15634 ) ) ( IS-CRATE ?auto_15615 ) ( not ( = ?auto_15630 ?auto_15624 ) ) ( HOIST-AT ?auto_15632 ?auto_15630 ) ( SURFACE-AT ?auto_15615 ?auto_15630 ) ( ON ?auto_15615 ?auto_15649 ) ( CLEAR ?auto_15615 ) ( not ( = ?auto_15617 ?auto_15615 ) ) ( not ( = ?auto_15617 ?auto_15649 ) ) ( not ( = ?auto_15615 ?auto_15649 ) ) ( not ( = ?auto_15623 ?auto_15632 ) ) ( IS-CRATE ?auto_15617 ) ( AVAILABLE ?auto_15632 ) ( SURFACE-AT ?auto_15617 ?auto_15630 ) ( ON ?auto_15617 ?auto_15627 ) ( CLEAR ?auto_15617 ) ( not ( = ?auto_15618 ?auto_15617 ) ) ( not ( = ?auto_15618 ?auto_15627 ) ) ( not ( = ?auto_15617 ?auto_15627 ) ) ( IS-CRATE ?auto_15618 ) ( not ( = ?auto_15643 ?auto_15624 ) ) ( HOIST-AT ?auto_15628 ?auto_15643 ) ( SURFACE-AT ?auto_15618 ?auto_15643 ) ( ON ?auto_15618 ?auto_15645 ) ( CLEAR ?auto_15618 ) ( not ( = ?auto_15614 ?auto_15618 ) ) ( not ( = ?auto_15614 ?auto_15645 ) ) ( not ( = ?auto_15618 ?auto_15645 ) ) ( not ( = ?auto_15623 ?auto_15628 ) ) ( IS-CRATE ?auto_15614 ) ( not ( = ?auto_15642 ?auto_15624 ) ) ( HOIST-AT ?auto_15637 ?auto_15642 ) ( AVAILABLE ?auto_15637 ) ( SURFACE-AT ?auto_15614 ?auto_15642 ) ( ON ?auto_15614 ?auto_15639 ) ( CLEAR ?auto_15614 ) ( not ( = ?auto_15616 ?auto_15614 ) ) ( not ( = ?auto_15616 ?auto_15639 ) ) ( not ( = ?auto_15614 ?auto_15639 ) ) ( not ( = ?auto_15623 ?auto_15637 ) ) ( IS-CRATE ?auto_15616 ) ( not ( = ?auto_15640 ?auto_15624 ) ) ( HOIST-AT ?auto_15635 ?auto_15640 ) ( AVAILABLE ?auto_15635 ) ( SURFACE-AT ?auto_15616 ?auto_15640 ) ( ON ?auto_15616 ?auto_15629 ) ( CLEAR ?auto_15616 ) ( not ( = ?auto_15613 ?auto_15616 ) ) ( not ( = ?auto_15613 ?auto_15629 ) ) ( not ( = ?auto_15616 ?auto_15629 ) ) ( not ( = ?auto_15623 ?auto_15635 ) ) ( IS-CRATE ?auto_15613 ) ( not ( = ?auto_15638 ?auto_15624 ) ) ( HOIST-AT ?auto_15647 ?auto_15638 ) ( AVAILABLE ?auto_15647 ) ( SURFACE-AT ?auto_15613 ?auto_15638 ) ( ON ?auto_15613 ?auto_15650 ) ( CLEAR ?auto_15613 ) ( not ( = ?auto_15612 ?auto_15613 ) ) ( not ( = ?auto_15612 ?auto_15650 ) ) ( not ( = ?auto_15613 ?auto_15650 ) ) ( not ( = ?auto_15623 ?auto_15647 ) ) ( IS-CRATE ?auto_15612 ) ( AVAILABLE ?auto_15628 ) ( SURFACE-AT ?auto_15612 ?auto_15643 ) ( ON ?auto_15612 ?auto_15633 ) ( CLEAR ?auto_15612 ) ( not ( = ?auto_15611 ?auto_15612 ) ) ( not ( = ?auto_15611 ?auto_15633 ) ) ( not ( = ?auto_15612 ?auto_15633 ) ) ( IS-CRATE ?auto_15611 ) ( not ( = ?auto_15648 ?auto_15624 ) ) ( HOIST-AT ?auto_15636 ?auto_15648 ) ( AVAILABLE ?auto_15636 ) ( SURFACE-AT ?auto_15611 ?auto_15648 ) ( ON ?auto_15611 ?auto_15644 ) ( CLEAR ?auto_15611 ) ( not ( = ?auto_15610 ?auto_15611 ) ) ( not ( = ?auto_15610 ?auto_15644 ) ) ( not ( = ?auto_15611 ?auto_15644 ) ) ( not ( = ?auto_15623 ?auto_15636 ) ) ( SURFACE-AT ?auto_15609 ?auto_15624 ) ( CLEAR ?auto_15609 ) ( IS-CRATE ?auto_15610 ) ( AVAILABLE ?auto_15623 ) ( not ( = ?auto_15652 ?auto_15624 ) ) ( HOIST-AT ?auto_15631 ?auto_15652 ) ( AVAILABLE ?auto_15631 ) ( SURFACE-AT ?auto_15610 ?auto_15652 ) ( ON ?auto_15610 ?auto_15641 ) ( CLEAR ?auto_15610 ) ( TRUCK-AT ?auto_15621 ?auto_15624 ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15641 ) ) ( not ( = ?auto_15610 ?auto_15641 ) ) ( not ( = ?auto_15623 ?auto_15631 ) ) ( not ( = ?auto_15609 ?auto_15611 ) ) ( not ( = ?auto_15609 ?auto_15644 ) ) ( not ( = ?auto_15611 ?auto_15641 ) ) ( not ( = ?auto_15648 ?auto_15652 ) ) ( not ( = ?auto_15636 ?auto_15631 ) ) ( not ( = ?auto_15644 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15612 ) ) ( not ( = ?auto_15609 ?auto_15633 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15633 ) ) ( not ( = ?auto_15612 ?auto_15644 ) ) ( not ( = ?auto_15612 ?auto_15641 ) ) ( not ( = ?auto_15643 ?auto_15648 ) ) ( not ( = ?auto_15643 ?auto_15652 ) ) ( not ( = ?auto_15628 ?auto_15636 ) ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( not ( = ?auto_15633 ?auto_15644 ) ) ( not ( = ?auto_15633 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15613 ) ) ( not ( = ?auto_15609 ?auto_15650 ) ) ( not ( = ?auto_15610 ?auto_15613 ) ) ( not ( = ?auto_15610 ?auto_15650 ) ) ( not ( = ?auto_15611 ?auto_15613 ) ) ( not ( = ?auto_15611 ?auto_15650 ) ) ( not ( = ?auto_15613 ?auto_15633 ) ) ( not ( = ?auto_15613 ?auto_15644 ) ) ( not ( = ?auto_15613 ?auto_15641 ) ) ( not ( = ?auto_15638 ?auto_15643 ) ) ( not ( = ?auto_15638 ?auto_15648 ) ) ( not ( = ?auto_15638 ?auto_15652 ) ) ( not ( = ?auto_15647 ?auto_15628 ) ) ( not ( = ?auto_15647 ?auto_15636 ) ) ( not ( = ?auto_15647 ?auto_15631 ) ) ( not ( = ?auto_15650 ?auto_15633 ) ) ( not ( = ?auto_15650 ?auto_15644 ) ) ( not ( = ?auto_15650 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15616 ) ) ( not ( = ?auto_15609 ?auto_15629 ) ) ( not ( = ?auto_15610 ?auto_15616 ) ) ( not ( = ?auto_15610 ?auto_15629 ) ) ( not ( = ?auto_15611 ?auto_15616 ) ) ( not ( = ?auto_15611 ?auto_15629 ) ) ( not ( = ?auto_15612 ?auto_15616 ) ) ( not ( = ?auto_15612 ?auto_15629 ) ) ( not ( = ?auto_15616 ?auto_15650 ) ) ( not ( = ?auto_15616 ?auto_15633 ) ) ( not ( = ?auto_15616 ?auto_15644 ) ) ( not ( = ?auto_15616 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15638 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15648 ) ) ( not ( = ?auto_15640 ?auto_15652 ) ) ( not ( = ?auto_15635 ?auto_15647 ) ) ( not ( = ?auto_15635 ?auto_15628 ) ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15631 ) ) ( not ( = ?auto_15629 ?auto_15650 ) ) ( not ( = ?auto_15629 ?auto_15633 ) ) ( not ( = ?auto_15629 ?auto_15644 ) ) ( not ( = ?auto_15629 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15614 ) ) ( not ( = ?auto_15609 ?auto_15639 ) ) ( not ( = ?auto_15610 ?auto_15614 ) ) ( not ( = ?auto_15610 ?auto_15639 ) ) ( not ( = ?auto_15611 ?auto_15614 ) ) ( not ( = ?auto_15611 ?auto_15639 ) ) ( not ( = ?auto_15612 ?auto_15614 ) ) ( not ( = ?auto_15612 ?auto_15639 ) ) ( not ( = ?auto_15613 ?auto_15614 ) ) ( not ( = ?auto_15613 ?auto_15639 ) ) ( not ( = ?auto_15614 ?auto_15629 ) ) ( not ( = ?auto_15614 ?auto_15650 ) ) ( not ( = ?auto_15614 ?auto_15633 ) ) ( not ( = ?auto_15614 ?auto_15644 ) ) ( not ( = ?auto_15614 ?auto_15641 ) ) ( not ( = ?auto_15642 ?auto_15640 ) ) ( not ( = ?auto_15642 ?auto_15638 ) ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15648 ) ) ( not ( = ?auto_15642 ?auto_15652 ) ) ( not ( = ?auto_15637 ?auto_15635 ) ) ( not ( = ?auto_15637 ?auto_15647 ) ) ( not ( = ?auto_15637 ?auto_15628 ) ) ( not ( = ?auto_15637 ?auto_15636 ) ) ( not ( = ?auto_15637 ?auto_15631 ) ) ( not ( = ?auto_15639 ?auto_15629 ) ) ( not ( = ?auto_15639 ?auto_15650 ) ) ( not ( = ?auto_15639 ?auto_15633 ) ) ( not ( = ?auto_15639 ?auto_15644 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15618 ) ) ( not ( = ?auto_15609 ?auto_15645 ) ) ( not ( = ?auto_15610 ?auto_15618 ) ) ( not ( = ?auto_15610 ?auto_15645 ) ) ( not ( = ?auto_15611 ?auto_15618 ) ) ( not ( = ?auto_15611 ?auto_15645 ) ) ( not ( = ?auto_15612 ?auto_15618 ) ) ( not ( = ?auto_15612 ?auto_15645 ) ) ( not ( = ?auto_15613 ?auto_15618 ) ) ( not ( = ?auto_15613 ?auto_15645 ) ) ( not ( = ?auto_15616 ?auto_15618 ) ) ( not ( = ?auto_15616 ?auto_15645 ) ) ( not ( = ?auto_15618 ?auto_15639 ) ) ( not ( = ?auto_15618 ?auto_15629 ) ) ( not ( = ?auto_15618 ?auto_15650 ) ) ( not ( = ?auto_15618 ?auto_15633 ) ) ( not ( = ?auto_15618 ?auto_15644 ) ) ( not ( = ?auto_15618 ?auto_15641 ) ) ( not ( = ?auto_15645 ?auto_15639 ) ) ( not ( = ?auto_15645 ?auto_15629 ) ) ( not ( = ?auto_15645 ?auto_15650 ) ) ( not ( = ?auto_15645 ?auto_15633 ) ) ( not ( = ?auto_15645 ?auto_15644 ) ) ( not ( = ?auto_15645 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15617 ) ) ( not ( = ?auto_15609 ?auto_15627 ) ) ( not ( = ?auto_15610 ?auto_15617 ) ) ( not ( = ?auto_15610 ?auto_15627 ) ) ( not ( = ?auto_15611 ?auto_15617 ) ) ( not ( = ?auto_15611 ?auto_15627 ) ) ( not ( = ?auto_15612 ?auto_15617 ) ) ( not ( = ?auto_15612 ?auto_15627 ) ) ( not ( = ?auto_15613 ?auto_15617 ) ) ( not ( = ?auto_15613 ?auto_15627 ) ) ( not ( = ?auto_15616 ?auto_15617 ) ) ( not ( = ?auto_15616 ?auto_15627 ) ) ( not ( = ?auto_15614 ?auto_15617 ) ) ( not ( = ?auto_15614 ?auto_15627 ) ) ( not ( = ?auto_15617 ?auto_15645 ) ) ( not ( = ?auto_15617 ?auto_15639 ) ) ( not ( = ?auto_15617 ?auto_15629 ) ) ( not ( = ?auto_15617 ?auto_15650 ) ) ( not ( = ?auto_15617 ?auto_15633 ) ) ( not ( = ?auto_15617 ?auto_15644 ) ) ( not ( = ?auto_15617 ?auto_15641 ) ) ( not ( = ?auto_15630 ?auto_15643 ) ) ( not ( = ?auto_15630 ?auto_15642 ) ) ( not ( = ?auto_15630 ?auto_15640 ) ) ( not ( = ?auto_15630 ?auto_15638 ) ) ( not ( = ?auto_15630 ?auto_15648 ) ) ( not ( = ?auto_15630 ?auto_15652 ) ) ( not ( = ?auto_15632 ?auto_15628 ) ) ( not ( = ?auto_15632 ?auto_15637 ) ) ( not ( = ?auto_15632 ?auto_15635 ) ) ( not ( = ?auto_15632 ?auto_15647 ) ) ( not ( = ?auto_15632 ?auto_15636 ) ) ( not ( = ?auto_15632 ?auto_15631 ) ) ( not ( = ?auto_15627 ?auto_15645 ) ) ( not ( = ?auto_15627 ?auto_15639 ) ) ( not ( = ?auto_15627 ?auto_15629 ) ) ( not ( = ?auto_15627 ?auto_15650 ) ) ( not ( = ?auto_15627 ?auto_15633 ) ) ( not ( = ?auto_15627 ?auto_15644 ) ) ( not ( = ?auto_15627 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15615 ) ) ( not ( = ?auto_15609 ?auto_15649 ) ) ( not ( = ?auto_15610 ?auto_15615 ) ) ( not ( = ?auto_15610 ?auto_15649 ) ) ( not ( = ?auto_15611 ?auto_15615 ) ) ( not ( = ?auto_15611 ?auto_15649 ) ) ( not ( = ?auto_15612 ?auto_15615 ) ) ( not ( = ?auto_15612 ?auto_15649 ) ) ( not ( = ?auto_15613 ?auto_15615 ) ) ( not ( = ?auto_15613 ?auto_15649 ) ) ( not ( = ?auto_15616 ?auto_15615 ) ) ( not ( = ?auto_15616 ?auto_15649 ) ) ( not ( = ?auto_15614 ?auto_15615 ) ) ( not ( = ?auto_15614 ?auto_15649 ) ) ( not ( = ?auto_15618 ?auto_15615 ) ) ( not ( = ?auto_15618 ?auto_15649 ) ) ( not ( = ?auto_15615 ?auto_15627 ) ) ( not ( = ?auto_15615 ?auto_15645 ) ) ( not ( = ?auto_15615 ?auto_15639 ) ) ( not ( = ?auto_15615 ?auto_15629 ) ) ( not ( = ?auto_15615 ?auto_15650 ) ) ( not ( = ?auto_15615 ?auto_15633 ) ) ( not ( = ?auto_15615 ?auto_15644 ) ) ( not ( = ?auto_15615 ?auto_15641 ) ) ( not ( = ?auto_15649 ?auto_15627 ) ) ( not ( = ?auto_15649 ?auto_15645 ) ) ( not ( = ?auto_15649 ?auto_15639 ) ) ( not ( = ?auto_15649 ?auto_15629 ) ) ( not ( = ?auto_15649 ?auto_15650 ) ) ( not ( = ?auto_15649 ?auto_15633 ) ) ( not ( = ?auto_15649 ?auto_15644 ) ) ( not ( = ?auto_15649 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15620 ) ) ( not ( = ?auto_15609 ?auto_15646 ) ) ( not ( = ?auto_15610 ?auto_15620 ) ) ( not ( = ?auto_15610 ?auto_15646 ) ) ( not ( = ?auto_15611 ?auto_15620 ) ) ( not ( = ?auto_15611 ?auto_15646 ) ) ( not ( = ?auto_15612 ?auto_15620 ) ) ( not ( = ?auto_15612 ?auto_15646 ) ) ( not ( = ?auto_15613 ?auto_15620 ) ) ( not ( = ?auto_15613 ?auto_15646 ) ) ( not ( = ?auto_15616 ?auto_15620 ) ) ( not ( = ?auto_15616 ?auto_15646 ) ) ( not ( = ?auto_15614 ?auto_15620 ) ) ( not ( = ?auto_15614 ?auto_15646 ) ) ( not ( = ?auto_15618 ?auto_15620 ) ) ( not ( = ?auto_15618 ?auto_15646 ) ) ( not ( = ?auto_15617 ?auto_15620 ) ) ( not ( = ?auto_15617 ?auto_15646 ) ) ( not ( = ?auto_15620 ?auto_15649 ) ) ( not ( = ?auto_15620 ?auto_15627 ) ) ( not ( = ?auto_15620 ?auto_15645 ) ) ( not ( = ?auto_15620 ?auto_15639 ) ) ( not ( = ?auto_15620 ?auto_15629 ) ) ( not ( = ?auto_15620 ?auto_15650 ) ) ( not ( = ?auto_15620 ?auto_15633 ) ) ( not ( = ?auto_15620 ?auto_15644 ) ) ( not ( = ?auto_15620 ?auto_15641 ) ) ( not ( = ?auto_15651 ?auto_15630 ) ) ( not ( = ?auto_15651 ?auto_15643 ) ) ( not ( = ?auto_15651 ?auto_15642 ) ) ( not ( = ?auto_15651 ?auto_15640 ) ) ( not ( = ?auto_15651 ?auto_15638 ) ) ( not ( = ?auto_15651 ?auto_15648 ) ) ( not ( = ?auto_15651 ?auto_15652 ) ) ( not ( = ?auto_15634 ?auto_15632 ) ) ( not ( = ?auto_15634 ?auto_15628 ) ) ( not ( = ?auto_15634 ?auto_15637 ) ) ( not ( = ?auto_15634 ?auto_15635 ) ) ( not ( = ?auto_15634 ?auto_15647 ) ) ( not ( = ?auto_15634 ?auto_15636 ) ) ( not ( = ?auto_15634 ?auto_15631 ) ) ( not ( = ?auto_15646 ?auto_15649 ) ) ( not ( = ?auto_15646 ?auto_15627 ) ) ( not ( = ?auto_15646 ?auto_15645 ) ) ( not ( = ?auto_15646 ?auto_15639 ) ) ( not ( = ?auto_15646 ?auto_15629 ) ) ( not ( = ?auto_15646 ?auto_15650 ) ) ( not ( = ?auto_15646 ?auto_15633 ) ) ( not ( = ?auto_15646 ?auto_15644 ) ) ( not ( = ?auto_15646 ?auto_15641 ) ) ( not ( = ?auto_15609 ?auto_15619 ) ) ( not ( = ?auto_15609 ?auto_15625 ) ) ( not ( = ?auto_15610 ?auto_15619 ) ) ( not ( = ?auto_15610 ?auto_15625 ) ) ( not ( = ?auto_15611 ?auto_15619 ) ) ( not ( = ?auto_15611 ?auto_15625 ) ) ( not ( = ?auto_15612 ?auto_15619 ) ) ( not ( = ?auto_15612 ?auto_15625 ) ) ( not ( = ?auto_15613 ?auto_15619 ) ) ( not ( = ?auto_15613 ?auto_15625 ) ) ( not ( = ?auto_15616 ?auto_15619 ) ) ( not ( = ?auto_15616 ?auto_15625 ) ) ( not ( = ?auto_15614 ?auto_15619 ) ) ( not ( = ?auto_15614 ?auto_15625 ) ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15618 ?auto_15625 ) ) ( not ( = ?auto_15617 ?auto_15619 ) ) ( not ( = ?auto_15617 ?auto_15625 ) ) ( not ( = ?auto_15615 ?auto_15619 ) ) ( not ( = ?auto_15615 ?auto_15625 ) ) ( not ( = ?auto_15619 ?auto_15646 ) ) ( not ( = ?auto_15619 ?auto_15649 ) ) ( not ( = ?auto_15619 ?auto_15627 ) ) ( not ( = ?auto_15619 ?auto_15645 ) ) ( not ( = ?auto_15619 ?auto_15639 ) ) ( not ( = ?auto_15619 ?auto_15629 ) ) ( not ( = ?auto_15619 ?auto_15650 ) ) ( not ( = ?auto_15619 ?auto_15633 ) ) ( not ( = ?auto_15619 ?auto_15644 ) ) ( not ( = ?auto_15619 ?auto_15641 ) ) ( not ( = ?auto_15626 ?auto_15651 ) ) ( not ( = ?auto_15626 ?auto_15630 ) ) ( not ( = ?auto_15626 ?auto_15643 ) ) ( not ( = ?auto_15626 ?auto_15642 ) ) ( not ( = ?auto_15626 ?auto_15640 ) ) ( not ( = ?auto_15626 ?auto_15638 ) ) ( not ( = ?auto_15626 ?auto_15648 ) ) ( not ( = ?auto_15626 ?auto_15652 ) ) ( not ( = ?auto_15622 ?auto_15634 ) ) ( not ( = ?auto_15622 ?auto_15632 ) ) ( not ( = ?auto_15622 ?auto_15628 ) ) ( not ( = ?auto_15622 ?auto_15637 ) ) ( not ( = ?auto_15622 ?auto_15635 ) ) ( not ( = ?auto_15622 ?auto_15647 ) ) ( not ( = ?auto_15622 ?auto_15636 ) ) ( not ( = ?auto_15622 ?auto_15631 ) ) ( not ( = ?auto_15625 ?auto_15646 ) ) ( not ( = ?auto_15625 ?auto_15649 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15625 ?auto_15645 ) ) ( not ( = ?auto_15625 ?auto_15639 ) ) ( not ( = ?auto_15625 ?auto_15629 ) ) ( not ( = ?auto_15625 ?auto_15650 ) ) ( not ( = ?auto_15625 ?auto_15633 ) ) ( not ( = ?auto_15625 ?auto_15644 ) ) ( not ( = ?auto_15625 ?auto_15641 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15609 ?auto_15610 ?auto_15611 ?auto_15612 ?auto_15613 ?auto_15616 ?auto_15614 ?auto_15618 ?auto_15617 ?auto_15615 ?auto_15620 )
      ( MAKE-1CRATE ?auto_15620 ?auto_15619 )
      ( MAKE-11CRATE-VERIFY ?auto_15609 ?auto_15610 ?auto_15611 ?auto_15612 ?auto_15613 ?auto_15616 ?auto_15614 ?auto_15618 ?auto_15617 ?auto_15615 ?auto_15620 ?auto_15619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15655 - SURFACE
      ?auto_15656 - SURFACE
    )
    :vars
    (
      ?auto_15657 - HOIST
      ?auto_15658 - PLACE
      ?auto_15660 - PLACE
      ?auto_15661 - HOIST
      ?auto_15662 - SURFACE
      ?auto_15659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15657 ?auto_15658 ) ( SURFACE-AT ?auto_15655 ?auto_15658 ) ( CLEAR ?auto_15655 ) ( IS-CRATE ?auto_15656 ) ( AVAILABLE ?auto_15657 ) ( not ( = ?auto_15660 ?auto_15658 ) ) ( HOIST-AT ?auto_15661 ?auto_15660 ) ( AVAILABLE ?auto_15661 ) ( SURFACE-AT ?auto_15656 ?auto_15660 ) ( ON ?auto_15656 ?auto_15662 ) ( CLEAR ?auto_15656 ) ( TRUCK-AT ?auto_15659 ?auto_15658 ) ( not ( = ?auto_15655 ?auto_15656 ) ) ( not ( = ?auto_15655 ?auto_15662 ) ) ( not ( = ?auto_15656 ?auto_15662 ) ) ( not ( = ?auto_15657 ?auto_15661 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15659 ?auto_15658 ?auto_15660 )
      ( !LIFT ?auto_15661 ?auto_15656 ?auto_15662 ?auto_15660 )
      ( !LOAD ?auto_15661 ?auto_15656 ?auto_15659 ?auto_15660 )
      ( !DRIVE ?auto_15659 ?auto_15660 ?auto_15658 )
      ( !UNLOAD ?auto_15657 ?auto_15656 ?auto_15659 ?auto_15658 )
      ( !DROP ?auto_15657 ?auto_15656 ?auto_15655 ?auto_15658 )
      ( MAKE-1CRATE-VERIFY ?auto_15655 ?auto_15656 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15676 - SURFACE
      ?auto_15677 - SURFACE
      ?auto_15678 - SURFACE
      ?auto_15679 - SURFACE
      ?auto_15680 - SURFACE
      ?auto_15683 - SURFACE
      ?auto_15681 - SURFACE
      ?auto_15685 - SURFACE
      ?auto_15684 - SURFACE
      ?auto_15682 - SURFACE
      ?auto_15687 - SURFACE
      ?auto_15686 - SURFACE
      ?auto_15688 - SURFACE
    )
    :vars
    (
      ?auto_15694 - HOIST
      ?auto_15689 - PLACE
      ?auto_15690 - PLACE
      ?auto_15692 - HOIST
      ?auto_15691 - SURFACE
      ?auto_15714 - PLACE
      ?auto_15723 - HOIST
      ?auto_15715 - SURFACE
      ?auto_15698 - PLACE
      ?auto_15721 - HOIST
      ?auto_15712 - SURFACE
      ?auto_15701 - PLACE
      ?auto_15713 - HOIST
      ?auto_15703 - SURFACE
      ?auto_15702 - SURFACE
      ?auto_15696 - PLACE
      ?auto_15716 - HOIST
      ?auto_15700 - SURFACE
      ?auto_15699 - PLACE
      ?auto_15708 - HOIST
      ?auto_15720 - SURFACE
      ?auto_15705 - PLACE
      ?auto_15706 - HOIST
      ?auto_15695 - SURFACE
      ?auto_15722 - PLACE
      ?auto_15709 - HOIST
      ?auto_15697 - SURFACE
      ?auto_15717 - SURFACE
      ?auto_15711 - PLACE
      ?auto_15710 - HOIST
      ?auto_15718 - SURFACE
      ?auto_15719 - PLACE
      ?auto_15704 - HOIST
      ?auto_15707 - SURFACE
      ?auto_15693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15694 ?auto_15689 ) ( IS-CRATE ?auto_15688 ) ( not ( = ?auto_15690 ?auto_15689 ) ) ( HOIST-AT ?auto_15692 ?auto_15690 ) ( AVAILABLE ?auto_15692 ) ( SURFACE-AT ?auto_15688 ?auto_15690 ) ( ON ?auto_15688 ?auto_15691 ) ( CLEAR ?auto_15688 ) ( not ( = ?auto_15686 ?auto_15688 ) ) ( not ( = ?auto_15686 ?auto_15691 ) ) ( not ( = ?auto_15688 ?auto_15691 ) ) ( not ( = ?auto_15694 ?auto_15692 ) ) ( IS-CRATE ?auto_15686 ) ( not ( = ?auto_15714 ?auto_15689 ) ) ( HOIST-AT ?auto_15723 ?auto_15714 ) ( AVAILABLE ?auto_15723 ) ( SURFACE-AT ?auto_15686 ?auto_15714 ) ( ON ?auto_15686 ?auto_15715 ) ( CLEAR ?auto_15686 ) ( not ( = ?auto_15687 ?auto_15686 ) ) ( not ( = ?auto_15687 ?auto_15715 ) ) ( not ( = ?auto_15686 ?auto_15715 ) ) ( not ( = ?auto_15694 ?auto_15723 ) ) ( IS-CRATE ?auto_15687 ) ( not ( = ?auto_15698 ?auto_15689 ) ) ( HOIST-AT ?auto_15721 ?auto_15698 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15687 ?auto_15698 ) ( ON ?auto_15687 ?auto_15712 ) ( CLEAR ?auto_15687 ) ( not ( = ?auto_15682 ?auto_15687 ) ) ( not ( = ?auto_15682 ?auto_15712 ) ) ( not ( = ?auto_15687 ?auto_15712 ) ) ( not ( = ?auto_15694 ?auto_15721 ) ) ( IS-CRATE ?auto_15682 ) ( not ( = ?auto_15701 ?auto_15689 ) ) ( HOIST-AT ?auto_15713 ?auto_15701 ) ( SURFACE-AT ?auto_15682 ?auto_15701 ) ( ON ?auto_15682 ?auto_15703 ) ( CLEAR ?auto_15682 ) ( not ( = ?auto_15684 ?auto_15682 ) ) ( not ( = ?auto_15684 ?auto_15703 ) ) ( not ( = ?auto_15682 ?auto_15703 ) ) ( not ( = ?auto_15694 ?auto_15713 ) ) ( IS-CRATE ?auto_15684 ) ( AVAILABLE ?auto_15713 ) ( SURFACE-AT ?auto_15684 ?auto_15701 ) ( ON ?auto_15684 ?auto_15702 ) ( CLEAR ?auto_15684 ) ( not ( = ?auto_15685 ?auto_15684 ) ) ( not ( = ?auto_15685 ?auto_15702 ) ) ( not ( = ?auto_15684 ?auto_15702 ) ) ( IS-CRATE ?auto_15685 ) ( not ( = ?auto_15696 ?auto_15689 ) ) ( HOIST-AT ?auto_15716 ?auto_15696 ) ( SURFACE-AT ?auto_15685 ?auto_15696 ) ( ON ?auto_15685 ?auto_15700 ) ( CLEAR ?auto_15685 ) ( not ( = ?auto_15681 ?auto_15685 ) ) ( not ( = ?auto_15681 ?auto_15700 ) ) ( not ( = ?auto_15685 ?auto_15700 ) ) ( not ( = ?auto_15694 ?auto_15716 ) ) ( IS-CRATE ?auto_15681 ) ( not ( = ?auto_15699 ?auto_15689 ) ) ( HOIST-AT ?auto_15708 ?auto_15699 ) ( AVAILABLE ?auto_15708 ) ( SURFACE-AT ?auto_15681 ?auto_15699 ) ( ON ?auto_15681 ?auto_15720 ) ( CLEAR ?auto_15681 ) ( not ( = ?auto_15683 ?auto_15681 ) ) ( not ( = ?auto_15683 ?auto_15720 ) ) ( not ( = ?auto_15681 ?auto_15720 ) ) ( not ( = ?auto_15694 ?auto_15708 ) ) ( IS-CRATE ?auto_15683 ) ( not ( = ?auto_15705 ?auto_15689 ) ) ( HOIST-AT ?auto_15706 ?auto_15705 ) ( AVAILABLE ?auto_15706 ) ( SURFACE-AT ?auto_15683 ?auto_15705 ) ( ON ?auto_15683 ?auto_15695 ) ( CLEAR ?auto_15683 ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15680 ?auto_15695 ) ) ( not ( = ?auto_15683 ?auto_15695 ) ) ( not ( = ?auto_15694 ?auto_15706 ) ) ( IS-CRATE ?auto_15680 ) ( not ( = ?auto_15722 ?auto_15689 ) ) ( HOIST-AT ?auto_15709 ?auto_15722 ) ( AVAILABLE ?auto_15709 ) ( SURFACE-AT ?auto_15680 ?auto_15722 ) ( ON ?auto_15680 ?auto_15697 ) ( CLEAR ?auto_15680 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15697 ) ) ( not ( = ?auto_15680 ?auto_15697 ) ) ( not ( = ?auto_15694 ?auto_15709 ) ) ( IS-CRATE ?auto_15679 ) ( AVAILABLE ?auto_15716 ) ( SURFACE-AT ?auto_15679 ?auto_15696 ) ( ON ?auto_15679 ?auto_15717 ) ( CLEAR ?auto_15679 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15717 ) ) ( not ( = ?auto_15679 ?auto_15717 ) ) ( IS-CRATE ?auto_15678 ) ( not ( = ?auto_15711 ?auto_15689 ) ) ( HOIST-AT ?auto_15710 ?auto_15711 ) ( AVAILABLE ?auto_15710 ) ( SURFACE-AT ?auto_15678 ?auto_15711 ) ( ON ?auto_15678 ?auto_15718 ) ( CLEAR ?auto_15678 ) ( not ( = ?auto_15677 ?auto_15678 ) ) ( not ( = ?auto_15677 ?auto_15718 ) ) ( not ( = ?auto_15678 ?auto_15718 ) ) ( not ( = ?auto_15694 ?auto_15710 ) ) ( SURFACE-AT ?auto_15676 ?auto_15689 ) ( CLEAR ?auto_15676 ) ( IS-CRATE ?auto_15677 ) ( AVAILABLE ?auto_15694 ) ( not ( = ?auto_15719 ?auto_15689 ) ) ( HOIST-AT ?auto_15704 ?auto_15719 ) ( AVAILABLE ?auto_15704 ) ( SURFACE-AT ?auto_15677 ?auto_15719 ) ( ON ?auto_15677 ?auto_15707 ) ( CLEAR ?auto_15677 ) ( TRUCK-AT ?auto_15693 ?auto_15689 ) ( not ( = ?auto_15676 ?auto_15677 ) ) ( not ( = ?auto_15676 ?auto_15707 ) ) ( not ( = ?auto_15677 ?auto_15707 ) ) ( not ( = ?auto_15694 ?auto_15704 ) ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15676 ?auto_15718 ) ) ( not ( = ?auto_15678 ?auto_15707 ) ) ( not ( = ?auto_15711 ?auto_15719 ) ) ( not ( = ?auto_15710 ?auto_15704 ) ) ( not ( = ?auto_15718 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15679 ) ) ( not ( = ?auto_15676 ?auto_15717 ) ) ( not ( = ?auto_15677 ?auto_15679 ) ) ( not ( = ?auto_15677 ?auto_15717 ) ) ( not ( = ?auto_15679 ?auto_15718 ) ) ( not ( = ?auto_15679 ?auto_15707 ) ) ( not ( = ?auto_15696 ?auto_15711 ) ) ( not ( = ?auto_15696 ?auto_15719 ) ) ( not ( = ?auto_15716 ?auto_15710 ) ) ( not ( = ?auto_15716 ?auto_15704 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15680 ) ) ( not ( = ?auto_15676 ?auto_15697 ) ) ( not ( = ?auto_15677 ?auto_15680 ) ) ( not ( = ?auto_15677 ?auto_15697 ) ) ( not ( = ?auto_15678 ?auto_15680 ) ) ( not ( = ?auto_15678 ?auto_15697 ) ) ( not ( = ?auto_15680 ?auto_15717 ) ) ( not ( = ?auto_15680 ?auto_15718 ) ) ( not ( = ?auto_15680 ?auto_15707 ) ) ( not ( = ?auto_15722 ?auto_15696 ) ) ( not ( = ?auto_15722 ?auto_15711 ) ) ( not ( = ?auto_15722 ?auto_15719 ) ) ( not ( = ?auto_15709 ?auto_15716 ) ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15704 ) ) ( not ( = ?auto_15697 ?auto_15717 ) ) ( not ( = ?auto_15697 ?auto_15718 ) ) ( not ( = ?auto_15697 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15683 ) ) ( not ( = ?auto_15676 ?auto_15695 ) ) ( not ( = ?auto_15677 ?auto_15683 ) ) ( not ( = ?auto_15677 ?auto_15695 ) ) ( not ( = ?auto_15678 ?auto_15683 ) ) ( not ( = ?auto_15678 ?auto_15695 ) ) ( not ( = ?auto_15679 ?auto_15683 ) ) ( not ( = ?auto_15679 ?auto_15695 ) ) ( not ( = ?auto_15683 ?auto_15697 ) ) ( not ( = ?auto_15683 ?auto_15717 ) ) ( not ( = ?auto_15683 ?auto_15718 ) ) ( not ( = ?auto_15683 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15722 ) ) ( not ( = ?auto_15705 ?auto_15696 ) ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( not ( = ?auto_15705 ?auto_15719 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15716 ) ) ( not ( = ?auto_15706 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15704 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15717 ) ) ( not ( = ?auto_15695 ?auto_15718 ) ) ( not ( = ?auto_15695 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15681 ) ) ( not ( = ?auto_15676 ?auto_15720 ) ) ( not ( = ?auto_15677 ?auto_15681 ) ) ( not ( = ?auto_15677 ?auto_15720 ) ) ( not ( = ?auto_15678 ?auto_15681 ) ) ( not ( = ?auto_15678 ?auto_15720 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) ( not ( = ?auto_15679 ?auto_15720 ) ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15720 ) ) ( not ( = ?auto_15681 ?auto_15695 ) ) ( not ( = ?auto_15681 ?auto_15697 ) ) ( not ( = ?auto_15681 ?auto_15717 ) ) ( not ( = ?auto_15681 ?auto_15718 ) ) ( not ( = ?auto_15681 ?auto_15707 ) ) ( not ( = ?auto_15699 ?auto_15705 ) ) ( not ( = ?auto_15699 ?auto_15722 ) ) ( not ( = ?auto_15699 ?auto_15696 ) ) ( not ( = ?auto_15699 ?auto_15711 ) ) ( not ( = ?auto_15699 ?auto_15719 ) ) ( not ( = ?auto_15708 ?auto_15706 ) ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15716 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( not ( = ?auto_15708 ?auto_15704 ) ) ( not ( = ?auto_15720 ?auto_15695 ) ) ( not ( = ?auto_15720 ?auto_15697 ) ) ( not ( = ?auto_15720 ?auto_15717 ) ) ( not ( = ?auto_15720 ?auto_15718 ) ) ( not ( = ?auto_15720 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15685 ) ) ( not ( = ?auto_15676 ?auto_15700 ) ) ( not ( = ?auto_15677 ?auto_15685 ) ) ( not ( = ?auto_15677 ?auto_15700 ) ) ( not ( = ?auto_15678 ?auto_15685 ) ) ( not ( = ?auto_15678 ?auto_15700 ) ) ( not ( = ?auto_15679 ?auto_15685 ) ) ( not ( = ?auto_15679 ?auto_15700 ) ) ( not ( = ?auto_15680 ?auto_15685 ) ) ( not ( = ?auto_15680 ?auto_15700 ) ) ( not ( = ?auto_15683 ?auto_15685 ) ) ( not ( = ?auto_15683 ?auto_15700 ) ) ( not ( = ?auto_15685 ?auto_15720 ) ) ( not ( = ?auto_15685 ?auto_15695 ) ) ( not ( = ?auto_15685 ?auto_15697 ) ) ( not ( = ?auto_15685 ?auto_15717 ) ) ( not ( = ?auto_15685 ?auto_15718 ) ) ( not ( = ?auto_15685 ?auto_15707 ) ) ( not ( = ?auto_15700 ?auto_15720 ) ) ( not ( = ?auto_15700 ?auto_15695 ) ) ( not ( = ?auto_15700 ?auto_15697 ) ) ( not ( = ?auto_15700 ?auto_15717 ) ) ( not ( = ?auto_15700 ?auto_15718 ) ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15684 ) ) ( not ( = ?auto_15676 ?auto_15702 ) ) ( not ( = ?auto_15677 ?auto_15684 ) ) ( not ( = ?auto_15677 ?auto_15702 ) ) ( not ( = ?auto_15678 ?auto_15684 ) ) ( not ( = ?auto_15678 ?auto_15702 ) ) ( not ( = ?auto_15679 ?auto_15684 ) ) ( not ( = ?auto_15679 ?auto_15702 ) ) ( not ( = ?auto_15680 ?auto_15684 ) ) ( not ( = ?auto_15680 ?auto_15702 ) ) ( not ( = ?auto_15683 ?auto_15684 ) ) ( not ( = ?auto_15683 ?auto_15702 ) ) ( not ( = ?auto_15681 ?auto_15684 ) ) ( not ( = ?auto_15681 ?auto_15702 ) ) ( not ( = ?auto_15684 ?auto_15700 ) ) ( not ( = ?auto_15684 ?auto_15720 ) ) ( not ( = ?auto_15684 ?auto_15695 ) ) ( not ( = ?auto_15684 ?auto_15697 ) ) ( not ( = ?auto_15684 ?auto_15717 ) ) ( not ( = ?auto_15684 ?auto_15718 ) ) ( not ( = ?auto_15684 ?auto_15707 ) ) ( not ( = ?auto_15701 ?auto_15696 ) ) ( not ( = ?auto_15701 ?auto_15699 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15722 ) ) ( not ( = ?auto_15701 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15719 ) ) ( not ( = ?auto_15713 ?auto_15716 ) ) ( not ( = ?auto_15713 ?auto_15708 ) ) ( not ( = ?auto_15713 ?auto_15706 ) ) ( not ( = ?auto_15713 ?auto_15709 ) ) ( not ( = ?auto_15713 ?auto_15710 ) ) ( not ( = ?auto_15713 ?auto_15704 ) ) ( not ( = ?auto_15702 ?auto_15700 ) ) ( not ( = ?auto_15702 ?auto_15720 ) ) ( not ( = ?auto_15702 ?auto_15695 ) ) ( not ( = ?auto_15702 ?auto_15697 ) ) ( not ( = ?auto_15702 ?auto_15717 ) ) ( not ( = ?auto_15702 ?auto_15718 ) ) ( not ( = ?auto_15702 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15682 ) ) ( not ( = ?auto_15676 ?auto_15703 ) ) ( not ( = ?auto_15677 ?auto_15682 ) ) ( not ( = ?auto_15677 ?auto_15703 ) ) ( not ( = ?auto_15678 ?auto_15682 ) ) ( not ( = ?auto_15678 ?auto_15703 ) ) ( not ( = ?auto_15679 ?auto_15682 ) ) ( not ( = ?auto_15679 ?auto_15703 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15703 ) ) ( not ( = ?auto_15683 ?auto_15682 ) ) ( not ( = ?auto_15683 ?auto_15703 ) ) ( not ( = ?auto_15681 ?auto_15682 ) ) ( not ( = ?auto_15681 ?auto_15703 ) ) ( not ( = ?auto_15685 ?auto_15682 ) ) ( not ( = ?auto_15685 ?auto_15703 ) ) ( not ( = ?auto_15682 ?auto_15702 ) ) ( not ( = ?auto_15682 ?auto_15700 ) ) ( not ( = ?auto_15682 ?auto_15720 ) ) ( not ( = ?auto_15682 ?auto_15695 ) ) ( not ( = ?auto_15682 ?auto_15697 ) ) ( not ( = ?auto_15682 ?auto_15717 ) ) ( not ( = ?auto_15682 ?auto_15718 ) ) ( not ( = ?auto_15682 ?auto_15707 ) ) ( not ( = ?auto_15703 ?auto_15702 ) ) ( not ( = ?auto_15703 ?auto_15700 ) ) ( not ( = ?auto_15703 ?auto_15720 ) ) ( not ( = ?auto_15703 ?auto_15695 ) ) ( not ( = ?auto_15703 ?auto_15697 ) ) ( not ( = ?auto_15703 ?auto_15717 ) ) ( not ( = ?auto_15703 ?auto_15718 ) ) ( not ( = ?auto_15703 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15687 ) ) ( not ( = ?auto_15676 ?auto_15712 ) ) ( not ( = ?auto_15677 ?auto_15687 ) ) ( not ( = ?auto_15677 ?auto_15712 ) ) ( not ( = ?auto_15678 ?auto_15687 ) ) ( not ( = ?auto_15678 ?auto_15712 ) ) ( not ( = ?auto_15679 ?auto_15687 ) ) ( not ( = ?auto_15679 ?auto_15712 ) ) ( not ( = ?auto_15680 ?auto_15687 ) ) ( not ( = ?auto_15680 ?auto_15712 ) ) ( not ( = ?auto_15683 ?auto_15687 ) ) ( not ( = ?auto_15683 ?auto_15712 ) ) ( not ( = ?auto_15681 ?auto_15687 ) ) ( not ( = ?auto_15681 ?auto_15712 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) ( not ( = ?auto_15685 ?auto_15712 ) ) ( not ( = ?auto_15684 ?auto_15687 ) ) ( not ( = ?auto_15684 ?auto_15712 ) ) ( not ( = ?auto_15687 ?auto_15703 ) ) ( not ( = ?auto_15687 ?auto_15702 ) ) ( not ( = ?auto_15687 ?auto_15700 ) ) ( not ( = ?auto_15687 ?auto_15720 ) ) ( not ( = ?auto_15687 ?auto_15695 ) ) ( not ( = ?auto_15687 ?auto_15697 ) ) ( not ( = ?auto_15687 ?auto_15717 ) ) ( not ( = ?auto_15687 ?auto_15718 ) ) ( not ( = ?auto_15687 ?auto_15707 ) ) ( not ( = ?auto_15698 ?auto_15701 ) ) ( not ( = ?auto_15698 ?auto_15696 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15705 ) ) ( not ( = ?auto_15698 ?auto_15722 ) ) ( not ( = ?auto_15698 ?auto_15711 ) ) ( not ( = ?auto_15698 ?auto_15719 ) ) ( not ( = ?auto_15721 ?auto_15713 ) ) ( not ( = ?auto_15721 ?auto_15716 ) ) ( not ( = ?auto_15721 ?auto_15708 ) ) ( not ( = ?auto_15721 ?auto_15706 ) ) ( not ( = ?auto_15721 ?auto_15709 ) ) ( not ( = ?auto_15721 ?auto_15710 ) ) ( not ( = ?auto_15721 ?auto_15704 ) ) ( not ( = ?auto_15712 ?auto_15703 ) ) ( not ( = ?auto_15712 ?auto_15702 ) ) ( not ( = ?auto_15712 ?auto_15700 ) ) ( not ( = ?auto_15712 ?auto_15720 ) ) ( not ( = ?auto_15712 ?auto_15695 ) ) ( not ( = ?auto_15712 ?auto_15697 ) ) ( not ( = ?auto_15712 ?auto_15717 ) ) ( not ( = ?auto_15712 ?auto_15718 ) ) ( not ( = ?auto_15712 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15686 ) ) ( not ( = ?auto_15676 ?auto_15715 ) ) ( not ( = ?auto_15677 ?auto_15686 ) ) ( not ( = ?auto_15677 ?auto_15715 ) ) ( not ( = ?auto_15678 ?auto_15686 ) ) ( not ( = ?auto_15678 ?auto_15715 ) ) ( not ( = ?auto_15679 ?auto_15686 ) ) ( not ( = ?auto_15679 ?auto_15715 ) ) ( not ( = ?auto_15680 ?auto_15686 ) ) ( not ( = ?auto_15680 ?auto_15715 ) ) ( not ( = ?auto_15683 ?auto_15686 ) ) ( not ( = ?auto_15683 ?auto_15715 ) ) ( not ( = ?auto_15681 ?auto_15686 ) ) ( not ( = ?auto_15681 ?auto_15715 ) ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15685 ?auto_15715 ) ) ( not ( = ?auto_15684 ?auto_15686 ) ) ( not ( = ?auto_15684 ?auto_15715 ) ) ( not ( = ?auto_15682 ?auto_15686 ) ) ( not ( = ?auto_15682 ?auto_15715 ) ) ( not ( = ?auto_15686 ?auto_15712 ) ) ( not ( = ?auto_15686 ?auto_15703 ) ) ( not ( = ?auto_15686 ?auto_15702 ) ) ( not ( = ?auto_15686 ?auto_15700 ) ) ( not ( = ?auto_15686 ?auto_15720 ) ) ( not ( = ?auto_15686 ?auto_15695 ) ) ( not ( = ?auto_15686 ?auto_15697 ) ) ( not ( = ?auto_15686 ?auto_15717 ) ) ( not ( = ?auto_15686 ?auto_15718 ) ) ( not ( = ?auto_15686 ?auto_15707 ) ) ( not ( = ?auto_15714 ?auto_15698 ) ) ( not ( = ?auto_15714 ?auto_15701 ) ) ( not ( = ?auto_15714 ?auto_15696 ) ) ( not ( = ?auto_15714 ?auto_15699 ) ) ( not ( = ?auto_15714 ?auto_15705 ) ) ( not ( = ?auto_15714 ?auto_15722 ) ) ( not ( = ?auto_15714 ?auto_15711 ) ) ( not ( = ?auto_15714 ?auto_15719 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( not ( = ?auto_15723 ?auto_15713 ) ) ( not ( = ?auto_15723 ?auto_15716 ) ) ( not ( = ?auto_15723 ?auto_15708 ) ) ( not ( = ?auto_15723 ?auto_15706 ) ) ( not ( = ?auto_15723 ?auto_15709 ) ) ( not ( = ?auto_15723 ?auto_15710 ) ) ( not ( = ?auto_15723 ?auto_15704 ) ) ( not ( = ?auto_15715 ?auto_15712 ) ) ( not ( = ?auto_15715 ?auto_15703 ) ) ( not ( = ?auto_15715 ?auto_15702 ) ) ( not ( = ?auto_15715 ?auto_15700 ) ) ( not ( = ?auto_15715 ?auto_15720 ) ) ( not ( = ?auto_15715 ?auto_15695 ) ) ( not ( = ?auto_15715 ?auto_15697 ) ) ( not ( = ?auto_15715 ?auto_15717 ) ) ( not ( = ?auto_15715 ?auto_15718 ) ) ( not ( = ?auto_15715 ?auto_15707 ) ) ( not ( = ?auto_15676 ?auto_15688 ) ) ( not ( = ?auto_15676 ?auto_15691 ) ) ( not ( = ?auto_15677 ?auto_15688 ) ) ( not ( = ?auto_15677 ?auto_15691 ) ) ( not ( = ?auto_15678 ?auto_15688 ) ) ( not ( = ?auto_15678 ?auto_15691 ) ) ( not ( = ?auto_15679 ?auto_15688 ) ) ( not ( = ?auto_15679 ?auto_15691 ) ) ( not ( = ?auto_15680 ?auto_15688 ) ) ( not ( = ?auto_15680 ?auto_15691 ) ) ( not ( = ?auto_15683 ?auto_15688 ) ) ( not ( = ?auto_15683 ?auto_15691 ) ) ( not ( = ?auto_15681 ?auto_15688 ) ) ( not ( = ?auto_15681 ?auto_15691 ) ) ( not ( = ?auto_15685 ?auto_15688 ) ) ( not ( = ?auto_15685 ?auto_15691 ) ) ( not ( = ?auto_15684 ?auto_15688 ) ) ( not ( = ?auto_15684 ?auto_15691 ) ) ( not ( = ?auto_15682 ?auto_15688 ) ) ( not ( = ?auto_15682 ?auto_15691 ) ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15691 ) ) ( not ( = ?auto_15688 ?auto_15715 ) ) ( not ( = ?auto_15688 ?auto_15712 ) ) ( not ( = ?auto_15688 ?auto_15703 ) ) ( not ( = ?auto_15688 ?auto_15702 ) ) ( not ( = ?auto_15688 ?auto_15700 ) ) ( not ( = ?auto_15688 ?auto_15720 ) ) ( not ( = ?auto_15688 ?auto_15695 ) ) ( not ( = ?auto_15688 ?auto_15697 ) ) ( not ( = ?auto_15688 ?auto_15717 ) ) ( not ( = ?auto_15688 ?auto_15718 ) ) ( not ( = ?auto_15688 ?auto_15707 ) ) ( not ( = ?auto_15690 ?auto_15714 ) ) ( not ( = ?auto_15690 ?auto_15698 ) ) ( not ( = ?auto_15690 ?auto_15701 ) ) ( not ( = ?auto_15690 ?auto_15696 ) ) ( not ( = ?auto_15690 ?auto_15699 ) ) ( not ( = ?auto_15690 ?auto_15705 ) ) ( not ( = ?auto_15690 ?auto_15722 ) ) ( not ( = ?auto_15690 ?auto_15711 ) ) ( not ( = ?auto_15690 ?auto_15719 ) ) ( not ( = ?auto_15692 ?auto_15723 ) ) ( not ( = ?auto_15692 ?auto_15721 ) ) ( not ( = ?auto_15692 ?auto_15713 ) ) ( not ( = ?auto_15692 ?auto_15716 ) ) ( not ( = ?auto_15692 ?auto_15708 ) ) ( not ( = ?auto_15692 ?auto_15706 ) ) ( not ( = ?auto_15692 ?auto_15709 ) ) ( not ( = ?auto_15692 ?auto_15710 ) ) ( not ( = ?auto_15692 ?auto_15704 ) ) ( not ( = ?auto_15691 ?auto_15715 ) ) ( not ( = ?auto_15691 ?auto_15712 ) ) ( not ( = ?auto_15691 ?auto_15703 ) ) ( not ( = ?auto_15691 ?auto_15702 ) ) ( not ( = ?auto_15691 ?auto_15700 ) ) ( not ( = ?auto_15691 ?auto_15720 ) ) ( not ( = ?auto_15691 ?auto_15695 ) ) ( not ( = ?auto_15691 ?auto_15697 ) ) ( not ( = ?auto_15691 ?auto_15717 ) ) ( not ( = ?auto_15691 ?auto_15718 ) ) ( not ( = ?auto_15691 ?auto_15707 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15683 ?auto_15681 ?auto_15685 ?auto_15684 ?auto_15682 ?auto_15687 ?auto_15686 )
      ( MAKE-1CRATE ?auto_15686 ?auto_15688 )
      ( MAKE-12CRATE-VERIFY ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15683 ?auto_15681 ?auto_15685 ?auto_15684 ?auto_15682 ?auto_15687 ?auto_15686 ?auto_15688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15726 - SURFACE
      ?auto_15727 - SURFACE
    )
    :vars
    (
      ?auto_15728 - HOIST
      ?auto_15729 - PLACE
      ?auto_15731 - PLACE
      ?auto_15732 - HOIST
      ?auto_15733 - SURFACE
      ?auto_15730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15728 ?auto_15729 ) ( SURFACE-AT ?auto_15726 ?auto_15729 ) ( CLEAR ?auto_15726 ) ( IS-CRATE ?auto_15727 ) ( AVAILABLE ?auto_15728 ) ( not ( = ?auto_15731 ?auto_15729 ) ) ( HOIST-AT ?auto_15732 ?auto_15731 ) ( AVAILABLE ?auto_15732 ) ( SURFACE-AT ?auto_15727 ?auto_15731 ) ( ON ?auto_15727 ?auto_15733 ) ( CLEAR ?auto_15727 ) ( TRUCK-AT ?auto_15730 ?auto_15729 ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15733 ) ) ( not ( = ?auto_15727 ?auto_15733 ) ) ( not ( = ?auto_15728 ?auto_15732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15730 ?auto_15729 ?auto_15731 )
      ( !LIFT ?auto_15732 ?auto_15727 ?auto_15733 ?auto_15731 )
      ( !LOAD ?auto_15732 ?auto_15727 ?auto_15730 ?auto_15731 )
      ( !DRIVE ?auto_15730 ?auto_15731 ?auto_15729 )
      ( !UNLOAD ?auto_15728 ?auto_15727 ?auto_15730 ?auto_15729 )
      ( !DROP ?auto_15728 ?auto_15727 ?auto_15726 ?auto_15729 )
      ( MAKE-1CRATE-VERIFY ?auto_15726 ?auto_15727 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15748 - SURFACE
      ?auto_15749 - SURFACE
      ?auto_15750 - SURFACE
      ?auto_15751 - SURFACE
      ?auto_15752 - SURFACE
      ?auto_15755 - SURFACE
      ?auto_15753 - SURFACE
      ?auto_15757 - SURFACE
      ?auto_15756 - SURFACE
      ?auto_15754 - SURFACE
      ?auto_15759 - SURFACE
      ?auto_15758 - SURFACE
      ?auto_15760 - SURFACE
      ?auto_15761 - SURFACE
    )
    :vars
    (
      ?auto_15765 - HOIST
      ?auto_15767 - PLACE
      ?auto_15762 - PLACE
      ?auto_15766 - HOIST
      ?auto_15764 - SURFACE
      ?auto_15792 - SURFACE
      ?auto_15795 - PLACE
      ?auto_15785 - HOIST
      ?auto_15787 - SURFACE
      ?auto_15773 - PLACE
      ?auto_15777 - HOIST
      ?auto_15794 - SURFACE
      ?auto_15778 - PLACE
      ?auto_15783 - HOIST
      ?auto_15788 - SURFACE
      ?auto_15791 - SURFACE
      ?auto_15790 - PLACE
      ?auto_15769 - HOIST
      ?auto_15775 - SURFACE
      ?auto_15784 - PLACE
      ?auto_15770 - HOIST
      ?auto_15768 - SURFACE
      ?auto_15772 - PLACE
      ?auto_15786 - HOIST
      ?auto_15782 - SURFACE
      ?auto_15779 - PLACE
      ?auto_15796 - HOIST
      ?auto_15774 - SURFACE
      ?auto_15797 - SURFACE
      ?auto_15780 - PLACE
      ?auto_15789 - HOIST
      ?auto_15793 - SURFACE
      ?auto_15771 - PLACE
      ?auto_15776 - HOIST
      ?auto_15781 - SURFACE
      ?auto_15763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15765 ?auto_15767 ) ( IS-CRATE ?auto_15761 ) ( not ( = ?auto_15762 ?auto_15767 ) ) ( HOIST-AT ?auto_15766 ?auto_15762 ) ( SURFACE-AT ?auto_15761 ?auto_15762 ) ( ON ?auto_15761 ?auto_15764 ) ( CLEAR ?auto_15761 ) ( not ( = ?auto_15760 ?auto_15761 ) ) ( not ( = ?auto_15760 ?auto_15764 ) ) ( not ( = ?auto_15761 ?auto_15764 ) ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( IS-CRATE ?auto_15760 ) ( AVAILABLE ?auto_15766 ) ( SURFACE-AT ?auto_15760 ?auto_15762 ) ( ON ?auto_15760 ?auto_15792 ) ( CLEAR ?auto_15760 ) ( not ( = ?auto_15758 ?auto_15760 ) ) ( not ( = ?auto_15758 ?auto_15792 ) ) ( not ( = ?auto_15760 ?auto_15792 ) ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15795 ?auto_15767 ) ) ( HOIST-AT ?auto_15785 ?auto_15795 ) ( AVAILABLE ?auto_15785 ) ( SURFACE-AT ?auto_15758 ?auto_15795 ) ( ON ?auto_15758 ?auto_15787 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15759 ?auto_15758 ) ) ( not ( = ?auto_15759 ?auto_15787 ) ) ( not ( = ?auto_15758 ?auto_15787 ) ) ( not ( = ?auto_15765 ?auto_15785 ) ) ( IS-CRATE ?auto_15759 ) ( not ( = ?auto_15773 ?auto_15767 ) ) ( HOIST-AT ?auto_15777 ?auto_15773 ) ( AVAILABLE ?auto_15777 ) ( SURFACE-AT ?auto_15759 ?auto_15773 ) ( ON ?auto_15759 ?auto_15794 ) ( CLEAR ?auto_15759 ) ( not ( = ?auto_15754 ?auto_15759 ) ) ( not ( = ?auto_15754 ?auto_15794 ) ) ( not ( = ?auto_15759 ?auto_15794 ) ) ( not ( = ?auto_15765 ?auto_15777 ) ) ( IS-CRATE ?auto_15754 ) ( not ( = ?auto_15778 ?auto_15767 ) ) ( HOIST-AT ?auto_15783 ?auto_15778 ) ( SURFACE-AT ?auto_15754 ?auto_15778 ) ( ON ?auto_15754 ?auto_15788 ) ( CLEAR ?auto_15754 ) ( not ( = ?auto_15756 ?auto_15754 ) ) ( not ( = ?auto_15756 ?auto_15788 ) ) ( not ( = ?auto_15754 ?auto_15788 ) ) ( not ( = ?auto_15765 ?auto_15783 ) ) ( IS-CRATE ?auto_15756 ) ( AVAILABLE ?auto_15783 ) ( SURFACE-AT ?auto_15756 ?auto_15778 ) ( ON ?auto_15756 ?auto_15791 ) ( CLEAR ?auto_15756 ) ( not ( = ?auto_15757 ?auto_15756 ) ) ( not ( = ?auto_15757 ?auto_15791 ) ) ( not ( = ?auto_15756 ?auto_15791 ) ) ( IS-CRATE ?auto_15757 ) ( not ( = ?auto_15790 ?auto_15767 ) ) ( HOIST-AT ?auto_15769 ?auto_15790 ) ( SURFACE-AT ?auto_15757 ?auto_15790 ) ( ON ?auto_15757 ?auto_15775 ) ( CLEAR ?auto_15757 ) ( not ( = ?auto_15753 ?auto_15757 ) ) ( not ( = ?auto_15753 ?auto_15775 ) ) ( not ( = ?auto_15757 ?auto_15775 ) ) ( not ( = ?auto_15765 ?auto_15769 ) ) ( IS-CRATE ?auto_15753 ) ( not ( = ?auto_15784 ?auto_15767 ) ) ( HOIST-AT ?auto_15770 ?auto_15784 ) ( AVAILABLE ?auto_15770 ) ( SURFACE-AT ?auto_15753 ?auto_15784 ) ( ON ?auto_15753 ?auto_15768 ) ( CLEAR ?auto_15753 ) ( not ( = ?auto_15755 ?auto_15753 ) ) ( not ( = ?auto_15755 ?auto_15768 ) ) ( not ( = ?auto_15753 ?auto_15768 ) ) ( not ( = ?auto_15765 ?auto_15770 ) ) ( IS-CRATE ?auto_15755 ) ( not ( = ?auto_15772 ?auto_15767 ) ) ( HOIST-AT ?auto_15786 ?auto_15772 ) ( AVAILABLE ?auto_15786 ) ( SURFACE-AT ?auto_15755 ?auto_15772 ) ( ON ?auto_15755 ?auto_15782 ) ( CLEAR ?auto_15755 ) ( not ( = ?auto_15752 ?auto_15755 ) ) ( not ( = ?auto_15752 ?auto_15782 ) ) ( not ( = ?auto_15755 ?auto_15782 ) ) ( not ( = ?auto_15765 ?auto_15786 ) ) ( IS-CRATE ?auto_15752 ) ( not ( = ?auto_15779 ?auto_15767 ) ) ( HOIST-AT ?auto_15796 ?auto_15779 ) ( AVAILABLE ?auto_15796 ) ( SURFACE-AT ?auto_15752 ?auto_15779 ) ( ON ?auto_15752 ?auto_15774 ) ( CLEAR ?auto_15752 ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( not ( = ?auto_15751 ?auto_15774 ) ) ( not ( = ?auto_15752 ?auto_15774 ) ) ( not ( = ?auto_15765 ?auto_15796 ) ) ( IS-CRATE ?auto_15751 ) ( AVAILABLE ?auto_15769 ) ( SURFACE-AT ?auto_15751 ?auto_15790 ) ( ON ?auto_15751 ?auto_15797 ) ( CLEAR ?auto_15751 ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( not ( = ?auto_15750 ?auto_15797 ) ) ( not ( = ?auto_15751 ?auto_15797 ) ) ( IS-CRATE ?auto_15750 ) ( not ( = ?auto_15780 ?auto_15767 ) ) ( HOIST-AT ?auto_15789 ?auto_15780 ) ( AVAILABLE ?auto_15789 ) ( SURFACE-AT ?auto_15750 ?auto_15780 ) ( ON ?auto_15750 ?auto_15793 ) ( CLEAR ?auto_15750 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( not ( = ?auto_15749 ?auto_15793 ) ) ( not ( = ?auto_15750 ?auto_15793 ) ) ( not ( = ?auto_15765 ?auto_15789 ) ) ( SURFACE-AT ?auto_15748 ?auto_15767 ) ( CLEAR ?auto_15748 ) ( IS-CRATE ?auto_15749 ) ( AVAILABLE ?auto_15765 ) ( not ( = ?auto_15771 ?auto_15767 ) ) ( HOIST-AT ?auto_15776 ?auto_15771 ) ( AVAILABLE ?auto_15776 ) ( SURFACE-AT ?auto_15749 ?auto_15771 ) ( ON ?auto_15749 ?auto_15781 ) ( CLEAR ?auto_15749 ) ( TRUCK-AT ?auto_15763 ?auto_15767 ) ( not ( = ?auto_15748 ?auto_15749 ) ) ( not ( = ?auto_15748 ?auto_15781 ) ) ( not ( = ?auto_15749 ?auto_15781 ) ) ( not ( = ?auto_15765 ?auto_15776 ) ) ( not ( = ?auto_15748 ?auto_15750 ) ) ( not ( = ?auto_15748 ?auto_15793 ) ) ( not ( = ?auto_15750 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15771 ) ) ( not ( = ?auto_15789 ?auto_15776 ) ) ( not ( = ?auto_15793 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15751 ) ) ( not ( = ?auto_15748 ?auto_15797 ) ) ( not ( = ?auto_15749 ?auto_15751 ) ) ( not ( = ?auto_15749 ?auto_15797 ) ) ( not ( = ?auto_15751 ?auto_15793 ) ) ( not ( = ?auto_15751 ?auto_15781 ) ) ( not ( = ?auto_15790 ?auto_15780 ) ) ( not ( = ?auto_15790 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15789 ) ) ( not ( = ?auto_15769 ?auto_15776 ) ) ( not ( = ?auto_15797 ?auto_15793 ) ) ( not ( = ?auto_15797 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15752 ) ) ( not ( = ?auto_15748 ?auto_15774 ) ) ( not ( = ?auto_15749 ?auto_15752 ) ) ( not ( = ?auto_15749 ?auto_15774 ) ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15750 ?auto_15774 ) ) ( not ( = ?auto_15752 ?auto_15797 ) ) ( not ( = ?auto_15752 ?auto_15793 ) ) ( not ( = ?auto_15752 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15790 ) ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15771 ) ) ( not ( = ?auto_15796 ?auto_15769 ) ) ( not ( = ?auto_15796 ?auto_15789 ) ) ( not ( = ?auto_15796 ?auto_15776 ) ) ( not ( = ?auto_15774 ?auto_15797 ) ) ( not ( = ?auto_15774 ?auto_15793 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15755 ) ) ( not ( = ?auto_15748 ?auto_15782 ) ) ( not ( = ?auto_15749 ?auto_15755 ) ) ( not ( = ?auto_15749 ?auto_15782 ) ) ( not ( = ?auto_15750 ?auto_15755 ) ) ( not ( = ?auto_15750 ?auto_15782 ) ) ( not ( = ?auto_15751 ?auto_15755 ) ) ( not ( = ?auto_15751 ?auto_15782 ) ) ( not ( = ?auto_15755 ?auto_15774 ) ) ( not ( = ?auto_15755 ?auto_15797 ) ) ( not ( = ?auto_15755 ?auto_15793 ) ) ( not ( = ?auto_15755 ?auto_15781 ) ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15772 ?auto_15790 ) ) ( not ( = ?auto_15772 ?auto_15780 ) ) ( not ( = ?auto_15772 ?auto_15771 ) ) ( not ( = ?auto_15786 ?auto_15796 ) ) ( not ( = ?auto_15786 ?auto_15769 ) ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15786 ?auto_15776 ) ) ( not ( = ?auto_15782 ?auto_15774 ) ) ( not ( = ?auto_15782 ?auto_15797 ) ) ( not ( = ?auto_15782 ?auto_15793 ) ) ( not ( = ?auto_15782 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15753 ) ) ( not ( = ?auto_15748 ?auto_15768 ) ) ( not ( = ?auto_15749 ?auto_15753 ) ) ( not ( = ?auto_15749 ?auto_15768 ) ) ( not ( = ?auto_15750 ?auto_15753 ) ) ( not ( = ?auto_15750 ?auto_15768 ) ) ( not ( = ?auto_15751 ?auto_15753 ) ) ( not ( = ?auto_15751 ?auto_15768 ) ) ( not ( = ?auto_15752 ?auto_15753 ) ) ( not ( = ?auto_15752 ?auto_15768 ) ) ( not ( = ?auto_15753 ?auto_15782 ) ) ( not ( = ?auto_15753 ?auto_15774 ) ) ( not ( = ?auto_15753 ?auto_15797 ) ) ( not ( = ?auto_15753 ?auto_15793 ) ) ( not ( = ?auto_15753 ?auto_15781 ) ) ( not ( = ?auto_15784 ?auto_15772 ) ) ( not ( = ?auto_15784 ?auto_15779 ) ) ( not ( = ?auto_15784 ?auto_15790 ) ) ( not ( = ?auto_15784 ?auto_15780 ) ) ( not ( = ?auto_15784 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15786 ) ) ( not ( = ?auto_15770 ?auto_15796 ) ) ( not ( = ?auto_15770 ?auto_15769 ) ) ( not ( = ?auto_15770 ?auto_15789 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( not ( = ?auto_15768 ?auto_15782 ) ) ( not ( = ?auto_15768 ?auto_15774 ) ) ( not ( = ?auto_15768 ?auto_15797 ) ) ( not ( = ?auto_15768 ?auto_15793 ) ) ( not ( = ?auto_15768 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15757 ) ) ( not ( = ?auto_15748 ?auto_15775 ) ) ( not ( = ?auto_15749 ?auto_15757 ) ) ( not ( = ?auto_15749 ?auto_15775 ) ) ( not ( = ?auto_15750 ?auto_15757 ) ) ( not ( = ?auto_15750 ?auto_15775 ) ) ( not ( = ?auto_15751 ?auto_15757 ) ) ( not ( = ?auto_15751 ?auto_15775 ) ) ( not ( = ?auto_15752 ?auto_15757 ) ) ( not ( = ?auto_15752 ?auto_15775 ) ) ( not ( = ?auto_15755 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15775 ) ) ( not ( = ?auto_15757 ?auto_15768 ) ) ( not ( = ?auto_15757 ?auto_15782 ) ) ( not ( = ?auto_15757 ?auto_15774 ) ) ( not ( = ?auto_15757 ?auto_15797 ) ) ( not ( = ?auto_15757 ?auto_15793 ) ) ( not ( = ?auto_15757 ?auto_15781 ) ) ( not ( = ?auto_15775 ?auto_15768 ) ) ( not ( = ?auto_15775 ?auto_15782 ) ) ( not ( = ?auto_15775 ?auto_15774 ) ) ( not ( = ?auto_15775 ?auto_15797 ) ) ( not ( = ?auto_15775 ?auto_15793 ) ) ( not ( = ?auto_15775 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15756 ) ) ( not ( = ?auto_15748 ?auto_15791 ) ) ( not ( = ?auto_15749 ?auto_15756 ) ) ( not ( = ?auto_15749 ?auto_15791 ) ) ( not ( = ?auto_15750 ?auto_15756 ) ) ( not ( = ?auto_15750 ?auto_15791 ) ) ( not ( = ?auto_15751 ?auto_15756 ) ) ( not ( = ?auto_15751 ?auto_15791 ) ) ( not ( = ?auto_15752 ?auto_15756 ) ) ( not ( = ?auto_15752 ?auto_15791 ) ) ( not ( = ?auto_15755 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15791 ) ) ( not ( = ?auto_15753 ?auto_15756 ) ) ( not ( = ?auto_15753 ?auto_15791 ) ) ( not ( = ?auto_15756 ?auto_15775 ) ) ( not ( = ?auto_15756 ?auto_15768 ) ) ( not ( = ?auto_15756 ?auto_15782 ) ) ( not ( = ?auto_15756 ?auto_15774 ) ) ( not ( = ?auto_15756 ?auto_15797 ) ) ( not ( = ?auto_15756 ?auto_15793 ) ) ( not ( = ?auto_15756 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15790 ) ) ( not ( = ?auto_15778 ?auto_15784 ) ) ( not ( = ?auto_15778 ?auto_15772 ) ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15771 ) ) ( not ( = ?auto_15783 ?auto_15769 ) ) ( not ( = ?auto_15783 ?auto_15770 ) ) ( not ( = ?auto_15783 ?auto_15786 ) ) ( not ( = ?auto_15783 ?auto_15796 ) ) ( not ( = ?auto_15783 ?auto_15789 ) ) ( not ( = ?auto_15783 ?auto_15776 ) ) ( not ( = ?auto_15791 ?auto_15775 ) ) ( not ( = ?auto_15791 ?auto_15768 ) ) ( not ( = ?auto_15791 ?auto_15782 ) ) ( not ( = ?auto_15791 ?auto_15774 ) ) ( not ( = ?auto_15791 ?auto_15797 ) ) ( not ( = ?auto_15791 ?auto_15793 ) ) ( not ( = ?auto_15791 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15754 ) ) ( not ( = ?auto_15748 ?auto_15788 ) ) ( not ( = ?auto_15749 ?auto_15754 ) ) ( not ( = ?auto_15749 ?auto_15788 ) ) ( not ( = ?auto_15750 ?auto_15754 ) ) ( not ( = ?auto_15750 ?auto_15788 ) ) ( not ( = ?auto_15751 ?auto_15754 ) ) ( not ( = ?auto_15751 ?auto_15788 ) ) ( not ( = ?auto_15752 ?auto_15754 ) ) ( not ( = ?auto_15752 ?auto_15788 ) ) ( not ( = ?auto_15755 ?auto_15754 ) ) ( not ( = ?auto_15755 ?auto_15788 ) ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( not ( = ?auto_15753 ?auto_15788 ) ) ( not ( = ?auto_15757 ?auto_15754 ) ) ( not ( = ?auto_15757 ?auto_15788 ) ) ( not ( = ?auto_15754 ?auto_15791 ) ) ( not ( = ?auto_15754 ?auto_15775 ) ) ( not ( = ?auto_15754 ?auto_15768 ) ) ( not ( = ?auto_15754 ?auto_15782 ) ) ( not ( = ?auto_15754 ?auto_15774 ) ) ( not ( = ?auto_15754 ?auto_15797 ) ) ( not ( = ?auto_15754 ?auto_15793 ) ) ( not ( = ?auto_15754 ?auto_15781 ) ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( not ( = ?auto_15788 ?auto_15775 ) ) ( not ( = ?auto_15788 ?auto_15768 ) ) ( not ( = ?auto_15788 ?auto_15782 ) ) ( not ( = ?auto_15788 ?auto_15774 ) ) ( not ( = ?auto_15788 ?auto_15797 ) ) ( not ( = ?auto_15788 ?auto_15793 ) ) ( not ( = ?auto_15788 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15759 ) ) ( not ( = ?auto_15748 ?auto_15794 ) ) ( not ( = ?auto_15749 ?auto_15759 ) ) ( not ( = ?auto_15749 ?auto_15794 ) ) ( not ( = ?auto_15750 ?auto_15759 ) ) ( not ( = ?auto_15750 ?auto_15794 ) ) ( not ( = ?auto_15751 ?auto_15759 ) ) ( not ( = ?auto_15751 ?auto_15794 ) ) ( not ( = ?auto_15752 ?auto_15759 ) ) ( not ( = ?auto_15752 ?auto_15794 ) ) ( not ( = ?auto_15755 ?auto_15759 ) ) ( not ( = ?auto_15755 ?auto_15794 ) ) ( not ( = ?auto_15753 ?auto_15759 ) ) ( not ( = ?auto_15753 ?auto_15794 ) ) ( not ( = ?auto_15757 ?auto_15759 ) ) ( not ( = ?auto_15757 ?auto_15794 ) ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( not ( = ?auto_15756 ?auto_15794 ) ) ( not ( = ?auto_15759 ?auto_15788 ) ) ( not ( = ?auto_15759 ?auto_15791 ) ) ( not ( = ?auto_15759 ?auto_15775 ) ) ( not ( = ?auto_15759 ?auto_15768 ) ) ( not ( = ?auto_15759 ?auto_15782 ) ) ( not ( = ?auto_15759 ?auto_15774 ) ) ( not ( = ?auto_15759 ?auto_15797 ) ) ( not ( = ?auto_15759 ?auto_15793 ) ) ( not ( = ?auto_15759 ?auto_15781 ) ) ( not ( = ?auto_15773 ?auto_15778 ) ) ( not ( = ?auto_15773 ?auto_15790 ) ) ( not ( = ?auto_15773 ?auto_15784 ) ) ( not ( = ?auto_15773 ?auto_15772 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( not ( = ?auto_15773 ?auto_15780 ) ) ( not ( = ?auto_15773 ?auto_15771 ) ) ( not ( = ?auto_15777 ?auto_15783 ) ) ( not ( = ?auto_15777 ?auto_15769 ) ) ( not ( = ?auto_15777 ?auto_15770 ) ) ( not ( = ?auto_15777 ?auto_15786 ) ) ( not ( = ?auto_15777 ?auto_15796 ) ) ( not ( = ?auto_15777 ?auto_15789 ) ) ( not ( = ?auto_15777 ?auto_15776 ) ) ( not ( = ?auto_15794 ?auto_15788 ) ) ( not ( = ?auto_15794 ?auto_15791 ) ) ( not ( = ?auto_15794 ?auto_15775 ) ) ( not ( = ?auto_15794 ?auto_15768 ) ) ( not ( = ?auto_15794 ?auto_15782 ) ) ( not ( = ?auto_15794 ?auto_15774 ) ) ( not ( = ?auto_15794 ?auto_15797 ) ) ( not ( = ?auto_15794 ?auto_15793 ) ) ( not ( = ?auto_15794 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15758 ) ) ( not ( = ?auto_15748 ?auto_15787 ) ) ( not ( = ?auto_15749 ?auto_15758 ) ) ( not ( = ?auto_15749 ?auto_15787 ) ) ( not ( = ?auto_15750 ?auto_15758 ) ) ( not ( = ?auto_15750 ?auto_15787 ) ) ( not ( = ?auto_15751 ?auto_15758 ) ) ( not ( = ?auto_15751 ?auto_15787 ) ) ( not ( = ?auto_15752 ?auto_15758 ) ) ( not ( = ?auto_15752 ?auto_15787 ) ) ( not ( = ?auto_15755 ?auto_15758 ) ) ( not ( = ?auto_15755 ?auto_15787 ) ) ( not ( = ?auto_15753 ?auto_15758 ) ) ( not ( = ?auto_15753 ?auto_15787 ) ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15787 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15787 ) ) ( not ( = ?auto_15754 ?auto_15758 ) ) ( not ( = ?auto_15754 ?auto_15787 ) ) ( not ( = ?auto_15758 ?auto_15794 ) ) ( not ( = ?auto_15758 ?auto_15788 ) ) ( not ( = ?auto_15758 ?auto_15791 ) ) ( not ( = ?auto_15758 ?auto_15775 ) ) ( not ( = ?auto_15758 ?auto_15768 ) ) ( not ( = ?auto_15758 ?auto_15782 ) ) ( not ( = ?auto_15758 ?auto_15774 ) ) ( not ( = ?auto_15758 ?auto_15797 ) ) ( not ( = ?auto_15758 ?auto_15793 ) ) ( not ( = ?auto_15758 ?auto_15781 ) ) ( not ( = ?auto_15795 ?auto_15773 ) ) ( not ( = ?auto_15795 ?auto_15778 ) ) ( not ( = ?auto_15795 ?auto_15790 ) ) ( not ( = ?auto_15795 ?auto_15784 ) ) ( not ( = ?auto_15795 ?auto_15772 ) ) ( not ( = ?auto_15795 ?auto_15779 ) ) ( not ( = ?auto_15795 ?auto_15780 ) ) ( not ( = ?auto_15795 ?auto_15771 ) ) ( not ( = ?auto_15785 ?auto_15777 ) ) ( not ( = ?auto_15785 ?auto_15783 ) ) ( not ( = ?auto_15785 ?auto_15769 ) ) ( not ( = ?auto_15785 ?auto_15770 ) ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15796 ) ) ( not ( = ?auto_15785 ?auto_15789 ) ) ( not ( = ?auto_15785 ?auto_15776 ) ) ( not ( = ?auto_15787 ?auto_15794 ) ) ( not ( = ?auto_15787 ?auto_15788 ) ) ( not ( = ?auto_15787 ?auto_15791 ) ) ( not ( = ?auto_15787 ?auto_15775 ) ) ( not ( = ?auto_15787 ?auto_15768 ) ) ( not ( = ?auto_15787 ?auto_15782 ) ) ( not ( = ?auto_15787 ?auto_15774 ) ) ( not ( = ?auto_15787 ?auto_15797 ) ) ( not ( = ?auto_15787 ?auto_15793 ) ) ( not ( = ?auto_15787 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15760 ) ) ( not ( = ?auto_15748 ?auto_15792 ) ) ( not ( = ?auto_15749 ?auto_15760 ) ) ( not ( = ?auto_15749 ?auto_15792 ) ) ( not ( = ?auto_15750 ?auto_15760 ) ) ( not ( = ?auto_15750 ?auto_15792 ) ) ( not ( = ?auto_15751 ?auto_15760 ) ) ( not ( = ?auto_15751 ?auto_15792 ) ) ( not ( = ?auto_15752 ?auto_15760 ) ) ( not ( = ?auto_15752 ?auto_15792 ) ) ( not ( = ?auto_15755 ?auto_15760 ) ) ( not ( = ?auto_15755 ?auto_15792 ) ) ( not ( = ?auto_15753 ?auto_15760 ) ) ( not ( = ?auto_15753 ?auto_15792 ) ) ( not ( = ?auto_15757 ?auto_15760 ) ) ( not ( = ?auto_15757 ?auto_15792 ) ) ( not ( = ?auto_15756 ?auto_15760 ) ) ( not ( = ?auto_15756 ?auto_15792 ) ) ( not ( = ?auto_15754 ?auto_15760 ) ) ( not ( = ?auto_15754 ?auto_15792 ) ) ( not ( = ?auto_15759 ?auto_15760 ) ) ( not ( = ?auto_15759 ?auto_15792 ) ) ( not ( = ?auto_15760 ?auto_15787 ) ) ( not ( = ?auto_15760 ?auto_15794 ) ) ( not ( = ?auto_15760 ?auto_15788 ) ) ( not ( = ?auto_15760 ?auto_15791 ) ) ( not ( = ?auto_15760 ?auto_15775 ) ) ( not ( = ?auto_15760 ?auto_15768 ) ) ( not ( = ?auto_15760 ?auto_15782 ) ) ( not ( = ?auto_15760 ?auto_15774 ) ) ( not ( = ?auto_15760 ?auto_15797 ) ) ( not ( = ?auto_15760 ?auto_15793 ) ) ( not ( = ?auto_15760 ?auto_15781 ) ) ( not ( = ?auto_15762 ?auto_15795 ) ) ( not ( = ?auto_15762 ?auto_15773 ) ) ( not ( = ?auto_15762 ?auto_15778 ) ) ( not ( = ?auto_15762 ?auto_15790 ) ) ( not ( = ?auto_15762 ?auto_15784 ) ) ( not ( = ?auto_15762 ?auto_15772 ) ) ( not ( = ?auto_15762 ?auto_15779 ) ) ( not ( = ?auto_15762 ?auto_15780 ) ) ( not ( = ?auto_15762 ?auto_15771 ) ) ( not ( = ?auto_15766 ?auto_15785 ) ) ( not ( = ?auto_15766 ?auto_15777 ) ) ( not ( = ?auto_15766 ?auto_15783 ) ) ( not ( = ?auto_15766 ?auto_15769 ) ) ( not ( = ?auto_15766 ?auto_15770 ) ) ( not ( = ?auto_15766 ?auto_15786 ) ) ( not ( = ?auto_15766 ?auto_15796 ) ) ( not ( = ?auto_15766 ?auto_15789 ) ) ( not ( = ?auto_15766 ?auto_15776 ) ) ( not ( = ?auto_15792 ?auto_15787 ) ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15792 ?auto_15788 ) ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( not ( = ?auto_15792 ?auto_15775 ) ) ( not ( = ?auto_15792 ?auto_15768 ) ) ( not ( = ?auto_15792 ?auto_15782 ) ) ( not ( = ?auto_15792 ?auto_15774 ) ) ( not ( = ?auto_15792 ?auto_15797 ) ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15792 ?auto_15781 ) ) ( not ( = ?auto_15748 ?auto_15761 ) ) ( not ( = ?auto_15748 ?auto_15764 ) ) ( not ( = ?auto_15749 ?auto_15761 ) ) ( not ( = ?auto_15749 ?auto_15764 ) ) ( not ( = ?auto_15750 ?auto_15761 ) ) ( not ( = ?auto_15750 ?auto_15764 ) ) ( not ( = ?auto_15751 ?auto_15761 ) ) ( not ( = ?auto_15751 ?auto_15764 ) ) ( not ( = ?auto_15752 ?auto_15761 ) ) ( not ( = ?auto_15752 ?auto_15764 ) ) ( not ( = ?auto_15755 ?auto_15761 ) ) ( not ( = ?auto_15755 ?auto_15764 ) ) ( not ( = ?auto_15753 ?auto_15761 ) ) ( not ( = ?auto_15753 ?auto_15764 ) ) ( not ( = ?auto_15757 ?auto_15761 ) ) ( not ( = ?auto_15757 ?auto_15764 ) ) ( not ( = ?auto_15756 ?auto_15761 ) ) ( not ( = ?auto_15756 ?auto_15764 ) ) ( not ( = ?auto_15754 ?auto_15761 ) ) ( not ( = ?auto_15754 ?auto_15764 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15764 ) ) ( not ( = ?auto_15758 ?auto_15761 ) ) ( not ( = ?auto_15758 ?auto_15764 ) ) ( not ( = ?auto_15761 ?auto_15792 ) ) ( not ( = ?auto_15761 ?auto_15787 ) ) ( not ( = ?auto_15761 ?auto_15794 ) ) ( not ( = ?auto_15761 ?auto_15788 ) ) ( not ( = ?auto_15761 ?auto_15791 ) ) ( not ( = ?auto_15761 ?auto_15775 ) ) ( not ( = ?auto_15761 ?auto_15768 ) ) ( not ( = ?auto_15761 ?auto_15782 ) ) ( not ( = ?auto_15761 ?auto_15774 ) ) ( not ( = ?auto_15761 ?auto_15797 ) ) ( not ( = ?auto_15761 ?auto_15793 ) ) ( not ( = ?auto_15761 ?auto_15781 ) ) ( not ( = ?auto_15764 ?auto_15792 ) ) ( not ( = ?auto_15764 ?auto_15787 ) ) ( not ( = ?auto_15764 ?auto_15794 ) ) ( not ( = ?auto_15764 ?auto_15788 ) ) ( not ( = ?auto_15764 ?auto_15791 ) ) ( not ( = ?auto_15764 ?auto_15775 ) ) ( not ( = ?auto_15764 ?auto_15768 ) ) ( not ( = ?auto_15764 ?auto_15782 ) ) ( not ( = ?auto_15764 ?auto_15774 ) ) ( not ( = ?auto_15764 ?auto_15797 ) ) ( not ( = ?auto_15764 ?auto_15793 ) ) ( not ( = ?auto_15764 ?auto_15781 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15748 ?auto_15749 ?auto_15750 ?auto_15751 ?auto_15752 ?auto_15755 ?auto_15753 ?auto_15757 ?auto_15756 ?auto_15754 ?auto_15759 ?auto_15758 ?auto_15760 )
      ( MAKE-1CRATE ?auto_15760 ?auto_15761 )
      ( MAKE-13CRATE-VERIFY ?auto_15748 ?auto_15749 ?auto_15750 ?auto_15751 ?auto_15752 ?auto_15755 ?auto_15753 ?auto_15757 ?auto_15756 ?auto_15754 ?auto_15759 ?auto_15758 ?auto_15760 ?auto_15761 ) )
  )

)

