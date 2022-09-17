( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b992 - block
    b780 - block
    b511 - block
    b973 - block
    b30 - block
    b766 - block
    b117 - block
    b907 - block
    b905 - block
    b991 - block
    b168 - block
    b8 - block
    b297 - block
    b717 - block
    b987 - block
    b791 - block
    b989 - block
    b520 - block
    b67 - block
    b543 - block
    b372 - block
    b691 - block
    b64 - block
    b530 - block
    b478 - block
    b196 - block
    b556 - block
    b651 - block
    b970 - block
    b537 - block
    b442 - block
    b20 - block
    b103 - block
    b74 - block
    b917 - block
    b123 - block
    b963 - block
    b782 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b992 )
    ( on b780 b992 )
    ( on b511 b780 )
    ( on b973 b511 )
    ( on b30 b973 )
    ( on b766 b30 )
    ( on b117 b766 )
    ( on b907 b117 )
    ( on b905 b907 )
    ( on b991 b905 )
    ( on b168 b991 )
    ( on b8 b168 )
    ( on b297 b8 )
    ( on b717 b297 )
    ( on b987 b717 )
    ( on b791 b987 )
    ( on b989 b791 )
    ( on b520 b989 )
    ( on b67 b520 )
    ( on b543 b67 )
    ( on b372 b543 )
    ( on b691 b372 )
    ( on b64 b691 )
    ( on b530 b64 )
    ( on b478 b530 )
    ( on b196 b478 )
    ( on b556 b196 )
    ( on b651 b556 )
    ( on b970 b651 )
    ( on b537 b970 )
    ( on b442 b537 )
    ( on b20 b442 )
    ( on b103 b20 )
    ( on b74 b103 )
    ( on b917 b74 )
    ( on b123 b917 )
    ( on b963 b123 )
    ( on b782 b963 )
    ( clear b782 )
  )
  ( :goal
    ( and
      ( clear b992 )
    )
  )
)
