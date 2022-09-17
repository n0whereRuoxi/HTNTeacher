( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place102 - place
    hoist102 - hoist
    place327 - place
    hoist327 - hoist
    place279 - place
    hoist279 - hoist
    place330 - place
    hoist330 - hoist
    place859 - place
    hoist859 - hoist
    place988 - place
    hoist988 - hoist
    place611 - place
    hoist611 - hoist
    place196 - place
    hoist196 - hoist
    place15 - place
    hoist15 - hoist
    place399 - place
    hoist399 - hoist
    place129 - place
    hoist129 - hoist
    place379 - place
    hoist379 - hoist
    place719 - place
    hoist719 - hoist
    place135 - place
    hoist135 - hoist
    place967 - place
    hoist967 - hoist
    place239 - place
    hoist239 - hoist
    place0 - place
    hoist0 - hoist
    crate586 - surface
    pallet586 - surface
    crate512 - surface
    pallet512 - surface
    crate398 - surface
    pallet398 - surface
    crate344 - surface
    pallet344 - surface
    crate805 - surface
    pallet805 - surface
    crate347 - surface
    pallet347 - surface
    crate318 - surface
    pallet318 - surface
    crate107 - surface
    pallet107 - surface
    crate263 - surface
    pallet263 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist102 place102 )
    ( available hoist102 )
    ( hoist-at hoist327 place327 )
    ( available hoist327 )
    ( hoist-at hoist279 place279 )
    ( available hoist279 )
    ( hoist-at hoist330 place330 )
    ( available hoist330 )
    ( hoist-at hoist859 place859 )
    ( available hoist859 )
    ( hoist-at hoist988 place988 )
    ( available hoist988 )
    ( hoist-at hoist611 place611 )
    ( available hoist611 )
    ( hoist-at hoist196 place196 )
    ( available hoist196 )
    ( hoist-at hoist15 place15 )
    ( available hoist15 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist129 place129 )
    ( available hoist129 )
    ( hoist-at hoist379 place379 )
    ( available hoist379 )
    ( hoist-at hoist719 place719 )
    ( available hoist719 )
    ( hoist-at hoist135 place135 )
    ( available hoist135 )
    ( hoist-at hoist967 place967 )
    ( available hoist967 )
    ( hoist-at hoist239 place239 )
    ( available hoist239 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet586 place379 )
    ( surface-at crate586 place379 )
    ( on crate586 pallet586 )
    ( is-crate crate586 )
    ( clear crate586 )
    ( surface-at pallet512 place330 )
    ( surface-at crate512 place330 )
    ( on crate512 pallet512 )
    ( is-crate crate512 )
    ( clear crate512 )
    ( surface-at pallet398 place135 )
    ( surface-at crate398 place135 )
    ( on crate398 pallet398 )
    ( is-crate crate398 )
    ( clear crate398 )
    ( surface-at pallet344 place379 )
    ( surface-at crate344 place379 )
    ( on crate344 pallet344 )
    ( is-crate crate344 )
    ( clear crate344 )
    ( surface-at pallet805 place611 )
    ( surface-at crate805 place611 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet347 place15 )
    ( surface-at crate347 place15 )
    ( on crate347 pallet347 )
    ( is-crate crate347 )
    ( clear crate347 )
    ( surface-at pallet318 place330 )
    ( surface-at crate318 place330 )
    ( on crate318 pallet318 )
    ( is-crate crate318 )
    ( clear crate318 )
    ( surface-at pallet107 place327 )
    ( surface-at crate107 place327 )
    ( on crate107 pallet107 )
    ( is-crate crate107 )
    ( clear crate107 )
    ( surface-at pallet263 place859 )
    ( surface-at crate263 place859 )
    ( on crate263 pallet263 )
    ( is-crate crate263 )
    ( clear crate263 )
  )
  ( :tasks
    ( Make-On crate586 pallet0 )    ( Make-On crate512 crate586 )    ( Make-On crate398 crate512 )    ( Make-On crate344 crate398 )    ( Make-On crate805 crate344 )    ( Make-On crate347 crate805 )    ( Make-On crate318 crate347 )    ( Make-On crate107 crate318 )    ( Make-On crate263 crate107 )  )
)
