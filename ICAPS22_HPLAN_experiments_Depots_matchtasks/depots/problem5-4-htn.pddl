( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place386 - place
    hoist386 - hoist
    place970 - place
    hoist970 - hoist
    place840 - place
    hoist840 - hoist
    place227 - place
    hoist227 - hoist
    place390 - place
    hoist390 - hoist
    place0 - place
    hoist0 - hoist
    crate971 - surface
    pallet971 - surface
    crate733 - surface
    pallet733 - surface
    crate824 - surface
    pallet824 - surface
    crate814 - surface
    pallet814 - surface
    crate813 - surface
    pallet813 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist386 place386 )
    ( available hoist386 )
    ( hoist-at hoist970 place970 )
    ( available hoist970 )
    ( hoist-at hoist840 place840 )
    ( available hoist840 )
    ( hoist-at hoist227 place227 )
    ( available hoist227 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet971 place386 )
    ( surface-at crate971 place386 )
    ( on crate971 pallet971 )
    ( is-crate crate971 )
    ( clear crate971 )
    ( surface-at pallet733 place386 )
    ( surface-at crate733 place386 )
    ( on crate733 pallet733 )
    ( is-crate crate733 )
    ( clear crate733 )
    ( surface-at pallet824 place970 )
    ( surface-at crate824 place970 )
    ( on crate824 pallet824 )
    ( is-crate crate824 )
    ( clear crate824 )
    ( surface-at pallet814 place227 )
    ( surface-at crate814 place227 )
    ( on crate814 pallet814 )
    ( is-crate crate814 )
    ( clear crate814 )
    ( surface-at pallet813 place227 )
    ( surface-at crate813 place227 )
    ( on crate813 pallet813 )
    ( is-crate crate813 )
    ( clear crate813 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate971 crate733 crate824 crate814 crate813 )
  )
)
