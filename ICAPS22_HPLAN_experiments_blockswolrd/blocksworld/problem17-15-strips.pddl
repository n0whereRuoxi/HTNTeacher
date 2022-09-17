( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b318 - block
    b446 - block
    b144 - block
    b948 - block
    b971 - block
    b861 - block
    b609 - block
    b754 - block
    b24 - block
    b745 - block
    b813 - block
    b850 - block
    b278 - block
    b669 - block
    b452 - block
    b490 - block
    b303 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b318 b795 )
    ( on b446 b318 )
    ( on b144 b446 )
    ( on b948 b144 )
    ( on b971 b948 )
    ( on b861 b971 )
    ( on b609 b861 )
    ( on b754 b609 )
    ( on b24 b754 )
    ( on b745 b24 )
    ( on b813 b745 )
    ( on b850 b813 )
    ( on b278 b850 )
    ( on b669 b278 )
    ( on b452 b669 )
    ( on b490 b452 )
    ( on b303 b490 )
    ( clear b303 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
