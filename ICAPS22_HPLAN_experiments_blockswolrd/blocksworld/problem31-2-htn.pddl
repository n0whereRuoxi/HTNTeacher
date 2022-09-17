( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b376 - block
    b917 - block
    b476 - block
    b531 - block
    b971 - block
    b142 - block
    b227 - block
    b744 - block
    b552 - block
    b472 - block
    b247 - block
    b675 - block
    b90 - block
    b314 - block
    b577 - block
    b283 - block
    b312 - block
    b845 - block
    b948 - block
    b11 - block
    b788 - block
    b9 - block
    b661 - block
    b73 - block
    b549 - block
    b466 - block
    b903 - block
    b632 - block
    b189 - block
    b867 - block
    b691 - block
    b230 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b376 )
    ( on b917 b376 )
    ( on b476 b917 )
    ( on b531 b476 )
    ( on b971 b531 )
    ( on b142 b971 )
    ( on b227 b142 )
    ( on b744 b227 )
    ( on b552 b744 )
    ( on b472 b552 )
    ( on b247 b472 )
    ( on b675 b247 )
    ( on b90 b675 )
    ( on b314 b90 )
    ( on b577 b314 )
    ( on b283 b577 )
    ( on b312 b283 )
    ( on b845 b312 )
    ( on b948 b845 )
    ( on b11 b948 )
    ( on b788 b11 )
    ( on b9 b788 )
    ( on b661 b9 )
    ( on b73 b661 )
    ( on b549 b73 )
    ( on b466 b549 )
    ( on b903 b466 )
    ( on b632 b903 )
    ( on b189 b632 )
    ( on b867 b189 )
    ( on b691 b867 )
    ( on b230 b691 )
    ( clear b230 )
  )
  ( :tasks
    ( Make-31Pile b917 b476 b531 b971 b142 b227 b744 b552 b472 b247 b675 b90 b314 b577 b283 b312 b845 b948 b11 b788 b9 b661 b73 b549 b466 b903 b632 b189 b867 b691 b230 )
  )
)
