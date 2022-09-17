( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place147 - place
    hoist147 - hoist
    place736 - place
    hoist736 - hoist
    place879 - place
    hoist879 - hoist
    place892 - place
    hoist892 - hoist
    place682 - place
    hoist682 - hoist
    place983 - place
    hoist983 - hoist
    place501 - place
    hoist501 - hoist
    place695 - place
    hoist695 - hoist
    place420 - place
    hoist420 - hoist
    place744 - place
    hoist744 - hoist
    place380 - place
    hoist380 - hoist
    place723 - place
    hoist723 - hoist
    place973 - place
    hoist973 - hoist
    place190 - place
    hoist190 - hoist
    place532 - place
    hoist532 - hoist
    place602 - place
    hoist602 - hoist
    place193 - place
    hoist193 - hoist
    place818 - place
    hoist818 - hoist
    place699 - place
    hoist699 - hoist
    place192 - place
    hoist192 - hoist
    place96 - place
    hoist96 - hoist
    place546 - place
    hoist546 - hoist
    place88 - place
    hoist88 - hoist
    place862 - place
    hoist862 - hoist
    place629 - place
    hoist629 - hoist
    place0 - place
    hoist0 - hoist
    crate962 - surface
    pallet962 - surface
    crate994 - surface
    pallet994 - surface
    crate298 - surface
    pallet298 - surface
    crate90 - surface
    pallet90 - surface
    crate329 - surface
    pallet329 - surface
    crate433 - surface
    pallet433 - surface
    crate229 - surface
    pallet229 - surface
    crate668 - surface
    pallet668 - surface
    crate959 - surface
    pallet959 - surface
    crate948 - surface
    pallet948 - surface
    crate144 - surface
    pallet144 - surface
    crate63 - surface
    pallet63 - surface
    crate15 - surface
    pallet15 - surface
    crate275 - surface
    pallet275 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist147 place147 )
    ( available hoist147 )
    ( hoist-at hoist736 place736 )
    ( available hoist736 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist892 place892 )
    ( available hoist892 )
    ( hoist-at hoist682 place682 )
    ( available hoist682 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist744 place744 )
    ( available hoist744 )
    ( hoist-at hoist380 place380 )
    ( available hoist380 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist973 place973 )
    ( available hoist973 )
    ( hoist-at hoist190 place190 )
    ( available hoist190 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist602 place602 )
    ( available hoist602 )
    ( hoist-at hoist193 place193 )
    ( available hoist193 )
    ( hoist-at hoist818 place818 )
    ( available hoist818 )
    ( hoist-at hoist699 place699 )
    ( available hoist699 )
    ( hoist-at hoist192 place192 )
    ( available hoist192 )
    ( hoist-at hoist96 place96 )
    ( available hoist96 )
    ( hoist-at hoist546 place546 )
    ( available hoist546 )
    ( hoist-at hoist88 place88 )
    ( available hoist88 )
    ( hoist-at hoist862 place862 )
    ( available hoist862 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet962 place192 )
    ( surface-at crate962 place192 )
    ( on crate962 pallet962 )
    ( is-crate crate962 )
    ( clear crate962 )
    ( surface-at pallet994 place818 )
    ( surface-at crate994 place818 )
    ( on crate994 pallet994 )
    ( is-crate crate994 )
    ( clear crate994 )
    ( surface-at pallet298 place892 )
    ( surface-at crate298 place892 )
    ( on crate298 pallet298 )
    ( is-crate crate298 )
    ( clear crate298 )
    ( surface-at pallet90 place546 )
    ( surface-at crate90 place546 )
    ( on crate90 pallet90 )
    ( is-crate crate90 )
    ( clear crate90 )
    ( surface-at pallet329 place682 )
    ( surface-at crate329 place682 )
    ( on crate329 pallet329 )
    ( is-crate crate329 )
    ( clear crate329 )
    ( surface-at pallet433 place629 )
    ( surface-at crate433 place629 )
    ( on crate433 pallet433 )
    ( is-crate crate433 )
    ( clear crate433 )
    ( surface-at pallet229 place380 )
    ( surface-at crate229 place380 )
    ( on crate229 pallet229 )
    ( is-crate crate229 )
    ( clear crate229 )
    ( surface-at pallet668 place682 )
    ( surface-at crate668 place682 )
    ( on crate668 pallet668 )
    ( is-crate crate668 )
    ( clear crate668 )
    ( surface-at pallet959 place380 )
    ( surface-at crate959 place380 )
    ( on crate959 pallet959 )
    ( is-crate crate959 )
    ( clear crate959 )
    ( surface-at pallet948 place744 )
    ( surface-at crate948 place744 )
    ( on crate948 pallet948 )
    ( is-crate crate948 )
    ( clear crate948 )
    ( surface-at pallet144 place88 )
    ( surface-at crate144 place88 )
    ( on crate144 pallet144 )
    ( is-crate crate144 )
    ( clear crate144 )
    ( surface-at pallet63 place420 )
    ( surface-at crate63 place420 )
    ( on crate63 pallet63 )
    ( is-crate crate63 )
    ( clear crate63 )
    ( surface-at pallet15 place420 )
    ( surface-at crate15 place420 )
    ( on crate15 pallet15 )
    ( is-crate crate15 )
    ( clear crate15 )
    ( surface-at pallet275 place699 )
    ( surface-at crate275 place699 )
    ( on crate275 pallet275 )
    ( is-crate crate275 )
    ( clear crate275 )
  )
  ( :goal
    ( and
    )
  )
)
