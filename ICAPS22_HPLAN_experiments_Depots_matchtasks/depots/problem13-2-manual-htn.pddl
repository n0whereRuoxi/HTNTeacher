( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place228 - place
    hoist228 - hoist
    place292 - place
    hoist292 - hoist
    place652 - place
    hoist652 - hoist
    place908 - place
    hoist908 - hoist
    place47 - place
    hoist47 - hoist
    place399 - place
    hoist399 - hoist
    place488 - place
    hoist488 - hoist
    place35 - place
    hoist35 - hoist
    place17 - place
    hoist17 - hoist
    place252 - place
    hoist252 - hoist
    place323 - place
    hoist323 - hoist
    place440 - place
    hoist440 - hoist
    place653 - place
    hoist653 - hoist
    place0 - place
    hoist0 - hoist
    crate277 - surface
    pallet277 - surface
    crate230 - surface
    pallet230 - surface
    crate355 - surface
    pallet355 - surface
    crate595 - surface
    pallet595 - surface
    crate856 - surface
    pallet856 - surface
    crate362 - surface
    pallet362 - surface
    crate744 - surface
    pallet744 - surface
    crate516 - surface
    pallet516 - surface
    crate7 - surface
    pallet7 - surface
    crate388 - surface
    pallet388 - surface
    crate340 - surface
    pallet340 - surface
    crate678 - surface
    pallet678 - surface
    crate488 - surface
    pallet488 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist228 place228 )
    ( available hoist228 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist652 place652 )
    ( available hoist652 )
    ( hoist-at hoist908 place908 )
    ( available hoist908 )
    ( hoist-at hoist47 place47 )
    ( available hoist47 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist488 place488 )
    ( available hoist488 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist252 place252 )
    ( available hoist252 )
    ( hoist-at hoist323 place323 )
    ( available hoist323 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet277 place35 )
    ( surface-at crate277 place35 )
    ( on crate277 pallet277 )
    ( is-crate crate277 )
    ( clear crate277 )
    ( surface-at pallet230 place399 )
    ( surface-at crate230 place399 )
    ( on crate230 pallet230 )
    ( is-crate crate230 )
    ( clear crate230 )
    ( surface-at pallet355 place323 )
    ( surface-at crate355 place323 )
    ( on crate355 pallet355 )
    ( is-crate crate355 )
    ( clear crate355 )
    ( surface-at pallet595 place652 )
    ( surface-at crate595 place652 )
    ( on crate595 pallet595 )
    ( is-crate crate595 )
    ( clear crate595 )
    ( surface-at pallet856 place35 )
    ( surface-at crate856 place35 )
    ( on crate856 pallet856 )
    ( is-crate crate856 )
    ( clear crate856 )
    ( surface-at pallet362 place292 )
    ( surface-at crate362 place292 )
    ( on crate362 pallet362 )
    ( is-crate crate362 )
    ( clear crate362 )
    ( surface-at pallet744 place323 )
    ( surface-at crate744 place323 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet516 place47 )
    ( surface-at crate516 place47 )
    ( on crate516 pallet516 )
    ( is-crate crate516 )
    ( clear crate516 )
    ( surface-at pallet7 place35 )
    ( surface-at crate7 place35 )
    ( on crate7 pallet7 )
    ( is-crate crate7 )
    ( clear crate7 )
    ( surface-at pallet388 place17 )
    ( surface-at crate388 place17 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet340 place228 )
    ( surface-at crate340 place228 )
    ( on crate340 pallet340 )
    ( is-crate crate340 )
    ( clear crate340 )
    ( surface-at pallet678 place35 )
    ( surface-at crate678 place35 )
    ( on crate678 pallet678 )
    ( is-crate crate678 )
    ( clear crate678 )
    ( surface-at pallet488 place399 )
    ( surface-at crate488 place399 )
    ( on crate488 pallet488 )
    ( is-crate crate488 )
    ( clear crate488 )
  )
  ( :tasks
    ( Make-On crate277 pallet0 )    ( Make-On crate230 crate277 )    ( Make-On crate355 crate230 )    ( Make-On crate595 crate355 )    ( Make-On crate856 crate595 )    ( Make-On crate362 crate856 )    ( Make-On crate744 crate362 )    ( Make-On crate516 crate744 )    ( Make-On crate7 crate516 )    ( Make-On crate388 crate7 )    ( Make-On crate340 crate388 )    ( Make-On crate678 crate340 )    ( Make-On crate488 crate678 )  )
)
