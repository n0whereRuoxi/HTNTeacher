( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place905 - place
    hoist905 - hoist
    place575 - place
    hoist575 - hoist
    place343 - place
    hoist343 - hoist
    place438 - place
    hoist438 - hoist
    place586 - place
    hoist586 - hoist
    place358 - place
    hoist358 - hoist
    place677 - place
    hoist677 - hoist
    place376 - place
    hoist376 - hoist
    place786 - place
    hoist786 - hoist
    place753 - place
    hoist753 - hoist
    place90 - place
    hoist90 - hoist
    place324 - place
    hoist324 - hoist
    place948 - place
    hoist948 - hoist
    place339 - place
    hoist339 - hoist
    place553 - place
    hoist553 - hoist
    place0 - place
    hoist0 - hoist
    crate232 - surface
    pallet232 - surface
    crate254 - surface
    pallet254 - surface
    crate898 - surface
    pallet898 - surface
    crate432 - surface
    pallet432 - surface
    crate984 - surface
    pallet984 - surface
    crate958 - surface
    pallet958 - surface
    crate882 - surface
    pallet882 - surface
    crate203 - surface
    pallet203 - surface
    crate579 - surface
    pallet579 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist905 place905 )
    ( available hoist905 )
    ( hoist-at hoist575 place575 )
    ( available hoist575 )
    ( hoist-at hoist343 place343 )
    ( available hoist343 )
    ( hoist-at hoist438 place438 )
    ( available hoist438 )
    ( hoist-at hoist586 place586 )
    ( available hoist586 )
    ( hoist-at hoist358 place358 )
    ( available hoist358 )
    ( hoist-at hoist677 place677 )
    ( available hoist677 )
    ( hoist-at hoist376 place376 )
    ( available hoist376 )
    ( hoist-at hoist786 place786 )
    ( available hoist786 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist90 place90 )
    ( available hoist90 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist948 place948 )
    ( available hoist948 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist553 place553 )
    ( available hoist553 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet232 place586 )
    ( surface-at crate232 place586 )
    ( on crate232 pallet232 )
    ( is-crate crate232 )
    ( clear crate232 )
    ( surface-at pallet254 place786 )
    ( surface-at crate254 place786 )
    ( on crate254 pallet254 )
    ( is-crate crate254 )
    ( clear crate254 )
    ( surface-at pallet898 place553 )
    ( surface-at crate898 place553 )
    ( on crate898 pallet898 )
    ( is-crate crate898 )
    ( clear crate898 )
    ( surface-at pallet432 place343 )
    ( surface-at crate432 place343 )
    ( on crate432 pallet432 )
    ( is-crate crate432 )
    ( clear crate432 )
    ( surface-at pallet984 place324 )
    ( surface-at crate984 place324 )
    ( on crate984 pallet984 )
    ( is-crate crate984 )
    ( clear crate984 )
    ( surface-at pallet958 place753 )
    ( surface-at crate958 place753 )
    ( on crate958 pallet958 )
    ( is-crate crate958 )
    ( clear crate958 )
    ( surface-at pallet882 place376 )
    ( surface-at crate882 place376 )
    ( on crate882 pallet882 )
    ( is-crate crate882 )
    ( clear crate882 )
    ( surface-at pallet203 place324 )
    ( surface-at crate203 place324 )
    ( on crate203 pallet203 )
    ( is-crate crate203 )
    ( clear crate203 )
    ( surface-at pallet579 place575 )
    ( surface-at crate579 place575 )
    ( on crate579 pallet579 )
    ( is-crate crate579 )
    ( clear crate579 )
  )
  ( :goal
    ( and
    )
  )
)
