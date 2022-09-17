( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b482 - block
    b730 - block
    b112 - block
    b633 - block
    b224 - block
    b208 - block
    b782 - block
    b215 - block
    b986 - block
    b541 - block
    b602 - block
    b834 - block
    b21 - block
    b413 - block
    b431 - block
    b793 - block
    b18 - block
    b520 - block
    b275 - block
    b149 - block
    b205 - block
    b772 - block
    b668 - block
    b724 - block
    b872 - block
    b197 - block
    b502 - block
    b163 - block
    b496 - block
    b613 - block
    b948 - block
    b757 - block
    b963 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b730 b482 )
    ( on b112 b730 )
    ( on b633 b112 )
    ( on b224 b633 )
    ( on b208 b224 )
    ( on b782 b208 )
    ( on b215 b782 )
    ( on b986 b215 )
    ( on b541 b986 )
    ( on b602 b541 )
    ( on b834 b602 )
    ( on b21 b834 )
    ( on b413 b21 )
    ( on b431 b413 )
    ( on b793 b431 )
    ( on b18 b793 )
    ( on b520 b18 )
    ( on b275 b520 )
    ( on b149 b275 )
    ( on b205 b149 )
    ( on b772 b205 )
    ( on b668 b772 )
    ( on b724 b668 )
    ( on b872 b724 )
    ( on b197 b872 )
    ( on b502 b197 )
    ( on b163 b502 )
    ( on b496 b163 )
    ( on b613 b496 )
    ( on b948 b613 )
    ( on b757 b948 )
    ( on b963 b757 )
    ( clear b963 )
  )
  ( :tasks
    ( Make-32Pile b730 b112 b633 b224 b208 b782 b215 b986 b541 b602 b834 b21 b413 b431 b793 b18 b520 b275 b149 b205 b772 b668 b724 b872 b197 b502 b163 b496 b613 b948 b757 b963 )
  )
)
