( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place251 - place
    hoist251 - hoist
    place0 - place
    hoist0 - hoist
    crate478 - surface
    pallet478 - surface
    crate683 - surface
    pallet683 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet478 place251 )
    ( surface-at crate478 place251 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
    ( surface-at pallet683 place251 )
    ( surface-at crate683 place251 )
    ( on crate683 pallet683 )
    ( is-crate crate683 )
    ( clear crate683 )
  )
  ( :tasks
    ( Make-On crate478 pallet0 )    ( Make-On crate683 crate478 )  )
)
