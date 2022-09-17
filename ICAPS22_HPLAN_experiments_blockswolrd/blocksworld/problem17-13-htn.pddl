( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b289 - block
    b821 - block
    b199 - block
    b790 - block
    b624 - block
    b800 - block
    b247 - block
    b11 - block
    b606 - block
    b896 - block
    b930 - block
    b708 - block
    b36 - block
    b944 - block
    b712 - block
    b711 - block
    b149 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b289 )
    ( on b821 b289 )
    ( on b199 b821 )
    ( on b790 b199 )
    ( on b624 b790 )
    ( on b800 b624 )
    ( on b247 b800 )
    ( on b11 b247 )
    ( on b606 b11 )
    ( on b896 b606 )
    ( on b930 b896 )
    ( on b708 b930 )
    ( on b36 b708 )
    ( on b944 b36 )
    ( on b712 b944 )
    ( on b711 b712 )
    ( on b149 b711 )
    ( on b233 b149 )
    ( clear b233 )
  )
  ( :tasks
    ( Make-17Pile b821 b199 b790 b624 b800 b247 b11 b606 b896 b930 b708 b36 b944 b712 b711 b149 b233 )
  )
)
