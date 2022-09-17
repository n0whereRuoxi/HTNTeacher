( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place804 - place
    hoist804 - hoist
    place855 - place
    hoist855 - hoist
    place395 - place
    hoist395 - hoist
    place473 - place
    hoist473 - hoist
    place74 - place
    hoist74 - hoist
    place861 - place
    hoist861 - hoist
    place274 - place
    hoist274 - hoist
    place941 - place
    hoist941 - hoist
    place823 - place
    hoist823 - hoist
    place737 - place
    hoist737 - hoist
    place351 - place
    hoist351 - hoist
    place788 - place
    hoist788 - hoist
    place333 - place
    hoist333 - hoist
    place121 - place
    hoist121 - hoist
    place753 - place
    hoist753 - hoist
    place772 - place
    hoist772 - hoist
    place507 - place
    hoist507 - hoist
    place767 - place
    hoist767 - hoist
    place944 - place
    hoist944 - hoist
    place32 - place
    hoist32 - hoist
    place318 - place
    hoist318 - hoist
    place52 - place
    hoist52 - hoist
    place643 - place
    hoist643 - hoist
    place923 - place
    hoist923 - hoist
    place0 - place
    hoist0 - hoist
    crate121 - surface
    pallet121 - surface
    crate577 - surface
    pallet577 - surface
    crate321 - surface
    pallet321 - surface
    crate430 - surface
    pallet430 - surface
    crate173 - surface
    pallet173 - surface
    crate606 - surface
    pallet606 - surface
    crate399 - surface
    pallet399 - surface
    crate311 - surface
    pallet311 - surface
    crate609 - surface
    pallet609 - surface
    crate724 - surface
    pallet724 - surface
    crate81 - surface
    pallet81 - surface
    crate673 - surface
    pallet673 - surface
    crate881 - surface
    pallet881 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist804 place804 )
    ( available hoist804 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist395 place395 )
    ( available hoist395 )
    ( hoist-at hoist473 place473 )
    ( available hoist473 )
    ( hoist-at hoist74 place74 )
    ( available hoist74 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist274 place274 )
    ( available hoist274 )
    ( hoist-at hoist941 place941 )
    ( available hoist941 )
    ( hoist-at hoist823 place823 )
    ( available hoist823 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist788 place788 )
    ( available hoist788 )
    ( hoist-at hoist333 place333 )
    ( available hoist333 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist772 place772 )
    ( available hoist772 )
    ( hoist-at hoist507 place507 )
    ( available hoist507 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist944 place944 )
    ( available hoist944 )
    ( hoist-at hoist32 place32 )
    ( available hoist32 )
    ( hoist-at hoist318 place318 )
    ( available hoist318 )
    ( hoist-at hoist52 place52 )
    ( available hoist52 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist923 place923 )
    ( available hoist923 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet121 place333 )
    ( surface-at crate121 place333 )
    ( on crate121 pallet121 )
    ( is-crate crate121 )
    ( clear crate121 )
    ( surface-at pallet577 place753 )
    ( surface-at crate577 place753 )
    ( on crate577 pallet577 )
    ( is-crate crate577 )
    ( clear crate577 )
    ( surface-at pallet321 place804 )
    ( surface-at crate321 place804 )
    ( on crate321 pallet321 )
    ( is-crate crate321 )
    ( clear crate321 )
    ( surface-at pallet430 place804 )
    ( surface-at crate430 place804 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet173 place823 )
    ( surface-at crate173 place823 )
    ( on crate173 pallet173 )
    ( is-crate crate173 )
    ( clear crate173 )
    ( surface-at pallet606 place804 )
    ( surface-at crate606 place804 )
    ( on crate606 pallet606 )
    ( is-crate crate606 )
    ( clear crate606 )
    ( surface-at pallet399 place274 )
    ( surface-at crate399 place274 )
    ( on crate399 pallet399 )
    ( is-crate crate399 )
    ( clear crate399 )
    ( surface-at pallet311 place74 )
    ( surface-at crate311 place74 )
    ( on crate311 pallet311 )
    ( is-crate crate311 )
    ( clear crate311 )
    ( surface-at pallet609 place737 )
    ( surface-at crate609 place737 )
    ( on crate609 pallet609 )
    ( is-crate crate609 )
    ( clear crate609 )
    ( surface-at pallet724 place788 )
    ( surface-at crate724 place788 )
    ( on crate724 pallet724 )
    ( is-crate crate724 )
    ( clear crate724 )
    ( surface-at pallet81 place32 )
    ( surface-at crate81 place32 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet673 place395 )
    ( surface-at crate673 place395 )
    ( on crate673 pallet673 )
    ( is-crate crate673 )
    ( clear crate673 )
    ( surface-at pallet881 place737 )
    ( surface-at crate881 place737 )
    ( on crate881 pallet881 )
    ( is-crate crate881 )
    ( clear crate881 )
  )
  ( :tasks
    ( Make-On crate121 pallet0 )    ( Make-On crate577 crate121 )    ( Make-On crate321 crate577 )    ( Make-On crate430 crate321 )    ( Make-On crate173 crate430 )    ( Make-On crate606 crate173 )    ( Make-On crate399 crate606 )    ( Make-On crate311 crate399 )    ( Make-On crate609 crate311 )    ( Make-On crate724 crate609 )    ( Make-On crate81 crate724 )    ( Make-On crate673 crate81 )    ( Make-On crate881 crate673 )  )
)
