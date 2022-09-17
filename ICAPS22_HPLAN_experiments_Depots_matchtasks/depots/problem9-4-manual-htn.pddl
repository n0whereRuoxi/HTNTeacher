( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place545 - place
    hoist545 - hoist
    place640 - place
    hoist640 - hoist
    place758 - place
    hoist758 - hoist
    place723 - place
    hoist723 - hoist
    place324 - place
    hoist324 - hoist
    place111 - place
    hoist111 - hoist
    place0 - place
    hoist0 - hoist
    crate157 - surface
    pallet157 - surface
    crate959 - surface
    pallet959 - surface
    crate350 - surface
    pallet350 - surface
    crate521 - surface
    pallet521 - surface
    crate456 - surface
    pallet456 - surface
    crate987 - surface
    pallet987 - surface
    crate641 - surface
    pallet641 - surface
    crate583 - surface
    pallet583 - surface
    crate820 - surface
    pallet820 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist545 place545 )
    ( available hoist545 )
    ( hoist-at hoist640 place640 )
    ( available hoist640 )
    ( hoist-at hoist758 place758 )
    ( available hoist758 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist111 place111 )
    ( available hoist111 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet157 place640 )
    ( surface-at crate157 place640 )
    ( on crate157 pallet157 )
    ( is-crate crate157 )
    ( clear crate157 )
    ( surface-at pallet959 place640 )
    ( surface-at crate959 place640 )
    ( on crate959 pallet959 )
    ( is-crate crate959 )
    ( clear crate959 )
    ( surface-at pallet350 place545 )
    ( surface-at crate350 place545 )
    ( on crate350 pallet350 )
    ( is-crate crate350 )
    ( clear crate350 )
    ( surface-at pallet521 place723 )
    ( surface-at crate521 place723 )
    ( on crate521 pallet521 )
    ( is-crate crate521 )
    ( clear crate521 )
    ( surface-at pallet456 place758 )
    ( surface-at crate456 place758 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
    ( surface-at pallet987 place723 )
    ( surface-at crate987 place723 )
    ( on crate987 pallet987 )
    ( is-crate crate987 )
    ( clear crate987 )
    ( surface-at pallet641 place545 )
    ( surface-at crate641 place545 )
    ( on crate641 pallet641 )
    ( is-crate crate641 )
    ( clear crate641 )
    ( surface-at pallet583 place324 )
    ( surface-at crate583 place324 )
    ( on crate583 pallet583 )
    ( is-crate crate583 )
    ( clear crate583 )
    ( surface-at pallet820 place723 )
    ( surface-at crate820 place723 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
  )
  ( :tasks
    ( Make-On crate157 pallet0 )    ( Make-On crate959 crate157 )    ( Make-On crate350 crate959 )    ( Make-On crate521 crate350 )    ( Make-On crate456 crate521 )    ( Make-On crate987 crate456 )    ( Make-On crate641 crate987 )    ( Make-On crate583 crate641 )    ( Make-On crate820 crate583 )  )
)
