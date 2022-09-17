( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place858 - place
    hoist858 - hoist
    place115 - place
    hoist115 - hoist
    place507 - place
    hoist507 - hoist
    place702 - place
    hoist702 - hoist
    place830 - place
    hoist830 - hoist
    place936 - place
    hoist936 - hoist
    place913 - place
    hoist913 - hoist
    place467 - place
    hoist467 - hoist
    place521 - place
    hoist521 - hoist
    place20 - place
    hoist20 - hoist
    place532 - place
    hoist532 - hoist
    place0 - place
    hoist0 - hoist
    crate518 - surface
    pallet518 - surface
    crate295 - surface
    pallet295 - surface
    crate551 - surface
    pallet551 - surface
    crate657 - surface
    pallet657 - surface
    crate902 - surface
    pallet902 - surface
    crate565 - surface
    pallet565 - surface
    crate245 - surface
    pallet245 - surface
    crate449 - surface
    pallet449 - surface
    crate352 - surface
    pallet352 - surface
    crate781 - surface
    pallet781 - surface
    crate252 - surface
    pallet252 - surface
    crate415 - surface
    pallet415 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist858 place858 )
    ( available hoist858 )
    ( hoist-at hoist115 place115 )
    ( available hoist115 )
    ( hoist-at hoist507 place507 )
    ( available hoist507 )
    ( hoist-at hoist702 place702 )
    ( available hoist702 )
    ( hoist-at hoist830 place830 )
    ( available hoist830 )
    ( hoist-at hoist936 place936 )
    ( available hoist936 )
    ( hoist-at hoist913 place913 )
    ( available hoist913 )
    ( hoist-at hoist467 place467 )
    ( available hoist467 )
    ( hoist-at hoist521 place521 )
    ( available hoist521 )
    ( hoist-at hoist20 place20 )
    ( available hoist20 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet518 place858 )
    ( surface-at crate518 place858 )
    ( on crate518 pallet518 )
    ( is-crate crate518 )
    ( clear crate518 )
    ( surface-at pallet295 place115 )
    ( surface-at crate295 place115 )
    ( on crate295 pallet295 )
    ( is-crate crate295 )
    ( clear crate295 )
    ( surface-at pallet551 place936 )
    ( surface-at crate551 place936 )
    ( on crate551 pallet551 )
    ( is-crate crate551 )
    ( clear crate551 )
    ( surface-at pallet657 place521 )
    ( surface-at crate657 place521 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet902 place936 )
    ( surface-at crate902 place936 )
    ( on crate902 pallet902 )
    ( is-crate crate902 )
    ( clear crate902 )
    ( surface-at pallet565 place467 )
    ( surface-at crate565 place467 )
    ( on crate565 pallet565 )
    ( is-crate crate565 )
    ( clear crate565 )
    ( surface-at pallet245 place115 )
    ( surface-at crate245 place115 )
    ( on crate245 pallet245 )
    ( is-crate crate245 )
    ( clear crate245 )
    ( surface-at pallet449 place20 )
    ( surface-at crate449 place20 )
    ( on crate449 pallet449 )
    ( is-crate crate449 )
    ( clear crate449 )
    ( surface-at pallet352 place521 )
    ( surface-at crate352 place521 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet781 place830 )
    ( surface-at crate781 place830 )
    ( on crate781 pallet781 )
    ( is-crate crate781 )
    ( clear crate781 )
    ( surface-at pallet252 place913 )
    ( surface-at crate252 place913 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet415 place830 )
    ( surface-at crate415 place830 )
    ( on crate415 pallet415 )
    ( is-crate crate415 )
    ( clear crate415 )
  )
  ( :tasks
    ( Make-On crate518 pallet0 )    ( Make-On crate295 crate518 )    ( Make-On crate551 crate295 )    ( Make-On crate657 crate551 )    ( Make-On crate902 crate657 )    ( Make-On crate565 crate902 )    ( Make-On crate245 crate565 )    ( Make-On crate449 crate245 )    ( Make-On crate352 crate449 )    ( Make-On crate781 crate352 )    ( Make-On crate252 crate781 )    ( Make-On crate415 crate252 )  )
)
