( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place332 - place
    hoist332 - hoist
    place205 - place
    hoist205 - hoist
    place831 - place
    hoist831 - hoist
    place233 - place
    hoist233 - hoist
    place895 - place
    hoist895 - hoist
    place706 - place
    hoist706 - hoist
    place758 - place
    hoist758 - hoist
    place363 - place
    hoist363 - hoist
    place87 - place
    hoist87 - hoist
    place708 - place
    hoist708 - hoist
    place508 - place
    hoist508 - hoist
    place633 - place
    hoist633 - hoist
    place149 - place
    hoist149 - hoist
    place72 - place
    hoist72 - hoist
    place372 - place
    hoist372 - hoist
    place703 - place
    hoist703 - hoist
    place866 - place
    hoist866 - hoist
    place884 - place
    hoist884 - hoist
    place397 - place
    hoist397 - hoist
    place0 - place
    hoist0 - hoist
    crate971 - surface
    pallet971 - surface
    crate846 - surface
    pallet846 - surface
    crate850 - surface
    pallet850 - surface
    crate664 - surface
    pallet664 - surface
    crate696 - surface
    pallet696 - surface
    crate276 - surface
    pallet276 - surface
    crate900 - surface
    pallet900 - surface
    crate391 - surface
    pallet391 - surface
    crate69 - surface
    pallet69 - surface
    crate378 - surface
    pallet378 - surface
    crate188 - surface
    pallet188 - surface
    crate820 - surface
    pallet820 - surface
    crate284 - surface
    pallet284 - surface
    crate279 - surface
    pallet279 - surface
    crate788 - surface
    pallet788 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist332 place332 )
    ( available hoist332 )
    ( hoist-at hoist205 place205 )
    ( available hoist205 )
    ( hoist-at hoist831 place831 )
    ( available hoist831 )
    ( hoist-at hoist233 place233 )
    ( available hoist233 )
    ( hoist-at hoist895 place895 )
    ( available hoist895 )
    ( hoist-at hoist706 place706 )
    ( available hoist706 )
    ( hoist-at hoist758 place758 )
    ( available hoist758 )
    ( hoist-at hoist363 place363 )
    ( available hoist363 )
    ( hoist-at hoist87 place87 )
    ( available hoist87 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist633 place633 )
    ( available hoist633 )
    ( hoist-at hoist149 place149 )
    ( available hoist149 )
    ( hoist-at hoist72 place72 )
    ( available hoist72 )
    ( hoist-at hoist372 place372 )
    ( available hoist372 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist866 place866 )
    ( available hoist866 )
    ( hoist-at hoist884 place884 )
    ( available hoist884 )
    ( hoist-at hoist397 place397 )
    ( available hoist397 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet971 place149 )
    ( surface-at crate971 place149 )
    ( on crate971 pallet971 )
    ( is-crate crate971 )
    ( clear crate971 )
    ( surface-at pallet846 place866 )
    ( surface-at crate846 place866 )
    ( on crate846 pallet846 )
    ( is-crate crate846 )
    ( clear crate846 )
    ( surface-at pallet850 place895 )
    ( surface-at crate850 place895 )
    ( on crate850 pallet850 )
    ( is-crate crate850 )
    ( clear crate850 )
    ( surface-at pallet664 place72 )
    ( surface-at crate664 place72 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
    ( surface-at pallet696 place703 )
    ( surface-at crate696 place703 )
    ( on crate696 pallet696 )
    ( is-crate crate696 )
    ( clear crate696 )
    ( surface-at pallet276 place372 )
    ( surface-at crate276 place372 )
    ( on crate276 pallet276 )
    ( is-crate crate276 )
    ( clear crate276 )
    ( surface-at pallet900 place363 )
    ( surface-at crate900 place363 )
    ( on crate900 pallet900 )
    ( is-crate crate900 )
    ( clear crate900 )
    ( surface-at pallet391 place758 )
    ( surface-at crate391 place758 )
    ( on crate391 pallet391 )
    ( is-crate crate391 )
    ( clear crate391 )
    ( surface-at pallet69 place149 )
    ( surface-at crate69 place149 )
    ( on crate69 pallet69 )
    ( is-crate crate69 )
    ( clear crate69 )
    ( surface-at pallet378 place508 )
    ( surface-at crate378 place508 )
    ( on crate378 pallet378 )
    ( is-crate crate378 )
    ( clear crate378 )
    ( surface-at pallet188 place703 )
    ( surface-at crate188 place703 )
    ( on crate188 pallet188 )
    ( is-crate crate188 )
    ( clear crate188 )
    ( surface-at pallet820 place884 )
    ( surface-at crate820 place884 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet284 place508 )
    ( surface-at crate284 place508 )
    ( on crate284 pallet284 )
    ( is-crate crate284 )
    ( clear crate284 )
    ( surface-at pallet279 place706 )
    ( surface-at crate279 place706 )
    ( on crate279 pallet279 )
    ( is-crate crate279 )
    ( clear crate279 )
    ( surface-at pallet788 place633 )
    ( surface-at crate788 place633 )
    ( on crate788 pallet788 )
    ( is-crate crate788 )
    ( clear crate788 )
  )
  ( :goal
    ( and
    )
  )
)
