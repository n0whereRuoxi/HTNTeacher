( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place889 - place
    hoist889 - hoist
    place292 - place
    hoist292 - hoist
    place177 - place
    hoist177 - hoist
    place480 - place
    hoist480 - hoist
    place88 - place
    hoist88 - hoist
    place801 - place
    hoist801 - hoist
    place218 - place
    hoist218 - hoist
    place983 - place
    hoist983 - hoist
    place496 - place
    hoist496 - hoist
    place418 - place
    hoist418 - hoist
    place977 - place
    hoist977 - hoist
    place995 - place
    hoist995 - hoist
    place915 - place
    hoist915 - hoist
    place0 - place
    hoist0 - hoist
    crate701 - surface
    pallet701 - surface
    crate903 - surface
    pallet903 - surface
    crate883 - surface
    pallet883 - surface
    crate778 - surface
    pallet778 - surface
    crate512 - surface
    pallet512 - surface
    crate656 - surface
    pallet656 - surface
    crate774 - surface
    pallet774 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist889 place889 )
    ( available hoist889 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist177 place177 )
    ( available hoist177 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist88 place88 )
    ( available hoist88 )
    ( hoist-at hoist801 place801 )
    ( available hoist801 )
    ( hoist-at hoist218 place218 )
    ( available hoist218 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist496 place496 )
    ( available hoist496 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist977 place977 )
    ( available hoist977 )
    ( hoist-at hoist995 place995 )
    ( available hoist995 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet701 place801 )
    ( surface-at crate701 place801 )
    ( on crate701 pallet701 )
    ( is-crate crate701 )
    ( clear crate701 )
    ( surface-at pallet903 place218 )
    ( surface-at crate903 place218 )
    ( on crate903 pallet903 )
    ( is-crate crate903 )
    ( clear crate903 )
    ( surface-at pallet883 place88 )
    ( surface-at crate883 place88 )
    ( on crate883 pallet883 )
    ( is-crate crate883 )
    ( clear crate883 )
    ( surface-at pallet778 place496 )
    ( surface-at crate778 place496 )
    ( on crate778 pallet778 )
    ( is-crate crate778 )
    ( clear crate778 )
    ( surface-at pallet512 place995 )
    ( surface-at crate512 place995 )
    ( on crate512 pallet512 )
    ( is-crate crate512 )
    ( clear crate512 )
    ( surface-at pallet656 place418 )
    ( surface-at crate656 place418 )
    ( on crate656 pallet656 )
    ( is-crate crate656 )
    ( clear crate656 )
    ( surface-at pallet774 place177 )
    ( surface-at crate774 place177 )
    ( on crate774 pallet774 )
    ( is-crate crate774 )
    ( clear crate774 )
  )
  ( :tasks
    ( Make-On crate701 pallet0 )    ( Make-On crate903 crate701 )    ( Make-On crate883 crate903 )    ( Make-On crate778 crate883 )    ( Make-On crate512 crate778 )    ( Make-On crate656 crate512 )    ( Make-On crate774 crate656 )  )
)
