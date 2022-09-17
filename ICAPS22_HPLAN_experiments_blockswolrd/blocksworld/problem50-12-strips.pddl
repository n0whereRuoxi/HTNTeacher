( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b250 - block
    b785 - block
    b347 - block
    b212 - block
    b571 - block
    b207 - block
    b365 - block
    b211 - block
    b811 - block
    b382 - block
    b233 - block
    b634 - block
    b946 - block
    b510 - block
    b564 - block
    b973 - block
    b436 - block
    b527 - block
    b956 - block
    b431 - block
    b579 - block
    b641 - block
    b433 - block
    b239 - block
    b503 - block
    b341 - block
    b405 - block
    b642 - block
    b794 - block
    b345 - block
    b676 - block
    b160 - block
    b891 - block
    b413 - block
    b533 - block
    b525 - block
    b668 - block
    b452 - block
    b110 - block
    b16 - block
    b644 - block
    b733 - block
    b485 - block
    b816 - block
    b194 - block
    b205 - block
    b200 - block
    b889 - block
    b394 - block
    b535 - block
    b377 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b250 )
    ( on b785 b250 )
    ( on b347 b785 )
    ( on b212 b347 )
    ( on b571 b212 )
    ( on b207 b571 )
    ( on b365 b207 )
    ( on b211 b365 )
    ( on b811 b211 )
    ( on b382 b811 )
    ( on b233 b382 )
    ( on b634 b233 )
    ( on b946 b634 )
    ( on b510 b946 )
    ( on b564 b510 )
    ( on b973 b564 )
    ( on b436 b973 )
    ( on b527 b436 )
    ( on b956 b527 )
    ( on b431 b956 )
    ( on b579 b431 )
    ( on b641 b579 )
    ( on b433 b641 )
    ( on b239 b433 )
    ( on b503 b239 )
    ( on b341 b503 )
    ( on b405 b341 )
    ( on b642 b405 )
    ( on b794 b642 )
    ( on b345 b794 )
    ( on b676 b345 )
    ( on b160 b676 )
    ( on b891 b160 )
    ( on b413 b891 )
    ( on b533 b413 )
    ( on b525 b533 )
    ( on b668 b525 )
    ( on b452 b668 )
    ( on b110 b452 )
    ( on b16 b110 )
    ( on b644 b16 )
    ( on b733 b644 )
    ( on b485 b733 )
    ( on b816 b485 )
    ( on b194 b816 )
    ( on b205 b194 )
    ( on b200 b205 )
    ( on b889 b200 )
    ( on b394 b889 )
    ( on b535 b394 )
    ( on b377 b535 )
    ( clear b377 )
  )
  ( :goal
    ( and
      ( clear b250 )
    )
  )
)
