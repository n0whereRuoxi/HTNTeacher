( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place998 - place
    hoist998 - hoist
    place635 - place
    hoist635 - hoist
    place799 - place
    hoist799 - hoist
    place487 - place
    hoist487 - hoist
    place0 - place
    hoist0 - hoist
    crate723 - surface
    pallet723 - surface
    crate746 - surface
    pallet746 - surface
    crate910 - surface
    pallet910 - surface
    crate399 - surface
    pallet399 - surface
    crate534 - surface
    pallet534 - surface
    crate212 - surface
    pallet212 - surface
    crate661 - surface
    pallet661 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist799 place799 )
    ( available hoist799 )
    ( hoist-at hoist487 place487 )
    ( available hoist487 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet723 place998 )
    ( surface-at crate723 place998 )
    ( on crate723 pallet723 )
    ( is-crate crate723 )
    ( clear crate723 )
    ( surface-at pallet746 place799 )
    ( surface-at crate746 place799 )
    ( on crate746 pallet746 )
    ( is-crate crate746 )
    ( clear crate746 )
    ( surface-at pallet910 place998 )
    ( surface-at crate910 place998 )
    ( on crate910 pallet910 )
    ( is-crate crate910 )
    ( clear crate910 )
    ( surface-at pallet399 place487 )
    ( surface-at crate399 place487 )
    ( on crate399 pallet399 )
    ( is-crate crate399 )
    ( clear crate399 )
    ( surface-at pallet534 place799 )
    ( surface-at crate534 place799 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet212 place998 )
    ( surface-at crate212 place998 )
    ( on crate212 pallet212 )
    ( is-crate crate212 )
    ( clear crate212 )
    ( surface-at pallet661 place487 )
    ( surface-at crate661 place487 )
    ( on crate661 pallet661 )
    ( is-crate crate661 )
    ( clear crate661 )
  )
  ( :tasks
    ( Make-On crate723 pallet0 )    ( Make-On crate746 crate723 )    ( Make-On crate910 crate746 )    ( Make-On crate399 crate910 )    ( Make-On crate534 crate399 )    ( Make-On crate212 crate534 )    ( Make-On crate661 crate212 )  )
)
