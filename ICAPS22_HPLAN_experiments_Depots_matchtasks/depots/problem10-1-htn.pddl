( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place915 - place
    hoist915 - hoist
    place389 - place
    hoist389 - hoist
    place423 - place
    hoist423 - hoist
    place796 - place
    hoist796 - hoist
    place210 - place
    hoist210 - hoist
    place980 - place
    hoist980 - hoist
    place245 - place
    hoist245 - hoist
    place838 - place
    hoist838 - hoist
    place693 - place
    hoist693 - hoist
    place977 - place
    hoist977 - hoist
    place319 - place
    hoist319 - hoist
    place103 - place
    hoist103 - hoist
    place590 - place
    hoist590 - hoist
    place706 - place
    hoist706 - hoist
    place234 - place
    hoist234 - hoist
    place0 - place
    hoist0 - hoist
    crate325 - surface
    pallet325 - surface
    crate136 - surface
    pallet136 - surface
    crate895 - surface
    pallet895 - surface
    crate928 - surface
    pallet928 - surface
    crate677 - surface
    pallet677 - surface
    crate571 - surface
    pallet571 - surface
    crate873 - surface
    pallet873 - surface
    crate387 - surface
    pallet387 - surface
    crate596 - surface
    pallet596 - surface
    crate656 - surface
    pallet656 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist389 place389 )
    ( available hoist389 )
    ( hoist-at hoist423 place423 )
    ( available hoist423 )
    ( hoist-at hoist796 place796 )
    ( available hoist796 )
    ( hoist-at hoist210 place210 )
    ( available hoist210 )
    ( hoist-at hoist980 place980 )
    ( available hoist980 )
    ( hoist-at hoist245 place245 )
    ( available hoist245 )
    ( hoist-at hoist838 place838 )
    ( available hoist838 )
    ( hoist-at hoist693 place693 )
    ( available hoist693 )
    ( hoist-at hoist977 place977 )
    ( available hoist977 )
    ( hoist-at hoist319 place319 )
    ( available hoist319 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist590 place590 )
    ( available hoist590 )
    ( hoist-at hoist706 place706 )
    ( available hoist706 )
    ( hoist-at hoist234 place234 )
    ( available hoist234 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet325 place838 )
    ( surface-at crate325 place838 )
    ( on crate325 pallet325 )
    ( is-crate crate325 )
    ( clear crate325 )
    ( surface-at pallet136 place590 )
    ( surface-at crate136 place590 )
    ( on crate136 pallet136 )
    ( is-crate crate136 )
    ( clear crate136 )
    ( surface-at pallet895 place103 )
    ( surface-at crate895 place103 )
    ( on crate895 pallet895 )
    ( is-crate crate895 )
    ( clear crate895 )
    ( surface-at pallet928 place915 )
    ( surface-at crate928 place915 )
    ( on crate928 pallet928 )
    ( is-crate crate928 )
    ( clear crate928 )
    ( surface-at pallet677 place977 )
    ( surface-at crate677 place977 )
    ( on crate677 pallet677 )
    ( is-crate crate677 )
    ( clear crate677 )
    ( surface-at pallet571 place103 )
    ( surface-at crate571 place103 )
    ( on crate571 pallet571 )
    ( is-crate crate571 )
    ( clear crate571 )
    ( surface-at pallet873 place319 )
    ( surface-at crate873 place319 )
    ( on crate873 pallet873 )
    ( is-crate crate873 )
    ( clear crate873 )
    ( surface-at pallet387 place319 )
    ( surface-at crate387 place319 )
    ( on crate387 pallet387 )
    ( is-crate crate387 )
    ( clear crate387 )
    ( surface-at pallet596 place423 )
    ( surface-at crate596 place423 )
    ( on crate596 pallet596 )
    ( is-crate crate596 )
    ( clear crate596 )
    ( surface-at pallet656 place980 )
    ( surface-at crate656 place980 )
    ( on crate656 pallet656 )
    ( is-crate crate656 )
    ( clear crate656 )
  )
  ( :tasks
    ( Make-10Crate pallet0 crate325 crate136 crate895 crate928 crate677 crate571 crate873 crate387 crate596 crate656 )
  )
)
