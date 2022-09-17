( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place483 - place
    hoist483 - hoist
    place780 - place
    hoist780 - hoist
    place497 - place
    hoist497 - hoist
    place900 - place
    hoist900 - hoist
    place910 - place
    hoist910 - hoist
    place367 - place
    hoist367 - hoist
    place154 - place
    hoist154 - hoist
    place641 - place
    hoist641 - hoist
    place355 - place
    hoist355 - hoist
    place0 - place
    hoist0 - hoist
    crate183 - surface
    pallet183 - surface
    crate749 - surface
    pallet749 - surface
    crate556 - surface
    pallet556 - surface
    crate304 - surface
    pallet304 - surface
    crate960 - surface
    pallet960 - surface
    crate262 - surface
    pallet262 - surface
    crate28 - surface
    pallet28 - surface
    crate435 - surface
    pallet435 - surface
    crate1 - surface
    pallet1 - surface
    crate465 - surface
    pallet465 - surface
    crate857 - surface
    pallet857 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist483 place483 )
    ( available hoist483 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist497 place497 )
    ( available hoist497 )
    ( hoist-at hoist900 place900 )
    ( available hoist900 )
    ( hoist-at hoist910 place910 )
    ( available hoist910 )
    ( hoist-at hoist367 place367 )
    ( available hoist367 )
    ( hoist-at hoist154 place154 )
    ( available hoist154 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist355 place355 )
    ( available hoist355 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet183 place367 )
    ( surface-at crate183 place367 )
    ( on crate183 pallet183 )
    ( is-crate crate183 )
    ( clear crate183 )
    ( surface-at pallet749 place780 )
    ( surface-at crate749 place780 )
    ( on crate749 pallet749 )
    ( is-crate crate749 )
    ( clear crate749 )
    ( surface-at pallet556 place780 )
    ( surface-at crate556 place780 )
    ( on crate556 pallet556 )
    ( is-crate crate556 )
    ( clear crate556 )
    ( surface-at pallet304 place355 )
    ( surface-at crate304 place355 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
    ( surface-at pallet960 place641 )
    ( surface-at crate960 place641 )
    ( on crate960 pallet960 )
    ( is-crate crate960 )
    ( clear crate960 )
    ( surface-at pallet262 place497 )
    ( surface-at crate262 place497 )
    ( on crate262 pallet262 )
    ( is-crate crate262 )
    ( clear crate262 )
    ( surface-at pallet28 place497 )
    ( surface-at crate28 place497 )
    ( on crate28 pallet28 )
    ( is-crate crate28 )
    ( clear crate28 )
    ( surface-at pallet435 place367 )
    ( surface-at crate435 place367 )
    ( on crate435 pallet435 )
    ( is-crate crate435 )
    ( clear crate435 )
    ( surface-at pallet1 place900 )
    ( surface-at crate1 place900 )
    ( on crate1 pallet1 )
    ( is-crate crate1 )
    ( clear crate1 )
    ( surface-at pallet465 place154 )
    ( surface-at crate465 place154 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet857 place497 )
    ( surface-at crate857 place497 )
    ( on crate857 pallet857 )
    ( is-crate crate857 )
    ( clear crate857 )
  )
  ( :tasks
    ( Make-On crate183 pallet0 )    ( Make-On crate749 crate183 )    ( Make-On crate556 crate749 )    ( Make-On crate304 crate556 )    ( Make-On crate960 crate304 )    ( Make-On crate262 crate960 )    ( Make-On crate28 crate262 )    ( Make-On crate435 crate28 )    ( Make-On crate1 crate435 )    ( Make-On crate465 crate1 )    ( Make-On crate857 crate465 )  )
)
