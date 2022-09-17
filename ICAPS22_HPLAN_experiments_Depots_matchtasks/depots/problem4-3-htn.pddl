( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place351 - place
    hoist351 - hoist
    place550 - place
    hoist550 - hoist
    place0 - place
    hoist0 - hoist
    crate111 - surface
    pallet111 - surface
    crate996 - surface
    pallet996 - surface
    crate577 - surface
    pallet577 - surface
    crate627 - surface
    pallet627 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist550 place550 )
    ( available hoist550 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet111 place550 )
    ( surface-at crate111 place550 )
    ( on crate111 pallet111 )
    ( is-crate crate111 )
    ( clear crate111 )
    ( surface-at pallet996 place351 )
    ( surface-at crate996 place351 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet577 place550 )
    ( surface-at crate577 place550 )
    ( on crate577 pallet577 )
    ( is-crate crate577 )
    ( clear crate577 )
    ( surface-at pallet627 place550 )
    ( surface-at crate627 place550 )
    ( on crate627 pallet627 )
    ( is-crate crate627 )
    ( clear crate627 )
  )
  ( :tasks
    ( Make-4Crate pallet0 crate111 crate996 crate577 crate627 )
  )
)
