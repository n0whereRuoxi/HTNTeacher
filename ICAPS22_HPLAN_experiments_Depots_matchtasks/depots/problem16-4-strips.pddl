( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place919 - place
    hoist919 - hoist
    place828 - place
    hoist828 - hoist
    place96 - place
    hoist96 - hoist
    place510 - place
    hoist510 - hoist
    place950 - place
    hoist950 - hoist
    place994 - place
    hoist994 - hoist
    place57 - place
    hoist57 - hoist
    place748 - place
    hoist748 - hoist
    place826 - place
    hoist826 - hoist
    place220 - place
    hoist220 - hoist
    place777 - place
    hoist777 - hoist
    place649 - place
    hoist649 - hoist
    place55 - place
    hoist55 - hoist
    place125 - place
    hoist125 - hoist
    place0 - place
    hoist0 - hoist
    crate669 - surface
    pallet669 - surface
    crate819 - surface
    pallet819 - surface
    crate504 - surface
    pallet504 - surface
    crate117 - surface
    pallet117 - surface
    crate203 - surface
    pallet203 - surface
    crate400 - surface
    pallet400 - surface
    crate53 - surface
    pallet53 - surface
    crate4 - surface
    pallet4 - surface
    crate183 - surface
    pallet183 - surface
    crate965 - surface
    pallet965 - surface
    crate909 - surface
    pallet909 - surface
    crate192 - surface
    pallet192 - surface
    crate291 - surface
    pallet291 - surface
    crate242 - surface
    pallet242 - surface
    crate33 - surface
    pallet33 - surface
    crate57 - surface
    pallet57 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist919 place919 )
    ( available hoist919 )
    ( hoist-at hoist828 place828 )
    ( available hoist828 )
    ( hoist-at hoist96 place96 )
    ( available hoist96 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist994 place994 )
    ( available hoist994 )
    ( hoist-at hoist57 place57 )
    ( available hoist57 )
    ( hoist-at hoist748 place748 )
    ( available hoist748 )
    ( hoist-at hoist826 place826 )
    ( available hoist826 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist649 place649 )
    ( available hoist649 )
    ( hoist-at hoist55 place55 )
    ( available hoist55 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet669 place828 )
    ( surface-at crate669 place828 )
    ( on crate669 pallet669 )
    ( is-crate crate669 )
    ( clear crate669 )
    ( surface-at pallet819 place950 )
    ( surface-at crate819 place950 )
    ( on crate819 pallet819 )
    ( is-crate crate819 )
    ( clear crate819 )
    ( surface-at pallet504 place649 )
    ( surface-at crate504 place649 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet117 place220 )
    ( surface-at crate117 place220 )
    ( on crate117 pallet117 )
    ( is-crate crate117 )
    ( clear crate117 )
    ( surface-at pallet203 place55 )
    ( surface-at crate203 place55 )
    ( on crate203 pallet203 )
    ( is-crate crate203 )
    ( clear crate203 )
    ( surface-at pallet400 place510 )
    ( surface-at crate400 place510 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet53 place828 )
    ( surface-at crate53 place828 )
    ( on crate53 pallet53 )
    ( is-crate crate53 )
    ( clear crate53 )
    ( surface-at pallet4 place748 )
    ( surface-at crate4 place748 )
    ( on crate4 pallet4 )
    ( is-crate crate4 )
    ( clear crate4 )
    ( surface-at pallet183 place220 )
    ( surface-at crate183 place220 )
    ( on crate183 pallet183 )
    ( is-crate crate183 )
    ( clear crate183 )
    ( surface-at pallet965 place826 )
    ( surface-at crate965 place826 )
    ( on crate965 pallet965 )
    ( is-crate crate965 )
    ( clear crate965 )
    ( surface-at pallet909 place125 )
    ( surface-at crate909 place125 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
    ( surface-at pallet192 place994 )
    ( surface-at crate192 place994 )
    ( on crate192 pallet192 )
    ( is-crate crate192 )
    ( clear crate192 )
    ( surface-at pallet291 place57 )
    ( surface-at crate291 place57 )
    ( on crate291 pallet291 )
    ( is-crate crate291 )
    ( clear crate291 )
    ( surface-at pallet242 place125 )
    ( surface-at crate242 place125 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet33 place220 )
    ( surface-at crate33 place220 )
    ( on crate33 pallet33 )
    ( is-crate crate33 )
    ( clear crate33 )
    ( surface-at pallet57 place994 )
    ( surface-at crate57 place994 )
    ( on crate57 pallet57 )
    ( is-crate crate57 )
    ( clear crate57 )
  )
  ( :goal
    ( and
    )
  )
)
