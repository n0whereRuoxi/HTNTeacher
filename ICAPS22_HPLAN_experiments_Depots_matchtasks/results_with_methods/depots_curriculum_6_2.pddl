( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1984 - SURFACE
      ?auto_1985 - SURFACE
    )
    :vars
    (
      ?auto_1986 - HOIST
      ?auto_1987 - PLACE
      ?auto_1989 - PLACE
      ?auto_1990 - HOIST
      ?auto_1991 - SURFACE
      ?auto_1988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1986 ?auto_1987 ) ( SURFACE-AT ?auto_1984 ?auto_1987 ) ( CLEAR ?auto_1984 ) ( IS-CRATE ?auto_1985 ) ( AVAILABLE ?auto_1986 ) ( not ( = ?auto_1989 ?auto_1987 ) ) ( HOIST-AT ?auto_1990 ?auto_1989 ) ( AVAILABLE ?auto_1990 ) ( SURFACE-AT ?auto_1985 ?auto_1989 ) ( ON ?auto_1985 ?auto_1991 ) ( CLEAR ?auto_1985 ) ( TRUCK-AT ?auto_1988 ?auto_1987 ) ( not ( = ?auto_1984 ?auto_1985 ) ) ( not ( = ?auto_1984 ?auto_1991 ) ) ( not ( = ?auto_1985 ?auto_1991 ) ) ( not ( = ?auto_1986 ?auto_1990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1988 ?auto_1987 ?auto_1989 )
      ( !LIFT ?auto_1990 ?auto_1985 ?auto_1991 ?auto_1989 )
      ( !LOAD ?auto_1990 ?auto_1985 ?auto_1988 ?auto_1989 )
      ( !DRIVE ?auto_1988 ?auto_1989 ?auto_1987 )
      ( !UNLOAD ?auto_1986 ?auto_1985 ?auto_1988 ?auto_1987 )
      ( !DROP ?auto_1986 ?auto_1985 ?auto_1984 ?auto_1987 )
      ( MAKE-1CRATE-VERIFY ?auto_1984 ?auto_1985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1994 - SURFACE
      ?auto_1995 - SURFACE
    )
    :vars
    (
      ?auto_1996 - HOIST
      ?auto_1997 - PLACE
      ?auto_1999 - PLACE
      ?auto_2000 - HOIST
      ?auto_2001 - SURFACE
      ?auto_1998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1996 ?auto_1997 ) ( SURFACE-AT ?auto_1994 ?auto_1997 ) ( CLEAR ?auto_1994 ) ( IS-CRATE ?auto_1995 ) ( AVAILABLE ?auto_1996 ) ( not ( = ?auto_1999 ?auto_1997 ) ) ( HOIST-AT ?auto_2000 ?auto_1999 ) ( AVAILABLE ?auto_2000 ) ( SURFACE-AT ?auto_1995 ?auto_1999 ) ( ON ?auto_1995 ?auto_2001 ) ( CLEAR ?auto_1995 ) ( TRUCK-AT ?auto_1998 ?auto_1997 ) ( not ( = ?auto_1994 ?auto_1995 ) ) ( not ( = ?auto_1994 ?auto_2001 ) ) ( not ( = ?auto_1995 ?auto_2001 ) ) ( not ( = ?auto_1996 ?auto_2000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1998 ?auto_1997 ?auto_1999 )
      ( !LIFT ?auto_2000 ?auto_1995 ?auto_2001 ?auto_1999 )
      ( !LOAD ?auto_2000 ?auto_1995 ?auto_1998 ?auto_1999 )
      ( !DRIVE ?auto_1998 ?auto_1999 ?auto_1997 )
      ( !UNLOAD ?auto_1996 ?auto_1995 ?auto_1998 ?auto_1997 )
      ( !DROP ?auto_1996 ?auto_1995 ?auto_1994 ?auto_1997 )
      ( MAKE-1CRATE-VERIFY ?auto_1994 ?auto_1995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2005 - SURFACE
      ?auto_2006 - SURFACE
      ?auto_2007 - SURFACE
    )
    :vars
    (
      ?auto_2012 - HOIST
      ?auto_2009 - PLACE
      ?auto_2010 - PLACE
      ?auto_2008 - HOIST
      ?auto_2011 - SURFACE
      ?auto_2014 - PLACE
      ?auto_2015 - HOIST
      ?auto_2016 - SURFACE
      ?auto_2013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2012 ?auto_2009 ) ( IS-CRATE ?auto_2007 ) ( not ( = ?auto_2010 ?auto_2009 ) ) ( HOIST-AT ?auto_2008 ?auto_2010 ) ( AVAILABLE ?auto_2008 ) ( SURFACE-AT ?auto_2007 ?auto_2010 ) ( ON ?auto_2007 ?auto_2011 ) ( CLEAR ?auto_2007 ) ( not ( = ?auto_2006 ?auto_2007 ) ) ( not ( = ?auto_2006 ?auto_2011 ) ) ( not ( = ?auto_2007 ?auto_2011 ) ) ( not ( = ?auto_2012 ?auto_2008 ) ) ( SURFACE-AT ?auto_2005 ?auto_2009 ) ( CLEAR ?auto_2005 ) ( IS-CRATE ?auto_2006 ) ( AVAILABLE ?auto_2012 ) ( not ( = ?auto_2014 ?auto_2009 ) ) ( HOIST-AT ?auto_2015 ?auto_2014 ) ( AVAILABLE ?auto_2015 ) ( SURFACE-AT ?auto_2006 ?auto_2014 ) ( ON ?auto_2006 ?auto_2016 ) ( CLEAR ?auto_2006 ) ( TRUCK-AT ?auto_2013 ?auto_2009 ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2016 ) ) ( not ( = ?auto_2006 ?auto_2016 ) ) ( not ( = ?auto_2012 ?auto_2015 ) ) ( not ( = ?auto_2005 ?auto_2007 ) ) ( not ( = ?auto_2005 ?auto_2011 ) ) ( not ( = ?auto_2007 ?auto_2016 ) ) ( not ( = ?auto_2010 ?auto_2014 ) ) ( not ( = ?auto_2008 ?auto_2015 ) ) ( not ( = ?auto_2011 ?auto_2016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2005 ?auto_2006 )
      ( MAKE-1CRATE ?auto_2006 ?auto_2007 )
      ( MAKE-2CRATE-VERIFY ?auto_2005 ?auto_2006 ?auto_2007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2019 - SURFACE
      ?auto_2020 - SURFACE
    )
    :vars
    (
      ?auto_2021 - HOIST
      ?auto_2022 - PLACE
      ?auto_2024 - PLACE
      ?auto_2025 - HOIST
      ?auto_2026 - SURFACE
      ?auto_2023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021 ?auto_2022 ) ( SURFACE-AT ?auto_2019 ?auto_2022 ) ( CLEAR ?auto_2019 ) ( IS-CRATE ?auto_2020 ) ( AVAILABLE ?auto_2021 ) ( not ( = ?auto_2024 ?auto_2022 ) ) ( HOIST-AT ?auto_2025 ?auto_2024 ) ( AVAILABLE ?auto_2025 ) ( SURFACE-AT ?auto_2020 ?auto_2024 ) ( ON ?auto_2020 ?auto_2026 ) ( CLEAR ?auto_2020 ) ( TRUCK-AT ?auto_2023 ?auto_2022 ) ( not ( = ?auto_2019 ?auto_2020 ) ) ( not ( = ?auto_2019 ?auto_2026 ) ) ( not ( = ?auto_2020 ?auto_2026 ) ) ( not ( = ?auto_2021 ?auto_2025 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2023 ?auto_2022 ?auto_2024 )
      ( !LIFT ?auto_2025 ?auto_2020 ?auto_2026 ?auto_2024 )
      ( !LOAD ?auto_2025 ?auto_2020 ?auto_2023 ?auto_2024 )
      ( !DRIVE ?auto_2023 ?auto_2024 ?auto_2022 )
      ( !UNLOAD ?auto_2021 ?auto_2020 ?auto_2023 ?auto_2022 )
      ( !DROP ?auto_2021 ?auto_2020 ?auto_2019 ?auto_2022 )
      ( MAKE-1CRATE-VERIFY ?auto_2019 ?auto_2020 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2031 - SURFACE
      ?auto_2032 - SURFACE
      ?auto_2033 - SURFACE
      ?auto_2034 - SURFACE
    )
    :vars
    (
      ?auto_2037 - HOIST
      ?auto_2039 - PLACE
      ?auto_2038 - PLACE
      ?auto_2035 - HOIST
      ?auto_2036 - SURFACE
      ?auto_2041 - PLACE
      ?auto_2043 - HOIST
      ?auto_2042 - SURFACE
      ?auto_2046 - PLACE
      ?auto_2044 - HOIST
      ?auto_2045 - SURFACE
      ?auto_2040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2037 ?auto_2039 ) ( IS-CRATE ?auto_2034 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( HOIST-AT ?auto_2035 ?auto_2038 ) ( AVAILABLE ?auto_2035 ) ( SURFACE-AT ?auto_2034 ?auto_2038 ) ( ON ?auto_2034 ?auto_2036 ) ( CLEAR ?auto_2034 ) ( not ( = ?auto_2033 ?auto_2034 ) ) ( not ( = ?auto_2033 ?auto_2036 ) ) ( not ( = ?auto_2034 ?auto_2036 ) ) ( not ( = ?auto_2037 ?auto_2035 ) ) ( IS-CRATE ?auto_2033 ) ( not ( = ?auto_2041 ?auto_2039 ) ) ( HOIST-AT ?auto_2043 ?auto_2041 ) ( AVAILABLE ?auto_2043 ) ( SURFACE-AT ?auto_2033 ?auto_2041 ) ( ON ?auto_2033 ?auto_2042 ) ( CLEAR ?auto_2033 ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2032 ?auto_2042 ) ) ( not ( = ?auto_2033 ?auto_2042 ) ) ( not ( = ?auto_2037 ?auto_2043 ) ) ( SURFACE-AT ?auto_2031 ?auto_2039 ) ( CLEAR ?auto_2031 ) ( IS-CRATE ?auto_2032 ) ( AVAILABLE ?auto_2037 ) ( not ( = ?auto_2046 ?auto_2039 ) ) ( HOIST-AT ?auto_2044 ?auto_2046 ) ( AVAILABLE ?auto_2044 ) ( SURFACE-AT ?auto_2032 ?auto_2046 ) ( ON ?auto_2032 ?auto_2045 ) ( CLEAR ?auto_2032 ) ( TRUCK-AT ?auto_2040 ?auto_2039 ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( not ( = ?auto_2031 ?auto_2045 ) ) ( not ( = ?auto_2032 ?auto_2045 ) ) ( not ( = ?auto_2037 ?auto_2044 ) ) ( not ( = ?auto_2031 ?auto_2033 ) ) ( not ( = ?auto_2031 ?auto_2042 ) ) ( not ( = ?auto_2033 ?auto_2045 ) ) ( not ( = ?auto_2041 ?auto_2046 ) ) ( not ( = ?auto_2043 ?auto_2044 ) ) ( not ( = ?auto_2042 ?auto_2045 ) ) ( not ( = ?auto_2031 ?auto_2034 ) ) ( not ( = ?auto_2031 ?auto_2036 ) ) ( not ( = ?auto_2032 ?auto_2034 ) ) ( not ( = ?auto_2032 ?auto_2036 ) ) ( not ( = ?auto_2034 ?auto_2042 ) ) ( not ( = ?auto_2034 ?auto_2045 ) ) ( not ( = ?auto_2038 ?auto_2041 ) ) ( not ( = ?auto_2038 ?auto_2046 ) ) ( not ( = ?auto_2035 ?auto_2043 ) ) ( not ( = ?auto_2035 ?auto_2044 ) ) ( not ( = ?auto_2036 ?auto_2042 ) ) ( not ( = ?auto_2036 ?auto_2045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031 ?auto_2032 ?auto_2033 )
      ( MAKE-1CRATE ?auto_2033 ?auto_2034 )
      ( MAKE-3CRATE-VERIFY ?auto_2031 ?auto_2032 ?auto_2033 ?auto_2034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2049 - SURFACE
      ?auto_2050 - SURFACE
    )
    :vars
    (
      ?auto_2051 - HOIST
      ?auto_2052 - PLACE
      ?auto_2054 - PLACE
      ?auto_2055 - HOIST
      ?auto_2056 - SURFACE
      ?auto_2053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2051 ?auto_2052 ) ( SURFACE-AT ?auto_2049 ?auto_2052 ) ( CLEAR ?auto_2049 ) ( IS-CRATE ?auto_2050 ) ( AVAILABLE ?auto_2051 ) ( not ( = ?auto_2054 ?auto_2052 ) ) ( HOIST-AT ?auto_2055 ?auto_2054 ) ( AVAILABLE ?auto_2055 ) ( SURFACE-AT ?auto_2050 ?auto_2054 ) ( ON ?auto_2050 ?auto_2056 ) ( CLEAR ?auto_2050 ) ( TRUCK-AT ?auto_2053 ?auto_2052 ) ( not ( = ?auto_2049 ?auto_2050 ) ) ( not ( = ?auto_2049 ?auto_2056 ) ) ( not ( = ?auto_2050 ?auto_2056 ) ) ( not ( = ?auto_2051 ?auto_2055 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2053 ?auto_2052 ?auto_2054 )
      ( !LIFT ?auto_2055 ?auto_2050 ?auto_2056 ?auto_2054 )
      ( !LOAD ?auto_2055 ?auto_2050 ?auto_2053 ?auto_2054 )
      ( !DRIVE ?auto_2053 ?auto_2054 ?auto_2052 )
      ( !UNLOAD ?auto_2051 ?auto_2050 ?auto_2053 ?auto_2052 )
      ( !DROP ?auto_2051 ?auto_2050 ?auto_2049 ?auto_2052 )
      ( MAKE-1CRATE-VERIFY ?auto_2049 ?auto_2050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2062 - SURFACE
      ?auto_2063 - SURFACE
      ?auto_2064 - SURFACE
      ?auto_2065 - SURFACE
      ?auto_2066 - SURFACE
    )
    :vars
    (
      ?auto_2072 - HOIST
      ?auto_2069 - PLACE
      ?auto_2068 - PLACE
      ?auto_2067 - HOIST
      ?auto_2071 - SURFACE
      ?auto_2073 - SURFACE
      ?auto_2078 - PLACE
      ?auto_2075 - HOIST
      ?auto_2079 - SURFACE
      ?auto_2074 - PLACE
      ?auto_2077 - HOIST
      ?auto_2076 - SURFACE
      ?auto_2070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072 ?auto_2069 ) ( IS-CRATE ?auto_2066 ) ( not ( = ?auto_2068 ?auto_2069 ) ) ( HOIST-AT ?auto_2067 ?auto_2068 ) ( SURFACE-AT ?auto_2066 ?auto_2068 ) ( ON ?auto_2066 ?auto_2071 ) ( CLEAR ?auto_2066 ) ( not ( = ?auto_2065 ?auto_2066 ) ) ( not ( = ?auto_2065 ?auto_2071 ) ) ( not ( = ?auto_2066 ?auto_2071 ) ) ( not ( = ?auto_2072 ?auto_2067 ) ) ( IS-CRATE ?auto_2065 ) ( AVAILABLE ?auto_2067 ) ( SURFACE-AT ?auto_2065 ?auto_2068 ) ( ON ?auto_2065 ?auto_2073 ) ( CLEAR ?auto_2065 ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( not ( = ?auto_2064 ?auto_2073 ) ) ( not ( = ?auto_2065 ?auto_2073 ) ) ( IS-CRATE ?auto_2064 ) ( not ( = ?auto_2078 ?auto_2069 ) ) ( HOIST-AT ?auto_2075 ?auto_2078 ) ( AVAILABLE ?auto_2075 ) ( SURFACE-AT ?auto_2064 ?auto_2078 ) ( ON ?auto_2064 ?auto_2079 ) ( CLEAR ?auto_2064 ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2079 ) ) ( not ( = ?auto_2064 ?auto_2079 ) ) ( not ( = ?auto_2072 ?auto_2075 ) ) ( SURFACE-AT ?auto_2062 ?auto_2069 ) ( CLEAR ?auto_2062 ) ( IS-CRATE ?auto_2063 ) ( AVAILABLE ?auto_2072 ) ( not ( = ?auto_2074 ?auto_2069 ) ) ( HOIST-AT ?auto_2077 ?auto_2074 ) ( AVAILABLE ?auto_2077 ) ( SURFACE-AT ?auto_2063 ?auto_2074 ) ( ON ?auto_2063 ?auto_2076 ) ( CLEAR ?auto_2063 ) ( TRUCK-AT ?auto_2070 ?auto_2069 ) ( not ( = ?auto_2062 ?auto_2063 ) ) ( not ( = ?auto_2062 ?auto_2076 ) ) ( not ( = ?auto_2063 ?auto_2076 ) ) ( not ( = ?auto_2072 ?auto_2077 ) ) ( not ( = ?auto_2062 ?auto_2064 ) ) ( not ( = ?auto_2062 ?auto_2079 ) ) ( not ( = ?auto_2064 ?auto_2076 ) ) ( not ( = ?auto_2078 ?auto_2074 ) ) ( not ( = ?auto_2075 ?auto_2077 ) ) ( not ( = ?auto_2079 ?auto_2076 ) ) ( not ( = ?auto_2062 ?auto_2065 ) ) ( not ( = ?auto_2062 ?auto_2073 ) ) ( not ( = ?auto_2063 ?auto_2065 ) ) ( not ( = ?auto_2063 ?auto_2073 ) ) ( not ( = ?auto_2065 ?auto_2079 ) ) ( not ( = ?auto_2065 ?auto_2076 ) ) ( not ( = ?auto_2068 ?auto_2078 ) ) ( not ( = ?auto_2068 ?auto_2074 ) ) ( not ( = ?auto_2067 ?auto_2075 ) ) ( not ( = ?auto_2067 ?auto_2077 ) ) ( not ( = ?auto_2073 ?auto_2079 ) ) ( not ( = ?auto_2073 ?auto_2076 ) ) ( not ( = ?auto_2062 ?auto_2066 ) ) ( not ( = ?auto_2062 ?auto_2071 ) ) ( not ( = ?auto_2063 ?auto_2066 ) ) ( not ( = ?auto_2063 ?auto_2071 ) ) ( not ( = ?auto_2064 ?auto_2066 ) ) ( not ( = ?auto_2064 ?auto_2071 ) ) ( not ( = ?auto_2066 ?auto_2073 ) ) ( not ( = ?auto_2066 ?auto_2079 ) ) ( not ( = ?auto_2066 ?auto_2076 ) ) ( not ( = ?auto_2071 ?auto_2073 ) ) ( not ( = ?auto_2071 ?auto_2079 ) ) ( not ( = ?auto_2071 ?auto_2076 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2062 ?auto_2063 ?auto_2064 ?auto_2065 )
      ( MAKE-1CRATE ?auto_2065 ?auto_2066 )
      ( MAKE-4CRATE-VERIFY ?auto_2062 ?auto_2063 ?auto_2064 ?auto_2065 ?auto_2066 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2082 - SURFACE
      ?auto_2083 - SURFACE
    )
    :vars
    (
      ?auto_2084 - HOIST
      ?auto_2085 - PLACE
      ?auto_2087 - PLACE
      ?auto_2088 - HOIST
      ?auto_2089 - SURFACE
      ?auto_2086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2084 ?auto_2085 ) ( SURFACE-AT ?auto_2082 ?auto_2085 ) ( CLEAR ?auto_2082 ) ( IS-CRATE ?auto_2083 ) ( AVAILABLE ?auto_2084 ) ( not ( = ?auto_2087 ?auto_2085 ) ) ( HOIST-AT ?auto_2088 ?auto_2087 ) ( AVAILABLE ?auto_2088 ) ( SURFACE-AT ?auto_2083 ?auto_2087 ) ( ON ?auto_2083 ?auto_2089 ) ( CLEAR ?auto_2083 ) ( TRUCK-AT ?auto_2086 ?auto_2085 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( not ( = ?auto_2082 ?auto_2089 ) ) ( not ( = ?auto_2083 ?auto_2089 ) ) ( not ( = ?auto_2084 ?auto_2088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2086 ?auto_2085 ?auto_2087 )
      ( !LIFT ?auto_2088 ?auto_2083 ?auto_2089 ?auto_2087 )
      ( !LOAD ?auto_2088 ?auto_2083 ?auto_2086 ?auto_2087 )
      ( !DRIVE ?auto_2086 ?auto_2087 ?auto_2085 )
      ( !UNLOAD ?auto_2084 ?auto_2083 ?auto_2086 ?auto_2085 )
      ( !DROP ?auto_2084 ?auto_2083 ?auto_2082 ?auto_2085 )
      ( MAKE-1CRATE-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2096 - SURFACE
      ?auto_2097 - SURFACE
      ?auto_2098 - SURFACE
      ?auto_2099 - SURFACE
      ?auto_2100 - SURFACE
      ?auto_2101 - SURFACE
    )
    :vars
    (
      ?auto_2104 - HOIST
      ?auto_2105 - PLACE
      ?auto_2103 - PLACE
      ?auto_2102 - HOIST
      ?auto_2106 - SURFACE
      ?auto_2115 - PLACE
      ?auto_2111 - HOIST
      ?auto_2109 - SURFACE
      ?auto_2113 - SURFACE
      ?auto_2114 - SURFACE
      ?auto_2112 - PLACE
      ?auto_2110 - HOIST
      ?auto_2108 - SURFACE
      ?auto_2107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2104 ?auto_2105 ) ( IS-CRATE ?auto_2101 ) ( not ( = ?auto_2103 ?auto_2105 ) ) ( HOIST-AT ?auto_2102 ?auto_2103 ) ( SURFACE-AT ?auto_2101 ?auto_2103 ) ( ON ?auto_2101 ?auto_2106 ) ( CLEAR ?auto_2101 ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2106 ) ) ( not ( = ?auto_2101 ?auto_2106 ) ) ( not ( = ?auto_2104 ?auto_2102 ) ) ( IS-CRATE ?auto_2100 ) ( not ( = ?auto_2115 ?auto_2105 ) ) ( HOIST-AT ?auto_2111 ?auto_2115 ) ( SURFACE-AT ?auto_2100 ?auto_2115 ) ( ON ?auto_2100 ?auto_2109 ) ( CLEAR ?auto_2100 ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2109 ) ) ( not ( = ?auto_2100 ?auto_2109 ) ) ( not ( = ?auto_2104 ?auto_2111 ) ) ( IS-CRATE ?auto_2099 ) ( AVAILABLE ?auto_2111 ) ( SURFACE-AT ?auto_2099 ?auto_2115 ) ( ON ?auto_2099 ?auto_2113 ) ( CLEAR ?auto_2099 ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( not ( = ?auto_2098 ?auto_2113 ) ) ( not ( = ?auto_2099 ?auto_2113 ) ) ( IS-CRATE ?auto_2098 ) ( AVAILABLE ?auto_2102 ) ( SURFACE-AT ?auto_2098 ?auto_2103 ) ( ON ?auto_2098 ?auto_2114 ) ( CLEAR ?auto_2098 ) ( not ( = ?auto_2097 ?auto_2098 ) ) ( not ( = ?auto_2097 ?auto_2114 ) ) ( not ( = ?auto_2098 ?auto_2114 ) ) ( SURFACE-AT ?auto_2096 ?auto_2105 ) ( CLEAR ?auto_2096 ) ( IS-CRATE ?auto_2097 ) ( AVAILABLE ?auto_2104 ) ( not ( = ?auto_2112 ?auto_2105 ) ) ( HOIST-AT ?auto_2110 ?auto_2112 ) ( AVAILABLE ?auto_2110 ) ( SURFACE-AT ?auto_2097 ?auto_2112 ) ( ON ?auto_2097 ?auto_2108 ) ( CLEAR ?auto_2097 ) ( TRUCK-AT ?auto_2107 ?auto_2105 ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2108 ) ) ( not ( = ?auto_2097 ?auto_2108 ) ) ( not ( = ?auto_2104 ?auto_2110 ) ) ( not ( = ?auto_2096 ?auto_2098 ) ) ( not ( = ?auto_2096 ?auto_2114 ) ) ( not ( = ?auto_2098 ?auto_2108 ) ) ( not ( = ?auto_2103 ?auto_2112 ) ) ( not ( = ?auto_2102 ?auto_2110 ) ) ( not ( = ?auto_2114 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2099 ) ) ( not ( = ?auto_2096 ?auto_2113 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2113 ) ) ( not ( = ?auto_2099 ?auto_2114 ) ) ( not ( = ?auto_2099 ?auto_2108 ) ) ( not ( = ?auto_2115 ?auto_2103 ) ) ( not ( = ?auto_2115 ?auto_2112 ) ) ( not ( = ?auto_2111 ?auto_2102 ) ) ( not ( = ?auto_2111 ?auto_2110 ) ) ( not ( = ?auto_2113 ?auto_2114 ) ) ( not ( = ?auto_2113 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2100 ) ) ( not ( = ?auto_2096 ?auto_2109 ) ) ( not ( = ?auto_2097 ?auto_2100 ) ) ( not ( = ?auto_2097 ?auto_2109 ) ) ( not ( = ?auto_2098 ?auto_2100 ) ) ( not ( = ?auto_2098 ?auto_2109 ) ) ( not ( = ?auto_2100 ?auto_2113 ) ) ( not ( = ?auto_2100 ?auto_2114 ) ) ( not ( = ?auto_2100 ?auto_2108 ) ) ( not ( = ?auto_2109 ?auto_2113 ) ) ( not ( = ?auto_2109 ?auto_2114 ) ) ( not ( = ?auto_2109 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2101 ) ) ( not ( = ?auto_2096 ?auto_2106 ) ) ( not ( = ?auto_2097 ?auto_2101 ) ) ( not ( = ?auto_2097 ?auto_2106 ) ) ( not ( = ?auto_2098 ?auto_2101 ) ) ( not ( = ?auto_2098 ?auto_2106 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2099 ?auto_2106 ) ) ( not ( = ?auto_2101 ?auto_2109 ) ) ( not ( = ?auto_2101 ?auto_2113 ) ) ( not ( = ?auto_2101 ?auto_2114 ) ) ( not ( = ?auto_2101 ?auto_2108 ) ) ( not ( = ?auto_2106 ?auto_2109 ) ) ( not ( = ?auto_2106 ?auto_2113 ) ) ( not ( = ?auto_2106 ?auto_2114 ) ) ( not ( = ?auto_2106 ?auto_2108 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2096 ?auto_2097 ?auto_2098 ?auto_2099 ?auto_2100 )
      ( MAKE-1CRATE ?auto_2100 ?auto_2101 )
      ( MAKE-5CRATE-VERIFY ?auto_2096 ?auto_2097 ?auto_2098 ?auto_2099 ?auto_2100 ?auto_2101 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2118 - SURFACE
      ?auto_2119 - SURFACE
    )
    :vars
    (
      ?auto_2120 - HOIST
      ?auto_2121 - PLACE
      ?auto_2123 - PLACE
      ?auto_2124 - HOIST
      ?auto_2125 - SURFACE
      ?auto_2122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2120 ?auto_2121 ) ( SURFACE-AT ?auto_2118 ?auto_2121 ) ( CLEAR ?auto_2118 ) ( IS-CRATE ?auto_2119 ) ( AVAILABLE ?auto_2120 ) ( not ( = ?auto_2123 ?auto_2121 ) ) ( HOIST-AT ?auto_2124 ?auto_2123 ) ( AVAILABLE ?auto_2124 ) ( SURFACE-AT ?auto_2119 ?auto_2123 ) ( ON ?auto_2119 ?auto_2125 ) ( CLEAR ?auto_2119 ) ( TRUCK-AT ?auto_2122 ?auto_2121 ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2125 ) ) ( not ( = ?auto_2119 ?auto_2125 ) ) ( not ( = ?auto_2120 ?auto_2124 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2122 ?auto_2121 ?auto_2123 )
      ( !LIFT ?auto_2124 ?auto_2119 ?auto_2125 ?auto_2123 )
      ( !LOAD ?auto_2124 ?auto_2119 ?auto_2122 ?auto_2123 )
      ( !DRIVE ?auto_2122 ?auto_2123 ?auto_2121 )
      ( !UNLOAD ?auto_2120 ?auto_2119 ?auto_2122 ?auto_2121 )
      ( !DROP ?auto_2120 ?auto_2119 ?auto_2118 ?auto_2121 )
      ( MAKE-1CRATE-VERIFY ?auto_2118 ?auto_2119 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2133 - SURFACE
      ?auto_2134 - SURFACE
      ?auto_2135 - SURFACE
      ?auto_2136 - SURFACE
      ?auto_2137 - SURFACE
      ?auto_2139 - SURFACE
      ?auto_2138 - SURFACE
    )
    :vars
    (
      ?auto_2140 - HOIST
      ?auto_2142 - PLACE
      ?auto_2145 - PLACE
      ?auto_2144 - HOIST
      ?auto_2143 - SURFACE
      ?auto_2152 - PLACE
      ?auto_2147 - HOIST
      ?auto_2148 - SURFACE
      ?auto_2151 - PLACE
      ?auto_2156 - HOIST
      ?auto_2150 - SURFACE
      ?auto_2146 - SURFACE
      ?auto_2153 - SURFACE
      ?auto_2149 - PLACE
      ?auto_2155 - HOIST
      ?auto_2154 - SURFACE
      ?auto_2141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140 ?auto_2142 ) ( IS-CRATE ?auto_2138 ) ( not ( = ?auto_2145 ?auto_2142 ) ) ( HOIST-AT ?auto_2144 ?auto_2145 ) ( AVAILABLE ?auto_2144 ) ( SURFACE-AT ?auto_2138 ?auto_2145 ) ( ON ?auto_2138 ?auto_2143 ) ( CLEAR ?auto_2138 ) ( not ( = ?auto_2139 ?auto_2138 ) ) ( not ( = ?auto_2139 ?auto_2143 ) ) ( not ( = ?auto_2138 ?auto_2143 ) ) ( not ( = ?auto_2140 ?auto_2144 ) ) ( IS-CRATE ?auto_2139 ) ( not ( = ?auto_2152 ?auto_2142 ) ) ( HOIST-AT ?auto_2147 ?auto_2152 ) ( SURFACE-AT ?auto_2139 ?auto_2152 ) ( ON ?auto_2139 ?auto_2148 ) ( CLEAR ?auto_2139 ) ( not ( = ?auto_2137 ?auto_2139 ) ) ( not ( = ?auto_2137 ?auto_2148 ) ) ( not ( = ?auto_2139 ?auto_2148 ) ) ( not ( = ?auto_2140 ?auto_2147 ) ) ( IS-CRATE ?auto_2137 ) ( not ( = ?auto_2151 ?auto_2142 ) ) ( HOIST-AT ?auto_2156 ?auto_2151 ) ( SURFACE-AT ?auto_2137 ?auto_2151 ) ( ON ?auto_2137 ?auto_2150 ) ( CLEAR ?auto_2137 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2150 ) ) ( not ( = ?auto_2140 ?auto_2156 ) ) ( IS-CRATE ?auto_2136 ) ( AVAILABLE ?auto_2156 ) ( SURFACE-AT ?auto_2136 ?auto_2151 ) ( ON ?auto_2136 ?auto_2146 ) ( CLEAR ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2146 ) ) ( not ( = ?auto_2136 ?auto_2146 ) ) ( IS-CRATE ?auto_2135 ) ( AVAILABLE ?auto_2147 ) ( SURFACE-AT ?auto_2135 ?auto_2152 ) ( ON ?auto_2135 ?auto_2153 ) ( CLEAR ?auto_2135 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2153 ) ) ( not ( = ?auto_2135 ?auto_2153 ) ) ( SURFACE-AT ?auto_2133 ?auto_2142 ) ( CLEAR ?auto_2133 ) ( IS-CRATE ?auto_2134 ) ( AVAILABLE ?auto_2140 ) ( not ( = ?auto_2149 ?auto_2142 ) ) ( HOIST-AT ?auto_2155 ?auto_2149 ) ( AVAILABLE ?auto_2155 ) ( SURFACE-AT ?auto_2134 ?auto_2149 ) ( ON ?auto_2134 ?auto_2154 ) ( CLEAR ?auto_2134 ) ( TRUCK-AT ?auto_2141 ?auto_2142 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2154 ) ) ( not ( = ?auto_2134 ?auto_2154 ) ) ( not ( = ?auto_2140 ?auto_2155 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( not ( = ?auto_2133 ?auto_2153 ) ) ( not ( = ?auto_2135 ?auto_2154 ) ) ( not ( = ?auto_2152 ?auto_2149 ) ) ( not ( = ?auto_2147 ?auto_2155 ) ) ( not ( = ?auto_2153 ?auto_2154 ) ) ( not ( = ?auto_2133 ?auto_2136 ) ) ( not ( = ?auto_2133 ?auto_2146 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2134 ?auto_2146 ) ) ( not ( = ?auto_2136 ?auto_2153 ) ) ( not ( = ?auto_2136 ?auto_2154 ) ) ( not ( = ?auto_2151 ?auto_2152 ) ) ( not ( = ?auto_2151 ?auto_2149 ) ) ( not ( = ?auto_2156 ?auto_2147 ) ) ( not ( = ?auto_2156 ?auto_2155 ) ) ( not ( = ?auto_2146 ?auto_2153 ) ) ( not ( = ?auto_2146 ?auto_2154 ) ) ( not ( = ?auto_2133 ?auto_2137 ) ) ( not ( = ?auto_2133 ?auto_2150 ) ) ( not ( = ?auto_2134 ?auto_2137 ) ) ( not ( = ?auto_2134 ?auto_2150 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2146 ) ) ( not ( = ?auto_2137 ?auto_2153 ) ) ( not ( = ?auto_2137 ?auto_2154 ) ) ( not ( = ?auto_2150 ?auto_2146 ) ) ( not ( = ?auto_2150 ?auto_2153 ) ) ( not ( = ?auto_2150 ?auto_2154 ) ) ( not ( = ?auto_2133 ?auto_2139 ) ) ( not ( = ?auto_2133 ?auto_2148 ) ) ( not ( = ?auto_2134 ?auto_2139 ) ) ( not ( = ?auto_2134 ?auto_2148 ) ) ( not ( = ?auto_2135 ?auto_2139 ) ) ( not ( = ?auto_2135 ?auto_2148 ) ) ( not ( = ?auto_2136 ?auto_2139 ) ) ( not ( = ?auto_2136 ?auto_2148 ) ) ( not ( = ?auto_2139 ?auto_2150 ) ) ( not ( = ?auto_2139 ?auto_2146 ) ) ( not ( = ?auto_2139 ?auto_2153 ) ) ( not ( = ?auto_2139 ?auto_2154 ) ) ( not ( = ?auto_2148 ?auto_2150 ) ) ( not ( = ?auto_2148 ?auto_2146 ) ) ( not ( = ?auto_2148 ?auto_2153 ) ) ( not ( = ?auto_2148 ?auto_2154 ) ) ( not ( = ?auto_2133 ?auto_2138 ) ) ( not ( = ?auto_2133 ?auto_2143 ) ) ( not ( = ?auto_2134 ?auto_2138 ) ) ( not ( = ?auto_2134 ?auto_2143 ) ) ( not ( = ?auto_2135 ?auto_2138 ) ) ( not ( = ?auto_2135 ?auto_2143 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2136 ?auto_2143 ) ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2143 ) ) ( not ( = ?auto_2138 ?auto_2148 ) ) ( not ( = ?auto_2138 ?auto_2150 ) ) ( not ( = ?auto_2138 ?auto_2146 ) ) ( not ( = ?auto_2138 ?auto_2153 ) ) ( not ( = ?auto_2138 ?auto_2154 ) ) ( not ( = ?auto_2145 ?auto_2152 ) ) ( not ( = ?auto_2145 ?auto_2151 ) ) ( not ( = ?auto_2145 ?auto_2149 ) ) ( not ( = ?auto_2144 ?auto_2147 ) ) ( not ( = ?auto_2144 ?auto_2156 ) ) ( not ( = ?auto_2144 ?auto_2155 ) ) ( not ( = ?auto_2143 ?auto_2148 ) ) ( not ( = ?auto_2143 ?auto_2150 ) ) ( not ( = ?auto_2143 ?auto_2146 ) ) ( not ( = ?auto_2143 ?auto_2153 ) ) ( not ( = ?auto_2143 ?auto_2154 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2139 )
      ( MAKE-1CRATE ?auto_2139 ?auto_2138 )
      ( MAKE-6CRATE-VERIFY ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2139 ?auto_2138 ) )
  )

)

