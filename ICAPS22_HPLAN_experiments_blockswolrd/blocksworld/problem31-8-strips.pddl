( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b615 - block
    b384 - block
    b261 - block
    b909 - block
    b680 - block
    b174 - block
    b571 - block
    b417 - block
    b200 - block
    b232 - block
    b494 - block
    b910 - block
    b512 - block
    b252 - block
    b860 - block
    b888 - block
    b828 - block
    b713 - block
    b825 - block
    b613 - block
    b316 - block
    b40 - block
    b313 - block
    b348 - block
    b961 - block
    b356 - block
    b875 - block
    b656 - block
    b856 - block
    b8 - block
    b556 - block
    b890 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b615 )
    ( on b384 b615 )
    ( on b261 b384 )
    ( on b909 b261 )
    ( on b680 b909 )
    ( on b174 b680 )
    ( on b571 b174 )
    ( on b417 b571 )
    ( on b200 b417 )
    ( on b232 b200 )
    ( on b494 b232 )
    ( on b910 b494 )
    ( on b512 b910 )
    ( on b252 b512 )
    ( on b860 b252 )
    ( on b888 b860 )
    ( on b828 b888 )
    ( on b713 b828 )
    ( on b825 b713 )
    ( on b613 b825 )
    ( on b316 b613 )
    ( on b40 b316 )
    ( on b313 b40 )
    ( on b348 b313 )
    ( on b961 b348 )
    ( on b356 b961 )
    ( on b875 b356 )
    ( on b656 b875 )
    ( on b856 b656 )
    ( on b8 b856 )
    ( on b556 b8 )
    ( on b890 b556 )
    ( clear b890 )
  )
  ( :goal
    ( and
      ( clear b615 )
    )
  )
)
