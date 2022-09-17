( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place978 - place
    hoist978 - hoist
    place77 - place
    hoist77 - hoist
    place237 - place
    hoist237 - hoist
    place695 - place
    hoist695 - hoist
    place805 - place
    hoist805 - hoist
    place299 - place
    hoist299 - hoist
    place474 - place
    hoist474 - hoist
    place950 - place
    hoist950 - hoist
    place0 - place
    hoist0 - hoist
    crate745 - surface
    pallet745 - surface
    crate752 - surface
    pallet752 - surface
    crate327 - surface
    pallet327 - surface
    crate818 - surface
    pallet818 - surface
    crate887 - surface
    pallet887 - surface
    crate352 - surface
    pallet352 - surface
    crate962 - surface
    pallet962 - surface
    crate160 - surface
    pallet160 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist978 place978 )
    ( available hoist978 )
    ( hoist-at hoist77 place77 )
    ( available hoist77 )
    ( hoist-at hoist237 place237 )
    ( available hoist237 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist805 place805 )
    ( available hoist805 )
    ( hoist-at hoist299 place299 )
    ( available hoist299 )
    ( hoist-at hoist474 place474 )
    ( available hoist474 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet745 place978 )
    ( surface-at crate745 place978 )
    ( on crate745 pallet745 )
    ( is-crate crate745 )
    ( clear crate745 )
    ( surface-at pallet752 place695 )
    ( surface-at crate752 place695 )
    ( on crate752 pallet752 )
    ( is-crate crate752 )
    ( clear crate752 )
    ( surface-at pallet327 place299 )
    ( surface-at crate327 place299 )
    ( on crate327 pallet327 )
    ( is-crate crate327 )
    ( clear crate327 )
    ( surface-at pallet818 place695 )
    ( surface-at crate818 place695 )
    ( on crate818 pallet818 )
    ( is-crate crate818 )
    ( clear crate818 )
    ( surface-at pallet887 place950 )
    ( surface-at crate887 place950 )
    ( on crate887 pallet887 )
    ( is-crate crate887 )
    ( clear crate887 )
    ( surface-at pallet352 place805 )
    ( surface-at crate352 place805 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet962 place237 )
    ( surface-at crate962 place237 )
    ( on crate962 pallet962 )
    ( is-crate crate962 )
    ( clear crate962 )
    ( surface-at pallet160 place299 )
    ( surface-at crate160 place299 )
    ( on crate160 pallet160 )
    ( is-crate crate160 )
    ( clear crate160 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate745 crate752 crate327 crate818 crate887 crate352 crate962 crate160 )
  )
)
