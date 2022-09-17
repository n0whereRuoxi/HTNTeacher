( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place726 - place
    hoist726 - hoist
    place932 - place
    hoist932 - hoist
    place128 - place
    hoist128 - hoist
    place207 - place
    hoist207 - hoist
    place863 - place
    hoist863 - hoist
    place806 - place
    hoist806 - hoist
    place0 - place
    hoist0 - hoist
    crate565 - surface
    pallet565 - surface
    crate316 - surface
    pallet316 - surface
    crate952 - surface
    pallet952 - surface
    crate5 - surface
    pallet5 - surface
    crate739 - surface
    pallet739 - surface
    crate344 - surface
    pallet344 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist726 place726 )
    ( available hoist726 )
    ( hoist-at hoist932 place932 )
    ( available hoist932 )
    ( hoist-at hoist128 place128 )
    ( available hoist128 )
    ( hoist-at hoist207 place207 )
    ( available hoist207 )
    ( hoist-at hoist863 place863 )
    ( available hoist863 )
    ( hoist-at hoist806 place806 )
    ( available hoist806 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet565 place726 )
    ( surface-at crate565 place726 )
    ( on crate565 pallet565 )
    ( is-crate crate565 )
    ( clear crate565 )
    ( surface-at pallet316 place863 )
    ( surface-at crate316 place863 )
    ( on crate316 pallet316 )
    ( is-crate crate316 )
    ( clear crate316 )
    ( surface-at pallet952 place128 )
    ( surface-at crate952 place128 )
    ( on crate952 pallet952 )
    ( is-crate crate952 )
    ( clear crate952 )
    ( surface-at pallet5 place932 )
    ( surface-at crate5 place932 )
    ( on crate5 pallet5 )
    ( is-crate crate5 )
    ( clear crate5 )
    ( surface-at pallet739 place863 )
    ( surface-at crate739 place863 )
    ( on crate739 pallet739 )
    ( is-crate crate739 )
    ( clear crate739 )
    ( surface-at pallet344 place128 )
    ( surface-at crate344 place128 )
    ( on crate344 pallet344 )
    ( is-crate crate344 )
    ( clear crate344 )
  )
  ( :goal
    ( and
    )
  )
)
