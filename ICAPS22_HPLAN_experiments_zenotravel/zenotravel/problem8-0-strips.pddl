( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city221 - city
    city931 - city
    city516 - city
    city8 - city
    city506 - city
    city877 - city
    city144 - city
    city523 - city
    city184 - city
    city237 - city
    city109 - city
    city104 - city
    person186 - person
    person541 - person
    person483 - person
    person231 - person
    person288 - person
    person698 - person
    person732 - person
    person524 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person186 city8 )
    ( person-at person541 city104 )
    ( person-at person483 city931 )
    ( person-at person231 city523 )
    ( person-at person288 city8 )
    ( person-at person698 city8 )
    ( person-at person732 city506 )
    ( person-at person524 city104 )
  )
  ( :goal
    ( and
      ( person-at person186 city000 )
      ( person-at person541 city000 )
      ( person-at person483 city000 )
      ( person-at person231 city000 )
      ( person-at person288 city000 )
      ( person-at person698 city000 )
      ( person-at person732 city000 )
      ( person-at person524 city000 )
    )
  )
)
