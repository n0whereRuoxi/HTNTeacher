( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b51 - block
    b208 - block
    b933 - block
    b225 - block
    b88 - block
    b376 - block
    b859 - block
    b431 - block
    b203 - block
    b507 - block
    b947 - block
    b17 - block
    b210 - block
    b270 - block
    b927 - block
    b855 - block
    b22 - block
    b215 - block
    b936 - block
    b338 - block
    b261 - block
    b149 - block
    b299 - block
    b816 - block
    b243 - block
    b220 - block
    b544 - block
    b19 - block
    b787 - block
    b806 - block
    b697 - block
    b553 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b51 )
    ( on b208 b51 )
    ( on b933 b208 )
    ( on b225 b933 )
    ( on b88 b225 )
    ( on b376 b88 )
    ( on b859 b376 )
    ( on b431 b859 )
    ( on b203 b431 )
    ( on b507 b203 )
    ( on b947 b507 )
    ( on b17 b947 )
    ( on b210 b17 )
    ( on b270 b210 )
    ( on b927 b270 )
    ( on b855 b927 )
    ( on b22 b855 )
    ( on b215 b22 )
    ( on b936 b215 )
    ( on b338 b936 )
    ( on b261 b338 )
    ( on b149 b261 )
    ( on b299 b149 )
    ( on b816 b299 )
    ( on b243 b816 )
    ( on b220 b243 )
    ( on b544 b220 )
    ( on b19 b544 )
    ( on b787 b19 )
    ( on b806 b787 )
    ( on b697 b806 )
    ( on b553 b697 )
    ( clear b553 )
  )
  ( :tasks
    ( Make-31Pile b208 b933 b225 b88 b376 b859 b431 b203 b507 b947 b17 b210 b270 b927 b855 b22 b215 b936 b338 b261 b149 b299 b816 b243 b220 b544 b19 b787 b806 b697 b553 )
  )
)
