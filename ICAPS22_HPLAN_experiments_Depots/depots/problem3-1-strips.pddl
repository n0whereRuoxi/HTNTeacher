( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place621 - place
    hoist621 - hoist
    place108 - place
    hoist108 - hoist
    place848 - place
    hoist848 - hoist
    place0 - place
    hoist0 - hoist
    crate887 - surface
    pallet887 - surface
    crate994 - surface
    pallet994 - surface
    crate399 - surface
    pallet399 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist621 place621 )
    ( available hoist621 )
    ( hoist-at hoist108 place108 )
    ( available hoist108 )
    ( hoist-at hoist848 place848 )
    ( available hoist848 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet887 place108 )
    ( surface-at crate887 place108 )
    ( on crate887 pallet887 )
    ( is-crate crate887 )
    ( clear crate887 )
    ( surface-at pallet994 place621 )
    ( surface-at crate994 place621 )
    ( on crate994 pallet994 )
    ( is-crate crate994 )
    ( clear crate994 )
    ( surface-at pallet399 place848 )
    ( surface-at crate399 place848 )
    ( on crate399 pallet399 )
    ( is-crate crate399 )
    ( clear crate399 )
  )
  ( :goal
    ( and
    )
  )
)
