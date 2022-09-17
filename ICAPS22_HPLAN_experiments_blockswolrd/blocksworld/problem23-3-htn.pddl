( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b205 - block
    b274 - block
    b524 - block
    b316 - block
    b310 - block
    b925 - block
    b124 - block
    b980 - block
    b382 - block
    b228 - block
    b613 - block
    b30 - block
    b209 - block
    b951 - block
    b85 - block
    b834 - block
    b230 - block
    b247 - block
    b535 - block
    b227 - block
    b700 - block
    b930 - block
    b260 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b274 b205 )
    ( on b524 b274 )
    ( on b316 b524 )
    ( on b310 b316 )
    ( on b925 b310 )
    ( on b124 b925 )
    ( on b980 b124 )
    ( on b382 b980 )
    ( on b228 b382 )
    ( on b613 b228 )
    ( on b30 b613 )
    ( on b209 b30 )
    ( on b951 b209 )
    ( on b85 b951 )
    ( on b834 b85 )
    ( on b230 b834 )
    ( on b247 b230 )
    ( on b535 b247 )
    ( on b227 b535 )
    ( on b700 b227 )
    ( on b930 b700 )
    ( on b260 b930 )
    ( on b255 b260 )
    ( clear b255 )
  )
  ( :tasks
    ( Make-23Pile b274 b524 b316 b310 b925 b124 b980 b382 b228 b613 b30 b209 b951 b85 b834 b230 b247 b535 b227 b700 b930 b260 b255 )
  )
)
