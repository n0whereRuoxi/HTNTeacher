( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place771 - place
    hoist771 - hoist
    place530 - place
    hoist530 - hoist
    place345 - place
    hoist345 - hoist
    place795 - place
    hoist795 - hoist
    place653 - place
    hoist653 - hoist
    place175 - place
    hoist175 - hoist
    place469 - place
    hoist469 - hoist
    place927 - place
    hoist927 - hoist
    place235 - place
    hoist235 - hoist
    place794 - place
    hoist794 - hoist
    place766 - place
    hoist766 - hoist
    place860 - place
    hoist860 - hoist
    place445 - place
    hoist445 - hoist
    place612 - place
    hoist612 - hoist
    place894 - place
    hoist894 - hoist
    place96 - place
    hoist96 - hoist
    place134 - place
    hoist134 - hoist
    place848 - place
    hoist848 - hoist
    place435 - place
    hoist435 - hoist
    place478 - place
    hoist478 - hoist
    place0 - place
    hoist0 - hoist
    crate178 - surface
    pallet178 - surface
    crate111 - surface
    pallet111 - surface
    crate742 - surface
    pallet742 - surface
    crate464 - surface
    pallet464 - surface
    crate163 - surface
    pallet163 - surface
    crate384 - surface
    pallet384 - surface
    crate883 - surface
    pallet883 - surface
    crate878 - surface
    pallet878 - surface
    crate978 - surface
    pallet978 - surface
    crate463 - surface
    pallet463 - surface
    crate973 - surface
    pallet973 - surface
    crate459 - surface
    pallet459 - surface
    crate338 - surface
    pallet338 - surface
    crate73 - surface
    pallet73 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist771 place771 )
    ( available hoist771 )
    ( hoist-at hoist530 place530 )
    ( available hoist530 )
    ( hoist-at hoist345 place345 )
    ( available hoist345 )
    ( hoist-at hoist795 place795 )
    ( available hoist795 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist175 place175 )
    ( available hoist175 )
    ( hoist-at hoist469 place469 )
    ( available hoist469 )
    ( hoist-at hoist927 place927 )
    ( available hoist927 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist794 place794 )
    ( available hoist794 )
    ( hoist-at hoist766 place766 )
    ( available hoist766 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( hoist-at hoist445 place445 )
    ( available hoist445 )
    ( hoist-at hoist612 place612 )
    ( available hoist612 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist96 place96 )
    ( available hoist96 )
    ( hoist-at hoist134 place134 )
    ( available hoist134 )
    ( hoist-at hoist848 place848 )
    ( available hoist848 )
    ( hoist-at hoist435 place435 )
    ( available hoist435 )
    ( hoist-at hoist478 place478 )
    ( available hoist478 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet178 place860 )
    ( surface-at crate178 place860 )
    ( on crate178 pallet178 )
    ( is-crate crate178 )
    ( clear crate178 )
    ( surface-at pallet111 place794 )
    ( surface-at crate111 place794 )
    ( on crate111 pallet111 )
    ( is-crate crate111 )
    ( clear crate111 )
    ( surface-at pallet742 place435 )
    ( surface-at crate742 place435 )
    ( on crate742 pallet742 )
    ( is-crate crate742 )
    ( clear crate742 )
    ( surface-at pallet464 place771 )
    ( surface-at crate464 place771 )
    ( on crate464 pallet464 )
    ( is-crate crate464 )
    ( clear crate464 )
    ( surface-at pallet163 place612 )
    ( surface-at crate163 place612 )
    ( on crate163 pallet163 )
    ( is-crate crate163 )
    ( clear crate163 )
    ( surface-at pallet384 place927 )
    ( surface-at crate384 place927 )
    ( on crate384 pallet384 )
    ( is-crate crate384 )
    ( clear crate384 )
    ( surface-at pallet883 place345 )
    ( surface-at crate883 place345 )
    ( on crate883 pallet883 )
    ( is-crate crate883 )
    ( clear crate883 )
    ( surface-at pallet878 place794 )
    ( surface-at crate878 place794 )
    ( on crate878 pallet878 )
    ( is-crate crate878 )
    ( clear crate878 )
    ( surface-at pallet978 place766 )
    ( surface-at crate978 place766 )
    ( on crate978 pallet978 )
    ( is-crate crate978 )
    ( clear crate978 )
    ( surface-at pallet463 place848 )
    ( surface-at crate463 place848 )
    ( on crate463 pallet463 )
    ( is-crate crate463 )
    ( clear crate463 )
    ( surface-at pallet973 place445 )
    ( surface-at crate973 place445 )
    ( on crate973 pallet973 )
    ( is-crate crate973 )
    ( clear crate973 )
    ( surface-at pallet459 place530 )
    ( surface-at crate459 place530 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
    ( surface-at pallet338 place235 )
    ( surface-at crate338 place235 )
    ( on crate338 pallet338 )
    ( is-crate crate338 )
    ( clear crate338 )
    ( surface-at pallet73 place478 )
    ( surface-at crate73 place478 )
    ( on crate73 pallet73 )
    ( is-crate crate73 )
    ( clear crate73 )
  )
  ( :tasks
    ( Make-On crate178 pallet0 )    ( Make-On crate111 crate178 )    ( Make-On crate742 crate111 )    ( Make-On crate464 crate742 )    ( Make-On crate163 crate464 )    ( Make-On crate384 crate163 )    ( Make-On crate883 crate384 )    ( Make-On crate878 crate883 )    ( Make-On crate978 crate878 )    ( Make-On crate463 crate978 )    ( Make-On crate973 crate463 )    ( Make-On crate459 crate973 )    ( Make-On crate338 crate459 )    ( Make-On crate73 crate338 )  )
)
