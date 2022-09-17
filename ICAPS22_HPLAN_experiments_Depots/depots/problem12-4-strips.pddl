( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place115 - place
    hoist115 - hoist
    place124 - place
    hoist124 - hoist
    place485 - place
    hoist485 - hoist
    place546 - place
    hoist546 - hoist
    place464 - place
    hoist464 - hoist
    place430 - place
    hoist430 - hoist
    place270 - place
    hoist270 - hoist
    place300 - place
    hoist300 - hoist
    place75 - place
    hoist75 - hoist
    place155 - place
    hoist155 - hoist
    place539 - place
    hoist539 - hoist
    place501 - place
    hoist501 - hoist
    place947 - place
    hoist947 - hoist
    place103 - place
    hoist103 - hoist
    place954 - place
    hoist954 - hoist
    place714 - place
    hoist714 - hoist
    place979 - place
    hoist979 - hoist
    place597 - place
    hoist597 - hoist
    place946 - place
    hoist946 - hoist
    place992 - place
    hoist992 - hoist
    place541 - place
    hoist541 - hoist
    place755 - place
    hoist755 - hoist
    place703 - place
    hoist703 - hoist
    place0 - place
    hoist0 - hoist
    crate306 - surface
    pallet306 - surface
    crate271 - surface
    pallet271 - surface
    crate326 - surface
    pallet326 - surface
    crate475 - surface
    pallet475 - surface
    crate554 - surface
    pallet554 - surface
    crate739 - surface
    pallet739 - surface
    crate588 - surface
    pallet588 - surface
    crate662 - surface
    pallet662 - surface
    crate102 - surface
    pallet102 - surface
    crate995 - surface
    pallet995 - surface
    crate64 - surface
    pallet64 - surface
    crate232 - surface
    pallet232 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist115 place115 )
    ( available hoist115 )
    ( hoist-at hoist124 place124 )
    ( available hoist124 )
    ( hoist-at hoist485 place485 )
    ( available hoist485 )
    ( hoist-at hoist546 place546 )
    ( available hoist546 )
    ( hoist-at hoist464 place464 )
    ( available hoist464 )
    ( hoist-at hoist430 place430 )
    ( available hoist430 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist300 place300 )
    ( available hoist300 )
    ( hoist-at hoist75 place75 )
    ( available hoist75 )
    ( hoist-at hoist155 place155 )
    ( available hoist155 )
    ( hoist-at hoist539 place539 )
    ( available hoist539 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist947 place947 )
    ( available hoist947 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist714 place714 )
    ( available hoist714 )
    ( hoist-at hoist979 place979 )
    ( available hoist979 )
    ( hoist-at hoist597 place597 )
    ( available hoist597 )
    ( hoist-at hoist946 place946 )
    ( available hoist946 )
    ( hoist-at hoist992 place992 )
    ( available hoist992 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist755 place755 )
    ( available hoist755 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet306 place115 )
    ( surface-at crate306 place115 )
    ( on crate306 pallet306 )
    ( is-crate crate306 )
    ( clear crate306 )
    ( surface-at pallet271 place539 )
    ( surface-at crate271 place539 )
    ( on crate271 pallet271 )
    ( is-crate crate271 )
    ( clear crate271 )
    ( surface-at pallet326 place946 )
    ( surface-at crate326 place946 )
    ( on crate326 pallet326 )
    ( is-crate crate326 )
    ( clear crate326 )
    ( surface-at pallet475 place755 )
    ( surface-at crate475 place755 )
    ( on crate475 pallet475 )
    ( is-crate crate475 )
    ( clear crate475 )
    ( surface-at pallet554 place501 )
    ( surface-at crate554 place501 )
    ( on crate554 pallet554 )
    ( is-crate crate554 )
    ( clear crate554 )
    ( surface-at pallet739 place714 )
    ( surface-at crate739 place714 )
    ( on crate739 pallet739 )
    ( is-crate crate739 )
    ( clear crate739 )
    ( surface-at pallet588 place947 )
    ( surface-at crate588 place947 )
    ( on crate588 pallet588 )
    ( is-crate crate588 )
    ( clear crate588 )
    ( surface-at pallet662 place115 )
    ( surface-at crate662 place115 )
    ( on crate662 pallet662 )
    ( is-crate crate662 )
    ( clear crate662 )
    ( surface-at pallet102 place75 )
    ( surface-at crate102 place75 )
    ( on crate102 pallet102 )
    ( is-crate crate102 )
    ( clear crate102 )
    ( surface-at pallet995 place430 )
    ( surface-at crate995 place430 )
    ( on crate995 pallet995 )
    ( is-crate crate995 )
    ( clear crate995 )
    ( surface-at pallet64 place501 )
    ( surface-at crate64 place501 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet232 place541 )
    ( surface-at crate232 place541 )
    ( on crate232 pallet232 )
    ( is-crate crate232 )
    ( clear crate232 )
  )
  ( :goal
    ( and
    )
  )
)
