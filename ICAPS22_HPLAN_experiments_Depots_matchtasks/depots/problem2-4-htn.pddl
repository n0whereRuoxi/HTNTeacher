( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place176 - place
    hoist176 - hoist
    place0 - place
    hoist0 - hoist
    crate644 - surface
    pallet644 - surface
    crate964 - surface
    pallet964 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist176 place176 )
    ( available hoist176 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet644 place176 )
    ( surface-at crate644 place176 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
    ( surface-at pallet964 place176 )
    ( surface-at crate964 place176 )
    ( on crate964 pallet964 )
    ( is-crate crate964 )
    ( clear crate964 )
  )
  ( :tasks
    ( Make-2Crate pallet0 crate644 crate964 )
  )
)
