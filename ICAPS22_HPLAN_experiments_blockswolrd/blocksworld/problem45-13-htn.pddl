( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b360 - block
    b648 - block
    b554 - block
    b138 - block
    b914 - block
    b553 - block
    b334 - block
    b460 - block
    b647 - block
    b713 - block
    b508 - block
    b417 - block
    b675 - block
    b372 - block
    b311 - block
    b483 - block
    b835 - block
    b610 - block
    b70 - block
    b827 - block
    b331 - block
    b768 - block
    b953 - block
    b343 - block
    b249 - block
    b839 - block
    b870 - block
    b611 - block
    b954 - block
    b127 - block
    b787 - block
    b538 - block
    b869 - block
    b430 - block
    b568 - block
    b394 - block
    b756 - block
    b558 - block
    b982 - block
    b532 - block
    b39 - block
    b494 - block
    b274 - block
    b461 - block
    b93 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b360 )
    ( on b648 b360 )
    ( on b554 b648 )
    ( on b138 b554 )
    ( on b914 b138 )
    ( on b553 b914 )
    ( on b334 b553 )
    ( on b460 b334 )
    ( on b647 b460 )
    ( on b713 b647 )
    ( on b508 b713 )
    ( on b417 b508 )
    ( on b675 b417 )
    ( on b372 b675 )
    ( on b311 b372 )
    ( on b483 b311 )
    ( on b835 b483 )
    ( on b610 b835 )
    ( on b70 b610 )
    ( on b827 b70 )
    ( on b331 b827 )
    ( on b768 b331 )
    ( on b953 b768 )
    ( on b343 b953 )
    ( on b249 b343 )
    ( on b839 b249 )
    ( on b870 b839 )
    ( on b611 b870 )
    ( on b954 b611 )
    ( on b127 b954 )
    ( on b787 b127 )
    ( on b538 b787 )
    ( on b869 b538 )
    ( on b430 b869 )
    ( on b568 b430 )
    ( on b394 b568 )
    ( on b756 b394 )
    ( on b558 b756 )
    ( on b982 b558 )
    ( on b532 b982 )
    ( on b39 b532 )
    ( on b494 b39 )
    ( on b274 b494 )
    ( on b461 b274 )
    ( on b93 b461 )
    ( on b416 b93 )
    ( clear b416 )
  )
  ( :tasks
    ( Make-45Pile b648 b554 b138 b914 b553 b334 b460 b647 b713 b508 b417 b675 b372 b311 b483 b835 b610 b70 b827 b331 b768 b953 b343 b249 b839 b870 b611 b954 b127 b787 b538 b869 b430 b568 b394 b756 b558 b982 b532 b39 b494 b274 b461 b93 b416 )
  )
)
