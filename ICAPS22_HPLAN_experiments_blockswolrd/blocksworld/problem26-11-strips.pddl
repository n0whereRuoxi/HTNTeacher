( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b313 - block
    b465 - block
    b109 - block
    b806 - block
    b964 - block
    b814 - block
    b818 - block
    b637 - block
    b104 - block
    b843 - block
    b13 - block
    b517 - block
    b206 - block
    b255 - block
    b763 - block
    b815 - block
    b394 - block
    b986 - block
    b146 - block
    b92 - block
    b151 - block
    b832 - block
    b766 - block
    b987 - block
    b998 - block
    b528 - block
    b46 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b313 )
    ( on b465 b313 )
    ( on b109 b465 )
    ( on b806 b109 )
    ( on b964 b806 )
    ( on b814 b964 )
    ( on b818 b814 )
    ( on b637 b818 )
    ( on b104 b637 )
    ( on b843 b104 )
    ( on b13 b843 )
    ( on b517 b13 )
    ( on b206 b517 )
    ( on b255 b206 )
    ( on b763 b255 )
    ( on b815 b763 )
    ( on b394 b815 )
    ( on b986 b394 )
    ( on b146 b986 )
    ( on b92 b146 )
    ( on b151 b92 )
    ( on b832 b151 )
    ( on b766 b832 )
    ( on b987 b766 )
    ( on b998 b987 )
    ( on b528 b998 )
    ( on b46 b528 )
    ( clear b46 )
  )
  ( :goal
    ( and
      ( clear b313 )
    )
  )
)
