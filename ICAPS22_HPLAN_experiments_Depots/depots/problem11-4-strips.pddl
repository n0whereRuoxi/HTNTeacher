( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place556 - place
    hoist556 - hoist
    place267 - place
    hoist267 - hoist
    place626 - place
    hoist626 - hoist
    place868 - place
    hoist868 - hoist
    place924 - place
    hoist924 - hoist
    place749 - place
    hoist749 - hoist
    place588 - place
    hoist588 - hoist
    place831 - place
    hoist831 - hoist
    place995 - place
    hoist995 - hoist
    place0 - place
    hoist0 - hoist
    crate141 - surface
    pallet141 - surface
    crate29 - surface
    pallet29 - surface
    crate974 - surface
    pallet974 - surface
    crate898 - surface
    pallet898 - surface
    crate899 - surface
    pallet899 - surface
    crate181 - surface
    pallet181 - surface
    crate826 - surface
    pallet826 - surface
    crate892 - surface
    pallet892 - surface
    crate484 - surface
    pallet484 - surface
    crate634 - surface
    pallet634 - surface
    crate551 - surface
    pallet551 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist556 place556 )
    ( available hoist556 )
    ( hoist-at hoist267 place267 )
    ( available hoist267 )
    ( hoist-at hoist626 place626 )
    ( available hoist626 )
    ( hoist-at hoist868 place868 )
    ( available hoist868 )
    ( hoist-at hoist924 place924 )
    ( available hoist924 )
    ( hoist-at hoist749 place749 )
    ( available hoist749 )
    ( hoist-at hoist588 place588 )
    ( available hoist588 )
    ( hoist-at hoist831 place831 )
    ( available hoist831 )
    ( hoist-at hoist995 place995 )
    ( available hoist995 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet141 place267 )
    ( surface-at crate141 place267 )
    ( on crate141 pallet141 )
    ( is-crate crate141 )
    ( clear crate141 )
    ( surface-at pallet29 place588 )
    ( surface-at crate29 place588 )
    ( on crate29 pallet29 )
    ( is-crate crate29 )
    ( clear crate29 )
    ( surface-at pallet974 place831 )
    ( surface-at crate974 place831 )
    ( on crate974 pallet974 )
    ( is-crate crate974 )
    ( clear crate974 )
    ( surface-at pallet898 place749 )
    ( surface-at crate898 place749 )
    ( on crate898 pallet898 )
    ( is-crate crate898 )
    ( clear crate898 )
    ( surface-at pallet899 place626 )
    ( surface-at crate899 place626 )
    ( on crate899 pallet899 )
    ( is-crate crate899 )
    ( clear crate899 )
    ( surface-at pallet181 place556 )
    ( surface-at crate181 place556 )
    ( on crate181 pallet181 )
    ( is-crate crate181 )
    ( clear crate181 )
    ( surface-at pallet826 place831 )
    ( surface-at crate826 place831 )
    ( on crate826 pallet826 )
    ( is-crate crate826 )
    ( clear crate826 )
    ( surface-at pallet892 place626 )
    ( surface-at crate892 place626 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet484 place588 )
    ( surface-at crate484 place588 )
    ( on crate484 pallet484 )
    ( is-crate crate484 )
    ( clear crate484 )
    ( surface-at pallet634 place588 )
    ( surface-at crate634 place588 )
    ( on crate634 pallet634 )
    ( is-crate crate634 )
    ( clear crate634 )
    ( surface-at pallet551 place749 )
    ( surface-at crate551 place749 )
    ( on crate551 pallet551 )
    ( is-crate crate551 )
    ( clear crate551 )
  )
  ( :goal
    ( and
    )
  )
)
