( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place380 - place
    hoist380 - hoist
    place311 - place
    hoist311 - hoist
    place207 - place
    hoist207 - hoist
    place9 - place
    hoist9 - hoist
    place386 - place
    hoist386 - hoist
    place343 - place
    hoist343 - hoist
    place66 - place
    hoist66 - hoist
    place204 - place
    hoist204 - hoist
    place0 - place
    hoist0 - hoist
    crate159 - surface
    pallet159 - surface
    crate152 - surface
    pallet152 - surface
    crate709 - surface
    pallet709 - surface
    crate610 - surface
    pallet610 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist380 place380 )
    ( available hoist380 )
    ( hoist-at hoist311 place311 )
    ( available hoist311 )
    ( hoist-at hoist207 place207 )
    ( available hoist207 )
    ( hoist-at hoist9 place9 )
    ( available hoist9 )
    ( hoist-at hoist386 place386 )
    ( available hoist386 )
    ( hoist-at hoist343 place343 )
    ( available hoist343 )
    ( hoist-at hoist66 place66 )
    ( available hoist66 )
    ( hoist-at hoist204 place204 )
    ( available hoist204 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet159 place9 )
    ( surface-at crate159 place9 )
    ( on crate159 pallet159 )
    ( is-crate crate159 )
    ( clear crate159 )
    ( surface-at pallet152 place343 )
    ( surface-at crate152 place343 )
    ( on crate152 pallet152 )
    ( is-crate crate152 )
    ( clear crate152 )
    ( surface-at pallet709 place311 )
    ( surface-at crate709 place311 )
    ( on crate709 pallet709 )
    ( is-crate crate709 )
    ( clear crate709 )
    ( surface-at pallet610 place343 )
    ( surface-at crate610 place343 )
    ( on crate610 pallet610 )
    ( is-crate crate610 )
    ( clear crate610 )
  )
  ( :goal
    ( and
    )
  )
)
