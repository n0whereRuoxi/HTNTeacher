( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b833 - block
    b795 - block
    b227 - block
    b908 - block
    b441 - block
    b931 - block
    b19 - block
    b725 - block
    b24 - block
    b278 - block
    b539 - block
    b367 - block
    b98 - block
    b128 - block
    b928 - block
    b629 - block
    b885 - block
    b436 - block
    b862 - block
    b647 - block
    b433 - block
    b246 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b833 )
    ( on b795 b833 )
    ( on b227 b795 )
    ( on b908 b227 )
    ( on b441 b908 )
    ( on b931 b441 )
    ( on b19 b931 )
    ( on b725 b19 )
    ( on b24 b725 )
    ( on b278 b24 )
    ( on b539 b278 )
    ( on b367 b539 )
    ( on b98 b367 )
    ( on b128 b98 )
    ( on b928 b128 )
    ( on b629 b928 )
    ( on b885 b629 )
    ( on b436 b885 )
    ( on b862 b436 )
    ( on b647 b862 )
    ( on b433 b647 )
    ( on b246 b433 )
    ( clear b246 )
  )
  ( :tasks
    ( Make-21Pile b795 b227 b908 b441 b931 b19 b725 b24 b278 b539 b367 b98 b128 b928 b629 b885 b436 b862 b647 b433 b246 )
  )
)
