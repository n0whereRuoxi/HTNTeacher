( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b120 - block
    b743 - block
    b378 - block
    b172 - block
    b195 - block
    b617 - block
    b770 - block
    b472 - block
    b669 - block
    b990 - block
    b624 - block
    b897 - block
    b78 - block
    b937 - block
    b369 - block
    b562 - block
    b192 - block
    b627 - block
    b194 - block
    b351 - block
    b505 - block
    b696 - block
    b661 - block
    b521 - block
    b471 - block
    b868 - block
    b533 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b120 )
    ( on b743 b120 )
    ( on b378 b743 )
    ( on b172 b378 )
    ( on b195 b172 )
    ( on b617 b195 )
    ( on b770 b617 )
    ( on b472 b770 )
    ( on b669 b472 )
    ( on b990 b669 )
    ( on b624 b990 )
    ( on b897 b624 )
    ( on b78 b897 )
    ( on b937 b78 )
    ( on b369 b937 )
    ( on b562 b369 )
    ( on b192 b562 )
    ( on b627 b192 )
    ( on b194 b627 )
    ( on b351 b194 )
    ( on b505 b351 )
    ( on b696 b505 )
    ( on b661 b696 )
    ( on b521 b661 )
    ( on b471 b521 )
    ( on b868 b471 )
    ( on b533 b868 )
    ( clear b533 )
  )
  ( :goal
    ( and
      ( clear b120 )
    )
  )
)
