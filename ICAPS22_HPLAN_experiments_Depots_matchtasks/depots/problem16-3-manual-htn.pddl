( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place861 - place
    hoist861 - hoist
    place35 - place
    hoist35 - hoist
    place188 - place
    hoist188 - hoist
    place289 - place
    hoist289 - hoist
    place679 - place
    hoist679 - hoist
    place670 - place
    hoist670 - hoist
    place213 - place
    hoist213 - hoist
    place86 - place
    hoist86 - hoist
    place617 - place
    hoist617 - hoist
    place195 - place
    hoist195 - hoist
    place263 - place
    hoist263 - hoist
    place382 - place
    hoist382 - hoist
    place486 - place
    hoist486 - hoist
    place374 - place
    hoist374 - hoist
    place243 - place
    hoist243 - hoist
    place745 - place
    hoist745 - hoist
    place847 - place
    hoist847 - hoist
    place537 - place
    hoist537 - hoist
    place937 - place
    hoist937 - hoist
    place0 - place
    hoist0 - hoist
    crate896 - surface
    pallet896 - surface
    crate886 - surface
    pallet886 - surface
    crate13 - surface
    pallet13 - surface
    crate753 - surface
    pallet753 - surface
    crate633 - surface
    pallet633 - surface
    crate244 - surface
    pallet244 - surface
    crate860 - surface
    pallet860 - surface
    crate788 - surface
    pallet788 - surface
    crate176 - surface
    pallet176 - surface
    crate699 - surface
    pallet699 - surface
    crate742 - surface
    pallet742 - surface
    crate909 - surface
    pallet909 - surface
    crate757 - surface
    pallet757 - surface
    crate705 - surface
    pallet705 - surface
    crate926 - surface
    pallet926 - surface
    crate134 - surface
    pallet134 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist188 place188 )
    ( available hoist188 )
    ( hoist-at hoist289 place289 )
    ( available hoist289 )
    ( hoist-at hoist679 place679 )
    ( available hoist679 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist213 place213 )
    ( available hoist213 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist617 place617 )
    ( available hoist617 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist486 place486 )
    ( available hoist486 )
    ( hoist-at hoist374 place374 )
    ( available hoist374 )
    ( hoist-at hoist243 place243 )
    ( available hoist243 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist847 place847 )
    ( available hoist847 )
    ( hoist-at hoist537 place537 )
    ( available hoist537 )
    ( hoist-at hoist937 place937 )
    ( available hoist937 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet896 place195 )
    ( surface-at crate896 place195 )
    ( on crate896 pallet896 )
    ( is-crate crate896 )
    ( clear crate896 )
    ( surface-at pallet886 place745 )
    ( surface-at crate886 place745 )
    ( on crate886 pallet886 )
    ( is-crate crate886 )
    ( clear crate886 )
    ( surface-at pallet13 place670 )
    ( surface-at crate13 place670 )
    ( on crate13 pallet13 )
    ( is-crate crate13 )
    ( clear crate13 )
    ( surface-at pallet753 place374 )
    ( surface-at crate753 place374 )
    ( on crate753 pallet753 )
    ( is-crate crate753 )
    ( clear crate753 )
    ( surface-at pallet633 place617 )
    ( surface-at crate633 place617 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
    ( surface-at pallet244 place861 )
    ( surface-at crate244 place861 )
    ( on crate244 pallet244 )
    ( is-crate crate244 )
    ( clear crate244 )
    ( surface-at pallet860 place289 )
    ( surface-at crate860 place289 )
    ( on crate860 pallet860 )
    ( is-crate crate860 )
    ( clear crate860 )
    ( surface-at pallet788 place289 )
    ( surface-at crate788 place289 )
    ( on crate788 pallet788 )
    ( is-crate crate788 )
    ( clear crate788 )
    ( surface-at pallet176 place374 )
    ( surface-at crate176 place374 )
    ( on crate176 pallet176 )
    ( is-crate crate176 )
    ( clear crate176 )
    ( surface-at pallet699 place847 )
    ( surface-at crate699 place847 )
    ( on crate699 pallet699 )
    ( is-crate crate699 )
    ( clear crate699 )
    ( surface-at pallet742 place86 )
    ( surface-at crate742 place86 )
    ( on crate742 pallet742 )
    ( is-crate crate742 )
    ( clear crate742 )
    ( surface-at pallet909 place937 )
    ( surface-at crate909 place937 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
    ( surface-at pallet757 place382 )
    ( surface-at crate757 place382 )
    ( on crate757 pallet757 )
    ( is-crate crate757 )
    ( clear crate757 )
    ( surface-at pallet705 place745 )
    ( surface-at crate705 place745 )
    ( on crate705 pallet705 )
    ( is-crate crate705 )
    ( clear crate705 )
    ( surface-at pallet926 place374 )
    ( surface-at crate926 place374 )
    ( on crate926 pallet926 )
    ( is-crate crate926 )
    ( clear crate926 )
    ( surface-at pallet134 place86 )
    ( surface-at crate134 place86 )
    ( on crate134 pallet134 )
    ( is-crate crate134 )
    ( clear crate134 )
  )
  ( :tasks
    ( Make-On crate896 pallet0 )    ( Make-On crate886 crate896 )    ( Make-On crate13 crate886 )    ( Make-On crate753 crate13 )    ( Make-On crate633 crate753 )    ( Make-On crate244 crate633 )    ( Make-On crate860 crate244 )    ( Make-On crate788 crate860 )    ( Make-On crate176 crate788 )    ( Make-On crate699 crate176 )    ( Make-On crate742 crate699 )    ( Make-On crate909 crate742 )    ( Make-On crate757 crate909 )    ( Make-On crate705 crate757 )    ( Make-On crate926 crate705 )    ( Make-On crate134 crate926 )  )
)
