( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place311 - place
    hoist311 - hoist
    place38 - place
    hoist38 - hoist
    place446 - place
    hoist446 - hoist
    place960 - place
    hoist960 - hoist
    place0 - place
    hoist0 - hoist
    crate509 - surface
    pallet509 - surface
    crate940 - surface
    pallet940 - surface
    crate328 - surface
    pallet328 - surface
    crate580 - surface
    pallet580 - surface
    crate428 - surface
    pallet428 - surface
    crate573 - surface
    pallet573 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist311 place311 )
    ( available hoist311 )
    ( hoist-at hoist38 place38 )
    ( available hoist38 )
    ( hoist-at hoist446 place446 )
    ( available hoist446 )
    ( hoist-at hoist960 place960 )
    ( available hoist960 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet509 place311 )
    ( surface-at crate509 place311 )
    ( on crate509 pallet509 )
    ( is-crate crate509 )
    ( clear crate509 )
    ( surface-at pallet940 place311 )
    ( surface-at crate940 place311 )
    ( on crate940 pallet940 )
    ( is-crate crate940 )
    ( clear crate940 )
    ( surface-at pallet328 place960 )
    ( surface-at crate328 place960 )
    ( on crate328 pallet328 )
    ( is-crate crate328 )
    ( clear crate328 )
    ( surface-at pallet580 place446 )
    ( surface-at crate580 place446 )
    ( on crate580 pallet580 )
    ( is-crate crate580 )
    ( clear crate580 )
    ( surface-at pallet428 place960 )
    ( surface-at crate428 place960 )
    ( on crate428 pallet428 )
    ( is-crate crate428 )
    ( clear crate428 )
    ( surface-at pallet573 place960 )
    ( surface-at crate573 place960 )
    ( on crate573 pallet573 )
    ( is-crate crate573 )
    ( clear crate573 )
  )
  ( :tasks
    ( Make-On crate509 pallet0 )    ( Make-On crate940 crate509 )    ( Make-On crate328 crate940 )    ( Make-On crate580 crate328 )    ( Make-On crate428 crate580 )    ( Make-On crate573 crate428 )  )
)
