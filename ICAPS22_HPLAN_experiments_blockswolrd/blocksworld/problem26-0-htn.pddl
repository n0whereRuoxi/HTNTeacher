( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b249 - block
    b844 - block
    b282 - block
    b915 - block
    b325 - block
    b273 - block
    b848 - block
    b67 - block
    b932 - block
    b846 - block
    b681 - block
    b217 - block
    b295 - block
    b412 - block
    b47 - block
    b836 - block
    b777 - block
    b742 - block
    b174 - block
    b590 - block
    b582 - block
    b731 - block
    b588 - block
    b955 - block
    b343 - block
    b989 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b249 )
    ( on b844 b249 )
    ( on b282 b844 )
    ( on b915 b282 )
    ( on b325 b915 )
    ( on b273 b325 )
    ( on b848 b273 )
    ( on b67 b848 )
    ( on b932 b67 )
    ( on b846 b932 )
    ( on b681 b846 )
    ( on b217 b681 )
    ( on b295 b217 )
    ( on b412 b295 )
    ( on b47 b412 )
    ( on b836 b47 )
    ( on b777 b836 )
    ( on b742 b777 )
    ( on b174 b742 )
    ( on b590 b174 )
    ( on b582 b590 )
    ( on b731 b582 )
    ( on b588 b731 )
    ( on b955 b588 )
    ( on b343 b955 )
    ( on b989 b343 )
    ( on b126 b989 )
    ( clear b126 )
  )
  ( :tasks
    ( Make-26Pile b844 b282 b915 b325 b273 b848 b67 b932 b846 b681 b217 b295 b412 b47 b836 b777 b742 b174 b590 b582 b731 b588 b955 b343 b989 b126 )
  )
)
