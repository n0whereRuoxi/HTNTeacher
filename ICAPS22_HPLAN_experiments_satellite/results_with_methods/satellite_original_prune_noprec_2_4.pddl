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
      ?auto_1761 - DIRECTION
      ?auto_1762 - MODE
    )
    :vars
    (
      ?auto_1763 - INSTRUMENT
      ?auto_1764 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1763 ) ( ON_BOARD ?auto_1763 ?auto_1764 ) ( SUPPORTS ?auto_1763 ?auto_1762 ) ( POWER_ON ?auto_1763 ) ( POINTING ?auto_1764 ?auto_1761 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1764 ?auto_1761 ?auto_1763 ?auto_1762 )
      ( GET-1IMAGE-VERIFY ?auto_1761 ?auto_1762 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1771 - DIRECTION
      ?auto_1772 - MODE
    )
    :vars
    (
      ?auto_1773 - INSTRUMENT
      ?auto_1774 - SATELLITE
      ?auto_1775 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1773 ) ( ON_BOARD ?auto_1773 ?auto_1774 ) ( SUPPORTS ?auto_1773 ?auto_1772 ) ( POWER_ON ?auto_1773 ) ( POINTING ?auto_1774 ?auto_1775 ) ( not ( = ?auto_1771 ?auto_1775 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1774 ?auto_1771 ?auto_1775 )
      ( GET-1IMAGE ?auto_1771 ?auto_1772 )
      ( GET-1IMAGE-VERIFY ?auto_1771 ?auto_1772 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1783 - DIRECTION
      ?auto_1784 - MODE
    )
    :vars
    (
      ?auto_1787 - INSTRUMENT
      ?auto_1786 - SATELLITE
      ?auto_1785 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1787 ?auto_1786 ) ( SUPPORTS ?auto_1787 ?auto_1784 ) ( POWER_ON ?auto_1787 ) ( POINTING ?auto_1786 ?auto_1785 ) ( not ( = ?auto_1783 ?auto_1785 ) ) ( CALIBRATION_TARGET ?auto_1787 ?auto_1785 ) ( NOT_CALIBRATED ?auto_1787 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1786 ?auto_1787 ?auto_1785 )
      ( GET-1IMAGE ?auto_1783 ?auto_1784 )
      ( GET-1IMAGE-VERIFY ?auto_1783 ?auto_1784 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1795 - DIRECTION
      ?auto_1796 - MODE
    )
    :vars
    (
      ?auto_1799 - INSTRUMENT
      ?auto_1798 - SATELLITE
      ?auto_1797 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1799 ?auto_1798 ) ( SUPPORTS ?auto_1799 ?auto_1796 ) ( POINTING ?auto_1798 ?auto_1797 ) ( not ( = ?auto_1795 ?auto_1797 ) ) ( CALIBRATION_TARGET ?auto_1799 ?auto_1797 ) ( POWER_AVAIL ?auto_1798 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1799 ?auto_1798 )
      ( GET-1IMAGE ?auto_1795 ?auto_1796 )
      ( GET-1IMAGE-VERIFY ?auto_1795 ?auto_1796 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1807 - DIRECTION
      ?auto_1808 - MODE
    )
    :vars
    (
      ?auto_1810 - INSTRUMENT
      ?auto_1809 - SATELLITE
      ?auto_1811 - DIRECTION
      ?auto_1812 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1810 ?auto_1809 ) ( SUPPORTS ?auto_1810 ?auto_1808 ) ( not ( = ?auto_1807 ?auto_1811 ) ) ( CALIBRATION_TARGET ?auto_1810 ?auto_1811 ) ( POWER_AVAIL ?auto_1809 ) ( POINTING ?auto_1809 ?auto_1812 ) ( not ( = ?auto_1811 ?auto_1812 ) ) ( not ( = ?auto_1807 ?auto_1812 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1809 ?auto_1811 ?auto_1812 )
      ( GET-1IMAGE ?auto_1807 ?auto_1808 )
      ( GET-1IMAGE-VERIFY ?auto_1807 ?auto_1808 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1840 - DIRECTION
      ?auto_1841 - MODE
      ?auto_1842 - DIRECTION
      ?auto_1839 - MODE
    )
    :vars
    (
      ?auto_1844 - INSTRUMENT
      ?auto_1843 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1844 ) ( ON_BOARD ?auto_1844 ?auto_1843 ) ( SUPPORTS ?auto_1844 ?auto_1839 ) ( POWER_ON ?auto_1844 ) ( POINTING ?auto_1843 ?auto_1842 ) ( HAVE_IMAGE ?auto_1840 ?auto_1841 ) ( not ( = ?auto_1840 ?auto_1842 ) ) ( not ( = ?auto_1841 ?auto_1839 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1842 ?auto_1839 )
      ( GET-2IMAGE-VERIFY ?auto_1840 ?auto_1841 ?auto_1842 ?auto_1839 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1846 - DIRECTION
      ?auto_1847 - MODE
      ?auto_1848 - DIRECTION
      ?auto_1845 - MODE
    )
    :vars
    (
      ?auto_1850 - INSTRUMENT
      ?auto_1849 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1850 ) ( ON_BOARD ?auto_1850 ?auto_1849 ) ( SUPPORTS ?auto_1850 ?auto_1847 ) ( POWER_ON ?auto_1850 ) ( POINTING ?auto_1849 ?auto_1846 ) ( HAVE_IMAGE ?auto_1848 ?auto_1845 ) ( not ( = ?auto_1846 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1845 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1846 ?auto_1847 )
      ( GET-2IMAGE-VERIFY ?auto_1846 ?auto_1847 ?auto_1848 ?auto_1845 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1863 - DIRECTION
      ?auto_1864 - MODE
      ?auto_1865 - DIRECTION
      ?auto_1862 - MODE
    )
    :vars
    (
      ?auto_1868 - INSTRUMENT
      ?auto_1867 - SATELLITE
      ?auto_1866 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1868 ) ( ON_BOARD ?auto_1868 ?auto_1867 ) ( SUPPORTS ?auto_1868 ?auto_1862 ) ( POWER_ON ?auto_1868 ) ( POINTING ?auto_1867 ?auto_1866 ) ( not ( = ?auto_1865 ?auto_1866 ) ) ( HAVE_IMAGE ?auto_1863 ?auto_1864 ) ( not ( = ?auto_1863 ?auto_1865 ) ) ( not ( = ?auto_1863 ?auto_1866 ) ) ( not ( = ?auto_1864 ?auto_1862 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1865 ?auto_1862 )
      ( GET-2IMAGE-VERIFY ?auto_1863 ?auto_1864 ?auto_1865 ?auto_1862 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1870 - DIRECTION
      ?auto_1871 - MODE
      ?auto_1872 - DIRECTION
      ?auto_1869 - MODE
    )
    :vars
    (
      ?auto_1874 - INSTRUMENT
      ?auto_1875 - SATELLITE
      ?auto_1873 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1874 ) ( ON_BOARD ?auto_1874 ?auto_1875 ) ( SUPPORTS ?auto_1874 ?auto_1871 ) ( POWER_ON ?auto_1874 ) ( POINTING ?auto_1875 ?auto_1873 ) ( not ( = ?auto_1870 ?auto_1873 ) ) ( HAVE_IMAGE ?auto_1872 ?auto_1869 ) ( not ( = ?auto_1872 ?auto_1870 ) ) ( not ( = ?auto_1872 ?auto_1873 ) ) ( not ( = ?auto_1869 ?auto_1871 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1872 ?auto_1869 ?auto_1870 ?auto_1871 )
      ( GET-2IMAGE-VERIFY ?auto_1870 ?auto_1871 ?auto_1872 ?auto_1869 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1885 - DIRECTION
      ?auto_1886 - MODE
    )
    :vars
    (
      ?auto_1890 - INSTRUMENT
      ?auto_1891 - SATELLITE
      ?auto_1889 - DIRECTION
      ?auto_1887 - DIRECTION
      ?auto_1888 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1890 ?auto_1891 ) ( SUPPORTS ?auto_1890 ?auto_1886 ) ( POWER_ON ?auto_1890 ) ( POINTING ?auto_1891 ?auto_1889 ) ( not ( = ?auto_1885 ?auto_1889 ) ) ( HAVE_IMAGE ?auto_1887 ?auto_1888 ) ( not ( = ?auto_1887 ?auto_1885 ) ) ( not ( = ?auto_1887 ?auto_1889 ) ) ( not ( = ?auto_1888 ?auto_1886 ) ) ( CALIBRATION_TARGET ?auto_1890 ?auto_1889 ) ( NOT_CALIBRATED ?auto_1890 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1891 ?auto_1890 ?auto_1889 )
      ( GET-2IMAGE ?auto_1887 ?auto_1888 ?auto_1885 ?auto_1886 )
      ( GET-1IMAGE-VERIFY ?auto_1885 ?auto_1886 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1893 - DIRECTION
      ?auto_1894 - MODE
      ?auto_1895 - DIRECTION
      ?auto_1892 - MODE
    )
    :vars
    (
      ?auto_1898 - INSTRUMENT
      ?auto_1897 - SATELLITE
      ?auto_1896 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1898 ?auto_1897 ) ( SUPPORTS ?auto_1898 ?auto_1892 ) ( POWER_ON ?auto_1898 ) ( POINTING ?auto_1897 ?auto_1896 ) ( not ( = ?auto_1895 ?auto_1896 ) ) ( HAVE_IMAGE ?auto_1893 ?auto_1894 ) ( not ( = ?auto_1893 ?auto_1895 ) ) ( not ( = ?auto_1893 ?auto_1896 ) ) ( not ( = ?auto_1894 ?auto_1892 ) ) ( CALIBRATION_TARGET ?auto_1898 ?auto_1896 ) ( NOT_CALIBRATED ?auto_1898 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1895 ?auto_1892 )
      ( GET-2IMAGE-VERIFY ?auto_1893 ?auto_1894 ?auto_1895 ?auto_1892 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1900 - DIRECTION
      ?auto_1901 - MODE
      ?auto_1902 - DIRECTION
      ?auto_1899 - MODE
    )
    :vars
    (
      ?auto_1903 - INSTRUMENT
      ?auto_1905 - SATELLITE
      ?auto_1904 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1903 ?auto_1905 ) ( SUPPORTS ?auto_1903 ?auto_1901 ) ( POWER_ON ?auto_1903 ) ( POINTING ?auto_1905 ?auto_1904 ) ( not ( = ?auto_1900 ?auto_1904 ) ) ( HAVE_IMAGE ?auto_1902 ?auto_1899 ) ( not ( = ?auto_1902 ?auto_1900 ) ) ( not ( = ?auto_1902 ?auto_1904 ) ) ( not ( = ?auto_1899 ?auto_1901 ) ) ( CALIBRATION_TARGET ?auto_1903 ?auto_1904 ) ( NOT_CALIBRATED ?auto_1903 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1902 ?auto_1899 ?auto_1900 ?auto_1901 )
      ( GET-2IMAGE-VERIFY ?auto_1900 ?auto_1901 ?auto_1902 ?auto_1899 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1915 - DIRECTION
      ?auto_1916 - MODE
    )
    :vars
    (
      ?auto_1917 - INSTRUMENT
      ?auto_1919 - SATELLITE
      ?auto_1918 - DIRECTION
      ?auto_1921 - DIRECTION
      ?auto_1920 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1917 ?auto_1919 ) ( SUPPORTS ?auto_1917 ?auto_1916 ) ( POINTING ?auto_1919 ?auto_1918 ) ( not ( = ?auto_1915 ?auto_1918 ) ) ( HAVE_IMAGE ?auto_1921 ?auto_1920 ) ( not ( = ?auto_1921 ?auto_1915 ) ) ( not ( = ?auto_1921 ?auto_1918 ) ) ( not ( = ?auto_1920 ?auto_1916 ) ) ( CALIBRATION_TARGET ?auto_1917 ?auto_1918 ) ( POWER_AVAIL ?auto_1919 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1917 ?auto_1919 )
      ( GET-2IMAGE ?auto_1921 ?auto_1920 ?auto_1915 ?auto_1916 )
      ( GET-1IMAGE-VERIFY ?auto_1915 ?auto_1916 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1923 - DIRECTION
      ?auto_1924 - MODE
      ?auto_1925 - DIRECTION
      ?auto_1922 - MODE
    )
    :vars
    (
      ?auto_1927 - INSTRUMENT
      ?auto_1928 - SATELLITE
      ?auto_1926 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1927 ?auto_1928 ) ( SUPPORTS ?auto_1927 ?auto_1922 ) ( POINTING ?auto_1928 ?auto_1926 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( HAVE_IMAGE ?auto_1923 ?auto_1924 ) ( not ( = ?auto_1923 ?auto_1925 ) ) ( not ( = ?auto_1923 ?auto_1926 ) ) ( not ( = ?auto_1924 ?auto_1922 ) ) ( CALIBRATION_TARGET ?auto_1927 ?auto_1926 ) ( POWER_AVAIL ?auto_1928 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1925 ?auto_1922 )
      ( GET-2IMAGE-VERIFY ?auto_1923 ?auto_1924 ?auto_1925 ?auto_1922 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1930 - DIRECTION
      ?auto_1931 - MODE
      ?auto_1932 - DIRECTION
      ?auto_1929 - MODE
    )
    :vars
    (
      ?auto_1935 - INSTRUMENT
      ?auto_1934 - SATELLITE
      ?auto_1933 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1935 ?auto_1934 ) ( SUPPORTS ?auto_1935 ?auto_1931 ) ( POINTING ?auto_1934 ?auto_1933 ) ( not ( = ?auto_1930 ?auto_1933 ) ) ( HAVE_IMAGE ?auto_1932 ?auto_1929 ) ( not ( = ?auto_1932 ?auto_1930 ) ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1929 ?auto_1931 ) ) ( CALIBRATION_TARGET ?auto_1935 ?auto_1933 ) ( POWER_AVAIL ?auto_1934 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1932 ?auto_1929 ?auto_1930 ?auto_1931 )
      ( GET-2IMAGE-VERIFY ?auto_1930 ?auto_1931 ?auto_1932 ?auto_1929 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1945 - DIRECTION
      ?auto_1946 - MODE
    )
    :vars
    (
      ?auto_1951 - INSTRUMENT
      ?auto_1949 - SATELLITE
      ?auto_1947 - DIRECTION
      ?auto_1948 - DIRECTION
      ?auto_1950 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_1951 ?auto_1949 ) ( SUPPORTS ?auto_1951 ?auto_1946 ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( HAVE_IMAGE ?auto_1948 ?auto_1950 ) ( not ( = ?auto_1948 ?auto_1945 ) ) ( not ( = ?auto_1948 ?auto_1947 ) ) ( not ( = ?auto_1950 ?auto_1946 ) ) ( CALIBRATION_TARGET ?auto_1951 ?auto_1947 ) ( POWER_AVAIL ?auto_1949 ) ( POINTING ?auto_1949 ?auto_1948 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1949 ?auto_1947 ?auto_1948 )
      ( GET-2IMAGE ?auto_1948 ?auto_1950 ?auto_1945 ?auto_1946 )
      ( GET-1IMAGE-VERIFY ?auto_1945 ?auto_1946 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1953 - DIRECTION
      ?auto_1954 - MODE
      ?auto_1955 - DIRECTION
      ?auto_1952 - MODE
    )
    :vars
    (
      ?auto_1957 - INSTRUMENT
      ?auto_1958 - SATELLITE
      ?auto_1956 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1957 ?auto_1958 ) ( SUPPORTS ?auto_1957 ?auto_1952 ) ( not ( = ?auto_1955 ?auto_1956 ) ) ( HAVE_IMAGE ?auto_1953 ?auto_1954 ) ( not ( = ?auto_1953 ?auto_1955 ) ) ( not ( = ?auto_1953 ?auto_1956 ) ) ( not ( = ?auto_1954 ?auto_1952 ) ) ( CALIBRATION_TARGET ?auto_1957 ?auto_1956 ) ( POWER_AVAIL ?auto_1958 ) ( POINTING ?auto_1958 ?auto_1953 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1955 ?auto_1952 )
      ( GET-2IMAGE-VERIFY ?auto_1953 ?auto_1954 ?auto_1955 ?auto_1952 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1960 - DIRECTION
      ?auto_1961 - MODE
      ?auto_1962 - DIRECTION
      ?auto_1959 - MODE
    )
    :vars
    (
      ?auto_1965 - INSTRUMENT
      ?auto_1964 - SATELLITE
      ?auto_1963 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1965 ?auto_1964 ) ( SUPPORTS ?auto_1965 ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1963 ) ) ( HAVE_IMAGE ?auto_1962 ?auto_1959 ) ( not ( = ?auto_1962 ?auto_1960 ) ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( CALIBRATION_TARGET ?auto_1965 ?auto_1963 ) ( POWER_AVAIL ?auto_1964 ) ( POINTING ?auto_1964 ?auto_1962 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1962 ?auto_1959 ?auto_1960 ?auto_1961 )
      ( GET-2IMAGE-VERIFY ?auto_1960 ?auto_1961 ?auto_1962 ?auto_1959 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1975 - DIRECTION
      ?auto_1976 - MODE
    )
    :vars
    (
      ?auto_1981 - INSTRUMENT
      ?auto_1978 - SATELLITE
      ?auto_1977 - DIRECTION
      ?auto_1980 - DIRECTION
      ?auto_1979 - MODE
      ?auto_1982 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1981 ?auto_1978 ) ( SUPPORTS ?auto_1981 ?auto_1976 ) ( not ( = ?auto_1975 ?auto_1977 ) ) ( HAVE_IMAGE ?auto_1980 ?auto_1979 ) ( not ( = ?auto_1980 ?auto_1975 ) ) ( not ( = ?auto_1980 ?auto_1977 ) ) ( not ( = ?auto_1979 ?auto_1976 ) ) ( CALIBRATION_TARGET ?auto_1981 ?auto_1977 ) ( POINTING ?auto_1978 ?auto_1980 ) ( ON_BOARD ?auto_1982 ?auto_1978 ) ( POWER_ON ?auto_1982 ) ( not ( = ?auto_1981 ?auto_1982 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1982 ?auto_1978 )
      ( GET-2IMAGE ?auto_1980 ?auto_1979 ?auto_1975 ?auto_1976 )
      ( GET-1IMAGE-VERIFY ?auto_1975 ?auto_1976 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1984 - DIRECTION
      ?auto_1985 - MODE
      ?auto_1986 - DIRECTION
      ?auto_1983 - MODE
    )
    :vars
    (
      ?auto_1990 - INSTRUMENT
      ?auto_1987 - SATELLITE
      ?auto_1989 - DIRECTION
      ?auto_1988 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1990 ?auto_1987 ) ( SUPPORTS ?auto_1990 ?auto_1983 ) ( not ( = ?auto_1986 ?auto_1989 ) ) ( HAVE_IMAGE ?auto_1984 ?auto_1985 ) ( not ( = ?auto_1984 ?auto_1986 ) ) ( not ( = ?auto_1984 ?auto_1989 ) ) ( not ( = ?auto_1985 ?auto_1983 ) ) ( CALIBRATION_TARGET ?auto_1990 ?auto_1989 ) ( POINTING ?auto_1987 ?auto_1984 ) ( ON_BOARD ?auto_1988 ?auto_1987 ) ( POWER_ON ?auto_1988 ) ( not ( = ?auto_1990 ?auto_1988 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1986 ?auto_1983 )
      ( GET-2IMAGE-VERIFY ?auto_1984 ?auto_1985 ?auto_1986 ?auto_1983 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1992 - DIRECTION
      ?auto_1993 - MODE
      ?auto_1994 - DIRECTION
      ?auto_1991 - MODE
    )
    :vars
    (
      ?auto_1998 - INSTRUMENT
      ?auto_1997 - SATELLITE
      ?auto_1996 - DIRECTION
      ?auto_1995 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1998 ?auto_1997 ) ( SUPPORTS ?auto_1998 ?auto_1993 ) ( not ( = ?auto_1992 ?auto_1996 ) ) ( HAVE_IMAGE ?auto_1994 ?auto_1991 ) ( not ( = ?auto_1994 ?auto_1992 ) ) ( not ( = ?auto_1994 ?auto_1996 ) ) ( not ( = ?auto_1991 ?auto_1993 ) ) ( CALIBRATION_TARGET ?auto_1998 ?auto_1996 ) ( POINTING ?auto_1997 ?auto_1994 ) ( ON_BOARD ?auto_1995 ?auto_1997 ) ( POWER_ON ?auto_1995 ) ( not ( = ?auto_1998 ?auto_1995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1994 ?auto_1991 ?auto_1992 ?auto_1993 )
      ( GET-2IMAGE-VERIFY ?auto_1992 ?auto_1993 ?auto_1994 ?auto_1991 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2009 - DIRECTION
      ?auto_2010 - MODE
    )
    :vars
    (
      ?auto_2014 - INSTRUMENT
      ?auto_2013 - SATELLITE
      ?auto_2012 - DIRECTION
      ?auto_2015 - DIRECTION
      ?auto_2016 - MODE
      ?auto_2011 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2014 ?auto_2013 ) ( SUPPORTS ?auto_2014 ?auto_2010 ) ( not ( = ?auto_2009 ?auto_2012 ) ) ( not ( = ?auto_2015 ?auto_2009 ) ) ( not ( = ?auto_2015 ?auto_2012 ) ) ( not ( = ?auto_2016 ?auto_2010 ) ) ( CALIBRATION_TARGET ?auto_2014 ?auto_2012 ) ( POINTING ?auto_2013 ?auto_2015 ) ( ON_BOARD ?auto_2011 ?auto_2013 ) ( POWER_ON ?auto_2011 ) ( not ( = ?auto_2014 ?auto_2011 ) ) ( CALIBRATED ?auto_2011 ) ( SUPPORTS ?auto_2011 ?auto_2016 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2015 ?auto_2016 )
      ( GET-2IMAGE ?auto_2015 ?auto_2016 ?auto_2009 ?auto_2010 )
      ( GET-1IMAGE-VERIFY ?auto_2009 ?auto_2010 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2018 - DIRECTION
      ?auto_2019 - MODE
      ?auto_2020 - DIRECTION
      ?auto_2017 - MODE
    )
    :vars
    (
      ?auto_2024 - INSTRUMENT
      ?auto_2022 - SATELLITE
      ?auto_2023 - DIRECTION
      ?auto_2021 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2024 ?auto_2022 ) ( SUPPORTS ?auto_2024 ?auto_2017 ) ( not ( = ?auto_2020 ?auto_2023 ) ) ( not ( = ?auto_2018 ?auto_2020 ) ) ( not ( = ?auto_2018 ?auto_2023 ) ) ( not ( = ?auto_2019 ?auto_2017 ) ) ( CALIBRATION_TARGET ?auto_2024 ?auto_2023 ) ( POINTING ?auto_2022 ?auto_2018 ) ( ON_BOARD ?auto_2021 ?auto_2022 ) ( POWER_ON ?auto_2021 ) ( not ( = ?auto_2024 ?auto_2021 ) ) ( CALIBRATED ?auto_2021 ) ( SUPPORTS ?auto_2021 ?auto_2019 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2020 ?auto_2017 )
      ( GET-2IMAGE-VERIFY ?auto_2018 ?auto_2019 ?auto_2020 ?auto_2017 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2026 - DIRECTION
      ?auto_2027 - MODE
      ?auto_2028 - DIRECTION
      ?auto_2025 - MODE
    )
    :vars
    (
      ?auto_2031 - INSTRUMENT
      ?auto_2030 - SATELLITE
      ?auto_2029 - DIRECTION
      ?auto_2032 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2031 ?auto_2030 ) ( SUPPORTS ?auto_2031 ?auto_2027 ) ( not ( = ?auto_2026 ?auto_2029 ) ) ( not ( = ?auto_2028 ?auto_2026 ) ) ( not ( = ?auto_2028 ?auto_2029 ) ) ( not ( = ?auto_2025 ?auto_2027 ) ) ( CALIBRATION_TARGET ?auto_2031 ?auto_2029 ) ( POINTING ?auto_2030 ?auto_2028 ) ( ON_BOARD ?auto_2032 ?auto_2030 ) ( POWER_ON ?auto_2032 ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( CALIBRATED ?auto_2032 ) ( SUPPORTS ?auto_2032 ?auto_2025 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2028 ?auto_2025 ?auto_2026 ?auto_2027 )
      ( GET-2IMAGE-VERIFY ?auto_2026 ?auto_2027 ?auto_2028 ?auto_2025 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2043 - DIRECTION
      ?auto_2044 - MODE
    )
    :vars
    (
      ?auto_2049 - INSTRUMENT
      ?auto_2048 - SATELLITE
      ?auto_2047 - DIRECTION
      ?auto_2046 - DIRECTION
      ?auto_2045 - MODE
      ?auto_2050 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2049 ?auto_2048 ) ( SUPPORTS ?auto_2049 ?auto_2044 ) ( not ( = ?auto_2043 ?auto_2047 ) ) ( not ( = ?auto_2046 ?auto_2043 ) ) ( not ( = ?auto_2046 ?auto_2047 ) ) ( not ( = ?auto_2045 ?auto_2044 ) ) ( CALIBRATION_TARGET ?auto_2049 ?auto_2047 ) ( ON_BOARD ?auto_2050 ?auto_2048 ) ( POWER_ON ?auto_2050 ) ( not ( = ?auto_2049 ?auto_2050 ) ) ( CALIBRATED ?auto_2050 ) ( SUPPORTS ?auto_2050 ?auto_2045 ) ( POINTING ?auto_2048 ?auto_2047 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2048 ?auto_2046 ?auto_2047 )
      ( GET-2IMAGE ?auto_2046 ?auto_2045 ?auto_2043 ?auto_2044 )
      ( GET-1IMAGE-VERIFY ?auto_2043 ?auto_2044 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2052 - DIRECTION
      ?auto_2053 - MODE
      ?auto_2054 - DIRECTION
      ?auto_2051 - MODE
    )
    :vars
    (
      ?auto_2056 - INSTRUMENT
      ?auto_2057 - SATELLITE
      ?auto_2055 - DIRECTION
      ?auto_2058 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2056 ?auto_2057 ) ( SUPPORTS ?auto_2056 ?auto_2051 ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( not ( = ?auto_2052 ?auto_2054 ) ) ( not ( = ?auto_2052 ?auto_2055 ) ) ( not ( = ?auto_2053 ?auto_2051 ) ) ( CALIBRATION_TARGET ?auto_2056 ?auto_2055 ) ( ON_BOARD ?auto_2058 ?auto_2057 ) ( POWER_ON ?auto_2058 ) ( not ( = ?auto_2056 ?auto_2058 ) ) ( CALIBRATED ?auto_2058 ) ( SUPPORTS ?auto_2058 ?auto_2053 ) ( POINTING ?auto_2057 ?auto_2055 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2054 ?auto_2051 )
      ( GET-2IMAGE-VERIFY ?auto_2052 ?auto_2053 ?auto_2054 ?auto_2051 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2060 - DIRECTION
      ?auto_2061 - MODE
      ?auto_2062 - DIRECTION
      ?auto_2059 - MODE
    )
    :vars
    (
      ?auto_2065 - INSTRUMENT
      ?auto_2066 - SATELLITE
      ?auto_2064 - DIRECTION
      ?auto_2063 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2065 ?auto_2066 ) ( SUPPORTS ?auto_2065 ?auto_2061 ) ( not ( = ?auto_2060 ?auto_2064 ) ) ( not ( = ?auto_2062 ?auto_2060 ) ) ( not ( = ?auto_2062 ?auto_2064 ) ) ( not ( = ?auto_2059 ?auto_2061 ) ) ( CALIBRATION_TARGET ?auto_2065 ?auto_2064 ) ( ON_BOARD ?auto_2063 ?auto_2066 ) ( POWER_ON ?auto_2063 ) ( not ( = ?auto_2065 ?auto_2063 ) ) ( CALIBRATED ?auto_2063 ) ( SUPPORTS ?auto_2063 ?auto_2059 ) ( POINTING ?auto_2066 ?auto_2064 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2062 ?auto_2059 ?auto_2060 ?auto_2061 )
      ( GET-2IMAGE-VERIFY ?auto_2060 ?auto_2061 ?auto_2062 ?auto_2059 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2077 - DIRECTION
      ?auto_2078 - MODE
    )
    :vars
    (
      ?auto_2081 - INSTRUMENT
      ?auto_2084 - SATELLITE
      ?auto_2080 - DIRECTION
      ?auto_2083 - DIRECTION
      ?auto_2082 - MODE
      ?auto_2079 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2081 ?auto_2084 ) ( SUPPORTS ?auto_2081 ?auto_2078 ) ( not ( = ?auto_2077 ?auto_2080 ) ) ( not ( = ?auto_2083 ?auto_2077 ) ) ( not ( = ?auto_2083 ?auto_2080 ) ) ( not ( = ?auto_2082 ?auto_2078 ) ) ( CALIBRATION_TARGET ?auto_2081 ?auto_2080 ) ( ON_BOARD ?auto_2079 ?auto_2084 ) ( POWER_ON ?auto_2079 ) ( not ( = ?auto_2081 ?auto_2079 ) ) ( SUPPORTS ?auto_2079 ?auto_2082 ) ( POINTING ?auto_2084 ?auto_2080 ) ( CALIBRATION_TARGET ?auto_2079 ?auto_2080 ) ( NOT_CALIBRATED ?auto_2079 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2084 ?auto_2079 ?auto_2080 )
      ( GET-2IMAGE ?auto_2083 ?auto_2082 ?auto_2077 ?auto_2078 )
      ( GET-1IMAGE-VERIFY ?auto_2077 ?auto_2078 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2086 - DIRECTION
      ?auto_2087 - MODE
      ?auto_2088 - DIRECTION
      ?auto_2085 - MODE
    )
    :vars
    (
      ?auto_2092 - INSTRUMENT
      ?auto_2091 - SATELLITE
      ?auto_2090 - DIRECTION
      ?auto_2089 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2092 ?auto_2091 ) ( SUPPORTS ?auto_2092 ?auto_2085 ) ( not ( = ?auto_2088 ?auto_2090 ) ) ( not ( = ?auto_2086 ?auto_2088 ) ) ( not ( = ?auto_2086 ?auto_2090 ) ) ( not ( = ?auto_2087 ?auto_2085 ) ) ( CALIBRATION_TARGET ?auto_2092 ?auto_2090 ) ( ON_BOARD ?auto_2089 ?auto_2091 ) ( POWER_ON ?auto_2089 ) ( not ( = ?auto_2092 ?auto_2089 ) ) ( SUPPORTS ?auto_2089 ?auto_2087 ) ( POINTING ?auto_2091 ?auto_2090 ) ( CALIBRATION_TARGET ?auto_2089 ?auto_2090 ) ( NOT_CALIBRATED ?auto_2089 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2088 ?auto_2085 )
      ( GET-2IMAGE-VERIFY ?auto_2086 ?auto_2087 ?auto_2088 ?auto_2085 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2094 - DIRECTION
      ?auto_2095 - MODE
      ?auto_2096 - DIRECTION
      ?auto_2093 - MODE
    )
    :vars
    (
      ?auto_2099 - INSTRUMENT
      ?auto_2100 - SATELLITE
      ?auto_2097 - DIRECTION
      ?auto_2098 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2099 ?auto_2100 ) ( SUPPORTS ?auto_2099 ?auto_2095 ) ( not ( = ?auto_2094 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2094 ) ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2093 ?auto_2095 ) ) ( CALIBRATION_TARGET ?auto_2099 ?auto_2097 ) ( ON_BOARD ?auto_2098 ?auto_2100 ) ( POWER_ON ?auto_2098 ) ( not ( = ?auto_2099 ?auto_2098 ) ) ( SUPPORTS ?auto_2098 ?auto_2093 ) ( POINTING ?auto_2100 ?auto_2097 ) ( CALIBRATION_TARGET ?auto_2098 ?auto_2097 ) ( NOT_CALIBRATED ?auto_2098 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2096 ?auto_2093 ?auto_2094 ?auto_2095 )
      ( GET-2IMAGE-VERIFY ?auto_2094 ?auto_2095 ?auto_2096 ?auto_2093 ) )
  )

)

