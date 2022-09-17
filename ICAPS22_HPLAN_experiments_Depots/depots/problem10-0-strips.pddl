( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place172 - place
    hoist172 - hoist
    place169 - place
    hoist169 - hoist
    place983 - place
    hoist983 - hoist
    place712 - place
    hoist712 - hoist
    place140 - place
    hoist140 - hoist
    place592 - place
    hoist592 - hoist
    place0 - place
    hoist0 - hoist
    crate986 - surface
    pallet986 - surface
    crate707 - surface
    pallet707 - surface
    crate63 - surface
    pallet63 - surface
    crate409 - surface
    pallet409 - surface
    crate596 - surface
    pallet596 - surface
    crate340 - surface
    pallet340 - surface
    crate810 - surface
    pallet810 - surface
    crate520 - surface
    pallet520 - surface
    crate470 - surface
    pallet470 - surface
    crate913 - surface
    pallet913 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist172 place172 )
    ( available hoist172 )
    ( hoist-at hoist169 place169 )
    ( available hoist169 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist712 place712 )
    ( available hoist712 )
    ( hoist-at hoist140 place140 )
    ( available hoist140 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet986 place172 )
    ( surface-at crate986 place172 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet707 place592 )
    ( surface-at crate707 place592 )
    ( on crate707 pallet707 )
    ( is-crate crate707 )
    ( clear crate707 )
    ( surface-at pallet63 place169 )
    ( surface-at crate63 place169 )
    ( on crate63 pallet63 )
    ( is-crate crate63 )
    ( clear crate63 )
    ( surface-at pallet409 place712 )
    ( surface-at crate409 place712 )
    ( on crate409 pallet409 )
    ( is-crate crate409 )
    ( clear crate409 )
    ( surface-at pallet596 place140 )
    ( surface-at crate596 place140 )
    ( on crate596 pallet596 )
    ( is-crate crate596 )
    ( clear crate596 )
    ( surface-at pallet340 place983 )
    ( surface-at crate340 place983 )
    ( on crate340 pallet340 )
    ( is-crate crate340 )
    ( clear crate340 )
    ( surface-at pallet810 place169 )
    ( surface-at crate810 place169 )
    ( on crate810 pallet810 )
    ( is-crate crate810 )
    ( clear crate810 )
    ( surface-at pallet520 place169 )
    ( surface-at crate520 place169 )
    ( on crate520 pallet520 )
    ( is-crate crate520 )
    ( clear crate520 )
    ( surface-at pallet470 place169 )
    ( surface-at crate470 place169 )
    ( on crate470 pallet470 )
    ( is-crate crate470 )
    ( clear crate470 )
    ( surface-at pallet913 place169 )
    ( surface-at crate913 place169 )
    ( on crate913 pallet913 )
    ( is-crate crate913 )
    ( clear crate913 )
  )
  ( :goal
    ( and
    )
  )
)
