( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b919 - block
    b801 - block
    b894 - block
    b245 - block
    b669 - block
    b44 - block
    b337 - block
    b682 - block
    b487 - block
    b720 - block
    b825 - block
    b61 - block
    b761 - block
    b776 - block
    b267 - block
    b827 - block
    b846 - block
    b32 - block
    b663 - block
    b63 - block
    b837 - block
    b265 - block
    b523 - block
    b241 - block
    b649 - block
    b590 - block
    b486 - block
    b391 - block
    b862 - block
    b113 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b919 )
    ( on b801 b919 )
    ( on b894 b801 )
    ( on b245 b894 )
    ( on b669 b245 )
    ( on b44 b669 )
    ( on b337 b44 )
    ( on b682 b337 )
    ( on b487 b682 )
    ( on b720 b487 )
    ( on b825 b720 )
    ( on b61 b825 )
    ( on b761 b61 )
    ( on b776 b761 )
    ( on b267 b776 )
    ( on b827 b267 )
    ( on b846 b827 )
    ( on b32 b846 )
    ( on b663 b32 )
    ( on b63 b663 )
    ( on b837 b63 )
    ( on b265 b837 )
    ( on b523 b265 )
    ( on b241 b523 )
    ( on b649 b241 )
    ( on b590 b649 )
    ( on b486 b590 )
    ( on b391 b486 )
    ( on b862 b391 )
    ( on b113 b862 )
    ( clear b113 )
  )
  ( :goal
    ( and
      ( clear b919 )
    )
  )
)
