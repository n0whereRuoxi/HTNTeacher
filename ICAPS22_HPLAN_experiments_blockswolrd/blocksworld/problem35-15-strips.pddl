( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b24 - block
    b945 - block
    b967 - block
    b255 - block
    b452 - block
    b69 - block
    b939 - block
    b512 - block
    b695 - block
    b740 - block
    b100 - block
    b824 - block
    b189 - block
    b544 - block
    b309 - block
    b567 - block
    b860 - block
    b200 - block
    b64 - block
    b756 - block
    b71 - block
    b823 - block
    b164 - block
    b107 - block
    b539 - block
    b256 - block
    b753 - block
    b306 - block
    b378 - block
    b108 - block
    b92 - block
    b265 - block
    b279 - block
    b933 - block
    b70 - block
    b528 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b24 )
    ( on b945 b24 )
    ( on b967 b945 )
    ( on b255 b967 )
    ( on b452 b255 )
    ( on b69 b452 )
    ( on b939 b69 )
    ( on b512 b939 )
    ( on b695 b512 )
    ( on b740 b695 )
    ( on b100 b740 )
    ( on b824 b100 )
    ( on b189 b824 )
    ( on b544 b189 )
    ( on b309 b544 )
    ( on b567 b309 )
    ( on b860 b567 )
    ( on b200 b860 )
    ( on b64 b200 )
    ( on b756 b64 )
    ( on b71 b756 )
    ( on b823 b71 )
    ( on b164 b823 )
    ( on b107 b164 )
    ( on b539 b107 )
    ( on b256 b539 )
    ( on b753 b256 )
    ( on b306 b753 )
    ( on b378 b306 )
    ( on b108 b378 )
    ( on b92 b108 )
    ( on b265 b92 )
    ( on b279 b265 )
    ( on b933 b279 )
    ( on b70 b933 )
    ( on b528 b70 )
    ( clear b528 )
  )
  ( :goal
    ( and
      ( clear b24 )
    )
  )
)
