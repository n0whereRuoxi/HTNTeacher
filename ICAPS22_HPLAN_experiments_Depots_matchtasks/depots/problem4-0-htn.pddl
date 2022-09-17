( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place173 - place
    hoist173 - hoist
    place946 - place
    hoist946 - hoist
    place33 - place
    hoist33 - hoist
    place0 - place
    hoist0 - hoist
    crate759 - surface
    pallet759 - surface
    crate887 - surface
    pallet887 - surface
    crate512 - surface
    pallet512 - surface
    crate963 - surface
    pallet963 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist946 place946 )
    ( available hoist946 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet759 place946 )
    ( surface-at crate759 place946 )
    ( on crate759 pallet759 )
    ( is-crate crate759 )
    ( clear crate759 )
    ( surface-at pallet887 place173 )
    ( surface-at crate887 place173 )
    ( on crate887 pallet887 )
    ( is-crate crate887 )
    ( clear crate887 )
    ( surface-at pallet512 place33 )
    ( surface-at crate512 place33 )
    ( on crate512 pallet512 )
    ( is-crate crate512 )
    ( clear crate512 )
    ( surface-at pallet963 place946 )
    ( surface-at crate963 place946 )
    ( on crate963 pallet963 )
    ( is-crate crate963 )
    ( clear crate963 )
  )
  ( :tasks
    ( Make-4Crate pallet0 crate759 crate887 crate512 crate963 )
  )
)
