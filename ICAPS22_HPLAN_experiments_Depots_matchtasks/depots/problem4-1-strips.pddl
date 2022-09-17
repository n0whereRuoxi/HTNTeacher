( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place171 - place
    hoist171 - hoist
    place926 - place
    hoist926 - hoist
    place292 - place
    hoist292 - hoist
    place568 - place
    hoist568 - hoist
    place215 - place
    hoist215 - hoist
    place885 - place
    hoist885 - hoist
    place183 - place
    hoist183 - hoist
    place0 - place
    hoist0 - hoist
    crate462 - surface
    pallet462 - surface
    crate678 - surface
    pallet678 - surface
    crate294 - surface
    pallet294 - surface
    crate664 - surface
    pallet664 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist171 place171 )
    ( available hoist171 )
    ( hoist-at hoist926 place926 )
    ( available hoist926 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist568 place568 )
    ( available hoist568 )
    ( hoist-at hoist215 place215 )
    ( available hoist215 )
    ( hoist-at hoist885 place885 )
    ( available hoist885 )
    ( hoist-at hoist183 place183 )
    ( available hoist183 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet462 place292 )
    ( surface-at crate462 place292 )
    ( on crate462 pallet462 )
    ( is-crate crate462 )
    ( clear crate462 )
    ( surface-at pallet678 place885 )
    ( surface-at crate678 place885 )
    ( on crate678 pallet678 )
    ( is-crate crate678 )
    ( clear crate678 )
    ( surface-at pallet294 place183 )
    ( surface-at crate294 place183 )
    ( on crate294 pallet294 )
    ( is-crate crate294 )
    ( clear crate294 )
    ( surface-at pallet664 place926 )
    ( surface-at crate664 place926 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
  )
  ( :goal
    ( and
    )
  )
)
