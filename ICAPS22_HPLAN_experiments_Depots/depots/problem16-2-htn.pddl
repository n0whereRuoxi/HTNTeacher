( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place650 - place
    hoist650 - hoist
    place553 - place
    hoist553 - hoist
    place205 - place
    hoist205 - hoist
    place814 - place
    hoist814 - hoist
    place802 - place
    hoist802 - hoist
    place221 - place
    hoist221 - hoist
    place291 - place
    hoist291 - hoist
    place638 - place
    hoist638 - hoist
    place915 - place
    hoist915 - hoist
    place306 - place
    hoist306 - hoist
    place932 - place
    hoist932 - hoist
    place703 - place
    hoist703 - hoist
    place523 - place
    hoist523 - hoist
    place302 - place
    hoist302 - hoist
    place599 - place
    hoist599 - hoist
    place164 - place
    hoist164 - hoist
    place513 - place
    hoist513 - hoist
    place729 - place
    hoist729 - hoist
    place0 - place
    hoist0 - hoist
    crate740 - surface
    pallet740 - surface
    crate785 - surface
    pallet785 - surface
    crate854 - surface
    pallet854 - surface
    crate946 - surface
    pallet946 - surface
    crate97 - surface
    pallet97 - surface
    crate828 - surface
    pallet828 - surface
    crate9 - surface
    pallet9 - surface
    crate769 - surface
    pallet769 - surface
    crate711 - surface
    pallet711 - surface
    crate93 - surface
    pallet93 - surface
    crate893 - surface
    pallet893 - surface
    crate966 - surface
    pallet966 - surface
    crate811 - surface
    pallet811 - surface
    crate162 - surface
    pallet162 - surface
    crate872 - surface
    pallet872 - surface
    crate286 - surface
    pallet286 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist650 place650 )
    ( available hoist650 )
    ( hoist-at hoist553 place553 )
    ( available hoist553 )
    ( hoist-at hoist205 place205 )
    ( available hoist205 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist221 place221 )
    ( available hoist221 )
    ( hoist-at hoist291 place291 )
    ( available hoist291 )
    ( hoist-at hoist638 place638 )
    ( available hoist638 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist932 place932 )
    ( available hoist932 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist523 place523 )
    ( available hoist523 )
    ( hoist-at hoist302 place302 )
    ( available hoist302 )
    ( hoist-at hoist599 place599 )
    ( available hoist599 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist729 place729 )
    ( available hoist729 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet740 place302 )
    ( surface-at crate740 place302 )
    ( on crate740 pallet740 )
    ( is-crate crate740 )
    ( clear crate740 )
    ( surface-at pallet785 place302 )
    ( surface-at crate785 place302 )
    ( on crate785 pallet785 )
    ( is-crate crate785 )
    ( clear crate785 )
    ( surface-at pallet854 place915 )
    ( surface-at crate854 place915 )
    ( on crate854 pallet854 )
    ( is-crate crate854 )
    ( clear crate854 )
    ( surface-at pallet946 place523 )
    ( surface-at crate946 place523 )
    ( on crate946 pallet946 )
    ( is-crate crate946 )
    ( clear crate946 )
    ( surface-at pallet97 place553 )
    ( surface-at crate97 place553 )
    ( on crate97 pallet97 )
    ( is-crate crate97 )
    ( clear crate97 )
    ( surface-at pallet828 place932 )
    ( surface-at crate828 place932 )
    ( on crate828 pallet828 )
    ( is-crate crate828 )
    ( clear crate828 )
    ( surface-at pallet9 place553 )
    ( surface-at crate9 place553 )
    ( on crate9 pallet9 )
    ( is-crate crate9 )
    ( clear crate9 )
    ( surface-at pallet769 place650 )
    ( surface-at crate769 place650 )
    ( on crate769 pallet769 )
    ( is-crate crate769 )
    ( clear crate769 )
    ( surface-at pallet711 place205 )
    ( surface-at crate711 place205 )
    ( on crate711 pallet711 )
    ( is-crate crate711 )
    ( clear crate711 )
    ( surface-at pallet93 place814 )
    ( surface-at crate93 place814 )
    ( on crate93 pallet93 )
    ( is-crate crate93 )
    ( clear crate93 )
    ( surface-at pallet893 place814 )
    ( surface-at crate893 place814 )
    ( on crate893 pallet893 )
    ( is-crate crate893 )
    ( clear crate893 )
    ( surface-at pallet966 place599 )
    ( surface-at crate966 place599 )
    ( on crate966 pallet966 )
    ( is-crate crate966 )
    ( clear crate966 )
    ( surface-at pallet811 place205 )
    ( surface-at crate811 place205 )
    ( on crate811 pallet811 )
    ( is-crate crate811 )
    ( clear crate811 )
    ( surface-at pallet162 place638 )
    ( surface-at crate162 place638 )
    ( on crate162 pallet162 )
    ( is-crate crate162 )
    ( clear crate162 )
    ( surface-at pallet872 place221 )
    ( surface-at crate872 place221 )
    ( on crate872 pallet872 )
    ( is-crate crate872 )
    ( clear crate872 )
    ( surface-at pallet286 place553 )
    ( surface-at crate286 place553 )
    ( on crate286 pallet286 )
    ( is-crate crate286 )
    ( clear crate286 )
  )
  ( :tasks
    ( Make-On crate740 pallet0 )    ( Make-On crate785 crate740 )    ( Make-On crate854 crate785 )    ( Make-On crate946 crate854 )    ( Make-On crate97 crate946 )    ( Make-On crate828 crate97 )    ( Make-On crate9 crate828 )    ( Make-On crate769 crate9 )    ( Make-On crate711 crate769 )    ( Make-On crate93 crate711 )    ( Make-On crate893 crate93 )    ( Make-On crate966 crate893 )    ( Make-On crate811 crate966 )    ( Make-On crate162 crate811 )    ( Make-On crate872 crate162 )    ( Make-On crate286 crate872 )  )
)
