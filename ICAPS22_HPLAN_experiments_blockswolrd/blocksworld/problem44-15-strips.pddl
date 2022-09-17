( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b5 - block
    b882 - block
    b168 - block
    b571 - block
    b714 - block
    b808 - block
    b198 - block
    b297 - block
    b980 - block
    b522 - block
    b194 - block
    b794 - block
    b535 - block
    b611 - block
    b385 - block
    b31 - block
    b452 - block
    b608 - block
    b586 - block
    b257 - block
    b430 - block
    b16 - block
    b791 - block
    b218 - block
    b488 - block
    b282 - block
    b981 - block
    b902 - block
    b309 - block
    b728 - block
    b599 - block
    b585 - block
    b540 - block
    b421 - block
    b787 - block
    b912 - block
    b646 - block
    b277 - block
    b347 - block
    b185 - block
    b321 - block
    b356 - block
    b130 - block
    b938 - block
    b203 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b5 )
    ( on b882 b5 )
    ( on b168 b882 )
    ( on b571 b168 )
    ( on b714 b571 )
    ( on b808 b714 )
    ( on b198 b808 )
    ( on b297 b198 )
    ( on b980 b297 )
    ( on b522 b980 )
    ( on b194 b522 )
    ( on b794 b194 )
    ( on b535 b794 )
    ( on b611 b535 )
    ( on b385 b611 )
    ( on b31 b385 )
    ( on b452 b31 )
    ( on b608 b452 )
    ( on b586 b608 )
    ( on b257 b586 )
    ( on b430 b257 )
    ( on b16 b430 )
    ( on b791 b16 )
    ( on b218 b791 )
    ( on b488 b218 )
    ( on b282 b488 )
    ( on b981 b282 )
    ( on b902 b981 )
    ( on b309 b902 )
    ( on b728 b309 )
    ( on b599 b728 )
    ( on b585 b599 )
    ( on b540 b585 )
    ( on b421 b540 )
    ( on b787 b421 )
    ( on b912 b787 )
    ( on b646 b912 )
    ( on b277 b646 )
    ( on b347 b277 )
    ( on b185 b347 )
    ( on b321 b185 )
    ( on b356 b321 )
    ( on b130 b356 )
    ( on b938 b130 )
    ( on b203 b938 )
    ( clear b203 )
  )
  ( :goal
    ( and
      ( clear b5 )
    )
  )
)
