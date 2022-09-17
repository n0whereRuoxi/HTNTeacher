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
      ?auto_765 - OBJ
      ?auto_764 - LOCATION
    )
    :vars
    (
      ?auto_766 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_766 ?auto_764 ) ( IN-TRUCK ?auto_765 ?auto_766 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_765 ?auto_766 ?auto_764 )
      ( DELIVER-1PKG-VERIFY ?auto_765 ?auto_764 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_772 - OBJ
      ?auto_771 - LOCATION
    )
    :vars
    (
      ?auto_773 - TRUCK
      ?auto_774 - LOCATION
      ?auto_775 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_772 ?auto_773 ) ( TRUCK-AT ?auto_773 ?auto_774 ) ( IN-CITY ?auto_774 ?auto_775 ) ( IN-CITY ?auto_771 ?auto_775 ) ( not ( = ?auto_771 ?auto_774 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_773 ?auto_774 ?auto_771 ?auto_775 )
      ( DELIVER-1PKG ?auto_772 ?auto_771 )
      ( DELIVER-1PKG-VERIFY ?auto_772 ?auto_771 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_783 - OBJ
      ?auto_782 - LOCATION
    )
    :vars
    (
      ?auto_784 - TRUCK
      ?auto_785 - LOCATION
      ?auto_786 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_784 ?auto_785 ) ( IN-CITY ?auto_785 ?auto_786 ) ( IN-CITY ?auto_782 ?auto_786 ) ( not ( = ?auto_782 ?auto_785 ) ) ( OBJ-AT ?auto_783 ?auto_785 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_783 ?auto_784 ?auto_785 )
      ( DELIVER-1PKG ?auto_783 ?auto_782 )
      ( DELIVER-1PKG-VERIFY ?auto_783 ?auto_782 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_794 - OBJ
      ?auto_793 - LOCATION
    )
    :vars
    (
      ?auto_795 - LOCATION
      ?auto_797 - CITY
      ?auto_796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_795 ?auto_797 ) ( IN-CITY ?auto_793 ?auto_797 ) ( not ( = ?auto_793 ?auto_795 ) ) ( OBJ-AT ?auto_794 ?auto_795 ) ( TRUCK-AT ?auto_796 ?auto_793 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_796 ?auto_793 ?auto_795 ?auto_797 )
      ( DELIVER-1PKG ?auto_794 ?auto_793 )
      ( DELIVER-1PKG-VERIFY ?auto_794 ?auto_793 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_816 - OBJ
      ?auto_815 - LOCATION
    )
    :vars
    (
      ?auto_817 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_817 ?auto_815 ) ( IN-TRUCK ?auto_816 ?auto_817 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_816 ?auto_817 ?auto_815 )
      ( DELIVER-1PKG-VERIFY ?auto_816 ?auto_815 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_819 - OBJ
      ?auto_820 - OBJ
      ?auto_818 - LOCATION
    )
    :vars
    (
      ?auto_821 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_821 ?auto_818 ) ( IN-TRUCK ?auto_820 ?auto_821 ) ( OBJ-AT ?auto_819 ?auto_818 ) ( not ( = ?auto_819 ?auto_820 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_820 ?auto_818 )
      ( DELIVER-2PKG-VERIFY ?auto_819 ?auto_820 ?auto_818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_823 - OBJ
      ?auto_824 - OBJ
      ?auto_822 - LOCATION
    )
    :vars
    (
      ?auto_825 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_825 ?auto_822 ) ( IN-TRUCK ?auto_823 ?auto_825 ) ( OBJ-AT ?auto_824 ?auto_822 ) ( not ( = ?auto_823 ?auto_824 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_823 ?auto_822 )
      ( DELIVER-2PKG-VERIFY ?auto_823 ?auto_824 ?auto_822 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_831 - OBJ
      ?auto_830 - LOCATION
    )
    :vars
    (
      ?auto_832 - TRUCK
      ?auto_833 - LOCATION
      ?auto_834 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_831 ?auto_832 ) ( TRUCK-AT ?auto_832 ?auto_833 ) ( IN-CITY ?auto_833 ?auto_834 ) ( IN-CITY ?auto_830 ?auto_834 ) ( not ( = ?auto_830 ?auto_833 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_832 ?auto_833 ?auto_830 ?auto_834 )
      ( DELIVER-1PKG ?auto_831 ?auto_830 )
      ( DELIVER-1PKG-VERIFY ?auto_831 ?auto_830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_836 - OBJ
      ?auto_837 - OBJ
      ?auto_835 - LOCATION
    )
    :vars
    (
      ?auto_839 - TRUCK
      ?auto_838 - LOCATION
      ?auto_840 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_837 ?auto_839 ) ( TRUCK-AT ?auto_839 ?auto_838 ) ( IN-CITY ?auto_838 ?auto_840 ) ( IN-CITY ?auto_835 ?auto_840 ) ( not ( = ?auto_835 ?auto_838 ) ) ( OBJ-AT ?auto_836 ?auto_835 ) ( not ( = ?auto_836 ?auto_837 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_837 ?auto_835 )
      ( DELIVER-2PKG-VERIFY ?auto_836 ?auto_837 ?auto_835 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_842 - OBJ
      ?auto_843 - OBJ
      ?auto_841 - LOCATION
    )
    :vars
    (
      ?auto_844 - TRUCK
      ?auto_845 - LOCATION
      ?auto_846 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_842 ?auto_844 ) ( TRUCK-AT ?auto_844 ?auto_845 ) ( IN-CITY ?auto_845 ?auto_846 ) ( IN-CITY ?auto_841 ?auto_846 ) ( not ( = ?auto_841 ?auto_845 ) ) ( OBJ-AT ?auto_843 ?auto_841 ) ( not ( = ?auto_843 ?auto_842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_843 ?auto_842 ?auto_841 )
      ( DELIVER-2PKG-VERIFY ?auto_842 ?auto_843 ?auto_841 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_855 - OBJ
      ?auto_854 - LOCATION
    )
    :vars
    (
      ?auto_857 - TRUCK
      ?auto_858 - LOCATION
      ?auto_859 - CITY
      ?auto_856 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_857 ?auto_858 ) ( IN-CITY ?auto_858 ?auto_859 ) ( IN-CITY ?auto_854 ?auto_859 ) ( not ( = ?auto_854 ?auto_858 ) ) ( OBJ-AT ?auto_856 ?auto_854 ) ( not ( = ?auto_856 ?auto_855 ) ) ( OBJ-AT ?auto_855 ?auto_858 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_855 ?auto_857 ?auto_858 )
      ( DELIVER-2PKG ?auto_856 ?auto_855 ?auto_854 )
      ( DELIVER-1PKG-VERIFY ?auto_855 ?auto_854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_861 - OBJ
      ?auto_862 - OBJ
      ?auto_860 - LOCATION
    )
    :vars
    (
      ?auto_863 - TRUCK
      ?auto_865 - LOCATION
      ?auto_864 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_863 ?auto_865 ) ( IN-CITY ?auto_865 ?auto_864 ) ( IN-CITY ?auto_860 ?auto_864 ) ( not ( = ?auto_860 ?auto_865 ) ) ( OBJ-AT ?auto_861 ?auto_860 ) ( not ( = ?auto_861 ?auto_862 ) ) ( OBJ-AT ?auto_862 ?auto_865 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_862 ?auto_860 )
      ( DELIVER-2PKG-VERIFY ?auto_861 ?auto_862 ?auto_860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_867 - OBJ
      ?auto_868 - OBJ
      ?auto_866 - LOCATION
    )
    :vars
    (
      ?auto_871 - TRUCK
      ?auto_870 - LOCATION
      ?auto_869 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_871 ?auto_870 ) ( IN-CITY ?auto_870 ?auto_869 ) ( IN-CITY ?auto_866 ?auto_869 ) ( not ( = ?auto_866 ?auto_870 ) ) ( OBJ-AT ?auto_868 ?auto_866 ) ( not ( = ?auto_868 ?auto_867 ) ) ( OBJ-AT ?auto_867 ?auto_870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_868 ?auto_867 ?auto_866 )
      ( DELIVER-2PKG-VERIFY ?auto_867 ?auto_868 ?auto_866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_880 - OBJ
      ?auto_879 - LOCATION
    )
    :vars
    (
      ?auto_883 - LOCATION
      ?auto_881 - CITY
      ?auto_882 - OBJ
      ?auto_884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_883 ?auto_881 ) ( IN-CITY ?auto_879 ?auto_881 ) ( not ( = ?auto_879 ?auto_883 ) ) ( OBJ-AT ?auto_882 ?auto_879 ) ( not ( = ?auto_882 ?auto_880 ) ) ( OBJ-AT ?auto_880 ?auto_883 ) ( TRUCK-AT ?auto_884 ?auto_879 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_884 ?auto_879 ?auto_883 ?auto_881 )
      ( DELIVER-2PKG ?auto_882 ?auto_880 ?auto_879 )
      ( DELIVER-1PKG-VERIFY ?auto_880 ?auto_879 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_886 - OBJ
      ?auto_887 - OBJ
      ?auto_885 - LOCATION
    )
    :vars
    (
      ?auto_890 - LOCATION
      ?auto_889 - CITY
      ?auto_888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_890 ?auto_889 ) ( IN-CITY ?auto_885 ?auto_889 ) ( not ( = ?auto_885 ?auto_890 ) ) ( OBJ-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_886 ?auto_887 ) ) ( OBJ-AT ?auto_887 ?auto_890 ) ( TRUCK-AT ?auto_888 ?auto_885 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_887 ?auto_885 )
      ( DELIVER-2PKG-VERIFY ?auto_886 ?auto_887 ?auto_885 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_892 - OBJ
      ?auto_893 - OBJ
      ?auto_891 - LOCATION
    )
    :vars
    (
      ?auto_894 - LOCATION
      ?auto_896 - CITY
      ?auto_895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894 ?auto_896 ) ( IN-CITY ?auto_891 ?auto_896 ) ( not ( = ?auto_891 ?auto_894 ) ) ( OBJ-AT ?auto_893 ?auto_891 ) ( not ( = ?auto_893 ?auto_892 ) ) ( OBJ-AT ?auto_892 ?auto_894 ) ( TRUCK-AT ?auto_895 ?auto_891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893 ?auto_892 ?auto_891 )
      ( DELIVER-2PKG-VERIFY ?auto_892 ?auto_893 ?auto_891 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_905 - OBJ
      ?auto_904 - LOCATION
    )
    :vars
    (
      ?auto_907 - LOCATION
      ?auto_909 - CITY
      ?auto_906 - OBJ
      ?auto_908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907 ?auto_909 ) ( IN-CITY ?auto_904 ?auto_909 ) ( not ( = ?auto_904 ?auto_907 ) ) ( not ( = ?auto_906 ?auto_905 ) ) ( OBJ-AT ?auto_905 ?auto_907 ) ( TRUCK-AT ?auto_908 ?auto_904 ) ( IN-TRUCK ?auto_906 ?auto_908 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_906 ?auto_904 )
      ( DELIVER-2PKG ?auto_906 ?auto_905 ?auto_904 )
      ( DELIVER-1PKG-VERIFY ?auto_905 ?auto_904 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_911 - OBJ
      ?auto_912 - OBJ
      ?auto_910 - LOCATION
    )
    :vars
    (
      ?auto_913 - LOCATION
      ?auto_915 - CITY
      ?auto_914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_913 ?auto_915 ) ( IN-CITY ?auto_910 ?auto_915 ) ( not ( = ?auto_910 ?auto_913 ) ) ( not ( = ?auto_911 ?auto_912 ) ) ( OBJ-AT ?auto_912 ?auto_913 ) ( TRUCK-AT ?auto_914 ?auto_910 ) ( IN-TRUCK ?auto_911 ?auto_914 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_912 ?auto_910 )
      ( DELIVER-2PKG-VERIFY ?auto_911 ?auto_912 ?auto_910 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_917 - OBJ
      ?auto_918 - OBJ
      ?auto_916 - LOCATION
    )
    :vars
    (
      ?auto_920 - LOCATION
      ?auto_919 - CITY
      ?auto_921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_920 ?auto_919 ) ( IN-CITY ?auto_916 ?auto_919 ) ( not ( = ?auto_916 ?auto_920 ) ) ( not ( = ?auto_918 ?auto_917 ) ) ( OBJ-AT ?auto_917 ?auto_920 ) ( TRUCK-AT ?auto_921 ?auto_916 ) ( IN-TRUCK ?auto_918 ?auto_921 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_918 ?auto_917 ?auto_916 )
      ( DELIVER-2PKG-VERIFY ?auto_917 ?auto_918 ?auto_916 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_930 - OBJ
      ?auto_929 - LOCATION
    )
    :vars
    (
      ?auto_932 - LOCATION
      ?auto_931 - CITY
      ?auto_933 - OBJ
      ?auto_934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_932 ?auto_931 ) ( IN-CITY ?auto_929 ?auto_931 ) ( not ( = ?auto_929 ?auto_932 ) ) ( not ( = ?auto_933 ?auto_930 ) ) ( OBJ-AT ?auto_930 ?auto_932 ) ( IN-TRUCK ?auto_933 ?auto_934 ) ( TRUCK-AT ?auto_934 ?auto_932 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_934 ?auto_932 ?auto_929 ?auto_931 )
      ( DELIVER-2PKG ?auto_933 ?auto_930 ?auto_929 )
      ( DELIVER-1PKG-VERIFY ?auto_930 ?auto_929 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_936 - OBJ
      ?auto_937 - OBJ
      ?auto_935 - LOCATION
    )
    :vars
    (
      ?auto_940 - LOCATION
      ?auto_939 - CITY
      ?auto_938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_940 ?auto_939 ) ( IN-CITY ?auto_935 ?auto_939 ) ( not ( = ?auto_935 ?auto_940 ) ) ( not ( = ?auto_936 ?auto_937 ) ) ( OBJ-AT ?auto_937 ?auto_940 ) ( IN-TRUCK ?auto_936 ?auto_938 ) ( TRUCK-AT ?auto_938 ?auto_940 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_937 ?auto_935 )
      ( DELIVER-2PKG-VERIFY ?auto_936 ?auto_937 ?auto_935 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_942 - OBJ
      ?auto_943 - OBJ
      ?auto_941 - LOCATION
    )
    :vars
    (
      ?auto_944 - LOCATION
      ?auto_946 - CITY
      ?auto_945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_944 ?auto_946 ) ( IN-CITY ?auto_941 ?auto_946 ) ( not ( = ?auto_941 ?auto_944 ) ) ( not ( = ?auto_943 ?auto_942 ) ) ( OBJ-AT ?auto_942 ?auto_944 ) ( IN-TRUCK ?auto_943 ?auto_945 ) ( TRUCK-AT ?auto_945 ?auto_944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_943 ?auto_942 ?auto_941 )
      ( DELIVER-2PKG-VERIFY ?auto_942 ?auto_943 ?auto_941 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_955 - OBJ
      ?auto_954 - LOCATION
    )
    :vars
    (
      ?auto_956 - LOCATION
      ?auto_958 - CITY
      ?auto_959 - OBJ
      ?auto_957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_956 ?auto_958 ) ( IN-CITY ?auto_954 ?auto_958 ) ( not ( = ?auto_954 ?auto_956 ) ) ( not ( = ?auto_959 ?auto_955 ) ) ( OBJ-AT ?auto_955 ?auto_956 ) ( TRUCK-AT ?auto_957 ?auto_956 ) ( OBJ-AT ?auto_959 ?auto_956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_959 ?auto_957 ?auto_956 )
      ( DELIVER-2PKG ?auto_959 ?auto_955 ?auto_954 )
      ( DELIVER-1PKG-VERIFY ?auto_955 ?auto_954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_961 - OBJ
      ?auto_962 - OBJ
      ?auto_960 - LOCATION
    )
    :vars
    (
      ?auto_963 - LOCATION
      ?auto_965 - CITY
      ?auto_964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_963 ?auto_965 ) ( IN-CITY ?auto_960 ?auto_965 ) ( not ( = ?auto_960 ?auto_963 ) ) ( not ( = ?auto_961 ?auto_962 ) ) ( OBJ-AT ?auto_962 ?auto_963 ) ( TRUCK-AT ?auto_964 ?auto_963 ) ( OBJ-AT ?auto_961 ?auto_963 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_962 ?auto_960 )
      ( DELIVER-2PKG-VERIFY ?auto_961 ?auto_962 ?auto_960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_967 - OBJ
      ?auto_968 - OBJ
      ?auto_966 - LOCATION
    )
    :vars
    (
      ?auto_969 - LOCATION
      ?auto_970 - CITY
      ?auto_971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_969 ?auto_970 ) ( IN-CITY ?auto_966 ?auto_970 ) ( not ( = ?auto_966 ?auto_969 ) ) ( not ( = ?auto_968 ?auto_967 ) ) ( OBJ-AT ?auto_967 ?auto_969 ) ( TRUCK-AT ?auto_971 ?auto_969 ) ( OBJ-AT ?auto_968 ?auto_969 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_968 ?auto_967 ?auto_966 )
      ( DELIVER-2PKG-VERIFY ?auto_967 ?auto_968 ?auto_966 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_980 - OBJ
      ?auto_979 - LOCATION
    )
    :vars
    (
      ?auto_981 - LOCATION
      ?auto_982 - CITY
      ?auto_984 - OBJ
      ?auto_983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_981 ?auto_982 ) ( IN-CITY ?auto_979 ?auto_982 ) ( not ( = ?auto_979 ?auto_981 ) ) ( not ( = ?auto_984 ?auto_980 ) ) ( OBJ-AT ?auto_980 ?auto_981 ) ( OBJ-AT ?auto_984 ?auto_981 ) ( TRUCK-AT ?auto_983 ?auto_979 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_983 ?auto_979 ?auto_981 ?auto_982 )
      ( DELIVER-2PKG ?auto_984 ?auto_980 ?auto_979 )
      ( DELIVER-1PKG-VERIFY ?auto_980 ?auto_979 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_986 - OBJ
      ?auto_987 - OBJ
      ?auto_985 - LOCATION
    )
    :vars
    (
      ?auto_989 - LOCATION
      ?auto_988 - CITY
      ?auto_990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_989 ?auto_988 ) ( IN-CITY ?auto_985 ?auto_988 ) ( not ( = ?auto_985 ?auto_989 ) ) ( not ( = ?auto_986 ?auto_987 ) ) ( OBJ-AT ?auto_987 ?auto_989 ) ( OBJ-AT ?auto_986 ?auto_989 ) ( TRUCK-AT ?auto_990 ?auto_985 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_987 ?auto_985 )
      ( DELIVER-2PKG-VERIFY ?auto_986 ?auto_987 ?auto_985 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_992 - OBJ
      ?auto_993 - OBJ
      ?auto_991 - LOCATION
    )
    :vars
    (
      ?auto_995 - LOCATION
      ?auto_994 - CITY
      ?auto_996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_995 ?auto_994 ) ( IN-CITY ?auto_991 ?auto_994 ) ( not ( = ?auto_991 ?auto_995 ) ) ( not ( = ?auto_993 ?auto_992 ) ) ( OBJ-AT ?auto_992 ?auto_995 ) ( OBJ-AT ?auto_993 ?auto_995 ) ( TRUCK-AT ?auto_996 ?auto_991 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_993 ?auto_992 ?auto_991 )
      ( DELIVER-2PKG-VERIFY ?auto_992 ?auto_993 ?auto_991 ) )
  )

)

