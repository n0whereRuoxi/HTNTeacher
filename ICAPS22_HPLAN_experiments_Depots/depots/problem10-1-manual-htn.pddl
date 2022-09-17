( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place372 - place
    hoist372 - hoist
    place535 - place
    hoist535 - hoist
    place164 - place
    hoist164 - hoist
    place161 - place
    hoist161 - hoist
    place407 - place
    hoist407 - hoist
    place411 - place
    hoist411 - hoist
    place394 - place
    hoist394 - hoist
    place110 - place
    hoist110 - hoist
    place493 - place
    hoist493 - hoist
    place0 - place
    hoist0 - hoist
    crate236 - surface
    pallet236 - surface
    crate54 - surface
    pallet54 - surface
    crate986 - surface
    pallet986 - surface
    crate697 - surface
    pallet697 - surface
    crate85 - surface
    pallet85 - surface
    crate195 - surface
    pallet195 - surface
    crate904 - surface
    pallet904 - surface
    crate583 - surface
    pallet583 - surface
    crate722 - surface
    pallet722 - surface
    crate651 - surface
    pallet651 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist372 place372 )
    ( available hoist372 )
    ( hoist-at hoist535 place535 )
    ( available hoist535 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist161 place161 )
    ( available hoist161 )
    ( hoist-at hoist407 place407 )
    ( available hoist407 )
    ( hoist-at hoist411 place411 )
    ( available hoist411 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist110 place110 )
    ( available hoist110 )
    ( hoist-at hoist493 place493 )
    ( available hoist493 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet236 place161 )
    ( surface-at crate236 place161 )
    ( on crate236 pallet236 )
    ( is-crate crate236 )
    ( clear crate236 )
    ( surface-at pallet54 place394 )
    ( surface-at crate54 place394 )
    ( on crate54 pallet54 )
    ( is-crate crate54 )
    ( clear crate54 )
    ( surface-at pallet986 place493 )
    ( surface-at crate986 place493 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet697 place411 )
    ( surface-at crate697 place411 )
    ( on crate697 pallet697 )
    ( is-crate crate697 )
    ( clear crate697 )
    ( surface-at pallet85 place411 )
    ( surface-at crate85 place411 )
    ( on crate85 pallet85 )
    ( is-crate crate85 )
    ( clear crate85 )
    ( surface-at pallet195 place161 )
    ( surface-at crate195 place161 )
    ( on crate195 pallet195 )
    ( is-crate crate195 )
    ( clear crate195 )
    ( surface-at pallet904 place407 )
    ( surface-at crate904 place407 )
    ( on crate904 pallet904 )
    ( is-crate crate904 )
    ( clear crate904 )
    ( surface-at pallet583 place407 )
    ( surface-at crate583 place407 )
    ( on crate583 pallet583 )
    ( is-crate crate583 )
    ( clear crate583 )
    ( surface-at pallet722 place161 )
    ( surface-at crate722 place161 )
    ( on crate722 pallet722 )
    ( is-crate crate722 )
    ( clear crate722 )
    ( surface-at pallet651 place407 )
    ( surface-at crate651 place407 )
    ( on crate651 pallet651 )
    ( is-crate crate651 )
    ( clear crate651 )
  )
  ( :tasks
    ( Make-On crate236 pallet0 )    ( Make-On crate54 crate236 )    ( Make-On crate986 crate54 )    ( Make-On crate697 crate986 )    ( Make-On crate85 crate697 )    ( Make-On crate195 crate85 )    ( Make-On crate904 crate195 )    ( Make-On crate583 crate904 )    ( Make-On crate722 crate583 )    ( Make-On crate651 crate722 )  )
)
