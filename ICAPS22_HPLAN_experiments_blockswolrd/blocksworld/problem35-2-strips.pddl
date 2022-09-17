( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b727 - block
    b195 - block
    b635 - block
    b778 - block
    b454 - block
    b381 - block
    b113 - block
    b640 - block
    b16 - block
    b692 - block
    b204 - block
    b800 - block
    b320 - block
    b389 - block
    b629 - block
    b257 - block
    b161 - block
    b258 - block
    b836 - block
    b809 - block
    b484 - block
    b923 - block
    b931 - block
    b52 - block
    b578 - block
    b68 - block
    b527 - block
    b679 - block
    b246 - block
    b244 - block
    b137 - block
    b595 - block
    b914 - block
    b90 - block
    b124 - block
    b286 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b727 )
    ( on b195 b727 )
    ( on b635 b195 )
    ( on b778 b635 )
    ( on b454 b778 )
    ( on b381 b454 )
    ( on b113 b381 )
    ( on b640 b113 )
    ( on b16 b640 )
    ( on b692 b16 )
    ( on b204 b692 )
    ( on b800 b204 )
    ( on b320 b800 )
    ( on b389 b320 )
    ( on b629 b389 )
    ( on b257 b629 )
    ( on b161 b257 )
    ( on b258 b161 )
    ( on b836 b258 )
    ( on b809 b836 )
    ( on b484 b809 )
    ( on b923 b484 )
    ( on b931 b923 )
    ( on b52 b931 )
    ( on b578 b52 )
    ( on b68 b578 )
    ( on b527 b68 )
    ( on b679 b527 )
    ( on b246 b679 )
    ( on b244 b246 )
    ( on b137 b244 )
    ( on b595 b137 )
    ( on b914 b595 )
    ( on b90 b914 )
    ( on b124 b90 )
    ( on b286 b124 )
    ( clear b286 )
  )
  ( :goal
    ( and
      ( clear b727 )
    )
  )
)
