( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b798 - block
    b888 - block
    b40 - block
    b515 - block
    b627 - block
    b963 - block
    b87 - block
    b864 - block
    b648 - block
    b729 - block
    b711 - block
    b891 - block
    b512 - block
    b419 - block
    b134 - block
    b41 - block
    b342 - block
    b969 - block
    b661 - block
    b157 - block
    b163 - block
    b717 - block
    b166 - block
    b139 - block
    b346 - block
    b237 - block
    b356 - block
    b968 - block
    b303 - block
    b71 - block
    b989 - block
    b815 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b888 b798 )
    ( on b40 b888 )
    ( on b515 b40 )
    ( on b627 b515 )
    ( on b963 b627 )
    ( on b87 b963 )
    ( on b864 b87 )
    ( on b648 b864 )
    ( on b729 b648 )
    ( on b711 b729 )
    ( on b891 b711 )
    ( on b512 b891 )
    ( on b419 b512 )
    ( on b134 b419 )
    ( on b41 b134 )
    ( on b342 b41 )
    ( on b969 b342 )
    ( on b661 b969 )
    ( on b157 b661 )
    ( on b163 b157 )
    ( on b717 b163 )
    ( on b166 b717 )
    ( on b139 b166 )
    ( on b346 b139 )
    ( on b237 b346 )
    ( on b356 b237 )
    ( on b968 b356 )
    ( on b303 b968 )
    ( on b71 b303 )
    ( on b989 b71 )
    ( on b815 b989 )
    ( clear b815 )
  )
  ( :tasks
    ( Make-31Pile b888 b40 b515 b627 b963 b87 b864 b648 b729 b711 b891 b512 b419 b134 b41 b342 b969 b661 b157 b163 b717 b166 b139 b346 b237 b356 b968 b303 b71 b989 b815 )
  )
)
