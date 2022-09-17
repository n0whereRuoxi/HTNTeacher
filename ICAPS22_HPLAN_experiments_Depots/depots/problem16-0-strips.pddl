( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place161 - place
    hoist161 - hoist
    place327 - place
    hoist327 - hoist
    place964 - place
    hoist964 - hoist
    place996 - place
    hoist996 - hoist
    place725 - place
    hoist725 - hoist
    place259 - place
    hoist259 - hoist
    place255 - place
    hoist255 - hoist
    place879 - place
    hoist879 - hoist
    place723 - place
    hoist723 - hoist
    place5 - place
    hoist5 - hoist
    place265 - place
    hoist265 - hoist
    place642 - place
    hoist642 - hoist
    place54 - place
    hoist54 - hoist
    place79 - place
    hoist79 - hoist
    place999 - place
    hoist999 - hoist
    place856 - place
    hoist856 - hoist
    place714 - place
    hoist714 - hoist
    place0 - place
    hoist0 - hoist
    crate577 - surface
    pallet577 - surface
    crate622 - surface
    pallet622 - surface
    crate361 - surface
    pallet361 - surface
    crate926 - surface
    pallet926 - surface
    crate502 - surface
    pallet502 - surface
    crate273 - surface
    pallet273 - surface
    crate487 - surface
    pallet487 - surface
    crate189 - surface
    pallet189 - surface
    crate261 - surface
    pallet261 - surface
    crate10 - surface
    pallet10 - surface
    crate270 - surface
    pallet270 - surface
    crate145 - surface
    pallet145 - surface
    crate91 - surface
    pallet91 - surface
    crate633 - surface
    pallet633 - surface
    crate6 - surface
    pallet6 - surface
    crate243 - surface
    pallet243 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist161 place161 )
    ( available hoist161 )
    ( hoist-at hoist327 place327 )
    ( available hoist327 )
    ( hoist-at hoist964 place964 )
    ( available hoist964 )
    ( hoist-at hoist996 place996 )
    ( available hoist996 )
    ( hoist-at hoist725 place725 )
    ( available hoist725 )
    ( hoist-at hoist259 place259 )
    ( available hoist259 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist5 place5 )
    ( available hoist5 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist642 place642 )
    ( available hoist642 )
    ( hoist-at hoist54 place54 )
    ( available hoist54 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist999 place999 )
    ( available hoist999 )
    ( hoist-at hoist856 place856 )
    ( available hoist856 )
    ( hoist-at hoist714 place714 )
    ( available hoist714 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet577 place79 )
    ( surface-at crate577 place79 )
    ( on crate577 pallet577 )
    ( is-crate crate577 )
    ( clear crate577 )
    ( surface-at pallet622 place879 )
    ( surface-at crate622 place879 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
    ( surface-at pallet361 place996 )
    ( surface-at crate361 place996 )
    ( on crate361 pallet361 )
    ( is-crate crate361 )
    ( clear crate361 )
    ( surface-at pallet926 place79 )
    ( surface-at crate926 place79 )
    ( on crate926 pallet926 )
    ( is-crate crate926 )
    ( clear crate926 )
    ( surface-at pallet502 place879 )
    ( surface-at crate502 place879 )
    ( on crate502 pallet502 )
    ( is-crate crate502 )
    ( clear crate502 )
    ( surface-at pallet273 place5 )
    ( surface-at crate273 place5 )
    ( on crate273 pallet273 )
    ( is-crate crate273 )
    ( clear crate273 )
    ( surface-at pallet487 place723 )
    ( surface-at crate487 place723 )
    ( on crate487 pallet487 )
    ( is-crate crate487 )
    ( clear crate487 )
    ( surface-at pallet189 place999 )
    ( surface-at crate189 place999 )
    ( on crate189 pallet189 )
    ( is-crate crate189 )
    ( clear crate189 )
    ( surface-at pallet261 place996 )
    ( surface-at crate261 place996 )
    ( on crate261 pallet261 )
    ( is-crate crate261 )
    ( clear crate261 )
    ( surface-at pallet10 place725 )
    ( surface-at crate10 place725 )
    ( on crate10 pallet10 )
    ( is-crate crate10 )
    ( clear crate10 )
    ( surface-at pallet270 place161 )
    ( surface-at crate270 place161 )
    ( on crate270 pallet270 )
    ( is-crate crate270 )
    ( clear crate270 )
    ( surface-at pallet145 place5 )
    ( surface-at crate145 place5 )
    ( on crate145 pallet145 )
    ( is-crate crate145 )
    ( clear crate145 )
    ( surface-at pallet91 place714 )
    ( surface-at crate91 place714 )
    ( on crate91 pallet91 )
    ( is-crate crate91 )
    ( clear crate91 )
    ( surface-at pallet633 place879 )
    ( surface-at crate633 place879 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
    ( surface-at pallet6 place725 )
    ( surface-at crate6 place725 )
    ( on crate6 pallet6 )
    ( is-crate crate6 )
    ( clear crate6 )
    ( surface-at pallet243 place79 )
    ( surface-at crate243 place79 )
    ( on crate243 pallet243 )
    ( is-crate crate243 )
    ( clear crate243 )
  )
  ( :goal
    ( and
    )
  )
)
