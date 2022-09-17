( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place282 - place
    hoist282 - hoist
    place855 - place
    hoist855 - hoist
    place0 - place
    hoist0 - hoist
    crate597 - surface
    pallet597 - surface
    crate763 - surface
    pallet763 - surface
    crate151 - surface
    pallet151 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist282 place282 )
    ( available hoist282 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet597 place855 )
    ( surface-at crate597 place855 )
    ( on crate597 pallet597 )
    ( is-crate crate597 )
    ( clear crate597 )
    ( surface-at pallet763 place855 )
    ( surface-at crate763 place855 )
    ( on crate763 pallet763 )
    ( is-crate crate763 )
    ( clear crate763 )
    ( surface-at pallet151 place282 )
    ( surface-at crate151 place282 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
  )
  ( :tasks
    ( Make-On crate597 pallet0 )    ( Make-On crate763 crate597 )    ( Make-On crate151 crate763 )  )
)
