( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place251 - place
    hoist251 - hoist
    place64 - place
    hoist64 - hoist
    place778 - place
    hoist778 - hoist
    place43 - place
    hoist43 - hoist
    place194 - place
    hoist194 - hoist
    place406 - place
    hoist406 - hoist
    place657 - place
    hoist657 - hoist
    place633 - place
    hoist633 - hoist
    place56 - place
    hoist56 - hoist
    place0 - place
    hoist0 - hoist
    crate115 - surface
    pallet115 - surface
    crate324 - surface
    pallet324 - surface
    crate833 - surface
    pallet833 - surface
    crate409 - surface
    pallet409 - surface
    crate411 - surface
    pallet411 - surface
    crate892 - surface
    pallet892 - surface
    crate874 - surface
    pallet874 - surface
    crate825 - surface
    pallet825 - surface
    crate820 - surface
    pallet820 - surface
    crate303 - surface
    pallet303 - surface
    crate242 - surface
    pallet242 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist64 place64 )
    ( available hoist64 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist43 place43 )
    ( available hoist43 )
    ( hoist-at hoist194 place194 )
    ( available hoist194 )
    ( hoist-at hoist406 place406 )
    ( available hoist406 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist633 place633 )
    ( available hoist633 )
    ( hoist-at hoist56 place56 )
    ( available hoist56 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet115 place64 )
    ( surface-at crate115 place64 )
    ( on crate115 pallet115 )
    ( is-crate crate115 )
    ( clear crate115 )
    ( surface-at pallet324 place657 )
    ( surface-at crate324 place657 )
    ( on crate324 pallet324 )
    ( is-crate crate324 )
    ( clear crate324 )
    ( surface-at pallet833 place251 )
    ( surface-at crate833 place251 )
    ( on crate833 pallet833 )
    ( is-crate crate833 )
    ( clear crate833 )
    ( surface-at pallet409 place56 )
    ( surface-at crate409 place56 )
    ( on crate409 pallet409 )
    ( is-crate crate409 )
    ( clear crate409 )
    ( surface-at pallet411 place657 )
    ( surface-at crate411 place657 )
    ( on crate411 pallet411 )
    ( is-crate crate411 )
    ( clear crate411 )
    ( surface-at pallet892 place657 )
    ( surface-at crate892 place657 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet874 place633 )
    ( surface-at crate874 place633 )
    ( on crate874 pallet874 )
    ( is-crate crate874 )
    ( clear crate874 )
    ( surface-at pallet825 place64 )
    ( surface-at crate825 place64 )
    ( on crate825 pallet825 )
    ( is-crate crate825 )
    ( clear crate825 )
    ( surface-at pallet820 place64 )
    ( surface-at crate820 place64 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet303 place657 )
    ( surface-at crate303 place657 )
    ( on crate303 pallet303 )
    ( is-crate crate303 )
    ( clear crate303 )
    ( surface-at pallet242 place43 )
    ( surface-at crate242 place43 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
  )
  ( :tasks
    ( Make-On crate115 pallet0 )    ( Make-On crate324 crate115 )    ( Make-On crate833 crate324 )    ( Make-On crate409 crate833 )    ( Make-On crate411 crate409 )    ( Make-On crate892 crate411 )    ( Make-On crate874 crate892 )    ( Make-On crate825 crate874 )    ( Make-On crate820 crate825 )    ( Make-On crate303 crate820 )    ( Make-On crate242 crate303 )  )
)
