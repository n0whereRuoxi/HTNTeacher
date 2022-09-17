( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place874 - place
    hoist874 - hoist
    place60 - place
    hoist60 - hoist
    place760 - place
    hoist760 - hoist
    place687 - place
    hoist687 - hoist
    place0 - place
    hoist0 - hoist
    crate952 - surface
    pallet952 - surface
    crate955 - surface
    pallet955 - surface
    crate715 - surface
    pallet715 - surface
    crate515 - surface
    pallet515 - surface
    crate314 - surface
    pallet314 - surface
    crate359 - surface
    pallet359 - surface
    crate278 - surface
    pallet278 - surface
    crate819 - surface
    pallet819 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist874 place874 )
    ( available hoist874 )
    ( hoist-at hoist60 place60 )
    ( available hoist60 )
    ( hoist-at hoist760 place760 )
    ( available hoist760 )
    ( hoist-at hoist687 place687 )
    ( available hoist687 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet952 place60 )
    ( surface-at crate952 place60 )
    ( on crate952 pallet952 )
    ( is-crate crate952 )
    ( clear crate952 )
    ( surface-at pallet955 place687 )
    ( surface-at crate955 place687 )
    ( on crate955 pallet955 )
    ( is-crate crate955 )
    ( clear crate955 )
    ( surface-at pallet715 place760 )
    ( surface-at crate715 place760 )
    ( on crate715 pallet715 )
    ( is-crate crate715 )
    ( clear crate715 )
    ( surface-at pallet515 place760 )
    ( surface-at crate515 place760 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
    ( surface-at pallet314 place874 )
    ( surface-at crate314 place874 )
    ( on crate314 pallet314 )
    ( is-crate crate314 )
    ( clear crate314 )
    ( surface-at pallet359 place60 )
    ( surface-at crate359 place60 )
    ( on crate359 pallet359 )
    ( is-crate crate359 )
    ( clear crate359 )
    ( surface-at pallet278 place60 )
    ( surface-at crate278 place60 )
    ( on crate278 pallet278 )
    ( is-crate crate278 )
    ( clear crate278 )
    ( surface-at pallet819 place760 )
    ( surface-at crate819 place760 )
    ( on crate819 pallet819 )
    ( is-crate crate819 )
    ( clear crate819 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate952 crate955 crate715 crate515 crate314 crate359 crate278 crate819 )
  )
)
