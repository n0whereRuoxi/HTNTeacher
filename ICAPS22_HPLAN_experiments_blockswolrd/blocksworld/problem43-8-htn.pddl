( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b313 - block
    b217 - block
    b834 - block
    b322 - block
    b812 - block
    b595 - block
    b16 - block
    b944 - block
    b485 - block
    b332 - block
    b689 - block
    b983 - block
    b786 - block
    b790 - block
    b561 - block
    b57 - block
    b502 - block
    b433 - block
    b567 - block
    b941 - block
    b970 - block
    b11 - block
    b931 - block
    b730 - block
    b399 - block
    b531 - block
    b556 - block
    b965 - block
    b984 - block
    b158 - block
    b405 - block
    b173 - block
    b849 - block
    b105 - block
    b932 - block
    b608 - block
    b310 - block
    b827 - block
    b777 - block
    b521 - block
    b301 - block
    b634 - block
    b250 - block
    b641 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b313 )
    ( on b217 b313 )
    ( on b834 b217 )
    ( on b322 b834 )
    ( on b812 b322 )
    ( on b595 b812 )
    ( on b16 b595 )
    ( on b944 b16 )
    ( on b485 b944 )
    ( on b332 b485 )
    ( on b689 b332 )
    ( on b983 b689 )
    ( on b786 b983 )
    ( on b790 b786 )
    ( on b561 b790 )
    ( on b57 b561 )
    ( on b502 b57 )
    ( on b433 b502 )
    ( on b567 b433 )
    ( on b941 b567 )
    ( on b970 b941 )
    ( on b11 b970 )
    ( on b931 b11 )
    ( on b730 b931 )
    ( on b399 b730 )
    ( on b531 b399 )
    ( on b556 b531 )
    ( on b965 b556 )
    ( on b984 b965 )
    ( on b158 b984 )
    ( on b405 b158 )
    ( on b173 b405 )
    ( on b849 b173 )
    ( on b105 b849 )
    ( on b932 b105 )
    ( on b608 b932 )
    ( on b310 b608 )
    ( on b827 b310 )
    ( on b777 b827 )
    ( on b521 b777 )
    ( on b301 b521 )
    ( on b634 b301 )
    ( on b250 b634 )
    ( on b641 b250 )
    ( clear b641 )
  )
  ( :tasks
    ( Make-43Pile b217 b834 b322 b812 b595 b16 b944 b485 b332 b689 b983 b786 b790 b561 b57 b502 b433 b567 b941 b970 b11 b931 b730 b399 b531 b556 b965 b984 b158 b405 b173 b849 b105 b932 b608 b310 b827 b777 b521 b301 b634 b250 b641 )
  )
)
