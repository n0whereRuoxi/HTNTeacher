( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b173 - block
    b607 - block
    b212 - block
    b3 - block
    b186 - block
    b43 - block
    b71 - block
    b136 - block
    b948 - block
    b935 - block
    b355 - block
    b999 - block
    b973 - block
    b146 - block
    b177 - block
    b89 - block
    b460 - block
    b369 - block
    b90 - block
    b315 - block
    b783 - block
    b169 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b173 )
    ( on b607 b173 )
    ( on b212 b607 )
    ( on b3 b212 )
    ( on b186 b3 )
    ( on b43 b186 )
    ( on b71 b43 )
    ( on b136 b71 )
    ( on b948 b136 )
    ( on b935 b948 )
    ( on b355 b935 )
    ( on b999 b355 )
    ( on b973 b999 )
    ( on b146 b973 )
    ( on b177 b146 )
    ( on b89 b177 )
    ( on b460 b89 )
    ( on b369 b460 )
    ( on b90 b369 )
    ( on b315 b90 )
    ( on b783 b315 )
    ( on b169 b783 )
    ( clear b169 )
  )
  ( :goal
    ( and
      ( clear b173 )
    )
  )
)
