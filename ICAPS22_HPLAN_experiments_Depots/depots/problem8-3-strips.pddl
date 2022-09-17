( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place323 - place
    hoist323 - hoist
    place694 - place
    hoist694 - hoist
    place639 - place
    hoist639 - hoist
    place719 - place
    hoist719 - hoist
    place951 - place
    hoist951 - hoist
    place661 - place
    hoist661 - hoist
    place537 - place
    hoist537 - hoist
    place791 - place
    hoist791 - hoist
    place720 - place
    hoist720 - hoist
    place0 - place
    hoist0 - hoist
    crate626 - surface
    pallet626 - surface
    crate367 - surface
    pallet367 - surface
    crate226 - surface
    pallet226 - surface
    crate530 - surface
    pallet530 - surface
    crate97 - surface
    pallet97 - surface
    crate230 - surface
    pallet230 - surface
    crate594 - surface
    pallet594 - surface
    crate978 - surface
    pallet978 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist323 place323 )
    ( available hoist323 )
    ( hoist-at hoist694 place694 )
    ( available hoist694 )
    ( hoist-at hoist639 place639 )
    ( available hoist639 )
    ( hoist-at hoist719 place719 )
    ( available hoist719 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist661 place661 )
    ( available hoist661 )
    ( hoist-at hoist537 place537 )
    ( available hoist537 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist720 place720 )
    ( available hoist720 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet626 place639 )
    ( surface-at crate626 place639 )
    ( on crate626 pallet626 )
    ( is-crate crate626 )
    ( clear crate626 )
    ( surface-at pallet367 place537 )
    ( surface-at crate367 place537 )
    ( on crate367 pallet367 )
    ( is-crate crate367 )
    ( clear crate367 )
    ( surface-at pallet226 place639 )
    ( surface-at crate226 place639 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
    ( surface-at pallet530 place661 )
    ( surface-at crate530 place661 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet97 place720 )
    ( surface-at crate97 place720 )
    ( on crate97 pallet97 )
    ( is-crate crate97 )
    ( clear crate97 )
    ( surface-at pallet230 place323 )
    ( surface-at crate230 place323 )
    ( on crate230 pallet230 )
    ( is-crate crate230 )
    ( clear crate230 )
    ( surface-at pallet594 place639 )
    ( surface-at crate594 place639 )
    ( on crate594 pallet594 )
    ( is-crate crate594 )
    ( clear crate594 )
    ( surface-at pallet978 place720 )
    ( surface-at crate978 place720 )
    ( on crate978 pallet978 )
    ( is-crate crate978 )
    ( clear crate978 )
  )
  ( :goal
    ( and
    )
  )
)
