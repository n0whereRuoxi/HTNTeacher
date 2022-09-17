( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b947 - block
    b897 - block
    b255 - block
    b812 - block
    b758 - block
    b176 - block
    b393 - block
    b647 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b947 )
    ( on b897 b947 )
    ( on b255 b897 )
    ( on b812 b255 )
    ( on b758 b812 )
    ( on b176 b758 )
    ( on b393 b176 )
    ( on b647 b393 )
    ( clear b647 )
  )
  ( :tasks
    ( Make-7Pile b897 b255 b812 b758 b176 b393 b647 )
  )
)
