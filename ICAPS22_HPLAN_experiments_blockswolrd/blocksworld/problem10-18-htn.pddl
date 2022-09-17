( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b139 - block
    b979 - block
    b708 - block
    b594 - block
    b520 - block
    b830 - block
    b669 - block
    b121 - block
    b300 - block
    b710 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b139 )
    ( on b979 b139 )
    ( on b708 b979 )
    ( on b594 b708 )
    ( on b520 b594 )
    ( on b830 b520 )
    ( on b669 b830 )
    ( on b121 b669 )
    ( on b300 b121 )
    ( on b710 b300 )
    ( on b698 b710 )
    ( clear b698 )
  )
  ( :tasks
    ( Make-10Pile b979 b708 b594 b520 b830 b669 b121 b300 b710 b698 )
  )
)
