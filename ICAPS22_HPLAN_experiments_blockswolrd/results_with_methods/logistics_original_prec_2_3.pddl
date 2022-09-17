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
      ?auto_785 - TRUCK
      ?auto_786 - LOCATION
      ?auto_784 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_785 ?auto_786 ) ( IN-CITY ?auto_786 ?auto_784 ) ( IN-CITY ?auto_782 ?auto_784 ) ( not ( = ?auto_782 ?auto_786 ) ) ( OBJ-AT ?auto_783 ?auto_786 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_783 ?auto_785 ?auto_786 )
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
    ( and ( not ( = ?auto_820 ?auto_819 ) ) ( TRUCK-AT ?auto_821 ?auto_818 ) ( IN-TRUCK ?auto_820 ?auto_821 ) ( OBJ-AT ?auto_819 ?auto_818 ) )
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
    ( and ( not ( = ?auto_824 ?auto_823 ) ) ( TRUCK-AT ?auto_825 ?auto_822 ) ( IN-TRUCK ?auto_823 ?auto_825 ) ( OBJ-AT ?auto_824 ?auto_822 ) )
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
      ?auto_840 - LOCATION
      ?auto_838 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_837 ?auto_836 ) ) ( IN-TRUCK ?auto_837 ?auto_839 ) ( TRUCK-AT ?auto_839 ?auto_840 ) ( IN-CITY ?auto_840 ?auto_838 ) ( IN-CITY ?auto_835 ?auto_838 ) ( not ( = ?auto_835 ?auto_840 ) ) ( OBJ-AT ?auto_836 ?auto_835 ) )
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
      ?auto_846 - TRUCK
      ?auto_845 - LOCATION
      ?auto_844 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_843 ?auto_842 ) ) ( IN-TRUCK ?auto_842 ?auto_846 ) ( TRUCK-AT ?auto_846 ?auto_845 ) ( IN-CITY ?auto_845 ?auto_844 ) ( IN-CITY ?auto_841 ?auto_844 ) ( not ( = ?auto_841 ?auto_845 ) ) ( OBJ-AT ?auto_843 ?auto_841 ) )
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
      ?auto_858 - OBJ
      ?auto_859 - TRUCK
      ?auto_857 - LOCATION
      ?auto_856 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_855 ?auto_858 ) ) ( TRUCK-AT ?auto_859 ?auto_857 ) ( IN-CITY ?auto_857 ?auto_856 ) ( IN-CITY ?auto_854 ?auto_856 ) ( not ( = ?auto_854 ?auto_857 ) ) ( OBJ-AT ?auto_858 ?auto_854 ) ( OBJ-AT ?auto_855 ?auto_857 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_855 ?auto_859 ?auto_857 )
      ( DELIVER-2PKG ?auto_858 ?auto_855 ?auto_854 )
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
      ?auto_864 - LOCATION
      ?auto_865 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_862 ?auto_861 ) ) ( TRUCK-AT ?auto_863 ?auto_864 ) ( IN-CITY ?auto_864 ?auto_865 ) ( IN-CITY ?auto_860 ?auto_865 ) ( not ( = ?auto_860 ?auto_864 ) ) ( OBJ-AT ?auto_861 ?auto_860 ) ( OBJ-AT ?auto_862 ?auto_864 ) )
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
      ?auto_870 - TRUCK
      ?auto_869 - LOCATION
      ?auto_871 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_868 ?auto_867 ) ) ( TRUCK-AT ?auto_870 ?auto_869 ) ( IN-CITY ?auto_869 ?auto_871 ) ( IN-CITY ?auto_866 ?auto_871 ) ( not ( = ?auto_866 ?auto_869 ) ) ( OBJ-AT ?auto_868 ?auto_866 ) ( OBJ-AT ?auto_867 ?auto_869 ) )
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
      ?auto_882 - OBJ
      ?auto_881 - LOCATION
      ?auto_884 - CITY
      ?auto_883 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_880 ?auto_882 ) ) ( IN-CITY ?auto_881 ?auto_884 ) ( IN-CITY ?auto_879 ?auto_884 ) ( not ( = ?auto_879 ?auto_881 ) ) ( OBJ-AT ?auto_882 ?auto_879 ) ( OBJ-AT ?auto_880 ?auto_881 ) ( TRUCK-AT ?auto_883 ?auto_879 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_883 ?auto_879 ?auto_881 ?auto_884 )
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
      ?auto_889 - LOCATION
      ?auto_890 - CITY
      ?auto_888 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_887 ?auto_886 ) ) ( IN-CITY ?auto_889 ?auto_890 ) ( IN-CITY ?auto_885 ?auto_890 ) ( not ( = ?auto_885 ?auto_889 ) ) ( OBJ-AT ?auto_886 ?auto_885 ) ( OBJ-AT ?auto_887 ?auto_889 ) ( TRUCK-AT ?auto_888 ?auto_885 ) )
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
    ( and ( not ( = ?auto_893 ?auto_892 ) ) ( IN-CITY ?auto_894 ?auto_896 ) ( IN-CITY ?auto_891 ?auto_896 ) ( not ( = ?auto_891 ?auto_894 ) ) ( OBJ-AT ?auto_893 ?auto_891 ) ( OBJ-AT ?auto_892 ?auto_894 ) ( TRUCK-AT ?auto_895 ?auto_891 ) )
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
      ?auto_908 - OBJ
      ?auto_906 - LOCATION
      ?auto_909 - CITY
      ?auto_907 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_905 ?auto_908 ) ) ( IN-CITY ?auto_906 ?auto_909 ) ( IN-CITY ?auto_904 ?auto_909 ) ( not ( = ?auto_904 ?auto_906 ) ) ( OBJ-AT ?auto_905 ?auto_906 ) ( TRUCK-AT ?auto_907 ?auto_904 ) ( IN-TRUCK ?auto_908 ?auto_907 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_908 ?auto_904 )
      ( DELIVER-2PKG ?auto_908 ?auto_905 ?auto_904 )
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
      ?auto_915 - LOCATION
      ?auto_914 - CITY
      ?auto_913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_912 ?auto_911 ) ) ( IN-CITY ?auto_915 ?auto_914 ) ( IN-CITY ?auto_910 ?auto_914 ) ( not ( = ?auto_910 ?auto_915 ) ) ( OBJ-AT ?auto_912 ?auto_915 ) ( TRUCK-AT ?auto_913 ?auto_910 ) ( IN-TRUCK ?auto_911 ?auto_913 ) )
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
      ?auto_921 - LOCATION
      ?auto_920 - CITY
      ?auto_919 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_918 ?auto_917 ) ) ( IN-CITY ?auto_921 ?auto_920 ) ( IN-CITY ?auto_916 ?auto_920 ) ( not ( = ?auto_916 ?auto_921 ) ) ( OBJ-AT ?auto_917 ?auto_921 ) ( TRUCK-AT ?auto_919 ?auto_916 ) ( IN-TRUCK ?auto_918 ?auto_919 ) )
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
      ?auto_933 - OBJ
      ?auto_934 - LOCATION
      ?auto_932 - CITY
      ?auto_931 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_930 ?auto_933 ) ) ( IN-CITY ?auto_934 ?auto_932 ) ( IN-CITY ?auto_929 ?auto_932 ) ( not ( = ?auto_929 ?auto_934 ) ) ( OBJ-AT ?auto_930 ?auto_934 ) ( IN-TRUCK ?auto_933 ?auto_931 ) ( TRUCK-AT ?auto_931 ?auto_934 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_931 ?auto_934 ?auto_929 ?auto_932 )
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
    ( and ( not ( = ?auto_937 ?auto_936 ) ) ( IN-CITY ?auto_940 ?auto_939 ) ( IN-CITY ?auto_935 ?auto_939 ) ( not ( = ?auto_935 ?auto_940 ) ) ( OBJ-AT ?auto_937 ?auto_940 ) ( IN-TRUCK ?auto_936 ?auto_938 ) ( TRUCK-AT ?auto_938 ?auto_940 ) )
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
      ?auto_945 - CITY
      ?auto_946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_943 ?auto_942 ) ) ( IN-CITY ?auto_944 ?auto_945 ) ( IN-CITY ?auto_941 ?auto_945 ) ( not ( = ?auto_941 ?auto_944 ) ) ( OBJ-AT ?auto_942 ?auto_944 ) ( IN-TRUCK ?auto_943 ?auto_946 ) ( TRUCK-AT ?auto_946 ?auto_944 ) )
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
      ?auto_958 - OBJ
      ?auto_956 - LOCATION
      ?auto_957 - CITY
      ?auto_959 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_955 ?auto_958 ) ) ( IN-CITY ?auto_956 ?auto_957 ) ( IN-CITY ?auto_954 ?auto_957 ) ( not ( = ?auto_954 ?auto_956 ) ) ( OBJ-AT ?auto_955 ?auto_956 ) ( TRUCK-AT ?auto_959 ?auto_956 ) ( OBJ-AT ?auto_958 ?auto_956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_958 ?auto_959 ?auto_956 )
      ( DELIVER-2PKG ?auto_958 ?auto_955 ?auto_954 )
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
      ?auto_964 - LOCATION
      ?auto_965 - CITY
      ?auto_963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_962 ?auto_961 ) ) ( IN-CITY ?auto_964 ?auto_965 ) ( IN-CITY ?auto_960 ?auto_965 ) ( not ( = ?auto_960 ?auto_964 ) ) ( OBJ-AT ?auto_962 ?auto_964 ) ( TRUCK-AT ?auto_963 ?auto_964 ) ( OBJ-AT ?auto_961 ?auto_964 ) )
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
      ?auto_971 - LOCATION
      ?auto_970 - CITY
      ?auto_969 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_968 ?auto_967 ) ) ( IN-CITY ?auto_971 ?auto_970 ) ( IN-CITY ?auto_966 ?auto_970 ) ( not ( = ?auto_966 ?auto_971 ) ) ( OBJ-AT ?auto_967 ?auto_971 ) ( TRUCK-AT ?auto_969 ?auto_971 ) ( OBJ-AT ?auto_968 ?auto_971 ) )
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
      ?auto_984 - OBJ
      ?auto_983 - LOCATION
      ?auto_982 - CITY
      ?auto_981 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_980 ?auto_984 ) ) ( IN-CITY ?auto_983 ?auto_982 ) ( IN-CITY ?auto_979 ?auto_982 ) ( not ( = ?auto_979 ?auto_983 ) ) ( OBJ-AT ?auto_980 ?auto_983 ) ( OBJ-AT ?auto_984 ?auto_983 ) ( TRUCK-AT ?auto_981 ?auto_979 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_981 ?auto_979 ?auto_983 ?auto_982 )
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
    ( and ( not ( = ?auto_987 ?auto_986 ) ) ( IN-CITY ?auto_989 ?auto_988 ) ( IN-CITY ?auto_985 ?auto_988 ) ( not ( = ?auto_985 ?auto_989 ) ) ( OBJ-AT ?auto_987 ?auto_989 ) ( OBJ-AT ?auto_986 ?auto_989 ) ( TRUCK-AT ?auto_990 ?auto_985 ) )
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
      ?auto_994 - LOCATION
      ?auto_995 - CITY
      ?auto_996 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_993 ?auto_992 ) ) ( IN-CITY ?auto_994 ?auto_995 ) ( IN-CITY ?auto_991 ?auto_995 ) ( not ( = ?auto_991 ?auto_994 ) ) ( OBJ-AT ?auto_992 ?auto_994 ) ( OBJ-AT ?auto_993 ?auto_994 ) ( TRUCK-AT ?auto_996 ?auto_991 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_993 ?auto_992 ?auto_991 )
      ( DELIVER-2PKG-VERIFY ?auto_992 ?auto_993 ?auto_991 ) )
  )

)

