( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b723 - block
    b580 - block
    b560 - block
    b235 - block
    b471 - block
    b812 - block
    b652 - block
    b518 - block
    b372 - block
    b82 - block
    b823 - block
    b67 - block
    b115 - block
    b848 - block
    b467 - block
    b933 - block
    b100 - block
    b926 - block
    b217 - block
    b37 - block
    b287 - block
    b182 - block
    b247 - block
    b767 - block
    b834 - block
    b121 - block
    b370 - block
    b971 - block
    b84 - block
    b169 - block
    b376 - block
    b638 - block
    b200 - block
    b356 - block
    b708 - block
    b910 - block
    b4 - block
    b242 - block
    b279 - block
    b712 - block
    b761 - block
    b225 - block
    b105 - block
    b422 - block
    b693 - block
    b186 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b580 b723 )
    ( on b560 b580 )
    ( on b235 b560 )
    ( on b471 b235 )
    ( on b812 b471 )
    ( on b652 b812 )
    ( on b518 b652 )
    ( on b372 b518 )
    ( on b82 b372 )
    ( on b823 b82 )
    ( on b67 b823 )
    ( on b115 b67 )
    ( on b848 b115 )
    ( on b467 b848 )
    ( on b933 b467 )
    ( on b100 b933 )
    ( on b926 b100 )
    ( on b217 b926 )
    ( on b37 b217 )
    ( on b287 b37 )
    ( on b182 b287 )
    ( on b247 b182 )
    ( on b767 b247 )
    ( on b834 b767 )
    ( on b121 b834 )
    ( on b370 b121 )
    ( on b971 b370 )
    ( on b84 b971 )
    ( on b169 b84 )
    ( on b376 b169 )
    ( on b638 b376 )
    ( on b200 b638 )
    ( on b356 b200 )
    ( on b708 b356 )
    ( on b910 b708 )
    ( on b4 b910 )
    ( on b242 b4 )
    ( on b279 b242 )
    ( on b712 b279 )
    ( on b761 b712 )
    ( on b225 b761 )
    ( on b105 b225 )
    ( on b422 b105 )
    ( on b693 b422 )
    ( on b186 b693 )
    ( clear b186 )
  )
  ( :tasks
    ( Make-45Pile b580 b560 b235 b471 b812 b652 b518 b372 b82 b823 b67 b115 b848 b467 b933 b100 b926 b217 b37 b287 b182 b247 b767 b834 b121 b370 b971 b84 b169 b376 b638 b200 b356 b708 b910 b4 b242 b279 b712 b761 b225 b105 b422 b693 b186 )
  )
)
