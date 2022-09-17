( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1853 - DIRECTION
      ?auto_1854 - MODE
    )
    :vars
    (
      ?auto_1855 - INSTRUMENT
      ?auto_1856 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1855 ) ( ON_BOARD ?auto_1855 ?auto_1856 ) ( SUPPORTS ?auto_1855 ?auto_1854 ) ( POWER_ON ?auto_1855 ) ( POINTING ?auto_1856 ?auto_1853 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1856 ?auto_1853 ?auto_1855 ?auto_1854 )
      ( GET-1IMAGE-VERIFY ?auto_1853 ?auto_1854 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1863 - DIRECTION
      ?auto_1864 - MODE
    )
    :vars
    (
      ?auto_1866 - INSTRUMENT
      ?auto_1865 - SATELLITE
      ?auto_1867 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1866 ) ( ON_BOARD ?auto_1866 ?auto_1865 ) ( SUPPORTS ?auto_1866 ?auto_1864 ) ( POWER_ON ?auto_1866 ) ( POINTING ?auto_1865 ?auto_1867 ) ( not ( = ?auto_1863 ?auto_1867 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1865 ?auto_1863 ?auto_1867 )
      ( GET-1IMAGE ?auto_1863 ?auto_1864 )
      ( GET-1IMAGE-VERIFY ?auto_1863 ?auto_1864 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1875 - DIRECTION
      ?auto_1876 - MODE
    )
    :vars
    (
      ?auto_1877 - INSTRUMENT
      ?auto_1879 - SATELLITE
      ?auto_1878 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1877 ?auto_1879 ) ( SUPPORTS ?auto_1877 ?auto_1876 ) ( POWER_ON ?auto_1877 ) ( POINTING ?auto_1879 ?auto_1878 ) ( not ( = ?auto_1875 ?auto_1878 ) ) ( CALIBRATION_TARGET ?auto_1877 ?auto_1878 ) ( NOT_CALIBRATED ?auto_1877 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1879 ?auto_1877 ?auto_1878 )
      ( GET-1IMAGE ?auto_1875 ?auto_1876 )
      ( GET-1IMAGE-VERIFY ?auto_1875 ?auto_1876 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1887 - DIRECTION
      ?auto_1888 - MODE
    )
    :vars
    (
      ?auto_1890 - INSTRUMENT
      ?auto_1889 - SATELLITE
      ?auto_1891 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1890 ?auto_1889 ) ( SUPPORTS ?auto_1890 ?auto_1888 ) ( POINTING ?auto_1889 ?auto_1891 ) ( not ( = ?auto_1887 ?auto_1891 ) ) ( CALIBRATION_TARGET ?auto_1890 ?auto_1891 ) ( POWER_AVAIL ?auto_1889 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1890 ?auto_1889 )
      ( GET-1IMAGE ?auto_1887 ?auto_1888 )
      ( GET-1IMAGE-VERIFY ?auto_1887 ?auto_1888 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1899 - DIRECTION
      ?auto_1900 - MODE
    )
    :vars
    (
      ?auto_1901 - INSTRUMENT
      ?auto_1903 - SATELLITE
      ?auto_1902 - DIRECTION
      ?auto_1904 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1901 ?auto_1903 ) ( SUPPORTS ?auto_1901 ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1902 ) ) ( CALIBRATION_TARGET ?auto_1901 ?auto_1902 ) ( POWER_AVAIL ?auto_1903 ) ( POINTING ?auto_1903 ?auto_1904 ) ( not ( = ?auto_1902 ?auto_1904 ) ) ( not ( = ?auto_1899 ?auto_1904 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1903 ?auto_1902 ?auto_1904 )
      ( GET-1IMAGE ?auto_1899 ?auto_1900 )
      ( GET-1IMAGE-VERIFY ?auto_1899 ?auto_1900 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1927 - DIRECTION
      ?auto_1928 - MODE
    )
    :vars
    (
      ?auto_1929 - INSTRUMENT
      ?auto_1930 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1929 ) ( ON_BOARD ?auto_1929 ?auto_1930 ) ( SUPPORTS ?auto_1929 ?auto_1928 ) ( POWER_ON ?auto_1929 ) ( POINTING ?auto_1930 ?auto_1927 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1930 ?auto_1927 ?auto_1929 ?auto_1928 )
      ( GET-1IMAGE-VERIFY ?auto_1927 ?auto_1928 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1931 - DIRECTION
      ?auto_1932 - MODE
      ?auto_1934 - DIRECTION
      ?auto_1933 - MODE
    )
    :vars
    (
      ?auto_1935 - INSTRUMENT
      ?auto_1936 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1935 ) ( ON_BOARD ?auto_1935 ?auto_1936 ) ( SUPPORTS ?auto_1935 ?auto_1933 ) ( POWER_ON ?auto_1935 ) ( POINTING ?auto_1936 ?auto_1934 ) ( HAVE_IMAGE ?auto_1931 ?auto_1932 ) ( not ( = ?auto_1931 ?auto_1934 ) ) ( not ( = ?auto_1932 ?auto_1933 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1934 ?auto_1933 )
      ( GET-2IMAGE-VERIFY ?auto_1931 ?auto_1932 ?auto_1934 ?auto_1933 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1937 - DIRECTION
      ?auto_1938 - MODE
      ?auto_1940 - DIRECTION
      ?auto_1939 - MODE
    )
    :vars
    (
      ?auto_1941 - INSTRUMENT
      ?auto_1942 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1941 ) ( ON_BOARD ?auto_1941 ?auto_1942 ) ( SUPPORTS ?auto_1941 ?auto_1938 ) ( POWER_ON ?auto_1941 ) ( POINTING ?auto_1942 ?auto_1937 ) ( HAVE_IMAGE ?auto_1940 ?auto_1939 ) ( not ( = ?auto_1937 ?auto_1940 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1937 ?auto_1938 )
      ( GET-2IMAGE-VERIFY ?auto_1937 ?auto_1938 ?auto_1940 ?auto_1939 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1949 - DIRECTION
      ?auto_1950 - MODE
    )
    :vars
    (
      ?auto_1951 - INSTRUMENT
      ?auto_1952 - SATELLITE
      ?auto_1953 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1951 ) ( ON_BOARD ?auto_1951 ?auto_1952 ) ( SUPPORTS ?auto_1951 ?auto_1950 ) ( POWER_ON ?auto_1951 ) ( POINTING ?auto_1952 ?auto_1953 ) ( not ( = ?auto_1949 ?auto_1953 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1952 ?auto_1949 ?auto_1953 )
      ( GET-1IMAGE ?auto_1949 ?auto_1950 )
      ( GET-1IMAGE-VERIFY ?auto_1949 ?auto_1950 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1954 - DIRECTION
      ?auto_1955 - MODE
      ?auto_1957 - DIRECTION
      ?auto_1956 - MODE
    )
    :vars
    (
      ?auto_1960 - INSTRUMENT
      ?auto_1958 - SATELLITE
      ?auto_1959 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1960 ) ( ON_BOARD ?auto_1960 ?auto_1958 ) ( SUPPORTS ?auto_1960 ?auto_1956 ) ( POWER_ON ?auto_1960 ) ( POINTING ?auto_1958 ?auto_1959 ) ( not ( = ?auto_1957 ?auto_1959 ) ) ( HAVE_IMAGE ?auto_1954 ?auto_1955 ) ( not ( = ?auto_1954 ?auto_1957 ) ) ( not ( = ?auto_1954 ?auto_1959 ) ) ( not ( = ?auto_1955 ?auto_1956 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1957 ?auto_1956 )
      ( GET-2IMAGE-VERIFY ?auto_1954 ?auto_1955 ?auto_1957 ?auto_1956 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1961 - DIRECTION
      ?auto_1962 - MODE
      ?auto_1964 - DIRECTION
      ?auto_1963 - MODE
    )
    :vars
    (
      ?auto_1967 - INSTRUMENT
      ?auto_1966 - SATELLITE
      ?auto_1965 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1967 ) ( ON_BOARD ?auto_1967 ?auto_1966 ) ( SUPPORTS ?auto_1967 ?auto_1962 ) ( POWER_ON ?auto_1967 ) ( POINTING ?auto_1966 ?auto_1965 ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( HAVE_IMAGE ?auto_1964 ?auto_1963 ) ( not ( = ?auto_1964 ?auto_1961 ) ) ( not ( = ?auto_1964 ?auto_1965 ) ) ( not ( = ?auto_1963 ?auto_1962 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1964 ?auto_1963 ?auto_1961 ?auto_1962 )
      ( GET-2IMAGE-VERIFY ?auto_1961 ?auto_1962 ?auto_1964 ?auto_1963 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1977 - DIRECTION
      ?auto_1978 - MODE
    )
    :vars
    (
      ?auto_1982 - INSTRUMENT
      ?auto_1981 - SATELLITE
      ?auto_1979 - DIRECTION
      ?auto_1980 - DIRECTION
      ?auto_1983 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1982 ?auto_1981 ) ( SUPPORTS ?auto_1982 ?auto_1978 ) ( POWER_ON ?auto_1982 ) ( POINTING ?auto_1981 ?auto_1979 ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( HAVE_IMAGE ?auto_1980 ?auto_1983 ) ( not ( = ?auto_1980 ?auto_1977 ) ) ( not ( = ?auto_1980 ?auto_1979 ) ) ( not ( = ?auto_1983 ?auto_1978 ) ) ( CALIBRATION_TARGET ?auto_1982 ?auto_1979 ) ( NOT_CALIBRATED ?auto_1982 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1981 ?auto_1982 ?auto_1979 )
      ( GET-2IMAGE ?auto_1980 ?auto_1983 ?auto_1977 ?auto_1978 )
      ( GET-1IMAGE-VERIFY ?auto_1977 ?auto_1978 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1984 - DIRECTION
      ?auto_1985 - MODE
      ?auto_1987 - DIRECTION
      ?auto_1986 - MODE
    )
    :vars
    (
      ?auto_1988 - INSTRUMENT
      ?auto_1990 - SATELLITE
      ?auto_1989 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1988 ?auto_1990 ) ( SUPPORTS ?auto_1988 ?auto_1986 ) ( POWER_ON ?auto_1988 ) ( POINTING ?auto_1990 ?auto_1989 ) ( not ( = ?auto_1987 ?auto_1989 ) ) ( HAVE_IMAGE ?auto_1984 ?auto_1985 ) ( not ( = ?auto_1984 ?auto_1987 ) ) ( not ( = ?auto_1984 ?auto_1989 ) ) ( not ( = ?auto_1985 ?auto_1986 ) ) ( CALIBRATION_TARGET ?auto_1988 ?auto_1989 ) ( NOT_CALIBRATED ?auto_1988 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1987 ?auto_1986 )
      ( GET-2IMAGE-VERIFY ?auto_1984 ?auto_1985 ?auto_1987 ?auto_1986 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1991 - DIRECTION
      ?auto_1992 - MODE
      ?auto_1994 - DIRECTION
      ?auto_1993 - MODE
    )
    :vars
    (
      ?auto_1996 - INSTRUMENT
      ?auto_1997 - SATELLITE
      ?auto_1995 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1996 ?auto_1997 ) ( SUPPORTS ?auto_1996 ?auto_1992 ) ( POWER_ON ?auto_1996 ) ( POINTING ?auto_1997 ?auto_1995 ) ( not ( = ?auto_1991 ?auto_1995 ) ) ( HAVE_IMAGE ?auto_1994 ?auto_1993 ) ( not ( = ?auto_1994 ?auto_1991 ) ) ( not ( = ?auto_1994 ?auto_1995 ) ) ( not ( = ?auto_1993 ?auto_1992 ) ) ( CALIBRATION_TARGET ?auto_1996 ?auto_1995 ) ( NOT_CALIBRATED ?auto_1996 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1994 ?auto_1993 ?auto_1991 ?auto_1992 )
      ( GET-2IMAGE-VERIFY ?auto_1991 ?auto_1992 ?auto_1994 ?auto_1993 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2007 - DIRECTION
      ?auto_2008 - MODE
    )
    :vars
    (
      ?auto_2012 - INSTRUMENT
      ?auto_2013 - SATELLITE
      ?auto_2010 - DIRECTION
      ?auto_2009 - DIRECTION
      ?auto_2011 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2012 ?auto_2013 ) ( SUPPORTS ?auto_2012 ?auto_2008 ) ( POINTING ?auto_2013 ?auto_2010 ) ( not ( = ?auto_2007 ?auto_2010 ) ) ( HAVE_IMAGE ?auto_2009 ?auto_2011 ) ( not ( = ?auto_2009 ?auto_2007 ) ) ( not ( = ?auto_2009 ?auto_2010 ) ) ( not ( = ?auto_2011 ?auto_2008 ) ) ( CALIBRATION_TARGET ?auto_2012 ?auto_2010 ) ( POWER_AVAIL ?auto_2013 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2012 ?auto_2013 )
      ( GET-2IMAGE ?auto_2009 ?auto_2011 ?auto_2007 ?auto_2008 )
      ( GET-1IMAGE-VERIFY ?auto_2007 ?auto_2008 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2014 - DIRECTION
      ?auto_2015 - MODE
      ?auto_2017 - DIRECTION
      ?auto_2016 - MODE
    )
    :vars
    (
      ?auto_2018 - INSTRUMENT
      ?auto_2019 - SATELLITE
      ?auto_2020 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2018 ?auto_2019 ) ( SUPPORTS ?auto_2018 ?auto_2016 ) ( POINTING ?auto_2019 ?auto_2020 ) ( not ( = ?auto_2017 ?auto_2020 ) ) ( HAVE_IMAGE ?auto_2014 ?auto_2015 ) ( not ( = ?auto_2014 ?auto_2017 ) ) ( not ( = ?auto_2014 ?auto_2020 ) ) ( not ( = ?auto_2015 ?auto_2016 ) ) ( CALIBRATION_TARGET ?auto_2018 ?auto_2020 ) ( POWER_AVAIL ?auto_2019 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2017 ?auto_2016 )
      ( GET-2IMAGE-VERIFY ?auto_2014 ?auto_2015 ?auto_2017 ?auto_2016 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2021 - DIRECTION
      ?auto_2022 - MODE
      ?auto_2024 - DIRECTION
      ?auto_2023 - MODE
    )
    :vars
    (
      ?auto_2025 - INSTRUMENT
      ?auto_2027 - SATELLITE
      ?auto_2026 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2025 ?auto_2027 ) ( SUPPORTS ?auto_2025 ?auto_2022 ) ( POINTING ?auto_2027 ?auto_2026 ) ( not ( = ?auto_2021 ?auto_2026 ) ) ( HAVE_IMAGE ?auto_2024 ?auto_2023 ) ( not ( = ?auto_2024 ?auto_2021 ) ) ( not ( = ?auto_2024 ?auto_2026 ) ) ( not ( = ?auto_2023 ?auto_2022 ) ) ( CALIBRATION_TARGET ?auto_2025 ?auto_2026 ) ( POWER_AVAIL ?auto_2027 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2024 ?auto_2023 ?auto_2021 ?auto_2022 )
      ( GET-2IMAGE-VERIFY ?auto_2021 ?auto_2022 ?auto_2024 ?auto_2023 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2037 - DIRECTION
      ?auto_2038 - MODE
    )
    :vars
    (
      ?auto_2039 - INSTRUMENT
      ?auto_2041 - SATELLITE
      ?auto_2040 - DIRECTION
      ?auto_2043 - DIRECTION
      ?auto_2042 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2039 ?auto_2041 ) ( SUPPORTS ?auto_2039 ?auto_2038 ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( HAVE_IMAGE ?auto_2043 ?auto_2042 ) ( not ( = ?auto_2043 ?auto_2037 ) ) ( not ( = ?auto_2043 ?auto_2040 ) ) ( not ( = ?auto_2042 ?auto_2038 ) ) ( CALIBRATION_TARGET ?auto_2039 ?auto_2040 ) ( POWER_AVAIL ?auto_2041 ) ( POINTING ?auto_2041 ?auto_2043 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2041 ?auto_2040 ?auto_2043 )
      ( GET-2IMAGE ?auto_2043 ?auto_2042 ?auto_2037 ?auto_2038 )
      ( GET-1IMAGE-VERIFY ?auto_2037 ?auto_2038 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2044 - DIRECTION
      ?auto_2045 - MODE
      ?auto_2047 - DIRECTION
      ?auto_2046 - MODE
    )
    :vars
    (
      ?auto_2049 - INSTRUMENT
      ?auto_2050 - SATELLITE
      ?auto_2048 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2049 ?auto_2050 ) ( SUPPORTS ?auto_2049 ?auto_2046 ) ( not ( = ?auto_2047 ?auto_2048 ) ) ( HAVE_IMAGE ?auto_2044 ?auto_2045 ) ( not ( = ?auto_2044 ?auto_2047 ) ) ( not ( = ?auto_2044 ?auto_2048 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( CALIBRATION_TARGET ?auto_2049 ?auto_2048 ) ( POWER_AVAIL ?auto_2050 ) ( POINTING ?auto_2050 ?auto_2044 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2047 ?auto_2046 )
      ( GET-2IMAGE-VERIFY ?auto_2044 ?auto_2045 ?auto_2047 ?auto_2046 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2051 - DIRECTION
      ?auto_2052 - MODE
      ?auto_2054 - DIRECTION
      ?auto_2053 - MODE
    )
    :vars
    (
      ?auto_2056 - INSTRUMENT
      ?auto_2057 - SATELLITE
      ?auto_2055 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2056 ?auto_2057 ) ( SUPPORTS ?auto_2056 ?auto_2052 ) ( not ( = ?auto_2051 ?auto_2055 ) ) ( HAVE_IMAGE ?auto_2054 ?auto_2053 ) ( not ( = ?auto_2054 ?auto_2051 ) ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( not ( = ?auto_2053 ?auto_2052 ) ) ( CALIBRATION_TARGET ?auto_2056 ?auto_2055 ) ( POWER_AVAIL ?auto_2057 ) ( POINTING ?auto_2057 ?auto_2054 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2054 ?auto_2053 ?auto_2051 ?auto_2052 )
      ( GET-2IMAGE-VERIFY ?auto_2051 ?auto_2052 ?auto_2054 ?auto_2053 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2067 - DIRECTION
      ?auto_2068 - MODE
    )
    :vars
    (
      ?auto_2070 - INSTRUMENT
      ?auto_2073 - SATELLITE
      ?auto_2069 - DIRECTION
      ?auto_2072 - DIRECTION
      ?auto_2071 - MODE
      ?auto_2074 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2070 ?auto_2073 ) ( SUPPORTS ?auto_2070 ?auto_2068 ) ( not ( = ?auto_2067 ?auto_2069 ) ) ( HAVE_IMAGE ?auto_2072 ?auto_2071 ) ( not ( = ?auto_2072 ?auto_2067 ) ) ( not ( = ?auto_2072 ?auto_2069 ) ) ( not ( = ?auto_2071 ?auto_2068 ) ) ( CALIBRATION_TARGET ?auto_2070 ?auto_2069 ) ( POINTING ?auto_2073 ?auto_2072 ) ( ON_BOARD ?auto_2074 ?auto_2073 ) ( POWER_ON ?auto_2074 ) ( not ( = ?auto_2070 ?auto_2074 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2074 ?auto_2073 )
      ( GET-2IMAGE ?auto_2072 ?auto_2071 ?auto_2067 ?auto_2068 )
      ( GET-1IMAGE-VERIFY ?auto_2067 ?auto_2068 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2075 - DIRECTION
      ?auto_2076 - MODE
      ?auto_2078 - DIRECTION
      ?auto_2077 - MODE
    )
    :vars
    (
      ?auto_2081 - INSTRUMENT
      ?auto_2079 - SATELLITE
      ?auto_2082 - DIRECTION
      ?auto_2080 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2081 ?auto_2079 ) ( SUPPORTS ?auto_2081 ?auto_2077 ) ( not ( = ?auto_2078 ?auto_2082 ) ) ( HAVE_IMAGE ?auto_2075 ?auto_2076 ) ( not ( = ?auto_2075 ?auto_2078 ) ) ( not ( = ?auto_2075 ?auto_2082 ) ) ( not ( = ?auto_2076 ?auto_2077 ) ) ( CALIBRATION_TARGET ?auto_2081 ?auto_2082 ) ( POINTING ?auto_2079 ?auto_2075 ) ( ON_BOARD ?auto_2080 ?auto_2079 ) ( POWER_ON ?auto_2080 ) ( not ( = ?auto_2081 ?auto_2080 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2078 ?auto_2077 )
      ( GET-2IMAGE-VERIFY ?auto_2075 ?auto_2076 ?auto_2078 ?auto_2077 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2083 - DIRECTION
      ?auto_2084 - MODE
      ?auto_2086 - DIRECTION
      ?auto_2085 - MODE
    )
    :vars
    (
      ?auto_2089 - INSTRUMENT
      ?auto_2090 - SATELLITE
      ?auto_2088 - DIRECTION
      ?auto_2087 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2089 ?auto_2090 ) ( SUPPORTS ?auto_2089 ?auto_2084 ) ( not ( = ?auto_2083 ?auto_2088 ) ) ( HAVE_IMAGE ?auto_2086 ?auto_2085 ) ( not ( = ?auto_2086 ?auto_2083 ) ) ( not ( = ?auto_2086 ?auto_2088 ) ) ( not ( = ?auto_2085 ?auto_2084 ) ) ( CALIBRATION_TARGET ?auto_2089 ?auto_2088 ) ( POINTING ?auto_2090 ?auto_2086 ) ( ON_BOARD ?auto_2087 ?auto_2090 ) ( POWER_ON ?auto_2087 ) ( not ( = ?auto_2089 ?auto_2087 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2086 ?auto_2085 ?auto_2083 ?auto_2084 )
      ( GET-2IMAGE-VERIFY ?auto_2083 ?auto_2084 ?auto_2086 ?auto_2085 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2101 - DIRECTION
      ?auto_2102 - MODE
    )
    :vars
    (
      ?auto_2107 - INSTRUMENT
      ?auto_2108 - SATELLITE
      ?auto_2106 - DIRECTION
      ?auto_2103 - DIRECTION
      ?auto_2104 - MODE
      ?auto_2105 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2107 ?auto_2108 ) ( SUPPORTS ?auto_2107 ?auto_2102 ) ( not ( = ?auto_2101 ?auto_2106 ) ) ( not ( = ?auto_2103 ?auto_2101 ) ) ( not ( = ?auto_2103 ?auto_2106 ) ) ( not ( = ?auto_2104 ?auto_2102 ) ) ( CALIBRATION_TARGET ?auto_2107 ?auto_2106 ) ( POINTING ?auto_2108 ?auto_2103 ) ( ON_BOARD ?auto_2105 ?auto_2108 ) ( POWER_ON ?auto_2105 ) ( not ( = ?auto_2107 ?auto_2105 ) ) ( CALIBRATED ?auto_2105 ) ( SUPPORTS ?auto_2105 ?auto_2104 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2103 ?auto_2104 )
      ( GET-2IMAGE ?auto_2103 ?auto_2104 ?auto_2101 ?auto_2102 )
      ( GET-1IMAGE-VERIFY ?auto_2101 ?auto_2102 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2109 - DIRECTION
      ?auto_2110 - MODE
      ?auto_2112 - DIRECTION
      ?auto_2111 - MODE
    )
    :vars
    (
      ?auto_2116 - INSTRUMENT
      ?auto_2114 - SATELLITE
      ?auto_2113 - DIRECTION
      ?auto_2115 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2116 ?auto_2114 ) ( SUPPORTS ?auto_2116 ?auto_2111 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2109 ?auto_2112 ) ) ( not ( = ?auto_2109 ?auto_2113 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( CALIBRATION_TARGET ?auto_2116 ?auto_2113 ) ( POINTING ?auto_2114 ?auto_2109 ) ( ON_BOARD ?auto_2115 ?auto_2114 ) ( POWER_ON ?auto_2115 ) ( not ( = ?auto_2116 ?auto_2115 ) ) ( CALIBRATED ?auto_2115 ) ( SUPPORTS ?auto_2115 ?auto_2110 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2112 ?auto_2111 )
      ( GET-2IMAGE-VERIFY ?auto_2109 ?auto_2110 ?auto_2112 ?auto_2111 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2117 - DIRECTION
      ?auto_2118 - MODE
      ?auto_2120 - DIRECTION
      ?auto_2119 - MODE
    )
    :vars
    (
      ?auto_2124 - INSTRUMENT
      ?auto_2121 - SATELLITE
      ?auto_2122 - DIRECTION
      ?auto_2123 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2124 ?auto_2121 ) ( SUPPORTS ?auto_2124 ?auto_2118 ) ( not ( = ?auto_2117 ?auto_2122 ) ) ( not ( = ?auto_2120 ?auto_2117 ) ) ( not ( = ?auto_2120 ?auto_2122 ) ) ( not ( = ?auto_2119 ?auto_2118 ) ) ( CALIBRATION_TARGET ?auto_2124 ?auto_2122 ) ( POINTING ?auto_2121 ?auto_2120 ) ( ON_BOARD ?auto_2123 ?auto_2121 ) ( POWER_ON ?auto_2123 ) ( not ( = ?auto_2124 ?auto_2123 ) ) ( CALIBRATED ?auto_2123 ) ( SUPPORTS ?auto_2123 ?auto_2119 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2120 ?auto_2119 ?auto_2117 ?auto_2118 )
      ( GET-2IMAGE-VERIFY ?auto_2117 ?auto_2118 ?auto_2120 ?auto_2119 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2135 - DIRECTION
      ?auto_2136 - MODE
    )
    :vars
    (
      ?auto_2140 - INSTRUMENT
      ?auto_2137 - SATELLITE
      ?auto_2138 - DIRECTION
      ?auto_2142 - DIRECTION
      ?auto_2141 - MODE
      ?auto_2139 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2140 ?auto_2137 ) ( SUPPORTS ?auto_2140 ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2138 ) ) ( not ( = ?auto_2142 ?auto_2135 ) ) ( not ( = ?auto_2142 ?auto_2138 ) ) ( not ( = ?auto_2141 ?auto_2136 ) ) ( CALIBRATION_TARGET ?auto_2140 ?auto_2138 ) ( ON_BOARD ?auto_2139 ?auto_2137 ) ( POWER_ON ?auto_2139 ) ( not ( = ?auto_2140 ?auto_2139 ) ) ( CALIBRATED ?auto_2139 ) ( SUPPORTS ?auto_2139 ?auto_2141 ) ( POINTING ?auto_2137 ?auto_2138 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2137 ?auto_2142 ?auto_2138 )
      ( GET-2IMAGE ?auto_2142 ?auto_2141 ?auto_2135 ?auto_2136 )
      ( GET-1IMAGE-VERIFY ?auto_2135 ?auto_2136 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2143 - DIRECTION
      ?auto_2144 - MODE
      ?auto_2146 - DIRECTION
      ?auto_2145 - MODE
    )
    :vars
    (
      ?auto_2147 - INSTRUMENT
      ?auto_2150 - SATELLITE
      ?auto_2148 - DIRECTION
      ?auto_2149 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2147 ?auto_2150 ) ( SUPPORTS ?auto_2147 ?auto_2145 ) ( not ( = ?auto_2146 ?auto_2148 ) ) ( not ( = ?auto_2143 ?auto_2146 ) ) ( not ( = ?auto_2143 ?auto_2148 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( CALIBRATION_TARGET ?auto_2147 ?auto_2148 ) ( ON_BOARD ?auto_2149 ?auto_2150 ) ( POWER_ON ?auto_2149 ) ( not ( = ?auto_2147 ?auto_2149 ) ) ( CALIBRATED ?auto_2149 ) ( SUPPORTS ?auto_2149 ?auto_2144 ) ( POINTING ?auto_2150 ?auto_2148 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2146 ?auto_2145 )
      ( GET-2IMAGE-VERIFY ?auto_2143 ?auto_2144 ?auto_2146 ?auto_2145 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2151 - DIRECTION
      ?auto_2152 - MODE
      ?auto_2154 - DIRECTION
      ?auto_2153 - MODE
    )
    :vars
    (
      ?auto_2155 - INSTRUMENT
      ?auto_2157 - SATELLITE
      ?auto_2156 - DIRECTION
      ?auto_2158 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2155 ?auto_2157 ) ( SUPPORTS ?auto_2155 ?auto_2152 ) ( not ( = ?auto_2151 ?auto_2156 ) ) ( not ( = ?auto_2154 ?auto_2151 ) ) ( not ( = ?auto_2154 ?auto_2156 ) ) ( not ( = ?auto_2153 ?auto_2152 ) ) ( CALIBRATION_TARGET ?auto_2155 ?auto_2156 ) ( ON_BOARD ?auto_2158 ?auto_2157 ) ( POWER_ON ?auto_2158 ) ( not ( = ?auto_2155 ?auto_2158 ) ) ( CALIBRATED ?auto_2158 ) ( SUPPORTS ?auto_2158 ?auto_2153 ) ( POINTING ?auto_2157 ?auto_2156 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2154 ?auto_2153 ?auto_2151 ?auto_2152 )
      ( GET-2IMAGE-VERIFY ?auto_2151 ?auto_2152 ?auto_2154 ?auto_2153 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2169 - DIRECTION
      ?auto_2170 - MODE
    )
    :vars
    (
      ?auto_2171 - INSTRUMENT
      ?auto_2173 - SATELLITE
      ?auto_2172 - DIRECTION
      ?auto_2176 - DIRECTION
      ?auto_2175 - MODE
      ?auto_2174 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2171 ?auto_2173 ) ( SUPPORTS ?auto_2171 ?auto_2170 ) ( not ( = ?auto_2169 ?auto_2172 ) ) ( not ( = ?auto_2176 ?auto_2169 ) ) ( not ( = ?auto_2176 ?auto_2172 ) ) ( not ( = ?auto_2175 ?auto_2170 ) ) ( CALIBRATION_TARGET ?auto_2171 ?auto_2172 ) ( ON_BOARD ?auto_2174 ?auto_2173 ) ( POWER_ON ?auto_2174 ) ( not ( = ?auto_2171 ?auto_2174 ) ) ( SUPPORTS ?auto_2174 ?auto_2175 ) ( POINTING ?auto_2173 ?auto_2172 ) ( CALIBRATION_TARGET ?auto_2174 ?auto_2172 ) ( NOT_CALIBRATED ?auto_2174 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2173 ?auto_2174 ?auto_2172 )
      ( GET-2IMAGE ?auto_2176 ?auto_2175 ?auto_2169 ?auto_2170 )
      ( GET-1IMAGE-VERIFY ?auto_2169 ?auto_2170 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2177 - DIRECTION
      ?auto_2178 - MODE
      ?auto_2180 - DIRECTION
      ?auto_2179 - MODE
    )
    :vars
    (
      ?auto_2184 - INSTRUMENT
      ?auto_2182 - SATELLITE
      ?auto_2181 - DIRECTION
      ?auto_2183 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2184 ?auto_2182 ) ( SUPPORTS ?auto_2184 ?auto_2179 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2177 ?auto_2180 ) ) ( not ( = ?auto_2177 ?auto_2181 ) ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( CALIBRATION_TARGET ?auto_2184 ?auto_2181 ) ( ON_BOARD ?auto_2183 ?auto_2182 ) ( POWER_ON ?auto_2183 ) ( not ( = ?auto_2184 ?auto_2183 ) ) ( SUPPORTS ?auto_2183 ?auto_2178 ) ( POINTING ?auto_2182 ?auto_2181 ) ( CALIBRATION_TARGET ?auto_2183 ?auto_2181 ) ( NOT_CALIBRATED ?auto_2183 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2180 ?auto_2179 )
      ( GET-2IMAGE-VERIFY ?auto_2177 ?auto_2178 ?auto_2180 ?auto_2179 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2185 - DIRECTION
      ?auto_2186 - MODE
      ?auto_2188 - DIRECTION
      ?auto_2187 - MODE
    )
    :vars
    (
      ?auto_2191 - INSTRUMENT
      ?auto_2189 - SATELLITE
      ?auto_2190 - DIRECTION
      ?auto_2192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2191 ?auto_2189 ) ( SUPPORTS ?auto_2191 ?auto_2186 ) ( not ( = ?auto_2185 ?auto_2190 ) ) ( not ( = ?auto_2188 ?auto_2185 ) ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2187 ?auto_2186 ) ) ( CALIBRATION_TARGET ?auto_2191 ?auto_2190 ) ( ON_BOARD ?auto_2192 ?auto_2189 ) ( POWER_ON ?auto_2192 ) ( not ( = ?auto_2191 ?auto_2192 ) ) ( SUPPORTS ?auto_2192 ?auto_2187 ) ( POINTING ?auto_2189 ?auto_2190 ) ( CALIBRATION_TARGET ?auto_2192 ?auto_2190 ) ( NOT_CALIBRATED ?auto_2192 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2188 ?auto_2187 ?auto_2185 ?auto_2186 )
      ( GET-2IMAGE-VERIFY ?auto_2185 ?auto_2186 ?auto_2188 ?auto_2187 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2203 - DIRECTION
      ?auto_2204 - MODE
    )
    :vars
    (
      ?auto_2207 - INSTRUMENT
      ?auto_2205 - SATELLITE
      ?auto_2206 - DIRECTION
      ?auto_2210 - DIRECTION
      ?auto_2209 - MODE
      ?auto_2208 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2207 ?auto_2205 ) ( SUPPORTS ?auto_2207 ?auto_2204 ) ( not ( = ?auto_2203 ?auto_2206 ) ) ( not ( = ?auto_2210 ?auto_2203 ) ) ( not ( = ?auto_2210 ?auto_2206 ) ) ( not ( = ?auto_2209 ?auto_2204 ) ) ( CALIBRATION_TARGET ?auto_2207 ?auto_2206 ) ( ON_BOARD ?auto_2208 ?auto_2205 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( SUPPORTS ?auto_2208 ?auto_2209 ) ( POINTING ?auto_2205 ?auto_2206 ) ( CALIBRATION_TARGET ?auto_2208 ?auto_2206 ) ( POWER_AVAIL ?auto_2205 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2208 ?auto_2205 )
      ( GET-2IMAGE ?auto_2210 ?auto_2209 ?auto_2203 ?auto_2204 )
      ( GET-1IMAGE-VERIFY ?auto_2203 ?auto_2204 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2211 - DIRECTION
      ?auto_2212 - MODE
      ?auto_2214 - DIRECTION
      ?auto_2213 - MODE
    )
    :vars
    (
      ?auto_2217 - INSTRUMENT
      ?auto_2218 - SATELLITE
      ?auto_2216 - DIRECTION
      ?auto_2215 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2217 ?auto_2218 ) ( SUPPORTS ?auto_2217 ?auto_2213 ) ( not ( = ?auto_2214 ?auto_2216 ) ) ( not ( = ?auto_2211 ?auto_2214 ) ) ( not ( = ?auto_2211 ?auto_2216 ) ) ( not ( = ?auto_2212 ?auto_2213 ) ) ( CALIBRATION_TARGET ?auto_2217 ?auto_2216 ) ( ON_BOARD ?auto_2215 ?auto_2218 ) ( not ( = ?auto_2217 ?auto_2215 ) ) ( SUPPORTS ?auto_2215 ?auto_2212 ) ( POINTING ?auto_2218 ?auto_2216 ) ( CALIBRATION_TARGET ?auto_2215 ?auto_2216 ) ( POWER_AVAIL ?auto_2218 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2214 ?auto_2213 )
      ( GET-2IMAGE-VERIFY ?auto_2211 ?auto_2212 ?auto_2214 ?auto_2213 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2219 - DIRECTION
      ?auto_2220 - MODE
      ?auto_2222 - DIRECTION
      ?auto_2221 - MODE
    )
    :vars
    (
      ?auto_2223 - INSTRUMENT
      ?auto_2225 - SATELLITE
      ?auto_2224 - DIRECTION
      ?auto_2226 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2223 ?auto_2225 ) ( SUPPORTS ?auto_2223 ?auto_2220 ) ( not ( = ?auto_2219 ?auto_2224 ) ) ( not ( = ?auto_2222 ?auto_2219 ) ) ( not ( = ?auto_2222 ?auto_2224 ) ) ( not ( = ?auto_2221 ?auto_2220 ) ) ( CALIBRATION_TARGET ?auto_2223 ?auto_2224 ) ( ON_BOARD ?auto_2226 ?auto_2225 ) ( not ( = ?auto_2223 ?auto_2226 ) ) ( SUPPORTS ?auto_2226 ?auto_2221 ) ( POINTING ?auto_2225 ?auto_2224 ) ( CALIBRATION_TARGET ?auto_2226 ?auto_2224 ) ( POWER_AVAIL ?auto_2225 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2222 ?auto_2221 ?auto_2219 ?auto_2220 )
      ( GET-2IMAGE-VERIFY ?auto_2219 ?auto_2220 ?auto_2222 ?auto_2221 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2237 - DIRECTION
      ?auto_2238 - MODE
    )
    :vars
    (
      ?auto_2239 - INSTRUMENT
      ?auto_2241 - SATELLITE
      ?auto_2240 - DIRECTION
      ?auto_2244 - DIRECTION
      ?auto_2243 - MODE
      ?auto_2242 - INSTRUMENT
      ?auto_2245 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2239 ?auto_2241 ) ( SUPPORTS ?auto_2239 ?auto_2238 ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2244 ?auto_2237 ) ) ( not ( = ?auto_2244 ?auto_2240 ) ) ( not ( = ?auto_2243 ?auto_2238 ) ) ( CALIBRATION_TARGET ?auto_2239 ?auto_2240 ) ( ON_BOARD ?auto_2242 ?auto_2241 ) ( not ( = ?auto_2239 ?auto_2242 ) ) ( SUPPORTS ?auto_2242 ?auto_2243 ) ( CALIBRATION_TARGET ?auto_2242 ?auto_2240 ) ( POWER_AVAIL ?auto_2241 ) ( POINTING ?auto_2241 ?auto_2245 ) ( not ( = ?auto_2240 ?auto_2245 ) ) ( not ( = ?auto_2237 ?auto_2245 ) ) ( not ( = ?auto_2244 ?auto_2245 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2241 ?auto_2240 ?auto_2245 )
      ( GET-2IMAGE ?auto_2244 ?auto_2243 ?auto_2237 ?auto_2238 )
      ( GET-1IMAGE-VERIFY ?auto_2237 ?auto_2238 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2246 - DIRECTION
      ?auto_2247 - MODE
      ?auto_2249 - DIRECTION
      ?auto_2248 - MODE
    )
    :vars
    (
      ?auto_2251 - INSTRUMENT
      ?auto_2253 - SATELLITE
      ?auto_2250 - DIRECTION
      ?auto_2254 - INSTRUMENT
      ?auto_2252 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2251 ?auto_2253 ) ( SUPPORTS ?auto_2251 ?auto_2248 ) ( not ( = ?auto_2249 ?auto_2250 ) ) ( not ( = ?auto_2246 ?auto_2249 ) ) ( not ( = ?auto_2246 ?auto_2250 ) ) ( not ( = ?auto_2247 ?auto_2248 ) ) ( CALIBRATION_TARGET ?auto_2251 ?auto_2250 ) ( ON_BOARD ?auto_2254 ?auto_2253 ) ( not ( = ?auto_2251 ?auto_2254 ) ) ( SUPPORTS ?auto_2254 ?auto_2247 ) ( CALIBRATION_TARGET ?auto_2254 ?auto_2250 ) ( POWER_AVAIL ?auto_2253 ) ( POINTING ?auto_2253 ?auto_2252 ) ( not ( = ?auto_2250 ?auto_2252 ) ) ( not ( = ?auto_2249 ?auto_2252 ) ) ( not ( = ?auto_2246 ?auto_2252 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2249 ?auto_2248 )
      ( GET-2IMAGE-VERIFY ?auto_2246 ?auto_2247 ?auto_2249 ?auto_2248 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2255 - DIRECTION
      ?auto_2256 - MODE
      ?auto_2258 - DIRECTION
      ?auto_2257 - MODE
    )
    :vars
    (
      ?auto_2259 - INSTRUMENT
      ?auto_2262 - SATELLITE
      ?auto_2261 - DIRECTION
      ?auto_2263 - INSTRUMENT
      ?auto_2260 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2259 ?auto_2262 ) ( SUPPORTS ?auto_2259 ?auto_2256 ) ( not ( = ?auto_2255 ?auto_2261 ) ) ( not ( = ?auto_2258 ?auto_2255 ) ) ( not ( = ?auto_2258 ?auto_2261 ) ) ( not ( = ?auto_2257 ?auto_2256 ) ) ( CALIBRATION_TARGET ?auto_2259 ?auto_2261 ) ( ON_BOARD ?auto_2263 ?auto_2262 ) ( not ( = ?auto_2259 ?auto_2263 ) ) ( SUPPORTS ?auto_2263 ?auto_2257 ) ( CALIBRATION_TARGET ?auto_2263 ?auto_2261 ) ( POWER_AVAIL ?auto_2262 ) ( POINTING ?auto_2262 ?auto_2260 ) ( not ( = ?auto_2261 ?auto_2260 ) ) ( not ( = ?auto_2255 ?auto_2260 ) ) ( not ( = ?auto_2258 ?auto_2260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2258 ?auto_2257 ?auto_2255 ?auto_2256 )
      ( GET-2IMAGE-VERIFY ?auto_2255 ?auto_2256 ?auto_2258 ?auto_2257 ) )
  )

)

