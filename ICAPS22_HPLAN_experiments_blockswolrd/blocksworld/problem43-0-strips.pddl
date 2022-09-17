( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b415 - block
    b321 - block
    b17 - block
    b182 - block
    b501 - block
    b606 - block
    b594 - block
    b798 - block
    b862 - block
    b626 - block
    b461 - block
    b209 - block
    b753 - block
    b900 - block
    b24 - block
    b623 - block
    b531 - block
    b453 - block
    b646 - block
    b726 - block
    b711 - block
    b708 - block
    b148 - block
    b96 - block
    b757 - block
    b780 - block
    b370 - block
    b621 - block
    b125 - block
    b329 - block
    b409 - block
    b706 - block
    b774 - block
    b38 - block
    b797 - block
    b53 - block
    b14 - block
    b98 - block
    b109 - block
    b578 - block
    b812 - block
    b677 - block
    b268 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b415 )
    ( on b321 b415 )
    ( on b17 b321 )
    ( on b182 b17 )
    ( on b501 b182 )
    ( on b606 b501 )
    ( on b594 b606 )
    ( on b798 b594 )
    ( on b862 b798 )
    ( on b626 b862 )
    ( on b461 b626 )
    ( on b209 b461 )
    ( on b753 b209 )
    ( on b900 b753 )
    ( on b24 b900 )
    ( on b623 b24 )
    ( on b531 b623 )
    ( on b453 b531 )
    ( on b646 b453 )
    ( on b726 b646 )
    ( on b711 b726 )
    ( on b708 b711 )
    ( on b148 b708 )
    ( on b96 b148 )
    ( on b757 b96 )
    ( on b780 b757 )
    ( on b370 b780 )
    ( on b621 b370 )
    ( on b125 b621 )
    ( on b329 b125 )
    ( on b409 b329 )
    ( on b706 b409 )
    ( on b774 b706 )
    ( on b38 b774 )
    ( on b797 b38 )
    ( on b53 b797 )
    ( on b14 b53 )
    ( on b98 b14 )
    ( on b109 b98 )
    ( on b578 b109 )
    ( on b812 b578 )
    ( on b677 b812 )
    ( on b268 b677 )
    ( on b687 b268 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b415 )
    )
  )
)
