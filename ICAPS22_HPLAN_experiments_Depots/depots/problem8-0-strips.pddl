( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place394 - place
    hoist394 - hoist
    place599 - place
    hoist599 - hoist
    place847 - place
    hoist847 - hoist
    place713 - place
    hoist713 - hoist
    place838 - place
    hoist838 - hoist
    place364 - place
    hoist364 - hoist
    place272 - place
    hoist272 - hoist
    place617 - place
    hoist617 - hoist
    place879 - place
    hoist879 - hoist
    place954 - place
    hoist954 - hoist
    place144 - place
    hoist144 - hoist
    place0 - place
    hoist0 - hoist
    crate332 - surface
    pallet332 - surface
    crate198 - surface
    pallet198 - surface
    crate695 - surface
    pallet695 - surface
    crate319 - surface
    pallet319 - surface
    crate303 - surface
    pallet303 - surface
    crate449 - surface
    pallet449 - surface
    crate555 - surface
    pallet555 - surface
    crate801 - surface
    pallet801 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist599 place599 )
    ( available hoist599 )
    ( hoist-at hoist847 place847 )
    ( available hoist847 )
    ( hoist-at hoist713 place713 )
    ( available hoist713 )
    ( hoist-at hoist838 place838 )
    ( available hoist838 )
    ( hoist-at hoist364 place364 )
    ( available hoist364 )
    ( hoist-at hoist272 place272 )
    ( available hoist272 )
    ( hoist-at hoist617 place617 )
    ( available hoist617 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet332 place599 )
    ( surface-at crate332 place599 )
    ( on crate332 pallet332 )
    ( is-crate crate332 )
    ( clear crate332 )
    ( surface-at pallet198 place144 )
    ( surface-at crate198 place144 )
    ( on crate198 pallet198 )
    ( is-crate crate198 )
    ( clear crate198 )
    ( surface-at pallet695 place272 )
    ( surface-at crate695 place272 )
    ( on crate695 pallet695 )
    ( is-crate crate695 )
    ( clear crate695 )
    ( surface-at pallet319 place144 )
    ( surface-at crate319 place144 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet303 place617 )
    ( surface-at crate303 place617 )
    ( on crate303 pallet303 )
    ( is-crate crate303 )
    ( clear crate303 )
    ( surface-at pallet449 place847 )
    ( surface-at crate449 place847 )
    ( on crate449 pallet449 )
    ( is-crate crate449 )
    ( clear crate449 )
    ( surface-at pallet555 place847 )
    ( surface-at crate555 place847 )
    ( on crate555 pallet555 )
    ( is-crate crate555 )
    ( clear crate555 )
    ( surface-at pallet801 place713 )
    ( surface-at crate801 place713 )
    ( on crate801 pallet801 )
    ( is-crate crate801 )
    ( clear crate801 )
  )
  ( :goal
    ( and
    )
  )
)
