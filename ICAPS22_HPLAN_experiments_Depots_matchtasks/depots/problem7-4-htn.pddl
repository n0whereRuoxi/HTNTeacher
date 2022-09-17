( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place769 - place
    hoist769 - hoist
    place603 - place
    hoist603 - hoist
    place918 - place
    hoist918 - hoist
    place874 - place
    hoist874 - hoist
    place340 - place
    hoist340 - hoist
    place168 - place
    hoist168 - hoist
    place503 - place
    hoist503 - hoist
    place958 - place
    hoist958 - hoist
    place328 - place
    hoist328 - hoist
    place257 - place
    hoist257 - hoist
    place750 - place
    hoist750 - hoist
    place808 - place
    hoist808 - hoist
    place412 - place
    hoist412 - hoist
    place669 - place
    hoist669 - hoist
    place0 - place
    hoist0 - hoist
    crate350 - surface
    pallet350 - surface
    crate492 - surface
    pallet492 - surface
    crate602 - surface
    pallet602 - surface
    crate676 - surface
    pallet676 - surface
    crate640 - surface
    pallet640 - surface
    crate745 - surface
    pallet745 - surface
    crate834 - surface
    pallet834 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist769 place769 )
    ( available hoist769 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist918 place918 )
    ( available hoist918 )
    ( hoist-at hoist874 place874 )
    ( available hoist874 )
    ( hoist-at hoist340 place340 )
    ( available hoist340 )
    ( hoist-at hoist168 place168 )
    ( available hoist168 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist958 place958 )
    ( available hoist958 )
    ( hoist-at hoist328 place328 )
    ( available hoist328 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist750 place750 )
    ( available hoist750 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist412 place412 )
    ( available hoist412 )
    ( hoist-at hoist669 place669 )
    ( available hoist669 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet350 place328 )
    ( surface-at crate350 place328 )
    ( on crate350 pallet350 )
    ( is-crate crate350 )
    ( clear crate350 )
    ( surface-at pallet492 place669 )
    ( surface-at crate492 place669 )
    ( on crate492 pallet492 )
    ( is-crate crate492 )
    ( clear crate492 )
    ( surface-at pallet602 place340 )
    ( surface-at crate602 place340 )
    ( on crate602 pallet602 )
    ( is-crate crate602 )
    ( clear crate602 )
    ( surface-at pallet676 place168 )
    ( surface-at crate676 place168 )
    ( on crate676 pallet676 )
    ( is-crate crate676 )
    ( clear crate676 )
    ( surface-at pallet640 place769 )
    ( surface-at crate640 place769 )
    ( on crate640 pallet640 )
    ( is-crate crate640 )
    ( clear crate640 )
    ( surface-at pallet745 place808 )
    ( surface-at crate745 place808 )
    ( on crate745 pallet745 )
    ( is-crate crate745 )
    ( clear crate745 )
    ( surface-at pallet834 place257 )
    ( surface-at crate834 place257 )
    ( on crate834 pallet834 )
    ( is-crate crate834 )
    ( clear crate834 )
  )
  ( :tasks
    ( Make-7Crate pallet0 crate350 crate492 crate602 crate676 crate640 crate745 crate834 )
  )
)
