( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place209 - place
    hoist209 - hoist
    place790 - place
    hoist790 - hoist
    place263 - place
    hoist263 - hoist
    place127 - place
    hoist127 - hoist
    place858 - place
    hoist858 - hoist
    place602 - place
    hoist602 - hoist
    place0 - place
    hoist0 - hoist
    crate365 - surface
    pallet365 - surface
    crate418 - surface
    pallet418 - surface
    crate524 - surface
    pallet524 - surface
    crate437 - surface
    pallet437 - surface
    crate657 - surface
    pallet657 - surface
    crate888 - surface
    pallet888 - surface
    crate578 - surface
    pallet578 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist209 place209 )
    ( available hoist209 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist858 place858 )
    ( available hoist858 )
    ( hoist-at hoist602 place602 )
    ( available hoist602 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet365 place858 )
    ( surface-at crate365 place858 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet418 place127 )
    ( surface-at crate418 place127 )
    ( on crate418 pallet418 )
    ( is-crate crate418 )
    ( clear crate418 )
    ( surface-at pallet524 place602 )
    ( surface-at crate524 place602 )
    ( on crate524 pallet524 )
    ( is-crate crate524 )
    ( clear crate524 )
    ( surface-at pallet437 place790 )
    ( surface-at crate437 place790 )
    ( on crate437 pallet437 )
    ( is-crate crate437 )
    ( clear crate437 )
    ( surface-at pallet657 place790 )
    ( surface-at crate657 place790 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet888 place790 )
    ( surface-at crate888 place790 )
    ( on crate888 pallet888 )
    ( is-crate crate888 )
    ( clear crate888 )
    ( surface-at pallet578 place602 )
    ( surface-at crate578 place602 )
    ( on crate578 pallet578 )
    ( is-crate crate578 )
    ( clear crate578 )
  )
  ( :goal
    ( and
    )
  )
)
