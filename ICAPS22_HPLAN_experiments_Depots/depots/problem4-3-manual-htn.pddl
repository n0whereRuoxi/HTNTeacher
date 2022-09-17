( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place997 - place
    hoist997 - hoist
    place100 - place
    hoist100 - hoist
    place337 - place
    hoist337 - hoist
    place252 - place
    hoist252 - hoist
    place724 - place
    hoist724 - hoist
    place682 - place
    hoist682 - hoist
    place896 - place
    hoist896 - hoist
    place0 - place
    hoist0 - hoist
    crate76 - surface
    pallet76 - surface
    crate989 - surface
    pallet989 - surface
    crate259 - surface
    pallet259 - surface
    crate268 - surface
    pallet268 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist100 place100 )
    ( available hoist100 )
    ( hoist-at hoist337 place337 )
    ( available hoist337 )
    ( hoist-at hoist252 place252 )
    ( available hoist252 )
    ( hoist-at hoist724 place724 )
    ( available hoist724 )
    ( hoist-at hoist682 place682 )
    ( available hoist682 )
    ( hoist-at hoist896 place896 )
    ( available hoist896 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet76 place100 )
    ( surface-at crate76 place100 )
    ( on crate76 pallet76 )
    ( is-crate crate76 )
    ( clear crate76 )
    ( surface-at pallet989 place724 )
    ( surface-at crate989 place724 )
    ( on crate989 pallet989 )
    ( is-crate crate989 )
    ( clear crate989 )
    ( surface-at pallet259 place252 )
    ( surface-at crate259 place252 )
    ( on crate259 pallet259 )
    ( is-crate crate259 )
    ( clear crate259 )
    ( surface-at pallet268 place724 )
    ( surface-at crate268 place724 )
    ( on crate268 pallet268 )
    ( is-crate crate268 )
    ( clear crate268 )
  )
  ( :tasks
    ( Make-On crate76 pallet0 )    ( Make-On crate989 crate76 )    ( Make-On crate259 crate989 )    ( Make-On crate268 crate259 )  )
)
