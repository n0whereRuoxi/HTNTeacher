( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place525 - place
    hoist525 - hoist
    place225 - place
    hoist225 - hoist
    place62 - place
    hoist62 - hoist
    place743 - place
    hoist743 - hoist
    place547 - place
    hoist547 - hoist
    place585 - place
    hoist585 - hoist
    place692 - place
    hoist692 - hoist
    place377 - place
    hoist377 - hoist
    place780 - place
    hoist780 - hoist
    place0 - place
    hoist0 - hoist
    crate307 - surface
    pallet307 - surface
    crate631 - surface
    pallet631 - surface
    crate213 - surface
    pallet213 - surface
    crate642 - surface
    pallet642 - surface
    crate209 - surface
    pallet209 - surface
    crate342 - surface
    pallet342 - surface
    crate41 - surface
    pallet41 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist525 place525 )
    ( available hoist525 )
    ( hoist-at hoist225 place225 )
    ( available hoist225 )
    ( hoist-at hoist62 place62 )
    ( available hoist62 )
    ( hoist-at hoist743 place743 )
    ( available hoist743 )
    ( hoist-at hoist547 place547 )
    ( available hoist547 )
    ( hoist-at hoist585 place585 )
    ( available hoist585 )
    ( hoist-at hoist692 place692 )
    ( available hoist692 )
    ( hoist-at hoist377 place377 )
    ( available hoist377 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet307 place780 )
    ( surface-at crate307 place780 )
    ( on crate307 pallet307 )
    ( is-crate crate307 )
    ( clear crate307 )
    ( surface-at pallet631 place780 )
    ( surface-at crate631 place780 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
    ( surface-at pallet213 place743 )
    ( surface-at crate213 place743 )
    ( on crate213 pallet213 )
    ( is-crate crate213 )
    ( clear crate213 )
    ( surface-at pallet642 place525 )
    ( surface-at crate642 place525 )
    ( on crate642 pallet642 )
    ( is-crate crate642 )
    ( clear crate642 )
    ( surface-at pallet209 place547 )
    ( surface-at crate209 place547 )
    ( on crate209 pallet209 )
    ( is-crate crate209 )
    ( clear crate209 )
    ( surface-at pallet342 place585 )
    ( surface-at crate342 place585 )
    ( on crate342 pallet342 )
    ( is-crate crate342 )
    ( clear crate342 )
    ( surface-at pallet41 place547 )
    ( surface-at crate41 place547 )
    ( on crate41 pallet41 )
    ( is-crate crate41 )
    ( clear crate41 )
  )
  ( :goal
    ( and
    )
  )
)
