( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place321 - place
    hoist321 - hoist
    place993 - place
    hoist993 - hoist
    place660 - place
    hoist660 - hoist
    place913 - place
    hoist913 - hoist
    place550 - place
    hoist550 - hoist
    place413 - place
    hoist413 - hoist
    place24 - place
    hoist24 - hoist
    place340 - place
    hoist340 - hoist
    place0 - place
    hoist0 - hoist
    crate5 - surface
    pallet5 - surface
    crate661 - surface
    pallet661 - surface
    crate893 - surface
    pallet893 - surface
    crate376 - surface
    pallet376 - surface
    crate53 - surface
    pallet53 - surface
    crate715 - surface
    pallet715 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist993 place993 )
    ( available hoist993 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist913 place913 )
    ( available hoist913 )
    ( hoist-at hoist550 place550 )
    ( available hoist550 )
    ( hoist-at hoist413 place413 )
    ( available hoist413 )
    ( hoist-at hoist24 place24 )
    ( available hoist24 )
    ( hoist-at hoist340 place340 )
    ( available hoist340 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet5 place321 )
    ( surface-at crate5 place321 )
    ( on crate5 pallet5 )
    ( is-crate crate5 )
    ( clear crate5 )
    ( surface-at pallet661 place340 )
    ( surface-at crate661 place340 )
    ( on crate661 pallet661 )
    ( is-crate crate661 )
    ( clear crate661 )
    ( surface-at pallet893 place993 )
    ( surface-at crate893 place993 )
    ( on crate893 pallet893 )
    ( is-crate crate893 )
    ( clear crate893 )
    ( surface-at pallet376 place321 )
    ( surface-at crate376 place321 )
    ( on crate376 pallet376 )
    ( is-crate crate376 )
    ( clear crate376 )
    ( surface-at pallet53 place993 )
    ( surface-at crate53 place993 )
    ( on crate53 pallet53 )
    ( is-crate crate53 )
    ( clear crate53 )
    ( surface-at pallet715 place340 )
    ( surface-at crate715 place340 )
    ( on crate715 pallet715 )
    ( is-crate crate715 )
    ( clear crate715 )
  )
  ( :goal
    ( and
    )
  )
)
