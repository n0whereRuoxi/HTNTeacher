( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place838 - place
    hoist838 - hoist
    place218 - place
    hoist218 - hoist
    place136 - place
    hoist136 - hoist
    place953 - place
    hoist953 - hoist
    place418 - place
    hoist418 - hoist
    place390 - place
    hoist390 - hoist
    place594 - place
    hoist594 - hoist
    place162 - place
    hoist162 - hoist
    place449 - place
    hoist449 - hoist
    place764 - place
    hoist764 - hoist
    place97 - place
    hoist97 - hoist
    place147 - place
    hoist147 - hoist
    place457 - place
    hoist457 - hoist
    place884 - place
    hoist884 - hoist
    place413 - place
    hoist413 - hoist
    place645 - place
    hoist645 - hoist
    place153 - place
    hoist153 - hoist
    place674 - place
    hoist674 - hoist
    place664 - place
    hoist664 - hoist
    place202 - place
    hoist202 - hoist
    place366 - place
    hoist366 - hoist
    place735 - place
    hoist735 - hoist
    place330 - place
    hoist330 - hoist
    place65 - place
    hoist65 - hoist
    place0 - place
    hoist0 - hoist
    crate708 - surface
    pallet708 - surface
    crate907 - surface
    pallet907 - surface
    crate43 - surface
    pallet43 - surface
    crate119 - surface
    pallet119 - surface
    crate914 - surface
    pallet914 - surface
    crate861 - surface
    pallet861 - surface
    crate729 - surface
    pallet729 - surface
    crate529 - surface
    pallet529 - surface
    crate981 - surface
    pallet981 - surface
    crate792 - surface
    pallet792 - surface
    crate21 - surface
    pallet21 - surface
    crate307 - surface
    pallet307 - surface
    crate844 - surface
    pallet844 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist838 place838 )
    ( available hoist838 )
    ( hoist-at hoist218 place218 )
    ( available hoist218 )
    ( hoist-at hoist136 place136 )
    ( available hoist136 )
    ( hoist-at hoist953 place953 )
    ( available hoist953 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist594 place594 )
    ( available hoist594 )
    ( hoist-at hoist162 place162 )
    ( available hoist162 )
    ( hoist-at hoist449 place449 )
    ( available hoist449 )
    ( hoist-at hoist764 place764 )
    ( available hoist764 )
    ( hoist-at hoist97 place97 )
    ( available hoist97 )
    ( hoist-at hoist147 place147 )
    ( available hoist147 )
    ( hoist-at hoist457 place457 )
    ( available hoist457 )
    ( hoist-at hoist884 place884 )
    ( available hoist884 )
    ( hoist-at hoist413 place413 )
    ( available hoist413 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist153 place153 )
    ( available hoist153 )
    ( hoist-at hoist674 place674 )
    ( available hoist674 )
    ( hoist-at hoist664 place664 )
    ( available hoist664 )
    ( hoist-at hoist202 place202 )
    ( available hoist202 )
    ( hoist-at hoist366 place366 )
    ( available hoist366 )
    ( hoist-at hoist735 place735 )
    ( available hoist735 )
    ( hoist-at hoist330 place330 )
    ( available hoist330 )
    ( hoist-at hoist65 place65 )
    ( available hoist65 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet708 place97 )
    ( surface-at crate708 place97 )
    ( on crate708 pallet708 )
    ( is-crate crate708 )
    ( clear crate708 )
    ( surface-at pallet907 place366 )
    ( surface-at crate907 place366 )
    ( on crate907 pallet907 )
    ( is-crate crate907 )
    ( clear crate907 )
    ( surface-at pallet43 place664 )
    ( surface-at crate43 place664 )
    ( on crate43 pallet43 )
    ( is-crate crate43 )
    ( clear crate43 )
    ( surface-at pallet119 place674 )
    ( surface-at crate119 place674 )
    ( on crate119 pallet119 )
    ( is-crate crate119 )
    ( clear crate119 )
    ( surface-at pallet914 place97 )
    ( surface-at crate914 place97 )
    ( on crate914 pallet914 )
    ( is-crate crate914 )
    ( clear crate914 )
    ( surface-at pallet861 place594 )
    ( surface-at crate861 place594 )
    ( on crate861 pallet861 )
    ( is-crate crate861 )
    ( clear crate861 )
    ( surface-at pallet729 place838 )
    ( surface-at crate729 place838 )
    ( on crate729 pallet729 )
    ( is-crate crate729 )
    ( clear crate729 )
    ( surface-at pallet529 place838 )
    ( surface-at crate529 place838 )
    ( on crate529 pallet529 )
    ( is-crate crate529 )
    ( clear crate529 )
    ( surface-at pallet981 place330 )
    ( surface-at crate981 place330 )
    ( on crate981 pallet981 )
    ( is-crate crate981 )
    ( clear crate981 )
    ( surface-at pallet792 place390 )
    ( surface-at crate792 place390 )
    ( on crate792 pallet792 )
    ( is-crate crate792 )
    ( clear crate792 )
    ( surface-at pallet21 place147 )
    ( surface-at crate21 place147 )
    ( on crate21 pallet21 )
    ( is-crate crate21 )
    ( clear crate21 )
    ( surface-at pallet307 place594 )
    ( surface-at crate307 place594 )
    ( on crate307 pallet307 )
    ( is-crate crate307 )
    ( clear crate307 )
    ( surface-at pallet844 place449 )
    ( surface-at crate844 place449 )
    ( on crate844 pallet844 )
    ( is-crate crate844 )
    ( clear crate844 )
  )
  ( :goal
    ( and
    )
  )
)
