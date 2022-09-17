( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b168 - block
    b611 - block
    b657 - block
    b54 - block
    b17 - block
    b509 - block
    b55 - block
    b726 - block
    b805 - block
    b627 - block
    b580 - block
    b917 - block
    b928 - block
    b64 - block
    b211 - block
    b729 - block
    b86 - block
    b476 - block
    b692 - block
    b774 - block
    b315 - block
    b921 - block
    b979 - block
    b192 - block
    b892 - block
    b679 - block
    b232 - block
    b641 - block
    b343 - block
    b189 - block
    b88 - block
    b460 - block
    b646 - block
    b593 - block
    b617 - block
    b332 - block
    b396 - block
    b426 - block
    b198 - block
    b513 - block
    b487 - block
    b344 - block
    b814 - block
    b980 - block
    b749 - block
    b225 - block
    b912 - block
    b586 - block
    b608 - block
    b649 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b611 b168 )
    ( on b657 b611 )
    ( on b54 b657 )
    ( on b17 b54 )
    ( on b509 b17 )
    ( on b55 b509 )
    ( on b726 b55 )
    ( on b805 b726 )
    ( on b627 b805 )
    ( on b580 b627 )
    ( on b917 b580 )
    ( on b928 b917 )
    ( on b64 b928 )
    ( on b211 b64 )
    ( on b729 b211 )
    ( on b86 b729 )
    ( on b476 b86 )
    ( on b692 b476 )
    ( on b774 b692 )
    ( on b315 b774 )
    ( on b921 b315 )
    ( on b979 b921 )
    ( on b192 b979 )
    ( on b892 b192 )
    ( on b679 b892 )
    ( on b232 b679 )
    ( on b641 b232 )
    ( on b343 b641 )
    ( on b189 b343 )
    ( on b88 b189 )
    ( on b460 b88 )
    ( on b646 b460 )
    ( on b593 b646 )
    ( on b617 b593 )
    ( on b332 b617 )
    ( on b396 b332 )
    ( on b426 b396 )
    ( on b198 b426 )
    ( on b513 b198 )
    ( on b487 b513 )
    ( on b344 b487 )
    ( on b814 b344 )
    ( on b980 b814 )
    ( on b749 b980 )
    ( on b225 b749 )
    ( on b912 b225 )
    ( on b586 b912 )
    ( on b608 b586 )
    ( on b649 b608 )
    ( on b397 b649 )
    ( clear b397 )
  )
  ( :goal
    ( and
      ( clear b168 )
    )
  )
)
