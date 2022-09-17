( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place557 - place
    hoist557 - hoist
    place731 - place
    hoist731 - hoist
    place51 - place
    hoist51 - hoist
    place206 - place
    hoist206 - hoist
    place689 - place
    hoist689 - hoist
    place91 - place
    hoist91 - hoist
    place317 - place
    hoist317 - hoist
    place0 - place
    hoist0 - hoist
    crate460 - surface
    pallet460 - surface
    crate364 - surface
    pallet364 - surface
    crate621 - surface
    pallet621 - surface
    crate671 - surface
    pallet671 - surface
    crate405 - surface
    pallet405 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist731 place731 )
    ( available hoist731 )
    ( hoist-at hoist51 place51 )
    ( available hoist51 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist689 place689 )
    ( available hoist689 )
    ( hoist-at hoist91 place91 )
    ( available hoist91 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet460 place557 )
    ( surface-at crate460 place557 )
    ( on crate460 pallet460 )
    ( is-crate crate460 )
    ( clear crate460 )
    ( surface-at pallet364 place206 )
    ( surface-at crate364 place206 )
    ( on crate364 pallet364 )
    ( is-crate crate364 )
    ( clear crate364 )
    ( surface-at pallet621 place51 )
    ( surface-at crate621 place51 )
    ( on crate621 pallet621 )
    ( is-crate crate621 )
    ( clear crate621 )
    ( surface-at pallet671 place51 )
    ( surface-at crate671 place51 )
    ( on crate671 pallet671 )
    ( is-crate crate671 )
    ( clear crate671 )
    ( surface-at pallet405 place731 )
    ( surface-at crate405 place731 )
    ( on crate405 pallet405 )
    ( is-crate crate405 )
    ( clear crate405 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate460 crate364 crate621 crate671 crate405 )
  )
)
