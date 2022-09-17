( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place707 - place
    hoist707 - hoist
    place291 - place
    hoist291 - hoist
    place899 - place
    hoist899 - hoist
    place833 - place
    hoist833 - hoist
    place78 - place
    hoist78 - hoist
    place14 - place
    hoist14 - hoist
    place915 - place
    hoist915 - hoist
    place365 - place
    hoist365 - hoist
    place474 - place
    hoist474 - hoist
    place907 - place
    hoist907 - hoist
    place802 - place
    hoist802 - hoist
    place845 - place
    hoist845 - hoist
    place82 - place
    hoist82 - hoist
    place217 - place
    hoist217 - hoist
    place885 - place
    hoist885 - hoist
    place0 - place
    hoist0 - hoist
    crate996 - surface
    pallet996 - surface
    crate657 - surface
    pallet657 - surface
    crate706 - surface
    pallet706 - surface
    crate918 - surface
    pallet918 - surface
    crate454 - surface
    pallet454 - surface
    crate576 - surface
    pallet576 - surface
    crate545 - surface
    pallet545 - surface
    crate974 - surface
    pallet974 - surface
    crate743 - surface
    pallet743 - surface
    crate596 - surface
    pallet596 - surface
    crate346 - surface
    pallet346 - surface
    crate446 - surface
    pallet446 - surface
    crate930 - surface
    pallet930 - surface
    crate126 - surface
    pallet126 - surface
    crate252 - surface
    pallet252 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist291 place291 )
    ( available hoist291 )
    ( hoist-at hoist899 place899 )
    ( available hoist899 )
    ( hoist-at hoist833 place833 )
    ( available hoist833 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist365 place365 )
    ( available hoist365 )
    ( hoist-at hoist474 place474 )
    ( available hoist474 )
    ( hoist-at hoist907 place907 )
    ( available hoist907 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist845 place845 )
    ( available hoist845 )
    ( hoist-at hoist82 place82 )
    ( available hoist82 )
    ( hoist-at hoist217 place217 )
    ( available hoist217 )
    ( hoist-at hoist885 place885 )
    ( available hoist885 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet996 place885 )
    ( surface-at crate996 place885 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet657 place915 )
    ( surface-at crate657 place915 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet706 place907 )
    ( surface-at crate706 place907 )
    ( on crate706 pallet706 )
    ( is-crate crate706 )
    ( clear crate706 )
    ( surface-at pallet918 place78 )
    ( surface-at crate918 place78 )
    ( on crate918 pallet918 )
    ( is-crate crate918 )
    ( clear crate918 )
    ( surface-at pallet454 place907 )
    ( surface-at crate454 place907 )
    ( on crate454 pallet454 )
    ( is-crate crate454 )
    ( clear crate454 )
    ( surface-at pallet576 place14 )
    ( surface-at crate576 place14 )
    ( on crate576 pallet576 )
    ( is-crate crate576 )
    ( clear crate576 )
    ( surface-at pallet545 place82 )
    ( surface-at crate545 place82 )
    ( on crate545 pallet545 )
    ( is-crate crate545 )
    ( clear crate545 )
    ( surface-at pallet974 place291 )
    ( surface-at crate974 place291 )
    ( on crate974 pallet974 )
    ( is-crate crate974 )
    ( clear crate974 )
    ( surface-at pallet743 place78 )
    ( surface-at crate743 place78 )
    ( on crate743 pallet743 )
    ( is-crate crate743 )
    ( clear crate743 )
    ( surface-at pallet596 place78 )
    ( surface-at crate596 place78 )
    ( on crate596 pallet596 )
    ( is-crate crate596 )
    ( clear crate596 )
    ( surface-at pallet346 place907 )
    ( surface-at crate346 place907 )
    ( on crate346 pallet346 )
    ( is-crate crate346 )
    ( clear crate346 )
    ( surface-at pallet446 place82 )
    ( surface-at crate446 place82 )
    ( on crate446 pallet446 )
    ( is-crate crate446 )
    ( clear crate446 )
    ( surface-at pallet930 place291 )
    ( surface-at crate930 place291 )
    ( on crate930 pallet930 )
    ( is-crate crate930 )
    ( clear crate930 )
    ( surface-at pallet126 place707 )
    ( surface-at crate126 place707 )
    ( on crate126 pallet126 )
    ( is-crate crate126 )
    ( clear crate126 )
    ( surface-at pallet252 place82 )
    ( surface-at crate252 place82 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
  )
  ( :goal
    ( and
    )
  )
)
