( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place174 - place
    hoist174 - hoist
    place879 - place
    hoist879 - hoist
    place0 - place
    hoist0 - hoist
    crate209 - surface
    pallet209 - surface
    crate44 - surface
    pallet44 - surface
    crate380 - surface
    pallet380 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist174 place174 )
    ( available hoist174 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet209 place174 )
    ( surface-at crate209 place174 )
    ( on crate209 pallet209 )
    ( is-crate crate209 )
    ( clear crate209 )
    ( surface-at pallet44 place879 )
    ( surface-at crate44 place879 )
    ( on crate44 pallet44 )
    ( is-crate crate44 )
    ( clear crate44 )
    ( surface-at pallet380 place174 )
    ( surface-at crate380 place174 )
    ( on crate380 pallet380 )
    ( is-crate crate380 )
    ( clear crate380 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate209 crate44 crate380 )
  )
)
