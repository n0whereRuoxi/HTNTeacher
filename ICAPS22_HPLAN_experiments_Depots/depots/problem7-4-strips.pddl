( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place722 - place
    hoist722 - hoist
    place427 - place
    hoist427 - hoist
    place538 - place
    hoist538 - hoist
    place613 - place
    hoist613 - hoist
    place697 - place
    hoist697 - hoist
    place871 - place
    hoist871 - hoist
    place870 - place
    hoist870 - hoist
    place206 - place
    hoist206 - hoist
    place586 - place
    hoist586 - hoist
    place393 - place
    hoist393 - hoist
    place503 - place
    hoist503 - hoist
    place914 - place
    hoist914 - hoist
    place0 - place
    hoist0 - hoist
    crate590 - surface
    pallet590 - surface
    crate621 - surface
    pallet621 - surface
    crate547 - surface
    pallet547 - surface
    crate186 - surface
    pallet186 - surface
    crate638 - surface
    pallet638 - surface
    crate356 - surface
    pallet356 - surface
    crate417 - surface
    pallet417 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist722 place722 )
    ( available hoist722 )
    ( hoist-at hoist427 place427 )
    ( available hoist427 )
    ( hoist-at hoist538 place538 )
    ( available hoist538 )
    ( hoist-at hoist613 place613 )
    ( available hoist613 )
    ( hoist-at hoist697 place697 )
    ( available hoist697 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist870 place870 )
    ( available hoist870 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist586 place586 )
    ( available hoist586 )
    ( hoist-at hoist393 place393 )
    ( available hoist393 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist914 place914 )
    ( available hoist914 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet590 place914 )
    ( surface-at crate590 place914 )
    ( on crate590 pallet590 )
    ( is-crate crate590 )
    ( clear crate590 )
    ( surface-at pallet621 place870 )
    ( surface-at crate621 place870 )
    ( on crate621 pallet621 )
    ( is-crate crate621 )
    ( clear crate621 )
    ( surface-at pallet547 place870 )
    ( surface-at crate547 place870 )
    ( on crate547 pallet547 )
    ( is-crate crate547 )
    ( clear crate547 )
    ( surface-at pallet186 place427 )
    ( surface-at crate186 place427 )
    ( on crate186 pallet186 )
    ( is-crate crate186 )
    ( clear crate186 )
    ( surface-at pallet638 place538 )
    ( surface-at crate638 place538 )
    ( on crate638 pallet638 )
    ( is-crate crate638 )
    ( clear crate638 )
    ( surface-at pallet356 place538 )
    ( surface-at crate356 place538 )
    ( on crate356 pallet356 )
    ( is-crate crate356 )
    ( clear crate356 )
    ( surface-at pallet417 place871 )
    ( surface-at crate417 place871 )
    ( on crate417 pallet417 )
    ( is-crate crate417 )
    ( clear crate417 )
  )
  ( :goal
    ( and
    )
  )
)
