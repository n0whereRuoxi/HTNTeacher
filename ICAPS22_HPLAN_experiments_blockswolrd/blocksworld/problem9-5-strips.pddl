( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b156 - block
    b223 - block
    b713 - block
    b41 - block
    b753 - block
    b200 - block
    b89 - block
    b327 - block
    b613 - block
    b181 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b156 )
    ( on b223 b156 )
    ( on b713 b223 )
    ( on b41 b713 )
    ( on b753 b41 )
    ( on b200 b753 )
    ( on b89 b200 )
    ( on b327 b89 )
    ( on b613 b327 )
    ( on b181 b613 )
    ( clear b181 )
  )
  ( :goal
    ( and
      ( clear b156 )
    )
  )
)
