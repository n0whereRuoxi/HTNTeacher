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

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1643 - DIRECTION
      ?auto_1644 - MODE
    )
    :vars
    (
      ?auto_1645 - INSTRUMENT
      ?auto_1646 - SATELLITE
      ?auto_1647 - DIRECTION
      ?auto_1648 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1645 ?auto_1646 ) ( SUPPORTS ?auto_1645 ?auto_1644 ) ( not ( = ?auto_1643 ?auto_1647 ) ) ( CALIBRATION_TARGET ?auto_1645 ?auto_1647 ) ( POWER_AVAIL ?auto_1646 ) ( POINTING ?auto_1646 ?auto_1648 ) ( not ( = ?auto_1647 ?auto_1648 ) ) ( not ( = ?auto_1643 ?auto_1648 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1646 ?auto_1647 ?auto_1648 )
      ( !SWITCH_ON ?auto_1645 ?auto_1646 )
      ( !CALIBRATE ?auto_1646 ?auto_1645 ?auto_1647 )
      ( !TURN_TO ?auto_1646 ?auto_1643 ?auto_1647 )
      ( !TAKE_IMAGE ?auto_1646 ?auto_1643 ?auto_1645 ?auto_1644 )
      ( GET-1IMAGE-VERIFY ?auto_1643 ?auto_1644 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1651 - DIRECTION
      ?auto_1652 - MODE
    )
    :vars
    (
      ?auto_1653 - INSTRUMENT
      ?auto_1654 - SATELLITE
      ?auto_1655 - DIRECTION
      ?auto_1656 - DIRECTION
      ?auto_1657 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1653 ?auto_1654 ) ( SUPPORTS ?auto_1653 ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1655 ) ) ( CALIBRATION_TARGET ?auto_1653 ?auto_1655 ) ( POINTING ?auto_1654 ?auto_1656 ) ( not ( = ?auto_1655 ?auto_1656 ) ) ( ON_BOARD ?auto_1657 ?auto_1654 ) ( POWER_ON ?auto_1657 ) ( not ( = ?auto_1651 ?auto_1656 ) ) ( not ( = ?auto_1653 ?auto_1657 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1657 ?auto_1654 )
      ( !TURN_TO ?auto_1654 ?auto_1655 ?auto_1656 )
      ( !SWITCH_ON ?auto_1653 ?auto_1654 )
      ( !CALIBRATE ?auto_1654 ?auto_1653 ?auto_1655 )
      ( !TURN_TO ?auto_1654 ?auto_1651 ?auto_1655 )
      ( !TAKE_IMAGE ?auto_1654 ?auto_1651 ?auto_1653 ?auto_1652 )
      ( GET-1IMAGE-VERIFY ?auto_1651 ?auto_1652 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1670 - DIRECTION
      ?auto_1671 - MODE
      ?auto_1673 - DIRECTION
      ?auto_1672 - MODE
    )
    :vars
    (
      ?auto_1676 - INSTRUMENT
      ?auto_1677 - SATELLITE
      ?auto_1674 - DIRECTION
      ?auto_1675 - INSTRUMENT
      ?auto_1678 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1673 ?auto_1670 ) ) ( ON_BOARD ?auto_1676 ?auto_1677 ) ( SUPPORTS ?auto_1676 ?auto_1672 ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( CALIBRATION_TARGET ?auto_1676 ?auto_1674 ) ( not ( = ?auto_1674 ?auto_1670 ) ) ( ON_BOARD ?auto_1675 ?auto_1677 ) ( not ( = ?auto_1676 ?auto_1675 ) ) ( SUPPORTS ?auto_1675 ?auto_1671 ) ( CALIBRATION_TARGET ?auto_1675 ?auto_1674 ) ( POWER_AVAIL ?auto_1677 ) ( POINTING ?auto_1677 ?auto_1678 ) ( not ( = ?auto_1674 ?auto_1678 ) ) ( not ( = ?auto_1670 ?auto_1678 ) ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( not ( = ?auto_1673 ?auto_1678 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1670 ?auto_1671 )
      ( GET-1IMAGE ?auto_1673 ?auto_1672 )
      ( GET-2IMAGE-VERIFY ?auto_1670 ?auto_1671 ?auto_1673 ?auto_1672 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1679 - DIRECTION
      ?auto_1680 - MODE
      ?auto_1682 - DIRECTION
      ?auto_1681 - MODE
    )
    :vars
    (
      ?auto_1683 - INSTRUMENT
      ?auto_1686 - SATELLITE
      ?auto_1685 - DIRECTION
      ?auto_1687 - INSTRUMENT
      ?auto_1684 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1682 ?auto_1679 ) ) ( ON_BOARD ?auto_1683 ?auto_1686 ) ( SUPPORTS ?auto_1683 ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1685 ) ) ( CALIBRATION_TARGET ?auto_1683 ?auto_1685 ) ( not ( = ?auto_1685 ?auto_1682 ) ) ( ON_BOARD ?auto_1687 ?auto_1686 ) ( not ( = ?auto_1683 ?auto_1687 ) ) ( SUPPORTS ?auto_1687 ?auto_1681 ) ( CALIBRATION_TARGET ?auto_1687 ?auto_1685 ) ( POWER_AVAIL ?auto_1686 ) ( POINTING ?auto_1686 ?auto_1684 ) ( not ( = ?auto_1685 ?auto_1684 ) ) ( not ( = ?auto_1682 ?auto_1684 ) ) ( not ( = ?auto_1681 ?auto_1680 ) ) ( not ( = ?auto_1679 ?auto_1684 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1682 ?auto_1681 ?auto_1679 ?auto_1680 )
      ( GET-2IMAGE-VERIFY ?auto_1679 ?auto_1680 ?auto_1682 ?auto_1681 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1701 - DIRECTION
      ?auto_1702 - MODE
    )
    :vars
    (
      ?auto_1703 - INSTRUMENT
      ?auto_1704 - SATELLITE
      ?auto_1705 - DIRECTION
      ?auto_1706 - DIRECTION
      ?auto_1707 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1703 ?auto_1704 ) ( SUPPORTS ?auto_1703 ?auto_1702 ) ( not ( = ?auto_1701 ?auto_1705 ) ) ( CALIBRATION_TARGET ?auto_1703 ?auto_1705 ) ( POINTING ?auto_1704 ?auto_1706 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( ON_BOARD ?auto_1707 ?auto_1704 ) ( POWER_ON ?auto_1707 ) ( not ( = ?auto_1701 ?auto_1706 ) ) ( not ( = ?auto_1703 ?auto_1707 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1707 ?auto_1704 )
      ( !TURN_TO ?auto_1704 ?auto_1705 ?auto_1706 )
      ( !SWITCH_ON ?auto_1703 ?auto_1704 )
      ( !CALIBRATE ?auto_1704 ?auto_1703 ?auto_1705 )
      ( !TURN_TO ?auto_1704 ?auto_1701 ?auto_1705 )
      ( !TAKE_IMAGE ?auto_1704 ?auto_1701 ?auto_1703 ?auto_1702 )
      ( GET-1IMAGE-VERIFY ?auto_1701 ?auto_1702 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1836 - DIRECTION
      ?auto_1837 - MODE
      ?auto_1839 - DIRECTION
      ?auto_1838 - MODE
      ?auto_1840 - DIRECTION
      ?auto_1841 - MODE
    )
    :vars
    (
      ?auto_1842 - INSTRUMENT
      ?auto_1843 - SATELLITE
      ?auto_1845 - DIRECTION
      ?auto_1844 - INSTRUMENT
      ?auto_1846 - INSTRUMENT
      ?auto_1847 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1839 ?auto_1836 ) ) ( not ( = ?auto_1840 ?auto_1836 ) ) ( not ( = ?auto_1840 ?auto_1839 ) ) ( ON_BOARD ?auto_1842 ?auto_1843 ) ( SUPPORTS ?auto_1842 ?auto_1841 ) ( not ( = ?auto_1840 ?auto_1845 ) ) ( CALIBRATION_TARGET ?auto_1842 ?auto_1845 ) ( not ( = ?auto_1845 ?auto_1839 ) ) ( ON_BOARD ?auto_1844 ?auto_1843 ) ( not ( = ?auto_1842 ?auto_1844 ) ) ( SUPPORTS ?auto_1844 ?auto_1838 ) ( CALIBRATION_TARGET ?auto_1844 ?auto_1845 ) ( not ( = ?auto_1845 ?auto_1836 ) ) ( ON_BOARD ?auto_1846 ?auto_1843 ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( SUPPORTS ?auto_1846 ?auto_1837 ) ( CALIBRATION_TARGET ?auto_1846 ?auto_1845 ) ( POWER_AVAIL ?auto_1843 ) ( POINTING ?auto_1843 ?auto_1847 ) ( not ( = ?auto_1845 ?auto_1847 ) ) ( not ( = ?auto_1836 ?auto_1847 ) ) ( not ( = ?auto_1837 ?auto_1838 ) ) ( not ( = ?auto_1839 ?auto_1847 ) ) ( not ( = ?auto_1837 ?auto_1841 ) ) ( not ( = ?auto_1838 ?auto_1841 ) ) ( not ( = ?auto_1840 ?auto_1847 ) ) ( not ( = ?auto_1842 ?auto_1846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1839 ?auto_1838 ?auto_1836 ?auto_1837 )
      ( GET-1IMAGE ?auto_1840 ?auto_1841 )
      ( GET-3IMAGE-VERIFY ?auto_1836 ?auto_1837 ?auto_1839 ?auto_1838 ?auto_1840 ?auto_1841 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1862 - DIRECTION
      ?auto_1863 - MODE
      ?auto_1865 - DIRECTION
      ?auto_1864 - MODE
      ?auto_1866 - DIRECTION
      ?auto_1867 - MODE
    )
    :vars
    (
      ?auto_1870 - INSTRUMENT
      ?auto_1871 - SATELLITE
      ?auto_1872 - DIRECTION
      ?auto_1873 - INSTRUMENT
      ?auto_1869 - INSTRUMENT
      ?auto_1868 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1865 ?auto_1862 ) ) ( not ( = ?auto_1866 ?auto_1862 ) ) ( not ( = ?auto_1866 ?auto_1865 ) ) ( ON_BOARD ?auto_1870 ?auto_1871 ) ( SUPPORTS ?auto_1870 ?auto_1864 ) ( not ( = ?auto_1865 ?auto_1872 ) ) ( CALIBRATION_TARGET ?auto_1870 ?auto_1872 ) ( not ( = ?auto_1872 ?auto_1866 ) ) ( ON_BOARD ?auto_1873 ?auto_1871 ) ( not ( = ?auto_1870 ?auto_1873 ) ) ( SUPPORTS ?auto_1873 ?auto_1867 ) ( CALIBRATION_TARGET ?auto_1873 ?auto_1872 ) ( not ( = ?auto_1872 ?auto_1862 ) ) ( ON_BOARD ?auto_1869 ?auto_1871 ) ( not ( = ?auto_1873 ?auto_1869 ) ) ( SUPPORTS ?auto_1869 ?auto_1863 ) ( CALIBRATION_TARGET ?auto_1869 ?auto_1872 ) ( POWER_AVAIL ?auto_1871 ) ( POINTING ?auto_1871 ?auto_1868 ) ( not ( = ?auto_1872 ?auto_1868 ) ) ( not ( = ?auto_1862 ?auto_1868 ) ) ( not ( = ?auto_1863 ?auto_1867 ) ) ( not ( = ?auto_1866 ?auto_1868 ) ) ( not ( = ?auto_1863 ?auto_1864 ) ) ( not ( = ?auto_1867 ?auto_1864 ) ) ( not ( = ?auto_1865 ?auto_1868 ) ) ( not ( = ?auto_1870 ?auto_1869 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1862 ?auto_1863 ?auto_1866 ?auto_1867 ?auto_1865 ?auto_1864 )
      ( GET-3IMAGE-VERIFY ?auto_1862 ?auto_1863 ?auto_1865 ?auto_1864 ?auto_1866 ?auto_1867 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1888 - DIRECTION
      ?auto_1889 - MODE
      ?auto_1891 - DIRECTION
      ?auto_1890 - MODE
      ?auto_1892 - DIRECTION
      ?auto_1893 - MODE
    )
    :vars
    (
      ?auto_1896 - INSTRUMENT
      ?auto_1898 - SATELLITE
      ?auto_1897 - DIRECTION
      ?auto_1899 - INSTRUMENT
      ?auto_1894 - INSTRUMENT
      ?auto_1895 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1891 ?auto_1888 ) ) ( not ( = ?auto_1892 ?auto_1888 ) ) ( not ( = ?auto_1892 ?auto_1891 ) ) ( ON_BOARD ?auto_1896 ?auto_1898 ) ( SUPPORTS ?auto_1896 ?auto_1893 ) ( not ( = ?auto_1892 ?auto_1897 ) ) ( CALIBRATION_TARGET ?auto_1896 ?auto_1897 ) ( not ( = ?auto_1897 ?auto_1888 ) ) ( ON_BOARD ?auto_1899 ?auto_1898 ) ( not ( = ?auto_1896 ?auto_1899 ) ) ( SUPPORTS ?auto_1899 ?auto_1889 ) ( CALIBRATION_TARGET ?auto_1899 ?auto_1897 ) ( not ( = ?auto_1897 ?auto_1891 ) ) ( ON_BOARD ?auto_1894 ?auto_1898 ) ( not ( = ?auto_1899 ?auto_1894 ) ) ( SUPPORTS ?auto_1894 ?auto_1890 ) ( CALIBRATION_TARGET ?auto_1894 ?auto_1897 ) ( POWER_AVAIL ?auto_1898 ) ( POINTING ?auto_1898 ?auto_1895 ) ( not ( = ?auto_1897 ?auto_1895 ) ) ( not ( = ?auto_1891 ?auto_1895 ) ) ( not ( = ?auto_1890 ?auto_1889 ) ) ( not ( = ?auto_1888 ?auto_1895 ) ) ( not ( = ?auto_1890 ?auto_1893 ) ) ( not ( = ?auto_1889 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1895 ) ) ( not ( = ?auto_1896 ?auto_1894 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1891 ?auto_1890 ?auto_1892 ?auto_1893 ?auto_1888 ?auto_1889 )
      ( GET-3IMAGE-VERIFY ?auto_1888 ?auto_1889 ?auto_1891 ?auto_1890 ?auto_1892 ?auto_1893 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1914 - DIRECTION
      ?auto_1915 - MODE
      ?auto_1917 - DIRECTION
      ?auto_1916 - MODE
      ?auto_1918 - DIRECTION
      ?auto_1919 - MODE
    )
    :vars
    (
      ?auto_1922 - INSTRUMENT
      ?auto_1924 - SATELLITE
      ?auto_1923 - DIRECTION
      ?auto_1925 - INSTRUMENT
      ?auto_1920 - INSTRUMENT
      ?auto_1921 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1917 ?auto_1914 ) ) ( not ( = ?auto_1918 ?auto_1914 ) ) ( not ( = ?auto_1918 ?auto_1917 ) ) ( ON_BOARD ?auto_1922 ?auto_1924 ) ( SUPPORTS ?auto_1922 ?auto_1916 ) ( not ( = ?auto_1917 ?auto_1923 ) ) ( CALIBRATION_TARGET ?auto_1922 ?auto_1923 ) ( not ( = ?auto_1923 ?auto_1914 ) ) ( ON_BOARD ?auto_1925 ?auto_1924 ) ( not ( = ?auto_1922 ?auto_1925 ) ) ( SUPPORTS ?auto_1925 ?auto_1915 ) ( CALIBRATION_TARGET ?auto_1925 ?auto_1923 ) ( not ( = ?auto_1923 ?auto_1918 ) ) ( ON_BOARD ?auto_1920 ?auto_1924 ) ( not ( = ?auto_1925 ?auto_1920 ) ) ( SUPPORTS ?auto_1920 ?auto_1919 ) ( CALIBRATION_TARGET ?auto_1920 ?auto_1923 ) ( POWER_AVAIL ?auto_1924 ) ( POINTING ?auto_1924 ?auto_1921 ) ( not ( = ?auto_1923 ?auto_1921 ) ) ( not ( = ?auto_1918 ?auto_1921 ) ) ( not ( = ?auto_1919 ?auto_1915 ) ) ( not ( = ?auto_1914 ?auto_1921 ) ) ( not ( = ?auto_1919 ?auto_1916 ) ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( not ( = ?auto_1917 ?auto_1921 ) ) ( not ( = ?auto_1922 ?auto_1920 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1918 ?auto_1919 ?auto_1917 ?auto_1916 ?auto_1914 ?auto_1915 )
      ( GET-3IMAGE-VERIFY ?auto_1914 ?auto_1915 ?auto_1917 ?auto_1916 ?auto_1918 ?auto_1919 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1968 - DIRECTION
      ?auto_1969 - MODE
      ?auto_1971 - DIRECTION
      ?auto_1970 - MODE
      ?auto_1972 - DIRECTION
      ?auto_1973 - MODE
    )
    :vars
    (
      ?auto_1976 - INSTRUMENT
      ?auto_1978 - SATELLITE
      ?auto_1977 - DIRECTION
      ?auto_1979 - INSTRUMENT
      ?auto_1974 - INSTRUMENT
      ?auto_1975 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1971 ?auto_1968 ) ) ( not ( = ?auto_1972 ?auto_1968 ) ) ( not ( = ?auto_1972 ?auto_1971 ) ) ( ON_BOARD ?auto_1976 ?auto_1978 ) ( SUPPORTS ?auto_1976 ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1977 ) ) ( CALIBRATION_TARGET ?auto_1976 ?auto_1977 ) ( not ( = ?auto_1977 ?auto_1972 ) ) ( ON_BOARD ?auto_1979 ?auto_1978 ) ( not ( = ?auto_1976 ?auto_1979 ) ) ( SUPPORTS ?auto_1979 ?auto_1973 ) ( CALIBRATION_TARGET ?auto_1979 ?auto_1977 ) ( not ( = ?auto_1977 ?auto_1971 ) ) ( ON_BOARD ?auto_1974 ?auto_1978 ) ( not ( = ?auto_1979 ?auto_1974 ) ) ( SUPPORTS ?auto_1974 ?auto_1970 ) ( CALIBRATION_TARGET ?auto_1974 ?auto_1977 ) ( POWER_AVAIL ?auto_1978 ) ( POINTING ?auto_1978 ?auto_1975 ) ( not ( = ?auto_1977 ?auto_1975 ) ) ( not ( = ?auto_1971 ?auto_1975 ) ) ( not ( = ?auto_1970 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1975 ) ) ( not ( = ?auto_1970 ?auto_1969 ) ) ( not ( = ?auto_1973 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1975 ) ) ( not ( = ?auto_1976 ?auto_1974 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1971 ?auto_1970 ?auto_1968 ?auto_1969 ?auto_1972 ?auto_1973 )
      ( GET-3IMAGE-VERIFY ?auto_1968 ?auto_1969 ?auto_1971 ?auto_1970 ?auto_1972 ?auto_1973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1994 - DIRECTION
      ?auto_1995 - MODE
      ?auto_1997 - DIRECTION
      ?auto_1996 - MODE
      ?auto_1998 - DIRECTION
      ?auto_1999 - MODE
    )
    :vars
    (
      ?auto_2002 - INSTRUMENT
      ?auto_2004 - SATELLITE
      ?auto_2003 - DIRECTION
      ?auto_2005 - INSTRUMENT
      ?auto_2000 - INSTRUMENT
      ?auto_2001 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1997 ?auto_1994 ) ) ( not ( = ?auto_1998 ?auto_1994 ) ) ( not ( = ?auto_1998 ?auto_1997 ) ) ( ON_BOARD ?auto_2002 ?auto_2004 ) ( SUPPORTS ?auto_2002 ?auto_1995 ) ( not ( = ?auto_1994 ?auto_2003 ) ) ( CALIBRATION_TARGET ?auto_2002 ?auto_2003 ) ( not ( = ?auto_2003 ?auto_1997 ) ) ( ON_BOARD ?auto_2005 ?auto_2004 ) ( not ( = ?auto_2002 ?auto_2005 ) ) ( SUPPORTS ?auto_2005 ?auto_1996 ) ( CALIBRATION_TARGET ?auto_2005 ?auto_2003 ) ( not ( = ?auto_2003 ?auto_1998 ) ) ( ON_BOARD ?auto_2000 ?auto_2004 ) ( not ( = ?auto_2005 ?auto_2000 ) ) ( SUPPORTS ?auto_2000 ?auto_1999 ) ( CALIBRATION_TARGET ?auto_2000 ?auto_2003 ) ( POWER_AVAIL ?auto_2004 ) ( POINTING ?auto_2004 ?auto_2001 ) ( not ( = ?auto_2003 ?auto_2001 ) ) ( not ( = ?auto_1998 ?auto_2001 ) ) ( not ( = ?auto_1999 ?auto_1996 ) ) ( not ( = ?auto_1997 ?auto_2001 ) ) ( not ( = ?auto_1999 ?auto_1995 ) ) ( not ( = ?auto_1996 ?auto_1995 ) ) ( not ( = ?auto_1994 ?auto_2001 ) ) ( not ( = ?auto_2002 ?auto_2000 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1998 ?auto_1999 ?auto_1994 ?auto_1995 ?auto_1997 ?auto_1996 )
      ( GET-3IMAGE-VERIFY ?auto_1994 ?auto_1995 ?auto_1997 ?auto_1996 ?auto_1998 ?auto_1999 ) )
  )

)

