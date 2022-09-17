( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place743 - place
    hoist743 - hoist
    place654 - place
    hoist654 - hoist
    place26 - place
    hoist26 - hoist
    place129 - place
    hoist129 - hoist
    place405 - place
    hoist405 - hoist
    place321 - place
    hoist321 - hoist
    place443 - place
    hoist443 - hoist
    place179 - place
    hoist179 - hoist
    place276 - place
    hoist276 - hoist
    place773 - place
    hoist773 - hoist
    place459 - place
    hoist459 - hoist
    place528 - place
    hoist528 - hoist
    place452 - place
    hoist452 - hoist
    place437 - place
    hoist437 - hoist
    place634 - place
    hoist634 - hoist
    place345 - place
    hoist345 - hoist
    place84 - place
    hoist84 - hoist
    place231 - place
    hoist231 - hoist
    place153 - place
    hoist153 - hoist
    place591 - place
    hoist591 - hoist
    place874 - place
    hoist874 - hoist
    place211 - place
    hoist211 - hoist
    place516 - place
    hoist516 - hoist
    place692 - place
    hoist692 - hoist
    place427 - place
    hoist427 - hoist
    place242 - place
    hoist242 - hoist
    place9 - place
    hoist9 - hoist
    place881 - place
    hoist881 - hoist
    place0 - place
    hoist0 - hoist
    crate885 - surface
    pallet885 - surface
    crate990 - surface
    pallet990 - surface
    crate450 - surface
    pallet450 - surface
    crate643 - surface
    pallet643 - surface
    crate339 - surface
    pallet339 - surface
    crate323 - surface
    pallet323 - surface
    crate664 - surface
    pallet664 - surface
    crate199 - surface
    pallet199 - surface
    crate398 - surface
    pallet398 - surface
    crate49 - surface
    pallet49 - surface
    crate153 - surface
    pallet153 - surface
    crate486 - surface
    pallet486 - surface
    crate623 - surface
    pallet623 - surface
    crate592 - surface
    pallet592 - surface
    crate496 - surface
    pallet496 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist743 place743 )
    ( available hoist743 )
    ( hoist-at hoist654 place654 )
    ( available hoist654 )
    ( hoist-at hoist26 place26 )
    ( available hoist26 )
    ( hoist-at hoist129 place129 )
    ( available hoist129 )
    ( hoist-at hoist405 place405 )
    ( available hoist405 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist443 place443 )
    ( available hoist443 )
    ( hoist-at hoist179 place179 )
    ( available hoist179 )
    ( hoist-at hoist276 place276 )
    ( available hoist276 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist459 place459 )
    ( available hoist459 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist452 place452 )
    ( available hoist452 )
    ( hoist-at hoist437 place437 )
    ( available hoist437 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist345 place345 )
    ( available hoist345 )
    ( hoist-at hoist84 place84 )
    ( available hoist84 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist591 place591 )
    ( available hoist591 )
    ( hoist-at hoist874 place874 )
    ( available hoist874 )
    ( hoist-at hoist211 place211 )
    ( available hoist211 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist692 place692 )
    ( available hoist692 )
    ( hoist-at hoist427 place427 )
    ( available hoist427 )
    ( hoist-at hoist242 place242 )
    ( available hoist242 )
    ( hoist-at hoist9 place9 )
    ( available hoist9 )
    ( hoist-at hoist881 place881 )
    ( available hoist881 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet885 place345 )
    ( surface-at crate885 place345 )
    ( on crate885 pallet885 )
    ( is-crate crate885 )
    ( clear crate885 )
    ( surface-at pallet990 place743 )
    ( surface-at crate990 place743 )
    ( on crate990 pallet990 )
    ( is-crate crate990 )
    ( clear crate990 )
    ( surface-at pallet450 place452 )
    ( surface-at crate450 place452 )
    ( on crate450 pallet450 )
    ( is-crate crate450 )
    ( clear crate450 )
    ( surface-at pallet643 place9 )
    ( surface-at crate643 place9 )
    ( on crate643 pallet643 )
    ( is-crate crate643 )
    ( clear crate643 )
    ( surface-at pallet339 place84 )
    ( surface-at crate339 place84 )
    ( on crate339 pallet339 )
    ( is-crate crate339 )
    ( clear crate339 )
    ( surface-at pallet323 place405 )
    ( surface-at crate323 place405 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
    ( surface-at pallet664 place452 )
    ( surface-at crate664 place452 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet199 place437 )
    ( surface-at crate199 place437 )
    ( on crate199 pallet199 )
    ( is-crate crate199 )
    ( clear crate199 )
    ( surface-at pallet398 place634 )
    ( surface-at crate398 place634 )
    ( on crate398 pallet398 )
    ( is-crate crate398 )
    ( clear crate398 )
    ( surface-at pallet49 place443 )
    ( surface-at crate49 place443 )
    ( on crate49 pallet49 )
    ( is-crate crate49 )
    ( clear crate49 )
    ( surface-at pallet153 place452 )
    ( surface-at crate153 place452 )
    ( on crate153 pallet153 )
    ( is-crate crate153 )
    ( clear crate153 )
    ( surface-at pallet486 place153 )
    ( surface-at crate486 place153 )
    ( on crate486 pallet486 )
    ( is-crate crate486 )
    ( clear crate486 )
    ( surface-at pallet623 place773 )
    ( surface-at crate623 place773 )
    ( on crate623 pallet623 )
    ( is-crate crate623 )
    ( clear crate623 )
    ( surface-at pallet592 place405 )
    ( surface-at crate592 place405 )
    ( on crate592 pallet592 )
    ( is-crate crate592 )
    ( clear crate592 )
    ( surface-at pallet496 place242 )
    ( surface-at crate496 place242 )
    ( on crate496 pallet496 )
    ( is-crate crate496 )
    ( clear crate496 )
  )
  ( :tasks
    ( Make-On crate885 pallet0 )    ( Make-On crate990 crate885 )    ( Make-On crate450 crate990 )    ( Make-On crate643 crate450 )    ( Make-On crate339 crate643 )    ( Make-On crate323 crate339 )    ( Make-On crate664 crate323 )    ( Make-On crate199 crate664 )    ( Make-On crate398 crate199 )    ( Make-On crate49 crate398 )    ( Make-On crate153 crate49 )    ( Make-On crate486 crate153 )    ( Make-On crate623 crate486 )    ( Make-On crate592 crate623 )    ( Make-On crate496 crate592 )  )
)
