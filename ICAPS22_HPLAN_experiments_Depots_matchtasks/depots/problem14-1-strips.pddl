( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place41 - place
    hoist41 - hoist
    place343 - place
    hoist343 - hoist
    place304 - place
    hoist304 - hoist
    place444 - place
    hoist444 - hoist
    place288 - place
    hoist288 - hoist
    place194 - place
    hoist194 - hoist
    place751 - place
    hoist751 - hoist
    place124 - place
    hoist124 - hoist
    place121 - place
    hoist121 - hoist
    place80 - place
    hoist80 - hoist
    place153 - place
    hoist153 - hoist
    place380 - place
    hoist380 - hoist
    place374 - place
    hoist374 - hoist
    place369 - place
    hoist369 - hoist
    place864 - place
    hoist864 - hoist
    place399 - place
    hoist399 - hoist
    place376 - place
    hoist376 - hoist
    place383 - place
    hoist383 - hoist
    place666 - place
    hoist666 - hoist
    place543 - place
    hoist543 - hoist
    place20 - place
    hoist20 - hoist
    place771 - place
    hoist771 - hoist
    place0 - place
    hoist0 - hoist
    crate228 - surface
    pallet228 - surface
    crate328 - surface
    pallet328 - surface
    crate143 - surface
    pallet143 - surface
    crate400 - surface
    pallet400 - surface
    crate261 - surface
    pallet261 - surface
    crate428 - surface
    pallet428 - surface
    crate329 - surface
    pallet329 - surface
    crate837 - surface
    pallet837 - surface
    crate408 - surface
    pallet408 - surface
    crate98 - surface
    pallet98 - surface
    crate697 - surface
    pallet697 - surface
    crate22 - surface
    pallet22 - surface
    crate540 - surface
    pallet540 - surface
    crate718 - surface
    pallet718 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist41 place41 )
    ( available hoist41 )
    ( hoist-at hoist343 place343 )
    ( available hoist343 )
    ( hoist-at hoist304 place304 )
    ( available hoist304 )
    ( hoist-at hoist444 place444 )
    ( available hoist444 )
    ( hoist-at hoist288 place288 )
    ( available hoist288 )
    ( hoist-at hoist194 place194 )
    ( available hoist194 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist124 place124 )
    ( available hoist124 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist80 place80 )
    ( available hoist80 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist380 place380 )
    ( available hoist380 )
    ( hoist-at hoist374 place374 )
    ( available hoist374 )
    ( hoist-at hoist369 place369 )
    ( available hoist369 )
    ( hoist-at hoist864 place864 )
    ( available hoist864 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist376 place376 )
    ( available hoist376 )
    ( hoist-at hoist383 place383 )
    ( available hoist383 )
    ( hoist-at hoist666 place666 )
    ( available hoist666 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist20 place20 )
    ( available hoist20 )
    ( hoist-at hoist771 place771 )
    ( available hoist771 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet228 place864 )
    ( surface-at crate228 place864 )
    ( on crate228 pallet228 )
    ( is-crate crate228 )
    ( clear crate228 )
    ( surface-at pallet328 place376 )
    ( surface-at crate328 place376 )
    ( on crate328 pallet328 )
    ( is-crate crate328 )
    ( clear crate328 )
    ( surface-at pallet143 place376 )
    ( surface-at crate143 place376 )
    ( on crate143 pallet143 )
    ( is-crate crate143 )
    ( clear crate143 )
    ( surface-at pallet400 place444 )
    ( surface-at crate400 place444 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet261 place288 )
    ( surface-at crate261 place288 )
    ( on crate261 pallet261 )
    ( is-crate crate261 )
    ( clear crate261 )
    ( surface-at pallet428 place153 )
    ( surface-at crate428 place153 )
    ( on crate428 pallet428 )
    ( is-crate crate428 )
    ( clear crate428 )
    ( surface-at pallet329 place20 )
    ( surface-at crate329 place20 )
    ( on crate329 pallet329 )
    ( is-crate crate329 )
    ( clear crate329 )
    ( surface-at pallet837 place20 )
    ( surface-at crate837 place20 )
    ( on crate837 pallet837 )
    ( is-crate crate837 )
    ( clear crate837 )
    ( surface-at pallet408 place751 )
    ( surface-at crate408 place751 )
    ( on crate408 pallet408 )
    ( is-crate crate408 )
    ( clear crate408 )
    ( surface-at pallet98 place399 )
    ( surface-at crate98 place399 )
    ( on crate98 pallet98 )
    ( is-crate crate98 )
    ( clear crate98 )
    ( surface-at pallet697 place80 )
    ( surface-at crate697 place80 )
    ( on crate697 pallet697 )
    ( is-crate crate697 )
    ( clear crate697 )
    ( surface-at pallet22 place444 )
    ( surface-at crate22 place444 )
    ( on crate22 pallet22 )
    ( is-crate crate22 )
    ( clear crate22 )
    ( surface-at pallet540 place444 )
    ( surface-at crate540 place444 )
    ( on crate540 pallet540 )
    ( is-crate crate540 )
    ( clear crate540 )
    ( surface-at pallet718 place80 )
    ( surface-at crate718 place80 )
    ( on crate718 pallet718 )
    ( is-crate crate718 )
    ( clear crate718 )
  )
  ( :goal
    ( and
    )
  )
)
