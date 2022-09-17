( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place641 - place
    hoist641 - hoist
    place785 - place
    hoist785 - hoist
    place228 - place
    hoist228 - hoist
    place635 - place
    hoist635 - hoist
    place357 - place
    hoist357 - hoist
    place533 - place
    hoist533 - hoist
    place138 - place
    hoist138 - hoist
    place451 - place
    hoist451 - hoist
    place0 - place
    hoist0 - hoist
    crate899 - surface
    pallet899 - surface
    crate805 - surface
    pallet805 - surface
    crate922 - surface
    pallet922 - surface
    crate100 - surface
    pallet100 - surface
    crate654 - surface
    pallet654 - surface
    crate388 - surface
    pallet388 - surface
    crate56 - surface
    pallet56 - surface
    crate898 - surface
    pallet898 - surface
    crate229 - surface
    pallet229 - surface
    crate838 - surface
    pallet838 - surface
    crate337 - surface
    pallet337 - surface
    crate385 - surface
    pallet385 - surface
    crate354 - surface
    pallet354 - surface
    crate526 - surface
    pallet526 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist785 place785 )
    ( available hoist785 )
    ( hoist-at hoist228 place228 )
    ( available hoist228 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist357 place357 )
    ( available hoist357 )
    ( hoist-at hoist533 place533 )
    ( available hoist533 )
    ( hoist-at hoist138 place138 )
    ( available hoist138 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet899 place641 )
    ( surface-at crate899 place641 )
    ( on crate899 pallet899 )
    ( is-crate crate899 )
    ( clear crate899 )
    ( surface-at pallet805 place357 )
    ( surface-at crate805 place357 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet922 place451 )
    ( surface-at crate922 place451 )
    ( on crate922 pallet922 )
    ( is-crate crate922 )
    ( clear crate922 )
    ( surface-at pallet100 place451 )
    ( surface-at crate100 place451 )
    ( on crate100 pallet100 )
    ( is-crate crate100 )
    ( clear crate100 )
    ( surface-at pallet654 place357 )
    ( surface-at crate654 place357 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet388 place641 )
    ( surface-at crate388 place641 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet56 place138 )
    ( surface-at crate56 place138 )
    ( on crate56 pallet56 )
    ( is-crate crate56 )
    ( clear crate56 )
    ( surface-at pallet898 place138 )
    ( surface-at crate898 place138 )
    ( on crate898 pallet898 )
    ( is-crate crate898 )
    ( clear crate898 )
    ( surface-at pallet229 place785 )
    ( surface-at crate229 place785 )
    ( on crate229 pallet229 )
    ( is-crate crate229 )
    ( clear crate229 )
    ( surface-at pallet838 place357 )
    ( surface-at crate838 place357 )
    ( on crate838 pallet838 )
    ( is-crate crate838 )
    ( clear crate838 )
    ( surface-at pallet337 place451 )
    ( surface-at crate337 place451 )
    ( on crate337 pallet337 )
    ( is-crate crate337 )
    ( clear crate337 )
    ( surface-at pallet385 place641 )
    ( surface-at crate385 place641 )
    ( on crate385 pallet385 )
    ( is-crate crate385 )
    ( clear crate385 )
    ( surface-at pallet354 place785 )
    ( surface-at crate354 place785 )
    ( on crate354 pallet354 )
    ( is-crate crate354 )
    ( clear crate354 )
    ( surface-at pallet526 place357 )
    ( surface-at crate526 place357 )
    ( on crate526 pallet526 )
    ( is-crate crate526 )
    ( clear crate526 )
  )
  ( :tasks
    ( Make-On crate899 pallet0 )    ( Make-On crate805 crate899 )    ( Make-On crate922 crate805 )    ( Make-On crate100 crate922 )    ( Make-On crate654 crate100 )    ( Make-On crate388 crate654 )    ( Make-On crate56 crate388 )    ( Make-On crate898 crate56 )    ( Make-On crate229 crate898 )    ( Make-On crate838 crate229 )    ( Make-On crate337 crate838 )    ( Make-On crate385 crate337 )    ( Make-On crate354 crate385 )    ( Make-On crate526 crate354 )  )
)
