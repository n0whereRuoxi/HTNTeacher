( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place780 - place
    hoist780 - hoist
    place526 - place
    hoist526 - hoist
    place904 - place
    hoist904 - hoist
    place282 - place
    hoist282 - hoist
    place417 - place
    hoist417 - hoist
    place645 - place
    hoist645 - hoist
    place334 - place
    hoist334 - hoist
    place665 - place
    hoist665 - hoist
    place544 - place
    hoist544 - hoist
    place437 - place
    hoist437 - hoist
    place560 - place
    hoist560 - hoist
    place647 - place
    hoist647 - hoist
    place769 - place
    hoist769 - hoist
    place14 - place
    hoist14 - hoist
    place829 - place
    hoist829 - hoist
    place861 - place
    hoist861 - hoist
    place631 - place
    hoist631 - hoist
    place867 - place
    hoist867 - hoist
    place588 - place
    hoist588 - hoist
    place567 - place
    hoist567 - hoist
    place106 - place
    hoist106 - hoist
    place585 - place
    hoist585 - hoist
    place0 - place
    hoist0 - hoist
    crate762 - surface
    pallet762 - surface
    crate133 - surface
    pallet133 - surface
    crate697 - surface
    pallet697 - surface
    crate513 - surface
    pallet513 - surface
    crate973 - surface
    pallet973 - surface
    crate733 - surface
    pallet733 - surface
    crate971 - surface
    pallet971 - surface
    crate459 - surface
    pallet459 - surface
    crate15 - surface
    pallet15 - surface
    crate331 - surface
    pallet331 - surface
    crate735 - surface
    pallet735 - surface
    crate877 - surface
    pallet877 - surface
    crate220 - surface
    pallet220 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist780 place780 )
    ( available hoist780 )
    ( hoist-at hoist526 place526 )
    ( available hoist526 )
    ( hoist-at hoist904 place904 )
    ( available hoist904 )
    ( hoist-at hoist282 place282 )
    ( available hoist282 )
    ( hoist-at hoist417 place417 )
    ( available hoist417 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist334 place334 )
    ( available hoist334 )
    ( hoist-at hoist665 place665 )
    ( available hoist665 )
    ( hoist-at hoist544 place544 )
    ( available hoist544 )
    ( hoist-at hoist437 place437 )
    ( available hoist437 )
    ( hoist-at hoist560 place560 )
    ( available hoist560 )
    ( hoist-at hoist647 place647 )
    ( available hoist647 )
    ( hoist-at hoist769 place769 )
    ( available hoist769 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist829 place829 )
    ( available hoist829 )
    ( hoist-at hoist861 place861 )
    ( available hoist861 )
    ( hoist-at hoist631 place631 )
    ( available hoist631 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist588 place588 )
    ( available hoist588 )
    ( hoist-at hoist567 place567 )
    ( available hoist567 )
    ( hoist-at hoist106 place106 )
    ( available hoist106 )
    ( hoist-at hoist585 place585 )
    ( available hoist585 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet762 place588 )
    ( surface-at crate762 place588 )
    ( on crate762 pallet762 )
    ( is-crate crate762 )
    ( clear crate762 )
    ( surface-at pallet133 place282 )
    ( surface-at crate133 place282 )
    ( on crate133 pallet133 )
    ( is-crate crate133 )
    ( clear crate133 )
    ( surface-at pallet697 place780 )
    ( surface-at crate697 place780 )
    ( on crate697 pallet697 )
    ( is-crate crate697 )
    ( clear crate697 )
    ( surface-at pallet513 place647 )
    ( surface-at crate513 place647 )
    ( on crate513 pallet513 )
    ( is-crate crate513 )
    ( clear crate513 )
    ( surface-at pallet973 place560 )
    ( surface-at crate973 place560 )
    ( on crate973 pallet973 )
    ( is-crate crate973 )
    ( clear crate973 )
    ( surface-at pallet733 place106 )
    ( surface-at crate733 place106 )
    ( on crate733 pallet733 )
    ( is-crate crate733 )
    ( clear crate733 )
    ( surface-at pallet971 place526 )
    ( surface-at crate971 place526 )
    ( on crate971 pallet971 )
    ( is-crate crate971 )
    ( clear crate971 )
    ( surface-at pallet459 place867 )
    ( surface-at crate459 place867 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
    ( surface-at pallet15 place585 )
    ( surface-at crate15 place585 )
    ( on crate15 pallet15 )
    ( is-crate crate15 )
    ( clear crate15 )
    ( surface-at pallet331 place665 )
    ( surface-at crate331 place665 )
    ( on crate331 pallet331 )
    ( is-crate crate331 )
    ( clear crate331 )
    ( surface-at pallet735 place544 )
    ( surface-at crate735 place544 )
    ( on crate735 pallet735 )
    ( is-crate crate735 )
    ( clear crate735 )
    ( surface-at pallet877 place526 )
    ( surface-at crate877 place526 )
    ( on crate877 pallet877 )
    ( is-crate crate877 )
    ( clear crate877 )
    ( surface-at pallet220 place585 )
    ( surface-at crate220 place585 )
    ( on crate220 pallet220 )
    ( is-crate crate220 )
    ( clear crate220 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate762 crate133 crate697 crate513 crate973 crate733 crate971 crate459 crate15 crate331 crate735 crate877 crate220 )
  )
)
