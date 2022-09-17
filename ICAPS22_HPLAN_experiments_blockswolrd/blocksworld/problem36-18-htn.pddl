( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b210 - block
    b598 - block
    b615 - block
    b821 - block
    b761 - block
    b262 - block
    b311 - block
    b895 - block
    b643 - block
    b963 - block
    b596 - block
    b26 - block
    b196 - block
    b960 - block
    b391 - block
    b923 - block
    b116 - block
    b150 - block
    b25 - block
    b639 - block
    b890 - block
    b618 - block
    b846 - block
    b417 - block
    b192 - block
    b353 - block
    b278 - block
    b429 - block
    b792 - block
    b549 - block
    b430 - block
    b633 - block
    b326 - block
    b216 - block
    b720 - block
    b190 - block
    b10 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b598 b210 )
    ( on b615 b598 )
    ( on b821 b615 )
    ( on b761 b821 )
    ( on b262 b761 )
    ( on b311 b262 )
    ( on b895 b311 )
    ( on b643 b895 )
    ( on b963 b643 )
    ( on b596 b963 )
    ( on b26 b596 )
    ( on b196 b26 )
    ( on b960 b196 )
    ( on b391 b960 )
    ( on b923 b391 )
    ( on b116 b923 )
    ( on b150 b116 )
    ( on b25 b150 )
    ( on b639 b25 )
    ( on b890 b639 )
    ( on b618 b890 )
    ( on b846 b618 )
    ( on b417 b846 )
    ( on b192 b417 )
    ( on b353 b192 )
    ( on b278 b353 )
    ( on b429 b278 )
    ( on b792 b429 )
    ( on b549 b792 )
    ( on b430 b549 )
    ( on b633 b430 )
    ( on b326 b633 )
    ( on b216 b326 )
    ( on b720 b216 )
    ( on b190 b720 )
    ( on b10 b190 )
    ( clear b10 )
  )
  ( :tasks
    ( Make-36Pile b598 b615 b821 b761 b262 b311 b895 b643 b963 b596 b26 b196 b960 b391 b923 b116 b150 b25 b639 b890 b618 b846 b417 b192 b353 b278 b429 b792 b549 b430 b633 b326 b216 b720 b190 b10 )
  )
)
