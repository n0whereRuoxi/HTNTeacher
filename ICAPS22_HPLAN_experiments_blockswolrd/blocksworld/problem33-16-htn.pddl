( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b952 - block
    b355 - block
    b579 - block
    b551 - block
    b497 - block
    b609 - block
    b305 - block
    b506 - block
    b960 - block
    b335 - block
    b208 - block
    b854 - block
    b26 - block
    b886 - block
    b900 - block
    b203 - block
    b51 - block
    b445 - block
    b823 - block
    b800 - block
    b260 - block
    b775 - block
    b858 - block
    b345 - block
    b74 - block
    b956 - block
    b711 - block
    b232 - block
    b829 - block
    b307 - block
    b309 - block
    b899 - block
    b106 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b952 )
    ( on b355 b952 )
    ( on b579 b355 )
    ( on b551 b579 )
    ( on b497 b551 )
    ( on b609 b497 )
    ( on b305 b609 )
    ( on b506 b305 )
    ( on b960 b506 )
    ( on b335 b960 )
    ( on b208 b335 )
    ( on b854 b208 )
    ( on b26 b854 )
    ( on b886 b26 )
    ( on b900 b886 )
    ( on b203 b900 )
    ( on b51 b203 )
    ( on b445 b51 )
    ( on b823 b445 )
    ( on b800 b823 )
    ( on b260 b800 )
    ( on b775 b260 )
    ( on b858 b775 )
    ( on b345 b858 )
    ( on b74 b345 )
    ( on b956 b74 )
    ( on b711 b956 )
    ( on b232 b711 )
    ( on b829 b232 )
    ( on b307 b829 )
    ( on b309 b307 )
    ( on b899 b309 )
    ( on b106 b899 )
    ( on b874 b106 )
    ( clear b874 )
  )
  ( :tasks
    ( Make-33Pile b355 b579 b551 b497 b609 b305 b506 b960 b335 b208 b854 b26 b886 b900 b203 b51 b445 b823 b800 b260 b775 b858 b345 b74 b956 b711 b232 b829 b307 b309 b899 b106 b874 )
  )
)
