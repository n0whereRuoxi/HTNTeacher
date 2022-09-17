( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b556 - block
    b713 - block
    b39 - block
    b655 - block
    b210 - block
    b161 - block
    b789 - block
    b246 - block
    b796 - block
    b853 - block
    b892 - block
    b965 - block
    b420 - block
    b251 - block
    b792 - block
    b943 - block
    b775 - block
    b361 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b556 )
    ( on b713 b556 )
    ( on b39 b713 )
    ( on b655 b39 )
    ( on b210 b655 )
    ( on b161 b210 )
    ( on b789 b161 )
    ( on b246 b789 )
    ( on b796 b246 )
    ( on b853 b796 )
    ( on b892 b853 )
    ( on b965 b892 )
    ( on b420 b965 )
    ( on b251 b420 )
    ( on b792 b251 )
    ( on b943 b792 )
    ( on b775 b943 )
    ( on b361 b775 )
    ( clear b361 )
  )
  ( :tasks
    ( Make-17Pile b713 b39 b655 b210 b161 b789 b246 b796 b853 b892 b965 b420 b251 b792 b943 b775 b361 )
  )
)
