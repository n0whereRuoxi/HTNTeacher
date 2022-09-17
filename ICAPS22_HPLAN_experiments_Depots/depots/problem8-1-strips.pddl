( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place910 - place
    hoist910 - hoist
    place948 - place
    hoist948 - hoist
    place263 - place
    hoist263 - hoist
    place695 - place
    hoist695 - hoist
    place79 - place
    hoist79 - hoist
    place251 - place
    hoist251 - hoist
    place708 - place
    hoist708 - hoist
    place61 - place
    hoist61 - hoist
    place232 - place
    hoist232 - hoist
    place893 - place
    hoist893 - hoist
    place292 - place
    hoist292 - hoist
    place118 - place
    hoist118 - hoist
    place707 - place
    hoist707 - hoist
    place647 - place
    hoist647 - hoist
    place0 - place
    hoist0 - hoist
    crate863 - surface
    pallet863 - surface
    crate376 - surface
    pallet376 - surface
    crate504 - surface
    pallet504 - surface
    crate570 - surface
    pallet570 - surface
    crate899 - surface
    pallet899 - surface
    crate810 - surface
    pallet810 - surface
    crate940 - surface
    pallet940 - surface
    crate498 - surface
    pallet498 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist910 place910 )
    ( available hoist910 )
    ( hoist-at hoist948 place948 )
    ( available hoist948 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist695 place695 )
    ( available hoist695 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist232 place232 )
    ( available hoist232 )
    ( hoist-at hoist893 place893 )
    ( available hoist893 )
    ( hoist-at hoist292 place292 )
    ( available hoist292 )
    ( hoist-at hoist118 place118 )
    ( available hoist118 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist647 place647 )
    ( available hoist647 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet863 place79 )
    ( surface-at crate863 place79 )
    ( on crate863 pallet863 )
    ( is-crate crate863 )
    ( clear crate863 )
    ( surface-at pallet376 place118 )
    ( surface-at crate376 place118 )
    ( on crate376 pallet376 )
    ( is-crate crate376 )
    ( clear crate376 )
    ( surface-at pallet504 place79 )
    ( surface-at crate504 place79 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet570 place232 )
    ( surface-at crate570 place232 )
    ( on crate570 pallet570 )
    ( is-crate crate570 )
    ( clear crate570 )
    ( surface-at pallet899 place61 )
    ( surface-at crate899 place61 )
    ( on crate899 pallet899 )
    ( is-crate crate899 )
    ( clear crate899 )
    ( surface-at pallet810 place232 )
    ( surface-at crate810 place232 )
    ( on crate810 pallet810 )
    ( is-crate crate810 )
    ( clear crate810 )
    ( surface-at pallet940 place707 )
    ( surface-at crate940 place707 )
    ( on crate940 pallet940 )
    ( is-crate crate940 )
    ( clear crate940 )
    ( surface-at pallet498 place79 )
    ( surface-at crate498 place79 )
    ( on crate498 pallet498 )
    ( is-crate crate498 )
    ( clear crate498 )
  )
  ( :goal
    ( and
    )
  )
)
