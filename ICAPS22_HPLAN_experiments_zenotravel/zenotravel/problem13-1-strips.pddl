( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    aircraft000 - aircraft
    city221 - city
    city198 - city
    city379 - city
    city288 - city
    city908 - city
    city612 - city
    city401 - city
    city581 - city
    city983 - city
    city812 - city
    city909 - city
    city364 - city
    city151 - city
    city244 - city
    city329 - city
    city608 - city
    city729 - city
    city277 - city
    city185 - city
    city371 - city
    city196 - city
    city833 - city
    city455 - city
    person503 - person
    person983 - person
    person160 - person
    person574 - person
    person461 - person
    person752 - person
    person609 - person
    person467 - person
    person56 - person
    person905 - person
    person846 - person
    person409 - person
    person552 - person
  )
  ( :init
    ( next level000 level001 )
    ( airport l000-000 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person503 city288 )
    ( person-at person983 city221 )
    ( person-at person160 city455 )
    ( person-at person574 city244 )
    ( person-at person461 city581 )
    ( person-at person752 city581 )
    ( person-at person609 city196 )
    ( person-at person467 city401 )
    ( person-at person56 city185 )
    ( person-at person905 city908 )
    ( person-at person846 city185 )
    ( person-at person409 city379 )
    ( person-at person552 city371 )
  )
  ( :goal
    ( and
      ( person-at person503 city000 )
      ( person-at person983 city000 )
      ( person-at person160 city000 )
      ( person-at person574 city000 )
      ( person-at person461 city000 )
      ( person-at person752 city000 )
      ( person-at person609 city000 )
      ( person-at person467 city000 )
      ( person-at person56 city000 )
      ( person-at person905 city000 )
      ( person-at person846 city000 )
      ( person-at person409 city000 )
      ( person-at person552 city000 )
    )
  )
)
