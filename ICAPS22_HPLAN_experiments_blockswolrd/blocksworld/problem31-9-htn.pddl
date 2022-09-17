( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b422 - block
    b951 - block
    b116 - block
    b97 - block
    b403 - block
    b61 - block
    b374 - block
    b798 - block
    b409 - block
    b415 - block
    b294 - block
    b109 - block
    b800 - block
    b92 - block
    b649 - block
    b991 - block
    b411 - block
    b497 - block
    b99 - block
    b539 - block
    b452 - block
    b290 - block
    b308 - block
    b37 - block
    b244 - block
    b408 - block
    b274 - block
    b521 - block
    b570 - block
    b277 - block
    b205 - block
    b301 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b422 )
    ( on b951 b422 )
    ( on b116 b951 )
    ( on b97 b116 )
    ( on b403 b97 )
    ( on b61 b403 )
    ( on b374 b61 )
    ( on b798 b374 )
    ( on b409 b798 )
    ( on b415 b409 )
    ( on b294 b415 )
    ( on b109 b294 )
    ( on b800 b109 )
    ( on b92 b800 )
    ( on b649 b92 )
    ( on b991 b649 )
    ( on b411 b991 )
    ( on b497 b411 )
    ( on b99 b497 )
    ( on b539 b99 )
    ( on b452 b539 )
    ( on b290 b452 )
    ( on b308 b290 )
    ( on b37 b308 )
    ( on b244 b37 )
    ( on b408 b244 )
    ( on b274 b408 )
    ( on b521 b274 )
    ( on b570 b521 )
    ( on b277 b570 )
    ( on b205 b277 )
    ( on b301 b205 )
    ( clear b301 )
  )
  ( :tasks
    ( Make-31Pile b951 b116 b97 b403 b61 b374 b798 b409 b415 b294 b109 b800 b92 b649 b991 b411 b497 b99 b539 b452 b290 b308 b37 b244 b408 b274 b521 b570 b277 b205 b301 )
  )
)
