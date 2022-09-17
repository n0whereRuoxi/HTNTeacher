( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b558 - block
    b674 - block
    b648 - block
    b966 - block
    b860 - block
    b929 - block
    b830 - block
    b749 - block
    b826 - block
    b915 - block
    b762 - block
    b997 - block
    b535 - block
    b865 - block
    b102 - block
    b642 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b558 )
    ( on b674 b558 )
    ( on b648 b674 )
    ( on b966 b648 )
    ( on b860 b966 )
    ( on b929 b860 )
    ( on b830 b929 )
    ( on b749 b830 )
    ( on b826 b749 )
    ( on b915 b826 )
    ( on b762 b915 )
    ( on b997 b762 )
    ( on b535 b997 )
    ( on b865 b535 )
    ( on b102 b865 )
    ( on b642 b102 )
    ( on b780 b642 )
    ( clear b780 )
  )
  ( :tasks
    ( Make-16Pile b674 b648 b966 b860 b929 b830 b749 b826 b915 b762 b997 b535 b865 b102 b642 b780 )
  )
)
