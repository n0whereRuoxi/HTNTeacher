( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place246 - place
    hoist246 - hoist
    place592 - place
    hoist592 - hoist
    place808 - place
    hoist808 - hoist
    place465 - place
    hoist465 - hoist
    place396 - place
    hoist396 - hoist
    place878 - place
    hoist878 - hoist
    place787 - place
    hoist787 - hoist
    place637 - place
    hoist637 - hoist
    place448 - place
    hoist448 - hoist
    place843 - place
    hoist843 - hoist
    place0 - place
    hoist0 - hoist
    crate768 - surface
    pallet768 - surface
    crate523 - surface
    pallet523 - surface
    crate950 - surface
    pallet950 - surface
    crate637 - surface
    pallet637 - surface
    crate365 - surface
    pallet365 - surface
    crate644 - surface
    pallet644 - surface
    crate105 - surface
    pallet105 - surface
    crate5 - surface
    pallet5 - surface
    crate797 - surface
    pallet797 - surface
    crate650 - surface
    pallet650 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist246 place246 )
    ( available hoist246 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist396 place396 )
    ( available hoist396 )
    ( hoist-at hoist878 place878 )
    ( available hoist878 )
    ( hoist-at hoist787 place787 )
    ( available hoist787 )
    ( hoist-at hoist637 place637 )
    ( available hoist637 )
    ( hoist-at hoist448 place448 )
    ( available hoist448 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet768 place637 )
    ( surface-at crate768 place637 )
    ( on crate768 pallet768 )
    ( is-crate crate768 )
    ( clear crate768 )
    ( surface-at pallet523 place465 )
    ( surface-at crate523 place465 )
    ( on crate523 pallet523 )
    ( is-crate crate523 )
    ( clear crate523 )
    ( surface-at pallet950 place808 )
    ( surface-at crate950 place808 )
    ( on crate950 pallet950 )
    ( is-crate crate950 )
    ( clear crate950 )
    ( surface-at pallet637 place465 )
    ( surface-at crate637 place465 )
    ( on crate637 pallet637 )
    ( is-crate crate637 )
    ( clear crate637 )
    ( surface-at pallet365 place878 )
    ( surface-at crate365 place878 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet644 place246 )
    ( surface-at crate644 place246 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
    ( surface-at pallet105 place808 )
    ( surface-at crate105 place808 )
    ( on crate105 pallet105 )
    ( is-crate crate105 )
    ( clear crate105 )
    ( surface-at pallet5 place637 )
    ( surface-at crate5 place637 )
    ( on crate5 pallet5 )
    ( is-crate crate5 )
    ( clear crate5 )
    ( surface-at pallet797 place396 )
    ( surface-at crate797 place396 )
    ( on crate797 pallet797 )
    ( is-crate crate797 )
    ( clear crate797 )
    ( surface-at pallet650 place246 )
    ( surface-at crate650 place246 )
    ( on crate650 pallet650 )
    ( is-crate crate650 )
    ( clear crate650 )
  )
  ( :tasks
    ( Make-On crate768 pallet0 )    ( Make-On crate523 crate768 )    ( Make-On crate950 crate523 )    ( Make-On crate637 crate950 )    ( Make-On crate365 crate637 )    ( Make-On crate644 crate365 )    ( Make-On crate105 crate644 )    ( Make-On crate5 crate105 )    ( Make-On crate797 crate5 )    ( Make-On crate650 crate797 )  )
)
