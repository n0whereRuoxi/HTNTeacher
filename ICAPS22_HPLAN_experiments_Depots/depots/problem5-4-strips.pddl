( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place93 - place
    hoist93 - hoist
    place439 - place
    hoist439 - hoist
    place718 - place
    hoist718 - hoist
    place248 - place
    hoist248 - hoist
    place155 - place
    hoist155 - hoist
    place0 - place
    hoist0 - hoist
    crate462 - surface
    pallet462 - surface
    crate81 - surface
    pallet81 - surface
    crate519 - surface
    pallet519 - surface
    crate365 - surface
    pallet365 - surface
    crate180 - surface
    pallet180 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist93 place93 )
    ( available hoist93 )
    ( hoist-at hoist439 place439 )
    ( available hoist439 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist248 place248 )
    ( available hoist248 )
    ( hoist-at hoist155 place155 )
    ( available hoist155 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet462 place718 )
    ( surface-at crate462 place718 )
    ( on crate462 pallet462 )
    ( is-crate crate462 )
    ( clear crate462 )
    ( surface-at pallet81 place248 )
    ( surface-at crate81 place248 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet519 place248 )
    ( surface-at crate519 place248 )
    ( on crate519 pallet519 )
    ( is-crate crate519 )
    ( clear crate519 )
    ( surface-at pallet365 place718 )
    ( surface-at crate365 place718 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet180 place93 )
    ( surface-at crate180 place93 )
    ( on crate180 pallet180 )
    ( is-crate crate180 )
    ( clear crate180 )
  )
  ( :goal
    ( and
    )
  )
)
