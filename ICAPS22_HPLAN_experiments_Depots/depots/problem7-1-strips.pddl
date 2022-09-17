( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place629 - place
    hoist629 - hoist
    place520 - place
    hoist520 - hoist
    place713 - place
    hoist713 - hoist
    place206 - place
    hoist206 - hoist
    place381 - place
    hoist381 - hoist
    place981 - place
    hoist981 - hoist
    place303 - place
    hoist303 - hoist
    place257 - place
    hoist257 - hoist
    place631 - place
    hoist631 - hoist
    place543 - place
    hoist543 - hoist
    place881 - place
    hoist881 - hoist
    place34 - place
    hoist34 - hoist
    place0 - place
    hoist0 - hoist
    crate656 - surface
    pallet656 - surface
    crate984 - surface
    pallet984 - surface
    crate868 - surface
    pallet868 - surface
    crate705 - surface
    pallet705 - surface
    crate685 - surface
    pallet685 - surface
    crate293 - surface
    pallet293 - surface
    crate739 - surface
    pallet739 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist520 place520 )
    ( available hoist520 )
    ( hoist-at hoist713 place713 )
    ( available hoist713 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist381 place381 )
    ( available hoist381 )
    ( hoist-at hoist981 place981 )
    ( available hoist981 )
    ( hoist-at hoist303 place303 )
    ( available hoist303 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist631 place631 )
    ( available hoist631 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist881 place881 )
    ( available hoist881 )
    ( hoist-at hoist34 place34 )
    ( available hoist34 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet656 place34 )
    ( surface-at crate656 place34 )
    ( on crate656 pallet656 )
    ( is-crate crate656 )
    ( clear crate656 )
    ( surface-at pallet984 place631 )
    ( surface-at crate984 place631 )
    ( on crate984 pallet984 )
    ( is-crate crate984 )
    ( clear crate984 )
    ( surface-at pallet868 place629 )
    ( surface-at crate868 place629 )
    ( on crate868 pallet868 )
    ( is-crate crate868 )
    ( clear crate868 )
    ( surface-at pallet705 place303 )
    ( surface-at crate705 place303 )
    ( on crate705 pallet705 )
    ( is-crate crate705 )
    ( clear crate705 )
    ( surface-at pallet685 place881 )
    ( surface-at crate685 place881 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
    ( surface-at pallet293 place543 )
    ( surface-at crate293 place543 )
    ( on crate293 pallet293 )
    ( is-crate crate293 )
    ( clear crate293 )
    ( surface-at pallet739 place520 )
    ( surface-at crate739 place520 )
    ( on crate739 pallet739 )
    ( is-crate crate739 )
    ( clear crate739 )
  )
  ( :goal
    ( and
    )
  )
)
