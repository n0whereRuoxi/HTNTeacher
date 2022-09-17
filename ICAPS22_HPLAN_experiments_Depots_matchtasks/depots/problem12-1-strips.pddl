( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place464 - place
    hoist464 - hoist
    place230 - place
    hoist230 - hoist
    place588 - place
    hoist588 - hoist
    place519 - place
    hoist519 - hoist
    place215 - place
    hoist215 - hoist
    place52 - place
    hoist52 - hoist
    place322 - place
    hoist322 - hoist
    place593 - place
    hoist593 - hoist
    place86 - place
    hoist86 - hoist
    place438 - place
    hoist438 - hoist
    place679 - place
    hoist679 - hoist
    place586 - place
    hoist586 - hoist
    place927 - place
    hoist927 - hoist
    place388 - place
    hoist388 - hoist
    place395 - place
    hoist395 - hoist
    place424 - place
    hoist424 - hoist
    place573 - place
    hoist573 - hoist
    place530 - place
    hoist530 - hoist
    place0 - place
    hoist0 - hoist
    crate922 - surface
    pallet922 - surface
    crate232 - surface
    pallet232 - surface
    crate908 - surface
    pallet908 - surface
    crate573 - surface
    pallet573 - surface
    crate957 - surface
    pallet957 - surface
    crate74 - surface
    pallet74 - surface
    crate515 - surface
    pallet515 - surface
    crate134 - surface
    pallet134 - surface
    crate673 - surface
    pallet673 - surface
    crate829 - surface
    pallet829 - surface
    crate676 - surface
    pallet676 - surface
    crate40 - surface
    pallet40 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist464 place464 )
    ( available hoist464 )
    ( hoist-at hoist230 place230 )
    ( available hoist230 )
    ( hoist-at hoist588 place588 )
    ( available hoist588 )
    ( hoist-at hoist519 place519 )
    ( available hoist519 )
    ( hoist-at hoist215 place215 )
    ( available hoist215 )
    ( hoist-at hoist52 place52 )
    ( available hoist52 )
    ( hoist-at hoist322 place322 )
    ( available hoist322 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist438 place438 )
    ( available hoist438 )
    ( hoist-at hoist679 place679 )
    ( available hoist679 )
    ( hoist-at hoist586 place586 )
    ( available hoist586 )
    ( hoist-at hoist927 place927 )
    ( available hoist927 )
    ( hoist-at hoist388 place388 )
    ( available hoist388 )
    ( hoist-at hoist395 place395 )
    ( available hoist395 )
    ( hoist-at hoist424 place424 )
    ( available hoist424 )
    ( hoist-at hoist573 place573 )
    ( available hoist573 )
    ( hoist-at hoist530 place530 )
    ( available hoist530 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet922 place424 )
    ( surface-at crate922 place424 )
    ( on crate922 pallet922 )
    ( is-crate crate922 )
    ( clear crate922 )
    ( surface-at pallet232 place593 )
    ( surface-at crate232 place593 )
    ( on crate232 pallet232 )
    ( is-crate crate232 )
    ( clear crate232 )
    ( surface-at pallet908 place927 )
    ( surface-at crate908 place927 )
    ( on crate908 pallet908 )
    ( is-crate crate908 )
    ( clear crate908 )
    ( surface-at pallet573 place679 )
    ( surface-at crate573 place679 )
    ( on crate573 pallet573 )
    ( is-crate crate573 )
    ( clear crate573 )
    ( surface-at pallet957 place464 )
    ( surface-at crate957 place464 )
    ( on crate957 pallet957 )
    ( is-crate crate957 )
    ( clear crate957 )
    ( surface-at pallet74 place322 )
    ( surface-at crate74 place322 )
    ( on crate74 pallet74 )
    ( is-crate crate74 )
    ( clear crate74 )
    ( surface-at pallet515 place586 )
    ( surface-at crate515 place586 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
    ( surface-at pallet134 place593 )
    ( surface-at crate134 place593 )
    ( on crate134 pallet134 )
    ( is-crate crate134 )
    ( clear crate134 )
    ( surface-at pallet673 place593 )
    ( surface-at crate673 place593 )
    ( on crate673 pallet673 )
    ( is-crate crate673 )
    ( clear crate673 )
    ( surface-at pallet829 place424 )
    ( surface-at crate829 place424 )
    ( on crate829 pallet829 )
    ( is-crate crate829 )
    ( clear crate829 )
    ( surface-at pallet676 place230 )
    ( surface-at crate676 place230 )
    ( on crate676 pallet676 )
    ( is-crate crate676 )
    ( clear crate676 )
    ( surface-at pallet40 place593 )
    ( surface-at crate40 place593 )
    ( on crate40 pallet40 )
    ( is-crate crate40 )
    ( clear crate40 )
  )
  ( :goal
    ( and
    )
  )
)
