( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b273 - block
    b728 - block
    b55 - block
    b931 - block
    b873 - block
    b620 - block
    b207 - block
    b509 - block
    b303 - block
    b441 - block
    b225 - block
    b586 - block
    b75 - block
    b54 - block
    b610 - block
    b870 - block
    b536 - block
    b945 - block
    b997 - block
    b602 - block
    b287 - block
    b194 - block
    b331 - block
    b114 - block
    b678 - block
    b763 - block
    b741 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b273 )
    ( on b728 b273 )
    ( on b55 b728 )
    ( on b931 b55 )
    ( on b873 b931 )
    ( on b620 b873 )
    ( on b207 b620 )
    ( on b509 b207 )
    ( on b303 b509 )
    ( on b441 b303 )
    ( on b225 b441 )
    ( on b586 b225 )
    ( on b75 b586 )
    ( on b54 b75 )
    ( on b610 b54 )
    ( on b870 b610 )
    ( on b536 b870 )
    ( on b945 b536 )
    ( on b997 b945 )
    ( on b602 b997 )
    ( on b287 b602 )
    ( on b194 b287 )
    ( on b331 b194 )
    ( on b114 b331 )
    ( on b678 b114 )
    ( on b763 b678 )
    ( on b741 b763 )
    ( clear b741 )
  )
  ( :goal
    ( and
      ( clear b273 )
    )
  )
)
