( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place518 - place
    hoist518 - hoist
    place416 - place
    hoist416 - hoist
    place0 - place
    hoist0 - hoist
    crate751 - surface
    pallet751 - surface
    crate724 - surface
    pallet724 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist518 place518 )
    ( available hoist518 )
    ( hoist-at hoist416 place416 )
    ( available hoist416 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet751 place416 )
    ( surface-at crate751 place416 )
    ( on crate751 pallet751 )
    ( is-crate crate751 )
    ( clear crate751 )
    ( surface-at pallet724 place518 )
    ( surface-at crate724 place518 )
    ( on crate724 pallet724 )
    ( is-crate crate724 )
    ( clear crate724 )
  )
  ( :goal
    ( and
    )
  )
)
