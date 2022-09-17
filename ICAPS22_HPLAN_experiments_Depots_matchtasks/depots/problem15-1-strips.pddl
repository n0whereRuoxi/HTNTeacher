( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place385 - place
    hoist385 - hoist
    place709 - place
    hoist709 - hoist
    place570 - place
    hoist570 - hoist
    place569 - place
    hoist569 - hoist
    place483 - place
    hoist483 - hoist
    place587 - place
    hoist587 - hoist
    place934 - place
    hoist934 - hoist
    place45 - place
    hoist45 - hoist
    place785 - place
    hoist785 - hoist
    place266 - place
    hoist266 - hoist
    place551 - place
    hoist551 - hoist
    place707 - place
    hoist707 - hoist
    place184 - place
    hoist184 - hoist
    place382 - place
    hoist382 - hoist
    place204 - place
    hoist204 - hoist
    place110 - place
    hoist110 - hoist
    place751 - place
    hoist751 - hoist
    place224 - place
    hoist224 - hoist
    place827 - place
    hoist827 - hoist
    place677 - place
    hoist677 - hoist
    place394 - place
    hoist394 - hoist
    place362 - place
    hoist362 - hoist
    place856 - place
    hoist856 - hoist
    place285 - place
    hoist285 - hoist
    place0 - place
    hoist0 - hoist
    crate882 - surface
    pallet882 - surface
    crate325 - surface
    pallet325 - surface
    crate958 - surface
    pallet958 - surface
    crate37 - surface
    pallet37 - surface
    crate405 - surface
    pallet405 - surface
    crate377 - surface
    pallet377 - surface
    crate135 - surface
    pallet135 - surface
    crate108 - surface
    pallet108 - surface
    crate19 - surface
    pallet19 - surface
    crate79 - surface
    pallet79 - surface
    crate492 - surface
    pallet492 - surface
    crate863 - surface
    pallet863 - surface
    crate252 - surface
    pallet252 - surface
    crate562 - surface
    pallet562 - surface
    crate730 - surface
    pallet730 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist385 place385 )
    ( available hoist385 )
    ( hoist-at hoist709 place709 )
    ( available hoist709 )
    ( hoist-at hoist570 place570 )
    ( available hoist570 )
    ( hoist-at hoist569 place569 )
    ( available hoist569 )
    ( hoist-at hoist483 place483 )
    ( available hoist483 )
    ( hoist-at hoist587 place587 )
    ( available hoist587 )
    ( hoist-at hoist934 place934 )
    ( available hoist934 )
    ( hoist-at hoist45 place45 )
    ( available hoist45 )
    ( hoist-at hoist785 place785 )
    ( available hoist785 )
    ( hoist-at hoist266 place266 )
    ( available hoist266 )
    ( hoist-at hoist551 place551 )
    ( available hoist551 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist184 place184 )
    ( available hoist184 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist204 place204 )
    ( available hoist204 )
    ( hoist-at hoist110 place110 )
    ( available hoist110 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist827 place827 )
    ( available hoist827 )
    ( hoist-at hoist677 place677 )
    ( available hoist677 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist362 place362 )
    ( available hoist362 )
    ( hoist-at hoist856 place856 )
    ( available hoist856 )
    ( hoist-at hoist285 place285 )
    ( available hoist285 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet882 place827 )
    ( surface-at crate882 place827 )
    ( on crate882 pallet882 )
    ( is-crate crate882 )
    ( clear crate882 )
    ( surface-at pallet325 place570 )
    ( surface-at crate325 place570 )
    ( on crate325 pallet325 )
    ( is-crate crate325 )
    ( clear crate325 )
    ( surface-at pallet958 place45 )
    ( surface-at crate958 place45 )
    ( on crate958 pallet958 )
    ( is-crate crate958 )
    ( clear crate958 )
    ( surface-at pallet37 place856 )
    ( surface-at crate37 place856 )
    ( on crate37 pallet37 )
    ( is-crate crate37 )
    ( clear crate37 )
    ( surface-at pallet405 place45 )
    ( surface-at crate405 place45 )
    ( on crate405 pallet405 )
    ( is-crate crate405 )
    ( clear crate405 )
    ( surface-at pallet377 place184 )
    ( surface-at crate377 place184 )
    ( on crate377 pallet377 )
    ( is-crate crate377 )
    ( clear crate377 )
    ( surface-at pallet135 place285 )
    ( surface-at crate135 place285 )
    ( on crate135 pallet135 )
    ( is-crate crate135 )
    ( clear crate135 )
    ( surface-at pallet108 place184 )
    ( surface-at crate108 place184 )
    ( on crate108 pallet108 )
    ( is-crate crate108 )
    ( clear crate108 )
    ( surface-at pallet19 place45 )
    ( surface-at crate19 place45 )
    ( on crate19 pallet19 )
    ( is-crate crate19 )
    ( clear crate19 )
    ( surface-at pallet79 place707 )
    ( surface-at crate79 place707 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet492 place570 )
    ( surface-at crate492 place570 )
    ( on crate492 pallet492 )
    ( is-crate crate492 )
    ( clear crate492 )
    ( surface-at pallet863 place751 )
    ( surface-at crate863 place751 )
    ( on crate863 pallet863 )
    ( is-crate crate863 )
    ( clear crate863 )
    ( surface-at pallet252 place707 )
    ( surface-at crate252 place707 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet562 place751 )
    ( surface-at crate562 place751 )
    ( on crate562 pallet562 )
    ( is-crate crate562 )
    ( clear crate562 )
    ( surface-at pallet730 place707 )
    ( surface-at crate730 place707 )
    ( on crate730 pallet730 )
    ( is-crate crate730 )
    ( clear crate730 )
  )
  ( :goal
    ( and
    )
  )
)
