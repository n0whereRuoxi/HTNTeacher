( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place286 - place
    hoist286 - hoist
    place708 - place
    hoist708 - hoist
    place143 - place
    hoist143 - hoist
    place728 - place
    hoist728 - hoist
    place0 - place
    hoist0 - hoist
    crate543 - surface
    pallet543 - surface
    crate277 - surface
    pallet277 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist143 place143 )
    ( available hoist143 )
    ( hoist-at hoist728 place728 )
    ( available hoist728 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet543 place728 )
    ( surface-at crate543 place728 )
    ( on crate543 pallet543 )
    ( is-crate crate543 )
    ( clear crate543 )
    ( surface-at pallet277 place728 )
    ( surface-at crate277 place728 )
    ( on crate277 pallet277 )
    ( is-crate crate277 )
    ( clear crate277 )
  )
  ( :goal
    ( and
    )
  )
)
