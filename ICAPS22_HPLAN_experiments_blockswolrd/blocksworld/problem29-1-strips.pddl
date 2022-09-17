( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b810 - block
    b953 - block
    b599 - block
    b231 - block
    b470 - block
    b543 - block
    b91 - block
    b194 - block
    b870 - block
    b672 - block
    b27 - block
    b924 - block
    b595 - block
    b102 - block
    b860 - block
    b466 - block
    b195 - block
    b800 - block
    b7 - block
    b856 - block
    b781 - block
    b629 - block
    b177 - block
    b62 - block
    b74 - block
    b300 - block
    b209 - block
    b579 - block
    b52 - block
    b636 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b810 )
    ( on b953 b810 )
    ( on b599 b953 )
    ( on b231 b599 )
    ( on b470 b231 )
    ( on b543 b470 )
    ( on b91 b543 )
    ( on b194 b91 )
    ( on b870 b194 )
    ( on b672 b870 )
    ( on b27 b672 )
    ( on b924 b27 )
    ( on b595 b924 )
    ( on b102 b595 )
    ( on b860 b102 )
    ( on b466 b860 )
    ( on b195 b466 )
    ( on b800 b195 )
    ( on b7 b800 )
    ( on b856 b7 )
    ( on b781 b856 )
    ( on b629 b781 )
    ( on b177 b629 )
    ( on b62 b177 )
    ( on b74 b62 )
    ( on b300 b74 )
    ( on b209 b300 )
    ( on b579 b209 )
    ( on b52 b579 )
    ( on b636 b52 )
    ( clear b636 )
  )
  ( :goal
    ( and
      ( clear b810 )
    )
  )
)
