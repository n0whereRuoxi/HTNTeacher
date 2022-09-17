( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b367 - block
    b877 - block
    b504 - block
    b873 - block
    b234 - block
    b222 - block
    b103 - block
    b274 - block
    b78 - block
    b121 - block
    b973 - block
    b437 - block
    b267 - block
    b309 - block
    b138 - block
    b11 - block
    b889 - block
    b466 - block
    b718 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b367 )
    ( on b877 b367 )
    ( on b504 b877 )
    ( on b873 b504 )
    ( on b234 b873 )
    ( on b222 b234 )
    ( on b103 b222 )
    ( on b274 b103 )
    ( on b78 b274 )
    ( on b121 b78 )
    ( on b973 b121 )
    ( on b437 b973 )
    ( on b267 b437 )
    ( on b309 b267 )
    ( on b138 b309 )
    ( on b11 b138 )
    ( on b889 b11 )
    ( on b466 b889 )
    ( on b718 b466 )
    ( clear b718 )
  )
  ( :goal
    ( and
      ( clear b367 )
    )
  )
)
