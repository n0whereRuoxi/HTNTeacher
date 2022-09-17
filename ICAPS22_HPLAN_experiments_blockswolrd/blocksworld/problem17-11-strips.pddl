( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b712 - block
    b369 - block
    b174 - block
    b376 - block
    b856 - block
    b425 - block
    b123 - block
    b163 - block
    b725 - block
    b224 - block
    b986 - block
    b861 - block
    b710 - block
    b431 - block
    b759 - block
    b235 - block
    b316 - block
    b878 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b712 )
    ( on b369 b712 )
    ( on b174 b369 )
    ( on b376 b174 )
    ( on b856 b376 )
    ( on b425 b856 )
    ( on b123 b425 )
    ( on b163 b123 )
    ( on b725 b163 )
    ( on b224 b725 )
    ( on b986 b224 )
    ( on b861 b986 )
    ( on b710 b861 )
    ( on b431 b710 )
    ( on b759 b431 )
    ( on b235 b759 )
    ( on b316 b235 )
    ( on b878 b316 )
    ( clear b878 )
  )
  ( :goal
    ( and
      ( clear b712 )
    )
  )
)
