( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place467 - place
    hoist467 - hoist
    place441 - place
    hoist441 - hoist
    place635 - place
    hoist635 - hoist
    place0 - place
    hoist0 - hoist
    crate345 - surface
    pallet345 - surface
    crate64 - surface
    pallet64 - surface
    crate439 - surface
    pallet439 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist467 place467 )
    ( available hoist467 )
    ( hoist-at hoist441 place441 )
    ( available hoist441 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet345 place441 )
    ( surface-at crate345 place441 )
    ( on crate345 pallet345 )
    ( is-crate crate345 )
    ( clear crate345 )
    ( surface-at pallet64 place635 )
    ( surface-at crate64 place635 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet439 place441 )
    ( surface-at crate439 place441 )
    ( on crate439 pallet439 )
    ( is-crate crate439 )
    ( clear crate439 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate345 crate64 crate439 )
  )
)
