( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place986 - place
    hoist986 - hoist
    place636 - place
    hoist636 - hoist
    place532 - place
    hoist532 - hoist
    place733 - place
    hoist733 - hoist
    place314 - place
    hoist314 - hoist
    place972 - place
    hoist972 - hoist
    place936 - place
    hoist936 - hoist
    place653 - place
    hoist653 - hoist
    place703 - place
    hoist703 - hoist
    place753 - place
    hoist753 - hoist
    place644 - place
    hoist644 - hoist
    place0 - place
    hoist0 - hoist
    crate612 - surface
    pallet612 - surface
    crate547 - surface
    pallet547 - surface
    crate391 - surface
    pallet391 - surface
    crate808 - surface
    pallet808 - surface
    crate781 - surface
    pallet781 - surface
    crate790 - surface
    pallet790 - surface
    crate739 - surface
    pallet739 - surface
    crate460 - surface
    pallet460 - surface
    crate533 - surface
    pallet533 - surface
    crate377 - surface
    pallet377 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist986 place986 )
    ( available hoist986 )
    ( hoist-at hoist636 place636 )
    ( available hoist636 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist733 place733 )
    ( available hoist733 )
    ( hoist-at hoist314 place314 )
    ( available hoist314 )
    ( hoist-at hoist972 place972 )
    ( available hoist972 )
    ( hoist-at hoist936 place936 )
    ( available hoist936 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet612 place703 )
    ( surface-at crate612 place703 )
    ( on crate612 pallet612 )
    ( is-crate crate612 )
    ( clear crate612 )
    ( surface-at pallet547 place653 )
    ( surface-at crate547 place653 )
    ( on crate547 pallet547 )
    ( is-crate crate547 )
    ( clear crate547 )
    ( surface-at pallet391 place703 )
    ( surface-at crate391 place703 )
    ( on crate391 pallet391 )
    ( is-crate crate391 )
    ( clear crate391 )
    ( surface-at pallet808 place314 )
    ( surface-at crate808 place314 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet781 place733 )
    ( surface-at crate781 place733 )
    ( on crate781 pallet781 )
    ( is-crate crate781 )
    ( clear crate781 )
    ( surface-at pallet790 place314 )
    ( surface-at crate790 place314 )
    ( on crate790 pallet790 )
    ( is-crate crate790 )
    ( clear crate790 )
    ( surface-at pallet739 place644 )
    ( surface-at crate739 place644 )
    ( on crate739 pallet739 )
    ( is-crate crate739 )
    ( clear crate739 )
    ( surface-at pallet460 place532 )
    ( surface-at crate460 place532 )
    ( on crate460 pallet460 )
    ( is-crate crate460 )
    ( clear crate460 )
    ( surface-at pallet533 place753 )
    ( surface-at crate533 place753 )
    ( on crate533 pallet533 )
    ( is-crate crate533 )
    ( clear crate533 )
    ( surface-at pallet377 place986 )
    ( surface-at crate377 place986 )
    ( on crate377 pallet377 )
    ( is-crate crate377 )
    ( clear crate377 )
  )
  ( :goal
    ( and
    )
  )
)
