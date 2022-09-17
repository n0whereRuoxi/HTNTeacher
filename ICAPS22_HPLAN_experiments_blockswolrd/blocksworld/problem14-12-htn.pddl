( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b231 - block
    b414 - block
    b804 - block
    b492 - block
    b658 - block
    b892 - block
    b154 - block
    b375 - block
    b547 - block
    b780 - block
    b84 - block
    b994 - block
    b324 - block
    b205 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b231 )
    ( on b414 b231 )
    ( on b804 b414 )
    ( on b492 b804 )
    ( on b658 b492 )
    ( on b892 b658 )
    ( on b154 b892 )
    ( on b375 b154 )
    ( on b547 b375 )
    ( on b780 b547 )
    ( on b84 b780 )
    ( on b994 b84 )
    ( on b324 b994 )
    ( on b205 b324 )
    ( on b885 b205 )
    ( clear b885 )
  )
  ( :tasks
    ( Make-14Pile b414 b804 b492 b658 b892 b154 b375 b547 b780 b84 b994 b324 b205 b885 )
  )
)
