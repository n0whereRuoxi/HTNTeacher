( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place440 - place
    hoist440 - hoist
    place145 - place
    hoist145 - hoist
    place185 - place
    hoist185 - hoist
    place92 - place
    hoist92 - hoist
    place300 - place
    hoist300 - hoist
    place634 - place
    hoist634 - hoist
    place711 - place
    hoist711 - hoist
    place207 - place
    hoist207 - hoist
    place814 - place
    hoist814 - hoist
    place0 - place
    hoist0 - hoist
    crate696 - surface
    pallet696 - surface
    crate174 - surface
    pallet174 - surface
    crate372 - surface
    pallet372 - surface
    crate635 - surface
    pallet635 - surface
    crate288 - surface
    pallet288 - surface
    crate738 - surface
    pallet738 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist145 place145 )
    ( available hoist145 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist92 place92 )
    ( available hoist92 )
    ( hoist-at hoist300 place300 )
    ( available hoist300 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist207 place207 )
    ( available hoist207 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet696 place207 )
    ( surface-at crate696 place207 )
    ( on crate696 pallet696 )
    ( is-crate crate696 )
    ( clear crate696 )
    ( surface-at pallet174 place300 )
    ( surface-at crate174 place300 )
    ( on crate174 pallet174 )
    ( is-crate crate174 )
    ( clear crate174 )
    ( surface-at pallet372 place185 )
    ( surface-at crate372 place185 )
    ( on crate372 pallet372 )
    ( is-crate crate372 )
    ( clear crate372 )
    ( surface-at pallet635 place185 )
    ( surface-at crate635 place185 )
    ( on crate635 pallet635 )
    ( is-crate crate635 )
    ( clear crate635 )
    ( surface-at pallet288 place300 )
    ( surface-at crate288 place300 )
    ( on crate288 pallet288 )
    ( is-crate crate288 )
    ( clear crate288 )
    ( surface-at pallet738 place440 )
    ( surface-at crate738 place440 )
    ( on crate738 pallet738 )
    ( is-crate crate738 )
    ( clear crate738 )
  )
  ( :goal
    ( and
    )
  )
)
