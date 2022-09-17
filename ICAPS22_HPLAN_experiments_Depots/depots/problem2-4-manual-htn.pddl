( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place247 - place
    hoist247 - hoist
    place307 - place
    hoist307 - hoist
    place263 - place
    hoist263 - hoist
    place560 - place
    hoist560 - hoist
    place0 - place
    hoist0 - hoist
    crate757 - surface
    pallet757 - surface
    crate644 - surface
    pallet644 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist247 place247 )
    ( available hoist247 )
    ( hoist-at hoist307 place307 )
    ( available hoist307 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist560 place560 )
    ( available hoist560 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet757 place263 )
    ( surface-at crate757 place263 )
    ( on crate757 pallet757 )
    ( is-crate crate757 )
    ( clear crate757 )
    ( surface-at pallet644 place307 )
    ( surface-at crate644 place307 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
  )
  ( :tasks
    ( Make-On crate757 pallet0 )    ( Make-On crate644 crate757 )  )
)
