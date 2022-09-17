( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place21 - place
    hoist21 - hoist
    place44 - place
    hoist44 - hoist
    place474 - place
    hoist474 - hoist
    place790 - place
    hoist790 - hoist
    place338 - place
    hoist338 - hoist
    place879 - place
    hoist879 - hoist
    place677 - place
    hoist677 - hoist
    place933 - place
    hoist933 - hoist
    place276 - place
    hoist276 - hoist
    place475 - place
    hoist475 - hoist
    place907 - place
    hoist907 - hoist
    place165 - place
    hoist165 - hoist
    place391 - place
    hoist391 - hoist
    place334 - place
    hoist334 - hoist
    place990 - place
    hoist990 - hoist
    place163 - place
    hoist163 - hoist
    place903 - place
    hoist903 - hoist
    place478 - place
    hoist478 - hoist
    place284 - place
    hoist284 - hoist
    place657 - place
    hoist657 - hoist
    place644 - place
    hoist644 - hoist
    place836 - place
    hoist836 - hoist
    place800 - place
    hoist800 - hoist
    place63 - place
    hoist63 - hoist
    place721 - place
    hoist721 - hoist
    place928 - place
    hoist928 - hoist
    place409 - place
    hoist409 - hoist
    place0 - place
    hoist0 - hoist
    crate470 - surface
    pallet470 - surface
    crate763 - surface
    pallet763 - surface
    crate437 - surface
    pallet437 - surface
    crate524 - surface
    pallet524 - surface
    crate764 - surface
    pallet764 - surface
    crate63 - surface
    pallet63 - surface
    crate618 - surface
    pallet618 - surface
    crate954 - surface
    pallet954 - surface
    crate924 - surface
    pallet924 - surface
    crate557 - surface
    pallet557 - surface
    crate531 - surface
    pallet531 - surface
    crate609 - surface
    pallet609 - surface
    crate48 - surface
    pallet48 - surface
    crate365 - surface
    pallet365 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist21 place21 )
    ( available hoist21 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist474 place474 )
    ( available hoist474 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist338 place338 )
    ( available hoist338 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist677 place677 )
    ( available hoist677 )
    ( hoist-at hoist933 place933 )
    ( available hoist933 )
    ( hoist-at hoist276 place276 )
    ( available hoist276 )
    ( hoist-at hoist475 place475 )
    ( available hoist475 )
    ( hoist-at hoist907 place907 )
    ( available hoist907 )
    ( hoist-at hoist165 place165 )
    ( available hoist165 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist334 place334 )
    ( available hoist334 )
    ( hoist-at hoist990 place990 )
    ( available hoist990 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist903 place903 )
    ( available hoist903 )
    ( hoist-at hoist478 place478 )
    ( available hoist478 )
    ( hoist-at hoist284 place284 )
    ( available hoist284 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist836 place836 )
    ( available hoist836 )
    ( hoist-at hoist800 place800 )
    ( available hoist800 )
    ( hoist-at hoist63 place63 )
    ( available hoist63 )
    ( hoist-at hoist721 place721 )
    ( available hoist721 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist409 place409 )
    ( available hoist409 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet470 place836 )
    ( surface-at crate470 place836 )
    ( on crate470 pallet470 )
    ( is-crate crate470 )
    ( clear crate470 )
    ( surface-at pallet763 place800 )
    ( surface-at crate763 place800 )
    ( on crate763 pallet763 )
    ( is-crate crate763 )
    ( clear crate763 )
    ( surface-at pallet437 place790 )
    ( surface-at crate437 place790 )
    ( on crate437 pallet437 )
    ( is-crate crate437 )
    ( clear crate437 )
    ( surface-at pallet524 place284 )
    ( surface-at crate524 place284 )
    ( on crate524 pallet524 )
    ( is-crate crate524 )
    ( clear crate524 )
    ( surface-at pallet764 place928 )
    ( surface-at crate764 place928 )
    ( on crate764 pallet764 )
    ( is-crate crate764 )
    ( clear crate764 )
    ( surface-at pallet63 place165 )
    ( surface-at crate63 place165 )
    ( on crate63 pallet63 )
    ( is-crate crate63 )
    ( clear crate63 )
    ( surface-at pallet618 place836 )
    ( surface-at crate618 place836 )
    ( on crate618 pallet618 )
    ( is-crate crate618 )
    ( clear crate618 )
    ( surface-at pallet954 place475 )
    ( surface-at crate954 place475 )
    ( on crate954 pallet954 )
    ( is-crate crate954 )
    ( clear crate954 )
    ( surface-at pallet924 place790 )
    ( surface-at crate924 place790 )
    ( on crate924 pallet924 )
    ( is-crate crate924 )
    ( clear crate924 )
    ( surface-at pallet557 place475 )
    ( surface-at crate557 place475 )
    ( on crate557 pallet557 )
    ( is-crate crate557 )
    ( clear crate557 )
    ( surface-at pallet531 place391 )
    ( surface-at crate531 place391 )
    ( on crate531 pallet531 )
    ( is-crate crate531 )
    ( clear crate531 )
    ( surface-at pallet609 place334 )
    ( surface-at crate609 place334 )
    ( on crate609 pallet609 )
    ( is-crate crate609 )
    ( clear crate609 )
    ( surface-at pallet48 place163 )
    ( surface-at crate48 place163 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet365 place284 )
    ( surface-at crate365 place284 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
  )
  ( :tasks
    ( Make-On crate470 pallet0 )    ( Make-On crate763 crate470 )    ( Make-On crate437 crate763 )    ( Make-On crate524 crate437 )    ( Make-On crate764 crate524 )    ( Make-On crate63 crate764 )    ( Make-On crate618 crate63 )    ( Make-On crate954 crate618 )    ( Make-On crate924 crate954 )    ( Make-On crate557 crate924 )    ( Make-On crate531 crate557 )    ( Make-On crate609 crate531 )    ( Make-On crate48 crate609 )    ( Make-On crate365 crate48 )  )
)
