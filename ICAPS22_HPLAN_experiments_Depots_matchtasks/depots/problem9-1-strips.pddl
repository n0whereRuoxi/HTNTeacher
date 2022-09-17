( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place162 - place
    hoist162 - hoist
    place224 - place
    hoist224 - hoist
    place748 - place
    hoist748 - hoist
    place375 - place
    hoist375 - hoist
    place443 - place
    hoist443 - hoist
    place579 - place
    hoist579 - hoist
    place901 - place
    hoist901 - hoist
    place858 - place
    hoist858 - hoist
    place981 - place
    hoist981 - hoist
    place318 - place
    hoist318 - hoist
    place404 - place
    hoist404 - hoist
    place863 - place
    hoist863 - hoist
    place243 - place
    hoist243 - hoist
    place968 - place
    hoist968 - hoist
    place864 - place
    hoist864 - hoist
    place0 - place
    hoist0 - hoist
    crate456 - surface
    pallet456 - surface
    crate26 - surface
    pallet26 - surface
    crate477 - surface
    pallet477 - surface
    crate419 - surface
    pallet419 - surface
    crate366 - surface
    pallet366 - surface
    crate285 - surface
    pallet285 - surface
    crate326 - surface
    pallet326 - surface
    crate275 - surface
    pallet275 - surface
    crate979 - surface
    pallet979 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist162 place162 )
    ( available hoist162 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist748 place748 )
    ( available hoist748 )
    ( hoist-at hoist375 place375 )
    ( available hoist375 )
    ( hoist-at hoist443 place443 )
    ( available hoist443 )
    ( hoist-at hoist579 place579 )
    ( available hoist579 )
    ( hoist-at hoist901 place901 )
    ( available hoist901 )
    ( hoist-at hoist858 place858 )
    ( available hoist858 )
    ( hoist-at hoist981 place981 )
    ( available hoist981 )
    ( hoist-at hoist318 place318 )
    ( available hoist318 )
    ( hoist-at hoist404 place404 )
    ( available hoist404 )
    ( hoist-at hoist863 place863 )
    ( available hoist863 )
    ( hoist-at hoist243 place243 )
    ( available hoist243 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist864 place864 )
    ( available hoist864 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet456 place443 )
    ( surface-at crate456 place443 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
    ( surface-at pallet26 place224 )
    ( surface-at crate26 place224 )
    ( on crate26 pallet26 )
    ( is-crate crate26 )
    ( clear crate26 )
    ( surface-at pallet477 place224 )
    ( surface-at crate477 place224 )
    ( on crate477 pallet477 )
    ( is-crate crate477 )
    ( clear crate477 )
    ( surface-at pallet419 place863 )
    ( surface-at crate419 place863 )
    ( on crate419 pallet419 )
    ( is-crate crate419 )
    ( clear crate419 )
    ( surface-at pallet366 place375 )
    ( surface-at crate366 place375 )
    ( on crate366 pallet366 )
    ( is-crate crate366 )
    ( clear crate366 )
    ( surface-at pallet285 place318 )
    ( surface-at crate285 place318 )
    ( on crate285 pallet285 )
    ( is-crate crate285 )
    ( clear crate285 )
    ( surface-at pallet326 place981 )
    ( surface-at crate326 place981 )
    ( on crate326 pallet326 )
    ( is-crate crate326 )
    ( clear crate326 )
    ( surface-at pallet275 place375 )
    ( surface-at crate275 place375 )
    ( on crate275 pallet275 )
    ( is-crate crate275 )
    ( clear crate275 )
    ( surface-at pallet979 place863 )
    ( surface-at crate979 place863 )
    ( on crate979 pallet979 )
    ( is-crate crate979 )
    ( clear crate979 )
  )
  ( :goal
    ( and
    )
  )
)
