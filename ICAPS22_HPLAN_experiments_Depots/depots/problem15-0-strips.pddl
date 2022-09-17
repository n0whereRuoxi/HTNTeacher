( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place869 - place
    hoist869 - hoist
    place356 - place
    hoist356 - hoist
    place905 - place
    hoist905 - hoist
    place672 - place
    hoist672 - hoist
    place951 - place
    hoist951 - hoist
    place510 - place
    hoist510 - hoist
    place823 - place
    hoist823 - hoist
    place469 - place
    hoist469 - hoist
    place397 - place
    hoist397 - hoist
    place485 - place
    hoist485 - hoist
    place695 - place
    hoist695 - hoist
    place977 - place
    hoist977 - hoist
    place53 - place
    hoist53 - hoist
    place19 - place
    hoist19 - hoist
    place125 - place
    hoist125 - hoist
    place136 - place
    hoist136 - hoist
    place413 - place
    hoist413 - hoist
    place928 - place
    hoist928 - hoist
    place912 - place
    hoist912 - hoist
    place810 - place
    hoist810 - hoist
    place145 - place
    hoist145 - hoist
    place717 - place
    hoist717 - hoist
    place74 - place
    hoist74 - hoist
    place680 - place
    hoist680 - hoist
    place645 - place
    hoist645 - hoist
    place256 - place
    hoist256 - hoist
    place331 - place
    hoist331 - hoist
    place235 - place
    hoist235 - hoist
    place0 - place
    hoist0 - hoist
    crate310 - surface
    pallet310 - surface
    crate642 - surface
    pallet642 - surface
    crate498 - surface
    pallet498 - surface
    crate353 - surface
    pallet353 - surface
    crate814 - surface
    pallet814 - surface
    crate339 - surface
    pallet339 - surface
    crate500 - surface
    pallet500 - surface
    crate762 - surface
    pallet762 - surface
    crate46 - surface
    pallet46 - surface
    crate407 - surface
    pallet407 - surface
    crate219 - surface
    pallet219 - surface
    crate986 - surface
    pallet986 - surface
    crate664 - surface
    pallet664 - surface
    crate358 - surface
    pallet358 - surface
    crate481 - surface
    pallet481 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist869 place869 )
    ( available hoist869 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist905 place905 )
    ( available hoist905 )
    ( hoist-at hoist672 place672 )
    ( available hoist672 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist823 place823 )
    ( available hoist823 )
    ( hoist-at hoist469 place469 )
    ( available hoist469 )
    ( hoist-at hoist397 place397 )
    ( available hoist397 )
    ( hoist-at hoist485 place485 )
    ( available hoist485 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist977 place977 )
    ( available hoist977 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist19 place19 )
    ( available hoist19 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist136 place136 )
    ( available hoist136 )
    ( hoist-at hoist413 place413 )
    ( available hoist413 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist810 place810 )
    ( available hoist810 )
    ( hoist-at hoist145 place145 )
    ( available hoist145 )
    ( hoist-at hoist717 place717 )
    ( available hoist717 )
    ( hoist-at hoist74 place74 )
    ( available hoist74 )
    ( hoist-at hoist680 place680 )
    ( available hoist680 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist256 place256 )
    ( available hoist256 )
    ( hoist-at hoist331 place331 )
    ( available hoist331 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet310 place672 )
    ( surface-at crate310 place672 )
    ( on crate310 pallet310 )
    ( is-crate crate310 )
    ( clear crate310 )
    ( surface-at pallet642 place19 )
    ( surface-at crate642 place19 )
    ( on crate642 pallet642 )
    ( is-crate crate642 )
    ( clear crate642 )
    ( surface-at pallet498 place413 )
    ( surface-at crate498 place413 )
    ( on crate498 pallet498 )
    ( is-crate crate498 )
    ( clear crate498 )
    ( surface-at pallet353 place19 )
    ( surface-at crate353 place19 )
    ( on crate353 pallet353 )
    ( is-crate crate353 )
    ( clear crate353 )
    ( surface-at pallet814 place645 )
    ( surface-at crate814 place645 )
    ( on crate814 pallet814 )
    ( is-crate crate814 )
    ( clear crate814 )
    ( surface-at pallet339 place356 )
    ( surface-at crate339 place356 )
    ( on crate339 pallet339 )
    ( is-crate crate339 )
    ( clear crate339 )
    ( surface-at pallet500 place74 )
    ( surface-at crate500 place74 )
    ( on crate500 pallet500 )
    ( is-crate crate500 )
    ( clear crate500 )
    ( surface-at pallet762 place912 )
    ( surface-at crate762 place912 )
    ( on crate762 pallet762 )
    ( is-crate crate762 )
    ( clear crate762 )
    ( surface-at pallet46 place125 )
    ( surface-at crate46 place125 )
    ( on crate46 pallet46 )
    ( is-crate crate46 )
    ( clear crate46 )
    ( surface-at pallet407 place397 )
    ( surface-at crate407 place397 )
    ( on crate407 pallet407 )
    ( is-crate crate407 )
    ( clear crate407 )
    ( surface-at pallet219 place136 )
    ( surface-at crate219 place136 )
    ( on crate219 pallet219 )
    ( is-crate crate219 )
    ( clear crate219 )
    ( surface-at pallet986 place869 )
    ( surface-at crate986 place869 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet664 place145 )
    ( surface-at crate664 place145 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet358 place413 )
    ( surface-at crate358 place413 )
    ( on crate358 pallet358 )
    ( is-crate crate358 )
    ( clear crate358 )
    ( surface-at pallet481 place53 )
    ( surface-at crate481 place53 )
    ( on crate481 pallet481 )
    ( is-crate crate481 )
    ( clear crate481 )
  )
  ( :goal
    ( and
    )
  )
)
