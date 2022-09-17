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
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
    )
    :vars
    (
      ?auto_1934 - HOIST
      ?auto_1935 - PLACE
      ?auto_1937 - PLACE
      ?auto_1938 - HOIST
      ?auto_1939 - SURFACE
      ?auto_1936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1934 ?auto_1935 ) ( SURFACE-AT ?auto_1933 ?auto_1935 ) ( CLEAR ?auto_1933 ) ( IS-CRATE ?auto_1932 ) ( AVAILABLE ?auto_1934 ) ( not ( = ?auto_1937 ?auto_1935 ) ) ( HOIST-AT ?auto_1938 ?auto_1937 ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1932 ?auto_1937 ) ( ON ?auto_1932 ?auto_1939 ) ( CLEAR ?auto_1932 ) ( TRUCK-AT ?auto_1936 ?auto_1935 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1939 ) ) ( not ( = ?auto_1933 ?auto_1939 ) ) ( not ( = ?auto_1934 ?auto_1938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1936 ?auto_1935 ?auto_1937 )
      ( !LIFT ?auto_1938 ?auto_1932 ?auto_1939 ?auto_1937 )
      ( !LOAD ?auto_1938 ?auto_1932 ?auto_1936 ?auto_1937 )
      ( !DRIVE ?auto_1936 ?auto_1937 ?auto_1935 )
      ( !UNLOAD ?auto_1934 ?auto_1932 ?auto_1936 ?auto_1935 )
      ( !DROP ?auto_1934 ?auto_1932 ?auto_1933 ?auto_1935 )
      ( MAKE-ON-VERIFY ?auto_1932 ?auto_1933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1942 - SURFACE
      ?auto_1943 - SURFACE
    )
    :vars
    (
      ?auto_1944 - HOIST
      ?auto_1945 - PLACE
      ?auto_1947 - PLACE
      ?auto_1948 - HOIST
      ?auto_1949 - SURFACE
      ?auto_1946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1944 ?auto_1945 ) ( SURFACE-AT ?auto_1943 ?auto_1945 ) ( CLEAR ?auto_1943 ) ( IS-CRATE ?auto_1942 ) ( AVAILABLE ?auto_1944 ) ( not ( = ?auto_1947 ?auto_1945 ) ) ( HOIST-AT ?auto_1948 ?auto_1947 ) ( AVAILABLE ?auto_1948 ) ( SURFACE-AT ?auto_1942 ?auto_1947 ) ( ON ?auto_1942 ?auto_1949 ) ( CLEAR ?auto_1942 ) ( TRUCK-AT ?auto_1946 ?auto_1945 ) ( not ( = ?auto_1942 ?auto_1943 ) ) ( not ( = ?auto_1942 ?auto_1949 ) ) ( not ( = ?auto_1943 ?auto_1949 ) ) ( not ( = ?auto_1944 ?auto_1948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1946 ?auto_1945 ?auto_1947 )
      ( !LIFT ?auto_1948 ?auto_1942 ?auto_1949 ?auto_1947 )
      ( !LOAD ?auto_1948 ?auto_1942 ?auto_1946 ?auto_1947 )
      ( !DRIVE ?auto_1946 ?auto_1947 ?auto_1945 )
      ( !UNLOAD ?auto_1944 ?auto_1942 ?auto_1946 ?auto_1945 )
      ( !DROP ?auto_1944 ?auto_1942 ?auto_1943 ?auto_1945 )
      ( MAKE-ON-VERIFY ?auto_1942 ?auto_1943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1952 - SURFACE
      ?auto_1953 - SURFACE
    )
    :vars
    (
      ?auto_1954 - HOIST
      ?auto_1955 - PLACE
      ?auto_1957 - PLACE
      ?auto_1958 - HOIST
      ?auto_1959 - SURFACE
      ?auto_1956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954 ?auto_1955 ) ( SURFACE-AT ?auto_1953 ?auto_1955 ) ( CLEAR ?auto_1953 ) ( IS-CRATE ?auto_1952 ) ( AVAILABLE ?auto_1954 ) ( not ( = ?auto_1957 ?auto_1955 ) ) ( HOIST-AT ?auto_1958 ?auto_1957 ) ( AVAILABLE ?auto_1958 ) ( SURFACE-AT ?auto_1952 ?auto_1957 ) ( ON ?auto_1952 ?auto_1959 ) ( CLEAR ?auto_1952 ) ( TRUCK-AT ?auto_1956 ?auto_1955 ) ( not ( = ?auto_1952 ?auto_1953 ) ) ( not ( = ?auto_1952 ?auto_1959 ) ) ( not ( = ?auto_1953 ?auto_1959 ) ) ( not ( = ?auto_1954 ?auto_1958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1956 ?auto_1955 ?auto_1957 )
      ( !LIFT ?auto_1958 ?auto_1952 ?auto_1959 ?auto_1957 )
      ( !LOAD ?auto_1958 ?auto_1952 ?auto_1956 ?auto_1957 )
      ( !DRIVE ?auto_1956 ?auto_1957 ?auto_1955 )
      ( !UNLOAD ?auto_1954 ?auto_1952 ?auto_1956 ?auto_1955 )
      ( !DROP ?auto_1954 ?auto_1952 ?auto_1953 ?auto_1955 )
      ( MAKE-ON-VERIFY ?auto_1952 ?auto_1953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1962 - SURFACE
      ?auto_1963 - SURFACE
    )
    :vars
    (
      ?auto_1964 - HOIST
      ?auto_1965 - PLACE
      ?auto_1967 - PLACE
      ?auto_1968 - HOIST
      ?auto_1969 - SURFACE
      ?auto_1966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1964 ?auto_1965 ) ( SURFACE-AT ?auto_1963 ?auto_1965 ) ( CLEAR ?auto_1963 ) ( IS-CRATE ?auto_1962 ) ( AVAILABLE ?auto_1964 ) ( not ( = ?auto_1967 ?auto_1965 ) ) ( HOIST-AT ?auto_1968 ?auto_1967 ) ( AVAILABLE ?auto_1968 ) ( SURFACE-AT ?auto_1962 ?auto_1967 ) ( ON ?auto_1962 ?auto_1969 ) ( CLEAR ?auto_1962 ) ( TRUCK-AT ?auto_1966 ?auto_1965 ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1962 ?auto_1969 ) ) ( not ( = ?auto_1963 ?auto_1969 ) ) ( not ( = ?auto_1964 ?auto_1968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1966 ?auto_1965 ?auto_1967 )
      ( !LIFT ?auto_1968 ?auto_1962 ?auto_1969 ?auto_1967 )
      ( !LOAD ?auto_1968 ?auto_1962 ?auto_1966 ?auto_1967 )
      ( !DRIVE ?auto_1966 ?auto_1967 ?auto_1965 )
      ( !UNLOAD ?auto_1964 ?auto_1962 ?auto_1966 ?auto_1965 )
      ( !DROP ?auto_1964 ?auto_1962 ?auto_1963 ?auto_1965 )
      ( MAKE-ON-VERIFY ?auto_1962 ?auto_1963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1972 - SURFACE
      ?auto_1973 - SURFACE
    )
    :vars
    (
      ?auto_1974 - HOIST
      ?auto_1975 - PLACE
      ?auto_1977 - PLACE
      ?auto_1978 - HOIST
      ?auto_1979 - SURFACE
      ?auto_1976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1974 ?auto_1975 ) ( SURFACE-AT ?auto_1973 ?auto_1975 ) ( CLEAR ?auto_1973 ) ( IS-CRATE ?auto_1972 ) ( AVAILABLE ?auto_1974 ) ( not ( = ?auto_1977 ?auto_1975 ) ) ( HOIST-AT ?auto_1978 ?auto_1977 ) ( AVAILABLE ?auto_1978 ) ( SURFACE-AT ?auto_1972 ?auto_1977 ) ( ON ?auto_1972 ?auto_1979 ) ( CLEAR ?auto_1972 ) ( TRUCK-AT ?auto_1976 ?auto_1975 ) ( not ( = ?auto_1972 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1979 ) ) ( not ( = ?auto_1973 ?auto_1979 ) ) ( not ( = ?auto_1974 ?auto_1978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1976 ?auto_1975 ?auto_1977 )
      ( !LIFT ?auto_1978 ?auto_1972 ?auto_1979 ?auto_1977 )
      ( !LOAD ?auto_1978 ?auto_1972 ?auto_1976 ?auto_1977 )
      ( !DRIVE ?auto_1976 ?auto_1977 ?auto_1975 )
      ( !UNLOAD ?auto_1974 ?auto_1972 ?auto_1976 ?auto_1975 )
      ( !DROP ?auto_1974 ?auto_1972 ?auto_1973 ?auto_1975 )
      ( MAKE-ON-VERIFY ?auto_1972 ?auto_1973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1982 - SURFACE
      ?auto_1983 - SURFACE
    )
    :vars
    (
      ?auto_1984 - HOIST
      ?auto_1985 - PLACE
      ?auto_1987 - PLACE
      ?auto_1988 - HOIST
      ?auto_1989 - SURFACE
      ?auto_1986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1984 ?auto_1985 ) ( SURFACE-AT ?auto_1983 ?auto_1985 ) ( CLEAR ?auto_1983 ) ( IS-CRATE ?auto_1982 ) ( AVAILABLE ?auto_1984 ) ( not ( = ?auto_1987 ?auto_1985 ) ) ( HOIST-AT ?auto_1988 ?auto_1987 ) ( AVAILABLE ?auto_1988 ) ( SURFACE-AT ?auto_1982 ?auto_1987 ) ( ON ?auto_1982 ?auto_1989 ) ( CLEAR ?auto_1982 ) ( TRUCK-AT ?auto_1986 ?auto_1985 ) ( not ( = ?auto_1982 ?auto_1983 ) ) ( not ( = ?auto_1982 ?auto_1989 ) ) ( not ( = ?auto_1983 ?auto_1989 ) ) ( not ( = ?auto_1984 ?auto_1988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1986 ?auto_1985 ?auto_1987 )
      ( !LIFT ?auto_1988 ?auto_1982 ?auto_1989 ?auto_1987 )
      ( !LOAD ?auto_1988 ?auto_1982 ?auto_1986 ?auto_1987 )
      ( !DRIVE ?auto_1986 ?auto_1987 ?auto_1985 )
      ( !UNLOAD ?auto_1984 ?auto_1982 ?auto_1986 ?auto_1985 )
      ( !DROP ?auto_1984 ?auto_1982 ?auto_1983 ?auto_1985 )
      ( MAKE-ON-VERIFY ?auto_1982 ?auto_1983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1992 - SURFACE
      ?auto_1993 - SURFACE
    )
    :vars
    (
      ?auto_1994 - HOIST
      ?auto_1995 - PLACE
      ?auto_1997 - PLACE
      ?auto_1998 - HOIST
      ?auto_1999 - SURFACE
      ?auto_1996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1994 ?auto_1995 ) ( SURFACE-AT ?auto_1993 ?auto_1995 ) ( CLEAR ?auto_1993 ) ( IS-CRATE ?auto_1992 ) ( AVAILABLE ?auto_1994 ) ( not ( = ?auto_1997 ?auto_1995 ) ) ( HOIST-AT ?auto_1998 ?auto_1997 ) ( AVAILABLE ?auto_1998 ) ( SURFACE-AT ?auto_1992 ?auto_1997 ) ( ON ?auto_1992 ?auto_1999 ) ( CLEAR ?auto_1992 ) ( TRUCK-AT ?auto_1996 ?auto_1995 ) ( not ( = ?auto_1992 ?auto_1993 ) ) ( not ( = ?auto_1992 ?auto_1999 ) ) ( not ( = ?auto_1993 ?auto_1999 ) ) ( not ( = ?auto_1994 ?auto_1998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1996 ?auto_1995 ?auto_1997 )
      ( !LIFT ?auto_1998 ?auto_1992 ?auto_1999 ?auto_1997 )
      ( !LOAD ?auto_1998 ?auto_1992 ?auto_1996 ?auto_1997 )
      ( !DRIVE ?auto_1996 ?auto_1997 ?auto_1995 )
      ( !UNLOAD ?auto_1994 ?auto_1992 ?auto_1996 ?auto_1995 )
      ( !DROP ?auto_1994 ?auto_1992 ?auto_1993 ?auto_1995 )
      ( MAKE-ON-VERIFY ?auto_1992 ?auto_1993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2002 - SURFACE
      ?auto_2003 - SURFACE
    )
    :vars
    (
      ?auto_2004 - HOIST
      ?auto_2005 - PLACE
      ?auto_2007 - PLACE
      ?auto_2008 - HOIST
      ?auto_2009 - SURFACE
      ?auto_2006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2004 ?auto_2005 ) ( SURFACE-AT ?auto_2003 ?auto_2005 ) ( CLEAR ?auto_2003 ) ( IS-CRATE ?auto_2002 ) ( AVAILABLE ?auto_2004 ) ( not ( = ?auto_2007 ?auto_2005 ) ) ( HOIST-AT ?auto_2008 ?auto_2007 ) ( AVAILABLE ?auto_2008 ) ( SURFACE-AT ?auto_2002 ?auto_2007 ) ( ON ?auto_2002 ?auto_2009 ) ( CLEAR ?auto_2002 ) ( TRUCK-AT ?auto_2006 ?auto_2005 ) ( not ( = ?auto_2002 ?auto_2003 ) ) ( not ( = ?auto_2002 ?auto_2009 ) ) ( not ( = ?auto_2003 ?auto_2009 ) ) ( not ( = ?auto_2004 ?auto_2008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2006 ?auto_2005 ?auto_2007 )
      ( !LIFT ?auto_2008 ?auto_2002 ?auto_2009 ?auto_2007 )
      ( !LOAD ?auto_2008 ?auto_2002 ?auto_2006 ?auto_2007 )
      ( !DRIVE ?auto_2006 ?auto_2007 ?auto_2005 )
      ( !UNLOAD ?auto_2004 ?auto_2002 ?auto_2006 ?auto_2005 )
      ( !DROP ?auto_2004 ?auto_2002 ?auto_2003 ?auto_2005 )
      ( MAKE-ON-VERIFY ?auto_2002 ?auto_2003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2012 - SURFACE
      ?auto_2013 - SURFACE
    )
    :vars
    (
      ?auto_2014 - HOIST
      ?auto_2015 - PLACE
      ?auto_2017 - PLACE
      ?auto_2018 - HOIST
      ?auto_2019 - SURFACE
      ?auto_2016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2014 ?auto_2015 ) ( SURFACE-AT ?auto_2013 ?auto_2015 ) ( CLEAR ?auto_2013 ) ( IS-CRATE ?auto_2012 ) ( AVAILABLE ?auto_2014 ) ( not ( = ?auto_2017 ?auto_2015 ) ) ( HOIST-AT ?auto_2018 ?auto_2017 ) ( AVAILABLE ?auto_2018 ) ( SURFACE-AT ?auto_2012 ?auto_2017 ) ( ON ?auto_2012 ?auto_2019 ) ( CLEAR ?auto_2012 ) ( TRUCK-AT ?auto_2016 ?auto_2015 ) ( not ( = ?auto_2012 ?auto_2013 ) ) ( not ( = ?auto_2012 ?auto_2019 ) ) ( not ( = ?auto_2013 ?auto_2019 ) ) ( not ( = ?auto_2014 ?auto_2018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2016 ?auto_2015 ?auto_2017 )
      ( !LIFT ?auto_2018 ?auto_2012 ?auto_2019 ?auto_2017 )
      ( !LOAD ?auto_2018 ?auto_2012 ?auto_2016 ?auto_2017 )
      ( !DRIVE ?auto_2016 ?auto_2017 ?auto_2015 )
      ( !UNLOAD ?auto_2014 ?auto_2012 ?auto_2016 ?auto_2015 )
      ( !DROP ?auto_2014 ?auto_2012 ?auto_2013 ?auto_2015 )
      ( MAKE-ON-VERIFY ?auto_2012 ?auto_2013 ) )
  )

)

