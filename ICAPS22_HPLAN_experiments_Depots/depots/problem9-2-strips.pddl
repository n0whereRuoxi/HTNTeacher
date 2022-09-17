( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place104 - place
    hoist104 - hoist
    place384 - place
    hoist384 - hoist
    place915 - place
    hoist915 - hoist
    place847 - place
    hoist847 - hoist
    place791 - place
    hoist791 - hoist
    place224 - place
    hoist224 - hoist
    place270 - place
    hoist270 - hoist
    place854 - place
    hoist854 - hoist
    place821 - place
    hoist821 - hoist
    place371 - place
    hoist371 - hoist
    place240 - place
    hoist240 - hoist
    place958 - place
    hoist958 - hoist
    place43 - place
    hoist43 - hoist
    place0 - place
    hoist0 - hoist
    crate487 - surface
    pallet487 - surface
    crate970 - surface
    pallet970 - surface
    crate117 - surface
    pallet117 - surface
    crate355 - surface
    pallet355 - surface
    crate942 - surface
    pallet942 - surface
    crate480 - surface
    pallet480 - surface
    crate954 - surface
    pallet954 - surface
    crate444 - surface
    pallet444 - surface
    crate953 - surface
    pallet953 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist104 place104 )
    ( available hoist104 )
    ( hoist-at hoist384 place384 )
    ( available hoist384 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist847 place847 )
    ( available hoist847 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist854 place854 )
    ( available hoist854 )
    ( hoist-at hoist821 place821 )
    ( available hoist821 )
    ( hoist-at hoist371 place371 )
    ( available hoist371 )
    ( hoist-at hoist240 place240 )
    ( available hoist240 )
    ( hoist-at hoist958 place958 )
    ( available hoist958 )
    ( hoist-at hoist43 place43 )
    ( available hoist43 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet487 place915 )
    ( surface-at crate487 place915 )
    ( on crate487 pallet487 )
    ( is-crate crate487 )
    ( clear crate487 )
    ( surface-at pallet970 place915 )
    ( surface-at crate970 place915 )
    ( on crate970 pallet970 )
    ( is-crate crate970 )
    ( clear crate970 )
    ( surface-at pallet117 place791 )
    ( surface-at crate117 place791 )
    ( on crate117 pallet117 )
    ( is-crate crate117 )
    ( clear crate117 )
    ( surface-at pallet355 place371 )
    ( surface-at crate355 place371 )
    ( on crate355 pallet355 )
    ( is-crate crate355 )
    ( clear crate355 )
    ( surface-at pallet942 place854 )
    ( surface-at crate942 place854 )
    ( on crate942 pallet942 )
    ( is-crate crate942 )
    ( clear crate942 )
    ( surface-at pallet480 place270 )
    ( surface-at crate480 place270 )
    ( on crate480 pallet480 )
    ( is-crate crate480 )
    ( clear crate480 )
    ( surface-at pallet954 place821 )
    ( surface-at crate954 place821 )
    ( on crate954 pallet954 )
    ( is-crate crate954 )
    ( clear crate954 )
    ( surface-at pallet444 place854 )
    ( surface-at crate444 place854 )
    ( on crate444 pallet444 )
    ( is-crate crate444 )
    ( clear crate444 )
    ( surface-at pallet953 place915 )
    ( surface-at crate953 place915 )
    ( on crate953 pallet953 )
    ( is-crate crate953 )
    ( clear crate953 )
  )
  ( :goal
    ( and
    )
  )
)
