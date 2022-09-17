( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place773 - place
    hoist773 - hoist
    place419 - place
    hoist419 - hoist
    place451 - place
    hoist451 - hoist
    place610 - place
    hoist610 - hoist
    place208 - place
    hoist208 - hoist
    place265 - place
    hoist265 - hoist
    place902 - place
    hoist902 - hoist
    place151 - place
    hoist151 - hoist
    place489 - place
    hoist489 - hoist
    place250 - place
    hoist250 - hoist
    place289 - place
    hoist289 - hoist
    place843 - place
    hoist843 - hoist
    place934 - place
    hoist934 - hoist
    place29 - place
    hoist29 - hoist
    place0 - place
    hoist0 - hoist
    crate202 - surface
    pallet202 - surface
    crate925 - surface
    pallet925 - surface
    crate381 - surface
    pallet381 - surface
    crate319 - surface
    pallet319 - surface
    crate107 - surface
    pallet107 - surface
    crate664 - surface
    pallet664 - surface
    crate264 - surface
    pallet264 - surface
    crate761 - surface
    pallet761 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist419 place419 )
    ( available hoist419 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist610 place610 )
    ( available hoist610 )
    ( hoist-at hoist208 place208 )
    ( available hoist208 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist902 place902 )
    ( available hoist902 )
    ( hoist-at hoist151 place151 )
    ( available hoist151 )
    ( hoist-at hoist489 place489 )
    ( available hoist489 )
    ( hoist-at hoist250 place250 )
    ( available hoist250 )
    ( hoist-at hoist289 place289 )
    ( available hoist289 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist934 place934 )
    ( available hoist934 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet202 place265 )
    ( surface-at crate202 place265 )
    ( on crate202 pallet202 )
    ( is-crate crate202 )
    ( clear crate202 )
    ( surface-at pallet925 place265 )
    ( surface-at crate925 place265 )
    ( on crate925 pallet925 )
    ( is-crate crate925 )
    ( clear crate925 )
    ( surface-at pallet381 place265 )
    ( surface-at crate381 place265 )
    ( on crate381 pallet381 )
    ( is-crate crate381 )
    ( clear crate381 )
    ( surface-at pallet319 place610 )
    ( surface-at crate319 place610 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet107 place934 )
    ( surface-at crate107 place934 )
    ( on crate107 pallet107 )
    ( is-crate crate107 )
    ( clear crate107 )
    ( surface-at pallet664 place250 )
    ( surface-at crate664 place250 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet264 place265 )
    ( surface-at crate264 place265 )
    ( on crate264 pallet264 )
    ( is-crate crate264 )
    ( clear crate264 )
    ( surface-at pallet761 place250 )
    ( surface-at crate761 place250 )
    ( on crate761 pallet761 )
    ( is-crate crate761 )
    ( clear crate761 )
  )
  ( :goal
    ( and
    )
  )
)
