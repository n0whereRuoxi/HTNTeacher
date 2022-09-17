( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b880 - block
    b265 - block
    b722 - block
    b50 - block
    b794 - block
    b860 - block
    b191 - block
    b741 - block
    b815 - block
    b452 - block
    b268 - block
    b936 - block
    b65 - block
    b923 - block
    b468 - block
    b19 - block
    b615 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b880 )
    ( on b265 b880 )
    ( on b722 b265 )
    ( on b50 b722 )
    ( on b794 b50 )
    ( on b860 b794 )
    ( on b191 b860 )
    ( on b741 b191 )
    ( on b815 b741 )
    ( on b452 b815 )
    ( on b268 b452 )
    ( on b936 b268 )
    ( on b65 b936 )
    ( on b923 b65 )
    ( on b468 b923 )
    ( on b19 b468 )
    ( on b615 b19 )
    ( clear b615 )
  )
  ( :goal
    ( and
      ( clear b880 )
    )
  )
)
