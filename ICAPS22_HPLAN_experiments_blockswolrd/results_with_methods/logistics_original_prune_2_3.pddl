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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_737 - OBJ
      ?auto_736 - LOCATION
    )
    :vars
    (
      ?auto_738 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_738 ?auto_736 ) ( IN-TRUCK ?auto_737 ?auto_738 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_737 ?auto_738 ?auto_736 )
      ( DELIVER-1PKG-VERIFY ?auto_737 ?auto_736 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_744 - OBJ
      ?auto_743 - LOCATION
    )
    :vars
    (
      ?auto_745 - TRUCK
      ?auto_746 - LOCATION
      ?auto_747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_744 ?auto_745 ) ( TRUCK-AT ?auto_745 ?auto_746 ) ( IN-CITY ?auto_746 ?auto_747 ) ( IN-CITY ?auto_743 ?auto_747 ) ( not ( = ?auto_743 ?auto_746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_745 ?auto_746 ?auto_743 ?auto_747 )
      ( DELIVER-1PKG ?auto_744 ?auto_743 )
      ( DELIVER-1PKG-VERIFY ?auto_744 ?auto_743 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_755 - OBJ
      ?auto_754 - LOCATION
    )
    :vars
    (
      ?auto_757 - TRUCK
      ?auto_756 - LOCATION
      ?auto_758 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_757 ?auto_756 ) ( IN-CITY ?auto_756 ?auto_758 ) ( IN-CITY ?auto_754 ?auto_758 ) ( not ( = ?auto_754 ?auto_756 ) ) ( OBJ-AT ?auto_755 ?auto_756 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_755 ?auto_757 ?auto_756 )
      ( DELIVER-1PKG ?auto_755 ?auto_754 )
      ( DELIVER-1PKG-VERIFY ?auto_755 ?auto_754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_766 - OBJ
      ?auto_765 - LOCATION
    )
    :vars
    (
      ?auto_768 - LOCATION
      ?auto_767 - CITY
      ?auto_769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_768 ?auto_767 ) ( IN-CITY ?auto_765 ?auto_767 ) ( not ( = ?auto_765 ?auto_768 ) ) ( OBJ-AT ?auto_766 ?auto_768 ) ( TRUCK-AT ?auto_769 ?auto_765 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_769 ?auto_765 ?auto_768 ?auto_767 )
      ( DELIVER-1PKG ?auto_766 ?auto_765 )
      ( DELIVER-1PKG-VERIFY ?auto_766 ?auto_765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_791 - OBJ
      ?auto_792 - OBJ
      ?auto_790 - LOCATION
    )
    :vars
    (
      ?auto_793 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_793 ?auto_790 ) ( IN-TRUCK ?auto_792 ?auto_793 ) ( OBJ-AT ?auto_791 ?auto_790 ) ( not ( = ?auto_791 ?auto_792 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_792 ?auto_790 )
      ( DELIVER-2PKG-VERIFY ?auto_791 ?auto_792 ?auto_790 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_795 - OBJ
      ?auto_796 - OBJ
      ?auto_794 - LOCATION
    )
    :vars
    (
      ?auto_797 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_797 ?auto_794 ) ( IN-TRUCK ?auto_795 ?auto_797 ) ( OBJ-AT ?auto_796 ?auto_794 ) ( not ( = ?auto_795 ?auto_796 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_795 ?auto_794 )
      ( DELIVER-2PKG-VERIFY ?auto_795 ?auto_796 ?auto_794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_808 - OBJ
      ?auto_809 - OBJ
      ?auto_807 - LOCATION
    )
    :vars
    (
      ?auto_811 - TRUCK
      ?auto_810 - LOCATION
      ?auto_812 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_809 ?auto_811 ) ( TRUCK-AT ?auto_811 ?auto_810 ) ( IN-CITY ?auto_810 ?auto_812 ) ( IN-CITY ?auto_807 ?auto_812 ) ( not ( = ?auto_807 ?auto_810 ) ) ( OBJ-AT ?auto_808 ?auto_807 ) ( not ( = ?auto_808 ?auto_809 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_809 ?auto_807 )
      ( DELIVER-2PKG-VERIFY ?auto_808 ?auto_809 ?auto_807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_814 - OBJ
      ?auto_815 - OBJ
      ?auto_813 - LOCATION
    )
    :vars
    (
      ?auto_818 - TRUCK
      ?auto_816 - LOCATION
      ?auto_817 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_814 ?auto_818 ) ( TRUCK-AT ?auto_818 ?auto_816 ) ( IN-CITY ?auto_816 ?auto_817 ) ( IN-CITY ?auto_813 ?auto_817 ) ( not ( = ?auto_813 ?auto_816 ) ) ( OBJ-AT ?auto_815 ?auto_813 ) ( not ( = ?auto_815 ?auto_814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_815 ?auto_814 ?auto_813 )
      ( DELIVER-2PKG-VERIFY ?auto_814 ?auto_815 ?auto_813 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_827 - OBJ
      ?auto_826 - LOCATION
    )
    :vars
    (
      ?auto_831 - TRUCK
      ?auto_828 - LOCATION
      ?auto_830 - CITY
      ?auto_829 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_831 ?auto_828 ) ( IN-CITY ?auto_828 ?auto_830 ) ( IN-CITY ?auto_826 ?auto_830 ) ( not ( = ?auto_826 ?auto_828 ) ) ( OBJ-AT ?auto_829 ?auto_826 ) ( not ( = ?auto_829 ?auto_827 ) ) ( OBJ-AT ?auto_827 ?auto_828 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_827 ?auto_831 ?auto_828 )
      ( DELIVER-2PKG ?auto_829 ?auto_827 ?auto_826 )
      ( DELIVER-1PKG-VERIFY ?auto_827 ?auto_826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_833 - OBJ
      ?auto_834 - OBJ
      ?auto_832 - LOCATION
    )
    :vars
    (
      ?auto_835 - TRUCK
      ?auto_836 - LOCATION
      ?auto_837 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_835 ?auto_836 ) ( IN-CITY ?auto_836 ?auto_837 ) ( IN-CITY ?auto_832 ?auto_837 ) ( not ( = ?auto_832 ?auto_836 ) ) ( OBJ-AT ?auto_833 ?auto_832 ) ( not ( = ?auto_833 ?auto_834 ) ) ( OBJ-AT ?auto_834 ?auto_836 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_834 ?auto_832 )
      ( DELIVER-2PKG-VERIFY ?auto_833 ?auto_834 ?auto_832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_839 - OBJ
      ?auto_840 - OBJ
      ?auto_838 - LOCATION
    )
    :vars
    (
      ?auto_843 - TRUCK
      ?auto_841 - LOCATION
      ?auto_842 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_843 ?auto_841 ) ( IN-CITY ?auto_841 ?auto_842 ) ( IN-CITY ?auto_838 ?auto_842 ) ( not ( = ?auto_838 ?auto_841 ) ) ( OBJ-AT ?auto_840 ?auto_838 ) ( not ( = ?auto_840 ?auto_839 ) ) ( OBJ-AT ?auto_839 ?auto_841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_840 ?auto_839 ?auto_838 )
      ( DELIVER-2PKG-VERIFY ?auto_839 ?auto_840 ?auto_838 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_852 - OBJ
      ?auto_851 - LOCATION
    )
    :vars
    (
      ?auto_853 - LOCATION
      ?auto_854 - CITY
      ?auto_856 - OBJ
      ?auto_855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_853 ?auto_854 ) ( IN-CITY ?auto_851 ?auto_854 ) ( not ( = ?auto_851 ?auto_853 ) ) ( OBJ-AT ?auto_856 ?auto_851 ) ( not ( = ?auto_856 ?auto_852 ) ) ( OBJ-AT ?auto_852 ?auto_853 ) ( TRUCK-AT ?auto_855 ?auto_851 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_855 ?auto_851 ?auto_853 ?auto_854 )
      ( DELIVER-2PKG ?auto_856 ?auto_852 ?auto_851 )
      ( DELIVER-1PKG-VERIFY ?auto_852 ?auto_851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_858 - OBJ
      ?auto_859 - OBJ
      ?auto_857 - LOCATION
    )
    :vars
    (
      ?auto_861 - LOCATION
      ?auto_860 - CITY
      ?auto_862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_861 ?auto_860 ) ( IN-CITY ?auto_857 ?auto_860 ) ( not ( = ?auto_857 ?auto_861 ) ) ( OBJ-AT ?auto_858 ?auto_857 ) ( not ( = ?auto_858 ?auto_859 ) ) ( OBJ-AT ?auto_859 ?auto_861 ) ( TRUCK-AT ?auto_862 ?auto_857 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_859 ?auto_857 )
      ( DELIVER-2PKG-VERIFY ?auto_858 ?auto_859 ?auto_857 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_864 - OBJ
      ?auto_865 - OBJ
      ?auto_863 - LOCATION
    )
    :vars
    (
      ?auto_868 - LOCATION
      ?auto_866 - CITY
      ?auto_867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_868 ?auto_866 ) ( IN-CITY ?auto_863 ?auto_866 ) ( not ( = ?auto_863 ?auto_868 ) ) ( OBJ-AT ?auto_865 ?auto_863 ) ( not ( = ?auto_865 ?auto_864 ) ) ( OBJ-AT ?auto_864 ?auto_868 ) ( TRUCK-AT ?auto_867 ?auto_863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_865 ?auto_864 ?auto_863 )
      ( DELIVER-2PKG-VERIFY ?auto_864 ?auto_865 ?auto_863 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_877 - OBJ
      ?auto_876 - LOCATION
    )
    :vars
    (
      ?auto_881 - LOCATION
      ?auto_878 - CITY
      ?auto_879 - OBJ
      ?auto_880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_881 ?auto_878 ) ( IN-CITY ?auto_876 ?auto_878 ) ( not ( = ?auto_876 ?auto_881 ) ) ( not ( = ?auto_879 ?auto_877 ) ) ( OBJ-AT ?auto_877 ?auto_881 ) ( TRUCK-AT ?auto_880 ?auto_876 ) ( IN-TRUCK ?auto_879 ?auto_880 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_879 ?auto_876 )
      ( DELIVER-2PKG ?auto_879 ?auto_877 ?auto_876 )
      ( DELIVER-1PKG-VERIFY ?auto_877 ?auto_876 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_883 - OBJ
      ?auto_884 - OBJ
      ?auto_882 - LOCATION
    )
    :vars
    (
      ?auto_887 - LOCATION
      ?auto_886 - CITY
      ?auto_885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_887 ?auto_886 ) ( IN-CITY ?auto_882 ?auto_886 ) ( not ( = ?auto_882 ?auto_887 ) ) ( not ( = ?auto_883 ?auto_884 ) ) ( OBJ-AT ?auto_884 ?auto_887 ) ( TRUCK-AT ?auto_885 ?auto_882 ) ( IN-TRUCK ?auto_883 ?auto_885 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_884 ?auto_882 )
      ( DELIVER-2PKG-VERIFY ?auto_883 ?auto_884 ?auto_882 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_889 - OBJ
      ?auto_890 - OBJ
      ?auto_888 - LOCATION
    )
    :vars
    (
      ?auto_892 - LOCATION
      ?auto_893 - CITY
      ?auto_891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_892 ?auto_893 ) ( IN-CITY ?auto_888 ?auto_893 ) ( not ( = ?auto_888 ?auto_892 ) ) ( not ( = ?auto_890 ?auto_889 ) ) ( OBJ-AT ?auto_889 ?auto_892 ) ( TRUCK-AT ?auto_891 ?auto_888 ) ( IN-TRUCK ?auto_890 ?auto_891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_890 ?auto_889 ?auto_888 )
      ( DELIVER-2PKG-VERIFY ?auto_889 ?auto_890 ?auto_888 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_902 - OBJ
      ?auto_901 - LOCATION
    )
    :vars
    (
      ?auto_904 - LOCATION
      ?auto_905 - CITY
      ?auto_906 - OBJ
      ?auto_903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_904 ?auto_905 ) ( IN-CITY ?auto_901 ?auto_905 ) ( not ( = ?auto_901 ?auto_904 ) ) ( not ( = ?auto_906 ?auto_902 ) ) ( OBJ-AT ?auto_902 ?auto_904 ) ( IN-TRUCK ?auto_906 ?auto_903 ) ( TRUCK-AT ?auto_903 ?auto_904 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_903 ?auto_904 ?auto_901 ?auto_905 )
      ( DELIVER-2PKG ?auto_906 ?auto_902 ?auto_901 )
      ( DELIVER-1PKG-VERIFY ?auto_902 ?auto_901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_908 - OBJ
      ?auto_909 - OBJ
      ?auto_907 - LOCATION
    )
    :vars
    (
      ?auto_910 - LOCATION
      ?auto_911 - CITY
      ?auto_912 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_910 ?auto_911 ) ( IN-CITY ?auto_907 ?auto_911 ) ( not ( = ?auto_907 ?auto_910 ) ) ( not ( = ?auto_908 ?auto_909 ) ) ( OBJ-AT ?auto_909 ?auto_910 ) ( IN-TRUCK ?auto_908 ?auto_912 ) ( TRUCK-AT ?auto_912 ?auto_910 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_909 ?auto_907 )
      ( DELIVER-2PKG-VERIFY ?auto_908 ?auto_909 ?auto_907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_914 - OBJ
      ?auto_915 - OBJ
      ?auto_913 - LOCATION
    )
    :vars
    (
      ?auto_917 - LOCATION
      ?auto_916 - CITY
      ?auto_918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_917 ?auto_916 ) ( IN-CITY ?auto_913 ?auto_916 ) ( not ( = ?auto_913 ?auto_917 ) ) ( not ( = ?auto_915 ?auto_914 ) ) ( OBJ-AT ?auto_914 ?auto_917 ) ( IN-TRUCK ?auto_915 ?auto_918 ) ( TRUCK-AT ?auto_918 ?auto_917 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_915 ?auto_914 ?auto_913 )
      ( DELIVER-2PKG-VERIFY ?auto_914 ?auto_915 ?auto_913 ) )
  )

)

