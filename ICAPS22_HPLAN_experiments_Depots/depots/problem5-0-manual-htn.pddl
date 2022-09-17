( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place131 - place
    hoist131 - hoist
    place455 - place
    hoist455 - hoist
    place583 - place
    hoist583 - hoist
    place0 - place
    hoist0 - hoist
    crate82 - surface
    pallet82 - surface
    crate896 - surface
    pallet896 - surface
    crate342 - surface
    pallet342 - surface
    crate418 - surface
    pallet418 - surface
    crate972 - surface
    pallet972 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist131 place131 )
    ( available hoist131 )
    ( hoist-at hoist455 place455 )
    ( available hoist455 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet82 place455 )
    ( surface-at crate82 place455 )
    ( on crate82 pallet82 )
    ( is-crate crate82 )
    ( clear crate82 )
    ( surface-at pallet896 place455 )
    ( surface-at crate896 place455 )
    ( on crate896 pallet896 )
    ( is-crate crate896 )
    ( clear crate896 )
    ( surface-at pallet342 place131 )
    ( surface-at crate342 place131 )
    ( on crate342 pallet342 )
    ( is-crate crate342 )
    ( clear crate342 )
    ( surface-at pallet418 place583 )
    ( surface-at crate418 place583 )
    ( on crate418 pallet418 )
    ( is-crate crate418 )
    ( clear crate418 )
    ( surface-at pallet972 place583 )
    ( surface-at crate972 place583 )
    ( on crate972 pallet972 )
    ( is-crate crate972 )
    ( clear crate972 )
  )
  ( :tasks
    ( Make-On crate82 pallet0 )    ( Make-On crate896 crate82 )    ( Make-On crate342 crate896 )    ( Make-On crate418 crate342 )    ( Make-On crate972 crate418 )  )
)
