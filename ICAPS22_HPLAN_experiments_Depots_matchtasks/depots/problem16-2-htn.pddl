( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place359 - place
    hoist359 - hoist
    place320 - place
    hoist320 - hoist
    place704 - place
    hoist704 - hoist
    place493 - place
    hoist493 - hoist
    place711 - place
    hoist711 - hoist
    place904 - place
    hoist904 - hoist
    place909 - place
    hoist909 - hoist
    place227 - place
    hoist227 - hoist
    place528 - place
    hoist528 - hoist
    place676 - place
    hoist676 - hoist
    place814 - place
    hoist814 - hoist
    place874 - place
    hoist874 - hoist
    place69 - place
    hoist69 - hoist
    place270 - place
    hoist270 - hoist
    place709 - place
    hoist709 - hoist
    place212 - place
    hoist212 - hoist
    place471 - place
    hoist471 - hoist
    place934 - place
    hoist934 - hoist
    place232 - place
    hoist232 - hoist
    place600 - place
    hoist600 - hoist
    place277 - place
    hoist277 - hoist
    place549 - place
    hoist549 - hoist
    place84 - place
    hoist84 - hoist
    place98 - place
    hoist98 - hoist
    place0 - place
    hoist0 - hoist
    crate116 - surface
    pallet116 - surface
    crate849 - surface
    pallet849 - surface
    crate357 - surface
    pallet357 - surface
    crate765 - surface
    pallet765 - surface
    crate368 - surface
    pallet368 - surface
    crate863 - surface
    pallet863 - surface
    crate422 - surface
    pallet422 - surface
    crate534 - surface
    pallet534 - surface
    crate137 - surface
    pallet137 - surface
    crate879 - surface
    pallet879 - surface
    crate660 - surface
    pallet660 - surface
    crate221 - surface
    pallet221 - surface
    crate181 - surface
    pallet181 - surface
    crate927 - surface
    pallet927 - surface
    crate998 - surface
    pallet998 - surface
    crate52 - surface
    pallet52 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist359 place359 )
    ( available hoist359 )
    ( hoist-at hoist320 place320 )
    ( available hoist320 )
    ( hoist-at hoist704 place704 )
    ( available hoist704 )
    ( hoist-at hoist493 place493 )
    ( available hoist493 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist904 place904 )
    ( available hoist904 )
    ( hoist-at hoist909 place909 )
    ( available hoist909 )
    ( hoist-at hoist227 place227 )
    ( available hoist227 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist874 place874 )
    ( available hoist874 )
    ( hoist-at hoist69 place69 )
    ( available hoist69 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist709 place709 )
    ( available hoist709 )
    ( hoist-at hoist212 place212 )
    ( available hoist212 )
    ( hoist-at hoist471 place471 )
    ( available hoist471 )
    ( hoist-at hoist934 place934 )
    ( available hoist934 )
    ( hoist-at hoist232 place232 )
    ( available hoist232 )
    ( hoist-at hoist600 place600 )
    ( available hoist600 )
    ( hoist-at hoist277 place277 )
    ( available hoist277 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist84 place84 )
    ( available hoist84 )
    ( hoist-at hoist98 place98 )
    ( available hoist98 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet116 place320 )
    ( surface-at crate116 place320 )
    ( on crate116 pallet116 )
    ( is-crate crate116 )
    ( clear crate116 )
    ( surface-at pallet849 place934 )
    ( surface-at crate849 place934 )
    ( on crate849 pallet849 )
    ( is-crate crate849 )
    ( clear crate849 )
    ( surface-at pallet357 place549 )
    ( surface-at crate357 place549 )
    ( on crate357 pallet357 )
    ( is-crate crate357 )
    ( clear crate357 )
    ( surface-at pallet765 place320 )
    ( surface-at crate765 place320 )
    ( on crate765 pallet765 )
    ( is-crate crate765 )
    ( clear crate765 )
    ( surface-at pallet368 place909 )
    ( surface-at crate368 place909 )
    ( on crate368 pallet368 )
    ( is-crate crate368 )
    ( clear crate368 )
    ( surface-at pallet863 place904 )
    ( surface-at crate863 place904 )
    ( on crate863 pallet863 )
    ( is-crate crate863 )
    ( clear crate863 )
    ( surface-at pallet422 place277 )
    ( surface-at crate422 place277 )
    ( on crate422 pallet422 )
    ( is-crate crate422 )
    ( clear crate422 )
    ( surface-at pallet534 place676 )
    ( surface-at crate534 place676 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet137 place471 )
    ( surface-at crate137 place471 )
    ( on crate137 pallet137 )
    ( is-crate crate137 )
    ( clear crate137 )
    ( surface-at pallet879 place709 )
    ( surface-at crate879 place709 )
    ( on crate879 pallet879 )
    ( is-crate crate879 )
    ( clear crate879 )
    ( surface-at pallet660 place874 )
    ( surface-at crate660 place874 )
    ( on crate660 pallet660 )
    ( is-crate crate660 )
    ( clear crate660 )
    ( surface-at pallet221 place709 )
    ( surface-at crate221 place709 )
    ( on crate221 pallet221 )
    ( is-crate crate221 )
    ( clear crate221 )
    ( surface-at pallet181 place909 )
    ( surface-at crate181 place909 )
    ( on crate181 pallet181 )
    ( is-crate crate181 )
    ( clear crate181 )
    ( surface-at pallet927 place270 )
    ( surface-at crate927 place270 )
    ( on crate927 pallet927 )
    ( is-crate crate927 )
    ( clear crate927 )
    ( surface-at pallet998 place711 )
    ( surface-at crate998 place711 )
    ( on crate998 pallet998 )
    ( is-crate crate998 )
    ( clear crate998 )
    ( surface-at pallet52 place471 )
    ( surface-at crate52 place471 )
    ( on crate52 pallet52 )
    ( is-crate crate52 )
    ( clear crate52 )
  )
  ( :tasks
    ( Make-16Crate pallet0 crate116 crate849 crate357 crate765 crate368 crate863 crate422 crate534 crate137 crate879 crate660 crate221 crate181 crate927 crate998 crate52 )
  )
)
