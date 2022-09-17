( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b757 - block
    b780 - block
    b623 - block
    b190 - block
    b878 - block
    b761 - block
    b903 - block
    b287 - block
    b909 - block
    b700 - block
    b798 - block
    b373 - block
    b345 - block
    b531 - block
    b351 - block
    b619 - block
    b566 - block
    b50 - block
    b768 - block
    b693 - block
    b980 - block
    b821 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b757 )
    ( on b780 b757 )
    ( on b623 b780 )
    ( on b190 b623 )
    ( on b878 b190 )
    ( on b761 b878 )
    ( on b903 b761 )
    ( on b287 b903 )
    ( on b909 b287 )
    ( on b700 b909 )
    ( on b798 b700 )
    ( on b373 b798 )
    ( on b345 b373 )
    ( on b531 b345 )
    ( on b351 b531 )
    ( on b619 b351 )
    ( on b566 b619 )
    ( on b50 b566 )
    ( on b768 b50 )
    ( on b693 b768 )
    ( on b980 b693 )
    ( on b821 b980 )
    ( clear b821 )
  )
  ( :tasks
    ( Make-21Pile b780 b623 b190 b878 b761 b903 b287 b909 b700 b798 b373 b345 b531 b351 b619 b566 b50 b768 b693 b980 b821 )
  )
)
