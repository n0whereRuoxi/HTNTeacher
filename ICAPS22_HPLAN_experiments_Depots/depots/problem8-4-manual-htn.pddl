( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place145 - place
    hoist145 - hoist
    place391 - place
    hoist391 - hoist
    place270 - place
    hoist270 - hoist
    place166 - place
    hoist166 - hoist
    place901 - place
    hoist901 - hoist
    place356 - place
    hoist356 - hoist
    place944 - place
    hoist944 - hoist
    place480 - place
    hoist480 - hoist
    place857 - place
    hoist857 - hoist
    place852 - place
    hoist852 - hoist
    place937 - place
    hoist937 - hoist
    place687 - place
    hoist687 - hoist
    place0 - place
    hoist0 - hoist
    crate466 - surface
    pallet466 - surface
    crate414 - surface
    pallet414 - surface
    crate355 - surface
    pallet355 - surface
    crate346 - surface
    pallet346 - surface
    crate573 - surface
    pallet573 - surface
    crate61 - surface
    pallet61 - surface
    crate34 - surface
    pallet34 - surface
    crate687 - surface
    pallet687 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist145 place145 )
    ( available hoist145 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist166 place166 )
    ( available hoist166 )
    ( hoist-at hoist901 place901 )
    ( available hoist901 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist944 place944 )
    ( available hoist944 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist857 place857 )
    ( available hoist857 )
    ( hoist-at hoist852 place852 )
    ( available hoist852 )
    ( hoist-at hoist937 place937 )
    ( available hoist937 )
    ( hoist-at hoist687 place687 )
    ( available hoist687 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet466 place852 )
    ( surface-at crate466 place852 )
    ( on crate466 pallet466 )
    ( is-crate crate466 )
    ( clear crate466 )
    ( surface-at pallet414 place145 )
    ( surface-at crate414 place145 )
    ( on crate414 pallet414 )
    ( is-crate crate414 )
    ( clear crate414 )
    ( surface-at pallet355 place145 )
    ( surface-at crate355 place145 )
    ( on crate355 pallet355 )
    ( is-crate crate355 )
    ( clear crate355 )
    ( surface-at pallet346 place852 )
    ( surface-at crate346 place852 )
    ( on crate346 pallet346 )
    ( is-crate crate346 )
    ( clear crate346 )
    ( surface-at pallet573 place391 )
    ( surface-at crate573 place391 )
    ( on crate573 pallet573 )
    ( is-crate crate573 )
    ( clear crate573 )
    ( surface-at pallet61 place356 )
    ( surface-at crate61 place356 )
    ( on crate61 pallet61 )
    ( is-crate crate61 )
    ( clear crate61 )
    ( surface-at pallet34 place356 )
    ( surface-at crate34 place356 )
    ( on crate34 pallet34 )
    ( is-crate crate34 )
    ( clear crate34 )
    ( surface-at pallet687 place852 )
    ( surface-at crate687 place852 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
  )
  ( :tasks
    ( Make-On crate466 pallet0 )    ( Make-On crate414 crate466 )    ( Make-On crate355 crate414 )    ( Make-On crate346 crate355 )    ( Make-On crate573 crate346 )    ( Make-On crate61 crate573 )    ( Make-On crate34 crate61 )    ( Make-On crate687 crate34 )  )
)
