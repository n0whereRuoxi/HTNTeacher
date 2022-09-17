( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place747 - place
    hoist747 - hoist
    place112 - place
    hoist112 - hoist
    place658 - place
    hoist658 - hoist
    place588 - place
    hoist588 - hoist
    place740 - place
    hoist740 - hoist
    place244 - place
    hoist244 - hoist
    place206 - place
    hoist206 - hoist
    place928 - place
    hoist928 - hoist
    place216 - place
    hoist216 - hoist
    place800 - place
    hoist800 - hoist
    place0 - place
    hoist0 - hoist
    crate801 - surface
    pallet801 - surface
    crate482 - surface
    pallet482 - surface
    crate413 - surface
    pallet413 - surface
    crate226 - surface
    pallet226 - surface
    crate78 - surface
    pallet78 - surface
    crate34 - surface
    pallet34 - surface
    crate968 - surface
    pallet968 - surface
    crate999 - surface
    pallet999 - surface
    crate401 - surface
    pallet401 - surface
    crate556 - surface
    pallet556 - surface
    crate620 - surface
    pallet620 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist747 place747 )
    ( available hoist747 )
    ( hoist-at hoist112 place112 )
    ( available hoist112 )
    ( hoist-at hoist658 place658 )
    ( available hoist658 )
    ( hoist-at hoist588 place588 )
    ( available hoist588 )
    ( hoist-at hoist740 place740 )
    ( available hoist740 )
    ( hoist-at hoist244 place244 )
    ( available hoist244 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist216 place216 )
    ( available hoist216 )
    ( hoist-at hoist800 place800 )
    ( available hoist800 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet801 place658 )
    ( surface-at crate801 place658 )
    ( on crate801 pallet801 )
    ( is-crate crate801 )
    ( clear crate801 )
    ( surface-at pallet482 place206 )
    ( surface-at crate482 place206 )
    ( on crate482 pallet482 )
    ( is-crate crate482 )
    ( clear crate482 )
    ( surface-at pallet413 place740 )
    ( surface-at crate413 place740 )
    ( on crate413 pallet413 )
    ( is-crate crate413 )
    ( clear crate413 )
    ( surface-at pallet226 place740 )
    ( surface-at crate226 place740 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
    ( surface-at pallet78 place800 )
    ( surface-at crate78 place800 )
    ( on crate78 pallet78 )
    ( is-crate crate78 )
    ( clear crate78 )
    ( surface-at pallet34 place658 )
    ( surface-at crate34 place658 )
    ( on crate34 pallet34 )
    ( is-crate crate34 )
    ( clear crate34 )
    ( surface-at pallet968 place928 )
    ( surface-at crate968 place928 )
    ( on crate968 pallet968 )
    ( is-crate crate968 )
    ( clear crate968 )
    ( surface-at pallet999 place658 )
    ( surface-at crate999 place658 )
    ( on crate999 pallet999 )
    ( is-crate crate999 )
    ( clear crate999 )
    ( surface-at pallet401 place800 )
    ( surface-at crate401 place800 )
    ( on crate401 pallet401 )
    ( is-crate crate401 )
    ( clear crate401 )
    ( surface-at pallet556 place206 )
    ( surface-at crate556 place206 )
    ( on crate556 pallet556 )
    ( is-crate crate556 )
    ( clear crate556 )
    ( surface-at pallet620 place800 )
    ( surface-at crate620 place800 )
    ( on crate620 pallet620 )
    ( is-crate crate620 )
    ( clear crate620 )
  )
  ( :tasks
    ( Make-11Crate pallet0 crate801 crate482 crate413 crate226 crate78 crate34 crate968 crate999 crate401 crate556 crate620 )
  )
)
