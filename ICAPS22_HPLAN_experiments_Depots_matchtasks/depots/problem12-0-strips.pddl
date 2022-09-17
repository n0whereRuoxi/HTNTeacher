( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place275 - place
    hoist275 - hoist
    place871 - place
    hoist871 - hoist
    place832 - place
    hoist832 - hoist
    place64 - place
    hoist64 - hoist
    place576 - place
    hoist576 - hoist
    place293 - place
    hoist293 - hoist
    place0 - place
    hoist0 - hoist
    crate623 - surface
    pallet623 - surface
    crate859 - surface
    pallet859 - surface
    crate335 - surface
    pallet335 - surface
    crate862 - surface
    pallet862 - surface
    crate840 - surface
    pallet840 - surface
    crate241 - surface
    pallet241 - surface
    crate51 - surface
    pallet51 - surface
    crate125 - surface
    pallet125 - surface
    crate871 - surface
    pallet871 - surface
    crate928 - surface
    pallet928 - surface
    crate258 - surface
    pallet258 - surface
    crate183 - surface
    pallet183 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist275 place275 )
    ( available hoist275 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist832 place832 )
    ( available hoist832 )
    ( hoist-at hoist64 place64 )
    ( available hoist64 )
    ( hoist-at hoist576 place576 )
    ( available hoist576 )
    ( hoist-at hoist293 place293 )
    ( available hoist293 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet623 place275 )
    ( surface-at crate623 place275 )
    ( on crate623 pallet623 )
    ( is-crate crate623 )
    ( clear crate623 )
    ( surface-at pallet859 place293 )
    ( surface-at crate859 place293 )
    ( on crate859 pallet859 )
    ( is-crate crate859 )
    ( clear crate859 )
    ( surface-at pallet335 place293 )
    ( surface-at crate335 place293 )
    ( on crate335 pallet335 )
    ( is-crate crate335 )
    ( clear crate335 )
    ( surface-at pallet862 place576 )
    ( surface-at crate862 place576 )
    ( on crate862 pallet862 )
    ( is-crate crate862 )
    ( clear crate862 )
    ( surface-at pallet840 place293 )
    ( surface-at crate840 place293 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet241 place832 )
    ( surface-at crate241 place832 )
    ( on crate241 pallet241 )
    ( is-crate crate241 )
    ( clear crate241 )
    ( surface-at pallet51 place293 )
    ( surface-at crate51 place293 )
    ( on crate51 pallet51 )
    ( is-crate crate51 )
    ( clear crate51 )
    ( surface-at pallet125 place832 )
    ( surface-at crate125 place832 )
    ( on crate125 pallet125 )
    ( is-crate crate125 )
    ( clear crate125 )
    ( surface-at pallet871 place576 )
    ( surface-at crate871 place576 )
    ( on crate871 pallet871 )
    ( is-crate crate871 )
    ( clear crate871 )
    ( surface-at pallet928 place293 )
    ( surface-at crate928 place293 )
    ( on crate928 pallet928 )
    ( is-crate crate928 )
    ( clear crate928 )
    ( surface-at pallet258 place576 )
    ( surface-at crate258 place576 )
    ( on crate258 pallet258 )
    ( is-crate crate258 )
    ( clear crate258 )
    ( surface-at pallet183 place832 )
    ( surface-at crate183 place832 )
    ( on crate183 pallet183 )
    ( is-crate crate183 )
    ( clear crate183 )
  )
  ( :goal
    ( and
    )
  )
)
