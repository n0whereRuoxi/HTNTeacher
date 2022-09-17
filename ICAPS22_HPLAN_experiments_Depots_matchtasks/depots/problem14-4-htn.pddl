( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place711 - place
    hoist711 - hoist
    place960 - place
    hoist960 - hoist
    place869 - place
    hoist869 - hoist
    place906 - place
    hoist906 - hoist
    place244 - place
    hoist244 - hoist
    place326 - place
    hoist326 - hoist
    place257 - place
    hoist257 - hoist
    place197 - place
    hoist197 - hoist
    place87 - place
    hoist87 - hoist
    place470 - place
    hoist470 - hoist
    place922 - place
    hoist922 - hoist
    place602 - place
    hoist602 - hoist
    place899 - place
    hoist899 - hoist
    place125 - place
    hoist125 - hoist
    place865 - place
    hoist865 - hoist
    place499 - place
    hoist499 - hoist
    place25 - place
    hoist25 - hoist
    place277 - place
    hoist277 - hoist
    place382 - place
    hoist382 - hoist
    place483 - place
    hoist483 - hoist
    place643 - place
    hoist643 - hoist
    place569 - place
    hoist569 - hoist
    place486 - place
    hoist486 - hoist
    place827 - place
    hoist827 - hoist
    place491 - place
    hoist491 - hoist
    place306 - place
    hoist306 - hoist
    place539 - place
    hoist539 - hoist
    place66 - place
    hoist66 - hoist
    place0 - place
    hoist0 - hoist
    crate144 - surface
    pallet144 - surface
    crate330 - surface
    pallet330 - surface
    crate252 - surface
    pallet252 - surface
    crate249 - surface
    pallet249 - surface
    crate573 - surface
    pallet573 - surface
    crate430 - surface
    pallet430 - surface
    crate587 - surface
    pallet587 - surface
    crate24 - surface
    pallet24 - surface
    crate182 - surface
    pallet182 - surface
    crate518 - surface
    pallet518 - surface
    crate818 - surface
    pallet818 - surface
    crate748 - surface
    pallet748 - surface
    crate195 - surface
    pallet195 - surface
    crate258 - surface
    pallet258 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist960 place960 )
    ( available hoist960 )
    ( hoist-at hoist869 place869 )
    ( available hoist869 )
    ( hoist-at hoist906 place906 )
    ( available hoist906 )
    ( hoist-at hoist244 place244 )
    ( available hoist244 )
    ( hoist-at hoist326 place326 )
    ( available hoist326 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist197 place197 )
    ( available hoist197 )
    ( hoist-at hoist87 place87 )
    ( available hoist87 )
    ( hoist-at hoist470 place470 )
    ( available hoist470 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist602 place602 )
    ( available hoist602 )
    ( hoist-at hoist899 place899 )
    ( available hoist899 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist865 place865 )
    ( available hoist865 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist25 place25 )
    ( available hoist25 )
    ( hoist-at hoist277 place277 )
    ( available hoist277 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist483 place483 )
    ( available hoist483 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist569 place569 )
    ( available hoist569 )
    ( hoist-at hoist486 place486 )
    ( available hoist486 )
    ( hoist-at hoist827 place827 )
    ( available hoist827 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist539 place539 )
    ( available hoist539 )
    ( hoist-at hoist66 place66 )
    ( available hoist66 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet144 place711 )
    ( surface-at crate144 place711 )
    ( on crate144 pallet144 )
    ( is-crate crate144 )
    ( clear crate144 )
    ( surface-at pallet330 place470 )
    ( surface-at crate330 place470 )
    ( on crate330 pallet330 )
    ( is-crate crate330 )
    ( clear crate330 )
    ( surface-at pallet252 place483 )
    ( surface-at crate252 place483 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet249 place25 )
    ( surface-at crate249 place25 )
    ( on crate249 pallet249 )
    ( is-crate crate249 )
    ( clear crate249 )
    ( surface-at pallet573 place326 )
    ( surface-at crate573 place326 )
    ( on crate573 pallet573 )
    ( is-crate crate573 )
    ( clear crate573 )
    ( surface-at pallet430 place899 )
    ( surface-at crate430 place899 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet587 place277 )
    ( surface-at crate587 place277 )
    ( on crate587 pallet587 )
    ( is-crate crate587 )
    ( clear crate587 )
    ( surface-at pallet24 place827 )
    ( surface-at crate24 place827 )
    ( on crate24 pallet24 )
    ( is-crate crate24 )
    ( clear crate24 )
    ( surface-at pallet182 place244 )
    ( surface-at crate182 place244 )
    ( on crate182 pallet182 )
    ( is-crate crate182 )
    ( clear crate182 )
    ( surface-at pallet518 place906 )
    ( surface-at crate518 place906 )
    ( on crate518 pallet518 )
    ( is-crate crate518 )
    ( clear crate518 )
    ( surface-at pallet818 place87 )
    ( surface-at crate818 place87 )
    ( on crate818 pallet818 )
    ( is-crate crate818 )
    ( clear crate818 )
    ( surface-at pallet748 place865 )
    ( surface-at crate748 place865 )
    ( on crate748 pallet748 )
    ( is-crate crate748 )
    ( clear crate748 )
    ( surface-at pallet195 place66 )
    ( surface-at crate195 place66 )
    ( on crate195 pallet195 )
    ( is-crate crate195 )
    ( clear crate195 )
    ( surface-at pallet258 place602 )
    ( surface-at crate258 place602 )
    ( on crate258 pallet258 )
    ( is-crate crate258 )
    ( clear crate258 )
  )
  ( :tasks
    ( Make-14Crate pallet0 crate144 crate330 crate252 crate249 crate573 crate430 crate587 crate24 crate182 crate518 crate818 crate748 crate195 crate258 )
  )
)
