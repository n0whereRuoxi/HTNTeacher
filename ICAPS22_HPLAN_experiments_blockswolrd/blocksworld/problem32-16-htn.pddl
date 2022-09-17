( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b472 - block
    b635 - block
    b824 - block
    b355 - block
    b38 - block
    b695 - block
    b953 - block
    b138 - block
    b733 - block
    b787 - block
    b880 - block
    b291 - block
    b371 - block
    b260 - block
    b357 - block
    b895 - block
    b367 - block
    b565 - block
    b622 - block
    b933 - block
    b74 - block
    b579 - block
    b444 - block
    b468 - block
    b617 - block
    b352 - block
    b5 - block
    b743 - block
    b26 - block
    b710 - block
    b141 - block
    b451 - block
    b646 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b472 )
    ( on b635 b472 )
    ( on b824 b635 )
    ( on b355 b824 )
    ( on b38 b355 )
    ( on b695 b38 )
    ( on b953 b695 )
    ( on b138 b953 )
    ( on b733 b138 )
    ( on b787 b733 )
    ( on b880 b787 )
    ( on b291 b880 )
    ( on b371 b291 )
    ( on b260 b371 )
    ( on b357 b260 )
    ( on b895 b357 )
    ( on b367 b895 )
    ( on b565 b367 )
    ( on b622 b565 )
    ( on b933 b622 )
    ( on b74 b933 )
    ( on b579 b74 )
    ( on b444 b579 )
    ( on b468 b444 )
    ( on b617 b468 )
    ( on b352 b617 )
    ( on b5 b352 )
    ( on b743 b5 )
    ( on b26 b743 )
    ( on b710 b26 )
    ( on b141 b710 )
    ( on b451 b141 )
    ( on b646 b451 )
    ( clear b646 )
  )
  ( :tasks
    ( Make-32Pile b635 b824 b355 b38 b695 b953 b138 b733 b787 b880 b291 b371 b260 b357 b895 b367 b565 b622 b933 b74 b579 b444 b468 b617 b352 b5 b743 b26 b710 b141 b451 b646 )
  )
)
