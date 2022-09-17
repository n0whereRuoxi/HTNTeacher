( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place414 - place
    hoist414 - hoist
    place549 - place
    hoist549 - hoist
    place0 - place
    hoist0 - hoist
    crate821 - surface
    pallet821 - surface
    crate2 - surface
    pallet2 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist414 place414 )
    ( available hoist414 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet821 place414 )
    ( surface-at crate821 place414 )
    ( on crate821 pallet821 )
    ( is-crate crate821 )
    ( clear crate821 )
    ( surface-at pallet2 place549 )
    ( surface-at crate2 place549 )
    ( on crate2 pallet2 )
    ( is-crate crate2 )
    ( clear crate2 )
  )
  ( :tasks
    ( Make-On crate821 pallet0 )    ( Make-On crate2 crate821 )  )
)
