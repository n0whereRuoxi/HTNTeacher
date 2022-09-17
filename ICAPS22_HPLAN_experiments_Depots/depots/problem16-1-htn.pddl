( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place360 - place
    hoist360 - hoist
    place112 - place
    hoist112 - hoist
    place611 - place
    hoist611 - hoist
    place965 - place
    hoist965 - hoist
    place591 - place
    hoist591 - hoist
    place576 - place
    hoist576 - hoist
    place660 - place
    hoist660 - hoist
    place406 - place
    hoist406 - hoist
    place395 - place
    hoist395 - hoist
    place971 - place
    hoist971 - hoist
    place438 - place
    hoist438 - hoist
    place6 - place
    hoist6 - hoist
    place70 - place
    hoist70 - hoist
    place801 - place
    hoist801 - hoist
    place108 - place
    hoist108 - hoist
    place23 - place
    hoist23 - hoist
    place379 - place
    hoist379 - hoist
    place508 - place
    hoist508 - hoist
    place345 - place
    hoist345 - hoist
    place148 - place
    hoist148 - hoist
    place0 - place
    hoist0 - hoist
    crate106 - surface
    pallet106 - surface
    crate709 - surface
    pallet709 - surface
    crate130 - surface
    pallet130 - surface
    crate769 - surface
    pallet769 - surface
    crate344 - surface
    pallet344 - surface
    crate157 - surface
    pallet157 - surface
    crate975 - surface
    pallet975 - surface
    crate93 - surface
    pallet93 - surface
    crate262 - surface
    pallet262 - surface
    crate67 - surface
    pallet67 - surface
    crate913 - surface
    pallet913 - surface
    crate328 - surface
    pallet328 - surface
    crate481 - surface
    pallet481 - surface
    crate784 - surface
    pallet784 - surface
    crate569 - surface
    pallet569 - surface
    crate361 - surface
    pallet361 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist360 place360 )
    ( available hoist360 )
    ( hoist-at hoist112 place112 )
    ( available hoist112 )
    ( hoist-at hoist611 place611 )
    ( available hoist611 )
    ( hoist-at hoist965 place965 )
    ( available hoist965 )
    ( hoist-at hoist591 place591 )
    ( available hoist591 )
    ( hoist-at hoist576 place576 )
    ( available hoist576 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist406 place406 )
    ( available hoist406 )
    ( hoist-at hoist395 place395 )
    ( available hoist395 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist438 place438 )
    ( available hoist438 )
    ( hoist-at hoist6 place6 )
    ( available hoist6 )
    ( hoist-at hoist70 place70 )
    ( available hoist70 )
    ( hoist-at hoist801 place801 )
    ( available hoist801 )
    ( hoist-at hoist108 place108 )
    ( available hoist108 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist379 place379 )
    ( available hoist379 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist345 place345 )
    ( available hoist345 )
    ( hoist-at hoist148 place148 )
    ( available hoist148 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet106 place395 )
    ( surface-at crate106 place395 )
    ( on crate106 pallet106 )
    ( is-crate crate106 )
    ( clear crate106 )
    ( surface-at pallet709 place379 )
    ( surface-at crate709 place379 )
    ( on crate709 pallet709 )
    ( is-crate crate709 )
    ( clear crate709 )
    ( surface-at pallet130 place360 )
    ( surface-at crate130 place360 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
    ( surface-at pallet769 place438 )
    ( surface-at crate769 place438 )
    ( on crate769 pallet769 )
    ( is-crate crate769 )
    ( clear crate769 )
    ( surface-at pallet344 place965 )
    ( surface-at crate344 place965 )
    ( on crate344 pallet344 )
    ( is-crate crate344 )
    ( clear crate344 )
    ( surface-at pallet157 place70 )
    ( surface-at crate157 place70 )
    ( on crate157 pallet157 )
    ( is-crate crate157 )
    ( clear crate157 )
    ( surface-at pallet975 place23 )
    ( surface-at crate975 place23 )
    ( on crate975 pallet975 )
    ( is-crate crate975 )
    ( clear crate975 )
    ( surface-at pallet93 place108 )
    ( surface-at crate93 place108 )
    ( on crate93 pallet93 )
    ( is-crate crate93 )
    ( clear crate93 )
    ( surface-at pallet262 place148 )
    ( surface-at crate262 place148 )
    ( on crate262 pallet262 )
    ( is-crate crate262 )
    ( clear crate262 )
    ( surface-at pallet67 place611 )
    ( surface-at crate67 place611 )
    ( on crate67 pallet67 )
    ( is-crate crate67 )
    ( clear crate67 )
    ( surface-at pallet913 place395 )
    ( surface-at crate913 place395 )
    ( on crate913 pallet913 )
    ( is-crate crate913 )
    ( clear crate913 )
    ( surface-at pallet328 place971 )
    ( surface-at crate328 place971 )
    ( on crate328 pallet328 )
    ( is-crate crate328 )
    ( clear crate328 )
    ( surface-at pallet481 place108 )
    ( surface-at crate481 place108 )
    ( on crate481 pallet481 )
    ( is-crate crate481 )
    ( clear crate481 )
    ( surface-at pallet784 place6 )
    ( surface-at crate784 place6 )
    ( on crate784 pallet784 )
    ( is-crate crate784 )
    ( clear crate784 )
    ( surface-at pallet569 place965 )
    ( surface-at crate569 place965 )
    ( on crate569 pallet569 )
    ( is-crate crate569 )
    ( clear crate569 )
    ( surface-at pallet361 place395 )
    ( surface-at crate361 place395 )
    ( on crate361 pallet361 )
    ( is-crate crate361 )
    ( clear crate361 )
  )
  ( :tasks
    ( Make-On crate106 pallet0 )    ( Make-On crate709 crate106 )    ( Make-On crate130 crate709 )    ( Make-On crate769 crate130 )    ( Make-On crate344 crate769 )    ( Make-On crate157 crate344 )    ( Make-On crate975 crate157 )    ( Make-On crate93 crate975 )    ( Make-On crate262 crate93 )    ( Make-On crate67 crate262 )    ( Make-On crate913 crate67 )    ( Make-On crate328 crate913 )    ( Make-On crate481 crate328 )    ( Make-On crate784 crate481 )    ( Make-On crate569 crate784 )    ( Make-On crate361 crate569 )  )
)
