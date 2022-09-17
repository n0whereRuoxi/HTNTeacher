( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b491 - block
    b42 - block
    b395 - block
    b69 - block
    b23 - block
    b145 - block
    b715 - block
    b502 - block
    b397 - block
    b259 - block
    b806 - block
    b755 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b491 b59 )
    ( on b42 b491 )
    ( on b395 b42 )
    ( on b69 b395 )
    ( on b23 b69 )
    ( on b145 b23 )
    ( on b715 b145 )
    ( on b502 b715 )
    ( on b397 b502 )
    ( on b259 b397 )
    ( on b806 b259 )
    ( on b755 b806 )
    ( clear b755 )
  )
  ( :goal
    ( and
      ( clear b59 )
    )
  )
)
