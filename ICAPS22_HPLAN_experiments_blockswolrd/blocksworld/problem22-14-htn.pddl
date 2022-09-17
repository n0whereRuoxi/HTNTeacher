( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b688 - block
    b916 - block
    b892 - block
    b660 - block
    b51 - block
    b509 - block
    b966 - block
    b313 - block
    b369 - block
    b810 - block
    b91 - block
    b695 - block
    b675 - block
    b829 - block
    b871 - block
    b1 - block
    b384 - block
    b175 - block
    b94 - block
    b722 - block
    b755 - block
    b617 - block
    b691 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b688 )
    ( on b916 b688 )
    ( on b892 b916 )
    ( on b660 b892 )
    ( on b51 b660 )
    ( on b509 b51 )
    ( on b966 b509 )
    ( on b313 b966 )
    ( on b369 b313 )
    ( on b810 b369 )
    ( on b91 b810 )
    ( on b695 b91 )
    ( on b675 b695 )
    ( on b829 b675 )
    ( on b871 b829 )
    ( on b1 b871 )
    ( on b384 b1 )
    ( on b175 b384 )
    ( on b94 b175 )
    ( on b722 b94 )
    ( on b755 b722 )
    ( on b617 b755 )
    ( on b691 b617 )
    ( clear b691 )
  )
  ( :tasks
    ( Make-22Pile b916 b892 b660 b51 b509 b966 b313 b369 b810 b91 b695 b675 b829 b871 b1 b384 b175 b94 b722 b755 b617 b691 )
  )
)
