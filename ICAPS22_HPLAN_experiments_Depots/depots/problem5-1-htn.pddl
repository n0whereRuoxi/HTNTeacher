( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place912 - place
    hoist912 - hoist
    place40 - place
    hoist40 - hoist
    place0 - place
    hoist0 - hoist
    crate355 - surface
    pallet355 - surface
    crate357 - surface
    pallet357 - surface
    crate834 - surface
    pallet834 - surface
    crate268 - surface
    pallet268 - surface
    crate474 - surface
    pallet474 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist40 place40 )
    ( available hoist40 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet355 place40 )
    ( surface-at crate355 place40 )
    ( on crate355 pallet355 )
    ( is-crate crate355 )
    ( clear crate355 )
    ( surface-at pallet357 place912 )
    ( surface-at crate357 place912 )
    ( on crate357 pallet357 )
    ( is-crate crate357 )
    ( clear crate357 )
    ( surface-at pallet834 place912 )
    ( surface-at crate834 place912 )
    ( on crate834 pallet834 )
    ( is-crate crate834 )
    ( clear crate834 )
    ( surface-at pallet268 place912 )
    ( surface-at crate268 place912 )
    ( on crate268 pallet268 )
    ( is-crate crate268 )
    ( clear crate268 )
    ( surface-at pallet474 place912 )
    ( surface-at crate474 place912 )
    ( on crate474 pallet474 )
    ( is-crate crate474 )
    ( clear crate474 )
  )
  ( :tasks
    ( Make-On crate355 pallet0 )    ( Make-On crate357 crate355 )    ( Make-On crate834 crate357 )    ( Make-On crate268 crate834 )    ( Make-On crate474 crate268 )  )
)
