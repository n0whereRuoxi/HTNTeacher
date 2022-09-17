( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place434 - place
    hoist434 - hoist
    place179 - place
    hoist179 - hoist
    place288 - place
    hoist288 - hoist
    place892 - place
    hoist892 - hoist
    place846 - place
    hoist846 - hoist
    place784 - place
    hoist784 - hoist
    place662 - place
    hoist662 - hoist
    place405 - place
    hoist405 - hoist
    place893 - place
    hoist893 - hoist
    place477 - place
    hoist477 - hoist
    place2 - place
    hoist2 - hoist
    place894 - place
    hoist894 - hoist
    place0 - place
    hoist0 - hoist
    crate41 - surface
    pallet41 - surface
    crate502 - surface
    pallet502 - surface
    crate302 - surface
    pallet302 - surface
    crate615 - surface
    pallet615 - surface
    crate957 - surface
    pallet957 - surface
    crate489 - surface
    pallet489 - surface
    crate763 - surface
    pallet763 - surface
    crate1 - surface
    pallet1 - surface
    crate81 - surface
    pallet81 - surface
    crate409 - surface
    pallet409 - surface
    crate272 - surface
    pallet272 - surface
    crate45 - surface
    pallet45 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist434 place434 )
    ( available hoist434 )
    ( hoist-at hoist179 place179 )
    ( available hoist179 )
    ( hoist-at hoist288 place288 )
    ( available hoist288 )
    ( hoist-at hoist892 place892 )
    ( available hoist892 )
    ( hoist-at hoist846 place846 )
    ( available hoist846 )
    ( hoist-at hoist784 place784 )
    ( available hoist784 )
    ( hoist-at hoist662 place662 )
    ( available hoist662 )
    ( hoist-at hoist405 place405 )
    ( available hoist405 )
    ( hoist-at hoist893 place893 )
    ( available hoist893 )
    ( hoist-at hoist477 place477 )
    ( available hoist477 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet41 place894 )
    ( surface-at crate41 place894 )
    ( on crate41 pallet41 )
    ( is-crate crate41 )
    ( clear crate41 )
    ( surface-at pallet502 place784 )
    ( surface-at crate502 place784 )
    ( on crate502 pallet502 )
    ( is-crate crate502 )
    ( clear crate502 )
    ( surface-at pallet302 place2 )
    ( surface-at crate302 place2 )
    ( on crate302 pallet302 )
    ( is-crate crate302 )
    ( clear crate302 )
    ( surface-at pallet615 place894 )
    ( surface-at crate615 place894 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
    ( surface-at pallet957 place662 )
    ( surface-at crate957 place662 )
    ( on crate957 pallet957 )
    ( is-crate crate957 )
    ( clear crate957 )
    ( surface-at pallet489 place892 )
    ( surface-at crate489 place892 )
    ( on crate489 pallet489 )
    ( is-crate crate489 )
    ( clear crate489 )
    ( surface-at pallet763 place846 )
    ( surface-at crate763 place846 )
    ( on crate763 pallet763 )
    ( is-crate crate763 )
    ( clear crate763 )
    ( surface-at pallet1 place477 )
    ( surface-at crate1 place477 )
    ( on crate1 pallet1 )
    ( is-crate crate1 )
    ( clear crate1 )
    ( surface-at pallet81 place893 )
    ( surface-at crate81 place893 )
    ( on crate81 pallet81 )
    ( is-crate crate81 )
    ( clear crate81 )
    ( surface-at pallet409 place288 )
    ( surface-at crate409 place288 )
    ( on crate409 pallet409 )
    ( is-crate crate409 )
    ( clear crate409 )
    ( surface-at pallet272 place2 )
    ( surface-at crate272 place2 )
    ( on crate272 pallet272 )
    ( is-crate crate272 )
    ( clear crate272 )
    ( surface-at pallet45 place846 )
    ( surface-at crate45 place846 )
    ( on crate45 pallet45 )
    ( is-crate crate45 )
    ( clear crate45 )
  )
  ( :tasks
    ( Make-12Crate pallet0 crate41 crate502 crate302 crate615 crate957 crate489 crate763 crate1 crate81 crate409 crate272 crate45 )
  )
)
