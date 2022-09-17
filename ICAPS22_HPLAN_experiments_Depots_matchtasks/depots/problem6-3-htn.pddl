( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place819 - place
    hoist819 - hoist
    place592 - place
    hoist592 - hoist
    place934 - place
    hoist934 - hoist
    place189 - place
    hoist189 - hoist
    place571 - place
    hoist571 - hoist
    place481 - place
    hoist481 - hoist
    place188 - place
    hoist188 - hoist
    place635 - place
    hoist635 - hoist
    place0 - place
    hoist0 - hoist
    crate904 - surface
    pallet904 - surface
    crate681 - surface
    pallet681 - surface
    crate905 - surface
    pallet905 - surface
    crate146 - surface
    pallet146 - surface
    crate331 - surface
    pallet331 - surface
    crate36 - surface
    pallet36 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist819 place819 )
    ( available hoist819 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist934 place934 )
    ( available hoist934 )
    ( hoist-at hoist189 place189 )
    ( available hoist189 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist481 place481 )
    ( available hoist481 )
    ( hoist-at hoist188 place188 )
    ( available hoist188 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet904 place592 )
    ( surface-at crate904 place592 )
    ( on crate904 pallet904 )
    ( is-crate crate904 )
    ( clear crate904 )
    ( surface-at pallet681 place635 )
    ( surface-at crate681 place635 )
    ( on crate681 pallet681 )
    ( is-crate crate681 )
    ( clear crate681 )
    ( surface-at pallet905 place819 )
    ( surface-at crate905 place819 )
    ( on crate905 pallet905 )
    ( is-crate crate905 )
    ( clear crate905 )
    ( surface-at pallet146 place592 )
    ( surface-at crate146 place592 )
    ( on crate146 pallet146 )
    ( is-crate crate146 )
    ( clear crate146 )
    ( surface-at pallet331 place635 )
    ( surface-at crate331 place635 )
    ( on crate331 pallet331 )
    ( is-crate crate331 )
    ( clear crate331 )
    ( surface-at pallet36 place189 )
    ( surface-at crate36 place189 )
    ( on crate36 pallet36 )
    ( is-crate crate36 )
    ( clear crate36 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate904 crate681 crate905 crate146 crate331 crate36 )
  )
)
