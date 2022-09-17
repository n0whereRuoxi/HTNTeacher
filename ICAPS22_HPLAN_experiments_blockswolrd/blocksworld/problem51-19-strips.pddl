( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b273 - block
    b926 - block
    b980 - block
    b782 - block
    b847 - block
    b390 - block
    b206 - block
    b663 - block
    b684 - block
    b622 - block
    b495 - block
    b511 - block
    b482 - block
    b277 - block
    b704 - block
    b598 - block
    b864 - block
    b419 - block
    b134 - block
    b114 - block
    b347 - block
    b344 - block
    b536 - block
    b505 - block
    b635 - block
    b186 - block
    b516 - block
    b591 - block
    b248 - block
    b307 - block
    b945 - block
    b774 - block
    b714 - block
    b577 - block
    b289 - block
    b286 - block
    b432 - block
    b560 - block
    b759 - block
    b886 - block
    b161 - block
    b567 - block
    b821 - block
    b575 - block
    b366 - block
    b638 - block
    b468 - block
    b702 - block
    b220 - block
    b77 - block
    b919 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b273 )
    ( on b926 b273 )
    ( on b980 b926 )
    ( on b782 b980 )
    ( on b847 b782 )
    ( on b390 b847 )
    ( on b206 b390 )
    ( on b663 b206 )
    ( on b684 b663 )
    ( on b622 b684 )
    ( on b495 b622 )
    ( on b511 b495 )
    ( on b482 b511 )
    ( on b277 b482 )
    ( on b704 b277 )
    ( on b598 b704 )
    ( on b864 b598 )
    ( on b419 b864 )
    ( on b134 b419 )
    ( on b114 b134 )
    ( on b347 b114 )
    ( on b344 b347 )
    ( on b536 b344 )
    ( on b505 b536 )
    ( on b635 b505 )
    ( on b186 b635 )
    ( on b516 b186 )
    ( on b591 b516 )
    ( on b248 b591 )
    ( on b307 b248 )
    ( on b945 b307 )
    ( on b774 b945 )
    ( on b714 b774 )
    ( on b577 b714 )
    ( on b289 b577 )
    ( on b286 b289 )
    ( on b432 b286 )
    ( on b560 b432 )
    ( on b759 b560 )
    ( on b886 b759 )
    ( on b161 b886 )
    ( on b567 b161 )
    ( on b821 b567 )
    ( on b575 b821 )
    ( on b366 b575 )
    ( on b638 b366 )
    ( on b468 b638 )
    ( on b702 b468 )
    ( on b220 b702 )
    ( on b77 b220 )
    ( on b919 b77 )
    ( on b49 b919 )
    ( clear b49 )
  )
  ( :goal
    ( and
      ( clear b273 )
    )
  )
)
