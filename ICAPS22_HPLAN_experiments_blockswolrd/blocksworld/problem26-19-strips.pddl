( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b948 - block
    b364 - block
    b522 - block
    b681 - block
    b139 - block
    b528 - block
    b825 - block
    b500 - block
    b926 - block
    b530 - block
    b513 - block
    b18 - block
    b979 - block
    b759 - block
    b330 - block
    b282 - block
    b589 - block
    b542 - block
    b582 - block
    b7 - block
    b884 - block
    b954 - block
    b699 - block
    b304 - block
    b159 - block
    b700 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b948 )
    ( on b364 b948 )
    ( on b522 b364 )
    ( on b681 b522 )
    ( on b139 b681 )
    ( on b528 b139 )
    ( on b825 b528 )
    ( on b500 b825 )
    ( on b926 b500 )
    ( on b530 b926 )
    ( on b513 b530 )
    ( on b18 b513 )
    ( on b979 b18 )
    ( on b759 b979 )
    ( on b330 b759 )
    ( on b282 b330 )
    ( on b589 b282 )
    ( on b542 b589 )
    ( on b582 b542 )
    ( on b7 b582 )
    ( on b884 b7 )
    ( on b954 b884 )
    ( on b699 b954 )
    ( on b304 b699 )
    ( on b159 b304 )
    ( on b700 b159 )
    ( on b222 b700 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b948 )
    )
  )
)
