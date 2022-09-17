( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b836 - block
    b69 - block
    b675 - block
    b237 - block
    b84 - block
    b106 - block
    b88 - block
    b414 - block
    b418 - block
    b509 - block
    b570 - block
    b946 - block
    b144 - block
    b298 - block
    b580 - block
    b923 - block
    b988 - block
    b491 - block
    b468 - block
    b852 - block
    b8 - block
    b219 - block
    b499 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b69 b836 )
    ( on b675 b69 )
    ( on b237 b675 )
    ( on b84 b237 )
    ( on b106 b84 )
    ( on b88 b106 )
    ( on b414 b88 )
    ( on b418 b414 )
    ( on b509 b418 )
    ( on b570 b509 )
    ( on b946 b570 )
    ( on b144 b946 )
    ( on b298 b144 )
    ( on b580 b298 )
    ( on b923 b580 )
    ( on b988 b923 )
    ( on b491 b988 )
    ( on b468 b491 )
    ( on b852 b468 )
    ( on b8 b852 )
    ( on b219 b8 )
    ( on b499 b219 )
    ( clear b499 )
  )
  ( :tasks
    ( Make-22Pile b69 b675 b237 b84 b106 b88 b414 b418 b509 b570 b946 b144 b298 b580 b923 b988 b491 b468 b852 b8 b219 b499 )
  )
)
