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
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
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
      ?auto_711 - OBJ
      ?auto_710 - LOCATION
    )
    :vars
    (
      ?auto_712 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_712 ?auto_710 ) ( IN-TRUCK ?auto_711 ?auto_712 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_711 ?auto_712 ?auto_710 )
      ( DELIVER-1PKG-VERIFY ?auto_711 ?auto_710 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_718 - OBJ
      ?auto_717 - LOCATION
    )
    :vars
    (
      ?auto_719 - TRUCK
      ?auto_720 - LOCATION
      ?auto_721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_718 ?auto_719 ) ( TRUCK-AT ?auto_719 ?auto_720 ) ( IN-CITY ?auto_720 ?auto_721 ) ( IN-CITY ?auto_717 ?auto_721 ) ( not ( = ?auto_717 ?auto_720 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_719 ?auto_720 ?auto_717 ?auto_721 )
      ( DELIVER-1PKG ?auto_718 ?auto_717 )
      ( DELIVER-1PKG-VERIFY ?auto_718 ?auto_717 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_729 - OBJ
      ?auto_728 - LOCATION
    )
    :vars
    (
      ?auto_732 - TRUCK
      ?auto_730 - LOCATION
      ?auto_731 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_732 ?auto_730 ) ( IN-CITY ?auto_730 ?auto_731 ) ( IN-CITY ?auto_728 ?auto_731 ) ( not ( = ?auto_728 ?auto_730 ) ) ( OBJ-AT ?auto_729 ?auto_730 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_729 ?auto_732 ?auto_730 )
      ( DELIVER-1PKG ?auto_729 ?auto_728 )
      ( DELIVER-1PKG-VERIFY ?auto_729 ?auto_728 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_740 - OBJ
      ?auto_739 - LOCATION
    )
    :vars
    (
      ?auto_742 - LOCATION
      ?auto_743 - CITY
      ?auto_741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_742 ?auto_743 ) ( IN-CITY ?auto_739 ?auto_743 ) ( not ( = ?auto_739 ?auto_742 ) ) ( OBJ-AT ?auto_740 ?auto_742 ) ( TRUCK-AT ?auto_741 ?auto_739 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_741 ?auto_739 ?auto_742 ?auto_743 )
      ( DELIVER-1PKG ?auto_740 ?auto_739 )
      ( DELIVER-1PKG-VERIFY ?auto_740 ?auto_739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_765 - OBJ
      ?auto_766 - OBJ
      ?auto_764 - LOCATION
    )
    :vars
    (
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_767 ?auto_764 ) ( IN-TRUCK ?auto_766 ?auto_767 ) ( OBJ-AT ?auto_765 ?auto_764 ) ( not ( = ?auto_765 ?auto_766 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_766 ?auto_764 )
      ( DELIVER-2PKG-VERIFY ?auto_765 ?auto_766 ?auto_764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_769 - OBJ
      ?auto_770 - OBJ
      ?auto_768 - LOCATION
    )
    :vars
    (
      ?auto_771 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_771 ?auto_768 ) ( IN-TRUCK ?auto_769 ?auto_771 ) ( OBJ-AT ?auto_770 ?auto_768 ) ( not ( = ?auto_769 ?auto_770 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_769 ?auto_768 )
      ( DELIVER-2PKG-VERIFY ?auto_769 ?auto_770 ?auto_768 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_782 - OBJ
      ?auto_783 - OBJ
      ?auto_781 - LOCATION
    )
    :vars
    (
      ?auto_785 - TRUCK
      ?auto_784 - LOCATION
      ?auto_786 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_783 ?auto_785 ) ( TRUCK-AT ?auto_785 ?auto_784 ) ( IN-CITY ?auto_784 ?auto_786 ) ( IN-CITY ?auto_781 ?auto_786 ) ( not ( = ?auto_781 ?auto_784 ) ) ( OBJ-AT ?auto_782 ?auto_781 ) ( not ( = ?auto_782 ?auto_783 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_783 ?auto_781 )
      ( DELIVER-2PKG-VERIFY ?auto_782 ?auto_783 ?auto_781 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_788 - OBJ
      ?auto_789 - OBJ
      ?auto_787 - LOCATION
    )
    :vars
    (
      ?auto_790 - TRUCK
      ?auto_792 - LOCATION
      ?auto_791 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_788 ?auto_790 ) ( TRUCK-AT ?auto_790 ?auto_792 ) ( IN-CITY ?auto_792 ?auto_791 ) ( IN-CITY ?auto_787 ?auto_791 ) ( not ( = ?auto_787 ?auto_792 ) ) ( OBJ-AT ?auto_789 ?auto_787 ) ( not ( = ?auto_789 ?auto_788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_789 ?auto_788 ?auto_787 )
      ( DELIVER-2PKG-VERIFY ?auto_788 ?auto_789 ?auto_787 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_801 - OBJ
      ?auto_800 - LOCATION
    )
    :vars
    (
      ?auto_802 - TRUCK
      ?auto_805 - LOCATION
      ?auto_803 - CITY
      ?auto_804 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_802 ?auto_805 ) ( IN-CITY ?auto_805 ?auto_803 ) ( IN-CITY ?auto_800 ?auto_803 ) ( not ( = ?auto_800 ?auto_805 ) ) ( OBJ-AT ?auto_804 ?auto_800 ) ( not ( = ?auto_804 ?auto_801 ) ) ( OBJ-AT ?auto_801 ?auto_805 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_801 ?auto_802 ?auto_805 )
      ( DELIVER-2PKG ?auto_804 ?auto_801 ?auto_800 )
      ( DELIVER-1PKG-VERIFY ?auto_801 ?auto_800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_807 - OBJ
      ?auto_808 - OBJ
      ?auto_806 - LOCATION
    )
    :vars
    (
      ?auto_809 - TRUCK
      ?auto_811 - LOCATION
      ?auto_810 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_809 ?auto_811 ) ( IN-CITY ?auto_811 ?auto_810 ) ( IN-CITY ?auto_806 ?auto_810 ) ( not ( = ?auto_806 ?auto_811 ) ) ( OBJ-AT ?auto_807 ?auto_806 ) ( not ( = ?auto_807 ?auto_808 ) ) ( OBJ-AT ?auto_808 ?auto_811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_808 ?auto_806 )
      ( DELIVER-2PKG-VERIFY ?auto_807 ?auto_808 ?auto_806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_813 - OBJ
      ?auto_814 - OBJ
      ?auto_812 - LOCATION
    )
    :vars
    (
      ?auto_817 - TRUCK
      ?auto_816 - LOCATION
      ?auto_815 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_817 ?auto_816 ) ( IN-CITY ?auto_816 ?auto_815 ) ( IN-CITY ?auto_812 ?auto_815 ) ( not ( = ?auto_812 ?auto_816 ) ) ( OBJ-AT ?auto_814 ?auto_812 ) ( not ( = ?auto_814 ?auto_813 ) ) ( OBJ-AT ?auto_813 ?auto_816 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_814 ?auto_813 ?auto_812 )
      ( DELIVER-2PKG-VERIFY ?auto_813 ?auto_814 ?auto_812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_826 - OBJ
      ?auto_825 - LOCATION
    )
    :vars
    (
      ?auto_828 - LOCATION
      ?auto_827 - CITY
      ?auto_830 - OBJ
      ?auto_829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_828 ?auto_827 ) ( IN-CITY ?auto_825 ?auto_827 ) ( not ( = ?auto_825 ?auto_828 ) ) ( OBJ-AT ?auto_830 ?auto_825 ) ( not ( = ?auto_830 ?auto_826 ) ) ( OBJ-AT ?auto_826 ?auto_828 ) ( TRUCK-AT ?auto_829 ?auto_825 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_829 ?auto_825 ?auto_828 ?auto_827 )
      ( DELIVER-2PKG ?auto_830 ?auto_826 ?auto_825 )
      ( DELIVER-1PKG-VERIFY ?auto_826 ?auto_825 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_832 - OBJ
      ?auto_833 - OBJ
      ?auto_831 - LOCATION
    )
    :vars
    (
      ?auto_836 - LOCATION
      ?auto_835 - CITY
      ?auto_834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_836 ?auto_835 ) ( IN-CITY ?auto_831 ?auto_835 ) ( not ( = ?auto_831 ?auto_836 ) ) ( OBJ-AT ?auto_832 ?auto_831 ) ( not ( = ?auto_832 ?auto_833 ) ) ( OBJ-AT ?auto_833 ?auto_836 ) ( TRUCK-AT ?auto_834 ?auto_831 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_833 ?auto_831 )
      ( DELIVER-2PKG-VERIFY ?auto_832 ?auto_833 ?auto_831 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_838 - OBJ
      ?auto_839 - OBJ
      ?auto_837 - LOCATION
    )
    :vars
    (
      ?auto_840 - LOCATION
      ?auto_842 - CITY
      ?auto_841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_840 ?auto_842 ) ( IN-CITY ?auto_837 ?auto_842 ) ( not ( = ?auto_837 ?auto_840 ) ) ( OBJ-AT ?auto_839 ?auto_837 ) ( not ( = ?auto_839 ?auto_838 ) ) ( OBJ-AT ?auto_838 ?auto_840 ) ( TRUCK-AT ?auto_841 ?auto_837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_839 ?auto_838 ?auto_837 )
      ( DELIVER-2PKG-VERIFY ?auto_838 ?auto_839 ?auto_837 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_851 - OBJ
      ?auto_850 - LOCATION
    )
    :vars
    (
      ?auto_852 - LOCATION
      ?auto_855 - CITY
      ?auto_853 - OBJ
      ?auto_854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_852 ?auto_855 ) ( IN-CITY ?auto_850 ?auto_855 ) ( not ( = ?auto_850 ?auto_852 ) ) ( not ( = ?auto_853 ?auto_851 ) ) ( OBJ-AT ?auto_851 ?auto_852 ) ( TRUCK-AT ?auto_854 ?auto_850 ) ( IN-TRUCK ?auto_853 ?auto_854 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_853 ?auto_850 )
      ( DELIVER-2PKG ?auto_853 ?auto_851 ?auto_850 )
      ( DELIVER-1PKG-VERIFY ?auto_851 ?auto_850 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_857 - OBJ
      ?auto_858 - OBJ
      ?auto_856 - LOCATION
    )
    :vars
    (
      ?auto_859 - LOCATION
      ?auto_861 - CITY
      ?auto_860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_859 ?auto_861 ) ( IN-CITY ?auto_856 ?auto_861 ) ( not ( = ?auto_856 ?auto_859 ) ) ( not ( = ?auto_857 ?auto_858 ) ) ( OBJ-AT ?auto_858 ?auto_859 ) ( TRUCK-AT ?auto_860 ?auto_856 ) ( IN-TRUCK ?auto_857 ?auto_860 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_858 ?auto_856 )
      ( DELIVER-2PKG-VERIFY ?auto_857 ?auto_858 ?auto_856 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_863 - OBJ
      ?auto_864 - OBJ
      ?auto_862 - LOCATION
    )
    :vars
    (
      ?auto_866 - LOCATION
      ?auto_865 - CITY
      ?auto_867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_866 ?auto_865 ) ( IN-CITY ?auto_862 ?auto_865 ) ( not ( = ?auto_862 ?auto_866 ) ) ( not ( = ?auto_864 ?auto_863 ) ) ( OBJ-AT ?auto_863 ?auto_866 ) ( TRUCK-AT ?auto_867 ?auto_862 ) ( IN-TRUCK ?auto_864 ?auto_867 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_864 ?auto_863 ?auto_862 )
      ( DELIVER-2PKG-VERIFY ?auto_863 ?auto_864 ?auto_862 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_876 - OBJ
      ?auto_875 - LOCATION
    )
    :vars
    (
      ?auto_878 - LOCATION
      ?auto_877 - CITY
      ?auto_880 - OBJ
      ?auto_879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_878 ?auto_877 ) ( IN-CITY ?auto_875 ?auto_877 ) ( not ( = ?auto_875 ?auto_878 ) ) ( not ( = ?auto_880 ?auto_876 ) ) ( OBJ-AT ?auto_876 ?auto_878 ) ( IN-TRUCK ?auto_880 ?auto_879 ) ( TRUCK-AT ?auto_879 ?auto_878 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_879 ?auto_878 ?auto_875 ?auto_877 )
      ( DELIVER-2PKG ?auto_880 ?auto_876 ?auto_875 )
      ( DELIVER-1PKG-VERIFY ?auto_876 ?auto_875 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_882 - OBJ
      ?auto_883 - OBJ
      ?auto_881 - LOCATION
    )
    :vars
    (
      ?auto_884 - LOCATION
      ?auto_886 - CITY
      ?auto_885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_884 ?auto_886 ) ( IN-CITY ?auto_881 ?auto_886 ) ( not ( = ?auto_881 ?auto_884 ) ) ( not ( = ?auto_882 ?auto_883 ) ) ( OBJ-AT ?auto_883 ?auto_884 ) ( IN-TRUCK ?auto_882 ?auto_885 ) ( TRUCK-AT ?auto_885 ?auto_884 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_883 ?auto_881 )
      ( DELIVER-2PKG-VERIFY ?auto_882 ?auto_883 ?auto_881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_888 - OBJ
      ?auto_889 - OBJ
      ?auto_887 - LOCATION
    )
    :vars
    (
      ?auto_891 - LOCATION
      ?auto_892 - CITY
      ?auto_890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_891 ?auto_892 ) ( IN-CITY ?auto_887 ?auto_892 ) ( not ( = ?auto_887 ?auto_891 ) ) ( not ( = ?auto_889 ?auto_888 ) ) ( OBJ-AT ?auto_888 ?auto_891 ) ( IN-TRUCK ?auto_889 ?auto_890 ) ( TRUCK-AT ?auto_890 ?auto_891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_889 ?auto_888 ?auto_887 )
      ( DELIVER-2PKG-VERIFY ?auto_888 ?auto_889 ?auto_887 ) )
  )

)

