( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b835 - block
    b444 - block
    b455 - block
    b815 - block
    b966 - block
    b448 - block
    b116 - block
    b726 - block
    b217 - block
    b486 - block
    b101 - block
    b823 - block
    b793 - block
    b879 - block
    b764 - block
    b129 - block
    b495 - block
    b167 - block
    b358 - block
    b255 - block
    b250 - block
    b218 - block
    b936 - block
    b404 - block
    b639 - block
    b868 - block
    b47 - block
    b633 - block
    b848 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b835 )
    ( on b444 b835 )
    ( on b455 b444 )
    ( on b815 b455 )
    ( on b966 b815 )
    ( on b448 b966 )
    ( on b116 b448 )
    ( on b726 b116 )
    ( on b217 b726 )
    ( on b486 b217 )
    ( on b101 b486 )
    ( on b823 b101 )
    ( on b793 b823 )
    ( on b879 b793 )
    ( on b764 b879 )
    ( on b129 b764 )
    ( on b495 b129 )
    ( on b167 b495 )
    ( on b358 b167 )
    ( on b255 b358 )
    ( on b250 b255 )
    ( on b218 b250 )
    ( on b936 b218 )
    ( on b404 b936 )
    ( on b639 b404 )
    ( on b868 b639 )
    ( on b47 b868 )
    ( on b633 b47 )
    ( on b848 b633 )
    ( clear b848 )
  )
  ( :tasks
    ( Make-28Pile b444 b455 b815 b966 b448 b116 b726 b217 b486 b101 b823 b793 b879 b764 b129 b495 b167 b358 b255 b250 b218 b936 b404 b639 b868 b47 b633 b848 )
  )
)
