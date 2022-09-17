( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b227 - block
    b895 - block
    b772 - block
    b194 - block
    b187 - block
    b151 - block
    b159 - block
    b111 - block
    b640 - block
    b141 - block
    b493 - block
    b956 - block
    b330 - block
    b190 - block
    b168 - block
    b533 - block
    b413 - block
    b45 - block
    b588 - block
    b510 - block
    b827 - block
    b865 - block
    b906 - block
    b435 - block
    b4 - block
    b984 - block
    b467 - block
    b448 - block
    b631 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b227 )
    ( on b895 b227 )
    ( on b772 b895 )
    ( on b194 b772 )
    ( on b187 b194 )
    ( on b151 b187 )
    ( on b159 b151 )
    ( on b111 b159 )
    ( on b640 b111 )
    ( on b141 b640 )
    ( on b493 b141 )
    ( on b956 b493 )
    ( on b330 b956 )
    ( on b190 b330 )
    ( on b168 b190 )
    ( on b533 b168 )
    ( on b413 b533 )
    ( on b45 b413 )
    ( on b588 b45 )
    ( on b510 b588 )
    ( on b827 b510 )
    ( on b865 b827 )
    ( on b906 b865 )
    ( on b435 b906 )
    ( on b4 b435 )
    ( on b984 b4 )
    ( on b467 b984 )
    ( on b448 b467 )
    ( on b631 b448 )
    ( clear b631 )
  )
  ( :goal
    ( and
      ( clear b227 )
    )
  )
)
