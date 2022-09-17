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
      ?auto_7213 - SURFACE
      ?auto_7214 - SURFACE
    )
    :vars
    (
      ?auto_7215 - HOIST
      ?auto_7216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7215 ?auto_7216 ) ( SURFACE-AT ?auto_7214 ?auto_7216 ) ( CLEAR ?auto_7214 ) ( LIFTING ?auto_7215 ?auto_7213 ) ( IS-CRATE ?auto_7213 ) ( not ( = ?auto_7213 ?auto_7214 ) ) )
    :subtasks
    ( ( !DROP ?auto_7215 ?auto_7213 ?auto_7214 ?auto_7216 )
      ( MAKE-ON-VERIFY ?auto_7213 ?auto_7214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7217 - SURFACE
      ?auto_7218 - SURFACE
    )
    :vars
    (
      ?auto_7219 - HOIST
      ?auto_7220 - PLACE
      ?auto_7221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7219 ?auto_7220 ) ( SURFACE-AT ?auto_7218 ?auto_7220 ) ( CLEAR ?auto_7218 ) ( IS-CRATE ?auto_7217 ) ( not ( = ?auto_7217 ?auto_7218 ) ) ( TRUCK-AT ?auto_7221 ?auto_7220 ) ( AVAILABLE ?auto_7219 ) ( IN ?auto_7217 ?auto_7221 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7219 ?auto_7217 ?auto_7221 ?auto_7220 )
      ( MAKE-ON ?auto_7217 ?auto_7218 )
      ( MAKE-ON-VERIFY ?auto_7217 ?auto_7218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7222 - SURFACE
      ?auto_7223 - SURFACE
    )
    :vars
    (
      ?auto_7226 - HOIST
      ?auto_7225 - PLACE
      ?auto_7224 - TRUCK
      ?auto_7227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7226 ?auto_7225 ) ( SURFACE-AT ?auto_7223 ?auto_7225 ) ( CLEAR ?auto_7223 ) ( IS-CRATE ?auto_7222 ) ( not ( = ?auto_7222 ?auto_7223 ) ) ( AVAILABLE ?auto_7226 ) ( IN ?auto_7222 ?auto_7224 ) ( TRUCK-AT ?auto_7224 ?auto_7227 ) ( not ( = ?auto_7227 ?auto_7225 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7224 ?auto_7227 ?auto_7225 )
      ( MAKE-ON ?auto_7222 ?auto_7223 )
      ( MAKE-ON-VERIFY ?auto_7222 ?auto_7223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7228 - SURFACE
      ?auto_7229 - SURFACE
    )
    :vars
    (
      ?auto_7232 - HOIST
      ?auto_7231 - PLACE
      ?auto_7233 - TRUCK
      ?auto_7230 - PLACE
      ?auto_7234 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7232 ?auto_7231 ) ( SURFACE-AT ?auto_7229 ?auto_7231 ) ( CLEAR ?auto_7229 ) ( IS-CRATE ?auto_7228 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( AVAILABLE ?auto_7232 ) ( TRUCK-AT ?auto_7233 ?auto_7230 ) ( not ( = ?auto_7230 ?auto_7231 ) ) ( HOIST-AT ?auto_7234 ?auto_7230 ) ( LIFTING ?auto_7234 ?auto_7228 ) ( not ( = ?auto_7232 ?auto_7234 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7234 ?auto_7228 ?auto_7233 ?auto_7230 )
      ( MAKE-ON ?auto_7228 ?auto_7229 )
      ( MAKE-ON-VERIFY ?auto_7228 ?auto_7229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7235 - SURFACE
      ?auto_7236 - SURFACE
    )
    :vars
    (
      ?auto_7237 - HOIST
      ?auto_7238 - PLACE
      ?auto_7240 - TRUCK
      ?auto_7239 - PLACE
      ?auto_7241 - HOIST
      ?auto_7242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7237 ?auto_7238 ) ( SURFACE-AT ?auto_7236 ?auto_7238 ) ( CLEAR ?auto_7236 ) ( IS-CRATE ?auto_7235 ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( AVAILABLE ?auto_7237 ) ( TRUCK-AT ?auto_7240 ?auto_7239 ) ( not ( = ?auto_7239 ?auto_7238 ) ) ( HOIST-AT ?auto_7241 ?auto_7239 ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( AVAILABLE ?auto_7241 ) ( SURFACE-AT ?auto_7235 ?auto_7239 ) ( ON ?auto_7235 ?auto_7242 ) ( CLEAR ?auto_7235 ) ( not ( = ?auto_7235 ?auto_7242 ) ) ( not ( = ?auto_7236 ?auto_7242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7241 ?auto_7235 ?auto_7242 ?auto_7239 )
      ( MAKE-ON ?auto_7235 ?auto_7236 )
      ( MAKE-ON-VERIFY ?auto_7235 ?auto_7236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7243 - SURFACE
      ?auto_7244 - SURFACE
    )
    :vars
    (
      ?auto_7249 - HOIST
      ?auto_7250 - PLACE
      ?auto_7247 - PLACE
      ?auto_7245 - HOIST
      ?auto_7248 - SURFACE
      ?auto_7246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7249 ?auto_7250 ) ( SURFACE-AT ?auto_7244 ?auto_7250 ) ( CLEAR ?auto_7244 ) ( IS-CRATE ?auto_7243 ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( AVAILABLE ?auto_7249 ) ( not ( = ?auto_7247 ?auto_7250 ) ) ( HOIST-AT ?auto_7245 ?auto_7247 ) ( not ( = ?auto_7249 ?auto_7245 ) ) ( AVAILABLE ?auto_7245 ) ( SURFACE-AT ?auto_7243 ?auto_7247 ) ( ON ?auto_7243 ?auto_7248 ) ( CLEAR ?auto_7243 ) ( not ( = ?auto_7243 ?auto_7248 ) ) ( not ( = ?auto_7244 ?auto_7248 ) ) ( TRUCK-AT ?auto_7246 ?auto_7250 ) )
    :subtasks
    ( ( !DRIVE ?auto_7246 ?auto_7250 ?auto_7247 )
      ( MAKE-ON ?auto_7243 ?auto_7244 )
      ( MAKE-ON-VERIFY ?auto_7243 ?auto_7244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7291 - SURFACE
      ?auto_7292 - SURFACE
    )
    :vars
    (
      ?auto_7293 - HOIST
      ?auto_7296 - PLACE
      ?auto_7297 - PLACE
      ?auto_7294 - HOIST
      ?auto_7298 - SURFACE
      ?auto_7295 - TRUCK
      ?auto_7299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7293 ?auto_7296 ) ( IS-CRATE ?auto_7291 ) ( not ( = ?auto_7291 ?auto_7292 ) ) ( not ( = ?auto_7297 ?auto_7296 ) ) ( HOIST-AT ?auto_7294 ?auto_7297 ) ( not ( = ?auto_7293 ?auto_7294 ) ) ( AVAILABLE ?auto_7294 ) ( SURFACE-AT ?auto_7291 ?auto_7297 ) ( ON ?auto_7291 ?auto_7298 ) ( CLEAR ?auto_7291 ) ( not ( = ?auto_7291 ?auto_7298 ) ) ( not ( = ?auto_7292 ?auto_7298 ) ) ( TRUCK-AT ?auto_7295 ?auto_7296 ) ( SURFACE-AT ?auto_7299 ?auto_7296 ) ( CLEAR ?auto_7299 ) ( LIFTING ?auto_7293 ?auto_7292 ) ( IS-CRATE ?auto_7292 ) ( not ( = ?auto_7291 ?auto_7299 ) ) ( not ( = ?auto_7292 ?auto_7299 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) )
    :subtasks
    ( ( !DROP ?auto_7293 ?auto_7292 ?auto_7299 ?auto_7296 )
      ( MAKE-ON ?auto_7291 ?auto_7292 )
      ( MAKE-ON-VERIFY ?auto_7291 ?auto_7292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7300 - SURFACE
      ?auto_7301 - SURFACE
    )
    :vars
    (
      ?auto_7307 - HOIST
      ?auto_7308 - PLACE
      ?auto_7305 - PLACE
      ?auto_7304 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7302 - TRUCK
      ?auto_7306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7307 ?auto_7308 ) ( IS-CRATE ?auto_7300 ) ( not ( = ?auto_7300 ?auto_7301 ) ) ( not ( = ?auto_7305 ?auto_7308 ) ) ( HOIST-AT ?auto_7304 ?auto_7305 ) ( not ( = ?auto_7307 ?auto_7304 ) ) ( AVAILABLE ?auto_7304 ) ( SURFACE-AT ?auto_7300 ?auto_7305 ) ( ON ?auto_7300 ?auto_7303 ) ( CLEAR ?auto_7300 ) ( not ( = ?auto_7300 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( TRUCK-AT ?auto_7302 ?auto_7308 ) ( SURFACE-AT ?auto_7306 ?auto_7308 ) ( CLEAR ?auto_7306 ) ( IS-CRATE ?auto_7301 ) ( not ( = ?auto_7300 ?auto_7306 ) ) ( not ( = ?auto_7301 ?auto_7306 ) ) ( not ( = ?auto_7303 ?auto_7306 ) ) ( AVAILABLE ?auto_7307 ) ( IN ?auto_7301 ?auto_7302 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7307 ?auto_7301 ?auto_7302 ?auto_7308 )
      ( MAKE-ON ?auto_7300 ?auto_7301 )
      ( MAKE-ON-VERIFY ?auto_7300 ?auto_7301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7315 - SURFACE
      ?auto_7316 - SURFACE
    )
    :vars
    (
      ?auto_7321 - HOIST
      ?auto_7319 - PLACE
      ?auto_7320 - PLACE
      ?auto_7317 - HOIST
      ?auto_7322 - SURFACE
      ?auto_7318 - TRUCK
      ?auto_7323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7321 ?auto_7319 ) ( SURFACE-AT ?auto_7316 ?auto_7319 ) ( CLEAR ?auto_7316 ) ( IS-CRATE ?auto_7315 ) ( not ( = ?auto_7315 ?auto_7316 ) ) ( AVAILABLE ?auto_7321 ) ( not ( = ?auto_7320 ?auto_7319 ) ) ( HOIST-AT ?auto_7317 ?auto_7320 ) ( not ( = ?auto_7321 ?auto_7317 ) ) ( AVAILABLE ?auto_7317 ) ( SURFACE-AT ?auto_7315 ?auto_7320 ) ( ON ?auto_7315 ?auto_7322 ) ( CLEAR ?auto_7315 ) ( not ( = ?auto_7315 ?auto_7322 ) ) ( not ( = ?auto_7316 ?auto_7322 ) ) ( TRUCK-AT ?auto_7318 ?auto_7323 ) ( not ( = ?auto_7323 ?auto_7319 ) ) ( not ( = ?auto_7320 ?auto_7323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7318 ?auto_7323 ?auto_7319 )
      ( MAKE-ON ?auto_7315 ?auto_7316 )
      ( MAKE-ON-VERIFY ?auto_7315 ?auto_7316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7500 - SURFACE
      ?auto_7501 - SURFACE
    )
    :vars
    (
      ?auto_7502 - HOIST
      ?auto_7505 - PLACE
      ?auto_7507 - TRUCK
      ?auto_7504 - PLACE
      ?auto_7506 - HOIST
      ?auto_7503 - SURFACE
      ?auto_7508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7502 ?auto_7505 ) ( SURFACE-AT ?auto_7501 ?auto_7505 ) ( CLEAR ?auto_7501 ) ( IS-CRATE ?auto_7500 ) ( not ( = ?auto_7500 ?auto_7501 ) ) ( AVAILABLE ?auto_7502 ) ( TRUCK-AT ?auto_7507 ?auto_7504 ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( HOIST-AT ?auto_7506 ?auto_7504 ) ( not ( = ?auto_7502 ?auto_7506 ) ) ( SURFACE-AT ?auto_7500 ?auto_7504 ) ( ON ?auto_7500 ?auto_7503 ) ( CLEAR ?auto_7500 ) ( not ( = ?auto_7500 ?auto_7503 ) ) ( not ( = ?auto_7501 ?auto_7503 ) ) ( LIFTING ?auto_7506 ?auto_7508 ) ( IS-CRATE ?auto_7508 ) ( not ( = ?auto_7500 ?auto_7508 ) ) ( not ( = ?auto_7501 ?auto_7508 ) ) ( not ( = ?auto_7503 ?auto_7508 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7506 ?auto_7508 ?auto_7507 ?auto_7504 )
      ( MAKE-ON ?auto_7500 ?auto_7501 )
      ( MAKE-ON-VERIFY ?auto_7500 ?auto_7501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7623 - SURFACE
      ?auto_7624 - SURFACE
    )
    :vars
    (
      ?auto_7628 - HOIST
      ?auto_7626 - PLACE
      ?auto_7625 - PLACE
      ?auto_7630 - HOIST
      ?auto_7627 - SURFACE
      ?auto_7629 - TRUCK
      ?auto_7631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7628 ?auto_7626 ) ( SURFACE-AT ?auto_7624 ?auto_7626 ) ( CLEAR ?auto_7624 ) ( IS-CRATE ?auto_7623 ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( HOIST-AT ?auto_7630 ?auto_7625 ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( AVAILABLE ?auto_7630 ) ( SURFACE-AT ?auto_7623 ?auto_7625 ) ( ON ?auto_7623 ?auto_7627 ) ( CLEAR ?auto_7623 ) ( not ( = ?auto_7623 ?auto_7627 ) ) ( not ( = ?auto_7624 ?auto_7627 ) ) ( TRUCK-AT ?auto_7629 ?auto_7626 ) ( LIFTING ?auto_7628 ?auto_7631 ) ( IS-CRATE ?auto_7631 ) ( not ( = ?auto_7623 ?auto_7631 ) ) ( not ( = ?auto_7624 ?auto_7631 ) ) ( not ( = ?auto_7627 ?auto_7631 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7628 ?auto_7631 ?auto_7629 ?auto_7626 )
      ( MAKE-ON ?auto_7623 ?auto_7624 )
      ( MAKE-ON-VERIFY ?auto_7623 ?auto_7624 ) )
  )

)

