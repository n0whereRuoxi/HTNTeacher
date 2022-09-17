( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place541 - place
    hoist541 - hoist
    place0 - place
    hoist0 - hoist
    crate897 - surface
    pallet897 - surface
    crate463 - surface
    pallet463 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet897 place541 )
    ( surface-at crate897 place541 )
    ( on crate897 pallet897 )
    ( is-crate crate897 )
    ( clear crate897 )
    ( surface-at pallet463 place541 )
    ( surface-at crate463 place541 )
    ( on crate463 pallet463 )
    ( is-crate crate463 )
    ( clear crate463 )
  )
  ( :tasks
    ( Make-On crate897 pallet0 )    ( Make-On crate463 crate897 )  )
)
