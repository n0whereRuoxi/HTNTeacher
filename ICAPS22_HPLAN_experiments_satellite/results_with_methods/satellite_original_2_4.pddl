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
      ?auto_1865 - INSTRUMENT
      ?auto_1866 - SATELLITE
      ?auto_1867 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1865 ) ( ON_BOARD ?auto_1865 ?auto_1866 ) ( SUPPORTS ?auto_1865 ?auto_1864 ) ( POWER_ON ?auto_1865 ) ( POINTING ?auto_1866 ?auto_1867 ) ( not ( = ?auto_1863 ?auto_1867 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1866 ?auto_1863 ?auto_1867 )
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
      ?auto_1889 - INSTRUMENT
      ?auto_1891 - SATELLITE
      ?auto_1890 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1889 ?auto_1891 ) ( SUPPORTS ?auto_1889 ?auto_1888 ) ( POINTING ?auto_1891 ?auto_1890 ) ( not ( = ?auto_1887 ?auto_1890 ) ) ( CALIBRATION_TARGET ?auto_1889 ?auto_1890 ) ( POWER_AVAIL ?auto_1891 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1889 ?auto_1891 )
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
    ( and ( not ( = ?auto_1934 ?auto_1931 ) ) ( CALIBRATED ?auto_1935 ) ( ON_BOARD ?auto_1935 ?auto_1936 ) ( SUPPORTS ?auto_1935 ?auto_1933 ) ( POWER_ON ?auto_1935 ) ( POINTING ?auto_1936 ?auto_1934 ) ( HAVE_IMAGE ?auto_1931 ?auto_1932 ) ( not ( = ?auto_1932 ?auto_1933 ) ) )
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
    ( and ( not ( = ?auto_1940 ?auto_1937 ) ) ( CALIBRATED ?auto_1941 ) ( ON_BOARD ?auto_1941 ?auto_1942 ) ( SUPPORTS ?auto_1941 ?auto_1938 ) ( POWER_ON ?auto_1941 ) ( POINTING ?auto_1942 ?auto_1937 ) ( HAVE_IMAGE ?auto_1940 ?auto_1939 ) ( not ( = ?auto_1938 ?auto_1939 ) ) )
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
      ?auto_1959 - INSTRUMENT
      ?auto_1958 - SATELLITE
      ?auto_1960 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1957 ?auto_1954 ) ) ( CALIBRATED ?auto_1959 ) ( ON_BOARD ?auto_1959 ?auto_1958 ) ( SUPPORTS ?auto_1959 ?auto_1956 ) ( POWER_ON ?auto_1959 ) ( POINTING ?auto_1958 ?auto_1960 ) ( not ( = ?auto_1957 ?auto_1960 ) ) ( HAVE_IMAGE ?auto_1954 ?auto_1955 ) ( not ( = ?auto_1954 ?auto_1960 ) ) ( not ( = ?auto_1955 ?auto_1956 ) ) )
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
      ?auto_1966 - INSTRUMENT
      ?auto_1967 - SATELLITE
      ?auto_1965 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1964 ?auto_1961 ) ) ( CALIBRATED ?auto_1966 ) ( ON_BOARD ?auto_1966 ?auto_1967 ) ( SUPPORTS ?auto_1966 ?auto_1962 ) ( POWER_ON ?auto_1966 ) ( POINTING ?auto_1967 ?auto_1965 ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( HAVE_IMAGE ?auto_1964 ?auto_1963 ) ( not ( = ?auto_1964 ?auto_1965 ) ) ( not ( = ?auto_1963 ?auto_1962 ) ) )
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
      ?auto_1982 - DIRECTION
      ?auto_1980 - INSTRUMENT
      ?auto_1983 - SATELLITE
      ?auto_1979 - DIRECTION
      ?auto_1981 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1977 ?auto_1982 ) ) ( ON_BOARD ?auto_1980 ?auto_1983 ) ( SUPPORTS ?auto_1980 ?auto_1978 ) ( POWER_ON ?auto_1980 ) ( POINTING ?auto_1983 ?auto_1979 ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( HAVE_IMAGE ?auto_1982 ?auto_1981 ) ( not ( = ?auto_1982 ?auto_1979 ) ) ( not ( = ?auto_1981 ?auto_1978 ) ) ( CALIBRATION_TARGET ?auto_1980 ?auto_1979 ) ( NOT_CALIBRATED ?auto_1980 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1983 ?auto_1980 ?auto_1979 )
      ( GET-2IMAGE ?auto_1982 ?auto_1981 ?auto_1977 ?auto_1978 )
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
      ?auto_1989 - INSTRUMENT
      ?auto_1988 - SATELLITE
      ?auto_1990 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1987 ?auto_1984 ) ) ( ON_BOARD ?auto_1989 ?auto_1988 ) ( SUPPORTS ?auto_1989 ?auto_1986 ) ( POWER_ON ?auto_1989 ) ( POINTING ?auto_1988 ?auto_1990 ) ( not ( = ?auto_1987 ?auto_1990 ) ) ( HAVE_IMAGE ?auto_1984 ?auto_1985 ) ( not ( = ?auto_1984 ?auto_1990 ) ) ( not ( = ?auto_1985 ?auto_1986 ) ) ( CALIBRATION_TARGET ?auto_1989 ?auto_1990 ) ( NOT_CALIBRATED ?auto_1989 ) )
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
      ?auto_1997 - INSTRUMENT
      ?auto_1996 - SATELLITE
      ?auto_1995 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1994 ?auto_1991 ) ) ( ON_BOARD ?auto_1997 ?auto_1996 ) ( SUPPORTS ?auto_1997 ?auto_1992 ) ( POWER_ON ?auto_1997 ) ( POINTING ?auto_1996 ?auto_1995 ) ( not ( = ?auto_1991 ?auto_1995 ) ) ( HAVE_IMAGE ?auto_1994 ?auto_1993 ) ( not ( = ?auto_1994 ?auto_1995 ) ) ( not ( = ?auto_1993 ?auto_1992 ) ) ( CALIBRATION_TARGET ?auto_1997 ?auto_1995 ) ( NOT_CALIBRATED ?auto_1997 ) )
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
      ?auto_2009 - DIRECTION
      ?auto_2013 - INSTRUMENT
      ?auto_2012 - SATELLITE
      ?auto_2010 - DIRECTION
      ?auto_2011 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2007 ?auto_2009 ) ) ( ON_BOARD ?auto_2013 ?auto_2012 ) ( SUPPORTS ?auto_2013 ?auto_2008 ) ( POINTING ?auto_2012 ?auto_2010 ) ( not ( = ?auto_2007 ?auto_2010 ) ) ( HAVE_IMAGE ?auto_2009 ?auto_2011 ) ( not ( = ?auto_2009 ?auto_2010 ) ) ( not ( = ?auto_2011 ?auto_2008 ) ) ( CALIBRATION_TARGET ?auto_2013 ?auto_2010 ) ( POWER_AVAIL ?auto_2012 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2013 ?auto_2012 )
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
      ?auto_2019 - INSTRUMENT
      ?auto_2018 - SATELLITE
      ?auto_2020 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2017 ?auto_2014 ) ) ( ON_BOARD ?auto_2019 ?auto_2018 ) ( SUPPORTS ?auto_2019 ?auto_2016 ) ( POINTING ?auto_2018 ?auto_2020 ) ( not ( = ?auto_2017 ?auto_2020 ) ) ( HAVE_IMAGE ?auto_2014 ?auto_2015 ) ( not ( = ?auto_2014 ?auto_2020 ) ) ( not ( = ?auto_2015 ?auto_2016 ) ) ( CALIBRATION_TARGET ?auto_2019 ?auto_2020 ) ( POWER_AVAIL ?auto_2018 ) )
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
      ?auto_2026 - INSTRUMENT
      ?auto_2027 - SATELLITE
      ?auto_2025 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2024 ?auto_2021 ) ) ( ON_BOARD ?auto_2026 ?auto_2027 ) ( SUPPORTS ?auto_2026 ?auto_2022 ) ( POINTING ?auto_2027 ?auto_2025 ) ( not ( = ?auto_2021 ?auto_2025 ) ) ( HAVE_IMAGE ?auto_2024 ?auto_2023 ) ( not ( = ?auto_2024 ?auto_2025 ) ) ( not ( = ?auto_2023 ?auto_2022 ) ) ( CALIBRATION_TARGET ?auto_2026 ?auto_2025 ) ( POWER_AVAIL ?auto_2027 ) )
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
      ?auto_2042 - DIRECTION
      ?auto_2041 - INSTRUMENT
      ?auto_2043 - SATELLITE
      ?auto_2040 - DIRECTION
      ?auto_2039 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2037 ?auto_2042 ) ) ( ON_BOARD ?auto_2041 ?auto_2043 ) ( SUPPORTS ?auto_2041 ?auto_2038 ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( HAVE_IMAGE ?auto_2042 ?auto_2039 ) ( not ( = ?auto_2042 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2038 ) ) ( CALIBRATION_TARGET ?auto_2041 ?auto_2040 ) ( POWER_AVAIL ?auto_2043 ) ( POINTING ?auto_2043 ?auto_2042 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2043 ?auto_2040 ?auto_2042 )
      ( GET-2IMAGE ?auto_2042 ?auto_2039 ?auto_2037 ?auto_2038 )
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
      ?auto_2050 - INSTRUMENT
      ?auto_2049 - SATELLITE
      ?auto_2048 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2047 ?auto_2044 ) ) ( ON_BOARD ?auto_2050 ?auto_2049 ) ( SUPPORTS ?auto_2050 ?auto_2046 ) ( not ( = ?auto_2047 ?auto_2048 ) ) ( HAVE_IMAGE ?auto_2044 ?auto_2045 ) ( not ( = ?auto_2044 ?auto_2048 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( CALIBRATION_TARGET ?auto_2050 ?auto_2048 ) ( POWER_AVAIL ?auto_2049 ) ( POINTING ?auto_2049 ?auto_2044 ) )
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
    ( and ( not ( = ?auto_2054 ?auto_2051 ) ) ( ON_BOARD ?auto_2056 ?auto_2057 ) ( SUPPORTS ?auto_2056 ?auto_2052 ) ( not ( = ?auto_2051 ?auto_2055 ) ) ( HAVE_IMAGE ?auto_2054 ?auto_2053 ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( not ( = ?auto_2053 ?auto_2052 ) ) ( CALIBRATION_TARGET ?auto_2056 ?auto_2055 ) ( POWER_AVAIL ?auto_2057 ) ( POINTING ?auto_2057 ?auto_2054 ) )
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
      ?auto_2070 - DIRECTION
      ?auto_2072 - INSTRUMENT
      ?auto_2073 - SATELLITE
      ?auto_2071 - DIRECTION
      ?auto_2069 - MODE
      ?auto_2074 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2067 ?auto_2070 ) ) ( ON_BOARD ?auto_2072 ?auto_2073 ) ( SUPPORTS ?auto_2072 ?auto_2068 ) ( not ( = ?auto_2067 ?auto_2071 ) ) ( HAVE_IMAGE ?auto_2070 ?auto_2069 ) ( not ( = ?auto_2070 ?auto_2071 ) ) ( not ( = ?auto_2069 ?auto_2068 ) ) ( CALIBRATION_TARGET ?auto_2072 ?auto_2071 ) ( POINTING ?auto_2073 ?auto_2070 ) ( ON_BOARD ?auto_2074 ?auto_2073 ) ( POWER_ON ?auto_2074 ) ( not ( = ?auto_2072 ?auto_2074 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2074 ?auto_2073 )
      ( GET-2IMAGE ?auto_2070 ?auto_2069 ?auto_2067 ?auto_2068 )
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
      ?auto_2082 - INSTRUMENT
      ?auto_2081 - SATELLITE
      ?auto_2080 - DIRECTION
      ?auto_2079 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2078 ?auto_2075 ) ) ( ON_BOARD ?auto_2082 ?auto_2081 ) ( SUPPORTS ?auto_2082 ?auto_2077 ) ( not ( = ?auto_2078 ?auto_2080 ) ) ( HAVE_IMAGE ?auto_2075 ?auto_2076 ) ( not ( = ?auto_2075 ?auto_2080 ) ) ( not ( = ?auto_2076 ?auto_2077 ) ) ( CALIBRATION_TARGET ?auto_2082 ?auto_2080 ) ( POINTING ?auto_2081 ?auto_2075 ) ( ON_BOARD ?auto_2079 ?auto_2081 ) ( POWER_ON ?auto_2079 ) ( not ( = ?auto_2082 ?auto_2079 ) ) )
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
      ?auto_2087 - SATELLITE
      ?auto_2088 - DIRECTION
      ?auto_2090 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2086 ?auto_2083 ) ) ( ON_BOARD ?auto_2089 ?auto_2087 ) ( SUPPORTS ?auto_2089 ?auto_2084 ) ( not ( = ?auto_2083 ?auto_2088 ) ) ( HAVE_IMAGE ?auto_2086 ?auto_2085 ) ( not ( = ?auto_2086 ?auto_2088 ) ) ( not ( = ?auto_2085 ?auto_2084 ) ) ( CALIBRATION_TARGET ?auto_2089 ?auto_2088 ) ( POINTING ?auto_2087 ?auto_2086 ) ( ON_BOARD ?auto_2090 ?auto_2087 ) ( POWER_ON ?auto_2090 ) ( not ( = ?auto_2089 ?auto_2090 ) ) )
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
      ?auto_2107 - DIRECTION
      ?auto_2105 - INSTRUMENT
      ?auto_2103 - SATELLITE
      ?auto_2104 - DIRECTION
      ?auto_2106 - MODE
      ?auto_2108 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2101 ?auto_2107 ) ) ( ON_BOARD ?auto_2105 ?auto_2103 ) ( SUPPORTS ?auto_2105 ?auto_2102 ) ( not ( = ?auto_2101 ?auto_2104 ) ) ( not ( = ?auto_2107 ?auto_2104 ) ) ( not ( = ?auto_2106 ?auto_2102 ) ) ( CALIBRATION_TARGET ?auto_2105 ?auto_2104 ) ( POINTING ?auto_2103 ?auto_2107 ) ( ON_BOARD ?auto_2108 ?auto_2103 ) ( POWER_ON ?auto_2108 ) ( not ( = ?auto_2105 ?auto_2108 ) ) ( CALIBRATED ?auto_2108 ) ( SUPPORTS ?auto_2108 ?auto_2106 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2107 ?auto_2106 )
      ( GET-2IMAGE ?auto_2107 ?auto_2106 ?auto_2101 ?auto_2102 )
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
    ( and ( not ( = ?auto_2112 ?auto_2109 ) ) ( ON_BOARD ?auto_2116 ?auto_2114 ) ( SUPPORTS ?auto_2116 ?auto_2111 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2109 ?auto_2113 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( CALIBRATION_TARGET ?auto_2116 ?auto_2113 ) ( POINTING ?auto_2114 ?auto_2109 ) ( ON_BOARD ?auto_2115 ?auto_2114 ) ( POWER_ON ?auto_2115 ) ( not ( = ?auto_2116 ?auto_2115 ) ) ( CALIBRATED ?auto_2115 ) ( SUPPORTS ?auto_2115 ?auto_2110 ) )
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
      ?auto_2122 - SATELLITE
      ?auto_2123 - DIRECTION
      ?auto_2121 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2120 ?auto_2117 ) ) ( ON_BOARD ?auto_2124 ?auto_2122 ) ( SUPPORTS ?auto_2124 ?auto_2118 ) ( not ( = ?auto_2117 ?auto_2123 ) ) ( not ( = ?auto_2120 ?auto_2123 ) ) ( not ( = ?auto_2119 ?auto_2118 ) ) ( CALIBRATION_TARGET ?auto_2124 ?auto_2123 ) ( POINTING ?auto_2122 ?auto_2120 ) ( ON_BOARD ?auto_2121 ?auto_2122 ) ( POWER_ON ?auto_2121 ) ( not ( = ?auto_2124 ?auto_2121 ) ) ( CALIBRATED ?auto_2121 ) ( SUPPORTS ?auto_2121 ?auto_2119 ) )
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
      ?auto_2139 - DIRECTION
      ?auto_2142 - INSTRUMENT
      ?auto_2140 - SATELLITE
      ?auto_2141 - DIRECTION
      ?auto_2138 - MODE
      ?auto_2137 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2135 ?auto_2139 ) ) ( ON_BOARD ?auto_2142 ?auto_2140 ) ( SUPPORTS ?auto_2142 ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2141 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) ( not ( = ?auto_2138 ?auto_2136 ) ) ( CALIBRATION_TARGET ?auto_2142 ?auto_2141 ) ( ON_BOARD ?auto_2137 ?auto_2140 ) ( POWER_ON ?auto_2137 ) ( not ( = ?auto_2142 ?auto_2137 ) ) ( CALIBRATED ?auto_2137 ) ( SUPPORTS ?auto_2137 ?auto_2138 ) ( POINTING ?auto_2140 ?auto_2141 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2140 ?auto_2139 ?auto_2141 )
      ( GET-2IMAGE ?auto_2139 ?auto_2138 ?auto_2135 ?auto_2136 )
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
      ?auto_2150 - INSTRUMENT
      ?auto_2148 - SATELLITE
      ?auto_2147 - DIRECTION
      ?auto_2149 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2146 ?auto_2143 ) ) ( ON_BOARD ?auto_2150 ?auto_2148 ) ( SUPPORTS ?auto_2150 ?auto_2145 ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( CALIBRATION_TARGET ?auto_2150 ?auto_2147 ) ( ON_BOARD ?auto_2149 ?auto_2148 ) ( POWER_ON ?auto_2149 ) ( not ( = ?auto_2150 ?auto_2149 ) ) ( CALIBRATED ?auto_2149 ) ( SUPPORTS ?auto_2149 ?auto_2144 ) ( POINTING ?auto_2148 ?auto_2147 ) )
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
      ?auto_2156 - INSTRUMENT
      ?auto_2157 - SATELLITE
      ?auto_2155 - DIRECTION
      ?auto_2158 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2154 ?auto_2151 ) ) ( ON_BOARD ?auto_2156 ?auto_2157 ) ( SUPPORTS ?auto_2156 ?auto_2152 ) ( not ( = ?auto_2151 ?auto_2155 ) ) ( not ( = ?auto_2154 ?auto_2155 ) ) ( not ( = ?auto_2153 ?auto_2152 ) ) ( CALIBRATION_TARGET ?auto_2156 ?auto_2155 ) ( ON_BOARD ?auto_2158 ?auto_2157 ) ( POWER_ON ?auto_2158 ) ( not ( = ?auto_2156 ?auto_2158 ) ) ( CALIBRATED ?auto_2158 ) ( SUPPORTS ?auto_2158 ?auto_2153 ) ( POINTING ?auto_2157 ?auto_2155 ) )
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
      ?auto_2176 - DIRECTION
      ?auto_2172 - INSTRUMENT
      ?auto_2173 - SATELLITE
      ?auto_2171 - DIRECTION
      ?auto_2175 - MODE
      ?auto_2174 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2169 ?auto_2176 ) ) ( ON_BOARD ?auto_2172 ?auto_2173 ) ( SUPPORTS ?auto_2172 ?auto_2170 ) ( not ( = ?auto_2169 ?auto_2171 ) ) ( not ( = ?auto_2176 ?auto_2171 ) ) ( not ( = ?auto_2175 ?auto_2170 ) ) ( CALIBRATION_TARGET ?auto_2172 ?auto_2171 ) ( ON_BOARD ?auto_2174 ?auto_2173 ) ( POWER_ON ?auto_2174 ) ( not ( = ?auto_2172 ?auto_2174 ) ) ( SUPPORTS ?auto_2174 ?auto_2175 ) ( POINTING ?auto_2173 ?auto_2171 ) ( CALIBRATION_TARGET ?auto_2174 ?auto_2171 ) ( NOT_CALIBRATED ?auto_2174 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2173 ?auto_2174 ?auto_2171 )
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
      ?auto_2183 - INSTRUMENT
      ?auto_2181 - SATELLITE
      ?auto_2184 - DIRECTION
      ?auto_2182 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2180 ?auto_2177 ) ) ( ON_BOARD ?auto_2183 ?auto_2181 ) ( SUPPORTS ?auto_2183 ?auto_2179 ) ( not ( = ?auto_2180 ?auto_2184 ) ) ( not ( = ?auto_2177 ?auto_2184 ) ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( CALIBRATION_TARGET ?auto_2183 ?auto_2184 ) ( ON_BOARD ?auto_2182 ?auto_2181 ) ( POWER_ON ?auto_2182 ) ( not ( = ?auto_2183 ?auto_2182 ) ) ( SUPPORTS ?auto_2182 ?auto_2178 ) ( POINTING ?auto_2181 ?auto_2184 ) ( CALIBRATION_TARGET ?auto_2182 ?auto_2184 ) ( NOT_CALIBRATED ?auto_2182 ) )
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
      ?auto_2192 - INSTRUMENT
      ?auto_2190 - SATELLITE
      ?auto_2191 - DIRECTION
      ?auto_2189 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2188 ?auto_2185 ) ) ( ON_BOARD ?auto_2192 ?auto_2190 ) ( SUPPORTS ?auto_2192 ?auto_2186 ) ( not ( = ?auto_2185 ?auto_2191 ) ) ( not ( = ?auto_2188 ?auto_2191 ) ) ( not ( = ?auto_2187 ?auto_2186 ) ) ( CALIBRATION_TARGET ?auto_2192 ?auto_2191 ) ( ON_BOARD ?auto_2189 ?auto_2190 ) ( POWER_ON ?auto_2189 ) ( not ( = ?auto_2192 ?auto_2189 ) ) ( SUPPORTS ?auto_2189 ?auto_2187 ) ( POINTING ?auto_2190 ?auto_2191 ) ( CALIBRATION_TARGET ?auto_2189 ?auto_2191 ) ( NOT_CALIBRATED ?auto_2189 ) )
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
      ?auto_2210 - DIRECTION
      ?auto_2208 - INSTRUMENT
      ?auto_2206 - SATELLITE
      ?auto_2207 - DIRECTION
      ?auto_2209 - MODE
      ?auto_2205 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2203 ?auto_2210 ) ) ( ON_BOARD ?auto_2208 ?auto_2206 ) ( SUPPORTS ?auto_2208 ?auto_2204 ) ( not ( = ?auto_2203 ?auto_2207 ) ) ( not ( = ?auto_2210 ?auto_2207 ) ) ( not ( = ?auto_2209 ?auto_2204 ) ) ( CALIBRATION_TARGET ?auto_2208 ?auto_2207 ) ( ON_BOARD ?auto_2205 ?auto_2206 ) ( not ( = ?auto_2208 ?auto_2205 ) ) ( SUPPORTS ?auto_2205 ?auto_2209 ) ( POINTING ?auto_2206 ?auto_2207 ) ( CALIBRATION_TARGET ?auto_2205 ?auto_2207 ) ( POWER_AVAIL ?auto_2206 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2205 ?auto_2206 )
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
      ?auto_2218 - INSTRUMENT
      ?auto_2216 - SATELLITE
      ?auto_2215 - DIRECTION
      ?auto_2217 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2214 ?auto_2211 ) ) ( ON_BOARD ?auto_2218 ?auto_2216 ) ( SUPPORTS ?auto_2218 ?auto_2213 ) ( not ( = ?auto_2214 ?auto_2215 ) ) ( not ( = ?auto_2211 ?auto_2215 ) ) ( not ( = ?auto_2212 ?auto_2213 ) ) ( CALIBRATION_TARGET ?auto_2218 ?auto_2215 ) ( ON_BOARD ?auto_2217 ?auto_2216 ) ( not ( = ?auto_2218 ?auto_2217 ) ) ( SUPPORTS ?auto_2217 ?auto_2212 ) ( POINTING ?auto_2216 ?auto_2215 ) ( CALIBRATION_TARGET ?auto_2217 ?auto_2215 ) ( POWER_AVAIL ?auto_2216 ) )
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
      ?auto_2225 - INSTRUMENT
      ?auto_2223 - SATELLITE
      ?auto_2226 - DIRECTION
      ?auto_2224 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2222 ?auto_2219 ) ) ( ON_BOARD ?auto_2225 ?auto_2223 ) ( SUPPORTS ?auto_2225 ?auto_2220 ) ( not ( = ?auto_2219 ?auto_2226 ) ) ( not ( = ?auto_2222 ?auto_2226 ) ) ( not ( = ?auto_2221 ?auto_2220 ) ) ( CALIBRATION_TARGET ?auto_2225 ?auto_2226 ) ( ON_BOARD ?auto_2224 ?auto_2223 ) ( not ( = ?auto_2225 ?auto_2224 ) ) ( SUPPORTS ?auto_2224 ?auto_2221 ) ( POINTING ?auto_2223 ?auto_2226 ) ( CALIBRATION_TARGET ?auto_2224 ?auto_2226 ) ( POWER_AVAIL ?auto_2223 ) )
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
      ?auto_2244 - DIRECTION
      ?auto_2241 - INSTRUMENT
      ?auto_2239 - SATELLITE
      ?auto_2242 - DIRECTION
      ?auto_2243 - MODE
      ?auto_2240 - INSTRUMENT
      ?auto_2245 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2237 ?auto_2244 ) ) ( ON_BOARD ?auto_2241 ?auto_2239 ) ( SUPPORTS ?auto_2241 ?auto_2238 ) ( not ( = ?auto_2237 ?auto_2242 ) ) ( not ( = ?auto_2244 ?auto_2242 ) ) ( not ( = ?auto_2243 ?auto_2238 ) ) ( CALIBRATION_TARGET ?auto_2241 ?auto_2242 ) ( ON_BOARD ?auto_2240 ?auto_2239 ) ( not ( = ?auto_2241 ?auto_2240 ) ) ( SUPPORTS ?auto_2240 ?auto_2243 ) ( CALIBRATION_TARGET ?auto_2240 ?auto_2242 ) ( POWER_AVAIL ?auto_2239 ) ( POINTING ?auto_2239 ?auto_2245 ) ( not ( = ?auto_2242 ?auto_2245 ) ) ( not ( = ?auto_2237 ?auto_2245 ) ) ( not ( = ?auto_2244 ?auto_2245 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2239 ?auto_2242 ?auto_2245 )
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
      ?auto_2252 - INSTRUMENT
      ?auto_2251 - SATELLITE
      ?auto_2254 - DIRECTION
      ?auto_2253 - INSTRUMENT
      ?auto_2250 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2249 ?auto_2246 ) ) ( ON_BOARD ?auto_2252 ?auto_2251 ) ( SUPPORTS ?auto_2252 ?auto_2248 ) ( not ( = ?auto_2249 ?auto_2254 ) ) ( not ( = ?auto_2246 ?auto_2254 ) ) ( not ( = ?auto_2247 ?auto_2248 ) ) ( CALIBRATION_TARGET ?auto_2252 ?auto_2254 ) ( ON_BOARD ?auto_2253 ?auto_2251 ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( SUPPORTS ?auto_2253 ?auto_2247 ) ( CALIBRATION_TARGET ?auto_2253 ?auto_2254 ) ( POWER_AVAIL ?auto_2251 ) ( POINTING ?auto_2251 ?auto_2250 ) ( not ( = ?auto_2254 ?auto_2250 ) ) ( not ( = ?auto_2249 ?auto_2250 ) ) ( not ( = ?auto_2246 ?auto_2250 ) ) )
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
      ?auto_2262 - INSTRUMENT
      ?auto_2259 - SATELLITE
      ?auto_2260 - DIRECTION
      ?auto_2261 - INSTRUMENT
      ?auto_2263 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2258 ?auto_2255 ) ) ( ON_BOARD ?auto_2262 ?auto_2259 ) ( SUPPORTS ?auto_2262 ?auto_2256 ) ( not ( = ?auto_2255 ?auto_2260 ) ) ( not ( = ?auto_2258 ?auto_2260 ) ) ( not ( = ?auto_2257 ?auto_2256 ) ) ( CALIBRATION_TARGET ?auto_2262 ?auto_2260 ) ( ON_BOARD ?auto_2261 ?auto_2259 ) ( not ( = ?auto_2262 ?auto_2261 ) ) ( SUPPORTS ?auto_2261 ?auto_2257 ) ( CALIBRATION_TARGET ?auto_2261 ?auto_2260 ) ( POWER_AVAIL ?auto_2259 ) ( POINTING ?auto_2259 ?auto_2263 ) ( not ( = ?auto_2260 ?auto_2263 ) ) ( not ( = ?auto_2255 ?auto_2263 ) ) ( not ( = ?auto_2258 ?auto_2263 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2258 ?auto_2257 ?auto_2255 ?auto_2256 )
      ( GET-2IMAGE-VERIFY ?auto_2255 ?auto_2256 ?auto_2258 ?auto_2257 ) )
  )

)

