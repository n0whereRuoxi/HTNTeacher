( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place93 - place
    hoist93 - hoist
    place37 - place
    hoist37 - hoist
    place0 - place
    hoist0 - hoist
    crate596 - surface
    pallet596 - surface
    crate570 - surface
    pallet570 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist93 place93 )
    ( available hoist93 )
    ( hoist-at hoist37 place37 )
    ( available hoist37 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet596 place93 )
    ( surface-at crate596 place93 )
    ( on crate596 pallet596 )
    ( is-crate crate596 )
    ( clear crate596 )
    ( surface-at pallet570 place37 )
    ( surface-at crate570 place37 )
    ( on crate570 pallet570 )
    ( is-crate crate570 )
    ( clear crate570 )
  )
  ( :goal
    ( and
    )
  )
)
