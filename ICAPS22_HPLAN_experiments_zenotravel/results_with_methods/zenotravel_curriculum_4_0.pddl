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
      ?auto_1899 - PERSON
      ?auto_1898 - CITY
    )
    :vars
    (
      ?auto_1902 - FLEVEL
      ?auto_1901 - FLEVEL
      ?auto_1903 - CITY
      ?auto_1900 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1902 ?auto_1901 ) ( PERSON-AT ?auto_1899 ?auto_1903 ) ( AIRCRAFT-AT ?auto_1900 ?auto_1898 ) ( FUEL-LEVEL ?auto_1900 ?auto_1902 ) ( not ( = ?auto_1898 ?auto_1903 ) ) ( not ( = ?auto_1902 ?auto_1901 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1900 ?auto_1898 ?auto_1902 ?auto_1901 )
      ( !FLY ?auto_1900 ?auto_1898 ?auto_1903 ?auto_1901 ?auto_1902 )
      ( !REFUEL ?auto_1900 ?auto_1903 ?auto_1902 ?auto_1901 )
      ( !BOARD ?auto_1899 ?auto_1900 ?auto_1903 )
      ( !FLY ?auto_1900 ?auto_1903 ?auto_1898 ?auto_1901 ?auto_1902 )
      ( !DEBARK ?auto_1899 ?auto_1900 ?auto_1898 )
      ( FLY-1PPL-VERIFY ?auto_1899 ?auto_1898 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1907 - PERSON
      ?auto_1906 - CITY
    )
    :vars
    (
      ?auto_1910 - FLEVEL
      ?auto_1909 - FLEVEL
      ?auto_1911 - CITY
      ?auto_1908 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1910 ?auto_1909 ) ( PERSON-AT ?auto_1907 ?auto_1911 ) ( AIRCRAFT-AT ?auto_1908 ?auto_1906 ) ( FUEL-LEVEL ?auto_1908 ?auto_1910 ) ( not ( = ?auto_1906 ?auto_1911 ) ) ( not ( = ?auto_1910 ?auto_1909 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1908 ?auto_1906 ?auto_1910 ?auto_1909 )
      ( !FLY ?auto_1908 ?auto_1906 ?auto_1911 ?auto_1909 ?auto_1910 )
      ( !REFUEL ?auto_1908 ?auto_1911 ?auto_1910 ?auto_1909 )
      ( !BOARD ?auto_1907 ?auto_1908 ?auto_1911 )
      ( !FLY ?auto_1908 ?auto_1911 ?auto_1906 ?auto_1909 ?auto_1910 )
      ( !DEBARK ?auto_1907 ?auto_1908 ?auto_1906 )
      ( FLY-1PPL-VERIFY ?auto_1907 ?auto_1906 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1922 - PERSON
      ?auto_1923 - PERSON
      ?auto_1921 - CITY
    )
    :vars
    (
      ?auto_1925 - FLEVEL
      ?auto_1926 - FLEVEL
      ?auto_1924 - CITY
      ?auto_1927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1925 ?auto_1926 ) ( PERSON-AT ?auto_1923 ?auto_1924 ) ( not ( = ?auto_1921 ?auto_1924 ) ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( PERSON-AT ?auto_1922 ?auto_1924 ) ( AIRCRAFT-AT ?auto_1927 ?auto_1921 ) ( FUEL-LEVEL ?auto_1927 ?auto_1925 ) ( not ( = ?auto_1922 ?auto_1923 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1922 ?auto_1921 )
      ( FLY-1PPL ?auto_1923 ?auto_1921 )
      ( FLY-2PPL-VERIFY ?auto_1922 ?auto_1923 ?auto_1921 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1929 - PERSON
      ?auto_1930 - PERSON
      ?auto_1928 - CITY
    )
    :vars
    (
      ?auto_1934 - FLEVEL
      ?auto_1932 - FLEVEL
      ?auto_1931 - CITY
      ?auto_1933 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1934 ?auto_1932 ) ( PERSON-AT ?auto_1929 ?auto_1931 ) ( not ( = ?auto_1928 ?auto_1931 ) ) ( not ( = ?auto_1934 ?auto_1932 ) ) ( PERSON-AT ?auto_1930 ?auto_1931 ) ( AIRCRAFT-AT ?auto_1933 ?auto_1928 ) ( FUEL-LEVEL ?auto_1933 ?auto_1934 ) ( not ( = ?auto_1930 ?auto_1929 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1930 ?auto_1929 ?auto_1928 )
      ( FLY-2PPL-VERIFY ?auto_1929 ?auto_1930 ?auto_1928 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1946 - PERSON
      ?auto_1945 - CITY
    )
    :vars
    (
      ?auto_1949 - FLEVEL
      ?auto_1948 - FLEVEL
      ?auto_1950 - CITY
      ?auto_1947 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1949 ?auto_1948 ) ( PERSON-AT ?auto_1946 ?auto_1950 ) ( AIRCRAFT-AT ?auto_1947 ?auto_1945 ) ( FUEL-LEVEL ?auto_1947 ?auto_1949 ) ( not ( = ?auto_1945 ?auto_1950 ) ) ( not ( = ?auto_1949 ?auto_1948 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1947 ?auto_1945 ?auto_1949 ?auto_1948 )
      ( !FLY ?auto_1947 ?auto_1945 ?auto_1950 ?auto_1948 ?auto_1949 )
      ( !REFUEL ?auto_1947 ?auto_1950 ?auto_1949 ?auto_1948 )
      ( !BOARD ?auto_1946 ?auto_1947 ?auto_1950 )
      ( !FLY ?auto_1947 ?auto_1950 ?auto_1945 ?auto_1948 ?auto_1949 )
      ( !DEBARK ?auto_1946 ?auto_1947 ?auto_1945 )
      ( FLY-1PPL-VERIFY ?auto_1946 ?auto_1945 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2038 - PERSON
      ?auto_2039 - PERSON
      ?auto_2040 - PERSON
      ?auto_2037 - CITY
    )
    :vars
    (
      ?auto_2043 - FLEVEL
      ?auto_2041 - FLEVEL
      ?auto_2042 - CITY
      ?auto_2045 - CITY
      ?auto_2044 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2043 ?auto_2041 ) ( PERSON-AT ?auto_2040 ?auto_2042 ) ( not ( = ?auto_2037 ?auto_2042 ) ) ( not ( = ?auto_2043 ?auto_2041 ) ) ( PERSON-AT ?auto_2039 ?auto_2045 ) ( not ( = ?auto_2037 ?auto_2045 ) ) ( PERSON-AT ?auto_2038 ?auto_2045 ) ( AIRCRAFT-AT ?auto_2044 ?auto_2037 ) ( FUEL-LEVEL ?auto_2044 ?auto_2043 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( not ( = ?auto_2038 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( not ( = ?auto_2042 ?auto_2045 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2039 ?auto_2038 ?auto_2037 )
      ( FLY-1PPL ?auto_2040 ?auto_2037 )
      ( FLY-3PPL-VERIFY ?auto_2038 ?auto_2039 ?auto_2040 ?auto_2037 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2057 - PERSON
      ?auto_2058 - PERSON
      ?auto_2059 - PERSON
      ?auto_2056 - CITY
    )
    :vars
    (
      ?auto_2060 - FLEVEL
      ?auto_2064 - FLEVEL
      ?auto_2061 - CITY
      ?auto_2063 - CITY
      ?auto_2062 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2060 ?auto_2064 ) ( PERSON-AT ?auto_2058 ?auto_2061 ) ( not ( = ?auto_2056 ?auto_2061 ) ) ( not ( = ?auto_2060 ?auto_2064 ) ) ( PERSON-AT ?auto_2059 ?auto_2063 ) ( not ( = ?auto_2056 ?auto_2063 ) ) ( PERSON-AT ?auto_2057 ?auto_2063 ) ( AIRCRAFT-AT ?auto_2062 ?auto_2056 ) ( FUEL-LEVEL ?auto_2062 ?auto_2060 ) ( not ( = ?auto_2057 ?auto_2059 ) ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( not ( = ?auto_2059 ?auto_2058 ) ) ( not ( = ?auto_2061 ?auto_2063 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2057 ?auto_2059 ?auto_2058 ?auto_2056 )
      ( FLY-3PPL-VERIFY ?auto_2057 ?auto_2058 ?auto_2059 ?auto_2056 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2076 - PERSON
      ?auto_2077 - PERSON
      ?auto_2078 - PERSON
      ?auto_2075 - CITY
    )
    :vars
    (
      ?auto_2080 - FLEVEL
      ?auto_2082 - FLEVEL
      ?auto_2081 - CITY
      ?auto_2083 - CITY
      ?auto_2079 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2080 ?auto_2082 ) ( PERSON-AT ?auto_2078 ?auto_2081 ) ( not ( = ?auto_2075 ?auto_2081 ) ) ( not ( = ?auto_2080 ?auto_2082 ) ) ( PERSON-AT ?auto_2076 ?auto_2083 ) ( not ( = ?auto_2075 ?auto_2083 ) ) ( PERSON-AT ?auto_2077 ?auto_2083 ) ( AIRCRAFT-AT ?auto_2079 ?auto_2075 ) ( FUEL-LEVEL ?auto_2079 ?auto_2080 ) ( not ( = ?auto_2077 ?auto_2076 ) ) ( not ( = ?auto_2077 ?auto_2078 ) ) ( not ( = ?auto_2076 ?auto_2078 ) ) ( not ( = ?auto_2081 ?auto_2083 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2077 ?auto_2078 ?auto_2076 ?auto_2075 )
      ( FLY-3PPL-VERIFY ?auto_2076 ?auto_2077 ?auto_2078 ?auto_2075 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2095 - PERSON
      ?auto_2096 - PERSON
      ?auto_2097 - PERSON
      ?auto_2094 - CITY
    )
    :vars
    (
      ?auto_2099 - FLEVEL
      ?auto_2101 - FLEVEL
      ?auto_2100 - CITY
      ?auto_2102 - CITY
      ?auto_2098 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2099 ?auto_2101 ) ( PERSON-AT ?auto_2096 ?auto_2100 ) ( not ( = ?auto_2094 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( PERSON-AT ?auto_2095 ?auto_2102 ) ( not ( = ?auto_2094 ?auto_2102 ) ) ( PERSON-AT ?auto_2097 ?auto_2102 ) ( AIRCRAFT-AT ?auto_2098 ?auto_2094 ) ( FUEL-LEVEL ?auto_2098 ?auto_2099 ) ( not ( = ?auto_2097 ?auto_2095 ) ) ( not ( = ?auto_2097 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2100 ?auto_2102 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2097 ?auto_2096 ?auto_2095 ?auto_2094 )
      ( FLY-3PPL-VERIFY ?auto_2095 ?auto_2096 ?auto_2097 ?auto_2094 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2134 - PERSON
      ?auto_2135 - PERSON
      ?auto_2136 - PERSON
      ?auto_2133 - CITY
    )
    :vars
    (
      ?auto_2138 - FLEVEL
      ?auto_2140 - FLEVEL
      ?auto_2139 - CITY
      ?auto_2141 - CITY
      ?auto_2137 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2138 ?auto_2140 ) ( PERSON-AT ?auto_2134 ?auto_2139 ) ( not ( = ?auto_2133 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2140 ) ) ( PERSON-AT ?auto_2136 ?auto_2141 ) ( not ( = ?auto_2133 ?auto_2141 ) ) ( PERSON-AT ?auto_2135 ?auto_2141 ) ( AIRCRAFT-AT ?auto_2137 ?auto_2133 ) ( FUEL-LEVEL ?auto_2137 ?auto_2138 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2134 ) ) ( not ( = ?auto_2136 ?auto_2134 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2135 ?auto_2134 ?auto_2136 ?auto_2133 )
      ( FLY-3PPL-VERIFY ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2133 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2153 - PERSON
      ?auto_2154 - PERSON
      ?auto_2155 - PERSON
      ?auto_2152 - CITY
    )
    :vars
    (
      ?auto_2157 - FLEVEL
      ?auto_2159 - FLEVEL
      ?auto_2158 - CITY
      ?auto_2160 - CITY
      ?auto_2156 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2157 ?auto_2159 ) ( PERSON-AT ?auto_2153 ?auto_2158 ) ( not ( = ?auto_2152 ?auto_2158 ) ) ( not ( = ?auto_2157 ?auto_2159 ) ) ( PERSON-AT ?auto_2154 ?auto_2160 ) ( not ( = ?auto_2152 ?auto_2160 ) ) ( PERSON-AT ?auto_2155 ?auto_2160 ) ( AIRCRAFT-AT ?auto_2156 ?auto_2152 ) ( FUEL-LEVEL ?auto_2156 ?auto_2157 ) ( not ( = ?auto_2155 ?auto_2154 ) ) ( not ( = ?auto_2155 ?auto_2153 ) ) ( not ( = ?auto_2154 ?auto_2153 ) ) ( not ( = ?auto_2158 ?auto_2160 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2155 ?auto_2153 ?auto_2154 ?auto_2152 )
      ( FLY-3PPL-VERIFY ?auto_2153 ?auto_2154 ?auto_2155 ?auto_2152 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2215 - PERSON
      ?auto_2214 - CITY
    )
    :vars
    (
      ?auto_2218 - FLEVEL
      ?auto_2217 - FLEVEL
      ?auto_2219 - CITY
      ?auto_2216 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2218 ?auto_2217 ) ( PERSON-AT ?auto_2215 ?auto_2219 ) ( AIRCRAFT-AT ?auto_2216 ?auto_2214 ) ( FUEL-LEVEL ?auto_2216 ?auto_2218 ) ( not ( = ?auto_2214 ?auto_2219 ) ) ( not ( = ?auto_2218 ?auto_2217 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_2216 ?auto_2214 ?auto_2218 ?auto_2217 )
      ( !FLY ?auto_2216 ?auto_2214 ?auto_2219 ?auto_2217 ?auto_2218 )
      ( !REFUEL ?auto_2216 ?auto_2219 ?auto_2218 ?auto_2217 )
      ( !BOARD ?auto_2215 ?auto_2216 ?auto_2219 )
      ( !FLY ?auto_2216 ?auto_2219 ?auto_2214 ?auto_2217 ?auto_2218 )
      ( !DEBARK ?auto_2215 ?auto_2216 ?auto_2214 )
      ( FLY-1PPL-VERIFY ?auto_2215 ?auto_2214 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3198 - PERSON
      ?auto_3199 - PERSON
      ?auto_3200 - PERSON
      ?auto_3201 - PERSON
      ?auto_3197 - CITY
    )
    :vars
    (
      ?auto_3203 - FLEVEL
      ?auto_3204 - FLEVEL
      ?auto_3202 - CITY
      ?auto_3206 - CITY
      ?auto_3205 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3203 ?auto_3204 ) ( PERSON-AT ?auto_3201 ?auto_3202 ) ( not ( = ?auto_3197 ?auto_3202 ) ) ( not ( = ?auto_3203 ?auto_3204 ) ) ( PERSON-AT ?auto_3200 ?auto_3202 ) ( PERSON-AT ?auto_3199 ?auto_3206 ) ( not ( = ?auto_3197 ?auto_3206 ) ) ( PERSON-AT ?auto_3198 ?auto_3206 ) ( AIRCRAFT-AT ?auto_3205 ?auto_3197 ) ( FUEL-LEVEL ?auto_3205 ?auto_3203 ) ( not ( = ?auto_3198 ?auto_3199 ) ) ( not ( = ?auto_3198 ?auto_3200 ) ) ( not ( = ?auto_3199 ?auto_3200 ) ) ( not ( = ?auto_3202 ?auto_3206 ) ) ( not ( = ?auto_3198 ?auto_3201 ) ) ( not ( = ?auto_3199 ?auto_3201 ) ) ( not ( = ?auto_3200 ?auto_3201 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_3198 ?auto_3200 ?auto_3199 ?auto_3197 )
      ( FLY-1PPL ?auto_3201 ?auto_3197 )
      ( FLY-4PPL-VERIFY ?auto_3198 ?auto_3199 ?auto_3200 ?auto_3201 ?auto_3197 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3230 - PERSON
      ?auto_3231 - PERSON
      ?auto_3232 - PERSON
      ?auto_3233 - PERSON
      ?auto_3229 - CITY
    )
    :vars
    (
      ?auto_3234 - FLEVEL
      ?auto_3238 - FLEVEL
      ?auto_3235 - CITY
      ?auto_3237 - CITY
      ?auto_3236 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3234 ?auto_3238 ) ( PERSON-AT ?auto_3232 ?auto_3235 ) ( not ( = ?auto_3229 ?auto_3235 ) ) ( not ( = ?auto_3234 ?auto_3238 ) ) ( PERSON-AT ?auto_3233 ?auto_3235 ) ( PERSON-AT ?auto_3231 ?auto_3237 ) ( not ( = ?auto_3229 ?auto_3237 ) ) ( PERSON-AT ?auto_3230 ?auto_3237 ) ( AIRCRAFT-AT ?auto_3236 ?auto_3229 ) ( FUEL-LEVEL ?auto_3236 ?auto_3234 ) ( not ( = ?auto_3230 ?auto_3231 ) ) ( not ( = ?auto_3230 ?auto_3233 ) ) ( not ( = ?auto_3231 ?auto_3233 ) ) ( not ( = ?auto_3235 ?auto_3237 ) ) ( not ( = ?auto_3230 ?auto_3232 ) ) ( not ( = ?auto_3231 ?auto_3232 ) ) ( not ( = ?auto_3233 ?auto_3232 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3230 ?auto_3231 ?auto_3233 ?auto_3232 ?auto_3229 )
      ( FLY-4PPL-VERIFY ?auto_3230 ?auto_3231 ?auto_3232 ?auto_3233 ?auto_3229 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3262 - PERSON
      ?auto_3263 - PERSON
      ?auto_3264 - PERSON
      ?auto_3265 - PERSON
      ?auto_3261 - CITY
    )
    :vars
    (
      ?auto_3269 - FLEVEL
      ?auto_3267 - FLEVEL
      ?auto_3270 - CITY
      ?auto_3268 - CITY
      ?auto_3266 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3269 ?auto_3267 ) ( PERSON-AT ?auto_3265 ?auto_3270 ) ( not ( = ?auto_3261 ?auto_3270 ) ) ( not ( = ?auto_3269 ?auto_3267 ) ) ( PERSON-AT ?auto_3263 ?auto_3270 ) ( PERSON-AT ?auto_3264 ?auto_3268 ) ( not ( = ?auto_3261 ?auto_3268 ) ) ( PERSON-AT ?auto_3262 ?auto_3268 ) ( AIRCRAFT-AT ?auto_3266 ?auto_3261 ) ( FUEL-LEVEL ?auto_3266 ?auto_3269 ) ( not ( = ?auto_3262 ?auto_3264 ) ) ( not ( = ?auto_3262 ?auto_3263 ) ) ( not ( = ?auto_3264 ?auto_3263 ) ) ( not ( = ?auto_3270 ?auto_3268 ) ) ( not ( = ?auto_3262 ?auto_3265 ) ) ( not ( = ?auto_3264 ?auto_3265 ) ) ( not ( = ?auto_3263 ?auto_3265 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3262 ?auto_3264 ?auto_3265 ?auto_3263 ?auto_3261 )
      ( FLY-4PPL-VERIFY ?auto_3262 ?auto_3263 ?auto_3264 ?auto_3265 ?auto_3261 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3294 - PERSON
      ?auto_3295 - PERSON
      ?auto_3296 - PERSON
      ?auto_3297 - PERSON
      ?auto_3293 - CITY
    )
    :vars
    (
      ?auto_3301 - FLEVEL
      ?auto_3299 - FLEVEL
      ?auto_3302 - CITY
      ?auto_3300 - CITY
      ?auto_3298 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3301 ?auto_3299 ) ( PERSON-AT ?auto_3296 ?auto_3302 ) ( not ( = ?auto_3293 ?auto_3302 ) ) ( not ( = ?auto_3301 ?auto_3299 ) ) ( PERSON-AT ?auto_3295 ?auto_3302 ) ( PERSON-AT ?auto_3297 ?auto_3300 ) ( not ( = ?auto_3293 ?auto_3300 ) ) ( PERSON-AT ?auto_3294 ?auto_3300 ) ( AIRCRAFT-AT ?auto_3298 ?auto_3293 ) ( FUEL-LEVEL ?auto_3298 ?auto_3301 ) ( not ( = ?auto_3294 ?auto_3297 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( not ( = ?auto_3297 ?auto_3295 ) ) ( not ( = ?auto_3302 ?auto_3300 ) ) ( not ( = ?auto_3294 ?auto_3296 ) ) ( not ( = ?auto_3297 ?auto_3296 ) ) ( not ( = ?auto_3295 ?auto_3296 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3294 ?auto_3297 ?auto_3296 ?auto_3295 ?auto_3293 )
      ( FLY-4PPL-VERIFY ?auto_3294 ?auto_3295 ?auto_3296 ?auto_3297 ?auto_3293 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3394 - PERSON
      ?auto_3395 - PERSON
      ?auto_3396 - PERSON
      ?auto_3397 - PERSON
      ?auto_3393 - CITY
    )
    :vars
    (
      ?auto_3401 - FLEVEL
      ?auto_3399 - FLEVEL
      ?auto_3402 - CITY
      ?auto_3400 - CITY
      ?auto_3398 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3401 ?auto_3399 ) ( PERSON-AT ?auto_3395 ?auto_3402 ) ( not ( = ?auto_3393 ?auto_3402 ) ) ( not ( = ?auto_3401 ?auto_3399 ) ) ( PERSON-AT ?auto_3397 ?auto_3402 ) ( PERSON-AT ?auto_3396 ?auto_3400 ) ( not ( = ?auto_3393 ?auto_3400 ) ) ( PERSON-AT ?auto_3394 ?auto_3400 ) ( AIRCRAFT-AT ?auto_3398 ?auto_3393 ) ( FUEL-LEVEL ?auto_3398 ?auto_3401 ) ( not ( = ?auto_3394 ?auto_3396 ) ) ( not ( = ?auto_3394 ?auto_3397 ) ) ( not ( = ?auto_3396 ?auto_3397 ) ) ( not ( = ?auto_3402 ?auto_3400 ) ) ( not ( = ?auto_3394 ?auto_3395 ) ) ( not ( = ?auto_3396 ?auto_3395 ) ) ( not ( = ?auto_3397 ?auto_3395 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3394 ?auto_3396 ?auto_3395 ?auto_3397 ?auto_3393 )
      ( FLY-4PPL-VERIFY ?auto_3394 ?auto_3395 ?auto_3396 ?auto_3397 ?auto_3393 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3426 - PERSON
      ?auto_3427 - PERSON
      ?auto_3428 - PERSON
      ?auto_3429 - PERSON
      ?auto_3425 - CITY
    )
    :vars
    (
      ?auto_3433 - FLEVEL
      ?auto_3431 - FLEVEL
      ?auto_3434 - CITY
      ?auto_3432 - CITY
      ?auto_3430 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3433 ?auto_3431 ) ( PERSON-AT ?auto_3427 ?auto_3434 ) ( not ( = ?auto_3425 ?auto_3434 ) ) ( not ( = ?auto_3433 ?auto_3431 ) ) ( PERSON-AT ?auto_3428 ?auto_3434 ) ( PERSON-AT ?auto_3429 ?auto_3432 ) ( not ( = ?auto_3425 ?auto_3432 ) ) ( PERSON-AT ?auto_3426 ?auto_3432 ) ( AIRCRAFT-AT ?auto_3430 ?auto_3425 ) ( FUEL-LEVEL ?auto_3430 ?auto_3433 ) ( not ( = ?auto_3426 ?auto_3429 ) ) ( not ( = ?auto_3426 ?auto_3428 ) ) ( not ( = ?auto_3429 ?auto_3428 ) ) ( not ( = ?auto_3434 ?auto_3432 ) ) ( not ( = ?auto_3426 ?auto_3427 ) ) ( not ( = ?auto_3429 ?auto_3427 ) ) ( not ( = ?auto_3428 ?auto_3427 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3426 ?auto_3429 ?auto_3427 ?auto_3428 ?auto_3425 )
      ( FLY-4PPL-VERIFY ?auto_3426 ?auto_3427 ?auto_3428 ?auto_3429 ?auto_3425 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3526 - PERSON
      ?auto_3527 - PERSON
      ?auto_3528 - PERSON
      ?auto_3529 - PERSON
      ?auto_3525 - CITY
    )
    :vars
    (
      ?auto_3533 - FLEVEL
      ?auto_3531 - FLEVEL
      ?auto_3534 - CITY
      ?auto_3532 - CITY
      ?auto_3530 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3533 ?auto_3531 ) ( PERSON-AT ?auto_3529 ?auto_3534 ) ( not ( = ?auto_3525 ?auto_3534 ) ) ( not ( = ?auto_3533 ?auto_3531 ) ) ( PERSON-AT ?auto_3528 ?auto_3534 ) ( PERSON-AT ?auto_3526 ?auto_3532 ) ( not ( = ?auto_3525 ?auto_3532 ) ) ( PERSON-AT ?auto_3527 ?auto_3532 ) ( AIRCRAFT-AT ?auto_3530 ?auto_3525 ) ( FUEL-LEVEL ?auto_3530 ?auto_3533 ) ( not ( = ?auto_3527 ?auto_3526 ) ) ( not ( = ?auto_3527 ?auto_3528 ) ) ( not ( = ?auto_3526 ?auto_3528 ) ) ( not ( = ?auto_3534 ?auto_3532 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3526 ?auto_3529 ) ) ( not ( = ?auto_3528 ?auto_3529 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3527 ?auto_3526 ?auto_3529 ?auto_3528 ?auto_3525 )
      ( FLY-4PPL-VERIFY ?auto_3526 ?auto_3527 ?auto_3528 ?auto_3529 ?auto_3525 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3558 - PERSON
      ?auto_3559 - PERSON
      ?auto_3560 - PERSON
      ?auto_3561 - PERSON
      ?auto_3557 - CITY
    )
    :vars
    (
      ?auto_3565 - FLEVEL
      ?auto_3563 - FLEVEL
      ?auto_3566 - CITY
      ?auto_3564 - CITY
      ?auto_3562 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3565 ?auto_3563 ) ( PERSON-AT ?auto_3560 ?auto_3566 ) ( not ( = ?auto_3557 ?auto_3566 ) ) ( not ( = ?auto_3565 ?auto_3563 ) ) ( PERSON-AT ?auto_3561 ?auto_3566 ) ( PERSON-AT ?auto_3558 ?auto_3564 ) ( not ( = ?auto_3557 ?auto_3564 ) ) ( PERSON-AT ?auto_3559 ?auto_3564 ) ( AIRCRAFT-AT ?auto_3562 ?auto_3557 ) ( FUEL-LEVEL ?auto_3562 ?auto_3565 ) ( not ( = ?auto_3559 ?auto_3558 ) ) ( not ( = ?auto_3559 ?auto_3561 ) ) ( not ( = ?auto_3558 ?auto_3561 ) ) ( not ( = ?auto_3566 ?auto_3564 ) ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3561 ?auto_3560 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3559 ?auto_3558 ?auto_3560 ?auto_3561 ?auto_3557 )
      ( FLY-4PPL-VERIFY ?auto_3558 ?auto_3559 ?auto_3560 ?auto_3561 ?auto_3557 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3659 - PERSON
      ?auto_3660 - PERSON
      ?auto_3661 - PERSON
      ?auto_3662 - PERSON
      ?auto_3658 - CITY
    )
    :vars
    (
      ?auto_3666 - FLEVEL
      ?auto_3664 - FLEVEL
      ?auto_3667 - CITY
      ?auto_3665 - CITY
      ?auto_3663 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3666 ?auto_3664 ) ( PERSON-AT ?auto_3662 ?auto_3667 ) ( not ( = ?auto_3658 ?auto_3667 ) ) ( not ( = ?auto_3666 ?auto_3664 ) ) ( PERSON-AT ?auto_3660 ?auto_3667 ) ( PERSON-AT ?auto_3659 ?auto_3665 ) ( not ( = ?auto_3658 ?auto_3665 ) ) ( PERSON-AT ?auto_3661 ?auto_3665 ) ( AIRCRAFT-AT ?auto_3663 ?auto_3658 ) ( FUEL-LEVEL ?auto_3663 ?auto_3666 ) ( not ( = ?auto_3661 ?auto_3659 ) ) ( not ( = ?auto_3661 ?auto_3660 ) ) ( not ( = ?auto_3659 ?auto_3660 ) ) ( not ( = ?auto_3667 ?auto_3665 ) ) ( not ( = ?auto_3661 ?auto_3662 ) ) ( not ( = ?auto_3659 ?auto_3662 ) ) ( not ( = ?auto_3660 ?auto_3662 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3661 ?auto_3659 ?auto_3662 ?auto_3660 ?auto_3658 )
      ( FLY-4PPL-VERIFY ?auto_3659 ?auto_3660 ?auto_3661 ?auto_3662 ?auto_3658 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3691 - PERSON
      ?auto_3692 - PERSON
      ?auto_3693 - PERSON
      ?auto_3694 - PERSON
      ?auto_3690 - CITY
    )
    :vars
    (
      ?auto_3698 - FLEVEL
      ?auto_3696 - FLEVEL
      ?auto_3699 - CITY
      ?auto_3697 - CITY
      ?auto_3695 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3698 ?auto_3696 ) ( PERSON-AT ?auto_3693 ?auto_3699 ) ( not ( = ?auto_3690 ?auto_3699 ) ) ( not ( = ?auto_3698 ?auto_3696 ) ) ( PERSON-AT ?auto_3692 ?auto_3699 ) ( PERSON-AT ?auto_3691 ?auto_3697 ) ( not ( = ?auto_3690 ?auto_3697 ) ) ( PERSON-AT ?auto_3694 ?auto_3697 ) ( AIRCRAFT-AT ?auto_3695 ?auto_3690 ) ( FUEL-LEVEL ?auto_3695 ?auto_3698 ) ( not ( = ?auto_3694 ?auto_3691 ) ) ( not ( = ?auto_3694 ?auto_3692 ) ) ( not ( = ?auto_3691 ?auto_3692 ) ) ( not ( = ?auto_3699 ?auto_3697 ) ) ( not ( = ?auto_3694 ?auto_3693 ) ) ( not ( = ?auto_3691 ?auto_3693 ) ) ( not ( = ?auto_3692 ?auto_3693 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3694 ?auto_3691 ?auto_3693 ?auto_3692 ?auto_3690 )
      ( FLY-4PPL-VERIFY ?auto_3691 ?auto_3692 ?auto_3693 ?auto_3694 ?auto_3690 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3756 - PERSON
      ?auto_3757 - PERSON
      ?auto_3758 - PERSON
      ?auto_3759 - PERSON
      ?auto_3755 - CITY
    )
    :vars
    (
      ?auto_3763 - FLEVEL
      ?auto_3761 - FLEVEL
      ?auto_3764 - CITY
      ?auto_3762 - CITY
      ?auto_3760 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3763 ?auto_3761 ) ( PERSON-AT ?auto_3757 ?auto_3764 ) ( not ( = ?auto_3755 ?auto_3764 ) ) ( not ( = ?auto_3763 ?auto_3761 ) ) ( PERSON-AT ?auto_3759 ?auto_3764 ) ( PERSON-AT ?auto_3756 ?auto_3762 ) ( not ( = ?auto_3755 ?auto_3762 ) ) ( PERSON-AT ?auto_3758 ?auto_3762 ) ( AIRCRAFT-AT ?auto_3760 ?auto_3755 ) ( FUEL-LEVEL ?auto_3760 ?auto_3763 ) ( not ( = ?auto_3758 ?auto_3756 ) ) ( not ( = ?auto_3758 ?auto_3759 ) ) ( not ( = ?auto_3756 ?auto_3759 ) ) ( not ( = ?auto_3764 ?auto_3762 ) ) ( not ( = ?auto_3758 ?auto_3757 ) ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( not ( = ?auto_3759 ?auto_3757 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3758 ?auto_3756 ?auto_3757 ?auto_3759 ?auto_3755 )
      ( FLY-4PPL-VERIFY ?auto_3756 ?auto_3757 ?auto_3758 ?auto_3759 ?auto_3755 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3823 - PERSON
      ?auto_3824 - PERSON
      ?auto_3825 - PERSON
      ?auto_3826 - PERSON
      ?auto_3822 - CITY
    )
    :vars
    (
      ?auto_3830 - FLEVEL
      ?auto_3828 - FLEVEL
      ?auto_3831 - CITY
      ?auto_3829 - CITY
      ?auto_3827 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3830 ?auto_3828 ) ( PERSON-AT ?auto_3824 ?auto_3831 ) ( not ( = ?auto_3822 ?auto_3831 ) ) ( not ( = ?auto_3830 ?auto_3828 ) ) ( PERSON-AT ?auto_3825 ?auto_3831 ) ( PERSON-AT ?auto_3823 ?auto_3829 ) ( not ( = ?auto_3822 ?auto_3829 ) ) ( PERSON-AT ?auto_3826 ?auto_3829 ) ( AIRCRAFT-AT ?auto_3827 ?auto_3822 ) ( FUEL-LEVEL ?auto_3827 ?auto_3830 ) ( not ( = ?auto_3826 ?auto_3823 ) ) ( not ( = ?auto_3826 ?auto_3825 ) ) ( not ( = ?auto_3823 ?auto_3825 ) ) ( not ( = ?auto_3831 ?auto_3829 ) ) ( not ( = ?auto_3826 ?auto_3824 ) ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( not ( = ?auto_3825 ?auto_3824 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3826 ?auto_3823 ?auto_3824 ?auto_3825 ?auto_3822 )
      ( FLY-4PPL-VERIFY ?auto_3823 ?auto_3824 ?auto_3825 ?auto_3826 ?auto_3822 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3923 - PERSON
      ?auto_3924 - PERSON
      ?auto_3925 - PERSON
      ?auto_3926 - PERSON
      ?auto_3922 - CITY
    )
    :vars
    (
      ?auto_3930 - FLEVEL
      ?auto_3928 - FLEVEL
      ?auto_3931 - CITY
      ?auto_3929 - CITY
      ?auto_3927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3930 ?auto_3928 ) ( PERSON-AT ?auto_3926 ?auto_3931 ) ( not ( = ?auto_3922 ?auto_3931 ) ) ( not ( = ?auto_3930 ?auto_3928 ) ) ( PERSON-AT ?auto_3923 ?auto_3931 ) ( PERSON-AT ?auto_3925 ?auto_3929 ) ( not ( = ?auto_3922 ?auto_3929 ) ) ( PERSON-AT ?auto_3924 ?auto_3929 ) ( AIRCRAFT-AT ?auto_3927 ?auto_3922 ) ( FUEL-LEVEL ?auto_3927 ?auto_3930 ) ( not ( = ?auto_3924 ?auto_3925 ) ) ( not ( = ?auto_3924 ?auto_3923 ) ) ( not ( = ?auto_3925 ?auto_3923 ) ) ( not ( = ?auto_3931 ?auto_3929 ) ) ( not ( = ?auto_3924 ?auto_3926 ) ) ( not ( = ?auto_3925 ?auto_3926 ) ) ( not ( = ?auto_3923 ?auto_3926 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3924 ?auto_3925 ?auto_3926 ?auto_3923 ?auto_3922 )
      ( FLY-4PPL-VERIFY ?auto_3923 ?auto_3924 ?auto_3925 ?auto_3926 ?auto_3922 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3955 - PERSON
      ?auto_3956 - PERSON
      ?auto_3957 - PERSON
      ?auto_3958 - PERSON
      ?auto_3954 - CITY
    )
    :vars
    (
      ?auto_3962 - FLEVEL
      ?auto_3960 - FLEVEL
      ?auto_3963 - CITY
      ?auto_3961 - CITY
      ?auto_3959 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3962 ?auto_3960 ) ( PERSON-AT ?auto_3957 ?auto_3963 ) ( not ( = ?auto_3954 ?auto_3963 ) ) ( not ( = ?auto_3962 ?auto_3960 ) ) ( PERSON-AT ?auto_3955 ?auto_3963 ) ( PERSON-AT ?auto_3958 ?auto_3961 ) ( not ( = ?auto_3954 ?auto_3961 ) ) ( PERSON-AT ?auto_3956 ?auto_3961 ) ( AIRCRAFT-AT ?auto_3959 ?auto_3954 ) ( FUEL-LEVEL ?auto_3959 ?auto_3962 ) ( not ( = ?auto_3956 ?auto_3958 ) ) ( not ( = ?auto_3956 ?auto_3955 ) ) ( not ( = ?auto_3958 ?auto_3955 ) ) ( not ( = ?auto_3963 ?auto_3961 ) ) ( not ( = ?auto_3956 ?auto_3957 ) ) ( not ( = ?auto_3958 ?auto_3957 ) ) ( not ( = ?auto_3955 ?auto_3957 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3956 ?auto_3958 ?auto_3957 ?auto_3955 ?auto_3954 )
      ( FLY-4PPL-VERIFY ?auto_3955 ?auto_3956 ?auto_3957 ?auto_3958 ?auto_3954 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3987 - PERSON
      ?auto_3988 - PERSON
      ?auto_3989 - PERSON
      ?auto_3990 - PERSON
      ?auto_3986 - CITY
    )
    :vars
    (
      ?auto_3994 - FLEVEL
      ?auto_3992 - FLEVEL
      ?auto_3995 - CITY
      ?auto_3993 - CITY
      ?auto_3991 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3994 ?auto_3992 ) ( PERSON-AT ?auto_3990 ?auto_3995 ) ( not ( = ?auto_3986 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3992 ) ) ( PERSON-AT ?auto_3987 ?auto_3995 ) ( PERSON-AT ?auto_3988 ?auto_3993 ) ( not ( = ?auto_3986 ?auto_3993 ) ) ( PERSON-AT ?auto_3989 ?auto_3993 ) ( AIRCRAFT-AT ?auto_3991 ?auto_3986 ) ( FUEL-LEVEL ?auto_3991 ?auto_3994 ) ( not ( = ?auto_3989 ?auto_3988 ) ) ( not ( = ?auto_3989 ?auto_3987 ) ) ( not ( = ?auto_3988 ?auto_3987 ) ) ( not ( = ?auto_3995 ?auto_3993 ) ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( not ( = ?auto_3988 ?auto_3990 ) ) ( not ( = ?auto_3987 ?auto_3990 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3989 ?auto_3988 ?auto_3990 ?auto_3987 ?auto_3986 )
      ( FLY-4PPL-VERIFY ?auto_3987 ?auto_3988 ?auto_3989 ?auto_3990 ?auto_3986 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4019 - PERSON
      ?auto_4020 - PERSON
      ?auto_4021 - PERSON
      ?auto_4022 - PERSON
      ?auto_4018 - CITY
    )
    :vars
    (
      ?auto_4026 - FLEVEL
      ?auto_4024 - FLEVEL
      ?auto_4027 - CITY
      ?auto_4025 - CITY
      ?auto_4023 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4026 ?auto_4024 ) ( PERSON-AT ?auto_4021 ?auto_4027 ) ( not ( = ?auto_4018 ?auto_4027 ) ) ( not ( = ?auto_4026 ?auto_4024 ) ) ( PERSON-AT ?auto_4019 ?auto_4027 ) ( PERSON-AT ?auto_4020 ?auto_4025 ) ( not ( = ?auto_4018 ?auto_4025 ) ) ( PERSON-AT ?auto_4022 ?auto_4025 ) ( AIRCRAFT-AT ?auto_4023 ?auto_4018 ) ( FUEL-LEVEL ?auto_4023 ?auto_4026 ) ( not ( = ?auto_4022 ?auto_4020 ) ) ( not ( = ?auto_4022 ?auto_4019 ) ) ( not ( = ?auto_4020 ?auto_4019 ) ) ( not ( = ?auto_4027 ?auto_4025 ) ) ( not ( = ?auto_4022 ?auto_4021 ) ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4019 ?auto_4021 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4022 ?auto_4020 ?auto_4021 ?auto_4019 ?auto_4018 )
      ( FLY-4PPL-VERIFY ?auto_4019 ?auto_4020 ?auto_4021 ?auto_4022 ?auto_4018 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4153 - PERSON
      ?auto_4154 - PERSON
      ?auto_4155 - PERSON
      ?auto_4156 - PERSON
      ?auto_4152 - CITY
    )
    :vars
    (
      ?auto_4160 - FLEVEL
      ?auto_4158 - FLEVEL
      ?auto_4161 - CITY
      ?auto_4159 - CITY
      ?auto_4157 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4160 ?auto_4158 ) ( PERSON-AT ?auto_4154 ?auto_4161 ) ( not ( = ?auto_4152 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4158 ) ) ( PERSON-AT ?auto_4153 ?auto_4161 ) ( PERSON-AT ?auto_4156 ?auto_4159 ) ( not ( = ?auto_4152 ?auto_4159 ) ) ( PERSON-AT ?auto_4155 ?auto_4159 ) ( AIRCRAFT-AT ?auto_4157 ?auto_4152 ) ( FUEL-LEVEL ?auto_4157 ?auto_4160 ) ( not ( = ?auto_4155 ?auto_4156 ) ) ( not ( = ?auto_4155 ?auto_4153 ) ) ( not ( = ?auto_4156 ?auto_4153 ) ) ( not ( = ?auto_4161 ?auto_4159 ) ) ( not ( = ?auto_4155 ?auto_4154 ) ) ( not ( = ?auto_4156 ?auto_4154 ) ) ( not ( = ?auto_4153 ?auto_4154 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4155 ?auto_4156 ?auto_4154 ?auto_4153 ?auto_4152 )
      ( FLY-4PPL-VERIFY ?auto_4153 ?auto_4154 ?auto_4155 ?auto_4156 ?auto_4152 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4185 - PERSON
      ?auto_4186 - PERSON
      ?auto_4187 - PERSON
      ?auto_4188 - PERSON
      ?auto_4184 - CITY
    )
    :vars
    (
      ?auto_4192 - FLEVEL
      ?auto_4190 - FLEVEL
      ?auto_4193 - CITY
      ?auto_4191 - CITY
      ?auto_4189 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4192 ?auto_4190 ) ( PERSON-AT ?auto_4186 ?auto_4193 ) ( not ( = ?auto_4184 ?auto_4193 ) ) ( not ( = ?auto_4192 ?auto_4190 ) ) ( PERSON-AT ?auto_4185 ?auto_4193 ) ( PERSON-AT ?auto_4187 ?auto_4191 ) ( not ( = ?auto_4184 ?auto_4191 ) ) ( PERSON-AT ?auto_4188 ?auto_4191 ) ( AIRCRAFT-AT ?auto_4189 ?auto_4184 ) ( FUEL-LEVEL ?auto_4189 ?auto_4192 ) ( not ( = ?auto_4188 ?auto_4187 ) ) ( not ( = ?auto_4188 ?auto_4185 ) ) ( not ( = ?auto_4187 ?auto_4185 ) ) ( not ( = ?auto_4193 ?auto_4191 ) ) ( not ( = ?auto_4188 ?auto_4186 ) ) ( not ( = ?auto_4187 ?auto_4186 ) ) ( not ( = ?auto_4185 ?auto_4186 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4188 ?auto_4187 ?auto_4186 ?auto_4185 ?auto_4184 )
      ( FLY-4PPL-VERIFY ?auto_4185 ?auto_4186 ?auto_4187 ?auto_4188 ?auto_4184 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4388 - PERSON
      ?auto_4389 - PERSON
      ?auto_4390 - PERSON
      ?auto_4391 - PERSON
      ?auto_4387 - CITY
    )
    :vars
    (
      ?auto_4395 - FLEVEL
      ?auto_4393 - FLEVEL
      ?auto_4396 - CITY
      ?auto_4394 - CITY
      ?auto_4392 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4395 ?auto_4393 ) ( PERSON-AT ?auto_4388 ?auto_4396 ) ( not ( = ?auto_4387 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4393 ) ) ( PERSON-AT ?auto_4391 ?auto_4396 ) ( PERSON-AT ?auto_4390 ?auto_4394 ) ( not ( = ?auto_4387 ?auto_4394 ) ) ( PERSON-AT ?auto_4389 ?auto_4394 ) ( AIRCRAFT-AT ?auto_4392 ?auto_4387 ) ( FUEL-LEVEL ?auto_4392 ?auto_4395 ) ( not ( = ?auto_4389 ?auto_4390 ) ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4396 ?auto_4394 ) ) ( not ( = ?auto_4389 ?auto_4388 ) ) ( not ( = ?auto_4390 ?auto_4388 ) ) ( not ( = ?auto_4391 ?auto_4388 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4389 ?auto_4390 ?auto_4388 ?auto_4391 ?auto_4387 )
      ( FLY-4PPL-VERIFY ?auto_4388 ?auto_4389 ?auto_4390 ?auto_4391 ?auto_4387 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4420 - PERSON
      ?auto_4421 - PERSON
      ?auto_4422 - PERSON
      ?auto_4423 - PERSON
      ?auto_4419 - CITY
    )
    :vars
    (
      ?auto_4427 - FLEVEL
      ?auto_4425 - FLEVEL
      ?auto_4428 - CITY
      ?auto_4426 - CITY
      ?auto_4424 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4427 ?auto_4425 ) ( PERSON-AT ?auto_4420 ?auto_4428 ) ( not ( = ?auto_4419 ?auto_4428 ) ) ( not ( = ?auto_4427 ?auto_4425 ) ) ( PERSON-AT ?auto_4422 ?auto_4428 ) ( PERSON-AT ?auto_4423 ?auto_4426 ) ( not ( = ?auto_4419 ?auto_4426 ) ) ( PERSON-AT ?auto_4421 ?auto_4426 ) ( AIRCRAFT-AT ?auto_4424 ?auto_4419 ) ( FUEL-LEVEL ?auto_4424 ?auto_4427 ) ( not ( = ?auto_4421 ?auto_4423 ) ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4423 ?auto_4422 ) ) ( not ( = ?auto_4428 ?auto_4426 ) ) ( not ( = ?auto_4421 ?auto_4420 ) ) ( not ( = ?auto_4423 ?auto_4420 ) ) ( not ( = ?auto_4422 ?auto_4420 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4421 ?auto_4423 ?auto_4420 ?auto_4422 ?auto_4419 )
      ( FLY-4PPL-VERIFY ?auto_4420 ?auto_4421 ?auto_4422 ?auto_4423 ?auto_4419 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4520 - PERSON
      ?auto_4521 - PERSON
      ?auto_4522 - PERSON
      ?auto_4523 - PERSON
      ?auto_4519 - CITY
    )
    :vars
    (
      ?auto_4527 - FLEVEL
      ?auto_4525 - FLEVEL
      ?auto_4528 - CITY
      ?auto_4526 - CITY
      ?auto_4524 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4527 ?auto_4525 ) ( PERSON-AT ?auto_4520 ?auto_4528 ) ( not ( = ?auto_4519 ?auto_4528 ) ) ( not ( = ?auto_4527 ?auto_4525 ) ) ( PERSON-AT ?auto_4523 ?auto_4528 ) ( PERSON-AT ?auto_4521 ?auto_4526 ) ( not ( = ?auto_4519 ?auto_4526 ) ) ( PERSON-AT ?auto_4522 ?auto_4526 ) ( AIRCRAFT-AT ?auto_4524 ?auto_4519 ) ( FUEL-LEVEL ?auto_4524 ?auto_4527 ) ( not ( = ?auto_4522 ?auto_4521 ) ) ( not ( = ?auto_4522 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( not ( = ?auto_4528 ?auto_4526 ) ) ( not ( = ?auto_4522 ?auto_4520 ) ) ( not ( = ?auto_4521 ?auto_4520 ) ) ( not ( = ?auto_4523 ?auto_4520 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4522 ?auto_4521 ?auto_4520 ?auto_4523 ?auto_4519 )
      ( FLY-4PPL-VERIFY ?auto_4520 ?auto_4521 ?auto_4522 ?auto_4523 ?auto_4519 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4587 - PERSON
      ?auto_4588 - PERSON
      ?auto_4589 - PERSON
      ?auto_4590 - PERSON
      ?auto_4586 - CITY
    )
    :vars
    (
      ?auto_4594 - FLEVEL
      ?auto_4592 - FLEVEL
      ?auto_4595 - CITY
      ?auto_4593 - CITY
      ?auto_4591 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4594 ?auto_4592 ) ( PERSON-AT ?auto_4587 ?auto_4595 ) ( not ( = ?auto_4586 ?auto_4595 ) ) ( not ( = ?auto_4594 ?auto_4592 ) ) ( PERSON-AT ?auto_4589 ?auto_4595 ) ( PERSON-AT ?auto_4588 ?auto_4593 ) ( not ( = ?auto_4586 ?auto_4593 ) ) ( PERSON-AT ?auto_4590 ?auto_4593 ) ( AIRCRAFT-AT ?auto_4591 ?auto_4586 ) ( FUEL-LEVEL ?auto_4591 ?auto_4594 ) ( not ( = ?auto_4590 ?auto_4588 ) ) ( not ( = ?auto_4590 ?auto_4589 ) ) ( not ( = ?auto_4588 ?auto_4589 ) ) ( not ( = ?auto_4595 ?auto_4593 ) ) ( not ( = ?auto_4590 ?auto_4587 ) ) ( not ( = ?auto_4588 ?auto_4587 ) ) ( not ( = ?auto_4589 ?auto_4587 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4590 ?auto_4588 ?auto_4587 ?auto_4589 ?auto_4586 )
      ( FLY-4PPL-VERIFY ?auto_4587 ?auto_4588 ?auto_4589 ?auto_4590 ?auto_4586 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4687 - PERSON
      ?auto_4688 - PERSON
      ?auto_4689 - PERSON
      ?auto_4690 - PERSON
      ?auto_4686 - CITY
    )
    :vars
    (
      ?auto_4694 - FLEVEL
      ?auto_4692 - FLEVEL
      ?auto_4695 - CITY
      ?auto_4693 - CITY
      ?auto_4691 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4694 ?auto_4692 ) ( PERSON-AT ?auto_4687 ?auto_4695 ) ( not ( = ?auto_4686 ?auto_4695 ) ) ( not ( = ?auto_4694 ?auto_4692 ) ) ( PERSON-AT ?auto_4688 ?auto_4695 ) ( PERSON-AT ?auto_4690 ?auto_4693 ) ( not ( = ?auto_4686 ?auto_4693 ) ) ( PERSON-AT ?auto_4689 ?auto_4693 ) ( AIRCRAFT-AT ?auto_4691 ?auto_4686 ) ( FUEL-LEVEL ?auto_4691 ?auto_4694 ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4688 ) ) ( not ( = ?auto_4690 ?auto_4688 ) ) ( not ( = ?auto_4695 ?auto_4693 ) ) ( not ( = ?auto_4689 ?auto_4687 ) ) ( not ( = ?auto_4690 ?auto_4687 ) ) ( not ( = ?auto_4688 ?auto_4687 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4689 ?auto_4690 ?auto_4687 ?auto_4688 ?auto_4686 )
      ( FLY-4PPL-VERIFY ?auto_4687 ?auto_4688 ?auto_4689 ?auto_4690 ?auto_4686 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_4719 - PERSON
      ?auto_4720 - PERSON
      ?auto_4721 - PERSON
      ?auto_4722 - PERSON
      ?auto_4718 - CITY
    )
    :vars
    (
      ?auto_4726 - FLEVEL
      ?auto_4724 - FLEVEL
      ?auto_4727 - CITY
      ?auto_4725 - CITY
      ?auto_4723 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4726 ?auto_4724 ) ( PERSON-AT ?auto_4719 ?auto_4727 ) ( not ( = ?auto_4718 ?auto_4727 ) ) ( not ( = ?auto_4726 ?auto_4724 ) ) ( PERSON-AT ?auto_4720 ?auto_4727 ) ( PERSON-AT ?auto_4721 ?auto_4725 ) ( not ( = ?auto_4718 ?auto_4725 ) ) ( PERSON-AT ?auto_4722 ?auto_4725 ) ( AIRCRAFT-AT ?auto_4723 ?auto_4718 ) ( FUEL-LEVEL ?auto_4723 ?auto_4726 ) ( not ( = ?auto_4722 ?auto_4721 ) ) ( not ( = ?auto_4722 ?auto_4720 ) ) ( not ( = ?auto_4721 ?auto_4720 ) ) ( not ( = ?auto_4727 ?auto_4725 ) ) ( not ( = ?auto_4722 ?auto_4719 ) ) ( not ( = ?auto_4721 ?auto_4719 ) ) ( not ( = ?auto_4720 ?auto_4719 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_4722 ?auto_4721 ?auto_4719 ?auto_4720 ?auto_4718 )
      ( FLY-4PPL-VERIFY ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4722 ?auto_4718 ) )
  )

)

