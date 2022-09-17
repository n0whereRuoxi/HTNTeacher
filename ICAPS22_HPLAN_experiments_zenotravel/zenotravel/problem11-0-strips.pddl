( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city102 - city
    city181 - city
    city692 - city
    city273 - city
    city186 - city
    city655 - city
    city180 - city
    city871 - city
    city305 - city
    city593 - city
    city937 - city
    city131 - city
    city247 - city
    person563 - person
    person142 - person
    person494 - person
    person746 - person
    person419 - person
    person278 - person
    person605 - person
    person940 - person
    person589 - person
    person760 - person
    person1 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person563 city102 )
    ( person-at person142 city871 )
    ( person-at person494 city180 )
    ( person-at person746 city871 )
    ( person-at person419 city937 )
    ( person-at person278 city180 )
    ( person-at person605 city593 )
    ( person-at person940 city186 )
    ( person-at person589 city102 )
    ( person-at person760 city692 )
    ( person-at person1 city937 )
  )
  ( :goal
    ( and
      ( person-at person563 city000 )
      ( person-at person142 city000 )
      ( person-at person494 city000 )
      ( person-at person746 city000 )
      ( person-at person419 city000 )
      ( person-at person278 city000 )
      ( person-at person605 city000 )
      ( person-at person940 city000 )
      ( person-at person589 city000 )
      ( person-at person760 city000 )
      ( person-at person1 city000 )
    )
  )
)
