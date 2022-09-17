( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b625 - block
    b837 - block
    b154 - block
    b498 - block
    b682 - block
    b692 - block
    b560 - block
    b162 - block
    b240 - block
    b96 - block
    b816 - block
    b706 - block
    b860 - block
    b405 - block
    b556 - block
    b850 - block
    b362 - block
    b867 - block
    b52 - block
    b626 - block
    b275 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b625 )
    ( on b837 b625 )
    ( on b154 b837 )
    ( on b498 b154 )
    ( on b682 b498 )
    ( on b692 b682 )
    ( on b560 b692 )
    ( on b162 b560 )
    ( on b240 b162 )
    ( on b96 b240 )
    ( on b816 b96 )
    ( on b706 b816 )
    ( on b860 b706 )
    ( on b405 b860 )
    ( on b556 b405 )
    ( on b850 b556 )
    ( on b362 b850 )
    ( on b867 b362 )
    ( on b52 b867 )
    ( on b626 b52 )
    ( on b275 b626 )
    ( clear b275 )
  )
  ( :tasks
    ( Make-20Pile b837 b154 b498 b682 b692 b560 b162 b240 b96 b816 b706 b860 b405 b556 b850 b362 b867 b52 b626 b275 )
  )
)
