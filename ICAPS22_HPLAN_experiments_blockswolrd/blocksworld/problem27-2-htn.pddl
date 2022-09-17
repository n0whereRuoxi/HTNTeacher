( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b138 - block
    b741 - block
    b450 - block
    b497 - block
    b659 - block
    b925 - block
    b964 - block
    b582 - block
    b952 - block
    b979 - block
    b130 - block
    b696 - block
    b106 - block
    b16 - block
    b327 - block
    b205 - block
    b778 - block
    b348 - block
    b76 - block
    b162 - block
    b572 - block
    b757 - block
    b17 - block
    b32 - block
    b394 - block
    b560 - block
    b987 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b741 b138 )
    ( on b450 b741 )
    ( on b497 b450 )
    ( on b659 b497 )
    ( on b925 b659 )
    ( on b964 b925 )
    ( on b582 b964 )
    ( on b952 b582 )
    ( on b979 b952 )
    ( on b130 b979 )
    ( on b696 b130 )
    ( on b106 b696 )
    ( on b16 b106 )
    ( on b327 b16 )
    ( on b205 b327 )
    ( on b778 b205 )
    ( on b348 b778 )
    ( on b76 b348 )
    ( on b162 b76 )
    ( on b572 b162 )
    ( on b757 b572 )
    ( on b17 b757 )
    ( on b32 b17 )
    ( on b394 b32 )
    ( on b560 b394 )
    ( on b987 b560 )
    ( on b623 b987 )
    ( clear b623 )
  )
  ( :tasks
    ( Make-27Pile b741 b450 b497 b659 b925 b964 b582 b952 b979 b130 b696 b106 b16 b327 b205 b778 b348 b76 b162 b572 b757 b17 b32 b394 b560 b987 b623 )
  )
)
