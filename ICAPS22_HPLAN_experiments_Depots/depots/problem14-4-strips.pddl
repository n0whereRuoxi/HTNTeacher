( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place790 - place
    hoist790 - hoist
    place125 - place
    hoist125 - hoist
    place451 - place
    hoist451 - hoist
    place672 - place
    hoist672 - hoist
    place88 - place
    hoist88 - hoist
    place577 - place
    hoist577 - hoist
    place982 - place
    hoist982 - hoist
    place358 - place
    hoist358 - hoist
    place767 - place
    hoist767 - hoist
    place549 - place
    hoist549 - hoist
    place780 - place
    hoist780 - hoist
    place179 - place
    hoist179 - hoist
    place193 - place
    hoist193 - hoist
    place0 - place
    hoist0 - hoist
    crate219 - surface
    pallet219 - surface
    crate458 - surface
    pallet458 - surface
    crate242 - surface
    pallet242 - surface
    crate943 - surface
    pallet943 - surface
    crate834 - surface
    pallet834 - surface
    crate995 - surface
    pallet995 - surface
    crate309 - surface
    pallet309 - surface
    crate504 - surface
    pallet504 - surface
    crate33 - surface
    pallet33 - surface
    crate119 - surface
    pallet119 - surface
    crate440 - surface
    pallet440 - surface
    crate476 - surface
    pallet476 - surface
    crate167 - surface
    pallet167 - surface
    crate409 - surface
    pallet409 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist672 place672 )
    ( available hoist672 )
    ( hoist-at hoist88 place88 )
    ( available hoist88 )
    ( hoist-at hoist577 place577 )
    ( available hoist577 )
    ( hoist-at hoist982 place982 )
    ( available hoist982 )
    ( hoist-at hoist358 place358 )
    ( available hoist358 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist179 place179 )
    ( available hoist179 )
    ( hoist-at hoist193 place193 )
    ( available hoist193 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet219 place549 )
    ( surface-at crate219 place549 )
    ( on crate219 pallet219 )
    ( is-crate crate219 )
    ( clear crate219 )
    ( surface-at pallet458 place780 )
    ( surface-at crate458 place780 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet242 place358 )
    ( surface-at crate242 place358 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet943 place577 )
    ( surface-at crate943 place577 )
    ( on crate943 pallet943 )
    ( is-crate crate943 )
    ( clear crate943 )
    ( surface-at pallet834 place982 )
    ( surface-at crate834 place982 )
    ( on crate834 pallet834 )
    ( is-crate crate834 )
    ( clear crate834 )
    ( surface-at pallet995 place451 )
    ( surface-at crate995 place451 )
    ( on crate995 pallet995 )
    ( is-crate crate995 )
    ( clear crate995 )
    ( surface-at pallet309 place179 )
    ( surface-at crate309 place179 )
    ( on crate309 pallet309 )
    ( is-crate crate309 )
    ( clear crate309 )
    ( surface-at pallet504 place982 )
    ( surface-at crate504 place982 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet33 place88 )
    ( surface-at crate33 place88 )
    ( on crate33 pallet33 )
    ( is-crate crate33 )
    ( clear crate33 )
    ( surface-at pallet119 place767 )
    ( surface-at crate119 place767 )
    ( on crate119 pallet119 )
    ( is-crate crate119 )
    ( clear crate119 )
    ( surface-at pallet440 place767 )
    ( surface-at crate440 place767 )
    ( on crate440 pallet440 )
    ( is-crate crate440 )
    ( clear crate440 )
    ( surface-at pallet476 place193 )
    ( surface-at crate476 place193 )
    ( on crate476 pallet476 )
    ( is-crate crate476 )
    ( clear crate476 )
    ( surface-at pallet167 place179 )
    ( surface-at crate167 place179 )
    ( on crate167 pallet167 )
    ( is-crate crate167 )
    ( clear crate167 )
    ( surface-at pallet409 place549 )
    ( surface-at crate409 place549 )
    ( on crate409 pallet409 )
    ( is-crate crate409 )
    ( clear crate409 )
  )
  ( :goal
    ( and
    )
  )
)
