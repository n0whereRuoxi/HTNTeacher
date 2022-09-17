( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place320 - place
    hoist320 - hoist
    place295 - place
    hoist295 - hoist
    place333 - place
    hoist333 - hoist
    place511 - place
    hoist511 - hoist
    place254 - place
    hoist254 - hoist
    place260 - place
    hoist260 - hoist
    place732 - place
    hoist732 - hoist
    place737 - place
    hoist737 - hoist
    place15 - place
    hoist15 - hoist
    place185 - place
    hoist185 - hoist
    place253 - place
    hoist253 - hoist
    place574 - place
    hoist574 - hoist
    place972 - place
    hoist972 - hoist
    place571 - place
    hoist571 - hoist
    place29 - place
    hoist29 - hoist
    place0 - place
    hoist0 - hoist
    crate459 - surface
    pallet459 - surface
    crate187 - surface
    pallet187 - surface
    crate81 - surface
    pallet81 - surface
    crate634 - surface
    pallet634 - surface
    crate92 - surface
    pallet92 - surface
    crate33 - surface
    pallet33 - surface
    crate249 - surface
    pallet249 - surface
    crate251 - surface
    pallet251 - surface
    crate612 - surface
    pallet612 - surface
    crate667 - surface
    pallet667 - surface
    crate333 - surface
    pallet333 - surface
    crate628 - surface
    pallet628 - surface
    crate986 - surface
    pallet986 - surface
    crate60 - surface
    pallet60 - surface
    crate21 - surface
    pallet21 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist320 place320 )
    ( available hoist320 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist333 place333 )
    ( available hoist333 )
    ( hoist-at hoist511 place511 )
    ( available hoist511 )
    ( hoist-at hoist254 place254 )
    ( available hoist254 )
    ( hoist-at hoist260 place260 )
    ( available hoist260 )
    ( hoist-at hoist732 place732 )
    ( available hoist732 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist15 place15 )
    ( available hoist15 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist253 place253 )
    ( available hoist253 )
    ( hoist-at hoist574 place574 )
    ( available hoist574 )
    ( hoist-at hoist972 place972 )
    ( available hoist972 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet459 place253 )
    ( surface-at crate459 place253 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
    ( surface-at pallet187 place260 )
    ( surface-at crate187 place260 )
    ( on crate187 pallet187 )
    ( is-crate crate187 )
    ( clear crate187 )
    ( surface-at pallet81 place320 )
    ( surface-at crate81 place320 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet634 place571 )
    ( surface-at crate634 place571 )
    ( on crate634 pallet634 )
    ( is-crate crate634 )
    ( clear crate634 )
    ( surface-at pallet92 place260 )
    ( surface-at crate92 place260 )
    ( on crate92 pallet92 )
    ( is-crate crate92 )
    ( clear crate92 )
    ( surface-at pallet33 place295 )
    ( surface-at crate33 place295 )
    ( on crate33 pallet33 )
    ( is-crate crate33 )
    ( clear crate33 )
    ( surface-at pallet249 place254 )
    ( surface-at crate249 place254 )
    ( on crate249 pallet249 )
    ( is-crate crate249 )
    ( clear crate249 )
    ( surface-at pallet251 place511 )
    ( surface-at crate251 place511 )
    ( on crate251 pallet251 )
    ( is-crate crate251 )
    ( clear crate251 )
    ( surface-at pallet612 place253 )
    ( surface-at crate612 place253 )
    ( on crate612 pallet612 )
    ( is-crate crate612 )
    ( clear crate612 )
    ( surface-at pallet667 place295 )
    ( surface-at crate667 place295 )
    ( on crate667 pallet667 )
    ( is-crate crate667 )
    ( clear crate667 )
    ( surface-at pallet333 place320 )
    ( surface-at crate333 place320 )
    ( on crate333 pallet333 )
    ( is-crate crate333 )
    ( clear crate333 )
    ( surface-at pallet628 place571 )
    ( surface-at crate628 place571 )
    ( on crate628 pallet628 )
    ( is-crate crate628 )
    ( clear crate628 )
    ( surface-at pallet986 place185 )
    ( surface-at crate986 place185 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet60 place732 )
    ( surface-at crate60 place732 )
    ( on crate60 pallet60 )
    ( is-crate crate60 )
    ( clear crate60 )
    ( surface-at pallet21 place185 )
    ( surface-at crate21 place185 )
    ( on crate21 pallet21 )
    ( is-crate crate21 )
    ( clear crate21 )
  )
  ( :goal
    ( and
    )
  )
)
