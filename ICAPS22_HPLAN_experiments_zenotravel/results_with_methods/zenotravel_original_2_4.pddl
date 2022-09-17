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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1750 - PERSON
      ?auto_1749 - CITY
    )
    :vars
    (
      ?auto_1751 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1750 ?auto_1751 ) ( AIRCRAFT-AT ?auto_1751 ?auto_1749 ) )
    :subtasks
    ( ( !DEBARK ?auto_1750 ?auto_1751 ?auto_1749 )
      ( FLY-1PPL-VERIFY ?auto_1750 ?auto_1749 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1757 - PERSON
      ?auto_1756 - CITY
    )
    :vars
    (
      ?auto_1758 - AIRCRAFT
      ?auto_1761 - CITY
      ?auto_1759 - FLEVEL
      ?auto_1760 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1757 ?auto_1758 ) ( AIRCRAFT-AT ?auto_1758 ?auto_1761 ) ( FUEL-LEVEL ?auto_1758 ?auto_1759 ) ( NEXT ?auto_1760 ?auto_1759 ) ( not ( = ?auto_1756 ?auto_1761 ) ) ( not ( = ?auto_1759 ?auto_1760 ) ) )
    :subtasks
    ( ( !FLY ?auto_1758 ?auto_1761 ?auto_1756 ?auto_1759 ?auto_1760 )
      ( FLY-1PPL ?auto_1757 ?auto_1756 )
      ( FLY-1PPL-VERIFY ?auto_1757 ?auto_1756 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1770 - PERSON
      ?auto_1769 - CITY
    )
    :vars
    (
      ?auto_1774 - AIRCRAFT
      ?auto_1772 - CITY
      ?auto_1773 - FLEVEL
      ?auto_1771 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1774 ?auto_1772 ) ( FUEL-LEVEL ?auto_1774 ?auto_1773 ) ( NEXT ?auto_1771 ?auto_1773 ) ( not ( = ?auto_1769 ?auto_1772 ) ) ( not ( = ?auto_1773 ?auto_1771 ) ) ( PERSON-AT ?auto_1770 ?auto_1772 ) )
    :subtasks
    ( ( !BOARD ?auto_1770 ?auto_1774 ?auto_1772 )
      ( FLY-1PPL ?auto_1770 ?auto_1769 )
      ( FLY-1PPL-VERIFY ?auto_1770 ?auto_1769 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1783 - PERSON
      ?auto_1782 - CITY
    )
    :vars
    (
      ?auto_1785 - AIRCRAFT
      ?auto_1787 - CITY
      ?auto_1786 - FLEVEL
      ?auto_1784 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1785 ?auto_1787 ) ( NEXT ?auto_1786 ?auto_1784 ) ( not ( = ?auto_1782 ?auto_1787 ) ) ( not ( = ?auto_1784 ?auto_1786 ) ) ( PERSON-AT ?auto_1783 ?auto_1787 ) ( FUEL-LEVEL ?auto_1785 ?auto_1786 ) )
    :subtasks
    ( ( !REFUEL ?auto_1785 ?auto_1787 ?auto_1786 ?auto_1784 )
      ( FLY-1PPL ?auto_1783 ?auto_1782 )
      ( FLY-1PPL-VERIFY ?auto_1783 ?auto_1782 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1796 - PERSON
      ?auto_1795 - CITY
    )
    :vars
    (
      ?auto_1797 - FLEVEL
      ?auto_1798 - FLEVEL
      ?auto_1800 - CITY
      ?auto_1799 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1797 ?auto_1798 ) ( not ( = ?auto_1795 ?auto_1800 ) ) ( not ( = ?auto_1798 ?auto_1797 ) ) ( PERSON-AT ?auto_1796 ?auto_1800 ) ( AIRCRAFT-AT ?auto_1799 ?auto_1795 ) ( FUEL-LEVEL ?auto_1799 ?auto_1798 ) )
    :subtasks
    ( ( !FLY ?auto_1799 ?auto_1795 ?auto_1800 ?auto_1798 ?auto_1797 )
      ( FLY-1PPL ?auto_1796 ?auto_1795 )
      ( FLY-1PPL-VERIFY ?auto_1796 ?auto_1795 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1809 - PERSON
      ?auto_1808 - CITY
    )
    :vars
    (
      ?auto_1811 - FLEVEL
      ?auto_1810 - FLEVEL
      ?auto_1813 - CITY
      ?auto_1812 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1811 ?auto_1810 ) ( not ( = ?auto_1808 ?auto_1813 ) ) ( not ( = ?auto_1810 ?auto_1811 ) ) ( PERSON-AT ?auto_1809 ?auto_1813 ) ( AIRCRAFT-AT ?auto_1812 ?auto_1808 ) ( FUEL-LEVEL ?auto_1812 ?auto_1811 ) )
    :subtasks
    ( ( !REFUEL ?auto_1812 ?auto_1808 ?auto_1811 ?auto_1810 )
      ( FLY-1PPL ?auto_1809 ?auto_1808 )
      ( FLY-1PPL-VERIFY ?auto_1809 ?auto_1808 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1833 - PERSON
      ?auto_1832 - CITY
    )
    :vars
    (
      ?auto_1834 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1833 ?auto_1834 ) ( AIRCRAFT-AT ?auto_1834 ?auto_1832 ) )
    :subtasks
    ( ( !DEBARK ?auto_1833 ?auto_1834 ?auto_1832 )
      ( FLY-1PPL-VERIFY ?auto_1833 ?auto_1832 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1836 - PERSON
      ?auto_1837 - PERSON
      ?auto_1835 - CITY
    )
    :vars
    (
      ?auto_1838 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1837 ?auto_1838 ) ( AIRCRAFT-AT ?auto_1838 ?auto_1835 ) ( PERSON-AT ?auto_1836 ?auto_1835 ) ( not ( = ?auto_1836 ?auto_1837 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1837 ?auto_1835 )
      ( FLY-2PPL-VERIFY ?auto_1836 ?auto_1837 ?auto_1835 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1840 - PERSON
      ?auto_1841 - PERSON
      ?auto_1839 - CITY
    )
    :vars
    (
      ?auto_1842 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1840 ?auto_1842 ) ( AIRCRAFT-AT ?auto_1842 ?auto_1839 ) ( PERSON-AT ?auto_1841 ?auto_1839 ) ( not ( = ?auto_1840 ?auto_1841 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1840 ?auto_1839 )
      ( FLY-2PPL-VERIFY ?auto_1840 ?auto_1841 ?auto_1839 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1848 - PERSON
      ?auto_1847 - CITY
    )
    :vars
    (
      ?auto_1849 - AIRCRAFT
      ?auto_1852 - CITY
      ?auto_1850 - FLEVEL
      ?auto_1851 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1848 ?auto_1849 ) ( AIRCRAFT-AT ?auto_1849 ?auto_1852 ) ( FUEL-LEVEL ?auto_1849 ?auto_1850 ) ( NEXT ?auto_1851 ?auto_1850 ) ( not ( = ?auto_1847 ?auto_1852 ) ) ( not ( = ?auto_1850 ?auto_1851 ) ) )
    :subtasks
    ( ( !FLY ?auto_1849 ?auto_1852 ?auto_1847 ?auto_1850 ?auto_1851 )
      ( FLY-1PPL ?auto_1848 ?auto_1847 )
      ( FLY-1PPL-VERIFY ?auto_1848 ?auto_1847 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1854 - PERSON
      ?auto_1855 - PERSON
      ?auto_1853 - CITY
    )
    :vars
    (
      ?auto_1859 - AIRCRAFT
      ?auto_1858 - CITY
      ?auto_1857 - FLEVEL
      ?auto_1856 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1855 ?auto_1859 ) ( AIRCRAFT-AT ?auto_1859 ?auto_1858 ) ( FUEL-LEVEL ?auto_1859 ?auto_1857 ) ( NEXT ?auto_1856 ?auto_1857 ) ( not ( = ?auto_1853 ?auto_1858 ) ) ( not ( = ?auto_1857 ?auto_1856 ) ) ( PERSON-AT ?auto_1854 ?auto_1853 ) ( not ( = ?auto_1854 ?auto_1855 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1855 ?auto_1853 )
      ( FLY-2PPL-VERIFY ?auto_1854 ?auto_1855 ?auto_1853 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1861 - PERSON
      ?auto_1862 - PERSON
      ?auto_1860 - CITY
    )
    :vars
    (
      ?auto_1866 - AIRCRAFT
      ?auto_1865 - CITY
      ?auto_1864 - FLEVEL
      ?auto_1863 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1861 ?auto_1866 ) ( AIRCRAFT-AT ?auto_1866 ?auto_1865 ) ( FUEL-LEVEL ?auto_1866 ?auto_1864 ) ( NEXT ?auto_1863 ?auto_1864 ) ( not ( = ?auto_1860 ?auto_1865 ) ) ( not ( = ?auto_1864 ?auto_1863 ) ) ( PERSON-AT ?auto_1862 ?auto_1860 ) ( not ( = ?auto_1862 ?auto_1861 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1862 ?auto_1861 ?auto_1860 )
      ( FLY-2PPL-VERIFY ?auto_1861 ?auto_1862 ?auto_1860 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1876 - PERSON
      ?auto_1875 - CITY
    )
    :vars
    (
      ?auto_1881 - AIRCRAFT
      ?auto_1880 - CITY
      ?auto_1879 - FLEVEL
      ?auto_1878 - FLEVEL
      ?auto_1877 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1881 ?auto_1880 ) ( FUEL-LEVEL ?auto_1881 ?auto_1879 ) ( NEXT ?auto_1878 ?auto_1879 ) ( not ( = ?auto_1875 ?auto_1880 ) ) ( not ( = ?auto_1879 ?auto_1878 ) ) ( PERSON-AT ?auto_1877 ?auto_1875 ) ( not ( = ?auto_1877 ?auto_1876 ) ) ( PERSON-AT ?auto_1876 ?auto_1880 ) )
    :subtasks
    ( ( !BOARD ?auto_1876 ?auto_1881 ?auto_1880 )
      ( FLY-2PPL ?auto_1877 ?auto_1876 ?auto_1875 )
      ( FLY-1PPL-VERIFY ?auto_1876 ?auto_1875 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1883 - PERSON
      ?auto_1884 - PERSON
      ?auto_1882 - CITY
    )
    :vars
    (
      ?auto_1887 - AIRCRAFT
      ?auto_1888 - CITY
      ?auto_1886 - FLEVEL
      ?auto_1885 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1887 ?auto_1888 ) ( FUEL-LEVEL ?auto_1887 ?auto_1886 ) ( NEXT ?auto_1885 ?auto_1886 ) ( not ( = ?auto_1882 ?auto_1888 ) ) ( not ( = ?auto_1886 ?auto_1885 ) ) ( PERSON-AT ?auto_1883 ?auto_1882 ) ( not ( = ?auto_1883 ?auto_1884 ) ) ( PERSON-AT ?auto_1884 ?auto_1888 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1884 ?auto_1882 )
      ( FLY-2PPL-VERIFY ?auto_1883 ?auto_1884 ?auto_1882 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1890 - PERSON
      ?auto_1891 - PERSON
      ?auto_1889 - CITY
    )
    :vars
    (
      ?auto_1894 - AIRCRAFT
      ?auto_1892 - CITY
      ?auto_1895 - FLEVEL
      ?auto_1893 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1894 ?auto_1892 ) ( FUEL-LEVEL ?auto_1894 ?auto_1895 ) ( NEXT ?auto_1893 ?auto_1895 ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1895 ?auto_1893 ) ) ( PERSON-AT ?auto_1891 ?auto_1889 ) ( not ( = ?auto_1891 ?auto_1890 ) ) ( PERSON-AT ?auto_1890 ?auto_1892 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1891 ?auto_1890 ?auto_1889 )
      ( FLY-2PPL-VERIFY ?auto_1890 ?auto_1891 ?auto_1889 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1905 - PERSON
      ?auto_1904 - CITY
    )
    :vars
    (
      ?auto_1909 - AIRCRAFT
      ?auto_1907 - CITY
      ?auto_1908 - FLEVEL
      ?auto_1910 - FLEVEL
      ?auto_1906 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1909 ?auto_1907 ) ( NEXT ?auto_1908 ?auto_1910 ) ( not ( = ?auto_1904 ?auto_1907 ) ) ( not ( = ?auto_1910 ?auto_1908 ) ) ( PERSON-AT ?auto_1906 ?auto_1904 ) ( not ( = ?auto_1906 ?auto_1905 ) ) ( PERSON-AT ?auto_1905 ?auto_1907 ) ( FUEL-LEVEL ?auto_1909 ?auto_1908 ) )
    :subtasks
    ( ( !REFUEL ?auto_1909 ?auto_1907 ?auto_1908 ?auto_1910 )
      ( FLY-2PPL ?auto_1906 ?auto_1905 ?auto_1904 )
      ( FLY-1PPL-VERIFY ?auto_1905 ?auto_1904 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1912 - PERSON
      ?auto_1913 - PERSON
      ?auto_1911 - CITY
    )
    :vars
    (
      ?auto_1917 - AIRCRAFT
      ?auto_1915 - CITY
      ?auto_1916 - FLEVEL
      ?auto_1914 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1917 ?auto_1915 ) ( NEXT ?auto_1916 ?auto_1914 ) ( not ( = ?auto_1911 ?auto_1915 ) ) ( not ( = ?auto_1914 ?auto_1916 ) ) ( PERSON-AT ?auto_1912 ?auto_1911 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( PERSON-AT ?auto_1913 ?auto_1915 ) ( FUEL-LEVEL ?auto_1917 ?auto_1916 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1913 ?auto_1911 )
      ( FLY-2PPL-VERIFY ?auto_1912 ?auto_1913 ?auto_1911 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1919 - PERSON
      ?auto_1920 - PERSON
      ?auto_1918 - CITY
    )
    :vars
    (
      ?auto_1921 - AIRCRAFT
      ?auto_1924 - CITY
      ?auto_1923 - FLEVEL
      ?auto_1922 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1921 ?auto_1924 ) ( NEXT ?auto_1923 ?auto_1922 ) ( not ( = ?auto_1918 ?auto_1924 ) ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( PERSON-AT ?auto_1920 ?auto_1918 ) ( not ( = ?auto_1920 ?auto_1919 ) ) ( PERSON-AT ?auto_1919 ?auto_1924 ) ( FUEL-LEVEL ?auto_1921 ?auto_1923 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1920 ?auto_1919 ?auto_1918 )
      ( FLY-2PPL-VERIFY ?auto_1919 ?auto_1920 ?auto_1918 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1934 - PERSON
      ?auto_1933 - CITY
    )
    :vars
    (
      ?auto_1938 - FLEVEL
      ?auto_1937 - FLEVEL
      ?auto_1939 - CITY
      ?auto_1936 - PERSON
      ?auto_1935 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1938 ?auto_1937 ) ( not ( = ?auto_1933 ?auto_1939 ) ) ( not ( = ?auto_1937 ?auto_1938 ) ) ( PERSON-AT ?auto_1936 ?auto_1933 ) ( not ( = ?auto_1936 ?auto_1934 ) ) ( PERSON-AT ?auto_1934 ?auto_1939 ) ( AIRCRAFT-AT ?auto_1935 ?auto_1933 ) ( FUEL-LEVEL ?auto_1935 ?auto_1937 ) )
    :subtasks
    ( ( !FLY ?auto_1935 ?auto_1933 ?auto_1939 ?auto_1937 ?auto_1938 )
      ( FLY-2PPL ?auto_1936 ?auto_1934 ?auto_1933 )
      ( FLY-1PPL-VERIFY ?auto_1934 ?auto_1933 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1941 - PERSON
      ?auto_1942 - PERSON
      ?auto_1940 - CITY
    )
    :vars
    (
      ?auto_1945 - FLEVEL
      ?auto_1946 - FLEVEL
      ?auto_1943 - CITY
      ?auto_1944 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1945 ?auto_1946 ) ( not ( = ?auto_1940 ?auto_1943 ) ) ( not ( = ?auto_1946 ?auto_1945 ) ) ( PERSON-AT ?auto_1941 ?auto_1940 ) ( not ( = ?auto_1941 ?auto_1942 ) ) ( PERSON-AT ?auto_1942 ?auto_1943 ) ( AIRCRAFT-AT ?auto_1944 ?auto_1940 ) ( FUEL-LEVEL ?auto_1944 ?auto_1946 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1942 ?auto_1940 )
      ( FLY-2PPL-VERIFY ?auto_1941 ?auto_1942 ?auto_1940 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1948 - PERSON
      ?auto_1949 - PERSON
      ?auto_1947 - CITY
    )
    :vars
    (
      ?auto_1952 - FLEVEL
      ?auto_1951 - FLEVEL
      ?auto_1953 - CITY
      ?auto_1950 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1952 ?auto_1951 ) ( not ( = ?auto_1947 ?auto_1953 ) ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( PERSON-AT ?auto_1949 ?auto_1947 ) ( not ( = ?auto_1949 ?auto_1948 ) ) ( PERSON-AT ?auto_1948 ?auto_1953 ) ( AIRCRAFT-AT ?auto_1950 ?auto_1947 ) ( FUEL-LEVEL ?auto_1950 ?auto_1951 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1949 ?auto_1948 ?auto_1947 )
      ( FLY-2PPL-VERIFY ?auto_1948 ?auto_1949 ?auto_1947 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1963 - PERSON
      ?auto_1962 - CITY
    )
    :vars
    (
      ?auto_1966 - FLEVEL
      ?auto_1965 - FLEVEL
      ?auto_1967 - CITY
      ?auto_1968 - PERSON
      ?auto_1964 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1966 ?auto_1965 ) ( not ( = ?auto_1962 ?auto_1967 ) ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( PERSON-AT ?auto_1968 ?auto_1962 ) ( not ( = ?auto_1968 ?auto_1963 ) ) ( PERSON-AT ?auto_1963 ?auto_1967 ) ( AIRCRAFT-AT ?auto_1964 ?auto_1962 ) ( FUEL-LEVEL ?auto_1964 ?auto_1966 ) )
    :subtasks
    ( ( !REFUEL ?auto_1964 ?auto_1962 ?auto_1966 ?auto_1965 )
      ( FLY-2PPL ?auto_1968 ?auto_1963 ?auto_1962 )
      ( FLY-1PPL-VERIFY ?auto_1963 ?auto_1962 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1970 - PERSON
      ?auto_1971 - PERSON
      ?auto_1969 - CITY
    )
    :vars
    (
      ?auto_1974 - FLEVEL
      ?auto_1972 - FLEVEL
      ?auto_1973 - CITY
      ?auto_1975 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1974 ?auto_1972 ) ( not ( = ?auto_1969 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1974 ) ) ( PERSON-AT ?auto_1970 ?auto_1969 ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( PERSON-AT ?auto_1971 ?auto_1973 ) ( AIRCRAFT-AT ?auto_1975 ?auto_1969 ) ( FUEL-LEVEL ?auto_1975 ?auto_1974 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1971 ?auto_1969 )
      ( FLY-2PPL-VERIFY ?auto_1970 ?auto_1971 ?auto_1969 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1977 - PERSON
      ?auto_1978 - PERSON
      ?auto_1976 - CITY
    )
    :vars
    (
      ?auto_1981 - FLEVEL
      ?auto_1979 - FLEVEL
      ?auto_1982 - CITY
      ?auto_1980 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1981 ?auto_1979 ) ( not ( = ?auto_1976 ?auto_1982 ) ) ( not ( = ?auto_1979 ?auto_1981 ) ) ( PERSON-AT ?auto_1978 ?auto_1976 ) ( not ( = ?auto_1978 ?auto_1977 ) ) ( PERSON-AT ?auto_1977 ?auto_1982 ) ( AIRCRAFT-AT ?auto_1980 ?auto_1976 ) ( FUEL-LEVEL ?auto_1980 ?auto_1981 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1978 ?auto_1977 ?auto_1976 )
      ( FLY-2PPL-VERIFY ?auto_1977 ?auto_1978 ?auto_1976 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1992 - PERSON
      ?auto_1991 - CITY
    )
    :vars
    (
      ?auto_1995 - FLEVEL
      ?auto_1993 - FLEVEL
      ?auto_1996 - CITY
      ?auto_1997 - PERSON
      ?auto_1994 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1995 ?auto_1993 ) ( not ( = ?auto_1991 ?auto_1996 ) ) ( not ( = ?auto_1993 ?auto_1995 ) ) ( not ( = ?auto_1997 ?auto_1992 ) ) ( PERSON-AT ?auto_1992 ?auto_1996 ) ( AIRCRAFT-AT ?auto_1994 ?auto_1991 ) ( FUEL-LEVEL ?auto_1994 ?auto_1995 ) ( IN ?auto_1997 ?auto_1994 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1997 ?auto_1991 )
      ( FLY-2PPL ?auto_1997 ?auto_1992 ?auto_1991 )
      ( FLY-1PPL-VERIFY ?auto_1992 ?auto_1991 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1999 - PERSON
      ?auto_2000 - PERSON
      ?auto_1998 - CITY
    )
    :vars
    (
      ?auto_2004 - FLEVEL
      ?auto_2003 - FLEVEL
      ?auto_2001 - CITY
      ?auto_2002 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2004 ?auto_2003 ) ( not ( = ?auto_1998 ?auto_2001 ) ) ( not ( = ?auto_2003 ?auto_2004 ) ) ( not ( = ?auto_1999 ?auto_2000 ) ) ( PERSON-AT ?auto_2000 ?auto_2001 ) ( AIRCRAFT-AT ?auto_2002 ?auto_1998 ) ( FUEL-LEVEL ?auto_2002 ?auto_2004 ) ( IN ?auto_1999 ?auto_2002 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2000 ?auto_1998 )
      ( FLY-2PPL-VERIFY ?auto_1999 ?auto_2000 ?auto_1998 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2006 - PERSON
      ?auto_2007 - PERSON
      ?auto_2005 - CITY
    )
    :vars
    (
      ?auto_2009 - FLEVEL
      ?auto_2011 - FLEVEL
      ?auto_2010 - CITY
      ?auto_2008 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2009 ?auto_2011 ) ( not ( = ?auto_2005 ?auto_2010 ) ) ( not ( = ?auto_2011 ?auto_2009 ) ) ( not ( = ?auto_2007 ?auto_2006 ) ) ( PERSON-AT ?auto_2006 ?auto_2010 ) ( AIRCRAFT-AT ?auto_2008 ?auto_2005 ) ( FUEL-LEVEL ?auto_2008 ?auto_2009 ) ( IN ?auto_2007 ?auto_2008 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2007 ?auto_2006 ?auto_2005 )
      ( FLY-2PPL-VERIFY ?auto_2006 ?auto_2007 ?auto_2005 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2021 - PERSON
      ?auto_2020 - CITY
    )
    :vars
    (
      ?auto_2024 - FLEVEL
      ?auto_2026 - FLEVEL
      ?auto_2025 - CITY
      ?auto_2023 - PERSON
      ?auto_2022 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2024 ?auto_2026 ) ( not ( = ?auto_2020 ?auto_2025 ) ) ( not ( = ?auto_2026 ?auto_2024 ) ) ( not ( = ?auto_2023 ?auto_2021 ) ) ( PERSON-AT ?auto_2021 ?auto_2025 ) ( IN ?auto_2023 ?auto_2022 ) ( AIRCRAFT-AT ?auto_2022 ?auto_2025 ) ( FUEL-LEVEL ?auto_2022 ?auto_2026 ) )
    :subtasks
    ( ( !FLY ?auto_2022 ?auto_2025 ?auto_2020 ?auto_2026 ?auto_2024 )
      ( FLY-2PPL ?auto_2023 ?auto_2021 ?auto_2020 )
      ( FLY-1PPL-VERIFY ?auto_2021 ?auto_2020 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2028 - PERSON
      ?auto_2029 - PERSON
      ?auto_2027 - CITY
    )
    :vars
    (
      ?auto_2030 - FLEVEL
      ?auto_2032 - FLEVEL
      ?auto_2031 - CITY
      ?auto_2033 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2030 ?auto_2032 ) ( not ( = ?auto_2027 ?auto_2031 ) ) ( not ( = ?auto_2032 ?auto_2030 ) ) ( not ( = ?auto_2028 ?auto_2029 ) ) ( PERSON-AT ?auto_2029 ?auto_2031 ) ( IN ?auto_2028 ?auto_2033 ) ( AIRCRAFT-AT ?auto_2033 ?auto_2031 ) ( FUEL-LEVEL ?auto_2033 ?auto_2032 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2029 ?auto_2027 )
      ( FLY-2PPL-VERIFY ?auto_2028 ?auto_2029 ?auto_2027 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2035 - PERSON
      ?auto_2036 - PERSON
      ?auto_2034 - CITY
    )
    :vars
    (
      ?auto_2040 - FLEVEL
      ?auto_2037 - FLEVEL
      ?auto_2039 - CITY
      ?auto_2038 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2040 ?auto_2037 ) ( not ( = ?auto_2034 ?auto_2039 ) ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( not ( = ?auto_2036 ?auto_2035 ) ) ( PERSON-AT ?auto_2035 ?auto_2039 ) ( IN ?auto_2036 ?auto_2038 ) ( AIRCRAFT-AT ?auto_2038 ?auto_2039 ) ( FUEL-LEVEL ?auto_2038 ?auto_2037 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2036 ?auto_2035 ?auto_2034 )
      ( FLY-2PPL-VERIFY ?auto_2035 ?auto_2036 ?auto_2034 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2050 - PERSON
      ?auto_2049 - CITY
    )
    :vars
    (
      ?auto_2055 - FLEVEL
      ?auto_2051 - FLEVEL
      ?auto_2054 - CITY
      ?auto_2052 - PERSON
      ?auto_2053 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2055 ?auto_2051 ) ( not ( = ?auto_2049 ?auto_2054 ) ) ( not ( = ?auto_2051 ?auto_2055 ) ) ( not ( = ?auto_2052 ?auto_2050 ) ) ( PERSON-AT ?auto_2050 ?auto_2054 ) ( AIRCRAFT-AT ?auto_2053 ?auto_2054 ) ( FUEL-LEVEL ?auto_2053 ?auto_2051 ) ( PERSON-AT ?auto_2052 ?auto_2054 ) )
    :subtasks
    ( ( !BOARD ?auto_2052 ?auto_2053 ?auto_2054 )
      ( FLY-2PPL ?auto_2052 ?auto_2050 ?auto_2049 )
      ( FLY-1PPL-VERIFY ?auto_2050 ?auto_2049 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2057 - PERSON
      ?auto_2058 - PERSON
      ?auto_2056 - CITY
    )
    :vars
    (
      ?auto_2060 - FLEVEL
      ?auto_2059 - FLEVEL
      ?auto_2062 - CITY
      ?auto_2061 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2060 ?auto_2059 ) ( not ( = ?auto_2056 ?auto_2062 ) ) ( not ( = ?auto_2059 ?auto_2060 ) ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( PERSON-AT ?auto_2058 ?auto_2062 ) ( AIRCRAFT-AT ?auto_2061 ?auto_2062 ) ( FUEL-LEVEL ?auto_2061 ?auto_2059 ) ( PERSON-AT ?auto_2057 ?auto_2062 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2058 ?auto_2056 )
      ( FLY-2PPL-VERIFY ?auto_2057 ?auto_2058 ?auto_2056 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2064 - PERSON
      ?auto_2065 - PERSON
      ?auto_2063 - CITY
    )
    :vars
    (
      ?auto_2067 - FLEVEL
      ?auto_2069 - FLEVEL
      ?auto_2066 - CITY
      ?auto_2068 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2067 ?auto_2069 ) ( not ( = ?auto_2063 ?auto_2066 ) ) ( not ( = ?auto_2069 ?auto_2067 ) ) ( not ( = ?auto_2065 ?auto_2064 ) ) ( PERSON-AT ?auto_2064 ?auto_2066 ) ( AIRCRAFT-AT ?auto_2068 ?auto_2066 ) ( FUEL-LEVEL ?auto_2068 ?auto_2069 ) ( PERSON-AT ?auto_2065 ?auto_2066 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2065 ?auto_2064 ?auto_2063 )
      ( FLY-2PPL-VERIFY ?auto_2064 ?auto_2065 ?auto_2063 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2079 - PERSON
      ?auto_2078 - CITY
    )
    :vars
    (
      ?auto_2081 - FLEVEL
      ?auto_2084 - FLEVEL
      ?auto_2080 - CITY
      ?auto_2082 - PERSON
      ?auto_2083 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2081 ?auto_2084 ) ( not ( = ?auto_2078 ?auto_2080 ) ) ( not ( = ?auto_2084 ?auto_2081 ) ) ( not ( = ?auto_2082 ?auto_2079 ) ) ( PERSON-AT ?auto_2079 ?auto_2080 ) ( AIRCRAFT-AT ?auto_2083 ?auto_2080 ) ( PERSON-AT ?auto_2082 ?auto_2080 ) ( FUEL-LEVEL ?auto_2083 ?auto_2081 ) )
    :subtasks
    ( ( !REFUEL ?auto_2083 ?auto_2080 ?auto_2081 ?auto_2084 )
      ( FLY-2PPL ?auto_2082 ?auto_2079 ?auto_2078 )
      ( FLY-1PPL-VERIFY ?auto_2079 ?auto_2078 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2086 - PERSON
      ?auto_2087 - PERSON
      ?auto_2085 - CITY
    )
    :vars
    (
      ?auto_2089 - FLEVEL
      ?auto_2091 - FLEVEL
      ?auto_2088 - CITY
      ?auto_2090 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2089 ?auto_2091 ) ( not ( = ?auto_2085 ?auto_2088 ) ) ( not ( = ?auto_2091 ?auto_2089 ) ) ( not ( = ?auto_2086 ?auto_2087 ) ) ( PERSON-AT ?auto_2087 ?auto_2088 ) ( AIRCRAFT-AT ?auto_2090 ?auto_2088 ) ( PERSON-AT ?auto_2086 ?auto_2088 ) ( FUEL-LEVEL ?auto_2090 ?auto_2089 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2087 ?auto_2085 )
      ( FLY-2PPL-VERIFY ?auto_2086 ?auto_2087 ?auto_2085 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2093 - PERSON
      ?auto_2094 - PERSON
      ?auto_2092 - CITY
    )
    :vars
    (
      ?auto_2096 - FLEVEL
      ?auto_2095 - FLEVEL
      ?auto_2098 - CITY
      ?auto_2097 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2096 ?auto_2095 ) ( not ( = ?auto_2092 ?auto_2098 ) ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2093 ) ) ( PERSON-AT ?auto_2093 ?auto_2098 ) ( AIRCRAFT-AT ?auto_2097 ?auto_2098 ) ( PERSON-AT ?auto_2094 ?auto_2098 ) ( FUEL-LEVEL ?auto_2097 ?auto_2096 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2094 ?auto_2093 ?auto_2092 )
      ( FLY-2PPL-VERIFY ?auto_2093 ?auto_2094 ?auto_2092 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2108 - PERSON
      ?auto_2107 - CITY
    )
    :vars
    (
      ?auto_2110 - FLEVEL
      ?auto_2109 - FLEVEL
      ?auto_2112 - CITY
      ?auto_2113 - PERSON
      ?auto_2111 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2110 ?auto_2109 ) ( not ( = ?auto_2107 ?auto_2112 ) ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( not ( = ?auto_2113 ?auto_2108 ) ) ( PERSON-AT ?auto_2108 ?auto_2112 ) ( PERSON-AT ?auto_2113 ?auto_2112 ) ( AIRCRAFT-AT ?auto_2111 ?auto_2107 ) ( FUEL-LEVEL ?auto_2111 ?auto_2109 ) )
    :subtasks
    ( ( !FLY ?auto_2111 ?auto_2107 ?auto_2112 ?auto_2109 ?auto_2110 )
      ( FLY-2PPL ?auto_2113 ?auto_2108 ?auto_2107 )
      ( FLY-1PPL-VERIFY ?auto_2108 ?auto_2107 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2115 - PERSON
      ?auto_2116 - PERSON
      ?auto_2114 - CITY
    )
    :vars
    (
      ?auto_2118 - FLEVEL
      ?auto_2120 - FLEVEL
      ?auto_2119 - CITY
      ?auto_2117 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2118 ?auto_2120 ) ( not ( = ?auto_2114 ?auto_2119 ) ) ( not ( = ?auto_2120 ?auto_2118 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( PERSON-AT ?auto_2116 ?auto_2119 ) ( PERSON-AT ?auto_2115 ?auto_2119 ) ( AIRCRAFT-AT ?auto_2117 ?auto_2114 ) ( FUEL-LEVEL ?auto_2117 ?auto_2120 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2116 ?auto_2114 )
      ( FLY-2PPL-VERIFY ?auto_2115 ?auto_2116 ?auto_2114 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2122 - PERSON
      ?auto_2123 - PERSON
      ?auto_2121 - CITY
    )
    :vars
    (
      ?auto_2125 - FLEVEL
      ?auto_2127 - FLEVEL
      ?auto_2124 - CITY
      ?auto_2126 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2125 ?auto_2127 ) ( not ( = ?auto_2121 ?auto_2124 ) ) ( not ( = ?auto_2127 ?auto_2125 ) ) ( not ( = ?auto_2123 ?auto_2122 ) ) ( PERSON-AT ?auto_2122 ?auto_2124 ) ( PERSON-AT ?auto_2123 ?auto_2124 ) ( AIRCRAFT-AT ?auto_2126 ?auto_2121 ) ( FUEL-LEVEL ?auto_2126 ?auto_2127 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2123 ?auto_2122 ?auto_2121 )
      ( FLY-2PPL-VERIFY ?auto_2122 ?auto_2123 ?auto_2121 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2137 - PERSON
      ?auto_2136 - CITY
    )
    :vars
    (
      ?auto_2139 - FLEVEL
      ?auto_2141 - FLEVEL
      ?auto_2138 - CITY
      ?auto_2142 - PERSON
      ?auto_2140 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2139 ?auto_2141 ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2141 ?auto_2139 ) ) ( not ( = ?auto_2142 ?auto_2137 ) ) ( PERSON-AT ?auto_2137 ?auto_2138 ) ( PERSON-AT ?auto_2142 ?auto_2138 ) ( AIRCRAFT-AT ?auto_2140 ?auto_2136 ) ( FUEL-LEVEL ?auto_2140 ?auto_2139 ) )
    :subtasks
    ( ( !REFUEL ?auto_2140 ?auto_2136 ?auto_2139 ?auto_2141 )
      ( FLY-2PPL ?auto_2142 ?auto_2137 ?auto_2136 )
      ( FLY-1PPL-VERIFY ?auto_2137 ?auto_2136 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2144 - PERSON
      ?auto_2145 - PERSON
      ?auto_2143 - CITY
    )
    :vars
    (
      ?auto_2148 - FLEVEL
      ?auto_2149 - FLEVEL
      ?auto_2147 - CITY
      ?auto_2146 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2148 ?auto_2149 ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( not ( = ?auto_2149 ?auto_2148 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( PERSON-AT ?auto_2145 ?auto_2147 ) ( PERSON-AT ?auto_2144 ?auto_2147 ) ( AIRCRAFT-AT ?auto_2146 ?auto_2143 ) ( FUEL-LEVEL ?auto_2146 ?auto_2148 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2145 ?auto_2143 )
      ( FLY-2PPL-VERIFY ?auto_2144 ?auto_2145 ?auto_2143 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2151 - PERSON
      ?auto_2152 - PERSON
      ?auto_2150 - CITY
    )
    :vars
    (
      ?auto_2154 - FLEVEL
      ?auto_2155 - FLEVEL
      ?auto_2153 - CITY
      ?auto_2156 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2154 ?auto_2155 ) ( not ( = ?auto_2150 ?auto_2153 ) ) ( not ( = ?auto_2155 ?auto_2154 ) ) ( not ( = ?auto_2152 ?auto_2151 ) ) ( PERSON-AT ?auto_2151 ?auto_2153 ) ( PERSON-AT ?auto_2152 ?auto_2153 ) ( AIRCRAFT-AT ?auto_2156 ?auto_2150 ) ( FUEL-LEVEL ?auto_2156 ?auto_2154 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2152 ?auto_2151 ?auto_2150 )
      ( FLY-2PPL-VERIFY ?auto_2151 ?auto_2152 ?auto_2150 ) )
  )

)

