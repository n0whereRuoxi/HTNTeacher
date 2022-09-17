( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place653 - place
    hoist653 - hoist
    place203 - place
    hoist203 - hoist
    place737 - place
    hoist737 - hoist
    place245 - place
    hoist245 - hoist
    place554 - place
    hoist554 - hoist
    place215 - place
    hoist215 - hoist
    place617 - place
    hoist617 - hoist
    place406 - place
    hoist406 - hoist
    place67 - place
    hoist67 - hoist
    place616 - place
    hoist616 - hoist
    place472 - place
    hoist472 - hoist
    place501 - place
    hoist501 - hoist
    place692 - place
    hoist692 - hoist
    place699 - place
    hoist699 - hoist
    place308 - place
    hoist308 - hoist
    place115 - place
    hoist115 - hoist
    place641 - place
    hoist641 - hoist
    place872 - place
    hoist872 - hoist
    place650 - place
    hoist650 - hoist
    place613 - place
    hoist613 - hoist
    place0 - place
    hoist0 - hoist
    crate335 - surface
    pallet335 - surface
    crate842 - surface
    pallet842 - surface
    crate215 - surface
    pallet215 - surface
    crate474 - surface
    pallet474 - surface
    crate787 - surface
    pallet787 - surface
    crate327 - surface
    pallet327 - surface
    crate877 - surface
    pallet877 - surface
    crate684 - surface
    pallet684 - surface
    crate749 - surface
    pallet749 - surface
    crate410 - surface
    pallet410 - surface
    crate780 - surface
    pallet780 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist203 place203 )
    ( available hoist203 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist245 place245 )
    ( available hoist245 )
    ( hoist-at hoist554 place554 )
    ( available hoist554 )
    ( hoist-at hoist215 place215 )
    ( available hoist215 )
    ( hoist-at hoist617 place617 )
    ( available hoist617 )
    ( hoist-at hoist406 place406 )
    ( available hoist406 )
    ( hoist-at hoist67 place67 )
    ( available hoist67 )
    ( hoist-at hoist616 place616 )
    ( available hoist616 )
    ( hoist-at hoist472 place472 )
    ( available hoist472 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist692 place692 )
    ( available hoist692 )
    ( hoist-at hoist699 place699 )
    ( available hoist699 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist115 place115 )
    ( available hoist115 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist872 place872 )
    ( available hoist872 )
    ( hoist-at hoist650 place650 )
    ( available hoist650 )
    ( hoist-at hoist613 place613 )
    ( available hoist613 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet335 place737 )
    ( surface-at crate335 place737 )
    ( on crate335 pallet335 )
    ( is-crate crate335 )
    ( clear crate335 )
    ( surface-at pallet842 place472 )
    ( surface-at crate842 place472 )
    ( on crate842 pallet842 )
    ( is-crate crate842 )
    ( clear crate842 )
    ( surface-at pallet215 place501 )
    ( surface-at crate215 place501 )
    ( on crate215 pallet215 )
    ( is-crate crate215 )
    ( clear crate215 )
    ( surface-at pallet474 place406 )
    ( surface-at crate474 place406 )
    ( on crate474 pallet474 )
    ( is-crate crate474 )
    ( clear crate474 )
    ( surface-at pallet787 place472 )
    ( surface-at crate787 place472 )
    ( on crate787 pallet787 )
    ( is-crate crate787 )
    ( clear crate787 )
    ( surface-at pallet327 place650 )
    ( surface-at crate327 place650 )
    ( on crate327 pallet327 )
    ( is-crate crate327 )
    ( clear crate327 )
    ( surface-at pallet877 place692 )
    ( surface-at crate877 place692 )
    ( on crate877 pallet877 )
    ( is-crate crate877 )
    ( clear crate877 )
    ( surface-at pallet684 place872 )
    ( surface-at crate684 place872 )
    ( on crate684 pallet684 )
    ( is-crate crate684 )
    ( clear crate684 )
    ( surface-at pallet749 place617 )
    ( surface-at crate749 place617 )
    ( on crate749 pallet749 )
    ( is-crate crate749 )
    ( clear crate749 )
    ( surface-at pallet410 place613 )
    ( surface-at crate410 place613 )
    ( on crate410 pallet410 )
    ( is-crate crate410 )
    ( clear crate410 )
    ( surface-at pallet780 place650 )
    ( surface-at crate780 place650 )
    ( on crate780 pallet780 )
    ( is-crate crate780 )
    ( clear crate780 )
  )
  ( :tasks
    ( Make-11Crate pallet0 crate335 crate842 crate215 crate474 crate787 crate327 crate877 crate684 crate749 crate410 crate780 )
  )
)
