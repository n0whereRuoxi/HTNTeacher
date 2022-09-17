( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b927 - block
    b842 - block
    b951 - block
    b227 - block
    b293 - block
    b210 - block
    b17 - block
    b211 - block
    b838 - block
    b456 - block
    b363 - block
    b474 - block
    b292 - block
    b755 - block
    b36 - block
    b865 - block
    b372 - block
    b406 - block
    b329 - block
    b403 - block
    b741 - block
    b776 - block
    b598 - block
    b158 - block
    b563 - block
    b618 - block
    b116 - block
    b118 - block
    b79 - block
    b634 - block
    b207 - block
    b189 - block
    b461 - block
    b588 - block
    b263 - block
    b641 - block
    b191 - block
    b609 - block
    b714 - block
    b850 - block
    b123 - block
    b343 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b927 )
    ( on b842 b927 )
    ( on b951 b842 )
    ( on b227 b951 )
    ( on b293 b227 )
    ( on b210 b293 )
    ( on b17 b210 )
    ( on b211 b17 )
    ( on b838 b211 )
    ( on b456 b838 )
    ( on b363 b456 )
    ( on b474 b363 )
    ( on b292 b474 )
    ( on b755 b292 )
    ( on b36 b755 )
    ( on b865 b36 )
    ( on b372 b865 )
    ( on b406 b372 )
    ( on b329 b406 )
    ( on b403 b329 )
    ( on b741 b403 )
    ( on b776 b741 )
    ( on b598 b776 )
    ( on b158 b598 )
    ( on b563 b158 )
    ( on b618 b563 )
    ( on b116 b618 )
    ( on b118 b116 )
    ( on b79 b118 )
    ( on b634 b79 )
    ( on b207 b634 )
    ( on b189 b207 )
    ( on b461 b189 )
    ( on b588 b461 )
    ( on b263 b588 )
    ( on b641 b263 )
    ( on b191 b641 )
    ( on b609 b191 )
    ( on b714 b609 )
    ( on b850 b714 )
    ( on b123 b850 )
    ( on b343 b123 )
    ( on b140 b343 )
    ( clear b140 )
  )
  ( :goal
    ( and
      ( clear b927 )
    )
  )
)
