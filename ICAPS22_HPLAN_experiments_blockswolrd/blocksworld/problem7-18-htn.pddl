( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b949 - block
    b237 - block
    b796 - block
    b711 - block
    b240 - block
    b810 - block
    b378 - block
    b677 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b949 )
    ( on b237 b949 )
    ( on b796 b237 )
    ( on b711 b796 )
    ( on b240 b711 )
    ( on b810 b240 )
    ( on b378 b810 )
    ( on b677 b378 )
    ( clear b677 )
  )
  ( :tasks
    ( Make-7Pile b237 b796 b711 b240 b810 b378 b677 )
  )
)
