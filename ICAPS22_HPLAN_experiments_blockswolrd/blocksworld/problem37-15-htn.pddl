( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b547 - block
    b4 - block
    b298 - block
    b443 - block
    b174 - block
    b168 - block
    b945 - block
    b100 - block
    b157 - block
    b107 - block
    b491 - block
    b562 - block
    b670 - block
    b992 - block
    b568 - block
    b189 - block
    b275 - block
    b881 - block
    b296 - block
    b469 - block
    b647 - block
    b54 - block
    b367 - block
    b37 - block
    b351 - block
    b233 - block
    b668 - block
    b513 - block
    b776 - block
    b452 - block
    b95 - block
    b803 - block
    b666 - block
    b14 - block
    b646 - block
    b81 - block
    b422 - block
    b360 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b547 )
    ( on b4 b547 )
    ( on b298 b4 )
    ( on b443 b298 )
    ( on b174 b443 )
    ( on b168 b174 )
    ( on b945 b168 )
    ( on b100 b945 )
    ( on b157 b100 )
    ( on b107 b157 )
    ( on b491 b107 )
    ( on b562 b491 )
    ( on b670 b562 )
    ( on b992 b670 )
    ( on b568 b992 )
    ( on b189 b568 )
    ( on b275 b189 )
    ( on b881 b275 )
    ( on b296 b881 )
    ( on b469 b296 )
    ( on b647 b469 )
    ( on b54 b647 )
    ( on b367 b54 )
    ( on b37 b367 )
    ( on b351 b37 )
    ( on b233 b351 )
    ( on b668 b233 )
    ( on b513 b668 )
    ( on b776 b513 )
    ( on b452 b776 )
    ( on b95 b452 )
    ( on b803 b95 )
    ( on b666 b803 )
    ( on b14 b666 )
    ( on b646 b14 )
    ( on b81 b646 )
    ( on b422 b81 )
    ( on b360 b422 )
    ( clear b360 )
  )
  ( :tasks
    ( Make-37Pile b4 b298 b443 b174 b168 b945 b100 b157 b107 b491 b562 b670 b992 b568 b189 b275 b881 b296 b469 b647 b54 b367 b37 b351 b233 b668 b513 b776 b452 b95 b803 b666 b14 b646 b81 b422 b360 )
  )
)
