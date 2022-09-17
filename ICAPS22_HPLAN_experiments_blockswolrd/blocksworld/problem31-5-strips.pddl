( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b259 - block
    b792 - block
    b156 - block
    b317 - block
    b396 - block
    b548 - block
    b203 - block
    b320 - block
    b97 - block
    b238 - block
    b360 - block
    b245 - block
    b411 - block
    b250 - block
    b468 - block
    b518 - block
    b195 - block
    b321 - block
    b838 - block
    b117 - block
    b961 - block
    b390 - block
    b722 - block
    b774 - block
    b661 - block
    b81 - block
    b601 - block
    b592 - block
    b355 - block
    b898 - block
    b500 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b259 b107 )
    ( on b792 b259 )
    ( on b156 b792 )
    ( on b317 b156 )
    ( on b396 b317 )
    ( on b548 b396 )
    ( on b203 b548 )
    ( on b320 b203 )
    ( on b97 b320 )
    ( on b238 b97 )
    ( on b360 b238 )
    ( on b245 b360 )
    ( on b411 b245 )
    ( on b250 b411 )
    ( on b468 b250 )
    ( on b518 b468 )
    ( on b195 b518 )
    ( on b321 b195 )
    ( on b838 b321 )
    ( on b117 b838 )
    ( on b961 b117 )
    ( on b390 b961 )
    ( on b722 b390 )
    ( on b774 b722 )
    ( on b661 b774 )
    ( on b81 b661 )
    ( on b601 b81 )
    ( on b592 b601 )
    ( on b355 b592 )
    ( on b898 b355 )
    ( on b500 b898 )
    ( clear b500 )
  )
  ( :goal
    ( and
      ( clear b107 )
    )
  )
)
