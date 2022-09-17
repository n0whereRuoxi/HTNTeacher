( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b479 - block
    b249 - block
    b904 - block
    b90 - block
    b44 - block
    b996 - block
    b203 - block
    b407 - block
    b382 - block
    b591 - block
    b868 - block
    b991 - block
    b890 - block
    b563 - block
    b31 - block
    b924 - block
    b570 - block
    b804 - block
    b674 - block
    b242 - block
    b915 - block
    b438 - block
    b865 - block
    b556 - block
    b615 - block
    b799 - block
    b86 - block
    b744 - block
    b777 - block
    b339 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b479 )
    ( on b249 b479 )
    ( on b904 b249 )
    ( on b90 b904 )
    ( on b44 b90 )
    ( on b996 b44 )
    ( on b203 b996 )
    ( on b407 b203 )
    ( on b382 b407 )
    ( on b591 b382 )
    ( on b868 b591 )
    ( on b991 b868 )
    ( on b890 b991 )
    ( on b563 b890 )
    ( on b31 b563 )
    ( on b924 b31 )
    ( on b570 b924 )
    ( on b804 b570 )
    ( on b674 b804 )
    ( on b242 b674 )
    ( on b915 b242 )
    ( on b438 b915 )
    ( on b865 b438 )
    ( on b556 b865 )
    ( on b615 b556 )
    ( on b799 b615 )
    ( on b86 b799 )
    ( on b744 b86 )
    ( on b777 b744 )
    ( on b339 b777 )
    ( clear b339 )
  )
  ( :goal
    ( and
      ( clear b479 )
    )
  )
)
