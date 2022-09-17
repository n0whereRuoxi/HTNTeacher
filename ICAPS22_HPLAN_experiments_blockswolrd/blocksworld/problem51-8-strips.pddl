( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b114 - block
    b837 - block
    b903 - block
    b86 - block
    b97 - block
    b938 - block
    b505 - block
    b437 - block
    b462 - block
    b90 - block
    b782 - block
    b624 - block
    b695 - block
    b83 - block
    b614 - block
    b61 - block
    b95 - block
    b137 - block
    b265 - block
    b430 - block
    b176 - block
    b405 - block
    b906 - block
    b582 - block
    b803 - block
    b440 - block
    b129 - block
    b211 - block
    b411 - block
    b290 - block
    b192 - block
    b45 - block
    b651 - block
    b253 - block
    b115 - block
    b378 - block
    b416 - block
    b229 - block
    b593 - block
    b375 - block
    b42 - block
    b204 - block
    b333 - block
    b670 - block
    b929 - block
    b471 - block
    b768 - block
    b445 - block
    b480 - block
    b128 - block
    b27 - block
    b900 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b114 )
    ( on b837 b114 )
    ( on b903 b837 )
    ( on b86 b903 )
    ( on b97 b86 )
    ( on b938 b97 )
    ( on b505 b938 )
    ( on b437 b505 )
    ( on b462 b437 )
    ( on b90 b462 )
    ( on b782 b90 )
    ( on b624 b782 )
    ( on b695 b624 )
    ( on b83 b695 )
    ( on b614 b83 )
    ( on b61 b614 )
    ( on b95 b61 )
    ( on b137 b95 )
    ( on b265 b137 )
    ( on b430 b265 )
    ( on b176 b430 )
    ( on b405 b176 )
    ( on b906 b405 )
    ( on b582 b906 )
    ( on b803 b582 )
    ( on b440 b803 )
    ( on b129 b440 )
    ( on b211 b129 )
    ( on b411 b211 )
    ( on b290 b411 )
    ( on b192 b290 )
    ( on b45 b192 )
    ( on b651 b45 )
    ( on b253 b651 )
    ( on b115 b253 )
    ( on b378 b115 )
    ( on b416 b378 )
    ( on b229 b416 )
    ( on b593 b229 )
    ( on b375 b593 )
    ( on b42 b375 )
    ( on b204 b42 )
    ( on b333 b204 )
    ( on b670 b333 )
    ( on b929 b670 )
    ( on b471 b929 )
    ( on b768 b471 )
    ( on b445 b768 )
    ( on b480 b445 )
    ( on b128 b480 )
    ( on b27 b128 )
    ( on b900 b27 )
    ( clear b900 )
  )
  ( :goal
    ( and
      ( clear b114 )
    )
  )
)
