( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place230 - place
    hoist230 - hoist
    place601 - place
    hoist601 - hoist
    place725 - place
    hoist725 - hoist
    place768 - place
    hoist768 - hoist
    place127 - place
    hoist127 - hoist
    place534 - place
    hoist534 - hoist
    place0 - place
    hoist0 - hoist
    crate362 - surface
    pallet362 - surface
    crate594 - surface
    pallet594 - surface
    crate455 - surface
    pallet455 - surface
    crate242 - surface
    pallet242 - surface
    crate201 - surface
    pallet201 - surface
    crate534 - surface
    pallet534 - surface
    crate476 - surface
    pallet476 - surface
    crate788 - surface
    pallet788 - surface
    crate353 - surface
    pallet353 - surface
    crate714 - surface
    pallet714 - surface
    crate253 - surface
    pallet253 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist230 place230 )
    ( available hoist230 )
    ( hoist-at hoist601 place601 )
    ( available hoist601 )
    ( hoist-at hoist725 place725 )
    ( available hoist725 )
    ( hoist-at hoist768 place768 )
    ( available hoist768 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist534 place534 )
    ( available hoist534 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet362 place768 )
    ( surface-at crate362 place768 )
    ( on crate362 pallet362 )
    ( is-crate crate362 )
    ( clear crate362 )
    ( surface-at pallet594 place230 )
    ( surface-at crate594 place230 )
    ( on crate594 pallet594 )
    ( is-crate crate594 )
    ( clear crate594 )
    ( surface-at pallet455 place725 )
    ( surface-at crate455 place725 )
    ( on crate455 pallet455 )
    ( is-crate crate455 )
    ( clear crate455 )
    ( surface-at pallet242 place768 )
    ( surface-at crate242 place768 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet201 place725 )
    ( surface-at crate201 place725 )
    ( on crate201 pallet201 )
    ( is-crate crate201 )
    ( clear crate201 )
    ( surface-at pallet534 place601 )
    ( surface-at crate534 place601 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet476 place230 )
    ( surface-at crate476 place230 )
    ( on crate476 pallet476 )
    ( is-crate crate476 )
    ( clear crate476 )
    ( surface-at pallet788 place768 )
    ( surface-at crate788 place768 )
    ( on crate788 pallet788 )
    ( is-crate crate788 )
    ( clear crate788 )
    ( surface-at pallet353 place725 )
    ( surface-at crate353 place725 )
    ( on crate353 pallet353 )
    ( is-crate crate353 )
    ( clear crate353 )
    ( surface-at pallet714 place768 )
    ( surface-at crate714 place768 )
    ( on crate714 pallet714 )
    ( is-crate crate714 )
    ( clear crate714 )
    ( surface-at pallet253 place601 )
    ( surface-at crate253 place601 )
    ( on crate253 pallet253 )
    ( is-crate crate253 )
    ( clear crate253 )
  )
  ( :tasks
    ( Make-On crate362 pallet0 )    ( Make-On crate594 crate362 )    ( Make-On crate455 crate594 )    ( Make-On crate242 crate455 )    ( Make-On crate201 crate242 )    ( Make-On crate534 crate201 )    ( Make-On crate476 crate534 )    ( Make-On crate788 crate476 )    ( Make-On crate353 crate788 )    ( Make-On crate714 crate353 )    ( Make-On crate253 crate714 )  )
)
