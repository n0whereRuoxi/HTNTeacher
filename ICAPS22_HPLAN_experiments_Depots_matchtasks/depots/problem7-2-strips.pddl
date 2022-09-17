( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place795 - place
    hoist795 - hoist
    place234 - place
    hoist234 - hoist
    place624 - place
    hoist624 - hoist
    place565 - place
    hoist565 - hoist
    place907 - place
    hoist907 - hoist
    place590 - place
    hoist590 - hoist
    place374 - place
    hoist374 - hoist
    place0 - place
    hoist0 - hoist
    crate764 - surface
    pallet764 - surface
    crate958 - surface
    pallet958 - surface
    crate35 - surface
    pallet35 - surface
    crate549 - surface
    pallet549 - surface
    crate153 - surface
    pallet153 - surface
    crate330 - surface
    pallet330 - surface
    crate755 - surface
    pallet755 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist795 place795 )
    ( available hoist795 )
    ( hoist-at hoist234 place234 )
    ( available hoist234 )
    ( hoist-at hoist624 place624 )
    ( available hoist624 )
    ( hoist-at hoist565 place565 )
    ( available hoist565 )
    ( hoist-at hoist907 place907 )
    ( available hoist907 )
    ( hoist-at hoist590 place590 )
    ( available hoist590 )
    ( hoist-at hoist374 place374 )
    ( available hoist374 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet764 place234 )
    ( surface-at crate764 place234 )
    ( on crate764 pallet764 )
    ( is-crate crate764 )
    ( clear crate764 )
    ( surface-at pallet958 place234 )
    ( surface-at crate958 place234 )
    ( on crate958 pallet958 )
    ( is-crate crate958 )
    ( clear crate958 )
    ( surface-at pallet35 place374 )
    ( surface-at crate35 place374 )
    ( on crate35 pallet35 )
    ( is-crate crate35 )
    ( clear crate35 )
    ( surface-at pallet549 place374 )
    ( surface-at crate549 place374 )
    ( on crate549 pallet549 )
    ( is-crate crate549 )
    ( clear crate549 )
    ( surface-at pallet153 place234 )
    ( surface-at crate153 place234 )
    ( on crate153 pallet153 )
    ( is-crate crate153 )
    ( clear crate153 )
    ( surface-at pallet330 place795 )
    ( surface-at crate330 place795 )
    ( on crate330 pallet330 )
    ( is-crate crate330 )
    ( clear crate330 )
    ( surface-at pallet755 place374 )
    ( surface-at crate755 place374 )
    ( on crate755 pallet755 )
    ( is-crate crate755 )
    ( clear crate755 )
  )
  ( :goal
    ( and
    )
  )
)
