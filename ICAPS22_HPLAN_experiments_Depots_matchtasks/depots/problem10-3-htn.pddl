( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place50 - place
    hoist50 - hoist
    place371 - place
    hoist371 - hoist
    place404 - place
    hoist404 - hoist
    place448 - place
    hoist448 - hoist
    place312 - place
    hoist312 - hoist
    place923 - place
    hoist923 - hoist
    place49 - place
    hoist49 - hoist
    place341 - place
    hoist341 - hoist
    place781 - place
    hoist781 - hoist
    place317 - place
    hoist317 - hoist
    place494 - place
    hoist494 - hoist
    place625 - place
    hoist625 - hoist
    place139 - place
    hoist139 - hoist
    place44 - place
    hoist44 - hoist
    place867 - place
    hoist867 - hoist
    place765 - place
    hoist765 - hoist
    place130 - place
    hoist130 - hoist
    place232 - place
    hoist232 - hoist
    place468 - place
    hoist468 - hoist
    place700 - place
    hoist700 - hoist
    place0 - place
    hoist0 - hoist
    crate1 - surface
    pallet1 - surface
    crate325 - surface
    pallet325 - surface
    crate712 - surface
    pallet712 - surface
    crate667 - surface
    pallet667 - surface
    crate992 - surface
    pallet992 - surface
    crate890 - surface
    pallet890 - surface
    crate681 - surface
    pallet681 - surface
    crate76 - surface
    pallet76 - surface
    crate83 - surface
    pallet83 - surface
    crate358 - surface
    pallet358 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist50 place50 )
    ( available hoist50 )
    ( hoist-at hoist371 place371 )
    ( available hoist371 )
    ( hoist-at hoist404 place404 )
    ( available hoist404 )
    ( hoist-at hoist448 place448 )
    ( available hoist448 )
    ( hoist-at hoist312 place312 )
    ( available hoist312 )
    ( hoist-at hoist923 place923 )
    ( available hoist923 )
    ( hoist-at hoist49 place49 )
    ( available hoist49 )
    ( hoist-at hoist341 place341 )
    ( available hoist341 )
    ( hoist-at hoist781 place781 )
    ( available hoist781 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist494 place494 )
    ( available hoist494 )
    ( hoist-at hoist625 place625 )
    ( available hoist625 )
    ( hoist-at hoist139 place139 )
    ( available hoist139 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist765 place765 )
    ( available hoist765 )
    ( hoist-at hoist130 place130 )
    ( available hoist130 )
    ( hoist-at hoist232 place232 )
    ( available hoist232 )
    ( hoist-at hoist468 place468 )
    ( available hoist468 )
    ( hoist-at hoist700 place700 )
    ( available hoist700 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet1 place371 )
    ( surface-at crate1 place371 )
    ( on crate1 pallet1 )
    ( is-crate crate1 )
    ( clear crate1 )
    ( surface-at pallet325 place923 )
    ( surface-at crate325 place923 )
    ( on crate325 pallet325 )
    ( is-crate crate325 )
    ( clear crate325 )
    ( surface-at pallet712 place625 )
    ( surface-at crate712 place625 )
    ( on crate712 pallet712 )
    ( is-crate crate712 )
    ( clear crate712 )
    ( surface-at pallet667 place923 )
    ( surface-at crate667 place923 )
    ( on crate667 pallet667 )
    ( is-crate crate667 )
    ( clear crate667 )
    ( surface-at pallet992 place371 )
    ( surface-at crate992 place371 )
    ( on crate992 pallet992 )
    ( is-crate crate992 )
    ( clear crate992 )
    ( surface-at pallet890 place700 )
    ( surface-at crate890 place700 )
    ( on crate890 pallet890 )
    ( is-crate crate890 )
    ( clear crate890 )
    ( surface-at pallet681 place317 )
    ( surface-at crate681 place317 )
    ( on crate681 pallet681 )
    ( is-crate crate681 )
    ( clear crate681 )
    ( surface-at pallet76 place494 )
    ( surface-at crate76 place494 )
    ( on crate76 pallet76 )
    ( is-crate crate76 )
    ( clear crate76 )
    ( surface-at pallet83 place765 )
    ( surface-at crate83 place765 )
    ( on crate83 pallet83 )
    ( is-crate crate83 )
    ( clear crate83 )
    ( surface-at pallet358 place130 )
    ( surface-at crate358 place130 )
    ( on crate358 pallet358 )
    ( is-crate crate358 )
    ( clear crate358 )
  )
  ( :tasks
    ( Make-10Crate pallet0 crate1 crate325 crate712 crate667 crate992 crate890 crate681 crate76 crate83 crate358 )
  )
)
