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
      ?auto_4698 - CITY
      ?auto_4699 - LOCATION
      ?auto_4696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4697 ?auto_4698 ) ( IN-CITY ?auto_4693 ?auto_4698 ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( OBJ-AT ?auto_4695 ?auto_4697 ) ( IN-CITY ?auto_4699 ?auto_4698 ) ( not ( = ?auto_4693 ?auto_4699 ) ) ( OBJ-AT ?auto_4694 ?auto_4699 ) ( TRUCK-AT ?auto_4696 ?auto_4693 ) ( not ( = ?auto_4694 ?auto_4695 ) ) ( not ( = ?auto_4697 ?auto_4699 ) ) )
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
      ?auto_4703 - CITY
      ?auto_4705 - LOCATION
      ?auto_4706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4704 ?auto_4703 ) ( IN-CITY ?auto_4700 ?auto_4703 ) ( not ( = ?auto_4700 ?auto_4704 ) ) ( OBJ-AT ?auto_4701 ?auto_4704 ) ( IN-CITY ?auto_4705 ?auto_4703 ) ( not ( = ?auto_4700 ?auto_4705 ) ) ( OBJ-AT ?auto_4702 ?auto_4705 ) ( TRUCK-AT ?auto_4706 ?auto_4700 ) ( not ( = ?auto_4702 ?auto_4701 ) ) ( not ( = ?auto_4704 ?auto_4705 ) ) )
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
      ?auto_4834 - CITY
      ?auto_4835 - LOCATION
      ?auto_4832 - LOCATION
      ?auto_4833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4831 ?auto_4834 ) ( IN-CITY ?auto_4827 ?auto_4834 ) ( not ( = ?auto_4827 ?auto_4831 ) ) ( OBJ-AT ?auto_4829 ?auto_4831 ) ( IN-CITY ?auto_4835 ?auto_4834 ) ( not ( = ?auto_4827 ?auto_4835 ) ) ( OBJ-AT ?auto_4830 ?auto_4835 ) ( IN-CITY ?auto_4832 ?auto_4834 ) ( not ( = ?auto_4827 ?auto_4832 ) ) ( OBJ-AT ?auto_4828 ?auto_4832 ) ( TRUCK-AT ?auto_4833 ?auto_4827 ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4835 ?auto_4832 ) ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( not ( = ?auto_4830 ?auto_4829 ) ) ( not ( = ?auto_4831 ?auto_4835 ) ) ( not ( = ?auto_4831 ?auto_4832 ) ) )
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
      ?auto_4850 - LOCATION
      ?auto_4851 - CITY
      ?auto_4853 - LOCATION
      ?auto_4854 - LOCATION
      ?auto_4852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4850 ?auto_4851 ) ( IN-CITY ?auto_4846 ?auto_4851 ) ( not ( = ?auto_4846 ?auto_4850 ) ) ( OBJ-AT ?auto_4849 ?auto_4850 ) ( IN-CITY ?auto_4853 ?auto_4851 ) ( not ( = ?auto_4846 ?auto_4853 ) ) ( OBJ-AT ?auto_4847 ?auto_4853 ) ( IN-CITY ?auto_4854 ?auto_4851 ) ( not ( = ?auto_4846 ?auto_4854 ) ) ( OBJ-AT ?auto_4848 ?auto_4854 ) ( TRUCK-AT ?auto_4852 ?auto_4846 ) ( not ( = ?auto_4848 ?auto_4847 ) ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( not ( = ?auto_4848 ?auto_4849 ) ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( not ( = ?auto_4850 ?auto_4853 ) ) ( not ( = ?auto_4850 ?auto_4854 ) ) )
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
      ?auto_4869 - LOCATION
      ?auto_4870 - CITY
      ?auto_4872 - LOCATION
      ?auto_4873 - LOCATION
      ?auto_4871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4869 ?auto_4870 ) ( IN-CITY ?auto_4865 ?auto_4870 ) ( not ( = ?auto_4865 ?auto_4869 ) ) ( OBJ-AT ?auto_4867 ?auto_4869 ) ( IN-CITY ?auto_4872 ?auto_4870 ) ( not ( = ?auto_4865 ?auto_4872 ) ) ( OBJ-AT ?auto_4866 ?auto_4872 ) ( IN-CITY ?auto_4873 ?auto_4870 ) ( not ( = ?auto_4865 ?auto_4873 ) ) ( OBJ-AT ?auto_4868 ?auto_4873 ) ( TRUCK-AT ?auto_4871 ?auto_4865 ) ( not ( = ?auto_4868 ?auto_4866 ) ) ( not ( = ?auto_4872 ?auto_4873 ) ) ( not ( = ?auto_4868 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4869 ?auto_4872 ) ) ( not ( = ?auto_4869 ?auto_4873 ) ) )
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
      ?auto_4908 - LOCATION
      ?auto_4909 - CITY
      ?auto_4911 - LOCATION
      ?auto_4912 - LOCATION
      ?auto_4910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4908 ?auto_4909 ) ( IN-CITY ?auto_4904 ?auto_4909 ) ( not ( = ?auto_4904 ?auto_4908 ) ) ( OBJ-AT ?auto_4905 ?auto_4908 ) ( IN-CITY ?auto_4911 ?auto_4909 ) ( not ( = ?auto_4904 ?auto_4911 ) ) ( OBJ-AT ?auto_4907 ?auto_4911 ) ( IN-CITY ?auto_4912 ?auto_4909 ) ( not ( = ?auto_4904 ?auto_4912 ) ) ( OBJ-AT ?auto_4906 ?auto_4912 ) ( TRUCK-AT ?auto_4910 ?auto_4904 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( not ( = ?auto_4911 ?auto_4912 ) ) ( not ( = ?auto_4906 ?auto_4905 ) ) ( not ( = ?auto_4907 ?auto_4905 ) ) ( not ( = ?auto_4908 ?auto_4911 ) ) ( not ( = ?auto_4908 ?auto_4912 ) ) )
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
      ?auto_4927 - LOCATION
      ?auto_4928 - CITY
      ?auto_4930 - LOCATION
      ?auto_4931 - LOCATION
      ?auto_4929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4927 ?auto_4928 ) ( IN-CITY ?auto_4923 ?auto_4928 ) ( not ( = ?auto_4923 ?auto_4927 ) ) ( OBJ-AT ?auto_4924 ?auto_4927 ) ( IN-CITY ?auto_4930 ?auto_4928 ) ( not ( = ?auto_4923 ?auto_4930 ) ) ( OBJ-AT ?auto_4925 ?auto_4930 ) ( IN-CITY ?auto_4931 ?auto_4928 ) ( not ( = ?auto_4923 ?auto_4931 ) ) ( OBJ-AT ?auto_4926 ?auto_4931 ) ( TRUCK-AT ?auto_4929 ?auto_4923 ) ( not ( = ?auto_4926 ?auto_4925 ) ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( not ( = ?auto_4926 ?auto_4924 ) ) ( not ( = ?auto_4925 ?auto_4924 ) ) ( not ( = ?auto_4927 ?auto_4930 ) ) ( not ( = ?auto_4927 ?auto_4931 ) ) )
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
      ?auto_5973 - CITY
      ?auto_5975 - LOCATION
      ?auto_5976 - LOCATION
      ?auto_5974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5972 ?auto_5973 ) ( IN-CITY ?auto_5967 ?auto_5973 ) ( not ( = ?auto_5967 ?auto_5972 ) ) ( OBJ-AT ?auto_5971 ?auto_5972 ) ( IN-CITY ?auto_5975 ?auto_5973 ) ( not ( = ?auto_5967 ?auto_5975 ) ) ( OBJ-AT ?auto_5970 ?auto_5975 ) ( OBJ-AT ?auto_5969 ?auto_5972 ) ( IN-CITY ?auto_5976 ?auto_5973 ) ( not ( = ?auto_5967 ?auto_5976 ) ) ( OBJ-AT ?auto_5968 ?auto_5976 ) ( TRUCK-AT ?auto_5974 ?auto_5967 ) ( not ( = ?auto_5968 ?auto_5969 ) ) ( not ( = ?auto_5972 ?auto_5976 ) ) ( not ( = ?auto_5968 ?auto_5970 ) ) ( not ( = ?auto_5969 ?auto_5970 ) ) ( not ( = ?auto_5975 ?auto_5972 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) ( not ( = ?auto_5968 ?auto_5971 ) ) ( not ( = ?auto_5969 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) )
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
      ?auto_6004 - LOCATION
      ?auto_6006 - CITY
      ?auto_6007 - LOCATION
      ?auto_6008 - LOCATION
      ?auto_6005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6004 ?auto_6006 ) ( IN-CITY ?auto_5999 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6004 ) ) ( OBJ-AT ?auto_6002 ?auto_6004 ) ( IN-CITY ?auto_6007 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6007 ) ) ( OBJ-AT ?auto_6003 ?auto_6007 ) ( OBJ-AT ?auto_6001 ?auto_6004 ) ( IN-CITY ?auto_6008 ?auto_6006 ) ( not ( = ?auto_5999 ?auto_6008 ) ) ( OBJ-AT ?auto_6000 ?auto_6008 ) ( TRUCK-AT ?auto_6005 ?auto_5999 ) ( not ( = ?auto_6000 ?auto_6001 ) ) ( not ( = ?auto_6004 ?auto_6008 ) ) ( not ( = ?auto_6000 ?auto_6003 ) ) ( not ( = ?auto_6001 ?auto_6003 ) ) ( not ( = ?auto_6007 ?auto_6004 ) ) ( not ( = ?auto_6007 ?auto_6008 ) ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6003 ?auto_6002 ) ) )
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
      ?auto_6036 - LOCATION
      ?auto_6037 - CITY
      ?auto_6039 - LOCATION
      ?auto_6038 - LOCATION
      ?auto_6040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6036 ?auto_6037 ) ( IN-CITY ?auto_6031 ?auto_6037 ) ( not ( = ?auto_6031 ?auto_6036 ) ) ( OBJ-AT ?auto_6035 ?auto_6036 ) ( IN-CITY ?auto_6039 ?auto_6037 ) ( not ( = ?auto_6031 ?auto_6039 ) ) ( OBJ-AT ?auto_6033 ?auto_6039 ) ( OBJ-AT ?auto_6034 ?auto_6036 ) ( IN-CITY ?auto_6038 ?auto_6037 ) ( not ( = ?auto_6031 ?auto_6038 ) ) ( OBJ-AT ?auto_6032 ?auto_6038 ) ( TRUCK-AT ?auto_6040 ?auto_6031 ) ( not ( = ?auto_6032 ?auto_6034 ) ) ( not ( = ?auto_6036 ?auto_6038 ) ) ( not ( = ?auto_6032 ?auto_6033 ) ) ( not ( = ?auto_6034 ?auto_6033 ) ) ( not ( = ?auto_6039 ?auto_6036 ) ) ( not ( = ?auto_6039 ?auto_6038 ) ) ( not ( = ?auto_6032 ?auto_6035 ) ) ( not ( = ?auto_6034 ?auto_6035 ) ) ( not ( = ?auto_6033 ?auto_6035 ) ) )
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
      ?auto_6068 - LOCATION
      ?auto_6069 - CITY
      ?auto_6071 - LOCATION
      ?auto_6070 - LOCATION
      ?auto_6072 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6068 ?auto_6069 ) ( IN-CITY ?auto_6063 ?auto_6069 ) ( not ( = ?auto_6063 ?auto_6068 ) ) ( OBJ-AT ?auto_6066 ?auto_6068 ) ( IN-CITY ?auto_6071 ?auto_6069 ) ( not ( = ?auto_6063 ?auto_6071 ) ) ( OBJ-AT ?auto_6065 ?auto_6071 ) ( OBJ-AT ?auto_6067 ?auto_6068 ) ( IN-CITY ?auto_6070 ?auto_6069 ) ( not ( = ?auto_6063 ?auto_6070 ) ) ( OBJ-AT ?auto_6064 ?auto_6070 ) ( TRUCK-AT ?auto_6072 ?auto_6063 ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( not ( = ?auto_6067 ?auto_6065 ) ) ( not ( = ?auto_6071 ?auto_6068 ) ) ( not ( = ?auto_6071 ?auto_6070 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( not ( = ?auto_6067 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) )
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
      ?auto_6168 - LOCATION
      ?auto_6169 - CITY
      ?auto_6171 - LOCATION
      ?auto_6170 - LOCATION
      ?auto_6172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6168 ?auto_6169 ) ( IN-CITY ?auto_6163 ?auto_6169 ) ( not ( = ?auto_6163 ?auto_6168 ) ) ( OBJ-AT ?auto_6165 ?auto_6168 ) ( IN-CITY ?auto_6171 ?auto_6169 ) ( not ( = ?auto_6163 ?auto_6171 ) ) ( OBJ-AT ?auto_6167 ?auto_6171 ) ( OBJ-AT ?auto_6166 ?auto_6168 ) ( IN-CITY ?auto_6170 ?auto_6169 ) ( not ( = ?auto_6163 ?auto_6170 ) ) ( OBJ-AT ?auto_6164 ?auto_6170 ) ( TRUCK-AT ?auto_6172 ?auto_6163 ) ( not ( = ?auto_6164 ?auto_6166 ) ) ( not ( = ?auto_6168 ?auto_6170 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6171 ?auto_6168 ) ) ( not ( = ?auto_6171 ?auto_6170 ) ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6166 ?auto_6165 ) ) ( not ( = ?auto_6167 ?auto_6165 ) ) )
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
      ?auto_6200 - LOCATION
      ?auto_6201 - CITY
      ?auto_6203 - LOCATION
      ?auto_6202 - LOCATION
      ?auto_6204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6200 ?auto_6201 ) ( IN-CITY ?auto_6195 ?auto_6201 ) ( not ( = ?auto_6195 ?auto_6200 ) ) ( OBJ-AT ?auto_6197 ?auto_6200 ) ( IN-CITY ?auto_6203 ?auto_6201 ) ( not ( = ?auto_6195 ?auto_6203 ) ) ( OBJ-AT ?auto_6198 ?auto_6203 ) ( OBJ-AT ?auto_6199 ?auto_6200 ) ( IN-CITY ?auto_6202 ?auto_6201 ) ( not ( = ?auto_6195 ?auto_6202 ) ) ( OBJ-AT ?auto_6196 ?auto_6202 ) ( TRUCK-AT ?auto_6204 ?auto_6195 ) ( not ( = ?auto_6196 ?auto_6199 ) ) ( not ( = ?auto_6200 ?auto_6202 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6199 ?auto_6198 ) ) ( not ( = ?auto_6203 ?auto_6200 ) ) ( not ( = ?auto_6203 ?auto_6202 ) ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6199 ?auto_6197 ) ) ( not ( = ?auto_6198 ?auto_6197 ) ) )
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
      ?auto_6300 - LOCATION
      ?auto_6301 - CITY
      ?auto_6303 - LOCATION
      ?auto_6302 - LOCATION
      ?auto_6304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6300 ?auto_6301 ) ( IN-CITY ?auto_6295 ?auto_6301 ) ( not ( = ?auto_6295 ?auto_6300 ) ) ( OBJ-AT ?auto_6299 ?auto_6300 ) ( IN-CITY ?auto_6303 ?auto_6301 ) ( not ( = ?auto_6295 ?auto_6303 ) ) ( OBJ-AT ?auto_6298 ?auto_6303 ) ( OBJ-AT ?auto_6296 ?auto_6300 ) ( IN-CITY ?auto_6302 ?auto_6301 ) ( not ( = ?auto_6295 ?auto_6302 ) ) ( OBJ-AT ?auto_6297 ?auto_6302 ) ( TRUCK-AT ?auto_6304 ?auto_6295 ) ( not ( = ?auto_6297 ?auto_6296 ) ) ( not ( = ?auto_6300 ?auto_6302 ) ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( not ( = ?auto_6303 ?auto_6300 ) ) ( not ( = ?auto_6303 ?auto_6302 ) ) ( not ( = ?auto_6297 ?auto_6299 ) ) ( not ( = ?auto_6296 ?auto_6299 ) ) ( not ( = ?auto_6298 ?auto_6299 ) ) )
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
      ?auto_6332 - LOCATION
      ?auto_6333 - CITY
      ?auto_6335 - LOCATION
      ?auto_6334 - LOCATION
      ?auto_6336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6332 ?auto_6333 ) ( IN-CITY ?auto_6327 ?auto_6333 ) ( not ( = ?auto_6327 ?auto_6332 ) ) ( OBJ-AT ?auto_6330 ?auto_6332 ) ( IN-CITY ?auto_6335 ?auto_6333 ) ( not ( = ?auto_6327 ?auto_6335 ) ) ( OBJ-AT ?auto_6331 ?auto_6335 ) ( OBJ-AT ?auto_6328 ?auto_6332 ) ( IN-CITY ?auto_6334 ?auto_6333 ) ( not ( = ?auto_6327 ?auto_6334 ) ) ( OBJ-AT ?auto_6329 ?auto_6334 ) ( TRUCK-AT ?auto_6336 ?auto_6327 ) ( not ( = ?auto_6329 ?auto_6328 ) ) ( not ( = ?auto_6332 ?auto_6334 ) ) ( not ( = ?auto_6329 ?auto_6331 ) ) ( not ( = ?auto_6328 ?auto_6331 ) ) ( not ( = ?auto_6335 ?auto_6332 ) ) ( not ( = ?auto_6335 ?auto_6334 ) ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( not ( = ?auto_6328 ?auto_6330 ) ) ( not ( = ?auto_6331 ?auto_6330 ) ) )
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
      ?auto_6433 - LOCATION
      ?auto_6434 - CITY
      ?auto_6436 - LOCATION
      ?auto_6435 - LOCATION
      ?auto_6437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6433 ?auto_6434 ) ( IN-CITY ?auto_6428 ?auto_6434 ) ( not ( = ?auto_6428 ?auto_6433 ) ) ( OBJ-AT ?auto_6432 ?auto_6433 ) ( IN-CITY ?auto_6436 ?auto_6434 ) ( not ( = ?auto_6428 ?auto_6436 ) ) ( OBJ-AT ?auto_6430 ?auto_6436 ) ( OBJ-AT ?auto_6429 ?auto_6433 ) ( IN-CITY ?auto_6435 ?auto_6434 ) ( not ( = ?auto_6428 ?auto_6435 ) ) ( OBJ-AT ?auto_6431 ?auto_6435 ) ( TRUCK-AT ?auto_6437 ?auto_6428 ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6431 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6436 ?auto_6433 ) ) ( not ( = ?auto_6436 ?auto_6435 ) ) ( not ( = ?auto_6431 ?auto_6432 ) ) ( not ( = ?auto_6429 ?auto_6432 ) ) ( not ( = ?auto_6430 ?auto_6432 ) ) )
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
      ?auto_6465 - LOCATION
      ?auto_6466 - CITY
      ?auto_6468 - LOCATION
      ?auto_6467 - LOCATION
      ?auto_6469 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6465 ?auto_6466 ) ( IN-CITY ?auto_6460 ?auto_6466 ) ( not ( = ?auto_6460 ?auto_6465 ) ) ( OBJ-AT ?auto_6463 ?auto_6465 ) ( IN-CITY ?auto_6468 ?auto_6466 ) ( not ( = ?auto_6460 ?auto_6468 ) ) ( OBJ-AT ?auto_6462 ?auto_6468 ) ( OBJ-AT ?auto_6461 ?auto_6465 ) ( IN-CITY ?auto_6467 ?auto_6466 ) ( not ( = ?auto_6460 ?auto_6467 ) ) ( OBJ-AT ?auto_6464 ?auto_6467 ) ( TRUCK-AT ?auto_6469 ?auto_6460 ) ( not ( = ?auto_6464 ?auto_6461 ) ) ( not ( = ?auto_6465 ?auto_6467 ) ) ( not ( = ?auto_6464 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6468 ?auto_6465 ) ) ( not ( = ?auto_6468 ?auto_6467 ) ) ( not ( = ?auto_6464 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6462 ?auto_6463 ) ) )
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
      ?auto_6530 - LOCATION
      ?auto_6531 - CITY
      ?auto_6533 - LOCATION
      ?auto_6532 - LOCATION
      ?auto_6534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6530 ?auto_6531 ) ( IN-CITY ?auto_6525 ?auto_6531 ) ( not ( = ?auto_6525 ?auto_6530 ) ) ( OBJ-AT ?auto_6527 ?auto_6530 ) ( IN-CITY ?auto_6533 ?auto_6531 ) ( not ( = ?auto_6525 ?auto_6533 ) ) ( OBJ-AT ?auto_6529 ?auto_6533 ) ( OBJ-AT ?auto_6526 ?auto_6530 ) ( IN-CITY ?auto_6532 ?auto_6531 ) ( not ( = ?auto_6525 ?auto_6532 ) ) ( OBJ-AT ?auto_6528 ?auto_6532 ) ( TRUCK-AT ?auto_6534 ?auto_6525 ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6526 ?auto_6529 ) ) ( not ( = ?auto_6533 ?auto_6530 ) ) ( not ( = ?auto_6533 ?auto_6532 ) ) ( not ( = ?auto_6528 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6529 ?auto_6527 ) ) )
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
      ?auto_6597 - LOCATION
      ?auto_6598 - CITY
      ?auto_6600 - LOCATION
      ?auto_6599 - LOCATION
      ?auto_6601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6597 ?auto_6598 ) ( IN-CITY ?auto_6592 ?auto_6598 ) ( not ( = ?auto_6592 ?auto_6597 ) ) ( OBJ-AT ?auto_6594 ?auto_6597 ) ( IN-CITY ?auto_6600 ?auto_6598 ) ( not ( = ?auto_6592 ?auto_6600 ) ) ( OBJ-AT ?auto_6595 ?auto_6600 ) ( OBJ-AT ?auto_6593 ?auto_6597 ) ( IN-CITY ?auto_6599 ?auto_6598 ) ( not ( = ?auto_6592 ?auto_6599 ) ) ( OBJ-AT ?auto_6596 ?auto_6599 ) ( TRUCK-AT ?auto_6601 ?auto_6592 ) ( not ( = ?auto_6596 ?auto_6593 ) ) ( not ( = ?auto_6597 ?auto_6599 ) ) ( not ( = ?auto_6596 ?auto_6595 ) ) ( not ( = ?auto_6593 ?auto_6595 ) ) ( not ( = ?auto_6600 ?auto_6597 ) ) ( not ( = ?auto_6600 ?auto_6599 ) ) ( not ( = ?auto_6596 ?auto_6594 ) ) ( not ( = ?auto_6593 ?auto_6594 ) ) ( not ( = ?auto_6595 ?auto_6594 ) ) )
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
      ?auto_6697 - LOCATION
      ?auto_6698 - CITY
      ?auto_6700 - LOCATION
      ?auto_6699 - LOCATION
      ?auto_6701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6697 ?auto_6698 ) ( IN-CITY ?auto_6692 ?auto_6698 ) ( not ( = ?auto_6692 ?auto_6697 ) ) ( OBJ-AT ?auto_6696 ?auto_6697 ) ( IN-CITY ?auto_6700 ?auto_6698 ) ( not ( = ?auto_6692 ?auto_6700 ) ) ( OBJ-AT ?auto_6693 ?auto_6700 ) ( OBJ-AT ?auto_6695 ?auto_6697 ) ( IN-CITY ?auto_6699 ?auto_6698 ) ( not ( = ?auto_6692 ?auto_6699 ) ) ( OBJ-AT ?auto_6694 ?auto_6699 ) ( TRUCK-AT ?auto_6701 ?auto_6692 ) ( not ( = ?auto_6694 ?auto_6695 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( not ( = ?auto_6694 ?auto_6693 ) ) ( not ( = ?auto_6695 ?auto_6693 ) ) ( not ( = ?auto_6700 ?auto_6697 ) ) ( not ( = ?auto_6700 ?auto_6699 ) ) ( not ( = ?auto_6694 ?auto_6696 ) ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( not ( = ?auto_6693 ?auto_6696 ) ) )
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
      ?auto_6729 - LOCATION
      ?auto_6730 - CITY
      ?auto_6732 - LOCATION
      ?auto_6731 - LOCATION
      ?auto_6733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6729 ?auto_6730 ) ( IN-CITY ?auto_6724 ?auto_6730 ) ( not ( = ?auto_6724 ?auto_6729 ) ) ( OBJ-AT ?auto_6727 ?auto_6729 ) ( IN-CITY ?auto_6732 ?auto_6730 ) ( not ( = ?auto_6724 ?auto_6732 ) ) ( OBJ-AT ?auto_6725 ?auto_6732 ) ( OBJ-AT ?auto_6728 ?auto_6729 ) ( IN-CITY ?auto_6731 ?auto_6730 ) ( not ( = ?auto_6724 ?auto_6731 ) ) ( OBJ-AT ?auto_6726 ?auto_6731 ) ( TRUCK-AT ?auto_6733 ?auto_6724 ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6726 ?auto_6725 ) ) ( not ( = ?auto_6728 ?auto_6725 ) ) ( not ( = ?auto_6732 ?auto_6729 ) ) ( not ( = ?auto_6732 ?auto_6731 ) ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6728 ?auto_6727 ) ) ( not ( = ?auto_6725 ?auto_6727 ) ) )
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
      ?auto_6761 - LOCATION
      ?auto_6762 - CITY
      ?auto_6764 - LOCATION
      ?auto_6763 - LOCATION
      ?auto_6765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6761 ?auto_6762 ) ( IN-CITY ?auto_6756 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6761 ) ) ( OBJ-AT ?auto_6760 ?auto_6761 ) ( IN-CITY ?auto_6764 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6764 ) ) ( OBJ-AT ?auto_6757 ?auto_6764 ) ( OBJ-AT ?auto_6758 ?auto_6761 ) ( IN-CITY ?auto_6763 ?auto_6762 ) ( not ( = ?auto_6756 ?auto_6763 ) ) ( OBJ-AT ?auto_6759 ?auto_6763 ) ( TRUCK-AT ?auto_6765 ?auto_6756 ) ( not ( = ?auto_6759 ?auto_6758 ) ) ( not ( = ?auto_6761 ?auto_6763 ) ) ( not ( = ?auto_6759 ?auto_6757 ) ) ( not ( = ?auto_6758 ?auto_6757 ) ) ( not ( = ?auto_6764 ?auto_6761 ) ) ( not ( = ?auto_6764 ?auto_6763 ) ) ( not ( = ?auto_6759 ?auto_6760 ) ) ( not ( = ?auto_6758 ?auto_6760 ) ) ( not ( = ?auto_6757 ?auto_6760 ) ) )
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
      ?auto_6793 - LOCATION
      ?auto_6794 - CITY
      ?auto_6796 - LOCATION
      ?auto_6795 - LOCATION
      ?auto_6797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6793 ?auto_6794 ) ( IN-CITY ?auto_6788 ?auto_6794 ) ( not ( = ?auto_6788 ?auto_6793 ) ) ( OBJ-AT ?auto_6791 ?auto_6793 ) ( IN-CITY ?auto_6796 ?auto_6794 ) ( not ( = ?auto_6788 ?auto_6796 ) ) ( OBJ-AT ?auto_6789 ?auto_6796 ) ( OBJ-AT ?auto_6790 ?auto_6793 ) ( IN-CITY ?auto_6795 ?auto_6794 ) ( not ( = ?auto_6788 ?auto_6795 ) ) ( OBJ-AT ?auto_6792 ?auto_6795 ) ( TRUCK-AT ?auto_6797 ?auto_6788 ) ( not ( = ?auto_6792 ?auto_6790 ) ) ( not ( = ?auto_6793 ?auto_6795 ) ) ( not ( = ?auto_6792 ?auto_6789 ) ) ( not ( = ?auto_6790 ?auto_6789 ) ) ( not ( = ?auto_6796 ?auto_6793 ) ) ( not ( = ?auto_6796 ?auto_6795 ) ) ( not ( = ?auto_6792 ?auto_6791 ) ) ( not ( = ?auto_6790 ?auto_6791 ) ) ( not ( = ?auto_6789 ?auto_6791 ) ) )
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
      ?auto_6927 - LOCATION
      ?auto_6928 - CITY
      ?auto_6930 - LOCATION
      ?auto_6929 - LOCATION
      ?auto_6931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6927 ?auto_6928 ) ( IN-CITY ?auto_6922 ?auto_6928 ) ( not ( = ?auto_6922 ?auto_6927 ) ) ( OBJ-AT ?auto_6924 ?auto_6927 ) ( IN-CITY ?auto_6930 ?auto_6928 ) ( not ( = ?auto_6922 ?auto_6930 ) ) ( OBJ-AT ?auto_6923 ?auto_6930 ) ( OBJ-AT ?auto_6926 ?auto_6927 ) ( IN-CITY ?auto_6929 ?auto_6928 ) ( not ( = ?auto_6922 ?auto_6929 ) ) ( OBJ-AT ?auto_6925 ?auto_6929 ) ( TRUCK-AT ?auto_6931 ?auto_6922 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6927 ?auto_6929 ) ) ( not ( = ?auto_6925 ?auto_6923 ) ) ( not ( = ?auto_6926 ?auto_6923 ) ) ( not ( = ?auto_6930 ?auto_6927 ) ) ( not ( = ?auto_6930 ?auto_6929 ) ) ( not ( = ?auto_6925 ?auto_6924 ) ) ( not ( = ?auto_6926 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6924 ) ) )
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
      ?auto_6959 - LOCATION
      ?auto_6960 - CITY
      ?auto_6962 - LOCATION
      ?auto_6961 - LOCATION
      ?auto_6963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6959 ?auto_6960 ) ( IN-CITY ?auto_6954 ?auto_6960 ) ( not ( = ?auto_6954 ?auto_6959 ) ) ( OBJ-AT ?auto_6956 ?auto_6959 ) ( IN-CITY ?auto_6962 ?auto_6960 ) ( not ( = ?auto_6954 ?auto_6962 ) ) ( OBJ-AT ?auto_6955 ?auto_6962 ) ( OBJ-AT ?auto_6957 ?auto_6959 ) ( IN-CITY ?auto_6961 ?auto_6960 ) ( not ( = ?auto_6954 ?auto_6961 ) ) ( OBJ-AT ?auto_6958 ?auto_6961 ) ( TRUCK-AT ?auto_6963 ?auto_6954 ) ( not ( = ?auto_6958 ?auto_6957 ) ) ( not ( = ?auto_6959 ?auto_6961 ) ) ( not ( = ?auto_6958 ?auto_6955 ) ) ( not ( = ?auto_6957 ?auto_6955 ) ) ( not ( = ?auto_6962 ?auto_6959 ) ) ( not ( = ?auto_6962 ?auto_6961 ) ) ( not ( = ?auto_6958 ?auto_6956 ) ) ( not ( = ?auto_6957 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) )
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
      ?auto_7162 - LOCATION
      ?auto_7163 - CITY
      ?auto_7165 - LOCATION
      ?auto_7164 - LOCATION
      ?auto_7166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7162 ?auto_7163 ) ( IN-CITY ?auto_7157 ?auto_7163 ) ( not ( = ?auto_7157 ?auto_7162 ) ) ( OBJ-AT ?auto_7158 ?auto_7162 ) ( IN-CITY ?auto_7165 ?auto_7163 ) ( not ( = ?auto_7157 ?auto_7165 ) ) ( OBJ-AT ?auto_7161 ?auto_7165 ) ( OBJ-AT ?auto_7160 ?auto_7162 ) ( IN-CITY ?auto_7164 ?auto_7163 ) ( not ( = ?auto_7157 ?auto_7164 ) ) ( OBJ-AT ?auto_7159 ?auto_7164 ) ( TRUCK-AT ?auto_7166 ?auto_7157 ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7162 ?auto_7164 ) ) ( not ( = ?auto_7159 ?auto_7161 ) ) ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7165 ?auto_7162 ) ) ( not ( = ?auto_7165 ?auto_7164 ) ) ( not ( = ?auto_7159 ?auto_7158 ) ) ( not ( = ?auto_7160 ?auto_7158 ) ) ( not ( = ?auto_7161 ?auto_7158 ) ) )
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
      ?auto_7194 - LOCATION
      ?auto_7195 - CITY
      ?auto_7197 - LOCATION
      ?auto_7196 - LOCATION
      ?auto_7198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7194 ?auto_7195 ) ( IN-CITY ?auto_7189 ?auto_7195 ) ( not ( = ?auto_7189 ?auto_7194 ) ) ( OBJ-AT ?auto_7190 ?auto_7194 ) ( IN-CITY ?auto_7197 ?auto_7195 ) ( not ( = ?auto_7189 ?auto_7197 ) ) ( OBJ-AT ?auto_7192 ?auto_7197 ) ( OBJ-AT ?auto_7193 ?auto_7194 ) ( IN-CITY ?auto_7196 ?auto_7195 ) ( not ( = ?auto_7189 ?auto_7196 ) ) ( OBJ-AT ?auto_7191 ?auto_7196 ) ( TRUCK-AT ?auto_7198 ?auto_7189 ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( not ( = ?auto_7194 ?auto_7196 ) ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7193 ?auto_7192 ) ) ( not ( = ?auto_7197 ?auto_7194 ) ) ( not ( = ?auto_7197 ?auto_7196 ) ) ( not ( = ?auto_7191 ?auto_7190 ) ) ( not ( = ?auto_7193 ?auto_7190 ) ) ( not ( = ?auto_7192 ?auto_7190 ) ) )
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
      ?auto_7294 - LOCATION
      ?auto_7295 - CITY
      ?auto_7297 - LOCATION
      ?auto_7296 - LOCATION
      ?auto_7298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7294 ?auto_7295 ) ( IN-CITY ?auto_7289 ?auto_7295 ) ( not ( = ?auto_7289 ?auto_7294 ) ) ( OBJ-AT ?auto_7290 ?auto_7294 ) ( IN-CITY ?auto_7297 ?auto_7295 ) ( not ( = ?auto_7289 ?auto_7297 ) ) ( OBJ-AT ?auto_7293 ?auto_7297 ) ( OBJ-AT ?auto_7291 ?auto_7294 ) ( IN-CITY ?auto_7296 ?auto_7295 ) ( not ( = ?auto_7289 ?auto_7296 ) ) ( OBJ-AT ?auto_7292 ?auto_7296 ) ( TRUCK-AT ?auto_7298 ?auto_7289 ) ( not ( = ?auto_7292 ?auto_7291 ) ) ( not ( = ?auto_7294 ?auto_7296 ) ) ( not ( = ?auto_7292 ?auto_7293 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) ( not ( = ?auto_7297 ?auto_7294 ) ) ( not ( = ?auto_7297 ?auto_7296 ) ) ( not ( = ?auto_7292 ?auto_7290 ) ) ( not ( = ?auto_7291 ?auto_7290 ) ) ( not ( = ?auto_7293 ?auto_7290 ) ) )
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
      ?auto_7361 - LOCATION
      ?auto_7362 - CITY
      ?auto_7364 - LOCATION
      ?auto_7363 - LOCATION
      ?auto_7365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7361 ?auto_7362 ) ( IN-CITY ?auto_7356 ?auto_7362 ) ( not ( = ?auto_7356 ?auto_7361 ) ) ( OBJ-AT ?auto_7357 ?auto_7361 ) ( IN-CITY ?auto_7364 ?auto_7362 ) ( not ( = ?auto_7356 ?auto_7364 ) ) ( OBJ-AT ?auto_7359 ?auto_7364 ) ( OBJ-AT ?auto_7358 ?auto_7361 ) ( IN-CITY ?auto_7363 ?auto_7362 ) ( not ( = ?auto_7356 ?auto_7363 ) ) ( OBJ-AT ?auto_7360 ?auto_7363 ) ( TRUCK-AT ?auto_7365 ?auto_7356 ) ( not ( = ?auto_7360 ?auto_7358 ) ) ( not ( = ?auto_7361 ?auto_7363 ) ) ( not ( = ?auto_7360 ?auto_7359 ) ) ( not ( = ?auto_7358 ?auto_7359 ) ) ( not ( = ?auto_7364 ?auto_7361 ) ) ( not ( = ?auto_7364 ?auto_7363 ) ) ( not ( = ?auto_7360 ?auto_7357 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7359 ?auto_7357 ) ) )
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
      ?auto_7461 - LOCATION
      ?auto_7462 - CITY
      ?auto_7464 - LOCATION
      ?auto_7463 - LOCATION
      ?auto_7465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7461 ?auto_7462 ) ( IN-CITY ?auto_7456 ?auto_7462 ) ( not ( = ?auto_7456 ?auto_7461 ) ) ( OBJ-AT ?auto_7457 ?auto_7461 ) ( IN-CITY ?auto_7464 ?auto_7462 ) ( not ( = ?auto_7456 ?auto_7464 ) ) ( OBJ-AT ?auto_7458 ?auto_7464 ) ( OBJ-AT ?auto_7460 ?auto_7461 ) ( IN-CITY ?auto_7463 ?auto_7462 ) ( not ( = ?auto_7456 ?auto_7463 ) ) ( OBJ-AT ?auto_7459 ?auto_7463 ) ( TRUCK-AT ?auto_7465 ?auto_7456 ) ( not ( = ?auto_7459 ?auto_7460 ) ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( not ( = ?auto_7460 ?auto_7458 ) ) ( not ( = ?auto_7464 ?auto_7461 ) ) ( not ( = ?auto_7464 ?auto_7463 ) ) ( not ( = ?auto_7459 ?auto_7457 ) ) ( not ( = ?auto_7460 ?auto_7457 ) ) ( not ( = ?auto_7458 ?auto_7457 ) ) )
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
      ?auto_7493 - LOCATION
      ?auto_7494 - CITY
      ?auto_7496 - LOCATION
      ?auto_7495 - LOCATION
      ?auto_7497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7493 ?auto_7494 ) ( IN-CITY ?auto_7488 ?auto_7494 ) ( not ( = ?auto_7488 ?auto_7493 ) ) ( OBJ-AT ?auto_7489 ?auto_7493 ) ( IN-CITY ?auto_7496 ?auto_7494 ) ( not ( = ?auto_7488 ?auto_7496 ) ) ( OBJ-AT ?auto_7490 ?auto_7496 ) ( OBJ-AT ?auto_7491 ?auto_7493 ) ( IN-CITY ?auto_7495 ?auto_7494 ) ( not ( = ?auto_7488 ?auto_7495 ) ) ( OBJ-AT ?auto_7492 ?auto_7495 ) ( TRUCK-AT ?auto_7497 ?auto_7488 ) ( not ( = ?auto_7492 ?auto_7491 ) ) ( not ( = ?auto_7493 ?auto_7495 ) ) ( not ( = ?auto_7492 ?auto_7490 ) ) ( not ( = ?auto_7491 ?auto_7490 ) ) ( not ( = ?auto_7496 ?auto_7493 ) ) ( not ( = ?auto_7496 ?auto_7495 ) ) ( not ( = ?auto_7492 ?auto_7489 ) ) ( not ( = ?auto_7491 ?auto_7489 ) ) ( not ( = ?auto_7490 ?auto_7489 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7492 ?auto_7491 ?auto_7489 ?auto_7490 ?auto_7488 )
      ( DELIVER-4PKG-VERIFY ?auto_7489 ?auto_7490 ?auto_7491 ?auto_7492 ?auto_7488 ) )
  )

)

