( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place966 - place
    hoist966 - hoist
    place460 - place
    hoist460 - hoist
    place262 - place
    hoist262 - hoist
    place165 - place
    hoist165 - hoist
    place838 - place
    hoist838 - hoist
    place371 - place
    hoist371 - hoist
    place546 - place
    hoist546 - hoist
    place960 - place
    hoist960 - hoist
    place405 - place
    hoist405 - hoist
    place337 - place
    hoist337 - hoist
    place878 - place
    hoist878 - hoist
    place627 - place
    hoist627 - hoist
    place477 - place
    hoist477 - hoist
    place0 - place
    hoist0 - hoist
    crate553 - surface
    pallet553 - surface
    crate743 - surface
    pallet743 - surface
    crate338 - surface
    pallet338 - surface
    crate828 - surface
    pallet828 - surface
    crate480 - surface
    pallet480 - surface
    crate613 - surface
    pallet613 - surface
    crate257 - surface
    pallet257 - surface
    crate511 - surface
    pallet511 - surface
    crate482 - surface
    pallet482 - surface
    crate270 - surface
    pallet270 - surface
    crate94 - surface
    pallet94 - surface
    crate318 - surface
    pallet318 - surface
    crate861 - surface
    pallet861 - surface
    crate320 - surface
    pallet320 - surface
    crate426 - surface
    pallet426 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist966 place966 )
    ( available hoist966 )
    ( hoist-at hoist460 place460 )
    ( available hoist460 )
    ( hoist-at hoist262 place262 )
    ( available hoist262 )
    ( hoist-at hoist165 place165 )
    ( available hoist165 )
    ( hoist-at hoist838 place838 )
    ( available hoist838 )
    ( hoist-at hoist371 place371 )
    ( available hoist371 )
    ( hoist-at hoist546 place546 )
    ( available hoist546 )
    ( hoist-at hoist960 place960 )
    ( available hoist960 )
    ( hoist-at hoist405 place405 )
    ( available hoist405 )
    ( hoist-at hoist337 place337 )
    ( available hoist337 )
    ( hoist-at hoist878 place878 )
    ( available hoist878 )
    ( hoist-at hoist627 place627 )
    ( available hoist627 )
    ( hoist-at hoist477 place477 )
    ( available hoist477 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet553 place966 )
    ( surface-at crate553 place966 )
    ( on crate553 pallet553 )
    ( is-crate crate553 )
    ( clear crate553 )
    ( surface-at pallet743 place960 )
    ( surface-at crate743 place960 )
    ( on crate743 pallet743 )
    ( is-crate crate743 )
    ( clear crate743 )
    ( surface-at pallet338 place262 )
    ( surface-at crate338 place262 )
    ( on crate338 pallet338 )
    ( is-crate crate338 )
    ( clear crate338 )
    ( surface-at pallet828 place405 )
    ( surface-at crate828 place405 )
    ( on crate828 pallet828 )
    ( is-crate crate828 )
    ( clear crate828 )
    ( surface-at pallet480 place966 )
    ( surface-at crate480 place966 )
    ( on crate480 pallet480 )
    ( is-crate crate480 )
    ( clear crate480 )
    ( surface-at pallet613 place165 )
    ( surface-at crate613 place165 )
    ( on crate613 pallet613 )
    ( is-crate crate613 )
    ( clear crate613 )
    ( surface-at pallet257 place627 )
    ( surface-at crate257 place627 )
    ( on crate257 pallet257 )
    ( is-crate crate257 )
    ( clear crate257 )
    ( surface-at pallet511 place546 )
    ( surface-at crate511 place546 )
    ( on crate511 pallet511 )
    ( is-crate crate511 )
    ( clear crate511 )
    ( surface-at pallet482 place371 )
    ( surface-at crate482 place371 )
    ( on crate482 pallet482 )
    ( is-crate crate482 )
    ( clear crate482 )
    ( surface-at pallet270 place966 )
    ( surface-at crate270 place966 )
    ( on crate270 pallet270 )
    ( is-crate crate270 )
    ( clear crate270 )
    ( surface-at pallet94 place337 )
    ( surface-at crate94 place337 )
    ( on crate94 pallet94 )
    ( is-crate crate94 )
    ( clear crate94 )
    ( surface-at pallet318 place960 )
    ( surface-at crate318 place960 )
    ( on crate318 pallet318 )
    ( is-crate crate318 )
    ( clear crate318 )
    ( surface-at pallet861 place405 )
    ( surface-at crate861 place405 )
    ( on crate861 pallet861 )
    ( is-crate crate861 )
    ( clear crate861 )
    ( surface-at pallet320 place878 )
    ( surface-at crate320 place878 )
    ( on crate320 pallet320 )
    ( is-crate crate320 )
    ( clear crate320 )
    ( surface-at pallet426 place966 )
    ( surface-at crate426 place966 )
    ( on crate426 pallet426 )
    ( is-crate crate426 )
    ( clear crate426 )
  )
  ( :tasks
    ( Make-On crate553 pallet0 )    ( Make-On crate743 crate553 )    ( Make-On crate338 crate743 )    ( Make-On crate828 crate338 )    ( Make-On crate480 crate828 )    ( Make-On crate613 crate480 )    ( Make-On crate257 crate613 )    ( Make-On crate511 crate257 )    ( Make-On crate482 crate511 )    ( Make-On crate270 crate482 )    ( Make-On crate94 crate270 )    ( Make-On crate318 crate94 )    ( Make-On crate861 crate318 )    ( Make-On crate320 crate861 )    ( Make-On crate426 crate320 )  )
)
