( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b280 - block
    b2 - block
    b827 - block
    b459 - block
    b443 - block
    b231 - block
    b704 - block
    b221 - block
    b793 - block
    b991 - block
    b561 - block
    b359 - block
    b307 - block
    b310 - block
    b821 - block
    b437 - block
    b122 - block
    b261 - block
    b49 - block
    b999 - block
    b994 - block
    b712 - block
    b160 - block
    b6 - block
    b412 - block
    b30 - block
    b415 - block
    b648 - block
    b269 - block
    b790 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b280 )
    ( on b2 b280 )
    ( on b827 b2 )
    ( on b459 b827 )
    ( on b443 b459 )
    ( on b231 b443 )
    ( on b704 b231 )
    ( on b221 b704 )
    ( on b793 b221 )
    ( on b991 b793 )
    ( on b561 b991 )
    ( on b359 b561 )
    ( on b307 b359 )
    ( on b310 b307 )
    ( on b821 b310 )
    ( on b437 b821 )
    ( on b122 b437 )
    ( on b261 b122 )
    ( on b49 b261 )
    ( on b999 b49 )
    ( on b994 b999 )
    ( on b712 b994 )
    ( on b160 b712 )
    ( on b6 b160 )
    ( on b412 b6 )
    ( on b30 b412 )
    ( on b415 b30 )
    ( on b648 b415 )
    ( on b269 b648 )
    ( on b790 b269 )
    ( clear b790 )
  )
  ( :tasks
    ( Make-29Pile b2 b827 b459 b443 b231 b704 b221 b793 b991 b561 b359 b307 b310 b821 b437 b122 b261 b49 b999 b994 b712 b160 b6 b412 b30 b415 b648 b269 b790 )
  )
)
