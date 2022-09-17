( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b402 - block
    b9 - block
    b179 - block
    b439 - block
    b598 - block
    b330 - block
    b408 - block
    b437 - block
    b257 - block
    b198 - block
    b36 - block
    b359 - block
    b879 - block
    b698 - block
    b231 - block
    b918 - block
    b283 - block
    b13 - block
    b463 - block
    b961 - block
    b147 - block
    b864 - block
    b421 - block
    b230 - block
    b983 - block
    b929 - block
    b543 - block
    b880 - block
    b280 - block
    b38 - block
    b579 - block
    b195 - block
    b848 - block
    b181 - block
    b55 - block
    b716 - block
    b123 - block
    b686 - block
    b406 - block
    b628 - block
    b749 - block
    b829 - block
    b816 - block
    b692 - block
    b66 - block
    b671 - block
    b459 - block
    b933 - block
    b657 - block
    b821 - block
    b670 - block
    b959 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b402 )
    ( on b9 b402 )
    ( on b179 b9 )
    ( on b439 b179 )
    ( on b598 b439 )
    ( on b330 b598 )
    ( on b408 b330 )
    ( on b437 b408 )
    ( on b257 b437 )
    ( on b198 b257 )
    ( on b36 b198 )
    ( on b359 b36 )
    ( on b879 b359 )
    ( on b698 b879 )
    ( on b231 b698 )
    ( on b918 b231 )
    ( on b283 b918 )
    ( on b13 b283 )
    ( on b463 b13 )
    ( on b961 b463 )
    ( on b147 b961 )
    ( on b864 b147 )
    ( on b421 b864 )
    ( on b230 b421 )
    ( on b983 b230 )
    ( on b929 b983 )
    ( on b543 b929 )
    ( on b880 b543 )
    ( on b280 b880 )
    ( on b38 b280 )
    ( on b579 b38 )
    ( on b195 b579 )
    ( on b848 b195 )
    ( on b181 b848 )
    ( on b55 b181 )
    ( on b716 b55 )
    ( on b123 b716 )
    ( on b686 b123 )
    ( on b406 b686 )
    ( on b628 b406 )
    ( on b749 b628 )
    ( on b829 b749 )
    ( on b816 b829 )
    ( on b692 b816 )
    ( on b66 b692 )
    ( on b671 b66 )
    ( on b459 b671 )
    ( on b933 b459 )
    ( on b657 b933 )
    ( on b821 b657 )
    ( on b670 b821 )
    ( on b959 b670 )
    ( clear b959 )
  )
  ( :goal
    ( and
      ( clear b402 )
    )
  )
)
