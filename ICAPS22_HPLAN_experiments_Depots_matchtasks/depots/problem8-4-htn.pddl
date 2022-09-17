( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place418 - place
    hoist418 - hoist
    place803 - place
    hoist803 - hoist
    place508 - place
    hoist508 - hoist
    place539 - place
    hoist539 - hoist
    place35 - place
    hoist35 - hoist
    place250 - place
    hoist250 - hoist
    place680 - place
    hoist680 - hoist
    place326 - place
    hoist326 - hoist
    place0 - place
    hoist0 - hoist
    crate511 - surface
    pallet511 - surface
    crate163 - surface
    pallet163 - surface
    crate96 - surface
    pallet96 - surface
    crate817 - surface
    pallet817 - surface
    crate304 - surface
    pallet304 - surface
    crate516 - surface
    pallet516 - surface
    crate575 - surface
    pallet575 - surface
    crate549 - surface
    pallet549 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist803 place803 )
    ( available hoist803 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist539 place539 )
    ( available hoist539 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist250 place250 )
    ( available hoist250 )
    ( hoist-at hoist680 place680 )
    ( available hoist680 )
    ( hoist-at hoist326 place326 )
    ( available hoist326 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet511 place680 )
    ( surface-at crate511 place680 )
    ( on crate511 pallet511 )
    ( is-crate crate511 )
    ( clear crate511 )
    ( surface-at pallet163 place250 )
    ( surface-at crate163 place250 )
    ( on crate163 pallet163 )
    ( is-crate crate163 )
    ( clear crate163 )
    ( surface-at pallet96 place326 )
    ( surface-at crate96 place326 )
    ( on crate96 pallet96 )
    ( is-crate crate96 )
    ( clear crate96 )
    ( surface-at pallet817 place326 )
    ( surface-at crate817 place326 )
    ( on crate817 pallet817 )
    ( is-crate crate817 )
    ( clear crate817 )
    ( surface-at pallet304 place539 )
    ( surface-at crate304 place539 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
    ( surface-at pallet516 place418 )
    ( surface-at crate516 place418 )
    ( on crate516 pallet516 )
    ( is-crate crate516 )
    ( clear crate516 )
    ( surface-at pallet575 place803 )
    ( surface-at crate575 place803 )
    ( on crate575 pallet575 )
    ( is-crate crate575 )
    ( clear crate575 )
    ( surface-at pallet549 place803 )
    ( surface-at crate549 place803 )
    ( on crate549 pallet549 )
    ( is-crate crate549 )
    ( clear crate549 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate511 crate163 crate96 crate817 crate304 crate516 crate575 crate549 )
  )
)
