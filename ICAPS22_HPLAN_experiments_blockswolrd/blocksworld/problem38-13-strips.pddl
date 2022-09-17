( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b65 - block
    b871 - block
    b480 - block
    b669 - block
    b479 - block
    b752 - block
    b828 - block
    b127 - block
    b321 - block
    b841 - block
    b728 - block
    b876 - block
    b269 - block
    b521 - block
    b180 - block
    b787 - block
    b161 - block
    b359 - block
    b523 - block
    b451 - block
    b434 - block
    b968 - block
    b560 - block
    b711 - block
    b119 - block
    b283 - block
    b62 - block
    b570 - block
    b958 - block
    b566 - block
    b458 - block
    b912 - block
    b872 - block
    b744 - block
    b830 - block
    b482 - block
    b21 - block
    b44 - block
    b536 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b65 )
    ( on b871 b65 )
    ( on b480 b871 )
    ( on b669 b480 )
    ( on b479 b669 )
    ( on b752 b479 )
    ( on b828 b752 )
    ( on b127 b828 )
    ( on b321 b127 )
    ( on b841 b321 )
    ( on b728 b841 )
    ( on b876 b728 )
    ( on b269 b876 )
    ( on b521 b269 )
    ( on b180 b521 )
    ( on b787 b180 )
    ( on b161 b787 )
    ( on b359 b161 )
    ( on b523 b359 )
    ( on b451 b523 )
    ( on b434 b451 )
    ( on b968 b434 )
    ( on b560 b968 )
    ( on b711 b560 )
    ( on b119 b711 )
    ( on b283 b119 )
    ( on b62 b283 )
    ( on b570 b62 )
    ( on b958 b570 )
    ( on b566 b958 )
    ( on b458 b566 )
    ( on b912 b458 )
    ( on b872 b912 )
    ( on b744 b872 )
    ( on b830 b744 )
    ( on b482 b830 )
    ( on b21 b482 )
    ( on b44 b21 )
    ( on b536 b44 )
    ( clear b536 )
  )
  ( :goal
    ( and
      ( clear b65 )
    )
  )
)
