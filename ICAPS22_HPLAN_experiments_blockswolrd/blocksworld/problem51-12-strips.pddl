( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b777 - block
    b359 - block
    b27 - block
    b864 - block
    b212 - block
    b865 - block
    b746 - block
    b925 - block
    b887 - block
    b399 - block
    b897 - block
    b414 - block
    b452 - block
    b339 - block
    b562 - block
    b645 - block
    b108 - block
    b621 - block
    b202 - block
    b296 - block
    b231 - block
    b522 - block
    b363 - block
    b806 - block
    b110 - block
    b298 - block
    b243 - block
    b991 - block
    b113 - block
    b649 - block
    b959 - block
    b96 - block
    b722 - block
    b434 - block
    b841 - block
    b770 - block
    b297 - block
    b989 - block
    b960 - block
    b39 - block
    b380 - block
    b669 - block
    b259 - block
    b341 - block
    b871 - block
    b121 - block
    b520 - block
    b471 - block
    b505 - block
    b721 - block
    b448 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b777 b790 )
    ( on b359 b777 )
    ( on b27 b359 )
    ( on b864 b27 )
    ( on b212 b864 )
    ( on b865 b212 )
    ( on b746 b865 )
    ( on b925 b746 )
    ( on b887 b925 )
    ( on b399 b887 )
    ( on b897 b399 )
    ( on b414 b897 )
    ( on b452 b414 )
    ( on b339 b452 )
    ( on b562 b339 )
    ( on b645 b562 )
    ( on b108 b645 )
    ( on b621 b108 )
    ( on b202 b621 )
    ( on b296 b202 )
    ( on b231 b296 )
    ( on b522 b231 )
    ( on b363 b522 )
    ( on b806 b363 )
    ( on b110 b806 )
    ( on b298 b110 )
    ( on b243 b298 )
    ( on b991 b243 )
    ( on b113 b991 )
    ( on b649 b113 )
    ( on b959 b649 )
    ( on b96 b959 )
    ( on b722 b96 )
    ( on b434 b722 )
    ( on b841 b434 )
    ( on b770 b841 )
    ( on b297 b770 )
    ( on b989 b297 )
    ( on b960 b989 )
    ( on b39 b960 )
    ( on b380 b39 )
    ( on b669 b380 )
    ( on b259 b669 )
    ( on b341 b259 )
    ( on b871 b341 )
    ( on b121 b871 )
    ( on b520 b121 )
    ( on b471 b520 )
    ( on b505 b471 )
    ( on b721 b505 )
    ( on b448 b721 )
    ( clear b448 )
  )
  ( :goal
    ( and
      ( clear b790 )
    )
  )
)
