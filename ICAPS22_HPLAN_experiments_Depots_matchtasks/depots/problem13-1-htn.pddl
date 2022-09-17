( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place417 - place
    hoist417 - hoist
    place29 - place
    hoist29 - hoist
    place147 - place
    hoist147 - hoist
    place583 - place
    hoist583 - hoist
    place204 - place
    hoist204 - hoist
    place601 - place
    hoist601 - hoist
    place779 - place
    hoist779 - hoist
    place532 - place
    hoist532 - hoist
    place991 - place
    hoist991 - hoist
    place241 - place
    hoist241 - hoist
    place480 - place
    hoist480 - hoist
    place992 - place
    hoist992 - hoist
    place17 - place
    hoist17 - hoist
    place0 - place
    hoist0 - hoist
    crate527 - surface
    pallet527 - surface
    crate889 - surface
    pallet889 - surface
    crate241 - surface
    pallet241 - surface
    crate81 - surface
    pallet81 - surface
    crate916 - surface
    pallet916 - surface
    crate46 - surface
    pallet46 - surface
    crate157 - surface
    pallet157 - surface
    crate292 - surface
    pallet292 - surface
    crate659 - surface
    pallet659 - surface
    crate766 - surface
    pallet766 - surface
    crate793 - surface
    pallet793 - surface
    crate402 - surface
    pallet402 - surface
    crate587 - surface
    pallet587 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist417 place417 )
    ( available hoist417 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist147 place147 )
    ( available hoist147 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist204 place204 )
    ( available hoist204 )
    ( hoist-at hoist601 place601 )
    ( available hoist601 )
    ( hoist-at hoist779 place779 )
    ( available hoist779 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist991 place991 )
    ( available hoist991 )
    ( hoist-at hoist241 place241 )
    ( available hoist241 )
    ( hoist-at hoist480 place480 )
    ( available hoist480 )
    ( hoist-at hoist992 place992 )
    ( available hoist992 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet527 place601 )
    ( surface-at crate527 place601 )
    ( on crate527 pallet527 )
    ( is-crate crate527 )
    ( clear crate527 )
    ( surface-at pallet889 place17 )
    ( surface-at crate889 place17 )
    ( on crate889 pallet889 )
    ( is-crate crate889 )
    ( clear crate889 )
    ( surface-at pallet241 place532 )
    ( surface-at crate241 place532 )
    ( on crate241 pallet241 )
    ( is-crate crate241 )
    ( clear crate241 )
    ( surface-at pallet81 place992 )
    ( surface-at crate81 place992 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet916 place241 )
    ( surface-at crate916 place241 )
    ( on crate916 pallet916 )
    ( is-crate crate916 )
    ( clear crate916 )
    ( surface-at pallet46 place147 )
    ( surface-at crate46 place147 )
    ( on crate46 pallet46 )
    ( is-crate crate46 )
    ( clear crate46 )
    ( surface-at pallet157 place991 )
    ( surface-at crate157 place991 )
    ( on crate157 pallet157 )
    ( is-crate crate157 )
    ( clear crate157 )
    ( surface-at pallet292 place601 )
    ( surface-at crate292 place601 )
    ( on crate292 pallet292 )
    ( is-crate crate292 )
    ( clear crate292 )
    ( surface-at pallet659 place991 )
    ( surface-at crate659 place991 )
    ( on crate659 pallet659 )
    ( is-crate crate659 )
    ( clear crate659 )
    ( surface-at pallet766 place17 )
    ( surface-at crate766 place17 )
    ( on crate766 pallet766 )
    ( is-crate crate766 )
    ( clear crate766 )
    ( surface-at pallet793 place779 )
    ( surface-at crate793 place779 )
    ( on crate793 pallet793 )
    ( is-crate crate793 )
    ( clear crate793 )
    ( surface-at pallet402 place147 )
    ( surface-at crate402 place147 )
    ( on crate402 pallet402 )
    ( is-crate crate402 )
    ( clear crate402 )
    ( surface-at pallet587 place147 )
    ( surface-at crate587 place147 )
    ( on crate587 pallet587 )
    ( is-crate crate587 )
    ( clear crate587 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate527 crate889 crate241 crate81 crate916 crate46 crate157 crate292 crate659 crate766 crate793 crate402 crate587 )
  )
)
