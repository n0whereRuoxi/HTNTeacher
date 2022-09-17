( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place449 - place
    hoist449 - hoist
    place295 - place
    hoist295 - hoist
    place94 - place
    hoist94 - hoist
    place203 - place
    hoist203 - hoist
    place948 - place
    hoist948 - hoist
    place599 - place
    hoist599 - hoist
    place328 - place
    hoist328 - hoist
    place928 - place
    hoist928 - hoist
    place166 - place
    hoist166 - hoist
    place480 - place
    hoist480 - hoist
    place191 - place
    hoist191 - hoist
    place0 - place
    hoist0 - hoist
    crate439 - surface
    pallet439 - surface
    crate852 - surface
    pallet852 - surface
    crate294 - surface
    pallet294 - surface
    crate743 - surface
    pallet743 - surface
    crate425 - surface
    pallet425 - surface
    crate138 - surface
    pallet138 - surface
    crate695 - surface
    pallet695 - surface
    crate820 - surface
    pallet820 - surface
    crate40 - surface
    pallet40 - surface
    crate928 - surface
    pallet928 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist449 place449 )
    ( available hoist449 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist94 place94 )
    ( available hoist94 )
    ( hoist-at hoist203 place203 )
    ( available hoist203 )
    ( hoist-at hoist948 place948 )
    ( available hoist948 )
    ( hoist-at hoist599 place599 )
    ( available hoist599 )
    ( hoist-at hoist328 place328 )
    ( available hoist328 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist166 place166 )
    ( available hoist166 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist191 place191 )
    ( available hoist191 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet439 place480 )
    ( surface-at crate439 place480 )
    ( on crate439 pallet439 )
    ( is-crate crate439 )
    ( clear crate439 )
    ( surface-at pallet852 place480 )
    ( surface-at crate852 place480 )
    ( on crate852 pallet852 )
    ( is-crate crate852 )
    ( clear crate852 )
    ( surface-at pallet294 place449 )
    ( surface-at crate294 place449 )
    ( on crate294 pallet294 )
    ( is-crate crate294 )
    ( clear crate294 )
    ( surface-at pallet743 place449 )
    ( surface-at crate743 place449 )
    ( on crate743 pallet743 )
    ( is-crate crate743 )
    ( clear crate743 )
    ( surface-at pallet425 place295 )
    ( surface-at crate425 place295 )
    ( on crate425 pallet425 )
    ( is-crate crate425 )
    ( clear crate425 )
    ( surface-at pallet138 place191 )
    ( surface-at crate138 place191 )
    ( on crate138 pallet138 )
    ( is-crate crate138 )
    ( clear crate138 )
    ( surface-at pallet695 place191 )
    ( surface-at crate695 place191 )
    ( on crate695 pallet695 )
    ( is-crate crate695 )
    ( clear crate695 )
    ( surface-at pallet820 place191 )
    ( surface-at crate820 place191 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet40 place599 )
    ( surface-at crate40 place599 )
    ( on crate40 pallet40 )
    ( is-crate crate40 )
    ( clear crate40 )
    ( surface-at pallet928 place295 )
    ( surface-at crate928 place295 )
    ( on crate928 pallet928 )
    ( is-crate crate928 )
    ( clear crate928 )
  )
  ( :tasks
    ( Make-On crate439 pallet0 )    ( Make-On crate852 crate439 )    ( Make-On crate294 crate852 )    ( Make-On crate743 crate294 )    ( Make-On crate425 crate743 )    ( Make-On crate138 crate425 )    ( Make-On crate695 crate138 )    ( Make-On crate820 crate695 )    ( Make-On crate40 crate820 )    ( Make-On crate928 crate40 )  )
)
