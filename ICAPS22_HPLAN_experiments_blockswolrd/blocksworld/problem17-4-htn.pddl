( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b781 - block
    b579 - block
    b129 - block
    b524 - block
    b841 - block
    b497 - block
    b118 - block
    b220 - block
    b31 - block
    b970 - block
    b811 - block
    b298 - block
    b974 - block
    b617 - block
    b546 - block
    b766 - block
    b874 - block
    b214 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b781 )
    ( on b579 b781 )
    ( on b129 b579 )
    ( on b524 b129 )
    ( on b841 b524 )
    ( on b497 b841 )
    ( on b118 b497 )
    ( on b220 b118 )
    ( on b31 b220 )
    ( on b970 b31 )
    ( on b811 b970 )
    ( on b298 b811 )
    ( on b974 b298 )
    ( on b617 b974 )
    ( on b546 b617 )
    ( on b766 b546 )
    ( on b874 b766 )
    ( on b214 b874 )
    ( clear b214 )
  )
  ( :tasks
    ( Make-17Pile b579 b129 b524 b841 b497 b118 b220 b31 b970 b811 b298 b974 b617 b546 b766 b874 b214 )
  )
)
