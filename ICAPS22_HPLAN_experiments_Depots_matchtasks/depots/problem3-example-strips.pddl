( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )

  ( :objects
    place000 - place
    place001 - place
    place002 - place
    place003 - place
    truck000 - truck
    pallet000 - surface
    pallet001 - surface
    pallet002 - surface
    pallet003 - surface
    crate001 - surface
    crate002 - surface
    crate003 - surface
    hoist000 - hoist
    hoist001 - hoist
    hoist002 - hoist
    hoist003 - hoist
  )

  ( :init
    ( truck-at truck000 place000 )
    ( hoist-at hoist000 place000 )
    ( hoist-at hoist001 place001 )
    ( hoist-at hoist002 place002 )
    ( hoist-at hoist003 place003 )
    ( available hoist000 )
    ( available hoist001 )
    ( available hoist002 )
    ( available hoist003 )
    ( surface-at pallet000 place000 )
    ( surface-at pallet001 place001 )
    ( surface-at pallet002 place002 )
    ( surface-at pallet003 place003 )
    ( surface-at crate001 place001 )
    ( surface-at crate002 place002 )
    ( surface-at crate003 place003 )
    ( is-crate crate001 )
    ( is-crate crate002 )
    ( is-crate crate003 )
    ( on crate001 pallet001 )
    ( on crate002 pallet002 )
    ( on crate003 pallet003 )
    ( clear crate001 )
    ( clear crate002 )
    ( clear crate003 )
    ( clear pallet000 )
  )
  ( :goal
    ( and
      ( on crate001 pallet000 )
      ( on crate002 crate001 )
      ( on crate003 crate002 )
      ( clear crate003 )
    )
  )
)

