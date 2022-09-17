( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place970 - place
    hoist970 - hoist
    place711 - place
    hoist711 - hoist
    place755 - place
    hoist755 - hoist
    place777 - place
    hoist777 - hoist
    place351 - place
    hoist351 - hoist
    place878 - place
    hoist878 - hoist
    place0 - place
    hoist0 - hoist
    crate617 - surface
    pallet617 - surface
    crate784 - surface
    pallet784 - surface
    crate482 - surface
    pallet482 - surface
    crate218 - surface
    pallet218 - surface
    crate172 - surface
    pallet172 - surface
    crate366 - surface
    pallet366 - surface
    crate173 - surface
    pallet173 - surface
    crate991 - surface
    pallet991 - surface
    crate209 - surface
    pallet209 - surface
    crate675 - surface
    pallet675 - surface
    crate403 - surface
    pallet403 - surface
    crate504 - surface
    pallet504 - surface
    crate328 - surface
    pallet328 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist970 place970 )
    ( available hoist970 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist755 place755 )
    ( available hoist755 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist878 place878 )
    ( available hoist878 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet617 place351 )
    ( surface-at crate617 place351 )
    ( on crate617 pallet617 )
    ( is-crate crate617 )
    ( clear crate617 )
    ( surface-at pallet784 place351 )
    ( surface-at crate784 place351 )
    ( on crate784 pallet784 )
    ( is-crate crate784 )
    ( clear crate784 )
    ( surface-at pallet482 place878 )
    ( surface-at crate482 place878 )
    ( on crate482 pallet482 )
    ( is-crate crate482 )
    ( clear crate482 )
    ( surface-at pallet218 place351 )
    ( surface-at crate218 place351 )
    ( on crate218 pallet218 )
    ( is-crate crate218 )
    ( clear crate218 )
    ( surface-at pallet172 place970 )
    ( surface-at crate172 place970 )
    ( on crate172 pallet172 )
    ( is-crate crate172 )
    ( clear crate172 )
    ( surface-at pallet366 place970 )
    ( surface-at crate366 place970 )
    ( on crate366 pallet366 )
    ( is-crate crate366 )
    ( clear crate366 )
    ( surface-at pallet173 place970 )
    ( surface-at crate173 place970 )
    ( on crate173 pallet173 )
    ( is-crate crate173 )
    ( clear crate173 )
    ( surface-at pallet991 place755 )
    ( surface-at crate991 place755 )
    ( on crate991 pallet991 )
    ( is-crate crate991 )
    ( clear crate991 )
    ( surface-at pallet209 place777 )
    ( surface-at crate209 place777 )
    ( on crate209 pallet209 )
    ( is-crate crate209 )
    ( clear crate209 )
    ( surface-at pallet675 place711 )
    ( surface-at crate675 place711 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet403 place351 )
    ( surface-at crate403 place351 )
    ( on crate403 pallet403 )
    ( is-crate crate403 )
    ( clear crate403 )
    ( surface-at pallet504 place970 )
    ( surface-at crate504 place970 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet328 place351 )
    ( surface-at crate328 place351 )
    ( on crate328 pallet328 )
    ( is-crate crate328 )
    ( clear crate328 )
  )
  ( :goal
    ( and
    )
  )
)
