( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place465 - place
    hoist465 - hoist
    place670 - place
    hoist670 - hoist
    place317 - place
    hoist317 - hoist
    place481 - place
    hoist481 - hoist
    place571 - place
    hoist571 - hoist
    place201 - place
    hoist201 - hoist
    place713 - place
    hoist713 - hoist
    place94 - place
    hoist94 - hoist
    place490 - place
    hoist490 - hoist
    place0 - place
    hoist0 - hoist
    crate48 - surface
    pallet48 - surface
    crate58 - surface
    pallet58 - surface
    crate552 - surface
    pallet552 - surface
    crate79 - surface
    pallet79 - surface
    crate284 - surface
    pallet284 - surface
    crate449 - surface
    pallet449 - surface
    crate566 - surface
    pallet566 - surface
    crate419 - surface
    pallet419 - surface
    crate775 - surface
    pallet775 - surface
    crate456 - surface
    pallet456 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist481 place481 )
    ( available hoist481 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist201 place201 )
    ( available hoist201 )
    ( hoist-at hoist713 place713 )
    ( available hoist713 )
    ( hoist-at hoist94 place94 )
    ( available hoist94 )
    ( hoist-at hoist490 place490 )
    ( available hoist490 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet48 place571 )
    ( surface-at crate48 place571 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet58 place571 )
    ( surface-at crate58 place571 )
    ( on crate58 pallet58 )
    ( is-crate crate58 )
    ( clear crate58 )
    ( surface-at pallet552 place571 )
    ( surface-at crate552 place571 )
    ( on crate552 pallet552 )
    ( is-crate crate552 )
    ( clear crate552 )
    ( surface-at pallet79 place201 )
    ( surface-at crate79 place201 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet284 place713 )
    ( surface-at crate284 place713 )
    ( on crate284 pallet284 )
    ( is-crate crate284 )
    ( clear crate284 )
    ( surface-at pallet449 place670 )
    ( surface-at crate449 place670 )
    ( on crate449 pallet449 )
    ( is-crate crate449 )
    ( clear crate449 )
    ( surface-at pallet566 place481 )
    ( surface-at crate566 place481 )
    ( on crate566 pallet566 )
    ( is-crate crate566 )
    ( clear crate566 )
    ( surface-at pallet419 place571 )
    ( surface-at crate419 place571 )
    ( on crate419 pallet419 )
    ( is-crate crate419 )
    ( clear crate419 )
    ( surface-at pallet775 place481 )
    ( surface-at crate775 place481 )
    ( on crate775 pallet775 )
    ( is-crate crate775 )
    ( clear crate775 )
    ( surface-at pallet456 place713 )
    ( surface-at crate456 place713 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
  )
  ( :goal
    ( and
    )
  )
)
