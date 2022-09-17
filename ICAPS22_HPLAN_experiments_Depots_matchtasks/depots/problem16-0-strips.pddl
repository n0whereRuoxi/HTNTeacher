( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place122 - place
    hoist122 - hoist
    place429 - place
    hoist429 - hoist
    place751 - place
    hoist751 - hoist
    place651 - place
    hoist651 - hoist
    place61 - place
    hoist61 - hoist
    place431 - place
    hoist431 - hoist
    place119 - place
    hoist119 - hoist
    place3 - place
    hoist3 - hoist
    place628 - place
    hoist628 - hoist
    place578 - place
    hoist578 - hoist
    place129 - place
    hoist129 - hoist
    place497 - place
    hoist497 - hoist
    place540 - place
    hoist540 - hoist
    place118 - place
    hoist118 - hoist
    place253 - place
    hoist253 - hoist
    place975 - place
    hoist975 - hoist
    place405 - place
    hoist405 - hoist
    place716 - place
    hoist716 - hoist
    place643 - place
    hoist643 - hoist
    place946 - place
    hoist946 - hoist
    place192 - place
    hoist192 - hoist
    place388 - place
    hoist388 - hoist
    place661 - place
    hoist661 - hoist
    place257 - place
    hoist257 - hoist
    place246 - place
    hoist246 - hoist
    place0 - place
    hoist0 - hoist
    crate792 - surface
    pallet792 - surface
    crate272 - surface
    pallet272 - surface
    crate676 - surface
    pallet676 - surface
    crate273 - surface
    pallet273 - surface
    crate897 - surface
    pallet897 - surface
    crate530 - surface
    pallet530 - surface
    crate621 - surface
    pallet621 - surface
    crate174 - surface
    pallet174 - surface
    crate351 - surface
    pallet351 - surface
    crate390 - surface
    pallet390 - surface
    crate635 - surface
    pallet635 - surface
    crate728 - surface
    pallet728 - surface
    crate438 - surface
    pallet438 - surface
    crate742 - surface
    pallet742 - surface
    crate597 - surface
    pallet597 - surface
    crate862 - surface
    pallet862 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist429 place429 )
    ( available hoist429 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist651 place651 )
    ( available hoist651 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist431 place431 )
    ( available hoist431 )
    ( hoist-at hoist119 place119 )
    ( available hoist119 )
    ( hoist-at hoist3 place3 )
    ( available hoist3 )
    ( hoist-at hoist628 place628 )
    ( available hoist628 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist129 place129 )
    ( available hoist129 )
    ( hoist-at hoist497 place497 )
    ( available hoist497 )
    ( hoist-at hoist540 place540 )
    ( available hoist540 )
    ( hoist-at hoist118 place118 )
    ( available hoist118 )
    ( hoist-at hoist253 place253 )
    ( available hoist253 )
    ( hoist-at hoist975 place975 )
    ( available hoist975 )
    ( hoist-at hoist405 place405 )
    ( available hoist405 )
    ( hoist-at hoist716 place716 )
    ( available hoist716 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist946 place946 )
    ( available hoist946 )
    ( hoist-at hoist192 place192 )
    ( available hoist192 )
    ( hoist-at hoist388 place388 )
    ( available hoist388 )
    ( hoist-at hoist661 place661 )
    ( available hoist661 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist246 place246 )
    ( available hoist246 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet792 place246 )
    ( surface-at crate792 place246 )
    ( on crate792 pallet792 )
    ( is-crate crate792 )
    ( clear crate792 )
    ( surface-at pallet272 place257 )
    ( surface-at crate272 place257 )
    ( on crate272 pallet272 )
    ( is-crate crate272 )
    ( clear crate272 )
    ( surface-at pallet676 place578 )
    ( surface-at crate676 place578 )
    ( on crate676 pallet676 )
    ( is-crate crate676 )
    ( clear crate676 )
    ( surface-at pallet273 place431 )
    ( surface-at crate273 place431 )
    ( on crate273 pallet273 )
    ( is-crate crate273 )
    ( clear crate273 )
    ( surface-at pallet897 place643 )
    ( surface-at crate897 place643 )
    ( on crate897 pallet897 )
    ( is-crate crate897 )
    ( clear crate897 )
    ( surface-at pallet530 place118 )
    ( surface-at crate530 place118 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet621 place751 )
    ( surface-at crate621 place751 )
    ( on crate621 pallet621 )
    ( is-crate crate621 )
    ( clear crate621 )
    ( surface-at pallet174 place751 )
    ( surface-at crate174 place751 )
    ( on crate174 pallet174 )
    ( is-crate crate174 )
    ( clear crate174 )
    ( surface-at pallet351 place540 )
    ( surface-at crate351 place540 )
    ( on crate351 pallet351 )
    ( is-crate crate351 )
    ( clear crate351 )
    ( surface-at pallet390 place192 )
    ( surface-at crate390 place192 )
    ( on crate390 pallet390 )
    ( is-crate crate390 )
    ( clear crate390 )
    ( surface-at pallet635 place661 )
    ( surface-at crate635 place661 )
    ( on crate635 pallet635 )
    ( is-crate crate635 )
    ( clear crate635 )
    ( surface-at pallet728 place405 )
    ( surface-at crate728 place405 )
    ( on crate728 pallet728 )
    ( is-crate crate728 )
    ( clear crate728 )
    ( surface-at pallet438 place946 )
    ( surface-at crate438 place946 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet742 place429 )
    ( surface-at crate742 place429 )
    ( on crate742 pallet742 )
    ( is-crate crate742 )
    ( clear crate742 )
    ( surface-at pallet597 place578 )
    ( surface-at crate597 place578 )
    ( on crate597 pallet597 )
    ( is-crate crate597 )
    ( clear crate597 )
    ( surface-at pallet862 place119 )
    ( surface-at crate862 place119 )
    ( on crate862 pallet862 )
    ( is-crate crate862 )
    ( clear crate862 )
  )
  ( :goal
    ( and
    )
  )
)
