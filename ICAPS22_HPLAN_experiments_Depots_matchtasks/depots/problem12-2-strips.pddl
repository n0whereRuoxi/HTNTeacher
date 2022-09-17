( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place811 - place
    hoist811 - hoist
    place255 - place
    hoist255 - hoist
    place486 - place
    hoist486 - hoist
    place740 - place
    hoist740 - hoist
    place442 - place
    hoist442 - hoist
    place325 - place
    hoist325 - hoist
    place591 - place
    hoist591 - hoist
    place101 - place
    hoist101 - hoist
    place220 - place
    hoist220 - hoist
    place973 - place
    hoist973 - hoist
    place267 - place
    hoist267 - hoist
    place430 - place
    hoist430 - hoist
    place604 - place
    hoist604 - hoist
    place22 - place
    hoist22 - hoist
    place173 - place
    hoist173 - hoist
    place433 - place
    hoist433 - hoist
    place972 - place
    hoist972 - hoist
    place434 - place
    hoist434 - hoist
    place769 - place
    hoist769 - hoist
    place344 - place
    hoist344 - hoist
    place105 - place
    hoist105 - hoist
    place0 - place
    hoist0 - hoist
    crate918 - surface
    pallet918 - surface
    crate684 - surface
    pallet684 - surface
    crate742 - surface
    pallet742 - surface
    crate822 - surface
    pallet822 - surface
    crate365 - surface
    pallet365 - surface
    crate357 - surface
    pallet357 - surface
    crate368 - surface
    pallet368 - surface
    crate208 - surface
    pallet208 - surface
    crate48 - surface
    pallet48 - surface
    crate345 - surface
    pallet345 - surface
    crate29 - surface
    pallet29 - surface
    crate98 - surface
    pallet98 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist811 place811 )
    ( available hoist811 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist486 place486 )
    ( available hoist486 )
    ( hoist-at hoist740 place740 )
    ( available hoist740 )
    ( hoist-at hoist442 place442 )
    ( available hoist442 )
    ( hoist-at hoist325 place325 )
    ( available hoist325 )
    ( hoist-at hoist591 place591 )
    ( available hoist591 )
    ( hoist-at hoist101 place101 )
    ( available hoist101 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist973 place973 )
    ( available hoist973 )
    ( hoist-at hoist267 place267 )
    ( available hoist267 )
    ( hoist-at hoist430 place430 )
    ( available hoist430 )
    ( hoist-at hoist604 place604 )
    ( available hoist604 )
    ( hoist-at hoist22 place22 )
    ( available hoist22 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist433 place433 )
    ( available hoist433 )
    ( hoist-at hoist972 place972 )
    ( available hoist972 )
    ( hoist-at hoist434 place434 )
    ( available hoist434 )
    ( hoist-at hoist769 place769 )
    ( available hoist769 )
    ( hoist-at hoist344 place344 )
    ( available hoist344 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet918 place769 )
    ( surface-at crate918 place769 )
    ( on crate918 pallet918 )
    ( is-crate crate918 )
    ( clear crate918 )
    ( surface-at pallet684 place267 )
    ( surface-at crate684 place267 )
    ( on crate684 pallet684 )
    ( is-crate crate684 )
    ( clear crate684 )
    ( surface-at pallet742 place769 )
    ( surface-at crate742 place769 )
    ( on crate742 pallet742 )
    ( is-crate crate742 )
    ( clear crate742 )
    ( surface-at pallet822 place811 )
    ( surface-at crate822 place811 )
    ( on crate822 pallet822 )
    ( is-crate crate822 )
    ( clear crate822 )
    ( surface-at pallet365 place973 )
    ( surface-at crate365 place973 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet357 place769 )
    ( surface-at crate357 place769 )
    ( on crate357 pallet357 )
    ( is-crate crate357 )
    ( clear crate357 )
    ( surface-at pallet368 place255 )
    ( surface-at crate368 place255 )
    ( on crate368 pallet368 )
    ( is-crate crate368 )
    ( clear crate368 )
    ( surface-at pallet208 place101 )
    ( surface-at crate208 place101 )
    ( on crate208 pallet208 )
    ( is-crate crate208 )
    ( clear crate208 )
    ( surface-at pallet48 place22 )
    ( surface-at crate48 place22 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet345 place591 )
    ( surface-at crate345 place591 )
    ( on crate345 pallet345 )
    ( is-crate crate345 )
    ( clear crate345 )
    ( surface-at pallet29 place220 )
    ( surface-at crate29 place220 )
    ( on crate29 pallet29 )
    ( is-crate crate29 )
    ( clear crate29 )
    ( surface-at pallet98 place972 )
    ( surface-at crate98 place972 )
    ( on crate98 pallet98 )
    ( is-crate crate98 )
    ( clear crate98 )
  )
  ( :goal
    ( and
    )
  )
)
