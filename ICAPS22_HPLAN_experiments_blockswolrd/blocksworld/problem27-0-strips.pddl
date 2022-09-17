( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b678 - block
    b307 - block
    b444 - block
    b824 - block
    b889 - block
    b566 - block
    b718 - block
    b872 - block
    b602 - block
    b677 - block
    b867 - block
    b261 - block
    b999 - block
    b398 - block
    b627 - block
    b553 - block
    b762 - block
    b68 - block
    b333 - block
    b237 - block
    b210 - block
    b194 - block
    b464 - block
    b396 - block
    b886 - block
    b225 - block
    b287 - block
    b879 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b678 )
    ( on b307 b678 )
    ( on b444 b307 )
    ( on b824 b444 )
    ( on b889 b824 )
    ( on b566 b889 )
    ( on b718 b566 )
    ( on b872 b718 )
    ( on b602 b872 )
    ( on b677 b602 )
    ( on b867 b677 )
    ( on b261 b867 )
    ( on b999 b261 )
    ( on b398 b999 )
    ( on b627 b398 )
    ( on b553 b627 )
    ( on b762 b553 )
    ( on b68 b762 )
    ( on b333 b68 )
    ( on b237 b333 )
    ( on b210 b237 )
    ( on b194 b210 )
    ( on b464 b194 )
    ( on b396 b464 )
    ( on b886 b396 )
    ( on b225 b886 )
    ( on b287 b225 )
    ( on b879 b287 )
    ( clear b879 )
  )
  ( :goal
    ( and
      ( clear b678 )
    )
  )
)
