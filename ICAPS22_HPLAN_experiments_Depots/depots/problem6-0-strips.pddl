( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place286 - place
    hoist286 - hoist
    place779 - place
    hoist779 - hoist
    place544 - place
    hoist544 - hoist
    place308 - place
    hoist308 - hoist
    place508 - place
    hoist508 - hoist
    place611 - place
    hoist611 - hoist
    place0 - place
    hoist0 - hoist
    crate700 - surface
    pallet700 - surface
    crate827 - surface
    pallet827 - surface
    crate194 - surface
    pallet194 - surface
    crate575 - surface
    pallet575 - surface
    crate127 - surface
    pallet127 - surface
    crate832 - surface
    pallet832 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist779 place779 )
    ( available hoist779 )
    ( hoist-at hoist544 place544 )
    ( available hoist544 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist611 place611 )
    ( available hoist611 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet700 place779 )
    ( surface-at crate700 place779 )
    ( on crate700 pallet700 )
    ( is-crate crate700 )
    ( clear crate700 )
    ( surface-at pallet827 place544 )
    ( surface-at crate827 place544 )
    ( on crate827 pallet827 )
    ( is-crate crate827 )
    ( clear crate827 )
    ( surface-at pallet194 place286 )
    ( surface-at crate194 place286 )
    ( on crate194 pallet194 )
    ( is-crate crate194 )
    ( clear crate194 )
    ( surface-at pallet575 place779 )
    ( surface-at crate575 place779 )
    ( on crate575 pallet575 )
    ( is-crate crate575 )
    ( clear crate575 )
    ( surface-at pallet127 place308 )
    ( surface-at crate127 place308 )
    ( on crate127 pallet127 )
    ( is-crate crate127 )
    ( clear crate127 )
    ( surface-at pallet832 place286 )
    ( surface-at crate832 place286 )
    ( on crate832 pallet832 )
    ( is-crate crate832 )
    ( clear crate832 )
  )
  ( :goal
    ( and
    )
  )
)
