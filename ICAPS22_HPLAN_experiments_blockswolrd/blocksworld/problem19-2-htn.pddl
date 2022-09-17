( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b772 - block
    b158 - block
    b719 - block
    b893 - block
    b683 - block
    b53 - block
    b542 - block
    b645 - block
    b115 - block
    b823 - block
    b100 - block
    b849 - block
    b727 - block
    b140 - block
    b782 - block
    b334 - block
    b723 - block
    b994 - block
    b822 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b158 b772 )
    ( on b719 b158 )
    ( on b893 b719 )
    ( on b683 b893 )
    ( on b53 b683 )
    ( on b542 b53 )
    ( on b645 b542 )
    ( on b115 b645 )
    ( on b823 b115 )
    ( on b100 b823 )
    ( on b849 b100 )
    ( on b727 b849 )
    ( on b140 b727 )
    ( on b782 b140 )
    ( on b334 b782 )
    ( on b723 b334 )
    ( on b994 b723 )
    ( on b822 b994 )
    ( on b287 b822 )
    ( clear b287 )
  )
  ( :tasks
    ( Make-19Pile b158 b719 b893 b683 b53 b542 b645 b115 b823 b100 b849 b727 b140 b782 b334 b723 b994 b822 b287 )
  )
)
