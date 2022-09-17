( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place84 - place
    hoist84 - hoist
    place997 - place
    hoist997 - hoist
    place925 - place
    hoist925 - hoist
    place243 - place
    hoist243 - hoist
    place871 - place
    hoist871 - hoist
    place236 - place
    hoist236 - hoist
    place681 - place
    hoist681 - hoist
    place0 - place
    hoist0 - hoist
    crate687 - surface
    pallet687 - surface
    crate224 - surface
    pallet224 - surface
    crate648 - surface
    pallet648 - surface
    crate247 - surface
    pallet247 - surface
    crate579 - surface
    pallet579 - surface
    crate838 - surface
    pallet838 - surface
    crate670 - surface
    pallet670 - surface
    crate371 - surface
    pallet371 - surface
    crate494 - surface
    pallet494 - surface
    crate867 - surface
    pallet867 - surface
    crate287 - surface
    pallet287 - surface
    crate565 - surface
    pallet565 - surface
    crate235 - surface
    pallet235 - surface
    crate833 - surface
    pallet833 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist84 place84 )
    ( available hoist84 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist925 place925 )
    ( available hoist925 )
    ( hoist-at hoist243 place243 )
    ( available hoist243 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist236 place236 )
    ( available hoist236 )
    ( hoist-at hoist681 place681 )
    ( available hoist681 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet687 place997 )
    ( surface-at crate687 place997 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet224 place84 )
    ( surface-at crate224 place84 )
    ( on crate224 pallet224 )
    ( is-crate crate224 )
    ( clear crate224 )
    ( surface-at pallet648 place236 )
    ( surface-at crate648 place236 )
    ( on crate648 pallet648 )
    ( is-crate crate648 )
    ( clear crate648 )
    ( surface-at pallet247 place84 )
    ( surface-at crate247 place84 )
    ( on crate247 pallet247 )
    ( is-crate crate247 )
    ( clear crate247 )
    ( surface-at pallet579 place871 )
    ( surface-at crate579 place871 )
    ( on crate579 pallet579 )
    ( is-crate crate579 )
    ( clear crate579 )
    ( surface-at pallet838 place997 )
    ( surface-at crate838 place997 )
    ( on crate838 pallet838 )
    ( is-crate crate838 )
    ( clear crate838 )
    ( surface-at pallet670 place925 )
    ( surface-at crate670 place925 )
    ( on crate670 pallet670 )
    ( is-crate crate670 )
    ( clear crate670 )
    ( surface-at pallet371 place236 )
    ( surface-at crate371 place236 )
    ( on crate371 pallet371 )
    ( is-crate crate371 )
    ( clear crate371 )
    ( surface-at pallet494 place84 )
    ( surface-at crate494 place84 )
    ( on crate494 pallet494 )
    ( is-crate crate494 )
    ( clear crate494 )
    ( surface-at pallet867 place84 )
    ( surface-at crate867 place84 )
    ( on crate867 pallet867 )
    ( is-crate crate867 )
    ( clear crate867 )
    ( surface-at pallet287 place997 )
    ( surface-at crate287 place997 )
    ( on crate287 pallet287 )
    ( is-crate crate287 )
    ( clear crate287 )
    ( surface-at pallet565 place243 )
    ( surface-at crate565 place243 )
    ( on crate565 pallet565 )
    ( is-crate crate565 )
    ( clear crate565 )
    ( surface-at pallet235 place871 )
    ( surface-at crate235 place871 )
    ( on crate235 pallet235 )
    ( is-crate crate235 )
    ( clear crate235 )
    ( surface-at pallet833 place997 )
    ( surface-at crate833 place997 )
    ( on crate833 pallet833 )
    ( is-crate crate833 )
    ( clear crate833 )
  )
  ( :goal
    ( and
    )
  )
)
