( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b533 - block
    b991 - block
    b349 - block
    b180 - block
    b947 - block
    b412 - block
    b313 - block
    b184 - block
    b824 - block
    b437 - block
    b837 - block
    b415 - block
    b514 - block
    b707 - block
    b150 - block
    b94 - block
    b773 - block
    b16 - block
    b598 - block
    b768 - block
    b584 - block
    b147 - block
    b19 - block
    b958 - block
    b682 - block
    b700 - block
    b477 - block
    b911 - block
    b2 - block
    b788 - block
    b431 - block
    b966 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b533 )
    ( on b991 b533 )
    ( on b349 b991 )
    ( on b180 b349 )
    ( on b947 b180 )
    ( on b412 b947 )
    ( on b313 b412 )
    ( on b184 b313 )
    ( on b824 b184 )
    ( on b437 b824 )
    ( on b837 b437 )
    ( on b415 b837 )
    ( on b514 b415 )
    ( on b707 b514 )
    ( on b150 b707 )
    ( on b94 b150 )
    ( on b773 b94 )
    ( on b16 b773 )
    ( on b598 b16 )
    ( on b768 b598 )
    ( on b584 b768 )
    ( on b147 b584 )
    ( on b19 b147 )
    ( on b958 b19 )
    ( on b682 b958 )
    ( on b700 b682 )
    ( on b477 b700 )
    ( on b911 b477 )
    ( on b2 b911 )
    ( on b788 b2 )
    ( on b431 b788 )
    ( on b966 b431 )
    ( clear b966 )
  )
  ( :goal
    ( and
      ( clear b533 )
    )
  )
)
