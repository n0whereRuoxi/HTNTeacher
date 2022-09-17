( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place780 - place
    hoist780 - hoist
    place104 - place
    hoist104 - hoist
    place749 - place
    hoist749 - hoist
    place359 - place
    hoist359 - hoist
    place706 - place
    hoist706 - hoist
    place566 - place
    hoist566 - hoist
    place255 - place
    hoist255 - hoist
    place651 - place
    hoist651 - hoist
    place37 - place
    hoist37 - hoist
    place402 - place
    hoist402 - hoist
    place980 - place
    hoist980 - hoist
    place629 - place
    hoist629 - hoist
    place585 - place
    hoist585 - hoist
    place545 - place
    hoist545 - hoist
    place670 - place
    hoist670 - hoist
    place860 - place
    hoist860 - hoist
    place912 - place
    hoist912 - hoist
    place294 - place
    hoist294 - hoist
    place0 - place
    hoist0 - hoist
    crate614 - surface
    pallet614 - surface
    crate400 - surface
    pallet400 - surface
    crate64 - surface
    pallet64 - surface
    crate892 - surface
    pallet892 - surface
    crate754 - surface
    pallet754 - surface
    crate832 - surface
    pallet832 - surface
    crate92 - surface
    pallet92 - surface
    crate748 - surface
    pallet748 - surface
    crate157 - surface
    pallet157 - surface
    crate151 - surface
    pallet151 - surface
    crate604 - surface
    pallet604 - surface
    crate817 - surface
    pallet817 - surface
    crate405 - surface
    pallet405 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist104 place104 )
    ( available hoist104 )
    ( hoist-at hoist749 place749 )
    ( available hoist749 )
    ( hoist-at hoist359 place359 )
    ( available hoist359 )
    ( hoist-at hoist706 place706 )
    ( available hoist706 )
    ( hoist-at hoist566 place566 )
    ( available hoist566 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist651 place651 )
    ( available hoist651 )
    ( hoist-at hoist37 place37 )
    ( available hoist37 )
    ( hoist-at hoist402 place402 )
    ( available hoist402 )
    ( hoist-at hoist980 place980 )
    ( available hoist980 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist585 place585 )
    ( available hoist585 )
    ( hoist-at hoist545 place545 )
    ( available hoist545 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist294 place294 )
    ( available hoist294 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet614 place545 )
    ( surface-at crate614 place545 )
    ( on crate614 pallet614 )
    ( is-crate crate614 )
    ( clear crate614 )
    ( surface-at pallet400 place104 )
    ( surface-at crate400 place104 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet64 place860 )
    ( surface-at crate64 place860 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet892 place912 )
    ( surface-at crate892 place912 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet754 place749 )
    ( surface-at crate754 place749 )
    ( on crate754 pallet754 )
    ( is-crate crate754 )
    ( clear crate754 )
    ( surface-at pallet832 place402 )
    ( surface-at crate832 place402 )
    ( on crate832 pallet832 )
    ( is-crate crate832 )
    ( clear crate832 )
    ( surface-at pallet92 place860 )
    ( surface-at crate92 place860 )
    ( on crate92 pallet92 )
    ( is-crate crate92 )
    ( clear crate92 )
    ( surface-at pallet748 place651 )
    ( surface-at crate748 place651 )
    ( on crate748 pallet748 )
    ( is-crate crate748 )
    ( clear crate748 )
    ( surface-at pallet157 place651 )
    ( surface-at crate157 place651 )
    ( on crate157 pallet157 )
    ( is-crate crate157 )
    ( clear crate157 )
    ( surface-at pallet151 place780 )
    ( surface-at crate151 place780 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
    ( surface-at pallet604 place294 )
    ( surface-at crate604 place294 )
    ( on crate604 pallet604 )
    ( is-crate crate604 )
    ( clear crate604 )
    ( surface-at pallet817 place629 )
    ( surface-at crate817 place629 )
    ( on crate817 pallet817 )
    ( is-crate crate817 )
    ( clear crate817 )
    ( surface-at pallet405 place629 )
    ( surface-at crate405 place629 )
    ( on crate405 pallet405 )
    ( is-crate crate405 )
    ( clear crate405 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate614 crate400 crate64 crate892 crate754 crate832 crate92 crate748 crate157 crate151 crate604 crate817 crate405 )
  )
)
