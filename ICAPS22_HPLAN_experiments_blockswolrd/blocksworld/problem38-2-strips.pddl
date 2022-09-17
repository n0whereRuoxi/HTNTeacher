( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b911 - block
    b100 - block
    b421 - block
    b28 - block
    b828 - block
    b60 - block
    b943 - block
    b425 - block
    b396 - block
    b413 - block
    b873 - block
    b354 - block
    b187 - block
    b626 - block
    b362 - block
    b544 - block
    b692 - block
    b729 - block
    b367 - block
    b126 - block
    b545 - block
    b309 - block
    b910 - block
    b585 - block
    b548 - block
    b313 - block
    b278 - block
    b645 - block
    b164 - block
    b807 - block
    b535 - block
    b273 - block
    b451 - block
    b34 - block
    b322 - block
    b530 - block
    b997 - block
    b582 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b911 b324 )
    ( on b100 b911 )
    ( on b421 b100 )
    ( on b28 b421 )
    ( on b828 b28 )
    ( on b60 b828 )
    ( on b943 b60 )
    ( on b425 b943 )
    ( on b396 b425 )
    ( on b413 b396 )
    ( on b873 b413 )
    ( on b354 b873 )
    ( on b187 b354 )
    ( on b626 b187 )
    ( on b362 b626 )
    ( on b544 b362 )
    ( on b692 b544 )
    ( on b729 b692 )
    ( on b367 b729 )
    ( on b126 b367 )
    ( on b545 b126 )
    ( on b309 b545 )
    ( on b910 b309 )
    ( on b585 b910 )
    ( on b548 b585 )
    ( on b313 b548 )
    ( on b278 b313 )
    ( on b645 b278 )
    ( on b164 b645 )
    ( on b807 b164 )
    ( on b535 b807 )
    ( on b273 b535 )
    ( on b451 b273 )
    ( on b34 b451 )
    ( on b322 b34 )
    ( on b530 b322 )
    ( on b997 b530 )
    ( on b582 b997 )
    ( clear b582 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
