( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place425 - place
    hoist425 - hoist
    place349 - place
    hoist349 - hoist
    place241 - place
    hoist241 - hoist
    place0 - place
    hoist0 - hoist
    crate295 - surface
    pallet295 - surface
    crate313 - surface
    pallet313 - surface
    crate430 - surface
    pallet430 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist425 place425 )
    ( available hoist425 )
    ( hoist-at hoist349 place349 )
    ( available hoist349 )
    ( hoist-at hoist241 place241 )
    ( available hoist241 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet295 place425 )
    ( surface-at crate295 place425 )
    ( on crate295 pallet295 )
    ( is-crate crate295 )
    ( clear crate295 )
    ( surface-at pallet313 place425 )
    ( surface-at crate313 place425 )
    ( on crate313 pallet313 )
    ( is-crate crate313 )
    ( clear crate313 )
    ( surface-at pallet430 place349 )
    ( surface-at crate430 place349 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
  )
  ( :tasks
    ( Make-On crate295 pallet0 )    ( Make-On crate313 crate295 )    ( Make-On crate430 crate313 )  )
)
