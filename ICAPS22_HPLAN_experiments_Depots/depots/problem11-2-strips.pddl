( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place36 - place
    hoist36 - hoist
    place790 - place
    hoist790 - hoist
    place987 - place
    hoist987 - hoist
    place922 - place
    hoist922 - hoist
    place852 - place
    hoist852 - hoist
    place29 - place
    hoist29 - hoist
    place929 - place
    hoist929 - hoist
    place459 - place
    hoist459 - hoist
    place526 - place
    hoist526 - hoist
    place274 - place
    hoist274 - hoist
    place436 - place
    hoist436 - hoist
    place346 - place
    hoist346 - hoist
    place770 - place
    hoist770 - hoist
    place895 - place
    hoist895 - hoist
    place224 - place
    hoist224 - hoist
    place54 - place
    hoist54 - hoist
    place522 - place
    hoist522 - hoist
    place0 - place
    hoist0 - hoist
    crate166 - surface
    pallet166 - surface
    crate253 - surface
    pallet253 - surface
    crate977 - surface
    pallet977 - surface
    crate534 - surface
    pallet534 - surface
    crate536 - surface
    pallet536 - surface
    crate384 - surface
    pallet384 - surface
    crate571 - surface
    pallet571 - surface
    crate43 - surface
    pallet43 - surface
    crate508 - surface
    pallet508 - surface
    crate5 - surface
    pallet5 - surface
    crate53 - surface
    pallet53 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist36 place36 )
    ( available hoist36 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist987 place987 )
    ( available hoist987 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist852 place852 )
    ( available hoist852 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist929 place929 )
    ( available hoist929 )
    ( hoist-at hoist459 place459 )
    ( available hoist459 )
    ( hoist-at hoist526 place526 )
    ( available hoist526 )
    ( hoist-at hoist274 place274 )
    ( available hoist274 )
    ( hoist-at hoist436 place436 )
    ( available hoist436 )
    ( hoist-at hoist346 place346 )
    ( available hoist346 )
    ( hoist-at hoist770 place770 )
    ( available hoist770 )
    ( hoist-at hoist895 place895 )
    ( available hoist895 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist54 place54 )
    ( available hoist54 )
    ( hoist-at hoist522 place522 )
    ( available hoist522 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet166 place852 )
    ( surface-at crate166 place852 )
    ( on crate166 pallet166 )
    ( is-crate crate166 )
    ( clear crate166 )
    ( surface-at pallet253 place770 )
    ( surface-at crate253 place770 )
    ( on crate253 pallet253 )
    ( is-crate crate253 )
    ( clear crate253 )
    ( surface-at pallet977 place770 )
    ( surface-at crate977 place770 )
    ( on crate977 pallet977 )
    ( is-crate crate977 )
    ( clear crate977 )
    ( surface-at pallet534 place459 )
    ( surface-at crate534 place459 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet536 place895 )
    ( surface-at crate536 place895 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
    ( surface-at pallet384 place36 )
    ( surface-at crate384 place36 )
    ( on crate384 pallet384 )
    ( is-crate crate384 )
    ( clear crate384 )
    ( surface-at pallet571 place29 )
    ( surface-at crate571 place29 )
    ( on crate571 pallet571 )
    ( is-crate crate571 )
    ( clear crate571 )
    ( surface-at pallet43 place274 )
    ( surface-at crate43 place274 )
    ( on crate43 pallet43 )
    ( is-crate crate43 )
    ( clear crate43 )
    ( surface-at pallet508 place29 )
    ( surface-at crate508 place29 )
    ( on crate508 pallet508 )
    ( is-crate crate508 )
    ( clear crate508 )
    ( surface-at pallet5 place36 )
    ( surface-at crate5 place36 )
    ( on crate5 pallet5 )
    ( is-crate crate5 )
    ( clear crate5 )
    ( surface-at pallet53 place770 )
    ( surface-at crate53 place770 )
    ( on crate53 pallet53 )
    ( is-crate crate53 )
    ( clear crate53 )
  )
  ( :goal
    ( and
    )
  )
)
