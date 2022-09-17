( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1731 - PERSON
      ?auto_1730 - CITY
    )
    :vars
    (
      ?auto_1734 - FLEVEL
      ?auto_1733 - FLEVEL
      ?auto_1735 - CITY
      ?auto_1732 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1734 ?auto_1733 ) ( PERSON-AT ?auto_1731 ?auto_1735 ) ( AIRCRAFT-AT ?auto_1732 ?auto_1730 ) ( FUEL-LEVEL ?auto_1732 ?auto_1734 ) ( not ( = ?auto_1730 ?auto_1735 ) ) ( not ( = ?auto_1734 ?auto_1733 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1732 ?auto_1730 ?auto_1734 ?auto_1733 )
      ( !FLY ?auto_1732 ?auto_1730 ?auto_1735 ?auto_1733 ?auto_1734 )
      ( !REFUEL ?auto_1732 ?auto_1735 ?auto_1734 ?auto_1733 )
      ( !BOARD ?auto_1731 ?auto_1732 ?auto_1735 )
      ( !FLY ?auto_1732 ?auto_1735 ?auto_1730 ?auto_1733 ?auto_1734 )
      ( !DEBARK ?auto_1731 ?auto_1732 ?auto_1730 )
      ( FLY-1PPL-VERIFY ?auto_1731 ?auto_1730 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1754 - PERSON
      ?auto_1755 - PERSON
      ?auto_1753 - CITY
    )
    :vars
    (
      ?auto_1758 - FLEVEL
      ?auto_1757 - FLEVEL
      ?auto_1759 - CITY
      ?auto_1756 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1758 ?auto_1757 ) ( PERSON-AT ?auto_1755 ?auto_1759 ) ( not ( = ?auto_1753 ?auto_1759 ) ) ( not ( = ?auto_1758 ?auto_1757 ) ) ( PERSON-AT ?auto_1754 ?auto_1759 ) ( AIRCRAFT-AT ?auto_1756 ?auto_1753 ) ( FUEL-LEVEL ?auto_1756 ?auto_1758 ) ( not ( = ?auto_1754 ?auto_1755 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1754 ?auto_1753 )
      ( FLY-1PPL ?auto_1755 ?auto_1753 )
      ( FLY-2PPL-VERIFY ?auto_1754 ?auto_1755 ?auto_1753 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1866 - PERSON
      ?auto_1867 - PERSON
      ?auto_1868 - PERSON
      ?auto_1865 - CITY
    )
    :vars
    (
      ?auto_1869 - FLEVEL
      ?auto_1870 - FLEVEL
      ?auto_1871 - CITY
      ?auto_1873 - CITY
      ?auto_1872 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1869 ?auto_1870 ) ( PERSON-AT ?auto_1868 ?auto_1871 ) ( not ( = ?auto_1865 ?auto_1871 ) ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( PERSON-AT ?auto_1867 ?auto_1873 ) ( not ( = ?auto_1865 ?auto_1873 ) ) ( PERSON-AT ?auto_1866 ?auto_1873 ) ( AIRCRAFT-AT ?auto_1872 ?auto_1865 ) ( FUEL-LEVEL ?auto_1872 ?auto_1869 ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1866 ?auto_1868 ) ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( not ( = ?auto_1871 ?auto_1873 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1866 ?auto_1867 ?auto_1865 )
      ( FLY-1PPL ?auto_1868 ?auto_1865 )
      ( FLY-3PPL-VERIFY ?auto_1866 ?auto_1867 ?auto_1868 ?auto_1865 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1885 - PERSON
      ?auto_1886 - PERSON
      ?auto_1887 - PERSON
      ?auto_1884 - CITY
    )
    :vars
    (
      ?auto_1890 - FLEVEL
      ?auto_1889 - FLEVEL
      ?auto_1892 - CITY
      ?auto_1891 - CITY
      ?auto_1888 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1890 ?auto_1889 ) ( PERSON-AT ?auto_1886 ?auto_1892 ) ( not ( = ?auto_1884 ?auto_1892 ) ) ( not ( = ?auto_1890 ?auto_1889 ) ) ( PERSON-AT ?auto_1887 ?auto_1891 ) ( not ( = ?auto_1884 ?auto_1891 ) ) ( PERSON-AT ?auto_1885 ?auto_1891 ) ( AIRCRAFT-AT ?auto_1888 ?auto_1884 ) ( FUEL-LEVEL ?auto_1888 ?auto_1890 ) ( not ( = ?auto_1885 ?auto_1887 ) ) ( not ( = ?auto_1885 ?auto_1886 ) ) ( not ( = ?auto_1887 ?auto_1886 ) ) ( not ( = ?auto_1892 ?auto_1891 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1885 ?auto_1887 ?auto_1886 ?auto_1884 )
      ( FLY-3PPL-VERIFY ?auto_1885 ?auto_1886 ?auto_1887 ?auto_1884 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1952 - PERSON
      ?auto_1953 - PERSON
      ?auto_1954 - PERSON
      ?auto_1951 - CITY
    )
    :vars
    (
      ?auto_1957 - FLEVEL
      ?auto_1956 - FLEVEL
      ?auto_1958 - CITY
      ?auto_1959 - CITY
      ?auto_1955 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1957 ?auto_1956 ) ( PERSON-AT ?auto_1952 ?auto_1958 ) ( not ( = ?auto_1951 ?auto_1958 ) ) ( not ( = ?auto_1957 ?auto_1956 ) ) ( PERSON-AT ?auto_1954 ?auto_1959 ) ( not ( = ?auto_1951 ?auto_1959 ) ) ( PERSON-AT ?auto_1953 ?auto_1959 ) ( AIRCRAFT-AT ?auto_1955 ?auto_1951 ) ( FUEL-LEVEL ?auto_1955 ?auto_1957 ) ( not ( = ?auto_1953 ?auto_1954 ) ) ( not ( = ?auto_1953 ?auto_1952 ) ) ( not ( = ?auto_1954 ?auto_1952 ) ) ( not ( = ?auto_1958 ?auto_1959 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1953 ?auto_1952 ?auto_1954 ?auto_1951 )
      ( FLY-3PPL-VERIFY ?auto_1952 ?auto_1953 ?auto_1954 ?auto_1951 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3011 - PERSON
      ?auto_3012 - PERSON
      ?auto_3013 - PERSON
      ?auto_3014 - PERSON
      ?auto_3010 - CITY
    )
    :vars
    (
      ?auto_3017 - FLEVEL
      ?auto_3016 - FLEVEL
      ?auto_3015 - CITY
      ?auto_3019 - CITY
      ?auto_3018 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3017 ?auto_3016 ) ( PERSON-AT ?auto_3014 ?auto_3015 ) ( not ( = ?auto_3010 ?auto_3015 ) ) ( not ( = ?auto_3017 ?auto_3016 ) ) ( PERSON-AT ?auto_3013 ?auto_3015 ) ( PERSON-AT ?auto_3012 ?auto_3019 ) ( not ( = ?auto_3010 ?auto_3019 ) ) ( PERSON-AT ?auto_3011 ?auto_3019 ) ( AIRCRAFT-AT ?auto_3018 ?auto_3010 ) ( FUEL-LEVEL ?auto_3018 ?auto_3017 ) ( not ( = ?auto_3011 ?auto_3012 ) ) ( not ( = ?auto_3011 ?auto_3013 ) ) ( not ( = ?auto_3012 ?auto_3013 ) ) ( not ( = ?auto_3015 ?auto_3019 ) ) ( not ( = ?auto_3011 ?auto_3014 ) ) ( not ( = ?auto_3012 ?auto_3014 ) ) ( not ( = ?auto_3013 ?auto_3014 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_3011 ?auto_3013 ?auto_3012 ?auto_3010 )
      ( FLY-1PPL ?auto_3014 ?auto_3010 )
      ( FLY-4PPL-VERIFY ?auto_3011 ?auto_3012 ?auto_3013 ?auto_3014 ?auto_3010 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3070 - PERSON
      ?auto_3071 - PERSON
      ?auto_3072 - PERSON
      ?auto_3073 - PERSON
      ?auto_3069 - CITY
    )
    :vars
    (
      ?auto_3078 - FLEVEL
      ?auto_3074 - FLEVEL
      ?auto_3075 - CITY
      ?auto_3077 - CITY
      ?auto_3076 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3078 ?auto_3074 ) ( PERSON-AT ?auto_3073 ?auto_3075 ) ( not ( = ?auto_3069 ?auto_3075 ) ) ( not ( = ?auto_3078 ?auto_3074 ) ) ( PERSON-AT ?auto_3071 ?auto_3075 ) ( PERSON-AT ?auto_3072 ?auto_3077 ) ( not ( = ?auto_3069 ?auto_3077 ) ) ( PERSON-AT ?auto_3070 ?auto_3077 ) ( AIRCRAFT-AT ?auto_3076 ?auto_3069 ) ( FUEL-LEVEL ?auto_3076 ?auto_3078 ) ( not ( = ?auto_3070 ?auto_3072 ) ) ( not ( = ?auto_3070 ?auto_3071 ) ) ( not ( = ?auto_3072 ?auto_3071 ) ) ( not ( = ?auto_3075 ?auto_3077 ) ) ( not ( = ?auto_3070 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3070 ?auto_3072 ?auto_3071 ?auto_3073 ?auto_3069 )
      ( FLY-4PPL-VERIFY ?auto_3070 ?auto_3071 ?auto_3072 ?auto_3073 ?auto_3069 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3102 - PERSON
      ?auto_3103 - PERSON
      ?auto_3104 - PERSON
      ?auto_3105 - PERSON
      ?auto_3101 - CITY
    )
    :vars
    (
      ?auto_3108 - FLEVEL
      ?auto_3107 - FLEVEL
      ?auto_3106 - CITY
      ?auto_3109 - CITY
      ?auto_3110 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3108 ?auto_3107 ) ( PERSON-AT ?auto_3104 ?auto_3106 ) ( not ( = ?auto_3101 ?auto_3106 ) ) ( not ( = ?auto_3108 ?auto_3107 ) ) ( PERSON-AT ?auto_3103 ?auto_3106 ) ( PERSON-AT ?auto_3105 ?auto_3109 ) ( not ( = ?auto_3101 ?auto_3109 ) ) ( PERSON-AT ?auto_3102 ?auto_3109 ) ( AIRCRAFT-AT ?auto_3110 ?auto_3101 ) ( FUEL-LEVEL ?auto_3110 ?auto_3108 ) ( not ( = ?auto_3102 ?auto_3105 ) ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( not ( = ?auto_3105 ?auto_3103 ) ) ( not ( = ?auto_3106 ?auto_3109 ) ) ( not ( = ?auto_3102 ?auto_3104 ) ) ( not ( = ?auto_3105 ?auto_3104 ) ) ( not ( = ?auto_3103 ?auto_3104 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3102 ?auto_3103 ?auto_3105 ?auto_3104 ?auto_3101 )
      ( FLY-4PPL-VERIFY ?auto_3102 ?auto_3103 ?auto_3104 ?auto_3105 ?auto_3101 ) )
  )

)

