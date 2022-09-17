( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place890 - place
    hoist890 - hoist
    place332 - place
    hoist332 - hoist
    place808 - place
    hoist808 - hoist
    place795 - place
    hoist795 - hoist
    place737 - place
    hoist737 - hoist
    place549 - place
    hoist549 - hoist
    place300 - place
    hoist300 - hoist
    place646 - place
    hoist646 - hoist
    place720 - place
    hoist720 - hoist
    place220 - place
    hoist220 - hoist
    place420 - place
    hoist420 - hoist
    place10 - place
    hoist10 - hoist
    place943 - place
    hoist943 - hoist
    place657 - place
    hoist657 - hoist
    place222 - place
    hoist222 - hoist
    place954 - place
    hoist954 - hoist
    place117 - place
    hoist117 - hoist
    place0 - place
    hoist0 - hoist
    crate749 - surface
    pallet749 - surface
    crate468 - surface
    pallet468 - surface
    crate831 - surface
    pallet831 - surface
    crate123 - surface
    pallet123 - surface
    crate131 - surface
    pallet131 - surface
    crate2 - surface
    pallet2 - surface
    crate381 - surface
    pallet381 - surface
    crate435 - surface
    pallet435 - surface
    crate822 - surface
    pallet822 - surface
    crate842 - surface
    pallet842 - surface
    crate736 - surface
    pallet736 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist332 place332 )
    ( available hoist332 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist795 place795 )
    ( available hoist795 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist300 place300 )
    ( available hoist300 )
    ( hoist-at hoist646 place646 )
    ( available hoist646 )
    ( hoist-at hoist720 place720 )
    ( available hoist720 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist10 place10 )
    ( available hoist10 )
    ( hoist-at hoist943 place943 )
    ( available hoist943 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist222 place222 )
    ( available hoist222 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist117 place117 )
    ( available hoist117 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet749 place332 )
    ( surface-at crate749 place332 )
    ( on crate749 pallet749 )
    ( is-crate crate749 )
    ( clear crate749 )
    ( surface-at pallet468 place332 )
    ( surface-at crate468 place332 )
    ( on crate468 pallet468 )
    ( is-crate crate468 )
    ( clear crate468 )
    ( surface-at pallet831 place300 )
    ( surface-at crate831 place300 )
    ( on crate831 pallet831 )
    ( is-crate crate831 )
    ( clear crate831 )
    ( surface-at pallet123 place795 )
    ( surface-at crate123 place795 )
    ( on crate123 pallet123 )
    ( is-crate crate123 )
    ( clear crate123 )
    ( surface-at pallet131 place795 )
    ( surface-at crate131 place795 )
    ( on crate131 pallet131 )
    ( is-crate crate131 )
    ( clear crate131 )
    ( surface-at pallet2 place737 )
    ( surface-at crate2 place737 )
    ( on crate2 pallet2 )
    ( is-crate crate2 )
    ( clear crate2 )
    ( surface-at pallet381 place646 )
    ( surface-at crate381 place646 )
    ( on crate381 pallet381 )
    ( is-crate crate381 )
    ( clear crate381 )
    ( surface-at pallet435 place737 )
    ( surface-at crate435 place737 )
    ( on crate435 pallet435 )
    ( is-crate crate435 )
    ( clear crate435 )
    ( surface-at pallet822 place720 )
    ( surface-at crate822 place720 )
    ( on crate822 pallet822 )
    ( is-crate crate822 )
    ( clear crate822 )
    ( surface-at pallet842 place943 )
    ( surface-at crate842 place943 )
    ( on crate842 pallet842 )
    ( is-crate crate842 )
    ( clear crate842 )
    ( surface-at pallet736 place300 )
    ( surface-at crate736 place300 )
    ( on crate736 pallet736 )
    ( is-crate crate736 )
    ( clear crate736 )
  )
  ( :goal
    ( and
    )
  )
)
