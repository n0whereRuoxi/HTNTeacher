( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place616 - place
    hoist616 - hoist
    place159 - place
    hoist159 - hoist
    place173 - place
    hoist173 - hoist
    place941 - place
    hoist941 - hoist
    place247 - place
    hoist247 - hoist
    place224 - place
    hoist224 - hoist
    place109 - place
    hoist109 - hoist
    place414 - place
    hoist414 - hoist
    place256 - place
    hoist256 - hoist
    place64 - place
    hoist64 - hoist
    place16 - place
    hoist16 - hoist
    place61 - place
    hoist61 - hoist
    place277 - place
    hoist277 - hoist
    place629 - place
    hoist629 - hoist
    place86 - place
    hoist86 - hoist
    place0 - place
    hoist0 - hoist
    crate81 - surface
    pallet81 - surface
    crate552 - surface
    pallet552 - surface
    crate968 - surface
    pallet968 - surface
    crate135 - surface
    pallet135 - surface
    crate546 - surface
    pallet546 - surface
    crate465 - surface
    pallet465 - surface
    crate79 - surface
    pallet79 - surface
    crate673 - surface
    pallet673 - surface
    crate622 - surface
    pallet622 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist616 place616 )
    ( available hoist616 )
    ( hoist-at hoist159 place159 )
    ( available hoist159 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist941 place941 )
    ( available hoist941 )
    ( hoist-at hoist247 place247 )
    ( available hoist247 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist109 place109 )
    ( available hoist109 )
    ( hoist-at hoist414 place414 )
    ( available hoist414 )
    ( hoist-at hoist256 place256 )
    ( available hoist256 )
    ( hoist-at hoist64 place64 )
    ( available hoist64 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist277 place277 )
    ( available hoist277 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet81 place277 )
    ( surface-at crate81 place277 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet552 place629 )
    ( surface-at crate552 place629 )
    ( on crate552 pallet552 )
    ( is-crate crate552 )
    ( clear crate552 )
    ( surface-at pallet968 place109 )
    ( surface-at crate968 place109 )
    ( on crate968 pallet968 )
    ( is-crate crate968 )
    ( clear crate968 )
    ( surface-at pallet135 place224 )
    ( surface-at crate135 place224 )
    ( on crate135 pallet135 )
    ( is-crate crate135 )
    ( clear crate135 )
    ( surface-at pallet546 place16 )
    ( surface-at crate546 place16 )
    ( on crate546 pallet546 )
    ( is-crate crate546 )
    ( clear crate546 )
    ( surface-at pallet465 place629 )
    ( surface-at crate465 place629 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet79 place173 )
    ( surface-at crate79 place173 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet673 place109 )
    ( surface-at crate673 place109 )
    ( on crate673 pallet673 )
    ( is-crate crate673 )
    ( clear crate673 )
    ( surface-at pallet622 place256 )
    ( surface-at crate622 place256 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
  )
  ( :tasks
    ( Make-On crate81 pallet0 )    ( Make-On crate552 crate81 )    ( Make-On crate968 crate552 )    ( Make-On crate135 crate968 )    ( Make-On crate546 crate135 )    ( Make-On crate465 crate546 )    ( Make-On crate79 crate465 )    ( Make-On crate673 crate79 )    ( Make-On crate622 crate673 )  )
)
