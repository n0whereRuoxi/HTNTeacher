( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place983 - place
    hoist983 - hoist
    place891 - place
    hoist891 - hoist
    place382 - place
    hoist382 - hoist
    place407 - place
    hoist407 - hoist
    place950 - place
    hoist950 - hoist
    place995 - place
    hoist995 - hoist
    place482 - place
    hoist482 - hoist
    place733 - place
    hoist733 - hoist
    place717 - place
    hoist717 - hoist
    place547 - place
    hoist547 - hoist
    place0 - place
    hoist0 - hoist
    crate463 - surface
    pallet463 - surface
    crate182 - surface
    pallet182 - surface
    crate89 - surface
    pallet89 - surface
    crate144 - surface
    pallet144 - surface
    crate364 - surface
    pallet364 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist891 place891 )
    ( available hoist891 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist407 place407 )
    ( available hoist407 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist995 place995 )
    ( available hoist995 )
    ( hoist-at hoist482 place482 )
    ( available hoist482 )
    ( hoist-at hoist733 place733 )
    ( available hoist733 )
    ( hoist-at hoist717 place717 )
    ( available hoist717 )
    ( hoist-at hoist547 place547 )
    ( available hoist547 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet463 place482 )
    ( surface-at crate463 place482 )
    ( on crate463 pallet463 )
    ( is-crate crate463 )
    ( clear crate463 )
    ( surface-at pallet182 place891 )
    ( surface-at crate182 place891 )
    ( on crate182 pallet182 )
    ( is-crate crate182 )
    ( clear crate182 )
    ( surface-at pallet89 place983 )
    ( surface-at crate89 place983 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet144 place950 )
    ( surface-at crate144 place950 )
    ( on crate144 pallet144 )
    ( is-crate crate144 )
    ( clear crate144 )
    ( surface-at pallet364 place950 )
    ( surface-at crate364 place950 )
    ( on crate364 pallet364 )
    ( is-crate crate364 )
    ( clear crate364 )
  )
  ( :tasks
    ( Make-On crate463 pallet0 )    ( Make-On crate182 crate463 )    ( Make-On crate89 crate182 )    ( Make-On crate144 crate89 )    ( Make-On crate364 crate144 )  )
)
