( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    aircraft000 - aircraft
    city978 - city
    city125 - city
    city497 - city
    city685 - city
    city61 - city
    city303 - city
    person885 - person
    person609 - person
    person136 - person
    person506 - person
    person867 - person
    person157 - person
    person237 - person
    person11 - person
    person573 - person
    person91 - person
    person984 - person
    person632 - person
    person192 - person
  )
  ( :init
    ( next level000 level001 )
    ( airport l000-000 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person885 city61 )
    ( person-at person609 city685 )
    ( person-at person136 city61 )
    ( person-at person506 city303 )
    ( person-at person867 city978 )
    ( person-at person157 city303 )
    ( person-at person237 city685 )
    ( person-at person11 city303 )
    ( person-at person573 city497 )
    ( person-at person91 city685 )
    ( person-at person984 city978 )
    ( person-at person632 city685 )
    ( person-at person192 city978 )
  )
  ( :goal
    ( and
      ( person-at person885 city000 )
      ( person-at person609 city000 )
      ( person-at person136 city000 )
      ( person-at person506 city000 )
      ( person-at person867 city000 )
      ( person-at person157 city000 )
      ( person-at person237 city000 )
      ( person-at person11 city000 )
      ( person-at person573 city000 )
      ( person-at person91 city000 )
      ( person-at person984 city000 )
      ( person-at person632 city000 )
      ( person-at person192 city000 )
    )
  )
)