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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2005 - SURFACE
      ?auto_2006 - SURFACE
      ?auto_2007 - SURFACE
    )
    :vars
    (
      ?auto_2008 - HOIST
      ?auto_2013 - PLACE
      ?auto_2009 - PLACE
      ?auto_2011 - HOIST
      ?auto_2010 - SURFACE
      ?auto_2014 - PLACE
      ?auto_2016 - HOIST
      ?auto_2015 - SURFACE
      ?auto_2012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2008 ?auto_2013 ) ( IS-CRATE ?auto_2007 ) ( not ( = ?auto_2009 ?auto_2013 ) ) ( HOIST-AT ?auto_2011 ?auto_2009 ) ( AVAILABLE ?auto_2011 ) ( SURFACE-AT ?auto_2007 ?auto_2009 ) ( ON ?auto_2007 ?auto_2010 ) ( CLEAR ?auto_2007 ) ( not ( = ?auto_2006 ?auto_2007 ) ) ( not ( = ?auto_2006 ?auto_2010 ) ) ( not ( = ?auto_2007 ?auto_2010 ) ) ( not ( = ?auto_2008 ?auto_2011 ) ) ( SURFACE-AT ?auto_2005 ?auto_2013 ) ( CLEAR ?auto_2005 ) ( IS-CRATE ?auto_2006 ) ( AVAILABLE ?auto_2008 ) ( not ( = ?auto_2014 ?auto_2013 ) ) ( HOIST-AT ?auto_2016 ?auto_2014 ) ( AVAILABLE ?auto_2016 ) ( SURFACE-AT ?auto_2006 ?auto_2014 ) ( ON ?auto_2006 ?auto_2015 ) ( CLEAR ?auto_2006 ) ( TRUCK-AT ?auto_2012 ?auto_2013 ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2015 ) ) ( not ( = ?auto_2006 ?auto_2015 ) ) ( not ( = ?auto_2008 ?auto_2016 ) ) ( not ( = ?auto_2005 ?auto_2007 ) ) ( not ( = ?auto_2005 ?auto_2010 ) ) ( not ( = ?auto_2007 ?auto_2015 ) ) ( not ( = ?auto_2009 ?auto_2014 ) ) ( not ( = ?auto_2011 ?auto_2016 ) ) ( not ( = ?auto_2010 ?auto_2015 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2005 ?auto_2006 )
      ( MAKE-1CRATE ?auto_2006 ?auto_2007 )
      ( MAKE-2CRATE-VERIFY ?auto_2005 ?auto_2006 ?auto_2007 ) )
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
      ?auto_2040 - HOIST
      ?auto_2038 - PLACE
      ?auto_2036 - PLACE
      ?auto_2039 - HOIST
      ?auto_2035 - SURFACE
      ?auto_2045 - PLACE
      ?auto_2041 - HOIST
      ?auto_2046 - SURFACE
      ?auto_2044 - PLACE
      ?auto_2042 - HOIST
      ?auto_2043 - SURFACE
      ?auto_2037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2040 ?auto_2038 ) ( IS-CRATE ?auto_2034 ) ( not ( = ?auto_2036 ?auto_2038 ) ) ( HOIST-AT ?auto_2039 ?auto_2036 ) ( AVAILABLE ?auto_2039 ) ( SURFACE-AT ?auto_2034 ?auto_2036 ) ( ON ?auto_2034 ?auto_2035 ) ( CLEAR ?auto_2034 ) ( not ( = ?auto_2033 ?auto_2034 ) ) ( not ( = ?auto_2033 ?auto_2035 ) ) ( not ( = ?auto_2034 ?auto_2035 ) ) ( not ( = ?auto_2040 ?auto_2039 ) ) ( IS-CRATE ?auto_2033 ) ( not ( = ?auto_2045 ?auto_2038 ) ) ( HOIST-AT ?auto_2041 ?auto_2045 ) ( AVAILABLE ?auto_2041 ) ( SURFACE-AT ?auto_2033 ?auto_2045 ) ( ON ?auto_2033 ?auto_2046 ) ( CLEAR ?auto_2033 ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2032 ?auto_2046 ) ) ( not ( = ?auto_2033 ?auto_2046 ) ) ( not ( = ?auto_2040 ?auto_2041 ) ) ( SURFACE-AT ?auto_2031 ?auto_2038 ) ( CLEAR ?auto_2031 ) ( IS-CRATE ?auto_2032 ) ( AVAILABLE ?auto_2040 ) ( not ( = ?auto_2044 ?auto_2038 ) ) ( HOIST-AT ?auto_2042 ?auto_2044 ) ( AVAILABLE ?auto_2042 ) ( SURFACE-AT ?auto_2032 ?auto_2044 ) ( ON ?auto_2032 ?auto_2043 ) ( CLEAR ?auto_2032 ) ( TRUCK-AT ?auto_2037 ?auto_2038 ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( not ( = ?auto_2031 ?auto_2043 ) ) ( not ( = ?auto_2032 ?auto_2043 ) ) ( not ( = ?auto_2040 ?auto_2042 ) ) ( not ( = ?auto_2031 ?auto_2033 ) ) ( not ( = ?auto_2031 ?auto_2046 ) ) ( not ( = ?auto_2033 ?auto_2043 ) ) ( not ( = ?auto_2045 ?auto_2044 ) ) ( not ( = ?auto_2041 ?auto_2042 ) ) ( not ( = ?auto_2046 ?auto_2043 ) ) ( not ( = ?auto_2031 ?auto_2034 ) ) ( not ( = ?auto_2031 ?auto_2035 ) ) ( not ( = ?auto_2032 ?auto_2034 ) ) ( not ( = ?auto_2032 ?auto_2035 ) ) ( not ( = ?auto_2034 ?auto_2046 ) ) ( not ( = ?auto_2034 ?auto_2043 ) ) ( not ( = ?auto_2036 ?auto_2045 ) ) ( not ( = ?auto_2036 ?auto_2044 ) ) ( not ( = ?auto_2039 ?auto_2041 ) ) ( not ( = ?auto_2039 ?auto_2042 ) ) ( not ( = ?auto_2035 ?auto_2046 ) ) ( not ( = ?auto_2035 ?auto_2043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031 ?auto_2032 ?auto_2033 )
      ( MAKE-1CRATE ?auto_2033 ?auto_2034 )
      ( MAKE-3CRATE-VERIFY ?auto_2031 ?auto_2032 ?auto_2033 ?auto_2034 ) )
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
      ?auto_2067 - HOIST
      ?auto_2070 - PLACE
      ?auto_2072 - PLACE
      ?auto_2069 - HOIST
      ?auto_2071 - SURFACE
      ?auto_2074 - SURFACE
      ?auto_2075 - PLACE
      ?auto_2079 - HOIST
      ?auto_2078 - SURFACE
      ?auto_2073 - PLACE
      ?auto_2076 - HOIST
      ?auto_2077 - SURFACE
      ?auto_2068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2067 ?auto_2070 ) ( IS-CRATE ?auto_2066 ) ( not ( = ?auto_2072 ?auto_2070 ) ) ( HOIST-AT ?auto_2069 ?auto_2072 ) ( SURFACE-AT ?auto_2066 ?auto_2072 ) ( ON ?auto_2066 ?auto_2071 ) ( CLEAR ?auto_2066 ) ( not ( = ?auto_2065 ?auto_2066 ) ) ( not ( = ?auto_2065 ?auto_2071 ) ) ( not ( = ?auto_2066 ?auto_2071 ) ) ( not ( = ?auto_2067 ?auto_2069 ) ) ( IS-CRATE ?auto_2065 ) ( AVAILABLE ?auto_2069 ) ( SURFACE-AT ?auto_2065 ?auto_2072 ) ( ON ?auto_2065 ?auto_2074 ) ( CLEAR ?auto_2065 ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( not ( = ?auto_2064 ?auto_2074 ) ) ( not ( = ?auto_2065 ?auto_2074 ) ) ( IS-CRATE ?auto_2064 ) ( not ( = ?auto_2075 ?auto_2070 ) ) ( HOIST-AT ?auto_2079 ?auto_2075 ) ( AVAILABLE ?auto_2079 ) ( SURFACE-AT ?auto_2064 ?auto_2075 ) ( ON ?auto_2064 ?auto_2078 ) ( CLEAR ?auto_2064 ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2078 ) ) ( not ( = ?auto_2064 ?auto_2078 ) ) ( not ( = ?auto_2067 ?auto_2079 ) ) ( SURFACE-AT ?auto_2062 ?auto_2070 ) ( CLEAR ?auto_2062 ) ( IS-CRATE ?auto_2063 ) ( AVAILABLE ?auto_2067 ) ( not ( = ?auto_2073 ?auto_2070 ) ) ( HOIST-AT ?auto_2076 ?auto_2073 ) ( AVAILABLE ?auto_2076 ) ( SURFACE-AT ?auto_2063 ?auto_2073 ) ( ON ?auto_2063 ?auto_2077 ) ( CLEAR ?auto_2063 ) ( TRUCK-AT ?auto_2068 ?auto_2070 ) ( not ( = ?auto_2062 ?auto_2063 ) ) ( not ( = ?auto_2062 ?auto_2077 ) ) ( not ( = ?auto_2063 ?auto_2077 ) ) ( not ( = ?auto_2067 ?auto_2076 ) ) ( not ( = ?auto_2062 ?auto_2064 ) ) ( not ( = ?auto_2062 ?auto_2078 ) ) ( not ( = ?auto_2064 ?auto_2077 ) ) ( not ( = ?auto_2075 ?auto_2073 ) ) ( not ( = ?auto_2079 ?auto_2076 ) ) ( not ( = ?auto_2078 ?auto_2077 ) ) ( not ( = ?auto_2062 ?auto_2065 ) ) ( not ( = ?auto_2062 ?auto_2074 ) ) ( not ( = ?auto_2063 ?auto_2065 ) ) ( not ( = ?auto_2063 ?auto_2074 ) ) ( not ( = ?auto_2065 ?auto_2078 ) ) ( not ( = ?auto_2065 ?auto_2077 ) ) ( not ( = ?auto_2072 ?auto_2075 ) ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2069 ?auto_2079 ) ) ( not ( = ?auto_2069 ?auto_2076 ) ) ( not ( = ?auto_2074 ?auto_2078 ) ) ( not ( = ?auto_2074 ?auto_2077 ) ) ( not ( = ?auto_2062 ?auto_2066 ) ) ( not ( = ?auto_2062 ?auto_2071 ) ) ( not ( = ?auto_2063 ?auto_2066 ) ) ( not ( = ?auto_2063 ?auto_2071 ) ) ( not ( = ?auto_2064 ?auto_2066 ) ) ( not ( = ?auto_2064 ?auto_2071 ) ) ( not ( = ?auto_2066 ?auto_2074 ) ) ( not ( = ?auto_2066 ?auto_2078 ) ) ( not ( = ?auto_2066 ?auto_2077 ) ) ( not ( = ?auto_2071 ?auto_2074 ) ) ( not ( = ?auto_2071 ?auto_2078 ) ) ( not ( = ?auto_2071 ?auto_2077 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2062 ?auto_2063 ?auto_2064 ?auto_2065 )
      ( MAKE-1CRATE ?auto_2065 ?auto_2066 )
      ( MAKE-4CRATE-VERIFY ?auto_2062 ?auto_2063 ?auto_2064 ?auto_2065 ?auto_2066 ) )
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
      ?auto_2107 - HOIST
      ?auto_2104 - PLACE
      ?auto_2105 - PLACE
      ?auto_2102 - HOIST
      ?auto_2106 - SURFACE
      ?auto_2109 - PLACE
      ?auto_2111 - HOIST
      ?auto_2110 - SURFACE
      ?auto_2112 - SURFACE
      ?auto_2114 - SURFACE
      ?auto_2115 - PLACE
      ?auto_2108 - HOIST
      ?auto_2113 - SURFACE
      ?auto_2103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107 ?auto_2104 ) ( IS-CRATE ?auto_2101 ) ( not ( = ?auto_2105 ?auto_2104 ) ) ( HOIST-AT ?auto_2102 ?auto_2105 ) ( SURFACE-AT ?auto_2101 ?auto_2105 ) ( ON ?auto_2101 ?auto_2106 ) ( CLEAR ?auto_2101 ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2106 ) ) ( not ( = ?auto_2101 ?auto_2106 ) ) ( not ( = ?auto_2107 ?auto_2102 ) ) ( IS-CRATE ?auto_2100 ) ( not ( = ?auto_2109 ?auto_2104 ) ) ( HOIST-AT ?auto_2111 ?auto_2109 ) ( SURFACE-AT ?auto_2100 ?auto_2109 ) ( ON ?auto_2100 ?auto_2110 ) ( CLEAR ?auto_2100 ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2110 ) ) ( not ( = ?auto_2100 ?auto_2110 ) ) ( not ( = ?auto_2107 ?auto_2111 ) ) ( IS-CRATE ?auto_2099 ) ( AVAILABLE ?auto_2111 ) ( SURFACE-AT ?auto_2099 ?auto_2109 ) ( ON ?auto_2099 ?auto_2112 ) ( CLEAR ?auto_2099 ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( not ( = ?auto_2098 ?auto_2112 ) ) ( not ( = ?auto_2099 ?auto_2112 ) ) ( IS-CRATE ?auto_2098 ) ( AVAILABLE ?auto_2102 ) ( SURFACE-AT ?auto_2098 ?auto_2105 ) ( ON ?auto_2098 ?auto_2114 ) ( CLEAR ?auto_2098 ) ( not ( = ?auto_2097 ?auto_2098 ) ) ( not ( = ?auto_2097 ?auto_2114 ) ) ( not ( = ?auto_2098 ?auto_2114 ) ) ( SURFACE-AT ?auto_2096 ?auto_2104 ) ( CLEAR ?auto_2096 ) ( IS-CRATE ?auto_2097 ) ( AVAILABLE ?auto_2107 ) ( not ( = ?auto_2115 ?auto_2104 ) ) ( HOIST-AT ?auto_2108 ?auto_2115 ) ( AVAILABLE ?auto_2108 ) ( SURFACE-AT ?auto_2097 ?auto_2115 ) ( ON ?auto_2097 ?auto_2113 ) ( CLEAR ?auto_2097 ) ( TRUCK-AT ?auto_2103 ?auto_2104 ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2113 ) ) ( not ( = ?auto_2097 ?auto_2113 ) ) ( not ( = ?auto_2107 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2098 ) ) ( not ( = ?auto_2096 ?auto_2114 ) ) ( not ( = ?auto_2098 ?auto_2113 ) ) ( not ( = ?auto_2105 ?auto_2115 ) ) ( not ( = ?auto_2102 ?auto_2108 ) ) ( not ( = ?auto_2114 ?auto_2113 ) ) ( not ( = ?auto_2096 ?auto_2099 ) ) ( not ( = ?auto_2096 ?auto_2112 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2112 ) ) ( not ( = ?auto_2099 ?auto_2114 ) ) ( not ( = ?auto_2099 ?auto_2113 ) ) ( not ( = ?auto_2109 ?auto_2105 ) ) ( not ( = ?auto_2109 ?auto_2115 ) ) ( not ( = ?auto_2111 ?auto_2102 ) ) ( not ( = ?auto_2111 ?auto_2108 ) ) ( not ( = ?auto_2112 ?auto_2114 ) ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2096 ?auto_2100 ) ) ( not ( = ?auto_2096 ?auto_2110 ) ) ( not ( = ?auto_2097 ?auto_2100 ) ) ( not ( = ?auto_2097 ?auto_2110 ) ) ( not ( = ?auto_2098 ?auto_2100 ) ) ( not ( = ?auto_2098 ?auto_2110 ) ) ( not ( = ?auto_2100 ?auto_2112 ) ) ( not ( = ?auto_2100 ?auto_2114 ) ) ( not ( = ?auto_2100 ?auto_2113 ) ) ( not ( = ?auto_2110 ?auto_2112 ) ) ( not ( = ?auto_2110 ?auto_2114 ) ) ( not ( = ?auto_2110 ?auto_2113 ) ) ( not ( = ?auto_2096 ?auto_2101 ) ) ( not ( = ?auto_2096 ?auto_2106 ) ) ( not ( = ?auto_2097 ?auto_2101 ) ) ( not ( = ?auto_2097 ?auto_2106 ) ) ( not ( = ?auto_2098 ?auto_2101 ) ) ( not ( = ?auto_2098 ?auto_2106 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2099 ?auto_2106 ) ) ( not ( = ?auto_2101 ?auto_2110 ) ) ( not ( = ?auto_2101 ?auto_2112 ) ) ( not ( = ?auto_2101 ?auto_2114 ) ) ( not ( = ?auto_2101 ?auto_2113 ) ) ( not ( = ?auto_2106 ?auto_2110 ) ) ( not ( = ?auto_2106 ?auto_2112 ) ) ( not ( = ?auto_2106 ?auto_2114 ) ) ( not ( = ?auto_2106 ?auto_2113 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2096 ?auto_2097 ?auto_2098 ?auto_2099 ?auto_2100 )
      ( MAKE-1CRATE ?auto_2100 ?auto_2101 )
      ( MAKE-5CRATE-VERIFY ?auto_2096 ?auto_2097 ?auto_2098 ?auto_2099 ?auto_2100 ?auto_2101 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2133 - SURFACE
      ?auto_2134 - SURFACE
      ?auto_2135 - SURFACE
      ?auto_2136 - SURFACE
      ?auto_2137 - SURFACE
      ?auto_2138 - SURFACE
      ?auto_2139 - SURFACE
    )
    :vars
    (
      ?auto_2142 - HOIST
      ?auto_2141 - PLACE
      ?auto_2145 - PLACE
      ?auto_2143 - HOIST
      ?auto_2144 - SURFACE
      ?auto_2152 - PLACE
      ?auto_2153 - HOIST
      ?auto_2154 - SURFACE
      ?auto_2148 - PLACE
      ?auto_2147 - HOIST
      ?auto_2150 - SURFACE
      ?auto_2151 - SURFACE
      ?auto_2156 - SURFACE
      ?auto_2155 - PLACE
      ?auto_2146 - HOIST
      ?auto_2149 - SURFACE
      ?auto_2140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142 ?auto_2141 ) ( IS-CRATE ?auto_2139 ) ( not ( = ?auto_2145 ?auto_2141 ) ) ( HOIST-AT ?auto_2143 ?auto_2145 ) ( AVAILABLE ?auto_2143 ) ( SURFACE-AT ?auto_2139 ?auto_2145 ) ( ON ?auto_2139 ?auto_2144 ) ( CLEAR ?auto_2139 ) ( not ( = ?auto_2138 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2144 ) ) ( not ( = ?auto_2139 ?auto_2144 ) ) ( not ( = ?auto_2142 ?auto_2143 ) ) ( IS-CRATE ?auto_2138 ) ( not ( = ?auto_2152 ?auto_2141 ) ) ( HOIST-AT ?auto_2153 ?auto_2152 ) ( SURFACE-AT ?auto_2138 ?auto_2152 ) ( ON ?auto_2138 ?auto_2154 ) ( CLEAR ?auto_2138 ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2154 ) ) ( not ( = ?auto_2138 ?auto_2154 ) ) ( not ( = ?auto_2142 ?auto_2153 ) ) ( IS-CRATE ?auto_2137 ) ( not ( = ?auto_2148 ?auto_2141 ) ) ( HOIST-AT ?auto_2147 ?auto_2148 ) ( SURFACE-AT ?auto_2137 ?auto_2148 ) ( ON ?auto_2137 ?auto_2150 ) ( CLEAR ?auto_2137 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2150 ) ) ( not ( = ?auto_2142 ?auto_2147 ) ) ( IS-CRATE ?auto_2136 ) ( AVAILABLE ?auto_2147 ) ( SURFACE-AT ?auto_2136 ?auto_2148 ) ( ON ?auto_2136 ?auto_2151 ) ( CLEAR ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2151 ) ) ( not ( = ?auto_2136 ?auto_2151 ) ) ( IS-CRATE ?auto_2135 ) ( AVAILABLE ?auto_2153 ) ( SURFACE-AT ?auto_2135 ?auto_2152 ) ( ON ?auto_2135 ?auto_2156 ) ( CLEAR ?auto_2135 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2156 ) ) ( not ( = ?auto_2135 ?auto_2156 ) ) ( SURFACE-AT ?auto_2133 ?auto_2141 ) ( CLEAR ?auto_2133 ) ( IS-CRATE ?auto_2134 ) ( AVAILABLE ?auto_2142 ) ( not ( = ?auto_2155 ?auto_2141 ) ) ( HOIST-AT ?auto_2146 ?auto_2155 ) ( AVAILABLE ?auto_2146 ) ( SURFACE-AT ?auto_2134 ?auto_2155 ) ( ON ?auto_2134 ?auto_2149 ) ( CLEAR ?auto_2134 ) ( TRUCK-AT ?auto_2140 ?auto_2141 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2149 ) ) ( not ( = ?auto_2134 ?auto_2149 ) ) ( not ( = ?auto_2142 ?auto_2146 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( not ( = ?auto_2133 ?auto_2156 ) ) ( not ( = ?auto_2135 ?auto_2149 ) ) ( not ( = ?auto_2152 ?auto_2155 ) ) ( not ( = ?auto_2153 ?auto_2146 ) ) ( not ( = ?auto_2156 ?auto_2149 ) ) ( not ( = ?auto_2133 ?auto_2136 ) ) ( not ( = ?auto_2133 ?auto_2151 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2134 ?auto_2151 ) ) ( not ( = ?auto_2136 ?auto_2156 ) ) ( not ( = ?auto_2136 ?auto_2149 ) ) ( not ( = ?auto_2148 ?auto_2152 ) ) ( not ( = ?auto_2148 ?auto_2155 ) ) ( not ( = ?auto_2147 ?auto_2153 ) ) ( not ( = ?auto_2147 ?auto_2146 ) ) ( not ( = ?auto_2151 ?auto_2156 ) ) ( not ( = ?auto_2151 ?auto_2149 ) ) ( not ( = ?auto_2133 ?auto_2137 ) ) ( not ( = ?auto_2133 ?auto_2150 ) ) ( not ( = ?auto_2134 ?auto_2137 ) ) ( not ( = ?auto_2134 ?auto_2150 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2151 ) ) ( not ( = ?auto_2137 ?auto_2156 ) ) ( not ( = ?auto_2137 ?auto_2149 ) ) ( not ( = ?auto_2150 ?auto_2151 ) ) ( not ( = ?auto_2150 ?auto_2156 ) ) ( not ( = ?auto_2150 ?auto_2149 ) ) ( not ( = ?auto_2133 ?auto_2138 ) ) ( not ( = ?auto_2133 ?auto_2154 ) ) ( not ( = ?auto_2134 ?auto_2138 ) ) ( not ( = ?auto_2134 ?auto_2154 ) ) ( not ( = ?auto_2135 ?auto_2138 ) ) ( not ( = ?auto_2135 ?auto_2154 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2136 ?auto_2154 ) ) ( not ( = ?auto_2138 ?auto_2150 ) ) ( not ( = ?auto_2138 ?auto_2151 ) ) ( not ( = ?auto_2138 ?auto_2156 ) ) ( not ( = ?auto_2138 ?auto_2149 ) ) ( not ( = ?auto_2154 ?auto_2150 ) ) ( not ( = ?auto_2154 ?auto_2151 ) ) ( not ( = ?auto_2154 ?auto_2156 ) ) ( not ( = ?auto_2154 ?auto_2149 ) ) ( not ( = ?auto_2133 ?auto_2139 ) ) ( not ( = ?auto_2133 ?auto_2144 ) ) ( not ( = ?auto_2134 ?auto_2139 ) ) ( not ( = ?auto_2134 ?auto_2144 ) ) ( not ( = ?auto_2135 ?auto_2139 ) ) ( not ( = ?auto_2135 ?auto_2144 ) ) ( not ( = ?auto_2136 ?auto_2139 ) ) ( not ( = ?auto_2136 ?auto_2144 ) ) ( not ( = ?auto_2137 ?auto_2139 ) ) ( not ( = ?auto_2137 ?auto_2144 ) ) ( not ( = ?auto_2139 ?auto_2154 ) ) ( not ( = ?auto_2139 ?auto_2150 ) ) ( not ( = ?auto_2139 ?auto_2151 ) ) ( not ( = ?auto_2139 ?auto_2156 ) ) ( not ( = ?auto_2139 ?auto_2149 ) ) ( not ( = ?auto_2145 ?auto_2152 ) ) ( not ( = ?auto_2145 ?auto_2148 ) ) ( not ( = ?auto_2145 ?auto_2155 ) ) ( not ( = ?auto_2143 ?auto_2153 ) ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( not ( = ?auto_2143 ?auto_2146 ) ) ( not ( = ?auto_2144 ?auto_2154 ) ) ( not ( = ?auto_2144 ?auto_2150 ) ) ( not ( = ?auto_2144 ?auto_2151 ) ) ( not ( = ?auto_2144 ?auto_2156 ) ) ( not ( = ?auto_2144 ?auto_2149 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2138 )
      ( MAKE-1CRATE ?auto_2138 ?auto_2139 )
      ( MAKE-6CRATE-VERIFY ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2138 ?auto_2139 ) )
  )

)

