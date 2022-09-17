( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b715 - block
    b722 - block
    b158 - block
    b898 - block
    b886 - block
    b32 - block
    b423 - block
    b707 - block
    b795 - block
    b14 - block
    b686 - block
    b8 - block
    b712 - block
    b566 - block
    b412 - block
    b229 - block
    b441 - block
    b411 - block
    b405 - block
    b848 - block
    b170 - block
    b247 - block
    b314 - block
    b519 - block
    b123 - block
    b78 - block
    b827 - block
    b351 - block
    b539 - block
    b58 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b715 )
    ( on b722 b715 )
    ( on b158 b722 )
    ( on b898 b158 )
    ( on b886 b898 )
    ( on b32 b886 )
    ( on b423 b32 )
    ( on b707 b423 )
    ( on b795 b707 )
    ( on b14 b795 )
    ( on b686 b14 )
    ( on b8 b686 )
    ( on b712 b8 )
    ( on b566 b712 )
    ( on b412 b566 )
    ( on b229 b412 )
    ( on b441 b229 )
    ( on b411 b441 )
    ( on b405 b411 )
    ( on b848 b405 )
    ( on b170 b848 )
    ( on b247 b170 )
    ( on b314 b247 )
    ( on b519 b314 )
    ( on b123 b519 )
    ( on b78 b123 )
    ( on b827 b78 )
    ( on b351 b827 )
    ( on b539 b351 )
    ( on b58 b539 )
    ( clear b58 )
  )
  ( :goal
    ( and
      ( clear b715 )
    )
  )
)
