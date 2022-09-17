( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place846 - place
    hoist846 - hoist
    place652 - place
    hoist652 - hoist
    place527 - place
    hoist527 - hoist
    place0 - place
    hoist0 - hoist
    crate609 - surface
    pallet609 - surface
    crate491 - surface
    pallet491 - surface
    crate420 - surface
    pallet420 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist846 place846 )
    ( available hoist846 )
    ( hoist-at hoist652 place652 )
    ( available hoist652 )
    ( hoist-at hoist527 place527 )
    ( available hoist527 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet609 place527 )
    ( surface-at crate609 place527 )
    ( on crate609 pallet609 )
    ( is-crate crate609 )
    ( clear crate609 )
    ( surface-at pallet491 place527 )
    ( surface-at crate491 place527 )
    ( on crate491 pallet491 )
    ( is-crate crate491 )
    ( clear crate491 )
    ( surface-at pallet420 place652 )
    ( surface-at crate420 place652 )
    ( on crate420 pallet420 )
    ( is-crate crate420 )
    ( clear crate420 )
  )
  ( :goal
    ( and
    )
  )
)
