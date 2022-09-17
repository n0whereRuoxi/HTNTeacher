( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b564 - block
    b240 - block
    b826 - block
    b253 - block
    b236 - block
    b846 - block
    b275 - block
    b972 - block
    b36 - block
    b980 - block
    b52 - block
    b592 - block
    b937 - block
    b963 - block
    b121 - block
    b74 - block
    b437 - block
    b458 - block
    b310 - block
    b152 - block
    b216 - block
    b792 - block
    b516 - block
    b140 - block
    b6 - block
    b35 - block
    b721 - block
    b529 - block
    b730 - block
    b546 - block
    b358 - block
    b296 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b564 )
    ( on b240 b564 )
    ( on b826 b240 )
    ( on b253 b826 )
    ( on b236 b253 )
    ( on b846 b236 )
    ( on b275 b846 )
    ( on b972 b275 )
    ( on b36 b972 )
    ( on b980 b36 )
    ( on b52 b980 )
    ( on b592 b52 )
    ( on b937 b592 )
    ( on b963 b937 )
    ( on b121 b963 )
    ( on b74 b121 )
    ( on b437 b74 )
    ( on b458 b437 )
    ( on b310 b458 )
    ( on b152 b310 )
    ( on b216 b152 )
    ( on b792 b216 )
    ( on b516 b792 )
    ( on b140 b516 )
    ( on b6 b140 )
    ( on b35 b6 )
    ( on b721 b35 )
    ( on b529 b721 )
    ( on b730 b529 )
    ( on b546 b730 )
    ( on b358 b546 )
    ( on b296 b358 )
    ( clear b296 )
  )
  ( :tasks
    ( Make-31Pile b240 b826 b253 b236 b846 b275 b972 b36 b980 b52 b592 b937 b963 b121 b74 b437 b458 b310 b152 b216 b792 b516 b140 b6 b35 b721 b529 b730 b546 b358 b296 )
  )
)
