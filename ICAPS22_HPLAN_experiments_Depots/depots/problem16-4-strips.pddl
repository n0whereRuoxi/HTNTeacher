( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place626 - place
    hoist626 - hoist
    place558 - place
    hoist558 - hoist
    place163 - place
    hoist163 - hoist
    place378 - place
    hoist378 - hoist
    place583 - place
    hoist583 - hoist
    place269 - place
    hoist269 - hoist
    place293 - place
    hoist293 - hoist
    place331 - place
    hoist331 - hoist
    place239 - place
    hoist239 - hoist
    place211 - place
    hoist211 - hoist
    place645 - place
    hoist645 - hoist
    place764 - place
    hoist764 - hoist
    place542 - place
    hoist542 - hoist
    place62 - place
    hoist62 - hoist
    place60 - place
    hoist60 - hoist
    place641 - place
    hoist641 - hoist
    place499 - place
    hoist499 - hoist
    place977 - place
    hoist977 - hoist
    place0 - place
    hoist0 - hoist
    crate817 - surface
    pallet817 - surface
    crate494 - surface
    pallet494 - surface
    crate957 - surface
    pallet957 - surface
    crate186 - surface
    pallet186 - surface
    crate550 - surface
    pallet550 - surface
    crate496 - surface
    pallet496 - surface
    crate236 - surface
    pallet236 - surface
    crate148 - surface
    pallet148 - surface
    crate763 - surface
    pallet763 - surface
    crate517 - surface
    pallet517 - surface
    crate927 - surface
    pallet927 - surface
    crate578 - surface
    pallet578 - surface
    crate555 - surface
    pallet555 - surface
    crate130 - surface
    pallet130 - surface
    crate998 - surface
    pallet998 - surface
    crate634 - surface
    pallet634 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist626 place626 )
    ( available hoist626 )
    ( hoist-at hoist558 place558 )
    ( available hoist558 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist378 place378 )
    ( available hoist378 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist269 place269 )
    ( available hoist269 )
    ( hoist-at hoist293 place293 )
    ( available hoist293 )
    ( hoist-at hoist331 place331 )
    ( available hoist331 )
    ( hoist-at hoist239 place239 )
    ( available hoist239 )
    ( hoist-at hoist211 place211 )
    ( available hoist211 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist764 place764 )
    ( available hoist764 )
    ( hoist-at hoist542 place542 )
    ( available hoist542 )
    ( hoist-at hoist62 place62 )
    ( available hoist62 )
    ( hoist-at hoist60 place60 )
    ( available hoist60 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist977 place977 )
    ( available hoist977 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet817 place499 )
    ( surface-at crate817 place499 )
    ( on crate817 pallet817 )
    ( is-crate crate817 )
    ( clear crate817 )
    ( surface-at pallet494 place211 )
    ( surface-at crate494 place211 )
    ( on crate494 pallet494 )
    ( is-crate crate494 )
    ( clear crate494 )
    ( surface-at pallet957 place542 )
    ( surface-at crate957 place542 )
    ( on crate957 pallet957 )
    ( is-crate crate957 )
    ( clear crate957 )
    ( surface-at pallet186 place239 )
    ( surface-at crate186 place239 )
    ( on crate186 pallet186 )
    ( is-crate crate186 )
    ( clear crate186 )
    ( surface-at pallet550 place977 )
    ( surface-at crate550 place977 )
    ( on crate550 pallet550 )
    ( is-crate crate550 )
    ( clear crate550 )
    ( surface-at pallet496 place977 )
    ( surface-at crate496 place977 )
    ( on crate496 pallet496 )
    ( is-crate crate496 )
    ( clear crate496 )
    ( surface-at pallet236 place293 )
    ( surface-at crate236 place293 )
    ( on crate236 pallet236 )
    ( is-crate crate236 )
    ( clear crate236 )
    ( surface-at pallet148 place62 )
    ( surface-at crate148 place62 )
    ( on crate148 pallet148 )
    ( is-crate crate148 )
    ( clear crate148 )
    ( surface-at pallet763 place211 )
    ( surface-at crate763 place211 )
    ( on crate763 pallet763 )
    ( is-crate crate763 )
    ( clear crate763 )
    ( surface-at pallet517 place583 )
    ( surface-at crate517 place583 )
    ( on crate517 pallet517 )
    ( is-crate crate517 )
    ( clear crate517 )
    ( surface-at pallet927 place499 )
    ( surface-at crate927 place499 )
    ( on crate927 pallet927 )
    ( is-crate crate927 )
    ( clear crate927 )
    ( surface-at pallet578 place583 )
    ( surface-at crate578 place583 )
    ( on crate578 pallet578 )
    ( is-crate crate578 )
    ( clear crate578 )
    ( surface-at pallet555 place626 )
    ( surface-at crate555 place626 )
    ( on crate555 pallet555 )
    ( is-crate crate555 )
    ( clear crate555 )
    ( surface-at pallet130 place293 )
    ( surface-at crate130 place293 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
    ( surface-at pallet998 place583 )
    ( surface-at crate998 place583 )
    ( on crate998 pallet998 )
    ( is-crate crate998 )
    ( clear crate998 )
    ( surface-at pallet634 place378 )
    ( surface-at crate634 place378 )
    ( on crate634 pallet634 )
    ( is-crate crate634 )
    ( clear crate634 )
  )
  ( :goal
    ( and
    )
  )
)
