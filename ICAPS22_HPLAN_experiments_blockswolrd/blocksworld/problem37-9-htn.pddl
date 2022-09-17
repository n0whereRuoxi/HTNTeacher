( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b7 - block
    b842 - block
    b21 - block
    b364 - block
    b92 - block
    b634 - block
    b592 - block
    b506 - block
    b944 - block
    b114 - block
    b672 - block
    b747 - block
    b60 - block
    b36 - block
    b473 - block
    b710 - block
    b711 - block
    b607 - block
    b972 - block
    b689 - block
    b773 - block
    b738 - block
    b372 - block
    b66 - block
    b281 - block
    b835 - block
    b595 - block
    b446 - block
    b660 - block
    b341 - block
    b574 - block
    b947 - block
    b266 - block
    b573 - block
    b792 - block
    b82 - block
    b263 - block
    b253 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b842 b7 )
    ( on b21 b842 )
    ( on b364 b21 )
    ( on b92 b364 )
    ( on b634 b92 )
    ( on b592 b634 )
    ( on b506 b592 )
    ( on b944 b506 )
    ( on b114 b944 )
    ( on b672 b114 )
    ( on b747 b672 )
    ( on b60 b747 )
    ( on b36 b60 )
    ( on b473 b36 )
    ( on b710 b473 )
    ( on b711 b710 )
    ( on b607 b711 )
    ( on b972 b607 )
    ( on b689 b972 )
    ( on b773 b689 )
    ( on b738 b773 )
    ( on b372 b738 )
    ( on b66 b372 )
    ( on b281 b66 )
    ( on b835 b281 )
    ( on b595 b835 )
    ( on b446 b595 )
    ( on b660 b446 )
    ( on b341 b660 )
    ( on b574 b341 )
    ( on b947 b574 )
    ( on b266 b947 )
    ( on b573 b266 )
    ( on b792 b573 )
    ( on b82 b792 )
    ( on b263 b82 )
    ( on b253 b263 )
    ( clear b253 )
  )
  ( :tasks
    ( Make-37Pile b842 b21 b364 b92 b634 b592 b506 b944 b114 b672 b747 b60 b36 b473 b710 b711 b607 b972 b689 b773 b738 b372 b66 b281 b835 b595 b446 b660 b341 b574 b947 b266 b573 b792 b82 b263 b253 )
  )
)
