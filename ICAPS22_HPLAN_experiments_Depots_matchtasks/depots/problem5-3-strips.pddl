( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place515 - place
    hoist515 - hoist
    place774 - place
    hoist774 - hoist
    place420 - place
    hoist420 - hoist
    place188 - place
    hoist188 - hoist
    place435 - place
    hoist435 - hoist
    place0 - place
    hoist0 - hoist
    crate868 - surface
    pallet868 - surface
    crate260 - surface
    pallet260 - surface
    crate343 - surface
    pallet343 - surface
    crate968 - surface
    pallet968 - surface
    crate420 - surface
    pallet420 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist515 place515 )
    ( available hoist515 )
    ( hoist-at hoist774 place774 )
    ( available hoist774 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist188 place188 )
    ( available hoist188 )
    ( hoist-at hoist435 place435 )
    ( available hoist435 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet868 place420 )
    ( surface-at crate868 place420 )
    ( on crate868 pallet868 )
    ( is-crate crate868 )
    ( clear crate868 )
    ( surface-at pallet260 place188 )
    ( surface-at crate260 place188 )
    ( on crate260 pallet260 )
    ( is-crate crate260 )
    ( clear crate260 )
    ( surface-at pallet343 place188 )
    ( surface-at crate343 place188 )
    ( on crate343 pallet343 )
    ( is-crate crate343 )
    ( clear crate343 )
    ( surface-at pallet968 place420 )
    ( surface-at crate968 place420 )
    ( on crate968 pallet968 )
    ( is-crate crate968 )
    ( clear crate968 )
    ( surface-at pallet420 place515 )
    ( surface-at crate420 place515 )
    ( on crate420 pallet420 )
    ( is-crate crate420 )
    ( clear crate420 )
  )
  ( :goal
    ( and
    )
  )
)
