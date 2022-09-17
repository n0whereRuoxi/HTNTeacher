( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place743 - place
    hoist743 - hoist
    place310 - place
    hoist310 - hoist
    place269 - place
    hoist269 - hoist
    place797 - place
    hoist797 - hoist
    place836 - place
    hoist836 - hoist
    place112 - place
    hoist112 - hoist
    place254 - place
    hoist254 - hoist
    place0 - place
    hoist0 - hoist
    crate382 - surface
    pallet382 - surface
    crate352 - surface
    pallet352 - surface
    crate99 - surface
    pallet99 - surface
    crate802 - surface
    pallet802 - surface
    crate93 - surface
    pallet93 - surface
    crate50 - surface
    pallet50 - surface
    crate939 - surface
    pallet939 - surface
    crate4 - surface
    pallet4 - surface
    crate853 - surface
    pallet853 - surface
    crate794 - surface
    pallet794 - surface
    crate144 - surface
    pallet144 - surface
    crate323 - surface
    pallet323 - surface
    crate342 - surface
    pallet342 - surface
    crate550 - surface
    pallet550 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist743 place743 )
    ( available hoist743 )
    ( hoist-at hoist310 place310 )
    ( available hoist310 )
    ( hoist-at hoist269 place269 )
    ( available hoist269 )
    ( hoist-at hoist797 place797 )
    ( available hoist797 )
    ( hoist-at hoist836 place836 )
    ( available hoist836 )
    ( hoist-at hoist112 place112 )
    ( available hoist112 )
    ( hoist-at hoist254 place254 )
    ( available hoist254 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet382 place743 )
    ( surface-at crate382 place743 )
    ( on crate382 pallet382 )
    ( is-crate crate382 )
    ( clear crate382 )
    ( surface-at pallet352 place269 )
    ( surface-at crate352 place269 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet99 place310 )
    ( surface-at crate99 place310 )
    ( on crate99 pallet99 )
    ( is-crate crate99 )
    ( clear crate99 )
    ( surface-at pallet802 place836 )
    ( surface-at crate802 place836 )
    ( on crate802 pallet802 )
    ( is-crate crate802 )
    ( clear crate802 )
    ( surface-at pallet93 place269 )
    ( surface-at crate93 place269 )
    ( on crate93 pallet93 )
    ( is-crate crate93 )
    ( clear crate93 )
    ( surface-at pallet50 place836 )
    ( surface-at crate50 place836 )
    ( on crate50 pallet50 )
    ( is-crate crate50 )
    ( clear crate50 )
    ( surface-at pallet939 place743 )
    ( surface-at crate939 place743 )
    ( on crate939 pallet939 )
    ( is-crate crate939 )
    ( clear crate939 )
    ( surface-at pallet4 place743 )
    ( surface-at crate4 place743 )
    ( on crate4 pallet4 )
    ( is-crate crate4 )
    ( clear crate4 )
    ( surface-at pallet853 place797 )
    ( surface-at crate853 place797 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
    ( surface-at pallet794 place112 )
    ( surface-at crate794 place112 )
    ( on crate794 pallet794 )
    ( is-crate crate794 )
    ( clear crate794 )
    ( surface-at pallet144 place112 )
    ( surface-at crate144 place112 )
    ( on crate144 pallet144 )
    ( is-crate crate144 )
    ( clear crate144 )
    ( surface-at pallet323 place310 )
    ( surface-at crate323 place310 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
    ( surface-at pallet342 place112 )
    ( surface-at crate342 place112 )
    ( on crate342 pallet342 )
    ( is-crate crate342 )
    ( clear crate342 )
    ( surface-at pallet550 place254 )
    ( surface-at crate550 place254 )
    ( on crate550 pallet550 )
    ( is-crate crate550 )
    ( clear crate550 )
  )
  ( :tasks
    ( Make-On crate382 pallet0 )    ( Make-On crate352 crate382 )    ( Make-On crate99 crate352 )    ( Make-On crate802 crate99 )    ( Make-On crate93 crate802 )    ( Make-On crate50 crate93 )    ( Make-On crate939 crate50 )    ( Make-On crate4 crate939 )    ( Make-On crate853 crate4 )    ( Make-On crate794 crate853 )    ( Make-On crate144 crate794 )    ( Make-On crate323 crate144 )    ( Make-On crate342 crate323 )    ( Make-On crate550 crate342 )  )
)
