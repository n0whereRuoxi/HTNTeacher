( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place983 - place
    hoist983 - hoist
    place150 - place
    hoist150 - hoist
    place195 - place
    hoist195 - hoist
    place581 - place
    hoist581 - hoist
    place17 - place
    hoist17 - hoist
    place279 - place
    hoist279 - hoist
    place734 - place
    hoist734 - hoist
    place997 - place
    hoist997 - hoist
    place583 - place
    hoist583 - hoist
    place347 - place
    hoist347 - hoist
    place0 - place
    hoist0 - hoist
    crate923 - surface
    pallet923 - surface
    crate975 - surface
    pallet975 - surface
    crate48 - surface
    pallet48 - surface
    crate75 - surface
    pallet75 - surface
    crate889 - surface
    pallet889 - surface
    crate327 - surface
    pallet327 - surface
    crate531 - surface
    pallet531 - surface
    crate388 - surface
    pallet388 - surface
    crate200 - surface
    pallet200 - surface
    crate685 - surface
    pallet685 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist150 place150 )
    ( available hoist150 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist581 place581 )
    ( available hoist581 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist279 place279 )
    ( available hoist279 )
    ( hoist-at hoist734 place734 )
    ( available hoist734 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist347 place347 )
    ( available hoist347 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet923 place734 )
    ( surface-at crate923 place734 )
    ( on crate923 pallet923 )
    ( is-crate crate923 )
    ( clear crate923 )
    ( surface-at pallet975 place150 )
    ( surface-at crate975 place150 )
    ( on crate975 pallet975 )
    ( is-crate crate975 )
    ( clear crate975 )
    ( surface-at pallet48 place734 )
    ( surface-at crate48 place734 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet75 place734 )
    ( surface-at crate75 place734 )
    ( on crate75 pallet75 )
    ( is-crate crate75 )
    ( clear crate75 )
    ( surface-at pallet889 place734 )
    ( surface-at crate889 place734 )
    ( on crate889 pallet889 )
    ( is-crate crate889 )
    ( clear crate889 )
    ( surface-at pallet327 place195 )
    ( surface-at crate327 place195 )
    ( on crate327 pallet327 )
    ( is-crate crate327 )
    ( clear crate327 )
    ( surface-at pallet531 place583 )
    ( surface-at crate531 place583 )
    ( on crate531 pallet531 )
    ( is-crate crate531 )
    ( clear crate531 )
    ( surface-at pallet388 place17 )
    ( surface-at crate388 place17 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet200 place734 )
    ( surface-at crate200 place734 )
    ( on crate200 pallet200 )
    ( is-crate crate200 )
    ( clear crate200 )
    ( surface-at pallet685 place279 )
    ( surface-at crate685 place279 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
  )
  ( :tasks
    ( Make-10Crate pallet0 crate923 crate975 crate48 crate75 crate889 crate327 crate531 crate388 crate200 crate685 )
  )
)
