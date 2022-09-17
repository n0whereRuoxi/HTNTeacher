( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place297 - place
    hoist297 - hoist
    place192 - place
    hoist192 - hoist
    place351 - place
    hoist351 - hoist
    place696 - place
    hoist696 - hoist
    place33 - place
    hoist33 - hoist
    place889 - place
    hoist889 - hoist
    place376 - place
    hoist376 - hoist
    place463 - place
    hoist463 - hoist
    place503 - place
    hoist503 - hoist
    place278 - place
    hoist278 - hoist
    place287 - place
    hoist287 - hoist
    place0 - place
    hoist0 - hoist
    crate475 - surface
    pallet475 - surface
    crate562 - surface
    pallet562 - surface
    crate484 - surface
    pallet484 - surface
    crate535 - surface
    pallet535 - surface
    crate909 - surface
    pallet909 - surface
    crate132 - surface
    pallet132 - surface
    crate636 - surface
    pallet636 - surface
    crate294 - surface
    pallet294 - surface
    crate879 - surface
    pallet879 - surface
    crate111 - surface
    pallet111 - surface
    crate298 - surface
    pallet298 - surface
    crate104 - surface
    pallet104 - surface
    crate592 - surface
    pallet592 - surface
    crate54 - surface
    pallet54 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist297 place297 )
    ( available hoist297 )
    ( hoist-at hoist192 place192 )
    ( available hoist192 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist696 place696 )
    ( available hoist696 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist889 place889 )
    ( available hoist889 )
    ( hoist-at hoist376 place376 )
    ( available hoist376 )
    ( hoist-at hoist463 place463 )
    ( available hoist463 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist278 place278 )
    ( available hoist278 )
    ( hoist-at hoist287 place287 )
    ( available hoist287 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet475 place287 )
    ( surface-at crate475 place287 )
    ( on crate475 pallet475 )
    ( is-crate crate475 )
    ( clear crate475 )
    ( surface-at pallet562 place192 )
    ( surface-at crate562 place192 )
    ( on crate562 pallet562 )
    ( is-crate crate562 )
    ( clear crate562 )
    ( surface-at pallet484 place33 )
    ( surface-at crate484 place33 )
    ( on crate484 pallet484 )
    ( is-crate crate484 )
    ( clear crate484 )
    ( surface-at pallet535 place463 )
    ( surface-at crate535 place463 )
    ( on crate535 pallet535 )
    ( is-crate crate535 )
    ( clear crate535 )
    ( surface-at pallet909 place503 )
    ( surface-at crate909 place503 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
    ( surface-at pallet132 place33 )
    ( surface-at crate132 place33 )
    ( on crate132 pallet132 )
    ( is-crate crate132 )
    ( clear crate132 )
    ( surface-at pallet636 place889 )
    ( surface-at crate636 place889 )
    ( on crate636 pallet636 )
    ( is-crate crate636 )
    ( clear crate636 )
    ( surface-at pallet294 place351 )
    ( surface-at crate294 place351 )
    ( on crate294 pallet294 )
    ( is-crate crate294 )
    ( clear crate294 )
    ( surface-at pallet879 place297 )
    ( surface-at crate879 place297 )
    ( on crate879 pallet879 )
    ( is-crate crate879 )
    ( clear crate879 )
    ( surface-at pallet111 place889 )
    ( surface-at crate111 place889 )
    ( on crate111 pallet111 )
    ( is-crate crate111 )
    ( clear crate111 )
    ( surface-at pallet298 place696 )
    ( surface-at crate298 place696 )
    ( on crate298 pallet298 )
    ( is-crate crate298 )
    ( clear crate298 )
    ( surface-at pallet104 place351 )
    ( surface-at crate104 place351 )
    ( on crate104 pallet104 )
    ( is-crate crate104 )
    ( clear crate104 )
    ( surface-at pallet592 place696 )
    ( surface-at crate592 place696 )
    ( on crate592 pallet592 )
    ( is-crate crate592 )
    ( clear crate592 )
    ( surface-at pallet54 place696 )
    ( surface-at crate54 place696 )
    ( on crate54 pallet54 )
    ( is-crate crate54 )
    ( clear crate54 )
  )
  ( :goal
    ( and
    )
  )
)
