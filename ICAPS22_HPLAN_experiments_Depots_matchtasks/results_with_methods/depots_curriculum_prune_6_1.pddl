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
      ?auto_1815 - SURFACE
      ?auto_1816 - SURFACE
    )
    :vars
    (
      ?auto_1817 - HOIST
      ?auto_1818 - PLACE
      ?auto_1820 - PLACE
      ?auto_1821 - HOIST
      ?auto_1822 - SURFACE
      ?auto_1819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817 ?auto_1818 ) ( SURFACE-AT ?auto_1815 ?auto_1818 ) ( CLEAR ?auto_1815 ) ( IS-CRATE ?auto_1816 ) ( AVAILABLE ?auto_1817 ) ( not ( = ?auto_1820 ?auto_1818 ) ) ( HOIST-AT ?auto_1821 ?auto_1820 ) ( AVAILABLE ?auto_1821 ) ( SURFACE-AT ?auto_1816 ?auto_1820 ) ( ON ?auto_1816 ?auto_1822 ) ( CLEAR ?auto_1816 ) ( TRUCK-AT ?auto_1819 ?auto_1818 ) ( not ( = ?auto_1815 ?auto_1816 ) ) ( not ( = ?auto_1815 ?auto_1822 ) ) ( not ( = ?auto_1816 ?auto_1822 ) ) ( not ( = ?auto_1817 ?auto_1821 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1819 ?auto_1818 ?auto_1820 )
      ( !LIFT ?auto_1821 ?auto_1816 ?auto_1822 ?auto_1820 )
      ( !LOAD ?auto_1821 ?auto_1816 ?auto_1819 ?auto_1820 )
      ( !DRIVE ?auto_1819 ?auto_1820 ?auto_1818 )
      ( !UNLOAD ?auto_1817 ?auto_1816 ?auto_1819 ?auto_1818 )
      ( !DROP ?auto_1817 ?auto_1816 ?auto_1815 ?auto_1818 )
      ( MAKE-1CRATE-VERIFY ?auto_1815 ?auto_1816 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1836 - SURFACE
      ?auto_1837 - SURFACE
      ?auto_1838 - SURFACE
    )
    :vars
    (
      ?auto_1843 - HOIST
      ?auto_1842 - PLACE
      ?auto_1839 - PLACE
      ?auto_1841 - HOIST
      ?auto_1840 - SURFACE
      ?auto_1845 - SURFACE
      ?auto_1844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1843 ?auto_1842 ) ( IS-CRATE ?auto_1838 ) ( not ( = ?auto_1839 ?auto_1842 ) ) ( HOIST-AT ?auto_1841 ?auto_1839 ) ( SURFACE-AT ?auto_1838 ?auto_1839 ) ( ON ?auto_1838 ?auto_1840 ) ( CLEAR ?auto_1838 ) ( not ( = ?auto_1837 ?auto_1838 ) ) ( not ( = ?auto_1837 ?auto_1840 ) ) ( not ( = ?auto_1838 ?auto_1840 ) ) ( not ( = ?auto_1843 ?auto_1841 ) ) ( SURFACE-AT ?auto_1836 ?auto_1842 ) ( CLEAR ?auto_1836 ) ( IS-CRATE ?auto_1837 ) ( AVAILABLE ?auto_1843 ) ( AVAILABLE ?auto_1841 ) ( SURFACE-AT ?auto_1837 ?auto_1839 ) ( ON ?auto_1837 ?auto_1845 ) ( CLEAR ?auto_1837 ) ( TRUCK-AT ?auto_1844 ?auto_1842 ) ( not ( = ?auto_1836 ?auto_1837 ) ) ( not ( = ?auto_1836 ?auto_1845 ) ) ( not ( = ?auto_1837 ?auto_1845 ) ) ( not ( = ?auto_1836 ?auto_1838 ) ) ( not ( = ?auto_1836 ?auto_1840 ) ) ( not ( = ?auto_1838 ?auto_1845 ) ) ( not ( = ?auto_1840 ?auto_1845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1836 ?auto_1837 )
      ( MAKE-1CRATE ?auto_1837 ?auto_1838 )
      ( MAKE-2CRATE-VERIFY ?auto_1836 ?auto_1837 ?auto_1838 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1860 - SURFACE
      ?auto_1861 - SURFACE
      ?auto_1862 - SURFACE
      ?auto_1863 - SURFACE
    )
    :vars
    (
      ?auto_1864 - HOIST
      ?auto_1866 - PLACE
      ?auto_1868 - PLACE
      ?auto_1867 - HOIST
      ?auto_1869 - SURFACE
      ?auto_1870 - PLACE
      ?auto_1871 - HOIST
      ?auto_1873 - SURFACE
      ?auto_1872 - SURFACE
      ?auto_1865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1864 ?auto_1866 ) ( IS-CRATE ?auto_1863 ) ( not ( = ?auto_1868 ?auto_1866 ) ) ( HOIST-AT ?auto_1867 ?auto_1868 ) ( AVAILABLE ?auto_1867 ) ( SURFACE-AT ?auto_1863 ?auto_1868 ) ( ON ?auto_1863 ?auto_1869 ) ( CLEAR ?auto_1863 ) ( not ( = ?auto_1862 ?auto_1863 ) ) ( not ( = ?auto_1862 ?auto_1869 ) ) ( not ( = ?auto_1863 ?auto_1869 ) ) ( not ( = ?auto_1864 ?auto_1867 ) ) ( IS-CRATE ?auto_1862 ) ( not ( = ?auto_1870 ?auto_1866 ) ) ( HOIST-AT ?auto_1871 ?auto_1870 ) ( SURFACE-AT ?auto_1862 ?auto_1870 ) ( ON ?auto_1862 ?auto_1873 ) ( CLEAR ?auto_1862 ) ( not ( = ?auto_1861 ?auto_1862 ) ) ( not ( = ?auto_1861 ?auto_1873 ) ) ( not ( = ?auto_1862 ?auto_1873 ) ) ( not ( = ?auto_1864 ?auto_1871 ) ) ( SURFACE-AT ?auto_1860 ?auto_1866 ) ( CLEAR ?auto_1860 ) ( IS-CRATE ?auto_1861 ) ( AVAILABLE ?auto_1864 ) ( AVAILABLE ?auto_1871 ) ( SURFACE-AT ?auto_1861 ?auto_1870 ) ( ON ?auto_1861 ?auto_1872 ) ( CLEAR ?auto_1861 ) ( TRUCK-AT ?auto_1865 ?auto_1866 ) ( not ( = ?auto_1860 ?auto_1861 ) ) ( not ( = ?auto_1860 ?auto_1872 ) ) ( not ( = ?auto_1861 ?auto_1872 ) ) ( not ( = ?auto_1860 ?auto_1862 ) ) ( not ( = ?auto_1860 ?auto_1873 ) ) ( not ( = ?auto_1862 ?auto_1872 ) ) ( not ( = ?auto_1873 ?auto_1872 ) ) ( not ( = ?auto_1860 ?auto_1863 ) ) ( not ( = ?auto_1860 ?auto_1869 ) ) ( not ( = ?auto_1861 ?auto_1863 ) ) ( not ( = ?auto_1861 ?auto_1869 ) ) ( not ( = ?auto_1863 ?auto_1873 ) ) ( not ( = ?auto_1863 ?auto_1872 ) ) ( not ( = ?auto_1868 ?auto_1870 ) ) ( not ( = ?auto_1867 ?auto_1871 ) ) ( not ( = ?auto_1869 ?auto_1873 ) ) ( not ( = ?auto_1869 ?auto_1872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860 ?auto_1861 ?auto_1862 )
      ( MAKE-1CRATE ?auto_1862 ?auto_1863 )
      ( MAKE-3CRATE-VERIFY ?auto_1860 ?auto_1861 ?auto_1862 ?auto_1863 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1889 - SURFACE
      ?auto_1890 - SURFACE
      ?auto_1891 - SURFACE
      ?auto_1892 - SURFACE
      ?auto_1893 - SURFACE
    )
    :vars
    (
      ?auto_1897 - HOIST
      ?auto_1899 - PLACE
      ?auto_1894 - PLACE
      ?auto_1898 - HOIST
      ?auto_1895 - SURFACE
      ?auto_1902 - PLACE
      ?auto_1901 - HOIST
      ?auto_1900 - SURFACE
      ?auto_1904 - PLACE
      ?auto_1903 - HOIST
      ?auto_1905 - SURFACE
      ?auto_1906 - SURFACE
      ?auto_1896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1897 ?auto_1899 ) ( IS-CRATE ?auto_1893 ) ( not ( = ?auto_1894 ?auto_1899 ) ) ( HOIST-AT ?auto_1898 ?auto_1894 ) ( AVAILABLE ?auto_1898 ) ( SURFACE-AT ?auto_1893 ?auto_1894 ) ( ON ?auto_1893 ?auto_1895 ) ( CLEAR ?auto_1893 ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1895 ) ) ( not ( = ?auto_1893 ?auto_1895 ) ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( IS-CRATE ?auto_1892 ) ( not ( = ?auto_1902 ?auto_1899 ) ) ( HOIST-AT ?auto_1901 ?auto_1902 ) ( AVAILABLE ?auto_1901 ) ( SURFACE-AT ?auto_1892 ?auto_1902 ) ( ON ?auto_1892 ?auto_1900 ) ( CLEAR ?auto_1892 ) ( not ( = ?auto_1891 ?auto_1892 ) ) ( not ( = ?auto_1891 ?auto_1900 ) ) ( not ( = ?auto_1892 ?auto_1900 ) ) ( not ( = ?auto_1897 ?auto_1901 ) ) ( IS-CRATE ?auto_1891 ) ( not ( = ?auto_1904 ?auto_1899 ) ) ( HOIST-AT ?auto_1903 ?auto_1904 ) ( SURFACE-AT ?auto_1891 ?auto_1904 ) ( ON ?auto_1891 ?auto_1905 ) ( CLEAR ?auto_1891 ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( not ( = ?auto_1890 ?auto_1905 ) ) ( not ( = ?auto_1891 ?auto_1905 ) ) ( not ( = ?auto_1897 ?auto_1903 ) ) ( SURFACE-AT ?auto_1889 ?auto_1899 ) ( CLEAR ?auto_1889 ) ( IS-CRATE ?auto_1890 ) ( AVAILABLE ?auto_1897 ) ( AVAILABLE ?auto_1903 ) ( SURFACE-AT ?auto_1890 ?auto_1904 ) ( ON ?auto_1890 ?auto_1906 ) ( CLEAR ?auto_1890 ) ( TRUCK-AT ?auto_1896 ?auto_1899 ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1889 ?auto_1906 ) ) ( not ( = ?auto_1890 ?auto_1906 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) ( not ( = ?auto_1889 ?auto_1905 ) ) ( not ( = ?auto_1891 ?auto_1906 ) ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1889 ?auto_1900 ) ) ( not ( = ?auto_1890 ?auto_1892 ) ) ( not ( = ?auto_1890 ?auto_1900 ) ) ( not ( = ?auto_1892 ?auto_1905 ) ) ( not ( = ?auto_1892 ?auto_1906 ) ) ( not ( = ?auto_1902 ?auto_1904 ) ) ( not ( = ?auto_1901 ?auto_1903 ) ) ( not ( = ?auto_1900 ?auto_1905 ) ) ( not ( = ?auto_1900 ?auto_1906 ) ) ( not ( = ?auto_1889 ?auto_1893 ) ) ( not ( = ?auto_1889 ?auto_1895 ) ) ( not ( = ?auto_1890 ?auto_1893 ) ) ( not ( = ?auto_1890 ?auto_1895 ) ) ( not ( = ?auto_1891 ?auto_1893 ) ) ( not ( = ?auto_1891 ?auto_1895 ) ) ( not ( = ?auto_1893 ?auto_1900 ) ) ( not ( = ?auto_1893 ?auto_1905 ) ) ( not ( = ?auto_1893 ?auto_1906 ) ) ( not ( = ?auto_1894 ?auto_1902 ) ) ( not ( = ?auto_1894 ?auto_1904 ) ) ( not ( = ?auto_1898 ?auto_1901 ) ) ( not ( = ?auto_1898 ?auto_1903 ) ) ( not ( = ?auto_1895 ?auto_1900 ) ) ( not ( = ?auto_1895 ?auto_1905 ) ) ( not ( = ?auto_1895 ?auto_1906 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1889 ?auto_1890 ?auto_1891 ?auto_1892 )
      ( MAKE-1CRATE ?auto_1892 ?auto_1893 )
      ( MAKE-4CRATE-VERIFY ?auto_1889 ?auto_1890 ?auto_1891 ?auto_1892 ?auto_1893 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1923 - SURFACE
      ?auto_1924 - SURFACE
      ?auto_1925 - SURFACE
      ?auto_1926 - SURFACE
      ?auto_1927 - SURFACE
      ?auto_1928 - SURFACE
    )
    :vars
    (
      ?auto_1934 - HOIST
      ?auto_1933 - PLACE
      ?auto_1931 - PLACE
      ?auto_1932 - HOIST
      ?auto_1929 - SURFACE
      ?auto_1936 - PLACE
      ?auto_1938 - HOIST
      ?auto_1935 - SURFACE
      ?auto_1942 - SURFACE
      ?auto_1940 - PLACE
      ?auto_1939 - HOIST
      ?auto_1941 - SURFACE
      ?auto_1937 - SURFACE
      ?auto_1930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1934 ?auto_1933 ) ( IS-CRATE ?auto_1928 ) ( not ( = ?auto_1931 ?auto_1933 ) ) ( HOIST-AT ?auto_1932 ?auto_1931 ) ( SURFACE-AT ?auto_1928 ?auto_1931 ) ( ON ?auto_1928 ?auto_1929 ) ( CLEAR ?auto_1928 ) ( not ( = ?auto_1927 ?auto_1928 ) ) ( not ( = ?auto_1927 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1929 ) ) ( not ( = ?auto_1934 ?auto_1932 ) ) ( IS-CRATE ?auto_1927 ) ( not ( = ?auto_1936 ?auto_1933 ) ) ( HOIST-AT ?auto_1938 ?auto_1936 ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1927 ?auto_1936 ) ( ON ?auto_1927 ?auto_1935 ) ( CLEAR ?auto_1927 ) ( not ( = ?auto_1926 ?auto_1927 ) ) ( not ( = ?auto_1926 ?auto_1935 ) ) ( not ( = ?auto_1927 ?auto_1935 ) ) ( not ( = ?auto_1934 ?auto_1938 ) ) ( IS-CRATE ?auto_1926 ) ( AVAILABLE ?auto_1932 ) ( SURFACE-AT ?auto_1926 ?auto_1931 ) ( ON ?auto_1926 ?auto_1942 ) ( CLEAR ?auto_1926 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( not ( = ?auto_1925 ?auto_1942 ) ) ( not ( = ?auto_1926 ?auto_1942 ) ) ( IS-CRATE ?auto_1925 ) ( not ( = ?auto_1940 ?auto_1933 ) ) ( HOIST-AT ?auto_1939 ?auto_1940 ) ( SURFACE-AT ?auto_1925 ?auto_1940 ) ( ON ?auto_1925 ?auto_1941 ) ( CLEAR ?auto_1925 ) ( not ( = ?auto_1924 ?auto_1925 ) ) ( not ( = ?auto_1924 ?auto_1941 ) ) ( not ( = ?auto_1925 ?auto_1941 ) ) ( not ( = ?auto_1934 ?auto_1939 ) ) ( SURFACE-AT ?auto_1923 ?auto_1933 ) ( CLEAR ?auto_1923 ) ( IS-CRATE ?auto_1924 ) ( AVAILABLE ?auto_1934 ) ( AVAILABLE ?auto_1939 ) ( SURFACE-AT ?auto_1924 ?auto_1940 ) ( ON ?auto_1924 ?auto_1937 ) ( CLEAR ?auto_1924 ) ( TRUCK-AT ?auto_1930 ?auto_1933 ) ( not ( = ?auto_1923 ?auto_1924 ) ) ( not ( = ?auto_1923 ?auto_1937 ) ) ( not ( = ?auto_1924 ?auto_1937 ) ) ( not ( = ?auto_1923 ?auto_1925 ) ) ( not ( = ?auto_1923 ?auto_1941 ) ) ( not ( = ?auto_1925 ?auto_1937 ) ) ( not ( = ?auto_1941 ?auto_1937 ) ) ( not ( = ?auto_1923 ?auto_1926 ) ) ( not ( = ?auto_1923 ?auto_1942 ) ) ( not ( = ?auto_1924 ?auto_1926 ) ) ( not ( = ?auto_1924 ?auto_1942 ) ) ( not ( = ?auto_1926 ?auto_1941 ) ) ( not ( = ?auto_1926 ?auto_1937 ) ) ( not ( = ?auto_1931 ?auto_1940 ) ) ( not ( = ?auto_1932 ?auto_1939 ) ) ( not ( = ?auto_1942 ?auto_1941 ) ) ( not ( = ?auto_1942 ?auto_1937 ) ) ( not ( = ?auto_1923 ?auto_1927 ) ) ( not ( = ?auto_1923 ?auto_1935 ) ) ( not ( = ?auto_1924 ?auto_1927 ) ) ( not ( = ?auto_1924 ?auto_1935 ) ) ( not ( = ?auto_1925 ?auto_1927 ) ) ( not ( = ?auto_1925 ?auto_1935 ) ) ( not ( = ?auto_1927 ?auto_1942 ) ) ( not ( = ?auto_1927 ?auto_1941 ) ) ( not ( = ?auto_1927 ?auto_1937 ) ) ( not ( = ?auto_1936 ?auto_1931 ) ) ( not ( = ?auto_1936 ?auto_1940 ) ) ( not ( = ?auto_1938 ?auto_1932 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( not ( = ?auto_1935 ?auto_1942 ) ) ( not ( = ?auto_1935 ?auto_1941 ) ) ( not ( = ?auto_1935 ?auto_1937 ) ) ( not ( = ?auto_1923 ?auto_1928 ) ) ( not ( = ?auto_1923 ?auto_1929 ) ) ( not ( = ?auto_1924 ?auto_1928 ) ) ( not ( = ?auto_1924 ?auto_1929 ) ) ( not ( = ?auto_1925 ?auto_1928 ) ) ( not ( = ?auto_1925 ?auto_1929 ) ) ( not ( = ?auto_1926 ?auto_1928 ) ) ( not ( = ?auto_1926 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1935 ) ) ( not ( = ?auto_1928 ?auto_1942 ) ) ( not ( = ?auto_1928 ?auto_1941 ) ) ( not ( = ?auto_1928 ?auto_1937 ) ) ( not ( = ?auto_1929 ?auto_1935 ) ) ( not ( = ?auto_1929 ?auto_1942 ) ) ( not ( = ?auto_1929 ?auto_1941 ) ) ( not ( = ?auto_1929 ?auto_1937 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1923 ?auto_1924 ?auto_1925 ?auto_1926 ?auto_1927 )
      ( MAKE-1CRATE ?auto_1927 ?auto_1928 )
      ( MAKE-5CRATE-VERIFY ?auto_1923 ?auto_1924 ?auto_1925 ?auto_1926 ?auto_1927 ?auto_1928 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1960 - SURFACE
      ?auto_1961 - SURFACE
      ?auto_1962 - SURFACE
      ?auto_1963 - SURFACE
      ?auto_1964 - SURFACE
      ?auto_1965 - SURFACE
      ?auto_1966 - SURFACE
    )
    :vars
    (
      ?auto_1970 - HOIST
      ?auto_1972 - PLACE
      ?auto_1968 - PLACE
      ?auto_1969 - HOIST
      ?auto_1967 - SURFACE
      ?auto_1977 - SURFACE
      ?auto_1979 - PLACE
      ?auto_1974 - HOIST
      ?auto_1975 - SURFACE
      ?auto_1981 - SURFACE
      ?auto_1980 - PLACE
      ?auto_1973 - HOIST
      ?auto_1976 - SURFACE
      ?auto_1978 - SURFACE
      ?auto_1971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1970 ?auto_1972 ) ( IS-CRATE ?auto_1966 ) ( not ( = ?auto_1968 ?auto_1972 ) ) ( HOIST-AT ?auto_1969 ?auto_1968 ) ( SURFACE-AT ?auto_1966 ?auto_1968 ) ( ON ?auto_1966 ?auto_1967 ) ( CLEAR ?auto_1966 ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( not ( = ?auto_1965 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1970 ?auto_1969 ) ) ( IS-CRATE ?auto_1965 ) ( SURFACE-AT ?auto_1965 ?auto_1968 ) ( ON ?auto_1965 ?auto_1977 ) ( CLEAR ?auto_1965 ) ( not ( = ?auto_1964 ?auto_1965 ) ) ( not ( = ?auto_1964 ?auto_1977 ) ) ( not ( = ?auto_1965 ?auto_1977 ) ) ( IS-CRATE ?auto_1964 ) ( not ( = ?auto_1979 ?auto_1972 ) ) ( HOIST-AT ?auto_1974 ?auto_1979 ) ( AVAILABLE ?auto_1974 ) ( SURFACE-AT ?auto_1964 ?auto_1979 ) ( ON ?auto_1964 ?auto_1975 ) ( CLEAR ?auto_1964 ) ( not ( = ?auto_1963 ?auto_1964 ) ) ( not ( = ?auto_1963 ?auto_1975 ) ) ( not ( = ?auto_1964 ?auto_1975 ) ) ( not ( = ?auto_1970 ?auto_1974 ) ) ( IS-CRATE ?auto_1963 ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1963 ?auto_1968 ) ( ON ?auto_1963 ?auto_1981 ) ( CLEAR ?auto_1963 ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1962 ?auto_1981 ) ) ( not ( = ?auto_1963 ?auto_1981 ) ) ( IS-CRATE ?auto_1962 ) ( not ( = ?auto_1980 ?auto_1972 ) ) ( HOIST-AT ?auto_1973 ?auto_1980 ) ( SURFACE-AT ?auto_1962 ?auto_1980 ) ( ON ?auto_1962 ?auto_1976 ) ( CLEAR ?auto_1962 ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( not ( = ?auto_1961 ?auto_1976 ) ) ( not ( = ?auto_1962 ?auto_1976 ) ) ( not ( = ?auto_1970 ?auto_1973 ) ) ( SURFACE-AT ?auto_1960 ?auto_1972 ) ( CLEAR ?auto_1960 ) ( IS-CRATE ?auto_1961 ) ( AVAILABLE ?auto_1970 ) ( AVAILABLE ?auto_1973 ) ( SURFACE-AT ?auto_1961 ?auto_1980 ) ( ON ?auto_1961 ?auto_1978 ) ( CLEAR ?auto_1961 ) ( TRUCK-AT ?auto_1971 ?auto_1972 ) ( not ( = ?auto_1960 ?auto_1961 ) ) ( not ( = ?auto_1960 ?auto_1978 ) ) ( not ( = ?auto_1961 ?auto_1978 ) ) ( not ( = ?auto_1960 ?auto_1962 ) ) ( not ( = ?auto_1960 ?auto_1976 ) ) ( not ( = ?auto_1962 ?auto_1978 ) ) ( not ( = ?auto_1976 ?auto_1978 ) ) ( not ( = ?auto_1960 ?auto_1963 ) ) ( not ( = ?auto_1960 ?auto_1981 ) ) ( not ( = ?auto_1961 ?auto_1963 ) ) ( not ( = ?auto_1961 ?auto_1981 ) ) ( not ( = ?auto_1963 ?auto_1976 ) ) ( not ( = ?auto_1963 ?auto_1978 ) ) ( not ( = ?auto_1968 ?auto_1980 ) ) ( not ( = ?auto_1969 ?auto_1973 ) ) ( not ( = ?auto_1981 ?auto_1976 ) ) ( not ( = ?auto_1981 ?auto_1978 ) ) ( not ( = ?auto_1960 ?auto_1964 ) ) ( not ( = ?auto_1960 ?auto_1975 ) ) ( not ( = ?auto_1961 ?auto_1964 ) ) ( not ( = ?auto_1961 ?auto_1975 ) ) ( not ( = ?auto_1962 ?auto_1964 ) ) ( not ( = ?auto_1962 ?auto_1975 ) ) ( not ( = ?auto_1964 ?auto_1981 ) ) ( not ( = ?auto_1964 ?auto_1976 ) ) ( not ( = ?auto_1964 ?auto_1978 ) ) ( not ( = ?auto_1979 ?auto_1968 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1974 ?auto_1969 ) ) ( not ( = ?auto_1974 ?auto_1973 ) ) ( not ( = ?auto_1975 ?auto_1981 ) ) ( not ( = ?auto_1975 ?auto_1976 ) ) ( not ( = ?auto_1975 ?auto_1978 ) ) ( not ( = ?auto_1960 ?auto_1965 ) ) ( not ( = ?auto_1960 ?auto_1977 ) ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( not ( = ?auto_1961 ?auto_1977 ) ) ( not ( = ?auto_1962 ?auto_1965 ) ) ( not ( = ?auto_1962 ?auto_1977 ) ) ( not ( = ?auto_1963 ?auto_1965 ) ) ( not ( = ?auto_1963 ?auto_1977 ) ) ( not ( = ?auto_1965 ?auto_1975 ) ) ( not ( = ?auto_1965 ?auto_1981 ) ) ( not ( = ?auto_1965 ?auto_1976 ) ) ( not ( = ?auto_1965 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1975 ) ) ( not ( = ?auto_1977 ?auto_1981 ) ) ( not ( = ?auto_1977 ?auto_1976 ) ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1960 ?auto_1966 ) ) ( not ( = ?auto_1960 ?auto_1967 ) ) ( not ( = ?auto_1961 ?auto_1966 ) ) ( not ( = ?auto_1961 ?auto_1967 ) ) ( not ( = ?auto_1962 ?auto_1966 ) ) ( not ( = ?auto_1962 ?auto_1967 ) ) ( not ( = ?auto_1963 ?auto_1966 ) ) ( not ( = ?auto_1963 ?auto_1967 ) ) ( not ( = ?auto_1964 ?auto_1966 ) ) ( not ( = ?auto_1964 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1977 ) ) ( not ( = ?auto_1966 ?auto_1975 ) ) ( not ( = ?auto_1966 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1976 ) ) ( not ( = ?auto_1966 ?auto_1978 ) ) ( not ( = ?auto_1967 ?auto_1977 ) ) ( not ( = ?auto_1967 ?auto_1975 ) ) ( not ( = ?auto_1967 ?auto_1981 ) ) ( not ( = ?auto_1967 ?auto_1976 ) ) ( not ( = ?auto_1967 ?auto_1978 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1960 ?auto_1961 ?auto_1962 ?auto_1963 ?auto_1964 ?auto_1965 )
      ( MAKE-1CRATE ?auto_1965 ?auto_1966 )
      ( MAKE-6CRATE-VERIFY ?auto_1960 ?auto_1961 ?auto_1962 ?auto_1963 ?auto_1964 ?auto_1965 ?auto_1966 ) )
  )

)

