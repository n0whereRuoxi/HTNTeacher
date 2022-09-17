( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place250 - place
    hoist250 - hoist
    place96 - place
    hoist96 - hoist
    place236 - place
    hoist236 - hoist
    place39 - place
    hoist39 - hoist
    place103 - place
    hoist103 - hoist
    place998 - place
    hoist998 - hoist
    place172 - place
    hoist172 - hoist
    place0 - place
    hoist0 - hoist
    crate221 - surface
    pallet221 - surface
    crate61 - surface
    pallet61 - surface
    crate132 - surface
    pallet132 - surface
    crate997 - surface
    pallet997 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist250 place250 )
    ( available hoist250 )
    ( hoist-at hoist96 place96 )
    ( available hoist96 )
    ( hoist-at hoist236 place236 )
    ( available hoist236 )
    ( hoist-at hoist39 place39 )
    ( available hoist39 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist172 place172 )
    ( available hoist172 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet221 place236 )
    ( surface-at crate221 place236 )
    ( on crate221 pallet221 )
    ( is-crate crate221 )
    ( clear crate221 )
    ( surface-at pallet61 place236 )
    ( surface-at crate61 place236 )
    ( on crate61 pallet61 )
    ( is-crate crate61 )
    ( clear crate61 )
    ( surface-at pallet132 place172 )
    ( surface-at crate132 place172 )
    ( on crate132 pallet132 )
    ( is-crate crate132 )
    ( clear crate132 )
    ( surface-at pallet997 place96 )
    ( surface-at crate997 place96 )
    ( on crate997 pallet997 )
    ( is-crate crate997 )
    ( clear crate997 )
  )
  ( :goal
    ( and
    )
  )
)
