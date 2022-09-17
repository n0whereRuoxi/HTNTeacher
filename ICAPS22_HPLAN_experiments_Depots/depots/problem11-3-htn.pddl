( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place233 - place
    hoist233 - hoist
    place845 - place
    hoist845 - hoist
    place255 - place
    hoist255 - hoist
    place270 - place
    hoist270 - hoist
    place739 - place
    hoist739 - hoist
    place644 - place
    hoist644 - hoist
    place317 - place
    hoist317 - hoist
    place780 - place
    hoist780 - hoist
    place702 - place
    hoist702 - hoist
    place496 - place
    hoist496 - hoist
    place351 - place
    hoist351 - hoist
    place0 - place
    hoist0 - hoist
    crate379 - surface
    pallet379 - surface
    crate929 - surface
    pallet929 - surface
    crate894 - surface
    pallet894 - surface
    crate90 - surface
    pallet90 - surface
    crate10 - surface
    pallet10 - surface
    crate694 - surface
    pallet694 - surface
    crate520 - surface
    pallet520 - surface
    crate307 - surface
    pallet307 - surface
    crate243 - surface
    pallet243 - surface
    crate194 - surface
    pallet194 - surface
    crate421 - surface
    pallet421 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist233 place233 )
    ( available hoist233 )
    ( hoist-at hoist845 place845 )
    ( available hoist845 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist739 place739 )
    ( available hoist739 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist702 place702 )
    ( available hoist702 )
    ( hoist-at hoist496 place496 )
    ( available hoist496 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet379 place780 )
    ( surface-at crate379 place780 )
    ( on crate379 pallet379 )
    ( is-crate crate379 )
    ( clear crate379 )
    ( surface-at pallet929 place496 )
    ( surface-at crate929 place496 )
    ( on crate929 pallet929 )
    ( is-crate crate929 )
    ( clear crate929 )
    ( surface-at pallet894 place317 )
    ( surface-at crate894 place317 )
    ( on crate894 pallet894 )
    ( is-crate crate894 )
    ( clear crate894 )
    ( surface-at pallet90 place496 )
    ( surface-at crate90 place496 )
    ( on crate90 pallet90 )
    ( is-crate crate90 )
    ( clear crate90 )
    ( surface-at pallet10 place351 )
    ( surface-at crate10 place351 )
    ( on crate10 pallet10 )
    ( is-crate crate10 )
    ( clear crate10 )
    ( surface-at pallet694 place233 )
    ( surface-at crate694 place233 )
    ( on crate694 pallet694 )
    ( is-crate crate694 )
    ( clear crate694 )
    ( surface-at pallet520 place845 )
    ( surface-at crate520 place845 )
    ( on crate520 pallet520 )
    ( is-crate crate520 )
    ( clear crate520 )
    ( surface-at pallet307 place702 )
    ( surface-at crate307 place702 )
    ( on crate307 pallet307 )
    ( is-crate crate307 )
    ( clear crate307 )
    ( surface-at pallet243 place255 )
    ( surface-at crate243 place255 )
    ( on crate243 pallet243 )
    ( is-crate crate243 )
    ( clear crate243 )
    ( surface-at pallet194 place496 )
    ( surface-at crate194 place496 )
    ( on crate194 pallet194 )
    ( is-crate crate194 )
    ( clear crate194 )
    ( surface-at pallet421 place780 )
    ( surface-at crate421 place780 )
    ( on crate421 pallet421 )
    ( is-crate crate421 )
    ( clear crate421 )
  )
  ( :tasks
    ( Make-On crate379 pallet0 )    ( Make-On crate929 crate379 )    ( Make-On crate894 crate929 )    ( Make-On crate90 crate894 )    ( Make-On crate10 crate90 )    ( Make-On crate694 crate10 )    ( Make-On crate520 crate694 )    ( Make-On crate307 crate520 )    ( Make-On crate243 crate307 )    ( Make-On crate194 crate243 )    ( Make-On crate421 crate194 )  )
)
