( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b836 - block
    b989 - block
    b227 - block
    b859 - block
    b669 - block
    b457 - block
    b92 - block
    b540 - block
    b567 - block
    b792 - block
    b648 - block
    b323 - block
    b948 - block
    b455 - block
    b103 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b989 b836 )
    ( on b227 b989 )
    ( on b859 b227 )
    ( on b669 b859 )
    ( on b457 b669 )
    ( on b92 b457 )
    ( on b540 b92 )
    ( on b567 b540 )
    ( on b792 b567 )
    ( on b648 b792 )
    ( on b323 b648 )
    ( on b948 b323 )
    ( on b455 b948 )
    ( on b103 b455 )
    ( clear b103 )
  )
  ( :goal
    ( and
      ( clear b836 )
    )
  )
)
