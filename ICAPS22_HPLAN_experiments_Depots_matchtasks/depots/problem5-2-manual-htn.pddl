( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place982 - place
    hoist982 - hoist
    place449 - place
    hoist449 - hoist
    place71 - place
    hoist71 - hoist
    place890 - place
    hoist890 - hoist
    place853 - place
    hoist853 - hoist
    place476 - place
    hoist476 - hoist
    place881 - place
    hoist881 - hoist
    place997 - place
    hoist997 - hoist
    place866 - place
    hoist866 - hoist
    place0 - place
    hoist0 - hoist
    crate530 - surface
    pallet530 - surface
    crate405 - surface
    pallet405 - surface
    crate429 - surface
    pallet429 - surface
    crate158 - surface
    pallet158 - surface
    crate923 - surface
    pallet923 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist982 place982 )
    ( available hoist982 )
    ( hoist-at hoist449 place449 )
    ( available hoist449 )
    ( hoist-at hoist71 place71 )
    ( available hoist71 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist853 place853 )
    ( available hoist853 )
    ( hoist-at hoist476 place476 )
    ( available hoist476 )
    ( hoist-at hoist881 place881 )
    ( available hoist881 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist866 place866 )
    ( available hoist866 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet530 place476 )
    ( surface-at crate530 place476 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet405 place71 )
    ( surface-at crate405 place71 )
    ( on crate405 pallet405 )
    ( is-crate crate405 )
    ( clear crate405 )
    ( surface-at pallet429 place881 )
    ( surface-at crate429 place881 )
    ( on crate429 pallet429 )
    ( is-crate crate429 )
    ( clear crate429 )
    ( surface-at pallet158 place997 )
    ( surface-at crate158 place997 )
    ( on crate158 pallet158 )
    ( is-crate crate158 )
    ( clear crate158 )
    ( surface-at pallet923 place890 )
    ( surface-at crate923 place890 )
    ( on crate923 pallet923 )
    ( is-crate crate923 )
    ( clear crate923 )
  )
  ( :tasks
    ( Make-On crate530 pallet0 )    ( Make-On crate405 crate530 )    ( Make-On crate429 crate405 )    ( Make-On crate158 crate429 )    ( Make-On crate923 crate158 )  )
)
