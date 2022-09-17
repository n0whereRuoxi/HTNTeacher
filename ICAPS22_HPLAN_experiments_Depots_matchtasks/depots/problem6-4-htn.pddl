( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place31 - place
    hoist31 - hoist
    place525 - place
    hoist525 - hoist
    place676 - place
    hoist676 - hoist
    place144 - place
    hoist144 - hoist
    place752 - place
    hoist752 - hoist
    place0 - place
    hoist0 - hoist
    crate970 - surface
    pallet970 - surface
    crate319 - surface
    pallet319 - surface
    crate994 - surface
    pallet994 - surface
    crate844 - surface
    pallet844 - surface
    crate855 - surface
    pallet855 - surface
    crate304 - surface
    pallet304 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist31 place31 )
    ( available hoist31 )
    ( hoist-at hoist525 place525 )
    ( available hoist525 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist752 place752 )
    ( available hoist752 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet970 place525 )
    ( surface-at crate970 place525 )
    ( on crate970 pallet970 )
    ( is-crate crate970 )
    ( clear crate970 )
    ( surface-at pallet319 place31 )
    ( surface-at crate319 place31 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet994 place525 )
    ( surface-at crate994 place525 )
    ( on crate994 pallet994 )
    ( is-crate crate994 )
    ( clear crate994 )
    ( surface-at pallet844 place752 )
    ( surface-at crate844 place752 )
    ( on crate844 pallet844 )
    ( is-crate crate844 )
    ( clear crate844 )
    ( surface-at pallet855 place144 )
    ( surface-at crate855 place144 )
    ( on crate855 pallet855 )
    ( is-crate crate855 )
    ( clear crate855 )
    ( surface-at pallet304 place144 )
    ( surface-at crate304 place144 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate970 crate319 crate994 crate844 crate855 crate304 )
  )
)
