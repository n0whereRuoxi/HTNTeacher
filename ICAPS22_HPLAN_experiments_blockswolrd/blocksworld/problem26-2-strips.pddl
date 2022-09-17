( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b96 - block
    b309 - block
    b24 - block
    b895 - block
    b962 - block
    b341 - block
    b894 - block
    b351 - block
    b863 - block
    b887 - block
    b215 - block
    b265 - block
    b68 - block
    b343 - block
    b214 - block
    b146 - block
    b186 - block
    b84 - block
    b900 - block
    b839 - block
    b197 - block
    b737 - block
    b424 - block
    b19 - block
    b149 - block
    b702 - block
    b781 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b96 )
    ( on b309 b96 )
    ( on b24 b309 )
    ( on b895 b24 )
    ( on b962 b895 )
    ( on b341 b962 )
    ( on b894 b341 )
    ( on b351 b894 )
    ( on b863 b351 )
    ( on b887 b863 )
    ( on b215 b887 )
    ( on b265 b215 )
    ( on b68 b265 )
    ( on b343 b68 )
    ( on b214 b343 )
    ( on b146 b214 )
    ( on b186 b146 )
    ( on b84 b186 )
    ( on b900 b84 )
    ( on b839 b900 )
    ( on b197 b839 )
    ( on b737 b197 )
    ( on b424 b737 )
    ( on b19 b424 )
    ( on b149 b19 )
    ( on b702 b149 )
    ( on b781 b702 )
    ( clear b781 )
  )
  ( :goal
    ( and
      ( clear b96 )
    )
  )
)
