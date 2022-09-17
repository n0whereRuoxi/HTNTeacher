( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b403 - block
    b603 - block
    b813 - block
    b438 - block
    b3 - block
    b422 - block
    b196 - block
    b17 - block
    b704 - block
    b935 - block
    b600 - block
    b426 - block
    b166 - block
    b550 - block
    b668 - block
    b921 - block
    b482 - block
    b823 - block
    b958 - block
    b251 - block
    b441 - block
    b54 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b403 b221 )
    ( on b603 b403 )
    ( on b813 b603 )
    ( on b438 b813 )
    ( on b3 b438 )
    ( on b422 b3 )
    ( on b196 b422 )
    ( on b17 b196 )
    ( on b704 b17 )
    ( on b935 b704 )
    ( on b600 b935 )
    ( on b426 b600 )
    ( on b166 b426 )
    ( on b550 b166 )
    ( on b668 b550 )
    ( on b921 b668 )
    ( on b482 b921 )
    ( on b823 b482 )
    ( on b958 b823 )
    ( on b251 b958 )
    ( on b441 b251 )
    ( on b54 b441 )
    ( clear b54 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
