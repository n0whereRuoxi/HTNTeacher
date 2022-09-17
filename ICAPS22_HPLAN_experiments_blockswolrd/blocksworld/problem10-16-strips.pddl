( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b406 - block
    b413 - block
    b84 - block
    b585 - block
    b596 - block
    b49 - block
    b607 - block
    b579 - block
    b492 - block
    b519 - block
    b177 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b406 )
    ( on b413 b406 )
    ( on b84 b413 )
    ( on b585 b84 )
    ( on b596 b585 )
    ( on b49 b596 )
    ( on b607 b49 )
    ( on b579 b607 )
    ( on b492 b579 )
    ( on b519 b492 )
    ( on b177 b519 )
    ( clear b177 )
  )
  ( :goal
    ( and
      ( clear b406 )
    )
  )
)
