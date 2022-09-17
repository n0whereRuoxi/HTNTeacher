( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place518 - place
    hoist518 - hoist
    place544 - place
    hoist544 - hoist
    place408 - place
    hoist408 - hoist
    place489 - place
    hoist489 - hoist
    place264 - place
    hoist264 - hoist
    place662 - place
    hoist662 - hoist
    place81 - place
    hoist81 - hoist
    place666 - place
    hoist666 - hoist
    place926 - place
    hoist926 - hoist
    place924 - place
    hoist924 - hoist
    place209 - place
    hoist209 - hoist
    place482 - place
    hoist482 - hoist
    place570 - place
    hoist570 - hoist
    place405 - place
    hoist405 - hoist
    place749 - place
    hoist749 - hoist
    place186 - place
    hoist186 - hoist
    place781 - place
    hoist781 - hoist
    place861 - place
    hoist861 - hoist
    place213 - place
    hoist213 - hoist
    place676 - place
    hoist676 - hoist
    place0 - place
    hoist0 - hoist
    crate761 - surface
    pallet761 - surface
    crate463 - surface
    pallet463 - surface
    crate741 - surface
    pallet741 - surface
    crate656 - surface
    pallet656 - surface
    crate782 - surface
    pallet782 - surface
    crate723 - surface
    pallet723 - surface
    crate628 - surface
    pallet628 - surface
    crate929 - surface
    pallet929 - surface
    crate29 - surface
    pallet29 - surface
    crate387 - surface
    pallet387 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist518 place518 )
    ( available hoist518 )
    ( hoist-at hoist544 place544 )
    ( available hoist544 )
    ( hoist-at hoist408 place408 )
    ( available hoist408 )
    ( hoist-at hoist489 place489 )
    ( available hoist489 )
    ( hoist-at hoist264 place264 )
    ( available hoist264 )
    ( hoist-at hoist662 place662 )
    ( available hoist662 )
    ( hoist-at hoist81 place81 )
    ( available hoist81 )
    ( hoist-at hoist666 place666 )
    ( available hoist666 )
    ( hoist-at hoist926 place926 )
    ( available hoist926 )
    ( hoist-at hoist924 place924 )
    ( available hoist924 )
    ( hoist-at hoist209 place209 )
    ( available hoist209 )
    ( hoist-at hoist482 place482 )
    ( available hoist482 )
    ( hoist-at hoist570 place570 )
    ( available hoist570 )
    ( hoist-at hoist405 place405 )
    ( available hoist405 )
    ( hoist-at hoist749 place749 )
    ( available hoist749 )
    ( hoist-at hoist186 place186 )
    ( available hoist186 )
    ( hoist-at hoist781 place781 )
    ( available hoist781 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist213 place213 )
    ( available hoist213 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet761 place264 )
    ( surface-at crate761 place264 )
    ( on crate761 pallet761 )
    ( is-crate crate761 )
    ( clear crate761 )
    ( surface-at pallet463 place186 )
    ( surface-at crate463 place186 )
    ( on crate463 pallet463 )
    ( is-crate crate463 )
    ( clear crate463 )
    ( surface-at pallet741 place213 )
    ( surface-at crate741 place213 )
    ( on crate741 pallet741 )
    ( is-crate crate741 )
    ( clear crate741 )
    ( surface-at pallet656 place264 )
    ( surface-at crate656 place264 )
    ( on crate656 pallet656 )
    ( is-crate crate656 )
    ( clear crate656 )
    ( surface-at pallet782 place570 )
    ( surface-at crate782 place570 )
    ( on crate782 pallet782 )
    ( is-crate crate782 )
    ( clear crate782 )
    ( surface-at pallet723 place544 )
    ( surface-at crate723 place544 )
    ( on crate723 pallet723 )
    ( is-crate crate723 )
    ( clear crate723 )
    ( surface-at pallet628 place518 )
    ( surface-at crate628 place518 )
    ( on crate628 pallet628 )
    ( is-crate crate628 )
    ( clear crate628 )
    ( surface-at pallet929 place405 )
    ( surface-at crate929 place405 )
    ( on crate929 pallet929 )
    ( is-crate crate929 )
    ( clear crate929 )
    ( surface-at pallet29 place482 )
    ( surface-at crate29 place482 )
    ( on crate29 pallet29 )
    ( is-crate crate29 )
    ( clear crate29 )
    ( surface-at pallet387 place408 )
    ( surface-at crate387 place408 )
    ( on crate387 pallet387 )
    ( is-crate crate387 )
    ( clear crate387 )
  )
  ( :tasks
    ( Make-10Crate pallet0 crate761 crate463 crate741 crate656 crate782 crate723 crate628 crate929 crate29 crate387 )
  )
)
