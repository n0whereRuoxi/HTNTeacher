( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place248 - place
    hoist248 - hoist
    place959 - place
    hoist959 - hoist
    place729 - place
    hoist729 - hoist
    place0 - place
    hoist0 - hoist
    crate107 - surface
    pallet107 - surface
    crate380 - surface
    pallet380 - surface
    crate28 - surface
    pallet28 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist248 place248 )
    ( available hoist248 )
    ( hoist-at hoist959 place959 )
    ( available hoist959 )
    ( hoist-at hoist729 place729 )
    ( available hoist729 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet107 place729 )
    ( surface-at crate107 place729 )
    ( on crate107 pallet107 )
    ( is-crate crate107 )
    ( clear crate107 )
    ( surface-at pallet380 place959 )
    ( surface-at crate380 place959 )
    ( on crate380 pallet380 )
    ( is-crate crate380 )
    ( clear crate380 )
    ( surface-at pallet28 place959 )
    ( surface-at crate28 place959 )
    ( on crate28 pallet28 )
    ( is-crate crate28 )
    ( clear crate28 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate107 crate380 crate28 )
  )
)
