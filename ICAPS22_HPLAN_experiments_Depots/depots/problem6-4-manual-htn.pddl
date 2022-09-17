( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place590 - place
    hoist590 - hoist
    place875 - place
    hoist875 - hoist
    place415 - place
    hoist415 - hoist
    place482 - place
    hoist482 - hoist
    place72 - place
    hoist72 - hoist
    place386 - place
    hoist386 - hoist
    place202 - place
    hoist202 - hoist
    place302 - place
    hoist302 - hoist
    place152 - place
    hoist152 - hoist
    place174 - place
    hoist174 - hoist
    place676 - place
    hoist676 - hoist
    place0 - place
    hoist0 - hoist
    crate465 - surface
    pallet465 - surface
    crate792 - surface
    pallet792 - surface
    crate43 - surface
    pallet43 - surface
    crate237 - surface
    pallet237 - surface
    crate535 - surface
    pallet535 - surface
    crate419 - surface
    pallet419 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist590 place590 )
    ( available hoist590 )
    ( hoist-at hoist875 place875 )
    ( available hoist875 )
    ( hoist-at hoist415 place415 )
    ( available hoist415 )
    ( hoist-at hoist482 place482 )
    ( available hoist482 )
    ( hoist-at hoist72 place72 )
    ( available hoist72 )
    ( hoist-at hoist386 place386 )
    ( available hoist386 )
    ( hoist-at hoist202 place202 )
    ( available hoist202 )
    ( hoist-at hoist302 place302 )
    ( available hoist302 )
    ( hoist-at hoist152 place152 )
    ( available hoist152 )
    ( hoist-at hoist174 place174 )
    ( available hoist174 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet465 place676 )
    ( surface-at crate465 place676 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet792 place302 )
    ( surface-at crate792 place302 )
    ( on crate792 pallet792 )
    ( is-crate crate792 )
    ( clear crate792 )
    ( surface-at pallet43 place174 )
    ( surface-at crate43 place174 )
    ( on crate43 pallet43 )
    ( is-crate crate43 )
    ( clear crate43 )
    ( surface-at pallet237 place482 )
    ( surface-at crate237 place482 )
    ( on crate237 pallet237 )
    ( is-crate crate237 )
    ( clear crate237 )
    ( surface-at pallet535 place875 )
    ( surface-at crate535 place875 )
    ( on crate535 pallet535 )
    ( is-crate crate535 )
    ( clear crate535 )
    ( surface-at pallet419 place482 )
    ( surface-at crate419 place482 )
    ( on crate419 pallet419 )
    ( is-crate crate419 )
    ( clear crate419 )
  )
  ( :tasks
    ( Make-On crate465 pallet0 )    ( Make-On crate792 crate465 )    ( Make-On crate43 crate792 )    ( Make-On crate237 crate43 )    ( Make-On crate535 crate237 )    ( Make-On crate419 crate535 )  )
)
