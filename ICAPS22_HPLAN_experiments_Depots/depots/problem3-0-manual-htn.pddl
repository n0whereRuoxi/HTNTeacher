( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place80 - place
    hoist80 - hoist
    place163 - place
    hoist163 - hoist
    place687 - place
    hoist687 - hoist
    place0 - place
    hoist0 - hoist
    crate291 - surface
    pallet291 - surface
    crate692 - surface
    pallet692 - surface
    crate429 - surface
    pallet429 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist80 place80 )
    ( available hoist80 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist687 place687 )
    ( available hoist687 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet291 place687 )
    ( surface-at crate291 place687 )
    ( on crate291 pallet291 )
    ( is-crate crate291 )
    ( clear crate291 )
    ( surface-at pallet692 place163 )
    ( surface-at crate692 place163 )
    ( on crate692 pallet692 )
    ( is-crate crate692 )
    ( clear crate692 )
    ( surface-at pallet429 place163 )
    ( surface-at crate429 place163 )
    ( on crate429 pallet429 )
    ( is-crate crate429 )
    ( clear crate429 )
  )
  ( :tasks
    ( Make-On crate291 pallet0 )    ( Make-On crate692 crate291 )    ( Make-On crate429 crate692 )  )
)
