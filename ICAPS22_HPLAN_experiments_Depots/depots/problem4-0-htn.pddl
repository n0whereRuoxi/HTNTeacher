( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place406 - place
    hoist406 - hoist
    place576 - place
    hoist576 - hoist
    place845 - place
    hoist845 - hoist
    place894 - place
    hoist894 - hoist
    place204 - place
    hoist204 - hoist
    place718 - place
    hoist718 - hoist
    place0 - place
    hoist0 - hoist
    crate986 - surface
    pallet986 - surface
    crate782 - surface
    pallet782 - surface
    crate758 - surface
    pallet758 - surface
    crate686 - surface
    pallet686 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist406 place406 )
    ( available hoist406 )
    ( hoist-at hoist576 place576 )
    ( available hoist576 )
    ( hoist-at hoist845 place845 )
    ( available hoist845 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist204 place204 )
    ( available hoist204 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet986 place576 )
    ( surface-at crate986 place576 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet782 place204 )
    ( surface-at crate782 place204 )
    ( on crate782 pallet782 )
    ( is-crate crate782 )
    ( clear crate782 )
    ( surface-at pallet758 place894 )
    ( surface-at crate758 place894 )
    ( on crate758 pallet758 )
    ( is-crate crate758 )
    ( clear crate758 )
    ( surface-at pallet686 place718 )
    ( surface-at crate686 place718 )
    ( on crate686 pallet686 )
    ( is-crate crate686 )
    ( clear crate686 )
  )
  ( :tasks
    ( Make-On crate986 pallet0 )    ( Make-On crate782 crate986 )    ( Make-On crate758 crate782 )    ( Make-On crate686 crate758 )  )
)
