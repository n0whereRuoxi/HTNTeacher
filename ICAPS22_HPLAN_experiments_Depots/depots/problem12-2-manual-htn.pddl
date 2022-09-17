( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place742 - place
    hoist742 - hoist
    place286 - place
    hoist286 - hoist
    place139 - place
    hoist139 - hoist
    place212 - place
    hoist212 - hoist
    place510 - place
    hoist510 - hoist
    place695 - place
    hoist695 - hoist
    place153 - place
    hoist153 - hoist
    place175 - place
    hoist175 - hoist
    place236 - place
    hoist236 - hoist
    place952 - place
    hoist952 - hoist
    place546 - place
    hoist546 - hoist
    place103 - place
    hoist103 - hoist
    place46 - place
    hoist46 - hoist
    place783 - place
    hoist783 - hoist
    place927 - place
    hoist927 - hoist
    place147 - place
    hoist147 - hoist
    place79 - place
    hoist79 - hoist
    place0 - place
    hoist0 - hoist
    crate799 - surface
    pallet799 - surface
    crate341 - surface
    pallet341 - surface
    crate265 - surface
    pallet265 - surface
    crate581 - surface
    pallet581 - surface
    crate390 - surface
    pallet390 - surface
    crate478 - surface
    pallet478 - surface
    crate68 - surface
    pallet68 - surface
    crate158 - surface
    pallet158 - surface
    crate868 - surface
    pallet868 - surface
    crate440 - surface
    pallet440 - surface
    crate843 - surface
    pallet843 - surface
    crate622 - surface
    pallet622 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist742 place742 )
    ( available hoist742 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist139 place139 )
    ( available hoist139 )
    ( hoist-at hoist212 place212 )
    ( available hoist212 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist175 place175 )
    ( available hoist175 )
    ( hoist-at hoist236 place236 )
    ( available hoist236 )
    ( hoist-at hoist952 place952 )
    ( available hoist952 )
    ( hoist-at hoist546 place546 )
    ( available hoist546 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist46 place46 )
    ( available hoist46 )
    ( hoist-at hoist783 place783 )
    ( available hoist783 )
    ( hoist-at hoist927 place927 )
    ( available hoist927 )
    ( hoist-at hoist147 place147 )
    ( available hoist147 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet799 place212 )
    ( surface-at crate799 place212 )
    ( on crate799 pallet799 )
    ( is-crate crate799 )
    ( clear crate799 )
    ( surface-at pallet341 place79 )
    ( surface-at crate341 place79 )
    ( on crate341 pallet341 )
    ( is-crate crate341 )
    ( clear crate341 )
    ( surface-at pallet265 place783 )
    ( surface-at crate265 place783 )
    ( on crate265 pallet265 )
    ( is-crate crate265 )
    ( clear crate265 )
    ( surface-at pallet581 place952 )
    ( surface-at crate581 place952 )
    ( on crate581 pallet581 )
    ( is-crate crate581 )
    ( clear crate581 )
    ( surface-at pallet390 place927 )
    ( surface-at crate390 place927 )
    ( on crate390 pallet390 )
    ( is-crate crate390 )
    ( clear crate390 )
    ( surface-at pallet478 place927 )
    ( surface-at crate478 place927 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
    ( surface-at pallet68 place147 )
    ( surface-at crate68 place147 )
    ( on crate68 pallet68 )
    ( is-crate crate68 )
    ( clear crate68 )
    ( surface-at pallet158 place695 )
    ( surface-at crate158 place695 )
    ( on crate158 pallet158 )
    ( is-crate crate158 )
    ( clear crate158 )
    ( surface-at pallet868 place46 )
    ( surface-at crate868 place46 )
    ( on crate868 pallet868 )
    ( is-crate crate868 )
    ( clear crate868 )
    ( surface-at pallet440 place952 )
    ( surface-at crate440 place952 )
    ( on crate440 pallet440 )
    ( is-crate crate440 )
    ( clear crate440 )
    ( surface-at pallet843 place46 )
    ( surface-at crate843 place46 )
    ( on crate843 pallet843 )
    ( is-crate crate843 )
    ( clear crate843 )
    ( surface-at pallet622 place212 )
    ( surface-at crate622 place212 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
  )
  ( :tasks
    ( Make-On crate799 pallet0 )    ( Make-On crate341 crate799 )    ( Make-On crate265 crate341 )    ( Make-On crate581 crate265 )    ( Make-On crate390 crate581 )    ( Make-On crate478 crate390 )    ( Make-On crate68 crate478 )    ( Make-On crate158 crate68 )    ( Make-On crate868 crate158 )    ( Make-On crate440 crate868 )    ( Make-On crate843 crate440 )    ( Make-On crate622 crate843 )  )
)
