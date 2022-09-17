( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city324 - city
    city461 - city
    city244 - city
    city381 - city
    city455 - city
    city257 - city
    city946 - city
    city227 - city
    city842 - city
    city317 - city
    city805 - city
    person73 - person
    person442 - person
    person821 - person
    person495 - person
    person650 - person
    person317 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person73 city227 )
    ( person-at person442 city317 )
    ( person-at person821 city455 )
    ( person-at person495 city324 )
    ( person-at person650 city227 )
    ( person-at person317 city324 )
  )
  ( :goal
    ( and
      ( person-at person73 city000 )
      ( person-at person442 city000 )
      ( person-at person821 city000 )
      ( person-at person495 city000 )
      ( person-at person650 city000 )
      ( person-at person317 city000 )
    )
  )
)
