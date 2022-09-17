( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place657 - place
    hoist657 - hoist
    place858 - place
    hoist858 - hoist
    place0 - place
    hoist0 - hoist
    crate902 - surface
    pallet902 - surface
    crate40 - surface
    pallet40 - surface
    crate805 - surface
    pallet805 - surface
    crate216 - surface
    pallet216 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist858 place858 )
    ( available hoist858 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet902 place858 )
    ( surface-at crate902 place858 )
    ( on crate902 pallet902 )
    ( is-crate crate902 )
    ( clear crate902 )
    ( surface-at pallet40 place657 )
    ( surface-at crate40 place657 )
    ( on crate40 pallet40 )
    ( is-crate crate40 )
    ( clear crate40 )
    ( surface-at pallet805 place858 )
    ( surface-at crate805 place858 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet216 place858 )
    ( surface-at crate216 place858 )
    ( on crate216 pallet216 )
    ( is-crate crate216 )
    ( clear crate216 )
  )
  ( :tasks
    ( Make-On crate902 pallet0 )    ( Make-On crate40 crate902 )    ( Make-On crate805 crate40 )    ( Make-On crate216 crate805 )  )
)
