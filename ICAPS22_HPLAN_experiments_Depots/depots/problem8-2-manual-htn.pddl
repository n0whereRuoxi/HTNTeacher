( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place959 - place
    hoist959 - hoist
    place528 - place
    hoist528 - hoist
    place288 - place
    hoist288 - hoist
    place890 - place
    hoist890 - hoist
    place739 - place
    hoist739 - hoist
    place259 - place
    hoist259 - hoist
    place593 - place
    hoist593 - hoist
    place696 - place
    hoist696 - hoist
    place367 - place
    hoist367 - hoist
    place614 - place
    hoist614 - hoist
    place438 - place
    hoist438 - hoist
    place0 - place
    hoist0 - hoist
    crate627 - surface
    pallet627 - surface
    crate438 - surface
    pallet438 - surface
    crate387 - surface
    pallet387 - surface
    crate838 - surface
    pallet838 - surface
    crate697 - surface
    pallet697 - surface
    crate876 - surface
    pallet876 - surface
    crate890 - surface
    pallet890 - surface
    crate615 - surface
    pallet615 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist959 place959 )
    ( available hoist959 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist288 place288 )
    ( available hoist288 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist739 place739 )
    ( available hoist739 )
    ( hoist-at hoist259 place259 )
    ( available hoist259 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist696 place696 )
    ( available hoist696 )
    ( hoist-at hoist367 place367 )
    ( available hoist367 )
    ( hoist-at hoist614 place614 )
    ( available hoist614 )
    ( hoist-at hoist438 place438 )
    ( available hoist438 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet627 place959 )
    ( surface-at crate627 place959 )
    ( on crate627 pallet627 )
    ( is-crate crate627 )
    ( clear crate627 )
    ( surface-at pallet438 place288 )
    ( surface-at crate438 place288 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet387 place614 )
    ( surface-at crate387 place614 )
    ( on crate387 pallet387 )
    ( is-crate crate387 )
    ( clear crate387 )
    ( surface-at pallet838 place593 )
    ( surface-at crate838 place593 )
    ( on crate838 pallet838 )
    ( is-crate crate838 )
    ( clear crate838 )
    ( surface-at pallet697 place288 )
    ( surface-at crate697 place288 )
    ( on crate697 pallet697 )
    ( is-crate crate697 )
    ( clear crate697 )
    ( surface-at pallet876 place528 )
    ( surface-at crate876 place528 )
    ( on crate876 pallet876 )
    ( is-crate crate876 )
    ( clear crate876 )
    ( surface-at pallet890 place739 )
    ( surface-at crate890 place739 )
    ( on crate890 pallet890 )
    ( is-crate crate890 )
    ( clear crate890 )
    ( surface-at pallet615 place696 )
    ( surface-at crate615 place696 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
  )
  ( :tasks
    ( Make-On crate627 pallet0 )    ( Make-On crate438 crate627 )    ( Make-On crate387 crate438 )    ( Make-On crate838 crate387 )    ( Make-On crate697 crate838 )    ( Make-On crate876 crate697 )    ( Make-On crate890 crate876 )    ( Make-On crate615 crate890 )  )
)
