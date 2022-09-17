( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place240 - place
    hoist240 - hoist
    place975 - place
    hoist975 - hoist
    place241 - place
    hoist241 - hoist
    place404 - place
    hoist404 - hoist
    place890 - place
    hoist890 - hoist
    place786 - place
    hoist786 - hoist
    place127 - place
    hoist127 - hoist
    place426 - place
    hoist426 - hoist
    place621 - place
    hoist621 - hoist
    place0 - place
    hoist0 - hoist
    crate830 - surface
    pallet830 - surface
    crate347 - surface
    pallet347 - surface
    crate266 - surface
    pallet266 - surface
    crate360 - surface
    pallet360 - surface
    crate512 - surface
    pallet512 - surface
    crate778 - surface
    pallet778 - surface
    crate621 - surface
    pallet621 - surface
    crate252 - surface
    pallet252 - surface
    crate51 - surface
    pallet51 - surface
    crate481 - surface
    pallet481 - surface
    crate108 - surface
    pallet108 - surface
    crate951 - surface
    pallet951 - surface
    crate653 - surface
    pallet653 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist240 place240 )
    ( available hoist240 )
    ( hoist-at hoist975 place975 )
    ( available hoist975 )
    ( hoist-at hoist241 place241 )
    ( available hoist241 )
    ( hoist-at hoist404 place404 )
    ( available hoist404 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist786 place786 )
    ( available hoist786 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist426 place426 )
    ( available hoist426 )
    ( hoist-at hoist621 place621 )
    ( available hoist621 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet830 place621 )
    ( surface-at crate830 place621 )
    ( on crate830 pallet830 )
    ( is-crate crate830 )
    ( clear crate830 )
    ( surface-at pallet347 place127 )
    ( surface-at crate347 place127 )
    ( on crate347 pallet347 )
    ( is-crate crate347 )
    ( clear crate347 )
    ( surface-at pallet266 place890 )
    ( surface-at crate266 place890 )
    ( on crate266 pallet266 )
    ( is-crate crate266 )
    ( clear crate266 )
    ( surface-at pallet360 place404 )
    ( surface-at crate360 place404 )
    ( on crate360 pallet360 )
    ( is-crate crate360 )
    ( clear crate360 )
    ( surface-at pallet512 place426 )
    ( surface-at crate512 place426 )
    ( on crate512 pallet512 )
    ( is-crate crate512 )
    ( clear crate512 )
    ( surface-at pallet778 place240 )
    ( surface-at crate778 place240 )
    ( on crate778 pallet778 )
    ( is-crate crate778 )
    ( clear crate778 )
    ( surface-at pallet621 place786 )
    ( surface-at crate621 place786 )
    ( on crate621 pallet621 )
    ( is-crate crate621 )
    ( clear crate621 )
    ( surface-at pallet252 place240 )
    ( surface-at crate252 place240 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet51 place786 )
    ( surface-at crate51 place786 )
    ( on crate51 pallet51 )
    ( is-crate crate51 )
    ( clear crate51 )
    ( surface-at pallet481 place241 )
    ( surface-at crate481 place241 )
    ( on crate481 pallet481 )
    ( is-crate crate481 )
    ( clear crate481 )
    ( surface-at pallet108 place127 )
    ( surface-at crate108 place127 )
    ( on crate108 pallet108 )
    ( is-crate crate108 )
    ( clear crate108 )
    ( surface-at pallet951 place786 )
    ( surface-at crate951 place786 )
    ( on crate951 pallet951 )
    ( is-crate crate951 )
    ( clear crate951 )
    ( surface-at pallet653 place975 )
    ( surface-at crate653 place975 )
    ( on crate653 pallet653 )
    ( is-crate crate653 )
    ( clear crate653 )
  )
  ( :tasks
    ( Make-On crate830 pallet0 )    ( Make-On crate347 crate830 )    ( Make-On crate266 crate347 )    ( Make-On crate360 crate266 )    ( Make-On crate512 crate360 )    ( Make-On crate778 crate512 )    ( Make-On crate621 crate778 )    ( Make-On crate252 crate621 )    ( Make-On crate51 crate252 )    ( Make-On crate481 crate51 )    ( Make-On crate108 crate481 )    ( Make-On crate951 crate108 )    ( Make-On crate653 crate951 )  )
)
