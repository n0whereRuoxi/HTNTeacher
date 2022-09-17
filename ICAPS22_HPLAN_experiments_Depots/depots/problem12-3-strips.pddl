( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place827 - place
    hoist827 - hoist
    place436 - place
    hoist436 - hoist
    place725 - place
    hoist725 - hoist
    place127 - place
    hoist127 - hoist
    place42 - place
    hoist42 - hoist
    place541 - place
    hoist541 - hoist
    place535 - place
    hoist535 - hoist
    place16 - place
    hoist16 - hoist
    place710 - place
    hoist710 - hoist
    place529 - place
    hoist529 - hoist
    place630 - place
    hoist630 - hoist
    place0 - place
    hoist0 - hoist
    crate874 - surface
    pallet874 - surface
    crate685 - surface
    pallet685 - surface
    crate362 - surface
    pallet362 - surface
    crate540 - surface
    pallet540 - surface
    crate666 - surface
    pallet666 - surface
    crate553 - surface
    pallet553 - surface
    crate877 - surface
    pallet877 - surface
    crate354 - surface
    pallet354 - surface
    crate377 - surface
    pallet377 - surface
    crate983 - surface
    pallet983 - surface
    crate475 - surface
    pallet475 - surface
    crate188 - surface
    pallet188 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist827 place827 )
    ( available hoist827 )
    ( hoist-at hoist436 place436 )
    ( available hoist436 )
    ( hoist-at hoist725 place725 )
    ( available hoist725 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist42 place42 )
    ( available hoist42 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist535 place535 )
    ( available hoist535 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist710 place710 )
    ( available hoist710 )
    ( hoist-at hoist529 place529 )
    ( available hoist529 )
    ( hoist-at hoist630 place630 )
    ( available hoist630 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet874 place16 )
    ( surface-at crate874 place16 )
    ( on crate874 pallet874 )
    ( is-crate crate874 )
    ( clear crate874 )
    ( surface-at pallet685 place42 )
    ( surface-at crate685 place42 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
    ( surface-at pallet362 place630 )
    ( surface-at crate362 place630 )
    ( on crate362 pallet362 )
    ( is-crate crate362 )
    ( clear crate362 )
    ( surface-at pallet540 place827 )
    ( surface-at crate540 place827 )
    ( on crate540 pallet540 )
    ( is-crate crate540 )
    ( clear crate540 )
    ( surface-at pallet666 place630 )
    ( surface-at crate666 place630 )
    ( on crate666 pallet666 )
    ( is-crate crate666 )
    ( clear crate666 )
    ( surface-at pallet553 place436 )
    ( surface-at crate553 place436 )
    ( on crate553 pallet553 )
    ( is-crate crate553 )
    ( clear crate553 )
    ( surface-at pallet877 place16 )
    ( surface-at crate877 place16 )
    ( on crate877 pallet877 )
    ( is-crate crate877 )
    ( clear crate877 )
    ( surface-at pallet354 place827 )
    ( surface-at crate354 place827 )
    ( on crate354 pallet354 )
    ( is-crate crate354 )
    ( clear crate354 )
    ( surface-at pallet377 place630 )
    ( surface-at crate377 place630 )
    ( on crate377 pallet377 )
    ( is-crate crate377 )
    ( clear crate377 )
    ( surface-at pallet983 place710 )
    ( surface-at crate983 place710 )
    ( on crate983 pallet983 )
    ( is-crate crate983 )
    ( clear crate983 )
    ( surface-at pallet475 place630 )
    ( surface-at crate475 place630 )
    ( on crate475 pallet475 )
    ( is-crate crate475 )
    ( clear crate475 )
    ( surface-at pallet188 place529 )
    ( surface-at crate188 place529 )
    ( on crate188 pallet188 )
    ( is-crate crate188 )
    ( clear crate188 )
  )
  ( :goal
    ( and
    )
  )
)
