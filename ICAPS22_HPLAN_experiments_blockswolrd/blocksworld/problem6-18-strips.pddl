( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b993 - block
    b108 - block
    b338 - block
    b164 - block
    b391 - block
    b324 - block
    b710 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b993 )
    ( on b108 b993 )
    ( on b338 b108 )
    ( on b164 b338 )
    ( on b391 b164 )
    ( on b324 b391 )
    ( on b710 b324 )
    ( clear b710 )
  )
  ( :goal
    ( and
      ( clear b993 )
    )
  )
)
