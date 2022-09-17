( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b984 - block
    b238 - block
    b613 - block
    b968 - block
    b583 - block
    b961 - block
    b515 - block
    b767 - block
    b936 - block
    b481 - block
    b433 - block
    b219 - block
    b834 - block
    b960 - block
    b77 - block
    b753 - block
    b45 - block
    b369 - block
    b640 - block
    b138 - block
    b572 - block
    b325 - block
    b366 - block
    b374 - block
    b617 - block
    b895 - block
    b994 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b984 )
    ( on b238 b984 )
    ( on b613 b238 )
    ( on b968 b613 )
    ( on b583 b968 )
    ( on b961 b583 )
    ( on b515 b961 )
    ( on b767 b515 )
    ( on b936 b767 )
    ( on b481 b936 )
    ( on b433 b481 )
    ( on b219 b433 )
    ( on b834 b219 )
    ( on b960 b834 )
    ( on b77 b960 )
    ( on b753 b77 )
    ( on b45 b753 )
    ( on b369 b45 )
    ( on b640 b369 )
    ( on b138 b640 )
    ( on b572 b138 )
    ( on b325 b572 )
    ( on b366 b325 )
    ( on b374 b366 )
    ( on b617 b374 )
    ( on b895 b617 )
    ( on b994 b895 )
    ( clear b994 )
  )
  ( :tasks
    ( Make-26Pile b238 b613 b968 b583 b961 b515 b767 b936 b481 b433 b219 b834 b960 b77 b753 b45 b369 b640 b138 b572 b325 b366 b374 b617 b895 b994 )
  )
)
