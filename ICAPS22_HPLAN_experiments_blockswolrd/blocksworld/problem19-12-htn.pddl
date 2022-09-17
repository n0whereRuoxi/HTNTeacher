( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b37 - block
    b450 - block
    b955 - block
    b139 - block
    b791 - block
    b159 - block
    b677 - block
    b767 - block
    b41 - block
    b753 - block
    b572 - block
    b654 - block
    b443 - block
    b375 - block
    b99 - block
    b718 - block
    b7 - block
    b807 - block
    b769 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b37 )
    ( on b450 b37 )
    ( on b955 b450 )
    ( on b139 b955 )
    ( on b791 b139 )
    ( on b159 b791 )
    ( on b677 b159 )
    ( on b767 b677 )
    ( on b41 b767 )
    ( on b753 b41 )
    ( on b572 b753 )
    ( on b654 b572 )
    ( on b443 b654 )
    ( on b375 b443 )
    ( on b99 b375 )
    ( on b718 b99 )
    ( on b7 b718 )
    ( on b807 b7 )
    ( on b769 b807 )
    ( on b731 b769 )
    ( clear b731 )
  )
  ( :tasks
    ( Make-19Pile b450 b955 b139 b791 b159 b677 b767 b41 b753 b572 b654 b443 b375 b99 b718 b7 b807 b769 b731 )
  )
)
