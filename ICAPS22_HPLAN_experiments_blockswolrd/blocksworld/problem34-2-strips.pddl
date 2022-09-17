( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b841 - block
    b333 - block
    b497 - block
    b512 - block
    b225 - block
    b654 - block
    b155 - block
    b574 - block
    b139 - block
    b851 - block
    b322 - block
    b266 - block
    b915 - block
    b661 - block
    b394 - block
    b83 - block
    b29 - block
    b489 - block
    b143 - block
    b545 - block
    b339 - block
    b578 - block
    b588 - block
    b861 - block
    b650 - block
    b211 - block
    b360 - block
    b460 - block
    b814 - block
    b521 - block
    b57 - block
    b176 - block
    b629 - block
    b884 - block
    b744 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b841 )
    ( on b333 b841 )
    ( on b497 b333 )
    ( on b512 b497 )
    ( on b225 b512 )
    ( on b654 b225 )
    ( on b155 b654 )
    ( on b574 b155 )
    ( on b139 b574 )
    ( on b851 b139 )
    ( on b322 b851 )
    ( on b266 b322 )
    ( on b915 b266 )
    ( on b661 b915 )
    ( on b394 b661 )
    ( on b83 b394 )
    ( on b29 b83 )
    ( on b489 b29 )
    ( on b143 b489 )
    ( on b545 b143 )
    ( on b339 b545 )
    ( on b578 b339 )
    ( on b588 b578 )
    ( on b861 b588 )
    ( on b650 b861 )
    ( on b211 b650 )
    ( on b360 b211 )
    ( on b460 b360 )
    ( on b814 b460 )
    ( on b521 b814 )
    ( on b57 b521 )
    ( on b176 b57 )
    ( on b629 b176 )
    ( on b884 b629 )
    ( on b744 b884 )
    ( clear b744 )
  )
  ( :goal
    ( and
      ( clear b841 )
    )
  )
)
