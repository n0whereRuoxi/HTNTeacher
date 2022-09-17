( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b729 - block
    b703 - block
    b516 - block
    b585 - block
    b941 - block
    b739 - block
    b230 - block
    b242 - block
    b710 - block
    b926 - block
    b133 - block
    b856 - block
    b609 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b729 )
    ( on b703 b729 )
    ( on b516 b703 )
    ( on b585 b516 )
    ( on b941 b585 )
    ( on b739 b941 )
    ( on b230 b739 )
    ( on b242 b230 )
    ( on b710 b242 )
    ( on b926 b710 )
    ( on b133 b926 )
    ( on b856 b133 )
    ( on b609 b856 )
    ( on b461 b609 )
    ( clear b461 )
  )
  ( :tasks
    ( Make-13Pile b703 b516 b585 b941 b739 b230 b242 b710 b926 b133 b856 b609 b461 )
  )
)
