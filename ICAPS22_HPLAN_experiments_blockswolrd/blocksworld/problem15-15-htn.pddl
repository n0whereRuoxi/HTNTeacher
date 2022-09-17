( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b986 - block
    b653 - block
    b290 - block
    b818 - block
    b774 - block
    b174 - block
    b766 - block
    b575 - block
    b964 - block
    b209 - block
    b107 - block
    b386 - block
    b920 - block
    b716 - block
    b867 - block
    b51 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b986 )
    ( on b653 b986 )
    ( on b290 b653 )
    ( on b818 b290 )
    ( on b774 b818 )
    ( on b174 b774 )
    ( on b766 b174 )
    ( on b575 b766 )
    ( on b964 b575 )
    ( on b209 b964 )
    ( on b107 b209 )
    ( on b386 b107 )
    ( on b920 b386 )
    ( on b716 b920 )
    ( on b867 b716 )
    ( on b51 b867 )
    ( clear b51 )
  )
  ( :tasks
    ( Make-15Pile b653 b290 b818 b774 b174 b766 b575 b964 b209 b107 b386 b920 b716 b867 b51 )
  )
)
