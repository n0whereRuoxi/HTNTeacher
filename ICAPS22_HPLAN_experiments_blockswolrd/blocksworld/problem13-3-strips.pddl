( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b745 - block
    b199 - block
    b323 - block
    b692 - block
    b241 - block
    b446 - block
    b743 - block
    b497 - block
    b229 - block
    b937 - block
    b894 - block
    b627 - block
    b42 - block
    b953 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b745 )
    ( on b199 b745 )
    ( on b323 b199 )
    ( on b692 b323 )
    ( on b241 b692 )
    ( on b446 b241 )
    ( on b743 b446 )
    ( on b497 b743 )
    ( on b229 b497 )
    ( on b937 b229 )
    ( on b894 b937 )
    ( on b627 b894 )
    ( on b42 b627 )
    ( on b953 b42 )
    ( clear b953 )
  )
  ( :goal
    ( and
      ( clear b745 )
    )
  )
)
