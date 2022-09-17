( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place196 - place
    hoist196 - hoist
    place16 - place
    hoist16 - hoist
    place229 - place
    hoist229 - hoist
    place621 - place
    hoist621 - hoist
    place552 - place
    hoist552 - hoist
    place871 - place
    hoist871 - hoist
    place0 - place
    hoist0 - hoist
    crate868 - surface
    pallet868 - surface
    crate567 - surface
    pallet567 - surface
    crate179 - surface
    pallet179 - surface
    crate549 - surface
    pallet549 - surface
    crate331 - surface
    pallet331 - surface
    crate379 - surface
    pallet379 - surface
    crate973 - surface
    pallet973 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist196 place196 )
    ( available hoist196 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist229 place229 )
    ( available hoist229 )
    ( hoist-at hoist621 place621 )
    ( available hoist621 )
    ( hoist-at hoist552 place552 )
    ( available hoist552 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet868 place621 )
    ( surface-at crate868 place621 )
    ( on crate868 pallet868 )
    ( is-crate crate868 )
    ( clear crate868 )
    ( surface-at pallet567 place621 )
    ( surface-at crate567 place621 )
    ( on crate567 pallet567 )
    ( is-crate crate567 )
    ( clear crate567 )
    ( surface-at pallet179 place196 )
    ( surface-at crate179 place196 )
    ( on crate179 pallet179 )
    ( is-crate crate179 )
    ( clear crate179 )
    ( surface-at pallet549 place621 )
    ( surface-at crate549 place621 )
    ( on crate549 pallet549 )
    ( is-crate crate549 )
    ( clear crate549 )
    ( surface-at pallet331 place229 )
    ( surface-at crate331 place229 )
    ( on crate331 pallet331 )
    ( is-crate crate331 )
    ( clear crate331 )
    ( surface-at pallet379 place196 )
    ( surface-at crate379 place196 )
    ( on crate379 pallet379 )
    ( is-crate crate379 )
    ( clear crate379 )
    ( surface-at pallet973 place16 )
    ( surface-at crate973 place16 )
    ( on crate973 pallet973 )
    ( is-crate crate973 )
    ( clear crate973 )
  )
  ( :tasks
    ( Make-On crate868 pallet0 )    ( Make-On crate567 crate868 )    ( Make-On crate179 crate567 )    ( Make-On crate549 crate179 )    ( Make-On crate331 crate549 )    ( Make-On crate379 crate331 )    ( Make-On crate973 crate379 )  )
)
