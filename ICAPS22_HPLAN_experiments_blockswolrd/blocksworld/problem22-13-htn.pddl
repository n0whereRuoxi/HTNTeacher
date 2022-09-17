( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b653 - block
    b543 - block
    b174 - block
    b125 - block
    b92 - block
    b520 - block
    b497 - block
    b56 - block
    b274 - block
    b290 - block
    b854 - block
    b660 - block
    b456 - block
    b503 - block
    b753 - block
    b616 - block
    b547 - block
    b427 - block
    b72 - block
    b241 - block
    b969 - block
    b42 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b653 )
    ( on b543 b653 )
    ( on b174 b543 )
    ( on b125 b174 )
    ( on b92 b125 )
    ( on b520 b92 )
    ( on b497 b520 )
    ( on b56 b497 )
    ( on b274 b56 )
    ( on b290 b274 )
    ( on b854 b290 )
    ( on b660 b854 )
    ( on b456 b660 )
    ( on b503 b456 )
    ( on b753 b503 )
    ( on b616 b753 )
    ( on b547 b616 )
    ( on b427 b547 )
    ( on b72 b427 )
    ( on b241 b72 )
    ( on b969 b241 )
    ( on b42 b969 )
    ( on b542 b42 )
    ( clear b542 )
  )
  ( :tasks
    ( Make-22Pile b543 b174 b125 b92 b520 b497 b56 b274 b290 b854 b660 b456 b503 b753 b616 b547 b427 b72 b241 b969 b42 b542 )
  )
)
