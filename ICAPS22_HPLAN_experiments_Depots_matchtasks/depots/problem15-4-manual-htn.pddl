( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place528 - place
    hoist528 - hoist
    place262 - place
    hoist262 - hoist
    place561 - place
    hoist561 - hoist
    place686 - place
    hoist686 - hoist
    place544 - place
    hoist544 - hoist
    place78 - place
    hoist78 - hoist
    place292 - place
    hoist292 - hoist
    place336 - place
    hoist336 - hoist
    place38 - place
    hoist38 - hoist
    place595 - place
    hoist595 - hoist
    place578 - place
    hoist578 - hoist
    place365 - place
    hoist365 - hoist
    place229 - place
    hoist229 - hoist
    place190 - place
    hoist190 - hoist
    place185 - place
    hoist185 - hoist
    place325 - place
    hoist325 - hoist
    place793 - place
    hoist793 - hoist
    place0 - place
    hoist0 - hoist
    crate999 - surface
    pallet999 - surface
    crate205 - surface
    pallet205 - surface
    crate220 - surface
    pallet220 - surface
    crate868 - surface
    pallet868 - surface
    crate60 - surface
    pallet60 - surface
    crate986 - surface
    pallet986 - surface
    crate300 - surface
    pallet300 - surface
    crate933 - surface
    pallet933 - surface
    crate590 - surface
    pallet590 - surface
    crate453 - surface
    pallet453 - surface
    crate309 - surface
    pallet309 - surface
    crate620 - surface
    pallet620 - surface
    crate425 - surface
    pallet425 - surface
    crate124 - surface
    pallet124 - surface
    crate853 - surface
    pallet853 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist262 place262 )
    ( available hoist262 )
    ( hoist-at hoist561 place561 )
    ( available hoist561 )
    ( hoist-at hoist686 place686 )
    ( available hoist686 )
    ( hoist-at hoist544 place544 )
    ( available hoist544 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist336 place336 )
    ( available hoist336 )
    ( hoist-at hoist38 place38 )
    ( available hoist38 )
    ( hoist-at hoist595 place595 )
    ( available hoist595 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist365 place365 )
    ( available hoist365 )
    ( hoist-at hoist229 place229 )
    ( available hoist229 )
    ( hoist-at hoist190 place190 )
    ( available hoist190 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist325 place325 )
    ( available hoist325 )
    ( hoist-at hoist793 place793 )
    ( available hoist793 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet999 place229 )
    ( surface-at crate999 place229 )
    ( on crate999 pallet999 )
    ( is-crate crate999 )
    ( clear crate999 )
    ( surface-at pallet205 place595 )
    ( surface-at crate205 place595 )
    ( on crate205 pallet205 )
    ( is-crate crate205 )
    ( clear crate205 )
    ( surface-at pallet220 place185 )
    ( surface-at crate220 place185 )
    ( on crate220 pallet220 )
    ( is-crate crate220 )
    ( clear crate220 )
    ( surface-at pallet868 place336 )
    ( surface-at crate868 place336 )
    ( on crate868 pallet868 )
    ( is-crate crate868 )
    ( clear crate868 )
    ( surface-at pallet60 place262 )
    ( surface-at crate60 place262 )
    ( on crate60 pallet60 )
    ( is-crate crate60 )
    ( clear crate60 )
    ( surface-at pallet986 place561 )
    ( surface-at crate986 place561 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet300 place78 )
    ( surface-at crate300 place78 )
    ( on crate300 pallet300 )
    ( is-crate crate300 )
    ( clear crate300 )
    ( surface-at pallet933 place578 )
    ( surface-at crate933 place578 )
    ( on crate933 pallet933 )
    ( is-crate crate933 )
    ( clear crate933 )
    ( surface-at pallet590 place528 )
    ( surface-at crate590 place528 )
    ( on crate590 pallet590 )
    ( is-crate crate590 )
    ( clear crate590 )
    ( surface-at pallet453 place336 )
    ( surface-at crate453 place336 )
    ( on crate453 pallet453 )
    ( is-crate crate453 )
    ( clear crate453 )
    ( surface-at pallet309 place365 )
    ( surface-at crate309 place365 )
    ( on crate309 pallet309 )
    ( is-crate crate309 )
    ( clear crate309 )
    ( surface-at pallet620 place38 )
    ( surface-at crate620 place38 )
    ( on crate620 pallet620 )
    ( is-crate crate620 )
    ( clear crate620 )
    ( surface-at pallet425 place336 )
    ( surface-at crate425 place336 )
    ( on crate425 pallet425 )
    ( is-crate crate425 )
    ( clear crate425 )
    ( surface-at pallet124 place325 )
    ( surface-at crate124 place325 )
    ( on crate124 pallet124 )
    ( is-crate crate124 )
    ( clear crate124 )
    ( surface-at pallet853 place793 )
    ( surface-at crate853 place793 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
  )
  ( :tasks
    ( Make-On crate999 pallet0 )    ( Make-On crate205 crate999 )    ( Make-On crate220 crate205 )    ( Make-On crate868 crate220 )    ( Make-On crate60 crate868 )    ( Make-On crate986 crate60 )    ( Make-On crate300 crate986 )    ( Make-On crate933 crate300 )    ( Make-On crate590 crate933 )    ( Make-On crate453 crate590 )    ( Make-On crate309 crate453 )    ( Make-On crate620 crate309 )    ( Make-On crate425 crate620 )    ( Make-On crate124 crate425 )    ( Make-On crate853 crate124 )  )
)
