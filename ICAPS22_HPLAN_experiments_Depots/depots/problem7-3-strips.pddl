( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place105 - place
    hoist105 - hoist
    place2 - place
    hoist2 - hoist
    place134 - place
    hoist134 - hoist
    place153 - place
    hoist153 - hoist
    place0 - place
    hoist0 - hoist
    crate536 - surface
    pallet536 - surface
    crate446 - surface
    pallet446 - surface
    crate401 - surface
    pallet401 - surface
    crate66 - surface
    pallet66 - surface
    crate42 - surface
    pallet42 - surface
    crate853 - surface
    pallet853 - surface
    crate878 - surface
    pallet878 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist134 place134 )
    ( available hoist134 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet536 place134 )
    ( surface-at crate536 place134 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
    ( surface-at pallet446 place134 )
    ( surface-at crate446 place134 )
    ( on crate446 pallet446 )
    ( is-crate crate446 )
    ( clear crate446 )
    ( surface-at pallet401 place153 )
    ( surface-at crate401 place153 )
    ( on crate401 pallet401 )
    ( is-crate crate401 )
    ( clear crate401 )
    ( surface-at pallet66 place153 )
    ( surface-at crate66 place153 )
    ( on crate66 pallet66 )
    ( is-crate crate66 )
    ( clear crate66 )
    ( surface-at pallet42 place2 )
    ( surface-at crate42 place2 )
    ( on crate42 pallet42 )
    ( is-crate crate42 )
    ( clear crate42 )
    ( surface-at pallet853 place134 )
    ( surface-at crate853 place134 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
    ( surface-at pallet878 place105 )
    ( surface-at crate878 place105 )
    ( on crate878 pallet878 )
    ( is-crate crate878 )
    ( clear crate878 )
  )
  ( :goal
    ( and
    )
  )
)
