( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b501 - block
    b346 - block
    b516 - block
    b993 - block
    b322 - block
    b557 - block
    b613 - block
    b353 - block
    b134 - block
    b755 - block
    b438 - block
    b351 - block
    b982 - block
    b306 - block
    b381 - block
    b433 - block
    b178 - block
    b301 - block
    b753 - block
    b463 - block
    b981 - block
    b258 - block
    b136 - block
    b559 - block
    b666 - block
    b898 - block
    b827 - block
    b635 - block
    b343 - block
    b664 - block
    b720 - block
    b908 - block
    b239 - block
    b729 - block
    b513 - block
    b160 - block
    b300 - block
    b649 - block
    b699 - block
    b743 - block
    b355 - block
    b579 - block
    b890 - block
    b427 - block
    b703 - block
    b623 - block
    b303 - block
    b150 - block
    b932 - block
    b45 - block
    b968 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b501 )
    ( on b346 b501 )
    ( on b516 b346 )
    ( on b993 b516 )
    ( on b322 b993 )
    ( on b557 b322 )
    ( on b613 b557 )
    ( on b353 b613 )
    ( on b134 b353 )
    ( on b755 b134 )
    ( on b438 b755 )
    ( on b351 b438 )
    ( on b982 b351 )
    ( on b306 b982 )
    ( on b381 b306 )
    ( on b433 b381 )
    ( on b178 b433 )
    ( on b301 b178 )
    ( on b753 b301 )
    ( on b463 b753 )
    ( on b981 b463 )
    ( on b258 b981 )
    ( on b136 b258 )
    ( on b559 b136 )
    ( on b666 b559 )
    ( on b898 b666 )
    ( on b827 b898 )
    ( on b635 b827 )
    ( on b343 b635 )
    ( on b664 b343 )
    ( on b720 b664 )
    ( on b908 b720 )
    ( on b239 b908 )
    ( on b729 b239 )
    ( on b513 b729 )
    ( on b160 b513 )
    ( on b300 b160 )
    ( on b649 b300 )
    ( on b699 b649 )
    ( on b743 b699 )
    ( on b355 b743 )
    ( on b579 b355 )
    ( on b890 b579 )
    ( on b427 b890 )
    ( on b703 b427 )
    ( on b623 b703 )
    ( on b303 b623 )
    ( on b150 b303 )
    ( on b932 b150 )
    ( on b45 b932 )
    ( on b968 b45 )
    ( clear b968 )
  )
  ( :tasks
    ( Make-50Pile b346 b516 b993 b322 b557 b613 b353 b134 b755 b438 b351 b982 b306 b381 b433 b178 b301 b753 b463 b981 b258 b136 b559 b666 b898 b827 b635 b343 b664 b720 b908 b239 b729 b513 b160 b300 b649 b699 b743 b355 b579 b890 b427 b703 b623 b303 b150 b932 b45 b968 )
  )
)
