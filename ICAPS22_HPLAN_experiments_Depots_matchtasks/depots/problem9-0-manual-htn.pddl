( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place789 - place
    hoist789 - hoist
    place580 - place
    hoist580 - hoist
    place313 - place
    hoist313 - hoist
    place653 - place
    hoist653 - hoist
    place920 - place
    hoist920 - hoist
    place957 - place
    hoist957 - hoist
    place380 - place
    hoist380 - hoist
    place378 - place
    hoist378 - hoist
    place855 - place
    hoist855 - hoist
    place126 - place
    hoist126 - hoist
    place118 - place
    hoist118 - hoist
    place644 - place
    hoist644 - hoist
    place249 - place
    hoist249 - hoist
    place271 - place
    hoist271 - hoist
    place811 - place
    hoist811 - hoist
    place985 - place
    hoist985 - hoist
    place15 - place
    hoist15 - hoist
    place999 - place
    hoist999 - hoist
    place0 - place
    hoist0 - hoist
    crate513 - surface
    pallet513 - surface
    crate205 - surface
    pallet205 - surface
    crate840 - surface
    pallet840 - surface
    crate384 - surface
    pallet384 - surface
    crate419 - surface
    pallet419 - surface
    crate340 - surface
    pallet340 - surface
    crate849 - surface
    pallet849 - surface
    crate736 - surface
    pallet736 - surface
    crate132 - surface
    pallet132 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist789 place789 )
    ( available hoist789 )
    ( hoist-at hoist580 place580 )
    ( available hoist580 )
    ( hoist-at hoist313 place313 )
    ( available hoist313 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist920 place920 )
    ( available hoist920 )
    ( hoist-at hoist957 place957 )
    ( available hoist957 )
    ( hoist-at hoist380 place380 )
    ( available hoist380 )
    ( hoist-at hoist378 place378 )
    ( available hoist378 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist126 place126 )
    ( available hoist126 )
    ( hoist-at hoist118 place118 )
    ( available hoist118 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist249 place249 )
    ( available hoist249 )
    ( hoist-at hoist271 place271 )
    ( available hoist271 )
    ( hoist-at hoist811 place811 )
    ( available hoist811 )
    ( hoist-at hoist985 place985 )
    ( available hoist985 )
    ( hoist-at hoist15 place15 )
    ( available hoist15 )
    ( hoist-at hoist999 place999 )
    ( available hoist999 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet513 place118 )
    ( surface-at crate513 place118 )
    ( on crate513 pallet513 )
    ( is-crate crate513 )
    ( clear crate513 )
    ( surface-at pallet205 place644 )
    ( surface-at crate205 place644 )
    ( on crate205 pallet205 )
    ( is-crate crate205 )
    ( clear crate205 )
    ( surface-at pallet840 place15 )
    ( surface-at crate840 place15 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet384 place118 )
    ( surface-at crate384 place118 )
    ( on crate384 pallet384 )
    ( is-crate crate384 )
    ( clear crate384 )
    ( surface-at pallet419 place126 )
    ( surface-at crate419 place126 )
    ( on crate419 pallet419 )
    ( is-crate crate419 )
    ( clear crate419 )
    ( surface-at pallet340 place920 )
    ( surface-at crate340 place920 )
    ( on crate340 pallet340 )
    ( is-crate crate340 )
    ( clear crate340 )
    ( surface-at pallet849 place580 )
    ( surface-at crate849 place580 )
    ( on crate849 pallet849 )
    ( is-crate crate849 )
    ( clear crate849 )
    ( surface-at pallet736 place644 )
    ( surface-at crate736 place644 )
    ( on crate736 pallet736 )
    ( is-crate crate736 )
    ( clear crate736 )
    ( surface-at pallet132 place118 )
    ( surface-at crate132 place118 )
    ( on crate132 pallet132 )
    ( is-crate crate132 )
    ( clear crate132 )
  )
  ( :tasks
    ( Make-On crate513 pallet0 )    ( Make-On crate205 crate513 )    ( Make-On crate840 crate205 )    ( Make-On crate384 crate840 )    ( Make-On crate419 crate384 )    ( Make-On crate340 crate419 )    ( Make-On crate849 crate340 )    ( Make-On crate736 crate849 )    ( Make-On crate132 crate736 )  )
)
