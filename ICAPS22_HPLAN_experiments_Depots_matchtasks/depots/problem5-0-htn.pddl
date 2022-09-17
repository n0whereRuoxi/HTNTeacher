( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place328 - place
    hoist328 - hoist
    place420 - place
    hoist420 - hoist
    place224 - place
    hoist224 - hoist
    place281 - place
    hoist281 - hoist
    place356 - place
    hoist356 - hoist
    place773 - place
    hoist773 - hoist
    place331 - place
    hoist331 - hoist
    place409 - place
    hoist409 - hoist
    place75 - place
    hoist75 - hoist
    place418 - place
    hoist418 - hoist
    place0 - place
    hoist0 - hoist
    crate106 - surface
    pallet106 - surface
    crate191 - surface
    pallet191 - surface
    crate721 - surface
    pallet721 - surface
    crate133 - surface
    pallet133 - surface
    crate841 - surface
    pallet841 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist328 place328 )
    ( available hoist328 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist281 place281 )
    ( available hoist281 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist331 place331 )
    ( available hoist331 )
    ( hoist-at hoist409 place409 )
    ( available hoist409 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet106 place331 )
    ( surface-at crate106 place331 )
    ( on crate106 pallet106 )
    ( is-crate crate106 )
    ( clear crate106 )
    ( surface-at pallet191 place224 )
    ( surface-at crate191 place224 )
    ( on crate191 pallet191 )
    ( is-crate crate191 )
    ( clear crate191 )
    ( surface-at pallet721 place328 )
    ( surface-at crate721 place328 )
    ( on crate721 pallet721 )
    ( is-crate crate721 )
    ( clear crate721 )
    ( surface-at pallet133 place331 )
    ( surface-at crate133 place331 )
    ( on crate133 pallet133 )
    ( is-crate crate133 )
    ( clear crate133 )
    ( surface-at pallet841 place75 )
    ( surface-at crate841 place75 )
    ( on crate841 pallet841 )
    ( is-crate crate841 )
    ( clear crate841 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate106 crate191 crate721 crate133 crate841 )
  )
)
