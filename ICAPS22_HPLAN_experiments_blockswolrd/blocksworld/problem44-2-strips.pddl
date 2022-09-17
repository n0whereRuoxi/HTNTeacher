( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b298 - block
    b779 - block
    b316 - block
    b287 - block
    b635 - block
    b707 - block
    b496 - block
    b90 - block
    b451 - block
    b110 - block
    b812 - block
    b528 - block
    b965 - block
    b197 - block
    b285 - block
    b515 - block
    b104 - block
    b866 - block
    b142 - block
    b620 - block
    b311 - block
    b6 - block
    b873 - block
    b732 - block
    b183 - block
    b824 - block
    b48 - block
    b785 - block
    b682 - block
    b892 - block
    b371 - block
    b180 - block
    b353 - block
    b657 - block
    b127 - block
    b415 - block
    b441 - block
    b169 - block
    b701 - block
    b609 - block
    b280 - block
    b591 - block
    b772 - block
    b242 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b298 b293 )
    ( on b779 b298 )
    ( on b316 b779 )
    ( on b287 b316 )
    ( on b635 b287 )
    ( on b707 b635 )
    ( on b496 b707 )
    ( on b90 b496 )
    ( on b451 b90 )
    ( on b110 b451 )
    ( on b812 b110 )
    ( on b528 b812 )
    ( on b965 b528 )
    ( on b197 b965 )
    ( on b285 b197 )
    ( on b515 b285 )
    ( on b104 b515 )
    ( on b866 b104 )
    ( on b142 b866 )
    ( on b620 b142 )
    ( on b311 b620 )
    ( on b6 b311 )
    ( on b873 b6 )
    ( on b732 b873 )
    ( on b183 b732 )
    ( on b824 b183 )
    ( on b48 b824 )
    ( on b785 b48 )
    ( on b682 b785 )
    ( on b892 b682 )
    ( on b371 b892 )
    ( on b180 b371 )
    ( on b353 b180 )
    ( on b657 b353 )
    ( on b127 b657 )
    ( on b415 b127 )
    ( on b441 b415 )
    ( on b169 b441 )
    ( on b701 b169 )
    ( on b609 b701 )
    ( on b280 b609 )
    ( on b591 b280 )
    ( on b772 b591 )
    ( on b242 b772 )
    ( clear b242 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
