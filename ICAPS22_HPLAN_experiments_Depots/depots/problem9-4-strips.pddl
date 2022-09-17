( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place183 - place
    hoist183 - hoist
    place830 - place
    hoist830 - hoist
    place888 - place
    hoist888 - hoist
    place257 - place
    hoist257 - hoist
    place176 - place
    hoist176 - hoist
    place812 - place
    hoist812 - hoist
    place321 - place
    hoist321 - hoist
    place0 - place
    hoist0 - hoist
    crate561 - surface
    pallet561 - surface
    crate486 - surface
    pallet486 - surface
    crate95 - surface
    pallet95 - surface
    crate577 - surface
    pallet577 - surface
    crate746 - surface
    pallet746 - surface
    crate228 - surface
    pallet228 - surface
    crate66 - surface
    pallet66 - surface
    crate279 - surface
    pallet279 - surface
    crate520 - surface
    pallet520 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist183 place183 )
    ( available hoist183 )
    ( hoist-at hoist830 place830 )
    ( available hoist830 )
    ( hoist-at hoist888 place888 )
    ( available hoist888 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist176 place176 )
    ( available hoist176 )
    ( hoist-at hoist812 place812 )
    ( available hoist812 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet561 place176 )
    ( surface-at crate561 place176 )
    ( on crate561 pallet561 )
    ( is-crate crate561 )
    ( clear crate561 )
    ( surface-at pallet486 place257 )
    ( surface-at crate486 place257 )
    ( on crate486 pallet486 )
    ( is-crate crate486 )
    ( clear crate486 )
    ( surface-at pallet95 place830 )
    ( surface-at crate95 place830 )
    ( on crate95 pallet95 )
    ( is-crate crate95 )
    ( clear crate95 )
    ( surface-at pallet577 place812 )
    ( surface-at crate577 place812 )
    ( on crate577 pallet577 )
    ( is-crate crate577 )
    ( clear crate577 )
    ( surface-at pallet746 place183 )
    ( surface-at crate746 place183 )
    ( on crate746 pallet746 )
    ( is-crate crate746 )
    ( clear crate746 )
    ( surface-at pallet228 place321 )
    ( surface-at crate228 place321 )
    ( on crate228 pallet228 )
    ( is-crate crate228 )
    ( clear crate228 )
    ( surface-at pallet66 place321 )
    ( surface-at crate66 place321 )
    ( on crate66 pallet66 )
    ( is-crate crate66 )
    ( clear crate66 )
    ( surface-at pallet279 place830 )
    ( surface-at crate279 place830 )
    ( on crate279 pallet279 )
    ( is-crate crate279 )
    ( clear crate279 )
    ( surface-at pallet520 place888 )
    ( surface-at crate520 place888 )
    ( on crate520 pallet520 )
    ( is-crate crate520 )
    ( clear crate520 )
  )
  ( :goal
    ( and
    )
  )
)
