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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
    )
    :vars
    (
      ?auto_1844 - HOIST
      ?auto_1845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1844 ?auto_1845 ) ( SURFACE-AT ?auto_1842 ?auto_1845 ) ( CLEAR ?auto_1842 ) ( LIFTING ?auto_1844 ?auto_1843 ) ( IS-CRATE ?auto_1843 ) ( not ( = ?auto_1842 ?auto_1843 ) ) )
    :subtasks
    ( ( !DROP ?auto_1844 ?auto_1843 ?auto_1842 ?auto_1845 )
      ( MAKE-1CRATE-VERIFY ?auto_1842 ?auto_1843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1846 - SURFACE
      ?auto_1847 - SURFACE
    )
    :vars
    (
      ?auto_1849 - HOIST
      ?auto_1848 - PLACE
      ?auto_1850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1849 ?auto_1848 ) ( SURFACE-AT ?auto_1846 ?auto_1848 ) ( CLEAR ?auto_1846 ) ( IS-CRATE ?auto_1847 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( TRUCK-AT ?auto_1850 ?auto_1848 ) ( AVAILABLE ?auto_1849 ) ( IN ?auto_1847 ?auto_1850 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1849 ?auto_1847 ?auto_1850 ?auto_1848 )
      ( MAKE-1CRATE ?auto_1846 ?auto_1847 )
      ( MAKE-1CRATE-VERIFY ?auto_1846 ?auto_1847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1851 - SURFACE
      ?auto_1852 - SURFACE
    )
    :vars
    (
      ?auto_1853 - HOIST
      ?auto_1855 - PLACE
      ?auto_1854 - TRUCK
      ?auto_1856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1853 ?auto_1855 ) ( SURFACE-AT ?auto_1851 ?auto_1855 ) ( CLEAR ?auto_1851 ) ( IS-CRATE ?auto_1852 ) ( not ( = ?auto_1851 ?auto_1852 ) ) ( AVAILABLE ?auto_1853 ) ( IN ?auto_1852 ?auto_1854 ) ( TRUCK-AT ?auto_1854 ?auto_1856 ) ( not ( = ?auto_1856 ?auto_1855 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1854 ?auto_1856 ?auto_1855 )
      ( MAKE-1CRATE ?auto_1851 ?auto_1852 )
      ( MAKE-1CRATE-VERIFY ?auto_1851 ?auto_1852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1857 - SURFACE
      ?auto_1858 - SURFACE
    )
    :vars
    (
      ?auto_1859 - HOIST
      ?auto_1861 - PLACE
      ?auto_1862 - TRUCK
      ?auto_1860 - PLACE
      ?auto_1863 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859 ?auto_1861 ) ( SURFACE-AT ?auto_1857 ?auto_1861 ) ( CLEAR ?auto_1857 ) ( IS-CRATE ?auto_1858 ) ( not ( = ?auto_1857 ?auto_1858 ) ) ( AVAILABLE ?auto_1859 ) ( TRUCK-AT ?auto_1862 ?auto_1860 ) ( not ( = ?auto_1860 ?auto_1861 ) ) ( HOIST-AT ?auto_1863 ?auto_1860 ) ( LIFTING ?auto_1863 ?auto_1858 ) ( not ( = ?auto_1859 ?auto_1863 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1863 ?auto_1858 ?auto_1862 ?auto_1860 )
      ( MAKE-1CRATE ?auto_1857 ?auto_1858 )
      ( MAKE-1CRATE-VERIFY ?auto_1857 ?auto_1858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1864 - SURFACE
      ?auto_1865 - SURFACE
    )
    :vars
    (
      ?auto_1867 - HOIST
      ?auto_1869 - PLACE
      ?auto_1866 - TRUCK
      ?auto_1868 - PLACE
      ?auto_1870 - HOIST
      ?auto_1871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1867 ?auto_1869 ) ( SURFACE-AT ?auto_1864 ?auto_1869 ) ( CLEAR ?auto_1864 ) ( IS-CRATE ?auto_1865 ) ( not ( = ?auto_1864 ?auto_1865 ) ) ( AVAILABLE ?auto_1867 ) ( TRUCK-AT ?auto_1866 ?auto_1868 ) ( not ( = ?auto_1868 ?auto_1869 ) ) ( HOIST-AT ?auto_1870 ?auto_1868 ) ( not ( = ?auto_1867 ?auto_1870 ) ) ( AVAILABLE ?auto_1870 ) ( SURFACE-AT ?auto_1865 ?auto_1868 ) ( ON ?auto_1865 ?auto_1871 ) ( CLEAR ?auto_1865 ) ( not ( = ?auto_1864 ?auto_1871 ) ) ( not ( = ?auto_1865 ?auto_1871 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1870 ?auto_1865 ?auto_1871 ?auto_1868 )
      ( MAKE-1CRATE ?auto_1864 ?auto_1865 )
      ( MAKE-1CRATE-VERIFY ?auto_1864 ?auto_1865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1872 - SURFACE
      ?auto_1873 - SURFACE
    )
    :vars
    (
      ?auto_1876 - HOIST
      ?auto_1879 - PLACE
      ?auto_1874 - PLACE
      ?auto_1877 - HOIST
      ?auto_1875 - SURFACE
      ?auto_1878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876 ?auto_1879 ) ( SURFACE-AT ?auto_1872 ?auto_1879 ) ( CLEAR ?auto_1872 ) ( IS-CRATE ?auto_1873 ) ( not ( = ?auto_1872 ?auto_1873 ) ) ( AVAILABLE ?auto_1876 ) ( not ( = ?auto_1874 ?auto_1879 ) ) ( HOIST-AT ?auto_1877 ?auto_1874 ) ( not ( = ?auto_1876 ?auto_1877 ) ) ( AVAILABLE ?auto_1877 ) ( SURFACE-AT ?auto_1873 ?auto_1874 ) ( ON ?auto_1873 ?auto_1875 ) ( CLEAR ?auto_1873 ) ( not ( = ?auto_1872 ?auto_1875 ) ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( TRUCK-AT ?auto_1878 ?auto_1879 ) )
    :subtasks
    ( ( !DRIVE ?auto_1878 ?auto_1879 ?auto_1874 )
      ( MAKE-1CRATE ?auto_1872 ?auto_1873 )
      ( MAKE-1CRATE-VERIFY ?auto_1872 ?auto_1873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1889 - SURFACE
      ?auto_1890 - SURFACE
      ?auto_1891 - SURFACE
    )
    :vars
    (
      ?auto_1892 - HOIST
      ?auto_1893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1892 ?auto_1893 ) ( SURFACE-AT ?auto_1890 ?auto_1893 ) ( CLEAR ?auto_1890 ) ( LIFTING ?auto_1892 ?auto_1891 ) ( IS-CRATE ?auto_1891 ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( ON ?auto_1890 ?auto_1889 ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1890 ?auto_1891 )
      ( MAKE-2CRATE-VERIFY ?auto_1889 ?auto_1890 ?auto_1891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1899 - SURFACE
      ?auto_1900 - SURFACE
      ?auto_1901 - SURFACE
    )
    :vars
    (
      ?auto_1903 - HOIST
      ?auto_1904 - PLACE
      ?auto_1902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1903 ?auto_1904 ) ( SURFACE-AT ?auto_1900 ?auto_1904 ) ( CLEAR ?auto_1900 ) ( IS-CRATE ?auto_1901 ) ( not ( = ?auto_1900 ?auto_1901 ) ) ( TRUCK-AT ?auto_1902 ?auto_1904 ) ( AVAILABLE ?auto_1903 ) ( IN ?auto_1901 ?auto_1902 ) ( ON ?auto_1900 ?auto_1899 ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1901 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1900 ?auto_1901 )
      ( MAKE-2CRATE-VERIFY ?auto_1899 ?auto_1900 ?auto_1901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1905 - SURFACE
      ?auto_1906 - SURFACE
    )
    :vars
    (
      ?auto_1909 - HOIST
      ?auto_1907 - PLACE
      ?auto_1908 - TRUCK
      ?auto_1910 - SURFACE
      ?auto_1911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1909 ?auto_1907 ) ( SURFACE-AT ?auto_1905 ?auto_1907 ) ( CLEAR ?auto_1905 ) ( IS-CRATE ?auto_1906 ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( AVAILABLE ?auto_1909 ) ( IN ?auto_1906 ?auto_1908 ) ( ON ?auto_1905 ?auto_1910 ) ( not ( = ?auto_1910 ?auto_1905 ) ) ( not ( = ?auto_1910 ?auto_1906 ) ) ( TRUCK-AT ?auto_1908 ?auto_1911 ) ( not ( = ?auto_1911 ?auto_1907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1908 ?auto_1911 ?auto_1907 )
      ( MAKE-2CRATE ?auto_1910 ?auto_1905 ?auto_1906 )
      ( MAKE-1CRATE-VERIFY ?auto_1905 ?auto_1906 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1912 - SURFACE
      ?auto_1913 - SURFACE
      ?auto_1914 - SURFACE
    )
    :vars
    (
      ?auto_1918 - HOIST
      ?auto_1915 - PLACE
      ?auto_1916 - TRUCK
      ?auto_1917 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918 ?auto_1915 ) ( SURFACE-AT ?auto_1913 ?auto_1915 ) ( CLEAR ?auto_1913 ) ( IS-CRATE ?auto_1914 ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( AVAILABLE ?auto_1918 ) ( IN ?auto_1914 ?auto_1916 ) ( ON ?auto_1913 ?auto_1912 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( TRUCK-AT ?auto_1916 ?auto_1917 ) ( not ( = ?auto_1917 ?auto_1915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1913 ?auto_1914 )
      ( MAKE-2CRATE-VERIFY ?auto_1912 ?auto_1913 ?auto_1914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1919 - SURFACE
      ?auto_1920 - SURFACE
    )
    :vars
    (
      ?auto_1923 - HOIST
      ?auto_1925 - PLACE
      ?auto_1924 - SURFACE
      ?auto_1922 - TRUCK
      ?auto_1921 - PLACE
      ?auto_1926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1923 ?auto_1925 ) ( SURFACE-AT ?auto_1919 ?auto_1925 ) ( CLEAR ?auto_1919 ) ( IS-CRATE ?auto_1920 ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( AVAILABLE ?auto_1923 ) ( ON ?auto_1919 ?auto_1924 ) ( not ( = ?auto_1924 ?auto_1919 ) ) ( not ( = ?auto_1924 ?auto_1920 ) ) ( TRUCK-AT ?auto_1922 ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1925 ) ) ( HOIST-AT ?auto_1926 ?auto_1921 ) ( LIFTING ?auto_1926 ?auto_1920 ) ( not ( = ?auto_1923 ?auto_1926 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1926 ?auto_1920 ?auto_1922 ?auto_1921 )
      ( MAKE-2CRATE ?auto_1924 ?auto_1919 ?auto_1920 )
      ( MAKE-1CRATE-VERIFY ?auto_1919 ?auto_1920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1927 - SURFACE
      ?auto_1928 - SURFACE
      ?auto_1929 - SURFACE
    )
    :vars
    (
      ?auto_1931 - HOIST
      ?auto_1932 - PLACE
      ?auto_1930 - TRUCK
      ?auto_1933 - PLACE
      ?auto_1934 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1931 ?auto_1932 ) ( SURFACE-AT ?auto_1928 ?auto_1932 ) ( CLEAR ?auto_1928 ) ( IS-CRATE ?auto_1929 ) ( not ( = ?auto_1928 ?auto_1929 ) ) ( AVAILABLE ?auto_1931 ) ( ON ?auto_1928 ?auto_1927 ) ( not ( = ?auto_1927 ?auto_1928 ) ) ( not ( = ?auto_1927 ?auto_1929 ) ) ( TRUCK-AT ?auto_1930 ?auto_1933 ) ( not ( = ?auto_1933 ?auto_1932 ) ) ( HOIST-AT ?auto_1934 ?auto_1933 ) ( LIFTING ?auto_1934 ?auto_1929 ) ( not ( = ?auto_1931 ?auto_1934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1928 ?auto_1929 )
      ( MAKE-2CRATE-VERIFY ?auto_1927 ?auto_1928 ?auto_1929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1935 - SURFACE
      ?auto_1936 - SURFACE
    )
    :vars
    (
      ?auto_1940 - HOIST
      ?auto_1942 - PLACE
      ?auto_1941 - SURFACE
      ?auto_1939 - TRUCK
      ?auto_1937 - PLACE
      ?auto_1938 - HOIST
      ?auto_1943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1940 ?auto_1942 ) ( SURFACE-AT ?auto_1935 ?auto_1942 ) ( CLEAR ?auto_1935 ) ( IS-CRATE ?auto_1936 ) ( not ( = ?auto_1935 ?auto_1936 ) ) ( AVAILABLE ?auto_1940 ) ( ON ?auto_1935 ?auto_1941 ) ( not ( = ?auto_1941 ?auto_1935 ) ) ( not ( = ?auto_1941 ?auto_1936 ) ) ( TRUCK-AT ?auto_1939 ?auto_1937 ) ( not ( = ?auto_1937 ?auto_1942 ) ) ( HOIST-AT ?auto_1938 ?auto_1937 ) ( not ( = ?auto_1940 ?auto_1938 ) ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1936 ?auto_1937 ) ( ON ?auto_1936 ?auto_1943 ) ( CLEAR ?auto_1936 ) ( not ( = ?auto_1935 ?auto_1943 ) ) ( not ( = ?auto_1936 ?auto_1943 ) ) ( not ( = ?auto_1941 ?auto_1943 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1938 ?auto_1936 ?auto_1943 ?auto_1937 )
      ( MAKE-2CRATE ?auto_1941 ?auto_1935 ?auto_1936 )
      ( MAKE-1CRATE-VERIFY ?auto_1935 ?auto_1936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1944 - SURFACE
      ?auto_1945 - SURFACE
      ?auto_1946 - SURFACE
    )
    :vars
    (
      ?auto_1948 - HOIST
      ?auto_1949 - PLACE
      ?auto_1950 - TRUCK
      ?auto_1951 - PLACE
      ?auto_1952 - HOIST
      ?auto_1947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1948 ?auto_1949 ) ( SURFACE-AT ?auto_1945 ?auto_1949 ) ( CLEAR ?auto_1945 ) ( IS-CRATE ?auto_1946 ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( AVAILABLE ?auto_1948 ) ( ON ?auto_1945 ?auto_1944 ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1944 ?auto_1946 ) ) ( TRUCK-AT ?auto_1950 ?auto_1951 ) ( not ( = ?auto_1951 ?auto_1949 ) ) ( HOIST-AT ?auto_1952 ?auto_1951 ) ( not ( = ?auto_1948 ?auto_1952 ) ) ( AVAILABLE ?auto_1952 ) ( SURFACE-AT ?auto_1946 ?auto_1951 ) ( ON ?auto_1946 ?auto_1947 ) ( CLEAR ?auto_1946 ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( not ( = ?auto_1944 ?auto_1947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1945 ?auto_1946 )
      ( MAKE-2CRATE-VERIFY ?auto_1944 ?auto_1945 ?auto_1946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1953 - SURFACE
      ?auto_1954 - SURFACE
    )
    :vars
    (
      ?auto_1956 - HOIST
      ?auto_1957 - PLACE
      ?auto_1958 - SURFACE
      ?auto_1955 - PLACE
      ?auto_1959 - HOIST
      ?auto_1960 - SURFACE
      ?auto_1961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1956 ?auto_1957 ) ( SURFACE-AT ?auto_1953 ?auto_1957 ) ( CLEAR ?auto_1953 ) ( IS-CRATE ?auto_1954 ) ( not ( = ?auto_1953 ?auto_1954 ) ) ( AVAILABLE ?auto_1956 ) ( ON ?auto_1953 ?auto_1958 ) ( not ( = ?auto_1958 ?auto_1953 ) ) ( not ( = ?auto_1958 ?auto_1954 ) ) ( not ( = ?auto_1955 ?auto_1957 ) ) ( HOIST-AT ?auto_1959 ?auto_1955 ) ( not ( = ?auto_1956 ?auto_1959 ) ) ( AVAILABLE ?auto_1959 ) ( SURFACE-AT ?auto_1954 ?auto_1955 ) ( ON ?auto_1954 ?auto_1960 ) ( CLEAR ?auto_1954 ) ( not ( = ?auto_1953 ?auto_1960 ) ) ( not ( = ?auto_1954 ?auto_1960 ) ) ( not ( = ?auto_1958 ?auto_1960 ) ) ( TRUCK-AT ?auto_1961 ?auto_1957 ) )
    :subtasks
    ( ( !DRIVE ?auto_1961 ?auto_1957 ?auto_1955 )
      ( MAKE-2CRATE ?auto_1958 ?auto_1953 ?auto_1954 )
      ( MAKE-1CRATE-VERIFY ?auto_1953 ?auto_1954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1962 - SURFACE
      ?auto_1963 - SURFACE
      ?auto_1964 - SURFACE
    )
    :vars
    (
      ?auto_1966 - HOIST
      ?auto_1968 - PLACE
      ?auto_1965 - PLACE
      ?auto_1969 - HOIST
      ?auto_1967 - SURFACE
      ?auto_1970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966 ?auto_1968 ) ( SURFACE-AT ?auto_1963 ?auto_1968 ) ( CLEAR ?auto_1963 ) ( IS-CRATE ?auto_1964 ) ( not ( = ?auto_1963 ?auto_1964 ) ) ( AVAILABLE ?auto_1966 ) ( ON ?auto_1963 ?auto_1962 ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1962 ?auto_1964 ) ) ( not ( = ?auto_1965 ?auto_1968 ) ) ( HOIST-AT ?auto_1969 ?auto_1965 ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1964 ?auto_1965 ) ( ON ?auto_1964 ?auto_1967 ) ( CLEAR ?auto_1964 ) ( not ( = ?auto_1963 ?auto_1967 ) ) ( not ( = ?auto_1964 ?auto_1967 ) ) ( not ( = ?auto_1962 ?auto_1967 ) ) ( TRUCK-AT ?auto_1970 ?auto_1968 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1963 ?auto_1964 )
      ( MAKE-2CRATE-VERIFY ?auto_1962 ?auto_1963 ?auto_1964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1971 - SURFACE
      ?auto_1972 - SURFACE
    )
    :vars
    (
      ?auto_1976 - HOIST
      ?auto_1975 - PLACE
      ?auto_1973 - SURFACE
      ?auto_1974 - PLACE
      ?auto_1979 - HOIST
      ?auto_1977 - SURFACE
      ?auto_1978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1976 ?auto_1975 ) ( IS-CRATE ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1973 ?auto_1971 ) ) ( not ( = ?auto_1973 ?auto_1972 ) ) ( not ( = ?auto_1974 ?auto_1975 ) ) ( HOIST-AT ?auto_1979 ?auto_1974 ) ( not ( = ?auto_1976 ?auto_1979 ) ) ( AVAILABLE ?auto_1979 ) ( SURFACE-AT ?auto_1972 ?auto_1974 ) ( ON ?auto_1972 ?auto_1977 ) ( CLEAR ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1977 ) ) ( not ( = ?auto_1972 ?auto_1977 ) ) ( not ( = ?auto_1973 ?auto_1977 ) ) ( TRUCK-AT ?auto_1978 ?auto_1975 ) ( SURFACE-AT ?auto_1973 ?auto_1975 ) ( CLEAR ?auto_1973 ) ( LIFTING ?auto_1976 ?auto_1971 ) ( IS-CRATE ?auto_1971 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1973 ?auto_1971 )
      ( MAKE-2CRATE ?auto_1973 ?auto_1971 ?auto_1972 )
      ( MAKE-1CRATE-VERIFY ?auto_1971 ?auto_1972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1980 - SURFACE
      ?auto_1981 - SURFACE
      ?auto_1982 - SURFACE
    )
    :vars
    (
      ?auto_1984 - HOIST
      ?auto_1988 - PLACE
      ?auto_1985 - PLACE
      ?auto_1986 - HOIST
      ?auto_1987 - SURFACE
      ?auto_1983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1984 ?auto_1988 ) ( IS-CRATE ?auto_1982 ) ( not ( = ?auto_1981 ?auto_1982 ) ) ( not ( = ?auto_1980 ?auto_1981 ) ) ( not ( = ?auto_1980 ?auto_1982 ) ) ( not ( = ?auto_1985 ?auto_1988 ) ) ( HOIST-AT ?auto_1986 ?auto_1985 ) ( not ( = ?auto_1984 ?auto_1986 ) ) ( AVAILABLE ?auto_1986 ) ( SURFACE-AT ?auto_1982 ?auto_1985 ) ( ON ?auto_1982 ?auto_1987 ) ( CLEAR ?auto_1982 ) ( not ( = ?auto_1981 ?auto_1987 ) ) ( not ( = ?auto_1982 ?auto_1987 ) ) ( not ( = ?auto_1980 ?auto_1987 ) ) ( TRUCK-AT ?auto_1983 ?auto_1988 ) ( SURFACE-AT ?auto_1980 ?auto_1988 ) ( CLEAR ?auto_1980 ) ( LIFTING ?auto_1984 ?auto_1981 ) ( IS-CRATE ?auto_1981 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1981 ?auto_1982 )
      ( MAKE-2CRATE-VERIFY ?auto_1980 ?auto_1981 ?auto_1982 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1989 - SURFACE
      ?auto_1990 - SURFACE
    )
    :vars
    (
      ?auto_1997 - HOIST
      ?auto_1994 - PLACE
      ?auto_1996 - SURFACE
      ?auto_1991 - PLACE
      ?auto_1995 - HOIST
      ?auto_1993 - SURFACE
      ?auto_1992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1997 ?auto_1994 ) ( IS-CRATE ?auto_1990 ) ( not ( = ?auto_1989 ?auto_1990 ) ) ( not ( = ?auto_1996 ?auto_1989 ) ) ( not ( = ?auto_1996 ?auto_1990 ) ) ( not ( = ?auto_1991 ?auto_1994 ) ) ( HOIST-AT ?auto_1995 ?auto_1991 ) ( not ( = ?auto_1997 ?auto_1995 ) ) ( AVAILABLE ?auto_1995 ) ( SURFACE-AT ?auto_1990 ?auto_1991 ) ( ON ?auto_1990 ?auto_1993 ) ( CLEAR ?auto_1990 ) ( not ( = ?auto_1989 ?auto_1993 ) ) ( not ( = ?auto_1990 ?auto_1993 ) ) ( not ( = ?auto_1996 ?auto_1993 ) ) ( TRUCK-AT ?auto_1992 ?auto_1994 ) ( SURFACE-AT ?auto_1996 ?auto_1994 ) ( CLEAR ?auto_1996 ) ( IS-CRATE ?auto_1989 ) ( AVAILABLE ?auto_1997 ) ( IN ?auto_1989 ?auto_1992 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1997 ?auto_1989 ?auto_1992 ?auto_1994 )
      ( MAKE-2CRATE ?auto_1996 ?auto_1989 ?auto_1990 )
      ( MAKE-1CRATE-VERIFY ?auto_1989 ?auto_1990 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1998 - SURFACE
      ?auto_1999 - SURFACE
      ?auto_2000 - SURFACE
    )
    :vars
    (
      ?auto_2003 - HOIST
      ?auto_2002 - PLACE
      ?auto_2006 - PLACE
      ?auto_2001 - HOIST
      ?auto_2005 - SURFACE
      ?auto_2004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2003 ?auto_2002 ) ( IS-CRATE ?auto_2000 ) ( not ( = ?auto_1999 ?auto_2000 ) ) ( not ( = ?auto_1998 ?auto_1999 ) ) ( not ( = ?auto_1998 ?auto_2000 ) ) ( not ( = ?auto_2006 ?auto_2002 ) ) ( HOIST-AT ?auto_2001 ?auto_2006 ) ( not ( = ?auto_2003 ?auto_2001 ) ) ( AVAILABLE ?auto_2001 ) ( SURFACE-AT ?auto_2000 ?auto_2006 ) ( ON ?auto_2000 ?auto_2005 ) ( CLEAR ?auto_2000 ) ( not ( = ?auto_1999 ?auto_2005 ) ) ( not ( = ?auto_2000 ?auto_2005 ) ) ( not ( = ?auto_1998 ?auto_2005 ) ) ( TRUCK-AT ?auto_2004 ?auto_2002 ) ( SURFACE-AT ?auto_1998 ?auto_2002 ) ( CLEAR ?auto_1998 ) ( IS-CRATE ?auto_1999 ) ( AVAILABLE ?auto_2003 ) ( IN ?auto_1999 ?auto_2004 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1999 ?auto_2000 )
      ( MAKE-2CRATE-VERIFY ?auto_1998 ?auto_1999 ?auto_2000 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2043 - SURFACE
      ?auto_2044 - SURFACE
    )
    :vars
    (
      ?auto_2049 - HOIST
      ?auto_2045 - PLACE
      ?auto_2050 - SURFACE
      ?auto_2051 - PLACE
      ?auto_2047 - HOIST
      ?auto_2048 - SURFACE
      ?auto_2046 - TRUCK
      ?auto_2052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049 ?auto_2045 ) ( SURFACE-AT ?auto_2043 ?auto_2045 ) ( CLEAR ?auto_2043 ) ( IS-CRATE ?auto_2044 ) ( not ( = ?auto_2043 ?auto_2044 ) ) ( AVAILABLE ?auto_2049 ) ( ON ?auto_2043 ?auto_2050 ) ( not ( = ?auto_2050 ?auto_2043 ) ) ( not ( = ?auto_2050 ?auto_2044 ) ) ( not ( = ?auto_2051 ?auto_2045 ) ) ( HOIST-AT ?auto_2047 ?auto_2051 ) ( not ( = ?auto_2049 ?auto_2047 ) ) ( AVAILABLE ?auto_2047 ) ( SURFACE-AT ?auto_2044 ?auto_2051 ) ( ON ?auto_2044 ?auto_2048 ) ( CLEAR ?auto_2044 ) ( not ( = ?auto_2043 ?auto_2048 ) ) ( not ( = ?auto_2044 ?auto_2048 ) ) ( not ( = ?auto_2050 ?auto_2048 ) ) ( TRUCK-AT ?auto_2046 ?auto_2052 ) ( not ( = ?auto_2052 ?auto_2045 ) ) ( not ( = ?auto_2051 ?auto_2052 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2046 ?auto_2052 ?auto_2045 )
      ( MAKE-1CRATE ?auto_2043 ?auto_2044 )
      ( MAKE-1CRATE-VERIFY ?auto_2043 ?auto_2044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2083 - SURFACE
      ?auto_2084 - SURFACE
      ?auto_2085 - SURFACE
      ?auto_2082 - SURFACE
    )
    :vars
    (
      ?auto_2086 - HOIST
      ?auto_2087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2086 ?auto_2087 ) ( SURFACE-AT ?auto_2085 ?auto_2087 ) ( CLEAR ?auto_2085 ) ( LIFTING ?auto_2086 ?auto_2082 ) ( IS-CRATE ?auto_2082 ) ( not ( = ?auto_2085 ?auto_2082 ) ) ( ON ?auto_2084 ?auto_2083 ) ( ON ?auto_2085 ?auto_2084 ) ( not ( = ?auto_2083 ?auto_2084 ) ) ( not ( = ?auto_2083 ?auto_2085 ) ) ( not ( = ?auto_2083 ?auto_2082 ) ) ( not ( = ?auto_2084 ?auto_2085 ) ) ( not ( = ?auto_2084 ?auto_2082 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2085 ?auto_2082 )
      ( MAKE-3CRATE-VERIFY ?auto_2083 ?auto_2084 ?auto_2085 ?auto_2082 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2100 - SURFACE
      ?auto_2101 - SURFACE
      ?auto_2102 - SURFACE
      ?auto_2099 - SURFACE
    )
    :vars
    (
      ?auto_2104 - HOIST
      ?auto_2103 - PLACE
      ?auto_2105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2104 ?auto_2103 ) ( SURFACE-AT ?auto_2102 ?auto_2103 ) ( CLEAR ?auto_2102 ) ( IS-CRATE ?auto_2099 ) ( not ( = ?auto_2102 ?auto_2099 ) ) ( TRUCK-AT ?auto_2105 ?auto_2103 ) ( AVAILABLE ?auto_2104 ) ( IN ?auto_2099 ?auto_2105 ) ( ON ?auto_2102 ?auto_2101 ) ( not ( = ?auto_2101 ?auto_2102 ) ) ( not ( = ?auto_2101 ?auto_2099 ) ) ( ON ?auto_2101 ?auto_2100 ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2102 ) ) ( not ( = ?auto_2100 ?auto_2099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2101 ?auto_2102 ?auto_2099 )
      ( MAKE-3CRATE-VERIFY ?auto_2100 ?auto_2101 ?auto_2102 ?auto_2099 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2121 - SURFACE
      ?auto_2122 - SURFACE
      ?auto_2123 - SURFACE
      ?auto_2120 - SURFACE
    )
    :vars
    (
      ?auto_2124 - HOIST
      ?auto_2125 - PLACE
      ?auto_2126 - TRUCK
      ?auto_2127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2124 ?auto_2125 ) ( SURFACE-AT ?auto_2123 ?auto_2125 ) ( CLEAR ?auto_2123 ) ( IS-CRATE ?auto_2120 ) ( not ( = ?auto_2123 ?auto_2120 ) ) ( AVAILABLE ?auto_2124 ) ( IN ?auto_2120 ?auto_2126 ) ( ON ?auto_2123 ?auto_2122 ) ( not ( = ?auto_2122 ?auto_2123 ) ) ( not ( = ?auto_2122 ?auto_2120 ) ) ( TRUCK-AT ?auto_2126 ?auto_2127 ) ( not ( = ?auto_2127 ?auto_2125 ) ) ( ON ?auto_2122 ?auto_2121 ) ( not ( = ?auto_2121 ?auto_2122 ) ) ( not ( = ?auto_2121 ?auto_2123 ) ) ( not ( = ?auto_2121 ?auto_2120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2122 ?auto_2123 ?auto_2120 )
      ( MAKE-3CRATE-VERIFY ?auto_2121 ?auto_2122 ?auto_2123 ?auto_2120 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2145 - SURFACE
      ?auto_2146 - SURFACE
      ?auto_2147 - SURFACE
      ?auto_2144 - SURFACE
    )
    :vars
    (
      ?auto_2152 - HOIST
      ?auto_2149 - PLACE
      ?auto_2150 - TRUCK
      ?auto_2151 - PLACE
      ?auto_2148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2152 ?auto_2149 ) ( SURFACE-AT ?auto_2147 ?auto_2149 ) ( CLEAR ?auto_2147 ) ( IS-CRATE ?auto_2144 ) ( not ( = ?auto_2147 ?auto_2144 ) ) ( AVAILABLE ?auto_2152 ) ( ON ?auto_2147 ?auto_2146 ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( not ( = ?auto_2146 ?auto_2144 ) ) ( TRUCK-AT ?auto_2150 ?auto_2151 ) ( not ( = ?auto_2151 ?auto_2149 ) ) ( HOIST-AT ?auto_2148 ?auto_2151 ) ( LIFTING ?auto_2148 ?auto_2144 ) ( not ( = ?auto_2152 ?auto_2148 ) ) ( ON ?auto_2146 ?auto_2145 ) ( not ( = ?auto_2145 ?auto_2146 ) ) ( not ( = ?auto_2145 ?auto_2147 ) ) ( not ( = ?auto_2145 ?auto_2144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2146 ?auto_2147 ?auto_2144 )
      ( MAKE-3CRATE-VERIFY ?auto_2145 ?auto_2146 ?auto_2147 ?auto_2144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2172 - SURFACE
      ?auto_2173 - SURFACE
      ?auto_2174 - SURFACE
      ?auto_2171 - SURFACE
    )
    :vars
    (
      ?auto_2176 - HOIST
      ?auto_2178 - PLACE
      ?auto_2177 - TRUCK
      ?auto_2175 - PLACE
      ?auto_2179 - HOIST
      ?auto_2180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2176 ?auto_2178 ) ( SURFACE-AT ?auto_2174 ?auto_2178 ) ( CLEAR ?auto_2174 ) ( IS-CRATE ?auto_2171 ) ( not ( = ?auto_2174 ?auto_2171 ) ) ( AVAILABLE ?auto_2176 ) ( ON ?auto_2174 ?auto_2173 ) ( not ( = ?auto_2173 ?auto_2174 ) ) ( not ( = ?auto_2173 ?auto_2171 ) ) ( TRUCK-AT ?auto_2177 ?auto_2175 ) ( not ( = ?auto_2175 ?auto_2178 ) ) ( HOIST-AT ?auto_2179 ?auto_2175 ) ( not ( = ?auto_2176 ?auto_2179 ) ) ( AVAILABLE ?auto_2179 ) ( SURFACE-AT ?auto_2171 ?auto_2175 ) ( ON ?auto_2171 ?auto_2180 ) ( CLEAR ?auto_2171 ) ( not ( = ?auto_2174 ?auto_2180 ) ) ( not ( = ?auto_2171 ?auto_2180 ) ) ( not ( = ?auto_2173 ?auto_2180 ) ) ( ON ?auto_2173 ?auto_2172 ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( not ( = ?auto_2172 ?auto_2174 ) ) ( not ( = ?auto_2172 ?auto_2171 ) ) ( not ( = ?auto_2172 ?auto_2180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2173 ?auto_2174 ?auto_2171 )
      ( MAKE-3CRATE-VERIFY ?auto_2172 ?auto_2173 ?auto_2174 ?auto_2171 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2200 - SURFACE
      ?auto_2201 - SURFACE
      ?auto_2202 - SURFACE
      ?auto_2199 - SURFACE
    )
    :vars
    (
      ?auto_2203 - HOIST
      ?auto_2208 - PLACE
      ?auto_2205 - PLACE
      ?auto_2206 - HOIST
      ?auto_2207 - SURFACE
      ?auto_2204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2203 ?auto_2208 ) ( SURFACE-AT ?auto_2202 ?auto_2208 ) ( CLEAR ?auto_2202 ) ( IS-CRATE ?auto_2199 ) ( not ( = ?auto_2202 ?auto_2199 ) ) ( AVAILABLE ?auto_2203 ) ( ON ?auto_2202 ?auto_2201 ) ( not ( = ?auto_2201 ?auto_2202 ) ) ( not ( = ?auto_2201 ?auto_2199 ) ) ( not ( = ?auto_2205 ?auto_2208 ) ) ( HOIST-AT ?auto_2206 ?auto_2205 ) ( not ( = ?auto_2203 ?auto_2206 ) ) ( AVAILABLE ?auto_2206 ) ( SURFACE-AT ?auto_2199 ?auto_2205 ) ( ON ?auto_2199 ?auto_2207 ) ( CLEAR ?auto_2199 ) ( not ( = ?auto_2202 ?auto_2207 ) ) ( not ( = ?auto_2199 ?auto_2207 ) ) ( not ( = ?auto_2201 ?auto_2207 ) ) ( TRUCK-AT ?auto_2204 ?auto_2208 ) ( ON ?auto_2201 ?auto_2200 ) ( not ( = ?auto_2200 ?auto_2201 ) ) ( not ( = ?auto_2200 ?auto_2202 ) ) ( not ( = ?auto_2200 ?auto_2199 ) ) ( not ( = ?auto_2200 ?auto_2207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2201 ?auto_2202 ?auto_2199 )
      ( MAKE-3CRATE-VERIFY ?auto_2200 ?auto_2201 ?auto_2202 ?auto_2199 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2228 - SURFACE
      ?auto_2229 - SURFACE
      ?auto_2230 - SURFACE
      ?auto_2227 - SURFACE
    )
    :vars
    (
      ?auto_2234 - HOIST
      ?auto_2231 - PLACE
      ?auto_2236 - PLACE
      ?auto_2235 - HOIST
      ?auto_2233 - SURFACE
      ?auto_2232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234 ?auto_2231 ) ( IS-CRATE ?auto_2227 ) ( not ( = ?auto_2230 ?auto_2227 ) ) ( not ( = ?auto_2229 ?auto_2230 ) ) ( not ( = ?auto_2229 ?auto_2227 ) ) ( not ( = ?auto_2236 ?auto_2231 ) ) ( HOIST-AT ?auto_2235 ?auto_2236 ) ( not ( = ?auto_2234 ?auto_2235 ) ) ( AVAILABLE ?auto_2235 ) ( SURFACE-AT ?auto_2227 ?auto_2236 ) ( ON ?auto_2227 ?auto_2233 ) ( CLEAR ?auto_2227 ) ( not ( = ?auto_2230 ?auto_2233 ) ) ( not ( = ?auto_2227 ?auto_2233 ) ) ( not ( = ?auto_2229 ?auto_2233 ) ) ( TRUCK-AT ?auto_2232 ?auto_2231 ) ( SURFACE-AT ?auto_2229 ?auto_2231 ) ( CLEAR ?auto_2229 ) ( LIFTING ?auto_2234 ?auto_2230 ) ( IS-CRATE ?auto_2230 ) ( ON ?auto_2229 ?auto_2228 ) ( not ( = ?auto_2228 ?auto_2229 ) ) ( not ( = ?auto_2228 ?auto_2230 ) ) ( not ( = ?auto_2228 ?auto_2227 ) ) ( not ( = ?auto_2228 ?auto_2233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2229 ?auto_2230 ?auto_2227 )
      ( MAKE-3CRATE-VERIFY ?auto_2228 ?auto_2229 ?auto_2230 ?auto_2227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2256 - SURFACE
      ?auto_2257 - SURFACE
      ?auto_2258 - SURFACE
      ?auto_2255 - SURFACE
    )
    :vars
    (
      ?auto_2261 - HOIST
      ?auto_2262 - PLACE
      ?auto_2264 - PLACE
      ?auto_2259 - HOIST
      ?auto_2263 - SURFACE
      ?auto_2260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261 ?auto_2262 ) ( IS-CRATE ?auto_2255 ) ( not ( = ?auto_2258 ?auto_2255 ) ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( not ( = ?auto_2257 ?auto_2255 ) ) ( not ( = ?auto_2264 ?auto_2262 ) ) ( HOIST-AT ?auto_2259 ?auto_2264 ) ( not ( = ?auto_2261 ?auto_2259 ) ) ( AVAILABLE ?auto_2259 ) ( SURFACE-AT ?auto_2255 ?auto_2264 ) ( ON ?auto_2255 ?auto_2263 ) ( CLEAR ?auto_2255 ) ( not ( = ?auto_2258 ?auto_2263 ) ) ( not ( = ?auto_2255 ?auto_2263 ) ) ( not ( = ?auto_2257 ?auto_2263 ) ) ( TRUCK-AT ?auto_2260 ?auto_2262 ) ( SURFACE-AT ?auto_2257 ?auto_2262 ) ( CLEAR ?auto_2257 ) ( IS-CRATE ?auto_2258 ) ( AVAILABLE ?auto_2261 ) ( IN ?auto_2258 ?auto_2260 ) ( ON ?auto_2257 ?auto_2256 ) ( not ( = ?auto_2256 ?auto_2257 ) ) ( not ( = ?auto_2256 ?auto_2258 ) ) ( not ( = ?auto_2256 ?auto_2255 ) ) ( not ( = ?auto_2256 ?auto_2263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2257 ?auto_2258 ?auto_2255 )
      ( MAKE-3CRATE-VERIFY ?auto_2256 ?auto_2257 ?auto_2258 ?auto_2255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2440 - SURFACE
      ?auto_2441 - SURFACE
    )
    :vars
    (
      ?auto_2445 - HOIST
      ?auto_2446 - PLACE
      ?auto_2444 - SURFACE
      ?auto_2443 - TRUCK
      ?auto_2442 - PLACE
      ?auto_2447 - HOIST
      ?auto_2448 - SURFACE
      ?auto_2449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2445 ?auto_2446 ) ( SURFACE-AT ?auto_2440 ?auto_2446 ) ( CLEAR ?auto_2440 ) ( IS-CRATE ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2441 ) ) ( AVAILABLE ?auto_2445 ) ( ON ?auto_2440 ?auto_2444 ) ( not ( = ?auto_2444 ?auto_2440 ) ) ( not ( = ?auto_2444 ?auto_2441 ) ) ( TRUCK-AT ?auto_2443 ?auto_2442 ) ( not ( = ?auto_2442 ?auto_2446 ) ) ( HOIST-AT ?auto_2447 ?auto_2442 ) ( not ( = ?auto_2445 ?auto_2447 ) ) ( SURFACE-AT ?auto_2441 ?auto_2442 ) ( ON ?auto_2441 ?auto_2448 ) ( CLEAR ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2448 ) ) ( not ( = ?auto_2441 ?auto_2448 ) ) ( not ( = ?auto_2444 ?auto_2448 ) ) ( LIFTING ?auto_2447 ?auto_2449 ) ( IS-CRATE ?auto_2449 ) ( not ( = ?auto_2440 ?auto_2449 ) ) ( not ( = ?auto_2441 ?auto_2449 ) ) ( not ( = ?auto_2444 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2449 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2447 ?auto_2449 ?auto_2443 ?auto_2442 )
      ( MAKE-1CRATE ?auto_2440 ?auto_2441 )
      ( MAKE-1CRATE-VERIFY ?auto_2440 ?auto_2441 ) )
  )

)

