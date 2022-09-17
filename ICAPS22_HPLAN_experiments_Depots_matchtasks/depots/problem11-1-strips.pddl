( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place255 - place
    hoist255 - hoist
    place661 - place
    hoist661 - hoist
    place778 - place
    hoist778 - hoist
    place954 - place
    hoist954 - hoist
    place53 - place
    hoist53 - hoist
    place94 - place
    hoist94 - hoist
    place844 - place
    hoist844 - hoist
    place649 - place
    hoist649 - hoist
    place563 - place
    hoist563 - hoist
    place618 - place
    hoist618 - hoist
    place175 - place
    hoist175 - hoist
    place0 - place
    hoist0 - hoist
    crate227 - surface
    pallet227 - surface
    crate51 - surface
    pallet51 - surface
    crate141 - surface
    pallet141 - surface
    crate143 - surface
    pallet143 - surface
    crate613 - surface
    pallet613 - surface
    crate11 - surface
    pallet11 - surface
    crate352 - surface
    pallet352 - surface
    crate70 - surface
    pallet70 - surface
    crate454 - surface
    pallet454 - surface
    crate226 - surface
    pallet226 - surface
    crate394 - surface
    pallet394 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist661 place661 )
    ( available hoist661 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist94 place94 )
    ( available hoist94 )
    ( hoist-at hoist844 place844 )
    ( available hoist844 )
    ( hoist-at hoist649 place649 )
    ( available hoist649 )
    ( hoist-at hoist563 place563 )
    ( available hoist563 )
    ( hoist-at hoist618 place618 )
    ( available hoist618 )
    ( hoist-at hoist175 place175 )
    ( available hoist175 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet227 place618 )
    ( surface-at crate227 place618 )
    ( on crate227 pallet227 )
    ( is-crate crate227 )
    ( clear crate227 )
    ( surface-at pallet51 place563 )
    ( surface-at crate51 place563 )
    ( on crate51 pallet51 )
    ( is-crate crate51 )
    ( clear crate51 )
    ( surface-at pallet141 place563 )
    ( surface-at crate141 place563 )
    ( on crate141 pallet141 )
    ( is-crate crate141 )
    ( clear crate141 )
    ( surface-at pallet143 place563 )
    ( surface-at crate143 place563 )
    ( on crate143 pallet143 )
    ( is-crate crate143 )
    ( clear crate143 )
    ( surface-at pallet613 place954 )
    ( surface-at crate613 place954 )
    ( on crate613 pallet613 )
    ( is-crate crate613 )
    ( clear crate613 )
    ( surface-at pallet11 place778 )
    ( surface-at crate11 place778 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet352 place53 )
    ( surface-at crate352 place53 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet70 place175 )
    ( surface-at crate70 place175 )
    ( on crate70 pallet70 )
    ( is-crate crate70 )
    ( clear crate70 )
    ( surface-at pallet454 place563 )
    ( surface-at crate454 place563 )
    ( on crate454 pallet454 )
    ( is-crate crate454 )
    ( clear crate454 )
    ( surface-at pallet226 place844 )
    ( surface-at crate226 place844 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
    ( surface-at pallet394 place175 )
    ( surface-at crate394 place175 )
    ( on crate394 pallet394 )
    ( is-crate crate394 )
    ( clear crate394 )
  )
  ( :goal
    ( and
    )
  )
)
