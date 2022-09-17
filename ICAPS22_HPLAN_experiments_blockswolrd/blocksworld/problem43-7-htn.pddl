( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b552 - block
    b680 - block
    b688 - block
    b691 - block
    b999 - block
    b792 - block
    b52 - block
    b831 - block
    b993 - block
    b761 - block
    b704 - block
    b472 - block
    b766 - block
    b590 - block
    b524 - block
    b296 - block
    b720 - block
    b970 - block
    b770 - block
    b746 - block
    b571 - block
    b584 - block
    b170 - block
    b825 - block
    b214 - block
    b848 - block
    b305 - block
    b29 - block
    b259 - block
    b853 - block
    b356 - block
    b752 - block
    b233 - block
    b600 - block
    b686 - block
    b64 - block
    b593 - block
    b988 - block
    b634 - block
    b31 - block
    b949 - block
    b823 - block
    b936 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b680 b552 )
    ( on b688 b680 )
    ( on b691 b688 )
    ( on b999 b691 )
    ( on b792 b999 )
    ( on b52 b792 )
    ( on b831 b52 )
    ( on b993 b831 )
    ( on b761 b993 )
    ( on b704 b761 )
    ( on b472 b704 )
    ( on b766 b472 )
    ( on b590 b766 )
    ( on b524 b590 )
    ( on b296 b524 )
    ( on b720 b296 )
    ( on b970 b720 )
    ( on b770 b970 )
    ( on b746 b770 )
    ( on b571 b746 )
    ( on b584 b571 )
    ( on b170 b584 )
    ( on b825 b170 )
    ( on b214 b825 )
    ( on b848 b214 )
    ( on b305 b848 )
    ( on b29 b305 )
    ( on b259 b29 )
    ( on b853 b259 )
    ( on b356 b853 )
    ( on b752 b356 )
    ( on b233 b752 )
    ( on b600 b233 )
    ( on b686 b600 )
    ( on b64 b686 )
    ( on b593 b64 )
    ( on b988 b593 )
    ( on b634 b988 )
    ( on b31 b634 )
    ( on b949 b31 )
    ( on b823 b949 )
    ( on b936 b823 )
    ( on b916 b936 )
    ( clear b916 )
  )
  ( :tasks
    ( Make-43Pile b680 b688 b691 b999 b792 b52 b831 b993 b761 b704 b472 b766 b590 b524 b296 b720 b970 b770 b746 b571 b584 b170 b825 b214 b848 b305 b29 b259 b853 b356 b752 b233 b600 b686 b64 b593 b988 b634 b31 b949 b823 b936 b916 )
  )
)
