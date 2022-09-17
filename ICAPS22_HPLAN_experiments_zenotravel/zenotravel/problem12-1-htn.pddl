( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city185 - city
    city864 - city
    city484 - city
    city52 - city
    city434 - city
    city525 - city
    city9 - city
    city739 - city
    city407 - city
    city603 - city
    city439 - city
    city11 - city
    city769 - city
    city779 - city
    city373 - city
    city18 - city
    city738 - city
    city295 - city
    city579 - city
    city873 - city
    city521 - city
    city713 - city
    person626 - person
    person376 - person
    person211 - person
    person522 - person
    person395 - person
    person422 - person
    person36 - person
    person756 - person
    person421 - person
    person173 - person
    person630 - person
    person137 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person626 city738 )
    ( person-at person376 city185 )
    ( person-at person211 city295 )
    ( person-at person522 city873 )
    ( person-at person395 city185 )
    ( person-at person422 city579 )
    ( person-at person36 city9 )
    ( person-at person756 city579 )
    ( person-at person421 city407 )
    ( person-at person173 city11 )
    ( person-at person630 city52 )
    ( person-at person137 city52 )
  )
  ( :tasks
    ( Fly-12Ppl person626 person376 person211 person522 person395 person422 person36 person756 person421 person173 person630 person137 city000 )
  )
)
