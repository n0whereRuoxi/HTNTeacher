( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place891 - place
    hoist891 - hoist
    place948 - place
    hoist948 - hoist
    place746 - place
    hoist746 - hoist
    place945 - place
    hoist945 - hoist
    place894 - place
    hoist894 - hoist
    place0 - place
    hoist0 - hoist
    crate774 - surface
    pallet774 - surface
    crate791 - surface
    pallet791 - surface
    crate820 - surface
    pallet820 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist891 place891 )
    ( available hoist891 )
    ( hoist-at hoist948 place948 )
    ( available hoist948 )
    ( hoist-at hoist746 place746 )
    ( available hoist746 )
    ( hoist-at hoist945 place945 )
    ( available hoist945 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet774 place746 )
    ( surface-at crate774 place746 )
    ( on crate774 pallet774 )
    ( is-crate crate774 )
    ( clear crate774 )
    ( surface-at pallet791 place894 )
    ( surface-at crate791 place894 )
    ( on crate791 pallet791 )
    ( is-crate crate791 )
    ( clear crate791 )
    ( surface-at pallet820 place894 )
    ( surface-at crate820 place894 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
  )
  ( :tasks
    ( Make-On crate774 pallet0 )    ( Make-On crate791 crate774 )    ( Make-On crate820 crate791 )  )
)
