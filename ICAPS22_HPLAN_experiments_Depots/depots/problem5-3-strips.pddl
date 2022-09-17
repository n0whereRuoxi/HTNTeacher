( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place843 - place
    hoist843 - hoist
    place390 - place
    hoist390 - hoist
    place972 - place
    hoist972 - hoist
    place981 - place
    hoist981 - hoist
    place0 - place
    hoist0 - hoist
    crate239 - surface
    pallet239 - surface
    crate184 - surface
    pallet184 - surface
    crate46 - surface
    pallet46 - surface
    crate435 - surface
    pallet435 - surface
    crate901 - surface
    pallet901 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist972 place972 )
    ( available hoist972 )
    ( hoist-at hoist981 place981 )
    ( available hoist981 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet239 place972 )
    ( surface-at crate239 place972 )
    ( on crate239 pallet239 )
    ( is-crate crate239 )
    ( clear crate239 )
    ( surface-at pallet184 place390 )
    ( surface-at crate184 place390 )
    ( on crate184 pallet184 )
    ( is-crate crate184 )
    ( clear crate184 )
    ( surface-at pallet46 place843 )
    ( surface-at crate46 place843 )
    ( on crate46 pallet46 )
    ( is-crate crate46 )
    ( clear crate46 )
    ( surface-at pallet435 place972 )
    ( surface-at crate435 place972 )
    ( on crate435 pallet435 )
    ( is-crate crate435 )
    ( clear crate435 )
    ( surface-at pallet901 place843 )
    ( surface-at crate901 place843 )
    ( on crate901 pallet901 )
    ( is-crate crate901 )
    ( clear crate901 )
  )
  ( :goal
    ( and
    )
  )
)
