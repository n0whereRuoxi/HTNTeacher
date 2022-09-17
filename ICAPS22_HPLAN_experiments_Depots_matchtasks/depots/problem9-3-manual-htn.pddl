( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place908 - place
    hoist908 - hoist
    place549 - place
    hoist549 - hoist
    place502 - place
    hoist502 - hoist
    place7 - place
    hoist7 - hoist
    place0 - place
    hoist0 - hoist
    crate580 - surface
    pallet580 - surface
    crate496 - surface
    pallet496 - surface
    crate369 - surface
    pallet369 - surface
    crate252 - surface
    pallet252 - surface
    crate846 - surface
    pallet846 - surface
    crate203 - surface
    pallet203 - surface
    crate118 - surface
    pallet118 - surface
    crate91 - surface
    pallet91 - surface
    crate869 - surface
    pallet869 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist908 place908 )
    ( available hoist908 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist502 place502 )
    ( available hoist502 )
    ( hoist-at hoist7 place7 )
    ( available hoist7 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet580 place908 )
    ( surface-at crate580 place908 )
    ( on crate580 pallet580 )
    ( is-crate crate580 )
    ( clear crate580 )
    ( surface-at pallet496 place908 )
    ( surface-at crate496 place908 )
    ( on crate496 pallet496 )
    ( is-crate crate496 )
    ( clear crate496 )
    ( surface-at pallet369 place908 )
    ( surface-at crate369 place908 )
    ( on crate369 pallet369 )
    ( is-crate crate369 )
    ( clear crate369 )
    ( surface-at pallet252 place502 )
    ( surface-at crate252 place502 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet846 place7 )
    ( surface-at crate846 place7 )
    ( on crate846 pallet846 )
    ( is-crate crate846 )
    ( clear crate846 )
    ( surface-at pallet203 place908 )
    ( surface-at crate203 place908 )
    ( on crate203 pallet203 )
    ( is-crate crate203 )
    ( clear crate203 )
    ( surface-at pallet118 place549 )
    ( surface-at crate118 place549 )
    ( on crate118 pallet118 )
    ( is-crate crate118 )
    ( clear crate118 )
    ( surface-at pallet91 place502 )
    ( surface-at crate91 place502 )
    ( on crate91 pallet91 )
    ( is-crate crate91 )
    ( clear crate91 )
    ( surface-at pallet869 place549 )
    ( surface-at crate869 place549 )
    ( on crate869 pallet869 )
    ( is-crate crate869 )
    ( clear crate869 )
  )
  ( :tasks
    ( Make-On crate580 pallet0 )    ( Make-On crate496 crate580 )    ( Make-On crate369 crate496 )    ( Make-On crate252 crate369 )    ( Make-On crate846 crate252 )    ( Make-On crate203 crate846 )    ( Make-On crate118 crate203 )    ( Make-On crate91 crate118 )    ( Make-On crate869 crate91 )  )
)
