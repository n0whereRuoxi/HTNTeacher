( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b884 - block
    b784 - block
    b23 - block
    b35 - block
    b729 - block
    b92 - block
    b182 - block
    b907 - block
    b880 - block
    b659 - block
    b715 - block
    b443 - block
    b406 - block
    b739 - block
    b440 - block
    b85 - block
    b205 - block
    b473 - block
    b717 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b884 )
    ( on b784 b884 )
    ( on b23 b784 )
    ( on b35 b23 )
    ( on b729 b35 )
    ( on b92 b729 )
    ( on b182 b92 )
    ( on b907 b182 )
    ( on b880 b907 )
    ( on b659 b880 )
    ( on b715 b659 )
    ( on b443 b715 )
    ( on b406 b443 )
    ( on b739 b406 )
    ( on b440 b739 )
    ( on b85 b440 )
    ( on b205 b85 )
    ( on b473 b205 )
    ( on b717 b473 )
    ( clear b717 )
  )
  ( :goal
    ( and
      ( clear b884 )
    )
  )
)
