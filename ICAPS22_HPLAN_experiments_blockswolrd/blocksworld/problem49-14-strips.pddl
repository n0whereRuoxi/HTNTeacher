( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b231 - block
    b984 - block
    b233 - block
    b713 - block
    b98 - block
    b637 - block
    b436 - block
    b557 - block
    b386 - block
    b600 - block
    b989 - block
    b844 - block
    b763 - block
    b640 - block
    b415 - block
    b448 - block
    b271 - block
    b438 - block
    b370 - block
    b407 - block
    b520 - block
    b10 - block
    b496 - block
    b224 - block
    b775 - block
    b650 - block
    b103 - block
    b184 - block
    b332 - block
    b286 - block
    b15 - block
    b431 - block
    b69 - block
    b673 - block
    b794 - block
    b291 - block
    b819 - block
    b766 - block
    b613 - block
    b823 - block
    b54 - block
    b34 - block
    b840 - block
    b175 - block
    b252 - block
    b36 - block
    b964 - block
    b933 - block
    b835 - block
    b802 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b231 )
    ( on b984 b231 )
    ( on b233 b984 )
    ( on b713 b233 )
    ( on b98 b713 )
    ( on b637 b98 )
    ( on b436 b637 )
    ( on b557 b436 )
    ( on b386 b557 )
    ( on b600 b386 )
    ( on b989 b600 )
    ( on b844 b989 )
    ( on b763 b844 )
    ( on b640 b763 )
    ( on b415 b640 )
    ( on b448 b415 )
    ( on b271 b448 )
    ( on b438 b271 )
    ( on b370 b438 )
    ( on b407 b370 )
    ( on b520 b407 )
    ( on b10 b520 )
    ( on b496 b10 )
    ( on b224 b496 )
    ( on b775 b224 )
    ( on b650 b775 )
    ( on b103 b650 )
    ( on b184 b103 )
    ( on b332 b184 )
    ( on b286 b332 )
    ( on b15 b286 )
    ( on b431 b15 )
    ( on b69 b431 )
    ( on b673 b69 )
    ( on b794 b673 )
    ( on b291 b794 )
    ( on b819 b291 )
    ( on b766 b819 )
    ( on b613 b766 )
    ( on b823 b613 )
    ( on b54 b823 )
    ( on b34 b54 )
    ( on b840 b34 )
    ( on b175 b840 )
    ( on b252 b175 )
    ( on b36 b252 )
    ( on b964 b36 )
    ( on b933 b964 )
    ( on b835 b933 )
    ( on b802 b835 )
    ( clear b802 )
  )
  ( :goal
    ( and
      ( clear b231 )
    )
  )
)
