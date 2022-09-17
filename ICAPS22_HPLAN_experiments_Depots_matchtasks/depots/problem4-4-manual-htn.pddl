( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place153 - place
    hoist153 - hoist
    place718 - place
    hoist718 - hoist
    place633 - place
    hoist633 - hoist
    place790 - place
    hoist790 - hoist
    place0 - place
    hoist0 - hoist
    crate466 - surface
    pallet466 - surface
    crate874 - surface
    pallet874 - surface
    crate228 - surface
    pallet228 - surface
    crate240 - surface
    pallet240 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist633 place633 )
    ( available hoist633 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet466 place790 )
    ( surface-at crate466 place790 )
    ( on crate466 pallet466 )
    ( is-crate crate466 )
    ( clear crate466 )
    ( surface-at pallet874 place718 )
    ( surface-at crate874 place718 )
    ( on crate874 pallet874 )
    ( is-crate crate874 )
    ( clear crate874 )
    ( surface-at pallet228 place153 )
    ( surface-at crate228 place153 )
    ( on crate228 pallet228 )
    ( is-crate crate228 )
    ( clear crate228 )
    ( surface-at pallet240 place790 )
    ( surface-at crate240 place790 )
    ( on crate240 pallet240 )
    ( is-crate crate240 )
    ( clear crate240 )
  )
  ( :tasks
    ( Make-On crate466 pallet0 )    ( Make-On crate874 crate466 )    ( Make-On crate228 crate874 )    ( Make-On crate240 crate228 )  )
)
