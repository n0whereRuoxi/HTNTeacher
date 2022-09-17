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
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
    )
    :vars
    (
      ?auto_1844 - HOIST
      ?auto_1845 - PLACE
      ?auto_1847 - PLACE
      ?auto_1848 - HOIST
      ?auto_1849 - SURFACE
      ?auto_1846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1844 ?auto_1845 ) ( SURFACE-AT ?auto_1843 ?auto_1845 ) ( CLEAR ?auto_1843 ) ( IS-CRATE ?auto_1842 ) ( AVAILABLE ?auto_1844 ) ( not ( = ?auto_1847 ?auto_1845 ) ) ( HOIST-AT ?auto_1848 ?auto_1847 ) ( AVAILABLE ?auto_1848 ) ( SURFACE-AT ?auto_1842 ?auto_1847 ) ( ON ?auto_1842 ?auto_1849 ) ( CLEAR ?auto_1842 ) ( TRUCK-AT ?auto_1846 ?auto_1845 ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1849 ) ) ( not ( = ?auto_1843 ?auto_1849 ) ) ( not ( = ?auto_1844 ?auto_1848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1846 ?auto_1845 ?auto_1847 )
      ( !LIFT ?auto_1848 ?auto_1842 ?auto_1849 ?auto_1847 )
      ( !LOAD ?auto_1848 ?auto_1842 ?auto_1846 ?auto_1847 )
      ( !DRIVE ?auto_1846 ?auto_1847 ?auto_1845 )
      ( !UNLOAD ?auto_1844 ?auto_1842 ?auto_1846 ?auto_1845 )
      ( !DROP ?auto_1844 ?auto_1842 ?auto_1843 ?auto_1845 )
      ( MAKE-ON-VERIFY ?auto_1842 ?auto_1843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1852 - SURFACE
      ?auto_1853 - SURFACE
    )
    :vars
    (
      ?auto_1854 - HOIST
      ?auto_1855 - PLACE
      ?auto_1857 - PLACE
      ?auto_1858 - HOIST
      ?auto_1859 - SURFACE
      ?auto_1856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1854 ?auto_1855 ) ( SURFACE-AT ?auto_1853 ?auto_1855 ) ( CLEAR ?auto_1853 ) ( IS-CRATE ?auto_1852 ) ( AVAILABLE ?auto_1854 ) ( not ( = ?auto_1857 ?auto_1855 ) ) ( HOIST-AT ?auto_1858 ?auto_1857 ) ( AVAILABLE ?auto_1858 ) ( SURFACE-AT ?auto_1852 ?auto_1857 ) ( ON ?auto_1852 ?auto_1859 ) ( CLEAR ?auto_1852 ) ( TRUCK-AT ?auto_1856 ?auto_1855 ) ( not ( = ?auto_1852 ?auto_1853 ) ) ( not ( = ?auto_1852 ?auto_1859 ) ) ( not ( = ?auto_1853 ?auto_1859 ) ) ( not ( = ?auto_1854 ?auto_1858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1856 ?auto_1855 ?auto_1857 )
      ( !LIFT ?auto_1858 ?auto_1852 ?auto_1859 ?auto_1857 )
      ( !LOAD ?auto_1858 ?auto_1852 ?auto_1856 ?auto_1857 )
      ( !DRIVE ?auto_1856 ?auto_1857 ?auto_1855 )
      ( !UNLOAD ?auto_1854 ?auto_1852 ?auto_1856 ?auto_1855 )
      ( !DROP ?auto_1854 ?auto_1852 ?auto_1853 ?auto_1855 )
      ( MAKE-ON-VERIFY ?auto_1852 ?auto_1853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1862 - SURFACE
      ?auto_1863 - SURFACE
    )
    :vars
    (
      ?auto_1864 - HOIST
      ?auto_1865 - PLACE
      ?auto_1867 - PLACE
      ?auto_1868 - HOIST
      ?auto_1869 - SURFACE
      ?auto_1866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1864 ?auto_1865 ) ( SURFACE-AT ?auto_1863 ?auto_1865 ) ( CLEAR ?auto_1863 ) ( IS-CRATE ?auto_1862 ) ( AVAILABLE ?auto_1864 ) ( not ( = ?auto_1867 ?auto_1865 ) ) ( HOIST-AT ?auto_1868 ?auto_1867 ) ( AVAILABLE ?auto_1868 ) ( SURFACE-AT ?auto_1862 ?auto_1867 ) ( ON ?auto_1862 ?auto_1869 ) ( CLEAR ?auto_1862 ) ( TRUCK-AT ?auto_1866 ?auto_1865 ) ( not ( = ?auto_1862 ?auto_1863 ) ) ( not ( = ?auto_1862 ?auto_1869 ) ) ( not ( = ?auto_1863 ?auto_1869 ) ) ( not ( = ?auto_1864 ?auto_1868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1866 ?auto_1865 ?auto_1867 )
      ( !LIFT ?auto_1868 ?auto_1862 ?auto_1869 ?auto_1867 )
      ( !LOAD ?auto_1868 ?auto_1862 ?auto_1866 ?auto_1867 )
      ( !DRIVE ?auto_1866 ?auto_1867 ?auto_1865 )
      ( !UNLOAD ?auto_1864 ?auto_1862 ?auto_1866 ?auto_1865 )
      ( !DROP ?auto_1864 ?auto_1862 ?auto_1863 ?auto_1865 )
      ( MAKE-ON-VERIFY ?auto_1862 ?auto_1863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1872 - SURFACE
      ?auto_1873 - SURFACE
    )
    :vars
    (
      ?auto_1874 - HOIST
      ?auto_1875 - PLACE
      ?auto_1877 - PLACE
      ?auto_1878 - HOIST
      ?auto_1879 - SURFACE
      ?auto_1876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1874 ?auto_1875 ) ( SURFACE-AT ?auto_1873 ?auto_1875 ) ( CLEAR ?auto_1873 ) ( IS-CRATE ?auto_1872 ) ( AVAILABLE ?auto_1874 ) ( not ( = ?auto_1877 ?auto_1875 ) ) ( HOIST-AT ?auto_1878 ?auto_1877 ) ( AVAILABLE ?auto_1878 ) ( SURFACE-AT ?auto_1872 ?auto_1877 ) ( ON ?auto_1872 ?auto_1879 ) ( CLEAR ?auto_1872 ) ( TRUCK-AT ?auto_1876 ?auto_1875 ) ( not ( = ?auto_1872 ?auto_1873 ) ) ( not ( = ?auto_1872 ?auto_1879 ) ) ( not ( = ?auto_1873 ?auto_1879 ) ) ( not ( = ?auto_1874 ?auto_1878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1876 ?auto_1875 ?auto_1877 )
      ( !LIFT ?auto_1878 ?auto_1872 ?auto_1879 ?auto_1877 )
      ( !LOAD ?auto_1878 ?auto_1872 ?auto_1876 ?auto_1877 )
      ( !DRIVE ?auto_1876 ?auto_1877 ?auto_1875 )
      ( !UNLOAD ?auto_1874 ?auto_1872 ?auto_1876 ?auto_1875 )
      ( !DROP ?auto_1874 ?auto_1872 ?auto_1873 ?auto_1875 )
      ( MAKE-ON-VERIFY ?auto_1872 ?auto_1873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1882 - SURFACE
      ?auto_1883 - SURFACE
    )
    :vars
    (
      ?auto_1884 - HOIST
      ?auto_1885 - PLACE
      ?auto_1887 - PLACE
      ?auto_1888 - HOIST
      ?auto_1889 - SURFACE
      ?auto_1886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1884 ?auto_1885 ) ( SURFACE-AT ?auto_1883 ?auto_1885 ) ( CLEAR ?auto_1883 ) ( IS-CRATE ?auto_1882 ) ( AVAILABLE ?auto_1884 ) ( not ( = ?auto_1887 ?auto_1885 ) ) ( HOIST-AT ?auto_1888 ?auto_1887 ) ( AVAILABLE ?auto_1888 ) ( SURFACE-AT ?auto_1882 ?auto_1887 ) ( ON ?auto_1882 ?auto_1889 ) ( CLEAR ?auto_1882 ) ( TRUCK-AT ?auto_1886 ?auto_1885 ) ( not ( = ?auto_1882 ?auto_1883 ) ) ( not ( = ?auto_1882 ?auto_1889 ) ) ( not ( = ?auto_1883 ?auto_1889 ) ) ( not ( = ?auto_1884 ?auto_1888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1886 ?auto_1885 ?auto_1887 )
      ( !LIFT ?auto_1888 ?auto_1882 ?auto_1889 ?auto_1887 )
      ( !LOAD ?auto_1888 ?auto_1882 ?auto_1886 ?auto_1887 )
      ( !DRIVE ?auto_1886 ?auto_1887 ?auto_1885 )
      ( !UNLOAD ?auto_1884 ?auto_1882 ?auto_1886 ?auto_1885 )
      ( !DROP ?auto_1884 ?auto_1882 ?auto_1883 ?auto_1885 )
      ( MAKE-ON-VERIFY ?auto_1882 ?auto_1883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1892 - SURFACE
      ?auto_1893 - SURFACE
    )
    :vars
    (
      ?auto_1894 - HOIST
      ?auto_1895 - PLACE
      ?auto_1897 - PLACE
      ?auto_1898 - HOIST
      ?auto_1899 - SURFACE
      ?auto_1896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894 ?auto_1895 ) ( SURFACE-AT ?auto_1893 ?auto_1895 ) ( CLEAR ?auto_1893 ) ( IS-CRATE ?auto_1892 ) ( AVAILABLE ?auto_1894 ) ( not ( = ?auto_1897 ?auto_1895 ) ) ( HOIST-AT ?auto_1898 ?auto_1897 ) ( AVAILABLE ?auto_1898 ) ( SURFACE-AT ?auto_1892 ?auto_1897 ) ( ON ?auto_1892 ?auto_1899 ) ( CLEAR ?auto_1892 ) ( TRUCK-AT ?auto_1896 ?auto_1895 ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1899 ) ) ( not ( = ?auto_1893 ?auto_1899 ) ) ( not ( = ?auto_1894 ?auto_1898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1896 ?auto_1895 ?auto_1897 )
      ( !LIFT ?auto_1898 ?auto_1892 ?auto_1899 ?auto_1897 )
      ( !LOAD ?auto_1898 ?auto_1892 ?auto_1896 ?auto_1897 )
      ( !DRIVE ?auto_1896 ?auto_1897 ?auto_1895 )
      ( !UNLOAD ?auto_1894 ?auto_1892 ?auto_1896 ?auto_1895 )
      ( !DROP ?auto_1894 ?auto_1892 ?auto_1893 ?auto_1895 )
      ( MAKE-ON-VERIFY ?auto_1892 ?auto_1893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1902 - SURFACE
      ?auto_1903 - SURFACE
    )
    :vars
    (
      ?auto_1904 - HOIST
      ?auto_1905 - PLACE
      ?auto_1907 - PLACE
      ?auto_1908 - HOIST
      ?auto_1909 - SURFACE
      ?auto_1906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1904 ?auto_1905 ) ( SURFACE-AT ?auto_1903 ?auto_1905 ) ( CLEAR ?auto_1903 ) ( IS-CRATE ?auto_1902 ) ( AVAILABLE ?auto_1904 ) ( not ( = ?auto_1907 ?auto_1905 ) ) ( HOIST-AT ?auto_1908 ?auto_1907 ) ( AVAILABLE ?auto_1908 ) ( SURFACE-AT ?auto_1902 ?auto_1907 ) ( ON ?auto_1902 ?auto_1909 ) ( CLEAR ?auto_1902 ) ( TRUCK-AT ?auto_1906 ?auto_1905 ) ( not ( = ?auto_1902 ?auto_1903 ) ) ( not ( = ?auto_1902 ?auto_1909 ) ) ( not ( = ?auto_1903 ?auto_1909 ) ) ( not ( = ?auto_1904 ?auto_1908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1906 ?auto_1905 ?auto_1907 )
      ( !LIFT ?auto_1908 ?auto_1902 ?auto_1909 ?auto_1907 )
      ( !LOAD ?auto_1908 ?auto_1902 ?auto_1906 ?auto_1907 )
      ( !DRIVE ?auto_1906 ?auto_1907 ?auto_1905 )
      ( !UNLOAD ?auto_1904 ?auto_1902 ?auto_1906 ?auto_1905 )
      ( !DROP ?auto_1904 ?auto_1902 ?auto_1903 ?auto_1905 )
      ( MAKE-ON-VERIFY ?auto_1902 ?auto_1903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1912 - SURFACE
      ?auto_1913 - SURFACE
    )
    :vars
    (
      ?auto_1914 - HOIST
      ?auto_1915 - PLACE
      ?auto_1917 - PLACE
      ?auto_1918 - HOIST
      ?auto_1919 - SURFACE
      ?auto_1916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1914 ?auto_1915 ) ( SURFACE-AT ?auto_1913 ?auto_1915 ) ( CLEAR ?auto_1913 ) ( IS-CRATE ?auto_1912 ) ( AVAILABLE ?auto_1914 ) ( not ( = ?auto_1917 ?auto_1915 ) ) ( HOIST-AT ?auto_1918 ?auto_1917 ) ( AVAILABLE ?auto_1918 ) ( SURFACE-AT ?auto_1912 ?auto_1917 ) ( ON ?auto_1912 ?auto_1919 ) ( CLEAR ?auto_1912 ) ( TRUCK-AT ?auto_1916 ?auto_1915 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1919 ) ) ( not ( = ?auto_1913 ?auto_1919 ) ) ( not ( = ?auto_1914 ?auto_1918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1916 ?auto_1915 ?auto_1917 )
      ( !LIFT ?auto_1918 ?auto_1912 ?auto_1919 ?auto_1917 )
      ( !LOAD ?auto_1918 ?auto_1912 ?auto_1916 ?auto_1917 )
      ( !DRIVE ?auto_1916 ?auto_1917 ?auto_1915 )
      ( !UNLOAD ?auto_1914 ?auto_1912 ?auto_1916 ?auto_1915 )
      ( !DROP ?auto_1914 ?auto_1912 ?auto_1913 ?auto_1915 )
      ( MAKE-ON-VERIFY ?auto_1912 ?auto_1913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1922 - SURFACE
      ?auto_1923 - SURFACE
    )
    :vars
    (
      ?auto_1924 - HOIST
      ?auto_1925 - PLACE
      ?auto_1927 - PLACE
      ?auto_1928 - HOIST
      ?auto_1929 - SURFACE
      ?auto_1926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924 ?auto_1925 ) ( SURFACE-AT ?auto_1923 ?auto_1925 ) ( CLEAR ?auto_1923 ) ( IS-CRATE ?auto_1922 ) ( AVAILABLE ?auto_1924 ) ( not ( = ?auto_1927 ?auto_1925 ) ) ( HOIST-AT ?auto_1928 ?auto_1927 ) ( AVAILABLE ?auto_1928 ) ( SURFACE-AT ?auto_1922 ?auto_1927 ) ( ON ?auto_1922 ?auto_1929 ) ( CLEAR ?auto_1922 ) ( TRUCK-AT ?auto_1926 ?auto_1925 ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( not ( = ?auto_1922 ?auto_1929 ) ) ( not ( = ?auto_1923 ?auto_1929 ) ) ( not ( = ?auto_1924 ?auto_1928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1926 ?auto_1925 ?auto_1927 )
      ( !LIFT ?auto_1928 ?auto_1922 ?auto_1929 ?auto_1927 )
      ( !LOAD ?auto_1928 ?auto_1922 ?auto_1926 ?auto_1927 )
      ( !DRIVE ?auto_1926 ?auto_1927 ?auto_1925 )
      ( !UNLOAD ?auto_1924 ?auto_1922 ?auto_1926 ?auto_1925 )
      ( !DROP ?auto_1924 ?auto_1922 ?auto_1923 ?auto_1925 )
      ( MAKE-ON-VERIFY ?auto_1922 ?auto_1923 ) )
  )

)

