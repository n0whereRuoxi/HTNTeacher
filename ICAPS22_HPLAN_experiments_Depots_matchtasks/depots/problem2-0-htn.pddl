( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place815 - place
    hoist815 - hoist
    place886 - place
    hoist886 - hoist
    place0 - place
    hoist0 - hoist
    crate909 - surface
    pallet909 - surface
    crate713 - surface
    pallet713 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist815 place815 )
    ( available hoist815 )
    ( hoist-at hoist886 place886 )
    ( available hoist886 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet909 place815 )
    ( surface-at crate909 place815 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
    ( surface-at pallet713 place886 )
    ( surface-at crate713 place886 )
    ( on crate713 pallet713 )
    ( is-crate crate713 )
    ( clear crate713 )
  )
  ( :tasks
    ( Make-2Crate pallet0 crate909 crate713 )
  )
)
