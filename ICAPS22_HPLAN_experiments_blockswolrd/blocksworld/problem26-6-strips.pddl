( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b450 - block
    b890 - block
    b423 - block
    b600 - block
    b912 - block
    b664 - block
    b93 - block
    b464 - block
    b77 - block
    b16 - block
    b570 - block
    b329 - block
    b636 - block
    b90 - block
    b729 - block
    b155 - block
    b409 - block
    b501 - block
    b183 - block
    b252 - block
    b475 - block
    b81 - block
    b445 - block
    b396 - block
    b108 - block
    b272 - block
    b347 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b450 )
    ( on b890 b450 )
    ( on b423 b890 )
    ( on b600 b423 )
    ( on b912 b600 )
    ( on b664 b912 )
    ( on b93 b664 )
    ( on b464 b93 )
    ( on b77 b464 )
    ( on b16 b77 )
    ( on b570 b16 )
    ( on b329 b570 )
    ( on b636 b329 )
    ( on b90 b636 )
    ( on b729 b90 )
    ( on b155 b729 )
    ( on b409 b155 )
    ( on b501 b409 )
    ( on b183 b501 )
    ( on b252 b183 )
    ( on b475 b252 )
    ( on b81 b475 )
    ( on b445 b81 )
    ( on b396 b445 )
    ( on b108 b396 )
    ( on b272 b108 )
    ( on b347 b272 )
    ( clear b347 )
  )
  ( :goal
    ( and
      ( clear b450 )
    )
  )
)
