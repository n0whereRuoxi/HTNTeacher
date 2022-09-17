( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b707 - block
    b854 - block
    b346 - block
    b506 - block
    b622 - block
    b279 - block
    b181 - block
    b464 - block
    b883 - block
    b484 - block
    b365 - block
    b852 - block
    b538 - block
    b207 - block
    b831 - block
    b265 - block
    b783 - block
    b736 - block
    b937 - block
    b851 - block
    b521 - block
    b92 - block
    b893 - block
    b606 - block
    b203 - block
    b523 - block
    b911 - block
    b527 - block
    b382 - block
    b19 - block
    b833 - block
    b700 - block
    b704 - block
    b719 - block
    b148 - block
    b537 - block
    b615 - block
    b1 - block
    b383 - block
    b469 - block
    b954 - block
    b70 - block
    b225 - block
    b373 - block
    b683 - block
    b574 - block
    b643 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b854 b707 )
    ( on b346 b854 )
    ( on b506 b346 )
    ( on b622 b506 )
    ( on b279 b622 )
    ( on b181 b279 )
    ( on b464 b181 )
    ( on b883 b464 )
    ( on b484 b883 )
    ( on b365 b484 )
    ( on b852 b365 )
    ( on b538 b852 )
    ( on b207 b538 )
    ( on b831 b207 )
    ( on b265 b831 )
    ( on b783 b265 )
    ( on b736 b783 )
    ( on b937 b736 )
    ( on b851 b937 )
    ( on b521 b851 )
    ( on b92 b521 )
    ( on b893 b92 )
    ( on b606 b893 )
    ( on b203 b606 )
    ( on b523 b203 )
    ( on b911 b523 )
    ( on b527 b911 )
    ( on b382 b527 )
    ( on b19 b382 )
    ( on b833 b19 )
    ( on b700 b833 )
    ( on b704 b700 )
    ( on b719 b704 )
    ( on b148 b719 )
    ( on b537 b148 )
    ( on b615 b537 )
    ( on b1 b615 )
    ( on b383 b1 )
    ( on b469 b383 )
    ( on b954 b469 )
    ( on b70 b954 )
    ( on b225 b70 )
    ( on b373 b225 )
    ( on b683 b373 )
    ( on b574 b683 )
    ( on b643 b574 )
    ( clear b643 )
  )
  ( :tasks
    ( Make-46Pile b854 b346 b506 b622 b279 b181 b464 b883 b484 b365 b852 b538 b207 b831 b265 b783 b736 b937 b851 b521 b92 b893 b606 b203 b523 b911 b527 b382 b19 b833 b700 b704 b719 b148 b537 b615 b1 b383 b469 b954 b70 b225 b373 b683 b574 b643 )
  )
)
