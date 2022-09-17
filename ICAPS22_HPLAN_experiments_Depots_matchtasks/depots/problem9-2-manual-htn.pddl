( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place122 - place
    hoist122 - hoist
    place478 - place
    hoist478 - hoist
    place968 - place
    hoist968 - hoist
    place761 - place
    hoist761 - hoist
    place141 - place
    hoist141 - hoist
    place388 - place
    hoist388 - hoist
    place984 - place
    hoist984 - hoist
    place233 - place
    hoist233 - hoist
    place94 - place
    hoist94 - hoist
    place505 - place
    hoist505 - hoist
    place0 - place
    hoist0 - hoist
    crate865 - surface
    pallet865 - surface
    crate408 - surface
    pallet408 - surface
    crate455 - surface
    pallet455 - surface
    crate280 - surface
    pallet280 - surface
    crate350 - surface
    pallet350 - surface
    crate207 - surface
    pallet207 - surface
    crate425 - surface
    pallet425 - surface
    crate562 - surface
    pallet562 - surface
    crate309 - surface
    pallet309 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist478 place478 )
    ( available hoist478 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist761 place761 )
    ( available hoist761 )
    ( hoist-at hoist141 place141 )
    ( available hoist141 )
    ( hoist-at hoist388 place388 )
    ( available hoist388 )
    ( hoist-at hoist984 place984 )
    ( available hoist984 )
    ( hoist-at hoist233 place233 )
    ( available hoist233 )
    ( hoist-at hoist94 place94 )
    ( available hoist94 )
    ( hoist-at hoist505 place505 )
    ( available hoist505 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet865 place505 )
    ( surface-at crate865 place505 )
    ( on crate865 pallet865 )
    ( is-crate crate865 )
    ( clear crate865 )
    ( surface-at pallet408 place233 )
    ( surface-at crate408 place233 )
    ( on crate408 pallet408 )
    ( is-crate crate408 )
    ( clear crate408 )
    ( surface-at pallet455 place478 )
    ( surface-at crate455 place478 )
    ( on crate455 pallet455 )
    ( is-crate crate455 )
    ( clear crate455 )
    ( surface-at pallet280 place505 )
    ( surface-at crate280 place505 )
    ( on crate280 pallet280 )
    ( is-crate crate280 )
    ( clear crate280 )
    ( surface-at pallet350 place761 )
    ( surface-at crate350 place761 )
    ( on crate350 pallet350 )
    ( is-crate crate350 )
    ( clear crate350 )
    ( surface-at pallet207 place505 )
    ( surface-at crate207 place505 )
    ( on crate207 pallet207 )
    ( is-crate crate207 )
    ( clear crate207 )
    ( surface-at pallet425 place233 )
    ( surface-at crate425 place233 )
    ( on crate425 pallet425 )
    ( is-crate crate425 )
    ( clear crate425 )
    ( surface-at pallet562 place968 )
    ( surface-at crate562 place968 )
    ( on crate562 pallet562 )
    ( is-crate crate562 )
    ( clear crate562 )
    ( surface-at pallet309 place984 )
    ( surface-at crate309 place984 )
    ( on crate309 pallet309 )
    ( is-crate crate309 )
    ( clear crate309 )
  )
  ( :tasks
    ( Make-On crate865 pallet0 )    ( Make-On crate408 crate865 )    ( Make-On crate455 crate408 )    ( Make-On crate280 crate455 )    ( Make-On crate350 crate280 )    ( Make-On crate207 crate350 )    ( Make-On crate425 crate207 )    ( Make-On crate562 crate425 )    ( Make-On crate309 crate562 )  )
)
