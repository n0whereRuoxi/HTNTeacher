( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place5 - place
    hoist5 - hoist
    place108 - place
    hoist108 - hoist
    place348 - place
    hoist348 - hoist
    place648 - place
    hoist648 - hoist
    place494 - place
    hoist494 - hoist
    place328 - place
    hoist328 - hoist
    place769 - place
    hoist769 - hoist
    place649 - place
    hoist649 - hoist
    place269 - place
    hoist269 - hoist
    place61 - place
    hoist61 - hoist
    place593 - place
    hoist593 - hoist
    place660 - place
    hoist660 - hoist
    place449 - place
    hoist449 - hoist
    place402 - place
    hoist402 - hoist
    place944 - place
    hoist944 - hoist
    place588 - place
    hoist588 - hoist
    place748 - place
    hoist748 - hoist
    place50 - place
    hoist50 - hoist
    place928 - place
    hoist928 - hoist
    place291 - place
    hoist291 - hoist
    place10 - place
    hoist10 - hoist
    place776 - place
    hoist776 - hoist
    place826 - place
    hoist826 - hoist
    place645 - place
    hoist645 - hoist
    place0 - place
    hoist0 - hoist
    crate847 - surface
    pallet847 - surface
    crate615 - surface
    pallet615 - surface
    crate515 - surface
    pallet515 - surface
    crate12 - surface
    pallet12 - surface
    crate450 - surface
    pallet450 - surface
    crate675 - surface
    pallet675 - surface
    crate362 - surface
    pallet362 - surface
    crate424 - surface
    pallet424 - surface
    crate179 - surface
    pallet179 - surface
    crate85 - surface
    pallet85 - surface
    crate42 - surface
    pallet42 - surface
    crate399 - surface
    pallet399 - surface
    crate19 - surface
    pallet19 - surface
    crate744 - surface
    pallet744 - surface
    crate196 - surface
    pallet196 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist5 place5 )
    ( available hoist5 )
    ( hoist-at hoist108 place108 )
    ( available hoist108 )
    ( hoist-at hoist348 place348 )
    ( available hoist348 )
    ( hoist-at hoist648 place648 )
    ( available hoist648 )
    ( hoist-at hoist494 place494 )
    ( available hoist494 )
    ( hoist-at hoist328 place328 )
    ( available hoist328 )
    ( hoist-at hoist769 place769 )
    ( available hoist769 )
    ( hoist-at hoist649 place649 )
    ( available hoist649 )
    ( hoist-at hoist269 place269 )
    ( available hoist269 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist449 place449 )
    ( available hoist449 )
    ( hoist-at hoist402 place402 )
    ( available hoist402 )
    ( hoist-at hoist944 place944 )
    ( available hoist944 )
    ( hoist-at hoist588 place588 )
    ( available hoist588 )
    ( hoist-at hoist748 place748 )
    ( available hoist748 )
    ( hoist-at hoist50 place50 )
    ( available hoist50 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist291 place291 )
    ( available hoist291 )
    ( hoist-at hoist10 place10 )
    ( available hoist10 )
    ( hoist-at hoist776 place776 )
    ( available hoist776 )
    ( hoist-at hoist826 place826 )
    ( available hoist826 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet847 place269 )
    ( surface-at crate847 place269 )
    ( on crate847 pallet847 )
    ( is-crate crate847 )
    ( clear crate847 )
    ( surface-at pallet615 place776 )
    ( surface-at crate615 place776 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
    ( surface-at pallet515 place748 )
    ( surface-at crate515 place748 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
    ( surface-at pallet12 place648 )
    ( surface-at crate12 place648 )
    ( on crate12 pallet12 )
    ( is-crate crate12 )
    ( clear crate12 )
    ( surface-at pallet450 place776 )
    ( surface-at crate450 place776 )
    ( on crate450 pallet450 )
    ( is-crate crate450 )
    ( clear crate450 )
    ( surface-at pallet675 place660 )
    ( surface-at crate675 place660 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet362 place660 )
    ( surface-at crate362 place660 )
    ( on crate362 pallet362 )
    ( is-crate crate362 )
    ( clear crate362 )
    ( surface-at pallet424 place348 )
    ( surface-at crate424 place348 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
    ( surface-at pallet179 place348 )
    ( surface-at crate179 place348 )
    ( on crate179 pallet179 )
    ( is-crate crate179 )
    ( clear crate179 )
    ( surface-at pallet85 place645 )
    ( surface-at crate85 place645 )
    ( on crate85 pallet85 )
    ( is-crate crate85 )
    ( clear crate85 )
    ( surface-at pallet42 place776 )
    ( surface-at crate42 place776 )
    ( on crate42 pallet42 )
    ( is-crate crate42 )
    ( clear crate42 )
    ( surface-at pallet399 place593 )
    ( surface-at crate399 place593 )
    ( on crate399 pallet399 )
    ( is-crate crate399 )
    ( clear crate399 )
    ( surface-at pallet19 place776 )
    ( surface-at crate19 place776 )
    ( on crate19 pallet19 )
    ( is-crate crate19 )
    ( clear crate19 )
    ( surface-at pallet744 place61 )
    ( surface-at crate744 place61 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet196 place5 )
    ( surface-at crate196 place5 )
    ( on crate196 pallet196 )
    ( is-crate crate196 )
    ( clear crate196 )
  )
  ( :goal
    ( and
    )
  )
)
