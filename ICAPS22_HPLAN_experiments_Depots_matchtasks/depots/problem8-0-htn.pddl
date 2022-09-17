( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place603 - place
    hoist603 - hoist
    place394 - place
    hoist394 - hoist
    place518 - place
    hoist518 - hoist
    place505 - place
    hoist505 - hoist
    place551 - place
    hoist551 - hoist
    place399 - place
    hoist399 - hoist
    place0 - place
    hoist0 - hoist
    crate623 - surface
    pallet623 - surface
    crate205 - surface
    pallet205 - surface
    crate815 - surface
    pallet815 - surface
    crate425 - surface
    pallet425 - surface
    crate86 - surface
    pallet86 - surface
    crate858 - surface
    pallet858 - surface
    crate277 - surface
    pallet277 - surface
    crate487 - surface
    pallet487 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist518 place518 )
    ( available hoist518 )
    ( hoist-at hoist505 place505 )
    ( available hoist505 )
    ( hoist-at hoist551 place551 )
    ( available hoist551 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet623 place394 )
    ( surface-at crate623 place394 )
    ( on crate623 pallet623 )
    ( is-crate crate623 )
    ( clear crate623 )
    ( surface-at pallet205 place394 )
    ( surface-at crate205 place394 )
    ( on crate205 pallet205 )
    ( is-crate crate205 )
    ( clear crate205 )
    ( surface-at pallet815 place399 )
    ( surface-at crate815 place399 )
    ( on crate815 pallet815 )
    ( is-crate crate815 )
    ( clear crate815 )
    ( surface-at pallet425 place603 )
    ( surface-at crate425 place603 )
    ( on crate425 pallet425 )
    ( is-crate crate425 )
    ( clear crate425 )
    ( surface-at pallet86 place603 )
    ( surface-at crate86 place603 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet858 place505 )
    ( surface-at crate858 place505 )
    ( on crate858 pallet858 )
    ( is-crate crate858 )
    ( clear crate858 )
    ( surface-at pallet277 place551 )
    ( surface-at crate277 place551 )
    ( on crate277 pallet277 )
    ( is-crate crate277 )
    ( clear crate277 )
    ( surface-at pallet487 place399 )
    ( surface-at crate487 place399 )
    ( on crate487 pallet487 )
    ( is-crate crate487 )
    ( clear crate487 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate623 crate205 crate815 crate425 crate86 crate858 crate277 crate487 )
  )
)
