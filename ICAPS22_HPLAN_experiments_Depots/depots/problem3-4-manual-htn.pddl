( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place830 - place
    hoist830 - hoist
    place356 - place
    hoist356 - hoist
    place451 - place
    hoist451 - hoist
    place333 - place
    hoist333 - hoist
    place0 - place
    hoist0 - hoist
    crate622 - surface
    pallet622 - surface
    crate323 - surface
    pallet323 - surface
    crate422 - surface
    pallet422 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist830 place830 )
    ( available hoist830 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist333 place333 )
    ( available hoist333 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet622 place333 )
    ( surface-at crate622 place333 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
    ( surface-at pallet323 place830 )
    ( surface-at crate323 place830 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
    ( surface-at pallet422 place451 )
    ( surface-at crate422 place451 )
    ( on crate422 pallet422 )
    ( is-crate crate422 )
    ( clear crate422 )
  )
  ( :tasks
    ( Make-On crate622 pallet0 )    ( Make-On crate323 crate622 )    ( Make-On crate422 crate323 )  )
)
