( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place634 - place
    hoist634 - hoist
    place330 - place
    hoist330 - hoist
    place729 - place
    hoist729 - hoist
    place739 - place
    hoist739 - hoist
    place406 - place
    hoist406 - hoist
    place444 - place
    hoist444 - hoist
    place440 - place
    hoist440 - hoist
    place16 - place
    hoist16 - hoist
    place190 - place
    hoist190 - hoist
    place357 - place
    hoist357 - hoist
    place602 - place
    hoist602 - hoist
    place279 - place
    hoist279 - hoist
    place624 - place
    hoist624 - hoist
    place742 - place
    hoist742 - hoist
    place726 - place
    hoist726 - hoist
    place670 - place
    hoist670 - hoist
    place639 - place
    hoist639 - hoist
    place208 - place
    hoist208 - hoist
    place925 - place
    hoist925 - hoist
    place718 - place
    hoist718 - hoist
    place0 - place
    hoist0 - hoist
    crate860 - surface
    pallet860 - surface
    crate721 - surface
    pallet721 - surface
    crate547 - surface
    pallet547 - surface
    crate611 - surface
    pallet611 - surface
    crate425 - surface
    pallet425 - surface
    crate117 - surface
    pallet117 - surface
    crate908 - surface
    pallet908 - surface
    crate238 - surface
    pallet238 - surface
    crate13 - surface
    pallet13 - surface
    crate218 - surface
    pallet218 - surface
    crate327 - surface
    pallet327 - surface
    crate575 - surface
    pallet575 - surface
    crate768 - surface
    pallet768 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist330 place330 )
    ( available hoist330 )
    ( hoist-at hoist729 place729 )
    ( available hoist729 )
    ( hoist-at hoist739 place739 )
    ( available hoist739 )
    ( hoist-at hoist406 place406 )
    ( available hoist406 )
    ( hoist-at hoist444 place444 )
    ( available hoist444 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist190 place190 )
    ( available hoist190 )
    ( hoist-at hoist357 place357 )
    ( available hoist357 )
    ( hoist-at hoist602 place602 )
    ( available hoist602 )
    ( hoist-at hoist279 place279 )
    ( available hoist279 )
    ( hoist-at hoist624 place624 )
    ( available hoist624 )
    ( hoist-at hoist742 place742 )
    ( available hoist742 )
    ( hoist-at hoist726 place726 )
    ( available hoist726 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist639 place639 )
    ( available hoist639 )
    ( hoist-at hoist208 place208 )
    ( available hoist208 )
    ( hoist-at hoist925 place925 )
    ( available hoist925 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet860 place602 )
    ( surface-at crate860 place602 )
    ( on crate860 pallet860 )
    ( is-crate crate860 )
    ( clear crate860 )
    ( surface-at pallet721 place634 )
    ( surface-at crate721 place634 )
    ( on crate721 pallet721 )
    ( is-crate crate721 )
    ( clear crate721 )
    ( surface-at pallet547 place670 )
    ( surface-at crate547 place670 )
    ( on crate547 pallet547 )
    ( is-crate crate547 )
    ( clear crate547 )
    ( surface-at pallet611 place639 )
    ( surface-at crate611 place639 )
    ( on crate611 pallet611 )
    ( is-crate crate611 )
    ( clear crate611 )
    ( surface-at pallet425 place406 )
    ( surface-at crate425 place406 )
    ( on crate425 pallet425 )
    ( is-crate crate425 )
    ( clear crate425 )
    ( surface-at pallet117 place208 )
    ( surface-at crate117 place208 )
    ( on crate117 pallet117 )
    ( is-crate crate117 )
    ( clear crate117 )
    ( surface-at pallet908 place357 )
    ( surface-at crate908 place357 )
    ( on crate908 pallet908 )
    ( is-crate crate908 )
    ( clear crate908 )
    ( surface-at pallet238 place279 )
    ( surface-at crate238 place279 )
    ( on crate238 pallet238 )
    ( is-crate crate238 )
    ( clear crate238 )
    ( surface-at pallet13 place624 )
    ( surface-at crate13 place624 )
    ( on crate13 pallet13 )
    ( is-crate crate13 )
    ( clear crate13 )
    ( surface-at pallet218 place440 )
    ( surface-at crate218 place440 )
    ( on crate218 pallet218 )
    ( is-crate crate218 )
    ( clear crate218 )
    ( surface-at pallet327 place190 )
    ( surface-at crate327 place190 )
    ( on crate327 pallet327 )
    ( is-crate crate327 )
    ( clear crate327 )
    ( surface-at pallet575 place16 )
    ( surface-at crate575 place16 )
    ( on crate575 pallet575 )
    ( is-crate crate575 )
    ( clear crate575 )
    ( surface-at pallet768 place718 )
    ( surface-at crate768 place718 )
    ( on crate768 pallet768 )
    ( is-crate crate768 )
    ( clear crate768 )
  )
  ( :tasks
    ( Make-On crate860 pallet0 )    ( Make-On crate721 crate860 )    ( Make-On crate547 crate721 )    ( Make-On crate611 crate547 )    ( Make-On crate425 crate611 )    ( Make-On crate117 crate425 )    ( Make-On crate908 crate117 )    ( Make-On crate238 crate908 )    ( Make-On crate13 crate238 )    ( Make-On crate218 crate13 )    ( Make-On crate327 crate218 )    ( Make-On crate575 crate327 )    ( Make-On crate768 crate575 )  )
)
