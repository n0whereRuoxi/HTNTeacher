( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b475 - block
    b919 - block
    b547 - block
    b783 - block
    b477 - block
    b569 - block
    b39 - block
    b961 - block
    b355 - block
    b259 - block
    b284 - block
    b332 - block
    b467 - block
    b785 - block
    b505 - block
    b980 - block
    b887 - block
    b575 - block
    b270 - block
    b628 - block
    b281 - block
    b45 - block
    b500 - block
    b729 - block
    b778 - block
    b807 - block
    b257 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b475 )
    ( on b919 b475 )
    ( on b547 b919 )
    ( on b783 b547 )
    ( on b477 b783 )
    ( on b569 b477 )
    ( on b39 b569 )
    ( on b961 b39 )
    ( on b355 b961 )
    ( on b259 b355 )
    ( on b284 b259 )
    ( on b332 b284 )
    ( on b467 b332 )
    ( on b785 b467 )
    ( on b505 b785 )
    ( on b980 b505 )
    ( on b887 b980 )
    ( on b575 b887 )
    ( on b270 b575 )
    ( on b628 b270 )
    ( on b281 b628 )
    ( on b45 b281 )
    ( on b500 b45 )
    ( on b729 b500 )
    ( on b778 b729 )
    ( on b807 b778 )
    ( on b257 b807 )
    ( clear b257 )
  )
  ( :goal
    ( and
      ( clear b475 )
    )
  )
)
