( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place583 - place
    hoist583 - hoist
    place411 - place
    hoist411 - hoist
    place210 - place
    hoist210 - hoist
    place615 - place
    hoist615 - hoist
    place750 - place
    hoist750 - hoist
    place510 - place
    hoist510 - hoist
    place904 - place
    hoist904 - hoist
    place53 - place
    hoist53 - hoist
    place0 - place
    hoist0 - hoist
    crate585 - surface
    pallet585 - surface
    crate314 - surface
    pallet314 - surface
    crate740 - surface
    pallet740 - surface
    crate537 - surface
    pallet537 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist411 place411 )
    ( available hoist411 )
    ( hoist-at hoist210 place210 )
    ( available hoist210 )
    ( hoist-at hoist615 place615 )
    ( available hoist615 )
    ( hoist-at hoist750 place750 )
    ( available hoist750 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist904 place904 )
    ( available hoist904 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet585 place210 )
    ( surface-at crate585 place210 )
    ( on crate585 pallet585 )
    ( is-crate crate585 )
    ( clear crate585 )
    ( surface-at pallet314 place750 )
    ( surface-at crate314 place750 )
    ( on crate314 pallet314 )
    ( is-crate crate314 )
    ( clear crate314 )
    ( surface-at pallet740 place510 )
    ( surface-at crate740 place510 )
    ( on crate740 pallet740 )
    ( is-crate crate740 )
    ( clear crate740 )
    ( surface-at pallet537 place904 )
    ( surface-at crate537 place904 )
    ( on crate537 pallet537 )
    ( is-crate crate537 )
    ( clear crate537 )
  )
  ( :tasks
    ( Make-On crate585 pallet0 )    ( Make-On crate314 crate585 )    ( Make-On crate740 crate314 )    ( Make-On crate537 crate740 )  )
)
