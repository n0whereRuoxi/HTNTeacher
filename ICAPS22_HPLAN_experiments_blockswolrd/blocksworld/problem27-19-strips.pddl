( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b749 - block
    b917 - block
    b815 - block
    b442 - block
    b893 - block
    b93 - block
    b674 - block
    b973 - block
    b678 - block
    b467 - block
    b116 - block
    b851 - block
    b37 - block
    b668 - block
    b326 - block
    b140 - block
    b84 - block
    b932 - block
    b891 - block
    b898 - block
    b665 - block
    b253 - block
    b417 - block
    b621 - block
    b381 - block
    b918 - block
    b233 - block
    b580 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b749 )
    ( on b917 b749 )
    ( on b815 b917 )
    ( on b442 b815 )
    ( on b893 b442 )
    ( on b93 b893 )
    ( on b674 b93 )
    ( on b973 b674 )
    ( on b678 b973 )
    ( on b467 b678 )
    ( on b116 b467 )
    ( on b851 b116 )
    ( on b37 b851 )
    ( on b668 b37 )
    ( on b326 b668 )
    ( on b140 b326 )
    ( on b84 b140 )
    ( on b932 b84 )
    ( on b891 b932 )
    ( on b898 b891 )
    ( on b665 b898 )
    ( on b253 b665 )
    ( on b417 b253 )
    ( on b621 b417 )
    ( on b381 b621 )
    ( on b918 b381 )
    ( on b233 b918 )
    ( on b580 b233 )
    ( clear b580 )
  )
  ( :goal
    ( and
      ( clear b749 )
    )
  )
)
