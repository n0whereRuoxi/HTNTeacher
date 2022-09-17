( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b222 - block
    b243 - block
    b213 - block
    b119 - block
    b822 - block
    b881 - block
    b365 - block
    b610 - block
    b350 - block
    b893 - block
    b42 - block
    b787 - block
    b1 - block
    b148 - block
    b566 - block
    b613 - block
    b674 - block
    b717 - block
    b103 - block
    b315 - block
    b886 - block
    b907 - block
    b759 - block
    b921 - block
    b811 - block
    b462 - block
    b739 - block
    b316 - block
    b219 - block
    b76 - block
    b493 - block
    b784 - block
    b795 - block
    b354 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b222 )
    ( on b243 b222 )
    ( on b213 b243 )
    ( on b119 b213 )
    ( on b822 b119 )
    ( on b881 b822 )
    ( on b365 b881 )
    ( on b610 b365 )
    ( on b350 b610 )
    ( on b893 b350 )
    ( on b42 b893 )
    ( on b787 b42 )
    ( on b1 b787 )
    ( on b148 b1 )
    ( on b566 b148 )
    ( on b613 b566 )
    ( on b674 b613 )
    ( on b717 b674 )
    ( on b103 b717 )
    ( on b315 b103 )
    ( on b886 b315 )
    ( on b907 b886 )
    ( on b759 b907 )
    ( on b921 b759 )
    ( on b811 b921 )
    ( on b462 b811 )
    ( on b739 b462 )
    ( on b316 b739 )
    ( on b219 b316 )
    ( on b76 b219 )
    ( on b493 b76 )
    ( on b784 b493 )
    ( on b795 b784 )
    ( on b354 b795 )
    ( on b292 b354 )
    ( clear b292 )
  )
  ( :tasks
    ( Make-34Pile b243 b213 b119 b822 b881 b365 b610 b350 b893 b42 b787 b1 b148 b566 b613 b674 b717 b103 b315 b886 b907 b759 b921 b811 b462 b739 b316 b219 b76 b493 b784 b795 b354 b292 )
  )
)
