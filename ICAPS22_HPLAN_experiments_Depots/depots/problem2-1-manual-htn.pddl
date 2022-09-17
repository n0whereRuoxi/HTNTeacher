( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place41 - place
    hoist41 - hoist
    place0 - place
    hoist0 - hoist
    crate513 - surface
    pallet513 - surface
    crate769 - surface
    pallet769 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist41 place41 )
    ( available hoist41 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet513 place41 )
    ( surface-at crate513 place41 )
    ( on crate513 pallet513 )
    ( is-crate crate513 )
    ( clear crate513 )
    ( surface-at pallet769 place41 )
    ( surface-at crate769 place41 )
    ( on crate769 pallet769 )
    ( is-crate crate769 )
    ( clear crate769 )
  )
  ( :tasks
    ( Make-On crate513 pallet0 )    ( Make-On crate769 crate513 )  )
)
