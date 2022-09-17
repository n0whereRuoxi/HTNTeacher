( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place804 - place
    hoist804 - hoist
    place633 - place
    hoist633 - hoist
    place666 - place
    hoist666 - hoist
    place560 - place
    hoist560 - hoist
    place351 - place
    hoist351 - hoist
    place721 - place
    hoist721 - hoist
    place586 - place
    hoist586 - hoist
    place293 - place
    hoist293 - hoist
    place513 - place
    hoist513 - hoist
    place751 - place
    hoist751 - hoist
    place44 - place
    hoist44 - hoist
    place968 - place
    hoist968 - hoist
    place75 - place
    hoist75 - hoist
    place179 - place
    hoist179 - hoist
    place865 - place
    hoist865 - hoist
    place0 - place
    hoist0 - hoist
    crate342 - surface
    pallet342 - surface
    crate259 - surface
    pallet259 - surface
    crate694 - surface
    pallet694 - surface
    crate961 - surface
    pallet961 - surface
    crate86 - surface
    pallet86 - surface
    crate885 - surface
    pallet885 - surface
    crate874 - surface
    pallet874 - surface
    crate746 - surface
    pallet746 - surface
    crate283 - surface
    pallet283 - surface
    crate803 - surface
    pallet803 - surface
    crate955 - surface
    pallet955 - surface
    crate960 - surface
    pallet960 - surface
    crate867 - surface
    pallet867 - surface
    crate608 - surface
    pallet608 - surface
    crate177 - surface
    pallet177 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist804 place804 )
    ( available hoist804 )
    ( hoist-at hoist633 place633 )
    ( available hoist633 )
    ( hoist-at hoist666 place666 )
    ( available hoist666 )
    ( hoist-at hoist560 place560 )
    ( available hoist560 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist721 place721 )
    ( available hoist721 )
    ( hoist-at hoist586 place586 )
    ( available hoist586 )
    ( hoist-at hoist293 place293 )
    ( available hoist293 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist179 place179 )
    ( available hoist179 )
    ( hoist-at hoist865 place865 )
    ( available hoist865 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet342 place44 )
    ( surface-at crate342 place44 )
    ( on crate342 pallet342 )
    ( is-crate crate342 )
    ( clear crate342 )
    ( surface-at pallet259 place75 )
    ( surface-at crate259 place75 )
    ( on crate259 pallet259 )
    ( is-crate crate259 )
    ( clear crate259 )
    ( surface-at pallet694 place75 )
    ( surface-at crate694 place75 )
    ( on crate694 pallet694 )
    ( is-crate crate694 )
    ( clear crate694 )
    ( surface-at pallet961 place179 )
    ( surface-at crate961 place179 )
    ( on crate961 pallet961 )
    ( is-crate crate961 )
    ( clear crate961 )
    ( surface-at pallet86 place865 )
    ( surface-at crate86 place865 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet885 place179 )
    ( surface-at crate885 place179 )
    ( on crate885 pallet885 )
    ( is-crate crate885 )
    ( clear crate885 )
    ( surface-at pallet874 place666 )
    ( surface-at crate874 place666 )
    ( on crate874 pallet874 )
    ( is-crate crate874 )
    ( clear crate874 )
    ( surface-at pallet746 place513 )
    ( surface-at crate746 place513 )
    ( on crate746 pallet746 )
    ( is-crate crate746 )
    ( clear crate746 )
    ( surface-at pallet283 place351 )
    ( surface-at crate283 place351 )
    ( on crate283 pallet283 )
    ( is-crate crate283 )
    ( clear crate283 )
    ( surface-at pallet803 place293 )
    ( surface-at crate803 place293 )
    ( on crate803 pallet803 )
    ( is-crate crate803 )
    ( clear crate803 )
    ( surface-at pallet955 place804 )
    ( surface-at crate955 place804 )
    ( on crate955 pallet955 )
    ( is-crate crate955 )
    ( clear crate955 )
    ( surface-at pallet960 place513 )
    ( surface-at crate960 place513 )
    ( on crate960 pallet960 )
    ( is-crate crate960 )
    ( clear crate960 )
    ( surface-at pallet867 place513 )
    ( surface-at crate867 place513 )
    ( on crate867 pallet867 )
    ( is-crate crate867 )
    ( clear crate867 )
    ( surface-at pallet608 place560 )
    ( surface-at crate608 place560 )
    ( on crate608 pallet608 )
    ( is-crate crate608 )
    ( clear crate608 )
    ( surface-at pallet177 place351 )
    ( surface-at crate177 place351 )
    ( on crate177 pallet177 )
    ( is-crate crate177 )
    ( clear crate177 )
  )
  ( :tasks
    ( Make-15Crate pallet0 crate342 crate259 crate694 crate961 crate86 crate885 crate874 crate746 crate283 crate803 crate955 crate960 crate867 crate608 crate177 )
  )
)
