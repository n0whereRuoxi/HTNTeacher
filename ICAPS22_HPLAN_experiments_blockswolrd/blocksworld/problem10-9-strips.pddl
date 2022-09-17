( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b712 - block
    b513 - block
    b66 - block
    b881 - block
    b264 - block
    b458 - block
    b961 - block
    b806 - block
    b802 - block
    b281 - block
    b823 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b712 )
    ( on b513 b712 )
    ( on b66 b513 )
    ( on b881 b66 )
    ( on b264 b881 )
    ( on b458 b264 )
    ( on b961 b458 )
    ( on b806 b961 )
    ( on b802 b806 )
    ( on b281 b802 )
    ( on b823 b281 )
    ( clear b823 )
  )
  ( :goal
    ( and
      ( clear b712 )
    )
  )
)
