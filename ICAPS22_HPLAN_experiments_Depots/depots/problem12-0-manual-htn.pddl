( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place455 - place
    hoist455 - hoist
    place615 - place
    hoist615 - hoist
    place681 - place
    hoist681 - hoist
    place640 - place
    hoist640 - hoist
    place942 - place
    hoist942 - hoist
    place678 - place
    hoist678 - hoist
    place498 - place
    hoist498 - hoist
    place111 - place
    hoist111 - hoist
    place14 - place
    hoist14 - hoist
    place890 - place
    hoist890 - hoist
    place114 - place
    hoist114 - hoist
    place219 - place
    hoist219 - hoist
    place799 - place
    hoist799 - hoist
    place231 - place
    hoist231 - hoist
    place573 - place
    hoist573 - hoist
    place761 - place
    hoist761 - hoist
    place15 - place
    hoist15 - hoist
    place0 - place
    hoist0 - hoist
    crate918 - surface
    pallet918 - surface
    crate124 - surface
    pallet124 - surface
    crate339 - surface
    pallet339 - surface
    crate618 - surface
    pallet618 - surface
    crate169 - surface
    pallet169 - surface
    crate498 - surface
    pallet498 - surface
    crate557 - surface
    pallet557 - surface
    crate25 - surface
    pallet25 - surface
    crate789 - surface
    pallet789 - surface
    crate123 - surface
    pallet123 - surface
    crate791 - surface
    pallet791 - surface
    crate161 - surface
    pallet161 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist455 place455 )
    ( available hoist455 )
    ( hoist-at hoist615 place615 )
    ( available hoist615 )
    ( hoist-at hoist681 place681 )
    ( available hoist681 )
    ( hoist-at hoist640 place640 )
    ( available hoist640 )
    ( hoist-at hoist942 place942 )
    ( available hoist942 )
    ( hoist-at hoist678 place678 )
    ( available hoist678 )
    ( hoist-at hoist498 place498 )
    ( available hoist498 )
    ( hoist-at hoist111 place111 )
    ( available hoist111 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist114 place114 )
    ( available hoist114 )
    ( hoist-at hoist219 place219 )
    ( available hoist219 )
    ( hoist-at hoist799 place799 )
    ( available hoist799 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist573 place573 )
    ( available hoist573 )
    ( hoist-at hoist761 place761 )
    ( available hoist761 )
    ( hoist-at hoist15 place15 )
    ( available hoist15 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet918 place14 )
    ( surface-at crate918 place14 )
    ( on crate918 pallet918 )
    ( is-crate crate918 )
    ( clear crate918 )
    ( surface-at pallet124 place761 )
    ( surface-at crate124 place761 )
    ( on crate124 pallet124 )
    ( is-crate crate124 )
    ( clear crate124 )
    ( surface-at pallet339 place498 )
    ( surface-at crate339 place498 )
    ( on crate339 pallet339 )
    ( is-crate crate339 )
    ( clear crate339 )
    ( surface-at pallet618 place231 )
    ( surface-at crate618 place231 )
    ( on crate618 pallet618 )
    ( is-crate crate618 )
    ( clear crate618 )
    ( surface-at pallet169 place111 )
    ( surface-at crate169 place111 )
    ( on crate169 pallet169 )
    ( is-crate crate169 )
    ( clear crate169 )
    ( surface-at pallet498 place14 )
    ( surface-at crate498 place14 )
    ( on crate498 pallet498 )
    ( is-crate crate498 )
    ( clear crate498 )
    ( surface-at pallet557 place942 )
    ( surface-at crate557 place942 )
    ( on crate557 pallet557 )
    ( is-crate crate557 )
    ( clear crate557 )
    ( surface-at pallet25 place942 )
    ( surface-at crate25 place942 )
    ( on crate25 pallet25 )
    ( is-crate crate25 )
    ( clear crate25 )
    ( surface-at pallet789 place219 )
    ( surface-at crate789 place219 )
    ( on crate789 pallet789 )
    ( is-crate crate789 )
    ( clear crate789 )
    ( surface-at pallet123 place942 )
    ( surface-at crate123 place942 )
    ( on crate123 pallet123 )
    ( is-crate crate123 )
    ( clear crate123 )
    ( surface-at pallet791 place14 )
    ( surface-at crate791 place14 )
    ( on crate791 pallet791 )
    ( is-crate crate791 )
    ( clear crate791 )
    ( surface-at pallet161 place615 )
    ( surface-at crate161 place615 )
    ( on crate161 pallet161 )
    ( is-crate crate161 )
    ( clear crate161 )
  )
  ( :tasks
    ( Make-On crate918 pallet0 )    ( Make-On crate124 crate918 )    ( Make-On crate339 crate124 )    ( Make-On crate618 crate339 )    ( Make-On crate169 crate618 )    ( Make-On crate498 crate169 )    ( Make-On crate557 crate498 )    ( Make-On crate25 crate557 )    ( Make-On crate789 crate25 )    ( Make-On crate123 crate789 )    ( Make-On crate791 crate123 )    ( Make-On crate161 crate791 )  )
)
