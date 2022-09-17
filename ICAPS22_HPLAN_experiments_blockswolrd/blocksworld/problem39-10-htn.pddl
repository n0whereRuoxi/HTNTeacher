( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b412 - block
    b2 - block
    b425 - block
    b803 - block
    b399 - block
    b906 - block
    b977 - block
    b357 - block
    b302 - block
    b610 - block
    b918 - block
    b920 - block
    b319 - block
    b501 - block
    b857 - block
    b850 - block
    b575 - block
    b806 - block
    b486 - block
    b11 - block
    b409 - block
    b32 - block
    b55 - block
    b967 - block
    b338 - block
    b650 - block
    b639 - block
    b807 - block
    b206 - block
    b895 - block
    b144 - block
    b840 - block
    b214 - block
    b964 - block
    b222 - block
    b565 - block
    b775 - block
    b880 - block
    b205 - block
    b861 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b412 )
    ( on b2 b412 )
    ( on b425 b2 )
    ( on b803 b425 )
    ( on b399 b803 )
    ( on b906 b399 )
    ( on b977 b906 )
    ( on b357 b977 )
    ( on b302 b357 )
    ( on b610 b302 )
    ( on b918 b610 )
    ( on b920 b918 )
    ( on b319 b920 )
    ( on b501 b319 )
    ( on b857 b501 )
    ( on b850 b857 )
    ( on b575 b850 )
    ( on b806 b575 )
    ( on b486 b806 )
    ( on b11 b486 )
    ( on b409 b11 )
    ( on b32 b409 )
    ( on b55 b32 )
    ( on b967 b55 )
    ( on b338 b967 )
    ( on b650 b338 )
    ( on b639 b650 )
    ( on b807 b639 )
    ( on b206 b807 )
    ( on b895 b206 )
    ( on b144 b895 )
    ( on b840 b144 )
    ( on b214 b840 )
    ( on b964 b214 )
    ( on b222 b964 )
    ( on b565 b222 )
    ( on b775 b565 )
    ( on b880 b775 )
    ( on b205 b880 )
    ( on b861 b205 )
    ( clear b861 )
  )
  ( :tasks
    ( Make-39Pile b2 b425 b803 b399 b906 b977 b357 b302 b610 b918 b920 b319 b501 b857 b850 b575 b806 b486 b11 b409 b32 b55 b967 b338 b650 b639 b807 b206 b895 b144 b840 b214 b964 b222 b565 b775 b880 b205 b861 )
  )
)
