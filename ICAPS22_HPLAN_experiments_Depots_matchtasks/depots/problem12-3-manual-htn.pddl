( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place536 - place
    hoist536 - hoist
    place988 - place
    hoist988 - hoist
    place24 - place
    hoist24 - hoist
    place673 - place
    hoist673 - hoist
    place931 - place
    hoist931 - hoist
    place856 - place
    hoist856 - hoist
    place265 - place
    hoist265 - hoist
    place121 - place
    hoist121 - hoist
    place698 - place
    hoist698 - hoist
    place968 - place
    hoist968 - hoist
    place497 - place
    hoist497 - hoist
    place400 - place
    hoist400 - hoist
    place420 - place
    hoist420 - hoist
    place391 - place
    hoist391 - hoist
    place872 - place
    hoist872 - hoist
    place791 - place
    hoist791 - hoist
    place114 - place
    hoist114 - hoist
    place996 - place
    hoist996 - hoist
    place0 - place
    hoist0 - hoist
    crate622 - surface
    pallet622 - surface
    crate245 - surface
    pallet245 - surface
    crate180 - surface
    pallet180 - surface
    crate142 - surface
    pallet142 - surface
    crate912 - surface
    pallet912 - surface
    crate675 - surface
    pallet675 - surface
    crate870 - surface
    pallet870 - surface
    crate437 - surface
    pallet437 - surface
    crate143 - surface
    pallet143 - surface
    crate862 - surface
    pallet862 - surface
    crate475 - surface
    pallet475 - surface
    crate220 - surface
    pallet220 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist536 place536 )
    ( available hoist536 )
    ( hoist-at hoist988 place988 )
    ( available hoist988 )
    ( hoist-at hoist24 place24 )
    ( available hoist24 )
    ( hoist-at hoist673 place673 )
    ( available hoist673 )
    ( hoist-at hoist931 place931 )
    ( available hoist931 )
    ( hoist-at hoist856 place856 )
    ( available hoist856 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist698 place698 )
    ( available hoist698 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist497 place497 )
    ( available hoist497 )
    ( hoist-at hoist400 place400 )
    ( available hoist400 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist872 place872 )
    ( available hoist872 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist114 place114 )
    ( available hoist114 )
    ( hoist-at hoist996 place996 )
    ( available hoist996 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet622 place420 )
    ( surface-at crate622 place420 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
    ( surface-at pallet245 place698 )
    ( surface-at crate245 place698 )
    ( on crate245 pallet245 )
    ( is-crate crate245 )
    ( clear crate245 )
    ( surface-at pallet180 place968 )
    ( surface-at crate180 place968 )
    ( on crate180 pallet180 )
    ( is-crate crate180 )
    ( clear crate180 )
    ( surface-at pallet142 place996 )
    ( surface-at crate142 place996 )
    ( on crate142 pallet142 )
    ( is-crate crate142 )
    ( clear crate142 )
    ( surface-at pallet912 place698 )
    ( surface-at crate912 place698 )
    ( on crate912 pallet912 )
    ( is-crate crate912 )
    ( clear crate912 )
    ( surface-at pallet675 place24 )
    ( surface-at crate675 place24 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet870 place420 )
    ( surface-at crate870 place420 )
    ( on crate870 pallet870 )
    ( is-crate crate870 )
    ( clear crate870 )
    ( surface-at pallet437 place856 )
    ( surface-at crate437 place856 )
    ( on crate437 pallet437 )
    ( is-crate crate437 )
    ( clear crate437 )
    ( surface-at pallet143 place536 )
    ( surface-at crate143 place536 )
    ( on crate143 pallet143 )
    ( is-crate crate143 )
    ( clear crate143 )
    ( surface-at pallet862 place791 )
    ( surface-at crate862 place791 )
    ( on crate862 pallet862 )
    ( is-crate crate862 )
    ( clear crate862 )
    ( surface-at pallet475 place420 )
    ( surface-at crate475 place420 )
    ( on crate475 pallet475 )
    ( is-crate crate475 )
    ( clear crate475 )
    ( surface-at pallet220 place872 )
    ( surface-at crate220 place872 )
    ( on crate220 pallet220 )
    ( is-crate crate220 )
    ( clear crate220 )
  )
  ( :tasks
    ( Make-On crate622 pallet0 )    ( Make-On crate245 crate622 )    ( Make-On crate180 crate245 )    ( Make-On crate142 crate180 )    ( Make-On crate912 crate142 )    ( Make-On crate675 crate912 )    ( Make-On crate870 crate675 )    ( Make-On crate437 crate870 )    ( Make-On crate143 crate437 )    ( Make-On crate862 crate143 )    ( Make-On crate475 crate862 )    ( Make-On crate220 crate475 )  )
)
