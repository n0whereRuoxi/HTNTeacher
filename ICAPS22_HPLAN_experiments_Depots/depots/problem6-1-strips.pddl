( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place33 - place
    hoist33 - hoist
    place206 - place
    hoist206 - hoist
    place754 - place
    hoist754 - hoist
    place967 - place
    hoist967 - hoist
    place0 - place
    hoist0 - hoist
    crate84 - surface
    pallet84 - surface
    crate462 - surface
    pallet462 - surface
    crate762 - surface
    pallet762 - surface
    crate544 - surface
    pallet544 - surface
    crate475 - surface
    pallet475 - surface
    crate838 - surface
    pallet838 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist754 place754 )
    ( available hoist754 )
    ( hoist-at hoist967 place967 )
    ( available hoist967 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet84 place33 )
    ( surface-at crate84 place33 )
    ( on crate84 pallet84 )
    ( is-crate crate84 )
    ( clear crate84 )
    ( surface-at pallet462 place754 )
    ( surface-at crate462 place754 )
    ( on crate462 pallet462 )
    ( is-crate crate462 )
    ( clear crate462 )
    ( surface-at pallet762 place33 )
    ( surface-at crate762 place33 )
    ( on crate762 pallet762 )
    ( is-crate crate762 )
    ( clear crate762 )
    ( surface-at pallet544 place33 )
    ( surface-at crate544 place33 )
    ( on crate544 pallet544 )
    ( is-crate crate544 )
    ( clear crate544 )
    ( surface-at pallet475 place754 )
    ( surface-at crate475 place754 )
    ( on crate475 pallet475 )
    ( is-crate crate475 )
    ( clear crate475 )
    ( surface-at pallet838 place967 )
    ( surface-at crate838 place967 )
    ( on crate838 pallet838 )
    ( is-crate crate838 )
    ( clear crate838 )
  )
  ( :goal
    ( and
    )
  )
)
