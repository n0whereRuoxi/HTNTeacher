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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4704 - OBJ
      ?auto_4705 - LOCATION
    )
    :vars
    (
      ?auto_4706 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4706 ?auto_4705 ) ( IN-TRUCK ?auto_4704 ?auto_4706 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4704 ?auto_4706 ?auto_4705 )
      ( DELIVER-1PKG-VERIFY ?auto_4704 ?auto_4705 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4709 - OBJ
      ?auto_4710 - LOCATION
    )
    :vars
    (
      ?auto_4711 - TRUCK
      ?auto_4712 - LOCATION
      ?auto_4713 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4709 ?auto_4711 ) ( TRUCK-AT ?auto_4711 ?auto_4712 ) ( IN-CITY ?auto_4712 ?auto_4713 ) ( IN-CITY ?auto_4710 ?auto_4713 ) ( not ( = ?auto_4710 ?auto_4712 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4711 ?auto_4712 ?auto_4710 ?auto_4713 )
      ( DELIVER-1PKG ?auto_4709 ?auto_4710 )
      ( DELIVER-1PKG-VERIFY ?auto_4709 ?auto_4710 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4716 - OBJ
      ?auto_4717 - LOCATION
    )
    :vars
    (
      ?auto_4720 - TRUCK
      ?auto_4718 - LOCATION
      ?auto_4719 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4720 ?auto_4718 ) ( IN-CITY ?auto_4718 ?auto_4719 ) ( IN-CITY ?auto_4717 ?auto_4719 ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( OBJ-AT ?auto_4716 ?auto_4718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4716 ?auto_4720 ?auto_4718 )
      ( DELIVER-1PKG ?auto_4716 ?auto_4717 )
      ( DELIVER-1PKG-VERIFY ?auto_4716 ?auto_4717 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4723 - OBJ
      ?auto_4724 - LOCATION
    )
    :vars
    (
      ?auto_4727 - LOCATION
      ?auto_4725 - CITY
      ?auto_4726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4727 ?auto_4725 ) ( IN-CITY ?auto_4724 ?auto_4725 ) ( not ( = ?auto_4724 ?auto_4727 ) ) ( OBJ-AT ?auto_4723 ?auto_4727 ) ( TRUCK-AT ?auto_4726 ?auto_4724 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4726 ?auto_4724 ?auto_4727 ?auto_4725 )
      ( DELIVER-1PKG ?auto_4723 ?auto_4724 )
      ( DELIVER-1PKG-VERIFY ?auto_4723 ?auto_4724 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4757 - OBJ
      ?auto_4759 - OBJ
      ?auto_4758 - LOCATION
    )
    :vars
    (
      ?auto_4760 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4759 ?auto_4757 ) ( TRUCK-AT ?auto_4760 ?auto_4758 ) ( IN-TRUCK ?auto_4759 ?auto_4760 ) ( OBJ-AT ?auto_4757 ?auto_4758 ) ( not ( = ?auto_4757 ?auto_4759 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4759 ?auto_4758 )
      ( DELIVER-2PKG-VERIFY ?auto_4757 ?auto_4759 ?auto_4758 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4764 - OBJ
      ?auto_4766 - OBJ
      ?auto_4765 - LOCATION
    )
    :vars
    (
      ?auto_4767 - TRUCK
      ?auto_4768 - LOCATION
      ?auto_4769 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4766 ?auto_4764 ) ( IN-TRUCK ?auto_4766 ?auto_4767 ) ( TRUCK-AT ?auto_4767 ?auto_4768 ) ( IN-CITY ?auto_4768 ?auto_4769 ) ( IN-CITY ?auto_4765 ?auto_4769 ) ( not ( = ?auto_4765 ?auto_4768 ) ) ( OBJ-AT ?auto_4764 ?auto_4765 ) ( not ( = ?auto_4764 ?auto_4766 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4766 ?auto_4765 )
      ( DELIVER-2PKG-VERIFY ?auto_4764 ?auto_4766 ?auto_4765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4773 - OBJ
      ?auto_4775 - OBJ
      ?auto_4774 - LOCATION
    )
    :vars
    (
      ?auto_4777 - TRUCK
      ?auto_4778 - LOCATION
      ?auto_4776 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4775 ?auto_4773 ) ( TRUCK-AT ?auto_4777 ?auto_4778 ) ( IN-CITY ?auto_4778 ?auto_4776 ) ( IN-CITY ?auto_4774 ?auto_4776 ) ( not ( = ?auto_4774 ?auto_4778 ) ) ( OBJ-AT ?auto_4775 ?auto_4778 ) ( OBJ-AT ?auto_4773 ?auto_4774 ) ( not ( = ?auto_4773 ?auto_4775 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4775 ?auto_4774 )
      ( DELIVER-2PKG-VERIFY ?auto_4773 ?auto_4775 ?auto_4774 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4782 - OBJ
      ?auto_4784 - OBJ
      ?auto_4783 - LOCATION
    )
    :vars
    (
      ?auto_4787 - LOCATION
      ?auto_4786 - CITY
      ?auto_4785 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4784 ?auto_4782 ) ( IN-CITY ?auto_4787 ?auto_4786 ) ( IN-CITY ?auto_4783 ?auto_4786 ) ( not ( = ?auto_4783 ?auto_4787 ) ) ( OBJ-AT ?auto_4784 ?auto_4787 ) ( TRUCK-AT ?auto_4785 ?auto_4783 ) ( OBJ-AT ?auto_4782 ?auto_4783 ) ( not ( = ?auto_4782 ?auto_4784 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4784 ?auto_4783 )
      ( DELIVER-2PKG-VERIFY ?auto_4782 ?auto_4784 ?auto_4783 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4791 - OBJ
      ?auto_4793 - OBJ
      ?auto_4792 - LOCATION
    )
    :vars
    (
      ?auto_4794 - LOCATION
      ?auto_4796 - CITY
      ?auto_4795 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4793 ?auto_4791 ) ( IN-CITY ?auto_4794 ?auto_4796 ) ( IN-CITY ?auto_4792 ?auto_4796 ) ( not ( = ?auto_4792 ?auto_4794 ) ) ( OBJ-AT ?auto_4793 ?auto_4794 ) ( TRUCK-AT ?auto_4795 ?auto_4792 ) ( not ( = ?auto_4791 ?auto_4793 ) ) ( IN-TRUCK ?auto_4791 ?auto_4795 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4791 ?auto_4792 )
      ( DELIVER-2PKG ?auto_4791 ?auto_4793 ?auto_4792 )
      ( DELIVER-2PKG-VERIFY ?auto_4791 ?auto_4793 ?auto_4792 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4800 - OBJ
      ?auto_4802 - OBJ
      ?auto_4801 - LOCATION
    )
    :vars
    (
      ?auto_4805 - LOCATION
      ?auto_4804 - CITY
      ?auto_4803 - TRUCK
      ?auto_4806 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4802 ?auto_4800 ) ( IN-CITY ?auto_4805 ?auto_4804 ) ( IN-CITY ?auto_4801 ?auto_4804 ) ( not ( = ?auto_4801 ?auto_4805 ) ) ( OBJ-AT ?auto_4802 ?auto_4805 ) ( not ( = ?auto_4800 ?auto_4802 ) ) ( IN-TRUCK ?auto_4800 ?auto_4803 ) ( TRUCK-AT ?auto_4803 ?auto_4806 ) ( IN-CITY ?auto_4806 ?auto_4804 ) ( not ( = ?auto_4801 ?auto_4806 ) ) ( not ( = ?auto_4805 ?auto_4806 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4803 ?auto_4806 ?auto_4801 ?auto_4804 )
      ( DELIVER-2PKG ?auto_4800 ?auto_4802 ?auto_4801 )
      ( DELIVER-2PKG-VERIFY ?auto_4800 ?auto_4802 ?auto_4801 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4810 - OBJ
      ?auto_4812 - OBJ
      ?auto_4811 - LOCATION
    )
    :vars
    (
      ?auto_4816 - LOCATION
      ?auto_4813 - CITY
      ?auto_4815 - TRUCK
      ?auto_4814 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4812 ?auto_4810 ) ( IN-CITY ?auto_4816 ?auto_4813 ) ( IN-CITY ?auto_4811 ?auto_4813 ) ( not ( = ?auto_4811 ?auto_4816 ) ) ( OBJ-AT ?auto_4812 ?auto_4816 ) ( not ( = ?auto_4810 ?auto_4812 ) ) ( TRUCK-AT ?auto_4815 ?auto_4814 ) ( IN-CITY ?auto_4814 ?auto_4813 ) ( not ( = ?auto_4811 ?auto_4814 ) ) ( not ( = ?auto_4816 ?auto_4814 ) ) ( OBJ-AT ?auto_4810 ?auto_4814 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4810 ?auto_4815 ?auto_4814 )
      ( DELIVER-2PKG ?auto_4810 ?auto_4812 ?auto_4811 )
      ( DELIVER-2PKG-VERIFY ?auto_4810 ?auto_4812 ?auto_4811 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4820 - OBJ
      ?auto_4822 - OBJ
      ?auto_4821 - LOCATION
    )
    :vars
    (
      ?auto_4823 - LOCATION
      ?auto_4826 - CITY
      ?auto_4824 - LOCATION
      ?auto_4825 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4822 ?auto_4820 ) ( IN-CITY ?auto_4823 ?auto_4826 ) ( IN-CITY ?auto_4821 ?auto_4826 ) ( not ( = ?auto_4821 ?auto_4823 ) ) ( OBJ-AT ?auto_4822 ?auto_4823 ) ( not ( = ?auto_4820 ?auto_4822 ) ) ( IN-CITY ?auto_4824 ?auto_4826 ) ( not ( = ?auto_4821 ?auto_4824 ) ) ( not ( = ?auto_4823 ?auto_4824 ) ) ( OBJ-AT ?auto_4820 ?auto_4824 ) ( TRUCK-AT ?auto_4825 ?auto_4821 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4825 ?auto_4821 ?auto_4824 ?auto_4826 )
      ( DELIVER-2PKG ?auto_4820 ?auto_4822 ?auto_4821 )
      ( DELIVER-2PKG-VERIFY ?auto_4820 ?auto_4822 ?auto_4821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4857 - OBJ
      ?auto_4859 - OBJ
      ?auto_4860 - OBJ
      ?auto_4858 - LOCATION
    )
    :vars
    (
      ?auto_4861 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4859 ?auto_4857 ) ( GREATER-THAN ?auto_4860 ?auto_4857 ) ( GREATER-THAN ?auto_4860 ?auto_4859 ) ( TRUCK-AT ?auto_4861 ?auto_4858 ) ( IN-TRUCK ?auto_4860 ?auto_4861 ) ( OBJ-AT ?auto_4857 ?auto_4858 ) ( OBJ-AT ?auto_4859 ?auto_4858 ) ( not ( = ?auto_4857 ?auto_4859 ) ) ( not ( = ?auto_4857 ?auto_4860 ) ) ( not ( = ?auto_4859 ?auto_4860 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4860 ?auto_4858 )
      ( DELIVER-3PKG-VERIFY ?auto_4857 ?auto_4859 ?auto_4860 ?auto_4858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4866 - OBJ
      ?auto_4868 - OBJ
      ?auto_4869 - OBJ
      ?auto_4867 - LOCATION
    )
    :vars
    (
      ?auto_4870 - TRUCK
      ?auto_4872 - LOCATION
      ?auto_4871 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4868 ?auto_4866 ) ( GREATER-THAN ?auto_4869 ?auto_4866 ) ( GREATER-THAN ?auto_4869 ?auto_4868 ) ( IN-TRUCK ?auto_4869 ?auto_4870 ) ( TRUCK-AT ?auto_4870 ?auto_4872 ) ( IN-CITY ?auto_4872 ?auto_4871 ) ( IN-CITY ?auto_4867 ?auto_4871 ) ( not ( = ?auto_4867 ?auto_4872 ) ) ( OBJ-AT ?auto_4866 ?auto_4867 ) ( OBJ-AT ?auto_4868 ?auto_4867 ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4866 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4869 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4869 ?auto_4867 )
      ( DELIVER-3PKG-VERIFY ?auto_4866 ?auto_4868 ?auto_4869 ?auto_4867 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4877 - OBJ
      ?auto_4879 - OBJ
      ?auto_4880 - OBJ
      ?auto_4878 - LOCATION
    )
    :vars
    (
      ?auto_4881 - TRUCK
      ?auto_4883 - LOCATION
      ?auto_4882 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4879 ?auto_4877 ) ( GREATER-THAN ?auto_4880 ?auto_4877 ) ( GREATER-THAN ?auto_4880 ?auto_4879 ) ( TRUCK-AT ?auto_4881 ?auto_4883 ) ( IN-CITY ?auto_4883 ?auto_4882 ) ( IN-CITY ?auto_4878 ?auto_4882 ) ( not ( = ?auto_4878 ?auto_4883 ) ) ( OBJ-AT ?auto_4880 ?auto_4883 ) ( OBJ-AT ?auto_4877 ?auto_4878 ) ( OBJ-AT ?auto_4879 ?auto_4878 ) ( not ( = ?auto_4877 ?auto_4879 ) ) ( not ( = ?auto_4877 ?auto_4880 ) ) ( not ( = ?auto_4879 ?auto_4880 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4880 ?auto_4878 )
      ( DELIVER-3PKG-VERIFY ?auto_4877 ?auto_4879 ?auto_4880 ?auto_4878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4888 - OBJ
      ?auto_4890 - OBJ
      ?auto_4891 - OBJ
      ?auto_4889 - LOCATION
    )
    :vars
    (
      ?auto_4894 - LOCATION
      ?auto_4893 - CITY
      ?auto_4892 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4890 ?auto_4888 ) ( GREATER-THAN ?auto_4891 ?auto_4888 ) ( GREATER-THAN ?auto_4891 ?auto_4890 ) ( IN-CITY ?auto_4894 ?auto_4893 ) ( IN-CITY ?auto_4889 ?auto_4893 ) ( not ( = ?auto_4889 ?auto_4894 ) ) ( OBJ-AT ?auto_4891 ?auto_4894 ) ( TRUCK-AT ?auto_4892 ?auto_4889 ) ( OBJ-AT ?auto_4888 ?auto_4889 ) ( OBJ-AT ?auto_4890 ?auto_4889 ) ( not ( = ?auto_4888 ?auto_4890 ) ) ( not ( = ?auto_4888 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4891 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4891 ?auto_4889 )
      ( DELIVER-3PKG-VERIFY ?auto_4888 ?auto_4890 ?auto_4891 ?auto_4889 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4899 - OBJ
      ?auto_4901 - OBJ
      ?auto_4902 - OBJ
      ?auto_4900 - LOCATION
    )
    :vars
    (
      ?auto_4905 - LOCATION
      ?auto_4904 - CITY
      ?auto_4903 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4901 ?auto_4899 ) ( GREATER-THAN ?auto_4902 ?auto_4899 ) ( GREATER-THAN ?auto_4902 ?auto_4901 ) ( IN-CITY ?auto_4905 ?auto_4904 ) ( IN-CITY ?auto_4900 ?auto_4904 ) ( not ( = ?auto_4900 ?auto_4905 ) ) ( OBJ-AT ?auto_4902 ?auto_4905 ) ( TRUCK-AT ?auto_4903 ?auto_4900 ) ( OBJ-AT ?auto_4899 ?auto_4900 ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( IN-TRUCK ?auto_4901 ?auto_4903 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4901 ?auto_4900 )
      ( DELIVER-3PKG ?auto_4899 ?auto_4901 ?auto_4902 ?auto_4900 )
      ( DELIVER-3PKG-VERIFY ?auto_4899 ?auto_4901 ?auto_4902 ?auto_4900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4910 - OBJ
      ?auto_4912 - OBJ
      ?auto_4913 - OBJ
      ?auto_4911 - LOCATION
    )
    :vars
    (
      ?auto_4916 - LOCATION
      ?auto_4914 - CITY
      ?auto_4915 - TRUCK
      ?auto_4917 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4912 ?auto_4910 ) ( GREATER-THAN ?auto_4913 ?auto_4910 ) ( GREATER-THAN ?auto_4913 ?auto_4912 ) ( IN-CITY ?auto_4916 ?auto_4914 ) ( IN-CITY ?auto_4911 ?auto_4914 ) ( not ( = ?auto_4911 ?auto_4916 ) ) ( OBJ-AT ?auto_4913 ?auto_4916 ) ( OBJ-AT ?auto_4910 ?auto_4911 ) ( not ( = ?auto_4910 ?auto_4912 ) ) ( not ( = ?auto_4910 ?auto_4913 ) ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( IN-TRUCK ?auto_4912 ?auto_4915 ) ( TRUCK-AT ?auto_4915 ?auto_4917 ) ( IN-CITY ?auto_4917 ?auto_4914 ) ( not ( = ?auto_4911 ?auto_4917 ) ) ( not ( = ?auto_4916 ?auto_4917 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4915 ?auto_4917 ?auto_4911 ?auto_4914 )
      ( DELIVER-3PKG ?auto_4910 ?auto_4912 ?auto_4913 ?auto_4911 )
      ( DELIVER-3PKG-VERIFY ?auto_4910 ?auto_4912 ?auto_4913 ?auto_4911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4922 - OBJ
      ?auto_4924 - OBJ
      ?auto_4925 - OBJ
      ?auto_4923 - LOCATION
    )
    :vars
    (
      ?auto_4927 - LOCATION
      ?auto_4926 - CITY
      ?auto_4928 - TRUCK
      ?auto_4929 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4924 ?auto_4922 ) ( GREATER-THAN ?auto_4925 ?auto_4922 ) ( GREATER-THAN ?auto_4925 ?auto_4924 ) ( IN-CITY ?auto_4927 ?auto_4926 ) ( IN-CITY ?auto_4923 ?auto_4926 ) ( not ( = ?auto_4923 ?auto_4927 ) ) ( OBJ-AT ?auto_4925 ?auto_4927 ) ( OBJ-AT ?auto_4922 ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4924 ) ) ( not ( = ?auto_4922 ?auto_4925 ) ) ( not ( = ?auto_4924 ?auto_4925 ) ) ( TRUCK-AT ?auto_4928 ?auto_4929 ) ( IN-CITY ?auto_4929 ?auto_4926 ) ( not ( = ?auto_4923 ?auto_4929 ) ) ( not ( = ?auto_4927 ?auto_4929 ) ) ( OBJ-AT ?auto_4924 ?auto_4929 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4924 ?auto_4928 ?auto_4929 )
      ( DELIVER-3PKG ?auto_4922 ?auto_4924 ?auto_4925 ?auto_4923 )
      ( DELIVER-3PKG-VERIFY ?auto_4922 ?auto_4924 ?auto_4925 ?auto_4923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4934 - OBJ
      ?auto_4936 - OBJ
      ?auto_4937 - OBJ
      ?auto_4935 - LOCATION
    )
    :vars
    (
      ?auto_4938 - LOCATION
      ?auto_4941 - CITY
      ?auto_4940 - LOCATION
      ?auto_4939 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4936 ?auto_4934 ) ( GREATER-THAN ?auto_4937 ?auto_4934 ) ( GREATER-THAN ?auto_4937 ?auto_4936 ) ( IN-CITY ?auto_4938 ?auto_4941 ) ( IN-CITY ?auto_4935 ?auto_4941 ) ( not ( = ?auto_4935 ?auto_4938 ) ) ( OBJ-AT ?auto_4937 ?auto_4938 ) ( OBJ-AT ?auto_4934 ?auto_4935 ) ( not ( = ?auto_4934 ?auto_4936 ) ) ( not ( = ?auto_4934 ?auto_4937 ) ) ( not ( = ?auto_4936 ?auto_4937 ) ) ( IN-CITY ?auto_4940 ?auto_4941 ) ( not ( = ?auto_4935 ?auto_4940 ) ) ( not ( = ?auto_4938 ?auto_4940 ) ) ( OBJ-AT ?auto_4936 ?auto_4940 ) ( TRUCK-AT ?auto_4939 ?auto_4935 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4939 ?auto_4935 ?auto_4940 ?auto_4941 )
      ( DELIVER-3PKG ?auto_4934 ?auto_4936 ?auto_4937 ?auto_4935 )
      ( DELIVER-3PKG-VERIFY ?auto_4934 ?auto_4936 ?auto_4937 ?auto_4935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4946 - OBJ
      ?auto_4948 - OBJ
      ?auto_4949 - OBJ
      ?auto_4947 - LOCATION
    )
    :vars
    (
      ?auto_4950 - LOCATION
      ?auto_4952 - CITY
      ?auto_4951 - LOCATION
      ?auto_4953 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4948 ?auto_4946 ) ( GREATER-THAN ?auto_4949 ?auto_4946 ) ( GREATER-THAN ?auto_4949 ?auto_4948 ) ( IN-CITY ?auto_4950 ?auto_4952 ) ( IN-CITY ?auto_4947 ?auto_4952 ) ( not ( = ?auto_4947 ?auto_4950 ) ) ( OBJ-AT ?auto_4949 ?auto_4950 ) ( not ( = ?auto_4946 ?auto_4948 ) ) ( not ( = ?auto_4946 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( IN-CITY ?auto_4951 ?auto_4952 ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( OBJ-AT ?auto_4948 ?auto_4951 ) ( TRUCK-AT ?auto_4953 ?auto_4947 ) ( IN-TRUCK ?auto_4946 ?auto_4953 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4946 ?auto_4947 )
      ( DELIVER-3PKG ?auto_4946 ?auto_4948 ?auto_4949 ?auto_4947 )
      ( DELIVER-3PKG-VERIFY ?auto_4946 ?auto_4948 ?auto_4949 ?auto_4947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4958 - OBJ
      ?auto_4960 - OBJ
      ?auto_4961 - OBJ
      ?auto_4959 - LOCATION
    )
    :vars
    (
      ?auto_4964 - LOCATION
      ?auto_4965 - CITY
      ?auto_4963 - LOCATION
      ?auto_4962 - TRUCK
      ?auto_4966 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4960 ?auto_4958 ) ( GREATER-THAN ?auto_4961 ?auto_4958 ) ( GREATER-THAN ?auto_4961 ?auto_4960 ) ( IN-CITY ?auto_4964 ?auto_4965 ) ( IN-CITY ?auto_4959 ?auto_4965 ) ( not ( = ?auto_4959 ?auto_4964 ) ) ( OBJ-AT ?auto_4961 ?auto_4964 ) ( not ( = ?auto_4958 ?auto_4960 ) ) ( not ( = ?auto_4958 ?auto_4961 ) ) ( not ( = ?auto_4960 ?auto_4961 ) ) ( IN-CITY ?auto_4963 ?auto_4965 ) ( not ( = ?auto_4959 ?auto_4963 ) ) ( not ( = ?auto_4964 ?auto_4963 ) ) ( OBJ-AT ?auto_4960 ?auto_4963 ) ( IN-TRUCK ?auto_4958 ?auto_4962 ) ( TRUCK-AT ?auto_4962 ?auto_4966 ) ( IN-CITY ?auto_4966 ?auto_4965 ) ( not ( = ?auto_4959 ?auto_4966 ) ) ( not ( = ?auto_4964 ?auto_4966 ) ) ( not ( = ?auto_4963 ?auto_4966 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4962 ?auto_4966 ?auto_4959 ?auto_4965 )
      ( DELIVER-3PKG ?auto_4958 ?auto_4960 ?auto_4961 ?auto_4959 )
      ( DELIVER-3PKG-VERIFY ?auto_4958 ?auto_4960 ?auto_4961 ?auto_4959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4971 - OBJ
      ?auto_4973 - OBJ
      ?auto_4974 - OBJ
      ?auto_4972 - LOCATION
    )
    :vars
    (
      ?auto_4979 - LOCATION
      ?auto_4975 - CITY
      ?auto_4976 - LOCATION
      ?auto_4978 - TRUCK
      ?auto_4977 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4973 ?auto_4971 ) ( GREATER-THAN ?auto_4974 ?auto_4971 ) ( GREATER-THAN ?auto_4974 ?auto_4973 ) ( IN-CITY ?auto_4979 ?auto_4975 ) ( IN-CITY ?auto_4972 ?auto_4975 ) ( not ( = ?auto_4972 ?auto_4979 ) ) ( OBJ-AT ?auto_4974 ?auto_4979 ) ( not ( = ?auto_4971 ?auto_4973 ) ) ( not ( = ?auto_4971 ?auto_4974 ) ) ( not ( = ?auto_4973 ?auto_4974 ) ) ( IN-CITY ?auto_4976 ?auto_4975 ) ( not ( = ?auto_4972 ?auto_4976 ) ) ( not ( = ?auto_4979 ?auto_4976 ) ) ( OBJ-AT ?auto_4973 ?auto_4976 ) ( TRUCK-AT ?auto_4978 ?auto_4977 ) ( IN-CITY ?auto_4977 ?auto_4975 ) ( not ( = ?auto_4972 ?auto_4977 ) ) ( not ( = ?auto_4979 ?auto_4977 ) ) ( not ( = ?auto_4976 ?auto_4977 ) ) ( OBJ-AT ?auto_4971 ?auto_4977 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4971 ?auto_4978 ?auto_4977 )
      ( DELIVER-3PKG ?auto_4971 ?auto_4973 ?auto_4974 ?auto_4972 )
      ( DELIVER-3PKG-VERIFY ?auto_4971 ?auto_4973 ?auto_4974 ?auto_4972 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4984 - OBJ
      ?auto_4986 - OBJ
      ?auto_4987 - OBJ
      ?auto_4985 - LOCATION
    )
    :vars
    (
      ?auto_4990 - LOCATION
      ?auto_4988 - CITY
      ?auto_4992 - LOCATION
      ?auto_4991 - LOCATION
      ?auto_4989 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4986 ?auto_4984 ) ( GREATER-THAN ?auto_4987 ?auto_4984 ) ( GREATER-THAN ?auto_4987 ?auto_4986 ) ( IN-CITY ?auto_4990 ?auto_4988 ) ( IN-CITY ?auto_4985 ?auto_4988 ) ( not ( = ?auto_4985 ?auto_4990 ) ) ( OBJ-AT ?auto_4987 ?auto_4990 ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4984 ?auto_4987 ) ) ( not ( = ?auto_4986 ?auto_4987 ) ) ( IN-CITY ?auto_4992 ?auto_4988 ) ( not ( = ?auto_4985 ?auto_4992 ) ) ( not ( = ?auto_4990 ?auto_4992 ) ) ( OBJ-AT ?auto_4986 ?auto_4992 ) ( IN-CITY ?auto_4991 ?auto_4988 ) ( not ( = ?auto_4985 ?auto_4991 ) ) ( not ( = ?auto_4990 ?auto_4991 ) ) ( not ( = ?auto_4992 ?auto_4991 ) ) ( OBJ-AT ?auto_4984 ?auto_4991 ) ( TRUCK-AT ?auto_4989 ?auto_4985 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4989 ?auto_4985 ?auto_4991 ?auto_4988 )
      ( DELIVER-3PKG ?auto_4984 ?auto_4986 ?auto_4987 ?auto_4985 )
      ( DELIVER-3PKG-VERIFY ?auto_4984 ?auto_4986 ?auto_4987 ?auto_4985 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5024 - OBJ
      ?auto_5026 - OBJ
      ?auto_5027 - OBJ
      ?auto_5028 - OBJ
      ?auto_5025 - LOCATION
    )
    :vars
    (
      ?auto_5029 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5026 ?auto_5024 ) ( GREATER-THAN ?auto_5027 ?auto_5024 ) ( GREATER-THAN ?auto_5027 ?auto_5026 ) ( GREATER-THAN ?auto_5028 ?auto_5024 ) ( GREATER-THAN ?auto_5028 ?auto_5026 ) ( GREATER-THAN ?auto_5028 ?auto_5027 ) ( TRUCK-AT ?auto_5029 ?auto_5025 ) ( IN-TRUCK ?auto_5028 ?auto_5029 ) ( OBJ-AT ?auto_5024 ?auto_5025 ) ( OBJ-AT ?auto_5026 ?auto_5025 ) ( OBJ-AT ?auto_5027 ?auto_5025 ) ( not ( = ?auto_5024 ?auto_5026 ) ) ( not ( = ?auto_5024 ?auto_5027 ) ) ( not ( = ?auto_5024 ?auto_5028 ) ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5027 ?auto_5028 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5028 ?auto_5025 )
      ( DELIVER-4PKG-VERIFY ?auto_5024 ?auto_5026 ?auto_5027 ?auto_5028 ?auto_5025 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5035 - OBJ
      ?auto_5037 - OBJ
      ?auto_5038 - OBJ
      ?auto_5039 - OBJ
      ?auto_5036 - LOCATION
    )
    :vars
    (
      ?auto_5041 - TRUCK
      ?auto_5040 - LOCATION
      ?auto_5042 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5037 ?auto_5035 ) ( GREATER-THAN ?auto_5038 ?auto_5035 ) ( GREATER-THAN ?auto_5038 ?auto_5037 ) ( GREATER-THAN ?auto_5039 ?auto_5035 ) ( GREATER-THAN ?auto_5039 ?auto_5037 ) ( GREATER-THAN ?auto_5039 ?auto_5038 ) ( IN-TRUCK ?auto_5039 ?auto_5041 ) ( TRUCK-AT ?auto_5041 ?auto_5040 ) ( IN-CITY ?auto_5040 ?auto_5042 ) ( IN-CITY ?auto_5036 ?auto_5042 ) ( not ( = ?auto_5036 ?auto_5040 ) ) ( OBJ-AT ?auto_5035 ?auto_5036 ) ( OBJ-AT ?auto_5037 ?auto_5036 ) ( OBJ-AT ?auto_5038 ?auto_5036 ) ( not ( = ?auto_5035 ?auto_5037 ) ) ( not ( = ?auto_5035 ?auto_5038 ) ) ( not ( = ?auto_5035 ?auto_5039 ) ) ( not ( = ?auto_5037 ?auto_5038 ) ) ( not ( = ?auto_5037 ?auto_5039 ) ) ( not ( = ?auto_5038 ?auto_5039 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5039 ?auto_5036 )
      ( DELIVER-4PKG-VERIFY ?auto_5035 ?auto_5037 ?auto_5038 ?auto_5039 ?auto_5036 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5048 - OBJ
      ?auto_5050 - OBJ
      ?auto_5051 - OBJ
      ?auto_5052 - OBJ
      ?auto_5049 - LOCATION
    )
    :vars
    (
      ?auto_5053 - TRUCK
      ?auto_5055 - LOCATION
      ?auto_5054 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5050 ?auto_5048 ) ( GREATER-THAN ?auto_5051 ?auto_5048 ) ( GREATER-THAN ?auto_5051 ?auto_5050 ) ( GREATER-THAN ?auto_5052 ?auto_5048 ) ( GREATER-THAN ?auto_5052 ?auto_5050 ) ( GREATER-THAN ?auto_5052 ?auto_5051 ) ( TRUCK-AT ?auto_5053 ?auto_5055 ) ( IN-CITY ?auto_5055 ?auto_5054 ) ( IN-CITY ?auto_5049 ?auto_5054 ) ( not ( = ?auto_5049 ?auto_5055 ) ) ( OBJ-AT ?auto_5052 ?auto_5055 ) ( OBJ-AT ?auto_5048 ?auto_5049 ) ( OBJ-AT ?auto_5050 ?auto_5049 ) ( OBJ-AT ?auto_5051 ?auto_5049 ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5048 ?auto_5051 ) ) ( not ( = ?auto_5048 ?auto_5052 ) ) ( not ( = ?auto_5050 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5052 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5052 ?auto_5049 )
      ( DELIVER-4PKG-VERIFY ?auto_5048 ?auto_5050 ?auto_5051 ?auto_5052 ?auto_5049 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5061 - OBJ
      ?auto_5063 - OBJ
      ?auto_5064 - OBJ
      ?auto_5065 - OBJ
      ?auto_5062 - LOCATION
    )
    :vars
    (
      ?auto_5066 - LOCATION
      ?auto_5068 - CITY
      ?auto_5067 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5063 ?auto_5061 ) ( GREATER-THAN ?auto_5064 ?auto_5061 ) ( GREATER-THAN ?auto_5064 ?auto_5063 ) ( GREATER-THAN ?auto_5065 ?auto_5061 ) ( GREATER-THAN ?auto_5065 ?auto_5063 ) ( GREATER-THAN ?auto_5065 ?auto_5064 ) ( IN-CITY ?auto_5066 ?auto_5068 ) ( IN-CITY ?auto_5062 ?auto_5068 ) ( not ( = ?auto_5062 ?auto_5066 ) ) ( OBJ-AT ?auto_5065 ?auto_5066 ) ( TRUCK-AT ?auto_5067 ?auto_5062 ) ( OBJ-AT ?auto_5061 ?auto_5062 ) ( OBJ-AT ?auto_5063 ?auto_5062 ) ( OBJ-AT ?auto_5064 ?auto_5062 ) ( not ( = ?auto_5061 ?auto_5063 ) ) ( not ( = ?auto_5061 ?auto_5064 ) ) ( not ( = ?auto_5061 ?auto_5065 ) ) ( not ( = ?auto_5063 ?auto_5064 ) ) ( not ( = ?auto_5063 ?auto_5065 ) ) ( not ( = ?auto_5064 ?auto_5065 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5065 ?auto_5062 )
      ( DELIVER-4PKG-VERIFY ?auto_5061 ?auto_5063 ?auto_5064 ?auto_5065 ?auto_5062 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5074 - OBJ
      ?auto_5076 - OBJ
      ?auto_5077 - OBJ
      ?auto_5078 - OBJ
      ?auto_5075 - LOCATION
    )
    :vars
    (
      ?auto_5081 - LOCATION
      ?auto_5080 - CITY
      ?auto_5079 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5076 ?auto_5074 ) ( GREATER-THAN ?auto_5077 ?auto_5074 ) ( GREATER-THAN ?auto_5077 ?auto_5076 ) ( GREATER-THAN ?auto_5078 ?auto_5074 ) ( GREATER-THAN ?auto_5078 ?auto_5076 ) ( GREATER-THAN ?auto_5078 ?auto_5077 ) ( IN-CITY ?auto_5081 ?auto_5080 ) ( IN-CITY ?auto_5075 ?auto_5080 ) ( not ( = ?auto_5075 ?auto_5081 ) ) ( OBJ-AT ?auto_5078 ?auto_5081 ) ( TRUCK-AT ?auto_5079 ?auto_5075 ) ( OBJ-AT ?auto_5074 ?auto_5075 ) ( OBJ-AT ?auto_5076 ?auto_5075 ) ( not ( = ?auto_5074 ?auto_5076 ) ) ( not ( = ?auto_5074 ?auto_5077 ) ) ( not ( = ?auto_5074 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( IN-TRUCK ?auto_5077 ?auto_5079 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5077 ?auto_5075 )
      ( DELIVER-4PKG ?auto_5074 ?auto_5076 ?auto_5077 ?auto_5078 ?auto_5075 )
      ( DELIVER-4PKG-VERIFY ?auto_5074 ?auto_5076 ?auto_5077 ?auto_5078 ?auto_5075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5087 - OBJ
      ?auto_5089 - OBJ
      ?auto_5090 - OBJ
      ?auto_5091 - OBJ
      ?auto_5088 - LOCATION
    )
    :vars
    (
      ?auto_5092 - LOCATION
      ?auto_5094 - CITY
      ?auto_5093 - TRUCK
      ?auto_5095 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5089 ?auto_5087 ) ( GREATER-THAN ?auto_5090 ?auto_5087 ) ( GREATER-THAN ?auto_5090 ?auto_5089 ) ( GREATER-THAN ?auto_5091 ?auto_5087 ) ( GREATER-THAN ?auto_5091 ?auto_5089 ) ( GREATER-THAN ?auto_5091 ?auto_5090 ) ( IN-CITY ?auto_5092 ?auto_5094 ) ( IN-CITY ?auto_5088 ?auto_5094 ) ( not ( = ?auto_5088 ?auto_5092 ) ) ( OBJ-AT ?auto_5091 ?auto_5092 ) ( OBJ-AT ?auto_5087 ?auto_5088 ) ( OBJ-AT ?auto_5089 ?auto_5088 ) ( not ( = ?auto_5087 ?auto_5089 ) ) ( not ( = ?auto_5087 ?auto_5090 ) ) ( not ( = ?auto_5087 ?auto_5091 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5089 ?auto_5091 ) ) ( not ( = ?auto_5090 ?auto_5091 ) ) ( IN-TRUCK ?auto_5090 ?auto_5093 ) ( TRUCK-AT ?auto_5093 ?auto_5095 ) ( IN-CITY ?auto_5095 ?auto_5094 ) ( not ( = ?auto_5088 ?auto_5095 ) ) ( not ( = ?auto_5092 ?auto_5095 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5093 ?auto_5095 ?auto_5088 ?auto_5094 )
      ( DELIVER-4PKG ?auto_5087 ?auto_5089 ?auto_5090 ?auto_5091 ?auto_5088 )
      ( DELIVER-4PKG-VERIFY ?auto_5087 ?auto_5089 ?auto_5090 ?auto_5091 ?auto_5088 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5101 - OBJ
      ?auto_5103 - OBJ
      ?auto_5104 - OBJ
      ?auto_5105 - OBJ
      ?auto_5102 - LOCATION
    )
    :vars
    (
      ?auto_5108 - LOCATION
      ?auto_5107 - CITY
      ?auto_5106 - TRUCK
      ?auto_5109 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5103 ?auto_5101 ) ( GREATER-THAN ?auto_5104 ?auto_5101 ) ( GREATER-THAN ?auto_5104 ?auto_5103 ) ( GREATER-THAN ?auto_5105 ?auto_5101 ) ( GREATER-THAN ?auto_5105 ?auto_5103 ) ( GREATER-THAN ?auto_5105 ?auto_5104 ) ( IN-CITY ?auto_5108 ?auto_5107 ) ( IN-CITY ?auto_5102 ?auto_5107 ) ( not ( = ?auto_5102 ?auto_5108 ) ) ( OBJ-AT ?auto_5105 ?auto_5108 ) ( OBJ-AT ?auto_5101 ?auto_5102 ) ( OBJ-AT ?auto_5103 ?auto_5102 ) ( not ( = ?auto_5101 ?auto_5103 ) ) ( not ( = ?auto_5101 ?auto_5104 ) ) ( not ( = ?auto_5101 ?auto_5105 ) ) ( not ( = ?auto_5103 ?auto_5104 ) ) ( not ( = ?auto_5103 ?auto_5105 ) ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( TRUCK-AT ?auto_5106 ?auto_5109 ) ( IN-CITY ?auto_5109 ?auto_5107 ) ( not ( = ?auto_5102 ?auto_5109 ) ) ( not ( = ?auto_5108 ?auto_5109 ) ) ( OBJ-AT ?auto_5104 ?auto_5109 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5104 ?auto_5106 ?auto_5109 )
      ( DELIVER-4PKG ?auto_5101 ?auto_5103 ?auto_5104 ?auto_5105 ?auto_5102 )
      ( DELIVER-4PKG-VERIFY ?auto_5101 ?auto_5103 ?auto_5104 ?auto_5105 ?auto_5102 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5115 - OBJ
      ?auto_5117 - OBJ
      ?auto_5118 - OBJ
      ?auto_5119 - OBJ
      ?auto_5116 - LOCATION
    )
    :vars
    (
      ?auto_5122 - LOCATION
      ?auto_5123 - CITY
      ?auto_5121 - LOCATION
      ?auto_5120 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5117 ?auto_5115 ) ( GREATER-THAN ?auto_5118 ?auto_5115 ) ( GREATER-THAN ?auto_5118 ?auto_5117 ) ( GREATER-THAN ?auto_5119 ?auto_5115 ) ( GREATER-THAN ?auto_5119 ?auto_5117 ) ( GREATER-THAN ?auto_5119 ?auto_5118 ) ( IN-CITY ?auto_5122 ?auto_5123 ) ( IN-CITY ?auto_5116 ?auto_5123 ) ( not ( = ?auto_5116 ?auto_5122 ) ) ( OBJ-AT ?auto_5119 ?auto_5122 ) ( OBJ-AT ?auto_5115 ?auto_5116 ) ( OBJ-AT ?auto_5117 ?auto_5116 ) ( not ( = ?auto_5115 ?auto_5117 ) ) ( not ( = ?auto_5115 ?auto_5118 ) ) ( not ( = ?auto_5115 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( IN-CITY ?auto_5121 ?auto_5123 ) ( not ( = ?auto_5116 ?auto_5121 ) ) ( not ( = ?auto_5122 ?auto_5121 ) ) ( OBJ-AT ?auto_5118 ?auto_5121 ) ( TRUCK-AT ?auto_5120 ?auto_5116 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5120 ?auto_5116 ?auto_5121 ?auto_5123 )
      ( DELIVER-4PKG ?auto_5115 ?auto_5117 ?auto_5118 ?auto_5119 ?auto_5116 )
      ( DELIVER-4PKG-VERIFY ?auto_5115 ?auto_5117 ?auto_5118 ?auto_5119 ?auto_5116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5129 - OBJ
      ?auto_5131 - OBJ
      ?auto_5132 - OBJ
      ?auto_5133 - OBJ
      ?auto_5130 - LOCATION
    )
    :vars
    (
      ?auto_5134 - LOCATION
      ?auto_5135 - CITY
      ?auto_5137 - LOCATION
      ?auto_5136 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5131 ?auto_5129 ) ( GREATER-THAN ?auto_5132 ?auto_5129 ) ( GREATER-THAN ?auto_5132 ?auto_5131 ) ( GREATER-THAN ?auto_5133 ?auto_5129 ) ( GREATER-THAN ?auto_5133 ?auto_5131 ) ( GREATER-THAN ?auto_5133 ?auto_5132 ) ( IN-CITY ?auto_5134 ?auto_5135 ) ( IN-CITY ?auto_5130 ?auto_5135 ) ( not ( = ?auto_5130 ?auto_5134 ) ) ( OBJ-AT ?auto_5133 ?auto_5134 ) ( OBJ-AT ?auto_5129 ?auto_5130 ) ( not ( = ?auto_5129 ?auto_5131 ) ) ( not ( = ?auto_5129 ?auto_5132 ) ) ( not ( = ?auto_5129 ?auto_5133 ) ) ( not ( = ?auto_5131 ?auto_5132 ) ) ( not ( = ?auto_5131 ?auto_5133 ) ) ( not ( = ?auto_5132 ?auto_5133 ) ) ( IN-CITY ?auto_5137 ?auto_5135 ) ( not ( = ?auto_5130 ?auto_5137 ) ) ( not ( = ?auto_5134 ?auto_5137 ) ) ( OBJ-AT ?auto_5132 ?auto_5137 ) ( TRUCK-AT ?auto_5136 ?auto_5130 ) ( IN-TRUCK ?auto_5131 ?auto_5136 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5131 ?auto_5130 )
      ( DELIVER-4PKG ?auto_5129 ?auto_5131 ?auto_5132 ?auto_5133 ?auto_5130 )
      ( DELIVER-4PKG-VERIFY ?auto_5129 ?auto_5131 ?auto_5132 ?auto_5133 ?auto_5130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5143 - OBJ
      ?auto_5145 - OBJ
      ?auto_5146 - OBJ
      ?auto_5147 - OBJ
      ?auto_5144 - LOCATION
    )
    :vars
    (
      ?auto_5151 - LOCATION
      ?auto_5150 - CITY
      ?auto_5148 - LOCATION
      ?auto_5149 - TRUCK
      ?auto_5152 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5145 ?auto_5143 ) ( GREATER-THAN ?auto_5146 ?auto_5143 ) ( GREATER-THAN ?auto_5146 ?auto_5145 ) ( GREATER-THAN ?auto_5147 ?auto_5143 ) ( GREATER-THAN ?auto_5147 ?auto_5145 ) ( GREATER-THAN ?auto_5147 ?auto_5146 ) ( IN-CITY ?auto_5151 ?auto_5150 ) ( IN-CITY ?auto_5144 ?auto_5150 ) ( not ( = ?auto_5144 ?auto_5151 ) ) ( OBJ-AT ?auto_5147 ?auto_5151 ) ( OBJ-AT ?auto_5143 ?auto_5144 ) ( not ( = ?auto_5143 ?auto_5145 ) ) ( not ( = ?auto_5143 ?auto_5146 ) ) ( not ( = ?auto_5143 ?auto_5147 ) ) ( not ( = ?auto_5145 ?auto_5146 ) ) ( not ( = ?auto_5145 ?auto_5147 ) ) ( not ( = ?auto_5146 ?auto_5147 ) ) ( IN-CITY ?auto_5148 ?auto_5150 ) ( not ( = ?auto_5144 ?auto_5148 ) ) ( not ( = ?auto_5151 ?auto_5148 ) ) ( OBJ-AT ?auto_5146 ?auto_5148 ) ( IN-TRUCK ?auto_5145 ?auto_5149 ) ( TRUCK-AT ?auto_5149 ?auto_5152 ) ( IN-CITY ?auto_5152 ?auto_5150 ) ( not ( = ?auto_5144 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5148 ?auto_5152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5149 ?auto_5152 ?auto_5144 ?auto_5150 )
      ( DELIVER-4PKG ?auto_5143 ?auto_5145 ?auto_5146 ?auto_5147 ?auto_5144 )
      ( DELIVER-4PKG-VERIFY ?auto_5143 ?auto_5145 ?auto_5146 ?auto_5147 ?auto_5144 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5158 - OBJ
      ?auto_5160 - OBJ
      ?auto_5161 - OBJ
      ?auto_5162 - OBJ
      ?auto_5159 - LOCATION
    )
    :vars
    (
      ?auto_5164 - LOCATION
      ?auto_5163 - CITY
      ?auto_5166 - LOCATION
      ?auto_5167 - TRUCK
      ?auto_5165 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5160 ?auto_5158 ) ( GREATER-THAN ?auto_5161 ?auto_5158 ) ( GREATER-THAN ?auto_5161 ?auto_5160 ) ( GREATER-THAN ?auto_5162 ?auto_5158 ) ( GREATER-THAN ?auto_5162 ?auto_5160 ) ( GREATER-THAN ?auto_5162 ?auto_5161 ) ( IN-CITY ?auto_5164 ?auto_5163 ) ( IN-CITY ?auto_5159 ?auto_5163 ) ( not ( = ?auto_5159 ?auto_5164 ) ) ( OBJ-AT ?auto_5162 ?auto_5164 ) ( OBJ-AT ?auto_5158 ?auto_5159 ) ( not ( = ?auto_5158 ?auto_5160 ) ) ( not ( = ?auto_5158 ?auto_5161 ) ) ( not ( = ?auto_5158 ?auto_5162 ) ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( not ( = ?auto_5160 ?auto_5162 ) ) ( not ( = ?auto_5161 ?auto_5162 ) ) ( IN-CITY ?auto_5166 ?auto_5163 ) ( not ( = ?auto_5159 ?auto_5166 ) ) ( not ( = ?auto_5164 ?auto_5166 ) ) ( OBJ-AT ?auto_5161 ?auto_5166 ) ( TRUCK-AT ?auto_5167 ?auto_5165 ) ( IN-CITY ?auto_5165 ?auto_5163 ) ( not ( = ?auto_5159 ?auto_5165 ) ) ( not ( = ?auto_5164 ?auto_5165 ) ) ( not ( = ?auto_5166 ?auto_5165 ) ) ( OBJ-AT ?auto_5160 ?auto_5165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5160 ?auto_5167 ?auto_5165 )
      ( DELIVER-4PKG ?auto_5158 ?auto_5160 ?auto_5161 ?auto_5162 ?auto_5159 )
      ( DELIVER-4PKG-VERIFY ?auto_5158 ?auto_5160 ?auto_5161 ?auto_5162 ?auto_5159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5173 - OBJ
      ?auto_5175 - OBJ
      ?auto_5176 - OBJ
      ?auto_5177 - OBJ
      ?auto_5174 - LOCATION
    )
    :vars
    (
      ?auto_5179 - LOCATION
      ?auto_5178 - CITY
      ?auto_5182 - LOCATION
      ?auto_5180 - LOCATION
      ?auto_5181 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5175 ?auto_5173 ) ( GREATER-THAN ?auto_5176 ?auto_5173 ) ( GREATER-THAN ?auto_5176 ?auto_5175 ) ( GREATER-THAN ?auto_5177 ?auto_5173 ) ( GREATER-THAN ?auto_5177 ?auto_5175 ) ( GREATER-THAN ?auto_5177 ?auto_5176 ) ( IN-CITY ?auto_5179 ?auto_5178 ) ( IN-CITY ?auto_5174 ?auto_5178 ) ( not ( = ?auto_5174 ?auto_5179 ) ) ( OBJ-AT ?auto_5177 ?auto_5179 ) ( OBJ-AT ?auto_5173 ?auto_5174 ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5173 ?auto_5177 ) ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5177 ) ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( IN-CITY ?auto_5182 ?auto_5178 ) ( not ( = ?auto_5174 ?auto_5182 ) ) ( not ( = ?auto_5179 ?auto_5182 ) ) ( OBJ-AT ?auto_5176 ?auto_5182 ) ( IN-CITY ?auto_5180 ?auto_5178 ) ( not ( = ?auto_5174 ?auto_5180 ) ) ( not ( = ?auto_5179 ?auto_5180 ) ) ( not ( = ?auto_5182 ?auto_5180 ) ) ( OBJ-AT ?auto_5175 ?auto_5180 ) ( TRUCK-AT ?auto_5181 ?auto_5174 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5181 ?auto_5174 ?auto_5180 ?auto_5178 )
      ( DELIVER-4PKG ?auto_5173 ?auto_5175 ?auto_5176 ?auto_5177 ?auto_5174 )
      ( DELIVER-4PKG-VERIFY ?auto_5173 ?auto_5175 ?auto_5176 ?auto_5177 ?auto_5174 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5188 - OBJ
      ?auto_5190 - OBJ
      ?auto_5191 - OBJ
      ?auto_5192 - OBJ
      ?auto_5189 - LOCATION
    )
    :vars
    (
      ?auto_5194 - LOCATION
      ?auto_5193 - CITY
      ?auto_5197 - LOCATION
      ?auto_5195 - LOCATION
      ?auto_5196 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5190 ?auto_5188 ) ( GREATER-THAN ?auto_5191 ?auto_5188 ) ( GREATER-THAN ?auto_5191 ?auto_5190 ) ( GREATER-THAN ?auto_5192 ?auto_5188 ) ( GREATER-THAN ?auto_5192 ?auto_5190 ) ( GREATER-THAN ?auto_5192 ?auto_5191 ) ( IN-CITY ?auto_5194 ?auto_5193 ) ( IN-CITY ?auto_5189 ?auto_5193 ) ( not ( = ?auto_5189 ?auto_5194 ) ) ( OBJ-AT ?auto_5192 ?auto_5194 ) ( not ( = ?auto_5188 ?auto_5190 ) ) ( not ( = ?auto_5188 ?auto_5191 ) ) ( not ( = ?auto_5188 ?auto_5192 ) ) ( not ( = ?auto_5190 ?auto_5191 ) ) ( not ( = ?auto_5190 ?auto_5192 ) ) ( not ( = ?auto_5191 ?auto_5192 ) ) ( IN-CITY ?auto_5197 ?auto_5193 ) ( not ( = ?auto_5189 ?auto_5197 ) ) ( not ( = ?auto_5194 ?auto_5197 ) ) ( OBJ-AT ?auto_5191 ?auto_5197 ) ( IN-CITY ?auto_5195 ?auto_5193 ) ( not ( = ?auto_5189 ?auto_5195 ) ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5197 ?auto_5195 ) ) ( OBJ-AT ?auto_5190 ?auto_5195 ) ( TRUCK-AT ?auto_5196 ?auto_5189 ) ( IN-TRUCK ?auto_5188 ?auto_5196 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5188 ?auto_5189 )
      ( DELIVER-4PKG ?auto_5188 ?auto_5190 ?auto_5191 ?auto_5192 ?auto_5189 )
      ( DELIVER-4PKG-VERIFY ?auto_5188 ?auto_5190 ?auto_5191 ?auto_5192 ?auto_5189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5203 - OBJ
      ?auto_5205 - OBJ
      ?auto_5206 - OBJ
      ?auto_5207 - OBJ
      ?auto_5204 - LOCATION
    )
    :vars
    (
      ?auto_5210 - LOCATION
      ?auto_5209 - CITY
      ?auto_5208 - LOCATION
      ?auto_5212 - LOCATION
      ?auto_5211 - TRUCK
      ?auto_5213 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5205 ?auto_5203 ) ( GREATER-THAN ?auto_5206 ?auto_5203 ) ( GREATER-THAN ?auto_5206 ?auto_5205 ) ( GREATER-THAN ?auto_5207 ?auto_5203 ) ( GREATER-THAN ?auto_5207 ?auto_5205 ) ( GREATER-THAN ?auto_5207 ?auto_5206 ) ( IN-CITY ?auto_5210 ?auto_5209 ) ( IN-CITY ?auto_5204 ?auto_5209 ) ( not ( = ?auto_5204 ?auto_5210 ) ) ( OBJ-AT ?auto_5207 ?auto_5210 ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( not ( = ?auto_5203 ?auto_5206 ) ) ( not ( = ?auto_5203 ?auto_5207 ) ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5207 ) ) ( IN-CITY ?auto_5208 ?auto_5209 ) ( not ( = ?auto_5204 ?auto_5208 ) ) ( not ( = ?auto_5210 ?auto_5208 ) ) ( OBJ-AT ?auto_5206 ?auto_5208 ) ( IN-CITY ?auto_5212 ?auto_5209 ) ( not ( = ?auto_5204 ?auto_5212 ) ) ( not ( = ?auto_5210 ?auto_5212 ) ) ( not ( = ?auto_5208 ?auto_5212 ) ) ( OBJ-AT ?auto_5205 ?auto_5212 ) ( IN-TRUCK ?auto_5203 ?auto_5211 ) ( TRUCK-AT ?auto_5211 ?auto_5213 ) ( IN-CITY ?auto_5213 ?auto_5209 ) ( not ( = ?auto_5204 ?auto_5213 ) ) ( not ( = ?auto_5210 ?auto_5213 ) ) ( not ( = ?auto_5208 ?auto_5213 ) ) ( not ( = ?auto_5212 ?auto_5213 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5211 ?auto_5213 ?auto_5204 ?auto_5209 )
      ( DELIVER-4PKG ?auto_5203 ?auto_5205 ?auto_5206 ?auto_5207 ?auto_5204 )
      ( DELIVER-4PKG-VERIFY ?auto_5203 ?auto_5205 ?auto_5206 ?auto_5207 ?auto_5204 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5219 - OBJ
      ?auto_5221 - OBJ
      ?auto_5222 - OBJ
      ?auto_5223 - OBJ
      ?auto_5220 - LOCATION
    )
    :vars
    (
      ?auto_5229 - LOCATION
      ?auto_5226 - CITY
      ?auto_5228 - LOCATION
      ?auto_5224 - LOCATION
      ?auto_5227 - TRUCK
      ?auto_5225 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5221 ?auto_5219 ) ( GREATER-THAN ?auto_5222 ?auto_5219 ) ( GREATER-THAN ?auto_5222 ?auto_5221 ) ( GREATER-THAN ?auto_5223 ?auto_5219 ) ( GREATER-THAN ?auto_5223 ?auto_5221 ) ( GREATER-THAN ?auto_5223 ?auto_5222 ) ( IN-CITY ?auto_5229 ?auto_5226 ) ( IN-CITY ?auto_5220 ?auto_5226 ) ( not ( = ?auto_5220 ?auto_5229 ) ) ( OBJ-AT ?auto_5223 ?auto_5229 ) ( not ( = ?auto_5219 ?auto_5221 ) ) ( not ( = ?auto_5219 ?auto_5222 ) ) ( not ( = ?auto_5219 ?auto_5223 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5223 ) ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( IN-CITY ?auto_5228 ?auto_5226 ) ( not ( = ?auto_5220 ?auto_5228 ) ) ( not ( = ?auto_5229 ?auto_5228 ) ) ( OBJ-AT ?auto_5222 ?auto_5228 ) ( IN-CITY ?auto_5224 ?auto_5226 ) ( not ( = ?auto_5220 ?auto_5224 ) ) ( not ( = ?auto_5229 ?auto_5224 ) ) ( not ( = ?auto_5228 ?auto_5224 ) ) ( OBJ-AT ?auto_5221 ?auto_5224 ) ( TRUCK-AT ?auto_5227 ?auto_5225 ) ( IN-CITY ?auto_5225 ?auto_5226 ) ( not ( = ?auto_5220 ?auto_5225 ) ) ( not ( = ?auto_5229 ?auto_5225 ) ) ( not ( = ?auto_5228 ?auto_5225 ) ) ( not ( = ?auto_5224 ?auto_5225 ) ) ( OBJ-AT ?auto_5219 ?auto_5225 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5219 ?auto_5227 ?auto_5225 )
      ( DELIVER-4PKG ?auto_5219 ?auto_5221 ?auto_5222 ?auto_5223 ?auto_5220 )
      ( DELIVER-4PKG-VERIFY ?auto_5219 ?auto_5221 ?auto_5222 ?auto_5223 ?auto_5220 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5235 - OBJ
      ?auto_5237 - OBJ
      ?auto_5238 - OBJ
      ?auto_5239 - OBJ
      ?auto_5236 - LOCATION
    )
    :vars
    (
      ?auto_5245 - LOCATION
      ?auto_5242 - CITY
      ?auto_5243 - LOCATION
      ?auto_5240 - LOCATION
      ?auto_5244 - LOCATION
      ?auto_5241 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5237 ?auto_5235 ) ( GREATER-THAN ?auto_5238 ?auto_5235 ) ( GREATER-THAN ?auto_5238 ?auto_5237 ) ( GREATER-THAN ?auto_5239 ?auto_5235 ) ( GREATER-THAN ?auto_5239 ?auto_5237 ) ( GREATER-THAN ?auto_5239 ?auto_5238 ) ( IN-CITY ?auto_5245 ?auto_5242 ) ( IN-CITY ?auto_5236 ?auto_5242 ) ( not ( = ?auto_5236 ?auto_5245 ) ) ( OBJ-AT ?auto_5239 ?auto_5245 ) ( not ( = ?auto_5235 ?auto_5237 ) ) ( not ( = ?auto_5235 ?auto_5238 ) ) ( not ( = ?auto_5235 ?auto_5239 ) ) ( not ( = ?auto_5237 ?auto_5238 ) ) ( not ( = ?auto_5237 ?auto_5239 ) ) ( not ( = ?auto_5238 ?auto_5239 ) ) ( IN-CITY ?auto_5243 ?auto_5242 ) ( not ( = ?auto_5236 ?auto_5243 ) ) ( not ( = ?auto_5245 ?auto_5243 ) ) ( OBJ-AT ?auto_5238 ?auto_5243 ) ( IN-CITY ?auto_5240 ?auto_5242 ) ( not ( = ?auto_5236 ?auto_5240 ) ) ( not ( = ?auto_5245 ?auto_5240 ) ) ( not ( = ?auto_5243 ?auto_5240 ) ) ( OBJ-AT ?auto_5237 ?auto_5240 ) ( IN-CITY ?auto_5244 ?auto_5242 ) ( not ( = ?auto_5236 ?auto_5244 ) ) ( not ( = ?auto_5245 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5244 ) ) ( not ( = ?auto_5240 ?auto_5244 ) ) ( OBJ-AT ?auto_5235 ?auto_5244 ) ( TRUCK-AT ?auto_5241 ?auto_5236 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5241 ?auto_5236 ?auto_5244 ?auto_5242 )
      ( DELIVER-4PKG ?auto_5235 ?auto_5237 ?auto_5238 ?auto_5239 ?auto_5236 )
      ( DELIVER-4PKG-VERIFY ?auto_5235 ?auto_5237 ?auto_5238 ?auto_5239 ?auto_5236 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5278 - OBJ
      ?auto_5280 - OBJ
      ?auto_5281 - OBJ
      ?auto_5282 - OBJ
      ?auto_5283 - OBJ
      ?auto_5279 - LOCATION
    )
    :vars
    (
      ?auto_5284 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5280 ?auto_5278 ) ( GREATER-THAN ?auto_5281 ?auto_5278 ) ( GREATER-THAN ?auto_5281 ?auto_5280 ) ( GREATER-THAN ?auto_5282 ?auto_5278 ) ( GREATER-THAN ?auto_5282 ?auto_5280 ) ( GREATER-THAN ?auto_5282 ?auto_5281 ) ( GREATER-THAN ?auto_5283 ?auto_5278 ) ( GREATER-THAN ?auto_5283 ?auto_5280 ) ( GREATER-THAN ?auto_5283 ?auto_5281 ) ( GREATER-THAN ?auto_5283 ?auto_5282 ) ( TRUCK-AT ?auto_5284 ?auto_5279 ) ( IN-TRUCK ?auto_5283 ?auto_5284 ) ( OBJ-AT ?auto_5278 ?auto_5279 ) ( OBJ-AT ?auto_5280 ?auto_5279 ) ( OBJ-AT ?auto_5281 ?auto_5279 ) ( OBJ-AT ?auto_5282 ?auto_5279 ) ( not ( = ?auto_5278 ?auto_5280 ) ) ( not ( = ?auto_5278 ?auto_5281 ) ) ( not ( = ?auto_5278 ?auto_5282 ) ) ( not ( = ?auto_5278 ?auto_5283 ) ) ( not ( = ?auto_5280 ?auto_5281 ) ) ( not ( = ?auto_5280 ?auto_5282 ) ) ( not ( = ?auto_5280 ?auto_5283 ) ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5281 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5283 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5283 ?auto_5279 )
      ( DELIVER-5PKG-VERIFY ?auto_5278 ?auto_5280 ?auto_5281 ?auto_5282 ?auto_5283 ?auto_5279 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5291 - OBJ
      ?auto_5293 - OBJ
      ?auto_5294 - OBJ
      ?auto_5295 - OBJ
      ?auto_5296 - OBJ
      ?auto_5292 - LOCATION
    )
    :vars
    (
      ?auto_5299 - TRUCK
      ?auto_5297 - LOCATION
      ?auto_5298 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5293 ?auto_5291 ) ( GREATER-THAN ?auto_5294 ?auto_5291 ) ( GREATER-THAN ?auto_5294 ?auto_5293 ) ( GREATER-THAN ?auto_5295 ?auto_5291 ) ( GREATER-THAN ?auto_5295 ?auto_5293 ) ( GREATER-THAN ?auto_5295 ?auto_5294 ) ( GREATER-THAN ?auto_5296 ?auto_5291 ) ( GREATER-THAN ?auto_5296 ?auto_5293 ) ( GREATER-THAN ?auto_5296 ?auto_5294 ) ( GREATER-THAN ?auto_5296 ?auto_5295 ) ( IN-TRUCK ?auto_5296 ?auto_5299 ) ( TRUCK-AT ?auto_5299 ?auto_5297 ) ( IN-CITY ?auto_5297 ?auto_5298 ) ( IN-CITY ?auto_5292 ?auto_5298 ) ( not ( = ?auto_5292 ?auto_5297 ) ) ( OBJ-AT ?auto_5291 ?auto_5292 ) ( OBJ-AT ?auto_5293 ?auto_5292 ) ( OBJ-AT ?auto_5294 ?auto_5292 ) ( OBJ-AT ?auto_5295 ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5293 ) ) ( not ( = ?auto_5291 ?auto_5294 ) ) ( not ( = ?auto_5291 ?auto_5295 ) ) ( not ( = ?auto_5291 ?auto_5296 ) ) ( not ( = ?auto_5293 ?auto_5294 ) ) ( not ( = ?auto_5293 ?auto_5295 ) ) ( not ( = ?auto_5293 ?auto_5296 ) ) ( not ( = ?auto_5294 ?auto_5295 ) ) ( not ( = ?auto_5294 ?auto_5296 ) ) ( not ( = ?auto_5295 ?auto_5296 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5296 ?auto_5292 )
      ( DELIVER-5PKG-VERIFY ?auto_5291 ?auto_5293 ?auto_5294 ?auto_5295 ?auto_5296 ?auto_5292 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5306 - OBJ
      ?auto_5308 - OBJ
      ?auto_5309 - OBJ
      ?auto_5310 - OBJ
      ?auto_5311 - OBJ
      ?auto_5307 - LOCATION
    )
    :vars
    (
      ?auto_5312 - TRUCK
      ?auto_5314 - LOCATION
      ?auto_5313 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5308 ?auto_5306 ) ( GREATER-THAN ?auto_5309 ?auto_5306 ) ( GREATER-THAN ?auto_5309 ?auto_5308 ) ( GREATER-THAN ?auto_5310 ?auto_5306 ) ( GREATER-THAN ?auto_5310 ?auto_5308 ) ( GREATER-THAN ?auto_5310 ?auto_5309 ) ( GREATER-THAN ?auto_5311 ?auto_5306 ) ( GREATER-THAN ?auto_5311 ?auto_5308 ) ( GREATER-THAN ?auto_5311 ?auto_5309 ) ( GREATER-THAN ?auto_5311 ?auto_5310 ) ( TRUCK-AT ?auto_5312 ?auto_5314 ) ( IN-CITY ?auto_5314 ?auto_5313 ) ( IN-CITY ?auto_5307 ?auto_5313 ) ( not ( = ?auto_5307 ?auto_5314 ) ) ( OBJ-AT ?auto_5311 ?auto_5314 ) ( OBJ-AT ?auto_5306 ?auto_5307 ) ( OBJ-AT ?auto_5308 ?auto_5307 ) ( OBJ-AT ?auto_5309 ?auto_5307 ) ( OBJ-AT ?auto_5310 ?auto_5307 ) ( not ( = ?auto_5306 ?auto_5308 ) ) ( not ( = ?auto_5306 ?auto_5309 ) ) ( not ( = ?auto_5306 ?auto_5310 ) ) ( not ( = ?auto_5306 ?auto_5311 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5311 ) ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5311 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5311 ?auto_5307 )
      ( DELIVER-5PKG-VERIFY ?auto_5306 ?auto_5308 ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5307 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5321 - OBJ
      ?auto_5323 - OBJ
      ?auto_5324 - OBJ
      ?auto_5325 - OBJ
      ?auto_5326 - OBJ
      ?auto_5322 - LOCATION
    )
    :vars
    (
      ?auto_5329 - LOCATION
      ?auto_5328 - CITY
      ?auto_5327 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5323 ?auto_5321 ) ( GREATER-THAN ?auto_5324 ?auto_5321 ) ( GREATER-THAN ?auto_5324 ?auto_5323 ) ( GREATER-THAN ?auto_5325 ?auto_5321 ) ( GREATER-THAN ?auto_5325 ?auto_5323 ) ( GREATER-THAN ?auto_5325 ?auto_5324 ) ( GREATER-THAN ?auto_5326 ?auto_5321 ) ( GREATER-THAN ?auto_5326 ?auto_5323 ) ( GREATER-THAN ?auto_5326 ?auto_5324 ) ( GREATER-THAN ?auto_5326 ?auto_5325 ) ( IN-CITY ?auto_5329 ?auto_5328 ) ( IN-CITY ?auto_5322 ?auto_5328 ) ( not ( = ?auto_5322 ?auto_5329 ) ) ( OBJ-AT ?auto_5326 ?auto_5329 ) ( TRUCK-AT ?auto_5327 ?auto_5322 ) ( OBJ-AT ?auto_5321 ?auto_5322 ) ( OBJ-AT ?auto_5323 ?auto_5322 ) ( OBJ-AT ?auto_5324 ?auto_5322 ) ( OBJ-AT ?auto_5325 ?auto_5322 ) ( not ( = ?auto_5321 ?auto_5323 ) ) ( not ( = ?auto_5321 ?auto_5324 ) ) ( not ( = ?auto_5321 ?auto_5325 ) ) ( not ( = ?auto_5321 ?auto_5326 ) ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5325 ) ) ( not ( = ?auto_5323 ?auto_5326 ) ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5324 ?auto_5326 ) ) ( not ( = ?auto_5325 ?auto_5326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5326 ?auto_5322 )
      ( DELIVER-5PKG-VERIFY ?auto_5321 ?auto_5323 ?auto_5324 ?auto_5325 ?auto_5326 ?auto_5322 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5336 - OBJ
      ?auto_5338 - OBJ
      ?auto_5339 - OBJ
      ?auto_5340 - OBJ
      ?auto_5341 - OBJ
      ?auto_5337 - LOCATION
    )
    :vars
    (
      ?auto_5342 - LOCATION
      ?auto_5343 - CITY
      ?auto_5344 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5338 ?auto_5336 ) ( GREATER-THAN ?auto_5339 ?auto_5336 ) ( GREATER-THAN ?auto_5339 ?auto_5338 ) ( GREATER-THAN ?auto_5340 ?auto_5336 ) ( GREATER-THAN ?auto_5340 ?auto_5338 ) ( GREATER-THAN ?auto_5340 ?auto_5339 ) ( GREATER-THAN ?auto_5341 ?auto_5336 ) ( GREATER-THAN ?auto_5341 ?auto_5338 ) ( GREATER-THAN ?auto_5341 ?auto_5339 ) ( GREATER-THAN ?auto_5341 ?auto_5340 ) ( IN-CITY ?auto_5342 ?auto_5343 ) ( IN-CITY ?auto_5337 ?auto_5343 ) ( not ( = ?auto_5337 ?auto_5342 ) ) ( OBJ-AT ?auto_5341 ?auto_5342 ) ( TRUCK-AT ?auto_5344 ?auto_5337 ) ( OBJ-AT ?auto_5336 ?auto_5337 ) ( OBJ-AT ?auto_5338 ?auto_5337 ) ( OBJ-AT ?auto_5339 ?auto_5337 ) ( not ( = ?auto_5336 ?auto_5338 ) ) ( not ( = ?auto_5336 ?auto_5339 ) ) ( not ( = ?auto_5336 ?auto_5340 ) ) ( not ( = ?auto_5336 ?auto_5341 ) ) ( not ( = ?auto_5338 ?auto_5339 ) ) ( not ( = ?auto_5338 ?auto_5340 ) ) ( not ( = ?auto_5338 ?auto_5341 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5339 ?auto_5341 ) ) ( not ( = ?auto_5340 ?auto_5341 ) ) ( IN-TRUCK ?auto_5340 ?auto_5344 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5340 ?auto_5337 )
      ( DELIVER-5PKG ?auto_5336 ?auto_5338 ?auto_5339 ?auto_5340 ?auto_5341 ?auto_5337 )
      ( DELIVER-5PKG-VERIFY ?auto_5336 ?auto_5338 ?auto_5339 ?auto_5340 ?auto_5341 ?auto_5337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5351 - OBJ
      ?auto_5353 - OBJ
      ?auto_5354 - OBJ
      ?auto_5355 - OBJ
      ?auto_5356 - OBJ
      ?auto_5352 - LOCATION
    )
    :vars
    (
      ?auto_5357 - LOCATION
      ?auto_5358 - CITY
      ?auto_5359 - TRUCK
      ?auto_5360 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5353 ?auto_5351 ) ( GREATER-THAN ?auto_5354 ?auto_5351 ) ( GREATER-THAN ?auto_5354 ?auto_5353 ) ( GREATER-THAN ?auto_5355 ?auto_5351 ) ( GREATER-THAN ?auto_5355 ?auto_5353 ) ( GREATER-THAN ?auto_5355 ?auto_5354 ) ( GREATER-THAN ?auto_5356 ?auto_5351 ) ( GREATER-THAN ?auto_5356 ?auto_5353 ) ( GREATER-THAN ?auto_5356 ?auto_5354 ) ( GREATER-THAN ?auto_5356 ?auto_5355 ) ( IN-CITY ?auto_5357 ?auto_5358 ) ( IN-CITY ?auto_5352 ?auto_5358 ) ( not ( = ?auto_5352 ?auto_5357 ) ) ( OBJ-AT ?auto_5356 ?auto_5357 ) ( OBJ-AT ?auto_5351 ?auto_5352 ) ( OBJ-AT ?auto_5353 ?auto_5352 ) ( OBJ-AT ?auto_5354 ?auto_5352 ) ( not ( = ?auto_5351 ?auto_5353 ) ) ( not ( = ?auto_5351 ?auto_5354 ) ) ( not ( = ?auto_5351 ?auto_5355 ) ) ( not ( = ?auto_5351 ?auto_5356 ) ) ( not ( = ?auto_5353 ?auto_5354 ) ) ( not ( = ?auto_5353 ?auto_5355 ) ) ( not ( = ?auto_5353 ?auto_5356 ) ) ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( IN-TRUCK ?auto_5355 ?auto_5359 ) ( TRUCK-AT ?auto_5359 ?auto_5360 ) ( IN-CITY ?auto_5360 ?auto_5358 ) ( not ( = ?auto_5352 ?auto_5360 ) ) ( not ( = ?auto_5357 ?auto_5360 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5359 ?auto_5360 ?auto_5352 ?auto_5358 )
      ( DELIVER-5PKG ?auto_5351 ?auto_5353 ?auto_5354 ?auto_5355 ?auto_5356 ?auto_5352 )
      ( DELIVER-5PKG-VERIFY ?auto_5351 ?auto_5353 ?auto_5354 ?auto_5355 ?auto_5356 ?auto_5352 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5367 - OBJ
      ?auto_5369 - OBJ
      ?auto_5370 - OBJ
      ?auto_5371 - OBJ
      ?auto_5372 - OBJ
      ?auto_5368 - LOCATION
    )
    :vars
    (
      ?auto_5375 - LOCATION
      ?auto_5376 - CITY
      ?auto_5373 - TRUCK
      ?auto_5374 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5369 ?auto_5367 ) ( GREATER-THAN ?auto_5370 ?auto_5367 ) ( GREATER-THAN ?auto_5370 ?auto_5369 ) ( GREATER-THAN ?auto_5371 ?auto_5367 ) ( GREATER-THAN ?auto_5371 ?auto_5369 ) ( GREATER-THAN ?auto_5371 ?auto_5370 ) ( GREATER-THAN ?auto_5372 ?auto_5367 ) ( GREATER-THAN ?auto_5372 ?auto_5369 ) ( GREATER-THAN ?auto_5372 ?auto_5370 ) ( GREATER-THAN ?auto_5372 ?auto_5371 ) ( IN-CITY ?auto_5375 ?auto_5376 ) ( IN-CITY ?auto_5368 ?auto_5376 ) ( not ( = ?auto_5368 ?auto_5375 ) ) ( OBJ-AT ?auto_5372 ?auto_5375 ) ( OBJ-AT ?auto_5367 ?auto_5368 ) ( OBJ-AT ?auto_5369 ?auto_5368 ) ( OBJ-AT ?auto_5370 ?auto_5368 ) ( not ( = ?auto_5367 ?auto_5369 ) ) ( not ( = ?auto_5367 ?auto_5370 ) ) ( not ( = ?auto_5367 ?auto_5371 ) ) ( not ( = ?auto_5367 ?auto_5372 ) ) ( not ( = ?auto_5369 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5371 ) ) ( not ( = ?auto_5369 ?auto_5372 ) ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5370 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( TRUCK-AT ?auto_5373 ?auto_5374 ) ( IN-CITY ?auto_5374 ?auto_5376 ) ( not ( = ?auto_5368 ?auto_5374 ) ) ( not ( = ?auto_5375 ?auto_5374 ) ) ( OBJ-AT ?auto_5371 ?auto_5374 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5371 ?auto_5373 ?auto_5374 )
      ( DELIVER-5PKG ?auto_5367 ?auto_5369 ?auto_5370 ?auto_5371 ?auto_5372 ?auto_5368 )
      ( DELIVER-5PKG-VERIFY ?auto_5367 ?auto_5369 ?auto_5370 ?auto_5371 ?auto_5372 ?auto_5368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5383 - OBJ
      ?auto_5385 - OBJ
      ?auto_5386 - OBJ
      ?auto_5387 - OBJ
      ?auto_5388 - OBJ
      ?auto_5384 - LOCATION
    )
    :vars
    (
      ?auto_5391 - LOCATION
      ?auto_5392 - CITY
      ?auto_5390 - LOCATION
      ?auto_5389 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5385 ?auto_5383 ) ( GREATER-THAN ?auto_5386 ?auto_5383 ) ( GREATER-THAN ?auto_5386 ?auto_5385 ) ( GREATER-THAN ?auto_5387 ?auto_5383 ) ( GREATER-THAN ?auto_5387 ?auto_5385 ) ( GREATER-THAN ?auto_5387 ?auto_5386 ) ( GREATER-THAN ?auto_5388 ?auto_5383 ) ( GREATER-THAN ?auto_5388 ?auto_5385 ) ( GREATER-THAN ?auto_5388 ?auto_5386 ) ( GREATER-THAN ?auto_5388 ?auto_5387 ) ( IN-CITY ?auto_5391 ?auto_5392 ) ( IN-CITY ?auto_5384 ?auto_5392 ) ( not ( = ?auto_5384 ?auto_5391 ) ) ( OBJ-AT ?auto_5388 ?auto_5391 ) ( OBJ-AT ?auto_5383 ?auto_5384 ) ( OBJ-AT ?auto_5385 ?auto_5384 ) ( OBJ-AT ?auto_5386 ?auto_5384 ) ( not ( = ?auto_5383 ?auto_5385 ) ) ( not ( = ?auto_5383 ?auto_5386 ) ) ( not ( = ?auto_5383 ?auto_5387 ) ) ( not ( = ?auto_5383 ?auto_5388 ) ) ( not ( = ?auto_5385 ?auto_5386 ) ) ( not ( = ?auto_5385 ?auto_5387 ) ) ( not ( = ?auto_5385 ?auto_5388 ) ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( IN-CITY ?auto_5390 ?auto_5392 ) ( not ( = ?auto_5384 ?auto_5390 ) ) ( not ( = ?auto_5391 ?auto_5390 ) ) ( OBJ-AT ?auto_5387 ?auto_5390 ) ( TRUCK-AT ?auto_5389 ?auto_5384 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5389 ?auto_5384 ?auto_5390 ?auto_5392 )
      ( DELIVER-5PKG ?auto_5383 ?auto_5385 ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5384 )
      ( DELIVER-5PKG-VERIFY ?auto_5383 ?auto_5385 ?auto_5386 ?auto_5387 ?auto_5388 ?auto_5384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5399 - OBJ
      ?auto_5401 - OBJ
      ?auto_5402 - OBJ
      ?auto_5403 - OBJ
      ?auto_5404 - OBJ
      ?auto_5400 - LOCATION
    )
    :vars
    (
      ?auto_5406 - LOCATION
      ?auto_5407 - CITY
      ?auto_5408 - LOCATION
      ?auto_5405 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5401 ?auto_5399 ) ( GREATER-THAN ?auto_5402 ?auto_5399 ) ( GREATER-THAN ?auto_5402 ?auto_5401 ) ( GREATER-THAN ?auto_5403 ?auto_5399 ) ( GREATER-THAN ?auto_5403 ?auto_5401 ) ( GREATER-THAN ?auto_5403 ?auto_5402 ) ( GREATER-THAN ?auto_5404 ?auto_5399 ) ( GREATER-THAN ?auto_5404 ?auto_5401 ) ( GREATER-THAN ?auto_5404 ?auto_5402 ) ( GREATER-THAN ?auto_5404 ?auto_5403 ) ( IN-CITY ?auto_5406 ?auto_5407 ) ( IN-CITY ?auto_5400 ?auto_5407 ) ( not ( = ?auto_5400 ?auto_5406 ) ) ( OBJ-AT ?auto_5404 ?auto_5406 ) ( OBJ-AT ?auto_5399 ?auto_5400 ) ( OBJ-AT ?auto_5401 ?auto_5400 ) ( not ( = ?auto_5399 ?auto_5401 ) ) ( not ( = ?auto_5399 ?auto_5402 ) ) ( not ( = ?auto_5399 ?auto_5403 ) ) ( not ( = ?auto_5399 ?auto_5404 ) ) ( not ( = ?auto_5401 ?auto_5402 ) ) ( not ( = ?auto_5401 ?auto_5403 ) ) ( not ( = ?auto_5401 ?auto_5404 ) ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5404 ) ) ( not ( = ?auto_5403 ?auto_5404 ) ) ( IN-CITY ?auto_5408 ?auto_5407 ) ( not ( = ?auto_5400 ?auto_5408 ) ) ( not ( = ?auto_5406 ?auto_5408 ) ) ( OBJ-AT ?auto_5403 ?auto_5408 ) ( TRUCK-AT ?auto_5405 ?auto_5400 ) ( IN-TRUCK ?auto_5402 ?auto_5405 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5402 ?auto_5400 )
      ( DELIVER-5PKG ?auto_5399 ?auto_5401 ?auto_5402 ?auto_5403 ?auto_5404 ?auto_5400 )
      ( DELIVER-5PKG-VERIFY ?auto_5399 ?auto_5401 ?auto_5402 ?auto_5403 ?auto_5404 ?auto_5400 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5415 - OBJ
      ?auto_5417 - OBJ
      ?auto_5418 - OBJ
      ?auto_5419 - OBJ
      ?auto_5420 - OBJ
      ?auto_5416 - LOCATION
    )
    :vars
    (
      ?auto_5422 - LOCATION
      ?auto_5421 - CITY
      ?auto_5423 - LOCATION
      ?auto_5424 - TRUCK
      ?auto_5425 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5417 ?auto_5415 ) ( GREATER-THAN ?auto_5418 ?auto_5415 ) ( GREATER-THAN ?auto_5418 ?auto_5417 ) ( GREATER-THAN ?auto_5419 ?auto_5415 ) ( GREATER-THAN ?auto_5419 ?auto_5417 ) ( GREATER-THAN ?auto_5419 ?auto_5418 ) ( GREATER-THAN ?auto_5420 ?auto_5415 ) ( GREATER-THAN ?auto_5420 ?auto_5417 ) ( GREATER-THAN ?auto_5420 ?auto_5418 ) ( GREATER-THAN ?auto_5420 ?auto_5419 ) ( IN-CITY ?auto_5422 ?auto_5421 ) ( IN-CITY ?auto_5416 ?auto_5421 ) ( not ( = ?auto_5416 ?auto_5422 ) ) ( OBJ-AT ?auto_5420 ?auto_5422 ) ( OBJ-AT ?auto_5415 ?auto_5416 ) ( OBJ-AT ?auto_5417 ?auto_5416 ) ( not ( = ?auto_5415 ?auto_5417 ) ) ( not ( = ?auto_5415 ?auto_5418 ) ) ( not ( = ?auto_5415 ?auto_5419 ) ) ( not ( = ?auto_5415 ?auto_5420 ) ) ( not ( = ?auto_5417 ?auto_5418 ) ) ( not ( = ?auto_5417 ?auto_5419 ) ) ( not ( = ?auto_5417 ?auto_5420 ) ) ( not ( = ?auto_5418 ?auto_5419 ) ) ( not ( = ?auto_5418 ?auto_5420 ) ) ( not ( = ?auto_5419 ?auto_5420 ) ) ( IN-CITY ?auto_5423 ?auto_5421 ) ( not ( = ?auto_5416 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( OBJ-AT ?auto_5419 ?auto_5423 ) ( IN-TRUCK ?auto_5418 ?auto_5424 ) ( TRUCK-AT ?auto_5424 ?auto_5425 ) ( IN-CITY ?auto_5425 ?auto_5421 ) ( not ( = ?auto_5416 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5424 ?auto_5425 ?auto_5416 ?auto_5421 )
      ( DELIVER-5PKG ?auto_5415 ?auto_5417 ?auto_5418 ?auto_5419 ?auto_5420 ?auto_5416 )
      ( DELIVER-5PKG-VERIFY ?auto_5415 ?auto_5417 ?auto_5418 ?auto_5419 ?auto_5420 ?auto_5416 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5432 - OBJ
      ?auto_5434 - OBJ
      ?auto_5435 - OBJ
      ?auto_5436 - OBJ
      ?auto_5437 - OBJ
      ?auto_5433 - LOCATION
    )
    :vars
    (
      ?auto_5442 - LOCATION
      ?auto_5441 - CITY
      ?auto_5439 - LOCATION
      ?auto_5438 - TRUCK
      ?auto_5440 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5434 ?auto_5432 ) ( GREATER-THAN ?auto_5435 ?auto_5432 ) ( GREATER-THAN ?auto_5435 ?auto_5434 ) ( GREATER-THAN ?auto_5436 ?auto_5432 ) ( GREATER-THAN ?auto_5436 ?auto_5434 ) ( GREATER-THAN ?auto_5436 ?auto_5435 ) ( GREATER-THAN ?auto_5437 ?auto_5432 ) ( GREATER-THAN ?auto_5437 ?auto_5434 ) ( GREATER-THAN ?auto_5437 ?auto_5435 ) ( GREATER-THAN ?auto_5437 ?auto_5436 ) ( IN-CITY ?auto_5442 ?auto_5441 ) ( IN-CITY ?auto_5433 ?auto_5441 ) ( not ( = ?auto_5433 ?auto_5442 ) ) ( OBJ-AT ?auto_5437 ?auto_5442 ) ( OBJ-AT ?auto_5432 ?auto_5433 ) ( OBJ-AT ?auto_5434 ?auto_5433 ) ( not ( = ?auto_5432 ?auto_5434 ) ) ( not ( = ?auto_5432 ?auto_5435 ) ) ( not ( = ?auto_5432 ?auto_5436 ) ) ( not ( = ?auto_5432 ?auto_5437 ) ) ( not ( = ?auto_5434 ?auto_5435 ) ) ( not ( = ?auto_5434 ?auto_5436 ) ) ( not ( = ?auto_5434 ?auto_5437 ) ) ( not ( = ?auto_5435 ?auto_5436 ) ) ( not ( = ?auto_5435 ?auto_5437 ) ) ( not ( = ?auto_5436 ?auto_5437 ) ) ( IN-CITY ?auto_5439 ?auto_5441 ) ( not ( = ?auto_5433 ?auto_5439 ) ) ( not ( = ?auto_5442 ?auto_5439 ) ) ( OBJ-AT ?auto_5436 ?auto_5439 ) ( TRUCK-AT ?auto_5438 ?auto_5440 ) ( IN-CITY ?auto_5440 ?auto_5441 ) ( not ( = ?auto_5433 ?auto_5440 ) ) ( not ( = ?auto_5442 ?auto_5440 ) ) ( not ( = ?auto_5439 ?auto_5440 ) ) ( OBJ-AT ?auto_5435 ?auto_5440 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5435 ?auto_5438 ?auto_5440 )
      ( DELIVER-5PKG ?auto_5432 ?auto_5434 ?auto_5435 ?auto_5436 ?auto_5437 ?auto_5433 )
      ( DELIVER-5PKG-VERIFY ?auto_5432 ?auto_5434 ?auto_5435 ?auto_5436 ?auto_5437 ?auto_5433 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5449 - OBJ
      ?auto_5451 - OBJ
      ?auto_5452 - OBJ
      ?auto_5453 - OBJ
      ?auto_5454 - OBJ
      ?auto_5450 - LOCATION
    )
    :vars
    (
      ?auto_5455 - LOCATION
      ?auto_5456 - CITY
      ?auto_5458 - LOCATION
      ?auto_5457 - LOCATION
      ?auto_5459 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5451 ?auto_5449 ) ( GREATER-THAN ?auto_5452 ?auto_5449 ) ( GREATER-THAN ?auto_5452 ?auto_5451 ) ( GREATER-THAN ?auto_5453 ?auto_5449 ) ( GREATER-THAN ?auto_5453 ?auto_5451 ) ( GREATER-THAN ?auto_5453 ?auto_5452 ) ( GREATER-THAN ?auto_5454 ?auto_5449 ) ( GREATER-THAN ?auto_5454 ?auto_5451 ) ( GREATER-THAN ?auto_5454 ?auto_5452 ) ( GREATER-THAN ?auto_5454 ?auto_5453 ) ( IN-CITY ?auto_5455 ?auto_5456 ) ( IN-CITY ?auto_5450 ?auto_5456 ) ( not ( = ?auto_5450 ?auto_5455 ) ) ( OBJ-AT ?auto_5454 ?auto_5455 ) ( OBJ-AT ?auto_5449 ?auto_5450 ) ( OBJ-AT ?auto_5451 ?auto_5450 ) ( not ( = ?auto_5449 ?auto_5451 ) ) ( not ( = ?auto_5449 ?auto_5452 ) ) ( not ( = ?auto_5449 ?auto_5453 ) ) ( not ( = ?auto_5449 ?auto_5454 ) ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( not ( = ?auto_5451 ?auto_5453 ) ) ( not ( = ?auto_5451 ?auto_5454 ) ) ( not ( = ?auto_5452 ?auto_5453 ) ) ( not ( = ?auto_5452 ?auto_5454 ) ) ( not ( = ?auto_5453 ?auto_5454 ) ) ( IN-CITY ?auto_5458 ?auto_5456 ) ( not ( = ?auto_5450 ?auto_5458 ) ) ( not ( = ?auto_5455 ?auto_5458 ) ) ( OBJ-AT ?auto_5453 ?auto_5458 ) ( IN-CITY ?auto_5457 ?auto_5456 ) ( not ( = ?auto_5450 ?auto_5457 ) ) ( not ( = ?auto_5455 ?auto_5457 ) ) ( not ( = ?auto_5458 ?auto_5457 ) ) ( OBJ-AT ?auto_5452 ?auto_5457 ) ( TRUCK-AT ?auto_5459 ?auto_5450 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5459 ?auto_5450 ?auto_5457 ?auto_5456 )
      ( DELIVER-5PKG ?auto_5449 ?auto_5451 ?auto_5452 ?auto_5453 ?auto_5454 ?auto_5450 )
      ( DELIVER-5PKG-VERIFY ?auto_5449 ?auto_5451 ?auto_5452 ?auto_5453 ?auto_5454 ?auto_5450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5466 - OBJ
      ?auto_5468 - OBJ
      ?auto_5469 - OBJ
      ?auto_5470 - OBJ
      ?auto_5471 - OBJ
      ?auto_5467 - LOCATION
    )
    :vars
    (
      ?auto_5474 - LOCATION
      ?auto_5473 - CITY
      ?auto_5476 - LOCATION
      ?auto_5472 - LOCATION
      ?auto_5475 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5468 ?auto_5466 ) ( GREATER-THAN ?auto_5469 ?auto_5466 ) ( GREATER-THAN ?auto_5469 ?auto_5468 ) ( GREATER-THAN ?auto_5470 ?auto_5466 ) ( GREATER-THAN ?auto_5470 ?auto_5468 ) ( GREATER-THAN ?auto_5470 ?auto_5469 ) ( GREATER-THAN ?auto_5471 ?auto_5466 ) ( GREATER-THAN ?auto_5471 ?auto_5468 ) ( GREATER-THAN ?auto_5471 ?auto_5469 ) ( GREATER-THAN ?auto_5471 ?auto_5470 ) ( IN-CITY ?auto_5474 ?auto_5473 ) ( IN-CITY ?auto_5467 ?auto_5473 ) ( not ( = ?auto_5467 ?auto_5474 ) ) ( OBJ-AT ?auto_5471 ?auto_5474 ) ( OBJ-AT ?auto_5466 ?auto_5467 ) ( not ( = ?auto_5466 ?auto_5468 ) ) ( not ( = ?auto_5466 ?auto_5469 ) ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( not ( = ?auto_5466 ?auto_5471 ) ) ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5468 ?auto_5470 ) ) ( not ( = ?auto_5468 ?auto_5471 ) ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( not ( = ?auto_5469 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( IN-CITY ?auto_5476 ?auto_5473 ) ( not ( = ?auto_5467 ?auto_5476 ) ) ( not ( = ?auto_5474 ?auto_5476 ) ) ( OBJ-AT ?auto_5470 ?auto_5476 ) ( IN-CITY ?auto_5472 ?auto_5473 ) ( not ( = ?auto_5467 ?auto_5472 ) ) ( not ( = ?auto_5474 ?auto_5472 ) ) ( not ( = ?auto_5476 ?auto_5472 ) ) ( OBJ-AT ?auto_5469 ?auto_5472 ) ( TRUCK-AT ?auto_5475 ?auto_5467 ) ( IN-TRUCK ?auto_5468 ?auto_5475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5468 ?auto_5467 )
      ( DELIVER-5PKG ?auto_5466 ?auto_5468 ?auto_5469 ?auto_5470 ?auto_5471 ?auto_5467 )
      ( DELIVER-5PKG-VERIFY ?auto_5466 ?auto_5468 ?auto_5469 ?auto_5470 ?auto_5471 ?auto_5467 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5483 - OBJ
      ?auto_5485 - OBJ
      ?auto_5486 - OBJ
      ?auto_5487 - OBJ
      ?auto_5488 - OBJ
      ?auto_5484 - LOCATION
    )
    :vars
    (
      ?auto_5489 - LOCATION
      ?auto_5492 - CITY
      ?auto_5490 - LOCATION
      ?auto_5493 - LOCATION
      ?auto_5491 - TRUCK
      ?auto_5494 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5485 ?auto_5483 ) ( GREATER-THAN ?auto_5486 ?auto_5483 ) ( GREATER-THAN ?auto_5486 ?auto_5485 ) ( GREATER-THAN ?auto_5487 ?auto_5483 ) ( GREATER-THAN ?auto_5487 ?auto_5485 ) ( GREATER-THAN ?auto_5487 ?auto_5486 ) ( GREATER-THAN ?auto_5488 ?auto_5483 ) ( GREATER-THAN ?auto_5488 ?auto_5485 ) ( GREATER-THAN ?auto_5488 ?auto_5486 ) ( GREATER-THAN ?auto_5488 ?auto_5487 ) ( IN-CITY ?auto_5489 ?auto_5492 ) ( IN-CITY ?auto_5484 ?auto_5492 ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( OBJ-AT ?auto_5488 ?auto_5489 ) ( OBJ-AT ?auto_5483 ?auto_5484 ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( not ( = ?auto_5483 ?auto_5486 ) ) ( not ( = ?auto_5483 ?auto_5487 ) ) ( not ( = ?auto_5483 ?auto_5488 ) ) ( not ( = ?auto_5485 ?auto_5486 ) ) ( not ( = ?auto_5485 ?auto_5487 ) ) ( not ( = ?auto_5485 ?auto_5488 ) ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5488 ) ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( IN-CITY ?auto_5490 ?auto_5492 ) ( not ( = ?auto_5484 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5490 ) ) ( OBJ-AT ?auto_5487 ?auto_5490 ) ( IN-CITY ?auto_5493 ?auto_5492 ) ( not ( = ?auto_5484 ?auto_5493 ) ) ( not ( = ?auto_5489 ?auto_5493 ) ) ( not ( = ?auto_5490 ?auto_5493 ) ) ( OBJ-AT ?auto_5486 ?auto_5493 ) ( IN-TRUCK ?auto_5485 ?auto_5491 ) ( TRUCK-AT ?auto_5491 ?auto_5494 ) ( IN-CITY ?auto_5494 ?auto_5492 ) ( not ( = ?auto_5484 ?auto_5494 ) ) ( not ( = ?auto_5489 ?auto_5494 ) ) ( not ( = ?auto_5490 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5494 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5491 ?auto_5494 ?auto_5484 ?auto_5492 )
      ( DELIVER-5PKG ?auto_5483 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 ?auto_5484 )
      ( DELIVER-5PKG-VERIFY ?auto_5483 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 ?auto_5484 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5501 - OBJ
      ?auto_5503 - OBJ
      ?auto_5504 - OBJ
      ?auto_5505 - OBJ
      ?auto_5506 - OBJ
      ?auto_5502 - LOCATION
    )
    :vars
    (
      ?auto_5508 - LOCATION
      ?auto_5512 - CITY
      ?auto_5511 - LOCATION
      ?auto_5507 - LOCATION
      ?auto_5510 - TRUCK
      ?auto_5509 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5503 ?auto_5501 ) ( GREATER-THAN ?auto_5504 ?auto_5501 ) ( GREATER-THAN ?auto_5504 ?auto_5503 ) ( GREATER-THAN ?auto_5505 ?auto_5501 ) ( GREATER-THAN ?auto_5505 ?auto_5503 ) ( GREATER-THAN ?auto_5505 ?auto_5504 ) ( GREATER-THAN ?auto_5506 ?auto_5501 ) ( GREATER-THAN ?auto_5506 ?auto_5503 ) ( GREATER-THAN ?auto_5506 ?auto_5504 ) ( GREATER-THAN ?auto_5506 ?auto_5505 ) ( IN-CITY ?auto_5508 ?auto_5512 ) ( IN-CITY ?auto_5502 ?auto_5512 ) ( not ( = ?auto_5502 ?auto_5508 ) ) ( OBJ-AT ?auto_5506 ?auto_5508 ) ( OBJ-AT ?auto_5501 ?auto_5502 ) ( not ( = ?auto_5501 ?auto_5503 ) ) ( not ( = ?auto_5501 ?auto_5504 ) ) ( not ( = ?auto_5501 ?auto_5505 ) ) ( not ( = ?auto_5501 ?auto_5506 ) ) ( not ( = ?auto_5503 ?auto_5504 ) ) ( not ( = ?auto_5503 ?auto_5505 ) ) ( not ( = ?auto_5503 ?auto_5506 ) ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( IN-CITY ?auto_5511 ?auto_5512 ) ( not ( = ?auto_5502 ?auto_5511 ) ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( OBJ-AT ?auto_5505 ?auto_5511 ) ( IN-CITY ?auto_5507 ?auto_5512 ) ( not ( = ?auto_5502 ?auto_5507 ) ) ( not ( = ?auto_5508 ?auto_5507 ) ) ( not ( = ?auto_5511 ?auto_5507 ) ) ( OBJ-AT ?auto_5504 ?auto_5507 ) ( TRUCK-AT ?auto_5510 ?auto_5509 ) ( IN-CITY ?auto_5509 ?auto_5512 ) ( not ( = ?auto_5502 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( not ( = ?auto_5511 ?auto_5509 ) ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( OBJ-AT ?auto_5503 ?auto_5509 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5503 ?auto_5510 ?auto_5509 )
      ( DELIVER-5PKG ?auto_5501 ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5502 )
      ( DELIVER-5PKG-VERIFY ?auto_5501 ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5506 ?auto_5502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5519 - OBJ
      ?auto_5521 - OBJ
      ?auto_5522 - OBJ
      ?auto_5523 - OBJ
      ?auto_5524 - OBJ
      ?auto_5520 - LOCATION
    )
    :vars
    (
      ?auto_5526 - LOCATION
      ?auto_5530 - CITY
      ?auto_5528 - LOCATION
      ?auto_5529 - LOCATION
      ?auto_5525 - LOCATION
      ?auto_5527 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5521 ?auto_5519 ) ( GREATER-THAN ?auto_5522 ?auto_5519 ) ( GREATER-THAN ?auto_5522 ?auto_5521 ) ( GREATER-THAN ?auto_5523 ?auto_5519 ) ( GREATER-THAN ?auto_5523 ?auto_5521 ) ( GREATER-THAN ?auto_5523 ?auto_5522 ) ( GREATER-THAN ?auto_5524 ?auto_5519 ) ( GREATER-THAN ?auto_5524 ?auto_5521 ) ( GREATER-THAN ?auto_5524 ?auto_5522 ) ( GREATER-THAN ?auto_5524 ?auto_5523 ) ( IN-CITY ?auto_5526 ?auto_5530 ) ( IN-CITY ?auto_5520 ?auto_5530 ) ( not ( = ?auto_5520 ?auto_5526 ) ) ( OBJ-AT ?auto_5524 ?auto_5526 ) ( OBJ-AT ?auto_5519 ?auto_5520 ) ( not ( = ?auto_5519 ?auto_5521 ) ) ( not ( = ?auto_5519 ?auto_5522 ) ) ( not ( = ?auto_5519 ?auto_5523 ) ) ( not ( = ?auto_5519 ?auto_5524 ) ) ( not ( = ?auto_5521 ?auto_5522 ) ) ( not ( = ?auto_5521 ?auto_5523 ) ) ( not ( = ?auto_5521 ?auto_5524 ) ) ( not ( = ?auto_5522 ?auto_5523 ) ) ( not ( = ?auto_5522 ?auto_5524 ) ) ( not ( = ?auto_5523 ?auto_5524 ) ) ( IN-CITY ?auto_5528 ?auto_5530 ) ( not ( = ?auto_5520 ?auto_5528 ) ) ( not ( = ?auto_5526 ?auto_5528 ) ) ( OBJ-AT ?auto_5523 ?auto_5528 ) ( IN-CITY ?auto_5529 ?auto_5530 ) ( not ( = ?auto_5520 ?auto_5529 ) ) ( not ( = ?auto_5526 ?auto_5529 ) ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( OBJ-AT ?auto_5522 ?auto_5529 ) ( IN-CITY ?auto_5525 ?auto_5530 ) ( not ( = ?auto_5520 ?auto_5525 ) ) ( not ( = ?auto_5526 ?auto_5525 ) ) ( not ( = ?auto_5528 ?auto_5525 ) ) ( not ( = ?auto_5529 ?auto_5525 ) ) ( OBJ-AT ?auto_5521 ?auto_5525 ) ( TRUCK-AT ?auto_5527 ?auto_5520 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5527 ?auto_5520 ?auto_5525 ?auto_5530 )
      ( DELIVER-5PKG ?auto_5519 ?auto_5521 ?auto_5522 ?auto_5523 ?auto_5524 ?auto_5520 )
      ( DELIVER-5PKG-VERIFY ?auto_5519 ?auto_5521 ?auto_5522 ?auto_5523 ?auto_5524 ?auto_5520 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5537 - OBJ
      ?auto_5539 - OBJ
      ?auto_5540 - OBJ
      ?auto_5541 - OBJ
      ?auto_5542 - OBJ
      ?auto_5538 - LOCATION
    )
    :vars
    (
      ?auto_5548 - LOCATION
      ?auto_5546 - CITY
      ?auto_5547 - LOCATION
      ?auto_5543 - LOCATION
      ?auto_5545 - LOCATION
      ?auto_5544 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5539 ?auto_5537 ) ( GREATER-THAN ?auto_5540 ?auto_5537 ) ( GREATER-THAN ?auto_5540 ?auto_5539 ) ( GREATER-THAN ?auto_5541 ?auto_5537 ) ( GREATER-THAN ?auto_5541 ?auto_5539 ) ( GREATER-THAN ?auto_5541 ?auto_5540 ) ( GREATER-THAN ?auto_5542 ?auto_5537 ) ( GREATER-THAN ?auto_5542 ?auto_5539 ) ( GREATER-THAN ?auto_5542 ?auto_5540 ) ( GREATER-THAN ?auto_5542 ?auto_5541 ) ( IN-CITY ?auto_5548 ?auto_5546 ) ( IN-CITY ?auto_5538 ?auto_5546 ) ( not ( = ?auto_5538 ?auto_5548 ) ) ( OBJ-AT ?auto_5542 ?auto_5548 ) ( not ( = ?auto_5537 ?auto_5539 ) ) ( not ( = ?auto_5537 ?auto_5540 ) ) ( not ( = ?auto_5537 ?auto_5541 ) ) ( not ( = ?auto_5537 ?auto_5542 ) ) ( not ( = ?auto_5539 ?auto_5540 ) ) ( not ( = ?auto_5539 ?auto_5541 ) ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( not ( = ?auto_5540 ?auto_5541 ) ) ( not ( = ?auto_5540 ?auto_5542 ) ) ( not ( = ?auto_5541 ?auto_5542 ) ) ( IN-CITY ?auto_5547 ?auto_5546 ) ( not ( = ?auto_5538 ?auto_5547 ) ) ( not ( = ?auto_5548 ?auto_5547 ) ) ( OBJ-AT ?auto_5541 ?auto_5547 ) ( IN-CITY ?auto_5543 ?auto_5546 ) ( not ( = ?auto_5538 ?auto_5543 ) ) ( not ( = ?auto_5548 ?auto_5543 ) ) ( not ( = ?auto_5547 ?auto_5543 ) ) ( OBJ-AT ?auto_5540 ?auto_5543 ) ( IN-CITY ?auto_5545 ?auto_5546 ) ( not ( = ?auto_5538 ?auto_5545 ) ) ( not ( = ?auto_5548 ?auto_5545 ) ) ( not ( = ?auto_5547 ?auto_5545 ) ) ( not ( = ?auto_5543 ?auto_5545 ) ) ( OBJ-AT ?auto_5539 ?auto_5545 ) ( TRUCK-AT ?auto_5544 ?auto_5538 ) ( IN-TRUCK ?auto_5537 ?auto_5544 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5537 ?auto_5538 )
      ( DELIVER-5PKG ?auto_5537 ?auto_5539 ?auto_5540 ?auto_5541 ?auto_5542 ?auto_5538 )
      ( DELIVER-5PKG-VERIFY ?auto_5537 ?auto_5539 ?auto_5540 ?auto_5541 ?auto_5542 ?auto_5538 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5555 - OBJ
      ?auto_5557 - OBJ
      ?auto_5558 - OBJ
      ?auto_5559 - OBJ
      ?auto_5560 - OBJ
      ?auto_5556 - LOCATION
    )
    :vars
    (
      ?auto_5563 - LOCATION
      ?auto_5562 - CITY
      ?auto_5565 - LOCATION
      ?auto_5564 - LOCATION
      ?auto_5561 - LOCATION
      ?auto_5566 - TRUCK
      ?auto_5567 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5557 ?auto_5555 ) ( GREATER-THAN ?auto_5558 ?auto_5555 ) ( GREATER-THAN ?auto_5558 ?auto_5557 ) ( GREATER-THAN ?auto_5559 ?auto_5555 ) ( GREATER-THAN ?auto_5559 ?auto_5557 ) ( GREATER-THAN ?auto_5559 ?auto_5558 ) ( GREATER-THAN ?auto_5560 ?auto_5555 ) ( GREATER-THAN ?auto_5560 ?auto_5557 ) ( GREATER-THAN ?auto_5560 ?auto_5558 ) ( GREATER-THAN ?auto_5560 ?auto_5559 ) ( IN-CITY ?auto_5563 ?auto_5562 ) ( IN-CITY ?auto_5556 ?auto_5562 ) ( not ( = ?auto_5556 ?auto_5563 ) ) ( OBJ-AT ?auto_5560 ?auto_5563 ) ( not ( = ?auto_5555 ?auto_5557 ) ) ( not ( = ?auto_5555 ?auto_5558 ) ) ( not ( = ?auto_5555 ?auto_5559 ) ) ( not ( = ?auto_5555 ?auto_5560 ) ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5559 ) ) ( not ( = ?auto_5557 ?auto_5560 ) ) ( not ( = ?auto_5558 ?auto_5559 ) ) ( not ( = ?auto_5558 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( IN-CITY ?auto_5565 ?auto_5562 ) ( not ( = ?auto_5556 ?auto_5565 ) ) ( not ( = ?auto_5563 ?auto_5565 ) ) ( OBJ-AT ?auto_5559 ?auto_5565 ) ( IN-CITY ?auto_5564 ?auto_5562 ) ( not ( = ?auto_5556 ?auto_5564 ) ) ( not ( = ?auto_5563 ?auto_5564 ) ) ( not ( = ?auto_5565 ?auto_5564 ) ) ( OBJ-AT ?auto_5558 ?auto_5564 ) ( IN-CITY ?auto_5561 ?auto_5562 ) ( not ( = ?auto_5556 ?auto_5561 ) ) ( not ( = ?auto_5563 ?auto_5561 ) ) ( not ( = ?auto_5565 ?auto_5561 ) ) ( not ( = ?auto_5564 ?auto_5561 ) ) ( OBJ-AT ?auto_5557 ?auto_5561 ) ( IN-TRUCK ?auto_5555 ?auto_5566 ) ( TRUCK-AT ?auto_5566 ?auto_5567 ) ( IN-CITY ?auto_5567 ?auto_5562 ) ( not ( = ?auto_5556 ?auto_5567 ) ) ( not ( = ?auto_5563 ?auto_5567 ) ) ( not ( = ?auto_5565 ?auto_5567 ) ) ( not ( = ?auto_5564 ?auto_5567 ) ) ( not ( = ?auto_5561 ?auto_5567 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5566 ?auto_5567 ?auto_5556 ?auto_5562 )
      ( DELIVER-5PKG ?auto_5555 ?auto_5557 ?auto_5558 ?auto_5559 ?auto_5560 ?auto_5556 )
      ( DELIVER-5PKG-VERIFY ?auto_5555 ?auto_5557 ?auto_5558 ?auto_5559 ?auto_5560 ?auto_5556 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5574 - OBJ
      ?auto_5576 - OBJ
      ?auto_5577 - OBJ
      ?auto_5578 - OBJ
      ?auto_5579 - OBJ
      ?auto_5575 - LOCATION
    )
    :vars
    (
      ?auto_5580 - LOCATION
      ?auto_5585 - CITY
      ?auto_5586 - LOCATION
      ?auto_5583 - LOCATION
      ?auto_5584 - LOCATION
      ?auto_5582 - TRUCK
      ?auto_5581 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5576 ?auto_5574 ) ( GREATER-THAN ?auto_5577 ?auto_5574 ) ( GREATER-THAN ?auto_5577 ?auto_5576 ) ( GREATER-THAN ?auto_5578 ?auto_5574 ) ( GREATER-THAN ?auto_5578 ?auto_5576 ) ( GREATER-THAN ?auto_5578 ?auto_5577 ) ( GREATER-THAN ?auto_5579 ?auto_5574 ) ( GREATER-THAN ?auto_5579 ?auto_5576 ) ( GREATER-THAN ?auto_5579 ?auto_5577 ) ( GREATER-THAN ?auto_5579 ?auto_5578 ) ( IN-CITY ?auto_5580 ?auto_5585 ) ( IN-CITY ?auto_5575 ?auto_5585 ) ( not ( = ?auto_5575 ?auto_5580 ) ) ( OBJ-AT ?auto_5579 ?auto_5580 ) ( not ( = ?auto_5574 ?auto_5576 ) ) ( not ( = ?auto_5574 ?auto_5577 ) ) ( not ( = ?auto_5574 ?auto_5578 ) ) ( not ( = ?auto_5574 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( IN-CITY ?auto_5586 ?auto_5585 ) ( not ( = ?auto_5575 ?auto_5586 ) ) ( not ( = ?auto_5580 ?auto_5586 ) ) ( OBJ-AT ?auto_5578 ?auto_5586 ) ( IN-CITY ?auto_5583 ?auto_5585 ) ( not ( = ?auto_5575 ?auto_5583 ) ) ( not ( = ?auto_5580 ?auto_5583 ) ) ( not ( = ?auto_5586 ?auto_5583 ) ) ( OBJ-AT ?auto_5577 ?auto_5583 ) ( IN-CITY ?auto_5584 ?auto_5585 ) ( not ( = ?auto_5575 ?auto_5584 ) ) ( not ( = ?auto_5580 ?auto_5584 ) ) ( not ( = ?auto_5586 ?auto_5584 ) ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( OBJ-AT ?auto_5576 ?auto_5584 ) ( TRUCK-AT ?auto_5582 ?auto_5581 ) ( IN-CITY ?auto_5581 ?auto_5585 ) ( not ( = ?auto_5575 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5586 ?auto_5581 ) ) ( not ( = ?auto_5583 ?auto_5581 ) ) ( not ( = ?auto_5584 ?auto_5581 ) ) ( OBJ-AT ?auto_5574 ?auto_5581 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5574 ?auto_5582 ?auto_5581 )
      ( DELIVER-5PKG ?auto_5574 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5575 )
      ( DELIVER-5PKG-VERIFY ?auto_5574 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5575 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_5593 - OBJ
      ?auto_5595 - OBJ
      ?auto_5596 - OBJ
      ?auto_5597 - OBJ
      ?auto_5598 - OBJ
      ?auto_5594 - LOCATION
    )
    :vars
    (
      ?auto_5602 - LOCATION
      ?auto_5600 - CITY
      ?auto_5604 - LOCATION
      ?auto_5603 - LOCATION
      ?auto_5605 - LOCATION
      ?auto_5599 - LOCATION
      ?auto_5601 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5595 ?auto_5593 ) ( GREATER-THAN ?auto_5596 ?auto_5593 ) ( GREATER-THAN ?auto_5596 ?auto_5595 ) ( GREATER-THAN ?auto_5597 ?auto_5593 ) ( GREATER-THAN ?auto_5597 ?auto_5595 ) ( GREATER-THAN ?auto_5597 ?auto_5596 ) ( GREATER-THAN ?auto_5598 ?auto_5593 ) ( GREATER-THAN ?auto_5598 ?auto_5595 ) ( GREATER-THAN ?auto_5598 ?auto_5596 ) ( GREATER-THAN ?auto_5598 ?auto_5597 ) ( IN-CITY ?auto_5602 ?auto_5600 ) ( IN-CITY ?auto_5594 ?auto_5600 ) ( not ( = ?auto_5594 ?auto_5602 ) ) ( OBJ-AT ?auto_5598 ?auto_5602 ) ( not ( = ?auto_5593 ?auto_5595 ) ) ( not ( = ?auto_5593 ?auto_5596 ) ) ( not ( = ?auto_5593 ?auto_5597 ) ) ( not ( = ?auto_5593 ?auto_5598 ) ) ( not ( = ?auto_5595 ?auto_5596 ) ) ( not ( = ?auto_5595 ?auto_5597 ) ) ( not ( = ?auto_5595 ?auto_5598 ) ) ( not ( = ?auto_5596 ?auto_5597 ) ) ( not ( = ?auto_5596 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5598 ) ) ( IN-CITY ?auto_5604 ?auto_5600 ) ( not ( = ?auto_5594 ?auto_5604 ) ) ( not ( = ?auto_5602 ?auto_5604 ) ) ( OBJ-AT ?auto_5597 ?auto_5604 ) ( IN-CITY ?auto_5603 ?auto_5600 ) ( not ( = ?auto_5594 ?auto_5603 ) ) ( not ( = ?auto_5602 ?auto_5603 ) ) ( not ( = ?auto_5604 ?auto_5603 ) ) ( OBJ-AT ?auto_5596 ?auto_5603 ) ( IN-CITY ?auto_5605 ?auto_5600 ) ( not ( = ?auto_5594 ?auto_5605 ) ) ( not ( = ?auto_5602 ?auto_5605 ) ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5603 ?auto_5605 ) ) ( OBJ-AT ?auto_5595 ?auto_5605 ) ( IN-CITY ?auto_5599 ?auto_5600 ) ( not ( = ?auto_5594 ?auto_5599 ) ) ( not ( = ?auto_5602 ?auto_5599 ) ) ( not ( = ?auto_5604 ?auto_5599 ) ) ( not ( = ?auto_5603 ?auto_5599 ) ) ( not ( = ?auto_5605 ?auto_5599 ) ) ( OBJ-AT ?auto_5593 ?auto_5599 ) ( TRUCK-AT ?auto_5601 ?auto_5594 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5601 ?auto_5594 ?auto_5599 ?auto_5600 )
      ( DELIVER-5PKG ?auto_5593 ?auto_5595 ?auto_5596 ?auto_5597 ?auto_5598 ?auto_5594 )
      ( DELIVER-5PKG-VERIFY ?auto_5593 ?auto_5595 ?auto_5596 ?auto_5597 ?auto_5598 ?auto_5594 ) )
  )

)

