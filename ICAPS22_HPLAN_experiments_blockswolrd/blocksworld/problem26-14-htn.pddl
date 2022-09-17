( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b320 - block
    b442 - block
    b511 - block
    b577 - block
    b856 - block
    b873 - block
    b373 - block
    b8 - block
    b215 - block
    b34 - block
    b736 - block
    b227 - block
    b749 - block
    b765 - block
    b252 - block
    b612 - block
    b318 - block
    b241 - block
    b820 - block
    b44 - block
    b565 - block
    b585 - block
    b597 - block
    b986 - block
    b16 - block
    b353 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b442 b320 )
    ( on b511 b442 )
    ( on b577 b511 )
    ( on b856 b577 )
    ( on b873 b856 )
    ( on b373 b873 )
    ( on b8 b373 )
    ( on b215 b8 )
    ( on b34 b215 )
    ( on b736 b34 )
    ( on b227 b736 )
    ( on b749 b227 )
    ( on b765 b749 )
    ( on b252 b765 )
    ( on b612 b252 )
    ( on b318 b612 )
    ( on b241 b318 )
    ( on b820 b241 )
    ( on b44 b820 )
    ( on b565 b44 )
    ( on b585 b565 )
    ( on b597 b585 )
    ( on b986 b597 )
    ( on b16 b986 )
    ( on b353 b16 )
    ( on b464 b353 )
    ( clear b464 )
  )
  ( :tasks
    ( Make-26Pile b442 b511 b577 b856 b873 b373 b8 b215 b34 b736 b227 b749 b765 b252 b612 b318 b241 b820 b44 b565 b585 b597 b986 b16 b353 b464 )
  )
)
