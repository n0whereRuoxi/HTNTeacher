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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1976 - SURFACE
      ?auto_1977 - SURFACE
    )
    :vars
    (
      ?auto_1978 - HOIST
      ?auto_1979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1978 ?auto_1979 ) ( SURFACE-AT ?auto_1977 ?auto_1979 ) ( CLEAR ?auto_1977 ) ( LIFTING ?auto_1978 ?auto_1976 ) ( IS-CRATE ?auto_1976 ) ( not ( = ?auto_1976 ?auto_1977 ) ) )
    :subtasks
    ( ( !DROP ?auto_1978 ?auto_1976 ?auto_1977 ?auto_1979 )
      ( MAKE-ON-VERIFY ?auto_1976 ?auto_1977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1980 - SURFACE
      ?auto_1981 - SURFACE
    )
    :vars
    (
      ?auto_1983 - HOIST
      ?auto_1982 - PLACE
      ?auto_1984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1983 ?auto_1982 ) ( SURFACE-AT ?auto_1981 ?auto_1982 ) ( CLEAR ?auto_1981 ) ( IS-CRATE ?auto_1980 ) ( not ( = ?auto_1980 ?auto_1981 ) ) ( TRUCK-AT ?auto_1984 ?auto_1982 ) ( AVAILABLE ?auto_1983 ) ( IN ?auto_1980 ?auto_1984 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1983 ?auto_1980 ?auto_1984 ?auto_1982 )
      ( MAKE-ON ?auto_1980 ?auto_1981 )
      ( MAKE-ON-VERIFY ?auto_1980 ?auto_1981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1985 - SURFACE
      ?auto_1986 - SURFACE
    )
    :vars
    (
      ?auto_1988 - HOIST
      ?auto_1987 - PLACE
      ?auto_1989 - TRUCK
      ?auto_1990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1988 ?auto_1987 ) ( SURFACE-AT ?auto_1986 ?auto_1987 ) ( CLEAR ?auto_1986 ) ( IS-CRATE ?auto_1985 ) ( not ( = ?auto_1985 ?auto_1986 ) ) ( AVAILABLE ?auto_1988 ) ( IN ?auto_1985 ?auto_1989 ) ( TRUCK-AT ?auto_1989 ?auto_1990 ) ( not ( = ?auto_1990 ?auto_1987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1989 ?auto_1990 ?auto_1987 )
      ( MAKE-ON ?auto_1985 ?auto_1986 )
      ( MAKE-ON-VERIFY ?auto_1985 ?auto_1986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1991 - SURFACE
      ?auto_1992 - SURFACE
    )
    :vars
    (
      ?auto_1994 - HOIST
      ?auto_1996 - PLACE
      ?auto_1995 - TRUCK
      ?auto_1993 - PLACE
      ?auto_1997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1994 ?auto_1996 ) ( SURFACE-AT ?auto_1992 ?auto_1996 ) ( CLEAR ?auto_1992 ) ( IS-CRATE ?auto_1991 ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( AVAILABLE ?auto_1994 ) ( TRUCK-AT ?auto_1995 ?auto_1993 ) ( not ( = ?auto_1993 ?auto_1996 ) ) ( HOIST-AT ?auto_1997 ?auto_1993 ) ( LIFTING ?auto_1997 ?auto_1991 ) ( not ( = ?auto_1994 ?auto_1997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1997 ?auto_1991 ?auto_1995 ?auto_1993 )
      ( MAKE-ON ?auto_1991 ?auto_1992 )
      ( MAKE-ON-VERIFY ?auto_1991 ?auto_1992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1998 - SURFACE
      ?auto_1999 - SURFACE
    )
    :vars
    (
      ?auto_2004 - HOIST
      ?auto_2000 - PLACE
      ?auto_2002 - TRUCK
      ?auto_2003 - PLACE
      ?auto_2001 - HOIST
      ?auto_2005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2004 ?auto_2000 ) ( SURFACE-AT ?auto_1999 ?auto_2000 ) ( CLEAR ?auto_1999 ) ( IS-CRATE ?auto_1998 ) ( not ( = ?auto_1998 ?auto_1999 ) ) ( AVAILABLE ?auto_2004 ) ( TRUCK-AT ?auto_2002 ?auto_2003 ) ( not ( = ?auto_2003 ?auto_2000 ) ) ( HOIST-AT ?auto_2001 ?auto_2003 ) ( not ( = ?auto_2004 ?auto_2001 ) ) ( AVAILABLE ?auto_2001 ) ( SURFACE-AT ?auto_1998 ?auto_2003 ) ( ON ?auto_1998 ?auto_2005 ) ( CLEAR ?auto_1998 ) ( not ( = ?auto_1998 ?auto_2005 ) ) ( not ( = ?auto_1999 ?auto_2005 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2001 ?auto_1998 ?auto_2005 ?auto_2003 )
      ( MAKE-ON ?auto_1998 ?auto_1999 )
      ( MAKE-ON-VERIFY ?auto_1998 ?auto_1999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2006 - SURFACE
      ?auto_2007 - SURFACE
    )
    :vars
    (
      ?auto_2008 - HOIST
      ?auto_2009 - PLACE
      ?auto_2013 - PLACE
      ?auto_2012 - HOIST
      ?auto_2010 - SURFACE
      ?auto_2011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2008 ?auto_2009 ) ( SURFACE-AT ?auto_2007 ?auto_2009 ) ( CLEAR ?auto_2007 ) ( IS-CRATE ?auto_2006 ) ( not ( = ?auto_2006 ?auto_2007 ) ) ( AVAILABLE ?auto_2008 ) ( not ( = ?auto_2013 ?auto_2009 ) ) ( HOIST-AT ?auto_2012 ?auto_2013 ) ( not ( = ?auto_2008 ?auto_2012 ) ) ( AVAILABLE ?auto_2012 ) ( SURFACE-AT ?auto_2006 ?auto_2013 ) ( ON ?auto_2006 ?auto_2010 ) ( CLEAR ?auto_2006 ) ( not ( = ?auto_2006 ?auto_2010 ) ) ( not ( = ?auto_2007 ?auto_2010 ) ) ( TRUCK-AT ?auto_2011 ?auto_2009 ) )
    :subtasks
    ( ( !DRIVE ?auto_2011 ?auto_2009 ?auto_2013 )
      ( MAKE-ON ?auto_2006 ?auto_2007 )
      ( MAKE-ON-VERIFY ?auto_2006 ?auto_2007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2016 - SURFACE
      ?auto_2017 - SURFACE
    )
    :vars
    (
      ?auto_2018 - HOIST
      ?auto_2019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2018 ?auto_2019 ) ( SURFACE-AT ?auto_2017 ?auto_2019 ) ( CLEAR ?auto_2017 ) ( LIFTING ?auto_2018 ?auto_2016 ) ( IS-CRATE ?auto_2016 ) ( not ( = ?auto_2016 ?auto_2017 ) ) )
    :subtasks
    ( ( !DROP ?auto_2018 ?auto_2016 ?auto_2017 ?auto_2019 )
      ( MAKE-ON-VERIFY ?auto_2016 ?auto_2017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2020 - SURFACE
      ?auto_2021 - SURFACE
    )
    :vars
    (
      ?auto_2022 - HOIST
      ?auto_2023 - PLACE
      ?auto_2024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022 ?auto_2023 ) ( SURFACE-AT ?auto_2021 ?auto_2023 ) ( CLEAR ?auto_2021 ) ( IS-CRATE ?auto_2020 ) ( not ( = ?auto_2020 ?auto_2021 ) ) ( TRUCK-AT ?auto_2024 ?auto_2023 ) ( AVAILABLE ?auto_2022 ) ( IN ?auto_2020 ?auto_2024 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2022 ?auto_2020 ?auto_2024 ?auto_2023 )
      ( MAKE-ON ?auto_2020 ?auto_2021 )
      ( MAKE-ON-VERIFY ?auto_2020 ?auto_2021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2025 - SURFACE
      ?auto_2026 - SURFACE
    )
    :vars
    (
      ?auto_2029 - HOIST
      ?auto_2028 - PLACE
      ?auto_2027 - TRUCK
      ?auto_2030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2029 ?auto_2028 ) ( SURFACE-AT ?auto_2026 ?auto_2028 ) ( CLEAR ?auto_2026 ) ( IS-CRATE ?auto_2025 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( AVAILABLE ?auto_2029 ) ( IN ?auto_2025 ?auto_2027 ) ( TRUCK-AT ?auto_2027 ?auto_2030 ) ( not ( = ?auto_2030 ?auto_2028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2027 ?auto_2030 ?auto_2028 )
      ( MAKE-ON ?auto_2025 ?auto_2026 )
      ( MAKE-ON-VERIFY ?auto_2025 ?auto_2026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2031 - SURFACE
      ?auto_2032 - SURFACE
    )
    :vars
    (
      ?auto_2033 - HOIST
      ?auto_2036 - PLACE
      ?auto_2034 - TRUCK
      ?auto_2035 - PLACE
      ?auto_2037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2033 ?auto_2036 ) ( SURFACE-AT ?auto_2032 ?auto_2036 ) ( CLEAR ?auto_2032 ) ( IS-CRATE ?auto_2031 ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( AVAILABLE ?auto_2033 ) ( TRUCK-AT ?auto_2034 ?auto_2035 ) ( not ( = ?auto_2035 ?auto_2036 ) ) ( HOIST-AT ?auto_2037 ?auto_2035 ) ( LIFTING ?auto_2037 ?auto_2031 ) ( not ( = ?auto_2033 ?auto_2037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2037 ?auto_2031 ?auto_2034 ?auto_2035 )
      ( MAKE-ON ?auto_2031 ?auto_2032 )
      ( MAKE-ON-VERIFY ?auto_2031 ?auto_2032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2038 - SURFACE
      ?auto_2039 - SURFACE
    )
    :vars
    (
      ?auto_2041 - HOIST
      ?auto_2040 - PLACE
      ?auto_2044 - TRUCK
      ?auto_2042 - PLACE
      ?auto_2043 - HOIST
      ?auto_2045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041 ?auto_2040 ) ( SURFACE-AT ?auto_2039 ?auto_2040 ) ( CLEAR ?auto_2039 ) ( IS-CRATE ?auto_2038 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( AVAILABLE ?auto_2041 ) ( TRUCK-AT ?auto_2044 ?auto_2042 ) ( not ( = ?auto_2042 ?auto_2040 ) ) ( HOIST-AT ?auto_2043 ?auto_2042 ) ( not ( = ?auto_2041 ?auto_2043 ) ) ( AVAILABLE ?auto_2043 ) ( SURFACE-AT ?auto_2038 ?auto_2042 ) ( ON ?auto_2038 ?auto_2045 ) ( CLEAR ?auto_2038 ) ( not ( = ?auto_2038 ?auto_2045 ) ) ( not ( = ?auto_2039 ?auto_2045 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2043 ?auto_2038 ?auto_2045 ?auto_2042 )
      ( MAKE-ON ?auto_2038 ?auto_2039 )
      ( MAKE-ON-VERIFY ?auto_2038 ?auto_2039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2046 - SURFACE
      ?auto_2047 - SURFACE
    )
    :vars
    (
      ?auto_2053 - HOIST
      ?auto_2051 - PLACE
      ?auto_2052 - PLACE
      ?auto_2050 - HOIST
      ?auto_2049 - SURFACE
      ?auto_2048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2053 ?auto_2051 ) ( SURFACE-AT ?auto_2047 ?auto_2051 ) ( CLEAR ?auto_2047 ) ( IS-CRATE ?auto_2046 ) ( not ( = ?auto_2046 ?auto_2047 ) ) ( AVAILABLE ?auto_2053 ) ( not ( = ?auto_2052 ?auto_2051 ) ) ( HOIST-AT ?auto_2050 ?auto_2052 ) ( not ( = ?auto_2053 ?auto_2050 ) ) ( AVAILABLE ?auto_2050 ) ( SURFACE-AT ?auto_2046 ?auto_2052 ) ( ON ?auto_2046 ?auto_2049 ) ( CLEAR ?auto_2046 ) ( not ( = ?auto_2046 ?auto_2049 ) ) ( not ( = ?auto_2047 ?auto_2049 ) ) ( TRUCK-AT ?auto_2048 ?auto_2051 ) )
    :subtasks
    ( ( !DRIVE ?auto_2048 ?auto_2051 ?auto_2052 )
      ( MAKE-ON ?auto_2046 ?auto_2047 )
      ( MAKE-ON-VERIFY ?auto_2046 ?auto_2047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2054 - SURFACE
      ?auto_2055 - SURFACE
    )
    :vars
    (
      ?auto_2061 - HOIST
      ?auto_2059 - PLACE
      ?auto_2056 - PLACE
      ?auto_2058 - HOIST
      ?auto_2057 - SURFACE
      ?auto_2060 - TRUCK
      ?auto_2062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2061 ?auto_2059 ) ( IS-CRATE ?auto_2054 ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( not ( = ?auto_2056 ?auto_2059 ) ) ( HOIST-AT ?auto_2058 ?auto_2056 ) ( not ( = ?auto_2061 ?auto_2058 ) ) ( AVAILABLE ?auto_2058 ) ( SURFACE-AT ?auto_2054 ?auto_2056 ) ( ON ?auto_2054 ?auto_2057 ) ( CLEAR ?auto_2054 ) ( not ( = ?auto_2054 ?auto_2057 ) ) ( not ( = ?auto_2055 ?auto_2057 ) ) ( TRUCK-AT ?auto_2060 ?auto_2059 ) ( SURFACE-AT ?auto_2062 ?auto_2059 ) ( CLEAR ?auto_2062 ) ( LIFTING ?auto_2061 ?auto_2055 ) ( IS-CRATE ?auto_2055 ) ( not ( = ?auto_2054 ?auto_2062 ) ) ( not ( = ?auto_2055 ?auto_2062 ) ) ( not ( = ?auto_2057 ?auto_2062 ) ) )
    :subtasks
    ( ( !DROP ?auto_2061 ?auto_2055 ?auto_2062 ?auto_2059 )
      ( MAKE-ON ?auto_2054 ?auto_2055 )
      ( MAKE-ON-VERIFY ?auto_2054 ?auto_2055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2063 - SURFACE
      ?auto_2064 - SURFACE
    )
    :vars
    (
      ?auto_2067 - HOIST
      ?auto_2066 - PLACE
      ?auto_2069 - PLACE
      ?auto_2068 - HOIST
      ?auto_2071 - SURFACE
      ?auto_2070 - TRUCK
      ?auto_2065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2067 ?auto_2066 ) ( IS-CRATE ?auto_2063 ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2069 ?auto_2066 ) ) ( HOIST-AT ?auto_2068 ?auto_2069 ) ( not ( = ?auto_2067 ?auto_2068 ) ) ( AVAILABLE ?auto_2068 ) ( SURFACE-AT ?auto_2063 ?auto_2069 ) ( ON ?auto_2063 ?auto_2071 ) ( CLEAR ?auto_2063 ) ( not ( = ?auto_2063 ?auto_2071 ) ) ( not ( = ?auto_2064 ?auto_2071 ) ) ( TRUCK-AT ?auto_2070 ?auto_2066 ) ( SURFACE-AT ?auto_2065 ?auto_2066 ) ( CLEAR ?auto_2065 ) ( IS-CRATE ?auto_2064 ) ( not ( = ?auto_2063 ?auto_2065 ) ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( not ( = ?auto_2071 ?auto_2065 ) ) ( AVAILABLE ?auto_2067 ) ( IN ?auto_2064 ?auto_2070 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2067 ?auto_2064 ?auto_2070 ?auto_2066 )
      ( MAKE-ON ?auto_2063 ?auto_2064 )
      ( MAKE-ON-VERIFY ?auto_2063 ?auto_2064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2072 - SURFACE
      ?auto_2073 - SURFACE
    )
    :vars
    (
      ?auto_2080 - HOIST
      ?auto_2076 - PLACE
      ?auto_2078 - PLACE
      ?auto_2075 - HOIST
      ?auto_2074 - SURFACE
      ?auto_2077 - SURFACE
      ?auto_2079 - TRUCK
      ?auto_2081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2080 ?auto_2076 ) ( IS-CRATE ?auto_2072 ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2078 ?auto_2076 ) ) ( HOIST-AT ?auto_2075 ?auto_2078 ) ( not ( = ?auto_2080 ?auto_2075 ) ) ( AVAILABLE ?auto_2075 ) ( SURFACE-AT ?auto_2072 ?auto_2078 ) ( ON ?auto_2072 ?auto_2074 ) ( CLEAR ?auto_2072 ) ( not ( = ?auto_2072 ?auto_2074 ) ) ( not ( = ?auto_2073 ?auto_2074 ) ) ( SURFACE-AT ?auto_2077 ?auto_2076 ) ( CLEAR ?auto_2077 ) ( IS-CRATE ?auto_2073 ) ( not ( = ?auto_2072 ?auto_2077 ) ) ( not ( = ?auto_2073 ?auto_2077 ) ) ( not ( = ?auto_2074 ?auto_2077 ) ) ( AVAILABLE ?auto_2080 ) ( IN ?auto_2073 ?auto_2079 ) ( TRUCK-AT ?auto_2079 ?auto_2081 ) ( not ( = ?auto_2081 ?auto_2076 ) ) ( not ( = ?auto_2078 ?auto_2081 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2079 ?auto_2081 ?auto_2076 )
      ( MAKE-ON ?auto_2072 ?auto_2073 )
      ( MAKE-ON-VERIFY ?auto_2072 ?auto_2073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2082 - SURFACE
      ?auto_2083 - SURFACE
    )
    :vars
    (
      ?auto_2085 - HOIST
      ?auto_2090 - PLACE
      ?auto_2089 - PLACE
      ?auto_2087 - HOIST
      ?auto_2084 - SURFACE
      ?auto_2088 - SURFACE
      ?auto_2091 - TRUCK
      ?auto_2086 - PLACE
      ?auto_2092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2085 ?auto_2090 ) ( IS-CRATE ?auto_2082 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( not ( = ?auto_2089 ?auto_2090 ) ) ( HOIST-AT ?auto_2087 ?auto_2089 ) ( not ( = ?auto_2085 ?auto_2087 ) ) ( AVAILABLE ?auto_2087 ) ( SURFACE-AT ?auto_2082 ?auto_2089 ) ( ON ?auto_2082 ?auto_2084 ) ( CLEAR ?auto_2082 ) ( not ( = ?auto_2082 ?auto_2084 ) ) ( not ( = ?auto_2083 ?auto_2084 ) ) ( SURFACE-AT ?auto_2088 ?auto_2090 ) ( CLEAR ?auto_2088 ) ( IS-CRATE ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2088 ) ) ( not ( = ?auto_2083 ?auto_2088 ) ) ( not ( = ?auto_2084 ?auto_2088 ) ) ( AVAILABLE ?auto_2085 ) ( TRUCK-AT ?auto_2091 ?auto_2086 ) ( not ( = ?auto_2086 ?auto_2090 ) ) ( not ( = ?auto_2089 ?auto_2086 ) ) ( HOIST-AT ?auto_2092 ?auto_2086 ) ( LIFTING ?auto_2092 ?auto_2083 ) ( not ( = ?auto_2085 ?auto_2092 ) ) ( not ( = ?auto_2087 ?auto_2092 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2092 ?auto_2083 ?auto_2091 ?auto_2086 )
      ( MAKE-ON ?auto_2082 ?auto_2083 )
      ( MAKE-ON-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2093 - SURFACE
      ?auto_2094 - SURFACE
    )
    :vars
    (
      ?auto_2098 - HOIST
      ?auto_2100 - PLACE
      ?auto_2099 - PLACE
      ?auto_2102 - HOIST
      ?auto_2096 - SURFACE
      ?auto_2097 - SURFACE
      ?auto_2095 - TRUCK
      ?auto_2103 - PLACE
      ?auto_2101 - HOIST
      ?auto_2104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2098 ?auto_2100 ) ( IS-CRATE ?auto_2093 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( HOIST-AT ?auto_2102 ?auto_2099 ) ( not ( = ?auto_2098 ?auto_2102 ) ) ( AVAILABLE ?auto_2102 ) ( SURFACE-AT ?auto_2093 ?auto_2099 ) ( ON ?auto_2093 ?auto_2096 ) ( CLEAR ?auto_2093 ) ( not ( = ?auto_2093 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( SURFACE-AT ?auto_2097 ?auto_2100 ) ( CLEAR ?auto_2097 ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2097 ) ) ( not ( = ?auto_2094 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( AVAILABLE ?auto_2098 ) ( TRUCK-AT ?auto_2095 ?auto_2103 ) ( not ( = ?auto_2103 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2103 ) ) ( HOIST-AT ?auto_2101 ?auto_2103 ) ( not ( = ?auto_2098 ?auto_2101 ) ) ( not ( = ?auto_2102 ?auto_2101 ) ) ( AVAILABLE ?auto_2101 ) ( SURFACE-AT ?auto_2094 ?auto_2103 ) ( ON ?auto_2094 ?auto_2104 ) ( CLEAR ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2104 ) ) ( not ( = ?auto_2094 ?auto_2104 ) ) ( not ( = ?auto_2096 ?auto_2104 ) ) ( not ( = ?auto_2097 ?auto_2104 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2101 ?auto_2094 ?auto_2104 ?auto_2103 )
      ( MAKE-ON ?auto_2093 ?auto_2094 )
      ( MAKE-ON-VERIFY ?auto_2093 ?auto_2094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2105 - SURFACE
      ?auto_2106 - SURFACE
    )
    :vars
    (
      ?auto_2112 - HOIST
      ?auto_2116 - PLACE
      ?auto_2115 - PLACE
      ?auto_2109 - HOIST
      ?auto_2110 - SURFACE
      ?auto_2111 - SURFACE
      ?auto_2114 - PLACE
      ?auto_2108 - HOIST
      ?auto_2113 - SURFACE
      ?auto_2107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2112 ?auto_2116 ) ( IS-CRATE ?auto_2105 ) ( not ( = ?auto_2105 ?auto_2106 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( HOIST-AT ?auto_2109 ?auto_2115 ) ( not ( = ?auto_2112 ?auto_2109 ) ) ( AVAILABLE ?auto_2109 ) ( SURFACE-AT ?auto_2105 ?auto_2115 ) ( ON ?auto_2105 ?auto_2110 ) ( CLEAR ?auto_2105 ) ( not ( = ?auto_2105 ?auto_2110 ) ) ( not ( = ?auto_2106 ?auto_2110 ) ) ( SURFACE-AT ?auto_2111 ?auto_2116 ) ( CLEAR ?auto_2111 ) ( IS-CRATE ?auto_2106 ) ( not ( = ?auto_2105 ?auto_2111 ) ) ( not ( = ?auto_2106 ?auto_2111 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( AVAILABLE ?auto_2112 ) ( not ( = ?auto_2114 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2114 ) ) ( HOIST-AT ?auto_2108 ?auto_2114 ) ( not ( = ?auto_2112 ?auto_2108 ) ) ( not ( = ?auto_2109 ?auto_2108 ) ) ( AVAILABLE ?auto_2108 ) ( SURFACE-AT ?auto_2106 ?auto_2114 ) ( ON ?auto_2106 ?auto_2113 ) ( CLEAR ?auto_2106 ) ( not ( = ?auto_2105 ?auto_2113 ) ) ( not ( = ?auto_2106 ?auto_2113 ) ) ( not ( = ?auto_2110 ?auto_2113 ) ) ( not ( = ?auto_2111 ?auto_2113 ) ) ( TRUCK-AT ?auto_2107 ?auto_2116 ) )
    :subtasks
    ( ( !DRIVE ?auto_2107 ?auto_2116 ?auto_2114 )
      ( MAKE-ON ?auto_2105 ?auto_2106 )
      ( MAKE-ON-VERIFY ?auto_2105 ?auto_2106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2119 - SURFACE
      ?auto_2120 - SURFACE
    )
    :vars
    (
      ?auto_2121 - HOIST
      ?auto_2122 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2121 ?auto_2122 ) ( SURFACE-AT ?auto_2120 ?auto_2122 ) ( CLEAR ?auto_2120 ) ( LIFTING ?auto_2121 ?auto_2119 ) ( IS-CRATE ?auto_2119 ) ( not ( = ?auto_2119 ?auto_2120 ) ) )
    :subtasks
    ( ( !DROP ?auto_2121 ?auto_2119 ?auto_2120 ?auto_2122 )
      ( MAKE-ON-VERIFY ?auto_2119 ?auto_2120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2123 - SURFACE
      ?auto_2124 - SURFACE
    )
    :vars
    (
      ?auto_2125 - HOIST
      ?auto_2126 - PLACE
      ?auto_2127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2125 ?auto_2126 ) ( SURFACE-AT ?auto_2124 ?auto_2126 ) ( CLEAR ?auto_2124 ) ( IS-CRATE ?auto_2123 ) ( not ( = ?auto_2123 ?auto_2124 ) ) ( TRUCK-AT ?auto_2127 ?auto_2126 ) ( AVAILABLE ?auto_2125 ) ( IN ?auto_2123 ?auto_2127 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2125 ?auto_2123 ?auto_2127 ?auto_2126 )
      ( MAKE-ON ?auto_2123 ?auto_2124 )
      ( MAKE-ON-VERIFY ?auto_2123 ?auto_2124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2128 - SURFACE
      ?auto_2129 - SURFACE
    )
    :vars
    (
      ?auto_2131 - HOIST
      ?auto_2130 - PLACE
      ?auto_2132 - TRUCK
      ?auto_2133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131 ?auto_2130 ) ( SURFACE-AT ?auto_2129 ?auto_2130 ) ( CLEAR ?auto_2129 ) ( IS-CRATE ?auto_2128 ) ( not ( = ?auto_2128 ?auto_2129 ) ) ( AVAILABLE ?auto_2131 ) ( IN ?auto_2128 ?auto_2132 ) ( TRUCK-AT ?auto_2132 ?auto_2133 ) ( not ( = ?auto_2133 ?auto_2130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2132 ?auto_2133 ?auto_2130 )
      ( MAKE-ON ?auto_2128 ?auto_2129 )
      ( MAKE-ON-VERIFY ?auto_2128 ?auto_2129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2134 - SURFACE
      ?auto_2135 - SURFACE
    )
    :vars
    (
      ?auto_2137 - HOIST
      ?auto_2136 - PLACE
      ?auto_2139 - TRUCK
      ?auto_2138 - PLACE
      ?auto_2140 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137 ?auto_2136 ) ( SURFACE-AT ?auto_2135 ?auto_2136 ) ( CLEAR ?auto_2135 ) ( IS-CRATE ?auto_2134 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( AVAILABLE ?auto_2137 ) ( TRUCK-AT ?auto_2139 ?auto_2138 ) ( not ( = ?auto_2138 ?auto_2136 ) ) ( HOIST-AT ?auto_2140 ?auto_2138 ) ( LIFTING ?auto_2140 ?auto_2134 ) ( not ( = ?auto_2137 ?auto_2140 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2140 ?auto_2134 ?auto_2139 ?auto_2138 )
      ( MAKE-ON ?auto_2134 ?auto_2135 )
      ( MAKE-ON-VERIFY ?auto_2134 ?auto_2135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2141 - SURFACE
      ?auto_2142 - SURFACE
    )
    :vars
    (
      ?auto_2146 - HOIST
      ?auto_2147 - PLACE
      ?auto_2145 - TRUCK
      ?auto_2144 - PLACE
      ?auto_2143 - HOIST
      ?auto_2148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2146 ?auto_2147 ) ( SURFACE-AT ?auto_2142 ?auto_2147 ) ( CLEAR ?auto_2142 ) ( IS-CRATE ?auto_2141 ) ( not ( = ?auto_2141 ?auto_2142 ) ) ( AVAILABLE ?auto_2146 ) ( TRUCK-AT ?auto_2145 ?auto_2144 ) ( not ( = ?auto_2144 ?auto_2147 ) ) ( HOIST-AT ?auto_2143 ?auto_2144 ) ( not ( = ?auto_2146 ?auto_2143 ) ) ( AVAILABLE ?auto_2143 ) ( SURFACE-AT ?auto_2141 ?auto_2144 ) ( ON ?auto_2141 ?auto_2148 ) ( CLEAR ?auto_2141 ) ( not ( = ?auto_2141 ?auto_2148 ) ) ( not ( = ?auto_2142 ?auto_2148 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2143 ?auto_2141 ?auto_2148 ?auto_2144 )
      ( MAKE-ON ?auto_2141 ?auto_2142 )
      ( MAKE-ON-VERIFY ?auto_2141 ?auto_2142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2149 - SURFACE
      ?auto_2150 - SURFACE
    )
    :vars
    (
      ?auto_2152 - HOIST
      ?auto_2156 - PLACE
      ?auto_2153 - PLACE
      ?auto_2155 - HOIST
      ?auto_2151 - SURFACE
      ?auto_2154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2152 ?auto_2156 ) ( SURFACE-AT ?auto_2150 ?auto_2156 ) ( CLEAR ?auto_2150 ) ( IS-CRATE ?auto_2149 ) ( not ( = ?auto_2149 ?auto_2150 ) ) ( AVAILABLE ?auto_2152 ) ( not ( = ?auto_2153 ?auto_2156 ) ) ( HOIST-AT ?auto_2155 ?auto_2153 ) ( not ( = ?auto_2152 ?auto_2155 ) ) ( AVAILABLE ?auto_2155 ) ( SURFACE-AT ?auto_2149 ?auto_2153 ) ( ON ?auto_2149 ?auto_2151 ) ( CLEAR ?auto_2149 ) ( not ( = ?auto_2149 ?auto_2151 ) ) ( not ( = ?auto_2150 ?auto_2151 ) ) ( TRUCK-AT ?auto_2154 ?auto_2156 ) )
    :subtasks
    ( ( !DRIVE ?auto_2154 ?auto_2156 ?auto_2153 )
      ( MAKE-ON ?auto_2149 ?auto_2150 )
      ( MAKE-ON-VERIFY ?auto_2149 ?auto_2150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2157 - SURFACE
      ?auto_2158 - SURFACE
    )
    :vars
    (
      ?auto_2159 - HOIST
      ?auto_2164 - PLACE
      ?auto_2160 - PLACE
      ?auto_2162 - HOIST
      ?auto_2163 - SURFACE
      ?auto_2161 - TRUCK
      ?auto_2165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2159 ?auto_2164 ) ( IS-CRATE ?auto_2157 ) ( not ( = ?auto_2157 ?auto_2158 ) ) ( not ( = ?auto_2160 ?auto_2164 ) ) ( HOIST-AT ?auto_2162 ?auto_2160 ) ( not ( = ?auto_2159 ?auto_2162 ) ) ( AVAILABLE ?auto_2162 ) ( SURFACE-AT ?auto_2157 ?auto_2160 ) ( ON ?auto_2157 ?auto_2163 ) ( CLEAR ?auto_2157 ) ( not ( = ?auto_2157 ?auto_2163 ) ) ( not ( = ?auto_2158 ?auto_2163 ) ) ( TRUCK-AT ?auto_2161 ?auto_2164 ) ( SURFACE-AT ?auto_2165 ?auto_2164 ) ( CLEAR ?auto_2165 ) ( LIFTING ?auto_2159 ?auto_2158 ) ( IS-CRATE ?auto_2158 ) ( not ( = ?auto_2157 ?auto_2165 ) ) ( not ( = ?auto_2158 ?auto_2165 ) ) ( not ( = ?auto_2163 ?auto_2165 ) ) )
    :subtasks
    ( ( !DROP ?auto_2159 ?auto_2158 ?auto_2165 ?auto_2164 )
      ( MAKE-ON ?auto_2157 ?auto_2158 )
      ( MAKE-ON-VERIFY ?auto_2157 ?auto_2158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2166 - SURFACE
      ?auto_2167 - SURFACE
    )
    :vars
    (
      ?auto_2170 - HOIST
      ?auto_2173 - PLACE
      ?auto_2172 - PLACE
      ?auto_2169 - HOIST
      ?auto_2171 - SURFACE
      ?auto_2168 - TRUCK
      ?auto_2174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2170 ?auto_2173 ) ( IS-CRATE ?auto_2166 ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( HOIST-AT ?auto_2169 ?auto_2172 ) ( not ( = ?auto_2170 ?auto_2169 ) ) ( AVAILABLE ?auto_2169 ) ( SURFACE-AT ?auto_2166 ?auto_2172 ) ( ON ?auto_2166 ?auto_2171 ) ( CLEAR ?auto_2166 ) ( not ( = ?auto_2166 ?auto_2171 ) ) ( not ( = ?auto_2167 ?auto_2171 ) ) ( TRUCK-AT ?auto_2168 ?auto_2173 ) ( SURFACE-AT ?auto_2174 ?auto_2173 ) ( CLEAR ?auto_2174 ) ( IS-CRATE ?auto_2167 ) ( not ( = ?auto_2166 ?auto_2174 ) ) ( not ( = ?auto_2167 ?auto_2174 ) ) ( not ( = ?auto_2171 ?auto_2174 ) ) ( AVAILABLE ?auto_2170 ) ( IN ?auto_2167 ?auto_2168 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2170 ?auto_2167 ?auto_2168 ?auto_2173 )
      ( MAKE-ON ?auto_2166 ?auto_2167 )
      ( MAKE-ON-VERIFY ?auto_2166 ?auto_2167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2175 - SURFACE
      ?auto_2176 - SURFACE
    )
    :vars
    (
      ?auto_2183 - HOIST
      ?auto_2181 - PLACE
      ?auto_2177 - PLACE
      ?auto_2178 - HOIST
      ?auto_2179 - SURFACE
      ?auto_2180 - SURFACE
      ?auto_2182 - TRUCK
      ?auto_2184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2183 ?auto_2181 ) ( IS-CRATE ?auto_2175 ) ( not ( = ?auto_2175 ?auto_2176 ) ) ( not ( = ?auto_2177 ?auto_2181 ) ) ( HOIST-AT ?auto_2178 ?auto_2177 ) ( not ( = ?auto_2183 ?auto_2178 ) ) ( AVAILABLE ?auto_2178 ) ( SURFACE-AT ?auto_2175 ?auto_2177 ) ( ON ?auto_2175 ?auto_2179 ) ( CLEAR ?auto_2175 ) ( not ( = ?auto_2175 ?auto_2179 ) ) ( not ( = ?auto_2176 ?auto_2179 ) ) ( SURFACE-AT ?auto_2180 ?auto_2181 ) ( CLEAR ?auto_2180 ) ( IS-CRATE ?auto_2176 ) ( not ( = ?auto_2175 ?auto_2180 ) ) ( not ( = ?auto_2176 ?auto_2180 ) ) ( not ( = ?auto_2179 ?auto_2180 ) ) ( AVAILABLE ?auto_2183 ) ( IN ?auto_2176 ?auto_2182 ) ( TRUCK-AT ?auto_2182 ?auto_2184 ) ( not ( = ?auto_2184 ?auto_2181 ) ) ( not ( = ?auto_2177 ?auto_2184 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2182 ?auto_2184 ?auto_2181 )
      ( MAKE-ON ?auto_2175 ?auto_2176 )
      ( MAKE-ON-VERIFY ?auto_2175 ?auto_2176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2185 - SURFACE
      ?auto_2186 - SURFACE
    )
    :vars
    (
      ?auto_2187 - HOIST
      ?auto_2189 - PLACE
      ?auto_2192 - PLACE
      ?auto_2190 - HOIST
      ?auto_2188 - SURFACE
      ?auto_2194 - SURFACE
      ?auto_2193 - TRUCK
      ?auto_2191 - PLACE
      ?auto_2195 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2187 ?auto_2189 ) ( IS-CRATE ?auto_2185 ) ( not ( = ?auto_2185 ?auto_2186 ) ) ( not ( = ?auto_2192 ?auto_2189 ) ) ( HOIST-AT ?auto_2190 ?auto_2192 ) ( not ( = ?auto_2187 ?auto_2190 ) ) ( AVAILABLE ?auto_2190 ) ( SURFACE-AT ?auto_2185 ?auto_2192 ) ( ON ?auto_2185 ?auto_2188 ) ( CLEAR ?auto_2185 ) ( not ( = ?auto_2185 ?auto_2188 ) ) ( not ( = ?auto_2186 ?auto_2188 ) ) ( SURFACE-AT ?auto_2194 ?auto_2189 ) ( CLEAR ?auto_2194 ) ( IS-CRATE ?auto_2186 ) ( not ( = ?auto_2185 ?auto_2194 ) ) ( not ( = ?auto_2186 ?auto_2194 ) ) ( not ( = ?auto_2188 ?auto_2194 ) ) ( AVAILABLE ?auto_2187 ) ( TRUCK-AT ?auto_2193 ?auto_2191 ) ( not ( = ?auto_2191 ?auto_2189 ) ) ( not ( = ?auto_2192 ?auto_2191 ) ) ( HOIST-AT ?auto_2195 ?auto_2191 ) ( LIFTING ?auto_2195 ?auto_2186 ) ( not ( = ?auto_2187 ?auto_2195 ) ) ( not ( = ?auto_2190 ?auto_2195 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2195 ?auto_2186 ?auto_2193 ?auto_2191 )
      ( MAKE-ON ?auto_2185 ?auto_2186 )
      ( MAKE-ON-VERIFY ?auto_2185 ?auto_2186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2196 - SURFACE
      ?auto_2197 - SURFACE
    )
    :vars
    (
      ?auto_2202 - HOIST
      ?auto_2198 - PLACE
      ?auto_2206 - PLACE
      ?auto_2203 - HOIST
      ?auto_2205 - SURFACE
      ?auto_2201 - SURFACE
      ?auto_2199 - TRUCK
      ?auto_2204 - PLACE
      ?auto_2200 - HOIST
      ?auto_2207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2202 ?auto_2198 ) ( IS-CRATE ?auto_2196 ) ( not ( = ?auto_2196 ?auto_2197 ) ) ( not ( = ?auto_2206 ?auto_2198 ) ) ( HOIST-AT ?auto_2203 ?auto_2206 ) ( not ( = ?auto_2202 ?auto_2203 ) ) ( AVAILABLE ?auto_2203 ) ( SURFACE-AT ?auto_2196 ?auto_2206 ) ( ON ?auto_2196 ?auto_2205 ) ( CLEAR ?auto_2196 ) ( not ( = ?auto_2196 ?auto_2205 ) ) ( not ( = ?auto_2197 ?auto_2205 ) ) ( SURFACE-AT ?auto_2201 ?auto_2198 ) ( CLEAR ?auto_2201 ) ( IS-CRATE ?auto_2197 ) ( not ( = ?auto_2196 ?auto_2201 ) ) ( not ( = ?auto_2197 ?auto_2201 ) ) ( not ( = ?auto_2205 ?auto_2201 ) ) ( AVAILABLE ?auto_2202 ) ( TRUCK-AT ?auto_2199 ?auto_2204 ) ( not ( = ?auto_2204 ?auto_2198 ) ) ( not ( = ?auto_2206 ?auto_2204 ) ) ( HOIST-AT ?auto_2200 ?auto_2204 ) ( not ( = ?auto_2202 ?auto_2200 ) ) ( not ( = ?auto_2203 ?auto_2200 ) ) ( AVAILABLE ?auto_2200 ) ( SURFACE-AT ?auto_2197 ?auto_2204 ) ( ON ?auto_2197 ?auto_2207 ) ( CLEAR ?auto_2197 ) ( not ( = ?auto_2196 ?auto_2207 ) ) ( not ( = ?auto_2197 ?auto_2207 ) ) ( not ( = ?auto_2205 ?auto_2207 ) ) ( not ( = ?auto_2201 ?auto_2207 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2200 ?auto_2197 ?auto_2207 ?auto_2204 )
      ( MAKE-ON ?auto_2196 ?auto_2197 )
      ( MAKE-ON-VERIFY ?auto_2196 ?auto_2197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2208 - SURFACE
      ?auto_2209 - SURFACE
    )
    :vars
    (
      ?auto_2212 - HOIST
      ?auto_2211 - PLACE
      ?auto_2215 - PLACE
      ?auto_2216 - HOIST
      ?auto_2217 - SURFACE
      ?auto_2210 - SURFACE
      ?auto_2213 - PLACE
      ?auto_2219 - HOIST
      ?auto_2214 - SURFACE
      ?auto_2218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212 ?auto_2211 ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2215 ?auto_2211 ) ) ( HOIST-AT ?auto_2216 ?auto_2215 ) ( not ( = ?auto_2212 ?auto_2216 ) ) ( AVAILABLE ?auto_2216 ) ( SURFACE-AT ?auto_2208 ?auto_2215 ) ( ON ?auto_2208 ?auto_2217 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2208 ?auto_2217 ) ) ( not ( = ?auto_2209 ?auto_2217 ) ) ( SURFACE-AT ?auto_2210 ?auto_2211 ) ( CLEAR ?auto_2210 ) ( IS-CRATE ?auto_2209 ) ( not ( = ?auto_2208 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2217 ?auto_2210 ) ) ( AVAILABLE ?auto_2212 ) ( not ( = ?auto_2213 ?auto_2211 ) ) ( not ( = ?auto_2215 ?auto_2213 ) ) ( HOIST-AT ?auto_2219 ?auto_2213 ) ( not ( = ?auto_2212 ?auto_2219 ) ) ( not ( = ?auto_2216 ?auto_2219 ) ) ( AVAILABLE ?auto_2219 ) ( SURFACE-AT ?auto_2209 ?auto_2213 ) ( ON ?auto_2209 ?auto_2214 ) ( CLEAR ?auto_2209 ) ( not ( = ?auto_2208 ?auto_2214 ) ) ( not ( = ?auto_2209 ?auto_2214 ) ) ( not ( = ?auto_2217 ?auto_2214 ) ) ( not ( = ?auto_2210 ?auto_2214 ) ) ( TRUCK-AT ?auto_2218 ?auto_2211 ) )
    :subtasks
    ( ( !DRIVE ?auto_2218 ?auto_2211 ?auto_2213 )
      ( MAKE-ON ?auto_2208 ?auto_2209 )
      ( MAKE-ON-VERIFY ?auto_2208 ?auto_2209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2220 - SURFACE
      ?auto_2221 - SURFACE
    )
    :vars
    (
      ?auto_2224 - HOIST
      ?auto_2231 - PLACE
      ?auto_2226 - PLACE
      ?auto_2227 - HOIST
      ?auto_2225 - SURFACE
      ?auto_2229 - SURFACE
      ?auto_2222 - PLACE
      ?auto_2230 - HOIST
      ?auto_2228 - SURFACE
      ?auto_2223 - TRUCK
      ?auto_2232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2224 ?auto_2231 ) ( IS-CRATE ?auto_2220 ) ( not ( = ?auto_2220 ?auto_2221 ) ) ( not ( = ?auto_2226 ?auto_2231 ) ) ( HOIST-AT ?auto_2227 ?auto_2226 ) ( not ( = ?auto_2224 ?auto_2227 ) ) ( AVAILABLE ?auto_2227 ) ( SURFACE-AT ?auto_2220 ?auto_2226 ) ( ON ?auto_2220 ?auto_2225 ) ( CLEAR ?auto_2220 ) ( not ( = ?auto_2220 ?auto_2225 ) ) ( not ( = ?auto_2221 ?auto_2225 ) ) ( IS-CRATE ?auto_2221 ) ( not ( = ?auto_2220 ?auto_2229 ) ) ( not ( = ?auto_2221 ?auto_2229 ) ) ( not ( = ?auto_2225 ?auto_2229 ) ) ( not ( = ?auto_2222 ?auto_2231 ) ) ( not ( = ?auto_2226 ?auto_2222 ) ) ( HOIST-AT ?auto_2230 ?auto_2222 ) ( not ( = ?auto_2224 ?auto_2230 ) ) ( not ( = ?auto_2227 ?auto_2230 ) ) ( AVAILABLE ?auto_2230 ) ( SURFACE-AT ?auto_2221 ?auto_2222 ) ( ON ?auto_2221 ?auto_2228 ) ( CLEAR ?auto_2221 ) ( not ( = ?auto_2220 ?auto_2228 ) ) ( not ( = ?auto_2221 ?auto_2228 ) ) ( not ( = ?auto_2225 ?auto_2228 ) ) ( not ( = ?auto_2229 ?auto_2228 ) ) ( TRUCK-AT ?auto_2223 ?auto_2231 ) ( SURFACE-AT ?auto_2232 ?auto_2231 ) ( CLEAR ?auto_2232 ) ( LIFTING ?auto_2224 ?auto_2229 ) ( IS-CRATE ?auto_2229 ) ( not ( = ?auto_2220 ?auto_2232 ) ) ( not ( = ?auto_2221 ?auto_2232 ) ) ( not ( = ?auto_2225 ?auto_2232 ) ) ( not ( = ?auto_2229 ?auto_2232 ) ) ( not ( = ?auto_2228 ?auto_2232 ) ) )
    :subtasks
    ( ( !DROP ?auto_2224 ?auto_2229 ?auto_2232 ?auto_2231 )
      ( MAKE-ON ?auto_2220 ?auto_2221 )
      ( MAKE-ON-VERIFY ?auto_2220 ?auto_2221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2233 - SURFACE
      ?auto_2234 - SURFACE
    )
    :vars
    (
      ?auto_2239 - HOIST
      ?auto_2241 - PLACE
      ?auto_2236 - PLACE
      ?auto_2238 - HOIST
      ?auto_2237 - SURFACE
      ?auto_2242 - SURFACE
      ?auto_2245 - PLACE
      ?auto_2244 - HOIST
      ?auto_2240 - SURFACE
      ?auto_2243 - TRUCK
      ?auto_2235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2239 ?auto_2241 ) ( IS-CRATE ?auto_2233 ) ( not ( = ?auto_2233 ?auto_2234 ) ) ( not ( = ?auto_2236 ?auto_2241 ) ) ( HOIST-AT ?auto_2238 ?auto_2236 ) ( not ( = ?auto_2239 ?auto_2238 ) ) ( AVAILABLE ?auto_2238 ) ( SURFACE-AT ?auto_2233 ?auto_2236 ) ( ON ?auto_2233 ?auto_2237 ) ( CLEAR ?auto_2233 ) ( not ( = ?auto_2233 ?auto_2237 ) ) ( not ( = ?auto_2234 ?auto_2237 ) ) ( IS-CRATE ?auto_2234 ) ( not ( = ?auto_2233 ?auto_2242 ) ) ( not ( = ?auto_2234 ?auto_2242 ) ) ( not ( = ?auto_2237 ?auto_2242 ) ) ( not ( = ?auto_2245 ?auto_2241 ) ) ( not ( = ?auto_2236 ?auto_2245 ) ) ( HOIST-AT ?auto_2244 ?auto_2245 ) ( not ( = ?auto_2239 ?auto_2244 ) ) ( not ( = ?auto_2238 ?auto_2244 ) ) ( AVAILABLE ?auto_2244 ) ( SURFACE-AT ?auto_2234 ?auto_2245 ) ( ON ?auto_2234 ?auto_2240 ) ( CLEAR ?auto_2234 ) ( not ( = ?auto_2233 ?auto_2240 ) ) ( not ( = ?auto_2234 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2242 ?auto_2240 ) ) ( TRUCK-AT ?auto_2243 ?auto_2241 ) ( SURFACE-AT ?auto_2235 ?auto_2241 ) ( CLEAR ?auto_2235 ) ( IS-CRATE ?auto_2242 ) ( not ( = ?auto_2233 ?auto_2235 ) ) ( not ( = ?auto_2234 ?auto_2235 ) ) ( not ( = ?auto_2237 ?auto_2235 ) ) ( not ( = ?auto_2242 ?auto_2235 ) ) ( not ( = ?auto_2240 ?auto_2235 ) ) ( AVAILABLE ?auto_2239 ) ( IN ?auto_2242 ?auto_2243 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2239 ?auto_2242 ?auto_2243 ?auto_2241 )
      ( MAKE-ON ?auto_2233 ?auto_2234 )
      ( MAKE-ON-VERIFY ?auto_2233 ?auto_2234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2246 - SURFACE
      ?auto_2247 - SURFACE
    )
    :vars
    (
      ?auto_2250 - HOIST
      ?auto_2253 - PLACE
      ?auto_2257 - PLACE
      ?auto_2248 - HOIST
      ?auto_2256 - SURFACE
      ?auto_2255 - SURFACE
      ?auto_2249 - PLACE
      ?auto_2254 - HOIST
      ?auto_2252 - SURFACE
      ?auto_2251 - SURFACE
      ?auto_2258 - TRUCK
      ?auto_2259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2250 ?auto_2253 ) ( IS-CRATE ?auto_2246 ) ( not ( = ?auto_2246 ?auto_2247 ) ) ( not ( = ?auto_2257 ?auto_2253 ) ) ( HOIST-AT ?auto_2248 ?auto_2257 ) ( not ( = ?auto_2250 ?auto_2248 ) ) ( AVAILABLE ?auto_2248 ) ( SURFACE-AT ?auto_2246 ?auto_2257 ) ( ON ?auto_2246 ?auto_2256 ) ( CLEAR ?auto_2246 ) ( not ( = ?auto_2246 ?auto_2256 ) ) ( not ( = ?auto_2247 ?auto_2256 ) ) ( IS-CRATE ?auto_2247 ) ( not ( = ?auto_2246 ?auto_2255 ) ) ( not ( = ?auto_2247 ?auto_2255 ) ) ( not ( = ?auto_2256 ?auto_2255 ) ) ( not ( = ?auto_2249 ?auto_2253 ) ) ( not ( = ?auto_2257 ?auto_2249 ) ) ( HOIST-AT ?auto_2254 ?auto_2249 ) ( not ( = ?auto_2250 ?auto_2254 ) ) ( not ( = ?auto_2248 ?auto_2254 ) ) ( AVAILABLE ?auto_2254 ) ( SURFACE-AT ?auto_2247 ?auto_2249 ) ( ON ?auto_2247 ?auto_2252 ) ( CLEAR ?auto_2247 ) ( not ( = ?auto_2246 ?auto_2252 ) ) ( not ( = ?auto_2247 ?auto_2252 ) ) ( not ( = ?auto_2256 ?auto_2252 ) ) ( not ( = ?auto_2255 ?auto_2252 ) ) ( SURFACE-AT ?auto_2251 ?auto_2253 ) ( CLEAR ?auto_2251 ) ( IS-CRATE ?auto_2255 ) ( not ( = ?auto_2246 ?auto_2251 ) ) ( not ( = ?auto_2247 ?auto_2251 ) ) ( not ( = ?auto_2256 ?auto_2251 ) ) ( not ( = ?auto_2255 ?auto_2251 ) ) ( not ( = ?auto_2252 ?auto_2251 ) ) ( AVAILABLE ?auto_2250 ) ( IN ?auto_2255 ?auto_2258 ) ( TRUCK-AT ?auto_2258 ?auto_2259 ) ( not ( = ?auto_2259 ?auto_2253 ) ) ( not ( = ?auto_2257 ?auto_2259 ) ) ( not ( = ?auto_2249 ?auto_2259 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2258 ?auto_2259 ?auto_2253 )
      ( MAKE-ON ?auto_2246 ?auto_2247 )
      ( MAKE-ON-VERIFY ?auto_2246 ?auto_2247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2260 - SURFACE
      ?auto_2261 - SURFACE
    )
    :vars
    (
      ?auto_2273 - HOIST
      ?auto_2263 - PLACE
      ?auto_2267 - PLACE
      ?auto_2265 - HOIST
      ?auto_2264 - SURFACE
      ?auto_2266 - SURFACE
      ?auto_2270 - PLACE
      ?auto_2271 - HOIST
      ?auto_2262 - SURFACE
      ?auto_2269 - SURFACE
      ?auto_2268 - TRUCK
      ?auto_2272 - PLACE
      ?auto_2274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2273 ?auto_2263 ) ( IS-CRATE ?auto_2260 ) ( not ( = ?auto_2260 ?auto_2261 ) ) ( not ( = ?auto_2267 ?auto_2263 ) ) ( HOIST-AT ?auto_2265 ?auto_2267 ) ( not ( = ?auto_2273 ?auto_2265 ) ) ( AVAILABLE ?auto_2265 ) ( SURFACE-AT ?auto_2260 ?auto_2267 ) ( ON ?auto_2260 ?auto_2264 ) ( CLEAR ?auto_2260 ) ( not ( = ?auto_2260 ?auto_2264 ) ) ( not ( = ?auto_2261 ?auto_2264 ) ) ( IS-CRATE ?auto_2261 ) ( not ( = ?auto_2260 ?auto_2266 ) ) ( not ( = ?auto_2261 ?auto_2266 ) ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2270 ?auto_2263 ) ) ( not ( = ?auto_2267 ?auto_2270 ) ) ( HOIST-AT ?auto_2271 ?auto_2270 ) ( not ( = ?auto_2273 ?auto_2271 ) ) ( not ( = ?auto_2265 ?auto_2271 ) ) ( AVAILABLE ?auto_2271 ) ( SURFACE-AT ?auto_2261 ?auto_2270 ) ( ON ?auto_2261 ?auto_2262 ) ( CLEAR ?auto_2261 ) ( not ( = ?auto_2260 ?auto_2262 ) ) ( not ( = ?auto_2261 ?auto_2262 ) ) ( not ( = ?auto_2264 ?auto_2262 ) ) ( not ( = ?auto_2266 ?auto_2262 ) ) ( SURFACE-AT ?auto_2269 ?auto_2263 ) ( CLEAR ?auto_2269 ) ( IS-CRATE ?auto_2266 ) ( not ( = ?auto_2260 ?auto_2269 ) ) ( not ( = ?auto_2261 ?auto_2269 ) ) ( not ( = ?auto_2264 ?auto_2269 ) ) ( not ( = ?auto_2266 ?auto_2269 ) ) ( not ( = ?auto_2262 ?auto_2269 ) ) ( AVAILABLE ?auto_2273 ) ( TRUCK-AT ?auto_2268 ?auto_2272 ) ( not ( = ?auto_2272 ?auto_2263 ) ) ( not ( = ?auto_2267 ?auto_2272 ) ) ( not ( = ?auto_2270 ?auto_2272 ) ) ( HOIST-AT ?auto_2274 ?auto_2272 ) ( LIFTING ?auto_2274 ?auto_2266 ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2265 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2274 ?auto_2266 ?auto_2268 ?auto_2272 )
      ( MAKE-ON ?auto_2260 ?auto_2261 )
      ( MAKE-ON-VERIFY ?auto_2260 ?auto_2261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2275 - SURFACE
      ?auto_2276 - SURFACE
    )
    :vars
    (
      ?auto_2283 - HOIST
      ?auto_2281 - PLACE
      ?auto_2286 - PLACE
      ?auto_2280 - HOIST
      ?auto_2285 - SURFACE
      ?auto_2277 - SURFACE
      ?auto_2289 - PLACE
      ?auto_2284 - HOIST
      ?auto_2282 - SURFACE
      ?auto_2279 - SURFACE
      ?auto_2288 - TRUCK
      ?auto_2278 - PLACE
      ?auto_2287 - HOIST
      ?auto_2290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2283 ?auto_2281 ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2286 ?auto_2281 ) ) ( HOIST-AT ?auto_2280 ?auto_2286 ) ( not ( = ?auto_2283 ?auto_2280 ) ) ( AVAILABLE ?auto_2280 ) ( SURFACE-AT ?auto_2275 ?auto_2286 ) ( ON ?auto_2275 ?auto_2285 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2275 ?auto_2285 ) ) ( not ( = ?auto_2276 ?auto_2285 ) ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2277 ) ) ( not ( = ?auto_2276 ?auto_2277 ) ) ( not ( = ?auto_2285 ?auto_2277 ) ) ( not ( = ?auto_2289 ?auto_2281 ) ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( HOIST-AT ?auto_2284 ?auto_2289 ) ( not ( = ?auto_2283 ?auto_2284 ) ) ( not ( = ?auto_2280 ?auto_2284 ) ) ( AVAILABLE ?auto_2284 ) ( SURFACE-AT ?auto_2276 ?auto_2289 ) ( ON ?auto_2276 ?auto_2282 ) ( CLEAR ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2282 ) ) ( not ( = ?auto_2276 ?auto_2282 ) ) ( not ( = ?auto_2285 ?auto_2282 ) ) ( not ( = ?auto_2277 ?auto_2282 ) ) ( SURFACE-AT ?auto_2279 ?auto_2281 ) ( CLEAR ?auto_2279 ) ( IS-CRATE ?auto_2277 ) ( not ( = ?auto_2275 ?auto_2279 ) ) ( not ( = ?auto_2276 ?auto_2279 ) ) ( not ( = ?auto_2285 ?auto_2279 ) ) ( not ( = ?auto_2277 ?auto_2279 ) ) ( not ( = ?auto_2282 ?auto_2279 ) ) ( AVAILABLE ?auto_2283 ) ( TRUCK-AT ?auto_2288 ?auto_2278 ) ( not ( = ?auto_2278 ?auto_2281 ) ) ( not ( = ?auto_2286 ?auto_2278 ) ) ( not ( = ?auto_2289 ?auto_2278 ) ) ( HOIST-AT ?auto_2287 ?auto_2278 ) ( not ( = ?auto_2283 ?auto_2287 ) ) ( not ( = ?auto_2280 ?auto_2287 ) ) ( not ( = ?auto_2284 ?auto_2287 ) ) ( AVAILABLE ?auto_2287 ) ( SURFACE-AT ?auto_2277 ?auto_2278 ) ( ON ?auto_2277 ?auto_2290 ) ( CLEAR ?auto_2277 ) ( not ( = ?auto_2275 ?auto_2290 ) ) ( not ( = ?auto_2276 ?auto_2290 ) ) ( not ( = ?auto_2285 ?auto_2290 ) ) ( not ( = ?auto_2277 ?auto_2290 ) ) ( not ( = ?auto_2282 ?auto_2290 ) ) ( not ( = ?auto_2279 ?auto_2290 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2287 ?auto_2277 ?auto_2290 ?auto_2278 )
      ( MAKE-ON ?auto_2275 ?auto_2276 )
      ( MAKE-ON-VERIFY ?auto_2275 ?auto_2276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2291 - SURFACE
      ?auto_2292 - SURFACE
    )
    :vars
    (
      ?auto_2295 - HOIST
      ?auto_2293 - PLACE
      ?auto_2297 - PLACE
      ?auto_2303 - HOIST
      ?auto_2304 - SURFACE
      ?auto_2305 - SURFACE
      ?auto_2296 - PLACE
      ?auto_2294 - HOIST
      ?auto_2300 - SURFACE
      ?auto_2298 - SURFACE
      ?auto_2299 - PLACE
      ?auto_2302 - HOIST
      ?auto_2306 - SURFACE
      ?auto_2301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2295 ?auto_2293 ) ( IS-CRATE ?auto_2291 ) ( not ( = ?auto_2291 ?auto_2292 ) ) ( not ( = ?auto_2297 ?auto_2293 ) ) ( HOIST-AT ?auto_2303 ?auto_2297 ) ( not ( = ?auto_2295 ?auto_2303 ) ) ( AVAILABLE ?auto_2303 ) ( SURFACE-AT ?auto_2291 ?auto_2297 ) ( ON ?auto_2291 ?auto_2304 ) ( CLEAR ?auto_2291 ) ( not ( = ?auto_2291 ?auto_2304 ) ) ( not ( = ?auto_2292 ?auto_2304 ) ) ( IS-CRATE ?auto_2292 ) ( not ( = ?auto_2291 ?auto_2305 ) ) ( not ( = ?auto_2292 ?auto_2305 ) ) ( not ( = ?auto_2304 ?auto_2305 ) ) ( not ( = ?auto_2296 ?auto_2293 ) ) ( not ( = ?auto_2297 ?auto_2296 ) ) ( HOIST-AT ?auto_2294 ?auto_2296 ) ( not ( = ?auto_2295 ?auto_2294 ) ) ( not ( = ?auto_2303 ?auto_2294 ) ) ( AVAILABLE ?auto_2294 ) ( SURFACE-AT ?auto_2292 ?auto_2296 ) ( ON ?auto_2292 ?auto_2300 ) ( CLEAR ?auto_2292 ) ( not ( = ?auto_2291 ?auto_2300 ) ) ( not ( = ?auto_2292 ?auto_2300 ) ) ( not ( = ?auto_2304 ?auto_2300 ) ) ( not ( = ?auto_2305 ?auto_2300 ) ) ( SURFACE-AT ?auto_2298 ?auto_2293 ) ( CLEAR ?auto_2298 ) ( IS-CRATE ?auto_2305 ) ( not ( = ?auto_2291 ?auto_2298 ) ) ( not ( = ?auto_2292 ?auto_2298 ) ) ( not ( = ?auto_2304 ?auto_2298 ) ) ( not ( = ?auto_2305 ?auto_2298 ) ) ( not ( = ?auto_2300 ?auto_2298 ) ) ( AVAILABLE ?auto_2295 ) ( not ( = ?auto_2299 ?auto_2293 ) ) ( not ( = ?auto_2297 ?auto_2299 ) ) ( not ( = ?auto_2296 ?auto_2299 ) ) ( HOIST-AT ?auto_2302 ?auto_2299 ) ( not ( = ?auto_2295 ?auto_2302 ) ) ( not ( = ?auto_2303 ?auto_2302 ) ) ( not ( = ?auto_2294 ?auto_2302 ) ) ( AVAILABLE ?auto_2302 ) ( SURFACE-AT ?auto_2305 ?auto_2299 ) ( ON ?auto_2305 ?auto_2306 ) ( CLEAR ?auto_2305 ) ( not ( = ?auto_2291 ?auto_2306 ) ) ( not ( = ?auto_2292 ?auto_2306 ) ) ( not ( = ?auto_2304 ?auto_2306 ) ) ( not ( = ?auto_2305 ?auto_2306 ) ) ( not ( = ?auto_2300 ?auto_2306 ) ) ( not ( = ?auto_2298 ?auto_2306 ) ) ( TRUCK-AT ?auto_2301 ?auto_2293 ) )
    :subtasks
    ( ( !DRIVE ?auto_2301 ?auto_2293 ?auto_2299 )
      ( MAKE-ON ?auto_2291 ?auto_2292 )
      ( MAKE-ON-VERIFY ?auto_2291 ?auto_2292 ) )
  )

)

