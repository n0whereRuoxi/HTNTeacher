( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b751 - block
    b277 - block
    b795 - block
    b572 - block
    b727 - block
    b761 - block
    b179 - block
    b886 - block
    b661 - block
    b607 - block
    b157 - block
    b284 - block
    b426 - block
    b20 - block
    b273 - block
    b992 - block
    b88 - block
    b960 - block
    b406 - block
    b879 - block
    b105 - block
    b783 - block
    b384 - block
    b729 - block
    b786 - block
    b82 - block
    b614 - block
    b817 - block
    b932 - block
    b286 - block
    b390 - block
    b102 - block
    b369 - block
    b337 - block
    b77 - block
    b569 - block
    b997 - block
    b250 - block
    b459 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b751 )
    ( on b277 b751 )
    ( on b795 b277 )
    ( on b572 b795 )
    ( on b727 b572 )
    ( on b761 b727 )
    ( on b179 b761 )
    ( on b886 b179 )
    ( on b661 b886 )
    ( on b607 b661 )
    ( on b157 b607 )
    ( on b284 b157 )
    ( on b426 b284 )
    ( on b20 b426 )
    ( on b273 b20 )
    ( on b992 b273 )
    ( on b88 b992 )
    ( on b960 b88 )
    ( on b406 b960 )
    ( on b879 b406 )
    ( on b105 b879 )
    ( on b783 b105 )
    ( on b384 b783 )
    ( on b729 b384 )
    ( on b786 b729 )
    ( on b82 b786 )
    ( on b614 b82 )
    ( on b817 b614 )
    ( on b932 b817 )
    ( on b286 b932 )
    ( on b390 b286 )
    ( on b102 b390 )
    ( on b369 b102 )
    ( on b337 b369 )
    ( on b77 b337 )
    ( on b569 b77 )
    ( on b997 b569 )
    ( on b250 b997 )
    ( on b459 b250 )
    ( clear b459 )
  )
  ( :goal
    ( and
      ( clear b751 )
    )
  )
)
