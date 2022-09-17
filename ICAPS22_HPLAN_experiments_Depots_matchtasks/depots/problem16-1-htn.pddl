( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place582 - place
    hoist582 - hoist
    place416 - place
    hoist416 - hoist
    place181 - place
    hoist181 - hoist
    place485 - place
    hoist485 - hoist
    place599 - place
    hoist599 - hoist
    place603 - place
    hoist603 - hoist
    place86 - place
    hoist86 - hoist
    place362 - place
    hoist362 - hoist
    place715 - place
    hoist715 - hoist
    place386 - place
    hoist386 - hoist
    place0 - place
    hoist0 - hoist
    crate732 - surface
    pallet732 - surface
    crate495 - surface
    pallet495 - surface
    crate745 - surface
    pallet745 - surface
    crate76 - surface
    pallet76 - surface
    crate402 - surface
    pallet402 - surface
    crate604 - surface
    pallet604 - surface
    crate337 - surface
    pallet337 - surface
    crate725 - surface
    pallet725 - surface
    crate832 - surface
    pallet832 - surface
    crate807 - surface
    pallet807 - surface
    crate606 - surface
    pallet606 - surface
    crate815 - surface
    pallet815 - surface
    crate228 - surface
    pallet228 - surface
    crate975 - surface
    pallet975 - surface
    crate411 - surface
    pallet411 - surface
    crate773 - surface
    pallet773 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist582 place582 )
    ( available hoist582 )
    ( hoist-at hoist416 place416 )
    ( available hoist416 )
    ( hoist-at hoist181 place181 )
    ( available hoist181 )
    ( hoist-at hoist485 place485 )
    ( available hoist485 )
    ( hoist-at hoist599 place599 )
    ( available hoist599 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist362 place362 )
    ( available hoist362 )
    ( hoist-at hoist715 place715 )
    ( available hoist715 )
    ( hoist-at hoist386 place386 )
    ( available hoist386 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet732 place386 )
    ( surface-at crate732 place386 )
    ( on crate732 pallet732 )
    ( is-crate crate732 )
    ( clear crate732 )
    ( surface-at pallet495 place181 )
    ( surface-at crate495 place181 )
    ( on crate495 pallet495 )
    ( is-crate crate495 )
    ( clear crate495 )
    ( surface-at pallet745 place485 )
    ( surface-at crate745 place485 )
    ( on crate745 pallet745 )
    ( is-crate crate745 )
    ( clear crate745 )
    ( surface-at pallet76 place599 )
    ( surface-at crate76 place599 )
    ( on crate76 pallet76 )
    ( is-crate crate76 )
    ( clear crate76 )
    ( surface-at pallet402 place386 )
    ( surface-at crate402 place386 )
    ( on crate402 pallet402 )
    ( is-crate crate402 )
    ( clear crate402 )
    ( surface-at pallet604 place599 )
    ( surface-at crate604 place599 )
    ( on crate604 pallet604 )
    ( is-crate crate604 )
    ( clear crate604 )
    ( surface-at pallet337 place485 )
    ( surface-at crate337 place485 )
    ( on crate337 pallet337 )
    ( is-crate crate337 )
    ( clear crate337 )
    ( surface-at pallet725 place416 )
    ( surface-at crate725 place416 )
    ( on crate725 pallet725 )
    ( is-crate crate725 )
    ( clear crate725 )
    ( surface-at pallet832 place86 )
    ( surface-at crate832 place86 )
    ( on crate832 pallet832 )
    ( is-crate crate832 )
    ( clear crate832 )
    ( surface-at pallet807 place181 )
    ( surface-at crate807 place181 )
    ( on crate807 pallet807 )
    ( is-crate crate807 )
    ( clear crate807 )
    ( surface-at pallet606 place485 )
    ( surface-at crate606 place485 )
    ( on crate606 pallet606 )
    ( is-crate crate606 )
    ( clear crate606 )
    ( surface-at pallet815 place362 )
    ( surface-at crate815 place362 )
    ( on crate815 pallet815 )
    ( is-crate crate815 )
    ( clear crate815 )
    ( surface-at pallet228 place582 )
    ( surface-at crate228 place582 )
    ( on crate228 pallet228 )
    ( is-crate crate228 )
    ( clear crate228 )
    ( surface-at pallet975 place86 )
    ( surface-at crate975 place86 )
    ( on crate975 pallet975 )
    ( is-crate crate975 )
    ( clear crate975 )
    ( surface-at pallet411 place416 )
    ( surface-at crate411 place416 )
    ( on crate411 pallet411 )
    ( is-crate crate411 )
    ( clear crate411 )
    ( surface-at pallet773 place485 )
    ( surface-at crate773 place485 )
    ( on crate773 pallet773 )
    ( is-crate crate773 )
    ( clear crate773 )
  )
  ( :tasks
    ( Make-16Crate pallet0 crate732 crate495 crate745 crate76 crate402 crate604 crate337 crate725 crate832 crate807 crate606 crate815 crate228 crate975 crate411 crate773 )
  )
)
