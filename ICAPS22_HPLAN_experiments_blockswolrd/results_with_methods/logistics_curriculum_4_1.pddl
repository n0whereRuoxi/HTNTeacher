( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4673 - OBJ
      ?auto_4672 - LOCATION
    )
    :vars
    (
      ?auto_4675 - LOCATION
      ?auto_4676 - CITY
      ?auto_4674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4675 ?auto_4676 ) ( IN-CITY ?auto_4672 ?auto_4676 ) ( not ( = ?auto_4672 ?auto_4675 ) ) ( OBJ-AT ?auto_4673 ?auto_4675 ) ( TRUCK-AT ?auto_4674 ?auto_4672 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4674 ?auto_4672 ?auto_4675 ?auto_4676 )
      ( !LOAD-TRUCK ?auto_4673 ?auto_4674 ?auto_4675 )
      ( !DRIVE-TRUCK ?auto_4674 ?auto_4675 ?auto_4672 ?auto_4676 )
      ( !UNLOAD-TRUCK ?auto_4673 ?auto_4674 ?auto_4672 )
      ( DELIVER-1PKG-VERIFY ?auto_4673 ?auto_4672 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4680 - OBJ
      ?auto_4679 - LOCATION
    )
    :vars
    (
      ?auto_4682 - LOCATION
      ?auto_4683 - CITY
      ?auto_4681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4682 ?auto_4683 ) ( IN-CITY ?auto_4679 ?auto_4683 ) ( not ( = ?auto_4679 ?auto_4682 ) ) ( OBJ-AT ?auto_4680 ?auto_4682 ) ( TRUCK-AT ?auto_4681 ?auto_4679 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4681 ?auto_4679 ?auto_4682 ?auto_4683 )
      ( !LOAD-TRUCK ?auto_4680 ?auto_4681 ?auto_4682 )
      ( !DRIVE-TRUCK ?auto_4681 ?auto_4682 ?auto_4679 ?auto_4683 )
      ( !UNLOAD-TRUCK ?auto_4680 ?auto_4681 ?auto_4679 )
      ( DELIVER-1PKG-VERIFY ?auto_4680 ?auto_4679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4694 - OBJ
      ?auto_4695 - OBJ
      ?auto_4693 - LOCATION
    )
    :vars
    (
      ?auto_4697 - LOCATION
      ?auto_4696 - CITY
      ?auto_4699 - LOCATION
      ?auto_4698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4697 ?auto_4696 ) ( IN-CITY ?auto_4693 ?auto_4696 ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( OBJ-AT ?auto_4695 ?auto_4697 ) ( IN-CITY ?auto_4699 ?auto_4696 ) ( not ( = ?auto_4693 ?auto_4699 ) ) ( OBJ-AT ?auto_4694 ?auto_4699 ) ( TRUCK-AT ?auto_4698 ?auto_4693 ) ( not ( = ?auto_4694 ?auto_4695 ) ) ( not ( = ?auto_4697 ?auto_4699 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4694 ?auto_4693 )
      ( DELIVER-1PKG ?auto_4695 ?auto_4693 )
      ( DELIVER-2PKG-VERIFY ?auto_4694 ?auto_4695 ?auto_4693 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4701 - OBJ
      ?auto_4702 - OBJ
      ?auto_4700 - LOCATION
    )
    :vars
    (
      ?auto_4704 - LOCATION
      ?auto_4706 - CITY
      ?auto_4705 - LOCATION
      ?auto_4703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4704 ?auto_4706 ) ( IN-CITY ?auto_4700 ?auto_4706 ) ( not ( = ?auto_4700 ?auto_4704 ) ) ( OBJ-AT ?auto_4701 ?auto_4704 ) ( IN-CITY ?auto_4705 ?auto_4706 ) ( not ( = ?auto_4700 ?auto_4705 ) ) ( OBJ-AT ?auto_4702 ?auto_4705 ) ( TRUCK-AT ?auto_4703 ?auto_4700 ) ( not ( = ?auto_4702 ?auto_4701 ) ) ( not ( = ?auto_4704 ?auto_4705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4702 ?auto_4701 ?auto_4700 )
      ( DELIVER-2PKG-VERIFY ?auto_4701 ?auto_4702 ?auto_4700 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4718 - OBJ
      ?auto_4717 - LOCATION
    )
    :vars
    (
      ?auto_4720 - LOCATION
      ?auto_4721 - CITY
      ?auto_4719 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4720 ?auto_4721 ) ( IN-CITY ?auto_4717 ?auto_4721 ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( OBJ-AT ?auto_4718 ?auto_4720 ) ( TRUCK-AT ?auto_4719 ?auto_4717 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4719 ?auto_4717 ?auto_4720 ?auto_4721 )
      ( !LOAD-TRUCK ?auto_4718 ?auto_4719 ?auto_4720 )
      ( !DRIVE-TRUCK ?auto_4719 ?auto_4720 ?auto_4717 ?auto_4721 )
      ( !UNLOAD-TRUCK ?auto_4718 ?auto_4719 ?auto_4717 )
      ( DELIVER-1PKG-VERIFY ?auto_4718 ?auto_4717 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4809 - OBJ
      ?auto_4810 - OBJ
      ?auto_4811 - OBJ
      ?auto_4808 - LOCATION
    )
    :vars
    (
      ?auto_4813 - LOCATION
      ?auto_4812 - CITY
      ?auto_4815 - LOCATION
      ?auto_4816 - LOCATION
      ?auto_4814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4813 ?auto_4812 ) ( IN-CITY ?auto_4808 ?auto_4812 ) ( not ( = ?auto_4808 ?auto_4813 ) ) ( OBJ-AT ?auto_4811 ?auto_4813 ) ( IN-CITY ?auto_4815 ?auto_4812 ) ( not ( = ?auto_4808 ?auto_4815 ) ) ( OBJ-AT ?auto_4810 ?auto_4815 ) ( IN-CITY ?auto_4816 ?auto_4812 ) ( not ( = ?auto_4808 ?auto_4816 ) ) ( OBJ-AT ?auto_4809 ?auto_4816 ) ( TRUCK-AT ?auto_4814 ?auto_4808 ) ( not ( = ?auto_4809 ?auto_4810 ) ) ( not ( = ?auto_4815 ?auto_4816 ) ) ( not ( = ?auto_4809 ?auto_4811 ) ) ( not ( = ?auto_4810 ?auto_4811 ) ) ( not ( = ?auto_4813 ?auto_4815 ) ) ( not ( = ?auto_4813 ?auto_4816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4810 ?auto_4809 ?auto_4808 )
      ( DELIVER-1PKG ?auto_4811 ?auto_4808 )
      ( DELIVER-3PKG-VERIFY ?auto_4809 ?auto_4810 ?auto_4811 ?auto_4808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4828 - OBJ
      ?auto_4829 - OBJ
      ?auto_4830 - OBJ
      ?auto_4827 - LOCATION
    )
    :vars
    (
      ?auto_4831 - LOCATION
      ?auto_4835 - CITY
      ?auto_4832 - LOCATION
      ?auto_4834 - LOCATION
      ?auto_4833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4831 ?auto_4835 ) ( IN-CITY ?auto_4827 ?auto_4835 ) ( not ( = ?auto_4827 ?auto_4831 ) ) ( OBJ-AT ?auto_4829 ?auto_4831 ) ( IN-CITY ?auto_4832 ?auto_4835 ) ( not ( = ?auto_4827 ?auto_4832 ) ) ( OBJ-AT ?auto_4830 ?auto_4832 ) ( IN-CITY ?auto_4834 ?auto_4835 ) ( not ( = ?auto_4827 ?auto_4834 ) ) ( OBJ-AT ?auto_4828 ?auto_4834 ) ( TRUCK-AT ?auto_4833 ?auto_4827 ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4832 ?auto_4834 ) ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( not ( = ?auto_4830 ?auto_4829 ) ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( not ( = ?auto_4831 ?auto_4834 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4828 ?auto_4830 ?auto_4829 ?auto_4827 )
      ( DELIVER-3PKG-VERIFY ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4847 - OBJ
      ?auto_4848 - OBJ
      ?auto_4849 - OBJ
      ?auto_4846 - LOCATION
    )
    :vars
    (
      ?auto_4853 - LOCATION
      ?auto_4850 - CITY
      ?auto_4851 - LOCATION
      ?auto_4854 - LOCATION
      ?auto_4852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4853 ?auto_4850 ) ( IN-CITY ?auto_4846 ?auto_4850 ) ( not ( = ?auto_4846 ?auto_4853 ) ) ( OBJ-AT ?auto_4849 ?auto_4853 ) ( IN-CITY ?auto_4851 ?auto_4850 ) ( not ( = ?auto_4846 ?auto_4851 ) ) ( OBJ-AT ?auto_4847 ?auto_4851 ) ( IN-CITY ?auto_4854 ?auto_4850 ) ( not ( = ?auto_4846 ?auto_4854 ) ) ( OBJ-AT ?auto_4848 ?auto_4854 ) ( TRUCK-AT ?auto_4852 ?auto_4846 ) ( not ( = ?auto_4848 ?auto_4847 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4848 ?auto_4849 ) ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( not ( = ?auto_4853 ?auto_4851 ) ) ( not ( = ?auto_4853 ?auto_4854 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4848 ?auto_4849 ?auto_4847 ?auto_4846 )
      ( DELIVER-3PKG-VERIFY ?auto_4847 ?auto_4848 ?auto_4849 ?auto_4846 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4866 - OBJ
      ?auto_4867 - OBJ
      ?auto_4868 - OBJ
      ?auto_4865 - LOCATION
    )
    :vars
    (
      ?auto_4872 - LOCATION
      ?auto_4869 - CITY
      ?auto_4870 - LOCATION
      ?auto_4873 - LOCATION
      ?auto_4871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4872 ?auto_4869 ) ( IN-CITY ?auto_4865 ?auto_4869 ) ( not ( = ?auto_4865 ?auto_4872 ) ) ( OBJ-AT ?auto_4867 ?auto_4872 ) ( IN-CITY ?auto_4870 ?auto_4869 ) ( not ( = ?auto_4865 ?auto_4870 ) ) ( OBJ-AT ?auto_4866 ?auto_4870 ) ( IN-CITY ?auto_4873 ?auto_4869 ) ( not ( = ?auto_4865 ?auto_4873 ) ) ( OBJ-AT ?auto_4868 ?auto_4873 ) ( TRUCK-AT ?auto_4871 ?auto_4865 ) ( not ( = ?auto_4868 ?auto_4866 ) ) ( not ( = ?auto_4870 ?auto_4873 ) ) ( not ( = ?auto_4868 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4872 ?auto_4870 ) ) ( not ( = ?auto_4872 ?auto_4873 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4868 ?auto_4867 ?auto_4866 ?auto_4865 )
      ( DELIVER-3PKG-VERIFY ?auto_4866 ?auto_4867 ?auto_4868 ?auto_4865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4905 - OBJ
      ?auto_4906 - OBJ
      ?auto_4907 - OBJ
      ?auto_4904 - LOCATION
    )
    :vars
    (
      ?auto_4911 - LOCATION
      ?auto_4908 - CITY
      ?auto_4909 - LOCATION
      ?auto_4912 - LOCATION
      ?auto_4910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4911 ?auto_4908 ) ( IN-CITY ?auto_4904 ?auto_4908 ) ( not ( = ?auto_4904 ?auto_4911 ) ) ( OBJ-AT ?auto_4905 ?auto_4911 ) ( IN-CITY ?auto_4909 ?auto_4908 ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( OBJ-AT ?auto_4907 ?auto_4909 ) ( IN-CITY ?auto_4912 ?auto_4908 ) ( not ( = ?auto_4904 ?auto_4912 ) ) ( OBJ-AT ?auto_4906 ?auto_4912 ) ( TRUCK-AT ?auto_4910 ?auto_4904 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( not ( = ?auto_4909 ?auto_4912 ) ) ( not ( = ?auto_4906 ?auto_4905 ) ) ( not ( = ?auto_4907 ?auto_4905 ) ) ( not ( = ?auto_4911 ?auto_4909 ) ) ( not ( = ?auto_4911 ?auto_4912 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4906 ?auto_4905 ?auto_4907 ?auto_4904 )
      ( DELIVER-3PKG-VERIFY ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4904 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4924 - OBJ
      ?auto_4925 - OBJ
      ?auto_4926 - OBJ
      ?auto_4923 - LOCATION
    )
    :vars
    (
      ?auto_4930 - LOCATION
      ?auto_4927 - CITY
      ?auto_4928 - LOCATION
      ?auto_4931 - LOCATION
      ?auto_4929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4930 ?auto_4927 ) ( IN-CITY ?auto_4923 ?auto_4927 ) ( not ( = ?auto_4923 ?auto_4930 ) ) ( OBJ-AT ?auto_4924 ?auto_4930 ) ( IN-CITY ?auto_4928 ?auto_4927 ) ( not ( = ?auto_4923 ?auto_4928 ) ) ( OBJ-AT ?auto_4925 ?auto_4928 ) ( IN-CITY ?auto_4931 ?auto_4927 ) ( not ( = ?auto_4923 ?auto_4931 ) ) ( OBJ-AT ?auto_4926 ?auto_4931 ) ( TRUCK-AT ?auto_4929 ?auto_4923 ) ( not ( = ?auto_4926 ?auto_4925 ) ) ( not ( = ?auto_4928 ?auto_4931 ) ) ( not ( = ?auto_4926 ?auto_4924 ) ) ( not ( = ?auto_4925 ?auto_4924 ) ) ( not ( = ?auto_4930 ?auto_4928 ) ) ( not ( = ?auto_4930 ?auto_4931 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4926 ?auto_4924 ?auto_4925 ?auto_4923 )
      ( DELIVER-3PKG-VERIFY ?auto_4924 ?auto_4925 ?auto_4926 ?auto_4923 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4986 - OBJ
      ?auto_4985 - LOCATION
    )
    :vars
    (
      ?auto_4988 - LOCATION
      ?auto_4989 - CITY
      ?auto_4987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4988 ?auto_4989 ) ( IN-CITY ?auto_4985 ?auto_4989 ) ( not ( = ?auto_4985 ?auto_4988 ) ) ( OBJ-AT ?auto_4986 ?auto_4988 ) ( TRUCK-AT ?auto_4987 ?auto_4985 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4987 ?auto_4985 ?auto_4988 ?auto_4989 )
      ( !LOAD-TRUCK ?auto_4986 ?auto_4987 ?auto_4988 )
      ( !DRIVE-TRUCK ?auto_4987 ?auto_4988 ?auto_4985 ?auto_4989 )
      ( !UNLOAD-TRUCK ?auto_4986 ?auto_4987 ?auto_4985 )
      ( DELIVER-1PKG-VERIFY ?auto_4986 ?auto_4985 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5968 - OBJ
      ?auto_5969 - OBJ
      ?auto_5970 - OBJ
      ?auto_5971 - OBJ
      ?auto_5967 - LOCATION
    )
    :vars
    (
      ?auto_5972 - LOCATION
      ?auto_5974 - CITY
      ?auto_5975 - LOCATION
      ?auto_5976 - LOCATION
      ?auto_5973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5972 ?auto_5974 ) ( IN-CITY ?auto_5967 ?auto_5974 ) ( not ( = ?auto_5967 ?auto_5972 ) ) ( OBJ-AT ?auto_5971 ?auto_5972 ) ( IN-CITY ?auto_5975 ?auto_5974 ) ( not ( = ?auto_5967 ?auto_5975 ) ) ( OBJ-AT ?auto_5970 ?auto_5975 ) ( OBJ-AT ?auto_5969 ?auto_5972 ) ( IN-CITY ?auto_5976 ?auto_5974 ) ( not ( = ?auto_5967 ?auto_5976 ) ) ( OBJ-AT ?auto_5968 ?auto_5976 ) ( TRUCK-AT ?auto_5973 ?auto_5967 ) ( not ( = ?auto_5968 ?auto_5969 ) ) ( not ( = ?auto_5972 ?auto_5976 ) ) ( not ( = ?auto_5968 ?auto_5970 ) ) ( not ( = ?auto_5969 ?auto_5970 ) ) ( not ( = ?auto_5975 ?auto_5972 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) ( not ( = ?auto_5968 ?auto_5971 ) ) ( not ( = ?auto_5969 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5968 ?auto_5970 ?auto_5969 ?auto_5967 )
      ( DELIVER-1PKG ?auto_5971 ?auto_5967 )
      ( DELIVER-4PKG-VERIFY ?auto_5968 ?auto_5969 ?auto_5970 ?auto_5971 ?auto_5967 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6000 - OBJ
      ?auto_6001 - OBJ
      ?auto_6002 - OBJ
      ?auto_6003 - OBJ
      ?auto_5999 - LOCATION
    )
    :vars
    (
      ?auto_6007 - LOCATION
      ?auto_6006 - CITY
      ?auto_6008 - LOCATION
      ?auto_6004 - LOCATION
      ?auto_6005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6007 ?auto_6006 ) ( IN-CITY ?auto_5999 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6007 ) ) ( OBJ-AT ?auto_6002 ?auto_6007 ) ( IN-CITY ?auto_6008 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6008 ) ) ( OBJ-AT ?auto_6003 ?auto_6008 ) ( OBJ-AT ?auto_6001 ?auto_6007 ) ( IN-CITY ?auto_6004 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6004 ) ) ( OBJ-AT ?auto_6000 ?auto_6004 ) ( TRUCK-AT ?auto_6005 ?auto_5999 ) ( not ( = ?auto_6000 ?auto_6001 ) ) ( not ( = ?auto_6007 ?auto_6004 ) ) ( not ( = ?auto_6000 ?auto_6003 ) ) ( not ( = ?auto_6001 ?auto_6003 ) ) ( not ( = ?auto_6008 ?auto_6007 ) ) ( not ( = ?auto_6008 ?auto_6004 ) ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6003 ?auto_6002 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6000 ?auto_6001 ?auto_6003 ?auto_6002 ?auto_5999 )
      ( DELIVER-4PKG-VERIFY ?auto_6000 ?auto_6001 ?auto_6002 ?auto_6003 ?auto_5999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6032 - OBJ
      ?auto_6033 - OBJ
      ?auto_6034 - OBJ
      ?auto_6035 - OBJ
      ?auto_6031 - LOCATION
    )
    :vars
    (
      ?auto_6038 - LOCATION
      ?auto_6036 - CITY
      ?auto_6037 - LOCATION
      ?auto_6040 - LOCATION
      ?auto_6039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6038 ?auto_6036 ) ( IN-CITY ?auto_6031 ?auto_6036 ) ( not ( = ?auto_6031 ?auto_6038 ) ) ( OBJ-AT ?auto_6035 ?auto_6038 ) ( IN-CITY ?auto_6037 ?auto_6036 ) ( not ( = ?auto_6031 ?auto_6037 ) ) ( OBJ-AT ?auto_6033 ?auto_6037 ) ( OBJ-AT ?auto_6034 ?auto_6038 ) ( IN-CITY ?auto_6040 ?auto_6036 ) ( not ( = ?auto_6031 ?auto_6040 ) ) ( OBJ-AT ?auto_6032 ?auto_6040 ) ( TRUCK-AT ?auto_6039 ?auto_6031 ) ( not ( = ?auto_6032 ?auto_6034 ) ) ( not ( = ?auto_6038 ?auto_6040 ) ) ( not ( = ?auto_6032 ?auto_6033 ) ) ( not ( = ?auto_6034 ?auto_6033 ) ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6040 ) ) ( not ( = ?auto_6032 ?auto_6035 ) ) ( not ( = ?auto_6034 ?auto_6035 ) ) ( not ( = ?auto_6033 ?auto_6035 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6032 ?auto_6034 ?auto_6035 ?auto_6033 ?auto_6031 )
      ( DELIVER-4PKG-VERIFY ?auto_6032 ?auto_6033 ?auto_6034 ?auto_6035 ?auto_6031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6064 - OBJ
      ?auto_6065 - OBJ
      ?auto_6066 - OBJ
      ?auto_6067 - OBJ
      ?auto_6063 - LOCATION
    )
    :vars
    (
      ?auto_6070 - LOCATION
      ?auto_6068 - CITY
      ?auto_6069 - LOCATION
      ?auto_6072 - LOCATION
      ?auto_6071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6070 ?auto_6068 ) ( IN-CITY ?auto_6063 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6070 ) ) ( OBJ-AT ?auto_6066 ?auto_6070 ) ( IN-CITY ?auto_6069 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6069 ) ) ( OBJ-AT ?auto_6065 ?auto_6069 ) ( OBJ-AT ?auto_6067 ?auto_6070 ) ( IN-CITY ?auto_6072 ?auto_6068 ) ( not ( = ?auto_6063 ?auto_6072 ) ) ( OBJ-AT ?auto_6064 ?auto_6072 ) ( TRUCK-AT ?auto_6071 ?auto_6063 ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( not ( = ?auto_6067 ?auto_6065 ) ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( not ( = ?auto_6069 ?auto_6072 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( not ( = ?auto_6067 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6064 ?auto_6067 ?auto_6066 ?auto_6065 ?auto_6063 )
      ( DELIVER-4PKG-VERIFY ?auto_6064 ?auto_6065 ?auto_6066 ?auto_6067 ?auto_6063 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6164 - OBJ
      ?auto_6165 - OBJ
      ?auto_6166 - OBJ
      ?auto_6167 - OBJ
      ?auto_6163 - LOCATION
    )
    :vars
    (
      ?auto_6170 - LOCATION
      ?auto_6168 - CITY
      ?auto_6169 - LOCATION
      ?auto_6172 - LOCATION
      ?auto_6171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6170 ?auto_6168 ) ( IN-CITY ?auto_6163 ?auto_6168 ) ( not ( = ?auto_6163 ?auto_6170 ) ) ( OBJ-AT ?auto_6165 ?auto_6170 ) ( IN-CITY ?auto_6169 ?auto_6168 ) ( not ( = ?auto_6163 ?auto_6169 ) ) ( OBJ-AT ?auto_6167 ?auto_6169 ) ( OBJ-AT ?auto_6166 ?auto_6170 ) ( IN-CITY ?auto_6172 ?auto_6168 ) ( not ( = ?auto_6163 ?auto_6172 ) ) ( OBJ-AT ?auto_6164 ?auto_6172 ) ( TRUCK-AT ?auto_6171 ?auto_6163 ) ( not ( = ?auto_6164 ?auto_6166 ) ) ( not ( = ?auto_6170 ?auto_6172 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6169 ?auto_6170 ) ) ( not ( = ?auto_6169 ?auto_6172 ) ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6166 ?auto_6165 ) ) ( not ( = ?auto_6167 ?auto_6165 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6164 ?auto_6166 ?auto_6165 ?auto_6167 ?auto_6163 )
      ( DELIVER-4PKG-VERIFY ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 ?auto_6163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6196 - OBJ
      ?auto_6197 - OBJ
      ?auto_6198 - OBJ
      ?auto_6199 - OBJ
      ?auto_6195 - LOCATION
    )
    :vars
    (
      ?auto_6202 - LOCATION
      ?auto_6200 - CITY
      ?auto_6201 - LOCATION
      ?auto_6204 - LOCATION
      ?auto_6203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6202 ?auto_6200 ) ( IN-CITY ?auto_6195 ?auto_6200 ) ( not ( = ?auto_6195 ?auto_6202 ) ) ( OBJ-AT ?auto_6197 ?auto_6202 ) ( IN-CITY ?auto_6201 ?auto_6200 ) ( not ( = ?auto_6195 ?auto_6201 ) ) ( OBJ-AT ?auto_6198 ?auto_6201 ) ( OBJ-AT ?auto_6199 ?auto_6202 ) ( IN-CITY ?auto_6204 ?auto_6200 ) ( not ( = ?auto_6195 ?auto_6204 ) ) ( OBJ-AT ?auto_6196 ?auto_6204 ) ( TRUCK-AT ?auto_6203 ?auto_6195 ) ( not ( = ?auto_6196 ?auto_6199 ) ) ( not ( = ?auto_6202 ?auto_6204 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6199 ?auto_6198 ) ) ( not ( = ?auto_6201 ?auto_6202 ) ) ( not ( = ?auto_6201 ?auto_6204 ) ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6199 ?auto_6197 ) ) ( not ( = ?auto_6198 ?auto_6197 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6196 ?auto_6199 ?auto_6197 ?auto_6198 ?auto_6195 )
      ( DELIVER-4PKG-VERIFY ?auto_6196 ?auto_6197 ?auto_6198 ?auto_6199 ?auto_6195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6296 - OBJ
      ?auto_6297 - OBJ
      ?auto_6298 - OBJ
      ?auto_6299 - OBJ
      ?auto_6295 - LOCATION
    )
    :vars
    (
      ?auto_6302 - LOCATION
      ?auto_6300 - CITY
      ?auto_6301 - LOCATION
      ?auto_6304 - LOCATION
      ?auto_6303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6302 ?auto_6300 ) ( IN-CITY ?auto_6295 ?auto_6300 ) ( not ( = ?auto_6295 ?auto_6302 ) ) ( OBJ-AT ?auto_6299 ?auto_6302 ) ( IN-CITY ?auto_6301 ?auto_6300 ) ( not ( = ?auto_6295 ?auto_6301 ) ) ( OBJ-AT ?auto_6298 ?auto_6301 ) ( OBJ-AT ?auto_6296 ?auto_6302 ) ( IN-CITY ?auto_6304 ?auto_6300 ) ( not ( = ?auto_6295 ?auto_6304 ) ) ( OBJ-AT ?auto_6297 ?auto_6304 ) ( TRUCK-AT ?auto_6303 ?auto_6295 ) ( not ( = ?auto_6297 ?auto_6296 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( not ( = ?auto_6301 ?auto_6304 ) ) ( not ( = ?auto_6297 ?auto_6299 ) ) ( not ( = ?auto_6296 ?auto_6299 ) ) ( not ( = ?auto_6298 ?auto_6299 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6297 ?auto_6296 ?auto_6299 ?auto_6298 ?auto_6295 )
      ( DELIVER-4PKG-VERIFY ?auto_6296 ?auto_6297 ?auto_6298 ?auto_6299 ?auto_6295 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6328 - OBJ
      ?auto_6329 - OBJ
      ?auto_6330 - OBJ
      ?auto_6331 - OBJ
      ?auto_6327 - LOCATION
    )
    :vars
    (
      ?auto_6334 - LOCATION
      ?auto_6332 - CITY
      ?auto_6333 - LOCATION
      ?auto_6336 - LOCATION
      ?auto_6335 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6334 ?auto_6332 ) ( IN-CITY ?auto_6327 ?auto_6332 ) ( not ( = ?auto_6327 ?auto_6334 ) ) ( OBJ-AT ?auto_6330 ?auto_6334 ) ( IN-CITY ?auto_6333 ?auto_6332 ) ( not ( = ?auto_6327 ?auto_6333 ) ) ( OBJ-AT ?auto_6331 ?auto_6333 ) ( OBJ-AT ?auto_6328 ?auto_6334 ) ( IN-CITY ?auto_6336 ?auto_6332 ) ( not ( = ?auto_6327 ?auto_6336 ) ) ( OBJ-AT ?auto_6329 ?auto_6336 ) ( TRUCK-AT ?auto_6335 ?auto_6327 ) ( not ( = ?auto_6329 ?auto_6328 ) ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( not ( = ?auto_6329 ?auto_6331 ) ) ( not ( = ?auto_6328 ?auto_6331 ) ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( not ( = ?auto_6328 ?auto_6330 ) ) ( not ( = ?auto_6331 ?auto_6330 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6329 ?auto_6328 ?auto_6330 ?auto_6331 ?auto_6327 )
      ( DELIVER-4PKG-VERIFY ?auto_6328 ?auto_6329 ?auto_6330 ?auto_6331 ?auto_6327 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6429 - OBJ
      ?auto_6430 - OBJ
      ?auto_6431 - OBJ
      ?auto_6432 - OBJ
      ?auto_6428 - LOCATION
    )
    :vars
    (
      ?auto_6435 - LOCATION
      ?auto_6433 - CITY
      ?auto_6434 - LOCATION
      ?auto_6437 - LOCATION
      ?auto_6436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6435 ?auto_6433 ) ( IN-CITY ?auto_6428 ?auto_6433 ) ( not ( = ?auto_6428 ?auto_6435 ) ) ( OBJ-AT ?auto_6432 ?auto_6435 ) ( IN-CITY ?auto_6434 ?auto_6433 ) ( not ( = ?auto_6428 ?auto_6434 ) ) ( OBJ-AT ?auto_6430 ?auto_6434 ) ( OBJ-AT ?auto_6429 ?auto_6435 ) ( IN-CITY ?auto_6437 ?auto_6433 ) ( not ( = ?auto_6428 ?auto_6437 ) ) ( OBJ-AT ?auto_6431 ?auto_6437 ) ( TRUCK-AT ?auto_6436 ?auto_6428 ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( not ( = ?auto_6435 ?auto_6437 ) ) ( not ( = ?auto_6431 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( not ( = ?auto_6434 ?auto_6437 ) ) ( not ( = ?auto_6431 ?auto_6432 ) ) ( not ( = ?auto_6429 ?auto_6432 ) ) ( not ( = ?auto_6430 ?auto_6432 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6431 ?auto_6429 ?auto_6432 ?auto_6430 ?auto_6428 )
      ( DELIVER-4PKG-VERIFY ?auto_6429 ?auto_6430 ?auto_6431 ?auto_6432 ?auto_6428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6461 - OBJ
      ?auto_6462 - OBJ
      ?auto_6463 - OBJ
      ?auto_6464 - OBJ
      ?auto_6460 - LOCATION
    )
    :vars
    (
      ?auto_6467 - LOCATION
      ?auto_6465 - CITY
      ?auto_6466 - LOCATION
      ?auto_6469 - LOCATION
      ?auto_6468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6467 ?auto_6465 ) ( IN-CITY ?auto_6460 ?auto_6465 ) ( not ( = ?auto_6460 ?auto_6467 ) ) ( OBJ-AT ?auto_6463 ?auto_6467 ) ( IN-CITY ?auto_6466 ?auto_6465 ) ( not ( = ?auto_6460 ?auto_6466 ) ) ( OBJ-AT ?auto_6462 ?auto_6466 ) ( OBJ-AT ?auto_6461 ?auto_6467 ) ( IN-CITY ?auto_6469 ?auto_6465 ) ( not ( = ?auto_6460 ?auto_6469 ) ) ( OBJ-AT ?auto_6464 ?auto_6469 ) ( TRUCK-AT ?auto_6468 ?auto_6460 ) ( not ( = ?auto_6464 ?auto_6461 ) ) ( not ( = ?auto_6467 ?auto_6469 ) ) ( not ( = ?auto_6464 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6466 ?auto_6467 ) ) ( not ( = ?auto_6466 ?auto_6469 ) ) ( not ( = ?auto_6464 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6462 ?auto_6463 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6464 ?auto_6461 ?auto_6463 ?auto_6462 ?auto_6460 )
      ( DELIVER-4PKG-VERIFY ?auto_6461 ?auto_6462 ?auto_6463 ?auto_6464 ?auto_6460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6526 - OBJ
      ?auto_6527 - OBJ
      ?auto_6528 - OBJ
      ?auto_6529 - OBJ
      ?auto_6525 - LOCATION
    )
    :vars
    (
      ?auto_6532 - LOCATION
      ?auto_6530 - CITY
      ?auto_6531 - LOCATION
      ?auto_6534 - LOCATION
      ?auto_6533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6532 ?auto_6530 ) ( IN-CITY ?auto_6525 ?auto_6530 ) ( not ( = ?auto_6525 ?auto_6532 ) ) ( OBJ-AT ?auto_6527 ?auto_6532 ) ( IN-CITY ?auto_6531 ?auto_6530 ) ( not ( = ?auto_6525 ?auto_6531 ) ) ( OBJ-AT ?auto_6529 ?auto_6531 ) ( OBJ-AT ?auto_6526 ?auto_6532 ) ( IN-CITY ?auto_6534 ?auto_6530 ) ( not ( = ?auto_6525 ?auto_6534 ) ) ( OBJ-AT ?auto_6528 ?auto_6534 ) ( TRUCK-AT ?auto_6533 ?auto_6525 ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6526 ?auto_6529 ) ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6534 ) ) ( not ( = ?auto_6528 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6529 ?auto_6527 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6528 ?auto_6526 ?auto_6527 ?auto_6529 ?auto_6525 )
      ( DELIVER-4PKG-VERIFY ?auto_6526 ?auto_6527 ?auto_6528 ?auto_6529 ?auto_6525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6593 - OBJ
      ?auto_6594 - OBJ
      ?auto_6595 - OBJ
      ?auto_6596 - OBJ
      ?auto_6592 - LOCATION
    )
    :vars
    (
      ?auto_6599 - LOCATION
      ?auto_6597 - CITY
      ?auto_6598 - LOCATION
      ?auto_6601 - LOCATION
      ?auto_6600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6599 ?auto_6597 ) ( IN-CITY ?auto_6592 ?auto_6597 ) ( not ( = ?auto_6592 ?auto_6599 ) ) ( OBJ-AT ?auto_6594 ?auto_6599 ) ( IN-CITY ?auto_6598 ?auto_6597 ) ( not ( = ?auto_6592 ?auto_6598 ) ) ( OBJ-AT ?auto_6595 ?auto_6598 ) ( OBJ-AT ?auto_6593 ?auto_6599 ) ( IN-CITY ?auto_6601 ?auto_6597 ) ( not ( = ?auto_6592 ?auto_6601 ) ) ( OBJ-AT ?auto_6596 ?auto_6601 ) ( TRUCK-AT ?auto_6600 ?auto_6592 ) ( not ( = ?auto_6596 ?auto_6593 ) ) ( not ( = ?auto_6599 ?auto_6601 ) ) ( not ( = ?auto_6596 ?auto_6595 ) ) ( not ( = ?auto_6593 ?auto_6595 ) ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6601 ) ) ( not ( = ?auto_6596 ?auto_6594 ) ) ( not ( = ?auto_6593 ?auto_6594 ) ) ( not ( = ?auto_6595 ?auto_6594 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6596 ?auto_6593 ?auto_6594 ?auto_6595 ?auto_6592 )
      ( DELIVER-4PKG-VERIFY ?auto_6593 ?auto_6594 ?auto_6595 ?auto_6596 ?auto_6592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6693 - OBJ
      ?auto_6694 - OBJ
      ?auto_6695 - OBJ
      ?auto_6696 - OBJ
      ?auto_6692 - LOCATION
    )
    :vars
    (
      ?auto_6699 - LOCATION
      ?auto_6697 - CITY
      ?auto_6698 - LOCATION
      ?auto_6701 - LOCATION
      ?auto_6700 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6699 ?auto_6697 ) ( IN-CITY ?auto_6692 ?auto_6697 ) ( not ( = ?auto_6692 ?auto_6699 ) ) ( OBJ-AT ?auto_6696 ?auto_6699 ) ( IN-CITY ?auto_6698 ?auto_6697 ) ( not ( = ?auto_6692 ?auto_6698 ) ) ( OBJ-AT ?auto_6693 ?auto_6698 ) ( OBJ-AT ?auto_6695 ?auto_6699 ) ( IN-CITY ?auto_6701 ?auto_6697 ) ( not ( = ?auto_6692 ?auto_6701 ) ) ( OBJ-AT ?auto_6694 ?auto_6701 ) ( TRUCK-AT ?auto_6700 ?auto_6692 ) ( not ( = ?auto_6694 ?auto_6695 ) ) ( not ( = ?auto_6699 ?auto_6701 ) ) ( not ( = ?auto_6694 ?auto_6693 ) ) ( not ( = ?auto_6695 ?auto_6693 ) ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6694 ?auto_6696 ) ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( not ( = ?auto_6693 ?auto_6696 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6694 ?auto_6695 ?auto_6696 ?auto_6693 ?auto_6692 )
      ( DELIVER-4PKG-VERIFY ?auto_6693 ?auto_6694 ?auto_6695 ?auto_6696 ?auto_6692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6725 - OBJ
      ?auto_6726 - OBJ
      ?auto_6727 - OBJ
      ?auto_6728 - OBJ
      ?auto_6724 - LOCATION
    )
    :vars
    (
      ?auto_6731 - LOCATION
      ?auto_6729 - CITY
      ?auto_6730 - LOCATION
      ?auto_6733 - LOCATION
      ?auto_6732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6731 ?auto_6729 ) ( IN-CITY ?auto_6724 ?auto_6729 ) ( not ( = ?auto_6724 ?auto_6731 ) ) ( OBJ-AT ?auto_6727 ?auto_6731 ) ( IN-CITY ?auto_6730 ?auto_6729 ) ( not ( = ?auto_6724 ?auto_6730 ) ) ( OBJ-AT ?auto_6725 ?auto_6730 ) ( OBJ-AT ?auto_6728 ?auto_6731 ) ( IN-CITY ?auto_6733 ?auto_6729 ) ( not ( = ?auto_6724 ?auto_6733 ) ) ( OBJ-AT ?auto_6726 ?auto_6733 ) ( TRUCK-AT ?auto_6732 ?auto_6724 ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6731 ?auto_6733 ) ) ( not ( = ?auto_6726 ?auto_6725 ) ) ( not ( = ?auto_6728 ?auto_6725 ) ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6733 ) ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6728 ?auto_6727 ) ) ( not ( = ?auto_6725 ?auto_6727 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6726 ?auto_6728 ?auto_6727 ?auto_6725 ?auto_6724 )
      ( DELIVER-4PKG-VERIFY ?auto_6725 ?auto_6726 ?auto_6727 ?auto_6728 ?auto_6724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6757 - OBJ
      ?auto_6758 - OBJ
      ?auto_6759 - OBJ
      ?auto_6760 - OBJ
      ?auto_6756 - LOCATION
    )
    :vars
    (
      ?auto_6763 - LOCATION
      ?auto_6761 - CITY
      ?auto_6762 - LOCATION
      ?auto_6765 - LOCATION
      ?auto_6764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6763 ?auto_6761 ) ( IN-CITY ?auto_6756 ?auto_6761 ) ( not ( = ?auto_6756 ?auto_6763 ) ) ( OBJ-AT ?auto_6760 ?auto_6763 ) ( IN-CITY ?auto_6762 ?auto_6761 ) ( not ( = ?auto_6756 ?auto_6762 ) ) ( OBJ-AT ?auto_6757 ?auto_6762 ) ( OBJ-AT ?auto_6758 ?auto_6763 ) ( IN-CITY ?auto_6765 ?auto_6761 ) ( not ( = ?auto_6756 ?auto_6765 ) ) ( OBJ-AT ?auto_6759 ?auto_6765 ) ( TRUCK-AT ?auto_6764 ?auto_6756 ) ( not ( = ?auto_6759 ?auto_6758 ) ) ( not ( = ?auto_6763 ?auto_6765 ) ) ( not ( = ?auto_6759 ?auto_6757 ) ) ( not ( = ?auto_6758 ?auto_6757 ) ) ( not ( = ?auto_6762 ?auto_6763 ) ) ( not ( = ?auto_6762 ?auto_6765 ) ) ( not ( = ?auto_6759 ?auto_6760 ) ) ( not ( = ?auto_6758 ?auto_6760 ) ) ( not ( = ?auto_6757 ?auto_6760 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6759 ?auto_6758 ?auto_6760 ?auto_6757 ?auto_6756 )
      ( DELIVER-4PKG-VERIFY ?auto_6757 ?auto_6758 ?auto_6759 ?auto_6760 ?auto_6756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6789 - OBJ
      ?auto_6790 - OBJ
      ?auto_6791 - OBJ
      ?auto_6792 - OBJ
      ?auto_6788 - LOCATION
    )
    :vars
    (
      ?auto_6795 - LOCATION
      ?auto_6793 - CITY
      ?auto_6794 - LOCATION
      ?auto_6797 - LOCATION
      ?auto_6796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6795 ?auto_6793 ) ( IN-CITY ?auto_6788 ?auto_6793 ) ( not ( = ?auto_6788 ?auto_6795 ) ) ( OBJ-AT ?auto_6791 ?auto_6795 ) ( IN-CITY ?auto_6794 ?auto_6793 ) ( not ( = ?auto_6788 ?auto_6794 ) ) ( OBJ-AT ?auto_6789 ?auto_6794 ) ( OBJ-AT ?auto_6790 ?auto_6795 ) ( IN-CITY ?auto_6797 ?auto_6793 ) ( not ( = ?auto_6788 ?auto_6797 ) ) ( OBJ-AT ?auto_6792 ?auto_6797 ) ( TRUCK-AT ?auto_6796 ?auto_6788 ) ( not ( = ?auto_6792 ?auto_6790 ) ) ( not ( = ?auto_6795 ?auto_6797 ) ) ( not ( = ?auto_6792 ?auto_6789 ) ) ( not ( = ?auto_6790 ?auto_6789 ) ) ( not ( = ?auto_6794 ?auto_6795 ) ) ( not ( = ?auto_6794 ?auto_6797 ) ) ( not ( = ?auto_6792 ?auto_6791 ) ) ( not ( = ?auto_6790 ?auto_6791 ) ) ( not ( = ?auto_6789 ?auto_6791 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6792 ?auto_6790 ?auto_6791 ?auto_6789 ?auto_6788 )
      ( DELIVER-4PKG-VERIFY ?auto_6789 ?auto_6790 ?auto_6791 ?auto_6792 ?auto_6788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6923 - OBJ
      ?auto_6924 - OBJ
      ?auto_6925 - OBJ
      ?auto_6926 - OBJ
      ?auto_6922 - LOCATION
    )
    :vars
    (
      ?auto_6929 - LOCATION
      ?auto_6927 - CITY
      ?auto_6928 - LOCATION
      ?auto_6931 - LOCATION
      ?auto_6930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6929 ?auto_6927 ) ( IN-CITY ?auto_6922 ?auto_6927 ) ( not ( = ?auto_6922 ?auto_6929 ) ) ( OBJ-AT ?auto_6924 ?auto_6929 ) ( IN-CITY ?auto_6928 ?auto_6927 ) ( not ( = ?auto_6922 ?auto_6928 ) ) ( OBJ-AT ?auto_6923 ?auto_6928 ) ( OBJ-AT ?auto_6926 ?auto_6929 ) ( IN-CITY ?auto_6931 ?auto_6927 ) ( not ( = ?auto_6922 ?auto_6931 ) ) ( OBJ-AT ?auto_6925 ?auto_6931 ) ( TRUCK-AT ?auto_6930 ?auto_6922 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6925 ?auto_6923 ) ) ( not ( = ?auto_6926 ?auto_6923 ) ) ( not ( = ?auto_6928 ?auto_6929 ) ) ( not ( = ?auto_6928 ?auto_6931 ) ) ( not ( = ?auto_6925 ?auto_6924 ) ) ( not ( = ?auto_6926 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6924 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6925 ?auto_6926 ?auto_6924 ?auto_6923 ?auto_6922 )
      ( DELIVER-4PKG-VERIFY ?auto_6923 ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6922 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6955 - OBJ
      ?auto_6956 - OBJ
      ?auto_6957 - OBJ
      ?auto_6958 - OBJ
      ?auto_6954 - LOCATION
    )
    :vars
    (
      ?auto_6961 - LOCATION
      ?auto_6959 - CITY
      ?auto_6960 - LOCATION
      ?auto_6963 - LOCATION
      ?auto_6962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6961 ?auto_6959 ) ( IN-CITY ?auto_6954 ?auto_6959 ) ( not ( = ?auto_6954 ?auto_6961 ) ) ( OBJ-AT ?auto_6956 ?auto_6961 ) ( IN-CITY ?auto_6960 ?auto_6959 ) ( not ( = ?auto_6954 ?auto_6960 ) ) ( OBJ-AT ?auto_6955 ?auto_6960 ) ( OBJ-AT ?auto_6957 ?auto_6961 ) ( IN-CITY ?auto_6963 ?auto_6959 ) ( not ( = ?auto_6954 ?auto_6963 ) ) ( OBJ-AT ?auto_6958 ?auto_6963 ) ( TRUCK-AT ?auto_6962 ?auto_6954 ) ( not ( = ?auto_6958 ?auto_6957 ) ) ( not ( = ?auto_6961 ?auto_6963 ) ) ( not ( = ?auto_6958 ?auto_6955 ) ) ( not ( = ?auto_6957 ?auto_6955 ) ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( not ( = ?auto_6958 ?auto_6956 ) ) ( not ( = ?auto_6957 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6958 ?auto_6957 ?auto_6956 ?auto_6955 ?auto_6954 )
      ( DELIVER-4PKG-VERIFY ?auto_6955 ?auto_6956 ?auto_6957 ?auto_6958 ?auto_6954 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7158 - OBJ
      ?auto_7159 - OBJ
      ?auto_7160 - OBJ
      ?auto_7161 - OBJ
      ?auto_7157 - LOCATION
    )
    :vars
    (
      ?auto_7164 - LOCATION
      ?auto_7162 - CITY
      ?auto_7163 - LOCATION
      ?auto_7166 - LOCATION
      ?auto_7165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7164 ?auto_7162 ) ( IN-CITY ?auto_7157 ?auto_7162 ) ( not ( = ?auto_7157 ?auto_7164 ) ) ( OBJ-AT ?auto_7158 ?auto_7164 ) ( IN-CITY ?auto_7163 ?auto_7162 ) ( not ( = ?auto_7157 ?auto_7163 ) ) ( OBJ-AT ?auto_7161 ?auto_7163 ) ( OBJ-AT ?auto_7160 ?auto_7164 ) ( IN-CITY ?auto_7166 ?auto_7162 ) ( not ( = ?auto_7157 ?auto_7166 ) ) ( OBJ-AT ?auto_7159 ?auto_7166 ) ( TRUCK-AT ?auto_7165 ?auto_7157 ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7164 ?auto_7166 ) ) ( not ( = ?auto_7159 ?auto_7161 ) ) ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7163 ?auto_7164 ) ) ( not ( = ?auto_7163 ?auto_7166 ) ) ( not ( = ?auto_7159 ?auto_7158 ) ) ( not ( = ?auto_7160 ?auto_7158 ) ) ( not ( = ?auto_7161 ?auto_7158 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7159 ?auto_7160 ?auto_7158 ?auto_7161 ?auto_7157 )
      ( DELIVER-4PKG-VERIFY ?auto_7158 ?auto_7159 ?auto_7160 ?auto_7161 ?auto_7157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7190 - OBJ
      ?auto_7191 - OBJ
      ?auto_7192 - OBJ
      ?auto_7193 - OBJ
      ?auto_7189 - LOCATION
    )
    :vars
    (
      ?auto_7196 - LOCATION
      ?auto_7194 - CITY
      ?auto_7195 - LOCATION
      ?auto_7198 - LOCATION
      ?auto_7197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7196 ?auto_7194 ) ( IN-CITY ?auto_7189 ?auto_7194 ) ( not ( = ?auto_7189 ?auto_7196 ) ) ( OBJ-AT ?auto_7190 ?auto_7196 ) ( IN-CITY ?auto_7195 ?auto_7194 ) ( not ( = ?auto_7189 ?auto_7195 ) ) ( OBJ-AT ?auto_7192 ?auto_7195 ) ( OBJ-AT ?auto_7193 ?auto_7196 ) ( IN-CITY ?auto_7198 ?auto_7194 ) ( not ( = ?auto_7189 ?auto_7198 ) ) ( OBJ-AT ?auto_7191 ?auto_7198 ) ( TRUCK-AT ?auto_7197 ?auto_7189 ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( not ( = ?auto_7196 ?auto_7198 ) ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7193 ?auto_7192 ) ) ( not ( = ?auto_7195 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7198 ) ) ( not ( = ?auto_7191 ?auto_7190 ) ) ( not ( = ?auto_7193 ?auto_7190 ) ) ( not ( = ?auto_7192 ?auto_7190 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7191 ?auto_7193 ?auto_7190 ?auto_7192 ?auto_7189 )
      ( DELIVER-4PKG-VERIFY ?auto_7190 ?auto_7191 ?auto_7192 ?auto_7193 ?auto_7189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7290 - OBJ
      ?auto_7291 - OBJ
      ?auto_7292 - OBJ
      ?auto_7293 - OBJ
      ?auto_7289 - LOCATION
    )
    :vars
    (
      ?auto_7296 - LOCATION
      ?auto_7294 - CITY
      ?auto_7295 - LOCATION
      ?auto_7298 - LOCATION
      ?auto_7297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7296 ?auto_7294 ) ( IN-CITY ?auto_7289 ?auto_7294 ) ( not ( = ?auto_7289 ?auto_7296 ) ) ( OBJ-AT ?auto_7290 ?auto_7296 ) ( IN-CITY ?auto_7295 ?auto_7294 ) ( not ( = ?auto_7289 ?auto_7295 ) ) ( OBJ-AT ?auto_7293 ?auto_7295 ) ( OBJ-AT ?auto_7291 ?auto_7296 ) ( IN-CITY ?auto_7298 ?auto_7294 ) ( not ( = ?auto_7289 ?auto_7298 ) ) ( OBJ-AT ?auto_7292 ?auto_7298 ) ( TRUCK-AT ?auto_7297 ?auto_7289 ) ( not ( = ?auto_7292 ?auto_7291 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7292 ?auto_7293 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) ( not ( = ?auto_7295 ?auto_7296 ) ) ( not ( = ?auto_7295 ?auto_7298 ) ) ( not ( = ?auto_7292 ?auto_7290 ) ) ( not ( = ?auto_7291 ?auto_7290 ) ) ( not ( = ?auto_7293 ?auto_7290 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7292 ?auto_7291 ?auto_7290 ?auto_7293 ?auto_7289 )
      ( DELIVER-4PKG-VERIFY ?auto_7290 ?auto_7291 ?auto_7292 ?auto_7293 ?auto_7289 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7357 - OBJ
      ?auto_7358 - OBJ
      ?auto_7359 - OBJ
      ?auto_7360 - OBJ
      ?auto_7356 - LOCATION
    )
    :vars
    (
      ?auto_7363 - LOCATION
      ?auto_7361 - CITY
      ?auto_7362 - LOCATION
      ?auto_7365 - LOCATION
      ?auto_7364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7363 ?auto_7361 ) ( IN-CITY ?auto_7356 ?auto_7361 ) ( not ( = ?auto_7356 ?auto_7363 ) ) ( OBJ-AT ?auto_7357 ?auto_7363 ) ( IN-CITY ?auto_7362 ?auto_7361 ) ( not ( = ?auto_7356 ?auto_7362 ) ) ( OBJ-AT ?auto_7359 ?auto_7362 ) ( OBJ-AT ?auto_7358 ?auto_7363 ) ( IN-CITY ?auto_7365 ?auto_7361 ) ( not ( = ?auto_7356 ?auto_7365 ) ) ( OBJ-AT ?auto_7360 ?auto_7365 ) ( TRUCK-AT ?auto_7364 ?auto_7356 ) ( not ( = ?auto_7360 ?auto_7358 ) ) ( not ( = ?auto_7363 ?auto_7365 ) ) ( not ( = ?auto_7360 ?auto_7359 ) ) ( not ( = ?auto_7358 ?auto_7359 ) ) ( not ( = ?auto_7362 ?auto_7363 ) ) ( not ( = ?auto_7362 ?auto_7365 ) ) ( not ( = ?auto_7360 ?auto_7357 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7359 ?auto_7357 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7360 ?auto_7358 ?auto_7357 ?auto_7359 ?auto_7356 )
      ( DELIVER-4PKG-VERIFY ?auto_7357 ?auto_7358 ?auto_7359 ?auto_7360 ?auto_7356 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7457 - OBJ
      ?auto_7458 - OBJ
      ?auto_7459 - OBJ
      ?auto_7460 - OBJ
      ?auto_7456 - LOCATION
    )
    :vars
    (
      ?auto_7463 - LOCATION
      ?auto_7461 - CITY
      ?auto_7462 - LOCATION
      ?auto_7465 - LOCATION
      ?auto_7464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7463 ?auto_7461 ) ( IN-CITY ?auto_7456 ?auto_7461 ) ( not ( = ?auto_7456 ?auto_7463 ) ) ( OBJ-AT ?auto_7457 ?auto_7463 ) ( IN-CITY ?auto_7462 ?auto_7461 ) ( not ( = ?auto_7456 ?auto_7462 ) ) ( OBJ-AT ?auto_7458 ?auto_7462 ) ( OBJ-AT ?auto_7460 ?auto_7463 ) ( IN-CITY ?auto_7465 ?auto_7461 ) ( not ( = ?auto_7456 ?auto_7465 ) ) ( OBJ-AT ?auto_7459 ?auto_7465 ) ( TRUCK-AT ?auto_7464 ?auto_7456 ) ( not ( = ?auto_7459 ?auto_7460 ) ) ( not ( = ?auto_7463 ?auto_7465 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( not ( = ?auto_7460 ?auto_7458 ) ) ( not ( = ?auto_7462 ?auto_7463 ) ) ( not ( = ?auto_7462 ?auto_7465 ) ) ( not ( = ?auto_7459 ?auto_7457 ) ) ( not ( = ?auto_7460 ?auto_7457 ) ) ( not ( = ?auto_7458 ?auto_7457 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7459 ?auto_7460 ?auto_7457 ?auto_7458 ?auto_7456 )
      ( DELIVER-4PKG-VERIFY ?auto_7457 ?auto_7458 ?auto_7459 ?auto_7460 ?auto_7456 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7489 - OBJ
      ?auto_7490 - OBJ
      ?auto_7491 - OBJ
      ?auto_7492 - OBJ
      ?auto_7488 - LOCATION
    )
    :vars
    (
      ?auto_7495 - LOCATION
      ?auto_7493 - CITY
      ?auto_7494 - LOCATION
      ?auto_7497 - LOCATION
      ?auto_7496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7495 ?auto_7493 ) ( IN-CITY ?auto_7488 ?auto_7493 ) ( not ( = ?auto_7488 ?auto_7495 ) ) ( OBJ-AT ?auto_7489 ?auto_7495 ) ( IN-CITY ?auto_7494 ?auto_7493 ) ( not ( = ?auto_7488 ?auto_7494 ) ) ( OBJ-AT ?auto_7490 ?auto_7494 ) ( OBJ-AT ?auto_7491 ?auto_7495 ) ( IN-CITY ?auto_7497 ?auto_7493 ) ( not ( = ?auto_7488 ?auto_7497 ) ) ( OBJ-AT ?auto_7492 ?auto_7497 ) ( TRUCK-AT ?auto_7496 ?auto_7488 ) ( not ( = ?auto_7492 ?auto_7491 ) ) ( not ( = ?auto_7495 ?auto_7497 ) ) ( not ( = ?auto_7492 ?auto_7490 ) ) ( not ( = ?auto_7491 ?auto_7490 ) ) ( not ( = ?auto_7494 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7497 ) ) ( not ( = ?auto_7492 ?auto_7489 ) ) ( not ( = ?auto_7491 ?auto_7489 ) ) ( not ( = ?auto_7490 ?auto_7489 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7492 ?auto_7491 ?auto_7489 ?auto_7490 ?auto_7488 )
      ( DELIVER-4PKG-VERIFY ?auto_7489 ?auto_7490 ?auto_7491 ?auto_7492 ?auto_7488 ) )
  )

)

