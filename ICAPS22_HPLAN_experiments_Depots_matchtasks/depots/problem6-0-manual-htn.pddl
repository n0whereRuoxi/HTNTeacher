( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place867 - place
    hoist867 - hoist
    place810 - place
    hoist810 - hoist
    place737 - place
    hoist737 - hoist
    place802 - place
    hoist802 - hoist
    place584 - place
    hoist584 - hoist
    place789 - place
    hoist789 - hoist
    place143 - place
    hoist143 - hoist
    place581 - place
    hoist581 - hoist
    place0 - place
    hoist0 - hoist
    crate414 - surface
    pallet414 - surface
    crate953 - surface
    pallet953 - surface
    crate660 - surface
    pallet660 - surface
    crate825 - surface
    pallet825 - surface
    crate97 - surface
    pallet97 - surface
    crate387 - surface
    pallet387 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist810 place810 )
    ( available hoist810 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist584 place584 )
    ( available hoist584 )
    ( hoist-at hoist789 place789 )
    ( available hoist789 )
    ( hoist-at hoist143 place143 )
    ( available hoist143 )
    ( hoist-at hoist581 place581 )
    ( available hoist581 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet414 place737 )
    ( surface-at crate414 place737 )
    ( on crate414 pallet414 )
    ( is-crate crate414 )
    ( clear crate414 )
    ( surface-at pallet953 place737 )
    ( surface-at crate953 place737 )
    ( on crate953 pallet953 )
    ( is-crate crate953 )
    ( clear crate953 )
    ( surface-at pallet660 place867 )
    ( surface-at crate660 place867 )
    ( on crate660 pallet660 )
    ( is-crate crate660 )
    ( clear crate660 )
    ( surface-at pallet825 place810 )
    ( surface-at crate825 place810 )
    ( on crate825 pallet825 )
    ( is-crate crate825 )
    ( clear crate825 )
    ( surface-at pallet97 place789 )
    ( surface-at crate97 place789 )
    ( on crate97 pallet97 )
    ( is-crate crate97 )
    ( clear crate97 )
    ( surface-at pallet387 place143 )
    ( surface-at crate387 place143 )
    ( on crate387 pallet387 )
    ( is-crate crate387 )
    ( clear crate387 )
  )
  ( :tasks
    ( Make-On crate414 pallet0 )    ( Make-On crate953 crate414 )    ( Make-On crate660 crate953 )    ( Make-On crate825 crate660 )    ( Make-On crate97 crate825 )    ( Make-On crate387 crate97 )  )
)
